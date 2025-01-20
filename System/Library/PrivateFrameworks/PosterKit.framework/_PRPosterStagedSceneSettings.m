@interface _PRPosterStagedSceneSettings
+ (BOOL)supportsSecureCoding;
- (BOOL)isAmbientPresented;
- (BOOL)pr_isAlternateDateEnabled;
- (BOOL)pr_isDepthEffectDisallowed;
- (BOOL)pr_isParallaxDisallowed;
- (BOOL)pr_isParallaxEffectivelyEnabled;
- (BOOL)pr_isParallaxEnabled;
- (BOOL)pr_wakeSourceIsSwipeToUnlock;
- (BOOL)pui_isComplicationRowConfigured;
- (BOOL)pui_isComplicationSidebarConfigured;
- (BOOL)pui_isExtensionUserInteractionEnabled;
- (BOOL)pui_isFloatingLayerSnapshot;
- (BOOL)pui_isInlineComplicationConfigured;
- (BOOL)pui_isInvalidated;
- (BOOL)pui_isSnapshot;
- (BOOL)pui_isWallpaperObscured;
- (BOOL)pui_showsComplications;
- (BOOL)pui_showsHeaderElements;
- (BSColor)pr_caseColor;
- (CGPoint)pui_userTapLocation;
- (CGRect)pr_horizontalTitleBoundingRect;
- (CGRect)pr_verticalTitleBoundingRect;
- (NSArray)pui_sceneAttachments;
- (NSString)pui_previewIdentifier;
- (NSString)pui_provider;
- (NSString)pui_role;
- (PFServerPosterPath)pui_posterContents;
- (PRPosterAmbientConfiguration)pr_posterAmbientConfiguration;
- (PRPosterConfigurableOptions)pr_posterConfigurableOptions;
- (PRPosterConfiguredProperties)pr_posterConfiguredProperties;
- (PRPosterTitleStyleConfiguration)pr_posterTitleStyleConfiguration;
- (_PRPosterStagedSceneSettings)initWithCoder:(id)a3;
- (double)pr_unlockProgress;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)ambientDisplayStyle;
- (int64_t)pr_adjustedLuminance;
- (int64_t)pui_content;
- (int64_t)pui_deviceOrientation;
- (int64_t)pui_mode;
- (int64_t)pui_posterBoundingShape;
- (int64_t)pui_userInterfaceStyle;
- (unint64_t)pr_titleAlignment;
- (unint64_t)pui_previewContent;
- (unint64_t)pui_significantEventsCounter;
- (unint64_t)pui_userTapEventsCounter;
- (void)applyToMutableSceneSettings:(id)a3 role:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)pr_setAdjustedLuminance:(int64_t)a3;
- (void)pr_setAlternateDateEnabled:(BOOL)a3;
- (void)pr_setCaseColor:(id)a3;
- (void)pr_setDepthEffectDisallowed:(BOOL)a3;
- (void)pr_setHorizontalTitleBoundingRect:(CGRect)a3;
- (void)pr_setParallaxDisallowed:(BOOL)a3;
- (void)pr_setParallaxEnabled:(BOOL)a3;
- (void)pr_setPosterAmbientConfiguration:(id)a3;
- (void)pr_setPosterConfigurableOptions:(id)a3;
- (void)pr_setPosterConfiguredProperties:(id)a3;
- (void)pr_setPosterTitleStyleConfiguration:(id)a3;
- (void)pr_setTitleAlignment:(unint64_t)a3;
- (void)pr_setUnlockProgress:(double)a3;
- (void)pr_setVerticalTitleBoundingRect:(CGRect)a3;
- (void)pr_setWakeSourceIsSwipeToUnlock:(BOOL)a3;
- (void)pui_setComplicationRowConfigured:(BOOL)a3;
- (void)pui_setComplicationSidebarConfigured:(BOOL)a3;
- (void)pui_setContent:(int64_t)a3;
- (void)pui_setDeviceOrientation:(int64_t)a3;
- (void)pui_setExtensionUserInteractionEnabled:(BOOL)a3;
- (void)pui_setFloatingLayerSnapshot:(BOOL)a3;
- (void)pui_setInlineComplicationConfigured:(BOOL)a3;
- (void)pui_setMode:(int64_t)a3;
- (void)pui_setPosterBoundingShape:(int64_t)a3;
- (void)pui_setPosterContents:(id)a3;
- (void)pui_setPreviewContent:(unint64_t)a3;
- (void)pui_setPreviewIdentifier:(id)a3;
- (void)pui_setProvider:(id)a3;
- (void)pui_setRole:(id)a3;
- (void)pui_setSceneAttachments:(id)a3;
- (void)pui_setShowsComplications:(BOOL)a3;
- (void)pui_setShowsHeaderElements:(BOOL)a3;
- (void)pui_setSignificantEventsCounter:(unint64_t)a3;
- (void)pui_setSnapshot:(BOOL)a3;
- (void)pui_setUserInterfaceStyle:(int64_t)a3;
- (void)pui_setUserTapEventWithLocation:(CGPoint)a3;
- (void)pui_setUserTapEventsCounter:(unint64_t)a3;
- (void)pui_setWallpaperObscured:(BOOL)a3;
- (void)setAmbientDisplayStyle:(int64_t)a3;
- (void)setAmbientPresented:(BOOL)a3;
@end

