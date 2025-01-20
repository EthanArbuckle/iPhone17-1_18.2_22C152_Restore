@interface UIWindowScene
+ (BOOL)_hostsWindows;
+ (BOOL)_supportsEventUIWindowRouting;
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)_canvasForScene:(id)a3;
+ (id)_keyWindowScene;
+ (id)_keyboardWindowSceneForScreen:(id)a3 create:(BOOL)a4;
+ (id)_placeholderWindowSceneForScreen:(id)a3 create:(BOOL)a4;
+ (id)_unassociatedWindowSceneForScreen:(id)a3 create:(BOOL)a4;
+ (void)_updateVisibleSceneAndWindowOrderWithTest:(id)a3;
+ (void)initialize;
- (BOOL)_allowsEventUIWindowRouting;
- (BOOL)_canReceiveDeviceOrientationEvents;
- (BOOL)_enhancedWindowingEnabled;
- (BOOL)_isInLiveResize;
- (BOOL)_isKeyWindowScene;
- (BOOL)_isPerformingSystemSnapshot;
- (BOOL)_isUserInteractionEnabled;
- (BOOL)_keepContextAssociationInBackground;
- (BOOL)_permitContextCreationForBindingDescription:(id *)a3;
- (BOOL)_shouldDeferInitialWindowUpdateBeforeConnection:(id)a3;
- (BOOL)_shouldDeferInitialWindowUpdateBeforeConnectionAndTrackIfNeeded:(id)a3;
- (BOOL)_shouldLoadStoryboard;
- (BOOL)_shouldRotateSafeAreaInsetsToInterfaceOrientation;
- (BOOL)_subclassTracksWindowsNeedingDeferredInitialUpdates;
- (BOOL)_supportsPassthroughInteractions;
- (BOOL)_tracksWindowsNeedingDeferredInitialUpdates;
- (BOOL)_usesMinimumSafeAreaInsets;
- (BOOL)_windowIsFront:(id)a3;
- (BOOL)_windowsIgnoreSceneClientOrientation;
- (BOOL)assertionActivationStateForType:(unint64_t)a3;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)isExcludedFromWindowsMenu;
- (BOOL)isFullScreen;
- (BOOL)isKeyCanvas;
- (CGRect)_referenceBounds;
- (CGRect)_referenceBoundsForOrientation:(int64_t)a3;
- (CGSize)_screenRequestedDisplayNativePixelSize;
- (FBSDisplayConfigurationRequest)_displayConfigurationRequest;
- (FBSScene)_scene;
- (NSArray)windows;
- (UIActivityItemsConfigurationReading)_activityItemsConfiguration;
- (UIAlertControllerStackManager)_alertControllerStackManager;
- (UIEdgeInsets)_peripheryInsets;
- (UIEdgeInsets)_safeAreaInsetsForInterfaceOrientation:(int64_t)a3;
- (UIFocusSystem)focusSystem;
- (UIInterfaceOrientation)interfaceOrientation;
- (UIKeyboardSceneDelegate)keyboardSceneDelegate;
- (UISceneSizeRestrictions)sizeRestrictions;
- (UISceneWindowingBehaviors)windowingBehaviors;
- (UIScreen)screen;
- (UIScreenshotService)screenshotService;
- (UIStatusBarManager)statusBarManager;
- (UITraitCollection)traitCollection;
- (UIWindow)_delegateWindow;
- (UIWindowScene)initWithSession:(id)a3 connectionOptions:(id)a4;
- (UIWindowSceneGeometry)effectiveGeometry;
- (_UIBannerManager)_bannerManager;
- (_UICanvasDefinition)_definition;
- (_UIContextBinder)_contextBinder;
- (_UIDisplayInfoProviding)_displayInfoProvider;
- (_UISceneUIWindowEventRouting)_sceneForKeyboardDisplay;
- (_UISearchActivityManager)_searchActivityManager;
- (_UISystemAppearanceManager)_systemAppearanceManager;
- (_UITraitEnvironmentInternal)_overrideParentTraitEnvironment;
- (_UIWindowSceneTransitionCoordinator)_transitionCoordinator;
- (double)_adjustedLevelForWindow:(id)a3 preferredLevel:(double)a4;
- (double)_systemMinimumMargin;
- (id)_allWindows;
- (id)_allWindowsForInvalidation;
- (id)_allWindowsIncludingInternalWindows:(BOOL)a3 onlyVisibleWindows:(BOOL)a4;
- (id)_alwaysOnEnvironment;
- (id)_contentSizePreferenceProvider;
- (id)_contextMenuSceneComponent;
- (id)_disableTouchCancellationOnRotation;
- (id)_editMenuSceneComponent;
- (id)_fbsSceneLayerForWindow:(id)a3;
- (id)_findNewKeyWindowPassingTest:(void *)a1;
- (id)_holdLiveResizeSnapshotForReason:(id)a3;
- (id)_inheritingWindowsIncludingInvisible:(BOOL)a3;
- (id)_keyCommands;
- (id)_keyWindow;
- (id)_orientationDebugDescription;
- (id)_orientationDebugDescriptionBuilderWithMultilinePrefix:(id)a3;
- (id)_orientationDebugDescriptionWithMultilinePrefix:(id)a3;
- (id)_parentTraitEnvironment;
- (id)_playbackControlsStateManager;
- (id)_registerForTraitTokenChanges:(id)a3 withHandler:(id)a4;
- (id)_registerForTraitTokenChanges:(id)a3 withTarget:(id)a4 action:(SEL)a5;
- (id)_remoteSheetClientProvider;
- (id)_sceneMaskingCoordinator;
- (id)_screenTraitCollectionWithOverridesAppliedFromSceneUISettings;
- (id)_screenshotServiceIfPresent;
- (id)_systemInputActivityManager;
- (id)_topVisibleWindowEnumeratingAsCopy:(BOOL)a3 passingTest:(id)a4;
- (id)_topVisibleWindowPassingTest:(id)a3;
- (id)_traitTrace;
- (id)_traitTrace:(id)a3;
- (id)_trueEffectiveGeometry;
- (id)_visibleWindows;
- (id)_windowOrientationPreferencesObserver;
- (id)_windowSceneDelegate;
- (id)_windowingBehaviorsNotInstantiating;
- (id)activityItemsConfigurationSource;
- (id)canvasToolbar;
- (id)coordinateSpace;
- (id)registerForTraitChanges:(id)a3 withAction:(SEL)a4;
- (id)registerForTraitChanges:(id)a3 withHandler:(id)a4;
- (id)registerForTraitChanges:(id)a3 withTarget:(id)a4 action:(SEL)a5;
- (id)traitOverrides;
- (int64_t)_avkitRequestedOverscanCompensation;
- (int64_t)_backgroundStyle;
- (int64_t)_interfaceOrientationForSupportedOrientations:(unint64_t)a3 preferredOrientation:(int64_t)a4;
- (int64_t)_resolvedOverscanCompensation;
- (int64_t)_screenRequestedOverscanCompensation;
- (int64_t)_systemUserInterfaceStyle;
- (int64_t)interfaceElementCategory;
- (int64_t)state;
- (unint64_t)_currentlySupportedInterfaceOrientations;
- (void)_addWindowNeedingDeferredInitialUpdateExecution:(uint64_t)a1;
- (void)_applySnapshotSettings:(id)a3 forActions:(id)a4;
- (void)_attachWindow:(id)a3;
- (void)_beginIgnoringInteractionEventsForReason:(id)a3;
- (void)_beginKeyboardEnvironmentEventDeferringForWindow:(void *)a3 reason:;
- (void)_componentDidUpdateTraitOverrides:(id)a3;
- (void)_computeMetrics:(BOOL)a3;
- (void)_computeMetrics:(BOOL)a3 withTransitionContext:(id)a4;
- (void)_computeMetricsAndCrossFadeInLiveResize:(BOOL)a3 withTransitionContext:(id)a4;
- (void)_computeMetricsForWindows:(id)a3 animated:(BOOL)a4;
- (void)_computeTraitCollectionAndCoordinateSpaceForcingDelegateCallback:(BOOL)a3 withAction:(id)a4;
- (void)_configurePassthroughWindowIfNeeded;
- (void)_delegate_windowDidBecomeVisible:(id)a3;
- (void)_delegate_windowWillAttach:(id)a3;
- (void)_delegate_windowWillBecomeHidden:(id)a3;
- (void)_delegate_windowWillBecomeVisible:(id)a3;
- (void)_delegate_windowWillDetach:(id)a3;
- (void)_detachWindow:(id)a3;
- (void)_endEventDeferringIfNeededForWindow:(void *)a3 withReason:;
- (void)_endIgnoringInteractionEventsForReason:(id)a3;
- (void)_endKeyboardEnvironmentEventDeferringWithReason:(uint64_t)a1;
- (void)_enqueueEvaluationOfDisablesMirroring;
- (void)_enumerateWindowsIncludingInternalWindows:(BOOL)a3 onlyVisibleWindows:(BOOL)a4 asCopy:(BOOL)a5 stopped:(BOOL *)a6 withBlock:(id)a7;
- (void)_evaluateSceneKeyWindowForWindowMadeKey:(char)a3 consideringVisibility:(int)a4 findingNewKeyWindowIfNeeded:(int)a5 ignoringOldKeyWindow:(void *)a6 forReason:;
- (void)_finishSceneConnection;
- (void)_hostTraitCollectionDidChange:(id)a3;
- (void)_inLiveResizeDidChange;
- (void)_invalidate;
- (void)_invalidateAuxiliaryChildTraits;
- (void)_keyWindowDidBecomeApplicationKeyWithoutEvaluationRequest;
- (void)_keyWindowWillDeallocate:(id *)a1;
- (void)_loadWindowWithStoryboardIfNeeded:(id)a3;
- (void)_noteDisplayIdentityDidChangeWithConfiguration:(id)a3;
- (void)_performAfterSystemSnapshotsComplete:(id)a3;
- (void)_performClose:(id)a3;
- (void)_performDeferredInitialWindowUpdateForConnection;
- (void)_performIOSGeometryRequestWithPreferences:(id)a3 errorHandler:(id)a4;
- (void)_prepareForResume;
- (void)_prepareForSuspend;
- (void)_pushKeyWindow:(int)a3 ignoringOldKeyWindow:;
- (void)_readySceneForConnection;
- (void)_recycleAttachmentForWindow:(id)a3;
- (void)_registerAuxiliaryChildEnvironmentForTraitInvalidations:(id)a3;
- (void)_registerSceneComponent:(id)a3 forKey:(id)a4;
- (void)_removeWindowFromKeyWindowHistoryFindingNewKeyWindowIfNeeded:(int)a3 ignoringOldKeyWindow:(void *)a4 forReason:;
- (void)_scheduleResizeFinishedActionAndFadeOutSnapshot;
- (void)_screenDidChangeFromScreen:(id)a3 toScreen:(id)a4;
- (void)_setAVKitRequestedOverscanCompensation:(int64_t)a3;
- (void)_setAVKitRequestedRefreshRate:(double)a3 HDRMode:(int64_t)a4 overscanCompensation:(int64_t)a5;
- (void)_setBackgroundStyle:(int64_t)a3;
- (void)_setDisplayConfigurationRequest:(id)a3;
- (void)_setEnhancedWindowingEnabled:(BOOL)a3;
- (void)_setKeepContextAssociationInBackground:(BOOL)a3;
- (void)_setOverrideParentTraitEnvironment:(id)a3;
- (void)_setReachabilitySupported:(BOOL)a3 forReason:(id)a4;
- (void)_setScreenRequestedDisplayNativePixelSize:(CGSize)a3;
- (void)_setScreenRequestedOverscanCompensation:(int64_t)a3;
- (void)_setShouldDisableTouchCancellationOnRotation:(BOOL)a3;
- (void)_setSystemVolumeHUDEnabled:(BOOL)a3;
- (void)_setSystemVolumeHUDEnabled:(BOOL)a3 forAudioCategory:(id)a4;
- (void)_showProgressWhenFetchingUserActivityForTypes:(id)a3;
- (void)_traitOverridesDidChange:(id)a3;
- (void)_unlockPointerLockState:(id)a3;
- (void)_unregisterAuxiliaryChildEnvironmentForTraitInvalidations:(id)a3;
- (void)_updateAllDelegateFlags;
- (void)_updateAuxiliaryChildTraitsIfNeeded;
- (void)_updateClientSettingsToInterfaceOrientation:(int64_t)a3 withAnimationDuration:(double)a4;
- (void)_updateEffectiveGeometryIfNeeded;
- (void)_updateSceneTraitsAndPushTraitsToScreen:(BOOL)a3 callParentWillTransitionToTraitCollection:(BOOL)a4;
- (void)_updateSpringBoardDelegateFlags;
- (void)_updateVisibleWindowOrderWithTest:(id)a3;
- (void)_updateWindowSceneDelegateFlags;
- (void)_willRestoreInteractionStateForUserActivityManager:(id)a3;
- (void)_windowUpdatedProperties:(id)a3;
- (void)_windowUpdatedVisibility:(id)a3;
- (void)assertionActivationStateChangedToState:(BOOL)a3 forType:(unint64_t)a4;
- (void)requestGeometryUpdateWithPreferences:(UIWindowSceneGeometryPreferences *)geometryPreferences errorHandler:(void *)errorHandler;
- (void)setActivityItemsConfigurationSource:(id)activityItemsConfigurationSource;
- (void)setDelegate:(id)a3;
- (void)setExcludedFromWindowsMenu:(BOOL)a3;
- (void)set_isKeyWindowScene:(BOOL)a3;
- (void)unregisterForTraitChanges:(id)a3;
@end

@implementation UIWindowScene

- (id)traitOverrides
{
  traitOverrides = self->_traitOverrides;
  if (!traitOverrides)
  {
    v4 = (_UITraitOverrides *)-[_UITraitOverrides initWithDelegate:]([_UITraitOverrides alloc], self);
    v5 = self->_traitOverrides;
    self->_traitOverrides = v4;

    traitOverrides = self->_traitOverrides;
  }
  return traitOverrides;
}

- (UIScreen)screen
{
  screen = self->_screen;
  if (!screen)
  {
    v4 = [(UIScene *)self _FBSScene];
    v5 = +[UIScreen _screenForScene:v4];
    v6 = self->_screen;
    self->_screen = v5;

    screen = self->_screen;
  }
  return screen;
}

- (BOOL)_isPerformingSystemSnapshot
{
  return (*(unsigned char *)&self->_windowSceneFlags >> 3) & 1;
}

- (UIInterfaceOrientation)interfaceOrientation
{
  if ([(UIWindowScene *)self _canReceiveDeviceOrientationEvents]) {
    [(UIScene *)self _effectiveUIClientSettings];
  }
  else {
  v3 = [(UIScene *)self _effectiveUISettings];
  }
  UIInterfaceOrientation v4 = [v3 interfaceOrientation];

  return v4;
}

- (BOOL)_canReceiveDeviceOrientationEvents
{
  v2 = [(UIScene *)self _effectiveUISettings];
  char v3 = [v2 deviceOrientationEventsEnabled];

  return v3;
}

- (id)_topVisibleWindowEnumeratingAsCopy:(BOOL)a3 passingTest:(id)a4
{
  BOOL v4 = a3;
  v6 = (uint64_t (**)(id, void *))a4;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__201;
  v27 = __Block_byref_object_dispose__201;
  id v28 = 0;
  v7 = +[UIDevice currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) != 1 && +[_UIRemoteKeyboards enabled])
  {
    v9 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    v10 = [v9 keyboardWindow];

    if (v10)
    {
      v11 = [v10 windowScene];
      v12 = v11;
      v13 = self;
      if (v11 != self)
      {
        if (v6)
        {
          int v14 = v6[2](v6, v10);

          if (!v14) {
            goto LABEL_11;
          }
        }
        else
        {
        }
        v15 = v24;
        id v16 = v10;
        v13 = (UIWindowScene *)v15[5];
        v15[5] = (uint64_t)v16;
      }
    }
LABEL_11:
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __64__UIWindowScene__topVisibleWindowEnumeratingAsCopy_passingTest___block_invoke;
  v20[3] = &unk_1E52DABF0;
  v22 = &v23;
  v17 = v6;
  v21 = v17;
  [(UIWindowScene *)self _enumerateWindowsIncludingInternalWindows:1 onlyVisibleWindows:1 asCopy:v4 stopped:0 withBlock:v20];
  id v18 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  return v18;
}

- (UIKeyboardSceneDelegate)keyboardSceneDelegate
{
  return (UIKeyboardSceneDelegate *)[(UIScene *)self _sceneComponentForKey:@"_UIKeyboardSceneDelegateSceneComponentKey"];
}

- (void)_enumerateWindowsIncludingInternalWindows:(BOOL)a3 onlyVisibleWindows:(BOOL)a4 asCopy:(BOOL)a5 stopped:(BOOL *)a6 withBlock:(id)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v11 = (void (**)(id, void *, uint8_t *))a7;
  if (!v11) {
    goto LABEL_20;
  }
  if (v8 || pthread_main_np() == 1) {
    goto LABEL_4;
  }
  if (os_variant_has_internal_diagnostics())
  {
    v24 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      v26 = (objc_class *)objc_opt_class();
      *(_DWORD *)buf = 136315138;
      Name = class_getName(v26);
      _os_log_fault_impl(&dword_1853B0000, v24, OS_LOG_TYPE_FAULT, "Unsupported enumeration of %s windows on non-main thread.", buf, 0xCu);
    }
    goto LABEL_27;
  }
  uint64_t v23 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_enumerateWindowsIncludingInternalWindows_onlyVisibleWindows_asCopy_stopped_withBlock____s_category)+ 8);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    v24 = v23;
    uint64_t v25 = (objc_class *)objc_opt_class();
    *(_DWORD *)buf = 136315138;
    Name = class_getName(v25);
    _os_log_impl(&dword_1853B0000, v24, OS_LOG_TYPE_ERROR, "Unsupported enumeration of %s windows on non-main thread.", buf, 0xCu);
LABEL_27:
  }
LABEL_4:
  contextBinder = self->_contextBinder;
  v27 = a6;
  BOOL v13 = v8;
  if (v9) {
    [(_UIContextBinder *)contextBinder _attachedBindablePointersAsCopy:v8];
  }
  else {
  int v14 = [(_UIContextBinder *)contextBinder _enrolledBindablePointersAsCopy:v8];
  }
  uint64_t v15 = [v14 count];
  if (!v15) {
    goto LABEL_19;
  }
  uint64_t v16 = v15;
  uint64_t v17 = 0;
  BOOL v18 = v9 && v8;
  while (1)
  {
    v19 = (void *)MEMORY[0x18C108260]();
    v20 = (void *)[v14 pointerAtIndex:v17];
    if (!v20) {
      goto LABEL_18;
    }
    v21 = v20;
    if (!a3 && ([v20 isInternalWindow] & 1) != 0) {
      goto LABEL_18;
    }
    if (v18)
    {
      if (_UIWindowSceneCompatibleIsHidden(v21)) {
        goto LABEL_18;
      }
    }
    else if (!v13)
    {
      break;
    }
    v22 = [v21 _windowHostingScene];

    if (v22 == self) {
      break;
    }
LABEL_18:
    if (v16 == ++v17) {
      goto LABEL_19;
    }
  }
  buf[0] = 0;
  v11[2](v11, v21, buf);
  if (!buf[0]) {
    goto LABEL_18;
  }
  if (v27) {
    BOOL *v27 = 1;
  }
LABEL_19:

LABEL_20:
}

void __64__UIWindowScene__topVisibleWindowEnumeratingAsCopy_passingTest___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v11 = v4;
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)
    || ([v4 windowLevel],
        double v6 = v5,
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) windowLevel],
        v7 = v11,
        v6 > v8))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    if (!v9 || (int v10 = (*(uint64_t (**)(uint64_t, id))(v9 + 16))(v9, v11), v7 = v11, v10))
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
      v7 = v11;
    }
  }
}

+ (id)_keyWindowScene
{
  self;
  v0 = +[_UIKeyWindowEvaluator sharedEvaluator];
  v1 = -[_UIKeyWindowEvaluator applicationKeyWindow](v0);
  v2 = [v1 windowScene];

  return v2;
}

- (UIEdgeInsets)_safeAreaInsetsForInterfaceOrientation:(int64_t)a3
{
  double v5 = 0.0;
  double v6 = 0.0;
  double v7 = 0.0;
  double v8 = 0.0;
  if (dyld_program_sdk_at_least())
  {
    uint64_t v9 = [(UIWindowScene *)self _displayInfoProvider];
    [v9 safeAreaInsetsPortrait];
    double v8 = v10;
    double v7 = v13;
    double v6 = v11;
    double v5 = v12;
    if (v13 != 0.0 || v10 != 0.0 || v12 != 0.0 || v11 != 0.0)
    {
      [v9 homeAffordanceOverlayAllowance];
      double v15 = v14;
      if ([(UIWindowScene *)self _shouldRotateSafeAreaInsetsToInterfaceOrientation])
      {
        if (a3 == 4) {
          double v16 = v8;
        }
        else {
          double v16 = v5;
        }
        if (a3 == 4) {
          double v17 = v5;
        }
        else {
          double v17 = v6;
        }
        if (a3 == 4) {
          double v18 = v6;
        }
        else {
          double v18 = v7;
        }
        if (a3 == 4) {
          double v19 = v7;
        }
        else {
          double v19 = v8;
        }
        if (a3 == 3)
        {
          double v16 = v6;
          double v17 = v7;
          double v18 = v8;
          double v19 = v5;
        }
        if (a3 == 2) {
          double v20 = v7;
        }
        else {
          double v20 = v16;
        }
        if (a3 == 2) {
          double v21 = v8;
        }
        else {
          double v21 = v17;
        }
        if (a3 == 2)
        {
          double v8 = v6;
        }
        else
        {
          double v5 = v18;
          double v8 = v19;
        }
        v22 = [(UIScene *)self _displayClientComponent];
        uint64_t v23 = v22;
        if (v22)
        {
          [v22 displayBasedSafeAreaInsets];
          if (a3 == 4) {
            double v28 = v24;
          }
          else {
            double v28 = v27;
          }
          if (a3 == 4) {
            double v29 = v26;
          }
          else {
            double v29 = v25;
          }
          if (a3 != 3)
          {
            double v26 = v28;
            double v24 = v29;
          }
          if (a3 == 2) {
            double v24 = v27;
          }
          else {
            double v25 = v26;
          }
          double v30 = fmax(v24, v25);
        }
        else
        {
          double v30 = fmax(v5, v20);
        }
        double v7 = fmax(v5, v30);
        double v5 = fmax(v20, v30);

        double v6 = v21;
      }
      double v6 = fmax(v6, v15);
    }
  }
  double v31 = v8;
  double v32 = v7;
  double v33 = v6;
  double v34 = v5;
  result.right = v34;
  result.bottom = v33;
  result.left = v32;
  result.top = v31;
  return result;
}

