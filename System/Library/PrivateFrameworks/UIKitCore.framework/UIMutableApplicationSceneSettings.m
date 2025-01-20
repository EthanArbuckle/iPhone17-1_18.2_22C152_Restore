@interface UIMutableApplicationSceneSettings
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
- (id)copyWithZone:(_NSZone *)a3;
- (id)keyDescriptionForSetting:(unint64_t)a3;
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
- (void)_setDebugValidationOrientationMaskEnabled:(BOOL)a3;
- (void)setAccessibilityContrast:(int64_t)a3;
- (void)setAngleFromHostReferenceUprightDirection:(double)a3;
- (void)setArtworkSubtype:(unint64_t)a3;
- (void)setCanShowAlerts:(BOOL)a3;
- (void)setCornerRadiusConfiguration:(id)a3;
- (void)setDeactivationReasons:(unint64_t)a3;
- (void)setDefaultStatusBarHeight:(double)a3 forOrientation:(int64_t)a4;
- (void)setDeviceOrientation:(int64_t)a3;
- (void)setDeviceOrientationEventsEnabled:(BOOL)a3;
- (void)setEnhancedWindowingEnabled:(BOOL)a3;
- (void)setForcedStatusBarForegroundTransparent:(BOOL)a3;
- (void)setForcedStatusBarStyle:(id)a3;
- (void)setHomeAffordanceOverlayAllowance:(double)a3;
- (void)setHostContextIdentifierForSnapshotting:(unsigned int)a3;
- (void)setHostReferenceAngleMode:(unint64_t)a3;
- (void)setIdleModeEnabled:(BOOL)a3;
- (void)setInLiveResize:(BOOL)a3;
- (void)setInterfaceOrientationMapResolver:(id)a3;
- (void)setInterfaceOrientationMode:(int64_t)a3;
- (void)setIsCapturingContentForAdditionalRenderingDestination:(BOOL)a3;
- (void)setPeripheryInsets:(UIEdgeInsets)a3;
- (void)setPersistenceIdentifier:(id)a3;
- (void)setPointerLockStatus:(int64_t)a3;
- (void)setSafeAreaInsetsLandscapeLeft:(UIEdgeInsets)a3;
- (void)setSafeAreaInsetsLandscapeRight:(UIEdgeInsets)a3;
- (void)setSafeAreaInsetsPortrait:(UIEdgeInsets)a3;
- (void)setSafeAreaInsetsPortraitUpsideDown:(UIEdgeInsets)a3;
- (void)setScenePresenterRenderIdentifierForSnapshotting:(unint64_t)a3;
- (void)setScreenBoundsIgnoresSceneOrientation:(BOOL)a3;
- (void)setScreenReferenceDisplayModeStatus:(int64_t)a3;
- (void)setStatusBarAvoidanceFrame:(CGRect)a3;
- (void)setStatusBarDisabled:(BOOL)a3;
- (void)setStatusBarHeight:(double)a3;
- (void)setStatusBarParts:(int64_t)a3;
- (void)setStatusBarStyleOverridesToSuppress:(unint64_t)a3;
- (void)setSystemMinimumMargin:(double)a3;
- (void)setTargetOfEventDeferringEnvironments:(id)a3;
- (void)setUnderLock:(BOOL)a3;
- (void)setUserInterfaceStyle:(int64_t)a3;
@end

@implementation UIMutableApplicationSceneSettings

- (BOOL)isUISubclass
{
  return 1;
}

- (void)setArtworkSubtype:(unint64_t)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v4 forSetting:21];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [UIApplicationSceneSettings alloc];
  return [(FBSSettings *)v4 initWithSettings:self];
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  v4 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v4 forSetting:10];
}

- (void)setScreenReferenceDisplayModeStatus:(int64_t)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  v4 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v4 forSetting:39];
}

- (unint64_t)deactivationReasons
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:3];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (void)setDeactivationReasons:(unint64_t)a3
{
  if ((([(UIMutableApplicationSceneSettings *)self deactivationReasons] >> 11) & 1) != ((a3 >> 11) & 1)) {
    [(UIMutableApplicationSceneSettings *)self setOccluded:(a3 & 0x800) != 0];
  }
  id v6 = [(FBSSettings *)self otherSettings];
  id v5 = [NSNumber numberWithUnsignedInteger:a3];
  [v6 setObject:v5 forSetting:3];
}

