@interface PKNavigationDashboardPassViewController
- (BOOL)canRequestPaymentForPass:(id)a3;
- (BOOL)dashboardViewController:(id)a3 dismissInteractionShouldDismissForContentOffset:(CGPoint)a4 velocity:(CGPoint)a5;
- (BOOL)dashboardViewController:(id)a3 shouldStartDismissInteractionFromPoint:(CGPoint)a4;
- (BOOL)footerSuppressed;
- (BOOL)groupViewShouldAllowPanning:(id)a3;
- (BOOL)handleDeletePassRequestWithPass:(id)a3 forViewController:(id)a4;
- (BOOL)hasScrollingContent;
- (BOOL)isFrontmostPassAuthorized;
- (BOOL)isInvalidated;
- (BOOL)isPassFooterViewInGroup:(id)a3;
- (BOOL)presentAddMoney;
- (PKDashboardPassViewController)dashboardVC;
- (PKDashboardPassViewControllerDelegate)passDashboardDelegate;
- (PKNavigationDashboardPassViewController)init;
- (PKNavigationDashboardPassViewController)initWithPassGroupView:(id)a3 groupsController:(id)a4 groupViewReceiver:(id)a5 context:(id)a6;
- (PKPassGroupView)passGroupView;
- (PKPassGroupViewReceiver)receiver;
- (double)_alphaForPassthroughView;
- (id)_barcodePassDetailsViewControllerForBarcodePass:(id)a3;
- (id)_cardIndexPath;
- (id)_createPassFooterConfigurationForPassView:(id)a3;
- (id)_paymentPassDetailsViewControllerForPaymentPass:(id)a3;
- (id)_paymentSetupNavigationControllerForProvisioningController:(id)a3;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)interactionControllerForPresentation:(id)a3;
- (id)interstitialProvider;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (id)presentationSceneIdentifierForAccountAutomaticPaymentsController:(id)a3;
- (int64_t)_passFooterAlphaForPass:(id)a3 postTransaction:(BOOL)a4;
- (int64_t)groupViewContentModeForFrontmostPassWhenPiled:(id)a3 withDefaultContentMode:(int64_t)a4;
- (int64_t)groupViewContentModeForFrontmostPassWhenStacked:(id)a3;
- (int64_t)modalPresentationStyle;
- (unint64_t)groupViewPassesSuppressedContent:(id)a3;
- (unint64_t)suppressedContentForPassFooter:(id)a3;
- (void)_canPresentCreditDetailsViewControllerWithCompletion:(id)a3;
- (void)_cancelPostTransactionTimer;
- (void)_dismissIfPossibleWithVelocity:(double)a3 byDragging:(BOOL)a4;
- (void)_endReportingSessionForPassIfNecessary;
- (void)_ensureCardPresence;
- (void)_handleProvisioningError:(id)a3;
- (void)_openPaymentSetupWithNetworkWhitelist:(id)a3 paymentSetupMode:(int64_t)a4;
- (void)_presentDailyCashOnAccountForDateComponents:(id)a3 redemptionType:(unint64_t)a4 completion:(id)a5;
- (void)_presentDailyCashOnPassForDateComponents:(id)a3 completion:(id)a4;
- (void)_presentInstallmentPlans:(id)a3;
- (void)_presentRewardsHubWithCompletion:(id)a3;
- (void)_pushViewControllerWhenNavigationAvailable:(id)a3 animated:(BOOL)a4 handler:(id)a5;
- (void)_registerForTextTraitChanges;
- (void)_setLeftBarButtonItem;
- (void)_setUpDashboardVC;
- (void)_startPostTransactionTimerIfNeccessary;
- (void)_startReportingSessionForPassIfNecessary;
- (void)_updateDashboardAndFooterContentPostTransaction:(BOOL)a3;
- (void)_updatePassFooterView;
- (void)_updatePassFooterViewIfNecessaryPostTransaction:(BOOL)a3;
- (void)_updatePassFooterViewWithReload:(BOOL)a3 postTransaction:(BOOL)a4;
- (void)_updatePausedState;
- (void)_updateTitlePassView;
- (void)_updateTopViewController:(id)a3;
- (void)accountAutomaticPaymentsController:(id)a3 didSchedulePayment:(id)a4;
- (void)acquireGroupView:(id)a3;
- (void)contentDidScroll;
- (void)dashboardContentForPassLoaded:(id)a3;
- (void)dashboardPassViewController:(id)a3 didRequestPaymentForPass:(id)a4 fromButton:(BOOL)a5;
- (void)dashboardViewController:(id)a3 didEndDismissInteraction:(BOOL)a4;
- (void)dashboardViewController:(id)a3 dismissInteractionDismissedForContentOffset:(CGPoint)a4 velocity:(CGPoint)a5;
- (void)dashboardViewController:(id)a3 willStartDismissInteractionFromPoint:(CGPoint)a4;
- (void)dealloc;
- (void)deleteAnimationController:(id)a3 didComplete:(BOOL)a4;
- (void)deleteAnimationControllerWillBeginDeleteAnimation:(id)a3;
- (void)dismissDiscoveryArticleViewController:(id)a3 afterActionCompleted:(BOOL)a4 withRelevantPassUniqueIdenitifer:(id)a5;
- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4;
- (void)eventViewController:(id)a3 didCompleteWithAction:(int64_t)a4;
- (void)foregroundActiveArbiter:(id)a3 didUpdateDeactivationReasons:(unsigned int)a4;
- (void)foregroundActiveArbiter:(id)a3 didUpdateForegroundActiveState:(id)a4;
- (void)groupView:(id)a3 deleteButtonPressedForPass:(id)a4;
- (void)groupView:(id)a3 didUpdatePassView:(id)a4;
- (void)groupView:(id)a3 faceViewFrameDidChangeForFrontmostPassView:(id)a4;
- (void)groupView:(id)a3 frontmostPassViewDidChange:(id)a4 withContext:(id)a5;
- (void)groupViewTapped:(id)a3;
- (void)insertGroupView;
- (void)interstitialControllerAvailable:(id)a3;
- (void)invalidate;
- (void)loadView;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)noteTransitionCompleted;
- (void)noteWillDismiss;
- (void)passFooterViewDidEndAuthorization:(id)a3;
- (void)passFooterViewDidSucceedAtAuthorization:(id)a3;
- (void)passFooterViewDidTransact:(id)a3 success:(BOOL)a4;
- (void)paymentSetupDidFinish:(id)a3;
- (void)peerPaymentActionViewControllerDidCancel:(id)a3;
- (void)peerPaymentActionViewControllerDidPerformAction:(id)a3;
- (void)performPrecursorPassAction;
- (void)presentAccountPromotionWithProgramIdentifier:(id)a3 completion:(id)a4;
- (void)presentAccountWithConfiguration:(id)a3 presentationContext:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)presentActionGroupsWithPaymentDataProvider:(id)a3 balanceModel:(id)a4 webService:(id)a5;
- (void)presentActionsWithPaymentDataProvider:(id)a3 webService:(id)a4 actionType:(unint64_t)a5 transitBalanceModel:(id)a6;
- (void)presentAddMoneyAppleBalance;
- (void)presentAddMoneyAppleBalanceDirectTopUp;
- (void)presentAddMoneyAppleBalanceInStoreTopUp;
- (void)presentAuxiliaryPassInformationItemWithIdentifier:(id)a3 informationIdentifier:(id)a4 completion:(id)a5;
- (void)presentBalanceDetailsWithCompletion:(id)a3;
- (void)presentCardNumbers;
- (void)presentCombinedActionsWithPaymentDataProvider:(id)a3 webService:(id)a4 balanceModel:(id)a5 mode:(unint64_t)a6;
- (void)presentDailyCashForDateComponents:(id)a3 redemptionType:(unint64_t)a4 completion:(id)a5;
- (void)presentEditCalendarEvent:(id)a3 eventStore:(id)a4;
- (void)presentExistingCalendarEvent:(id)a3 eventStore:(id)a4;
- (void)presentInstallmentPlan:(id)a3;
- (void)presentInstallmentPlans;
- (void)presentInvitationWithIdentifier:(id)a3 completion:(id)a4;
- (void)presentManageBarcodePassNotifications;
- (void)presentManagePaymentPassNotificationsControllerWithDataProvider:(id)a3 peerPaymentAccount:(id)a4 bankConnectAccount:(id)a5 account:(id)a6;
- (void)presentPassDetailsAnimated:(BOOL)a3 action:(unint64_t)a4;
- (void)presentPassDetailsAnimated:(BOOL)a3 handler:(id)a4;
- (void)presentPayLaterFinancingPlan:(id)a3;
- (void)presentPeerPaymentActionViewControllerForAction:(unint64_t)a3 pass:(id)a4 passLibraryDataProvider:(id)a5;
- (void)presentPeerPaymentDeviceTapWithInitialAmount:(id)a3 initialMemo:(id)a4;
- (void)presentPeerPaymentRecurringPaymentsWithIdentifier:(id)a3 completion:(id)a4;
- (void)presentRedeemGiftcard;
- (void)presentRestrictedGuestAccessScheduleWithHomeIdentifier:(id)a3;
- (void)presentRewardsHubMerchantsWithPrivateIdentifier:(id)a3 completion:(id)a4;
- (void)presentRewardsHubWithCompletion:(id)a3;
- (void)presentScheduledPayments;
- (void)presentSearch;
- (void)presentSearchWithCompletion:(id)a3;
- (void)presentSearchWithQuery:(id)a3 completion:(id)a4;
- (void)presentShareFlow;
- (void)presentSharesList;
- (void)presentSpendingSummaryWithType:(unint64_t)a3 categorization:(unint64_t)a4 unit:(unint64_t)a5 completion:(id)a6;
- (void)presentTransaction:(id)a3 forAccount:(id)a4;
- (void)presentTransaction:(id)a3 forPaymentPass:(id)a4;
- (void)presentTransitCardNumber;
- (void)relinquishGroupView;
- (void)reportEventForPassIfNecessary:(id)a3;
- (void)scrollToTop;
- (void)secureElementDidEnterRestrictedMode:(id)a3;
- (void)secureElementDidLeaveRestrictedMode:(id)a3;
- (void)setFooterSuppressed:(BOOL)a3;
- (void)setPassDashboardDelegate:(id)a3;
- (void)setReceiver:(id)a3;
- (void)setTransitionDuration:(double)a3;
- (void)shouldPromptForReviewOnDismissalWithTrigger:(unint64_t)a3;
- (void)showStatement:(id)a3 completion:(id)a4;
- (void)summaryTypeDidChange;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PKNavigationDashboardPassViewController

- (PKNavigationDashboardPassViewController)init
{
  return 0;
}

- (PKNavigationDashboardPassViewController)initWithPassGroupView:(id)a3 groupsController:(id)a4 groupViewReceiver:(id)a5 context:(id)a6
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11)
  {
    v26.receiver = self;
    v26.super_class = (Class)PKNavigationDashboardPassViewController;
    v15 = [(PKNavigationController *)&v26 init];
    v16 = v15;
    if (v15)
    {
      objc_storeStrong((id *)&v15->_passGroupView, a3);
      uint64_t v17 = [(PKPassGroupView *)v16->_passGroupView group];
      group = v16->_group;
      v16->_group = (PKGroup *)v17;

      v19 = (PKSecureElement *)objc_alloc_init(MEMORY[0x1E4F84FC0]);
      secureElement = v16->_secureElement;
      v16->_secureElement = v19;

      [(PKSecureElement *)v16->_secureElement registerObserver:v16];
      objc_storeStrong((id *)&v16->_groupsController, a4);
      v21 = +[PKUIForegroundActiveArbiter sharedInstance];
      v16->_activeState = ($77BFE790A1370D46B4241309C9753022)[v21 registerObserver:v16];

      v22 = +[PKUIForegroundActiveArbiter sharedInstance];
      v16->_deactivationReasons = [v22 registerDeactivationObserver:v16];

      objc_storeStrong((id *)&v16->_context, a6);
      v16->_passGroupViewVisible = 1;
      objc_storeWeak((id *)&v16->_receiver, v13);
      [(PKNavigationDashboardPassViewController *)v16 _setUpDashboardVC];
      v27[0] = v16->_dashboardVC;
      v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
      [(PKNavigationDashboardPassViewController *)v16 setViewControllers:v23];

      [(PKNavigationDashboardPassViewController *)v16 setTransitioningDelegate:v16];
      [(PKNavigationDashboardPassViewController *)v16 _registerForTextTraitChanges];
    }
    self = v16;
    v24 = self;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (void)_setUpDashboardVC
{
  v3 = [[PKDashboardPassViewController alloc] initWithPassGroupView:self->_passGroupView context:self->_context presentingViewController:self];
  dashboardVC = self->_dashboardVC;
  self->_dashboardVC = v3;

  v5 = self->_dashboardVC;
  v6 = [(PKPassGroupView *)self->_passGroupView frontmostPassView];
  v7 = [v6 pass];
  [(PKDashboardPassViewController *)v5 setFrontmostPass:v7];

  [(PKDashboardViewController *)self->_dashboardVC setUseChromelessNavigationItem:1];
  [(PKDashboardViewController *)self->_dashboardVC setDelegate:self];
  id v12 = [(PKDashboardPassViewController *)self->_dashboardVC navigationItem];
  v8 = [PKAnimatedNavigationBarTitleView alloc];
  v9 = -[PKAnimatedNavigationBarTitleView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  titleView = self->_titleView;
  self->_titleView = v9;

  [v12 setTitleView:self->_titleView];
  +[PKDashboardPassFlowLayout topMarginInFirstSection];
  self->_topMargin = v11;
  [(PKNavigationDashboardPassViewController *)self _setLeftBarButtonItem];
}

- (void)dealloc
{
  [(PKSecureElement *)self->_secureElement unregisterObserver:self];
  if (!self->_invalidated) {
    [(PKNavigationDashboardPassViewController *)self invalidate];
  }
  v3.receiver = self;
  v3.super_class = (Class)PKNavigationDashboardPassViewController;
  [(PKNavigationController *)&v3 dealloc];
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    objc_super v3 = +[PKUIForegroundActiveArbiter sharedInstance];
    [v3 unregisterObserver:self];

    v4 = +[PKUIForegroundActiveArbiter sharedInstance];
    [v4 unregisterDeactivationObserver:self];

    [(PKPassFooterView *)self->_passFooterView invalidate];
    dashboardVC = self->_dashboardVC;
    [(PKDashboardPassViewController *)dashboardVC invalidate];
  }
}

- (void)loadView
{
  v12.receiver = self;
  v12.super_class = (Class)PKNavigationDashboardPassViewController;
  [(PKNavigationDashboardPassViewController *)&v12 loadView];
  objc_super v3 = [PKPassthroughView alloc];
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v8 = -[PKPassthroughView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], v5, v6, v7);
  passthroughView = self->_passthroughView;
  self->_passthroughView = v8;

  v10 = -[PKPassthroughView initWithFrame:]([PKPassthroughView alloc], "initWithFrame:", v4, v5, v6, v7);
  portalledPassthroughView = self->_portalledPassthroughView;
  self->_portalledPassthroughView = v10;

  if (self->_passFooterView) {
    -[PKPassthroughView addSubview:](self->_portalledPassthroughView, "addSubview:");
  }
  [(PKPassthroughView *)self->_passthroughView setPortal:self->_portalledPassthroughView];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)PKNavigationDashboardPassViewController;
  [(PKNavigationController *)&v5 viewDidLoad];
  objc_super v3 = [(PKDashboardPassViewController *)self->_dashboardVC view];
  double v4 = [(PKDashboardPassViewController *)self->_dashboardVC collectionView];
  [v3 addSubview:self->_passthroughView];
  [v3 insertSubview:self->_portalledPassthroughView belowSubview:v4];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKNavigationDashboardPassViewController;
  -[PKNavigationDashboardPassViewController viewWillAppear:](&v7, sel_viewWillAppear_);
  self->_visibilityState = 1;
  if (!v3 || !self->_isPresentedWithAnimationTransitioner)
  {
    if ([(PKNavigationDashboardPassViewController *)self isBeingPresented])
    {
      objc_super v5 = [(PKNavigationDashboardPassViewController *)self transitionCoordinator];
      char v6 = [v5 isCancelled];

      if ((v6 & 1) == 0) {
        [(PKNavigationDashboardPassViewController *)self _ensureCardPresence];
      }
    }
  }
  [(PKNavigationDashboardPassViewController *)self _updatePausedState];
  [(PKNavigationDashboardPassViewController *)self _startReportingSessionForPassIfNecessary];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v10[1] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)PKNavigationDashboardPassViewController;
  -[PKNavigationDashboardPassViewController viewDidDisappear:](&v8, sel_viewDidDisappear_);
  self->_visibilityState = 0;
  if (!v3 || !self->_isDismissedWithAnimationTransitioner)
  {
    if ([(PKNavigationDashboardPassViewController *)self isBeingDismissed])
    {
      objc_super v5 = [(PKNavigationDashboardPassViewController *)self transitionCoordinator];
      char v6 = [v5 isCancelled];

      if ((v6 & 1) == 0) {
        [(PKNavigationDashboardPassViewController *)self relinquishGroupView];
      }
    }
  }
  [(PKNavigationDashboardPassViewController *)self _updatePausedState];
  uint64_t v9 = *MEMORY[0x1E4F86308];
  v10[0] = *MEMORY[0x1E4F864A8];
  objc_super v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [(PKNavigationDashboardPassViewController *)self reportEventForPassIfNecessary:v7];

  [(PKNavigationDashboardPassViewController *)self _endReportingSessionForPassIfNecessary];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKNavigationDashboardPassViewController;
  [(PKNavigationDashboardPassViewController *)&v4 viewDidAppear:a3];
  self->_visibilityState = 2;
  [(PKNavigationDashboardPassViewController *)self _updatePausedState];
  [(PKNavigationDashboardPassViewController *)self _startReportingSessionForPassIfNecessary];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PKNavigationDashboardPassViewController;
  [(PKNavigationDashboardPassViewController *)&v10 viewWillDisappear:a3];
  if (self->_shouldPromptForReviewOnDismissal)
  {
    objc_super v4 = [(PKNavigationDashboardPassViewController *)self topViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      char v6 = objc_alloc_init(PKStoreKitReviewPromptHelper);
      objc_super v7 = [(PKNavigationDashboardPassViewController *)self view];
      objc_super v8 = [v7 window];
      uint64_t v9 = [v8 windowScene];
      [(PKStoreKitReviewPromptHelper *)v6 requestReviewInSceneIfEligible:v9 trigger:self->_reviewTrigger];
    }
  }
  self->_visibilityState = 3;
  [(PKNavigationDashboardPassViewController *)self _updatePausedState];
}

- (void)viewWillLayoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)PKNavigationDashboardPassViewController;
  [(PKNavigationController *)&v12 viewWillLayoutSubviews];
  BOOL v3 = [(PKDashboardPassViewController *)self->_dashboardVC view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[PKPassthroughView setFrame:](self->_passthroughView, "setFrame:", v5, v7, v9, v11);
  -[PKPassthroughView setFrame:](self->_portalledPassthroughView, "setFrame:", v5, v7, v9, v11);
}

- (void)viewDidLayoutSubviews
{
  v24.receiver = self;
  v24.super_class = (Class)PKNavigationDashboardPassViewController;
  [(PKNavigationDashboardPassViewController *)&v24 viewDidLayoutSubviews];
  BOOL v3 = [(PKDashboardPassViewController *)self->_dashboardVC collectionView];
  [v3 safeAreaInsets];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  double v8 = [(PKPassGroupView *)self->_passGroupView frontmostPassView];
  double v9 = [(PKPassGroupView *)self->_passGroupView superview];
  [v8 frameOfVisibleFace];
  objc_msgSend(v9, "convertRect:fromView:", v8);
  unint64_t v11 = v10;
  unint64_t v13 = v12;

  v14.n128_u64[0] = v11;
  v15.n128_u64[0] = v13;
  PKSizeRoundToPixel(v14, v15, v16);
  double v18 = v17;
  memset(&slice, 0, sizeof(slice));
  [(PKPassthroughView *)self->_portalledPassthroughView bounds];
  CGRect v22 = v25;
  CGRectDivide(v25, &slice, &v22, v5, CGRectMinYEdge);
  CGRectDivide(v22, &slice, &v22, v18 + self->_topMargin, CGRectMinYEdge);
  CGRectDivide(v22, &v22, &slice, v7, CGRectMaxYEdge);
  v19 = [(PKPassFooterView *)self->_passFooterView configuration];
  v20 = [v19 pass];

  if (v20) {
    [v20 style];
  }
  PKPassFrontFaceContentSize();
  passFooterView = self->_passFooterView;
  PKSizeAlignedInRect();
  -[PKPassFooterView setFrame:](passFooterView, "setFrame:");
}

