@interface SBRingerAlertElement
- (BOOL)isActivatedForPreviewing;
- (BOOL)isPresented;
- (BOOL)isProvidedViewConcentric:(id)a3 inLayoutMode:(int64_t)a4;
- (BOOL)isRingerSilent;
- (BOOL)lastEventIsAVolumeChange;
- (BOOL)overridesConcentricPaddingForView:(id)a3 inLayoutMode:(int64_t)a4;
- (NSDirectionalEdgeInsets)preferredEdgeOutsetsForLayoutMode:(int64_t)a3 suggestedOutsets:(NSDirectionalEdgeInsets)a4 maximumOutsets:(NSDirectionalEdgeInsets)a5;
- (SAInvalidatable)assertion;
- (SBRingerAlertElement)initWithSource:(unint64_t)a3 ringerSilent:(BOOL)a4 forPreviewing:(BOOL)a5;
- (SBRingerAlertElementDelegate)delegate;
- (SBRingerVolumeSliderView)minimalSliderView;
- (SBRingerVolumeSliderView)sliderView;
- (SBUISystemApertureCAPackageContentProvider)leadingRingerContentViewProvider;
- (SBUISystemApertureCAPackageContentProvider)minimalRingerContentViewProvider;
- (SBUISystemApertureContentProvider)contentProvider;
- (SBUISystemApertureContentViewProviding)minimalContentViewProvider;
- (SBUISystemApertureTextContentProvider)trailingTextContentViewProvider;
- (UIColor)keyColor;
- (double)concentricPaddingOverrideForView:(id)a3 inLayoutMode:(int64_t)a4;
- (double)overshoot;
- (float)volume;
- (id)_bellImageForRingerSilent:(BOOL)a3;
- (id)_colorForRingerSilent:(BOOL)a3;
- (id)_containedVolumeSliderViewWithSize:(CGSize)a3 layoutAxis:(int64_t)a4;
- (id)_leadingContentViewProviderForVolume;
- (id)_minimalContentForSource:(unint64_t)a3 visualStyle:(unint64_t)a4 ringerSilent:(BOOL)a5;
- (id)_ringerPackageNameForVisualStyle:(unint64_t)a3 minimal:(BOOL)a4;
- (id)_textForRingerSilent:(BOOL)a3;
- (id)alertHost;
- (id)elementIdentifier;
- (unint64_t)source;
- (unint64_t)visualStyle;
- (void)_getRingerPackageSizesForVisualStyle:(unint64_t)a3 ringerSilent:(BOOL)a4 leadingSize:(CGSize *)a5 minimalSize:(CGSize *)a6;
- (void)_setRingerSilent:(BOOL)a3 skipUpdate:(BOOL)a4;
- (void)_shakeRingerBell;
- (void)_updateStateWithTransitionType:(unint64_t)a3;
- (void)_updateVolumeSliderAnimated:(BOOL)a3;
- (void)buttonReleased;
- (void)nudgeUp:(BOOL)a3;
- (void)presentForMuteChange:(BOOL)a3;
- (void)setActivatedForPreviewing:(BOOL)a3;
- (void)setAlertHost:(id)a3;
- (void)setAssertion:(id)a3;
- (void)setContentProvider:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLastEventIsAVolumeChange:(BOOL)a3;
- (void)setLeadingRingerContentViewProvider:(id)a3;
- (void)setMinimalContentViewProvider:(id)a3;
- (void)setMinimalRingerContentViewProvider:(id)a3;
- (void)setMinimalSliderView:(id)a3;
- (void)setOvershoot:(double)a3;
- (void)setRingerSilent:(BOOL)a3;
- (void)setSliderView:(id)a3;
- (void)setSource:(unint64_t)a3;
- (void)setTrailingTextContentViewProvider:(id)a3;
- (void)setVisualStyle:(unint64_t)a3;
- (void)setVolume:(float)a3;
- (void)setVolume:(float)a3 animated:(BOOL)a4 forKeyPress:(BOOL)a5;
@end

@implementation SBRingerAlertElement

