@interface NCNotificationShortLookViewController
+ (id)_sharedNotificationFeedbackGenerator;
+ (void)_playNegativeInteractionHaptic;
+ (void)_prepareSharedNotificationFeedbackGenerator;
- (BOOL)_canShowWhileLocked;
- (BOOL)_didScrollPresentLongLookViewController;
- (BOOL)_isLockedByAppProtection;
- (BOOL)_isPresentingCustomContentProvidingViewController;
- (BOOL)_setNotificationRequest:(id)a3;
- (BOOL)_shouldPerformHoverHighlighting;
- (BOOL)_shouldSupportExpandedPlatterInteraction;
- (BOOL)_shouldUseHapticTouch;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canResignFirstResponder;
- (BOOL)clickPresentationInteractionManager:(id)a3 shouldBeginInteractionWithTouchAtLocation:(CGPoint)a4;
- (BOOL)clickPresentationInteractionManagerShouldAllowLongPressGesture:(id)a3;
- (BOOL)didForwardNotificationRequestToCustomContent:(id)a3;
- (BOOL)dismissPresentedViewControllerAnimated:(BOOL)a3;
- (BOOL)dragInteraction:(id)a3 sessionIsRestrictedToDraggingApplication:(id)a4;
- (BOOL)expandedPlatterInteractionManager:(id)a3 shouldBeginInteractionWithTouchAtLocation:(CGPoint)a4;
- (BOOL)expandedPlatterInteractionManagerShouldAllowInitialSwipeToDismiss:(id)a3;
- (BOOL)expandedPlatterInteractionManagerShouldAllowLongPressGesture:(id)a3;
- (BOOL)expandedPlatterPresentationControllerShouldProvideBackground:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)hasCommittedToPresentingCustomContentProvidingViewController;
- (BOOL)isContentExtensionVisible:(id)a3;
- (BOOL)isHighlighted;
- (BOOL)isNotPresentingOrHasCommittedToDismissingCustomContentProvidingViewController;
- (BOOL)isNotificationContentViewHidden;
- (BOOL)isShortLook;
- (BOOL)resignFirstResponder;
- (BOOL)shouldCommitToExpandedPlatterPresentationWithFeedback;
- (BOOL)shouldRestorePresentingShortLookOnDismiss;
- (CGRect)finalDismissedFrameOfViewForPreview;
- (CGRect)finalPresentedFrameOfViewForPreview;
- (CGRect)initialPresentedFrameOfViewForPreview;
- (PLClickPresentationInteractionManager)clickPresentationInteractionManager;
- (PLExpandedPlatterInteractionAnimating)_activeExpandedPlatterInteractionAnimator;
- (UIBezierPath)visiblePath;
- (id)_expandedPlatterViewController;
- (id)_initWithNotificationRequest:(id)a3 revealingAdditionalContentOnPresentation:(BOOL)a4;
- (id)_interactionManagerCreatingIfNecessary;
- (id)_longLookNotificationViewController;
- (id)_newClickPresentationInteractionManager;
- (id)_notificationShortLookViewIfLoaded;
- (id)_presentedLongLookViewController;
- (id)_presentedViewController;
- (id)_requiredContextIDsForDragSessionInView:(id)a3;
- (id)backgroundMaterialView;
- (id)containerViewForExpandedContent;
- (id)customBackgroundContainerViewForExpandedPlatterPresentationController:(id)a3;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5;
- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5;
- (id)expandedPlatterInteractionManager:(id)a3 menuWithSuggestedActions:(id)a4;
- (id)expandedPlatterInteractionManagerIdentifier:(id)a3;
- (id)expandedPlatterViewController:(id)a3 staticContentProviderForNotificationRequest:(id)a4;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (id)presentedExpandedPlatterViewController;
- (id)transitioningDelegateForClickPresentationInteractionManager:(id)a3;
- (int64_t)expandedPlatterViewController:(id)a3 dateFormatStyleForNotificationRequest:(id)a4;
- (unint64_t)_maximumNumberOfPrimaryTextLinesForProvidedStaticContent;
- (unint64_t)_maximumNumberOfSecondaryTextLinesForProvidedStaticContent;
- (unint64_t)_maximumNumberOfTextLinesForProvidedStaticContentWithDefaultNumber:(unint64_t)a3 isPrimary:(BOOL)a4 isLarge:(BOOL)a5;
- (unint64_t)importantAdornmentEligibleOptionsForNotificationViewController:(id)a3;
- (void)_askDelegateToExecuteAction:(id)a3 withParameters:(id)a4 animated:(BOOL)a5;
- (void)_checkDelegateShouldTransitionForTrigger:(int64_t)a3 completionBlock:(id)a4;
- (void)_dismissPresentedViewControllerAnimated:(BOOL)a3;
- (void)_expandedPlatterInteractionManager:(id)a3 didDismissWithReason:(id)a4;
- (void)_expandedPlatterInteractionManager:(id)a3 willDismissWithReason:(id)a4;
- (void)_handlePresentedContentDismissalForClickPresentationInteractionManagerWithTrigger:(int64_t)a3;
- (void)_handleTapOnView:(id)a3;
- (void)_intelligenceLightAnimationIfNeeded;
- (void)_loadLookView;
- (void)_notificationViewControllerViewDidLoad;
- (void)_presentLongLookAnimated:(BOOL)a3 trigger:(int64_t)a4 completion:(id)a5;
- (void)_presentLongLookForScrollAnimated:(BOOL)a3 completion:(id)a4;
- (void)_presentLongLookViaClickPresentationInteraction:(id)a3;
- (void)_presentLongLookViaInteractionManager:(id)a3;
- (void)_requestAppProtectionUnlockWithCompletion:(id)a3;
- (void)_setActiveExpandedPlatterInteractionAnimator:(id)a3;
- (void)_setDidScrollPresentLongLookViewController:(BOOL)a3;
- (void)_updateLookView:(id)a3 withTitleFromProvidedStaticContent:(id)a4;
- (void)_updateScreenCaptureProhibited;
- (void)_updateShortLookShadow;
- (void)_updateThumbnailForRichContentForShortLookView:(id)a3 withContentProvider:(id)a4;
- (void)_updateWithProvidedAuxiliaryOptionsContent;
- (void)_updateWithProvidedStaticContent;
- (void)clickPresentationInteractionManager:(id)a3 declinedDismissingPresentedContentWithTrigger:(int64_t)a4;
- (void)clickPresentationInteractionManager:(id)a3 shouldFinishInteractionThatReachedForceThreshold:(BOOL)a4 withCompletionBlock:(id)a5;
- (void)clickPresentationInteractionManager:(id)a3 willDismissPresentedContentWithTrigger:(int64_t)a4;
- (void)clickPresentationInteractionManagerDidEndUserInteraction:(id)a3;
- (void)clickPresentationInteractionManagerWillBeginUserInteraction:(id)a3;
- (void)containerViewForExpandedContent;
- (void)contentProvider:(id)a3 performAction:(id)a4 animated:(BOOL)a5;
- (void)customContent:(id)a3 didUpdateUserNotificationActions:(id)a4;
- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5;
- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5;
- (void)dragInteraction:(id)a3 session:(id)a4 willEndWithOperation:(unint64_t)a5;
- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4;
- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5;
- (void)expandAndPlayMedia;
- (void)expandedPlatter:(id)a3 didDismissWithReason:(id)a4;
- (void)expandedPlatter:(id)a3 willDismissWithReason:(id)a4;
- (void)expandedPlatterDidPresent:(id)a3;
- (void)expandedPlatterInteractionManager:(id)a3 shouldCommitInteraction:(id)a4;
- (void)expandedPlatterInteractionManager:(id)a3 willDismissContentWithAnimator:(id)a4;
- (void)expandedPlatterInteractionManager:(id)a3 willPresentContentWithAnimator:(id)a4;
- (void)expandedPlatterViewController:(id)a3 requestsDismissalWithReason:(id)a4 userInfo:(id)a5;
- (void)expandedPlatterWillPresent:(id)a3;
- (void)notificationViewControllerDidDismiss:(id)a3;
- (void)notificationViewControllerDidPresent:(id)a3;
- (void)notificationViewControllerWillDismiss:(id)a3;
- (void)notificationViewControllerWillPresent:(id)a3;
- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5;
- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5;
- (void)presentLongLookAnimated:(BOOL)a3 trigger:(int64_t)a4 completion:(id)a5;
- (void)setContentReplacedWithSnapshot:(BOOL)a3;
- (void)setCustomContentHomeAffordanceGestureRecognizer:(id)a3;
- (void)setCustomContentHomeAffordanceVisible:(BOOL)a3;
- (void)setHasShadow:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setInteractionEnabled:(BOOL)a3;
- (void)setMaterialGroupNameBase:(id)a3;
- (void)setNotificationContentViewHidden:(BOOL)a3;
- (void)setPlatterHighlighted:(BOOL)a3;
- (void)shouldCommitToExpandedPlatterPresentationWithFeedback;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation NCNotificationShortLookViewController

- (id)_initWithNotificationRequest:(id)a3 revealingAdditionalContentOnPresentation:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NCNotificationShortLookViewController;
  id v4 = [(NCNotificationViewController *)&v7 _initWithNotificationRequest:a3 revealingAdditionalContentOnPresentation:a4];
  v5 = v4;
  if (v4) {
    [v4 _setupCustomContentProvider];
  }
  return v5;
}

- (BOOL)isShortLook
{
  return 1;
}

- (void)setMaterialGroupNameBase:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NCNotificationShortLookViewController;
  [(NCNotificationViewController *)&v6 setMaterialGroupNameBase:a3];
  id v4 = [(NCNotificationShortLookViewController *)self _notificationShortLookViewIfLoaded];
  v5 = [(NCNotificationViewController *)self materialGroupNameBase];
  [v4 setMaterialGroupNameBase:v5];
}

- (BOOL)hasCommittedToPresentingCustomContentProvidingViewController
{
  if ([(NCNotificationShortLookViewController *)self _isPresentingCustomContentProvidingViewController])
  {
    return 1;
  }
  clickPresentationInteractionManager = self->_clickPresentationInteractionManager;

  return [(PLClickPresentationInteractionManager *)clickPresentationInteractionManager hasCommittedToPresentation];
}

- (BOOL)isNotPresentingOrHasCommittedToDismissingCustomContentProvidingViewController
{
  if (![(NCNotificationShortLookViewController *)self hasCommittedToPresentingCustomContentProvidingViewController])return 1; {
  v3 = [(NCNotificationShortLookViewController *)self _presentedViewController];
  }
  char v4 = [v3 isBeingDismissed];

  return v4;
}

- (BOOL)didForwardNotificationRequestToCustomContent:(id)a3
{
  id v4 = a3;
  v5 = [(NCNotificationViewController *)self _customContentProvidingViewController];

  if (v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)NCNotificationShortLookViewController;
    unsigned __int8 v6 = [(NCNotificationViewController *)&v11 didForwardNotificationRequestToCustomContent:v4];
  }
  else
  {
    expandedPlatterViewController = self->_expandedPlatterViewController;
    if (expandedPlatterViewController)
    {
      v9 = [(NCExpandedPlatterViewController *)expandedPlatterViewController customContentViewController];
      unsigned __int8 v7 = [v9 didReceiveNotificationRequest:v4];

      goto LABEL_6;
    }
    unsigned __int8 v6 = [(NCNotificationViewController *)self->_longLookNotificationViewController didForwardNotificationRequestToCustomContent:v4];
  }
  unsigned __int8 v7 = v6;
LABEL_6:

  return v7;
}

- (BOOL)dismissPresentedViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(NCNotificationShortLookViewController *)self _isPresentingCustomContentProvidingViewController];
  if (v5) {
    [(NCNotificationViewController *)self _executeNilAction:v3];
  }
  return v5;
}

- (BOOL)isContentExtensionVisible:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NCExpandedPlatterViewController *)self->_expandedPlatterViewController customContentViewController];
  unsigned __int8 v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(NCNotificationViewController *)self->_longLookNotificationViewController _customContentProvidingViewController];
  }
  v8 = v7;

  if (objc_opt_respondsToSelector())
  {
    v9 = [v8 contentExtensionIdentifier];
  }
  else
  {
    v9 = 0;
  }
  char v10 = [v9 isEqualToString:v4];

  return v10;
}

- (void)setCustomContentHomeAffordanceVisible:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NCNotificationShortLookViewController;
  [(NCNotificationViewController *)&v4 setCustomContentHomeAffordanceVisible:a3];
  [(NCNotificationLongLookViewController *)self->_longLookNotificationViewController setCustomContentHomeAffordanceVisible:[(NCNotificationViewController *)self isCustomContentHomeAffordanceVisible]];
}

- (void)setCustomContentHomeAffordanceGestureRecognizer:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NCNotificationShortLookViewController;
  id v4 = a3;
  [(NCNotificationViewController *)&v5 setCustomContentHomeAffordanceGestureRecognizer:v4];
  -[NCNotificationLongLookViewController setCustomContentHomeAffordanceGestureRecognizer:](self->_longLookNotificationViewController, "setCustomContentHomeAffordanceGestureRecognizer:", v4, v5.receiver, v5.super_class);
}

- (void)setNotificationContentViewHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NCNotificationShortLookViewController *)self _notificationShortLookViewIfLoaded];
  if (v4)
  {
    id v5 = v4;
    [v4 setNotificationContentViewHidden:v3];
    id v4 = v5;
  }
}

- (BOOL)isNotificationContentViewHidden
{
  v2 = [(NCNotificationShortLookViewController *)self _notificationShortLookViewIfLoaded];
  BOOL v3 = v2;
  if (v2) {
    char v4 = [v2 isNotificationContentViewHidden];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)setHasShadow:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(NCNotificationViewController *)self hasShadow];
  v6.receiver = self;
  v6.super_class = (Class)NCNotificationShortLookViewController;
  [(NCNotificationViewController *)&v6 setHasShadow:v3];
  if (v5 != [(NCNotificationViewController *)self hasShadow]) {
    [(NCNotificationShortLookViewController *)self _updateShortLookShadow];
  }
}

