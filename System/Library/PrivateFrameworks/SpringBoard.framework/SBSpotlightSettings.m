@interface SBSpotlightSettings
+ (id)settingsControllerModule;
- (SBFFluidBehaviorSettings)opacityAnimationSettings;
- (SBFFluidBehaviorSettings)scaleAnimationSettings;
- (SBFFluidBehaviorSettings)snappyOpacityAnimationSettings;
- (SBFFluidBehaviorSettings)snappyScaleAnimationSettings;
- (double)anchorPointY;
- (double)dimmingViewRubberbandingMax;
- (double)dimmingViewRubberbandingMin;
- (double)dimmingViewRubberbandingRange;
- (double)hiddenBlurRadius;
- (double)hiddenScale;
- (double)homeScreenScaleRubberbandingMax;
- (double)homeScreenScaleRubberbandingMin;
- (double)homeScreenScaleRubberbandingRange;
- (double)maxTranslationForDimmingView;
- (double)maxTranslationForHomeScreenScale;
- (double)maxTranslationForSpotlightScale;
- (double)minTranslationToShowSpotlight;
- (double)spotlightScaleRubberbandingMax;
- (double)spotlightScaleRubberbandingMin;
- (double)spotlightScaleRubberbandingRange;
- (double)spotlightTranslationRubberbandingRange;
- (void)setAnchorPointY:(double)a3;
- (void)setDefaultValues;
- (void)setDimmingViewRubberbandingMax:(double)a3;
- (void)setDimmingViewRubberbandingMin:(double)a3;
- (void)setDimmingViewRubberbandingRange:(double)a3;
- (void)setHiddenBlurRadius:(double)a3;
- (void)setHiddenScale:(double)a3;
- (void)setHomeScreenScaleRubberbandingMax:(double)a3;
- (void)setHomeScreenScaleRubberbandingMin:(double)a3;
- (void)setHomeScreenScaleRubberbandingRange:(double)a3;
- (void)setMaxTranslationForDimmingView:(double)a3;
- (void)setMaxTranslationForHomeScreenScale:(double)a3;
- (void)setMaxTranslationForSpotlightScale:(double)a3;
- (void)setMinTranslationToShowSpotlight:(double)a3;
- (void)setOpacityAnimationSettings:(id)a3;
- (void)setScaleAnimationSettings:(id)a3;
- (void)setSnappyOpacityAnimationSettings:(id)a3;
- (void)setSnappyScaleAnimationSettings:(id)a3;
- (void)setSpotlightScaleRubberbandingMax:(double)a3;
- (void)setSpotlightScaleRubberbandingMin:(double)a3;
- (void)setSpotlightScaleRubberbandingRange:(double)a3;
- (void)setSpotlightTranslationRubberbandingRange:(double)a3;
@end

@implementation SBSpotlightSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)SBSpotlightSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(SBFFluidBehaviorSettings *)self->_opacityAnimationSettings setDefaultValues];
  [(SBFFluidBehaviorSettings *)self->_opacityAnimationSettings setDampingRatio:1.0];
  [(SBFFluidBehaviorSettings *)self->_opacityAnimationSettings setResponse:0.5];
  [(SBFFluidBehaviorSettings *)self->_snappyOpacityAnimationSettings setDefaultValues];
  [(SBFFluidBehaviorSettings *)self->_snappyOpacityAnimationSettings setDampingRatio:1.0];
  [(SBFFluidBehaviorSettings *)self->_snappyOpacityAnimationSettings setResponse:0.25];
  [(SBFFluidBehaviorSettings *)self->_scaleAnimationSettings setDefaultValues];
  [(SBFFluidBehaviorSettings *)self->_scaleAnimationSettings setDampingRatio:0.7];
  [(SBFFluidBehaviorSettings *)self->_scaleAnimationSettings setResponse:0.55];
  [(SBFFluidBehaviorSettings *)self->_snappyScaleAnimationSettings setDefaultValues];
  [(SBFFluidBehaviorSettings *)self->_snappyScaleAnimationSettings setDampingRatio:0.68];
  [(SBFFluidBehaviorSettings *)self->_snappyScaleAnimationSettings setResponse:0.3];
  [(SBSpotlightSettings *)self setAnchorPointY:0.12];
  [(SBSpotlightSettings *)self setHiddenScale:1.15];
  [(SBSpotlightSettings *)self setHiddenBlurRadius:15.0];
  [(SBSpotlightSettings *)self setMinTranslationToShowSpotlight:40.0];
  [(SBSpotlightSettings *)self setMaxTranslationForSpotlightScale:300.0];
  [(SBSpotlightSettings *)self setSpotlightScaleRubberbandingMin:1.0];
  [(SBSpotlightSettings *)self hiddenScale];
  -[SBSpotlightSettings setSpotlightScaleRubberbandingMax:](self, "setSpotlightScaleRubberbandingMax:");
  [(SBSpotlightSettings *)self setSpotlightScaleRubberbandingRange:0.1];
  [(SBSpotlightSettings *)self setMaxTranslationForHomeScreenScale:300.0];
  [(SBSpotlightSettings *)self setHomeScreenScaleRubberbandingMin:1.0];
  [(SBSpotlightSettings *)self setHomeScreenScaleRubberbandingMax:1.0];
  [(SBSpotlightSettings *)self setHomeScreenScaleRubberbandingRange:0.1];
  [(SBSpotlightSettings *)self setMaxTranslationForDimmingView:50.0];
  [(SBSpotlightSettings *)self setDimmingViewRubberbandingMin:0.0];
  [(SBSpotlightSettings *)self setDimmingViewRubberbandingMax:0.15];
  [(SBSpotlightSettings *)self setDimmingViewRubberbandingRange:0.25];
  [(SBSpotlightSettings *)self setSpotlightTranslationRubberbandingRange:60.0];
}

