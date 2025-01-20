@interface Plugin
+ (void)awakeFromBundle;
@end

@implementation Plugin

+ (void)awakeFromBundle
{
  id v2 = +[SUSUISoftwareUpdateController sharedInstance];
  v3 = +[SUSUIControllerServer sharedInstance];
  [(SUSUIControllerServer *)v3 run];

  v4 = +[SUSUICommandLineTestServer sharedInstance];
  [(SUSUICommandLineTestServer *)v4 run];
}

@end