@interface MSDGetAccountSettingsResponse
- (NSDictionary)accountSettings;
- (void)setAccountSettings:(id)a3;
@end

@implementation MSDGetAccountSettingsResponse

- (NSDictionary)accountSettings
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAccountSettings:(id)a3
{
}

- (void).cxx_destruct
{
}

@end