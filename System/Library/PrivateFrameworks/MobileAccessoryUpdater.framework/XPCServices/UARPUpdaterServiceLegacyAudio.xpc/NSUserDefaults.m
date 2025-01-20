@interface NSUserDefaults
+ (id)AUDeveloperSettingsObjectWithKey:(id)a3;
+ (void)AUDeveloperSettingsSetObject:(id)a3 withKey:(id)a4;
@end

@implementation NSUserDefaults

+ (void)AUDeveloperSettingsSetObject:(id)a3 withKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  if (getuid() == 278)
  {
    id v7 = objc_alloc((Class)NSUserDefaults);
    v8 = MapPreferenceSuiteToString(1);
    id v10 = [v7 initWithSuiteName:v8];

    [v10 setObject:v6 forKey:v5];
  }
  else
  {
    v9 = +[AUHelperInstance sharedInstance];
    id v10 = [v9 remoteObject];

    [v10 userPreferenceSetObject:v6 forSuite:1 withKey:v5];
  }
}

+ (id)AUDeveloperSettingsObjectWithKey:(id)a3
{
  id v3 = a3;
  if (getuid() == 278)
  {
    id v4 = objc_alloc((Class)NSUserDefaults);
    id v5 = MapPreferenceSuiteToString(1);
    id v6 = [v4 initWithSuiteName:v5];

    id v7 = [v6 objectForKey:v3];
  }
  else
  {
    v8 = +[AUHelperInstance sharedInstance];
    id v6 = [v8 remoteObject];

    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x3032000000;
    v14 = sub_100015E9C;
    v15 = sub_100015EAC;
    id v16 = 0;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100015EB4;
    v10[3] = &unk_100031A18;
    v10[4] = &v11;
    [v6 userPreferenceObjectForSuite:1 withKey:v3 withReply:v10];
    id v7 = (id)v12[5];
    _Block_object_dispose(&v11, 8);
  }
  return v7;
}

@end