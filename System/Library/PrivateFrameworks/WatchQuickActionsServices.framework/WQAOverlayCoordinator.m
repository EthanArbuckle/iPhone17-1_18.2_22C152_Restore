@interface WQAOverlayCoordinator
- (BOOL)_astFocusRingIsVisible;
- (BOOL)_shouldShowHintsForQuickActions:(id)a3;
- (BOOL)hasNoActivationGesture;
- (BOOL)inputSourcesRequireFocusRing;
- (BOOL)receivedActivationGesture;
- (NSArray)currentShapeLayersForHint;
- (NSMutableArray)quickActionShapeLayers;
- (WQAOverlayCoordinator)initWithDataSource:(id)a3;
- (WQAOverlayDataSource)dataSource;
- (id)_createNonAnimatingShapeLayerFromPath:(id)a3;
- (id)_localizedBannerInstructionText;
- (void)_mainQueue_addAnimatedShapeLayerForQuickAction:(id)a3;
- (void)_mainQueue_backlightDidTurnOff;
- (void)_mainQueue_backlightDidTurnOn;
- (void)_mainQueue_cleanupHintViews;
- (void)_mainQueue_cleanupShapeLayers;
- (void)_mainQueue_removeShapeLayer:(id)a3;
- (void)_mainQueue_showHintsWithPrimaryQuickActions:(id)a3 completion:(id)a4;
- (void)_mainQueue_showUIForQuickActions:(id)a3;
- (void)_updateGestureSettings;
- (void)animateConfirmationForQuickAction:(id)a3 completion:(id)a4;
- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvent:(id)a5;
- (void)dealloc;
- (void)refreshOverlaysIfNecessary;
- (void)setCurrentShapeLayersForHint:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setHasNoActivationGesture:(BOOL)a3;
- (void)setInputSourcesRequireFocusRing:(BOOL)a3;
- (void)setQuickActionShapeLayers:(id)a3;
- (void)setReceivedActivationGesture:(BOOL)a3;
- (void)stopCurrentOverlays;
@end

@implementation WQAOverlayCoordinator

- (WQAOverlayCoordinator)initWithDataSource:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)WQAOverlayCoordinator;
  v5 = [(WQAOverlayCoordinator *)&v22 init];
  v6 = v5;
  if (v5)
  {
    [(WQAOverlayCoordinator *)v5 setDataSource:v4];
    v7 = [MEMORY[0x263EFF980] array];
    [(WQAOverlayCoordinator *)v6 setQuickActionShapeLayers:v7];

    v8 = [MEMORY[0x263F29970] sharedBacklight];
    [v8 addObserver:v6];

    v9 = [MEMORY[0x263F29970] sharedBacklight];
    unint64_t v10 = [v9 backlightState] & 0xFFFFFFFFFFFFFFFELL;

    if (v10 == 2) {
      [(WQAOverlayCoordinator *)v6 refreshOverlaysIfNecessary];
    }
    [(WQAOverlayCoordinator *)v6 _updateGestureSettings];
    if (WatchControlSettingsLibraryCore())
    {
      v11 = [getWatchControlSettingsClass() sharedInstance];
      [v11 addSettingsObserver:v6];

      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      uint64_t v28 = 0;
      v29 = &v28;
      uint64_t v30 = 0x2020000000;
      v13 = (id *)getkWatchControlReceivedActivationGestureDidChangeSymbolLoc_ptr;
      uint64_t v31 = getkWatchControlReceivedActivationGestureDidChangeSymbolLoc_ptr;
      if (!getkWatchControlReceivedActivationGestureDidChangeSymbolLoc_ptr)
      {
        uint64_t v23 = MEMORY[0x263EF8330];
        uint64_t v24 = 3221225472;
        v25 = __getkWatchControlReceivedActivationGestureDidChangeSymbolLoc_block_invoke;
        v26 = &unk_264DB8298;
        v27 = &v28;
        v14 = (void *)WatchControlSettingsLibrary();
        v15 = dlsym(v14, "kWatchControlReceivedActivationGestureDidChange");
        *(void *)(v27[1] + 24) = v15;
        getkWatchControlReceivedActivationGestureDidChangeSymbolLoc_ptr = *(void *)(v27[1] + 24);
        v13 = (id *)v29[3];
      }
      _Block_object_dispose(&v28, 8);
      if (v13)
      {
        CFNotificationCenterAddObserver(DarwinNotifyCenter, v6, (CFNotificationCallback)updateGestureSettings, (CFStringRef)*v13, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
        v16 = CFNotificationCenterGetDarwinNotifyCenter();
        uint64_t v28 = 0;
        v29 = &v28;
        uint64_t v30 = 0x2020000000;
        v17 = (id *)getkWatchControlInputSourcesRequireFocusRingDidChangeSymbolLoc_ptr;
        uint64_t v31 = getkWatchControlInputSourcesRequireFocusRingDidChangeSymbolLoc_ptr;
        if (!getkWatchControlInputSourcesRequireFocusRingDidChangeSymbolLoc_ptr)
        {
          uint64_t v23 = MEMORY[0x263EF8330];
          uint64_t v24 = 3221225472;
          v25 = __getkWatchControlInputSourcesRequireFocusRingDidChangeSymbolLoc_block_invoke;
          v26 = &unk_264DB8298;
          v27 = &v28;
          v18 = (void *)WatchControlSettingsLibrary();
          v19 = dlsym(v18, "kWatchControlInputSourcesRequireFocusRingDidChange");
          *(void *)(v27[1] + 24) = v19;
          getkWatchControlInputSourcesRequireFocusRingDidChangeSymbolLoc_ptr = *(void *)(v27[1] + 24);
          v17 = (id *)v29[3];
        }
        _Block_object_dispose(&v28, 8);
        if (v17)
        {
          CFNotificationCenterAddObserver(v16, v6, (CFNotificationCallback)updateGestureSettings, (CFStringRef)*v17, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
          goto LABEL_12;
        }
      }
      else
      {
        -[WQAOverlayCoordinator initWithDataSource:]();
      }
      v21 = (_Unwind_Exception *)-[WQAOverlayCoordinator initWithDataSource:]();
      _Block_object_dispose(&v28, 8);
      _Unwind_Resume(v21);
    }
  }
LABEL_12:

  return v6;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  id v4 = [MEMORY[0x263F29970] sharedBacklight];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)WQAOverlayCoordinator;
  [(WQAOverlayCoordinator *)&v5 dealloc];
}