- (void)setHomeAffordanceOverlayAllowance:(double)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  unint64_t v4 = [NSNumber numberWithDouble:a3];
  [v5 setObject:v4 forSetting:22];
}

- (void)setSafeAreaInsetsPortrait:(UIEdgeInsets)a3
{
  CGFloat right = a3.right;
  CGFloat bottom = a3.bottom;
  CGFloat left = a3.left;
  CGFloat top = a3.top;
  v7 = [(FBSSettings *)self otherSettings];
  *(CGFloat *)v9 = top;
  *(CGFloat *)&v9[1] = left;
  *(CGFloat *)&v9[2] = bottom;
  *(CGFloat *)&v9[3] = right;
  v8 = [MEMORY[0x1E4F29238] valueWithBytes:v9 objCType:"{UIEdgeInsets=dddd}"];
  [v7 setObject:v8 forSetting:15];
}

- (void)setPeripheryInsets:(UIEdgeInsets)a3
{
  CGFloat right = a3.right;
  CGFloat bottom = a3.bottom;
  CGFloat left = a3.left;
  CGFloat top = a3.top;
  v7 = [(FBSSettings *)self otherSettings];
  *(CGFloat *)v9 = top;
  *(CGFloat *)&v9[1] = left;
  *(CGFloat *)&v9[2] = bottom;
  *(CGFloat *)&v9[3] = right;
  v8 = [MEMORY[0x1E4F29238] valueWithBytes:v9 objCType:"{UIEdgeInsets=dddd}"];
  [v7 setObject:v8 forSetting:12];
}

- (BOOL)isCapturingContentForAdditionalRenderingDestination
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:45];

  return v3;
}

- (void)setDefaultStatusBarHeight:(double)a3 forOrientation:(int64_t)a4
{
  switch(a4)
  {
    case 1:
      id v10 = [(FBSSettings *)self otherSettings];
      id v6 = [NSNumber numberWithDouble:a3];
      v7 = v10;
      v8 = v6;
      uint64_t v9 = 25;
      goto LABEL_6;
    case 2:
      id v10 = [(FBSSettings *)self otherSettings];
      id v6 = [NSNumber numberWithDouble:a3];
      v7 = v10;
      v8 = v6;
      uint64_t v9 = 26;
      goto LABEL_6;
    case 3:
      id v10 = [(FBSSettings *)self otherSettings];
      id v6 = [NSNumber numberWithDouble:a3];
      v7 = v10;
      v8 = v6;
      uint64_t v9 = 28;
      goto LABEL_6;
    case 4:
      id v10 = [(FBSSettings *)self otherSettings];
      id v6 = [NSNumber numberWithDouble:a3];
      v7 = v10;
      v8 = v6;
      uint64_t v9 = 27;
LABEL_6:
      [v7 setObject:v8 forSetting:v9];

      break;
    default:
      return;
  }
}

- (void)setEnhancedWindowingEnabled:(BOOL)a3
{
  id v3 = [(FBSSettings *)self otherSettings];
  [v3 setFlag:BSSettingFlagForBool() forSetting:41];
}

- (void)setIsCapturingContentForAdditionalRenderingDestination:(BOOL)a3
{
  id v3 = [(FBSSettings *)self otherSettings];
  [v3 setFlag:BSSettingFlagForBool() forSetting:45];
}

- (void)setScreenBoundsIgnoresSceneOrientation:(BOOL)a3
{
  id v3 = [(FBSSettings *)self otherSettings];
  [v3 setFlag:BSSettingFlagForBool() forSetting:42];
}

- (void)setCanShowAlerts:(BOOL)a3
{
  id v3 = [(FBSSettings *)self otherSettings];
  [v3 setFlag:BSSettingFlagForBool() forSetting:7];
}

- (void)setInLiveResize:(BOOL)a3
{
  id v3 = [(FBSSettings *)self otherSettings];
  [v3 setFlag:BSSettingFlagForBool() forSetting:40];
}

- (void)setInterfaceOrientationMode:(int64_t)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  uint64_t v4 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v4 forSetting:35];
}

- (void)setScenePresenterRenderIdentifierForSnapshotting:(unint64_t)a3
{
  if (a3)
  {
    objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = 0;
  }
  uint64_t v4 = [(FBSSettings *)self otherSettings];
  [v4 setObject:v5 forSetting:31];
}

