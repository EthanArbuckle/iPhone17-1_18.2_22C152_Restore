@interface PRPosterEnvironmentImpl
- (BOOL)isDepthEffectDisabled;
- (BOOL)isDepthEffectDisallowed;
- (BOOL)isFloatingViewSnapshot;
- (BOOL)isLowLuminance;
- (BOOL)isParallaxEnabled;
- (BOOL)isPreview;
- (BOOL)isSnapshot;
- (BOOL)wakeSourceIsSwipeToUnlock;
- (CGRect)_normalizedBounds:(CGRect)a3;
- (CGRect)contentCutoutBounds;
- (CGRect)floatingObscurableBounds;
- (CGRect)screenBounds;
- (CGRect)titleBoundsForLayout:(unint64_t)a3;
- (CGSize)desiredContentSize;
- (CGSize)minimumContentSize;
- (NSString)description;
- (NSString)role;
- (PRMutablePosterConfiguration)targetConfiguration;
- (PRPosterAmbientEnvironment)ambientEnvironment;
- (PRPosterConfigurableOptions)sourceConfigurableOptions;
- (PRPosterContents)contents;
- (PRPosterEnvironmentContext)context;
- (PRPosterEnvironmentImpl)initWithSceneSettings:(id)a3 traitCollection:(id)a4 targetConfig:(id)a5 extensionBundleURL:(id)a6;
- (PRTimeFontConfiguration)sourceTimeFontConfiguration;
- (UIColor)caseColor;
- (UITraitCollection)traitCollection;
- (double)backlightProgress;
- (double)linearBacklightProgress;
- (double)unlockProgress;
- (id)_targetConfiguredProperties;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)boundingShape;
- (int64_t)deviceOrientation;
- (int64_t)luminance;
- (int64_t)mode;
- (int64_t)userInterfaceStyle;
- (unint64_t)significantEventsCounter;
- (unint64_t)titleAlignment;
- (void)_appendDescriptionToStream:(id)a3;
- (void)_applyToSceneSettings:(id)a3;
- (void)_lock_hydratePosterContents:(id *)a3 sourceConfigurableOptions:(id *)a4 sourceTitleFontConfiguration:(id *)a5 targetConfigurableProperties:(id *)a6;
- (void)invalidate;
- (void)setBacklightProgress:(double)a3;
- (void)setLinearBacklightProgress:(double)a3;
- (void)setUnlockProgress:(double)a3;
- (void)setWakeSourceIsSwipeToUnlock:(BOOL)a3;
@end

@implementation PRPosterEnvironmentImpl

- (PRPosterEnvironmentImpl)initWithSceneSettings:(id)a3 traitCollection:(id)a4 targetConfig:(id)a5 extensionBundleURL:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v27.receiver = self;
  v27.super_class = (Class)PRPosterEnvironmentImpl;
  v14 = [(PRPosterEnvironmentImpl *)&v27 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    settings = v14->_settings;
    v14->_settings = (FBSSceneSettings *)v15;

    uint64_t v17 = [v11 copy];
    traitCollection = v14->_traitCollection;
    v14->_traitCollection = (UITraitCollection *)v17;

    uint64_t v19 = [v13 copy];
    bundleURL = v14->_bundleURL;
    v14->_bundleURL = (NSURL *)v19;

    objc_storeStrong((id *)&v14->_targetConfig, a5);
    v14->_lock._os_unfair_lock_opaque = 0;
    uint64_t v21 = [(PRPosterEnvironmentImpl *)v14 luminance];
    double v22 = 0.0;
    if (v21 == 2) {
      double v22 = 1.0;
    }
    v14->_backlightProgress = v22;
    v14->_linearBacklightProgress = v22;
    objc_msgSend(v10, "pr_unlockProgress");
    v14->_unlockProgress = v23;
    v14->_wakeSourceIsSwipeToUnlock = objc_msgSend(v10, "pr_wakeSourceIsSwipeToUnlock");
    v24 = [[PREditorElementLayoutController alloc] initWithTraitEnvironment:v14];
    layoutController = v14->_layoutController;
    v14->_layoutController = v24;

    v14->_boundingShape = PRPosterBoundingShapeFromPUIPosterBoundingShape(objc_msgSend(v10, "pui_posterBoundingShape"));
  }

  return v14;
}

