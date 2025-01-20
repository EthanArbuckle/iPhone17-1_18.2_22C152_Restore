@interface SUIAShockwaveViewController
+ (id)_propertyKeyPathToAnimatableKeyPathMap;
- (BOOL)_canShowWhileLocked;
- (SUIAShockwaveViewController)initWithStyle:(id)a3;
- (SUIAShockwaveViewController)initWithStyle:(id)a3 overlay:(id)a4;
- (int64_t)preferredLightType;
- (int64_t)state;
- (unint64_t)supportedInterfaceOrientations;
- (void)_applyChromaticAberrationForState:(int64_t)a3 completionGenerator:(id)a4;
- (void)_applyConfig:(id)a3 configPropertyKey:(id)a4 object:(id)a5 objectPropertyKeyPath:(id)a6 state:(int64_t)a7 subcompletionGenerator:(id)a8;
- (void)_applyConfig:(id)a3 configPropertyKey:(id)a4 object:(id)a5 objectPropertyKeyPath:(id)a6 transformerBlock:(id)a7 state:(int64_t)a8 subcompletionGenerator:(id)a9;
- (void)_applyConfig:(id)a3 configPropertyKey:(id)a4 object:(id)a5 objectPropertyKeyPath:(id)a6 transformerBlock:(id)a7 valueApplyBlock:(id)a8 animatableKeyPaths:(id)a9 state:(int64_t)a10 subcompletionGenerator:(id)a11;
- (void)_applyEdgeLightOverlayForState:(int64_t)a3;
- (void)_applyFillLightForState:(int64_t)a3 completionGenerator:(id)a4;
- (void)_applyFrameConfig:(id)a3 configPropertyKey:(id)a4 object:(id)a5 objectPropertyKeyPath:(id)a6 state:(int64_t)a7 subcompletionGenerator:(id)a8;
- (void)_applyFrameConfig:(id)a3 configPropertyKey:(id)a4 object:(id)a5 objectPropertyKeyPath:(id)a6 transformerBlock:(id)a7 state:(int64_t)a8 subcompletionGenerator:(id)a9;
- (void)_applyMeshForState:(int64_t)a3 completionGenerator:(id)a4;
- (void)_applyRootViewConfigurationForState:(int64_t)a3 completionGenerator:(id)a4;
- (void)_invalidateAndLayoutIfNeeded:(BOOL)a3 completion:(id)a4;
- (void)_setupChromaticAberrationIfNecessary;
- (void)_setupEdgeLightIfNecessary;
- (void)_setupMeshIfNecessary;
- (void)_updateFillLightIfNecessary;
- (void)setPreferredLightType:(int64_t)a3;
- (void)setState:(int64_t)a3;
- (void)setState:(int64_t)a3 animated:(BOOL)a4 recommendedNextAction:(id)a5 completion:(id)a6;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation SUIAShockwaveViewController

- (SUIAShockwaveViewController)initWithStyle:(id)a3 overlay:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SUIAShockwaveViewController;
  v9 = [(SUIAShockwaveViewController *)&v15 initWithNibName:0 bundle:0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_style, a3);
    objc_storeStrong((id *)&v10->_edgeLightOverlay, a4);
    v11 = +[SUIAnimationKitPrototypeSettingsDomain rootSettings];
    uint64_t v12 = [v11 shockwaveSettings];
    prototypeSettings = v10->_prototypeSettings;
    v10->_prototypeSettings = (SUIAShockwavePrototypeSettings *)v12;
  }
  return v10;
}

- (SUIAShockwaveViewController)initWithStyle:(id)a3
{
  return [(SUIAShockwaveViewController *)self initWithStyle:a3 overlay:0];
}

- (void)setState:(int64_t)a3
{
}

- (void)setState:(int64_t)a3 animated:(BOOL)a4 recommendedNextAction:(id)a5 completion:(id)a6
{
  BOOL v7 = a4;
  v10 = (void (**)(id, int64_t))a5;
  v11 = (void (**)(id, uint64_t, void))a6;
  if (self->_state == a3)
  {
    if (a3 <= 2 && v10) {
      v10[2](v10, a3 + 1);
    }
    if (v11) {
      v11[2](v11, 1, 0);
    }
  }
  else
  {
    self->_state = a3;
    [(BSAbsoluteMachTimer *)self->_transitionToNextStateTimer cancel];
    [(BSAbsoluteMachTimer *)self->_transitionToNextStateTimer invalidate];
    transitionToNextStateTimer = self->_transitionToNextStateTimer;
    self->_transitionToNextStateTimer = 0;

    [(SUIAShockwaveViewController *)self _invalidateAndLayoutIfNeeded:v7 completion:v11];
    [(SUIAShockwaveStyle *)self->_style recommendedPresentationDurationForState:a3];
    if (a3 <= 2)
    {
      if (v10)
      {
        double v14 = v13;
        if ((BSFloatEqualToFloat() & 1) == 0)
        {
          objc_super v15 = (BSAbsoluteMachTimer *)[objc_alloc(MEMORY[0x263F29BA8]) initWithIdentifier:@"SUIAShockwave-Transition-to-next-state"];
          v16 = self->_transitionToNextStateTimer;
          self->_transitionToNextStateTimer = v15;

          v17 = self->_transitionToNextStateTimer;
          v18[0] = MEMORY[0x263EF8330];
          v18[1] = 3221225472;
          v18[2] = __82__SUIAShockwaveViewController_setState_animated_recommendedNextAction_completion___block_invoke;
          v18[3] = &unk_26552D2C8;
          v18[4] = self;
          v19 = v10;
          int64_t v20 = a3;
          [(BSAbsoluteMachTimer *)v17 scheduleWithFireInterval:MEMORY[0x263EF83A0] leewayInterval:v18 queue:v14 handler:0.000001];
        }
      }
    }
  }
}

uint64_t __82__SUIAShockwaveViewController_setState_animated_recommendedNextAction_completion___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1016) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 1016);
  *(void *)(v2 + 1016) = 0;

  v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

