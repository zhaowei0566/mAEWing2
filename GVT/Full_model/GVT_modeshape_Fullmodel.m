
% Plots
% @article{zhao2019component,
%   title={Component data assisted finite element model updating of composite flying-wing aircraft using multi-level optimization},
%   author={Zhao, Wei and Gupta, Abhineet and Regan, Christopher D and Miglani, Jitish and Kapania, Rakesh K and Seiler, Peter J},
%   journal={Aerospace science and technology},
%   volume={95},
%   pages={105486},
%   year={2019},
%   publisher={Elsevier}
% }


clear all;close all

load([pwd filesep 'Modes_GVT_huggin_v3.mat'])


modeshape_GVT = ModeShapes;


modenum = 2; % Select the mode identified in GVT


modeshape_f =  figure(modenum);axes1 = axes('Parent',modeshape_f);
hold(axes1,'on');
% 
set(axes1,'FontSize',20);
axis([-84 84 10 60 ])



m2inch = 39.3701;


accelpos_GVT_3D = full_gvt_accelerpos*m2inch; % locations of accels on 3D wing used during GVT


accelpos_GVT_3D(:,3) = 0;
plot3(accelpos_GVT_3D(:,1),accelpos_GVT_3D(:,2),accelpos_GVT_3D(:,3),'MarkerFaceColor',[1 0 0],'MarkerEdgeColor',[1 0 0],...
    'Marker','o',...
    'LineStyle','none',...
    'Color',[1 1 0]);hold on;



scalefactor = 15/max(abs(ModeShapes(:,modenum))*m2inch);% scale factor for mode shape magnitude

accelpos_GVT_3D(:,3) =  ModeShapes(:,modenum)*m2inch*scalefactor;


figid = modenum;

figure(modenum);hold on;

plot3(accelpos_GVT_3D(:,1),accelpos_GVT_3D(:,2),accelpos_GVT_3D(:,3),'MarkerFaceColor',[0 0 1],'MarkerEdgeColor',[0 0 1],...
    'Marker','o',...
    'LineStyle','none',...
    'Color',[1 0 0]);hold on;


%% for plot



accelpos_GVT_3D_label(:,2:4)  = accelpos_GVT_3D  ;
accelpos_GVT_3D_label(:,1 ) = 1:size(accelpos_GVT_3D_label,1);


elem = [1 2 4 3;
       3 4 6 5;
       5 6 8 7;
       7 8 10 9;
       9 10 12 11;
       1 2 30 29;
       29 30 26 25;
       25 26 28 27;
       27 28 14 13;
       13 14 16 15;
       15 16 18 17;
       17 18 20 19;
       19 20 22 21;
       21 22 24 23];

patch_plot(elem,accelpos_GVT_3D_label,figid,'skin')

% undeformed
accelpos_GVT_3D_label(:,4 ) = 0;
patch_plot(elem,accelpos_GVT_3D_label,figid,'spar');view(3);

%%

% Phi2 = modeshape_GVT(:,4);   Phi1 = modeshape_GVT(:,5);
% mAc=cal_MAC(Phi1,Phi2);


axis image;
xlabel('Span,inch');
ylabel('Chord,inch');
zlabel('Mode shape, inch');

title(['GVT Mode Shape - Mode ' num2str(modenum) ' and f = ' num2str(round(Freqs(modenum),2)) ' Hz']);


xlim(axes1,[-84 84])



set(gcf,'color','w');
set(gcf,'PaperPosition',[0 0 12 6])
set(gcf,'PaperSize',[12 6])
saveas(gcf,['GVT_Full_Mode_' num2str(modenum)],'pdf')
saveas(gcf,['GVT_Full_Mode_' num2str(modenum)],'png')




% %%
% database1 = modeshape_GVT;
% database2 = modeshape_GVT;
% MAC_plot(database1,database2)