- (SBRingerAlertElement)initWithSource:(unint64_t)a3 ringerSilent:(BOOL)a4 forPreviewing:(BOOL)a5
{
  BOOL v5 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4FA7D70]);
  BOOL v9 = (SBUIHasHIDRingerButton() & 1) != 0 || _os_feature_enabled_impl();
  BOOL v10 = v9;
  uint64_t v11 = -[SBRingerAlertElement _ringerPackageNameForVisualStyle:minimal:](self, "_ringerPackageNameForVisualStyle:minimal:");
  id v12 = objc_alloc(MEMORY[0x1E4FA7D68]);
  v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v29 = (void *)v11;
  v14 = (void *)[v12 initWithPackageName:v11 inBundle:v13];

  id v15 = objc_alloc(MEMORY[0x1E4FA7DB0]);
  v16 = [(SBRingerAlertElement *)self _textForRingerSilent:v5];
  v17 = (void *)[v15 initWithText:v16 style:4];

  v18 = [(SBRingerAlertElement *)self _colorForRingerSilent:v5];
  [v17 setContentColor:v18];

  v31 = [(SBRingerAlertElement *)self _leadingContentViewProviderForVolume];
  v19 = -[SBRingerAlertElement _containedVolumeSliderViewWithSize:layoutAxis:](self, "_containedVolumeSliderViewWithSize:layoutAxis:", 0, 82.0, 5.0);
  v20 = [v19 subviews];
  v21 = objc_msgSend(v20, "bs_firstObjectOfClass:", objc_opt_class());

  objc_storeStrong((id *)&self->_sliderView, v21);
  if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1)
  {
    CGAffineTransformMakeScale(&v33, -1.0, 1.0);
    [v21 setTransform:&v33];
  }
  v30 = (void *)[objc_alloc(MEMORY[0x1E4FA7D78]) initWithView:v19];
  v22 = v14;
  v23 = v17;
  if (a3)
  {
    if (a3 != 1) {
      goto LABEL_11;
    }
    v23 = v30;
    v22 = v31;
  }
  [v8 setLeadingContentViewProvider:v22];
  [v8 setTrailingContentViewProvider:v23];
LABEL_11:
  v24 = [(SBRingerAlertElement *)self _minimalContentForSource:a3 visualStyle:v10 ringerSilent:v5];
  [v8 setMinimalContentViewProvider:v24];
  v32.receiver = self;
  v32.super_class = (Class)SBRingerAlertElement;
  v25 = [(SBSystemApertureProvidedContentElement *)&v32 initWithIdentifier:self contentProvider:v8];
  v26 = v25;
  if (v25)
  {
    v25->_source = a3;
    v25->_visualStyle = v10;
    objc_storeStrong((id *)&v25->_contentProvider, v8);
    v26->_activatedForPreviewing = a5;
    objc_storeStrong((id *)&v26->_leadingRingerContentViewProvider, v14);
    objc_storeStrong((id *)&v26->_minimalContentViewProvider, v24);
    objc_storeStrong((id *)&v26->_trailingTextContentViewProvider, v17);
    [(SBSystemApertureProvidedContentElement *)v26 setMinimumSupportedLayoutMode:-1];
    [(SBSystemApertureProvidedContentElement *)v26 setMaximumSupportedLayoutMode:2];
    [(SBSystemApertureProvidedContentElement *)v26 setPreferredLayoutMode:2];
    [(SBRingerAlertElement *)v26 _setRingerSilent:v5 skipUpdate:1];
    [(SBRingerAlertElement *)v26 _updateStateWithTransitionType:v5 ^ 1];
  }

  return v26;
}

- (BOOL)isProvidedViewConcentric:(id)a3 inLayoutMode:(int64_t)a4
{
  id v5 = a3;
  v6 = [(SBRingerAlertElement *)self leadingRingerContentViewProvider];
  id v7 = [v6 providedView];
  id v8 = [(SBRingerAlertElement *)self minimalRingerContentViewProvider];
  id v9 = [v8 providedView];

  BOOL v11 = v7 == v5 || v9 == v5;
  return v11;
}

- (UIColor)keyColor
{
  BOOL v3 = [(SBRingerAlertElement *)self isRingerSilent];
  if ([(SBRingerAlertElement *)self source]) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = v3;
  }
  return (UIColor *)[(SBRingerAlertElement *)self _colorForRingerSilent:v4];
}

- (BOOL)overridesConcentricPaddingForView:(id)a3 inLayoutMode:(int64_t)a4
{
  id v6 = a3;
  unint64_t v7 = [(SBRingerAlertElement *)self visualStyle];
  BOOL v8 = [(SBRingerAlertElement *)self isProvidedViewConcentric:v6 inLayoutMode:a4];

  return v7 == 1 && v8;
}

