@interface COSSetupFlowPreferences
+ (unint64_t)position;
+ (void)beganController:(unint64_t)a3;
@end

@implementation COSSetupFlowPreferences

+ (void)beganController:(unint64_t)a3
{
  v4 = +[NSUserDefaults standardUserDefaults];
  v5 = +[NSNumber numberWithUnsignedInteger:a3];
  [v4 setObject:v5 forKey:@"CurrentController"];

  id v6 = +[NSUserDefaults standardUserDefaults];
  [v6 synchronize];
}

+ (unint64_t)position
{
  v2 = +[NSUserDefaults standardUserDefaults];
  v3 = [v2 objectForKey:@"CurrentController"];

  if (v3) {
    id v4 = [v3 integerValue];
  }
  else {
    id v4 = 0;
  }

  return (unint64_t)v4;
}

@end