- (void)setPreferredLightType:(int64_t)a3
{
  if (self->_preferredLightType != a3)
  {
    self->_preferredLightType = a3;
    [(SUIAShockwaveStyle *)self->_style setUsesIntelligentFillLight:a3 == 1];
    [(SUIARadialGradientView *)self->_fillLightCircleMaskView removeFromSuperview];
    fillLightCircleMaskView = self->_fillLightCircleMaskView;
    self->_fillLightCircleMaskView = 0;

    [(UIView *)self->_fillLightView removeFromSuperview];
    fillLightView = self->_fillLightView;
    self->_fillLightView = 0;

    [(SUIAShockwaveViewController *)self _updateFillLightIfNecessary];
    [(SUIAShockwaveViewController *)self _invalidateAndLayoutIfNeeded:0 completion:0];
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)SUIAShockwaveViewController;
  [(SUIAShockwaveViewController *)&v7 viewDidLoad];
  v3 = [(SUIAShockwaveViewController *)self view];
  [v3 setUserInteractionEnabled:0];

  prototypeSettings = self->_prototypeSettings;
  v5 = [(SUIAShockwaveViewController *)self traitCollection];
  -[SUIAShockwavePrototypeSettings updateValuesForUserInterfaceIdiom:](prototypeSettings, "updateValuesForUserInterfaceIdiom:", [v5 userInterfaceIdiom]);

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__SUIAShockwaveViewController_viewDidLoad__block_invoke;
  v6[3] = &unk_26552D2F0;
  v6[4] = self;
  [MEMORY[0x263F82E00] performWithoutAnimation:v6];
}

uint64_t __42__SUIAShockwaveViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setupChromaticAberrationIfNecessary];
  [*(id *)(a1 + 32) _updateFillLightIfNecessary];
  [*(id *)(a1 + 32) _setupMeshIfNecessary];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _setupEdgeLightIfNecessary];
}

- (void)viewWillLayoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)SUIAShockwaveViewController;
  [(SUIAShockwaveViewController *)&v16 viewWillLayoutSubviews];
  nextLayoutContext = self->_nextLayoutContext;
  if (nextLayoutContext)
  {
    v4 = nextLayoutContext;
    v5 = self->_nextLayoutContext;
    self->_nextLayoutContext = 0;

    ++self->_layoutGeneration;
    style = self->_style;
    objc_super v7 = [(SUIAShockwaveViewController *)self view];
    [v7 bounds];
    -[SUIAShockwaveStyle setShockwaveBounds:](style, "setShockwaveBounds:");

    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    uint64_t v12 = __53__SUIAShockwaveViewController_viewWillLayoutSubviews__block_invoke;
    double v13 = &unk_26552D340;
    double v14 = self;
    id v8 = v4;
    objc_super v15 = v8;
    v9 = (void (**)(void))_Block_copy(&v10);
    if ([(_SUIAShockwaveLayoutContext *)v8 animated]) {
      v9[2](v9);
    }
    else {
      [MEMORY[0x263F82E00] _performWithoutRetargetingAnimations:v9];
    }
  }
}

void __53__SUIAShockwaveViewController_viewWillLayoutSubviews__block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__SUIAShockwaveViewController_viewWillLayoutSubviews__block_invoke_2;
  v4[3] = &unk_26552D318;
  uint64_t v2 = *(void *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  v4[4] = v2;
  v3 = [v1 completion];
  +[SUIAC2GroupCompletion perform:v4 finalCompletion:v3 options:0 delegate:0];
}

void __53__SUIAShockwaveViewController_viewWillLayoutSubviews__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_applyRootViewConfigurationForState:completionGenerator:", *(void *)(*(void *)(a1 + 32) + 984));
  if ([*(id *)(*(void *)(a1 + 32) + 976) usesChromaticAberation]) {
    [*(id *)(a1 + 32) _applyChromaticAberrationForState:*(void *)(*(void *)(a1 + 32) + 984) completionGenerator:v3];
  }
  if ([*(id *)(*(void *)(a1 + 32) + 976) usesFillLight]) {
    [*(id *)(a1 + 32) _applyFillLightForState:*(void *)(*(void *)(a1 + 32) + 984) completionGenerator:v3];
  }
  if ([*(id *)(*(void *)(a1 + 32) + 976) usesMeshTransform]) {
    [*(id *)(a1 + 32) _applyMeshForState:*(void *)(*(void *)(a1 + 32) + 984) completionGenerator:v3];
  }
  if ([*(id *)(*(void *)(a1 + 32) + 976) usesEdgeLight]) {
    [*(id *)(a1 + 32) _applyEdgeLightOverlayForState:*(void *)(*(void *)(a1 + 32) + 984)];
  }
}

