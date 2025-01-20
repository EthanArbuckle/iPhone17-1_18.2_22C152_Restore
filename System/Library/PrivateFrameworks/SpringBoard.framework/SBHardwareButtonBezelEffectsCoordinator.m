@interface SBHardwareButtonBezelEffectsCoordinator
- (BOOL)hintDropletsEnabled;
- (CGPoint)preludeAnimationVelocity;
- (CGRect)preludeAnimationRectPresentationValue;
- (SBHardwareButtonBezelEffectsCoordinator)initWithWindowScene:(id)a3;
- (UIView)dropletLaunchPortalSourceView;
- (id)_policyAggregator;
- (id)activateHintDropletForButton:(int64_t)a3;
- (id)animateLaunchZoomUpPreludeFromButton:(int64_t)a3;
- (id)animatingDroplet;
- (id)animatingDropletContext;
- (id)associateHintView:(id)a3 withButton:(int64_t)a4;
- (id)commandeerDropletAnimationWithToken:(id)a3;
- (id)observePortalSourceWithHandler:(id)a3;
- (id)requestSystemGlowEffectWithInitialStyle:(int64_t)a3 reason:(id)a4;
- (id)setDropletLayoutCallback:(id)a3 forButton:(int64_t)a4;
- (void)_beginRequiringBacklightAssertionForReason:(id)a3;
- (void)_endRequiringBacklightAssertionForReason:(id)a3;
- (void)_presentOrDismissLaunchAnimationWindowIfNecessary;
- (void)_reevaluateSystemGlowEffect;
- (void)_setHintDropletWindowVisible:(BOOL)a3;
- (void)_setLaunchAnimationWindowVisible:(BOOL)a3;
- (void)_setShockwaveState:(int64_t)a3 completion:(id)a4;
- (void)_updateLaunchAnimationWindowLevelIfNecessary;
- (void)cancelPrelude;
- (void)dealloc;
- (void)hintDropletViewControllerDidBecomeIdle:(id)a3;
- (void)preludeToken:(id)a3 expandHintingDropletByAddingComponents:(unint64_t)a4 shockwave:(BOOL)a5;
- (void)preludeToken:(id)a3 updateShockwaveLightType:(int64_t)a4;
- (void)updateHintContentVisibility:(int64_t)a3 forButton:(int64_t)a4 animationSettings:(id)a5;
- (void)updateSystemGlowStyle:(int64_t)a3;
- (void)zoomUpToken:(id)a3 appendZoomUpCompletionBlock:(id)a4;
@end

@implementation SBHardwareButtonBezelEffectsCoordinator

- (SBHardwareButtonBezelEffectsCoordinator)initWithWindowScene:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBHardwareButtonBezelEffectsCoordinator;
  v6 = [(SBHardwareButtonBezelEffectsCoordinator *)&v16 init];
  if (v6)
  {
    uint64_t v7 = +[SBCaptureButtonDomain rootSettings];
    settings = v6->_settings;
    v6->_settings = (SBCaptureButtonSettings *)v7;

    objc_storeStrong((id *)&v6->_windowScene, a3);
    objc_initWeak(&location, v6);
    v9 = (void *)MEMORY[0x1E4F4F6E8];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __63__SBHardwareButtonBezelEffectsCoordinator_initWithWindowScene___block_invoke;
    v13[3] = &unk_1E6AF92D8;
    objc_copyWeak(&v14, &location);
    uint64_t v10 = [v9 assertionWithIdentifier:@"SBHardwareButtonBezelEffectsCoordinator.systemGlowEffect" stateDidChangeHandler:v13];
    systemGlowEffectAssertion = v6->_systemGlowEffectAssertion;
    v6->_systemGlowEffectAssertion = (BSCompoundAssertion *)v10;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __63__SBHardwareButtonBezelEffectsCoordinator_initWithWindowScene___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reevaluateSystemGlowEffect];
}

- (void)dealloc
{
  [(BSCompoundAssertion *)self->_systemGlowEffectAssertion invalidate];
  systemGlowEffectAssertion = self->_systemGlowEffectAssertion;
  self->_systemGlowEffectAssertion = 0;

  v4.receiver = self;
  v4.super_class = (Class)SBHardwareButtonBezelEffectsCoordinator;
  [(SBHardwareButtonBezelEffectsCoordinator *)&v4 dealloc];
}

- (UIView)dropletLaunchPortalSourceView
{
  return (UIView *)self->_dropletLaunchWindow;
}