- (void)setContentReplacedWithSnapshot:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(NCNotificationShortLookViewController *)self _notificationShortLookViewIfLoaded];
  objc_super v6 = v5;
  if (v5)
  {
    id v7 = [v5 backgroundMaterialView];
    v8 = v7;
    if (v7)
    {
      [v7 setContentReplacedWithSnapshot:v3];
      v9.receiver = self;
      v9.super_class = (Class)NCNotificationShortLookViewController;
      -[NCNotificationViewController setContentReplacedWithSnapshot:](&v9, sel_setContentReplacedWithSnapshot_, [v8 isContentReplacedWithSnapshot]);
    }
  }
}

- (BOOL)canBecomeFirstResponder
{
  if ([(NCNotificationShortLookViewController *)self _isPresentingCustomContentProvidingViewController])
  {
    BOOL v3 = [(NCNotificationShortLookViewController *)self _presentedViewController];
    char v4 = [v3 canBecomeFirstResponder];

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)NCNotificationShortLookViewController;
    return [(NCNotificationShortLookViewController *)&v6 canBecomeFirstResponder];
  }
}

- (BOOL)becomeFirstResponder
{
  if ([(NCNotificationShortLookViewController *)self _isPresentingCustomContentProvidingViewController])
  {
    BOOL v3 = [(NCNotificationShortLookViewController *)self _presentedViewController];
    char v4 = [v3 becomeFirstResponder];

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)NCNotificationShortLookViewController;
    return [(NCNotificationShortLookViewController *)&v6 becomeFirstResponder];
  }
}

- (BOOL)canResignFirstResponder
{
  if ([(NCNotificationShortLookViewController *)self _isPresentingCustomContentProvidingViewController])
  {
    BOOL v3 = [(NCNotificationShortLookViewController *)self _presentedViewController];
    char v4 = [v3 canResignFirstResponder];

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)NCNotificationShortLookViewController;
    return [(NCNotificationShortLookViewController *)&v6 canResignFirstResponder];
  }
}

- (BOOL)resignFirstResponder
{
  if ([(NCNotificationShortLookViewController *)self _isPresentingCustomContentProvidingViewController])
  {
    BOOL v3 = [(NCNotificationShortLookViewController *)self _presentedViewController];
    char v4 = [v3 resignFirstResponder];

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)NCNotificationShortLookViewController;
    return [(NCNotificationShortLookViewController *)&v6 resignFirstResponder];
  }
}

- (void)viewWillLayoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)NCNotificationShortLookViewController;
  [(NCNotificationViewController *)&v12 viewWillLayoutSubviews];
  BOOL v3 = [(NCNotificationShortLookViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[UIView setFrame:](self->_lookViewWrapper, "setFrame:", v5, v7, v9, v11);
  [(UIView *)self->_lookViewWrapper bounds];
  PLSetViewFrameMaintainingTransform();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NCNotificationShortLookViewController;
  [(NCNotificationViewController *)&v4 viewDidAppear:a3];
  [(NCNotificationShortLookViewController *)self _intelligenceLightAnimationIfNeeded];
  if ([(NCNotificationViewController *)self _canPan]) {
    [(id)objc_opt_class() _prepareSharedNotificationFeedbackGenerator];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NCNotificationShortLookViewController;
  [(NCNotificationViewController *)&v4 viewDidDisappear:a3];
  [(NCNotificationLookView *)self->super._lookView stopLightEffect];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NCNotificationShortLookViewController;
  -[NCNotificationViewController viewWillDisappear:](&v5, sel_viewWillDisappear_);
  if ([(NCNotificationShortLookViewController *)self _isPresentingCustomContentProvidingViewController])
  {
    [(NCNotificationShortLookViewController *)self dismissPresentedViewControllerAnimated:v3];
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)shouldCommitToExpandedPlatterPresentationWithFeedback
{
  BOOL v3 = [(NCNotificationShortLookViewController *)self containerViewForExpandedContent];

  if (!v3)
  {
    objc_super v4 = (void *)*MEMORY[0x1E4FB3750];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_ERROR)) {
      [(NCNotificationShortLookViewController *)v4 shouldCommitToExpandedPlatterPresentationWithFeedback];
    }
  }
  return v3 != 0;
}

- (void)presentLongLookAnimated:(BOOL)a3 trigger:(int64_t)a4 completion:(id)a5
{
  BOOL v6 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  double v9 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    double v10 = v9;
    double v11 = [(NCNotificationViewController *)self notificationRequest];
    objc_super v12 = [v11 notificationIdentifier];
    v13 = objc_msgSend(v12, "un_logDigest");
    v14 = NCStringFromLongLookPresentationTrigger(a4);
    *(_DWORD *)buf = 138543618;
    v24 = v13;
    __int16 v25 = 2114;
    v26 = v14;
    _os_log_impl(&dword_1D7C04000, v10, OS_LOG_TYPE_DEFAULT, "Asked to present long look for request %{public}@ for trigger %{public}@", buf, 0x16u);
  }
  self->_trigger = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__NCNotificationShortLookViewController_presentLongLookAnimated_trigger_completion___block_invoke;
  aBlock[3] = &unk_1E6A95568;
  id v15 = v8;
  aBlock[4] = self;
  id v22 = v15;
  v16 = _Block_copy(aBlock);
  if ([(NCNotificationShortLookViewController *)self _isLockedByAppProtection])
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __84__NCNotificationShortLookViewController_presentLongLookAnimated_trigger_completion___block_invoke_2;
    v17[3] = &unk_1E6A95590;
    BOOL v20 = v6;
    v17[4] = self;
    int64_t v19 = a4;
    id v18 = v16;
    [(NCNotificationShortLookViewController *)self _requestAppProtectionUnlockWithCompletion:v17];
  }
  else
  {
    [(NCNotificationShortLookViewController *)self _presentLongLookAnimated:v6 trigger:a4 completion:v16];
  }
}

uint64_t __84__NCNotificationShortLookViewController_presentLongLookAnimated_trigger_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    uint64_t result = (*(uint64_t (**)(void))(result + 16))();
  }
  *(void *)(*(void *)(a1 + 32) + 1232) = 0;
  return result;
}

uint64_t __84__NCNotificationShortLookViewController_presentLongLookAnimated_trigger_completion___block_invoke_2(uint64_t a1, int a2)
{
  if (a2) {
    return [*(id *)(a1 + 32) _presentLongLookAnimated:*(unsigned __int8 *)(a1 + 56) trigger:*(void *)(a1 + 48) completion:*(void *)(a1 + 40)];
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_presentLongLookAnimated:(BOOL)a3 trigger:(int64_t)a4 completion:(id)a5
{
  if (a4 == 6) {
    [(NCNotificationShortLookViewController *)self _presentLongLookForScrollAnimated:a3 completion:a5];
  }
  else {
    [(NCNotificationShortLookViewController *)self _presentLongLookViaInteractionManager:a5];
  }
}

- (void)_requestAppProtectionUnlockWithCompletion:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [(NCNotificationViewController *)self notificationRequest];
  BOOL v6 = [v5 notificationIdentifier];
  double v7 = [v5 sectionIdentifier];
  id v8 = [MEMORY[0x1E4F4B7E0] applicationWithBundleIdentifier:v7];
  double v9 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    double v10 = v9;
    double v11 = objc_msgSend(v6, "un_logDigest");
    *(_DWORD *)buf = 138412546;
    BOOL v20 = v11;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl(&dword_1D7C04000, v10, OS_LOG_TYPE_DEFAULT, "Requesting AppProtection authentication for %@ in %@", buf, 0x16u);
  }
  [(NCNotificationShortLookViewController *)self setNotificationContentViewHidden:1];
  objc_initWeak((id *)buf, self);
  objc_super v12 = [MEMORY[0x1E4F4B7E8] sharedGuard];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __83__NCNotificationShortLookViewController__requestAppProtectionUnlockWithCompletion___block_invoke;
  v15[3] = &unk_1E6A955B8;
  id v13 = v6;
  id v16 = v13;
  objc_copyWeak(&v18, (id *)buf);
  id v14 = v4;
  id v17 = v14;
  [v12 authenticateForSubject:v8 completion:v15];

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
}

void __83__NCNotificationShortLookViewController__requestAppProtectionUnlockWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = (os_log_t *)MEMORY[0x1E4FB3750];
  double v7 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = *(void **)(a1 + 32);
    double v9 = v7;
    double v10 = objc_msgSend(v8, "un_logDigest");
    double v11 = NSStringFromBOOL();
    *(_DWORD *)buf = 138412546;
    id v17 = v10;
    __int16 v18 = 2112;
    int64_t v19 = v11;
    _os_log_impl(&dword_1D7C04000, v9, OS_LOG_TYPE_DEFAULT, "AppProtection authentication result for %@: %@", buf, 0x16u);
  }
  if (v5)
  {
    os_log_t v12 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR)) {
      __83__NCNotificationShortLookViewController__requestAppProtectionUnlockWithCompletion___block_invoke_cold_1(a1, v12, v5);
    }
  }
  objc_copyWeak(&v14, (id *)(a1 + 48));
  id v13 = *(id *)(a1 + 40);
  char v15 = a2;
  BSDispatchMain();

  objc_destroyWeak(&v14);
}

uint64_t __83__NCNotificationShortLookViewController__requestAppProtectionUnlockWithCompletion___block_invoke_42(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setNotificationContentViewHidden:0];

  BOOL v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v3();
}

- (void)expandAndPlayMedia
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __59__NCNotificationShortLookViewController_expandAndPlayMedia__block_invoke;
  v2[3] = &unk_1E6A93220;
  v2[4] = self;
  [(NCNotificationShortLookViewController *)self presentLongLookAnimated:1 trigger:5 completion:v2];
}

uint64_t __59__NCNotificationShortLookViewController_expandAndPlayMedia__block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(*(void *)(result + 32) + 1152) playMedia];
  }
  return result;
}

- (BOOL)shouldRestorePresentingShortLookOnDismiss
{
  return self->_expandedPlatterViewController
      || [(NCNotificationViewController *)self->_longLookNotificationViewController _shouldRestorePresentingShortLookOnDismiss];
}

- (void)setInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    if (v3) {
      BOOL v6 = @"ENABLED";
    }
    else {
      BOOL v6 = @"DISABLED";
    }
    double v7 = v5;
    id v8 = [(NCNotificationViewController *)self notificationRequest];
    double v9 = [v8 notificationIdentifier];
    double v10 = objc_msgSend(v9, "un_logDigest");
    *(_DWORD *)buf = 138412546;
    id v13 = v6;
    __int16 v14 = 2114;
    char v15 = v10;
    _os_log_impl(&dword_1D7C04000, v7, OS_LOG_TYPE_DEFAULT, "Setting tap interaction %@ for notification cell for request %{public}@", buf, 0x16u);
  }
  v11.receiver = self;
  v11.super_class = (Class)NCNotificationShortLookViewController;
  [(NCNotificationViewController *)&v11 setInteractionEnabled:v3];
  [(UITapGestureRecognizer *)self->_tapGesture setEnabled:v3];
}

- (void)setPlatterHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NCNotificationShortLookViewController *)self _notificationShortLookViewIfLoaded];
  [v4 setHighlighted:v3];
}

- (id)containerViewForExpandedContent
{
  containerViewForExpandedContent = self->_containerViewForExpandedContent;
  if (!containerViewForExpandedContent)
  {
    id v4 = [(NCNotificationViewController *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      id v5 = [v4 notificationViewControllerContainerViewProviderForExpandedContent:self];
      if (v5)
      {
        containerViewProviders = self->_containerViewProviders;
        if (!containerViewProviders)
        {
          double v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
          id v8 = self->_containerViewProviders;
          self->_containerViewProviders = v7;

          containerViewProviders = self->_containerViewProviders;
        }
        [(NSMutableArray *)containerViewProviders addObject:v5];
        double v9 = [v5 containerView];
        double v10 = self->_containerViewForExpandedContent;
        self->_containerViewForExpandedContent = v9;
      }
      else
      {
        objc_super v11 = (void *)*MEMORY[0x1E4FB3750];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_ERROR)) {
          [(NCNotificationShortLookViewController *)(uint64_t)v4 containerViewForExpandedContent];
        }
      }
    }
    containerViewForExpandedContent = self->_containerViewForExpandedContent;
  }

  return containerViewForExpandedContent;
}

- (id)backgroundMaterialView
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    lookView = self->super._lookView;
  }
  else {
    lookView = 0;
  }

  return lookView;
}

- (id)presentedExpandedPlatterViewController
{
  expandedPlatterViewController = self->_expandedPlatterViewController;
  if (!expandedPlatterViewController) {
    expandedPlatterViewController = self->_longLookNotificationViewController;
  }
  return expandedPlatterViewController;
}

- (BOOL)_setNotificationRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationViewController *)self notificationRequest];
  int v6 = [v4 matchesRequest:v5];

  v14.receiver = self;
  v14.super_class = (Class)NCNotificationShortLookViewController;
  BOOL v7 = [(NCNotificationViewController *)&v14 _setNotificationRequest:v4];

  if (v7)
  {
    if (v6)
    {
      longLookNotificationViewController = self->_longLookNotificationViewController;
      double v9 = [(NCNotificationViewController *)self notificationRequest];
      [(NCNotificationLongLookViewController *)longLookNotificationViewController setNotificationRequest:v9];

      expandedPlatterViewController = self->_expandedPlatterViewController;
      objc_super v11 = [(NCNotificationViewController *)self notificationRequest];
      [(NCExpandedPlatterViewController *)expandedPlatterViewController setNotificationRequest:v11];
    }
    else
    {
      [(NCNotificationViewController *)self _setCustomContentProvidingViewController:0];
      os_log_t v12 = self->_longLookNotificationViewController;
      self->_longLookNotificationViewController = 0;

      objc_super v11 = self->_expandedPlatterViewController;
      self->_expandedPlatterViewController = 0;
    }

    [(NCNotificationShortLookViewController *)self _updateScreenCaptureProhibited];
  }
  return v7;
}

