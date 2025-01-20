@interface PKPassGroupsViewController
+ (BOOL)isPerformingAction;
+ (void)beginSuppressingFooter;
+ (void)beginTrackingAction;
+ (void)endSuppressingFooter;
+ (void)endTrackingAction;
- (BOOL)_canPerformExternalModalPresentation;
- (BOOL)_canShowWhileLocked;
- (BOOL)areGroupsSeparated;
- (BOOL)assertExpressAvailable;
- (BOOL)groupStackView:(id)a3 requiresHeaderForPassType:(unint64_t)a4 withState:(id *)a5;
- (BOOL)groupStackView:(id)a3 willHaveHeaderViewForPassType:(unint64_t)a4 withState:(id *)a5;
- (BOOL)groupStackView:(id)a3 willHaveSubheaderViewsWithState:(id *)a4;
- (BOOL)groupStackViewShouldAllowReordering:(id)a3;
- (BOOL)groupStackViewShouldShowHeaderViews:(id)a3;
- (BOOL)handleFieldDetection;
- (BOOL)hasDiscoveryCardWithItemIdentifier:(id)a3;
- (BOOL)hasDiscoveryContent;
- (BOOL)inboxVisibleForSectionHeaderView:(id)a3;
- (BOOL)isExternalModalPresentationAllowed;
- (BOOL)isInField;
- (BOOL)isWelcomeStateEnabled;
- (BOOL)passesAreOutdated;
- (BOOL)prefersStatusBarHidden;
- (BOOL)presentSubcredentialPairingFlowIfPossibleWithConfig:(id)a3 animated:(BOOL)a4;
- (BOOL)presentingPass;
- (BOOL)supportsExternalPresentation;
- (PKGroupsController)groupsController;
- (PKPassGroupStackView)groupStackView;
- (PKPassGroupsViewController)init;
- (PKPassGroupsViewController)initWithCoder:(id)a3;
- (PKPassGroupsViewController)initWithGroupsController:(id)a3;
- (PKPassGroupsViewController)initWithGroupsController:(id)a3 style:(int64_t)a4;
- (double)externalPresentationNavigationHeight;
- (id)_appleCardUpsellAlertWithAccount:(id)a3;
- (id)_barcodePassDetailsViewControllerForBarcodePass:(id)a3;
- (id)_cardTemplateInformationForArticleLayouts:(id)a3;
- (id)_makeDiscoveryGalleryViewWithState:(id *)a3;
- (id)_passFromGroupsControllerWithUniqueIdentifier:(id)a3;
- (id)_passPendingActivationToPresent;
- (id)_passToPresent;
- (id)_passWithDeviceAssessmentEducationToPresent;
- (id)_paymentPassDetailsViewControllerForPaymentPass:(id)a3;
- (id)_paymentSetupNavigationControllerForProvisioningController:(id)a3;
- (id)_peerPaymentAccountResolutionController;
- (id)featuredGroup;
- (id)footerForGroupStackView:(id)a3;
- (id)groupAtIndex:(unint64_t)a3;
- (id)groupStackView:(id)a3 headerForPassType:(unint64_t)a4 withState:(id *)a5;
- (id)groupStackView:(id)a3 subheadersWithState:(id *)a4;
- (id)groupsControllerShouldExcludePassesWithUniqueIDsFromFiltering:(id)a3;
- (id)itemIdentifierForFrontmostDiscoveryCard;
- (id)passForSectionHeaderView:(id)a3;
- (id)presentationContextForFieldProperties:(id)a3 fieldPassUniqueIdentifiers:(id)a4 passUniqueIdentifierToPresent:(id *)a5;
- (id)presentedPass;
- (int64_t)preferredStatusBarStyle;
- (int64_t)style;
- (int64_t)visibilityBackdropView:(id)a3 preferredStyleForTraitCollection:(id)a4;
- (unint64_t)inboxBadgeCountForSectionHeaderView:(id)a3;
- (unint64_t)indexOfGroup:(id)a3;
- (unint64_t)indexOfSeparationGroup;
- (unint64_t)numberOfGroups;
- (unint64_t)supportedInterfaceOrientations;
- (unint64_t)suppressedContent;
- (void)_applyPresentationState;
- (void)_beginSuppressingInstanceFooter;
- (void)_clearPassViewedNotificationTimer;
- (void)_endSuppressingInstanceFooterWithContext:(id)a3;
- (void)_handleChildViewControllerRequestingServiceMode:(id)a3;
- (void)_handleExpressNotification;
- (void)_handleFooterSupressionChange:(id)a3;
- (void)_handlePeerPaymentAccountDidChangeNotification:(id)a3;
- (void)_handleProvisioningError:(id)a3;
- (void)_handleStatusBarChange:(id)a3;
- (void)_invalidateForType:(int64_t)a3;
- (void)_localeDidChangeNotification:(id)a3;
- (void)_passViewedNotificationTimerFired;
- (void)_presentAccountTransactionDetailsForTransaction:(id)a3;
- (void)_presentAddPassesControllerWithPasses:(id)a3;
- (void)_presentGroupWithIndex:(unint64_t)a3 context:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6;
- (void)_presentShareRedemptionFlowWithInvitation:(id)a3 handle:(id)a4 referralSource:(id)a5 originalShareURL:(id)a6;
- (void)_presentSubcredentialInvitation:(id)a3 remoteInvite:(id)a4 isShareActivation:(BOOL)a5 referralSource:(id)a6 animated:(BOOL)a7;
- (void)_presentSubcredentialInvitationFlowForPhoneInvitationMessage:(id)a3 isShareActivation:(BOOL)a4 referralSource:(id)a5 animated:(BOOL)a6;
- (void)_presentSubcredentialPairingFlowWithConfig:(id)a3 flowType:(int64_t)a4 animated:(BOOL)a5;
- (void)_presentTransactionDetailsForTransaction:(id)a3 forPaymentPass:(id)a4;
- (void)_presentTransactionDetailsForTransaction:(id)a3 transactionSourceType:(unint64_t)a4;
- (void)_prewarmSemanticTileInformation;
- (void)_regionConfigurationDidChangeNotification;
- (void)_registerForExpressTransactionNotifications:(BOOL)a3;
- (void)_resetWithBackgroundAllowedVCs:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_setupItemForExpressUpgradeWithAsset:(id)a3 hideDisableAction:(unint64_t)a4 pass:(id)a5 reportingMetadata:(id)a6 completionHandler:(id)a7;
- (void)_startPassViewedNotificationTimer;
- (void)_updateFooterSuppressionAnimated:(BOOL)a3;
- (void)_updateFooterSuppressionWithContext:(id)a3;
- (void)_updatePeerPaymentAccount;
- (void)_warnFailForward;
- (void)accountServiceAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5;
- (void)addVASPassWithIdentifier:(id)a3;
- (void)allowIdleTimer;
- (void)applicationMessageView:(id)a3 requestsContentDismissal:(id)a4;
- (void)applicationMessageView:(id)a3 tappedApplicationMessageWithKey:(id)a4;
- (void)applicationMessageViewNeedsRemoval:(id)a3;
- (void)applicationMessageViewNeedsSizeUpdate:(id)a3;
- (void)beginPinningExternalPresentationNavigationHeight;
- (void)dealloc;
- (void)decodeRestorableStateWithCoder:(id)a3;
- (void)didReceivePendingProvisioningUpdate:(id)a3;
- (void)didUpdateApplicationMessages:(id)a3;
- (void)discoveryDataSource:(id)a3 didUpdateArticleLayouts:(id)a4;
- (void)dismissDiscoveryArticleViewController:(id)a3 afterActionCompleted:(BOOL)a4 withRelevantPassUniqueIdenitifer:(id)a5;
- (void)dismissPresentedVCsWithRequirements:(unint64_t)a3 animated:(BOOL)a4 performAction:(id)a5;
- (void)dismissVerificationPageForPassWithDeviceAccountID:(id)a3;
- (void)encodeRestorableStateWithCoder:(id)a3;
- (void)endPinningExternalPresentationNavigationHeight;
- (void)finishedEditingExpiredPass;
- (void)forcePaymentPresentationFromButton:(BOOL)a3;
- (void)foregroundActiveArbiter:(id)a3 didUpdateForegroundActiveState:(id)a4;
- (void)groupStackView:(id)a3 deleteConfirmedForPass:(id)a4;
- (void)groupStackView:(id)a3 didTransitionToState:(int64_t)a4 animated:(BOOL)a5;
- (void)groupStackView:(id)a3 groupDidMoveFromIndex:(unint64_t)a4 toIndex:(unint64_t)a5;
- (void)groupStackView:(id)a3 wantsBottomContentSeparatorWithVisibility:(double)a4 animated:(BOOL)a5;
- (void)groupStackView:(id)a3 wantsTopContentSeparatorWithVisibility:(double)a4 animated:(BOOL)a5;
- (void)groupStackViewDidBeginReordering:(id)a3;
- (void)groupStackViewDidChangeCoachingState:(id)a3;
- (void)groupStackViewDidEndReordering:(id)a3;
- (void)groupStackViewSectionSubheaderView:(id)a3 transitionToViewController:(id)a4;
- (void)groupStackViewWantsPaymentPresentation:(id)a3 fromButton:(BOOL)a4;
- (void)groupsController:(id)a3 didInsertGroup:(id)a4 atIndex:(unint64_t)a5;
- (void)groupsController:(id)a3 didMoveGroup:(id)a4 fromIndex:(unint64_t)a5 toIndex:(unint64_t)a6;
- (void)groupsController:(id)a3 didRemoveGroup:(id)a4 atIndex:(unint64_t)a5;
- (void)inboxDataSourceDidUpdateInboxMessages:(id)a3;
- (void)invalidate;
- (void)invitationViewController:(id)a3 didFinishWithPass:(id)a4;
- (void)loadView;
- (void)partiallyInvalidate;
- (void)passPersonalizationViewController:(id)a3 didFinishPersonalizingPass:(id)a4 success:(BOOL)a5;
- (void)paymentDeviceDidEnterFieldWithProperties:(id)a3;
- (void)paymentDeviceDidExitField;
- (void)paymentServiceReceivedInterruption;
- (void)paymentSetupDidFinish:(id)a3;
- (void)paymentSetupRequestPresentPassUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)peerPaymentAccountResolutionController:(id)a3 requestsDismissCurrentViewControllerAnimated:(BOOL)a4;
- (void)peerPaymentAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5;
- (void)performActionViewControllerDidCancel:(id)a3;
- (void)performActionViewControllerDidPerformAction:(id)a3;
- (void)presentAccountFeature:(unint64_t)a3 animated:(BOOL)a4 destination:(unint64_t)a5 fundingSourceIdentifier:(id)a6 completion:(id)a7;
- (void)presentAccountPromotionForPassUniqueIdentifier:(id)a3 programIdentifier:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)presentAccountServicePaymentWithReferenceIdentifier:(id)a3 forPassWithUniqueID:(id)a4;
- (void)presentAccountServiceSchedulePayment:(id)a3 billPayAmountType:(int64_t)a4 billPayAmount:(id)a5 completion:(id)a6;
- (void)presentActionViewControllerWithUniqueID:(id)a3 actionType:(unint64_t)a4;
- (void)presentAddShareablePassConfiguration:(id)a3 animated:(BOOL)a4;
- (void)presentAppStorePageForItemWithIdentifier:(id)a3;
- (void)presentAppleBalanceAddMoneyAnimated:(BOOL)a3 completion:(id)a4;
- (void)presentAppleBalanceAddMoneyDirectTopUpAnimated:(BOOL)a3 completion:(id)a4;
- (void)presentAppleBalanceAddMoneyInStoreTopUpAnimated:(BOOL)a3 completion:(id)a4;
- (void)presentApplicationWithIdentifier:(id)a3;
- (void)presentAuthorizationFlowAnimated:(BOOL)a3 completion:(id)a4;
- (void)presentAuthorizationViewControllerWithSession:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presentAuxiliaryPassInformationItemDetailForItemIdentifier:(id)a3 informationIdentifier:(id)a4 forPassUniqueID:(id)a5 completion:(id)a6;
- (void)presentBackgroundRefreshConfirmationAnimated:(BOOL)a3;
- (void)presentBalanceDetailsForPassUniqueIdentifier:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presentCreateAccountUserInvitationWithCompletion:(id)a3;
- (void)presentCreditPassAnimated:(BOOL)a3 completion:(id)a4;
- (void)presentDailyCashForPassUniqueIdentifier:(id)a3 dateComponents:(id)a4 redemptionType:(unint64_t)a5 animated:(BOOL)a6 completion:(id)a7;
- (void)presentDefaultPaymentPassInPaymentPresentationFromButton:(BOOL)a3 withAnimated:(BOOL)a4 completionHandler:(id)a5;
- (void)presentDiscoveryArticleForItemWithIdentifier:(id)a3 referrerIdentifier:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)presentEntitlementDetailsForPassUniqueIdentifier:(id)a3;
- (void)presentExpiredPassWithUniqueID:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5;
- (void)presentExpiredPassesAnimated:(BOOL)a3 completionHandler:(id)a4;
- (void)presentExpressUpgradeDetailForPassUniqueID:(id)a3 assetIdentifier:(id)a4 hideDisableAction:(unint64_t)a5 reportingMetadata:(id)a6 animated:(BOOL)a7 completionHandler:(id)a8;
- (void)presentFeatureSetupOrFeaturePass:(unint64_t)a3 referrerIdentifier:(id)a4 presentationContext:(id)a5 completion:(id)a6;
- (void)presentGroupTable;
- (void)presentGroupTableAnimated:(BOOL)a3;
- (void)presentISO18013DetailsForPassUniqueIdentifier:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presentImportSafariCardConsentAnimated:(BOOL)a3 referralSource:(unint64_t)a4 completion:(id)a5;
- (void)presentInitialState:(BOOL *)a3;
- (void)presentInstallmentPlanWithIdentifier:(id)a3 forAccountIdentifier:(id)a4 completion:(id)a5;
- (void)presentInstallmentPlansForFeature:(unint64_t)a3 completion:(id)a4;
- (void)presentInvitationWithIdentifier:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5;
- (void)presentInvitationsForHeaderView:(id)a3;
- (void)presentInvitationsInboxAnimated:(BOOL)a3 completion:(id)a4;
- (void)presentOffscreenAnimated:(BOOL)a3 split:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)presentOffscreenAnimated:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)presentOnscreen:(BOOL)a3 context:(id)a4 withCompletionHandler:(id)a5;
- (void)presentOrderManagementAnimated:(BOOL)a3 completion:(id)a4;
- (void)presentOrderManagementForHeaderView:(id)a3;
- (void)presentPassDetailsAssociatedWithVirtualCardID:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presentPassDetailsForHeaderView:(id)a3;
- (void)presentPassDetailsWithUniqueID:(id)a3 animated:(BOOL)a4 action:(unint64_t)a5 completionHandler:(id)a6;
- (void)presentPassDetailsWithUniqueID:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5;
- (void)presentPassForFeatureIdentifier:(unint64_t)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presentPassWithAssociatedAccountIdentifier:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presentPassWithFieldProperties:(id)a3 fieldMetadata:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6;
- (void)presentPassWithFieldProperties:(id)a3 fieldPassUniqueIdentifiers:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6;
- (void)presentPassWithUniqueID:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5;
- (void)presentPassWithUniqueID:(id)a3 context:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6;
- (void)presentPassWithUpdateUserNotificationIdentifier:(id)a3;
- (void)presentPayLaterFinancingPlanWithIdentifier:(id)a3;
- (void)presentPayLaterPassAnimated:(BOOL)a3 completion:(id)a4;
- (void)presentPaymentSetupController;
- (void)presentPaymentSetupForHeaderView:(id)a3;
- (void)presentPaymentSetupInMode:(int64_t)a3 referrerIdentifier:(id)a4 paymentNetwork:(id)a5 transitNetworkIdentifier:(id)a6 allowedFeatureIdentifiers:(id)a7 productIdentifiers:(id)a8;
- (void)presentPeerPaymentDeviceTapWithInitialAmount:(id)a3 initialMemo:(id)a4;
- (void)presentPeerPaymentPassAnimated:(BOOL)a3 completion:(id)a4;
- (void)presentPeerPaymentRecurringPaymentWithIdentifier:(id)a3;
- (void)presentPeerPaymentSetupWithConfiguration:(id)a3;
- (void)presentPeerPaymentTermsAcceptance;
- (void)presentPeerPaymentTopUp;
- (void)presentPeerPaymentTransferToBank;
- (void)presentPeerPaymentVerifyIdentity;
- (void)presentPileOffscreen;
- (void)presentPrecursorPassUpdateForPassUniqueIdentifier:(id)a3;
- (void)presentProvisioningForPendingProvisioningOfType:(id)a3 identifier:(id)a4;
- (void)presentRewardsHubForPassUniqueIdentifier:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presentRewardsHubMerchantsForPassUniqueIdentifier:(id)a3 privateIdentifier:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)presentSearchWithCompletion:(id)a3;
- (void)presentSearchWithQuery:(id)a3 completion:(id)a4;
- (void)presentSecurePassSessionWithIssuerData:(id)a3 withSignature:(id)a4 animated:(BOOL)a5;
- (void)presentSetupVirtualCardNumberForPassUniqueIdentifier:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presentShareActivationWithShareIdentifier:(id)a3;
- (void)presentShareDetailsForPassUniqueIdentifier:(id)a3 shareIdentifier:(id)a4;
- (void)presentShareInvitationWithMailboxAddress:(id)a3 referralSource:(id)a4 animated:(BOOL)a5;
- (void)presentShareableCredentialWithEncryptedProvisioningTargetsHexEncodedString:(id)a3 passThumbnailImageData:(id)a4 animated:(BOOL)a5;
- (void)presentSpendingSummaryForPassUniqueIdentifier:(id)a3 type:(unint64_t)a4 categorization:(unint64_t)a5 unit:(unint64_t)a6 animated:(BOOL)a7 completion:(id)a8;
- (void)presentSubcredentialInvitationWithIdentifier:(id)a3 remoteDeviceInvitationIdentifier:(id)a4 animated:(BOOL)a5;
- (void)presentTransactionDetailsForBankConnectTransaction:(id)a3 applePayPrimaryAccountIdentifier:(id)a4;
- (void)presentTransactionDetailsForTransactionWithIdentifier:(id)a3;
- (void)presentTransactionDetailsForTransactionWithServiceIdentifier:(id)a3 transactionSourceIdentifier:(id)a4;
- (void)queuePersistentCardEmulation;
- (void)reloadPasses;
- (void)reloadPassesWithCompletion:(id)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewDidScrollToTop:(id)a3;
- (void)setAssertExpressAvailable:(BOOL)a3;
- (void)setExternalModalPresentationAllowed:(BOOL)a3;
- (void)setHandleFieldDetection:(BOOL)a3;
- (void)setNeedsUpdateForGroupStackViewSectionHeaderView:(id)a3;
- (void)setNeedsUpdateForGroupStackViewSectionSubheaderView:(id)a3;
- (void)setPassesAreOutdated:(BOOL)a3;
- (void)setSuppressedContent:(unint64_t)a3;
- (void)setTableModalPresentationEnabled:(BOOL)a3 animated:(BOOL)a4;
- (void)setWelcomeStateEnabled:(BOOL)a3;
- (void)showStatementForIdentifier:(id)a3 passUniqueIdentifier:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)startPaymentPreflight:(id)a3 withPaymentSetupMode:(int64_t)a4 referrerIdentifier:(id)a5 paymentNetworks:(id)a6 transitNetworkIdentifiers:(id)a7 allowedFeatureIdentifiers:(id)a8 productIdentifiers:(id)a9;
- (void)subcredentialProvisioningFlowController:(id)a3 didFinishWithPass:(id)a4 error:(id)a5;
- (void)updateLockscreenIdleTimer;
- (void)updatePassesIfNecessaryWithCompletion:(id)a3;
- (void)updateRegionSupportIfNecessary;
- (void)userCanceledPairingWithSubcredentialProvisioningFlowController:(id)a3;
- (void)viewController:(id)a3 ingestionDidFinishWithResult:(unint64_t)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewTapped:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)virtualCardEnrollmentViewController:(id)a3 didCompleteWithSuccess:(BOOL)a4;
@end

@implementation PKPassGroupsViewController

- (BOOL)prefersStatusBarHidden
{
  return 0;
}

- (void)loadView
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v44.receiver = self;
  v44.super_class = (Class)PKPassGroupsViewController;
  [(PKPassGroupsViewController *)&v44 loadView];
  if (self->_externalModalPresentationAllowed)
  {
    v3 = (UINavigationController *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithNavigationBarClass:0 toolbarClass:0];
    metricController = self->_metricController;
    self->_metricController = v3;

    [(PKPassGroupsViewController *)self addChildViewController:self->_metricController];
    [(UINavigationController *)self->_metricController didMoveToParentViewController:self];
  }
  v5 = [_PKVisibilityBackdropView alloc];
  double v6 = *MEMORY[0x1E4F1DB28];
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v10 = -[_PKVisibilityBackdropView initWithFrame:privateStyle:](v5, "initWithFrame:privateStyle:", -2, *MEMORY[0x1E4F1DB28], v7, v8, v9);
  headerBackground = self->_headerBackground;
  self->_headerBackground = v10;

  [(_UIBackdropView *)self->_headerBackground setAutoGroup:1];
  v12 = -[_PKVisibilityBackdropView initWithFrame:privateStyle:]([_PKVisibilityBackdropView alloc], "initWithFrame:privateStyle:", -2, v6, v7, v8, v9);
  footerBackground = self->_footerBackground;
  self->_footerBackground = v12;

  [(_UIBackdropView *)self->_footerBackground setAutoGroup:1];
  [(_PKVisibilityBackdropView *)self->_footerBackground setHidden:1];
  [(_PKVisibilityBackdropView *)self->_headerBackground setDelegate:self];
  [(_PKVisibilityBackdropView *)self->_footerBackground setDelegate:self];
  v14 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v14 bounds];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;

  v23 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v23 statusBarFrame];
  CGFloat v25 = v24;

  memset(&remainder, 0, sizeof(remainder));
  slice.origin.x = v16;
  slice.origin.y = v18;
  slice.size.width = v20;
  slice.size.height = v22;
  v50.origin.x = v16;
  v50.origin.y = v18;
  v50.size.width = v20;
  v50.size.height = v22;
  CGRectDivide(v50, &slice, &remainder, v25, CGRectMinYEdge);
  v26 = [PKPassGroupStackView alloc];
  v27 = -[PKPassGroupStackView initWithFrame:](v26, "initWithFrame:", remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
  groupStackView = self->_groupStackView;
  self->_groupStackView = v27;

  [(PKPassGroupStackView *)self->_groupStackView setScrollEnabled:0];
  [(PKPassGroupStackView *)self->_groupStackView setDelegate:self];
  [(PKPassGroupStackView *)self->_groupStackView setDatasource:self];
  [(PKPassGroupStackView *)self->_groupStackView setGroupsController:self->_groupsController];
  [(PKPassGroupStackView *)self->_groupStackView setDiscoveryDatasource:self->_discoveryDataSource];
  v29 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v30 = self->_groupStackView;
    *(_DWORD *)buf = 134349312;
    v46 = self;
    __int16 v47 = 2050;
    v48 = v30;
    _os_log_impl(&dword_19F450000, v29, OS_LOG_TYPE_DEFAULT, "PKPassGroupsViewController (%{public}p): created PKPassGroupStackView %{public}p.", buf, 0x16u);
  }

  [(PKPassGroupsViewController *)self _updatePeerPaymentAccount];
  [(PKPassGroupsViewController *)self _prewarmSemanticTileInformation];
  v31 = [(PKPassGroupsViewController *)self view];
  [v31 setAutoresizingMask:0];
  v32 = self->_metricController;
  if (v32)
  {
    v33 = [(UINavigationController *)v32 view];
    [v33 setHidden:1];
    [v33 setAutoresizingMask:0];
    [v31 addSubview:v33];
  }
  [v31 addSubview:self->_groupStackView];
  [v31 addSubview:self->_headerBackground];
  [v31 addSubview:self->_footerBackground];
  int64_t style = self->_style;
  if (style == 1)
  {
    [v31 setOpaque:0];
    [v31 setClipsToBounds:1];
    uint64_t v35 = [MEMORY[0x1E4FB1618] clearColor];
  }
  else
  {
    if (style) {
      goto LABEL_12;
    }
    [v31 setOpaque:1];
    uint64_t v35 = +[PKPassGroupStackView backgroundColor];
  }
  v36 = (void *)v35;
  [v31 setBackgroundColor:v35];

LABEL_12:
  int64_t invalidationStatus = self->_invalidationStatus;
  if (invalidationStatus == 2)
  {
    [(PKPassGroupStackView *)self->_groupStackView setDelegate:0];
    [(PKPassGroupStackView *)self->_groupStackView invalidate];
    int64_t invalidationStatus = self->_invalidationStatus;
  }
  if (!invalidationStatus && PKSecureElementIsAvailable())
  {
    v38 = (PKPaymentService *)[objc_alloc(MEMORY[0x1E4F84C38]) initWithDelegate:self];
    paymentService = self->_paymentService;
    self->_paymentService = v38;

    v40 = self->_paymentService;
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __38__PKPassGroupsViewController_loadView__block_invoke;
    v41[3] = &unk_1E59CB328;
    v41[4] = self;
    [(PKPaymentService *)v40 applicationMessagesWithCompletion:v41];
  }
}

- (int64_t)visibilityBackdropView:(id)a3 preferredStyleForTraitCollection:(id)a4
{
  if (objc_msgSend(a4, "userInterfaceStyle", a3) == 2) {
    return 2030;
  }
  else {
    return 2010;
  }
}

- (void)viewWillLayoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)PKPassGroupsViewController;
  [(PKPassGroupsViewController *)&v20 viewWillLayoutSubviews];
  v3 = [(PKPassGroupsViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [v3 safeAreaInsets];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  metricController = self->_metricController;
  if (metricController)
  {
    double v17 = [(UINavigationController *)metricController view];
    objc_msgSend(v17, "setFrame:", v5, v7, v9, v11);
  }
  memset(&slice, 0, sizeof(slice));
  v18.origin.x = v5;
  v18.origin.y = v7;
  v18.size.width = v9;
  v18.size.height = v11;
  v21.origin.x = v5;
  v21.origin.y = v7;
  v21.size.width = v9;
  v21.size.height = v11;
  CGRectDivide(v21, &slice, &v18, v13, CGRectMinYEdge);
  [(_PKVisibilityBackdropView *)self->_headerBackground frame];
  if (!CGRectEqualToRect(v22, slice)) {
    -[_PKVisibilityBackdropView setFrame:](self->_headerBackground, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  }
  [(PKPassGroupStackView *)self->_groupStackView frame];
  if (!CGRectEqualToRect(v23, v18)) {
    -[PKPassGroupStackView setFrame:](self->_groupStackView, "setFrame:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
  }
  [(PKPassGroupStackView *)self->_groupStackView setTopContentSeparatorHeight:v13];
  CGRectDivide(v18, &slice, &v18, v15, CGRectMaxYEdge);
  -[_PKVisibilityBackdropView setHidden:](self->_footerBackground, "setHidden:", slice.size.height <= 0.0, slice.size.height);
  [(_PKVisibilityBackdropView *)self->_footerBackground frame];
  if (!CGRectEqualToRect(v24, slice)) {
    -[_PKVisibilityBackdropView setFrame:](self->_footerBackground, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  }
}

- (void)_updatePeerPaymentAccount
{
}

- (void)groupStackView:(id)a3 wantsTopContentSeparatorWithVisibility:(double)a4 animated:(BOOL)a5
{
  self->_headerBackgroundVisibility = a4;
  if (self->_viewAppearedBefore) {
    -[_PKVisibilityBackdropView pkui_setVisibility:animated:](self->_headerBackground, "pkui_setVisibility:animated:", a5);
  }
}

- (void)groupStackView:(id)a3 wantsBottomContentSeparatorWithVisibility:(double)a4 animated:(BOOL)a5
{
  self->_footerBackgroundVisibility = a4;
  if (self->_viewAppearedBefore) {
    -[_PKVisibilityBackdropView pkui_setVisibility:animated:](self->_footerBackground, "pkui_setVisibility:animated:", a5);
  }
}

- (unint64_t)indexOfGroup:(id)a3
{
  return [(PKGroupsController *)self->_groupsController indexOfGroup:a3];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (int64_t)preferredStatusBarStyle
{
  return 0;
}

- (id)groupAtIndex:(unint64_t)a3
{
  if ([(PKPassGroupsViewController *)self numberOfGroups] <= a3)
  {
    double v5 = 0;
  }
  else
  {
    double v5 = [(PKGroupsController *)self->_groupsController groupAtIndex:a3];
  }

  return v5;
}

- (unint64_t)numberOfGroups
{
  return [(PKGroupsController *)self->_groupsController groupCount];
}

- (BOOL)groupStackView:(id)a3 willHaveHeaderViewForPassType:(unint64_t)a4 withState:(id *)a5
{
  id v8 = a3;
  if (a4 == 1)
  {
    BOOL v10 = 1;
  }
  else if (a4 || (*((unsigned char *)a5 + 24) & 1) != 0)
  {
    BOOL v10 = 0;
  }
  else
  {
    long long v9 = *((_OWORD *)&a5->var0 + 1);
    v12[0] = *(_OWORD *)&a5->var0.var0;
    v12[1] = v9;
    BOOL v10 = [(PKPassGroupsViewController *)self groupStackView:v8 willHaveHeaderViewForPassType:1 withState:v12];
  }

  return v10;
}

- (BOOL)supportsExternalPresentation
{
  return self->_externalModalPresentationAllowed;
}

- (unint64_t)indexOfSeparationGroup
{
  return [(PKGroupsController *)self->_groupsController indexOfSeparationGroup];
}

- (BOOL)groupStackViewShouldShowHeaderViews:(id)a3
{
  return self->_welcomeStateEnabled;
}

- (BOOL)groupStackView:(id)a3 willHaveSubheaderViewsWithState:(id *)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_applicationMessageView);
  double v7 = WeakRetained;
  if (self->_messages || WeakRetained && ![WeakRetained needsRemoval])
  {
    BOOL v8 = 1;
  }
  else
  {
    discoveryDataSource = self->_discoveryDataSource;
    long long v10 = *((_OWORD *)&a4->var0 + 1);
    v12[0] = *(_OWORD *)&a4->var0.var0;
    v12[1] = v10;
    BOOL v8 = +[PKDiscoveryGalleryView isVisibleForSectionsState:v12 dataSource:discoveryDataSource];
  }

  return v8;
}

- (BOOL)areGroupsSeparated
{
  return [(PKGroupsController *)self->_groupsController shouldSeparatePaymentPasses];
}

- (unint64_t)suppressedContent
{
  return self->_suppressedContent;
}

- (void)_prewarmSemanticTileInformation
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [(PKGroupsController *)self->_groupsController passes];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * v6);
        BOOL v8 = +[PKPassSemanticTileFactory sharedInstance];
        [v8 prewarmTileContentForPass:v7 context:1];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (id)groupStackView:(id)a3 headerForPassType:(unint64_t)a4 withState:(id *)a5
{
  id v8 = a3;
  if (!a4)
  {
    if (!self) {
      goto LABEL_12;
    }
    uint64_t v12 = 0;
    int v9 = 1056;
LABEL_6:
    CGFloat v13 = (id *)((char *)&self->super.super.super.isa + v9);
    id WeakRetained = (PKGSVWalletHeaderView *)objc_loadWeakRetained(v13);
    if (WeakRetained)
    {
      CGFloat v15 = WeakRetained;
      if (![(PKGSVWalletHeaderView *)WeakRetained needsRemoval])
      {
LABEL_10:
        self = v15;

        goto LABEL_12;
      }
    }
    CGFloat v16 = [PKGSVWalletHeaderView alloc];
    long long v17 = *((_OWORD *)&a5->var0 + 1);
    v19[0] = *(_OWORD *)&a5->var0.var0;
    v19[1] = v17;
    CGFloat v15 = [(PKGSVWalletHeaderView *)v16 initWithPassType:a4 state:v19 delegate:self];
    objc_storeWeak(v13, v15);
    [(PKGSVWalletHeaderView *)v15 setHeaderDelegate:self];
    [(PKGSVWalletHeaderView *)v15 setShowBackgroundProvisioningHint:v12 animated:0];
    goto LABEL_10;
  }
  if (a4 == 1)
  {
    int v9 = 1048;
    paymentService = self->_paymentService;
    long long v11 = PKPendingProvisioningBackgroundProvisioningInBuddyTypes();
    uint64_t v12 = [(PKPaymentService *)paymentService hasPendingProvisioningsOfTypes:v11];

    goto LABEL_6;
  }
  self = 0;
LABEL_12:

  return self;
}

- (BOOL)inboxVisibleForSectionHeaderView:(id)a3
{
  return [(PKInboxDataSource *)self->_inboxDataSource inboxVisible];
}

- (unint64_t)inboxBadgeCountForSectionHeaderView:(id)a3
{
  return [(PKInboxDataSource *)self->_inboxDataSource badgeCount];
}

- (id)footerForGroupStackView:(id)a3
{
  int refreshed = PKExpiredPassesRefreshEnabled();
  uint64_t v5 = [PKPGSVFooterView alloc];
  uint64_t v6 = -[PKPGSVFooterView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (refreshed) {
    [(PKPGSVFooterView *)v6 setExpiredSectionCount:[(PKGroupsController *)self->_groupsController expiredSectionPassesCount]];
  }
  [(PKPGSVFooterView *)v6 setDelegate:self];
  [(PKPGSVFooterView *)v6 sizeToFit];
  uint64_t v7 = [(PKPassGroupsViewController *)self view];
  -[PKPGSVFooterView setOpaque:](v6, "setOpaque:", [v7 isOpaque]);
  id v8 = [v7 backgroundColor];
  [(PKPGSVFooterView *)v6 setBackgroundColor:v8];

  return v6;
}

uint64_t __60__PKPassGroupsViewController_updateRegionSupportIfNecessary__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) paymentSetupSupportedInRegion];
}

- (void)presentOffscreenAnimated:(BOOL)a3 withCompletionHandler:(id)a4
{
}

- (void)viewDidAppear:(BOOL)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)PKPassGroupsViewController;
  [(PKPassGroupsViewController *)&v10 viewDidAppear:a3];
  uint64_t v4 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v5 = *MEMORY[0x1E4F87058];
  v13[0] = *MEMORY[0x1E4F87010];
  v13[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  uint64_t v7 = *MEMORY[0x1E4F86730];
  v11[0] = *MEMORY[0x1E4F86308];
  v11[1] = v7;
  uint64_t v8 = *MEMORY[0x1E4F867A0];
  v12[0] = *MEMORY[0x1E4F864A0];
  v12[1] = v8;
  int v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  [v4 subjects:v6 sendEvent:v9];

  if (!self->_viewAppearedBefore)
  {
    self->_viewAppearedBefore = 1;
    [(_PKVisibilityBackdropView *)self->_headerBackground pkui_setVisibility:1 animated:self->_headerBackgroundVisibility];
    [(_PKVisibilityBackdropView *)self->_footerBackground pkui_setVisibility:1 animated:self->_footerBackgroundVisibility];
  }
}

- (PKPassGroupsViewController)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F84740]);
  [v3 setShouldSeparatePaymentPasses:1];
  uint64_t v4 = [(PKPassGroupsViewController *)self initWithGroupsController:v3];

  return v4;
}

- (PKPassGroupsViewController)initWithGroupsController:(id)a3 style:(int64_t)a4
{
  id v7 = a3;
  v37.receiver = self;
  v37.super_class = (Class)PKPassGroupsViewController;
  uint64_t v8 = [(PKPassGroupsViewController *)&v37 initWithNibName:0 bundle:0];
  int v9 = v8;
  if (!v8) {
    goto LABEL_15;
  }
  v8->_int64_t style = a4;
  v8->_BOOL inFailForward = [MEMORY[0x1E4F84FC0] isInFailForward];
  if (!PKSecureElementIsAvailable())
  {
    v9->_hasSecureElement = 0;
    goto LABEL_6;
  }
  BOOL inFailForward = v9->_inFailForward;
  v9->_hasSecureElement = !inFailForward;
  if (inFailForward)
  {
LABEL_6:
    v9->_canAddSecureElementCards = 0;
    goto LABEL_7;
  }
  long long v11 = (void *)MEMORY[0x1E4F84BD0];
  uint64_t v12 = [MEMORY[0x1E4F84D50] sharedService];
  v9->_canAddSecureElementCards = [v11 _isPaymentSetupSupportedForWebService:v12];

LABEL_7:
  objc_storeStrong((id *)&v9->_groupsController, a3);
  [(PKGroupsController *)v9->_groupsController setDelegate:v9];
  [(PKGroupsController *)v9->_groupsController loadGroupsSynchronously];
  v9->_presentationState = 1;
  CGFloat v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  blocksQueuedForUpdateCompletion = v9->_blocksQueuedForUpdateCompletion;
  v9->_blocksQueuedForUpdateCompletion = v13;

  v9->_passesAreOutdated = 0;
  v9->_handleFieldDetection = 1;
  int v15 = PKIsLowEndDevice();
  uint64_t v16 = 512;
  if (!v15) {
    uint64_t v16 = 0;
  }
  v9->_suppressedContent = v16;
  long long v17 = (PKPassLibraryDataProvider *)objc_alloc_init(MEMORY[0x1E4F848A0]);
  passLibraryDataProvider = v9->_passLibraryDataProvider;
  v9->_passLibraryDataProvider = v17;

  uint64_t v19 = [MEMORY[0x1E4F84E00] sharedInstance];
  peerPaymentService = v9->_peerPaymentService;
  v9->_peerPaymentService = (PKPeerPaymentService *)v19;

  uint64_t v21 = [objc_alloc(MEMORY[0x1E4F84678]) initWithDelegate:v9];
  discoveryDataSource = v9->_discoveryDataSource;
  v9->_discoveryDataSource = (PKDiscoveryDataSource *)v21;

  CGRect v23 = [PKContactAvatarManager alloc];
  CGRect v24 = [MEMORY[0x1E4F845E8] defaultContactResolver];
  id v25 = objc_alloc_init(MEMORY[0x1E4F84A88]);
  uint64_t v26 = [(PKContactAvatarManager *)v23 initWithContactResolver:v24 paymentDataProvider:v25];
  avatarManager = v9->_avatarManager;
  v9->_avatarManager = (PKContactAvatarManager *)v26;

  v28 = [[PKInboxDataSource alloc] initWithDelegate:v9];
  inboxDataSource = v9->_inboxDataSource;
  v9->_inboxDataSource = v28;

  v30 = (objc_class *)objc_opt_class();
  v31 = NSStringFromClass(v30);
  [(PKPassGroupsViewController *)v9 setRestorationIdentifier:v31];

  v32 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v32 addObserver:v9 selector:sel__handleStatusBarChange_ name:*MEMORY[0x1E4FB2630] object:0];
  [v32 addObserver:v9 selector:sel__handleFooterSupressionChange_ name:@"PKPassGroupsViewControllerFooterSupressionDidChange" object:0];
  [v32 addObserver:v9 selector:sel__handlePeerPaymentAccountDidChangeNotification_ name:*MEMORY[0x1E4F87CB0] object:v9->_peerPaymentService];
  if ((PKRunningInRemoteContext() & 1) == 0) {
    [v32 addObserver:v9 selector:sel__handleChildViewControllerRequestingServiceMode_ name:@"PKPDVCRequestedServiceMode" object:0];
  }
  v33 = +[PKUIForegroundActiveArbiter sharedInstance];
  v34 = v33;
  if (v33)
  {
    BOOL backgroundMode = ([v33 registerObserver:v9] & 0x100) == 0;
    v9->_BOOL backgroundMode = backgroundMode;
  }
  else
  {
    BOOL backgroundMode = v9->_backgroundMode;
  }
  v9->_expressTransactionNotificationObserver = -1;
  [(PKPassGroupsViewController *)v9 _registerForExpressTransactionNotifications:!backgroundMode];

LABEL_15:
  return v9;
}

- (void)updateRegionSupportIfNecessary
{
  v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Updating region support", buf, 2u);
  }

  id v3 = [MEMORY[0x1E4F84D50] sharedService];
  uint64_t v4 = (void *)MEMORY[0x1E4F84BD0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__PKPassGroupsViewController_updateRegionSupportIfNecessary__block_invoke;
  v6[3] = &unk_1E59CD658;
  id v7 = v3;
  id v5 = v3;
  [v4 configureWebServiceIfNecessary:v5 completion:v6];
}

uint64_t __73__PKPassGroupsViewController__passWithDeviceAssessmentEducationToPresent__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F84D50];
  id v3 = a2;
  uint64_t v4 = [v2 sharedService];
  uint64_t v5 = [v3 supportsDeviceAssessmentAccordingToService:v4];

  return v5;
}

- (PKPassGroupsViewController)initWithGroupsController:(id)a3
{
  return [(PKPassGroupsViewController *)self initWithGroupsController:a3 style:0];
}

- (void)_registerForExpressTransactionNotifications:(BOOL)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3 && !self->_invalidationStatus)
  {
    p_expressTransactionNotificationObserver = &self->_expressTransactionNotificationObserver;
    if (self->_expressTransactionNotificationObserver == -1)
    {
      objc_initWeak(&location, self);
      uint64_t v13 = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      int v15 = __74__PKPassGroupsViewController__registerForExpressTransactionNotifications___block_invoke;
      uint64_t v16 = &unk_1E59CBA90;
      objc_copyWeak(&v17, &location);
      id v7 = _Block_copy(&v13);
      uint64_t v8 = (const char *)objc_msgSend((id)*MEMORY[0x1E4F874B0], "UTF8String", v13, v14, v15, v16);
      int v9 = MEMORY[0x1E4F14428];
      id v10 = MEMORY[0x1E4F14428];
      LODWORD(v9) = notify_register_dispatch(v8, &self->_expressTransactionNotificationObserver, v9, v7) == 0;

      long long v11 = PKLogFacilityTypeGetObject();
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if (v9)
      {
        if (v12)
        {
          *(_DWORD *)buf = 134349056;
          objc_super v20 = self;
          _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "PKPassGroupsViewController (%{public}p): registered for express transaction handling.", buf, 0xCu);
        }
      }
      else
      {
        if (v12)
        {
          *(_DWORD *)buf = 134349056;
          objc_super v20 = self;
          _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "PKPassGroupsViewController (%{public}p): ERROR - failed to register for express transaction notifications!", buf, 0xCu);
        }

        int *p_expressTransactionNotificationObserver = -1;
      }

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }
  else if (self->_expressTransactionNotificationObserver != -1)
  {
    uint64_t v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      objc_super v20 = self;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "PKPassGroupsViewController (%{public}p): unregistered for express transaction handling.", buf, 0xCu);
    }

    uint64_t v5 = &self->_expressTransactionNotificationObserver;
    notify_cancel(*v5);
    int *v5 = -1;
  }
}

- (void)setExternalModalPresentationAllowed:(BOOL)a3
{
  self->_externalModalPresentationAllowed = a3;
}

- (PKGroupsController)groupsController
{
  return self->_groupsController;
}

- (void)presentInitialState:(BOOL *)a3
{
  if (self->_inFailForward) {
    [(PKPassGroupsViewController *)self _warnFailForward];
  }
  if ((unint64_t)([(PKPassGroupStackView *)self->_groupStackView presentationState] - 1) > 2)
  {
    BOOL v6 = 0;
    if (a3) {
LABEL_10:
    }
      *a3 = v6;
  }
  else
  {
    uint64_t v5 = [(PKPassGroupsViewController *)self _passToPresent];
    BOOL v6 = v5 != 0;
    if (v5)
    {
      [(PKPassGroupsViewController *)self presentOffscreenAnimated:0 split:1 withCompletionHandler:0];
      id v7 = [v5 uniqueID];
      [(PKPassGroupsViewController *)self presentPassWithUniqueID:v7 animated:1 completionHandler:0];
    }
    else
    {
      [(PKPassGroupsViewController *)self presentOnscreen:1 context:0 withCompletionHandler:0];
    }

    if (a3) {
      goto LABEL_10;
    }
  }
}

- (id)_passToPresent
{
  id v3 = [(PKPassGroupsViewController *)self _passPendingActivationToPresent];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    BOOL v6 = [(PKPassGroupsViewController *)self _passWithDeviceAssessmentEducationToPresent];
    id v5 = v6;
    if (v6) {
      id v7 = v6;
    }
  }

  return v5;
}

- (id)_passWithDeviceAssessmentEducationToPresent
{
  if (PKHasSeenDeviceAssessmentEducation())
  {
    v2 = 0;
  }
  else
  {
    id v3 = [MEMORY[0x1E4F84898] sharedInstance];
    uint64_t v4 = [v3 passesOfType:1];

    v2 = objc_msgSend(v4, "pk_firstObjectPassingTest:", &__block_literal_global_372);
  }

  return v2;
}

- (id)_passPendingActivationToPresent
{
  if (PKSharedCacheGetBoolForKey())
  {
    v2 = 0;
  }
  else
  {
    id v3 = [MEMORY[0x1E4F84898] sharedInstance];
    uint64_t v4 = [v3 passesPendingActivation];
    if ([v4 count])
    {
      v2 = [v4 firstObject];
      PKSharedCacheSetBoolForKey();
    }
    else
    {
      v2 = 0;
    }
  }

  return v2;
}

- (void)_applyPresentationState
{
  [(PKPassGroupStackView *)self->_groupStackView setPresentationState:self->_presentationState animated:0];
  dispatch_time_t v3 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__PKPassGroupsViewController__applyPresentationState__block_invoke;
  block[3] = &unk_1E59CA7D0;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x1E4F14428], block);
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PKPassGroupsViewController;
  -[PKPassGroupsViewController viewWillAppear:](&v6, sel_viewWillAppear_);
  self->_viewAppeared = 1;
  [(PKPassGroupsViewController *)self _updateFooterSuppressionAnimated:v3];
  [(PKPassGroupStackView *)self->_groupStackView updateHeaderAndSubheaderViewsIfNecessary];
  if (!self->_viewAppearedBefore)
  {
    uint64_t v5 = [(PKGroupsController *)self->_groupsController groupCount];
    [(PKPassGroupStackView *)self->_groupStackView tilePassesEagerly:1];
    if (!v5)
    {
      [(PKPassGroupStackView *)self->_groupStackView setModalGroupIndex:0x7FFFFFFFFFFFFFFFLL];
      self->_presentationState = 4;
    }
    [(PKPassGroupsViewController *)self _applyPresentationState];
  }
  [(PKPassGroupStackView *)self->_groupStackView setPaused:0];
}

- (void)presentOffscreenAnimated:(BOOL)a3 split:(BOOL)a4 withCompletionHandler:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83__PKPassGroupsViewController_presentOffscreenAnimated_split_withCompletionHandler___block_invoke;
  v10[3] = &unk_1E59D4180;
  BOOL v12 = a4;
  BOOL v13 = a3;
  v10[4] = self;
  id v11 = v8;
  id v9 = v8;
  [(PKPassGroupsViewController *)self _presentWithUpdatedPasses:v10];
}

- (void)presentOnscreen:(BOOL)a3 context:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  unint64_t v10 = [(PKPassGroupStackView *)self->_groupStackView modalGroupIndex];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76__PKPassGroupsViewController_presentOnscreen_context_withCompletionHandler___block_invoke;
  v14[3] = &unk_1E59D4158;
  uint64_t v11 = 4;
  v14[4] = self;
  id v15 = v8;
  if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v11 = 5;
  }
  BOOL v18 = a3;
  id v16 = v9;
  uint64_t v17 = v11;
  id v12 = v9;
  id v13 = v8;
  [(PKPassGroupsViewController *)self _presentWithUpdatedPasses:v14];
}

- (void)updatePassesIfNecessaryWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  id v7 = v4;
  if (self->_passesAreOutdated || self->_reloadingPasses)
  {
    if (v4)
    {
      blocksQueuedForUpdateCompletion = self->_blocksQueuedForUpdateCompletion;
      objc_super v6 = (void *)[v4 copy];
      [(NSMutableArray *)blocksQueuedForUpdateCompletion addObject:v6];
    }
    [(PKPassGroupsViewController *)self reloadPasses];
    goto LABEL_6;
  }
  if (v4)
  {
    v4[2](v4);
LABEL_6:
    uint64_t v4 = v7;
  }
}

uint64_t __83__PKPassGroupsViewController_presentOffscreenAnimated_split_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = 2;
  if (*(unsigned char *)(a1 + 48)) {
    uint64_t v1 = 3;
  }
  *(void *)(*(void *)(a1 + 32) + 1096) = v1;
  return [*(id *)(*(void *)(a1 + 32) + 992) setPresentationState:*(void *)(*(void *)(a1 + 32) + 1096) withContext:0 animated:*(unsigned __int8 *)(a1 + 49) completion:*(void *)(a1 + 40)];
}

uint64_t __76__PKPassGroupsViewController_presentOnscreen_context_withCompletionHandler___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 1096) = *(void *)(a1 + 56);
  return [*(id *)(*(void *)(a1 + 32) + 992) setPresentationState:*(void *)(*(void *)(a1 + 32) + 1096) withContext:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 64) completion:*(void *)(a1 + 48)];
}

- (void)_updateFooterSuppressionAnimated:(BOOL)a3
{
  if (self->_persistentCardEmulationQueued)
  {
    BOOL v4 = a3;
    id v7 = objc_alloc_init(PKPassPresentationContext);
    [(PKPassPresentationContext *)v7 setPersistentCardEmulation:1];
    uint64_t v5 = [(PKPassGroupStackView *)self->_groupStackView modalGroupFrontmostPass];
    objc_super v6 = [v5 uniqueID];
    [(PKPassGroupsViewController *)self presentPassWithUniqueID:v6 context:v7 animated:v4 completionHandler:0];
  }
  else
  {
    id v7 = 0;
  }
  [(PKPassGroupsViewController *)self _updateFooterSuppressionWithContext:v7];
}

- (void)_updateFooterSuppressionWithContext:(id)a3
{
  unint64_t v5 = atomic_load(&FooterSuppressionCounter);
  if (v5 || self->_instanceFooterSuppressionCounter)
  {
    uint64_t v6 = 1;
    uint64_t v7 = 1;
  }
  else if (self->_viewAppeared)
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    self->_persistentCardEmulationQueued = 0;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 1;
  }
  [(PKPassGroupStackView *)self->_groupStackView setFooterSuppressed:v6 withContext:a3];
  groupStackView = self->_groupStackView;

  [(PKPassGroupStackView *)groupStackView setExternalFooterSuppressed:v7];
}

uint64_t __68__PKPassGroupsViewController_inboxDataSourceDidUpdateInboxMessages___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 992) updateHeaderAndSubheaderViewsIfNecessary];
}

- (BOOL)passesAreOutdated
{
  return self->_passesAreOutdated;
}

uint64_t __53__PKPassGroupsViewController__applyPresentationState__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 992) tilePassesEagerly:1];
}

- (id)itemIdentifierForFrontmostDiscoveryCard
{
  if ([(PKPassGroupsViewController *)self hasDiscoveryContent]
    && (p_discoveryGalleryView = &self->_discoveryGalleryView,
        id v4 = objc_loadWeakRetained((id *)p_discoveryGalleryView),
        v4,
        v4))
  {
    id WeakRetained = objc_loadWeakRetained((id *)p_discoveryGalleryView);
    uint64_t v6 = [WeakRetained frontmostItemIdentifier];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)hasDiscoveryContent
{
  v2 = [(PKDiscoveryDataSource *)self->_discoveryDataSource articleLayouts];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)viewSafeAreaInsetsDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)PKPassGroupsViewController;
  [(PKPassGroupsViewController *)&v4 viewSafeAreaInsetsDidChange];
  BOOL v3 = [(PKPassGroupsViewController *)self view];
  [v3 layoutIfNeeded];
}

uint64_t __38__PKPassGroupsViewController_loadView__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    BOOL v3 = (void *)[MEMORY[0x1E4F84468] createForMessages:v2];
  }
  else {
    BOOL v3 = 0;
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1240), v3);
  if (v2) {

  }
  objc_super v4 = *(void **)(*(void *)(a1 + 32) + 992);

  return [v4 updateHeaderAndSubheaderViewsIfNecessary];
}

void __38__PKPassGroupsViewController_loadView__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__PKPassGroupsViewController_loadView__block_invoke_2;
  v5[3] = &unk_1E59CA870;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

- (void)groupStackView:(id)a3 didTransitionToState:(int64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v15 = a3;
  if (v5)
  {
    [(PKPassGroupsViewController *)self _clearPassViewedNotificationTimer];
    if (a4 != 7)
    {
      if (a4 != 5)
      {
        if (a4 == 4
          && ![(PKPassGroupStackView *)self->_groupStackView isReordering]
          && ([(PKPassGroupStackView *)self->_groupStackView isDragging] & 1) == 0
          && ([(PKPassGroupStackView *)self->_groupStackView isDecelerating] & 1) == 0)
        {
          [(PKPassGroupStackView *)self->_groupStackView tilePassesEagerly:1];
        }
        goto LABEL_12;
      }
      id v8 = [v15 modalGroupFrontmostPass];
      id v9 = [v8 paymentPass];
      int v10 = [v9 isIdentityPass];

      if (v10)
      {
        uint64_t v11 = [MEMORY[0x1E4F847F8] sharedInstance];
        [v11 fetchRPIdentifierMappingDiscretionary:0 localOnly:0 completionHandler:0];
      }
    }
    [(PKPassGroupsViewController *)self _startPassViewedNotificationTimer];
LABEL_12:
    [(PKPassGroupsViewController *)self updateLockscreenIdleTimer];
  }
  p_applicationMessageView = &self->_applicationMessageView;
  id WeakRetained = objc_loadWeakRetained((id *)p_applicationMessageView);
  if (WeakRetained)
  {

    if ((a4 & 0xFFFFFFFFFFFFFFFDLL) == 5)
    {
      id v14 = objc_loadWeakRetained((id *)p_applicationMessageView);
      [v14 collapse];
    }
  }
}

- (void)setWelcomeStateEnabled:(BOOL)a3
{
  self->_BOOL welcomeStateEnabled = a3;
  [(PKPassGroupStackView *)self->_groupStackView updateHeaderAndSubheaderViewsIfNecessary];
  BOOL welcomeStateEnabled = self->_welcomeStateEnabled;
  BOOL v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v6 = v5;
  if (welcomeStateEnabled)
  {
    [v5 addObserver:self selector:sel__localeDidChangeNotification_ name:*MEMORY[0x1E4F1C370] object:0];

    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:self selector:sel__regionConfigurationDidChangeNotification name:*MEMORY[0x1E4F87E90] object:0];
  }
  else
  {
    [v5 removeObserver:self name:*MEMORY[0x1E4F1C370] object:0];

    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 removeObserver:self name:*MEMORY[0x1E4F87E90] object:0];
  }
}

- (void)inboxDataSourceDidUpdateInboxMessages:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__PKPassGroupsViewController_inboxDataSourceDidUpdateInboxMessages___block_invoke;
  block[3] = &unk_1E59CA7D0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

+ (BOOL)isPerformingAction
{
  unint64_t v2 = atomic_load(&ActionCounter);
  return v2 != 0;
}

+ (void)beginTrackingAction
{
}

+ (void)endTrackingAction
{
  if (!atomic_fetch_add((atomic_ullong *volatile)&ActionCounter, 0xFFFFFFFFFFFFFFFFLL))
  {
    unint64_t v2 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "INVARIANT VIOLATION: attempting to stop tracking a non-existent action.", v3, 2u);
    }

    atomic_fetch_add((atomic_ullong *volatile)&ActionCounter, 1uLL);
  }
}

+ (void)beginSuppressingFooter
{
  if (!atomic_fetch_add((atomic_ullong *volatile)&FooterSuppressionCounter, 1uLL)) {
    dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_104);
  }
}

void __52__PKPassGroupsViewController_beginSuppressingFooter__block_invoke()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"PKPassGroupsViewControllerFooterSupressionDidChange" object:0];
}

+ (void)endSuppressingFooter
{
  unint64_t add = atomic_fetch_add((atomic_ullong *volatile)&FooterSuppressionCounter, 0xFFFFFFFFFFFFFFFFLL);
  if (add == 1)
  {
    id v4 = MEMORY[0x1E4F14428];
    dispatch_async(v4, &__block_literal_global_57_0);
  }
  else if (!add)
  {
    id v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v5 = 0;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "INVARIANT VIOLATION: attempting to end footer suppression when already stopped.", v5, 2u);
    }

    atomic_fetch_add((atomic_ullong *volatile)&FooterSuppressionCounter, 1uLL);
  }
}

void __50__PKPassGroupsViewController_endSuppressingFooter__block_invoke()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"PKPassGroupsViewControllerFooterSupressionDidChange" object:0];
}

- (PKPassGroupsViewController)initWithCoder:(id)a3
{
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"This class is not NSCoding compliant"];

  return [(PKPassGroupsViewController *)self init];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  id v4 = +[PKUIForegroundActiveArbiter sharedInstance];
  [v4 unregisterObserver:self];

  [(PKPassGroupsViewController *)self _registerForExpressTransactionNotifications:0];
  [(PKGroupsController *)self->_groupsController setDelegate:0];
  [(PKPassGroupStackView *)self->_groupStackView setDatasource:0];
  [(PKPassGroupStackView *)self->_groupStackView setDelegate:0];
  [(PKPaymentService *)self->_paymentService setDelegate:0];
  [(NSTimer *)self->_allowDimmingTimer invalidate];
  [(NSTimer *)self->_passViewedNotificationTimer invalidate];
  [(PKPassGroupsViewController *)self invalidate];
  v5.receiver = self;
  v5.super_class = (Class)PKPassGroupsViewController;
  [(PKPassGroupsViewController *)&v5 dealloc];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v14[2] = *MEMORY[0x1E4F143B8];
  objc_super v5 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v6 = *MEMORY[0x1E4F87058];
  v14[0] = *MEMORY[0x1E4F87010];
  v14[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  uint64_t v8 = *MEMORY[0x1E4F86730];
  v12[0] = *MEMORY[0x1E4F86308];
  v12[1] = v8;
  uint64_t v9 = *MEMORY[0x1E4F867A0];
  v13[0] = *MEMORY[0x1E4F864A8];
  v13[1] = v9;
  int v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  [v5 subjects:v7 sendEvent:v10];

  self->_viewAppeared = 0;
  [(PKPassGroupsViewController *)self _updateFooterSuppressionAnimated:v3];
  [(PKPassGroupStackView *)self->_groupStackView setPaused:1];
  v11.receiver = self;
  v11.super_class = (Class)PKPassGroupsViewController;
  [(PKPassGroupsViewController *)&v11 viewDidDisappear:v3];
}

- (void)decodeRestorableStateWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKPassGroupsViewController;
  id v4 = a3;
  [(PKPassGroupsViewController *)&v6 decodeRestorableStateWithCoder:v4];
  objc_super v5 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), @"modalUniqueID", v6.receiver, v6.super_class);

  if (v5) {
    [(PKPassGroupsViewController *)self presentPassWithUniqueID:v5 animated:0 completionHandler:0];
  }
}

- (void)encodeRestorableStateWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPassGroupsViewController;
  [(PKPassGroupsViewController *)&v12 encodeRestorableStateWithCoder:v4];
  int64_t v5 = [(PKPassGroupStackView *)self->_groupStackView presentationState];
  if (v5 == 7
    || ((int64_t v6 = v5,
         BOOL v7 = [(PKPassGroupsViewController *)self _canPerformExternalModalPresentation], v6 == 5)? (v8 = !v7): (v8 = 0), v8 || v6 == 4 && [(PKGroupsController *)self->_groupsController groupCount] == 1))
  {
    uint64_t v9 = [(PKPassGroupStackView *)self->_groupStackView modalGroupFrontmostPass];
    if (!v9)
    {
      if ([(PKGroupsController *)self->_groupsController groupCount])
      {
        int v10 = [(PKGroupsController *)self->_groupsController groupAtIndex:0];
        if ([v10 passCount])
        {
          uint64_t v9 = [v10 passAtIndex:0];
        }
        else
        {
          uint64_t v9 = 0;
        }
      }
      else
      {
        uint64_t v9 = 0;
      }
    }
    objc_super v11 = [v9 uniqueID];
    if (v11) {
      [v4 encodeObject:v11 forKey:@"modalUniqueID"];
    }
  }
}

- (void)finishedEditingExpiredPass
{
  [(PKPassGroupStackView *)self->_groupStackView updateFooterViewIfNecessary];
  groupStackView = self->_groupStackView;

  [(PKPassGroupStackView *)groupStackView setNeedsLayout];
}

- (BOOL)hasDiscoveryCardWithItemIdentifier:(id)a3
{
  p_discoveryGalleryView = &self->_discoveryGalleryView;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_discoveryGalleryView);
  int64_t v6 = [WeakRetained cardViewForCardWithItemIdentifier:v4];

  return v6 != 0;
}

- (id)featuredGroup
{
  if (PKRunningInViewService())
  {
    BOOL v3 = [(PKPeerPaymentService *)self->_peerPaymentService account];
    if (![v3 supportsCardBalancePromotion]) {
      goto LABEL_4;
    }
    id v4 = [v3 cardBalancePromotionFeatureDescriptor];
    int64_t v5 = [v4 minimumAmount];
    int64_t v6 = [v3 currentBalance];
    BOOL v7 = [v6 amount];
    uint64_t v8 = [v5 compare:v7];

    if (v8 != 1)
    {
      groupsController = self->_groupsController;
      objc_super v11 = [v3 associatedPassUniqueID];
      uint64_t v12 = [(PKGroupsController *)groupsController groupIndexForPassUniqueID:v11];

      uint64_t v9 = [(PKGroupsController *)self->_groupsController groupAtIndex:v12];
    }
    else
    {
LABEL_4:
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (BOOL)groupStackView:(id)a3 requiresHeaderForPassType:(unint64_t)a4 withState:(id *)a5
{
  id v8 = a3;
  if (!a4)
  {
    if ((*((unsigned char *)a5 + 16) & 2) == 0)
    {
      long long v10 = *(_OWORD *)&a5->var0;
      uint64_t v11 = *((void *)a5 + 2);
      LODWORD(self) = ![(PKPassGroupsViewController *)self groupStackView:v8 requiresHeaderForPassType:1 withState:&v10];
      goto LABEL_7;
    }
LABEL_6:
    LOBYTE(self) = 0;
    goto LABEL_7;
  }
  if (a4 != 1) {
    goto LABEL_6;
  }
  LOBYTE(self) = self->_hasSecureElement;
LABEL_7:

  return (char)self;
}

- (id)groupStackView:(id)a3 subheadersWithState:(id *)a4
{
  p_applicationMessageView = &self->_applicationMessageView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_applicationMessageView);
  messages = self->_messages;
  if (!((unint64_t)messages | (unint64_t)WeakRetained))
  {
    uint64_t v9 = 0;
    goto LABEL_10;
  }
  uint64_t v9 = (PKApplicationMessageView *)WeakRetained;
  if (!WeakRetained) {
    goto LABEL_5;
  }
  if ([WeakRetained needsRemoval])
  {

    objc_storeWeak((id *)p_applicationMessageView, 0);
    messages = self->_messages;
LABEL_5:
    if (messages)
    {
      long long v10 = [PKApplicationMessageViewConfiguration alloc];
      +[PKDiscoveryCardView compressedWidth];
      uint64_t v11 = -[PKApplicationMessageViewConfiguration initWithWidth:](v10, "initWithWidth:");
      uint64_t v9 = [[PKApplicationMessageView alloc] initWithConfiguration:v11];
      objc_storeWeak((id *)p_applicationMessageView, v9);

      long long v12 = *((_OWORD *)&a4->var0 + 1);
      long long v35 = *(_OWORD *)&a4->var0.var0;
      long long v36 = v12;
      [(PKApplicationMessageView *)v9 setSectionsState:&v35];
      [(PKApplicationMessageView *)v9 setContent:self->_messages animated:0];
      [(PKApplicationMessageView *)v9 bounds];
      double v14 = v13;
      double v16 = v15;
      uint64_t v17 = [(PKApplicationMessageView *)v9 configuration];
      [v17 width];
      double v19 = v18;

      -[PKApplicationMessageView sizeThatFits:](v9, "sizeThatFits:", v19, 1.79769313e308);
      -[PKApplicationMessageView setBounds:](v9, "setBounds:", v14, v16, v20, v21);
      [(PKApplicationMessageView *)v9 layoutIfNeededAnimated:0];
      [(PKApplicationMessageView *)v9 setSubheaderDelegate:self];
      [(PKApplicationMessageView *)v9 setDelegate:self];
      goto LABEL_10;
    }
    uint64_t v9 = 0;
  }
  long long v22 = *((_OWORD *)&a4->var0 + 1);
  long long v35 = *(_OWORD *)&a4->var0.var0;
  long long v36 = v22;
  [(PKApplicationMessageView *)v9 setSectionsState:&v35];
LABEL_10:
  discoveryDataSource = self->_discoveryDataSource;
  long long v24 = *((_OWORD *)&a4->var0 + 1);
  long long v35 = *(_OWORD *)&a4->var0.var0;
  long long v36 = v24;
  if (+[PKDiscoveryGalleryView isVisibleForSectionsState:&v35 dataSource:discoveryDataSource])
  {
    id v25 = objc_loadWeakRetained((id *)&self->_discoveryGalleryView);
    if (v25)
    {
      uint64_t v26 = (uint64_t)v25;
      if (![v25 needsRemoval])
      {
        long long v32 = *((_OWORD *)&a4->var0 + 1);
        long long v35 = *(_OWORD *)&a4->var0.var0;
        long long v36 = v32;
        [(id)v26 setSectionsState:&v35];
        id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v30 = v33;
        if (v9) {
          [v33 addObject:v9];
        }
LABEL_24:
        [v30 addObject:v26];

        goto LABEL_25;
      }

      objc_storeWeak((id *)&self->_discoveryGalleryView, 0);
    }
    long long v27 = *((_OWORD *)&a4->var0 + 1);
    long long v35 = *(_OWORD *)&a4->var0.var0;
    long long v36 = v27;
    uint64_t v26 = [(PKPassGroupsViewController *)self _makeDiscoveryGalleryViewWithState:&v35];
    objc_storeWeak((id *)&self->_discoveryGalleryView, (id)v26);
    v28 = [(id)v26 layer];
    objc_msgSend(v28, "setAnchorPoint:", 0.5, 0.0);

    [(id)v26 setSubheaderDelegate:self];
  }
  else
  {
    uint64_t v26 = 0;
  }
  if (!((unint64_t)v9 | v26))
  {
    v31 = 0;
    goto LABEL_26;
  }
  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v30 = v29;
  if (v9) {
    [v29 addObject:v9];
  }
  if (v26) {
    goto LABEL_24;
  }
LABEL_25:
  v31 = (void *)[v30 copy];

LABEL_26:

  return v31;
}

- (id)_makeDiscoveryGalleryViewWithState:(id *)a3
{
  int64_t v5 = [(PKDiscoveryDataSource *)self->_discoveryDataSource articleLayouts];
  int64_t v6 = [PKDiscoveryGalleryView alloc];
  BOOL v7 = [(PKPassGroupsViewController *)self _cardTemplateInformationForArticleLayouts:v5];
  id v8 = [(PKDiscoveryGalleryView *)v6 initWithCardTemplateInformation:v7];

  [(PKDiscoveryGalleryView *)v8 setDataSource:self->_discoveryDataSource];
  [(PKDiscoveryGalleryView *)v8 updateArticleLayouts:v5];
  long long v9 = *((_OWORD *)&a3->var0 + 1);
  v11[0] = *(_OWORD *)&a3->var0.var0;
  v11[1] = v9;
  [(PKDiscoveryGalleryView *)v8 setSectionsState:v11];
  [(PKDiscoveryGalleryView *)v8 sizeToFit];

  return v8;
}

- (void)beginPinningExternalPresentationNavigationHeight
{
  unsigned int navigationHeightPinCounter = self->_navigationHeightPinCounter;
  if (!navigationHeightPinCounter)
  {
    id v4 = [(UINavigationController *)self->_metricController view];
    [v4 setNeedsLayout];
    [v4 layoutIfNeeded];
    [(PKPassGroupsViewController *)self externalPresentationNavigationHeight];
    self->_pinnedNavigationHeight = v5;

    unsigned int navigationHeightPinCounter = self->_navigationHeightPinCounter;
  }
  self->_unsigned int navigationHeightPinCounter = navigationHeightPinCounter + 1;
}

- (void)endPinningExternalPresentationNavigationHeight
{
}

- (double)externalPresentationNavigationHeight
{
  if (self->_navigationHeightPinCounter) {
    return self->_pinnedNavigationHeight;
  }
  double v3 = 0.0;
  if ([(PKPassGroupsViewController *)self isViewLoaded])
  {
    metricController = self->_metricController;
    if (metricController)
    {
      double v5 = [(UINavigationController *)metricController navigationBar];
      [(PKPassGroupStackView *)self->_groupStackView bounds];
      double v7 = v6;
      groupStackView = self->_groupStackView;
      [v5 bounds];
      -[PKPassGroupStackView convertRect:fromView:](groupStackView, "convertRect:fromView:", v5);
      double v3 = v9 + v10 - v7;
    }
  }
  return v3;
}

- (BOOL)isInField
{
  return self->_inField;
}

- (void)viewTapped:(id)a3
{
  MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85C48], 0, a3);
  if (PKExpiredPassesRefreshEnabled()) {
    id v4 = [[PKExpiredPassesNavigationController alloc] initWithExistingGroupsController:self->_groupsController delegate:self];
  }
  else {
    id v4 = [[PKEditPassesNavigationController alloc] initWithExistingGroupsController:self->_groupsController];
  }
  double v5 = v4;
  [(PKPassGroupsViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)groupStackView:(id)a3 deleteConfirmedForPass:(id)a4
{
  groupsController = self->_groupsController;
  objc_msgSend(a4, "uniqueID", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(PKGroupsController *)groupsController handleUserPassDelete:v5];
}

- (BOOL)groupStackViewShouldAllowReordering:(id)a3
{
  return [(PKGroupsController *)self->_groupsController reorderingEnabled];
}

- (void)groupStackViewDidBeginReordering:(id)a3
{
}

- (void)groupStackViewDidEndReordering:(id)a3
{
}

- (void)groupStackView:(id)a3 groupDidMoveFromIndex:(unint64_t)a4 toIndex:(unint64_t)a5
{
}

- (void)allowIdleTimer
{
  double v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v3 setIdleTimerDisabled:0];

  [(NSTimer *)self->_allowDimmingTimer invalidate];
  allowDimmingTimer = self->_allowDimmingTimer;
  self->_allowDimmingTimer = 0;
}

- (void)updateLockscreenIdleTimer
{
  if ((PKRunningInRemoteContext() & 1) == 0)
  {
    if ([(PKPassGroupStackView *)self->_groupStackView isPresentingPassViewFront]
      && ([(PKPassGroupStackView *)self->_groupStackView modalGroupFrontmostPass],
          (double v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v4 = v3;
      BOOL v5 = [v3 passType] != 1;
    }
    else
    {
      BOOL v5 = 0;
    }
    double v6 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v6 setIdleTimerDisabled:v5];

    [(NSTimer *)self->_allowDimmingTimer invalidate];
    allowDimmingTimer = self->_allowDimmingTimer;
    self->_allowDimmingTimer = 0;

    if (v5)
    {
      id v8 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel_allowIdleTimer selector:0 userInfo:0 repeats:120.0];
      double v9 = self->_allowDimmingTimer;
      self->_allowDimmingTimer = v8;
    }
  }
}

- (void)_handleStatusBarChange:(id)a3
{
  if (self->_viewAppeared)
  {
    id v4 = objc_msgSend(MEMORY[0x1E4FB1438], "sharedApplication", a3);
    BOOL v5 = [v4 applicationState] == 0;
  }
  else
  {
    BOOL v5 = 0;
  }
  id v6 = [(PKPassGroupsViewController *)self view];
  [v6 layoutIfNeeded];
  [(PKPassGroupStackView *)self->_groupStackView layoutContentForCurrentPresentationState:v5];
}

- (void)_startPassViewedNotificationTimer
{
  double v3 = [(PKPassGroupStackView *)self->_groupStackView modalGroupFrontmostPass];
  if (v3)
  {
    id v6 = v3;
    id v4 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__passViewedNotificationTimerFired selector:0 userInfo:0 repeats:5.0];
    passViewedNotificationTimer = self->_passViewedNotificationTimer;
    self->_passViewedNotificationTimer = v4;

    double v3 = v6;
  }
}

- (void)_clearPassViewedNotificationTimer
{
  [(NSTimer *)self->_passViewedNotificationTimer invalidate];
  passViewedNotificationTimer = self->_passViewedNotificationTimer;
  self->_passViewedNotificationTimer = 0;
}

- (void)_passViewedNotificationTimerFired
{
  id v6 = [(PKPassGroupStackView *)self->_groupStackView modalGroupFrontmostPass];
  if (v6)
  {
    double v3 = [MEMORY[0x1E4F84898] sharedInstance];
    id v4 = [v6 uniqueID];
    [v3 notifyPassUsedWithIdentifier:v4 fromSource:1];
  }
  passViewedNotificationTimer = self->_passViewedNotificationTimer;
  self->_passViewedNotificationTimer = 0;
}

- (void)foregroundActiveArbiter:(id)a3 didUpdateForegroundActiveState:(id)a4
{
  unint64_t v4 = *(void *)&a4.var0;
  id v6 = a3;
  if (!self->_backgroundMode != ((v4 >> 8) & 1))
  {
    self->_BOOL backgroundMode = (v4 & 0x100) == 0;
    [(PKPassGroupsViewController *)self _registerForExpressTransactionNotifications:(v4 & 0x100) != 0];
    if (self->_backgroundMode)
    {
      self->_passesAreOutdated = 1;
      [(PKPassGroupsViewController *)self _clearPassViewedNotificationTimer];
      [(PKPassGroupsViewController *)self allowIdleTimer];
    }
    else
    {
      self->_inField = 0;
      double v7 = [(PKPassGroupsViewController *)self _passToPresent];
      id v8 = v7;
      if (v7)
      {
        double v9 = [v7 uniqueID];
        [(PKPassGroupsViewController *)self presentPassWithUniqueID:v9 animated:1 completionHandler:0];
      }
      else
      {
        [(PKPassGroupsViewController *)self _prewarmSemanticTileInformation];
      }
      if (([(PKPassGroupStackView *)self->_groupStackView presentationState] & 0xFFFFFFFFFFFFFFFDLL) == 5)
      {
        [(PKPassGroupsViewController *)self _clearPassViewedNotificationTimer];
        [(PKPassGroupsViewController *)self _startPassViewedNotificationTimer];
      }
      paymentService = self->_paymentService;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      _OWORD v11[2] = __85__PKPassGroupsViewController_foregroundActiveArbiter_didUpdateForegroundActiveState___block_invoke;
      v11[3] = &unk_1E59CB328;
      v11[4] = self;
      [(PKPaymentService *)paymentService applicationMessagesWithCompletion:v11];
      [(PKDiscoveryDataSource *)self->_discoveryDataSource updateArticleLayouts];
      [(PKPassGroupStackView *)self->_groupStackView updateHeaderAndSubheaderViewsIfNecessary];
    }
  }
}

void __85__PKPassGroupsViewController_foregroundActiveArbiter_didUpdateForegroundActiveState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __85__PKPassGroupsViewController_foregroundActiveArbiter_didUpdateForegroundActiveState___block_invoke_2;
  v5[3] = &unk_1E59CA870;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __85__PKPassGroupsViewController_foregroundActiveArbiter_didUpdateForegroundActiveState___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    id v3 = (void *)[MEMORY[0x1E4F84468] createForMessages:v2];
  }
  else {
    id v3 = 0;
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1240), v3);
  if (v2) {

  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1072));
  [WeakRetained setContent:*(void *)(*(void *)(a1 + 32) + 1240) animated:1];

  BOOL v5 = *(void **)(*(void *)(a1 + 32) + 992);

  return [v5 updateHeaderAndSubheaderViewsIfNecessary];
}

- (void)groupStackViewWantsPaymentPresentation:(id)a3 fromButton:(BOOL)a4
{
}

- (void)groupStackViewDidChangeCoachingState:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134349056;
    uint64_t v6 = [a3 coachingState];
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Ignoring coaching feedback: %{public}ld", (uint8_t *)&v5, 0xCu);
  }
}

- (void)passPersonalizationViewController:(id)a3 didFinishPersonalizingPass:(id)a4 success:(BOOL)a5
{
  uint64_t v6 = objc_msgSend(a4, "uniqueID", a3);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __99__PKPassGroupsViewController_passPersonalizationViewController_didFinishPersonalizingPass_success___block_invoke;
  v7[3] = &unk_1E59CB6D8;
  v7[4] = self;
  [(PKPassGroupsViewController *)self presentPassWithUniqueID:v6 animated:1 completionHandler:v7];
}

uint64_t __99__PKPassGroupsViewController_passPersonalizationViewController_didFinishPersonalizingPass_success___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

- (void)scrollViewDidScroll:(id)a3
{
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v11 = a3;
  if (!a4) {
    [(PKPassGroupStackView *)self->_groupStackView tilePassesEagerly:1];
  }
  [v11 contentOffset];
  double v7 = v6;
  [v11 adjustedContentInset];
  double v9 = -v8;
  if (v7 < v9 && v9 - v7 >= 66.0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_applicationMessageView);
    [WeakRetained collapse];
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  [(PKPassGroupStackView *)self->_groupStackView tilePassesEagerly:1];
  groupStackView = self->_groupStackView;

  [(PKPassGroupStackView *)groupStackView noteDidEndScrollingForTesting];
}

- (void)scrollViewDidScrollToTop:(id)a3
{
}

- (void)groupsController:(id)a3 didInsertGroup:(id)a4 atIndex:(unint64_t)a5
{
  if ([(PKPassGroupStackView *)self->_groupStackView presentationState] != 6
    && ([(id)objc_opt_class() isPerformingAction] & 1) == 0)
  {
    [(PKPassGroupStackView *)self->_groupStackView updateHeaderAndSubheaderViewsIfNecessary];
    [(PKPassGroupStackView *)self->_groupStackView stageGroupInPresentationState:2 atIndex:a5];
    groupStackView = self->_groupStackView;
    uint64_t v8 = [(PKPassGroupStackView *)groupStackView presentationState];
    BOOL v9 = !self->_backgroundMode;
    [(PKPassGroupStackView *)groupStackView setPresentationState:v8 animated:v9];
  }
}

- (void)groupsController:(id)a3 didRemoveGroup:(id)a4 atIndex:(unint64_t)a5
{
  id v7 = a4;
  if ([(PKPassGroupStackView *)self->_groupStackView presentationState] != 6)
  {
    if ([(PKPassGroupStackView *)self->_groupStackView presentationState] == 7
      && [(PKPassGroupStackView *)self->_groupStackView modalGroupIndex] == a5)
    {
      [(PKPassGroupsViewController *)self dismissPresentedVCsWithRequirements:0 animated:1 performAction:0];
    }
    [(PKPassGroupStackView *)self->_groupStackView deleteGroup:v7 atIndex:a5];
  }
}

- (void)groupsController:(id)a3 didMoveGroup:(id)a4 fromIndex:(unint64_t)a5 toIndex:(unint64_t)a6
{
  id v9 = a4;
  if ([(PKPassGroupStackView *)self->_groupStackView presentationState] == 4
    && !self->_backgroundMode)
  {
    if (a5 != a6) {
      [(PKPassGroupStackView *)self->_groupStackView moveGroup:v9 fromIndex:a5 toIndex:a6];
    }
  }
  else if ([(PKPassGroupStackView *)self->_groupStackView presentationState] == 5 {
         || [(PKPassGroupStackView *)self->_groupStackView presentationState] == 7)
  }
  {
    [(PKPassGroupStackView *)self->_groupStackView reloadData];
    if ([(PKPassGroupStackView *)self->_groupStackView modalGroupIndex] == a5) {
      [(PKPassGroupStackView *)self->_groupStackView setModalGroupIndex:a6];
    }
    [(PKPassGroupStackView *)self->_groupStackView setPresentationState:[(PKPassGroupStackView *)self->_groupStackView presentationState] animated:!self->_backgroundMode];
  }
}

- (id)groupsControllerShouldExcludePassesWithUniqueIDsFromFiltering:(id)a3
{
  return self->_passUniqueIDsToExcludeFromFiltering;
}

- (void)didUpdateApplicationMessages:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__PKPassGroupsViewController_didUpdateApplicationMessages___block_invoke;
  v6[3] = &unk_1E59CA870;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __59__PKPassGroupsViewController_didUpdateApplicationMessages___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    id v3 = (void *)[MEMORY[0x1E4F84468] createForMessages:v2];
  }
  else {
    id v3 = 0;
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1240), v3);
  if (v2) {

  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1072));
  [WeakRetained setContent:*(void *)(*(void *)(a1 + 32) + 1240) animated:1];

  id v5 = *(void **)(*(void *)(a1 + 32) + 992);

  return [v5 updateHeaderAndSubheaderViewsIfNecessary];
}

- (void)paymentDeviceDidEnterFieldWithProperties:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__PKPassGroupsViewController_paymentDeviceDidEnterFieldWithProperties___block_invoke;
  v6[3] = &unk_1E59CA870;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __71__PKPassGroupsViewController_paymentDeviceDidEnterFieldWithProperties___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1248) = 1;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 1250)
    && (![*(id *)(a1 + 40) secondaryPropertiesRequired]
     || [*(id *)(a1 + 40) secondaryPropertiesAcquired]))
  {
    uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "pkui_frontMostViewController");
    if ([v2 conformsToProtocol:&unk_1EF2FD198])
    {
      if (([v2 suppressFieldDetect] & 1) == 0) {
        goto LABEL_18;
      }
LABEL_14:
      id v7 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Presented view controller supressed field detect", buf, 2u);
      }

      goto LABEL_19;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v3 = [v2 topViewController];
      if ([v3 conformsToProtocol:&unk_1EF2FD198]
        && [v3 suppressFieldDetect])
      {

        goto LABEL_14;
      }
      id v4 = [v2 viewControllers];
      id v5 = [v4 firstObject];

      if (v5 == v3 || ([v5 conformsToProtocol:&unk_1EF2FD198] & 1) == 0)
      {
      }
      else
      {
        int v6 = [v5 suppressFieldDetect];

        if (v6) {
          goto LABEL_14;
        }
      }
    }
LABEL_18:

    uint64_t v8 = [MEMORY[0x1E4F84898] sharedInstance];
    id v9 = *(void **)(a1 + 40);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __71__PKPassGroupsViewController_paymentDeviceDidEnterFieldWithProperties___block_invoke_177;
    v12[3] = &unk_1E59D40B8;
    id v10 = v9;
    uint64_t v11 = *(void *)(a1 + 32);
    id v13 = v10;
    uint64_t v14 = v11;
    [v8 getMetadataForFieldWithProperties:v10 withHandler:v12];

    uint64_t v2 = v13;
LABEL_19:
  }
}

void __71__PKPassGroupsViewController_paymentDeviceDidEnterFieldWithProperties___block_invoke_177(int8x16_t *a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (v3 && ![v3 shouldIgnoreField])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__PKPassGroupsViewController_paymentDeviceDidEnterFieldWithProperties___block_invoke_178;
    block[3] = &unk_1E59CA8E8;
    int8x16_t v8 = a1[2];
    id v7 = (id)v8.i64[0];
    int8x16_t v10 = vextq_s8(v8, v8, 8uLL);
    id v11 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = a1[2].i64[0];
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v6;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Ignoring entered field: %@", buf, 0xCu);
    }
  }
}

void __71__PKPassGroupsViewController_paymentDeviceDidEnterFieldWithProperties___block_invoke_178(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __71__PKPassGroupsViewController_paymentDeviceDidEnterFieldWithProperties___block_invoke_2;
  v3[3] = &unk_1E59CA8E8;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 dismissPresentedVCsWithRequirements:31 animated:1 performAction:v3];
}

uint64_t __71__PKPassGroupsViewController_paymentDeviceDidEnterFieldWithProperties___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentPassWithFieldProperties:*(void *)(a1 + 40) fieldMetadata:*(void *)(a1 + 48) animated:1 completionHandler:0];
}

- (void)paymentDeviceDidExitField
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__PKPassGroupsViewController_paymentDeviceDidExitField__block_invoke;
  block[3] = &unk_1E59CA7D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __55__PKPassGroupsViewController_paymentDeviceDidExitField__block_invoke(uint64_t a1)
{
  v5[2] = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 1248) = 0;
  id v1 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v1 setObject:*MEMORY[0x1E4F863D8] forKeyedSubscript:*MEMORY[0x1E4F86308]];
  [v1 setObject:*MEMORY[0x1E4F867A0] forKeyedSubscript:*MEMORY[0x1E4F86730]];
  uint64_t v2 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v3 = *MEMORY[0x1E4F87058];
  v5[0] = *MEMORY[0x1E4F87010];
  v5[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];
  [v2 subjects:v4 sendEvent:v1];
}

- (void)paymentServiceReceivedInterruption
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PKPassGroupsViewController_paymentServiceReceivedInterruption__block_invoke;
  block[3] = &unk_1E59CA7D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __64__PKPassGroupsViewController_paymentServiceReceivedInterruption__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1248) = 0;
  return result;
}

- (void)didReceivePendingProvisioningUpdate:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__PKPassGroupsViewController_didReceivePendingProvisioningUpdate___block_invoke;
  block[3] = &unk_1E59CA7D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __66__PKPassGroupsViewController_didReceivePendingProvisioningUpdate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1048));

  if (WeakRetained)
  {
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 1080);
    id v4 = PKPendingProvisioningBackgroundProvisioningInBuddyTypes();
    uint64_t v5 = [v3 hasPendingProvisioningsOfTypes:v4];

    id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1048));
    [v6 setShowBackgroundProvisioningHint:v5 animated:1];
  }
}

- (BOOL)presentingPass
{
  return [(PKPassGroupStackView *)self->_groupStackView isPresentingPassViewFront];
}

- (id)presentedPass
{
  if ([(PKPassGroupsViewController *)self presentingPass])
  {
    uint64_t v3 = [(PKPassGroupStackView *)self->_groupStackView modalGroupFrontmostPass];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)_presentGroupWithIndex:(unint64_t)a3 context:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = (void (**)(id, uint64_t))a6;
  [(PKPassGroupsViewController *)self loadViewIfNeeded];
  BOOL v12 = [(PKPassGroupStackView *)self->_groupStackView canPerformPaymentForGroupAtIndex:a3];
  if ([v10 isFieldDetect] & 1) != 0 || (objc_msgSend(v10, "wantsForcedPayment"))
  {
    if (v12) {
      goto LABEL_9;
    }
  }
  else if ([v10 wantsPersistentCardEmulation] & v12)
  {
    goto LABEL_9;
  }
  if (([v10 isPostPayment] & 1) == 0 && self->_externalModalPresentationAllowed)
  {
    int v13 = 0;
    uint64_t v14 = 7;
    goto LABEL_10;
  }
LABEL_9:
  int v13 = 1;
  uint64_t v14 = 5;
LABEL_10:
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v11) {
      v11[2](v11, 1);
    }
  }
  else if ([(PKPassGroupStackView *)self->_groupStackView modalGroupIndex] == a3 {
         && [(PKPassGroupStackView *)self->_groupStackView presentationState] == v14
  }
         && ([v10 isPostPayment] & 1) == 0
         && ![v10 wantsPersistentCardEmulation])
  {
    if (v11) {
      v11[2](v11, 0);
    }
  }
  else
  {
    [(PKPassGroupStackView *)self->_groupStackView presentDiff:0 completion:0];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __88__PKPassGroupsViewController__presentGroupWithIndex_context_animated_completionHandler___block_invoke;
    aBlock[3] = &unk_1E59D40E0;
    aBlock[4] = self;
    unint64_t v25 = a3;
    uint64_t v26 = v14;
    id v24 = v10;
    BOOL v27 = v7;
    double v15 = _Block_copy(aBlock);
    double v16 = [(PKPassGroupsViewController *)self presentedViewController];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && ([v16 isBeingDismissed] & 1) == 0)
    {
      if (v13 && [(PKPassGroupStackView *)self->_groupStackView modalGroupIndex] == a3) {
        [(PKPassGroupStackView *)self->_groupStackView modalPresentationIsPending];
      }
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __88__PKPassGroupsViewController__presentGroupWithIndex_context_animated_completionHandler___block_invoke_3;
      v20[3] = &unk_1E59D4108;
      uint64_t v17 = &v21;
      id v21 = v15;
      long long v22 = v11;
      [(PKPassGroupsViewController *)self dismissViewControllerAnimated:v7 completion:v20];
    }
    else
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __88__PKPassGroupsViewController__presentGroupWithIndex_context_animated_completionHandler___block_invoke_5;
      v18[3] = &unk_1E59CA9F8;
      uint64_t v17 = (id *)&v19;
      double v19 = v11;
      (*((void (**)(void *, void *))v15 + 2))(v15, v18);
    }
  }
}

void __88__PKPassGroupsViewController__presentGroupWithIndex_context_animated_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(*(void *)(a1 + 32) + 992) setModalGroupIndex:*(void *)(a1 + 48)];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void **)(v4 + 992);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = *(unsigned __int8 *)(a1 + 64);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __88__PKPassGroupsViewController__presentGroupWithIndex_context_animated_completionHandler___block_invoke_2;
  v10[3] = &unk_1E59CF408;
  v10[4] = v4;
  id v11 = v3;
  id v9 = v3;
  [v6 setPresentationState:v7 withContext:v5 animated:v8 completion:v10];
}

uint64_t __88__PKPassGroupsViewController__presentGroupWithIndex_context_animated_completionHandler___block_invoke_2(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    *(void *)(*(void *)(a1 + 32) + 1096) = [*(id *)(*(void *)(a1 + 32) + 992) presentationState];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void __88__PKPassGroupsViewController__presentGroupWithIndex_context_animated_completionHandler___block_invoke_3(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __88__PKPassGroupsViewController__presentGroupWithIndex_context_animated_completionHandler___block_invoke_4;
  v2[3] = &unk_1E59CA9F8;
  uint64_t v1 = *(void *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);
}

uint64_t __88__PKPassGroupsViewController__presentGroupWithIndex_context_animated_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __88__PKPassGroupsViewController__presentGroupWithIndex_context_animated_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)forcePaymentPresentationFromButton:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PKPassGroupsViewController *)self presentingPass])
  {
    if ([(PKPassGroupStackView *)self->_groupStackView presentedPassCanPerformPayment]
      && ![(PKPassGroupStackView *)self->_groupStackView presentedPassIsPerformingPayment])
    {
      uint64_t v7 = objc_alloc_init(PKPassPresentationContext);
      [(PKPassPresentationContext *)v7 setForcePayment:1];
      [(PKPassPresentationContext *)v7 setForcedFromButton:v3];
      uint64_t v5 = [(PKPassGroupStackView *)self->_groupStackView modalGroupFrontmostPass];
      id v6 = [v5 uniqueID];
      [(PKPassGroupsViewController *)self presentPassWithUniqueID:v6 context:v7 animated:1 completionHandler:0];
    }
  }
  else
  {
    [(PKPassGroupsViewController *)self presentDefaultPaymentPassInPaymentPresentationFromButton:v3 withAnimated:1 completionHandler:0];
  }
}

- (void)presentDefaultPaymentPassInPaymentPresentationFromButton:(BOOL)a3 withAnimated:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a3;
  id v7 = a5;
  id v9 = objc_alloc_init(PKPassPresentationContext);
  [(PKPassPresentationContext *)v9 setForcePayment:1];
  [(PKPassPresentationContext *)v9 setForcedFromButton:v5];
  uint64_t v8 = [(PKPaymentService *)self->_paymentService defaultPaymentPassUniqueIdentifier];
  [(PKPassGroupsViewController *)self presentPassWithUniqueID:v8 context:v9 animated:1 completionHandler:v7];
}

- (void)presentPassWithUpdateUserNotificationIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __78__PKPassGroupsViewController_presentPassWithUpdateUserNotificationIdentifier___block_invoke;
  v6[3] = &unk_1E59CA870;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  [(PKPassGroupsViewController *)self _presentWithUpdatedPasses:v6];
}

void __78__PKPassGroupsViewController_presentPassWithUpdateUserNotificationIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F84898] sharedInstance];
  BOOL v3 = [v2 diffForPassUpdateUserNotificationWithIdentifier:*(void *)(a1 + 32)];
  id v4 = [v3 passUniqueID];
  if (v4)
  {
    id v5 = *(void **)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __78__PKPassGroupsViewController_presentPassWithUpdateUserNotificationIdentifier___block_invoke_2;
    v8[3] = &unk_1E59CAEA8;
    v8[4] = v5;
    id v9 = v3;
    [v5 presentPassWithUniqueID:v4 animated:1 completionHandler:v8];
  }
  else
  {
    id v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Invalid bulletin URL specified. Ignoring.", v7, 2u);
    }
  }
}

uint64_t __78__PKPassGroupsViewController_presentPassWithUpdateUserNotificationIdentifier___block_invoke_2(uint64_t result, char a2)
{
  if ((a2 & 1) == 0) {
    return [*(id *)(*(void *)(result + 32) + 992) presentDiff:*(void *)(result + 40) completion:0];
  }
  return result;
}

- (void)presentPassWithFieldProperties:(id)a3 fieldMetadata:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v19 = a3;
  id v10 = a4;
  id v11 = a6;
  BOOL v12 = [(PKPassGroupStackView *)self->_groupStackView modalGroupFrontmostPass];
  int v13 = v12;
  BOOL v14 = v12 && [v12 passType] != 1 && PKValueAddedServicesEnabledForPass() == 0;
  double v15 = [(PKPassGroupsViewController *)self presentedViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v16 = v15;
  }
  else {
    id v16 = 0;
  }
  if (-[PKPassGroupStackView isModallyPresentedPassAuthorized](self->_groupStackView, "isModallyPresentedPassAuthorized")|| (([v16 isFrontmostPassAuthorized] | v14) & 1) != 0)
  {
    int64_t v17 = [(PKPassGroupStackView *)self->_groupStackView presentationState];
    self->_presentationState = v17;
    [(PKPassGroupStackView *)self->_groupStackView setPresentationState:v17 withContext:0 animated:v7 completion:v11];
  }
  else
  {
    double v18 = [v10 associatedPassIdentifiers];
    [(PKPassGroupsViewController *)self presentPassWithFieldProperties:v19 fieldPassUniqueIdentifiers:v18 animated:v7 completionHandler:v11];
  }
}

- (void)presentPassWithFieldProperties:(id)a3 fieldPassUniqueIdentifiers:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  BOOL v13 = [(PKPassGroupStackView *)self->_groupStackView isModallyPresentedPassAuthorized];
  groupStackView = self->_groupStackView;
  if (v13)
  {
    int64_t v15 = [(PKPassGroupStackView *)groupStackView presentationState];
    self->_presentationState = v15;
    [(PKPassGroupStackView *)self->_groupStackView setPresentationState:v15 withContext:0 animated:v7 completion:v12];
  }
  else
  {
    id v16 = [(PKPassGroupStackView *)groupStackView modalGroupFrontmostPass];
    int64_t v17 = [v16 uniqueID];
    if (!v17 || ([v11 containsObject:v17] & 1) == 0)
    {
      int64_t v18 = [(PKPassGroupStackView *)self->_groupStackView presentationState];
      self->_presentationState = v18;
      [(PKPassGroupStackView *)self->_groupStackView setPresentationState:v18 animated:v7];
    }

    id v21 = 0;
    id v19 = [(PKPassGroupsViewController *)self presentationContextForFieldProperties:v10 fieldPassUniqueIdentifiers:v11 passUniqueIdentifierToPresent:&v21];
    id v20 = v21;
    if (v19) {
      [(PKPassGroupsViewController *)self presentPassWithUniqueID:v20 context:v19 animated:v7 completionHandler:v12];
    }
    else {
      [(PKPassGroupsViewController *)self presentOnscreen:v7 context:0 withCompletionHandler:v12];
    }
  }
}

- (id)presentationContextForFieldProperties:(id)a3 fieldPassUniqueIdentifiers:(id)a4 passUniqueIdentifierToPresent:(id *)a5
{
  v52[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(PKPassGroupStackView *)self->_groupStackView modalGroupFrontmostPass];
  id v11 = [v10 uniqueID];
  if ([v10 style] == 8) {
    goto LABEL_37;
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v12 setObject:*MEMORY[0x1E4F863D0] forKeyedSubscript:*MEMORY[0x1E4F86308]];
  [v12 setObject:*MEMORY[0x1E4F867A0] forKeyedSubscript:*MEMORY[0x1E4F86730]];
  id v13 = v12;
  id v14 = v10;
  int64_t v15 = v14;
  if (v14) {
    BOOL v16 = v13 == 0;
  }
  else {
    BOOL v16 = 1;
  }
  if (!v16)
  {
    v51 = a5;
    uint64_t v17 = [v14 passType];
    int64_t v18 = (id *)MEMORY[0x1E4F86D78];
    if ((unint64_t)(v17 + 1) >= 3) {
      id v19 = (__CFString *)(id)*MEMORY[0x1E4F86D78];
    }
    else {
      id v19 = off_1E59D50F8[v17 + 1];
    }
    [v13 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F867E8]];

    unint64_t v20 = [v15 style];
    if (v20 < 0xD && ((0x13FFu >> v20) & 1) != 0) {
      id v21 = off_1E59D5110[v20];
    }
    else {
      id v21 = (__CFString *)*v18;
    }
    [v13 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F867E0]];

    long long v22 = [v15 nfcPayload];
    PKAnalyticsReportSwitchToggleResultValue();
    CGRect v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    [v13 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F867A8]];

    id v24 = v15;
    if ([v24 passType] == 1)
    {
      unint64_t v25 = [v24 secureElementPass];
      unint64_t v26 = [v25 cardType];
      if (v26 <= 4) {
        CGRect v23 = (__CFString *)**((id **)&unk_1E59D5178 + v26);
      }
    }
    else
    {
      CGRect v23 = @"other";
    }

    [v13 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F867D0]];
    BOOL v27 = [v24 secureElementPass];
    if ([v27 isIdentityPass])
    {
      uint64_t v28 = [v27 identityType];
      if ((unint64_t)(v28 - 1) < 3)
      {
        id v29 = off_1E59D51A0[v28 - 1];
        goto LABEL_25;
      }
    }
    else if ([v27 isAccessPass])
    {
      unint64_t v30 = [v27 accessType];
      if (v30 < 7)
      {
        id v29 = off_1E59D51B8[v30];
        goto LABEL_25;
      }
    }
    id v29 = (__CFString *)*v18;
LABEL_25:

    [v13 setObject:v29 forKeyedSubscript:*MEMORY[0x1E4F867C8]];
    v31 = [v24 secureElementPass];
    long long v32 = [v31 devicePaymentApplications];
    [v32 count];

    id v33 = PKAnalyticsReportSwitchToggleResultValue();

    [v13 setObject:v33 forKeyedSubscript:*MEMORY[0x1E4F861A0]];
    v34 = [v24 secureElementPass];
    id v35 = (id)*MEMORY[0x1E4F86D78];
    long long v36 = [v34 organizationName];
    if ([v36 length])
    {
      unint64_t v37 = [v34 cardType];
      if (v37 <= 4 && ((1 << v37) & 0x16) != 0)
      {
        id v38 = v36;

        id v35 = v38;
      }
    }

    [v13 setObject:v35 forKeyedSubscript:*MEMORY[0x1E4F865A0]];
    a5 = v51;
  }

  id v39 = v13;
  unint64_t v40 = [v8 terminalType];
  if (v40 <= 5)
  {
    v41 = (void *)MEMORY[0x1E4F86B20];
    if (((1 << v40) & 0x2D) == 0)
    {
      uint64_t v42 = *MEMORY[0x1E4F86B20];
      if (v40 != 1) {
        [v39 setObject:@"identity" forKeyedSubscript:*MEMORY[0x1E4F86B20]];
      }
      [v39 setObject:@"payment" forKeyedSubscript:v42];
    }
    [v39 setObject:*MEMORY[0x1E4F86708] forKeyedSubscript:*v41];
  }

  v43 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v44 = *MEMORY[0x1E4F87058];
  v52[0] = *MEMORY[0x1E4F87010];
  v52[1] = v44;
  v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:2];
  [v43 subjects:v45 sendEvent:v39];

LABEL_37:
  if (v11 && ([v9 containsObject:v11] & 1) != 0
    || ([v9 firstObject],
        uint64_t v46 = objc_claimAutoreleasedReturnValue(),
        v11,
        (id v11 = (void *)v46) != 0))
  {
    uint64_t v47 = [v8 valueAddedServiceMode];
    v48 = objc_msgSend(v9, "pk_arrayByRemovingObject:", v11);
    uint64_t v49 = +[PKPassPresentationContext contextWithWasAutomaticallySelected:additionalPassUniqueIdentifiers:userInfo:terminalType:](PKPassPresentationContext, "contextWithWasAutomaticallySelected:additionalPassUniqueIdentifiers:userInfo:terminalType:", (unint64_t)(v47 - 2) < 3, v48, 0, [v8 terminalType]);
    [v49 setFieldDetect:1];
    if (a5) {
      *a5 = v11;
    }
  }
  else
  {
    uint64_t v49 = 0;
  }

  return v49;
}

- (void)reloadPassesWithCompletion:(id)a3
{
  self->_passesAreOutdated = 1;
  [(PKPassGroupsViewController *)self updatePassesIfNecessaryWithCompletion:a3];
}

- (void)reloadPasses
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!self->_reloadingPasses)
  {
    groupsController = self->_groupsController;
    self->_reloadingPasses = groupsController != 0;
    if (groupsController)
    {
      id v4 = self->_groupsController;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __42__PKPassGroupsViewController_reloadPasses__block_invoke;
      v15[3] = &unk_1E59CA7D0;
      v15[4] = self;
      [(PKGroupsController *)v4 reloadGroupsWithCompletion:v15];
    }
    else
    {
      id v5 = (void *)[(NSMutableArray *)self->_blocksQueuedForUpdateCompletion copy];
      [(NSMutableArray *)self->_blocksQueuedForUpdateCompletion removeAllObjects];
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      id v6 = v5;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v12;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v12 != v9) {
              objc_enumerationMutation(v6);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v10) + 16))(*(void *)(*((void *)&v11 + 1) + 8 * v10));
            ++v10;
          }
          while (v8 != v10);
          uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
        }
        while (v8);
      }
    }
  }
}

void __42__PKPassGroupsViewController_reloadPasses__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 1249) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 1139) = 0;
  uint64_t v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 1120) copy];
  [*(id *)(*(void *)(a1 + 32) + 1120) removeAllObjects];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v7) + 16))(*(void *)(*((void *)&v8 + 1) + 8 * v7));
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)queuePersistentCardEmulation
{
  self->_persistentCardEmulationQueued = 1;
}

- (void)presentPaymentSetupInMode:(int64_t)a3 referrerIdentifier:(id)a4 paymentNetwork:(id)a5 transitNetworkIdentifier:(id)a6 allowedFeatureIdentifiers:(id)a7 productIdentifiers:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (self->_welcomeStateEnabled && !self->_inFailForward)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __160__PKPassGroupsViewController_presentPaymentSetupInMode_referrerIdentifier_paymentNetwork_transitNetworkIdentifier_allowedFeatureIdentifiers_productIdentifiers___block_invoke;
    aBlock[3] = &unk_1E59D4130;
    aBlock[4] = self;
    id v27 = v16;
    id v28 = v15;
    int64_t v32 = a3;
    id v29 = v14;
    id v30 = v17;
    id v31 = v18;
    id v19 = (void (**)(void))_Block_copy(aBlock);
    unint64_t v20 = [(PKPassGroupsViewController *)self presentedViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (![v20 isBeingDismissed])
      {
LABEL_9:

        goto LABEL_10;
      }
      id v21 = [(PKPassGroupsViewController *)self transitionCoordinator];
      if (v21)
      {
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __160__PKPassGroupsViewController_presentPaymentSetupInMode_referrerIdentifier_paymentNetwork_transitNetworkIdentifier_allowedFeatureIdentifiers_productIdentifiers___block_invoke_3;
        v22[3] = &unk_1E59D04E8;
        CGRect v23 = v19;
        [v21 animateAlongsideTransition:0 completion:v22];
      }
      else
      {
        v19[2](v19);
      }
    }
    else
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __160__PKPassGroupsViewController_presentPaymentSetupInMode_referrerIdentifier_paymentNetwork_transitNetworkIdentifier_allowedFeatureIdentifiers_productIdentifiers___block_invoke_2;
      v24[3] = &unk_1E59CAA98;
      unint64_t v25 = v19;
      [(PKPassGroupsViewController *)self dismissPresentedVCsWithRequirements:0 animated:1 performAction:v24];
      id v21 = v25;
    }

    goto LABEL_9;
  }
LABEL_10:
}

void __160__PKPassGroupsViewController_presentPaymentSetupInMode_referrerIdentifier_paymentNetwork_transitNetworkIdentifier_allowedFeatureIdentifiers_productIdentifiers___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(*(void *)(a1 + 32) + 992) headerForPassType:1];
  if (*(void *)(a1 + 40)) {
    uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", *(void *)(a1 + 40), 0);
  }
  else {
    uint64_t v2 = 0;
  }
  if (*(void *)(a1 + 48)) {
    id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", *(void *)(a1 + 48), 0);
  }
  else {
    id v3 = 0;
  }
  if (v4) {
    [*(id *)(a1 + 32) startPaymentPreflight:v4 withPaymentSetupMode:*(void *)(a1 + 80) referrerIdentifier:*(void *)(a1 + 56) paymentNetworks:v3 transitNetworkIdentifiers:v2 allowedFeatureIdentifiers:*(void *)(a1 + 64) productIdentifiers:*(void *)(a1 + 72)];
  }
}

uint64_t __160__PKPassGroupsViewController_presentPaymentSetupInMode_referrerIdentifier_paymentNetwork_transitNetworkIdentifier_allowedFeatureIdentifiers_productIdentifiers___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __160__PKPassGroupsViewController_presentPaymentSetupInMode_referrerIdentifier_paymentNetwork_transitNetworkIdentifier_allowedFeatureIdentifiers_productIdentifiers___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)presentPileOffscreen
{
  if (![(PKPassGroupStackView *)self->_groupStackView pilingMode])
  {
    groupStackView = self->_groupStackView;
    [(PKPassGroupStackView *)groupStackView setPilingMode:1];
  }
}

- (void)presentGroupTable
{
}

- (void)presentGroupTableAnimated:(BOOL)a3
{
  [(PKPassGroupStackView *)self->_groupStackView setModalGroupIndex:0x7FFFFFFFFFFFFFFFLL];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__PKPassGroupsViewController_presentGroupTableAnimated___block_invoke;
  void v5[3] = &unk_1E59CDA78;
  v5[4] = self;
  BOOL v6 = a3;
  [(PKPassGroupsViewController *)self _presentWithUpdatedPasses:v5];
}

uint64_t __56__PKPassGroupsViewController_presentGroupTableAnimated___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 1096) = 4;
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 1137)) {
    return [*(id *)(v1 + 992) setPresentationState:*(void *)(v1 + 1096) animated:*(unsigned __int8 *)(result + 40)];
  }
  return result;
}

- (void)setTableModalPresentationEnabled:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)presentPassWithUniqueID:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
}

- (void)presentPassDetailsWithUniqueID:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
}

- (void)presentPassDetailsWithUniqueID:(id)a3 animated:(BOOL)a4 action:(unint64_t)a5 completionHandler:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  long long v12 = [(PKPassGroupsViewController *)self _passFromGroupsControllerWithUniqueIdentifier:v10];
  uint64_t v13 = [v12 passType];
  BOOL v14 = v13 == 1;
  if (v12 && (v13 != 1 || !self->_inFailForward))
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __95__PKPassGroupsViewController_presentPassDetailsWithUniqueID_animated_action_completionHandler___block_invoke_2;
    v16[3] = &unk_1E59D41A8;
    BOOL v20 = v8;
    v16[4] = self;
    unint64_t v19 = a5;
    id v18 = v11;
    BOOL v21 = v14;
    id v17 = v12;
    [(PKPassGroupsViewController *)self presentPassWithUniqueID:v10 animated:v8 completionHandler:v16];

    id v15 = v18;
    goto LABEL_7;
  }
  if ([(PKGroupsController *)self->_groupsController containsExpiredPassWithUniqueID:v10])
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __95__PKPassGroupsViewController_presentPassDetailsWithUniqueID_animated_action_completionHandler___block_invoke;
    v22[3] = &unk_1E59CA9F8;
    id v23 = v11;
    [(PKPassGroupsViewController *)self presentExpiredPassWithUniqueID:v10 animated:v8 completionHandler:v22];
    id v15 = v23;
LABEL_7:

    goto LABEL_10;
  }
  if (v11) {
    (*((void (**)(id, uint64_t))v11 + 2))(v11, 1);
  }
LABEL_10:
}

uint64_t __95__PKPassGroupsViewController_presentPassDetailsWithUniqueID_animated_action_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __95__PKPassGroupsViewController_presentPassDetailsWithUniqueID_animated_action_completionHandler___block_invoke_2(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v5 = [*(id *)(a1 + 32) presentedViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v5 presentPassDetailsAnimated:*(unsigned __int8 *)(a1 + 64) action:*(void *)(a1 + 56)];
      uint64_t v6 = *(void *)(a1 + 48);
      if (v6) {
        (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
      }
      goto LABEL_18;
    }
    uint64_t v7 = *(void **)(a1 + 32);
    if (*(unsigned char *)(a1 + 65))
    {
      BOOL v8 = [*(id *)(a1 + 40) paymentPass];
      long long v9 = [v7 _paymentPassDetailsViewControllerForPaymentPass:v8];

      if (v9)
      {
LABEL_11:
        id v10 = [[PKNavigationController alloc] initWithRootViewController:v9];
        if (v5) {
          [*(id *)(a1 + 32) dismissViewControllerAnimated:0 completion:0];
        }
        id v11 = *(void **)(a1 + 32);
        uint64_t v12 = *(unsigned __int8 *)(a1 + 64);
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __95__PKPassGroupsViewController_presentPassDetailsWithUniqueID_animated_action_completionHandler___block_invoke_3;
        void v14[3] = &unk_1E59CAA98;
        id v15 = *(id *)(a1 + 48);
        [v11 presentViewController:v10 animated:v12 completion:v14];

LABEL_17:
LABEL_18:

        return;
      }
    }
    else
    {
      long long v9 = [*(id *)(a1 + 32) _barcodePassDetailsViewControllerForBarcodePass:*(void *)(a1 + 40)];
      if (v9) {
        goto LABEL_11;
      }
    }
    uint64_t v13 = *(void *)(a1 + 48);
    if (v13) {
      (*(void (**)(uint64_t, uint64_t))(v13 + 16))(v13, 1);
    }
    goto LABEL_17;
  }
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3)
  {
    id v4 = *(void (**)(void))(v3 + 16);
    v4();
  }
}

uint64_t __95__PKPassGroupsViewController_presentPassDetailsWithUniqueID_animated_action_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)presentISO18013DetailsForPassUniqueIdentifier:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
}

- (void)presentImportSafariCardConsentAnimated:(BOOL)a3 referralSource:(unint64_t)a4 completion:(id)a5
{
  BOOL v6 = a3;
  BOOL v8 = (void (**)(id, void))a5;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __95__PKPassGroupsViewController_presentImportSafariCardConsentAnimated_referralSource_completion___block_invoke;
  aBlock[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v21, &location);
  long long v9 = (void (**)(void))_Block_copy(aBlock);
  if (PKSafariCredentialProvisioningConsented() == 1)
  {
    v9[2](v9);
    if (v8) {
      v8[2](v8, 0);
    }
  }
  else
  {
    id v10 = [PKVirtualCardPrivacyExplanationViewController alloc];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __95__PKPassGroupsViewController_presentImportSafariCardConsentAnimated_referralSource_completion___block_invoke_2;
    v18[3] = &unk_1E59CA9F8;
    unint64_t v19 = v9;
    id v11 = [(PKVirtualCardPrivacyExplanationViewController *)v10 initWithContext:0 referralSource:a4 resultCallback:v18];
    uint64_t v12 = [[PKNavigationController alloc] initWithRootViewController:v11];
    [(PKNavigationController *)v12 setNavigationBarHidden:1];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __95__PKPassGroupsViewController_presentImportSafariCardConsentAnimated_referralSource_completion___block_invoke_3;
    void v14[3] = &unk_1E59CF8B0;
    void v14[4] = self;
    uint64_t v13 = v12;
    id v15 = v13;
    BOOL v17 = v6;
    id v16 = v8;
    [(PKPassGroupsViewController *)self dismissPresentedVCsWithRequirements:0 animated:v6 performAction:v14];
  }
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __95__PKPassGroupsViewController_presentImportSafariCardConsentAnimated_referralSource_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained presentPaymentSetupInMode:0 referrerIdentifier:0 paymentNetwork:0 transitNetworkIdentifier:0 allowedFeatureIdentifiers:0 productIdentifiers:0];
}

uint64_t __95__PKPassGroupsViewController_presentImportSafariCardConsentAnimated_referralSource_completion___block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void __95__PKPassGroupsViewController_presentImportSafariCardConsentAnimated_referralSource_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "pkui_frontMostViewController");
  uint64_t v3 = *(unsigned __int8 *)(a1 + 56);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __95__PKPassGroupsViewController_presentImportSafariCardConsentAnimated_referralSource_completion___block_invoke_4;
  void v5[3] = &unk_1E59CAA98;
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v2 presentViewController:v4 animated:v3 completion:v5];
}

uint64_t __95__PKPassGroupsViewController_presentImportSafariCardConsentAnimated_referralSource_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)presentSetupVirtualCardNumberForPassUniqueIdentifier:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  long long v9 = (void (**)(id, uint64_t))a5;
  objc_initWeak(&location, self);
  id v10 = [(PKPassGroupsViewController *)self _passFromGroupsControllerWithUniqueIdentifier:v8];
  id v11 = [v10 paymentPass];

  if (v11)
  {
    if (self->_inFailForward)
    {
      if (v9) {
        v9[2](v9, 1);
      }
    }
    else
    {
      if ([v11 supportsVirtualCardNumber]) {
        char v12 = [v11 hasActiveVirtualCard] ^ 1;
      }
      else {
        char v12 = 0;
      }
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      void v13[2] = __103__PKPassGroupsViewController_presentSetupVirtualCardNumberForPassUniqueIdentifier_animated_completion___block_invoke;
      void v13[3] = &unk_1E59D41D0;
      objc_copyWeak(&v17, &location);
      char v18 = v12;
      id v14 = v11;
      id v15 = self;
      id v16 = v9;
      [(PKPassGroupsViewController *)self presentPassWithUniqueID:v8 animated:v6 completionHandler:v13];

      objc_destroyWeak(&v17);
    }
  }

  objc_destroyWeak(&location);
}

void __103__PKPassGroupsViewController_presentSetupVirtualCardNumberForPassUniqueIdentifier_animated_completion___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 48);
    if (v3)
    {
      uint64_t v4 = *(void (**)(void))(v3 + 16);
      v4();
    }
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __103__PKPassGroupsViewController_presentSetupVirtualCardNumberForPassUniqueIdentifier_animated_completion___block_invoke_2;
    block[3] = &unk_1E59D1360;
    objc_copyWeak(&v12, (id *)(a1 + 56));
    char v13 = *(unsigned char *)(a1 + 64);
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void **)(a1 + 48);
    id v9 = v5;
    uint64_t v10 = v6;
    id v11 = v7;
    dispatch_async(MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v12);
  }
}

void __103__PKPassGroupsViewController_presentSetupVirtualCardNumberForPassUniqueIdentifier_animated_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v3 = PKDismissedKeyForPass();
    PKSharedCacheSetBoolForKey();

    uint64_t v4 = [[PKVirtualCardEnrollmentViewController alloc] initWithPaymentPass:*(void *)(a1 + 32) context:0 delegate:WeakRetained];
    id v5 = [[PKNavigationController alloc] initWithRootViewController:v4];
    [(PKNavigationController *)v5 setModalPresentationStyle:2];
    uint64_t v6 = objc_msgSend(*(id *)(a1 + 40), "pkui_frontMostViewController");
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __103__PKPassGroupsViewController_presentSetupVirtualCardNumberForPassUniqueIdentifier_animated_completion___block_invoke_3;
    v8[3] = &unk_1E59CAA98;
    id v9 = *(id *)(a1 + 48);
    [v6 presentViewController:v5 animated:1 completion:v8];
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7) {
      (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
    }
  }
}

uint64_t __103__PKPassGroupsViewController_presentSetupVirtualCardNumberForPassUniqueIdentifier_animated_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)presentExpressUpgradeDetailForPassUniqueID:(id)a3 assetIdentifier:(id)a4 hideDisableAction:(unint64_t)a5 reportingMetadata:(id)a6 animated:(BOOL)a7 completionHandler:(id)a8
{
  BOOL v9 = a7;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a8;
  char v18 = [(PKPassGroupsViewController *)self _passFromGroupsControllerWithUniqueIdentifier:v14];
  unint64_t v19 = [v18 paymentPass];

  if (v19)
  {
    unint64_t v29 = a5;
    BOOL v30 = v9;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    BOOL v20 = [v19 devicePaymentApplications];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v44;
LABEL_4:
      uint64_t v24 = 0;
      while (1)
      {
        if (*(void *)v44 != v23) {
          objc_enumerationMutation(v20);
        }
        if ([*(id *)(*((void *)&v43 + 1) + 8 * v24) supportsExpress]) {
          break;
        }
        if (v22 == ++v24)
        {
          uint64_t v22 = [v20 countByEnumeratingWithState:&v43 objects:v47 count:16];
          if (v22) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }

      if (self->_inFailForward) {
        goto LABEL_12;
      }
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __152__PKPassGroupsViewController_presentExpressUpgradeDetailForPassUniqueID_assetIdentifier_hideDisableAction_reportingMetadata_animated_completionHandler___block_invoke;
      aBlock[3] = &unk_1E59D41F8;
      id v25 = v19;
      id v39 = v25;
      unint64_t v40 = self;
      BOOL v42 = v30;
      id v26 = v17;
      id v41 = v26;
      id v27 = _Block_copy(aBlock);
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __152__PKPassGroupsViewController_presentExpressUpgradeDetailForPassUniqueID_assetIdentifier_hideDisableAction_reportingMetadata_animated_completionHandler___block_invoke_3;
      v31[3] = &unk_1E59D4248;
      v31[4] = self;
      id v32 = v15;
      unint64_t v37 = v29;
      id v33 = v25;
      id v34 = v16;
      id v35 = v27;
      id v36 = v26;
      id v28 = v27;
      [(PKPassGroupsViewController *)self presentPassWithUniqueID:v14 animated:v30 completionHandler:v31];
    }
    else
    {
LABEL_10:

LABEL_12:
      if (v17) {
        (*((void (**)(id, uint64_t))v17 + 2))(v17, 1);
      }
    }
  }
}

void __152__PKPassGroupsViewController_presentExpressUpgradeDetailForPassUniqueID_assetIdentifier_hideDisableAction_reportingMetadata_animated_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = objc_alloc_init(PKNavigationController);
  id v5 = [MEMORY[0x1E4F84D50] sharedService];
  uint64_t v6 = [v5 targetDevice];

  uint64_t v7 = [PKPaymentSetupMoreInfoViewController alloc];
  v14[0] = v3;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  BOOL v9 = [(PKPaymentSetupMoreInfoViewController *)v7 initWithMoreInfoItems:v8 paymentPass:*(void *)(a1 + 32) targetDevice:v6 context:0 dismissalHandler:0 reportingSource:1];

  [(PKNavigationController *)v4 pushViewController:v9 animated:0];
  uint64_t v10 = objc_msgSend(*(id *)(a1 + 40), "pkui_frontMostViewController");
  uint64_t v11 = *(unsigned __int8 *)(a1 + 56);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __152__PKPassGroupsViewController_presentExpressUpgradeDetailForPassUniqueID_assetIdentifier_hideDisableAction_reportingMetadata_animated_completionHandler___block_invoke_2;
  v12[3] = &unk_1E59CAA98;
  id v13 = *(id *)(a1 + 48);
  [v10 presentViewController:v4 animated:v11 completion:v12];
}

uint64_t __152__PKPassGroupsViewController_presentExpressUpgradeDetailForPassUniqueID_assetIdentifier_hideDisableAction_reportingMetadata_animated_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __152__PKPassGroupsViewController_presentExpressUpgradeDetailForPassUniqueID_assetIdentifier_hideDisableAction_reportingMetadata_animated_completionHandler___block_invoke_3(uint64_t a1, char a2)
{
  if (a2)
  {
    uint64_t v2 = *(void *)(a1 + 72);
    if (v2)
    {
      id v3 = *(void (**)(void))(v2 + 16);
      v3();
    }
  }
  else
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 80);
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __152__PKPassGroupsViewController_presentExpressUpgradeDetailForPassUniqueID_assetIdentifier_hideDisableAction_reportingMetadata_animated_completionHandler___block_invoke_4;
    v9[3] = &unk_1E59D4220;
    id v10 = *(id *)(a1 + 64);
    [v4 _setupItemForExpressUpgradeWithAsset:v5 hideDisableAction:v6 pass:v7 reportingMetadata:v8 completionHandler:v9];
  }
}

void __152__PKPassGroupsViewController_presentExpressUpgradeDetailForPassUniqueID_assetIdentifier_hideDisableAction_reportingMetadata_animated_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __152__PKPassGroupsViewController_presentExpressUpgradeDetailForPassUniqueID_assetIdentifier_hideDisableAction_reportingMetadata_animated_completionHandler___block_invoke_5;
  v6[3] = &unk_1E59CAD68;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __152__PKPassGroupsViewController_presentExpressUpgradeDetailForPassUniqueID_assetIdentifier_hideDisableAction_reportingMetadata_animated_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_setupItemForExpressUpgradeWithAsset:(id)a3 hideDisableAction:(unint64_t)a4 pass:(id)a5 reportingMetadata:(id)a6 completionHandler:(id)a7
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v29 = v11;
    _os_log_impl(&dword_19F450000, v15, OS_LOG_TYPE_DEFAULT, "PKPassGroupsViewController: _setupItemForExpressUpgradeMarket: %@", buf, 0xCu);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __126__PKPassGroupsViewController__setupItemForExpressUpgradeWithAsset_hideDisableAction_pass_reportingMetadata_completionHandler___block_invoke;
  aBlock[3] = &unk_1E59CC440;
  id v16 = v14;
  id v27 = v16;
  id v17 = _Block_copy(aBlock);
  if (v11)
  {
    BOOL v18 = a4 == 1;
    unint64_t v19 = [MEMORY[0x1E4F847F8] sharedInstance];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __126__PKPassGroupsViewController__setupItemForExpressUpgradeWithAsset_hideDisableAction_pass_reportingMetadata_completionHandler___block_invoke_2;
    v21[3] = &unk_1E59D4270;
    id v24 = v17;
    BOOL v25 = v18;
    id v22 = v12;
    id v23 = v13;
    [v19 fetchMarketNotificationAssetsForIdentifier:v11 isDiscretionary:0 completionHandler:v21];

    BOOL v20 = v24;
  }
  else
  {
    BOOL v20 = PKPaymentSetupMoreInfoItemDictionaryForExpressUpgradeMarket();
    (*((void (**)(void *, void *))v17 + 2))(v17, v20);
  }
}

void __126__PKPassGroupsViewController__setupItemForExpressUpgradeWithAsset_hideDisableAction_pass_reportingMetadata_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = (objc_class *)MEMORY[0x1E4F84C90];
    id v4 = a2;
    id v5 = (id)[[v3 alloc] initWithMoreInfoDictionary:v4];

    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v5);
  }
}

void __126__PKPassGroupsViewController__setupItemForExpressUpgradeWithAsset_hideDisableAction_pass_reportingMetadata_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  PKPaymentSetupMoreInfoItemDictionaryForExpressUpgradeMarket();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)presentExpiredPassWithUniqueID:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [[PKExpiredPassesNavigationController alloc] initWithExistingGroupsController:self->_groupsController];
  id v11 = v10;
  if (v8 && v10)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __88__PKPassGroupsViewController_presentExpiredPassWithUniqueID_animated_completionHandler___block_invoke;
    v12[3] = &unk_1E59D4298;
    void v12[4] = self;
    id v13 = v10;
    BOOL v16 = a4;
    id v14 = v8;
    id v15 = v9;
    [(PKPassGroupsViewController *)self _presentWithUpdatedPasses:v12];
  }
  else if (v9)
  {
    (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
  }
}

void __88__PKPassGroupsViewController_presentExpiredPassWithUniqueID_animated_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) presentedViewController];

  if (v2) {
    [*(id *)(a1 + 32) dismissViewControllerAnimated:0 completion:0];
  }
  objc_initWeak(&location, *(id *)(a1 + 40));
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 64);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __88__PKPassGroupsViewController_presentExpiredPassWithUniqueID_animated_completionHandler___block_invoke_2;
  v6[3] = &unk_1E59CB038;
  objc_copyWeak(&v9, &location);
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  [v3 presentViewController:v4 animated:v5 completion:v6];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __88__PKPassGroupsViewController_presentExpiredPassWithUniqueID_animated_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained expiredPassesViewController];
    uint64_t v5 = [v4 indexPathOfExpiredPassWithUniqueID:*(void *)(a1 + 32)];
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      id v7 = [v4 tableView];
      [v4 tableView:v7 didSelectRowAtIndexPath:v6];

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      goto LABEL_7;
    }

    id v3 = v9;
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (!v8) {
    goto LABEL_8;
  }
  (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, 1);
LABEL_7:
  id v3 = v9;
LABEL_8:
}

- (void)presentExpiredPassesAnimated:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [[PKExpiredPassesNavigationController alloc] initWithExistingGroupsController:self->_groupsController];
  uint64_t v8 = v7;
  if (v7)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __77__PKPassGroupsViewController_presentExpiredPassesAnimated_completionHandler___block_invoke;
    v9[3] = &unk_1E59CF8B0;
    void v9[4] = self;
    id v10 = v7;
    BOOL v12 = a3;
    id v11 = v6;
    [(PKPassGroupsViewController *)self _presentWithUpdatedPasses:v9];
  }
  else if (v6)
  {
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
  }
}

void __77__PKPassGroupsViewController_presentExpiredPassesAnimated_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) presentedViewController];

  if (v2) {
    [*(id *)(a1 + 32) dismissViewControllerAnimated:0 completion:0];
  }
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 56);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__PKPassGroupsViewController_presentExpiredPassesAnimated_completionHandler___block_invoke_2;
  v6[3] = &unk_1E59CAA98;
  id v7 = *(id *)(a1 + 48);
  [v3 presentViewController:v4 animated:v5 completion:v6];
}

uint64_t __77__PKPassGroupsViewController_presentExpiredPassesAnimated_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)presentPassWithUniqueID:(id)a3 context:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = v12;
  if (v10)
  {
    if ([(PKGroupsController *)self->_groupsController filteringEnabled])
    {
      id v14 = [(PKGroupsController *)self->_groupsController filteredPassUniqueIDs];
      int v15 = [v14 containsObject:v10];

      if (v15)
      {
        v23[0] = v10;
        BOOL v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
        passUniqueIDsToExcludeFromFiltering = self->_passUniqueIDsToExcludeFromFiltering;
        self->_passUniqueIDsToExcludeFromFiltering = v16;

        self->_passesAreOutdated = 1;
      }
    }
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __89__PKPassGroupsViewController_presentPassWithUniqueID_context_animated_completionHandler___block_invoke;
    v18[3] = &unk_1E59D4298;
    void v18[4] = self;
    id v19 = v10;
    BOOL v22 = a5;
    id v20 = v11;
    id v21 = v13;
    [(PKPassGroupsViewController *)self _presentWithUpdatedPasses:v18];
  }
  else if (v12)
  {
    (*((void (**)(id, uint64_t))v12 + 2))(v12, 1);
  }
}

void __89__PKPassGroupsViewController_presentPassWithUniqueID_context_animated_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v4 = a1 + 32;
  uint64_t v30 = 0;
  uint64_t v30 = [*(id *)(v3 + 1264) groupIndexForPassUniqueID:v2];
  uint64_t v5 = *(void **)(*(void *)v4 + 1264);
  if (v28[3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = objc_msgSend(v5, "groupAtIndex:");
    unint64_t v10 = [v9 passCount];
    BOOL v11 = v10 > 1;
    if (v10 >= 2) {
      [*(id *)(a1 + 32) _beginSuppressingInstanceFooter];
    }
    id v12 = *(void **)(a1 + 32);
    uint64_t v13 = *(unsigned __int8 *)(a1 + 64);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __89__PKPassGroupsViewController_presentPassWithUniqueID_context_animated_completionHandler___block_invoke_2;
    v20[3] = &unk_1E59D42E8;
    id v24 = &v27;
    void v20[4] = v12;
    id v21 = *(id *)(a1 + 40);
    id v22 = *(id *)(a1 + 48);
    char v25 = *(unsigned char *)(a1 + 64);
    BOOL v26 = v11;
    id v23 = *(id *)(a1 + 56);
    [v12 dismissPresentedVCsWithRequirements:8 animated:v13 performAction:v20];

    goto LABEL_7;
  }
  if ([v5 containsExpiredPassWithUniqueID:*(void *)(a1 + 40)])
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(unsigned __int8 *)(a1 + 64);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __89__PKPassGroupsViewController_presentPassWithUniqueID_context_animated_completionHandler___block_invoke_4;
    v18[3] = &unk_1E59CA9F8;
    id v19 = *(id *)(a1 + 56);
    [v6 presentExpiredPassWithUniqueID:v7 animated:v8 completionHandler:v18];
    id v9 = v19;
LABEL_7:

    goto LABEL_8;
  }
  id v14 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v16 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    uint64_t v32 = v15;
    __int16 v33 = 2112;
    uint64_t v34 = v16;
    _os_log_impl(&dword_19F450000, v14, OS_LOG_TYPE_DEFAULT, "PKPassGroupsViewController (%p): could not present pass %@ - does not exist.", buf, 0x16u);
  }

  uint64_t v17 = *(void *)(a1 + 56);
  if (v17) {
    (*(void (**)(uint64_t, uint64_t))(v17 + 16))(v17, 1);
  }
LABEL_8:
  _Block_object_dispose(&v27, 8);
}

void __89__PKPassGroupsViewController_presentPassWithUniqueID_context_animated_completionHandler___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 1264) groupIndexForPassUniqueID:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v4 = *(void *)(*(void *)(v3 + 8) + 24);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 72);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __89__PKPassGroupsViewController_presentPassWithUniqueID_context_animated_completionHandler___block_invoke_3;
  v7[3] = &unk_1E59D42C0;
  v7[4] = v2;
  uint64_t v11 = v3;
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  __int16 v12 = *(_WORD *)(a1 + 72);
  id v10 = *(id *)(a1 + 56);
  [v2 _presentGroupWithIndex:v4 context:v6 animated:v5 completionHandler:v7];
}

uint64_t __89__PKPassGroupsViewController_presentPassWithUniqueID_context_animated_completionHandler___block_invoke_3(uint64_t a1, char a2)
{
  if (a2)
  {
    if (!*(unsigned char *)(a1 + 73)) {
      goto LABEL_14;
    }
    uint64_t v3 = 0;
    uint64_t v4 = (id *)(a1 + 32);
    goto LABEL_13;
  }
  uint64_t v4 = (id *)(a1 + 32);
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 992) modalGroupIndex];
  uint64_t v6 = [*((id *)*v4 + 158) groupCount];
  if (v5 == *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)
    || (v5 == 0x7FFFFFFFFFFFFFFFLL ? (BOOL v7 = v6 == 1) : (BOOL v7 = 0), v7))
  {
    [*(id *)(*(void *)(a1 + 32) + 992) presentPassWithUniqueID:*(void *)(a1 + 40) withContext:*(void *)(a1 + 48) animated:*(unsigned __int8 *)(a1 + 72)];
  }
  if (*(unsigned char *)(a1 + 73))
  {
    uint64_t v3 = *(void *)(a1 + 48);
LABEL_13:
    [*v4 _endSuppressingInstanceFooterWithContext:v3];
  }
LABEL_14:
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    id v9 = *(uint64_t (**)(void))(result + 16);
    return v9();
  }
  return result;
}

uint64_t __89__PKPassGroupsViewController_presentPassWithUniqueID_context_animated_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)presentSearchWithCompletion:(id)a3
{
  uint64_t v5 = (void (**)(void))a3;
  uint64_t v4 = [(PKPassGroupsViewController *)self presentedViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v4 presentSearchWithCompletion:v5];
  }
  else if (v5)
  {
    v5[2]();
  }
}

- (void)presentSearchWithQuery:(id)a3 completion:(id)a4
{
  id v8 = a3;
  uint64_t v6 = (void (**)(id, void))a4;
  BOOL v7 = [(PKPassGroupsViewController *)self presentedViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v7 presentSearchWithQuery:v8 completion:v6];
  }
  else if (v6)
  {
    v6[2](v6, 0);
  }
}

- (void)presentFeatureSetupOrFeaturePass:(unint64_t)a3 referrerIdentifier:(id)a4 presentationContext:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  __int16 v12 = (void (**)(void))a6;
  objc_initWeak(&location, self);
  uint64_t v13 = (void *)MEMORY[0x1E4F1CAD0];
  id v14 = PKFeatureIdentifierToString();
  uint64_t v15 = [v13 setWithObject:v14];

  switch(a3)
  {
    case 0uLL:
    case 1uLL:
    case 4uLL:
      if (v12) {
        v12[2](v12);
      }
      break;
    case 2uLL:
      uint64_t v16 = [MEMORY[0x1E4F84270] sharedInstance];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke;
      v32[3] = &unk_1E59D4360;
      uint64_t v17 = &v36;
      objc_copyWeak(&v36, &location);
      uint64_t v35 = v12;
      id v33 = v10;
      id v34 = v15;
      [v16 defaultAccountForFeature:2 completion:v32];
      BOOL v18 = (id *)&v35;

      id v19 = v33;
      goto LABEL_7;
    case 3uLL:
      id v20 = [MEMORY[0x1E4F84270] sharedInstance];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_4;
      v27[3] = &unk_1E59D4400;
      uint64_t v17 = &v31;
      objc_copyWeak(&v31, &location);
      uint64_t v30 = v12;
      v27[4] = self;
      id v28 = v10;
      id v29 = v15;
      [v20 defaultAccountForFeature:3 completion:v27];
      BOOL v18 = (id *)&v30;

      id v19 = v28;
      goto LABEL_7;
    case 5uLL:
      id v21 = [MEMORY[0x1E4F84270] sharedInstance];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_11;
      v22[3] = &unk_1E59D4478;
      uint64_t v17 = v26;
      objc_copyWeak(v26, &location);
      char v25 = v12;
      id v23 = v11;
      v26[1] = (id)5;
      id v24 = v10;
      [v21 defaultAccountForFeature:5 completion:v22];
      BOOL v18 = (id *)&v25;

      id v19 = v23;
LABEL_7:

      objc_destroyWeak(v17);
      break;
    default:
      break;
  }

  objc_destroyWeak(&location);
}

void __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_2;
  block[3] = &unk_1E59D4338;
  objc_copyWeak(&v10, a1 + 7);
  id v9 = a1[6];
  id v6 = v3;
  id v7 = a1[4];
  id v8 = a1[5];
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v10);
}

void __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32))
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_3;
      v6[3] = &unk_1E59D4310;
      objc_copyWeak(&v10, v2);
      id v9 = *(id *)(a1 + 56);
      id v7 = *(id *)(a1 + 40);
      id v8 = *(id *)(a1 + 48);
      [v4 presentCreditPassAnimated:1 completion:v6];

      objc_destroyWeak(&v10);
      goto LABEL_7;
    }
    [WeakRetained presentPaymentSetupInMode:4 referrerIdentifier:*(void *)(a1 + 40) paymentNetwork:0 transitNetworkIdentifier:0 allowedFeatureIdentifiers:*(void *)(a1 + 48) productIdentifiers:0];
  }
  uint64_t v5 = *(void *)(a1 + 56);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
LABEL_7:
}

void __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_3(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v5 = WeakRetained;
  id v7 = WeakRetained;
  if (WeakRetained && a2)
  {
    [WeakRetained presentPaymentSetupInMode:0 referrerIdentifier:*(void *)(a1 + 32) paymentNetwork:0 transitNetworkIdentifier:0 allowedFeatureIdentifiers:*(void *)(a1 + 40) productIdentifiers:0];
    uint64_t v5 = v7;
  }
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6)
  {
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v5);
    uint64_t v5 = v7;
  }
}

void __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_5;
  v8[3] = &unk_1E59D43D8;
  objc_copyWeak(&v14, (id *)(a1 + 64));
  id v9 = v3;
  id v4 = *(id *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(a1 + 40);
  id v13 = v4;
  uint64_t v10 = v5;
  id v11 = v6;
  id v12 = *(id *)(a1 + 48);
  id v7 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v8);

  objc_destroyWeak(&v14);
}

void __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 72);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained && (id v4 = *(void **)(a1 + 32)) != 0)
  {
    uint64_t v5 = [v4 associatedPassUniqueID];
    uint64_t v6 = [*(id *)(*(void *)(a1 + 40) + 1160) passWithUniqueID:v5];
    id v7 = [v6 paymentPass];

    if (v7)
    {
      id v8 = *(void **)(a1 + 40);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      void v14[2] = __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_6;
      void v14[3] = &unk_1E59D43B0;
      objc_copyWeak(&v19, v2);
      id v18 = *(id *)(a1 + 64);
      id v9 = *(id *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      id v11 = *(void **)(a1 + 48);
      id v15 = v9;
      uint64_t v16 = v10;
      id v17 = v11;
      [v8 presentPassWithUniqueID:v5 animated:1 completionHandler:v14];

      objc_destroyWeak(&v19);
    }
    else
    {
      [WeakRetained presentPaymentSetupInMode:4 referrerIdentifier:*(void *)(a1 + 48) paymentNetwork:0 transitNetworkIdentifier:0 allowedFeatureIdentifiers:*(void *)(a1 + 56) productIdentifiers:0];
      uint64_t v13 = *(void *)(a1 + 64);
      if (v13) {
        (*(void (**)(void))(v13 + 16))();
      }
    }
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 64);
    if (v12) {
      (*(void (**)(void))(v12 + 16))();
    }
  }
}

void __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained
    && ([*(id *)(a1 + 32) payLaterDetails],
        id v3 = objc_claimAutoreleasedReturnValue(),
        char v4 = [v3 hasEligibleSpend],
        v3,
        (v4 & 1) == 0))
  {
    uint64_t v6 = +[PKPayLaterSetupFlowController defaultPayLaterSetupFlowControllerForAccount:*(void *)(a1 + 32) controllerContext:3 referrerIdentifier:*(void *)(a1 + 48)];
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = *(void **)(v7 + 1200);
    *(void *)(v7 + 1200) = v6;

    objc_initWeak(&location, *(id *)(a1 + 40));
    id v9 = *(void **)(*(void *)(a1 + 40) + 1200);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_7;
    v10[3] = &unk_1E59CD2F8;
    objc_copyWeak(&v12, &location);
    id v11 = *(id *)(a1 + 56);
    [v9 fetchPayLaterDynamicContentWithCompletion:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 56);
    if (v5) {
      (*(void (**)(void))(v5 + 16))();
    }
  }
}

void __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_7(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_8;
  v8[3] = &unk_1E59D4388;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  id v6 = *(id *)(a1 + 32);
  char v12 = a2;
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v8);

  objc_destroyWeak(&v11);
}

void __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_8(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(unsigned char *)(a1 + 56)) {
      BOOL v4 = *(void *)(a1 + 32) == 0;
    }
    else {
      BOOL v4 = 0;
    }
    if (v4)
    {
      id v5 = [WeakRetained[150] firstViewController];
      id v6 = [v3 presentedViewController];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v8 = v6;
      }
      else {
        id v8 = 0;
      }
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_10;
      v9[3] = &unk_1E59CAA98;
      id v10 = *(id *)(a1 + 40);
      [v8 presentViewController:v5 animated:1 completion:v9];
    }
    else
    {
      id v5 = PKDisplayableErrorForCommonType();
      id v6 = PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);
      if (v6)
      {
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        _OWORD v11[2] = __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_9;
        v11[3] = &unk_1E59CAA98;
        id v12 = *(id *)(a1 + 40);
        [v3 presentViewController:v6 animated:1 completion:v11];
      }
    }
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7) {
      (*(void (**)(void))(v7 + 16))();
    }
  }
}

uint64_t __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_9(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_10(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_11(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_12;
  v7[3] = &unk_1E59D4428;
  objc_copyWeak(v12, (id *)(a1 + 56));
  id v11 = *(id *)(a1 + 48);
  id v8 = v3;
  id v4 = *(id *)(a1 + 32);
  id v5 = *(void **)(a1 + 64);
  id v9 = v4;
  v12[1] = v5;
  id v10 = *(id *)(a1 + 40);
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v7);

  objc_destroyWeak(v12);
}

void __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_12(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    id v4 = *(void **)(a1 + 32);
    if (v4 && [v4 state] != 4)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_13;
      v15[3] = &unk_1E59D4310;
      id v6 = &v19;
      objc_copyWeak(&v19, v2);
      id v18 = *(id *)(a1 + 56);
      id v16 = *(id *)(a1 + 32);
      id v17 = *(id *)(a1 + 40);
      [WeakRetained presentCreditPassAnimated:1 completion:v15];

      id v9 = v18;
    }
    else
    {
      id v5 = [MEMORY[0x1E4F84270] sharedInstance];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      _OWORD v11[2] = __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_15;
      v11[3] = &unk_1E59D4450;
      id v6 = v14;
      objc_copyWeak(v14, v2);
      id v7 = *(id *)(a1 + 56);
      id v8 = *(void **)(a1 + 72);
      id v13 = v7;
      v14[1] = v8;
      id v12 = *(id *)(a1 + 48);
      [v5 defaultAccountForFeature:2 completion:v11];

      id v9 = v13;
    }

    objc_destroyWeak(v6);
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 56);
    if (v10) {
      (*(void (**)(void))(v10 + 16))();
    }
  }
}

void __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_13(uint64_t a1, char a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && a3 && (a2 & 1) == 0)
  {
    id v7 = objc_alloc_init(PKAccountViewInterfaceConfiguration);
    [(PKAccountViewInterfaceConfiguration *)v7 setAccount:*(void *)(a1 + 32)];
    [(PKAccountViewInterfaceConfiguration *)v7 setDestination:0];
    [(PKAccountViewInterfaceConfiguration *)v7 setViewStyle:0];
    id v8 = [WeakRetained presentedViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      id v12[2] = __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_14;
      v12[3] = &unk_1E59CA9F8;
      uint64_t v9 = *(void *)(a1 + 40);
      id v13 = *(id *)(a1 + 48);
      [v8 presentAccountWithConfiguration:v7 presentationContext:v9 animated:1 completion:v12];
    }
    else
    {
      uint64_t v11 = *(void *)(a1 + 48);
      if (v11) {
        (*(void (**)(void))(v11 + 16))();
      }
    }
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 48);
    if (v10) {
      (*(void (**)(void))(v10 + 16))();
    }
  }
}

uint64_t __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_14(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  _OWORD v11[2] = __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_16;
  v11[3] = &unk_1E59D4428;
  objc_copyWeak(v16, (id *)(a1 + 48));
  id v7 = *(id *)(a1 + 40);
  id v12 = v5;
  id v13 = v6;
  id v8 = *(void **)(a1 + 56);
  id v15 = v7;
  v16[1] = v8;
  id v14 = *(id *)(a1 + 32);
  id v9 = v6;
  id v10 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v11);

  objc_destroyWeak(v16);
}

void __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_16(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (!WeakRetained)
  {
LABEL_7:
    uint64_t v6 = *(void *)(a1 + 56);
    if (v6) {
      (*(void (**)(void))(v6 + 16))();
    }
    goto LABEL_16;
  }
  id v3 = *(void **)(a1 + 32);
  if (!v3 || *(void *)(a1 + 40))
  {
    id v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v24 = v5;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Cannot present feature apply, card account not here with error %@", buf, 0xCu);
    }

    goto LABEL_7;
  }
  id v7 = [v3 redeemRewardsFeatureDescriptor];
  id v8 = [v7 productForFeature:*(void *)(a1 + 72)];

  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F84BB8]);
    id v10 = [MEMORY[0x1E4F84D50] sharedService];
    uint64_t v11 = (void *)[v9 initWithWebService:v10];

    [v11 setReferrerIdentifier:*(void *)(a1 + 48)];
    id v12 = [PKFeatureOnBoardingViewController alloc];
    id v13 = [v8 onboardingItems];
    id v14 = [v13 firstObject];
    id v15 = [(PKFeatureOnBoardingViewController *)v12 initWithParentFlowController:0 setupDelegate:0 setupContext:0 onboardingContext:0 featureIdentifier:5 provisioningController:v11 paymentSetupProduct:v8 currentPage:v14];

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    _OWORD v19[2] = __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_203;
    v19[3] = &unk_1E59CE110;
    id v20 = v15;
    id v21 = WeakRetained;
    id v22 = *(id *)(a1 + 56);
    id v16 = v15;
    [WeakRetained dismissPresentedVCsWithRequirements:8 animated:1 performAction:v19];
  }
  else
  {
    id v17 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v17, OS_LOG_TYPE_DEFAULT, "Cannot retrieve feature product to present apply flow", buf, 2u);
    }

    uint64_t v18 = *(void *)(a1 + 56);
    if (v18) {
      (*(void (**)(void))(v18 + 16))();
    }
  }

LABEL_16:
}

void __113__PKPassGroupsViewController_presentFeatureSetupOrFeaturePass_referrerIdentifier_presentationContext_completion___block_invoke_203(uint64_t a1)
{
  id v3 = [[PKNavigationController alloc] initWithRootViewController:*(void *)(a1 + 32)];
  [(PKNavigationController *)v3 setModalInPresentation:1];
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 40), "pkui_frontMostViewController");
  [v2 presentViewController:v3 animated:1 completion:*(void *)(a1 + 48)];
}

- (void)presentInstallmentPlansForFeature:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (a3)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F84518]);
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x3032000000;
    v30[3] = __Block_byref_object_copy__25;
    v30[4] = __Block_byref_object_dispose__25;
    id v31 = 0;
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x3032000000;
    v28[3] = __Block_byref_object_copy__25;
    v28[4] = __Block_byref_object_dispose__25;
    id v29 = 0;
    v26[0] = 0;
    v26[1] = v26;
    id v26[2] = 0x3032000000;
    v26[3] = __Block_byref_object_copy__25;
    v26[4] = __Block_byref_object_dispose__25;
    id v27 = 0;
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x3032000000;
    v24[3] = __Block_byref_object_copy__25;
    void v24[4] = __Block_byref_object_dispose__25;
    id v25 = 0;
    objc_initWeak(&location, self);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke;
    v22[3] = &unk_1E59D44C8;
    void v22[4] = v30;
    v22[5] = a3;
    [v8 addOperation:v22];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_4;
    v21[3] = &unk_1E59D0740;
    void v21[4] = v30;
    v21[5] = v28;
    [v8 addOperation:v21];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_7;
    v20[3] = &unk_1E59D0740;
    void v20[4] = v30;
    void v20[5] = v26;
    [v8 addOperation:v20];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_10;
    v18[3] = &unk_1E59D4518;
    objc_copyWeak(&v19, &location);
    void v18[4] = v24;
    [v8 addOperation:v18];
    id v9 = [MEMORY[0x1E4F1CA98] null];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    _OWORD v11[2] = __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_13;
    v11[3] = &unk_1E59D4590;
    objc_copyWeak(&v17, &location);
    id v13 = v30;
    id v12 = v7;
    id v14 = v28;
    id v15 = v26;
    id v16 = v24;
    id v10 = (id)[v8 evaluateWithInput:v9 completion:v11];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    _Block_object_dispose(v24, 8);

    _Block_object_dispose(v26, 8);
    _Block_object_dispose(v28, 8);

    _Block_object_dispose(v30, 8);
  }
  else if (v6)
  {
    (*((void (**)(id))v6 + 2))(v6);
  }
}

void __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F84270] sharedInstance];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_2;
  void v13[3] = &unk_1E59CC7B0;
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  id v15 = v7;
  uint64_t v16 = v9;
  id v14 = v6;
  id v11 = v6;
  id v12 = v7;
  [v8 defaultAccountForFeature:v10 completion:v13];
}

void __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_3;
  block[3] = &unk_1E59D44A0;
  id v8 = v3;
  long long v6 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v6;
  long long v10 = v6;
  id v9 = *(id *)(a1 + 32);
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_3(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

void __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    id v9 = [MEMORY[0x1E4F84270] sharedInstance];
    long long v10 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) accountIdentifier];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    _OWORD v11[2] = __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_5;
    v11[3] = &unk_1E59CC828;
    uint64_t v14 = *(void *)(a1 + 40);
    id v13 = v8;
    id v12 = v6;
    [v9 accountUsersForAccountWithIdentifier:v10 completion:v11];
  }
  else
  {
    (*((void (**)(id, id, void))v7 + 2))(v7, v6, 0);
  }
}

void __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_6;
  block[3] = &unk_1E59D44F0;
  id v8 = v3;
  long long v6 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v6;
  long long v10 = v6;
  id v9 = *(id *)(a1 + 32);
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_6(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v2 = [objc_alloc(MEMORY[0x1E4F842C8]) initWithAccountUsers:*(void *)(a1 + 32)];
    uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v5();
}

void __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_7(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    id v9 = [MEMORY[0x1E4F84270] sharedInstance];
    long long v10 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) accountIdentifier];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    _OWORD v11[2] = __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_8;
    v11[3] = &unk_1E59CC828;
    uint64_t v14 = *(void *)(a1 + 40);
    id v13 = v8;
    id v12 = v6;
    [v9 physicalCardsForAccountWithIdentifier:v10 completion:v11];
  }
  else
  {
    (*((void (**)(id, id, void))v7 + 2))(v7, v6, 0);
  }
}

void __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_9;
  block[3] = &unk_1E59D44F0;
  id v8 = v3;
  long long v6 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v6;
  long long v10 = v6;
  id v9 = *(id *)(a1 + 32);
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_9(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v2 = [*(id *)(a1 + 32) copy];
    uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v5();
}

void __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_10(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    long long v10 = (void *)*((void *)WeakRetained + 135);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    _OWORD v11[2] = __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_11;
    v11[3] = &unk_1E59CC850;
    uint64_t v14 = *(void *)(a1 + 32);
    id v13 = v7;
    id v12 = v6;
    [v10 familyMembersWithCompletion:v11];
  }
  else
  {
    (*((void (**)(id, id, void))v7 + 2))(v7, v6, 0);
  }
}

void __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_11(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_12;
  block[3] = &unk_1E59D44A0;
  id v8 = v3;
  long long v6 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v6;
  long long v10 = v6;
  id v9 = *(id *)(a1 + 32);
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_12(void *a1)
{
  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F84710]) initWithFamilyMembers:a1[4]];
  uint64_t v3 = *(void *)(a1[7] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = *(uint64_t (**)(void))(a1[6] + 16);

  return v5();
}

void __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_13(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_14;
  block[3] = &unk_1E59D4568;
  objc_copyWeak(&v9, (id *)(a1 + 72));
  long long v4 = *(_OWORD *)(a1 + 32);
  id v2 = (id)v4;
  long long v3 = *(_OWORD *)(a1 + 48);
  long long v6 = v4;
  long long v7 = v3;
  uint64_t v8 = *(void *)(a1 + 64);
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
}

void __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_14(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    long long v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v3)
    {
      long long v4 = [v3 creditDetails];
      id v5 = [v4 installmentPlans];
      uint64_t v6 = [v5 count];

      long long v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      if (v6 == 1)
      {
        uint64_t v8 = [v7 creditDetails];
        id v9 = [v8 installmentPlans];
        long long v10 = [v9 allObjects];
        id v11 = [v10 firstObject];

        if (v11)
        {
          id v12 = [v11 identifier];
          id v13 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) accountIdentifier];
          [WeakRetained presentInstallmentPlanWithIdentifier:v12 forAccountIdentifier:v13 completion:*(void *)(a1 + 32)];
        }
      }
      else
      {
        id v15 = [v7 associatedPassUniqueID];
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        long long v18 = *(_OWORD *)(a1 + 32);
        long long v22 = *(_OWORD *)(a1 + 48);
        _OWORD v19[2] = __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_15;
        v19[3] = &unk_1E59D4540;
        void v19[4] = WeakRetained;
        id v20 = v15;
        uint64_t v23 = *(void *)(a1 + 64);
        id v16 = (id)v18;
        long long v21 = v18;
        id v17 = v15;
        [WeakRetained presentPassDetailsWithUniqueID:v17 animated:1 completionHandler:v19];
      }
    }
    else
    {
      uint64_t v14 = *(void *)(a1 + 32);
      if (v14) {
        (*(void (**)(void))(v14 + 16))();
      }
    }
  }
}

uint64_t __75__PKPassGroupsViewController_presentInstallmentPlansForFeature_completion___block_invoke_15(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    long long v3 = [*(id *)(a1 + 32) presentedViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v4 = [*(id *)(*(void *)(a1 + 32) + 1264) passWithUniqueID:*(void *)(a1 + 40)];
      id v16 = [v4 paymentPass];

      id v5 = (void *)[objc_alloc(MEMORY[0x1E4F850C0]) initWithPaymentPass:v16];
      uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F850C8]) initWithTransactionSource:v5];
      id v7 = objc_alloc_init(MEMORY[0x1E4F84A88]);
      uint64_t v8 = [PKInstallmentPlansViewController alloc];
      uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      id v12 = [MEMORY[0x1E4F84270] sharedInstance];
      id v13 = [(PKInstallmentPlansViewController *)v8 initWithAccount:v9 accountUserCollection:v10 physicalCards:v11 accountService:v12 transactionSourceCollection:v6 familyCollection:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) dataProvider:v7];

      [v3 pushViewController:v13 animated:1];
    }
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v15 = *(uint64_t (**)(void))(result + 16);
    return v15();
  }
  return result;
}

- (void)presentInstallmentPlanWithIdentifier:(id)a3 forAccountIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (v8 && v9)
  {
    objc_initWeak(&location, self);
    id v12 = [MEMORY[0x1E4F84270] sharedInstance];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __99__PKPassGroupsViewController_presentInstallmentPlanWithIdentifier_forAccountIdentifier_completion___block_invoke;
    void v13[3] = &unk_1E59D45B8;
    objc_copyWeak(&v16, &location);
    id v14 = v8;
    id v15 = v11;
    [v12 accountWithIdentifier:v9 completion:v13];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else if (v10)
  {
    (*((void (**)(id))v10 + 2))(v10);
  }
}

void __99__PKPassGroupsViewController_presentInstallmentPlanWithIdentifier_forAccountIdentifier_completion___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __99__PKPassGroupsViewController_presentInstallmentPlanWithIdentifier_forAccountIdentifier_completion___block_invoke_2;
  void v5[3] = &unk_1E59D11A8;
  objc_copyWeak(&v9, a1 + 6);
  id v6 = v3;
  id v7 = a1[4];
  id v8 = a1[5];
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v9);
}

void __99__PKPassGroupsViewController_presentInstallmentPlanWithIdentifier_forAccountIdentifier_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = [*(id *)(a1 + 32) creditDetails];
    id v4 = [v3 installmentPlanWithIdentifier:*(void *)(a1 + 40)];

    if (v4)
    {
      id v5 = [*(id *)(a1 + 32) associatedPassUniqueID];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __99__PKPassGroupsViewController_presentInstallmentPlanWithIdentifier_forAccountIdentifier_completion___block_invoke_3;
      v7[3] = &unk_1E59CF8D8;
      void v7[4] = WeakRetained;
      id v8 = v4;
      id v9 = *(id *)(a1 + 48);
      [WeakRetained presentPassWithUniqueID:v5 animated:1 completionHandler:v7];
    }
    else
    {
      uint64_t v6 = *(void *)(a1 + 48);
      if (v6) {
        (*(void (**)(void))(v6 + 16))();
      }
    }
  }
}

uint64_t __99__PKPassGroupsViewController_presentInstallmentPlanWithIdentifier_forAccountIdentifier_completion___block_invoke_3(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v3 = [*(id *)(a1 + 32) presentedViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v3 presentInstallmentPlan:*(void *)(a1 + 40)];
    }
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (void)presentInvitationsInboxAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = v6;
  if (self->_inboxDataSource)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __73__PKPassGroupsViewController_presentInvitationsInboxAnimated_completion___block_invoke;
    v8[3] = &unk_1E59CF278;
    void v8[4] = self;
    BOOL v10 = v4;
    id v9 = v6;
    [(PKPassGroupsViewController *)self dismissPresentedVCsWithRequirements:0 animated:v4 performAction:v8];
  }
  else if (v6)
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

void __73__PKPassGroupsViewController_presentInvitationsInboxAnimated_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 1192);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __73__PKPassGroupsViewController_presentInvitationsInboxAnimated_completion___block_invoke_2;
  v3[3] = &unk_1E59CF278;
  v3[4] = v1;
  char v5 = *(unsigned char *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  [v2 updateInboxWithCompletion:v3];
}

void __73__PKPassGroupsViewController_presentInvitationsInboxAnimated_completion___block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__PKPassGroupsViewController_presentInvitationsInboxAnimated_completion___block_invoke_3;
  block[3] = &unk_1E59CF278;
  uint64_t v1 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  char v4 = *(unsigned char *)(a1 + 48);
  id v3 = v1;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __73__PKPassGroupsViewController_presentInvitationsInboxAnimated_completion___block_invoke_3(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 1192) hasInboxMessages])
  {
    id v2 = [[PKInboxViewController alloc] initWithInboxDataSource:*(void *)(*(void *)(a1 + 32) + 1192) contactAvatarManager:*(void *)(*(void *)(a1 + 32) + 1232) context:0];
    id v3 = [[PKNavigationController alloc] initWithRootViewController:v2];
    uint64_t v4 = *(unsigned __int8 *)(a1 + 48);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __73__PKPassGroupsViewController_presentInvitationsInboxAnimated_completion___block_invoke_4;
    v10[3] = &unk_1E59CAD68;
    char v5 = *(void **)(a1 + 32);
    id v6 = *(id *)(a1 + 40);
    uint64_t v11 = v2;
    id v12 = v6;
    id v7 = v2;
    [v5 presentViewController:v3 animated:v4 completion:v10];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8)
    {
      id v9 = *(void (**)(void))(v8 + 16);
      v9();
    }
  }
}

uint64_t __73__PKPassGroupsViewController_presentInvitationsInboxAnimated_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)presentCreateAccountUserInvitationWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(UIViewController *)self pkui_frontMostViewController];
  +[PKAccountInvitationController presentCreateAccountUserInvitationWithViewController:v5 account:0 accountUserCollection:0 familyMemberCollection:0 context:0 completion:v4];
}

- (void)presentInvitationWithIdentifier:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (v8 && v9)
  {
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    id v12[2] = __98__PKPassGroupsViewController_presentInvitationWithIdentifier_forAccountWithIdentifier_completion___block_invoke;
    v12[3] = &unk_1E59D45E0;
    objc_copyWeak(&v15, &location);
    id v13 = v8;
    id v14 = v11;
    [(PKPassGroupsViewController *)self presentPassWithAssociatedAccountIdentifier:v9 animated:1 completion:v12];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else if (v10)
  {
    (*((void (**)(id))v10 + 2))(v10);
  }
}

void __98__PKPassGroupsViewController_presentInvitationWithIdentifier_forAccountWithIdentifier_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (!v5 || (a2 & 1) != 0)
  {
    uint64_t v10 = *(void *)(a1 + 40);
    if (v10) {
      (*(void (**)(void))(v10 + 16))();
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      id v7 = WeakRetained;
      id v8 = [WeakRetained presentedViewController];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        _OWORD v11[2] = __98__PKPassGroupsViewController_presentInvitationWithIdentifier_forAccountWithIdentifier_completion___block_invoke_2;
        v11[3] = &unk_1E59CAA98;
        uint64_t v9 = *(void *)(a1 + 32);
        id v12 = *(id *)(a1 + 40);
        [v8 presentInvitationWithIdentifier:v9 completion:v11];
      }
    }
  }
}

uint64_t __98__PKPassGroupsViewController_presentInvitationWithIdentifier_forAccountWithIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)presentAppStorePageForItemWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [[PKStoreProductViewPresenter alloc] initWithProductDelegate:0];
  [(PKStoreProductViewPresenter *)v5 loadProductForItemIdentifier:v4 customProductPageIdentifier:0];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__PKPassGroupsViewController_presentAppStorePageForItemWithIdentifier___block_invoke;
  v6[3] = &unk_1E59D2418;
  void v6[4] = self;
  [(PKStoreProductViewPresenter *)v5 presentStoreViewWithBlock:v6];
}

void __71__PKPassGroupsViewController_presentAppStorePageForItemWithIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  objc_msgSend(v4, "pkui_frontMostViewController");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 presentViewController:v6 animated:1 completion:v5];
}

- (void)presentTransactionDetailsForTransactionWithIdentifier:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4 && !self->_inFailForward)
  {
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Presenting transaction details for transactionID %@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    paymentService = self->_paymentService;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __84__PKPassGroupsViewController_presentTransactionDetailsForTransactionWithIdentifier___block_invoke;
    v7[3] = &unk_1E59D4630;
    objc_copyWeak(&v8, (id *)buf);
    void v7[4] = self;
    [(PKPaymentService *)paymentService transactionWithTransactionIdentifier:v4 completion:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak((id *)buf);
  }
}

void __84__PKPassGroupsViewController_presentTransactionDetailsForTransactionWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = (void *)*((void *)WeakRetained + 135);
    id v7 = [v3 transactionSourceIdentifier];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __84__PKPassGroupsViewController_presentTransactionDetailsForTransactionWithIdentifier___block_invoke_2;
    v8[3] = &unk_1E59D4608;
    void v8[4] = *(void *)(a1 + 32);
    id v9 = v3;
    [v6 transactionSourceTypeForTransactionSourceIdentifier:v7 completion:v8];
  }
}

void __84__PKPassGroupsViewController_presentTransactionDetailsForTransactionWithIdentifier___block_invoke_2(uint64_t a1, uint64_t a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__PKPassGroupsViewController_presentTransactionDetailsForTransactionWithIdentifier___block_invoke_3;
  block[3] = &unk_1E59CC648;
  id v3 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  uint64_t v6 = a2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __84__PKPassGroupsViewController_presentTransactionDetailsForTransactionWithIdentifier___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentTransactionDetailsForTransaction:*(void *)(a1 + 40) transactionSourceType:*(void *)(a1 + 48)];
}

- (void)presentPayLaterFinancingPlanWithIdentifier:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4 && !self->_inFailForward)
  {
    id v5 = [MEMORY[0x1E4F84270] sharedInstance];
    v26[0] = 0;
    v26[1] = v26;
    id v26[2] = 0x3032000000;
    v26[3] = __Block_byref_object_copy__25;
    v26[4] = __Block_byref_object_dispose__25;
    id v27 = 0;
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x3032000000;
    v24[3] = __Block_byref_object_copy__25;
    void v24[4] = __Block_byref_object_dispose__25;
    id v25 = 0;
    uint64_t v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v4;
      _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Presenting pay later financing plan details for %@", buf, 0xCu);
    }

    id v7 = objc_alloc_init(MEMORY[0x1E4F84518]);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __73__PKPassGroupsViewController_presentPayLaterFinancingPlanWithIdentifier___block_invoke;
    v21[3] = &unk_1E59CDD98;
    id v8 = v5;
    id v22 = v8;
    uint64_t v23 = v26;
    [v7 addOperation:v21];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __73__PKPassGroupsViewController_presentPayLaterFinancingPlanWithIdentifier___block_invoke_4;
    v17[3] = &unk_1E59CC7D8;
    id v9 = v8;
    id v18 = v9;
    id v10 = v4;
    id v19 = v10;
    id v20 = v24;
    [v7 addOperation:v17];
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __73__PKPassGroupsViewController_presentPayLaterFinancingPlanWithIdentifier___block_invoke_7;
    void v13[3] = &unk_1E59D46A8;
    id v15 = v26;
    void v13[4] = self;
    id v16 = v24;
    id v14 = v10;
    id v12 = (id)[v7 evaluateWithInput:v11 completion:v13];

    _Block_object_dispose(v24, 8);
    _Block_object_dispose(v26, 8);
  }
}

void __73__PKPassGroupsViewController_presentPayLaterFinancingPlanWithIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  id v12[2] = __73__PKPassGroupsViewController_presentPayLaterFinancingPlanWithIdentifier___block_invoke_2;
  v12[3] = &unk_1E59CC7B0;
  id v9 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v14 = v7;
  uint64_t v15 = v8;
  id v13 = v6;
  id v10 = v6;
  id v11 = v7;
  [v9 defaultAccountForFeature:3 completion:v12];
}

void __73__PKPassGroupsViewController_presentPayLaterFinancingPlanWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__PKPassGroupsViewController_presentPayLaterFinancingPlanWithIdentifier___block_invoke_3;
  block[3] = &unk_1E59D44A0;
  id v8 = v3;
  long long v6 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v6;
  long long v10 = v6;
  id v9 = *(id *)(a1 + 32);
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __73__PKPassGroupsViewController_presentPayLaterFinancingPlanWithIdentifier___block_invoke_3(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

void __73__PKPassGroupsViewController_presentPayLaterFinancingPlanWithIdentifier___block_invoke_4(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)a1[4];
  uint64_t v9 = a1[5];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __73__PKPassGroupsViewController_presentPayLaterFinancingPlanWithIdentifier___block_invoke_5;
  void v13[3] = &unk_1E59D4658;
  uint64_t v10 = a1[6];
  id v15 = v7;
  uint64_t v16 = v10;
  id v14 = v6;
  id v11 = v6;
  id v12 = v7;
  [v8 financingPlanForPlanIdentifier:v9 completion:v13];
}

void __73__PKPassGroupsViewController_presentPayLaterFinancingPlanWithIdentifier___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__PKPassGroupsViewController_presentPayLaterFinancingPlanWithIdentifier___block_invoke_6;
  block[3] = &unk_1E59D44A0;
  id v8 = v3;
  long long v6 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v6;
  long long v10 = v6;
  id v9 = *(id *)(a1 + 32);
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __73__PKPassGroupsViewController_presentPayLaterFinancingPlanWithIdentifier___block_invoke_6(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

void __73__PKPassGroupsViewController_presentPayLaterFinancingPlanWithIdentifier___block_invoke_7(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) associatedPassUniqueID];
  if (v8)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v9 = *(void **)(a1 + 32);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __73__PKPassGroupsViewController_presentPayLaterFinancingPlanWithIdentifier___block_invoke_8;
    v10[3] = &unk_1E59D4680;
    objc_copyWeak(&v13, &location);
    int8x16_t v12 = vextq_s8(*(int8x16_t *)(a1 + 48), *(int8x16_t *)(a1 + 48), 8uLL);
    id v11 = *(id *)(a1 + 40);
    [v9 presentPassWithUniqueID:v8 animated:1 completionHandler:v10];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __73__PKPassGroupsViewController_presentPayLaterFinancingPlanWithIdentifier___block_invoke_8(uint64_t a1, char a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = WeakRetained;
  if ((a2 & 1) == 0 && *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) && WeakRetained != 0)
  {
    if (PKCanShowPayLaterPassItemsForAccount())
    {
      id v7 = [v5 presentedViewController];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v7 presentPayLaterFinancingPlan:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
      }
    }
    else
    {
      id v7 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        int v9 = 138412290;
        uint64_t v10 = v8;
        _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "PKPassGroupsViewController: Cannot present loan details for %@ because of the account state.", (uint8_t *)&v9, 0xCu);
      }
    }
  }
}

- (void)presentTransactionDetailsForTransactionWithServiceIdentifier:(id)a3 transactionSourceIdentifier:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6 && !self->_inFailForward)
  {
    uint64_t v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v6;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v7;
      _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Presenting transaction details for serviceIdentifier %@, transactionSourceIdentifier %@", buf, 0x16u);
    }

    objc_initWeak(&location, self);
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x2020000000;
    v30[3] = 0;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    id v33 = __Block_byref_object_copy__25;
    id v34 = __Block_byref_object_dispose__25;
    id v35 = 0;
    int v9 = dispatch_group_create();
    dispatch_group_enter(v9);
    paymentService = self->_paymentService;
    if (v7)
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      id v26[2] = __119__PKPassGroupsViewController_presentTransactionDetailsForTransactionWithServiceIdentifier_transactionSourceIdentifier___block_invoke;
      v26[3] = &unk_1E59D46D0;
      uint64_t v11 = &v29;
      objc_copyWeak(&v29, &location);
      id v28 = v30;
      int8x16_t v12 = v9;
      id v27 = v12;
      [(PKPaymentService *)paymentService transactionSourceTypeForTransactionSourceIdentifier:v7 completion:v26];
      dispatch_group_enter(v12);
      id v13 = self->_paymentService;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __119__PKPassGroupsViewController_presentTransactionDetailsForTransactionWithServiceIdentifier_transactionSourceIdentifier___block_invoke_2;
      v22[3] = &unk_1E59D46F8;
      objc_copyWeak(&v25, &location);
      uint64_t v24 = buf;
      uint64_t v23 = v12;
      [(PKPaymentService *)v13 transactionWithServiceIdentifier:v6 transactionSourceIdentifier:v7 completion:v22];

      objc_destroyWeak(&v25);
    }
    else
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      id v16[2] = __119__PKPassGroupsViewController_presentTransactionDetailsForTransactionWithServiceIdentifier_transactionSourceIdentifier___block_invoke_3;
      v16[3] = &unk_1E59D4720;
      uint64_t v11 = &v21;
      objc_copyWeak(&v21, &location);
      v16[4] = self;
      id v17 = 0;
      id v19 = buf;
      id v20 = v30;
      id v18 = v9;
      [(PKPaymentService *)paymentService ambiguousTransactionWithServiceIdentifier:v6 completion:v16];
    }
    objc_destroyWeak(v11);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    id v14[2] = __119__PKPassGroupsViewController_presentTransactionDetailsForTransactionWithServiceIdentifier_transactionSourceIdentifier___block_invoke_5;
    void v14[3] = &unk_1E59D4748;
    objc_copyWeak(&v15, &location);
    void v14[4] = buf;
    void v14[5] = v30;
    dispatch_group_notify(v9, MEMORY[0x1E4F14428], v14);
    objc_destroyWeak(&v15);

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(v30, 8);
    objc_destroyWeak(&location);
  }
}

void __119__PKPassGroupsViewController_presentTransactionDetailsForTransactionWithServiceIdentifier_transactionSourceIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __119__PKPassGroupsViewController_presentTransactionDetailsForTransactionWithServiceIdentifier_transactionSourceIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __119__PKPassGroupsViewController_presentTransactionDetailsForTransactionWithServiceIdentifier_transactionSourceIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(void **)(*(void *)(a1 + 32) + 1080);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __119__PKPassGroupsViewController_presentTransactionDetailsForTransactionWithServiceIdentifier_transactionSourceIdentifier___block_invoke_4;
  v8[3] = &unk_1E59D46D0;
  objc_copyWeak(&v11, (id *)(a1 + 72));
  uint64_t v10 = *(void *)(a1 + 64);
  id v9 = *(id *)(a1 + 48);
  [v7 transactionSourceTypeForTransactionSourceIdentifier:v6 completion:v8];

  objc_destroyWeak(&v11);
}

void __119__PKPassGroupsViewController_presentTransactionDetailsForTransactionWithServiceIdentifier_transactionSourceIdentifier___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __119__PKPassGroupsViewController_presentTransactionDetailsForTransactionWithServiceIdentifier_transactionSourceIdentifier___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _presentTransactionDetailsForTransaction:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) transactionSourceType:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
}

- (void)presentTransactionDetailsForBankConnectTransaction:(id)a3 applePayPrimaryAccountIdentifier:(id)a4
{
  if (a3 && a4)
  {
    uint64_t v6 = (objc_class *)MEMORY[0x1E4F84CF8];
    id v7 = a4;
    id v8 = a3;
    id v9 = (void *)[[v6 alloc] initFromFKTransaction:v8];

    uint64_t v10 = [MEMORY[0x1E4F84898] sharedInstance];
    id v11 = [v10 passWithFPANIdentifier:v7];

    if (v11)
    {
      int8x16_t v12 = [v11 paymentPass];
      id v13 = [v12 uniqueID];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __114__PKPassGroupsViewController_presentTransactionDetailsForBankConnectTransaction_applePayPrimaryAccountIdentifier___block_invoke;
      v15[3] = &unk_1E59CC188;
      void v15[4] = self;
      id v16 = v9;
      id v17 = v12;
      id v14 = v12;
      [(PKPassGroupsViewController *)self presentPassWithUniqueID:v13 context:0 animated:1 completionHandler:v15];
    }
  }
}

void __114__PKPassGroupsViewController_presentTransactionDetailsForBankConnectTransaction_applePayPrimaryAccountIdentifier___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v4 = [*(id *)(a1 + 32) presentedViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v4 presentTransaction:*(void *)(a1 + 40) forPaymentPass:*(void *)(a1 + 48)];
    }
  }
}

- (void)_presentTransactionDetailsForTransaction:(id)a3 transactionSourceType:(unint64_t)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    switch(a4)
    {
      case 0uLL:
        paymentService = self->_paymentService;
        id v9 = [v6 identifier];
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __93__PKPassGroupsViewController__presentTransactionDetailsForTransaction_transactionSourceType___block_invoke;
        v28[3] = &unk_1E59CFC90;
        v28[4] = self;
        id v29 = v7;
        [(PKPaymentService *)paymentService passUniqueIdentifierForTransactionWithIdentifier:v9 completion:v28];

        break;
      case 1uLL:
        uint64_t v10 = [v6 accountIdentifier];
        id v11 = [MEMORY[0x1E4F84E00] sharedInstance];
        int8x16_t v12 = [v11 account];

        id v13 = [v12 peerPaymentAccountWithIdentifier:v10];
        if (v13)
        {
          id v14 = v13;
          id v15 = self->_paymentService;
          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          void v23[2] = __93__PKPassGroupsViewController__presentTransactionDetailsForTransaction_transactionSourceType___block_invoke_223;
          v23[3] = &unk_1E59D4798;
          id v24 = v13;
          id v25 = self;
          id v26 = v12;
          id v27 = v7;
          id v16 = v12;
          id v17 = v14;
          [(PKPaymentService *)v15 familyMembersWithCompletion:v23];

          goto LABEL_6;
        }
        id v19 = PKLogFacilityTypeGetObject();
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_14;
        }
        *(_DWORD *)buf = 138412290;
        id v31 = v7;
        id v20 = "Cannot find a peer payment account for transaction %@";
        goto LABEL_13;
      case 2uLL:
LABEL_6:
        uint64_t v10 = [v7 accountIdentifier];
        int8x16_t v12 = [v7 altDSID];
        if (v12)
        {
          id v18 = [MEMORY[0x1E4F84270] sharedInstance];
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __93__PKPassGroupsViewController__presentTransactionDetailsForTransaction_transactionSourceType___block_invoke_228;
          v21[3] = &unk_1E59D21E8;
          void v21[4] = self;
          id v22 = v7;
          [v18 accountWithIdentifier:v10 completion:v21];
        }
        else
        {
          id v19 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v31 = v7;
            id v20 = "There is no altDSID defined for account user on tranasction %@";
LABEL_13:
            _os_log_impl(&dword_19F450000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 0xCu);
          }
LABEL_14:
        }
        break;
      case 3uLL:
        [(PKPassGroupsViewController *)self _presentAccountTransactionDetailsForTransaction:v6];
        break;
      default:
        break;
    }
  }
}

void __93__PKPassGroupsViewController__presentTransactionDetailsForTransaction_transactionSourceType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__PKPassGroupsViewController__presentTransactionDetailsForTransaction_transactionSourceType___block_invoke_2;
  block[3] = &unk_1E59CA8E8;
  id v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __93__PKPassGroupsViewController__presentTransactionDetailsForTransaction_transactionSourceType___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _passFromGroupsControllerWithUniqueIdentifier:*(void *)(a1 + 40)];
  id v3 = [v2 paymentPass];

  [*(id *)(a1 + 32) _presentTransactionDetailsForTransaction:*(void *)(a1 + 48) forPaymentPass:v3];
}

void __93__PKPassGroupsViewController__presentTransactionDetailsForTransaction_transactionSourceType___block_invoke_223(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__PKPassGroupsViewController__presentTransactionDetailsForTransaction_transactionSourceType___block_invoke_2_224;
  block[3] = &unk_1E59CB7E8;
  id v7 = *(id *)(a1 + 32);
  id v8 = v3;
  id v4 = *(void **)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = v4;
  id v11 = *(id *)(a1 + 56);
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __93__PKPassGroupsViewController__presentTransactionDetailsForTransaction_transactionSourceType___block_invoke_2_224(id *a1)
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1[4] altDSID];
  if (!v2)
  {
    int8x16_t v12 = PKLogFacilityTypeGetObject();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    id v13 = a1[4];
    LODWORD(location[0]) = 138412290;
    *(id *)((char *)location + 4) = v13;
    id v14 = "There is no altDSID defined for associated account %@";
    goto LABEL_22;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v3 = a1[5];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (!v4)
  {
LABEL_14:

LABEL_20:
    int8x16_t v12 = PKLogFacilityTypeGetObject();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    LODWORD(location[0]) = 138412290;
    *(id *)((char *)location + 4) = v2;
    id v14 = "Cannot find a family member with altDSID %@";
LABEL_22:
    _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)location, 0xCu);
    goto LABEL_23;
  }
  uint64_t v5 = *(void *)v27;
LABEL_4:
  uint64_t v6 = 0;
  while (1)
  {
    if (*(void *)v27 != v5) {
      objc_enumerationMutation(v3);
    }
    id v7 = *(void **)(*((void *)&v26 + 1) + 8 * v6);
    id v8 = [v7 altDSID];
    id v9 = v2;
    id v10 = v9;
    if (v8 == v9) {
      break;
    }
    if (v8)
    {
      char v11 = [v8 isEqualToString:v9];

      if (v11) {
        goto LABEL_18;
      }
    }
    else
    {
    }
    if (v4 == ++v6)
    {
      uint64_t v4 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v4) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }

LABEL_18:
  id v15 = v7;

  if (!v15) {
    goto LABEL_20;
  }
  objc_initWeak(location, a1[6]);
  id v16 = a1[6];
  id v17 = [a1[7] associatedPassUniqueID];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __93__PKPassGroupsViewController__presentTransactionDetailsForTransaction_transactionSourceType___block_invoke_225;
  v20[3] = &unk_1E59D4770;
  objc_copyWeak(&v25, location);
  id v18 = a1[5];
  id v19 = a1[6];
  id v21 = v18;
  id v22 = v19;
  int8x16_t v12 = v15;
  uint64_t v23 = v12;
  id v24 = a1[8];
  [v16 presentPassWithUniqueID:v17 context:0 animated:1 completionHandler:v20];

  objc_destroyWeak(&v25);
  objc_destroyWeak(location);
LABEL_23:
}

void __93__PKPassGroupsViewController__presentTransactionDetailsForTransaction_transactionSourceType___block_invoke_225(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    if (WeakRetained)
    {
      id v12 = WeakRetained;
      uint64_t v5 = [WeakRetained presentedViewController];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v6 = v5;
      }
      else {
        id v6 = 0;
      }
      id v7 = (void *)[objc_alloc(MEMORY[0x1E4F84710]) initWithFamilyMembers:*(void *)(a1 + 32)];
      id v8 = [[PKPeerPaymentAssociatedAccountsController alloc] initWithFamilyCollection:v7 avatarManager:*(void *)(*(void *)(a1 + 40) + 1232) passLibraryDataProvider:*(void *)(*(void *)(a1 + 40) + 1160) context:0];
      uint64_t v9 = *(void *)(a1 + 40);
      id v10 = *(void **)(v9 + 1184);
      *(void *)(v9 + 1184) = v8;

      char v11 = [[PKPeerPaymentAssociatedAccountPresentationContext alloc] initWithPKFamilyMember:*(void *)(a1 + 48) transaction:*(void *)(a1 + 56)];
      [*(id *)(*(void *)(a1 + 40) + 1184) presentAssociatedAccountsFlowWithPresentationContext:v11 fromNavigationController:v6];

      id WeakRetained = v12;
    }
  }
}

void __93__PKPassGroupsViewController__presentTransactionDetailsForTransaction_transactionSourceType___block_invoke_228(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__PKPassGroupsViewController__presentTransactionDetailsForTransaction_transactionSourceType___block_invoke_2_229;
  block[3] = &unk_1E59CA8E8;
  uint64_t v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __93__PKPassGroupsViewController__presentTransactionDetailsForTransaction_transactionSourceType___block_invoke_2_229(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) associatedPassUniqueID];
  uint64_t v4 = [v2 _passFromGroupsControllerWithUniqueIdentifier:v3];
  id v6 = [v4 paymentPass];

  id v5 = v6;
  if (v6)
  {
    [*(id *)(a1 + 32) _presentTransactionDetailsForTransaction:*(void *)(a1 + 48) forPaymentPass:v6];
    id v5 = v6;
  }
}

- (void)_presentAccountTransactionDetailsForTransaction:(id)a3
{
  id v4 = a3;
  id v5 = [v4 accountIdentifier];
  objc_initWeak(&location, self);
  id v6 = [MEMORY[0x1E4F84270] sharedInstance];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__PKPassGroupsViewController__presentAccountTransactionDetailsForTransaction___block_invoke;
  v8[3] = &unk_1E59D47E8;
  void v8[4] = self;
  objc_copyWeak(&v10, &location);
  id v7 = v4;
  id v9 = v7;
  [v6 accountWithIdentifier:v5 completion:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __78__PKPassGroupsViewController__presentAccountTransactionDetailsForTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 feature] == 5)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __78__PKPassGroupsViewController__presentAccountTransactionDetailsForTransaction___block_invoke_2;
    v4[3] = &unk_1E59D0E90;
    v4[4] = *(void *)(a1 + 32);
    objc_copyWeak(&v7, (id *)(a1 + 48));
    id v5 = *(id *)(a1 + 40);
    id v6 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v4);

    objc_destroyWeak(&v7);
  }
}

void __78__PKPassGroupsViewController__presentAccountTransactionDetailsForTransaction___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __78__PKPassGroupsViewController__presentAccountTransactionDetailsForTransaction___block_invoke_3;
  v3[3] = &unk_1E59D47C0;
  objc_copyWeak(&v6, (id *)(a1 + 56));
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 presentCreditPassAnimated:1 completion:v3];

  objc_destroyWeak(&v6);
}

void __78__PKPassGroupsViewController__presentAccountTransactionDetailsForTransaction___block_invoke_3(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      id v6 = WeakRetained;
      id v5 = [WeakRetained presentedViewController];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v5 presentTransaction:*(void *)(a1 + 32) forAccount:*(void *)(a1 + 40)];
      }

      id WeakRetained = v6;
    }
  }
}

- (void)_presentTransactionDetailsForTransaction:(id)a3 forPaymentPass:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F850C0]) initWithPaymentPass:v7];
    id v10 = [v8 uniqueID];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    id v12[2] = __86__PKPassGroupsViewController__presentTransactionDetailsForTransaction_forPaymentPass___block_invoke;
    v12[3] = &unk_1E59D4810;
    id v13 = v8;
    id v14 = v6;
    id v15 = self;
    id v16 = v9;
    id v11 = v9;
    [(PKPassGroupsViewController *)self presentPassWithUniqueID:v10 context:0 animated:1 completionHandler:v12];
  }
}

void __86__PKPassGroupsViewController__presentTransactionDetailsForTransaction_forPaymentPass___block_invoke(id *a1, char a2)
{
  char v4 = [a1[4] isTransitPass];
  if ((a2 & 1) == 0 && (v4 & 1) == 0 && [a1[5] hasBackingData])
  {
    objc_initWeak(&location, a1[6]);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __86__PKPassGroupsViewController__presentTransactionDetailsForTransaction_forPaymentPass___block_invoke_2;
    aBlock[3] = &unk_1E59CB378;
    objc_copyWeak(&v15, &location);
    id v13 = a1[5];
    id v14 = a1[4];
    id v5 = (void (**)(void))_Block_copy(aBlock);
    id v6 = [a1[4] associatedAccountServiceAccountIdentifier];

    if (v6)
    {
      id v7 = [MEMORY[0x1E4F84270] sharedInstance];
      id v8 = [a1[4] associatedAccountServiceAccountIdentifier];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __86__PKPassGroupsViewController__presentTransactionDetailsForTransaction_forPaymentPass___block_invoke_3;
      v9[3] = &unk_1E59D1EA0;
      id v10 = a1[7];
      id v11 = v5;
      [v7 accountWithIdentifier:v8 completion:v9];
    }
    else
    {
      v5[2](v5);
    }

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __86__PKPassGroupsViewController__presentTransactionDetailsForTransaction_forPaymentPass___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = [WeakRetained presentedViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v3 presentTransaction:*(void *)(a1 + 32) forPaymentPass:*(void *)(a1 + 40)];
    }

    id WeakRetained = v4;
  }
}

void __86__PKPassGroupsViewController__presentTransactionDetailsForTransaction_forPaymentPass___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F850C8]) initWithTransactionSource:*(void *)(a1 + 32)];
    BOOL v8 = +[PKCreditAccountController shouldDisplayTransactionsForTransactionSourceCollection:v7 withAccount:v5];

    if (v8)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __86__PKPassGroupsViewController__presentTransactionDetailsForTransaction_forPaymentPass___block_invoke_4;
      block[3] = &unk_1E59CAA98;
      id v10 = *(id *)(a1 + 40);
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

uint64_t __86__PKPassGroupsViewController__presentTransactionDetailsForTransaction_forPaymentPass___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)presentPeerPaymentTermsAcceptance
{
  id v3 = [(PKPassLibraryDataProvider *)self->_passLibraryDataProvider peerPaymentPassUniqueID];
  if (v3 && !self->_inFailForward)
  {
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __63__PKPassGroupsViewController_presentPeerPaymentTermsAcceptance__block_invoke;
    v4[3] = &unk_1E59CB268;
    objc_copyWeak(&v6, &location);
    id v5 = v3;
    [(PKPassGroupsViewController *)self presentPassWithUniqueID:v5 animated:1 completionHandler:v4];

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __63__PKPassGroupsViewController_presentPeerPaymentTermsAcceptance__block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
    id v4 = [WeakRetained _passFromGroupsControllerWithUniqueIdentifier:*(void *)(a1 + 32)];
    id v5 = [v4 paymentPass];

    if (v5)
    {
      id v6 = [WeakRetained[146] account];
      id v7 = [v6 termsURL];
      BOOL v8 = [v6 termsIdentifier];
      id v9 = [v6 associatedPassUniqueID];
      if (v7) {
        BOOL v10 = v8 == 0;
      }
      else {
        BOOL v10 = 1;
      }
      if (!v10)
      {
        id v11 = [PKPeerPaymentTermsController alloc];
        id v12 = [MEMORY[0x1E4F84E10] sharedService];
        id v13 = [(PKPeerPaymentTermsController *)v11 initWithTermsURL:v7 termsIdentifier:v8 passUniqueID:v9 webService:v12];

        id v14 = objc_msgSend(WeakRetained, "pkui_frontMostViewController");
        id v15 = v14;
        if (v14)
        {
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          id v16[2] = __63__PKPassGroupsViewController_presentPeerPaymentTermsAcceptance__block_invoke_2;
          v16[3] = &unk_1E59D4838;
          id v17 = v14;
          [(PKPeerPaymentTermsController *)v13 presentTermsOverController:v17 showInterstitialViewController:0 withCompletionHandler:v16];
        }
      }
    }
  }
}

uint64_t __63__PKPassGroupsViewController_presentPeerPaymentTermsAcceptance__block_invoke_2(uint64_t result, uint64_t a2)
{
  if ((unint64_t)(a2 - 1) <= 1) {
    return [*(id *)(result + 32) dismissViewControllerAnimated:1 completion:0];
  }
  return result;
}

- (void)presentPeerPaymentVerifyIdentity
{
  if (!self->_inFailForward)
  {
    if (PKDeviceSupportsPeerPaymentIdentityVerification())
    {
      objc_initWeak(&location, self);
      v3[0] = MEMORY[0x1E4F143A8];
      v3[1] = 3221225472;
      v3[2] = __62__PKPassGroupsViewController_presentPeerPaymentVerifyIdentity__block_invoke;
      v3[3] = &unk_1E59D4860;
      objc_copyWeak(&v4, &location);
      [(PKPassGroupsViewController *)self presentPeerPaymentPassAnimated:1 completion:v3];
      objc_destroyWeak(&v4);
      objc_destroyWeak(&location);
    }
  }
}

void __62__PKPassGroupsViewController_presentPeerPaymentVerifyIdentity__block_invoke(uint64_t a1, char a2, void *a3)
{
  if (a3 && (a2 & 1) == 0)
  {
    id v3 = (id *)(a1 + 32);
    id v4 = a3;
    id WeakRetained = objc_loadWeakRetained(v3);
    id v5 = [WeakRetained _passFromGroupsControllerWithUniqueIdentifier:v4];

    id v6 = [v5 paymentPass];

    if (v6)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F84D60]);
      [v7 setVerificationContext:1];
      BOOL v8 = [WeakRetained _peerPaymentAccountResolutionController];
      [v8 presentFlowForAccountResolution:2 configuration:v7 completion:0];
    }
  }
}

- (void)presentPeerPaymentTopUp
{
  id v3 = [(PKPassLibraryDataProvider *)self->_passLibraryDataProvider peerPaymentPassUniqueID];
  if (v3 && !self->_inFailForward)
  {
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __53__PKPassGroupsViewController_presentPeerPaymentTopUp__block_invoke;
    v4[3] = &unk_1E59CCC78;
    objc_copyWeak(&v7, &location);
    id v5 = v3;
    id v6 = self;
    [(PKPassGroupsViewController *)self presentPassWithUniqueID:v5 animated:1 completionHandler:v4];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __53__PKPassGroupsViewController_presentPeerPaymentTopUp__block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    id v4 = [WeakRetained _passFromGroupsControllerWithUniqueIdentifier:*(void *)(a1 + 32)];
    id v5 = [v4 paymentPass];

    if (v5)
    {
      id v6 = [*(id *)(a1 + 40) _peerPaymentAccountResolutionController];
      [v6 presentFlowForAccountResolution:5 configuration:0 completion:0];
    }
  }
}

- (void)presentPeerPaymentSetupWithConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPassLibraryDataProvider *)self->_passLibraryDataProvider peerPaymentPassUniqueID];
  if (v5)
  {
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __71__PKPassGroupsViewController_presentPeerPaymentSetupWithConfiguration___block_invoke;
    v6[3] = &unk_1E59CCC78;
    objc_copyWeak(&v9, &location);
    id v7 = v5;
    id v8 = v4;
    [(PKPassGroupsViewController *)self presentPassWithUniqueID:v7 animated:1 completionHandler:v6];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __71__PKPassGroupsViewController_presentPeerPaymentSetupWithConfiguration___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    id v4 = [WeakRetained _passFromGroupsControllerWithUniqueIdentifier:*(void *)(a1 + 32)];
    id v5 = [v4 paymentPass];

    if (v5)
    {
      id v6 = [WeakRetained _peerPaymentAccountResolutionController];
      char v7 = [v6 peerPaymentPassIsProvisionedOnDevice];

      if ((v7 & 1) == 0)
      {
        id v8 = [WeakRetained _peerPaymentAccountResolutionController];
        [v8 presentFlowForAccountResolution:1 configuration:*(void *)(a1 + 40) completion:0];
      }
    }
  }
}

- (void)presentPeerPaymentRecurringPaymentWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPassLibraryDataProvider *)self->_passLibraryDataProvider peerPaymentPassUniqueID];
  if (v5 && !self->_inFailForward)
  {
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __79__PKPassGroupsViewController_presentPeerPaymentRecurringPaymentWithIdentifier___block_invoke;
    v6[3] = &unk_1E59CCC78;
    objc_copyWeak(&v9, &location);
    id v7 = v5;
    id v8 = v4;
    [(PKPassGroupsViewController *)self presentPassWithUniqueID:v7 animated:1 completionHandler:v6];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __79__PKPassGroupsViewController_presentPeerPaymentRecurringPaymentWithIdentifier___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    id v4 = [WeakRetained _passFromGroupsControllerWithUniqueIdentifier:*(void *)(a1 + 32)];
    id v5 = [v4 paymentPass];

    if (v5)
    {
      id v6 = [WeakRetained presentedViewController];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v6 presentPeerPaymentRecurringPaymentsWithIdentifier:*(void *)(a1 + 40) completion:0];
      }
    }
  }
}

- (void)presentPeerPaymentTransferToBank
{
  id v3 = [(PKPassLibraryDataProvider *)self->_passLibraryDataProvider peerPaymentPassUniqueID];
  if (v3 && !self->_inFailForward)
  {
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __62__PKPassGroupsViewController_presentPeerPaymentTransferToBank__block_invoke;
    v4[3] = &unk_1E59CB268;
    objc_copyWeak(&v6, &location);
    id v5 = v3;
    [(PKPassGroupsViewController *)self presentPassWithUniqueID:v5 animated:1 completionHandler:v4];

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __62__PKPassGroupsViewController_presentPeerPaymentTransferToBank__block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v4 = [WeakRetained _passFromGroupsControllerWithUniqueIdentifier:*(void *)(a1 + 32)];
    id v5 = [v4 paymentPass];

    if (v5)
    {
      id v6 = [WeakRetained presentedViewController];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = objc_alloc_init(MEMORY[0x1E4F848A0]);
        [v6 presentPeerPaymentActionViewControllerForAction:2 pass:v5 passLibraryDataProvider:v7];
      }
    }
  }
}

- (void)presentPeerPaymentDeviceTapWithInitialAmount:(id)a3 initialMemo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PKPassLibraryDataProvider *)self->_passLibraryDataProvider peerPaymentPassUniqueID];
  if (v8 && !self->_inFailForward)
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __87__PKPassGroupsViewController_presentPeerPaymentDeviceTapWithInitialAmount_initialMemo___block_invoke;
    v9[3] = &unk_1E59D4888;
    objc_copyWeak(&v13, &location);
    id v10 = v8;
    id v11 = v6;
    id v12 = v7;
    [(PKPassGroupsViewController *)self presentPassWithUniqueID:v10 animated:1 completionHandler:v9];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __87__PKPassGroupsViewController_presentPeerPaymentDeviceTapWithInitialAmount_initialMemo___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    id v4 = [WeakRetained _passFromGroupsControllerWithUniqueIdentifier:*(void *)(a1 + 32)];
    id v5 = [v4 paymentPass];

    if (v5)
    {
      id v6 = [v5 devicePrimaryPaymentApplication];
      id v7 = v6;
      if (v6 && [v6 state] == 1)
      {
        id v8 = [WeakRetained _peerPaymentAccountResolutionController];
        uint64_t v9 = [v8 currentPeerPaymentAccountResolution];

        if (v9)
        {
          id v10 = [WeakRetained _peerPaymentAccountResolutionController];
          [v10 presentResolutionForCurrentAccountStateWithCompletion:0];
        }
        else
        {
          id v10 = [WeakRetained presentedViewController];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v10 presentPeerPaymentDeviceTapWithInitialAmount:*(void *)(a1 + 40) initialMemo:*(void *)(a1 + 48)];
          }
        }
      }
    }
  }
}

- (void)presentAccountServiceSchedulePayment:(id)a3 billPayAmountType:(int64_t)a4 billPayAmount:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (v10)
  {
    objc_initWeak(&location, self);
    id v13 = objc_alloc_init(PKPassPresentationContext);
    [(PKPassPresentationContext *)v13 setLimitServerLoad:1];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    id v14[2] = __110__PKPassGroupsViewController_presentAccountServiceSchedulePayment_billPayAmountType_billPayAmount_completion___block_invoke;
    void v14[3] = &unk_1E59D48D8;
    objc_copyWeak(v19, &location);
    id v15 = v10;
    id v16 = self;
    v19[1] = (id)a4;
    id v17 = v11;
    id v18 = v12;
    [(PKPassGroupsViewController *)self presentPassWithUniqueID:v15 context:v13 animated:1 completionHandler:v14];

    objc_destroyWeak(v19);
    objc_destroyWeak(&location);
  }
}

void __110__PKPassGroupsViewController_presentAccountServiceSchedulePayment_billPayAmountType_billPayAmount_completion___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    id v4 = [WeakRetained _passFromGroupsControllerWithUniqueIdentifier:*(void *)(a1 + 32)];
    id v5 = [v4 paymentPass];

    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F850C0]) initWithPaymentPass:v5];
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F850C8]) initWithTransactionSource:v6];
    uint64_t v8 = [v5 associatedAccountServiceAccountIdentifier];
    uint64_t v9 = (void *)v8;
    if (v5)
    {
      if (v8)
      {
        v31[0] = 0;
        v31[1] = v31;
        v31[2] = 0x3032000000;
        v31[3] = __Block_byref_object_copy__25;
        v31[4] = __Block_byref_object_dispose__25;
        id v32 = 0;
        v29[0] = 0;
        v29[1] = v29;
        v29[2] = 0x3032000000;
        v29[3] = __Block_byref_object_copy__25;
        v29[4] = __Block_byref_object_dispose__25;
        id v30 = 0;
        id v10 = objc_alloc_init(MEMORY[0x1E4F84518]);
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        id v26[2] = __110__PKPassGroupsViewController_presentAccountServiceSchedulePayment_billPayAmountType_billPayAmount_completion___block_invoke_2;
        v26[3] = &unk_1E59CDD98;
        id v11 = v9;
        id v27 = v11;
        long long v28 = v31;
        [v10 addOperation:v26];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        void v23[2] = __110__PKPassGroupsViewController_presentAccountServiceSchedulePayment_billPayAmountType_billPayAmount_completion___block_invoke_5;
        v23[3] = &unk_1E59CDD98;
        id v24 = v11;
        id v25 = v29;
        [v10 addOperation:v23];
        id v12 = [MEMORY[0x1E4F1CA98] null];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        id v16[2] = __110__PKPassGroupsViewController_presentAccountServiceSchedulePayment_billPayAmountType_billPayAmount_completion___block_invoke_8;
        v16[3] = &unk_1E59D48B0;
        void v16[4] = *(void *)(a1 + 40);
        id v20 = v31;
        id v21 = v29;
        id v13 = v7;
        uint64_t v14 = *(void *)(a1 + 72);
        id v17 = v13;
        uint64_t v22 = v14;
        id v18 = *(id *)(a1 + 48);
        id v19 = *(id *)(a1 + 56);
        id v15 = (id)[v10 evaluateWithInput:v12 completion:v16];

        _Block_object_dispose(v29, 8);
        _Block_object_dispose(v31, 8);
      }
    }
  }
}

void __110__PKPassGroupsViewController_presentAccountServiceSchedulePayment_billPayAmountType_billPayAmount_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F84270] sharedInstance];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __110__PKPassGroupsViewController_presentAccountServiceSchedulePayment_billPayAmountType_billPayAmount_completion___block_invoke_3;
  void v13[3] = &unk_1E59CC7B0;
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v15 = v7;
  uint64_t v16 = v9;
  id v14 = v6;
  id v11 = v6;
  id v12 = v7;
  [v8 accountWithIdentifier:v10 completion:v13];
}

void __110__PKPassGroupsViewController_presentAccountServiceSchedulePayment_billPayAmountType_billPayAmount_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __110__PKPassGroupsViewController_presentAccountServiceSchedulePayment_billPayAmountType_billPayAmount_completion___block_invoke_4;
  block[3] = &unk_1E59D44A0;
  id v8 = v3;
  long long v6 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v6;
  long long v10 = v6;
  id v9 = *(id *)(a1 + 32);
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __110__PKPassGroupsViewController_presentAccountServiceSchedulePayment_billPayAmountType_billPayAmount_completion___block_invoke_4(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

void __110__PKPassGroupsViewController_presentAccountServiceSchedulePayment_billPayAmountType_billPayAmount_completion___block_invoke_5(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F84270] sharedInstance];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __110__PKPassGroupsViewController_presentAccountServiceSchedulePayment_billPayAmountType_billPayAmount_completion___block_invoke_6;
  void v13[3] = &unk_1E59CC828;
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v15 = v7;
  uint64_t v16 = v9;
  id v14 = v6;
  id v11 = v6;
  id v12 = v7;
  [v8 accountUsersForAccountWithIdentifier:v10 completion:v13];
}

void __110__PKPassGroupsViewController_presentAccountServiceSchedulePayment_billPayAmountType_billPayAmount_completion___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __110__PKPassGroupsViewController_presentAccountServiceSchedulePayment_billPayAmountType_billPayAmount_completion___block_invoke_7;
  block[3] = &unk_1E59D44F0;
  id v8 = v3;
  long long v6 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v6;
  long long v10 = v6;
  id v9 = *(id *)(a1 + 32);
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __110__PKPassGroupsViewController_presentAccountServiceSchedulePayment_billPayAmountType_billPayAmount_completion___block_invoke_7(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v2 = [objc_alloc(MEMORY[0x1E4F842C8]) initWithAccountUsers:*(void *)(a1 + 32)];
    uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v5();
}

void __110__PKPassGroupsViewController_presentAccountServiceSchedulePayment_billPayAmountType_billPayAmount_completion___block_invoke_8(void *a1)
{
  if (!*(void *)(a1[4] + 1216))
  {
    uint64_t v2 = [[PKAccountServiceAccountResolutionController alloc] initWithAccount:*(void *)(*(void *)(a1[8] + 8) + 40) accountUserCollection:*(void *)(*(void *)(a1[9] + 8) + 40) transactionSourceCollection:a1[5]];
    uint64_t v3 = a1[4];
    id v4 = *(void **)(v3 + 1216);
    *(void *)(v3 + 1216) = v2;

    objc_msgSend(*(id *)(a1[4] + 1216), "setDelegate:");
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F84278]);
  [v5 setBillPayAmountType:a1[10]];
  [v5 setBillPayAmount:a1[6]];
  [*(id *)(a1[4] + 1216) presentFlowForAccountResolution:1 configuration:v5 completion:a1[7]];
}

- (void)presentActionViewControllerWithUniqueID:(id)a3 actionType:(unint64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __81__PKPassGroupsViewController_presentActionViewControllerWithUniqueID_actionType___block_invoke;
    v8[3] = &unk_1E59D4900;
    long long v10 = self;
    unint64_t v11 = a4;
    id v9 = v6;
    [(PKPassGroupsViewController *)self presentPassWithUniqueID:v9 animated:1 completionHandler:v8];
  }
}

void __81__PKPassGroupsViewController_presentActionViewControllerWithUniqueID_actionType___block_invoke(uint64_t a1, char a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if ((a2 & 1) == 0)
  {
    uint64_t v3 = [MEMORY[0x1E4F84898] sharedInstance];
    id v4 = [v3 passWithUniqueID:*(void *)(a1 + 32)];
    id v5 = [v4 paymentPass];
    id v6 = v5;
    if (v5)
    {
      [v5 availableActions];
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v26;
        while (2)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v26 != v10) {
              objc_enumerationMutation(v7);
            }
            id v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            if ([v12 type] == *(void *)(a1 + 48))
            {
              id v23 = 0;
              uint64_t v24 = 0;
              char v13 = [v6 canPerformAction:v12 unableReason:&v24 displayableError:&v23];
              id v14 = v23;
              if ((v13 & 1) != 0 || v24 == 2)
              {
                id v15 = [[PKPerformActionViewController alloc] initWithPass:v6 action:v12];
                [(PKPerformActionViewController *)v15 setDelegate:*(void *)(a1 + 40)];
                uint64_t v16 = [[PKNavigationController alloc] initWithRootViewController:v15];
                [(PKNavigationController *)v16 setSupportedInterfaceOrientations:2];
                id v19 = objc_msgSend(*(id *)(a1 + 40), "pkui_frontMostViewController");
                [v19 presentViewController:v16 animated:1 completion:0];

                id v20 = PKLogFacilityTypeGetObject();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                {
                  id v21 = PKPaymentPassActionTypeToString();
                  *(_DWORD *)buf = 138412290;
                  id v30 = v21;
                  _os_log_impl(&dword_19F450000, v20, OS_LOG_TYPE_DEFAULT, "Presented PKPerformActionViewController for actionType %@", buf, 0xCu);
                }
              }
              else
              {
                v22[0] = MEMORY[0x1E4F143A8];
                v22[1] = 3221225472;
                v22[2] = __81__PKPassGroupsViewController_presentActionViewControllerWithUniqueID_actionType___block_invoke_238;
                v22[3] = &unk_1E59CA7D0;
                void v22[4] = *(void *)(a1 + 40);
                id v15 = +[PKPerformActionViewController alertControllerForUnableReason:v24 action:v12 displayableError:v14 addCardActionHandler:v22 unavailableActionHandler:0 cancelActionHandler:0];
                [*(id *)(a1 + 40) presentViewController:v15 animated:1 completion:0];
                PKLogFacilityTypeGetObject();
                uint64_t v16 = (PKNavigationController *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(&v16->super.super.super.super, OS_LOG_TYPE_DEFAULT))
                {
                  id v17 = PKPaymentPassActionTypeToString();
                  *(_DWORD *)buf = 138412546;
                  id v30 = v17;
                  __int16 v31 = 2112;
                  id v32 = v14;
                  _os_log_impl(&dword_19F450000, &v16->super.super.super.super, OS_LOG_TYPE_DEFAULT, "PKPerformActionViewController unavailable for actionType %@, error: %@", buf, 0x16u);
                }
              }

              goto LABEL_22;
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v33 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
LABEL_22:
    }
    else
    {
      id v7 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        id v30 = v18;
        _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Cannot present payment pass action for non-payment pass %@", buf, 0xCu);
      }
    }
  }
}

uint64_t __81__PKPassGroupsViewController_presentActionViewControllerWithUniqueID_actionType___block_invoke_238(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentPaymentSetupController];
}

- (void)presentAuxiliaryPassInformationItemDetailForItemIdentifier:(id)a3 informationIdentifier:(id)a4 forPassUniqueID:(id)a5 completion:(id)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v10 && v12)
  {
    id v14 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138478339;
      id v20 = v10;
      __int16 v21 = 2113;
      id v22 = v11;
      __int16 v23 = 2114;
      id v24 = v12;
      _os_log_impl(&dword_19F450000, v14, OS_LOG_TYPE_DEFAULT, "PKPassGroupsViewController: Presenting auxiliaryPassInformationItem with identifier %{private}@ in info %{private}@ for pass %{public}@", buf, 0x20u);
    }

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __138__PKPassGroupsViewController_presentAuxiliaryPassInformationItemDetailForItemIdentifier_informationIdentifier_forPassUniqueID_completion___block_invoke;
    v15[3] = &unk_1E59D4928;
    id v18 = v13;
    void v15[4] = self;
    id v16 = v10;
    id v17 = v11;
    [(PKPassGroupsViewController *)self presentPassWithUniqueID:v12 animated:1 completionHandler:v15];
  }
}

void __138__PKPassGroupsViewController_presentAuxiliaryPassInformationItemDetailForItemIdentifier_informationIdentifier_forPassUniqueID_completion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 56);
    if (v3)
    {
      id v4 = *(void (**)(void))(v3 + 16);
      v4();
    }
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) presentedViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 48);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __138__PKPassGroupsViewController_presentAuxiliaryPassInformationItemDetailForItemIdentifier_informationIdentifier_forPassUniqueID_completion___block_invoke_2;
      v10[3] = &unk_1E59CA9F8;
      id v11 = *(id *)(a1 + 56);
      [v5 presentAuxiliaryPassInformationItemWithIdentifier:v6 informationIdentifier:v7 completion:v10];
    }
    else
    {
      uint64_t v8 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v5;
        _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Unable to present aux pass information item detail over %@", buf, 0xCu);
      }

      uint64_t v9 = *(void *)(a1 + 56);
      if (v9) {
        (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, 1);
      }
    }
  }
}

uint64_t __138__PKPassGroupsViewController_presentAuxiliaryPassInformationItemDetailForItemIdentifier_informationIdentifier_forPassUniqueID_completion___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, a2 ^ 1u);
  }
  return result;
}

- (void)presentPassForFeatureIdentifier:(unint64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [MEMORY[0x1E4F84270] sharedInstance];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  _OWORD v11[2] = __82__PKPassGroupsViewController_presentPassForFeatureIdentifier_animated_completion___block_invoke;
  v11[3] = &unk_1E59D4950;
  BOOL v13 = a4;
  void v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [v9 defaultAccountForFeature:a3 completion:v11];
}

void __82__PKPassGroupsViewController_presentPassForFeatureIdentifier_animated_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__PKPassGroupsViewController_presentPassForFeatureIdentifier_animated_completion___block_invoke_2;
  v7[3] = &unk_1E59CF8B0;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  char v11 = *(unsigned char *)(a1 + 48);
  id v10 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __82__PKPassGroupsViewController_presentPassForFeatureIdentifier_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = [v2 associatedPassUniqueID];
    if (v3)
    {
      uint64_t v4 = *(unsigned __int8 *)(a1 + 56);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __82__PKPassGroupsViewController_presentPassForFeatureIdentifier_animated_completion___block_invoke_3;
      v9[3] = &unk_1E59CA820;
      id v5 = *(void **)(a1 + 40);
      id v11 = *(id *)(a1 + 48);
      id v10 = v3;
      [v5 presentPassWithUniqueID:v10 animated:v4 completionHandler:v9];
    }
    else
    {
      uint64_t v8 = *(void *)(a1 + 48);
      if (v8) {
        (*(void (**)(uint64_t, uint64_t, void))(v8 + 16))(v8, 1, 0);
      }
    }
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 48);
    if (v6)
    {
      uint64_t v7 = *(void (**)(void))(v6 + 16);
      v7();
    }
  }
}

uint64_t __82__PKPassGroupsViewController_presentPassForFeatureIdentifier_animated_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, *(void *)(a1 + 32));
  }
  return result;
}

- (void)presentCreditPassAnimated:(BOOL)a3 completion:(id)a4
{
}

- (void)presentAccountFeature:(unint64_t)a3 animated:(BOOL)a4 destination:(unint64_t)a5 fundingSourceIdentifier:(id)a6 completion:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  uint64_t v14 = objc_alloc_init(PKPassPresentationContext);
  [(PKPassPresentationContext *)v14 setPresentationSource:5];
  id v15 = objc_alloc_init(PKAccountViewInterfaceConfiguration);
  [(PKAccountViewInterfaceConfiguration *)v15 setDestination:a5];
  [(PKAccountViewInterfaceConfiguration *)v15 setViewStyle:0];
  objc_initWeak(location, self);
  id v16 = objc_alloc_init(MEMORY[0x1E4F84518]);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __108__PKPassGroupsViewController_presentAccountFeature_animated_destination_fundingSourceIdentifier_completion___block_invoke;
  v35[3] = &unk_1E59D49C8;
  v35[4] = self;
  BOOL v38 = a4;
  objc_copyWeak(&v37, location);
  id v17 = v13;
  id v36 = v17;
  [v16 addOperation:v35];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __108__PKPassGroupsViewController_presentAccountFeature_animated_destination_fundingSourceIdentifier_completion___block_invoke_4;
  v32[3] = &unk_1E59D49F0;
  unint64_t v34 = a3;
  id v18 = v15;
  id v33 = v18;
  [v16 addOperation:v32];
  if (a5 == 12)
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __108__PKPassGroupsViewController_presentAccountFeature_animated_destination_fundingSourceIdentifier_completion___block_invoke_6;
    v29[3] = &unk_1E59CE708;
    id v30 = v12;
    __int16 v31 = v18;
    [v16 addOperation:v29];
  }
  id v19 = [MEMORY[0x1E4F1CA98] null];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __108__PKPassGroupsViewController_presentAccountFeature_animated_destination_fundingSourceIdentifier_completion___block_invoke_8;
  v24[3] = &unk_1E59D4A40;
  id v20 = v17;
  id v27 = v20;
  objc_copyWeak(&v28, location);
  void v24[4] = self;
  __int16 v21 = v18;
  uint64_t v25 = v21;
  id v22 = v14;
  long long v26 = v22;
  id v23 = (id)[v16 evaluateWithInput:v19 completion:v24];

  objc_destroyWeak(&v28);
  objc_destroyWeak(&v37);

  objc_destroyWeak(location);
}

void __108__PKPassGroupsViewController_presentAccountFeature_animated_destination_fundingSourceIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *(void **)(a1 + 32);
  uint64_t v11 = *(unsigned __int8 *)(a1 + 56);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  id v14[2] = __108__PKPassGroupsViewController_presentAccountFeature_animated_destination_fundingSourceIdentifier_completion___block_invoke_2;
  void v14[3] = &unk_1E59D49A0;
  objc_copyWeak(&v18, (id *)(a1 + 48));
  id v12 = v9;
  id v16 = v12;
  id v13 = v8;
  id v15 = v13;
  id v17 = *(id *)(a1 + 40);
  [v10 presentCreditPassAnimated:v11 completion:v14];

  objc_destroyWeak(&v18);
}

void __108__PKPassGroupsViewController_presentAccountFeature_animated_destination_fundingSourceIdentifier_completion___block_invoke_2(id *a1, char a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __108__PKPassGroupsViewController_presentAccountFeature_animated_destination_fundingSourceIdentifier_completion___block_invoke_3;
  block[3] = &unk_1E59D4978;
  objc_copyWeak(&v8, a1 + 7);
  id v6 = a1[5];
  id v5 = a1[4];
  id v7 = a1[6];
  char v9 = a2;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
}

void __108__PKPassGroupsViewController_presentAccountFeature_animated_destination_fundingSourceIdentifier_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    if (!*(unsigned char *)(a1 + 64))
    {
      id v3 = [WeakRetained presentedViewController];
      objc_opt_class();
      objc_opt_isKindOfClass();
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __108__PKPassGroupsViewController_presentAccountFeature_animated_destination_fundingSourceIdentifier_completion___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F84270] sharedInstance];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __108__PKPassGroupsViewController_presentAccountFeature_animated_destination_fundingSourceIdentifier_completion___block_invoke_5;
  void v13[3] = &unk_1E59CEB38;
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = *(id *)(a1 + 32);
  id v15 = v6;
  id v16 = v7;
  id v14 = v10;
  id v11 = v6;
  id v12 = v7;
  [v8 defaultAccountForFeature:v9 completion:v13];
}

void __108__PKPassGroupsViewController_presentAccountFeature_animated_destination_fundingSourceIdentifier_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) setAccount:v3];
  if (v3) {
    [v3 state];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __108__PKPassGroupsViewController_presentAccountFeature_animated_destination_fundingSourceIdentifier_completion___block_invoke_6(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F84270] sharedInstance];
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = [*(id *)(a1 + 40) account];
  id v11 = [v10 accountIdentifier];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __108__PKPassGroupsViewController_presentAccountFeature_animated_destination_fundingSourceIdentifier_completion___block_invoke_7;
  v15[3] = &unk_1E59D4A18;
  id v12 = *(id *)(a1 + 40);
  id v17 = v6;
  id v18 = v7;
  id v16 = v12;
  id v13 = v6;
  id v14 = v7;
  [v8 paymentFundingSourceForIdentifier:v9 accountIdentifier:v11 completion:v15];
}

uint64_t __108__PKPassGroupsViewController_presentAccountFeature_animated_destination_fundingSourceIdentifier_completion___block_invoke_7(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setFundingSource:a2];
  if (!a2) {
    [*(id *)(a1 + 32) setDestination:4];
  }
  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v4();
}

void __108__PKPassGroupsViewController_presentAccountFeature_animated_destination_fundingSourceIdentifier_completion___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if ([a4 isCanceled])
  {
    uint64_t v5 = *(void *)(a1 + 56);
    if (v5)
    {
      id v6 = *(void (**)(void))(v5 + 16);
      v6();
    }
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __108__PKPassGroupsViewController_presentAccountFeature_animated_destination_fundingSourceIdentifier_completion___block_invoke_9;
    block[3] = &unk_1E59D4338;
    objc_copyWeak(&v14, (id *)(a1 + 64));
    id v7 = *(id *)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void **)(a1 + 40);
    id v13 = v7;
    void block[4] = v8;
    id v11 = v9;
    id v12 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v14);
  }
}

void __108__PKPassGroupsViewController_presentAccountFeature_animated_destination_fundingSourceIdentifier_completion___block_invoke_9(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    id v3 = [*(id *)(a1 + 32) presentedViewController];
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __108__PKPassGroupsViewController_presentAccountFeature_animated_destination_fundingSourceIdentifier_completion___block_invoke_10;
    v6[3] = &unk_1E59CA9F8;
    id v7 = *(id *)(a1 + 56);
    [v3 presentAccountWithConfiguration:v4 presentationContext:v5 animated:1 completion:v6];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __108__PKPassGroupsViewController_presentAccountFeature_animated_destination_fundingSourceIdentifier_completion___block_invoke_10(uint64_t a1, int a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a2 ^ 1u, 0);
  }
  return result;
}

- (void)presentAppleBalanceAddMoneyAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__PKPassGroupsViewController_presentAppleBalanceAddMoneyAnimated_completion___block_invoke;
  v8[3] = &unk_1E59D4A68;
  objc_copyWeak(&v10, &location);
  id v7 = v6;
  id v9 = v7;
  [(PKPassGroupsViewController *)self presentPassForFeatureIdentifier:4 animated:v4 completion:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __77__PKPassGroupsViewController_presentAppleBalanceAddMoneyAnimated_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (!v7) {
      goto LABEL_12;
    }
    id v14 = v6;
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, 1);
  }
  else
  {
    id v14 = v5;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v9 = [WeakRetained presentedViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v11 = [WeakRetained presentedViewController];
      [v11 presentAddMoneyAppleBalance];
      uint64_t v12 = *(void *)(a1 + 32);
      if (v12) {
        (*(void (**)(uint64_t, void))(v12 + 16))(v12, 0);
      }
    }
    else
    {
      uint64_t v13 = *(void *)(a1 + 32);
      if (v13) {
        (*(void (**)(uint64_t, uint64_t))(v13 + 16))(v13, 1);
      }
    }
  }
  id v6 = v14;
LABEL_12:
}

- (void)presentAppleBalanceAddMoneyInStoreTopUpAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __89__PKPassGroupsViewController_presentAppleBalanceAddMoneyInStoreTopUpAnimated_completion___block_invoke;
  v8[3] = &unk_1E59D4A68;
  objc_copyWeak(&v10, &location);
  id v7 = v6;
  id v9 = v7;
  [(PKPassGroupsViewController *)self presentPassForFeatureIdentifier:4 animated:v4 completion:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __89__PKPassGroupsViewController_presentAppleBalanceAddMoneyInStoreTopUpAnimated_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (!v7) {
      goto LABEL_12;
    }
    id v14 = v6;
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, 1);
  }
  else
  {
    id v14 = v5;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v9 = [WeakRetained presentedViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v11 = [WeakRetained presentedViewController];
      [v11 presentAddMoneyAppleBalanceInStoreTopUp];
      uint64_t v12 = *(void *)(a1 + 32);
      if (v12) {
        (*(void (**)(uint64_t, void))(v12 + 16))(v12, 0);
      }
    }
    else
    {
      uint64_t v13 = *(void *)(a1 + 32);
      if (v13) {
        (*(void (**)(uint64_t, uint64_t))(v13 + 16))(v13, 1);
      }
    }
  }
  id v6 = v14;
LABEL_12:
}

- (void)presentAppleBalanceAddMoneyDirectTopUpAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __88__PKPassGroupsViewController_presentAppleBalanceAddMoneyDirectTopUpAnimated_completion___block_invoke;
  v8[3] = &unk_1E59D4A68;
  objc_copyWeak(&v10, &location);
  id v7 = v6;
  id v9 = v7;
  [(PKPassGroupsViewController *)self presentPassForFeatureIdentifier:4 animated:v4 completion:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __88__PKPassGroupsViewController_presentAppleBalanceAddMoneyDirectTopUpAnimated_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (!v7) {
      goto LABEL_12;
    }
    id v14 = v6;
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, 1);
  }
  else
  {
    id v14 = v5;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v9 = [WeakRetained presentedViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v11 = [WeakRetained presentedViewController];
      [v11 presentAddMoneyAppleBalanceDirectTopUp];
      uint64_t v12 = *(void *)(a1 + 32);
      if (v12) {
        (*(void (**)(uint64_t, void))(v12 + 16))(v12, 0);
      }
    }
    else
    {
      uint64_t v13 = *(void *)(a1 + 32);
      if (v13) {
        (*(void (**)(uint64_t, uint64_t))(v13 + 16))(v13, 1);
      }
    }
  }
  id v6 = v14;
LABEL_12:
}

- (void)presentPayLaterPassAnimated:(BOOL)a3 completion:(id)a4
{
}

- (void)presentPassWithAssociatedAccountIdentifier:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (v8)
  {
    id v11 = [MEMORY[0x1E4F84270] sharedInstance];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    id v12[2] = __93__PKPassGroupsViewController_presentPassWithAssociatedAccountIdentifier_animated_completion___block_invoke;
    v12[3] = &unk_1E59D4950;
    void v12[4] = self;
    BOOL v14 = a4;
    id v13 = v10;
    [v11 accountWithIdentifier:v8 completion:v12];
  }
  else if (v9)
  {
    (*((void (**)(id, uint64_t, void))v9 + 2))(v9, 1, 0);
  }
}

void __93__PKPassGroupsViewController_presentPassWithAssociatedAccountIdentifier_animated_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __93__PKPassGroupsViewController_presentPassWithAssociatedAccountIdentifier_animated_completion___block_invoke_2;
  v7[3] = &unk_1E59CF8B0;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  char v11 = *(unsigned char *)(a1 + 48);
  id v10 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __93__PKPassGroupsViewController_presentPassWithAssociatedAccountIdentifier_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = [v2 associatedPassUniqueID];
    if (v3)
    {
      uint64_t v4 = *(unsigned __int8 *)(a1 + 56);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __93__PKPassGroupsViewController_presentPassWithAssociatedAccountIdentifier_animated_completion___block_invoke_3;
      v9[3] = &unk_1E59CA820;
      id v5 = *(void **)(a1 + 40);
      id v11 = *(id *)(a1 + 48);
      id v10 = v3;
      [v5 presentPassWithUniqueID:v10 animated:v4 completionHandler:v9];
    }
    else
    {
      uint64_t v8 = *(void *)(a1 + 48);
      if (v8) {
        (*(void (**)(uint64_t, uint64_t, void))(v8 + 16))(v8, 1, 0);
      }
    }
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 48);
    if (v6)
    {
      uint64_t v7 = *(void (**)(void))(v6 + 16);
      v7();
    }
  }
}

uint64_t __93__PKPassGroupsViewController_presentPassWithAssociatedAccountIdentifier_animated_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, *(void *)(a1 + 32));
  }
  return result;
}

- (void)presentPassDetailsAssociatedWithVirtualCardID:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8 = a5;
  uint64_t v9 = (void *)MEMORY[0x1E4F84270];
  id v10 = a3;
  id v11 = [v9 sharedInstance];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __96__PKPassGroupsViewController_presentPassDetailsAssociatedWithVirtualCardID_animated_completion___block_invoke;
  void v13[3] = &unk_1E59D4950;
  BOOL v15 = a4;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 accountWithVirtualCardIdentifier:v10 completion:v13];
}

void __96__PKPassGroupsViewController_presentPassDetailsAssociatedWithVirtualCardID_animated_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __96__PKPassGroupsViewController_presentPassDetailsAssociatedWithVirtualCardID_animated_completion___block_invoke_2;
  v7[3] = &unk_1E59CF8B0;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  char v11 = *(unsigned char *)(a1 + 48);
  id v10 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __96__PKPassGroupsViewController_presentPassDetailsAssociatedWithVirtualCardID_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = [v2 associatedPassUniqueID];
    if (v3)
    {
      uint64_t v4 = *(void **)(a1 + 40);
      uint64_t v5 = *(unsigned __int8 *)(a1 + 56);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __96__PKPassGroupsViewController_presentPassDetailsAssociatedWithVirtualCardID_animated_completion___block_invoke_3;
      v9[3] = &unk_1E59D4F88;
      void v9[4] = v4;
      id v10 = *(id *)(a1 + 32);
      char v12 = *(unsigned char *)(a1 + 56);
      id v11 = *(id *)(a1 + 48);
      [v4 presentPassDetailsWithUniqueID:v3 animated:v5 completionHandler:v9];
    }
    else
    {
      uint64_t v8 = *(void *)(a1 + 48);
      if (v8) {
        (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, 1);
      }
    }
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 48);
    if (v6)
    {
      uint64_t v7 = *(void (**)(void))(v6 + 16);
      v7();
    }
  }
}

uint64_t __96__PKPassGroupsViewController_presentPassDetailsAssociatedWithVirtualCardID_animated_completion___block_invoke_3(uint64_t a1, int a2)
{
  if (a2 && PKSecureElementIsAvailable())
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = [v3 _appleCardUpsellAlertWithAccount:*(void *)(a1 + 40)];
    [v3 presentViewController:v4 animated:*(unsigned __int8 *)(a1 + 56) completion:0];
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    uint64_t v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

- (void)presentAccountServicePaymentWithReferenceIdentifier:(id)a3 forPassWithUniqueID:(id)a4
{
}

- (void)presentSpendingSummaryForPassUniqueIdentifier:(id)a3 type:(unint64_t)a4 categorization:(unint64_t)a5 unit:(unint64_t)a6 animated:(BOOL)a7 completion:(id)a8
{
  BOOL v8 = a7;
  id v14 = a8;
  id v15 = a3;
  id v16 = objc_alloc_init(PKPassPresentationContext);
  [(PKPassPresentationContext *)v16 setLimitServerLoad:1];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __121__PKPassGroupsViewController_presentSpendingSummaryForPassUniqueIdentifier_type_categorization_unit_animated_completion___block_invoke;
  v18[3] = &unk_1E59D4A90;
  unint64_t v20 = a4;
  unint64_t v21 = a5;
  unint64_t v22 = a6;
  void v18[4] = self;
  id v19 = v14;
  id v17 = v14;
  [(PKPassGroupsViewController *)self presentPassWithUniqueID:v15 context:v16 animated:v8 completionHandler:v18];
}

void __121__PKPassGroupsViewController_presentSpendingSummaryForPassUniqueIdentifier_type_categorization_unit_animated_completion___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3)
    {
      uint64_t v4 = *(void (**)(void))(v3 + 16);
      v4();
    }
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 32) presentedViewController];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && ([v5 isBeingDismissed] & 1) == 0)
    {
      uint64_t v7 = *(void *)(a1 + 48);
      uint64_t v8 = *(void *)(a1 + 56);
      uint64_t v9 = *(void *)(a1 + 64);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __121__PKPassGroupsViewController_presentSpendingSummaryForPassUniqueIdentifier_type_categorization_unit_animated_completion___block_invoke_2;
      v10[3] = &unk_1E59CAA98;
      id v11 = *(id *)(a1 + 40);
      [v5 presentSpendingSummaryWithType:v7 categorization:v8 unit:v9 completion:v10];
    }
    else
    {
      uint64_t v6 = *(void *)(a1 + 40);
      if (v6) {
        (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, 1);
      }
    }
  }
}

uint64_t __121__PKPassGroupsViewController_presentSpendingSummaryForPassUniqueIdentifier_type_categorization_unit_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)presentBalanceDetailsForPassUniqueIdentifier:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = objc_alloc_init(PKPassPresentationContext);
  [(PKPassPresentationContext *)v10 setLimitServerLoad:1];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  id v12[2] = __95__PKPassGroupsViewController_presentBalanceDetailsForPassUniqueIdentifier_animated_completion___block_invoke;
  v12[3] = &unk_1E59CF408;
  void v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  [(PKPassGroupsViewController *)self presentPassWithUniqueID:v9 context:v10 animated:v5 completionHandler:v12];
}

void __95__PKPassGroupsViewController_presentBalanceDetailsForPassUniqueIdentifier_animated_completion___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3)
    {
      uint64_t v4 = *(void (**)(void))(v3 + 16);
      v4();
    }
  }
  else
  {
    BOOL v5 = [*(id *)(a1 + 32) presentedViewController];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && ([v5 isBeingDismissed] & 1) == 0)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __95__PKPassGroupsViewController_presentBalanceDetailsForPassUniqueIdentifier_animated_completion___block_invoke_2;
      v7[3] = &unk_1E59CAA98;
      id v8 = *(id *)(a1 + 40);
      [v5 presentBalanceDetailsWithCompletion:v7];
    }
    else
    {
      uint64_t v6 = *(void *)(a1 + 40);
      if (v6) {
        (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, 1);
      }
    }
  }
}

uint64_t __95__PKPassGroupsViewController_presentBalanceDetailsForPassUniqueIdentifier_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)showStatementForIdentifier:(id)a3 passUniqueIdentifier:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = objc_alloc_init(PKPassPresentationContext);
  [(PKPassPresentationContext *)v13 setLimitServerLoad:1];
  id v14 = [MEMORY[0x1E4F84270] sharedInstance];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  id v19[2] = __98__PKPassGroupsViewController_showStatementForIdentifier_passUniqueIdentifier_animated_completion___block_invoke;
  v19[3] = &unk_1E59D4B30;
  id v23 = v13;
  id v24 = v12;
  id v20 = v10;
  unint64_t v21 = self;
  id v22 = v11;
  BOOL v25 = a5;
  id v15 = v13;
  id v16 = v11;
  id v17 = v10;
  id v18 = v12;
  [v14 accountForPassWithUniqueID:v16 completion:v19];
}

void __98__PKPassGroupsViewController_showStatementForIdentifier_passUniqueIdentifier_animated_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F84270] sharedInstance];
    BOOL v5 = [v3 accountIdentifier];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __98__PKPassGroupsViewController_showStatementForIdentifier_passUniqueIdentifier_animated_completion___block_invoke_2;
    v10[3] = &unk_1E59D4B08;
    id v6 = *(id *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = *(void **)(a1 + 48);
    id v11 = v6;
    uint64_t v12 = v7;
    id v13 = v8;
    id v14 = *(id *)(a1 + 56);
    char v16 = *(unsigned char *)(a1 + 72);
    id v15 = *(id *)(a1 + 64);
    [v4 creditStatementsForAccountIdentifier:v5 completion:v10];
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 64);
    if (v9) {
      (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, 1);
    }
  }
}

void __98__PKPassGroupsViewController_showStatementForIdentifier_passUniqueIdentifier_animated_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  unint64_t v21 = __Block_byref_object_copy__25;
  id v22 = __Block_byref_object_dispose__25;
  id v23 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __98__PKPassGroupsViewController_showStatementForIdentifier_passUniqueIdentifier_animated_completion___block_invoke_3;
  v15[3] = &unk_1E59D4AB8;
  id v16 = *(id *)(a1 + 32);
  id v17 = &v18;
  [v5 enumerateObjectsUsingBlock:v15];
  if (v19[5])
  {
    uint64_t v7 = *(void **)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(unsigned __int8 *)(a1 + 72);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    id v12[2] = __98__PKPassGroupsViewController_showStatementForIdentifier_passUniqueIdentifier_animated_completion___block_invoke_4;
    v12[3] = &unk_1E59D4AE0;
    void v12[4] = v7;
    id v14 = &v18;
    uint64_t v10 = *(void *)(a1 + 56);
    id v13 = *(id *)(a1 + 64);
    [v7 presentPassWithUniqueID:v8 context:v10 animated:v9 completionHandler:v12];
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 64);
    if (v11) {
      (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v11, 1);
    }
  }

  _Block_object_dispose(&v18, 8);
}

void __98__PKPassGroupsViewController_showStatementForIdentifier_passUniqueIdentifier_animated_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = [v11 identifier];
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = v3;
  id v6 = v4;
  if (v5 == v6)
  {

    goto LABEL_7;
  }
  uint64_t v7 = v6;
  if (!v5 || !v6)
  {

    goto LABEL_9;
  }
  int v8 = [v5 isEqualToString:v6];

  if (v8)
  {
LABEL_7:
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = v11;
    id v5 = *(id *)(v9 + 40);
    *(void *)(v9 + 40) = v10;
LABEL_9:
  }
}

void __98__PKPassGroupsViewController_showStatementForIdentifier_passUniqueIdentifier_animated_completion___block_invoke_4(uint64_t a1, char a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3)
    {
      uint64_t v4 = *(void (**)(void))(v3 + 16);
      v4();
    }
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) presentedViewController];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && ([v5 isBeingDismissed] & 1) == 0)
    {
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __98__PKPassGroupsViewController_showStatementForIdentifier_passUniqueIdentifier_animated_completion___block_invoke_5;
      v8[3] = &unk_1E59CAA98;
      id v9 = *(id *)(a1 + 40);
      [v5 showStatement:v7 completion:v8];
    }
    else
    {
      uint64_t v6 = *(void *)(a1 + 40);
      if (v6) {
        (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, 1);
      }
    }
  }
}

uint64_t __98__PKPassGroupsViewController_showStatementForIdentifier_passUniqueIdentifier_animated_completion___block_invoke_5(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)presentDailyCashForPassUniqueIdentifier:(id)a3 dateComponents:(id)a4 redemptionType:(unint64_t)a5 animated:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  if (a5 >= 3)
  {
    if (a5 == 3)
    {
      objc_initWeak(&location, self);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      id v16[2] = __120__PKPassGroupsViewController_presentDailyCashForPassUniqueIdentifier_dateComponents_redemptionType_animated_completion___block_invoke_3;
      v16[3] = &unk_1E59D4BA8;
      void v16[4] = self;
      objc_copyWeak(v19, &location);
      id v18 = v14;
      id v17 = v13;
      v19[1] = (id)3;
      dispatch_async(MEMORY[0x1E4F14428], v16);

      objc_destroyWeak(v19);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    id v15 = objc_alloc_init(PKPassPresentationContext);
    [(PKPassPresentationContext *)v15 setLimitServerLoad:1];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __120__PKPassGroupsViewController_presentDailyCashForPassUniqueIdentifier_dateComponents_redemptionType_animated_completion___block_invoke;
    v21[3] = &unk_1E59D4B58;
    void v21[4] = self;
    id v22 = v13;
    unint64_t v24 = a5;
    id v23 = v14;
    [(PKPassGroupsViewController *)self presentPassWithUniqueID:v12 context:v15 animated:v8 completionHandler:v21];
  }
}

void __120__PKPassGroupsViewController_presentDailyCashForPassUniqueIdentifier_dateComponents_redemptionType_animated_completion___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 48);
    if (v3)
    {
      uint64_t v4 = *(void (**)(void))(v3 + 16);
      v4();
    }
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) presentedViewController];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && ([v5 isBeingDismissed] & 1) == 0)
    {
      uint64_t v7 = *(void *)(a1 + 56);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __120__PKPassGroupsViewController_presentDailyCashForPassUniqueIdentifier_dateComponents_redemptionType_animated_completion___block_invoke_2;
      v9[3] = &unk_1E59CAA98;
      uint64_t v8 = *(void *)(a1 + 40);
      id v10 = *(id *)(a1 + 48);
      [v5 presentDailyCashForDateComponents:v8 redemptionType:v7 completion:v9];
    }
    else
    {
      uint64_t v6 = *(void *)(a1 + 48);
      if (v6) {
        (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, 1);
      }
    }
  }
}

uint64_t __120__PKPassGroupsViewController_presentDailyCashForPassUniqueIdentifier_dateComponents_redemptionType_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __120__PKPassGroupsViewController_presentDailyCashForPassUniqueIdentifier_dateComponents_redemptionType_animated_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __120__PKPassGroupsViewController_presentDailyCashForPassUniqueIdentifier_dateComponents_redemptionType_animated_completion___block_invoke_4;
  void v5[3] = &unk_1E59D4B80;
  objc_copyWeak(v8, (id *)(a1 + 56));
  id v7 = *(id *)(a1 + 48);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void **)(a1 + 64);
  id v6 = v3;
  v8[1] = v4;
  [v2 presentCreditPassAnimated:1 completion:v5];

  objc_destroyWeak(v8);
}

void __120__PKPassGroupsViewController_presentDailyCashForPassUniqueIdentifier_dateComponents_redemptionType_animated_completion___block_invoke_4(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if ((a2 & 1) != 0 || !WeakRetained)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v6 = [WeakRetained presentedViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = *(void *)(a1 + 56);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __120__PKPassGroupsViewController_presentDailyCashForPassUniqueIdentifier_dateComponents_redemptionType_animated_completion___block_invoke_5;
      v10[3] = &unk_1E59CAA98;
      uint64_t v8 = *(void *)(a1 + 32);
      id v11 = *(id *)(a1 + 40);
      [v6 presentDailyCashForDateComponents:v8 redemptionType:v7 completion:v10];
    }
    else
    {
      uint64_t v9 = *(void *)(a1 + 40);
      if (v9) {
        (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, 1);
      }
    }
  }
}

uint64_t __120__PKPassGroupsViewController_presentDailyCashForPassUniqueIdentifier_dateComponents_redemptionType_animated_completion___block_invoke_5(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)presentRewardsHubForPassUniqueIdentifier:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = objc_alloc_init(PKPassPresentationContext);
  [(PKPassPresentationContext *)v10 setLimitServerLoad:1];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  id v12[2] = __91__PKPassGroupsViewController_presentRewardsHubForPassUniqueIdentifier_animated_completion___block_invoke;
  v12[3] = &unk_1E59CF408;
  void v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  [(PKPassGroupsViewController *)self presentPassWithUniqueID:v9 context:v10 animated:v5 completionHandler:v12];
}

void __91__PKPassGroupsViewController_presentRewardsHubForPassUniqueIdentifier_animated_completion___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3)
    {
      uint64_t v4 = *(void (**)(void))(v3 + 16);
      v4();
    }
  }
  else
  {
    BOOL v5 = [*(id *)(a1 + 32) presentedViewController];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && ([v5 isBeingDismissed] & 1) == 0)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __91__PKPassGroupsViewController_presentRewardsHubForPassUniqueIdentifier_animated_completion___block_invoke_2;
      v7[3] = &unk_1E59CAA98;
      id v8 = *(id *)(a1 + 40);
      [v5 presentRewardsHubWithCompletion:v7];
    }
    else
    {
      uint64_t v6 = *(void *)(a1 + 40);
      if (v6) {
        (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, 1);
      }
    }
  }
}

uint64_t __91__PKPassGroupsViewController_presentRewardsHubForPassUniqueIdentifier_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)presentAccountPromotionForPassUniqueIdentifier:(id)a3 programIdentifier:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a6;
  id v12 = a3;
  id v13 = objc_alloc_init(PKPassPresentationContext);
  [(PKPassPresentationContext *)v13 setLimitServerLoad:1];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  id v16[2] = __115__PKPassGroupsViewController_presentAccountPromotionForPassUniqueIdentifier_programIdentifier_animated_completion___block_invoke;
  v16[3] = &unk_1E59CF8D8;
  void v16[4] = self;
  id v17 = v10;
  id v18 = v11;
  id v14 = v11;
  id v15 = v10;
  [(PKPassGroupsViewController *)self presentPassWithUniqueID:v12 context:v13 animated:v7 completionHandler:v16];
}

void __115__PKPassGroupsViewController_presentAccountPromotionForPassUniqueIdentifier_programIdentifier_animated_completion___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 48);
    if (v3)
    {
      uint64_t v4 = *(void (**)(void))(v3 + 16);
      v4();
    }
  }
  else
  {
    BOOL v5 = [*(id *)(a1 + 32) presentedViewController];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && ([v5 isBeingDismissed] & 1) == 0)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      id v8[2] = __115__PKPassGroupsViewController_presentAccountPromotionForPassUniqueIdentifier_programIdentifier_animated_completion___block_invoke_2;
      v8[3] = &unk_1E59CAA98;
      uint64_t v7 = *(void *)(a1 + 40);
      id v9 = *(id *)(a1 + 48);
      [v5 presentAccountPromotionWithProgramIdentifier:v7 completion:v8];
    }
    else
    {
      uint64_t v6 = *(void *)(a1 + 48);
      if (v6) {
        (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, 1);
      }
    }
  }
}

uint64_t __115__PKPassGroupsViewController_presentAccountPromotionForPassUniqueIdentifier_programIdentifier_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)presentRewardsHubMerchantsForPassUniqueIdentifier:(id)a3 privateIdentifier:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a6;
  id v12 = a3;
  id v13 = objc_alloc_init(PKPassPresentationContext);
  [(PKPassPresentationContext *)v13 setLimitServerLoad:1];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  id v16[2] = __118__PKPassGroupsViewController_presentRewardsHubMerchantsForPassUniqueIdentifier_privateIdentifier_animated_completion___block_invoke;
  v16[3] = &unk_1E59CF8D8;
  void v16[4] = self;
  id v17 = v10;
  id v18 = v11;
  id v14 = v11;
  id v15 = v10;
  [(PKPassGroupsViewController *)self presentPassWithUniqueID:v12 context:v13 animated:v7 completionHandler:v16];
}

void __118__PKPassGroupsViewController_presentRewardsHubMerchantsForPassUniqueIdentifier_privateIdentifier_animated_completion___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 48);
    if (v3)
    {
      uint64_t v4 = *(void (**)(void))(v3 + 16);
      v4();
    }
  }
  else
  {
    BOOL v5 = [*(id *)(a1 + 32) presentedViewController];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && ([v5 isBeingDismissed] & 1) == 0)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      id v8[2] = __118__PKPassGroupsViewController_presentRewardsHubMerchantsForPassUniqueIdentifier_privateIdentifier_animated_completion___block_invoke_2;
      v8[3] = &unk_1E59CAA98;
      uint64_t v7 = *(void *)(a1 + 40);
      id v9 = *(id *)(a1 + 48);
      [v5 presentRewardsHubMerchantsWithPrivateIdentifier:v7 completion:v8];
    }
    else
    {
      uint64_t v6 = *(void *)(a1 + 48);
      if (v6) {
        (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, 1);
      }
    }
  }
}

uint64_t __118__PKPassGroupsViewController_presentRewardsHubMerchantsForPassUniqueIdentifier_privateIdentifier_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (id)_cardTemplateInformationForArticleLayouts:(id)a3
{
  id v4 = a3;
  if ([(PKDiscoveryDataSource *)self->_discoveryDataSource isMiniCardsAllowed])
  {
    if (v4)
    {
      id v5 = v4;
    }
    else
    {
      id v5 = [(PKDiscoveryDataSource *)self->_discoveryDataSource articleLayouts];
    }
    uint64_t v7 = v5;
    char v8 = objc_msgSend(v5, "pk_containsObjectPassingTest:", &__block_literal_global_245);
    BOOL v9 = (PKDiscoveryForceIgnoreCEOCards() & 1) != 0
      || (v8 & 1) == 0
      && ![(PKPassGroupStackView *)self->_groupStackView discoveryGalleryHasWelcomeCards];
    uint64_t v6 = [[PKDiscoveryCardViewTemplateInformation alloc] initWithCardSize:v9 displayType:0];
  }
  else
  {
    uint64_t v6 = [[PKDiscoveryCardViewTemplateInformation alloc] initWithCardSize:0 displayType:0];
  }

  return v6;
}

uint64_t __72__PKPassGroupsViewController__cardTemplateInformationForArticleLayouts___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 entitledToForceLargeCard]) {
    uint64_t v3 = [v2 hasHitMaxLargeViewCount] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)presentDiscoveryArticleForItemWithIdentifier:(id)a3 referrerIdentifier:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  discoveryDataSource = self->_discoveryDataSource;
  id v13 = a4;
  id v14 = [(PKDiscoveryDataSource *)discoveryDataSource cachedDiscoveryArticleLayoutForItemWithIdentifier:v10];
  id v15 = [PKDiscoveryArticleViewController alloc];
  id v16 = [(PKPassGroupsViewController *)self _cardTemplateInformationForArticleLayouts:0];
  id v17 = [(PKDiscoveryArticleViewController *)v15 initWithArticleLayout:v14 referrerIdentifier:v13 cardTemplateInformation:v16];

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  id v26[2] = __114__PKPassGroupsViewController_presentDiscoveryArticleForItemWithIdentifier_referrerIdentifier_animated_completion___block_invoke;
  v26[3] = &unk_1E59D4BF0;
  void v26[4] = self;
  id v18 = v17;
  id v27 = v18;
  BOOL v29 = v7;
  BOOL v30 = v14 == 0;
  id v19 = v11;
  id v28 = v19;
  [(PKPassGroupsViewController *)self dismissPresentedVCsWithRequirements:8 animated:v7 performAction:v26];
  if (!v14)
  {
    uint64_t v20 = self->_discoveryDataSource;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __114__PKPassGroupsViewController_presentDiscoveryArticleForItemWithIdentifier_referrerIdentifier_animated_completion___block_invoke_3;
    v21[3] = &unk_1E59D4C40;
    id v22 = v18;
    BOOL v25 = v7;
    id v23 = v10;
    id v24 = v19;
    [(PKDiscoveryDataSource *)v20 discoveryArticleLayoutForItemWithIdentifier:v23 completion:v21];
  }
}

void __114__PKPassGroupsViewController_presentDiscoveryArticleForItemWithIdentifier_referrerIdentifier_animated_completion___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "pkui_frontMostViewController");
  uint64_t v3 = *(unsigned __int8 *)(a1 + 56);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __114__PKPassGroupsViewController_presentDiscoveryArticleForItemWithIdentifier_referrerIdentifier_animated_completion___block_invoke_2;
  void v5[3] = &unk_1E59CAF20;
  char v7 = *(unsigned char *)(a1 + 57);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v2 presentViewController:v4 animated:v3 completion:v5];
}

uint64_t __114__PKPassGroupsViewController_presentDiscoveryArticleForItemWithIdentifier_referrerIdentifier_animated_completion___block_invoke_2(uint64_t result)
{
  if (!*(unsigned char *)(result + 40))
  {
    uint64_t result = *(void *)(result + 32);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

void __114__PKPassGroupsViewController_presentDiscoveryArticleForItemWithIdentifier_referrerIdentifier_animated_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __114__PKPassGroupsViewController_presentDiscoveryArticleForItemWithIdentifier_referrerIdentifier_animated_completion___block_invoke_4;
  v9[3] = &unk_1E59D4C18;
  id v10 = v6;
  id v11 = v5;
  id v12 = *(id *)(a1 + 32);
  char v15 = *(unsigned char *)(a1 + 56);
  id v13 = *(id *)(a1 + 40);
  id v14 = *(id *)(a1 + 48);
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

uint64_t __114__PKPassGroupsViewController_presentDiscoveryArticleForItemWithIdentifier_referrerIdentifier_animated_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 || (uint64_t v14 = *(void *)(a1 + 40)) == 0)
  {
    uint64_t v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138412546;
      uint64_t v19 = v4;
      __int16 v20 = 2112;
      uint64_t v21 = v2;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Error presenting Discovery Article for itemIdentifier: %@ error: %@", buf, 0x16u);
    }

    id v5 = PKLocalizedDiscoveryString(&cfstr_DiscoveryArtic.isa);
    id v6 = PKLocalizedPaymentString(&cfstr_GenericErrorMe.isa);
    id v7 = [*(id *)(a1 + 32) domain];
    if ([v7 isEqualToString:*MEMORY[0x1E4F289A0]])
    {
      uint64_t v8 = [*(id *)(a1 + 32) code];

      if (v8 != -1009)
      {
LABEL_8:
        id v10 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v5 message:v6 preferredStyle:1];
        id v11 = (void *)MEMORY[0x1E4FB1410];
        id v12 = PKLocalizedString(&cfstr_OkButtonTitle.isa);
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        id v16[2] = __114__PKPassGroupsViewController_presentDiscoveryArticleForItemWithIdentifier_referrerIdentifier_animated_completion___block_invoke_265;
        v16[3] = &unk_1E59CB1F0;
        id v17 = *(id *)(a1 + 48);
        id v13 = [v11 actionWithTitle:v12 style:1 handler:v16];
        [v10 addAction:v13];

        [*(id *)(a1 + 48) setIsDownloading:0];
        [*(id *)(a1 + 48) presentViewController:v10 animated:1 completion:0];

        goto LABEL_11;
      }
      uint64_t v9 = PKLocalizedDiscoveryString(&cfstr_DiscoveryArtic_0.isa);

      PKLocalizedPaymentString(&cfstr_CouldNotConnec_0.isa);
      id v7 = v6;
      id v6 = v5 = (void *)v9;
    }

    goto LABEL_8;
  }
  [*(id *)(a1 + 48) setArticleLayout:v14 animated:*(unsigned __int8 *)(a1 + 72)];
LABEL_11:
  uint64_t result = *(void *)(a1 + 64);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __114__PKPassGroupsViewController_presentDiscoveryArticleForItemWithIdentifier_referrerIdentifier_animated_completion___block_invoke_265(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

- (void)presentSubcredentialInvitationWithIdentifier:(id)a3 remoteDeviceInvitationIdentifier:(id)a4 animated:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  paymentService = self->_paymentService;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __117__PKPassGroupsViewController_presentSubcredentialInvitationWithIdentifier_remoteDeviceInvitationIdentifier_animated___block_invoke;
  void v13[3] = &unk_1E59D4CB8;
  id v14 = v8;
  char v15 = self;
  BOOL v17 = a5;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  [(PKPaymentService *)paymentService subcredentialInvitationsWithCompletion:v13];
}

void __117__PKPassGroupsViewController_presentSubcredentialInvitationWithIdentifier_remoteDeviceInvitationIdentifier_animated___block_invoke(uint64_t a1, void *a2)
{
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  id v12[2] = __117__PKPassGroupsViewController_presentSubcredentialInvitationWithIdentifier_remoteDeviceInvitationIdentifier_animated___block_invoke_2;
  v12[3] = &unk_1E59D4C68;
  id v13 = *(id *)(a1 + 32);
  uint64_t v4 = objc_msgSend(a2, "pk_anyObjectPassingTest:", v12);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __117__PKPassGroupsViewController_presentSubcredentialInvitationWithIdentifier_remoteDeviceInvitationIdentifier_animated___block_invoke_3;
  v7[3] = &unk_1E59D4C90;
  char v11 = *(unsigned char *)(a1 + 56);
  id v5 = *(void **)(a1 + 48);
  void v7[4] = *(void *)(a1 + 40);
  id v8 = v4;
  id v9 = v5;
  id v10 = *(id *)(a1 + 32);
  id v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __117__PKPassGroupsViewController_presentSubcredentialInvitationWithIdentifier_remoteDeviceInvitationIdentifier_animated___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 identifier];
  uint64_t v3 = PKEqualObjects();

  return v3;
}

void __117__PKPassGroupsViewController_presentSubcredentialInvitationWithIdentifier_remoteDeviceInvitationIdentifier_animated___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 64);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __117__PKPassGroupsViewController_presentSubcredentialInvitationWithIdentifier_remoteDeviceInvitationIdentifier_animated___block_invoke_4;
  v6[3] = &unk_1E59D4C90;
  uint64_t v3 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v4;
  uint64_t v9 = v5;
  char v11 = *(unsigned char *)(a1 + 64);
  id v10 = *(id *)(a1 + 56);
  [v3 dismissPresentedVCsWithRequirements:0 animated:v2 performAction:v6];
}

void __117__PKPassGroupsViewController_presentSubcredentialInvitationWithIdentifier_remoteDeviceInvitationIdentifier_animated___block_invoke_4(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    if (*(void *)(a1 + 40))
    {
      id v13 = (id)[*(id *)(a1 + 32) copy];
      [v13 setIdentifier:*(void *)(a1 + 40)];
      uint64_t v2 = *(void *)(a1 + 32);
    }
    else
    {
      id v13 = 0;
    }
    [*(id *)(a1 + 48) _presentSubcredentialInvitation:v2 remoteInvite:v13 isShareActivation:0 referralSource:0 animated:*(unsigned __int8 *)(a1 + 64)];
  }
  else
  {
    uint64_t v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v4;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "No invitation with ID %@", buf, 0xCu);
    }

    uint64_t v5 = (void *)MEMORY[0x1E4FB1418];
    id v6 = PKLocalizedCredentialString(&cfstr_CarkeyCannotAd.isa);
    id v7 = PKLocalizedCredentialString(&cfstr_CarkeyInvitati_0.isa);
    id v8 = [v5 alertControllerWithTitle:v6 message:v7 preferredStyle:1];

    uint64_t v9 = (void *)MEMORY[0x1E4FB1410];
    id v10 = PKLocalizedCredentialString(&cfstr_SubcredentialM.isa);
    char v11 = [v9 actionWithTitle:v10 style:0 handler:0];
    [v8 addAction:v11];

    id v12 = objc_msgSend(*(id *)(a1 + 48), "pkui_frontMostViewController");
    [v12 presentViewController:v8 animated:1 completion:0];
  }
}

- (void)_presentSubcredentialInvitationFlowForPhoneInvitationMessage:(id)a3 isShareActivation:(BOOL)a4 referralSource:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = [MEMORY[0x1E4F84D50] remoteDeviceWebService];
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F84428]) initWithCrossPlatformInvitation:v10];
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__25;
  void v24[4] = __Block_byref_object_dispose__25;
  id v25 = 0;
  id v14 = [v10 embeddedAddressForDeviceType:1];
  if (v14 && v12)
  {
    uint64_t v15 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v15, OS_LOG_TYPE_DEFAULT, "Checking watch mailbox for watch invitation", buf, 2u);
    }

    uint64_t v16 = [v12 targetDevice];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __133__PKPassGroupsViewController__presentSubcredentialInvitationFlowForPhoneInvitationMessage_isShareActivation_referralSource_animated___block_invoke;
    v17[3] = &unk_1E59D4D08;
    __int16 v20 = v24;
    void v17[4] = self;
    id v18 = v13;
    BOOL v21 = v8;
    id v19 = v11;
    BOOL v22 = v6;
    [v16 retrieveShareInvitationForMailboxAddress:v14 completion:v17];
  }
  else
  {
    [(PKPassGroupsViewController *)self _presentSubcredentialInvitation:v13 remoteInvite:0 isShareActivation:v8 referralSource:v11 animated:v6];
  }

  _Block_object_dispose(v24, 8);
}

void __133__PKPassGroupsViewController__presentSubcredentialInvitationFlowForPhoneInvitationMessage_isShareActivation_referralSource_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = (objc_class *)MEMORY[0x1E4F84428];
    id v5 = v3;
    uint64_t v6 = [[v4 alloc] initWithCrossPlatformInvitation:v5];

    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    BOOL v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __133__PKPassGroupsViewController__presentSubcredentialInvitationFlowForPhoneInvitationMessage_isShareActivation_referralSource_animated___block_invoke_2;
  block[3] = &unk_1E59D4CE0;
  uint64_t v9 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v13 = v9;
  char v15 = *(unsigned char *)(a1 + 64);
  long long v11 = *(_OWORD *)(a1 + 48);
  id v10 = (id)v11;
  long long v14 = v11;
  char v16 = *(unsigned char *)(a1 + 65);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __133__PKPassGroupsViewController__presentSubcredentialInvitationFlowForPhoneInvitationMessage_isShareActivation_referralSource_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentSubcredentialInvitation:*(void *)(a1 + 40) remoteInvite:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) isShareActivation:*(unsigned __int8 *)(a1 + 64) referralSource:*(void *)(a1 + 48) animated:*(unsigned __int8 *)(a1 + 65)];
}

- (void)_presentSubcredentialInvitation:(id)a3 remoteInvite:(id)a4 isShareActivation:(BOOL)a5 referralSource:(id)a6 animated:(BOOL)a7
{
  BOOL v8 = a5;
  id v12 = (void *)MEMORY[0x1E4F84D50];
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  char v16 = [v12 remoteDeviceWebService];
  BOOL v17 = [PKSubcredentialInvitationFlowControllerContext alloc];
  id v18 = [MEMORY[0x1E4F84D50] sharedService];
  id v19 = [(PKSubcredentialInvitationFlowControllerContext *)v17 initWithInvitation:v15 localDeviceWebService:v18 remoteDeviceWebService:v16];

  [(PKSubcredentialInvitationFlowControllerContext *)v19 setRemoteDeviceInvitation:v14];
  [(PKSubcredentialInvitationFlowControllerContext *)v19 setIsShareActivation:v8];
  __int16 v20 = [[PKSubcredentialInvitationFlowController alloc] initWithDelegate:self];
  BOOL v21 = [[PKSubcredentialInvitationViewController alloc] initWithFlowController:v20 context:v19];
  [(PKPassShareRedemptionViewController *)v21 setReferralSource:v13];

  BOOL v22 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v21];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __117__PKPassGroupsViewController__presentSubcredentialInvitation_remoteInvite_isShareActivation_referralSource_animated___block_invoke;
  v24[3] = &unk_1E59D4D30;
  void v24[4] = self;
  id v25 = v22;
  BOOL v26 = a7;
  id v23 = v22;
  [(PKSubcredentialInvitationViewController *)v21 preflightWithCompletion:v24];
}

void __117__PKPassGroupsViewController__presentSubcredentialInvitation_remoteInvite_isShareActivation_referralSource_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "pkui_frontMostViewController");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 presentViewController:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48) completion:0];
}

- (BOOL)presentSubcredentialPairingFlowIfPossibleWithConfig:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4F84D50] sharedService];
  BOOL v8 = [v7 targetDevice];
  uint64_t v9 = [v8 paymentWebService:v7 supportedRegionFeatureOfType:2];

  if (v9)
  {
    id v24 = self;
    id v25 = v6;
    BOOL v23 = v4;
    id v10 = [v6 issuerIdentifier];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v11 = [v9 supportedTerminals];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v27;
LABEL_4:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v11);
        }
        char v16 = *(void **)(*((void *)&v26 + 1) + 8 * v15);
        BOOL v17 = [v16 partnerIdentifier];
        char v18 = [v17 isEqualToString:v10];

        if (v18) {
          break;
        }
        if (v13 == ++v15)
        {
          uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v32 count:16];
          if (v13) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v19 = v16;

      if (!v19) {
        goto LABEL_14;
      }
      uint64_t v6 = v25;
      if ([(PKPassLibraryDataProvider *)v24->_passLibraryDataProvider canAddSecureElementPassWithConfiguration:v25])
      {
        [(PKPassGroupsViewController *)v24 _presentSubcredentialPairingFlowWithConfig:v25 flowType:2 animated:v23];
        BOOL v20 = 1;
        goto LABEL_23;
      }
      BOOL v21 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v31 = v25;
        _os_log_impl(&dword_19F450000, v21, OS_LOG_TYPE_DEFAULT, "Unable to start provisioning flow with config: %@", buf, 0xCu);
      }
    }
    else
    {
LABEL_10:

LABEL_14:
      id v19 = PKLogFacilityTypeGetObject();
      uint64_t v6 = v25;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v31 = v10;
        _os_log_impl(&dword_19F450000, v19, OS_LOG_TYPE_DEFAULT, "Subcredential pairing flow not supported with issuer: %@", buf, 0xCu);
      }
    }
    BOOL v20 = 0;
LABEL_23:
  }
  else
  {
    id v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "Subcredential pairing flow not supported in region!", buf, 2u);
    }
    BOOL v20 = 0;
  }

  return v20;
}

- (void)_presentSubcredentialPairingFlowWithConfig:(id)a3 flowType:(int64_t)a4 animated:(BOOL)a5
{
  id v8 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __91__PKPassGroupsViewController__presentSubcredentialPairingFlowWithConfig_flowType_animated___block_invoke;
  v10[3] = &unk_1E59D4D80;
  void v10[4] = self;
  id v11 = v8;
  BOOL v13 = a5;
  int64_t v12 = a4;
  id v9 = v8;
  [(PKPassGroupsViewController *)self dismissPresentedVCsWithRequirements:0 animated:1 performAction:v10];
}

void __91__PKPassGroupsViewController__presentSubcredentialPairingFlowWithConfig_flowType_animated___block_invoke(uint64_t a1)
{
  if (PKV2SharingFlowEnabled())
  {
    id v2 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Using v2 owner pairing flow", buf, 2u);
    }

    id v3 = objc_alloc(MEMORY[0x1E4F84BB8]);
    BOOL v4 = [MEMORY[0x1E4F84D50] sharedService];
    id v5 = (void *)[v3 initWithWebService:v4];

    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F84ED0]) initWithEnvironment:0 provisioningController:v5 groupsController:*(void *)(*(void *)(a1 + 32) + 1264)];
    uint64_t v7 = [[PKPaymentSetupDismissibleNavigationController alloc] initWithContext:0];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    id v19[2] = __91__PKPassGroupsViewController__presentSubcredentialPairingFlowWithConfig_flowType_animated___block_invoke_287;
    v19[3] = &unk_1E59D4D58;
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    BOOL v20 = v7;
    uint64_t v21 = v8;
    id v10 = v7;
    +[PKProvisioningFlowBridge startInAppFlowWithNavController:v10 context:v6 addCarKeyConfiguration:v9 completion:v19];
    id v11 = objc_msgSend(*(id *)(a1 + 32), "pkui_frontMostViewController");
    [v11 presentViewController:v10 animated:*(unsigned __int8 *)(a1 + 56) completion:0];
  }
  else
  {
    char v18 = [[PKSubcredentialPairingFlowController alloc] initWithDelegate:*(void *)(a1 + 32)];
    int64_t v12 = -[PKSubcredentialPairingFlowControllerContext initWithFlowType:referralSource:]([PKSubcredentialPairingFlowControllerContext alloc], "initWithFlowType:referralSource:", *(void *)(a1 + 48), [*(id *)(a1 + 40) referralSource]);
    BOOL v13 = [MEMORY[0x1E4F84D50] sharedService];
    [(PKSubcredentialProvisioningFlowControllerContext *)v12 setLocalDeviceWebService:v13];

    [(PKSubcredentialPairingFlowControllerContext *)v12 setConfiguration:*(void *)(a1 + 40)];
    uint64_t v14 = [MEMORY[0x1E4F84D50] remoteDeviceWebService];
    [(PKSubcredentialProvisioningFlowControllerContext *)v12 setRemoteDeviceWebService:v14];

    uint64_t v15 = [(PKSubcredentialPairingFlowController *)v18 startingViewControllerForContext:v12];
    char v16 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v15];
    BOOL v17 = objc_msgSend(*(id *)(a1 + 32), "pkui_frontMostViewController");
    [v17 presentViewController:v16 animated:*(unsigned __int8 *)(a1 + 56) completion:0];
  }
}

void __91__PKPassGroupsViewController__presentSubcredentialPairingFlowWithConfig_flowType_animated___block_invoke_287(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __91__PKPassGroupsViewController__presentSubcredentialPairingFlowWithConfig_flowType_animated___block_invoke_2;
  v7[3] = &unk_1E59CA870;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v6 = v3;
  [v5 dismissViewControllerAnimated:1 completion:v7];
}

void __91__PKPassGroupsViewController__presentSubcredentialPairingFlowWithConfig_flowType_animated___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) firstObject];
  if (v2)
  {
    id v3 = *(void **)(a1 + 40);
    id v5 = v2;
    uint64_t v4 = [v2 uniqueID];
    [v3 presentPassWithUniqueID:v4 animated:1 completionHandler:0];

    id v2 = v5;
  }
}

- (void)presentShareableCredentialWithEncryptedProvisioningTargetsHexEncodedString:(id)a3 passThumbnailImageData:(id)a4 animated:(BOOL)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v9 = (void *)MEMORY[0x1E4F84D50];
  id v10 = a3;
  id v11 = [v9 sharedService];
  int64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F84BB8]) initWithWebService:v11];
  BOOL v13 = objc_msgSend(v10, "pk_decodeHexadecimal");

  id v39 = 0;
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v13 error:&v39];
  id v15 = v39;
  if (v14) {
    BOOL v16 = v15 == 0;
  }
  else {
    BOOL v16 = 0;
  }
  if (!v16)
  {
    id v17 = v15;
    [v14 finishDecoding];
    char v18 = 0;
LABEL_12:
    long long v27 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      long long v28 = [v17 description];
      *(_DWORD *)buf = 138412290;
      id v41 = v28;
      _os_log_impl(&dword_19F450000, v27, OS_LOG_TYPE_DEFAULT, "Unable to decode encrypted provisioning target: %@", buf, 0xCu);
    }
    long long v26 = PKDisplayableErrorForCommonType();
    id v29 = PKAlertForDisplayableErrorWithHandlers(v26, 0, 0, 0);
    if (v29) {
      [(PKPassGroupsViewController *)self presentViewController:v29 animated:1 completion:0];
    }

    goto LABEL_17;
  }
  BOOL v30 = a5;
  id v19 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
  uint64_t v22 = *MEMORY[0x1E4F284E8];
  id v38 = 0;
  char v18 = [v14 decodeTopLevelObjectOfClasses:v21 forKey:v22 error:&v38];
  id v17 = v38;

  [v14 finishDecoding];
  if (!v18) {
    goto LABEL_12;
  }
  if (![v18 count]) {
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_12;
  }
  BOOL v23 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v41 = v18;
    _os_log_impl(&dword_19F450000, v23, OS_LOG_TYPE_DEFAULT, "Presenting shareable credentials with encrypted provisioning targets: %@", buf, 0xCu);
  }

  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __137__PKPassGroupsViewController_presentShareableCredentialWithEncryptedProvisioningTargetsHexEncodedString_passThumbnailImageData_animated___block_invoke;
  v36[3] = &unk_1E59D4DA8;
  id v37 = v8;
  id v24 = objc_msgSend(v18, "pk_arrayByApplyingBlock:", v36);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __137__PKPassGroupsViewController_presentShareableCredentialWithEncryptedProvisioningTargetsHexEncodedString_passThumbnailImageData_animated___block_invoke_2;
  v31[3] = &unk_1E59D4DD0;
  id v32 = v12;
  uint64_t v33 = self;
  id v34 = v24;
  BOOL v35 = v30;
  id v25 = v24;
  [v32 validatePreconditions:v31];

  long long v26 = v37;
LABEL_17:
}

id __137__PKPassGroupsViewController_presentShareableCredentialWithEncryptedProvisioningTargetsHexEncodedString_passThumbnailImageData_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F84CC8]) initWithEncryptedProvisioningTarget:v3 provisioningSharingIdentifier:0 passThumbnailImageData:*(void *)(a1 + 32)];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

void __137__PKPassGroupsViewController_presentShareableCredentialWithEncryptedProvisioningTargetsHexEncodedString_passThumbnailImageData_animated___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    BOOL v13 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v5;
      _os_log_impl(&dword_19F450000, v13, OS_LOG_TYPE_DEFAULT, "Present navigation controller for shareable credential failed: %@", (uint8_t *)&buf, 0xCu);
    }

    id v6 = [*(id *)(a1 + 32) alertForDisplayableError:v5];
    if (v6) {
      [*(id *)(a1 + 40) presentViewController:v6 animated:1 completion:0];
    }
  }
  else
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F84ED0]) initWithEnvironment:0 provisioningController:*(void *)(a1 + 32) groupsController:*(void *)(*(void *)(a1 + 40) + 1264)];
    uint64_t v7 = [[PKPaymentSetupDismissibleNavigationController alloc] initWithContext:0];
    [(PKPaymentSetupDismissibleNavigationController *)v7 useStandardPlatformPresentationStyle];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    uint64_t v8 = *(void *)(a1 + 48);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __137__PKPassGroupsViewController_presentShareableCredentialWithEncryptedProvisioningTargetsHexEncodedString_passThumbnailImageData_animated___block_invoke_295;
    v15[3] = &unk_1E59CEDA0;
    p_long long buf = &buf;
    uint64_t v9 = v7;
    BOOL v16 = v9;
    +[PKProvisioningFlowBridge startShareableCredentialFlowWithNavController:v9 context:v6 credentials:v8 completion:v15];
    if (*(unsigned char *)(*((void *)&buf + 1) + 24))
    {
      id v10 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v14[0] = 0;
        _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "Failed to present shareable provisioning flow", (uint8_t *)v14, 2u);
      }

      id v11 = PKDisplayableErrorForCommonType();
      id v12 = PKAlertForDisplayableErrorWithHandlers(v11, 0, 0, 0);
      [*(id *)(a1 + 40) presentViewController:v12 animated:1 completion:0];
    }
    else
    {
      id v11 = objc_msgSend(*(id *)(a1 + 40), "pkui_frontMostViewController");
      [v11 presentViewController:v9 animated:*(unsigned __int8 *)(a1 + 56) completion:0];
    }

    _Block_object_dispose(&buf, 8);
  }
}

uint64_t __137__PKPassGroupsViewController_presentShareableCredentialWithEncryptedProvisioningTargetsHexEncodedString_passThumbnailImageData_animated___block_invoke_295(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

- (void)presentAddShareablePassConfiguration:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4F84D50] sharedService];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F84BB8]) initWithWebService:v7];
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  _OWORD v11[2] = __76__PKPassGroupsViewController_presentAddShareablePassConfiguration_animated___block_invoke;
  v11[3] = &unk_1E59D4DF8;
  objc_copyWeak(&v15, &location);
  id v9 = v8;
  id v12 = v9;
  BOOL v13 = self;
  id v10 = v6;
  id v14 = v10;
  BOOL v16 = a4;
  [v9 validatePreconditionsAndRegister:v11];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __76__PKPassGroupsViewController_presentAddShareablePassConfiguration_animated___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v5 || (a2 & 1) == 0)
    {
      id v12 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v16 = v5;
        _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "Present navigation controller for shareable configuration failed: %@", buf, 0xCu);
      }

      uint64_t v7 = [*(id *)(a1 + 32) alertForDisplayableError:v5];
      if (v7) {
        [WeakRetained presentViewController:v7 animated:1 completion:0];
      }
    }
    else
    {
      uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F84ED0]) initWithEnvironment:7 provisioningController:*(void *)(a1 + 32) groupsController:*(void *)(*(void *)(a1 + 40) + 1264)];
      uint64_t v8 = [[PKPaymentSetupDismissibleNavigationController alloc] initWithContext:0];
      [(PKPaymentSetupDismissibleNavigationController *)v8 useStandardPlatformPresentationStyle];
      uint64_t v9 = *(void *)(a1 + 48);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      void v13[2] = __76__PKPassGroupsViewController_presentAddShareablePassConfiguration_animated___block_invoke_296;
      void v13[3] = &unk_1E59D3F78;
      id v14 = v8;
      id v10 = v8;
      +[PKProvisioningFlowBridge startInAppFlowWithNavController:v10 context:v7 addPassConfiguration:v9 completion:v13];
      id v11 = objc_msgSend(WeakRetained, "pkui_frontMostViewController");
      [v11 presentViewController:v10 animated:*(unsigned __int8 *)(a1 + 64) completion:0];
    }
  }
}

uint64_t __76__PKPassGroupsViewController_presentAddShareablePassConfiguration_animated___block_invoke_296(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

- (void)presentShareInvitationWithMailboxAddress:(id)a3 referralSource:(id)a4 animated:(BOOL)a5
{
  id v6 = a3;
  id v9 = a4;
  id v7 = v6;
  id v8 = v9;
  PKSharingFetchInvitationFromMailboxAddress();
}

void __95__PKPassGroupsViewController_presentShareInvitationWithMailboxAddress_referralSource_animated___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a4)
  {
    id v9 = PKAlertForDisplayableErrorWithHandlers(a4, 0, 0, 0);
    id v5 = objc_msgSend(*(id *)(a1 + 32), "pkui_frontMostViewController");
    [v5 presentViewController:v9 animated:1 completion:0];
  }
  else
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    [v6 _presentShareRedemptionFlowWithInvitation:a2 handle:a3 referralSource:v7 originalShareURL:v8];
  }
}

- (void)_presentShareRedemptionFlowWithInvitation:(id)a3 handle:(id)a4 referralSource:(id)a5 originalShareURL:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __111__PKPassGroupsViewController__presentShareRedemptionFlowWithInvitation_handle_referralSource_originalShareURL___block_invoke;
  v18[3] = &unk_1E59CB7E8;
  void v18[4] = self;
  id v19 = v11;
  id v20 = v10;
  id v21 = v12;
  id v22 = v13;
  id v14 = v13;
  id v15 = v12;
  id v16 = v10;
  id v17 = v11;
  [(PKPassGroupsViewController *)self dismissPresentedVCsWithRequirements:0 animated:1 performAction:v18];
}

void __111__PKPassGroupsViewController__presentShareRedemptionFlowWithInvitation_handle_referralSource_originalShareURL___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F84BB8]);
  id v3 = [MEMORY[0x1E4F84D50] sharedService];
  uint64_t v4 = (void *)[v2 initWithWebService:v3];

  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F84ED0]) initWithEnvironment:0 provisioningController:v4 groupsController:*(void *)(*(void *)(a1 + 32) + 1264)];
  id v6 = [[PKPaymentSetupDismissibleNavigationController alloc] initWithContext:0];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __111__PKPassGroupsViewController__presentShareRedemptionFlowWithInvitation_handle_referralSource_originalShareURL___block_invoke_2;
  aBlock[3] = &unk_1E59D4E48;
  id v11 = *(id *)(a1 + 40);
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(a1 + 32);
  id v12 = v7;
  uint64_t v13 = v8;
  id v9 = _Block_copy(aBlock);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [*(id *)(a1 + 40) invalidate];
    +[PKProvisioningFlowBridge startShareRedemptionFlowWithNavController:v7 context:v5 invitation:*(void *)(a1 + 48) referralSource:*(void *)(a1 + 56) completion:v9];
  }
  else
  {
    +[PKProvisioningFlowBridge startCarKeyShareRedemptionFlowWithNavController:v7 context:v5 invitation:*(void *)(a1 + 48) handle:*(void *)(a1 + 40) originalShareURL:*(void *)(a1 + 64) completion:v9];
  }
  [*(id *)(a1 + 32) presentViewController:v7 animated:1 completion:0];
}

void __111__PKPassGroupsViewController__presentShareRedemptionFlowWithInvitation_handle_referralSource_originalShareURL___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) invalidate];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __111__PKPassGroupsViewController__presentShareRedemptionFlowWithInvitation_handle_referralSource_originalShareURL___block_invoke_3;
  v7[3] = &unk_1E59CA870;
  id v5 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v8 = v3;
  uint64_t v9 = v4;
  id v6 = v3;
  [v5 dismissViewControllerAnimated:1 completion:v7];
}

void __111__PKPassGroupsViewController__presentShareRedemptionFlowWithInvitation_handle_referralSource_originalShareURL___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) firstObject];
  if (v2)
  {
    id v3 = *(void **)(a1 + 40);
    id v5 = v2;
    uint64_t v4 = [v2 uniqueID];
    [v3 presentPassWithUniqueID:v4 animated:1 completionHandler:0];

    id v2 = v5;
  }
}

- (void)presentShareDetailsForPassUniqueIdentifier:(id)a3 shareIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __89__PKPassGroupsViewController_presentShareDetailsForPassUniqueIdentifier_shareIdentifier___block_invoke;
  v10[3] = &unk_1E59CC188;
  void v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(PKPassGroupsViewController *)self presentPassWithUniqueID:v9 animated:1 completionHandler:v10];
}

void __89__PKPassGroupsViewController_presentShareDetailsForPassUniqueIdentifier_shareIdentifier___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v3 = [*(id *)(a1 + 32) _passFromGroupsControllerWithUniqueIdentifier:*(void *)(a1 + 40)];
    uint64_t v4 = [v3 secureElementPass];

    id v5 = objc_alloc(MEMORY[0x1E4F85018]);
    id v6 = [MEMORY[0x1E4F84D50] sharedService];
    id v7 = objc_alloc_init(MEMORY[0x1E4F84A88]);
    id v8 = (void *)[v5 initWithPass:v4 webService:v6 paymentServiceProvider:v7 queue:MEMORY[0x1E4F14428]];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    id v12[2] = __89__PKPassGroupsViewController_presentShareDetailsForPassUniqueIdentifier_shareIdentifier___block_invoke_2;
    v12[3] = &unk_1E59CA8E8;
    id v13 = v8;
    id v9 = *(id *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 32);
    id v14 = v9;
    uint64_t v15 = v10;
    id v11 = v8;
    [v11 updateSharesWithCompletion:v12];
  }
}

void __89__PKPassGroupsViewController_presentShareDetailsForPassUniqueIdentifier_shareIdentifier___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) shareForShareIdentifier:*(void *)(a1 + 40)];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F84FF8]);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    id v8[2] = __89__PKPassGroupsViewController_presentShareDetailsForPassUniqueIdentifier_shareIdentifier___block_invoke_3;
    v8[3] = &unk_1E59D4810;
    id v9 = v2;
    id v10 = *(id *)(a1 + 32);
    id v11 = v3;
    uint64_t v12 = *(void *)(a1 + 48);
    id v4 = v3;
    [v4 authorizeDeviceOwnerWithAuthHandler:0 completion:v8];
  }
  else
  {
    id v5 = [[PKPassSharesListViewController alloc] initWithSharesController:*(void *)(a1 + 32)];
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v5];
    id v7 = objc_msgSend(*(id *)(a1 + 48), "pkui_frontMostViewController");
    [v7 presentViewController:v6 animated:1 completion:0];
  }
}

void __89__PKPassGroupsViewController_presentShareDetailsForPassUniqueIdentifier_shareIdentifier___block_invoke_3(uint64_t a1, int a2)
{
  if (a2)
  {
    id v5 = [[PKPassShareDetailsViewController alloc] initWithShare:*(void *)(a1 + 32) sharesController:*(void *)(a1 + 40) authorizer:*(void *)(a1 + 48)];
    id v3 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v5];
    id v4 = objc_msgSend(*(id *)(a1 + 56), "pkui_frontMostViewController");
    [v4 presentViewController:v3 animated:1 completion:0];
  }
}

- (void)presentEntitlementDetailsForPassUniqueIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __79__PKPassGroupsViewController_presentEntitlementDetailsForPassUniqueIdentifier___block_invoke;
  v6[3] = &unk_1E59CAEA8;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PKPassGroupsViewController *)self presentPassWithUniqueID:v5 animated:1 completionHandler:v6];
}

void __79__PKPassGroupsViewController_presentEntitlementDetailsForPassUniqueIdentifier___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v3 = [*(id *)(a1 + 32) _passFromGroupsControllerWithUniqueIdentifier:*(void *)(a1 + 40)];
    id v4 = [v3 secureElementPass];

    id v5 = objc_alloc(MEMORY[0x1E4F85018]);
    id v6 = [MEMORY[0x1E4F84D50] sharedService];
    id v7 = objc_alloc_init(MEMORY[0x1E4F84A88]);
    id v8 = (void *)[v5 initWithPass:v4 webService:v6 paymentServiceProvider:v7 queue:MEMORY[0x1E4F14428]];

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    _OWORD v11[2] = __79__PKPassGroupsViewController_presentEntitlementDetailsForPassUniqueIdentifier___block_invoke_2;
    v11[3] = &unk_1E59CA8E8;
    id v12 = v8;
    id v13 = v4;
    uint64_t v14 = *(void *)(a1 + 32);
    id v9 = v4;
    id v10 = v8;
    [v10 updateEntitlementsWithCompletion:v11];
  }
}

void __79__PKPassGroupsViewController_presentEntitlementDetailsForPassUniqueIdentifier___block_invoke_2(id *a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F84870]);
  id v3 = [a1[4] myEntitlements];
  id v4 = [a1[4] possiblePredefinedEntitlements];
  id v8 = (id)[v2 initWithMyEntitlements:v3 predefinedSharedEntitlements:v4];

  id v5 = -[PKPassShareEntitlementSelectionViewController initWithAccessType:mode:entitlementComposer:]([PKPassShareEntitlementSelectionViewController alloc], "initWithAccessType:mode:entitlementComposer:", [a1[5] accessType], 2, v8);
  [(PKPassShareEntitlementSelectionViewController *)v5 setShowDoneButton:1];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v5];
  id v7 = objc_msgSend(a1[6], "pkui_frontMostViewController");
  [v7 presentViewController:v6 animated:1 completion:0];
}

- (void)presentShareActivationWithShareIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__PKPassGroupsViewController_presentShareActivationWithShareIdentifier___block_invoke;
  v6[3] = &unk_1E59CA870;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PKPassGroupsViewController *)self dismissPresentedVCsWithRequirements:0 animated:1 performAction:v6];
}

uint64_t __72__PKPassGroupsViewController_presentShareActivationWithShareIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = *(void **)(v2 + 1080);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__PKPassGroupsViewController_presentShareActivationWithShareIdentifier___block_invoke_2;
  void v5[3] = &unk_1E59D4E70;
  void v5[4] = v2;
  return [v3 pendingShareActivationForShareIdentifier:v1 completion:v5];
}

void __72__PKPassGroupsViewController_presentShareActivationWithShareIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__PKPassGroupsViewController_presentShareActivationWithShareIdentifier___block_invoke_3;
  v6[3] = &unk_1E59CA870;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __72__PKPassGroupsViewController_presentShareActivationWithShareIdentifier___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v8 = [v2 originalInvitation];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [*(id *)(a1 + 40) _presentSubcredentialInvitationFlowForPhoneInvitationMessage:v8 isShareActivation:1 referralSource:0 animated:1];
    }
    else
    {
      id v5 = [[PKPassShareActivationViewController alloc] initWithPendingActivation:*(void *)(a1 + 32)];
      id v6 = [[PKNavigationController alloc] initWithRootViewController:v5];
      id v7 = objc_msgSend(*(id *)(a1 + 40), "pkui_frontMostViewController");
      [v7 presentViewController:v6 animated:1 completion:0];
    }
  }
  else
  {
    id v3 = [MEMORY[0x1E4F28C58] pkSharingError:5];
    id v8 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);

    uint64_t v4 = objc_msgSend(*(id *)(a1 + 40), "pkui_frontMostViewController");
    [v4 presentViewController:v8 animated:1 completion:0];
  }
}

- (void)presentProvisioningForPendingProvisioningOfType:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __89__PKPassGroupsViewController_presentProvisioningForPendingProvisioningOfType_identifier___block_invoke;
  v10[3] = &unk_1E59CA8E8;
  void v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(PKPassGroupsViewController *)self dismissPresentedVCsWithRequirements:0 animated:1 performAction:v10];
}

void __89__PKPassGroupsViewController_presentProvisioningForPendingProvisioningOfType_identifier___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  id v3 = (void *)a1[5];
  uint64_t v4 = *(void **)(v2 + 1080);
  uint64_t v5 = a1[6];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __89__PKPassGroupsViewController_presentProvisioningForPendingProvisioningOfType_identifier___block_invoke_2;
  v6[3] = &unk_1E59D4EE8;
  void v6[4] = v2;
  id v7 = v3;
  id v8 = (id)a1[6];
  [v4 retrievePendingProvisioningOfType:v7 withUniqueIdentifier:v5 completion:v6];
}

void __89__PKPassGroupsViewController_presentProvisioningForPendingProvisioningOfType_identifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 status] == 3)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __89__PKPassGroupsViewController_presentProvisioningForPendingProvisioningOfType_identifier___block_invoke_3;
    v7[3] = &unk_1E59CB8B0;
    id v4 = v3;
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(a1 + 40);
    id v8 = v4;
    uint64_t v9 = v5;
    id v10 = v6;
    id v11 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E4F14428], v7);
  }
}

void __89__PKPassGroupsViewController_presentProvisioningForPendingProvisioningOfType_identifier___block_invoke_3(id *a1)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1[4] credential];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F84BB8]);
    id v4 = [MEMORY[0x1E4F84D50] sharedService];
    uint64_t v5 = (void *)[v3 initWithWebService:v4];

    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F84ED0]) initWithEnvironment:0 provisioningController:v5 groupsController:0];
    id v7 = [[PKPaymentSetupDismissibleNavigationController alloc] initWithContext:0];
    objc_initWeak(&location, a1[5]);
    v19[0] = 0;
    v19[1] = v19;
    id v19[2] = 0x2020000000;
    char v20 = 0;
    v22[0] = v2;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    uint64_t v9 = [a1[5] navigationController];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __89__PKPassGroupsViewController_presentProvisioningForPendingProvisioningOfType_identifier___block_invoke_4;
    void v13[3] = &unk_1E59D4E98;
    objc_copyWeak(&v18, &location);
    id v17 = v19;
    id v10 = v7;
    uint64_t v14 = v10;
    id v15 = a1[6];
    id v16 = a1[7];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    _OWORD v11[2] = __89__PKPassGroupsViewController_presentProvisioningForPendingProvisioningOfType_identifier___block_invoke_6;
    v11[3] = &unk_1E59D4EC0;
    objc_copyWeak(&v12, &location);
    void v11[4] = a1[5];
    void v11[5] = v19;
    +[PKProvisioningFlowBridge startCredentialsProvisioningFlowWithNavController:v10 context:v6 credentials:v8 parentNavController:v9 presentNavController:v13 completion:v11];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&v18);
    _Block_object_dispose(v19, 8);
    objc_destroyWeak(&location);
  }
}

void __89__PKPassGroupsViewController_presentProvisioningForPendingProvisioningOfType_identifier___block_invoke_4(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    id v4 = WeakRetained;
    id v3 = objc_msgSend(WeakRetained, "pkui_frontMostViewController");
    [v3 presentViewController:*(void *)(a1 + 32) animated:1 completion:0];

    [v4[135] removePendingProvisioningOfType:*(void *)(a1 + 40) withUniqueIdentifier:*(void *)(a1 + 48) completion:&__block_literal_global_309];
    id WeakRetained = v4;
  }
}

void __89__PKPassGroupsViewController_presentProvisioningForPendingProvisioningOfType_identifier___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v3 = WeakRetained;
    [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
    id WeakRetained = v3;
  }
}

- (void)presentPeerPaymentPassAnimated:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F84E00] sharedInstance];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__PKPassGroupsViewController_presentPeerPaymentPassAnimated_completion___block_invoke;
  v9[3] = &unk_1E59D4F10;
  BOOL v11 = a3;
  void v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 accountWithCompletion:v9];
}

void __72__PKPassGroupsViewController_presentPeerPaymentPassAnimated_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__PKPassGroupsViewController_presentPeerPaymentPassAnimated_completion___block_invoke_2;
  v7[3] = &unk_1E59CF8B0;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  char v11 = *(unsigned char *)(a1 + 48);
  id v10 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __72__PKPassGroupsViewController_presentPeerPaymentPassAnimated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) associatedPassUniqueID];
  if (v2)
  {
    uint64_t v3 = *(unsigned __int8 *)(a1 + 56);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __72__PKPassGroupsViewController_presentPeerPaymentPassAnimated_completion___block_invoke_3;
    v6[3] = &unk_1E59CA820;
    uint64_t v4 = *(void **)(a1 + 40);
    id v8 = *(id *)(a1 + 48);
    id v7 = v2;
    [v4 presentPassWithUniqueID:v7 animated:v3 completionHandler:v6];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 48);
    if (v5) {
      (*(void (**)(uint64_t, uint64_t, void))(v5 + 16))(v5, 1, 0);
    }
  }
}

uint64_t __72__PKPassGroupsViewController_presentPeerPaymentPassAnimated_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, *(void *)(a1 + 32));
  }
  return result;
}

- (void)presentSecurePassSessionWithIssuerData:(id)a3 withSignature:(id)a4 animated:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  id v12[2] = __92__PKPassGroupsViewController_presentSecurePassSessionWithIssuerData_withSignature_animated___block_invoke;
  v12[3] = &unk_1E59CDC58;
  void v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  BOOL v15 = a5;
  id v10 = v9;
  id v11 = v8;
  [(PKPassGroupsViewController *)self dismissPresentedVCsWithRequirements:0 animated:1 performAction:v12];
}

void __92__PKPassGroupsViewController_presentSecurePassSessionWithIssuerData_withSignature_animated___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_alloc_init(PKServiceAddPassesViewController);
  [(PKServiceAddPassesViewController *)v2 setResultsDelegate:*(void *)(a1 + 32)];
  [(PKServiceAddPassesViewController *)v2 ingestPasses:0 orPassesContainer:0 orIssuerData:*(void *)(a1 + 40) withSignature:*(void *)(a1 + 48) fromPresentationSource:2];
  if (v2
    && ([(PKServiceAddPassesViewController *)v2 topViewController],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "pkui_frontMostViewController");
    [v4 presentViewController:v2 animated:*(unsigned __int8 *)(a1 + 56) completion:0];
  }
  else
  {
    uint64_t v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Unable to present issuer binding view controller", v11, 2u);
    }

    uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F87538] code:1 userInfo:0];
    id v6 = PKLocalizedPaymentString(&cfstr_IssuerDataGene.isa);
    id v7 = PKLocalizedPaymentString(&cfstr_IssuerDataGene_0.isa);
    id v8 = PKDisplayableErrorCustom();

    id v9 = PKAlertForDisplayableErrorWithHandlers(v8, 0, 0, 0);
    id v10 = objc_msgSend(*(id *)(a1 + 32), "pkui_frontMostViewController");
    [v10 presentViewController:v9 animated:1 completion:0];
  }
}

- (void)presentApplicationWithIdentifier:(id)a3
{
  id v4 = a3;
  paymentService = self->_paymentService;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__PKPassGroupsViewController_presentApplicationWithIdentifier___block_invoke;
  v7[3] = &unk_1E59D4D58;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [(PKPaymentService *)paymentService featureApplicationsForProvisioningWithCompletion:v7];
}

void __63__PKPassGroupsViewController_presentApplicationWithIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __63__PKPassGroupsViewController_presentApplicationWithIdentifier___block_invoke_2;
  v20[3] = &unk_1E59CEB10;
  id v21 = *(id *)(a1 + 32);
  id v7 = objc_msgSend(v5, "pk_firstObjectPassingTest:", v20);
  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F84BB8]);
    id v9 = [MEMORY[0x1E4F84D50] sharedService];
    id v10 = [v8 initWithWebService:v9];

    id v11 = [[PKApplyControllerConfiguration alloc] initWithSetupDelegate:0 context:0 provisioningController:v10];
    [(PKApplyControllerConfiguration *)v11 setFeatureApplication:v7];
    -[PKApplyControllerConfiguration setFeature:](v11, "setFeature:", [v7 feature]);
    id v12 = [[PKApplyController alloc] initWithApplyConfiguration:v11];
    uint64_t v14 = *(void *)(a1 + 40);
    id v13 = (id *)(a1 + 40);
    BOOL v15 = *(void **)(v14 + 1208);
    *(void *)(v14 + 1208) = v12;

    objc_initWeak(location, *v13);
    id v16 = (void *)*((void *)*v13 + 151);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __63__PKPassGroupsViewController_presentApplicationWithIdentifier___block_invoke_322;
    v18[3] = &unk_1E59CB9C8;
    objc_copyWeak(&v19, location);
    [v16 nextViewControllerWithCompletion:v18];
    objc_destroyWeak(&v19);
    objc_destroyWeak(location);
  }
  else
  {
    id v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = *(void **)(a1 + 32);
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v17;
      _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "No application found with identifier %@", (uint8_t *)location, 0xCu);
    }
  }
}

uint64_t __63__PKPassGroupsViewController_presentApplicationWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 applicationIdentifier];
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

void __63__PKPassGroupsViewController_presentApplicationWithIdentifier___block_invoke_322(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__PKPassGroupsViewController_presentApplicationWithIdentifier___block_invoke_2_323;
  block[3] = &unk_1E59CB378;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __63__PKPassGroupsViewController_presentApplicationWithIdentifier___block_invoke_2_323(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32))
    {
      id v4 = objc_msgSend(WeakRetained, "pkui_frontMostViewController");
      [v4 presentViewController:*(void *)(a1 + 32) animated:1 completion:0];
    }
    else
    {
      id v4 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(a1 + 40);
        int v6 = 138412290;
        uint64_t v7 = v5;
        _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "No apply view returned with error: %@", (uint8_t *)&v6, 0xCu);
      }
    }
  }
}

- (void)presentPrecursorPassUpdateForPassUniqueIdentifier:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __80__PKPassGroupsViewController_presentPrecursorPassUpdateForPassUniqueIdentifier___block_invoke;
  v3[3] = &unk_1E59CB6D8;
  void v3[4] = self;
  [(PKPassGroupsViewController *)self presentPassWithUniqueID:a3 animated:1 completionHandler:v3];
}

void __80__PKPassGroupsViewController_presentPrecursorPassUpdateForPassUniqueIdentifier___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v3 = [*(id *)(a1 + 32) presentedViewController];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && ([v3 isBeingDismissed] & 1) == 0) {
      [v3 performPrecursorPassAction];
    }
  }
}

- (void)viewController:(id)a3 ingestionDidFinishWithResult:(unint64_t)a4
{
}

- (void)peerPaymentAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = [(UIViewController *)self pkui_frontMostViewController];
  [v8 presentViewController:v7 animated:v5 completion:0];
}

- (void)peerPaymentAccountResolutionController:(id)a3 requestsDismissCurrentViewControllerAnimated:(BOOL)a4
{
  BOOL v4 = a4;
  int v6 = [(UIViewController *)self pkui_frontMostViewController];
  [v6 dismissViewControllerAnimated:v4 completion:0];

  peerPaymentAccountResolutionController = self->_peerPaymentAccountResolutionController;
  self->_peerPaymentAccountResolutionController = 0;
}

- (void)accountServiceAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = [(UIViewController *)self pkui_frontMostViewController];
  [v8 presentViewController:v7 animated:v5 completion:0];
}

- (void)performActionViewControllerDidCancel:(id)a3
{
  id v3 = a3;
  [v3 setDelegate:0];
  id v4 = [v3 presentingViewController];

  [v4 dismissViewControllerAnimated:1 completion:0];
}

- (void)performActionViewControllerDidPerformAction:(id)a3
{
  id v3 = a3;
  [v3 setDelegate:0];
  id v4 = [v3 presentingViewController];

  [v4 dismissViewControllerAnimated:1 completion:0];
}

- (PKPassGroupStackView)groupStackView
{
  [(PKPassGroupsViewController *)self loadViewIfNeeded];
  groupStackView = self->_groupStackView;

  return groupStackView;
}

- (void)invalidate
{
}

- (void)partiallyInvalidate
{
}

- (void)_invalidateForType:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int64_t invalidationStatus = self->_invalidationStatus;
  if (invalidationStatus != a3)
  {
    self->_int64_t invalidationStatus = a3;
    if (a3 >= 1 && invalidationStatus <= 0)
    {
      int v6 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        groupStackView = self->_groupStackView;
        int v11 = 134349312;
        id v12 = self;
        __int16 v13 = 2050;
        uint64_t v14 = groupStackView;
        _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "PKPassGroupsViewController (%{public}p:%{public}p): partially invalidated.", (uint8_t *)&v11, 0x16u);
      }

      [(PKPaymentService *)self->_paymentService setDelegate:0];
      paymentService = self->_paymentService;
      self->_paymentService = 0;

      [(PKPassGroupsViewController *)self _registerForExpressTransactionNotifications:0];
    }
    if (a3 > 1 && invalidationStatus <= 1)
    {
      id v9 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = self->_groupStackView;
        int v11 = 134349312;
        id v12 = self;
        __int16 v13 = 2050;
        uint64_t v14 = v10;
        _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "PKPassGroupsViewController (%{public}p:%{public}p): invalidated.", (uint8_t *)&v11, 0x16u);
      }

      [(PKPassGroupStackView *)self->_groupStackView setDelegate:0];
      [(PKPassGroupStackView *)self->_groupStackView invalidate];
    }
  }
}

- (void)startPaymentPreflight:(id)a3 withPaymentSetupMode:(int64_t)a4 referrerIdentifier:(id)a5 paymentNetworks:(id)a6 transitNetworkIdentifiers:(id)a7 allowedFeatureIdentifiers:(id)a8 productIdentifiers:(id)a9
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  PKTimeProfileBegin();
  objc_opt_class();
  int64_t v34 = a4;
  if (objc_opt_isKindOfClass())
  {
    id v21 = v47;
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    id v22 = __179__PKPassGroupsViewController_startPaymentPreflight_withPaymentSetupMode_referrerIdentifier_paymentNetworks_transitNetworkIdentifiers_allowedFeatureIdentifiers_productIdentifiers___block_invoke;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v24 = (void (**)(void *, uint64_t))&__block_literal_global_334;
      goto LABEL_7;
    }
    id v21 = v46;
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    id v22 = __179__PKPassGroupsViewController_startPaymentPreflight_withPaymentSetupMode_referrerIdentifier_paymentNetworks_transitNetworkIdentifiers_allowedFeatureIdentifiers_productIdentifiers___block_invoke_2;
  }
  v21[2] = v22;
  v21[3] = &unk_1E59CB6D8;
  void v21[4] = v15;
  BOOL v23 = _Block_copy(v21);
  id v24 = (void (**)(void *, uint64_t))[v23 copy];

LABEL_7:
  if (([(id)objc_opt_class() isPerformingAction] & 1) == 0)
  {
    id v25 = [(PKPassGroupsViewController *)self presentedViewController];

    if (!v25)
    {
      v24[2](v24, 1);
      [(id)objc_opt_class() beginTrackingAction];
      long long v26 = [MEMORY[0x1E4FB1438] sharedApplication];
      [v26 _setIdleTimerDisabled:1 forReason:@"SetupPayments"];

      uint64_t v33 = [MEMORY[0x1E4F84D50] sharedService];
      long long v27 = (void *)[objc_alloc(MEMORY[0x1E4F84BB8]) initWithWebService:v33];
      [v27 setReferrerIdentifier:v16];
      [v27 setAllowedFeatureIdentifiers:v19];
      [v27 setAllowedProductIdentifiers:v20];
      [v27 setAllowProductsInUnsupportedRegion:1];
      if (v17) {
        [v27 setAllowedPaymentNetworks:v17];
      }
      if (v18) {
        [v27 setRequiredTransitNetworkIdentifiers:v18];
      }
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __179__PKPassGroupsViewController_startPaymentPreflight_withPaymentSetupMode_referrerIdentifier_paymentNetworks_transitNetworkIdentifiers_allowedFeatureIdentifiers_productIdentifiers___block_invoke_4;
      aBlock[3] = &unk_1E59D4F38;
      void aBlock[4] = self;
      long long v44 = v24;
      id v28 = v27;
      id v43 = v28;
      int64_t v45 = v34;
      id v29 = _Block_copy(aBlock);
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __179__PKPassGroupsViewController_startPaymentPreflight_withPaymentSetupMode_referrerIdentifier_paymentNetworks_transitNetworkIdentifiers_allowedFeatureIdentifiers_productIdentifiers___block_invoke_8;
      v35[3] = &unk_1E59D4F60;
      id v30 = v28;
      id v36 = v30;
      int64_t v41 = v34;
      id v37 = v17;
      id v38 = v18;
      id v39 = v20;
      id v40 = v29;
      id v31 = v29;
      id v32 = _Block_copy(v35);
      if (v34 == 2) {
        [v30 preflightWithRequirements:495 completionRequirements:495 completion:v32];
      }
      else {
        [v30 preflightWithCompletion:v32];
      }
    }
  }
}

uint64_t __179__PKPassGroupsViewController_startPaymentPreflight_withPaymentSetupMode_referrerIdentifier_paymentNetworks_transitNetworkIdentifiers_allowedFeatureIdentifiers_productIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setShowActivityIndicator:a2];
}

uint64_t __179__PKPassGroupsViewController_startPaymentPreflight_withPaymentSetupMode_referrerIdentifier_paymentNetworks_transitNetworkIdentifiers_allowedFeatureIdentifiers_productIdentifiers___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setShowActivityIndicator:a2];
}

void __179__PKPassGroupsViewController_startPaymentPreflight_withPaymentSetupMode_referrerIdentifier_paymentNetworks_transitNetworkIdentifiers_allowedFeatureIdentifiers_productIdentifiers___block_invoke_4(uint64_t a1, int a2, void *a3)
{
  v33[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [(id)objc_opt_class() endTrackingAction];
  int v6 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v6 _setIdleTimerDisabled:0 forReason:@"SetupPayments"];

  id v7 = [*(id *)(a1 + 32) presentedViewController];

  if (v7)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_14;
  }
  if (a2)
  {
    id v8 = [[PKPaymentSetupNavigationController alloc] initWithProvisioningController:*(void *)(a1 + 40) context:0];
    [(PKPaymentSetupNavigationController *)v8 setSetupDelegate:*(void *)(a1 + 32)];
    [(PKPaymentSetupNavigationController *)v8 setPaymentSetupMode:*(void *)(a1 + 56)];
    [(PKPaymentSetupNavigationController *)v8 setGroupsController:*(void *)(*(void *)(a1 + 32) + 1264)];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __179__PKPassGroupsViewController_startPaymentPreflight_withPaymentSetupMode_referrerIdentifier_paymentNetworks_transitNetworkIdentifiers_allowedFeatureIdentifiers_productIdentifiers___block_invoke_5;
    v25[3] = &unk_1E59CF8D8;
    v25[4] = *(void *)(a1 + 32);
    long long v26 = v8;
    id v27 = *(id *)(a1 + 48);
    id v9 = v8;
    [(PKPaymentSetupNavigationController *)v9 preflightWithCompletion:v25];

    goto LABEL_14;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v10 = [v5 domain];
  int v11 = [v10 isEqualToString:*MEMORY[0x1E4F871A0]];

  if (v11)
  {
    if ([v5 code] == 6)
    {
      id v12 = (void *)MEMORY[0x1E4F843E0];
      uint64_t v13 = *MEMORY[0x1E4F87028];
      v33[0] = *MEMORY[0x1E4F87020];
      v33[1] = v13;
      v33[2] = *MEMORY[0x1E4F87068];
      uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:3];
      uint64_t v15 = *MEMORY[0x1E4F86730];
      v31[0] = *MEMORY[0x1E4F86308];
      v31[1] = v15;
      uint64_t v16 = *MEMORY[0x1E4F86E20];
      v32[0] = *MEMORY[0x1E4F864A0];
      v32[1] = v16;
      id v17 = (void *)MEMORY[0x1E4F1C9E8];
      id v18 = v32;
      id v19 = v31;
LABEL_10:
      BOOL v23 = [v17 dictionaryWithObjects:v18 forKeys:v19 count:2];
      [v12 subjects:v14 sendEvent:v23];

      goto LABEL_11;
    }
    if ([v5 code] == 9)
    {
      id v12 = (void *)MEMORY[0x1E4F843E0];
      uint64_t v20 = *MEMORY[0x1E4F87028];
      v30[0] = *MEMORY[0x1E4F87020];
      v30[1] = v20;
      v30[2] = *MEMORY[0x1E4F87068];
      uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:3];
      uint64_t v21 = *MEMORY[0x1E4F86730];
      v28[0] = *MEMORY[0x1E4F86308];
      v28[1] = v21;
      uint64_t v22 = *MEMORY[0x1E4F86F20];
      v29[0] = *MEMORY[0x1E4F864A0];
      v29[1] = v22;
      id v17 = (void *)MEMORY[0x1E4F1C9E8];
      id v18 = v29;
      id v19 = v28;
      goto LABEL_10;
    }
  }
LABEL_11:
  id v24 = PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);
  if (v24) {
    [*(id *)(a1 + 32) presentViewController:v24 animated:1 completion:&__block_literal_global_342];
  }

LABEL_14:
}

void __179__PKPassGroupsViewController_startPaymentPreflight_withPaymentSetupMode_referrerIdentifier_paymentNetworks_transitNetworkIdentifiers_allowedFeatureIdentifiers_productIdentifiers___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) presentedViewController];

  if (v2)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v3();
  }
  else
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __179__PKPassGroupsViewController_startPaymentPreflight_withPaymentSetupMode_referrerIdentifier_paymentNetworks_transitNetworkIdentifiers_allowedFeatureIdentifiers_productIdentifiers___block_invoke_6;
    v6[3] = &unk_1E59CAA98;
    id v7 = *(id *)(a1 + 48);
    [v4 presentViewController:v5 animated:1 completion:v6];
  }
}

void __179__PKPassGroupsViewController_startPaymentPreflight_withPaymentSetupMode_referrerIdentifier_paymentNetworks_transitNetworkIdentifiers_allowedFeatureIdentifiers_productIdentifiers___block_invoke_6(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  PKLogFacilityTypeGetObject();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v1 = (id)PKTimeProfileEnd();
}

void __179__PKPassGroupsViewController_startPaymentPreflight_withPaymentSetupMode_referrerIdentifier_paymentNetworks_transitNetworkIdentifiers_allowedFeatureIdentifiers_productIdentifiers___block_invoke_7()
{
  PKLogFacilityTypeGetObject();
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  id v0 = (id)PKTimeProfileEnd();
}

void __179__PKPassGroupsViewController_startPaymentPreflight_withPaymentSetupMode_referrerIdentifier_paymentNetworks_transitNetworkIdentifiers_allowedFeatureIdentifiers_productIdentifiers___block_invoke_8(uint64_t a1, int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v14 = @"SetupPayments";
    _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Enabling Idle Timer: %@", buf, 0xCu);
  }

  id v7 = [*(id *)(a1 + 32) paymentSetupProductModel];
  id v8 = [v7 allSetupProducts];

  if (a2
    && *(void *)(a1 + 72) == 3
    && (*(void *)(a1 + 40) || *(void *)(a1 + 48) || *(void *)(a1 + 56))
    && [v8 count] == 1)
  {
    id v9 = *(void **)(a1 + 32);
    id v10 = [v8 firstObject];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    _OWORD v11[2] = __179__PKPassGroupsViewController_startPaymentPreflight_withPaymentSetupMode_referrerIdentifier_paymentNetworks_transitNetworkIdentifiers_allowedFeatureIdentifiers_productIdentifiers___block_invoke_343;
    v11[3] = &unk_1E59CAA48;
    id v12 = *(id *)(a1 + 64);
    [v9 setupProductForProvisioning:v10 includePurchases:1 withCompletionHandler:v11];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

uint64_t __179__PKPassGroupsViewController_startPaymentPreflight_withPaymentSetupMode_referrerIdentifier_paymentNetworks_transitNetworkIdentifiers_allowedFeatureIdentifiers_productIdentifiers___block_invoke_343(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addVASPassWithIdentifier:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CB10];
  int v6 = PKVASPassCacheDirectoryPath();
  id v7 = [v5 fileURLWithPath:v6];

  id v8 = [v7 URLByAppendingPathComponent:v4 isDirectory:0];

  id v9 = [v8 URLByAppendingPathExtension:*MEMORY[0x1E4F87CE0]];

  id v16 = 0;
  id v10 = (void *)[MEMORY[0x1E4F84850] createWithFileURL:v9 warnings:0 error:&v16];
  id v11 = v16;
  id v12 = PKLogFacilityTypeGetObject();
  uint64_t v13 = v12;
  if (v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [v10 uniqueID];
      *(_DWORD *)long long buf = 138412290;
      id v18 = v14;
      _os_log_impl(&dword_19F450000, v13, OS_LOG_TYPE_DEFAULT, "Add VAS pass with identifier: %@", buf, 0xCu);
    }
    v21[0] = v10;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    [(PKPassGroupsViewController *)self _presentAddPassesControllerWithPasses:v13];
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138543618;
    id v18 = v4;
    __int16 v19 = 2114;
    id v20 = v11;
    _os_log_error_impl(&dword_19F450000, v13, OS_LOG_TYPE_ERROR, "Failed to add VAS pass with identifier: %{public}@ %{public}@.", buf, 0x16u);
  }

  uint64_t v15 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v15 removeItemAtURL:v9 error:0];
}

- (void)presentOrderManagementAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__PKPassGroupsViewController_presentOrderManagementAnimated_completion___block_invoke;
  aBlock[3] = &unk_1E59CF278;
  void aBlock[4] = self;
  BOOL v13 = v4;
  id v7 = v6;
  id v12 = v7;
  id v8 = (void (**)(void))_Block_copy(aBlock);
  id v9 = [(PKPassGroupsViewController *)self presentedViewController];
  id v10 = v9;
  if (v9 && ([v9 isBeingDismissed] & 1) == 0)
  {
    if ([v10 conformsToProtocol:&unk_1EF431178]) {
      (*((void (**)(id, void *))v7 + 2))(v7, v10);
    }
    else {
      [(PKPassGroupsViewController *)self dismissViewControllerAnimated:v4 completion:v8];
    }
  }
  else
  {
    v8[2](v8);
  }
}

void __72__PKPassGroupsViewController_presentOrderManagementAnimated_completion___block_invoke(uint64_t a1)
{
  id v2 = [(objc_class *)getFKOrderManagementViewControllerProviderClass() makeViewController];
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__PKPassGroupsViewController_presentOrderManagementAnimated_completion___block_invoke_2;
  v7[3] = &unk_1E59CAD68;
  BOOL v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v2;
  id v9 = v5;
  id v6 = v2;
  [v4 presentViewController:v6 animated:v3 completion:v7];
}

uint64_t __72__PKPassGroupsViewController_presentOrderManagementAnimated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)presentAuthorizationFlowAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  objc_initWeak(&location, self);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = __74__PKPassGroupsViewController_presentAuthorizationFlowAnimated_completion___block_invoke;
  id v18 = &unk_1E59D4FD8;
  id v7 = v6;
  id v19 = v7;
  objc_copyWeak(&v20, &location);
  BOOL v21 = v4;
  id v8 = (void (**)(void))_Block_copy(&v15);
  id v9 = [(UIViewController *)self pkui_frontMostViewController];
  id v10 = v9;
  if (v9 && ([v9 isBeingDismissed] & 1) == 0)
  {
    if ([v10 conformsToProtocol:&unk_1EF4311D8])
    {
      (*((void (**)(id, void *))v7 + 2))(v7, v10);
    }
    else
    {
      id v11 = [v10 presentingViewController];
      int v12 = [v11 conformsToProtocol:&unk_1EF4311D8];

      if (v12)
      {
        BOOL v13 = [v10 presentingViewController];
        (*((void (**)(id, void *))v7 + 2))(v7, v13);
      }
      else
      {
        uint64_t v14 = [v10 childViewControllers];
        BOOL v13 = objc_msgSend(v14, "pk_firstObjectPassingTest:", &__block_literal_global_367);

        if (v13)
        {
          (*((void (**)(id, void *))v7 + 2))(v7, v13);
        }
        else
        {
          [(PKPassGroupsViewController *)self dismissViewControllerAnimated:v4 completion:v8];
          BOOL v13 = 0;
        }
      }
    }
  }
  else
  {
    v8[2](v8);
  }

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __74__PKPassGroupsViewController_presentAuthorizationFlowAnimated_completion___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F26BC0]);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __74__PKPassGroupsViewController_presentAuthorizationFlowAnimated_completion___block_invoke_2;
  v3[3] = &unk_1E59D4FB0;
  id v4 = *(id *)(a1 + 32);
  objc_copyWeak(&v5, (id *)(a1 + 40));
  char v6 = *(unsigned char *)(a1 + 48);
  [v2 authorizationSessionWithCompletion:v3];
  objc_destroyWeak(&v5);
}

void __74__PKPassGroupsViewController_presentAuthorizationFlowAnimated_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __74__PKPassGroupsViewController_presentAuthorizationFlowAnimated_completion___block_invoke_360;
    void v5[3] = &unk_1E59D4388;
    objc_copyWeak(&v8, (id *)(a1 + 40));
    id v7 = *(id *)(a1 + 32);
    id v6 = v3;
    char v9 = *(unsigned char *)(a1 + 48);
    dispatch_async(MEMORY[0x1E4F14428], v5);

    objc_destroyWeak(&v8);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_19F450000, v4, OS_LOG_TYPE_ERROR, "Failed to handle BankConnect auth redirect. The auth session is nil!", buf, 2u);
    }
  }
}

void __74__PKPassGroupsViewController_presentAuthorizationFlowAnimated_completion___block_invoke_360(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F84898]);
    uint64_t v4 = [*(id *)(a1 + 32) fpanId];
    if (v4
      && (id v5 = (void *)v4,
          [*(id *)(a1 + 32) fpanId],
          id v6 = objc_claimAutoreleasedReturnValue(),
          [v3 passWithFPANIdentifier:v6],
          id v7 = objc_claimAutoreleasedReturnValue(),
          v6,
          v5,
          v7))
    {
      id v8 = [v7 uniqueID];
      uint64_t v9 = *(unsigned __int8 *)(a1 + 56);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __74__PKPassGroupsViewController_presentAuthorizationFlowAnimated_completion___block_invoke_2_361;
      v10[3] = &unk_1E59D4F88;
      void v10[4] = WeakRetained;
      id v12 = *(id *)(a1 + 40);
      id v11 = *(id *)(a1 + 32);
      char v13 = *(unsigned char *)(a1 + 56);
      [WeakRetained presentPassWithUniqueID:v8 animated:v9 completionHandler:v10];
    }
    else
    {
      [WeakRetained presentAuthorizationViewControllerWithSession:*(void *)(a1 + 32) animated:*(unsigned __int8 *)(a1 + 56) completion:*(void *)(a1 + 40)];
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __74__PKPassGroupsViewController_presentAuthorizationFlowAnimated_completion___block_invoke_2_361(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0
    || ([*(id *)(a1 + 32) presentedViewController],
        id v3 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v3,
        (isKindOfClass & 1) == 0))
  {
    id v10 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v10();
  }
  else
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 48);
    return [v5 presentAuthorizationViewControllerWithSession:v6 animated:v7 completion:v8];
  }
}

uint64_t __74__PKPassGroupsViewController_presentAuthorizationFlowAnimated_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 conformsToProtocol:&unk_1EF4311D8];
}

- (void)presentAuthorizationViewControllerWithSession:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  id v10 = +[PKDismissalPreventionAssertionManager sharedInstance];
  id v11 = [v10 acquireAssertion];

  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000;
  id v31 = __Block_byref_object_copy__25;
  id v32 = __Block_byref_object_dispose__25;
  id v33 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__PKPassGroupsViewController_presentAuthorizationViewControllerWithSession_animated_completion___block_invoke;
  aBlock[3] = &unk_1E59D5020;
  objc_copyWeak(&v26, &location);
  id v12 = v9;
  id v25 = v12;
  BOOL v27 = v6;
  id v13 = v11;
  id v24 = v13;
  uint64_t v14 = _Block_copy(aBlock);
  uint64_t v15 = [(objc_class *)getFKBankConnectAuthorizationViewControllerProviderClass() makeAuthorizationViewControllerForAuthorizationSession:v8 completion:v14];
  uint64_t v16 = (void *)v29[5];
  void v29[5] = v15;

  id v17 = [(UIViewController *)self pkui_frontMostViewController];
  uint64_t v18 = v29[5];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __96__PKPassGroupsViewController_presentAuthorizationViewControllerWithSession_animated_completion___block_invoke_2;
  v20[3] = &unk_1E59D1FE0;
  id v19 = v12;
  id v21 = v19;
  uint64_t v22 = &v28;
  [v17 presentViewController:v18 animated:v6 completion:v20];

  objc_destroyWeak(&v26);
  _Block_object_dispose(&v28, 8);

  objc_destroyWeak(&location);
}

void __96__PKPassGroupsViewController_presentAuthorizationViewControllerWithSession_animated_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained dismissViewControllerAnimated:*(unsigned __int8 *)(a1 + 56) completion:0];
    [*(id *)(a1 + 32) invalidate];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __96__PKPassGroupsViewController_presentAuthorizationViewControllerWithSession_animated_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

- (void)presentBackgroundRefreshConfirmationAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  id v8[2] = __75__PKPassGroupsViewController_presentBackgroundRefreshConfirmationAnimated___block_invoke;
  v8[3] = &unk_1E59CDA78;
  void v8[4] = self;
  BOOL v9 = a3;
  id v5 = (void (**)(void))_Block_copy(v8);
  BOOL v6 = [(PKPassGroupsViewController *)self presentedViewController];
  uint64_t v7 = v6;
  if (v6 && ([v6 isBeingDismissed] & 1) == 0) {
    [(PKPassGroupsViewController *)self dismissViewControllerAnimated:v3 completion:v5];
  }
  else {
    v5[2](v5);
  }
}

void __75__PKPassGroupsViewController_presentBackgroundRefreshConfirmationAnimated___block_invoke(uint64_t a1)
{
  id v2 = [(objc_class *)getFKBankConnectBackgroundRefreshConfirmationViewControllerProviderClass() makeViewController];
  if (v2)
  {
    BOOL v3 = v2;
    [*(id *)(a1 + 32) presentViewController:v2 animated:*(unsigned __int8 *)(a1 + 40) completion:0];
    id v2 = v3;
  }
}

- (void)dismissDiscoveryArticleViewController:(id)a3 afterActionCompleted:(BOOL)a4 withRelevantPassUniqueIdenitifer:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = v7;
  BOOL v9 = 0;
  if (v7 && v5)
  {
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    id v12 = __122__PKPassGroupsViewController_dismissDiscoveryArticleViewController_afterActionCompleted_withRelevantPassUniqueIdenitifer___block_invoke;
    id v13 = &unk_1E59CA870;
    uint64_t v14 = self;
    id v15 = v7;
    BOOL v9 = _Block_copy(&v10);
  }
  -[PKPassGroupsViewController dismissPresentedVCsWithRequirements:animated:performAction:](self, "dismissPresentedVCsWithRequirements:animated:performAction:", 0, 1, v9, v10, v11, v12, v13, v14);
}

uint64_t __122__PKPassGroupsViewController_dismissDiscoveryArticleViewController_afterActionCompleted_withRelevantPassUniqueIdenitifer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentPassWithUniqueID:*(void *)(a1 + 40) animated:1 completionHandler:0];
}

- (id)_peerPaymentAccountResolutionController
{
  peerPaymentAccountResolutionController = self->_peerPaymentAccountResolutionController;
  if (!peerPaymentAccountResolutionController)
  {
    uint64_t v4 = [PKPeerPaymentAccountResolutionController alloc];
    BOOL v5 = [(PKPeerPaymentService *)self->_peerPaymentService account];
    BOOL v6 = [MEMORY[0x1E4F84E10] sharedService];
    id v7 = [(PKPeerPaymentAccountResolutionController *)v4 initWithAccount:v5 webService:v6 context:0 delegate:self passLibraryDataProvider:self->_passLibraryDataProvider];
    id v8 = self->_peerPaymentAccountResolutionController;
    self->_peerPaymentAccountResolutionController = v7;

    peerPaymentAccountResolutionController = self->_peerPaymentAccountResolutionController;
  }

  return peerPaymentAccountResolutionController;
}

- (void)dismissVerificationPageForPassWithDeviceAccountID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PKPassGroupsViewController *)self presentedPass];
  id v12 = [v5 paymentPass];

  BOOL v6 = [v12 deviceAccountIdentifier];
  int v7 = [v6 isEqualToString:v4];

  if (v7)
  {
    objc_opt_class();
    id v8 = [(PKPassGroupsViewController *)self presentedViewController];
    BOOL v9 = [v8 presentedViewController];
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v11 = [(PKPassGroupsViewController *)self presentedViewController];
      [v11 dismissViewControllerAnimated:1 completion:0];
    }
  }
}

- (void)_presentAddPassesControllerWithPasses:(id)a3
{
  id v4 = a3;
  BOOL v5 = [[PKAddPassesViewController alloc] initWithPasses:v4 fromPresentationSource:1];

  if (v5)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    id v8[2] = __68__PKPassGroupsViewController__presentAddPassesControllerWithPasses___block_invoke;
    v8[3] = &unk_1E59CA870;
    void v8[4] = self;
    BOOL v9 = v5;
    [(PKPassGroupsViewController *)self dismissPresentedVCsWithRequirements:0 animated:1 performAction:v8];
  }
  else
  {
    BOOL v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v7 = 0;
      _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Couldn't add passes", v7, 2u);
    }
  }
}

uint64_t __68__PKPassGroupsViewController__presentAddPassesControllerWithPasses___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (void)presentPaymentSetupController
{
  objc_initWeak(&location, self);
  id v2 = objc_alloc(MEMORY[0x1E4F84BB8]);
  BOOL v3 = [MEMORY[0x1E4F84D50] sharedService];
  id v4 = (void *)[v2 initWithWebService:v3];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__PKPassGroupsViewController_presentPaymentSetupController__block_invoke;
  v6[3] = &unk_1E59CBA18;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [v5 validatePreconditionsAndRegister:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __59__PKPassGroupsViewController_presentPaymentSetupController__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__PKPassGroupsViewController_presentPaymentSetupController__block_invoke_2;
  v7[3] = &unk_1E59CB9F0;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  char v11 = a2;
  id v8 = v5;
  id v9 = *(id *)(a1 + 32);
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);

  objc_destroyWeak(&v10);
}

void __59__PKPassGroupsViewController_presentPaymentSetupController__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(unsigned char *)(a1 + 56)) {
      BOOL v4 = *(void *)(a1 + 32) == 0;
    }
    else {
      BOOL v4 = 0;
    }
    if (v4)
    {
      id v5 = [WeakRetained _paymentSetupNavigationControllerForProvisioningController:*(void *)(a1 + 40)];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __59__PKPassGroupsViewController_presentPaymentSetupController__block_invoke_3;
      v7[3] = &unk_1E59CAEA8;
      id v8 = v3;
      id v9 = v5;
      id v6 = v5;
      [v6 preflightWithCompletion:v7];
    }
    else
    {
      objc_msgSend(WeakRetained, "_handleProvisioningError:");
    }
  }
}

uint64_t __59__PKPassGroupsViewController_presentPaymentSetupController__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (id)_paymentSetupNavigationControllerForProvisioningController:(id)a3
{
  id v4 = a3;
  id v5 = [[PKPaymentSetupNavigationController alloc] initWithProvisioningController:v4 context:0];

  [(PKNavigationController *)v5 setCustomFormSheetPresentationStyleForiPad];
  [(PKPaymentSetupNavigationController *)v5 setSetupDelegate:self];
  [(PKPaymentSetupNavigationController *)v5 setShowsWelcomeViewController:0];
  [(PKPaymentSetupNavigationController *)v5 setGroupsController:self->_groupsController];

  return v5;
}

- (void)_handleProvisioningError:(id)a3
{
  id v4 = +[PKPaymentSetupNavigationController viewControllerForPresentingPaymentError:a3];
  [(PKPassGroupsViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)dismissPresentedVCsWithRequirements:(unint64_t)a3 animated:(BOOL)a4 performAction:(id)a5
{
  BOOL v5 = a4;
  id v8 = (void (**)(void))a5;
  if ((PKRunningInRemoteContext() & 1) != 0
    || ([MEMORY[0x1E4FB1438] sharedApplication],
        id v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v9 applicationState],
        v9,
        (a3 & 1) == 0)
    || !v10)
  {
    if ((a3 & 4) == 0 || self->_paymentService)
    {
      char v11 = [(PKPassGroupsViewController *)self presentedViewController];
      id v12 = v11;
      if (v11)
      {
        if (![v11 isBeingDismissed]
          || ([v12 transitionCoordinator],
              id v13 = objc_claimAutoreleasedReturnValue(),
              char v14 = [v13 isCancelled],
              v13,
              (v14 & 1) != 0))
        {
          if (!PresentationTrackingCounter)
          {
            int v15 = 1;
            goto LABEL_13;
          }
LABEL_28:

          goto LABEL_29;
        }
      }
      else if (!self->_viewAppeared)
      {
        goto LABEL_28;
      }
      int v15 = 0;
LABEL_13:
      uint64_t v16 = [MEMORY[0x1E4F88108] viewServiceBundleID];
      id v17 = (void *)v16;
      if (!v12
        || !v16
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
        || ([v12 serviceBundleIdentifier],
            uint64_t v18 = objc_claimAutoreleasedReturnValue(),
            char v19 = [v18 isEqualToString:v17],
            v18,
            (a3 & 2) == 0)
        || (v19 & 1) == 0)
      {
        if (v15)
        {
          if (v12
            && (objc_opt_class(), char isKindOfClass = objc_opt_isKindOfClass(), (a3 & 8) != 0)
            && (isKindOfClass & 1) != 0)
          {
            v22[0] = MEMORY[0x1E4F143A8];
            v22[1] = 3221225472;
            v22[2] = __89__PKPassGroupsViewController_dismissPresentedVCsWithRequirements_animated_performAction___block_invoke_2;
            void v22[3] = &unk_1E59CAA98;
            BOOL v23 = v8;
            [(PKPassGroupsViewController *)self _resetWithBackgroundAllowedVCs:(a3 >> 4) & 1 animated:v5 completion:v22];
            id v21 = v23;
          }
          else
          {
            v24[0] = MEMORY[0x1E4F143A8];
            v24[1] = 3221225472;
            v24[2] = __89__PKPassGroupsViewController_dismissPresentedVCsWithRequirements_animated_performAction___block_invoke;
            v24[3] = &unk_1E59CAA98;
            id v25 = v8;
            [(PKPassGroupsViewController *)self dismissViewControllerAnimated:v5 completion:v24];
            id v21 = v25;
          }
        }
        else if (v8)
        {
          v8[2](v8);
        }
      }

      goto LABEL_28;
    }
  }
LABEL_29:
}

uint64_t __89__PKPassGroupsViewController_dismissPresentedVCsWithRequirements_animated_performAction___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __89__PKPassGroupsViewController_dismissPresentedVCsWithRequirements_animated_performAction___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_resetWithBackgroundAllowedVCs:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = (void (**)(void))a5;
  id v9 = [(PKPassGroupsViewController *)self presentedViewController];
  uint64_t v10 = v9;
  if (!v9 || v9 == self)
  {
    if (v8) {
      v8[2](v8);
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v11 = v10;
      id v12 = [(PKPassGroupsViewController *)v11 viewControllers];
      id v13 = [v12 firstObject];

      if (v6)
      {
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        char v14 = [(PKPassGroupsViewController *)v11 viewControllers];
        uint64_t v15 = [v14 countByEnumeratingWithState:&v35 objects:v39 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v36;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v36 != v17) {
                objc_enumerationMutation(v14);
              }
              char v19 = *(void **)(*((void *)&v35 + 1) + 8 * i);
              if (objc_msgSend(v19, "pkui_disablesAutomaticDismissalUponEnteringBackground"))
              {
                id v20 = v19;

                id v13 = v20;
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v35 objects:v39 count:16];
          }
          while (v16);
        }
      }
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __81__PKPassGroupsViewController__resetWithBackgroundAllowedVCs_animated_completion___block_invoke;
      aBlock[3] = &unk_1E59D5068;
      id v21 = v11;
      id v32 = v21;
      id v22 = v13;
      id v33 = v22;
      BOOL v34 = v5;
      BOOL v23 = (void (**)(void *, void (**)(void)))_Block_copy(aBlock);
      id v24 = [(PKPassGroupsViewController *)v21 presentedViewController];
      id v25 = v24;
      if (!v24 || v24 == v21 || ([(PKPassGroupsViewController *)v24 isBeingDismissed] & 1) != 0)
      {
        v23[2](v23, v8);
      }
      else
      {
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        void v28[2] = __81__PKPassGroupsViewController__resetWithBackgroundAllowedVCs_animated_completion___block_invoke_2;
        v28[3] = &unk_1E59D4108;
        id v29 = v23;
        uint64_t v30 = v8;
        [(PKPassGroupsViewController *)v21 dismissViewControllerAnimated:v5 completion:v28];
      }
    }
    else
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      id v26[2] = __81__PKPassGroupsViewController__resetWithBackgroundAllowedVCs_animated_completion___block_invoke_3;
      v26[3] = &unk_1E59CAA98;
      BOOL v27 = v8;
      [(PKPassGroupsViewController *)self dismissViewControllerAnimated:v5 completion:v26];
    }
  }
}

void __81__PKPassGroupsViewController__resetWithBackgroundAllowedVCs_animated_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = *(unsigned __int8 *)(a1 + 48);
  BOOL v6 = *(unsigned char *)(a1 + 48) != 0;
  id v7 = *(id *)(a1 + 32);
  id v8 = (void (**)(void))v3;
  id v9 = (id)[v7 popToViewController:v4 animated:v6];
  if (v8 && v5)
  {
    uint64_t v10 = [v7 transitionCoordinator];
    if (v10)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      _OWORD v11[2] = ___PKUINavigationControllerPopToRootController_block_invoke;
      v11[3] = &unk_1E59D04E8;
      id v12 = v8;
      [v10 animateAlongsideTransition:0 completion:v11];
    }
    else
    {
      v8[2](v8);
    }
  }
  else if (v8)
  {
    v8[2](v8);
  }
}

uint64_t __81__PKPassGroupsViewController__resetWithBackgroundAllowedVCs_animated_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __81__PKPassGroupsViewController__resetWithBackgroundAllowedVCs_animated_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)_appleCardUpsellAlertWithAccount:(id)a3
{
  uint64_t v4 = [a3 feature];
  int v5 = (void *)MEMORY[0x1E4FB1418];
  BOOL v6 = PKLocalizedFeatureString();
  id v7 = PKLocalizedFeatureString();
  id v8 = [v5 alertControllerWithTitle:v6 message:v7 preferredStyle:1];

  id v9 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v10 = PKLocalizedPaymentString(&cfstr_AddCard.isa);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  id v16[2] = __63__PKPassGroupsViewController__appleCardUpsellAlertWithAccount___block_invoke;
  v16[3] = &unk_1E59D5090;
  void v16[4] = self;
  void v16[5] = v4;
  char v11 = [v9 actionWithTitle:v10 style:0 handler:v16];

  id v12 = (void *)MEMORY[0x1E4FB1410];
  id v13 = PKLocalizedString(&cfstr_Cancel.isa);
  char v14 = [v12 actionWithTitle:v13 style:1 handler:0];

  [v8 addAction:v11];
  [v8 addAction:v14];

  return v8;
}

void __63__PKPassGroupsViewController__appleCardUpsellAlertWithAccount___block_invoke(uint64_t a1)
{
  PKFeatureIdentifierToString();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v3, 0);
  [*(id *)(a1 + 32) presentPaymentSetupInMode:4 referrerIdentifier:0 paymentNetwork:0 transitNetworkIdentifier:0 allowedFeatureIdentifiers:v2 productIdentifiers:0];
}

- (void)_beginSuppressingInstanceFooter
{
  unint64_t instanceFooterSuppressionCounter = self->_instanceFooterSuppressionCounter;
  self->_unint64_t instanceFooterSuppressionCounter = instanceFooterSuppressionCounter + 1;
  if (!instanceFooterSuppressionCounter) {
    [(PKPassGroupsViewController *)self _updateFooterSuppressionAnimated:1];
  }
}

- (void)_endSuppressingInstanceFooterWithContext:(id)a3
{
  id v4 = a3;
  unint64_t instanceFooterSuppressionCounter = self->_instanceFooterSuppressionCounter;
  if (instanceFooterSuppressionCounter)
  {
    unint64_t v6 = instanceFooterSuppressionCounter - 1;
    self->_unint64_t instanceFooterSuppressionCounter = v6;
    if (!v6) {
      [(PKPassGroupsViewController *)self _updateFooterSuppressionWithContext:v4];
    }
  }
  else
  {
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "INVARIANT VIOLATION: attempting to end footer suppression when already stopped.", v8, 2u);
    }
  }
}

- (id)_passFromGroupsControllerWithUniqueIdentifier:(id)a3
{
  id v4 = a3;
  if (v4
    && (uint64_t v5 = [(PKGroupsController *)self->_groupsController groupIndexForPassUniqueID:v4],
        v5 != 0x7FFFFFFFFFFFFFFFLL))
  {
    id v7 = [(PKGroupsController *)self->_groupsController groupAtIndex:v5];
    uint64_t v8 = [v7 indexForPassUniqueID:v4];
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v6 = 0;
    }
    else
    {
      unint64_t v6 = [v7 passAtIndex:v8];
    }
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (id)_paymentPassDetailsViewControllerForPaymentPass:(id)a3
{
  if (a3)
  {
    groupsController = self->_groupsController;
    id v5 = a3;
    unint64_t v6 = [v5 uniqueID];
    id v7 = [(PKGroupsController *)groupsController groupAtIndex:[(PKGroupsController *)groupsController groupIndexForPassUniqueID:v6]];

    id v8 = objc_alloc_init(MEMORY[0x1E4F84A88]);
    id v9 = [PKPaymentPassDetailViewController alloc];
    uint64_t v10 = self->_groupsController;
    char v11 = [MEMORY[0x1E4F84D50] sharedService];
    id v12 = [MEMORY[0x1E4F84E10] sharedService];
    id v13 = [(PKPaymentPassDetailViewController *)v9 initWithPass:v5 group:v7 groupsController:v10 webService:v11 peerPaymentWebService:v12 style:0 passLibraryDataProvider:self->_passLibraryDataProvider paymentServiceDataProvider:v8];

    [(PKPaymentPassDetailViewController *)v13 setShowDoneButton:1];
    char v14 = [(PKPassGroupsViewController *)self groupStackView];
    [(PKPaymentPassDetailViewController *)v13 setDeleteOverrider:v14];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)_barcodePassDetailsViewControllerForBarcodePass:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[PKBarcodePassDetailViewController alloc] initWithPass:v4];

    BOOL v6 = (PKRunningInRemoteContext() & 1) != 0
      || [(PKPassGroupStackView *)self->_groupStackView isTableModalPresentation];
    [(PKBarcodePassDetailViewController *)v5 setShowDoneButton:v6];
    id v7 = [(PKPassGroupsViewController *)self groupStackView];
    [(PKBarcodePassDetailViewController *)v5 setDeleteOverrider:v7];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)_warnFailForward
{
  PDDeviceSpecificLocalizedStringKeyForKey();
  id v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  id v3 = (void *)MEMORY[0x1E4FB1418];
  id v4 = PKLocalizedPaymentString(v13);
  id v5 = PKLocalizedPaymentString(&cfstr_FailForwardUpd_0.isa);
  BOOL v6 = [v3 alertControllerWithTitle:v4 message:v5 preferredStyle:1];

  id v7 = (void *)MEMORY[0x1E4FB1410];
  id v8 = PKLocalizedPaymentString(&cfstr_FailForwardLea.isa);
  id v9 = [v7 actionWithTitle:v8 style:1 handler:&__block_literal_global_402];
  [v6 addAction:v9];

  uint64_t v10 = (void *)MEMORY[0x1E4FB1410];
  char v11 = PKLocalizedPaymentString(&cfstr_FailForwardDon.isa);
  id v12 = [v10 actionWithTitle:v11 style:0 handler:0];

  [v6 addAction:v12];
  [v6 setPreferredAction:v12];
  [(PKPassGroupsViewController *)self presentViewController:v6 animated:1 completion:0];
}

void __46__PKPassGroupsViewController__warnFailForward__block_invoke()
{
  id v1 = [MEMORY[0x1E4F1CB10] URLWithString:*MEMORY[0x1E4F87230]];
  id v0 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v0 openURL:v1 configuration:0 completionHandler:0];
}

- (void)_handlePeerPaymentAccountDidChangeNotification:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__PKPassGroupsViewController__handlePeerPaymentAccountDidChangeNotification___block_invoke;
  block[3] = &unk_1E59CA7D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __77__PKPassGroupsViewController__handlePeerPaymentAccountDidChangeNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePeerPaymentAccount];
}

void __74__PKPassGroupsViewController__registerForExpressTransactionNotifications___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleExpressNotification];
}

- (void)_handleExpressNotification
{
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "PKPassGroupsViewController: handling outstanding express transaction...", (uint8_t *)buf, 2u);
  }

  id v4 = [(PKPaymentService *)self->_paymentService outstandingExpressTransactionState];
  id v5 = v4;
  if (v4)
  {
    BOOL v6 = [v4 passUniqueIdentifier];
    if (!v6)
    {
LABEL_23:

      goto LABEL_24;
    }
    if (![(PKPassGroupStackView *)self->_groupStackView presentedPassIsPerformingPayment])
    {
      uint64_t v13 = [v5 isIgnorable];
      goto LABEL_11;
    }
    id v7 = [(PKPassGroupStackView *)self->_groupStackView modalGroupFrontmostPass];
    id v8 = [v7 uniqueID];
    id v9 = v6;
    id v10 = v8;
    if (v9 == v10)
    {
    }
    else
    {
      char v11 = v10;
      if (!v10)
      {

LABEL_18:
        if ([v5 isIgnorable])
        {
          if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf[0]) = 0;
            uint64_t v16 = "PKPassGroupsViewController: skipping express notification because a transaction is already underway an"
                  "d the event is for a failure transaction";
            goto LABEL_21;
          }
          goto LABEL_22;
        }
        uint64_t v13 = 0;
LABEL_11:
        id v3 = [(PKPassGroupsViewController *)self presentedViewController];
        if (v3) {
          [(PKPassGroupsViewController *)self _beginSuppressingInstanceFooter];
        }
        char v14 = objc_alloc_init(PKPassPresentationContext);
        -[PKPassPresentationContext setStandaloneTransactionType:](v14, "setStandaloneTransactionType:", [v5 standaloneTransactionType]);
        [(PKPassPresentationContext *)v14 setPostPayment:v13 ^ 1];
        [(PKPassPresentationContext *)v14 setFieldDetect:v13];
        objc_initWeak(buf, self);
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __56__PKPassGroupsViewController__handleExpressNotification__block_invoke;
        v17[3] = &unk_1E59D50B8;
        BOOL v20 = v3 != 0;
        objc_copyWeak(&v19, buf);
        uint64_t v15 = v14;
        uint64_t v18 = v15;
        [(PKPassGroupsViewController *)self presentPassWithUniqueID:v6 context:v15 animated:1 completionHandler:v17];

        objc_destroyWeak(&v19);
        objc_destroyWeak(buf);

        goto LABEL_22;
      }
      char v12 = [v9 isEqualToString:v10];

      if ((v12 & 1) == 0) {
        goto LABEL_18;
      }
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      uint64_t v16 = "PKPassGroupsViewController: skipping express notification because a transaction for same pass already underway";
LABEL_21:
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)buf, 2u);
    }
LABEL_22:

    goto LABEL_23;
  }
LABEL_24:
}

void __56__PKPassGroupsViewController__handleExpressNotification__block_invoke(uint64_t a1, char a2)
{
  if (*(unsigned char *)(a1 + 48))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (a2) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = *(void *)(a1 + 32);
    }
    id v6 = WeakRetained;
    [WeakRetained _endSuppressingInstanceFooterWithContext:v5];
  }
}

- (void)_handleChildViewControllerRequestingServiceMode:(id)a3
{
  id v6 = objc_alloc_init(PKPassPresentationContext);
  [(PKPassPresentationContext *)v6 setPersistentCardEmulation:1];
  id v4 = [(PKPassGroupStackView *)self->_groupStackView modalGroupFrontmostPass];
  uint64_t v5 = [v4 uniqueID];
  [(PKPassGroupsViewController *)self presentPassWithUniqueID:v5 context:v6 animated:1 completionHandler:0];
}

- (void)_localeDidChangeNotification:(id)a3
{
}

- (void)_regionConfigurationDidChangeNotification
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__PKPassGroupsViewController__regionConfigurationDidChangeNotification__block_invoke;
  block[3] = &unk_1E59CA7D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __71__PKPassGroupsViewController__regionConfigurationDidChangeNotification__block_invoke(uint64_t a1)
{
  id v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Region configuration changed", v4, 2u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 992) updateHeaderAndSubheaderViewsIfNecessary];
}

- (void)_handleFooterSupressionChange:(id)a3
{
}

- (BOOL)_canPerformExternalModalPresentation
{
  return self->_externalModalPresentationAllowed && !self->_inField;
}

- (void)invitationViewController:(id)a3 didFinishWithPass:(id)a4
{
  if (a4)
  {
    objc_msgSend(a4, "uniqueID", a3);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [(PKPassGroupsViewController *)self presentPassWithUniqueID:v5 animated:1 completionHandler:0];
  }
  else
  {
    -[PKPassGroupsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1);
  }
}

- (void)subcredentialProvisioningFlowController:(id)a3 didFinishWithPass:(id)a4 error:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v9;
    __int16 v15 = 2112;
    id v16 = v10;
    _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "Provisioning did finish with pass %@ and error %@", (uint8_t *)&v13, 0x16u);
  }

  if (v9)
  {
    char v12 = [v9 uniqueID];
    [(PKPassGroupsViewController *)self presentPassWithUniqueID:v12 animated:1 completionHandler:0];
  }
  else
  {
    char v12 = [(PKPassGroupsViewController *)self presentedViewController];
    [v12 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)userCanceledPairingWithSubcredentialProvisioningFlowController:(id)a3
{
  id v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Provisioning was cancelled", v6, 2u);
  }

  id v5 = [(PKPassGroupsViewController *)self presentedViewController];
  [v5 dismissViewControllerAnimated:1 completion:0];
}

- (void)paymentSetupDidFinish:(id)a3
{
  id v16[2] = *MEMORY[0x1E4F143B8];
  id v4 = [a3 provisioningController];
  id v5 = [v4 provisionedPasses];
  id v6 = [v5 lastObject];
  id v7 = [v6 secureElementPass];
  id v8 = [v7 paymentPass];

  if (v8)
  {
    id v9 = [v8 uniqueID];
    [(PKPassGroupsViewController *)self presentPassWithUniqueID:v9 animated:1 completionHandler:0];

    id v10 = (void *)MEMORY[0x1E4F843E0];
    uint64_t v11 = *MEMORY[0x1E4F87068];
    uint64_t v12 = *MEMORY[0x1E4F86730];
    v15[0] = *MEMORY[0x1E4F86308];
    v15[1] = v12;
    uint64_t v13 = *MEMORY[0x1E4F86E90];
    v16[0] = *MEMORY[0x1E4F864A0];
    v16[1] = v13;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
    [v10 subject:v11 sendEvent:v14];
  }
  else
  {
    [(PKPassGroupsViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)paymentSetupRequestPresentPassUniqueIdentifier:(id)a3 completion:(id)a4
{
}

- (void)discoveryDataSource:(id)a3 didUpdateArticleLayouts:(id)a4
{
  p_discoveryGalleryView = &self->_discoveryGalleryView;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_discoveryGalleryView);
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained updateArticleLayouts:v6];
  }
  else
  {
    uint64_t v8 = [v6 count];

    if (v8) {
      [(PKPassGroupStackView *)self->_groupStackView updateHeaderAndSubheaderViewsIfNecessary];
    }
  }
}

- (void)virtualCardEnrollmentViewController:(id)a3 didCompleteWithSuccess:(BOOL)a4
{
  id v4 = [a3 presentingViewController];
  [v4 dismissViewControllerAnimated:1 completion:0];
}

- (void)applicationMessageViewNeedsSizeUpdate:(id)a3
{
  id v15 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_applicationMessageView);

  if (WeakRetained == v15)
  {
    id v5 = [v15 configuration];
    [v5 width];
    double v7 = v6;

    objc_msgSend(v15, "sizeThatFits:", v7, 1.79769313e308);
    double v9 = v8;
    double v11 = v10;
    [v15 bounds];
    if (v9 != v13 || v11 != v12)
    {
      objc_msgSend(v15, "setBounds:");
      [v15 layoutIfNeededAnimated:1];
      [(PKPassGroupStackView *)self->_groupStackView updateHeaderAndSubheaderViewsIfNecessary];
    }
  }
}

- (void)applicationMessageViewNeedsRemoval:(id)a3
{
  p_applicationMessageView = &self->_applicationMessageView;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_applicationMessageView);

  if (WeakRetained == v5)
  {
    groupStackView = self->_groupStackView;
    [(PKPassGroupStackView *)groupStackView updateHeaderAndSubheaderViewsIfNecessary];
  }
}

- (void)applicationMessageView:(id)a3 requestsContentDismissal:(id)a4
{
  id v10 = 0;
  id v5 = (void *)[MEMORY[0x1E4F84460] messageKeysForNode:a4 localKeys:&v10];
  double v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 count];
    if (v7)
    {
      if (v7 == 1)
      {
        paymentService = self->_paymentService;
        double v9 = [v6 firstObject];
        [(PKPaymentService *)paymentService removeApplicationMessageWithKey:v9];
      }
      else
      {
        [(PKPaymentService *)self->_paymentService removeApplicationMessagesWithKeys:v6 completion:0];
      }
    }
  }
}

- (void)applicationMessageView:(id)a3 tappedApplicationMessageWithKey:(id)a4
{
  id v5 = a4;
  if ([v5 source]) {
    [(PKPaymentService *)self->_paymentService tappedApplicationMessageWithKey:v5];
  }
}

- (void)setNeedsUpdateForGroupStackViewSectionSubheaderView:(id)a3
{
}

- (void)groupStackViewSectionSubheaderView:(id)a3 transitionToViewController:(id)a4
{
}

- (void)setNeedsUpdateForGroupStackViewSectionHeaderView:(id)a3
{
}

- (void)presentPaymentSetupForHeaderView:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v5 = *MEMORY[0x1E4F87058];
  uint64_t v6 = *MEMORY[0x1E4F86120];
  uint64_t v11 = *MEMORY[0x1E4F86308];
  uint64_t v12 = v6;
  uint64_t v7 = *MEMORY[0x1E4F86AB0];
  uint64_t v13 = *MEMORY[0x1E4F86380];
  uint64_t v14 = v7;
  double v8 = (void *)MEMORY[0x1E4F1C9E8];
  id v9 = a3;
  id v10 = [v8 dictionaryWithObjects:&v13 forKeys:&v11 count:2];
  [v4 subject:v5 sendEvent:v10];

  -[PKPassGroupsViewController startPaymentPreflight:withPaymentSetupMode:referrerIdentifier:paymentNetworks:transitNetworkIdentifiers:allowedFeatureIdentifiers:productIdentifiers:](self, "startPaymentPreflight:withPaymentSetupMode:referrerIdentifier:paymentNetworks:transitNetworkIdentifiers:allowedFeatureIdentifiers:productIdentifiers:", v9, 0, 0, 0, 0, 0, 0, v11, v12, v13, v14, v15);
}

- (id)passForSectionHeaderView:(id)a3
{
  if ([(PKGroupsController *)self->_groupsController groupCount] == 1
    && [(PKGroupsController *)self->_groupsController indexOfSeparationGroup] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = [(PKGroupsController *)self->_groupsController groupAtIndex:0];
    uint64_t v5 = objc_msgSend(v4, "passAtIndex:", objc_msgSend(v4, "frontmostPassIndex"));
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)presentPassDetailsForHeaderView:(id)a3
{
  id v7 = [(PKGroupsController *)self->_groupsController groupAtIndex:0];
  id v4 = objc_msgSend(v7, "passAtIndex:", objc_msgSend(v7, "frontmostPassIndex"));
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 uniqueID];
    [(PKPassGroupsViewController *)self presentPassDetailsWithUniqueID:v6 animated:1 completionHandler:0];
  }
}

- (void)presentInvitationsForHeaderView:(id)a3
{
  uint64_t v5 = [[PKInboxViewController alloc] initWithInboxDataSource:self->_inboxDataSource contactAvatarManager:self->_avatarManager context:0];
  id v4 = [[PKNavigationController alloc] initWithRootViewController:v5];
  [(PKPassGroupsViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)presentOrderManagementForHeaderView:(id)a3
{
}

void __66__PKPassGroupsViewController_presentOrderManagementForHeaderView___block_invoke()
{
  v7[3] = *MEMORY[0x1E4F143B8];
  id v0 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v1 = *MEMORY[0x1E4F87030];
  uint64_t v2 = *MEMORY[0x1E4F86380];
  uint64_t v3 = *MEMORY[0x1E4F86B38];
  v6[0] = *MEMORY[0x1E4F86308];
  v6[1] = v3;
  uint64_t v4 = *MEMORY[0x1E4F86B68];
  v7[0] = v2;
  v7[1] = v4;
  v6[2] = *MEMORY[0x1E4F865B0];
  v7[2] = *MEMORY[0x1E4F865B8];
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];
  [v0 subject:v1 sendEvent:v5];
}

- (int64_t)style
{
  return self->_style;
}

- (void)setSuppressedContent:(unint64_t)a3
{
  self->_suppressedContent = a3;
}

- (void)setPassesAreOutdated:(BOOL)a3
{
  self->_passesAreOutdated = a3;
}

- (BOOL)handleFieldDetection
{
  return self->_handleFieldDetection;
}

- (void)setHandleFieldDetection:(BOOL)a3
{
  self->_handleFieldDetection = a3;
}

- (BOOL)isWelcomeStateEnabled
{
  return self->_welcomeStateEnabled;
}

- (BOOL)isExternalModalPresentationAllowed
{
  return self->_externalModalPresentationAllowed;
}

- (BOOL)assertExpressAvailable
{
  return self->_assertExpressAvailable;
}

- (void)setAssertExpressAvailable:(BOOL)a3
{
  self->_assertExpressAvailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupsController, 0);
  objc_storeStrong((id *)&self->_messages, 0);
  objc_storeStrong((id *)&self->_avatarManager, 0);
  objc_storeStrong((id *)&self->_discoveryDataSource, 0);
  objc_storeStrong((id *)&self->_accountServiceAccountResolutionController, 0);
  objc_storeStrong((id *)&self->_applyController, 0);
  objc_storeStrong((id *)&self->_payLaterSetupFlowController, 0);
  objc_storeStrong((id *)&self->_inboxDataSource, 0);
  objc_storeStrong((id *)&self->_associatedAccountsController, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccountResolutionController, 0);
  objc_storeStrong((id *)&self->_peerPaymentService, 0);
  objc_storeStrong((id *)&self->_passLibraryDataProvider, 0);
  objc_storeStrong((id *)&self->_passUniqueIDsToExcludeFromFiltering, 0);
  objc_storeStrong((id *)&self->_blocksQueuedForUpdateCompletion, 0);
  objc_storeStrong((id *)&self->_passViewedNotificationTimer, 0);
  objc_storeStrong((id *)&self->_allowDimmingTimer, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_destroyWeak((id *)&self->_applicationMessageView);
  objc_destroyWeak((id *)&self->_discoveryGalleryView);
  objc_destroyWeak((id *)&self->_barcodeHeaderView);
  objc_destroyWeak((id *)&self->_paymentHeaderView);
  objc_storeStrong((id *)&self->_footerBackground, 0);
  objc_storeStrong((id *)&self->_headerBackground, 0);
  objc_storeStrong((id *)&self->_groupStackView, 0);

  objc_storeStrong((id *)&self->_metricController, 0);
}

@end