- (id)observePortalSourceWithHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [_SBHardwareButtonPortalObservationToken alloc];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __74__SBHardwareButtonBezelEffectsCoordinator_observePortalSourceWithHandler___block_invoke;
  v15 = &unk_1E6B01658;
  objc_copyWeak(&v16, &location);
  v6 = [(_SBHardwareButtonPortalObservationToken *)v5 initWithObserverBlock:v4 invalidationBlock:&v12];
  portalObservationTokens = self->_portalObservationTokens;
  if (!portalObservationTokens)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v9 = (NSMutableArray *)objc_msgSend(v8, "initWithCapacity:", 1, v12, v13, v14, v15);
    uint64_t v10 = self->_portalObservationTokens;
    self->_portalObservationTokens = v9;

    portalObservationTokens = self->_portalObservationTokens;
  }
  -[NSMutableArray addObject:](portalObservationTokens, "addObject:", v6, v12, v13, v14, v15);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v6;
}

void __74__SBHardwareButtonBezelEffectsCoordinator_observePortalSourceWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained[5] removeObject:v5];
  }
}

- (id)animateLaunchZoomUpPreludeFromButton:(int64_t)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  p_animatingPreludeToken = &self->_animatingPreludeToken;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_animatingPreludeToken);
  if (WeakRetained)
  {

LABEL_4:
    v9 = 0;
    goto LABEL_5;
  }
  id v8 = objc_loadWeakRetained((id *)&self->_animatingLaunchCompletionToken);

  if (v8) {
    goto LABEL_4;
  }
  uint64_t v12 = SBLogTelemetrySignposts();
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D85BA000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_CAPTURE_PRELUDE_HINT_AND_LAYOUT", (const char *)&unk_1D8FE2CAB, buf, 2u);
  }

  kdebug_trace();
  [(id)*MEMORY[0x1E4F43630] _performBlockAfterCATransactionCommits:&__block_literal_global_152];
  objc_initWeak((id *)buf, self);
  if (!a3)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"SBHardwareButtonBezelEffectsCoordinator.m" lineNumber:195 description:@"Must supply specific concrete origin from which to animate."];
  }
  self->_lastRequestedLaunchOrigin = a3;
  uint64_t v13 = [_SBCaptureButtonLaunchAnimationPreludeToken alloc];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __80__SBHardwareButtonBezelEffectsCoordinator_animateLaunchZoomUpPreludeFromButton___block_invoke_17;
  v19[3] = &unk_1E6AF4B10;
  objc_copyWeak(&v20, (id *)buf);
  v9 = [(_SBCaptureButtonLaunchAnimationPreludeToken *)v13 initWithPreludeAnimating:self invalidationBlock:v19];
  objc_storeWeak((id *)p_animatingPreludeToken, v9);
  [(SBHardwareButtonBezelEffectsCoordinator *)self _presentOrDismissLaunchAnimationWindowIfNecessary];
  [(SBCaptureButtonDropletLaunchViewController *)self->_dropletLaunchViewController animateDropletFromButtonWithMilestones:0];
  [(SBHardwareButtonBezelEffectsCoordinator *)self _setShockwaveState:1 completion:0];
  id v14 = [(SBWindowScene *)self->_windowScene assistantController];
  if ([v14 isSystemAssistantExperienceEnabled])
  {
    int v15 = _os_feature_enabled_impl();

    if (v15)
    {
      id v16 = [(SBCaptureButtonDropletLaunchViewController *)self->_dropletLaunchViewController view];
      [v16 layoutIfNeeded];

      v17 = [(SUIAShockwaveViewController *)self->_shockwaveViewController view];
      [v17 layoutIfNeeded];

      [(SBCaptureButtonDropletLaunchViewController *)self->_dropletLaunchViewController expandDropletKeylineToIntelligentKeylineStage:1];
      [(SUIAShockwaveViewController *)self->_shockwaveViewController setPreferredLightType:1];
    }
  }
  else
  {
  }
  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
LABEL_5:
  uint64_t v10 = SBLogCameraCaptureLaunchAnimation();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v9;
    _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Bezel Effects: issuing prelude token: %@", buf, 0xCu);
  }

  return v9;
}

uint64_t __80__SBHardwareButtonBezelEffectsCoordinator_animateLaunchZoomUpPreludeFromButton___block_invoke()
{
  v0 = SBLogTelemetrySignposts();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v2 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D85BA000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_CAPTURE_PRELUDE_HINT_AND_LAYOUT", (const char *)&unk_1D8FE2CAB, v2, 2u);
  }

  return kdebug_trace();
}

void __80__SBHardwareButtonBezelEffectsCoordinator_animateLaunchZoomUpPreludeFromButton___block_invoke_17(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_storeWeak(WeakRetained + 2, 0);
    [v2 _presentOrDismissLaunchAnimationWindowIfNecessary];
    id WeakRetained = v2;
  }
}