- (id)_newClickPresentationInteractionManager
{
  BOOL v3 = [(NCNotificationViewController *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ![v3 notificationViewControllerShouldSupportClickPresentationInteraction:self])
  {
    id v4 = 0;
  }
  else
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F91418]) initWithPresentingViewController:self delegate:self];
  }

  return v4;
}

- (id)_presentedViewController
{
  expandedPlatterViewController = self->_expandedPlatterViewController;
  if (expandedPlatterViewController)
  {
    BOOL v3 = expandedPlatterViewController;
  }
  else
  {
    id v5 = [(PLClickPresentationInteractionManager *)self->_clickPresentationInteractionManager presentedViewController];
    longLookNotificationViewController = v5;
    if (!v5) {
      longLookNotificationViewController = self->_longLookNotificationViewController;
    }
    BOOL v3 = longLookNotificationViewController;
  }

  return v3;
}

- (BOOL)_isPresentingCustomContentProvidingViewController
{
  if (self->_didScrollPresentLongLookViewController || self->_expandedPlatterPresentationState) {
    return 1;
  }
  id v4 = [(NCNotificationShortLookViewController *)self _presentedViewController];
  id v5 = [v4 presentingViewController];
  BOOL v2 = v5 != 0;

  return v2;
}

- (void)_loadLookView
{
  p_lookView = &self->super._lookView;
  if (!self->super._lookView)
  {
    id v4 = [(NCNotificationViewController *)self delegate];
    id v5 = off_1E6A90EF0;
    if ((objc_opt_respondsToSelector() & 1) != 0
      && [v4 isRichNotificationContentViewForNotificationViewController:self])
    {
      id v5 = off_1E6A90EB8;
    }
    id v6 = objc_alloc_init(*v5);
    [v6 setDelegate:self];
    objc_storeStrong((id *)p_lookView, v6);
    BOOL v7 = *p_lookView;
    [(NCNotificationViewController *)self backgroundAlpha];
    -[NCNotificationLookView setBackgroundAlpha:](v7, "setBackgroundAlpha:");
    id v8 = *p_lookView;
    [(NCNotificationViewController *)self contentAlpha];
    -[NCNotificationLookView setContentAlpha:](v8, "setContentAlpha:");
    if ((objc_opt_respondsToSelector() & 1) != 0
      && [v4 notificationViewControllerShouldAllowDragInteraction:self])
    {
      double v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1708]) initWithDelegate:self];
      [v9 _setAllowsPointerDragBeforeLiftDelay:0];
      _UIDragInteractionDefaultPointerLiftDelay();
      [v9 _setPointerLiftDelay:v10 + v10];
      [(NCNotificationLookView *)*p_lookView addInteraction:v9];
      [(NCNotificationLookView *)*p_lookView setUserInteractionEnabled:1];
    }
    [(NCNotificationShortLookViewController *)self _updateScreenCaptureProhibited];
  }
  if (!self->_lookViewWrapper)
  {
    objc_super v11 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    lookViewWrapper = self->_lookViewWrapper;
    self->_lookViewWrapper = v11;
  }
}

- (BOOL)_shouldSupportExpandedPlatterInteraction
{
  BOOL v3 = [(NCNotificationViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 notificationViewControllerShouldSupportExpandedPlatterInteraction:self];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (id)_interactionManagerCreatingIfNecessary
{
  interactionManager = self->_interactionManager;
  if (!interactionManager)
  {
    char v4 = (PLExpandedPlatterInteractionManager *)[objc_alloc(MEMORY[0x1E4F91420]) initWithPresentingViewController:self delegate:self];
    id v5 = self->_interactionManager;
    self->_interactionManager = v4;

    interactionManager = self->_interactionManager;
  }

  return interactionManager;
}

- (void)_notificationViewControllerViewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)NCNotificationShortLookViewController;
  [(NCNotificationViewController *)&v16 _notificationViewControllerViewDidLoad];
  if ([(NCNotificationShortLookViewController *)self _shouldSupportExpandedPlatterInteraction])
  {
    id v3 = [(NCNotificationShortLookViewController *)self _interactionManagerCreatingIfNecessary];
  }
  char v4 = [(NCNotificationShortLookViewController *)self _notificationShortLookViewIfLoaded];
  [(NCNotificationShortLookViewController *)self setHasShadow:[(NCNotificationViewController *)self _canPan]];
  [(NCNotificationShortLookViewController *)self _updateShortLookShadow];
  id v5 = [(NCNotificationViewController *)self materialGroupNameBase];
  [v4 setMaterialGroupNameBase:v5];

  objc_msgSend(v4, "setMaterialRecipe:", -[NCNotificationViewController materialRecipe](self, "materialRecipe"));
  [(UIView *)self->_lookViewWrapper addSubview:v4];
  id v6 = [(NCNotificationShortLookViewController *)self view];
  [v6 addSubview:self->_lookViewWrapper];

  BOOL v7 = [(NCNotificationViewController *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [v7 notificationViewControllerShouldInterpretTapAsDefaultAction:self])
  {
    id v8 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleTapOnView_];
    tapGesture = self->_tapGesture;
    self->_tapGesture = v8;

    [(UITapGestureRecognizer *)self->_tapGesture setDelegate:self];
    [v4 addGestureRecognizer:self->_tapGesture];
    [(UITapGestureRecognizer *)self->_tapGesture setEnabled:[(NCNotificationViewController *)self isInteractionEnabled]];
    double v10 = [(PLClickPresentationInteractionManager *)self->_clickPresentationInteractionManager gestureRecognizerForExclusionRelationship];
    if (v10) {
      [(UITapGestureRecognizer *)self->_tapGesture requireGestureRecognizerToFail:v10];
    }
  }
  objc_super v11 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v12 = [v11 userInterfaceIdiom];

  if (v12 == 1)
  {
    id v13 = (UIPointerInteraction *)[objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:self];
    pointerInteraction = self->_pointerInteraction;
    self->_pointerInteraction = v13;

    [v4 addInteraction:self->_pointerInteraction];
    char v15 = [v4 backgroundMaterialView];
    [v15 _cornerRadius];
    objc_msgSend(v4, "_setCornerRadius:");
  }
}

- (void)_updateLookView:(id)a3 withTitleFromProvidedStaticContent:(id)a4
{
  id v5 = a4;
  id v6 = [(NCNotificationShortLookViewController *)self _notificationShortLookViewIfLoaded];
  [v6 setTitle:v5];
}

- (void)_handleTapOnView:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 state] != 3) {
    goto LABEL_11;
  }
  [(NSDate *)self->_tapBeginTime timeIntervalSinceNow];
  if (v5 < 0.0) {
    double v5 = -v5;
  }
  if (v5 < 0.3)
  {
    id v6 = [(NCNotificationViewController *)self delegate];
    if ((objc_opt_respondsToSelector() & 1) == 0
      || ([v6 handleTapOnNotificationViewController:self] & 1) == 0)
    {
      BOOL v7 = +[NCNotificationEventTracker sharedInstance];
      id v8 = [(NCNotificationViewController *)self notificationRequest];
      double v9 = [(NCNotificationViewController *)self notificationUsageTrackingState];
      [v7 shortLookDefaultActionInvokedWithTrigger:0 forNotificationRequest:v8 withState:v9];

      double v10 = [(NCNotificationViewController *)self staticContentProvider];
      objc_super v11 = [v10 defaultAction];

      if (v11)
      {
        uint64_t v12 = (void *)*MEMORY[0x1E4FB3778];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
        {
          id v13 = v12;
          objc_super v14 = [(NCNotificationViewController *)self notificationRequest];
          char v15 = [v14 notificationIdentifier];
          objc_super v16 = objc_msgSend(v15, "un_logDigest");
          int v26 = 138543362;
          uint64_t v27 = v16;
          _os_log_impl(&dword_1D7C04000, v13, OS_LOG_TYPE_DEFAULT, "Notification cell tap performing default action for request %{public}@", (uint8_t *)&v26, 0xCu);
        }
        [(NCNotificationViewController *)self _executeDefaultAction:1];
      }
      else
      {
        __int16 v18 = [(NCNotificationViewController *)self notificationRequest];
        int64_t v19 = [v18 options];
        int v20 = [v19 revealsAdditionalContentIfNoDefaultAction];

        if (v20)
        {
          __int16 v21 = (void *)*MEMORY[0x1E4FB3778];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
          {
            id v22 = v21;
            uint64_t v23 = [(NCNotificationViewController *)self notificationRequest];
            v24 = [v23 notificationIdentifier];
            __int16 v25 = objc_msgSend(v24, "un_logDigest");
            int v26 = 138543362;
            uint64_t v27 = v25;
            _os_log_impl(&dword_1D7C04000, v22, OS_LOG_TYPE_DEFAULT, "Notification cell tap presenting long look for request %{public}@", (uint8_t *)&v26, 0xCu);
          }
          [(NCNotificationShortLookViewController *)self presentLongLookAnimated:1 trigger:4 completion:0];
        }
      }
    }
  }
  else
  {
LABEL_11:
    id v17 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_ERROR)) {
      [(NCNotificationShortLookViewController *)v17 _handleTapOnView:v4];
    }
  }
}

- (unint64_t)_maximumNumberOfPrimaryTextLinesForProvidedStaticContent
{
  v8.receiver = self;
  v8.super_class = (Class)NCNotificationShortLookViewController;
  id v3 = [(NCNotificationViewController *)&v8 _maximumNumberOfPrimaryTextLinesForProvidedStaticContent];
  id v4 = [(NCNotificationShortLookViewController *)self traitCollection];
  double v5 = [v4 preferredContentSizeCategory];
  unint64_t v6 = [(NCNotificationShortLookViewController *)self _maximumNumberOfTextLinesForProvidedStaticContentWithDefaultNumber:v3 isPrimary:1 isLarge:UIContentSizeCategoryIsAccessibilityCategory(v5)];

  return v6;
}

- (unint64_t)_maximumNumberOfSecondaryTextLinesForProvidedStaticContent
{
  v8.receiver = self;
  v8.super_class = (Class)NCNotificationShortLookViewController;
  id v3 = [(NCNotificationViewController *)&v8 _maximumNumberOfSecondaryTextLinesForProvidedStaticContent];
  id v4 = [(NCNotificationShortLookViewController *)self traitCollection];
  double v5 = [v4 preferredContentSizeCategory];
  unint64_t v6 = [(NCNotificationShortLookViewController *)self _maximumNumberOfTextLinesForProvidedStaticContentWithDefaultNumber:v3 isPrimary:0 isLarge:UIContentSizeCategoryIsAccessibilityCategory(v5)];

  return v6;
}

- (unint64_t)_maximumNumberOfTextLinesForProvidedStaticContentWithDefaultNumber:(unint64_t)a3 isPrimary:(BOOL)a4 isLarge:(BOOL)a5
{
  BOOL v5 = a5;
  double v9 = [(NCNotificationViewController *)self delegate];
  double v10 = [(NCNotificationViewController *)self staticContentProvider];
  int v11 = [v10 isNumberOfLinesInfinite];

  if (v11) {
    unint64_t v12 = 0;
  }
  else {
    unint64_t v12 = a3;
  }
  if ((v11 & 1) == 0 && !a4)
  {
    if (objc_opt_respondsToSelector())
    {
      int v13 = [v9 showAdditionalMessageLinesForNotificationViewController:self];
      uint64_t v14 = 4;
      if (v5) {
        uint64_t v14 = 6;
      }
      if (v13) {
        unint64_t v12 = v14;
      }
      else {
        unint64_t v12 = a3;
      }
    }
    else
    {
      unint64_t v12 = a3;
    }
  }

  return v12;
}

- (void)_updateWithProvidedStaticContent
{
  v11.receiver = self;
  v11.super_class = (Class)NCNotificationShortLookViewController;
  [(NCNotificationViewController *)&v11 _updateWithProvidedStaticContent];
  id v3 = [(NCNotificationViewController *)self _lookViewIfLoaded];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v3;
      BOOL v5 = [(NCNotificationViewController *)self staticContentProvider];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        BOOL v7 = [(NCNotificationViewController *)self staticContentProvider];
        [(NCNotificationShortLookViewController *)self _updateThumbnailForRichContentForShortLookView:v4 withContentProvider:v7];
        if (([v7 isIconVisible] & 1) == 0) {
          [v4 setBadgedIconView:0];
        }
      }
    }
  }
  objc_super v8 = [(NCNotificationShortLookViewController *)self _notificationShortLookViewIfLoaded];
  if (v8)
  {
    double v9 = [(NCNotificationViewController *)self delegate];
    if (v9 && (objc_opt_respondsToSelector() & 1) != 0) {
      uint64_t v10 = [v9 shouldAlignContentToBottomForNotificationViewController:self];
    }
    else {
      uint64_t v10 = 0;
    }
    [v8 setAlignContentToBottom:v10];
  }
}

- (void)_updateThumbnailForRichContentForShortLookView:(id)a3 withContentProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(NCNotificationViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    int v9 = [v8 isRichNotificationContentViewForNotificationViewController:self] ^ 1;
  }
  else {
    int v9 = 1;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v10 = [v8 isAttachmentImageFeaturedForNotificationViewController:self];
  }
  else {
    uint64_t v10 = 0;
  }
  [v6 setAttachmentImageFeatured:v10];
  if ((([v7 hasAttachmentImage] ^ 1 | v9) & 1) == 0)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __108__NCNotificationShortLookViewController__updateThumbnailForRichContentForShortLookView_withContentProvider___block_invoke;
    v11[3] = &unk_1E6A92F90;
    id v12 = v6;
    [v7 fetchRichAttachmentImageIsFeatured:v10 withCompletion:v11];
  }
}

