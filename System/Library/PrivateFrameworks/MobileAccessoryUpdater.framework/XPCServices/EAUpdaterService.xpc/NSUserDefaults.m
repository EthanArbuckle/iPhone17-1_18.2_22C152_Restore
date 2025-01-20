@interface NSUserDefaults
+ (id)AUDeveloperSettingsObjectWithKey:(id)a3;
+ (void)AUDeveloperSettingsSetObject:(id)a3 withKey:(id)a4;
@end

@implementation NSUserDefaults

+ (void)AUDeveloperSettingsSetObject:(id)a3 withKey:(id)a4
{
  if (getuid() == 278)
  {
    id v6 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:MapPreferenceSuiteToString(1)];
    [v6 setObject:a3 forKey:a4];
  }
  else
  {
    v7 = [+[AUHelperInstance sharedInstance] remoteObject];
    [(AUHelperServiceProtocol *)v7 userPreferenceSetObject:a3 forSuite:1 withKey:a4];
  }
}

+ (id)AUDeveloperSettingsObjectWithKey:(id)a3
{
  if (getuid() == 278)
  {
    id v4 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:MapPreferenceSuiteToString(1)];
    return [v4 objectForKey:a3];
  }
  else
  {
    uint64_t v8 = 0;
    v9 = &v8;
    uint64_t v10 = 0x3052000000;
    v11 = sub_100013CB0;
    v12 = sub_100013CC0;
    uint64_t v13 = 0;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100013CCC;
    v7[3] = &unk_100025610;
    v7[4] = &v8;
    [(AUHelperServiceProtocol *)[+[AUHelperInstance sharedInstance] remoteObject] userPreferenceObjectForSuite:1 withKey:a3 withReply:v7];
    id v6 = (void *)v9[5];
    _Block_object_dispose(&v8, 8);
    return v6;
  }
}

@end