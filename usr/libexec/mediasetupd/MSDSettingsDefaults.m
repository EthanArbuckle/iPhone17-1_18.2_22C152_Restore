@interface MSDSettingsDefaults
+ (id)settingsDefaults;
- (MSDSettingsDefaults)init;
- (NSUserDefaults)userSettingsDefaults;
- (void)setUserSettingsDefaults:(id)a3;
@end

@implementation MSDSettingsDefaults

+ (id)settingsDefaults
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003B00;
  block[3] = &unk_10004C8C0;
  block[4] = a1;
  if (qword_100056748 != -1) {
    dispatch_once(&qword_100056748, block);
  }
  v2 = (void *)qword_100056750;

  return v2;
}

- (MSDSettingsDefaults)init
{
  v7.receiver = self;
  v7.super_class = (Class)MSDSettingsDefaults;
  v2 = [(MSDSettingsDefaults *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)NSUserDefaults);
    v4 = (NSUserDefaults *)[v3 initWithSuiteName:kMediaSetupSettingsDomain];
    userSettingsDefaults = v2->_userSettingsDefaults;
    v2->_userSettingsDefaults = v4;
  }
  return v2;
}

- (NSUserDefaults)userSettingsDefaults
{
  return self->_userSettingsDefaults;
}

- (void)setUserSettingsDefaults:(id)a3
{
}

- (void).cxx_destruct
{
}

@end