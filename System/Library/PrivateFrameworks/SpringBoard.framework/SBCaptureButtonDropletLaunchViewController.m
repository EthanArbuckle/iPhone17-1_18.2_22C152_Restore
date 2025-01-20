@interface SBCaptureButtonDropletLaunchViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)expandHintingDropletByAddingComponents:(unint64_t)a3;
- (CGPoint)preludeAnimationVelocity;
- (CGRect)preludeAnimationRectPresentationValue;
- (SBCaptureButtonDropletLaunchViewController)initWithButtonOrigin:(int64_t)a3;
- (id)_configurationForStage:(unint64_t)a3;
- (id)_defaultConfigurationForStage:(unint64_t)a3;
- (id)animatingDroplet;
- (id)animatingDropletContext;
- (id)lendAnimatingDropletViewToExternalOwner;
- (unint64_t)supportedInterfaceOrientations;
- (void)_applyViewConfigurationForCurrentStage;
- (void)_setStage:(unint64_t)a3 animated:(BOOL)a4 milestones:(id)a5;
- (void)_zoomUpAnimationCompleted:(BOOL)a3;
- (void)animateDropletFromButtonWithMilestones:(id)a3;
- (void)appendDropletZoomUpCompletionBlock:(id)a3;
- (void)expandDropletKeylineToIntelligentKeylineStage:(unint64_t)a3;
- (void)loadView;
- (void)resetToOffscreenAnimated:(BOOL)a3 milestones:(id)a4;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation SBCaptureButtonDropletLaunchViewController

