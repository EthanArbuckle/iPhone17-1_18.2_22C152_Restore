@interface SBBannerManager
+ (id)_defaultAuthorizedBundleIDs;
- (BOOL)_handleButtonEventWithTest:(id)a3 handler:(id)a4;
- (BOOL)_handleButtonEventWithWindowScene:(id)a3 test:(id)a4 handler:(id)a5;
- (BOOL)_isPresentableHUD:(id)a3;
- (BOOL)_isPresentableNotice:(id)a3;
- (BOOL)_shouldHideStatusBarForPresentable:(id)a3;
- (BOOL)bannerPanGestureRecognizer:(id)a3 shouldCancelSystemDragGestureWithTouches:(id)a4 event:(id)a5;
- (BOOL)bannerPanGestureRecognizer:(id)a3 shouldDisableTouchCancellationForTouch:(id)a4 event:(id)a5;
- (BOOL)bannerSourceListener:(id)a3 recommendsSuspending:(BOOL)a4 forReason:(id)a5 revokingCurrent:(BOOL)a6 error:(id *)a7;
- (BOOL)bannerSourceListener:(id)a3 requestsPostingPresentable:(id)a4 options:(unint64_t)a5 userInfo:(id)a6 error:(id *)a7;
- (BOOL)bannerSourceListenerShouldEnablePresentableContextInterface:(id)a3;
- (BOOL)handleHeadsetButtonPress:(BOOL)a3;
- (BOOL)handleHomeButtonDoublePress;
- (BOOL)handleHomeButtonLongPress;
- (BOOL)handleHomeButtonPress;
- (BOOL)handleHomeButtonPressInWindowScene:(id)a3;
- (BOOL)handleLockButtonPress;
- (BOOL)handleVoiceCommandButtonPress;
- (BOOL)handleVolumeDownButtonPress;
- (BOOL)handleVolumeUpButtonPress;
- (BOOL)isDisplayingBannerInAnyWindowScene;
- (BOOL)isDisplayingBannerInWindowScene:(id)a3;
- (BOOL)isDisplayingFullScreenBannerInWindowScene:(id)a3;
- (BOOL)pointInsideBanner:(CGPoint)a3 inWindowScene:(id)a4;
- (BOOL)postPresentable:(id)a3 withOptions:(unint64_t)a4 userInfo:(id)a5 error:(id *)a6;
- (CGPoint)presenter:(id)a3 gestureRecognizer:(id)a4 locationForEvent:(id)a5 inView:(id)a6;
- (CGPoint)presenter:(id)a3 gestureRecognizer:(id)a4 locationForTouch:(id)a5 inView:(id)a6;
- (CGPoint)presenter:(id)a3 gestureRecognizer:(id)a4 translationInView:(id)a5;
- (CGPoint)presenter:(id)a3 gestureRecognizer:(id)a4 velocityInView:(id)a5;
- (SBBannerManager)init;
- (SBPresentableIntercepting)presentableInterceptor;
- (double)presenterMinimumPreferredTopEdgeInset:(id)a3;
- (id)_acquireGestureRecognizerPriorityAssertionWithPriority:(int64_t)a3 windowScene:(id)a4 reason:(id)a5;
- (id)_bannerControllerForWindowScene:(id)a3;
- (id)_bannerWindowForWindowScene:(id)a3;
- (id)_bannerWindowForWindowScene:(id)a3 creatingIfNecessary:(BOOL)a4;
- (id)_contentViewControllerForWindowScene:(id)a3;
- (id)_homeGestureContextForPresentable:(id)a3 windowScene:(id)a4;
- (id)_layoutDescriptionWithBounds:(CGRect)a3 inWindowScene:(id)a4;
- (id)_panGestureInWindowScene:(id)a3;
- (id)_panGestureInWindowScene:(id)a3 creatingIfNecessary:(BOOL)a4;
- (id)_platterHomeGestureManager;
- (id)_presenterForPresentable:(id)a3;
- (id)_presenterForWindowScene:(id)a3;
- (id)_statusBarAssertionReasonForPresentable:(id)a3;
- (id)_windowForPresenter:(id)a3;
- (id)_windowSceneForBannerController:(id)a3;
- (id)_windowSceneForPresenter:(id)a3;
- (id)_zStackParticipantForAssistant:(id)a3;
- (id)_zStackParticipantForWindowScene:(id)a3;
- (id)_zStackPolicyAssistantForParticipant:(id)a3;
- (id)_zStackPolicyAssistantForWindowScene:(id)a3;
- (id)acquireBannerSuppressionAssertionForReason:(id)a3;
- (id)acquireGestureRecognizerPriorityAssertionForPresentable:(id)a3 priority:(int64_t)a4 reason:(id)a5;
- (id)acquireWindowLevelAssertionWithPriority:(int64_t)a3 windowLevel:(double)a4 windowScene:(id)a5 reason:(id)a6;
- (id)bannerSourceListener:(id)a3 layoutDescriptionWithError:(id *)a4;
- (id)bannerSourceListener:(id)a3 newBannerSourceListenerPresentableForBannerSpecification:(id)a4 serviceDomain:(id)a5 scene:(id)a6 readyCompletion:(id)a7;
- (id)bannerSourceListener:(id)a3 requestsRevokingPresentablesWithIdentification:(id)a4 reason:(id)a5 animated:(BOOL)a6 userInfo:(id)a7 error:(id *)a8;
- (id)bannerSourceListener:(id)a3 sceneSpecificationForBannerSceneWithIdentifier:(id)a4 forProcess:(id)a5 userInfo:(id)a6;
- (id)layoutManagerInWindowScene:(id)a3;
- (id)newBannerControllerForWindowScene:(id)a3;
- (id)panGestureRecognizerForPresenter:(id)a3;
- (id)platterHomeGestureManager:(id)a3 gestureRecognizerPriorityAssertionForParticipant:(id)a4 reason:(id)a5;
- (id)platterHomeGestureManager:(id)a3 orderedParticipants:(id)a4;
- (id)platterHomeGestureManager:(id)a3 windowForParticipant:(id)a4;
- (id)revokePresentablesWithIdentification:(id)a3 reason:(id)a4 options:(unint64_t)a5 animated:(BOOL)a6 userInfo:(id)a7 error:(id *)a8;
- (id)revokePresentablesWithIdentification:(id)a3 reason:(id)a4 options:(unint64_t)a5 userInfo:(id)a6 error:(id *)a7;
- (id)userInterfaceStyleTransitionAnimationSettingsForPresentable:(id)a3 forTransitionToStyle:(int64_t)a4;
- (id)windowSceneForPresentable:(id)a3;
- (int64_t)platterHomeGestureManager:(id)a3 zStackParticipantIdentifierForParticipant:(id)a4;
- (void)_acquirePresenterVisibilityGestureRecognizerPriorityAssertionForWindowScene:(id)a3;
- (void)_enumerateObserversRespondingToSelector:(SEL)a3 usingBlock:(id)a4;
- (void)_hideStatusBarIfNecessaryForPresentable:(id)a3;
- (void)_invalidatePresenterVisibilityGestureRecognizerPriorityAssertionForWindowScene:(id)a3;
- (void)_revealStatusBarIfNecessaryForPresentable:(id)a3;
- (void)_setWindowScene:(id)a3 forGestureRecognizerPriorityAssertion:(id)a4;
- (void)_systemApertureInsetsDidChange:(id)a3;
- (void)_unregisterHomeGestureContextForPresentable:(id)a3;
- (void)_updateGesturePriorityForGestureRecognizerInWindowScene:(id)a3;
- (void)_updatePolicyAssistantForWindowScene:(id)a3;
- (void)_updateWindowLevelForScene:(id)a3;
- (void)_updateZStackPolicyAssistantForWindowScene:(id)a3 reasonSuffix:(id)a4 transitionCoordinator:(id)a5;
- (void)addTransitionObserver:(id)a3;
- (void)ambientPresentationController:(id)a3 willUpdatePresented:(BOOL)a4;
- (void)assistantWillAppear:(id)a3 windowScene:(id)a4;
- (void)bannerSourceListener:(id)a3 didUpdateInitialSceneSettingsWithParameters:(id)a4;
- (void)bannerSourceListener:(id)a3 presentationSize:(CGSize *)a4 containerSize:(CGSize *)a5 error:(id *)a6;
- (void)cancelSystemDragForPresentable:(id)a3;
- (void)dismissAllBannersInAllWindowScenesAnimated:(BOOL)a3 reason:(id)a4;
- (void)dismissAllBannersInWindowScene:(id)a3 animated:(BOOL)a4 reason:(id)a5;
- (void)foregroundSceneZStackPolicyAssistantDidChange:(id)a3 forReason:(id)a4;
- (void)platterHomeGestureManager:(id)a3 participantOwningHomeGestureDidChange:(id)a4;
- (void)presenter:(id)a3 presentable:(id)a4 willTransitionToSize:(CGSize)a5 withTransitionCoordinator:(id)a6;
- (void)presenter:(id)a3 willDismissPresentable:(id)a4 withTransitionCoordinator:(id)a5 userInfo:(id)a6;
- (void)presenter:(id)a3 willPresentPresentable:(id)a4 withTransitionCoordinator:(id)a5 userInfo:(id)a6;
- (void)presenter:(id)a3 willTransitionToSize:(CGSize)a4 withTransitionCoordinator:(id)a5;
- (void)presenterRelinquishesVisibility:(id)a3;
- (void)presenterRequestsVisibility:(id)a3;
- (void)registerAuthority:(id)a3 forRequesterIdentifier:(id)a4;
- (void)removeTransitionObserver:(id)a3;
- (void)setPresentableInterceptor:(id)a3;
- (void)setSuspended:(BOOL)a3 forReason:(id)a4;
- (void)windowLevelAssertionManager:(id)a3 didUpdateAssertionsForWindowScene:(id)a4;
- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4;
@end

@implementation SBBannerManager

- (BOOL)isDisplayingBannerInAnyWindowScene
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v3 = v2->_windowScenesToBannerWindows;
  uint64_t v4 = [(NSMapTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if (-[SBBannerManager isDisplayingBannerInWindowScene:](v2, "isDisplayingBannerInWindowScene:", *(void *)(*((void *)&v8 + 1) + 8 * i), (void)v8))
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [(NSMapTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v2);
  return v4;
}

- (SBBannerManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)SBBannerManager;
  v2 = [(SBBannerManager *)&v14 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F4F5C8]);
    uint64_t v4 = [(id)objc_opt_class() _defaultAuthorizedBundleIDs];
    uint64_t v5 = [v3 initWithAuthorizedBundleIDs:v4];
    bannerSourceListener = v2->_bannerSourceListener;
    v2->_bannerSourceListener = (BNBannerSourceListener *)v5;

    [(BNBannerSourceListener *)v2->_bannerSourceListener setDelegate:v2];
    v7 = objc_alloc_init(SBBannerAuthority);
    bannerAuthority = v2->_bannerAuthority;
    v2->_bannerAuthority = v7;

    long long v9 = +[SBAssistantController sharedInstance];
    [v9 addObserver:v2];

    long long v10 = objc_alloc_init(SBWindowLevelAssertionManager);
    windowLevelAssertionManager = v2->_windowLevelAssertionManager;
    v2->_windowLevelAssertionManager = v10;

    [(SBWindowLevelAssertionManager *)v2->_windowLevelAssertionManager setDelegate:v2];
    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v2 selector:sel__systemApertureInsetsDidChange_ name:@"SBSystemApertureLayoutDidChangeNotification" object:0];
  }
  return v2;
}

- (id)layoutManagerInWindowScene:(id)a3
{
  id v3 = [(SBBannerManager *)self _contentViewControllerForWindowScene:a3];
  uint64_t v4 = [v3 layoutManager];

  return v4;
}

- (BOOL)isDisplayingBannerInWindowScene:(id)a3
{
  id v3 = [(SBBannerManager *)self bannerWindowInWindowScene:a3];
  uint64_t v4 = v3;
  if (v3) {
    int v5 = [v3 isHidden] ^ 1;
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)isDisplayingFullScreenBannerInWindowScene:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(SBBannerManager *)self _bannerWindowForWindowScene:v4];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v6 = -[SBBannerManager _presenterForWindowScene:](self, "_presenterForWindowScene:", v4, 0, 0);
  v7 = [v6 presentedPresentables];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v7);
        }
        long long v11 = UIViewControllerFromPresentable();
        v12 = [v11 viewIfLoaded];

        [v12 frame];
        double v14 = v13;
        double v16 = v15;
        [v5 frame];
        double v18 = v17;
        double v20 = v19;

        if (v14 == v18 && v16 == v20)
        {
          LOBYTE(v8) = 1;
          goto LABEL_14;
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return v8;
}

- (BOOL)pointInsideBanner:(CGPoint)a3 inWindowScene:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v8 = -[SBBannerManager _presenterForWindowScene:](self, "_presenterForWindowScene:", v7, 0, 0);
  uint64_t v9 = [v8 presentedPresentables];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v9);
        }
        double v13 = UIViewControllerFromPresentable();
        double v14 = [v13 viewIfLoaded];

        uint64_t v15 = [v7 screen];
        double v16 = [(id)v15 fixedCoordinateSpace];
        objc_msgSend(v14, "convertPoint:fromCoordinateSpace:", v16, x, y);
        CGFloat v18 = v17;
        CGFloat v20 = v19;

        [v14 bounds];
        v28.double x = v18;
        v28.double y = v20;
        LOBYTE(v15) = CGRectContainsPoint(v29, v28);

        if (v15)
        {
          LOBYTE(v10) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v10;
}