uint64_t __108__NCNotificationShortLookViewController__updateThumbnailForRichContentForShortLookView_withContentProvider___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setThumbnail:a2];
}

- (void)_updateWithProvidedAuxiliaryOptionsContent
{
  v19.receiver = self;
  v19.super_class = (Class)NCNotificationShortLookViewController;
  [(NCNotificationViewController *)&v19 _updateWithProvidedAuxiliaryOptionsContent];
  id v3 = [(NCNotificationShortLookViewController *)self _notificationShortLookViewIfLoaded];
  if (v3)
  {
    id v4 = [(NCNotificationViewController *)self auxiliaryOptionsContentProvider];

    if (!v4) {
      goto LABEL_7;
    }
    BOOL v5 = [(NCNotificationViewController *)self auxiliaryOptionsContentProvider];
    char v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) == 0) {
      goto LABEL_7;
    }
    id v7 = [(NCNotificationViewController *)self auxiliaryOptionsContentProvider];
    int v8 = [v7 auxiliaryOptionsVisible];

    if (v8)
    {
      int v9 = [(NCNotificationViewController *)self auxiliaryOptionsContentProvider];
      char v10 = objc_opt_respondsToSelector();

      if (v10)
      {
        objc_super v11 = [(NCNotificationViewController *)self auxiliaryOptionsContentProvider];
        id v12 = [v11 auxiliaryOptionsSummaryText];
      }
      else
      {
        id v12 = 0;
      }
      [v3 setAuxiliaryOptionsSummaryText:v12];
      objc_msgSend(v3, "setMaterialRecipe:", -[NCNotificationViewController materialRecipe](self, "materialRecipe"));
      uint64_t v14 = [(NCNotificationViewController *)self materialGroupNameBase];
      [v3 setMaterialGroupNameBase:v14];

      char v15 = [(NCNotificationViewController *)self auxiliaryOptionsContentProvider];
      char v16 = objc_opt_respondsToSelector();

      if (v16)
      {
        id v17 = [(NCNotificationViewController *)self auxiliaryOptionsContentProvider];
        __int16 v18 = [v17 auxiliaryOptionActions];
      }
      else
      {
        __int16 v18 = 0;
      }
      [v3 setAuxiliaryOptionActions:v18];

      uint64_t v13 = 1;
    }
    else
    {
LABEL_7:
      uint64_t v13 = 0;
    }
    [v3 setAuxiliaryOptionsVisible:v13];
    [(NCNotificationViewController *)self _updatePreferredContentSize];
  }
}

- (BOOL)_shouldUseHapticTouch
{
  BOOL v2 = +[NCUserNotificationsUIKitDefaults standardDefaults];
  if ([v2 shouldForceHapticTouchForPreview]) {
    char v3 = 1;
  }
  else {
    char v3 = _NCDeviceDesiresHapticTouch();
  }

  return v3;
}

- (void)_updateShortLookShadow
{
  id v3 = [(NCNotificationShortLookViewController *)self _notificationShortLookViewIfLoaded];
  if (v3) {
    objc_msgSend(v3, "setHasShadow:", -[NCNotificationViewController hasShadow](self, "hasShadow"));
  }
}

- (void)_updateScreenCaptureProhibited
{
  lookView = self->super._lookView;
  id v4 = [(NCNotificationViewController *)self notificationRequest];
  id v3 = [v4 options];
  -[NCNotificationLookView setScreenCaptureProhibited:](lookView, "setScreenCaptureProhibited:", [v3 screenCaptureProhibited]);
}

- (BOOL)_shouldPerformHoverHighlighting
{
  id v3 = [(NCNotificationViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 notificationViewControllerShouldPerformHoverHighlighting:self];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (id)_expandedPlatterViewController
{
  expandedPlatterViewController = self->_expandedPlatterViewController;
  if (!expandedPlatterViewController)
  {
    char v4 = [NCExpandedPlatterViewController alloc];
    BOOL v5 = [(NCNotificationViewController *)self notificationRequest];
    char v6 = [(NCNotificationViewController *)self customContentProvider];
    id v7 = [(NCNotificationViewController *)self notificationRequest];
    int v8 = [v6 customContentViewControllerForNotificationRequest:v7];
    int v9 = [(NCExpandedPlatterViewController *)v4 initWithNotificationRequest:v5 customContentViewController:v8];
    char v10 = self->_expandedPlatterViewController;
    self->_expandedPlatterViewController = v9;

    [(NCExpandedPlatterViewController *)self->_expandedPlatterViewController setDelegate:self];
    [(NCExpandedPlatterViewController *)self->_expandedPlatterViewController addExpandedPlatterObserver:self];
    expandedPlatterViewController = self->_expandedPlatterViewController;
  }

  return expandedPlatterViewController;
}

- (void)_dismissPresentedViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  expandedPlatterViewController = self->_expandedPlatterViewController;
  if (!expandedPlatterViewController) {
    expandedPlatterViewController = self->_longLookNotificationViewController;
  }
  int v9 = expandedPlatterViewController;
  uint64_t v6 = [(NCExpandedPlatterViewController *)v9 presentingViewController];
  if (v6)
  {
    id v7 = (void *)v6;
    char v8 = [(NCExpandedPlatterViewController *)v9 isBeingDismissed];

    if ((v8 & 1) == 0)
    {
      if (v9 == self->_expandedPlatterViewController)
      {
        [(PLExpandedPlatterInteractionManager *)self->_interactionManager dismiss];
      }
      else if (([(PLClickPresentationInteractionManager *)self->_clickPresentationInteractionManager dismissIfPossible:0] & 1) == 0)
      {
        [(NCNotificationLongLookViewController *)self->_longLookNotificationViewController dismissViewControllerAnimated:v3 completion:0];
      }
    }
  }
}

- (void)_askDelegateToExecuteAction:(id)a3 withParameters:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (!self->_expandedPlatterDismissalReason)
  {
    char v10 = [v8 identifier];
    if ([v10 length]) {
      objc_storeStrong((id *)&self->_expandedPlatterDismissalReason, v10);
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)NCNotificationShortLookViewController;
  [(NCNotificationViewController *)&v11 _askDelegateToExecuteAction:v8 withParameters:v9 animated:v5];
}

- (void)_intelligenceLightAnimationIfNeeded
{
  BOOL v3 = [(NCNotificationViewController *)self delegate];
  if (v3
    && (objc_opt_respondsToSelector() & 1) != 0
    && [v3 importantAdornmentEligibleOptionsForNotificationViewController:self])
  {
    char v4 = [v3 importantAdornmentEligibleOptionsForNotificationViewController:self];
  }
  else
  {
    char v4 = -1;
  }
  BOOL v5 = [(NCNotificationViewController *)self notificationRequest];
  uint64_t v6 = [v5 alertOptions];
  uint64_t v7 = [(id)v6 intelligentBehavior];

  id v8 = [(NCNotificationViewController *)self notificationRequest];
  LODWORD(v6) = [v8 isHighlight];

  int v9 = v6 ^ 1;
  if ((v4 & 4) == 0) {
    int v9 = 1;
  }
  BOOL v10 = (v4 & 2) != 0 && v7 == 2;
  if (v10 || !v9)
  {
    objc_initWeak(&location, self);
    objc_super v11 = (void *)MEMORY[0x1E4FB1EB0];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __76__NCNotificationShortLookViewController__intelligenceLightAnimationIfNeeded__block_invoke;
    v14[3] = &unk_1E6A919A0;
    objc_copyWeak(&v15, &location);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __76__NCNotificationShortLookViewController__intelligenceLightAnimationIfNeeded__block_invoke_2;
    v12[3] = &unk_1E6A91A18;
    objc_copyWeak(&v13, &location);
    [v11 animateWithSpringDuration:0 bounce:v14 initialSpringVelocity:v12 delay:1.0 options:0.0 animations:0.0 completion:0.0];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    [(NCNotificationLookView *)self->super._lookView stopLightEffect];
  }
}

void __76__NCNotificationShortLookViewController__intelligenceLightAnimationIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    BOOL v2 = WeakRetained;
    [WeakRetained[127] startLightEffect];
    id WeakRetained = v2;
  }
}

void __76__NCNotificationShortLookViewController__intelligenceLightAnimationIfNeeded__block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4FB1EB0];
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __76__NCNotificationShortLookViewController__intelligenceLightAnimationIfNeeded__block_invoke_3;
  v2[3] = &unk_1E6A919A0;
  objc_copyWeak(&v3, (id *)(a1 + 32));
  [v1 animateWithSpringDuration:0 bounce:v2 initialSpringVelocity:0 delay:0.5 options:0.0 animations:0.0 completion:0.1];
  objc_destroyWeak(&v3);
}

void __76__NCNotificationShortLookViewController__intelligenceLightAnimationIfNeeded__block_invoke_3(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    BOOL v2 = WeakRetained;
    [WeakRetained[127] stopLightEffect];
    id WeakRetained = v2;
  }
}

- (void)contentProvider:(id)a3 performAction:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [(NCExpandedPlatterViewController *)self->_expandedPlatterViewController customContentViewController];
  objc_super v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [(NCNotificationViewController *)self->_longLookNotificationViewController _customContentProvidingViewController];
  }
  id v13 = v12;

  if (!v9
    || ([(NCNotificationViewController *)self notificationRequest],
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        char v15 = [v13 performAction:v9 forNotification:v14],
        v14,
        (v15 & 1) == 0))
  {
    v16.receiver = self;
    v16.super_class = (Class)NCNotificationShortLookViewController;
    [(NCNotificationViewController *)&v16 contentProvider:v8 performAction:v9 animated:v5];
  }
}

- (void)_expandedPlatterInteractionManager:(id)a3 willDismissWithReason:(id)a4
{
  if (a4) {
    char v4 = (__CFString *)a4;
  }
  else {
    char v4 = @"NCExpandedPlatterObservableDismissalReasonUnknown";
  }
  expandedPlatterViewController = self->_expandedPlatterViewController;
  id v6 = a4;
  [(NCExpandedPlatterViewController *)expandedPlatterViewController expandedPlatter:expandedPlatterViewController willDismissWithReason:v4];
}

- (void)_expandedPlatterInteractionManager:(id)a3 didDismissWithReason:(id)a4
{
  BOOL v5 = (__CFString *)a4;
  id v8 = v5;
  if (v5) {
    id v6 = v5;
  }
  else {
    id v6 = @"NCExpandedPlatterObservableDismissalReasonUnknown";
  }
  uint64_t v7 = v6;
  [(NCNotificationViewController *)self _notifyObserversWithBlock:&__block_literal_global_45];
  if (NCEqualExpandedPlatterObservableDismissalReasons(v7, @"NCExpandedPlatterObservableDismissalReasonUnknown"))[(NCNotificationViewController *)self _executeCancelAction:1]; {
  [(NCExpandedPlatterViewController *)self->_expandedPlatterViewController expandedPlatter:self->_expandedPlatterViewController didDismissWithReason:v7];
  }
}

void __97__NCNotificationShortLookViewController__expandedPlatterInteractionManager_didDismissWithReason___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [v4 notificationViewControllerDidEndUserInteraction:v5];
  }
}

- (BOOL)_isLockedByAppProtection
{
  BOOL v2 = [(NCNotificationViewController *)self notificationRequest];
  id v3 = [v2 sectionIdentifier];

  id v4 = [MEMORY[0x1E4F4B7E0] applicationWithBundleIdentifier:v3];
  char v5 = [v4 isLocked];

  return v5;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v4 = objc_msgSend(a4, "view", a3);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6 = a5;
  if ([(NCNotificationShortLookViewController *)self _shouldPerformHoverHighlighting]) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  return v8;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  char v5 = [(NCNotificationShortLookViewController *)self _notificationShortLookViewIfLoaded];
  id v6 = [(__CFString *)v5 window];

  if (v6)
  {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v5];
    id v8 = [MEMORY[0x1E4FB1AC0] effectWithPreview:v7];
    [v8 setPreferredTintMode:1];
    [v8 setPrefersScaledContent:0];
    [v8 setPrefersShadow:0];
    id v9 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v8 shape:0];
  }
  else
  {
    BOOL v10 = (void *)*MEMORY[0x1E4FB3750];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_ERROR)) {
      -[NCNotificationShortLookViewController pointerInteraction:styleForRegion:](v10, self, v5);
    }
    id v9 = 0;
  }

  return v9;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  id v6 = [(NCNotificationViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 notificationViewController:self isPerformingHoverHighlighting:1];
  }
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  id v6 = [(NCNotificationViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 notificationViewController:self isPerformingHoverHighlighting:0];
  }
}

+ (id)_sharedNotificationFeedbackGenerator
{
  if (_sharedNotificationFeedbackGenerator_onceToken != -1) {
    dispatch_once(&_sharedNotificationFeedbackGenerator_onceToken, &__block_literal_global_129);
  }
  BOOL v2 = (void *)_sharedNotificationFeedbackGenerator___sharedNotificationFeedbackGenerator;

  return v2;
}

void __77__NCNotificationShortLookViewController__sharedNotificationFeedbackGenerator__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4FB1A00]);
  v1 = (void *)_sharedNotificationFeedbackGenerator___sharedNotificationFeedbackGenerator;
  _sharedNotificationFeedbackGenerator___sharedNotificationFeedbackGenerator = (uint64_t)v0;
}

+ (void)_prepareSharedNotificationFeedbackGenerator
{
  id v2 = [a1 _sharedNotificationFeedbackGenerator];
  [v2 prepare];
}

