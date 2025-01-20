@interface UIMutableApplicationSceneClientSettings
- (BOOL)containsSearchView;
- (BOOL)defaultStatusBarHidden;
- (BOOL)deviceOrientationEventsEnabled;
- (BOOL)disablesMirroring;
- (BOOL)discardSessionOnUserDisconnect;
- (BOOL)homeIndicatorAutoHidden;
- (BOOL)idleModeVisualEffectsEnabled;
- (BOOL)idleTimerDisabled;
- (BOOL)interfaceOrientationChangesDisabled;
- (BOOL)isReachabilitySupported;
- (BOOL)isStatusBarForegroundTransparent;
- (BOOL)isUISubclass;
- (BOOL)settings:(id)a3 appendDescriptionToBuilder:(id)a4 forFlag:(int64_t)a5 object:(id)a6 ofSetting:(unint64_t)a7;
- (BOOL)statusBarHidden;
- (BOOL)systemInputActive;
- (BOOL)wantsExclusiveForeground;
- (CGRect)screenFocusedFrame;
- (FBSDisplayConfigurationRequest)displayConfigurationRequest;
- (FBSDisplayMode)requestedDisplayMode;
- (NSArray)audioCategoriesDisablingVolumeHUD;
- (NSArray)multitaskingDragExclusionRects;
- (NSData)activationConditionsData;
- (NSDictionary)statusBarPartStyles;
- (NSString)canvasTitle;
- (NSString)defaultPNGName;
- (UIEdgeInsets)primaryWindowOverlayInsets;
- (_UIPhysicalButtonConfigurationSet)physicalButtonConfigurations;
- (double)brightnessLevel;
- (double)controlCenterAmbiguousActivationMargin;
- (double)defaultPNGExpirationTime;
- (double)statusBarAlpha;
- (id)copyWithZone:(_NSZone *)a3;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
- (int64_t)backgroundStyle;
- (int64_t)compatibilityMode;
- (int64_t)controlCenterRevealMode;
- (int64_t)defaultStatusBarStyle;
- (int64_t)editingInteractionConfiguration;
- (int64_t)interfaceOrientation;
- (int64_t)notificationCenterRevealMode;
- (int64_t)playbackControlsState;
- (int64_t)preferredPointerLockStatus;
- (int64_t)sceneActivationBias;
- (int64_t)statusBarModernStyle;
- (int64_t)statusBarStyle;
- (int64_t)userInterfaceStyle;
- (int64_t)whitePointAdaptivityStyle;
- (unint64_t)_debugValidationOrientationMask;
- (unint64_t)proximityDetectionModes;
- (unint64_t)screenEdgesDeferringSystemGestures;
- (unint64_t)supportedInterfaceOrientations;
- (unint64_t)visibleMiniAlertCount;
- (unsigned)statusBarContextID;
- (void)_setDebugValidationOrientationMask:(unint64_t)a3;
- (void)setActivationConditionsData:(id)a3;
- (void)setAudioCategoriesDisablingVolumeHUD:(id)a3;
- (void)setBackgroundStyle:(int64_t)a3;
- (void)setBrightnessLevel:(double)a3;
- (void)setCanvasTitle:(id)a3;
- (void)setCompatibilityMode:(int64_t)a3;
- (void)setContainsSearchView:(BOOL)a3;
- (void)setControlCenterAmbiguousActivationMargin:(double)a3;
- (void)setControlCenterRevealMode:(int64_t)a3;
- (void)setDefaultPNGExpirationTime:(double)a3;
- (void)setDefaultPNGName:(id)a3;
- (void)setDefaultStatusBarHidden:(BOOL)a3;
- (void)setDefaultStatusBarStyle:(int64_t)a3;
- (void)setDeviceOrientationEventsEnabled:(BOOL)a3;
- (void)setDisablesMirroring:(BOOL)a3;
- (void)setDiscardSessionOnUserDisconnect:(BOOL)a3;
- (void)setDisplayConfigurationRequest:(id)a3;
- (void)setEditingInteractionConfiguration:(int64_t)a3;
- (void)setHomeIndicatorAutoHidden:(BOOL)a3;
- (void)setIdleModeVisualEffectsEnabled:(BOOL)a3;
- (void)setIdleTimerDisabled:(BOOL)a3;
- (void)setInterfaceOrientation:(int64_t)a3;
- (void)setInterfaceOrientationChangesDisabled:(BOOL)a3;
- (void)setMultitaskingDragExclusionRects:(id)a3;
- (void)setNotificationCenterRevealMode:(int64_t)a3;
- (void)setPhysicalButtonConfigurations:(id)a3;
- (void)setPlaybackControlsState:(int64_t)a3;
- (void)setPreferredPointerLockStatus:(int64_t)a3;
- (void)setPrimaryWindowOverlayInsets:(UIEdgeInsets)a3;
- (void)setProximityDetectionModes:(unint64_t)a3;
- (void)setReachabilitySupported:(BOOL)a3;
- (void)setRequestedDisplayMode:(id)a3;
- (void)setSceneActivationBias:(int64_t)a3;
- (void)setScreenEdgesDeferringSystemGestures:(unint64_t)a3;
- (void)setScreenFocusedFrame:(CGRect)a3;
- (void)setStatusBarAlpha:(double)a3;
- (void)setStatusBarContextID:(unsigned int)a3;
- (void)setStatusBarForegroundTransparent:(BOOL)a3;
- (void)setStatusBarHidden:(BOOL)a3;
- (void)setStatusBarModernStyle:(int64_t)a3;
- (void)setStatusBarPartStyles:(id)a3;
- (void)setStatusBarStyle:(int64_t)a3;
- (void)setSupportedInterfaceOrientations:(unint64_t)a3;
- (void)setSystemInputActive:(BOOL)a3;
- (void)setUserInterfaceStyle:(int64_t)a3;
- (void)setVisibleMiniAlertCount:(unint64_t)a3;
- (void)setWantsExclusiveForeground:(BOOL)a3;
- (void)setWhitePointAdaptivityStyle:(int64_t)a3;
@end