- (id)windowSceneForPresentable:(id)a3
{
  id v4 = [(SBBannerManager *)self _presenterForPresentable:a3];
  int v5 = [(SBBannerManager *)self _windowSceneForPresenter:v4];

  return v5;
}

- (void)registerAuthority:(id)a3 forRequesterIdentifier:(id)a4
{
  id v10 = a3;
  id v7 = a4;
  if (!v10)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SBBannerManager.m", 197, @"Invalid parameter not satisfying: %@", @"authority" object file lineNumber description];
  }
  if (![v7 length])
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SBBannerManager.m", 198, @"Invalid parameter not satisfying: %@", @"[requesterIdentifier length] > 0" object file lineNumber description];
  }
  [(SBBannerAuthority *)self->_bannerAuthority registerAuthority:v10 forRequesterIdentifier:v7];
}

- (id)acquireGestureRecognizerPriorityAssertionForPresentable:(id)a3 priority:(int64_t)a4 reason:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  uint64_t v11 = 0;
  if (v8 && v9)
  {
    v12 = self;
    objc_sync_enter(v12);
    double v13 = [(NSMapTable *)v12->_presentablesToGesturePriorityAssertions objectForKey:v8];
    double v14 = [(SBBannerManager *)v12 _presenterForPresentable:v8];
    uint64_t v15 = [(SBBannerManager *)v12 _windowSceneForPresenter:v14];
    uint64_t v11 = [(SBBannerManager *)v12 _acquireGestureRecognizerPriorityAssertionWithPriority:a4 windowScene:v15 reason:v10];

    if (([v13 containsObject:v11] & 1) == 0)
    {
      if (!v13)
      {
        double v13 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
        presentablesToGesturePriorityAssertions = v12->_presentablesToGesturePriorityAssertions;
        if (!presentablesToGesturePriorityAssertions)
        {
          uint64_t v17 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
          CGFloat v18 = v12->_presentablesToGesturePriorityAssertions;
          v12->_presentablesToGesturePriorityAssertions = (NSMapTable *)v17;

          presentablesToGesturePriorityAssertions = v12->_presentablesToGesturePriorityAssertions;
        }
        [(NSMapTable *)presentablesToGesturePriorityAssertions setObject:v13 forKey:v8];
      }
      [v13 addObject:v11];
      double v19 = [v14 topPresentables];
      id v20 = [v19 lastObject];

      if (v20 != v8) {
        [v11 setEnabled:0];
      }
    }

    objc_sync_exit(v12);
  }

  return v11;
}

- (id)acquireBannerSuppressionAssertionForReason:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    int v5 = self;
    objc_sync_enter(v5);
    if (!v5->_suppressionAssertions)
    {
      uint64_t v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      suppressionAssertions = v5->_suppressionAssertions;
      v5->_suppressionAssertions = (NSHashTable *)v6;
    }
    objc_initWeak(&location, v5);
    id v8 = SBLogBanners();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v28 = v4;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Instantiating banner suppression assertion for reason: %{public}@", buf, 0xCu);
    }

    id v9 = objc_alloc(MEMORY[0x1E4F4F838]);
    id v10 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v11 = [v10 UUIDString];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __62__SBBannerManager_acquireBannerSuppressionAssertionForReason___block_invoke;
    v23[3] = &unk_1E6AFA6D0;
    objc_copyWeak(&v24, &location);
    v23[4] = v5;
    v12 = (void *)[v9 initWithIdentifier:v11 forReason:v4 invalidationBlock:v23];

    [(NSHashTable *)v5->_suppressionAssertions addObject:v12];
    if ([(NSHashTable *)v5->_suppressionAssertions count] == 1)
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      double v13 = v5->_windowScenesToBannerControllers;
      uint64_t v14 = [(NSMapTable *)v13 countByEnumeratingWithState:&v19 objects:v26 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v20 != v15) {
              objc_enumerationMutation(v13);
            }
            uint64_t v17 = -[SBBannerManager _bannerControllerForWindowScene:](v5, "_bannerControllerForWindowScene:", *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19);
            [v17 setSuspended:1 forReason:@"Banner manager suppression assertion" revokingCurrent:0 error:0];
          }
          uint64_t v14 = [(NSMapTable *)v13 countByEnumeratingWithState:&v19 objects:v26 count:16];
        }
        while (v14);
      }
    }
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
    objc_sync_exit(v5);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __62__SBBannerManager_acquireBannerSuppressionAssertionForReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = SBLogBanners();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = [v3 reason];
    *(_DWORD *)buf = 138543362;
    long long v21 = v5;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Banner suppression assertion did invalidate with reason: %{public}@", buf, 0xCu);
  }
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[13] removeObject:v3];
    if (![v7[13] count])
    {
      id v8 = v7[13];
      v7[13] = 0;

      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v9 = *(id *)(*(void *)(a1 + 32) + 16);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v16;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v16 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = objc_msgSend(*(id *)(a1 + 32), "_bannerControllerForWindowScene:", *(void *)(*((void *)&v15 + 1) + 8 * v13), (void)v15);
            [v14 setSuspended:0 forReason:@"Banner manager suppression assertion" revokingCurrent:0 error:0];

            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v11);
      }
    }
  }
}

- (void)setSuspended:(BOOL)a3 forReason:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = self->_clientSuppressionAssertions;
  id v8 = (id)[(NSMutableSet *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "reason", (void)v19);
        int v13 = [v12 isEqualToString:v6];

        if (v13)
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }
      id v8 = (id)[(NSMutableSet *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  if (v8 || !a3)
  {
    BOOL v18 = a3;
    if (!v8) {
      BOOL v18 = 1;
    }
    if (!v18)
    {
      [(NSMutableSet *)self->_clientSuppressionAssertions removeObject:v8];
      [v8 invalidate];
    }
  }
  else
  {
    clientSuppressionAssertions = self->_clientSuppressionAssertions;
    if (!clientSuppressionAssertions)
    {
      long long v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v16 = self->_clientSuppressionAssertions;
      self->_clientSuppressionAssertions = v15;

      clientSuppressionAssertions = self->_clientSuppressionAssertions;
    }
    long long v17 = -[SBBannerManager acquireBannerSuppressionAssertionForReason:](self, "acquireBannerSuppressionAssertionForReason:", v6, (void)v19);
    [(NSMutableSet *)clientSuppressionAssertions addObject:v17];
  }
}

- (void)dismissAllBannersInWindowScene:(id)a3 animated:(BOOL)a4 reason:(id)a5
{
  BOOL v29 = a4;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = (__CFString *)a3;
  id v7 = (__CFString *)a5;
  id v8 = SBLogBanners();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = @"without";
    *(_DWORD *)buf = 138543874;
    v39 = v6;
    if (v29) {
      uint64_t v9 = @"with";
    }
    __int16 v40 = 2114;
    v41 = v9;
    __int16 v42 = 2114;
    id v43 = v7;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Asked by system to dismiss all banners in window scene '%{public}@' %{public}@ animation for reason: %{public}@", buf, 0x20u);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v26 = v6;
  uint64_t v10 = [(SBBannerManager *)self _presenterForWindowScene:v6];
  uint64_t v11 = [v10 presentedPresentables];

  id obj = v11;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v34;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v34 != v14) {
          objc_enumerationMutation(obj);
        }
        long long v16 = *(void **)(*((void *)&v33 + 1) + 8 * v15);
        if (objc_opt_respondsToSelector())
        {
          id v32 = 0;
          char v17 = [v16 shouldDismissForReason:v7 outReason:&v32];
          id v18 = v32;
          if (v17) {
            goto LABEL_19;
          }
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {
            id v18 = 0;
LABEL_19:
            long long v22 = [MEMORY[0x1E4F4F5E8] uniqueIdentificationForPresentable:v16];
            id v31 = 0;
            long long v23 = [(SBBannerManager *)self revokePresentablesWithIdentification:v22 reason:v7 options:1 animated:v29 userInfo:0 error:&v31];
            long long v19 = v31;

            if (!v23)
            {
              uint64_t v24 = SBLogBanners();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              {
                BNEffectivePresentableDescription();
                long long v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v39 = v25;
                __int16 v40 = 2114;
                v41 = v7;
                __int16 v42 = 2114;
                id v43 = v19;
                _os_log_error_impl(&dword_1D85BA000, v24, OS_LOG_TYPE_ERROR, "Failed to revoke presentable '%{public}@' for reason '%{public}@': %{public}@", buf, 0x20u);
              }
            }
            goto LABEL_27;
          }
          id v18 = 0;
          if ([v16 shouldDismissForReason:v7]) {
            goto LABEL_19;
          }
        }
        long long v19 = SBLogBanners();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          BNEffectivePresentableDescription();
          long long v20 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            uint64_t v27 = [NSString stringWithFormat:@" (reason: '%@')", v18];
            long long v21 = v27;
          }
          else
          {
            long long v21 = &stru_1F3084718;
          }
          *(_DWORD *)buf = 138543874;
          v39 = v7;
          __int16 v40 = 2114;
          v41 = v20;
          __int16 v42 = 2114;
          id v43 = v21;
          _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_DEFAULT, "Presentable denied system dismissal for reason '%{public}@': %{public}@%{public}@", buf, 0x20u);
          if (v18) {
        }
          }
LABEL_27:

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v13);
  }
}

- (void)dismissAllBannersInAllWindowScenesAnimated:(BOOL)a3 reason:(id)a4
{
  BOOL v4 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = SBLogBanners();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = @"without";
    if (v4) {
      id v8 = @"with";
    }
    *(_DWORD *)buf = 138543618;
    long long v20 = v8;
    __int16 v21 = 2114;
    id v22 = v6;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Asked by system to dismiss all banners in all window scenes %{public}@ animation for reason: %{public}@", buf, 0x16u);
  }

  uint64_t v9 = self;
  objc_sync_enter(v9);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v10 = v9->_windowScenesToBannerControllers;
  uint64_t v11 = [(NSMapTable *)v10 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v10);
        }
        -[SBBannerManager dismissAllBannersInWindowScene:animated:reason:](v9, "dismissAllBannersInWindowScene:animated:reason:", *(void *)(*((void *)&v14 + 1) + 8 * v13++), v4, v6, (void)v14);
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMapTable *)v10 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }

  objc_sync_exit(v9);
}

- (void)addTransitionObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    transitionObservers = self->_transitionObservers;
    id v8 = v4;
    if (!transitionObservers)
    {
      id v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      id v7 = self->_transitionObservers;
      self->_transitionObservers = v6;

      transitionObservers = self->_transitionObservers;
    }
    [(NSHashTable *)transitionObservers addObject:v8];
    id v4 = v8;
  }
}

- (void)removeTransitionObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    [(NSHashTable *)self->_transitionObservers removeObject:v4];
    NSUInteger v5 = [(NSHashTable *)self->_transitionObservers count];
    id v4 = v7;
    if (!v5)
    {
      transitionObservers = self->_transitionObservers;
      self->_transitionObservers = 0;

      id v4 = v7;
    }
  }
}

- (BOOL)postPresentable:(id)a3 withOptions:(unint64_t)a4 userInfo:(id)a5 error:(id *)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = (SBBannerSourceListenerTemplatePresentableViewController *)a3;
  id v11 = a5;
  [(SBBannerSourceListenerTemplatePresentableViewController *)v10 ensurePresentableIsUniquelyIdentifiable];
  if (objc_opt_respondsToSelector()) {
    [(SBBannerSourceListenerTemplatePresentableViewController *)v10 setSystemDragCancellationHandler:self];
  }
  if (objc_opt_respondsToSelector())
  {
    if ([(SBBannerSourceListenerTemplatePresentableViewController *)v10 providesTemplateContent])
    {
      uint64_t v12 = UIViewControllerFromPresentable();

      if (!v12)
      {
        uint64_t v13 = SBLogBanners();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          long long v14 = BNEffectivePresentableDescription();
          int v24 = 138543362;
          long long v25 = v14;
          _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "Providing host-side view controller for template presentable': %{public}@", (uint8_t *)&v24, 0xCu);
        }
        long long v15 = [[SBBannerSourceListenerTemplatePresentableViewController alloc] initWithPresentable:v10];

        uint64_t v10 = v15;
      }
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentableInterceptor);
  char v17 = [WeakRetained willInterceptPresentable:v10 userInfo:v11];

  if (v17)
  {
    char v18 = 1;
  }
  else
  {
    long long v19 = [(id)SBApp windowSceneManager];
    long long v20 = [v19 activeDisplayWindowScene];

    if (SBFEffectiveHomeButtonType() == 2 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      __int16 v21 = [(SBBannerManager *)self _homeGestureContextForPresentable:v10 windowScene:v20];
      [(SBBannerSourceListenerTemplatePresentableViewController *)v10 setHomeGestureContext:v21];
    }
    id v22 = [(SBBannerManager *)self _bannerControllerForWindowScene:v20];
    char v18 = [v22 postPresentable:v10 withOptions:a4 userInfo:v11 error:a6];

    if ((v18 & 1) == 0) {
      [(SBBannerManager *)self _unregisterHomeGestureContextForPresentable:v10];
    }
  }
  return v18;
}

