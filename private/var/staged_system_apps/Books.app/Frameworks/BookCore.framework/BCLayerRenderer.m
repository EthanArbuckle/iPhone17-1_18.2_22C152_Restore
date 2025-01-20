@interface BCLayerRenderer
+ (id)sharedInstance;
- (BCLayerRenderer)init;
- (BOOL)_isAppExtension;
- (void)_applicationDidEnterBackground:(id)a3;
@end

@implementation BCLayerRenderer

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_920C;
  block[3] = &unk_2C3BB8;
  block[4] = a1;
  if (qword_3454F8 != -1) {
    dispatch_once(&qword_3454F8, block);
  }
  v2 = (void *)qword_3454F0;

  return v2;
}

- (BCLayerRenderer)init
{
  unsigned __int8 v3 = [(BCLayerRenderer *)self _isAppExtension];
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    v5 = +[UIApplication jsa_sharedApplicationIfNotExtension];
    BOOL v4 = [v5 applicationState] == (char *)&def_7D91C + 2;
  }
  v9.receiver = self;
  v9.super_class = (Class)BCLayerRenderer;
  v6 = [(BCLayerRenderer *)&v9 initWithSuspended:v4];
  if ((v3 & 1) == 0)
  {
    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v6 selector:"_applicationDidEnterBackground:" name:UIApplicationDidEnterBackgroundNotification object:0];
    [v7 addObserver:v6 selector:"_applicationWillEnterForeground:" name:UIApplicationWillEnterForegroundNotification object:0];
    [v7 addObserver:v6 selector:"_applicationDidBecomeActive:" name:UIApplicationDidBecomeActiveNotification object:0];
  }
  return v6;
}

- (BOOL)_isAppExtension
{
  v2 = +[NSBundle mainBundle];
  unsigned __int8 v3 = [v2 bundlePath];
  unsigned __int8 v4 = [v3 hasSuffix:@".appex"];

  return v4;
}

- (void)_applicationDidEnterBackground:(id)a3
{
}

@end