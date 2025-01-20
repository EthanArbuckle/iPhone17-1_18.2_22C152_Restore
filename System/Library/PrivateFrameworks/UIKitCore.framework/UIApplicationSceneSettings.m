@interface UIApplicationSceneSettings
- (BOOL)_containsSetting:(int64_t)a3;
- (BOOL)_debugValidationOrientationMaskEnabled;
- (BOOL)canShowAlerts;
- (BOOL)deviceOrientationEventsEnabled;
- (BOOL)enhancedWindowingEnabled;
- (BOOL)forcedStatusBarForegroundTransparent;
- (BOOL)idleModeEnabled;
- (BOOL)inLiveResize;
- (BOOL)isCapturingContentForAdditionalRenderingDestination;
- (BOOL)isUISubclass;
- (BOOL)screenBoundsIgnoresSceneOrientation;
- (BOOL)statusBarDisabled;
- (BOOL)underLock;
- (BSCornerRadiusConfiguration)cornerRadiusConfiguration;
- (BSInterfaceOrientationMapResolving)interfaceOrientationMapResolver;
- (CGRect)statusBarAvoidanceFrame;
- (NSNumber)forcedStatusBarStyle;
- (NSSet)targetOfEventDeferringEnvironments;
- (NSString)persistenceIdentifier;
- (UIEdgeInsets)peripheryInsets;
- (UIEdgeInsets)safeAreaInsetsLandscapeLeft;
- (UIEdgeInsets)safeAreaInsetsLandscapeRight;
- (UIEdgeInsets)safeAreaInsetsPortrait;
- (UIEdgeInsets)safeAreaInsetsPortraitUpsideDown;
- (double)angleFromHostReferenceUprightDirection;
- (double)defaultStatusBarHeightForOrientation:(int64_t)a3;
- (double)homeAffordanceOverlayAllowance;
- (double)statusBarHeight;
- (double)systemMinimumMargin;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
- (int64_t)accessibilityContrast;
- (int64_t)deviceOrientation;
- (int64_t)interfaceOrientationMode;
- (int64_t)pointerLockStatus;
- (int64_t)screenReferenceDisplayModeStatus;
- (int64_t)statusBarParts;
- (int64_t)userInterfaceStyle;
- (unint64_t)artworkSubtype;
- (unint64_t)deactivationReasons;
- (unint64_t)hostReferenceAngleMode;
- (unint64_t)scenePresenterRenderIdentifierForSnapshotting;
- (unint64_t)statusBarStyleOverridesToSuppress;
- (unsigned)hostContextIdentifierForSnapshotting;
@end

@implementation UIApplicationSceneSettings

- (BOOL)deviceOrientationEventsEnabled
{
  int64_t v3 = [(UIApplicationSceneSettings *)self interfaceOrientationMode];
  if (v3) {
    return v3 == 100;
  }
  v5 = [(FBSSettings *)self otherSettings];
  char v6 = [v5 BOOLForSetting:6];

  return v6;
}

- (BOOL)isUISubclass
{
  return 1;
}

- (BOOL)underLock
{
  int64_t v3 = [(FBSSettings *)self otherSettings];
  int v4 = [v3 BOOLForSetting:1];

  return v4 | ([(UIApplicationSceneSettings *)self deactivationReasons] >> 30) & 1;
}

- (int64_t)interfaceOrientationMode
{
  v2 = [(FBSSettings *)self otherSettings];
  int64_t v3 = [v2 objectForSetting:35];
  int64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (unint64_t)deactivationReasons
{
  v2 = [(FBSSettings *)self otherSettings];
  int64_t v3 = [v2 objectForSetting:3];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (double)defaultStatusBarHeightForOrientation:(int64_t)a3
{
  uint64_t v16 = v3;
  switch(a3)
  {
    case 1:
      v9 = [(FBSSettings *)self otherSettings];
      v10 = v9;
      uint64_t v11 = 25;
      goto LABEL_7;
    case 2:
      v9 = [(FBSSettings *)self otherSettings];
      v10 = v9;
      uint64_t v11 = 26;
      goto LABEL_7;
    case 3:
      v9 = [(FBSSettings *)self otherSettings];
      v10 = v9;
      uint64_t v11 = 28;
      goto LABEL_7;
    case 4:
      v9 = [(FBSSettings *)self otherSettings];
      v10 = v9;
      uint64_t v11 = 27;
LABEL_7:
      v13 = objc_msgSend(v9, "objectForSetting:", v11, v8, v7, v4, v16, v5, v6);
      [v13 doubleValue];
      double v15 = v14;

      double result = v15;
      break;
    default:
      double result = 0.0;
      break;
  }
  return result;
}

- (UIEdgeInsets)safeAreaInsetsPortrait
{
  v2 = [(FBSSettings *)self otherSettings];
  uint64_t v3 = [v2 objectForSetting:15];
  [v3 UIEdgeInsetsValue];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (double)homeAffordanceOverlayAllowance
{
  v2 = [(FBSSettings *)self otherSettings];
  uint64_t v3 = [v2 objectForSetting:22];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (int64_t)userInterfaceStyle
{
  v2 = [(FBSSettings *)self otherSettings];
  uint64_t v3 = [v2 objectForSetting:10];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (double)systemMinimumMargin
{
  v2 = [(FBSSettings *)self otherSettings];
  uint64_t v3 = [v2 objectForSetting:14];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  double v4 = [UIMutableApplicationSceneSettings alloc];
  return [(FBSSettings *)v4 initWithSettings:self];
}

- (BSCornerRadiusConfiguration)cornerRadiusConfiguration
{
  v2 = [(FBSSettings *)self otherSettings];
  uint64_t v3 = [v2 objectForSetting:23];

  return (BSCornerRadiusConfiguration *)v3;
}

- (BOOL)enhancedWindowingEnabled
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:41];

  return v3;
}

- (BOOL)isCapturingContentForAdditionalRenderingDestination
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:45];

  return v3;
}

- (int64_t)screenReferenceDisplayModeStatus
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:39];
  int64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (int64_t)deviceOrientation
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:13];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (BOOL)statusBarDisabled
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:9];

  return v3;
}