- (id)revokePresentablesWithIdentification:(id)a3 reason:(id)a4 options:(unint64_t)a5 userInfo:(id)a6 error:(id *)a7
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentableInterceptor);
  uint64_t v26 = v11;
  long long v15 = v12;
  int v24 = [WeakRetained revocationRequestedForPresentablesWithIdentification:v11 reason:v12];

  if (v24)
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [v16 addObjectsFromArray:v24];
  }
  else
  {
    id v16 = 0;
  }
  char v17 = self;
  objc_sync_enter(v17);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v17->_windowScenesToBannerControllers;
  uint64_t v18 = [(NSMapTable *)obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(obj);
        }
        __int16 v21 = -[SBBannerManager _bannerControllerForWindowScene:](v17, "_bannerControllerForWindowScene:", *(void *)(*((void *)&v28 + 1) + 8 * i), v24);
        id v22 = [v21 revokePresentablesWithIdentification:v26 reason:v15 options:a5 userInfo:v13 error:a7];

        if (v22)
        {
          if (!v16) {
            id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          [v16 addObjectsFromArray:v22];
        }
      }
      uint64_t v18 = [(NSMapTable *)obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v18);
  }

  objc_sync_exit(v17);
  if (a7 && *a7 && [v24 isEqualToArray:v16]) {
    *a7 = 0;
  }

  return v16;
}

- (id)revokePresentablesWithIdentification:(id)a3 reason:(id)a4 options:(unint64_t)a5 animated:(BOOL)a6 userInfo:(id)a7 error:(id *)a8
{
  BOOL v25 = a6;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v26 = a7;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentableInterceptor);
  uint64_t v27 = v13;
  long long v28 = v12;
  int v24 = [WeakRetained revocationRequestedForPresentablesWithIdentification:v12 reason:v13];

  if (v24)
  {
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [v15 addObjectsFromArray:v24];
  }
  else
  {
    id v15 = 0;
  }
  id v16 = self;
  objc_sync_enter(v16);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  char v17 = v16->_windowScenesToBannerControllers;
  uint64_t v18 = [(NSMapTable *)v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v31 != v19) {
          objc_enumerationMutation(v17);
        }
        __int16 v21 = -[SBBannerManager _bannerControllerForWindowScene:](v16, "_bannerControllerForWindowScene:", *(void *)(*((void *)&v30 + 1) + 8 * i), v24);
        if (objc_opt_respondsToSelector())
        {
          id v22 = [v21 revokePresentablesWithIdentification:v28 reason:v27 options:a5 animated:v25 userInfo:v26 error:a8];
          if (v22)
          {
            if (!v15) {
              id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            [v15 addObjectsFromArray:v22];
          }
        }
      }
      uint64_t v18 = [(NSMapTable *)v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v18);
  }

  objc_sync_exit(v16);
  if (a8 && *a8 && [v24 isEqualToArray:v15]) {
    *a8 = 0;
  }

  return v15;
}

- (void)presenter:(id)a3 willTransitionToSize:(CGSize)a4 withTransitionCoordinator:(id)a5
{
  double height = a4.height;
  CGFloat width = a4.width;
  id v9 = a5;
  id v10 = a3;
  id v11 = [(SBBannerManager *)self _windowSceneForPresenter:v10];
  bannerSourceListener = self->_bannerSourceListener;
  BSRectWithSize();
  id v13 = -[SBBannerManager _layoutDescriptionWithBounds:inWindowScene:](self, "_layoutDescriptionWithBounds:inWindowScene:", v11);
  [(BNBannerSourceListener *)bannerSourceListener layoutDescriptionDidChange:v13];

  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  id v26 = __76__SBBannerManager_presenter_willTransitionToSize_withTransitionCoordinator___block_invoke;
  uint64_t v27 = &unk_1E6B0B4C8;
  long long v28 = self;
  CGFloat v30 = width;
  double v31 = height;
  id v14 = v9;
  id v29 = v14;
  [(SBBannerManager *)self _enumerateObserversRespondingToSelector:sel_bannerManager_containerWillTransitionToSize_withTransitionCoordinator_ usingBlock:&v24];
  id v15 = -[SBBannerManager _windowForPresenter:](self, "_windowForPresenter:", v10, v24, v25, v26, v27, v28);

  [v15 bounds];
  double top = self->_additionalEdgeInsets.top;
  double left = self->_additionalEdgeInsets.left;
  v32.origin.double x = v18 + left;
  v32.origin.double y = top + v19;
  v32.size.CGFloat width = v20 - (left + self->_additionalEdgeInsets.right);
  v32.size.double height = v21 - (top + self->_additionalEdgeInsets.bottom);
  if (height > CGRectGetHeight(v32))
  {
    id v22 = [(id)SBApp systemApertureControllerForMainDisplay];
    id v23 = (id)[v22 restrictSystemApertureToDefaultLayoutWithReason:@"Transient restriction due to presentation of large banner"];
  }
}

uint64_t __76__SBBannerManager_presenter_willTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bannerManager:containerWillTransitionToSize:withTransitionCoordinator:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (void)presenter:(id)a3 willPresentPresentable:(id)a4 withTransitionCoordinator:(id)a5 userInfo:(id)a6
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  id v10 = a4;
  id v28 = a5;
  id v26 = a6;
  objc_initWeak(&location, self);
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __87__SBBannerManager_presenter_willPresentPresentable_withTransitionCoordinator_userInfo___block_invoke;
  v44[3] = &unk_1E6B087B8;
  objc_copyWeak(&v46, &location);
  id v27 = v10;
  id v45 = v27;
  [v28 animateAlongsideTransition:v44 completion:0];
  id v11 = self;
  objc_sync_enter(v11);
  id v12 = [v29 topPresentables];
  id v13 = [v12 lastObject];

  id v14 = [(SBBannerManager *)v11 _windowSceneForPresenter:v29];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v41 = 0u;
  long long v40 = 0u;
  id obj = v11->_presentablesToGesturePriorityAssertions;
  uint64_t v15 = [(NSMapTable *)obj countByEnumeratingWithState:&v40 objects:v49 count:16];
  if (v15)
  {
    uint64_t v31 = *(void *)v41;
    do
    {
      uint64_t v16 = 0;
      uint64_t v32 = v15;
      do
      {
        if (*(void *)v41 != v31) {
          objc_enumerationMutation(obj);
        }
        char v17 = *(void **)(*((void *)&v40 + 1) + 8 * v16);
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        double v18 = [(NSMapTable *)v11->_presentablesToGesturePriorityAssertions objectForKey:v17];
        uint64_t v19 = [v18 countByEnumeratingWithState:&v36 objects:v48 count:16];
        if (v19)
        {
          uint64_t v20 = *(void *)v37;
          do
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v37 != v20) {
                objc_enumerationMutation(v18);
              }
              id v22 = *(void **)(*((void *)&v36 + 1) + 8 * i);
              [(SBBannerManager *)v11 _setWindowScene:v14 forGestureRecognizerPriorityAssertion:v22];
              [v22 setEnabled:v17 == v13];
            }
            uint64_t v19 = [v18 countByEnumeratingWithState:&v36 objects:v48 count:16];
          }
          while (v19);
        }

        ++v16;
      }
      while (v16 != v32);
      uint64_t v15 = [(NSMapTable *)obj countByEnumeratingWithState:&v40 objects:v49 count:16];
    }
    while (v15);
  }

  objc_sync_exit(v11);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __87__SBBannerManager_presenter_willPresentPresentable_withTransitionCoordinator_userInfo___block_invoke_2;
  v33[3] = &unk_1E6B0B4F0;
  v33[4] = v11;
  id v23 = v27;
  id v34 = v23;
  id v24 = v28;
  id v35 = v24;
  [(SBBannerManager *)v11 _enumerateObserversRespondingToSelector:sel_bannerManager_willPresentPresentable_withTransitionCoordinator_ usingBlock:v33];
  uint64_t v25 = [(SBBannerManager *)v11 _windowSceneForPresenter:v29];
  [(SBBannerManager *)v11 _updateZStackPolicyAssistantForWindowScene:v25 reasonSuffix:@"present presentable" transitionCoordinator:v24];

  objc_destroyWeak(&v46);
  objc_destroyWeak(&location);
}

void __87__SBBannerManager_presenter_willPresentPresentable_withTransitionCoordinator_userInfo___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _hideStatusBarIfNecessaryForPresentable:*(void *)(a1 + 32)];
}

uint64_t __87__SBBannerManager_presenter_willPresentPresentable_withTransitionCoordinator_userInfo___block_invoke_2(void *a1, void *a2)
{
  return [a2 bannerManager:a1[4] willPresentPresentable:a1[5] withTransitionCoordinator:a1[6]];
}

- (void)presenter:(id)a3 willDismissPresentable:(id)a4 withTransitionCoordinator:(id)a5 userInfo:(id)a6
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v10 = a4;
  id v27 = a5;
  id v25 = a6;
  objc_initWeak(&location, self);
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __87__SBBannerManager_presenter_willDismissPresentable_withTransitionCoordinator_userInfo___block_invoke;
  v41[3] = &unk_1E6B087B8;
  objc_copyWeak(&v43, &location);
  id v26 = v10;
  id v42 = v26;
  [v27 animateAlongsideTransition:v41 completion:0];
  id v11 = [v28 topPresentables];
  id v12 = [v11 lastObject];

  id v13 = self;
  objc_sync_enter(v13);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v13->_presentablesToGesturePriorityAssertions;
  uint64_t v14 = [(NSMapTable *)obj countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v38 != v15) {
          objc_enumerationMutation(obj);
        }
        char v17 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        double v18 = [(NSMapTable *)v13->_presentablesToGesturePriorityAssertions objectForKey:v17];
        uint64_t v19 = [v18 countByEnumeratingWithState:&v33 objects:v45 count:16];
        if (v19)
        {
          uint64_t v20 = *(void *)v34;
          do
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v34 != v20) {
                objc_enumerationMutation(v18);
              }
              [*(id *)(*((void *)&v33 + 1) + 8 * j) setEnabled:v17 == v12];
            }
            uint64_t v19 = [v18 countByEnumeratingWithState:&v33 objects:v45 count:16];
          }
          while (v19);
        }
      }
      uint64_t v14 = [(NSMapTable *)obj countByEnumeratingWithState:&v37 objects:v46 count:16];
    }
    while (v14);
  }

  objc_sync_exit(v13);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __87__SBBannerManager_presenter_willDismissPresentable_withTransitionCoordinator_userInfo___block_invoke_2;
  v30[3] = &unk_1E6B0B4F0;
  v30[4] = v13;
  id v22 = v26;
  id v31 = v22;
  id v23 = v27;
  id v32 = v23;
  [(SBBannerManager *)v13 _enumerateObserversRespondingToSelector:sel_bannerManager_willDismissPresentable_withTransitionCoordinator_ usingBlock:v30];
  id v24 = [(SBBannerManager *)v13 _windowSceneForPresenter:v28];
  [(SBBannerManager *)v13 _updateZStackPolicyAssistantForWindowScene:v24 reasonSuffix:@"dismiss presentable" transitionCoordinator:v23];

  objc_destroyWeak(&v43);
  objc_destroyWeak(&location);
}

void __87__SBBannerManager_presenter_willDismissPresentable_withTransitionCoordinator_userInfo___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _revealStatusBarIfNecessaryForPresentable:*(void *)(a1 + 32)];
  [WeakRetained _unregisterHomeGestureContextForPresentable:*(void *)(a1 + 32)];
}

uint64_t __87__SBBannerManager_presenter_willDismissPresentable_withTransitionCoordinator_userInfo___block_invoke_2(void *a1, void *a2)
{
  return [a2 bannerManager:a1[4] willDismissPresentable:a1[5] withTransitionCoordinator:a1[6]];
}

- (void)presenter:(id)a3 presentable:(id)a4 willTransitionToSize:(CGSize)a5 withTransitionCoordinator:(id)a6
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v10 = a4;
  id v11 = a6;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __88__SBBannerManager_presenter_presentable_willTransitionToSize_withTransitionCoordinator___block_invoke;
  v14[3] = &unk_1E6B0B518;
  v14[4] = self;
  id v15 = v10;
  CGFloat v17 = width;
  CGFloat v18 = height;
  id v16 = v11;
  id v12 = v11;
  id v13 = v10;
  [(SBBannerManager *)self _enumerateObserversRespondingToSelector:sel_bannerManager_presentable_willTransitionToSize_withTransitionCoordinator_ usingBlock:v14];
}

uint64_t __88__SBBannerManager_presenter_presentable_willTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bannerManager:presentable:willTransitionToSize:withTransitionCoordinator:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (id)panGestureRecognizerForPresenter:(id)a3
{
  id v4 = [(SBBannerManager *)self _windowSceneForPresenter:a3];
  [(SBBannerManager *)self _updateGesturePriorityForGestureRecognizerInWindowScene:v4];
  NSUInteger v5 = [(SBBannerManager *)self _panGestureInWindowScene:v4];

  return v5;
}

- (CGPoint)presenter:(id)a3 gestureRecognizer:(id)a4 locationForEvent:(id)a5 inView:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if ([v13 type] == 10)
  {
    id v15 = [(SBBannerManager *)self _windowSceneForPresenter:v11];
    id v16 = [(SBBannerManager *)self _panGestureInWindowScene:v15];
    if (v16 != v12)
    {
      id v31 = [MEMORY[0x1E4F28B00] currentHandler];
      [v31 handleFailureInMethod:a2, self, @"SBBannerManager.m", 488, @"Unknown gesture recognizer: %@", v12 object file lineNumber description];
    }
    uint64_t v17 = objc_opt_class();
    id v18 = v13;
    if (v17)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v19 = v18;
      }
      else {
        uint64_t v19 = 0;
      }
    }
    else
    {
      uint64_t v19 = 0;
    }
    id v22 = v19;

    if (objc_msgSend(v16, "sb_isInstalledAsSystemGesture"))
    {
      _UISystemGestureLocationForScrollEventInView();
      double v20 = v23;
      double v25 = v24;

      id v22 = [v15 reachabilitySceneOffsetProvider];
      [v22 effectiveReachabilityYOffset];
      double v21 = v25 - v26;
    }
    else
    {
      [v22 locationInView:v14];
      double v20 = v27;
      double v21 = v28;
    }
  }
  else
  {
    double v20 = *MEMORY[0x1E4F1DAD8];
    double v21 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }

  double v29 = v20;
  double v30 = v21;
  result.double y = v30;
  result.double x = v29;
  return result;
}