- (id)commandeerDropletAnimationWithToken:(id)a3
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [(SBCaptureButtonDropletLaunchViewController *)self->_dropletLaunchViewController view];
  uint64_t v7 = [v6 layer];
  id v8 = [(SBCaptureButtonDropletLaunchViewController *)self->_dropletLaunchViewController view];
  v9 = [v8 layer];
  objc_msgSend(v7, "setDisableUpdateMask:", objc_msgSend(v9, "disableUpdateMask") & 0xFFFFFFFDLL);

  uint64_t v10 = self;
  id v11 = v5;
  if (v10)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  id v13 = v12;

  if (!v13)
  {
    v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"preludeToken != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      [(SBHardwareButtonBezelEffectsCoordinator *)a2 commandeerDropletAnimationWithToken:(uint64_t)v26];
    }
    [v26 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8A166F4);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_animatingPreludeToken);
  int v15 = BSEqualObjects();

  if (v15)
  {
    if ([(SBCaptureButtonDropletLaunchViewController *)self->_dropletLaunchViewController expandHintingDropletByAddingComponents:7])
    {
      id v16 = [(SBCaptureButtonDropletLaunchViewController *)self->_dropletLaunchViewController view];
      [v16 layoutIfNeeded];
    }
    objc_initWeak(location, self);
    v17 = [(SBCaptureButtonDropletLaunchViewController *)self->_dropletLaunchViewController lendAnimatingDropletViewToExternalOwner];
    v18 = [_SBHardwareButtonLaunchZoomUpAnimationToken alloc];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __79__SBHardwareButtonBezelEffectsCoordinator_commandeerDropletAnimationWithToken___block_invoke;
    v27[3] = &unk_1E6AF5AF0;
    objc_copyWeak(&v29, location);
    id v19 = v17;
    id v28 = v19;
    id v20 = [(_SBHardwareButtonLaunchZoomUpAnimationToken *)v18 initWithPreludeAnimating:self invalidationBlock:v27];
    objc_storeWeak((id *)&self->_animatingLaunchCompletionToken, v20);
    [(_SBHardwareButtonLaunchZoomUpAnimationToken *)v20 setRequestedDropletWindowLevel:0.0];
    [v13 invalidate];
    objc_storeWeak((id *)&self->_animatingPreludeToken, 0);
    v21 = [(_SBHardwareButtonLaunchZoomUpAnimationToken *)v20 animatingDropletContext];
    v22 = [(_SBHardwareButtonLaunchZoomUpAnimationToken *)v20 animatingDroplet];
    [v21 applyKeylineStyle:0 forContainerView:v22];

    objc_destroyWeak(&v29);
    objc_destroyWeak(location);
  }
  else
  {
    uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2 object:self file:@"SBHardwareButtonBezelEffectsCoordinator.m" lineNumber:254 description:@"Unexpected"];

    id v20 = 0;
  }
  v24 = SBLogCameraCaptureLaunchAnimation();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(location[0]) = 138412290;
    *(id *)((char *)location + 4) = v20;
    _os_log_impl(&dword_1D85BA000, v24, OS_LOG_TYPE_DEFAULT, "Bezel Effects: issuing zoom up token: %@", (uint8_t *)location, 0xCu);
  }

  return v20;
}

void __79__SBHardwareButtonBezelEffectsCoordinator_commandeerDropletAnimationWithToken___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    [*(id *)(a1 + 32) invalidate];
    objc_storeWeak(WeakRetained + 4, 0);
    [WeakRetained _presentOrDismissLaunchAnimationWindowIfNecessary];
  }
}

- (void)preludeToken:(id)a3 expandHintingDropletByAddingComponents:(unint64_t)a4 shockwave:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  if (v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_animatingPreludeToken);
    int v10 = BSEqualObjects();

    if (v10)
    {
      id v11 = SBLogTelemetrySignposts();
      if (os_signpost_enabled(v11))
      {
        *(_WORD *)id v14 = 0;
        _os_signpost_emit_with_name_impl(&dword_1D85BA000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_CAPTURE_PRELUDE_EXPAND_AND_LAYOUT", (const char *)&unk_1D8FE2CAB, v14, 2u);
      }

      kdebug_trace();
      [(id)*MEMORY[0x1E4F43630] _performBlockAfterCATransactionCommits:&__block_literal_global_32];
      uint64_t v12 = [(SUIAShockwaveViewController *)self->_shockwaveViewController state];
      if (v5) {
        uint64_t v13 = 2;
      }
      else {
        uint64_t v13 = 4;
      }
      [(SBHardwareButtonBezelEffectsCoordinator *)self _setShockwaveState:v13 completion:0];
      if ([(SBCaptureButtonDropletLaunchViewController *)self->_dropletLaunchViewController expandHintingDropletByAddingComponents:a4]|| v12 != [(SUIAShockwaveViewController *)self->_shockwaveViewController state])
      {
        [(SBHardwareButtonBezelEffectsCoordinator *)self _presentOrDismissLaunchAnimationWindowIfNecessary];
      }
    }
  }
}

