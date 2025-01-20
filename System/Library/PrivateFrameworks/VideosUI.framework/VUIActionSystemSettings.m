@interface VUIActionSystemSettings
+ (BOOL)_openAccountSettings:(int64_t)a3;
+ (int64_t)_subsectionFromString:(id)a3;
- (BOOL)isAccountRequired;
- (NSString)settingsAppDeeplink;
- (VUIActionSystemSettings)initWithContextData:(id)a3;
- (int64_t)subsectionDestination;
- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4;
- (void)setSettingsAppDeeplink:(id)a3;
- (void)setSubsectionDestination:(int64_t)a3;
@end

@implementation VUIActionSystemSettings

- (VUIActionSystemSettings)initWithContextData:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VUIActionSystemSettings;
  v5 = [(VUIActionSystemSettings *)&v11 init];
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      v7 = objc_msgSend(v4, "vui_stringForKey:", @"subsection");
      v6->_subsectionDestination = +[VUIActionSystemSettings _subsectionFromString:v7];
      uint64_t v8 = objc_msgSend(v4, "vui_stringForKey:", @"settingsAppDeeplink");
      settingsAppDeeplink = v6->_settingsAppDeeplink;
      v6->_settingsAppDeeplink = (NSString *)v8;
    }
    else
    {
      v5->_subsectionDestination = 0;
    }
  }

  return v6;
}

- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4
{
  id v7 = a4;
  BOOL v5 = +[VUIActionSystemSettings _openAccountSettings:self->_subsectionDestination];
  v6 = v7;
  if (v7)
  {
    (*((void (**)(id, BOOL))v7 + 2))(v7, v5);
    v6 = v7;
  }
}

- (BOOL)isAccountRequired
{
  return 1;
}

+ (BOOL)_openAccountSettings:(int64_t)a3
{
  id v4 = objc_alloc_init(VUIAccountSettingsViewController);
  [(VUIAccountSettingsViewController *)v4 setInitialSubsection:a3];
  BOOL v5 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v4];
  [v5 setModalTransitionStyle:0];
  [v5 setModalPresentationStyle:2];
  v6 = +[VUIApplicationRouter topPresentedViewController];
  [v6 presentViewController:v5 animated:1 completion:0];

  return 1;
}

+ (int64_t)_subsectionFromString:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    if ([v3 isEqualToString:@"ConnectedApps"])
    {
      int64_t v5 = 1;
    }
    else if ([v4 isEqualToString:@"ManageSubscriptions"])
    {
      int64_t v5 = 2;
    }
    else
    {
      int64_t v5 = 0;
    }
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (int64_t)subsectionDestination
{
  return self->_subsectionDestination;
}

- (void)setSubsectionDestination:(int64_t)a3
{
  self->_subsectionDestination = a3;
}

- (NSString)settingsAppDeeplink
{
  return self->_settingsAppDeeplink;
}

- (void)setSettingsAppDeeplink:(id)a3
{
}

- (void).cxx_destruct
{
}

@end