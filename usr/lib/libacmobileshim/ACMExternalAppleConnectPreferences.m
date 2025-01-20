@interface ACMExternalAppleConnectPreferences
- (NSData)secret;
- (id)createEnvironmentWithRealm:(id)a3;
- (void)setSecret:(id)a3;
@end

@implementation ACMExternalAppleConnectPreferences

- (id)createEnvironmentWithRealm:(id)a3
{
  return +[ACMEnvironmentPreferences environmentPreferencesWithRealm:a3];
}

- (NSData)secret
{
  v2 = [(ACMPreferences *)self preferencesStore];

  return (NSData *)[(ACMPreferencesStore *)v2 preferencesValueForKey:@"com.apple.ist.appleconnect.tgt" withOptions:2];
}

- (void)setSecret:(id)a3
{
  v4 = [(ACMPreferences *)self preferencesStore];

  [(ACMPreferencesStore *)v4 setPreferencesValue:a3 forKey:@"com.apple.ist.appleconnect.tgt" withOptions:2];
}

@end