- (void)_setupChromaticAberrationIfNecessary
{
  v82[2] = *MEMORY[0x263EF8340];
  if ([(SUIAShockwaveStyle *)self->_style usesChromaticAberation])
  {
    id v3 = [(SUIAShockwaveStyle *)self->_style chromaticAberrationConfigurationForState:0];
    if ([(SUIAShockwavePrototypeSettings *)self->_prototypeSettings visualizeEffectMasks])
    {
      v4 = [SUIARadialGradientView alloc];
      [v3 donutMaskFrame];
      v5 = -[SUIARadialGradientView initWithFrame:](v4, "initWithFrame:");
      chromaticAberrationDonutMaskView = self->_chromaticAberrationDonutMaskView;
      self->_chromaticAberrationDonutMaskView = v5;

      objc_super v7 = self->_chromaticAberrationDonutMaskView;
      id v8 = [v3 donutGradientLocations];
      [(SUIARadialGradientView *)v7 setLocations:v8];

      v9 = self->_chromaticAberrationDonutMaskView;
      uint64_t v10 = [v3 donutGradientColors];
      [(SUIARadialGradientView *)v9 setColors:v10];

      uint64_t v11 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15B30]];
      uint64_t v12 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15D20]];
      double v13 = [MEMORY[0x263F825C8] greenColor];
      id v14 = [v13 colorWithAlphaComponent:0.5];
      objc_msgSend(v12, "setValue:forKey:", objc_msgSend(v14, "CGColor"), @"inputColor");

      objc_super v15 = [(SUIARadialGradientView *)self->_chromaticAberrationDonutMaskView layer];
      v81[0] = v11;
      v81[1] = v12;
      objc_super v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v81 count:2];
      [v15 setFilters:v16];

      v17 = [(SUIAShockwaveViewController *)self view];
      [v17 addSubview:self->_chromaticAberrationDonutMaskView];
    }
    else
    {
      v18 = [(SUIAShockwaveViewController *)self view];
      [v18 bounds];
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;

      v27 = -[_SUIABackdropView initWithFrame:]([_SUIABackdropView alloc], "initWithFrame:", v20, v22, v24, v26);
      chromaticAberrationEffectView = self->_chromaticAberrationEffectView;
      self->_chromaticAberrationEffectView = v27;

      [(_SUIABackdropView *)self->_chromaticAberrationEffectView setAutoresizingMask:18];
      uint64_t v11 = [(_SUIABackdropView *)self->_chromaticAberrationEffectView backdropLayer];
      [v11 setGroupName:@"spherochromatism"];
      [v11 setScale:0.25];
      [v11 setAllowsGroupBlending:0];
      [v11 setMarginWidth:25.0];
      v29 = [(SUIAShockwaveViewController *)self view];
      [v29 addSubview:self->_chromaticAberrationEffectView];

      v30 = self->_chromaticAberrationEffectView;
      v31 = [(SUIAShockwaveViewController *)self view];
      [v31 bounds];
      -[_SUIABackdropView setFrame:](v30, "setFrame:");

      [v3 aberrationEDRGain];
      double v33 = v32;
      if ((BSFloatIsZero() & 1) == 0)
      {
        v34 = [(_SUIABackdropView *)self->_chromaticAberrationEffectView layer];
        *(float *)&double v35 = v33;
        [v34 setGain:v35];
        v36 = [NSNumber numberWithBool:v33 > 1.0];
        [v34 setValue:v36 forKey:@"allowsLimitedHeadroom"];
      }
      uint64_t v37 = *MEMORY[0x263F15AF0];
      uint64_t v12 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15AF0]];
      [v12 setName:v37];
      [v3 aberrationMagnitude];
      double v39 = v38;
      double v41 = v40;
      v42 = objc_msgSend(MEMORY[0x263F08D40], "bs_valueWithCGPoint:");
      [v12 setValue:v42 forKey:*MEMORY[0x263F15C10]];

      v43 = objc_msgSend(MEMORY[0x263F08D40], "bs_valueWithCGPoint:", *MEMORY[0x263F00148] - v39, *(double *)(MEMORY[0x263F00148] + 8) - v41);
      [v12 setValue:v43 forKey:*MEMORY[0x263F15C88]];

      [v12 setValue:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F15C48]];
      uint64_t v44 = *MEMORY[0x263F15BC8];
      v17 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15BC8]];
      [v17 setName:v44];
      v45 = NSNumber;
      [v3 aberrationBlurRadius];
      v46 = objc_msgSend(v45, "numberWithDouble:");
      [v17 setValue:v46 forKey:*MEMORY[0x263F15C80]];

      [v17 setValue:@"low" forKey:*MEMORY[0x263F15C78]];
      v82[0] = v12;
      v82[1] = v17;
      v47 = [MEMORY[0x263EFF8C0] arrayWithObjects:v82 count:2];
      v48 = (void *)[v47 mutableCopy];

      [v3 aberrationColorSaturateAmount];
      double v50 = v49;
      if ((BSFloatIsZero() & 1) == 0)
      {
        v51 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15B50]];
        v52 = [NSNumber numberWithDouble:v50];
        [v51 setValue:v52 forKey:*MEMORY[0x263F15BF8]];

        [v48 addObject:v51];
      }
      [v3 aberrationColorBrightnessFactor];
      double v54 = v53;
      if ((BSFloatIsZero() & 1) == 0)
      {
        v55 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15B10]];
        v56 = [NSNumber numberWithDouble:v54];
        [v55 setValue:v56 forKey:*MEMORY[0x263F15BF8]];

        [v48 addObject:v55];
      }
      [v3 aberrationMultiplyFactor];
      double v58 = v57;
      if ((BSFloatIsZero() & 1) == 0)
      {
        v59 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15B40]];
        float v60 = v58;
        float v73 = v60;
        long long v74 = *(_OWORD *)(MEMORY[0x263F15720] + 4);
        int v75 = *(_DWORD *)(MEMORY[0x263F15720] + 20);
        float v76 = v60;
        long long v77 = *(_OWORD *)(MEMORY[0x263F15720] + 28);
        int v78 = *(_DWORD *)(MEMORY[0x263F15720] + 44);
        float v79 = v60;
        *(_OWORD *)v80 = *(_OWORD *)(MEMORY[0x263F15720] + 52);
        *(_OWORD *)&v80[12] = *(_OWORD *)(MEMORY[0x263F15720] + 64);
        v61 = [MEMORY[0x263F08D40] valueWithCAColorMatrix:&v73];
        [v59 setValue:v61 forKey:*MEMORY[0x263F15C30]];

        [v48 addObject:v59];
      }
      v62 = [(_SUIABackdropView *)self->_chromaticAberrationEffectView layer];
      [v62 setFilters:v48];

      v63 = [SUIARadialGradientView alloc];
      [v3 donutMaskFrame];
      v64 = -[SUIARadialGradientView initWithFrame:](v63, "initWithFrame:");
      v65 = self->_chromaticAberrationDonutMaskView;
      self->_chromaticAberrationDonutMaskView = v64;

      v66 = self->_chromaticAberrationDonutMaskView;
      v67 = [v3 donutGradientLocations];
      [(SUIARadialGradientView *)v66 setLocations:v67];

      v68 = self->_chromaticAberrationDonutMaskView;
      v69 = [v3 donutGradientColors];
      [(SUIARadialGradientView *)v68 setColors:v69];

      [(_SUIABackdropView *)self->_chromaticAberrationEffectView setMaskView:self->_chromaticAberrationDonutMaskView];
      v70 = self->_chromaticAberrationDonutMaskView;
      v71 = [v3 donutGradientLocations];
      [(SUIARadialGradientView *)v70 setLocations:v71];

      v72 = self->_chromaticAberrationDonutMaskView;
      [v3 aberrationIntensity];
      -[SUIARadialGradientView setAlpha:](v72, "setAlpha:");
    }
  }
}

