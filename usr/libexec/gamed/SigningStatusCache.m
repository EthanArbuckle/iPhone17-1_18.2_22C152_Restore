@interface SigningStatusCache
+ (id)getValue:(id)a3;
+ (id)sharedInstance;
+ (void)reset;
@end

@implementation SigningStatusCache

+ (id)sharedInstance
{
  if (qword_100329938 != -1) {
    dispatch_once(&qword_100329938, &stru_1002DC1A0);
  }
  v2 = (void *)qword_100329930;

  return v2;
}

+ (id)getValue:(id)a3
{
  id v3 = a3;
  v4 = +[SigningStatusCache sharedInstance];
  v5 = [v4 getValueForKey:v3];

  return v5;
}

+ (void)reset
{
  id v2 = +[SigningStatusCache sharedInstance];
  [v2 clear];
}

@end