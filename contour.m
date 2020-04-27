% 利用Matlab作等高线图
% 使用步骤：
% 1. 导入PIC计算的数据，利用matlab主页选项卡中的"导入数据"功能，
%    按照列向量导入需要回绘制云图的变量，例如ne_t,f_t(下面用这两个举例子);
% 2. 修改纵向和横向的网格数M和N，以及无量纲基底的长度R_p0;
% 3. 将reshape函数中的变量名改为需要绘制的变量的名称，这里仍用ne_t,f_t举例;
% 4. 根据所需子图的个数，合理设置subplot函数的参数，自行添加或删除subplot;
% 5. 设置所导出的图片的大小，单位为cm;
% 6. 运行代码，导出图片;

M = 200;    % 纵向网格数
N = 120;    % 横向网格数
R_p0 = 10;  % 入口网格数 or 无量纲基底长度（以网格数为单位）

% 产生网格
rr = linspace(0,N/R_p0,N+1);
zz = linspace(0,M/R_p0,M+1);
[X,Y] = meshgrid(zz,rr);

% 将列向量变为矩阵形式
var1 = reshape(ne_t,[M+1 N+1]);
var2 = reshape(f_t,[M+1 N+1]);
% 可自行添加更多绘图变量var ...

subplot(1,2,1);
% 云图色彩使用log scale，其中logspace(a,b,n)用来指定contour level
% 从10^a到10^b，一共n个level
h = contourf(X,Y,var1',logspace(0,-3,18),'LineStyle','none');
ax = gca;
ax.FontSize = 12;                   % 坐标轴字号
ax.FontName = 'Times New Roman';    % 坐标轴字体
ax.ColorScale = 'log';
ax.CLimMode = 'manual';
ax.CLim = [0.01 1]; % 手动控制色彩显示的范围
xlabel('$\hat{z}$','Interpreter','latex','FontSize',12);
ylabel('$\hat{r}$','Interpreter','latex','FontSize',12);

title('Norm. Electron Density $\hat{n}_e$','Interpreter','latex');% 标题
colorbar; % 显示图例彩条

subplot(1,2,2);
%云图色彩使用linear scale
h = contourf(X,Y,var2','LineStyle','none');
ax = gca;
ax.FontSize = 12;
ax.FontName = 'Times New Roman';
ax.ColorScale = 'linear';
% ax.CLimMode = 'manual'; %不为manual则自动为auto
% ax.CLim = [0.01 1];

xlabel('$\hat{z}$','Interpreter','latex','FontSize',12);
ylabel('$\hat{r}$','Interpreter','latex','FontSize',12);
title('Norm. Elec. Potential $\hat{\phi}$','Interpreter','latex');
set(gca,'FontSize',12,'FontName','Times New Roman');
colorbar;

% 设置图片大小
set(gcf,'Units','Centimeters','Position',[0 0 17.8 4.8],'PaperUnits','centimeters','PaperSize',[17.8 4.8]);