uint64_t __105__SBHardwareButtonBezelEffectsCoordinator_preludeToken_expandHintingDropletByAddingComponents_shockwave___block_invoke()
{
  v0 = SBLogTelemetrySignposts();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v2 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D85BA000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_CAPTURE_PRELUDE_EXPAND_AND_LAYOUT", (const char *)&unk_1D8FE2CAB, v2, 2u);
  }

  return kdebug_trace();
}

- (void)preludeToken:(id)a3 updateShockwaveLightType:(int64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    id v11 = v6;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_animatingPreludeToken);
    int v8 = BSEqualObjects();

    id v6 = v11;
    if (v8)
    {
      [(SUIAShockwaveViewController *)self->_shockwaveViewController setPreferredLightType:a4];
      dropletLaunchViewController = self->_dropletLaunchViewController;
      if (a4 == 1)
      {
        [(SBCaptureButtonDropletLaunchViewController *)dropletLaunchViewController expandDropletKeylineToIntelligentKeylineStage:2];
      }
      else
      {
        [(SBCaptureButtonDropletLaunchViewController *)dropletLaunchViewController expandDropletKeylineToIntelligentKeylineStage:0];
        int v10 = [(SBCaptureButtonDropletLaunchViewController *)self->_dropletLaunchViewController view];
        [v10 layoutIfNeeded];
      }
      id v6 = v11;
    }
  }
}

- (void)cancelPrelude
{
  v23[1] = *MEMORY[0x1E4F143B8];
  *(_WORD *)&self->_animatingDropletCancellation = 257;
  objc_initWeak(&location, self);
  v3 = SBLogCameraCaptureLaunchAnimation();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Bezel Effects: Cancel prelude animatedly", buf, 2u);
  }

  [(SUIAShockwaveViewController *)self->_shockwaveViewController setPreferredLightType:0];
  dropletLaunchViewController = self->_dropletLaunchViewController;
  v22 = &unk_1F3348BB8;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __56__SBHardwareButtonBezelEffectsCoordinator_cancelPrelude__block_invoke;
  v18[3] = &unk_1E6B01680;
  objc_copyWeak(&v19, &location);
  BOOL v5 = (void *)MEMORY[0x1D948C7A0](v18);
  v23[0] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
  [(SBCaptureButtonDropletLaunchViewController *)dropletLaunchViewController resetToOffscreenAnimated:1 milestones:v6];

  uint64_t v7 = [(SUIAShockwaveViewController *)self->_shockwaveViewController state];
  uint64_t v8 = v7;
  if (self->_animatingShockwave || v7 == 1)
  {
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    int v15 = __56__SBHardwareButtonBezelEffectsCoordinator_cancelPrelude__block_invoke_2;
    id v16 = &unk_1E6B016A8;
    objc_copyWeak(&v17, &location);
    v9 = (void *)MEMORY[0x1D948C7A0](&v13);
    if (v8 == 1)
    {
      uint64_t v10 = 4;
    }
    else
    {
      if (v8 != 2)
      {
LABEL_10:

        objc_destroyWeak(&v17);
        goto LABEL_11;
      }
      uint64_t v10 = 5;
    }
    -[SBHardwareButtonBezelEffectsCoordinator _setShockwaveState:completion:](self, "_setShockwaveState:completion:", v10, v9, v13, v14, v15, v16);
    goto LABEL_10;
  }
LABEL_11:
  p_animatingPreludeToken = &self->_animatingPreludeToken;
  id WeakRetained = objc_loadWeakRetained((id *)p_animatingPreludeToken);
  [WeakRetained invalidate];

  objc_storeWeak((id *)p_animatingPreludeToken, 0);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __56__SBHardwareButtonBezelEffectsCoordinator_cancelPrelude__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[96] = 0;
    v2 = WeakRetained;
    [WeakRetained _presentOrDismissLaunchAnimationWindowIfNecessary];
    id WeakRetained = v2;
  }
}

void __56__SBHardwareButtonBezelEffectsCoordinator_cancelPrelude__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[97] = 0;
    v2 = WeakRetained;
    [WeakRetained _presentOrDismissLaunchAnimationWindowIfNecessary];
    id WeakRetained = v2;
  }
}

- (CGRect)preludeAnimationRectPresentationValue
{
  [(SBCaptureButtonDropletLaunchViewController *)self->_dropletLaunchViewController preludeAnimationRectPresentationValue];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGPoint)preludeAnimationVelocity
{
  [(SBCaptureButtonDropletLaunchViewController *)self->_dropletLaunchViewController preludeAnimationVelocity];
  result.y = v3;
  result.x = v2;
  return result;
}