- (void)animateConfirmationForQuickAction:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__WQAOverlayCoordinator_animateConfirmationForQuickAction_completion___block_invoke;
  block[3] = &unk_264DB80D8;
  id v11 = v6;
  id v12 = v7;
  block[4] = self;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __70__WQAOverlayCoordinator_animateConfirmationForQuickAction_completion___block_invoke(id *a1)
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  objc_msgSend(a1[4], "_mainQueue_cleanupShapeLayers");
  v55[0] = MEMORY[0x263EF8330];
  v55[1] = 3221225472;
  v55[2] = __70__WQAOverlayCoordinator_animateConfirmationForQuickAction_completion___block_invoke_2;
  v55[3] = &unk_264DB7FE8;
  id v2 = a1[6];
  v55[4] = a1[4];
  id v56 = v2;
  v3 = (void *)MEMORY[0x23ECAB890](v55);
  id v4 = [a1[5] animationHandler];
  objc_super v5 = wqa_overlay_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      id v7 = a1[5];
      *(_DWORD *)buf = 138412546;
      v58 = v4;
      __int16 v59 = 2112;
      id v60 = v7;
      _os_log_impl(&dword_239BF6000, v5, OS_LOG_TYPE_INFO, "custom animation handler: %@ will handle confirmation for quick action: %@", buf, 0x16u);
    }

    [v4 quickActionWillActivate:a1[5]];
    AXPerformBlockOnMainThreadAfterDelay();
  }
  else
  {
    if (v6)
    {
      id v8 = a1[5];
      *(_DWORD *)buf = 138412290;
      v58 = v8;
      _os_log_impl(&dword_239BF6000, v5, OS_LOG_TYPE_INFO, "animating confirmation for quick action: %@", buf, 0xCu);
    }

    id v9 = [a1[5] quickActionHostingView];
    unint64_t v10 = [a1[5] quickActionPrimaryView];
    uint64_t v11 = [a1[5] quickActionPath];
    id v12 = (void *)v11;
    if (v9 && v10 && v11)
    {
      if ([a1[5] allowsResizingAnimations])
      {
        v13 = [a1[4] _createNonAnimatingShapeLayerFromPath:v12];
        v14 = [v9 layer];
        [v14 addSublayer:v13];

        v15 = (void *)MEMORY[0x263F1CB60];
        v51[0] = MEMORY[0x263EF8330];
        v51[1] = 3221225472;
        v51[2] = __70__WQAOverlayCoordinator_animateConfirmationForQuickAction_completion___block_invoke_270;
        v51[3] = &unk_264DB8010;
        id v52 = v10;
        id v53 = v9;
        id v54 = v13;
        v47[0] = MEMORY[0x263EF8330];
        v47[1] = 3221225472;
        v47[2] = __70__WQAOverlayCoordinator_animateConfirmationForQuickAction_completion___block_invoke_2_271;
        v47[3] = &unk_264DB8088;
        id v48 = v52;
        id v49 = v54;
        id v50 = v3;
        id v16 = v54;
        [v15 animateWithDuration:v51 animations:v47 completion:0.3];
      }
      else
      {
        v17 = [v9 parentFocusEnvironment];
        v18 = [v17 focusItemContainer];
        v19 = [v18 coordinateSpace];

        [v9 frame];
        double v21 = v20;
        double v23 = v22;
        double v25 = v24;
        double v27 = v26;
        uint64_t v28 = [v9 coordinateSpace];
        objc_msgSend(v19, "convertRect:toCoordinateSpace:", v28, v21, v23, v25, v27);
        double v30 = v29;
        double v32 = v31;
        double v34 = v33;
        double v36 = v35;

        v37 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", v30, v32, v34, v36);
        v38 = WQADefaultTintColor();
        [v37 setBackgroundColor:v38];

        v39 = [MEMORY[0x263F15880] layer];
        objc_msgSend(v39, "setFrame:", v30, v32, v34, v36);
        [v39 setFillRule:*MEMORY[0x263F15AC8]];
        Mutable = CGPathCreateMutable();
        CGPathAddPath(Mutable, 0, (CGPathRef)[v12 CGPath]);
        [v39 setPath:Mutable];
        v41 = [v37 layer];
        [v41 setMask:v39];

        [v9 addSubview:v37];
        v42 = (void *)MEMORY[0x263F1CB60];
        v44[0] = MEMORY[0x263EF8330];
        v44[1] = 3221225472;
        v44[2] = __70__WQAOverlayCoordinator_animateConfirmationForQuickAction_completion___block_invoke_5;
        v44[3] = &unk_264DB80B0;
        id v45 = v37;
        id v46 = v3;
        id v43 = v37;
        [v42 _animateUsingDefaultDampedSpringWithDelay:0 initialSpringVelocity:v44 options:0 animations:0.0 completion:0.0];
      }
    }
    else
    {
      AXPerformBlockAsynchronouslyOnMainThread();
    }
  }
}

uint64_t __70__WQAOverlayCoordinator_animateConfirmationForQuickAction_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1) {
    (*(void (**)(uint64_t, uint64_t))(v1 + 16))(v1, 1);
  }
  return AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __70__WQAOverlayCoordinator_animateConfirmationForQuickAction_completion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) refreshOverlaysIfNecessary];
}

uint64_t __70__WQAOverlayCoordinator_animateConfirmationForQuickAction_completion___block_invoke_270(uint64_t a1)
{
  memset(&v5, 0, sizeof(v5));
  CGAffineTransformMakeScale(&v5, 0.9, 0.9);
  CGAffineTransform v4 = v5;
  uint64_t result = [*(id *)(a1 + 32) setTransform:&v4];
  if (*(void *)(a1 + 32) != *(void *)(a1 + 40))
  {
    CGAffineTransform v3 = v5;
    return [*(id *)(a1 + 48) setAffineTransform:&v3];
  }
  return result;
}

void __70__WQAOverlayCoordinator_animateConfirmationForQuickAction_completion___block_invoke_2_271(id *a1)
{
  id v2 = (void *)MEMORY[0x263F1CB60];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__WQAOverlayCoordinator_animateConfirmationForQuickAction_completion___block_invoke_3_272;
  v6[3] = &unk_264DB8038;
  id v7 = a1[4];
  id v8 = a1[5];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __70__WQAOverlayCoordinator_animateConfirmationForQuickAction_completion___block_invoke_4;
  v3[3] = &unk_264DB8060;
  id v5 = a1[6];
  id v4 = a1[5];
  [v2 animateWithDuration:v6 animations:v3 completion:0.3];
}