+ (id)settingsControllerModule
{
  v76[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94100];
  objc_super v3 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
  v61 = [v2 rowWithTitle:@"Restore Defaults" action:v3];

  v4 = (void *)MEMORY[0x1E4F94168];
  v76[0] = v61;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:1];
  v72 = [v4 sectionWithRows:v5];

  v60 = [MEMORY[0x1E4F94138] rowWithTitle:@"Opacity Animation Settings" childSettingsKeyPath:@"opacityAnimationSettings"];
  v59 = [MEMORY[0x1E4F94138] rowWithTitle:@"Snappy Opacity Animation Settings" childSettingsKeyPath:@"snappyOpacityAnimationSettings"];
  v58 = [MEMORY[0x1E4F94138] rowWithTitle:@"Scale Animation Settings" childSettingsKeyPath:@"scaleAnimationSettings"];
  v57 = [MEMORY[0x1E4F94138] rowWithTitle:@"Snappy Scale Animation Settings" childSettingsKeyPath:@"snappyScaleAnimationSettings"];
  v6 = (void *)MEMORY[0x1E4F94168];
  v75[0] = v60;
  v75[1] = v59;
  v75[2] = v58;
  v75[3] = v57;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:4];
  v56 = [v6 sectionWithRows:v7 title:@"Animations"];

  v8 = [MEMORY[0x1E4F94140] rowWithTitle:@"Anchor Point Y" valueKeyPath:@"anchorPointY"];
  v9 = [v8 between:0.0 and:1.0];
  v70 = [v9 precision:2];

  v10 = [MEMORY[0x1E4F94140] rowWithTitle:@"Hidden Scale" valueKeyPath:@"hiddenScale"];
  v11 = [v10 between:0.0 and:2.0];
  v71 = [v11 precision:2];

  v12 = [MEMORY[0x1E4F94140] rowWithTitle:@"Hidden Blur Radius" valueKeyPath:@"hiddenBlurRadius"];
  v13 = [v12 between:0.0 and:100.0];
  v68 = [v13 precision:2];

  v14 = [MEMORY[0x1E4F94140] rowWithTitle:@"Min Translation To Show Spotlight" valueKeyPath:@"minTranslationToShowSpotlight"];
  v15 = [v14 between:0.0 and:1000.0];
  v69 = [v15 precision:2];

  v16 = [MEMORY[0x1E4F94140] rowWithTitle:@"Max Translation For Spotlight Scale" valueKeyPath:@"maxTranslationForSpotlightScale"];
  v17 = [v16 between:0.0 and:1000.0];
  v66 = [v17 precision:2];

  v18 = [MEMORY[0x1E4F94140] rowWithTitle:@"Spotlight Scale Rubberbanding Min" valueKeyPath:@"spotlightScaleRubberbandingMin"];
  v19 = [v18 between:0.0 and:1000.0];
  v67 = [v19 precision:2];

  v20 = [MEMORY[0x1E4F94140] rowWithTitle:@"Spotlight Scale Rubberbanding Max" valueKeyPath:@"spotlightScaleRubberbandingMax"];
  v21 = [v20 between:0.0 and:1000.0];
  v65 = [v21 precision:2];

  v22 = [MEMORY[0x1E4F94140] rowWithTitle:@"Spotlight Scale Rubberbanding Range" valueKeyPath:@"spotlightScaleRubberbandingRange"];
  v23 = [v22 between:0.0 and:1000.0];
  v64 = [v23 precision:2];

  v24 = [MEMORY[0x1E4F94140] rowWithTitle:@"Max Translation For Home Screen Scale" valueKeyPath:@"maxTranslationForHomeScreenScale"];
  v25 = [v24 between:0.0 and:1000.0];
  v55 = [v25 precision:2];

  v26 = [MEMORY[0x1E4F94140] rowWithTitle:@"Home Screen Scale Rubberbanding Min" valueKeyPath:@"homeScreenScaleRubberbandingMin"];
  v27 = [v26 between:0.0 and:1000.0];
  v54 = [v27 precision:2];

  v28 = [MEMORY[0x1E4F94140] rowWithTitle:@"Home Screen Scale Rubberbanding Max" valueKeyPath:@"homeScreenScaleRubberbandingMax"];
  v29 = [v28 between:0.0 and:1000.0];
  v63 = [v29 precision:2];

  v30 = [MEMORY[0x1E4F94140] rowWithTitle:@"Home Screen Scale Rubberbanding Range" valueKeyPath:@"homeScreenScaleRubberbandingRange"];
  v31 = [v30 between:0.0 and:1000.0];
  v62 = [v31 precision:2];

  v32 = [MEMORY[0x1E4F94140] rowWithTitle:@"Max Translation For Home Screen Dimming" valueKeyPath:@"maxTranslationForDimmingView"];
  v33 = [v32 between:0.0 and:1000.0];
  v53 = [v33 precision:2];

  v34 = [MEMORY[0x1E4F94140] rowWithTitle:@"Home Screen Dimming Rubberbanding Min" valueKeyPath:@"dimmingViewRubberbandingMin"];
  v35 = [v34 between:0.0 and:1000.0];
  v36 = [v35 precision:2];

  v37 = [MEMORY[0x1E4F94140] rowWithTitle:@"Home Screen Dimming Rubberbanding Max" valueKeyPath:@"dimmingViewRubberbandingMax"];
  v38 = [v37 between:0.0 and:1000.0];
  v52 = [v38 precision:2];

  v39 = [MEMORY[0x1E4F94140] rowWithTitle:@"Home Screen Dimming Rubberbanding Range" valueKeyPath:@"dimmingViewRubberbandingRange"];
  v40 = [v39 between:0.0 and:1000.0];
  v41 = [v40 precision:2];

  v42 = [MEMORY[0x1E4F94140] rowWithTitle:@"Spotlight Translation Rubberbanding Range" valueKeyPath:@"spotlightTranslationRubberbandingRange"];
  v43 = [v42 between:0.0 and:1000.0];
  v44 = [v43 precision:2];

  v45 = (void *)MEMORY[0x1E4F94168];
  v74[0] = v70;
  v74[1] = v71;
  v74[2] = v68;
  v74[3] = v69;
  v74[4] = v66;
  v74[5] = v67;
  v74[6] = v65;
  v74[7] = v64;
  v74[8] = v55;
  v74[9] = v54;
  v74[10] = v63;
  v74[11] = v62;
  v74[12] = v53;
  v74[13] = v36;
  v74[14] = v52;
  v74[15] = v41;
  v74[16] = v44;
  v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:17];
  v47 = [v45 sectionWithRows:v46 title:0];

  v48 = (void *)MEMORY[0x1E4F94168];
  v73[0] = v72;
  v73[1] = v56;
  v73[2] = v47;
  v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:3];
  v50 = [v48 moduleWithTitle:@"Spotlight" contents:v49];

  return v50;
}