@implementation UIMutableApplicationSceneClientSettings

- (void)setActivationConditionsData:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  [v5 setObject:v4 forSetting:38];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [UIApplicationSceneClientSettings alloc];
  return [(FBSSettings *)v4 initWithSettings:self];
}

- (void)setDefaultStatusBarHidden:(BOOL)a3
{
  id v3 = [(FBSSettings *)self otherSettings];
  [v3 setFlag:BSSettingFlagForBool() forSetting:6];
}

- (BOOL)isUISubclass
{
  return 1;
}

- (void)setScreenEdgesDeferringSystemGestures:(unint64_t)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v4 forSetting:26];
}

- (void)setPrimaryWindowOverlayInsets:(UIEdgeInsets)a3
{
  CGFloat right = a3.right;
  CGFloat bottom = a3.bottom;
  CGFloat left = a3.left;
  CGFloat top = a3.top;
  id v8 = [(FBSSettings *)self otherSettings];
  v10.CGFloat top = top;
  v10.CGFloat left = left;
  v10.CGFloat bottom = bottom;
  v10.CGFloat right = right;
  v7 = NSStringFromUIEdgeInsets(v10);
  [v8 setObject:v7 forSetting:19];
}

- (void)setHomeIndicatorAutoHidden:(BOOL)a3
{
  id v3 = [(FBSSettings *)self otherSettings];
  [v3 setFlag:BSSettingFlagForBool() forSetting:27];
}

- (void)setWhitePointAdaptivityStyle:(int64_t)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  id v4 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v4 forSetting:22];
}

- (void)setIdleTimerDisabled:(BOOL)a3
{
  id v3 = [(FBSSettings *)self otherSettings];
  [v3 setFlag:BSSettingFlagForBool() forSetting:14];
}

- (void)setEditingInteractionConfiguration:(int64_t)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  id v4 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v4 forSetting:46];
}

- (void)setStatusBarModernStyle:(int64_t)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  id v4 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v4 forSetting:35];
}

- (void)setStatusBarStyle:(int64_t)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  id v4 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v4 forSetting:1];
}

- (void)setStatusBarPartStyles:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  [v5 setObject:v4 forSetting:34];
}

- (void)setCanvasTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  [v5 setObject:v4 forSetting:37];
}

- (void)setSupportedInterfaceOrientations:(unint64_t)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v4 forSetting:13];
}