@implementation _PRPosterStagedSceneSettings

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(_PRPosterStagedSceneSettings *)self pui_role];
  [v4 encodeObject:v5 forKey:@"pui_role"];

  v6 = [(_PRPosterStagedSceneSettings *)self pui_provider];
  [v4 encodeObject:v6 forKey:@"pui_provider"];

  v7 = [(_PRPosterStagedSceneSettings *)self pui_previewIdentifier];
  [v4 encodeObject:v7 forKey:@"pui_previewIdentifier"];

  v8 = [(_PRPosterStagedSceneSettings *)self pr_caseColor];
  [v4 encodeObject:v8 forKey:@"pr_caseColor"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[_PRPosterStagedSceneSettings pui_userInterfaceStyle](self, "pui_userInterfaceStyle"), @"pui_userInterfaceStyle");
  objc_msgSend(v4, "encodeInteger:forKey:", -[_PRPosterStagedSceneSettings pui_deviceOrientation](self, "pui_deviceOrientation"), @"pui_deviceOrientation");
  v9 = [(_PRPosterStagedSceneSettings *)self pui_posterContents];
  [v4 encodeObject:v9 forKey:@"pui_posterContents"];

  v10 = [(_PRPosterStagedSceneSettings *)self pr_posterConfigurableOptions];
  [v4 encodeObject:v10 forKey:@"pr_posterConfigurableOptions"];

  v11 = [(_PRPosterStagedSceneSettings *)self pr_posterConfiguredProperties];
  [v4 encodeObject:v11 forKey:@"pr_posterConfiguredProperties"];

  v12 = [(_PRPosterStagedSceneSettings *)self pr_posterTitleStyleConfiguration];
  [v4 encodeObject:v12 forKey:@"pr_posterTitleStyleConfiguration"];

  v13 = [(_PRPosterStagedSceneSettings *)self pr_posterAmbientConfiguration];
  [v4 encodeObject:v13 forKey:@"pr_posterAmbientConfiguration"];

  objc_msgSend(v4, "encodeBool:forKey:", -[_PRPosterStagedSceneSettings pr_isDepthEffectDisallowed](self, "pr_isDepthEffectDisallowed"), @"pr_depthEffectDisallowed");
  objc_msgSend(v4, "encodeBool:forKey:", -[_PRPosterStagedSceneSettings pr_isParallaxEnabled](self, "pr_isParallaxEnabled"), @"pr_parallaxEnabled");
  objc_msgSend(v4, "encodeBool:forKey:", -[_PRPosterStagedSceneSettings pr_isParallaxDisallowed](self, "pr_isParallaxDisallowed"), @"pr_parallaxDisallowed");
  objc_msgSend(v4, "encodeBool:forKey:", -[_PRPosterStagedSceneSettings pui_isInlineComplicationConfigured](self, "pui_isInlineComplicationConfigured"), @"pui_inlineComplicationConfigured");
  objc_msgSend(v4, "encodeBool:forKey:", -[_PRPosterStagedSceneSettings pui_isComplicationRowConfigured](self, "pui_isComplicationRowConfigured"), @"pui_complicationRowConfigured");
  objc_msgSend(v4, "encodeBool:forKey:", -[_PRPosterStagedSceneSettings pui_isComplicationSidebarConfigured](self, "pui_isComplicationSidebarConfigured"), @"pui_complicationSidebarConfigured");
  objc_msgSend(v4, "encodeBool:forKey:", -[_PRPosterStagedSceneSettings pr_isAlternateDateEnabled](self, "pr_isAlternateDateEnabled"), @"pr_alternateDateEnabled");
  objc_msgSend(v4, "encodeBool:forKey:", -[_PRPosterStagedSceneSettings pui_isExtensionUserInteractionEnabled](self, "pui_isExtensionUserInteractionEnabled"), @"pui_extensionUserInteractionEnabled");
  objc_msgSend(v4, "encodeBool:forKey:", -[_PRPosterStagedSceneSettings pui_showsHeaderElements](self, "pui_showsHeaderElements"), @"pui_showsHeaderElements");
  objc_msgSend(v4, "encodeBool:forKey:", -[_PRPosterStagedSceneSettings pui_showsComplications](self, "pui_showsComplications"), @"pui_showsComplications");
  objc_msgSend(v4, "encodeBool:forKey:", -[_PRPosterStagedSceneSettings pui_isWallpaperObscured](self, "pui_isWallpaperObscured"), @"pui_wallpaperObscured");
  objc_msgSend(v4, "encodeInteger:forKey:", -[_PRPosterStagedSceneSettings pui_posterBoundingShape](self, "pui_posterBoundingShape"), @"pui_posterBoundingShape");
  [(_PRPosterStagedSceneSettings *)self pr_horizontalTitleBoundingRect];
  objc_msgSend(v4, "encodeCGRect:forKey:", @"pr_horizontalTitleBoundingRect");
  [(_PRPosterStagedSceneSettings *)self pr_verticalTitleBoundingRect];
  objc_msgSend(v4, "encodeCGRect:forKey:", @"pr_verticalTitleBoundingRect");
  objc_msgSend(v4, "encodeInteger:forKey:", -[_PRPosterStagedSceneSettings pui_mode](self, "pui_mode"), @"pui_mode");
  objc_msgSend(v4, "encodeInteger:forKey:", -[_PRPosterStagedSceneSettings pui_content](self, "pui_content"), @"pui_content");
  objc_msgSend(v4, "encodeBool:forKey:", -[_PRPosterStagedSceneSettings pui_isSnapshot](self, "pui_isSnapshot"), @"pui_snapshot");
  objc_msgSend(v4, "encodeBool:forKey:", -[_PRPosterStagedSceneSettings pui_isFloatingLayerSnapshot](self, "pui_isFloatingLayerSnapshot"), @"pui_floatingLayerSnapshot");
  [(_PRPosterStagedSceneSettings *)self pr_unlockProgress];
  *(float *)&double v14 = v14;
  [v4 encodeFloat:@"pr_unlockProgress" forKey:v14];
  objc_msgSend(v4, "encodeBool:forKey:", -[_PRPosterStagedSceneSettings pr_wakeSourceIsSwipeToUnlock](self, "pr_wakeSourceIsSwipeToUnlock"), @"pr_wakeSourceIsSwipeToUnlock");
  objc_msgSend(v4, "encodeInteger:forKey:", -[_PRPosterStagedSceneSettings pui_significantEventsCounter](self, "pui_significantEventsCounter"), @"pui_significantEventsCounter");
  objc_msgSend(v4, "encodeInteger:forKey:", -[_PRPosterStagedSceneSettings pr_titleAlignment](self, "pr_titleAlignment"), @"pr_titleAlignment");
  objc_msgSend(v4, "encodeInteger:forKey:", -[_PRPosterStagedSceneSettings pr_adjustedLuminance](self, "pr_adjustedLuminance"), @"pr_adjustedLuminance");
  objc_msgSend(v4, "encodeBool:forKey:", -[_PRPosterStagedSceneSettings isAmbientPresented](self, "isAmbientPresented"), @"ambientPresented");
  objc_msgSend(v4, "encodeInteger:forKey:", -[_PRPosterStagedSceneSettings ambientDisplayStyle](self, "ambientDisplayStyle"), @"ambientDisplayStyle");
  id v15 = [(_PRPosterStagedSceneSettings *)self pui_sceneAttachments];
  [v4 encodeObject:v15 forKey:@"pui_sceneAttachments"];
}

