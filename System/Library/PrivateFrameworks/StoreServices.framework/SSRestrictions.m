@interface SSRestrictions
+ (BOOL)_calculateIsRestrictionsPasscodeSet;
+ (BOOL)_isExplicitContentDisallowedInCurrentStoreFront;
+ (BOOL)_isExplicitContentRestrictedByDefaultInCurrentStoreFront;
+ (BOOL)isActiveAccountAllowedToUpdateRestrictions;
+ (id)setOfActiveRestrictionUUIDs;
+ (void)didDisplayExplicitRestrictionAlertOfType:(int64_t)a3;
+ (void)isExplicitContentDisallowedInCurrentStoreFront:(id)a3;
+ (void)isExplicitContentRestrictedByDefaultInCurrentStoreFront:(id)a3;
+ (void)isRestrictionsPasscodeSet:(id)a3;
+ (void)setAllowExplicitContent;
+ (void)shouldDisplayExplicitRestrictionAlertOfType:(int64_t)a3 completionBlock:(id)a4;
@end

@implementation SSRestrictions

+ (void)shouldDisplayExplicitRestrictionAlertOfType:(int64_t)a3 completionBlock:(id)a4
{
  v7 = (void *)[MEMORY[0x1E4F74230] sharedConnection];
  if ([v7 effectiveRestrictedBoolValueForSetting:*MEMORY[0x1E4F73FE8]] == 2)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78__SSRestrictions_shouldDisplayExplicitRestrictionAlertOfType_completionBlock___block_invoke;
    block[3] = &unk_1E5BA9C80;
    block[5] = a4;
    block[6] = a3;
    block[4] = a1;
    dispatch_async(global_queue, block);
  }
  else
  {
    v9 = (void (*)(id, void, void))*((void *)a4 + 2);
    v9(a4, 0, 0);
  }
}

+ (id)setOfActiveRestrictionUUIDs
{
  v3 = (void *)[MEMORY[0x1E4F1CA80] set];
  if ([a1 _isExplicitContentDisallowedInCurrentStoreFront]) {
    [v3 addObject:@"com.apple.itunesstored.ExplicitPreferenceRestriction"];
  }
  return v3;
}

+ (void)isExplicitContentRestrictedByDefaultInCurrentStoreFront:(id)a3
{
  v4 = [[SSURLBag alloc] initWithURLBagContext:+[SSURLBagContext contextWithBagType:0]];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __74__SSRestrictions_isExplicitContentRestrictedByDefaultInCurrentStoreFront___block_invoke;
  v5[3] = &unk_1E5BA9C58;
  v5[4] = a3;
  [(SSURLBag *)v4 loadValueForKey:@"ExplicitOffAndPreferencesEnabled" completionBlock:v5];
}

uint64_t __74__SSRestrictions_isExplicitContentRestrictedByDefaultInCurrentStoreFront___block_invoke(uint64_t a1, void *a2)
{
  if (objc_opt_respondsToSelector()) {
    [a2 BOOLValue];
  }
  v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v4();
}

+ (void)isExplicitContentDisallowedInCurrentStoreFront:(id)a3
{
  v4 = [[SSURLBag alloc] initWithURLBagContext:+[SSURLBagContext contextWithBagType:0]];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__SSRestrictions_isExplicitContentDisallowedInCurrentStoreFront___block_invoke;
  v5[3] = &unk_1E5BA9C58;
  v5[4] = a3;
  [(SSURLBag *)v4 loadValueForKey:@"ExplicitOffAndPreferencesDisabled" completionBlock:v5];
}

uint64_t __65__SSRestrictions_isExplicitContentDisallowedInCurrentStoreFront___block_invoke(uint64_t a1, void *a2)
{
  if (objc_opt_respondsToSelector()) {
    [a2 BOOLValue];
  }
  v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v4();
}

+ (BOOL)isActiveAccountAllowedToUpdateRestrictions
{
  v2 = (void *)[MEMORY[0x1E4F74230] sharedConnection];
  if ([v2 isSettingLockedDownByRestrictions:*MEMORY[0x1E4F73FE8]]) {
    return 0;
  }
  else {
    return [MEMORY[0x1E4F4DC48] isRunningInStoreDemoMode] ^ 1;
  }
}

