@interface CRLUserDefaults
+ (NSDictionary)defaultDefaults;
+ (void)registerUserDefaults;
@end

@implementation CRLUserDefaults

+ (NSDictionary)defaultDefaults
{
  if (qword_1016A9AC0 != -1) {
    dispatch_once(&qword_1016A9AC0, &stru_1014F8DD8);
  }
  v2 = (void *)qword_1016A9AB8;

  return (NSDictionary *)v2;
}

+ (void)registerUserDefaults
{
  id v4 = +[NSUserDefaults standardUserDefaults];
  v3 = [a1 defaultDefaults];
  [v4 registerDefaults:v3];
}

@end