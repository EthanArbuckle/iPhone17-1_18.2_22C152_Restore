@interface RSDPreferences
- (NSString)prefDomain;
- (RSDPreferences)initWithPrefDomain:(id)a3;
- (id)valueForKey:(id)a3;
- (void)eraseAll;
- (void)migrateContentsOnDisk;
- (void)setValue:(id)a3 forKey:(id)a4;
- (void)synchronize;
@end

@implementation RSDPreferences

- (RSDPreferences)initWithPrefDomain:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RSDPreferences;
  v6 = [(RSDPreferences *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_prefDomain, a3);
    _CFPreferencesSetBackupDisabled();
  }

  return v7;
}

- (void)migrateContentsOnDisk
{
  v3 = [(RSDPreferences *)self valueForKey:@"remoted-prefs-version"];
  if (!v3) {
    v3 = &off_100056FA0;
  }
  v4 = v3;
  if (([v3 isEqual:&off_100056FB8] & 1) == 0)
  {
    if ([v4 compare:&off_100056FB8] == (id)-1) {
      [(RSDPreferences *)self eraseAll];
    }
    [(RSDPreferences *)self setValue:&off_100056FB8 forKey:@"remoted-prefs-version"];
    [(RSDPreferences *)self synchronize];
  }

  _objc_release_x1();
}

- (void)eraseAll
{
  v3 = [(RSDPreferences *)self prefDomain];
  CFArrayRef v4 = CFPreferencesCopyKeyList(v3, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);

  if (v4)
  {
    id v5 = [(RSDPreferences *)self prefDomain];
    CFPreferencesSetMultiple(0, v4, v5, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);

    CFRelease(v4);
  }
}

- (id)valueForKey:(id)a3
{
  CFArrayRef v4 = (__CFString *)a3;
  id v5 = [(RSDPreferences *)self prefDomain];
  v6 = (void *)CFPreferencesCopyValue(v4, v5, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);

  return v6;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  v6 = (__CFString *)a4;
  id v7 = a3;
  v8 = [(RSDPreferences *)self prefDomain];
  CFPreferencesSetValue(v6, v7, v8, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
}

- (void)synchronize
{
  v2 = [(RSDPreferences *)self prefDomain];
  CFPreferencesAppSynchronize(v2);
}

- (NSString)prefDomain
{
  return self->_prefDomain;
}

- (void).cxx_destruct
{
}

@end