- (void)_pushViewControllerWhenNavigationAvailable:(id)a3 animated:(BOOL)a4 handler:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  unint64_t v10 = [(PKNavigationDashboardPassViewController *)self presentedViewController];

  if (v10)
  {
    unint64_t v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v8;
      _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController _pushViewControllerWhenNavigationAvailable called with existing presentedViewController. Ignoring %@.", buf, 0xCu);
    }
LABEL_4:

    goto LABEL_15;
  }
  if (self->_isPendingVCPresentation)
  {
    unint64_t v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v8;
      _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController _pushViewControllerWhenNavigationAvailable called with queued push still pending. Ignoring %@.", buf, 0xCu);
    }
    goto LABEL_4;
  }
  self->_isPendingVCPresentation = 1;
  objc_initWeak((id *)buf, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __103__PKNavigationDashboardPassViewController__pushViewControllerWhenNavigationAvailable_animated_handler___block_invoke;
  aBlock[3] = &unk_1E59D0FE0;
  objc_copyWeak(&v19, (id *)buf);
  id v17 = v8;
  BOOL v20 = a4;
  id v18 = v9;
  unint64_t v12 = (void (**)(void))_Block_copy(aBlock);
  unint64_t v13 = [(PKNavigationDashboardPassViewController *)self transitionCoordinator];
  if (v13
    && (([(PKNavigationDashboardPassViewController *)self isBeingPresented] & 1) != 0
     || [(PKNavigationDashboardPassViewController *)self isBeingDismissed]))
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __103__PKNavigationDashboardPassViewController__pushViewControllerWhenNavigationAvailable_animated_handler___block_invoke_2;
    v14[3] = &unk_1E59D04E8;
    __n128 v15 = v12;
    [v13 animateAlongsideTransition:0 completion:v14];
  }
  else
  {
    v12[2](v12);
  }

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
LABEL_15:
}

void __103__PKNavigationDashboardPassViewController__pushViewControllerWhenNavigationAvailable_animated_handler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained pushViewController:*(void *)(a1 + 32) animated:*(unsigned __int8 *)(a1 + 56)];
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3) {
      (*(void (**)(void))(v3 + 16))();
    }
    id WeakRetained = v4;
    *((unsigned char *)v4 + 1664) = 0;
  }
}

uint64_t __103__PKNavigationDashboardPassViewController__pushViewControllerWhenNavigationAvailable_animated_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_registerForTextTraitChanges
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v5[0] = objc_opt_class();
  v5[1] = objc_opt_class();
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];
  id v4 = (id)[(PKNavigationDashboardPassViewController *)self registerForTraitChanges:v3 withHandler:&__block_literal_global_63];
}

uint64_t __71__PKNavigationDashboardPassViewController__registerForTextTraitChanges__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _setLeftBarButtonItem];
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v26.receiver = self;
  v26.super_class = (Class)PKNavigationDashboardPassViewController;
  [(PKNavigationController *)&v26 navigationController:v8 willShowViewController:v9 animated:v5];
  unint64_t v10 = [(PKNavigationDashboardPassViewController *)self transitionCoordinator];
  unint64_t v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [v9 transitionCoordinator];
  }
  unint64_t v13 = v12;

  uint64_t v14 = [v13 viewControllerForKey:*MEMORY[0x1E4FB30B8]];
  __n128 v15 = (void *)v14;
  if (v13 && v14)
  {
    [(PKNavigationDashboardPassViewController *)self _updateTopViewController:v9];
    objc_initWeak(&location, self);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __96__PKNavigationDashboardPassViewController_navigationController_willShowViewController_animated___block_invoke;
    v22[3] = &unk_1E59D1028;
    objc_copyWeak(&v24, &location);
    id v23 = v15;
    [v13 notifyWhenInteractionChangesUsingBlock:v22];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  else
  {
    __n128 v16 = [(PKNavigationDashboardPassViewController *)self interactivePopGestureRecognizer];
    unint64_t v17 = [v16 state];

    if (v17 <= 5 && ((1 << v17) & 0x31) != 0) {
      [(PKNavigationDashboardPassViewController *)self _updateTopViewController:v9];
    }
  }
  id v18 = [(PKPassGroupView *)self->_passGroupView frontmostPassView];
  id v19 = [v18 pass];

  BOOL v20 = [v19 secureElementPass];
  int v21 = [v20 isIdentityPass];

  if (v21)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(PKNavigationDashboardPassViewController *)self _endReportingSessionForPassIfNecessary];
        [(PKNavigationDashboardPassViewController *)self _startReportingSessionForPassIfNecessary];
      }
    }
  }
}

void __96__PKNavigationDashboardPassViewController_navigationController_willShowViewController_animated___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && [v4 isCancelled]) {
    [WeakRetained _updateTopViewController:*(void *)(a1 + 32)];
  }
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  v9.receiver = self;
  v9.super_class = (Class)PKNavigationDashboardPassViewController;
  id v8 = a4;
  [(PKNavigationController *)&v9 navigationController:a3 didShowViewController:v8 animated:v5];
  -[PKNavigationDashboardPassViewController _updateTopViewController:](self, "_updateTopViewController:", v8, v9.receiver, v9.super_class);
}

- (id)interstitialProvider
{
  return [(PKDashboardPassViewController *)self->_dashboardVC interstitialProvider];
}

- (void)_updateTopViewController:(id)a3
{
  self->_dashboardIsVisible = self->_dashboardVC == a3;
  [(PKNavigationDashboardPassViewController *)self _updatePausedState];
}

- (void)_updatePausedState
{
  BOOL v2 = !self->_visibilityState || !self->_dashboardIsVisible || !self->_passGroupViewVisible;
  if (self->_shouldPauseDynamicCard != v2)
  {
    self->_shouldPauseDynamicCard = v2;
    if (!self->_dismissed) {
      -[PKPassGroupView setPaused:](self->_passGroupView, "setPaused:");
    }
  }
}

- (void)_updateTitlePassView
{
  BOOL v3 = self->_passGroupViewVisible || self->_dismissed;
  id v4 = [(PKPassGroupView *)self->_passGroupView frontmostPassView];
  uint64_t v5 = [v4 pass];
  double v6 = (void *)v5;
  p_titlePass = (id *)&self->_titlePass;
  titlePass = self->_titlePass;
  if (v5) {
    BOOL v9 = titlePass == (PKPass *)v5;
  }
  else {
    BOOL v9 = 0;
  }
  if (!v9)
  {
    id *p_titlePass = 0;

    titlePassView = self->_titlePassView;
    self->_titlePassView = 0;
  }
  if (v6) {
    int v11 = v3;
  }
  else {
    int v11 = 1;
  }
  if (v11 == 1)
  {
    titleView = self->_titleView;
    unint64_t v13 = 0;
LABEL_16:
    [(PKAnimatedNavigationBarTitleView *)titleView setTitleView:v13 animated:1];
    goto LABEL_17;
  }
  unint64_t v13 = self->_titlePassView;
  if (v13)
  {
    titleView = self->_titleView;
    goto LABEL_16;
  }
  objc_storeStrong(p_titlePass, v6);
  if ([v6 passType] == 1) {
    uint64_t v14 = v6;
  }
  else {
    uint64_t v14 = 0;
  }
  id v15 = v14;
  __n128 v16 = [v15 associatedAccountServiceAccountIdentifier];
  if (v16 && [v15 associatedAccountFeatureIdentifier] != 3)
  {
  }
  else
  {
    unint64_t v17 = [v15 dynamicLayerConfiguration];

    if (!v17) {
      goto LABEL_27;
    }
  }
  if ((PKIsLowEndDevice() & 1) == 0)
  {
    id v18 = [v4 rendererState];
    id v22 = [[PKPassView alloc] initWithPass:v6 content:4 suppressedContent:1527 rendererState:v18];
    [(PKPassView *)v22 setModallyPresented:1];
    [(PKPassView *)v22 setPaused:1];
    [(PKPassView *)v22 sizeOfFrontFace];
    CGFloat v24 = 52.0 / v23;
    CGRect v25 = [(PKPassView *)v22 layer];
    CATransform3DMakeScale(&v27, v24, v24, 1.0);
    [v25 setTransform:&v27];

    objc_super v26 = self->_titlePassView;
    self->_titlePassView = &v22->super;

    goto LABEL_29;
  }
LABEL_27:
  id v18 = [[PKPassView alloc] initWithPass:v6 content:4 suppressedContent:2039];
  id v19 = -[PKPassView snapshotOfFrontFaceWithRequestedSize:](v18, "snapshotOfFrontFaceWithRequestedSize:", 80.0, 80.0);
  BOOL v20 = (UIView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v19];
  int v21 = self->_titlePassView;
  self->_titlePassView = v20;

  [(UIView *)self->_titlePassView setContentMode:1];
  [(UIView *)self->_titlePassView setAccessibilityIgnoresInvertColors:1];

LABEL_29:
  if (!self->_passGroupViewVisible) {
    [(PKAnimatedNavigationBarTitleView *)self->_titleView setTitleView:self->_titlePassView animated:1];
  }

LABEL_17:
}

- (void)_setLeftBarButtonItem
{
  id v6 = [(PKDashboardPassViewController *)self->_dashboardVC navigationItem];
  BOOL v3 = [v6 leftBarButtonItem];
  id v4 = [v3 customView];

  if (v4)
  {
    [v4 sizeToFit];
  }
  else
  {
    id v4 = [(PKDashboardPassViewController *)self->_dashboardVC doneButton];
  }
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v4];
  [v6 setLeftBarButtonItem:v5];
}

- (void)acquireGroupView:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = (PKPassGroupView *)a3;
  if (self->_passGroupView == v4 && !self->_passGroupViewAcquired)
  {
    uint64_t v5 = [(PKNavigationDashboardPassViewController *)self viewIfLoaded];
    id v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134349312;
      id v12 = self;
      __int16 v13 = 2050;
      uint64_t v14 = (const char *)v4;
      _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): Acquiring group view (%{public}p)", (uint8_t *)&v11, 0x16u);
    }

    self->_passGroupViewAcquired = 1;
    CGFloat v7 = [(PKPassGroupView *)self->_passGroupView delegate];
    objc_storeWeak((id *)&self->_formerGroupViewDelegate, v7);

    [(PKPassGroupView *)self->_passGroupView setDelegate:self];
    [(PKPassGroupView *)self->_passGroupView addPassGroupViewObserver:self];
    id v8 = [(PKPassGroupView *)self->_passGroupView frontmostPassView];
    BOOL v9 = [v8 pass];

    if (!v9)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 134349314;
        id v12 = self;
        __int16 v13 = 2080;
        uint64_t v14 = "-[PKNavigationDashboardPassViewController acquireGroupView:]";
        _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Frontmost pass is nil", (uint8_t *)&v11, 0x16u);
      }
    }
    [(PKDashboardPassViewController *)self->_dashboardVC setFrontmostPass:v9];
    [v5 setNeedsLayout];
    [(PKNavigationDashboardPassViewController *)self _updatePassFooterViewIfNecessaryPostTransaction:0];
    unint64_t v10 = [(PKNavigationDashboardPassViewController *)self viewIfLoaded];
    [v10 setNeedsLayout];
  }
}

- (void)relinquishGroupView
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self->_passGroupView)
  {
    BOOL v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134349056;
      unint64_t v10 = self;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): Relinquishing group view", (uint8_t *)&v9, 0xCu);
    }

    self->_passGroupViewAcquired = 0;
    id v4 = self->_passGroupView;
    passGroupView = self->_passGroupView;
    self->_passGroupView = 0;

    [(PKDashboardPassViewController *)self->_dashboardVC setFrontmostPass:0];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_formerGroupViewDelegate);
    if (WeakRetained) {
      [(PKPassGroupView *)v4 setDelegate:WeakRetained];
    }
    objc_storeWeak((id *)&self->_formerGroupViewDelegate, 0);
    [(PKPassGroupView *)v4 removePassGroupViewObserver:self];
    id v7 = objc_loadWeakRetained((id *)&self->_receiver);
    id v8 = v7;
    if (v7) {
      [v7 groupViewIsAvailable:v4];
    }
    [(PKNavigationDashboardPassViewController *)self _updatePassFooterViewIfNecessaryPostTransaction:0];
  }
}

- (void)_ensureCardPresence
{
  if (self->_activeState.foregroundActive)
  {
    if (PKViewVisibilityStateIsVisible())
    {
      BOOL v3 = [(PKDashboardPassViewController *)self->_dashboardVC collectionView];
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __62__PKNavigationDashboardPassViewController__ensureCardPresence__block_invoke_2;
      v4[3] = &unk_1E59CB6D8;
      v4[4] = self;
      [v3 performBatchUpdates:&__block_literal_global_286 completion:v4];
    }
  }
}

void __62__PKNavigationDashboardPassViewController__ensureCardPresence__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) insertGroupView];
  BOOL v2 = *(void **)(*(void *)(a1 + 32) + 1768);
  id v5 = [v2 frontmostPass];
  BOOL v3 = [v5 nfcPayload];
  uint64_t v4 = [v3 requiresAuthentication] ^ 1;

  [v2 shouldPresentAllContent:v4 animated:1];
}

- (void)scrollToTop
{
  dashboardVC = self->_dashboardVC;
  uint64_t v4 = [(PKNavigationDashboardPassViewController *)self _cardIndexPath];
  [(PKDashboardViewController *)dashboardVC setActionForVisibilityChange:0 indexPath:v4];

  id v6 = [(PKDashboardPassViewController *)self->_dashboardVC collectionView];
  [v6 adjustedContentInset];
  objc_msgSend(v6, "setContentOffset:animated:", 1, 0.0, -v5);
}

- (id)_cardIndexPath
{
  return (id)[MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
}

- (void)_dismissIfPossibleWithVelocity:(double)a3 byDragging:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(PKNavigationDashboardPassViewController *)self presentingViewController];
  if (v7)
  {
    id v16 = v7;
    id v8 = [(PKNavigationDashboardPassViewController *)self transitionCoordinator];
    int v9 = v8;
    if (v8) {
      int v10 = [v8 isCancelled] ^ 1;
    }
    else {
      int v10 = 1;
    }
    int v11 = [(PKNavigationDashboardPassViewController *)self isBeingPresented];
    char v12 = [(PKNavigationDashboardPassViewController *)self isBeingDismissed];
    if (v10)
    {
      if (v12) {
        goto LABEL_21;
      }
    }
    else if (v11)
    {
LABEL_21:

      id v7 = v16;
      goto LABEL_22;
    }
    self->_dismissedByDragging = v4;
    if (a3 > 0.0 && v4)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_receiver);
      if (objc_opt_respondsToSelector()) {
        [WeakRetained groupViewNeedsAnimating:self->_passGroupView withVelocity:1 dragging:a3];
      }
    }
    if (v11)
    {
      id v14 = objc_loadWeakRetained((id *)&self->_transitioningHandler);
      uint64_t v15 = v14;
      if (v14)
      {
        [v14 setDragged:self->_dismissedByDragging];
        [v15 cancel];
      }
      else
      {
        [v16 dismissViewControllerAnimated:1 completion:0];
      }
    }
    else
    {
      [v16 dismissViewControllerAnimated:1 completion:0];
    }
    self->_dismissedByDragging = 0;
    goto LABEL_21;
  }
LABEL_22:
}

- (BOOL)isFrontmostPassAuthorized
{
  return [(PKPassFooterView *)self->_passFooterView isPassAuthorized];
}

- (void)groupViewTapped:(id)a3
{
}

- (BOOL)groupViewShouldAllowPanning:(id)a3
{
  return 0;
}

- (int64_t)groupViewContentModeForFrontmostPassWhenStacked:(id)a3
{
  return 5;
}

- (int64_t)groupViewContentModeForFrontmostPassWhenPiled:(id)a3 withDefaultContentMode:(int64_t)a4
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_formerGroupViewDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    a4 = [WeakRetained groupViewContentModeForFrontmostPassWhenPiled:v6 withDefaultContentMode:a4];
  }

  return a4;
}

- (unint64_t)groupViewPassesSuppressedContent:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_formerGroupViewDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    unint64_t v6 = [WeakRetained groupViewPassesSuppressedContent:v4];
  }
  else {
    unint64_t v6 = 0;
  }

  return v6;
}

- (void)groupView:(id)a3 didUpdatePassView:(id)a4
{
  id v8 = a4;
  id v5 = [(PKPassGroupView *)self->_passGroupView frontmostPassView];

  if (v5 == v8)
  {
    unint64_t v6 = [(PKNavigationDashboardPassViewController *)self viewIfLoaded];
    [v6 setNeedsLayout];

    [(PKNavigationDashboardPassViewController *)self _updatePassFooterViewIfNecessaryPostTransaction:0];
    id v7 = [v8 pass];
    [(PKDashboardPassViewController *)self->_dashboardVC setFrontmostPass:v7];
  }
}

- (void)_cancelPostTransactionTimer
{
  postTransactionTimer = self->_postTransactionTimer;
  if (postTransactionTimer)
  {
    dispatch_source_cancel(postTransactionTimer);
    id v4 = self->_postTransactionTimer;
    self->_postTransactionTimer = 0;
  }
}

- (void)_startPostTransactionTimerIfNeccessary
{
  if (!self->_postTransactionTimer)
  {
    BOOL v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
    postTransactionTimer = self->_postTransactionTimer;
    self->_postTransactionTimer = v3;

    id v5 = self->_postTransactionTimer;
    dispatch_time_t v6 = dispatch_time(0, 2500000000);
    dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    id v7 = self->_postTransactionTimer;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __81__PKNavigationDashboardPassViewController__startPostTransactionTimerIfNeccessary__block_invoke;
    handler[3] = &unk_1E59CA7D0;
    handler[4] = self;
    dispatch_source_set_event_handler(v7, handler);
    id v8 = self->_postTransactionTimer;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __81__PKNavigationDashboardPassViewController__startPostTransactionTimerIfNeccessary__block_invoke_2;
    v9[3] = &unk_1E59CA7D0;
    v9[4] = self;
    dispatch_source_set_cancel_handler(v8, v9);
    dispatch_resume((dispatch_object_t)self->_postTransactionTimer);
  }
}

uint64_t __81__PKNavigationDashboardPassViewController__startPostTransactionTimerIfNeccessary__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  BOOL v2 = *(void **)(v1 + 1720);
  if (v2)
  {
    uint64_t v3 = result;
    *(void *)(v1 + 1720) = 0;

    id v4 = *(void **)(v3 + 32);
    return [v4 _updateDashboardAndFooterContentPostTransaction:0];
  }
  return result;
}

void __81__PKNavigationDashboardPassViewController__startPostTransactionTimerIfNeccessary__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  BOOL v2 = *(void **)(v1 + 1720);
  *(void *)(v1 + 1720) = 0;
}

- (void)groupView:(id)a3 frontmostPassViewDidChange:(id)a4 withContext:(id)a5
{
  dispatch_time_t v6 = [(PKNavigationDashboardPassViewController *)self viewIfLoaded];
  [v6 setNeedsLayout];

  [(PKNavigationDashboardPassViewController *)self _updateDashboardAndFooterContentPostTransaction:0];
  id v7 = [(PKPassGroupView *)self->_passGroupView frontmostPassView];
  id v8 = [v7 pass];

  [(PKDashboardPassViewController *)self->_dashboardVC setFrontmostPass:v8];
}

- (void)groupView:(id)a3 faceViewFrameDidChangeForFrontmostPassView:(id)a4
{
  id v4 = [(PKNavigationDashboardPassViewController *)self viewIfLoaded];
  [v4 setNeedsLayout];
}

- (void)setFooterSuppressed:(BOOL)a3
{
  if (((!self->_footerSuppressed ^ a3) & 1) == 0)
  {
    self->_footerSuppressed = a3;
    if (a3)
    {
      id v4 = [MEMORY[0x1E4FB1438] sharedApplication];
      objc_msgSend(v4, "pkui_resetSharedRootAuthenticationContext");
    }
    [(PKNavigationDashboardPassViewController *)self _updatePassFooterViewIfNecessaryPostTransaction:0];
  }
}