- (void)_setupMeshIfNecessary
{
  if ([(SUIAShockwaveStyle *)self->_style usesMeshTransform])
  {
    id v3 = [(SUIAShockwaveStyle *)self->_style meshConfigurationForState:0];
    v4 = [_SUIABackdropView alloc];
    [v3 meshFrame];
    v5 = -[_SUIABackdropView initWithFrame:](v4, "initWithFrame:");
    meshedBackdrop = self->_meshedBackdrop;
    self->_meshedBackdrop = v5;

    objc_super v7 = [(_SUIABackdropView *)self->_meshedBackdrop layer];
    id v8 = [v3 meshTransform];
    [v7 setMeshTransform:v8];

    v9 = [(_SUIABackdropView *)self->_meshedBackdrop layer];
    uint64_t v10 = [(SUIAShockwaveViewController *)self view];
    uint64_t v11 = [(id)v10 traitCollection];
    [v11 displayScale];
    objc_msgSend(v9, "setRasterizationScale:");

    uint64_t v12 = [(_SUIABackdropView *)self->_meshedBackdrop layer];
    [v12 setWantsExtendedDynamicRangeContent:1];

    double v13 = [(_SUIABackdropView *)self->_meshedBackdrop backdropLayer];
    LOBYTE(v10) = objc_opt_respondsToSelector();

    if (v10)
    {
      id v14 = [(_SUIABackdropView *)self->_meshedBackdrop backdropLayer];
      [v14 setPreallocatesScreenArea:1];
    }
    objc_super v15 = [(_SUIABackdropView *)self->_meshedBackdrop backdropLayer];
    [v15 setGroupName:@"SUIAShockwaveBackdropGroup"];

    objc_super v16 = self->_meshedBackdrop;
    if (v3) {
      [v3 viewTransform];
    }
    else {
      memset(v18, 0, sizeof(v18));
    }
    [(_SUIABackdropView *)v16 setTransform3D:v18];
    v17 = [(SUIAShockwaveViewController *)self view];
    [v17 addSubview:self->_meshedBackdrop];
  }
}

- (void)_updateFillLightIfNecessary
{
  v85[1] = *MEMORY[0x263EF8340];
  if (!self->_fillLightView && [(SUIAShockwaveStyle *)self->_style usesFillLight])
  {
    id v3 = [(SUIAShockwaveStyle *)self->_style fillLightConfigurationForState:0];
    v4 = v3;
    int64_t preferredLightType = self->_preferredLightType;
    if (!preferredLightType) {
      int64_t preferredLightType = [v3 lightType];
    }
    if ([(SUIAShockwavePrototypeSettings *)self->_prototypeSettings visualizeEffectMasks])
    {
      v6 = [SUIARadialGradientView alloc];
      [v4 circleMaskFrame];
      objc_super v7 = -[SUIARadialGradientView initWithFrame:](v6, "initWithFrame:");
      fillLightCircleMaskView = self->_fillLightCircleMaskView;
      self->_fillLightCircleMaskView = v7;

      v9 = self->_fillLightCircleMaskView;
      uint64_t v10 = [v4 circleGradientLocations];
      [(SUIARadialGradientView *)v9 setLocations:v10];

      uint64_t v11 = self->_fillLightCircleMaskView;
      uint64_t v12 = [v4 circleGradientColors];
      [(SUIARadialGradientView *)v11 setColors:v12];

      double v13 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15B30]];
      id v14 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15D20]];
      objc_super v15 = [MEMORY[0x263F825C8] redColor];
      id v16 = [v15 colorWithAlphaComponent:0.5];
      objc_msgSend(v14, "setValue:forKey:", objc_msgSend(v16, "CGColor"), @"inputColor");

      v17 = [(SUIARadialGradientView *)self->_fillLightCircleMaskView layer];
      v84[0] = v13;
      v84[1] = v14;
      v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v84 count:2];
      [v17 setFilters:v18];

      double v19 = [(SUIAShockwaveViewController *)self view];
      [v19 addSubview:self->_fillLightCircleMaskView];

LABEL_29:
      return;
    }
    double v20 = [(SUIAShockwaveViewController *)self view];
    [v20 bounds];
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;

    v29 = [SUIARadialGradientView alloc];
    [v4 circleMaskFrame];
    v30 = -[SUIARadialGradientView initWithFrame:](v29, "initWithFrame:");
    v31 = self->_fillLightCircleMaskView;
    self->_fillLightCircleMaskView = v30;

    if (preferredLightType == 2)
    {
      v36 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v22, v24, v26, v28);
      fillLightView = self->_fillLightView;
      self->_fillLightView = v36;

      [v4 whiteValue];
      double v39 = v38;
      if (v38 != 1.0)
      {
        v34 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15D20]];
        id v40 = [MEMORY[0x263F825C8] colorWithWhite:v39 alpha:1.0];
        uint64_t v41 = [v40 CGColor];
        [v34 setValue:v41 forKey:*MEMORY[0x263F15C20]];

        double v35 = [(SUIARadialGradientView *)self->_fillLightCircleMaskView layer];
        v85[0] = v34;
        v42 = [MEMORY[0x263EFF8C0] arrayWithObjects:v85 count:1];
        [v35 setFilters:v42];

        goto LABEL_12;
      }
    }
    else if (preferredLightType == 1)
    {
      double v32 = -[SUIAShockwaveIntelligenceSystemLightView initWithFrame:preferringAudioReactivity:]([SUIAShockwaveIntelligenceSystemLightView alloc], "initWithFrame:preferringAudioReactivity:", 0, v22, v24, v26, v28);
      double v33 = self->_fillLightView;
      self->_fillLightView = &v32->super.super.super;

      v34 = [(SUIARadialGradientView *)self->_fillLightCircleMaskView layer];
      double v35 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15B88]];
      [v34 setCompositingFilter:v35];