- (_UIDisplayInfoProviding)_displayInfoProvider
{
  if ([(id)UIApp _sceneSettingsIncludeSafeAreaInsets]
    && ((_UIInternalPreferenceUsesDefault(&_UIInternalPreference_ForceIOSDeviceInsets, @"ForceIOSDeviceInsets", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) != 0|| !byte_1EB256E2C))
  {
    double v8 = [(UIScene *)self _effectiveUISettings];
    if ([v8 isUISubclass])
    {
      uint64_t v9 = v8;
    }
    else
    {
      _UIDisplayInfoNullProvider();
      uint64_t v9 = (_UIDisplayInfoProviding *)objc_claimAutoreleasedReturnValue();
    }
    double v10 = v9;
  }
  else
  {
    displayEdgeInfoProvider = self->_displayEdgeInfoProvider;
    if (!displayEdgeInfoProvider)
    {
      id v4 = [(UIWindowScene *)self screen];
      double v5 = [v4 _displayInfoProvider];
      double v6 = v5;
      if (v5)
      {
        double v7 = v5;
      }
      else
      {
        _UIDisplayInfoNullProvider();
        double v7 = (_UIDisplayInfoProviding *)objc_claimAutoreleasedReturnValue();
      }
      double v11 = self->_displayEdgeInfoProvider;
      self->_displayEdgeInfoProvider = v7;

      displayEdgeInfoProvider = self->_displayEdgeInfoProvider;
    }
    double v10 = displayEdgeInfoProvider;
  }
  return v10;
}

- (BOOL)_shouldRotateSafeAreaInsetsToInterfaceOrientation
{
  v2 = [(UIWindowScene *)self traitCollection];
  BOOL v3 = [v2 userInterfaceIdiom] == 0;

  return v3;
}

- (UITraitCollection)traitCollection
{
  BOOL v3 = self->_traitCollection;
  if (!v3)
  {
    id v4 = [(UIWindowScene *)self screen];
    BOOL v3 = [v4 traitCollection];

    if (!v3)
    {
      +[UITraitCollection _defaultTraitCollection]();
      BOOL v3 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v3;
}

- (id)_keyWindow
{
  if (a1)
  {
    a1 = (id *)a1[43];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_setReachabilitySupported:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int reachabilitySupportedCounter = self->_reachabilitySupportedCounter;
  if (v4) {
    int v8 = reachabilitySupportedCounter + 1;
  }
  else {
    int v8 = reachabilitySupportedCounter - 1;
  }
  self->_int reachabilitySupportedCounter = v8;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__UIWindowScene__setReachabilitySupported_forReason___block_invoke;
  v12[3] = &__block_descriptor_33_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
  BOOL v13 = v8 > 0;
  [(UIScene *)self _updateUIClientSettingsWithBlock:v12];
  uint64_t v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("ReachabilitySupported", &_setReachabilitySupported_forReason____s_category)+ 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    double v10 = @"NO";
    int v11 = self->_reachabilitySupportedCounter;
    *(_DWORD *)buf = 138543874;
    if (v4) {
      double v10 = @"YES";
    }
    double v15 = v10;
    __int16 v16 = 2114;
    id v17 = v6;
    __int16 v18 = 1026;
    int v19 = v11;
    _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEFAULT, "_setReachabilitySupported wants:%{public}@ forReason:%{public}@. _reachabilitySupportedCounter is now %{public}d", buf, 0x1Cu);
  }
}

- (void)_setSystemVolumeHUDEnabled:(BOOL)a3 forAudioCategory:(id)a4
{
  id v6 = (__CFString *)a4;
  double v7 = v6;
  if (v6 && [(__CFString *)v6 length])
  {
    char v8 = 0;
  }
  else
  {

    char v8 = 1;
    double v7 = &stru_1ED0E84C0;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__UIWindowScene__setSystemVolumeHUDEnabled_forAudioCategory___block_invoke;
  v10[3] = &unk_1E5302B58;
  char v12 = v8;
  BOOL v13 = a3;
  int v11 = v7;
  uint64_t v9 = v7;
  [(UIScene *)self _updateUIClientSettingsWithBlock:v10];
}

- (BOOL)_allowsEventUIWindowRouting
{
  if ([(id)objc_opt_class() _supportsEventUIWindowRouting])
  {
    BOOL v3 = [(UIScene *)self session];
    BOOL v4 = [v3 role];
    int v5 = [v4 isEqualToString:@"UIWindowSceneSessionRoleExternalDisplayNonInteractive"] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

+ (BOOL)_supportsEventUIWindowRouting
{
  return 1;
}

- (UIStatusBarManager)statusBarManager
{
  BOOL v3 = [(UIScene *)self _sceneComponentForKey:_UIStatusBarManagerWindowSceneComponentKey];
  if (!v3)
  {
    BOOL v4 = [(UIScene *)self _settingsScene];
    if (v4 == self || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      BOOL v3 = 0;
    }
    else
    {
      BOOL v3 = [(UIWindowScene *)v4 statusBarManager];
    }
  }
  return (UIStatusBarManager *)v3;
}

uint64_t __72__UIWindowScene__allWindowsIncludingInternalWindows_onlyVisibleWindows___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isInternalWindow] ^ 1;
}

- (id)_visibleWindows
{
  return [(_UIContextBinder *)self->_contextBinder attachedBindables];
}

void __54__UIWindowScene__enqueueEvaluationOfDisablesMirroring__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v3 = [WeakRetained _FBSScene];
    BOOL v4 = [v3 settings];
    int v5 = [v4 displayIdentity];

    if ([v5 isMainDisplay])
    {
LABEL_12:
      v2[416] &= ~4u;

      goto LABEL_13;
    }
    id v6 = [v2 _FBSScene];
    double v7 = [v6 clientSettings];

    if (![v7 isUISubclass])
    {
LABEL_11:

      goto LABEL_12;
    }
    id v8 = v7;
    uint64_t v9 = [v2 _visibleWindows];
    uint64_t v10 = [v9 count];

    if (v10)
    {
      uint64_t v15 = 0;
      __int16 v16 = &v15;
      uint64_t v17 = 0x2020000000;
      char v18 = 0;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __54__UIWindowScene__enqueueEvaluationOfDisablesMirroring__block_invoke_2;
      v14[3] = &unk_1E52E0520;
      v14[4] = &v15;
      [v2 _enumerateWindowsIncludingInternalWindows:1 onlyVisibleWindows:1 asCopy:0 stopped:0 withBlock:v14];
      int v11 = *((unsigned char *)v16 + 24) != 0;
      _Block_object_dispose(&v15, 8);
      if (v11 == [v8 disablesMirroring]) {
        goto LABEL_10;
      }
    }
    else
    {
      if (([v8 disablesMirroring] & 1) == 0)
      {
LABEL_10:

        goto LABEL_11;
      }
      LOBYTE(v11) = 0;
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __54__UIWindowScene__enqueueEvaluationOfDisablesMirroring__block_invoke_3;
    v12[3] = &__block_descriptor_33_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
    char v13 = v11;
    [v2 _updateUIClientSettingsWithBlock:v12];
    goto LABEL_10;
  }
LABEL_13:
}

- (CGRect)_referenceBounds
{
  if (+[UIApplication _isClassic]
    && ([(UIWindowScene *)self screen],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 _isMainScreen],
        v3,
        v4))
  {
    int v5 = [(UIWindowScene *)self screen];
    [v5 _unjailedReferenceBounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    [__UISceneEffectiveSettings((uint64_t)self) frame];
    double v11 = v14;
    double v13 = v15;
    double v7 = 0.0;
    double v9 = 0.0;
  }
  double v16 = v7;
  double v17 = v9;
  double v18 = v11;
  double v19 = v13;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)_traitOverridesDidChange:(id)a3
{
}

void __78__UIWindowScene__screenTraitCollectionWithOverridesAppliedFromSceneUISettings__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  double v13 = a3;
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = v13[2]();
  [v5 setHorizontalSizeClass:v4];

  uint64_t v6 = *(void *)(a1 + 48);
  double v7 = ((void (*)(void (**)(void)))v13[2])(v13);
  [v7 setVerticalSizeClass:v6];

  if (qword_1EB25BB18 != -1) {
    dispatch_once(&qword_1EB25BB18, &__block_literal_global_897);
  }
  if (!byte_1EB25BA6A)
  {
    uint64_t v8 = [*(id *)(a1 + 32) isCaptured];
    double v9 = v13[2]();
    [v9 setSceneCaptureState:v8];
  }
  uint64_t v10 = *(void *)(a1 + 56);
  double v11 = v13;
  if (v10)
  {
    double v12 = ((void (*)(void (**)(void)))v13[2])(v13);
    [v12 setUserInterfaceStyle:v10];

    double v11 = v13;
  }
}

- (BOOL)_usesMinimumSafeAreaInsets
{
  return 1;
}

- (id)_topVisibleWindowPassingTest:(id)a3
{
  return [(UIWindowScene *)self _topVisibleWindowEnumeratingAsCopy:0 passingTest:a3];
}

- (double)_systemMinimumMargin
{
  if (!dyld_program_sdk_at_least()) {
    return 0.0;
  }
  BOOL v3 = [(UIWindowScene *)self _displayInfoProvider];
  [v3 systemMinimumMargin];
  double v5 = v4;

  return v5;
}

- (id)coordinateSpace
{
  return self->_coordinateSpace;
}

- (int64_t)_screenRequestedOverscanCompensation
{
  return self->_screenRequestedOverscanCompensation;
}

- (CGRect)_referenceBoundsForOrientation:(int64_t)a3
{
  [(UIWindowScene *)self _referenceBounds];
  double v8 = _UIWindowConvertRectFromSceneReferenceSpaceToSceneSpace(a3, v4, v5, v6, v7, v6, v7);
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (id)_allWindowsIncludingInternalWindows:(BOOL)a3 onlyVisibleWindows:(BOOL)a4
{
  BOOL v4 = a3;
  contextBinder = self->_contextBinder;
  if (a4) {
    [(_UIContextBinder *)contextBinder attachedBindables];
  }
  else {
  double v6 = [(_UIContextBinder *)contextBinder enrolledBindables];
  }
  double v7 = v6;
  if (v4)
  {
    id v8 = v6;
  }
  else
  {
    double v9 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_546];
    id v8 = [v7 filteredArrayUsingPredicate:v9];
  }
  return v8;
}

- (id)_allWindows
{
  return [(_UIContextBinder *)self->_contextBinder enrolledBindables];
}

- (id)_screenTraitCollectionWithOverridesAppliedFromSceneUISettings
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = [a1 screen];
    BOOL v3 = [v2 traitCollection];
    if (!v3)
    {
      BOOL v4 = [a1 _FBSScene];
      double v5 = [v4 settings];
      double v6 = [v5 displayConfiguration];

      if (v6)
      {
        double v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIWindowSceneTraitCollection", &qword_1EB25BAD0) + 8);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "Computing the scene's trait collection without a valid screen is not supported! Please file a bug report for UIKit with the following log messages:", buf, 2u);
        }
        id v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIWindowSceneTraitCollection", &qword_1EB25BAD8) + 8);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v53 = a1;
          _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "Window scene: %@", buf, 0xCu);
        }
        double v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIWindowSceneTraitCollection", &qword_1EB25BAE0) + 8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v53 = v6;
          _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEFAULT, "Scene's display configuration: %@", buf, 0xCu);
        }
        double v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIWindowSceneTraitCollection", &qword_1EB25BAE8) + 8);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v53 = v2;
          _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_DEFAULT, "Scene's screen: %@", buf, 0xCu);
        }
        double v11 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIWindowSceneTraitCollection", &qword_1EB25BAF0) + 8);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          double v12 = v11;
          double v13 = [a1 session];
          double v14 = [v13 role];
          double v15 = [a1 _FBSScene];
          double v16 = [v15 settings];
          double v17 = [v16 displayIdentity];
          *(_DWORD *)buf = 138412546;
          v53 = v14;
          __int16 v54 = 2112;
          v55 = v17;
          _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_DEFAULT, "Scene's role: %@, Display identity: %@", buf, 0x16u);
        }
        double v18 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIWindowSceneTraitCollection", &qword_1EB25BAF8) + 8);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          double v19 = v18;
          uint64_t v20 = +[UIScreen _shortScreensDescription];
          *(_DWORD *)buf = 138412290;
          v53 = v20;
          _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_DEFAULT, "Connected screens: %@", buf, 0xCu);
        }
        double v21 = [MEMORY[0x1E4F28B00] currentHandler];
        v22 = [NSString stringWithUTF8String:"-[UIWindowScene _screenTraitCollectionWithOverridesAppliedFromSceneUISettings]"];
        [v21 handleFailureInFunction:v22 file:@"UIWindowScene.m" lineNumber:2869 description:@"Missing screen trait collection for window scene"];
      }
      else
      {
        uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
        double v24 = [NSString stringWithUTF8String:"-[UIWindowScene _screenTraitCollectionWithOverridesAppliedFromSceneUISettings]"];
        double v25 = [a1 _FBSScene];
        double v26 = [v25 identity];
        double v27 = [a1 _FBSScene];
        double v28 = [v27 hostHandle];
        [v23 handleFailureInFunction:v24, @"UIWindowScene.m", 2860, @"Providing a UIWindowScene with a nil displayConfiguration is not supported. THIS IS NOT A UIKIT BUG - talk to this process's scene host (%@ hosted by %@)", v26, v28 file lineNumber description];
      }
    }
    double v29 = [a1 _effectiveSettings];
    [v29 bounds];
    double v31 = v30;
    uint64_t v33 = _UIUserInterfaceSizeClassForWidth(v32);
    uint64_t v34 = _UIUserInterfaceSizeClassForHeight(v31);
    if (qword_1EB25BAC8 != -1) {
      dispatch_once(&qword_1EB25BAC8, &__block_literal_global_355_0);
    }
    uint64_t v35 = qword_1EB25BAC0;
    if (!qword_1EB25BAC0)
    {
      if ([v29 isUISubclass]) {
        uint64_t v35 = [v29 userInterfaceStyle];
      }
      else {
        uint64_t v35 = 0;
      }
    }
    uint64_t v36 = [(id)UIApp _effectiveUserInterfaceStyle];
    if (!v36 || [a1 _sceneSessionRoleIsCarPlayOrNonInteractiveExternal])
    {
      uint64_t v36 = v35;
      if (!v35)
      {
        if ([(id)objc_opt_class() _isSystemUIService]
          && ([a1 _sceneSessionRoleIsCarPlayOrNonInteractiveExternal] & 1) == 0)
        {
          v37 = (void *)a1[37];
          if (!v37)
          {
            objc_initWeak((id *)buf, a1);
            id v38 = objc_alloc(MEMORY[0x1E4FB33D0]);
            id v39 = MEMORY[0x1E4F14428];
            v50[0] = MEMORY[0x1E4F143A8];
            v50[1] = 3221225472;
            v50[2] = __78__UIWindowScene__screenTraitCollectionWithOverridesAppliedFromSceneUISettings__block_invoke;
            v50[3] = &unk_1E5309B60;
            objc_copyWeak(&v51, (id *)buf);
            uint64_t v40 = [v38 initWithChangesDeliveredOnQueue:MEMORY[0x1E4F14428] toBlock:v50];
            v41 = (void *)a1[37];
            a1[37] = v40;

            objc_destroyWeak(&v51);
            objc_destroyWeak((id *)buf);
            v37 = (void *)a1[37];
          }
          uint64_t v36 = [v37 userInterfaceStyle];
        }
        else
        {
          uint64_t v36 = 0;
        }
      }
    }
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __78__UIWindowScene__screenTraitCollectionWithOverridesAppliedFromSceneUISettings__block_invoke_2;
    v45[3] = &unk_1E5309B88;
    id v46 = v2;
    uint64_t v47 = v33;
    uint64_t v48 = v34;
    uint64_t v49 = v36;
    id v42 = v2;
    v43 = -[UITraitCollection _traitCollectionByModifyingTraitsCopyOnWrite:](v3, (uint64_t)v45);
  }
  else
  {
    v43 = 0;
  }
  return v43;
}

- (BOOL)_supportsPassthroughInteractions
{
  if (qword_1EB25BA70 != -1) {
    dispatch_once(&qword_1EB25BA70, &__block_literal_global_209_1);
  }
  BOOL v3 = [(UIScene *)self session];
  BOOL v4 = v3;
  if (v3)
  {
    double v5 = [v3 role];
    char v6 = [v5 isEqualToString:@"UIWindowSceneSessionRoleExternalDisplayNonInteractive"];
  }
  else
  {
    char v6 = 0;
  }
  BOOL v7 = 0;
  if (_MergedGlobals_59_0 && (v6 & 1) == 0) {
    BOOL v7 = [(UIWindowScene *)self _enhancedWindowingEnabled];
  }

  return v7;
}

- (BOOL)_enhancedWindowingEnabled
{
  return self->_windowSceneFlags.enhancedWindowingEnabled != 0;
}

- (void)_windowUpdatedVisibility:(id)a3
{
  id v4 = a3;
  double v5 = (void *)MEMORY[0x18C108260]();
  char v6 = [(UIScene *)self _eventDeferringManager];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__UIWindowScene__windowUpdatedVisibility___block_invoke;
  aBlock[3] = &unk_1E52D9F98;
  aBlock[4] = self;
  id v7 = v4;
  id v34 = v7;
  id v8 = (void (**)(void))_Block_copy(aBlock);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __42__UIWindowScene__windowUpdatedVisibility___block_invoke_2;
  v29[3] = &unk_1E52DCB30;
  id v9 = v6;
  id v30 = v9;
  double v10 = (UIWindow *)v7;
  double v31 = v10;
  double v32 = self;
  double v11 = (void (**)(void))_Block_copy(v29);
  if (_UIWindowSceneCompatibleIsHidden(v10))
  {
    v8[2](v8);
    [(UIWindowScene *)self _delegate_windowWillBecomeHidden:v10];
    [(_UIContextBinder *)self->_contextBinder detachBindable:v10];
  }
  else
  {
    [(UIWindowScene *)self _delegate_windowWillBecomeVisible:v10];
    [(_UIContextBinder *)self->_contextBinder attachBindable:v10];
    [(UIWindowScene *)self _delegate_windowDidBecomeVisible:v10];
    v11[2](v11);
  }
  keyWindow = self->_keyWindow;
  if (keyWindow == v10)
  {
    if (!v10) {
      goto LABEL_16;
    }
    double v28 = v5;
    double v18 = NSString;
    double v19 = self;
    uint64_t v20 = (objc_class *)objc_opt_class();
    double v21 = NSStringFromClass(v20);
    v22 = [v18 stringWithFormat:@"<%@: %p>", v21, v19];

    [v18 stringWithFormat:@"%@: Key window changed visibility: %p", v22, self->_keyWindow];
    goto LABEL_14;
  }
  if (!keyWindow && ![(UIView *)v10 isHidden])
  {
    double v28 = v5;
    keyWindowHistory = self->_keyWindowHistory;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    uint64_t v36 = ____UIWindowSceneKeyWindowHistoryContainsMatchingPointer_block_invoke;
    v37 = &__block_descriptor_40_e13_B24__0_v8_B16l;
    id v38 = v10;
    double v14 = v35;
    uint64_t v15 = [(NSPointerArray *)keyWindowHistory count];
    v39[0] = 0;
    uint64_t v16 = v15 - 1;
    while (1)
    {
      if (v16 == -1)
      {
LABEL_11:

        goto LABEL_15;
      }
      uint64_t v17 = [(NSPointerArray *)keyWindowHistory pointerAtIndex:v16];
      if (((uint64_t (*)(void *, uint64_t, char *))v36)(v14, v17, v39)) {
        break;
      }
      --v16;
      if (v39[0]) {
        goto LABEL_11;
      }
    }

    double v5 = v28;
    if (self)
    {
      if (v16 != 0x7FFFFFFFFFFFFFFFLL && !self->_keyWindow)
      {
        double v24 = NSString;
        double v19 = self;
        double v25 = (objc_class *)objc_opt_class();
        double v26 = NSStringFromClass(v25);
        v22 = [v24 stringWithFormat:@"<%@: %p>", v26, v19];

        [v24 stringWithFormat:@"%@: No current key window and previous key window became visible", v22, v27];
        uint64_t v23 = LABEL_14:;

        -[UIWindowScene _evaluateSceneKeyWindowForWindowMadeKey:consideringVisibility:findingNewKeyWindowIfNeeded:ignoringOldKeyWindow:forReason:]((id *)&v19->super.super.super.isa, 0, 1, 1, 0, v23);
LABEL_15:
        double v5 = v28;
      }
    }
  }
LABEL_16:
  -[UIWindowScene _enqueueEvaluationOfDisablesMirroring](self);
}