- (double)concentricPaddingOverrideForView:(id)a3 inLayoutMode:(int64_t)a4
{
  return 0.0;
}

- (void)setRingerSilent:(BOOL)a3
{
}

- (void)_setRingerSilent:(BOOL)a3 skipUpdate:(BOOL)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL ringerSilent = self->_ringerSilent;
  if (ringerSilent != a3)
  {
    BOOL v6 = a3;
    self->_BOOL ringerSilent = a3;
    BOOL v8 = SBLogRingerHUD();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v15 = v6;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "SBRingerAlertElement setRingerSilent: %{BOOL}d", buf, 8u);
    }

    self->_lastEventIsAVolumeChange = 0;
    if (!a4)
    {
      if (ringerSilent) {
        uint64_t v9 = 3;
      }
      else {
        uint64_t v9 = 2;
      }
      [(SBRingerAlertElement *)self _updateStateWithTransitionType:v9];
    }
    BOOL v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v12 = @"SBSystemApertureNotificationUserInfoElementKey";
    v13 = self;
    BOOL v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    [v10 postNotificationName:@"SBSystemApertureElementKeyColorDidInvalidateNotification" object:0 userInfo:v11];
  }
}

- (void)setVolume:(float)a3
{
}

- (void)setVolume:(float)a3 animated:(BOOL)a4 forKeyPress:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = SBLogRingerHUD();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134218496;
    double v12 = a3;
    __int16 v13 = 1024;
    BOOL v14 = v6;
    __int16 v15 = 1024;
    BOOL v16 = v5;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "SBRingerAlertElement setVolume:%.2f animated:%{BOOL}d forKeyPress:%{BOOL}d", (uint8_t *)&v11, 0x18u);
  }

  BOOL v10 = [(SBRingerAlertElement *)self delegate];
  [v10 ringerAlertElementWantsToResetAutomaticInvalidationTimer:self];
  if (v5) {
    self->_lastEventIsAVolumeChange = 1;
  }
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_volume = a3;
    [(SBRingerAlertElement *)self _updateVolumeSliderAnimated:v6];
  }
}

- (BOOL)isPresented
{
  return [(SBSystemApertureProvidedContentElement *)self layoutMode] > 0;
}

- (void)presentForMuteChange:(BOOL)a3
{
  [(SBRingerAlertElement *)self _updateVolumeSliderAnimated:0];
  id v4 = [(SBRingerAlertElement *)self delegate];
  [v4 ringerAlertElementWantsToBePresented:self];
  [v4 ringerAlertElementWantsToResetAutomaticInvalidationTimer:self];
}

- (void)nudgeUp:(BOOL)a3
{
  if (a3)
  {
    if ((BSFloatIsOne() & 1) == 0) {
      return;
    }
    double v4 = 0.0625;
  }
  else
  {
    if (!BSFloatLessThanOrEqualToFloat()) {
      return;
    }
    double v4 = -0.0625;
  }
  self->_overshoot = self->_overshoot + v4;
  [(SBRingerAlertElement *)self _updateVolumeSliderAnimated:1];
}

- (void)buttonReleased
{
  self->_overshoot = 0.0;
  [(SBRingerAlertElement *)self _updateVolumeSliderAnimated:1];
}

- (void)_updateVolumeSliderAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  float v5 = self->_overshoot + self->_volume;
  double v6 = v5;
  -[SBRingerVolumeSliderView setValue:animated:](self->_sliderView, "setValue:animated:", v5);
  minimalSliderView = self->_minimalSliderView;
  [(SBRingerVolumeSliderView *)minimalSliderView setValue:v3 animated:v6];
}