uint64_t __70__WQAOverlayCoordinator_animateConfirmationForQuickAction_completion___block_invoke_3_272(uint64_t a1)
{
  CGAffineTransformMakeScale(&v8, 1.0, 1.0);
  id v2 = *(void **)(a1 + 32);
  CGAffineTransform v7 = v8;
  [v2 setTransform:&v7];
  CGAffineTransformMakeScale(&v6, 1.2, 1.2);
  CGAffineTransform v3 = *(void **)(a1 + 40);
  CGAffineTransform v5 = v6;
  [v3 setAffineTransform:&v5];
  return [*(id *)(a1 + 40) setOpacity:0.0];
}

uint64_t __70__WQAOverlayCoordinator_animateConfirmationForQuickAction_completion___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = *(void **)(a1 + 32);

  return [v2 removeFromSuperlayer];
}

void __70__WQAOverlayCoordinator_animateConfirmationForQuickAction_completion___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.7];
  id v2 = (void *)MEMORY[0x263F1CB60];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__WQAOverlayCoordinator_animateConfirmationForQuickAction_completion___block_invoke_6;
  v6[3] = &unk_264DB7FC0;
  id v7 = *(id *)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __70__WQAOverlayCoordinator_animateConfirmationForQuickAction_completion___block_invoke_7;
  v3[3] = &unk_264DB8060;
  id v5 = *(id *)(a1 + 40);
  id v4 = *(id *)(a1 + 32);
  [v2 _animateUsingDefaultDampedSpringWithDelay:0 initialSpringVelocity:v6 options:v3 animations:0.3 completion:0.0];
}

uint64_t __70__WQAOverlayCoordinator_animateConfirmationForQuickAction_completion___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __70__WQAOverlayCoordinator_animateConfirmationForQuickAction_completion___block_invoke_7(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = *(void **)(a1 + 32);

  return [v2 removeFromSuperview];
}

- (void)stopCurrentOverlays
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__WQAOverlayCoordinator_stopCurrentOverlays__block_invoke;
  block[3] = &unk_264DB7FC0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __44__WQAOverlayCoordinator_stopCurrentOverlays__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_cleanupShapeLayers");
}

- (void)_updateGestureSettings
{
  if (WatchControlSettingsLibraryCore())
  {
    CGAffineTransform v3 = [getWatchControlSettingsClass() sharedInstance];
    -[WQAOverlayCoordinator setReceivedActivationGesture:](self, "setReceivedActivationGesture:", [v3 receivedActivationGesture]);
    -[WQAOverlayCoordinator setInputSourcesRequireFocusRing:](self, "setInputSourcesRequireFocusRing:", [v3 inputSourcesRequireFocusRing]);
    uint64_t v4 = [v3 greyActivationGesture];
    uint64_t v8 = 0;
    id v9 = &v8;
    uint64_t v10 = 0x2020000000;
    id v5 = (void *)getWCGreyEventNoneSymbolLoc_ptr;
    uint64_t v11 = getWCGreyEventNoneSymbolLoc_ptr;
    if (!getWCGreyEventNoneSymbolLoc_ptr)
    {
      CGAffineTransform v6 = (void *)WatchControlSettingsLibrary();
      v9[3] = (uint64_t)dlsym(v6, "WCGreyEventNone");
      getWCGreyEventNoneSymbolLoc_ptr = v9[3];
      id v5 = (void *)v9[3];
    }
    _Block_object_dispose(&v8, 8);
    if (!v5)
    {
      id v7 = (_Unwind_Exception *)-[WQAOverlayCoordinator initWithDataSource:]();
      _Block_object_dispose(&v8, 8);
      _Unwind_Resume(v7);
    }
    [(WQAOverlayCoordinator *)self setHasNoActivationGesture:v4 == *v5];
  }
}

- (BOOL)_astFocusRingIsVisible
{
  int v2 = _AXSWatchControlEnabled();
  if (v2) {
    LOBYTE(v2) = _AXSFullKeyboardAccessFocusRingEnabled() != 0;
  }
  return v2;
}

- (void)refreshOverlaysIfNecessary
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  CGAffineTransform v3 = [MEMORY[0x263F29970] sharedBacklight];
  unint64_t v4 = [v3 backlightState];

  if (v4 <= 1)
  {
    id v5 = wqa_overlay_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_239BF6000, v5, OS_LOG_TYPE_INFO, "backlight is off, skipping refresh", buf, 2u);
    }

    return;
  }
  if ([(WQAOverlayCoordinator *)self _astFocusRingIsVisible])
  {
    CGAffineTransform v6 = wqa_overlay_log();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      [(WQAOverlayCoordinator *)self stopCurrentOverlays];
      return;
    }
    *(_WORD *)buf = 0;
    id v7 = "AST focus ring is visible, hide all overlays";
LABEL_8:
    _os_log_impl(&dword_239BF6000, v6, OS_LOG_TYPE_INFO, v7, buf, 2u);
    goto LABEL_9;
  }
  if (_AXSWatchControlEnabled()
    && [(WQAOverlayCoordinator *)self inputSourcesRequireFocusRing])
  {
    if ([(WQAOverlayCoordinator *)self hasNoActivationGesture])
    {
      CGAffineTransform v6 = wqa_overlay_log();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
        goto LABEL_9;
      }
      *(_WORD *)buf = 0;
      id v7 = "activation gesture set to none, hide all overlays";
      goto LABEL_8;
    }
    if ([(WQAOverlayCoordinator *)self receivedActivationGesture])
    {
      CGAffineTransform v6 = wqa_overlay_log();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
        goto LABEL_9;
      }
      *(_WORD *)buf = 0;
      id v7 = "already received activation gesture, hide all overlays";
      goto LABEL_8;
    }
  }
  uint64_t v8 = [(WQAOverlayCoordinator *)self dataSource];
  id v9 = [v8 quickActionsForOverlayCoordinator:self];

  if ([v9 count])
  {
    uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          v17 = [v16 identifier];
          [v10 setObject:v16 forKeyedSubscript:v17];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v13);
    }

    id v18 = v10;
    AXPerformBlockOnMainThread();
  }
  else
  {
    v19 = wqa_overlay_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_239BF6000, v19, OS_LOG_TYPE_INFO, "no more quick actions, cleaning up overlays", buf, 2u);
    }

    [(WQAOverlayCoordinator *)self stopCurrentOverlays];
  }
}