+ (void)_playNegativeInteractionHaptic
{
  id v2 = [a1 _sharedNotificationFeedbackGenerator];
  [v2 notificationOccurred:2];
}

- (id)_notificationShortLookViewIfLoaded
{
  id v2 = [(NCNotificationViewController *)self _lookViewIfLoaded];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (void)_presentLongLookViaClickPresentationInteraction:(id)a3
{
  id v4 = a3;
  clickPresentationInteractionManager = self->_clickPresentationInteractionManager;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __89__NCNotificationShortLookViewController__presentLongLookViaClickPresentationInteraction___block_invoke;
  v7[3] = &unk_1E6A91DF0;
  id v8 = v4;
  id v6 = v4;
  [(PLClickPresentationInteractionManager *)clickPresentationInteractionManager presentIfPossible:v7];
}

uint64_t __89__NCNotificationShortLookViewController__presentLongLookViaClickPresentationInteraction___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)_presentLongLookViaInteractionManager:(id)a3
{
  id v4 = a3;
  id v6 = [(NCNotificationShortLookViewController *)self _interactionManagerCreatingIfNecessary];
  char v5 = [(NCNotificationViewController *)self _lookView];
  [v5 bounds];
  UIRectGetCenter();
  objc_msgSend(v6, "presentAtLocation:completion:", v4);
}

- (void)_presentLongLookForScrollAnimated:(BOOL)a3 completion:(id)a4
{
  id v5 = a4;
  self->_didScrollPresentLongLookViewController = 1;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__NCNotificationShortLookViewController__presentLongLookForScrollAnimated_completion___block_invoke;
  aBlock[3] = &unk_1E6A919A0;
  objc_copyWeak(&v26, &location);
  id v6 = _Block_copy(aBlock);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __86__NCNotificationShortLookViewController__presentLongLookForScrollAnimated_completion___block_invoke_3;
  v22[3] = &unk_1E6A919C8;
  objc_copyWeak(&v24, &location);
  id v7 = v5;
  id v23 = v7;
  id v8 = _Block_copy(v22);
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  objc_super v16 = __86__NCNotificationShortLookViewController__presentLongLookForScrollAnimated_completion___block_invoke_4;
  id v17 = &unk_1E6A955E0;
  objc_copyWeak(&v21, &location);
  id v9 = v6;
  id v18 = v9;
  BOOL v10 = v8;
  id v19 = v10;
  id v11 = v7;
  id v20 = v11;
  id v12 = _Block_copy(&v14);
  id v13 = [(NCNotificationViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [v13 notificationRequestPresenter:self shouldTransitionToStage:@"notificationViewController.presentingStage.longLook" forTrigger:6 completionBlock:v12];
  }
  else
  {
    v9[2](v9);
    v10[2](v10);
  }

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v24);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

void __86__NCNotificationShortLookViewController__presentLongLookForScrollAnimated_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _notifyObserversWithBlock:&__block_literal_global_132];
}

void __86__NCNotificationShortLookViewController__presentLongLookForScrollAnimated_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [v4 notificationViewControllerDidEndUserInteraction:v5];
  }
}

void __86__NCNotificationShortLookViewController__presentLongLookForScrollAnimated_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained _interactionManagerCreatingIfNecessary];
  id v3 = [WeakRetained _lookView];
  [v3 bounds];
  UIRectGetCenter();
  objc_msgSend(v2, "presentAtLocation:completion:", *(void *)(a1 + 32));
}

void __86__NCNotificationShortLookViewController__presentLongLookForScrollAnimated_completion___block_invoke_4(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    if (a2)
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      [WeakRetained _setDidScrollPresentLongLookViewController:0];
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      id v5 = v7;
      uint64_t v6 = *(void *)(a1 + 48);
      if (!v6) {
        goto LABEL_7;
      }
      (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
    }
    id v5 = v7;
  }
LABEL_7:
}

- (id)_requiredContextIDsForDragSessionInView:(id)a3
{
  return (id)MEMORY[0x1F415C410](self, a2, a3);
}

- (BOOL)dragInteraction:(id)a3 sessionIsRestrictedToDraggingApplication:(id)a4
{
  return 1;
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F28D78]);
  [v5 registerDataRepresentationForTypeIdentifier:@"com.apple.usernotifications.drag.response" visibility:3 loadHandler:&__block_literal_global_138];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1710]) initWithItemProvider:v5];
  id v7 = [(NCNotificationViewController *)self notificationRequest];
  id v8 = [v7 userNotification];

  id v9 = [(NCNotificationViewController *)self notificationRequest];
  BOOL v10 = [v9 sectionIdentifier];

  id v11 = [v8 request];
  id v12 = [v11 content];
  id v13 = [v12 defaultActionURL];

  if (v13)
  {
    uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4FA6998]) initWithUniqueIdentifier:v10 withLaunchActions:0 startLocation:9];
    [v14 setLaunchURL:v13];
    [v6 setLocalObject:v14];
  }
  else
  {
    id v15 = objc_alloc(MEMORY[0x1E4FB1A10]);
    objc_super v16 = [MEMORY[0x1E4F44630] responseWithNotification:v8 actionIdentifier:*MEMORY[0x1E4F446D0]];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __82__NCNotificationShortLookViewController_dragInteraction_itemsForBeginningSession___block_invoke_2;
    v22[3] = &unk_1E6A95628;
    void v22[4] = self;
    uint64_t v14 = (void *)[v15 initWithResponse:v16 withHandler:v22];

    id v17 = objc_alloc(MEMORY[0x1E4FA6998]);
    id v18 = [MEMORY[0x1E4F1CAD0] setWithObject:v14];
    id v19 = (void *)[v17 initWithUniqueIdentifier:v10 withLaunchActions:v18 startLocation:9];

    [v6 setLocalObject:v19];
  }

  v23[0] = v6;
  id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];

  return v20;
}

uint64_t __82__NCNotificationShortLookViewController_dragInteraction_itemsForBeginningSession___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F1C9B8];
  id v3 = a2;
  id v4 = [v2 data];
  v3[2](v3, v4, 0);

  return 0;
}

void __82__NCNotificationShortLookViewController_dragInteraction_itemsForBeginningSession___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)*MEMORY[0x1E4F44698];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F44698], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = v4;
    id v7 = [v5 notificationRequest];
    id v8 = [v7 sectionIdentifier];
    uint64_t v9 = *MEMORY[0x1E4F446D0];
    int v10 = 138543874;
    id v11 = v8;
    __int16 v12 = 2114;
    uint64_t v13 = v9;
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl(&dword_1D7C04000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Application foreground launch action for notification response action %{public}@ recieved action response %{public}@", (uint8_t *)&v10, 0x20u);
  }
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1D40]) initWithView:self->_lookViewWrapper];
  objc_msgSend(v5, "set_springboardPlatterStyle:", 1);

  return v5;
}

- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5
{
  id v6 = a5;
  id v7 = self->_lookViewWrapper;
  id v8 = [(UIView *)v7 superview];
  id v9 = v6;
  int v10 = v9;
  if (v7) {
    BOOL v11 = v8 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  __int16 v12 = v9;
  if (!v11)
  {
    uint64_t v13 = [v8 window];

    __int16 v12 = v10;
    if (v13)
    {
      id v14 = objc_alloc(MEMORY[0x1E4FB1728]);
      [(UIView *)v7 center];
      long long v15 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      v18[0] = *MEMORY[0x1E4F1DAB8];
      v18[1] = v15;
      v18[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      uint64_t v16 = objc_msgSend(v14, "initWithContainer:center:transform:", v8, v18);
      __int16 v12 = [v10 retargetedPreviewWithTarget:v16];

      objc_msgSend(v12, "set_springboardPlatterStyle:", 1);
    }
  }

  return v12;
}

- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5
{
  id v7 = self->super._lookView;
  id v8 = a4;
  [(NCNotificationLookView *)v7 bounds];
  CGFloat x = v23.origin.x;
  CGFloat y = v23.origin.y;
  CGFloat width = v23.size.width;
  CGFloat height = v23.size.height;
  double v13 = CGRectGetWidth(v23);
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  double v14 = CGRectGetHeight(v24);
  if (v13 >= v14) {
    double v14 = v13;
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __93__NCNotificationShortLookViewController_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke;
  v20[3] = &unk_1E6A91E60;
  id v21 = v7;
  double v22 = fmax(fmin((v14 + 12.0) / v14, 1.10000002), 1.00100005);
  long long v15 = v7;
  [v8 addAnimations:v20];
  uint64_t v16 = self->_lookViewWrapper;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __93__NCNotificationShortLookViewController_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke_2;
  _OWORD v18[3] = &unk_1E6A95650;
  id v19 = v16;
  id v17 = v16;
  [v8 addCompletion:v18];
}

uint64_t __93__NCNotificationShortLookViewController_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v3, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  return [v1 setTransform:&v3];
}

uint64_t __93__NCNotificationShortLookViewController_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (!a2) {
    return [*(id *)(result + 32) setAlpha:0.0];
  }
  return result;
}

- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5
{
  id v6 = self->super._lookView;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __92__NCNotificationShortLookViewController_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke;
  v8[3] = &unk_1E6A91BB0;
  id v9 = v6;
  id v7 = v6;
  [a5 addAnimations:v8];
}

uint64_t __92__NCNotificationShortLookViewController_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v3, 1.0, 1.0);
  return [v1 setTransform:&v3];
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(NCNotificationViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 notificationViewController:self dragInteraction:v8 sessionWillBegin:v6];
  }
  [(NCNotificationViewController *)self _notifyObserversWithBlock:&__block_literal_global_153];
}

void __74__NCNotificationShortLookViewController_dragInteraction_sessionWillBegin___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [v4 notificationViewControllerWillBeginUserInteraction:v5];
  }
}

- (void)dragInteraction:(id)a3 session:(id)a4 willEndWithOperation:(unint64_t)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = [(NCNotificationViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v9 notificationViewController:self dragInteraction:v10 session:v8 willEndWithOperation:a5];
  }
  if (a5 <= 1) {
    [(UIView *)self->_lookViewWrapper setAlpha:1.0];
  }
}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = [(NCNotificationViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v9 notificationViewController:self dragInteraction:v10 session:v8 didEndWithOperation:a5];
  }
  [(NCNotificationViewController *)self _notifyObserversWithBlock:&__block_literal_global_161];
}

void __85__NCNotificationShortLookViewController_dragInteraction_session_didEndWithOperation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [v4 notificationViewControllerDidEndUserInteraction:v5];
  }
}

- (id)expandedPlatterInteractionManagerIdentifier:(id)a3
{
  id v4 = [(NCNotificationViewController *)self notificationRequest];
  id v5 = [v4 sectionIdentifier];
  id v6 = [(NCNotificationViewController *)self notificationRequest];
  id v7 = [v6 notificationIdentifier];
  id v8 = objc_msgSend(v7, "un_logDigest");
  id v9 = [v5 stringByAppendingPathExtension:v8];

  return v9;
}

- (id)expandedPlatterInteractionManager:(id)a3 menuWithSuggestedActions:(id)a4
{
  id v4 = (void *)MEMORY[0x1E4FB1970];
  id v5 = [(NCNotificationViewController *)self staticContentProvider];
  id v6 = [v5 menuActions];
  id v7 = [v4 menuWithChildren:v6];

  return v7;
}

- (BOOL)expandedPlatterInteractionManager:(id)a3 shouldBeginInteractionWithTouchAtLocation:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = [(NCNotificationViewController *)self staticContentProvider];
  char v9 = [v8 isThreadSummary];

  if (v9)
  {
LABEL_35:
    BOOL v22 = 0;
    goto LABEL_36;
  }
  BOOL v10 = [(NCNotificationViewController *)self isInteractionEnabled];
  if ([(NCNotificationShortLookViewController *)self isViewLoaded])
  {
    BOOL v11 = [(NCNotificationShortLookViewController *)self viewForPreview];
    __int16 v12 = [v11 window];
    BOOL v13 = v12 != 0;
  }
  else
  {
    BOOL v13 = 0;
  }
  if ([(NCNotificationShortLookViewController *)self isBeingPresented]) {
    int v14 = 1;
  }
  else {
    int v14 = [(NCNotificationShortLookViewController *)self isBeingDismissed];
  }
  if (!v10 || !v13)
  {
    if (v10) {
      goto LABEL_15;
    }
LABEL_31:
    id v21 = @"interaction disabled";
LABEL_32:
    __int16 v25 = v21;
    id v26 = (void *)*MEMORY[0x1E4FB3750];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = v26;
      uint64_t v28 = [(NCNotificationViewController *)self notificationRequest];
      v29 = [v28 notificationIdentifier];
      v30 = objc_msgSend(v29, "un_logDigest");
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v30;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v25;
      _os_log_impl(&dword_1D7C04000, v27, OS_LOG_TYPE_DEFAULT, "Denying interaction for view controller for request %{public}@: %{public}@", buf, 0x16u);
    }
    goto LABEL_35;
  }
  long long v15 = [(NCNotificationShortLookViewController *)self _notificationShortLookViewIfLoaded];
  int v16 = [v15 auxiliaryOptionsVisible];

  if (v16)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v34 = 0;
    id v17 = [(NCNotificationShortLookViewController *)self _notificationShortLookViewIfLoaded];
    id v18 = [v17 auxiliaryOptionButtons];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __117__NCNotificationShortLookViewController_expandedPlatterInteractionManager_shouldBeginInteractionWithTouchAtLocation___block_invoke;
    v32[3] = &unk_1E6A95678;
    v32[4] = self;
    v32[5] = buf;
    *(CGFloat *)&v32[6] = x;
    *(CGFloat *)&v32[7] = y;
    [v18 enumerateObjectsUsingBlock:v32];

    LODWORD(v17) = *(unsigned __int8 *)(*(void *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
    if (v17) {
      goto LABEL_31;
    }
  }
  if (self->_trigger == 3) {
    goto LABEL_15;
  }
  id v19 = [(NCNotificationViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    int v20 = [v19 notificationViewControllerShouldAllowExpandedPlatterInteraction:self];
LABEL_24:
    int v23 = v20;
    goto LABEL_26;
  }
  if (objc_opt_respondsToSelector())
  {
    int v20 = [v19 notificationViewControllerShouldAllowClickPresentationInteraction:self];
    goto LABEL_24;
  }
  int v23 = 1;
LABEL_26:
  int v24 = v23 ^ 1;
  if (self->_trigger) {
    int v24 = 1;
  }
  if (((v24 | v14) & 1) == 0) {
    self->_trigger = 1;
  }

  if ((v23 & 1) == 0) {
    goto LABEL_31;
  }
LABEL_15:
  if ((!v13 | v14))
  {
    id v21 = @"view not in a window";
    if (v13) {
      id v21 = @"view controller is transitioning";
    }
    goto LABEL_32;
  }
  [(NCNotificationViewController *)self _notifyObserversWithBlock:&__block_literal_global_169];
  if (![(NCNotificationViewController *)self _canPan]) {
    [(id)objc_opt_class() _prepareSharedNotificationFeedbackGenerator];
  }
  BOOL v22 = 1;
LABEL_36:

  return v22;
}

void __117__NCNotificationShortLookViewController_expandedPlatterInteractionManager_shouldBeginInteractionWithTouchAtLocation___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = a2;
  id v8 = [v6 viewForPreview];
  objc_msgSend(v8, "convertPoint:toView:", v7, *(double *)(a1 + 48), *(double *)(a1 + 56));
  char v9 = objc_msgSend(v7, "hitTest:withEvent:", 0);

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v9 != 0;
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

void __117__NCNotificationShortLookViewController_expandedPlatterInteractionManager_shouldBeginInteractionWithTouchAtLocation___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [v4 notificationViewControllerWillBeginUserInteraction:v5];
  }
}