- (id)_createPassFooterConfigurationForPassView:(id)a3
{
  if (!a3 || self->_invalidated) {
    return 0;
  }
  id v4 = a3;
  id v5 = [v4 pass];
  if (PKValueAddedServicesEnabledForPass())
  {
    if ([(PKSecureElement *)self->_secureElement isInRestrictedMode]) {
      uint64_t v6 = 3;
    }
    else {
      uint64_t v6 = 2;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v8 = [[PKPassFooterViewConfiguration alloc] initWithPassView:v4 state:v6];

  return v8;
}

- (void)_updatePassFooterViewIfNecessaryPostTransaction:(BOOL)a3
{
}

- (void)_updatePassFooterView
{
}

- (void)_updatePassFooterViewWithReload:(BOOL)a3 postTransaction:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (!a4) {
    [(PKNavigationDashboardPassViewController *)self _cancelPostTransactionTimer];
  }
  v32 = [(PKPassGroupView *)self->_passGroupView frontmostPassView];
  id v7 = [(PKNavigationDashboardPassViewController *)self _createPassFooterConfigurationForPassView:v32];
  id v8 = v7;
  double v9 = 0.0;
  if (self->_invalidated
    || ![v7 state]
    || self->_passDeletionInitiated
    || !self->_passGroupViewAcquired
    || self->_footerSuppressed)
  {
    int v10 = 0;
    BOOL v5 = 0;
    int v11 = v8;
    id v8 = 0;
  }
  else
  {
    int v11 = [v32 pass];
    double v9 = (double)[(PKNavigationDashboardPassViewController *)self _passFooterAlphaForPass:v11 postTransaction:v4];
    int v10 = 1;
  }

  int passFooterViewVisible = self->_passFooterViewVisible;
  [(PKPassFooterView *)self->_passFooterView alpha];
  double v14 = v13;
  uint64_t v15 = [(PKPassFooterView *)self->_passFooterView configuration];
  int v16 = PKEqualObjects();

  int v17 = v16 ^ 1;
  if ((v10 & v5 & 1) != 0 || passFooterViewVisible != v10 || (v17 & 1) != 0 || v14 != v9)
  {
    v31 = [(PKNavigationDashboardPassViewController *)self viewIfLoaded];
    self->_int passFooterViewVisible = v10;
    unsigned int passFooterViewVisibilityToken = self->_passFooterViewVisibilityToken;
    if (passFooterViewVisible == v10)
    {
      if (!v10) {
        goto LABEL_35;
      }
    }
    else
    {
      self->_unsigned int passFooterViewVisibilityToken = ++passFooterViewVisibilityToken;
      if ((v10 & 1) == 0)
      {
        [(PKPassFooterView *)self->_passFooterView willBecomeHiddenAnimated:1];
LABEL_35:
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __91__PKNavigationDashboardPassViewController__updatePassFooterViewWithReload_postTransaction___block_invoke;
        aBlock[3] = &__block_descriptor_38_e52_v20__0__PKNavigationDashboardPassViewController_8B16l;
        BOOL v39 = passFooterViewVisible != v10;
        unsigned int v38 = passFooterViewVisibilityToken;
        char v40 = v10;
        objc_super v26 = _Block_copy(aBlock);
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __91__PKNavigationDashboardPassViewController__updatePassFooterViewWithReload_postTransaction___block_invoke_2;
        v36[3] = &unk_1E59CB460;
        v36[4] = self;
        *(double *)&v36[5] = v9;
        CATransform3D v27 = _Block_copy(v36);
        v28 = v27;
        if (v31) {
          BOOL v29 = v14 != v9;
        }
        else {
          BOOL v29 = 0;
        }
        if (v29)
        {
          objc_initWeak((id *)buf, self);
          v30 = (void *)MEMORY[0x1E4FB1EB0];
          v33[0] = MEMORY[0x1E4F143A8];
          v33[1] = 3221225472;
          v33[2] = __91__PKNavigationDashboardPassViewController__updatePassFooterViewWithReload_postTransaction___block_invoke_3;
          v33[3] = &unk_1E59CB0D8;
          objc_copyWeak(&v35, (id *)buf);
          id v34 = v26;
          [v30 animateWithDuration:6 delay:v28 options:v33 animations:0.25 completion:0.0];

          objc_destroyWeak(&v35);
          objc_destroyWeak((id *)buf);
        }
        else
        {
          (*((void (**)(void *))v27 + 2))(v27);
          (*((void (**)(void *, PKNavigationDashboardPassViewController *, uint64_t))v26 + 2))(v26, self, 1);
        }

        goto LABEL_42;
      }
    }
    if (!self->_passFooterView)
    {
      id v19 = objc_alloc_init(PKPassFooterView);
      passFooterView = self->_passFooterView;
      self->_passFooterView = v19;

      [(PKPassFooterView *)self->_passFooterView setDelegate:self];
      if (v31)
      {
        [(PKPassFooterView *)self->_passFooterView setAlpha:0.0];
        [(PKPassthroughView *)self->_portalledPassthroughView insertSubview:self->_passFooterView atIndex:0];
      }
    }
    if ((v5 | v17) == 1)
    {
      int v21 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        id v22 = self->_passFooterView;
        *(_DWORD *)buf = 134349312;
        v42 = self;
        __int16 v43 = 2050;
        v44 = v22;
        _os_log_impl(&dword_19F450000, v21, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): configuring PKPassFooterView %{public}p.", buf, 0x16u);
      }

      BOOL v24 = v14 > 0.0 && passFooterViewVisible != 0 || self->_passFooterViewOutstandingAnimations != 0;
      uint64_t v25 = 2;
      if (!v5) {
        uint64_t v25 = 0;
      }
      [(PKPassFooterView *)self->_passFooterView configureWithConfiguration:v8 context:0 options:v24 | v25];
    }
    [v31 setNeedsLayout];
    [v31 layoutIfNeeded];
    if (passFooterViewVisible != v10) {
      [(PKPassFooterView *)self->_passFooterView willBecomeVisibleAnimated:1];
    }
    goto LABEL_35;
  }
LABEL_42:
}

void __91__PKNavigationDashboardPassViewController__updatePassFooterViewWithReload_postTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *((_DWORD *)v3 + 409) - 1;
  *((_DWORD *)v3 + 409) = v4;
  if (*(unsigned char *)(a1 + 36))
  {
    if (*((_DWORD *)v3 + 410) == *(_DWORD *)(a1 + 32))
    {
      id v6 = v3;
      BOOL v5 = (void *)*((void *)v3 + 203);
      if (*(unsigned char *)(a1 + 37)) {
        [v5 didBecomeVisibleAnimated:1];
      }
      else {
        [v5 didBecomeHiddenAnimated:1];
      }
      id v3 = v6;
    }
    int v4 = *((_DWORD *)v3 + 409);
  }
  if (!v4 && !*((unsigned char *)v3 + 1633))
  {
    id v7 = v3;
    [*((id *)v3 + 203) configureWithConfiguration:0 context:0 options:0];
    id v3 = v7;
  }
}

uint64_t __91__PKNavigationDashboardPassViewController__updatePassFooterViewWithReload_postTransaction___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1624) setAlpha:*(double *)(a1 + 40)];
}

void __91__PKNavigationDashboardPassViewController__updatePassFooterViewWithReload_postTransaction___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id WeakRetained = v3;
  }
}

- (int64_t)_passFooterAlphaForPass:(id)a3 postTransaction:(BOOL)a4
{
  id v6 = a3;
  if ([v6 style] == 9)
  {
    id v7 = [(PKDashboardViewController *)self->_dashboardVC dataSource];
    id v8 = v7;
    if (a4 || ![v7 hasContent])
    {
      LODWORD(self) = 1;
    }
    else if (self->_passFooterDidAuthenticate)
    {
      LODWORD(self) = 0;
    }
    else
    {
      int v10 = [(PKDashboardPassViewController *)self->_dashboardVC frontmostPass];
      int v11 = [v10 nfcPayload];
      LODWORD(self) = [v11 requiresAuthentication];
    }
    goto LABEL_10;
  }
  if (![v6 passType])
  {
    id v8 = [v6 nfcPayload];
    LODWORD(self) = v8 != 0;
LABEL_10:
    self = (PKNavigationDashboardPassViewController *)self;

    goto LABEL_11;
  }
  self = 0;
LABEL_11:

  return (int64_t)self;
}

- (int64_t)modalPresentationStyle
{
  return 4;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  if (a3 == self)
  {
    id v7 = a4;
    id v8 = a3;
    BOOL v5 = [[PKPresentationControllerForOpaqueViewControllerDestination alloc] initWithPresentedViewController:v8 presentingViewController:v7];

    double v9 = [(PKPresentationControllerForOpaqueViewControllerDestination *)v5 traitOverrides];
    [v9 setUserInterfaceLevel:0];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  self->_isPresentedWithAnimationTransitioner = 1;
  id v6 = objc_alloc_init(PKNavigationDashboardAnimatedTransitioningHandler);
  [(PKNavigationDashboardAnimatedTransitioningHandler *)v6 setPresenting:1];
  [(PKNavigationDashboardAnimatedTransitioningHandler *)v6 setDuration:self->_presentationDuration];
  [(PKNavigationDashboardAnimatedTransitioningHandler *)v6 setInterstitialController:self->_interstitialController];
  objc_storeWeak((id *)&self->_transitioningHandler, v6);

  return v6;
}

- (id)interactionControllerForPresentation:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transitioningHandler);

  return WeakRetained;
}

- (id)animationControllerForDismissedController:(id)a3
{
  self->_isDismissedWithAnimationTransitioner = 1;
  int v4 = objc_alloc_init(PKNavigationDashboardAnimatedTransitioningHandler);
  [(PKNavigationDashboardAnimatedTransitioningHandler *)v4 setPresenting:0];
  [(PKNavigationDashboardAnimatedTransitioningHandler *)v4 setDuration:0.3];
  [(PKNavigationDashboardAnimatedTransitioningHandler *)v4 setInterstitialController:self->_interstitialController];
  [(PKNavigationDashboardAnimatedTransitioningHandler *)v4 setDragged:self->_dismissedByDragging];
  objc_storeWeak((id *)&self->_transitioningHandler, v4);

  return v4;
}

- (void)insertGroupView
{
  v20[1] = *MEMORY[0x1E4F143B8];
  if (self->_passGroupView && !self->_invalidated)
  {
    id v3 = [(PKDashboardPassViewController *)self->_dashboardVC collectionView];
    int v4 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
    BOOL v5 = [v3 cellForItemAtIndexPath:v4];
    if (!v5)
    {
      v20[0] = v4;
      id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
      [v3 reloadItemsAtIndexPaths:v6];

      BOOL v5 = [v3 cellForItemAtIndexPath:v4];
    }
    id v7 = [v5 contentView];
    uint64_t v8 = [(PKPassGroupView *)self->_passGroupView superview];
    double v9 = (void *)v8;
    if (v7) {
      BOOL v10 = v7 == (void *)v8;
    }
    else {
      BOOL v10 = 1;
    }
    if (!v10)
    {
      [v7 addSubview:self->_passGroupView];
      [(PKPassGroupView *)self->_passGroupView bounds];
      [(PKPassGroupView *)self->_passGroupView anchorPoint];
      double v12 = v11;
      double v14 = v13;
      [v7 bounds];
      PKSizeAlignedInRect();
      -[PKPassGroupView setCenter:](self->_passGroupView, "setCenter:", v15 + v12 * v16, v17 + v14 * v18);
      id v19 = [(PKPassGroupView *)self->_passGroupView layer];
      [v19 removeAllAnimations];

      [(PKPassGroupView *)self->_passGroupView updatePageControlFrameAnimated:0];
    }
  }
}

- (void)noteWillDismiss
{
  if (!self->_dismissed)
  {
    self->_dismissed = 1;
    [(PKNavigationDashboardPassViewController *)self _updateTitlePassView];
  }
}

- (void)noteTransitionCompleted
{
}

- (BOOL)hasScrollingContent
{
  BOOL v2 = [(PKDashboardPassViewController *)self->_dashboardVC collectionView];
  uint64_t v3 = [v2 numberOfSections];
  if (v3 >= 2)
  {
    uint64_t v5 = v3;
    uint64_t v6 = 2;
    do
    {
      uint64_t v7 = [v2 numberOfItemsInSection:v6 - 1];
      BOOL v4 = v7 > 0;
    }
    while (v7 <= 0 && v5 != v6++);
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)dashboardViewController:(id)a3 shouldStartDismissInteractionFromPoint:(CGPoint)a4
{
  passGroupView = self->_passGroupView;
  if (!passGroupView) {
    return 0;
  }
  double y = a4.y;
  double x = a4.x;
  uint64_t v7 = [a3 view];
  -[PKPassGroupView convertPoint:fromView:](passGroupView, "convertPoint:fromView:", v7, x, y);
  BOOL v8 = -[PKPassGroupView pointInside:withEvent:](passGroupView, "pointInside:withEvent:", 0);

  return v8;
}

- (void)dashboardViewController:(id)a3 willStartDismissInteractionFromPoint:(CGPoint)a4
{
  id v4 = [(PKDashboardPassViewController *)self->_dashboardVC passFlowLayout];
  [v4 passPanDidBegin];
}

- (BOOL)dashboardViewController:(id)a3 dismissInteractionShouldDismissForContentOffset:(CGPoint)a4 velocity:(CGPoint)a5
{
  double y = a5.y;
  double v6 = a4.y;
  uint64_t v7 = objc_msgSend(a3, "collectionView", a4.x, a4.y, a5.x);
  [v7 adjustedContentInset];
  double v9 = v8;

  return y <= 0.0 && v6 < -80.0 - v9;
}

- (void)dashboardViewController:(id)a3 didEndDismissInteraction:(BOOL)a4
{
  id v4 = [(PKDashboardPassViewController *)self->_dashboardVC passFlowLayout];
  [v4 passPanDidEnd];
}

- (void)dashboardViewController:(id)a3 dismissInteractionDismissedForContentOffset:(CGPoint)a4 velocity:(CGPoint)a5
{
}

- (void)contentDidScroll
{
  uint64_t v3 = [(PKNavigationDashboardPassViewController *)self view];
  [v3 setNeedsLayout];

  [(PKNavigationDashboardPassViewController *)self _alphaForPassthroughView];
  double v5 = v4;
  -[PKPassthroughView setAlpha:](self->_passthroughView, "setAlpha:");
  [(PKPassthroughView *)self->_portalledPassthroughView setAlpha:v5];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transitioningHandler);
  [WeakRetained presentedVCDidScroll];

  if ([(PKDashboardViewController *)self->_dashboardVC shouldPresentAllContent]
    && [(PKNavigationDashboardPassViewController *)self hasScrollingContent])
  {
    [(PKPassGroupView *)self->_passGroupView clearPageControlAlphaOverride];
  }
  else
  {
    [(PKPassGroupView *)self->_passGroupView overridePageControlAlpha:v5];
  }
  uint64_t v7 = [(PKNavigationDashboardPassViewController *)self navigationBar];
  [v7 frame];
  double v9 = v8;
  double v10 = *MEMORY[0x1E4F1DAD8];
  double v11 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v12 = v8 + v8;
  [(PKAnimatedNavigationBarTitleView *)self->_titleView bounds];
  v30.origin.double x = v13;
  v30.origin.double y = v14;
  v30.size.width = v15;
  v30.size.height = v16;
  v29.origin.double x = v10;
  v29.origin.double y = v11;
  v29.size.width = v12;
  v29.size.height = v9;
  if (!CGRectEqualToRect(v29, v30))
  {
    -[PKAnimatedNavigationBarTitleView setBounds:](self->_titleView, "setBounds:", v10, v11, v12, v9);
    [v7 setNeedsLayout];
  }

  id v27 = [(PKDashboardPassViewController *)self->_dashboardVC collectionView];
  double v17 = [(PKDashboardPassViewController *)self->_dashboardVC passFlowLayout];
  double v18 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
  id v19 = [v17 layoutAttributesForItemAtIndexPath:v18];

  [v27 bounds];
  double v21 = v20;
  [v19 frame];
  double v23 = v22;
  double v25 = v24;
  [v27 adjustedContentInset];
  self->_passGroupViewVisible = v23 + v25 - v21 >= v26;
  [(PKNavigationDashboardPassViewController *)self _updatePausedState];
  [(PKNavigationDashboardPassViewController *)self _updateTitlePassView];
}

- (void)dashboardPassViewController:(id)a3 didRequestPaymentForPass:(id)a4 fromButton:(BOOL)a5
{
  if (!self->_passDeletionInitiated)
  {
    BOOL v5 = a5;
    p_passDashboardDelegate = &self->_passDashboardDelegate;
    id v8 = a4;
    id v9 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_passDashboardDelegate);
    [WeakRetained dashboardPassViewController:v9 didRequestPaymentForPass:v8 fromButton:v5];
  }
}

- (BOOL)canRequestPaymentForPass:(id)a3
{
  return 1;
}

- (void)dashboardContentForPassLoaded:(id)a3
{
}

- (void)passFooterViewDidSucceedAtAuthorization:(id)a3
{
  self->_passFooterDidAuthenticate = 1;
  [(PKNavigationDashboardPassViewController *)self _updateDashboardAndFooterContentPostTransaction:0];
}

- (void)passFooterViewDidEndAuthorization:(id)a3
{
  self->_passFooterDidAuthenticate = 0;
}

- (void)passFooterViewDidTransact:(id)a3 success:(BOOL)a4
{
  BOOL v5 = [a3 configuration];
  double v6 = [v5 pass];
  uint64_t v7 = [v6 style];

  if (v7 == 9)
  {
    [(PKNavigationDashboardPassViewController *)self _updateDashboardAndFooterContentPostTransaction:1];
  }
}

- (void)_updateDashboardAndFooterContentPostTransaction:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(PKDashboardPassViewController *)self->_dashboardVC passFlowLayout];
  [v5 setFade:1];

  double v6 = [(PKDashboardPassViewController *)self->_dashboardVC frontmostPass];
  BOOL v7 = [(PKNavigationDashboardPassViewController *)self _passFooterAlphaForPass:v6 postTransaction:v3] == 0;

  [(PKDashboardViewController *)self->_dashboardVC shouldPresentAllContent:v7 animated:1];
  [(PKNavigationDashboardPassViewController *)self _updatePassFooterViewIfNecessaryPostTransaction:v3];
  id v8 = [(PKDashboardPassViewController *)self->_dashboardVC passFlowLayout];
  [v8 setFade:0];

  if (v3)
  {
    [(PKNavigationDashboardPassViewController *)self _startPostTransactionTimerIfNeccessary];
  }
}

- (BOOL)isPassFooterViewInGroup:(id)a3
{
  BOOL v3 = [(PKPassGroupView *)self->_passGroupView group];
  BOOL v4 = (unint64_t)[v3 passCount] > 1;

  return v4;
}

- (unint64_t)suppressedContentForPassFooter:(id)a3
{
  return 0;
}

- (void)secureElementDidEnterRestrictedMode:(id)a3
{
}

- (void)secureElementDidLeaveRestrictedMode:(id)a3
{
}

- (double)_alphaForPassthroughView
{
  BOOL v2 = [(PKDashboardPassViewController *)self->_dashboardVC collectionView];
  [v2 contentOffset];
  double v4 = v3;
  [v2 adjustedContentInset];
  double v6 = v4 + v5;
  double v7 = 1.0;
  if (v6 < 0.0)
  {
    double v7 = 0.0;
    if (v6 > -50.0) {
      double v7 = 1.0 - fmin(fmax(v6 / -50.0, 0.0), 1.0);
    }
  }

  return v7;
}

- (void)interstitialControllerAvailable:(id)a3
{
  id v5 = a3;
  p_interstitialController = &self->_interstitialController;
  interstitialController = self->_interstitialController;
  id v13 = v5;
  if (interstitialController)
  {
    BOOL v8 = [(PKPGSVTransitionInterstitialController *)interstitialController isInvalidated];
    id v5 = v13;
    if (v8)
    {
      id v9 = *p_interstitialController;
      *p_interstitialController = 0;

      id v5 = v13;
    }
  }
  char v10 = [v5 isInvalidated];
  double v11 = v13;
  if ((v10 & 1) == 0 && v13 && !*p_interstitialController)
  {
    objc_storeStrong((id *)&self->_interstitialController, a3);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_transitioningHandler);
    [WeakRetained setInterstitialController:*p_interstitialController];

    double v11 = v13;
  }
}

- (void)setTransitionDuration:(double)a3
{
  self->_presentationDuration = a3;
}