void __51__WQAOverlayCoordinator_refreshOverlaysIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  int v2 = [MEMORY[0x263F089C8] indexSet];
  CGAffineTransform v3 = [*(id *)(a1 + 32) quickActionShapeLayers];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    unint64_t v5 = 0;
    do
    {
      CGAffineTransform v6 = [*(id *)(a1 + 32) quickActionShapeLayers];
      id v7 = [v6 objectAtIndexedSubscript:v5];

      uint64_t v8 = [v7 superlayer];

      if (v8)
      {
        id v9 = *(void **)(a1 + 40);
        uint64_t v10 = [v7 quickActionIdentifier];
        id v11 = [v9 objectForKeyedSubscript:v10];

        if (v11 && (uint64_t v12 = [v11 currentVisualsToken], v12 == objc_msgSend(v7, "quickActionVisualsToken")))
        {
          uint64_t v13 = *(void **)(a1 + 40);
          uint64_t v14 = [v7 quickActionIdentifier];
          [v13 removeObjectForKey:v14];
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "_mainQueue_removeShapeLayer:", v7);
          [v2 addIndex:v5];
        }
      }
      else
      {
        [v2 addIndex:v5];
      }

      ++v5;
      v15 = [*(id *)(a1 + 32) quickActionShapeLayers];
      unint64_t v16 = [v15 count];
    }
    while (v5 < v16);
  }
  if ([v2 count])
  {
    v17 = wqa_overlay_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v21 = 138412290;
      long long v22 = v2;
      _os_log_impl(&dword_239BF6000, v17, OS_LOG_TYPE_INFO, "removing shape layers at indeces: %@", (uint8_t *)&v21, 0xCu);
    }

    id v18 = [*(id *)(a1 + 32) quickActionShapeLayers];
    [v18 removeObjectsAtIndexes:v2];
  }
  v19 = *(void **)(a1 + 32);
  long long v20 = [*(id *)(a1 + 40) allValues];
  objc_msgSend(v19, "_mainQueue_showUIForQuickActions:", v20);
}

- (void)_mainQueue_removeShapeLayer:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  uint64_t v4 = wqa_overlay_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_239BF6000, v4, OS_LOG_TYPE_INFO, "removing shape layer: %@", (uint8_t *)&v5, 0xCu);
  }

  [v3 removeFromSuperlayer];
}

- (void)_mainQueue_addAnimatedShapeLayerForQuickAction:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  int v5 = [v4 animationHandler];
  if (v5)
  {
    id v6 = wqa_overlay_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v23 = 138412546;
      id v24 = v5;
      __int16 v25 = 2112;
      id v26 = v4;
      _os_log_impl(&dword_239BF6000, v6, OS_LOG_TYPE_INFO, "animation handler: %@ will handle pulse for quick action: %@", (uint8_t *)&v23, 0x16u);
    }

    [v5 quickActionWillPulse:v4];
  }
  else
  {
    uint64_t v7 = [v4 quickActionHostingView];
    uint64_t v8 = [v4 quickActionPath];
    id v9 = (void *)v8;
    if (v7 && v8)
    {
      uint64_t v10 = wqa_overlay_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v23 = 138412290;
        id v24 = v4;
        _os_log_impl(&dword_239BF6000, v10, OS_LOG_TYPE_INFO, "adding shape layer for quick action: %@", (uint8_t *)&v23, 0xCu);
      }

      id v11 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
      [v11 setFromValue:&unk_26ED2EBE0];
      [v11 setToValue:&unk_26ED2EBF0];
      [v11 setAutoreverses:1];
      [v11 setDuration:1.5];
      LODWORD(v12) = 2139095039;
      [v11 setRepeatCount:v12];
      uint64_t v13 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
      [v11 setTimingFunction:v13];

      LODWORD(v14) = 2139095040;
      [v11 setRepeatCount:v14];
      v15 = +[WQAShapeLayer layer];
      unint64_t v16 = [v4 identifier];
      [v15 setQuickActionIdentifier:v16];

      objc_msgSend(v15, "setQuickActionVisualsToken:", objc_msgSend(v4, "currentVisualsToken"));
      [v15 setOpacity:0.0];
      id v17 = v9;
      objc_msgSend(v15, "setPath:", objc_msgSend(v17, "CGPath"));
      [v17 bounds];
      objc_msgSend(v15, "setBounds:");
      [v17 bounds];
      double MidX = CGRectGetMidX(v28);
      [v17 bounds];
      objc_msgSend(v15, "setPosition:", MidX, CGRectGetMidY(v29));
      WQADefaultTintColor();
      id v19 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setStrokeColor:", objc_msgSend(v19, "CGColor"));

      [v15 setLineWidth:WQADefaultShapeLineWidth()];
      id v20 = [MEMORY[0x263F1C550] clearColor];
      objc_msgSend(v15, "setFillColor:", objc_msgSend(v20, "CGColor"));

      int v21 = [v7 layer];
      [v21 addSublayer:v15];

      [v15 addAnimation:v11 forKey:@"animations"];
      long long v22 = [(WQAOverlayCoordinator *)self quickActionShapeLayers];
      [v22 addObject:v15];
    }
  }
}