- (void)expandedPlatterInteractionManager:(id)a3 shouldCommitInteraction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __99__NCNotificationShortLookViewController_expandedPlatterInteractionManager_shouldCommitInteraction___block_invoke;
  aBlock[3] = &unk_1E6A92CD0;
  objc_copyWeak(&v23, &location);
  id v8 = v7;
  id v22 = v8;
  char v9 = (void (**)(void *, void))_Block_copy(aBlock);
  BOOL v10 = [(NCNotificationViewController *)self delegate];
  BOOL v11 = [(NCNotificationViewController *)self staticContentProvider];
  int v12 = [v11 isThreadSummary];

  if (v12)
  {
    [v10 handleTapOnNotificationViewController:self];
LABEL_14:
    v9[2](v9, 0);
    goto LABEL_15;
  }
  if (![(NCNotificationShortLookViewController *)self shouldCommitToExpandedPlatterPresentationWithFeedback])goto LABEL_14; {
  int v13 = [v6 reachedForceThreshold];
  }
  int64_t trigger = self->_trigger;
  if (trigger == 1) {
    int v15 = v13;
  }
  else {
    int v15 = 0;
  }
  if (v15 == 1)
  {
    int64_t trigger = 2;
    self->_int64_t trigger = 2;
  }
  BOOL v16 = [(NCNotificationShortLookViewController *)self _isLockedByAppProtection];
  if (trigger == 1 && v16)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __99__NCNotificationShortLookViewController_expandedPlatterInteractionManager_shouldCommitInteraction___block_invoke_3;
    _OWORD v18[3] = &unk_1E6A956A0;
    void v18[4] = self;
    id v19 = v9;
    uint64_t v20 = 1;
    [(NCNotificationShortLookViewController *)self _requestAppProtectionUnlockWithCompletion:v18];
  }
  else
  {
    [(NCNotificationShortLookViewController *)self _checkDelegateShouldTransitionForTrigger:trigger completionBlock:v9];
  }
LABEL_15:

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

uint64_t __99__NCNotificationShortLookViewController_expandedPlatterInteractionManager_shouldCommitInteraction___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _notifyObserversWithBlock:&__block_literal_global_180];
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void __99__NCNotificationShortLookViewController_expandedPlatterInteractionManager_shouldCommitInteraction___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [v4 notificationViewControllerDidEndUserInteraction:v5];
  }
}

uint64_t __99__NCNotificationShortLookViewController_expandedPlatterInteractionManager_shouldCommitInteraction___block_invoke_3(uint64_t a1, char a2)
{
  if (a2) {
    return [*(id *)(a1 + 32) _checkDelegateShouldTransitionForTrigger:*(void *)(a1 + 48) completionBlock:*(void *)(a1 + 40)];
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_checkDelegateShouldTransitionForTrigger:(int64_t)a3 completionBlock:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void))a4;
  id v7 = [(NCNotificationViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [v7 notificationRequestPresenter:self shouldTransitionToStage:@"notificationViewController.presentingStage.longLook" forTrigger:a3 completionBlock:v6];
  }
  else
  {
    id v8 = (void *)*MEMORY[0x1E4FB3750];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
    {
      char v9 = v8;
      BOOL v10 = [(NCNotificationViewController *)self notificationRequest];
      BOOL v11 = [v10 notificationIdentifier];
      int v12 = objc_msgSend(v11, "un_logDigest");
      int v13 = 138543362;
      int v14 = v12;
      _os_log_impl(&dword_1D7C04000, v9, OS_LOG_TYPE_DEFAULT, "Delegate for notification view controller for request %{public}@ doesn't respond to selector – denying presentation", (uint8_t *)&v13, 0xCu);
    }
    v6[2](v6, 0);
    [(id)objc_opt_class() _playNegativeInteractionHaptic];
  }
}

- (void)expandedPlatterInteractionManager:(id)a3 willPresentContentWithAnimator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_storeStrong((id *)&self->_activeExpandedPlatterInteractionAnimator, a4);
  id v8 = self->_expandedPlatterViewController;
  [(NCExpandedPlatterViewController *)v8 expandedPlatterWillPresent:v8];
  char v9 = [(NCNotificationViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    BOOL v10 = [(NCNotificationViewController *)self notificationRequest];
    [v9 notificationViewController:self willPresentLongLookForRequst:v10 animator:v7];
  }
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __106__NCNotificationShortLookViewController_expandedPlatterInteractionManager_willPresentContentWithAnimator___block_invoke;
  v13[3] = &unk_1E6A93190;
  objc_copyWeak(&v16, &location);
  BOOL v11 = v8;
  int v14 = v11;
  id v12 = v7;
  id v15 = v12;
  [v12 addCompletion:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __106__NCNotificationShortLookViewController_expandedPlatterInteractionManager_willPresentContentWithAnimator___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = objc_opt_class();
  id v4 = WeakRetained;
  id v8 = v4;
  if (v3)
  {
    BOOL v5 = (objc_opt_isKindOfClass() & 1) == 0;
    id v4 = v8;
    if (v5) {
      uint64_t v3 = 0;
    }
    else {
      uint64_t v3 = (uint64_t)v8;
    }
  }

  if (v3) {
    v8[154] = 0;
  }
  [*(id *)(a1 + 32) expandedPlatterDidPresent:*(void *)(a1 + 32)];
  id v6 = [v8 _activeExpandedPlatterInteractionAnimator];
  id v7 = *(void **)(a1 + 40);

  if (v6 == v7) {
    [v8 _setActiveExpandedPlatterInteractionAnimator:0];
  }
}

- (BOOL)expandedPlatterInteractionManagerShouldAllowInitialSwipeToDismiss:(id)a3
{
  return self->_trigger != 6;
}

- (BOOL)expandedPlatterInteractionManagerShouldAllowLongPressGesture:(id)a3
{
  id v4 = [(NCNotificationViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v5 = [v4 notificationViewControllerShouldAllowLongPressGesture:self];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

- (void)expandedPlatterInteractionManager:(id)a3 willDismissContentWithAnimator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_storeStrong((id *)&self->_activeExpandedPlatterInteractionAnimator, a4);
  expandedPlatterDismissalReason = (__CFString *)self->_expandedPlatterDismissalReason;
  if (!expandedPlatterDismissalReason) {
    expandedPlatterDismissalReason = @"NCExpandedPlatterObservableDismissalReasonUnknown";
  }
  char v9 = expandedPlatterDismissalReason;
  [(NCNotificationShortLookViewController *)self _expandedPlatterInteractionManager:v6 willDismissWithReason:v9];
  BOOL v10 = [(NCNotificationViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    BOOL v11 = [(NCNotificationViewController *)self notificationRequest];
    [v10 notificationViewController:self dismissPresentLongLookForRequst:v11 animator:v7];
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __106__NCNotificationShortLookViewController_expandedPlatterInteractionManager_willDismissContentWithAnimator___block_invoke;
  v16[3] = &unk_1E6A93C50;
  v16[4] = self;
  id v17 = v7;
  id v18 = v6;
  id v19 = v9;
  id v12 = v9;
  id v13 = v6;
  id v14 = v7;
  id v15 = self;
  [v14 addCompletion:v16];
}

void __106__NCNotificationShortLookViewController_expandedPlatterInteractionManager_willDismissContentWithAnimator___block_invoke(uint64_t a1)
{
  id v4 = *(id *)(a1 + 32);
  id v2 = [v4 _activeExpandedPlatterInteractionAnimator];
  uint64_t v3 = *(void **)(a1 + 40);

  if (v2 == v3)
  {
    [v4 _expandedPlatterInteractionManager:*(void *)(a1 + 48) didDismissWithReason:*(void *)(a1 + 56)];
    [v4 _setActiveExpandedPlatterInteractionAnimator:0];
  }
}

- (id)expandedPlatterViewController:(id)a3 staticContentProviderForNotificationRequest:(id)a4
{
  id v4 = [(NCNotificationViewController *)self staticContentProvider];
  char v5 = (void *)[v4 copyWithContentHidingEnforcement:1];

  return v5;
}

- (int64_t)expandedPlatterViewController:(id)a3 dateFormatStyleForNotificationRequest:(id)a4
{
  char v5 = [(NCNotificationViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    int64_t v6 = [v5 notificationViewControllerDateFormatStyle:self];
  }
  else {
    int64_t v6 = 1;
  }

  return v6;
}

- (void)expandedPlatterViewController:(id)a3 requestsDismissalWithReason:(id)a4 userInfo:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  p_expandedPlatterDismissalReason = &self->_expandedPlatterDismissalReason;
  objc_storeStrong((id *)&self->_expandedPlatterDismissalReason, a4);
  if (NCEqualExpandedPlatterObservableDismissalReasons(self->_expandedPlatterDismissalReason, @"dismissalReasonURL"))
  {
    BOOL v11 = [v9 objectForKey:@"NCExpandedPlatterObservableDismissalReasonUserInfoKeyURL"];
    if (v11)
    {
      id v12 = dispatch_get_global_queue(25, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __108__NCNotificationShortLookViewController_expandedPlatterViewController_requestsDismissalWithReason_userInfo___block_invoke;
      block[3] = &unk_1E6A91BB0;
      id v20 = v11;
      dispatch_async(v12, block);
    }
  }
  else if (NCEqualExpandedPlatterObservableDismissalReasons(*p_expandedPlatterDismissalReason, @"dismissalReasonDefaultTap"))
  {
    id v13 = +[NCNotificationEventTracker sharedInstance];
    id v14 = [(NCNotificationViewController *)self notificationRequest];
    id v15 = [(NCNotificationViewController *)self notificationUsageTrackingState];
    [v13 longLookDefaultActionInvokedWithTrigger:1 forNotificationRequest:v14 withState:v15];

    [(NCNotificationViewController *)self _executeDefaultAction:1];
  }
  else if (NCEqualExpandedPlatterObservableDismissalReasons(*p_expandedPlatterDismissalReason, @"dismissalReasonHomeAction"))
  {
    id v16 = +[NCNotificationEventTracker sharedInstance];
    id v17 = [(NCNotificationViewController *)self notificationRequest];
    id v18 = [(NCNotificationViewController *)self notificationUsageTrackingState];
    [v16 longLookReparkInvokedWithTrigger:0 forNotificationRequest:v17 withState:v18];

    [(NCNotificationViewController *)self _executeCancelAction:1];
  }
}

void __108__NCNotificationShortLookViewController_expandedPlatterViewController_requestsDismissalWithReason_userInfo___block_invoke(uint64_t a1)
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4FADBC0]) initWithURL:*(void *)(a1 + 32)];
  if ([v3 isValid])
  {
    [v3 setShowUIPrompt:1];
    uint64_t v4 = [v3 URL];

    id v2 = (id)v4;
  }
  char v5 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  uint64_t v6 = *MEMORY[0x1E4F626A0];
  v8[0] = *MEMORY[0x1E4F62688];
  v8[1] = v6;
  v9[0] = MEMORY[0x1E4F1CC38];
  v9[1] = MEMORY[0x1E4F1CC38];
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  [v5 openSensitiveURL:v2 withOptions:v7 error:0];
}

- (unint64_t)importantAdornmentEligibleOptionsForNotificationViewController:(id)a3
{
  uint64_t v4 = [(NCNotificationViewController *)self delegate];
  if (v4
    && (objc_opt_respondsToSelector() & 1) != 0
    && [v4 importantAdornmentEligibleOptionsForNotificationViewController:self])
  {
    unint64_t v5 = [v4 importantAdornmentEligibleOptionsForNotificationViewController:self];
  }
  else
  {
    unint64_t v5 = -1;
  }

  return v5;
}

- (void)expandedPlatterWillPresent:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    id v7 = [(NCNotificationViewController *)self notificationRequest];
    id v8 = [v7 notificationIdentifier];
    id v9 = objc_msgSend(v8, "un_logDigest");
    BOOL v10 = NCStringFromLongLookPresentationTrigger(self->_trigger);
    int v19 = 138543618;
    id v20 = v9;
    __int16 v21 = 2114;
    id v22 = v10;
    _os_log_impl(&dword_1D7C04000, v6, OS_LOG_TYPE_DEFAULT, "Notification view controller will present expanded platter for request %{public}@ (_trigger: %{public}@)", (uint8_t *)&v19, 0x16u);
  }
  self->_expandedPlatterPresentationState = 1;
  BOOL v11 = +[NCNotificationEventTracker sharedInstance];
  id v12 = [(NCNotificationViewController *)self notificationRequest];
  [v11 longLookPresentedForNotificationRequest:v12];

  [(NCNotificationViewController *)self _notifyObserversWithBlock:&__block_literal_global_194];
  id v13 = [(NCExpandedPlatterViewController *)self->_expandedPlatterViewController customContentViewController];
  id v14 = [v13 contentExtensionIdentifier];

  if ([v14 length])
  {
    id v15 = NCSDKVersionForExtensionWithIdentifier(v14, 0);
    BOOL v16 = NCIsSDKVersionSameOrAfterSDKVersion(v15, @"13.0");

    if (!v16)
    {
      id v17 = [(NCExpandedPlatterViewController *)self->_expandedPlatterViewController presentationController];
      id v18 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:1];
      [v17 setOverrideTraitCollection:v18];
    }
  }
}