- (id)animatingDroplet
{
  return [(SBCaptureButtonDropletLaunchViewController *)self->_dropletLaunchViewController animatingDroplet];
}

- (id)animatingDropletContext
{
  return [(SBCaptureButtonDropletLaunchViewController *)self->_dropletLaunchViewController animatingDropletContext];
}

- (id)activateHintDropletForButton:(int64_t)a3
{
  if ([(SBHardwareButtonBezelEffectsCoordinator *)self hintDropletsEnabled])
  {
    [(SBHardwareButtonBezelEffectsCoordinator *)self _setHintDropletWindowVisible:1];
    double v5 = [(SBHardwareButtonHintDropletViewController *)self->_hintDropletViewController activateHintDropletForButton:a3];
  }
  else
  {
    double v5 = 0;
  }
  return v5;
}

- (id)associateHintView:(id)a3 withButton:(int64_t)a4
{
  id v6 = a3;
  if ([(SBHardwareButtonBezelEffectsCoordinator *)self hintDropletsEnabled])
  {
    [(SBHardwareButtonBezelEffectsCoordinator *)self _setHintDropletWindowVisible:1];
    uint64_t v7 = [(SBHardwareButtonHintDropletViewController *)self->_hintDropletViewController associateHintView:v6 withButton:a4];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)updateHintContentVisibility:(int64_t)a3 forButton:(int64_t)a4 animationSettings:(id)a5
{
  id v8 = a5;
  if ([(SBHardwareButtonBezelEffectsCoordinator *)self hintDropletsEnabled])
  {
    hintDropletViewController = self->_hintDropletViewController;
    if (hintDropletViewController)
    {
      [(SBHardwareButtonHintDropletViewController *)hintDropletViewController updateHintContentVisibility:a3 forButton:a4 animationSettings:v8];
    }
    else
    {
      uint64_t v10 = SBLogButtonHintingUI();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[SBHardwareButtonBezelEffectsCoordinator updateHintContentVisibility:forButton:animationSettings:](v10);
      }
    }
  }
}

- (id)requestSystemGlowEffectWithInitialStyle:(int64_t)a3 reason:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(SBWindowScene *)self->_windowScene assistantController];
  if ([v7 isSystemAssistantExperienceEnabled])
  {
    id v8 = [(SBHardwareButtonBezelEffectsCoordinator *)self _policyAggregator];
    int v9 = [v8 allowsCapability:28];

    if (v9)
    {
      self->_systemGlowActivating = a3 == 0;
      uint64_t v10 = [(BSCompoundAssertion *)self->_systemGlowEffectAssertion acquireForReason:v6];
      goto LABEL_6;
    }
  }
  else
  {
  }
  uint64_t v10 = 0;
LABEL_6:

  return v10;
}

- (void)updateSystemGlowStyle:(int64_t)a3
{
  self->_systemGlowActivating = a3 == 0;
  [(SBHardwareButtonBezelEffectsCoordinator *)self _reevaluateSystemGlowEffect];
}

- (void)_reevaluateSystemGlowEffect
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v3 = [(BSCompoundAssertion *)self->_systemGlowEffectAssertion isActive];
  double v4 = SBLogButtonHintingUI();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [(SBHardwareButtonHintDropletViewController *)self->_hintDropletViewController description];
    id v6 = (void *)v5;
    uint64_t v7 = @"nil";
    if (v5) {
      uint64_t v7 = (__CFString *)v5;
    }
    v10[0] = 67109378;
    v10[1] = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "reevaluateSystemGlowEffect: %{BOOL}u viewController: %@", (uint8_t *)v10, 0x12u);
  }
  if (v3)
  {
    hintDropletViewController = self->_hintDropletViewController;
    if (self->_systemGlowActivating) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = 2;
    }
  }
  else
  {
    self->_systemGlowActivating = 0;
    hintDropletViewController = self->_hintDropletViewController;
    uint64_t v9 = 0;
  }
  [(SBHardwareButtonHintDropletViewController *)hintDropletViewController setKeylineStyle:v9];
}

- (id)setDropletLayoutCallback:(id)a3 forButton:(int64_t)a4
{
  id v6 = a3;
  [(SBHardwareButtonBezelEffectsCoordinator *)self _setHintDropletWindowVisible:1];
  uint64_t v7 = [(SBHardwareButtonHintDropletViewController *)self->_hintDropletViewController setDropletLayoutCallback:v6 forButton:a4];

  return v7;
}

- (void)zoomUpToken:(id)a3 appendZoomUpCompletionBlock:(id)a4
{
}

- (void)hintDropletViewControllerDidBecomeIdle:(id)a3
{
  if (self->_hintDropletViewController == a3) {
    [(SBHardwareButtonBezelEffectsCoordinator *)self _setHintDropletWindowVisible:0];
  }
}