- (id)_createNonAnimatingShapeLayerFromPath:(id)a3
{
  id v3 = (void *)MEMORY[0x263F15880];
  id v4 = a3;
  int v5 = [v3 layer];
  id v6 = v4;
  objc_msgSend(v5, "setPath:", objc_msgSend(v6, "CGPath"));
  [v6 bounds];
  objc_msgSend(v5, "setBounds:");
  [v6 bounds];
  double MidX = CGRectGetMidX(v20);
  [v6 bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  v21.origin.x = v9;
  v21.origin.y = v11;
  v21.size.width = v13;
  v21.size.height = v15;
  objc_msgSend(v5, "setPosition:", MidX, CGRectGetMidY(v21));
  WQADefaultTintColor();
  id v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStrokeColor:", objc_msgSend(v16, "CGColor"));

  [v5 setLineWidth:WQADefaultShapeLineWidth()];
  id v17 = [MEMORY[0x263F1C550] clearColor];
  objc_msgSend(v5, "setFillColor:", objc_msgSend(v17, "CGColor"));

  return v5;
}

- (BOOL)_shouldShowHintsForQuickActions:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [MEMORY[0x263F1C408] sharedApplication];
  uint64_t v6 = [v5 applicationState];

  if (v6)
  {
    uint64_t v7 = wqa_overlay_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_239BF6000, v7, OS_LOG_TYPE_INFO, "will not show quick action banner because UIApp is not active", buf, 2u);
    }

    BOOL v8 = 0;
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = v4;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
LABEL_7:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = *(void **)(*((void *)&v17 + 1) + 8 * v13);
        if (objc_msgSend(v14, "canShowOverlays", (void)v17)) {
          break;
        }
        CGFloat v15 = [v14 animationHandler];

        if (v15) {
          break;
        }
        if (v11 == ++v13)
        {
          uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
          if (v11) {
            goto LABEL_7;
          }
          goto LABEL_14;
        }
      }

      if ([(WQAOverlayCoordinator *)self _astFocusRingIsVisible]) {
        goto LABEL_16;
      }
      BOOL v8 = _AXSWatchQuickActionBannerAppearance() == 0;
    }
    else
    {
LABEL_14:

LABEL_16:
      BOOL v8 = 1;
    }
  }

  return v8;
}

- (void)_mainQueue_showUIForQuickActions:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend(a3, "ax_filteredArrayUsingBlock:", &__block_literal_global_0);
  if ([v4 count])
  {
    int v5 = [(WQAOverlayCoordinator *)self currentShapeLayersForHint];

    if (!v5)
    {
      uint64_t v6 = wqa_overlay_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        double v14 = v4;
        _os_log_impl(&dword_239BF6000, v6, OS_LOG_TYPE_INFO, "showing UI for quick actions: %@", buf, 0xCu);
      }

      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __58__WQAOverlayCoordinator__mainQueue_showUIForQuickActions___block_invoke_291;
      v11[3] = &unk_264DB8038;
      v11[4] = self;
      id v7 = v4;
      id v12 = v7;
      BOOL v8 = (void *)MEMORY[0x23ECAB890](v11);
      id v10 = v7;
      id v9 = v8;
      AXPerformBlockOnMainThreadAfterDelay();
    }
  }
}

BOOL __58__WQAOverlayCoordinator__mainQueue_showUIForQuickActions___block_invoke(uint64_t a1, void *a2)
{
  return [a2 quickActionType] == 1;
}

void __58__WQAOverlayCoordinator__mainQueue_showUIForQuickActions___block_invoke_291(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (([*(id *)(a1 + 32) _astFocusRingIsVisible] & 1) == 0)
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    id v2 = *(id *)(a1 + 40);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v8;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v8 != v5) {
            objc_enumerationMutation(v2);
          }
          objc_msgSend(*(id *)(a1 + 32), "_mainQueue_addAnimatedShapeLayerForQuickAction:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), (void)v7);
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      }
      while (v4);
    }
  }
}

void __58__WQAOverlayCoordinator__mainQueue_showUIForQuickActions___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _shouldShowHintsForQuickActions:*(void *)(a1 + 40)])
  {
    id v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __58__WQAOverlayCoordinator__mainQueue_showUIForQuickActions___block_invoke_3;
    v5[3] = &unk_264DB8120;
    id v6 = *(id *)(a1 + 48);
    objc_msgSend(v2, "_mainQueue_showHintsWithPrimaryQuickActions:completion:", v3, v5);
  }
  else
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v4();
  }
}

uint64_t __58__WQAOverlayCoordinator__mainQueue_showUIForQuickActions___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_localizedBannerInstructionText
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__WQAOverlayCoordinator__localizedBannerInstructionText__block_invoke;
  block[3] = &unk_264DB7FC0;
  block[4] = self;
  if (_localizedBannerInstructionText_onceToken != -1) {
    dispatch_once(&_localizedBannerInstructionText_onceToken, block);
  }
  id v2 = [(id)_localizedBannerInstructionText__Bundle localizedStringForKey:@"banner.hint" value:&stru_26ED2D298 table:@"Localizable-elton"];

  return v2;
}

uint64_t __56__WQAOverlayCoordinator__localizedBannerInstructionText__block_invoke()
{
  _localizedBannerInstructionText__Bundle = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];

  return MEMORY[0x270F9A758]();
}

