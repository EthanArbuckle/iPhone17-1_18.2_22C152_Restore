@interface WBFeatureManager
+ (WBFeatureManager)sharedFeatureManager;
- (BOOL)favoritesFolderSelectionShouldSync;
- (BOOL)isOfflineReadingListAvailable;
- (WBFeatureManager)init;
- (int64_t)accessLevel;
- (void)_updateToAccessLevel:(int64_t)a3;
@end

@implementation WBFeatureManager

+ (WBFeatureManager)sharedFeatureManager
{
  if (sharedFeatureManager_onceToken != -1) {
    dispatch_once(&sharedFeatureManager_onceToken, &__block_literal_global_20);
  }
  v2 = (void *)sharedFeatureManager_sharedFeatureManager;
  return (WBFeatureManager *)v2;
}

uint64_t __40__WBFeatureManager_sharedFeatureManager__block_invoke()
{
  v0 = objc_alloc_init(WBFeatureManager);
  uint64_t v1 = sharedFeatureManager_sharedFeatureManager;
  sharedFeatureManager_sharedFeatureManager = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (WBFeatureManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)WBFeatureManager;
  v2 = [(WBFeatureManager *)&v8 init];
  if (v2)
  {
    if (processAccessLevel_onceToken != -1) {
      dispatch_once(&processAccessLevel_onceToken, &__block_literal_global_25_0);
    }
    if (processAccessLevel_accessLevel)
    {
      uint64_t v3 = 2;
    }
    else if ([MEMORY[0x263F662A0] hasInternalContent])
    {
      Boolean keyExistsAndHasValidFormat = 0;
      CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"SafariDebugOverrideLaunchMode", (CFStringRef)*MEMORY[0x263EFFE48], &keyExistsAndHasValidFormat);
      if (keyExistsAndHasValidFormat) {
        uint64_t v3 = AppIntegerValue;
      }
      else {
        uint64_t v3 = 0;
      }
    }
    else
    {
      uint64_t v3 = 0;
    }
    v2->_accessLevel = v3;
    -[WBFeatureManager _updateToAccessLevel:](v2, "_updateToAccessLevel:");
    v5 = v2;
  }

  return v2;
}

- (void)_updateToAccessLevel:(int64_t)a3
{
  *(_WORD *)&self->_offlineReadingListAvailable = 1;
  if (a3 == 1)
  {
    self->_offlineReadingListAvailable = 0;
  }
  else if (a3 == 2)
  {
    self->_favoritesFolderSelectionShouldSync = 1;
  }
}

- (int64_t)accessLevel
{
  return self->_accessLevel;
}

- (BOOL)isOfflineReadingListAvailable
{
  return self->_offlineReadingListAvailable;
}

- (BOOL)favoritesFolderSelectionShouldSync
{
  return self->_favoritesFolderSelectionShouldSync;
}

@end