void __68__NCNotificationShortLookViewController_expandedPlatterWillPresent___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [v4 longLookWillPresentForNotificationViewController:v5];
  }
}

- (void)expandedPlatterDidPresent:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    uint64_t v6 = [(NCNotificationViewController *)self notificationRequest];
    id v7 = [v6 notificationIdentifier];
    id v8 = objc_msgSend(v7, "un_logDigest");
    int v9 = 138543362;
    BOOL v10 = v8;
    _os_log_impl(&dword_1D7C04000, v5, OS_LOG_TYPE_DEFAULT, "Notification view controller did present expanded platter for request %{public}@", (uint8_t *)&v9, 0xCu);
  }
  self->_expandedPlatterPresentationState = 2;
  [(NCNotificationViewController *)self _notifyObserversWithBlock:&__block_literal_global_202];
}

void __67__NCNotificationShortLookViewController_expandedPlatterDidPresent___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [v4 longLookDidPresentForNotificationViewController:v5];
  }
}

- (void)expandedPlatter:(id)a3 willDismissWithReason:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    id v7 = [(NCNotificationViewController *)self notificationRequest];
    id v8 = [v7 notificationIdentifier];
    int v9 = objc_msgSend(v8, "un_logDigest");
    int v10 = 138543362;
    uint64_t v11 = v9;
    _os_log_impl(&dword_1D7C04000, v6, OS_LOG_TYPE_DEFAULT, "Notification view controller will dismiss expanded platter for request %{public}@", (uint8_t *)&v10, 0xCu);
  }
  self->_expandedPlatterPresentationState = 3;
  [(NCNotificationViewController *)self _notifyObserversWithBlock:&__block_literal_global_206];
}

void __79__NCNotificationShortLookViewController_expandedPlatter_willDismissWithReason___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [v4 longLookWillDismissForNotificationViewController:v5];
  }
}

- (void)expandedPlatter:(id)a3 didDismissWithReason:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    id v7 = [(NCNotificationViewController *)self notificationRequest];
    id v8 = [v7 notificationIdentifier];
    int v9 = objc_msgSend(v8, "un_logDigest");
    int v14 = 138543362;
    id v15 = v9;
    _os_log_impl(&dword_1D7C04000, v6, OS_LOG_TYPE_DEFAULT, "Notification view controller did dismiss expanded platter for request %{public}@", (uint8_t *)&v14, 0xCu);
  }
  self->_expandedPlatterPresentationState = 0;
  [(NCExpandedPlatterViewController *)self->_expandedPlatterViewController removeExpandedPlatterObserver:self];
  expandedPlatterViewController = self->_expandedPlatterViewController;
  self->_expandedPlatterViewController = 0;

  uint64_t v11 = [(NSMutableArray *)self->_containerViewProviders firstObject];
  [v11 invalidate];

  [(NSMutableArray *)self->_containerViewProviders removeFirstObject];
  containerViewForExpandedContent = self->_containerViewForExpandedContent;
  self->_containerViewForExpandedContent = 0;

  expandedPlatterDismissalReason = self->_expandedPlatterDismissalReason;
  self->_expandedPlatterDismissalReason = 0;

  [(NCNotificationViewController *)self _setupCustomContentProvider];
  self->_didScrollPresentLongLookViewController = 0;
  [(NCNotificationViewController *)self _notifyObserversWithBlock:&__block_literal_global_210];
}

void __78__NCNotificationShortLookViewController_expandedPlatter_didDismissWithReason___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [v4 longLookDidDismissForNotificationViewController:v5];
  }
}

- (void)customContent:(id)a3 didUpdateUserNotificationActions:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self->_expandedPlatterViewController)
  {
    id v8 = (void *)*MEMORY[0x1E4FB3750];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = v8;
      int v10 = [(NCNotificationViewController *)self notificationRequest];
      uint64_t v11 = [v10 notificationIdentifier];
      uint64_t v12 = objc_msgSend(v11, "un_logDigest");
      *(_DWORD *)buf = 138543362;
      id v20 = v12;
      _os_log_impl(&dword_1D7C04000, v9, OS_LOG_TYPE_DEFAULT, "Custom content extension is updating expanded platter actions for notification request %{public}@", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __88__NCNotificationShortLookViewController_customContent_didUpdateUserNotificationActions___block_invoke;
    aBlock[3] = &unk_1E6A92FE0;
    objc_copyWeak(&v18, (id *)buf);
    id v17 = v7;
    id v13 = (void (**)(void))_Block_copy(aBlock);
    activeExpandedPlatterInteractionAnimator = self->_activeExpandedPlatterInteractionAnimator;
    if (activeExpandedPlatterInteractionAnimator) {
      [(PLExpandedPlatterInteractionAnimating *)activeExpandedPlatterInteractionAnimator addCompletion:v13];
    }
    else {
      v13[2](v13);
    }

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)NCNotificationShortLookViewController;
    [(NCNotificationShortLookViewController *)&v15 customContent:v6 didUpdateUserNotificationActions:v7];
  }
}

void __88__NCNotificationShortLookViewController_customContent_didUpdateUserNotificationActions___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained staticContentProvider];
    [v4 setOverriddenActions:*(void *)(a1 + 32)];

    id v5 = (void *)v3[155];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __88__NCNotificationShortLookViewController_customContent_didUpdateUserNotificationActions___block_invoke_2;
    v6[3] = &unk_1E6A956C8;
    v6[4] = v3;
    [v5 updateVisibleMenuWithBlock:v6];
  }
}

id __88__NCNotificationShortLookViewController_customContent_didUpdateUserNotificationActions___block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4FB1970];
  id v2 = [*(id *)(a1 + 32) staticContentProvider];
  uint64_t v3 = [v2 menuActions];
  id v4 = [v1 menuWithChildren:v3];

  return v4;
}

- (id)_longLookNotificationViewController
{
  longLookNotificationViewController = self->_longLookNotificationViewController;
  if (!longLookNotificationViewController)
  {
    id v4 = [NCNotificationLongLookViewController alloc];
    id v5 = [(NCNotificationViewController *)self notificationRequest];
    id v6 = [(NCNotificationLongLookViewController *)v4 _initWithNotificationRequest:v5 andPresentingNotificationViewController:self revealingAdditionalContentOnPresentation:[(NCNotificationViewController *)self revealAdditionalContentOnPresentation]];
    id v7 = self->_longLookNotificationViewController;
    self->_longLookNotificationViewController = v6;

    id v8 = self->_longLookNotificationViewController;
    int v9 = [(NCNotificationViewController *)self delegate];
    [(NCNotificationViewController *)v8 setDelegate:v9];

    [(NCNotificationViewController *)self->_longLookNotificationViewController addObserver:self];
    [(NCNotificationViewController *)self->_longLookNotificationViewController updateContent];
    int v10 = [(NCNotificationViewController *)self->_longLookNotificationViewController staticContentProvider];

    longLookNotificationViewController = self->_longLookNotificationViewController;
    if (!v10)
    {
      uint64_t v11 = [(NCNotificationViewController *)self staticContentProvider];
      [(NCNotificationViewController *)longLookNotificationViewController setStaticContentProvider:v11];

      longLookNotificationViewController = self->_longLookNotificationViewController;
    }
  }

  return longLookNotificationViewController;
}

- (id)transitioningDelegateForClickPresentationInteractionManager:(id)a3
{
  uint64_t v3 = objc_alloc_init(NCLongLookTransitioningDelegate);

  return v3;
}

- (BOOL)clickPresentationInteractionManager:(id)a3 shouldBeginInteractionWithTouchAtLocation:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v7 = a3;
  BOOL v8 = [(NCNotificationViewController *)self isInteractionEnabled];
  if ([(NCNotificationShortLookViewController *)self isBeingPresented])
  {
    int v9 = 1;
    if (!v8) {
      goto LABEL_7;
    }
  }
  else
  {
    int v9 = [(NCNotificationShortLookViewController *)self isBeingDismissed];
    if (!v8)
    {
LABEL_7:
      LOBYTE(v14) = 0;
      goto LABEL_14;
    }
  }
  int v10 = [(NCNotificationShortLookViewController *)self _notificationShortLookViewIfLoaded];
  int v11 = [v10 auxiliaryOptionsVisible];

  if (v11)
  {
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x2020000000;
    char v23 = 0;
    uint64_t v12 = [(NCNotificationShortLookViewController *)self _notificationShortLookViewIfLoaded];
    id v13 = [v12 auxiliaryOptionButtons];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __119__NCNotificationShortLookViewController_clickPresentationInteractionManager_shouldBeginInteractionWithTouchAtLocation___block_invoke;
    v19[3] = &unk_1E6A95678;
    v19[4] = self;
    v19[5] = &v20;
    *(CGFloat *)&v19[6] = x;
    *(CGFloat *)&v19[7] = y;
    [v13 enumerateObjectsUsingBlock:v19];

    LODWORD(v12) = *((unsigned __int8 *)v21 + 24);
    _Block_object_dispose(&v20, 8);
    if (v12) {
      goto LABEL_7;
    }
  }
  objc_super v15 = [(NCNotificationViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    int v14 = [v15 notificationViewControllerShouldAllowClickPresentationInteraction:self];
  }
  else {
    int v14 = 1;
  }
  if (((v14 ^ 1 | v9) & 1) == 0)
  {
    uint64_t v16 = [MEMORY[0x1E4F1C9C8] date];
    tapBeginTime = self->_tapBeginTime;
    self->_tapBeginTime = v16;

    self->_int64_t trigger = 1;
  }

LABEL_14:
  return v14 & (v9 ^ 1);
}

void __119__NCNotificationShortLookViewController_clickPresentationInteractionManager_shouldBeginInteractionWithTouchAtLocation___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = a2;
  BOOL v8 = [v6 viewForPreview];
  objc_msgSend(v8, "convertPoint:toView:", v7, *(double *)(a1 + 48), *(double *)(a1 + 56));
  int v9 = objc_msgSend(v7, "hitTest:withEvent:", 0);

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v9 != 0;
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

- (void)clickPresentationInteractionManagerWillBeginUserInteraction:(id)a3
{
}

void __101__NCNotificationShortLookViewController_clickPresentationInteractionManagerWillBeginUserInteraction___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [v4 notificationViewControllerWillBeginUserInteraction:v5];
  }
}

- (void)clickPresentationInteractionManagerDidEndUserInteraction:(id)a3
{
  tapBeginTime = self->_tapBeginTime;
  self->_tapBeginTime = 0;

  if (!self->_didScrollPresentLongLookViewController)
  {
    [(NCNotificationViewController *)self _notifyObserversWithBlock:&__block_literal_global_222];
    self->_int64_t trigger = 0;
  }
}

void __98__NCNotificationShortLookViewController_clickPresentationInteractionManagerDidEndUserInteraction___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [v4 notificationViewControllerDidEndUserInteraction:v5];
  }
}

- (void)clickPresentationInteractionManager:(id)a3 shouldFinishInteractionThatReachedForceThreshold:(BOOL)a4 withCompletionBlock:(id)a5
{
  BOOL v5 = a4;
  BOOL v8 = (void (**)(id, void))a5;
  id v7 = [(NCNotificationViewController *)self delegate];
  if (v5 && self->_trigger == 1) {
    self->_int64_t trigger = 2;
  }
  if (objc_opt_respondsToSelector()) {
    [v7 notificationRequestPresenter:self shouldTransitionToStage:@"notificationViewController.presentingStage.longLook" forTrigger:self->_trigger completionBlock:v8];
  }
  else {
    v8[2](v8, 0);
  }
}

- (void)_handlePresentedContentDismissalForClickPresentationInteractionManagerWithTrigger:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (objc_opt_respondsToSelector()) {
    longLookNotificationViewController = self->_longLookNotificationViewController;
  }
  else {
    longLookNotificationViewController = 0;
  }
  id v6 = longLookNotificationViewController;
  if (objc_opt_respondsToSelector())
  {
    id v7 = self->_longLookNotificationViewController;
    BOOL v8 = v7;
    if (v6 && v7) {
      goto LABEL_11;
    }
  }
  else
  {
    BOOL v8 = 0;
  }
  int v9 = *MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_ERROR))
  {
    int v10 = 138543874;
    int v11 = v6;
    __int16 v12 = 2114;
    id v13 = v8;
    __int16 v14 = 2114;
    objc_super v15 = self;
    _os_log_error_impl(&dword_1D7C04000, v9, OS_LOG_TYPE_ERROR, "Couldn't find both presentable (%{public}@) and dismisser (%{public}@) for long look VC %{public}@", (uint8_t *)&v10, 0x20u);
  }
