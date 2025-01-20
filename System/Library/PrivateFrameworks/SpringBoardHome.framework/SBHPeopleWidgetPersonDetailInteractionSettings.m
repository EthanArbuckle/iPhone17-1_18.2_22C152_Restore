@interface SBHPeopleWidgetPersonDetailInteractionSettings
+ (id)settingsControllerModule;
- (BOOL)usesCardStyle;
- (SBFFluidBehaviorSettings)fadeOutAnimationSettings;
- (SBFFluidBehaviorSettings)zoomAnimationSettings;
- (double)cardCornerRadius;
- (double)cardHeightLandscape;
- (double)cardHeightPortrait;
- (double)cardStyleDarkeningTintAlpha;
- (double)cardStyleHomeScreenAlpha;
- (double)cardStyleHomeScreenScale;
- (double)cardWidth;
- (double)fractionBetweenSourceAndContainerX;
- (double)fractionBetweenSourceAndContainerY;
- (double)fullScreenDarkeningTintAlpha;
- (double)fullScreenHomeScreenAlpha;
- (double)fullScreenHomeScreenScale;
- (double)percentMargin;
- (void)setCardCornerRadius:(double)a3;
- (void)setCardHeightLandscape:(double)a3;
- (void)setCardHeightPortrait:(double)a3;
- (void)setCardStyleDarkeningTintAlpha:(double)a3;
- (void)setCardStyleHomeScreenAlpha:(double)a3;
- (void)setCardStyleHomeScreenScale:(double)a3;
- (void)setCardWidth:(double)a3;
- (void)setDefaultValues;
- (void)setFadeOutAnimationSettings:(id)a3;
- (void)setFractionBetweenSourceAndContainerX:(double)a3;
- (void)setFractionBetweenSourceAndContainerY:(double)a3;
- (void)setFullScreenDarkeningTintAlpha:(double)a3;
- (void)setFullScreenHomeScreenAlpha:(double)a3;
- (void)setFullScreenHomeScreenScale:(double)a3;
- (void)setPercentMargin:(double)a3;
- (void)setUsesCardStyle:(BOOL)a3;
- (void)setZoomAnimationSettings:(id)a3;
@end

@implementation SBHPeopleWidgetPersonDetailInteractionSettings

