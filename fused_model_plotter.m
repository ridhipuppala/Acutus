%%
clear all;
close all;
clc

load('alpha_Cd_Cl.mat');
load('Thrust_PWM.mat');
load('Thrust_RPM.mat');
load('Torque_RPM.mat');
load('RPM_Throttle.mat');

deg_to_rad = pi/180;   
rad_to_deg = 180/pi;


sim('fused_model.slx',[0 70]);

etapos=append(etapos2,etapos3,etapos1);
etadot=append(etadot2,etadot3,etadot1);
extforce=append(extforce2,extforce3,extforce1);
netforce=append(netforce2,netforce3,netforce1);
vel=append(vel2,vel3,vel1);
%veldot=append(veldot2,veldot3,veldot1);
bodyforce=append(bodyforce2,bodyforce3,bodyforce1);
%%
figure('Name','TC Test','NumberTitle','off');
set(gcf,'Position',[0 0 600 400]);
inputdata = etapos.Data(:,1:6);
t=etapos.Time;
set(gca,'zdir','reverse')
plot3(inputdata(:,1),inputdata(:,2),inputdata(:,3),'r','LineWidth',1);
grid on
hold on
set(gca,'FontName', 'Times New Roman');
set(gca,'FontWeight', 'bold');

xlabel('\fontsize{13} X(m)');
ylabel('\fontsize{13} Y(m)');
zlabel('\fontsize{13} Z(m)');

%%

figure('Name','Eta','NumberTitle','off');
inputdata = etapos.Data(:,1:6);
t=etapos.Time;

subplot(3,2,1),plot(t,inputdata(:,1));
grid on
title('\fontsize{10} Xpos');

xlabel('Time(s)');
ylabel('Xpos(m)');

subplot(3,2,3),plot(t,inputdata(:,2));
grid on
title('\fontsize{10} Ypos');
xlabel('Time(s)');
ylabel('Ypos(m)');

subplot(3,2,5),plot(t,inputdata(:,3));
grid on
title('\fontsize{10} Zpos');
xlabel('Time(s)');
ylabel('Zpos(m)');

subplot(3,2,2),plot(t,rad_to_deg*inputdata(:,4));
grid on
title('\fontsize{10} Rollangle');
xlabel('Time(s)');
ylabel('Rollangle(deg)');

subplot(3,2,4),plot(t,rad_to_deg*inputdata(:,5));
grid on
title('\fontsize{10} Pitchangle');
xlabel('Time(s)');
ylabel('Pitchangle(deg)');

subplot(3,2,6),plot(t,rad_to_deg*inputdata(:,6));
grid on
title('\fontsize{10} Yawangle');
xlabel('Time(s)');
ylabel('Yawangle(deg)');




figure('Name','EtaDot','NumberTitle','off');
inputdata = etadot.Data(:,1:6);
t=etadot.Time;

subplot(3,2,1),plot(t,inputdata(:,1));
grid on
title('\fontsize{10} Xdot');
xlabel('Time(s)');
ylabel('Xdot(m/s)');

subplot(3,2,3),plot(t,inputdata(:,2));
grid on
title('\fontsize{10} Ydot');
xlabel('Time(s)');hold off
ylabel('Ydot(m/s)');

subplot(3,2,5),plot(t,inputdata(:,3));
grid on
title('\fontsize{10} Zdot');
xlabel('Time(s)');
ylabel('Zdot(m/s)');

subplot(3,2,2),plot(t,rad_to_deg*inputdata(:,4));
grid on
title('\fontsize{10} Rolldot');
xlabel('Time(s)');
ylabel('Rolldot(deg/s)');

subplot(3,2,4),plot(t,rad_to_deg*inputdata(:,5));
grid on
title('\fontsize{10} Pitchdot');
xlabel('Time(s)');
ylabel('Pitchdot(deg/s)');

subplot(3,2,6),plot(t,rad_to_deg*inputdata(:,6));
grid on
title('\fontsize{10} Yawdot');
xlabel('Time(s)');
ylabel('Yawdot(deg/s)');



figure('Name','BodyVel','NumberTitle','off');
inputdata = vel.Data(:,1:6);
t=vel.Time;

subplot(3,2,1),plot(t,inputdata(:,1));
grid on
title('\fontsize{10} u');
xlabel('Time(s)');
ylabel('u(m/s)');

subplot(3,2,3),plot(t,inputdata(:,2));
grid on
title('\fontsize{10} v');
xlabel('Time(s)');
ylabel('v(m/s)');