LABEL_12:
    }
    [(UIView *)self->_fillLightView setAutoresizingMask:18];
    v43 = [(SUIAShockwaveViewController *)self view];
    [v43 addSubview:self->_fillLightView];

    uint64_t v44 = self->_fillLightCircleMaskView;
    v45 = [v4 circleGradientLocations];
    [(SUIARadialGradientView *)v44 setLocations:v45];

    v46 = self->_fillLightCircleMaskView;
    v47 = [v4 circleGradientColors];
    [(SUIARadialGradientView *)v46 setColors:v47];

    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    double v49 = self->_fillLightView;
    double v50 = self->_fillLightCircleMaskView;
    if (isKindOfClass) {
      [(UIView *)v49 setCircleMaskView:v50];
    }
    else {
      [(UIView *)v49 addSubview:v50];
    }
    id v51 = objc_alloc(MEMORY[0x263F82828]);
    v52 = [v4 sideLightMaskImage];
    double v53 = (UIImageView *)[v51 initWithImage:v52];
    fillSideLightMaskView = self->_fillSideLightMaskView;
    self->_fillSideLightMaskView = v53;

    v55 = self->_fillSideLightMaskView;
    if (v4)
    {
      [v4 sideLightMaskTransform];
    }
    else
    {
      long long v82 = 0u;
      long long v83 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
    }
    [(UIImageView *)v55 setTransform3D:&v76];
    -[UIImageView setFrame:](self->_fillSideLightMaskView, "setFrame:", v22, v24, v26, v28);
    [(UIImageView *)self->_fillSideLightMaskView setAutoresizingMask:18];
    v56 = [(UIImageView *)self->_fillSideLightMaskView layer];
    double v57 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15B90]];
    [v56 setCompositingFilter:v57];

    objc_opt_class();
    char v58 = objc_opt_isKindOfClass();
    v59 = self->_fillLightView;
    float v60 = self->_fillSideLightMaskView;
    if (v58) {
      [(UIView *)v59 setSideLightMaskView:v60];
    }
    else {
      [(UIView *)v59 addSubview:v60];
    }
    v61 = self->_fillLightView;
    objc_msgSend(v4, "lightIntensity", v76, v77, v78, v79, v80, v81, v82, v83);
    -[UIView setAlpha:](v61, "setAlpha:");
    double v13 = [MEMORY[0x263EFF980] array];
    [v4 lightColorBrightnessAmount];
    double v63 = v62;
    char IsZero = BSFloatIsZero();
    v65 = (void *)MEMORY[0x263F15BF8];
    if ((IsZero & 1) == 0)
    {
      v66 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15B10]];
      v67 = [NSNumber numberWithDouble:v63];
      [v66 setValue:v67 forKey:*v65];

      [v13 addObject:v66];
    }
    [v4 lightColorSaturateAmount];
    double v69 = v68;
    if ((BSFloatIsOne() & 1) == 0)
    {
      v70 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15B50]];
      v71 = [NSNumber numberWithDouble:v69];
      [v70 setValue:v71 forKey:*v65];

      [v13 addObject:v70];
    }
    [v4 lightColorContrastAmount];
    double v73 = v72;
    if ((BSFloatIsOne() & 1) == 0)
    {
      long long v74 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15B20]];
      int v75 = [NSNumber numberWithDouble:v73];
      [v74 setValue:v75 forKey:*v65];

      [v13 addObject:v74];
    }
    id v14 = [(UIView *)self->_fillLightView layer];
    [v14 setFilters:v13];
    goto LABEL_29;
  }
}

- (void)_setupEdgeLightIfNecessary
{
  if ([(SUIAShockwaveStyle *)self->_style usesEdgeLight])
  {
    id v12 = [(SUIAShockwaveStyle *)self->_style edgeLightOverlayConfigurationForState:0];
    -[SUIAShockwaveEdgeLightOverlay applyConfiguration:forState:](self->_edgeLightOverlay, "applyConfiguration:forState:");
    if ([(SUIAShockwavePrototypeSettings *)self->_prototypeSettings visualizeEffectMasks])
    {
      id v3 = [SUIARadialGradientView alloc];
      [v12 edgeLightMaskFrame];
      v4 = -[SUIARadialGradientView initWithFrame:](v3, "initWithFrame:");
      edgeLightDebugMaskView = self->_edgeLightDebugMaskView;
      self->_edgeLightDebugMaskView = v4;

      v6 = self->_edgeLightDebugMaskView;
      objc_super v7 = [v12 edgeLightMaskGradientLocations];
      [(SUIARadialGradientView *)v6 setLocations:v7];

      id v8 = self->_edgeLightDebugMaskView;
      v9 = [v12 edgeLightMaskGradientColors];
      [(SUIARadialGradientView *)v8 setColors:v9];

      uint64_t v10 = self->_edgeLightDebugMaskView;
      [v12 edgeLightIntensity];
      -[SUIARadialGradientView setAlpha:](v10, "setAlpha:");
      uint64_t v11 = [(SUIAShockwaveViewController *)self view];
      [v11 addSubview:self->_edgeLightDebugMaskView];
    }
  }
}