- (void)_mainQueue_showHintsWithPrimaryQuickActions:(id)a3 completion:(id)a4
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v47 = self;
  long long v8 = [(WQAOverlayCoordinator *)self _localizedBannerInstructionText];
  _AXSReduceMotionEnabled();
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v57 objects:v63 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v58 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        if (!v12)
        {
          uint64_t v12 = [*(id *)(*((void *)&v57 + 1) + 8 * i) localizedTitle];
        }
        if (([v15 canShowOverlays] & 1) == 0)
        {
          [v15 animationHandler];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v57 objects:v63 count:16];
    }
    while (v11);

    if (v12)
    {
      id v43 = objc_opt_new();
      v42 = objc_opt_new();
      id v46 = objc_opt_new();
      if (![(WQAOverlayCoordinator *)v47 _astFocusRingIsVisible])
      {
        v40 = v8;
        id v41 = v7;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        id v39 = v9;
        id v16 = v9;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v53 objects:v62 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v54;
          uint64_t v44 = *(void *)v54;
          id v45 = v16;
          do
          {
            uint64_t v20 = 0;
            uint64_t v48 = v18;
            do
            {
              if (*(void *)v54 != v19) {
                objc_enumerationMutation(v16);
              }
              CGRect v21 = *(void **)(*((void *)&v53 + 1) + 8 * v20);
              long long v22 = [v21 animationHandler];
              if (v22)
              {
                uint64_t v23 = wqa_overlay_log();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                {
                  LODWORD(buf.a) = 138412546;
                  *(void *)((char *)&buf.a + 4) = v22;
                  WORD2(buf.b) = 2112;
                  *(void *)((char *)&buf.b + 6) = v21;
                  _os_log_impl(&dword_239BF6000, v23, OS_LOG_TYPE_INFO, "animation handler: %@ will handle hint for quick action: %@", (uint8_t *)&buf, 0x16u);
                }
              }
              else
              {
                uint64_t v23 = [v21 quickActionHostingView];
                id v24 = [v21 quickActionPrimaryView];
                uint64_t v25 = [v21 quickActionPath];
                id v26 = (void *)v25;
                if (v23) {
                  BOOL v27 = v24 == 0;
                }
                else {
                  BOOL v27 = 1;
                }
                if (!v27 && v25 != 0)
                {
                  CGRect v29 = [(WQAOverlayCoordinator *)v47 _createNonAnimatingShapeLayerFromPath:v25];
                  double v30 = [v23 layer];
                  [v30 addSublayer:v29];

                  [v46 addObject:v29];
                  if ([v21 allowsResizingAnimations])
                  {
                    [v43 addObject:v24];
                    if (v23 != v24) {
                      [v42 addObject:v29];
                    }
                  }

                  uint64_t v19 = v44;
                  id v16 = v45;
                }

                uint64_t v18 = v48;
              }

              ++v20;
            }
            while (v18 != v20);
            uint64_t v18 = [v16 countByEnumeratingWithState:&v53 objects:v62 count:16];
          }
          while (v18);
        }

        long long v8 = v40;
        id v7 = v41;
        id v9 = v39;
      }
      [(WQAOverlayCoordinator *)v47 setCurrentShapeLayersForHint:v46];
      int v31 = _AXSReduceMotionEnabled();
      double v32 = 0.93;
      memset(&buf.c, 0, 32);
      if (v31) {
        double v32 = 1.0;
      }
      *(_OWORD *)&buf.a = 0uLL;
      CGAffineTransformMakeScale(&buf, v32, v32);
      memset(&v52, 0, sizeof(v52));
      CGAffineTransformMakeScale(&v52, 1.0, 1.0);
      double v33 = wqa_overlay_log();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v51 = 0;
        _os_log_impl(&dword_239BF6000, v33, OS_LOG_TYPE_INFO, "presenting banner and hints", v51, 2u);
      }

      double v34 = +[WatchQuickActionsServices sharedInstance];
      [v34 showInstructionalBannerWithTitle:v12 subtitle:v8];

      id v49 = v9;
      id v50 = v7;
      id v35 = v46;
      id v36 = v42;
      id v37 = v43;
      AXPerformBlockOnMainThreadAfterDelay();

      goto LABEL_46;
    }
  }
  else
  {
  }
  v38 = wqa_overlay_log();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf.a) = 0;
    _os_log_impl(&dword_239BF6000, v38, OS_LOG_TYPE_INFO, "no title to present banner with", (uint8_t *)&buf, 2u);
  }

  (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
  uint64_t v12 = 0;
LABEL_46:
}

void __80__WQAOverlayCoordinator__mainQueue_showHintsWithPrimaryQuickActions_completion___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 176))
  {
    id v2 = +[WatchQuickActionsServices sharedInstance];
    objc_msgSend(v2, "animateInstructionalBannerWithScaleFactor:interstepDuration:", 0.93, 0.93, 0.15);
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v37 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v9 = [v8 animationHandler];
        uint64_t v10 = v9;
        if (v9) {
          [v9 quickActionWillHint:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v5);
  }

  uint64_t v11 = (void *)MEMORY[0x263F1CB60];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __80__WQAOverlayCoordinator__mainQueue_showHintsWithPrimaryQuickActions_completion___block_invoke_2;
  v30[3] = &unk_264DB8170;
  id v31 = *(id *)(a1 + 40);
  long long v12 = *(_OWORD *)(a1 + 96);
  long long v33 = *(_OWORD *)(a1 + 80);
  long long v34 = v12;
  long long v35 = *(_OWORD *)(a1 + 112);
  id v32 = *(id *)(a1 + 48);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __80__WQAOverlayCoordinator__mainQueue_showHintsWithPrimaryQuickActions_completion___block_invoke_3;
  v18[3] = &unk_264DB8210;
  id v19 = *(id *)(a1 + 40);
  long long v13 = *(_OWORD *)(a1 + 144);
  long long v24 = *(_OWORD *)(a1 + 128);
  long long v25 = v13;
  long long v26 = *(_OWORD *)(a1 + 160);
  id v20 = *(id *)(a1 + 48);
  long long v14 = *(_OWORD *)(a1 + 96);
  long long v27 = *(_OWORD *)(a1 + 80);
  long long v28 = v14;
  long long v29 = *(_OWORD *)(a1 + 112);
  id v15 = *(id *)(a1 + 56);
  uint64_t v16 = *(void *)(a1 + 64);
  uint64_t v17 = *(void **)(a1 + 72);
  id v21 = v15;
  uint64_t v22 = v16;
  id v23 = v17;
  [v11 animateWithDuration:v30 animations:v18 completion:0.15];
}

void __80__WQAOverlayCoordinator__mainQueue_showHintsWithPrimaryQuickActions_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v24 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v8 = *(_OWORD *)(a1 + 64);
        v22[0] = *(_OWORD *)(a1 + 48);
        v22[1] = v8;
        v22[2] = *(_OWORD *)(a1 + 80);
        [v7 setTransform:v22];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v4);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    long long v13 = (_OWORD *)(a1 + 48);
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        id v15 = *(void **)(*((void *)&v18 + 1) + 8 * j);
        long long v16 = v13[1];
        v17[0] = *v13;
        v17[1] = v16;
        v17[2] = v13[2];
        [v15 setAffineTransform:v17];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v27 count:16];
    }
    while (v11);
  }
}

void __80__WQAOverlayCoordinator__mainQueue_showHintsWithPrimaryQuickActions_completion___block_invoke_3(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x263F1CB60];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __80__WQAOverlayCoordinator__mainQueue_showHintsWithPrimaryQuickActions_completion___block_invoke_4;
  v19[3] = &unk_264DB8170;
  id v20 = *(id *)(a1 + 32);
  long long v22 = *(_OWORD *)(a1 + 72);
  long long v23 = *(_OWORD *)(a1 + 88);
  long long v24 = *(_OWORD *)(a1 + 104);
  id v21 = *(id *)(a1 + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __80__WQAOverlayCoordinator__mainQueue_showHintsWithPrimaryQuickActions_completion___block_invoke_5;
  v7[3] = &unk_264DB8210;
  id v8 = *(id *)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 136);
  long long v13 = *(_OWORD *)(a1 + 120);
  long long v14 = v3;
  long long v15 = *(_OWORD *)(a1 + 152);
  id v9 = *(id *)(a1 + 40);
  long long v16 = *(_OWORD *)(a1 + 72);
  long long v17 = *(_OWORD *)(a1 + 88);
  long long v18 = *(_OWORD *)(a1 + 104);
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void **)(a1 + 64);
  id v10 = v4;
  uint64_t v11 = v5;
  id v12 = v6;
  [v2 animateWithDuration:v19 animations:v7 completion:0.15];
}