- (_PRPosterStagedSceneSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)_PRPosterStagedSceneSettings;
  v5 = [(_PRPosterStagedSceneSettings *)&v31 init];
  if (v5)
  {
    v6 = self;
    v7 = [v4 decodeObjectOfClass:v6 forKey:@"pui_role"];
    [(_PRPosterStagedSceneSettings *)v5 pui_setRole:v7];

    v8 = self;
    v9 = [v4 decodeObjectOfClass:v8 forKey:@"pui_provider"];
    [(_PRPosterStagedSceneSettings *)v5 pui_setProvider:v9];

    v10 = self;
    v11 = [v4 decodeObjectOfClass:v10 forKey:@"pui_previewIdentifier"];
    [(_PRPosterStagedSceneSettings *)v5 pui_setPreviewIdentifier:v11];

    v12 = self;
    v13 = [v4 decodeObjectOfClass:v12 forKey:@"pr_caseColor"];
    [(_PRPosterStagedSceneSettings *)v5 pr_setCaseColor:v13];

    -[_PRPosterStagedSceneSettings pui_setUserInterfaceStyle:](v5, "pui_setUserInterfaceStyle:", [v4 decodeIntegerForKey:@"pui_userInterfaceStyle"]);
    -[_PRPosterStagedSceneSettings pui_setDeviceOrientation:](v5, "pui_setDeviceOrientation:", [v4 decodeIntegerForKey:@"pui_deviceOrientation"]);
    double v14 = self;
    id v15 = [v4 decodeObjectOfClass:v14 forKey:@"pui_posterContents"];
    [(_PRPosterStagedSceneSettings *)v5 pui_setPosterContents:v15];

    v16 = self;
    v17 = [v4 decodeObjectOfClass:v16 forKey:@"pr_posterConfigurableOptions"];
    [(_PRPosterStagedSceneSettings *)v5 pr_setPosterConfigurableOptions:v17];

    v18 = self;
    v19 = [v4 decodeObjectOfClass:v18 forKey:@"pr_posterConfiguredProperties"];
    [(_PRPosterStagedSceneSettings *)v5 pr_setPosterConfiguredProperties:v19];

    v20 = self;
    v21 = [v4 decodeObjectOfClass:v20 forKey:@"pr_posterTitleStyleConfiguration"];
    [(_PRPosterStagedSceneSettings *)v5 pr_setPosterTitleStyleConfiguration:v21];

    v22 = self;
    v23 = [v4 decodeObjectOfClass:v22 forKey:@"pr_posterAmbientConfiguration"];
    [(_PRPosterStagedSceneSettings *)v5 pr_setPosterAmbientConfiguration:v23];

    -[_PRPosterStagedSceneSettings pr_setDepthEffectDisallowed:](v5, "pr_setDepthEffectDisallowed:", [v4 decodeBoolForKey:@"pr_depthEffectDisallowed"]);
    -[_PRPosterStagedSceneSettings pr_setParallaxEnabled:](v5, "pr_setParallaxEnabled:", [v4 decodeBoolForKey:@"pr_parallaxEnabled"]);
    -[_PRPosterStagedSceneSettings pr_setParallaxDisallowed:](v5, "pr_setParallaxDisallowed:", [v4 decodeBoolForKey:@"pr_parallaxDisallowed"]);
    -[_PRPosterStagedSceneSettings pui_setInlineComplicationConfigured:](v5, "pui_setInlineComplicationConfigured:", [v4 decodeBoolForKey:@"pui_inlineComplicationConfigured"]);
    -[_PRPosterStagedSceneSettings pui_setComplicationRowConfigured:](v5, "pui_setComplicationRowConfigured:", [v4 decodeBoolForKey:@"pui_complicationRowConfigured"]);
    -[_PRPosterStagedSceneSettings pui_setComplicationSidebarConfigured:](v5, "pui_setComplicationSidebarConfigured:", [v4 decodeBoolForKey:@"pui_complicationSidebarConfigured"]);
    -[_PRPosterStagedSceneSettings pr_setAlternateDateEnabled:](v5, "pr_setAlternateDateEnabled:", [v4 decodeBoolForKey:@"pr_alternateDateEnabled"]);
    -[_PRPosterStagedSceneSettings pui_setExtensionUserInteractionEnabled:](v5, "pui_setExtensionUserInteractionEnabled:", [v4 decodeBoolForKey:@"pui_extensionUserInteractionEnabled"]);
    -[_PRPosterStagedSceneSettings pui_setShowsHeaderElements:](v5, "pui_setShowsHeaderElements:", [v4 decodeBoolForKey:@"pui_showsHeaderElements"]);
    -[_PRPosterStagedSceneSettings pui_setShowsComplications:](v5, "pui_setShowsComplications:", [v4 decodeBoolForKey:@"pui_showsComplications"]);
    -[_PRPosterStagedSceneSettings pui_setWallpaperObscured:](v5, "pui_setWallpaperObscured:", [v4 decodeBoolForKey:@"pui_wallpaperObscured"]);
    -[_PRPosterStagedSceneSettings pui_setPosterBoundingShape:](v5, "pui_setPosterBoundingShape:", [v4 decodeIntegerForKey:@"pui_posterBoundingShape"]);
    [v4 decodeCGRectForKey:@"pr_horizontalTitleBoundingRect"];
    -[_PRPosterStagedSceneSettings pr_setHorizontalTitleBoundingRect:](v5, "pr_setHorizontalTitleBoundingRect:");
    [v4 decodeCGRectForKey:@"pr_verticalTitleBoundingRect"];
    -[_PRPosterStagedSceneSettings pr_setVerticalTitleBoundingRect:](v5, "pr_setVerticalTitleBoundingRect:");
    -[_PRPosterStagedSceneSettings pui_setMode:](v5, "pui_setMode:", [v4 decodeIntegerForKey:@"pui_mode"]);
    -[_PRPosterStagedSceneSettings pui_setContent:](v5, "pui_setContent:", [v4 decodeIntegerForKey:@"pui_content"]);
    -[_PRPosterStagedSceneSettings pui_setSnapshot:](v5, "pui_setSnapshot:", [v4 decodeBoolForKey:@"pui_snapshot"]);
    -[_PRPosterStagedSceneSettings pui_setFloatingLayerSnapshot:](v5, "pui_setFloatingLayerSnapshot:", [v4 decodeBoolForKey:@"pui_floatingLayerSnapshot"]);
    [v4 decodeFloatForKey:@"pr_unlockProgress"];
    [(_PRPosterStagedSceneSettings *)v5 pr_setUnlockProgress:v24];
    -[_PRPosterStagedSceneSettings pui_setSignificantEventsCounter:](v5, "pui_setSignificantEventsCounter:", [v4 decodeIntegerForKey:@"pui_significantEventsCounter"]);
    v25 = (void *)MEMORY[0x1E4F1CAD0];
    v26 = self;
    v27 = self;
    v28 = objc_msgSend(v25, "setWithObjects:", v26, v27, 0);
    v29 = [v4 decodeObjectOfClasses:v28 forKey:@"pui_sceneAttachments"];
    [(_PRPosterStagedSceneSettings *)v5 pui_setSceneAttachments:v29];

    -[_PRPosterStagedSceneSettings pr_setWakeSourceIsSwipeToUnlock:](v5, "pr_setWakeSourceIsSwipeToUnlock:", [v4 decodeBoolForKey:@"pr_wakeSourceIsSwipeToUnlock"]);
    -[_PRPosterStagedSceneSettings pr_setTitleAlignment:](v5, "pr_setTitleAlignment:", [v4 decodeIntegerForKey:@"pr_titleAlignment"]);
    -[_PRPosterStagedSceneSettings pr_setAdjustedLuminance:](v5, "pr_setAdjustedLuminance:", [v4 decodeIntegerForKey:@"pr_adjustedLuminance"]);
    -[_PRPosterStagedSceneSettings setAmbientPresented:](v5, "setAmbientPresented:", [v4 decodeBoolForKey:@"ambientPresented"]);
    -[_PRPosterStagedSceneSettings setAmbientDisplayStyle:](v5, "setAmbientDisplayStyle:", [v4 decodeIntegerForKey:@"ambientDisplayStyle"]);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[_PRPosterStagedSceneSettings allocWithZone:a3] init];
  uint64_t v5 = [(NSString *)self->_role copy];
  role = v4->_role;
  v4->_role = (NSString *)v5;

  uint64_t v7 = [(NSString *)self->_provider copy];
  provider = v4->_provider;
  v4->_provider = (NSString *)v7;

  uint64_t v9 = [(NSString *)self->_previewIdentifier copy];
  previewIdentifier = v4->_previewIdentifier;
  v4->_previewIdentifier = (NSString *)v9;

  uint64_t v11 = [(BSColor *)self->_caseColor copy];
  caseColor = v4->_caseColor;
  v4->_caseColor = (BSColor *)v11;

  v4->_userInterfaceStyle = self->_userInterfaceStyle;
  v4->_deviceOrientation = self->_deviceOrientation;
  objc_storeStrong((id *)&v4->_posterContents, self->_posterContents);
  objc_storeStrong((id *)&v4->_posterConfigurableOptions, self->_posterConfigurableOptions);
  objc_storeStrong((id *)&v4->_posterConfiguredProperties, self->_posterConfiguredProperties);
  objc_storeStrong((id *)&v4->_posterTitleStyleConfiguration, self->_posterTitleStyleConfiguration);
  objc_storeStrong((id *)&v4->_posterAmbientConfiguration, self->_posterAmbientConfiguration);
  v4->_depthEffectDisallowed = self->_depthEffectDisallowed;
  v4->_parallaxEnabled = self->_parallaxEnabled;
  v4->_parallaxDisallowed = self->_parallaxDisallowed;
  v4->_inlineComplicationConfigured = self->_inlineComplicationConfigured;
  v4->_complicationRowConfigured = self->_complicationRowConfigured;
  v4->_complicationSidebarConfigured = self->_complicationSidebarConfigured;
  v4->_alternateDateEnabled = self->_alternateDateEnabled;
  v4->_extensionUserInteractionEnabled = self->_extensionUserInteractionEnabled;
  v4->_showsHeaderElements = self->_showsHeaderElements;
  v4->_showsComplications = self->_showsComplications;
  v4->_wallpaperObscured = self->_wallpaperObscured;
  v4->_posterBoundingShape = self->_posterBoundingShape;
  CGSize size = self->_horizontalTitleBoundingRect.size;
  v4->_horizontalTitleBoundingRect.origin = self->_horizontalTitleBoundingRect.origin;
  v4->_horizontalTitleBoundingRect.CGSize size = size;
  CGSize v14 = self->_verticalTitleBoundingRect.size;
  v4->_verticalTitleBoundingRect.origin = self->_verticalTitleBoundingRect.origin;
  v4->_verticalTitleBoundingRect.CGSize size = v14;
  v4->_mode = self->_mode;
  v4->_content = self->_content;
  v4->_snapshot = self->_snapshot;
  v4->_floatingLayerSnapshot = self->_floatingLayerSnapshot;
  v4->_unlockProgress = self->_unlockProgress;
  v4->_wakeSourceIsSwipeToUnlock = self->_wakeSourceIsSwipeToUnlock;
  v4->_significantEventsCounter = self->_significantEventsCounter;
  v4->_titleAlignment = self->_titleAlignment;
  v4->_adjustedLuminance = self->_adjustedLuminance;
  v4->_ambientPresented = self->_ambientPresented;
  v4->_ambientDisplayStyle = self->_ambientDisplayStyle;
  uint64_t v15 = [(NSArray *)self->_sceneAttachments copy];
  sceneAttachments = v4->_sceneAttachments;
  v4->_sceneAttachments = (NSArray *)v15;

  return v4;
}

