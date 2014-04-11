function lorenztest()
    clear all; clc; clf; 
    hold on;
    zextreme=[0];
    
    [t,y] = ode45(@lorenzfun,[0 250], [1.0 1.0 1.0]);
    zmean=mean(y(:,3)); 
    zstd=std2(y(:,3));
    for a=1:length(y(:,3))
        if abs(y(a,3))-zmean > zstd
            zextnm1=zextreme(length(zextreme))
            zextreme=[zextreme, y(a,3)];
            plot(zextnm1,y(a,3),'*')
        end
    end 
    
    %plot3(y(:,1),y(:,2),y(:,3))
end

function dy = lorenzfun(t,y)
    dy = zeros(3,1);
    P = 10;
    r = 28;
    b = 8/3;
    dy(1) = P*(y(2) - y(1));
    dy(2) = -y(1)*y(3) + r*y(1) - y(2);
    dy(3) = y(1)*y(2) - b*y(3);

    %% call from command line with: [t,y] = ode45('lorenztest',[0 250], [1.0 1.0 1.0]);
    % plot with: plot3(y(:,1),y(:,2),y(:,3))
end