- (void)presentCombinedActionsWithPaymentDataProvider:(id)a3 webService:(id)a4 balanceModel:(id)a5 mode:(unint64_t)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [(PKPassGroupView *)self->_passGroupView frontmostPassView];
  CGFloat v14 = [v13 pass];

  if (!v14)
  {
    CGFloat v15 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349314;
      CGRect v29 = self;
      __int16 v30 = 2080;
      v31 = "-[PKNavigationDashboardPassViewController presentCombinedActionsWithPaymentDataProvider:webService:balanceModel:mode:]";
      _os_log_impl(&dword_19F450000, v15, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Frontmost pass is nil", buf, 0x16u);
    }
  }
  CGFloat v16 = [v14 paymentPass];
  if ([v16 isTransitPass])
  {
    double v17 = [v16 actionGroups];
    if (v17)
    {
      double v18 = [(PKDashboardViewController *)self->_dashboardVC dataSource];
      if (!v18)
      {
        id v19 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134349314;
          CGRect v29 = self;
          __int16 v30 = 2080;
          v31 = "-[PKNavigationDashboardPassViewController presentCombinedActionsWithPaymentDataProvider:webService:balanceModel:mode:]";
          _os_log_impl(&dword_19F450000, v19, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Data source is nil", buf, 0x16u);
        }
      }
      objc_initWeak((id *)buf, self);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __118__PKNavigationDashboardPassViewController_presentCombinedActionsWithPaymentDataProvider_webService_balanceModel_mode___block_invoke;
      v21[3] = &unk_1E59D1098;
      objc_copyWeak(v27, (id *)buf);
      v21[4] = self;
      id v22 = v16;
      id v20 = v17;
      id v23 = v20;
      id v24 = v10;
      id v25 = v11;
      id v26 = v12;
      v27[1] = (id)a6;
      [v18 executeAfterContentIsLoaded:v21];

      objc_destroyWeak(v27);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __118__PKNavigationDashboardPassViewController_presentCombinedActionsWithPaymentDataProvider_webService_balanceModel_mode___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained)
  {
    double v3 = [[PKPaymentPassCombinedActionDataController alloc] initWithPass:*(void *)(a1 + 40) actionGroups:*(void *)(a1 + 48) paymentDataProvider:*(void *)(a1 + 56) webService:*(void *)(a1 + 64) balanceModel:*(void *)(a1 + 72) mode:*(void *)(a1 + 88)];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 1704);
    *(void *)(v4 + 1704) = v3;

    double v6 = *(void **)(*(void *)(a1 + 32) + 1704);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __118__PKNavigationDashboardPassViewController_presentCombinedActionsWithPaymentDataProvider_webService_balanceModel_mode___block_invoke_2;
    v7[3] = &unk_1E59D1070;
    v7[4] = WeakRetained;
    [v6 fetchViewController:v7];
  }
}

void __118__PKNavigationDashboardPassViewController_presentCombinedActionsWithPaymentDataProvider_webService_balanceModel_mode___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (v5)
  {
    [*(id *)(a1 + 32) presentViewController:v5 animated:1 completion:0];
  }
  else if (v6)
  {
    [*(id *)(a1 + 32) pushViewController:v6 animated:1];
  }
}

- (void)presentActionGroupsWithPaymentDataProvider:(id)a3 balanceModel:(id)a4 webService:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(PKPassGroupView *)self->_passGroupView frontmostPassView];
  id v12 = [v11 pass];

  if (!v12)
  {
    id v13 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349314;
      id v26 = self;
      __int16 v27 = 2080;
      v28 = "-[PKNavigationDashboardPassViewController presentActionGroupsWithPaymentDataProvider:balanceModel:webService:]";
      _os_log_impl(&dword_19F450000, v13, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Frontmost pass is nil", buf, 0x16u);
    }
  }
  CGFloat v14 = [v12 paymentPass];
  CGFloat v15 = [v14 actionGroups];
  if ([v14 isTransitPass])
  {
    CGFloat v16 = [(PKDashboardViewController *)self->_dashboardVC dataSource];
    if (!v16)
    {
      double v17 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349314;
        id v26 = self;
        __int16 v27 = 2080;
        v28 = "-[PKNavigationDashboardPassViewController presentActionGroupsWithPaymentDataProvider:balanceModel:webService:]";
        _os_log_impl(&dword_19F450000, v17, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Data source is nil", buf, 0x16u);
      }
    }
    objc_initWeak((id *)buf, self);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __110__PKNavigationDashboardPassViewController_presentActionGroupsWithPaymentDataProvider_balanceModel_webService___block_invoke;
    v18[3] = &unk_1E59D10C0;
    objc_copyWeak(&v24, (id *)buf);
    v18[4] = self;
    id v19 = v14;
    id v20 = v15;
    id v21 = v8;
    id v22 = v10;
    id v23 = v9;
    [v16 executeAfterContentIsLoaded:v18];

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
  }
}

void __110__PKNavigationDashboardPassViewController_presentActionGroupsWithPaymentDataProvider_balanceModel_webService___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained)
  {
    double v3 = [[PKPaymentPassCombinedActionDataController alloc] initWithPass:*(void *)(a1 + 40) actionGroups:*(void *)(a1 + 48) paymentDataProvider:*(void *)(a1 + 56) webService:*(void *)(a1 + 64) balanceModel:*(void *)(a1 + 72) mode:0];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 1704);
    *(void *)(v4 + 1704) = v3;

    id v6 = *(void **)(*(void *)(a1 + 32) + 1704);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __110__PKNavigationDashboardPassViewController_presentActionGroupsWithPaymentDataProvider_balanceModel_webService___block_invoke_2;
    v7[3] = &unk_1E59D1070;
    v7[4] = WeakRetained;
    [v6 fetchViewController:v7];
  }
}

void __110__PKNavigationDashboardPassViewController_presentActionGroupsWithPaymentDataProvider_balanceModel_webService___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (v5)
  {
    [*(id *)(a1 + 32) presentViewController:v5 animated:1 completion:0];
  }
  else if (v6)
  {
    [*(id *)(a1 + 32) pushViewController:v6 animated:1];
  }
}

- (BOOL)presentAddMoney
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  double v3 = [(PKPassGroupView *)self->_passGroupView frontmostPassView];
  uint64_t v4 = [v3 pass];

  if (!v4)
  {
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 134349314;
      CGFloat v15 = self;
      __int16 v16 = 2080;
      double v17 = "-[PKNavigationDashboardPassViewController presentAddMoney]";
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Frontmost pass is nil", (uint8_t *)&v14, 0x16u);
    }
  }
  id v6 = [v4 paymentPass];
  if (([v6 isTransitPass] & 1) != 0 || objc_msgSend(v6, "isEMoneyPass"))
  {
    double v7 = (void *)[objc_alloc(MEMORY[0x1E4F850D0]) initWithPass:v6];
    id v8 = [MEMORY[0x1E4F850D8] passPropertiesForPass:v6];
    BOOL v9 = 1;
    [v7 setTransitProperties:v8 andApplyStoredValueBalances:1];
    id v10 = objc_alloc_init(MEMORY[0x1E4F84A88]);
    id v11 = [MEMORY[0x1E4F84D50] sharedService];
    [(PKNavigationDashboardPassViewController *)self presentActionsWithPaymentDataProvider:v10 webService:v11 actionType:1 transitBalanceModel:v7];
  }
  else if ([v6 isAppleBalancePass])
  {
    [(PKNavigationDashboardPassViewController *)self presentAddMoneyAppleBalance];
    BOOL v9 = 1;
  }
  else if ([v6 isPeerPaymentPass])
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F848A0]);
    [(PKNavigationDashboardPassViewController *)self presentPeerPaymentActionViewControllerForAction:1 pass:v6 passLibraryDataProvider:v13];

    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)presentActionsWithPaymentDataProvider:(id)a3 webService:(id)a4 actionType:(unint64_t)a5 transitBalanceModel:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [(PKPassGroupView *)self->_passGroupView frontmostPassView];
  int v14 = [v13 pass];

  if (!v14)
  {
    CGFloat v15 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349314;
      v28 = self;
      __int16 v29 = 2080;
      __int16 v30 = "-[PKNavigationDashboardPassViewController presentActionsWithPaymentDataProvider:webService:actionType:transitBalanceModel:]";
      _os_log_impl(&dword_19F450000, v15, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Frontmost pass is nil", buf, 0x16u);
    }
  }
  __int16 v16 = [v14 paymentPass];
  double v17 = [v16 availableActions];
  if ([v16 isStoredValuePass])
  {
    uint64_t v18 = [(PKDashboardViewController *)self->_dashboardVC dataSource];
    if (!v18)
    {
      id v19 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349314;
        v28 = self;
        __int16 v29 = 2080;
        __int16 v30 = "-[PKNavigationDashboardPassViewController presentActionsWithPaymentDataProvider:webService:actionType:tran"
              "sitBalanceModel:]";
        _os_log_impl(&dword_19F450000, v19, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Data source is nil", buf, 0x16u);
      }
    }
    objc_initWeak((id *)buf, self);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    void v20[2] = __123__PKNavigationDashboardPassViewController_presentActionsWithPaymentDataProvider_webService_actionType_transitBalanceModel___block_invoke;
    v20[3] = &unk_1E59D1098;
    objc_copyWeak(v26, (id *)buf);
    v20[4] = self;
    id v21 = v16;
    id v22 = v17;
    id v23 = v10;
    id v24 = v11;
    v26[1] = (id)a5;
    id v25 = v12;
    [v18 executeAfterContentIsLoaded:v20];

    objc_destroyWeak(v26);
    objc_destroyWeak((id *)buf);
  }
}

void __123__PKNavigationDashboardPassViewController_presentActionsWithPaymentDataProvider_webService_actionType_transitBalanceModel___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained)
  {
    double v3 = [[PKPaymentPassActionDataController alloc] initWithPass:*(void *)(a1 + 40) actions:*(void *)(a1 + 48) paymentDataProvider:*(void *)(a1 + 56) webService:*(void *)(a1 + 64) actionType:*(void *)(a1 + 88) balanceModel:*(void *)(a1 + 72)];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 1696);
    *(void *)(v4 + 1696) = v3;

    id v6 = *(void **)(*(void *)(a1 + 32) + 1696);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __123__PKNavigationDashboardPassViewController_presentActionsWithPaymentDataProvider_webService_actionType_transitBalanceModel___block_invoke_2;
    v7[3] = &unk_1E59D1070;
    v7[4] = WeakRetained;
    [v6 fetchViewController:v7];
  }
}

void __123__PKNavigationDashboardPassViewController_presentActionsWithPaymentDataProvider_webService_actionType_transitBalanceModel___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __123__PKNavigationDashboardPassViewController_presentActionsWithPaymentDataProvider_webService_actionType_transitBalanceModel___block_invoke_3;
  block[3] = &unk_1E59CA8E8;
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = v6;
  uint64_t v12 = v7;
  id v13 = v5;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __123__PKNavigationDashboardPassViewController_presentActionsWithPaymentDataProvider_webService_actionType_transitBalanceModel___block_invoke_3(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1) {
    return [*(id *)(result + 40) presentViewController:v1 animated:1 completion:0];
  }
  uint64_t v2 = *(void *)(result + 48);
  if (v2) {
    return [*(id *)(result + 40) pushViewController:v2 animated:1];
  }
  return result;
}

- (void)presentTransitCardNumber
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  double v3 = [(PKPassGroupView *)self->_passGroupView frontmostPassView];
  uint64_t v4 = [v3 pass];

  if (!v4)
  {
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349314;
      id v13 = self;
      __int16 v14 = 2080;
      CGFloat v15 = "-[PKNavigationDashboardPassViewController presentTransitCardNumber]";
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Frontmost pass is nil", buf, 0x16u);
    }
  }
  id v6 = [v4 paymentPass];
  if ([v6 isStoredValuePass])
  {
    uint64_t v7 = [(PKDashboardViewController *)self->_dashboardVC dataSource];
    if (!v7)
    {
      id v8 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349314;
        id v13 = self;
        __int16 v14 = 2080;
        CGFloat v15 = "-[PKNavigationDashboardPassViewController presentTransitCardNumber]";
        _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Data source is nil", buf, 0x16u);
      }
    }
    objc_initWeak((id *)buf, self);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __67__PKNavigationDashboardPassViewController_presentTransitCardNumber__block_invoke;
    v9[3] = &unk_1E59CB010;
    objc_copyWeak(&v11, (id *)buf);
    id v10 = v6;
    [v7 executeAfterContentIsLoaded:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }
}

void __67__PKNavigationDashboardPassViewController_presentTransitCardNumber__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v2 = [[PKTransitCardNumberViewController alloc] initWithPass:*(void *)(a1 + 32)];
    [WeakRetained pushViewController:v2 animated:1];
  }
}

- (void)presentManageBarcodePassNotifications
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  double v3 = [(PKPassGroupView *)self->_passGroupView frontmostPassView];
  uint64_t v4 = [v3 pass];

  if (!v4)
  {
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134349314;
      id v8 = self;
      __int16 v9 = 2080;
      id v10 = "-[PKNavigationDashboardPassViewController presentManageBarcodePassNotifications]";
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Frontmost pass is nil", (uint8_t *)&v7, 0x16u);
    }
  }
  id v6 = [[PKManageBarcodePassNotificationsViewController alloc] initWithPass:v4];
  [(PKNavigationDashboardPassViewController *)self pushViewController:v6 animated:1];
}

- (void)presentManagePaymentPassNotificationsControllerWithDataProvider:(id)a3 peerPaymentAccount:(id)a4 bankConnectAccount:(id)a5 account:(id)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  __int16 v14 = [(PKPassGroupView *)self->_passGroupView frontmostPassView];
  CGFloat v15 = [v14 pass];

  if (!v15)
  {
    uint64_t v16 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349314;
      v33 = self;
      __int16 v34 = 2080;
      id v35 = "-[PKNavigationDashboardPassViewController presentManagePaymentPassNotificationsControllerWithDataProvider:pe"
            "erPaymentAccount:bankConnectAccount:account:]";
      _os_log_impl(&dword_19F450000, v16, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Frontmost pass is nil", buf, 0x16u);
    }
  }
  double v17 = [v15 paymentPass];
  uint64_t v18 = [(PKDashboardViewController *)self->_dashboardVC dataSource];
  if (!v18)
  {
    id v19 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349314;
      v33 = self;
      __int16 v34 = 2080;
      id v35 = "-[PKNavigationDashboardPassViewController presentManagePaymentPassNotificationsControllerWithDataProvider:pe"
            "erPaymentAccount:bankConnectAccount:account:]";
      _os_log_impl(&dword_19F450000, v19, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Data source is nil", buf, 0x16u);
    }
  }
  objc_initWeak((id *)buf, self);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __153__PKNavigationDashboardPassViewController_presentManagePaymentPassNotificationsControllerWithDataProvider_peerPaymentAccount_bankConnectAccount_account___block_invoke;
  v25[3] = &unk_1E59D10E8;
  objc_copyWeak(&v31, (id *)buf);
  id v20 = v17;
  id v26 = v20;
  id v21 = v10;
  id v27 = v21;
  id v22 = v11;
  id v28 = v22;
  id v23 = v12;
  id v29 = v23;
  id v24 = v13;
  id v30 = v24;
  [v18 executeAfterContentIsLoaded:v25];

  objc_destroyWeak(&v31);
  objc_destroyWeak((id *)buf);
}

void __153__PKNavigationDashboardPassViewController_presentManagePaymentPassNotificationsControllerWithDataProvider_peerPaymentAccount_bankConnectAccount_account___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F850C0]) initWithPaymentPass:*(void *)(a1 + 32)];
    double v3 = (void *)[objc_alloc(MEMORY[0x1E4F850C8]) initWithTransactionSource:v2];
    uint64_t v4 = [[PKManagePaymentPassNotificationsViewController alloc] initWithPass:*(void *)(a1 + 32) dataProvider:*(void *)(a1 + 40) peerPaymentAccount:*(void *)(a1 + 48) bankConnectAccount:*(void *)(a1 + 56) account:*(void *)(a1 + 64) transactionSourceCollection:v3];
    [WeakRetained pushViewController:v4 animated:1];
  }
}

- (void)presentCardNumbers
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  double v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Attempting to present virtual card and card numbers", buf, 2u);
  }

  if (PKStoreDemoModeEnabled())
  {
    uint64_t v4 = PKUIStoreDemoGatewayViewController();
    [(PKNavigationDashboardPassViewController *)self presentViewController:v4 animated:1 completion:0];
  }
  else
  {
    uint64_t v4 = [(PKDashboardViewController *)self->_dashboardVC dataSource];
    if (!v4)
    {
      id v5 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349314;
        CGFloat v15 = self;
        __int16 v16 = 2080;
        double v17 = "-[PKNavigationDashboardPassViewController presentCardNumbers]";
        _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Data source is nil", buf, 0x16u);
      }
    }
    id v6 = [(PKPassGroupView *)self->_passGroupView frontmostPassView];
    int v7 = [v6 pass];
    id v8 = [v7 paymentPass];

    if (v8)
    {
      objc_initWeak((id *)buf, self);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      void v10[2] = __61__PKNavigationDashboardPassViewController_presentCardNumbers__block_invoke;
      v10[3] = &unk_1E59CB378;
      objc_copyWeak(&v13, (id *)buf);
      id v11 = v4;
      id v12 = v8;
      [v11 executeAfterContentIsLoaded:v10];

      objc_destroyWeak(&v13);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      __int16 v9 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349314;
        CGFloat v15 = self;
        __int16 v16 = 2080;
        double v17 = "-[PKNavigationDashboardPassViewController presentCardNumbers]";
        _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Frontmost pass is nil", buf, 0x16u);
      }
    }
  }
}

void __61__PKNavigationDashboardPassViewController_presentCardNumbers__block_invoke(id *a1)
{
  uint64_t v2 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (!WeakRetained) {
    goto LABEL_10;
  }
  uint64_t v4 = [MEMORY[0x1E4F84270] sharedInstance];
  id v5 = [a1[4] account];
  id v6 = [PKPhysicalCardController alloc];
  id v7 = a1[5];
  id v8 = [a1[4] physicalCards];
  __int16 v9 = [(PKPhysicalCardController *)v6 initWithAccountService:v4 paymentPass:v7 account:v5 accountUser:0 physicalCards:v8];

  id v10 = [v5 creditDetails];
  id v11 = [v10 virtualCards];
  id v12 = [v11 anyObject];

  id v13 = [MEMORY[0x1E4F84D50] sharedService];
  if (!PKVirtualCardEnabledWithWebService()) {
    goto LABEL_5;
  }
  int v14 = [a1[5] hasActiveVirtualCard];

  if (v14)
  {
    id v13 = [MEMORY[0x1E4F85108] cardsForPaymentPass:a1[5]];
    uint64_t v15 = [v13 anyObject];

    id v12 = (void *)v15;
LABEL_5:
  }
  __int16 v16 = [a1[4] peerPaymentAccount];
  double v17 = [PKAccountCardNumbersPresenter alloc];
  if ([(PKPhysicalCardController *)v9 hasExpiredPhysicalCardOnly]) {
    [(PKPhysicalCardController *)v9 expiredPhysicalCard];
  }
  else {
  uint64_t v18 = [(PKPhysicalCardController *)v9 primaryPhysicalCard];
  }
  uint64_t v19 = [(PKAccountCardNumbersPresenter *)v17 initWithVirtualCard:v12 physicalCard:v18 account:v5 peerPaymentAccount:v16 pass:a1[5] context:0];
  id v20 = (void *)*((void *)WeakRetained + 210);
  *((void *)WeakRetained + 210) = v19;

  [*((id *)WeakRetained + 209) setEnabled:0];
  id v21 = (void *)*((void *)WeakRetained + 210);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __61__PKNavigationDashboardPassViewController_presentCardNumbers__block_invoke_2;
  v22[3] = &unk_1E59CBA68;
  objc_copyWeak(&v23, v2);
  [v21 presentCardNumbersWithCompletion:v22];
  objc_destroyWeak(&v23);

LABEL_10:
}

void __61__PKNavigationDashboardPassViewController_presentCardNumbers__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __61__PKNavigationDashboardPassViewController_presentCardNumbers__block_invoke_3;
    v6[3] = &unk_1E59CA870;
    v6[4] = WeakRetained;
    id v7 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

uint64_t __61__PKNavigationDashboardPassViewController_presentCardNumbers__block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1672) setEnabled:1];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (isKindOfClass)
  {
    return [v3 presentViewController:v4 animated:1 completion:0];
  }
  else
  {
    return [v3 _pushViewControllerWhenNavigationAvailable:v4 animated:1 handler:0];
  }
}

