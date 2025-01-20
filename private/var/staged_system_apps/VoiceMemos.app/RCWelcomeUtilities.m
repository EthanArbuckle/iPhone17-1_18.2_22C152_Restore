@interface RCWelcomeUtilities
+ (int64_t)reasonToShow;
+ (void)finishShowingWelcomeScreen;
@end

@implementation RCWelcomeUtilities

+ (int64_t)reasonToShow
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"RCDebugShowWelcome"];

  if (v3) {
    return 3;
  }
  v5 = +[UMUserManager sharedManager];
  unsigned __int8 v6 = [v5 isMultiUser];

  if (v6) {
    return 0;
  }
  v7 = +[NSUserDefaults standardUserDefaults];
  v8 = [v7 stringForKey:@"voicememos.welcome.last_completed"];

  if (v8)
  {
    _LSVersionNumberMakeWithString();
    v9 = +[NSBundle mainBundle];
    v10 = [v9 infoDictionary];
    v11 = [v10 objectForKey:@"CFBundleShortVersionString"];

    _LSVersionNumberMakeWithString();
    if (_LSVersionNumberCompare() == -1 && (RCOverdubRecordingIsEnabled() & 1) != 0)
    {
      int64_t v4 = 2;
    }
    else
    {
      unint64_t MajorComponent = _LSVersionNumberGetMajorComponent();
      int64_t v4 = 2 * (MajorComponent > _LSVersionNumberGetMajorComponent());
    }
  }
  else
  {
    int64_t v4 = 1;
  }

  return v4;
}

+ (void)finishShowingWelcomeScreen
{
  v2 = +[NSBundle mainBundle];
  unsigned __int8 v3 = [v2 infoDictionary];
  id v5 = [v3 objectForKey:@"CFBundleShortVersionString"];

  int64_t v4 = +[NSUserDefaults standardUserDefaults];
  [v4 setObject:v5 forKey:@"voicememos.welcome.last_completed"];
}

@end