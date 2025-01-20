@interface PresentFlyoverActionHandler
+ (void)performAction:(id)a3 inContext:(id)a4;
@end

@implementation PresentFlyoverActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100CBF738;
    v7[3] = &unk_101320CE0;
    id v8 = v6;
    [v5 resolveFlyoverWithCompletion:v7];
  }
}

@end