- (void)setDefaultValues
{
  v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    [(SBHPeopleWidgetPersonDetailInteractionSettings *)self setUsesCardStyle:1];
    [(SBHPeopleWidgetPersonDetailInteractionSettings *)self setCardWidth:375.0];
    [(SBHPeopleWidgetPersonDetailInteractionSettings *)self setCardHeightPortrait:700.0];
    [(SBHPeopleWidgetPersonDetailInteractionSettings *)self setCardHeightLandscape:660.0];
    [(SBHPeopleWidgetPersonDetailInteractionSettings *)self setCardCornerRadius:22.0];
    [(SBHPeopleWidgetPersonDetailInteractionSettings *)self setCardStyleHomeScreenScale:0.96];
    [(SBHPeopleWidgetPersonDetailInteractionSettings *)self setCardStyleHomeScreenAlpha:0.9];
    [(SBHPeopleWidgetPersonDetailInteractionSettings *)self setCardStyleDarkeningTintAlpha:0.32];
    [(SBHPeopleWidgetPersonDetailInteractionSettings *)self setFullScreenHomeScreenScale:0.96];
    [(SBHPeopleWidgetPersonDetailInteractionSettings *)self setFullScreenHomeScreenAlpha:0.4];
    [(SBHPeopleWidgetPersonDetailInteractionSettings *)self setFullScreenDarkeningTintAlpha:0.32];
    v5 = [(SBHPeopleWidgetPersonDetailInteractionSettings *)self zoomAnimationSettings];
    [v5 setDefaultValues];

    v6 = [(SBHPeopleWidgetPersonDetailInteractionSettings *)self zoomAnimationSettings];
    [v6 setDampingRatio:1.1];

    v7 = [(SBHPeopleWidgetPersonDetailInteractionSettings *)self zoomAnimationSettings];
    [v7 setResponse:0.25];

    v8 = [(SBHPeopleWidgetPersonDetailInteractionSettings *)self zoomAnimationSettings];
    [v8 setRetargetImpulse:0.016];

    v9 = [(SBHPeopleWidgetPersonDetailInteractionSettings *)self fadeOutAnimationSettings];
    [v9 setDefaultValues];

    v10 = [(SBHPeopleWidgetPersonDetailInteractionSettings *)self fadeOutAnimationSettings];
    [v10 setDampingRatio:1.1];

    v11 = [(SBHPeopleWidgetPersonDetailInteractionSettings *)self fadeOutAnimationSettings];
    [v11 setResponse:0.18];

    v12 = [(SBHPeopleWidgetPersonDetailInteractionSettings *)self fadeOutAnimationSettings];
    [v12 setRetargetImpulse:0.016];
    double v13 = 0.06;
  }
  else
  {
    v14 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v14 scale];

    [(SBHPeopleWidgetPersonDetailInteractionSettings *)self setUsesCardStyle:0];
    UIRoundToScale();
    -[SBHPeopleWidgetPersonDetailInteractionSettings setCardWidth:](self, "setCardWidth:");
    [(SBHPeopleWidgetPersonDetailInteractionSettings *)self setCardHeightPortrait:480.0];
    [(SBHPeopleWidgetPersonDetailInteractionSettings *)self setCardHeightLandscape:480.0];
    UIRoundToScale();
    -[SBHPeopleWidgetPersonDetailInteractionSettings setCardCornerRadius:](self, "setCardCornerRadius:");
    [(SBHPeopleWidgetPersonDetailInteractionSettings *)self setCardStyleHomeScreenScale:0.94];
    [(SBHPeopleWidgetPersonDetailInteractionSettings *)self setCardStyleHomeScreenAlpha:0.4];
    [(SBHPeopleWidgetPersonDetailInteractionSettings *)self setCardStyleDarkeningTintAlpha:0.2];
    [(SBHPeopleWidgetPersonDetailInteractionSettings *)self setFullScreenHomeScreenScale:0.9];
    [(SBHPeopleWidgetPersonDetailInteractionSettings *)self setFullScreenHomeScreenAlpha:0.4];
    [(SBHPeopleWidgetPersonDetailInteractionSettings *)self setFullScreenDarkeningTintAlpha:0.6];
    v15 = [(SBHPeopleWidgetPersonDetailInteractionSettings *)self zoomAnimationSettings];
    [v15 setDefaultValues];

    v16 = [(SBHPeopleWidgetPersonDetailInteractionSettings *)self zoomAnimationSettings];
    [v16 setDampingRatio:0.9];

    v17 = [(SBHPeopleWidgetPersonDetailInteractionSettings *)self zoomAnimationSettings];
    [v17 setResponse:0.5];

    v18 = [(SBHPeopleWidgetPersonDetailInteractionSettings *)self fadeOutAnimationSettings];
    [v18 setDefaultValues];

    v19 = [(SBHPeopleWidgetPersonDetailInteractionSettings *)self fadeOutAnimationSettings];
    [v19 setDampingRatio:1.0];

    v12 = [(SBHPeopleWidgetPersonDetailInteractionSettings *)self fadeOutAnimationSettings];
    [v12 setResponse:0.2];
    double v13 = 0.1;
  }

  [(SBHPeopleWidgetPersonDetailInteractionSettings *)self setPercentMargin:v13];
  [(SBHPeopleWidgetPersonDetailInteractionSettings *)self setFractionBetweenSourceAndContainerX:0.0];
  [(SBHPeopleWidgetPersonDetailInteractionSettings *)self setFractionBetweenSourceAndContainerY:0.5];
}