- (CGRect)screenBounds
{
  [(FBSSceneSettings *)self->_settings bounds];
  double v4 = v3;
  double v6 = v5;
  int IsActive = PUIDynamicRotationIsActive();
  settings = self->_settings;
  if (IsActive)
  {
    if ((unint64_t)([(FBSSceneSettings *)settings pui_deviceOrientation] - 3) >= 2)
    {
LABEL_3:
      if (v6 >= v4) {
        double v9 = v4;
      }
      else {
        double v9 = v6;
      }
      if (v6 >= v4) {
        double v10 = v6;
      }
      else {
        double v10 = v4;
      }
      goto LABEL_16;
    }
  }
  else
  {
    [(FBSSceneSettings *)settings interfaceOrientation];
    if (!BSInterfaceOrientationIsLandscape()) {
      goto LABEL_3;
    }
  }
  if (v6 >= v4) {
    double v9 = v6;
  }
  else {
    double v9 = v4;
  }
  if (v6 >= v4) {
    double v10 = v4;
  }
  else {
    double v10 = v6;
  }
LABEL_16:
  double v11 = 0.0;
  double v12 = 0.0;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (UIColor)caseColor
{
  v2 = [(FBSSceneSettings *)self->_settings pr_caseColor];
  double v3 = [v2 UIColor];

  return (UIColor *)v3;
}

- (int64_t)userInterfaceStyle
{
  v2 = [(PRPosterEnvironmentImpl *)self traitCollection];
  int64_t v3 = [v2 userInterfaceStyle];

  return v3;
}

- (int64_t)deviceOrientation
{
  return [(FBSSceneSettings *)self->_settings pui_deviceOrientation];
}

- (CGRect)contentCutoutBounds
{
  if ([(FBSSceneSettings *)self->_settings pui_isComplicationRowConfigured])uint64_t v3 = 11; {
  else
  }
    uint64_t v3 = 3;
  [(PRPosterEnvironmentImpl *)self screenBounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  -[PREditorElementLayoutController frameForElements:variant:withBoundingRect:](self->_layoutController, "frameForElements:variant:withBoundingRect:", v3, 1);
  double MaxY = CGRectGetMaxY(v20);
  v21.origin.x = v5;
  v21.origin.y = v7;
  v21.size.width = v9;
  v21.size.height = v11;
  double Width = CGRectGetWidth(v21);
  v22.origin.x = v5;
  v22.origin.y = v7;
  v22.size.width = v9;
  v22.size.height = v11;
  double v14 = CGRectGetHeight(v22) - MaxY;
  -[PRPosterEnvironmentImpl _normalizedBounds:](self, "_normalizedBounds:", 0.0, MaxY, Width, v14);
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)floatingObscurableBounds
{
  [(PRPosterEnvironmentImpl *)self screenBounds];
  CGFloat v22 = v3;
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  -[PREditorElementLayoutController frameForElements:variant:withBoundingRect:](self->_layoutController, "frameForElements:variant:withBoundingRect:", 1, 1);
  CGFloat x = v24.origin.x;
  CGFloat y = v24.origin.y;
  CGFloat width = v24.size.width;
  CGFloat height = v24.size.height;
  double MinY = CGRectGetMinY(v24);
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  double v15 = MinY + CGRectGetHeight(v25) * 0.75;
  v26.origin.CGFloat x = v22;
  v26.origin.CGFloat y = v5;
  v26.size.CGFloat width = v7;
  v26.size.CGFloat height = v9;
  double v16 = CGRectGetWidth(v26);
  v27.origin.CGFloat x = v22;
  v27.origin.CGFloat y = v5;
  v27.size.CGFloat width = v7;
  v27.size.CGFloat height = v9;
  double v17 = CGRectGetHeight(v27) - v15;
  -[PRPosterEnvironmentImpl _normalizedBounds:](self, "_normalizedBounds:", 0.0, v15, v16, v17);
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (CGRect)titleBoundsForLayout:(unint64_t)a3
{
  [(PRPosterEnvironmentImpl *)self screenBounds];
  CGFloat v5 = -[PREditorElementLayoutController frameAttributesForElements:variant:titleLayout:withBoundingRect:](self->_layoutController, "frameAttributesForElements:variant:titleLayout:withBoundingRect:", 1, 1, a3);
  [v5 rect];
  -[PRPosterEnvironmentImpl _normalizedBounds:](self, "_normalizedBounds:");
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (CGRect)_normalizedBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(PRPosterEnvironmentImpl *)self screenBounds];
  CGFloat v6 = v17.origin.x;
  CGFloat v7 = v17.origin.y;
  CGFloat v8 = v17.size.width;
  CGFloat v9 = v17.size.height;
  double v10 = CGRectGetWidth(v17);
  v18.origin.double x = v6;
  v18.origin.double y = v7;
  v18.size.double width = v8;
  v18.size.double height = v9;
  CGFloat v11 = CGRectGetHeight(v18);
  double v12 = y / v11;
  double v13 = width / v10;
  double v14 = height / v11;
  double v15 = x / v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v15;
  return result;
}

- (BOOL)isDepthEffectDisallowed
{
  return [(FBSSceneSettings *)self->_settings pr_isDepthEffectDisallowed];
}

- (BOOL)isDepthEffectDisabled
{
  v2 = [(PRPosterEnvironmentImpl *)self targetConfiguredProperties];
  double v3 = v2;
  if (v2)
  {
    double v4 = [v2 renderingConfiguration];
    char v5 = [v4 isDepthEffectDisabled];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (NSString)role
{
  v2 = [(PRPosterEnvironmentImpl *)self contents];
  double v3 = [v2 role];

  return (NSString *)v3;
}

- (PRPosterEnvironmentContext)context
{
  return (PRPosterEnvironmentContext *)+[PRPosterEnvironmentContext environmentContextForSettings:self->_settings];
}

- (PRTimeFontConfiguration)sourceTimeFontConfiguration
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = 0;
  [(PRPosterEnvironmentImpl *)self _lock_hydratePosterContents:0 sourceConfigurableOptions:0 sourceTitleFontConfiguration:&v6 targetConfigurableProperties:0];
  id v4 = v6;
  os_unfair_lock_unlock(p_lock);
  return (PRTimeFontConfiguration *)v4;
}

- (BOOL)isPreview
{
  [(FBSSceneSettings *)self->_settings pui_content];
  return PUIRenderingContentIsPreview();
}

- (BOOL)isSnapshot
{
  return [(FBSSceneSettings *)self->_settings pui_isSnapshot];
}

- (BOOL)isLowLuminance
{
  return [(PRPosterEnvironmentImpl *)self luminance] == 1;
}

- (int64_t)luminance
{
  return [(FBSSceneSettings *)self->_settings pr_adjustedLuminance];
}

- (unint64_t)significantEventsCounter
{
  return [(FBSSceneSettings *)self->_settings pui_significantEventsCounter];
}

- (PRPosterContents)contents
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = 0;
  [(PRPosterEnvironmentImpl *)self _lock_hydratePosterContents:&v6 sourceConfigurableOptions:0 sourceTitleFontConfiguration:0 targetConfigurableProperties:0];
  id v4 = v6;
  os_unfair_lock_unlock(p_lock);
  return (PRPosterContents *)v4;
}

- (BOOL)isParallaxEnabled
{
  return [(FBSSceneSettings *)self->_settings pr_isParallaxEffectivelyEnabled];
}

- (CGSize)desiredContentSize
{
  [(PRPosterEnvironmentImpl *)self screenBounds];
  if (v3 >= v4) {
    double v5 = v3;
  }
  else {
    double v5 = v4;
  }
  if ([(FBSSceneSettings *)self->_settings pr_isParallaxEffectivelyEnabled])
  {
    [(UITraitCollection *)self->_traitCollection userInterfaceIdiom];
    PUIPosterParallaxDesiredOverhangForDeviceClass();
    double v7 = v5 + v6 + v6;
    double v5 = v5 + v8 + v8;
  }
  else
  {
    double v7 = v5;
  }
  double v9 = v5;
  result.double height = v9;
  result.double width = v7;
  return result;
}

- (CGSize)minimumContentSize
{
  [(PRPosterEnvironmentImpl *)self screenBounds];
  double v4 = v3;
  double v6 = v5;
  if ([(FBSSceneSettings *)self->_settings pr_isParallaxEffectivelyEnabled])
  {
    [(UITraitCollection *)self->_traitCollection userInterfaceIdiom];
    PUIPosterParallaxRequiredOverhangForDeviceClass();
    double v4 = v4 + v7 + v7;
    double v6 = v6 + v8 + v8;
  }
  double v9 = v4;
  double v10 = v6;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (unint64_t)titleAlignment
{
  return [(FBSSceneSettings *)self->_settings pr_titleAlignment];
}

- (PRPosterAmbientEnvironment)ambientEnvironment
{
  if (objc_opt_respondsToSelector())
  {
    double v3 = [PRPosterAmbientEnvironmentImpl alloc];
    double v4 = [(PRPosterEnvironmentImpl *)self traitCollection];
    double v5 = [(PRPosterAmbientEnvironmentImpl *)v3 initWithTraitCollection:v4];
  }
  else
  {
    double v5 = 0;
  }
  return (PRPosterAmbientEnvironment *)v5;
}

- (BOOL)isFloatingViewSnapshot
{
  return [(FBSSceneSettings *)self->_settings pui_isFloatingLayerSnapshot];
}

- (PRPosterConfigurableOptions)sourceConfigurableOptions
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = 0;
  [(PRPosterEnvironmentImpl *)self _lock_hydratePosterContents:0 sourceConfigurableOptions:&v6 sourceTitleFontConfiguration:0 targetConfigurableProperties:0];
  id v4 = v6;
  os_unfair_lock_unlock(p_lock);
  return (PRPosterConfigurableOptions *)v4;
}

- (id)_targetConfiguredProperties
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_targetConfiguredProperties = self->_lock_targetConfiguredProperties;
  if (!lock_targetConfiguredProperties)
  {
    id obj = 0;
    [(PRPosterEnvironmentImpl *)self _lock_hydratePosterContents:0 sourceConfigurableOptions:0 sourceTitleFontConfiguration:0 targetConfigurableProperties:&obj];
    objc_storeStrong((id *)&self->_lock_targetConfiguredProperties, obj);
    lock_targetConfiguredProperties = self->_lock_targetConfiguredProperties;
  }
  double v5 = lock_targetConfiguredProperties;
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (void)_lock_hydratePosterContents:(id *)a3 sourceConfigurableOptions:(id *)a4 sourceTitleFontConfiguration:(id *)a5 targetConfigurableProperties:(id *)a6
{
  id v58 = [(FBSSceneSettings *)self->_settings pui_posterContents];
  double v10 = [v58 identity];
  CGFloat v11 = [(FBSSceneSettings *)self->_settings pr_posterConfigurableOptions];
  double v12 = [v10 role];
  if (([v12 isEqualToString:*MEMORY[0x1E4F924F0]] & 1) != 0
    || [v12 isEqualToString:*MEMORY[0x1E4F924E8]])
  {
    double v13 = a4;
    double v14 = [PRPosterConfiguredProperties alloc];
    double v15 = [(FBSSceneSettings *)self->_settings pr_posterTitleStyleConfiguration];
    uint64_t v16 = [(PRPosterConfiguredProperties *)v14 initWithTitleStyleConfiguration:v15 focusConfiguration:0 complicationLayout:0 renderingConfiguration:0 homeScreenConfiguration:0 colorVariationsConfiguration:0 quickActionsConfiguration:0 suggestionMetadata:0 otherMetadata:0 userInfo:0];
LABEL_4:
    uint64_t v57 = v16;

    goto LABEL_5;
  }
  double v13 = a4;
  if ([v12 isEqualToString:*MEMORY[0x1E4F924E0]])
  {
    v29 = [PRPosterConfiguredProperties alloc];
    double v15 = [(FBSSceneSettings *)self->_settings pr_posterAmbientConfiguration];
    uint64_t v16 = [(PRPosterConfiguredProperties *)v29 initWithAmbientConfiguration:v15 widgetLayout:0 otherMetadata:0 userInfo:0];
    goto LABEL_4;
  }
  uint64_t v57 = +[PRPosterConfiguredProperties defaultConfiguredPropertiesForRole:v12];
LABEL_5:
  uint64_t v17 = [v10 type];
  uint64_t v18 = v17;
  v55 = v12;
  if (self->_lock_sourceContents) {
    goto LABEL_6;
  }
  unint64_t v23 = v17 - 1;
  CGRect v24 = [0 _path];
  CGRect v25 = v24;
  if (v23 <= 2)
  {
    char v26 = [v24 isEqual:v58];

    if (v26) {
      goto LABEL_6;
    }
    if (v18 == 3)
    {
      double v19 = a6;
      CGRect v27 = [[PRPosterConfiguration alloc] _initWithPath:v58];
      lock_sourceContents = self->_lock_sourceContents;
      self->_lock_sourceContents = v27;

      p_lock_sourceConfigurableOptions = (id *)&self->_lock_sourceConfigurableOptions;
LABEL_14:
      double v21 = (void *)v57;
      goto LABEL_24;
    }
    v54 = [[PRPosterDescriptor alloc] _initWithPath:v58];
    v34 = self->_lock_sourceContents;
    self->_lock_sourceContents = v54;
LABEL_47:

    goto LABEL_6;
  }
  v30 = [v24 serverIdentity];

  if (v30)
  {
    v31 = self->_lock_sourceContents;
    self->_lock_sourceContents = 0;
  }
  if (!self->_lock_sourceContents)
  {
    v32 = (void *)MEMORY[0x1E4F924B8];
    v33 = [v10 role];
    v34 = [v32 temporaryPathForRole:v33];

    v35 = [[PRPosterConfiguration alloc] _initWithPath:v34];
    v36 = self->_lock_sourceContents;
    self->_lock_sourceContents = v35;

    [v34 invalidate];
    goto LABEL_47;
  }
LABEL_6:
  double v19 = a6;
  p_lock_sourceConfigurableOptions = (id *)&self->_lock_sourceConfigurableOptions;
  if (self->_lock_sourceConfigurableOptions || v18 == 3) {
    goto LABEL_14;
  }
  double v21 = (void *)v57;
  if (v11)
  {
    id v22 = v11;
  }
  else
  {
    id v22 = [(PRPosterContentsInternal *)self->_lock_sourceContents loadConfigurableOptionsWithError:0];
  }
  id v37 = *p_lock_sourceConfigurableOptions;
  id *p_lock_sourceConfigurableOptions = v22;

  if (!*p_lock_sourceConfigurableOptions)
  {
    v38 = [PRPosterConfigurableOptions alloc];
    uint64_t v39 = [(PRPosterConfigurableOptions *)v38 initWithDisplayNameLocalizationKey:0 ambientSupportedDataLayout:0 preferredTimeFontConfigurations:MEMORY[0x1E4F1CBF0] preferredTitleColors:MEMORY[0x1E4F1CBF0] luminance:0 preferredHomeScreenConfiguration:0.5];
    id v40 = *p_lock_sourceConfigurableOptions;
    id *p_lock_sourceConfigurableOptions = (id)v39;
  }
LABEL_24:
  if (!self->_lock_sourceTitleFontConfiguration && self->_bundleURL)
  {
    if (!v21)
    {
      v47 = [PRTimeFontConfiguration alloc];
      v48 = (void *)MEMORY[0x1E4FB08E0];
      v49 = [v10 role];
      v50 = objc_msgSend(v48, "pr_defaultTimeFontIdentifierForRole:", v49);
      v51 = [(PRTimeFontConfiguration *)v47 initWithTimeFontIdentifier:v50];
      lock_sourceTitleFontConfiguration = self->_lock_sourceTitleFontConfiguration;
      self->_lock_sourceTitleFontConfiguration = v51;

      double v21 = (void *)v57;
      p_lock_targetConfiguredProperties = (id *)&self->_lock_targetConfiguredProperties;
      if (self->_lock_targetConfiguredProperties) {
        goto LABEL_35;
      }
      goto LABEL_33;
    }
    v43 = [v21 titleStyleConfiguration];
    v44 = [v43 timeFontConfiguration];
    v45 = [v44 timeFontConfigurationWithExtensionBundleURL:self->_bundleURL];
    v46 = self->_lock_sourceTitleFontConfiguration;
    self->_lock_sourceTitleFontConfiguration = v45;
  }
  p_lock_targetConfiguredProperties = (id *)&self->_lock_targetConfiguredProperties;
  if (self->_lock_targetConfiguredProperties) {
    goto LABEL_35;
  }
  if (!v21)
  {
LABEL_33:
    uint64_t v42 = objc_opt_new();
    goto LABEL_34;
  }
  uint64_t v42 = [v21 mutableCopy];
LABEL_34:
  id v53 = *p_lock_targetConfiguredProperties;
  id *p_lock_targetConfiguredProperties = (id)v42;

LABEL_35:
  if (a3) {
    *a3 = self->_lock_sourceContents;
  }
  if (v13) {
    *double v13 = *p_lock_sourceConfigurableOptions;
  }
  if (a5) {
    *a5 = self->_lock_sourceTitleFontConfiguration;
  }
  if (v19) {
    *double v19 = *p_lock_targetConfiguredProperties;
  }
}

- (PRMutablePosterConfiguration)targetConfiguration
{
  return self->_targetConfig;
}

- (void)_applyToSceneSettings:(id)a3
{
  settings = self->_settings;
  id v6 = a3;
  double v5 = [(FBSSceneSettings *)settings pr_caseColor];
  objc_msgSend(v6, "pr_setCaseColor:", v5);

  objc_msgSend(v6, "pui_setUserInterfaceStyle:", -[FBSSceneSettings pui_userInterfaceStyle](self->_settings, "pui_userInterfaceStyle"));
  objc_msgSend(v6, "pui_setMode:", -[FBSSceneSettings pui_mode](self->_settings, "pui_mode"));
  [(FBSSceneSettings *)self->_settings pr_unlockProgress];
  objc_msgSend(v6, "pr_setUnlockProgress:");
}

- (void)_appendDescriptionToStream:(id)a3
{
  id v18 = a3;
  id v4 = [(PRPosterEnvironmentImpl *)self caseColor];
  id v5 = (id)[v18 appendObject:v4 withName:@"caseColor" skipIfNil:1];

  id v6 = [(PRPosterEnvironmentImpl *)self traitCollection];
  [v6 userInterfaceStyle];
  double v7 = UIApplicationSceneStringForUserInterfaceStyle();
  id v8 = (id)[v18 appendObject:v7 withName:@"uiStyle"];

  [(PRPosterEnvironmentImpl *)self mode];
  double v9 = NSStringFromPRRenderingMode();
  id v10 = (id)[v18 appendObject:v9 withName:@"mode"];

  [(PRPosterEnvironmentImpl *)self luminance];
  CGFloat v11 = NSStringFromBLSAdjustedLuminance();
  id v12 = (id)[v18 appendObject:v11 withName:@"luminance"];

  id v13 = (id)objc_msgSend(v18, "appendBool:withName:ifEqualTo:", -[PRPosterEnvironmentImpl isDepthEffectDisallowed](self, "isDepthEffectDisallowed"), @"depthEffectDisallowed", 1);
  [(PRPosterEnvironmentImpl *)self unlockProgress];
  id v14 = (id)objc_msgSend(v18, "appendFloat:withName:decimalPrecision:", @"unlockProgress", 3);
  [(PRPosterEnvironmentImpl *)self backlightProgress];
  id v15 = (id)objc_msgSend(v18, "appendFloat:withName:decimalPrecision:", @"backlightProgress", 3);
  id v16 = (id)objc_msgSend(v18, "appendBool:withName:", -[PRPosterEnvironmentImpl wakeSourceIsSwipeToUnlock](self, "wakeSourceIsSwipeToUnlock"), @"wakeSourceIsSwipeToUnlock");
  id v17 = (id)objc_msgSend(v18, "appendUnsignedInteger:withName:", -[PRPosterEnvironmentImpl significantEventsCounter](self, "significantEventsCounter"), @"significantEventsCounter");
}

- (int64_t)mode
{
  return [(FBSSceneSettings *)self->_settings pui_mode];
}

- (void)invalidate
{
  settings = self->_settings;
  self->_settings = 0;

  traitCollection = self->_traitCollection;
  self->_traitCollection = 0;

  bundleURL = self->_bundleURL;
  self->_bundleURL = 0;

  targetConfig = self->_targetConfig;
  self->_targetConfig = 0;

  os_unfair_lock_lock(&self->_lock);
  lock_sourceContents = self->_lock_sourceContents;
  self->_lock_sourceContents = 0;

  lock_sourceConfigurableOptions = self->_lock_sourceConfigurableOptions;
  self->_lock_sourceConfigurableOptions = 0;

  lock_sourceTitleFontConfiguration = self->_lock_sourceTitleFontConfiguration;
  self->_lock_sourceTitleFontConfiguration = 0;

  lock_targetConfiguredProperties = self->_lock_targetConfiguredProperties;
  self->_lock_targetConfiguredProperties = 0;

  os_unfair_lock_unlock(&self->_lock);
  layoutController = self->_layoutController;
  self->_layoutController = 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[PRPosterEnvironmentImpl alloc] initWithSceneSettings:self->_settings traitCollection:self->_traitCollection targetConfig:self->_targetConfig extensionBundleURL:self->_bundleURL];
  [(PRPosterEnvironmentImpl *)v4 setBacklightProgress:self->_backlightProgress];
  [(PRPosterEnvironmentImpl *)v4 setLinearBacklightProgress:self->_linearBacklightProgress];
  [(PRPosterEnvironmentImpl *)v4 setUnlockProgress:self->_unlockProgress];
  [(PRPosterEnvironmentImpl *)v4 setWakeSourceIsSwipeToUnlock:self->_wakeSourceIsSwipeToUnlock];
  return v4;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F720]);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  double v9 = __38__PRPosterEnvironmentImpl_description__block_invoke;
  id v10 = &unk_1E54DAA08;
  id v11 = v3;
  id v12 = self;
  id v4 = v3;
  [v4 appendProem:self block:&v7];
  id v5 = objc_msgSend(v4, "description", v7, v8, v9, v10);

  return (NSString *)v5;
}