- (void)_presentOrDismissLaunchAnimationWindowIfNecessary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_animatingPreludeToken);
  if (WeakRetained)
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = objc_loadWeakRetained((id *)&self->_animatingLaunchCompletionToken);
    BOOL v4 = v5 || self->_animatingDropletCancellation || self->_animatingShockwaveCancellation;
  }
  [(SBHardwareButtonBezelEffectsCoordinator *)self _setLaunchAnimationWindowVisible:v4];
  [(SBHardwareButtonBezelEffectsCoordinator *)self _updateLaunchAnimationWindowLevelIfNecessary];
}

- (void)_setLaunchAnimationWindowVisible:(BOOL)a3
{
  dropletLaunchWindow = self->_dropletLaunchWindow;
  if (a3)
  {
    if (dropletLaunchWindow) {
      return;
    }
    id v5 = [[SBCaptureButtonDropletLaunchViewController alloc] initWithButtonOrigin:self->_lastRequestedLaunchOrigin];
    dropletLaunchViewController = self->_dropletLaunchViewController;
    self->_dropletLaunchViewController = v5;

    uint64_t v7 = (SBFSecureTouchPassThroughWindow *)[objc_alloc(MEMORY[0x1E4FA5FD8]) initWithWindowScene:self->_windowScene role:@"SBTraitsParticipantRoleHardwareButtonBezelEffectsCoordinator" debugName:@"Hardware Button Bezel Effects Coordinator - Droplet Launch"];
    id v8 = self->_dropletLaunchWindow;
    self->_dropletLaunchWindow = v7;

    [(SBFSecureTouchPassThroughWindow *)self->_dropletLaunchWindow bs_setHitTestingDisabled:1];
    [(SBFSecureTouchPassThroughWindow *)self->_dropletLaunchWindow setWindowLevel:*MEMORY[0x1E4F43CF8] + 15.0 + 1.0];
    [(SBFSecureTouchPassThroughWindow *)self->_dropletLaunchWindow setRootViewController:self->_dropletLaunchViewController];
    uint64_t v9 = +[SBButtonBezelGeometryInfo buttonBezelGeometryInfoForCurrentEmbeddedDisplayBezel];
    [v9 normalizedButtonHWRectForButton:self->_lastRequestedLaunchOrigin];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;

    id v18 = objc_alloc(MEMORY[0x1E4FA9980]);
    id v19 = [MEMORY[0x1E4F42D90] mainScreen];
    [v19 bounds];
    v24 = objc_msgSend(v18, "initWithNormalizedButtonEdgeLocation:shockwaveViewBounds:", v11, v13, v15, v17, v20, v21, v22, v23);

    v25 = (SUIAShockwaveViewController *)[objc_alloc(MEMORY[0x1E4FA9988]) initWithStyle:v24];
    shockwaveViewController = self->_shockwaveViewController;
    self->_shockwaveViewController = v25;

    [(SBCaptureButtonDropletLaunchViewController *)self->_dropletLaunchViewController addChildViewController:self->_shockwaveViewController];
    v27 = [(SUIAShockwaveViewController *)self->_shockwaveViewController view];
    id v28 = [(SBCaptureButtonDropletLaunchViewController *)self->_dropletLaunchViewController view];
    [v28 bounds];
    objc_msgSend(v27, "setFrame:");

    id v29 = [(SUIAShockwaveViewController *)self->_shockwaveViewController view];
    [v29 setAutoresizingMask:18];

    v30 = [(SBCaptureButtonDropletLaunchViewController *)self->_dropletLaunchViewController view];
    v31 = [(SUIAShockwaveViewController *)self->_shockwaveViewController view];
    [v30 insertSubview:v31 atIndex:0];

    v32 = [(SBCaptureButtonDropletLaunchViewController *)self->_dropletLaunchViewController view];
    v33 = [v32 layer];
    [v33 setDisableUpdateMask:2];

    [(SUIAShockwaveViewController *)self->_shockwaveViewController didMoveToParentViewController:self->_dropletLaunchViewController];
    [(SBFSecureTouchPassThroughWindow *)self->_dropletLaunchWindow setHidden:0];
    [(SBHardwareButtonBezelEffectsCoordinator *)self _beginRequiringBacklightAssertionForReason:@"Hardware Button Bezel Effects Coordinator - Droplet Launch"];
    v34 = SBLogCameraCaptureLaunchAnimation();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v34, OS_LOG_TYPE_DEFAULT, "Bezel Effects Window: Visible", buf, 2u);
    }
  }
  else
  {
    if (!dropletLaunchWindow) {
      return;
    }
    [(SBFSecureTouchPassThroughWindow *)dropletLaunchWindow setHidden:1];
    [(SBFSecureTouchPassThroughWindow *)self->_dropletLaunchWindow setRootViewController:0];
    v35 = self->_dropletLaunchViewController;
    self->_dropletLaunchViewController = 0;

    v36 = self->_shockwaveViewController;
    self->_shockwaveViewController = 0;

    v37 = self->_dropletLaunchWindow;
    self->_dropletLaunchWindow = 0;

    [(SBHardwareButtonBezelEffectsCoordinator *)self _endRequiringBacklightAssertionForReason:@"Hardware Button Bezel Effects Coordinator - Droplet Launch"];
    v24 = SBLogCameraCaptureLaunchAnimation();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v38 = 0;
      _os_log_impl(&dword_1D85BA000, v24, OS_LOG_TYPE_DEFAULT, "Bezel Effects Window: Hidden", v38, 2u);
    }
  }
}