- (SBCaptureButtonDropletLaunchViewController)initWithButtonOrigin:(int64_t)a3
{
  v14.receiver = self;
  v14.super_class = (Class)SBCaptureButtonDropletLaunchViewController;
  v4 = [(SBCaptureButtonDropletLaunchViewController *)&v14 init];
  if (v4)
  {
    uint64_t v5 = +[SBCaptureButtonDomain rootSettings];
    settings = v4->_settings;
    v4->_settings = (SBCaptureButtonSettings *)v5;

    uint64_t v7 = +[SBButtonBezelGeometryInfo buttonBezelGeometryInfoForCurrentEmbeddedDisplayBezel];
    buttonGeometryInfo = v4->_buttonGeometryInfo;
    v4->_buttonGeometryInfo = (SBButtonBezelGeometryInfo *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
    toStageFloatAnimatableProperty = v4->_toStageFloatAnimatableProperty;
    v4->_toStageFloatAnimatableProperty = (NSMutableDictionary *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    toStageCompletionBlock = v4->_toStageCompletionBlock;
    v4->_toStageCompletionBlock = (NSMutableDictionary *)v11;

    v4->_associatedButton = a3;
  }
  return v4;
}

- (void)animateDropletFromButtonWithMilestones:(id)a3
{
}

- (BOOL)expandHintingDropletByAddingComponents:(unint64_t)a3
{
  unint64_t stage = self->_stage;
  if (stage - 1 > 1) {
    return 0;
  }
  unint64_t expansionComponents = self->_expansionComponents;
  BOOL v6 = (expansionComponents & a3) != a3;
  if ((expansionComponents & a3) != a3)
  {
    self->_unint64_t expansionComponents = expansionComponents | a3;
    uint64_t v7 = [(SBCaptureButtonDropletLaunchViewController *)self view];
    [v7 setNeedsLayout];

    unint64_t stage = self->_stage;
  }
  if (stage == 1)
  {
    [(SBCaptureButtonDropletLaunchViewController *)self _setStage:2 animated:!SBReduceMotion() milestones:0];
    return self->_stage > 1;
  }
  return v6;
}

- (void)expandDropletKeylineToIntelligentKeylineStage:(unint64_t)a3
{
  if (self->_dropetIntelligentKeylineStage != a3)
  {
    self->_dropetIntelligentKeylineStage = a3;
    id v3 = [(SBCaptureButtonDropletLaunchViewController *)self view];
    [v3 setNeedsLayout];
  }
}

- (void)appendDropletZoomUpCompletionBlock:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (self->_stage > 1)
  {
    pendingZoomUpCompletionBlocks = self->_pendingZoomUpCompletionBlocks;
    if (!pendingZoomUpCompletionBlocks)
    {
      BOOL v6 = (NSMutableArray *)objc_opt_new();
      uint64_t v7 = self->_pendingZoomUpCompletionBlocks;
      self->_pendingZoomUpCompletionBlocks = v6;

      pendingZoomUpCompletionBlocks = self->_pendingZoomUpCompletionBlocks;
    }
    v8 = (void *)MEMORY[0x1D948C7A0]();
    [(NSMutableArray *)pendingZoomUpCompletionBlocks addObject:v8];
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (id)lendAnimatingDropletViewToExternalOwner
{
  [(SBCaptureButtonDropletLaunchViewController *)self _setStage:3 animated:0 milestones:0];
  dropletContext = self->_dropletContext;
  return (id)[(DRPDropletContextView *)dropletContext acquireGeometricChangeAssertionForReason:@"Lent Droplet"];
}

- (void)resetToOffscreenAnimated:(BOOL)a3 milestones:(id)a4
{
  [(SBCaptureButtonDropletLaunchViewController *)self _setStage:0 animated:a3 milestones:a4];
  [(SBCaptureButtonDropletLaunchViewController *)self _zoomUpAnimationCompleted:0];
}

- (CGRect)preludeAnimationRectPresentationValue
{
  v2 = [(DRPDropletContainerView *)self->_appDropletContainer layer];
  id v3 = [v2 presentationLayer];
  [v3 frame];
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

- (id)animatingDroplet
{
  return self->_appDropletContainer;
}

- (id)animatingDropletContext
{
  return self->_dropletContext;
}

- (CGPoint)preludeAnimationVelocity
{
  id v3 = [(DRPDropletContainerView *)self->_appDropletContainer _velocityForKey:@"position.x"];
  [v3 doubleValue];
  double v5 = v4;

  double v6 = [(DRPDropletContainerView *)self->_appDropletContainer _velocityForKey:@"position.y"];
  [v6 doubleValue];
  double v8 = v7;

  double v9 = v5;
  double v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (void)loadView
{
  [(SBCaptureButtonDropletLaunchViewController *)self _defaultInitialViewFrame];
  id v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4FA6028]), "initWithFrame:", v3, v4, v5, v6);
  [v7 setOpaque:0];
  [(SBCaptureButtonDropletLaunchViewController *)self setView:v7];
}

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)SBCaptureButtonDropletLaunchViewController;
  [(SBCaptureButtonDropletLaunchViewController *)&v16 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x1E4F5FA10]);
  double v4 = [(SBCaptureButtonDropletLaunchViewController *)self view];
  [v4 bounds];
  double v5 = (DRPDropletContextView *)objc_msgSend(v3, "initWithFrame:");
  dropletContext = self->_dropletContext;
  self->_dropletContext = v5;

  id v7 = [(SBCaptureButtonDropletLaunchViewController *)self view];
  [v7 addSubview:self->_dropletContext];

  [(DRPDropletContextView *)self->_dropletContext setAutoresizingMask:18];
  double v8 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
  contentView = self->_contentView;
  self->_contentView = v8;

  double v10 = [(DRPDropletContextView *)self->_dropletContext addContainerWithContentView:self->_contentView];
  appDropletContainer = self->_appDropletContainer;
  self->_appDropletContainer = v10;

  double v12 = (DRPDropletAnimationCoordinator *)objc_alloc_init(MEMORY[0x1E4F5FA08]);
  animator = self->_animator;
  self->_animator = v12;

  self->_unint64_t stage = 0;
  double v14 = [(SBCaptureButtonDropletLaunchViewController *)self view];
  [v14 setNeedsLayout];

  double v15 = [(SBCaptureButtonDropletLaunchViewController *)self view];
  [v15 layoutIfNeeded];
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SBCaptureButtonDropletLaunchViewController;
  [(SBCaptureButtonDropletLaunchViewController *)&v3 viewWillLayoutSubviews];
  if (self->_stage != 3) {
    [(SBCaptureButtonDropletLaunchViewController *)self _applyViewConfigurationForCurrentStage];
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

- (void)_setStage:(unint64_t)a3 animated:(BOOL)a4 milestones:(id)a5
{
  BOOL v5 = a4;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  double v10 = v9;
  if (self->_stage == a3 && self->_animateNextStageTransition == v5) {
    goto LABEL_47;
  }
  self->_unint64_t stage = a3;
  self->_animateNextStageTransition = v5;
  if (self->_stage == 2 || (self->_unint64_t expansionComponents = 0, self->_stage != 1)) {
    self->_dropetIntelligentKeylineStage = 0;
  }
  if (a3 == 3 && v9)
  {
    v40 = [MEMORY[0x1E4F28B00] currentHandler];
    [v40 handleFailureInMethod:a2 object:self file:@"SBCaptureButtonDropletLaunchViewController.m" lineNumber:200 description:@"Unimplemented"];
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  double v11 = [(NSMutableDictionary *)self->_toStageCompletionBlock allKeys];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v50 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = [(NSMutableDictionary *)self->_toStageCompletionBlock objectForKey:*(void *)(*((void *)&v49 + 1) + 8 * i)];
        v17 = (void *)v16;
        if (v16) {
          (*(void (**)(uint64_t, void, uint64_t, double, double))(v16 + 16))(v16, 0, 1, 1.79769313e308, 1.79769313e308);
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v49 objects:v55 count:16];
    }
    while (v13);
  }

  [(NSMutableDictionary *)self->_toStageCompletionBlock removeAllObjects];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v18 = [(NSMutableDictionary *)self->_toStageFloatAnimatableProperty allKeys];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v45 objects:v54 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v46;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v46 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = [(NSMutableDictionary *)self->_toStageFloatAnimatableProperty objectForKey:*(void *)(*((void *)&v45 + 1) + 8 * j)];
        v24 = v23;
        if (v23 && ([v23 isInvalidated] & 1) == 0) {
          [v24 invalidate];
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v45 objects:v54 count:16];
    }
    while (v20);
  }

  [(NSMutableDictionary *)self->_toStageFloatAnimatableProperty removeAllObjects];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v25 = v10;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v41 objects:v53 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    v28 = 0;
    uint64_t v29 = *(void *)v42;
    do
    {
      for (uint64_t k = 0; k != v27; ++k)
      {
        if (*(void *)v42 != v29) {
          objc_enumerationMutation(v25);
        }
        v31 = *(void **)(*((void *)&v41 + 1) + 8 * k);
        objc_msgSend(v31, "bs_CGFloatValue");
        if (BSFloatEqualToFloat())
        {
          uint64_t v32 = [v25 objectForKey:v31];

          v28 = (void *)v32;
        }
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v41 objects:v53 count:16];
    }
    while (v27);

    if (!v28) {
      goto LABEL_41;
    }
    toStageCompletionBlocuint64_t k = self->_toStageCompletionBlock;
    v34 = (void *)MEMORY[0x1D948C7A0](v28);
    v35 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)toStageCompletionBlock setObject:v34 forKey:v35];
  }
  else
  {
    v28 = 0;
    v34 = v25;
  }