- (_UISceneUIWindowEventRouting)_sceneForKeyboardDisplay
{
  if (+[UIKeyboard inputUIOOP])
  {
    BOOL v3 = objc_opt_class();
    id v4 = [(UIWindowScene *)self screen];
    [v3 _keyboardWindowSceneForScreen:v4 create:0];
  }
  else
  {
    id v4 = [(UIWindowScene *)self screen];
    +[_UIRemoteKeyboards keyboardWindowSceneForScreen:v4 create:0];
  double v5 = };

  return (_UISceneUIWindowEventRouting *)v5;
}

+ (id)_unassociatedWindowSceneForScreen:(id)a3 create:(BOOL)a4
{
  return +[_UIScreenBasedWindowScene _unassociatedWindowSceneForScreen:a3 create:a4];
}

+ (id)_placeholderWindowSceneForScreen:(id)a3 create:(BOOL)a4
{
  return +[_UIScreenBasedWindowScene _unassociatedWindowSceneForScreen:a3 create:a4];
}

- (void)_delegate_windowWillBecomeVisible:(id)a3
{
  if ((*(unsigned char *)&self->_springBoardDelegateFlags & 4) != 0)
  {
    id v4 = a3;
    id v5 = [(UIScene *)self delegate];
    [v5 _windowScene:self windowWillBecomeVisible:v4];
  }
}

- (void)_delegate_windowDidBecomeVisible:(id)a3
{
  if ((*(unsigned char *)&self->_springBoardDelegateFlags & 8) != 0)
  {
    id v4 = a3;
    id v5 = [(UIScene *)self delegate];
    [v5 _windowScene:self windowDidBecomeVisible:v4];
  }
}

+ (BOOL)_hostsWindows
{
  return 1;
}

void __42__UIWindowScene__windowUpdatedVisibility___block_invoke(uint64_t a1)
{
  id v2 = [NSString stringWithFormat:@"%@: %p: end key window deferring for window hiding: %p", objc_opt_class(), *(void *)(a1 + 32), *(void *)(a1 + 40)];
  -[UIWindowScene _endEventDeferringIfNeededForWindow:withReason:](*(id **)(a1 + 32), *(void **)(a1 + 40), v2);
}

- (void)_endEventDeferringIfNeededForWindow:(void *)a3 withReason:
{
  id v10 = a2;
  id v5 = a3;
  if (a1)
  {
    char v6 = [a1 _eventDeferringManager];
    if (v6 && a1[44])
    {
      id v7 = [MEMORY[0x1E4F4F280] keyboardFocusEnvironment];
      -[_UIEventDeferringManager currentLocalDeferringTargetWindowMatchingEnvironment:deferringToken:]((uint64_t)v6, (uint64_t)v7, a1[44]);
      id v8 = (id)objc_claimAutoreleasedReturnValue();

      if (v8) {
        BOOL v9 = v8 == v10;
      }
      else {
        BOOL v9 = 0;
      }
      if (v9) {
        -[UIWindowScene _endKeyboardEnvironmentEventDeferringWithReason:]((uint64_t)a1, v5);
      }
    }
  }
}

- (void)_delegate_windowWillBecomeHidden:(id)a3
{
  if ((*(unsigned char *)&self->_springBoardDelegateFlags & 0x10) != 0)
  {
    id v4 = a3;
    id v5 = [(UIScene *)self delegate];
    [v5 _windowScene:self windowWillBecomeHidden:v4];
  }
}

- (void)_willRestoreInteractionStateForUserActivityManager:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIWindowScene;
  [(UIScene *)&v5 _willRestoreInteractionStateForUserActivityManager:a3];
  id v4 = [(UIWindowScene *)self _allWindowsIncludingInternalWindows:1 onlyVisibleWindows:1];
  [v4 enumerateObjectsUsingBlock:&__block_literal_global_692];
}

- (int64_t)_systemUserInterfaceStyle
{
  id v2 = -[UIWindowScene _screenTraitCollectionWithOverridesAppliedFromSceneUISettings](self);
  int64_t v3 = [v2 userInterfaceStyle];

  return v3;
}

- (void)_performDeferredInitialWindowUpdateForConnection
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (!self || (*((unsigned char *)&self->super._sceneFlags + 1) & 0x40) == 0)
  {
    v42.receiver = self;
    v42.super_class = (Class)UIWindowScene;
    [(UIScene *)&v42 _performDeferredInitialWindowUpdateForConnection];
    int64_t v3 = [(UIWindowScene *)self _windowSceneDelegate];
    id v4 = v3;
    if (*(unsigned char *)&self->_windowSceneFlags)
    {
      objc_super v5 = [v3 window];
      delegateWindowNeedingDeferredInitialUpdate = self->_delegateWindowNeedingDeferredInitialUpdate;
      BOOL v7 = [(NSHashTable *)self->_windowsNeedingDeferredInitialUpdateExecution containsObject:v5];
      if (v5 == delegateWindowNeedingDeferredInitialUpdate && v7) {
        [(UIWindow *)v5 makeKeyAndVisible];
      }
    }
    uint64_t v33 = v4;
    char v9 = [(id)UIApp isFrontBoard];
    id v10 = [(UIScene *)self session];
    double v11 = [v10 role];
    char v12 = [v11 isEqualToString:@"UIWindowSceneSessionRoleExternalDisplayNonInteractive"];

    double v13 = [(UIWindowScene *)self _visibleWindows];

    if ((v9 & 1) == 0 && (v12 & 1) == 0 && !v13)
    {
      double v14 = *(NSObject **)(__UILogGetCategoryCachedImpl("WindowScene", &_performDeferredInitialWindowUpdateForConnection___s_category)+ 8);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = v14;
        uint64_t v16 = [(UIScene *)self succinctDescription];
        *(_DWORD *)buf = 138412290;
        id v46 = v16;
        _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_ERROR, "Scene has no visible windows after session connection: %@", buf, 0xCu);
      }
    }
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v17 = (void *)[(NSHashTable *)self->_windowsNeedingDeferredInitialUpdateExecution copy];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v38 objects:v44 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v39;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v39 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = *(UIWindow **)(*((void *)&v38 + 1) + 8 * v21);
          if (v22 != self->_delegateWindowNeedingDeferredInitialUpdate)
          {
LABEL_21:
            [(UIWindow *)v22 _executeDeferredOrientationUpdate];
            [(NSHashTable *)self->_windowsNeedingDeferredInitialUpdateExecution removeObject:v22];
            goto LABEL_25;
          }
          uint64_t v23 = v22;
          [(UIView *)v23 alpha];
          if (v24 >= 0.01)
          {
            char IsHidden = _UIWindowSceneCompatibleIsHidden(v23);

            if ((IsHidden & 1) == 0) {
              goto LABEL_21;
            }
          }
          else
          {
          }
LABEL_25:
          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [v17 countByEnumeratingWithState:&v38 objects:v44 count:16];
      }
      while (v19);
    }

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    double v26 = self->_windowsNeedingDeferredInitialUpdateExecution;
    uint64_t v27 = [(NSHashTable *)v26 countByEnumeratingWithState:&v34 objects:v43 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v35;
      do
      {
        uint64_t v30 = 0;
        do
        {
          if (*(void *)v35 != v29) {
            objc_enumerationMutation(v26);
          }
          -[UIWindow _invalidateDeferredOrientationUpdate](*(void **)(*((void *)&v34 + 1) + 8 * v30++));
        }
        while (v28 != v30);
        uint64_t v28 = [(NSHashTable *)v26 countByEnumeratingWithState:&v34 objects:v43 count:16];
      }
      while (v28);
    }

    double v31 = self->_delegateWindowNeedingDeferredInitialUpdate;
    self->_delegateWindowNeedingDeferredInitialUpdate = 0;

    windowsNeedingDeferredInitialUpdateExecution = self->_windowsNeedingDeferredInitialUpdateExecution;
    self->_windowsNeedingDeferredInitialUpdateExecution = 0;
  }
}

- (BOOL)_shouldDeferInitialWindowUpdateBeforeConnection:(id)a3
{
  id v4 = [(UIWindowScene *)self _windowSceneDelegate];
  objc_super v5 = v4;
  BOOL v8 = (*(unsigned char *)&self->_windowSceneFlags & 1) != 0
    && ([v4 window],
        char v6 = (UIWindow *)objc_claimAutoreleasedReturnValue(),
        delegateWindowNeedingDeferredInitialUpdate = self->_delegateWindowNeedingDeferredInitialUpdate,
        v6,
        v6 == delegateWindowNeedingDeferredInitialUpdate)
    && [(UIView *)self->_delegateWindowNeedingDeferredInitialUpdate isHidden];

  return v8;
}

- (id)_windowSceneDelegate
{
  id v2 = [(UIScene *)self delegate];
  if ([v2 conformsToProtocol:&unk_1ED6D0A88]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (void)_registerSceneComponent:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIWindowScene;
  [(UIScene *)&v9 _registerSceneComponent:v6 forKey:a4];
  if (objc_opt_respondsToSelector())
  {
    id v7 = v6;
    BOOL v8 = [v7 _traitOverrides];

    if (v8) {
      [(UIWindowScene *)self _componentDidUpdateTraitOverrides:v7];
    }
  }
}

- (void)_componentDidUpdateTraitOverrides:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [(UIScene *)self _sceneComponents];
  char v6 = [v5 containsObject:v4];

  if ((v6 & 1) == 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      char v12 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        int v14 = 138412546;
        id v15 = v4;
        __int16 v16 = 2112;
        uint64_t v17 = self;
        _os_log_fault_impl(&dword_1853B0000, v12, OS_LOG_TYPE_FAULT, "Unregistered component %@ updated trait overrides for scene %@", (uint8_t *)&v14, 0x16u);
      }
    }
    else
    {
      id v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25BAB0) + 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v14 = 138412546;
        id v15 = v4;
        __int16 v16 = 2112;
        uint64_t v17 = self;
        _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "Unregistered component %@ updated trait overrides for scene %@", (uint8_t *)&v14, 0x16u);
      }
    }
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      double v13 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        int v14 = 138412546;
        id v15 = v4;
        __int16 v16 = 2112;
        uint64_t v17 = self;
        _os_log_fault_impl(&dword_1853B0000, v13, OS_LOG_TYPE_FAULT, "Component %@ updated trait overrides for scene %@, but does not respond to _traitOverrides selector", (uint8_t *)&v14, 0x16u);
      }
    }
    else
    {
      double v11 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25BAB8) + 8);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v14 = 138412546;
        id v15 = v4;
        __int16 v16 = 2112;
        uint64_t v17 = self;
        _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "Component %@ updated trait overrides for scene %@, but does not respond to _traitOverrides selector", (uint8_t *)&v14, 0x16u);
      }
    }
  }
  componentsWithTraitOverrides = self->_componentsWithTraitOverrides;
  if (!componentsWithTraitOverrides)
  {
    BOOL v8 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];
    goto LABEL_7;
  }
  if (![(NSSet *)componentsWithTraitOverrides containsObject:v4])
  {
    BOOL v8 = [(NSSet *)self->_componentsWithTraitOverrides setByAddingObject:v4];
LABEL_7:
    objc_super v9 = self->_componentsWithTraitOverrides;
    self->_componentsWithTraitOverrides = v8;
  }
  [(UIWindowScene *)self _updateSceneTraitsAndPushTraitsToScreen:0 callParentWillTransitionToTraitCollection:0];
}

- (void)_updateSceneTraitsAndPushTraitsToScreen:(BOOL)a3 callParentWillTransitionToTraitCollection:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = (void *)_UISetCurrentFallbackEnvironment(self);
  BOOL v8 = [(UIWindowScene *)self traitCollection];
  objc_super v9 = __UIWindowSceneTraitCollectionWithSceneUISettings(self);
  id v10 = v8;
  id v11 = v9;
  char v12 = v11;
  if (v10 == v11)
  {
  }
  else
  {
    if (v10 && v11)
    {
      char v13 = [v10 isEqual:v11];

      if (v13) {
        goto LABEL_14;
      }
    }
    else
    {
    }
    objc_storeStrong((id *)&self->_traitCollection, v9);
    [(UIWindowScene *)self _updateEffectiveGeometryIfNeeded];
    if (v10)
    {
      uint64_t v18 = 0;
      memset(v17, 0, sizeof(v17));
      [(UITraitCollection *)(uint64_t)v10 _createTraitTokenSetForChangesFromTraitCollection:(uint64_t)v17];
      -[_UITraitChangeRegistry traitsDidChange:forTraitEnvironment:withPreviousTraitCollection:]((uint64_t)self->_traitChangeRegistry, (uint64_t *)v17, self, v10);
      if (*(void *)&v17[0]) {
    }
      }
    int v14 = [(UIScene *)self delegate];
    if ((*(unsigned char *)&self->_windowSceneFlags & 4) != 0)
    {
      id v15 = [(UIWindowScene *)self coordinateSpace];
      objc_msgSend(v14, "windowScene:didUpdateCoordinateSpace:interfaceOrientation:traitCollection:", self, v15, -[UIWindowScene interfaceOrientation](self, "interfaceOrientation"), v10);
    }
  }
LABEL_14:
  v16.receiver = self;
  v16.super_class = (Class)UIWindowScene;
  [(UIScene *)&v16 _updateSceneTraitsAndPushTraitsToScreen:v5 callParentWillTransitionToTraitCollection:v4];
  _UIRestorePreviousFallbackEnvironment(v7);
}

- (void)_updateEffectiveGeometryIfNeeded
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = +[UIWindowSceneGeometry _calculateEffectiveGeometryForWindowScene:self];
  BOOL v4 = v3;
  if (!self->_effectiveGeometry || (objc_msgSend(v3, "isEqual:") & 1) == 0)
  {
    BOOL v5 = (void *)_UISetCurrentFallbackEnvironment(self);
    char v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 postNotificationName:@"UIWindowSceneWillUpdateEffectiveGeometryNotification" object:self userInfo:0];

    [(UIWindowScene *)self willChangeValueForKey:@"effectiveGeometry"];
    id v7 = self->_effectiveGeometry;
    objc_storeStrong((id *)&self->_effectiveGeometry, v4);
    [(UIWindowScene *)self didChangeValueForKey:@"effectiveGeometry"];
    if (v7)
    {
      id v10 = @"_UIWindowScenePreviousEffectiveGeometryKey";
      v11[0] = v7;
      BOOL v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    }
    else
    {
      BOOL v8 = 0;
    }
    objc_super v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 postNotificationName:@"UIWindowSceneDidUpdateEffectiveGeometryNotification" object:self userInfo:v8];

    _UIRestorePreviousFallbackEnvironment(v5);
  }
}

- (void)setDelegate:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIWindowScene;
  [(UIScene *)&v4 setDelegate:a3];
  [(UIWindowScene *)self _updateAllDelegateFlags];
}

- (void)_pushKeyWindow:(int)a3 ignoringOldKeyWindow:
{
  if (a1)
  {
    if (!a2)
    {
      id v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:sel__pushKeyWindow_ignoringOldKeyWindow_, a1, @"UIWindowScene.m", 1883, @"Invalid parameter not satisfying: %@", @"window" object file lineNumber description];
    }
    char v6 = [a2 windowScene];

    if (v6 == a1)
    {
      if (!a1[42])
      {
        uint64_t v7 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
        id v8 = a1[42];
        a1[42] = (id)v7;
      }
      if (a1[43] != a2)
      {
        id v9 = a1[42];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        uint64_t v17 = ____UIWindowSceneKeyWindowHistoryRemoveFirstMatchingPointer_block_invoke;
        uint64_t v18 = &__block_descriptor_40_e13_B24__0_v8_B16l;
        uint64_t v19 = a2;
        id v10 = v16;
        uint64_t v11 = [v9 count];
        char v20 = 0;
        uint64_t v12 = v11 - 1;
        while (1)
        {
          if (v12 == -1)
          {
LABEL_12:

            goto LABEL_15;
          }
          uint64_t v13 = [v9 pointerAtIndex:v12];
          if (((uint64_t (*)(void *, uint64_t, char *))v17)(v10, v13, &v20)) {
            break;
          }
          --v12;
          if (v20) {
            goto LABEL_12;
          }
        }

        if (v12 != 0x7FFFFFFFFFFFFFFFLL)
        {
          [v9 removePointerAtIndex:v12];
          [v9 compact];
        }
LABEL_15:
        [a1[42] addPointer:a2];
      }
      int v14 = [NSString stringWithFormat:@"%@: %p: Window requested to become key in scene: %p", objc_opt_class(), a1, a2];
      -[UIWindowScene _evaluateSceneKeyWindowForWindowMadeKey:consideringVisibility:findingNewKeyWindowIfNeeded:ignoringOldKeyWindow:forReason:](a1, 1, 0, 0, a3, v14);
    }
  }
}