- (void)_updateLaunchAnimationWindowLevelIfNecessary
{
  double v3 = *MEMORY[0x1E4F43CF8] + 15.0 + 1.0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_animatingLaunchCompletionToken);
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained requestedDropletWindowLevel];
    double v6 = v5;
    if (!BSFloatEqualToFloat()) {
      double v3 = v6;
    }
  }
  [(SBFSecureTouchPassThroughWindow *)self->_dropletLaunchWindow setWindowLevel:v3];
}

- (void)_setShockwaveState:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  if (!self->_animatingShockwave && a3 != 4 && self->_animatingShockwaveCancellation) {
    [(SUIAShockwaveViewController *)self->_shockwaveViewController setState:0 animated:0 recommendedNextAction:0 completion:0];
  }
  id v7 = (void *)(self->_shockwaveAnimationRevisionID + 1);
  self->_shockwaveAnimationRevisionID = (unint64_t)v7;
  self->_animatingShockwave = 1;
  self->_animatingShockwaveCancellation = 0;
  objc_initWeak(&location, self);
  shockwaveViewController = self->_shockwaveViewController;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  _DWORD v10[2] = __73__SBHardwareButtonBezelEffectsCoordinator__setShockwaveState_completion___block_invoke;
  v10[3] = &unk_1E6AFEAE8;
  objc_copyWeak(v12, &location);
  v12[1] = v7;
  id v9 = v6;
  id v11 = v9;
  [(SUIAShockwaveViewController *)shockwaveViewController setState:a3 animated:1 recommendedNextAction:0 completion:v10];

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

void __73__SBHardwareButtonBezelEffectsCoordinator__setShockwaveState_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = WeakRetained;
  if (WeakRetained && *((void *)WeakRetained + 11) == *(void *)(a1 + 48)) {
    *((unsigned char *)WeakRetained + 80) = 0;
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8)
  {
    id v9 = v7;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v8, a2, a3);
    id v7 = v9;
  }
}

- (void)_setHintDropletWindowVisible:(BOOL)a3
{
  hintDropletWindow = self->_hintDropletWindow;
  if (!a3)
  {
    if (!hintDropletWindow) {
      return;
    }
    [(SBFSecureTouchPassThroughWindow *)hintDropletWindow setHidden:1];
    [(SBFSecureTouchPassThroughWindow *)self->_hintDropletWindow setRootViewController:0];
    hintDropletViewController = self->_hintDropletViewController;
    self->_hintDropletViewController = 0;

    double v13 = self->_hintDropletWindow;
    self->_hintDropletWindow = 0;

    [(SBHardwareButtonBezelEffectsCoordinator *)self _endRequiringBacklightAssertionForReason:@"Hardware Button Bezel Effects Coordinator Hinting"];
    id v9 = SBLogButtonHintingUI();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    __int16 v14 = 0;
    double v10 = "Bezel Effects Hint Droplet Window: Hidden";
    id v11 = (uint8_t *)&v14;
    goto LABEL_9;
  }
  if (!hintDropletWindow && [(SBHardwareButtonBezelEffectsCoordinator *)self hintDropletsEnabled])
  {
    double v5 = (SBHardwareButtonHintDropletViewController *)objc_opt_new();
    id v6 = self->_hintDropletViewController;
    self->_hintDropletViewController = v5;

    [(SBHardwareButtonHintDropletViewController *)self->_hintDropletViewController setDelegate:self];
    id v7 = (SBFSecureTouchPassThroughWindow *)[objc_alloc(MEMORY[0x1E4FA5FD8]) initWithWindowScene:self->_windowScene role:@"SBTraitsParticipantRoleHardwareButtonBezelEffectsCoordinatorHinting" debugName:@"Hardware Button Bezel Effects Coordinator Hinting"];
    uint64_t v8 = self->_hintDropletWindow;
    self->_hintDropletWindow = v7;

    [(SBFSecureTouchPassThroughWindow *)self->_hintDropletWindow setWindowLevel:10000000.5];
    [(SBFSecureTouchPassThroughWindow *)self->_hintDropletWindow setRootViewController:self->_hintDropletViewController];
    [(SBFSecureTouchPassThroughWindow *)self->_hintDropletWindow setHidden:0];
    [(SBHardwareButtonBezelEffectsCoordinator *)self _reevaluateSystemGlowEffect];
    [(SBHardwareButtonBezelEffectsCoordinator *)self _beginRequiringBacklightAssertionForReason:@"Hardware Button Bezel Effects Coordinator Hinting"];
    id v9 = SBLogButtonHintingUI();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
LABEL_10:

      return;
    }
    __int16 v15 = 0;
    double v10 = "Bezel Effects Hint Droplet Window: Visible";
    id v11 = (uint8_t *)&v15;
LABEL_9:
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
    goto LABEL_10;
  }
}

