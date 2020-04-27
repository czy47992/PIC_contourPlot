% ����Matlab���ȸ���ͼ
% ʹ�ò��裺
% 1. ����PIC��������ݣ�����matlab��ҳѡ��е�"��������"���ܣ�
%    ����������������Ҫ�ػ�����ͼ�ı���������ne_t,f_t(������������������);
% 2. �޸�����ͺ����������M��N���Լ������ٻ��׵ĳ���R_p0;
% 3. ��reshape�����еı�������Ϊ��Ҫ���Ƶı��������ƣ���������ne_t,f_t����;
% 4. ����������ͼ�ĸ�������������subplot�����Ĳ�����������ӻ�ɾ��subplot;
% 5. ������������ͼƬ�Ĵ�С����λΪcm;
% 6. ���д��룬����ͼƬ;

M = 200;    % ����������
N = 120;    % ����������
R_p0 = 10;  % ��������� or �����ٻ��׳��ȣ���������Ϊ��λ��

% ��������
rr = linspace(0,N/R_p0,N+1);
zz = linspace(0,M/R_p0,M+1);
[X,Y] = meshgrid(zz,rr);

% ����������Ϊ������ʽ
var1 = reshape(ne_t,[M+1 N+1]);
var2 = reshape(f_t,[M+1 N+1]);
% ��������Ӹ����ͼ����var ...

subplot(1,2,1);
% ��ͼɫ��ʹ��log scale������logspace(a,b,n)����ָ��contour level
% ��10^a��10^b��һ��n��level
h = contourf(X,Y,var1',logspace(0,-3,18),'LineStyle','none');
ax = gca;
ax.FontSize = 12;                   % �������ֺ�
ax.FontName = 'Times New Roman';    % ����������
ax.ColorScale = 'log';
ax.CLimMode = 'manual';
ax.CLim = [0.01 1]; % �ֶ�����ɫ����ʾ�ķ�Χ
xlabel('$\hat{z}$','Interpreter','latex','FontSize',12);
ylabel('$\hat{r}$','Interpreter','latex','FontSize',12);

title('Norm. Electron Density $\hat{n}_e$','Interpreter','latex');% ����
colorbar; % ��ʾͼ������

subplot(1,2,2);
%��ͼɫ��ʹ��linear scale
h = contourf(X,Y,var2','LineStyle','none');
ax = gca;
ax.FontSize = 12;
ax.FontName = 'Times New Roman';
ax.ColorScale = 'linear';
% ax.CLimMode = 'manual'; %��Ϊmanual���Զ�Ϊauto
% ax.CLim = [0.01 1];

xlabel('$\hat{z}$','Interpreter','latex','FontSize',12);
ylabel('$\hat{r}$','Interpreter','latex','FontSize',12);
title('Norm. Elec. Potential $\hat{\phi}$','Interpreter','latex');
set(gca,'FontSize',12,'FontName','Times New Roman');
colorbar;

% ����ͼƬ��С
set(gcf,'Units','Centimeters','Position',[0 0 17.8 4.8],'PaperUnits','centimeters','PaperSize',[17.8 4.8]);