- (void)presentPassDetailsAnimated:(BOOL)a3 handler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(PKPassGroupView *)self->_passGroupView frontmostPassView];
  id v8 = [v7 pass];

  if (v8)
  {
    uint64_t v9 = [v8 passType];
    if (v9 == 1)
    {
      id v12 = [v8 paymentPass];
      id v13 = [(PKNavigationDashboardPassViewController *)self _paymentPassDetailsViewControllerForPaymentPass:v12];

      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      uint64_t v19 = __78__PKNavigationDashboardPassViewController_presentPassDetailsAnimated_handler___block_invoke;
      id v20 = &unk_1E59CAD68;
      id v21 = v13;
      id v22 = v6;
      id v10 = v13;
      [(PKNavigationDashboardPassViewController *)self _pushViewControllerWhenNavigationAvailable:v10 animated:v4 handler:&v17];
    }
    else
    {
      if (v9)
      {
LABEL_9:
        uint64_t v14 = *MEMORY[0x1E4F86380];
        uint64_t v15 = *MEMORY[0x1E4F86120];
        v23[0] = *MEMORY[0x1E4F86308];
        v23[1] = v15;
        uint64_t v16 = *MEMORY[0x1E4F86150];
        v24[0] = v14;
        v24[1] = v16;
        id v11 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v24, v23, 2, v17, v18, v19, v20);
        [(PKNavigationDashboardPassViewController *)self reportEventForPassIfNecessary:v11];
        goto LABEL_10;
      }
      id v10 = [(PKNavigationDashboardPassViewController *)self _barcodePassDetailsViewControllerForBarcodePass:v8];
      [(PKNavigationDashboardPassViewController *)self _pushViewControllerWhenNavigationAvailable:v10 animated:v4 handler:0];
    }

    goto LABEL_9;
  }
  id v11 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349314;
    id v26 = self;
    __int16 v27 = 2080;
    id v28 = "-[PKNavigationDashboardPassViewController presentPassDetailsAnimated:handler:]";
    _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Frontmost pass is nil", buf, 0x16u);
  }
LABEL_10:
}

uint64_t __78__PKNavigationDashboardPassViewController_presentPassDetailsAnimated_handler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)presentPassDetailsAnimated:(BOOL)a3 action:(unint64_t)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __77__PKNavigationDashboardPassViewController_presentPassDetailsAnimated_action___block_invoke;
  v4[3] = &__block_descriptor_40_e43_v16__0__PKPaymentPassDetailViewController_8l;
  v4[4] = a4;
  [(PKNavigationDashboardPassViewController *)self presentPassDetailsAnimated:a3 handler:v4];
}

void __77__PKNavigationDashboardPassViewController_presentPassDetailsAnimated_action___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  switch(*(void *)(a1 + 32))
  {
    case 1:
      [v3 presentSchedulePayments];
      goto LABEL_12;
    case 2:
      [v3 presentBankAccounts];
      goto LABEL_12;
    case 3:
      [v3 presentISO18013Details];
      goto LABEL_12;
    case 4:
      [v3 presentShareAccount];
      goto LABEL_12;
    case 5:
      [v3 presentMakeDefaultAtApple];
      goto LABEL_12;
    case 6:
      [v3 presentOrderPhysicalCard];
      goto LABEL_12;
    case 7:
      [v3 presentActivatePhysicalCard];
      goto LABEL_12;
    case 8:
      [v3 presentTrackPhysicalCard];
      goto LABEL_12;
    case 9:
      [v3 presentAutoReload];
      goto LABEL_12;
    case 0xALL:
      [v3 presentReplacePhysicalCard];
LABEL_12:
      id v3 = v4;
      break;
    default:
      break;
  }
}

- (void)presentSpendingSummaryWithType:(unint64_t)a3 categorization:(unint64_t)a4 unit:(unint64_t)a5 completion:(id)a6
{
  id v10 = a6;
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __105__PKNavigationDashboardPassViewController_presentSpendingSummaryWithType_categorization_unit_completion___block_invoke;
  v12[3] = &unk_1E59D1130;
  v12[4] = self;
  objc_copyWeak(v14, &location);
  v14[1] = (id)a3;
  v14[2] = (id)a5;
  v14[3] = (id)a4;
  id v11 = v10;
  id v13 = v11;
  [(PKNavigationDashboardPassViewController *)self _canPresentCreditDetailsViewControllerWithCompletion:v12];

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
}

void __105__PKNavigationDashboardPassViewController_presentSpendingSummaryWithType_categorization_unit_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v25 = a3;
  *(unsigned char *)(*(void *)(a1 + 32) + 1664) = 1;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v6 = WeakRetained;
  if (WeakRetained && a2)
  {
    id v7 = [WeakRetained[221] dataSource];
    id v22 = [PKSpendingSummaryViewController alloc];
    id v24 = [v7 familyCollection];
    id v21 = [v7 avatarManager];
    id v20 = [v7 account];
    uint64_t v19 = [v7 accountUserCollection];
    uint64_t v18 = [v7 physicalCards];
    id v23 = [v7 summaryFetcher];
    uint64_t v17 = [v7 weeks];
    uint64_t v16 = [v7 months];
    id v8 = [v7 years];
    uint64_t v15 = *(void *)(a1 + 56);
    uint64_t v9 = *(void *)(a1 + 64);
    id v10 = [v7 currentMonthTransactions];
    id v11 = [v7 pendingPayments];
    id v12 = [v7 upcomingScheduledPayments];
    id v13 = [(PKSpendingSummaryViewController *)v22 initWithTransactionSourceCollection:v25 familyCollection:v24 avatarManager:v21 account:v20 accountUserCollection:v19 physicalCards:v18 fetcher:v23 weeks:v17 months:v16 years:v8 type:v15 unit:v9 currentMonthTransactions:v10 pendingPayments:v11 upcomingScheduledPayments:v12 dispayType:0];

    [(PKSpendingSummaryViewController *)v13 setCategorization:*(void *)(a1 + 72)];
    [v6 pushViewController:v13 animated:1];
    *(unsigned char *)(*(void *)(a1 + 32) + 1664) = 0;
    uint64_t v14 = *(void *)(a1 + 40);
    if (v14) {
      (*(void (**)(void))(v14 + 16))();
    }
  }
}

- (void)summaryTypeDidChange
{
  id v2 = [(PKDashboardViewController *)self->_dashboardVC dataSource];
  [v2 summaryTypeDidChange];
}

- (void)presentBalanceDetailsWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __79__PKNavigationDashboardPassViewController_presentBalanceDetailsWithCompletion___block_invoke;
  v6[3] = &unk_1E59D1158;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  v6[4] = self;
  id v7 = v5;
  [(PKNavigationDashboardPassViewController *)self _canPresentCreditDetailsViewControllerWithCompletion:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __79__PKNavigationDashboardPassViewController_presentBalanceDetailsWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v16 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v6 = WeakRetained;
  if (WeakRetained && (a2 & 1) != 0)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 1664) = 1;
    id v7 = [WeakRetained[221] dataSource];
    id v8 = [PKCreditBalanceDetailsViewController alloc];
    uint64_t v9 = [v7 familyCollection];
    id v10 = [MEMORY[0x1E4F84D50] sharedService];
    id v11 = [v7 account];
    id v12 = [v7 accountUserCollection];
    id v13 = [v7 physicalCards];
    uint64_t v14 = [(PKCreditBalanceDetailsViewController *)v8 initWithStyle:0 transactionSourceCollection:v16 familyCollection:v9 webService:v10 account:v11 accountUserCollection:v12 physicalCards:v13 statement:0 previousStatements:0];

    [v6 pushViewController:v14 animated:1];
    *(unsigned char *)(*(void *)(a1 + 32) + 1664) = 0;
  }
  else
  {
    uint64_t v15 = *(void *)(a1 + 40);
    if (v15) {
      (*(void (**)(void))(v15 + 16))();
    }
  }
}

- (void)showStatement:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __68__PKNavigationDashboardPassViewController_showStatement_completion___block_invoke;
    v9[3] = &unk_1E59D1158;
    objc_copyWeak(&v12, &location);
    id v11 = v8;
    id v10 = v6;
    [(PKNavigationDashboardPassViewController *)self _canPresentCreditDetailsViewControllerWithCompletion:v9];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
  }
}

void __68__PKNavigationDashboardPassViewController_showStatement_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v16 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v6 = WeakRetained;
  if (WeakRetained && (a2 & 1) != 0)
  {
    id v7 = [WeakRetained[221] dataSource];
    id v8 = [v7 account];
    uint64_t v9 = [PKCreditBalanceDetailsViewController alloc];
    id v10 = [v7 familyCollection];
    id v11 = [MEMORY[0x1E4F84D50] sharedService];
    id v12 = [v7 accountUserCollection];
    id v13 = [v7 physicalCards];
    uint64_t v14 = [(PKCreditBalanceDetailsViewController *)v9 initWithStyle:0 transactionSourceCollection:v16 familyCollection:v10 webService:v11 account:v8 accountUserCollection:v12 physicalCards:v13 statement:0 previousStatements:0];

    [v6 pushViewController:v14 animated:0];
    [(PKCreditBalanceDetailsViewController *)v14 showStatement:*(void *)(a1 + 32) style:0];
  }
  else
  {
    uint64_t v15 = *(void *)(a1 + 40);
    if (v15) {
      (*(void (**)(void))(v15 + 16))();
    }
  }
}

- (void)_canPresentCreditDetailsViewControllerWithCompletion:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PKPassGroupView *)self->_passGroupView frontmostPassView];
  id v6 = [v5 pass];
  id v7 = [v6 paymentPass];

  if (v7)
  {
    if (v4)
    {
      if (self->_isPendingVCPresentation)
      {
        (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
      }
      else
      {
        uint64_t v9 = [(PKDashboardViewController *)self->_dashboardVC dataSource];
        if (!v9)
        {
          id v10 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134349314;
            uint64_t v18 = self;
            __int16 v19 = 2080;
            id v20 = "-[PKNavigationDashboardPassViewController _canPresentCreditDetailsViewControllerWithCompletion:]";
            _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Data source is nil", buf, 0x16u);
          }
        }
        objc_initWeak((id *)buf, self);
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __96__PKNavigationDashboardPassViewController__canPresentCreditDetailsViewControllerWithCompletion___block_invoke;
        v12[3] = &unk_1E59CFAE0;
        objc_copyWeak(&v16, (id *)buf);
        id v15 = v4;
        id v13 = v7;
        id v11 = v9;
        id v14 = v11;
        [v11 executeAfterContentIsLoaded:v12];

        objc_destroyWeak(&v16);
        objc_destroyWeak((id *)buf);
      }
    }
  }
  else
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349314;
      uint64_t v18 = self;
      __int16 v19 = 2080;
      id v20 = "-[PKNavigationDashboardPassViewController _canPresentCreditDetailsViewControllerWithCompletion:]";
      _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Frontmost pass is nil", buf, 0x16u);
    }
  }
}

void __96__PKNavigationDashboardPassViewController__canPresentCreditDetailsViewControllerWithCompletion___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __96__PKNavigationDashboardPassViewController__canPresentCreditDetailsViewControllerWithCompletion___block_invoke_2;
    aBlock[3] = &unk_1E59D1180;
    id v12 = a1[6];
    id v10 = a1[4];
    id v11 = a1[5];
    id v3 = (void (**)(void *, void))_Block_copy(aBlock);
    id v4 = [a1[5] account];
    id v5 = v4;
    if (v4)
    {
      id v6 = [v4 creditDetails];
      id v7 = v6;
      if (v6)
      {
        id v8 = [v6 accountSummary];
        v3[2](v3, [v8 requiresDebtCollectionNotices] ^ 1);
      }
      else
      {
        v3[2](v3, 0);
      }
    }
    else
    {
      v3[2](v3, 1);
    }
  }
  else
  {
    (*((void (**)(void))a1[6] + 2))();
  }
}

void __96__PKNavigationDashboardPassViewController__canPresentCreditDetailsViewControllerWithCompletion___block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F850C0]) initWithPaymentPass:*(void *)(a1 + 32)];
    [v3 addObject:v4];
    id v5 = [*(id *)(a1 + 40) accountUserCollection];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = objc_msgSend(v5, "accountUsers", 0);
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
          id v11 = (void *)[objc_alloc(MEMORY[0x1E4F850C0]) initWithAccountUser:*(void *)(*((void *)&v16 + 1) + 8 * i)];
          [v3 addObject:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }

    id v12 = objc_alloc(MEMORY[0x1E4F850C8]);
    id v13 = (void *)[v3 copy];
    id v14 = (void *)[v12 initWithTransactionSources:v13];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v15 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v15();
  }
}

- (void)presentDailyCashForDateComponents:(id)a3 redemptionType:(unint64_t)a4 completion:(id)a5
{
  id v9 = a3;
  id v8 = a5;
  if (a4 - 1 >= 2)
  {
    if (a4 == 3) {
      [(PKNavigationDashboardPassViewController *)self _presentDailyCashOnAccountForDateComponents:v9 redemptionType:3 completion:v8];
    }
  }
  else
  {
    [(PKNavigationDashboardPassViewController *)self _presentDailyCashOnPassForDateComponents:v9 completion:v8];
  }
}

- (void)_presentDailyCashOnPassForDateComponents:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PKPassGroupView *)self->_passGroupView frontmostPassView];
  id v9 = [v8 pass];
  id v10 = [v9 paymentPass];

  if (!v10)
  {
    id v13 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349314;
      id v20 = self;
      __int16 v21 = 2080;
      id v22 = "-[PKNavigationDashboardPassViewController _presentDailyCashOnPassForDateComponents:completion:]";
      _os_log_impl(&dword_19F450000, v13, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Frontmost pass is nil", buf, 0x16u);
    }
    goto LABEL_10;
  }
  if (v7)
  {
    id v11 = [(PKDashboardViewController *)self->_dashboardVC dataSource];
    if (!v11)
    {
      id v12 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349314;
        id v20 = self;
        __int16 v21 = 2080;
        id v22 = "-[PKNavigationDashboardPassViewController _presentDailyCashOnPassForDateComponents:completion:]";
        _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Data source is nil", buf, 0x16u);
      }
    }
    objc_initWeak((id *)buf, self);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __95__PKNavigationDashboardPassViewController__presentDailyCashOnPassForDateComponents_completion___block_invoke;
    v14[3] = &unk_1E59D11A8;
    objc_copyWeak(&v18, (id *)buf);
    id v13 = v11;
    id v15 = v13;
    id v16 = v6;
    id v17 = v7;
    [v13 executeAfterContentIsLoaded:v14];

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
LABEL_10:
  }
}

void __95__PKNavigationDashboardPassViewController__presentDailyCashOnPassForDateComponents_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v12 = WeakRetained;
    id v3 = [*(id *)(a1 + 32) transactionFetcher];
    id v4 = [v3 cashbackGroupForDateComponents:*(void *)(a1 + 40) cashbackTransactionSourceCollection:0];

    if (v4)
    {
      id v5 = [PKTransactionHistoryViewController alloc];
      id v6 = [*(id *)(a1 + 32) transactionSourceCollection];
      id v7 = [*(id *)(a1 + 32) familyCollection];
      id v8 = [*(id *)(a1 + 32) account];
      id v9 = [*(id *)(a1 + 32) accountUserCollection];
      id v10 = [*(id *)(a1 + 32) physicalCards];
      id v11 = [(PKTransactionHistoryViewController *)v5 initWithTransactionGroup:v4 transactionSourceCollection:v6 familyCollection:v7 account:v8 accountUserCollection:v9 physicalCards:v10 fetcher:0 transactionHistory:0 detailViewStyle:0];

      [(PKTransactionHistoryViewController *)v11 setShouldPromptForReview:1];
      [v12 pushViewController:v11 animated:1];
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

    id WeakRetained = v12;
  }
}

- (void)_presentDailyCashOnAccountForDateComponents:(id)a3 redemptionType:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (a4 == 3)
  {
    objc_initWeak(&location, self);
    id v10 = [MEMORY[0x1E4F84270] sharedInstance];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __113__PKNavigationDashboardPassViewController__presentDailyCashOnAccountForDateComponents_redemptionType_completion___block_invoke;
    v11[3] = &unk_1E59CD410;
    objc_copyWeak(&v14, &location);
    id v13 = v9;
    id v12 = v8;
    [v10 defaultAccountForFeature:5 completion:v11];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __113__PKNavigationDashboardPassViewController__presentDailyCashOnAccountForDateComponents_redemptionType_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v5 = objc_alloc_init(PKAccountViewInterfaceConfiguration);
    [(PKAccountViewInterfaceConfiguration *)v5 setAccount:v3];
    [(PKAccountViewInterfaceConfiguration *)v5 setRewardsDateComponents:*(void *)(a1 + 32)];
    [(PKAccountViewInterfaceConfiguration *)v5 setDestination:9];
    [(PKAccountViewInterfaceConfiguration *)v5 setViewStyle:0];
    id v6 = objc_alloc_init(PKPassPresentationContext);
    [(PKPassPresentationContext *)v6 setPresentationSource:5];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __113__PKNavigationDashboardPassViewController__presentDailyCashOnAccountForDateComponents_redemptionType_completion___block_invoke_2;
    v8[3] = &unk_1E59CA9F8;
    id v9 = *(id *)(a1 + 40);
    [WeakRetained presentAccountWithConfiguration:v5 presentationContext:v6 animated:1 completion:v8];
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7) {
      (*(void (**)(void))(v7 + 16))();
    }
  }
}

uint64_t __113__PKNavigationDashboardPassViewController__presentDailyCashOnAccountForDateComponents_redemptionType_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)_paymentPassDetailsViewControllerForPaymentPass:(id)a3
{
  if (a3)
  {
    dashboardVC = self->_dashboardVC;
    id v5 = a3;
    id v6 = [(PKDashboardViewController *)dashboardVC dataSource];
    id v18 = objc_alloc_init(MEMORY[0x1E4F84A88]);
    uint64_t v7 = [PKPaymentPassDetailViewController alloc];
    group = self->_group;
    uint64_t v23 = v7;
    groupsController = self->_groupsController;
    id v20 = [MEMORY[0x1E4F84D50] sharedService];
    id v17 = [MEMORY[0x1E4F84E10] sharedService];
    uint64_t v8 = [MEMORY[0x1E4F84270] sharedInstance];
    id v16 = objc_alloc_init(MEMORY[0x1E4F848A0]);
    long long v19 = [(PKPassGroupView *)self->_passGroupView frontmostPassView];
    id v9 = [v19 rendererState];
    id v10 = [v6 familyCollection];
    id v11 = [v6 avatarManager];
    id v12 = [v6 account];
    id v13 = (void *)v8;
    id v14 = [(PKPaymentPassDetailViewController *)v23 initWithPass:v5 group:group groupsController:groupsController webService:v20 peerPaymentWebService:v17 accountService:v8 style:0 passLibraryDataProvider:v16 paymentServiceDataProvider:v18 rendererState:v9 context:0 familyCollection:v10 contactAvatarManager:v11 account:v12];

    [(PKPaymentPassDetailViewController *)v14 setDeleteOverrider:self];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (id)_barcodePassDetailsViewControllerForBarcodePass:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[PKBarcodePassDetailViewController alloc] initWithPass:v4];

    [(PKBarcodePassDetailViewController *)v5 setDeleteOverrider:self];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)presentTransaction:(id)a3 forPaymentPass:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __77__PKNavigationDashboardPassViewController_presentTransaction_forPaymentPass___block_invoke;
  v10[3] = &unk_1E59D11D0;
  objc_copyWeak(&v13, &location);
  id v8 = v7;
  id v11 = v8;
  id v9 = v6;
  id v12 = v9;
  [(PKNavigationDashboardPassViewController *)self _canPresentCreditDetailsViewControllerWithCompletion:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __77__PKNavigationDashboardPassViewController_presentTransaction_forPaymentPass___block_invoke(id *a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained && a2)
  {
    BOOL v18 = [a1[4] hasAssociatedPeerPaymentAccount]
       && [a1[5] transactionType] == 3
       && [a1[5] peerPaymentStatus] != 1;
    *((unsigned char *)WeakRetained + 1664) = 1;
    id v8 = *((id *)WeakRetained + 221);
    id v9 = [v8 dataSource];
    id v16 = v8;
    id v10 = [v8 transactionPresenter];
    id v17 = a1[5];
    id v11 = [v9 familyCollection];
    id v12 = [v9 account];
    id v13 = [v9 accountUserCollection];
    id v14 = [v9 physicalCards];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __77__PKNavigationDashboardPassViewController_presentTransaction_forPaymentPass___block_invoke_2;
    v19[3] = &unk_1E59CBA68;
    objc_copyWeak(&v20, v6);
    LOBYTE(v15) = v18;
    [v10 viewControllerForTransaction:v17 transactionSourceCollection:v5 familyCollection:v11 account:v12 accountUserCollection:v13 bankConnectInstitution:0 physicalCards:v14 forcePreventHistory:v15 completion:v19];

    objc_destroyWeak(&v20);
  }
}