- (UIWindowScene)initWithSession:(id)a3 connectionOptions:(id)a4
{
  id v7 = a4;
  v40.receiver = self;
  v40.super_class = (Class)UIWindowScene;
  id v8 = [(UIScene *)&v40 initWithSession:a3 connectionOptions:v7];
  id v9 = v8;
  if (!v8) {
    goto LABEL_20;
  }
  id v10 = [(UIScene *)v8 _FBSScene];
  uint64_t v11 = [v7 _specification];
  traitCollection = v9->_traitCollection;
  v9->_traitCollection = 0;

  uint64_t v13 = [v10 settings];
  int v14 = [v13 isUISubclass];

  if (v14)
  {
    id v15 = [v10 uiSettings];
    +[_UISceneLifecycleMultiplexer configureInitialDeactivationReasons:](_UISceneLifecycleMultiplexer, "configureInitialDeactivationReasons:", [v15 deactivationReasons]);
  }
  objc_super v16 = (objc_class *)[v11 sceneSubstrateClass];
  if (([(objc_class *)v16 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    long long v38 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v39 = NSStringFromClass(v16);
    [v38 handleFailureInMethod:a2, v9, @"UIWindowScene.m", 395, @"%@ is not a subclass of _UIContextBinderSubstrate", v39 object file lineNumber description];
  }
  uint64_t v17 = (void *)[[v16 alloc] initWithScene:v10];
  uint64_t v18 = [[_UIContextBinder alloc] initWithSubstrate:v17];
  contextBinder = v9->_contextBinder;
  v9->_contextBinder = v18;

  if (v14)
  {
    char v20 = [v10 uiSettings];
    uint64_t v21 = [v20 interfaceOrientationMode];

    p_metricsCalculator = (void **)&v9->_metricsCalculator;
    metricsCalculator = v9->_metricsCalculator;
    if (!metricsCalculator)
    {
      if (v21 == 100) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else
  {
    p_metricsCalculator = (void **)&v9->_metricsCalculator;
    metricsCalculator = v9->_metricsCalculator;
    if (!metricsCalculator)
    {
LABEL_11:
      [v10 uiCanReceiveDeviceOrientationEvents];
LABEL_12:
      uint64_t v24 = objc_opt_new();
      double v25 = *p_metricsCalculator;
      *p_metricsCalculator = (void *)v24;

      metricsCalculator = *p_metricsCalculator;
    }
  }
  [metricsCalculator _setScene:v9];
  double v26 = v9;
  uint64_t v27 = [_UIWindowSceneCoordinateSpace alloc];
  uint64_t v28 = [(UIScene *)v26 _settingsScene];
  uint64_t v29 = [v28 _effectiveSettings];
  uint64_t v30 = [(_UIWindowSceneCoordinateSpace *)v27 initWithWindowScene:v26 effectiveSettings:v29];

  coordinateSpace = v26->_coordinateSpace;
  v26->_coordinateSpace = (UICoordinateSpace *)v30;

  [(_UIContextBinder *)v9->_contextBinder setContextCreationPolicyHolder:v26];
  [(UIWindowScene *)v26 _setKeepContextAssociationInBackground:+[UIWindow _allWindowsKeepContextInBackground]];
  v26->_avkitRequestedOverscanCompensation = -1;
  v26->_screenRequestedOverscanCompensation = 0;
  if (v14)
  {
    double v32 = [v10 uiClientSettings];
    uint64_t v33 = [v32 displayConfigurationRequest];

    if (v33) {
      v26->_screenRequestedOverscanCompensation = [v33 overscanCompensation];
    }
    long long v34 = [v10 uiSettings];
    v26->_windowSceneFlags.enhancedWindowingEnabled = [v34 enhancedWindowingEnabled];
  }
  [(UIWindowScene *)v26 _updateAllDelegateFlags];
  if (([(id)UIApp isFrontBoard] & 1) == 0) {
    [(UIWindowScene *)v26 _computeMetrics:0];
  }
  v26->_int reachabilitySupportedCounter = 1;
  long long v35 = [[_UIAssertionController alloc] initWithAssertionSubject:v26];
  assertionController = v26->_assertionController;
  v26->_assertionController = v35;

LABEL_20:
  return v9;
}

void __34__UIWindowScene__prepareForResume__block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [*(id *)(a1 + 32) _eventDeferringManager];
  objc_super v4 = [MEMORY[0x1E4F4F280] keyboardFocusEnvironment];
  -[_UIEventDeferringManager fallbackLocalDeferringTargetWindowIfPermittedForEnvironment:](v3, v4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5) {
    BOOL v6 = v5 == v8;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    id v7 = [NSString stringWithFormat:@"%@: %p: begin fallback key window deferring for window: %p", objc_opt_class(), *(void *)(a1 + 32), v8];
    -[UIWindowScene _beginKeyboardEnvironmentEventDeferringForWindow:reason:](*(void **)(a1 + 32), (uint64_t)v8, v7);
  }
}

void __42__UIWindowScene__windowUpdatedVisibility___block_invoke_2(void *a1)
{
  id v2 = (id *)a1[4];
  id v3 = [MEMORY[0x1E4F4F280] keyboardFocusEnvironment];
  -[_UIEventDeferringManager fallbackLocalDeferringTargetWindowIfPermittedForEnvironment:](v2, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_super v4 = v6;
  if (v6 && (id)a1[5] == v6)
  {
    id v5 = [NSString stringWithFormat:@"%@: %p: begin fallback key window deferring for window: %p", objc_opt_class(), a1[6], a1[5]];
    -[UIWindowScene _beginKeyboardEnvironmentEventDeferringForWindow:reason:]((void *)a1[6], a1[5], v5);

    objc_super v4 = v6;
  }
}

- (void)_updateSpringBoardDelegateFlags
{
  if (qword_1EB25BB10 != -1) {
    dispatch_once(&qword_1EB25BB10, &__block_literal_global_869_0);
  }
  if (byte_1EB25BA69)
  {
    id v10 = [(UIScene *)self delegate];
    *(unsigned char *)&self->_springBoardDelegateFlags = *(unsigned char *)&self->_springBoardDelegateFlags & 0xFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      char v3 = 2;
    }
    else {
      char v3 = 0;
    }
    *(unsigned char *)&self->_springBoardDelegateFlags = *(unsigned char *)&self->_springBoardDelegateFlags & 0xFD | v3;
    if (objc_opt_respondsToSelector()) {
      char v4 = 4;
    }
    else {
      char v4 = 0;
    }
    *(unsigned char *)&self->_springBoardDelegateFlags = *(unsigned char *)&self->_springBoardDelegateFlags & 0xFB | v4;
    if (objc_opt_respondsToSelector()) {
      char v5 = 8;
    }
    else {
      char v5 = 0;
    }
    *(unsigned char *)&self->_springBoardDelegateFlags = *(unsigned char *)&self->_springBoardDelegateFlags & 0xF7 | v5;
    if (objc_opt_respondsToSelector()) {
      char v6 = 16;
    }
    else {
      char v6 = 0;
    }
    *(unsigned char *)&self->_springBoardDelegateFlags = *(unsigned char *)&self->_springBoardDelegateFlags & 0xEF | v6;
    if (objc_opt_respondsToSelector()) {
      char v7 = 32;
    }
    else {
      char v7 = 0;
    }
    *(unsigned char *)&self->_springBoardDelegateFlags = *(unsigned char *)&self->_springBoardDelegateFlags & 0xDF | v7;
    if (objc_opt_respondsToSelector()) {
      char v8 = 64;
    }
    else {
      char v8 = 0;
    }
    *(unsigned char *)&self->_springBoardDelegateFlags = *(unsigned char *)&self->_springBoardDelegateFlags & 0xBF | v8;
    if (objc_opt_respondsToSelector()) {
      char v9 = 0x80;
    }
    else {
      char v9 = 0;
    }
    *(unsigned char *)&self->_springBoardDelegateFlags = v9 & 0x80 | *(unsigned char *)&self->_springBoardDelegateFlags & 0x7F;
  }
}

- (void)_updateAllDelegateFlags
{
  [(UIWindowScene *)self _updateWindowSceneDelegateFlags];
  [(UIWindowScene *)self _updateSpringBoardDelegateFlags];
}

- (void)_updateWindowSceneDelegateFlags
{
  id v5 = [(UIScene *)self delegate];
  *(unsigned char *)&self->_windowSceneFlags = *(unsigned char *)&self->_windowSceneFlags & 0xFE | objc_opt_respondsToSelector() & 1;
  if (objc_opt_respondsToSelector()) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_windowSceneFlags = *(unsigned char *)&self->_windowSceneFlags & 0xFD | v3;
  if (objc_opt_respondsToSelector()) {
    char v4 = 4;
  }
  else {
    char v4 = 0;
  }
  *(unsigned char *)&self->_windowSceneFlags = *(unsigned char *)&self->_windowSceneFlags & 0xFB | v4;
}

- (void)_setKeepContextAssociationInBackground:(BOOL)a3
{
}

- (void)_computeMetrics:(BOOL)a3 withTransitionContext:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__UIWindowScene__computeMetrics_withTransitionContext___block_invoke;
  v4[3] = &unk_1E52D9FC0;
  v4[4] = self;
  BOOL v5 = a3;
  [(UIWindowScene *)self _computeTraitCollectionAndCoordinateSpaceForcingDelegateCallback:0 withAction:v4];
}

- (void)_computeTraitCollectionAndCoordinateSpaceForcingDelegateCallback:(BOOL)a3 withAction:(id)a4
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  char v6 = (void (**)(void))a4;
  id v67 = [(UIScene *)self _oldSettings];
  char v7 = [(UIWindowScene *)self traitCollection];
  v68 = [(UIWindowScene *)self coordinateSpace];
  __UIWindowSceneTraitCollectionWithSceneUISettings(self);
  char v8 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
  traitCollection = self->_traitCollection;
  self->_traitCollection = v8;

  id v10 = self;
  uint64_t v11 = [_UIWindowSceneCoordinateSpace alloc];
  uint64_t v12 = [(UIScene *)v10 _settingsScene];
  uint64_t v13 = [v12 _effectiveSettings];
  uint64_t v14 = [(_UIWindowSceneCoordinateSpace *)v11 initWithWindowScene:v10 effectiveSettings:v13];

  coordinateSpace = v10->_coordinateSpace;
  v10->_coordinateSpace = (UICoordinateSpace *)v14;

  if (v6) {
    v6[2](v6);
  }
  objc_super v16 = [(UIScene *)v10 _settingsScene];
  id v17 = (id)[v16 _effectiveSettings];

  int v18 = 1;
  if (!a3 && v67)
  {
    v65 = v6;
    uint64_t v19 = self->_traitCollection;
    char v20 = v10->_coordinateSpace;
    id v21 = v7;
    v22 = v20;
    uint64_t v23 = v19;
    [v68 bounds];
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    CGFloat v29 = v28;
    CGFloat v31 = v30;
    [(UICoordinateSpace *)v22 bounds];
    CGFloat v33 = v32;
    CGFloat v35 = v34;
    CGFloat v37 = v36;
    CGFloat v39 = v38;

    v80.origin.x = v25;
    v80.origin.y = v27;
    v80.size.width = v29;
    v80.size.height = v31;
    v81.origin.x = v33;
    v81.origin.y = v35;
    v81.size.width = v37;
    v81.size.height = v39;
    LODWORD(v22) = CGRectEqualToRect(v80, v81);
    uint64_t v40 = [v17 interfaceOrientation];
    long long v41 = v7;
    uint64_t v42 = [v67 interfaceOrientation];
    LODWORD(v19) = [v21 isEqual:v23];

    unsigned int v43 = v19 ^ 1;
    char v6 = v65;
    BOOL v44 = v40 == v42;
    char v7 = v41;
    int v45 = v22 ^ 1;
    if (!v44) {
      int v45 = 1;
    }
    int v18 = v45 | v43;
  }
  id v46 = *(NSObject **)(__UILogGetCategoryCachedImpl("InterfaceStyle", &_computeTraitCollectionAndCoordinateSpaceForcingDelegateCallback_withAction____s_category)+ 8);
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v47 = @"Should not";
    if (v18) {
      uint64_t v47 = @"Should";
    }
    v66 = v47;
    uint64_t v48 = v46;
    uint64_t v49 = [v7 userInterfaceStyle];
    v50 = v6;
    UIUserInterfaceStyle v51 = [(UITraitCollection *)self->_traitCollection userInterfaceStyle];
    v52 = v7;
    v53 = NSString;
    __int16 v54 = v10;
    v55 = (objc_class *)objc_opt_class();
    uint64_t v56 = NSStringFromClass(v55);
    v57 = [v53 stringWithFormat:@"<%@: %p>", v56, v54];

    id v58 = v57;
    v59 = [(UIScene *)v54 _persistenceIdentifier];
    *(_DWORD *)buf = 138544386;
    v70 = v66;
    __int16 v71 = 2050;
    uint64_t v72 = v49;
    __int16 v73 = 2050;
    UIUserInterfaceStyle v74 = v51;
    char v6 = v50;
    __int16 v75 = 2114;
    v76 = v57;
    char v7 = v52;
    __int16 v77 = 2114;
    v78 = v59;
    _os_log_impl(&dword_1853B0000, v48, OS_LOG_TYPE_DEFAULT, "%{public}@ send trait collection or coordinate space update, interface style %{public}ld -> %{public}ld, %{public}@ (%{public}@)", buf, 0x34u);
  }
  if (v18)
  {
    [(UIWindowScene *)v10 _updateEffectiveGeometryIfNeeded];
    if ((*(unsigned char *)&v10->_windowSceneFlags & 4) != 0)
    {
      v60 = v6;
      uint64_t v61 = _UISetCurrentFallbackEnvironment(v10);
      [(UIScene *)v10 delegate];
      v63 = v62 = v7;
      objc_msgSend(v63, "windowScene:didUpdateCoordinateSpace:interfaceOrientation:traitCollection:", v10, v68, objc_msgSend(v67, "interfaceOrientation"), v62);

      char v7 = v62;
      v64 = (void *)v61;
      char v6 = v60;
      _UIRestorePreviousFallbackEnvironment(v64);
    }
  }
}

void __55__UIWindowScene__computeMetrics_withTransitionContext___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v5 = [v2 _allWindows];
  char v3 = [*(id *)(a1 + 32) _inheritingWindowsIncludingInvisible:1];
  char v4 = [v5 arrayByAddingObjectsFromArray:v3];
  [v2 _computeMetricsForWindows:v4 animated:*(unsigned __int8 *)(a1 + 40)];
}

- (id)_inheritingWindowsIncludingInvisible:(BOOL)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  char v6 = [(UIScene *)self _interitingScenes];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = self;
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          if (a3) {
            [v11 _allWindows];
          }
          else {
          uint64_t v14 = [v11 _visibleWindows];
          }
          [v5 addObjectsFromArray:v14];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)_computeMetrics:(BOOL)a3
{
}

- (BOOL)_permitContextCreationForBindingDescription:(id *)a3
{
  if (![(UIScene *)self _hasLifecycle])
  {
    char v6 = +[_UISceneLifecycleMultiplexer sharedInstance];
    if (([v6 isActive] & 1) != 0
      || ([v6 suspendedEventsOnly] & 1) != 0
      || ([(id)UIApp _isActivating] & 1) != 0)
    {
      BOOL v5 = 1;
    }
    else
    {
      int64_t v10 = [(_UIContextBinder *)self->_contextBinder contextManagementPolicy];
      BOOL var5 = a3->var5;
      BOOL v5 = 1;
      if (!var5 && v10 != 1) {
        BOOL v5 = [(UIScene *)self _isRespondingToLifecycleEvent];
      }
    }

    return v5;
  }
  if ([(UIScene *)self _isActive]
    || [(UIScene *)self _isSuspendedEventsOnly]
    || ([(id)UIApp _isActivating] & 1) != 0)
  {
    return 1;
  }
  int64_t v8 = [(_UIContextBinder *)self->_contextBinder contextManagementPolicy];
  BOOL v9 = a3->var5;
  BOOL v5 = 1;
  if (v9 || v8 == 1) {
    return v5;
  }
  return [(UIScene *)self _isRespondingToLifecycleEvent];
}

- (UISceneSizeRestrictions)sizeRestrictions
{
  return 0;
}

- (void)_endIgnoringInteractionEventsForReason:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unsigned int userInteractionDisabledCount = self->_userInteractionDisabledCount;
  if (userInteractionDisabledCount)
  {
    unsigned int v6 = userInteractionDisabledCount - 1;
    self->_unsigned int userInteractionDisabledCount = userInteractionDisabledCount - 1;
    uint64_t v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("WindowScene", &_endIgnoringInteractionEventsForReason____s_category)+ 8);
    if (os_signpost_enabled(v7))
    {
      id v8 = v4;
      BOOL v9 = v7;
      v10[0] = 67109378;
      v10[1] = v6;
      __int16 v11 = 2080;
      uint64_t v12 = [v8 UTF8String];
      _os_signpost_emit_with_name_impl(&dword_1853B0000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "endIgnoringInteractionEvents", "level: %u; reason: %s",
        (uint8_t *)v10,
        0x12u);
    }
  }
}

- (void)_enqueueEvaluationOfDisablesMirroring
{
  if (val)
  {
    if ((val[416] & 4) == 0)
    {
      val[416] |= 4u;
      objc_initWeak(&location, val);
      uint64_t v1 = (void *)UIApp;
      v2[0] = MEMORY[0x1E4F143A8];
      v2[1] = 3221225472;
      v2[2] = __54__UIWindowScene__enqueueEvaluationOfDisablesMirroring__block_invoke;
      v2[3] = &unk_1E52DC308;
      objc_copyWeak(&v3, &location);
      [v1 _performBlockAfterCATransactionCommits:v2];
      objc_destroyWeak(&v3);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_prepareForResume
{
  v5.receiver = self;
  v5.super_class = (Class)UIWindowScene;
  [(UIScene *)&v5 _prepareForResume];
  contextBinder = self->_contextBinder;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__UIWindowScene__prepareForResume__block_invoke;
  v4[3] = &unk_1E5309AF8;
  v4[4] = self;
  [(_UIContextBinder *)contextBinder createContextsWithTest:0 creationAction:v4];
}

- (BOOL)_windowsIgnoreSceneClientOrientation
{
  return 0;
}

- (NSArray)windows
{
  return (NSArray *)[(UIWindowScene *)self _allWindowsIncludingInternalWindows:0 onlyVisibleWindows:0];
}

- (void)_computeMetricsForWindows:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Window", &qword_1EB25BAA0);
  id v8 = *(id *)(CategoryCachedImpl + 8);
  os_signpost_id_t v9 = os_signpost_id_make_with_pointer(*(os_log_t *)(CategoryCachedImpl + 8), self);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v10 = v9;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1853B0000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "UpdateSceneMetrics", "", buf, 2u);
    }
  }

  metricsCalculator = self->_metricsCalculator;
  if (v4) {
    uint64_t v12 = [(UIScene *)self _isSuspendedUnderLock] ^ 1;
  }
  else {
    uint64_t v12 = 0;
  }
  [(_UISceneMetricsCalculating *)metricsCalculator _updateMetricsOnWindows:v6 animated:v12];
  unint64_t v13 = __UILogGetCategoryCachedImpl("Window", &qword_1EB25BAA8);
  uint64_t v14 = *(id *)(v13 + 8);
  os_signpost_id_t v15 = os_signpost_id_make_with_pointer(*(os_log_t *)(v13 + 8), self);
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v16 = v15;
    if (os_signpost_enabled(v14))
    {
      *(_WORD *)long long v17 = 0;
      _os_signpost_emit_with_name_impl(&dword_1853B0000, v14, OS_SIGNPOST_INTERVAL_END, v16, "UpdateSceneMetrics", "", v17, 2u);
    }
  }
}

- (_UISystemAppearanceManager)_systemAppearanceManager
{
  return (_UISystemAppearanceManager *)[(UIScene *)self _sceneComponentForKey:_UISystemAppearanceManagerWindowSceneComponentKey];
}

- (BOOL)_windowIsFront:(id)a3
{
  return [(_UIContextBinder *)self->_contextBinder bindableIsTopmostAttached:a3];
}

- (void)_windowUpdatedProperties:(id)a3
{
}

- (BOOL)_isUserInteractionEnabled
{
  return self->_userInteractionDisabledCount == 0;
}

- (id)_windowOrientationPreferencesObserver
{
  if ((*(unsigned char *)&self->_springBoardDelegateFlags & 0x40) != 0)
  {
    BOOL v4 = [(UIScene *)self delegate];
    objc_initWeak(&location, v4);

    objc_initWeak(&from, self);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __54__UIWindowScene__windowOrientationPreferencesObserver__block_invoke;
    v13[3] = &unk_1E53099D0;
    objc_super v5 = &v14;
    objc_copyWeak(&v14, &from);
    id v6 = &v15;
    objc_copyWeak(&v15, &location);
    v13[4] = self;
    uint64_t v7 = v13;
  }
  else
  {
    if ((*(unsigned char *)&self->_springBoardDelegateFlags & 0x80) == 0)
    {
      id v3 = 0;
      goto LABEL_7;
    }
    id v8 = [(UIScene *)self delegate];
    objc_initWeak(&location, v8);

    objc_initWeak(&from, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __54__UIWindowScene__windowOrientationPreferencesObserver__block_invoke_2;
    aBlock[3] = &unk_1E53099F8;
    objc_super v5 = &v11;
    objc_copyWeak(&v11, &from);
    id v6 = &v12;
    objc_copyWeak(&v12, &location);
    uint64_t v7 = aBlock;
  }
  id v3 = _Block_copy(v7);
  objc_destroyWeak(v6);
  objc_destroyWeak(v5);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
LABEL_7:
  return v3;
}

- (int64_t)_interfaceOrientationForSupportedOrientations:(unint64_t)a3 preferredOrientation:(int64_t)a4
{
  uint64_t v7 = [(UIScene *)self _effectiveUISettings];
  id v8 = [v7 interfaceOrientationMapResolver];

  if (v8) {
    uint64_t v9 = [v8 interfaceOrientationForSupportedOrientations:a3 preferredOrientation:a4];
  }
  else {
    uint64_t v9 = objc_msgSend((id)UIApp, "_fallbackInterfaceOrientationForSupportedOrientations:preferredOrientation:currentOrientation:", a3, a4, -[UIWindowScene interfaceOrientation](self, "interfaceOrientation"));
  }
  int64_t v10 = v9;

  return v10;
}

- (BOOL)_shouldDeferInitialWindowUpdateBeforeConnectionAndTrackIfNeeded:(id)a3
{
  id v4 = a3;
  if (self && (*((unsigned char *)&self->super._sceneFlags + 1) & 0x40) != 0
    || ![(UIWindowScene *)self _shouldDeferInitialWindowUpdateBeforeConnection:v4])
  {
    BOOL v5 = 0;
  }
  else
  {
    -[UIWindowScene _addWindowNeedingDeferredInitialUpdateExecution:]((uint64_t)self, v4);
    BOOL v5 = 1;
  }

  return v5;
}

- (UIFocusSystem)focusSystem
{
  id v2 = [(UIScene *)self _focusSystemSceneComponent];
  id v3 = [v2 focusSystem];

  return (UIFocusSystem *)v3;
}

- (void)_evaluateSceneKeyWindowForWindowMadeKey:(char)a3 consideringVisibility:(int)a4 findingNewKeyWindowIfNeeded:(int)a5 ignoringOldKeyWindow:(void *)a6 forReason:
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  v55 = a6;
  uint64_t v9 = (objc_class *)objc_opt_class();
  Name = class_getName(v9);
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("KeyWindow", &qword_1EB25BA90);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    v52 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      CGRect v80 = v55;
      _os_log_impl(&dword_1853B0000, v52, OS_LOG_TYPE_ERROR, "Evaluating scene key window for reason: %{public}@", buf, 0xCu);
    }
  }
  id v58 = [MEMORY[0x1E4F28EB8] defaultCenter];
  int v57 = _UIWindowKeyWindowAPIIsSceneLevel();
  v74[0] = 0;
  v74[1] = v74;
  v74[2] = 0x2020000000;
  v74[3] = 0;
  id v11 = [a1 _FBSScene];
  BOOL v12 = v11 == 0;

  if (v12)
  {
    int IsExtension = _UIApplicationIsExtension();
    if ((IsExtension | _UIApplicationMayVendViews()) == 1)
    {
      id v14 = [a1 screen];
      id v15 = +[_UIScreenBasedWindowScene _unassociatedWindowSceneForScreen:v14 create:0];

      BOOL v12 = v15 == a1;
      if (v15 == a1) {
        uint64_t v16 = 1;
      }
      else {
        uint64_t v16 = -1;
      }

      goto LABEL_10;
    }
    BOOL v12 = 0;
  }
  uint64_t v16 = -1;
LABEL_10:
  [a1[42] compact];
  id v17 = a1[42];
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v69 = __138__UIWindowScene__evaluateSceneKeyWindowForWindowMadeKey_consideringVisibility_findingNewKeyWindowIfNeeded_ignoringOldKeyWindow_forReason___block_invoke;
  v70 = &unk_1E5309A80;
  __int16 v71 = v74;
  uint64_t v72 = v16;
  char v73 = a3;
  long long v18 = v68;
  uint64_t v19 = [v17 count];
  buf[0] = 0;
  uint64_t v20 = v19 - 1;
  while (1)
  {
    if (v20 == -1)
    {
LABEL_14:

LABEL_15:
      v22 = 0;
      goto LABEL_18;
    }
    uint64_t v21 = [v17 pointerAtIndex:v20];
    if (v69((uint64_t)v18, (void *)v21, buf)) {
      break;
    }
    --v20;
    if (buf[0]) {
      goto LABEL_14;
    }
  }

  if (v20 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_15;
  }
  v22 = (void *)[a1[42] pointerAtIndex:v20];