- (CGPoint)presenter:(id)a3 gestureRecognizer:(id)a4 locationForTouch:(id)a5 inView:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(SBBannerManager *)self _windowSceneForPresenter:a3];
  id v15 = [(SBBannerManager *)self _panGestureInWindowScene:v14];
  if (v15 != v11)
  {
    double v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"SBBannerManager.m", 502, @"Unknown gesture recognizer: %@", v11 object file lineNumber description];
  }
  if (objc_msgSend(v15, "sb_isInstalledAsSystemGesture"))
  {
    _UISystemGestureLocationForTouchInView();
    double v17 = v16;
    double v19 = v18;
    double v20 = [v14 reachabilitySceneOffsetProvider];
    [v20 effectiveReachabilityYOffset];
    double v22 = v19 - v21;
  }
  else
  {
    if (v12) {
      double v23 = v12;
    }
    else {
      double v23 = v11;
    }
    [v23 locationInView:v13];
    double v17 = v24;
    double v22 = v25;
  }

  double v26 = v17;
  double v27 = v22;
  result.double y = v27;
  result.double x = v26;
  return result;
}

- (CGPoint)presenter:(id)a3 gestureRecognizer:(id)a4 velocityInView:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  id v11 = [(SBBannerManager *)self _windowSceneForPresenter:a3];
  id v12 = [(SBBannerManager *)self _panGestureInWindowScene:v11];
  if (v12 != v9)
  {
    double v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"SBBannerManager.m", 514, @"Unknown gesture recognizer: %@", v9 object file lineNumber description];
  }
  if (objc_msgSend(v12, "sb_isInstalledAsSystemGesture")) {
    _UISystemGestureVelocityInView();
  }
  else {
    [v9 velocityInView:v10];
  }
  double v15 = v13;
  double v16 = v14;

  double v17 = v15;
  double v18 = v16;
  result.double y = v18;
  result.double x = v17;
  return result;
}

- (CGPoint)presenter:(id)a3 gestureRecognizer:(id)a4 translationInView:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  id v11 = [(SBBannerManager *)self _windowSceneForPresenter:a3];
  id v12 = [(SBBannerManager *)self _panGestureInWindowScene:v11];
  if (v12 != v9)
  {
    double v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"SBBannerManager.m", 522, @"Unknown gesture recognizer: %@", v9 object file lineNumber description];
  }
  if (objc_msgSend(v12, "sb_isInstalledAsSystemGesture")) {
    _UISystemGestureTranslationInView();
  }
  else {
    [v9 translationInView:v10];
  }
  double v15 = v13;
  double v16 = v14;

  double v17 = v15;
  double v18 = v16;
  result.double y = v18;
  result.double x = v17;
  return result;
}

- (void)presenterRequestsVisibility:(id)a3
{
  id v5 = [(SBBannerManager *)self _windowSceneForPresenter:a3];
  id v4 = [(SBBannerManager *)self _bannerWindowForWindowScene:v5 creatingIfNecessary:1];
  [(SBBannerManager *)self _invalidatePresenterVisibilityGestureRecognizerPriorityAssertionForWindowScene:v5];
  [v4 setHidden:0];
}

- (void)presenterRelinquishesVisibility:(id)a3
{
  id v4 = a3;
  id v10 = [(SBBannerManager *)self _windowSceneForPresenter:v4];
  -[SBBannerManager _acquirePresenterVisibilityGestureRecognizerPriorityAssertionForWindowScene:](self, "_acquirePresenterVisibilityGestureRecognizerPriorityAssertionForWindowScene:");
  id v5 = [(SBBannerManager *)self _windowForPresenter:v4];

  uint64_t v6 = objc_opt_class();
  id v7 = v5;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  id v9 = v8;

  [v9 resignAsKeyWindow];
  [v7 setHidden:1];
}

- (double)presenterMinimumPreferredTopEdgeInset:(id)a3
{
  id v4 = a3;
  id v5 = [(SBBannerManager *)self _windowSceneForPresenter:v4];
  uint64_t v6 = [v5 ambientPresentationController];
  char v7 = [v6 isPresented];

  double v8 = 0.0;
  if ((v7 & 1) == 0)
  {
    id v9 = [(SBBannerManager *)self _windowForPresenter:v4];
    id v10 = [MEMORY[0x1E4FA7D88] sharedInstanceForEmbeddedDisplay];
    [v10 interSensorRegionInWindowSpace];
    double v12 = v11;
    double v14 = v13;

    if ([v9 interfaceOrientation] == 1)
    {
      if ([v5 isMainDisplayWindowScene])
      {
        double top = self->_additionalEdgeInsets.top;
        if (top > v12 + v14) {
          double v8 = top + 12.0;
        }
      }
    }
  }
  return v8;
}

- (BOOL)bannerPanGestureRecognizer:(id)a3 shouldDisableTouchCancellationForTouch:(id)a4 event:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = [a3 windowScene];
  double v11 = [(SBBannerManager *)self _presenterForWindowScene:v10];

  [v11 allPresentables];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v12);
        }
        double v16 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && (objc_msgSend(v16, "shouldDisableTouchCancellationForTouch:event:", v8, v9, (void)v18) & 1) != 0)
        {
          LOBYTE(v13) = 1;
          goto LABEL_12;
        }
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v13;
}

- (BOOL)bannerPanGestureRecognizer:(id)a3 shouldCancelSystemDragGestureWithTouches:(id)a4 event:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = [a3 windowScene];
  double v11 = [(SBBannerManager *)self _presenterForWindowScene:v10];

  [v11 allPresentables];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v12);
        }
        double v16 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && (objc_msgSend(v16, "shouldCancelSystemDragGestureWithTouches:event:", v8, v9, (void)v18) & 1) != 0)
        {
          LOBYTE(v13) = 1;
          goto LABEL_12;
        }
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v13;
}

- (id)bannerSourceListener:(id)a3 layoutDescriptionWithError:(id *)a4
{
  id v5 = objc_msgSend((id)SBApp, "windowSceneManager", a3, a4);
  uint64_t v6 = [v5 activeDisplayWindowScene];

  char v7 = [(SBBannerManager *)self _bannerWindowForWindowScene:v6 creatingIfNecessary:1];
  [v7 bounds];
  id v8 = -[SBBannerManager _layoutDescriptionWithBounds:inWindowScene:](self, "_layoutDescriptionWithBounds:inWindowScene:", v6);

  return v8;
}

- (void)bannerSourceListener:(id)a3 presentationSize:(CGSize *)a4 containerSize:(CGSize *)a5 error:(id *)a6
{
  if (a5)
  {
    id v9 = objc_msgSend((id)SBApp, "windowSceneManager", a3, a4, a5, a6);
    id v33 = [v9 activeDisplayWindowScene];

    id v10 = [(SBBannerManager *)self _bannerWindowForWindowScene:v33 creatingIfNecessary:1];
    [v10 bounds];
    a5->CGFloat width = v13;
    a5->CGFloat height = v14;
    if (a4)
    {
      double v15 = v11;
      double v16 = v12;
      double v17 = v13;
      double v18 = v14;
      long long v19 = [(SBBannerManager *)self layoutManagerInWindowScene:v33];
      long long v20 = [MEMORY[0x1E4F42D90] mainScreen];
      objc_msgSend(v19, "useableContainerFrameInContainerBounds:onScreen:", v20, v15, v16, v17, v18);
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;
      double v28 = v27;

      double v29 = [MEMORY[0x1E4F42D90] mainScreen];
      [v29 scale];
      objc_msgSend(v19, "presentedFrameForContentWithPreferredSize:inUseableContainerFrame:containerBounds:scale:", v26, v28, v22, v24, v26, v28, *(void *)&v15, *(void *)&v16, *(void *)&v17, *(void *)&v18, v30);
      a4->CGFloat width = v31;
      a4->CGFloat height = v32;
    }
  }
}

- (BOOL)bannerSourceListener:(id)a3 requestsPostingPresentable:(id)a4 options:(unint64_t)a5 userInfo:(id)a6 error:(id *)a7
{
  return [(SBBannerManager *)self postPresentable:a4 withOptions:a5 userInfo:a6 error:a7];
}

- (id)bannerSourceListener:(id)a3 requestsRevokingPresentablesWithIdentification:(id)a4 reason:(id)a5 animated:(BOOL)a6 userInfo:(id)a7 error:(id *)a8
{
  return [(SBBannerManager *)self revokePresentablesWithIdentification:a4 reason:a5 options:0 animated:a6 userInfo:a7 error:a8];
}

- (BOOL)bannerSourceListener:(id)a3 recommendsSuspending:(BOOL)a4 forReason:(id)a5 revokingCurrent:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  BOOL v10 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  id v12 = a5;
  CGFloat v13 = self;
  objc_sync_enter(v13);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v13->_windowScenesToBannerControllers;
  uint64_t v14 = [(NSMapTable *)obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v24;
LABEL_3:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v24 != v15) {
        objc_enumerationMutation(obj);
      }
      double v17 = -[SBBannerManager _bannerControllerForWindowScene:](v13, "_bannerControllerForWindowScene:", *(void *)(*((void *)&v23 + 1) + 8 * v16), v21);
      char v18 = [v17 setSuspended:v10 forReason:v12 revokingCurrent:v8 error:a7];

      if ((v18 & 1) == 0) {
        break;
      }
      if (v14 == ++v16)
      {
        uint64_t v14 = [(NSMapTable *)obj countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v14) {
          goto LABEL_3;
        }
        BOOL v19 = 1;
        goto LABEL_11;
      }
    }
  }
  BOOL v19 = 0;
LABEL_11:

  objc_sync_exit(v13);
  return v19;
}

- (id)bannerSourceListener:(id)a3 sceneSpecificationForBannerSceneWithIdentifier:(id)a4 forProcess:(id)a5 userInfo:(id)a6
{
  id v6 = a6;
  char v7 = [v6 objectForKey:*MEMORY[0x1E4FA7FB0]];
  uint64_t v8 = objc_opt_class();
  id v9 = v7;
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      BOOL v10 = v9;
    }
    else {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }
  id v11 = v10;

  if (v11) {
    uint64_t v12 = [v11 BOOLValue];
  }
  else {
    uint64_t v12 = 1;
  }
  CGFloat v13 = [v6 objectForKey:*MEMORY[0x1E4FA7FD0]];
  uint64_t v14 = objc_opt_class();
  id v15 = v13;
  if (v14)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = 0;
    }
  }
  else
  {
    uint64_t v16 = 0;
  }
  id v17 = v16;

  char v18 = [v17 BOOLValue];
  if (v18) {
    goto LABEL_27;
  }
  BOOL v19 = [v6 objectForKey:*MEMORY[0x1E4FA7FC0]];
  uint64_t v20 = objc_opt_class();
  id v21 = v19;
  if (v20) {
    id v22 = (objc_opt_isKindOfClass() & 1) != 0 ? v21 : 0;
  }
  else {
    id v22 = 0;
  }
  id v23 = v22;

  char v24 = [v23 BOOLValue];
  if (v24) {
    goto LABEL_27;
  }
  long long v25 = [v6 objectForKey:*MEMORY[0x1E4FA7FC8]];
  uint64_t v26 = objc_opt_class();
  id v27 = v25;
  if (v26) {
    id v28 = (objc_opt_isKindOfClass() & 1) != 0 ? v27 : 0;
  }
  else {
    id v28 = 0;
  }
  id v29 = v28;

  char v30 = [v29 BOOLValue];
  if (v30) {
    goto LABEL_27;
  }
  id v33 = [v6 objectForKey:*MEMORY[0x1E4FA7FA0]];
  uint64_t v34 = objc_opt_class();
  id v35 = v33;
  if (v34) {
    id v36 = (objc_opt_isKindOfClass() & 1) != 0 ? v35 : 0;
  }
  else {
    id v36 = 0;
  }
  id v37 = v36;

  char v38 = [v37 BOOLValue];
  if (v38 & 1) != 0 || ((v12 ^ 1)) {
    goto LABEL_27;
  }
  long long v39 = [v6 objectForKey:*MEMORY[0x1E4FA7F90]];
  uint64_t v40 = objc_opt_class();
  id v41 = v39;
  if (v40) {
    id v42 = (objc_opt_isKindOfClass() & 1) != 0 ? v41 : 0;
  }
  else {
    id v42 = 0;
  }
  id v43 = v42;

  int v44 = [v43 BOOLValue];
  if (v44)
  {
LABEL_27:
    CGFloat v31 = [MEMORY[0x1E4FA7C60] specificationAffectingAppLifecycleIfInternal:v12];
  }
  else
  {
    CGFloat v31 = 0;
  }

  return v31;
}

- (void)bannerSourceListener:(id)a3 didUpdateInitialSceneSettingsWithParameters:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __84__SBBannerManager_bannerSourceListener_didUpdateInitialSceneSettingsWithParameters___block_invoke;
  v4[3] = &unk_1E6AF8858;
  v4[4] = self;
  [a4 updateSettingsWithBlock:v4];
}