- (void)setDeviceOrientationEventsEnabled:(BOOL)a3
{
  id v3 = [(FBSSettings *)self otherSettings];
  [v3 setFlag:BSSettingFlagForBool() forSetting:10];
}

- (void)setStatusBarHidden:(BOOL)a3
{
  id v3 = [(FBSSettings *)self otherSettings];
  [v3 setFlag:BSSettingFlagForBool() forSetting:2];
}

- (void)setReachabilitySupported:(BOOL)a3
{
  id v3 = [(FBSSettings *)self otherSettings];
  [v3 setFlag:BSSettingFlagForBool() forSetting:25];
}

- (void)setSceneActivationBias:(int64_t)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  id v4 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v4 forSetting:39];
}

- (void)setControlCenterAmbiguousActivationMargin:(double)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  id v4 = [NSNumber numberWithDouble:a3];
  [v5 setObject:v4 forSetting:16];
}

- (void)setPhysicalButtonConfigurations:(id)a3
{
  id v4 = a3;
  id v6 = [(FBSSettings *)self otherSettings];
  id v5 = (void *)[v4 copy];

  [v6 setObject:v5 forSetting:47];
}

- (void)setAudioCategoriesDisablingVolumeHUD:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  [v5 setObject:v4 forSetting:31];
}

- (void)setDefaultPNGName:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  [v5 setObject:v4 forSetting:7];
}

- (void)setDefaultPNGExpirationTime:(double)a3
{
  id v5 = [NSNumber numberWithDouble:a3];
  id v4 = [(FBSSettings *)self otherSettings];
  [v4 setObject:v5 forSetting:8];
}

- (void)setProximityDetectionModes:(unint64_t)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v4 forSetting:15];
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  id v4 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v4 forSetting:12];
}

- (void)setDefaultStatusBarStyle:(int64_t)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  id v4 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v4 forSetting:5];
}

- (void)setCompatibilityMode:(int64_t)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  id v4 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v4 forSetting:9];
}

- (void)setBackgroundStyle:(int64_t)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  id v4 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v4 forSetting:20];
}

- (void)setStatusBarAlpha:(double)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  id v4 = [NSNumber numberWithDouble:a3];
  [v5 setObject:v4 forSetting:36];
}

- (int64_t)statusBarStyle
{
  v2 = [(FBSSettings *)self otherSettings];
  id v3 = [v2 objectForSetting:1];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (int64_t)statusBarModernStyle
{
  v2 = [(FBSSettings *)self otherSettings];
  id v3 = [v2 objectForSetting:35];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (NSDictionary)statusBarPartStyles
{
  v2 = [(FBSSettings *)self otherSettings];
  id v3 = [v2 objectForSetting:34];

  return (NSDictionary *)v3;
}

- (BOOL)statusBarHidden
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:2];

  return v3;
}

- (double)statusBarAlpha
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:36];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (void)setStatusBarForegroundTransparent:(BOOL)a3
{
  id v3 = [(FBSSettings *)self otherSettings];
  [v3 setFlag:BSSettingFlagForBool() forSetting:3];
}

- (unsigned)statusBarContextID
{
  v2 = [(FBSSettings *)self otherSettings];
  id v3 = [v2 objectForSetting:4];
  unsigned int v4 = [v3 unsignedIntValue];

  return v4;
}

- (void)setStatusBarContextID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(FBSSettings *)self otherSettings];
  unsigned int v4 = [NSNumber numberWithUnsignedInt:v3];
  [v5 setObject:v4 forSetting:4];
}

- (int64_t)defaultStatusBarStyle
{
  v2 = [(FBSSettings *)self otherSettings];
  uint64_t v3 = [v2 objectForSetting:5];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (BOOL)defaultStatusBarHidden
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:6];

  return v3;
}

- (NSString)defaultPNGName
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:7];

  return (NSString *)v3;
}

- (double)defaultPNGExpirationTime
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:8];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (int64_t)compatibilityMode
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:9];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (BOOL)deviceOrientationEventsEnabled
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:10];

  return v3;
}

- (BOOL)interfaceOrientationChangesDisabled
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:11];

  return v3;
}

- (void)setInterfaceOrientationChangesDisabled:(BOOL)a3
{
  id v3 = [(FBSSettings *)self otherSettings];
  [v3 setFlag:BSSettingFlagForBool() forSetting:11];
}