- (void)applyToMutableSceneSettings:(id)a3 role:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  FBSceneSettingsApplyPRSceneSettings(self, v8);
  FBSceneSettingsApplyPRRenderingSceneSettings(self, v8);
  int v7 = [v6 isEqualToString:@"PRPosterRoleAmbient"];

  if (v7) {
    FBSceneSettingsApplyAMUIAmbientPresentationSettings(self, v8);
  }
}

- (int64_t)pr_adjustedLuminance
{
  return 2;
}

- (NSString)pui_role
{
  return self->_role;
}

- (void)pui_setRole:(id)a3
{
}

- (NSString)pui_provider
{
  return self->_provider;
}

- (void)pui_setProvider:(id)a3
{
}

- (NSString)pui_previewIdentifier
{
  return self->_previewIdentifier;
}

- (void)pui_setPreviewIdentifier:(id)a3
{
}

- (BSColor)pr_caseColor
{
  return self->_caseColor;
}

- (void)pr_setCaseColor:(id)a3
{
}

- (int64_t)pui_userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (void)pui_setUserInterfaceStyle:(int64_t)a3
{
  self->_userInterfaceStyle = a3;
}

- (int64_t)pui_deviceOrientation
{
  return self->_deviceOrientation;
}

- (void)pui_setDeviceOrientation:(int64_t)a3
{
  self->_deviceOrientation = a3;
}