subplot(3,2,5),plot(t,inputdata(:,3));
grid on
title('\fontsize{10} w');
xlabel('Time(s)');
ylabel('w(m/s)');

subplot(3,2,2),plot(t,rad_to_deg*inputdata(:,4));
grid on
title('\fontsize{10} p');
xlabel('Time(s)');
ylabel('p(deg/s)');

subplot(3,2,4),plot(t,rad_to_deg*inputdata(:,5));
grid on
title('\fontsize{10} q');
xlabel('Time(s)');
ylabel('q(deg/s)');

subplot(3,2,6),plot(t,rad_to_deg*inputdata(:,6));
grid on
title('\fontsize{10} r');
xlabel('Time(s)');
ylabel('r(deg/s)');

%%


figure('Name','HullForce','NumberTitle','off');
inputdata = bodyforce.Data(:,1:6);
t=bodyforce.Time;

subplot(3,2,1),plot(t,inputdata(:,1));
grid on
title('\fontsize{10} Hull Fx');
xlabel('Time(s)');
ylabel('Fx(N)');

subplot(3,2,3),plot(t,inputdata(:,2));
grid on
title('\fontsize{10} Hull Fy');
xlabel('Time(s)');
ylabel('Fy(N)');

subplot(3,2,5),plot(t,inputdata(:,3));
grid on
title('\fontsize{10} Hull Fz');
xlabel('Time(s)');
ylabel('Fz(N)');

subplot(3,2,2),plot(t,inputdata(:,4));
grid on
title('\fontsize{10} Hull Roll Moment');
xlabel('Time(s)');
ylabel('Mx(Nm)');

subplot(3,2,4),plot(t,inputdata(:,5));
grid on
title('\fontsize{10} Hull Pitch Moment');
xlabel('Time(s)');
ylabel('My(Nm)');

subplot(3,2,6),plot(t,inputdata(:,6));
grid on
title('\fontsize{10} Hull Yaw Moment');
xlabel('Time(s)');
ylabel('Mz(Nm)');



figure('Name','External Force(CP & Thruster)','NumberTitle','off');
inputdata = extforce.Data(:,1:6);
t=extforce.Time;

subplot(3,2,1),plot(t,inputdata(:,1));
grid on
title('\fontsize{10} Ext Fx');
xlabel('Time(s)');
ylabel('Fx(N)');

subplot(3,2,3),plot(t,inputdata(:,2));
grid on
title('\fontsize{10} Ext Fy');
xlabel('Time(s)');
ylabel('Fy(N)');

subplot(3,2,5),plot(t,inputdata(:,3));
grid on
title('\fontsize{10} Ext Fz');
xlabel('Time(s)');
ylabel('Fz(N)');

subplot(3,2,2),plot(t,inputdata(:,4));
grid on
title('\fontsize{10} Ext Roll Moment');
xlabel('Time(s)');
ylabel('Mx(Nm)');

subplot(3,2,4),plot(t,inputdata(:,5));
grid on
title('\fontsize{10} Ext Pitch Moment');
xlabel('Time(s)');
ylabel('My(Nm)')

subplot(3,2,6),plot(t,inputdata(:,6));
grid on
title('\fontsize{10} Ext Yaw Moment');
xlabel('Time(s)');
ylabel('Mz(Nm)');


%

figure('Name','Net Force','NumberTitle','off');
inputdata = netforce.Data(:,1:6);
t=netforce.Time;

subplot(3,2,1),plot(t,inputdata(:,1));
grid on
title('\fontsize{10} Net Fx');
xlabel('Time(s)');
ylabel('Fx(N)');

subplot(3,2,3),plot(t,inputdata(:,2));
grid on
title('\fontsize{10} Net Fy');
xlabel('Time(s)');
ylabel('Fy(N)');

subplot(3,2,5),plot(t,inputdata(:,3));
grid on
title('\fontsize{10} Net Fz');
xlabel('Time(s)');
ylabel('Fz(N)');

subplot(3,2,2),plot(t,inputdata(:,4));
grid on
title('\fontsize{10} Net Roll Moment');
xlabel('Time(s)');
ylabel('Mx(Nm)');

subplot(3,2,4),plot(t,inputdata(:,5));
grid on
title('\fontsize{10} Net Pitch Moment');
xlabel('Time(s)');
ylabel('My(Nm)');

subplot(3,2,6),plot(t,inputdata(:,6));
grid on
title('\fontsize{10} Net Yaw Moment');
xlabel('Time(s)');
ylabel('Mz(Nm)');