+ (id)settingsControllerModule
{
  v59[16] = *MEMORY[0x1E4F143B8];
  v42 = (void *)MEMORY[0x1E4F94160];
  v56 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Use Card Style" valueKeyPath:@"usesCardStyle"];
  v59[0] = v56;
  v55 = [MEMORY[0x1E4F94148] rowWithTitle:@"Card Width" valueKeyPath:@"cardWidth"];
  v54 = [v55 between:1.0 and:3000.0];
  v53 = [v54 precision:0];
  v59[1] = v53;
  v52 = [MEMORY[0x1E4F94148] rowWithTitle:@"Card Height (Portrait)" valueKeyPath:@"cardHeightPortrait"];
  v51 = [v52 between:1.0 and:3000.0];
  v50 = [v51 precision:0];
  v59[2] = v50;
  v49 = [MEMORY[0x1E4F94148] rowWithTitle:@"Card Height (Landscape)" valueKeyPath:@"cardHeightLandscape"];
  v48 = [v49 between:1.0 and:3000.0];
  v47 = [v48 precision:0];
  v59[3] = v47;
  v46 = [MEMORY[0x1E4F94148] rowWithTitle:@"Card Corner Radius" valueKeyPath:@"cardCornerRadius"];
  v45 = [v46 between:1.0 and:100.0];
  v44 = [v45 precision:0];
  v59[4] = v44;
  v41 = [MEMORY[0x1E4F94148] rowWithTitle:@"Card Home Screen Scale" valueKeyPath:@"cardStyleHomeScreenScale"];
  v40 = [v41 between:0.0 and:1.0];
  v39 = [v40 precision:2];
  v59[5] = v39;
  v38 = [MEMORY[0x1E4F94148] rowWithTitle:@"Card Home Screen Alpha" valueKeyPath:@"cardStyleHomeScreenAlpha"];
  v37 = [v38 between:0.0 and:1.0];
  v36 = [v37 precision:2];
  v59[6] = v36;
  v35 = [MEMORY[0x1E4F94148] rowWithTitle:@"Card Darkening Tint Alpha" valueKeyPath:@"cardStyleDarkeningTintAlpha"];
  v34 = [v35 between:0.0 and:1.0];
  v33 = [v34 precision:2];
  v59[7] = v33;
  v32 = [MEMORY[0x1E4F94148] rowWithTitle:@"Home Screen Scale" valueKeyPath:@"fullScreenHomeScreenScale"];
  v31 = [v32 between:0.0 and:1.0];
  v30 = [v31 precision:2];
  v59[8] = v30;
  v29 = [MEMORY[0x1E4F94148] rowWithTitle:@"Home Screen Alpha" valueKeyPath:@"fullScreenHomeScreenAlpha"];
  v28 = [v29 between:0.0 and:1.0];
  v27 = [v28 precision:2];
  v59[9] = v27;
  v26 = [MEMORY[0x1E4F94148] rowWithTitle:@"Darkening Tint Alpha" valueKeyPath:@"fullScreenDarkeningTintAlpha"];
  v25 = [v26 between:0.0 and:1.0];
  v24 = [v25 precision:2];
  v59[10] = v24;
  v23 = [MEMORY[0x1E4F94130] rowWithTitle:@"Zoom Animation Settings" childSettingsKeyPath:@"zoomAnimationSettings"];
  v59[11] = v23;
  v22 = [MEMORY[0x1E4F94130] rowWithTitle:@"Fade Out Animation Settings" childSettingsKeyPath:@"fadeOutAnimationSettings"];
  v59[12] = v22;
  v2 = [MEMORY[0x1E4F94148] rowWithTitle:@"Margin Percentage" valueKeyPath:@"percentMargin"];
  v3 = [v2 between:0.0 and:1.0];
  uint64_t v4 = [v3 precision:2];
  v59[13] = v4;
  v5 = [MEMORY[0x1E4F94148] rowWithTitle:@"Center Fraction X" valueKeyPath:@"fractionBetweenSourceAndContainerX"];
  v6 = [v5 between:0.0 and:1.0];
  v7 = [v6 precision:2];
  v59[14] = v7;
  v8 = [MEMORY[0x1E4F94148] rowWithTitle:@"Center Fraction Y" valueKeyPath:@"fractionBetweenSourceAndContainerY"];
  v9 = [v8 between:0.0 and:1.0];
  v10 = [v9 precision:2];
  v59[15] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:16];
  v43 = [v42 sectionWithRows:v11];

  v12 = (void *)MEMORY[0x1E4F940F8];
  double v13 = [MEMORY[0x1E4F94170] action];
  v14 = [v12 rowWithTitle:@"Restore Defaults" action:v13];

  v15 = (void *)MEMORY[0x1E4F94160];
  v58 = v14;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v58 count:1];
  v17 = [v15 sectionWithRows:v16];

  v18 = (void *)MEMORY[0x1E4F94160];
  v57[0] = v43;
  v57[1] = v17;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:2];
  v20 = [v18 moduleWithTitle:@"Person Detail Interaction" contents:v19];

  return v20;
}

