@interface FeatureManager
+ (id)sharedFeatureManager;
- (BOOL)areSharedTabGroupsEnabled;
- (BOOL)areTabGroupSuggestionsEnabled;
- (BOOL)isAddToHomeScreenAvailable;
- (BOOL)isCustomTabGroupsEnabled;
- (FeatureManager)init;
- (void)_updateAccessLevel;
@end

@implementation FeatureManager

+ (id)sharedFeatureManager
{
  if (sharedFeatureManager_onceToken != -1) {
    dispatch_once(&sharedFeatureManager_onceToken, &__block_literal_global_75);
  }
  v2 = (void *)sharedFeatureManagerObject;
  return v2;
}

- (BOOL)areSharedTabGroupsEnabled
{
  BOOL v3 = [(WBUFeatureManager *)self isCloudAccountHSA2];
  if (v3)
  {
    LOBYTE(v3) = [(WBUFeatureManager *)self isSafariSyncEnabled];
  }
  return v3;
}

void __38__FeatureManager_sharedFeatureManager__block_invoke()
{
  v0 = objc_alloc_init(FeatureManager);
  v1 = (void *)sharedFeatureManagerObject;
  sharedFeatureManagerObject = (uint64_t)v0;
}

- (FeatureManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)FeatureManager;
  v2 = [(WBUFeatureManager *)&v6 init];
  BOOL v3 = v2;
  if (v2)
  {
    [(FeatureManager *)v2 _updateAccessLevel];
    v4 = v3;
  }

  return v3;
}

- (void)_updateAccessLevel
{
  self->_customTabGroupsEnabled = 1;
  self->_addToHomeScreenAvailable = 1;
  if ((unint64_t)(+[WBUFeatureManager accessLevel] - 1) <= 1)
  {
    self->_addToHomeScreenAvailable = 0;
    self->_customTabGroupsEnabled = 0;
  }
}

- (BOOL)areTabGroupSuggestionsEnabled
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  char v3 = [v2 BOOLForKey:*MEMORY[0x1E4F786E8]];

  return v3;
}

- (BOOL)isAddToHomeScreenAvailable
{
  return self->_addToHomeScreenAvailable;
}

- (BOOL)isCustomTabGroupsEnabled
{
  return self->_customTabGroupsEnabled;
}

@end