- (int64_t)interfaceOrientation
{
  v2 = [(FBSSettings *)self otherSettings];
  id v3 = [v2 objectForSetting:12];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [(FBSSettings *)self otherSettings];
  id v3 = [v2 objectForSetting:13];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (BOOL)idleTimerDisabled
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:14];

  return v3;
}

- (unint64_t)proximityDetectionModes
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:15];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (double)controlCenterAmbiguousActivationMargin
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:16];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (int64_t)controlCenterRevealMode
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:17];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (void)setControlCenterRevealMode:(int64_t)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  int64_t v4 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v4 forSetting:17];
}

- (int64_t)notificationCenterRevealMode
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:18];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (void)setNotificationCenterRevealMode:(int64_t)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  int64_t v4 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v4 forSetting:18];
}

- (int64_t)editingInteractionConfiguration
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:46];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (UIEdgeInsets)primaryWindowOverlayInsets
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:19];
  UIEdgeInsets v12 = UIEdgeInsetsFromString(v3);
  CGFloat top = v12.top;
  CGFloat left = v12.left;
  CGFloat bottom = v12.bottom;
  CGFloat right = v12.right;

  double v8 = top;
  double v9 = left;
  double v10 = bottom;
  double v11 = right;
  result.CGFloat right = v11;
  result.CGFloat bottom = v10;
  result.CGFloat left = v9;
  result.CGFloat top = v8;
  return result;
}

- (int64_t)backgroundStyle
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:20];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (BOOL)idleModeVisualEffectsEnabled
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:21];

  return v3;
}

- (void)setIdleModeVisualEffectsEnabled:(BOOL)a3
{
  id v3 = [(FBSSettings *)self otherSettings];
  [v3 setFlag:BSSettingFlagForBool() forSetting:21];
}

- (int64_t)whitePointAdaptivityStyle
{
  v2 = [(FBSSettings *)self otherSettings];
  id v3 = [v2 objectForSetting:22];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (FBSDisplayMode)requestedDisplayMode
{
  v2 = [(FBSSettings *)self otherSettings];
  id v3 = [v2 objectForSetting:23];

  return (FBSDisplayMode *)v3;
}

- (void)setRequestedDisplayMode:(id)a3
{
  id v4 = a3;
  id v6 = [(FBSSettings *)self otherSettings];
  id v5 = (void *)[v4 copy];

  [v6 setObject:v5 forSetting:23];
}

- (FBSDisplayConfigurationRequest)displayConfigurationRequest
{
  v2 = [(FBSSettings *)self otherSettings];
  id v3 = [v2 objectForSetting:24];

  return (FBSDisplayConfigurationRequest *)v3;
}

- (void)setDisplayConfigurationRequest:(id)a3
{
  id v4 = a3;
  id v6 = [(FBSSettings *)self otherSettings];
  id v5 = (void *)[v4 copy];

  [v6 setObject:v5 forSetting:24];
}

- (BOOL)isReachabilitySupported
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:25];

  return v3;
}

- (unint64_t)screenEdgesDeferringSystemGestures
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:26];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (BOOL)homeIndicatorAutoHidden
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:27];

  return v3;
}

- (BOOL)wantsExclusiveForeground
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:28];

  return v3;
}

- (void)setWantsExclusiveForeground:(BOOL)a3
{
  id v3 = [(FBSSettings *)self otherSettings];
  [v3 setFlag:BSSettingFlagForBool() forSetting:28];
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  unint64_t v4 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v4 forSetting:29];
}

- (int64_t)userInterfaceStyle
{
  v2 = [(FBSSettings *)self otherSettings];
  id v3 = [v2 objectForSetting:29];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (unint64_t)visibleMiniAlertCount
{
  v2 = [(FBSSettings *)self otherSettings];
  id v3 = [v2 objectForSetting:30];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (void)setVisibleMiniAlertCount:(unint64_t)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  unint64_t v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v4 forSetting:30];
}

- (NSArray)audioCategoriesDisablingVolumeHUD
{
  v2 = [(FBSSettings *)self otherSettings];
  id v3 = [v2 objectForSetting:31];

  return (NSArray *)v3;
}

