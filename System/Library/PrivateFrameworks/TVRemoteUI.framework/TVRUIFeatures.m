@interface TVRUIFeatures
+ (BOOL)_isInternalInstall;
+ (BOOL)_valueForInternalInstallWithBlock:(id)a3;
+ (BOOL)corianderEnabled;
+ (BOOL)includeRTReviewInInfoPanel;
+ (BOOL)isAWDLEnabled;
+ (BOOL)isCorianderDebugUIEnabled;
+ (BOOL)isHintsDebugUIEnabled;
+ (BOOL)isTapToRadarEnabled;
+ (BOOL)isWakeToRemoteOnLockScreenDisabled;
+ (BOOL)persistHintsUIEnabled;
+ (BOOL)replaceMuteButtonWithContextMenu;
+ (BOOL)showExperimentalCastTab;
+ (BOOL)swapBackPlayPauseButtonsEnabled;
+ (id)_globalPrefForKey:(id)a3;
@end

@implementation TVRUIFeatures

+ (BOOL)isWakeToRemoteOnLockScreenDisabled
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __51__TVRUIFeatures_isWakeToRemoteOnLockScreenDisabled__block_invoke;
  v3[3] = &__block_descriptor_40_e5_B8__0l;
  v3[4] = a1;
  return [a1 _valueForInternalInstallWithBlock:v3];
}

uint64_t __51__TVRUIFeatures_isWakeToRemoteOnLockScreenDisabled__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) _globalPrefForKey:@"TVRemoteWakeToRemoteOnLockScreenDisabled"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

+ (BOOL)isTapToRadarEnabled
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __36__TVRUIFeatures_isTapToRadarEnabled__block_invoke;
  v3[3] = &__block_descriptor_40_e5_B8__0l;
  v3[4] = a1;
  return [a1 _valueForInternalInstallWithBlock:v3];
}

uint64_t __36__TVRUIFeatures_isTapToRadarEnabled__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) _globalPrefForKey:@"TVRemoteTTRDisabled"];
  uint64_t v2 = [v1 BOOLValue] ^ 1;

  return v2;
}

+ (BOOL)_isInternalInstall
{
  if (_isInternalInstall_onceToken != -1) {
    dispatch_once(&_isInternalInstall_onceToken, &__block_literal_global_12);
  }
  return _isInternalInstall__isInternal;
}

uint64_t __35__TVRUIFeatures__isInternalInstall__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  _isInternalInstall__isInternal = result;
  return result;
}

+ (BOOL)corianderEnabled
{
  return [MEMORY[0x263F7C9A8] corianderEnabled];
}

+ (BOOL)persistHintsUIEnabled
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __38__TVRUIFeatures_persistHintsUIEnabled__block_invoke;
  v3[3] = &__block_descriptor_40_e5_B8__0l;
  v3[4] = a1;
  return [a1 _valueForInternalInstallWithBlock:v3];
}

uint64_t __38__TVRUIFeatures_persistHintsUIEnabled__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) _globalPrefForKey:@"TVRemotePersistHintsUI"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

+ (BOOL)isHintsDebugUIEnabled
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __38__TVRUIFeatures_isHintsDebugUIEnabled__block_invoke;
  v3[3] = &__block_descriptor_40_e5_B8__0l;
  v3[4] = a1;
  return [a1 _valueForInternalInstallWithBlock:v3];
}

uint64_t __38__TVRUIFeatures_isHintsDebugUIEnabled__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) _globalPrefForKey:@"TVRemoteHintsDebugUI"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

+ (BOOL)isCorianderDebugUIEnabled
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __42__TVRUIFeatures_isCorianderDebugUIEnabled__block_invoke;
  v3[3] = &__block_descriptor_40_e5_B8__0l;
  v3[4] = a1;
  return [a1 _valueForInternalInstallWithBlock:v3];
}

uint64_t __42__TVRUIFeatures_isCorianderDebugUIEnabled__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) _globalPrefForKey:@"TVRemoteCorianderDebugUI"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

+ (BOOL)swapBackPlayPauseButtonsEnabled
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __48__TVRUIFeatures_swapBackPlayPauseButtonsEnabled__block_invoke;
  v3[3] = &__block_descriptor_40_e5_B8__0l;
  v3[4] = a1;
  return [a1 _valueForInternalInstallWithBlock:v3];
}

uint64_t __48__TVRUIFeatures_swapBackPlayPauseButtonsEnabled__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) _globalPrefForKey:@"TVRemoteSwapBackPlayPauseButtons"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

+ (BOOL)showExperimentalCastTab
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __40__TVRUIFeatures_showExperimentalCastTab__block_invoke;
  v3[3] = &__block_descriptor_40_e5_B8__0l;
  v3[4] = a1;
  return [a1 _valueForInternalInstallWithBlock:v3];
}

uint64_t __40__TVRUIFeatures_showExperimentalCastTab__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) _globalPrefForKey:@"TVRemoteShowCastTab"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

+ (BOOL)replaceMuteButtonWithContextMenu
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __49__TVRUIFeatures_replaceMuteButtonWithContextMenu__block_invoke;
  v3[3] = &__block_descriptor_40_e5_B8__0l;
  v3[4] = a1;
  return [a1 _valueForInternalInstallWithBlock:v3];
}

uint64_t __49__TVRUIFeatures_replaceMuteButtonWithContextMenu__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) _globalPrefForKey:@"TVRemoteReplaceMuteButtonWithContextMenu"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

+ (BOOL)includeRTReviewInInfoPanel
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __43__TVRUIFeatures_includeRTReviewInInfoPanel__block_invoke;
  v3[3] = &__block_descriptor_40_e5_B8__0l;
  v3[4] = a1;
  return [a1 _valueForInternalInstallWithBlock:v3];
}

uint64_t __43__TVRUIFeatures_includeRTReviewInInfoPanel__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) _globalPrefForKey:@"TVRemoteIncludeRTInInfoPanel"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

+ (BOOL)isAWDLEnabled
{
  return [MEMORY[0x263F7C9A8] isAWDLEnabled];
}

+ (BOOL)_valueForInternalInstallWithBlock:(id)a3
{
  v4 = (uint64_t (**)(void))a3;
  if ([a1 _isInternalInstall]) {
    char v5 = v4[2](v4);
  }
  else {
    char v5 = 0;
  }

  return v5;
}

+ (id)_globalPrefForKey:(id)a3
{
  v3 = NSDictionary;
  id v4 = a3;
  char v5 = [v3 dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/.GlobalPreferences.plist"];
  v6 = [v5 objectForKey:v4];

  return v6;
}

@end