- (PFServerPosterPath)pui_posterContents
{
  return self->_posterContents;
}

- (void)pui_setPosterContents:(id)a3
{
}

- (PRPosterConfigurableOptions)pr_posterConfigurableOptions
{
  return self->_posterConfigurableOptions;
}

- (void)pr_setPosterConfigurableOptions:(id)a3
{
}

- (PRPosterConfiguredProperties)pr_posterConfiguredProperties
{
  return self->_posterConfiguredProperties;
}

- (void)pr_setPosterConfiguredProperties:(id)a3
{
}

- (PRPosterTitleStyleConfiguration)pr_posterTitleStyleConfiguration
{
  return self->_posterTitleStyleConfiguration;
}

- (void)pr_setPosterTitleStyleConfiguration:(id)a3
{
}

- (PRPosterAmbientConfiguration)pr_posterAmbientConfiguration
{
  return self->_posterAmbientConfiguration;
}

- (void)pr_setPosterAmbientConfiguration:(id)a3
{
}

- (BOOL)pr_isDepthEffectDisallowed
{
  return self->_depthEffectDisallowed;
}

- (void)pr_setDepthEffectDisallowed:(BOOL)a3
{
  self->_depthEffectDisallowed = a3;
}

- (BOOL)pr_isParallaxEnabled
{
  return self->_parallaxEnabled;
}