- (void)_updateStateWithTransitionType:(unint64_t)a3
{
  unint64_t v5 = [(SBRingerAlertElement *)self source];
  if (v5 == 1)
  {
    id v23 = [(SBRingerAlertElement *)self _leadingContentViewProviderForVolume];
    v18 = [(SBRingerAlertElement *)self contentProvider];
    [v18 setLeadingContentViewProvider:v23];
  }
  else if (!v5)
  {
    double v6 = [(SBSystemApertureProvidedContentElement *)self layoutHost];
    BOOL v7 = [(SBRingerAlertElement *)self isRingerSilent];
    unint64_t v8 = [(SBRingerAlertElement *)self visualStyle];
    uint64_t v9 = [(SBRingerAlertElement *)self leadingRingerContentViewProvider];
    BOOL v10 = [(SBRingerAlertElement *)self minimalRingerContentViewProvider];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __55__SBRingerAlertElement__updateStateWithTransitionType___block_invoke;
    v29[3] = &unk_1E6AF7150;
    v29[4] = self;
    unint64_t v32 = v8;
    BOOL v33 = v7;
    id v11 = v9;
    id v30 = v11;
    id v12 = v10;
    id v31 = v12;
    __int16 v13 = (void (**)(void))MEMORY[0x1D948C7A0](v29);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __55__SBRingerAlertElement__updateStateWithTransitionType___block_invoke_2;
    v26[3] = &unk_1E6B0C258;
    id v14 = v11;
    id v27 = v14;
    id v15 = v12;
    id v28 = v15;
    uint64_t v16 = MEMORY[0x1D948C7A0](v26);
    uint64_t v17 = (void *)v16;
    switch(a3)
    {
      case 0uLL:
        (*(void (**)(uint64_t, __CFString *, void))(v16 + 16))(v16, @"silent", 0);
        v13[2](v13);
        goto LABEL_14;
      case 1uLL:
        (*(void (**)(uint64_t, __CFString *, void))(v16 + 16))(v16, @"ringer", 0);
        v13[2](v13);
        if (![(SBRingerAlertElement *)self isActivatedForPreviewing])
        {
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __55__SBRingerAlertElement__updateStateWithTransitionType___block_invoke_3;
          block[3] = &unk_1E6AF6828;
          block[4] = self;
          id v25 = v17;
          dispatch_async(MEMORY[0x1E4F14428], block);
        }
        goto LABEL_14;
      case 2uLL:
        v19 = (void (**)(void *, __CFString *, uint64_t))(v16 + 16);
        (*(void (**)(uint64_t, __CFString *, void))(v16 + 16))(v16, @"ringer", 0);
        [MEMORY[0x1E4F42FF0] animateWithDuration:v13 animations:0.18];
        (*v19)(v17, @"silent", 1);
        goto LABEL_13;
      case 3uLL:
        (*(void (**)(uint64_t, __CFString *, uint64_t))(v16 + 16))(v16, @"ringer", 1);
        [MEMORY[0x1E4F42FF0] animateWithDuration:v13 animations:0.18];
        [v6 preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:self];
        [(SBRingerAlertElement *)self _shakeRingerBell];
        goto LABEL_13;
      default:
        if (a3 >= 2)
        {
LABEL_13:
          v20 = [(SBRingerAlertElement *)self _textForRingerSilent:v7];
          v21 = [(SBRingerAlertElement *)self _colorForRingerSilent:v7];
          v22 = [(SBRingerAlertElement *)self trailingTextContentViewProvider];
          [v22 swapInText:v20 textColor:v21];
        }
LABEL_14:

        break;
    }
  }
}

uint64_t __55__SBRingerAlertElement__updateStateWithTransitionType___block_invoke(uint64_t a1)
{
  double v5 = 0.0;
  double v6 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  [*(id *)(a1 + 32) _getRingerPackageSizesForVisualStyle:*(void *)(a1 + 56) ringerSilent:*(unsigned __int8 *)(a1 + 64) leadingSize:&v5 minimalSize:&v3];
  objc_msgSend(*(id *)(a1 + 40), "setIntrinsicPackageSize:", v5, v6);
  return objc_msgSend(*(id *)(a1 + 48), "setIntrinsicPackageSize:", v3, v4);
}

void __55__SBRingerAlertElement__updateStateWithTransitionType___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  double v5 = *(void **)(a1 + 32);
  id v6 = a2;
  [v5 setState:v6 animated:a3];
  [*(id *)(a1 + 40) setState:v6 animated:a3];
}

uint64_t __55__SBRingerAlertElement__updateStateWithTransitionType___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _shakeRingerBell];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (id)_textForRingerSilent:(BOOL)a3
{
  BOOL v3 = a3;
  double v4 = [MEMORY[0x1E4F28B50] mainBundle];
  double v5 = v4;
  if (v3) {
    id v6 = @"RINGER_COMPACT_OFF";
  }
  else {
    id v6 = @"RINGER_COMPACT_ON";
  }
  BOOL v7 = [v4 localizedStringForKey:v6 value:&stru_1F3084718 table:@"SpringBoard"];

  return v7;
}