- (SBFFluidBehaviorSettings)opacityAnimationSettings
{
  return self->_opacityAnimationSettings;
}

- (void)setOpacityAnimationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)snappyOpacityAnimationSettings
{
  return self->_snappyOpacityAnimationSettings;
}

- (void)setSnappyOpacityAnimationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)scaleAnimationSettings
{
  return self->_scaleAnimationSettings;
}

- (void)setScaleAnimationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)snappyScaleAnimationSettings
{
  return self->_snappyScaleAnimationSettings;
}

- (void)setSnappyScaleAnimationSettings:(id)a3
{
}

- (double)anchorPointY
{
  return self->_anchorPointY;
}

- (void)setAnchorPointY:(double)a3
{
  self->_anchorPointY = a3;
}

- (double)hiddenScale
{
  return self->_hiddenScale;
}

- (void)setHiddenScale:(double)a3
{
  self->_hiddenScale = a3;
}

- (double)hiddenBlurRadius
{
  return self->_hiddenBlurRadius;
}

- (void)setHiddenBlurRadius:(double)a3
{
  self->_hiddenBlurRadius = a3;
}

- (double)minTranslationToShowSpotlight
{
  return self->_minTranslationToShowSpotlight;
}

- (void)setMinTranslationToShowSpotlight:(double)a3
{
  self->_minTranslationToShowSpotlight = a3;
}

