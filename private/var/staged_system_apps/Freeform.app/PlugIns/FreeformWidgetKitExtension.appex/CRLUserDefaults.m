@interface CRLUserDefaults
+ (NSDictionary)defaultDefaults;
+ (void)registerUserDefaults;
@end

@implementation CRLUserDefaults

+ (NSDictionary)defaultDefaults
{
  if (qword_100028D98[0] != -1) {
    dispatch_once(qword_100028D98, &stru_100024DD8);
  }
  v2 = (void *)qword_100028D90;

  return (NSDictionary *)v2;
}

+ (void)registerUserDefaults
{
  id v4 = +[NSUserDefaults standardUserDefaults];
  v3 = [a1 defaultDefaults];
  [v4 registerDefaults:v3];
}

@end