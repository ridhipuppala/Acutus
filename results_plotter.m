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
lf = append(lf2,lf3,lf1);
voltage_th = append(voltage_th2,voltage_th3,voltage_th1);
ref_z = append(ref_z2,ref_z3,ref_z1);
ref_pitch = append(ref_pitch2,ref_pitch3,ref_pitch1);
%%
fig = figure('Name','Complete Manuever','NumberTitle','off');
set(gcf,'Position',[0 0 600 200]);
left_color = [1 0 0];
right_color = [0 0 1];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
yyaxis right
plot(lf.Time,lf.Data,'LineWidth',1);
ylim([-60 60]);
xlabel('\fontsize{13} Time(s)');
ylabel(' \fontsize{13}  Flap Input(deg)');
grid on
hold on
yyaxis left
plot(voltage_th.Time,voltage_th.Data,'LineWidth',1);
ylim([0 20]);
xlabel('\fontsize{13} Time(s)');
ylabel(' \fontsize{13}  Thruster Voltage(V)');
set(gca,'FontName', 'Times New Roman');
set(gca,'FontWeight', 'bold');

%%
figure('Name','Complete Manuever','NumberTitle','off');
set(gcf,'Position',[0 0 600 200]);
plot(etapos.Data(:,1),etapos.Data(:,3),'r','LineWidth',1);
set(gca,'Ydir','reverse');
xlim([0 132]);
xlabel('\fontsize{13} x(m)');
ylabel(' \fontsize{13} y(m)');
grid on
%%

fig = figure('Name','Complete Manuever','NumberTitle','off');
set(gcf,'Position',[0 0 600 200]);
yyaxis right
plot(etapos.Time,(180/pi)*etapos.Data(:,5),'r','LineWidth',1);
xlabel('\fontsize{13} Time(s)');
ylabel(' \fontsize{13}  Pitch(deg)');

yyaxis left
plot(etapos.Time,etapos.Data(:,1),'g','LineWidth',1);
hold on
grid on
plot(etapos.Time,etapos.Data(:,3),'b','LineWidth',1);
ylabel(' \fontsize{13}  x(m) & z(m)');
set(gca,'FontName', 'Times New Roman');
lgd = legend('x','z','\theta','Location','southeast','Orientation','horizontal');
set(lgd,'FontName','Times New Roman');
set(lgd,'FontSize',12);

%%

fig = figure('Name','Complete Manuever','NumberTitle','off');
set(gcf,'Position',[0 0 600 200]);

yyaxis right
plot(etapos.Time,(180/pi)*ref_pitch.Data,'--','LineWidth',1);
grid on
hold on
plot(etapos.Time,(180/pi)*etapos.Data(:,5),'-','LineWidth',1);
xlabel('\fontsize{13} Time(s)');
ylabel(' \fontsize{13}  Pitch(deg)');

% yyaxis left
plot(ref_z.Time,ref_z.Data,'--','LineWidth',1);
hold on
grid on
plot(etapos.Time,etapos.Data(:,3),'-','LineWidth',1);
set(gca,'Ydir','reverse');
xlabel('\fontsize{13} Time(s)');
ylabel(' \fontsize{13}  Altitude(m)');
set(gca,'FontName', 'Times New Roman');
% set(gca,'FontWeight', 'bold');
%lgd = legend('\theta_{ref}','\theta','z_{ref}','z','Location','southeast','Orientation','horizontal');
lgd = legend('z_{ref}','z','Location','southeast','Orientation','horizontal');
set(lgd,'FontName','Times New Roman');
% set(lgd,'FontWeight','bold');
set(lgd,'FontSize',12);
