function Sol = Bayes_mixed_NE(V,params)
p = params.p;
% reshape(V,[2,4])
%======(p)=======||=====(1-p)=====%
%===(y)====(1-y)=====(z)===(1-z)==%
%   Jaa1 | Jab1  ||  Jaa2 | Jab2  %
%   Jba1 | Jbb1  ||  Jba2 | Jbb2  %
%=================================%
Jaa1 = V(1);        
Jba1 = V(2);        
Jab1 = V(3);        
Jbb1 = V(4);        
Jaa2 = V(5);
Jba2 = V(6);
Jab2 = V(7);
Jbb2 = V(8);
 
if (Jaa1 > Jba1 && Jab1 > Jbb1) && (Jaa2 > Jba2 && Jab2 > Jbb2)
    Sol.x = 1;
    Sol.y = 1;
    Sol.z = 1;
elseif (Jaa1 < Jba1 && Jab1 < Jbb1) && (Jaa2 < Jba2 && Jab2 < Jbb2)
    Sol.x = 0;
    Sol.y = 0;
    Sol.z = 0;
elseif (Jaa1 > Jba1 && Jab1 > Jbb1) && (Jaa2 < Jba2 && Jab2 < Jbb2)
    Sol.y = 1;
    Sol.z = 0;
    Sol.x = round((Jbb1*p+Jbb2-Jbb2*p-Jba1*p-Jba2+Jba2*p)/(Jaa1*p-Jba1*p+...
        Jaa2-Jba2-Jaa2*p+Jba2*p-Jab1*p+Jbb1*p-Jab2+Jbb2+Jab2*p-Jbb2*p),2);
elseif (Jaa1 < Jba1 && Jab1 < Jbb1) && (Jaa2 > Jba2 && Jab2 > Jbb2)
    Sol.y = 0;
    Sol.z = 1;
    Sol.x = round((Jbb1*p+Jbb2-Jbb2*p-Jba1*p-Jba2+Jba2*p)/(Jaa1*p-Jba1*p+...
        Jaa2-Jba2-Jaa2*p+Jba2*p-Jab1*p+Jbb1*p-Jab2+Jbb2+Jab2*p-Jbb2*p),2);

elseif (Jaa1 > Jba1 && Jab1 > Jbb1) || (Jaa2 < Jba2 && Jab2 < Jbb2)
    if (Jaa1 > Jba1 && Jab1 > Jbb1)
        Sol.y = 1;
        Sol.z = round((Jbb2-Jab2)/(Jaa2-Jab2-Jba2+Jbb2),2);
    else
        Sol.y = round((Jbb1-Jab1)/(Jaa1-Jab1-Jba1+Jbb1),2);
        Sol.z = 0;
    end
    Sol.x = round((Jbb1*p+Jbb2-Jbb2*p-Jba1*p-Jba2+Jba2*p)/(Jaa1*p-Jba1*p+...
        Jaa2-Jba2-Jaa2*p+Jba2*p-Jab1*p+Jbb1*p-Jab2+Jbb2+Jab2*p-Jbb2*p),2);
elseif (Jaa1 < Jba1 && Jab1 < Jbb1) || (Jaa2 > Jba2 && Jab2 > Jbb2)
    if (Jaa1 < Jba1 && Jab1 < Jbb1)
        Sol.y = 0;
        Sol.z = round((Jbb2-Jab2)/(Jaa2-Jab2-Jba2+Jbb2),2);
    else
        Sol.y = round((Jbb1-Jab1)/(Jaa1-Jab1-Jba1+Jbb1),2);
        Sol.z = 1;
    end
    Sol.x = round((Jbb1*p+Jbb2-Jbb2*p-Jba1*p-Jba2+Jba2*p)/(Jaa1*p-Jba1*p+...
        Jaa2-Jba2-Jaa2*p+Jba2*p-Jab1*p+Jbb1*p-Jab2+Jbb2+Jab2*p-Jbb2*p),2);
else
    Sol.y = round((Jbb1-Jab1)/(Jaa1-Jab1-Jba1+Jbb1),2);
    Sol.z = round((Jbb2-Jab2)/(Jaa2-Jab2-Jba2+Jbb2),2);
    Sol.x = round((Jbb1*p+Jbb2-Jbb2*p-Jba1*p-Jba2+Jba2*p)/(Jaa1*p-Jba1*p+...
        Jaa2-Jba2-Jaa2*p+Jba2*p-Jab1*p+Jbb1*p-Jab2+Jbb2+Jab2*p-Jbb2*p),2);
end