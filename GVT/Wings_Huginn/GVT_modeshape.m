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

clear all; close all;
clc
load('LeftWing_GVT.mat')


accelpos_GVT_v2 =[
    
0.2036    0.0619
0.2543   -0.1265
0.5084    0.0619
0.5084   -0.0651
0.8957    0.0619
0.8957   -0.0651
1.2767    0.0619
1.2767   -0.0651
1.6577    0.0619
1.6577   -0.0651
1.9562    0.0619
1.9562   -0.0651];



modenum = 4;

figid = modenum;

figure(figid); hold on;
accelpos_GVT_3D = accelpos_GVT_v2;%*39.3701;

accelpos_GVT_3D(:,3) = 0;
plot3(accelpos_GVT_3D(:,1),accelpos_GVT_3D(:,2),accelpos_GVT_3D(:,3),'MarkerFaceColor',[1 0 0],'MarkerEdgeColor',[1 0 0],...
    'Marker','o',...
    'LineStyle','none',...
    'Color',[1 1 0]);hold on;





scalefactor = .25/max(abs(modeshape_GVT(:,modenum)));

accelpos_GVT_3D(:,3) = -modeshape_GVT(:,modenum)*scalefactor ;



figure(figid);hold on;
plot3(accelpos_GVT_3D(:,1),accelpos_GVT_3D(:,2),accelpos_GVT_3D(:,3),'bo');hold on;


%
%
% interp1([-9.1888  -27.7317],[73.665901 81.158],-9.5)



%% for plote

accelpos_GVT_3D_label(:,2:4)  = accelpos_GVT_3D ;
accelpos_GVT_3D_label(:,1 ) = 1:12;


elem = [1 2 4 3;
    3 4 6 5;
    5 6 8 7;
    7 8 10 9;
    9 10 12 11];


patch_plot(elem,accelpos_GVT_3D_label,figid,'rib')

% undeformed
accelpos_GVT_3D_label(:,4 ) = 0;
patch_plot(elem,accelpos_GVT_3D_label,figid,'skin');view(3);

axis image;



%%
%
% Phi2 = modeshape_GVT(:,3);     Phi1 = modeshape_GVT(:,4);
% mAc=cal_MAC(Phi1,Phi2);