- (void)setTargetOfEventDeferringEnvironments:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4 && [v4 count]) {
    id v5 = -[_UIEventDeferringEnvironmentsContainer _initWithEnvironments:]([_UIEventDeferringEnvironmentsContainer alloc], v7);
  }
  else {
    id v5 = 0;
  }
  id v6 = [(FBSSettings *)self otherSettings];
  [v6 setObject:v5 forSetting:36];
}

- (void)setPersistenceIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  [v5 setObject:v4 forSetting:29];
}

- (void)setInterfaceOrientationMapResolver:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  [v5 setObject:v4 forSetting:38];
}

- (void)setCornerRadiusConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  [v5 setObject:v4 forSetting:23];
}

- (void)setStatusBarParts:(int64_t)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  id v4 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v4 forSetting:19];
}

- (void)setHostReferenceAngleMode:(unint64_t)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v4 forSetting:44];
}

- (void)setDeviceOrientation:(int64_t)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  id v4 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v4 forSetting:13];
}

- (void)setHostContextIdentifierForSnapshotting:(unsigned int)a3
{
  if (a3)
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = 0;
  }
  id v4 = [(FBSSettings *)self otherSettings];
  [v4 setObject:v5 forSetting:30];
}

- (void)setAngleFromHostReferenceUprightDirection:(double)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  id v4 = [NSNumber numberWithDouble:a3];
  [v5 setObject:v4 forSetting:43];
}

- (void)setStatusBarAvoidanceFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v7 = [(FBSSettings *)self otherSettings];
  *(CGFloat *)uint64_t v9 = x;
  *(CGFloat *)&v9[1] = y;
  *(CGFloat *)&v9[2] = width;
  *(CGFloat *)&v9[3] = height;
  v8 = [MEMORY[0x1E4F29238] valueWithBytes:v9 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  [v7 setObject:v8 forSetting:20];
}

- (NSString)persistenceIdentifier
{
  v2 = [(FBSSettings *)self otherSettings];
  id v3 = [v2 objectForSetting:29];

  return (NSString *)v3;
}

- (BOOL)underLock
{
  id v3 = [(FBSSettings *)self otherSettings];
  int v4 = [v3 BOOLForSetting:1];

  return v4 | ([(UIMutableApplicationSceneSettings *)self deactivationReasons] >> 30) & 1;
}

- (void)setUnderLock:(BOOL)a3
{
  id v3 = [(FBSSettings *)self otherSettings];
  [v3 setFlag:BSSettingFlagForBool() forSetting:1];
}

- (unint64_t)statusBarStyleOverridesToSuppress
{
  v2 = [(FBSSettings *)self otherSettings];
  id v3 = [v2 objectForSetting:2];
  unint64_t v4 = [v3 integerValue];

  return v4;
}

- (void)setStatusBarStyleOverridesToSuppress:(unint64_t)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  unint64_t v4 = [NSNumber numberWithUnsignedLongLong:a3];
  [v5 setObject:v4 forSetting:2];
}

- (int64_t)userInterfaceStyle
{
  v2 = [(FBSSettings *)self otherSettings];
  id v3 = [v2 objectForSetting:10];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (NSNumber)forcedStatusBarStyle
{
  v2 = [(FBSSettings *)self otherSettings];
  id v3 = [v2 objectForSetting:4];

  return (NSNumber *)v3;
}

- (void)setForcedStatusBarStyle:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  [v5 setObject:v4 forSetting:4];
}

- (BOOL)forcedStatusBarForegroundTransparent
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:11];

  return v3;
}

- (void)setForcedStatusBarForegroundTransparent:(BOOL)a3
{
  id v3 = [(FBSSettings *)self otherSettings];
  [v3 setFlag:BSSettingFlagForBool() forSetting:11];
}

- (UIEdgeInsets)peripheryInsets
{
  v2 = [(FBSSettings *)self otherSettings];
  id v3 = [v2 objectForSetting:12];
  [v3 UIEdgeInsetsValue];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.CGFloat right = v15;
  result.CGFloat bottom = v14;
  result.CGFloat left = v13;
  result.CGFloat top = v12;
  return result;
}

