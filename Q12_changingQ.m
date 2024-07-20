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
   0 0 0 0 0 0 0 (i_zz-i_xx)/i_yy 0 0;];
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
D=zeros(5,5);

[Abar,Bbar,Cbar,T,P]=ctrbf(A,B,C);
A=Abar(3:10,3:10)
B=Bbar(3:10,:);
C=Cbar(:,3:10);


t = linspace(0,20,1000);

R = 1;
Q = eye(8);
[K,~,P] = lqr(A, B, Q, R)
sys = ss(A-B*K, B, C, 0);
[y,~,x] = lsim(sys,ones(1000,5),t);
u=-K(1,:)*x'

figure('Position',[0 0 4000 4000]);
subplot(5,2,1);
plot(t,x(:,1));
title("X1");
hold on
subplot(5,2,2);
plot(t,x(:,2));
title("X2");
hold on
subplot(5,2,3);
plot(t,x(:,3),'r');
title("X3");
hold on
subplot(5,2,4);
plot(t,x(:,4));
title("X4");
hold on
subplot(5,2,5);
plot(t,x(:,5));
title("X5");
hold on
subplot(5,2,6);
plot(t,x(:,6));
title("X6");
hold on
subplot(5,2,7);
plot(t,x(:,7));
title("X7");
hold on
subplot(5,2,8);
plot(t,x(:,8));
title("X8");
hold on
subplot(5,2,9);
plot(t,u)
title("U")
hold on

Q = 10*eye(8);
[K,~,P] = lqr(A, B, Q, R)
sys = ss(A-B*K, B, C, 0);
[y,~,x] = lsim(sys,ones(1000,5),t);
u=-K(1,:)*x'

subplot(5,2,1);
plot(t,x(:,1));
title("X1");
hold on
subplot(5,2,2);
plot(t,x(:,2));
title("X2");
hold on
subplot(5,2,3);
plot(t,x(:,3));
title("X3");
hold on
subplot(4,2,4);
plot(t,x(:,4));
title("X4");
hold on
subplot(5,2,5);
plot(t,x(:,5));
title("X5");
hold on
subplot(5,2,6);
plot(t,x(:,6));
title("X6");
hold on
subplot(5,2,7);
plot(t,x(:,7));
title("X7");
hold on
subplot(5,2,8);
plot(t,x(:,8));
title("X8");
hold on
subplot(5,2,9);
plot(t,u)
title("U")
hold on

Q = 100*eye(8);
[K,~,P] = lqr(A, B, Q, R)
sys = ss(A-B*K, B, C, 0);
[y,~,x] = lsim(sys,ones(1000,5),t);

u=-K(1,:)*x'

subplot(5,2,1);
plot(t,x(:,1));
title("X1");
hold on
subplot(5,2,2);
plot(t,x(:,2));
title("X2");
hold on
subplot(5,2,3);
plot(t,x(:,3),'r');
title("X3");
hold on
subplot(5,2,4);
plot(t,x(:,4));
title("X4");
hold on
subplot(5,2,5);
plot(t,x(:,5));
title("X5");
hold on
subplot(5,2,6);
plot(t,x(:,6));
title("X6");
hold on
subplot(5,2,7);
plot(t,x(:,7));
title("X7");
hold on
subplot(5,2,8);
plot(t,x(:,8));
title("X8");
hold on
subplot(5,2,9);
plot(t,u)
title("U")
hold on

Q = 500*eye(8);
[K,~,P] = lqr(A, B, Q, R)
sys = ss(A-B*K, B, C, 0);
[y,~,x] = lsim(sys,ones(1000,5),t);

u=-K(1,:)*x'

subplot(5,2,1);
plot(t,x(:,1));
title("X1");
hold on
subplot(5,2,2);
plot(t,x(:,2));
title("X2");
hold on
subplot(5,2,3);
plot(t,x(:,3),'r');
title("X3");
hold on
subplot(5,2,4);
plot(t,x(:,4));
title("X4");
hold on
subplot(5,2,5);
plot(t,x(:,5));
title("X5");
hold on
subplot(5,2,6);
plot(t,x(:,6));
title("X6");
hold on
subplot(5,2,7);
plot(t,x(:,7));
title("X7");
hold on
subplot(5,2,8);
plot(t,x(:,8));
title("X8");
hold on
subplot(5,2,9);
plot(t,u)
title("U")
hold on