- (double)maxTranslationForSpotlightScale
{
  return self->_maxTranslationForSpotlightScale;
}

- (void)setMaxTranslationForSpotlightScale:(double)a3
{
  self->_maxTranslationForSpotlightScale = a3;
}

- (double)spotlightScaleRubberbandingMin
{
  return self->_spotlightScaleRubberbandingMin;
}

- (void)setSpotlightScaleRubberbandingMin:(double)a3
{
  self->_spotlightScaleRubberbandingMin = a3;
}

- (double)spotlightScaleRubberbandingMax
{
  return self->_spotlightScaleRubberbandingMax;
}

- (void)setSpotlightScaleRubberbandingMax:(double)a3
{
  self->_spotlightScaleRubberbandingMax = a3;
}

- (double)spotlightScaleRubberbandingRange
{
  return self->_spotlightScaleRubberbandingRange;
}

- (void)setSpotlightScaleRubberbandingRange:(double)a3
{
  self->_spotlightScaleRubberbandingRange = a3;
}

- (double)maxTranslationForHomeScreenScale
{
  return self->_maxTranslationForHomeScreenScale;
}

- (void)setMaxTranslationForHomeScreenScale:(double)a3
{
  self->_maxTranslationForHomeScreenScale = a3;
}

- (double)homeScreenScaleRubberbandingMin
{
  return self->_homeScreenScaleRubberbandingMin;
}

- (void)setHomeScreenScaleRubberbandingMin:(double)a3
{
  self->_homeScreenScaleRubberbandingMin = a3;
}

- (double)homeScreenScaleRubberbandingMax
{
  return self->_homeScreenScaleRubberbandingMax;
}

- (void)setHomeScreenScaleRubberbandingMax:(double)a3
{
  self->_homeScreenScaleRubberbandingMax = a3;
}

- (double)homeScreenScaleRubberbandingRange
{
  return self->_homeScreenScaleRubberbandingRange;
}

- (void)setHomeScreenScaleRubberbandingRange:(double)a3
{
  self->_homeScreenScaleRubberbandingRange = a3;
}

- (double)maxTranslationForDimmingView
{
  return self->_maxTranslationForDimmingView;
}

- (void)setMaxTranslationForDimmingView:(double)a3
{
  self->_maxTranslationForDimmingView = a3;
}

- (double)dimmingViewRubberbandingMin
{
  return self->_dimmingViewRubberbandingMin;
}

- (void)setDimmingViewRubberbandingMin:(double)a3
{
  self->_dimmingViewRubberbandingMin = a3;
}

- (double)dimmingViewRubberbandingMax
{
  return self->_dimmingViewRubberbandingMax;
}

- (void)setDimmingViewRubberbandingMax:(double)a3
{
  self->_dimmingViewRubberbandingMax = a3;
}

- (double)dimmingViewRubberbandingRange
{
  return self->_dimmingViewRubberbandingRange;
}

- (void)setDimmingViewRubberbandingRange:(double)a3
{
  self->_dimmingViewRubberbandingRange = a3;
}

- (double)spotlightTranslationRubberbandingRange
{
  return self->_spotlightTranslationRubberbandingRange;
}

- (void)setSpotlightTranslationRubberbandingRange:(double)a3
{
  self->_spotlightTranslationRubberbandingRange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snappyScaleAnimationSettings, 0);
  objc_storeStrong((id *)&self->_scaleAnimationSettings, 0);
  objc_storeStrong((id *)&self->_snappyOpacityAnimationSettings, 0);
  objc_storeStrong((id *)&self->_opacityAnimationSettings, 0);
}

@end