LABEL_41:
  double v10 = objc_msgSend(v25, "bs_filter:", &__block_literal_global_221);

  if (v10 && [v10 count])
  {
    v36 = objc_msgSend(MEMORY[0x1E4FA6038], "sbf_animatablePropertyWithProgressMilestonesToBlocks:", v10);
    toStageFloatAnimatableProperty = self->_toStageFloatAnimatableProperty;
    v38 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)toStageFloatAnimatableProperty setObject:v36 forKey:v38];
  }
  if (a3 != 3)
  {
    v39 = [(SBCaptureButtonDropletLaunchViewController *)self view];
    [v39 setNeedsLayout];
  }
LABEL_47:
}

uint64_t __76__SBCaptureButtonDropletLaunchViewController__setStage_animated_milestones___block_invoke(uint64_t a1, void *a2)
{
  return BSFloatEqualToFloat() ^ 1;
}

- (void)_applyViewConfigurationForCurrentStage
{
  objc_super v3 = [(SBCaptureButtonDropletLaunchViewController *)self _configurationForStage:self->_stage];
  if (v3)
  {
    double v4 = v3;
    [(DRPDropletAnimationCoordinator *)self->_animator applyViewConfiguration:v3 animated:self->_animateNextStageTransition tracking:0 containerView:self->_appDropletContainer contextView:self->_dropletContext];
    objc_super v3 = v4;
  }
}