- (void)_invalidateAndLayoutIfNeeded:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v10 = a4;
  if (self->_nextLayoutContext)
  {
    if (v10) {
      (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
    }
  }
  else
  {
    v6 = objc_alloc_init(_SUIAShockwaveLayoutContext);
    nextLayoutContext = self->_nextLayoutContext;
    self->_nextLayoutContext = v6;

    [(_SUIAShockwaveLayoutContext *)self->_nextLayoutContext setAnimated:v4];
    [(_SUIAShockwaveLayoutContext *)self->_nextLayoutContext setCompletion:v10];
  }
  id v8 = [(SUIAShockwaveViewController *)self view];
  [v8 setNeedsLayout];

  v9 = [(SUIAShockwaveViewController *)self view];
  [v9 layoutIfNeeded];
}

- (void)_applyRootViewConfigurationForState:(int64_t)a3 completionGenerator:(id)a4
{
  style = self->_style;
  id v7 = a4;
  id v9 = [(SUIAShockwaveStyle *)style rootViewConfigurationForState:a3];
  id v8 = [(SUIAShockwaveViewController *)self view];
  [(SUIAShockwaveViewController *)self _applyConfig:v9 configPropertyKey:@"hidden" object:v8 objectPropertyKeyPath:@"hidden" state:a3 subcompletionGenerator:v7];
}

- (void)_applyChromaticAberrationForState:(int64_t)a3 completionGenerator:(id)a4
{
  style = self->_style;
  id v7 = a4;
  id v8 = [(SUIAShockwaveStyle *)style chromaticAberrationConfigurationForState:a3];
  [(SUIAShockwaveViewController *)self _applyConfig:v8 configPropertyKey:@"aberrationMagnitude" object:self->_chromaticAberrationEffectView objectPropertyKeyPath:@"layer.filters.chromaticAberration.inputRedOffset" transformerBlock:&__block_literal_global state:a3 subcompletionGenerator:v7];
  [(SUIAShockwaveViewController *)self _applyConfig:v8 configPropertyKey:@"aberrationMagnitude" object:self->_chromaticAberrationEffectView objectPropertyKeyPath:@"layer.filters.chromaticAberration.inputBlueOffset" state:a3 subcompletionGenerator:v7];
  [(SUIAShockwaveViewController *)self _applyConfig:v8 configPropertyKey:@"aberrationBlurRadius" object:self->_chromaticAberrationEffectView objectPropertyKeyPath:@"layer.filters.gaussianBlur.inputRadius" state:a3 subcompletionGenerator:v7];
  [(SUIAShockwaveViewController *)self _applyFrameConfig:v8 configPropertyKey:@"donutMaskFrame" object:self->_chromaticAberrationDonutMaskView objectPropertyKeyPath:@"frame" state:a3 subcompletionGenerator:v7];
  [(SUIAShockwaveViewController *)self _applyConfig:v8 configPropertyKey:@"donutGradientLocations" object:self->_chromaticAberrationDonutMaskView objectPropertyKeyPath:@"locations" state:a3 subcompletionGenerator:v7];
  [(SUIAShockwaveViewController *)self _applyConfig:v8 configPropertyKey:@"donutGradientColors" object:self->_chromaticAberrationDonutMaskView objectPropertyKeyPath:@"colors" state:a3 subcompletionGenerator:v7];
  [(SUIAShockwaveViewController *)self _applyConfig:v8 configPropertyKey:@"aberrationIntensity" object:self->_chromaticAberrationDonutMaskView objectPropertyKeyPath:@"alpha" state:a3 subcompletionGenerator:v7];
}

uint64_t __85__SUIAShockwaveViewController__applyChromaticAberrationForState_completionGenerator___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = objc_msgSend(a2, "valueForKey:");
  objc_msgSend(v2, "bs_CGPointValue");
  double v4 = v3;
  double v6 = v5;

  v7.n128_f64[0] = *MEMORY[0x263F00148] - v4;
  v8.n128_f64[0] = *(double *)(MEMORY[0x263F00148] + 8) - v6;
  return MEMORY[0x270F10988](v7, v8);
}

- (void)_applyFillLightForState:(int64_t)a3 completionGenerator:(id)a4
{
  id v11 = a4;
  double v6 = [(SUIAShockwaveStyle *)self->_style fillLightConfigurationForState:a3];
  [(SUIAShockwaveViewController *)self _applyConfig:v6 configPropertyKey:@"lightIntensity" object:self->_fillLightView objectPropertyKeyPath:@"alpha" state:a3 subcompletionGenerator:v11];
  __n128 v7 = [(UIImageView *)self->_fillSideLightMaskView image];
  __n128 v8 = [v6 sideLightMaskImage];

  if (v7 != v8)
  {
    fillSideLightMaskView = self->_fillSideLightMaskView;
    id v10 = [v6 sideLightMaskImage];
    [(UIImageView *)fillSideLightMaskView setImage:v10];
  }
  [(SUIAShockwaveViewController *)self _applyConfig:v6 configPropertyKey:@"sideLightMaskTransform" object:self->_fillSideLightMaskView objectPropertyKeyPath:@"transform3D" state:a3 subcompletionGenerator:v11];
  [(SUIAShockwaveViewController *)self _applyFrameConfig:v6 configPropertyKey:@"circleMaskFrame" object:self->_fillLightCircleMaskView objectPropertyKeyPath:@"frame" state:a3 subcompletionGenerator:v11];
  [(SUIAShockwaveViewController *)self _applyConfig:v6 configPropertyKey:@"circleGradientLocations" object:self->_fillLightCircleMaskView objectPropertyKeyPath:@"locations" state:a3 subcompletionGenerator:v11];
  [(SUIAShockwaveViewController *)self _applyConfig:v6 configPropertyKey:@"circleGradientColors" object:self->_fillLightCircleMaskView objectPropertyKeyPath:@"colors" state:a3 subcompletionGenerator:v11];
}