void __77__PKNavigationDashboardPassViewController_presentTransaction_forPaymentPass___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained pushViewController:v5 animated:1];
    v4[1664] = 0;
  }
}

- (void)presentTransaction:(id)a3 forAccount:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if ([v6 type] == 4)
  {
    id v7 = objc_alloc_init(PKAccountViewInterfaceConfiguration);
    [(PKAccountViewInterfaceConfiguration *)v7 setAccount:v6];
    [(PKAccountViewInterfaceConfiguration *)v7 setTransaction:v9];
    [(PKAccountViewInterfaceConfiguration *)v7 setDestination:8];
    [(PKAccountViewInterfaceConfiguration *)v7 setViewStyle:0];
    id v8 = objc_alloc_init(PKPassPresentationContext);
    [(PKPassPresentationContext *)v8 setPresentationSource:5];
    [(PKNavigationDashboardPassViewController *)self presentAccountWithConfiguration:v7 presentationContext:v8 animated:1 completion:0];
  }
}

- (void)presentPayLaterFinancingPlan:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    self->_isPendingVCPresentation = 1;
    BOOL v18 = [(PKDashboardViewController *)self->_dashboardVC dataSource];
    id v5 = [v18 account];
    id v6 = objc_alloc_init(MEMORY[0x1E4F84C38]);
    id v7 = objc_alloc(MEMORY[0x1E4F849D0]);
    id v8 = [MEMORY[0x1E4F84D50] sharedService];
    id v9 = [MEMORY[0x1E4F84898] sharedInstance];
    id v10 = [MEMORY[0x1E4F84E10] sharedService];
    id v11 = [MEMORY[0x1E4F84270] sharedInstance];
    id v17 = v6;
    id v12 = [v6 defaultPaymentPassUniqueIdentifier];
    id v13 = (PKPayLaterPaymentIntentController *)[v7 initWithPayLaterAccount:v5 paymentWebService:v8 passLibrary:v9 peerPaymentWebService:v10 accountService:v11 defaultPassUniqueIdentifier:v12];
    paymentIntentController = self->_paymentIntentController;
    self->_paymentIntentController = v13;

    uint64_t v15 = [[PKPayLaterFinancingPlanViewController alloc] initWithFinancingPlan:v4 payLaterAccount:v5 paymentIntentController:self->_paymentIntentController merchantIcon:0 iconGenerator:0];
    objc_initWeak(&location, self);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __72__PKNavigationDashboardPassViewController_presentPayLaterFinancingPlan___block_invoke;
    v19[3] = &unk_1E59CB268;
    objc_copyWeak(&v21, &location);
    id v16 = v15;
    id v20 = v16;
    [(PKPayLaterFinancingPlanViewController *)v16 preflightWithCompletion:v19];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
}

void __72__PKNavigationDashboardPassViewController_presentPayLaterFinancingPlan___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained pushViewController:*(void *)(a1 + 32) animated:1];
    id WeakRetained = v3;
    *((unsigned char *)v3 + 1664) = 1;
  }
}

- (void)presentScheduledPayments
{
  id v3 = [(PKDashboardViewController *)self->_dashboardVC dataSource];
  id v4 = [MEMORY[0x1E4F84270] sharedInstance];
  id v5 = [MEMORY[0x1E4F84D50] sharedService];
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__PKNavigationDashboardPassViewController_presentScheduledPayments__block_invoke;
  v9[3] = &unk_1E59CB838;
  objc_copyWeak(&v14, &location);
  id v6 = v3;
  id v10 = v6;
  id v7 = v5;
  id v11 = v7;
  id v8 = v4;
  id v12 = v8;
  id v13 = self;
  [v6 executeAfterContentIsLoaded:v9];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __67__PKNavigationDashboardPassViewController_presentScheduledPayments__block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    id v4 = [*(id *)(a1 + 32) account];
    id v5 = [*(id *)(a1 + 32) recurringPayments];
    id v6 = [v5 firstObject];

    if (v6)
    {
      id v7 = [[PKCreditAccountPaymentDetailsViewController alloc] initWithAccount:v4 payment:v6 paymentWebService:*(void *)(a1 + 40) detailViewStyle:0];
      [WeakRetained pushViewController:v7 animated:1];
    }
    else
    {
      id v8 = [[PKAccountAutomaticPaymentsController alloc] initWithAccountService:*(void *)(a1 + 48) paymentWebService:*(void *)(a1 + 40) account:v4 context:0];
      [(PKAccountAutomaticPaymentsController *)v8 setDelegate:*(void *)(a1 + 56)];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __67__PKNavigationDashboardPassViewController_presentScheduledPayments__block_invoke_2;
      v9[3] = &unk_1E59CBA68;
      objc_copyWeak(&v10, v2);
      [(PKAccountAutomaticPaymentsController *)v8 nextViewControllerFromViewController:0 withCompletion:v9];
      objc_destroyWeak(&v10);
    }
  }
}

void __67__PKNavigationDashboardPassViewController_presentScheduledPayments__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [[PKNavigationController alloc] initWithRootViewController:v3];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained presentViewController:v5 animated:1 completion:0];
}

- (void)presentInstallmentPlan:(id)a3
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObject:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(PKNavigationDashboardPassViewController *)self _presentInstallmentPlans:v4];
  }
}

- (void)presentInstallmentPlans
{
  id v6 = [(PKDashboardViewController *)self->_dashboardVC dataSource];
  id v3 = [v6 account];
  id v4 = [v3 creditDetails];
  id v5 = [v4 installmentPlans];

  [(PKNavigationDashboardPassViewController *)self _presentInstallmentPlans:v5];
}

- (void)_presentInstallmentPlans:(id)a3
{
  id v25 = a3;
  uint64_t v4 = [v25 count];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = [(PKDashboardViewController *)self->_dashboardVC dataSource];
    id v7 = [(PKPassGroupView *)self->_passGroupView frontmostPassView];
    id v8 = [v7 pass];
    uint64_t v9 = [v8 paymentPass];

    id v24 = (void *)v9;
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F850C0]) initWithPaymentPass:v9];
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F850C8]) initWithTransactionSource:v10];
    if (v5 == 1)
    {
      id v12 = [PKTransactionHistoryViewController alloc];
      id v13 = [v25 anyObject];
      id v14 = [v6 familyCollection];
      uint64_t v15 = [v6 account];
      id v16 = [v6 accountUserCollection];
      id v17 = [v6 physicalCards];
      BOOL v18 = [(PKTransactionHistoryViewController *)v12 initWithInstallmentPlan:v13 transactionSourceCollection:v11 familyCollection:v14 account:v15 accountUserCollection:v16 physicalCards:v17];
    }
    else
    {
      id v13 = objc_alloc_init(MEMORY[0x1E4F84A88]);
      long long v19 = [PKInstallmentPlansViewController alloc];
      id v14 = [v6 account];
      uint64_t v15 = [v6 accountUserCollection];
      id v16 = [v6 physicalCards];
      id v17 = [MEMORY[0x1E4F84270] sharedInstance];
      [v6 familyCollection];
      uint64_t v23 = v6;
      id v20 = self;
      id v22 = v21 = v10;
      BOOL v18 = [(PKInstallmentPlansViewController *)v19 initWithAccount:v14 accountUserCollection:v15 physicalCards:v16 accountService:v17 transactionSourceCollection:v11 familyCollection:v22 dataProvider:v13];

      id v10 = v21;
      self = v20;
      id v6 = v23;
    }

    if (v18) {
      [(PKNavigationDashboardPassViewController *)self pushViewController:v18 animated:1];
    }
  }
}

- (void)presentRewardsHubWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __75__PKNavigationDashboardPassViewController_presentRewardsHubWithCompletion___block_invoke;
  v6[3] = &unk_1E59D11F8;
  id v7 = v4;
  id v5 = v4;
  [(PKNavigationDashboardPassViewController *)self _presentRewardsHubWithCompletion:v6];
}

uint64_t __75__PKNavigationDashboardPassViewController_presentRewardsHubWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)presentAccountPromotionWithProgramIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __99__PKNavigationDashboardPassViewController_presentAccountPromotionWithProgramIdentifier_completion___block_invoke;
  v10[3] = &unk_1E59D1220;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(PKNavigationDashboardPassViewController *)self _presentRewardsHubWithCompletion:v10];
}

void __99__PKNavigationDashboardPassViewController_presentAccountPromotionWithProgramIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    dispatch_time_t v4 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __99__PKNavigationDashboardPassViewController_presentAccountPromotionWithProgramIdentifier_completion___block_invoke_2;
    block[3] = &unk_1E59CE110;
    id v7 = v3;
    id v8 = *(id *)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    dispatch_after(v4, MEMORY[0x1E4F14428], block);
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5) {
      (*(void (**)(void))(v5 + 16))();
    }
  }
}

void __99__PKNavigationDashboardPassViewController_presentAccountPromotionWithProgramIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __99__PKNavigationDashboardPassViewController_presentAccountPromotionWithProgramIdentifier_completion___block_invoke_3;
  v3[3] = &unk_1E59CA9F8;
  id v4 = *(id *)(a1 + 48);
  [v1 scrollToPromotionWithProgramIdentifier:v2 animated:1 completion:v3];
}

uint64_t __99__PKNavigationDashboardPassViewController_presentAccountPromotionWithProgramIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)presentRewardsHubMerchantsWithPrivateIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __102__PKNavigationDashboardPassViewController_presentRewardsHubMerchantsWithPrivateIdentifier_completion___block_invoke;
  v10[3] = &unk_1E59D1220;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(PKNavigationDashboardPassViewController *)self _presentRewardsHubWithCompletion:v10];
}

void __102__PKNavigationDashboardPassViewController_presentRewardsHubMerchantsWithPrivateIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    dispatch_time_t v4 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __102__PKNavigationDashboardPassViewController_presentRewardsHubMerchantsWithPrivateIdentifier_completion___block_invoke_2;
    block[3] = &unk_1E59CE110;
    id v7 = v3;
    id v8 = *(id *)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    dispatch_after(v4, MEMORY[0x1E4F14428], block);
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5) {
      (*(void (**)(void))(v5 + 16))();
    }
  }
}

void __102__PKNavigationDashboardPassViewController_presentRewardsHubMerchantsWithPrivateIdentifier_completion___block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __102__PKNavigationDashboardPassViewController_presentRewardsHubMerchantsWithPrivateIdentifier_completion___block_invoke_3;
  v3[3] = &unk_1E59D1248;
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 presentEnhancedMerchantsListWithCompletion:v3];
}

void __102__PKNavigationDashboardPassViewController_presentRewardsHubMerchantsWithPrivateIdentifier_completion___block_invoke_3(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __102__PKNavigationDashboardPassViewController_presentRewardsHubMerchantsWithPrivateIdentifier_completion___block_invoke_4;
  v4[3] = &unk_1E59CA9F8;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [a2 scrollToMerchantWithPrivateIdentifier:v3 animated:1 completion:v4];
}

uint64_t __102__PKNavigationDashboardPassViewController_presentRewardsHubMerchantsWithPrivateIdentifier_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_presentRewardsHubWithCompletion:(id)a3
{
  id v4 = a3;
  if (PKRewardsCenterEnabled())
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __76__PKNavigationDashboardPassViewController__presentRewardsHubWithCompletion___block_invoke;
    void v5[3] = &unk_1E59D1270;
    objc_copyWeak(&v7, &location);
    id v6 = v4;
    [(PKNavigationDashboardPassViewController *)self _canPresentCreditDetailsViewControllerWithCompletion:v5];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  else if (v4)
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

void __76__PKNavigationDashboardPassViewController__presentRewardsHubWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = WeakRetained;
  if (WeakRetained && (a2 & 1) != 0)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __76__PKNavigationDashboardPassViewController__presentRewardsHubWithCompletion___block_invoke_2;
    aBlock[3] = &unk_1E59D1220;
    void aBlock[4] = WeakRetained;
    id v22 = *(id *)(a1 + 32);
    id v8 = _Block_copy(aBlock);
    *((unsigned char *)v7 + 1664) = 1;
    id v9 = [*((id *)v7 + 221) dataSource];
    id v10 = [v9 account];
    uint64_t v11 = [v10 feature];

    if (v11 == 2)
    {
      id v12 = [PKRewardsHubViewController alloc];
      id v13 = [v9 account];
      id v14 = [MEMORY[0x1E4F84270] sharedInstance];
      uint64_t v15 = [(PKRewardsHubViewController *)v12 initWithAccount:v13 transactionSourceCollection:v5 accountService:v14];

      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __76__PKNavigationDashboardPassViewController__presentRewardsHubWithCompletion___block_invoke_3;
      v18[3] = &unk_1E59CF8D8;
      v18[4] = v7;
      long long v19 = v15;
      id v20 = v8;
      id v16 = v15;
      [(PKRewardsHubViewController *)v16 preflightWithCompletion:v18];
    }
    else
    {
      (*((void (**)(void *, void))v8 + 2))(v8, 0);
    }
  }
  else
  {
    uint64_t v17 = *(void *)(a1 + 32);
    if (v17) {
      (*(void (**)(uint64_t, void))(v17 + 16))(v17, 0);
    }
  }
}

uint64_t __76__PKNavigationDashboardPassViewController__presentRewardsHubWithCompletion___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1664) = 0;
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __76__PKNavigationDashboardPassViewController__presentRewardsHubWithCompletion___block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__PKNavigationDashboardPassViewController__presentRewardsHubWithCompletion___block_invoke_4;
  block[3] = &unk_1E59CE110;
  uint64_t v2 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v4 = v2;
  id v5 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __76__PKNavigationDashboardPassViewController__presentRewardsHubWithCompletion___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) pushViewController:*(void *)(a1 + 40) animated:1];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

- (void)presentAccountWithConfiguration:(id)a3 presentationContext:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [(PKDashboardViewController *)self->_dashboardVC dataSource];
  if (!v13)
  {
    id v14 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349314;
      id v26 = self;
      __int16 v27 = 2080;
      id v28 = "-[PKNavigationDashboardPassViewController presentAccountWithConfiguration:presentationContext:animated:completion:]";
      _os_log_impl(&dword_19F450000, v14, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Data source is nil", buf, 0x16u);
    }
  }
  uint64_t v15 = [(PKPassGroupView *)self->_passGroupView frontmostPassView];
  id v16 = [v15 pass];
  uint64_t v17 = [v16 paymentPass];

  if (v17)
  {
    objc_initWeak((id *)buf, self);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __115__PKNavigationDashboardPassViewController_presentAccountWithConfiguration_presentationContext_animated_completion___block_invoke;
    v19[3] = &unk_1E59D1360;
    objc_copyWeak(&v23, (id *)buf);
    id v20 = v11;
    BOOL v24 = a5;
    id v21 = v10;
    id v22 = v12;
    [v13 executeAfterContentIsLoaded:v19];

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    BOOL v18 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349314;
      id v26 = self;
      __int16 v27 = 2080;
      id v28 = "-[PKNavigationDashboardPassViewController presentAccountWithConfiguration:presentationContext:animated:completion:]";
      _os_log_impl(&dword_19F450000, v18, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Frontmost pass is nil", buf, 0x16u);
    }
  }
}

void __115__PKNavigationDashboardPassViewController_presentAccountWithConfiguration_presentationContext_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F84518]);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __115__PKNavigationDashboardPassViewController_presentAccountWithConfiguration_presentationContext_animated_completion___block_invoke_2;
    v14[3] = &unk_1E59D12C0;
    objc_copyWeak(&v16, v2);
    id v15 = *(id *)(a1 + 32);
    char v17 = *(unsigned char *)(a1 + 64);
    [v4 addOperation:v14];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __115__PKNavigationDashboardPassViewController_presentAccountWithConfiguration_presentationContext_animated_completion___block_invoke_5;
    v9[3] = &unk_1E59D1310;
    objc_copyWeak(&v12, v2);
    id v10 = *(id *)(a1 + 40);
    id v11 = *(id *)(a1 + 32);
    char v13 = *(unsigned char *)(a1 + 64);
    [v4 addOperation:v9];
    id v5 = [MEMORY[0x1E4F1CA98] null];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __115__PKNavigationDashboardPassViewController_presentAccountWithConfiguration_presentationContext_animated_completion___block_invoke_8;
    v7[3] = &unk_1E59D1338;
    id v8 = *(id *)(a1 + 48);
    id v6 = (id)[v4 evaluateWithInput:v5 completion:v7];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&v16);
  }
}

void __115__PKNavigationDashboardPassViewController_presentAccountWithConfiguration_presentationContext_animated_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __115__PKNavigationDashboardPassViewController_presentAccountWithConfiguration_presentationContext_animated_completion___block_invoke_3;
    block[3] = &unk_1E59CEAE8;
    id v10 = *(id *)(a1 + 32);
    id v11 = WeakRetained;
    char v14 = *(unsigned char *)(a1 + 48);
    id v13 = v7;
    id v12 = v6;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    (*((void (**)(id, id, uint64_t))v7 + 2))(v7, v6, 1);
  }
}

void __115__PKNavigationDashboardPassViewController_presentAccountWithConfiguration_presentationContext_animated_completion___block_invoke_3(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) presentationSource] == 1
    || [*(id *)(a1 + 32) presentationSource] == 2)
  {
    uint64_t v2 = *(void **)(a1 + 40);
    v10[0] = v2[221];
    uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [v2 setViewControllers:v3 animated:*(unsigned __int8 *)(a1 + 64)];

    uint64_t v4 = [*(id *)(a1 + 40) transitionCoordinator];
    id v5 = (void *)v4;
    if (*(unsigned char *)(a1 + 64) && v4)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __115__PKNavigationDashboardPassViewController_presentAccountWithConfiguration_presentationContext_animated_completion___block_invoke_4;
      v7[3] = &unk_1E59D1298;
      id v9 = *(id *)(a1 + 56);
      id v8 = *(id *)(a1 + 48);
      [v5 animateAlongsideTransition:0 completion:v7];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v6();
  }
}

uint64_t __115__PKNavigationDashboardPassViewController_presentAccountWithConfiguration_presentationContext_animated_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __115__PKNavigationDashboardPassViewController_presentAccountWithConfiguration_presentationContext_animated_completion___block_invoke_5(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __115__PKNavigationDashboardPassViewController_presentAccountWithConfiguration_presentationContext_animated_completion___block_invoke_6;
  v10[3] = &unk_1E59D12E8;
  objc_copyWeak(&v15, (id *)(a1 + 48));
  id v14 = v7;
  id v11 = v6;
  id v12 = *(id *)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  char v16 = *(unsigned char *)(a1 + 56);
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v10);

  objc_destroyWeak(&v15);
}

