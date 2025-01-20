@interface ExplicitPreferenceManager
+ (id)sharedManager;
- (BOOL)explicitPreferencesDisabled:(char *)a3;
- (BOOL)lastChangeInducingBagExplicitOff:(char *)a3;
- (ExplicitPreferenceManager)init;
- (void)setExplicitPreferencesDisabled:(BOOL)a3;
- (void)setLastChangeInducingBagExplicitOff:(BOOL)a3;
@end

@implementation ExplicitPreferenceManager

- (ExplicitPreferenceManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)ExplicitPreferenceManager;
  v2 = [(ExplicitPreferenceManager *)&v9 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    uint64_t v4 = ISURLBagDidLoadNotification;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10015E9AC;
    v7[3] = &unk_1003A7FB8;
    v8 = v2;
    id v5 = [v3 addObserverForName:v4 object:0 queue:0 usingBlock:v7];
  }
  return v2;
}

- (void)setLastChangeInducingBagExplicitOff:(BOOL)a3
{
  v3 = +[NSNumber numberWithBool:a3];
  CFStringRef v4 = (const __CFString *)kITunesStoreDaemonDefaultsID;

  CFPreferencesSetAppValue(@"ExplicitPreferenceManagerDefaultsKeyExplicitOff", v3, v4);
}

- (BOOL)lastChangeInducingBagExplicitOff:(char *)a3
{
  return CFPreferencesGetAppBooleanValue(@"ExplicitPreferenceManagerDefaultsKeyExplicitOff", kSSUserDefaultsIdentifier, (Boolean *)a3) != 0;
}

- (void)setExplicitPreferencesDisabled:(BOOL)a3
{
  v3 = +[NSNumber numberWithBool:a3];
  CFStringRef v4 = (const __CFString *)kITunesStoreDaemonDefaultsID;

  CFPreferencesSetAppValue(@"ExplicitPreferenceManagerDefaultsKeyExplicitPreferencesDisabled", v3, v4);
}

- (BOOL)explicitPreferencesDisabled:(char *)a3
{
  return CFPreferencesGetAppBooleanValue(@"ExplicitPreferenceManagerDefaultsKeyExplicitPreferencesDisabled", kSSUserDefaultsIdentifier, (Boolean *)a3) != 0;
}

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10015F314;
  block[3] = &unk_1003A31A0;
  block[4] = a1;
  if (qword_100401F40 != -1) {
    dispatch_once(&qword_100401F40, block);
  }
  v2 = (void *)qword_100401F38;

  return v2;
}

@end