- (void)pr_setParallaxEnabled:(BOOL)a3
{
  self->_parallaxEnabled = a3;
}

- (BOOL)pr_isParallaxDisallowed
{
  return self->_parallaxDisallowed;
}

- (void)pr_setParallaxDisallowed:(BOOL)a3
{
  self->_parallaxDisallowed = a3;
}

- (BOOL)pui_isInlineComplicationConfigured
{
  return self->_inlineComplicationConfigured;
}

- (void)pui_setInlineComplicationConfigured:(BOOL)a3
{
  self->_inlineComplicationConfigured = a3;
}

- (BOOL)pui_isComplicationRowConfigured
{
  return self->_complicationRowConfigured;
}

- (void)pui_setComplicationRowConfigured:(BOOL)a3
{
  self->_complicationRowConfigured = a3;
}

- (BOOL)pui_isComplicationSidebarConfigured
{
  return self->_complicationSidebarConfigured;
}

- (void)pui_setComplicationSidebarConfigured:(BOOL)a3
{
  self->_complicationSidebarConfigured = a3;
}

- (BOOL)pr_isAlternateDateEnabled
{
  return self->_alternateDateEnabled;
}

- (void)pr_setAlternateDateEnabled:(BOOL)a3
{
  self->_alternateDateEnabled = a3;
}