- (id)_colorForRingerSilent:(BOOL)a3
{
  if (a3) {
    [MEMORY[0x1E4F428B8] colorWithRed:0.996078431 green:0.266666667 blue:0.160784314 alpha:1.0];
  }
  else {
  BOOL v3 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  }
  return v3;
}

- (void)_shakeRingerBell
{
  if ([(SBSystemApertureProvidedContentElement *)self layoutMode] != 1)
  {
    BOOL v3 = +[SBSystemApertureDomain rootSettings];
    int v4 = [v3 shakeRingerBell];

    if (v4)
    {
      id v5 = [(SBSystemApertureProvidedContentElement *)self elementHost];
      [v5 elementRequestsNegativeResponse:self];
    }
  }
}

- (id)_leadingContentViewProviderForVolume
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v2 = [(SBRingerAlertElement *)self _bellImageForRingerSilent:[(SBRingerAlertElement *)self isRingerSilent]];
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4FA7D80]) initWithImage:v2];
  id v4 = objc_alloc(MEMORY[0x1E4FA7DB0]);
  id v5 = [MEMORY[0x1E4F28B50] mainBundle];
  id v6 = [v5 localizedStringForKey:@"RINGER_VOLUME" value:&stru_1F3084718 table:@"SpringBoard"];
  BOOL v7 = (void *)[v4 initWithText:v6 style:4];

  unint64_t v8 = [v7 contentColor];
  [v3 setContentColor:v8];

  id v9 = objc_alloc(MEMORY[0x1E4FA7DA8]);
  v13[0] = v3;
  v13[1] = v7;
  BOOL v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  id v11 = (void *)[v9 initWithContentViewProviders:v10];

  [v11 setContentDistribution:0];
  [v11 setContentSpacing:8.0];

  return v11;
}

- (id)_minimalContentForSource:(unint64_t)a3 visualStyle:(unint64_t)a4 ringerSilent:(BOOL)a5
{
  v52[9] = *MEMORY[0x1E4F143B8];
  if (a3 == 1)
  {
    v51 = -[SBRingerAlertElement _bellImageForRingerSilent:](self, "_bellImageForRingerSilent:", a5, a4);
    BOOL v10 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v51];
    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v11 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    [v10 setTintColor:v11];

    id v12 = -[SBRingerAlertElement _containedVolumeSliderViewWithSize:layoutAxis:](self, "_containedVolumeSliderViewWithSize:layoutAxis:", 1, 6.0, 42.0);
    [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
    __int16 v13 = [v12 subviews];
    objc_msgSend(v13, "bs_firstObjectOfClass:", objc_opt_class());
    id v14 = (SBRingerVolumeSliderView *)objc_claimAutoreleasedReturnValue();
    minimalSliderView = self->_minimalSliderView;
    self->_minimalSliderView = v14;

    id v16 = objc_alloc(MEMORY[0x1E4F42FF0]);
    uint64_t v17 = objc_msgSend(v16, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v17 addSubview:v12];
    [v17 addSubview:v10];
    [v12 bounds];
    double v19 = v18;
    double v21 = v20;
    v40 = (void *)MEMORY[0x1E4F28DC8];
    v50 = [v12 widthAnchor];
    v49 = [v50 constraintEqualToConstant:v19];
    v52[0] = v49;
    v48 = [v12 heightAnchor];
    v47 = [v48 constraintEqualToConstant:v21];
    v52[1] = v47;
    v46 = [v12 topAnchor];
    v45 = [v17 topAnchor];
    v44 = [v46 constraintEqualToAnchor:v45];
    v52[2] = v44;
    v43 = [v12 centerXAnchor];
    v42 = [v17 centerXAnchor];
    v41 = [v43 constraintEqualToAnchor:v42];
    v52[3] = v41;
    v38 = [v10 topAnchor];
    v37 = [v12 bottomAnchor];
    v36 = [v38 constraintEqualToAnchor:v37 constant:3.0];
    v52[4] = v36;
    v35 = [v10 centerXAnchor];
    v34 = [v17 centerXAnchor];
    BOOL v33 = [v35 constraintEqualToAnchor:v34];
    v52[5] = v33;
    unint64_t v32 = [v10 bottomAnchor];
    id v31 = [v17 bottomAnchor];
    v22 = [v32 constraintEqualToAnchor:v31];
    v52[6] = v22;
    id v23 = [v17 leadingAnchor];
    v39 = v10;
    v24 = [v10 leadingAnchor];
    id v25 = [v23 constraintEqualToAnchor:v24];
    v52[7] = v25;
    v26 = [v17 trailingAnchor];
    id v27 = [v10 trailingAnchor];
    id v28 = [v26 constraintEqualToAnchor:v27];
    v52[8] = v28;
    v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:9];
    [v40 activateConstraints:v29];

    id v5 = (void *)[objc_alloc(MEMORY[0x1E4FA7D78]) initWithView:v17];
  }
  else if (!a3)
  {
    BOOL v7 = -[SBRingerAlertElement _ringerPackageNameForVisualStyle:minimal:](self, "_ringerPackageNameForVisualStyle:minimal:", a4, 1, a5);
    id v8 = objc_alloc(MEMORY[0x1E4FA7D68]);
    id v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v5 = (void *)[v8 initWithPackageName:v7 inBundle:v9];

    objc_storeStrong((id *)&self->_minimalRingerContentViewProvider, v5);
  }
  return v5;
}