void __115__PKNavigationDashboardPassViewController_presentAccountWithConfiguration_presentationContext_animated_completion___block_invoke_6(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained[221] accountModulePresenter];
    id v5 = [v4 accountViewControllerWithConfiguration:*(void *)(a1 + 40) presentationContext:*(void *)(a1 + 48)];

    [v3 pushViewController:v5 animated:*(unsigned __int8 *)(a1 + 72)];
    uint64_t v6 = [v3 transitionCoordinator];
    id v7 = (void *)v6;
    if (*(unsigned char *)(a1 + 72) && v6)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __115__PKNavigationDashboardPassViewController_presentAccountWithConfiguration_presentationContext_animated_completion___block_invoke_7;
      v8[3] = &unk_1E59D1298;
      id v10 = *(id *)(a1 + 56);
      id v9 = *(id *)(a1 + 32);
      [v7 animateAlongsideTransition:0 completion:v8];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __115__PKNavigationDashboardPassViewController_presentAccountWithConfiguration_presentationContext_animated_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t __115__PKNavigationDashboardPassViewController_presentAccountWithConfiguration_presentationContext_animated_completion___block_invoke_8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)presentPeerPaymentRecurringPaymentsWithIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = [(PKPassGroupView *)self->_passGroupView frontmostPassView];
  id v9 = [v8 pass];
  id v10 = [v9 paymentPass];

  if (v10)
  {
    if ([v10 isPeerPaymentPass])
    {
      id v11 = [v10 secureElementPass];
      id v12 = [v11 devicePrimaryPaymentApplication];
      uint64_t v13 = [v12 state];

      if (v13 == 7)
      {
        if (v7) {
          v7[2](v7, 0);
        }
      }
      else
      {
        objc_initWeak(&location, self);
        id v15 = [(PKDashboardViewController *)self->_dashboardVC dataSource];
        if (!v15)
        {
          char v16 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134349314;
            id v25 = self;
            __int16 v26 = 2080;
            __int16 v27 = "-[PKNavigationDashboardPassViewController presentPeerPaymentRecurringPaymentsWithIdentifier:completion:]";
            _os_log_impl(&dword_19F450000, v16, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Data source is nil", buf, 0x16u);
          }
        }
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __104__PKNavigationDashboardPassViewController_presentPeerPaymentRecurringPaymentsWithIdentifier_completion___block_invoke;
        v18[3] = &unk_1E59D00B8;
        objc_copyWeak(&v22, &location);
        id v17 = v15;
        id v19 = v17;
        id v21 = v7;
        id v20 = v6;
        [v17 executeAfterContentIsLoaded:v18];

        objc_destroyWeak(&v22);
        objc_destroyWeak(&location);
      }
      goto LABEL_16;
    }
  }
  else
  {
    id v14 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349314;
      id v25 = self;
      __int16 v26 = 2080;
      __int16 v27 = "-[PKNavigationDashboardPassViewController presentPeerPaymentRecurringPaymentsWithIdentifier:completion:]";
      _os_log_impl(&dword_19F450000, v14, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Frontmost pass is nil", buf, 0x16u);
    }
  }
  if (v7) {
    v7[2](v7, 0);
  }
LABEL_16:
}

void __104__PKNavigationDashboardPassViewController_presentPeerPaymentRecurringPaymentsWithIdentifier_completion___block_invoke(id *a1)
{
  uint64_t v2 = a1 + 7;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    if ((PKPeerPaymentRecurringPaymentHasShownEducationMessage() & 1) != 0
      || ([a1[4] recurringPeerPayments],
          uint64_t v4 = objc_claimAutoreleasedReturnValue(),
          uint64_t v5 = [v4 count],
          v4,
          v5))
    {
      id v6 = [PKPeerPaymentRecurringPaymentViewController alloc];
      id v7 = [MEMORY[0x1E4F84E00] sharedInstance];
      id v8 = [a1[4] transactionSourceCollection];
      id v9 = [a1[4] familyCollection];
      id v10 = [(PKPeerPaymentRecurringPaymentViewController *)v6 initWithContext:0 peerPaymentService:v7 transactionSourceCollection:v8 familyCollection:v9];

      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __104__PKNavigationDashboardPassViewController_presentPeerPaymentRecurringPaymentsWithIdentifier_completion___block_invoke_4;
      v13[3] = &unk_1E59D1388;
      objc_copyWeak(&v17, v2);
      id v11 = v10;
      id v14 = v11;
      id v15 = a1[5];
      id v16 = a1[6];
      [(PKPeerPaymentRecurringPaymentViewController *)v11 preflightWithCompletion:v13];

      objc_destroyWeak(&v17);
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __104__PKNavigationDashboardPassViewController_presentPeerPaymentRecurringPaymentsWithIdentifier_completion___block_invoke_2;
      block[3] = &unk_1E59CB010;
      objc_copyWeak(&v20, v2);
      id v19 = a1[4];
      dispatch_async(MEMORY[0x1E4F14428], block);
      id v12 = (void (**)(id, uint64_t))a1[6];
      if (v12) {
        v12[2](v12, 1);
      }

      objc_destroyWeak(&v20);
    }
  }
}

void __104__PKNavigationDashboardPassViewController_presentPeerPaymentRecurringPaymentsWithIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v4 = [PKPeerPaymentRecurringPaymentEducationViewController alloc];
    uint64_t v5 = [*(id *)(a1 + 32) transactionSourceCollection];
    id v6 = [*(id *)(a1 + 32) familyCollection];
    id v7 = [(PKPeerPaymentRecurringPaymentEducationViewController *)v4 initWithContext:0 transactionSourceCollection:v5 familyCollection:v6];

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __104__PKNavigationDashboardPassViewController_presentPeerPaymentRecurringPaymentsWithIdentifier_completion___block_invoke_3;
    v9[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v10, v2);
    [(PKPeerPaymentRecurringPaymentEducationViewController *)v7 setAddCardHandler:v9];
    id v8 = [[PKNavigationController alloc] initWithRootViewController:v7];
    [WeakRetained presentViewController:v8 animated:1 completion:0];

    objc_destroyWeak(&v10);
  }
}

void __104__PKNavigationDashboardPassViewController_presentPeerPaymentRecurringPaymentsWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _openPaymentSetupWithNetworkWhitelist:0 paymentSetupMode:0];
    id WeakRetained = v2;
  }
}

void __104__PKNavigationDashboardPassViewController_presentPeerPaymentRecurringPaymentsWithIdentifier_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    if (a2)
    {
      [WeakRetained pushViewController:*(void *)(a1 + 32) animated:1];
      uint64_t v5 = v7;
      if (*(void *)(a1 + 40))
      {
        objc_msgSend(*(id *)(a1 + 32), "showDetailsForRecurringPaymentIdentifier:");
        uint64_t v5 = v7;
      }
    }
    uint64_t v6 = *(void *)(a1 + 48);
    if (v6)
    {
      (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, a2);
      uint64_t v5 = v7;
    }
  }
}

- (void)presentPeerPaymentActionViewControllerForAction:(unint64_t)a3 pass:(id)a4 passLibraryDataProvider:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x1E4F84E10] sharedService];
  uint64_t v20 = 0;
  id v11 = [v10 targetDevice];
  id v12 = [v11 account];

  id v19 = 0;
  BOOL v13 = +[PKPeerPaymentActionController canPerformPeerPaymentAction:a3 account:v12 unableReason:&v20 displayableError:&v19];
  id v14 = v19;
  if (v13)
  {
    id v15 = +[PKPeerPaymentActionViewController peerPaymentActionViewControllerForAction:a3 paymentPass:v8 webService:v10 passLibraryDataProvider:v9 context:0];
    [v15 setDelegate:self];
    id v16 = [[PKNavigationController alloc] initWithRootViewController:v15];
    [(PKNavigationController *)v16 setSupportedInterfaceOrientations:2];
    [(PKNavigationDashboardPassViewController *)self presentViewController:v16 animated:1 completion:0];

    id v14 = v15;
  }
  else
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __120__PKNavigationDashboardPassViewController_presentPeerPaymentActionViewControllerForAction_pass_passLibraryDataProvider___block_invoke;
    v18[3] = &unk_1E59CA7D0;
    void v18[4] = self;
    id v17 = +[PKPeerPaymentActionController alertControllerForPeerPaymentActionUnableReason:v20 displayableError:v14 addCardActionHandler:v18];
    [(PKNavigationDashboardPassViewController *)self presentViewController:v17 animated:1 completion:0];
  }
}

uint64_t __120__PKNavigationDashboardPassViewController_presentPeerPaymentActionViewControllerForAction_pass_passLibraryDataProvider___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _openPaymentSetupWithNetworkWhitelist:0 paymentSetupMode:0];
}

- (void)presentPeerPaymentDeviceTapWithInitialAmount:(id)a3 initialMemo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PKDashboardViewController *)self->_dashboardVC dataSource];
  objc_initWeak(&location, self);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __100__PKNavigationDashboardPassViewController_presentPeerPaymentDeviceTapWithInitialAmount_initialMemo___block_invoke;
  BOOL v13 = &unk_1E59CA7F8;
  objc_copyWeak(&v14, &location);
  id v9 = [v8 deviceTapAmountEntryViewControllerWithInitialAmount:v6 initialMemo:v7 dismissAction:&v10];
  -[PKNavigationDashboardPassViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0, v10, v11, v12, v13);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __100__PKNavigationDashboardPassViewController_presentPeerPaymentDeviceTapWithInitialAmount_initialMemo___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

- (void)_openPaymentSetupWithNetworkWhitelist:(id)a3 paymentSetupMode:(int64_t)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  id v7 = objc_alloc(MEMORY[0x1E4F84BB8]);
  id v8 = [MEMORY[0x1E4F84D50] sharedService];
  id v9 = (void *)[v7 initWithWebService:v8];

  [v9 setAllowedPaymentNetworks:v6];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  [v9 setAllowedFeatureIdentifiers:v10];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __98__PKNavigationDashboardPassViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke;
  v12[3] = &unk_1E59CAEF8;
  objc_copyWeak(v14, &location);
  id v11 = v9;
  id v13 = v11;
  v14[1] = (id)a4;
  [v11 preflightWithCompletion:v12];

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
}

void __98__PKNavigationDashboardPassViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke(id *a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__PKNavigationDashboardPassViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_2;
  block[3] = &unk_1E59CAED0;
  objc_copyWeak(v11, a1 + 5);
  char v12 = a2;
  id v6 = a1[4];
  v11[1] = a1[6];
  id v9 = v6;
  id v10 = v5;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(v11);
}

void __98__PKNavigationDashboardPassViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(unsigned char *)(a1 + 64))
    {
      uint64_t v4 = [WeakRetained _paymentSetupNavigationControllerForProvisioningController:*(void *)(a1 + 32)];
      [v4 setPaymentSetupMode:*(void *)(a1 + 56)];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __98__PKNavigationDashboardPassViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_3;
      v8[3] = &unk_1E59CAEA8;
      id v9 = v3;
      id v10 = v4;
      id v5 = v4;
      [v5 preflightWithCompletion:v8];
    }
    else
    {
      id v6 = *(void **)(a1 + 40);
      if (v6)
      {
        id v7 = v6;
      }
      else
      {
        PKDisplayableErrorForCommonType();
        id v7 = (id)objc_claimAutoreleasedReturnValue();
      }
      id v5 = v7;
      [v3 _handleProvisioningError:v7];
    }
  }
}

uint64_t __98__PKNavigationDashboardPassViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (id)_paymentSetupNavigationControllerForProvisioningController:(id)a3
{
  id v4 = a3;
  id v5 = [[PKPaymentSetupNavigationController alloc] initWithProvisioningController:v4 context:0];

  [(PKPaymentSetupNavigationController *)v5 setGroupsController:self->_groupsController];
  [(PKNavigationController *)v5 setCustomFormSheetPresentationStyleForiPad];
  [(PKPaymentSetupNavigationController *)v5 setSetupDelegate:self];
  [(PKPaymentSetupNavigationController *)v5 setShowsWelcomeViewController:0];

  return v5;
}

- (void)presentAuxiliaryPassInformationItemWithIdentifier:(id)a3 informationIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  id v11 = [(PKPassGroupView *)self->_passGroupView frontmostPassView];
  char v12 = [v11 pass];

  if (v12)
  {
    id v13 = [v12 secureElementPass];
    id v14 = v13;
    if (!v13)
    {
      if (v10) {
        v10[2](v10, 0);
      }
      goto LABEL_28;
    }
    id v15 = [v13 auxiliaryPassInformation];
    id v16 = v15;
    if (!v15 || ![v15 count])
    {
      if (v10) {
        v10[2](v10, 0);
      }
      goto LABEL_27;
    }
    if (v9)
    {
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __126__PKNavigationDashboardPassViewController_presentAuxiliaryPassInformationItemWithIdentifier_informationIdentifier_completion___block_invoke;
      v25[3] = &unk_1E59CFE90;
      id v22 = &v26;
      id v26 = v9;
      id v17 = objc_msgSend(v16, "pk_firstObjectPassingTest:", v25);
      if (v17)
      {
LABEL_7:
        BOOL v18 = [v17 items];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        void v23[2] = __126__PKNavigationDashboardPassViewController_presentAuxiliaryPassInformationItemWithIdentifier_informationIdentifier_completion___block_invoke_2;
        v23[3] = &unk_1E59CFEB8;
        id v24 = v8;
        id v19 = objc_msgSend(v18, "pk_firstObjectPassingTest:", v23);

        if (v19)
        {
          uint64_t v20 = [[PKDashboardAuxiliaryPassInformationViewController alloc] initWithItem:v19 forPass:v14];
          [(PKNavigationDashboardPassViewController *)self pushViewController:v20 animated:1];
          if (v10) {
            v10[2](v10, 1);
          }
        }
        else if (v10)
        {
          v10[2](v10, 0);
        }

LABEL_25:
        if (v9) {

        }
LABEL_27:
LABEL_28:

        goto LABEL_29;
      }
    }
    else
    {
      id v17 = [v16 firstObject];
      if (v17) {
        goto LABEL_7;
      }
    }
    if (v10) {
      v10[2](v10, 0);
    }
    goto LABEL_25;
  }
  id v21 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349314;
    uint64_t v28 = self;
    __int16 v29 = 2080;
    id v30 = "-[PKNavigationDashboardPassViewController presentAuxiliaryPassInformationItemWithIdentifier:informationIdentif"
          "ier:completion:]";
    _os_log_impl(&dword_19F450000, v21, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Frontmost pass is nil", buf, 0x16u);
  }

  if (v10) {
    v10[2](v10, 0);
  }
LABEL_29:
}

uint64_t __126__PKNavigationDashboardPassViewController_presentAuxiliaryPassInformationItemWithIdentifier_informationIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identifier];
  id v4 = *(void **)(a1 + 32);
  id v5 = v3;
  id v6 = v4;
  id v7 = v6;
  if (v5 == v6)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    if (v5 && v6) {
      uint64_t v8 = [v5 isEqualToString:v6];
    }
  }

  return v8;
}

uint64_t __126__PKNavigationDashboardPassViewController_presentAuxiliaryPassInformationItemWithIdentifier_informationIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identifier];
  id v4 = *(void **)(a1 + 32);
  id v5 = v3;
  id v6 = v4;
  id v7 = v6;
  if (v5 == v6)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    if (v5 && v6) {
      uint64_t v8 = [v5 isEqualToString:v6];
    }
  }

  return v8;
}

- (void)presentEditCalendarEvent:(id)a3 eventStore:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F256B8];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  [v9 setEditViewDelegate:self];
  [v9 setEventStore:v7];

  [v9 setEvent:v8];
  [(PKNavigationDashboardPassViewController *)self presentViewController:v9 animated:1 completion:0];
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
}

- (void)presentExistingCalendarEvent:(id)a3 eventStore:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4F256C0];
  id v6 = a3;
  id v8 = objc_alloc_init(v5);
  [v8 setDelegate:self];
  [v8 setEvent:v6];

  id v7 = (void *)[(id)objc_opt_new() initWithRootViewController:v8];
  [(PKNavigationDashboardPassViewController *)self presentViewController:v7 animated:1 completion:0];
}

- (void)eventViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  if ((a4 & 0xFFFFFFFFFFFFFFFDLL) == 0) {
    [a3 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)presentRestrictedGuestAccessScheduleWithHomeIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = (Class (__cdecl *)())getHUScheduleAccessViewControllerClass;
    id v5 = a3;
    id v6 = objc_alloc(v4());
    id v7 = [MEMORY[0x1E4FB1618] labelColor];
    id v8 = (id)[v6 initWithHomeID:v5 tintColor:v7];

    [(PKNavigationDashboardPassViewController *)self pushViewController:v8 animated:1];
  }
}

- (void)performPrecursorPassAction
{
  id v2 = [(PKDashboardViewController *)self->_dashboardVC dataSource];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__PKNavigationDashboardPassViewController_performPrecursorPassAction__block_invoke;
  v4[3] = &unk_1E59CA7D0;
  id v5 = v2;
  id v3 = v2;
  [v3 executeAfterContentIsLoaded:v4];
}

uint64_t __69__PKNavigationDashboardPassViewController_performPrecursorPassAction__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performPrecursorPassAction];
}

- (void)paymentSetupDidFinish:(id)a3
{
}

- (void)_handleProvisioningError:(id)a3
{
  id v4 = +[PKPaymentSetupNavigationController viewControllerForPresentingPaymentError:a3];
  [(PKNavigationDashboardPassViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)peerPaymentActionViewControllerDidCancel:(id)a3
{
}

- (void)peerPaymentActionViewControllerDidPerformAction:(id)a3
{
}

- (void)presentSearch
{
  v8[2] = *MEMORY[0x1E4F143B8];
  [(PKNavigationDashboardPassViewController *)self presentSearchWithCompletion:&__block_literal_global_364];
  uint64_t v3 = *MEMORY[0x1E4F86380];
  uint64_t v4 = *MEMORY[0x1E4F86120];
  v7[0] = *MEMORY[0x1E4F86308];
  v7[1] = v4;
  uint64_t v5 = *MEMORY[0x1E4F86BD8];
  v8[0] = v3;
  v8[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
  [(PKNavigationDashboardPassViewController *)self reportEventForPassIfNecessary:v6];
}

- (void)presentSearchWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__PKNavigationDashboardPassViewController_presentSearchWithCompletion___block_invoke;
  v6[3] = &unk_1E59CA9F8;
  id v7 = v4;
  id v5 = v4;
  [(PKNavigationDashboardPassViewController *)self presentSearchWithQuery:0 completion:v6];
}

uint64_t __71__PKNavigationDashboardPassViewController_presentSearchWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)presentSearchWithQuery:(id)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PKGroup *)self->_group passAtIndex:[(PKGroup *)self->_group frontmostPassIndex]];
  if (!v8)
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349314;
      id v21 = self;
      __int16 v22 = 2080;
      id v23 = "-[PKNavigationDashboardPassViewController presentSearchWithQuery:completion:]";
      _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Frontmost pass is nil", buf, 0x16u);
    }
  }
  id v10 = [(PKDashboardViewController *)self->_dashboardVC dataSource];
  if (!v10)
  {
    id v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349314;
      id v21 = self;
      __int16 v22 = 2080;
      id v23 = "-[PKNavigationDashboardPassViewController presentSearchWithQuery:completion:]";
      _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "PKNavigationDashboardPassViewController (%{public}p): %s: Data source is nil", buf, 0x16u);
    }
  }
  char v12 = [MEMORY[0x1E4F84898] sharedInstance];
  id v13 = [v8 uniqueID];
  int v14 = [v12 supportsSearchForPassUniqueID:v13];

  if (v14)
  {
    objc_initWeak((id *)buf, self);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __77__PKNavigationDashboardPassViewController_presentSearchWithQuery_completion___block_invoke;
    v15[3] = &unk_1E59D13B0;
    objc_copyWeak(&v19, (id *)buf);
    id v18 = v7;
    id v16 = v10;
    id v17 = v6;
    [(PKNavigationDashboardPassViewController *)self _canPresentCreditDetailsViewControllerWithCompletion:v15];

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __77__PKNavigationDashboardPassViewController_presentSearchWithQuery_completion___block_invoke(id *a1, char a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  id v7 = WeakRetained;
  if (WeakRetained && (a2 & 1) != 0)
  {
    *((unsigned char *)WeakRetained + 1664) = 1;
    id v8 = [PKSearchResultsSearchController alloc];
    id v9 = objc_alloc_init(MEMORY[0x1E4F84A88]);
    id v10 = [a1[4] familyCollection];
    id v11 = [(PKSearchResultsSearchController *)v8 initWithPaymentDataProvider:v9 transactionSourceCollection:v5 familyCollection:v10];

    char v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "Calling Search preflight", buf, 2u);
    }

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __77__PKNavigationDashboardPassViewController_presentSearchWithQuery_completion___block_invoke_366;
    v15[3] = &unk_1E59CFAE0;
    objc_copyWeak(&v19, a1 + 7);
    id v18 = a1[6];
    id v13 = v11;
    id v16 = v13;
    id v17 = a1[5];
    [(PKSearchResultsSearchController *)v13 preflightWithCompletion:v15];

    objc_destroyWeak(&v19);
  }
  else
  {
    int v14 = (void (**)(id, void))a1[6];
    if (v14) {
      v14[2](v14, 0);
    }
  }
}