LABEL_18:
  id v23 = v22;
  if (v23) {
    int v24 = 1;
  }
  else {
    int v24 = v12;
  }
  if (v24) {
    id v25 = v23;
  }
  else {
    id v25 = 0;
  }
  if ((v24 & 1) == 0 && a4)
  {
    id v26 = a1[43];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __138__UIWindowScene__evaluateSceneKeyWindowForWindowMadeKey_consideringVisibility_findingNewKeyWindowIfNeeded_ignoringOldKeyWindow_forReason___block_invoke_2;
    aBlock[3] = &unk_1E52E0620;
    void aBlock[4] = v26;
    CGFloat v27 = _Block_copy(aBlock);
    uint64_t v28 = -[UIWindowScene _findNewKeyWindowPassingTest:](a1, v27);
    id v25 = (id)v28;
    if (v28)
    {
      id v29 = a1[42];
      v75[0] = MEMORY[0x1E4F143A8];
      v75[1] = 3221225472;
      v76 = ____UIWindowSceneKeyWindowHistoryRemoveFirstMatchingPointer_block_invoke;
      __int16 v77 = &__block_descriptor_40_e13_B24__0_v8_B16l;
      uint64_t v78 = v28;
      double v30 = v75;
      uint64_t v31 = [v29 count];
      buf[0] = 0;
      uint64_t v32 = v31 - 1;
      while (1)
      {
        if (v32 == -1)
        {
LABEL_31:

          goto LABEL_34;
        }
        uint64_t v33 = [v29 pointerAtIndex:v32];
        if (((uint64_t (*)(void *, uint64_t, uint8_t *))v76)(v30, v33, buf)) {
          break;
        }
        --v32;
        if (buf[0]) {
          goto LABEL_31;
        }
      }

      if (v32 != 0x7FFFFFFFFFFFFFFFLL)
      {
        [v29 removePointerAtIndex:v32];
        [v29 compact];
      }
LABEL_34:
      [a1[42] addPointer:v25];
    }
  }
  double v34 = (objc_class *)objc_opt_class();
  class_getName(v34);
  id v35 = a1[43];
  BOOL v36 = v25 != v35;
  BOOL v37 = v25 != v35 && v25 != 0;
  if (v57 && v37) {
    [v58 postNotificationName:@"_UIWindowWillBecomeKeyNotification" object:v25];
  }
  if (a5) {
    id v38 = 0;
  }
  else {
    id v38 = a1[43];
  }
  id v39 = v38;
  a1[43] = v25;
  id v40 = v25;
  if (v25 != v35)
  {
    if (v25)
    {
      long long v41 = (objc_class *)objc_opt_class();
      uint64_t v42 = class_getName(v41);
    }
    else
    {
      uint64_t v42 = "(nil)";
    }
    unsigned int v43 = *(id *)(__UILogGetCategoryCachedImpl("KeyWindow", &qword_1EB25BA98) + 8);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      id v44 = a1[43];
      int v45 = [v44 _contextId];
      uint64_t v46 = [v55 UTF8String];
      *(_DWORD *)buf = 136447490;
      CGRect v80 = Name;
      __int16 v81 = 2050;
      v82 = a1;
      __int16 v83 = 2082;
      v84 = v42;
      __int16 v85 = 2050;
      id v86 = v44;
      __int16 v87 = 1026;
      int v88 = v45;
      __int16 v89 = 2082;
      uint64_t v90 = v46;
      _os_log_impl(&dword_1853B0000, v43, OS_LOG_TYPE_DEFAULT, "%{public}s: %{public}p: Window became key in scene: %{public}s: %{public}p; contextId: 0x%{public}X: reason: %{public}s",
        buf,
        0x3Au);
    }

    id v40 = a1[43];
  }
  id v47 = v40;
  uint64_t v48 = (char *)+[_UIKeyWindowEvaluator sharedEvaluator];
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __138__UIWindowScene__evaluateSceneKeyWindowForWindowMadeKey_consideringVisibility_findingNewKeyWindowIfNeeded_ignoringOldKeyWindow_forReason___block_invoke_271;
  v65[3] = &unk_1E5309AA8;
  BOOL v66 = v37;
  v65[4] = a1;
  v65[5] = a1;
  v65[6] = v47;
  v65[7] = Name;
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __138__UIWindowScene__evaluateSceneKeyWindowForWindowMadeKey_consideringVisibility_findingNewKeyWindowIfNeeded_ignoringOldKeyWindow_forReason___block_invoke_2_275;
  v62[3] = &unk_1E5309AD0;
  char v63 = v57;
  BOOL v64 = v36;
  v62[4] = v39;
  v62[5] = a1;
  v62[6] = v58;
  v62[7] = Name;
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __138__UIWindowScene__evaluateSceneKeyWindowForWindowMadeKey_consideringVisibility_findingNewKeyWindowIfNeeded_ignoringOldKeyWindow_forReason___block_invoke_276;
  v59[3] = &unk_1E52DD128;
  char v60 = v57;
  BOOL v61 = v37;
  v59[4] = v47;
  v59[5] = v58;
  uint64_t v49 = v55;
  UIUserInterfaceStyle v51 = v49;
  if (v48) {
    -[_UIKeyWindowEvaluator evaluateApplicationKeyWindowForWindowScene:withWindowMadeKey:sceneKeyWindowActions:ignoringOldKeyWindow:sceneResignKeyWindowActions:andSceneBecomeKeyWindowActions:forReason:](v48, a1, a2, (uint64_t)v65, a5, (uint64_t)v62, (uint64_t)v59, v50, v49, 2);
  }
  else {

  }
  _Block_object_dispose(v74, 8);
}

uint64_t __138__UIWindowScene__evaluateSceneKeyWindowForWindowMadeKey_consideringVisibility_findingNewKeyWindowIfNeeded_ignoringOldKeyWindow_forReason___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == *(void *)(a1 + 40))
  {
    uint64_t v3 = 0;
    *a3 = 1;
  }
  else
  {
    id v5 = a2;
    unsigned int v6 = objc_msgSend(v5, sel_allowsWeakReference);
    if (v5) {
      unsigned int v7 = v6;
    }
    else {
      unsigned int v7 = 0;
    }
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      int v8 = [v5 _canPromoteFromKeyWindowStack];
    }
    else {
      int v8 = 1;
    }
    if (*(unsigned char *)(a1 + 48)) {
      int v9 = _UIWindowSceneCompatibleIsHidden(v5) ^ 1;
    }
    else {
      int v9 = 1;
    }
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    unsigned int v10 = v8 & v9;
    if (v7) {
      uint64_t v3 = v10;
    }
    else {
      uint64_t v3 = 0;
    }
  }
  return v3;
}

uint64_t __138__UIWindowScene__evaluateSceneKeyWindowForWindowMadeKey_consideringVisibility_findingNewKeyWindowIfNeeded_ignoringOldKeyWindow_forReason___block_invoke_2_275(uint64_t result)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(result + 64))
  {
    uint64_t v1 = result;
    if (*(unsigned char *)(result + 65))
    {
      CGRect result = *(void *)(result + 32);
      if (result)
      {
        id v2 = (objc_class *)objc_opt_class();
        Name = class_getName(v2);
        unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("KeyWindow", _UIInternalPreference_DisablePassthroughWindow_block_invoke_4___s_category);
        if (*(unsigned char *)CategoryCachedImpl)
        {
          id v5 = *(NSObject **)(CategoryCachedImpl + 8);
          if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          {
            uint64_t v6 = *(void *)(v1 + 56);
            unsigned int v7 = *(void **)(v1 + 32);
            uint64_t v8 = *(void *)(v1 + 40);
            int v9 = v5;
            int v10 = 136447234;
            uint64_t v11 = v6;
            __int16 v12 = 2050;
            uint64_t v13 = v8;
            __int16 v14 = 2082;
            id v15 = Name;
            __int16 v16 = 2050;
            id v17 = v7;
            __int16 v18 = 1026;
            int v19 = [v7 _contextId];
            _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "%{public}s: %{public}p: Window resigning key in scene: <%{public}s: %{public}p>; contextId: 0x%{public}X",
              (uint8_t *)&v10,
              0x30u);
          }
        }
        [*(id *)(v1 + 32) resignKeyWindow];
        return [*(id *)(v1 + 48) postNotificationName:@"UIWindowDidResignKeyNotification" object:*(void *)(v1 + 32)];
      }
    }
  }
  return result;
}

uint64_t __138__UIWindowScene__evaluateSceneKeyWindowForWindowMadeKey_consideringVisibility_findingNewKeyWindowIfNeeded_ignoringOldKeyWindow_forReason___block_invoke_276(uint64_t result)
{
  if (*(unsigned char *)(result + 48))
  {
    uint64_t v1 = result;
    if (*(unsigned char *)(result + 49))
    {
      [*(id *)(result + 32) becomeKeyWindow];
      uint64_t v3 = *(void *)(v1 + 32);
      id v2 = *(void **)(v1 + 40);
      return [v2 postNotificationName:@"UIWindowDidBecomeKeyNotification" object:v3];
    }
  }
  return result;
}

void __138__UIWindowScene__evaluateSceneKeyWindowForWindowMadeKey_consideringVisibility_findingNewKeyWindowIfNeeded_ignoringOldKeyWindow_forReason___block_invoke_271(uint64_t a1, int a2)
{
  id v4 = [*(id *)(a1 + 32) _eventDeferringManager];
  id v5 = -[_UIEventDeferringManager internalBehavior](v4);
  int v6 = [v5 wantsLocalCompatibilityRules];

  if (*(unsigned char *)(a1 + 64) || (v6 & a2) != 0)
  {
    id v8 = [MEMORY[0x1E4F4F280] keyboardFocusEnvironment];
    unsigned int v7 = [NSString stringWithFormat:@"%s: %p: Begin event deferring in %@ for window: %p", *(void *)(a1 + 56), *(void *)(a1 + 40), v8, *(void *)(a1 + 48)];
    -[UIWindowScene _beginKeyboardEnvironmentEventDeferringForWindow:reason:](*(void **)(a1 + 40), *(void *)(a1 + 48), v7);
  }
}

- (void)_beginKeyboardEnvironmentEventDeferringForWindow:(void *)a3 reason:
{
  if (a1)
  {
    if (!a2)
    {
      id v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:sel__beginKeyboardEnvironmentEventDeferringForWindow_reason_, a1, @"UIWindowScene.m", 1815, @"Invalid parameter not satisfying: %@", @"window" object file lineNumber description];
    }
    id v5 = [a1 _eventDeferringManager];
    if (v5)
    {
      uint64_t v6 = a1[44];
      __int16 v18 = v5;
      if (v6)
      {
        uint64_t v7 = -[_UIEventDeferringManager beginAndEndLocalEventDeferringForToken:withReason:](v5, v6, a3);
        id v8 = (void *)a1[44];
        a1[44] = v7;
      }
      else
      {
        int v9 = (void *)MEMORY[0x1E4F1CAD0];
        int v10 = [MEMORY[0x1E4F4F280] keyboardFocusEnvironment];
        id v8 = [v9 setWithObject:v10];

        id v11 = v18[13];
        int v12 = [v11 wantsSystemKeyCommandOverlayRules];

        if (v12)
        {
          uint64_t v13 = objc_msgSend(MEMORY[0x1E4F4F280], "ui_systemKeyCommandOverlayEnvironment");
          uint64_t v14 = [v8 setByAddingObject:v13];

          id v8 = (void *)v14;
        }
        uint64_t v15 = -[_UIEventDeferringManager beginLocalEventDeferringInEnvironments:forOwningInterfaceElement:withReason:](v18, v8, a1, a3);
        __int16 v16 = (void *)a1[44];
        a1[44] = v15;
      }
      id v5 = v18;
    }
  }
}

- (void)_keyWindowDidBecomeApplicationKeyWithoutEvaluationRequest
{
  if (a1)
  {
    id v2 = [a1 _eventDeferringManager];
    uint64_t v3 = -[_UIEventDeferringManager internalBehavior](v2);
    int v4 = [v3 wantsLocalCompatibilityRules];

    if (v4)
    {
      if (a1[43])
      {
        id v5 = (objc_class *)objc_opt_class();
        Name = class_getName(v5);
        id v8 = [MEMORY[0x1E4F4F280] keyboardFocusEnvironment];
        uint64_t v7 = [NSString stringWithFormat:@"%s: %p: Begin event deferring in %@ for key window becoming application key: %p", Name, a1, v8, a1[43]];
        -[UIWindowScene _beginKeyboardEnvironmentEventDeferringForWindow:reason:](a1, a1[43], v7);
      }
    }
  }
}

- (int64_t)interfaceElementCategory
{
  return 1;
}

void __61__UIWindowScene__setSystemVolumeHUDEnabled_forAudioCategory___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (!*(unsigned char *)(a1 + 40))
  {
    id v5 = [v3 audioCategoriesDisablingVolumeHUD];
    if ([v5 count])
    {
      uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v5];
      id v4 = (id)v6;
      if (!*(unsigned char *)(a1 + 41))
      {
        if (v6)
        {
LABEL_14:
          [v4 addObject:*(void *)(a1 + 32)];
LABEL_15:

          goto LABEL_16;
        }
LABEL_13:
        id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        goto LABEL_14;
      }
    }
    else
    {
      if (!*(unsigned char *)(a1 + 41)) {
        goto LABEL_13;
      }
      id v4 = 0;
    }
    [v4 removeObject:*(void *)(a1 + 32)];
    if (![v4 count])
    {

      id v4 = 0;
    }
    goto LABEL_15;
  }
  if (*(unsigned char *)(a1 + 41))
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1CA80] set];
  }
LABEL_16:
  uint64_t v7 = [v4 allObjects];
  [v8 setAudioCategoriesDisablingVolumeHUD:v7];
}

uint64_t __53__UIWindowScene__setReachabilitySupported_forReason___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setReachabilitySupported:*(unsigned __int8 *)(a1 + 32)];
}

- (void)_beginIgnoringInteractionEventsForReason:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unsigned int userInteractionDisabledCount = self->_userInteractionDisabledCount;
  self->_unsigned int userInteractionDisabledCount = userInteractionDisabledCount + 1;
  uint64_t v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("WindowScene", &_beginIgnoringInteractionEventsForReason____s_category)+ 8);
  if (os_signpost_enabled(v6))
  {
    id v7 = v4;
    id v8 = v6;
    v9[0] = 67109378;
    v9[1] = userInteractionDisabledCount;
    __int16 v10 = 2080;
    uint64_t v11 = [v7 UTF8String];
    _os_signpost_emit_with_name_impl(&dword_1853B0000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "beginIgnoringInteractionEvents", "level: %u; reason: %s",
      (uint8_t *)v9,
      0x12u);
  }
}

+ (void)initialize
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    unsigned int outCount = 0;
    self;
    id v4 = (objc_class *)objc_claimAutoreleasedReturnValue();
    id v5 = class_copyMethodList(v4, &outCount);

    if (v5)
    {
      if (outCount)
      {
        for (unint64_t i = 0; i < outCount; ++i)
        {
          id v7 = v5[i];
          Name = method_getName(v7);
          if ((+[UIWindowScene instancesRespondToSelector:Name] & 1) == 0)
          {
            Implementation = method_getImplementation(v7);
            TypeEncoding = method_getTypeEncoding(v7);
            if (Name && Implementation != 0)
            {
              uint64_t v12 = TypeEncoding;
              self;
              uint64_t v13 = (objc_class *)objc_claimAutoreleasedReturnValue();
              class_addMethod(v13, Name, Implementation, v12);

              if (os_variant_has_internal_diagnostics())
              {
                id v17 = __UIFaultDebugAssertLog();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
                {
                  __int16 v18 = NSStringFromSelector(Name);
                  *(_DWORD *)buf = 138412290;
                  uint64_t v21 = v18;
                  _os_log_fault_impl(&dword_1853B0000, v17, OS_LOG_TYPE_FAULT, "COMPATIBILITY BUG IN CLIENT OF UIKIT: Moving method %@ from UICanvas to UIWindowScene", buf, 0xCu);
                }
              }
              else
              {
                uint64_t v14 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &initialize___s_category) + 8);
                if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v15 = v14;
                  __int16 v16 = NSStringFromSelector(Name);
                  *(_DWORD *)buf = 138412290;
                  uint64_t v21 = v16;
                  _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_ERROR, "COMPATIBILITY BUG IN CLIENT OF UIKIT: Moving method %@ from UICanvas to UIWindowScene", buf, 0xCu);
                }
              }
            }
          }
        }
      }
      free(v5);
    }
  }
}

uint64_t __49__UIWindowScene__supportsPassthroughInteractions__block_invoke()
{
  v0 = _UIMainBundleIdentifier();
  int v1 = [v0 isEqualToString:@"com.apple.assistivetouchd"];

  uint64_t result = [(id)UIApp _isSpringBoard];
  if ((result & 1) != 0
    || (uint64_t result = +[UIApplication _isSystemUIService],
        (result & 1) != 0)
    || (uint64_t result = +[UIApplication _isUIKitSystemProcess],
        ((result | v1) & 1) != 0))
  {
    char v3 = 0;
  }
  else
  {
    uint64_t result = _UIInternalPreferenceUsesDefault(&_UIInternalPreference_DisablePassthroughWindow, @"DisablePassthroughWindow", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
    if (byte_1EB257914) {
      char v3 = result;
    }
    else {
      char v3 = 1;
    }
  }
  _MergedGlobals_59_0 = v3;
  return result;
}

- (BOOL)_isKeyWindowScene
{
  +[UIWindowScene _keyWindowScene]();
  char v3 = (UIWindowScene *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = v3 == self;

  return (char)self;
}

- (double)_adjustedLevelForWindow:(id)a3 preferredLevel:(double)a4
{
  if ((*(unsigned char *)&self->_springBoardDelegateFlags & 0x20) != 0)
  {
    id v6 = a3;
    id v7 = [(UIScene *)self delegate];
    [v7 _windowScene:self levelForWindow:v6 preferredLevel:a4];
    a4 = v8;
  }
  return a4;
}

- (void)_attachWindow:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = [(UIScene *)self _hasInvalidated];
  if (!dyld_program_sdk_at_least())
  {
    if (v6)
    {
      uint64_t v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_attachWindow____s_category) + 8);
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      int v9 = v15;
      __int16 v16 = [(UIScene *)self succinctDescription];
      *(_DWORD *)buf = 138412546;
      __int16 v18 = v16;
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "Attempting to attach window to an invalidated scene: %@; window: %@",
        buf,
        0x16u);

      goto LABEL_13;
    }
LABEL_5:
    int v9 = [v5 windowScene];
    char v10 = [v9 isEqual:self];
    if ((v10 & 1) == 0)
    {
      [v9 _detachWindow:v5];
      [(UIWindowScene *)self _delegate_windowWillAttach:v5];
      [(UIScene *)self __captureWindow:v5];
      [(_UIContextBinder *)self->_contextBinder enrollBindable:v5];
      [v5 _didMoveFromScene:v9 toScene:self];
    }
    if ((_UIWindowSceneCompatibleIsHidden(v5) & 1) == 0)
    {
      [(UIWindowScene *)self _delegate_windowWillBecomeVisible:v5];
      [(_UIContextBinder *)self->_contextBinder attachBindable:v5];
      [(UIWindowScene *)self _delegate_windowDidBecomeVisible:v5];
      uint64_t v11 = [(UIScene *)self _eventDeferringManager];
      uint64_t v12 = [MEMORY[0x1E4F4F280] keyboardFocusEnvironment];
      -[_UIEventDeferringManager fallbackLocalDeferringTargetWindowIfPermittedForEnvironment:](v11, v12);
      id v13 = (id)objc_claimAutoreleasedReturnValue();

      if ((v10 & 1) == 0 && v13 && v13 == v5)
      {
        uint64_t v14 = [NSString stringWithFormat:@"%@: %p: begin fallback event deferring for window: %p", objc_opt_class(), self, v5];
        -[UIWindowScene _beginKeyboardEnvironmentEventDeferringForWindow:reason:](self, (uint64_t)v5, v14);
      }
    }
LABEL_13:

    goto LABEL_14;
  }
  if (!v6) {
    goto LABEL_5;
  }
  id v7 = [MEMORY[0x1E4F28B00] currentHandler];
  double v8 = [(UIScene *)self succinctDescription];
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIWindowScene.m", 1038, @"Attempting to attach window to an invalidated scene: %@; window: %@",
    v8,
    v5);

LABEL_14:
}

- (void)_delegate_windowWillAttach:(id)a3
{
  if (*(unsigned char *)&self->_springBoardDelegateFlags)
  {
    id v4 = a3;
    id v5 = [(UIScene *)self delegate];
    [v5 _windowScene:self windowWillAttach:v4];
  }
}

void __55__UIWindowScene_UIScreenshotService__screenshotService__block_invoke()
{
  uint64_t v0 = objc_opt_class();
  id v1 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  +[UIScene _registerSceneComponentClass:v0 withKey:@"_UIScreenshotServiceComponentKey" predicate:v1];
}

uint64_t __52__UIWindowScene__internalOverrideUserInterfaceStyle__block_invoke()
{
  if (_UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_ForcedWindowSceneInterfaceStyle, @"ForcedWindowSceneInterfaceStyle", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateId))uint64_t v0 = 0; {
  else
  }
    uint64_t v0 = (void *)qword_1EB257920;
  uint64_t result = _UIUserInterfaceStyleFromString(v0);
  qword_1EB25BAC0 = result;
  return result;
}

- (BOOL)_subclassTracksWindowsNeedingDeferredInitialUpdates
{
  return 1;
}

- (void)_finishSceneConnection
{
  v3.receiver = self;
  v3.super_class = (Class)UIWindowScene;
  [(UIScene *)&v3 _finishSceneConnection];
  -[UIWindowScene _configurePassthroughWindowIfNeeded]((id *)&self->super.super.super.isa);
}

- (void)_configurePassthroughWindowIfNeeded
{
  if (!a1) {
    return;
  }
  if ([a1 _supportsPassthroughInteractions])
  {
    id v2 = [a1 traitCollection];
    uint64_t v3 = [v2 userInterfaceIdiom];
    BOOL v4 = v3 != 3;

    id v5 = a1[49];
    BOOL v6 = v5 == 0;
    if (v5) {
      BOOL v7 = 1;
    }
    else {
      BOOL v7 = v3 == 3;
    }
    if (!v7)
    {
      double v8 = [[_UIWindowSystemOverlayWindow alloc] initWithWindowScene:a1];
      id v9 = a1[49];
      a1[49] = v8;

      char v10 = [a1[49] layer];
      [v10 setAllowsHitTesting:0];

      [a1[49] _setWindowHostingScene:a1];
      [a1[49] setHidden:0];
      id v11 = a1[49];
      [v11 setWindowLevel:10000002.0];
      return;
    }
  }
  else
  {
    BOOL v4 = 0;
    id v5 = a1[49];
    BOOL v6 = v5 == 0;
  }
  if (!v6 && !v4)
  {
    [v5 _setWindowHostingScene:0];
    id v12 = a1[49];
    a1[49] = 0;
  }
}