void __84__SBBannerManager_bannerSourceListener_didUpdateInitialSceneSettingsWithParameters___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v14 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v14;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  char v7 = [(id)SBApp windowSceneManager];
  uint64_t v8 = [v7 activeDisplayWindowScene];

  id v9 = [*(id *)(a1 + 32) _bannerWindowForWindowScene:v8 creatingIfNecessary:1];
  objc_msgSend(v6, "setInterfaceOrientation:", objc_msgSend(v9, "interfaceOrientation"));
  BOOL v10 = [v8 _sbDisplayConfiguration];
  [v6 setDisplayConfiguration:v10];

  id v11 = [*(id *)(a1 + 32) _contentViewControllerForWindowScene:v8];
  uint64_t v12 = [v11 view];
  [v6 frame];
  objc_msgSend(v12, "convertRect:toView:", 0);
  objc_msgSend(v9, "_convertRectToSceneReferenceSpace:");

  BSRectWithSize();
  objc_msgSend(v6, "setFrame:");
  [v6 setClientContainerViewControllerClass:objc_opt_class()];
  CGFloat v13 = objc_msgSend(MEMORY[0x1E4FB33B0], "sb_thisDeviceDisplayEdgeInfo");
  objc_msgSend(v13, "sb_applyDisplayEdgeInfoToSceneSettings:", v6);
}

- (id)bannerSourceListener:(id)a3 newBannerSourceListenerPresentableForBannerSpecification:(id)a4 serviceDomain:(id)a5 scene:(id)a6 readyCompletion:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (![v12 contentBehavior])
  {
    if (!v14)
    {
      BOOL v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2, self, @"SBBannerManager.m", 673, @"Invalid parameter not satisfying: %@", @"scene" object file lineNumber description];
    }
    uint64_t v16 = [(BNBannerSourceListenerHostedPresentableViewController *)[SBBannerSourceListenerHostedPresentableViewController alloc] initWithSpecification:v12 serviceDomain:v13 scene:v14 readyCompletion:v15];
    goto LABEL_7;
  }
  if ([v12 contentBehavior] == 1)
  {
    uint64_t v16 = [[SBBannerSourceListenerTemplatePresentableViewController alloc] initWithSpecification:v12 serviceDomain:v13 readyCompletion:v15];
LABEL_7:
    id v17 = v16;
    goto LABEL_9;
  }
  id v17 = 0;
LABEL_9:

  return v17;
}

- (BOOL)bannerSourceListenerShouldEnablePresentableContextInterface:(id)a3
{
  return 1;
}

- (id)userInterfaceStyleTransitionAnimationSettingsForPresentable:(id)a3 forTransitionToStyle:(int64_t)a4
{
  return (id)[MEMORY[0x1E4FA79A8] animationSettingsForTransitionToStyle:a4];
}

- (void)cancelSystemDragForPresentable:(id)a3
{
  UIViewControllerFromPresentable();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v6 _sbWindowScene];
  if (v4)
  {
    id v5 = [(NSMapTable *)self->_windowScenesToPanGestures objectForKey:v4];
    if ([v5 isEnabled])
    {
      [v5 setEnabled:0];
      [v5 setEnabled:1];
    }
  }
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  id v8 = a4;
  id v6 = [(SBBannerManager *)self _zStackPolicyAssistantForParticipant:a3];
  char v7 = -[SBPhysicalButtonZStackPolicyAssistant physicalButtonSceneTargets]((uint64_t)v6);
  [v8 setPhysicalButtonSceneTargets:v7];

  [v8 setActivationPolicyForParticipantsBelow:0];
}

- (void)foregroundSceneZStackPolicyAssistantDidChange:(id)a3 forReason:(id)a4
{
  id v6 = a4;
  id v7 = [(SBBannerManager *)self _zStackParticipantForAssistant:a3];
  [v7 setNeedsUpdatePreferencesWithReason:v6];
}

- (BOOL)_handleButtonEventWithTest:(id)a3 handler:(id)a4
{
  id v6 = (void *)SBApp;
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 windowSceneManager];
  BOOL v10 = [v9 activeDisplayWindowScene];

  LOBYTE(self) = [(SBBannerManager *)self _handleButtonEventWithWindowScene:v10 test:v8 handler:v7];
  return (char)self;
}

- (BOOL)_handleButtonEventWithWindowScene:(id)a3 test:(id)a4 handler:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  BOOL v10 = (unsigned int (**)(id, void))a4;
  id v11 = a5;
  id v12 = (uint64_t (**)(void, void))v11;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"SBBannerManager.m", 730, @"Invalid parameter not satisfying: %@", @"test" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  id v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"SBBannerManager.m", 731, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];

LABEL_3:
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v13 = [(SBBannerManager *)self _presenterForWindowScene:v9];
  id v14 = [v13 topPresentables];

  uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        if (v10[2](v10, v18) && (v12[2](v12, v18) & 1) != 0)
        {
          LOBYTE(v15) = 1;
          goto LABEL_14;
        }
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return v15;
}

- (BOOL)handleHeadsetButtonPress:(BOOL)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__SBBannerManager_handleHeadsetButtonPress___block_invoke_2;
  v4[3] = &__block_descriptor_33_e25_B16__0___BNPresentable__8l;
  BOOL v5 = a3;
  return [(SBBannerManager *)self _handleButtonEventWithTest:&__block_literal_global_353 handler:v4];
}

uint64_t __44__SBBannerManager_handleHeadsetButtonPress___block_invoke()
{
  return objc_opt_respondsToSelector() & 1;
}

uint64_t __44__SBBannerManager_handleHeadsetButtonPress___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 handleHeadsetButtonPress:*(unsigned __int8 *)(a1 + 32)];
}

- (BOOL)handleHomeButtonPress
{
  return [(SBBannerManager *)self _handleButtonEventWithTest:&__block_literal_global_108_1 handler:&__block_literal_global_112_3];
}

uint64_t __40__SBBannerManager_handleHomeButtonPress__block_invoke()
{
  return objc_opt_respondsToSelector() & 1;
}

uint64_t __40__SBBannerManager_handleHomeButtonPress__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 handleHomeButtonPress];
}

- (BOOL)handleHomeButtonPressInWindowScene:(id)a3
{
  return [(SBBannerManager *)self _handleButtonEventWithWindowScene:a3 test:&__block_literal_global_114 handler:&__block_literal_global_116];
}

uint64_t __54__SBBannerManager_handleHomeButtonPressInWindowScene___block_invoke()
{
  return objc_opt_respondsToSelector() & 1;
}

uint64_t __54__SBBannerManager_handleHomeButtonPressInWindowScene___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 handleHomeButtonPress];
}

- (BOOL)handleHomeButtonDoublePress
{
  return [(SBBannerManager *)self _handleButtonEventWithTest:&__block_literal_global_118_1 handler:&__block_literal_global_122_1];
}

uint64_t __46__SBBannerManager_handleHomeButtonDoublePress__block_invoke()
{
  return objc_opt_respondsToSelector() & 1;
}

uint64_t __46__SBBannerManager_handleHomeButtonDoublePress__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 handleHomeButtonDoublePress];
}

- (BOOL)handleHomeButtonLongPress
{
  return [(SBBannerManager *)self _handleButtonEventWithTest:&__block_literal_global_124_0 handler:&__block_literal_global_128];
}

uint64_t __44__SBBannerManager_handleHomeButtonLongPress__block_invoke()
{
  return objc_opt_respondsToSelector() & 1;
}

uint64_t __44__SBBannerManager_handleHomeButtonLongPress__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 handleHomeButtonLongPress];
}

- (BOOL)handleLockButtonPress
{
  return [(SBBannerManager *)self _handleButtonEventWithTest:&__block_literal_global_130_0 handler:&__block_literal_global_134_0];
}

uint64_t __40__SBBannerManager_handleLockButtonPress__block_invoke()
{
  return objc_opt_respondsToSelector() & 1;
}

uint64_t __40__SBBannerManager_handleLockButtonPress__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 handleLockButtonPress];
}

- (BOOL)handleVoiceCommandButtonPress
{
  return [(SBBannerManager *)self _handleButtonEventWithTest:&__block_literal_global_136_2 handler:&__block_literal_global_140_0];
}

uint64_t __48__SBBannerManager_handleVoiceCommandButtonPress__block_invoke()
{
  return objc_opt_respondsToSelector() & 1;
}

uint64_t __48__SBBannerManager_handleVoiceCommandButtonPress__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 handleVoiceCommandButtonPress];
}

- (BOOL)handleVolumeUpButtonPress
{
  return [(SBBannerManager *)self _handleButtonEventWithTest:&__block_literal_global_142_0 handler:&__block_literal_global_146];
}

uint64_t __44__SBBannerManager_handleVolumeUpButtonPress__block_invoke()
{
  return objc_opt_respondsToSelector() & 1;
}

uint64_t __44__SBBannerManager_handleVolumeUpButtonPress__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 handleVolumeUpButtonPress];
}

- (BOOL)handleVolumeDownButtonPress
{
  return [(SBBannerManager *)self _handleButtonEventWithTest:&__block_literal_global_148_1 handler:&__block_literal_global_152_0];
}

uint64_t __46__SBBannerManager_handleVolumeDownButtonPress__block_invoke()
{
  return objc_opt_respondsToSelector() & 1;
}

uint64_t __46__SBBannerManager_handleVolumeDownButtonPress__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 handleVolumeDownButtonPress];
}

- (void)assistantWillAppear:(id)a3 windowScene:(id)a4
{
  id v5 = a4;
  uint64_t v6 = objc_opt_class();
  id v9 = v5;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      id v7 = v9;
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

  [(SBBannerManager *)self dismissAllBannersInWindowScene:v8 animated:1 reason:@"assistantWillAppear"];
}

- (void)ambientPresentationController:(id)a3 willUpdatePresented:(BOOL)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = self;
  objc_sync_enter(v6);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v6->_windowScenesToBannerControllers;
  uint64_t v8 = [(NSMapTable *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_msgSend(v11, "ambientPresentationController", (void)v14);
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        BOOL v13 = v12 == v5;

        if (v13)
        {
          [(SBBannerManager *)v6 dismissAllBannersInWindowScene:v11 animated:1 reason:@"Ambient presenting"];
          goto LABEL_11;
        }
      }
      uint64_t v8 = [(NSMapTable *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v6);
}

- (int64_t)platterHomeGestureManager:(id)a3 zStackParticipantIdentifierForParticipant:(id)a4
{
  return 22;
}

- (id)platterHomeGestureManager:(id)a3 orderedParticipants:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if ((unint64_t)[v5 count] < 2)
  {
    if ([v5 count])
    {
      BOOL v10 = [v5 allObjects];
    }
    else
    {
      BOOL v10 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    uint64_t v6 = [(id)SBApp windowSceneManager];
    id v7 = [v6 activeDisplayWindowScene];
    uint64_t v8 = [(SBBannerManager *)self _presenterForWindowScene:v7];

    uint64_t v9 = [v8 allPresentables];
    BOOL v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
    id v11 = (void *)[v5 mutableCopy];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v12 = v9;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          if (objc_msgSend(v11, "containsObject:", v17, (void)v20))
          {
            [v10 addObject:v17];
            [v11 removeObject:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v14);
    }

    uint64_t v18 = [v11 allObjects];
    [v10 addObjectsFromArray:v18];
  }
  return v10;
}

- (id)platterHomeGestureManager:(id)a3 windowForParticipant:(id)a4
{
  id v4 = a4;
  if (objc_opt_respondsToSelector())
  {
    id v5 = [v4 viewController];
    uint64_t v6 = [v5 view];
    id v7 = [v6 window];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)platterHomeGestureManager:(id)a3 gestureRecognizerPriorityAssertionForParticipant:(id)a4 reason:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v9 = [(SBBannerManager *)self acquireGestureRecognizerPriorityAssertionForPresentable:v7 priority:1 reason:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)platterHomeGestureManager:(id)a3 participantOwningHomeGestureDidChange:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  id v7 = [v6 presentableHomeGestureContext];
  if (!v7)
  {
    if (objc_opt_respondsToSelector())
    {
      id v7 = [v6 homeGestureContext];
    }
    else
    {
      id v7 = 0;
    }
  }
  int v8 = [v7 ownsHomeGesture];
  uint64_t v9 = self;
  objc_sync_enter(v9);
  presentableHomeGestureParticipantsToGesturePriorityAssertions = v9->_presentableHomeGestureParticipantsToGesturePriorityAssertions;
  if (v8)
  {
    id v11 = [(NSMapTable *)presentableHomeGestureParticipantsToGesturePriorityAssertions objectForKey:v6];
    [v11 invalidate];
    id v12 = [NSString stringWithFormat:@"platter participant acquired home gesture: %@", v6];
    uint64_t v13 = [(SBBannerManager *)v9 _acquireGestureRecognizerPriorityAssertionWithPriority:1 windowScene:0 reason:v12];

    uint64_t v14 = v9->_presentableHomeGestureParticipantsToGesturePriorityAssertions;
    if (!v14)
    {
      uint64_t v15 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
      long long v16 = v9->_presentableHomeGestureParticipantsToGesturePriorityAssertions;
      v9->_presentableHomeGestureParticipantsToGesturePriorityAssertions = (NSMapTable *)v15;

      uint64_t v14 = v9->_presentableHomeGestureParticipantsToGesturePriorityAssertions;
    }
    [(NSMapTable *)v14 setObject:v13 forKey:v6];
  }
  else
  {
    uint64_t v13 = [(NSMapTable *)presentableHomeGestureParticipantsToGesturePriorityAssertions objectForKey:v6];
    [v13 invalidate];
    [(NSMapTable *)v9->_presentableHomeGestureParticipantsToGesturePriorityAssertions removeObjectForKey:v6];
    if (![(NSMapTable *)v9->_presentableHomeGestureParticipantsToGesturePriorityAssertions count])
    {
      uint64_t v17 = v9->_presentableHomeGestureParticipantsToGesturePriorityAssertions;
      v9->_presentableHomeGestureParticipantsToGesturePriorityAssertions = 0;
    }
  }

  objc_sync_exit(v9);
}

- (id)acquireWindowLevelAssertionWithPriority:(int64_t)a3 windowLevel:(double)a4 windowScene:(id)a5 reason:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v12 = -[SBBannerManager _presenterForWindowScene:](self, "_presenterForWindowScene:", v10, 0);
  uint64_t v13 = [v12 topPresentables];

  uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    long long v16 = 0;
    uint64_t v17 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v13);
        }
        if (!v16)
        {
          uint64_t v19 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0
            && [v19 shouldAcquireWindowLevelAssertion])
          {
            long long v16 = [(SBWindowLevelAssertionManager *)self->_windowLevelAssertionManager acquireWindowLevelAssertionWithPriority:a3 windowLevel:v10 windowScene:v11 reason:a4];
          }
          else
          {
            long long v16 = 0;
          }
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v15);
  }
  else
  {
    long long v16 = 0;
  }

  return v16;
}