void __38__PRPosterEnvironmentImpl_description__block_invoke(int8x16_t *a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __38__PRPosterEnvironmentImpl_description__block_invoke_2;
  v2[3] = &unk_1E54DAA08;
  int8x16_t v1 = a1[2];
  int8x16_t v3 = vextq_s8(v1, v1, 8uLL);
  [(id)v1.i64[0] appendBodySectionWithName:0 block:v2];
}

uint64_t __38__PRPosterEnvironmentImpl_description__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _appendDescriptionToStream:*(void *)(a1 + 40)];
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (double)backlightProgress
{
  return self->_backlightProgress;
}

- (void)setBacklightProgress:(double)a3
{
  self->_backlightProgress = a3;
}

- (double)linearBacklightProgress
{
  return self->_linearBacklightProgress;
}

- (void)setLinearBacklightProgress:(double)a3
{
  self->_linearBacklightProgress = a3;
}

- (double)unlockProgress
{
  return self->_unlockProgress;
}

- (void)setUnlockProgress:(double)a3
{
  self->_unlockProgress = a3;
}

- (BOOL)wakeSourceIsSwipeToUnlock
{
  return self->_wakeSourceIsSwipeToUnlock;
}

- (void)setWakeSourceIsSwipeToUnlock:(BOOL)a3
{
  self->_wakeSourceIsSwipeToUnlock = a3;
}

- (int64_t)boundingShape
{
  return self->_boundingShape;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutController, 0);
  objc_storeStrong((id *)&self->_lock_targetConfiguredProperties, 0);
  objc_storeStrong((id *)&self->_lock_sourceTitleFontConfiguration, 0);
  objc_storeStrong((id *)&self->_lock_sourceConfigurableOptions, 0);
  objc_storeStrong((id *)&self->_lock_sourceContents, 0);
  objc_storeStrong((id *)&self->_targetConfig, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

@end