- (int64_t)statusBarParts
{
  v2 = [(FBSSettings *)self otherSettings];
  id v3 = [v2 objectForSetting:19];

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
  id v3 = [v2 objectForSetting:20];
  [v3 CGRectValue];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (double)statusBarHeight
{
  v2 = [(FBSSettings *)self otherSettings];
  id v3 = [v2 objectForSetting:24];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (void)setStatusBarHeight:(double)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  double v4 = [NSNumber numberWithDouble:a3];
  [v5 setObject:v4 forSetting:24];
}

- (double)defaultStatusBarHeightForOrientation:(int64_t)a3
{
  uint64_t v16 = v3;
  switch(a3)
  {
    case 1:
      double v9 = [(FBSSettings *)self otherSettings];
      double v10 = v9;
      uint64_t v11 = 25;
      goto LABEL_7;
    case 2:
      double v9 = [(FBSSettings *)self otherSettings];
      double v10 = v9;
      uint64_t v11 = 26;
      goto LABEL_7;
    case 3:
      double v9 = [(FBSSettings *)self otherSettings];
      double v10 = v9;
      uint64_t v11 = 28;
      goto LABEL_7;
    case 4:
      double v9 = [(FBSSettings *)self otherSettings];
      double v10 = v9;
      uint64_t v11 = 27;
LABEL_7:
      double v13 = objc_msgSend(v9, "objectForSetting:", v11, v8, v7, v4, v16, v5, v6);
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

- (double)systemMinimumMargin
{
  v2 = [(FBSSettings *)self otherSettings];
  uint64_t v3 = [v2 objectForSetting:14];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (void)setSystemMinimumMargin:(double)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  double v4 = [NSNumber numberWithDouble:a3];
  [v5 setObject:v4 forSetting:14];
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
  result.CGFloat right = v15;
  result.CGFloat bottom = v14;
  result.CGFloat left = v13;
  result.CGFloat top = v12;
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

- (UIEdgeInsets)safeAreaInsetsLandscapeLeft
{
  uint64_t v3 = [(FBSSettings *)self otherSettings];
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
    [(UIMutableApplicationSceneSettings *)self safeAreaInsetsPortrait];
  }
  result.CGFloat right = v17;
  result.CGFloat bottom = v16;
  result.CGFloat left = v15;
  result.CGFloat top = v14;
  return result;
}

- (void)setSafeAreaInsetsLandscapeLeft:(UIEdgeInsets)a3
{
  CGFloat right = a3.right;
  CGFloat bottom = a3.bottom;
  CGFloat left = a3.left;
  CGFloat top = a3.top;
  double v7 = [(FBSSettings *)self otherSettings];
  *(CGFloat *)double v9 = top;
  *(CGFloat *)&v9[1] = left;
  *(CGFloat *)&v9[2] = bottom;
  *(CGFloat *)&v9[3] = right;
  double v8 = [MEMORY[0x1E4F29238] valueWithBytes:v9 objCType:"{UIEdgeInsets=dddd}"];
  [v7 setObject:v8 forSetting:16];
}

- (UIEdgeInsets)safeAreaInsetsPortraitUpsideDown
{
  uint64_t v3 = [(FBSSettings *)self otherSettings];
  double v4 = [v3 objectForSetting:17];

  if (v4) {
    [v4 UIEdgeInsetsValue];
  }
  else {
    [(UIMutableApplicationSceneSettings *)self safeAreaInsetsPortrait];
  }
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;

  double v13 = v9;
  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  result.CGFloat right = v16;
  result.CGFloat bottom = v15;
  result.CGFloat left = v14;
  result.CGFloat top = v13;
  return result;
}

- (void)setSafeAreaInsetsPortraitUpsideDown:(UIEdgeInsets)a3
{
  CGFloat right = a3.right;
  CGFloat bottom = a3.bottom;
  CGFloat left = a3.left;
  CGFloat top = a3.top;
  double v7 = [(FBSSettings *)self otherSettings];
  *(CGFloat *)double v9 = top;
  *(CGFloat *)&v9[1] = left;
  *(CGFloat *)&v9[2] = bottom;
  *(CGFloat *)&v9[3] = right;
  double v8 = [MEMORY[0x1E4F29238] valueWithBytes:v9 objCType:"{UIEdgeInsets=dddd}"];
  [v7 setObject:v8 forSetting:17];
}

- (UIEdgeInsets)safeAreaInsetsLandscapeRight
{
  uint64_t v3 = [(FBSSettings *)self otherSettings];
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
    [(UIMutableApplicationSceneSettings *)self safeAreaInsetsPortrait];
  }
  result.CGFloat right = v17;
  result.CGFloat bottom = v16;
  result.CGFloat left = v15;
  result.CGFloat top = v14;
  return result;
}

- (void)setSafeAreaInsetsLandscapeRight:(UIEdgeInsets)a3
{
  CGFloat right = a3.right;
  CGFloat bottom = a3.bottom;
  CGFloat left = a3.left;
  CGFloat top = a3.top;
  double v7 = [(FBSSettings *)self otherSettings];
  *(CGFloat *)double v9 = top;
  *(CGFloat *)&v9[1] = left;
  *(CGFloat *)&v9[2] = bottom;
  *(CGFloat *)&v9[3] = right;
  double v8 = [MEMORY[0x1E4F29238] valueWithBytes:v9 objCType:"{UIEdgeInsets=dddd}"];
  [v7 setObject:v8 forSetting:18];
}

- (BSCornerRadiusConfiguration)cornerRadiusConfiguration
{
  v2 = [(FBSSettings *)self otherSettings];
  uint64_t v3 = [v2 objectForSetting:23];

  return (BSCornerRadiusConfiguration *)v3;
}

- (BOOL)deviceOrientationEventsEnabled
{
  int64_t v3 = [(UIMutableApplicationSceneSettings *)self interfaceOrientationMode];
  if (v3) {
    return v3 == 100;
  }
  double v5 = [(FBSSettings *)self otherSettings];
  char v6 = [v5 BOOLForSetting:6];

  return v6;
}

- (void)setDeviceOrientationEventsEnabled:(BOOL)a3
{
  id v3 = [(FBSSettings *)self otherSettings];
  [v3 setFlag:BSSettingFlagForBool() forSetting:6];
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

- (void)setIdleModeEnabled:(BOOL)a3
{
  id v3 = [(FBSSettings *)self otherSettings];
  [v3 setFlag:BSSettingFlagForBool() forSetting:8];
}

- (BOOL)statusBarDisabled
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:9];

  return v3;
}

- (void)setStatusBarDisabled:(BOOL)a3
{
  id v3 = [(FBSSettings *)self otherSettings];
  [v3 setFlag:BSSettingFlagForBool() forSetting:9];
}

- (int64_t)deviceOrientation
{
  v2 = [(FBSSettings *)self otherSettings];
  id v3 = [v2 objectForSetting:13];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (unint64_t)artworkSubtype
{
  v2 = [(FBSSettings *)self otherSettings];
  id v3 = [v2 objectForSetting:21];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (unsigned)hostContextIdentifierForSnapshotting
{
  v2 = [(FBSSettings *)self otherSettings];
  id v3 = [v2 objectForSetting:30];
  unsigned int v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (unint64_t)scenePresenterRenderIdentifierForSnapshotting
{
  v2 = [(FBSSettings *)self otherSettings];
  id v3 = [v2 objectForSetting:31];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (int64_t)accessibilityContrast
{
  v2 = [(FBSSettings *)self otherSettings];
  id v3 = [v2 objectForSetting:32];

  if (v3) {
    int64_t v4 = [v3 integerValue];
  }
  else {
    int64_t v4 = -1;
  }

  return v4;
}

- (void)setAccessibilityContrast:(int64_t)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  int64_t v4 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v4 forSetting:32];
}

- (int64_t)pointerLockStatus
{
  v2 = [(FBSSettings *)self otherSettings];
  id v3 = [v2 objectForSetting:33];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (void)setPointerLockStatus:(int64_t)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  int64_t v4 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v4 forSetting:33];
}

- (int64_t)interfaceOrientationMode
{
  v2 = [(FBSSettings *)self otherSettings];
  id v3 = [v2 objectForSetting:35];
  int64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (BOOL)screenBoundsIgnoresSceneOrientation
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:42];

  return v3;
}

- (int64_t)screenReferenceDisplayModeStatus
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:39];
  int64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (BOOL)enhancedWindowingEnabled
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:41];

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

- (BOOL)_debugValidationOrientationMaskEnabled
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:37];

  return v3;
}

- (void)_setDebugValidationOrientationMaskEnabled:(BOOL)a3
{
  id v3 = [(FBSSettings *)self otherSettings];
  [v3 setFlag:BSSettingFlagForBool() forSetting:37];
}

- (BSInterfaceOrientationMapResolving)interfaceOrientationMapResolver
{
  v2 = [(FBSSettings *)self otherSettings];
  id v3 = [v2 objectForSetting:38];

  return (BSInterfaceOrientationMapResolving *)v3;
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