void __77__PKNavigationDashboardPassViewController_presentSearchWithQuery_completion___block_invoke_366(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __77__PKNavigationDashboardPassViewController_presentSearchWithQuery_completion___block_invoke_2;
    aBlock[3] = &unk_1E59CF408;
    void aBlock[4] = WeakRetained;
    id v15 = *(id *)(a1 + 48);
    id v4 = (void (**)(void *, void))_Block_copy(aBlock);
    id v5 = [v3 presentedViewController];

    id v6 = PKLogFacilityTypeGetObject();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Search preflight completed but another VC already presented", buf, 2u);
      }

      v4[2](v4, 0);
    }
    else
    {
      if (v7)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Search preflight completed, presenting now", buf, 2u);
      }

      id v8 = *(void **)(a1 + 32);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __77__PKNavigationDashboardPassViewController_presentSearchWithQuery_completion___block_invoke_367;
      v9[3] = &unk_1E59CE110;
      id v10 = v8;
      id v11 = *(id *)(a1 + 40);
      char v12 = v4;
      [v3 presentViewController:v10 animated:1 completion:v9];
    }
  }
}

uint64_t __77__PKNavigationDashboardPassViewController_presentSearchWithQuery_completion___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1664) = 0;
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __77__PKNavigationDashboardPassViewController_presentSearchWithQuery_completion___block_invoke_367(uint64_t a1)
{
  [*(id *)(a1 + 32) setQuery:*(void *)(a1 + 40)];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

- (void)presentInvitationWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __86__PKNavigationDashboardPassViewController_presentInvitationWithIdentifier_completion___block_invoke;
    v9[3] = &unk_1E59D13D8;
    id v10 = v6;
    id v11 = v8;
    [(PKNavigationDashboardPassViewController *)self presentPassDetailsAnimated:1 handler:v9];
  }
  else if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
  }
}

uint64_t __86__PKNavigationDashboardPassViewController_presentInvitationWithIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  [a2 presentAccountUserInvitationWithIdentifier:*(void *)(a1 + 32)];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)presentSharesList
{
  uint64_t v3 = [(PKGroup *)self->_group passAtIndex:[(PKGroup *)self->_group frontmostPassIndex]];
  id v4 = [v3 secureElementPass];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F85018]);
    id v6 = [MEMORY[0x1E4F84D50] sharedService];
    id v7 = objc_alloc_init(MEMORY[0x1E4F84A88]);
    id v8 = (void *)[v5 initWithPass:v4 webService:v6 paymentServiceProvider:v7 queue:MEMORY[0x1E4F14428]];

    objc_initWeak(location, self);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __60__PKNavigationDashboardPassViewController_presentSharesList__block_invoke;
    v10[3] = &unk_1E59CB010;
    objc_copyWeak(&v12, location);
    id v9 = v8;
    id v11 = v9;
    [v9 updateSharesWithCompletion:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak(location);
  }
  else
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "SharedWith: Tried to present non SE pass!", (uint8_t *)location, 2u);
    }
  }
}

void __60__PKNavigationDashboardPassViewController_presentSharesList__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v2 = [[PKPassSharesListViewController alloc] initWithSharesController:*(void *)(a1 + 32)];
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v2];
    [WeakRetained presentViewController:v3 animated:1 completion:0];
  }
}

- (void)presentShareFlow
{
  uint64_t v3 = [(PKGroup *)self->_group passAtIndex:[(PKGroup *)self->_group frontmostPassIndex]];
  if ([v3 passType] == 1)
  {
    id v4 = [v3 secureElementPass];
    id v5 = objc_alloc(MEMORY[0x1E4F85018]);
    id v6 = [MEMORY[0x1E4F84D50] sharedService];
    id v7 = objc_alloc_init(MEMORY[0x1E4F84A88]);
    id v8 = (void *)[v5 initWithPass:v4 webService:v6 paymentServiceProvider:v7 queue:MEMORY[0x1E4F14428]];

    objc_initWeak(&location, self);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __59__PKNavigationDashboardPassViewController_presentShareFlow__block_invoke;
    v15[3] = &unk_1E59D1400;
    id v9 = v8;
    id v16 = v9;
    objc_copyWeak(&v18, &location);
    id v10 = v4;
    id v17 = v10;
    [v9 updateEntitlementsWithCompletion:v15];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    id v10 = [[PKLinkedApplication alloc] initWithPass:v3];
    id v11 = (void *)MEMORY[0x1E4F9F2E8];
    id v12 = [(PKPassGroupView *)self->_passGroupView frontmostPassView];
    objc_msgSend(v11, "pkui_activityControllerForPass:passView:passLinkedApplication:", v3, v12, v10);
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __59__PKNavigationDashboardPassViewController_presentShareFlow__block_invoke_3;
      v13[3] = &unk_1E59CBF28;
      id v14 = v3;
      [v9 setCompletionWithItemsHandler:v13];
      [(PKNavigationDashboardPassViewController *)self presentViewController:v9 animated:1 completion:0];
    }
  }
}

void __59__PKNavigationDashboardPassViewController_presentShareFlow__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59__PKNavigationDashboardPassViewController_presentShareFlow__block_invoke_2;
  v3[3] = &unk_1E59CE0E8;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  id v4 = *(id *)(a1 + 40);
  [v2 canSendInvitationWithCompletion:v3];

  objc_destroyWeak(&v5);
}

void __59__PKNavigationDashboardPassViewController_presentShareFlow__block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v8)
    {
      id v4 = (PKShareSecureElementPassViewController *)PKAlertForDisplayableErrorWithHandlers(v8, 0, 0, 0);
      id v5 = WeakRetained;
      id v6 = v4;
      uint64_t v7 = 1;
    }
    else
    {
      id v4 = [[PKShareSecureElementPassViewController alloc] initWithSecureElementPass:*(void *)(a1 + 32) environment:0 isFromPeopleScreen:0 delegate:0];
      [(PKShareSecureElementPassViewController *)v4 setModalPresentationStyle:5];
      uint64_t v7 = [(PKShareSecureElementPassViewController *)v4 shouldViewControllerBeAnimatedIn];
      id v5 = WeakRetained;
      id v6 = v4;
    }
    [v5 presentViewController:v6 animated:v7 completion:0];
  }
}

void __59__PKNavigationDashboardPassViewController_presentShareFlow__block_invoke_3(uint64_t a1, void *a2, int a3)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a3)
  {
    [*(id *)(a1 + 32) noteShared];
    uint64_t v6 = *MEMORY[0x1E4F85C78];
    id v8 = @"activity";
    v9[0] = v5;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    MEMORY[0x1A6220EC0](v6, v7);
  }
  else
  {
    MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85C80], 0);
  }
}

- (void)presentRedeemGiftcard
{
  id v4 = [(PKDashboardViewController *)self->_dashboardVC dataSource];
  uint64_t v3 = [v4 appleBalanceAddMoneyUIManager];
  [v3 presentAMSRedeemGiftcardFromViewController:self webViewDelegate:0];
}

- (void)presentAddMoneyAppleBalance
{
  id v4 = [(PKDashboardViewController *)self->_dashboardVC dataSource];
  uint64_t v3 = [v4 appleBalanceAddMoneyUIManager];
  [v3 presentAddMoneyFromViewController:self dtuConfiguration:0 inStoreToken:0];
}

- (void)presentAddMoneyAppleBalanceDirectTopUp
{
  id v4 = [(PKDashboardViewController *)self->_dashboardVC dataSource];
  uint64_t v3 = [v4 appleBalanceAddMoneyUIManager];
  [v3 presentDirectTopUpFromViewController:self context:1 configuration:0 promotion:0 completion:0];
}

- (void)presentAddMoneyAppleBalanceInStoreTopUp
{
  id v4 = [(PKDashboardViewController *)self->_dashboardVC dataSource];
  uint64_t v3 = [v4 appleBalanceAddMoneyUIManager];
  [v3 presentInStoreTopUpFromViewController:self context:0 token:0];
}

- (void)groupView:(id)a3 deleteButtonPressedForPass:(id)a4
{
  objc_storeStrong((id *)&self->_passBeingDeleted, a4);
  id v11 = a4;
  uint64_t v6 = [(PKNavigationDashboardPassViewController *)self view];
  [v6 setUserInteractionEnabled:0];

  uint64_t v7 = [PKPassDeleteAnimationController alloc];
  id v8 = [(PKPassGroupView *)self->_passGroupView frontmostPassView];
  id v9 = [(PKPassDeleteAnimationController *)v7 initWithPassView:v8 groupView:self->_passGroupView];
  deleteAnimationController = self->_deleteAnimationController;
  self->_deleteAnimationController = v9;

  [(PKPassDeleteAnimationController *)self->_deleteAnimationController setDelegate:self];
  [(PKPassDeleteAnimationController *)self->_deleteAnimationController showInViewController:self];
}

- (BOOL)handleDeletePassRequestWithPass:(id)a3 forViewController:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(PKPassGroupView *)self->_passGroupView group];
  if (v7
    && ([v6 uniqueID],
        id v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v7 indexForPassUniqueID:v8],
        v8,
        v9 != 0x7FFFFFFFFFFFFFFFLL))
  {
    objc_storeStrong((id *)&self->_passBeingDeleted, a3);
    id v11 = [(PKNavigationDashboardPassViewController *)self view];
    [v11 setUserInteractionEnabled:0];

    [MEMORY[0x1E4F39CF8] begin];
    id v12 = (void *)MEMORY[0x1E4F39CF8];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    id v17 = __93__PKNavigationDashboardPassViewController_handleDeletePassRequestWithPass_forViewController___block_invoke;
    id v18 = &unk_1E59CA870;
    id v19 = self;
    id v20 = v6;
    [v12 setCompletionBlock:&v15];
    BOOL v10 = 1;
    id v13 = (id)-[PKNavigationDashboardPassViewController popToRootViewControllerAnimated:](self, "popToRootViewControllerAnimated:", 1, v15, v16, v17, v18, v19);
    [MEMORY[0x1E4F39CF8] commit];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

void __93__PKNavigationDashboardPassViewController_handleDeletePassRequestWithPass_forViewController___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 1776);
  uint64_t v3 = [*(id *)(a1 + 40) uniqueID];
  [v2 presentPassWithUniqueID:v3];

  dispatch_time_t v4 = dispatch_time(0, 400000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__PKNavigationDashboardPassViewController_handleDeletePassRequestWithPass_forViewController___block_invoke_2;
  block[3] = &unk_1E59CA7D0;
  void block[4] = *(void *)(a1 + 32);
  dispatch_after(v4, MEMORY[0x1E4F14428], block);
}

uint64_t __93__PKNavigationDashboardPassViewController_handleDeletePassRequestWithPass_forViewController___block_invoke_2(uint64_t a1)
{
  id v2 = [PKPassDeleteAnimationController alloc];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 1776) frontmostPassView];
  uint64_t v4 = [(PKPassDeleteAnimationController *)v2 initWithPassView:v3 groupView:*(void *)(*(void *)(a1 + 32) + 1776)];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 1568);
  *(void *)(v5 + 1568) = v4;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1568), "setDelegate:");
  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 1568);

  return [v7 forceDeleteAnimation];
}

- (void)deleteAnimationControllerWillBeginDeleteAnimation:(id)a3
{
  self->_passDeletionInitiated = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_receiver);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained willDeletePass:self->_passBeingDeleted];
  }
  [(PKDashboardViewController *)self->_dashboardVC shouldPresentAllContent:0 animated:1];
  [(PKNavigationDashboardPassViewController *)self _updatePassFooterView];
}

- (void)deleteAnimationController:(id)a3 didComplete:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = [(PKNavigationDashboardPassViewController *)self view];
  [v6 setUserInteractionEnabled:1];

  self->_passDeletionInitiated = 0;
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_receiver);
    if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
      [WeakRetained didDeletePass:self->_passBeingDeleted];
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = [(PKGroup *)self->_group passes];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = [*(id *)(*((void *)&v20 + 1) + 8 * i) uniqueID];
          id v14 = [(PKPass *)self->_passBeingDeleted uniqueID];
          id v15 = v13;
          id v16 = v14;
          if (v15 == v16)
          {
          }
          else
          {
            id v17 = v16;
            if (v15) {
              BOOL v18 = v16 == 0;
            }
            else {
              BOOL v18 = 1;
            }
            if (v18)
            {

LABEL_22:
              [(PKDashboardViewController *)self->_dashboardVC shouldPresentAllContent:1 animated:1];
              goto LABEL_23;
            }
            char v19 = [v15 isEqualToString:v16];

            if ((v19 & 1) == 0) {
              goto LABEL_22;
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    [(PKNavigationDashboardPassViewController *)self dismissViewControllerAnimated:1 completion:0];
LABEL_23:
  }
}

- (void)dismissDiscoveryArticleViewController:(id)a3 afterActionCompleted:(BOOL)a4 withRelevantPassUniqueIdenitifer:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = 0;
  if (v9 && v6)
  {
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    id v13 = __135__PKNavigationDashboardPassViewController_dismissDiscoveryArticleViewController_afterActionCompleted_withRelevantPassUniqueIdenitifer___block_invoke;
    id v14 = &unk_1E59CDC58;
    id v15 = self;
    id v16 = v8;
    char v18 = 1;
    id v17 = v9;
    uint64_t v10 = _Block_copy(&v11);
  }
  -[PKNavigationDashboardPassViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v10, v11, v12, v13, v14, v15);
}

void __135__PKNavigationDashboardPassViewController_dismissDiscoveryArticleViewController_afterActionCompleted_withRelevantPassUniqueIdenitifer___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) presentingViewController];
  if ([v2 conformsToProtocol:&unk_1EF335A08]) {
    [v2 dismissDiscoveryArticleViewController:*(void *)(a1 + 40) afterActionCompleted:*(unsigned __int8 *)(a1 + 56) withRelevantPassUniqueIdenitifer:*(void *)(a1 + 48)];
  }
}

- (void)foregroundActiveArbiter:(id)a3 didUpdateForegroundActiveState:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL foregroundActive = self->_activeState.foregroundActive;
  self->_activeState = ($77BFE790A1370D46B4241309C9753022)a4;
  if ((*(_WORD *)&a4 & 0xFF00) == 0 || foregroundActive)
  {
    if ((*(_WORD *)&a4 & 0xFF00) == 0 && foregroundActive)
    {
      uint64_t v12 = [(PKDashboardPassViewController *)self->_dashboardVC frontmostPass];
      id v13 = [v12 nfcPayload];
      int v14 = [v13 requiresAuthentication];

      if (v14) {
        [(PKDashboardViewController *)self->_dashboardVC shouldPresentAllContent:0 animated:0];
      }
    }
  }
  else
  {
    [(PKNavigationDashboardPassViewController *)self _ensureCardPresence];
    id v8 = [(PKNavigationDashboardPassViewController *)self topViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v10 = [(PKNavigationDashboardPassViewController *)self topViewController];
      uint64_t v15 = *MEMORY[0x1E4F86308];
      v16[0] = *MEMORY[0x1E4F864A0];
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
      [v10 reportEventForPassIfNecessary:v11];
    }
  }
}

- (void)foregroundActiveArbiter:(id)a3 didUpdateDeactivationReasons:(unsigned int)a4
{
  id v6 = a3;
  unsigned int v7 = self->_deactivationReasons & 0xFFFF6F7F;
  if ((a4 & 0xFFFF6F7F) == 0 && v7)
  {
    id v8 = v6;
    [(PKNavigationDashboardPassViewController *)self _startReportingSessionForPassIfNecessary];
LABEL_7:
    id v6 = v8;
    goto LABEL_8;
  }
  if ((a4 & 0xFFFF6F7F) != 0 && !v7)
  {
    id v8 = v6;
    [(PKNavigationDashboardPassViewController *)self _endReportingSessionForPassIfNecessary];
    goto LABEL_7;
  }
LABEL_8:
  self->_deactivationReasons = a4;
}

- (void)accountAutomaticPaymentsController:(id)a3 didSchedulePayment:(id)a4
{
  id v6 = a4;
  id v9 = [a3 account];
  unsigned int v7 = [MEMORY[0x1E4F84D50] sharedService];
  id v8 = [[PKCreditAccountPaymentDetailsViewController alloc] initWithAccount:v9 payment:v6 paymentWebService:v7 detailViewStyle:0];

  [(PKNavigationDashboardPassViewController *)self pushViewController:v8 animated:1];
}

- (id)presentationSceneIdentifierForAccountAutomaticPaymentsController:(id)a3
{
  uint64_t v3 = [(PKNavigationDashboardPassViewController *)self view];
  BOOL v4 = [v3 window];
  uint64_t v5 = [v4 windowScene];
  id v6 = [v5 _sceneIdentifier];

  return v6;
}

- (void)_startReportingSessionForPassIfNecessary
{
  id v5 = [(PKGroup *)self->_group passAtIndex:[(PKGroup *)self->_group frontmostPassIndex]];
  id v2 = [MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForPass:v5];
  if (v5) {
    BOOL v3 = v2 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    BOOL v4 = [MEMORY[0x1E4F843E0] reporterForSubject:v2];

    if (!v4) {
      [MEMORY[0x1E4F843E0] beginSubjectReporting:v2];
    }
  }
}

- (void)_endReportingSessionForPassIfNecessary
{
  id v4 = [(PKGroup *)self->_group passAtIndex:[(PKGroup *)self->_group frontmostPassIndex]];
  id v2 = [MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForPass:v4];
  if (v4) {
    BOOL v3 = v2 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3) {
    [MEMORY[0x1E4F843E0] endSubjectReporting:v2];
  }
}

- (void)reportEventForPassIfNecessary:(id)a3
{
  id v10 = a3;
  id v4 = [(PKGroup *)self->_group passAtIndex:[(PKGroup *)self->_group frontmostPassIndex]];
  id v5 = [MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForPass:v4];
  if (v10)
  {
    if (v4 && v5 != 0)
    {
      unsigned int v7 = (void *)[v10 mutableCopy];
      [v7 setObject:*MEMORY[0x1E4F86750] forKey:*MEMORY[0x1E4F86730]];
      if ([v4 passType] == 1)
      {
        [v7 setObject:*MEMORY[0x1E4F86888] forKey:*MEMORY[0x1E4F867D0]];
        if ([v4 isPeerPaymentPass]) {
          [v7 setObject:*MEMORY[0x1E4F869F0] forKey:*MEMORY[0x1E4F864C8]];
        }
      }
      id v8 = (void *)MEMORY[0x1E4F843E0];
      id v9 = (void *)[v7 copy];
      [v8 subject:v5 sendEvent:v9];
    }
  }
}

- (void)shouldPromptForReviewOnDismissalWithTrigger:(unint64_t)a3
{
  self->_reviewTrigger = a3;
  self->_shouldPromptForReviewOnDismissal = 1;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (BOOL)footerSuppressed
{
  return self->_footerSuppressed;
}

- (PKPassGroupViewReceiver)receiver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_receiver);

  return (PKPassGroupViewReceiver *)WeakRetained;
}

- (void)setReceiver:(id)a3
{
}

- (PKDashboardPassViewControllerDelegate)passDashboardDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_passDashboardDelegate);

  return (PKDashboardPassViewControllerDelegate *)WeakRetained;
}

- (void)setPassDashboardDelegate:(id)a3
{
}

- (PKDashboardPassViewController)dashboardVC
{
  return self->_dashboardVC;
}

- (PKPassGroupView)passGroupView
{
  return self->_passGroupView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passGroupView, 0);
  objc_storeStrong((id *)&self->_dashboardVC, 0);
  objc_destroyWeak((id *)&self->_passDashboardDelegate);
  objc_destroyWeak((id *)&self->_receiver);
  objc_storeStrong((id *)&self->_postTransactionTimer, 0);
  objc_storeStrong((id *)&self->_paymentIntentController, 0);
  objc_storeStrong((id *)&self->_combinedActionController, 0);
  objc_storeStrong((id *)&self->_actionController, 0);
  objc_storeStrong((id *)&self->_actionGroupController, 0);
  objc_storeStrong((id *)&self->_accountCardNumbersPresenter, 0);
  objc_storeStrong((id *)&self->_cardNumbersButton, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_passFooterView, 0);
  objc_storeStrong((id *)&self->_portalledPassthroughView, 0);
  objc_storeStrong((id *)&self->_passthroughView, 0);
  objc_storeStrong((id *)&self->_passBeingDeleted, 0);
  objc_storeStrong((id *)&self->_deleteAnimationController, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_titlePassView, 0);
  objc_storeStrong((id *)&self->_titlePass, 0);
  objc_destroyWeak((id *)&self->_formerGroupViewDelegate);
  objc_storeStrong((id *)&self->_groupsController, 0);
  objc_storeStrong((id *)&self->_secureElement, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_destroyWeak((id *)&self->_transitioningHandler);

  objc_storeStrong((id *)&self->_interstitialController, 0);
}

@end