- (BOOL)pui_isExtensionUserInteractionEnabled
{
  return self->_extensionUserInteractionEnabled;
}

- (void)pui_setExtensionUserInteractionEnabled:(BOOL)a3
{
  self->_extensionUserInteractionEnabled = a3;
}

- (BOOL)pui_showsHeaderElements
{
  return self->_showsHeaderElements;
}

- (void)pui_setShowsHeaderElements:(BOOL)a3
{
  self->_showsHeaderElements = a3;
}

- (BOOL)pui_showsComplications
{
  return self->_showsComplications;
}

- (void)pui_setShowsComplications:(BOOL)a3
{
  self->_showsComplications = a3;
}

- (BOOL)pui_isWallpaperObscured
{
  return self->_wallpaperObscured;
}

- (void)pui_setWallpaperObscured:(BOOL)a3
{
  self->_wallpaperObscured = a3;
}

- (int64_t)pui_posterBoundingShape
{
  return self->_posterBoundingShape;
}

- (void)pui_setPosterBoundingShape:(int64_t)a3
{
  self->_posterBoundingShape = a3;
}

- (CGRect)pr_horizontalTitleBoundingRect
{
  double x = self->_horizontalTitleBoundingRect.origin.x;
  double y = self->_horizontalTitleBoundingRect.origin.y;
  double width = self->_horizontalTitleBoundingRect.size.width;
  double height = self->_horizontalTitleBoundingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)pr_setHorizontalTitleBoundingRect:(CGRect)a3
{
  self->_horizontalTitleBoundingRect = a3;
}