void __80__WQAOverlayCoordinator__mainQueue_showHintsWithPrimaryQuickActions_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v24 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v8 = *(_OWORD *)(a1 + 64);
        v22[0] = *(_OWORD *)(a1 + 48);
        v22[1] = v8;
        v22[2] = *(_OWORD *)(a1 + 80);
        [v7 setTransform:v22];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v4);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    long long v13 = (_OWORD *)(a1 + 48);
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v15 = *(void **)(*((void *)&v18 + 1) + 8 * j);
        long long v16 = v13[1];
        v17[0] = *v13;
        v17[1] = v16;
        v17[2] = v13[2];
        [v15 setAffineTransform:v17];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v27 count:16];
    }
    while (v11);
  }
}

void __80__WQAOverlayCoordinator__mainQueue_showHintsWithPrimaryQuickActions_completion___block_invoke_5(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x263F1CB60];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __80__WQAOverlayCoordinator__mainQueue_showHintsWithPrimaryQuickActions_completion___block_invoke_6;
  _OWORD v17[3] = &unk_264DB8170;
  id v18 = *(id *)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 88);
  long long v20 = *(_OWORD *)(a1 + 72);
  long long v21 = v3;
  long long v22 = *(_OWORD *)(a1 + 104);
  id v19 = *(id *)(a1 + 40);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __80__WQAOverlayCoordinator__mainQueue_showHintsWithPrimaryQuickActions_completion___block_invoke_7;
  v8[3] = &unk_264DB81E8;
  id v9 = *(id *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 136);
  long long v14 = *(_OWORD *)(a1 + 120);
  long long v15 = v4;
  long long v16 = *(_OWORD *)(a1 + 152);
  id v10 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  id v7 = *(void **)(a1 + 64);
  id v11 = v5;
  uint64_t v12 = v6;
  id v13 = v7;
  [v2 animateWithDuration:v17 animations:v8 completion:0.15];
}

void __80__WQAOverlayCoordinator__mainQueue_showHintsWithPrimaryQuickActions_completion___block_invoke_6(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v24 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v8 = *(_OWORD *)(a1 + 64);
        v22[0] = *(_OWORD *)(a1 + 48);
        v22[1] = v8;
        v22[2] = *(_OWORD *)(a1 + 80);
        [v7 setTransform:v22];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v4);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    id v13 = (_OWORD *)(a1 + 48);
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v15 = *(void **)(*((void *)&v18 + 1) + 8 * j);
        long long v16 = v13[1];
        v17[0] = *v13;
        v17[1] = v16;
        v17[2] = v13[2];
        [v15 setAffineTransform:v17];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v27 count:16];
    }
    while (v11);
  }
}

void __80__WQAOverlayCoordinator__mainQueue_showHintsWithPrimaryQuickActions_completion___block_invoke_7(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x263F1CB60];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __80__WQAOverlayCoordinator__mainQueue_showHintsWithPrimaryQuickActions_completion___block_invoke_8;
  v11[3] = &unk_264DB8170;
  id v12 = *(id *)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 88);
  long long v14 = *(_OWORD *)(a1 + 72);
  long long v15 = v3;
  long long v16 = *(_OWORD *)(a1 + 104);
  id v13 = *(id *)(a1 + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __80__WQAOverlayCoordinator__mainQueue_showHintsWithPrimaryQuickActions_completion___block_invoke_9;
  v7[3] = &unk_264DB8088;
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void **)(a1 + 64);
  id v8 = v4;
  uint64_t v9 = v5;
  id v10 = v6;
  [v2 animateWithDuration:v11 animations:v7 completion:0.15];
}

void __80__WQAOverlayCoordinator__mainQueue_showHintsWithPrimaryQuickActions_completion___block_invoke_8(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v24 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v8 = *(_OWORD *)(a1 + 64);
        v22[0] = *(_OWORD *)(a1 + 48);
        v22[1] = v8;
        v22[2] = *(_OWORD *)(a1 + 80);
        [v7 setTransform:v22];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v4);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    id v13 = (_OWORD *)(a1 + 48);
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v15 = *(void **)(*((void *)&v18 + 1) + 8 * j);
        long long v16 = v13[1];
        v17[0] = *v13;
        v17[1] = v16;
        v17[2] = v13[2];
        [v15 setAffineTransform:v17];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v27 count:16];
    }
    while (v11);
  }
}

void __80__WQAOverlayCoordinator__mainQueue_showHintsWithPrimaryQuickActions_completion___block_invoke_9(uint64_t a1)
{
  id v2 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
  [v2 setFromValue:&unk_26ED2EBF0];
  [v2 setToValue:&unk_26ED2EC00];
  [v2 setDuration:0.3];
  [v2 setFillMode:*MEMORY[0x263F15AB0]];
  [v2 setRemovedOnCompletion:0];
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 48);
  id v3 = v2;
  AXPerformBlockOnMainThreadAfterDelay();
}

void __80__WQAOverlayCoordinator__mainQueue_showHintsWithPrimaryQuickActions_completion___block_invoke_305(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = +[WatchQuickActionsServices sharedInstance];
  [v2 hideInstructionalBanner];

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * i) addAnimation:*(void *)(a1 + 40) forKey:@"fadeOutAnimation"];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  id v8 = *(id *)(a1 + 56);
  AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __80__WQAOverlayCoordinator__mainQueue_showHintsWithPrimaryQuickActions_completion___block_invoke_2_309(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_mainQueue_cleanupHintViews");
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_mainQueue_cleanupHintViews
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v3 = [(WQAOverlayCoordinator *)self currentShapeLayersForHint];

  if (v3)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v4 = [(WQAOverlayCoordinator *)self currentShapeLayersForHint];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * v8++) removeFromSuperlayer];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }

    [(WQAOverlayCoordinator *)self setCurrentShapeLayersForHint:0];
  }
  long long v9 = +[WatchQuickActionsServices sharedInstance];
  [v9 hideInstructionalBanner];
}