+ (void)isRestrictionsPasscodeSet:(id)a3
{
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__SSRestrictions_isRestrictionsPasscodeSet___block_invoke;
  v6[3] = &unk_1E5BA7728;
  v6[4] = a1;
  v6[5] = a3;
  dispatch_async(global_queue, v6);
}

uint64_t __44__SSRestrictions_isRestrictionsPasscodeSet___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [*(id *)(a1 + 32) _calculateIsRestrictionsPasscodeSet];
  v3 = *(uint64_t (**)(uint64_t, uint64_t, void))(v1 + 16);
  return v3(v1, v2, 0);
}

+ (void)setAllowExplicitContent
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F74230] sharedConnection];
  uint64_t v3 = *MEMORY[0x1E4F73FE8];
  [v2 setBoolValue:1 forSetting:v3];
}

uint64_t __78__SSRestrictions_shouldDisplayExplicitRestrictionAlertOfType_completionBlock___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) _isExplicitContentDisallowedInCurrentStoreFront] & 1) == 0)
  {
    uint64_t v2 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v3 = __UserDefaultsKeyForExplicitRestrictionAlertType(*(void *)(a1 + 48));
    uint64_t v4 = v3;
    switch(*(void *)(a1 + 48))
    {
      case 0:
        BOOL v6 = +[SSRestrictions isActiveAccountAllowedToUpdateRestrictions];
        if (v4) {
          BOOL v7 = v6;
        }
        else {
          BOOL v7 = 0;
        }
        if (v7 && [v2 integerForKey:v4] <= 0) {
          goto LABEL_13;
        }
        break;
      case 1:
        if (v3 && [v2 integerForKey:v3] <= 2)
        {
LABEL_13:
          if (([*(id *)(a1 + 32) _calculateIsRestrictionsPasscodeSet] & 1) == 0) {
            [*(id *)(a1 + 32) _isExplicitContentRestrictedByDefaultInCurrentStoreFront];
          }
        }
        break;
      default:
        return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (void)didDisplayExplicitRestrictionAlertOfType:(int64_t)a3
{
  uint64_t v3 = __UserDefaultsKeyForExplicitRestrictionAlertType(a3);
  if (v3)
  {
    uint64_t v4 = v3;
    v5 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v6 = [v5 integerForKey:v4] + 1;
    [v5 setInteger:v6 forKey:v4];
  }
}

+ (BOOL)_calculateIsRestrictionsPasscodeSet
{
  uint64_t v2 = SSVPreferencesFramework();
  id v3 = SSVWeakLinkedClassForString(&cfstr_Psrestrictions.isa, v2);
  return [v3 settingEnabled];
}

+ (BOOL)_isExplicitContentRestrictedByDefaultInCurrentStoreFront
{
  uint64_t v2 = [[SSURLBag alloc] initWithURLBagContext:+[SSURLBagContext contextWithBagType:0]];
  id v3 = [(SSURLBag *)v2 valueForKey:@"ExplicitOffAndPreferencesEnabled" error:0];
  if (v3)
  {
    if (objc_opt_respondsToSelector()) {
      LOBYTE(v3) = [v3 BOOLValue];
    }
    else {
      LOBYTE(v3) = 0;
    }
  }

  return (char)v3;
}

+ (BOOL)_isExplicitContentDisallowedInCurrentStoreFront
{
  uint64_t v2 = [[SSURLBag alloc] initWithURLBagContext:+[SSURLBagContext contextWithBagType:0]];
  id v3 = [(SSURLBag *)v2 valueForKey:@"ExplicitOffAndPreferencesDisabled" error:0];
  if (v3)
  {
    if (objc_opt_respondsToSelector()) {
      LOBYTE(v3) = [v3 BOOLValue];
    }
    else {
      LOBYTE(v3) = 0;
    }
  }

  return (char)v3;
}

@end