- (void)_zoomUpAnimationCompleted:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  pendingZoomUpCompletionBlocks = self->_pendingZoomUpCompletionBlocks;
  if (pendingZoomUpCompletionBlocks)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    BOOL v5 = (void *)[(NSMutableArray *)pendingZoomUpCompletionBlocks copy];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v9++) + 16))();
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }

    [(NSMutableArray *)self->_pendingZoomUpCompletionBlocks removeAllObjects];
    double v10 = self->_pendingZoomUpCompletionBlocks;
    self->_pendingZoomUpCompletionBlocks = 0;
  }
}

- (id)_configurationForStage:(unint64_t)a3
{
  BOOL v5 = [(SBCaptureButtonDropletLaunchViewController *)self view];
  [v5 bounds];
  rect.origin.x = v6;
  CGFloat v8 = v7;
  double v10 = v9;
  double v12 = v11;

  if (a3 == 2)
  {
    double v15 = [(SBCaptureButtonDropletLaunchViewController *)self _defaultConfigurationForStage:2];
    UIRectGetCenter();
    double v17 = v16;
    unint64_t expansionComponents = self->_expansionComponents;
    if (expansionComponents)
    {
      objc_msgSend(v15, "setCenterX:");
      unint64_t expansionComponents = self->_expansionComponents;
      if ((expansionComponents & 2) == 0)
      {
LABEL_7:
        if ((expansionComponents & 4) == 0) {
          goto LABEL_15;
        }
        goto LABEL_14;
      }
    }
    else if ((expansionComponents & 2) == 0)
    {
      goto LABEL_7;
    }
    [v15 setCenterY:v17];
    if ((self->_expansionComponents & 4) == 0) {
      goto LABEL_15;
    }
LABEL_14:
    [v15 setContainerWidth:v10];
    [v15 setContainerHeight:v12];
    goto LABEL_15;
  }
  if (a3 == 1)
  {
    long long v13 = self;
    uint64_t v14 = 1;
  }
  else
  {
    if (a3)
    {
      double v15 = 0;
      goto LABEL_15;
    }
    long long v13 = self;
    uint64_t v14 = 0;
  }
  double v15 = [(SBCaptureButtonDropletLaunchViewController *)v13 _defaultConfigurationForStage:v14];
LABEL_15:
  objc_initWeak(&location, self);
  if (self->_stage == 2 && (self->_expansionComponents & 4) != 0)
  {
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __69__SBCaptureButtonDropletLaunchViewController__configurationForStage___block_invoke;
    v58[3] = &unk_1E6B016A8;
    objc_copyWeak(&v59, &location);
    [v15 addAnimationCompletionBlockForKeyPath:@"containerTransform" animationCompletionBlock:v58];
    objc_destroyWeak(&v59);
  }
  unint64_t v19 = [(SBButtonBezelGeometryInfo *)self->_buttonGeometryInfo buttonScreenEdgeForButton:self->_associatedButton];
  uint64_t v20 = @"centerX";
  if ((v19 & 0xA) == 0) {
    uint64_t v20 = @"centerY";
  }
  uint64_t v21 = v20;
  toStageFloatAnimatableProperty = self->_toStageFloatAnimatableProperty;
  v23 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v24 = [(NSMutableDictionary *)toStageFloatAnimatableProperty objectForKey:v23];

  toStageCompletionBlocuint64_t k = self->_toStageCompletionBlock;
  uint64_t v26 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v27 = [(NSMutableDictionary *)toStageCompletionBlock objectForKey:v26];

  if (v24 | v27)
  {
    if (v24)
    {
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __69__SBCaptureButtonDropletLaunchViewController__configurationForStage___block_invoke_2;
      v56[3] = &unk_1E6B05548;
      id v57 = (id)v24;
      [v15 addAlongsideAnimationBlockForKeyPath:v21 animationBlock:v56];
    }
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __69__SBCaptureButtonDropletLaunchViewController__configurationForStage___block_invoke_3;
    v53[3] = &unk_1E6AFEAE8;
    objc_copyWeak(v55, &location);
    v55[1] = (id)a3;
    id v54 = (id)v27;
    [v15 addAnimationCompletionBlockForKeyPath:v21 animationCompletionBlock:v53];

    objc_destroyWeak(v55);
  }
  if (a3 == 2 && (self->_expansionComponents & 4) != 0)
  {
    [v15 setDisableDropletEffectFilters:1];
    v28 = [(SBCaptureButtonSettings *)self->_settings zoomUpDisableDropletEffectFiltersSettings];
    [v15 setBehaviorSettingsForKeyPath:@"disableDropletEffectFilters" behaviorSettings:v28];
  }
  [(SBCaptureButtonSettings *)self->_settings preludeDropletRadius];
  objc_msgSend(v15, "setDropletRadius:");
  [v15 containerWidth];
  double v30 = v29;
  [v15 containerHeight];
  double v32 = v31;
  [v15 centerX];
  double v34 = v33;
  [v15 centerY];
  double v36 = v35;
  if (a3 == 2)
  {
    unint64_t v37 = self->_expansionComponents;
    if (v37)
    {
      v38 = [(SBCaptureButtonSettings *)self->_settings zoomUpPositionXSettings];
      [v15 setBehaviorSettingsForKeyPath:@"centerX" behaviorSettings:v38];

      unint64_t v37 = self->_expansionComponents;
    }
    if ((v37 & 2) != 0)
    {
      v39 = [(SBCaptureButtonSettings *)self->_settings zoomUpPositionYSettings];
      [v15 setBehaviorSettingsForKeyPath:@"centerY" behaviorSettings:v39];

      unint64_t v37 = self->_expansionComponents;
    }
    if ((v37 & 4) != 0)
    {
      long long v42 = [(SBCaptureButtonSettings *)self->_settings zoomUpScaleSettings];
      [v15 setBehaviorSettingsForKeyPath:@"containerTransform" behaviorSettings:v42];

      double v40 = SBScreenDisplayCornerRadius();
    }
    else
    {
      double v40 = SBScreenDisplayCornerRadius() / (v30 / v10);
    }
    [v15 setContainerCornerRadius:v40];
    long long v41 = [(SBCaptureButtonSettings *)self->_settings zoomUpCornerRadiusSettings];
    [v15 setBehaviorSettingsForKeyPath:@"cornerRadius" behaviorSettings:v41];
  }
  else
  {
    [(SBCaptureButtonSettings *)self->_settings preludeCornerRadius];
    objc_msgSend(v15, "setContainerCornerRadius:");
    long long v41 = [(SBCaptureButtonSettings *)self->_settings preludePresentationTranslationSettings];
    [v15 setBehaviorSettingsForKeyPath:@"centerX" behaviorSettings:v41];
    [v15 setBehaviorSettingsForKeyPath:@"centerY" behaviorSettings:v41];
    [v15 setBehaviorSettingsForKeyPath:@"containerTransform" behaviorSettings:v41];
    [v15 setBehaviorSettingsForKeyPath:@"cornerRadius" behaviorSettings:v41];
  }
  CGFloat v43 = v34 - v30 * 0.5;
  CGFloat v44 = v36 - v32 * 0.5;

  v62.origin.x = v43;
  v62.origin.y = v44;
  v62.size.width = v30;
  v62.size.height = v32;
  [v15 setCenterX:CGRectGetMidX(v62)];
  v63.origin.x = v43;
  v63.origin.y = v44;
  v63.size.width = v30;
  v63.size.height = v32;
  [v15 setCenterY:CGRectGetMidY(v63)];
  v64.origin.x = rect.origin.x;
  v64.origin.y = v8;
  v64.size.width = v10;
  v64.size.height = v12;
  [v15 setContainerWidth:CGRectGetWidth(v64)];
  v65.origin.x = rect.origin.x;
  v65.origin.y = v8;
  v65.size.width = v10;
  v65.size.height = v12;
  [v15 setContainerHeight:CGRectGetHeight(v65)];
  CATransform3DMakeScale((CATransform3D *)&rect.origin.y, v30 / v10, v32 / v12, 1.0);
  [v15 setContainerTransform:&rect.origin.y];
  [v15 setBoundaryEdges:v19];
  long long v45 = [v15 keylineStyle];
  long long v46 = +[SBHardwareButtonHintPrototypeDomain rootSettings];
  [v46 allButtonKeylineWidth];
  objc_msgSend(v45, "setOuterWidth:");

  objc_msgSend(v15, "defaultResetKeylineForCanvasSize:", v10, v12);
  if (self->_dropetIntelligentKeylineStage)
  {
    objc_msgSend(v15, "changeToIntelligentLightStyle:preferAudioReactivity:canvasSize:", 2, 0, v10, v12);
    long long v47 = [v15 keylineStyle];
    objc_msgSend(v47, "setScreenBlendMode:", -[SBCaptureButtonSettings visionIntelligenceKeylineScreenBlendMode](self->_settings, "visionIntelligenceKeylineScreenBlendMode"));
    [(SBCaptureButtonSettings *)self->_settings visionIntelligenceKeylineAlpha];
    objc_msgSend(v47, "setAlpha:");
    [(SBCaptureButtonSettings *)self->_settings visionIntelligenceKeylineLargeBlurRadius];
    objc_msgSend(v47, "setKeylineBlurRadius:");
    [(SBCaptureButtonSettings *)self->_settings visionIntelligenceKeylineLargeAmount];
    objc_msgSend(v47, "setKeylineInputAmount:");
    [(SBCaptureButtonSettings *)self->_settings visionIntelligenceKeylineLargeStart];
    objc_msgSend(v47, "setKeylineInputStart:");
    [(SBCaptureButtonSettings *)self->_settings visionIntelligenceKeylineLargeEnd];
    objc_msgSend(v47, "setKeylineInputEnd:");
    objc_msgSend(v47, "setSoftRim:", -[SBCaptureButtonSettings visionIntelligenceKeylineRimIsSoft](self->_settings, "visionIntelligenceKeylineRimIsSoft"));
    [(SBCaptureButtonSettings *)self->_settings visionIntelligenceKeylineSmallWidth];
    objc_msgSend(v47, "setOuterWidth:");
    [(SBCaptureButtonSettings *)self->_settings visionIntelligenceKeylineFadeLength];
    objc_msgSend(v47, "setKeylineFadeLengths:", v48, v48 * 0.5, v48, 0.0);
    [v47 keylineOutsets];
    objc_msgSend(v47, "setKeylineOutsets:");
    [(SBCaptureButtonSettings *)self->_settings visionIntelligenceKeylineFadeStart];
    objc_msgSend(v47, "setNormalizedStartLocation:");
    [(SBCaptureButtonSettings *)self->_settings visionIntelligenceKeylineFadeEnd];
    objc_msgSend(v47, "setNormalizedStopLocation:");
    if (objc_opt_respondsToSelector())
    {
      [(SBCaptureButtonSettings *)self->_settings visionIntelligenceKeylineEDRGain];
      objc_msgSend(v47, "setEdrGain:");
    }
    settings = self->_settings;
    if (self->_dropetIntelligentKeylineStage == 1) {
      [(SBCaptureButtonSettings *)settings visionIntelligenceHintBehaviorSettings];
    }
    else {
    long long v50 = [(SBCaptureButtonSettings *)settings visionIntelligenceBehaviorSettings];
    }
    [v15 setBehaviorSettingsForKeyPath:@"keylineStyle" behaviorSettings:v50];
  }
  else
  {
    long long v47 = (void *)[objc_alloc(MEMORY[0x1E4FA5F08]) initWithDefaultValues];
    [v47 setResponse:0.0];
    [v47 setDampingRatio:1.0];
    [v15 setBehaviorSettingsForKeyPath:@"keylineStyle" behaviorSettings:v47];
  }

  objc_destroyWeak(&location);
  return v15;
}