- (id)_containedVolumeSliderViewWithSize:(CGSize)a3 layoutAxis:(int64_t)a4
{
  id v5 = [SBRingerVolumeSliderView alloc];
  BSRectWithSize();
  id v6 = -[SBRingerVolumeSliderView initWithFrame:](v5, "initWithFrame:");
  [(SBRingerVolumeSliderView *)v6 setStyle:1];
  [(SBRingerVolumeSliderView *)v6 setLayoutAxis:a4];
  [(SBRingerVolumeSliderView *)v6 setRoundedStyle:1];
  id v7 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
  [v7 addSubview:v6];
  [(SBRingerVolumeSliderView *)v6 bounds];
  objc_msgSend(v7, "setFrame:");
  [v7 center];
  double v9 = v8;
  double v11 = v10;
  id v12 = [v7 superview];
  objc_msgSend(v7, "convertPoint:toView:", v12, v9, v11);
  double v14 = v13;
  double v16 = v15;

  -[SBRingerVolumeSliderView setCenter:](v6, "setCenter:", v14, v16);
  return v7;
}

- (id)_bellImageForRingerSilent:(BOOL)a3
{
  BOOL v3 = @"bell.fill";
  if (a3) {
    BOOL v3 = @"bell.slash.fill";
  }
  id v4 = (void *)MEMORY[0x1E4F42A98];
  id v5 = (void *)MEMORY[0x1E4F42A30];
  id v6 = v3;
  id v7 = objc_msgSend(v5, "sbui_systemAperturePreferredFontForTextStyle:", 4);
  double v8 = [v4 configurationWithFont:v7];

  double v9 = [MEMORY[0x1E4F42A80] systemImageNamed:v6 withConfiguration:v8];

  return v9;
}

- (id)_ringerPackageNameForVisualStyle:(unint64_t)a3 minimal:(BOOL)a4
{
  if (a3 == 1)
  {
    id v6 = @"Ringer-Leading-D83";
  }
  else if (a3)
  {
    id v6 = 0;
  }
  else
  {
    id v5 = @"Ringer-Leading-D73";
    if (a4) {
      id v5 = @"Ringer-Minimal-D73";
    }
    id v6 = v5;
  }
  return v6;
}

- (void)_getRingerPackageSizesForVisualStyle:(unint64_t)a3 ringerSilent:(BOOL)a4 leadingSize:(CGSize *)a5 minimalSize:(CGSize *)a6
{
  if (a3 == 1)
  {
    double v6 = 36.6666667;
    CGFloat v7 = 36.6666667;
    CGFloat v8 = 36.6666667;
    double v9 = 36.6666667;
  }
  else
  {
    double v6 = 0.0;
    CGFloat v7 = 0.0;
    CGFloat v8 = 0.0;
    double v9 = 0.0;
    if (!a3)
    {
      if (a4) {
        double v9 = 52.42;
      }
      else {
        double v9 = 21.58;
      }
      CGFloat v8 = 37.0;
      CGFloat v7 = 25.2;
      double v6 = 49.32;
      if (!a4) {
        double v6 = 25.2;
      }
    }
  }
  a5->width = v9;
  a5->height = v8;
  a6->width = v7;
  a6->height = v6;
}

