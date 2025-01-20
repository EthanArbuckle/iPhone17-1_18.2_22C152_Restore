@interface SVXAFPreferencesProvider
- (id)get;
@end

@implementation SVXAFPreferencesProvider

- (id)get
{
  return (id)[MEMORY[0x263F285A0] sharedPreferences];
}

@end