void __69__SBCaptureButtonDropletLaunchViewController__configurationForStage___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained _zoomUpAnimationCompleted:a2];
    id WeakRetained = v4;
  }
}

uint64_t __69__SBCaptureButtonDropletLaunchViewController__configurationForStage___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setValue:1.0];
}

void __69__SBCaptureButtonDropletLaunchViewController__configurationForStage___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v11 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v5 = (void *)WeakRetained[129];
    CGFloat v6 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
    double v7 = [v5 objectForKey:v6];

    if (v7)
    {
      if (([v7 isInvalidated] & 1) == 0) {
        [v7 invalidate];
      }
      CGFloat v8 = (void *)v11[129];
      double v9 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
      [v8 removeObjectForKey:v9];
    }
  }
  else
  {
    double v7 = 0;
  }
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, void *, uint64_t, double, double))(v10 + 16))(v10, v7, a2, 1.79769313e308, 1.79769313e308);
  }
}

- (id)_defaultConfigurationForStage:(unint64_t)a3
{
  unint64_t v5 = [(SBButtonBezelGeometryInfo *)self->_buttonGeometryInfo buttonScreenEdgeForButton:9];
  buttonGeometryInfo = self->_buttonGeometryInfo;
  double v7 = [(SBCaptureButtonDropletLaunchViewController *)self view];
  [v7 bounds];
  -[SBButtonBezelGeometryInfo buttonHWRectForButton:onEmbeddedDisplayBounds:](buttonGeometryInfo, "buttonHWRectForButton:onEmbeddedDisplayBounds:", 9);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = [(SBCaptureButtonDropletLaunchViewController *)self view];
  [v16 bounds];
  double v18 = v17;
  double v20 = v19;

  uint64_t v21 = (void *)MEMORY[0x1E4F5FA18];
  return (id)objc_msgSend(v21, "hardwareButtonHintForButton:stage:keylineStyle:rectEdge:buttonRect:canvasSize:", 9, a3 != 0, 0, v5, v9, v11, v13, v15, v18, v20);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingZoomUpCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_toStageCompletionBlock, 0);
  objc_storeStrong((id *)&self->_toStageFloatAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_animator, 0);
  objc_storeStrong((id *)&self->_appDropletContainer, 0);
  objc_storeStrong((id *)&self->_dropletContext, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_buttonGeometryInfo, 0);
}

@end