- (id)elementIdentifier
{
  return @"Ringer Alert";
}

- (NSDirectionalEdgeInsets)preferredEdgeOutsetsForLayoutMode:(int64_t)a3 suggestedOutsets:(NSDirectionalEdgeInsets)a4 maximumOutsets:(NSDirectionalEdgeInsets)a5
{
  v11.receiver = self;
  v11.super_class = (Class)SBRingerAlertElement;
  -[SBSystemApertureProvidedContentElement preferredEdgeOutsetsForLayoutMode:suggestedOutsets:maximumOutsets:](&v11, sel_preferredEdgeOutsetsForLayoutMode_suggestedOutsets_maximumOutsets_, a4.top, a4.leading, a4.bottom, a4.trailing, a5.top, a5.leading, a5.bottom, a5.trailing);
  if (v7 <= v9) {
    double v10 = v7;
  }
  else {
    double v10 = v9;
  }
  if (a3 == 2)
  {
    double v9 = v10;
    double v7 = v10;
  }
  result.trailing = v9;
  result.bottom = v8;
  result.leading = v7;
  result.top = v6;
  return result;
}

- (id)alertHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertHost);
  return WeakRetained;
}

- (void)setAlertHost:(id)a3
{
}

- (BOOL)isRingerSilent
{
  return self->_ringerSilent;
}

- (BOOL)isActivatedForPreviewing
{
  return self->_activatedForPreviewing;
}

- (void)setActivatedForPreviewing:(BOOL)a3
{
  self->_activatedForPreviewing = a3;
}

- (float)volume
{
  return self->_volume;
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (SBRingerAlertElementDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBRingerAlertElementDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SAInvalidatable)assertion
{
  return self->_assertion;
}

- (void)setAssertion:(id)a3
{
}

- (unint64_t)visualStyle
{
  return self->_visualStyle;
}

- (void)setVisualStyle:(unint64_t)a3
{
  self->_visualStyle = a3;
}

- (SBUISystemApertureContentProvider)contentProvider
{
  return self->_contentProvider;
}

- (void)setContentProvider:(id)a3
{
}

- (SBUISystemApertureCAPackageContentProvider)leadingRingerContentViewProvider
{
  return self->_leadingRingerContentViewProvider;
}

- (void)setLeadingRingerContentViewProvider:(id)a3
{
}

- (SBUISystemApertureCAPackageContentProvider)minimalRingerContentViewProvider
{
  return self->_minimalRingerContentViewProvider;
}

- (void)setMinimalRingerContentViewProvider:(id)a3
{
}

- (SBUISystemApertureContentViewProviding)minimalContentViewProvider
{
  return self->_minimalContentViewProvider;
}

- (void)setMinimalContentViewProvider:(id)a3
{
}

- (SBUISystemApertureTextContentProvider)trailingTextContentViewProvider
{
  return self->_trailingTextContentViewProvider;
}

- (void)setTrailingTextContentViewProvider:(id)a3
{
}

- (SBRingerVolumeSliderView)sliderView
{
  return self->_sliderView;
}

- (void)setSliderView:(id)a3
{
}

- (SBRingerVolumeSliderView)minimalSliderView
{
  return self->_minimalSliderView;
}

- (void)setMinimalSliderView:(id)a3
{
}

- (BOOL)lastEventIsAVolumeChange
{
  return self->_lastEventIsAVolumeChange;
}

- (void)setLastEventIsAVolumeChange:(BOOL)a3
{
  self->_lastEventIsAVolumeChange = a3;
}

- (double)overshoot
{
  return self->_overshoot;
}

- (void)setOvershoot:(double)a3
{
  self->_overshoot = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimalSliderView, 0);
  objc_storeStrong((id *)&self->_sliderView, 0);
  objc_storeStrong((id *)&self->_trailingTextContentViewProvider, 0);
  objc_storeStrong((id *)&self->_minimalContentViewProvider, 0);
  objc_storeStrong((id *)&self->_minimalRingerContentViewProvider, 0);
  objc_storeStrong((id *)&self->_leadingRingerContentViewProvider, 0);
  objc_storeStrong((id *)&self->_contentProvider, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_alertHost);
}

@end