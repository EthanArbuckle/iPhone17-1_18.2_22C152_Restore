@interface SXWebContentComponentDeveloperSettingsProvider
- (id)developerSettings;
@end

@implementation SXWebContentComponentDeveloperSettingsProvider

- (id)developerSettings
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F6C6D8]) initWithAllowRemoteInspection:1];
  return v2;
}

@end