- (void)setActivityItemsConfigurationSource:(id)activityItemsConfigurationSource
{
}

- (void)_readySceneForConnection
{
  v6.receiver = self;
  v6.super_class = (Class)UIWindowScene;
  [(UIScene *)&v6 _readySceneForConnection];
  uint64_t v3 = [(UIScene *)self session];
  BOOL v4 = [v3 configuration];
  id v5 = [v4 storyboard];
  [(UIWindowScene *)self _loadWindowWithStoryboardIfNeeded:v5];
}

- (void)_loadWindowWithStoryboardIfNeeded:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4 && [(UIWindowScene *)self _shouldLoadStoryboard])
  {
    id v5 = [v4 instantiateInitialViewController];
    if (!v5)
    {
      id v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("WindowScene", &qword_1EB25BA88) + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = v12;
        uint64_t v14 = [v4 name];
        *(_DWORD *)id v17 = 138412290;
        *(void *)&v17[4] = v14;
        _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "Failed to instantiate the default view controller for UIMainStoryboardFile '%@' - perhaps the designated entry point is not set?", v17, 0xCu);
      }
      goto LABEL_20;
    }
    objc_super v6 = [(UIWindowScene *)self _windowSceneDelegate];
    BOOL v7 = v6;
    if (v6)
    {
      char windowSceneFlags = (char)self->_windowSceneFlags;
      if (windowSceneFlags)
      {
        id v9 = [v6 window];
        if (v9)
        {
          char v10 = v9;
          [(UIWindow *)v9 setWindowScene:self];
          id v11 = [(UIWindowScene *)self coordinateSpace];
          [v11 bounds];
          -[UIWindow setFrame:](v10, "setFrame:");

LABEL_19:
          -[UIWindow setRootViewController:](v10, "setRootViewController:", v5, *(void *)v17);

LABEL_20:
          goto LABEL_21;
        }
        char windowSceneFlags = (char)self->_windowSceneFlags;
      }
      if ((windowSceneFlags & 2) != 0)
      {
        char v10 = [[UIWindow alloc] initWithWindowScene:self];
        [v7 setWindow:v10];
        objc_storeStrong((id *)&self->_delegateWindowNeedingDeferredInitialUpdate, v10);
        -[UIWindowScene _addWindowNeedingDeferredInitialUpdateExecution:]((uint64_t)self, self->_delegateWindowNeedingDeferredInitialUpdate);
        goto LABEL_19;
      }
      uint64_t v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("WindowScene", &qword_1EB25BA78) + 8);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v17 = 0;
        __int16 v16 = "The scene delegate must implement the window property if it wants to use a main storyboard file.";
        goto LABEL_16;
      }
    }
    else
    {
      uint64_t v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("WindowScene", &qword_1EB25BA80) + 8);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v17 = 0;
        __int16 v16 = "There is no scene delegate set. A scene delegate class must be specified to use a main storyboard file.";
LABEL_16:
        _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_ERROR, v16, v17, 2u);
      }
    }
    char v10 = 0;
    goto LABEL_19;
  }
LABEL_21:
}

- (void)_addWindowNeedingDeferredInitialUpdateExecution:(uint64_t)a1
{
  id v3 = a2;
  if (a1 && (*(unsigned char *)(a1 + 217) & 0x40) == 0)
  {
    id v4 = *(void **)(a1 + 368);
    id v7 = v3;
    if (!v4)
    {
      uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      objc_super v6 = *(void **)(a1 + 368);
      *(void *)(a1 + 368) = v5;

      id v4 = *(void **)(a1 + 368);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (BOOL)_shouldLoadStoryboard
{
  return 1;
}

- (void)_setBackgroundStyle:(int64_t)a3
{
  if ([(UIWindowScene *)self _backgroundStyle] != a3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __37__UIWindowScene__setBackgroundStyle___block_invoke;
    v5[3] = &__block_descriptor_40_e89_B24__0__UIMutableApplicationSceneClientSettings_8__UIApplicationSceneTransitionContext_16l;
    v5[4] = a3;
    [(UIScene *)self _updateUIClientSettingsWithUITransitionBlock:v5];
  }
}

- (int64_t)_backgroundStyle
{
  id v2 = [(UIScene *)self _effectiveUIClientSettings];
  int64_t v3 = [v2 backgroundStyle];

  return v3;
}

- (id)_editMenuSceneComponent
{
  id v2 = self;
  if (+[_UIRemoteKeyboards enabled]
    && ((char v3 = [(id)UIApp isFrontBoard], -[UIScene _hasSettingsScene](v2, "_hasSettingsScene"))
     || (v3 & 1) != 0))
  {
    objc_super v6 = [(UIWindowScene *)v2 _sceneForKeyboardDisplay];

    if (v6 == v2)
    {
      id v7 = +[UIWindowScene _keyWindowScene]();
      id v4 = [v7 _editMenuSceneComponent];

      if (v4) {
        goto LABEL_7;
      }
    }
  }
  else
  {
  }
  id v4 = [(UIScene *)v2 _sceneComponentForKey:@"_UIEditMenuSceneComponentKey"];
  if (!v4)
  {
    id v4 = [[_UIEditMenuSceneComponent alloc] initWithScene:v2];
    [(UIWindowScene *)v2 _registerSceneComponent:v4 forKey:@"_UIEditMenuSceneComponentKey"];
  }
LABEL_7:
  return v4;
}

uint64_t __111__UIWindowScene__UISceneEnhancedStateRestoration_Internal___willRestoreInteractionStateForUserActivityManager___block_invoke(uint64_t a1, void *a2)
{
  return [a2 layoutIfNeeded];
}

- (void)_setSystemVolumeHUDEnabled:(BOOL)a3
{
}

- (UIScreenshotService)screenshotService
{
  if (screenshotService_onceToken != -1) {
    dispatch_once(&screenshotService_onceToken, &__block_literal_global_229);
  }
  return (UIScreenshotService *)[(UIScene *)self _sceneComponentForKey:@"_UIScreenshotServiceComponentKey"];
}

- (void)_showProgressWhenFetchingUserActivityForTypes:(id)a3
{
}

- (UIAlertControllerStackManager)_alertControllerStackManager
{
  return (UIAlertControllerStackManager *)[(UIScene *)self _sceneComponentForKey:_UIAlertControllerStackManagerCanvasComponentKey];
}

- (id)canvasToolbar
{
  return 0;
}

- (int64_t)state
{
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v5 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v5, OS_LOG_TYPE_FAULT, "Calling deprecated SPI on UICanvas. This method and class will dissapear prior to GM", buf, 2u);
    }
  }
  else
  {
    char v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &state___s_category) + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)objc_super v6 = 0;
      _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_ERROR, "Calling deprecated SPI on UICanvas. This method and class will dissapear prior to GM", v6, 2u);
    }
  }
  return [(UIScene *)self activationState];
}

- (BOOL)isKeyCanvas
{
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v5 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v5, OS_LOG_TYPE_FAULT, "Calling deprecated SPI on UICanvas. This method and class will dissapear prior to GM", buf, 2u);
    }
  }
  else
  {
    char v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &isKeyCanvas___s_category) + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)objc_super v6 = 0;
      _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_ERROR, "Calling deprecated SPI on UICanvas. This method and class will dissapear prior to GM", v6, 2u);
    }
  }
  return [(UIWindowScene *)self _isKeyWindowScene];
}

+ (id)_canvasForScene:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_diagnostics())
  {
    id v12 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v12, OS_LOG_TYPE_FAULT, "Calling deprecated SPI on UICanvas. This method and class will dissapear prior to GM", buf, 2u);
    }
  }
  else
  {
    objc_super v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_canvasForScene____s_category) + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "Calling deprecated SPI on UICanvas. This method and class will dissapear prior to GM", v13, 2u);
    }
  }
  id v7 = [a1 _sceneForFBSScene:v5];

  if (v7)
  {
    double v8 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      char v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2 object:a1 file:@"UICanvas.m" lineNumber:79 description:@"Attempting at access invalid frame class from legacy path. Please use non-deprecated methods"];
    }
  }
  return v7;
}

- (_UICanvasDefinition)_definition
{
  if (os_variant_has_internal_diagnostics())
  {
    objc_super v6 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v6, OS_LOG_TYPE_FAULT, "Calling deprecated SPI on UICanvas. This method and class will dissapear prior to GM", buf, 2u);
    }
  }
  else
  {
    char v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_definition___s_category) + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_ERROR, "Calling deprecated SPI on UICanvas. This method and class will dissapear prior to GM", v7, 2u);
    }
  }
  id v4 = [(UIScene *)self session];
  return (_UICanvasDefinition *)v4;
}

- (FBSScene)_scene
{
  if (os_variant_has_internal_diagnostics())
  {
    objc_super v6 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v6, OS_LOG_TYPE_FAULT, "Calling deprecated SPI on UICanvas. This method and class will dissapear prior to GM", buf, 2u);
    }
  }
  else
  {
    char v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_scene___s_category) + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_ERROR, "Calling deprecated SPI on UICanvas. This method and class will dissapear prior to GM", v7, 2u);
    }
  }
  id v4 = [(UIScene *)self _FBSScene];
  return (FBSScene *)v4;
}

- (id)_contentSizePreferenceProvider
{
  id v2 = [(UIScene *)self _FBSScene];
  uint64_t v3 = objc_opt_class();
  id v4 = [v2 componentForExtension:v3 ofClass:objc_opt_class()];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;

  return v8;
}

- (_UIWindowSceneTransitionCoordinator)_transitionCoordinator
{
  id v2 = [(UIScene *)self _FBSScene];
  uint64_t v3 = objc_opt_class();
  id v4 = [v2 componentForExtension:v3 ofClass:objc_opt_class()];

  return (_UIWindowSceneTransitionCoordinator *)v4;
}

- (id)_screenshotServiceIfPresent
{
  return [(UIScene *)self _sceneComponentForKey:@"_UIScreenshotServiceComponentKey"];
}

- (id)_playbackControlsStateManager
{
  uint64_t v3 = [(UIScene *)self _sceneComponentForKey:@"_UIPlaybackControlsStateManagerSceneComponentKey"];
  if (!v3)
  {
    uint64_t v3 = [[_UIPlaybackControlsStateManager alloc] initWithScene:self];
    [(UIWindowScene *)self _registerSceneComponent:v3 forKey:@"_UIPlaybackControlsStateManagerSceneComponentKey"];
  }
  return v3;
}

- (id)_alwaysOnEnvironment
{
  return [(UIScene *)self _sceneComponentForKey:@"_UIBacklightEnvironmentComponentKey"];
}

- (id)_sceneMaskingCoordinator
{
  id v2 = [(UIScene *)self _FBSScene];
  uint64_t v3 = objc_opt_class();
  id v4 = [v2 componentForExtension:v3 ofClass:objc_opt_class()];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;

  return v8;
}

- (_UISearchActivityManager)_searchActivityManager
{
  uint64_t v3 = [(UIScene *)self _sceneComponentForKey:@"_UISearchActivityStateManagerSceneComponentKey"];
  if (!v3)
  {
    uint64_t v3 = [[_UISearchActivityManager alloc] initWithScene:self];
    [(UIWindowScene *)self _registerSceneComponent:v3 forKey:@"_UISearchActivityStateManagerSceneComponentKey"];
  }
  return v3;
}

- (id)_contextMenuSceneComponent
{
  id v2 = self;
  if (+[_UIRemoteKeyboards enabled]
    && ((char v3 = [(id)UIApp isFrontBoard], -[UIScene _hasSettingsScene](v2, "_hasSettingsScene"))
     || (v3 & 1) != 0))
  {
    id v6 = [(UIWindowScene *)v2 _sceneForKeyboardDisplay];

    if (v6 == v2)
    {
      id v7 = +[UIWindowScene _keyWindowScene]();
      id v4 = [v7 _contextMenuSceneComponent];

      if (v4) {
        goto LABEL_7;
      }
    }
  }
  else
  {
  }
  id v4 = [(UIScene *)v2 _sceneComponentForKey:@"_UIContextMenuSceneComponentKey"];
  if (!v4)
  {
    id v4 = [[_UIContextMenuSceneComponent alloc] initWithScene:v2];
    [(UIWindowScene *)v2 _registerSceneComponent:v4 forKey:@"_UIContextMenuSceneComponentKey"];
  }
LABEL_7:
  return v4;
}

- (_UIBannerManager)_bannerManager
{
  return (_UIBannerManager *)[(UIScene *)self _sceneComponentForKey:_UIBannerManagerWindowSceneComponentKey];
}

- (void)_hostTraitCollectionDidChange:(id)a3
{
  objc_storeStrong((id *)&self->_overrideParentTraitCollection, a3);
  [(UIWindowScene *)self _updateSceneTraitsAndPushTraitsToScreen:0 callParentWillTransitionToTraitCollection:0];
}

- (id)_systemInputActivityManager
{
  char v3 = [(UIScene *)self _sceneComponentForKey:@"_UISystemInputActivityStateManagerSceneComponentKey"];
  if (!v3)
  {
    char v3 = [[_UISystemInputActivityManager alloc] initWithScene:self];
    [(UIWindowScene *)self _registerSceneComponent:v3 forKey:@"_UISystemInputActivityStateManagerSceneComponentKey"];
  }
  return v3;
}

- (void)_invalidate
{
  if (self->_keyboardEventDeferringToken)
  {
    char v3 = [NSString stringWithFormat:@"%@: %p: end event deferring for scene invalidation", objc_opt_class(), self];
    -[UIWindowScene _endKeyboardEnvironmentEventDeferringWithReason:]((uint64_t)self, v3);
  }
  componentsWithTraitOverrides = self->_componentsWithTraitOverrides;
  self->_componentsWithTraitOverrides = 0;

  v6.receiver = self;
  v6.super_class = (Class)UIWindowScene;
  [(UIScene *)&v6 _invalidate];
  uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self];
}

- (void)_endKeyboardEnvironmentEventDeferringWithReason:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = *(void *)(a1 + 352);
    uint64_t v7 = (uint64_t)v3;
    if (!v4)
    {
      objc_super v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:sel__endKeyboardEnvironmentEventDeferringWithReason_, a1, @"UIWindowScene.m", 1857, @"%s: Invalid request to ending event deferring without having begun: reason: %@", "-[UIWindowScene _endKeyboardEnvironmentEventDeferringWithReason:]", v7 object file lineNumber description];

      uint64_t v4 = *(void *)(a1 + 352);
    }
    -[_UIEventDeferringOwnershipToken endEventDeferringWithReason:](v4, v7);
    uint64_t v5 = *(void **)(a1 + 352);
    *(void *)(a1 + 352) = 0;

    id v3 = (id)v7;
  }
}

- (id)registerForTraitChanges:(id)a3 withHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = +[UITraitCollection _traitTokensIncludingPlaceholdersForTraits:]((uint64_t)UITraitCollection, a3);
  id v8 = [(UIWindowScene *)self _registerForTraitTokenChanges:v7 withHandler:v6];

  return v8;
}

- (id)registerForTraitChanges:(id)a3 withTarget:(id)a4 action:(SEL)a5
{
  id v8 = a4;
  id v9 = +[UITraitCollection _traitTokensIncludingPlaceholdersForTraits:]((uint64_t)UITraitCollection, a3);
  char v10 = [(UIWindowScene *)self _registerForTraitTokenChanges:v9 withTarget:v8 action:a5];

  return v10;
}

- (id)registerForTraitChanges:(id)a3 withAction:(SEL)a4
{
  id v6 = +[UITraitCollection _traitTokensIncludingPlaceholdersForTraits:]((uint64_t)UITraitCollection, a3);
  uint64_t v7 = [(UIWindowScene *)self _registerForTraitTokenChanges:v6 withTarget:self action:a4];

  return v7;
}

- (id)_registerForTraitTokenChanges:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  traitChangeRegistry = self->_traitChangeRegistry;
  if (!traitChangeRegistry)
  {
    id v9 = objc_alloc_init(_UITraitChangeRegistry);
    char v10 = self->_traitChangeRegistry;
    self->_traitChangeRegistry = v9;

    traitChangeRegistry = self->_traitChangeRegistry;
  }
  id v11 = -[_UITraitChangeRegistry registerForTraitTokenChanges:withHandler:]((uint64_t)traitChangeRegistry, v6, v7);

  return v11;
}

- (id)_registerForTraitTokenChanges:(id)a3 withTarget:(id)a4 action:(SEL)a5
{
  id v8 = a3;
  id v9 = (UIWindowScene *)a4;
  traitChangeRegistry = self->_traitChangeRegistry;
  if (!traitChangeRegistry)
  {
    id v11 = objc_alloc_init(_UITraitChangeRegistry);
    id v12 = self->_traitChangeRegistry;
    self->_traitChangeRegistry = v11;

    traitChangeRegistry = self->_traitChangeRegistry;
  }
  id v13 = -[_UITraitChangeRegistry registerForTraitTokenChanges:withTarget:action:targetIsSender:]((uint64_t)traitChangeRegistry, v8, v9, a5, v9 == self);

  return v13;
}

- (void)unregisterForTraitChanges:(id)a3
{
}

- (void)_registerAuxiliaryChildEnvironmentForTraitInvalidations:(id)a3
{
  id v4 = a3;
  traitChangeRegistry = self->_traitChangeRegistry;
  id v8 = v4;
  if (!traitChangeRegistry)
  {
    id v6 = objc_alloc_init(_UITraitChangeRegistry);
    id v7 = self->_traitChangeRegistry;
    self->_traitChangeRegistry = v6;

    id v4 = v8;
    traitChangeRegistry = self->_traitChangeRegistry;
  }
  -[_UITraitChangeRegistry registerAuxiliaryChildEnvironmentForTraitInvalidations:]((uint64_t)traitChangeRegistry, v4);
}

- (void)_unregisterAuxiliaryChildEnvironmentForTraitInvalidations:(id)a3
{
}

- (UISceneWindowingBehaviors)windowingBehaviors
{
  return 0;
}

- (id)_windowingBehaviorsNotInstantiating
{
  return 0;
}

- (void)requestGeometryUpdateWithPreferences:(UIWindowSceneGeometryPreferences *)geometryPreferences errorHandler:(void *)errorHandler
{
  id v8 = geometryPreferences;
  id v6 = errorHandler;
  if ([(UIWindowSceneGeometryPreferences *)v8 _type] == 2)
  {
    [(UIWindowScene *)self _performIOSGeometryRequestWithPreferences:v8 errorHandler:v6];
  }
  else if (v6)
  {
    id v7 = _UISceneErrorWithCode(100);
    v6[2](v6, v7);
  }
}

- (void)_performIOSGeometryRequestWithPreferences:(id)a3 errorHandler:(id)a4
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v6 interfaceOrientations];
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Orientation", &_performIOSGeometryRequestWithPreferences_errorHandler____s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    int v24 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      id v25 = v24;
      id v26 = _UIInterfaceOrientationMaskDebugDescription(v8);
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v26;
      _os_log_impl(&dword_1853B0000, v25, OS_LOG_TYPE_ERROR, "Received geometry update request with interface orientations: %{public}@", (uint8_t *)location, 0xCu);
    }
  }
  if (v8)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __72__UIWindowScene__performIOSGeometryRequestWithPreferences_errorHandler___block_invoke;
    aBlock[3] = &unk_1E52F31C8;
    id v33 = v7;
    char v10 = _Block_copy(aBlock);
    if ([(UIScene *)self _canDynamicallySpecifySupportedInterfaceOrientations])
    {
      id v11 = [(UIScene *)self _effectiveUIClientSettings];
      unint64_t v12 = [v11 supportedInterfaceOrientations];

      if (!v12 || (v12 & v8) != 0)
      {
        objc_initWeak(location, self);
        id v23 = (void *)UIApp;
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __72__UIWindowScene__performIOSGeometryRequestWithPreferences_errorHandler___block_invoke_133;
        v28[3] = &unk_1E52FD268;
        objc_copyWeak(&v31, location);
        id v29 = v6;
        id v30 = v10;
        [v23 _performBlockAfterCATransactionCommits:v28];

        objc_destroyWeak(&v31);
        objc_destroyWeak(location);
      }
      else
      {
        id v13 = _UIInterfaceOrientationMaskDebugDescription([v6 interfaceOrientations]);
        CGFloat v27 = _UIInterfaceOrientationMaskDebugDescription(v12);
        _UILocalizedFormat(@"UIWindowScene.interfaceOrientationsNotSupported", @"Error for attempting a geometry request with interface orientations that are not supported by the scene's view controller.", @"None of the requested orientations are supported by the view controller. Requested: %@; Supported: %@",
          v14,
          v15,
          v16,
          v17,
          v18,
        __int16 v19 = (uint64_t)v13);

        id v20 = _UISceneErrorWithCodeAndDescription(101, v19);
        (*((void (**)(void *, void *))v10 + 2))(v10, v20);
      }
    }
    else
    {
      uint64_t v21 = _UILocalizedString(@"UIWindowScene.orientationRequestNotAllowed", @"Error for attempting a geometry request for a window scene that must support all orientations", @"The current windowing mode does not allow for programmatic changes to interface orientation.");
      uint64_t v22 = _UISceneErrorWithCodeAndDescription(101, v21);
      (*((void (**)(void *, void *))v10 + 2))(v10, v22);
    }
  }
}