- (void)windowLevelAssertionManager:(id)a3 didUpdateAssertionsForWindowScene:(id)a4
{
}

+ (id)_defaultAuthorizedBundleIDs
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = [v2 URLForResource:@"BannersAuthorizedBundleIDs" withExtension:@"plist"];

  id v4 = [MEMORY[0x1E4F1CA48] arrayWithContentsOfURL:v3];
  [v4 addObject:@"com.apple.SOSBuddy"];
  id v5 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];

  return v5;
}

- (id)_bannerControllerForWindowScene:(id)a3
{
  return (id)[a3 bannerController];
}

- (id)_presenterForWindowScene:(id)a3
{
  id v3 = [(SBBannerManager *)self _bannerControllerForWindowScene:a3];
  id v4 = [v3 presenter];

  return v4;
}

- (id)_presenterForPresentable:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v5->_windowScenesToBannerControllers;
  uint64_t v7 = [(NSMapTable *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v15 != v8) {
        objc_enumerationMutation(v6);
      }
      id v10 = -[SBBannerManager _presenterForWindowScene:](v5, "_presenterForWindowScene:", *(void *)(*((void *)&v14 + 1) + 8 * v9), (void)v14);
      id v11 = [v10 allPresentables];
      char v12 = [v11 containsObject:v4];

      if (v12) {
        break;
      }

      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMapTable *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    id v10 = 0;
  }

  objc_sync_exit(v5);
  return v10;
}

- (id)_contentViewControllerForWindowScene:(id)a3
{
  id v3 = [(SBBannerManager *)self _presenterForWindowScene:a3];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (id)_windowForPresenter:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  uint64_t v8 = [v7 viewIfLoaded];

  uint64_t v9 = [v8 window];

  return v9;
}

- (id)_bannerWindowForWindowScene:(id)a3 creatingIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    id v7 = self;
    objc_sync_enter(v7);
    uint64_t v8 = [(NSMapTable *)v7->_windowScenesToBannerWindows objectForKey:v6];
    if (v8) {
      BOOL v9 = 1;
    }
    else {
      BOOL v9 = !v4;
    }
    if (!v9)
    {
      int v10 = SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleBanner");
      if (v10)
      {
        uint64_t v8 = [[SBBannerWindow alloc] initWithWindowScene:v6];
        if (!v7->_windowParticipantDelegate)
        {
          id v11 = objc_alloc_init(SBTraitsWindowParticipantDelegate);
          windowParticipantDelegate = v7->_windowParticipantDelegate;
          v7->_windowParticipantDelegate = v11;
        }
        if (!v7->_windowScenesToTraitsParticipant)
        {
          uint64_t v13 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
          windowScenesToTraitsParticipant = v7->_windowScenesToTraitsParticipant;
          v7->_windowScenesToTraitsParticipant = (NSMapTable *)v13;
        }
        long long v15 = [v6 traitsArbiter];
        long long v16 = [v15 acquireParticipantWithRole:@"SBTraitsParticipantRoleBanner" delegate:v7->_windowParticipantDelegate];

        [(SBTraitsWindowParticipantDelegate *)v7->_windowParticipantDelegate setParticipant:v16 ownedByWindow:v8];
        [(SBTraitsWindowParticipantDelegate *)v7->_windowParticipantDelegate windowDidUpdatePreferredWindowLevel:v16 ownedParticipant:*MEMORY[0x1E4F43CF8] + 40.0];
        [v16 setNeedsUpdatePreferencesWithReason:@"Setup"];
        [(NSMapTable *)v7->_windowScenesToTraitsParticipant setObject:v16 forKey:v6];
      }
      else
      {
        uint64_t v8 = [[SBOldBannerWindow alloc] initWithWindowScene:v6];
      }
      windowScenesToBannerWindows = v7->_windowScenesToBannerWindows;
      if (!windowScenesToBannerWindows)
      {
        uint64_t v18 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
        uint64_t v19 = v7->_windowScenesToBannerWindows;
        v7->_windowScenesToBannerWindows = (NSMapTable *)v18;

        windowScenesToBannerWindows = v7->_windowScenesToBannerWindows;
      }
      [(NSMapTable *)windowScenesToBannerWindows setObject:v8 forKey:v6];
      long long v20 = [(SBBannerManager *)v7 _presenterForWindowScene:v6];
      if (v10)
      {
        uint64_t v21 = objc_opt_class();
        id v22 = v20;
        if (v21)
        {
          if (objc_opt_isKindOfClass()) {
            long long v23 = v22;
          }
          else {
            long long v23 = 0;
          }
        }
        else
        {
          long long v23 = 0;
        }
        uint64_t v27 = v23;

        [(SBBannerWindow *)v8 setRootViewController:v27];
      }
      else
      {
        uint64_t v24 = objc_opt_class();
        uint64_t v25 = v8;
        if (v24)
        {
          if (objc_opt_isKindOfClass()) {
            uint64_t v26 = v25;
          }
          else {
            uint64_t v26 = 0;
          }
        }
        else
        {
          uint64_t v26 = 0;
        }
        uint64_t v27 = v26;

        uint64_t v28 = objc_opt_class();
        id v29 = v20;
        if (v28)
        {
          if (objc_opt_isKindOfClass()) {
            char v30 = v29;
          }
          else {
            char v30 = 0;
          }
        }
        else
        {
          char v30 = 0;
        }
        id v31 = v30;

        [(SBBannerWindow *)v27 setContentViewController:v31];
      }

      [(SBBannerManager *)v7 _updateWindowLevelForScene:v6];
      [(SBBannerManager *)v7 _acquirePresenterVisibilityGestureRecognizerPriorityAssertionForWindowScene:v6];
    }
    objc_sync_exit(v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)_bannerWindowForWindowScene:(id)a3
{
  return [(SBBannerManager *)self _bannerWindowForWindowScene:a3 creatingIfNecessary:0];
}

- (id)_windowSceneForBannerController:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = self;
    objc_sync_enter(v5);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = v5->_windowScenesToBannerControllers;
    id v7 = (id)[(NSMapTable *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v6);
          }
          int v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          -[NSMapTable objectForKey:](v5->_windowScenesToBannerControllers, "objectForKey:", v10, (void)v14);
          id v11 = (id)objc_claimAutoreleasedReturnValue();
          BOOL v12 = v11 == v4;

          if (v12)
          {
            id v7 = v10;
            goto LABEL_12;
          }
        }
        id v7 = (id)[(NSMapTable *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    objc_sync_exit(v5);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_windowSceneForPresenter:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = self;
    objc_sync_enter(v5);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v5->_windowScenesToBannerControllers;
    id v7 = (id)[(NSMapTable *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v6);
          }
          int v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          id v11 = -[NSMapTable objectForKey:](v5->_windowScenesToBannerControllers, "objectForKey:", v10, (void)v15);
          id v12 = [v11 presenter];
          BOOL v13 = v12 == v4;

          if (v13)
          {
            id v7 = v10;

            goto LABEL_12;
          }
        }
        id v7 = (id)[(NSMapTable *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    objc_sync_exit(v5);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_layoutDescriptionWithBounds:(CGRect)a3 inWindowScene:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  int v10 = [(SBBannerManager *)self layoutManagerInWindowScene:v9];
  id v11 = [v9 screen];
  CGFloat v33 = width;
  CGFloat v34 = height;
  objc_msgSend(v10, "useableContainerFrameInContainerBounds:onScreen:", v11, x, y, width, height);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  uint64_t v20 = [v9 screen];

  [v20 scale];
  objc_msgSend(v10, "presentedFrameForContentWithPreferredSize:inUseableContainerFrame:containerBounds:scale:", v17, v19, v13, v15, v17, v19, *(void *)&x, *(void *)&y, *(void *)&width, *(void *)&height, v21);
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  double v27 = v26;
  double v29 = v28;

  v36.origin.double x = v23;
  v36.origin.double y = v25;
  v36.size.double width = v27;
  v36.size.double height = v29;
  double MinY = CGRectGetMinY(v36);
  v37.origin.double x = x;
  v37.origin.double y = y;
  v37.size.double width = v33;
  v37.size.double height = v34;
  id v31 = objc_msgSend(MEMORY[0x1E4F4F5C0], "bannerSourceLayoutDescriptionWithPresentationSize:containerSize:offsetFromPresentationEdge:", v27, v29, v17, v19, MinY - CGRectGetMinY(v37));

  return v31;
}

- (void)_updateWindowLevelForScene:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SBBannerManager *)self _bannerWindowForWindowScene:v4];
  id v6 = [(SBWindowLevelAssertionManager *)self->_windowLevelAssertionManager highestPriorityWindowLevelAssertionForWindowScene:v4];

  [v5 windowLevel];
  double v8 = v7;
  if (v6) {
    [v6 windowLevel];
  }
  else {
    double v9 = *MEMORY[0x1E4F43CF8] + 40.0;
  }
  [v5 setWindowLevel:v9];
  [v5 windowLevel];
  if (v10 != v8)
  {
    id v11 = SBLogBanners();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      double v16 = v5;
      __int16 v17 = 2114;
      double v18 = v6;
      _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "Updated banner window level using assertion: banner window: %{public}@; assertion: %{public}@",
        buf,
        0x16u);
    }

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __46__SBBannerManager__updateWindowLevelForScene___block_invoke;
    v13[3] = &unk_1E6B0B580;
    v13[4] = self;
    id v14 = v5;
    [(SBBannerManager *)self _enumerateObserversRespondingToSelector:sel_bannerManager_didUpdateWindowLevelOfWindow_ usingBlock:v13];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __46__SBBannerManager__updateWindowLevelForScene___block_invoke_2;
    v12[3] = &unk_1E6B0B5A8;
    v12[4] = self;
    [(SBBannerManager *)self _enumerateObserversRespondingToSelector:sel_bannerManagerDidUpdateWindowLevel_ usingBlock:v12];
  }
}

uint64_t __46__SBBannerManager__updateWindowLevelForScene___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bannerManager:*(void *)(a1 + 32) didUpdateWindowLevelOfWindow:*(void *)(a1 + 40)];
}

uint64_t __46__SBBannerManager__updateWindowLevelForScene___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bannerManagerDidUpdateWindowLevel:*(void *)(a1 + 32)];
}

