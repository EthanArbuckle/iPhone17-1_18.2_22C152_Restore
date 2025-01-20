@interface SFFeatureManager
+ (SFFeatureManager)sharedFeatureManager;
- (BOOL)allowsUnlimitedTabs;
- (BOOL)isAddToHomeScreenAvailable;
- (BOOL)showRectangularTabsInSeparateBar;
- (BOOL)tabDocumentCanHideToolbar;
- (BOOL)usesFormatMenuInUnifiedTabBar;
- (SFFeatureManager)init;
- (int64_t)preferredCapsuleLayoutStyle;
- (void)_updateAccessLevel;
- (void)setTabDocumentCanHideToolbar:(BOOL)a3;
@end

@implementation SFFeatureManager

- (BOOL)allowsUnlimitedTabs
{
  if (allowsUnlimitedTabs_onceToken != -1) {
    dispatch_once(&allowsUnlimitedTabs_onceToken, &__block_literal_global_10);
  }
  return allowsUnlimitedTabs_allowsUnlimitedTabs;
}

- (BOOL)showRectangularTabsInSeparateBar
{
  if (showRectangularTabsInSeparateBar_onceToken != -1) {
    dispatch_once(&showRectangularTabsInSeparateBar_onceToken, &__block_literal_global_6);
  }
  return showRectangularTabsInSeparateBar_showRectangularTabsInSeparateBar;
}

void __40__SFFeatureManager_sharedFeatureManager__block_invoke()
{
  v0 = objc_alloc_init(SFFeatureManager);
  v1 = (void *)sharedFeatureManager_sharedFeatureManagerObject;
  sharedFeatureManager_sharedFeatureManagerObject = (uint64_t)v0;
}

- (SFFeatureManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)SFFeatureManager;
  v2 = [(WBUFeatureManager *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_tabDocumentCanHideToolbar = 1;
    [(SFFeatureManager *)v2 _updateAccessLevel];
    v4 = v3;
  }

  return v3;
}

- (void)_updateAccessLevel
{
  unint64_t v3 = +[WBUFeatureManager accessLevel];
  if (v3 <= 2) {
    self->_addToHomeScreenAvailable = 1u >> (8 * v3);
  }
}

void __47__SFFeatureManager_preferredCapsuleLayoutStyle__block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "safari_numberForKey:", @"PreferredCapsuleLayoutStyle");
  if (v2)
  {
    id v4 = v2;
    unint64_t v3 = [v2 integerValue] - 1;
    v2 = v4;
    if (v3 >= 2)
    {
      [*(id *)(a1 + 32) removeObjectForKey:@"PreferredCapsuleLayoutStyle"];
      v2 = v4;
    }
  }
}

void __52__SFFeatureManager_showRectangularTabsInSeparateBar__block_invoke()
{
  objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  showRectangularTabsInSeparateBar_showRectangularTabsInSeparateBar = objc_msgSend(v0, "safari_BOOLForKey:defaultValue:", @"DebugUnifiedBarShowRectangularTabsInSeparateBar", 0);
}

void __39__SFFeatureManager_allowsUnlimitedTabs__block_invoke()
{
  objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  allowsUnlimitedTabs_allowsUnlimitedTabs = [v0 BOOLForKey:@"DebugUnlimitedTabsEnabled"];
}

+ (SFFeatureManager)sharedFeatureManager
{
  if (sharedFeatureManager_onceToken != -1) {
    dispatch_once(&sharedFeatureManager_onceToken, &__block_literal_global_11);
  }
  v2 = (void *)sharedFeatureManager_sharedFeatureManagerObject;

  return (SFFeatureManager *)v2;
}

- (int64_t)preferredCapsuleLayoutStyle
{
  if (_SFDeviceIsPad()) {
    return 2;
  }
  unint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__SFFeatureManager_preferredCapsuleLayoutStyle__block_invoke;
  block[3] = &unk_1E54E9858;
  id v8 = v3;
  uint64_t v4 = preferredCapsuleLayoutStyle_onceToken;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&preferredCapsuleLayoutStyle_onceToken, block);
  }
  int64_t v2 = [v5 integerForKey:@"PreferredCapsuleLayoutStyle"];

  return v2;
}

- (BOOL)usesFormatMenuInUnifiedTabBar
{
  if (usesFormatMenuInUnifiedTabBar_onceToken != -1) {
    dispatch_once(&usesFormatMenuInUnifiedTabBar_onceToken, &__block_literal_global_8);
  }
  return usesFormatMenuInUnifiedTabBar_usesFormatMenuInUnifiedTabBar;
}

void __49__SFFeatureManager_usesFormatMenuInUnifiedTabBar__block_invoke()
{
  objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  usesFormatMenuInUnifiedTabBar_usesFormatMenuInUnifiedTabBar = [v0 BOOLForKey:@"DebugUsePageFormatMenuInUnifiedTabBar"];
}

- (BOOL)tabDocumentCanHideToolbar
{
  return self->_tabDocumentCanHideToolbar;
}

- (void)setTabDocumentCanHideToolbar:(BOOL)a3
{
  self->_tabDocumentCanHideToolbar = a3;
}

- (BOOL)isAddToHomeScreenAvailable
{
  return self->_addToHomeScreenAvailable;
}

@end