- (CGRect)pr_verticalTitleBoundingRect
{
  double x = self->_verticalTitleBoundingRect.origin.x;
  double y = self->_verticalTitleBoundingRect.origin.y;
  double width = self->_verticalTitleBoundingRect.size.width;
  double height = self->_verticalTitleBoundingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)pr_setVerticalTitleBoundingRect:(CGRect)a3
{
  self->_verticalTitleBoundingRect = a3;
}

- (int64_t)pui_mode
{
  return self->_mode;
}

- (void)pui_setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (int64_t)pui_content
{
  return self->_content;
}

- (void)pui_setContent:(int64_t)a3
{
  self->_content = a3;
}

- (unint64_t)pui_previewContent
{
  return self->_previewContent;
}

- (void)pui_setPreviewContent:(unint64_t)a3
{
  self->_previewContent = a3;
}

- (BOOL)pui_isSnapshot
{
  return self->_snapshot;
}

- (void)pui_setSnapshot:(BOOL)a3
{
  self->_snapshot = a3;
}

- (BOOL)pui_isFloatingLayerSnapshot
{
  return self->_floatingLayerSnapshot;
}

- (void)pui_setFloatingLayerSnapshot:(BOOL)a3
{
  self->_floatingLayerSnapshot = a3;
}

- (double)pr_unlockProgress
{
  return self->_unlockProgress;
}

- (void)pr_setUnlockProgress:(double)a3
{
  self->_unlockProgress = a3;
}

- (BOOL)pr_wakeSourceIsSwipeToUnlock
{
  return self->_wakeSourceIsSwipeToUnlock;
}

- (void)pr_setWakeSourceIsSwipeToUnlock:(BOOL)a3
{
  self->_wakeSourceIsSwipeToUnlock = a3;
}

- (unint64_t)pui_significantEventsCounter
{
  return self->_significantEventsCounter;
}

- (void)pui_setSignificantEventsCounter:(unint64_t)a3
{
  self->_significantEventsCounter = a3;
}

- (unint64_t)pr_titleAlignment
{
  return self->_titleAlignment;
}

- (void)pr_setTitleAlignment:(unint64_t)a3
{
  self->_titleAlignment = a3;
}

- (void)pr_setAdjustedLuminance:(int64_t)a3
{
  self->_adjustedLuminance = a3;
}

- (BOOL)isAmbientPresented
{
  return self->_ambientPresented;
}

- (void)setAmbientPresented:(BOOL)a3
{
  self->_ambientPresented = a3;
}

- (int64_t)ambientDisplayStyle
{
  return self->_ambientDisplayStyle;
}

- (void)setAmbientDisplayStyle:(int64_t)a3
{
  self->_ambientDisplayStyle = a3;
}

- (NSArray)pui_sceneAttachments
{
  return self->_sceneAttachments;
}

- (void)pui_setSceneAttachments:(id)a3
{
}

- (BOOL)pui_isInvalidated
{
  return self->pui_isInvalidated;
}

- (BOOL)pr_isParallaxEffectivelyEnabled
{
  return self->pr_parallaxEffectivelyEnabled;
}

- (unint64_t)pui_userTapEventsCounter
{
  return self->pui_userTapEventsCounter;
}

- (void)pui_setUserTapEventsCounter:(unint64_t)a3
{
  self->pui_userTapEventsCounter = a3;
}

- (CGPoint)pui_userTapLocation
{
  double x = self->pui_userTapLocation.x;
  double y = self->pui_userTapLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)pui_setUserTapEventWithLocation:(CGPoint)a3
{
  self->pui_userTapLocation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneAttachments, 0);
  objc_storeStrong((id *)&self->_posterAmbientConfiguration, 0);
  objc_storeStrong((id *)&self->_posterTitleStyleConfiguration, 0);
  objc_storeStrong((id *)&self->_posterConfiguredProperties, 0);
  objc_storeStrong((id *)&self->_posterConfigurableOptions, 0);
  objc_storeStrong((id *)&self->_posterContents, 0);
  objc_storeStrong((id *)&self->_caseColor, 0);
  objc_storeStrong((id *)&self->_previewIdentifier, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_role, 0);
}

@end