- (id)_panGestureInWindowScene:(id)a3 creatingIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    double v7 = self;
    objc_sync_enter(v7);
    double v8 = [(NSMapTable *)v7->_windowScenesToPanGestures objectForKey:v6];
    if (v8) {
      BOOL v9 = 1;
    }
    else {
      BOOL v9 = !v4;
    }
    if (!v9)
    {
      double v10 = objc_alloc_init(SBBannerPanGestureRecognizer);
      [(SBBannerPanGestureRecognizer *)v10 setWindowScene:v6];
      double v8 = v10;
      [(SBBannerPanGestureRecognizer *)v8 setSystemDragCancellingDelegate:v7];
      id v11 = [MEMORY[0x1E4F42948] currentDevice];
      uint64_t v12 = [v11 userInterfaceIdiom];

      if ((v12 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
        [(SBBannerPanGestureRecognizer *)v8 setAllowedScrollTypesMask:3];
      }
      double v13 = [(SBBannerPanGestureRecognizer *)v8 allowedTouchTypes];
      id v14 = (void *)[v13 mutableCopy];

      [v14 removeObject:&unk_1F334B3F0];
      [(SBBannerPanGestureRecognizer *)v8 setAllowedTouchTypes:v14];
      [(SBBannerPanGestureRecognizer *)v8 setName:@"bannerPan"];
      windowScenesToPanGestures = v7->_windowScenesToPanGestures;
      if (!windowScenesToPanGestures)
      {
        uint64_t v16 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
        __int16 v17 = v7->_windowScenesToPanGestures;
        v7->_windowScenesToPanGestures = (NSMapTable *)v16;

        windowScenesToPanGestures = v7->_windowScenesToPanGestures;
      }
      [(NSMapTable *)windowScenesToPanGestures setObject:v8 forKey:v6];
    }
    objc_sync_exit(v7);
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

- (id)_panGestureInWindowScene:(id)a3
{
  return [(SBBannerManager *)self _panGestureInWindowScene:a3 creatingIfNecessary:0];
}

- (void)_updateGesturePriorityForGestureRecognizerInWindowScene:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(NSMutableArray *)self->_gesturePriorityAssertions bs_firstObjectPassingTest:&__block_literal_global_195];
  uint64_t v6 = [v5 priority];
  uint64_t v7 = [(SBBannerManager *)self _panGestureInWindowScene:v4 creatingIfNecessary:0];
  double v8 = (void *)v7;
  if (!v7)
  {
    double v8 = [(SBBannerManager *)self _panGestureInWindowScene:v4 creatingIfNecessary:1];
  }
  BOOL v9 = [v4 systemGestureManager];
  if (v8 && (!v7 || (v6 == 0) != objc_msgSend(v8, "sb_isInstalledAsSystemGesture")))
  {
    double v10 = SBLogBanners();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v11)
      {
        int v14 = 138543618;
        double v15 = v8;
        __int16 v16 = 2114;
        __int16 v17 = v5;
        _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Updating gesture recognizer priority to default using assertion: gestureRecognizer: %{public}@; assertion: %{public}@",
          (uint8_t *)&v14,
          0x16u);
      }

      if (objc_msgSend(v8, "sb_isInstalledAsSystemGesture")) {
        [v9 removeGestureRecognizer:v8];
      }
      uint64_t v12 = [(SBBannerManager *)self _bannerWindowForWindowScene:v4];
      [v12 addGestureRecognizer:v8];

      goto LABEL_16;
    }
    if (v11)
    {
      int v14 = 138543618;
      double v15 = v8;
      __int16 v16 = 2114;
      __int16 v17 = v5;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Updating gesture recognizer priority to system using assertion: gestureRecognizer: %{public}@; assertion: %{public}@",
        (uint8_t *)&v14,
        0x16u);
    }

    double v13 = [v8 view];
    [v13 removeGestureRecognizer:v8];

    if ([v9 isValid])
    {
      [v9 addGestureRecognizer:v8 withType:110];
LABEL_16:
      objc_msgSend(v8, "sb_setInstalledAsSystemGesture:", v6 == 0);
    }
  }
}

uint64_t __75__SBBannerManager__updateGesturePriorityForGestureRecognizerInWindowScene___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEnabled];
}

- (void)_setWindowScene:(id)a3 forGestureRecognizerPriorityAssertion:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (v11 && v6)
  {
    uint64_t v7 = self;
    objc_sync_enter(v7);
    gesturePriorityAssertionsToWindowScenes = v7->_gesturePriorityAssertionsToWindowScenes;
    if (!gesturePriorityAssertionsToWindowScenes)
    {
      uint64_t v9 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
      double v10 = v7->_gesturePriorityAssertionsToWindowScenes;
      v7->_gesturePriorityAssertionsToWindowScenes = (NSMapTable *)v9;

      gesturePriorityAssertionsToWindowScenes = v7->_gesturePriorityAssertionsToWindowScenes;
    }
    [(NSMapTable *)gesturePriorityAssertionsToWindowScenes setObject:v11 forKey:v6];
    [(SBBannerManager *)v7 _updateGesturePriorityForGestureRecognizerInWindowScene:v11];
    objc_sync_exit(v7);
  }
}

- (id)_acquireGestureRecognizerPriorityAssertionWithPriority:(int64_t)a3 windowScene:(id)a4 reason:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  if (+[SBBannerGestureRecognizerPriorityAssertion isValidBannerGestureRecognizerPriority:a3])
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    CGFloat v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"SBBannerManager.m", 1142, @"Invalid parameter not satisfying: %@", @"[SBBannerGestureRecognizerPriorityAssertion isValidBannerGestureRecognizerPriority:priority]" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  double v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"SBBannerManager.m", 1143, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];

LABEL_3:
  uint64_t v38 = 0;
  long long v39 = &v38;
  uint64_t v40 = 0x3032000000;
  id v41 = __Block_byref_object_copy__101;
  id v42 = __Block_byref_object_dispose__101;
  id v43 = 0;
  id v11 = self;
  objc_sync_enter(v11);
  gesturePriorityAssertions = v11->_gesturePriorityAssertions;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __93__SBBannerManager__acquireGestureRecognizerPriorityAssertionWithPriority_windowScene_reason___block_invoke;
  v35[3] = &unk_1E6B0B5F0;
  id v13 = v10;
  id v36 = v13;
  CGRect v37 = &v38;
  [(NSMutableArray *)gesturePriorityAssertions enumerateObjectsUsingBlock:v35];
  if (!v39[5])
  {
    objc_initWeak(&location, v11);
    int v14 = [SBBannerGestureRecognizerPriorityAssertion alloc];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __93__SBBannerManager__acquireGestureRecognizerPriorityAssertionWithPriority_windowScene_reason___block_invoke_2;
    v32[3] = &unk_1E6B0B618;
    objc_copyWeak(&v33, &location);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __93__SBBannerManager__acquireGestureRecognizerPriorityAssertionWithPriority_windowScene_reason___block_invoke_205;
    v30[3] = &unk_1E6B0B618;
    objc_copyWeak(&v31, &location);
    uint64_t v15 = [(SBBannerGestureRecognizerPriorityAssertion *)v14 initWithPriority:a3 reason:v13 enablementChangeHandler:v32 invalidationHandler:v30];
    __int16 v16 = (void *)v39[5];
    v39[5] = v15;

    __int16 v17 = v11->_gesturePriorityAssertions;
    if (!v17)
    {
      uint64_t v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v19 = v11->_gesturePriorityAssertions;
      v11->_gesturePriorityAssertions = v18;

      __int16 v17 = v11->_gesturePriorityAssertions;
    }
    uint64_t v26 = 0;
    double v27 = &v26;
    uint64_t v28 = 0x2020000000;
    uint64_t v29 = 0;
    uint64_t v29 = [(NSMutableArray *)v17 count];
    uint64_t v20 = v11->_gesturePriorityAssertions;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __93__SBBannerManager__acquireGestureRecognizerPriorityAssertionWithPriority_windowScene_reason___block_invoke_2_206;
    v25[3] = &unk_1E6B0B640;
    v25[4] = &v26;
    v25[5] = a3;
    [(NSMutableArray *)v20 enumerateObjectsUsingBlock:v25];
    [(NSMutableArray *)v11->_gesturePriorityAssertions insertObject:v39[5] atIndex:v27[3]];
    if (v9) {
      [(SBBannerManager *)v11 _setWindowScene:v9 forGestureRecognizerPriorityAssertion:v39[5]];
    }
    _Block_object_dispose(&v26, 8);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }

  objc_sync_exit(v11);
  id v21 = (id)v39[5];
  _Block_object_dispose(&v38, 8);

  return v21;
}

void __93__SBBannerManager__acquireGestureRecognizerPriorityAssertionWithPriority_windowScene_reason___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  uint64_t v7 = [v9 reason];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __93__SBBannerManager__acquireGestureRecognizerPriorityAssertionWithPriority_windowScene_reason___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = SBLogBanners();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v3;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Gesture recognizer priority assertion enablement did change: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v7 = [WeakRetained[10] objectForKey:v3];
    [v6 _updateGesturePriorityForGestureRecognizerInWindowScene:v7];
  }
}

void __93__SBBannerManager__acquireGestureRecognizerPriorityAssertionWithPriority_windowScene_reason___block_invoke_205(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained && [WeakRetained[9] containsObject:v8])
  {
    [v4[9] removeObject:v8];
    if (![v4[9] count])
    {
      id v5 = v4[9];
      v4[9] = 0;
    }
    id v6 = [v4[10] objectForKey:v8];
    [v4[10] removeObjectForKey:v8];
    if (![v4[10] count])
    {
      id v7 = v4[10];
      v4[10] = 0;
    }
    [v4 _updateGesturePriorityForGestureRecognizerInWindowScene:v6];
  }
}

uint64_t __93__SBBannerManager__acquireGestureRecognizerPriorityAssertionWithPriority_windowScene_reason___block_invoke_2_206(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t result = [a2 priority];
  if (v7 < result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (void)_invalidatePresenterVisibilityGestureRecognizerPriorityAssertionForWindowScene:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    id v5 = self;
    objc_sync_enter(v5);
    id v6 = [(NSMapTable *)v5->_windowScenesToPresenterVisibilityGesturePriorityAssertions objectForKey:v8];
    [v6 invalidate];
    if (![(NSMapTable *)v5->_windowScenesToPresenterVisibilityGesturePriorityAssertions count])
    {
      windowScenesToPresenterVisibilityGesturePriorityAssertions = v5->_windowScenesToPresenterVisibilityGesturePriorityAssertions;
      v5->_windowScenesToPresenterVisibilityGesturePriorityAssertions = 0;
    }
    objc_sync_exit(v5);

    id v4 = v8;
  }
}

- (void)_acquirePresenterVisibilityGestureRecognizerPriorityAssertionForWindowScene:(id)a3
{
  id v9 = a3;
  if (v9)
  {
    id v4 = self;
    objc_sync_enter(v4);
    windowScenesToPresenterVisibilityGesturePriorityAssertions = v4->_windowScenesToPresenterVisibilityGesturePriorityAssertions;
    if (!windowScenesToPresenterVisibilityGesturePriorityAssertions)
    {
      uint64_t v6 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
      uint64_t v7 = v4->_windowScenesToPresenterVisibilityGesturePriorityAssertions;
      v4->_windowScenesToPresenterVisibilityGesturePriorityAssertions = (NSMapTable *)v6;

      windowScenesToPresenterVisibilityGesturePriorityAssertions = v4->_windowScenesToPresenterVisibilityGesturePriorityAssertions;
    }
    id v8 = [(SBBannerManager *)v4 _acquireGestureRecognizerPriorityAssertionWithPriority:1 windowScene:v9 reason:@"presenter relinquishes visibility"];
    [(NSMapTable *)windowScenesToPresenterVisibilityGesturePriorityAssertions setObject:v8 forKey:v9];

    objc_sync_exit(v4);
  }
}

- (BOOL)_isPresentableHUD:(id)a3
{
  id v3 = a3;
  BOOL v4 = (objc_opt_respondsToSelector() & 1) != 0 && [v3 presentableType] == 1;

  return v4;
}

- (BOOL)_isPresentableNotice:(id)a3
{
  id v4 = a3;
  BOOL v5 = (objc_opt_respondsToSelector() & 1) != 0 && [v4 presentableBehavior] == 1
    || [(SBBannerManager *)self _isPresentableHUD:v4];

  return v5;
}

- (BOOL)_shouldHideStatusBarForPresentable:(id)a3
{
  id v4 = a3;
  if (SBFEffectiveHomeButtonType() == 2)
  {
LABEL_4:
    LOBYTE(v5) = 0;
    goto LABEL_10;
  }
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      BOOL v5 = ![(SBBannerManager *)self _isPresentableNotice:v4];
      goto LABEL_10;
    }
    goto LABEL_4;
  }
  uint64_t v6 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v6 userInterfaceIdiom] == 1) {
    LOBYTE(v5) = 0;
  }
  else {
    BOOL v5 = ![(SBBannerManager *)self _isPresentableNotice:v4];
  }

LABEL_10:
  return v5;
}

- (id)_statusBarAssertionReasonForPresentable:(id)a3
{
  v11[3] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v3 = a3;
    id v4 = (objc_class *)objc_opt_class();
    BOOL v5 = NSStringFromClass(v4);
    uint64_t v6 = objc_msgSend(v3, "requesterIdentifier", v5);
    v11[1] = v6;
    uint64_t v7 = [v3 requestIdentifier];

    v11[2] = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];
    id v9 = [v8 componentsJoinedByString:@"."];
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

- (void)_hideStatusBarIfNecessaryForPresentable:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5 && [(SBBannerManager *)self _shouldHideStatusBarForPresentable:v5])
  {
    uint64_t v6 = [(SBBannerManager *)self _statusBarAssertionReasonForPresentable:v5];
    if (([(NSMutableSet *)self->_statusBarAssertionReasons containsObject:v6] & 1) == 0)
    {
      uint64_t v7 = SBLogBanners();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        BNEffectivePresentableDescription();
        id v8 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        double v27 = v8;
        _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Hiding status bar for presentable: %{public}@", buf, 0xCu);
      }
      if (![(NSMutableSet *)self->_statusBarAssertionReasons count])
      {
        if (!self->_statusBarAssertionReasons)
        {
          id v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
          statusBarAssertionReasons = self->_statusBarAssertionReasons;
          self->_statusBarAssertionReasons = v9;
        }
        if (self->_systemStatusBarAssertion)
        {
          double v24 = [MEMORY[0x1E4F28B00] currentHandler];
          [v24 handleFailureInMethod:a2, self, @"SBBannerManager.m", 1252, @"We have a system status bar assertion, but no reasons: %@", self->_systemStatusBarAssertion object file lineNumber description];
        }
        if (self->_appsStatusBarAssertion)
        {
          CGFloat v25 = [MEMORY[0x1E4F28B00] currentHandler];
          [v25 handleFailureInMethod:a2, self, @"SBBannerManager.m", 1253, @"We have an apps status bar assertion, but no reasons: %@", self->_appsStatusBarAssertion object file lineNumber description];
        }
        id v11 = SBLogBanners();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "Hiding status bar", buf, 2u);
        }

        uint64_t v12 = +[SBWindowSceneStatusBarManager windowSceneStatusBarManagerForEmbeddedDisplay];
        id v13 = [v12 assertionManager];

        int v14 = (objc_class *)objc_opt_class();
        uint64_t v15 = NSStringFromClass(v14);
        __int16 v16 = (BSInvalidatable *)[v13 newSettingsAssertionWithStatusBarHidden:1 atLevel:12 reason:v15];
        systemStatusBarAssertion = self->_systemStatusBarAssertion;
        self->_systemStatusBarAssertion = v16;

        [(BSInvalidatable *)self->_systemStatusBarAssertion acquire];
        uint64_t v18 = [(SBBannerManager *)self windowSceneForPresentable:v5];
        uint64_t v19 = [v18 switcherController];
        uint64_t v20 = [v19 requestInAppStatusBarHiddenAssertionForReason:@"SBNotificationBannerDestination" animated:0];
        appsStatusBarAssertion = self->_appsStatusBarAssertion;
        self->_appsStatusBarAssertion = v20;
      }
      double v22 = SBLogBanners();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        CGFloat v23 = self->_statusBarAssertionReasons;
        *(_DWORD *)buf = 138543362;
        double v27 = v23;
        _os_log_impl(&dword_1D85BA000, v22, OS_LOG_TYPE_DEFAULT, "Status bar hidden: %{public}@", buf, 0xCu);
      }

      [(NSMutableSet *)self->_statusBarAssertionReasons addObject:v6];
    }
  }
}