void __72__UIWindowScene__performIOSGeometryRequestWithPreferences_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Orientation", &_UIInternalPreference_ShouldWriteCompatibilityEventDeferringRulesForAllProcesses_block_invoke___s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    id v6 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = v6;
      unint64_t v8 = [v3 localizedDescription];
      int v9 = 138543362;
      char v10 = v8;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "_UIOrientationRequestAction failed with error: %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __72__UIWindowScene__performIOSGeometryRequestWithPreferences_errorHandler___block_invoke_133(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    id v3 = [_UIOrientationRequestAction alloc];
    uint64_t v4 = [a1[4] interfaceOrientations];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    _DWORD v9[2] = __72__UIWindowScene__performIOSGeometryRequestWithPreferences_errorHandler___block_invoke_2;
    v9[3] = &unk_1E52EE548;
    id v10 = a1[5];
    uint64_t v5 = [(_UIOrientationRequestAction *)v3 initWithRequestedInterfaceOrientationMask:v4 completion:v9];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __72__UIWindowScene__performIOSGeometryRequestWithPreferences_errorHandler___block_invoke_136;
    v7[3] = &unk_1E52E07A0;
    unint64_t v8 = v5;
    id v6 = v5;
    [WeakRetained _updateUIClientSettingsWithUITransitionBlock:v7];
  }
}

void __72__UIWindowScene__performIOSGeometryRequestWithPreferences_errorHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 error];
  if (v3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Orientation", &_UIInternalPreference_ShouldWriteCompatibilityEventDeferringRulesForAllProcesses_block_invoke_2___s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      uint64_t v5 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v6 = 0;
        _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "_UIOrientationRequestAction completed successfully.", v6, 2u);
      }
    }
  }
}

uint64_t __72__UIWindowScene__performIOSGeometryRequestWithPreferences_errorHandler___block_invoke_136(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Orientation", &_UIInternalPreference_ShouldWriteCompatibilityEventDeferringRulesForAllProcesses_block_invoke_3___s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    unint64_t v8 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = 138543362;
      uint64_t v11 = v9;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "Sending _UIOrientationRequestAction: %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }
  id v6 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 32)];
  [v4 setActions:v6];

  return 0;
}

- (UIWindowSceneGeometry)effectiveGeometry
{
  id v2 = [(UIWindowScene *)self _trueEffectiveGeometry];
  id v3 = (void *)[v2 copy];

  return (UIWindowSceneGeometry *)v3;
}

uint64_t __37__UIWindowScene__setBackgroundStyle___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  [a2 setBackgroundStyle:v4];
  id v6 = +[UIView _currentAnimationSettings];
  [v5 setAnimationSettings:v6];

  return 1;
}

- (BOOL)_keepContextAssociationInBackground
{
  return [(_UIContextBinder *)self->_contextBinder contextManagementPolicy] == 1;
}

- (void)_delegate_windowWillDetach:(id)a3
{
  if (*(unsigned char *)&self->_springBoardDelegateFlags)
  {
    id v4 = a3;
    id v5 = [(UIScene *)self delegate];
    [v5 _windowScene:self windowWillDetach:v4];
  }
}

void __54__UIWindowScene__windowOrientationPreferencesObserver__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v9 = v8;
  if (WeakRetained && v8) {
    [v8 _windowScene:*(void *)(a1 + 32) window:v10 didUpdateSupportedInterfaceOrientations:a3 preferredOrientation:a4];
  }
}

void __54__UIWindowScene__windowOrientationPreferencesObserver__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = v6;
  if (WeakRetained && v6) {
    [v6 _windowScene:WeakRetained window:v8 didUpdateSupportedInterfaceOrientations:a3];
  }
}

- (void)_screenDidChangeFromScreen:(id)a3 toScreen:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [(UIScene *)self _FBSScene];
  id v10 = +[UIScreen _screenForScene:v9];

  if (v10 != v8)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIWindowScene.m", 1020, @"The changed screen does not match the screen from our scene: newScreen %@; screenFromFBSScene: %@; self: %@",
      v8,
      v10,
      self);
  }
  objc_storeStrong((id *)&self->_screen, a4);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v11 = [(UIWindowScene *)self _allWindows];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * v15++) _didMoveFromScreen:v7 toScreen:v8];
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }

  [(UIWindowScene *)self _computeTraitCollectionAndCoordinateSpaceForcingDelegateCallback:1 withAction:0];
}

uint64_t __54__UIWindowScene__enqueueEvaluationOfDisablesMirroring__block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 _canDisableMirroring];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

uint64_t __54__UIWindowScene__enqueueEvaluationOfDisablesMirroring__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setDisablesMirroring:*(unsigned __int8 *)(a1 + 32)];
}

- (void)_detachWindow:(id)a3
{
  id v4 = a3;
  [(UIWindowScene *)self _delegate_windowWillDetach:v4];
  id v6 = [NSString stringWithFormat:@"%@: %p: end event deferring for detaching window: %p", objc_opt_class(), self, v4];
  -[UIWindowScene _endEventDeferringIfNeededForWindow:withReason:]((id *)&self->super.super.super.isa, v4, v6);
  id v5 = [NSString stringWithFormat:@"%@: %p: Remove detaching window from key window history: %p", objc_opt_class(), self, v4];
  -[UIWindowScene _removeWindowFromKeyWindowHistoryFindingNewKeyWindowIfNeeded:ignoringOldKeyWindow:forReason:]((id *)&self->super.super.super.isa, v4, 0, v5);
  [(UIWindowScene *)self _delegate_windowWillBecomeHidden:v4];
  [(_UIContextBinder *)self->_contextBinder expellBindable:v4];
  [(UIScene *)self __releaseWindow:v4];

  -[UIWindowScene _enqueueEvaluationOfDisablesMirroring](self);
}

- (void)_removeWindowFromKeyWindowHistoryFindingNewKeyWindowIfNeeded:(int)a3 ignoringOldKeyWindow:(void *)a4 forReason:
{
  if (a1)
  {
    id v8 = [a2 windowScene];
    if (v8 == a1)
    {
      uint64_t v9 = [a1[42] count];

      if (v9)
      {
        id v10 = a2;
        id v11 = a1[42];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        long long v17 = ____UIWindowSceneKeyWindowHistoryRemoveFirstMatchingPointer_block_invoke;
        long long v18 = &__block_descriptor_40_e13_B24__0_v8_B16l;
        id v19 = v10;
        uint64_t v12 = v16;
        uint64_t v13 = [v11 count];
        char v20 = 0;
        uint64_t v14 = v13 - 1;
        while (1)
        {
          if (v14 == -1)
          {
LABEL_11:

            goto LABEL_14;
          }
          uint64_t v15 = [v11 pointerAtIndex:v14];
          if (((uint64_t (*)(void *, uint64_t, char *))v17)(v12, v15, &v20)) {
            break;
          }
          --v14;
          if (v20) {
            goto LABEL_11;
          }
        }

        if (v14 != 0x7FFFFFFFFFFFFFFFLL)
        {
          [v11 removePointerAtIndex:v14];
          [v11 compact];
        }
LABEL_14:
        if (a1[43] == v10) {
          -[UIWindowScene _evaluateSceneKeyWindowForWindowMadeKey:consideringVisibility:findingNewKeyWindowIfNeeded:ignoringOldKeyWindow:forReason:](a1, 0, 1, 1, a3, a4);
        }
      }
    }
    else
    {
    }
  }
}

+ (void)_updateVisibleSceneAndWindowOrderWithTest:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if ((_updateVisibleSceneAndWindowOrderWithTest__updating & 1) == 0)
  {
    _updateVisibleSceneAndWindowOrderWithTest__updating = 1;
    id v5 = (void *)UIApp;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __59__UIWindowScene__updateVisibleSceneAndWindowOrderWithTest___block_invoke;
    v6[3] = &unk_1E52DA040;
    id v7 = v3;
    [v5 _performBlockAfterCATransactionCommits:v6];
  }
}

void __59__UIWindowScene__updateVisibleSceneAndWindowOrderWithTest___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = +[UIScene _scenesIncludingInternal:](UIWindowScene, "_scenesIncludingInternal:", 1, 0);
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
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) _updateVisibleWindowOrderWithTest:*(void *)(a1 + 32)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }

  _updateVisibleSceneAndWindowOrderWithTest__updating = 0;
}

- (void)_updateVisibleWindowOrderWithTest:(id)a3
{
}

- (id)_allWindowsForInvalidation
{
  return [(_UIContextBinder *)self->_contextBinder enrolledUnsafeUnretainedBindables];
}

- (UIActivityItemsConfigurationReading)_activityItemsConfiguration
{
  uint64_t v3 = [(UIWindowScene *)self activityItemsConfigurationSource];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = _UIEffectiveActivityItemsConfiguration(v3);
  }
  else
  {
    uint64_t v6 = -[UIWindowScene _keyWindow]((id *)&self->super.super.super.isa);
    uint64_t v5 = [v6 _activityItemsConfigurationForScene];
  }
  return (UIActivityItemsConfigurationReading *)v5;
}

- (BOOL)_isInLiveResize
{
  id v2 = [(UIScene *)self _effectiveUISettings];
  char v3 = [v2 inLiveResize];

  return v3;
}

- (void)_inLiveResizeDidChange
{
  if (a1)
  {
    int v2 = [a1 _isInLiveResize];
    char v3 = @"UIWindowSceneDidEndLiveResizeNotification";
    if (v2) {
      char v3 = @"UIWindowSceneDidBeginLiveResizeNotification";
    }
    uint64_t v4 = (void *)MEMORY[0x1E4F28EB8];
    uint64_t v5 = v3;
    id v6 = [v4 defaultCenter];
    [v6 postNotificationName:v5 object:a1];
  }
}

- (id)_holdLiveResizeSnapshotForReason:(id)a3
{
  return [(_UIAssertionController *)self->_assertionController vendAssertionOfType:0 initialState:1 reason:a3];
}

- (void)_computeMetricsAndCrossFadeInLiveResize:(BOOL)a3 withTransitionContext:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  long long v7 = [(UIScene *)self _effectiveUISettings];
  int v8 = [v7 inLiveResize];

  if (v8)
  {
    if (self->_liveResizeSnapshot)
    {
      long long v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("LiveResize", &_computeMetricsAndCrossFadeInLiveResize_withTransitionContext____s_category)+ 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v14 = 0;
        _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEFAULT, "Laying out window scene to new size before finished rendering at previous size.", v14, 2u);
      }
    }
    else
    {
      long long v10 = [(UIWindowScene *)self _topVisibleWindowPassingTest:&__block_literal_global_203_3];
      id v11 = v10;
      if (v10)
      {
        _makeUISceneViewForLiveResize(v10);
        uint64_t v12 = (UIView *)objc_claimAutoreleasedReturnValue();
        if ((_os_feature_enabled_impl() & 1) == 0) {
          -[UIWindow _insertLiveResizeSnapshot:](v11, v12);
        }
        liveResizeSnapshot = self->_liveResizeSnapshot;
        self->_liveResizeSnapshot = v12;
      }
    }
    [(UIWindowScene *)self _computeMetrics:v4 withTransitionContext:v6];
    if (*((unsigned char *)&self->_windowSceneFlags + 8)) {
      *(unsigned char *)&self->_windowSceneFlags |= 0x10u;
    }
    else {
      [(UIWindowScene *)self _scheduleResizeFinishedActionAndFadeOutSnapshot];
    }
  }
  else
  {
    [(UIWindowScene *)self _computeMetrics:v4 withTransitionContext:v6];
  }
}

BOOL __79__UIWindowScene__computeMetricsAndCrossFadeInLiveResize_withTransitionContext___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 _isSceneSized])
  {
    char v3 = [v2 rootViewController];
    BOOL v4 = v3 != 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)_scheduleResizeFinishedActionAndFadeOutSnapshot
{
  char v3 = [(UIScene *)self _FBSScene];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__UIWindowScene__scheduleResizeFinishedActionAndFadeOutSnapshot__block_invoke;
  v14[3] = &unk_1E52D9F70;
  id v4 = v3;
  id v15 = v4;
  [(UIScene *)self _scheduleSceneEventResponseWithResponseBlock:v14];
  liveResizeSnapshot = self->_liveResizeSnapshot;
  if (liveResizeSnapshot)
  {
    id v6 = liveResizeSnapshot;
    long long v7 = self->_liveResizeSnapshot;
    self->_liveResizeSnapshot = 0;

    if (_UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_LiveResizeCrossFadeDuration, @"LiveResizeCrossFadeDuration", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))double v8 = 0.1; {
    else
    }
      double v8 = *(double *)&qword_1E8FD54D8;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __64__UIWindowScene__scheduleResizeFinishedActionAndFadeOutSnapshot__block_invoke_3;
    v12[3] = &unk_1E52D9F70;
    uint64_t v13 = v6;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    _DWORD v10[2] = __64__UIWindowScene__scheduleResizeFinishedActionAndFadeOutSnapshot__block_invoke_4;
    v10[3] = &unk_1E52DC3A0;
    id v11 = v13;
    long long v9 = v13;
    +[UIView animateWithDuration:v12 animations:v10 completion:v8];
  }
}

void __64__UIWindowScene__scheduleResizeFinishedActionAndFadeOutSnapshot__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__UIWindowScene__scheduleResizeFinishedActionAndFadeOutSnapshot__block_invoke_2;
  block[3] = &unk_1E52D9F70;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __64__UIWindowScene__scheduleResizeFinishedActionAndFadeOutSnapshot__block_invoke_2(uint64_t a1)
{
  id v4 = [[_UISceneResizeFinishedAction alloc] initWithInfo:0 responder:0];
  id v2 = *(void **)(a1 + 32);
  char v3 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];
  [v2 sendActions:v3];
}

uint64_t __64__UIWindowScene__scheduleResizeFinishedActionAndFadeOutSnapshot__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void __64__UIWindowScene__scheduleResizeFinishedActionAndFadeOutSnapshot__block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) window];
  -[UIWindow _removeLiveResizeSnapshot:]((uint64_t)v2, *(void **)(a1 + 32));
}

- (void)_setEnhancedWindowingEnabled:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  unsigned int enhancedWindowingEnabled = self->_windowSceneFlags.enhancedWindowingEnabled;
  self->_windowSceneFlags.unsigned int enhancedWindowingEnabled = a3;
  if (enhancedWindowingEnabled != a3)
  {
    -[UIWindowScene _configurePassthroughWindowIfNeeded]((id *)&self->super.super.super.isa);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v5 = [(UIWindowScene *)self _allWindows];
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
          -[UIWindow _configurePassthroughInteractionIfNeeded](*(id **)(*((void *)&v11 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }

    long long v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 postNotificationName:@"_UIWindowSceneEnhancedWindowingModeChanged" object:self];
  }
}

- (void)_performAfterSystemSnapshotsComplete:(id)a3
{
  id v5 = a3;
  if ([(UIScene *)self activationState] != UISceneActivationStateBackground)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"UIWindowScene.m" lineNumber:1463 description:@"_performAfterSystemSnapshotsComplete should only be called on a background scene"];
  }
  uint64_t v6 = [(id)UIApp _beginBackgroundTaskWithName:@"com.apple.UIKit.PostSnapshottingAction" expirationHandler:0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  _DWORD v9[2] = __54__UIWindowScene__performAfterSystemSnapshotsComplete___block_invoke;
  v9[3] = &unk_1E52DA9A8;
  id v10 = v5;
  uint64_t v11 = v6;
  id v7 = v5;
  [(UIScene *)self _enqueuePostSettingsUpdateResponseBlock:v9 inPhase:0x1ED0EB300];
}

uint64_t __54__UIWindowScene__performAfterSystemSnapshotsComplete___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = (void *)UIApp;
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 _endBackgroundTask:v3];
}

+ (id)_keyboardWindowSceneForScreen:(id)a3 create:(BOOL)a4
{
  return +[_UIScreenBasedWindowScene _unassociatedWindowSceneForScreen:a3 create:a4];
}

- (BOOL)_tracksWindowsNeedingDeferredInitialUpdates
{
  return 1;
}

- (_UIContextBinder)_contextBinder
{
  return self->_contextBinder;
}

- (UIWindow)_delegateWindow
{
  if (*(unsigned char *)&self->_windowSceneFlags)
  {
    uint64_t v3 = [(UIScene *)self delegate];
    id v2 = [v3 window];
  }
  else
  {
    id v2 = 0;
  }
  return (UIWindow *)v2;
}

- (id)_fbsSceneLayerForWindow:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(_UIContextBinder *)self->_contextBinder substrate];
  uint64_t v6 = [v5 scene];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = objc_msgSend(v6, "clientSettings", 0);
  uint64_t v8 = [v7 layers];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v14 = v13;
          id v15 = [v14 CAContext];
          uint64_t v16 = [v4 _boundContext];

          if (v15 == v16) {
            goto LABEL_12;
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }
  id v14 = 0;
LABEL_12:

  return v14;
}

- (void)_recycleAttachmentForWindow:(id)a3
{
}

- (id)_findNewKeyWindowPassingTest:(void *)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __46__UIWindowScene__findNewKeyWindowPassingTest___block_invoke;
    v6[3] = &unk_1E5309A58;
    id v7 = v3;
    a1 = [a1 _topVisibleWindowPassingTest:v6];
  }
  return a1;
}

uint64_t __46__UIWindowScene__findNewKeyWindowPassingTest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 canBecomeKeyWindow]
    && ([v3 _isTextEffectsWindow] & 1) == 0
    && ([v3 isInternalWindow] & 1) == 0)
  {
    if (objc_msgSend(v3, sel_allowsWeakReference)) {
      uint64_t v6 = v3;
    }
    else {
      uint64_t v6 = 0;
    }
    if (v6)
    {
      id v7 = v3;
      [v7 alpha];
      if (v8 >= 0.01)
      {
        char IsHidden = _UIWindowSceneCompatibleIsHidden(v7);

        if ((IsHidden & 1) == 0)
        {
          uint64_t v10 = *(void *)(a1 + 32);
          if (v10) {
            uint64_t v4 = (*(uint64_t (**)(uint64_t, id))(v10 + 16))(v10, v7);
          }
          else {
            uint64_t v4 = 1;
          }
          goto LABEL_15;
        }
      }
      else
      {
      }
    }
    else
    {
      id v7 = 0;
    }
    uint64_t v4 = 0;
LABEL_15:

    goto LABEL_5;
  }
  uint64_t v4 = 0;
LABEL_5:

  return v4;
}

- (void)_keyWindowWillDeallocate:(id *)a1
{
  if (a1)
  {
    uint64_t v4 = [a2 windowScene];
    if (v4 == a1)
    {
      if ([a1[42] count])
      {
        id v5 = a1[43];

        if (v5 != a2) {
          return;
        }
        uint64_t v6 = [NSString stringWithFormat:@"%@: %p: Key window is deallocating: %p", objc_opt_class(), a1, a1[43]];
        -[UIWindowScene _removeWindowFromKeyWindowHistoryFindingNewKeyWindowIfNeeded:ignoringOldKeyWindow:forReason:](a1, a1[43], 1, v6);
        uint64_t v4 = (id *)v6;
      }
      else
      {
        uint64_t v4 = a1;
      }
    }
  }
}

BOOL __138__UIWindowScene__evaluateSceneKeyWindowForWindowMadeKey_consideringVisibility_findingNewKeyWindowIfNeeded_ignoringOldKeyWindow_forReason___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) != a2;
}

- (void)_prepareForSuspend
{
  v3.receiver = self;
  v3.super_class = (Class)UIWindowScene;
  [(UIScene *)&v3 _prepareForSuspend];
  [(_UIContextBinder *)self->_contextBinder purgeContextsWithPurgeAction:0 afterPurgeAction:&__block_literal_global_286_1];
}

void __35__UIWindowScene__prepareForSuspend__block_invoke()
{
  id v0 = +[_UISceneLifecycleMultiplexer sharedInstance];
  [v0 collectBackingStores];
}

- (id)_trueEffectiveGeometry
{
  effectiveGeometry = self->_effectiveGeometry;
  if (!effectiveGeometry)
  {
    uint64_t v4 = +[UIWindowSceneGeometry _calculateEffectiveGeometryForWindowScene:self];
    id v5 = self->_effectiveGeometry;
    self->_effectiveGeometry = v4;

    effectiveGeometry = self->_effectiveGeometry;
  }
  return effectiveGeometry;
}

- (UIEdgeInsets)_peripheryInsets
{
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  if (dyld_program_sdk_at_least())
  {
    id v7 = [(UIWindowScene *)self _displayInfoProvider];
    [v7 peripheryInsets];
    double v4 = v8;
    double v3 = v9;
    double v5 = v10;
    double v6 = v11;
  }
  double v12 = v4;
  double v13 = v3;
  double v14 = v5;
  double v15 = v6;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (unint64_t)_currentlySupportedInterfaceOrientations
{
  double v3 = +[UIWindow _findWindowForControllingOverallAppearanceInWindowScene:self];
  double v4 = [v3 rootViewController];
  double v5 = [v4 _viewControllerForSupportedInterfaceOrientations];

  uint64_t v6 = [v5 supportedInterfaceOrientations];
  unint64_t v7 = [(id)UIApp _supportedInterfaceOrientationsForWindow:v3] & v6;
  if (!v7) {
    unint64_t v7 = 1 << [(UIWindowScene *)self interfaceOrientation];
  }

  return v7;
}

- (void)_setShouldDisableTouchCancellationOnRotation:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)&self->_windowSceneFlags + 8) = *((unsigned char *)&self->_windowSceneFlags + 8) & 0xFD | v3;
}

- (id)_disableTouchCancellationOnRotation
{
  id v2 = [[UIWindowSceneTouchCancellationOnRotationAssertion alloc] initWithWindowScene:self];
  return v2;
}

