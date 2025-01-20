@interface WLKBadgingUtilities
+ (BOOL)addBadgeIdentifier:(id)a3;
+ (BOOL)hasMigrated;
+ (BOOL)removeBadgeIdentifier:(id)a3;
+ (id)badgeIdentifiers;
+ (id)currentBadgeNumber;
+ (id)sharedUtilities;
+ (void)clearSavedBadgeIdentifiers;
- (id)_notificationCenter;
- (void)migrateToNewBadgingSystemIfNeeded;
@end

@implementation WLKBadgingUtilities

+ (void)clearSavedBadgeIdentifiers
{
  objc_msgSend(MEMORY[0x1E4F1CB18], "wlk_userDefaults");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 removeObjectForKey:@"badgeIdentifiers"];
}

+ (id)sharedUtilities
{
  if (sharedUtilities___once != -1) {
    dispatch_once(&sharedUtilities___once, &__block_literal_global_14);
  }
  id v2 = (void *)sharedUtilities___singleInstance;

  return v2;
}

uint64_t __38__WLKBadgingUtilities_sharedUtilities__block_invoke()
{
  sharedUtilities___singleInstance = objc_alloc_init(WLKBadgingUtilities);

  return MEMORY[0x1F41817F8]();
}

- (id)_notificationCenter
{
  if (_notificationCenter_onceToken != -1) {
    dispatch_once(&_notificationCenter_onceToken, &__block_literal_global_9);
  }
  id v2 = (void *)_notificationCenter__center;

  return v2;
}

void __42__WLKBadgingUtilities__notificationCenter__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F44680]);
  WLKTVAppBundleID();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 initWithBundleIdentifier:v3];
  id v2 = (void *)_notificationCenter__center;
  _notificationCenter__center = v1;
}

+ (id)currentBadgeNumber
{
  id v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "wlk_userDefaults");
  id v3 = [v2 arrayForKey:@"badgeIdentifiers"];
  v4 = v3;
  if (v3 && [v3 count])
  {
    v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "count"));
  }
  else
  {
    v5 = &unk_1F13D97B8;
  }

  return v5;
}

+ (id)badgeIdentifiers
{
  id v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "wlk_userDefaults");
  id v3 = [v2 arrayForKey:@"badgeIdentifiers"];

  return v3;
}

+ (BOOL)hasMigrated
{
  id v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "wlk_userDefaults");
  char v3 = [v2 BOOLForKey:@"hasMigratedToNewBadgingSystem"];

  return v3;
}

- (void)migrateToNewBadgingSystemIfNeeded
{
  if (([(id)objc_opt_class() hasMigrated] & 1) == 0)
  {
    char v3 = [(WLKBadgingUtilities *)self _notificationCenter];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __56__WLKBadgingUtilities_migrateToNewBadgingSystemIfNeeded__block_invoke;
    v5[3] = &unk_1E620AA48;
    v5[4] = self;
    [v3 getBadgeNumberWithCompletionHandler:v5];

    v4 = objc_msgSend(MEMORY[0x1E4F1CB18], "wlk_userDefaults");
    [v4 setBool:1 forKey:@"hasMigratedToNewBadgingSystem"];
  }
}

void __56__WLKBadgingUtilities_migrateToNewBadgingSystemIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  char v3 = [(id)objc_opt_class() currentBadgeNumber];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [NSNumber numberWithInteger:0];
  }
  id v7 = v5;

  uint64_t v6 = [v2 integerValue];
  if (v6 == 1 && ![v7 integerValue]) {
    [(id)objc_opt_class() addBadgeIdentifier:@"defaultTVAppBadgeId"];
  }
}

+ (BOOL)addBadgeIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x1E4F1CB18], "wlk_userDefaults");
  id v5 = [v4 arrayForKey:@"badgeIdentifiers"];
  uint64_t v6 = v5;
  if (!v5 || ![v5 count])
  {
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
LABEL_7:
    v9 = v8;
    [v8 addObject:v3];
    v10 = (void *)[v9 copy];
    [v4 setValue:v10 forKey:@"badgeIdentifiers"];

    BOOL v7 = 1;
    goto LABEL_8;
  }
  if (([v6 containsObject:v3] & 1) == 0)
  {
    v8 = (void *)[v6 mutableCopy];
    goto LABEL_7;
  }
  BOOL v7 = 0;
LABEL_8:

  return v7;
}

+ (BOOL)removeBadgeIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x1E4F1CB18], "wlk_userDefaults");
  id v5 = [v4 objectForKey:@"badgeIdentifiers"];
  uint64_t v6 = v5;
  if (v5 && [v5 count] && objc_msgSend(v6, "containsObject:", v3))
  {
    BOOL v7 = (void *)[v6 mutableCopy];
    [v7 removeObject:v3];
    if ([v7 count])
    {
      v8 = (void *)[v7 copy];
      [v4 setValue:v8 forKey:@"badgeIdentifiers"];
    }
    else
    {
      [v4 removeObjectForKey:@"badgeIdentifiers"];
    }

    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

@end