- (BOOL)usesCardStyle
{
  return self->_usesCardStyle;
}

- (void)setUsesCardStyle:(BOOL)a3
{
  self->_usesCardStyle = a3;
}

- (double)cardWidth
{
  return self->_cardWidth;
}

- (void)setCardWidth:(double)a3
{
  self->_cardWidth = a3;
}

- (double)cardHeightPortrait
{
  return self->_cardHeightPortrait;
}

- (void)setCardHeightPortrait:(double)a3
{
  self->_cardHeightPortrait = a3;
}

- (double)cardHeightLandscape
{
  return self->_cardHeightLandscape;
}

- (void)setCardHeightLandscape:(double)a3
{
  self->_cardHeightLandscape = a3;
}

- (double)cardCornerRadius
{
  return self->_cardCornerRadius;
}

- (void)setCardCornerRadius:(double)a3
{
  self->_cardCornerRadius = a3;
}

- (double)cardStyleHomeScreenScale
{
  return self->_cardStyleHomeScreenScale;
}

- (void)setCardStyleHomeScreenScale:(double)a3
{
  self->_cardStyleHomeScreenScale = a3;
}

- (double)cardStyleHomeScreenAlpha
{
  return self->_cardStyleHomeScreenAlpha;
}

- (void)setCardStyleHomeScreenAlpha:(double)a3
{
  self->_cardStyleHomeScreenAlpha = a3;
}

- (double)cardStyleDarkeningTintAlpha
{
  return self->_cardStyleDarkeningTintAlpha;
}

- (void)setCardStyleDarkeningTintAlpha:(double)a3
{
  self->_cardStyleDarkeningTintAlpha = a3;
}

- (double)fullScreenHomeScreenScale
{
  return self->_fullScreenHomeScreenScale;
}

- (void)setFullScreenHomeScreenScale:(double)a3
{
  self->_fullScreenHomeScreenScale = a3;
}

- (double)fullScreenHomeScreenAlpha
{
  return self->_fullScreenHomeScreenAlpha;
}

- (void)setFullScreenHomeScreenAlpha:(double)a3
{
  self->_fullScreenHomeScreenAlpha = a3;
}

- (double)fullScreenDarkeningTintAlpha
{
  return self->_fullScreenDarkeningTintAlpha;
}

- (void)setFullScreenDarkeningTintAlpha:(double)a3
{
  self->_fullScreenDarkeningTintAlpha = a3;
}

- (SBFFluidBehaviorSettings)zoomAnimationSettings
{
  return self->_zoomAnimationSettings;
}

- (void)setZoomAnimationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)fadeOutAnimationSettings
{
  return self->_fadeOutAnimationSettings;
}

- (void)setFadeOutAnimationSettings:(id)a3
{
}

- (double)percentMargin
{
  return self->_percentMargin;
}

- (void)setPercentMargin:(double)a3
{
  self->_percentMargin = a3;
}

- (double)fractionBetweenSourceAndContainerX
{
  return self->_fractionBetweenSourceAndContainerX;
}

- (void)setFractionBetweenSourceAndContainerX:(double)a3
{
  self->_fractionBetweenSourceAndContainerX = a3;
}

- (double)fractionBetweenSourceAndContainerY
{
  return self->_fractionBetweenSourceAndContainerY;
}

- (void)setFractionBetweenSourceAndContainerY:(double)a3
{
  self->_fractionBetweenSourceAndContainerY = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fadeOutAnimationSettings, 0);
  objc_storeStrong((id *)&self->_zoomAnimationSettings, 0);
}

@end