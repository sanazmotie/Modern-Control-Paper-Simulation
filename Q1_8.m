
m=8;
i_xx=5.5;
i_yy=10.33;
i_zz=10.21;
w=10;
Q=30;
v=15;
A=[0 1 0 0 0 0 0 0 0 0;
   0 0 0 0 0 0 0 0 0 -w;
   0 0 1 0 0 0 0 0 0 0;
   0 0 0 0 1 0 0 w 0 0;
   0 0 0 Q 0 0 0 0 0 0;
   0 0 0 0 0 0 0 -v 0 0;
   0 0 0 0 0 0 0 1 0 0;
   0 0 0 0 0 0 0 0 0 (i_yy-i_zz)/i_xx;
   0 0 0 0 0 0 0 0 0 0;
   0 0 0 0 0 0 0 (i_zz-i_xx)/i_yy 0 0;]
B=[0 0 0 0 0;
   1/m 0 0 0 0;
   0 0 0 0 0;
   0 1/m 0 0 0;
   0 0 0 0 0;
   0 0 0 1/m 0;
   0 0 0 0 0;
   0 0 0 1/i_xx 0;
   0 0 0 0 0;
   0 0 0 0 1/i_yy;];
C=[1 0 0 0 0 0 0 0 0 0;
   0 0 1 0 0 0 0 0 0 0;
   0 0 0 0 1 0 0 0 0 0;
   0 0 0 0 0 0 1 0 0 0;
   0 0 0 0 0 0 0 0 1 0;];
D=zeros(5,5)

%% Q4
%Controllability Matrix
phic=ctrb(A,B);
nc=rank(phic)

%Observability Matrix
phio=obsv(A,C);
no=rank(phio)

[Abar,Bbar,Cbar,T,P]=obsvf(A,B,C);

[Abar,Bbar,Cbar,T,P]=ctrbf(A,B,C);

%% Q5
sys=ss(A,B,C,D);
minsys=minreal(sys)
[A,B,C,D] = ssdata(minsys)
%% Q6
sys=ss(A,B,C,D);
open_loop_pole=pole(sys)
A=Abar(3:10,3:10)
B=Bbar(3:10,:);
C=Cbar(:,3:10);

p = [-5 -10 -9 -50 -15 -20 -25 -30 ];
K=place(A,B,p)
A_fb = A - B*K;

sys=ss(A_fb,B,C,D)
close_loop_pole=pole(sys)

step(sys(1,1))
title('output1 input1')
figure;
step(sys(4,1))
title('output4 input1')

x1 = zeros(8,1);
x2 = zeros(8,1);
x3 = zeros(8,1);
x4 = zeros(8,1);
x5 = zeros(8,1);
t = 0:0.01:5;

for i=2:size(t,2) 
  x1(:,i) = x1(:,i-1) + 0.01*(A_fb)*x1(:,i-1) + B(:,1);
  x2(:,i) = x2(:,i-1) + 0.01*(A_fb)*x2(:,i-1) + B(:,2);
  x3(:,i) = x3(:,i-1) + 0.01*(A_fb)*x3(:,i-1) + B(:,3);
  x4(:,i) = x4(:,i-1) + 0.01*(A_fb)*x4(:,i-1) + B(:,4);
  x5(:,i) = x5(:,i-1) + 0.01*(A_fb)*x5(:,i-1) + B(:,5);
end 

figure();
subplot(4,1,1);
plot(t,x2(1,:));
title("X1 input2");
subplot(4,1,2);
plot(t,x2(2,:),"r");
title("X2 input2");
subplot(4,1,3);
plot(t,x2(3,:),"g");
title("X3 input2");
subplot(4,1,4);
plot(t,x2(4,:),"y");
title("X4 input2");

%% Q7 static tracker
P = pinv(C*inv(-A_fb)*B)
%تابع تبدیل صفر در مبدا دارد و وارون پذیر نیست ادامه کد زمانی درست است که
%ماتریس P مقدار به جز INF داشته باشد

% B_st = B*P;
% sys = ss(A_fb,B_st,C,D);
% 
% x1_st = zeros(8,1);
% x2_st = zeros(8,1);
% x3_st = zeros(8,1);
% x4_st = zeros(8,1);
% x5_st = zeros(8,1);
% t = 0:0.01:5;
% 
% for i=2:size(t,2) 
%   x1_st(1:8,i) = x1_st(:,i-1) + 0.01*((A_fb)*x1_st(:,i-1) + B_st(:,1));
%   x2_st(1:8,i) = x2_st(:,i-1) + 0.01*((A_fb)*x2_st(:,i-1) + B_st(:,2));
%   x3_st(1:8,i) = x3_st(:,i-1) + 0.01*((A_fb)*x3_st(:,i-1) + B_st(:,3));
%   x4_st(1:8,i) = x4_st(:,i-1) + 0.01*((A_fb)*x4_st(:,i-1) + B_st(:,4));
%   x5_st(1:8,i) = x5_st(:,i-1) + 0.01*((A_fb)*x5_st(:,i-1) + B_st(:,5));
% end 
% 
% figure;
% step(sys(1,1))
% title('output1 input1')
% figure;
% step(sys(4,1))
% title('output4 input1')
% 
% figure();
% subplot(4,1,1);
% plot(t,x2_st(1,:),'r');
% title("X1 input2");
% 
% subplot(4,1,2);
% plot(t,x2_st(2,:),"r");
% title("X2 input2");
% 
% subplot(4,1,3);
% plot(t,x2_st(3,:),"g");
% title("X3 input2");
% 
% subplot(4,1,4);
% plot(t,x2_st(4,:),"y");
% title("X4 input2");
% 
% figure();
% subplot(4,1,1);
% plot(t,x1_st(1,:));
% title("X1 input1");
% 
% subplot(4,1,2);
% plot(t,x1_st(2,:),"r");
% title("X2 input1");
% 
% subplot(4,1,3);
% plot(t,x1_st(3,:),"g");
% title("X3 input1");
% 
% subplot(4,1,4);
% plot(t,x1_st(4,:),"y");
% title("X4 input1");
%% Q8
n=size(A,1); %number of state
m=size(C,1); %number of output

if (rank(ctrb(A,B))==n)
    display('System is Controlable')
end
if (rank([B A;zeros(5,5) C])==n+m)
    display('System is intergrally Controlable')
else
    display('System is not intergrally Controlable')
end