- (void)_applyMeshForState:(int64_t)a3 completionGenerator:(id)a4
{
  style = self->_style;
  id v7 = a4;
  id v8 = [(SUIAShockwaveStyle *)style meshConfigurationForState:a3];
  [(SUIAShockwaveViewController *)self _applyFrameConfig:v8 configPropertyKey:@"meshFrame" object:self->_meshedBackdrop objectPropertyKeyPath:@"frame" state:a3 subcompletionGenerator:v7];
  [(SUIAShockwaveViewController *)self _applyConfig:v8 configPropertyKey:@"meshTransform" object:self->_meshedBackdrop objectPropertyKeyPath:@"layer.meshTransform" state:a3 subcompletionGenerator:v7];
  [(SUIAShockwaveViewController *)self _applyConfig:v8 configPropertyKey:@"viewTransform" object:self->_meshedBackdrop objectPropertyKeyPath:@"transform3D" state:a3 subcompletionGenerator:v7];
}

- (void)_applyEdgeLightOverlayForState:(int64_t)a3
{
  double v5 = -[SUIAShockwaveStyle edgeLightOverlayConfigurationForState:](self->_style, "edgeLightOverlayConfigurationForState:");
  [(SUIAShockwaveEdgeLightOverlay *)self->_edgeLightOverlay applyConfiguration:v5 forState:a3];
  if ([(SUIAShockwavePrototypeSettings *)self->_prototypeSettings visualizeEffectMasks])
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __62__SUIAShockwaveViewController__applyEdgeLightOverlayForState___block_invoke;
    v6[3] = &unk_26552D388;
    v6[4] = self;
    id v7 = v5;
    int64_t v8 = a3;
    +[SUIAC2GroupCompletion perform:v6 finalCompletion:0];
  }
}

void __62__SUIAShockwaveViewController__applyEdgeLightOverlayForState___block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = v3[136];
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = a2;
  [v3 _applyFrameConfig:v4 configPropertyKey:@"edgeLightMaskFrame" object:v5 objectPropertyKeyPath:@"frame" state:v6 subcompletionGenerator:v7];
  [*(id *)(a1 + 32) _applyConfig:*(void *)(a1 + 40) configPropertyKey:@"edgeLightMaskGradientLocations" object:*(void *)(*(void *)(a1 + 32) + 1088) objectPropertyKeyPath:@"locations" state:*(void *)(a1 + 48) subcompletionGenerator:v7];
  [*(id *)(a1 + 32) _applyConfig:*(void *)(a1 + 40) configPropertyKey:@"edgeLightMaskGradientColors" object:*(void *)(*(void *)(a1 + 32) + 1088) objectPropertyKeyPath:@"colors" state:*(void *)(a1 + 48) subcompletionGenerator:v7];
  [*(id *)(a1 + 32) _applyConfig:*(void *)(a1 + 40) configPropertyKey:@"edgeLightIntensity" object:*(void *)(*(void *)(a1 + 32) + 1088) objectPropertyKeyPath:@"alpha" state:*(void *)(a1 + 48) subcompletionGenerator:v7];
}

+ (id)_propertyKeyPathToAnimatableKeyPathMap
{
  if (_propertyKeyPathToAnimatableKeyPathMap_sOnceToken[0] != -1) {
    dispatch_once(_propertyKeyPathToAnimatableKeyPathMap_sOnceToken, &__block_literal_global_143);
  }
  uint64_t v2 = (void *)_propertyKeyPathToAnimatableKeyPathMap_sPropertyKeyPathToAnimatableKeyPathMap;
  return v2;
}

void __69__SUIAShockwaveViewController__propertyKeyPathToAnimatableKeyPathMap__block_invoke()
{
  v0 = (void *)_propertyKeyPathToAnimatableKeyPathMap_sPropertyKeyPathToAnimatableKeyPathMap;
  _propertyKeyPathToAnimatableKeyPathMap_sPropertyKeyPathToAnimatableKeyPathMap = (uint64_t)&unk_270B561C8;
}

- (void)_applyConfig:(id)a3 configPropertyKey:(id)a4 object:(id)a5 objectPropertyKeyPath:(id)a6 transformerBlock:(id)a7 state:(int64_t)a8 subcompletionGenerator:(id)a9
{
  v24[1] = *MEMORY[0x263EF8340];
  v24[0] = a6;
  id v16 = (void *)MEMORY[0x263EFF8C0];
  id v17 = a9;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  double v23 = [v16 arrayWithObjects:v24 count:1];
  [(SUIAShockwaveViewController *)self _applyConfig:v22 configPropertyKey:v21 object:v20 objectPropertyKeyPath:v19 transformerBlock:v18 valueApplyBlock:&__block_literal_global_159 animatableKeyPaths:v23 state:a8 subcompletionGenerator:v17];
}

uint64_t __137__SUIAShockwaveViewController__applyConfig_configPropertyKey_object_objectPropertyKeyPath_transformerBlock_state_subcompletionGenerator___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return [a2 setValue:a4 forKeyPath:a3];
}

- (void)_applyFrameConfig:(id)a3 configPropertyKey:(id)a4 object:(id)a5 objectPropertyKeyPath:(id)a6 transformerBlock:(id)a7 state:(int64_t)a8 subcompletionGenerator:(id)a9
{
}

void __142__SUIAShockwaveViewController__applyFrameConfig_configPropertyKey_object_objectPropertyKeyPath_transformerBlock_state_subcompletionGenerator___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a2;
  [a4 CGRectValue];
  objc_msgSend(v5, "suia_setBoundsAndPositionFromFrame:");
}