- (void)_updateClientSettingsToInterfaceOrientation:(int64_t)a3 withAnimationDuration:(double)a4
{
  unint64_t v7 = [(UIScene *)self _effectiveUIClientSettings];
  uint64_t v8 = [v7 interfaceOrientation];

  if (v8 != a3)
  {
    if ([(UIScene *)self _isUIKitManaged])
    {
      uint64_t v13 = 0;
      double v14 = &v13;
      uint64_t v15 = 0x3032000000;
      uint64_t v16 = __Block_byref_object_copy__304;
      long long v17 = __Block_byref_object_dispose__305;
      id v18 = 0;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      void v11[2] = __83__UIWindowScene__updateClientSettingsToInterfaceOrientation_withAnimationDuration___block_invoke;
      v11[3] = &unk_1E5309B38;
      v11[5] = &v13;
      v11[6] = a3;
      *(double *)&v11[7] = a4;
      v11[4] = self;
      BOOL v12 = fabs(a4) >= 2.22044605e-16;
      [(UIScene *)self _updateUIClientSettingsWithUITransitionBlock:v11];
      uint64_t v9 = v14[5];
      if (v9) {
        (*(void (**)(void))(v9 + 16))();
      }
      _Block_object_dispose(&v13, 8);
    }
    else
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      _DWORD v10[2] = __83__UIWindowScene__updateClientSettingsToInterfaceOrientation_withAnimationDuration___block_invoke_2;
      v10[3] = &__block_descriptor_40_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
      void v10[4] = a3;
      [(UIScene *)self _updateUIClientSettingsWithBlock:v10];
    }
  }
}

uint64_t __83__UIWindowScene__updateClientSettingsToInterfaceOrientation_withAnimationDuration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = a2;
  [v7 setInterfaceOrientation:v6];
  uint64_t v8 = [MEMORY[0x1E4F4F680] settingsWithDuration:*(double *)(a1 + 56)];
  [v5 setAnimationSettings:v8];

  uint64_t v9 = *(unsigned char **)(a1 + 32);
  if ((v9[416] & 2) != 0)
  {
    [v5 setDisableTouchCancellationOnRotation:1];
    uint64_t v9 = *(unsigned char **)(a1 + 32);
  }
  double v10 = [v9 statusBarManager];
  uint64_t v11 = [v10 updateStatusBarAppearanceWithClientSettings:v7 transitionContext:v5];

  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  uint64_t v14 = *(unsigned __int8 *)(a1 + 64);
  return v14;
}

uint64_t __83__UIWindowScene__updateClientSettingsToInterfaceOrientation_withAnimationDuration___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setInterfaceOrientation:*(void *)(a1 + 32)];
}

- (id)_orientationDebugDescription
{
  return [(UIWindowScene *)self _orientationDebugDescriptionWithMultilinePrefix:0];
}

- (CGSize)_screenRequestedDisplayNativePixelSize
{
  char v3 = [(UIScene *)self _FBSScene];
  double v4 = [v3 clientSettings];
  int v5 = [v4 isUISubclass];

  if (v5)
  {
    uint64_t v6 = [(UIScene *)self _FBSScene];
    id v7 = [v6 uiClientSettings];
    uint64_t v8 = [v7 displayConfigurationRequest];
    [v8 nativePixelSize];
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    double v10 = *MEMORY[0x1E4F1DB30];
    double v12 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  double v13 = v10;
  double v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)_setScreenRequestedDisplayNativePixelSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = [(UIScene *)self _FBSScene];
  id v7 = [v6 clientSettings];
  int v8 = [v7 isUISubclass];

  if (v8)
  {
    double v9 = [(UIWindowScene *)self _displayConfigurationRequest];
    if (v9)
    {
      double v10 = [(UIWindowScene *)self _displayConfigurationRequest];
      id v12 = (id)[v10 mutableCopy];
    }
    else
    {
      id v12 = (id)objc_opt_new();
    }

    objc_msgSend(v12, "setNativePixelSize:", width, height);
    double v11 = (void *)[v12 copy];
    [(UIWindowScene *)self _setDisplayConfigurationRequest:v11];
  }
}

- (int64_t)_resolvedOverscanCompensation
{
  int64_t avkitRequestedOverscanCompensation = self->_avkitRequestedOverscanCompensation;
  if (avkitRequestedOverscanCompensation == -1) {
    return self->_screenRequestedOverscanCompensation;
  }
  return avkitRequestedOverscanCompensation;
}

- (void)_setScreenRequestedOverscanCompensation:(int64_t)a3
{
  int v5 = [(UIScene *)self _FBSScene];
  uint64_t v6 = [v5 clientSettings];
  int v7 = [v6 isUISubclass];

  if (v7)
  {
    self->_screenRequestedOverscanCompensation = a3;
    int64_t v8 = [(UIWindowScene *)self _resolvedOverscanCompensation];
    double v9 = [(UIWindowScene *)self _displayConfigurationRequest];

    if (v9)
    {
      double v10 = [(UIWindowScene *)self _displayConfigurationRequest];
      uint64_t v11 = [v10 overscanCompensation];

      if (v11 == v8) {
        return;
      }
      id v12 = [(UIWindowScene *)self _displayConfigurationRequest];
      id v15 = (id)[v12 mutableCopy];

      double v13 = v15;
      if (!v15) {
        return;
      }
    }
    else
    {
      double v13 = objc_opt_new();
      if (!v13) {
        return;
      }
    }
    id v16 = v13;
    [v13 setOverscanCompensation:v8];
    double v14 = (void *)[v16 copy];
    [(UIWindowScene *)self _setDisplayConfigurationRequest:v14];
  }
}

- (void)_setAVKitRequestedRefreshRate:(double)a3 HDRMode:(int64_t)a4 overscanCompensation:(int64_t)a5
{
  double v9 = [(UIScene *)self _FBSScene];
  double v10 = [v9 clientSettings];
  int v11 = [v10 isUISubclass];

  if (!v11) {
    return;
  }
  self->_int64_t avkitRequestedOverscanCompensation = a5;
  int64_t v12 = [(UIWindowScene *)self _resolvedOverscanCompensation];
  double v13 = [(UIWindowScene *)self _displayConfigurationRequest];

  if (v13)
  {
    double v14 = [(UIWindowScene *)self _displayConfigurationRequest];
    [v14 refreshRate];
    double v16 = v15;
    uint64_t v17 = [v14 hdrMode];
    uint64_t v18 = [v14 overscanCompensation];
    if (v16 == a3 && v17 == a4 && v18 == v12)
    {
      id v22 = 0;
    }
    else
    {
      long long v20 = [(UIWindowScene *)self _displayConfigurationRequest];
      id v22 = (id)[v20 mutableCopy];
    }
    long long v19 = v22;
    if (!v22) {
      goto LABEL_13;
    }
  }
  else
  {
    long long v19 = objc_opt_new();
    if (!v19) {
      goto LABEL_13;
    }
  }
  id v23 = v19;
  [v19 setRefreshRate:a3];
  [v23 setHdrMode:a4];
  [v23 setOverscanCompensation:v12];
  long long v21 = (void *)[v23 copy];
  [(UIWindowScene *)self _setDisplayConfigurationRequest:v21];

  long long v19 = v23;
LABEL_13:
}

- (FBSDisplayConfigurationRequest)_displayConfigurationRequest
{
  char v3 = [(UIScene *)self _FBSScene];
  double v4 = [v3 clientSettings];
  int v5 = [v4 isUISubclass];

  if (v5)
  {
    uint64_t v6 = [(UIScene *)self _FBSScene];
    int v7 = [v6 uiClientSettings];
    int64_t v8 = [v7 displayConfigurationRequest];
  }
  else
  {
    int64_t v8 = 0;
  }
  return (FBSDisplayConfigurationRequest *)v8;
}

- (void)_setDisplayConfigurationRequest:(id)a3
{
  id v4 = a3;
  int v5 = [(UIScene *)self _FBSScene];
  uint64_t v6 = [v5 clientSettings];
  int v7 = [v6 isUISubclass];

  if (v4 && v7)
  {
    int64_t v8 = [(UIScene *)self _FBSScene];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    _DWORD v9[2] = __49__UIWindowScene__setDisplayConfigurationRequest___block_invoke;
    v9[3] = &unk_1E52DAE80;
    id v10 = v4;
    [v8 updateUIClientSettingsWithBlock:v9];
  }
}

uint64_t __49__UIWindowScene__setDisplayConfigurationRequest___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDisplayConfigurationRequest:*(void *)(a1 + 32)];
}

- (void)_noteDisplayIdentityDidChangeWithConfiguration:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)UIWindowScene;
  [(UIScene *)&v3 _noteDisplayIdentityDidChangeWithConfiguration:a3];
}

- (void)_applySnapshotSettings:(id)a3 forActions:(id)a4
{
  *(unsigned char *)&self->_windowSceneFlags |= 8u;
  [(UIScene *)self _applyOverrideSettings:a3 forActions:a4];
  *(unsigned char *)&self->_windowSceneFlags &= ~8u;
}

void __78__UIWindowScene__screenTraitCollectionWithOverridesAppliedFromSceneUISettings__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    char v3 = [WeakRetained _sceneSessionRoleIsCarPlayOrNonInteractiveExternal];
    id v2 = v4;
    if ((v3 & 1) == 0)
    {
      [v4 _updateSceneTraitsAndPushTraitsToScreen:1 callParentWillTransitionToTraitCollection:1];
      id v2 = v4;
    }
  }
}

- (id)_traitTrace:(id)a3
{
  return _UITraitTraceForTraitEnvironmentAndQueryString(self, a3);
}

- (id)_traitTrace
{
  return [(UIWindowScene *)self _traitTrace:0];
}

- (void)_setOverrideParentTraitEnvironment:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_overrideParentTraitEnvironment);
  if (WeakRetained != obj)
  {
    if (WeakRetained) {
      [WeakRetained _unregisterAuxiliaryChildEnvironmentForTraitInvalidations:self];
    }
    objc_storeWeak((id *)&self->_overrideParentTraitEnvironment, obj);
    if (obj) {
      [obj _registerAuxiliaryChildEnvironmentForTraitInvalidations:self];
    }
    [(UIWindowScene *)self _invalidateAuxiliaryChildTraits];
  }
}

- (void)_invalidateAuxiliaryChildTraits
{
}

- (void)_updateAuxiliaryChildTraitsIfNeeded
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(UIWindowScene *)self _allWindows];
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
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) updateTraitsIfNeeded];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)_parentTraitEnvironment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_overrideParentTraitEnvironment);
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
  }
  else
  {
    id v5 = [(UIWindowScene *)self screen];
  }
  uint64_t v6 = v5;

  return v6;
}

- (BOOL)assertionActivationStateForType:(unint64_t)a3
{
  if (!a3) {
    return *((unsigned char *)&self->_windowSceneFlags + 8) & 1;
  }
  uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIWindowScene.m", 3042, @"Unknown _UIAssertionType %lu", a3);

  return 0;
}

- (void)assertionActivationStateChangedToState:(BOOL)a3 forType:(unint64_t)a4
{
  if (pthread_main_np() == 1)
  {
    if (a4)
    {
LABEL_3:
      id v10 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIWindowScene.m", 3064, @"Unknown _UIAssertionType %lu", a4);

      return;
    }
  }
  else
  {
    long long v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"UIWindowScene.m" lineNumber:3049 description:@"Call must be made on main thread"];

    if (a4) {
      goto LABEL_3;
    }
  }
  p_char windowSceneFlags = &self->_windowSceneFlags;
  *((unsigned char *)&self->_windowSceneFlags + 8) = *((unsigned char *)&self->_windowSceneFlags + 8) & 0xFE | a3;
  if (!a3 && (*(unsigned char *)p_windowSceneFlags & 0x10) != 0)
  {
    *(unsigned char *)p_windowSceneFlags &= ~0x10u;
    [(UIWindowScene *)self _scheduleResizeFinishedActionAndFadeOutSnapshot];
  }
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 1;
}

- (id)_keyCommands
{
  v11.receiver = self;
  v11.super_class = (Class)UIWindowScene;
  uint64_t v3 = [(UIResponder *)&v11 _keyCommands];
  uint64_t v4 = (void *)v3;
  id v5 = (void *)MEMORY[0x1E4F1CBF0];
  if (v3) {
    id v5 = (void *)v3;
  }
  id v6 = v5;

  long long v7 = [(UIWindowScene *)self keyWindow];
  long long v8 = v7;
  if (v7 && ([v7 _isHostedInAnotherProcess] & 1) == 0)
  {
    if (qword_1EB25BB08 != -1) {
      dispatch_once(&qword_1EB25BB08, &__block_literal_global_386);
    }
    uint64_t v9 = [v6 arrayByAddingObject:qword_1EB25BB00];

    id v6 = (id)v9;
  }

  return v6;
}

uint64_t __29__UIWindowScene__keyCommands__block_invoke()
{
  id v0 = +[UICommand _defaultCommandForAction:sel__performClose_];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)qword_1EB25BB00;
  qword_1EB25BB00 = v1;

  [(id)qword_1EB25BB00 _setEnumerationPriority:-1];
  uint64_t v3 = (void *)qword_1EB25BB00;
  uint64_t v4 = [(id)qword_1EB25BB00 attributes] | 4;
  return [v3 setAttributes:v4];
}

- (void)_performClose:(id)a3
{
  id v5 = [(UIScene *)self _FBSScene];
  if (v5)
  {
    uint64_t v3 = [[UIDestroySceneAction alloc] initWithPersistedIdentifiers:0 preferredAnimationType:1 forDestroyingSession:1 userOriginatedRequest:1 callbackQueue:0 completion:&__block_literal_global_392_0];
    uint64_t v4 = [MEMORY[0x1E4F1CAD0] setWithObject:v3];
    [v5 sendActions:v4];
  }
}

- (void)_unlockPointerLockState:(id)a3
{
  uint64_t v4 = [(UIScene *)self _FBSScene];
  if (v4)
  {
    id v9 = v4;
    id v5 = [(UIScene *)self pointerLockState];
    int v6 = [v5 isLocked];

    uint64_t v4 = v9;
    if (v6)
    {
      long long v7 = [[_UIPointerUnlockAction alloc] initWithInfo:0 responder:0];
      long long v8 = [MEMORY[0x1E4F1CAD0] setWithObject:v7];
      [v9 sendActions:v8];

      uint64_t v4 = v9;
    }
  }
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if (sel__performClose_ == a3)
  {
    long long v8 = (void *)_UIDeviceNativeUserInterfaceIdiomIgnoringClassic();
    id v9 = v8;
    if (v8 == (void *)6 || v8 == (void *)1)
    {
      long long v8 = [(UIScene *)self _FBSScene];
      unsigned __int8 v7 = v8 != 0;
    }
    else
    {
      unsigned __int8 v7 = 0;
    }
    if (v9 == (void *)6 || v9 == (void *)1) {
  }
    }
  else if (sel__unlockPointerLockState_ == a3)
  {
    id v10 = [(UIScene *)self pointerLockState];
    unsigned __int8 v7 = [v10 isLocked];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)UIWindowScene;
    unsigned __int8 v7 = [(UIResponder *)&v12 canPerformAction:a3 withSender:v6];
  }

  return v7;
}

- (int64_t)_avkitRequestedOverscanCompensation
{
  return self->_avkitRequestedOverscanCompensation;
}

- (void)_setAVKitRequestedOverscanCompensation:(int64_t)a3
{
  self->_int64_t avkitRequestedOverscanCompensation = a3;
}

- (_UITraitEnvironmentInternal)_overrideParentTraitEnvironment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_overrideParentTraitEnvironment);
  return (_UITraitEnvironmentInternal *)WeakRetained;
}

- (id)activityItemsConfigurationSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activityItemsConfigurationSource);
  return WeakRetained;
}

- (BOOL)isFullScreen
{
  return self->_fullScreen;
}

- (void)set_isKeyWindowScene:(BOOL)a3
{
  self->__isKeyWindowScene = a3;
}

- (BOOL)isExcludedFromWindowsMenu
{
  return self->_excludedFromWindowsMenu;
}

- (void)setExcludedFromWindowsMenu:(BOOL)a3
{
  self->_excludedFromWindowsMenu = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_activityItemsConfigurationSource);
  objc_destroyWeak((id *)&self->_overrideParentTraitEnvironment);
  objc_storeStrong((id *)&self->_overrideParentTraitCollection, 0);
  objc_storeStrong((id *)&self->_metricsCalculator, 0);
  objc_storeStrong((id *)&self->_liveResizeSnapshot, 0);
  objc_storeStrong((id *)&self->_passthroughWindow, 0);
  objc_storeStrong((id *)&self->_assertionController, 0);
  objc_storeStrong((id *)&self->_windowsNeedingDeferredInitialUpdateExecution, 0);
  objc_storeStrong((id *)&self->_delegateWindowNeedingDeferredInitialUpdate, 0);
  objc_storeStrong((id *)&self->_keyboardEventDeferringToken, 0);
  objc_storeStrong((id *)&self->_keyWindowHistory, 0);
  objc_storeStrong((id *)&self->_contextBinder, 0);
  objc_storeStrong((id *)&self->_coordinateSpace, 0);
  objc_storeStrong((id *)&self->_effectiveGeometry, 0);
  objc_storeStrong((id *)&self->_componentsWithTraitOverrides, 0);
  objc_storeStrong((id *)&self->_currentUserInterfaceStyleValueForSystemUIServices, 0);
  objc_storeStrong((id *)&self->_traitChangeRegistry, 0);
  objc_storeStrong((id *)&self->_traitOverrides, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_displayEdgeInfoProvider, 0);
  objc_storeStrong((id *)&self->_screen, 0);
}

- (id)_orientationDebugDescriptionBuilderWithMultilinePrefix:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F4F718];
  id v5 = a3;
  id v6 = [v4 builderWithObject:self];
  [v6 setActiveMultilinePrefix:v5];

  unsigned __int8 v7 = [v6 activeMultilinePrefix];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __99__UIWindowScene_UIKitOrientationDebugging___orientationDebugDescriptionBuilderWithMultilinePrefix___block_invoke;
  v12[3] = &unk_1E52D9F98;
  void v12[4] = self;
  id v8 = v6;
  id v13 = v8;
  [v8 appendBodySectionWithName:0 multilinePrefix:v7 block:v12];

  id v9 = v13;
  id v10 = v8;

  return v10;
}

void __99__UIWindowScene_UIKitOrientationDebugging___orientationDebugDescriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _effectiveUISettings];
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v4 = [v3 activeMultilinePrefix];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __99__UIWindowScene_UIKitOrientationDebugging___orientationDebugDescriptionBuilderWithMultilinePrefix___block_invoke_2;
  v24[3] = &unk_1E52D9F98;
  id v25 = *(id *)(a1 + 40);
  id v5 = v2;
  id v26 = v5;
  [v3 appendBodySectionWithName:@"sceneSettings" multilinePrefix:v4 block:v24];

  id v6 = [*(id *)(a1 + 32) _effectiveUIClientSettings];
  unsigned __int8 v7 = *(void **)(a1 + 40);
  id v8 = [v7 activeMultilinePrefix];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  long long v20 = __99__UIWindowScene_UIKitOrientationDebugging___orientationDebugDescriptionBuilderWithMultilinePrefix___block_invoke_3;
  long long v21 = &unk_1E52D9F98;
  id v22 = *(id *)(a1 + 40);
  id v9 = v6;
  id v23 = v9;
  [v7 appendBodySectionWithName:@"clientSettings" multilinePrefix:v8 block:&v18];

  id v10 = *(void **)(a1 + 40);
  objc_super v11 = objc_msgSend(*(id *)(a1 + 32), "screen", v18, v19, v20, v21);
  objc_msgSend(v10, "ui_appendOrientationDebugDescription:withName:", v11, @"screen");

  if ([v5 interfaceOrientationMode] == 1)
  {
    objc_super v12 = +[UIWindow _findWindowForControllingOverallAppearanceInWindowScene:*(void *)(a1 + 32)];
    id v13 = (void *)MEMORY[0x1E4F1CA80];
    double v14 = [*(id *)(a1 + 32) _allWindows];
    double v15 = [v13 setWithArray:v14];

    if (v12) {
      [v15 removeObject:v12];
    }
    objc_msgSend(*(id *)(a1 + 40), "ui_appendOrientationDebugDescription:withName:", v12, @"windowDrivingOrientation");
    double v16 = *(void **)(a1 + 40);
    uint64_t v17 = [v15 allObjects];
    objc_msgSend(v16, "ui_appendOrientationDebuggingArraySection:withName:skipIfEmpty:", v17, @"otherWindows", 1);
  }
}

id __99__UIWindowScene_UIKitOrientationDebugging___orientationDebugDescriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = UIApplicationSceneStringForInterfaceOrientationMode([*(id *)(a1 + 40) interfaceOrientationMode]);
  [v2 appendString:v3 withName:@"mode"];

  return (id)objc_msgSend(*(id *)(a1 + 32), "ui_appendInterfaceOrientation:withName:", objc_msgSend(*(id *)(a1 + 40), "interfaceOrientation"), @"orientation");
}

id __99__UIWindowScene_UIKitOrientationDebugging___orientationDebugDescriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  id v2 = (id)objc_msgSend(*(id *)(a1 + 32), "ui_appendInterfaceOrientation:withName:", objc_msgSend(*(id *)(a1 + 40), "interfaceOrientation"), @"orientation");
  id v3 = (id)objc_msgSend(*(id *)(a1 + 32), "ui_appendInterfaceOrientationMask:withName:", objc_msgSend(*(id *)(a1 + 40), "supportedInterfaceOrientations"), @"supported");
  return (id)objc_msgSend(*(id *)(a1 + 32), "ui_appendInterfaceOrientation:withName:skipIfUnknown:", objc_msgSend(*(id *)(a1 + 40), "preferredInterfaceOrientation"), @"preferred", 1);
}

- (id)_orientationDebugDescriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(UIWindowScene *)self _orientationDebugDescriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)_remoteSheetClientProvider
{
  id v2 = [(UIScene *)self _FBSScene];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = [v2 componentForExtension:v3 ofClass:objc_opt_class()];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      unsigned __int8 v7 = v6;
    }
    else {
      unsigned __int8 v7 = 0;
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }
  id v8 = v7;

  return v8;
}

@end