LABEL_11:
  [(NCNotificationLongLookViewController *)v8 expandedPlatterPresentable:v6 requestsDismissalWithTrigger:a3];
}

- (void)clickPresentationInteractionManager:(id)a3 willDismissPresentedContentWithTrigger:(int64_t)a4
{
}

- (void)clickPresentationInteractionManager:(id)a3 declinedDismissingPresentedContentWithTrigger:(int64_t)a4
{
}

- (BOOL)clickPresentationInteractionManagerShouldAllowLongPressGesture:(id)a3
{
  id v4 = [(NCNotificationViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v5 = [v4 notificationViewControllerShouldAllowLongPressGesture:self];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

- (PLClickPresentationInteractionManager)clickPresentationInteractionManager
{
  return self->_clickPresentationInteractionManager;
}

- (CGRect)initialPresentedFrameOfViewForPreview
{
  uint64_t v3 = [(NCNotificationViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();
  char v5 = [(NCNotificationShortLookViewController *)self viewForPreview];
  id v6 = v5;
  if (v4)
  {
    [v3 notificationViewController:self initialFrameForPresentingLongLookFromView:v5];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
  }
  else
  {
    objc_super v15 = [v5 superview];
    [v6 frame];
    objc_msgSend(v15, "convertRect:toView:", 0);
    double v8 = v16;
    double v10 = v17;
    double v12 = v18;
    double v14 = v19;
  }
  double v20 = v8;
  double v21 = v10;
  double v22 = v12;
  double v23 = v14;
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v22;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v20;
  return result;
}

- (CGRect)finalPresentedFrameOfViewForPreview
{
  [(NCNotificationShortLookViewController *)self initialPresentedFrameOfViewForPreview];
  self->_finalPresentedFrameOfViewForPreview.origin.CGFloat x = v3;
  self->_finalPresentedFrameOfViewForPreview.origin.CGFloat y = v4;
  self->_finalPresentedFrameOfViewForPreview.size.CGFloat width = v5;
  self->_finalPresentedFrameOfViewForPreview.size.CGFloat height = v6;
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (CGRect)finalDismissedFrameOfViewForPreview
{
  double v3 = [(NCNotificationViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    double v4 = [(NCNotificationShortLookViewController *)self viewForPreview];
    [v3 notificationViewController:self finalFrameForDismissingLongLookFromView:v4];
    CGFloat x = v5;
    CGFloat y = v7;
    CGFloat width = v9;
    CGFloat height = v11;
  }
  else
  {
    CGFloat x = self->_finalPresentedFrameOfViewForPreview.origin.x;
    CGFloat y = self->_finalPresentedFrameOfViewForPreview.origin.y;
    CGFloat width = self->_finalPresentedFrameOfViewForPreview.size.width;
    CGFloat height = self->_finalPresentedFrameOfViewForPreview.size.height;
  }

  double v13 = x;
  double v14 = y;
  double v15 = width;
  double v16 = height;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (BOOL)isHighlighted
{
  id v2 = [(NCNotificationShortLookViewController *)self _notificationShortLookViewIfLoaded];
  double v3 = [v2 backgroundMaterialView];
  char v4 = [v3 isHighlighted];

  return v4;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(NCNotificationShortLookViewController *)self _notificationShortLookViewIfLoaded];
  char v4 = [v5 backgroundMaterialView];
  [v4 setHighlighted:v3];
}

- (UIBezierPath)visiblePath
{
  id v2 = [(NCNotificationShortLookViewController *)self viewForPreview];
  BOOL v3 = (void *)MEMORY[0x1E4FB14C0];
  [v2 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [v2 _continuousCornerRadius];
  double v13 = objc_msgSend(v3, "bezierPathWithRoundedRect:cornerRadius:", v5, v7, v9, v11, v12 + -2.0);

  return (UIBezierPath *)v13;
}

- (void)notificationViewControllerWillPresent:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    double v6 = v5;
    double v7 = [(NCNotificationViewController *)self notificationRequest];
    double v8 = [v7 notificationIdentifier];
    double v9 = objc_msgSend(v8, "un_logDigest");
    double v10 = NCStringFromLongLookPresentationTrigger(self->_trigger);
    int v19 = 138543618;
    double v20 = v9;
    __int16 v21 = 2114;
    double v22 = v10;
    _os_log_impl(&dword_1D7C04000, v6, OS_LOG_TYPE_DEFAULT, "Notification view controller will present long look for request %{public}@ (_trigger: %{public}@)", (uint8_t *)&v19, 0x16u);
  }
  double v11 = +[NCNotificationEventTracker sharedInstance];
  double v12 = [(NCNotificationViewController *)self notificationRequest];
  [v11 longLookPresentedForNotificationRequest:v12];

  [(UITapGestureRecognizer *)self->_tapGesture setEnabled:0];
  [(NCNotificationViewController *)self _notifyObserversWithBlock:&__block_literal_global_233];
  double v13 = [(NCNotificationViewController *)self->_longLookNotificationViewController _customContentProvidingViewController];
  double v14 = [v13 contentExtensionIdentifier];

  if ([v14 length])
  {
    double v15 = NCSDKVersionForExtensionWithIdentifier(v14, 0);
    BOOL v16 = NCIsSDKVersionSameOrAfterSDKVersion(v15, @"13.0");

    if (!v16)
    {
      double v17 = [(NCNotificationLongLookViewController *)self->_longLookNotificationViewController presentationController];
      double v18 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:1];
      [v17 setOverrideTraitCollection:v18];
    }
  }
  [(NCNotificationLongLookViewController *)self->_longLookNotificationViewController _updateWithProvidedCustomContent];
}

void __79__NCNotificationShortLookViewController_notificationViewControllerWillPresent___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [v4 longLookWillPresentForNotificationViewController:v5];
  }
}

- (void)notificationViewControllerDidPresent:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    double v6 = v5;
    double v7 = [(NCNotificationViewController *)self notificationRequest];
    double v8 = [v7 notificationIdentifier];
    double v9 = objc_msgSend(v8, "un_logDigest");
    int v13 = 138543362;
    double v14 = v9;
    _os_log_impl(&dword_1D7C04000, v6, OS_LOG_TYPE_DEFAULT, "Notification view controller did present long look for request %{public}@", (uint8_t *)&v13, 0xCu);
  }
  if ([(NCNotificationViewController *)self _canPan])
  {
    double v10 = [(NCNotificationShortLookViewController *)self view];
    double v11 = [(NCNotificationLongLookViewController *)self->_longLookNotificationViewController presentationController];
    double v12 = [v11 containerView];
    [v12 bounds];
    objc_msgSend(v10, "setFrame:");
  }
  [(NCNotificationViewController *)self _notifyObserversWithBlock:&__block_literal_global_235];
}

void __78__NCNotificationShortLookViewController_notificationViewControllerDidPresent___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [v4 longLookDidPresentForNotificationViewController:v5];
  }
}

- (void)notificationViewControllerWillDismiss:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    double v6 = [(NCNotificationViewController *)self notificationRequest];
    double v7 = [v6 notificationIdentifier];
    double v8 = objc_msgSend(v7, "un_logDigest");
    int v9 = 138543362;
    double v10 = v8;
    _os_log_impl(&dword_1D7C04000, v5, OS_LOG_TYPE_DEFAULT, "Notification view controller will dismiss long look for request %{public}@", (uint8_t *)&v9, 0xCu);
  }
  [(NCNotificationViewController *)self _notifyObserversWithBlock:&__block_literal_global_237];
}

void __79__NCNotificationShortLookViewController_notificationViewControllerWillDismiss___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [v4 longLookWillDismissForNotificationViewController:v5];
  }
}

- (void)notificationViewControllerDidDismiss:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    double v6 = [(NCNotificationViewController *)self notificationRequest];
    double v7 = [v6 notificationIdentifier];
    double v8 = objc_msgSend(v7, "un_logDigest");
    int v10 = 138543362;
    uint64_t v11 = v8;
    _os_log_impl(&dword_1D7C04000, v5, OS_LOG_TYPE_DEFAULT, "Notification view controller did dismiss long look for request %{public}@", (uint8_t *)&v10, 0xCu);
  }
  [(UITapGestureRecognizer *)self->_tapGesture setEnabled:1];
  longLookNotificationViewController = self->_longLookNotificationViewController;
  self->_longLookNotificationViewController = 0;

  self->_didScrollPresentLongLookViewController = 0;
  [(NCNotificationViewController *)self _notifyObserversWithBlock:&__block_literal_global_239];
}

void __78__NCNotificationShortLookViewController_notificationViewControllerDidDismiss___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [v4 longLookDidDismissForNotificationViewController:v5];
  }
}

- (BOOL)expandedPlatterPresentationControllerShouldProvideBackground:(id)a3
{
  return self->_didScrollPresentLongLookViewController;
}

- (id)customBackgroundContainerViewForExpandedPlatterPresentationController:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationShortLookViewController *)self parentViewController];
  if (objc_opt_respondsToSelector())
  {
    double v6 = [v5 customBackgroundContainerViewForExpandedPlatterPresentationController:v4];
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (id)_presentedLongLookViewController
{
  BOOL v3 = [(PLClickPresentationInteractionManager *)self->_clickPresentationInteractionManager presentedViewController];
  longLookNotificationViewController = v3;
  if (!v3) {
    longLookNotificationViewController = self->_longLookNotificationViewController;
  }
  uint64_t v5 = objc_opt_class();
  double v6 = longLookNotificationViewController;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      double v7 = v6;
    }
    else {
      double v7 = 0;
    }
  }
  else
  {
    double v7 = 0;
  }
  double v8 = v7;

  return v8;
}

- (BOOL)_didScrollPresentLongLookViewController
{
  return self->_didScrollPresentLongLookViewController;
}

- (void)_setDidScrollPresentLongLookViewController:(BOOL)a3
{
  self->_didScrollPresentLongLookViewController = a3;
}

- (PLExpandedPlatterInteractionAnimating)_activeExpandedPlatterInteractionAnimator
{
  return self->_activeExpandedPlatterInteractionAnimator;
}

- (void)_setActiveExpandedPlatterInteractionAnimator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeExpandedPlatterInteractionAnimator, 0);
  objc_storeStrong((id *)&self->_clickPresentationInteractionManager, 0);
  objc_storeStrong((id *)&self->_containerViewProviders, 0);
  objc_storeStrong((id *)&self->_containerViewForExpandedContent, 0);
  objc_storeStrong((id *)&self->_expandedPlatterDismissalReason, 0);
  objc_storeStrong((id *)&self->_interactionManager, 0);
  objc_storeStrong((id *)&self->_lookViewWrapper, 0);
  objc_storeStrong((id *)&self->_tapBeginTime, 0);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_expandedPlatterViewController, 0);

  objc_storeStrong((id *)&self->_longLookNotificationViewController, 0);
}

- (void)shouldCommitToExpandedPlatterPresentationWithFeedback
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a1;
  id v4 = [a2 notificationRequest];
  uint64_t v5 = [v4 notificationIdentifier];
  double v6 = objc_msgSend(v5, "un_logDigest");
  int v7 = 138543362;
  double v8 = v6;
  _os_log_error_impl(&dword_1D7C04000, v3, OS_LOG_TYPE_ERROR, "Notification view controller for request %{public}@ doesn't have a container view for expanded content – aborting presentation", (uint8_t *)&v7, 0xCu);
}

void __83__NCNotificationShortLookViewController__requestAppProtectionUnlockWithCompletion___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  double v6 = objc_msgSend(v4, "un_logDigest");
  int v13 = [a3 localizedDescription];
  OUTLINED_FUNCTION_1_3(&dword_1D7C04000, v7, v8, "AppProtection authentication failed for %@ with error %@", v9, v10, v11, v12, 2u);
}

- (void)containerViewForExpandedContent
{
  id v4 = a2;
  id v5 = [a3 notificationRequest];
  double v6 = [v5 notificationIdentifier];
  int v13 = objc_msgSend(v6, "un_logDigest");
  OUTLINED_FUNCTION_1_3(&dword_1D7C04000, v7, v8, "Delegate (%{public}@) for notification view controller for request %{public}@ failed to provide a container view provider", v9, v10, v11, v12, 2u);
}

- (void)_handleTapOnView:(void *)a3 .cold.1(void *a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  double v6 = [a2 notificationRequest];
  uint64_t v7 = [v6 notificationIdentifier];
  uint64_t v8 = objc_msgSend(v7, "un_logDigest");
  uint64_t v9 = [a3 state];
  uint64_t v10 = a2[148];
  int v11 = 138543874;
  uint64_t v12 = v8;
  __int16 v13 = 2048;
  uint64_t v14 = v9;
  __int16 v15 = 2112;
  uint64_t v16 = v10;
  _os_log_error_impl(&dword_1D7C04000, v5, OS_LOG_TYPE_ERROR, "Notification cell tap gesture failed for request %{public}@ [tapGestureState : %ld tapBeginTime : %@]", (uint8_t *)&v11, 0x20u);
}

- (void)pointerInteraction:(__CFString *)a3 styleForRegion:.cold.1(void *a1, void *a2, __CFString *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  double v6 = [a2 notificationRequest];
  uint64_t v7 = [v6 sectionIdentifier];
  uint64_t v8 = (void *)v7;
  uint64_t v9 = @"<nil>";
  if (a3) {
    uint64_t v9 = a3;
  }
  int v10 = 138543618;
  uint64_t v11 = v7;
  __int16 v12 = 2114;
  __int16 v13 = v9;
  _os_log_error_impl(&dword_1D7C04000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] Short look view is not a member of a window. Cannot provide a pointer interaction. Short look view: %{public}@", (uint8_t *)&v10, 0x16u);
}

@end