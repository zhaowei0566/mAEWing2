
close all;
clear MAC

load([ pwd '\Modes_GVT_huggin_v3.mat']);



pchfname =[ pwd '\sol103_maewing2_fullmodel_gvt_setup_check_updatedgrid_initial_4mac.pch'];



modeshape_GVT = ModeShapes(:,[1 2 5 6 7 8]);


minodeid  = 7710001;
maxnodeid = 7910012;

Modelimit = 20;

ModeShape=readpch_mode(pchfname,minodeid,maxnodeid,Modelimit);



selected_FEA_modes =  [7 8 10 11 13 14  ]-2;
w_FEM = ModeShape.modeshape(:,4,selected_FEA_modes);


for gvt_num = 1:size(modeshape_GVT,2)
    
    
    for fem_num = 1:size(w_FEM,3)
        
        Phi1 = w_FEM(:,:,fem_num); % FEA mode shapes
        
        Phi2 = modeshape_GVT(:,gvt_num); % GVT mode shapes
        mAc=cal_MAC(Phi1,Phi2);
        MAC(gvt_num,fem_num) = mAc;
        
    end
    
end

figure;



b = bar3(MAC);
for k = 1:length(b)
    zdata = b(k).ZData;
    b(k).CData = zdata;
    b(k).FaceColor = 'interp';
end

colormap(cool)

colorbar;


xlabel('FEM mode number')
ylabel('GVT mode number')
zlabel('MAC value')

hold on;
set(gcf,'color','w')
title('MAC for individual wing FEM data and GVT data')

MAC