- (BOOL)hintDropletsEnabled
{
  double v2 = +[SBPlatformController sharedInstance];
  if ([v2 deviceSupportsHWButtonBezelEffects])
  {
    char v3 = 1;
  }
  else
  {
    BOOL v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    char v3 = [v4 BOOLForKey:@"SBHardwareButtonHintDropletsEnabled"];
  }
  return v3;
}

- (id)_policyAggregator
{
  double v2 = [(SBWindowScene *)self->_windowScene sceneManager];
  char v3 = [v2 policyAggregator];

  return v3;
}

- (void)_beginRequiringBacklightAssertionForReason:(id)a3
{
  v15[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    __int16 v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SBHardwareButtonBezelEffectsCoordinator.m", 548, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];
  }
  [(NSCountedSet *)self->_backlightAssertionRequiringReasons addObject:v5];
  if (!self->_liveUpdatingAssertion && self->_windowScene)
  {
    id v6 = [NSString stringWithFormat:@"Animating Bezel Effects, assertion first required for <%@>:", v5];
    id v7 = (void *)MEMORY[0x1E4F4F4C0];
    uint64_t v8 = [MEMORY[0x1E4F4F528] requestLiveUpdatingForScene:self->_windowScene];
    v15[0] = v8;
    id v9 = [MEMORY[0x1E4F4F530] requestUnrestrictedFramerateForScene:self->_windowScene];
    v15[1] = v9;
    double v10 = [MEMORY[0x1E4F4F540] ignoreWhenBacklightInactivates];
    v15[2] = v10;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3];
    double v12 = [v7 acquireWithExplanation:v6 observer:0 attributes:v11];
    liveUpdatingAssertion = self->_liveUpdatingAssertion;
    self->_liveUpdatingAssertion = v12;
  }
}

- (void)_endRequiringBacklightAssertionForReason:(id)a3
{
  id v5 = a3;
  id v9 = v5;
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SBHardwareButtonBezelEffectsCoordinator.m", 564, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];

    id v5 = 0;
  }
  [(NSCountedSet *)self->_backlightAssertionRequiringReasons removeObject:v5];
  id v6 = [(NSCountedSet *)self->_backlightAssertionRequiringReasons anyObject];

  if (!v6)
  {
    [(BSInvalidatable *)self->_liveUpdatingAssertion invalidate];
    liveUpdatingAssertion = self->_liveUpdatingAssertion;
    self->_liveUpdatingAssertion = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemGlowEffectAssertion, 0);
  objc_storeStrong((id *)&self->_hintDropletViewController, 0);
  objc_storeStrong((id *)&self->_hintDropletWindow, 0);
  objc_storeStrong((id *)&self->_liveUpdatingAssertion, 0);
  objc_storeStrong((id *)&self->_backlightAssertionRequiringReasons, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_shockwaveViewController, 0);
  objc_storeStrong((id *)&self->_dropletLaunchViewController, 0);
  objc_storeStrong((id *)&self->_dropletLaunchWindow, 0);
  objc_storeStrong((id *)&self->_portalObservationTokens, 0);
  objc_destroyWeak((id *)&self->_animatingLaunchCompletionToken);
  objc_destroyWeak((id *)&self->_animatingPreludeToken);
  objc_storeStrong((id *)&self->_windowScene, 0);
}

- (void)commandeerDropletAnimationWithToken:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = NSStringFromSelector(a1);
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  id v9 = v5;
  __int16 v10 = 2114;
  id v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  __int16 v15 = @"SBHardwareButtonBezelEffectsCoordinator.m";
  __int16 v16 = 1024;
  int v17 = 226;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

- (void)updateHintContentVisibility:(os_log_t)log forButton:animationSettings:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "Got an attempt to update hint content appearance state with no actual hint UI active", v1, 2u);
}

@end