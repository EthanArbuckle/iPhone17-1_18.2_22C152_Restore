@interface UNSBadgeService
- (BOOL)setBadgeValue:(id)a3 forBundleIdentifier:(id)a4;
- (id)badgeNumberForBundleIdentifier:(id)a3;
@end

@implementation UNSBadgeService

- (id)badgeNumberForBundleIdentifier:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F83E50];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithBundleIdentifier:v4];

  objc_opt_class();
  v6 = [v5 badgeValue];
  v7 = UNSafeCast();

  return v7;
}

- (BOOL)setBadgeValue:(id)a3 forBundleIdentifier:(id)a4
{
  v5 = (objc_class *)MEMORY[0x263F83E50];
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[[v5 alloc] initWithBundleIdentifier:v6];

  v9 = [v8 badgeValue];
  [v8 setBadgeValue:v7];

  if (v7) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v9 == 0;
  }
  BOOL v11 = !v10;

  return v11;
}

@end