- (void)_applyConfig:(id)a3 configPropertyKey:(id)a4 object:(id)a5 objectPropertyKeyPath:(id)a6 transformerBlock:(id)a7 valueApplyBlock:(id)a8 animatableKeyPaths:(id)a9 state:(int64_t)a10 subcompletionGenerator:(id)a11
{
  id v16 = a3;
  id v17 = a4;
  id v42 = a5;
  id v18 = a6;
  id v40 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = NSString;
  id v22 = a11;
  uint64_t v23 = [(id)objc_opt_class() configurationType];
  double v24 = SUIAStringFromShockwaveConfigurationType(v23);
  double v25 = [v21 stringWithFormat:@"(%@)-%@", v24, v17];
  double v26 = (*((void (**)(id, void *))a11 + 2))(v22, v25);

  [v16 delayForApplicationOfKeypath:v17];
  double v28 = v27;
  unint64_t layoutGeneration = self->_layoutGeneration;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __172__SUIAShockwaveViewController__applyConfig_configPropertyKey_object_objectPropertyKeyPath_transformerBlock_valueApplyBlock_animatableKeyPaths_state_subcompletionGenerator___block_invoke;
  aBlock[3] = &unk_26552D418;
  aBlock[4] = self;
  id v44 = v16;
  id v45 = v17;
  id v46 = v42;
  id v49 = v40;
  id v50 = v19;
  id v47 = v20;
  id v48 = v18;
  id v51 = v26;
  unint64_t v52 = layoutGeneration;
  id v30 = v26;
  id v31 = v18;
  id v32 = v19;
  id v33 = v20;
  id v34 = v42;
  id v35 = v17;
  id v36 = v16;
  id v37 = v40;
  double v38 = (void (**)(void))_Block_copy(aBlock);
  if (BSFloatIsZero())
  {
    v38[2](v38);
  }
  else
  {
    dispatch_time_t v39 = dispatch_time(0, (uint64_t)(v28 * 1000000000.0));
    dispatch_after(v39, MEMORY[0x263EF83A0], v38);
  }
}

void __172__SUIAShockwaveViewController__applyConfig_configPropertyKey_object_objectPropertyKeyPath_transformerBlock_valueApplyBlock_animatableKeyPaths_state_subcompletionGenerator___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 104) == *(void *)(*(void *)(a1 + 32) + 1008))
  {
    uint64_t v2 = *(void *)(a1 + 80);
    if (v2) {
      (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, *(void *)(a1 + 40), *(void *)(a1 + 48));
    }
    else {
    id v5 = [*(id *)(a1 + 40) valueForKey:*(void *)(a1 + 48)];
    }
    uint64_t v6 = [*(id *)(a1 + 40) behaviorSettingsForKeypath:*(void *)(a1 + 48)];
    id v7 = (void *)v6;
    if (v6) {
      uint64_t v8 = 3;
    }
    else {
      uint64_t v8 = 2;
    }
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v23 = v5;
        id v9 = [(id)objc_opt_class() _propertyKeyPathToAnimatableKeyPathMap];
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v10 = *(id *)(a1 + 64);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v30;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v30 != v13) {
                objc_enumerationMutation(v10);
              }
              objc_super v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
              uint64_t v16 = [v9 objectForKey:v15];
              id v17 = (void *)v16;
              if (v16) {
                id v18 = (void *)v16;
              }
              else {
                id v18 = v15;
              }
              id v19 = v18;

              objc_msgSend(*(id *)(a1 + 56), "suia_replaceInProcessAnimationForKeyPath:settings:mode:", v19, v7, v8);
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
          }
          while (v12);
        }

        id v5 = v23;
      }
    }
    id v20 = (void *)MEMORY[0x263F82E00];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    void v24[2] = __172__SUIAShockwaveViewController__applyConfig_configPropertyKey_object_objectPropertyKeyPath_transformerBlock_valueApplyBlock_animatableKeyPaths_state_subcompletionGenerator___block_invoke_2;
    v24[3] = &unk_26552D3F0;
    id v28 = *(id *)(a1 + 88);
    id v25 = *(id *)(a1 + 56);
    id v26 = *(id *)(a1 + 72);
    id v27 = v5;
    uint64_t v21 = *(void *)(a1 + 96);
    id v22 = v5;
    objc_msgSend(v20, "suia_animateWithSettings:mode:animations:completion:", v7, v8, v24, v21);
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 96);
    if (v3)
    {
      uint64_t v4 = *(void (**)(void))(v3 + 16);
      v4();
    }
  }
}

uint64_t __172__SUIAShockwaveViewController__applyConfig_configPropertyKey_object_objectPropertyKeyPath_transformerBlock_valueApplyBlock_animatableKeyPaths_state_subcompletionGenerator___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (void)_applyConfig:(id)a3 configPropertyKey:(id)a4 object:(id)a5 objectPropertyKeyPath:(id)a6 state:(int64_t)a7 subcompletionGenerator:(id)a8
{
}

- (void)_applyFrameConfig:(id)a3 configPropertyKey:(id)a4 object:(id)a5 objectPropertyKeyPath:(id)a6 state:(int64_t)a7 subcompletionGenerator:(id)a8
{
}

- (int64_t)state
{
  return self->_state;
}

- (int64_t)preferredLightType
{
  return self->_preferredLightType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edgeLightDebugMaskView, 0);
  objc_storeStrong((id *)&self->_edgeLightOverlay, 0);
  objc_storeStrong((id *)&self->_meshedBackdrop, 0);
  objc_storeStrong((id *)&self->_fillLightCircleMaskView, 0);
  objc_storeStrong((id *)&self->_fillSideLightMaskView, 0);
  objc_storeStrong((id *)&self->_fillLightView, 0);
  objc_storeStrong((id *)&self->_chromaticAberrationDonutMaskView, 0);
  objc_storeStrong((id *)&self->_chromaticAberrationEffectView, 0);
  objc_storeStrong(&self->_pendingTransitionToEndCompletionBlock, 0);
  objc_storeStrong((id *)&self->_transitionToNextStateTimer, 0);
  objc_storeStrong((id *)&self->_nextLayoutContext, 0);
  objc_storeStrong((id *)&self->_prototypeSettings, 0);
  objc_storeStrong((id *)&self->_style, 0);
}

@end