- (NSNumber)forcedStatusBarStyle
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:4];

  return (NSNumber *)v3;
}

- (BSInterfaceOrientationMapResolving)interfaceOrientationMapResolver
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:38];

  return (BSInterfaceOrientationMapResolving *)v3;
}

- (BOOL)_debugValidationOrientationMaskEnabled
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:37];

  return v3;
}

- (BOOL)_containsSetting:(int64_t)a3
{
  int64_t v4 = [(FBSSettings *)self otherSettings];
  double v5 = [v4 allSettings];
  LOBYTE(a3) = [v5 containsValue:a3];

  return a3;
}

- (NSString)persistenceIdentifier
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:29];

  return (NSString *)v3;
}

- (unint64_t)statusBarStyleOverridesToSuppress
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:2];
  unint64_t v4 = [v3 integerValue];

  return v4;
}

- (BOOL)forcedStatusBarForegroundTransparent
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:11];

  return v3;
}

- (UIEdgeInsets)peripheryInsets
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:12];
  [v3 UIEdgeInsetsValue];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (int64_t)statusBarParts
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:19];

  if (v3) {
    int64_t v4 = [v3 integerValue];
  }
  else {
    int64_t v4 = 0xFFFFLL;
  }

  return v4;
}

- (CGRect)statusBarAvoidanceFrame
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:20];
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

- (double)statusBarHeight
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:24];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (UIEdgeInsets)safeAreaInsetsLandscapeLeft
{
  char v3 = [(FBSSettings *)self otherSettings];
  double v4 = [v3 objectForSetting:16];

  if (v4
    || ([(FBSSettings *)self otherSettings],
        double v5 = objc_claimAutoreleasedReturnValue(),
        [v5 objectForSetting:18],
        double v4 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4))
  {
    [v4 UIEdgeInsetsValue];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    double v14 = v7;
    double v15 = v9;
    double v16 = v11;
    double v17 = v13;
  }
  else
  {
    [(UIApplicationSceneSettings *)self safeAreaInsetsPortrait];
  }
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (UIEdgeInsets)safeAreaInsetsPortraitUpsideDown
{
  char v3 = [(FBSSettings *)self otherSettings];
  double v4 = [v3 objectForSetting:17];

  if (v4) {
    [v4 UIEdgeInsetsValue];
  }
  else {
    [(UIApplicationSceneSettings *)self safeAreaInsetsPortrait];
  }
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;

  double v13 = v9;
  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (UIEdgeInsets)safeAreaInsetsLandscapeRight
{
  char v3 = [(FBSSettings *)self otherSettings];
  double v4 = [v3 objectForSetting:18];

  if (v4
    || ([(FBSSettings *)self otherSettings],
        double v5 = objc_claimAutoreleasedReturnValue(),
        [v5 objectForSetting:16],
        double v4 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4))
  {
    [v4 UIEdgeInsetsValue];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    double v14 = v7;
    double v15 = v9;
    double v16 = v11;
    double v17 = v13;
  }
  else
  {
    [(UIApplicationSceneSettings *)self safeAreaInsetsPortrait];
  }
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (BOOL)canShowAlerts
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:7];

  return v3;
}

- (BOOL)idleModeEnabled
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:8];

  return v3;
}

- (unint64_t)artworkSubtype
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:21];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (unsigned)hostContextIdentifierForSnapshotting
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:30];
  unsigned int v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (unint64_t)scenePresenterRenderIdentifierForSnapshotting
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:31];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (int64_t)accessibilityContrast
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:32];

  if (v3) {
    int64_t v4 = [v3 integerValue];
  }
  else {
    int64_t v4 = -1;
  }

  return v4;
}

- (int64_t)pointerLockStatus
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:33];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (BOOL)screenBoundsIgnoresSceneOrientation
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:42];

  return v3;
}

- (unint64_t)hostReferenceAngleMode
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:44];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (double)angleFromHostReferenceUprightDirection
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:43];

  if (v3)
  {
    [v3 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (NSSet)targetOfEventDeferringEnvironments
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:36];

  double v4 = -[_UIEventDeferringEnvironmentsContainer environments](v3);

  return (NSSet *)v4;
}

- (BOOL)inLiveResize
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:40];

  return v3;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  return UIApplicationSceneSettingKeyDescription(a3);
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  return UIApplicationSceneSettingValueDescription(a5, a3, a4);
}

@end