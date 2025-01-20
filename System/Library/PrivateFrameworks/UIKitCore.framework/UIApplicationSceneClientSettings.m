@interface UIApplicationSceneClientSettings
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
- (id)keyDescriptionForOtherSetting:(unint64_t)a3;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofOtherSetting:(unint64_t)a5;
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
@end

@implementation UIApplicationSceneClientSettings

- (unint64_t)proximityDetectionModes
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:15];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (BOOL)homeIndicatorAutoHidden
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:27];

  return v3;
}

- (int64_t)interfaceOrientation
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:12];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  int64_t v4 = [UIMutableApplicationSceneClientSettings alloc];
  return [(FBSSettings *)v4 initWithSettings:self];
}

- (FBSDisplayConfigurationRequest)displayConfigurationRequest
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:24];

  return (FBSDisplayConfigurationRequest *)v3;
}

- (BOOL)idleTimerDisabled
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:14];

  return v3;
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

- (unsigned)statusBarContextID
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:4];
  unsigned int v4 = [v3 unsignedIntValue];

  return v4;
}

- (BOOL)isUISubclass
{
  return 1;
}

- (NSDictionary)statusBarPartStyles
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:34];

  return (NSDictionary *)v3;
}

- (int64_t)statusBarStyle
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:1];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (int64_t)statusBarModernStyle
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:35];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (unint64_t)screenEdgesDeferringSystemGestures
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:26];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (NSString)canvasTitle
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:37];

  return (NSString *)v3;
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:13];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (NSData)activationConditionsData
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:38];

  return (NSData *)v3;
}

- (int64_t)backgroundStyle
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:20];
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

- (_UIPhysicalButtonConfigurationSet)physicalButtonConfigurations
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:47];

  return (_UIPhysicalButtonConfigurationSet *)v3;
}

- (BOOL)isReachabilitySupported
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:25];

  return v3;
}

- (NSArray)audioCategoriesDisablingVolumeHUD
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:31];

  return (NSArray *)v3;
}

- (BOOL)isStatusBarForegroundTransparent
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:3];

  return v3;
}

- (int64_t)defaultStatusBarStyle
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:5];
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

- (int64_t)notificationCenterRevealMode
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:18];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (int64_t)editingInteractionConfiguration
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:46];

  if (v3) {
    int64_t v4 = [v3 integerValue];
  }
  else {
    int64_t v4 = 1;
  }

  return v4;
}

- (BOOL)idleModeVisualEffectsEnabled
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:21];

  return v3;
}

- (int64_t)whitePointAdaptivityStyle
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:22];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (FBSDisplayMode)requestedDisplayMode
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:23];

  return (FBSDisplayMode *)v3;
}

- (BOOL)wantsExclusiveForeground
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:28];

  return v3;
}

- (int64_t)userInterfaceStyle
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:29];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (unint64_t)visibleMiniAlertCount
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:30];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (double)brightnessLevel
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:32];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (BOOL)disablesMirroring
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:33];

  return v3;
}

- (int64_t)sceneActivationBias
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:39];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (CGRect)screenFocusedFrame
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:40];
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

- (int64_t)preferredPointerLockStatus
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:41];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (NSArray)multitaskingDragExclusionRects
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:42];
  int64_t v4 = v3;
  if (!v3) {
    char v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  double v5 = v3;

  return v5;
}

- (unint64_t)_debugValidationOrientationMask
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:43];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (int64_t)playbackControlsState
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:44];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (BOOL)containsSearchView
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:48];

  return v3;
}

- (BOOL)discardSessionOnUserDisconnect
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:45];

  return v3;
}

- (BOOL)systemInputActive
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:49];

  return v3;
}

- (id)keyDescriptionForOtherSetting:(unint64_t)a3
{
  return UIApplicationSceneClientSettingKeyDescription(a3);
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofOtherSetting:(unint64_t)a5
{
  return UIApplicationSceneClientSettingValueDescription(a5, a3, a4);
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

@end