- (double)brightnessLevel
{
  v2 = [(FBSSettings *)self otherSettings];
  id v3 = [v2 objectForSetting:32];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (void)setBrightnessLevel:(double)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  double v4 = [NSNumber numberWithDouble:a3];
  [v5 setObject:v4 forSetting:32];
}

- (BOOL)disablesMirroring
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:33];

  return v3;
}

- (void)setDisablesMirroring:(BOOL)a3
{
  id v3 = [(FBSSettings *)self otherSettings];
  [v3 setFlag:BSSettingFlagForBool() forSetting:33];
}

- (NSString)canvasTitle
{
  v2 = [(FBSSettings *)self otherSettings];
  id v3 = [v2 objectForSetting:37];

  return (NSString *)v3;
}

- (NSData)activationConditionsData
{
  v2 = [(FBSSettings *)self otherSettings];
  id v3 = [v2 objectForSetting:38];

  return (NSData *)v3;
}

- (CGRect)screenFocusedFrame
{
  v2 = [(FBSSettings *)self otherSettings];
  id v3 = [v2 objectForSetting:40];
  [v3 CGRectValue];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)setScreenFocusedFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = [(FBSSettings *)self otherSettings];
  double v7 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", x, y, width, height);
  [v8 setObject:v7 forSetting:40];
}

- (int64_t)preferredPointerLockStatus
{
  v2 = [(FBSSettings *)self otherSettings];
  id v3 = [v2 objectForSetting:41];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (void)setPreferredPointerLockStatus:(int64_t)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  int64_t v4 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v4 forSetting:41];
}

- (_UIPhysicalButtonConfigurationSet)physicalButtonConfigurations
{
  v2 = [(FBSSettings *)self otherSettings];
  id v3 = [v2 objectForSetting:47];

  return (_UIPhysicalButtonConfigurationSet *)v3;
}

- (NSArray)multitaskingDragExclusionRects
{
  v2 = [(FBSSettings *)self otherSettings];
  id v3 = [v2 objectForSetting:42];

  return (NSArray *)v3;
}

- (void)setMultitaskingDragExclusionRects:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  [v5 setObject:v4 forSetting:42];
}

- (unint64_t)_debugValidationOrientationMask
{
  v2 = [(FBSSettings *)self otherSettings];
  id v3 = [v2 objectForSetting:43];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (void)_setDebugValidationOrientationMask:(unint64_t)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  unint64_t v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v4 forSetting:43];
}

- (int64_t)playbackControlsState
{
  v2 = [(FBSSettings *)self otherSettings];
  id v3 = [v2 objectForSetting:44];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (void)setPlaybackControlsState:(int64_t)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  int64_t v4 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v4 forSetting:44];
}

- (BOOL)containsSearchView
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:48];

  return v3;
}

- (void)setContainsSearchView:(BOOL)a3
{
  id v3 = [(FBSSettings *)self otherSettings];
  [v3 setFlag:BSSettingFlagForBool() forSetting:48];
}

- (void)setDiscardSessionOnUserDisconnect:(BOOL)a3
{
  id v3 = [(FBSSettings *)self otherSettings];
  [v3 setFlag:BSSettingFlagForBool() forSetting:45];
}

- (BOOL)systemInputActive
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:49];

  return v3;
}

- (void)setSystemInputActive:(BOOL)a3
{
  id v3 = [(FBSSettings *)self otherSettings];
  [v3 setFlag:BSSettingFlagForBool() forSetting:49];
}

- (BOOL)settings:(id)a3 appendDescriptionToBuilder:(id)a4 forFlag:(int64_t)a5 object:(id)a6 ofSetting:(unint64_t)a7
{
  return UIApplicationSceneClientSettingAppendCustomDescription(a7, a4, a6);
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  return UIApplicationSceneClientSettingKeyDescription(a3);
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  return UIApplicationSceneClientSettingValueDescription(a5, a3, a4);
}

- (BOOL)isStatusBarForegroundTransparent
{
  return self->_statusBarForegroundTransparent;
}

- (int64_t)sceneActivationBias
{
  return self->_sceneActivationBias;
}

- (BOOL)discardSessionOnUserDisconnect
{
  return self->_discardSessionOnUserDisconnect;
}

@end