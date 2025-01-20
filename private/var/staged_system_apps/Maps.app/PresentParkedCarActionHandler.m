@interface PresentParkedCarActionHandler
+ (void)performAction:(id)a3 inContext:(id)a4;
@end

@implementation PresentParkedCarActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v5;
    v8 = [v6 chrome];
    v9 = +[ParkedCarManager sharedManager];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1003F6EC8;
    v12[3] = &unk_1012E8FF8;
    id v13 = v6;
    id v14 = v8;
    id v15 = v7;
    id v10 = v7;
    id v11 = v8;
    [v9 fetchParkedCar:v12];
  }
}

@end