- (void)_revealStatusBarIfNecessaryForPresentable:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5 && [(SBBannerManager *)self _shouldHideStatusBarForPresentable:v5])
  {
    uint64_t v6 = [(SBBannerManager *)self _statusBarAssertionReasonForPresentable:v5];
    if ([(NSMutableSet *)self->_statusBarAssertionReasons containsObject:v6])
    {
      uint64_t v7 = SBLogBanners();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        BNEffectivePresentableDescription();
        id v8 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        __int16 v16 = v8;
        _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Revealing status bar for presentable: %{public}@", buf, 0xCu);
      }
      [(NSMutableSet *)self->_statusBarAssertionReasons removeObject:v6];
      if ([(NSMutableSet *)self->_statusBarAssertionReasons count])
      {
        appsStatusBarAssertion = SBLogBanners();
        if (os_log_type_enabled(appsStatusBarAssertion, OS_LOG_TYPE_DEFAULT))
        {
          statusBarAssertionReasons = self->_statusBarAssertionReasons;
          *(_DWORD *)buf = 138543362;
          __int16 v16 = statusBarAssertionReasons;
          _os_log_impl(&dword_1D85BA000, appsStatusBarAssertion, OS_LOG_TYPE_DEFAULT, "Status bar hidden: %{public}@", buf, 0xCu);
        }
      }
      else
      {
        if (!self->_systemStatusBarAssertion)
        {
          id v13 = [MEMORY[0x1E4F28B00] currentHandler];
          [v13 handleFailureInMethod:a2, self, @"SBBannerManager.m", 1274, @"We have a reason, but no system status bar assertion: %@", self->_systemStatusBarAssertion object file lineNumber description];
        }
        if (!self->_appsStatusBarAssertion)
        {
          int v14 = [MEMORY[0x1E4F28B00] currentHandler];
          [v14 handleFailureInMethod:a2, self, @"SBBannerManager.m", 1275, @"We have a reason, but no apps status bar assertion: %@", self->_appsStatusBarAssertion object file lineNumber description];
        }
        id v11 = SBLogBanners();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "Revealing status bar", buf, 2u);
        }

        [(BSInvalidatable *)self->_systemStatusBarAssertion invalidate];
        systemStatusBarAssertion = self->_systemStatusBarAssertion;
        self->_systemStatusBarAssertion = 0;

        [(BSInvalidatable *)self->_appsStatusBarAssertion invalidate];
        appsStatusBarAssertion = self->_appsStatusBarAssertion;
        self->_appsStatusBarAssertion = 0;
      }
    }
  }
}

- (id)_platterHomeGestureManager
{
  if (SBFEffectiveHomeButtonType() == 2 && !self->_platterHomeGestureManager)
  {
    id v3 = [[SBPlatterHomeGestureManager alloc] initWithDelegate:self];
    platterHomeGestureManager = self->_platterHomeGestureManager;
    self->_platterHomeGestureManager = v3;
  }
  id v5 = self->_platterHomeGestureManager;
  return v5;
}

- (id)_homeGestureContextForPresentable:(id)a3 windowScene:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector())
  {
    id v8 = [(SBBannerManager *)self _platterHomeGestureManager];
    id v9 = [v8 registerParticipant:v6 windowScene:v7];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)_unregisterHomeGestureContextForPresentable:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [(SBPlatterHomeGestureManager *)self->_platterHomeGestureManager unregisterParticipant:v4];
  }
}

- (id)_zStackParticipantForWindowScene:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(NSMapTable *)self->_windowScenesToZStackParticipants objectForKey:v4];
    if (!v5)
    {
      if (!self->_windowScenesToZStackParticipants)
      {
        id v6 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
        windowScenesToZStackParticipants = self->_windowScenesToZStackParticipants;
        self->_windowScenesToZStackParticipants = v6;
      }
      id v8 = [v4 zStackResolver];
      id v5 = [v8 acquireParticipantWithIdentifier:23 delegate:self];

      [(NSMapTable *)self->_windowScenesToZStackParticipants setObject:v5 forKey:v4];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_zStackPolicyAssistantForWindowScene:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(NSMapTable *)self->_windowScenesToPhysicalButtonAssistants objectForKey:v4];
    if (!v5)
    {
      if (!self->_windowScenesToPhysicalButtonAssistants)
      {
        id v6 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
        windowScenesToPhysicalButtonAssistants = self->_windowScenesToPhysicalButtonAssistants;
        self->_windowScenesToPhysicalButtonAssistants = v6;
      }
      id v5 = [(SBZStackForegroundSceneOrderedPolicyAssistant *)[SBPhysicalButtonZStackPolicyAssistant alloc] initWithDelegate:self];
      [(NSMapTable *)self->_windowScenesToPhysicalButtonAssistants setObject:v5 forKey:v4];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_zStackPolicyAssistantForParticipant:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(NSMapTable *)self->_windowScenesToPhysicalButtonAssistants keyEnumerator];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [(NSMapTable *)self->_windowScenesToZStackParticipants objectForKey:v9];

        if (v10 == v4)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  id v11 = [(SBBannerManager *)self _zStackPolicyAssistantForWindowScene:v6];

  return v11;
}

- (id)_zStackParticipantForAssistant:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(NSMapTable *)self->_windowScenesToPhysicalButtonAssistants keyEnumerator];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [(NSMapTable *)self->_windowScenesToPhysicalButtonAssistants objectForKey:v9];

        if (v10 == v4)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  id v11 = [(SBBannerManager *)self _zStackParticipantForWindowScene:v6];

  return v11;
}

- (void)_updatePolicyAssistantForWindowScene:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SBBannerManager *)self _zStackParticipantForWindowScene:v4];
  if (v5)
  {
    id v16 = v5;
    long long v15 = [(SBBannerManager *)self _zStackPolicyAssistantForWindowScene:v4];
    [(SBBannerManager *)self _presenterForWindowScene:v4];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v14 = v20 = 0u;
    id v6 = [v14 topPresentables];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      id v9 = 0;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            long long v13 = [v12 targetSceneForPhysicalButtonInteraction];
            if (v13)
            {
              if (!v9)
              {
                id v9 = [MEMORY[0x1E4F1CA48] array];
              }
              [v9 addObject:v13];
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }
    else
    {
      id v9 = 0;
    }

    [v15 setForegroundScenes:v9];
    id v5 = v16;
  }
}

- (void)_updateZStackPolicyAssistantForWindowScene:(id)a3 reasonSuffix:(id)a4 transitionCoordinator:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [(SBBannerManager *)self _zStackParticipantForWindowScene:v7];
  if (v9)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __97__SBBannerManager__updateZStackPolicyAssistantForWindowScene_reasonSuffix_transitionCoordinator___block_invoke;
    v12[3] = &unk_1E6AF7D20;
    v12[4] = self;
    id v13 = v7;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __97__SBBannerManager__updateZStackPolicyAssistantForWindowScene_reasonSuffix_transitionCoordinator___block_invoke_2;
    v10[3] = &unk_1E6AF7D20;
    v10[4] = self;
    id v11 = v13;
    [v8 animateAlongsideTransition:v12 completion:v10];
  }
}

uint64_t __97__SBBannerManager__updateZStackPolicyAssistantForWindowScene_reasonSuffix_transitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePolicyAssistantForWindowScene:*(void *)(a1 + 40)];
}

uint64_t __97__SBBannerManager__updateZStackPolicyAssistantForWindowScene_reasonSuffix_transitionCoordinator___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePolicyAssistantForWindowScene:*(void *)(a1 + 40)];
}

- (void)_enumerateObserversRespondingToSelector:(SEL)a3 usingBlock:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(id, void))a4;
  if ([(NSHashTable *)self->_transitionObservers count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = (void *)[(NSHashTable *)self->_transitionObservers copy];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v12 + 1) + 8 * v10);
          if (objc_opt_respondsToSelector()) {
            v5[2](v5, v11);
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (void)_systemApertureInsetsDidChange:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"SBSystemApertureEdgeInsets"];

  [v5 UIEdgeInsetsValue];
  if (self->_additionalEdgeInsets.top != v6)
  {
    self->_additionalEdgeInsets.double top = v6;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v7 = [(NSMapTable *)self->_windowScenesToBannerControllers keyEnumerator];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if ([v12 isMainDisplayWindowScene])
          {
            long long v13 = [(SBBannerManager *)self _bannerControllerForWindowScene:v12];
            long long v14 = [v13 presenter];
            char v15 = objc_opt_respondsToSelector();

            if (v15)
            {
              id v16 = [v13 presenter];
              [v16 preferredMinimumTopInsetDidInvalidate];
            }
            goto LABEL_14;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
}

- (SBPresentableIntercepting)presentableInterceptor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentableInterceptor);
  return (SBPresentableIntercepting *)WeakRetained;
}

- (void)setPresentableInterceptor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentableInterceptor);
  objc_storeStrong((id *)&self->_windowParticipantDelegate, 0);
  objc_storeStrong((id *)&self->_windowScenesToTraitsParticipant, 0);
  objc_storeStrong((id *)&self->_presentableHomeGestureParticipantsToGesturePriorityAssertions, 0);
  objc_storeStrong((id *)&self->_platterHomeGestureManager, 0);
  objc_storeStrong((id *)&self->_statusBarAssertionReasons, 0);
  objc_storeStrong((id *)&self->_appsStatusBarAssertion, 0);
  objc_storeStrong((id *)&self->_systemStatusBarAssertion, 0);
  objc_storeStrong((id *)&self->_clientSuppressionAssertions, 0);
  objc_storeStrong((id *)&self->_transitionObservers, 0);
  objc_storeStrong((id *)&self->_suppressionAssertions, 0);
  objc_storeStrong((id *)&self->_windowScenesToPresenterVisibilityGesturePriorityAssertions, 0);
  objc_storeStrong((id *)&self->_presentablesToGesturePriorityAssertions, 0);
  objc_storeStrong((id *)&self->_gesturePriorityAssertionsToWindowScenes, 0);
  objc_storeStrong((id *)&self->_gesturePriorityAssertions, 0);
  objc_storeStrong((id *)&self->_windowScenesToPhysicalButtonAssistants, 0);
  objc_storeStrong((id *)&self->_windowScenesToZStackParticipants, 0);
  objc_storeStrong((id *)&self->_windowScenesToPanGestures, 0);
  objc_storeStrong((id *)&self->_windowLevelAssertionManager, 0);
  objc_storeStrong((id *)&self->_bannerSourceListener, 0);
  objc_storeStrong((id *)&self->_windowScenesToBannerWindows, 0);
  objc_storeStrong((id *)&self->_windowScenesToBannerControllers, 0);
  objc_storeStrong((id *)&self->_bannerAuthority, 0);
}

- (id)newBannerControllerForWindowScene:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    double v6 = self;
    objc_sync_enter(v6);
    uint64_t v7 = [(NSMapTable *)v6->_windowScenesToBannerControllers objectForKey:v5];
    if (v7)
    {
      char v15 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, @"SBBannerManager.m", 1433, @"Already have a banner controller for this scene: bannerController: %@; scene: %@",
        v7,
        v5);
    }
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F4F5D8]) initWithAuthority:v6->_bannerAuthority];
    [v8 setDelegate:v6];
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F4F5A8]) initWithAuthority:v6->_bannerAuthority pender:0 presenter:v8];

    [v8 setPoster:v9];
    windowScenesToBannerControllers = v6->_windowScenesToBannerControllers;
    if (!windowScenesToBannerControllers)
    {
      uint64_t v11 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
      long long v12 = v6->_windowScenesToBannerControllers;
      v6->_windowScenesToBannerControllers = (NSMapTable *)v11;

      windowScenesToBannerControllers = v6->_windowScenesToBannerControllers;
    }
    [(NSMapTable *)windowScenesToBannerControllers setObject:v9 forKey:v5];
    if ([(NSHashTable *)v6->_suppressionAssertions count]) {
      [v9 setSuspended:1 forReason:@"Banner manager suppression assertion" revokingCurrent:0 error:0];
    }
    long long v13 = [v5 ambientPresentationController];
    [v13 addObserver:v6];

    objc_sync_exit(v6);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

@end