- (void)_mainQueue_backlightDidTurnOn
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v3 = wqa_overlay_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)CGAffineTransform buf = 0;
    _os_log_impl(&dword_239BF6000, v3, OS_LOG_TYPE_INFO, "backlight did turn on", buf, 2u);
  }

  if (_AXSWatchControlEnabled()
    && [(WQAOverlayCoordinator *)self inputSourcesRequireFocusRing]
    && [(WQAOverlayCoordinator *)self hasNoActivationGesture])
  {
    uint64_t v4 = wqa_overlay_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_239BF6000, v4, OS_LOG_TYPE_INFO, "activation gesture set to none, do not show overlays", v6, 2u);
    }
  }
  else
  {
    uint64_t v4 = [(WQAOverlayCoordinator *)self dataSource];
    uint64_t v5 = [v4 quickActionsForOverlayCoordinator:self];
    [(WQAOverlayCoordinator *)self _mainQueue_showUIForQuickActions:v5];
  }
}

- (void)_mainQueue_backlightDidTurnOff
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v3 = wqa_overlay_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_239BF6000, v3, OS_LOG_TYPE_INFO, "backlight did turn off", v4, 2u);
  }

  [(WQAOverlayCoordinator *)self _mainQueue_cleanupShapeLayers];
}

- (void)_mainQueue_cleanupShapeLayers
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v3 = [(WQAOverlayCoordinator *)self quickActionShapeLayers];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = wqa_overlay_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = [(WQAOverlayCoordinator *)self quickActionShapeLayers];
      *(_DWORD *)CGAffineTransform buf = 138412290;
      long long v33 = v6;
      _os_log_impl(&dword_239BF6000, v5, OS_LOG_TYPE_INFO, "removing shape layers: %@", buf, 0xCu);
    }
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v7 = [(WQAOverlayCoordinator *)self quickActionShapeLayers];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(v7);
          }
          [(WQAOverlayCoordinator *)self _mainQueue_removeShapeLayer:*(void *)(*((void *)&v26 + 1) + 8 * i)];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v9);
    }

    long long v12 = [(WQAOverlayCoordinator *)self quickActionShapeLayers];
    [v12 removeAllObjects];
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v13 = [(WQAOverlayCoordinator *)self dataSource];
  uint64_t v14 = [v13 quickActionsForOverlayCoordinator:self];

  uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = *(void **)(*((void *)&v22 + 1) + 8 * j);
        long long v20 = [v19 animationHandler];
        long long v21 = v20;
        if (v20) {
          [v20 quickActionDidBecomeInactive:v19];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v16);
  }

  [(WQAOverlayCoordinator *)self _mainQueue_cleanupHintViews];
}

- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvent:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (v8)
  {
    uint64_t v9 = wqa_overlay_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[WQAOverlayCoordinator backlight:didCompleteUpdateToState:forEvent:](v8, v9);
    }

    id v10 = v8;
    if ((unint64_t)[v10 previousState] >= 2)
    {
    }
    else
    {
      unint64_t v11 = [v10 state] & 0xFFFFFFFFFFFFFFFELL;

      if (v11 == 2)
      {
        v17[0] = MEMORY[0x263EF8330];
        v17[1] = 3221225472;
        v17[2] = __69__WQAOverlayCoordinator_backlight_didCompleteUpdateToState_forEvent___block_invoke;
        _OWORD v17[3] = &unk_264DB7FC0;
        void v17[4] = self;
        long long v12 = MEMORY[0x263EF83A0];
        long long v13 = v17;
LABEL_11:
        dispatch_async(v12, v13);
        goto LABEL_13;
      }
    }
    id v14 = v10;
    if (([v14 previousState] & 0xFFFFFFFFFFFFFFFELL) != 2)
    {

      goto LABEL_13;
    }
    unint64_t v15 = [v14 state];

    if (v15 <= 1)
    {
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __69__WQAOverlayCoordinator_backlight_didCompleteUpdateToState_forEvent___block_invoke_2;
      v16[3] = &unk_264DB7FC0;
      v16[4] = self;
      long long v12 = MEMORY[0x263EF83A0];
      long long v13 = v16;
      goto LABEL_11;
    }
  }
LABEL_13:
}

uint64_t __69__WQAOverlayCoordinator_backlight_didCompleteUpdateToState_forEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_backlightDidTurnOn");
}

uint64_t __69__WQAOverlayCoordinator_backlight_didCompleteUpdateToState_forEvent___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_backlightDidTurnOff");
}

- (WQAOverlayDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (WQAOverlayDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (NSMutableArray)quickActionShapeLayers
{
  return self->_quickActionShapeLayers;
}

- (void)setQuickActionShapeLayers:(id)a3
{
}

- (NSArray)currentShapeLayersForHint
{
  return self->_currentShapeLayersForHint;
}

- (void)setCurrentShapeLayersForHint:(id)a3
{
}

- (BOOL)receivedActivationGesture
{
  return self->_receivedActivationGesture;
}

- (void)setReceivedActivationGesture:(BOOL)a3
{
  self->_receivedActivationGesture = a3;
}

- (BOOL)hasNoActivationGesture
{
  return self->_hasNoActivationGesture;
}

- (void)setHasNoActivationGesture:(BOOL)a3
{
  self->_hasNoActivationGesture = a3;
}

- (BOOL)inputSourcesRequireFocusRing
{
  return self->_inputSourcesRequireFocusRing;
}

- (void)setInputSourcesRequireFocusRing:(BOOL)a3
{
  self->_inputSourcesRequireFocusRing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentShapeLayersForHint, 0);
  objc_storeStrong((id *)&self->_quickActionShapeLayers, 0);

  objc_destroyWeak((id *)&self->_dataSource);
}

- (uint64_t)initWithDataSource:.cold.1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return -[WQAOverlayCoordinator backlight:didCompleteUpdateToState:forEvent:](v0);
}

- (void)backlight:(void *)a1 didCompleteUpdateToState:(NSObject *)a2 forEvent:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "previousState"));
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "state"));
  int v6 = 138412546;
  id v7 = v4;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_debug_impl(&dword_239BF6000, a2, OS_LOG_TYPE_DEBUG, "backlight did change from '%@' to '%@'", (uint8_t *)&v6, 0x16u);
}

@end