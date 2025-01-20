@interface PKDashboardPaymentPassDataSource
- ($65C3FA8A572F9D8A414E710B16373297)_peerPaymentDashboardCondition;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)_dataSourceIndicesForIndexPath:(SEL)a3;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)_dataSourceIndicesForIndexSection:(SEL)a3;
- (BOOL)_accountCanBePresented:(id)a3;
- (BOOL)_balanceSectionHasFooter;
- (BOOL)_canDisplayBalance;
- (BOOL)_canFilterTransactions;
- (BOOL)_canShowTransactions;
- (BOOL)_creditAccountItemTypeEnabled:(unint64_t)a3;
- (BOOL)_hasPassPersonalized;
- (BOOL)_hasPassWithSupportedCardType;
- (BOOL)_isAppleBalancePass;
- (BOOL)_isBankConnectPassReady;
- (BOOL)_isCreditPass;
- (BOOL)_isDisclosureSectionChanged:(id)a3 newAccount:(id)a4;
- (BOOL)_isExistingRecurringPeerPayment:(id)a3;
- (BOOL)_isPayLaterPass;
- (BOOL)_isPeerPaymentPass;
- (BOOL)_isShowingSetUpMessage;
- (BOOL)_passAvailableForAMPEnrollment;
- (BOOL)_shouldPaymentMessageAppear:(id)a3;
- (BOOL)_topUpEnabled;
- (BOOL)accountsLoaded;
- (BOOL)allContentIsLoaded;
- (BOOL)bankConnectDataLoaded;
- (BOOL)canDeleteItem:(id)a3;
- (BOOL)canDisplayAppleBalanceBalance;
- (BOOL)canDisplayPeerPaymentBalanceModule;
- (BOOL)canShowPeerPaymentRecurringPayments;
- (BOOL)financingPlansLoaded;
- (BOOL)hasAssociatedPaymentRewardsBalance;
- (BOOL)hasBankConnectAccountBalance;
- (BOOL)hasBankConnectTransactions;
- (BOOL)hasMoreFinancingPlansToLoad;
- (BOOL)hasPayLaterEligibleSpend;
- (BOOL)homeKitHasHomeGuestAccessSchedule;
- (BOOL)isBankConnectLinked;
- (BOOL)isBankConnectSupported;
- (BOOL)isGroupInTheCurrentYear:(id)a3;
- (BOOL)isListLayoutForSection:(unint64_t)a3;
- (BOOL)loadingFinancingPlans;
- (BOOL)payWithRewardsSupportState;
- (BOOL)performPrecursorPassAction;
- (BOOL)performingAccountUpdate;
- (BOOL)recurringPeerPaymentsLoaded;
- (BOOL)shouldDisplayPayLaterItems;
- (BOOL)supportsPaymentRewardsBalance;
- (FKBankConnectAccountsProvider)bankConnectAccountsProvider;
- (FKBankConnectImageProvider)bankConnectImageProvider;
- (FKBankConnectInstitutionMatcher)bankConnectInstitutionMatcher;
- (FKBankConnectMessagesManager)bankConnectMessagesManager;
- (FKBankConnectTransactionsAndGroupsProvider)bankConnectTransactionsProvider;
- (NSArray)accountUserInvitations;
- (NSArray)accounts;
- (NSArray)bankConnectMonthlyTransactionGroups;
- (NSArray)bankConnectYearlyTransactionGroups;
- (NSArray)currentMonthTransactions;
- (NSArray)financingPlans;
- (NSArray)months;
- (NSArray)payLaterUpcomingInstallments;
- (NSArray)pendingPayments;
- (NSArray)recurringPayments;
- (NSArray)recurringPeerPayments;
- (NSArray)transactionGroups;
- (NSArray)upcomingRecurringPeerPayments;
- (NSArray)upcomingScheduledPayments;
- (NSArray)weeks;
- (NSArray)years;
- (NSDictionary)installmentIdentifierToFinancingPlan;
- (NSError)accountUpdateError;
- (NSOrderedSet)secondaryMessages;
- (NSSet)physicalCards;
- (NSUUID)homeKitHomeIdentifier;
- (PKAccount)account;
- (PKAccountService)accountService;
- (PKAccountUserCollection)accountUserCollection;
- (PKAppleBalanceAddMoneyUIManager)appleBalanceAddMoneyUIManager;
- (PKContactAvatarManager)avatarManager;
- (PKCurrencyAmount)lastUpdatedBalance;
- (PKCurrencyAmount)payLaterDueNext30Days;
- (PKCurrencyAmount)payLaterTotalPending;
- (PKDashboardBankConnectLinkedAccountData)bankConnectLinkedAccountData;
- (PKDashboardDataSourceDelegate)delegate;
- (PKDashboardPassMessage)bankConnectMessage;
- (PKDashboardPaymentPassDataSource)initWithGroupView:(id)a3 context:(id)a4;
- (PKDashboardPaymentPassDataSourceDelegate)customDelegate;
- (PKDashboardTransactionFetcher)transactionFetcher;
- (PKFamilyMemberCollection)familyCollection;
- (PKNearbyPeerPaymentViewProvider)nearbyPeerPaymentViewProvider;
- (PKPassGroupView)groupView;
- (PKPassPresentationContext)context;
- (PKPayLaterCalendarViewController)payLaterCalendarViewController;
- (PKPayLaterDashboardMessageComposer)payLaterDashboardMessageComposer;
- (PKPayLaterFinancingPlansFetcher)plansFetcher;
- (PKPayLaterInstallmentPresenter)installmentPresenter;
- (PKPayLaterPaymentIntentController)paymentIntentController;
- (PKPaymentPass)pass;
- (PKPaymentRewardsBalance)associatedPaymentRewardsBalance;
- (PKPeerPaymentAccount)peerPaymentAccount;
- (PKPeerPaymentRecurringPayment)peerPaymentThresholdTopUp;
- (PKPeerPaymentWebService)peerPaymentWebService;
- (PKSpendingSummaryFetcher)summaryFetcher;
- (PKTransactionSourceCollection)transactionSourceCollection;
- (id)AMPEnagementPlacementForCurrentlyDisplayedPass;
- (id)_cardSharingEducationMessages;
- (id)_contactResolver;
- (id)_createBackgroundRefreshConfirmationMessageWithInstitution:(id)a3;
- (id)_createConnectedMessageWithInstitution:(id)a3;
- (id)_createMismatchedAccountMessageWithInstitution:(id)a3 withPreviousConsentUUID:(id)a4;
- (id)_createReconsentMessageWithInstitution:(id)a3 withPreviousConsentUUID:(id)a4;
- (id)_createSetupMessageWithInstitution:(id)a3;
- (id)_createTermsAndConditionsUpdateMessageWithTermsAndConditions:(id)a3;
- (id)_deletablePaymentTransactionForItem:(id)a3;
- (id)_deviceAssessmentEducationImage;
- (id)_downloadMessageIconURLAndReloadIfNecessary:(id)a3;
- (id)_fetchOpenSavingsAccount;
- (id)_formattedDateStringForDate:(id)a3;
- (id)_lastPhysicalCardMessageDateKeyForPhysicalCardIdentifier:(id)a3;
- (id)_messageForAMPEnrollment;
- (id)_messageForAccountPendingFamilyMembers;
- (id)_messageForAutoReload;
- (id)_messageForBroadwayDiscoverability;
- (id)_messageForDeviceAssessmentEducation;
- (id)_messageForErrorCode:(unint64_t)a3;
- (id)_messageForExpressEducation;
- (id)_messageForFirstMonthCoOwners;
- (id)_messageForHomeAccessRestricted;
- (id)_messageForIdentityFirstTimeUse;
- (id)_messageForPaymentApplicationStatus;
- (id)_messageForPaymentInformationEventExtensionInstallation;
- (id)_messageForPeerPaymentAssociatedAccountLockedAccount;
- (id)_messageForPeerPaymentAssociatedAccountPending;
- (id)_messageForPeerPaymentAssociatedAccountStateChangedForSecurityReasons;
- (id)_messageForPeerPaymentFamilySharing;
- (id)_messageForPeerPaymentLockedAccountByAssociatedAccount;
- (id)_messageForPersonWithAmount:(id)a3 withHeuristicIds:(id)a4 andCurrencyCode:(id)a5;
- (id)_messageForRangingSuspendedPass;
- (id)_messageForSessionActive;
- (id)_messageForSetUpVirtualCardWithFeatureIdentifier:(unint64_t)a3;
- (id)_messageForVirtualCardEnabledWithFeatureIdentifier:(unint64_t)a3;
- (id)_messageFromEngagementMessage:(id)a3;
- (id)_messageIdentifierForRecurringPayment:(id)a3;
- (id)_messageImageWithName:(id)a3 extension:(id)a4;
- (id)_messagesForAccountUserInvitations;
- (id)_messagesForAccountUserSetupCashForFamily;
- (id)_messagesForInstallmentPlans;
- (id)_messagesForLockedCardParticipants;
- (id)_messagesForPhysicalCard;
- (id)_messagesForPhysicalCardExpiration;
- (id)_messagesToOrderPhysicalCardForUnderageParticipants;
- (id)_mismatchedAccountImageWithInstitutionImage:(id)a3;
- (id)_peerPaymentAccountStatusMessage;
- (id)_physicalCardMessageIdentifierFromIdentifier:(id)a3 physicalCard:(id)a4;
- (id)_recipientNameForAddress:(id)a3;
- (id)_replaceDashboardMessage:(id)a3 placeholder:(id)a4 replacement:(id)a5;
- (id)_replaceDashboardMessagePlaceholders:(id)a3;
- (id)_titleForErrorCode:(unint64_t)a3;
- (id)_virtualCardDashboardImage;
- (id)accountItemAtIndex:(unint64_t)a3;
- (id)actionCallingSelectorWeakly:(SEL)a3;
- (id)appleBalanceAccountItem;
- (id)dashboardRewardsBalanceItem;
- (id)deviceTapAmountEntryViewControllerWithInitialAmount:(id)a3 initialMemo:(id)a4 dismissAction:(id)a5;
- (id)footerTextItemForSection:(unint64_t)a3;
- (id)getPassProductType;
- (id)groupItemForTransactionGroup:(id)a3;
- (id)itemAtIndexPath:(id)a3;
- (id)messageForSavingsAccountFDIC;
- (id)messagesForSavingsAccountStatus;
- (id)payLaterAccountItem;
- (id)payLaterCompleteFinancingPlansItemForItemIndex:(unint64_t)a3;
- (id)payLaterEligibleSpendItemForItemIndex:(unint64_t)a3;
- (id)payLaterFinancingPlanItemForItemIndex:(unint64_t)a3;
- (id)payLaterFinancingPlanSeeAllPaymentsItem;
- (id)payLaterFooterTextItemForSection:(unint64_t)a3;
- (id)payLaterInstallmentItemForItemIndex:(unint64_t)a3;
- (id)paymentTransactionItemForPayment:(id)a3;
- (id)paymentTransactionItemForPendingRequest:(id)a3;
- (id)paymentTransactionItemForTransaction:(id)a3;
- (id)peerPaymentBalanceItem;
- (id)presentationContext;
- (id)recurringPaymentDashboardMessages;
- (id)revokingAccessMessage;
- (id)titleForSection:(unint64_t)a3;
- (id)upcomingRecurringPeerPaymentItemAtIndex:(unint64_t)a3;
- (int64_t)_numberOfBalanceDashboardItems;
- (int64_t)completedFinancingPlansCount;
- (int64_t)numberOfAppleBalanceBalanceDashboardItems;
- (int64_t)numberOfCompletedFinancingPlanItems;
- (int64_t)numberOfFinancingPlansEnabled;
- (int64_t)numberOfPayLaterBalanceDashboardItems;
- (int64_t)numberOfPayLaterEligibleSpend;
- (int64_t)numberOfPayLaterUpcomingPayments;
- (unint64_t)_creditAccountItemTypeForItemIndex:(unint64_t)a3;
- (unint64_t)_passFeature;
- (unint64_t)firstSectionIndexForSectionIdentifier:(unint64_t)a3;
- (unint64_t)numberOfAccounts;
- (unint64_t)numberOfItemsInSection:(unint64_t)a3;
- (unint64_t)numberOfSections;
- (unint64_t)numberOfUpcomingRecurringPeerPayments;
- (unint64_t)transactionsCount;
- (void)_addPayLaterSectionsToReload:(id)a3;
- (void)_addToAMPButtonTappedForPass:(id)a3;
- (void)_applyDiff:(id)a3;
- (void)_authorizeInstitution:(id)a3;
- (void)_beginReportingIfNecessary;
- (void)_calculateDiffAndUpdateWithTransactionGroups:(id)a3;
- (void)_calculateDiffAndUpdateWithTransactions:(id)a3;
- (void)_cancelExpirationTimerIfNeeded;
- (void)_deleteButtonPressed;
- (void)_dismissMessageForRecurringPayment:(id)a3;
- (void)_dismissRecurringPeerPaymentSuggestionsWithIdentifiers:(id)a3 dismissalType:(unint64_t)a4;
- (void)_fetchAMPEnrollmentEligibility;
- (void)_fetchAMPEnrollmentIconIfNeeded:(id)a3;
- (void)_fetchBankConnectTransactions;
- (void)_fetchMerchantForAuxiliarySections:(id)a3 pass:(id)a4 completion:(id)a5;
- (void)_hideBankConnectMessageAndReloadIfNeeded;
- (void)_hideLatestTransactions;
- (void)_hideTransactionGroups;
- (void)_localeDidChangeNotification:(id)a3;
- (void)_lostModeButtonTapped;
- (void)_messageForEnableNotificationsWithCompletion:(id)a3;
- (void)_messageForInterestChargeWithCompletion:(id)a3;
- (void)_messageForPassInconsistencyWithCompletion:(id)a3;
- (void)_messageForPaymentFailedWithCompletion:(id)a3;
- (void)_messageForPeerPaymentIdentityVerificationForRewardsWithCompletion:(id)a3;
- (void)_messageForPeerPaymentRewardsRedemptionWithCompletion:(id)a3;
- (void)_messageForPrecursorPassUpgradeWithController:(id)a3 completion:(id)a4;
- (void)_messageForUnusableIdentityPassWithCompletion:(id)a3;
- (void)_messageFromPaymentServiceSuppressingPassStateChanges:(BOOL)a3 completion:(id)a4;
- (void)_messagesForAccountStatusWithCompletion:(id)a3;
- (void)_messagesForPeerPaymentPendingRequestsWithCompletion:(id)a3;
- (void)_monthlyTransactionGroupsWithCompletion:(id)a3;
- (void)_peerPaymentAccountChanged:(id)a3;
- (void)_peerPaymentResolutionTappedWithResolution:(unint64_t)a3;
- (void)_pendingRequestActionButtonPressedWithRequest:(id)a3;
- (void)_performReloadTransitSection;
- (void)_presentAboutClosedAccounts;
- (void)_presentAccountResolution:(unint64_t)a3 forBusinessChatContext:(id)a4;
- (void)_presentAccountUserDetails:(id)a3;
- (void)_presentAccountUserInvitation:(id)a3;
- (void)_presentActivatePhysicalCard:(id)a3 accountUser:(id)a4;
- (void)_presentApplCashFamilySetupForFamilyMember:(id)a3;
- (void)_presentBalanceDetails;
- (void)_presentCardNumbers;
- (void)_presentCreateAccountUserInvitation;
- (void)_presentDetailsForRecurringPayment:(id)a3;
- (void)_presentInboxMessage:(id)a3;
- (void)_presentPassContactSupportWithOption:(unint64_t)a3;
- (void)_presentPassDetailsWithAction:(unint64_t)a3;
- (void)_presentPassDetailsWithHandler:(id)a3;
- (void)_presentPassWithPassUniqueIdentifier:(id)a3;
- (void)_presentPrecursorActionFlowWithController:(id)a3;
- (void)_presentRestrictedGuestAccessSchedule;
- (void)_processUpcomingInstallmentsWithQueryResposne:(id)a3 sectionsToReload:(id)a4 changedIndexPaths:(id)a5;
- (void)_processUpdatedCompletedFinancingPlansCount:(int64_t)a3 sectionsToReload:(id)a4 changedIndexPaths:(id)a5;
- (void)_processUpdatedFinancingPlans:(id)a3 sectionsToReload:(id)a4 changedIndexPaths:(id)a5;
- (void)_reconsentInstitution:(id)a3 withPreviousConsentUUID:(id)a4;
- (void)_recurringPeerPaymentSuggestionsWithCompletion:(id)a3;
- (void)_refetchBalanceAndTransactions;
- (void)_refreshTransactionsSection;
- (void)_reloadBalance;
- (void)_reloadMessages;
- (void)_reloadTransactionGrouping;
- (void)_scheduleExpirationTimerForCommutePlans:(id)a3;
- (void)_setPassView:(id)a3;
- (void)_showBankConnectMessage:(id)a3 forInstitution:(id)a4 shouldUseInstitutionLogo:(BOOL)a5;
- (void)_showBankConnectMessageIfNeeded;
- (void)_startRefetchingData;
- (void)_updateAccountEnhancedMerchants;
- (void)_updateAccountPromotions;
- (void)_updateAccountRewardsDataIfNecessary;
- (void)_updateAccounts:(id)a3;
- (void)_updateBalance;
- (void)_updateBalanceAndPreventReload:(BOOL)a3;
- (void)_updateCanShowPeerPaymentRecurringPayments:(BOOL)a3;
- (void)_updateDiscoveryEngagementMessageIfNeeded:(id)a3;
- (void)_updateRewardsBalanceItem;
- (void)_updateTransactionSourceCollection;
- (void)_updateTransactionsTimer;
- (void)_updateTransitBalanceProperties:(id)a3 dynamicBalances:(id)a4 dynamicPlans:(id)a5;
- (void)_updateWithFamilyCollection:(id)a3;
- (void)_updateWithHomeKitHasHomeAccessSchedule:(BOOL)a3 homeIdentifier:(id)a4 isHomeAccessRestricted:(BOOL)a5;
- (void)_updateWithTiles:(id)a3;
- (void)_updateWithTransactionGroups:(id)a3;
- (void)_verificationButtonTapped;
- (void)_yearlyTransactionGroupsWithCompletion:(id)a3;
- (void)accountAdded:(id)a3;
- (void)accountChanged:(id)a3;
- (void)accountFinancingPlanAdded:(id)a3 accountIdentifier:(id)a4;
- (void)accountFinancingPlanRemoved:(id)a3 accountIdentifier:(id)a4;
- (void)accountFinancingPlanUpdated:(id)a3 oldFinancingPlan:(id)a4 accountIdentifier:(id)a5;
- (void)accountRemoved:(id)a3;
- (void)accountServiceAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5;
- (void)accountUsersChanged:(id)a3 forAccountIdentifier:(id)a4;
- (void)appleBalanceDashboardMessagesWithCompletion:(id)a3;
- (void)autoReloadSetupController:(id)a3 requestsDismissViewController:(id)a4;
- (void)autoReloadSetupController:(id)a3 requestsPresentViewController:(id)a4;
- (void)bankConnectAccountDidChange:(id)a3;
- (void)bankConnectConsentStatusDidChange:(unint64_t)a3;
- (void)clearBankConnectData;
- (void)contactIssuerHelper:(id)a3 didRequestDismissViewControllerAnimated:(BOOL)a4 completion:(id)a5;
- (void)contactIssuerHelper:(id)a3 didRequestPresentViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)credential:(id)a3 forPaymentApplication:(id)a4 didUpdateRangingSuspensionReasons:(unint64_t)a5;
- (void)creditRecoveryPaymentPlansChangedForAccountIdentifier:(id)a3;
- (void)dashboardMessageComposer:(id)a3 requestPresentFinancingPlanDetails:(id)a4;
- (void)dashboardMessageComposer:(id)a3 requestPresentPassDetailsForPass:(id)a4;
- (void)dashboardMessageComposer:(id)a3 requestPresentViewController:(id)a4;
- (void)dashboardMessageComposer:(id)a3 requestPushViewController:(id)a4;
- (void)dealloc;
- (void)deleteItem:(id)a3 completionHandler:(id)a4;
- (void)didRemoveAppleBalancePromotionWithUniqueIdentifier:(id)a3 forAccountIdentifier:(id)a4;
- (void)didUpdateAppleBalancePromotion:(id)a3 forAccountIdentifier:(id)a4;
- (void)didUpdateFamilyMembers:(id)a3;
- (void)didUpdateLatestTransactions:(id)a3 monthlyTransactionGroups:(id)a4 yearlyTransactionGroups:(id)a5;
- (void)discoveryService:(id)a3 dialogRequestsChangedForPlacement:(id)a4;
- (void)dismissOnDeviceAssessmentEducation;
- (void)dismissPendingRequestDashboardMessageWithRequest:(id)a3;
- (void)dismissVerificationViewControllerAnimated:(BOOL)a3;
- (void)executeAfterContentIsLoaded:(id)a3;
- (void)executeEngagementActionForURL:(id)a3;
- (void)featureApplicationAdded:(id)a3;
- (void)featureApplicationChanged:(id)a3;
- (void)featureApplicationRemoved:(id)a3;
- (void)foregroundActiveArbiter:(id)a3 didUpdateForegroundActiveState:(id)a4;
- (void)groupView:(id)a3 frontmostPassViewDidChange:(id)a4 withContext:(id)a5;
- (void)inboxDataSourceDidUpdateInboxMessages:(id)a3;
- (void)invalidatedSpendingSummariesOfType:(unint64_t)a3;
- (void)invalidatedSpendingSummaryOfType:(unint64_t)a3 startingWithDate:(id)a4;
- (void)invalidatedSummariesAvailable;
- (void)loadSummariesWithForceReload:(BOOL)a3;
- (void)messageForSavingsRewardsRedemptionWithCompletion:(id)a3;
- (void)openDeviceAssessmentEducationLearnMore;
- (void)passView:(id)a3 didUpdatePassState:(id)a4;
- (void)passWithUniqueIdentifier:(id)a3 didUpdateTiles:(id)a4 forContext:(int64_t)a5;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didEnableMessageService:(BOOL)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveMessage:(id)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceivePlanUpdate:(id)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitPassProperties:(id)a4;
- (void)peerPaymentAccountResolutionController:(id)a3 requestsDismissCurrentViewControllerAnimated:(BOOL)a4;
- (void)peerPaymentAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5;
- (void)pendingRequestsChanged;
- (void)physicalCardsChanged:(id)a3 forAccountIdentifier:(id)a4;
- (void)presentPayLaterCalendarViewController;
- (void)presentVerificationViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)recipientPickerViewControllerRequestsDismissViewController:(id)a3;
- (void)recurringPaymentsChanged;
- (void)reloadAccount;
- (void)reloadAccountPendingMembersWithNewMembers:(id)a3;
- (void)reloadAccountUserInvitationsWithNewAccountUserInvitations:(id)a3;
- (void)reloadAccountUsersWithNewAccountUserCollection:(id)a3;
- (void)reloadAccountWithNewAccount:(id)a3;
- (void)reloadAccounts;
- (void)reloadAllContent;
- (void)reloadAppleBalance;
- (void)reloadAssociatedPaymentRewardsBalance;
- (void)reloadAuxiliaryItems;
- (void)reloadBankConnectData;
- (void)reloadCreditRecoveryPaymentPlans;
- (void)reloadDialogRequests;
- (void)reloadDisclosuresSectionIfNeeded;
- (void)reloadFamilyCollection;
- (void)reloadFinancingPlans;
- (void)reloadFrontmostPass;
- (void)reloadHomeKitRestrictedGuestAccessState;
- (void)reloadMessages;
- (void)reloadPeerPaymentPendingRequestsWithCompletion:(id)a3;
- (void)reloadPhysicalCardsWithNewPhysicalCards:(id)a3;
- (void)reloadRecurringPeerPaymentsWithCompletion:(id)a3;
- (void)reloadScheduledPayments;
- (void)reloadSecondaryMessages;
- (void)reloadTiles;
- (void)reloadTransactionGroups;
- (void)reloadTransactions;
- (void)reloadTransitSection;
- (void)reportDisplayedEngagementMessageIfNeeded:(id)a3;
- (void)resetAssociatedPaymentRewardsBalanceIfNeeded;
- (void)secureElementDidEnterRestrictedMode:(id)a3;
- (void)secureElementDidLeaveRestrictedMode:(id)a3;
- (void)setAccountService:(id)a3;
- (void)setAccountUpdateError:(id)a3;
- (void)setAccounts:(id)a3;
- (void)setAccountsLoaded:(BOOL)a3;
- (void)setAllContentIsLoaded:(BOOL)a3;
- (void)setAppleBalanceAddMoneyUIManager:(id)a3;
- (void)setAssociatedPaymentRewardsBalance:(id)a3;
- (void)setBankConnectAccountsProvider:(id)a3;
- (void)setBankConnectDataLoaded:(BOOL)a3;
- (void)setBankConnectImageProvider:(id)a3;
- (void)setBankConnectInstitutionMatcher:(id)a3;
- (void)setBankConnectLinkedAccountData:(id)a3;
- (void)setBankConnectMessage:(id)a3;
- (void)setBankConnectMessagesManager:(id)a3;
- (void)setBankConnectMonthlyTransactionGroups:(id)a3;
- (void)setBankConnectTransactionsProvider:(id)a3;
- (void)setBankConnectYearlyTransactionGroups:(id)a3;
- (void)setCanShowPeerPaymentRecurringPayments:(BOOL)a3;
- (void)setCompletedFinancingPlansCount:(int64_t)a3;
- (void)setContext:(id)a3;
- (void)setCustomDelegate:(id)a3;
- (void)setDataSourceDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFinancingPlans:(id)a3;
- (void)setFinancingPlansLoaded:(BOOL)a3;
- (void)setHasMoreFinancingPlansToLoad:(BOOL)a3;
- (void)setHasPayLaterEligibleSpend:(BOOL)a3;
- (void)setInstallmentIdentifierToFinancingPlan:(id)a3;
- (void)setInstallmentPresenter:(id)a3;
- (void)setLastUpdatedBalance:(id)a3;
- (void)setLoadingFinancingPlans:(BOOL)a3;
- (void)setMonths:(id)a3;
- (void)setNearbyPeerPaymentViewProvider:(id)a3;
- (void)setPass:(id)a3;
- (void)setPayLaterCalendarViewController:(id)a3;
- (void)setPayLaterDashboardMessageComposer:(id)a3;
- (void)setPayLaterDueNext30Days:(id)a3;
- (void)setPayLaterTotalPending:(id)a3;
- (void)setPayLaterUpcomingInstallments:(id)a3;
- (void)setPayWithRewardsSupportState:(BOOL)a3;
- (void)setPaymentIntentController:(id)a3;
- (void)setPeerPaymentAccount:(id)a3;
- (void)setPeerPaymentThresholdTopUp:(id)a3;
- (void)setPeerPaymentWebService:(id)a3;
- (void)setPerformingAccountUpdate:(BOOL)a3;
- (void)setPlansFetcher:(id)a3;
- (void)setRecurringPeerPayments:(id)a3;
- (void)setRecurringPeerPaymentsLoaded:(BOOL)a3;
- (void)setShouldDisplayPayLaterItems:(BOOL)a3;
- (void)setTransactionGroups:(id)a3;
- (void)setTransactions:(id)a3;
- (void)setTransactionsCount:(unint64_t)a3;
- (void)setUpcomingRecurringPeerPayments:(id)a3;
- (void)setWeeks:(id)a3;
- (void)sharesDidUpdateWithPaymentPassWithUniqueIdentifier:(id)a3;
- (void)summaryTypeDidChange;
- (void)transactionsChanged:(id)a3;
- (void)updateContentIsLoaded;
- (void)updateWithBankConnectAccount:(id)a3 consentStatus:(unint64_t)a4 institution:(id)a5;
- (void)updateWithTransactions:(id)a3;
- (void)viewControllerDidCancelSetupFlow:(id)a3;
- (void)viewControllerDidTerminateSetupFlow:(id)a3;
- (void)virtualCardEnrollmentViewController:(id)a3 didCompleteWithSuccess:(BOOL)a4;
- (void)visibilityDidChangeToState:(unsigned __int8)a3;
@end

@implementation PKDashboardPaymentPassDataSource

- (id)appleBalanceAccountItem
{
  v3 = objc_alloc_init(PKDashboardBalanceItem);
  v4 = [(PKDashboardPaymentPassDataSource *)self account];
  v5 = [v4 appleBalanceDetails];

  v6 = [v5 accountSummary];
  v7 = [v6 currentBalance];
  v8 = [v5 currencyCode];
  v9 = PKCurrencyAmountMake();

  v10 = [v9 formattedStringValue];
  [(PKDashboardBalanceItem *)v3 setBalance:v10];

  v11 = PKLocalizedLynxString(&cfstr_PassBalanceTit.isa);
  [(PKDashboardBalanceItem *)v3 setTitle:v11];

  v12 = [MEMORY[0x1E4FB1618] labelColor];
  [(PKDashboardBalanceItem *)v3 setTitleColor:v12];

  v13 = PKLocalizedLynxString(&cfstr_PassAddMoneyBu.isa);
  [(PKDashboardBalanceItem *)v3 setTopUpTitle:v13];

  objc_initWeak(&location, self);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __73__PKDashboardPaymentPassDataSource_AppleBalance__appleBalanceAccountItem__block_invoke;
  v18 = &unk_1E59CA7F8;
  objc_copyWeak(&v19, &location);
  [(PKDashboardBalanceItem *)v3 setTopUpAction:&v15];
  [(PKDashboardBalanceItem *)v3 setTopUpEnabled:[(PKDashboardPaymentPassDataSource *)self _topUpEnabled]];
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v3;
}

void __73__PKDashboardPaymentPassDataSource_AppleBalance__appleBalanceAccountItem__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    v2 = [WeakRetained groupView];
    v3 = objc_msgSend(v2, "pkui_viewControllerFromResponderChain");
    v4 = [v3 navigationController];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v4 presentAddMoneyAppleBalance];
    }

    id WeakRetained = v5;
  }
}

- (BOOL)_topUpEnabled
{
  v3 = [(PKDashboardPaymentPassDataSource *)self account];
  if ([v3 supportsTopUp])
  {
    char v4 = 1;
  }
  else
  {
    id v5 = [(PKDashboardPaymentPassDataSource *)self account];
    char v4 = [v5 supportsAMPTopUp];
  }
  return v4;
}

- (BOOL)canDisplayAppleBalanceBalance
{
  return 1;
}

- (int64_t)numberOfAppleBalanceBalanceDashboardItems
{
  v3 = [(PKDashboardPaymentPassDataSource *)self account];
  char v4 = [(PKDashboardPaymentPassDataSource *)self pass];
  if (PKCanShowAppleBalanceTopUpOptions()) {
    int64_t v5 = [(PKDashboardPaymentPassDataSource *)self _topUpEnabled];
  }
  else {
    int64_t v5 = 0;
  }

  return v5;
}

- (void)reloadAppleBalance
{
  if ([(PKDashboardPaymentPassDataSource *)self _isAppleBalancePass])
  {
    v3 = [(PKDashboardPaymentPassDataSource *)self account];
    id v13 = [v3 appleBalanceDetails];

    char v4 = [v13 accountSummary];
    uint64_t v5 = [v4 currentBalance];
    v6 = [v13 currencyCode];
    v7 = PKCurrencyAmountMake();

    v8 = [(PKDashboardPaymentPassDataSource *)self lastUpdatedBalance];
    LOBYTE(v5) = [v7 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      [(PKDashboardPaymentPassDataSource *)self setLastUpdatedBalance:v7];
      [(PKDashboardPaymentPassDataSource *)self _updateBalance];
    }
    v9 = [(PKDashboardPaymentPassDataSource *)self appleBalanceAddMoneyUIManager];

    if (!v9)
    {
      v10 = [PKAppleBalanceAddMoneyUIManager alloc];
      v11 = [(PKDashboardPaymentPassDataSource *)self account];
      v12 = [(PKAppleBalanceAddMoneyUIManager *)v10 initWithAccount:v11];

      [(PKDashboardPaymentPassDataSource *)self setAppleBalanceAddMoneyUIManager:v12];
    }
  }
}

- (void)appleBalanceDashboardMessagesWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKDashboardPaymentPassDataSource *)self account];
  if (v5)
  {
    objc_initWeak(&location, self);
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x3032000000;
    v44 = __Block_byref_object_copy__2;
    v45 = __Block_byref_object_dispose__2;
    id v46 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ((PKSharedCacheGetBoolForKey() & 1) == 0)
    {
      v6 = [(PKDashboardPaymentPassDataSource *)self pass];
      uint64_t v7 = [v6 passActivationState];

      if (!v7)
      {
        v8 = objc_alloc_init(PKDashboardPassMessage);
        [(PKDashboardPassMessage *)v8 setIdentifier:@"appleBalanceReady"];
        v9 = [(PKDashboardPaymentPassDataSource *)self _messageImageWithName:@"AppleBalanceDashboardIcon" extension:@"pdf"];
        [(PKDashboardPassMessage *)v8 setImage:v9];

        v10 = PKLocalizedLynxString(&cfstr_AccountPassRea.isa);
        [(PKDashboardPassMessage *)v8 setTitle:v10];

        id v11 = [NSString alloc];
        int v12 = [v5 supportsInStorePayment];
        id v13 = @"_NO_IN_STORE_PAYMENT";
        if (v12) {
          id v13 = &stru_1EF1B5B50;
        }
        v14 = (NSString *)[v11 initWithFormat:@"ACCOUNT_PASS_READY_BODY%@", v13];
        uint64_t v15 = PKLocalizedLynxString(v14);
        [(PKDashboardPassMessage *)v8 setMessage:v15];

        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __94__PKDashboardPaymentPassDataSource_AppleBalance__appleBalanceDashboardMessagesWithCompletion___block_invoke;
        v39[3] = &unk_1E59CA7F8;
        objc_copyWeak(&v40, &location);
        [(PKDashboardPassMessage *)v8 setActionOnDismiss:v39];
        [(id)v42[5] addObject:v8];
        objc_destroyWeak(&v40);
      }
    }
    if ((PKSharedCacheGetBoolForKey() & 1) == 0 && [v5 supportsInStoreTopUp])
    {
      uint64_t v16 = objc_alloc_init(PKDashboardPassMessage);
      [(PKDashboardPassMessage *)v16 setIdentifier:@"appleBalanceInStoreTopUpEducation"];
      v17 = [MEMORY[0x1E4FB1830] configurationWithPointSize:45.0];
      v18 = [MEMORY[0x1E4FB1818] systemImageNamed:@"barcode.viewfinder" withConfiguration:v17];
      id v19 = [MEMORY[0x1E4FB1618] labelColor];
      v20 = [v18 imageWithTintColor:v19 renderingMode:1];

      [(PKDashboardPassMessage *)v16 setImage:v20];
      v21 = PKLocalizedLynxString(&cfstr_InStoreTopUpEd.isa);
      [(PKDashboardPassMessage *)v16 setTitle:v21];

      v22 = PKLocalizedLynxString(&cfstr_InStoreTopUpEd_0.isa);
      [(PKDashboardPassMessage *)v16 setMessage:v22];

      v23 = PKLocalizedLynxString(&cfstr_InStoreTopUpEd_1.isa);
      [(PKDashboardPassMessage *)v16 setButtonTitle:v23];

      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __94__PKDashboardPaymentPassDataSource_AppleBalance__appleBalanceDashboardMessagesWithCompletion___block_invoke_2;
      v37[3] = &unk_1E59CA7F8;
      objc_copyWeak(&v38, &location);
      [(PKDashboardPassMessage *)v16 setActionOnButtonPress:v37];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __94__PKDashboardPaymentPassDataSource_AppleBalance__appleBalanceDashboardMessagesWithCompletion___block_invoke_3;
      v35[3] = &unk_1E59CA7F8;
      objc_copyWeak(&v36, &location);
      [(PKDashboardPassMessage *)v16 setActionOnDismiss:v35];
      [(id)v42[5] addObject:v16];
      objc_destroyWeak(&v36);
      objc_destroyWeak(&v38);
    }
    if ([v5 supportsTopUp])
    {
      v24 = [v5 appleBalanceDetails];
      v25 = [v24 currencyCode];

      v26 = [(PKDashboardPaymentPassDataSource *)self accountService];
      v27 = [v5 accountIdentifier];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __94__PKDashboardPaymentPassDataSource_AppleBalance__appleBalanceDashboardMessagesWithCompletion___block_invoke_4;
      v30[3] = &unk_1E59CD280;
      v30[4] = self;
      id v28 = v25;
      id v31 = v28;
      objc_copyWeak(&v34, &location);
      v33 = &v41;
      id v32 = v4;
      [v26 appleBalancePromotionForAccountWithIdentifier:v27 completion:v30];

      objc_destroyWeak(&v34);
    }
    else
    {
      if (!v4) {
        goto LABEL_20;
      }
      uint64_t v29 = [(id)v42[5] count];
      id v28 = v29 ? (id)[(id)v42[5] copy] : 0;
      (*((void (**)(id, id))v4 + 2))(v4, v28);
      if (!v29) {
        goto LABEL_20;
      }
    }

LABEL_20:
    _Block_object_dispose(&v41, 8);

    objc_destroyWeak(&location);
    goto LABEL_21;
  }
  if (v4) {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
LABEL_21:
}

void __94__PKDashboardPaymentPassDataSource_AppleBalance__appleBalanceDashboardMessagesWithCompletion___block_invoke(uint64_t a1)
{
  PKSharedCacheSetBoolForKey();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained reloadMessages];
    id WeakRetained = v3;
  }
}

void __94__PKDashboardPaymentPassDataSource_AppleBalance__appleBalanceDashboardMessagesWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    v2 = [WeakRetained appleBalanceAddMoneyUIManager];
    id v3 = [v5 groupView];
    id v4 = objc_msgSend(v3, "pkui_viewControllerFromResponderChain");

    [v2 presentInStoreTopUpFromViewController:v4 context:0 token:0];
    id WeakRetained = v5;
  }
}

void __94__PKDashboardPaymentPassDataSource_AppleBalance__appleBalanceDashboardMessagesWithCompletion___block_invoke_3(uint64_t a1)
{
  PKSharedCacheSetBoolForKey();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained reloadMessages];
    id WeakRetained = v3;
  }
}

void __94__PKDashboardPaymentPassDataSource_AppleBalance__appleBalanceDashboardMessagesWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 uniqueIdentifier];
  if (v3 && (PKHasDismissedOrUsedAppleBalancePromotionWithIdentifier() & 1) == 0)
  {
    id v5 = objc_alloc_init(PKDashboardPassMessage);
    [(PKDashboardPassMessage *)v5 setIdentifier:@"appleBalancePromotion"];
    v6 = [*(id *)(a1 + 32) _messageImageWithName:@"AppleBalancePromoIcon" extension:@"png"];
    [(PKDashboardPassMessage *)v5 setImage:v6];

    uint64_t v7 = [v3 offerText];
    [(PKDashboardPassMessage *)v5 setTitle:v7];

    v8 = [v3 conditionText];
    [(PKDashboardPassMessage *)v5 setMessage:v8];

    v9 = [v3 bonusMinAmount];
    v10 = PKCurrencyAmountMake();

    id v11 = [v10 minimalFormattedStringValue];
    int v12 = PKLocalizedLynxString(&cfstr_DashboardPromo.isa, &stru_1EF1B4C70.isa, v11);
    [(PKDashboardPassMessage *)v5 setButtonTitle:v12];

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __94__PKDashboardPaymentPassDataSource_AppleBalance__appleBalanceDashboardMessagesWithCompletion___block_invoke_5;
    v18[3] = &unk_1E59CB010;
    objc_copyWeak(&v20, (id *)(a1 + 64));
    id v19 = v3;
    [(PKDashboardPassMessage *)v5 setActionOnButtonPress:v18];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __94__PKDashboardPaymentPassDataSource_AppleBalance__appleBalanceDashboardMessagesWithCompletion___block_invoke_6;
    v15[3] = &unk_1E59CA7A8;
    id v16 = v4;
    objc_copyWeak(&v17, (id *)(a1 + 64));
    [(PKDashboardPassMessage *)v5 setActionOnDismiss:v15];
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v5];
    objc_destroyWeak(&v17);

    objc_destroyWeak(&v20);
  }
  uint64_t v13 = *(void *)(a1 + 48);
  if (v13)
  {
    if ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count])
    {
      v14 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) copy];
      (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);
    }
    else
    {
      (*(void (**)(uint64_t, void))(v13 + 16))(v13, 0);
    }
  }
}

void __94__PKDashboardPaymentPassDataSource_AppleBalance__appleBalanceDashboardMessagesWithCompletion___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v3 = [WeakRetained appleBalanceAddMoneyUIManager];
    id v4 = [v6 groupView];
    id v5 = objc_msgSend(v4, "pkui_viewControllerFromResponderChain");

    [v3 presentDirectTopUpFromViewController:v5 context:3 configuration:0 promotion:*(void *)(a1 + 32) completion:0];
    id WeakRetained = v6;
  }
}

void __94__PKDashboardPaymentPassDataSource_AppleBalance__appleBalanceDashboardMessagesWithCompletion___block_invoke_6(uint64_t a1)
{
  PKSetHasDismissedOrUsedAppleBalancePromotionWithIdentifier();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained reloadMessages];
    id WeakRetained = v3;
  }
}

- (BOOL)supportsPaymentRewardsBalance
{
  return PKHideCardBenefitRewards() ^ 1;
}

- (BOOL)hasAssociatedPaymentRewardsBalance
{
  v2 = [(PKDashboardPaymentPassDataSource *)self associatedPaymentRewardsBalance];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)dashboardRewardsBalanceItem
{
  BOOL v3 = [(PKDashboardPaymentPassDataSource *)self associatedPaymentRewardsBalance];
  uint64_t v4 = [(PKDashboardPaymentPassDataSource *)self pass];
  id v5 = (void *)v4;
  id v6 = 0;
  if (v3 && v4)
  {
    uint64_t v7 = [(PKDashboardPaymentPassDataSource *)self transactionSourceCollection];
    v8 = [PKDashboardRewardsBalanceItem alloc];
    v9 = [v5 uniqueID];
    v10 = [v7 transactionSourceIdentifiers];
    id v6 = [(PKDashboardRewardsBalanceItem *)v8 initWithPaymentRewardsBalance:v3 passUniqueIdentifier:v9 transactionSourceIdentifiers:v10];
  }

  return v6;
}

- (void)reloadAssociatedPaymentRewardsBalance
{
  BOOL v3 = [(PKDashboardPaymentPassDataSource *)self supportsPaymentRewardsBalance];
  BOOL v4 = [(PKDashboardPaymentPassDataSource *)self _hasPassPersonalized];
  BOOL v5 = [(PKDashboardPaymentPassDataSource *)self _hasPassWithSupportedCardType];
  if (v3 != [(PKDashboardPaymentPassDataSource *)self payWithRewardsSupportState])
  {
    [(PKDashboardPaymentPassDataSource *)self setPayWithRewardsSupportState:v3];
    if (v4 && v5) {
      [(PKDashboardPaymentPassDataSource *)self _refreshTransactionsSection];
    }
  }
  if (v3 && v4 && v5)
  {
    id v6 = [(PKDashboardPaymentPassDataSource *)self pass];
    uint64_t v7 = [v6 uniqueID];

    if (v7)
    {
      v8 = objc_alloc_init(MEMORY[0x1E4F84C38]);
      v9 = [v8 paymentRewardsBalancesWithPassUniqueIdentifier:v7];
      v10 = __88__PKDashboardPaymentPassDataSource_PaymentOffers__reloadAssociatedPaymentRewardsBalance__block_invoke((uint64_t)v9, v9);

      if (v10)
      {
        id v11 = [(PKDashboardPaymentPassDataSource *)self associatedPaymentRewardsBalance];
        char v12 = [v10 isEqual:v11];

        if ((v12 & 1) == 0)
        {
          [(PKDashboardPaymentPassDataSource *)self setAssociatedPaymentRewardsBalance:v10];
          [(PKDashboardPaymentPassDataSource *)self _updateRewardsBalanceItem];
        }
      }
      uint64_t v13 = [(PKDashboardPaymentPassDataSource *)self associatedPaymentRewardsBalance];
      int v14 = [v13 isFresh];

      if (v14)
      {
        uint64_t v15 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl(&dword_19F450000, v15, OS_LOG_TYPE_DEFAULT, "Associated Payment Rewards Balance is fresh enough, skipping reload", (uint8_t *)buf, 2u);
        }
      }
      else
      {
        objc_initWeak(buf, self);
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __88__PKDashboardPaymentPassDataSource_PaymentOffers__reloadAssociatedPaymentRewardsBalance__block_invoke_15;
        v16[3] = &unk_1E59CF138;
        id v17 = v8;
        id v18 = v7;
        id v19 = &__block_literal_global_48;
        objc_copyWeak(&v20, buf);
        [v17 eligiblePaymentOfferCriteriasForPassUniqueID:v18 completion:v16];
        objc_destroyWeak(&v20);

        objc_destroyWeak(buf);
      }
    }
    else
    {
      v8 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Can't associate rewards balance with no pass", (uint8_t *)buf, 2u);
      }
    }
  }
  else
  {
    [(PKDashboardPaymentPassDataSource *)self resetAssociatedPaymentRewardsBalanceIfNeeded];
  }
}

id __88__PKDashboardPaymentPassDataSource_PaymentOffers__reloadAssociatedPaymentRewardsBalance__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = objc_msgSend(v2, "pk_firstObjectPassingTest:", &__block_literal_global_13);
  if (v3 || ![v2 count])
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [v2 firstObject];
  }
  BOOL v5 = v4;

  return v5;
}

uint64_t __88__PKDashboardPaymentPassDataSource_PaymentOffers__reloadAssociatedPaymentRewardsBalance__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isValid]) {
    uint64_t v3 = [v2 isRedeemable];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

void __88__PKDashboardPaymentPassDataSource_PaymentOffers__reloadAssociatedPaymentRewardsBalance__block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v6;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Error loading catalog criteria, %@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v7 = objc_msgSend(v5, "pk_firstObjectPassingTest:", &__block_literal_global_19);
    if (v7)
    {
      v8 = *(void **)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __88__PKDashboardPaymentPassDataSource_PaymentOffers__reloadAssociatedPaymentRewardsBalance__block_invoke_2_20;
      v10[3] = &unk_1E59CF110;
      id v11 = *(id *)(a1 + 48);
      objc_copyWeak(&v12, (id *)(a1 + 56));
      [v8 updatePaymentRewardsBalancesWithPassUniqueIdentifier:v9 completion:v10];
      objc_destroyWeak(&v12);
    }
  }
}

BOOL __88__PKDashboardPaymentPassDataSource_PaymentOffers__reloadAssociatedPaymentRewardsBalance__block_invoke_16(uint64_t a1, void *a2)
{
  return [a2 type] == 2;
}

void __88__PKDashboardPaymentPassDataSource_PaymentOffers__reloadAssociatedPaymentRewardsBalance__block_invoke_2_20(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v6;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Error loading rewards balances, %@", buf, 0xCu);
    }
  }
  else
  {
    v8 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __88__PKDashboardPaymentPassDataSource_PaymentOffers__reloadAssociatedPaymentRewardsBalance__block_invoke_21;
    v10[3] = &unk_1E59CB010;
    objc_copyWeak(&v12, (id *)(a1 + 40));
    id v11 = v8;
    id v9 = v8;
    dispatch_async(MEMORY[0x1E4F14428], v10);

    objc_destroyWeak(&v12);
  }
}

void __88__PKDashboardPaymentPassDataSource_PaymentOffers__reloadAssociatedPaymentRewardsBalance__block_invoke_21(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setAssociatedPaymentRewardsBalance:*(void *)(a1 + 32)];

  id v4 = objc_loadWeakRetained(v2);
  [v4 _updateRewardsBalanceItem];
}

- (void)resetAssociatedPaymentRewardsBalanceIfNeeded
{
  if ([(PKDashboardPaymentPassDataSource *)self hasAssociatedPaymentRewardsBalance])
  {
    [(PKDashboardPaymentPassDataSource *)self setAssociatedPaymentRewardsBalance:0];
    [(PKDashboardPaymentPassDataSource *)self _updateRewardsBalanceItem];
  }
}

- (BOOL)_hasPassPersonalized
{
  id v2 = [(PKDashboardPaymentPassDataSource *)self pass];
  uint64_t v3 = [v2 devicePrimaryPaymentApplication];
  uint64_t v4 = [v3 state];

  return v4 == 1;
}

- (BOOL)_hasPassWithSupportedCardType
{
  id v2 = [(PKDashboardPaymentPassDataSource *)self pass];
  uint64_t v3 = [v2 secureElementPass];
  unint64_t v4 = [v3 cardType];

  return v4 < 2;
}

- (void)_updateRewardsBalanceItem
{
  unint64_t v3 = [(PKDashboardPaymentPassDataSource *)self firstSectionIndexForSectionIdentifier:4];
  id v5 = [(PKDashboardPaymentPassDataSource *)self delegate];
  unint64_t v4 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v3];
  [v5 reloadSections:v4];
}

- (void)_refreshTransactionsSection
{
  unint64_t v3 = [(PKDashboardPaymentPassDataSource *)self firstSectionIndexForSectionIdentifier:12];
  id v5 = [(PKDashboardPaymentPassDataSource *)self delegate];
  unint64_t v4 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v3];
  [v5 reloadSections:v4];
}

- (id)deviceTapAmountEntryViewControllerWithInitialAmount:(id)a3 initialMemo:(id)a4 dismissAction:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(PKDashboardPaymentPassDataSource *)self nearbyPeerPaymentViewProvider];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __133__PKDashboardPaymentPassDataSource_NearbyPeerPayment__deviceTapAmountEntryViewControllerWithInitialAmount_initialMemo_dismissAction___block_invoke;
  v15[3] = &unk_1E59CC440;
  id v16 = v8;
  id v12 = v8;
  uint64_t v13 = [v11 amountEntryViewWithInitialAmount:v10 initialMemo:v9 dismissAction:v15];

  [v13 setOverrideUserInterfaceStyle:2];

  return v13;
}

uint64_t __133__PKDashboardPaymentPassDataSource_NearbyPeerPayment__deviceTapAmountEntryViewControllerWithInitialAmount_initialMemo_dismissAction___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    unint64_t v3 = (void *)MEMORY[0x1E4F84E00];
    id v4 = a2;
    id v5 = [v3 sharedInstance];
    [v5 presentSenderFlowWithHost:0 userInfo:v4 completion:0];
  }
  id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v6();
}

- (unint64_t)numberOfAccounts
{
  id v2 = [(PKDashboardPaymentPassDataSource *)self accounts];
  unint64_t v3 = [v2 count];

  return v3;
}

- (void)reloadAccounts
{
  if ([(PKDashboardPaymentPassDataSource *)self _isCreditPass])
  {
    unint64_t v3 = [MEMORY[0x1E4F84270] sharedInstance];
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v5 = objc_alloc_init(MEMORY[0x1E4F84518]);
    BOOL v6 = [(PKDashboardPaymentPassDataSource *)self accountsLoaded];
    v48[0] = 0;
    v48[1] = v48;
    v48[2] = 0x2020000000;
    char v49 = 0;
    v46[0] = 0;
    v46[1] = v46;
    v46[2] = 0x2020000000;
    char v47 = 0;
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__PKDashboardPaymentPassDataSource_Accounts__reloadAccounts__block_invoke;
    aBlock[3] = &unk_1E59D7820;
    id v7 = v5;
    id v40 = v7;
    id v8 = v3;
    id v41 = v8;
    id v19 = &v44;
    objc_copyWeak(&v44, &location);
    uint64_t v43 = v46;
    id v9 = v4;
    id v42 = v9;
    id v10 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __60__PKDashboardPaymentPassDataSource_Accounts__reloadAccounts__block_invoke_4;
    v33[3] = &unk_1E59D7898;
    id v11 = v7;
    id v34 = v11;
    id v12 = v9;
    id v35 = v12;
    id v36 = self;
    id v13 = v8;
    id v37 = v13;
    objc_copyWeak(&v38, &location);
    id v14 = (void (**)(void *, uint64_t))_Block_copy(v33);
    v10[2](v10, 5);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __60__PKDashboardPaymentPassDataSource_Accounts__reloadAccounts__block_invoke_29;
    v30[3] = &unk_1E59CEB60;
    objc_copyWeak(&v32, &location);
    id v15 = v12;
    id v31 = v15;
    [v11 addOperation:v30];
    v14[2](v14, 5);
    if (!v6)
    {
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __60__PKDashboardPaymentPassDataSource_Accounts__reloadAccounts__block_invoke_3_32;
      v25[3] = &unk_1E59D7960;
      objc_copyWeak(&v29, &location);
      v27 = v46;
      id v26 = v13;
      id v28 = v48;
      objc_msgSend(v11, "addOperation:", v25, &v44);

      objc_destroyWeak(&v29);
    }
    id v16 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v19);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __60__PKDashboardPaymentPassDataSource_Accounts__reloadAccounts__block_invoke_36;
    v21[3] = &unk_1E59D7910;
    objc_copyWeak(&v24, &location);
    id v17 = v15;
    id v22 = v17;
    v23 = v48;
    id v18 = (id)[v11 evaluateWithInput:v16 completion:v21];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v32);

    objc_destroyWeak(&v38);
    objc_destroyWeak(v20);

    objc_destroyWeak(&location);
    _Block_object_dispose(v46, 8);
    _Block_object_dispose(v48, 8);
  }
  else
  {
    [(PKDashboardPaymentPassDataSource *)self setAccountsLoaded:1];
    if (![(PKDashboardPaymentPassDataSource *)self allContentIsLoaded])
    {
      [(PKDashboardPaymentPassDataSource *)self updateContentIsLoaded];
    }
  }
}

void __60__PKDashboardPaymentPassDataSource_Accounts__reloadAccounts__block_invoke(uint64_t a1, void *a2)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__PKDashboardPaymentPassDataSource_Accounts__reloadAccounts__block_invoke_2;
  v7[3] = &unk_1E59D77F8;
  id v4 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  v10[1] = a2;
  objc_copyWeak(v10, (id *)(a1 + 64));
  long long v6 = *(_OWORD *)(a1 + 48);
  id v5 = (id)v6;
  long long v9 = v6;
  [v4 addOperation:v7];

  objc_destroyWeak(v10);
}

void __60__PKDashboardPaymentPassDataSource_Accounts__reloadAccounts__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *(void **)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 64);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __60__PKDashboardPaymentPassDataSource_Accounts__reloadAccounts__block_invoke_3;
  v15[3] = &unk_1E59D77D0;
  objc_copyWeak(&v20, (id *)(a1 + 56));
  id v12 = *(void **)(a1 + 40);
  uint64_t v19 = *(void *)(a1 + 48);
  id v16 = v12;
  id v13 = v9;
  id v18 = v13;
  id v14 = v8;
  id v17 = v14;
  [v10 defaultAccountForFeature:v11 completion:v15];

  objc_destroyWeak(&v20);
}

void __60__PKDashboardPaymentPassDataSource_Accounts__reloadAccounts__block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    if (v6) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
    if (objc_msgSend(WeakRetained, "_accountCanBePresented:")) {
      [*(id *)(a1 + 32) addObject:v6];
    }
    id v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v5();
}

void __60__PKDashboardPaymentPassDataSource_Accounts__reloadAccounts__block_invoke_4(uint64_t a1, void *a2)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__PKDashboardPaymentPassDataSource_Accounts__reloadAccounts__block_invoke_5;
  v8[3] = &unk_1E59D7870;
  id v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  v12[1] = a2;
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = *(void **)(a1 + 56);
  id v9 = v5;
  uint64_t v10 = v6;
  id v11 = v7;
  objc_copyWeak(v12, (id *)(a1 + 64));
  [v4 addOperation:v8];
  objc_destroyWeak(v12);
}

void __60__PKDashboardPaymentPassDataSource_Accounts__reloadAccounts__block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v27 = a2;
  id v7 = a3;
  id v8 = a4;
  id v28 = v7;
  if ([*(id *)(a1 + 32) count])
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v41 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v36 != v11) {
            objc_enumerationMutation(v9);
          }
          id v13 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          if ([v13 feature] == *(void *)(a1 + 64))
          {
            id v14 = [*(id *)(a1 + 40) context];
            int v15 = [v14 limitServerLoad];

            if (!v13) {
              goto LABEL_16;
            }
            double v16 = v15 ? 86400.0 : 300.0;
            id v17 = [MEMORY[0x1E4F1C9C8] date];
            id v18 = [v13 lastUpdated];
            [v17 timeIntervalSinceDate:v18];
            BOOL v20 = v19 > v16;

            if (v20)
            {
              v21 = PKLogFacilityTypeGetObject();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                id v22 = PKFeatureIdentifierToString();
                *(_DWORD *)buf = 138543362;
                id v40 = v22;
                _os_log_impl(&dword_19F450000, v21, OS_LOG_TYPE_DEFAULT, "Dashboard fetching updating %{public}@ account", buf, 0xCu);
              }
              v23 = *(void **)(a1 + 48);
              id v24 = [v13 accountIdentifier];
              v29[0] = MEMORY[0x1E4F143A8];
              v29[1] = 3221225472;
              v29[2] = __60__PKDashboardPaymentPassDataSource_Accounts__reloadAccounts__block_invoke_28;
              v29[3] = &unk_1E59D7848;
              objc_copyWeak(v34, (id *)(a1 + 56));
              v34[1] = *(id *)(a1 + 64);
              id v30 = *(id *)(a1 + 32);
              id v31 = v13;
              id v33 = v8;
              id v32 = v28;
              [v23 updateAccountWithIdentifier:v24 extended:0 completion:v29];

              objc_destroyWeak(v34);
            }
            else
            {
LABEL_16:
              v25 = PKLogFacilityTypeGetObject();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                id v26 = PKFeatureIdentifierToString();
                *(_DWORD *)buf = 138543362;
                id v40 = v26;
                _os_log_impl(&dword_19F450000, v25, OS_LOG_TYPE_DEFAULT, "Dashboard not updating %{public}@ account", buf, 0xCu);
              }
              (*((void (**)(id, void *, void))v8 + 2))(v8, v28, 0);
            }
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v41 count:16];
      }
      while (v10);
    }
  }
  else
  {
    (*((void (**)(id, id, void))v8 + 2))(v8, v7, 0);
  }
}

void __60__PKDashboardPaymentPassDataSource_Accounts__reloadAccounts__block_invoke_28(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = PKFeatureIdentifierToString();
      int v13 = 138543618;
      id v14 = v9;
      __int16 v15 = 2114;
      id v16 = v6;
      _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Dashboard fetched updating %{public}@ account, with error %{public}@", (uint8_t *)&v13, 0x16u);
    }
    if (!v5 || v6)
    {
      if (v6)
      {
        uint64_t v11 = [WeakRetained accountUpdateError];

        if (!v11)
        {
          [v5 feature];
          id v12 = PKAccountDisplayableError();
          [WeakRetained setAccountUpdateError:v12];
        }
      }
    }
    else if ([WeakRetained _accountCanBePresented:v5])
    {
      [*(id *)(a1 + 32) removeObject:*(void *)(a1 + 40)];
      [*(id *)(a1 + 32) addObject:v5];
    }
    uint64_t v10 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  else
  {
    uint64_t v10 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  v10();
}

void __60__PKDashboardPaymentPassDataSource_Accounts__reloadAccounts__block_invoke_29(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__PKDashboardPaymentPassDataSource_Accounts__reloadAccounts__block_invoke_2_30;
  v11[3] = &unk_1E59D00B8;
  objc_copyWeak(&v15, (id *)(a1 + 40));
  id v8 = *(id *)(a1 + 32);
  id v13 = v6;
  id v14 = v7;
  id v12 = v8;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v11);

  objc_destroyWeak(&v15);
}

void __60__PKDashboardPaymentPassDataSource_Accounts__reloadAccounts__block_invoke_2_30(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v2 = (void *)[*(id *)(a1 + 32) copy];
    [WeakRetained _updateAccounts:v2];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __60__PKDashboardPaymentPassDataSource_Accounts__reloadAccounts__block_invoke_3_32(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v11 = WeakRetained;
  if (WeakRetained)
  {
    id v12 = [WeakRetained account];
    if ([v12 feature] == 2)
    {
      id v13 = [v12 creditDetails];
      if ([v13 rewardsDestination] == 3)
      {
        int v14 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);

        if (!v14)
        {
          if (PKCheckedForSavingsPresence())
          {
            v9[2](v9, v8, 0);
          }
          else
          {
            id v15 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19F450000, v15, OS_LOG_TYPE_DEFAULT, "Card account rewards destination is set to Savings, but no Savings account present, refreshing accounts", buf, 2u);
            }

            id v16 = *(void **)(a1 + 32);
            v17[0] = MEMORY[0x1E4F143A8];
            v17[1] = 3221225472;
            v17[2] = __60__PKDashboardPaymentPassDataSource_Accounts__reloadAccounts__block_invoke_33;
            v17[3] = &unk_1E59D78C0;
            objc_copyWeak(&v21, (id *)(a1 + 56));
            uint64_t v20 = *(void *)(a1 + 48);
            double v19 = v9;
            id v18 = v8;
            [v16 updateAccountsWithCompletion:v17];

            objc_destroyWeak(&v21);
          }
        }
      }
      else
      {
      }
    }
  }
  else
  {
    v9[2](v9, v8, 1);
  }
}

void __60__PKDashboardPaymentPassDataSource_Accounts__reloadAccounts__block_invoke_33(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Refreshed accounts after missing destination account, with error %@", (uint8_t *)&v9, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    PKSetCheckedForSavingsPresence();
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __60__PKDashboardPaymentPassDataSource_Accounts__reloadAccounts__block_invoke_36(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__PKDashboardPaymentPassDataSource_Accounts__reloadAccounts__block_invoke_2_37;
  block[3] = &unk_1E59D78E8;
  objc_copyWeak(&v7, (id *)(a1 + 48));
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = v2;
  uint64_t v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v7);
}

void __60__PKDashboardPaymentPassDataSource_Accounts__reloadAccounts__block_invoke_2_37(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v2 = (void *)[*(id *)(a1 + 32) copy];
    [WeakRetained _updateAccounts:v2];

    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      [WeakRetained reloadAccounts];
    }
  }
}

- (void)_updateAccounts:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v28 = self;
  id v5 = [(PKDashboardPaymentPassDataSource *)self accounts];
  uint64_t v6 = [v5 count];
  id v33 = v4;
  id v29 = v5;
  if (v6 == [v4 count])
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id obj = v5;
    uint64_t v32 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v32)
    {
      uint64_t v31 = *(void *)v39;
      while (2)
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v39 != v31) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          id v9 = v33;
          uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v42 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v35;
LABEL_9:
            uint64_t v13 = 0;
            while (1)
            {
              if (*(void *)v35 != v12) {
                objc_enumerationMutation(v9);
              }
              int v14 = *(void **)(*((void *)&v34 + 1) + 8 * v13);
              id v15 = [v14 accountIdentifier];
              id v16 = [v8 accountIdentifier];
              id v17 = v15;
              id v18 = v16;
              if (v17 == v18) {
                break;
              }
              double v19 = v18;
              if (v17) {
                BOOL v20 = v18 == 0;
              }
              else {
                BOOL v20 = 1;
              }
              if (v20)
              {
              }
              else
              {
                char v21 = [v17 isEqualToString:v18];

                if (v21) {
                  goto LABEL_24;
                }
              }
              if (v11 == ++v13)
              {
                uint64_t v11 = [v9 countByEnumeratingWithState:&v34 objects:v42 count:16];
                if (v11) {
                  goto LABEL_9;
                }
                goto LABEL_22;
              }
            }

LABEL_24:
            char v22 = [v14 isContentEqualToAccount:v8];

            if (v22) {
              continue;
            }
            char v23 = 1;
            goto LABEL_30;
          }
LABEL_22:
        }
        uint64_t v32 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
        if (v32) {
          continue;
        }
        break;
      }
    }
    char v23 = 0;
LABEL_30:
  }
  else
  {
    char v23 = 1;
  }
  [(PKDashboardPaymentPassDataSource *)v28 setAccountsLoaded:1];
  [(PKDashboardPaymentPassDataSource *)v28 setAccounts:v33];
  if ([(PKDashboardPaymentPassDataSource *)v28 allContentIsLoaded])
  {
    id v24 = [(PKDashboardPaymentPassDataSource *)v28 delegate];
    char v25 = v23 ^ 1;
    if (!v24) {
      char v25 = 1;
    }
    if ((v25 & 1) == 0)
    {
      uint64_t v26 = [(PKDashboardPaymentPassDataSource *)v28 firstSectionIndexForSectionIdentifier:5];
      id v27 = (void *)[objc_alloc(MEMORY[0x1E4F28E60]) initWithIndex:v26];
      objc_msgSend(v27, "addIndex:", -[PKDashboardPaymentPassDataSource numberOfSections](v28, "numberOfSections") - 1);
      [v24 reloadSections:v27];
    }
  }
  else
  {
    [(PKDashboardPaymentPassDataSource *)v28 updateContentIsLoaded];
  }
}

- (id)accountItemAtIndex:(unint64_t)a3
{
  id v5 = [PKDashboardAccountItem alloc];
  uint64_t v6 = [(PKDashboardPaymentPassDataSource *)self accounts];
  id v7 = [v6 objectAtIndex:a3];
  id v8 = [(PKDashboardPaymentPassDataSource *)self pass];
  id v9 = [(PKDashboardAccountItem *)v5 initWithAccount:v7 presentingPass:v8];

  return v9;
}

- (id)messagesForSavingsAccountStatus
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(PKDashboardPaymentPassDataSource *)self account];
  uint64_t v5 = [v4 type];

  if (v5 == 1)
  {
    if (PKSavingsHasDismissedClosedAccountMessage() == 2)
    {
      uint64_t v6 = objc_alloc_init(PKDashboardPassMessage);
      [(PKDashboardPassMessage *)v6 setIdentifier:@"savingsAccountClosed"];
      id v7 = PKLocalizedFeatureString();
      [(PKDashboardPassMessage *)v6 setTitle:v7];

      id v8 = PKLocalizedFeatureString();
      [(PKDashboardPassMessage *)v6 setMessage:v8];

      id v9 = PKPassKitUIBundle();
      uint64_t v10 = [v9 URLForResource:@"Category_Statement" withExtension:@"pdf"];
      double v11 = PKUIScreenScale();
      uint64_t v12 = PKUIImageFromPDF(v10, 45.0, 45.0, v11);

      [(PKDashboardPassMessage *)v6 setImage:v12];
      objc_initWeak(&location, self);
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __77__PKDashboardPaymentPassDataSource_Accounts__messagesForSavingsAccountStatus__block_invoke;
      v23[3] = &unk_1E59CA7F8;
      objc_copyWeak(&v24, &location);
      [(PKDashboardPassMessage *)v6 setActionOnDismiss:v23];
      [v3 addObject:v6];
      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
    }
    if (PKSavingsHasDismissedPendingApplicationMessage() == 2)
    {
      uint64_t v13 = objc_alloc_init(PKDashboardPassMessage);
      [(PKDashboardPassMessage *)v13 setIdentifier:@"savingsApplicationPending"];
      int v14 = PKLocalizedFeatureString();
      [(PKDashboardPassMessage *)v13 setTitle:v14];

      id v15 = PKLocalizedFeatureString();
      [(PKDashboardPassMessage *)v13 setMessage:v15];

      id v16 = PKPassKitUIBundle();
      id v17 = [v16 URLForResource:@"SAVINGS_Icon" withExtension:@"pdf"];
      double v18 = PKUIScreenScale();
      double v19 = PKUIImageFromPDF(v17, 45.0, 45.0, v18);

      [(PKDashboardPassMessage *)v13 setImage:v19];
      objc_initWeak(&location, self);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __77__PKDashboardPaymentPassDataSource_Accounts__messagesForSavingsAccountStatus__block_invoke_2;
      v21[3] = &unk_1E59CA7F8;
      objc_copyWeak(&v22, &location);
      [(PKDashboardPassMessage *)v13 setActionOnDismiss:v21];
      [v3 addObject:v13];
      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }
  }

  return v3;
}

void __77__PKDashboardPaymentPassDataSource_Accounts__messagesForSavingsAccountStatus__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    PKSavingsSetHasDismissedClosedAccountMessage();
    [WeakRetained reloadMessages];
  }
}

void __77__PKDashboardPaymentPassDataSource_Accounts__messagesForSavingsAccountStatus__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    PKSavingsSetHasDismissedPendingApplicationMessage();
    [WeakRetained reloadMessages];
  }
}

- (void)messageForSavingsRewardsRedemptionWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKDashboardPaymentPassDataSource *)self account];
  uint64_t v6 = [v5 creditDetails];
  uint64_t v7 = [v6 rewardsDestination];

  if ([v5 type] == 1 && v7 == 3 && !PKSavingsHasDismissedFixRewardsMessage())
  {
    id v8 = [MEMORY[0x1E4F84270] sharedInstance];
    id v9 = [v5 accountIdentifier];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    id v10[2] = __95__PKDashboardPaymentPassDataSource_Accounts__messageForSavingsRewardsRedemptionWithCompletion___block_invoke;
    v10[3] = &unk_1E59D7938;
    void v10[4] = self;
    id v11 = v4;
    [v8 lastRedemptionEventToDestination:3 forAccountIdentifier:v9 altDSID:0 completion:v10];
  }
  else if (v4)
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

void __95__PKDashboardPaymentPassDataSource_Accounts__messageForSavingsRewardsRedemptionWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 items];
  id v8 = [v7 anyObject];

  if (!v8
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || ([v8 status],
        id v9 = (__CFString *)(id)objc_claimAutoreleasedReturnValue(),
        v9 == @"success")
    || (uint64_t v10 = v9) != 0
    && (int v11 = [(__CFString *)v9 isEqualToString:@"success"],
        v10,
        v10,
        v11))
  {
    uint64_t v12 = *(void *)(a1 + 40);
    if (v12) {
      (*(void (**)(uint64_t, void))(v12 + 16))(v12, 0);
    }
  }
  else
  {
    uint64_t v13 = [*(id *)(a1 + 32) _fetchOpenSavingsAccount];
    [v13 feature];
    if ([v13 state] == 2 || objc_msgSend(v13, "state") == 3)
    {
      uint64_t v14 = PKLocalizedFeatureString();
      uint64_t v15 = PKLocalizedFeatureString();
      id v16 = PKLocalizedFeatureString();
      id v17 = objc_alloc_init(PKDashboardPassMessage);
      char v25 = (void *)v14;
      [(PKDashboardPassMessage *)v17 setTitle:v14];
      id v24 = (void *)v15;
      [(PKDashboardPassMessage *)v17 setMessage:v15];
      [(PKDashboardPassMessage *)v17 setButtonTitle:v16];
      [(PKDashboardPassMessage *)v17 setIdentifier:@"savingsFixRewards"];
      double v18 = PKPassKitUIBundle();
      double v19 = [v18 URLForResource:@"CashBackIcon" withExtension:@"pdf"];
      double v20 = PKUIScreenScale();
      char v21 = PKUIImageFromPDF(v19, 45.0, 45.0, v20);
      [(PKDashboardPassMessage *)v17 setImage:v21];

      [(PKDashboardPassMessage *)v17 setShowDisclosure:1];
      objc_initWeak(&location, *(id *)(a1 + 32));
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __95__PKDashboardPaymentPassDataSource_Accounts__messageForSavingsRewardsRedemptionWithCompletion___block_invoke_2;
      v29[3] = &unk_1E59CA7F8;
      objc_copyWeak(&v30, &location);
      [(PKDashboardPassMessage *)v17 setActionOnDismiss:v29];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __95__PKDashboardPaymentPassDataSource_Accounts__messageForSavingsRewardsRedemptionWithCompletion___block_invoke_3;
      v26[3] = &unk_1E59CB010;
      objc_copyWeak(&v28, &location);
      id v27 = v13;
      [(PKDashboardPassMessage *)v17 setActionOnButtonPress:v26];
      uint64_t v22 = *(void *)(a1 + 40);
      if (v22) {
        (*(void (**)(uint64_t, PKDashboardPassMessage *))(v22 + 16))(v22, v17);
      }

      objc_destroyWeak(&v28);
      objc_destroyWeak(&v30);
      objc_destroyWeak(&location);
    }
    else
    {
      uint64_t v23 = *(void *)(a1 + 40);
      if (v23) {
        (*(void (**)(uint64_t, void))(v23 + 16))(v23, 0);
      }
    }
  }
}

void __95__PKDashboardPaymentPassDataSource_Accounts__messageForSavingsRewardsRedemptionWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    PKSavingsSetHasDismissedFixRewardsMessage();
    [WeakRetained reloadMessages];
  }
}

void __95__PKDashboardPaymentPassDataSource_Accounts__messageForSavingsRewardsRedemptionWithCompletion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v2 = (void *)[objc_alloc(MEMORY[0x1E4F84290]) initWithOtherTopicForAccount:*(void *)(a1 + 32)];
    id v3 = objc_alloc_init(PKBusinessChatController);
    id v4 = [[PKBusinessChatAccountContext alloc] initWithAccount:*(void *)(a1 + 32) topic:v2];
    [(PKBusinessChatController *)v3 openBusinessChatWithContext:v4 completion:0];
    PKSavingsSetHasDismissedFixRewardsMessage();
    [WeakRetained reloadMessages];
  }
}

- (id)messageForSavingsAccountFDIC
{
  id v3 = [(PKDashboardPaymentPassDataSource *)self _fetchOpenSavingsAccount];
  id v4 = [v3 accountIdentifier];
  id v5 = [(PKDashboardPaymentPassDataSource *)self account];
  uint64_t v6 = [v5 type];
  if (v3 && v6 == 1)
  {
    uint64_t HasDismissedFDICMessage = PKSavingsHasDismissedFDICMessage();

    if (HasDismissedFDICMessage != 1)
    {
      id v8 = objc_alloc_init(PKDashboardPassMessage);
      [(PKDashboardPassMessage *)v8 setIdentifier:@"savingsFDIC"];
      id v9 = PKLocalizedFeatureString();
      [(PKDashboardPassMessage *)v8 setTitle:v9];

      uint64_t v10 = PKLocalizedFeatureString();
      [(PKDashboardPassMessage *)v8 setMessage:v10];

      int v11 = PKLocalizedFeatureString();
      [(PKDashboardPassMessage *)v8 setButtonTitle:v11];

      uint64_t v12 = PKPassKitUIBundle();
      uint64_t v13 = [v12 URLForResource:@"SAVINGS_Icon" withExtension:@"pdf"];
      double v14 = PKUIScreenScale();
      uint64_t v15 = PKUIImageFromPDF(v13, 45.0, 45.0, v14);
      [(PKDashboardPassMessage *)v8 setImage:v15];

      objc_initWeak(&location, self);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __74__PKDashboardPaymentPassDataSource_Accounts__messageForSavingsAccountFDIC__block_invoke;
      v17[3] = &unk_1E59CB010;
      objc_copyWeak(&v19, &location);
      id v18 = v4;
      [(PKDashboardPassMessage *)v8 setActionOnDismiss:v17];
      [(PKDashboardPassMessage *)v8 setActionOnButtonPress:&__block_literal_global_132];

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
      goto LABEL_7;
    }
  }
  else
  {
  }
  id v8 = 0;
LABEL_7:

  return v8;
}

void __74__PKDashboardPaymentPassDataSource_Accounts__messageForSavingsAccountFDIC__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    PKSavingsSetHasDismissedFDICMessage();
    [WeakRetained reloadMessages];
  }
}

void __74__PKDashboardPaymentPassDataSource_Accounts__messageForSavingsAccountFDIC__block_invoke_2()
{
  [MEMORY[0x1E4F1CB10] URLWithString:@"https://support.apple.com/ht213451?cid=mc-ols-applecard-article_ht213451-wallet_ui-09142022"];
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v0 openSensitiveURL:v1 withOptions:0];
}

- (id)_fetchOpenSavingsAccount
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [(PKDashboardPaymentPassDataSource *)self accounts];
  id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v6 type] == 4 && (unint64_t)(objc_msgSend(v6, "state") - 1) < 3)
        {
          id v3 = v6;
          goto LABEL_12;
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v3;
}

- (BOOL)_accountCanBePresented:(id)a3
{
  return (unint64_t)([a3 state] - 1) < 3;
}

- (unint64_t)numberOfUpcomingRecurringPeerPayments
{
  if (![(PKDashboardPaymentPassDataSource *)self canShowPeerPaymentRecurringPayments])return 0; {
  id v3 = [(PKDashboardPaymentPassDataSource *)self upcomingRecurringPeerPayments];
  }
  unint64_t v4 = [v3 count];

  return v4;
}

- (id)upcomingRecurringPeerPaymentItemAtIndex:(unint64_t)a3
{
  id v5 = [(PKDashboardPaymentPassDataSource *)self upcomingRecurringPeerPayments];
  unint64_t v6 = [v5 count];

  if (v6 <= a3)
  {
    long long v9 = 0;
  }
  else
  {
    uint64_t v7 = [(PKDashboardPaymentPassDataSource *)self upcomingRecurringPeerPayments];
    long long v8 = [v7 objectAtIndex:a3];
    long long v9 = [(PKDashboardPaymentPassDataSource *)self paymentTransactionItemForPayment:v8];
  }

  return v9;
}

- (id)paymentTransactionItemForPayment:(id)a3
{
  unint64_t v4 = PKPeerPaymentTransactionForUpcomingRecurringPayment();
  id v5 = [(PKDashboardPaymentPassDataSource *)self paymentTransactionItemForTransaction:v4];

  return v5;
}

- (void)_updateCanShowPeerPaymentRecurringPayments:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PKDashboardPaymentPassDataSource *)self peerPaymentAccount];
  uint64_t v6 = [v5 state];

  if ([(PKDashboardPaymentPassDataSource *)self _isPeerPaymentPass])
  {
    uint64_t v7 = [(PKDashboardPaymentPassDataSource *)self pass];
    if ([v7 activationState]) {
      BOOL v8 = 1;
    }
    else {
      BOOL v8 = (unint64_t)(v6 - 1) >= 2;
    }
    uint64_t v9 = !v8;
  }
  else
  {
    uint64_t v9 = 0;
  }
  if ([(PKDashboardPaymentPassDataSource *)self allContentIsLoaded])
  {
    int v10 = [(PKDashboardPaymentPassDataSource *)self canShowPeerPaymentRecurringPayments];
    [(PKDashboardPaymentPassDataSource *)self setCanShowPeerPaymentRecurringPayments:v9];
    if (v3 && v9 != v10)
    {
      unint64_t v11 = [(PKDashboardPaymentPassDataSource *)self firstSectionIndexForSectionIdentifier:11];
      id v13 = (id)[objc_alloc(MEMORY[0x1E4F28D60]) initWithIndex:v11];
      uint64_t v12 = [(PKDashboardPaymentPassDataSource *)self delegate];
      [v12 reloadSections:v13];
    }
  }
  else
  {
    [(PKDashboardPaymentPassDataSource *)self setCanShowPeerPaymentRecurringPayments:v9];
  }
}

- (void)reloadRecurringPeerPaymentsWithCompletion:(id)a3
{
  unint64_t v4 = (void (**)(void))a3;
  [(PKDashboardPaymentPassDataSource *)self _updateCanShowPeerPaymentRecurringPayments:1];
  if ([(PKDashboardPaymentPassDataSource *)self canShowPeerPaymentRecurringPayments])
  {
    objc_initWeak(&location, self);
    id v5 = [MEMORY[0x1E4F84E00] sharedInstance];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __100__PKDashboardPaymentPassDataSource_RecurringPeerPayment__reloadRecurringPeerPaymentsWithCompletion___block_invoke;
    v6[3] = &unk_1E59D3B08;
    objc_copyWeak(&v8, &location);
    v6[4] = self;
    uint64_t v7 = v4;
    [v5 recurringPaymentsWithCompletion:v6];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  else
  {
    [(PKDashboardPaymentPassDataSource *)self setRecurringPeerPaymentsLoaded:1];
    [(PKDashboardPaymentPassDataSource *)self updateContentIsLoaded];
    if (v4) {
      v4[2](v4);
    }
  }
}

void __100__PKDashboardPaymentPassDataSource_RecurringPeerPayment__reloadRecurringPeerPaymentsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v27 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v23 = a1;
    from = (id *)(a1 + 48);
    id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v54[0] = 0;
    v54[1] = v54;
    v54[2] = 0x3032000000;
    v54[3] = __Block_byref_object_copy__40;
    v54[4] = __Block_byref_object_dispose__40;
    id v55 = 0;
    char v25 = WeakRetained;
    unint64_t v4 = [WeakRetained peerPaymentAccount];
    uint64_t v26 = [v4 recurringPaymentsFeatureDescriptor];

    id v5 = [v26 productTimeZone];
    if (v5)
    {
      id v6 = objc_alloc(MEMORY[0x1E4F1C9A8]);
      uint64_t v7 = (void *)[v6 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
      [v7 setTimeZone:v5];
      id v8 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v9 = [v7 components:30 fromDate:v8];

      uint64_t v31 = [v7 dateFromComponents:v9];
      id v10 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
      [v10 setDay:3];
      [v10 setSecond:1];
      id v28 = [v7 dateByAddingComponents:v10 toDate:v31 options:0];
    }
    else
    {
      uint64_t v31 = 0;
      id v28 = 0;
    }
    id v32 = objc_alloc_init(MEMORY[0x1E4F84518]);
    v52[0] = 0;
    v52[1] = v52;
    v52[2] = 0x3032000000;
    v52[3] = __Block_byref_object_copy__40;
    v52[4] = __Block_byref_object_dispose__40;
    id v53 = 0;
    unint64_t v11 = [v25 transactionSourceCollection];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v12 = v27;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v48 objects:v56 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v49 != v14) {
            objc_enumerationMutation(v12);
          }
          uint64_t v16 = *(void *)(*((void *)&v48 + 1) + 8 * i);
          v40[0] = MEMORY[0x1E4F143A8];
          v40[1] = 3221225472;
          v40[2] = __100__PKDashboardPaymentPassDataSource_RecurringPeerPayment__reloadRecurringPeerPaymentsWithCompletion___block_invoke_16;
          v40[3] = &unk_1E59D9310;
          v40[4] = v16;
          id v41 = v30;
          id v42 = v28;
          id v43 = v31;
          id v46 = v52;
          id v44 = v11;
          id v45 = v29;
          char v47 = v54;
          [v32 addOperation:v40];
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v48 objects:v56 count:16];
      }
      while (v13);
    }

    id v17 = [MEMORY[0x1E4F1CA98] null];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __100__PKDashboardPaymentPassDataSource_RecurringPeerPayment__reloadRecurringPeerPaymentsWithCompletion___block_invoke_2;
    v33[3] = &unk_1E59D9380;
    id v18 = v29;
    id v34 = v18;
    objc_copyWeak(&v39, from);
    id v19 = v30;
    long long v38 = v54;
    uint64_t v20 = *(void *)(v23 + 32);
    char v21 = *(void **)(v23 + 40);
    id v35 = v19;
    uint64_t v36 = v20;
    id v37 = v21;
    id v22 = (id)[v32 evaluateWithInput:v17 completion:v33];

    objc_destroyWeak(&v39);
    _Block_object_dispose(v52, 8);

    _Block_object_dispose(v54, 8);
    id WeakRetained = v25;
  }
}

void __100__PKDashboardPaymentPassDataSource_RecurringPeerPayment__reloadRecurringPeerPaymentsWithCompletion___block_invoke_16(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  uint64_t v7 = a4;
  id v8 = [*(id *)(a1 + 32) upcomingPaymentDates];
  uint64_t v9 = [v8 firstObject];

  uint64_t v10 = [*(id *)(a1 + 32) type];
  int v11 = [*(id *)(a1 + 32) sentByMe];
  if (v10 != 1 || v11 == 0)
  {
    if (v10 == 3) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), *(id *)(a1 + 32));
    }
    goto LABEL_13;
  }
  [*(id *)(a1 + 40) addObject:*(void *)(a1 + 32)];
  if (!v9
    || (uint64_t v13 = *(void **)(a1 + 48)) == 0
    || [v13 compare:v9] == -1
    || (uint64_t v14 = *(void **)(a1 + 56)) == 0
    || [v14 compare:v9] == 1)
  {
LABEL_13:
    v7[2](v7, v6, 0);
    goto LABEL_14;
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40))
  {
    id v15 = objc_alloc_init(MEMORY[0x1E4F84A88]);
    uint64_t v16 = *(void *)(*(void *)(a1 + 80) + 8);
    id v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;
  }
  id v18 = objc_alloc_init(MEMORY[0x1E4F84D28]);
  [v18 setTransactionTypes:&unk_1EF2BA0F8];
  [v18 setStartDate:*(void *)(a1 + 56)];
  id v19 = [MEMORY[0x1E4F1C9C8] date];
  [v18 setEndDate:v19];

  uint64_t v20 = [*(id *)(a1 + 64) transactionSourceIdentifiers];
  [v18 setTransactionSourceIdentifiers:v20];

  char v21 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __100__PKDashboardPaymentPassDataSource_RecurringPeerPayment__reloadRecurringPeerPaymentsWithCompletion___block_invoke_20;
  v22[3] = &unk_1E59D92E8;
  v22[4] = *(void *)(a1 + 32);
  id v23 = v9;
  id v24 = *(id *)(a1 + 56);
  id v25 = *(id *)(a1 + 72);
  id v27 = v7;
  id v26 = v6;
  [v21 transactionsForRequest:v18 completion:v22];

LABEL_14:
}

void __100__PKDashboardPaymentPassDataSource_RecurringPeerPayment__reloadRecurringPeerPaymentsWithCompletion___block_invoke_20(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v16 != v6) {
        objc_enumerationMutation(v3);
      }
      id v8 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v7), "referenceIdentifier", (void)v15);
      uint64_t v9 = [*(id *)(a1 + 32) identifier];
      id v10 = v8;
      id v11 = v9;
      if (v10 == v11) {
        break;
      }
      id v12 = v11;
      if (v10) {
        BOOL v13 = v11 == 0;
      }
      else {
        BOOL v13 = 1;
      }
      if (v13)
      {
      }
      else
      {
        char v14 = [v10 isEqualToString:v11];

        if (v14) {
          goto LABEL_18;
        }
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_16;
      }
    }

LABEL_18:
    if (PKEqualObjects()) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_16:
  }
  objc_msgSend(*(id *)(a1 + 56), "addObject:", *(void *)(a1 + 32), (void)v15);
LABEL_20:
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

void __100__PKDashboardPaymentPassDataSource_RecurringPeerPayment__reloadRecurringPeerPaymentsWithCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) sortUsingComparator:&__block_literal_global_158];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __100__PKDashboardPaymentPassDataSource_RecurringPeerPayment__reloadRecurringPeerPaymentsWithCompletion___block_invoke_4;
  v7[3] = &unk_1E59D9358;
  objc_copyWeak(&v13, (id *)(a1 + 72));
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 64);
  id v8 = v2;
  uint64_t v12 = v3;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void **)(a1 + 56);
  id v9 = v4;
  uint64_t v10 = v5;
  id v11 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v7);

  objc_destroyWeak(&v13);
}

uint64_t __100__PKDashboardPaymentPassDataSource_RecurringPeerPayment__reloadRecurringPeerPaymentsWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 upcomingPaymentDates];
  uint64_t v6 = [v5 firstObject];
  uint64_t v7 = [v4 upcomingPaymentDates];

  id v8 = [v7 firstObject];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

void __100__PKDashboardPaymentPassDataSource_RecurringPeerPayment__reloadRecurringPeerPaymentsWithCompletion___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v10 = WeakRetained;
    [WeakRetained _updateCanShowPeerPaymentRecurringPayments:0];
    [v10 setRecurringPeerPaymentsLoaded:1];
    id v4 = (void *)[*(id *)(a1 + 32) copy];
    [v10 setRecurringPeerPayments:v4];

    [v10 setPeerPaymentThresholdTopUp:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
    uint64_t v5 = (void *)[*(id *)(a1 + 40) copy];
    [v10 setUpcomingRecurringPeerPayments:v5];

    if ([v10 allContentIsLoaded])
    {
      uint64_t v6 = [v10 delegate];
      if (v6)
      {
        uint64_t v7 = [*(id *)(a1 + 48) firstSectionIndexForSectionIdentifier:11];
        id v8 = (void *)[objc_alloc(MEMORY[0x1E4F28E60]) initWithIndex:v7];
        objc_msgSend(v8, "addIndex:", objc_msgSend(*(id *)(a1 + 48), "firstSectionIndexForSectionIdentifier:", 2));
        [v6 reloadSections:v8];
      }
    }
    else
    {
      [v10 updateContentIsLoaded];
    }
    uint64_t v3 = v10;
    uint64_t v9 = *(void *)(a1 + 56);
    if (v9)
    {
      (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
      uint64_t v3 = v10;
    }
  }
}

- (id)recurringPaymentDashboardMessages
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  if ([(PKDashboardPaymentPassDataSource *)self canShowPeerPaymentRecurringPayments])
  {
    id v38 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    val = self;
    id obj = [(PKDashboardPaymentPassDataSource *)self recurringPeerPayments];
    uint64_t v42 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
    if (v42)
    {
      uint64_t v41 = *(void *)v57;
      id v37 = v51;
      do
      {
        for (uint64_t i = 0; i != v42; ++i)
        {
          if (*(void *)v57 != v41) {
            objc_enumerationMutation(obj);
          }
          id v4 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          uint64_t v5 = [v4 lastExecutedTransaction];
          if (([v4 status] == 3 || objc_msgSend(v4, "status") == 4)
            && [v5 status] == 3
            && ([v4 lastExecutedTransactionAppearsInHistory] & 1) == 0)
          {
            uint64_t v6 = [(PKDashboardPaymentPassDataSource *)val _messageIdentifierForRecurringPayment:v4];
            if ((PKPeerPaymentRecurringPaymentHasDismissedMessageForMessageIdentifier() & 1) == 0)
            {
              uint64_t v7 = objc_alloc_init(PKDashboardPassMessage);
              [(PKDashboardPassMessage *)v7 setType:0];
              [(PKDashboardPassMessage *)v7 setIdentifier:v6];
              id v8 = PKLocalizedPeerPaymentRecurringString(&cfstr_PaymentErrorPr.isa);
              [(PKDashboardPassMessage *)v7 setTitle:v8];

              uint64_t v9 = [v5 executionDate];
              uint64_t v10 = [(PKDashboardPaymentPassDataSource *)val _formattedDateStringForDate:v9];
              id v11 = [v4 recipientAddress];
              uint64_t v12 = [(PKDashboardPaymentPassDataSource *)val _recipientNameForAddress:v11];
              id v13 = PKLocalizedPeerPaymentRecurringString(&cfstr_PaymentErrorDa.isa, &stru_1EF1B5770.isa, v10, v12, v37);
              [(PKDashboardPassMessage *)v7 setMessage:v13];

              char v14 = PKLocalizedPeerPaymentRecurringString(&cfstr_PaymentErrorAc.isa);
              [(PKDashboardPassMessage *)v7 setButtonTitle:v14];

              long long v15 = PKPassKitUIBundle();
              long long v16 = [v15 URLForResource:@"MessageAlert" withExtension:@"pdf"];
              double v17 = PKUIScreenScale();
              long long v18 = PKUIImageFromPDF(v16, 45.0, 45.0, v17);
              [(PKDashboardPassMessage *)v7 setImage:v18];
              objc_initWeak(&location, val);
              v53[0] = MEMORY[0x1E4F143A8];
              v53[1] = 3221225472;
              v53[2] = __91__PKDashboardPaymentPassDataSource_RecurringPeerPayment__recurringPaymentDashboardMessages__block_invoke;
              v53[3] = &unk_1E59CB010;
              objc_copyWeak(&v54, &location);
              v53[4] = v4;
              [(PKDashboardPassMessage *)v7 setActionOnButtonPress:v53];
              v50[0] = MEMORY[0x1E4F143A8];
              v50[1] = 3221225472;
              v51[0] = __91__PKDashboardPaymentPassDataSource_RecurringPeerPayment__recurringPaymentDashboardMessages__block_invoke_2;
              v51[1] = &unk_1E59CB010;
              objc_copyWeak(&v52, &location);
              v51[2] = v4;
              [(PKDashboardPassMessage *)v7 setActionOnDismiss:v50];
              [v38 addObject:v7];
              objc_destroyWeak(&v52);
              objc_destroyWeak(&v54);
              objc_destroyWeak(&location);
            }
          }
        }
        uint64_t v42 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
      }
      while (v42);
    }

    id v19 = [(PKDashboardPaymentPassDataSource *)val peerPaymentThresholdTopUp];
    uint64_t v20 = v19;
    if (v19)
    {
      char v21 = [v19 lastExecutedTransaction];
      id v22 = [(PKDashboardPaymentPassDataSource *)val _messageIdentifierForRecurringPayment:v20];
      id v23 = (char *)[v20 status];
      if ([v21 status] == 3
        && (unint64_t)(v23 - 3) <= 1
        && (PKPeerPaymentRecurringPaymentHasDismissedMessageForMessageIdentifier() & 1) == 0)
      {
        id v24 = objc_alloc_init(PKDashboardPassMessage);
        [(PKDashboardPassMessage *)v24 setType:0];
        [(PKDashboardPassMessage *)v24 setIdentifier:v22];
        objc_initWeak(&location, val);
        if (v23 == (char *)4)
        {
          id v25 = PKLocalizedPeerPaymentRecurringString(&cfstr_AutoReloadErro.isa);
          [(PKDashboardPassMessage *)v24 setTitle:v25];

          id v26 = PKLocalizedPeerPaymentRecurringString(&cfstr_AutoReloadErro_0.isa);
          [(PKDashboardPassMessage *)v24 setMessage:v26];
        }
        else
        {
          uint64_t v28 = [v21 errorCode];
          id v29 = [(PKDashboardPaymentPassDataSource *)val _titleForErrorCode:v28];
          [(PKDashboardPassMessage *)v24 setTitle:v29];

          id v30 = [(PKDashboardPaymentPassDataSource *)val _messageForErrorCode:v28];
          [(PKDashboardPassMessage *)v24 setMessage:v30];

          v47[0] = MEMORY[0x1E4F143A8];
          v47[1] = 3221225472;
          v47[2] = __91__PKDashboardPaymentPassDataSource_RecurringPeerPayment__recurringPaymentDashboardMessages__block_invoke_3;
          v47[3] = &unk_1E59CB010;
          objc_copyWeak(&v49, &location);
          id v48 = v20;
          [(PKDashboardPassMessage *)v24 setActionOnDismiss:v47];

          objc_destroyWeak(&v49);
        }
        uint64_t v31 = PKPassKitUIBundle();
        id v32 = [v31 URLForResource:@"MessageAlert" withExtension:@"pdf"];
        double v33 = PKUIScreenScale();
        id v34 = PKUIImageFromPDF(v32, 45.0, 45.0, v33);
        [(PKDashboardPassMessage *)v24 setImage:v34];
        if ([v21 exceedsAppleCashLimits]) {
          PKLocalizedPeerPaymentRecurringString(&cfstr_PaymentErrorLe.isa);
        }
        else {
        id v35 = PKLocalizedPeerPaymentRecurringString(&cfstr_AutoReloadErro_5.isa);
        }
        [(PKDashboardPassMessage *)v24 setButtonTitle:v35];

        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __91__PKDashboardPaymentPassDataSource_RecurringPeerPayment__recurringPaymentDashboardMessages__block_invoke_4;
        v43[3] = &unk_1E59CE838;
        objc_copyWeak(v46, &location);
        id v44 = v21;
        v46[1] = v23;
        id v45 = v20;
        [(PKDashboardPassMessage *)v24 setActionOnButtonPress:v43];
        [v38 addObject:v24];

        objc_destroyWeak(v46);
        objc_destroyWeak(&location);
      }
    }
    id v27 = (void *)[v38 copy];
  }
  else
  {
    id v27 = 0;
  }

  return v27;
}

void __91__PKDashboardPaymentPassDataSource_RecurringPeerPayment__recurringPaymentDashboardMessages__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _presentDetailsForRecurringPayment:*(void *)(a1 + 32)];
    [v3 _dismissMessageForRecurringPayment:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

void __91__PKDashboardPaymentPassDataSource_RecurringPeerPayment__recurringPaymentDashboardMessages__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _dismissMessageForRecurringPayment:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

void __91__PKDashboardPaymentPassDataSource_RecurringPeerPayment__recurringPaymentDashboardMessages__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _dismissMessageForRecurringPayment:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

void __91__PKDashboardPaymentPassDataSource_RecurringPeerPayment__recurringPaymentDashboardMessages__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    id v3 = [WeakRetained groupView];
    id v4 = objc_msgSend(v3, "pkui_viewControllerFromResponderChain");
    uint64_t v5 = [v4 navigationController];

    if ([*(id *)(a1 + 32) exceedsAppleCashLimits])
    {
      uint64_t v6 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      uint64_t v7 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://support.apple.com/en-us/HT207884"];
      [v6 openURL:v7 configuration:0 completionHandler:0];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v5 presentPassDetailsAnimated:1 action:9];
      }
    }
    if (*(void *)(a1 + 56) != 4) {
      [v8 _dismissMessageForRecurringPayment:*(void *)(a1 + 40)];
    }

    id WeakRetained = v8;
  }
}

- (id)_titleForErrorCode:(unint64_t)a3
{
  return (id)PKLocalizedPeerPaymentRecurringString(&cfstr_AutoReloadErro_1.isa);
}

- (id)_messageForErrorCode:(unint64_t)a3
{
  id v3 = @"AUTO_RELOAD_ERROR_PROBLEM_MESSAGE_CUMULATIVE_LIMIT";
  if (a3 - 40305 > 1) {
    id v3 = @"AUTO_RELOAD_ERROR_PROBLEM_MESSAGE_PAYMENT_METHOD";
  }
  if (a3 - 40340 >= 4) {
    id v4 = v3;
  }
  else {
    id v4 = @"AUTO_RELOAD_ERROR_PROBLEM_MESSAGE_FRAUD";
  }
  uint64_t v5 = PKLocalizedPeerPaymentRecurringString(&v4->isa);

  return v5;
}

- (id)_messageIdentifierForRecurringPayment:(id)a3
{
  id v3 = a3;
  id v4 = [v3 lastExecutedTransaction];
  if (v4)
  {
    uint64_t v5 = NSString;
    uint64_t v6 = [v3 identifier];

    uint64_t v7 = [v4 identifier];
    id v8 = [v5 stringWithFormat:@"%@-%@", v6, v7];

    id v3 = (id)v6;
  }
  else
  {
    id v8 = [v3 identifier];
  }

  return v8;
}

- (id)_formattedDateStringForDate:(id)a3
{
  uint64_t v3 = qword_1EB545C98;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_1EB545C98, &__block_literal_global_83_0);
  }
  uint64_t v5 = [(id)_MergedGlobals_686 stringFromDate:v4];

  return v5;
}

uint64_t __86__PKDashboardPaymentPassDataSource_RecurringPeerPayment___formattedDateStringForDate___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  id v1 = (void *)_MergedGlobals_686;
  _MergedGlobals_686 = (uint64_t)v0;

  [(id)_MergedGlobals_686 setLocalizedDateFormatFromTemplate:@"MMM d"];
  id v2 = (void *)_MergedGlobals_686;

  return [v2 setFormattingContext:5];
}

- (id)_recipientNameForAddress:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F1B980];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  uint64_t v6 = [MEMORY[0x1E4F84D88] requiredContactKeys];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F845E8]) initWithContactStore:v5 keysToFetch:v6];
  id v8 = [v7 contactForHandle:v4];
  uint64_t v9 = [MEMORY[0x1E4F84D88] displayNameForCounterpartHandle:v4 contact:v8];

  return v9;
}

- (void)_presentDetailsForRecurringPayment:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F84D80];
  id v5 = a3;
  id v6 = [v4 alloc];
  uint64_t v7 = [MEMORY[0x1E4F84E10] sharedService];
  id v19 = (id)[v6 initWithPeerPaymentWebService:v7];

  id v8 = [v19 account];
  uint64_t v9 = [v8 recurringPaymentsFeatureDescriptor];
  uint64_t v10 = [PKPeerPaymentRecurringPaymentDetailViewController alloc];
  id v11 = [v5 recipientAddress];
  uint64_t v12 = [(PKPeerPaymentRecurringPaymentDetailViewController *)v10 initWithRecurringPayment:v5 recipientAddress:v11 mode:2 context:0 peerPaymentController:v19 remoteMessagesComposer:0];

  id v13 = [v9 minimumAmount];
  [(PKPeerPaymentRecurringPaymentDetailViewController *)v12 setMinimumAmount:v13];

  char v14 = [v9 maximumAmount];
  [(PKPeerPaymentRecurringPaymentDetailViewController *)v12 setMaximumAmount:v14];

  [(PKPeerPaymentRecurringPaymentDetailViewController *)v12 setShowCancelButton:1];
  long long v15 = [(PKDashboardPaymentPassDataSource *)self groupView];
  long long v16 = objc_msgSend(v15, "pkui_viewControllerFromResponderChain");
  double v17 = [v16 navigationController];

  long long v18 = [[PKNavigationController alloc] initWithRootViewController:v12];
  [v17 presentViewController:v18 animated:1 completion:0];
}

- (void)_dismissMessageForRecurringPayment:(id)a3
{
  id v4 = [(PKDashboardPaymentPassDataSource *)self _messageIdentifierForRecurringPayment:a3];
  PKPeerPaymentRecurringPaymentAddDismissedMessageForMessageIdentifier();
  [(PKDashboardPaymentPassDataSource *)self reloadMessages];
}

- (id)payLaterAccountItem
{
  if ([(PKDashboardPaymentPassDataSource *)self _isPayLaterPass]
    && [(PKDashboardPaymentPassDataSource *)self canDisplayPayLaterBalance])
  {
    uint64_t v3 = [PKDashboardPayLaterAccountItem alloc];
    id v4 = [(PKDashboardPaymentPassDataSource *)self account];
    id v5 = [(PKDashboardPaymentPassDataSource *)self payLaterDueNext30Days];
    id v6 = [(PKDashboardPaymentPassDataSource *)self payLaterTotalPending];
    uint64_t v7 = [(PKDashboardPayLaterAccountItem *)v3 initWithPayLaterAccount:v4 dueNext30Days:v5 totalPending:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (int64_t)numberOfPayLaterBalanceDashboardItems
{
  uint64_t v3 = [(PKDashboardPaymentPassDataSource *)self financingPlans];
  if ([v3 count]) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = [(PKDashboardPaymentPassDataSource *)self completedFinancingPlansCount] > 0;
  }

  return [(PKDashboardPaymentPassDataSource *)self canDisplayPayLaterBalance] & v4;
}

- (void)_processUpdatedFinancingPlans:(id)a3 sectionsToReload:(id)a4 changedIndexPaths:(id)a5
{
  id v21 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(PKDashboardPaymentPassDataSource *)self financingPlans];

  if (v10
    && ([(PKDashboardPaymentPassDataSource *)self financingPlans],
        id v11 = objc_claimAutoreleasedReturnValue(),
        uint64_t v12 = [v11 count],
        uint64_t v13 = [v21 count],
        v11,
        v12 == v13))
  {
    unint64_t v14 = [(PKDashboardPaymentPassDataSource *)self firstSectionIndexForSectionIdentifier:14];
    if ([v21 count])
    {
      unint64_t v15 = 0;
      do
      {
        long long v16 = [v21 objectAtIndexedSubscript:v15];
        double v17 = [(PKDashboardPaymentPassDataSource *)self financingPlans];
        long long v18 = [v17 objectAtIndexedSubscript:v15];
        char v19 = PKEqualObjects();

        if ((v19 & 1) == 0)
        {
          uint64_t v20 = [MEMORY[0x1E4F28D58] indexPathForItem:v15 inSection:v14];
          [v9 addObject:v20];
        }
        ++v15;
      }
      while (v15 < [v21 count]);
    }
  }
  else
  {
    [(PKDashboardPaymentPassDataSource *)self _addPayLaterSectionsToReload:v8];
  }
}

- (void)_processUpdatedCompletedFinancingPlansCount:(int64_t)a3 sectionsToReload:(id)a4 changedIndexPaths:(id)a5
{
  id v8 = a4;
  int64_t v7 = [(PKDashboardPaymentPassDataSource *)self completedFinancingPlansCount];
  if (!a3 || v7 != a3) {
    [(PKDashboardPaymentPassDataSource *)self _addPayLaterSectionsToReload:v8];
  }
}

- (void)_processUpcomingInstallmentsWithQueryResposne:(id)a3 sectionsToReload:(id)a4 changedIndexPaths:(id)a5
{
  id v26 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v26 upcomingInstallments];
  id v11 = [v10 installments];

  uint64_t v12 = [v26 upcomingInstallments];
  uint64_t v13 = [v12 installmentIdentifierToFinancingPlan];
  [(PKDashboardPaymentPassDataSource *)self setInstallmentIdentifierToFinancingPlan:v13];

  unint64_t v14 = [(PKDashboardPaymentPassDataSource *)self payLaterUpcomingInstallments];

  id v25 = v8;
  if (v14
    && ([(PKDashboardPaymentPassDataSource *)self payLaterUpcomingInstallments],
        unint64_t v15 = objc_claimAutoreleasedReturnValue(),
        uint64_t v16 = [v15 count],
        uint64_t v17 = [v11 count],
        v15,
        v16 == v17))
  {
    unint64_t v18 = [(PKDashboardPaymentPassDataSource *)self firstSectionIndexForSectionIdentifier:13];
    if ([v11 count])
    {
      unint64_t v19 = 0;
      do
      {
        uint64_t v20 = [v11 objectAtIndexedSubscript:v19];
        id v21 = [(PKDashboardPaymentPassDataSource *)self payLaterUpcomingInstallments];
        id v22 = [v21 objectAtIndexedSubscript:v19];
        char v23 = PKEqualObjects();

        if ((v23 & 1) == 0)
        {
          id v24 = [MEMORY[0x1E4F28D58] indexPathForItem:v19 inSection:v18];
          [v9 addObject:v24];
        }
        ++v19;
      }
      while (v19 < [v11 count]);
    }
  }
  else
  {
    -[PKDashboardPaymentPassDataSource _addPayLaterSectionsToReload:](self, "_addPayLaterSectionsToReload:", v8, v25);
  }
}

- (void)reloadFinancingPlans
{
  if ([(PKDashboardPaymentPassDataSource *)self _isPayLaterPass])
  {
    if ([(PKDashboardPaymentPassDataSource *)self loadingFinancingPlans])
    {
      uint64_t v3 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Dashboard already loading financing plans", buf, 2u);
      }

      [(PKDashboardPaymentPassDataSource *)self setHasMoreFinancingPlansToLoad:1];
    }
    else
    {
      [(PKDashboardPaymentPassDataSource *)self setLoadingFinancingPlans:1];
      BOOL v4 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Dashboard loading financing plans", buf, 2u);
      }

      objc_initWeak(location, self);
      id v5 = objc_alloc_init(MEMORY[0x1E4F84518]);
      id v38 = [(PKDashboardPaymentPassDataSource *)self plansFetcher];
      if (v38)
      {
        id v6 = [(PKDashboardPaymentPassDataSource *)self account];
        [v38 setPayLaterAccount:v6];
      }
      else
      {
        id v7 = objc_alloc(MEMORY[0x1E4F849A8]);
        id v8 = [(PKDashboardPaymentPassDataSource *)self account];
        id v38 = (void *)[v7 initWithPayLaterAccount:v8];

        [(PKDashboardPaymentPassDataSource *)self setPlansFetcher:v38];
      }
      id v9 = [(PKDashboardPaymentPassDataSource *)self installmentPresenter];
      if (!v9)
      {
        id v9 = objc_alloc_init(PKPayLaterInstallmentPresenter);
        [(PKDashboardPaymentPassDataSource *)self setInstallmentPresenter:v9];
      }
      id v37 = v9;
      uint64_t v10 = [(PKDashboardPaymentPassDataSource *)self paymentIntentController];
      if (v10)
      {
        id v11 = [(PKDashboardPaymentPassDataSource *)self account];
        [v10 setPayLaterAccount:v11];
      }
      else
      {
        id v12 = objc_alloc(MEMORY[0x1E4F849D0]);
        uint64_t v36 = [(PKDashboardPaymentPassDataSource *)self account];
        uint64_t v13 = [MEMORY[0x1E4F84D50] sharedService];
        unint64_t v14 = [MEMORY[0x1E4F84898] sharedInstance];
        unint64_t v15 = [(PKDashboardPaymentPassDataSource *)self peerPaymentWebService];
        uint64_t v16 = v15;
        if (!v15)
        {
          uint64_t v16 = [MEMORY[0x1E4F84E10] sharedService];
        }
        uint64_t v17 = [MEMORY[0x1E4F84270] sharedInstance];
        id v18 = objc_alloc_init(MEMORY[0x1E4F84C38]);
        unint64_t v19 = [v18 defaultPaymentPassUniqueIdentifier];
        uint64_t v10 = (void *)[v12 initWithPayLaterAccount:v36 paymentWebService:v13 passLibrary:v14 peerPaymentWebService:v16 accountService:v17 defaultPassUniqueIdentifier:v19];

        if (!v15) {
        [(PKDashboardPaymentPassDataSource *)self setPaymentIntentController:v10];
        }
      }
      uint64_t v20 = [(PKDashboardPaymentPassDataSource *)self payLaterCalendarViewController];
      if (!v20)
      {
        id v21 = [PKPayLaterCalendarViewController alloc];
        id v22 = [(PKDashboardPaymentPassDataSource *)self plansFetcher];
        char v23 = [(PKDashboardPaymentPassDataSource *)self installmentPresenter];
        id v24 = [(PKDashboardPaymentPassDataSource *)self paymentIntentController];
        uint64_t v20 = [(PKPayLaterCalendarViewController *)v21 initWithPlansFetcher:v22 installmentPresenter:v23 paymentIntentController:v24];

        [(PKDashboardPaymentPassDataSource *)self setPayLaterCalendarViewController:v20];
      }
      v79[0] = MEMORY[0x1E4F143A8];
      v79[1] = 3221225472;
      v79[2] = __66__PKDashboardPaymentPassDataSource_PayLater__reloadFinancingPlans__block_invoke;
      v79[3] = &unk_1E59CFB08;
      id v25 = v20;
      v80 = v25;
      [v5 addOperation:v79];
      id v26 = [(PKDashboardPaymentPassDataSource *)self account];
      id v27 = [v26 accountIdentifier];

      id v35 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      double v33 = v25;
      id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      *(void *)buf = 0;
      v74 = buf;
      uint64_t v75 = 0x3032000000;
      v76 = __Block_byref_object_copy__41;
      v77 = __Block_byref_object_dispose__41;
      id v78 = 0;
      v71[0] = 0;
      v71[1] = v71;
      v71[2] = 0x3032000000;
      v71[3] = __Block_byref_object_copy__41;
      v71[4] = __Block_byref_object_dispose__41;
      id v72 = 0;
      v70[0] = 0;
      v70[1] = v70;
      v70[2] = 0x2020000000;
      v70[3] = 0;
      v68[0] = 0;
      v68[1] = v68;
      v68[2] = 0x3032000000;
      v68[3] = __Block_byref_object_copy__41;
      v68[4] = __Block_byref_object_dispose__41;
      id v69 = 0;
      v66[0] = 0;
      v66[1] = v66;
      v66[2] = 0x3032000000;
      v66[3] = __Block_byref_object_copy__41;
      v66[4] = __Block_byref_object_dispose__41;
      id v67 = 0;
      v64[0] = 0;
      v64[1] = v64;
      v64[2] = 0x3032000000;
      v64[3] = __Block_byref_object_copy__41;
      v64[4] = __Block_byref_object_dispose__41;
      id v65 = 0;
      v62[0] = 0;
      v62[1] = v62;
      v62[2] = 0x3032000000;
      v62[3] = __Block_byref_object_copy__41;
      v62[4] = __Block_byref_object_dispose__41;
      id v63 = 0;
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __66__PKDashboardPaymentPassDataSource_PayLater__reloadFinancingPlans__block_invoke_38;
      void v51[3] = &unk_1E59D9740;
      id v28 = v27;
      id v52 = v28;
      id v39 = v38;
      id v53 = v39;
      objc_copyWeak(&v61, location);
      id v54 = buf;
      id v55 = v71;
      long long v56 = v70;
      long long v57 = v68;
      long long v58 = v66;
      long long v59 = v64;
      v60 = v62;
      [v5 addOperation:v51];
      id v29 = [MEMORY[0x1E4F1CA98] null];
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __66__PKDashboardPaymentPassDataSource_PayLater__reloadFinancingPlans__block_invoke_2_47;
      v40[3] = &unk_1E59D9790;
      objc_copyWeak(&v50, location);
      id v43 = v70;
      id v44 = v64;
      id v45 = v68;
      id v46 = v66;
      char v47 = v71;
      id v48 = v62;
      id v30 = v35;
      id v41 = v30;
      id v31 = v34;
      id v42 = v31;
      id v49 = buf;
      id v32 = (id)[v5 evaluateWithInput:v29 completion:v40];

      objc_destroyWeak(&v50);
      objc_destroyWeak(&v61);

      _Block_object_dispose(v62, 8);
      _Block_object_dispose(v64, 8);

      _Block_object_dispose(v66, 8);
      _Block_object_dispose(v68, 8);

      _Block_object_dispose(v70, 8);
      _Block_object_dispose(v71, 8);

      _Block_object_dispose(buf, 8);
      objc_destroyWeak(location);
    }
  }
  else
  {
    [(PKDashboardPaymentPassDataSource *)self setShouldDisplayPayLaterItems:0];
    [(PKDashboardPaymentPassDataSource *)self setFinancingPlansLoaded:1];
    if (![(PKDashboardPaymentPassDataSource *)self allContentIsLoaded])
    {
      [(PKDashboardPaymentPassDataSource *)self updateContentIsLoaded];
    }
  }
}

void __66__PKDashboardPaymentPassDataSource_PayLater__reloadFinancingPlans__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = *(void **)(a1 + 32);
  id v9 = [MEMORY[0x1E4F1C9C8] date];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  id v12[2] = __66__PKDashboardPaymentPassDataSource_PayLater__reloadFinancingPlans__block_invoke_2;
  v12[3] = &unk_1E59CAD68;
  id v13 = v6;
  id v14 = v7;
  id v10 = v6;
  id v11 = v7;
  [v8 preflightWithFirstShownDate:v9 completion:v12];
}

uint64_t __66__PKDashboardPaymentPassDataSource_PayLater__reloadFinancingPlans__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __66__PKDashboardPaymentPassDataSource_PayLater__reloadFinancingPlans__block_invoke_38(uint64_t a1, void *a2, void *a3, void *a4)
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F84280]) initWithAccountIdentifier:*(void *)(a1 + 32) queryItems:87];
  [v10 setUpcomingInstallmentsLimit:3];
  id v11 = [MEMORY[0x1E4F84998] completedFinancingPlanStates];
  [v10 setCountFinancingPlanStates:v11];

  id v12 = *(void **)(a1 + 40);
  v27[0] = v10;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __66__PKDashboardPaymentPassDataSource_PayLater__reloadFinancingPlans__block_invoke_2_42;
  v18[3] = &unk_1E59D9718;
  objc_copyWeak(&v26, (id *)(a1 + 104));
  uint64_t v22 = *(void *)(a1 + 48);
  id v14 = v10;
  id v19 = v14;
  long long v15 = *(_OWORD *)(a1 + 72);
  long long v23 = *(_OWORD *)(a1 + 56);
  long long v24 = v15;
  long long v25 = *(_OWORD *)(a1 + 88);
  id v16 = v9;
  id v21 = v16;
  id v17 = v8;
  id v20 = v17;
  [v12 financingPlansWithQueries:v13 completion:v18];

  objc_destroyWeak(&v26);
}

void __66__PKDashboardPaymentPassDataSource_PayLater__reloadFinancingPlans__block_invoke_2_42(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__PKDashboardPaymentPassDataSource_PayLater__reloadFinancingPlans__block_invoke_3;
  v6[3] = &unk_1E59D96F0;
  objc_copyWeak(&v15, (id *)(a1 + 112));
  uint64_t v11 = *(void *)(a1 + 56);
  id v7 = v3;
  id v8 = *(id *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 80);
  long long v12 = *(_OWORD *)(a1 + 64);
  long long v13 = v4;
  long long v14 = *(_OWORD *)(a1 + 96);
  id v10 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 40);
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);

  objc_destroyWeak(&v15);
}

void __66__PKDashboardPaymentPassDataSource_PayLater__reloadFinancingPlans__block_invoke_3(uint64_t a1)
{
  id v2 = (id *)(a1 + 120);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
  if (WeakRetained)
  {
    long long v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Dashboard finished fetching financing plans", buf, 2u);
    }

    id v5 = *(void **)(a1 + 32);
    id v6 = [*(id *)(a1 + 40) queryIdentifier];
    uint64_t v7 = [v5 objectForKeyedSubscript:v6];
    uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    uint64_t v10 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) activeFinancingPlans];
    uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8);
    long long v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8)+ 40) financingPlanCount];
    uint64_t v13 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) dueNext30Days];
    uint64_t v14 = *(void *)(*(void *)(a1 + 88) + 8);
    id v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    uint64_t v16 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) totalPendingAmount];
    uint64_t v17 = *(void *)(*(void *)(a1 + 96) + 8);
    id v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    id v19 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) upcomingInstallments];
    uint64_t v20 = [v19 installments];
    uint64_t v21 = *(void *)(*(void *)(a1 + 104) + 8);
    uint64_t v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;

    long long v23 = [PKPayLaterDashboardMessageComposer alloc];
    uint64_t v24 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    long long v25 = [WeakRetained pass];
    id v26 = [WeakRetained account];
    id v27 = [WeakRetained paymentIntentController];
    uint64_t v28 = [(PKPayLaterDashboardMessageComposer *)v23 initWithContext:0 allFinancingPlans:v24 payLaterPass:v25 payLaterAccount:v26 financingPlan:0 paymentIntentController:v27 delegate:WeakRetained];
    uint64_t v29 = *(void *)(*(void *)(a1 + 112) + 8);
    id v30 = *(void **)(v29 + 40);
    *(void *)(v29 + 40) = v28;

    id v31 = *(void **)(*(void *)(*(void *)(a1 + 112) + 8) + 40);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __66__PKDashboardPaymentPassDataSource_PayLater__reloadFinancingPlans__block_invoke_44;
    v32[3] = &unk_1E59CA960;
    objc_copyWeak(&v35, v2);
    id v34 = *(id *)(a1 + 56);
    id v33 = *(id *)(a1 + 48);
    [v31 preflightDashboardMessagesWithCompletion:v32];

    objc_destroyWeak(&v35);
  }
}

void __66__PKDashboardPaymentPassDataSource_PayLater__reloadFinancingPlans__block_invoke_44(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id WeakRetained = v3;
  }
}

void __66__PKDashboardPaymentPassDataSource_PayLater__reloadFinancingPlans__block_invoke_2_47(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__PKDashboardPaymentPassDataSource_PayLater__reloadFinancingPlans__block_invoke_3_48;
  v5[3] = &unk_1E59D9768;
  objc_copyWeak(&v12, (id *)(a1 + 104));
  long long v2 = *(_OWORD *)(a1 + 64);
  long long v8 = *(_OWORD *)(a1 + 48);
  long long v9 = v2;
  long long v10 = *(_OWORD *)(a1 + 80);
  id v6 = *(id *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 96);
  id v7 = v3;
  uint64_t v11 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v12);
}

void __66__PKDashboardPaymentPassDataSource_PayLater__reloadFinancingPlans__block_invoke_3_48(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v2 = (id *)(a1 + 104);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
  uint64_t v4 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_28;
  }
  id v5 = [WeakRetained account];
  [v4 setShouldDisplayPayLaterItems:PKCanShowPayLaterPassItemsForAccount()];

  if (![v4 shouldDisplayPayLaterItems]) {
    goto LABEL_9;
  }
  id v6 = [v4 account];
  if ([v6 state] != 2)
  {
    id v7 = [v4 account];
    if ([v7 state] == 4)
    {

      goto LABEL_6;
    }
    long long v9 = [v4 account];
    char v10 = [v9 hidePayLaterSetupInWallet];

    if ((v10 & 1) == 0)
    {
      uint64_t v22 = [v4 account];
      id v6 = [v22 payLaterDetails];

      if ([v6 hasEligibleSpend]) {
        uint64_t v8 = 1;
      }
      else {
        uint64_t v8 = [v6 isPayLaterSupportedInCurrentRegion];
      }
      goto LABEL_7;
    }
LABEL_9:
    uint64_t v8 = 0;
    goto LABEL_10;
  }
LABEL_6:
  uint64_t v8 = 0;
LABEL_7:

LABEL_10:
  [v4 setHasPayLaterEligibleSpend:v8];
  [v4 setCompletedFinancingPlansCount:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  [v4 setPayLaterUpcomingInstallments:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  [v4 setPayLaterDueNext30Days:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  [v4 setPayLaterTotalPending:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
  [v4 setFinancingPlans:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
  [v4 setPayLaterDashboardMessageComposer:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
  [v4 _processUpdatedFinancingPlans:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) sectionsToReload:*(void *)(a1 + 32) changedIndexPaths:*(void *)(a1 + 40)];
  [v4 _processUpcomingInstallmentsWithQueryResposne:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) sectionsToReload:*(void *)(a1 + 32) changedIndexPaths:*(void *)(a1 + 40)];
  [v4 _processUpdatedCompletedFinancingPlansCount:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) sectionsToReload:*(void *)(a1 + 32) changedIndexPaths:*(void *)(a1 + 40)];
  [v4 reloadMessages];
  [v4 _updateBalanceAndPreventReload:1];
  [v4 setFinancingPlansLoaded:1];
  [v4 _addPayLaterSectionsToReload:*(void *)(a1 + 32)];
  int v11 = [v4 hasMoreFinancingPlansToLoad];
  [v4 setHasMoreFinancingPlansToLoad:0];
  [v4 setLoadingFinancingPlans:0];
  if (v11)
  {
    id v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "Dashboard finished loading financing plans. There are more plans that need to be loaded.", buf, 2u);
    }

    dispatch_time_t v13 = dispatch_time(0, 3000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__PKDashboardPaymentPassDataSource_PayLater__reloadFinancingPlans__block_invoke_49;
    block[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v28, v2);
    dispatch_after(v13, MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v28);
  }
  if ([v4 allContentIsLoaded])
  {
    uint64_t v14 = [v4 delegate];
    if (v14)
    {
      if ([*(id *)(a1 + 32) count]) {
        [v14 reloadSections:*(void *)(a1 + 32)];
      }
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v15 = *(id *)(a1 + 40);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v30 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v24 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void *)(*((void *)&v23 + 1) + 8 * i);
            uint64_t v21 = objc_msgSend(v4, "itemAtIndexPath:", v20, (void)v23);
            [v14 itemChanged:v21 atIndexPath:v20];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v30 count:16];
        }
        while (v17);
      }
    }
  }
  else
  {
    [v4 updateContentIsLoaded];
  }
LABEL_28:
}

void __66__PKDashboardPaymentPassDataSource_PayLater__reloadFinancingPlans__block_invoke_49(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained reloadFinancingPlans];
    id WeakRetained = v2;
  }
}

- (int64_t)numberOfPayLaterUpcomingPayments
{
  if (![(PKDashboardPaymentPassDataSource *)self _isPayLaterPass]) {
    return 0;
  }
  id v3 = [(PKDashboardPaymentPassDataSource *)self payLaterUpcomingInstallments];
  uint64_t v4 = [v3 count];

  if (v4) {
    return v4 + 1;
  }
  else {
    return 0;
  }
}

- (id)payLaterInstallmentItemForItemIndex:(unint64_t)a3
{
  id v5 = [(PKDashboardPaymentPassDataSource *)self payLaterUpcomingInstallments];
  unint64_t v6 = [v5 count];

  if (v6 <= a3)
  {
    uint64_t v14 = 0;
  }
  else
  {
    id v7 = [(PKDashboardPaymentPassDataSource *)self payLaterUpcomingInstallments];
    uint64_t v8 = [v7 objectAtIndexedSubscript:a3];

    long long v9 = [(PKDashboardPaymentPassDataSource *)self installmentIdentifierToFinancingPlan];
    char v10 = [v8 installmentIdentifier];
    int v11 = [v9 objectForKey:v10];

    id v12 = [PKDashboardFinancingPlanInstallmentItem alloc];
    dispatch_time_t v13 = [(PKDashboardPaymentPassDataSource *)self paymentIntentController];
    uint64_t v14 = [(PKDashboardFinancingPlanInstallmentItem *)v12 initWithFinancingPlan:v11 relevantInstallment:v8 paymentIntentController:v13];
  }

  return v14;
}

- (int64_t)numberOfFinancingPlansEnabled
{
  if (![(PKDashboardPaymentPassDataSource *)self _isPayLaterPass]) {
    return 0;
  }
  id v3 = [(PKDashboardPaymentPassDataSource *)self financingPlans];
  int64_t v4 = [v3 count];

  return v4;
}

- (int64_t)numberOfCompletedFinancingPlanItems
{
  return [(PKDashboardPaymentPassDataSource *)self _isPayLaterPass]
      && [(PKDashboardPaymentPassDataSource *)self completedFinancingPlansCount] > 0;
}

- (id)payLaterCompleteFinancingPlansItemForItemIndex:(unint64_t)a3
{
  if ([(PKDashboardPaymentPassDataSource *)self completedFinancingPlansCount])
  {
    int64_t v4 = [PKDashboardFinancingPlanGroupItem alloc];
    int64_t v5 = [(PKDashboardPaymentPassDataSource *)self completedFinancingPlansCount];
    unint64_t v6 = [(PKDashboardPaymentPassDataSource *)self account];
    id v7 = [(PKDashboardPaymentPassDataSource *)self paymentIntentController];
    uint64_t v8 = [(PKDashboardFinancingPlanGroupItem *)v4 initWithFinancingPlansCount:v5 payLaterAccount:v6 paymentIntentController:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)payLaterFinancingPlanItemForItemIndex:(unint64_t)a3
{
  int64_t v5 = [(PKDashboardPaymentPassDataSource *)self financingPlans];
  unint64_t v6 = [v5 count];

  if (v6 <= a3)
  {
    id v12 = 0;
  }
  else
  {
    id v7 = [(PKDashboardPaymentPassDataSource *)self financingPlans];
    uint64_t v8 = [v7 objectAtIndexedSubscript:a3];

    long long v9 = [PKDashboardFinancingPlanItem alloc];
    char v10 = [(PKDashboardPaymentPassDataSource *)self account];
    int v11 = [(PKDashboardPaymentPassDataSource *)self paymentIntentController];
    id v12 = [(PKDashboardFinancingPlanItem *)v9 initWithFinancingPlan:v8 payLaterAccount:v10 paymentIntentController:v11];
  }

  return v12;
}

- (id)payLaterFinancingPlanSeeAllPaymentsItem
{
  id v3 = objc_alloc_init(PKDashboardTextActionItem);
  int64_t v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"calendar"];
  [(PKDashboardTextActionItem *)v3 setIcon:v4];

  [(PKDashboardTextActionItem *)v3 setActionStyle:0];
  [(PKDashboardTextActionItem *)v3 setLayoutStyle:0];
  int64_t v5 = [(PKDashboardPaymentPassDataSource *)self account];
  [v5 feature];
  unint64_t v6 = PKLocalizedFeatureString();
  [(PKDashboardTextActionItem *)v3 setTitle:v6];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __85__PKDashboardPaymentPassDataSource_PayLater__payLaterFinancingPlanSeeAllPaymentsItem__block_invoke;
  v8[3] = &unk_1E59D97B8;
  void v8[4] = self;
  [(PKDashboardTextActionItem *)v3 setAction:v8];

  return v3;
}

uint64_t __85__PKDashboardPaymentPassDataSource_PayLater__payLaterFinancingPlanSeeAllPaymentsItem__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentPayLaterCalendarViewController];
}

- (void)presentPayLaterCalendarViewController
{
  id v6 = [(PKDashboardPaymentPassDataSource *)self payLaterCalendarViewController];
  id v3 = [(PKDashboardPaymentPassDataSource *)self groupView];
  int64_t v4 = objc_msgSend(v3, "pkui_viewControllerFromResponderChain");
  int64_t v5 = [v4 navigationController];
  [v5 pushViewController:v6 animated:1];
}

- (int64_t)numberOfPayLaterEligibleSpend
{
  if ([(PKDashboardPaymentPassDataSource *)self _isPayLaterPass]) {
    return [(PKDashboardPaymentPassDataSource *)self hasPayLaterEligibleSpend];
  }
  else {
    return 0;
  }
}

- (id)payLaterEligibleSpendItemForItemIndex:(unint64_t)a3
{
  if ([(PKDashboardPaymentPassDataSource *)self canDisplayPayLaterEligibleSpend])
  {
    int64_t v4 = [PKDashboardPayLaterEligibleSpendItem alloc];
    int64_t v5 = [(PKDashboardPaymentPassDataSource *)self account];
    id v6 = [(PKDashboardPayLaterEligibleSpendItem *)v4 initWithPayLaterAccount:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)payLaterFooterTextItemForSection:(unint64_t)a3
{
  if ([(PKDashboardPaymentPassDataSource *)self numberOfSections] - 1 != a3) {
    goto LABEL_5;
  }
  int64_t v4 = [(PKDashboardPaymentPassDataSource *)self account];
  uint64_t v5 = [v4 state];

  if (v5 == 3) {
    goto LABEL_5;
  }
  id v6 = (void *)MEMORY[0x1E4F84998];
  id v7 = [(PKDashboardPaymentPassDataSource *)self account];
  uint64_t v8 = [(PKDashboardPaymentPassDataSource *)self financingPlans];
  LODWORD(v6) = [v6 requiresGenericMessagingForAccount:v7 financingPlans:v8];

  if (v6)
  {
    long long v9 = [(PKDashboardPaymentPassDataSource *)self account];
    [v9 feature];
    char v10 = PKLocalizedFeatureString();
    int v11 = +[PKDashboardFooterTextItem itemWithFooterText:v10];
  }
  else
  {
LABEL_5:
    int v11 = 0;
  }

  return v11;
}

- (void)_addPayLaterSectionsToReload:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "addIndex:", -[PKDashboardPaymentPassDataSource firstSectionIndexForSectionIdentifier:](self, "firstSectionIndexForSectionIdentifier:", 13));
  objc_msgSend(v4, "addIndex:", -[PKDashboardPaymentPassDataSource firstSectionIndexForSectionIdentifier:](self, "firstSectionIndexForSectionIdentifier:", 2));
  objc_msgSend(v4, "addIndex:", -[PKDashboardPaymentPassDataSource firstSectionIndexForSectionIdentifier:](self, "firstSectionIndexForSectionIdentifier:", 6));
  objc_msgSend(v4, "addIndex:", -[PKDashboardPaymentPassDataSource firstSectionIndexForSectionIdentifier:](self, "firstSectionIndexForSectionIdentifier:", 8));
  objc_msgSend(v4, "addIndex:", -[PKDashboardPaymentPassDataSource firstSectionIndexForSectionIdentifier:](self, "firstSectionIndexForSectionIdentifier:", 14));
  objc_msgSend(v4, "addIndex:", -[PKDashboardPaymentPassDataSource firstSectionIndexForSectionIdentifier:](self, "firstSectionIndexForSectionIdentifier:", 15));
}

- (PKDashboardPaymentPassDataSource)initWithGroupView:(id)a3 context:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v52.receiver = self;
  v52.super_class = (Class)PKDashboardPaymentPassDataSource;
  long long v9 = [(PKDashboardPaymentPassDataSource *)&v52 init];
  char v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a4);
    objc_storeStrong((id *)&v10->_groupView, a3);
    [v7 addPassGroupViewObserver:v10];
    int v11 = [v7 frontmostPassView];
    [(PKDashboardPaymentPassDataSource *)v10 _setPassView:v11];

    uint64_t v12 = [v7 group];
    group = v10->_group;
    v10->_group = (PKGroup *)v12;

    v10->_lockImages._os_unfair_lock_opaque = 0;
    uint64_t v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    messageImagesCache = v10->_messageImagesCache;
    v10->_messageImagesCache = v14;

    v10->_lockTransactions._os_unfair_lock_opaque = 0;
    v10->_sessionActiveToken = -1;
    uint64_t v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    iconDownloads = v10->_iconDownloads;
    v10->_iconDownloads = v16;

    uint64_t v18 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    iconFailedDownloads = v10->_iconFailedDownloads;
    v10->_iconFailedDownloads = v18;

    uint64_t v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    icons = v10->_icons;
    v10->_icons = v20;

    v10->_lockIcons._os_unfair_lock_opaque = 0;
    if (PKUIScreenScale() <= 2.0) {
      uint64_t v22 = @"2x";
    }
    else {
      uint64_t v22 = @"3x";
    }
    objc_storeStrong((id *)&v10->_scaleKey, v22);
    long long v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    executionBlocksContentIsLoaded = v10->_executionBlocksContentIsLoaded;
    v10->_executionBlocksContentIsLoaded = v23;

    long long v25 = (NSOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CAA0]);
    messages = v10->_messages;
    v10->_messages = v25;

    id v27 = (NSOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CAA0]);
    secondaryMessages = v10->_secondaryMessages;
    v10->_secondaryMessages = v27;

    uint64_t v29 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sourcesPerFundingSourceIdentifier = v10->_sourcesPerFundingSourceIdentifier;
    v10->_sourcesPerFundingSourceIdentifier = v29;

    uint64_t v31 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    dynamicSections = v10->_dynamicSections;
    v10->_dynamicSections = v31;

    [(NSMutableDictionary *)v10->_dynamicSections setObject:&unk_1EF2B9720 forKeyedSubscript:&unk_1EF2B9738];
    [(NSMutableDictionary *)v10->_dynamicSections setObject:&unk_1EF2B9720 forKeyedSubscript:&unk_1EF2B9750];
    [(NSMutableDictionary *)v10->_dynamicSections setObject:&unk_1EF2B9720 forKeyedSubscript:&unk_1EF2B9768];
    id v33 = (PKSecureElement *)objc_alloc_init(MEMORY[0x1E4F84FC0]);
    secureElement = v10->_secureElement;
    v10->_secureElement = v33;

    v10->_isInRestrictedMode = [(PKSecureElement *)v10->_secureElement isInRestrictedMode];
    [(PKSecureElement *)v10->_secureElement registerObserver:v10];
    id v35 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    formatterYear = v10->_formatterYear;
    v10->_formatterYear = v35;

    [(NSDateFormatter *)v10->_formatterYear setLocalizedDateFormatFromTemplate:@"y"];
    id v37 = [(PKAccount *)v10->_account creditDetails];
    id v38 = [v37 productTimeZone];

    id v39 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    formatterMonth = v10->_formatterMonth;
    v10->_formatterMonth = v39;

    [(NSDateFormatter *)v10->_formatterMonth setTimeZone:v38];
    [(NSDateFormatter *)v10->_formatterMonth setLocalizedDateFormatFromTemplate:@"MMMM"];
    id v41 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    formatterMonthDay = v10->_formatterMonthDay;
    v10->_formatterMonthDay = v41;

    [(NSDateFormatter *)v10->_formatterMonthDay setTimeZone:v38];
    [(NSDateFormatter *)v10->_formatterMonthDay setLocalizedDateFormatFromTemplate:@"MMMM d"];
    id v43 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
    formatterPercentage = v10->_formatterPercentage;
    v10->_formatterPercentage = v43;

    [(NSNumberFormatter *)v10->_formatterPercentage setNumberStyle:3];
    [(NSNumberFormatter *)v10->_formatterPercentage setMinimumFractionDigits:2];
    [(NSNumberFormatter *)v10->_formatterPercentage setMaximumFractionDigits:2];
    [(NSNumberFormatter *)v10->_formatterPercentage setMultiplier:&unk_1EF2B9780];
    id v45 = objc_alloc_init(PKSecureElementPassContactIssuerHelper);
    contactIssuerHelper = v10->_contactIssuerHelper;
    v10->_contactIssuerHelper = v45;

    [(PKSecureElementPassContactIssuerHelper *)v10->_contactIssuerHelper setDelegate:v10];
    [(PKDashboardPaymentPassDataSource *)v10 reloadFrontmostPass];
    [(PKDashboardPaymentPassDataSource *)v10 reloadAllContent];
    char v47 = +[PKUIForegroundActiveArbiter sharedInstance];
    v10->_activeState = ($77BFE790A1370D46B4241309C9753022)[v47 registerObserver:v10];

    [(PKDashboardPaymentPassDataSource *)v10 _updateTransactionsTimer];
    v10->_filterType = 0;
    incomingRequestActionInProgressRequestToken = v10->_incomingRequestActionInProgressRequestToken;
    v10->_incomingRequestActionInProgressRequestToken = 0;

    id v49 = (FHSearchSuggestionController *)objc_alloc_init(getFHSearchSuggestionControllerClass_0());
    searchSuggestionController = v10->_searchSuggestionController;
    v10->_searchSuggestionController = v49;
  }
  return v10;
}

- (PKPassGroupView)groupView
{
  return self->_groupView;
}

- (void)reloadFrontmostPass
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v3 = [(PKGroup *)self->_group passAtIndex:[(PKGroup *)self->_group frontmostPassIndex]];
  if (self->_pass != v3)
  {
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v5 = [(PKPeerPaymentWebService *)self->_peerPaymentWebService targetDevice];
    uint64_t v80 = *MEMORY[0x1E4F87CC8];
    objc_msgSend(v4, "removeObserver:name:object:", self);

    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v7 = *MEMORY[0x1E4F85BF8];
    [v6 removeObserver:self name:*MEMORY[0x1E4F85BF8] object:0];

    id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v9 = *MEMORY[0x1E4F1C370];
    [v8 removeObserver:self name:*MEMORY[0x1E4F1C370] object:0];

    char v10 = [MEMORY[0x1E4F84688] sharedInstance];
    [v10 removeObserver:self];

    [(PKAccountService *)self->_accountService unregisterObserver:self];
    [(PKLinkedApplication *)self->_linkedApplication removeObserver:self];
    int v11 = [MEMORY[0x1E4F84E00] sharedInstance];
    [v11 unregisterObserver:self];
    uint64_t v12 = [(PKPaymentPass *)v3 devicePrimaryPaymentApplication];
    uint64_t v13 = [v12 state];
    uint64_t v14 = [(PKPaymentPass *)self->_pass devicePrimaryPaymentApplication];
    uint64_t v15 = [v14 state];

    if (v13 != v15)
    {
      objc_initWeak((id *)location, self);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __55__PKDashboardPaymentPassDataSource_reloadFrontmostPass__block_invoke;
      block[3] = &unk_1E59CA7F8;
      objc_copyWeak(&v93, (id *)location);
      dispatch_async(MEMORY[0x1E4F14428], block);
      objc_destroyWeak(&v93);
      objc_destroyWeak((id *)location);
    }
    if ([(PKDashboardPaymentPassDataSource *)self hasAssociatedPaymentRewardsBalance])
    {
      [(PKDashboardPaymentPassDataSource *)self resetAssociatedPaymentRewardsBalanceIfNeeded];
    }
    [(PKDashboardPaymentPassDataSource *)self setPayWithRewardsSupportState:[(PKDashboardPaymentPassDataSource *)self supportsPaymentRewardsBalance]];
    v81 = self->_pass;
    p_pass = &self->_pass;
    objc_storeStrong((id *)&self->_pass, v3);
    v84 = [(PKPaymentPass *)self->_pass uniqueID];
    uint64_t v16 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      [(PKDashboardPaymentPassDataSource *)self _passFeature];
      uint64_t v17 = PKFeatureIdentifierToString();
      *(_DWORD *)id location = 134218498;
      *(void *)&location[4] = self;
      __int16 v95 = 2114;
      v96 = v84;
      __int16 v97 = 2114;
      v98 = v17;
      _os_log_impl(&dword_19F450000, v16, OS_LOG_TYPE_DEFAULT, "Dashboard loading (%p): for %{public}@, pass feature %{public}@", location, 0x20u);
    }
    v82 = [(PKGroup *)self->_group associatedAccountForPassUniqueID:v84];
    if (v82) {
      [(PKDashboardPaymentPassDataSource *)self reloadAccountWithNewAccount:v82];
    }
    if ([(PKPaymentPass *)*p_pass isStoredValuePass])
    {
      self->_productsLoaded = 0;
      objc_initWeak((id *)location, self);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __55__PKDashboardPaymentPassDataSource_reloadFrontmostPass__block_invoke_355;
      aBlock[3] = &unk_1E59CBA90;
      objc_copyWeak(&v91, (id *)location);
      uint64_t v18 = _Block_copy(aBlock);
      id v19 = (const char *)*MEMORY[0x1E4F874B8];
      uint64_t v20 = MEMORY[0x1E4F14428];
      id v21 = MEMORY[0x1E4F14428];
      LODWORD(v19) = notify_register_dispatch(v19, &self->_sessionActiveToken, v20, v18);

      int sessionActiveToken = self->_sessionActiveToken;
      if (v19)
      {
        if (sessionActiveToken != -1)
        {
          notify_cancel(sessionActiveToken);
          self->_int sessionActiveToken = -1;
        }
      }
      else if (sessionActiveToken != -1)
      {
        state64[0] = 0;
        notify_get_state(sessionActiveToken, state64);
        self->_sessionActive = state64[0] != 0;
      }

      objc_destroyWeak(&v91);
      objc_destroyWeak((id *)location);
    }
    else
    {
      self->_isAccessPass = [(PKPaymentPass *)self->_pass isAccessPass];
      self->_productsLoaded = 1;
    }
    self->_hasUpdatedAccountRewardsDataIfNecessary = 0;
    if ([(PKPaymentPass *)self->_pass hasAssociatedPeerPaymentAccount])
    {
      self->_transactionGrouping = 2;
      self->_scheduledPaymentsLoaded = 1;
      self->_creditRecoveryPaymentPlansLoaded = 1;
      *(_WORD *)&self->_accountUsersLoaded = 257;
      self->_physicalCardsLoaded = 1;
      [(PKDashboardPaymentPassDataSource *)self setFinancingPlansLoaded:1];
      long long v23 = objc_alloc_init(PKNearbyPeerPaymentViewProvider);
      [(PKDashboardPaymentPassDataSource *)self setNearbyPeerPaymentViewProvider:v23];

      long long v24 = [v11 account];
      peerPaymentAccount = self->_peerPaymentAccount;
      self->_peerPaymentAccount = v24;

      id v26 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount associatedPassUniqueID];
      id v27 = v84;
      id v28 = v27;
      if (v26 == v27)
      {

        goto LABEL_31;
      }
      if (v27 && v26)
      {
        int v29 = [v26 isEqualToString:v27];

        if (!v29) {
          goto LABEL_41;
        }
LABEL_31:
        id v38 = [MEMORY[0x1E4F84E10] sharedService];
        peerPaymentWebService = self->_peerPaymentWebService;
        self->_peerPaymentWebService = v38;

        long long v40 = [PKPeerPaymentAccountResolutionController alloc];
        id v41 = self->_peerPaymentAccount;
        id v42 = self->_peerPaymentWebService;
        id v43 = objc_alloc_init(MEMORY[0x1E4F848A0]);
        id v44 = [(PKPeerPaymentAccountResolutionController *)v40 initWithAccount:v41 webService:v42 context:0 delegate:0 passLibraryDataProvider:v43];
        peerPaymentAccountResolutionController = self->_peerPaymentAccountResolutionController;
        self->_peerPaymentAccountResolutionController = v44;

        [(PKPeerPaymentAccountResolutionController *)self->_peerPaymentAccountResolutionController setDelegate:self];
        id v46 = [MEMORY[0x1E4F28EB8] defaultCenter];
        char v47 = [(PKPeerPaymentWebService *)self->_peerPaymentWebService targetDevice];
        [v46 addObserver:self selector:sel__peerPaymentAccountChanged_ name:v80 object:v47];

        [v11 registerObserver:self];
        id v48 = [MEMORY[0x1E4F84188] sharedManager];
        AMPEnrollmentManager = self->_AMPEnrollmentManager;
        self->_AMPEnrollmentManager = v48;

        if ([(PKDashboardPaymentPassDataSource *)self _passAvailableForAMPEnrollment]) {
          [(PKDashboardPaymentPassDataSource *)self _fetchAMPEnrollmentEligibility];
        }
        objc_initWeak((id *)location, self);
        id v50 = [MEMORY[0x1E4F84270] sharedInstance];
        v87[0] = MEMORY[0x1E4F143A8];
        v87[1] = 3221225472;
        v87[2] = __55__PKDashboardPaymentPassDataSource_reloadFrontmostPass__block_invoke_2;
        v87[3] = &unk_1E59D1D88;
        objc_copyWeak(&v88, (id *)location);
        [v50 accountsWithPassLocallyProvisionedWithCompletion:v87];

        if ([(PKPeerPaymentAccount *)self->_peerPaymentAccount isAccountStateDirty])
        {
          long long v51 = [MEMORY[0x1E4F1C9C8] date];
          objc_super v52 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount lastUpdated];
          [v51 timeIntervalSinceDate:v52];
          BOOL v54 = v53 > 300.0;

          if (v54)
          {
            id v55 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(state64[0]) = 0;
              _os_log_impl(&dword_19F450000, v55, OS_LOG_TYPE_DEFAULT, "Updating peer payment account because dirty outdated", (uint8_t *)state64, 2u);
            }

            v85[0] = MEMORY[0x1E4F143A8];
            v85[1] = 3221225472;
            v85[2] = __55__PKDashboardPaymentPassDataSource_reloadFrontmostPass__block_invoke_367;
            v85[3] = &unk_1E59D97E0;
            objc_copyWeak(&v86, (id *)location);
            [v11 updateAccountWithCompletion:v85];
            objc_destroyWeak(&v86);
          }
        }
        objc_destroyWeak(&v88);
        objc_destroyWeak((id *)location);
        goto LABEL_41;
      }
    }
    else
    {
      id v30 = [(PKPaymentPass *)*p_pass associatedAccountServiceAccountIdentifier];

      if (v30)
      {
        uint64_t v31 = [MEMORY[0x1E4F84E00] sharedInstance];
        id v32 = [v31 account];
        id v33 = self->_peerPaymentAccount;
        self->_peerPaymentAccount = v32;

        id v34 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v34 addObserver:self selector:sel_reloadAccount name:v7 object:0];

        id v35 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v35 addObserver:self selector:sel__localeDidChangeNotification_ name:v9 object:0];

        uint64_t v36 = [MEMORY[0x1E4F84270] sharedInstance];
        accountService = self->_accountService;
        self->_accountService = v36;

        [(PKAccountService *)self->_accountService registerObserver:self];
        if ([(PKDashboardPaymentPassDataSource *)self _isCreditPass])
        {
          self->_transactionGrouping = 2;
        }
        else
        {
          self->_scheduledPaymentsLoaded = 1;
          *(_DWORD *)&self->_familyCollectionLoaded = 16843009;
        }
      }
      else
      {
        self->_scheduledPaymentsLoaded = 1;
        self->_creditRecoveryPaymentPlansLoaded = 1;
        *(_DWORD *)&self->_familyCollectionLoaded = 16843009;
        [(PKDashboardPaymentPassDataSource *)self setFinancingPlansLoaded:1];
      }
    }
LABEL_41:
    long long v56 = (PKPaymentDefaultDataProvider *)objc_alloc_init(MEMORY[0x1E4F84A88]);
    paymentDataProvider = self->_paymentDataProvider;
    self->_paymentDataProvider = v56;

    [(PKPaymentDefaultDataProvider *)self->_paymentDataProvider addDelegate:self];
    long long v58 = [PKContactAvatarManager alloc];
    long long v59 = [(PKDashboardPaymentPassDataSource *)self _contactResolver];
    v60 = [(PKContactAvatarManager *)v58 initWithContactResolver:v59 paymentDataProvider:self->_paymentDataProvider];
    avatarManager = self->_avatarManager;
    self->_avatarManager = v60;

    [(PKDashboardPaymentPassDataSource *)self _updateTransactionSourceCollection];
    if ([(PKPaymentPass *)self->_pass supportsBarcodePayment])
    {
      v62 = [[PKLinkedApplication alloc] initWithPass:self->_pass];
      linkedApplication = self->_linkedApplication;
      self->_linkedApplication = v62;

      [(PKLinkedApplication *)self->_linkedApplication addObserver:self];
      [(PKLinkedApplication *)self->_linkedApplication reloadApplicationStateIfNecessary];
    }
    else
    {
      v64 = self->_linkedApplication;
      self->_linkedApplication = 0;
    }
    id v65 = [(PKDashboardPaymentPassDataSource *)self AMPEnagementPlacementForCurrentlyDisplayedPass];

    if (v65)
    {
      v66 = [MEMORY[0x1E4F84688] sharedInstance];
      [v66 addObserver:self];
    }
    lastReportedDiscoveryIdentifier = self->_lastReportedDiscoveryIdentifier;
    self->_lastReportedDiscoveryIdentifier = 0;

    pass = self->_pass;
    id v69 = [MEMORY[0x1E4F84D50] sharedService];
    self->_shouldDisplayDeviceAssessmentEducation = [(PKPaymentPass *)pass shouldDisplayDeviceAssessmentEducationAccordingToService:v69];

    [(PKSecureElementPassContactIssuerHelper *)self->_contactIssuerHelper setPass:self->_pass];
    if ([(PKDashboardPaymentPassDataSource *)self isBankConnectSupported])
    {
      v70 = [(PKPaymentPass *)*p_pass primaryAccountIdentifier];
      if (!v81
        || ([(PKPaymentPass *)v81 primaryAccountIdentifier],
            v71 = objc_claimAutoreleasedReturnValue(),
            char v72 = [v70 isEqualToString:v71],
            v71,
            (v72 & 1) == 0))
      {
        v73 = (void *)[objc_alloc(MEMORY[0x1E4F26BB0]) initWithPrimaryAccountIdentifier:v70];
        [(PKDashboardPaymentPassDataSource *)self setBankConnectAccountsProvider:v73];

        v74 = [(PKDashboardPaymentPassDataSource *)self bankConnectAccountsProvider];
        [v74 setDelegate:self];

        uint64_t v75 = (void *)[objc_alloc(MEMORY[0x1E4F26BE0]) initWithPrimaryAccountIdentifier:v70];
        [(PKDashboardPaymentPassDataSource *)self setBankConnectTransactionsProvider:v75];

        v76 = [(PKDashboardPaymentPassDataSource *)self bankConnectTransactionsProvider];
        [v76 setDelegate:self];

        id v77 = objc_alloc_init(MEMORY[0x1E4F26BC8]);
        [(PKDashboardPaymentPassDataSource *)self setBankConnectInstitutionMatcher:v77];

        id v78 = objc_alloc_init(getFKBankConnectImageProviderClass_0());
        [(PKDashboardPaymentPassDataSource *)self setBankConnectImageProvider:v78];

        id v79 = objc_alloc_init(MEMORY[0x1E4F26BD8]);
        [(PKDashboardPaymentPassDataSource *)self setBankConnectMessagesManager:v79];
      }
    }
    if (([(PKPaymentPass *)*p_pass isHomeKeyPass] & 1) == 0) {
      self->_homeKitRestrictedGuestAccessStateLoaded = 1;
    }

    goto LABEL_54;
  }
  int v11 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id location = 0;
    _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "Skipping reload of pass...", location, 2u);
  }
LABEL_54:
}

void __55__PKDashboardPaymentPassDataSource_reloadFrontmostPass__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = objc_loadWeakRetained(WeakRetained + 5);
    [v2 reloadNavigationBarAnimated:1];

    id WeakRetained = v3;
  }
}

void __55__PKDashboardPaymentPassDataSource_reloadFrontmostPass__block_invoke_355(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t state64 = 0;
    notify_get_state(a2, &state64);
    if ((state64 != 0) == (WeakRetained[296] == 0))
    {
      WeakRetained[296] = state64 != 0;
      [WeakRetained reloadMessages];
    }
  }
}

void __55__PKDashboardPaymentPassDataSource_reloadFrontmostPass__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "feature", (void)v10) == 2)
          {
            WeakRetained[672] = 1;
            goto LABEL_12;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
}

void __55__PKDashboardPaymentPassDataSource_reloadFrontmostPass__block_invoke_367(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__PKDashboardPaymentPassDataSource_reloadFrontmostPass__block_invoke_2_368;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __55__PKDashboardPaymentPassDataSource_reloadFrontmostPass__block_invoke_2_368(uint64_t a1)
{
  id v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 0;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Updated peer payment account", (uint8_t *)v9, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = (void *)WeakRetained[23];
    id v6 = *(id *)(a1 + 32);
    id v7 = (void *)v4[23];
    v4[23] = v6;
    id v8 = v5;

    *((unsigned char *)v4 + 235) = 1;
    LOBYTE(v5) = [v4 _isDisclosureSectionChanged:v8 newAccount:v4[23]];

    *((unsigned char *)v4 + 744) = (_BYTE)v5;
    [v4 reloadAccount];
  }
}

- (unint64_t)_passFeature
{
  unint64_t result = [(PKAccount *)self->_account feature];
  if (!result)
  {
    unint64_t result = [(PKPaymentPass *)self->_pass associatedAccountFeatureIdentifier];
    if (!result) {
      return [(PKPaymentPass *)self->_pass hasAssociatedPeerPaymentAccount];
    }
  }
  return result;
}

- (void)dealloc
{
  [(PKSecureElement *)self->_secureElement unregisterObserver:self];
  int sessionActiveToken = self->_sessionActiveToken;
  if (sessionActiveToken != -1)
  {
    notify_cancel(sessionActiveToken);
    self->_int sessionActiveToken = -1;
  }
  [(PKPassGroupView *)self->_groupView removePassGroupViewObserver:self];
  id v4 = +[PKUIForegroundActiveArbiter sharedInstance];
  [v4 unregisterObserver:self];

  id v5 = [MEMORY[0x1E4F84688] sharedInstance];
  [v5 removeObserver:self];

  [(PKSpendingSummaryFetcher *)self->_summaryFetcher unregisterObserver:self];
  [(PKAccountService *)self->_accountService unregisterObserver:self];
  id v6 = [MEMORY[0x1E4F84E00] sharedInstance];
  [v6 unregisterObserver:self];

  timerTransactions = self->_timerTransactions;
  if (timerTransactions) {
    dispatch_source_cancel(timerTransactions);
  }
  [(PKLinkedApplication *)self->_linkedApplication removeObserver:self];
  uint64_t v8 = *MEMORY[0x1E4F87000];
  uint64_t v9 = [MEMORY[0x1E4F843E0] reporterForSubject:*MEMORY[0x1E4F87000]];

  if (v9) {
    [MEMORY[0x1E4F843E0] endSubjectReporting:v8];
  }
  v10.receiver = self;
  v10.super_class = (Class)PKDashboardPaymentPassDataSource;
  [(PKDashboardPaymentPassDataSource *)&v10 dealloc];
}

- (void)setDataSourceDelegate:(id)a3
{
}

- (void)executeAfterContentIsLoaded:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (v4)
  {
    aBlock = v4;
    if (self->_allContentIsLoaded)
    {
      v4[2](v4);
    }
    else
    {
      executionBlocksContentIsLoaded = self->_executionBlocksContentIsLoaded;
      id v6 = _Block_copy(v4);
      [(NSMutableArray *)executionBlocksContentIsLoaded addObject:v6];
    }
    id v4 = aBlock;
  }
}

- (NSArray)currentMonthTransactions
{
  return self->_currentMonthTransactions;
}

- (NSArray)pendingPayments
{
  return self->_pendingPayments;
}

- (NSArray)upcomingScheduledPayments
{
  return self->_upcomingScheduledPayments;
}

- (BOOL)_creditAccountItemTypeEnabled:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
    case 3uLL:
      return [(PKAccount *)self->_account accessLevel] == 1;
    case 1uLL:
    case 2uLL:
      return [(PKAccount *)self->_account accessLevel] == 2;
    case 4uLL:
      if ([(PKAccount *)self->_account accessLevel] != 1) {
        goto LABEL_11;
      }
      account = self->_account;
      BOOL result = [(PKAccount *)account supportsSchedulePayment];
      break;
    default:
LABEL_11:
      BOOL result = 0;
      break;
  }
  return result;
}

- (int64_t)_numberOfBalanceDashboardItems
{
  if ([(PKDashboardPaymentPassDataSource *)self _isCreditPass])
  {
    uint64_t v3 = 0;
    int64_t v4 = 0;
    do
      v4 += [(PKDashboardPaymentPassDataSource *)self _creditAccountItemTypeEnabled:v3++];
    while (v3 != 5);
    return v4;
  }
  if ([(PKDashboardPaymentPassDataSource *)self _isPayLaterPass])
  {
    return [(PKDashboardPaymentPassDataSource *)self numberOfPayLaterBalanceDashboardItems];
  }
  else
  {
    if (![(PKDashboardPaymentPassDataSource *)self _isAppleBalancePass])
    {
      if ([(PKDashboardPaymentPassDataSource *)self _isPeerPaymentPass]) {
        return [(PKDashboardPaymentPassDataSource *)self canDisplayPeerPaymentBalanceModule];
      }
      else {
        return 0;
      }
    }
    return [(PKDashboardPaymentPassDataSource *)self numberOfAppleBalanceBalanceDashboardItems];
  }
}

- (BOOL)_balanceSectionHasFooter
{
  if (![(PKDashboardPaymentPassDataSource *)self _isPeerPaymentPass]
    || !self->_peerPaymentAccount
    || !PKPeerPaymentFDICSignageEnabled())
  {
    return 0;
  }

  return PKPeerPaymentAccountIsFDICInsured();
}

- (unint64_t)_creditAccountItemTypeForItemIndex:(unint64_t)a3
{
  unint64_t v5 = 0;
  uint64_t v6 = 0;
  do
  {
    if ([(PKDashboardPaymentPassDataSource *)self _creditAccountItemTypeEnabled:v5])
    {
      if (v6 == a3) {
        return v5;
      }
      ++v6;
    }
    ++v5;
  }
  while (v5 != 5);
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)itemAtIndexPath:(id)a3
{
  id v4 = a3;
  [(PKDashboardPaymentPassDataSource *)self _dataSourceIndicesForIndexPath:v4];
  unint64_t v5 = [[PKDashboardPassGroupItem alloc] initWithGroupView:self->_groupView];

  return v5;
}

- (id)paymentTransactionItemForTransaction:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [PKDashboardPaymentTransactionItem alloc];
  transactionSourceCollection = self->_transactionSourceCollection;
  familyCollection = self->_familyCollection;
  account = self->_account;
  accountUserCollection = self->_accountUserCollection;
  objc_super v10 = [(PKDashboardPaymentPassDataSource *)self bankConnectLinkedAccountData];
  long long v11 = [v10 institution];
  long long v12 = [(PKDashboardPaymentTransactionItem *)v5 initWithTransactionSourceCollection:transactionSourceCollection familyCollection:familyCollection transaction:v4 account:account accountUserCollection:accountUserCollection bankConnectInstitution:v11];

  [(PKDashboardPaymentTransactionItem *)v12 setPhysicalCards:self->_physicalCards];
  long long v13 = [v4 secondaryFundingSourceFPANIdentifier];

  if (v13)
  {
    uint64_t v14 = [(NSMutableDictionary *)self->_sourcesPerFundingSourceIdentifier objectForKey:v13];
    if (!v14)
    {
      uint64_t v15 = [MEMORY[0x1E4F84898] sharedInstance];
      uint64_t v16 = [v15 passWithFPANIdentifier:v13];

      if (v16)
      {
        uint64_t v17 = [objc_alloc(MEMORY[0x1E4F850C0]) initWithPaymentPass:v16];
      }
      else
      {
        uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
      }
      uint64_t v14 = (void *)v17;
      [(NSMutableDictionary *)self->_sourcesPerFundingSourceIdentifier setObject:v17 forKey:v13];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(PKDashboardPaymentTransactionItem *)v12 setSecondaryTransactionSource:v14];
    }
  }

  return v12;
}

- (id)paymentTransactionItemForPendingRequest:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F84CF8];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = [v5 requestToken];
  [v6 setIdentifier:v7];

  uint64_t v8 = [v5 currencyAmount];
  uint64_t v9 = [v8 amount];
  [v6 setAmount:v9];

  objc_super v10 = [v5 currencyAmount];
  long long v11 = [v10 currency];
  [v6 setCurrencyCode:v11];

  [v6 setTransactionType:3];
  [v6 setPeerPaymentType:3];
  [v6 setTransactionStatus:0];
  long long v12 = [v5 requesteeAddress];
  [v6 setPeerPaymentCounterpartHandle:v12];

  long long v13 = [v5 memo];
  [v6 setPeerPaymentMemo:v13];

  uint64_t v14 = [v5 requestDate];
  [v6 setTransactionDate:v14];

  uint64_t v15 = [v5 expiryDate];

  [v6 setExpirationDate:v15];
  [v6 setAccountType:1];
  [v6 setOriginatedByDevice:1];
  [v6 setHasNotificationServiceData:1];
  [v6 setProcessedForLocation:1];
  uint64_t v16 = [(PKDashboardPaymentPassDataSource *)self paymentTransactionItemForTransaction:v6];

  return v16;
}

- (unint64_t)firstSectionIndexForSectionIdentifier:(unint64_t)a3
{
  if (!a3) {
    return 0;
  }
  unint64_t v5 = 0;
  for (uint64_t i = 0; i != a3; ++i)
  {
    dynamicSections = self->_dynamicSections;
    uint64_t v8 = [NSNumber numberWithUnsignedInteger:i];
    uint64_t v9 = [(NSMutableDictionary *)dynamicSections objectForKeyedSubscript:v8];
    objc_super v10 = v9;
    if (!v9) {
      uint64_t v9 = &unk_1EF2B9780;
    }
    uint64_t v11 = [v9 unsignedIntegerValue];

    v5 += v11;
  }
  return v5;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)_dataSourceIndicesForIndexSection:(SEL)a3
{
  id v6 = [MEMORY[0x1E4F28D58] indexPathForItem:PKDataSourceInvalidItemSentinel inSection:a4];
  [(PKDashboardPaymentPassDataSource *)self _dataSourceIndicesForIndexPath:v6];

  return result;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)_dataSourceIndicesForIndexPath:(SEL)a3
{
  id v16 = a4;
  unint64_t v6 = [v16 section];
  uint64_t v7 = 0;
  unint64_t v8 = -1;
  do
  {
    uint64_t v9 = v7;
    ++v8;
    dynamicSections = self->_dynamicSections;
    uint64_t v11 = [NSNumber numberWithUnsignedInteger:v8];
    long long v12 = [(NSMutableDictionary *)dynamicSections objectForKeyedSubscript:v11];
    long long v13 = v12;
    if (!v12) {
      long long v12 = &unk_1EF2B9780;
    }
    uint64_t v14 = [v12 unsignedIntegerValue];

    uint64_t v7 = v14 + v9;
  }
  while (v14 + v9 <= v6);
  retstr->var0 = v8;
  retstr->var1 = v6 - v9;
  retstr->var2 = 0;
  retstr->var2 = [v16 item];

  return result;
}

- (unint64_t)numberOfItemsInSection:(unint64_t)a3
{
  return 1;
}

- (unint64_t)numberOfSections
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dynamicSections = self->_dynamicSections;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__PKDashboardPaymentPassDataSource_numberOfSections__block_invoke;
  v5[3] = &unk_1E59D9808;
  void v5[4] = self;
  v5[5] = &v6;
  [(NSMutableDictionary *)dynamicSections enumerateKeysAndObjectsUsingBlock:v5];
  unint64_t v3 = v7[3] + 18;
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __52__PKDashboardPaymentPassDataSource_numberOfSections__block_invoke(uint64_t result, uint64_t a2, void *a3)
{
  uint64_t v3 = result;
  if (*(unsigned char *)(*(void *)(result + 32) + 748))
  {
    BOOL result = [a3 integerValue];
    uint64_t v4 = result - 1;
  }
  else
  {
    uint64_t v4 = -1;
  }
  *(void *)(*(void *)(*(void *)(v3 + 40) + 8) + 24) += v4;
  return result;
}

- (unint64_t)transactionsCount
{
  return [(NSArray *)self->_transactions count];
}

- (id)titleForSection:(unint64_t)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  uint64_t v57 = 0;
  uint64_t v58 = 0;
  uint64_t v59 = 0;
  [(PKDashboardPaymentPassDataSource *)self _dataSourceIndicesForIndexSection:a3];
  objc_initWeak(&location, self);
  unint64_t v5 = 0;
  id v48 = 0;
  id v49 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  switch(v57)
  {
    case 1:
      if (!self->_allContentIsLoaded) {
        goto LABEL_63;
      }
      tileGroups = self->_tileGroups;
      if (!tileGroups) {
        goto LABEL_63;
      }
      uint64_t v9 = [(NSArray *)tileGroups objectAtIndexedSubscript:v58];
      objc_super v10 = [v9 tiles];
      uint64_t v11 = [v10 count];
      long long v12 = v9;

      if (v11)
      {
        long long v13 = [v9 state];
        uint64_t v14 = [v13 stateTypeGroup];
        uint64_t v45 = [v14 header];
        goto LABEL_69;
      }
      uint64_t v6 = 0;
      id v48 = 0;
      id v49 = 0;
      uint64_t v45 = 0;
      goto LABEL_71;
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
      goto LABEL_65;
    case 10:
      if (!self->_allContentIsLoaded
        || !self->_isShowingPeerPaymentPendingRequests
        || ![(NSArray *)self->_outgoingRequests count])
      {
        goto LABEL_63;
      }
      uint64_t v15 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPen.isa);
      goto LABEL_55;
    case 11:
      if (!self->_allContentIsLoaded
        || ![(PKDashboardPaymentPassDataSource *)self numberOfUpcomingRecurringPeerPayments])
      {
        goto LABEL_63;
      }
      uint64_t v15 = PKLocalizedPeerPaymentRecurringString(&cfstr_DashboardUpcom.isa);
      goto LABEL_55;
    case 12:
      if (!self->_allContentIsLoaded
        || ![(PKDashboardPaymentPassDataSource *)self transactionsCount] && !self->_filterType)
      {
        goto LABEL_63;
      }
      if ([(PKDashboardPaymentPassDataSource *)self isBankConnectLinked])
      {
        uint64_t v15 = PKLocalizedBankConnectString(&cfstr_BankConnectDas_11.isa);
        goto LABEL_55;
      }
      if ([(PKPaymentPass *)self->_pass isIdentityPass])
      {
        uint64_t v15 = PKLocalizedPaymentString(&cfstr_DashboardActiv.isa);
        goto LABEL_55;
      }
      id v46 = PKLocalizedPaymentString(&cfstr_DashboardTrans.isa);
      uint64_t v24 = [(PKAccount *)self->_account feature];
      if (v24 == 2)
      {
        uint64_t v25 = PKLocalizedFeatureString();

        id v46 = (void *)v25;
      }
      if ([(PKDashboardPaymentPassDataSource *)self _canFilterTransactions])
      {
        if (self->_filterType) {
          id v26 = @"line.horizontal.3.decrease.circle.fill";
        }
        else {
          id v26 = @"line.horizontal.3.decrease.circle";
        }
        id v48 = [MEMORY[0x1E4FB1818] systemImageNamed:v26];
        id v49 = [MEMORY[0x1E4FB1618] labelColor];
        if (self->_isShowingPeerPaymentPendingRequests)
        {
          if (self->_shouldDisplayDailyCashFilter) {
            id v27 = &unk_1EF2BA128;
          }
          else {
            id v27 = &unk_1EF2BA140;
          }
        }
        else
        {
          id v27 = &unk_1EF2BA158;
          if (v24 != 2) {
            id v27 = 0;
          }
        }
        id obj = v27;
        id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        uint64_t v35 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
        if (v35)
        {
          uint64_t v36 = *(void *)v53;
          do
          {
            for (uint64_t i = 0; i != v35; ++i)
            {
              if (*(void *)v53 != v36) {
                objc_enumerationMutation(obj);
              }
              id v38 = (void *)[*(id *)(*((void *)&v52 + 1) + 8 * i) integerValue];
              id v39 = @"PEER_PAYMENT_TRANSACTION_FILTER_ALL";
              switch((unint64_t)v38)
              {
                case 0uLL:
                  goto LABEL_88;
                case 1uLL:
                  id v39 = @"PEER_PAYMENT_TRANSACTION_FILTER_DAILY_CASH";
                  goto LABEL_88;
                case 2uLL:
                  id v39 = @"PEER_PAYMENT_TRANSACTION_FILTER_SENT_OR_RECEIVED";
                  goto LABEL_88;
                case 3uLL:
                  id v39 = @"PEER_PAYMENT_TRANSACTION_FILTER_TRANSFERS";
                  goto LABEL_88;
                case 4uLL:
                  id v39 = @"PEER_PAYMENT_TRANSACTION_FILTER_PURCHASES";
LABEL_88:
                  uint64_t v40 = PKLocalizedPeerPaymentString(&v39->isa);
                  goto LABEL_91;
                case 5uLL:
                case 6uLL:
                case 7uLL:
                  uint64_t v40 = PKLocalizedFeatureString();
                  goto LABEL_91;
                case 8uLL:
                  uint64_t v40 = PKLocalizedNearbyPeerPaymentString(&cfstr_PeerPaymentTra_9.isa);
LABEL_91:
                  uint64_t v3 = (void *)v40;
                  break;
                default:
                  break;
              }
              id v41 = (void *)MEMORY[0x1E4FB13F0];
              v50[0] = MEMORY[0x1E4F143A8];
              v50[1] = 3221225472;
              void v50[2] = __52__PKDashboardPaymentPassDataSource_titleForSection___block_invoke;
              v50[3] = &unk_1E59D39D0;
              objc_copyWeak(v51, &location);
              v51[1] = v38;
              id v42 = [v41 actionWithTitle:v3 image:0 identifier:0 handler:v50];
              id v43 = v42;
              if ((void *)self->_filterType == v38) {
                [v42 setState:1];
              }
              id v44 = **((id **)&unk_1E59DA460 + (void)v38);
              [v43 setAccessibilityIdentifier:v44];

              [v22 addObject:v43];
              objc_destroyWeak(v51);
            }
            uint64_t v35 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
          }
          while (v35);
        }
        uint64_t v6 = [MEMORY[0x1E4FB1970] menuWithChildren:v22];
        [v6 setAccessibilityIdentifier:*MEMORY[0x1E4F85578]];
        uint64_t v11 = 2;
LABEL_72:
      }
      else
      {
        uint64_t v6 = 0;
        uint64_t v11 = 0;
        id v48 = 0;
        id v49 = 0;
      }
      int v29 = (void *)v45;
      if (!v45) {
        goto LABEL_74;
      }
      goto LABEL_56;
    case 13:
      if (!self->_allContentIsLoaded) {
        goto LABEL_63;
      }
      if (![(PKDashboardPaymentPassDataSource *)self canDisplayPayLaterUpcomingPayments])goto LABEL_63; {
      id v16 = [(PKDashboardPaymentPassDataSource *)self payLaterUpcomingInstallments];
      }
      BOOL v17 = [v16 count] == 0;

      if (v17) {
        goto LABEL_63;
      }
      uint64_t v18 = @"UPCOMING_PAYMENTS_TITLE";
      goto LABEL_54;
    case 14:
      if (!self->_allContentIsLoaded) {
        goto LABEL_63;
      }
      if (![(PKDashboardPaymentPassDataSource *)self canDisplayPayLaterFinancingPlans])goto LABEL_63; {
      id v19 = [(PKDashboardPaymentPassDataSource *)self financingPlans];
      }
      BOOL v20 = [v19 count] == 0;

      if (v20) {
        goto LABEL_63;
      }
      goto LABEL_53;
    case 15:
      if (!self->_allContentIsLoaded
        || ![(PKDashboardPaymentPassDataSource *)self canDisplayPayLaterFinancingPlans])
      {
        goto LABEL_63;
      }
      id v21 = [(PKDashboardPaymentPassDataSource *)self financingPlans];
      if ([v21 count])
      {

LABEL_63:
        uint64_t v7 = 0;
        id v48 = 0;
        id v49 = 0;
        uint64_t v6 = 0;
LABEL_64:
        unint64_t v5 = 0;
        goto LABEL_65;
      }
      BOOL v28 = [(PKDashboardPaymentPassDataSource *)self completedFinancingPlansCount] > 0;

      if (!v28) {
        goto LABEL_63;
      }
LABEL_53:
      uint64_t v18 = @"INSTALLMENTS_HEADER_TITLE";
LABEL_54:
      uint64_t v15 = PKLocalizedCocoonString(&v18->isa);
LABEL_55:
      int v29 = (void *)v15;
      uint64_t v6 = 0;
      uint64_t v11 = 0;
      id v48 = 0;
      id v49 = 0;
      if (!v15)
      {
LABEL_74:
        uint64_t v7 = 0;
        goto LABEL_64;
      }
LABEL_56:
      uint64_t v7 = v29;
      id v30 = +[PKDashboardHeaderTextItem itemWithHeaderText:v45];
      unint64_t v5 = v30;
      if (v48) {
        [v30 setActionImage:v48];
      }
      if (v6) {
        [v5 setMenu:v6];
      }
      if (v49) {
        [v5 setActionColor:v49];
      }
      [v5 setActionStyle:v11];
LABEL_65:
      objc_destroyWeak(&location);

      return v5;
    case 16:
      if (!self->_allContentIsLoaded || self->_transactionGrouping == 1) {
        goto LABEL_63;
      }
      id v22 = [(NSArray *)self->_transactionGroups objectAtIndex:v58];
      if ([v22 count])
      {
        long long v12 = v22;
        long long v23 = [v22 firstObject];
        long long v13 = [v23 group];

        if ([v13 type] == 3)
        {
          uint64_t v45 = PKLocalizedPaymentString(&cfstr_DashboardAllTr.isa);
        }
        else
        {
          formatterYear = self->_formatterYear;
          uint64_t v14 = [v12 firstObject];
          id v33 = [v14 group];
          id v34 = [v33 startDate];
          uint64_t v45 = [(NSDateFormatter *)formatterYear stringFromDate:v34];

LABEL_69:
        }

        uint64_t v6 = 0;
        uint64_t v11 = 0;
        id v48 = 0;
        id v49 = 0;
LABEL_71:
        id v22 = v12;
      }
      else
      {
        uint64_t v6 = 0;
        uint64_t v11 = 0;
        id v48 = 0;
        id v49 = 0;
        uint64_t v45 = 0;
      }
      goto LABEL_72;
    case 17:
      if (!self->_allContentIsLoaded) {
        goto LABEL_63;
      }
      id v22 = [(NSArray *)self->_auxiliarySectionInfo objectAtIndex:v58];
      uint64_t v45 = [v22 title];
      uint64_t v6 = 0;
      uint64_t v11 = 0;
      id v48 = 0;
      id v49 = 0;
      goto LABEL_72;
    default:
      id v48 = 0;
      id v49 = 0;
      uint64_t v6 = 0;
      uint64_t v7 = 0;
      goto LABEL_65;
  }
}

void __52__PKDashboardPaymentPassDataSource_titleForSection___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[83] = *(id *)(a1 + 40);
    uint64_t v6 = WeakRetained;
    [WeakRetained reloadTransactions];
    [v6 reloadTransactionGroups];
    id v3 = objc_loadWeakRetained(v6 + 5);
    if (v3)
    {
      uint64_t v4 = [v6 firstSectionIndexForSectionIdentifier:12];
      unint64_t v5 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v4];
      [v3 reloadSections:v5];
    }
    id WeakRetained = v6;
  }
}

- (id)footerTextItemForSection:(unint64_t)a3
{
  v46[1] = *MEMORY[0x1E4F143B8];
  uint64_t v43 = 0;
  uint64_t v44 = 0;
  uint64_t v45 = 0;
  -[PKDashboardPaymentPassDataSource _dataSourceIndicesForIndexSection:](self, "_dataSourceIndicesForIndexSection:");
  if (!self->_allContentIsLoaded)
  {
    long long v13 = 0;
    goto LABEL_41;
  }
  unint64_t v5 = 0;
  uint64_t v6 = [(PKDashboardPaymentPassDataSource *)self bankConnectLinkedAccountData];
  uint64_t v7 = [v6 account];

  uint64_t v8 = [v7 balance];
  account = self->_account;
  if (account)
  {
LABEL_5:
    uint64_t v10 = [(PKAccount *)account feature];
    objc_initWeak(&location, self);
    if (v10 == 3)
    {
      long long v13 = [(PKDashboardPaymentPassDataSource *)self payLaterFooterTextItemForSection:a3];
    }
    else
    {
      if (v10 == 2)
      {
        if ([(PKDashboardPaymentPassDataSource *)self numberOfSections] - 1 == a3)
        {
          uint64_t v11 = [(PKAccount *)self->_account creditDetails];
          id v34 = [v11 accountSummary];

          if ([(PKFDICSignageConfiguration *)v34 requiresDebtCollectionNotices])
          {
            long long v12 = PKLocalizedFeatureString();
          }
          else
          {
            long long v12 = 0;
          }
          uint64_t v18 = [(PKDashboardPaymentPassDataSource *)self accounts];
          int v19 = objc_msgSend(v18, "pk_containsObjectPassingTest:", &__block_literal_global_168);

          PKDynamicLocalizedFeatureString();
          id v15 = (id)objc_claimAutoreleasedReturnValue();
          BOOL v20 = @"FDIC_LEGAL_NOTICES_FOOTER";
          if (v19) {
            BOOL v20 = @"FDIC_LEGAL_NOTICES_FOOTER_WITH_SAVINGS";
          }
          id v21 = v20;
          id v22 = PKDynamicLocalizedFeatureString();
          if (objc_msgSend(v12, "length", v15))
          {
            id v23 = [v12 stringByAppendingFormat:@"\n\n%@", v22];
          }
          else
          {
            id v23 = v22;
          }
          unint64_t v5 = v23;

          long long v13 = +[PKDashboardFooterTextItem itemWithFooterText:v5];
          uint64_t v24 = [PKTextRangeHyperlink alloc];
          v39[0] = MEMORY[0x1E4F143A8];
          v39[1] = 3221225472;
          v39[2] = __61__PKDashboardPaymentPassDataSource_footerTextItemForSection___block_invoke_2;
          v39[3] = &unk_1E59D9850;
          uint64_t v25 = v40;
          objc_copyWeak(v40, &location);
          char v41 = v19;
          v40[1] = (id)2;
          id v26 = [(PKTextRangeHyperlink *)v24 initWithLinkText:v15 action:v39];
          v46[0] = v26;
          id v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:1];
          [v13 setSources:v27];

          goto LABEL_37;
        }
      }
      else if ([(PKDashboardPaymentPassDataSource *)self _isPeerPaymentPass])
      {
        int IsFDICInsured = PKPeerPaymentAccountIsFDICInsured();
        if ([(PKDashboardPaymentPassDataSource *)self numberOfSections] - 1 == a3)
        {
          id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          if ((PKPeerPaymentFDICSignageEnabled() ^ 1 | IsFDICInsured))
          {
            id v16 = 0;
          }
          else
          {
            peerPaymentAccountResolutionController = self->_peerPaymentAccountResolutionController;
            if (peerPaymentAccountResolutionController
              && [(PKPeerPaymentAccountResolutionController *)peerPaymentAccountResolutionController currentPeerPaymentAccountResolution] == 2|| PKPeerPaymentAccountCanPerformManualIdentityVerification())
            {
              int v29 = PKLocalizedPeerPaymentString(&cfstr_FdicUnverified.isa);
              id v16 = PKLocalizedPeerPaymentString(&cfstr_FdicUnverified_0.isa, &stru_1EF1B4C70.isa, v29);
              id v30 = [PKTextRangeHyperlink alloc];
              v37[0] = MEMORY[0x1E4F143A8];
              v37[1] = 3221225472;
              v37[2] = __61__PKDashboardPaymentPassDataSource_footerTextItemForSection___block_invoke_3;
              v37[3] = &unk_1E59CA7F8;
              objc_copyWeak(&v38, &location);
              uint64_t v31 = [(PKTextRangeHyperlink *)v30 initWithLinkText:v29 action:v37];
              [v15 addObject:v31];

              objc_destroyWeak(&v38);
            }
            else
            {
              id v16 = PKLocalizedPeerPaymentString(&cfstr_FdicUnverified_1.isa);
            }
          }
          PKDynamicLocalizedPeerPaymentString(&cfstr_FdicLegalNotic_4.isa);
          id v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
          id v22 = PKDynamicLocalizedPeerPaymentString(&cfstr_FdicLegalNotic_2.isa, &stru_1EF1B4C70.isa, v21);
          if ([v16 length])
          {
            id v34 = [v16 stringByAppendingFormat:@"\n\n%@", v22];
          }
          else
          {
            id v34 = v22;
          }

          id v32 = [PKTextRangeHyperlink alloc];
          v35[0] = MEMORY[0x1E4F143A8];
          v35[1] = 3221225472;
          v35[2] = __61__PKDashboardPaymentPassDataSource_footerTextItemForSection___block_invoke_4;
          v35[3] = &unk_1E59CA7F8;
          uint64_t v25 = &v36;
          objc_copyWeak(&v36, &location);
          id v26 = [(PKTextRangeHyperlink *)v32 initWithLinkText:v21 action:v35];
          [v15 addObject:v26];
          long long v13 = +[PKDashboardFooterTextItem itemWithFooterText:v34];
          [v13 setSources:v15];
LABEL_37:

          objc_destroyWeak(v25);
          BOOL v17 = v34;
          goto LABEL_38;
        }
        if (v43 == 2 && self->_balanceSectionHasFooter)
        {
          BOOL v17 = [[PKFDICSignageConfiguration alloc] initWithFeature:1 displayingBankName:1];
          long long v13 = +[PKDashboardFooterTextItem initWithFDICConfiguration:v17];
LABEL_38:

          goto LABEL_39;
        }
      }
      long long v13 = 0;
    }
LABEL_39:
    objc_destroyWeak(&location);
    goto LABEL_40;
  }
  if ([(PKDashboardPaymentPassDataSource *)self _isPeerPaymentPass])
  {
    account = self->_account;
    goto LABEL_5;
  }
  long long v13 = 0;
LABEL_40:

LABEL_41:

  return v13;
}

BOOL __61__PKDashboardPaymentPassDataSource_footerTextItemForSection___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == 4;
}

void __61__PKDashboardPaymentPassDataSource_footerTextItemForSection___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (*(unsigned char *)(a1 + 48)) {
      uint64_t v2 = 5;
    }
    else {
      uint64_t v2 = 0;
    }
    id v3 = [[PKAccountLegalDisclosureViewController alloc] initWithFeature:*(void *)(a1 + 40) associatedAccountFeature:v2];
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v3];
    unint64_t v5 = objc_msgSend(WeakRetained[1], "pkui_viewControllerFromResponderChain");
    [v5 presentViewController:v4 animated:1 completion:0];
  }
}

void __61__PKDashboardPaymentPassDataSource_footerTextItemForSection___block_invoke_3(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v1 = objc_alloc_init(MEMORY[0x1E4F84D60]);
    [v1 setVerificationContext:1];
    [WeakRetained[25] presentFlowForAccountResolution:2 configuration:v1 completion:0];
  }
}

void __61__PKDashboardPaymentPassDataSource_footerTextItemForSection___block_invoke_4(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v1 = [[PKAccountLegalDisclosureViewController alloc] initWithFeature:1];
    uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v1];
    id v3 = objc_msgSend(WeakRetained[1], "pkui_viewControllerFromResponderChain");
    [v3 presentViewController:v2 animated:1 completion:0];
  }
}

- (BOOL)isListLayoutForSection:(unint64_t)a3
{
  return 0;
}

- (id)_deletablePaymentTransactionForItem:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v3 transaction];
    if ([v4 isDeletable]) {
      unint64_t v5 = v4;
    }
    else {
      unint64_t v5 = 0;
    }
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)canDeleteItem:(id)a3
{
  id v3 = [(PKDashboardPaymentPassDataSource *)self _deletablePaymentTransactionForItem:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)deleteItem:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_customDelegate);
  id v9 = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v10 = [(PKDashboardPaymentPassDataSource *)self _deletablePaymentTransactionForItem:v7];

  if (WeakRetained && v9 && v10)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __65__PKDashboardPaymentPassDataSource_deleteItem_completionHandler___block_invoke;
    v11[3] = &unk_1E59D4928;
    id v14 = v6;
    void v11[4] = self;
    id v12 = v10;
    id v13 = v9;
    [WeakRetained presentActivityDeletionConfirmationWithCompletion:v11];
  }
  else if (v6)
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

void __65__PKDashboardPaymentPassDataSource_deleteItem_completionHandler___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 112) limit];
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 72) count];
    unint64_t v5 = *(void **)(*(void *)(a1 + 32) + 112);
    id v6 = [v5 startDate];
    id v7 = [*(id *)(*(void *)(a1 + 32) + 112) endDate];
    [v5 setLimit:v4 + 1 startDate:v6 endDate:v7];

    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 112);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    id v12[2] = __65__PKDashboardPaymentPassDataSource_deleteItem_completionHandler___block_invoke_2;
    v12[3] = &unk_1E59D98C8;
    void v12[4] = v8;
    uint64_t v16 = v3;
    id v13 = *(id *)(a1 + 40);
    id v15 = *(id *)(a1 + 56);
    uint64_t v17 = v4;
    id v14 = *(id *)(a1 + 48);
    [v9 reloadTransactionsWithCompletion:v12];
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 56);
    if (v10)
    {
      uint64_t v11 = *(void (**)(void))(v10 + 16);
      v11();
    }
  }
}

void __65__PKDashboardPaymentPassDataSource_deleteItem_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__PKDashboardPaymentPassDataSource_deleteItem_completionHandler___block_invoke_3;
  block[3] = &unk_1E59D98A0;
  uint64_t v13 = *(void *)(a1 + 64);
  uint64_t v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v9 = v3;
  id v10 = v4;
  id v5 = *(id *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 72);
  id v12 = v5;
  uint64_t v14 = v6;
  id v11 = *(id *)(a1 + 48);
  id v7 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __65__PKDashboardPaymentPassDataSource_deleteItem_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 112);
  uint64_t v3 = *(void *)(a1 + 72);
  uint64_t v4 = [v2 startDate];
  id v5 = [*(id *)(*(void *)(a1 + 32) + 112) endDate];
  [v2 setLimit:v3 startDate:v4 endDate:v5];

  uint64_t v6 = [*(id *)(a1 + 40) indexOfObject:*(void *)(a1 + 48)];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = *(void *)(a1 + 64);
    if (v7)
    {
      uint64_t v8 = *(void (**)(void))(v7 + 16);
      v8();
    }
  }
  else
  {
    uint64_t v9 = v6;
    BOOL v10 = [*(id *)(a1 + 40) count] == *(void *)(a1 + 80) + 1;
    id v11 = (void *)[*(id *)(a1 + 40) mutableCopy];
    [v11 removeObjectAtIndex:v9];
    id v12 = *(void **)(a1 + 56);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __65__PKDashboardPaymentPassDataSource_deleteItem_completionHandler___block_invoke_4;
    v17[3] = &unk_1E59D9878;
    void v17[4] = *(void *)(a1 + 32);
    id v13 = v11;
    id v18 = v13;
    uint64_t v20 = v9;
    id v19 = *(id *)(a1 + 56);
    BOOL v21 = v10;
    [v12 performBatchUpdates:v17 completion:0];
    uint64_t v14 = *(void *)(a1 + 64);
    if (v14) {
      (*(void (**)(uint64_t, uint64_t))(v14 + 16))(v14, 1);
    }
    id v15 = *(void **)(*(void *)(a1 + 32) + 256);
    uint64_t v16 = [*(id *)(a1 + 48) identifier];
    [v15 deletePaymentTransactionWithIdentifier:v16];
  }
}

void __65__PKDashboardPaymentPassDataSource_deleteItem_completionHandler___block_invoke_4(uint64_t a1)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 72);
  *(void *)(v3 + 72) = v2;

  uint64_t v5 = [*(id *)(a1 + 32) firstSectionIndexForSectionIdentifier:12];
  uint64_t v6 = [MEMORY[0x1E4F28D58] indexPathForItem:*(void *)(a1 + 56) inSection:v5];
  uint64_t v7 = *(void **)(a1 + 48);
  v13[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  [v7 deleteItemsAtIndexPaths:v8];

  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", objc_msgSend(*(id *)(a1 + 40), "count") - 1, v5);
    BOOL v10 = *(void **)(a1 + 48);
    id v12 = v9;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
    [v10 insertItemsAtIndexPaths:v11];
  }
}

- (void)reloadFamilyCollection
{
  if ([(PKDashboardPaymentPassDataSource *)self _isCreditPass]
    || [(PKDashboardPaymentPassDataSource *)self _isPeerPaymentPass])
  {
    paymentDataProvider = self->_paymentDataProvider;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __58__PKDashboardPaymentPassDataSource_reloadFamilyCollection__block_invoke;
    v4[3] = &unk_1E59CB328;
    v4[4] = self;
    [(PKPaymentDefaultDataProvider *)paymentDataProvider familyMembersWithCompletion:v4];
  }
}

void __58__PKDashboardPaymentPassDataSource_reloadFamilyCollection__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__PKDashboardPaymentPassDataSource_reloadFamilyCollection__block_invoke_2;
  v6[3] = &unk_1E59CA870;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __58__PKDashboardPaymentPassDataSource_reloadFamilyCollection__block_invoke_2(uint64_t a1)
{
  id v2 = (id)[objc_alloc(MEMORY[0x1E4F84710]) initWithFamilyMembers:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) _updateWithFamilyCollection:v2];
}

- (void)_updateWithFamilyCollection:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_familyCollection, a3);
    self->_familyCollectionLoaded = 1;
    self->_accountPendingFamilyMembersLoaded = 0;
    [(PKDashboardPaymentPassDataSource *)self reloadAccountPendingMembersWithNewMembers:0];
    [(PKDashboardPaymentPassDataSource *)self reloadMessages];
    if (!self->_allContentIsLoaded) {
      [(PKDashboardPaymentPassDataSource *)self updateContentIsLoaded];
    }
  }
}

- (void)reloadAccount
{
}

- (void)reloadAccountWithNewAccount:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([(PKPaymentPass *)self->_pass hasAssociatedPeerPaymentAccount])
  {
    [(PKDashboardPaymentPassDataSource *)self _updateBalance];
    [(PKDashboardPaymentPassDataSource *)self reloadTiles];
    [(PKDashboardPaymentPassDataSource *)self reloadMessages];
    [(PKDashboardPaymentPassDataSource *)self reloadSecondaryMessages];
    [(PKDashboardPaymentPassDataSource *)self reloadFamilyCollection];
    [(PKDashboardPaymentPassDataSource *)self reloadAuxiliaryItems];
    [(PKDashboardPaymentPassDataSource *)self reloadAccounts];
    objc_initWeak((id *)location, self);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __64__PKDashboardPaymentPassDataSource_reloadAccountWithNewAccount___block_invoke;
    v33[3] = &unk_1E59CB010;
    objc_copyWeak(&v34, (id *)location);
    void v33[4] = self;
    [(PKDashboardPaymentPassDataSource *)self reloadRecurringPeerPaymentsWithCompletion:v33];
    [(PKDashboardPaymentPassDataSource *)self reloadDisclosuresSectionIfNeeded];
    objc_destroyWeak(&v34);
    objc_destroyWeak((id *)location);
  }
  else
  {
    uint64_t v6 = [(PKPaymentPass *)self->_pass associatedAccountServiceAccountIdentifier];

    if (v6)
    {
      if (!self->_performingAccountUpdate)
      {
        if ([(PKPassPresentationContext *)self->_context limitServerLoad]) {
          double v7 = 86400.0;
        }
        else {
          double v7 = 300.0;
        }
        p_account = &self->_account;
        if (self->_account
          && ([(PKDashboardPaymentPassDataSource *)self _isCreditPass]
           || [(PKDashboardPaymentPassDataSource *)self _isPayLaterPass]
           || [(PKDashboardPaymentPassDataSource *)self _isAppleBalancePass]))
        {
          uint64_t v9 = [MEMORY[0x1E4F1C9C8] date];
          BOOL v10 = [(PKAccount *)*p_account lastUpdated];
          [v9 timeIntervalSinceDate:v10];
          BOOL v12 = v11 > v7 || self->_accountUpdateError != 0;
        }
        else
        {
          BOOL v12 = 0;
        }
        id v13 = [(PKPaymentPass *)self->_pass associatedAccountServiceAccountIdentifier];
        BOOL v14 = self->_account != 0;
        objc_initWeak(&from, self);
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __64__PKDashboardPaymentPassDataSource_reloadAccountWithNewAccount___block_invoke_2;
        aBlock[3] = &unk_1E59D98F0;
        objc_copyWeak(v29, &from);
        BOOL v30 = v14;
        BOOL v31 = v12;
        v29[1] = *(id *)&v7;
        id v15 = (void (**)(void *, id, void))_Block_copy(aBlock);
        self->_performingAccountUpdate = 1;
        if (v5)
        {
          objc_storeStrong((id *)&self->_account, a3);
          v15[2](v15, v5, 0);
        }
        else
        {
          uint64_t v16 = PKLogFacilityTypeGetObject();
          BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
          if (v12)
          {
            if (v17)
            {
              id v18 = [(PKAccount *)*p_account lastUpdated];
              id v19 = [v18 description];
              *(_DWORD *)id location = 134218242;
              *(void *)&location[4] = self;
              __int16 v36 = 2112;
              id v37 = v19;
              _os_log_impl(&dword_19F450000, v16, OS_LOG_TYPE_DEFAULT, "Dashboard (%p): Updating account, last update: %@", location, 0x16u);
            }
            accountService = self->_accountService;
            v26[0] = MEMORY[0x1E4F143A8];
            v26[1] = 3221225472;
            v26[2] = __64__PKDashboardPaymentPassDataSource_reloadAccountWithNewAccount___block_invoke_522;
            v26[3] = &unk_1E59D9918;
            id v27 = v15;
            [(PKAccountService *)accountService updateAccountWithIdentifier:v13 extended:0 completion:v26];
          }
          else
          {
            if (v17)
            {
              *(_DWORD *)id location = 134217984;
              *(void *)&location[4] = self;
              _os_log_impl(&dword_19F450000, v16, OS_LOG_TYPE_DEFAULT, "Dashboard (%p): Fetching local account", location, 0xCu);
            }

            BOOL v21 = self->_accountService;
            v22[0] = MEMORY[0x1E4F143A8];
            v22[1] = 3221225472;
            v22[2] = __64__PKDashboardPaymentPassDataSource_reloadAccountWithNewAccount___block_invoke_523;
            v22[3] = &unk_1E59CD410;
            objc_copyWeak(&v25, &from);
            uint64_t v24 = v15;
            id v23 = v13;
            [(PKAccountService *)v21 accountWithIdentifier:v23 completion:v22];

            objc_destroyWeak(&v25);
          }
        }

        objc_destroyWeak(v29);
        objc_destroyWeak(&from);
      }
    }
    else
    {
      [(PKDashboardPaymentPassDataSource *)self _updateBalance];
      [(PKDashboardPaymentPassDataSource *)self reloadTiles];
      [(PKDashboardPaymentPassDataSource *)self reloadMessages];
      [(PKDashboardPaymentPassDataSource *)self reloadSecondaryMessages];
      [(PKDashboardPaymentPassDataSource *)self reloadAuxiliaryItems];
      [(PKDashboardPaymentPassDataSource *)self reloadAccounts];
      [(PKDashboardPaymentPassDataSource *)self reloadRecurringPeerPaymentsWithCompletion:&__block_literal_global_529];
      [(PKDashboardPaymentPassDataSource *)self reloadHomeKitRestrictedGuestAccessState];
    }
  }
}

void __64__PKDashboardPaymentPassDataSource_reloadAccountWithNewAccount___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [*(id *)(a1 + 32) reloadMessages];
    id WeakRetained = v3;
  }
}

void __64__PKDashboardPaymentPassDataSource_reloadAccountWithNewAccount___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PKDashboardPaymentPassDataSource_reloadAccountWithNewAccount___block_invoke_3;
  block[3] = &unk_1E59D1A20;
  objc_copyWeak(v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  __int16 v13 = *(_WORD *)(a1 + 48);
  v12[1] = *(id *)(a1 + 40);
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(v12);
}

void __64__PKDashboardPaymentPassDataSource_reloadAccountWithNewAccount___block_invoke_3(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 48);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained) {
    goto LABEL_56;
  }
  uint64_t v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = @"YES";
    uint64_t v6 = *(void *)(a1 + 40);
    if (!*(void *)(a1 + 32)) {
      id v5 = @"NO";
    }
    *(_DWORD *)buf = 134218498;
    uint64_t v35 = WeakRetained;
    __int16 v36 = 2114;
    id v37 = v5;
    __int16 v38 = 2114;
    uint64_t v39 = v6;
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Dashboard (%p): Processing account %{public}@, error: %{public}@", buf, 0x20u);
  }

  *((unsigned char *)WeakRetained + 749) = 0;
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7)
  {
    uint64_t v8 = +[PKAccountFlowController displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:](PKAccountFlowController, "displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:", v7, [WeakRetained[49] feature], 0, 0);
    id v9 = WeakRetained[111];
    WeakRetained[111] = (id)v8;
  }
  else
  {
    id v9 = WeakRetained[111];
    WeakRetained[111] = 0;
  }

  id v10 = *(void **)(a1 + 32);
  if (!v10)
  {
    LOBYTE(v12) = 0;
    BOOL v11 = 0;
    if (WeakRetained[49]) {
      goto LABEL_54;
    }
    goto LABEL_51;
  }
  if (*(unsigned char *)(a1 + 64) || *(unsigned char *)(a1 + 65))
  {
    if ([v10 isContentEqualToAccount:WeakRetained[49]])
    {
LABEL_13:
      BOOL v11 = 0;
      goto LABEL_29;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Dashboard account has changed", buf, 2u);
    }

    BOOL v11 = 0;
    *((unsigned char *)WeakRetained + 235) = 1;
    *((unsigned char *)WeakRetained + 744) = 1;
  }
  else
  {
    if ([WeakRetained _isCreditPass])
    {
      uint64_t v13 = [*(id *)(a1 + 32) creditDetails];
    }
    else if ([WeakRetained _isPayLaterPass])
    {
      uint64_t v13 = [*(id *)(a1 + 32) payLaterDetails];
    }
    else
    {
      if (![WeakRetained _isAppleBalancePass]) {
        goto LABEL_13;
      }
      uint64_t v13 = [*(id *)(a1 + 32) appleBalanceDetails];
    }
    BOOL v14 = (void *)v13;
    if (v13)
    {
      id v15 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v16 = [*(id *)(a1 + 32) lastUpdated];
      [v15 timeIntervalSinceDate:v16];
      BOOL v11 = v17 > *(double *)(a1 + 56);
    }
    else
    {
      BOOL v11 = 0;
    }
  }
LABEL_29:
  if ([WeakRetained _canDisplayBalance]) {
    uint64_t v18 = [WeakRetained _numberOfBalanceDashboardItems];
  }
  else {
    uint64_t v18 = 0;
  }
  objc_storeStrong(WeakRetained + 49, *(id *)(a1 + 32));
  objc_msgSend(WeakRetained[85], "setFeatureIdentifier:", objc_msgSend(*(id *)(a1 + 32), "feature"));
  if ([WeakRetained _canDisplayBalance]) {
    uint64_t v19 = [WeakRetained _numberOfBalanceDashboardItems];
  }
  else {
    uint64_t v19 = 0;
  }
  if (*(unsigned char *)(a1 + 64)) {
    BOOL v20 = v18 == v19;
  }
  else {
    BOOL v20 = 1;
  }
  int v12 = !v20;
  BOOL v21 = [WeakRetained[49] creditDetails];
  id v22 = [v21 accountSummary];
  uint64_t v23 = [v22 currentStatement];
  id v24 = WeakRetained[51];
  WeakRetained[51] = (id)v23;

  if ([WeakRetained _isCreditPass])
  {
    id v25 = WeakRetained[50];
    if (v25) {
      [v25 updateWithAccount:*(void *)(a1 + 32)];
    }
    if (!WeakRetained[58])
    {
      id v26 = [[PKInboxDataSource alloc] initWithDelegate:WeakRetained];
      id v27 = WeakRetained[58];
      WeakRetained[58] = v26;
    }
  }
  id v28 = objc_loadWeakRetained(WeakRetained + 5);
  char v29 = objc_opt_respondsToSelector();

  if (v29)
  {
    id v30 = objc_loadWeakRetained(WeakRetained + 5);
    [v30 accountDidUpdate:*(void *)(a1 + 32)];
  }
  if (WeakRetained[49])
  {
    if (!v12) {
      goto LABEL_54;
    }
LABEL_53:
    [WeakRetained _updateBalance];
    goto LABEL_54;
  }
LABEL_51:
  if (![WeakRetained _isCreditPass] || (v12 & 1) != 0) {
    goto LABEL_53;
  }
LABEL_54:
  [WeakRetained reloadTiles];
  [WeakRetained reloadAuxiliaryItems];
  [WeakRetained reloadAccounts];
  [WeakRetained reloadRecurringPeerPaymentsWithCompletion:&__block_literal_global_519];
  [WeakRetained reloadFamilyCollection];
  [WeakRetained reloadMessages];
  [WeakRetained reloadSecondaryMessages];
  [WeakRetained reloadScheduledPayments];
  [WeakRetained reloadCreditRecoveryPaymentPlans];
  [WeakRetained reloadAccountPendingMembersWithNewMembers:WeakRetained[56]];
  [WeakRetained reloadAccountUsersWithNewAccountUserCollection:WeakRetained[95]];
  [WeakRetained reloadAccountUserInvitationsWithNewAccountUserInvitations:WeakRetained[96]];
  [WeakRetained reloadPhysicalCardsWithNewPhysicalCards:WeakRetained[97]];
  [WeakRetained _updateTransactionSourceCollection];
  [WeakRetained reloadFinancingPlans];
  [WeakRetained reloadAppleBalance];
  [WeakRetained reloadDisclosuresSectionIfNeeded];
  [WeakRetained _updateAccountRewardsDataIfNecessary];
  if (v11)
  {
    dispatch_time_t v31 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__PKDashboardPaymentPassDataSource_reloadAccountWithNewAccount___block_invoke_2_520;
    block[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v33, v2);
    dispatch_after(v31, MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v33);
  }
LABEL_56:
}

void __64__PKDashboardPaymentPassDataSource_reloadAccountWithNewAccount___block_invoke_2_520(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadAccount];
}

uint64_t __64__PKDashboardPaymentPassDataSource_reloadAccountWithNewAccount___block_invoke_522(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __64__PKDashboardPaymentPassDataSource_reloadAccountWithNewAccount___block_invoke_523(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PKDashboardPaymentPassDataSource_reloadAccountWithNewAccount___block_invoke_2_524;
  block[3] = &unk_1E59CD3E8;
  objc_copyWeak(&v14, a1 + 6);
  id v10 = v5;
  id v11 = v6;
  id v13 = a1[5];
  id v12 = a1[4];
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v14);
}

void __64__PKDashboardPaymentPassDataSource_reloadAccountWithNewAccount___block_invoke_2_524(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_OWORD *)(a1 + 32) == 0 && !WeakRetained[146]) {
      goto LABEL_16;
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    if (v3[146]) {
      goto LABEL_13;
    }
    uint64_t v4 = *(void **)(a1 + 32);
    if (v4)
    {
      if ([v4 feature] != 4 || (objc_msgSend(*(id *)(a1 + 32), "isCloudAccount") & 1) == 0) {
        goto LABEL_13;
      }
    }
    else
    {
LABEL_16:
      if (*(void *)(a1 + 40)) {
        goto LABEL_13;
      }
    }
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      uint64_t v12 = v6;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Dashboard updating all accounts since account id %@ is missing from the device.", buf, 0xCu);
    }

    v3[146] = 1;
    id v7 = (void *)*((void *)v3 + 115);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __64__PKDashboardPaymentPassDataSource_reloadAccountWithNewAccount___block_invoke_525;
    v8[3] = &unk_1E59D0068;
    id v9 = *(id *)(a1 + 48);
    id v10 = *(id *)(a1 + 56);
    [v7 updateAccountsWithCompletion:v8];
  }
LABEL_13:
}

void __64__PKDashboardPaymentPassDataSource_reloadAccountWithNewAccount___block_invoke_525(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __64__PKDashboardPaymentPassDataSource_reloadAccountWithNewAccount___block_invoke_2_526;
  v13[3] = &unk_1E59D1DD8;
  id v14 = *(id *)(a1 + 32);
  id v6 = a3;
  id v7 = objc_msgSend(a2, "pk_firstObjectPassingTest:", v13);
  id v8 = PKLogFacilityTypeGetObject();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = v10;
      id v11 = "Successfully fetched account %@ after it was missing from the local device.";
LABEL_6:
      _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, v11, buf, 0xCu);
    }
  }
  else if (v9)
  {
    uint64_t v12 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v16 = v12;
    id v11 = "Error fetching account %@ after it was missing from the local device.";
    goto LABEL_6;
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __64__PKDashboardPaymentPassDataSource_reloadAccountWithNewAccount___block_invoke_2_526(uint64_t a1, void *a2)
{
  id v3 = [a2 accountIdentifier];
  uint64_t v4 = *(void **)(a1 + 32);
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

- (void)reloadScheduledPayments
{
  if ([(PKDashboardPaymentPassDataSource *)self _isCreditPass])
  {
    account = self->_account;
    if (account)
    {
      if (([(PKAccount *)account accessLevel] | 2) == 2)
      {
        self->_scheduledPaymentsLoaded = 1;
        if (!self->_allContentIsLoaded)
        {
          [(PKDashboardPaymentPassDataSource *)self updateContentIsLoaded];
        }
      }
      else
      {
        objc_initWeak(&location, self);
        accountService = self->_accountService;
        id v5 = [(PKAccount *)self->_account accountIdentifier];
        v6[0] = MEMORY[0x1E4F143A8];
        v6[1] = 3221225472;
        v6[2] = __59__PKDashboardPaymentPassDataSource_reloadScheduledPayments__block_invoke;
        v6[3] = &unk_1E59D1D88;
        objc_copyWeak(&v7, &location);
        [(PKAccountService *)accountService scheduledPaymentsWithAccountIdentifier:v5 includeFailedRecurringPayments:1 completion:v6];

        objc_destroyWeak(&v7);
        objc_destroyWeak(&location);
      }
    }
  }
}

void __59__PKDashboardPaymentPassDataSource_reloadScheduledPayments__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__PKDashboardPaymentPassDataSource_reloadScheduledPayments__block_invoke_2;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __59__PKDashboardPaymentPassDataSource_reloadScheduledPayments__block_invoke_2(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
    id v4 = objc_alloc(MEMORY[0x1E4F1C9A8]);
    id v5 = (void *)[v4 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
    char v41 = WeakRetained;
    id v6 = [WeakRetained[49] creditDetails];
    id v7 = [v6 productTimeZone];
    [v5 setTimeZone:v7];

    uint64_t v40 = (void *)v3;
    __int16 v38 = [v5 components:28 fromDate:v3];
    uint64_t v39 = v5;
    uint64_t v8 = [v5 dateFromComponents:v38];
    id obj = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v43 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v46 objects:v50 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v47 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          id v15 = [v14 scheduleDetails];
          uint64_t v16 = [v15 frequency];

          uint64_t v17 = [v14 scheduleDetails];
          uint64_t v18 = [v17 scheduledDate];

          BOOL v21 = [v18 compare:v8] == -1 || v16 == 1 || v16 == 0;
          int v22 = [v14 isRecurring];
          if (v22) {
            BOOL v23 = [v14 state] == 4;
          }
          else {
            BOOL v23 = 0;
          }
          if (!v21 && !v23) {
            [obj addObject:v14];
          }
          if (v22) {
            [v43 addObject:v14];
          }
          if (v16 == 1) {
            [v42 addObject:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v46 objects:v50 count:16];
      }
      while (v11);
    }

    uint64_t v24 = [v43 copy];
    id WeakRetained = v41;
    id v25 = v41[103];
    v41[103] = (id)v24;

    uint64_t v26 = [v42 copy];
    id v27 = v41[53];
    v41[53] = (id)v26;

    [obj sortUsingComparator:&__block_literal_global_533];
    char v28 = PKEqualObjects();
    if ((v28 & 1) == 0)
    {
      char v29 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v29, OS_LOG_TYPE_DEFAULT, "Dashboard scheduled payments have changed", buf, 2u);
      }
    }
    objc_storeStrong(v41 + 52, obj);
    *((unsigned char *)v41 + 472) = 1;
    if (*((unsigned char *)v41 + 748))
    {
      id v30 = objc_loadWeakRetained(v41 + 5);
      if (v30)
      {
        uint64_t v31 = [v41 firstSectionIndexForSectionIdentifier:2];
        if (v28)
        {
          uint64_t v32 = [v41 numberOfItemsInSection:v31];
          if (v32)
          {
            uint64_t v33 = v32;
            for (uint64_t j = 0; j != v33; ++j)
            {
              uint64_t v35 = [MEMORY[0x1E4F28D58] indexPathForItem:j inSection:v31];
              __int16 v36 = [v41 itemAtIndexPath:v35];
              [v30 itemChanged:v36 atIndexPath:v35];
            }
          }
        }
        else
        {
          id v37 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v31];
          [v30 reloadSections:v37];
        }
      }
    }
    else
    {
      [v41 updateContentIsLoaded];
    }
  }
}

uint64_t __59__PKDashboardPaymentPassDataSource_reloadScheduledPayments__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 scheduleDetails];
  id v6 = [v5 scheduledDate];
  id v7 = [v4 scheduleDetails];

  uint64_t v8 = [v7 scheduledDate];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

- (void)_updateTransactionSourceCollection
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (![(PKDashboardPaymentPassDataSource *)self _isCreditPass]
    || self->_account && self->_accountUsersLoaded)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F850C0]) initWithPaymentPass:self->_pass];
    [v3 addObject:v4];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v5 = [(PKAccountUserCollection *)self->_accountUserCollection accountUsers];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F850C0]) initWithAccountUser:*(void *)(*((void *)&v24 + 1) + 8 * i)];
          [v3 addObject:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v30 count:16];
      }
      while (v7);
    }

    uint64_t v11 = self->_transactionSourceCollection;
    id v12 = objc_alloc(MEMORY[0x1E4F850C8]);
    uint64_t v13 = (void *)[v3 copy];
    id v14 = (void *)[v12 initWithTransactionSources:v13];

    unint64_t v15 = [(PKDashboardPaymentPassDataSource *)self transactionsCount];
    BOOL v16 = [(PKDashboardPaymentPassDataSource *)self _canShowTransactions];
    if (!PKEqualObjects() || (((v15 == 0) ^ v16) & 1) == 0)
    {
      uint64_t v17 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        char v29 = v14;
        _os_log_impl(&dword_19F450000, v17, OS_LOG_TYPE_DEFAULT, "Dashboard transaction source manager has changed %@.", buf, 0xCu);
      }

      objc_storeStrong((id *)&self->_transactionSourceCollection, v14);
      accountResolutionController = self->_accountResolutionController;
      self->_accountResolutionController = 0;

      [(PKDashboardTransactionFetcher *)self->_transactionFetcher setDelegate:0];
      uint64_t v19 = (PKDashboardTransactionFetcher *)[objc_alloc(MEMORY[0x1E4F84620]) initWithTransactionSourceCollection:self->_transactionSourceCollection paymentDataProvider:self->_paymentDataProvider];
      transactionFetcher = self->_transactionFetcher;
      self->_transactionFetcher = v19;

      [(PKDashboardTransactionFetcher *)self->_transactionFetcher setDelegate:self];
      BOOL v21 = (PKDashboardTransactionFetcher *)[objc_alloc(MEMORY[0x1E4F84620]) initWithTransactionSourceCollection:self->_transactionSourceCollection paymentDataProvider:self->_paymentDataProvider];
      currentMonthFetcher = self->_currentMonthFetcher;
      self->_currentMonthFetcher = v21;

      if ([(PKDashboardPaymentPassDataSource *)self _isCreditPass])
      {
        [(PKSpendingSummaryFetcher *)self->_summaryFetcher unregisterObserver:self];
        summaryFetcher = self->_summaryFetcher;
        self->_summaryFetcher = 0;
      }
      [(PKDashboardPaymentPassDataSource *)self reloadTransactions];
      [(PKDashboardPaymentPassDataSource *)self reloadTransactionGroups];
      if (!self->_allContentIsLoaded) {
        [(PKDashboardPaymentPassDataSource *)self updateContentIsLoaded];
      }
    }
  }
}

- (void)reloadPhysicalCardsWithNewPhysicalCards:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKDashboardPaymentPassDataSource *)self _isCreditPass];
  if (v5 && self->_account)
  {
    if (v4)
    {
      __76__PKDashboardPaymentPassDataSource_reloadPhysicalCardsWithNewPhysicalCards___block_invoke(v5, self, v4);
    }
    else
    {
      objc_initWeak(&location, self);
      accountService = self->_accountService;
      uint64_t v7 = [(PKAccount *)self->_account accountIdentifier];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __76__PKDashboardPaymentPassDataSource_reloadPhysicalCardsWithNewPhysicalCards___block_invoke_540;
      v8[3] = &unk_1E59D1700;
      objc_copyWeak(&v10, &location);
      id v9 = &__block_literal_global_538;
      [(PKAccountService *)accountService physicalCardsForAccountWithIdentifier:v7 completion:v8];

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
}

void __76__PKDashboardPaymentPassDataSource_reloadPhysicalCardsWithNewPhysicalCards___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  char v6 = PKEqualObjects();
  if ((v6 & 1) == 0)
  {
    uint64_t v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Dashboard physical cards have changed", v13, 2u);
    }
  }
  uint64_t v8 = [v5 copy];
  id v9 = (void *)v4[97];
  v4[97] = v8;

  *((unsigned char *)v4 + 443) = 1;
  id v10 = (void *)v4[50];
  if (v10)
  {
    [v10 updateWithPhysicalCards:v4[97]];
  }
  else
  {
    uint64_t v11 = [[PKPhysicalCardController alloc] initWithAccountService:v4[115] paymentPass:v4[110] account:v4[49] accountUser:0 physicalCards:v4[97]];
    id v12 = (void *)v4[50];
    v4[50] = v11;
  }
  if (!*((unsigned char *)v4 + 748))
  {
    [v4 updateContentIsLoaded];
    if (v6) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if ((v6 & 1) == 0) {
LABEL_10:
  }
    [v4 reloadMessages];
LABEL_11:
}

void __76__PKDashboardPaymentPassDataSource_reloadPhysicalCardsWithNewPhysicalCards___block_invoke_540(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__PKDashboardPaymentPassDataSource_reloadPhysicalCardsWithNewPhysicalCards___block_invoke_2;
  block[3] = &unk_1E59CA960;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
}

void __76__PKDashboardPaymentPassDataSource_reloadPhysicalCardsWithNewPhysicalCards___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id WeakRetained = v3;
  }
}

- (void)reloadAccountUsersWithNewAccountUserCollection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKDashboardPaymentPassDataSource *)self _isCreditPass];
  if (v5 && self->_account)
  {
    if (v4)
    {
      __83__PKDashboardPaymentPassDataSource_reloadAccountUsersWithNewAccountUserCollection___block_invoke(v5, self, v4);
    }
    else
    {
      objc_initWeak(&location, self);
      accountService = self->_accountService;
      id v7 = [(PKAccount *)self->_account accountIdentifier];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __83__PKDashboardPaymentPassDataSource_reloadAccountUsersWithNewAccountUserCollection___block_invoke_545;
      v8[3] = &unk_1E59D1700;
      objc_copyWeak(&v10, &location);
      id v9 = &__block_literal_global_544;
      [(PKAccountService *)accountService accountUsersForAccountWithIdentifier:v7 completion:v8];

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
}

void __83__PKDashboardPaymentPassDataSource_reloadAccountUsersWithNewAccountUserCollection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  char v6 = PKEqualObjects();
  if ((v6 & 1) == 0)
  {
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Dashboard account users have changed", v9, 2u);
    }
  }
  id v8 = (void *)v4[95];
  v4[95] = v5;

  *((unsigned char *)v4 + 441) = 1;
  [v4 _updateTransactionSourceCollection];
  if (!*((unsigned char *)v4 + 748))
  {
    [v4 updateContentIsLoaded];
    if (v6) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if ((v6 & 1) == 0) {
LABEL_7:
  }
    [v4 reloadMessages];
LABEL_8:
}

void __83__PKDashboardPaymentPassDataSource_reloadAccountUsersWithNewAccountUserCollection___block_invoke_545(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__PKDashboardPaymentPassDataSource_reloadAccountUsersWithNewAccountUserCollection___block_invoke_2;
  block[3] = &unk_1E59CB038;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
}

void __83__PKDashboardPaymentPassDataSource_reloadAccountUsersWithNewAccountUserCollection___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v2 = (void *)[objc_alloc(MEMORY[0x1E4F842C8]) initWithAccountUsers:*(void *)(a1 + 32)];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)reloadAccountUserInvitationsWithNewAccountUserInvitations:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKDashboardPaymentPassDataSource *)self _isCreditPass];
  if (v5 && self->_account)
  {
    if (v4)
    {
      __94__PKDashboardPaymentPassDataSource_reloadAccountUserInvitationsWithNewAccountUserInvitations___block_invoke(v5, self, v4);
    }
    else
    {
      objc_initWeak(&location, self);
      paymentDataProvider = self->_paymentDataProvider;
      id v7 = [(PKAccount *)self->_account accountIdentifier];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __94__PKDashboardPaymentPassDataSource_reloadAccountUserInvitationsWithNewAccountUserInvitations___block_invoke_550;
      v8[3] = &unk_1E59CC358;
      objc_copyWeak(&v10, &location);
      id v9 = &__block_literal_global_549;
      [(PKPaymentDefaultDataProvider *)paymentDataProvider featureApplicationsForAccountIdentifier:v7 completion:v8];

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
}

void __94__PKDashboardPaymentPassDataSource_reloadAccountUserInvitationsWithNewAccountUserInvitations___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  char v6 = PKEqualObjects();
  if ((v6 & 1) == 0)
  {
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Dashboard account user invitations have changed", v10, 2u);
    }
  }
  uint64_t v8 = [v5 copy];
  id v9 = (void *)v4[96];
  v4[96] = v8;

  *((unsigned char *)v4 + 442) = 1;
  if (!*((unsigned char *)v4 + 748))
  {
    [v4 updateContentIsLoaded];
    if (v6) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if ((v6 & 1) == 0) {
LABEL_7:
  }
    [v4 reloadMessages];
LABEL_8:
}

void __94__PKDashboardPaymentPassDataSource_reloadAccountUserInvitationsWithNewAccountUserInvitations___block_invoke_550(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(a2, "pk_objectsPassingTest:", &__block_literal_global_553);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94__PKDashboardPaymentPassDataSource_reloadAccountUserInvitationsWithNewAccountUserInvitations___block_invoke_3;
  block[3] = &unk_1E59CA960;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
}

BOOL __94__PKDashboardPaymentPassDataSource_reloadAccountUserInvitationsWithNewAccountUserInvitations___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 applicationType] == 2;
}

void __94__PKDashboardPaymentPassDataSource_reloadAccountUserInvitationsWithNewAccountUserInvitations___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id WeakRetained = v3;
  }
}

- (void)reloadAccountPendingMembersWithNewMembers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKDashboardPaymentPassDataSource *)self _isCreditPass];
  if (v5 && self->_account)
  {
    if (v4)
    {
      __78__PKDashboardPaymentPassDataSource_reloadAccountPendingMembersWithNewMembers___block_invoke(v5, self, v4);
    }
    else
    {
      objc_initWeak(&location, self);
      accountService = self->_accountService;
      id v7 = [(PKAccount *)self->_account accountIdentifier];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __78__PKDashboardPaymentPassDataSource_reloadAccountPendingMembersWithNewMembers___block_invoke_556;
      v8[3] = &unk_1E59CB060;
      objc_copyWeak(&v10, &location);
      id v9 = &__block_literal_global_555;
      [(PKAccountService *)accountService accountPendingFamilyMembersForAccountIdentifier:v7 completion:v8];

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
}

void __78__PKDashboardPaymentPassDataSource_reloadAccountPendingMembersWithNewMembers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  char v6 = PKEqualObjects();
  if ((v6 & 1) == 0)
  {
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Dashboard account pending family members have changed", v9, 2u);
    }
  }
  id v8 = (void *)v4[56];
  v4[56] = v5;

  *((unsigned char *)v4 + 456) = 1;
  if (!*((unsigned char *)v4 + 748))
  {
    [v4 updateContentIsLoaded];
    if (v6) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if ((v6 & 1) == 0) {
LABEL_7:
  }
    [v4 reloadMessages];
LABEL_8:
}

void __78__PKDashboardPaymentPassDataSource_reloadAccountPendingMembersWithNewMembers___block_invoke_556(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__PKDashboardPaymentPassDataSource_reloadAccountPendingMembersWithNewMembers___block_invoke_2;
  block[3] = &unk_1E59CA960;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
}

void __78__PKDashboardPaymentPassDataSource_reloadAccountPendingMembersWithNewMembers___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id WeakRetained = v3;
  }
}

- (void)_updateAccountRewardsDataIfNecessary
{
  if (PKRewardsCenterEnabled())
  {
    id v3 = [(PKAccount *)self->_account accountIdentifier];
    if (v3)
    {
      if ([(PKAccount *)self->_account feature] == 2 && !self->_hasUpdatedAccountRewardsDataIfNecessary)
      {
        self->_hasUpdatedAccountRewardsDataIfNecessary = 1;
        [(PKDashboardPaymentPassDataSource *)self _updateAccountPromotions];
        [(PKDashboardPaymentPassDataSource *)self _updateAccountEnhancedMerchants];
      }
    }
    else
    {
      id v4 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v5 = 0;
        _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Unexpected nil account identifier. Not fetching promotions.", v5, 2u);
      }
    }
  }
}

- (void)_updateAccountPromotions
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = [(PKAccount *)self->_account accountIdentifier];
  if ([(PKAccount *)self->_account showCardPromotions])
  {
    accountService = self->_accountService;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __60__PKDashboardPaymentPassDataSource__updateAccountPromotions__block_invoke;
    v6[3] = &unk_1E59D3F78;
    id v7 = v3;
    [(PKAccountService *)accountService updateAccountPromotionsForAccountWithIdentifier:v7 observeCooldownPeriod:1 completion:v6];
    id v5 = v7;
  }
  else
  {
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Not fetching promotions for account %@ because it is not a supported feature on this account", buf, 0xCu);
    }
  }
}

void __60__PKDashboardPaymentPassDataSource__updateAccountPromotions__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = a3;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Updated account promotions at pass load for account %@. Error: %@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)_updateAccountEnhancedMerchants
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = [(PKAccount *)self->_account accountIdentifier];
  if ([(PKAccount *)self->_account showEnhancedMerchants])
  {
    accountService = self->_accountService;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __67__PKDashboardPaymentPassDataSource__updateAccountEnhancedMerchants__block_invoke;
    v6[3] = &unk_1E59D3F78;
    int v7 = v3;
    [(PKAccountService *)accountService updateAccountEnhancedMerchantsForAccountWithIdentifier:v7 cooldownLevel:2 completion:v6];
    id v5 = v7;
  }
  else
  {
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v9 = v3;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Not fetching enhanced merchants for account %@ because it is not a supported feature on this account", buf, 0xCu);
    }
  }
}

void __67__PKDashboardPaymentPassDataSource__updateAccountEnhancedMerchants__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = a3;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Updated account enhanced merchants at pass load for account %@. Error: %@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)_updateBalance
{
}

- (void)_updateBalanceAndPreventReload:(BOOL)a3
{
  int v5 = 1;
  self->_balanceLoaded = 1;
  BOOL canDisplayBalance = self->_canDisplayBalance;
  self->_BOOL canDisplayBalance = [(PKDashboardPaymentPassDataSource *)self _canDisplayBalance];
  int64_t numberOfBalanceDashboardItems = self->_numberOfBalanceDashboardItems;
  self->_int64_t numberOfBalanceDashboardItems = [(PKDashboardPaymentPassDataSource *)self _numberOfBalanceDashboardItems];
  BOOL balanceSectionHasFooter = self->_balanceSectionHasFooter;
  BOOL v9 = [(PKDashboardPaymentPassDataSource *)self _balanceSectionHasFooter];
  self->_BOOL balanceSectionHasFooter = v9;
  if (canDisplayBalance != !self->_canDisplayBalance)
  {
    if (numberOfBalanceDashboardItems == self->_numberOfBalanceDashboardItems) {
      int v5 = balanceSectionHasFooter ^ v9;
    }
    else {
      int v5 = 1;
    }
  }
  if (self->_allContentIsLoaded)
  {
    if (self->_balanceSectionNeedsUpdate) {
      int v10 = 1;
    }
    else {
      int v10 = v5;
    }
    if (v10 == 1)
    {
      self->_balanceSectionNeedsUpdate = 0;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

      if (WeakRetained)
      {
        if (!a3)
        {
          unint64_t v12 = [(PKDashboardPaymentPassDataSource *)self firstSectionIndexForSectionIdentifier:2];
          if (v5)
          {
            id v20 = objc_loadWeakRetained((id *)&self->_delegate);
            uint64_t v13 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v12];
            [v20 reloadSections:v13];
          }
          else
          {
            unint64_t v14 = [(PKDashboardPaymentPassDataSource *)self numberOfItemsInSection:v12];
            if (v14)
            {
              unint64_t v15 = v14;
              for (uint64_t i = 0; i != v15; ++i)
              {
                uint64_t v17 = [MEMORY[0x1E4F28D58] indexPathForItem:i inSection:v12];
                id v18 = objc_loadWeakRetained((id *)&self->_delegate);
                uint64_t v19 = [(PKDashboardPaymentPassDataSource *)self itemAtIndexPath:v17];
                [v18 itemChanged:v19 atIndexPath:v17];
              }
            }
          }
        }
      }
    }
  }
  else
  {
    self->_balanceSectionNeedsUpdate = 0;
    [(PKDashboardPaymentPassDataSource *)self updateContentIsLoaded];
  }
}

- (void)summaryTypeDidChange
{
}

- (void)loadSummariesWithForceReload:(BOOL)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_transactionSourceCollection)
  {
    if (self->_account)
    {
      BOOL v4 = a3;
      if ([(PKDashboardPaymentPassDataSource *)self _isCreditPass])
      {
        if (!self->_summaryFetcher)
        {
          int v5 = (PKSpendingSummaryFetcher *)[objc_alloc(MEMORY[0x1E4F85058]) initWithTransactionSourceCollection:self->_transactionSourceCollection account:self->_account accountUser:0];
          summaryFetcher = self->_summaryFetcher;
          self->_summaryFetcher = v5;

          [(PKSpendingSummaryFetcher *)self->_summaryFetcher registerObserver:self];
        }
        objc_initWeak(&location, self);
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __65__PKDashboardPaymentPassDataSource_loadSummariesWithForceReload___block_invoke;
        aBlock[3] = &unk_1E59D9A08;
        objc_copyWeak(&v14, &location);
        void aBlock[4] = self;
        int v7 = _Block_copy(aBlock);
        uint64_t v8 = v7;
        if (!self->_weeks || v4)
        {
          *(_WORD *)&self->_pendingSummaryUpdate = 0;
          BOOL v9 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v17 = self;
            _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "Dashboard loading (%p): Fetching available summaries", buf, 0xCu);
          }

          int v10 = self->_summaryFetcher;
          v11[0] = MEMORY[0x1E4F143A8];
          v11[1] = 3221225472;
          v11[2] = __65__PKDashboardPaymentPassDataSource_loadSummariesWithForceReload___block_invoke_565;
          v11[3] = &unk_1E59D9A30;
          void v11[4] = self;
          id v12 = v8;
          [(PKSpendingSummaryFetcher *)v10 availableSummaries:v11];
        }
        else if (self->_pendingSummaryUpdate)
        {
          self->_hasMoreSummaryUpdates = 1;
        }
        else
        {
          self->_pendingSummaryUpdate = 1;
          (*((void (**)(void *))v7 + 2))(v7);
        }

        objc_destroyWeak(&v14);
        objc_destroyWeak(&location);
      }
    }
  }
}

void __65__PKDashboardPaymentPassDataSource_loadSummariesWithForceReload___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained) {
    goto LABEL_13;
  }
  uint64_t v11 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134217984;
    uint64_t v26 = v12;
    _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "Dashboard loading (%p): Fetching spending summary", buf, 0xCu);
  }

  uint64_t v13 = PKBroadwaySummaryType();
  id v14 = (void *)v13;
  unint64_t v15 = v7;
  if (!v13) {
    goto LABEL_9;
  }
  if (v13 == 2)
  {
    unint64_t v15 = v9;
    goto LABEL_9;
  }
  unint64_t v15 = v8;
  if (v13 == 1)
  {
LABEL_9:
    id v16 = v15;
    goto LABEL_10;
  }
  id v16 = 0;
LABEL_10:
  if ([v16 count])
  {
    uint64_t v18 = (void *)WeakRetained[60];
    uint64_t v17 = [v16 lastObject];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __65__PKDashboardPaymentPassDataSource_loadSummariesWithForceReload___block_invoke_558;
    v19[3] = &unk_1E59D99E0;
    objc_copyWeak(v24, (id *)(a1 + 40));
    v19[4] = *(void *)(a1 + 32);
    id v20 = v16;
    id v21 = v7;
    id v22 = v8;
    id v23 = v9;
    v24[1] = v14;
    [v18 spendingSummaryStartingWithDate:v17 type:v14 includingLastPeriodChange:0 completion:v19];

    objc_destroyWeak(v24);
  }

LABEL_13:
}

void __65__PKDashboardPaymentPassDataSource_loadSummariesWithForceReload___block_invoke_558(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__PKDashboardPaymentPassDataSource_loadSummariesWithForceReload___block_invoke_2;
  v6[3] = &unk_1E59D1098;
  objc_copyWeak(v12, (id *)(a1 + 72));
  BOOL v4 = *(void **)(a1 + 40);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v4;
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  id v10 = *(id *)(a1 + 64);
  id v11 = v3;
  v12[1] = *(id *)(a1 + 80);
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);

  objc_destroyWeak(v12);
}

void __65__PKDashboardPaymentPassDataSource_loadSummariesWithForceReload___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 80);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained)
  {
    BOOL v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      uint64_t v19 = v5;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Dashboard loading (%p): Fetched spending summary", buf, 0xCu);
    }

    uint64_t v6 = [*(id *)(a1 + 40) lastObject];
    id v7 = (void *)*((void *)WeakRetained + 61);
    *((void *)WeakRetained + 61) = v6;

    objc_storeStrong((id *)WeakRetained + 100, *(id *)(a1 + 48));
    objc_storeStrong((id *)WeakRetained + 101, *(id *)(a1 + 56));
    objc_storeStrong((id *)WeakRetained + 102, *(id *)(a1 + 64));
    *((unsigned char *)WeakRetained + 235) = 1;
    objc_storeStrong((id *)WeakRetained + 62, *(id *)(a1 + 72));
    [WeakRetained _updateBalance];
    dispatch_time_t v8 = dispatch_time(0, 3000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__PKDashboardPaymentPassDataSource_loadSummariesWithForceReload___block_invoke_559;
    block[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v17, v2);
    dispatch_after(v8, MEMORY[0x1E4F14428], block);
    if ((unint64_t)[*(id *)(a1 + 40) count] >= 2)
    {
      dispatch_time_t v9 = dispatch_time(0, 300000000);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      void v13[2] = __65__PKDashboardPaymentPassDataSource_loadSummariesWithForceReload___block_invoke_2_560;
      v13[3] = &unk_1E59CFBA8;
      objc_copyWeak(v15, v2);
      id v10 = *(id *)(a1 + 40);
      id v11 = *(void **)(a1 + 88);
      id v14 = v10;
      v15[1] = v11;
      uint64_t v12 = (void *)MEMORY[0x1E4F14428];
      dispatch_after(v9, MEMORY[0x1E4F14428], v13);

      objc_destroyWeak(v15);
    }
    objc_destroyWeak(&v17);
  }
}

void __65__PKDashboardPaymentPassDataSource_loadSummariesWithForceReload___block_invoke_559(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[504] = 0;
    if (WeakRetained[505])
    {
      WeakRetained[505] = 0;
      id v2 = WeakRetained;
      [WeakRetained loadSummariesWithForceReload:0];
      id WeakRetained = v2;
    }
  }
}

void __65__PKDashboardPaymentPassDataSource_loadSummariesWithForceReload___block_invoke_2_560(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = (void *)WeakRetained[60];
    uint64_t v5 = WeakRetained;
    BOOL v4 = [*(id *)(a1 + 32) lastObject];
    [v3 spendingSummaryStartingWithDate:v4 type:*(void *)(a1 + 48) includingLastPeriodChange:1 completion:&__block_literal_global_563];

    id WeakRetained = v5;
  }
}

void __65__PKDashboardPaymentPassDataSource_loadSummariesWithForceReload___block_invoke_565(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    int v12 = 134218752;
    uint64_t v13 = v11;
    __int16 v14 = 2048;
    uint64_t v15 = [v7 count];
    __int16 v16 = 2048;
    uint64_t v17 = [v8 count];
    __int16 v18 = 2048;
    uint64_t v19 = [v9 count];
    _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "Dashboard loading (%p): Fetched available summaries (%lu/%lu/%lu)", (uint8_t *)&v12, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)reloadDisclosuresSectionIfNeeded
{
  if (self->_shouldReloadDisclosuresSection)
  {
    self->_shouldReloadDisclosuresSection = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndex:", -[PKDashboardPaymentPassDataSource numberOfSections](self, "numberOfSections") - 1);
    [WeakRetained reloadSections:v3];
  }
}

- ($65C3FA8A572F9D8A414E710B16373297)_peerPaymentDashboardCondition
{
  uint64_t v3 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount state];
  uint64_t v4 = PKPeerPaymentAccountResolutionForAccountAndPeerPaymentPass();
  BOOL v6 = [(PKPaymentPass *)self->_pass activationState] != PKPaymentPassActivationStateDeactivated
    && (unint64_t)(v3 - 1) < 2;
  BOOL v7 = v4 == 5 || v4 == 0;
  uint64_t v8 = 256;
  if (v7) {
    uint64_t v8 = 0;
  }
  uint64_t v9 = v8 | v6;
  unint64_t v10 = v4;
  result.var2 = v10;
  result.var0 = v9;
  result.var1 = BYTE1(v9);
  return result;
}

- (BOOL)_canShowTransactions
{
  if ([(PKDashboardPaymentPassDataSource *)self _isCreditPass])
  {
    transactionSourceCollection = self->_transactionSourceCollection;
    account = self->_account;
    return +[PKCreditAccountController shouldDisplayTransactionsForTransactionSourceCollection:transactionSourceCollection withAccount:account];
  }
  else
  {
    if ([(PKDashboardPaymentPassDataSource *)self _isPayLaterPass]) {
      goto LABEL_6;
    }
    int v7 = [(PKPaymentDefaultDataProvider *)self->_paymentDataProvider supportsTransactionsForPass:self->_pass];
    uint64_t v8 = [(PKPaymentPass *)self->_pass devicePrimaryPaymentApplication];
    if (v8)
    {
      uint64_t v9 = [(PKPaymentPass *)self->_pass devicePrimaryPaymentApplication];
      BOOL v10 = [v9 state] == 7;
    }
    else
    {
      BOOL v10 = 0;
    }

    uint64_t v11 = [(PKPaymentPass *)self->_pass devicePrimaryPaymentApplication];
    uint64_t v12 = [v11 state];

    char v13 = [(PKPaymentPass *)self->_pass settings];
    int v14 = [(PKPaymentPass *)self->_pass hasAssociatedPeerPaymentAccount];
    uint64_t v15 = [(PKPaymentPass *)self->_pass associatedAccountFeatureIdentifier];
    BOOL v16 = [(PKDashboardPaymentPassDataSource *)self isBankConnectLinked];
    int v17 = 0;
    if (!self->_isAccessPass && ((v7 ^ 1) & 1) == 0 && !v10 && v12 != 6)
    {
      __int16 v18 = [(PKTransactionSourceCollection *)self->_transactionSourceCollection transactionSourceIdentifiers];
      if ([v18 count]) {
        int v17 = 1;
      }
      else {
        int v17 = v16;
      }
    }
    int v19 = v17 & ((v13 & 8) != 0);
    if (v15 == 4) {
      int v19 = v17;
    }
    int v6 = ((v14 | v16) & 1) != 0 ? v17 : v19;
    if ((v6 & v14) == 1)
    {
      uint64_t v20 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount state];
      LOBYTE(v6) = [(PKPaymentPass *)self->_pass activationState] - 5 < 0xFFFFFFFFFFFFFFFELL;
      if (v20 == 3)
      {
        unint64_t v21 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount stateReason];
        if (v21 <= 5 && ((1 << v21) & 0x31) != 0) {
LABEL_6:
        }
          LOBYTE(v6) = 0;
      }
    }
    return v6;
  }
}

- (BOOL)_canFilterTransactions
{
  return self->_isShowingPeerPaymentPendingRequests || [(PKAccount *)self->_account feature] == 2;
}

- (void)_reloadTransactionGrouping
{
  BOOL v3 = [(PKDashboardPaymentPassDataSource *)self isBankConnectLinked];
  if ([(PKPaymentPass *)self->_pass hasAssociatedPeerPaymentAccount]) {
    goto LABEL_7;
  }
  uint64_t v4 = [(PKPaymentPass *)self->_pass associatedAccountServiceAccountIdentifier];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    BOOL v6 = [(PKDashboardPaymentPassDataSource *)self _isCreditPass];

    if (v6 || v3) {
      goto LABEL_7;
    }
LABEL_6:
    if (![(PKDashboardPaymentPassDataSource *)self _isAppleBalancePass]) {
      return;
    }
    goto LABEL_7;
  }
  if (!v3) {
    goto LABEL_6;
  }
LABEL_7:
  self->_transactionGrouping = 2;
}

- (void)reloadTransactions
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (self->_transactionSourceCollection)
  {
    if (![(PKDashboardPaymentPassDataSource *)self _canShowTransactions])
    {
      [(PKDashboardPaymentPassDataSource *)self updateWithTransactions:MEMORY[0x1E4F1CBF0]];
LABEL_28:
      [(PKDashboardPaymentPassDataSource *)self loadSummariesWithForceReload:1];
      return;
    }
    BOOL v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v31 = self;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Dashboard loading (%p): Fetching transactions", buf, 0xCu);
    }

    if (![(PKDashboardPaymentPassDataSource *)self isBankConnectLinked])
    {
      filterType = (void *)self->_filterType;
      id v5 = objc_alloc_init(MEMORY[0x1E4F84518]);
      objc_initWeak((id *)buf, self);
      if ([(PKDashboardPaymentPassDataSource *)self _canFilterTransactions])
      {
        switch((unint64_t)filterType)
        {
          case 1uLL:
            BOOL v6 = [NSNumber numberWithInteger:9];
            char v28 = v6;
            uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
            goto LABEL_15;
          case 2uLL:
            BOOL v6 = [NSNumber numberWithInteger:3];
            char v29 = v6;
            uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
            goto LABEL_15;
          case 3uLL:
            BOOL v6 = [NSNumber numberWithInteger:5];
            v26[0] = v6;
            uint64_t v9 = [NSNumber numberWithInteger:6];
            v26[1] = v9;
            uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
            goto LABEL_18;
          case 4uLL:
            BOOL v6 = [NSNumber numberWithInteger:0];
            uint64_t v27 = v6;
            uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
            goto LABEL_15;
          case 5uLL:
            BOOL v6 = [NSNumber numberWithInteger:10];
            long long v25 = v6;
            uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
LABEL_15:
            uint64_t v11 = (void *)v7;
            goto LABEL_19;
          case 6uLL:
            uint64_t v8 = 0;
            uint64_t v12 = 1;
            goto LABEL_23;
          case 7uLL:
            BOOL v6 = [NSNumber numberWithInteger:1];
            v24[0] = v6;
            uint64_t v9 = [NSNumber numberWithInteger:7];
            v24[1] = v9;
            uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
LABEL_18:
            uint64_t v11 = (void *)v10;

LABEL_19:
            uint64_t v8 = 0;
            goto LABEL_20;
          case 8uLL:
            uint64_t v15 = [NSNumber numberWithInteger:3];
            id v23 = v15;
            uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];

            uint64_t v8 = 2;
            [(PKDashboardTransactionFetcher *)self->_transactionFetcher filterPeerPaymentPaymentMode:2];
LABEL_20:
            if (!v11) {
              goto LABEL_22;
            }
            [(PKDashboardTransactionFetcher *)self->_transactionFetcher filterTypes:v11];
            uint64_t v12 = 0;
            break;
          default:
            uint64_t v8 = 0;
LABEL_22:
            uint64_t v12 = 0;
LABEL_23:
            [(PKDashboardTransactionFetcher *)self->_transactionFetcher filterTypes:0];
            uint64_t v11 = 0;
            break;
        }
        [(PKDashboardTransactionFetcher *)self->_transactionFetcher filterDisputesOnly:v12];
        [(PKDashboardTransactionFetcher *)self->_transactionFetcher filterPeerPaymentPaymentMode:v8];
        if (filterType)
        {
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __54__PKDashboardPaymentPassDataSource_reloadTransactions__block_invoke;
          v21[3] = &unk_1E59CF838;
          objc_copyWeak(&v22, (id *)buf);
          [v5 addOperation:v21];
          objc_destroyWeak(&v22);
        }
      }
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      __int16 v18 = __54__PKDashboardPaymentPassDataSource_reloadTransactions__block_invoke_4;
      int v19 = &unk_1E59D9AA0;
      objc_copyWeak(v20, (id *)buf);
      v20[1] = filterType;
      [v5 addOperation:&v16];
      char v13 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v16, v17, v18, v19);
      id v14 = (id)[v5 evaluateWithInput:v13 completion:0];

      objc_destroyWeak(v20);
      objc_destroyWeak((id *)buf);

      goto LABEL_28;
    }
  }
}

void __54__PKDashboardPaymentPassDataSource_reloadTransactions__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v12 = [MEMORY[0x1E4F1C9C8] date];
    char v13 = (void *)WeakRetained[15];
    id v14 = PKStartOfMonth();
    uint64_t v15 = PKEndOfMonth();
    [v13 setLimit:-1 startDate:v14 endDate:v15];

    uint64_t v16 = (void *)WeakRetained[15];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __54__PKDashboardPaymentPassDataSource_reloadTransactions__block_invoke_2;
    v17[3] = &unk_1E59D9A58;
    objc_copyWeak(&v20, v10);
    id v19 = v9;
    id v18 = v8;
    [v16 reloadTransactionsWithCompletion:v17];

    objc_destroyWeak(&v20);
  }
}

void __54__PKDashboardPaymentPassDataSource_reloadTransactions__block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__PKDashboardPaymentPassDataSource_reloadTransactions__block_invoke_3;
  v5[3] = &unk_1E59D00B8;
  objc_copyWeak(&v9, a1 + 6);
  id v6 = v3;
  id v8 = a1[5];
  id v7 = a1[4];
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v9);
}

void __54__PKDashboardPaymentPassDataSource_reloadTransactions__block_invoke_3(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    objc_storeStrong(WeakRetained + 54, *(id *)(a1 + 32));
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id WeakRetained = v3;
  }
}

void __54__PKDashboardPaymentPassDataSource_reloadTransactions__block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v11 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v12 = (void *)*((void *)WeakRetained + 14);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __54__PKDashboardPaymentPassDataSource_reloadTransactions__block_invoke_5;
    v13[3] = &unk_1E59CFBD0;
    objc_copyWeak(v14, (id *)(a1 + 32));
    v14[1] = *(id *)(a1 + 40);
    [v12 reloadTransactionsWithCompletion:v13];
    objc_destroyWeak(v14);
  }
}

void __54__PKDashboardPaymentPassDataSource_reloadTransactions__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__PKDashboardPaymentPassDataSource_reloadTransactions__block_invoke_6;
  block[3] = &unk_1E59CFBA8;
  objc_copyWeak(v7, (id *)(a1 + 32));
  v7[1] = *(id *)(a1 + 40);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(v7);
}

void __54__PKDashboardPaymentPassDataSource_reloadTransactions__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if (![WeakRetained _canFilterTransactions] || !*(void *)(a1 + 48))
    {
      id v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      id v5 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v6 = [v4 component:8 fromDate:v5];

      id v7 = *(void **)(a1 + 32);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      id v10[2] = __54__PKDashboardPaymentPassDataSource_reloadTransactions__block_invoke_7;
      v10[3] = &__block_descriptor_40_e37_B32__0__PKPaymentTransaction_8Q16_B24l;
      void v10[4] = v6;
      uint64_t v8 = objc_msgSend(v7, "pk_objectsPassingTest:", v10);
      id v9 = (void *)v3[54];
      v3[54] = v8;
    }
    [v3 updateWithTransactions:*(void *)(a1 + 32)];
  }
}

BOOL __54__PKDashboardPaymentPassDataSource_reloadTransactions__block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a2;
  id v5 = [v3 currentCalendar];
  uint64_t v6 = [v4 transactionDate];

  uint64_t v7 = [v5 component:8 fromDate:v6];
  return v7 == *(void *)(a1 + 32);
}

- (BOOL)isGroupInTheCurrentYear:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = [a3 group];
  id v4 = [v3 startDate];

  id v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v6 = [v5 components:6 fromDate:v4];
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
  char v8 = [v5 date:v7 matchesComponents:v6];

  return v8;
}

- (void)reloadTransactionGroups
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (!self->_transactionSourceCollection)
  {
    uint64_t v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
    }
    goto LABEL_25;
  }
  [(PKDashboardPaymentPassDataSource *)self _reloadTransactionGrouping];
  if ([(PKDashboardPaymentPassDataSource *)self isBankConnectLinked])
  {
    unint64_t transactionGrouping = self->_transactionGrouping;
    if (transactionGrouping != 2)
    {
      uint64_t v11 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v22 = transactionGrouping;
        _os_log_error_impl(&dword_19F450000, v11, OS_LOG_TYPE_ERROR, "Bank Connect transactions can be grouped only by mixed grouping type, but an attempt to group them by type %lu has happened.", buf, 0xCu);
      }
LABEL_25:

      return;
    }
  }
  BOOL v4 = [(PKDashboardPaymentPassDataSource *)self _canShowTransactions];
  if ([(PKDashboardPaymentPassDataSource *)self isBankConnectLinked]
    || ([(PKPaymentPass *)self->_pass hasAssociatedPeerPaymentAccount] & 1) != 0
    || [(PKDashboardPaymentPassDataSource *)self _isCreditPass]
    || [(PKDashboardPaymentPassDataSource *)self _isAppleBalancePass])
  {
    int v5 = 1;
  }
  else
  {
    id v14 = [(PKPaymentPass *)self->_pass devicePrimaryContactlessPaymentApplication];
    [v14 paymentNetworkIdentifier];
    int v5 = PKTransactionsUnlimitedForCredentialType();
  }
  uint64_t v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = @"NO";
    if (v4) {
      char v8 = @"YES";
    }
    else {
      char v8 = @"NO";
    }
    if (v5) {
      uint64_t v7 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    unint64_t v22 = (unint64_t)v8;
    __int16 v23 = 2112;
    long long v24 = v7;
    _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Groups reloading: canShowTransactions - %@, supportsTransactionGroups - %@", buf, 0x16u);
  }

  if ((v5 & 1) == 0)
  {
    self->_transactionsPerPeriodLoaded = 1;
    [(PKDashboardPaymentPassDataSource *)self _updateWithTransactionGroups:MEMORY[0x1E4F1CBF0]];
    return;
  }
  unsigned int v9 = (self->_filterType > 8) | (0xE0u >> self->_filterType);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = @"NO";
    if (v9) {
      uint64_t v10 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    unint64_t v22 = (unint64_t)v10;
    _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Groups reloading: shouldHideGroups - %@", buf, 0xCu);
  }

  if (v9 & 1 | !v4)
  {
    [(PKDashboardPaymentPassDataSource *)self _updateWithTransactionGroups:MEMORY[0x1E4F1CBF0]];
    return;
  }
  objc_initWeak((id *)buf, self);
  unint64_t v12 = self->_transactionGrouping;
  switch(v12)
  {
    case 2uLL:
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      id v15[2] = __59__PKDashboardPaymentPassDataSource_reloadTransactionGroups__block_invoke_3;
      v15[3] = &unk_1E59CF060;
      char v13 = &v16;
      objc_copyWeak(&v16, (id *)buf);
      void v15[4] = self;
      [(PKDashboardPaymentPassDataSource *)self _yearlyTransactionGroupsWithCompletion:v15];
      goto LABEL_37;
    case 1uLL:
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __59__PKDashboardPaymentPassDataSource_reloadTransactionGroups__block_invoke_2;
      v17[3] = &unk_1E59CB088;
      char v13 = &v18;
      objc_copyWeak(&v18, (id *)buf);
      [(PKDashboardPaymentPassDataSource *)self _yearlyTransactionGroupsWithCompletion:v17];
      goto LABEL_37;
    case 0uLL:
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __59__PKDashboardPaymentPassDataSource_reloadTransactionGroups__block_invoke;
      v19[3] = &unk_1E59CB088;
      char v13 = &v20;
      objc_copyWeak(&v20, (id *)buf);
      [(PKDashboardPaymentPassDataSource *)self _monthlyTransactionGroupsWithCompletion:v19];
LABEL_37:
      objc_destroyWeak(v13);
      break;
  }
  objc_destroyWeak((id *)buf);
}

void __59__PKDashboardPaymentPassDataSource_reloadTransactionGroups__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _updateWithTransactionGroups:v5];
  }
}

void __59__PKDashboardPaymentPassDataSource_reloadTransactionGroups__block_invoke_2(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6[0] = v3;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
    [WeakRetained _updateWithTransactionGroups:v5];
  }
}

void __59__PKDashboardPaymentPassDataSource_reloadTransactionGroups__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = [v3 firstObject];
  if (v6 && [*(id *)(a1 + 32) isGroupInTheCurrentYear:v6])
  {
    uint64_t v7 = objc_msgSend(v3, "pk_arrayByRemovingObject:", v6);

    id v3 = (id)v7;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__PKDashboardPaymentPassDataSource_reloadTransactionGroups__block_invoke_4;
  v9[3] = &unk_1E59CF060;
  objc_copyWeak(&v11, v4);
  id v8 = v3;
  id v10 = v8;
  [WeakRetained _monthlyTransactionGroupsWithCompletion:v9];

  objc_destroyWeak(&v11);
}

void __59__PKDashboardPaymentPassDataSource_reloadTransactionGroups__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    id v42 = [MEMORY[0x1E4F1C9C8] date];
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v6 = v3;
    uint64_t v43 = [v6 countByEnumeratingWithState:&v61 objects:v70 count:16];
    if (v43)
    {
      id v37 = WeakRetained;
      id v38 = v3;
      int v7 = 0;
      uint64_t v39 = *(void *)v62;
      uint64_t v40 = v6;
      uint64_t v41 = a1;
      do
      {
        uint64_t v8 = 0;
        do
        {
          int v48 = v7;
          if (*(void *)v62 != v39) {
            objc_enumerationMutation(v6);
          }
          uint64_t v47 = v8;
          id v50 = *(void **)(*((void *)&v61 + 1) + 8 * v8);
          long long v46 = objc_msgSend(v50, "firstObject", v37, v38);
          unsigned int v9 = [v46 group];
          uint64_t v10 = [v9 startDate];

          uint64_t v45 = (void *)v10;
          id v11 = [v5 components:6 fromDate:v10];
          int v44 = [v5 date:v42 matchesComponents:v11];
          long long v57 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          id obj = *(id *)(a1 + 32);
          uint64_t v12 = [obj countByEnumeratingWithState:&v57 objects:v69 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v58;
            uint64_t v49 = *(void *)v58;
            do
            {
              uint64_t v15 = 0;
              uint64_t v51 = v13;
              do
              {
                if (*(void *)v58 != v14) {
                  objc_enumerationMutation(obj);
                }
                id v16 = [*(id *)(*((void *)&v57 + 1) + 8 * v15) group];
                uint64_t v17 = [v16 startDate];
                int v18 = [v5 date:v17 matchesComponents:v11];

                if (v18)
                {
                  id v19 = v11;
                  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                  long long v53 = 0u;
                  long long v54 = 0u;
                  long long v55 = 0u;
                  long long v56 = 0u;
                  id v21 = v50;
                  uint64_t v22 = [v21 countByEnumeratingWithState:&v53 objects:v68 count:16];
                  if (v22)
                  {
                    uint64_t v23 = v22;
                    uint64_t v24 = *(void *)v54;
                    do
                    {
                      for (uint64_t i = 0; i != v23; ++i)
                      {
                        if (*(void *)v54 != v24) {
                          objc_enumerationMutation(v21);
                        }
                        uint64_t v26 = [*(id *)(*((void *)&v53 + 1) + 8 * i) group];
                        [v20 addObject:v26];
                      }
                      uint64_t v23 = [v21 countByEnumeratingWithState:&v53 objects:v68 count:16];
                    }
                    while (v23);
                  }

                  uint64_t v27 = (void *)[v20 copy];
                  [v16 setGroups:v27];

                  id v11 = v19;
                  uint64_t v14 = v49;
                  uint64_t v13 = v51;
                }

                ++v15;
              }
              while (v15 != v13);
              uint64_t v13 = [obj countByEnumeratingWithState:&v57 objects:v69 count:16];
            }
            while (v13);
          }
          int v7 = v44 | v48;

          uint64_t v8 = v47 + 1;
          id v6 = v40;
          a1 = v41;
        }
        while (v47 + 1 != v43);
        uint64_t v43 = [v40 countByEnumeratingWithState:&v61 objects:v70 count:16];
      }
      while (v43);

      id WeakRetained = v37;
      id v3 = v38;
      if (v7)
      {
        uint64_t v28 = [*(id *)(v41 + 32) count];
        uint64_t v29 = [v40 firstObject];
        id v30 = (void *)v29;
        if (v28)
        {
          uint64_t v31 = *(void *)(v41 + 32);
          v67[0] = v29;
          v67[1] = v31;
          uint64_t v32 = (void *)MEMORY[0x1E4F1C978];
          uint64_t v33 = v67;
          uint64_t v34 = 2;
        }
        else
        {
          uint64_t v66 = v29;
          uint64_t v32 = (void *)MEMORY[0x1E4F1C978];
          uint64_t v33 = &v66;
          uint64_t v34 = 1;
        }
        uint64_t v35 = [v32 arrayWithObjects:v33 count:v34];

        goto LABEL_34;
      }
    }
    else
    {
    }
    if ([*(id *)(a1 + 32) count])
    {
      uint64_t v65 = *(void *)(a1 + 32);
      uint64_t v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v65 count:1];
    }
    else
    {
      uint64_t v35 = (void *)MEMORY[0x1E4F1CBF0];
    }
LABEL_34:
    __int16 v36 = objc_msgSend(v35, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_572);

    [WeakRetained _updateWithTransactionGroups:v36];
  }
}

id __59__PKDashboardPaymentPassDataSource_reloadTransactionGroups__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 count]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (void)_yearlyTransactionGroupsWithCompletion:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__PKDashboardPaymentPassDataSource__yearlyTransactionGroupsWithCompletion___block_invoke;
  aBlock[3] = &unk_1E59CC358;
  objc_copyWeak(&v16, &location);
  id v5 = v4;
  id v15 = v5;
  id v6 = (void (**)(void *, void *))_Block_copy(aBlock);
  BOOL v7 = [(PKDashboardPaymentPassDataSource *)self isBankConnectLinked];
  uint64_t v8 = PKLogFacilityTypeGetObject();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_DWORD *)buf = 134217984;
      id v19 = self;
      _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Dashboard loading (%p): Processing FinanceKit yearly transaction groups", buf, 0xCu);
    }

    uint64_t v10 = [(PKDashboardPaymentPassDataSource *)self bankConnectYearlyTransactionGroups];
    v6[2](v6, v10);
  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 134217984;
      id v19 = self;
      _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Dashboard loading (%p): Fetching yearly transaction groups", buf, 0xCu);
    }

    transactionFetcher = self->_transactionFetcher;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    id v12[2] = __75__PKDashboardPaymentPassDataSource__yearlyTransactionGroupsWithCompletion___block_invoke_573;
    v12[3] = &unk_1E59CACF0;
    uint64_t v13 = v6;
    [(PKDashboardTransactionFetcher *)transactionFetcher transactionCountByPeriod:4 withCompletion:v12];
    uint64_t v10 = v13;
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __75__PKDashboardPaymentPassDataSource__yearlyTransactionGroupsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained _canShowTransactions])
    {
      id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v16 = v3;
      id v7 = v3;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v18;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v18 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * v11);
            uint64_t v13 = objc_alloc_init(PKDashboardPaymentTransactionGroupItem);
            [(PKDashboardPaymentTransactionGroupItem *)v13 setGroup:v12];
            [(PKDashboardPaymentTransactionGroupItem *)v13 setTransactionSourceCollection:v5[6]];
            [(PKDashboardPaymentTransactionGroupItem *)v13 setFamilyCollection:v5[98]];
            [(PKDashboardPaymentTransactionGroupItem *)v13 setAccount:v5[49]];
            [(PKDashboardPaymentTransactionGroupItem *)v13 setAccountUserCollection:v5[95]];
            [(PKDashboardPaymentTransactionGroupItem *)v13 setPhysicalCards:v5[97]];
            [v6 addObject:v13];

            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v9);
      }

      uint64_t v14 = *(void *)(a1 + 32);
      id v15 = (void *)[v6 copy];
      (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);

      id v3 = v16;
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

void __75__PKDashboardPaymentPassDataSource__yearlyTransactionGroupsWithCompletion___block_invoke_573(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __75__PKDashboardPaymentPassDataSource__yearlyTransactionGroupsWithCompletion___block_invoke_2;
  v6[3] = &unk_1E59CAD68;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __75__PKDashboardPaymentPassDataSource__yearlyTransactionGroupsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)groupItemForTransactionGroup:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(PKDashboardPaymentTransactionGroupItem);
  [(PKDashboardPaymentTransactionGroupItem *)v5 setGroup:v4];

  [(PKDashboardPaymentTransactionGroupItem *)v5 setTransactionSourceCollection:self->_transactionSourceCollection];
  [(PKDashboardPaymentTransactionGroupItem *)v5 setFamilyCollection:self->_familyCollection];
  [(PKDashboardPaymentTransactionGroupItem *)v5 setAccount:self->_account];
  [(PKDashboardPaymentTransactionGroupItem *)v5 setAccountUserCollection:self->_accountUserCollection];
  [(PKDashboardPaymentTransactionGroupItem *)v5 setPhysicalCards:self->_physicalCards];

  return v5;
}

- (void)_monthlyTransactionGroupsWithCompletion:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    long long v19 = self;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Dashboard loading (%p): Fetching monthly transaction groups", buf, 0xCu);
  }

  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__PKDashboardPaymentPassDataSource__monthlyTransactionGroupsWithCompletion___block_invoke;
  aBlock[3] = &unk_1E59CC358;
  objc_copyWeak(&v16, &location);
  id v6 = v4;
  id v15 = v6;
  id v7 = (void (**)(void *, void *))_Block_copy(aBlock);
  BOOL v8 = [(PKDashboardPaymentPassDataSource *)self isBankConnectLinked];
  BOOL v9 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v9)
    {
      *(_DWORD *)buf = 134217984;
      long long v19 = self;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Dashboard loading (%p): Processing FinanceKit monthly transaction groups", buf, 0xCu);
    }

    uint64_t v10 = [(PKDashboardPaymentPassDataSource *)self bankConnectMonthlyTransactionGroups];
    v7[2](v7, v10);
  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 134217984;
      long long v19 = self;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Dashboard loading (%p): Fetching monthly transaction groups", buf, 0xCu);
    }

    transactionFetcher = self->_transactionFetcher;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    id v12[2] = __76__PKDashboardPaymentPassDataSource__monthlyTransactionGroupsWithCompletion___block_invoke_577;
    v12[3] = &unk_1E59CACF0;
    uint64_t v13 = v7;
    [(PKDashboardTransactionFetcher *)transactionFetcher transactionCountByPeriod:8 withCompletion:v12];
    uint64_t v10 = v13;
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __76__PKDashboardPaymentPassDataSource__monthlyTransactionGroupsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained _canShowTransactions])
    {
      uint64_t v30 = a1;
      uint64_t v33 = v5;
      id v6 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v31 = v3;
      id obj = v3;
      uint64_t v9 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
      uint64_t v32 = (void *)v7;
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v40;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v40 != v11) {
              objc_enumerationMutation(obj);
            }
            uint64_t v13 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            uint64_t v14 = [v13 startDate];
            id v15 = [v6 components:14 fromDate:v14];
            if (([v6 date:v7 matchesComponents:v15] & 1) == 0)
            {
              id v16 = [v6 components:6 fromDate:v14];
              id v17 = [v8 objectForKey:v16];
              if (!v17)
              {
                id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                [v8 setObject:v17 forKey:v16];
              }
              long long v18 = [v33 groupItemForTransactionGroup:v13];
              [v17 addObject:v18];

              uint64_t v7 = (uint64_t)v32;
            }
          }
          uint64_t v10 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
        }
        while (v10);
      }

      id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v20 = [v8 allKeys];
      id v21 = [v20 sortedArrayUsingComparator:&__block_literal_global_576];

      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v22 = v21;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v35 objects:v43 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v36;
        do
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v36 != v25) {
              objc_enumerationMutation(v22);
            }
            uint64_t v27 = [v8 objectForKey:*(void *)(*((void *)&v35 + 1) + 8 * j)];
            [v19 addObject:v27];
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v35 objects:v43 count:16];
        }
        while (v24);
      }

      uint64_t v28 = *(void *)(v30 + 32);
      uint64_t v29 = (void *)[v19 copy];
      (*(void (**)(uint64_t, void *))(v28 + 16))(v28, v29);

      id v3 = v31;
      id v5 = v33;
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

uint64_t __76__PKDashboardPaymentPassDataSource__monthlyTransactionGroupsWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v4;
  id v7 = v5;
  uint64_t v8 = [v6 era];
  if (v8 == [v7 era])
  {
    uint64_t v9 = [v6 year];
    if (v9 == [v7 year])
    {
      uint64_t v10 = 0;
      goto LABEL_9;
    }
    uint64_t v11 = [v6 year];
    uint64_t v12 = [v7 year];
  }
  else
  {
    uint64_t v11 = [v6 era];
    uint64_t v12 = [v7 era];
  }
  if (v11 > v12) {
    uint64_t v10 = -1;
  }
  else {
    uint64_t v10 = 1;
  }
LABEL_9:

  return v10;
}

void __76__PKDashboardPaymentPassDataSource__monthlyTransactionGroupsWithCompletion___block_invoke_577(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __76__PKDashboardPaymentPassDataSource__monthlyTransactionGroupsWithCompletion___block_invoke_2_578;
  v6[3] = &unk_1E59CAD68;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __76__PKDashboardPaymentPassDataSource__monthlyTransactionGroupsWithCompletion___block_invoke_2_578(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_updateWithTransactionGroups:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[v4 count];
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    id v22 = self;
    __int16 v23 = 2048;
    uint64_t v24 = v5;
    _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Dashboard loading (%p): Fetched transaction groups: %lu", buf, 0x16u);
  }

  id v7 = [(NSArray *)self->_transactionGroups count];
  objc_initWeak((id *)buf, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__PKDashboardPaymentPassDataSource__updateWithTransactionGroups___block_invoke;
  aBlock[3] = &unk_1E59CFBA8;
  objc_copyWeak(v20, (id *)buf);
  id v8 = v4;
  id v19 = v8;
  v20[1] = v5;
  uint64_t v9 = _Block_copy(aBlock);
  uint64_t v10 = v9;
  if (self->_allContentIsLoaded)
  {
    int v11 = ![(PKDashboardPaymentPassDataSource *)self isBankConnectLinked];
    if (!v8) {
      LOBYTE(v11) = 1;
    }
    if (v11)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (WeakRetained)
      {
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        id v14[2] = __65__PKDashboardPaymentPassDataSource__updateWithTransactionGroups___block_invoke_2;
        v14[3] = &unk_1E59D9B08;
        objc_copyWeak(v17, (id *)buf);
        id v16 = v10;
        v17[1] = v5;
        v17[2] = v7;
        id v13 = WeakRetained;
        id v15 = v13;
        [v13 performBatchUpdates:v14 completion:0];

        objc_destroyWeak(v17);
      }
    }
    else
    {
      [(PKDashboardPaymentPassDataSource *)self _calculateDiffAndUpdateWithTransactionGroups:v8];
    }
  }
  else
  {
    (*((void (**)(void *))v9 + 2))(v9);
    [(PKDashboardPaymentPassDataSource *)self updateContentIsLoaded];
  }

  objc_destroyWeak(v20);
  objc_destroyWeak((id *)buf);
}

void __65__PKDashboardPaymentPassDataSource__updateWithTransactionGroups___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    WeakRetained[144] = 1;
    id v6 = WeakRetained;
    uint64_t v3 = [*(id *)(a1 + 32) copy];
    id v4 = (void *)*((void *)v6 + 112);
    *((void *)v6 + 112) = v3;

    id v5 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
    [*((id *)v6 + 8) setObject:v5 forKeyedSubscript:&unk_1EF2B9750];

    id WeakRetained = v6;
  }
}

void __65__PKDashboardPaymentPassDataSource__updateWithTransactionGroups___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v15 = WeakRetained;
    uint64_t v3 = [WeakRetained firstSectionIndexForSectionIdentifier:16];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    unint64_t v4 = *(void *)(a1 + 56);
    unint64_t v5 = *(void *)(a1 + 64);
    if (v4 > v5)
    {
      id v6 = *(void **)(a1 + 32);
      id v7 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v5 + v3, v4 - v5);
      [v6 insertSections:v7];

      id v8 = *(void **)(a1 + 32);
      uint64_t v9 = (void *)MEMORY[0x1E4F28D60];
      uint64_t v10 = v3 - 1;
      uint64_t v11 = *(void *)(a1 + 64);
LABEL_6:
      unint64_t v4 = v11 + 1;
LABEL_7:
      uint64_t v14 = objc_msgSend(v9, "indexSetWithIndexesInRange:", v10, v4);
      [v8 reloadSections:v14];

      id WeakRetained = v15;
      goto LABEL_8;
    }
    if (v4 < v5)
    {
      uint64_t v12 = *(void **)(a1 + 32);
      id v13 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v4 + v3, v5 - v4);
      [v12 deleteSections:v13];

      id v8 = *(void **)(a1 + 32);
      uint64_t v9 = (void *)MEMORY[0x1E4F28D60];
      uint64_t v10 = v3 - 1;
      uint64_t v11 = *(void *)(a1 + 56);
      goto LABEL_6;
    }
    id WeakRetained = v15;
    if (v4)
    {
      id v8 = *(void **)(a1 + 32);
      uint64_t v9 = (void *)MEMORY[0x1E4F28D60];
      uint64_t v10 = v3;
      goto LABEL_7;
    }
  }
LABEL_8:
}

- (void)transactionsChanged:(id)a3
{
  id v4 = a3;
  if (![(PKDashboardPaymentPassDataSource *)self isBankConnectLinked])
  {
    if ([(PKDashboardPaymentPassDataSource *)self _canFilterTransactions] && self->_filterType)
    {
      objc_initWeak(&location, self);
      unint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
      currentMonthFetcher = self->_currentMonthFetcher;
      id v7 = PKStartOfMonth();
      id v8 = PKEndOfMonth();
      [(PKDashboardTransactionFetcher *)currentMonthFetcher setLimit:-1 startDate:v7 endDate:v8];

      uint64_t v9 = self->_currentMonthFetcher;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      id v15[2] = __56__PKDashboardPaymentPassDataSource_transactionsChanged___block_invoke_2;
      v15[3] = &unk_1E59CF060;
      objc_copyWeak(&v17, &location);
      id v16 = v4;
      [(PKDashboardTransactionFetcher *)v9 reloadTransactionsWithCompletion:v15];

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
    else
    {
      uint64_t v10 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v12 = [v10 component:8 fromDate:v11];

      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __56__PKDashboardPaymentPassDataSource_transactionsChanged___block_invoke;
      v19[3] = &__block_descriptor_40_e37_B32__0__PKPaymentTransaction_8Q16_B24l;
      void v19[4] = v12;
      objc_msgSend(v4, "pk_objectsPassingTest:", v19);
      id v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
      currentMonthTransactions = self->_currentMonthTransactions;
      self->_currentMonthTransactions = v13;

      [(PKDashboardPaymentPassDataSource *)self updateWithTransactions:v4];
      [(PKDashboardPaymentPassDataSource *)self reloadTransactionGroups];
    }
  }
}

BOOL __56__PKDashboardPaymentPassDataSource_transactionsChanged___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a2;
  unint64_t v5 = [v3 currentCalendar];
  id v6 = [v4 transactionDate];

  uint64_t v7 = [v5 component:8 fromDate:v6];
  return v7 == *(void *)(a1 + 32);
}

void __56__PKDashboardPaymentPassDataSource_transactionsChanged___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  unint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 54, a2);
    [v5 updateWithTransactions:*(void *)(a1 + 32)];
    [v5 reloadTransactionGroups];
  }
}

- (void)updateWithTransactions:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    long long v46 = self;
    __int16 v47 = 2048;
    uint64_t v48 = [v4 count];
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Dashboard loading (%p): Fetched transactions: %lu", buf, 0x16u);
  }

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  os_unfair_lock_lock(&self->_lockTransactions);
  uint64_t v7 = (NSArray *)[v4 copy];
  previousTransactions = self->_previousTransactions;
  self->_previousTransactions = v7;

  os_unfair_lock_unlock(&self->_lockTransactions);
  BOOL v9 = [(PKDashboardPaymentPassDataSource *)self _canShowTransactions];
  uint64_t v10 = (void *)MEMORY[0x1E4F1CBF0];
  if (v9) {
    uint64_t v10 = v4;
  }
  id v11 = v10;
  transactions = self->_transactions;
  if (transactions)
  {
    uint64_t v13 = [(NSArray *)transactions count];
    if (v13 == [v11 count])
    {
      id v14 = v4;
      unint64_t v15 = [(PKDashboardPaymentPassDataSource *)self firstSectionIndexForSectionIdentifier:12];
      if ([v11 count])
      {
        unint64_t v16 = 0;
        do
        {
          if (self->_forceTransactionsUpdate
            || ([v11 objectAtIndex:v16],
                id v17 = objc_claimAutoreleasedReturnValue(),
                [(NSArray *)self->_transactions objectAtIndex:v16],
                long long v18 = objc_claimAutoreleasedReturnValue(),
                char v19 = PKEqualObjects(),
                v18,
                v17,
                (v19 & 1) == 0))
          {
            uint64_t v20 = [MEMORY[0x1E4F28D58] indexPathForItem:v16 inSection:v15];
            [v6 addObject:v20];
          }
          ++v16;
        }
        while (v16 < [v11 count]);
      }
      unint64_t v21 = [(PKDashboardPaymentPassDataSource *)self firstSectionIndexForSectionIdentifier:2];
      id v22 = [MEMORY[0x1E4F28D58] indexPathForItem:4 inSection:v21];
      [v6 addObject:v22];

      int v23 = 0;
      id v4 = v14;
      goto LABEL_17;
    }
    if ([(PKDashboardPaymentPassDataSource *)self isBankConnectLinked])
    {
      [(PKDashboardPaymentPassDataSource *)self _calculateDiffAndUpdateWithTransactions:v11];
      goto LABEL_33;
    }
  }
  int v23 = 1;
LABEL_17:
  self->_forceTransactionsUpdate = 0;
  uint64_t v24 = [MEMORY[0x1E4F1C9C8] date];
  lastTransactionReload = self->_lastTransactionReload;
  self->_lastTransactionReload = v24;

  uint64_t v26 = (NSArray *)[v11 copy];
  uint64_t v27 = self->_transactions;
  self->_transactions = v26;

  if (self->_allContentIsLoaded)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      if (v23)
      {
        id v29 = objc_alloc_init(MEMORY[0x1E4F28E60]);
        objc_msgSend(v29, "addIndex:", -[PKDashboardPaymentPassDataSource firstSectionIndexForSectionIdentifier:](self, "firstSectionIndexForSectionIdentifier:", 12));
        unint64_t v30 = [(PKDashboardPaymentPassDataSource *)self firstSectionIndexForSectionIdentifier:2];
        [v29 addIndex:v30];
        [WeakRetained reloadSections:v29];
        id v31 = [MEMORY[0x1E4F28D58] indexPathForItem:4 inSection:v30];
        [v6 addObject:v31];
      }
      else
      {
        id v39 = v4;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v32 = v6;
        uint64_t v33 = [v32 countByEnumeratingWithState:&v40 objects:v44 count:16];
        if (v33)
        {
          uint64_t v34 = v33;
          uint64_t v35 = *(void *)v41;
          do
          {
            for (uint64_t i = 0; i != v34; ++i)
            {
              if (*(void *)v41 != v35) {
                objc_enumerationMutation(v32);
              }
              uint64_t v37 = *(void *)(*((void *)&v40 + 1) + 8 * i);
              long long v38 = [(PKDashboardPaymentPassDataSource *)self itemAtIndexPath:v37];
              [WeakRetained itemChanged:v38 atIndexPath:v37];
            }
            uint64_t v34 = [v32 countByEnumeratingWithState:&v40 objects:v44 count:16];
          }
          while (v34);
        }

        id v4 = v39;
        if (![v32 count]) {
          goto LABEL_32;
        }
      }
      if (self->_account) {
        [(PKDashboardPaymentPassDataSource *)self reloadMessages];
      }
    }
LABEL_32:

    goto LABEL_33;
  }
  [(PKDashboardPaymentPassDataSource *)self updateContentIsLoaded];
LABEL_33:
}

- (void)_localeDidChangeNotification:(id)a3
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __65__PKDashboardPaymentPassDataSource__localeDidChangeNotification___block_invoke;
  v3[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __65__PKDashboardPaymentPassDataSource__localeDidChangeNotification___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[145] = 1;
    id v2 = WeakRetained;
    [WeakRetained reloadTransactions];
    id WeakRetained = v2;
  }
}

- (void)_updateTransactionsTimer
{
  timerTransactions = self->_timerTransactions;
  if (timerTransactions)
  {
    if (!self->_activeState.foregroundActive)
    {
      dispatch_source_cancel(timerTransactions);
      id v4 = self->_timerTransactions;
      self->_timerTransactions = 0;
    }
  }
  else if (self->_activeState.foregroundActive)
  {
    unint64_t v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
    id v6 = self->_timerTransactions;
    self->_timerTransactions = v5;

    uint64_t v7 = self->_timerTransactions;
    dispatch_time_t v8 = dispatch_time(0, 60000000000);
    dispatch_source_set_timer(v7, v8, 0xDF8475800uLL, 0x6FC23AC00uLL);
    objc_initWeak(&location, self);
    BOOL v9 = self->_timerTransactions;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    id v10[2] = __60__PKDashboardPaymentPassDataSource__updateTransactionsTimer__block_invoke;
    v10[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v11, &location);
    dispatch_source_set_event_handler(v9, v10);
    dispatch_resume((dispatch_object_t)self->_timerTransactions);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __60__PKDashboardPaymentPassDataSource__updateTransactionsTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    dispatch_time_t v8 = WeakRetained;
    if ([WeakRetained isBankConnectLinked])
    {
      uint64_t v2 = [v8 firstSectionIndexForSectionIdentifier:3];
      id v3 = [v8 delegate];
      id v4 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v2];
      [v3 reloadSections:v4];
    }
    else
    {
      id v3 = v8[20];
      if (!v3)
      {
LABEL_10:

        id WeakRetained = v8;
        goto LABEL_11;
      }
      id v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      uint64_t v5 = [v4 component:16 fromDate:v3];
      id v6 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v7 = [v4 component:16 fromDate:v6];

      *((unsigned char *)v8 + 145) = 1;
      if (v5 == v7)
      {
        if (([v8 _isPayLaterPass] & 1) == 0) {
          [v8 updateWithTransactions:v8[9]];
        }
      }
      else
      {
        [v8 reloadAllContent];
      }
    }

    goto LABEL_10;
  }
LABEL_11:
}

- (void)reloadAuxiliaryItems
{
  id v3 = [(PKPaymentPass *)self->_pass auxiliaryPassInformation];
  id v4 = (void *)[v3 copy];

  uint64_t v5 = (void *)[v4 count];
  NSUInteger v6 = [(NSArray *)self->_auxiliarySectionInfo count];
  if (!self->_allContentIsLoaded)
  {
    objc_initWeak(&location, self);
    pass = self->_pass;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    id v15[2] = __56__PKDashboardPaymentPassDataSource_reloadAuxiliaryItems__block_invoke;
    v15[3] = &unk_1E59CFBA8;
    objc_copyWeak(v17, &location);
    id v16 = v4;
    v17[1] = v5;
    [(PKDashboardPaymentPassDataSource *)self _fetchMerchantForAuxiliarySections:v16 pass:pass completion:v15];

    uint64_t v10 = v17;
    goto LABEL_5;
  }
  uint64_t v7 = (void *)v6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    objc_initWeak(&location, self);
    BOOL v9 = self->_pass;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    id v12[2] = __56__PKDashboardPaymentPassDataSource_reloadAuxiliaryItems__block_invoke_2;
    v12[3] = &unk_1E59D9B30;
    objc_copyWeak(v14, &location);
    v14[1] = v5;
    id v14[2] = v7;
    id v13 = v4;
    [(PKDashboardPaymentPassDataSource *)self _fetchMerchantForAuxiliarySections:v13 pass:v9 completion:v12];

    uint64_t v10 = v14;
LABEL_5:
    objc_destroyWeak(v10);
    objc_destroyWeak(&location);
  }
}

void __56__PKDashboardPaymentPassDataSource_reloadAuxiliaryItems__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    objc_storeStrong(WeakRetained + 10, *(id *)(a1 + 32));
    id v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
    [v4[8] setObject:v3 forKeyedSubscript:&unk_1EF2B9768];

    id WeakRetained = v4;
    if (!*((unsigned char *)v4 + 88))
    {
      *((unsigned char *)v4 + 88) = 1;
      [v4 updateContentIsLoaded];
      id WeakRetained = v4;
    }
  }
}

void __56__PKDashboardPaymentPassDataSource_reloadAuxiliaryItems__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_13;
  }
  uint64_t v4 = [WeakRetained firstSectionIndexForSectionIdentifier:17];
  NSUInteger v6 = (unint64_t *)(a1 + 56);
  unint64_t v5 = *(void *)(a1 + 56);
  unint64_t v7 = *(void *)(a1 + 48);
  if (v7 > v5)
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v5 + v4, v7 - v5);
    uint64_t v9 = 0;
LABEL_6:
    unint64_t v7 = *v6;
LABEL_7:
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v4, v7);
    id v11 = (void *)v9;
    uint64_t v12 = (void *)v8;
    goto LABEL_8;
  }
  if (v7 < v5)
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v7 + v4, v5 - v7);
    uint64_t v8 = 0;
    NSUInteger v6 = (unint64_t *)(a1 + 48);
    goto LABEL_6;
  }
  uint64_t v9 = 0;
  uint64_t v8 = 0;
  id v11 = 0;
  uint64_t v12 = 0;
  uint64_t v10 = 0;
  if (v7) {
    goto LABEL_7;
  }
LABEL_8:
  if (v10 || v12 || v11)
  {
    id v13 = objc_loadWeakRetained(v3 + 5);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __56__PKDashboardPaymentPassDataSource_reloadAuxiliaryItems__block_invoke_3;
    v16[3] = &unk_1E59D4130;
    void v16[4] = v3;
    id v14 = *(id *)(a1 + 32);
    uint64_t v22 = *(void *)(a1 + 48);
    id v17 = v14;
    id v18 = v13;
    id v19 = v12;
    id v20 = v11;
    id v21 = v10;
    id v15 = v13;
    [v15 performBatchUpdates:v16 completion:0];
  }
LABEL_13:
}

uint64_t __56__PKDashboardPaymentPassDataSource_reloadAuxiliaryItems__block_invoke_3(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 80), *(id *)(a1 + 40));
  uint64_t v2 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 80)];
  [*(id *)(*(void *)(a1 + 32) + 64) setObject:v2 forKeyedSubscript:&unk_1EF2B9768];

  [*(id *)(a1 + 48) insertSections:*(void *)(a1 + 56)];
  [*(id *)(a1 + 48) deleteSections:*(void *)(a1 + 64)];
  id v3 = *(void **)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 72);

  return [v3 reloadSections:v4];
}

- (void)_fetchMerchantForAuxiliarySections:(id)a3 pass:(id)a4 completion:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v22 = a5;
  id v9 = objc_alloc_init(MEMORY[0x1E4F84C38]);
  uint64_t v10 = dispatch_group_create();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v7;
  uint64_t v25 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v25)
  {
    uint64_t v24 = *(void *)v36;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v36 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = v11;
        uint64_t v12 = *(void **)(*((void *)&v35 + 1) + 8 * v11);
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v13 = objc_msgSend(v12, "items", v22);
        uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v32;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v32 != v16) {
                objc_enumerationMutation(v13);
              }
              id v18 = *(void **)(*((void *)&v31 + 1) + 8 * i);
              id v19 = [v18 merchant];

              if (!v19)
              {
                dispatch_group_enter(v10);
                id v20 = [v8 uniqueID];
                v29[0] = MEMORY[0x1E4F143A8];
                v29[1] = 3221225472;
                id v29[2] = __87__PKDashboardPaymentPassDataSource__fetchMerchantForAuxiliarySections_pass_completion___block_invoke;
                v29[3] = &unk_1E59D9B58;
                void v29[4] = v18;
                unint64_t v30 = v10;
                [v9 merchantForPassUniqueIdentifier:v20 withAuxiliaryPassInformationItem:v18 completion:v29];
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v31 objects:v39 count:16];
          }
          while (v15);
        }

        uint64_t v11 = v26 + 1;
      }
      while (v26 + 1 != v25);
      uint64_t v25 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v25);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__PKDashboardPaymentPassDataSource__fetchMerchantForAuxiliarySections_pass_completion___block_invoke_3;
  block[3] = &unk_1E59CAA98;
  id v28 = v22;
  id v21 = v22;
  dispatch_group_notify(v10, MEMORY[0x1E4F14428], block);
}

void __87__PKDashboardPaymentPassDataSource__fetchMerchantForAuxiliarySections_pass_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__PKDashboardPaymentPassDataSource__fetchMerchantForAuxiliarySections_pass_completion___block_invoke_2;
  block[3] = &unk_1E59CA8E8;
  uint64_t v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __87__PKDashboardPaymentPassDataSource__fetchMerchantForAuxiliarySections_pass_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setMerchant:*(void *)(a1 + 40)];
  uint64_t v2 = *(NSObject **)(a1 + 48);

  dispatch_group_leave(v2);
}

uint64_t __87__PKDashboardPaymentPassDataSource__fetchMerchantForAuxiliarySections_pass_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)reloadTiles
{
  objc_initWeak(&location, self);
  id v3 = [(PKPaymentPass *)self->_pass uniqueID];
  paymentDataProvider = self->_paymentDataProvider;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__PKDashboardPaymentPassDataSource_reloadTiles__block_invoke;
  v5[3] = &unk_1E59CF060;
  objc_copyWeak(&v6, &location);
  void v5[4] = v3;
  [(PKPaymentDefaultDataProvider *)paymentDataProvider tilesForPassWithUniqueIdentifier:v3 context:1 completion:v5];
  objc_destroyWeak(&v6);

  objc_destroyWeak(&location);
}

void __47__PKDashboardPaymentPassDataSource_reloadTiles__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = [WeakRetained[110] uniqueID];
    id v8 = v6;
    id v9 = v7;
    if (v8 == v9)
    {
    }
    else
    {
      uint64_t v10 = v9;
      if (!v8 || !v9)
      {

        goto LABEL_10;
      }
      char v11 = [v8 isEqualToString:v9];

      if ((v11 & 1) == 0) {
        goto LABEL_10;
      }
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__PKDashboardPaymentPassDataSource_reloadTiles__block_invoke_2;
    block[3] = &unk_1E59CA8E8;
    uint64_t v12 = *(void *)(a1 + 32);
    void block[4] = v5;
    void block[5] = v12;
    id v14 = v3;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
LABEL_10:
}

void __47__PKDashboardPaymentPassDataSource_reloadTiles__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 880) uniqueID];
  int v3 = PKEqualObjects();

  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 48);
    [v4 _updateWithTiles:v5];
  }
}

- (void)_updateWithTiles:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self->_tileGroups;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__PKDashboardPaymentPassDataSource__updateWithTiles___block_invoke;
  aBlock[3] = &unk_1E59CB010;
  objc_copyWeak(&v15, &location);
  id v6 = v4;
  id v14 = v6;
  id v7 = _Block_copy(aBlock);
  id v8 = v7;
  if (self->_allContentIsLoaded)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    id v10[2] = __53__PKDashboardPaymentPassDataSource__updateWithTiles___block_invoke_2;
    v10[3] = &unk_1E59CA960;
    objc_copyWeak(&v12, &location);
    void v10[4] = v5;
    id v11 = v8;
    [WeakRetained performBatchUpdates:v10 completion:0];

    objc_destroyWeak(&v12);
  }
  else
  {
    (*((void (**)(void *))v7 + 2))(v7);
    [(PKDashboardPaymentPassDataSource *)self updateContentIsLoaded];
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __53__PKDashboardPaymentPassDataSource__updateWithTiles___block_invoke(uint64_t a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  *((unsigned char *)WeakRetained + 312) = 1;
  if ([*(id *)(a1 + 32) count]
    && ([*(id *)(a1 + 32) objectAtIndexedSubscript:0],
        int v3 = objc_claimAutoreleasedReturnValue(),
        [v3 metadata],
        id v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v4 isGroupType],
        v4,
        v3,
        (v5 & 1) == 0))
  {
    uint64_t v8 = [MEMORY[0x1E4F848D8] _createDefaultDashboardGroupTileWithChildTiles:*(void *)(a1 + 32)];
    id v9 = (void *)v8;
    if (v8)
    {
      v14[0] = v8;
      uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
      id v11 = (void *)*((void *)WeakRetained + 38);
      *((void *)WeakRetained + 38) = v10;
    }
    else
    {
      id v11 = (void *)*((void *)WeakRetained + 38);
      *((void *)WeakRetained + 38) = 0;
    }
  }
  else
  {
    if ([*(id *)(a1 + 32) count])
    {
      uint64_t v6 = [*(id *)(a1 + 32) copy];
      id v7 = (void *)*((void *)WeakRetained + 38);
      *((void *)WeakRetained + 38) = v6;
    }
    else
    {
      id v7 = (void *)*((void *)WeakRetained + 38);
      *((void *)WeakRetained + 38) = 0;
    }
  }
  uint64_t v12 = [*((id *)WeakRetained + 38) count];
  id v13 = [NSNumber numberWithUnsignedInteger:v12];
  [*((id *)WeakRetained + 8) setObject:v13 forKeyedSubscript:&unk_1EF2B9738];
}

void __53__PKDashboardPaymentPassDataSource__updateWithTiles___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    uint64_t v2 = +[PKCollectionViewItemsDiffCalculator calculateDiffBetweenOldSections:andNewSections:sectionIdentifier:sectionItemsAccessor:firstSectionIndex:](PKCollectionViewItemsDiffCalculator, "calculateDiffBetweenOldSections:andNewSections:sectionIdentifier:sectionItemsAccessor:firstSectionIndex:", *(void *)(a1 + 32), WeakRetained[38], &__block_literal_global_586, &__block_literal_global_589_0, [WeakRetained firstSectionIndexForSectionIdentifier:1]);
    [WeakRetained _applyDiff:v2];
  }
}

id __53__PKDashboardPaymentPassDataSource__updateWithTiles___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 metadata];
  int v3 = [v2 identifier];

  return v3;
}

id __53__PKDashboardPaymentPassDataSource__updateWithTiles___block_invoke_4(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a2 tiles];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    id v4 = [MEMORY[0x1E4F29128] UUID];
    char v5 = [v4 UUIDString];
    v8[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

- (void)_applyDiff:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v6 = [v4 deletedIndexPaths];
  [WeakRetained deleteItemsAtIndexPaths:v6];

  id v7 = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v8 = [v4 deletedSections];
  [v7 deleteSections:v8];

  id v9 = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v10 = [v4 insertedIndexPaths];
  [v9 insertItemsAtIndexPaths:v10];

  id v11 = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v12 = [v4 insertedSections];
  [v11 insertSections:v12];

  id v13 = [v4 movedFromIndexPaths];
  id v14 = [v4 movedToIndexPaths];
  if ([v13 count])
  {
    unint64_t v15 = 0;
    do
    {
      id v16 = objc_loadWeakRetained((id *)&self->_delegate);
      id v17 = [v13 objectAtIndexedSubscript:v15];
      id v18 = [v14 objectAtIndexedSubscript:v15];
      [v16 moveItemAtIndexPath:v17 toIndexPath:v18];

      ++v15;
    }
    while ([v13 count] > v15);
  }
  id v28 = v4;
  id v19 = objc_msgSend(v4, "changedIndexPaths", v14);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v30;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v30 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v29 + 1) + 8 * v23);
        id v25 = objc_loadWeakRetained((id *)&self->_delegate);
        uint64_t v26 = [(PKDashboardPaymentPassDataSource *)self itemAtIndexPath:v24];
        [v25 itemChanged:v26 atIndexPath:v24];

        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [v19 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v21);
  }
}

- (void)reloadHomeKitRestrictedGuestAccessState
{
  if ([(PKPaymentPass *)self->_pass isHomeKeyPass])
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F84748]);
    id v4 = [(PKPaymentPass *)self->_pass serialNumber];
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __75__PKDashboardPaymentPassDataSource_reloadHomeKitRestrictedGuestAccessState__block_invoke;
    v5[3] = &unk_1E59D9BA0;
    void v5[4] = v3;
    void v5[5] = v4;
    objc_copyWeak(&v6, &location);
    [v3 hasHomeAccessScheduleForPassSerialNumber:v4 withCompletion:v5];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  else
  {
    self->_homeKitRestrictedGuestAccessStateLoaded = 1;
  }
}

void __75__PKDashboardPaymentPassDataSource_reloadHomeKitRestrictedGuestAccessState__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __75__PKDashboardPaymentPassDataSource_reloadHomeKitRestrictedGuestAccessState__block_invoke_2;
    v11[3] = &unk_1E59CB268;
    objc_copyWeak(&v13, (id *)(a1 + 48));
    id v12 = v5;
    [v6 isHomeAccessRestrictedForPassSerialNumber:v7 withCompletion:v11];

    objc_destroyWeak(&v13);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      id v9 = WeakRetained;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __75__PKDashboardPaymentPassDataSource_reloadHomeKitRestrictedGuestAccessState__block_invoke_4;
      block[3] = &unk_1E59CA7D0;
      void block[4] = WeakRetained;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

void __75__PKDashboardPaymentPassDataSource_reloadHomeKitRestrictedGuestAccessState__block_invoke_2(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__PKDashboardPaymentPassDataSource_reloadHomeKitRestrictedGuestAccessState__block_invoke_3;
    block[3] = &unk_1E59CD7B0;
    void block[4] = WeakRetained;
    id v7 = *(id *)(a1 + 32);
    char v8 = a2;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __75__PKDashboardPaymentPassDataSource_reloadHomeKitRestrictedGuestAccessState__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateWithHomeKitHasHomeAccessSchedule:1 homeIdentifier:*(void *)(a1 + 40) isHomeAccessRestricted:*(unsigned __int8 *)(a1 + 48)];
}

uint64_t __75__PKDashboardPaymentPassDataSource_reloadHomeKitRestrictedGuestAccessState__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateWithHomeKitHasHomeAccessSchedule:0 homeIdentifier:0 isHomeAccessRestricted:0];
}

- (void)_updateWithHomeKitHasHomeAccessSchedule:(BOOL)a3 homeIdentifier:(id)a4 isHomeAccessRestricted:(BOOL)a5
{
  BOOL v5 = a5;
  int v7 = a3;
  id v9 = a4;
  int homeKitHasHomeGuestAccessSchedule = self->_homeKitHasHomeGuestAccessSchedule;
  BOOL v11 = homeKitHasHomeGuestAccessSchedule != v7;
  if (homeKitHasHomeGuestAccessSchedule != v7) {
    self->_int homeKitHasHomeGuestAccessSchedule = v7;
  }
  id v13 = v9;
  if (([(NSUUID *)self->_homeKitHomeIdentifier isEqual:v9] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_homeKitHomeIdentifier, a4);
    BOOL v11 = 1;
  }
  if (self->_homeKitIsHomeAccessRestricted != v5)
  {
    self->_homeKitIsHomeAccessRestricted = v5;
    BOOL v11 = 1;
  }
  self->_homeKitRestrictedGuestAccessStateLoaded = 1;
  [(PKDashboardPaymentPassDataSource *)self reloadMessages];
  if (self->_allContentIsLoaded)
  {
    if (v11)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained reloadNavigationBarAnimated:1];
    }
  }
  else
  {
    [(PKDashboardPaymentPassDataSource *)self updateContentIsLoaded];
  }
}

- (void)reloadMessages
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __50__PKDashboardPaymentPassDataSource_reloadMessages__block_invoke;
  v2[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E4F14428], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __50__PKDashboardPaymentPassDataSource_reloadMessages__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reloadMessages];
}

- (void)reloadCreditRecoveryPaymentPlans
{
  objc_initWeak(&location, self);
  accountService = self->_accountService;
  id v4 = [(PKAccount *)self->_account accountIdentifier];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__PKDashboardPaymentPassDataSource_reloadCreditRecoveryPaymentPlans__block_invoke;
  v5[3] = &unk_1E59D9BF0;
  objc_copyWeak(&v6, &location);
  [(PKAccountService *)accountService creditRecoveryPaymentPlanInformationForAccountIdentifier:v4 allowFetchFromServer:1 completion:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __68__PKDashboardPaymentPassDataSource_reloadCreditRecoveryPaymentPlans__block_invoke(uint64_t a1, char a2, char a3)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__PKDashboardPaymentPassDataSource_reloadCreditRecoveryPaymentPlans__block_invoke_2;
  v5[3] = &unk_1E59D9BC8;
  objc_copyWeak(&v6, (id *)(a1 + 32));
  char v7 = a2;
  char v8 = a3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
  objc_destroyWeak(&v6);
}

void __68__PKDashboardPaymentPassDataSource_reloadCreditRecoveryPaymentPlans__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    char v4 = *(unsigned char *)(a1 + 40);
    if ((v4 != 0) == (WeakRetained[728] == 0) || (*(unsigned char *)(a1 + 41) != 0) == (WeakRetained[729] == 0))
    {
      BOOL v5 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Dashboard credit recovery payment plans have changed", v6, 2u);
      }

      char v4 = *(unsigned char *)(a1 + 40);
    }
    v3[728] = v4;
    v3[729] = *(unsigned char *)(a1 + 41);
    v3[730] = 1;
    [v3 _reloadMessages];
    if (!v3[748]) {
      [v3 updateContentIsLoaded];
    }
  }
}

- (void)_reloadMessages
{
  if (self->_engagementMessagesLoaded
    && self->_familyCollectionLoaded
    && self->_homeKitRestrictedGuestAccessStateLoaded)
  {
    id v3 = dispatch_group_create();
    v301[0] = 0;
    v301[1] = v301;
    v301[2] = 0x3032000000;
    v301[3] = __Block_byref_object_copy__42;
    v301[4] = __Block_byref_object_dispose__42;
    id v302 = 0;
    dispatch_group_enter(v3);
    v298[0] = MEMORY[0x1E4F143A8];
    v298[1] = 3221225472;
    v298[2] = __51__PKDashboardPaymentPassDataSource__reloadMessages__block_invoke;
    v298[3] = &unk_1E59D9C18;
    v300 = v301;
    char v4 = v3;
    v299 = v4;
    [(PKDashboardPaymentPassDataSource *)self _messagesForAccountStatusWithCompletion:v298];
    v114 = [(PKDashboardPaymentPassDataSource *)self _messageForSessionActive];
    uint64_t v5 = [(PKDashboardPaymentPassDataSource *)self _messageForAutoReload];
    v109 = [(PKDashboardPaymentPassDataSource *)self _messageForExpressEducation];
    v112 = (void *)v5;
    v296[0] = 0;
    v296[1] = v296;
    v296[2] = 0x2020000000;
    char v297 = 0;
    v294[0] = 0;
    v294[1] = v294;
    v294[2] = 0x3032000000;
    v294[3] = __Block_byref_object_copy__42;
    v294[4] = __Block_byref_object_dispose__42;
    id v295 = 0;
    id v110 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v292[0] = 0;
    v292[1] = v292;
    v292[2] = 0x3032000000;
    v292[3] = __Block_byref_object_copy__42;
    v292[4] = __Block_byref_object_dispose__42;
    id v293 = 0;
    v290[0] = 0;
    v290[1] = v290;
    v290[2] = 0x3032000000;
    v290[3] = __Block_byref_object_copy__42;
    v290[4] = __Block_byref_object_dispose__42;
    id v291 = 0;
    v288[0] = 0;
    v288[1] = v288;
    v288[2] = 0x3032000000;
    v288[3] = __Block_byref_object_copy__42;
    v288[4] = __Block_byref_object_dispose__42;
    id v289 = 0;
    uint64_t v282 = 0;
    v283 = &v282;
    uint64_t v284 = 0x3032000000;
    v285 = __Block_byref_object_copy__42;
    v286 = __Block_byref_object_dispose__42;
    id v287 = 0;
    uint64_t v276 = 0;
    v277 = &v276;
    uint64_t v278 = 0x3032000000;
    v279 = __Block_byref_object_copy__42;
    v280 = __Block_byref_object_dispose__42;
    id v281 = 0;
    uint64_t v270 = 0;
    v271 = &v270;
    uint64_t v272 = 0x3032000000;
    v273 = __Block_byref_object_copy__42;
    v274 = __Block_byref_object_dispose__42;
    id v275 = 0;
    uint64_t v264 = 0;
    v265 = &v264;
    uint64_t v266 = 0x3032000000;
    v267 = __Block_byref_object_copy__42;
    v268 = __Block_byref_object_dispose__42;
    id v269 = 0;
    uint64_t v258 = 0;
    v259 = &v258;
    uint64_t v260 = 0x3032000000;
    v261 = __Block_byref_object_copy__42;
    v262 = __Block_byref_object_dispose__42;
    id v263 = 0;
    uint64_t v252 = 0;
    v253 = &v252;
    uint64_t v254 = 0x3032000000;
    v255 = __Block_byref_object_copy__42;
    v256 = __Block_byref_object_dispose__42;
    id v257 = 0;
    v250[0] = 0;
    v250[1] = v250;
    v250[2] = 0x3032000000;
    v250[3] = __Block_byref_object_copy__42;
    v250[4] = __Block_byref_object_dispose__42;
    id v251 = 0;
    uint64_t v244 = 0;
    v245 = &v244;
    uint64_t v246 = 0x3032000000;
    v247 = __Block_byref_object_copy__42;
    v248 = __Block_byref_object_dispose__42;
    id v249 = 0;
    v242[0] = 0;
    v242[1] = v242;
    v242[2] = 0x3032000000;
    v242[3] = __Block_byref_object_copy__42;
    v242[4] = __Block_byref_object_dispose__42;
    id v243 = 0;
    v240[0] = 0;
    v240[1] = v240;
    v240[2] = 0x3032000000;
    v240[3] = __Block_byref_object_copy__42;
    v240[4] = __Block_byref_object_dispose__42;
    id v241 = 0;
    uint64_t v234 = 0;
    v235 = &v234;
    uint64_t v236 = 0x3032000000;
    v237 = __Block_byref_object_copy__42;
    v238 = __Block_byref_object_dispose__42;
    id v239 = 0;
    v232[0] = 0;
    v232[1] = v232;
    v232[2] = 0x3032000000;
    v232[3] = __Block_byref_object_copy__42;
    v232[4] = __Block_byref_object_dispose__42;
    id v233 = 0;
    uint64_t v226 = 0;
    v227 = &v226;
    uint64_t v228 = 0x3032000000;
    v229 = __Block_byref_object_copy__42;
    v230 = __Block_byref_object_dispose__42;
    id v231 = 0;
    dispatch_group_enter(v4);
    id v6 = self->_precursorUpgradeController;
    if (!v6)
    {
      id v7 = objc_alloc(MEMORY[0x1E4F84E78]);
      pass = self->_pass;
      id v9 = [MEMORY[0x1E4F84D50] sharedService];
      id v6 = (PKPrecursorPassUpgradeController *)[v7 initWithPass:pass webService:v9];

      objc_storeStrong((id *)&self->_precursorUpgradeController, v6);
    }
    v220[0] = MEMORY[0x1E4F143A8];
    v220[1] = 3221225472;
    v220[2] = __51__PKDashboardPaymentPassDataSource__reloadMessages__block_invoke_2;
    v220[3] = &unk_1E59D9C40;
    uint64_t v10 = v6;
    v221 = v10;
    v222 = self;
    v224 = v232;
    v225 = &v234;
    BOOL v11 = v4;
    v223 = v11;
    [(PKDashboardPaymentPassDataSource *)self _messageForPrecursorPassUpgradeWithController:v10 completion:v220];
    v218[0] = 0;
    v218[1] = v218;
    v218[2] = 0x3032000000;
    v218[3] = __Block_byref_object_copy__42;
    v218[4] = __Block_byref_object_dispose__42;
    id v219 = 0;
    dispatch_group_enter(v11);
    v108 = v10;
    if (v235[5]) {
      BOOL v12 = 1;
    }
    else {
      BOOL v12 = self->_isAccessPass || v114 != 0;
    }
    v215[0] = MEMORY[0x1E4F143A8];
    v215[1] = 3221225472;
    v215[2] = __51__PKDashboardPaymentPassDataSource__reloadMessages__block_invoke_3;
    v215[3] = &unk_1E59D9C68;
    v217 = v218;
    id v14 = v11;
    v216 = v14;
    [(PKDashboardPaymentPassDataSource *)self _messageFromPaymentServiceSuppressingPassStateChanges:v12 completion:v215];
    account = self->_account;
    if (account)
    {
      id v16 = [(PKAccount *)account creditDetails];
      if (v16)
      {
        BOOL v17 = +[PKCreditAccountController shouldDisplayAccountInformationForTransactionSourceCollection:self->_transactionSourceCollection withAccount:self->_account];

        if (v17)
        {
          v106 = [(PKDashboardPaymentPassDataSource *)self _messagesForPhysicalCard];
          v111 = [(PKDashboardPaymentPassDataSource *)self _messagesForPhysicalCardExpiration];
          uint64_t v18 = [(PKDashboardPaymentPassDataSource *)self _messagesForInstallmentPlans];
          id v19 = (void *)v283[5];
          v283[5] = v18;

          uint64_t v20 = [(PKDashboardPaymentPassDataSource *)self _messageForBroadwayDiscoverability];
          uint64_t v21 = (void *)v227[5];
          v227[5] = v20;

          uint64_t v22 = objc_alloc_init(MEMORY[0x1E4F84518]);
          uint64_t v23 = [(PKAccount *)self->_account creditDetails];
          uint64_t v24 = [v23 rewardsDestination];

          if (v24 == 1)
          {
            v214[0] = MEMORY[0x1E4F143A8];
            v214[1] = 3221225472;
            v214[2] = __51__PKDashboardPaymentPassDataSource__reloadMessages__block_invoke_4;
            v214[3] = &unk_1E59CDD98;
            v214[4] = self;
            v214[5] = v294;
            [v22 addOperation:v214];
          }
          else if (v24 == 3)
          {
            v213[0] = MEMORY[0x1E4F143A8];
            v213[1] = 3221225472;
            v213[2] = __51__PKDashboardPaymentPassDataSource__reloadMessages__block_invoke_6;
            v213[3] = &unk_1E59CDD98;
            v213[4] = self;
            v213[5] = v294;
            [v22 addOperation:v213];
          }
          v212[0] = MEMORY[0x1E4F143A8];
          v212[1] = 3221225472;
          v212[2] = __51__PKDashboardPaymentPassDataSource__reloadMessages__block_invoke_8;
          v212[3] = &unk_1E59CDD98;
          v212[4] = self;
          v212[5] = v292;
          [v22 addOperation:v212];
          dispatch_group_enter(v14);
          long long v43 = [MEMORY[0x1E4F1CA98] null];
          v210[0] = MEMORY[0x1E4F143A8];
          v210[1] = 3221225472;
          v210[2] = __51__PKDashboardPaymentPassDataSource__reloadMessages__block_invoke_11;
          v210[3] = &unk_1E59D9CB8;
          int v44 = v14;
          v211 = v44;
          id v45 = (id)[v22 evaluateWithInput:v43 completion:v210];

          long long v46 = [(PKDashboardPaymentPassDataSource *)self _cardSharingEducationMessages];
          [v110 addObjectsFromArray:v46];

          dispatch_group_enter(v44);
          v207[0] = MEMORY[0x1E4F143A8];
          v207[1] = 3221225472;
          v207[2] = __51__PKDashboardPaymentPassDataSource__reloadMessages__block_invoke_12;
          v207[3] = &unk_1E59D9C68;
          v209 = v290;
          v208 = v44;
          [(PKDashboardPaymentPassDataSource *)self _messageForPaymentFailedWithCompletion:v207];

          goto LABEL_35;
        }
      }
    }
    peerPaymentAccount = self->_peerPaymentAccount;
    if (!peerPaymentAccount) {
      goto LABEL_29;
    }
    uint64_t v26 = [(PKPeerPaymentAccount *)peerPaymentAccount associatedPassUniqueID];
    uint64_t v27 = [(PKPaymentPass *)self->_pass uniqueID];
    id v28 = v26;
    id v29 = v27;
    if (v28 == v29)
    {
    }
    else
    {
      long long v30 = v29;
      if (!v28 || !v29)
      {

        goto LABEL_29;
      }
      char v31 = [v28 isEqualToString:v29];

      if ((v31 & 1) == 0)
      {
LABEL_29:
        long long v42 = self->_account;
        if (!v42 || [(PKAccount *)v42 feature] != 4)
        {
          v111 = 0;
          v106 = 0;
          goto LABEL_36;
        }
        dispatch_group_enter(v14);
        v201[0] = MEMORY[0x1E4F143A8];
        v201[1] = 3221225472;
        v201[2] = __51__PKDashboardPaymentPassDataSource__reloadMessages__block_invoke_14;
        v201[3] = &unk_1E59CC5A8;
        v203 = v240;
        v202 = v14;
        [(PKDashboardPaymentPassDataSource *)self appleBalanceDashboardMessagesWithCompletion:v201];
        v111 = 0;
        v106 = 0;
        uint64_t v22 = v202;
LABEL_35:

LABEL_36:
        uint64_t v195 = 0;
        v196 = &v195;
        uint64_t v197 = 0x3032000000;
        v198 = __Block_byref_object_copy__42;
        v199 = __Block_byref_object_dispose__42;
        id v200 = 0;
        v193[0] = 0;
        v193[1] = v193;
        v193[2] = 0x3032000000;
        v193[3] = __Block_byref_object_copy__42;
        v193[4] = __Block_byref_object_dispose__42;
        id v194 = 0;
        v191[0] = 0;
        v191[1] = v191;
        v191[2] = 0x3032000000;
        v191[3] = __Block_byref_object_copy__42;
        v191[4] = __Block_byref_object_dispose__42;
        id v192 = 0;
        uint64_t v185 = 0;
        v186 = &v185;
        uint64_t v187 = 0x3032000000;
        v188 = __Block_byref_object_copy__42;
        v189 = __Block_byref_object_dispose__42;
        id v190 = 0;
        v183[0] = 0;
        v183[1] = v183;
        v183[2] = 0x3032000000;
        v183[3] = __Block_byref_object_copy__42;
        v183[4] = __Block_byref_object_dispose__42;
        id v184 = 0;
        __int16 v47 = [(PKPaymentPass *)self->_pass devicePrimaryPaymentApplication];
        uint64_t v48 = [v47 state];

        if (v48 == 7)
        {
          BOOL v104 = 0;
          goto LABEL_48;
        }
        uint64_t v49 = self->_account;
        if (v49)
        {
          if ([(PKAccount *)v49 type] == 1)
          {
            BOOL v50 = 0;
            BOOL v104 = [(PKAccount *)self->_account state] != 1;
LABEL_45:
            dispatch_group_enter(v14);
            v180[0] = MEMORY[0x1E4F143A8];
            v180[1] = 3221225472;
            v180[2] = __51__PKDashboardPaymentPassDataSource__reloadMessages__block_invoke_15;
            v180[3] = &unk_1E59D9C18;
            v182 = v193;
            v181 = v14;
            [(PKDashboardPaymentPassDataSource *)self _messagesForPeerPaymentPendingRequestsWithCompletion:v180];
            if (v50)
            {
              uint64_t v51 = [(PKDashboardPaymentPassDataSource *)self _peerPaymentAccountStatusMessage];
              long long v52 = (void *)v186[5];
              v186[5] = v51;
            }
            uint64_t v53 = [(PKDashboardPaymentPassDataSource *)self recurringPaymentDashboardMessages];
            long long v54 = (void *)v196[5];
            v196[5] = v53;

LABEL_48:
            if (self->_showAMPEnrollmentMessage)
            {
              v102 = [(PKDashboardPaymentPassDataSource *)self _messageForAMPEnrollment];
            }
            else
            {
              v102 = 0;
            }
            dispatch_group_enter(v14);
            v177[0] = MEMORY[0x1E4F143A8];
            v177[1] = 3221225472;
            v177[2] = __51__PKDashboardPaymentPassDataSource__reloadMessages__block_invoke_16;
            v177[3] = &unk_1E59D9C68;
            v179 = v288;
            long long v55 = v14;
            v178 = v55;
            [(PKDashboardPaymentPassDataSource *)self _messageForEnableNotificationsWithCompletion:v177];
            v100 = [(PKDashboardPaymentPassDataSource *)self _messageForPaymentInformationEventExtensionInstallation];
            v98 = [(PKDashboardPaymentPassDataSource *)self _messagesForAccountUserInvitations];
            v96 = [(PKDashboardPaymentPassDataSource *)self _messagesForAccountUserSetupCashForFamily];
            v94 = [(PKDashboardPaymentPassDataSource *)self _messagesToOrderPhysicalCardForUnderageParticipants];
            long long v56 = [(PKDashboardPaymentPassDataSource *)self _messagesForLockedCardParticipants];
            long long v57 = [(PKDashboardPaymentPassDataSource *)self _messageForAccountPendingFamilyMembers];
            long long v58 = [(PKDashboardPaymentPassDataSource *)self _messageForFirstMonthCoOwners];
            if (([(PKPaymentPass *)self->_pass supportedRadioTechnologies] & 2) != 0)
            {
              long long v59 = [(PKDashboardPaymentPassDataSource *)self _messageForRangingSuspendedPass];
            }
            else
            {
              long long v59 = 0;
            }
            dispatch_group_enter(v55);
            v174[0] = MEMORY[0x1E4F143A8];
            v174[1] = 3221225472;
            v174[2] = __51__PKDashboardPaymentPassDataSource__reloadMessages__block_invoke_17;
            v174[3] = &unk_1E59D9C68;
            v176 = v250;
            long long v60 = v55;
            v175 = v60;
            [(PKDashboardPaymentPassDataSource *)self _messageForUnusableIdentityPassWithCompletion:v174];
            uint64_t v61 = [(PKDashboardPaymentPassDataSource *)self _messageForIdentityFirstTimeUse];
            long long v62 = (void *)v245[5];
            v245[5] = v61;

            dispatch_group_enter(v60);
            v171[0] = MEMORY[0x1E4F143A8];
            v171[1] = 3221225472;
            v171[2] = __51__PKDashboardPaymentPassDataSource__reloadMessages__block_invoke_18;
            v171[3] = &unk_1E59D9C68;
            v173 = v242;
            long long v63 = v60;
            v172 = v63;
            [(PKDashboardPaymentPassDataSource *)self _messageForPassInconsistencyWithCompletion:v171];
            long long v64 = [(PKDashboardPaymentPassDataSource *)self _messageForDeviceAssessmentEducation];
            v169[0] = 0;
            v169[1] = v169;
            v169[2] = 0x3032000000;
            v169[3] = __Block_byref_object_copy__42;
            v169[4] = __Block_byref_object_dispose__42;
            id v170 = 0;
            if (PKFinHealthPeerPaymentSuggestionsEnabled()
              && [(PKPeerPaymentAccount *)self->_peerPaymentAccount supportsRecurringPayments])
            {
              uint64_t v65 = self->_peerPaymentAccount;
              uint64_t v66 = [(PKFamilyMemberCollection *)self->_familyCollection currentUser];
              if ([(PKPeerPaymentAccount *)v65 isEligibleForRecurringPaymentsForUser:v66])
              {
                char v67 = PKIsVision();

                if (v67) {
                  goto LABEL_60;
                }
                dispatch_group_enter(v63);
                v166[0] = MEMORY[0x1E4F143A8];
                v166[1] = 3221225472;
                v166[2] = __51__PKDashboardPaymentPassDataSource__reloadMessages__block_invoke_19;
                v166[3] = &unk_1E59CC5A8;
                v168 = v169;
                v167 = v63;
                [(PKDashboardPaymentPassDataSource *)self _recurringPeerPaymentSuggestionsWithCompletion:v166];
                uint64_t v66 = v167;
              }
            }
LABEL_60:
            v68 = [MEMORY[0x1E4F84D50] sharedService];
            int v69 = PKVirtualCardEnabledWithWebService();

            if (!v69)
            {
              id v93 = 0;
LABEL_70:
              uint64_t v75 = [(PKDashboardPaymentPassDataSource *)self messageForSavingsAccountFDIC];
              v76 = [(PKDashboardPaymentPassDataSource *)self messagesForSavingsAccountStatus];
              group = v63;
              v90 = [(PKDashboardPaymentPassDataSource *)self _messageForHomeAccessRestricted];
              objc_initWeak(&location, self);
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __51__PKDashboardPaymentPassDataSource__reloadMessages__block_invoke_20;
              block[3] = &unk_1E59D9D00;
              objc_copyWeak(&v163, &location);
              v137 = &v185;
              v138 = v290;
              v139 = v301;
              v140 = v296;
              id v88 = v56;
              v89 = v59;
              id v117 = v59;
              id v118 = v56;
              v141 = v250;
              v142 = v232;
              id v119 = v111;
              id v120 = v75;
              id v121 = v76;
              id v122 = v114;
              v143 = &v234;
              v144 = v218;
              v87 = v64;
              id v123 = v64;
              id v124 = v112;
              v145 = &v264;
              v146 = &v258;
              v147 = &v270;
              v148 = &v252;
              id v125 = v109;
              id v126 = v57;
              id v127 = v58;
              id v128 = v98;
              id v129 = v96;
              id v130 = v94;
              v149 = v183;
              v150 = &v282;
              v151 = &v226;
              v152 = v288;
              id v131 = v106;
              id v132 = v93;
              v153 = v294;
              v154 = v193;
              v155 = &v195;
              v156 = &v276;
              id v86 = v76;
              id v133 = v102;
              id v134 = v100;
              v157 = v191;
              v158 = v242;
              v159 = v240;
              v160 = v292;
              BOOL v164 = v104;
              v161 = &v244;
              v162 = v169;
              id v135 = v90;
              v136 = self;
              id v91 = v90;
              id v101 = v100;
              id v105 = v102;
              id v77 = v93;
              id v78 = v106;
              id v107 = v94;
              id v103 = v96;
              id v99 = v98;
              id v97 = v58;
              id v95 = v57;
              id v79 = v109;
              id v80 = v112;
              id v81 = v87;
              id v115 = v114;
              id v82 = v86;
              id v83 = v75;
              id v113 = v111;
              id v84 = v88;
              id v85 = v89;
              dispatch_group_notify(group, MEMORY[0x1E4F14428], block);

              objc_destroyWeak(&v163);
              objc_destroyWeak(&location);
              _Block_object_dispose(v169, 8);

              _Block_object_dispose(v183, 8);
              _Block_object_dispose(&v185, 8);

              _Block_object_dispose(v191, 8);
              _Block_object_dispose(v193, 8);

              _Block_object_dispose(&v195, 8);
              _Block_object_dispose(v218, 8);

              _Block_object_dispose(&v226, 8);
              _Block_object_dispose(v232, 8);

              _Block_object_dispose(&v234, 8);
              _Block_object_dispose(v240, 8);

              _Block_object_dispose(v242, 8);
              _Block_object_dispose(&v244, 8);

              _Block_object_dispose(v250, 8);
              _Block_object_dispose(&v252, 8);

              _Block_object_dispose(&v258, 8);
              _Block_object_dispose(&v264, 8);

              _Block_object_dispose(&v270, 8);
              _Block_object_dispose(&v276, 8);

              _Block_object_dispose(&v282, 8);
              _Block_object_dispose(v288, 8);

              _Block_object_dispose(v290, 8);
              _Block_object_dispose(v292, 8);

              _Block_object_dispose(v294, 8);
              _Block_object_dispose(v296, 8);

              _Block_object_dispose(v301, 8);
              return;
            }
            v70 = [(PKPaymentPass *)self->_pass paymentPass];
            uint64_t v71 = [v70 associatedAccountFeatureIdentifier];
            if ([v70 supportsVirtualCardNumber]
              && ([v70 hasActiveVirtualCard] & 1) == 0)
            {
              char v72 = [(PKPaymentPass *)self->_pass ingestedDate];
              [v72 timeIntervalSinceNow];
              double v74 = fabs(v73);

              if (v74 > 300.0)
              {
                id v93 = [(PKDashboardPaymentPassDataSource *)self _messageForSetUpVirtualCardWithFeatureIdentifier:v71];
                goto LABEL_69;
              }
            }
            else if ([v70 hasActiveVirtualCard])
            {
              id v93 = [(PKDashboardPaymentPassDataSource *)self _messageForVirtualCardEnabledWithFeatureIdentifier:v71];
LABEL_69:

              goto LABEL_70;
            }
            id v93 = 0;
            goto LABEL_69;
          }
        }
        else if (self->_peerPaymentAccount && PKPeerPaymentAccountResolutionForAccountAndPeerPaymentPass() == 3)
        {
          BOOL v104 = 0;
          BOOL v50 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount role] == 0;
          goto LABEL_45;
        }
        BOOL v104 = 0;
        BOOL v50 = 0;
        goto LABEL_45;
      }
    }
    dispatch_group_enter(v14);
    v204[0] = MEMORY[0x1E4F143A8];
    v204[1] = 3221225472;
    v204[2] = __51__PKDashboardPaymentPassDataSource__reloadMessages__block_invoke_13;
    v204[3] = &unk_1E59D9C68;
    v206 = v294;
    v205 = v14;
    [(PKDashboardPaymentPassDataSource *)self _messageForPeerPaymentIdentityVerificationForRewardsWithCompletion:v204];
    uint64_t v32 = [(PKDashboardPaymentPassDataSource *)self _messageForPeerPaymentLockedAccountByAssociatedAccount];
    long long v33 = (void *)v271[5];
    v271[5] = v32;

    uint64_t v34 = [(PKDashboardPaymentPassDataSource *)self _messageForPeerPaymentFamilySharing];
    long long v35 = (void *)v277[5];
    v277[5] = v34;

    uint64_t v36 = [(PKDashboardPaymentPassDataSource *)self _messageForPeerPaymentAssociatedAccountStateChangedForSecurityReasons];
    long long v37 = (void *)v265[5];
    v265[5] = v36;

    uint64_t v38 = [(PKDashboardPaymentPassDataSource *)self _messageForPeerPaymentAssociatedAccountLockedAccount];
    id v39 = (void *)v259[5];
    v259[5] = v38;

    uint64_t v40 = [(PKDashboardPaymentPassDataSource *)self _messageForPeerPaymentAssociatedAccountPending];
    uint64_t v41 = (void *)v253[5];
    v253[5] = v40;

    v111 = 0;
    v106 = 0;
    uint64_t v22 = v205;
    goto LABEL_35;
  }
}

void __51__PKDashboardPaymentPassDataSource__reloadMessages__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __51__PKDashboardPaymentPassDataSource__reloadMessages__block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (v8)
  {
    [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 176), *(id *)(a1 + 32));
    uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
    id v4 = v8;
    uint64_t v5 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v4;
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 40) _messageForPaymentApplicationStatus];
    uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v5 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __51__PKDashboardPaymentPassDataSource__reloadMessages__block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __51__PKDashboardPaymentPassDataSource__reloadMessages__block_invoke_4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  id v12[2] = __51__PKDashboardPaymentPassDataSource__reloadMessages__block_invoke_5;
  v12[3] = &unk_1E59D9C90;
  id v9 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v14 = v7;
  uint64_t v15 = v8;
  id v13 = v6;
  id v10 = v6;
  id v11 = v7;
  [v9 _messageForPeerPaymentRewardsRedemptionWithCompletion:v12];
}

void __51__PKDashboardPaymentPassDataSource__reloadMessages__block_invoke_5(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __51__PKDashboardPaymentPassDataSource__reloadMessages__block_invoke_6(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  id v12[2] = __51__PKDashboardPaymentPassDataSource__reloadMessages__block_invoke_7;
  v12[3] = &unk_1E59D9C90;
  id v9 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v14 = v7;
  uint64_t v15 = v8;
  id v13 = v6;
  id v10 = v6;
  id v11 = v7;
  [v9 messageForSavingsRewardsRedemptionWithCompletion:v12];
}

void __51__PKDashboardPaymentPassDataSource__reloadMessages__block_invoke_7(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __51__PKDashboardPaymentPassDataSource__reloadMessages__block_invoke_8(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  id v12[2] = __51__PKDashboardPaymentPassDataSource__reloadMessages__block_invoke_9;
  v12[3] = &unk_1E59D44F0;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v14 = v7;
  uint64_t v15 = v9;
  void v12[4] = v8;
  id v13 = v6;
  id v10 = v6;
  id v11 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v12);
}

void __51__PKDashboardPaymentPassDataSource__reloadMessages__block_invoke_9(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__PKDashboardPaymentPassDataSource__reloadMessages__block_invoke_10;
  v5[3] = &unk_1E59D9C90;
  long long v4 = *(_OWORD *)(a1 + 48);
  id v3 = (id)v4;
  long long v7 = v4;
  id v6 = *(id *)(a1 + 40);
  [v2 _messageForInterestChargeWithCompletion:v5];
}

void __51__PKDashboardPaymentPassDataSource__reloadMessages__block_invoke_10(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __51__PKDashboardPaymentPassDataSource__reloadMessages__block_invoke_11(uint64_t a1)
{
}

void __51__PKDashboardPaymentPassDataSource__reloadMessages__block_invoke_12(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __51__PKDashboardPaymentPassDataSource__reloadMessages__block_invoke_13(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __51__PKDashboardPaymentPassDataSource__reloadMessages__block_invoke_14(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __51__PKDashboardPaymentPassDataSource__reloadMessages__block_invoke_15(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __51__PKDashboardPaymentPassDataSource__reloadMessages__block_invoke_16(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __51__PKDashboardPaymentPassDataSource__reloadMessages__block_invoke_17(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __51__PKDashboardPaymentPassDataSource__reloadMessages__block_invoke_18(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __51__PKDashboardPaymentPassDataSource__reloadMessages__block_invoke_19(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __51__PKDashboardPaymentPassDataSource__reloadMessages__block_invoke_20(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 400));
  if (!WeakRetained) {
    goto LABEL_109;
  }
  id v19 = WeakRetained;
  *((unsigned char *)WeakRetained + 328) = 1;
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  id v4 = v3;
  if (!*(void *)(*(void *)(*(void *)(a1 + 192) + 8) + 40))
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 200) + 8) + 40)) {
      objc_msgSend(v3, "addObject:");
    }
    unint64_t v5 = [v19[49] stateReason];
    if ([v19[49] state] != 2 || v5 > 8) {
      unsigned int v7 = 0;
    }
    else {
      unsigned int v7 = (0x10Au >> v5) & 1;
    }
    if (*(void *)(*(void *)(*(void *)(a1 + 208) + 8) + 40)
      && ((*(unsigned char *)(*(void *)(*(void *)(a1 + 216) + 8) + 24) != 0) & ~v7) == 0)
    {
      objc_msgSend(v4, "unionOrderedSet:");
    }
    if (*(void *)(*(void *)(*(void *)(a1 + 224) + 8) + 40)) {
      objc_msgSend(v4, "addObject:");
    }
    if (*(void *)(a1 + 32)) {
      objc_msgSend(v4, "addObject:");
    }
    if ([*(id *)(a1 + 40) count]) {
      [v4 addObjectsFromArray:*(void *)(a1 + 40)];
    }
    if (*(void *)(*(void *)(*(void *)(a1 + 232) + 8) + 40)) {
      objc_msgSend(v4, "addObject:");
    }
    uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 240) + 8) + 40);
    if (v8)
    {
      id v9 = v19[49];
      if (v9)
      {
        if ([v9 state] == 4) {
          goto LABEL_27;
        }
        uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 240) + 8) + 40);
      }
      [v4 addObject:v8];
    }
LABEL_27:
    if ([*(id *)(a1 + 48) count]) {
      [v4 addObjectsFromArray:*(void *)(a1 + 48)];
    }
    if (*(void *)(a1 + 56)) {
      objc_msgSend(v4, "addObject:");
    }
    if (*(void *)(a1 + 64)) {
      objc_msgSend(v4, "addObjectsFromArray:");
    }
    if (*(void *)(a1 + 72)) {
      objc_msgSend(v4, "addObject:");
    }
    if (*(void *)(a1 + 80)) {
      objc_msgSend(v4, "addObject:");
    }
    if (*(void *)(*(void *)(*(void *)(a1 + 248) + 8) + 40)) {
      objc_msgSend(v4, "addObject:");
    }
    if (*(void *)(a1 + 88)) {
      objc_msgSend(v4, "addObject:");
    }
    if (*(void *)(a1 + 96)) {
      objc_msgSend(v4, "addObject:");
    }
    if ([*(id *)(*(void *)(*(void *)(a1 + 256) + 8) + 40) count]) {
      [v4 addObjectsFromArray:*(void *)(*(void *)(*(void *)(a1 + 256) + 8) + 40)];
    }
    if ([*(id *)(*(void *)(*(void *)(a1 + 264) + 8) + 40) count]) {
      [v4 addObjectsFromArray:*(void *)(*(void *)(*(void *)(a1 + 264) + 8) + 40)];
    }
    if (*(void *)(*(void *)(*(void *)(a1 + 272) + 8) + 40)) {
      objc_msgSend(v4, "addObject:");
    }
    if (*(void *)(*(void *)(*(void *)(a1 + 280) + 8) + 40)) {
      objc_msgSend(v4, "addObject:");
    }
    if (*(void *)(*(void *)(*(void *)(a1 + 288) + 8) + 40)) {
      objc_msgSend(v4, "addObject:");
    }
    id v10 = [v19 payLaterDashboardMessageComposer];
    id v11 = [v10 dashboardMessages];
    BOOL v12 = [v11 array];
    [v4 addObjectsFromArray:v12];

    if (*(void *)(a1 + 104)) {
      objc_msgSend(v4, "addObject:");
    }
    if (*(void *)(a1 + 112)) {
      objc_msgSend(v4, "addObject:");
    }
    if ([*(id *)(a1 + 120) count]) {
      [v4 addObjectsFromArray:*(void *)(a1 + 120)];
    }
    if ([*(id *)(a1 + 128) count]) {
      [v4 addObjectsFromArray:*(void *)(a1 + 128)];
    }
    if ([*(id *)(a1 + 136) count]) {
      [v4 addObjectsFromArray:*(void *)(a1 + 136)];
    }
    if ([*(id *)(*(void *)(*(void *)(a1 + 296) + 8) + 40) count]) {
      [v4 addObjectsFromArray:*(void *)(*(void *)(*(void *)(a1 + 296) + 8) + 40)];
    }
    if (*(void *)(*(void *)(*(void *)(a1 + 304) + 8) + 40)) {
      objc_msgSend(v4, "addObject:");
    }
    if (*(void *)(*(void *)(*(void *)(a1 + 312) + 8) + 40)) {
      objc_msgSend(v4, "addObject:");
    }
    if ([*(id *)(a1 + 144) count]) {
      [v4 addObjectsFromArray:*(void *)(a1 + 144)];
    }
    if (*(void *)(a1 + 152)) {
      objc_msgSend(v4, "addObject:");
    }
    if (*(void *)(*(void *)(*(void *)(a1 + 320) + 8) + 40)) {
      objc_msgSend(v4, "addObject:");
    }
    if ([*(id *)(*(void *)(*(void *)(a1 + 328) + 8) + 40) count]) {
      [v4 unionOrderedSet:*(void *)(*(void *)(*(void *)(a1 + 328) + 8) + 40)];
    }
    if ([*(id *)(*(void *)(*(void *)(a1 + 336) + 8) + 40) count]) {
      [v4 unionOrderedSet:*(void *)(*(void *)(*(void *)(a1 + 336) + 8) + 40)];
    }
    if (*(void *)(*(void *)(*(void *)(a1 + 344) + 8) + 40)) {
      objc_msgSend(v4, "addObject:");
    }
    if ([*(id *)(*(void *)(*(void *)(a1 + 352) + 8) + 40) count]) {
      [v4 unionOrderedSet:*(void *)(*(void *)(*(void *)(a1 + 352) + 8) + 40)];
    }
    if (*(void *)(a1 + 160)) {
      objc_msgSend(v4, "addObject:");
    }
    if (*(void *)(a1 + 168)) {
      objc_msgSend(v4, "addObject:");
    }
    if (*(void *)(*(void *)(*(void *)(a1 + 360) + 8) + 40)) {
      objc_msgSend(v4, "addObject:");
    }
    if (*(void *)(*(void *)(*(void *)(a1 + 368) + 8) + 40)) {
      objc_msgSend(v4, "addObjectsFromArray:");
    }
    if (*(void *)(*(void *)(*(void *)(a1 + 376) + 8) + 40)) {
      objc_msgSend(v4, "addObject:");
    }
    if (!*(void *)(*(void *)(*(void *)(a1 + 384) + 8) + 40)) {
      goto LABEL_95;
    }
  }
  objc_msgSend(v4, "addObject:");
LABEL_95:
  if ([v19[75] count])
  {
    if (*(unsigned char *)(a1 + 408))
    {
      id v13 = objc_msgSend(v19[75], "pk_objectsPassingTest:", &__block_literal_global_602);
      [v4 addObjectsFromArray:v13];
    }
    else
    {
      [v4 addObjectsFromArray:v19[75]];
    }
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 392) + 8) + 40)) {
    objc_msgSend(v4, "addObjectsFromArray:");
  }
  if (*(void *)(a1 + 176)) {
    objc_msgSend(v4, "addObject:");
  }
  uint64_t v14 = [v4 copy];
  id v15 = v19[40];
  v19[40] = (id)v14;

  if (*((unsigned char *)v19 + 748))
  {
    id v16 = objc_loadWeakRetained(v19 + 5);
    if (v16)
    {
      uint64_t v17 = [*(id *)(a1 + 184) firstSectionIndexForSectionIdentifier:8];
      uint64_t v18 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v17];
      [v16 reloadSections:v18];
    }
  }
  else
  {
    [v19 updateContentIsLoaded];
  }

  id WeakRetained = v19;
LABEL_109:
}

BOOL __51__PKDashboardPaymentPassDataSource__reloadMessages__block_invoke_21(uint64_t a1, void *a2)
{
  return [a2 type] == 3;
}

- (void)reloadSecondaryMessages
{
  self->_secondaryMessagesLoaded = 1;
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  id v3 = [(PKDashboardPaymentPassDataSource *)self bankConnectMessage];

  if (v3)
  {
    id v4 = [(PKDashboardPaymentPassDataSource *)self bankConnectMessage];
    [v15 addObject:v4];
  }
  if ([(NSOrderedSet *)self->_secondaryMessages count])
  {
    BOOL v5 = 1;
    id v6 = v15;
  }
  else
  {
    uint64_t v7 = [v15 count];
    id v6 = v15;
    BOOL v5 = v7 != 0;
  }
  uint64_t v8 = (NSOrderedSet *)[v6 copy];
  secondaryMessages = self->_secondaryMessages;
  self->_secondaryMessages = v8;

  if (self->_allContentIsLoaded)
  {
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (!WeakRetained) {
      BOOL v5 = 0;
    }

    if (v5)
    {
      unint64_t v12 = [(PKDashboardPaymentPassDataSource *)self firstSectionIndexForSectionIdentifier:9];
      id v13 = objc_loadWeakRetained((id *)p_delegate);
      uint64_t v14 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v12];
      [v13 reloadSections:v14];
    }
  }
  else
  {
    [(PKDashboardPaymentPassDataSource *)self updateContentIsLoaded];
  }
}

- (id)_messageForDeviceAssessmentEducation
{
  if (self->_shouldDisplayDeviceAssessmentEducation)
  {
    id v3 = objc_alloc_init(PKDashboardPassMessage);
    [(PKDashboardPassMessage *)v3 setIdentifier:@"deviceAssessmentEducation"];
    id v4 = [(PKDashboardPaymentPassDataSource *)self _deviceAssessmentEducationImage];
    [(PKDashboardPassMessage *)v3 setImage:v4];

    BOOL v5 = PKLocalizedPaymentString(&cfstr_DeviceAssessme.isa);
    [(PKDashboardPassMessage *)v3 setTitle:v5];

    id v6 = PKLocalizedPaymentString(&cfstr_DeviceAssessme_0.isa);
    [(PKDashboardPassMessage *)v3 setMessage:v6];

    uint64_t v7 = PKLocalizedPaymentString(&cfstr_DeviceAssessme_1.isa);
    [(PKDashboardPassMessage *)v3 setButtonTitle:v7];

    [(PKDashboardPassMessage *)v3 setShowDisclosure:1];
    uint64_t v8 = [(PKDashboardPaymentPassDataSource *)self actionCallingSelectorWeakly:sel_openDeviceAssessmentEducationLearnMore];
    [(PKDashboardPassMessage *)v3 setActionOnButtonPress:v8];

    id v9 = [(PKDashboardPaymentPassDataSource *)self actionCallingSelectorWeakly:sel_dismissOnDeviceAssessmentEducation];
    [(PKDashboardPassMessage *)v3 setActionOnDismiss:v9];

    [(PKDashboardPassMessage *)v3 setActionOnViewed:&__block_literal_global_619];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

void __72__PKDashboardPaymentPassDataSource__messageForDeviceAssessmentEducation__block_invoke()
{
  if (PKTorinoConsentSyncEnabled())
  {
    unint64_t v0 = objc_msgSend(MEMORY[0x1E4F83AC8], "pk_privacyContentVersionForContext:", 1);
    if (v0 > PKHasSeenPrivacyTermsVersion())
    {
      PKSetHasSeenPrivacyTermsVersion();
      id v1 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        _os_log_impl(&dword_19F450000, v1, OS_LOG_TYPE_DEFAULT, "Privacy UI State sync to server", v6, 2u);
      }

      uint64_t v2 = [MEMORY[0x1E4F84D50] sharedService];
      id v3 = objc_alloc(MEMORY[0x1E4F84E88]);
      id v4 = [NSNumber numberWithUnsignedInteger:v0];
      BOOL v5 = (void *)[v3 initWithPrivacyUiState:v4];

      [v2 sendPrivacyDeviceAssessmentStateWithRequest:v5 completion:&__block_literal_global_625];
    }
  }
  else
  {
    PKSetHasSeenDeviceAssessmentEducation();
  }
}

void __72__PKDashboardPaymentPassDataSource__messageForDeviceAssessmentEducation__block_invoke_622(uint64_t a1, int a2, void *a3)
{
  id v4 = a3;
  BOOL v5 = PKLogFacilityTypeGetObject();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v6)
    {
      __int16 v10 = 0;
      uint64_t v7 = "Privacy UI State version has been synced";
      uint64_t v8 = (uint8_t *)&v10;
LABEL_6:
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    }
  }
  else if (v6)
  {
    __int16 v9 = 0;
    uint64_t v7 = "Privacy UI State version has failed to sync";
    uint64_t v8 = (uint8_t *)&v9;
    goto LABEL_6;
  }
}

- (id)_deviceAssessmentEducationImage
{
  uint64_t v2 = [MEMORY[0x1E4FB1830] configurationWithPointSize:26.0];
  id v3 = [MEMORY[0x1E4FB1818] systemImageNamed:@"shield.lefthalf.filled" withConfiguration:v2];
  id v4 = [MEMORY[0x1E4FB1618] whiteColor];
  BOOL v5 = [v3 imageWithTintColor:v4];

  BOOL v6 = [MEMORY[0x1E4FB1618] blackColor];
  uint64_t v7 = PKUIImageWithBackground(v5, v6, 45.0, 45.0);

  return v7;
}

- (void)openDeviceAssessmentEducationLearnMore
{
  id v3 = [(UIView *)self->_groupView pkui_viewControllerFromResponderChain];
  if (v3)
  {
    uint64_t v2 = [MEMORY[0x1E4F83AD8] presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.applepay"];
    [v2 setPresentingViewController:v3];
    [v2 present];
  }
}

- (void)dismissOnDeviceAssessmentEducation
{
  self->_shouldDisplayDeviceAssessmentEducation = 0;
  [(PKDashboardPaymentPassDataSource *)self reloadMessages];
}

- (id)actionCallingSelectorWeakly:(SEL)a3
{
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__PKDashboardPaymentPassDataSource_actionCallingSelectorWeakly___block_invoke;
  aBlock[3] = &unk_1E59CF720;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  id v4 = _Block_copy(aBlock);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);

  return v4;
}

void __64__PKDashboardPaymentPassDataSource_actionCallingSelectorWeakly___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    ((void (*)(id, void))[WeakRetained methodForSelector:*(void *)(a1 + 40)])(WeakRetained, *(void *)(a1 + 40));
    id WeakRetained = v3;
  }
}

- (id)_messageForPaymentApplicationStatus
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  objc_initWeak(location, self);
  if (self->_isInRestrictedMode)
  {
    id v3 = PKLocalizedPaymentString(&cfstr_RestrictedMode.isa);
    id v4 = PKLocalizedPaymentString(&cfstr_RestrictedMode_0.isa);
    BOOL v5 = 0;
    uint64_t v6 = 0;
    uint64_t v120 = 0;
    uint64_t v7 = 0;
    goto LABEL_3;
  }
  if (![(PKPaymentPass *)self->_pass hasAssociatedPeerPaymentAccount])
  {
LABEL_13:
    BOOL v5 = 0;
    uint64_t v120 = 0;
    uint64_t v7 = 0;
    id v16 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    char v14 = 0;
    goto LABEL_14;
  }
  uint64_t v12 = [(PKDashboardPaymentPassDataSource *)self _peerPaymentDashboardCondition];
  char v14 = 0;
  BOOL v5 = 0;
  LODWORD(v120) = 0;
  if (!self->_peerPaymentAccount)
  {
    HIDWORD(v120) = 0;
    uint64_t v7 = 0;
    id v16 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    goto LABEL_14;
  }
  id v15 = (void *)v12;
  HIDWORD(v120) = 0;
  uint64_t v7 = 0;
  id v16 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  if ((v12 & 0x100) == 0) {
    goto LABEL_14;
  }
  id v19 = v13;
  if ([(PKPaymentPass *)self->_pass activationState] == PKPaymentPassActivationStateSuspended) {
    goto LABEL_13;
  }
  switch((unint64_t)v19)
  {
    case 1uLL:
      uint64_t v18 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentSet_14.isa);
      id v16 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentAcc_3.isa);
      uint64_t v32 = [(PKPeerPaymentAccountResolutionController *)self->_peerPaymentAccountResolutionController account];
      if ([v32 stage] != 1) {
        goto LABEL_128;
      }
      uint64_t v33 = [v32 pendingPaymentCount];
      if (v33 < 2)
      {
        if (v33 != 1) {
          goto LABEL_128;
        }
        id v99 = PKSharedCacheGetStringForKey();
        if ([v99 length])
        {
          v100 = (void *)MEMORY[0x1E4F84D80];
          id v101 = [(PKDashboardPaymentPassDataSource *)self _contactResolver];
          v102 = [v100 displayNameForAddress:v99 contactResolver:v101];

          if ([v102 length]) {
            id v103 = v102;
          }
          else {
            id v103 = v99;
          }
          uint64_t v17 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentAcc_5.isa, &stru_1EF1B4C70.isa, v103);
        }
        else
        {
          uint64_t v17 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentAcc_4.isa);
        }
      }
      else
      {
        uint64_t v17 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentAcc_4.isa);
      }
      if (v17) {
        goto LABEL_129;
      }
LABEL_128:
      uint64_t v17 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentAcc_6.isa);
LABEL_129:
      uint64_t v7 = [(PKDashboardPaymentPassDataSource *)self _messageImageWithName:@"AppleCashIcon" extension:@"pdf"];

      goto LABEL_130;
    case 2uLL:
      id v16 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentAcc_7.isa);
      uint64_t v17 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentAcc_8.isa);
      uint64_t v7 = [(PKDashboardPaymentPassDataSource *)self _messageImageWithName:@"MessageAlert" extension:@"pdf"];
      if (v16)
      {
        LODWORD(v120) = self->_performingPeerPaymentResolution;
        goto LABEL_132;
      }
      BOOL v5 = 0;
      uint64_t v120 = 0;
      uint64_t v18 = 0;
      goto LABEL_135;
    case 3uLL:
      uint64_t v54 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount role];
      if (v54 == 1)
      {
        uint64_t v18 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentDas_2.isa);
        uint64_t v17 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentDas_3.isa);
        id v16 = 0;
LABEL_96:
        uint64_t v95 = [(PKDashboardPaymentPassDataSource *)self _messageImageWithName:@"MessageAlert" extension:@"pdf"];
LABEL_101:
        uint64_t v7 = (void *)v95;
LABEL_130:
        if (v16)
        {
          LODWORD(v120) = self->_performingPeerPaymentResolution;
          if (!v18)
          {
LABEL_132:
            uint64_t v18 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentAcc_16.isa);
          }
          v127[0] = MEMORY[0x1E4F143A8];
          v127[1] = 3221225472;
          v127[2] = __71__PKDashboardPaymentPassDataSource__messageForPaymentApplicationStatus__block_invoke;
          v127[3] = &unk_1E59D9D48;
          objc_copyWeak(v128, location);
          v128[1] = v15;
          v128[2] = v19;
          BOOL v5 = _Block_copy(v127);
          objc_destroyWeak(v128);
          HIDWORD(v120) = 1;
        }
        else
        {
          BOOL v5 = 0;
          uint64_t v120 = 0;
        }
LABEL_135:
        char v14 = 1;
LABEL_14:
        if (PKNeedsLostModeExitAuth()) {
          uint64_t v20 = 7;
        }
        else {
          uint64_t v20 = [(PKPaymentPass *)self->_pass effectiveContactlessPaymentApplicationState];
        }
        unint64_t v119 = v20;
        if (v20 == 1) {
          char v21 = 1;
        }
        else {
          char v21 = v14;
        }
        if (v21)
        {
          uint64_t v8 = v16;
          id v4 = v17;
          id v3 = v18;
        }
        else
        {
          id v3 = PKPassLocalizedStringForStateWithFormat(&cfstr_PassDashboardT.isa, &self->_pass->super, 0);

          pass = self->_pass;
          uint64_t v23 = [(PKPaymentPass *)pass localizedDescription];
          id v4 = PKPassLocalizedStringForStateWithFormat(&cfstr_PassDashboardD.isa, &pass->super, &stru_1EF1B4C70.isa, v23);

          uint64_t v8 = PKPassLocalizedStringForStateWithFormat(&cfstr_PassDashboardB.isa, &self->_pass->super, 0);

          if ([v3 length])
          {
            if ([v4 length]) {
              goto LABEL_26;
            }
            goto LABEL_31;
          }
        }
        if (v14) {
          goto LABEL_26;
        }
LABEL_31:
        if ([(PKPaymentPass *)self->_pass supportsBarcodePayment])
        {
          uint64_t v24 = (void (*)(void))MEMORY[0x1E4F880A8];
          id v25 = @"_ACCOUNT";
          goto LABEL_48;
        }
        uint64_t v26 = [(PKPaymentPass *)self->_pass cardType];
        uint64_t v27 = self->_pass;
        if (v26 == 3)
        {
          unint64_t v28 = [(PKPaymentPass *)v27 accessType] - 1;
          id v29 = (void (*)(void))MEMORY[0x1E4F880B8];
          if (v28 < 6)
          {
            long long v30 = &off_1E59DA4A8[v28];
            char v31 = (void (*)(void))MEMORY[0x1E4F880B8];
LABEL_46:
            uint64_t v24 = v31;
            id v25 = *v30;
            goto LABEL_48;
          }
        }
        else
        {
          uint64_t v34 = [(PKPaymentPass *)v27 cardType];
          id v29 = (void (*)(void))MEMORY[0x1E4F880B8];
          if (v34 == 4)
          {
            unint64_t v35 = [(PKPaymentPass *)self->_pass identityType];
            id v29 = (void (*)(void))MEMORY[0x1E4F880C8];
            if (v35 < 4)
            {
              long long v30 = &off_1E59DA4D8[v35];
              char v31 = (void (*)(void))MEMORY[0x1E4F880C8];
              goto LABEL_46;
            }
          }
        }
        uint64_t v24 = v29;
        id v25 = &stru_1EF1B5B50;
LABEL_48:
        if ([(PKPaymentPass *)self->_pass isShellPass])
        {
LABEL_49:
          __int16 v9 = 0;
          goto LABEL_5;
        }
        __int16 v9 = 0;
        switch(v119)
        {
          case 0uLL:
          case 8uLL:
            goto LABEL_51;
          case 1uLL:
            long long v59 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount associatedPassUniqueID];
            long long v60 = [(PKPaymentPass *)self->_pass uniqueID];
            id v61 = v59;
            id v62 = v60;
            long long v63 = v62;
            if (v61 == v62)
            {
            }
            else
            {
              if (!v61 || !v62)
              {

LABEL_112:
                goto LABEL_113;
              }
              int v64 = [v61 isEqualToString:v62];

              if (!v64) {
                goto LABEL_112;
              }
            }
            uint64_t v96 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount role];

            if (v96 == 1)
            {
              char v97 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount isParticipantAccountLockedByOwner];
              int v98 = 1;
              goto LABEL_114;
            }
LABEL_113:
            int v98 = 0;
            char v97 = 0;
LABEL_114:
            BOOL v104 = [(PKPaymentPass *)self->_pass devicePrimaryContactlessPaymentApplication];
            if (v104
              || ([(PKPaymentPass *)self->_pass deviceInAppPaymentApplications],
                  BOOL v104 = objc_claimAutoreleasedReturnValue(),
                  ![v104 count]))
            {

              goto LABEL_49;
            }
            char v105 = [(PKPaymentPass *)self->_pass supportsBarcodePayment] | v97;

            if (v105) {
              goto LABEL_49;
            }
            if (v98)
            {
              uint64_t v84 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentDas_6.isa);

              uint64_t v82 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentDas_7.isa);
LABEL_84:

              id v3 = (void *)v84;
              id v4 = (void *)v82;
              goto LABEL_26;
            }
            v109 = [(PKPaymentPass *)self->_pass organizationName];

            if (v109)
            {
              id v110 = [(PKPaymentPass *)self->_pass organizationName];
              uint64_t v111 = PKLocalizedPaymentString(&cfstr_DashboardMessa_10.isa, &stru_1EF1B4C70.isa, v110);
            }
            else
            {
              uint64_t v111 = PKLocalizedPaymentString(&cfstr_DashboardMessa_11.isa);
            }
            v112 = [(PKPaymentPass *)self->_pass localizedDescription];
            uint64_t v94 = PKLocalizedPaymentString(&cfstr_PaymentAppNoCo.isa, &stru_1EF1B4C70.isa, v112);

            id v3 = (void *)v111;
            goto LABEL_91;
          case 2uLL:
            uint64_t v65 = [(PKPaymentPass *)self->_pass provisioningMetadata];
            uint64_t v66 = v65;
            if (v65 && [v65 sourceDeviceType] == 1)
            {
              uint64_t v116 = PKLocalizedPaymentString(&cfstr_TransferringTi.isa);

              uint64_t v67 = [v66 localizedSourceDeviceDescription];
              v68 = (void *)v67;
              if (!v67)
              {
                uint64_t v94 = PKLocalizedPaymentString(&cfstr_TransferringMe_0.isa);
                v68 = 0;
LABEL_90:

                id v3 = (void *)v116;
LABEL_91:
                id v4 = (void *)v94;
LABEL_26:
                uint64_t v6 = 0;
                if (![v8 length] || v5) {
                  goto LABEL_4;
                }
                if (v119 <= 0xA)
                {
                  if (((1 << v119) & 0x521) != 0)
                  {
                    aBlock[0] = MEMORY[0x1E4F143A8];
                    aBlock[1] = 3221225472;
                    aBlock[2] = __71__PKDashboardPaymentPassDataSource__messageForPaymentApplicationStatus__block_invoke_4;
                    aBlock[3] = &unk_1E59CA7F8;
                    objc_copyWeak(&v122, location);
                    BOOL v5 = _Block_copy(aBlock);
                    objc_destroyWeak(&v122);
                    uint64_t v6 = 1;
                    goto LABEL_4;
                  }
                  if (((1 << v119) & 0x18) != 0)
                  {
                    v125[0] = MEMORY[0x1E4F143A8];
                    v125[1] = 3221225472;
                    v125[2] = __71__PKDashboardPaymentPassDataSource__messageForPaymentApplicationStatus__block_invoke_2;
                    v125[3] = &unk_1E59CA7F8;
                    objc_copyWeak(&v126, location);
                    BOOL v5 = _Block_copy(v125);
                    objc_destroyWeak(&v126);
                    uint64_t v6 = 0;
                    HIDWORD(v120) = 1;
                    goto LABEL_4;
                  }
                  if (v119 == 7)
                  {
                    v123[0] = MEMORY[0x1E4F143A8];
                    v123[1] = 3221225472;
                    v123[2] = __71__PKDashboardPaymentPassDataSource__messageForPaymentApplicationStatus__block_invoke_3;
                    v123[3] = &unk_1E59CA7F8;
                    objc_copyWeak(&v124, location);
                    BOOL v5 = _Block_copy(v123);
                    objc_destroyWeak(&v124);
                    uint64_t v6 = 0;
                    goto LABEL_4;
                  }
                }

                BOOL v5 = 0;
                uint64_t v6 = 0;
LABEL_3:
                uint64_t v8 = 0;
LABEL_4:
                __int16 v9 = objc_alloc_init(PKDashboardPassMessage);
                [(PKDashboardPassMessage *)v9 setIdentifier:@"applicationState"];
                __int16 v10 = [MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForPass:self->_pass];
                [(PKDashboardPassMessage *)v9 setAnalyticsReporterSubject:v10];

                [(PKDashboardPassMessage *)v9 setTitle:v3];
                [(PKDashboardPassMessage *)v9 setMessage:v4];
                [(PKDashboardPassMessage *)v9 setButtonTitle:v8];
                [(PKDashboardPassMessage *)v9 setActionOnButtonPress:v5];
                [(PKDashboardPassMessage *)v9 setShowSpinner:v120];
                [(PKDashboardPassMessage *)v9 setShowDisclosure:HIDWORD(v120)];
                [(PKDashboardPassMessage *)v9 setIsDestructiveAction:v6];
                [(PKDashboardPassMessage *)v9 setImage:v7];
LABEL_5:

                goto LABEL_6;
              }
              uint64_t v69 = PKLocalizedPaymentString(&cfstr_TransferringMe.isa, &stru_1EF1B4C70.isa, v67);
            }
            else
            {
              uint64_t v116 = PKLocalizedPaymentString(&cfstr_ActivatingTitl.isa);

              v68 = [@"ACTIVATING_MESSAGE" stringByAppendingString:v25];
              uint64_t v69 = v24();
            }
            uint64_t v94 = v69;
            goto LABEL_90;
          case 3uLL:
          case 4uLL:
            paymentVerificationController = self->_paymentVerificationController;
            if (!paymentVerificationController)
            {
              long long v43 = [MEMORY[0x1E4F84D50] sharedService];
              int v44 = [PKPaymentVerificationController alloc];
              id v45 = self->_pass;
              uint64_t v46 = [(PKPassGroupView *)self->_groupView frontmostPassView];
              __int16 v47 = [(PKPaymentVerificationController *)v44 initWithPaymentPass:v45 passView:v46 webService:v43 context:0 delegate:self setupDelegate:0 verificationContext:2];
              uint64_t v48 = self->_paymentVerificationController;
              self->_paymentVerificationController = v47;

              id v115 = (void *)[objc_alloc(MEMORY[0x1E4F84BB8]) initWithWebService:v43];
              [(PKPaymentVerificationController *)self->_paymentVerificationController setProvisioningController:v115];
              uint64_t v49 = [(PKPaymentVerificationController *)self->_paymentVerificationController verificationRecord];
              BOOL v50 = [v49 channel];
              LOBYTE(v46) = [v50 needsServerRequest];

              if ((v46 & 1) == 0) {
                [(PKPaymentVerificationController *)self->_paymentVerificationController clearSelectedChannel];
              }

              paymentVerificationController = self->_paymentVerificationController;
            }
            uint64_t v51 = [(PKPaymentVerificationController *)paymentVerificationController verificationTitleString];

            uint64_t v52 = [(PKPaymentVerificationController *)self->_paymentVerificationController verificationBodyString];

            uint64_t v53 = [(PKPaymentVerificationController *)self->_paymentVerificationController continueVerificationButtonTitle];

            id v3 = (void *)v51;
            id v4 = (void *)v52;
            uint64_t v8 = (void *)v53;
            goto LABEL_26;
          case 5uLL:
            v70 = [@"PAYMENT_APP_ERROR_TITLE" stringByAppendingString:v25];
            uint64_t v37 = v24();

            uint64_t v71 = [@"PAYMENT_APP_VERIFICATION_TERMINATED" stringByAppendingString:v25];
            uint64_t v39 = v24();

            uint64_t v40 = [@"DELETE_PASS" stringByAppendingString:v25];
            uint64_t v41 = v24();
            goto LABEL_79;
          case 6uLL:
            double v73 = [@"PAYMENT_APP_ERROR_TITLE" stringByAppendingString:v25];
            uint64_t v117 = v24();

            double v74 = [@"PAYMENT_APP_SUSPENDED_BY_ISSUER" stringByAppendingString:v25];
            uint64_t v75 = v24();

            id v113 = [(PKPaymentPass *)self->_pass organizationName];
            uint64_t v76 = PKStringWithValidatedFormat();

            uint64_t v77 = [(PKDashboardPaymentPassDataSource *)self _messageImageWithName:@"MessageAlert", @"pdf", v113 extension];

            id v3 = (void *)v117;
            id v4 = (void *)v76;
            goto LABEL_86;
          case 7uLL:
            uint64_t v78 = PKLocalizedPaymentString(&cfstr_PaymentAppSusp.isa);

            uint64_t v79 = PKLocalizedPaymentString(&cfstr_PaymentAppSusp_0.isa);

            uint64_t v80 = PKLocalizedPaymentString(&cfstr_PaymentAppSusp_1.isa);

            uint64_t v81 = [(PKDashboardPaymentPassDataSource *)self _messageImageWithName:@"MessageAlert" extension:@"pdf"];

            LODWORD(v120) = self->_performingLostModeExit;
            HIDWORD(v120) = 1;
            id v3 = (void *)v78;
            id v4 = (void *)v79;
            uint64_t v8 = (void *)v80;
            uint64_t v7 = (void *)v81;
            goto LABEL_26;
          case 9uLL:
            uint64_t v82 = [(PKPaymentPass *)self->_pass localizedSuspendedReason];
            if (v82)
            {
              id v83 = [@"PAYMENT_APP_ERROR_TITLE" stringByAppendingString:v25];
              uint64_t v84 = v24();

              goto LABEL_84;
            }
LABEL_51:
            uint64_t v36 = [@"PAYMENT_APP_ERROR_TITLE" stringByAppendingString:v25];
            uint64_t v37 = v24();

            uint64_t v38 = [@"PAYMENT_APP_ERROR_BODY" stringByAppendingString:v25];
            uint64_t v39 = v24();

            uint64_t v40 = [@"DELETE_PASS" stringByAppendingString:v25];
            uint64_t v41 = v24();
LABEL_79:
            char v72 = (void *)v41;

            id v3 = (void *)v37;
            id v4 = (void *)v39;
            uint64_t v8 = v72;
            goto LABEL_26;
          case 0xAuLL:
            id v85 = [@"PAYMENT_APP_ERROR_TITLE" stringByAppendingString:v25];
            uint64_t v118 = v24();

            id v86 = [@"PAYMENT_APP_REMOVED_BY_ISSUER" stringByAppendingString:v25];
            v87 = v24();

            v114 = [(PKPaymentPass *)self->_pass organizationName];
            uint64_t v88 = PKStringWithValidatedFormat();

            v89 = objc_msgSend(@"DELETE_PASS", "stringByAppendingString:", v25, v114);
            uint64_t v90 = v24();

            uint64_t v77 = [(PKDashboardPaymentPassDataSource *)self _messageImageWithName:@"MessageAlert" extension:@"pdf"];

            id v3 = (void *)v118;
            id v4 = (void *)v88;
            uint64_t v8 = (void *)v90;
LABEL_86:
            uint64_t v7 = (void *)v77;
            goto LABEL_26;
          case 0xFuLL:
            uint64_t v91 = PKLocalizedCredentialString(&cfstr_DashboardMessa_9.isa);

            uint64_t v92 = [(PKDashboardPaymentPassDataSource *)self revokingAccessMessage];

            uint64_t v93 = [(PKDashboardPaymentPassDataSource *)self _messageImageWithName:@"MessageAlert" extension:@"pdf"];

            id v3 = (void *)v91;
            id v4 = (void *)v92;
            uint64_t v7 = (void *)v93;
            goto LABEL_26;
          default:
            goto LABEL_5;
        }
      }
      if (v54)
      {
        id v16 = 0;
        uint64_t v17 = 0;
LABEL_95:
        uint64_t v18 = 0;
        goto LABEL_96;
      }
      long long v55 = [(PKPeerPaymentAccountResolutionController *)self->_peerPaymentAccountResolutionController account];
      uint64_t v56 = [v55 stateReason];

      unint64_t v57 = v56 & 0xFFFFFFFFFFFFFFFELL;
      if ((v56 & 0xFFFFFFFFFFFFFFFELL) != 4)
      {
        id v16 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentAcc_9.isa);
        v106 = [(PKPeerPaymentAccountResolutionController *)self->_peerPaymentAccountResolutionController account];
        uint64_t v107 = [v106 state];

        if (v107 == 2)
        {
          if (v57 == 6)
          {
            uint64_t v18 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentAcc_10.isa);
            uint64_t v17 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentAcc_11.isa);
            goto LABEL_96;
          }
          PKDeviceSpecificLocalizedStringKeyForKey(@"PEER_PAYMENT_ACCOUNT_STATE_FOOTER_RESTRICTED_CONTACT_SUPPORT_BODY", 0);
          v108 = (NSString *)objc_claimAutoreleasedReturnValue();
          uint64_t v17 = PKLocalizedPeerPaymentString(v108);
        }
        else
        {
          uint64_t v17 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentAcc_13.isa);
        }
        goto LABEL_95;
      }
      __int16 v9 = 0;
LABEL_6:
      objc_destroyWeak(location);
      return v9;
    case 4uLL:
      uint64_t v58 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount role];
      if (v58 == 1)
      {
        uint64_t v18 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentDas_4.isa);
        uint64_t v17 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentDas_5.isa);
        id v16 = 0;
      }
      else
      {
        if (v58)
        {
          id v16 = 0;
          uint64_t v17 = 0;
        }
        else
        {
          id v16 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentAcc_14.isa);
          uint64_t v17 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentAcc_15.isa);
        }
        uint64_t v18 = 0;
      }
      uint64_t v95 = [(PKDashboardPaymentPassDataSource *)self _messageImageWithName:@"AppleCashIcon" extension:@"pdf"];
      goto LABEL_101;
    default:
      goto LABEL_13;
  }
}

void __71__PKDashboardPaymentPassDataSource__messageForPaymentApplicationStatus__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _peerPaymentResolutionTappedWithResolution:*(void *)(a1 + 48)];
    id WeakRetained = v3;
  }
}

void __71__PKDashboardPaymentPassDataSource__messageForPaymentApplicationStatus__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _verificationButtonTapped];
}

void __71__PKDashboardPaymentPassDataSource__messageForPaymentApplicationStatus__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _lostModeButtonTapped];
}

void __71__PKDashboardPaymentPassDataSource__messageForPaymentApplicationStatus__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _deleteButtonPressed];
}

- (id)_messageForExpressEducation
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if ([(PKPaymentPass *)self->_pass isTransitPass]
    && PKExpressEducationHasDismissedMessage() == 2
    && [(PKPaymentPass *)self->_pass activationState] == PKPaymentPassActivationStateActivated)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F84C38]);
    uint64_t v6 = [(PKPaymentPass *)self->_pass uniqueID];
    int v7 = [v5 isExpressModeEnabledForPassUniqueIdentifier:v6];

    if (v7)
    {
      id v3 = objc_alloc_init(PKDashboardPassMessage);
      [(PKDashboardPassMessage *)v3 setIdentifier:@"expressEducationSetup"];
      uint64_t v8 = PKLocalizedPaymentString(&cfstr_DashboardMessa_12.isa);
      [(PKDashboardPassMessage *)v3 setTitle:v8];

      __int16 v9 = PKLocalizedPaymentString(&cfstr_DashboardMessa_13.isa);
      [(PKDashboardPassMessage *)v3 setMessage:v9];

      __int16 v10 = [MEMORY[0x1E4FB1E20] currentTraitCollection];
      uint64_t v11 = [v10 userInterfaceStyle];

      if (PKSystemApertureIsAvailable())
      {
        uint64_t v12 = 3;
      }
      else
      {
        int IsAvailable = PKPearlIsAvailable();
        uint64_t v12 = 1;
        if (IsAvailable) {
          uint64_t v12 = 2;
        }
      }
      char v14 = @"Light";
      if (v11 == 2) {
        char v14 = @"Dark";
      }
      id v15 = [NSString stringWithFormat:@"Express_Tip_Gen%lu_%@", v12, v14];
      id v16 = PKUIImageNamed(v15);
      [(PKDashboardPassMessage *)v3 setImage:v16];

      [(PKDashboardPassMessage *)v3 setImageOnTrailingEdge:1];
      [(PKDashboardPassMessage *)v3 setImageContentMode:6];
      [(PKDashboardPassMessage *)v3 setImageRequestExtraLarge:1];
      objc_initWeak(&location, self);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      id v17[2] = __63__PKDashboardPaymentPassDataSource__messageForExpressEducation__block_invoke;
      id v17[3] = &unk_1E59CA7F8;
      objc_copyWeak(&v18, &location);
      [(PKDashboardPassMessage *)v3 setActionOnDismiss:v17];
      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
    else
    {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

void __63__PKDashboardPaymentPassDataSource__messageForExpressEducation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    PKExpressEducationSetHasDismissedMessage();
    [WeakRetained reloadMessages];
  }
}

- (id)_messageForAutoReload
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v3 = PKDismissedKeyForPass();
  char BoolForKey = PKSharedCacheGetBoolForKey();

  if ((BoolForKey & 1) != 0
    || !+[PKPaymentAutoReloadSetupController shouldOfferAutoReloadForPass:self->_pass])
  {
    id v5 = 0;
  }
  else
  {
    objc_initWeak(&location, self);
    id v5 = objc_alloc_init(PKDashboardPassMessage);
    [(PKDashboardPassMessage *)v5 setIdentifier:@"autoReloadSetup"];
    uint64_t v6 = [MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForPass:self->_pass];
    [(PKDashboardPassMessage *)v5 setAnalyticsReporterSubject:v6];

    int v7 = PKLocalizedPaymentString(&cfstr_PassDetailsAut.isa);
    [(PKDashboardPassMessage *)v5 setTitle:v7];

    uint64_t v8 = PKLocalizedPaymentString(&cfstr_PassDetailsAut_9.isa);
    [(PKDashboardPassMessage *)v5 setMessage:v8];

    __int16 v9 = PKLocalizedPaymentString(&cfstr_PassDetailsSet_2.isa);
    [(PKDashboardPassMessage *)v5 setButtonTitle:v9];

    __int16 v10 = [MEMORY[0x1E4FB1830] configurationWithPointSize:26.0];
    uint64_t v11 = +[PKPaymentPassDetailAutoReloadSectionController autoTopUpActionForPass:self->_pass];
    uint64_t v12 = [v11 autoTopUpItem];
    id v13 = [v12 currency];

    if ([v13 isEqualToString:@"KRW"])
    {
      char v14 = PKPassKitUIBundle();
      id v15 = [v14 URLForResource:@"WonIconArrowCirclePath" withExtension:@"pdf"];
      double v16 = PKUIScreenScale();
      PKUIImageFromPDF(v15, 45.0, 45.0, v16);
    }
    else
    {
      id v15 = [MEMORY[0x1E4FB1818] systemImageNamed:@"dollarsign.arrow.circlepath" withConfiguration:v10];
      char v14 = [MEMORY[0x1E4FB1618] whiteColor];
      [v15 imageWithTintColor:v14];
    uint64_t v17 = };

    id v18 = [MEMORY[0x1E4FB1618] blackColor];
    id v19 = PKUIImageWithBackground(v17, v18, 45.0, 45.0);
    [(PKDashboardPassMessage *)v5 setImage:v19];

    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __57__PKDashboardPaymentPassDataSource__messageForAutoReload__block_invoke;
    v23[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v24, &location);
    [(PKDashboardPassMessage *)v5 setActionOnDismiss:v23];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __57__PKDashboardPaymentPassDataSource__messageForAutoReload__block_invoke_2;
    v21[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v22, &location);
    [(PKDashboardPassMessage *)v5 setActionOnButtonPress:v21];
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);

    objc_destroyWeak(&location);
  }

  return v5;
}

void __57__PKDashboardPaymentPassDataSource__messageForAutoReload__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    uint64_t v2 = PKDismissedKeyForPass();
    PKSharedCacheSetBoolForKey();

    [v3 reloadMessages];
    id WeakRetained = v3;
  }
}

void __57__PKDashboardPaymentPassDataSource__messageForAutoReload__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v1 = -[PKPaymentAutoReloadSetupController initWithPass:paymentDataProvider:viewStyle:delegate:]([PKPaymentAutoReloadSetupController alloc], "initWithPass:paymentDataProvider:viewStyle:delegate:", *((void *)WeakRetained + 110), *((void *)WeakRetained + 32), 0);
    uint64_t v2 = (void *)*((void *)WeakRetained + 13);
    *((void *)WeakRetained + 13) = v1;

    [*((id *)WeakRetained + 13) presentAutoTopUpFlow];
  }
}

- (void)recipientPickerViewControllerRequestsDismissViewController:(id)a3
{
  id v3 = [(PKDashboardPaymentPassDataSource *)self groupView];
  id v4 = objc_msgSend(v3, "pkui_viewControllerFromResponderChain");
  id v5 = [v4 navigationController];

  [v5 dismissViewControllerAnimated:1 completion:0];
}

- (void)autoReloadSetupController:(id)a3 requestsPresentViewController:(id)a4
{
  groupView = self->_groupView;
  id v5 = a4;
  id v6 = [(UIView *)groupView pkui_viewControllerFromResponderChain];
  [v6 presentViewController:v5 animated:1 completion:0];
}

- (void)autoReloadSetupController:(id)a3 requestsDismissViewController:(id)a4
{
  id v4 = [(UIView *)self->_groupView pkui_viewControllerFromResponderChain];
  [v4 dismissViewControllerAnimated:1 completion:0];
}

- (id)_messageForSessionActive
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (self->_sessionActive)
  {
    id v3 = objc_alloc_init(PKDashboardPassMessage);
    [(PKDashboardPassMessage *)v3 setIdentifier:@"sessionActive"];
    id v4 = [MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForPass:self->_pass];
    [(PKDashboardPassMessage *)v3 setAnalyticsReporterSubject:v4];

    id v5 = PKLocalizedPaymentString(&cfstr_PaymentDeviceU.isa);
    [(PKDashboardPassMessage *)v3 setTitle:v5];

    id v6 = [(PKPaymentPass *)self->_pass localizedDescription];
    int v7 = PKLocalizedPaymentString(&cfstr_PaymentCardUna.isa, &stru_1EF1B4C70.isa, v6);
    [(PKDashboardPassMessage *)v3 setMessage:v7];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (void)_messageFromPaymentServiceSuppressingPassStateChanges:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  objc_initWeak(&location, self);
  paymentDataProvider = self->_paymentDataProvider;
  uint64_t v8 = [(PKPaymentPass *)self->_pass uniqueID];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  id v10[2] = __101__PKDashboardPaymentPassDataSource__messageFromPaymentServiceSuppressingPassStateChanges_completion___block_invoke;
  v10[3] = &unk_1E59D9D98;
  objc_copyWeak(&v12, &location);
  BOOL v13 = a3;
  id v9 = v6;
  id v11 = v9;
  [(PKPaymentDefaultDataProvider *)paymentDataProvider messagesForPaymentPassWithUniqueIdentifier:v8 completion:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __101__PKDashboardPaymentPassDataSource__messageFromPaymentServiceSuppressingPassStateChanges_completion___block_invoke(uint64_t a1, void *a2)
{
  v54[1] = *MEMORY[0x1E4F143B8];
  id v45 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_52;
  }
  id v44 = WeakRetained[110];
  id v5 = [v4[23] associatedPassUniqueID];
  id v6 = [v4[110] uniqueID];
  id v7 = v5;
  id v8 = v6;
  id v9 = v8;
  if (v7 == v8)
  {

    goto LABEL_8;
  }
  if (v7 && v8)
  {
    int v10 = [v7 isEqualToString:v8];

    if (!v10) {
      goto LABEL_10;
    }
LABEL_8:
    BOOL v11 = [v4[23] role] == 1;
    goto LABEL_11;
  }

LABEL_10:
  BOOL v11 = 0;
LABEL_11:

  long long v43 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"messageDate" ascending:0];
  v54[0] = v43;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:1];
  BOOL v13 = [v45 sortedArrayUsingDescriptors:v12];

  char v14 = [v13 firstObject];
  if (v14) {
    int v15 = [v4 _shouldPaymentMessageAppear:v14];
  }
  else {
    int v15 = 0;
  }
  if (!*(unsigned char *)(a1 + 48))
  {
    if (!v11)
    {
      char v17 = 0;
      goto LABEL_21;
    }
    goto LABEL_19;
  }
  uint64_t v16 = [v14 messageType];
  char v17 = v16 == 1;
  if (v16 != 1 && v11) {
LABEL_19:
  }
    char v17 = [v4[23] isParticipantAccountLockedByOwner];
LABEL_21:
  id v18 = v13;
  id v19 = v18;
  if (v15)
  {
    long long v42 = objc_msgSend(v18, "pk_arrayByRemovingObject:", v14);
    uint64_t v20 = v19;
  }
  else
  {
    uint64_t v20 = v14;
    long long v42 = v18;
    char v14 = 0;
  }

  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __101__PKDashboardPaymentPassDataSource__messageFromPaymentServiceSuppressingPassStateChanges_completion___block_invoke_2;
  v53[3] = &unk_1E59D9D70;
  v53[4] = v4;
  [v42 enumerateObjectsUsingBlock:v53];
  if (v14) {
    char v21 = v17;
  }
  else {
    char v21 = 1;
  }
  if (v21)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v22 = objc_alloc_init(PKDashboardPassMessage);
    if (v11)
    {
      uint64_t v23 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentDas_6.isa);
      [(PKDashboardPassMessage *)v22 setTitle:v23];

      uint64_t v24 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentDas_8.isa);
    }
    else
    {
      id v25 = [v44 organizationName];

      if (v25)
      {
        int v26 = [v4[110] isIdentityPass];
        uint64_t v27 = [v44 organizationName];
        unint64_t v28 = (void *)v27;
        if (v26)
        {
          [(PKDashboardPassMessage *)v22 setTitle:v27];
        }
        else
        {
          long long v30 = PKLocalizedPaymentString(&cfstr_DashboardMessa_10.isa, &stru_1EF1B4C70.isa, v27);
          [(PKDashboardPassMessage *)v22 setTitle:v30];
        }
        uint64_t v24 = [v14 content];
      }
      else
      {
        id v29 = PKLocalizedPaymentString(&cfstr_DashboardMessa_11.isa);
        [(PKDashboardPassMessage *)v22 setTitle:v29];

        uint64_t v24 = [v14 content];
      }
    }
    char v31 = (void *)v24;
    [(PKDashboardPassMessage *)v22 setMessage:v24];

    if ([v44 hasAssociatedPeerPaymentAccount])
    {
      uint64_t v32 = [v4 _messageImageWithName:@"AppleCashIcon" extension:@"pdf"];
    }
    else
    {
      id v33 = v4[49];
      if (v33 && [v33 feature] == 2)
      {
        uint64_t v32 = [v4 _messageImageWithName:@"AppleCardIcon" extension:@"pdf"];
      }
      else
      {
        uint64_t v32 = PKDashboardMessagePassIcon(v44);
      }
    }
    uint64_t v34 = (void *)v32;
    [(PKDashboardPassMessage *)v22 setImage:v32];

    unint64_t v35 = [(PKDashboardPassMessage *)v22 identifier];

    if (v35)
    {
      uint64_t v36 = [(PKDashboardPassMessage *)v22 identifier];
      [(PKDashboardPassMessage *)v22 setIdentifier:v36];
    }
    else
    {
      [(PKDashboardPassMessage *)v22 setIdentifier:@"messageService"];
    }
    uint64_t v37 = [MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForPass:v4[110]];
    [(PKDashboardPassMessage *)v22 setAnalyticsReporterSubject:v37];

    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    void v50[2] = __101__PKDashboardPaymentPassDataSource__messageFromPaymentServiceSuppressingPassStateChanges_completion___block_invoke_3;
    v50[3] = &unk_1E59CB010;
    objc_copyWeak(&v52, (id *)(a1 + 40));
    id v38 = v14;
    id v51 = v38;
    [(PKDashboardPassMessage *)v22 setActionOnDismiss:v50];
    if ([v38 allowDeepLink])
    {
      id v39 = v4[32];
      uint64_t v40 = [v44 uniqueID];
      uint64_t v41 = [v39 messagesAppLaunchTokenForPassWithUniqueIdentifier:v40];

      if (v41)
      {
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        id v46[2] = __101__PKDashboardPaymentPassDataSource__messageFromPaymentServiceSuppressingPassStateChanges_completion___block_invoke_4;
        void v46[3] = &unk_1E59CB378;
        objc_copyWeak(&v49, (id *)(a1 + 40));
        id v47 = v38;
        id v48 = v41;
        [(PKDashboardPassMessage *)v22 setActionOnMessagePress:v46];

        objc_destroyWeak(&v49);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

    objc_destroyWeak(&v52);
  }

LABEL_52:
}

void __101__PKDashboardPaymentPassDataSource__messageFromPaymentServiceSuppressingPassStateChanges_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 256);
  id v3 = [a2 identifier];
  [v2 archiveMessageWithIdentifier:v3];
}

void __101__PKDashboardPaymentPassDataSource__messageFromPaymentServiceSuppressingPassStateChanges_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = (void *)WeakRetained[32];
    id v5 = WeakRetained;
    id v4 = [*(id *)(a1 + 32) identifier];
    [v3 archiveMessageWithIdentifier:v4];

    [v5 reloadMessages];
    id WeakRetained = v5;
  }
}

void __101__PKDashboardPaymentPassDataSource__messageFromPaymentServiceSuppressingPassStateChanges_completion___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v3 = +[PKPaymentNotificationAppURLHelper appURLForMessageNotification:*(void *)(a1 + 32) pass:WeakRetained[110] appLaunchToken:*(void *)(a1 + 40)];
    if (v3)
    {
      id v4 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      [v4 openURL:v3 configuration:0 completionHandler:0];
    }
    id WeakRetained = v5;
  }
}

- (BOOL)_shouldPaymentMessageAppear:(id)a3
{
  id v4 = a3;
  if (![v4 archiveOnNextTransaction]) {
    goto LABEL_5;
  }
  p_lockTransactions = &self->_lockTransactions;
  os_unfair_lock_lock(&self->_lockTransactions);
  id v6 = [(NSArray *)self->_previousTransactions firstObject];
  os_unfair_lock_unlock(p_lockTransactions);
  if (!v6) {
    goto LABEL_5;
  }
  id v7 = [v6 transactionDate];
  id v8 = [v4 messageDate];
  uint64_t v9 = [v7 compare:v8];

  if (v9 == 1) {
    BOOL v10 = 0;
  }
  else {
LABEL_5:
  }
    BOOL v10 = 1;

  return v10;
}

- (void)_messagesForAccountStatusWithCompletion:(id)a3
{
  id v4 = a3;
  if (self->_account && ![(PKDashboardPaymentPassDataSource *)self _isPayLaterPass])
  {
    id v5 = dispatch_group_create();
    dispatch_group_enter(v5);
    v34[0] = 0;
    v34[1] = v34;
    id v34[2] = 0x3032000000;
    v34[3] = __Block_byref_object_copy__42;
    v34[4] = __Block_byref_object_dispose__42;
    id v35 = 0;
    paymentDataProvider = self->_paymentDataProvider;
    id v7 = [(PKAccount *)self->_account accountIdentifier];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __76__PKDashboardPaymentPassDataSource__messagesForAccountStatusWithCompletion___block_invoke;
    v31[3] = &unk_1E59D1818;
    id v33 = v34;
    id v8 = v5;
    uint64_t v32 = v8;
    [(PKPaymentDefaultDataProvider *)paymentDataProvider transactionsRequiringReviewForAccountWithIdentifier:v7 completion:v31];

    uint64_t v9 = [(PKAccount *)self->_account creditDetails];
    BOOL v10 = [v9 accountSummary];
    BOOL v11 = [v10 pastDueAmount];

    id v12 = [MEMORY[0x1E4F28C28] zero];
    uint64_t v13 = [v12 compare:v11];

    v29[0] = 0;
    v29[1] = v29;
    id v29[2] = 0x3032000000;
    v29[3] = __Block_byref_object_copy__42;
    void v29[4] = __Block_byref_object_dispose__42;
    id v30 = 0;
    BOOL v14 = v13 == -1;
    if (v13 == -1)
    {
      dispatch_group_enter(v8);
      accountService = self->_accountService;
      uint64_t v16 = [(PKAccount *)self->_account accountIdentifier];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      void v26[2] = __76__PKDashboardPaymentPassDataSource__messagesForAccountStatusWithCompletion___block_invoke_859;
      v26[3] = &unk_1E59D9DC0;
      unint64_t v28 = v29;
      uint64_t v27 = v8;
      [(PKAccountService *)accountService eventsForAccountIdentifier:v16 types:&unk_1EF2BA170 startDate:0 endDate:0 orderedByDate:1 limit:1 completion:v26];
    }
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__PKDashboardPaymentPassDataSource__messagesForAccountStatusWithCompletion___block_invoke_2;
    block[3] = &unk_1E59D9E08;
    objc_copyWeak(&v23, &location);
    BOOL v24 = v14;
    char v21 = v34;
    id v22 = v29;
    id v19 = v11;
    id v20 = v4;
    id v17 = v11;
    dispatch_group_notify(v8, MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
    _Block_object_dispose(v29, 8);

    _Block_object_dispose(v34, 8);
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

void __76__PKDashboardPaymentPassDataSource__messagesForAccountStatusWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __76__PKDashboardPaymentPassDataSource__messagesForAccountStatusWithCompletion___block_invoke_859(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 firstObject];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v6);
}

void __76__PKDashboardPaymentPassDataSource__messagesForAccountStatusWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = (id *)(a1 + 64);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (!WeakRetained) {
    goto LABEL_130;
  }
  id from = v2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  [WeakRetained[49] feature];
  uint64_t v143 = v1;
  if (!*((unsigned char *)WeakRetained + 728) && !*((unsigned char *)WeakRetained + 729)
    || [WeakRetained[49] stateReason] == 2)
  {
    char v5 = 0;
    goto LABEL_28;
  }
  if (!*((unsigned char *)WeakRetained + 728))
  {
    if (!*((unsigned char *)WeakRetained + 729))
    {
      id v6 = 0;
      id v7 = 0;
      id v8 = 0;
      uint64_t v9 = 0;
LABEL_24:
      PKLogFacilityTypeGetObject();
      BOOL v10 = (PKDashboardPassMessage *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, &v10->super, OS_LOG_TYPE_DEFAULT, "User is eligible or enrolled in a payment plan, but account status is neither Restricted nor Closed+ChargedOff. Not showing payment plans dashboard message.", buf, 2u);
      }
      char v5 = 0;
      goto LABEL_27;
    }
    goto LABEL_11;
  }
  if (*((unsigned char *)WeakRetained + 729))
  {
LABEL_11:
    if ([WeakRetained[49] state] == 2
      || [WeakRetained[49] isClosedAndChargedOff])
    {
      id v6 = PKLocalizedFeatureString();
      id v7 = PKLocalizedFeatureString();
    }
    else
    {
      id v7 = 0;
      id v6 = 0;
    }
    id v8 = PKLocalizedFeatureString();
    uint64_t v9 = &__block_literal_global_892;
    if (!v6) {
      goto LABEL_24;
    }
    goto LABEL_22;
  }
  if ([WeakRetained[49] state] == 2
    || [WeakRetained[49] isClosedAndChargedOff])
  {
    id v6 = PKLocalizedFeatureString();
    id v7 = PKLocalizedFeatureString();
  }
  else
  {
    id v7 = 0;
    id v6 = 0;
  }
  id v8 = PKLocalizedFeatureString();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__PKDashboardPaymentPassDataSource__messagesForAccountStatusWithCompletion___block_invoke_3;
  aBlock[3] = &unk_1E59CA7F8;
  objc_copyWeak(v169, v2);
  uint64_t v9 = _Block_copy(aBlock);
  objc_destroyWeak(v169);
  if (!v6) {
    goto LABEL_24;
  }
LABEL_22:
  if (!v7) {
    goto LABEL_24;
  }
  BOOL v10 = objc_alloc_init(PKDashboardPassMessage);
  [(PKDashboardPassMessage *)v10 setIdentifier:@"creditRecoveryPaymentPlans"];
  [(PKDashboardPassMessage *)v10 setTitle:v6];
  [(PKDashboardPassMessage *)v10 setMessage:v7];
  BOOL v11 = [WeakRetained _messageImageWithName:@"MessageAlert" extension:@"pdf"];
  [(PKDashboardPassMessage *)v10 setImage:v11];

  char v5 = 1;
  [(PKDashboardPassMessage *)v10 setShowDisclosure:1];
  [(PKDashboardPassMessage *)v10 setButtonTitle:v8];
  [(PKDashboardPassMessage *)v10 setActionOnButtonPress:v9];
  [v4 addObject:v10];
LABEL_27:

  uint64_t v1 = v143;
LABEL_28:
  uint64_t v12 = [WeakRetained[49] state];
  uint64_t v13 = [*(id *)(*(void *)(*(void *)(v1 + 48) + 8) + 40) count];
  if (v13) {
    BOOL v14 = v12 == 3;
  }
  else {
    BOOL v14 = 1;
  }
  if (!v14)
  {
    uint64_t v15 = v13;
    if ([WeakRetained[49] state] == 1)
    {
      uint64_t v16 = PKLocalizedString(&cfstr_AccountService_219.isa, &cfstr_Ld.isa, v15);
    }
    else
    {
      if (v15 == 1)
      {
        PKLocalizedFeatureString();
      }
      else
      {
        uint64_t v127 = v15;
        PKLocalizedFeatureString();
      uint64_t v16 = };
    }
    id v17 = (void *)v16;
    id v18 = objc_alloc_init(PKDashboardPassMessage);
    [(PKDashboardPassMessage *)v18 setIdentifier:@"transactionsToReview"];
    id v19 = PKLocalizedFeatureString();
    [(PKDashboardPassMessage *)v18 setTitle:v19];

    [(PKDashboardPassMessage *)v18 setMessage:v17];
    [(PKDashboardPassMessage *)v18 setShowDisclosure:1];
    id v20 = [WeakRetained _messageImageWithName:@"MessageAlert" extension:@"pdf"];
    [(PKDashboardPassMessage *)v18 setImage:v20];

    char v21 = PKLocalizedFeatureString();
    [(PKDashboardPassMessage *)v18 setButtonTitle:v21];

    v165[0] = MEMORY[0x1E4F143A8];
    v165[1] = 3221225472;
    v165[2] = __76__PKDashboardPaymentPassDataSource__messagesForAccountStatusWithCompletion___block_invoke_918;
    v165[3] = &unk_1E59D8BD0;
    objc_copyWeak(&v166, from);
    v165[4] = *(void *)(v1 + 48);
    [(PKDashboardPassMessage *)v18 setActionOnButtonPress:v165];
    id v22 = [MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForPass:WeakRetained[110]];
    [(PKDashboardPassMessage *)v18 setAnalyticsReporterSubject:v22];

    [v4 addObject:v18];
    objc_destroyWeak(&v166);
  }
  id v142 = v4;
  if (*(unsigned char *)(v1 + 72) && v12 != 3)
  {
    if (*(void *)(*(void *)(*(void *)(v1 + 56) + 8) + 40))
    {
      id v23 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      BOOL v24 = [*(id *)(*(void *)(*(void *)(v1 + 56) + 8) + 40) date];
      id v25 = [v23 components:14 fromDate:v24];

      int v26 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v27 = [*(id *)(*(void *)(*(void *)(v1 + 56) + 8) + 40) expirationDate];
      if ([v23 date:v26 matchesComponents:v25] && v27) {
        [v27 compare:v26];
      }
    }
    unint64_t v28 = objc_alloc_init(PKDashboardPassMessage);
    id v29 = *(NSDecimalNumber **)(v1 + 32);
    id v30 = [WeakRetained[49] creditDetails];
    char v31 = [v30 currencyCode];
    uint64_t v32 = PKCurrencyAmountCreate(v29, v31);

    id v33 = PKLocalizedFeatureString();
    [(PKDashboardPassMessage *)v28 setButtonTitle:v33];

    uint64_t v34 = [v32 minimalFormattedStringValue];
    id v35 = PKLocalizedFeatureString();
    -[PKDashboardPassMessage setMessage:](v28, "setMessage:", v35, v34);

    [(PKDashboardPassMessage *)v28 setIdentifier:@"accountPastDue"];
    uint64_t v36 = [MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForPass:WeakRetained[110]];
    [(PKDashboardPassMessage *)v28 setAnalyticsReporterSubject:v36];

    uint64_t v37 = PKLocalizedFeatureString();
    [(PKDashboardPassMessage *)v28 setTitle:v37];

    id v38 = [WeakRetained _messageImageWithName:@"MessageAlert" extension:@"pdf"];
    [(PKDashboardPassMessage *)v28 setImage:v38];

    v163[0] = MEMORY[0x1E4F143A8];
    v163[1] = 3221225472;
    v163[2] = __76__PKDashboardPaymentPassDataSource__messagesForAccountStatusWithCompletion___block_invoke_2_935;
    v163[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v164, from);
    [(PKDashboardPassMessage *)v28 setActionOnButtonPress:v163];
    [v4 addObject:v28];
    objc_destroyWeak(&v164);
  }
  if ((v5 & 1) == 0)
  {
    uint64_t v39 = [WeakRetained[49] state];
    if (v39 != 4)
    {
      if (v39 == 3)
      {
        uint64_t v40 = PKLocalizedFeatureString();
        if ((unint64_t)([WeakRetained[49] stateReason] - 5) <= 2)
        {
          uint64_t v42 = PKLocalizedFeatureString();
          if (v42) {
            goto LABEL_61;
          }
        }
      }
      else
      {
        if (v39 != 2)
        {
          int v46 = 0;
          int v49 = 0;
          uint64_t v141 = 0;
          id v47 = 0;
          uint64_t v40 = 0;
          goto LABEL_63;
        }
        uint64_t v40 = PKLocalizedFeatureString();
        uint64_t v41 = [WeakRetained[49] stateReason];
        if (unint64_t)(v41 - 1) <= 7 && ((0x87u >> (v41 - 1)))
        {
          uint64_t v42 = PKLocalizedFeatureString();
          if (v42)
          {
LABEL_61:
            id v47 = (void *)v42;
            int v46 = 0;
            uint64_t v141 = 0;
            int v49 = 1;
LABEL_63:
            id v48 = @"accountStatus";
LABEL_77:
            uint64_t v54 = objc_msgSend(WeakRetained[95], "currentAccountUser", v127);
            long long v55 = v54;
            if (!v40 && v54)
            {
              if ([v54 accessLevel] != 2)
              {
                uint64_t v40 = 0;
                id v4 = v142;
                goto LABEL_107;
              }
              uint64_t v56 = [v55 preferences];
              unint64_t v57 = v56;
              if (v56 && ([v56 spendingEnabled] & 1) == 0)
              {
                int v140 = v46;
                uint64_t v58 = [WeakRetained[95] accountUsers];
                long long v59 = [v58 objectsPassingTest:&__block_literal_global_982];
                long long v60 = [v59 allObjects];

                uint64_t v40 = PKLocalizedMadisonString(&cfstr_AccountUserSpe_2.isa);
                unint64_t v61 = [v60 count];
                v138 = v60;
                if (v61 < 2)
                {
                  if (v61 == 1)
                  {
                    double v73 = [v60 firstObject];
                    id v74 = WeakRetained[98];
                    uint64_t v75 = v73;
                    id v135 = v73;
                    [v73 altDSID];
                    v76 = id v131 = v57;
                    v137 = [v74 familyMemberForAltDSID:v76];

                    uint64_t v77 = (void *)MEMORY[0x1E4F845E8];
                    uint64_t v78 = [v75 nameComponents];
                    uint64_t v79 = [v77 contactForFamilyMember:v137 nameComponents:v78 imageData:0];

                    uint64_t v80 = [v79 givenName];
                    uint64_t v72 = PKLocalizedMadisonString(&cfstr_AccountUserSpe_4.isa, &stru_1EF1B4C70.isa, v80);

                    unint64_t v57 = v131;
                    id v47 = v135;
                  }
                  else
                  {
                    uint64_t v72 = PKLocalizedMadisonString(&cfstr_AccountUserSpe_5.isa);
                  }
                }
                else
                {
                  v136 = [v60 objectAtIndexedSubscript:0];
                  id v62 = WeakRetained[98];
                  [v136 altDSID];
                  long long v63 = v130 = v57;
                  id v134 = [v62 familyMemberForAltDSID:v63];

                  id v133 = [v60 objectAtIndexedSubscript:1];
                  id v64 = WeakRetained[98];
                  uint64_t v65 = [v133 altDSID];
                  id v132 = [v64 familyMemberForAltDSID:v65];

                  uint64_t v66 = (void *)MEMORY[0x1E4F845E8];
                  uint64_t v67 = [v136 nameComponents];
                  id v129 = [v66 contactForFamilyMember:v134 nameComponents:v67 imageData:0];

                  v68 = (void *)MEMORY[0x1E4F845E8];
                  uint64_t v69 = [v133 nameComponents];
                  id v128 = [v68 contactForFamilyMember:v132 nameComponents:v69 imageData:0];

                  v70 = [v129 givenName];
                  uint64_t v71 = [v128 givenName];
                  uint64_t v72 = PKLocalizedMadisonString(&cfstr_AccountUserSpe_3.isa, &stru_1EF1B5770.isa, v70, v71);

                  unint64_t v57 = v130;
                  id v47 = v136;
                }
                int v46 = v140;

                id v47 = (void *)v72;
              }
              else
              {
                uint64_t v40 = 0;
              }
            }
            if (v40)
            {
              v139 = v55;
              int v81 = v46;
              uint64_t v82 = objc_alloc_init(PKDashboardPassMessage);
              [(PKDashboardPassMessage *)v82 setIdentifier:v48];
              [(PKDashboardPassMessage *)v82 setReportToAnalytics:HIDWORD(v141)];
              [(PKDashboardPassMessage *)v82 setTitle:v40];
              [(PKDashboardPassMessage *)v82 setMessage:v47];
              id v83 = [MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForPass:WeakRetained[110]];
              [(PKDashboardPassMessage *)v82 setAnalyticsReporterSubject:v83];

              uint64_t v84 = [WeakRetained _messageImageWithName:@"MessageAlert" extension:@"pdf"];
              [(PKDashboardPassMessage *)v82 setImage:v84];

              if (v141)
              {
                id v85 = PKLocalizedFeatureString();
                [(PKDashboardPassMessage *)v82 setButtonTitle:v85];

                v161[0] = MEMORY[0x1E4F143A8];
                v161[1] = 3221225472;
                v161[2] = __76__PKDashboardPaymentPassDataSource__messagesForAccountStatusWithCompletion___block_invoke_4_999;
                v161[3] = &unk_1E59CA7F8;
                id v86 = &v162;
                objc_copyWeak(&v162, from);
                [(PKDashboardPassMessage *)v82 setActionOnButtonPress:v161];
              }
              else
              {
                if (HIDWORD(v141))
                {
                  if ([WeakRetained[110] supportsBarcodePayment]) {
                    PKLocalizedAquamanString(&cfstr_DeletePassAcco.isa);
                  }
                  else {
                  uint64_t v88 = PKLocalizedPaymentString(&cfstr_DeletePass.isa);
                  }
                  id v4 = v142;
                  [(PKDashboardPassMessage *)v82 setButtonTitle:v88];

                  v159[0] = MEMORY[0x1E4F143A8];
                  v159[1] = 3221225472;
                  v159[2] = __76__PKDashboardPaymentPassDataSource__messagesForAccountStatusWithCompletion___block_invoke_5;
                  v159[3] = &unk_1E59CA7F8;
                  id v86 = &v160;
                  objc_copyWeak(&v160, from);
                  [(PKDashboardPassMessage *)v82 setActionOnButtonPress:v159];
                  [(PKDashboardPassMessage *)v82 setIsDestructiveAction:1];
                  goto LABEL_105;
                }
                if (!v49)
                {
                  id v4 = v142;
                  if (!v81)
                  {
LABEL_106:
                    [v4 addObject:v82];

                    uint64_t v1 = v143;
                    long long v55 = v139;
                    goto LABEL_107;
                  }
                  v89 = PKLocalizedMadisonString(&cfstr_AccountClosure_5.isa);
                  [(PKDashboardPassMessage *)v82 setButtonTitle:v89];

                  v155[0] = MEMORY[0x1E4F143A8];
                  v155[1] = 3221225472;
                  v155[2] = __76__PKDashboardPaymentPassDataSource__messagesForAccountStatusWithCompletion___block_invoke_7;
                  v155[3] = &unk_1E59CA7F8;
                  id v86 = &v156;
                  objc_copyWeak(&v156, from);
                  [(PKDashboardPassMessage *)v82 setActionOnButtonPress:v155];
LABEL_105:
                  objc_destroyWeak(v86);
                  goto LABEL_106;
                }
                v87 = PKLocalizedFeatureString();
                [(PKDashboardPassMessage *)v82 setButtonTitle:v87];

                [(PKDashboardPassMessage *)v82 setShowDisclosure:1];
                v157[0] = MEMORY[0x1E4F143A8];
                v157[1] = 3221225472;
                v157[2] = __76__PKDashboardPaymentPassDataSource__messagesForAccountStatusWithCompletion___block_invoke_6;
                v157[3] = &unk_1E59CA7F8;
                id v86 = &v158;
                objc_copyWeak(&v158, from);
                [(PKDashboardPassMessage *)v82 setActionOnButtonPress:v157];
              }
              id v4 = v142;
              goto LABEL_105;
            }
            id v4 = v142;
            uint64_t v1 = v143;
LABEL_107:

            goto LABEL_108;
          }
        }
      }
      uint64_t v42 = PKLocalizedFeatureString();
      goto LABEL_61;
    }
    long long v43 = [WeakRetained[49] creditDetails];
    id v44 = [v43 accountSummary];

    id v45 = [v44 adjustedBalance];
    int v46 = [WeakRetained[49] isCoOwner];
    if (v46)
    {
      uint64_t v40 = PKLocalizedFeatureString();
      id v47 = PKLocalizedFeatureString();
      uint64_t v141 = 0;
LABEL_57:
      id v48 = @"accountStatusClosedNoBalance";
LABEL_76:

      int v49 = 0;
      uint64_t v1 = v143;
      goto LABEL_77;
    }
    if (v45 && [WeakRetained[49] supportsSchedulePayment])
    {
      uint64_t v40 = PKLocalizedFeatureString();
      id v47 = PKLocalizedFeatureString();
      uint64_t v141 = 1;
    }
    else
    {
      uint64_t v50 = objc_msgSend(WeakRetained[49], "accessLevel", v127);
      if (v50 == 2)
      {
        int v51 = v46;
        uint64_t v52 = [WeakRetained[97] count];
        uint64_t v40 = PKLocalizedMadisonString(&cfstr_AccountService_238.isa);
        BOOL v14 = v52 == 0;
        int v46 = v51;
        if (v14) {
          uint64_t v53 = @"ACCOUNT_SERVICE_ACCOUNT_CLOSED_PARTICIPANT_MESSAGE";
        }
        else {
          uint64_t v53 = @"ACCOUNT_SERVICE_ACCOUNT_CLOSED_PARTICIPANT_WITH_PHYSICAL_CARD_MESSAGE";
        }
        id v47 = PKLocalizedMadisonString(&v53->isa);
        uint64_t v141 = 0x100000000;
        id v48 = @"accountStatusClosedParticipant";
        goto LABEL_76;
      }
      if (v50 == 1)
      {
        uint64_t v40 = PKLocalizedFeatureString();
        id v47 = PKLocalizedFeatureString();
        uint64_t v141 = 0x100000000;
        goto LABEL_57;
      }
      uint64_t v141 = 0;
      id v47 = 0;
      uint64_t v40 = 0;
    }
    id v48 = @"accountStatus";
    goto LABEL_76;
  }
LABEL_108:
  uint64_t v90 = objc_msgSend(WeakRetained[49], "creditDetails", v127);
  uint64_t v91 = [v90 virtualCards];

  if ([v91 count])
  {
    uint64_t v92 = [v91 anyObject];
  }
  else
  {
    uint64_t v92 = 0;
  }
  if ([WeakRetained[49] state] == 1
    && [v91 count] == 1
    && [v92 state] == 3)
  {
    uint64_t v93 = objc_alloc_init(PKDashboardPassMessage);
    [(PKDashboardPassMessage *)v93 setIdentifier:@"virtualCardSuspended"];
    uint64_t v94 = PKLocalizedFeatureString();
    [(PKDashboardPassMessage *)v93 setTitle:v94];

    uint64_t v95 = PKLocalizedFeatureString();
    [(PKDashboardPassMessage *)v93 setMessage:v95];

    uint64_t v96 = [WeakRetained _messageImageWithName:@"MessageAlert" extension:@"pdf"];
    [(PKDashboardPassMessage *)v93 setImage:v96];

    char v97 = PKLocalizedFeatureString();
    [(PKDashboardPassMessage *)v93 setButtonTitle:v97];

    v153[0] = MEMORY[0x1E4F143A8];
    v153[1] = 3221225472;
    v153[2] = __76__PKDashboardPaymentPassDataSource__messagesForAccountStatusWithCompletion___block_invoke_8;
    v153[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v154, from);
    [(PKDashboardPassMessage *)v93 setActionOnButtonPress:v153];
    [v4 addObject:v93];
    objc_destroyWeak(&v154);
  }
  int v98 = [WeakRetained[49] accountIdentifier];
  int ShouldShowVPANReissuedMessage = PKCardShouldShowVPANReissuedMessage();

  if (!ShouldShowVPANReissuedMessage) {
    goto LABEL_127;
  }
  v100 = PKLocalizedFeatureString();
  id v101 = PKCardAltDSIDForVPANReissuedMessage();
  if ([v101 length])
  {
    v102 = PKCurrentUserAltDSID();
    id v103 = v101;
    id v104 = v102;
    if (v103 == v104)
    {
      uint64_t v107 = v103;
      v108 = v103;
    }
    else
    {
      char v105 = v104;
      if (v103 && v104)
      {
        char v106 = [v103 isEqualToString:v104];

        if (v106)
        {
          id v4 = v142;
          goto LABEL_126;
        }
      }
      else
      {
      }
      v108 = [WeakRetained[95] accountUserWithAltDSID:v103];
      uint64_t v107 = [WeakRetained[98] familyMemberForAltDSID:v103];
      v109 = (void *)MEMORY[0x1E4F845E8];
      id v110 = [v108 nameComponents];
      id v103 = [v109 contactForFamilyMember:v107 nameComponents:v110 imageData:0];

      uint64_t v111 = [v103 givenName];
      uint64_t v112 = PKLocalizedMadisonString(&cfstr_AccountService_244.isa, &stru_1EF1B4C70.isa, v111);

      v100 = (void *)v112;
      id v4 = v142;
    }
  }
LABEL_126:
  id v113 = objc_alloc_init(PKDashboardPassMessage);
  [(PKDashboardPassMessage *)v113 setIdentifier:@"virtualCardAutoReissued"];
  v114 = PKLocalizedFeatureString();
  [(PKDashboardPassMessage *)v113 setTitle:v114];

  [(PKDashboardPassMessage *)v113 setMessage:v100];
  id v115 = [WeakRetained _messageImageWithName:@"MessageAlert" extension:@"pdf"];
  [(PKDashboardPassMessage *)v113 setImage:v115];

  uint64_t v116 = PKLocalizedFeatureString();
  [(PKDashboardPassMessage *)v113 setButtonTitle:v116];

  v151[0] = MEMORY[0x1E4F143A8];
  v151[1] = 3221225472;
  v151[2] = __76__PKDashboardPaymentPassDataSource__messagesForAccountStatusWithCompletion___block_invoke_9;
  v151[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v152, from);
  [(PKDashboardPassMessage *)v113 setActionOnButtonPress:v151];
  v149[0] = MEMORY[0x1E4F143A8];
  v149[1] = 3221225472;
  v149[2] = __76__PKDashboardPaymentPassDataSource__messagesForAccountStatusWithCompletion___block_invoke_10;
  v149[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v150, from);
  [(PKDashboardPassMessage *)v113 setActionOnDismiss:v149];
  [v4 addObject:v113];
  objc_destroyWeak(&v150);
  objc_destroyWeak(&v152);

  uint64_t v1 = v143;
LABEL_127:
  uint64_t v117 = [WeakRetained[49] accountIdentifier];
  int ShouldShowVPANUpdatedMessage = PKAppleCardShouldShowVPANUpdatedMessage();

  if (ShouldShowVPANUpdatedMessage)
  {
    unint64_t v119 = objc_alloc_init(PKDashboardPassMessage);
    [(PKDashboardPassMessage *)v119 setIdentifier:@"virtualCardUpdated"];
    uint64_t v120 = PKLocalizedFeatureString();
    [(PKDashboardPassMessage *)v119 setTitle:v120];

    id v121 = PKLocalizedFeatureString();
    [(PKDashboardPassMessage *)v119 setMessage:v121];

    id v122 = [MEMORY[0x1E4FB1818] systemImageNamed:@"creditcard.and.123"];
    [(PKDashboardPassMessage *)v119 setImage:v122];

    id v123 = [MEMORY[0x1E4FB1618] labelColor];
    [(PKDashboardPassMessage *)v119 setImageTintColor:v123];

    [(PKDashboardPassMessage *)v119 setShowDisclosure:1];
    id v124 = PKLocalizedFeatureString();
    [(PKDashboardPassMessage *)v119 setButtonTitle:v124];

    v147[0] = MEMORY[0x1E4F143A8];
    v147[1] = 3221225472;
    v147[2] = __76__PKDashboardPaymentPassDataSource__messagesForAccountStatusWithCompletion___block_invoke_11;
    v147[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v148, from);
    [(PKDashboardPassMessage *)v119 setActionOnDismiss:v147];
    v145[0] = MEMORY[0x1E4F143A8];
    v145[1] = 3221225472;
    v145[2] = __76__PKDashboardPaymentPassDataSource__messagesForAccountStatusWithCompletion___block_invoke_12;
    v145[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v146, from);
    [(PKDashboardPassMessage *)v119 setActionOnButtonPress:v145];
    [v4 addObject:v119];
    objc_destroyWeak(&v146);
    objc_destroyWeak(&v148);
  }
  uint64_t v125 = *(void *)(v1 + 40);
  id v126 = (void *)[v4 copy];
  (*(void (**)(uint64_t, void *))(v125 + 16))(v125, v126);

LABEL_130:
}

void __76__PKDashboardPaymentPassDataSource__messagesForAccountStatusWithCompletion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v1 = [[PKBusinessChatAccountStateContext alloc] initWithAccount:WeakRetained[49] paymentPass:WeakRetained[110] eligibleForRecoveryPaymentPlan:1];
    [WeakRetained _presentAccountResolution:3 forBusinessChatContext:v1];
  }
}

void __76__PKDashboardPaymentPassDataSource__messagesForAccountStatusWithCompletion___block_invoke_4()
{
  id v1 = (id)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:@"https://support.apple.com/HT213514"];
  unint64_t v0 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v0 openURL:v1 configuration:0 completionHandler:0];
}

void __76__PKDashboardPaymentPassDataSource__messagesForAccountStatusWithCompletion___block_invoke_918(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) anyObject];
    LOBYTE(v6) = 1;
    uint64_t v3 = [[PKPaymentTransactionDetailViewController alloc] initWithTransaction:v2 transactionSourceCollection:*((void *)WeakRetained + 6) familyCollection:*((void *)WeakRetained + 98) account:*((void *)WeakRetained + 49) accountUserCollection:*((void *)WeakRetained + 95) bankConnectInstitution:0 physicalCards:*((void *)WeakRetained + 97) contactResolver:0 peerPaymentWebService:*((void *)WeakRetained + 109) paymentServiceDataProvider:*((void *)WeakRetained + 32) detailViewStyle:0 allowTransactionLinks:v6];
    id v4 = objc_msgSend(*((id *)WeakRetained + 1), "pkui_viewControllerFromResponderChain");
    char v5 = [v4 navigationController];
    [v5 pushViewController:v3 animated:1];
  }
}

void __76__PKDashboardPaymentPassDataSource__messagesForAccountStatusWithCompletion___block_invoke_2_935(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    uint64_t v2 = (void *)WeakRetained[65];
    if (!v2)
    {
      uint64_t v3 = [[PKAccountServiceAccountResolutionController alloc] initWithAccount:*((void *)v5 + 49) accountUserCollection:*((void *)v5 + 95) transactionSourceCollection:*((void *)v5 + 6)];
      id v4 = (void *)*((void *)v5 + 65);
      *((void *)v5 + 65) = v3;

      objc_msgSend(*((id *)v5 + 65), "setDelegate:");
      uint64_t v2 = (void *)*((void *)v5 + 65);
    }
    [v2 presentFlowForAccountResolution:1 configuration:0 completion:0];
    id WeakRetained = v5;
  }
}

uint64_t __76__PKDashboardPaymentPassDataSource__messagesForAccountStatusWithCompletion___block_invoke_3_979(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 accessLevel] == 1)
  {
    [v2 accountState];
    uint64_t v3 = PKAccountStateIsTerminal() ^ 1;
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void __76__PKDashboardPaymentPassDataSource__messagesForAccountStatusWithCompletion___block_invoke_4_999(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v2 = (void *)WeakRetained[65];
    if (!v2)
    {
      uint64_t v3 = [[PKAccountServiceAccountResolutionController alloc] initWithAccount:*((void *)v5 + 49) accountUserCollection:*((void *)v5 + 95) transactionSourceCollection:*((void *)v5 + 6)];
      id v4 = (void *)*((void *)v5 + 65);
      *((void *)v5 + 65) = v3;

      objc_msgSend(*((id *)v5 + 65), "setDelegate:");
      id v2 = (void *)*((void *)v5 + 65);
    }
    [v2 presentFlowForAccountResolution:1 configuration:0 completion:0];
    id WeakRetained = v5;
  }
}

void __76__PKDashboardPaymentPassDataSource__messagesForAccountStatusWithCompletion___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _deleteButtonPressed];
    id WeakRetained = v2;
  }
}

void __76__PKDashboardPaymentPassDataSource__messagesForAccountStatusWithCompletion___block_invoke_6(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    if ([WeakRetained[49] feature] == 4)
    {
      [v3 _presentPassContactSupportWithOption:15];
    }
    else
    {
      id v2 = [[PKBusinessChatAccountStateContext alloc] initWithAccount:v3[49] paymentPass:v3[110] eligibleForRecoveryPaymentPlan:0];
      [v3 _presentAccountResolution:2 forBusinessChatContext:v2];
    }
    id WeakRetained = v3;
  }
}

void __76__PKDashboardPaymentPassDataSource__messagesForAccountStatusWithCompletion___block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _presentAboutClosedAccounts];
    id WeakRetained = v2;
  }
}

void __76__PKDashboardPaymentPassDataSource__messagesForAccountStatusWithCompletion___block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v1 = [[PKBusinessChatAccountStateContext alloc] initWithAccount:WeakRetained[49] paymentPass:WeakRetained[110] eligibleForRecoveryPaymentPlan:0];
    [WeakRetained _presentAccountResolution:2 forBusinessChatContext:v1];
  }
}

void __76__PKDashboardPaymentPassDataSource__messagesForAccountStatusWithCompletion___block_invoke_9(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    [WeakRetained _presentCardNumbers];
    id v2 = [v3[49] accountIdentifier];
    PKCardSetShouldShowVPANReissuedMessage();

    PKCardSetAltDSIDForVPANReissuedMessage();
    [v3 reloadMessages];
    id WeakRetained = v3;
  }
}

void __76__PKDashboardPaymentPassDataSource__messagesForAccountStatusWithCompletion___block_invoke_10(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    id v2 = [WeakRetained[49] accountIdentifier];
    PKCardSetShouldShowVPANReissuedMessage();

    PKCardSetAltDSIDForVPANReissuedMessage();
    [v3 reloadMessages];
    id WeakRetained = v3;
  }
}

void __76__PKDashboardPaymentPassDataSource__messagesForAccountStatusWithCompletion___block_invoke_11(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    id v2 = [WeakRetained[49] accountIdentifier];
    PKAppleCardSetShouldShowVPANUpdatedMessage();

    [v3 reloadMessages];
    id WeakRetained = v3;
  }
}

void __76__PKDashboardPaymentPassDataSource__messagesForAccountStatusWithCompletion___block_invoke_12(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    [WeakRetained _presentCardNumbers];
    id v2 = [v3[49] accountIdentifier];
    PKAppleCardSetShouldShowVPANUpdatedMessage();

    [v3 reloadMessages];
    id WeakRetained = v3;
  }
}

- (id)_cardSharingEducationMessages
{
  if (!self->_accountUsersLoaded
    || !self->_accountUserInvitationsLoaded
    || !self->_familyCollectionLoaded
    || !self->_account)
  {
    id v29 = 0;
    goto LABEL_11;
  }
  objc_initWeak(&location, self);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(PKAccountUserCollection *)self->_accountUserCollection activeAccountUsers];
  id v5 = [v4 objectsPassingTest:&__block_literal_global_1037];
  uint64_t v6 = [v5 allObjects];

  if (![v6 count]) {
    goto LABEL_20;
  }
  if ([(PKAccount *)self->_account accessLevel] != 2 || (PKSharedCacheGetBoolForKey() & 1) != 0) {
    goto LABEL_18;
  }
  id v7 = objc_alloc_init(PKDashboardPassMessage);
  [(PKDashboardPassMessage *)v7 setIdentifier:@"welcomeToCardParticipantPrompt"];
  [(PKDashboardPassMessage *)v7 setReportToAnalytics:1];
  id v8 = PKDashboardMessagePassIcon(self->_pass);
  [(PKDashboardPassMessage *)v7 setImage:v8];

  uint64_t v9 = PKLocalizedMadisonString(&cfstr_ParticipantDas.isa);
  [(PKDashboardPassMessage *)v7 setTitle:v9];

  if ((unint64_t)[v6 count] < 2)
  {
    if (![v6 count])
    {
      uint64_t v27 = 0;
      goto LABEL_17;
    }
    char v31 = (void *)MEMORY[0x1E4F845E8];
    familyCollection = self->_familyCollection;
    id v33 = [v6 objectAtIndexedSubscript:0];
    uint64_t v34 = [v33 altDSID];
    id v35 = [(PKFamilyMemberCollection *)familyCollection familyMemberForAltDSID:v34];
    uint64_t v36 = [v6 objectAtIndexedSubscript:0];
    uint64_t v37 = [v36 nameComponents];
    unint64_t v28 = [v31 contactForFamilyMember:v35 nameComponents:v37 imageData:0];

    BOOL v24 = [v28 givenName];
    uint64_t v27 = PKLocalizedMadisonString(&cfstr_ParticipantDas_0.isa, &stru_1EF1B4C70.isa, v24);
  }
  else
  {
    BOOL v10 = (void *)MEMORY[0x1E4F845E8];
    BOOL v11 = self->_familyCollection;
    uint64_t v12 = [v6 objectAtIndexedSubscript:0];
    uint64_t v13 = [v12 altDSID];
    BOOL v14 = [(PKFamilyMemberCollection *)v11 familyMemberForAltDSID:v13];
    uint64_t v15 = [v6 objectAtIndexedSubscript:0];
    uint64_t v16 = [v15 nameComponents];
    uint64_t v39 = [v10 contactForFamilyMember:v14 nameComponents:v16 imageData:0];

    id v17 = (void *)MEMORY[0x1E4F845E8];
    id v18 = self->_familyCollection;
    id v19 = [v6 objectAtIndexedSubscript:1];
    id v20 = [v19 altDSID];
    char v21 = [(PKFamilyMemberCollection *)v18 familyMemberForAltDSID:v20];
    id v22 = [v6 objectAtIndexedSubscript:1];
    id v23 = [v22 nameComponents];
    BOOL v24 = [v17 contactForFamilyMember:v21 nameComponents:v23 imageData:0];

    id v25 = [v39 givenName];
    int v26 = [v24 givenName];
    uint64_t v27 = PKLocalizedMadisonString(&cfstr_ParticipantCoO.isa, &stru_1EF1B5770.isa, v25, v26);

    unint64_t v28 = v39;
  }

LABEL_17:
  [(PKDashboardPassMessage *)v7 setMessage:v27];
  id v38 = [MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForPass:self->_pass];
  [(PKDashboardPassMessage *)v7 setAnalyticsReporterSubject:v38];

  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  id v40[2] = __65__PKDashboardPaymentPassDataSource__cardSharingEducationMessages__block_invoke_2;
  v40[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v41, &location);
  [(PKDashboardPassMessage *)v7 setActionOnDismiss:v40];
  [v3 addObject:v7];
  objc_destroyWeak(&v41);

LABEL_18:
  if (![v3 count])
  {
LABEL_20:
    id v29 = 0;
    goto LABEL_21;
  }
  id v29 = (void *)[v3 copy];
LABEL_21:

  objc_destroyWeak(&location);
LABEL_11:

  return v29;
}

BOOL __65__PKDashboardPaymentPassDataSource__cardSharingEducationMessages__block_invoke(uint64_t a1, void *a2)
{
  return [a2 accessLevel] == 1;
}

void __65__PKDashboardPaymentPassDataSource__cardSharingEducationMessages__block_invoke_2(uint64_t a1)
{
  PKSharedCacheSetBoolForKey();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained reloadMessages];
    id WeakRetained = v3;
  }
}

- (void)_presentAccountResolution:(unint64_t)a3 forBusinessChatContext:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (!self->_accountResolutionController)
  {
    id v7 = [[PKAccountServiceAccountResolutionController alloc] initWithAccount:self->_account accountUserCollection:self->_accountUserCollection transactionSourceCollection:self->_transactionSourceCollection];
    accountResolutionController = self->_accountResolutionController;
    self->_accountResolutionController = v7;

    [(PKAccountServiceAccountResolutionController *)self->_accountResolutionController setDelegate:self];
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F84278]);
  [v9 setBusinessChatContext:v6];

  [(PKAccountServiceAccountResolutionController *)self->_accountResolutionController presentFlowForAccountResolution:a3 configuration:v9 completion:0];
}

- (void)_presentPassContactSupportWithOption:(unint64_t)a3
{
}

- (void)_messageForPeerPaymentIdentityVerificationForRewardsWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (v4)
  {
    char BoolForKey = PKSharedCacheGetBoolForKey();
    if (!self->_account || (BoolForKey & 1) != 0)
    {
      v4[2](v4, 0);
    }
    else
    {
      objc_initWeak(&location, self);
      account = self->_account;
      id v7 = [(PKAccountUserCollection *)self->_accountUserCollection currentAccountUser];
      peerPaymentAccount = self->_peerPaymentAccount;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __103__PKDashboardPaymentPassDataSource__messageForPeerPaymentIdentityVerificationForRewardsWithCompletion___block_invoke;
      v9[3] = &unk_1E59D9E30;
      objc_copyWeak(&v11, &location);
      BOOL v10 = v4;
      +[PKCreditAccountController resolutionToReceiveCashbackForAccount:account accountUser:v7 withPeerPaymentAccount:peerPaymentAccount completion:v9];

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
}

void __103__PKDashboardPaymentPassDataSource__messageForPeerPaymentIdentityVerificationForRewardsWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (a2 == 2)
    {
      id v6 = objc_alloc_init(PKDashboardPassMessage);
      id v7 = PKLocalizedFeatureString();
      [(PKDashboardPassMessage *)v6 setTitle:v7];

      id v8 = PKLocalizedFeatureString();
      [(PKDashboardPassMessage *)v6 setMessage:v8];

      [(PKDashboardPassMessage *)v6 setIdentifier:@"fixRewards"];
      id v9 = [WeakRetained _messageImageWithName:@"AppleCashIcon" extension:@"pdf"];
      [(PKDashboardPassMessage *)v6 setImage:v9];

      [(PKDashboardPassMessage *)v6 setShowDisclosure:1];
      BOOL v10 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentAcc_7.isa);
      [(PKDashboardPassMessage *)v6 setButtonTitle:v10];

      id v11 = [MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForPass:WeakRetained[110]];
      [(PKDashboardPassMessage *)v6 setAnalyticsReporterSubject:v11];

      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      void v14[2] = __103__PKDashboardPaymentPassDataSource__messageForPeerPaymentIdentityVerificationForRewardsWithCompletion___block_invoke_2;
      id v14[3] = &unk_1E59CF720;
      objc_copyWeak(v15, v4);
      v15[1] = (id)2;
      [(PKDashboardPassMessage *)v6 setActionOnButtonPress:v14];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      id v12[2] = __103__PKDashboardPaymentPassDataSource__messageForPeerPaymentIdentityVerificationForRewardsWithCompletion___block_invoke_3;
      v12[3] = &unk_1E59CA7F8;
      objc_copyWeak(&v13, v4);
      [(PKDashboardPassMessage *)v6 setActionOnDismiss:v12];
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      objc_destroyWeak(&v13);
      objc_destroyWeak(v15);
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

void __103__PKDashboardPaymentPassDataSource__messageForPeerPaymentIdentityVerificationForRewardsWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _peerPaymentResolutionTappedWithResolution:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

void __103__PKDashboardPaymentPassDataSource__messageForPeerPaymentIdentityVerificationForRewardsWithCompletion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    PKSharedCacheSetBoolForKey();
    [WeakRetained reloadMessages];
  }
}

- (id)_messageForPeerPaymentFamilySharing
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  int BoolForKey = PKSharedCacheGetBoolForKey();
  peerPaymentAccount = self->_peerPaymentAccount;
  if (!peerPaymentAccount
    || (([(PKPeerPaymentAccount *)peerPaymentAccount supportsFamilySharing] ^ 1 | BoolForKey) & 1) != 0
    || [(PKPeerPaymentAccount *)self->_peerPaymentAccount role] == 1)
  {
    id v5 = 0;
    goto LABEL_5;
  }
  id v7 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount associatedAccountInformation];
  id v8 = [v7 associatedAccounts];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    BOOL v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "Not showing peer payment family sharing dashboard message because the user has an associated account already.", (uint8_t *)buf, 2u);
    }
    goto LABEL_27;
  }
  BOOL v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v11 = [(PKFamilyMemberCollection *)self->_familyCollection familyMembersByAltDSID];
  uint64_t v12 = [v11 allValues];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (!v13)
  {

LABEL_27:
    id v5 = 0;
    goto LABEL_28;
  }
  char v14 = 0;
  uint64_t v15 = *(void *)v30;
  do
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v30 != v15) {
        objc_enumerationMutation(v12);
      }
      id v17 = *(void **)(*((void *)&v29 + 1) + 8 * i);
      if [v17 isMe] && (objc_msgSend(v17, "isOrganizer"))
      {
        char v14 = 1;
      }
      else if ([v17 memberType] == 1 || objc_msgSend(v17, "memberType") == 2)
      {
        [v10 addObject:v17];
      }
    }
    uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
  }
  while (v13);

  if ((v14 & 1) == 0) {
    goto LABEL_27;
  }
  id v5 = objc_alloc_init(PKDashboardPassMessage);
  id v18 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentDas.isa);
  [(PKDashboardPassMessage *)v5 setTitle:v18];

  id v19 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentDas_0.isa);
  [(PKDashboardPassMessage *)v5 setMessage:v19];

  [(PKDashboardPassMessage *)v5 setIdentifier:@"peerPaymentFamilySharing"];
  id v20 = [(PKDashboardPaymentPassDataSource *)self _messageImageWithName:@"AppleCashIcon" extension:@"pdf"];
  [(PKDashboardPassMessage *)v5 setImage:v20];

  [(PKDashboardPassMessage *)v5 setShowDisclosure:1];
  char v21 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentDas_1.isa);
  [(PKDashboardPassMessage *)v5 setButtonTitle:v21];

  id v22 = [MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForPass:self->_pass];
  [(PKDashboardPassMessage *)v5 setAnalyticsReporterSubject:v22];

  objc_initWeak(buf, self);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __71__PKDashboardPaymentPassDataSource__messageForPeerPaymentFamilySharing__block_invoke;
  v25[3] = &unk_1E59CB010;
  objc_copyWeak(&v27, buf);
  BOOL v10 = v10;
  int v26 = v10;
  [(PKDashboardPassMessage *)v5 setActionOnButtonPress:v25];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __71__PKDashboardPaymentPassDataSource__messageForPeerPaymentFamilySharing__block_invoke_1064;
  v23[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v24, buf);
  [(PKDashboardPassMessage *)v5 setActionOnDismiss:v23];
  objc_destroyWeak(&v24);

  objc_destroyWeak(&v27);
  objc_destroyWeak(buf);
LABEL_28:

LABEL_5:

  return v5;
}

void __71__PKDashboardPaymentPassDataSource__messageForPeerPaymentFamilySharing__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if ([*(id *)(a1 + 32) count] == 1)
    {
      id v3 = [*(id *)(a1 + 32) anyObject];
      id v4 = [v3 altDSID];
      id v5 = PKPeerPaymentGetAppleCashFamilySettingsSensitiveURLForAltDSID();
      id v6 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 138412290;
        uint64_t v9 = v3;
        _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Opening apple cash feature in settings from dashboard for child %@", (uint8_t *)&v8, 0xCu);
      }
    }
    else
    {
      id v5 = PKPeerPaymentGetAppleCashFamilySettingsSensitiveURLForAltDSID();
      id v3 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v8) = 0;
        _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Opening apple cash feature in settings from dashboard", (uint8_t *)&v8, 2u);
      }
    }

    if (v5)
    {
      id v7 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      [v7 openSensitiveURL:v5 withOptions:0];
    }
    PKSharedCacheSetBoolForKey();
    [WeakRetained reloadMessages];
  }
}

void __71__PKDashboardPaymentPassDataSource__messageForPeerPaymentFamilySharing__block_invoke_1064(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    PKSharedCacheSetBoolForKey();
    [WeakRetained reloadMessages];
  }
}

- (id)_messageForPeerPaymentLockedAccountByAssociatedAccount
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  peerPaymentAccount = self->_peerPaymentAccount;
  if (peerPaymentAccount
    && [(PKPeerPaymentAccount *)peerPaymentAccount supportsFamilySharing]
    && [(PKPeerPaymentAccount *)self->_peerPaymentAccount role]
    && [(PKPeerPaymentAccount *)self->_peerPaymentAccount isParticipantAccountLockedByOwner])
  {
    id v4 = objc_alloc_init(PKDashboardPassMessage);
    id v5 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentDas_9.isa);
    [(PKDashboardPassMessage *)v4 setTitle:v5];

    id v6 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentDas_10.isa);
    [(PKDashboardPassMessage *)v4 setMessage:v6];

    [(PKDashboardPassMessage *)v4 setIdentifier:@"peerPaymentLockedByAssociatedAccount"];
    id v7 = [(PKDashboardPaymentPassDataSource *)self _messageImageWithName:@"MessageAlert" extension:@"pdf"];
    [(PKDashboardPassMessage *)v4 setImage:v7];

    [(PKDashboardPassMessage *)v4 setShowDisclosure:1];
    int v8 = [MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForPass:self->_pass];
    [(PKDashboardPassMessage *)v4 setAnalyticsReporterSubject:v8];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_messageForPeerPaymentAssociatedAccountStateChangedForSecurityReasons
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  peerPaymentAccount = self->_peerPaymentAccount;
  if (!peerPaymentAccount
    || ![(PKPeerPaymentAccount *)peerPaymentAccount supportsFamilySharing]
    || [(PKPeerPaymentAccount *)self->_peerPaymentAccount role] == 1)
  {
    id v4 = 0;
    goto LABEL_5;
  }
  id v49 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v44 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v6 = [(PKFamilyMemberCollection *)self->_familyCollection familyMembersByAltDSID];
  id v7 = [v6 allValues];

  id v4 = (void *)[v7 countByEnumeratingWithState:&v64 objects:v70 count:16];
  if (!v4) {
    goto LABEL_42;
  }
  char v8 = 0;
  uint64_t v9 = *(void *)v65;
  do
  {
    for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v65 != v9) {
        objc_enumerationMutation(v7);
      }
      id v11 = *(void **)(*((void *)&v64 + 1) + 8 * i);
      if [v11 isMe] && (objc_msgSend(v11, "isOrganizer"))
      {
        char v8 = 1;
      }
      else
      {
        uint64_t v12 = self->_peerPaymentAccount;
        uint64_t v13 = [v11 altDSID];
        char v14 = [(PKPeerPaymentAccount *)v12 peerPaymentAccountWithAltDSID:v13];

        if (v14)
        {
          char v15 = [v14 isPariticipantAccountSecurityDowngraded];
          uint64_t v16 = v49;
          if ((v15 & 1) != 0 || (v17 = [v14 isPariticipantAccountEmbargoRecovery], uint64_t v16 = v44, v17)) {
            [v16 addObject:v11];
          }
        }
      }
    }
    id v4 = (void *)[v7 countByEnumeratingWithState:&v64 objects:v70 count:16];
  }
  while (v4);

  if (v8)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id obj = v49;
    uint64_t v47 = [obj countByEnumeratingWithState:&v60 objects:v69 count:16];
    if (v47)
    {
      uint64_t v46 = *(void *)v61;
      do
      {
        for (uint64_t j = 0; j != v47; ++j)
        {
          if (*(void *)v61 != v46) {
            objc_enumerationMutation(obj);
          }
          id v19 = *(void **)(*((void *)&v60 + 1) + 8 * j);
          id v20 = [v19 firstName];
          char v21 = [v19 altDSID];
          id v22 = objc_alloc_init(PKDashboardPassMessage);
          id v23 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentDas_11.isa, &stru_1EF1B4C70.isa, v20);
          [(PKDashboardPassMessage *)v22 setTitle:v23];

          id v24 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentDas_12.isa, &stru_1EF1B4C70.isa, v20);
          [(PKDashboardPassMessage *)v22 setMessage:v24];

          id v25 = [NSString stringWithFormat:@"%@-%@", @"peerPaymentAssociatedAccountLockedHSA2Upgrade", v21];
          [(PKDashboardPassMessage *)v22 setIdentifier:v25];
          int v26 = [(PKDashboardPaymentPassDataSource *)self _messageImageWithName:@"MessageAlert" extension:@"pdf"];
          [(PKDashboardPassMessage *)v22 setImage:v26];

          [(PKDashboardPassMessage *)v22 setShowDisclosure:1];
          id v27 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentDas_13.isa);
          [(PKDashboardPassMessage *)v22 setButtonTitle:v27];

          unint64_t v28 = [MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForPass:self->_pass];
          [(PKDashboardPassMessage *)v22 setAnalyticsReporterSubject:v28];

          objc_initWeak(&location, self);
          v56[0] = MEMORY[0x1E4F143A8];
          v56[1] = 3221225472;
          v56[2] = __105__PKDashboardPaymentPassDataSource__messageForPeerPaymentAssociatedAccountStateChangedForSecurityReasons__block_invoke;
          v56[3] = &unk_1E59CB378;
          objc_copyWeak(&v58, &location);
          v56[4] = v19;
          id v29 = v21;
          id v57 = v29;
          [(PKDashboardPassMessage *)v22 setActionOnButtonPress:v56];
          [v7 addObject:v22];

          objc_destroyWeak(&v58);
          objc_destroyWeak(&location);
        }
        uint64_t v47 = [obj countByEnumeratingWithState:&v60 objects:v69 count:16];
      }
      while (v47);
    }

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v45 = v44;
    uint64_t v30 = [v45 countByEnumeratingWithState:&v52 objects:v68 count:16];
    if (v30)
    {
      uint64_t v48 = *(void *)v53;
      do
      {
        for (uint64_t k = 0; k != v30; ++k)
        {
          if (*(void *)v53 != v48) {
            objc_enumerationMutation(v45);
          }
          long long v32 = *(void **)(*((void *)&v52 + 1) + 8 * k);
          id v33 = [v32 firstName];
          uint64_t v34 = [v32 altDSID];
          id v35 = objc_alloc_init(PKDashboardPassMessage);
          uint64_t v36 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentDas_14.isa);
          [(PKDashboardPassMessage *)v35 setTitle:v36];

          uint64_t v37 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentDas_15.isa, &stru_1EF1B5770.isa, v33, v33);
          [(PKDashboardPassMessage *)v35 setMessage:v37];

          id v38 = [NSString stringWithFormat:@"%@-%@", @"peerPaymentAssociatedAccountLockedEmbargoRecovery", v34];
          [(PKDashboardPassMessage *)v35 setIdentifier:v38];
          uint64_t v39 = [(PKDashboardPaymentPassDataSource *)self _messageImageWithName:@"MessageAlert" extension:@"pdf"];
          [(PKDashboardPassMessage *)v35 setImage:v39];

          [(PKDashboardPassMessage *)v35 setShowDisclosure:1];
          uint64_t v40 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentDas_16.isa);
          [(PKDashboardPassMessage *)v35 setButtonTitle:v40];

          id v41 = [MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForPass:self->_pass];
          [(PKDashboardPassMessage *)v35 setAnalyticsReporterSubject:v41];

          v50[0] = MEMORY[0x1E4F143A8];
          v50[1] = 3221225472;
          void v50[2] = __105__PKDashboardPaymentPassDataSource__messageForPeerPaymentAssociatedAccountStateChangedForSecurityReasons__block_invoke_1092;
          v50[3] = &unk_1E59CA870;
          void v50[4] = v32;
          id v51 = v34;
          id v42 = v34;
          [(PKDashboardPassMessage *)v35 setActionOnButtonPress:v50];
          [v7 addObject:v35];
        }
        uint64_t v30 = [v45 countByEnumeratingWithState:&v52 objects:v68 count:16];
      }
      while (v30);
    }

    if ([v7 count]) {
      id v4 = (void *)[v7 copy];
    }
    else {
      id v4 = 0;
    }
LABEL_42:

    goto LABEL_43;
  }
  id v4 = 0;
LABEL_43:

LABEL_5:

  return v4;
}

void __105__PKDashboardPaymentPassDataSource__messageForPeerPaymentAssociatedAccountStateChangedForSecurityReasons__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v7 = 138412290;
      uint64_t v8 = v4;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Opening apple cash feature in settings from dashboard for child %@", (uint8_t *)&v7, 0xCu);
    }

    id v5 = PKPeerPaymentGetAppleCashFamilySettingsSensitiveURLForAltDSID();
    id v6 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v6 openSensitiveURL:v5 withOptions:0];
  }
}

void __105__PKDashboardPaymentPassDataSource__messageForPeerPaymentAssociatedAccountStateChangedForSecurityReasons__block_invoke_1092(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v3;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Opening apple cash feature in settings from dashboard for child %@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v4 = PKPeerPaymentGetAppleCashFamilySettingsSensitiveURLForAltDSID();
  id v5 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v5 openSensitiveURL:v4 withOptions:0];
}

- (id)_messageForPeerPaymentAssociatedAccountLockedAccount
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  peerPaymentAccount = self->_peerPaymentAccount;
  if (!peerPaymentAccount
    || ![(PKPeerPaymentAccount *)peerPaymentAccount supportsFamilySharing]
    || [(PKPeerPaymentAccount *)self->_peerPaymentAccount role] == 1)
  {
    uint64_t v4 = 0;
    goto LABEL_5;
  }
  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  int v6 = [(PKFamilyMemberCollection *)self->_familyCollection familyMembersByAltDSID];
  id obj = [v6 allValues];

  uint64_t v7 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v40;
LABEL_10:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v40 != v8) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = *(void **)(*((void *)&v39 + 1) + 8 * v9);
      if ([v10 isMe])
      {
        if (![v10 isOrganizer]) {
          goto LABEL_31;
        }
      }
      if (([v10 isMe] & 1) == 0)
      {
        id v11 = self->_peerPaymentAccount;
        uint64_t v12 = [v10 altDSID];
        uint64_t v13 = [(PKPeerPaymentAccount *)v11 peerPaymentAccountWithAltDSID:v12];

        if (v13 && PKPeerPaymentAccountShouldContactSupport()) {
          [v29 addObject:v10];
        }
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
        if (v7) {
          goto LABEL_10;
        }
        break;
      }
    }
  }

  id obj = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v30 = v29;
  uint64_t v14 = [v30 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v36 != v15) {
          objc_enumerationMutation(v30);
        }
        int v17 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        id v18 = objc_alloc_init(PKDashboardPassMessage);
        id v19 = [v17 firstName];
        id v20 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentDas_17.isa, &stru_1EF1B4C70.isa, v19);
        [(PKDashboardPassMessage *)v18 setTitle:v20];

        char v21 = [v17 firstName];
        id v22 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentDas_18.isa, &stru_1EF1B4C70.isa, v21);
        [(PKDashboardPassMessage *)v18 setMessage:v22];

        id v23 = NSString;
        id v24 = [v17 altDSID];
        id v25 = [v23 stringWithFormat:@"%@-%@", @"peerPaymentAssociatedAccountLocked", v24];

        [(PKDashboardPassMessage *)v18 setIdentifier:v25];
        int v26 = [(PKDashboardPaymentPassDataSource *)self _messageImageWithName:@"MessageAlert" extension:@"pdf"];
        [(PKDashboardPassMessage *)v18 setImage:v26];

        [(PKDashboardPassMessage *)v18 setShowDisclosure:1];
        id v27 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentAcc_9.isa);
        [(PKDashboardPassMessage *)v18 setButtonTitle:v27];

        unint64_t v28 = [MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForPass:self->_pass];
        [(PKDashboardPassMessage *)v18 setAnalyticsReporterSubject:v28];

        objc_initWeak(&location, self);
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __88__PKDashboardPaymentPassDataSource__messageForPeerPaymentAssociatedAccountLockedAccount__block_invoke;
        v32[3] = &unk_1E59CA7F8;
        objc_copyWeak(&v33, &location);
        [(PKDashboardPassMessage *)v18 setActionOnButtonPress:v32];
        [obj addObject:v18];
        objc_destroyWeak(&v33);
        objc_destroyWeak(&location);
      }
      uint64_t v14 = [v30 countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v14);
  }

  if (![obj count])
  {
LABEL_31:
    uint64_t v4 = 0;
    goto LABEL_32;
  }
  uint64_t v4 = (void *)[obj copy];
LABEL_32:

LABEL_5:

  return v4;
}

void __88__PKDashboardPaymentPassDataSource__messageForPeerPaymentAssociatedAccountLockedAccount__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _peerPaymentResolutionTappedWithResolution:3];
    id WeakRetained = v2;
  }
}

- (id)_messageForPeerPaymentAssociatedAccountPending
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  peerPaymentAccount = self->_peerPaymentAccount;
  if (peerPaymentAccount
    && [(PKPeerPaymentAccount *)peerPaymentAccount supportsFamilySharing]
    && [(PKPeerPaymentAccount *)self->_peerPaymentAccount role] != 1)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v4 = [(PKFamilyMemberCollection *)self->_familyCollection familyMembersByAltDSID];
    id v5 = [v4 allValues];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v30;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v30 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          if ([v9 isMe] && !objc_msgSend(v9, "isOrganizer"))
          {

            goto LABEL_18;
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    uint64_t v23 = 0;
    id v24 = &v23;
    uint64_t v25 = 0x3032000000;
    int v26 = __Block_byref_object_copy__42;
    id v27 = __Block_byref_object_dispose__42;
    id v28 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v10 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount associatedAccountInformation];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __82__PKDashboardPaymentPassDataSource__messageForPeerPaymentAssociatedAccountPending__block_invoke;
    v22[3] = &unk_1E59D9E58;
    void v22[4] = &v23;
    [v10 enumerateAccountInvitationsUsingBlock:v22];

    if ([(id)v24[5] count])
    {
      id v11 = objc_alloc_init(PKDashboardPassMessage);
      if ([(id)v24[5] count] == 1)
      {
        uint64_t v12 = [(PKFamilyMemberCollection *)self->_familyCollection familyMembersByAltDSID];
        uint64_t v13 = [(id)v24[5] anyObject];
        uint64_t v14 = [v12 objectForKey:v13];
        uint64_t v15 = [v14 firstName];

        if ([v15 length]) {
          PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentDas_19.isa, &stru_1EF1B4C70.isa, v15);
        }
        else {
        int v17 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentDas_20.isa);
        }
      }
      else
      {
        int v17 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentDas_21.isa);
      }
      [(PKDashboardPassMessage *)v11 setTitle:v17];
      id v18 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentDas_22.isa);
      [(PKDashboardPassMessage *)v11 setMessage:v18];

      [(PKDashboardPassMessage *)v11 setIdentifier:@"peerPaymentAssociatedAccountPending"];
      id v19 = [(PKDashboardPaymentPassDataSource *)self _messageImageWithName:@"AppleCashIcon" extension:@"pdf"];
      [(PKDashboardPassMessage *)v11 setImage:v19];

      [(PKDashboardPassMessage *)v11 setShowDisclosure:1];
      id v20 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentDas_23.isa);
      [(PKDashboardPassMessage *)v11 setButtonTitle:v20];

      char v21 = [MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForPass:self->_pass];
      [(PKDashboardPassMessage *)v11 setAnalyticsReporterSubject:v21];

      [(PKDashboardPassMessage *)v11 setActionOnButtonPress:&__block_literal_global_1116];
    }
    else
    {
      id v11 = 0;
    }
    _Block_object_dispose(&v23, 8);
  }
  else
  {
LABEL_18:
    id v11 = 0;
  }

  return v11;
}

void __82__PKDashboardPaymentPassDataSource__messageForPeerPaymentAssociatedAccountPending__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 status] == 1)
  {
    uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v4 = [v5 altDSID];
    [v3 addObject:v4];
  }
}

void __82__PKDashboardPaymentPassDataSource__messageForPeerPaymentAssociatedAccountPending__block_invoke_2()
{
  id v1 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  unint64_t v0 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://support.apple.com/kb/HT211324"];
  [v1 openURL:v0 configuration:0 completionHandler:0];
}

- (void)_messageForPeerPaymentRewardsRedemptionWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (v4)
  {
    id v5 = self->_account;
    uint64_t v6 = [(PKAccount *)v5 creditDetails];
    uint64_t v7 = [v6 rewardsDestination];

    if (v5
      && [(PKAccount *)v5 feature] == 2
      && v7 == 1
      && ((char v8 = PKSharedCacheGetBoolForKey() ^ 1,
           PKSharedCacheGetNumberForKey(),
           uint64_t v9 = objc_claimAutoreleasedReturnValue(),
           uint64_t v10 = [v9 integerValue],
           v9,
           (v8 & 1) != 0)
       || v10 == 1))
    {
      objc_initWeak(&location, self);
      id v11 = [MEMORY[0x1E4F84E00] sharedInstance];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      id v12[2] = __90__PKDashboardPaymentPassDataSource__messageForPeerPaymentRewardsRedemptionWithCompletion___block_invoke;
      v12[3] = &unk_1E59D9ED0;
      objc_copyWeak(&v15, &location);
      uint64_t v13 = v5;
      char v16 = v8;
      BOOL v17 = v10 == 1;
      id v14 = v4;
      [v11 accountWithCompletion:v12];

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
    else
    {
      (*((void (**)(id, void))v4 + 2))(v4, 0);
    }
  }
}

void __90__PKDashboardPaymentPassDataSource__messageForPeerPaymentRewardsRedemptionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = [WeakRetained[95] currentAccountUser];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __90__PKDashboardPaymentPassDataSource__messageForPeerPaymentRewardsRedemptionWithCompletion___block_invoke_2;
    v8[3] = &unk_1E59D9EA8;
    objc_copyWeak(&v11, (id *)(a1 + 48));
    __int16 v12 = *(_WORD *)(a1 + 56);
    id v9 = v3;
    id v10 = *(id *)(a1 + 40);
    +[PKCreditAccountController resolutionToReceiveCashbackForAccount:v6 accountUser:v7 withPeerPaymentAccount:v9 completion:v8];

    objc_destroyWeak(&v11);
  }
}

void __90__PKDashboardPaymentPassDataSource__messageForPeerPaymentRewardsRedemptionWithCompletion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, int a4, uint64_t a5)
{
  id v9 = (id *)(a1 + 48);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v11 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_45;
  }
  switch((unint64_t)a2)
  {
    case 0uLL:
    case 5uLL:
      if (*(unsigned char *)(a1 + 57)) {
        BOOL v12 = a4 == 0;
      }
      else {
        BOOL v12 = 1;
      }
      if (v12) {
        goto LABEL_24;
      }
      uint64_t v13 = PKLocalizedFeatureString();
      id v14 = PKLocalizedFeatureString();
      id v15 = PKLocalizedFeatureString();
      char v16 = 1;
      char v40 = 1;
      uint64_t v17 = 1;
      id v18 = @"rewardsRedepmtionDailyCashDiscovery";
      if (v14) {
        goto LABEL_39;
      }
      goto LABEL_36;
    case 1uLL:
      if (!a5)
      {
        if (a4 && *(unsigned char *)(a1 + 57))
        {
          char v40 = 1;
          goto LABEL_32;
        }
        goto LABEL_33;
      }
      if (a5 == 1)
      {
        if (a4 && *(unsigned char *)(a1 + 57))
        {
          char v40 = 1;
LABEL_32:
          id v14 = PKLocalizedFeatureString();
          goto LABEL_35;
        }
LABEL_33:
        char v40 = 0;
        goto LABEL_34;
      }
      if (a5 != 2) {
        goto LABEL_33;
      }
      char v40 = 0;
      if (*(unsigned char *)(a1 + 56)) {
        goto LABEL_32;
      }
LABEL_34:
      id v14 = 0;
LABEL_35:
      uint64_t v13 = PKLocalizedFeatureString();
      id v15 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentSet_15.isa);
      char v16 = 0;
      uint64_t v17 = 1;
      id v18 = @"rewardsRedepmtionSetUpDailyCash";
      if (v14)
      {
LABEL_39:
        char v39 = v16;
        if (!v11[25])
        {
          uint64_t v21 = [MEMORY[0x1E4F84E10] sharedService];
          id v22 = v11[109];
          v11[109] = (id)v21;

          uint64_t v23 = [PKPeerPaymentAccountResolutionController alloc];
          unsigned int v37 = v17;
          uint64_t v24 = *(void *)(a1 + 32);
          long long v36 = v18;
          id v25 = v11[109];
          long long v38 = v14;
          id v26 = objc_alloc_init(MEMORY[0x1E4F848A0]);
          uint64_t v27 = [(PKPeerPaymentAccountResolutionController *)v23 initWithAccount:v24 webService:v25 context:0 delegate:0 passLibraryDataProvider:v26];
          id v28 = v11[25];
          v11[25] = (id)v27;

          [v11[25] setDelegate:v11];
          long long v29 = [MEMORY[0x1E4F28EB8] defaultCenter];
          uint64_t v30 = *MEMORY[0x1E4F87CC8];
          long long v31 = [v11[109] targetDevice];
          id v18 = v36;
          uint64_t v32 = v30;
          id v14 = v38;
          [v29 addObserver:v11 selector:sel__peerPaymentAccountChanged_ name:v32 object:v31];

          uint64_t v17 = v37;
        }
        id v33 = objc_alloc_init(PKDashboardPassMessage);
        [(PKDashboardPassMessage *)v33 setTitle:v13];
        [(PKDashboardPassMessage *)v33 setMessage:v14];
        [(PKDashboardPassMessage *)v33 setIdentifier:v18];
        [(PKDashboardPassMessage *)v33 setReportToAnalytics:v17];
        uint64_t v34 = [v11 _messageImageWithName:@"CashBackIcon" extension:@"pdf"];
        [(PKDashboardPassMessage *)v33 setImage:v34];

        [(PKDashboardPassMessage *)v33 setShowDisclosure:1];
        long long v35 = [MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForPass:v11[110]];
        [(PKDashboardPassMessage *)v33 setAnalyticsReporterSubject:v35];

        if (v15)
        {
          [(PKDashboardPassMessage *)v33 setButtonTitle:v15];
          v44[0] = MEMORY[0x1E4F143A8];
          v44[1] = 3221225472;
          v44[2] = __90__PKDashboardPaymentPassDataSource__messageForPeerPaymentRewardsRedemptionWithCompletion___block_invoke_3;
          v44[3] = &unk_1E59D9E80;
          objc_copyWeak(v46, v9);
          char v47 = v40;
          char v48 = v39;
          id v45 = *(id *)(a1 + 32);
          v46[1] = a2;
          [(PKDashboardPassMessage *)v33 setActionOnButtonPress:v44];

          objc_destroyWeak(v46);
        }
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __90__PKDashboardPaymentPassDataSource__messageForPeerPaymentRewardsRedemptionWithCompletion___block_invoke_4;
        v41[3] = &unk_1E59CB0B0;
        objc_copyWeak(&v42, v9);
        char v43 = v40;
        [(PKDashboardPassMessage *)v33 setActionOnDismiss:v41];
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        objc_destroyWeak(&v42);
      }
      else
      {
LABEL_36:
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }

LABEL_45:
      return;
    case 2uLL:
      if (!*(unsigned char *)(a1 + 56)) {
        goto LABEL_24;
      }
      uint64_t v13 = PKLocalizedFeatureString();
      id v14 = PKLocalizedFeatureString();
      id v15 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentAcc_7.isa);
      char v40 = 0;
      char v16 = 0;
      uint64_t v17 = 1;
      id v18 = @"rewardsRedemptionIDVerification";
      if (!v14) {
        goto LABEL_36;
      }
      goto LABEL_39;
    case 3uLL:
      if (!*(unsigned char *)(a1 + 56)) {
        goto LABEL_24;
      }
      uint64_t v13 = PKLocalizedFeatureString();
      id v14 = PKLocalizedFeatureString();
      uint64_t v19 = PKLocalizedFeatureString();
      goto LABEL_23;
    case 4uLL:
      if (!*(unsigned char *)(a1 + 56)) {
        goto LABEL_24;
      }
      uint64_t v20 = [WeakRetained[23] role];
      if (v20 == 1)
      {
        uint64_t v13 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentDas_4.isa);
        id v14 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentDas_5.isa);
        char v40 = 0;
        char v16 = 0;
        id v15 = 0;
      }
      else
      {
        if (v20)
        {
LABEL_24:
          id v15 = 0;
          uint64_t v13 = 0;
          goto LABEL_36;
        }
        uint64_t v13 = PKLocalizedFeatureString();
        id v14 = PKLocalizedFeatureString();
        uint64_t v19 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentAcc_14.isa);
LABEL_23:
        id v15 = (void *)v19;
        char v40 = 0;
        char v16 = 0;
      }
      uint64_t v17 = 0;
      id v18 = @"fixRewards";
      if (v14) {
        goto LABEL_39;
      }
      goto LABEL_36;
    default:
      goto LABEL_24;
  }
}

void __90__PKDashboardPaymentPassDataSource__messageForPeerPaymentRewardsRedemptionWithCompletion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    if (*(unsigned char *)(a1 + 56)) {
      PKSharedCacheSetObjectForKey();
    }
    else {
      PKSharedCacheSetBoolForKey();
    }
    if (*(unsigned char *)(a1 + 57))
    {
      id v3 = [*(id *)(a1 + 32) associatedPassUniqueID];
      [v4 _presentPassWithPassUniqueIdentifier:v3];
    }
    else
    {
      [v4 _peerPaymentResolutionTappedWithResolution:*(void *)(a1 + 48)];
    }
    id WeakRetained = v4;
  }
}

void __90__PKDashboardPaymentPassDataSource__messageForPeerPaymentRewardsRedemptionWithCompletion___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    if (*(unsigned char *)(a1 + 40)) {
      PKSharedCacheSetObjectForKey();
    }
    else {
      PKSharedCacheSetBoolForKey();
    }
    [v3 reloadMessages];
    id WeakRetained = v3;
  }
}

- (void)_messageForPaymentFailedWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (v4)
  {
    id v5 = self->_account;
    uint64_t v6 = v5;
    if (v5 && [(PKAccount *)v5 feature] == 2 && PKSharedCacheGetBoolForKey())
    {
      objc_initWeak(&location, self);
      accountService = self->_accountService;
      char v8 = [(PKAccount *)v6 accountIdentifier];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __75__PKDashboardPaymentPassDataSource__messageForPaymentFailedWithCompletion___block_invoke;
      v9[3] = &unk_1E59D9EF8;
      objc_copyWeak(&v12, &location);
      id v10 = v6;
      id v11 = v4;
      [(PKAccountService *)accountService eventsForAccountIdentifier:v8 types:&unk_1EF2BA188 startDate:0 endDate:0 orderedByDate:1 limit:1 completion:v9];

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
    else
    {
      (*((void (**)(id, void))v4 + 2))(v4, 0);
    }
  }
}

void __75__PKDashboardPaymentPassDataSource__messageForPaymentFailedWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    char v8 = [v5 firstObject];
    id v9 = [v8 items];
    id v10 = [v9 anyObject];

    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v10 state] == 4)
    {
      [*(id *)(a1 + 32) feature];
      id v11 = objc_alloc_init(PKDashboardPassMessage);
      [(PKDashboardPassMessage *)v11 setIdentifier:@"paymentFailed"];
      id v12 = [MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForPass:WeakRetained[110]];
      [(PKDashboardPassMessage *)v11 setAnalyticsReporterSubject:v12];

      uint64_t v13 = PKLocalizedFeatureString();
      [(PKDashboardPassMessage *)v11 setTitle:v13];

      id v14 = &unk_1A0442000;
      if ([v10 statusCode] == 1)
      {
        id v15 = [v10 currencyAmount];
        uint64_t v23 = v15;
        if (v15)
        {
          char v16 = [v15 minimalFormattedStringValue];
          uint64_t v17 = PKLocalizedFeatureString();
          -[PKDashboardPassMessage setMessage:](v11, "setMessage:", v17, v16, v23);

          id v14 = (void *)&unk_1A0442000;
        }
        else
        {
          char v16 = PKLocalizedFeatureString();
          [(PKDashboardPassMessage *)v11 setMessage:v16];
        }

        uint64_t v21 = PKLocalizedFeatureString();
        [(PKDashboardPassMessage *)v11 setButtonTitle:v21];

        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = v14[313];
        v28[2] = __75__PKDashboardPaymentPassDataSource__messageForPaymentFailedWithCompletion___block_invoke_2;
        v28[3] = &unk_1E59CB010;
        objc_copyWeak(&v30, (id *)(a1 + 48));
        id v29 = *(id *)(a1 + 32);
        [(PKDashboardPassMessage *)v11 setActionOnButtonPress:v28];

        objc_destroyWeak(&v30);
        uint64_t v20 = @"MessageAlert";
      }
      else
      {
        id v18 = PKLocalizedFeatureString();
        [(PKDashboardPassMessage *)v11 setMessage:v18];

        id v14 = &unk_1A0442000;
        uint64_t v19 = PKLocalizedFeatureString();
        [(PKDashboardPassMessage *)v11 setButtonTitle:v19];

        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        void v26[2] = __75__PKDashboardPaymentPassDataSource__messageForPaymentFailedWithCompletion___block_invoke_4;
        v26[3] = &unk_1E59CA7F8;
        objc_copyWeak(&v27, (id *)(a1 + 48));
        [(PKDashboardPassMessage *)v11 setActionOnButtonPress:v26];
        objc_destroyWeak(&v27);
        uint64_t v20 = @"Bank";
      }
      id v22 = [WeakRetained _messageImageWithName:v20 extension:@"pdf"];
      [(PKDashboardPassMessage *)v11 setImage:v22];

      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = v14[313];
      void v24[2] = __75__PKDashboardPaymentPassDataSource__messageForPaymentFailedWithCompletion___block_invoke_5;
      v24[3] = &unk_1E59CA7F8;
      objc_copyWeak(&v25, (id *)(a1 + 48));
      [(PKDashboardPassMessage *)v11 setActionOnDismiss:v24];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      objc_destroyWeak(&v25);
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

void __75__PKDashboardPaymentPassDataSource__messageForPaymentFailedWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = (void *)WeakRetained[65];
    if (!v4)
    {
      id v5 = [[PKAccountServiceAccountResolutionController alloc] initWithAccount:*(void *)(a1 + 32) accountUserCollection:*((void *)v3 + 95) transactionSourceCollection:*((void *)v3 + 6)];
      id v6 = (void *)*((void *)v3 + 65);
      *((void *)v3 + 65) = v5;

      [*((id *)v3 + 65) setDelegate:v3];
      id v4 = (void *)*((void *)v3 + 65);
    }
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    id v7[2] = __75__PKDashboardPaymentPassDataSource__messageForPaymentFailedWithCompletion___block_invoke_3;
    v7[3] = &unk_1E59CB6D8;
    void v7[4] = v3;
    [v4 presentFlowForAccountResolution:1 configuration:0 completion:v7];
  }
}

uint64_t __75__PKDashboardPaymentPassDataSource__messageForPaymentFailedWithCompletion___block_invoke_3(uint64_t a1)
{
  PKSharedCacheSetBoolForKey();
  id v2 = *(void **)(a1 + 32);

  return [v2 reloadMessages];
}

void __75__PKDashboardPaymentPassDataSource__messageForPaymentFailedWithCompletion___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _presentPassDetailsWithAction:2];
    PKSharedCacheSetBoolForKey();
    [v2 reloadMessages];
    id WeakRetained = v2;
  }
}

void __75__PKDashboardPaymentPassDataSource__messageForPaymentFailedWithCompletion___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    PKSharedCacheSetBoolForKey();
    [WeakRetained reloadMessages];
  }
}

- (void)_messageForInterestChargeWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (v4)
  {
    id v5 = self->_account;
    uint64_t v6 = [(PKAccount *)v5 feature];
    uint64_t v7 = PKSharedCacheGetDateForKey();
    if (v5
      && v6 == 2
      && ([(PKAccount *)v5 hideInterestChargeClarity] & 1) == 0
      && ([MEMORY[0x1E4F1C9C8] now],
          char v8 = objc_claimAutoreleasedReturnValue(),
          uint64_t v9 = [v7 compare:v8],
          v8,
          v9 != 1))
    {
      id v10 = [(PKAccount *)v5 creditDetails];
      id v11 = [v10 accountSummary];
      id v12 = [v11 balanceSummary];

      uint64_t v13 = [v12 openingDate];
      id v14 = [v13 dateByAddingTimeInterval:-60.0];

      id v15 = [v12 closingDate];
      v41[0] = 0;
      v41[1] = v41;
      v41[2] = 0x3032000000;
      v41[3] = __Block_byref_object_copy__42;
      void v41[4] = __Block_byref_object_dispose__42;
      id v42 = 0;
      v39[0] = 0;
      v39[1] = v39;
      v39[2] = 0x3032000000;
      v39[3] = __Block_byref_object_copy__42;
      void v39[4] = __Block_byref_object_dispose__42;
      id v40 = 0;
      id v16 = objc_alloc_init(MEMORY[0x1E4F84518]);
      objc_initWeak(&location, self);
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __76__PKDashboardPaymentPassDataSource__messageForInterestChargeWithCompletion___block_invoke;
      v33[3] = &unk_1E59D1548;
      objc_copyWeak(&v37, &location);
      id v17 = v14;
      id v34 = v17;
      id v18 = v15;
      id v35 = v18;
      long long v36 = v41;
      [v16 addOperation:v33];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __76__PKDashboardPaymentPassDataSource__messageForInterestChargeWithCompletion___block_invoke_2;
      v28[3] = &unk_1E59D7960;
      objc_copyWeak(&v32, &location);
      id v30 = v41;
      uint64_t v19 = v5;
      id v29 = v19;
      long long v31 = v39;
      [v16 addOperation:v28];
      uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __76__PKDashboardPaymentPassDataSource__messageForInterestChargeWithCompletion___block_invoke_6;
      v22[3] = &unk_1E59D9F68;
      objc_copyWeak(&v27, &location);
      id v25 = v41;
      id v24 = v4;
      uint64_t v23 = v19;
      id v26 = v39;
      id v21 = (id)[v16 evaluateWithInput:v20 completion:v22];

      objc_destroyWeak(&v27);
      objc_destroyWeak(&v32);

      objc_destroyWeak(&v37);
      objc_destroyWeak(&location);

      _Block_object_dispose(v39, 8);
      _Block_object_dispose(v41, 8);
    }
    else
    {
      (*((void (**)(id, void))v4 + 2))(v4, 0);
    }
  }
}

void __76__PKDashboardPaymentPassDataSource__messageForInterestChargeWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F84D28]);
    id v10 = [WeakRetained[6] transactionSourceIdentifiers];
    [v9 setTransactionSourceIdentifiers:v10];

    [v9 setTransactionTypes:&unk_1EF2BA1A0];
    [v9 setDateOrder:1];
    [v9 setStartDate:*(void *)(a1 + 32)];
    [v9 setEndDate:*(void *)(a1 + 40)];
    [v9 setLimit:1];
    id v11 = objc_alloc_init(MEMORY[0x1E4F84C38]);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    id v12[2] = __76__PKDashboardPaymentPassDataSource__messageForInterestChargeWithCompletion___block_invoke_1185;
    v12[3] = &unk_1E59CC850;
    uint64_t v15 = *(void *)(a1 + 48);
    id v14 = v7;
    id v13 = v6;
    [v11 transactionsForRequest:v9 completion:v12];
  }
}

uint64_t __76__PKDashboardPaymentPassDataSource__messageForInterestChargeWithCompletion___block_invoke_1185(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 firstObject];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v6();
}

void __76__PKDashboardPaymentPassDataSource__messageForInterestChargeWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v9 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) associatedStatementIdentifiers];
  id v10 = v9;
  if (WeakRetained && [v9 count])
  {
    id v11 = (void *)WeakRetained[115];
    id v12 = [MEMORY[0x1E4F1CAD0] setWithArray:v10];
    id v13 = [*(id *)(a1 + 32) accountIdentifier];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __76__PKDashboardPaymentPassDataSource__messageForInterestChargeWithCompletion___block_invoke_3;
    id v14[3] = &unk_1E59D7470;
    uint64_t v17 = *(void *)(a1 + 48);
    id v16 = v7;
    id v15 = v6;
    [v11 creditStatementsForStatementIdentifiers:v12 accountIdentifier:v13 completion:v14];
  }
  else
  {
    (*((void (**)(id, id, void))v7 + 2))(v7, v6, 0);
  }
}

void __76__PKDashboardPaymentPassDataSource__messageForInterestChargeWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 allObjects];
  uint64_t v4 = objc_msgSend(v3, "pk_objectsPassingTest:", &__block_literal_global_1189);

  id v5 = [v4 sortedArrayUsingComparator:&__block_literal_global_1192];

  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

BOOL __76__PKDashboardPaymentPassDataSource__messageForInterestChargeWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 openingDate];
  if (v3)
  {
    uint64_t v4 = [v2 closingDate];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

BOOL __76__PKDashboardPaymentPassDataSource__messageForInterestChargeWithCompletion___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  BOOL v5 = [a2 openingDate];
  uint64_t v6 = [v4 openingDate];

  BOOL v7 = [v5 compare:v6] == 1;
  return v7;
}

void __76__PKDashboardPaymentPassDataSource__messageForInterestChargeWithCompletion___block_invoke_6(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__PKDashboardPaymentPassDataSource__messageForInterestChargeWithCompletion___block_invoke_7;
  block[3] = &unk_1E59D9F40;
  objc_copyWeak(&v10, (id *)(a1 + 64));
  long long v5 = *(_OWORD *)(a1 + 40);
  id v2 = (id)v5;
  long long v8 = v5;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 56);
  id v7 = v3;
  uint64_t v9 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v10);
}

void __76__PKDashboardPaymentPassDataSource__messageForInterestChargeWithCompletion___block_invoke_7(uint64_t a1)
{
  id v2 = (id *)(a1 + 64);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained && *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v4 = objc_alloc_init(PKDashboardPassMessage);
    [(PKDashboardPassMessage *)v4 setIdentifier:@"interestCharged"];
    long long v5 = PKDynamicLocalizedAppleCardString(&cfstr_AccountService_260.isa);
    [(PKDashboardPassMessage *)v4 setTitle:v5];

    uint64_t v6 = [WeakRetained _messageImageWithName:@"InterestIcon" extension:@"pdf"];
    [(PKDashboardPassMessage *)v4 setImage:v6];

    id v7 = PKDynamicLocalizedAppleCardString(&cfstr_AccountService_261.isa);
    [(PKDashboardPassMessage *)v4 setButtonTitle:v7];

    [(PKDashboardPassMessage *)v4 setShowDisclosure:1];
    long long v8 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) currencyAmount];
    uint64_t v9 = [v8 formattedStringValue];

    long long v54 = (void *)v9;
    long long v53 = PKDynamicLocalizedAppleCardString(&cfstr_AccountService_262.isa, &cfstr_1_1.isa, v9);
    id v10 = [*(id *)(a1 + 32) creditDetails];
    uint64_t v11 = [v10 productTimeZone];

    id v12 = objc_alloc(MEMORY[0x1E4F1C9A8]);
    id v13 = (void *)[v12 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
    long long v52 = (void *)v11;
    [v13 setTimeZone:v11];
    id v14 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [v14 setMonth:2];
    id v15 = [*(id *)(a1 + 32) creditDetails];
    uint64_t v16 = [v15 mergeDate];

    uint64_t v17 = [v13 dateByAddingComponents:v14 toDate:v16 options:0];
    char v48 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) transactionDate];
    id v49 = (void *)v17;
    uint64_t v50 = (void *)v16;
    int IsBetweenDates = PKDateIsBetweenDates();
    char v19 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) interestReassessment];
    uint64_t v20 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) associatedStatementIdentifiers];
    uint64_t v21 = [v20 count];

    id v51 = v14;
    if ((v19 & 1) == 0 && IsBetweenDates)
    {
      id v22 = PKDynamicLocalizedAppleCardString(&cfstr_AccountService_263.isa, &cfstr_1_1.isa, v54);
      uint64_t v23 = v52;
      id v24 = v53;
LABEL_20:
      id v37 = v13;

      goto LABEL_21;
    }
    if (v21 < 1) {
      char v25 = 1;
    }
    else {
      char v25 = v19;
    }
    if ((v25 & 1) != 0 || [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count] != v21)
    {
      id v37 = v13;
      uint64_t v23 = v52;
      id v22 = v53;
LABEL_21:
      [(PKDashboardPassMessage *)v4 setMessage:v22];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __76__PKDashboardPaymentPassDataSource__messageForInterestChargeWithCompletion___block_invoke_8;
      aBlock[3] = &unk_1E59CB010;
      objc_copyWeak(v62, v2);
      id v41 = v23;
      id v61 = v41;
      id v42 = _Block_copy(aBlock);
      [(PKDashboardPassMessage *)v4 setActionOnDismiss:v42];
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __76__PKDashboardPaymentPassDataSource__messageForInterestChargeWithCompletion___block_invoke_9;
      v55[3] = &unk_1E59D1F40;
      objc_copyWeak(&v59, v2);
      uint64_t v58 = *(void *)(a1 + 48);
      id v56 = *(id *)(a1 + 32);
      id v43 = v42;
      id v57 = v43;
      [(PKDashboardPassMessage *)v4 setActionOnButtonPress:v55];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

      objc_destroyWeak(&v59);
      objc_destroyWeak(v62);

      goto LABEL_22;
    }
    id v26 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) objectAtIndexedSubscript:0];
    id v27 = [v26 openingDate];
    uint64_t v46 = v26;
    id v28 = [v26 closingDate];
    uint64_t v29 = PKDatesMidpoint();

    char v47 = (void *)v29;
    id v30 = [WeakRetained[43] stringFromDate:v29];
    if (v21 == 1)
    {
      id v38 = WeakRetained[44];
      id v24 = v46;
      char v39 = [v46 paymentDueDate];
      uint64_t v40 = [v38 stringFromDate:v39];

      long long v36 = (void *)v40;
      id v45 = v30;
      id v22 = PKDynamicLocalizedAppleCardString(&cfstr_AccountService_265.isa, &cfstr_123.isa, v54, v30, v40);
      id v34 = v53;
    }
    else
    {
      if (v21 != 2)
      {
        uint64_t v23 = v52;
        id v22 = v53;
        id v24 = v46;
        goto LABEL_19;
      }
      id v44 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) objectAtIndexedSubscript:1];
      long long v31 = [v44 openingDate];
      id v32 = [v44 closingDate];
      PKDatesMidpoint();
      id v34 = v33 = v30;

      id v35 = [WeakRetained[43] stringFromDate:v34];
      id v45 = v33;
      id v22 = PKDynamicLocalizedAppleCardString(&cfstr_AccountService_264.isa, &cfstr_123.isa, v54, v33, v35);

      long long v36 = v44;
      id v24 = v46;
    }

    uint64_t v23 = v52;
    id v30 = v45;
LABEL_19:

    goto LABEL_20;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_22:
}

void __76__PKDashboardPaymentPassDataSource__messageForInterestChargeWithCompletion___block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v1 = [MEMORY[0x1E4F1C9C8] now];
    id v2 = PKEndOfNextMonthAndTimeZone();

    PKSharedCacheSetObjectForKey();
    [WeakRetained reloadMessages];
  }
}

void __76__PKDashboardPaymentPassDataSource__messageForInterestChargeWithCompletion___block_invoke_9(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    LOBYTE(v5) = 1;
    id v2 = [[PKPaymentTransactionDetailViewController alloc] initWithTransaction:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) transactionSourceCollection:*((void *)WeakRetained + 6) familyCollection:*((void *)WeakRetained + 98) account:*(void *)(a1 + 32) accountUserCollection:*((void *)WeakRetained + 95) bankConnectInstitution:0 physicalCards:*((void *)WeakRetained + 97) contactResolver:0 peerPaymentWebService:*((void *)WeakRetained + 109) paymentServiceDataProvider:*((void *)WeakRetained + 32) detailViewStyle:0 allowTransactionLinks:v5];
    id v3 = objc_msgSend(*((id *)WeakRetained + 1), "pkui_viewControllerFromResponderChain");
    uint64_t v4 = [v3 navigationController];
    [v4 pushViewController:v2 animated:1];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_messageForEnableNotificationsWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, void))a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (v4)
  {
    if (PKSharedCacheGetBoolForKey()
      || (account = self->_account) != 0
      && [(PKAccount *)account feature] == 3
      && [(PKAccount *)self->_account state] == 3)
    {
      v4[2](v4, 0);
    }
    else
    {
      objc_initWeak(&location, self);
      uint64_t v6 = (void *)[(PKAccount *)self->_account feature];
      id v7 = [MEMORY[0x1E4F850F8] sharedInstance];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __81__PKDashboardPaymentPassDataSource__messageForEnableNotificationsWithCompletion___block_invoke;
      v9[3] = &unk_1E59D9FB8;
      objc_copyWeak(v11, &location);
      long long v8 = v4;
      v11[1] = v6;
      void v9[4] = self;
      id v10 = v8;
      [v7 authorizationStatusWithCompletion:v9];

      objc_destroyWeak(v11);
      objc_destroyWeak(&location);
    }
  }
}

void __81__PKDashboardPaymentPassDataSource__messageForEnableNotificationsWithCompletion___block_invoke(uint64_t a1, void *a2, char a3)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __81__PKDashboardPaymentPassDataSource__messageForEnableNotificationsWithCompletion___block_invoke_2;
  v8[3] = &unk_1E59D9F90;
  objc_copyWeak(v10, (id *)(a1 + 48));
  id v6 = *(id *)(a1 + 40);
  char v11 = a3;
  id v7 = *(void **)(a1 + 56);
  v10[1] = a2;
  id v10[2] = v7;
  void v8[4] = *(void *)(a1 + 32);
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v8);

  objc_destroyWeak(v10);
}

void __81__PKDashboardPaymentPassDataSource__messageForEnableNotificationsWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (*(unsigned char *)(a1 + 72) && *(void *)(a1 + 56) == 1)
    {
      uint64_t v5 = objc_alloc_init(PKDashboardPassMessage);
      [(PKDashboardPassMessage *)v5 setIdentifier:@"enableNotifications"];
      [(PKDashboardPassMessage *)v5 setReportToAnalytics:1];
      id v6 = [MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForPass:WeakRetained[110]];
      [(PKDashboardPassMessage *)v5 setAnalyticsReporterSubject:v6];

      id v7 = PKLocalizedString(&cfstr_NotificationsD.isa);
      long long v8 = PKLocalizedString(&cfstr_NotificationsD_0.isa);
      id v9 = PKLocalizedString(&cfstr_NotificationsD_1.isa);
      id v10 = PKLocalizedFeatureStringWithDefaultValue();
      char v11 = PKLocalizedFeatureStringWithDefaultValue();
      id v12 = PKLocalizedFeatureStringWithDefaultValue();
      if ([WeakRetained[110] isIdentityPass])
      {
        uint64_t v13 = PKLocalizedIdentityString(&cfstr_AccountDashboa_99.isa);

        uint64_t v14 = PKLocalizedIdentityString(&cfstr_AccountDashboa_100.isa);

        char v11 = (void *)v14;
        id v10 = (void *)v13;
      }
      [(PKDashboardPassMessage *)v5 setTitle:v10];
      [(PKDashboardPassMessage *)v5 setMessage:v11];
      [(PKDashboardPassMessage *)v5 setButtonTitle:v12];
      if ([WeakRetained[110] isAppleCardPass]) {
        id v15 = @"Broadway-45pt";
      }
      else {
        id v15 = @"Category_bell_45pt";
      }
      uint64_t v16 = [WeakRetained _messageImageWithName:v15 extension:@"png"];
      [(PKDashboardPassMessage *)v5 setImage:v16];

      [(PKDashboardPassMessage *)v5 setActionOnButtonPress:&__block_literal_global_1252];
      objc_initWeak(&location, *(id *)(a1 + 32));
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      id v17[2] = __81__PKDashboardPaymentPassDataSource__messageForEnableNotificationsWithCompletion___block_invoke_4;
      id v17[3] = &unk_1E59CA7F8;
      objc_copyWeak(&v18, &location);
      [(PKDashboardPassMessage *)v5 setActionOnDismiss:v17];
      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
    else
    {
      uint64_t v5 = 0;
    }
    (*(void (**)(void, PKDashboardPassMessage *, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v5, v2, v3);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __81__PKDashboardPaymentPassDataSource__messageForEnableNotificationsWithCompletion___block_invoke_3()
{
  unint64_t v0 = (void *)MEMORY[0x1E4F1CB10];
  id v1 = [NSString stringWithFormat:@"prefs:root=NOTIFICATIONS_ID&path=%@", *MEMORY[0x1E4F87D30]];
  id v3 = [v0 URLWithString:v1];

  uint64_t v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v2 openSensitiveURL:v3 withOptions:0];
}

void __81__PKDashboardPaymentPassDataSource__messageForEnableNotificationsWithCompletion___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    PKSharedCacheSetBoolForKey();
    [WeakRetained reloadMessages];
  }
}

- (id)_messagesForPhysicalCardExpiration
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (self->_account && self->_physicalCardsLoaded)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    objc_initWeak(location, self);
    uint64_t v4 = [(PKPhysicalCardController *)self->_physicalCardController primaryPhysicalCard];
    uint64_t v5 = [(PKPhysicalCardController *)self->_physicalCardController expiredPhysicalCard];
    if ([(PKPhysicalCardController *)self->_physicalCardController hasExpiredPhysicalCardOnly])
    {
      id v6 = v5;
    }
    else
    {
      id v6 = v4;
    }
    id v7 = v6;
    long long v8 = [(PKAccount *)self->_account accountIdentifier];
    id v9 = [v7 identifier];
    id v10 = PKAppleCardPhysicalCardExpiredMessagingStartDate();

    char v11 = [(PKAccount *)self->_account accountIdentifier];
    id v12 = [v4 identifier];
    uint64_t v46 = PKAppleCardPhysicalCardExpiringSoonMessagingStartDate();

    BOOL v13 = [(PKPhysicalCardController *)self->_physicalCardController canReplacePhysicalCard];
    if (v7) {
      BOOL v14 = v13;
    }
    else {
      BOOL v14 = 0;
    }
    if (v14 && v10)
    {
      id v15 = [MEMORY[0x1E4F1C9C8] now];
      [v15 timeIntervalSinceDate:v10];
      if (v16 <= 0.0)
      {
      }
      else
      {
        uint64_t v17 = [(PKAccount *)self->_account accountIdentifier];
        id v18 = [v7 identifier];
        char HasDismissedPhysicalCardExpiredMessage = PKAppleCardHasDismissedPhysicalCardExpiredMessage();

        if ((HasDismissedPhysicalCardExpiredMessage & 1) == 0)
        {
          uint64_t v20 = objc_alloc_init(PKDashboardPassMessage);
          uint64_t v21 = PKLocalizedFeatureString();
          [(PKDashboardPassMessage *)v20 setTitle:v21];

          id v22 = PKLocalizedFeatureString();
          [(PKDashboardPassMessage *)v20 setMessage:v22];

          uint64_t v23 = [(PKDashboardPaymentPassDataSource *)self _messageImageWithName:@"MessageAlert" extension:@"pdf"];
          [(PKDashboardPassMessage *)v20 setImage:v23];

          id v24 = PKLocalizedFeatureString();
          [(PKDashboardPassMessage *)v20 setButtonTitle:v24];

          v56[0] = MEMORY[0x1E4F143A8];
          v56[1] = 3221225472;
          v56[2] = __70__PKDashboardPaymentPassDataSource__messagesForPhysicalCardExpiration__block_invoke;
          v56[3] = &unk_1E59CB010;
          id v45 = &v58;
          objc_copyWeak(&v58, location);
          id v57 = v4;
          [(PKDashboardPassMessage *)v20 setActionOnButtonPress:v56];
          v53[0] = MEMORY[0x1E4F143A8];
          v53[1] = 3221225472;
          v53[2] = __70__PKDashboardPaymentPassDataSource__messagesForPhysicalCardExpiration__block_invoke_3;
          v53[3] = &unk_1E59CB010;
          char v25 = &v55;
          objc_copyWeak(&v55, location);
          id v54 = v7;
          [(PKDashboardPassMessage *)v20 setActionOnDismiss:v53];
          [(PKDashboardPassMessage *)v20 setShowDisclosure:1];
          [(PKDashboardPassMessage *)v20 setIdentifier:@"physicalCardExpired"];
          [(PKDashboardPassMessage *)v20 setReportToAnalytics:1];
          id v26 = [MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForPass:self->_pass];
          [(PKDashboardPassMessage *)v20 setAnalyticsReporterSubject:v26];

          [v3 addObject:v20];
          id v27 = &v57;
          id v28 = &v54;
          goto LABEL_24;
        }
      }
    }
    if ([(PKPhysicalCardController *)self->_physicalCardController hasExpiredPhysicalCardOnly])
    {
      goto LABEL_26;
    }
    BOOL v30 = [(PKPhysicalCardController *)self->_physicalCardController canReplacePhysicalCard];
    if (!v46 || !v30) {
      goto LABEL_26;
    }
    uint64_t v20 = [MEMORY[0x1E4F1C9C8] now];
    [(PKDashboardPassMessage *)v20 timeIntervalSinceDate:v46];
    if (v32 <= 0.0) {
      goto LABEL_25;
    }
    id v33 = [(PKAccount *)self->_account accountIdentifier];
    id v34 = [v4 identifier];
    char HasDismissedPhysicalCardExpiringSoonMessage = PKAppleCardHasDismissedPhysicalCardExpiringSoonMessage();

    if (HasDismissedPhysicalCardExpiringSoonMessage)
    {
LABEL_26:
      if ([v3 count]) {
        uint64_t v29 = (void *)[v3 copy];
      }
      else {
        uint64_t v29 = 0;
      }

      objc_destroyWeak(location);
      goto LABEL_30;
    }
    uint64_t v20 = objc_alloc_init(PKDashboardPassMessage);
    long long v36 = [(PKPhysicalCardController *)self->_physicalCardController primaryPhysicalCardExpirationDate];
    id v37 = PKMediumDayAndMonthStringFromDate();
    id v38 = PKLocalizedFeatureString();
    -[PKDashboardPassMessage setTitle:](v20, "setTitle:", v38, v37);

    char v39 = PKLocalizedFeatureString();
    [(PKDashboardPassMessage *)v20 setMessage:v39];

    uint64_t v40 = [(PKDashboardPaymentPassDataSource *)self _messageImageWithName:@"MessageAlert" extension:@"pdf"];
    [(PKDashboardPassMessage *)v20 setImage:v40];

    id v41 = PKLocalizedFeatureString();
    [(PKDashboardPassMessage *)v20 setButtonTitle:v41];

    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    void v50[2] = __70__PKDashboardPaymentPassDataSource__messagesForPhysicalCardExpiration__block_invoke_4;
    v50[3] = &unk_1E59CB010;
    id v45 = &v52;
    objc_copyWeak(&v52, location);
    id v42 = v4;
    id v51 = v42;
    [(PKDashboardPassMessage *)v20 setActionOnButtonPress:v50];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __70__PKDashboardPaymentPassDataSource__messagesForPhysicalCardExpiration__block_invoke_6;
    v47[3] = &unk_1E59CB010;
    char v25 = &v49;
    objc_copyWeak(&v49, location);
    id v48 = v42;
    [(PKDashboardPassMessage *)v20 setActionOnDismiss:v47];
    [(PKDashboardPassMessage *)v20 setShowDisclosure:1];
    [(PKDashboardPassMessage *)v20 setIdentifier:@"physicalCardExpiringSoon"];
    [(PKDashboardPassMessage *)v20 setReportToAnalytics:1];
    id v43 = [MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForPass:self->_pass];
    [(PKDashboardPassMessage *)v20 setAnalyticsReporterSubject:v43];

    [v3 addObject:v20];
    id v27 = &v51;
    id v28 = &v48;
LABEL_24:

    objc_destroyWeak(v25);
    objc_destroyWeak(v45);
LABEL_25:

    goto LABEL_26;
  }
  uint64_t v29 = 0;
LABEL_30:

  return v29;
}

void __70__PKDashboardPaymentPassDataSource__messagesForPhysicalCardExpiration__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = (void *)*((void *)WeakRetained + 50);
    uint64_t v5 = *(void *)(a1 + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    void v6[2] = __70__PKDashboardPaymentPassDataSource__messagesForPhysicalCardExpiration__block_invoke_2;
    v6[3] = &unk_1E59D2D18;
    void v6[4] = v3;
    [v4 replaceFlowViewControllerForReason:1 content:0 currentPhysicalCard:v5 completion:v6];
  }
}

void __70__PKDashboardPaymentPassDataSource__messagesForPhysicalCardExpiration__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v8)
  {
    id v6 = [[PKNavigationController alloc] initWithRootViewController:v8];
    [(PKNavigationController *)v6 setModalPresentationStyle:2];
  }
  else
  {
    if (!v5) {
      goto LABEL_6;
    }
    id v6 = (PKNavigationController *)PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);
  }
  id v7 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "pkui_viewControllerFromResponderChain");
  [v7 presentViewController:v6 animated:1 completion:0];

LABEL_6:
}

void __70__PKDashboardPaymentPassDataSource__messagesForPhysicalCardExpiration__block_invoke_3(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v3 = [WeakRetained[49] accountIdentifier];
    uint64_t v4 = [*(id *)(a1 + 32) identifier];
    PKAppleCardSetHasDismissedPhysicalCardExpiredMessage();

    [v5 reloadMessages];
    id WeakRetained = v5;
  }
}

void __70__PKDashboardPaymentPassDataSource__messagesForPhysicalCardExpiration__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = (void *)*((void *)WeakRetained + 50);
    uint64_t v5 = *(void *)(a1 + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    void v6[2] = __70__PKDashboardPaymentPassDataSource__messagesForPhysicalCardExpiration__block_invoke_5;
    v6[3] = &unk_1E59D2D18;
    void v6[4] = v3;
    [v4 replaceFlowViewControllerForReason:1 content:0 currentPhysicalCard:v5 completion:v6];
  }
}

void __70__PKDashboardPaymentPassDataSource__messagesForPhysicalCardExpiration__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v8)
  {
    id v6 = [[PKNavigationController alloc] initWithRootViewController:v8];
    [(PKNavigationController *)v6 setModalPresentationStyle:2];
  }
  else
  {
    if (!v5) {
      goto LABEL_6;
    }
    id v6 = (PKNavigationController *)PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);
  }
  id v7 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "pkui_viewControllerFromResponderChain");
  [v7 presentViewController:v6 animated:1 completion:0];

LABEL_6:
}

void __70__PKDashboardPaymentPassDataSource__messagesForPhysicalCardExpiration__block_invoke_6(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v3 = [WeakRetained[49] accountIdentifier];
    uint64_t v4 = [*(id *)(a1 + 32) identifier];
    PKAppleCardSetHasDismissedPhysicalCardExpiringSoonMessage();

    [v5 reloadMessages];
    id WeakRetained = v5;
  }
}

- (id)_messagesForPhysicalCard
{
  uint64_t v145 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (self->_account && self->_physicalCardsLoaded)
  {
    id v95 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v103 = self;
    objc_initWeak(&location, self);
    if ([(PKPhysicalCardController *)self->_physicalCardController canRequestNewPhysicalCard]&& ![(PKPhysicalCardController *)self->_physicalCardController canReplacePhysicalCard]&& (PKSharedCacheGetBoolForKey() & 1) == 0)
    {
      id v3 = objc_alloc_init(PKDashboardPassMessage);
      uint64_t v4 = PKLocalizedFeatureString();
      [(PKDashboardPassMessage *)v3 setTitle:v4];

      id v5 = PKLocalizedFeatureString();
      [(PKDashboardPassMessage *)v3 setMessage:v5];

      id v6 = [(PKDashboardPaymentPassDataSource *)v103 _messageImageWithName:@"PhysicalCardMessageModule" extension:@"pdf"];
      [(PKDashboardPassMessage *)v3 setImage:v6];

      v141[0] = MEMORY[0x1E4F143A8];
      v141[1] = 3221225472;
      v141[2] = __60__PKDashboardPaymentPassDataSource__messagesForPhysicalCard__block_invoke;
      v141[3] = &unk_1E59CA7F8;
      objc_copyWeak(&v142, &location);
      [(PKDashboardPassMessage *)v3 setActionOnDismiss:v141];
      id v7 = PKLocalizedFeatureString();
      [(PKDashboardPassMessage *)v3 setButtonTitle:v7];

      v139[0] = MEMORY[0x1E4F143A8];
      v139[1] = 3221225472;
      v139[2] = __60__PKDashboardPaymentPassDataSource__messagesForPhysicalCard__block_invoke_2;
      v139[3] = &unk_1E59CA7F8;
      objc_copyWeak(&v140, &location);
      [(PKDashboardPassMessage *)v3 setActionOnButtonPress:v139];
      [(PKDashboardPassMessage *)v3 setIdentifier:@"physicalCardOrder"];
      [(PKDashboardPassMessage *)v3 setReportToAnalytics:1];
      id v8 = [MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForPass:v103->_pass];
      [(PKDashboardPassMessage *)v3 setAnalyticsReporterSubject:v8];

      [v95 addObject:v3];
      objc_destroyWeak(&v140);
      objc_destroyWeak(&v142);

      self = v103;
    }
    [(NSSet *)self->_physicalCards objectsPassingTest:&__block_literal_global_1292];
    long long v137 = 0u;
    long long v138 = 0u;
    long long v135 = 0u;
    long long v136 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [obj countByEnumeratingWithState:&v135 objects:v144 count:16];
    if (v9)
    {
      uint64_t v97 = *(void *)v136;
      do
      {
        uint64_t v98 = v9;
        for (uint64_t i = 0; i != v98; ++i)
        {
          if (*(void *)v136 != v97) {
            objc_enumerationMutation(obj);
          }
          char v11 = *(void **)(*((void *)&v135 + 1) + 8 * i);
          id v12 = objc_msgSend(v11, "accountUserAltDSID", v86, v88);
          BOOL v13 = [v11 identifier];
          accountUserCollection = self->_accountUserCollection;
          if (v12) {
            [(PKAccountUserCollection *)accountUserCollection accountUserWithAltDSID:v12];
          }
          else {
          id v15 = [(PKAccountUserCollection *)accountUserCollection currentAccountUser];
          }
          uint64_t v16 = [v15 accessLevel];
          if (v15) {
            BOOL v17 = v16 == 2;
          }
          else {
            BOOL v17 = 0;
          }
          if ((!v17
             || ([v15 isCurrentUser] & 1) != 0
             || ([v15 supportsRequestPhysicalCard] & 1) != 0)
            && ([(PKAccount *)self->_account accessLevel] != 2
             || [(PKAccount *)self->_account supportsRequestPhysicalCard]))
          {
            if (v15) {
              int v18 = [v15 isCurrentUser];
            }
            else {
              int v18 = 1;
            }
            uint64_t v19 = [(PKDashboardPaymentPassDataSource *)self _lastPhysicalCardMessageDateKeyForPhysicalCardIdentifier:v13];
            uint64_t v20 = PKSharedCacheGetDateForKey();
            if (v20) {
              int v21 = 0;
            }
            else {
              int v21 = v18;
            }
            if (v21 == 1)
            {
              uint64_t v20 = PKSharedCacheGetDateForKey();
            }
            v100 = (void *)v19;
            if (v12)
            {
              uint64_t v22 = [(PKFamilyMemberCollection *)self->_familyCollection familyMemberForAltDSID:v12];
            }
            else
            {
              uint64_t v22 = 0;
            }
            uint64_t v23 = (void *)MEMORY[0x1E4F845E8];
            id v24 = [v15 nameComponents];
            id v104 = [v23 contactForFamilyMember:v22 nameComponents:v24 imageData:0];
            id v99 = (void *)v22;

            id v101 = [v104 givenName];
            char v25 = [v11 latestShippingActivity];
            id v26 = v25;
            v102 = v25;
            if (v25
              && [v25 shippingStatus]
              && (!v20
               || ([v26 timestamp],
                   id v27 = objc_claimAutoreleasedReturnValue(),
                   BOOL v28 = [v20 compare:v27] == -1,
                   v27,
                   id v26 = v102,
                   v28)))
            {
              switch([v26 shippingStatus])
              {
                case 1:
                  BOOL v30 = objc_alloc_init(PKDashboardPassMessage);
                  id v34 = [(PKDashboardPaymentPassDataSource *)v103 _messageImageWithName:@"PhysicalCardMessageModule" extension:@"pdf"];
                  [(PKDashboardPassMessage *)v30 setImage:v34];

                  id v35 = [MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForPass:v103->_pass];
                  [(PKDashboardPassMessage *)v30 setAnalyticsReporterSubject:v35];

                  if (v18)
                  {
                    PKLocalizedFeatureString();
                    id v33 = (PKDashboardPassMessage *)objc_claimAutoreleasedReturnValue();
                    long long v36 = [v102 formattedEstimatedDeliveryDate];
                    v87 = v36;
                  }
                  else
                  {
                    PKLocalizedFeatureString();
                    id v33 = (PKDashboardPassMessage *)objc_claimAutoreleasedReturnValue();
                    long long v36 = objc_msgSend(v102, "formattedEstimatedDeliveryDate", v101);
                    v87 = v101;
                    uint64_t v88 = v36;
                  }
                  uint64_t v91 = PKLocalizedFeatureString();

                  -[PKDashboardPassMessage setTitle:](v30, "setTitle:", v33, v87);
                  [(PKDashboardPassMessage *)v30 setMessage:v91];
                  id v51 = [v11 shipmentTrackingURL];
                  if (v51
                    || ([v102 shipmentTrackingURL], (id v51 = (id)objc_claimAutoreleasedReturnValue()) != 0))
                  {
                    id v52 = PKLocalizedFeatureString();
                    [(PKDashboardPassMessage *)v30 setButtonTitle:v52];

                    v133[0] = MEMORY[0x1E4F143A8];
                    v133[1] = 3221225472;
                    v133[2] = __60__PKDashboardPaymentPassDataSource__messagesForPhysicalCard__block_invoke_5;
                    v133[3] = &unk_1E59CA7D0;
                    id v51 = v51;
                    id v134 = v51;
                    [(PKDashboardPassMessage *)v30 setActionOnButtonPress:v133];
                  }
                  v130[0] = MEMORY[0x1E4F143A8];
                  v130[1] = 3221225472;
                  v130[2] = __60__PKDashboardPaymentPassDataSource__messagesForPhysicalCard__block_invoke_6;
                  v130[3] = &unk_1E59CB010;
                  objc_copyWeak(&v132, &location);
                  id v131 = v100;
                  [(PKDashboardPassMessage *)v30 setActionOnDismiss:v130];
                  long long v53 = [(PKDashboardPaymentPassDataSource *)v103 _physicalCardMessageIdentifierFromIdentifier:@"physicalCardShipped" physicalCard:v11];
                  [(PKDashboardPassMessage *)v30 setIdentifier:v53];

                  [(PKDashboardPassMessage *)v30 setReportToAnalytics:1];
                  [v95 addObject:v30];

                  objc_destroyWeak(&v132);
                  goto LABEL_91;
                case 2:
                  BOOL v30 = objc_alloc_init(PKDashboardPassMessage);
                  if (v18)
                  {
                    PKLocalizedFeatureString();
                    id v33 = (PKDashboardPassMessage *)objc_claimAutoreleasedReturnValue();
                    PKLocalizedFeatureString();
                  }
                  else
                  {
                    PKLocalizedFeatureString();
                    id v33 = (PKDashboardPassMessage *)objc_claimAutoreleasedReturnValue();
                    id v86 = v101;
                    PKLocalizedFeatureString();
                  uint64_t v92 = };
                  -[PKDashboardPassMessage setTitle:](v30, "setTitle:", v33, v86);
                  [(PKDashboardPassMessage *)v30 setMessage:v92];
                  uint64_t v46 = [(PKDashboardPaymentPassDataSource *)v103 _messageImageWithName:@"PhysicalCardMessageModule" extension:@"pdf"];
                  [(PKDashboardPassMessage *)v30 setImage:v46];

                  char v47 = [MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForPass:v103->_pass];
                  [(PKDashboardPassMessage *)v30 setAnalyticsReporterSubject:v47];

                  id v48 = [v11 shipmentTrackingURL];
                  if (v48
                    || ([v102 shipmentTrackingURL], (id v48 = (id)objc_claimAutoreleasedReturnValue()) != 0))
                  {
                    id v49 = PKLocalizedFeatureString();
                    [(PKDashboardPassMessage *)v30 setButtonTitle:v49];

                    v125[0] = MEMORY[0x1E4F143A8];
                    v125[1] = 3221225472;
                    v125[2] = __60__PKDashboardPaymentPassDataSource__messagesForPhysicalCard__block_invoke_8;
                    v125[3] = &unk_1E59CA7D0;
                    id v48 = v48;
                    id v126 = v48;
                    [(PKDashboardPassMessage *)v30 setActionOnButtonPress:v125];
                  }
                  uint64_t v50 = [(PKDashboardPaymentPassDataSource *)v103 _physicalCardMessageIdentifierFromIdentifier:@"physicalCardOutForDelivery" physicalCard:v11];
                  [(PKDashboardPassMessage *)v30 setIdentifier:v50];

                  [(PKDashboardPassMessage *)v30 setReportToAnalytics:1];
                  [v95 addObject:v30];

                  goto LABEL_91;
                case 3:
                  if ((v18 & 1) == 0 && ![v15 supportsPhysicalCardActivation]) {
                    goto LABEL_93;
                  }
                  BOOL v30 = objc_alloc_init(PKDashboardPassMessage);
                  id v37 = [MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForPass:v103->_pass];
                  [(PKDashboardPassMessage *)v30 setAnalyticsReporterSubject:v37];

                  if (v18)
                  {
                    PKLocalizedFeatureString();
                  }
                  else
                  {
                    id v86 = v101;
                    PKLocalizedFeatureString();
                  }
                  id v33 = (PKDashboardPassMessage *)objc_claimAutoreleasedReturnValue();
                  v68 = PKLocalizedFeatureString();
                  uint64_t v69 = PKLocalizedFeatureString();
                  [(PKDashboardPassMessage *)v30 setButtonTitle:v69];

                  v127[0] = MEMORY[0x1E4F143A8];
                  v127[1] = 3221225472;
                  v127[2] = __60__PKDashboardPaymentPassDataSource__messagesForPhysicalCard__block_invoke_7;
                  v127[3] = &unk_1E59CB378;
                  objc_copyWeak(&v129, &location);
                  void v127[4] = v11;
                  id v128 = v15;
                  [(PKDashboardPassMessage *)v30 setActionOnButtonPress:v127];
                  [(PKDashboardPassMessage *)v30 setTitle:v33];
                  [(PKDashboardPassMessage *)v30 setMessage:v68];
                  v70 = [(PKDashboardPaymentPassDataSource *)v103 _messageImageWithName:@"PhysicalCardMessageModule" extension:@"pdf"];
                  [(PKDashboardPassMessage *)v30 setImage:v70];

                  uint64_t v71 = [(PKDashboardPaymentPassDataSource *)v103 _physicalCardMessageIdentifierFromIdentifier:@"physicalCardDelivered" physicalCard:v11];
                  [(PKDashboardPassMessage *)v30 setIdentifier:v71];

                  [(PKDashboardPassMessage *)v30 setReportToAnalytics:1];
                  [v95 addObject:v30];

                  objc_destroyWeak(&v129);
LABEL_91:

                  break;
                case 4:
                  BOOL v30 = objc_alloc_init(PKDashboardPassMessage);
                  id v38 = PKLocalizedFeatureString();
                  [(PKDashboardPassMessage *)v30 setTitle:v38];

                  id v33 = [v102 localizedDeliveryExceptionReason];
                  if (!v33)
                  {
                    if (v18)
                    {
                      PKLocalizedFeatureString();
                    }
                    else
                    {
                      id v86 = v101;
                      PKLocalizedFeatureString();
                    }
                    id v33 = (PKDashboardPassMessage *)objc_claimAutoreleasedReturnValue();
                  }
                  -[PKDashboardPassMessage setMessage:](v30, "setMessage:", v33, v86);
                  uint64_t v75 = [(PKDashboardPaymentPassDataSource *)v103 _messageImageWithName:@"MessageAlert" extension:@"pdf"];
                  [(PKDashboardPassMessage *)v30 setImage:v75];

                  uint64_t v76 = PKLocalizedFeatureString();
                  [(PKDashboardPassMessage *)v30 setButtonTitle:v76];

                  v123[0] = MEMORY[0x1E4F143A8];
                  v123[1] = 3221225472;
                  v123[2] = __60__PKDashboardPaymentPassDataSource__messagesForPhysicalCard__block_invoke_9;
                  v123[3] = &unk_1E59CA7F8;
                  objc_copyWeak(&v124, &location);
                  [(PKDashboardPassMessage *)v30 setActionOnButtonPress:v123];
                  v120[0] = MEMORY[0x1E4F143A8];
                  v120[1] = 3221225472;
                  v120[2] = __60__PKDashboardPaymentPassDataSource__messagesForPhysicalCard__block_invoke_10;
                  v120[3] = &unk_1E59CB010;
                  objc_copyWeak(&v122, &location);
                  id v121 = v100;
                  [(PKDashboardPassMessage *)v30 setActionOnDismiss:v120];
                  uint64_t v77 = [(PKDashboardPaymentPassDataSource *)v103 _physicalCardMessageIdentifierFromIdentifier:@"physicalCardCannotDeliver" physicalCard:v11];
                  [(PKDashboardPassMessage *)v30 setIdentifier:v77];

                  [(PKDashboardPassMessage *)v30 setReportToAnalytics:1];
                  uint64_t v78 = [MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForPass:v103->_pass];
                  [(PKDashboardPassMessage *)v30 setAnalyticsReporterSubject:v78];

                  [v95 addObject:v30];
                  objc_destroyWeak(&v122);
                  objc_destroyWeak(&v124);
                  goto LABEL_91;
                default:
                  goto LABEL_93;
              }
            }
            else
            {
              uint64_t v29 = [v11 latestOrderActivity];
              BOOL v30 = v29;
              if (v29)
              {
                if ([(PKDashboardPassMessage *)v29 activity])
                {
                  if (!v20
                    || ([(PKDashboardPassMessage *)v30 date],
                        long long v31 = objc_claimAutoreleasedReturnValue(),
                        BOOL v32 = [v20 compare:v31] == -1,
                        v31,
                        v32))
                  {
                    switch([(PKDashboardPassMessage *)v30 activity])
                    {
                      case 1:
                        id v33 = objc_alloc_init(PKDashboardPassMessage);
                        if (v18)
                        {
                          uint64_t v90 = PKLocalizedFeatureString();
                          PKLocalizedFeatureString();
                        }
                        else
                        {
                          uint64_t v90 = PKLocalizedFeatureString();
                          id v86 = v101;
                          PKLocalizedFeatureString();
                        id v54 = };
                        -[PKDashboardPassMessage setTitle:](v33, "setTitle:", v90, v86);
                        [(PKDashboardPassMessage *)v33 setMessage:v54];
                        id v55 = PKLocalizedFeatureString();
                        [(PKDashboardPassMessage *)v33 setButtonTitle:v55];

                        id v56 = [(PKDashboardPaymentPassDataSource *)v103 _messageImageWithName:@"PhysicalCardMessageModule" extension:@"pdf"];
                        [(PKDashboardPassMessage *)v33 setImage:v56];

                        [(PKDashboardPassMessage *)v33 setActionOnButtonPress:&__block_literal_global_1370];
                        v111[0] = MEMORY[0x1E4F143A8];
                        v111[1] = 3221225472;
                        v111[2] = __60__PKDashboardPaymentPassDataSource__messagesForPhysicalCard__block_invoke_15;
                        v111[3] = &unk_1E59CB010;
                        objc_copyWeak(&v113, &location);
                        id v112 = v100;
                        [(PKDashboardPassMessage *)v33 setActionOnDismiss:v111];
                        id v57 = [(PKDashboardPaymentPassDataSource *)v103 _physicalCardMessageIdentifierFromIdentifier:@"physicalCardOrdered" physicalCard:v11];
                        [(PKDashboardPassMessage *)v33 setIdentifier:v57];

                        [(PKDashboardPassMessage *)v33 setReportToAnalytics:1];
                        id v58 = [MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForPass:v103->_pass];
                        [(PKDashboardPassMessage *)v33 setAnalyticsReporterSubject:v58];

                        [v95 addObject:v33];
                        objc_destroyWeak(&v113);

                        goto LABEL_91;
                      case 2:
                        id v33 = objc_alloc_init(PKDashboardPassMessage);
                        if (v18)
                        {
                          uint64_t v94 = PKLocalizedFeatureString();
                          PKLocalizedFeatureString();
                        }
                        else
                        {
                          uint64_t v94 = PKLocalizedFeatureString();
                          id v86 = v101;
                          PKLocalizedFeatureString();
                        long long v64 = };
                        -[PKDashboardPassMessage setTitle:](v33, "setTitle:", v94, v86);
                        [(PKDashboardPassMessage *)v33 setMessage:v64];
                        long long v65 = [(PKDashboardPaymentPassDataSource *)v103 _messageImageWithName:@"DeliveryBox" extension:@"pdf"];
                        [(PKDashboardPassMessage *)v33 setImage:v65];

                        long long v66 = [v11 shipmentTrackingURL];

                        PKLocalizedFeatureString();
                        if (v66) {
                          long long v67 = {;
                        }
                          [(PKDashboardPassMessage *)v33 setButtonTitle:v67];

                          v119[0] = MEMORY[0x1E4F143A8];
                          v119[1] = 3221225472;
                          v119[2] = __60__PKDashboardPaymentPassDataSource__messagesForPhysicalCard__block_invoke_11;
                          v119[3] = &unk_1E59CA7D0;
                          v119[4] = v11;
                          [(PKDashboardPassMessage *)v33 setActionOnButtonPress:v119];
                        }
                        else {
                          uint64_t v72 = {;
                        }
                          [(PKDashboardPassMessage *)v33 setButtonTitle:v72];

                          v117[0] = MEMORY[0x1E4F143A8];
                          v117[1] = 3221225472;
                          v117[2] = __60__PKDashboardPaymentPassDataSource__messagesForPhysicalCard__block_invoke_12;
                          v117[3] = &unk_1E59CA7F8;
                          objc_copyWeak(&v118, &location);
                          [(PKDashboardPassMessage *)v33 setActionOnButtonPress:v117];
                          objc_destroyWeak(&v118);
                        }
                        v114[0] = MEMORY[0x1E4F143A8];
                        v114[1] = 3221225472;
                        v114[2] = __60__PKDashboardPaymentPassDataSource__messagesForPhysicalCard__block_invoke_13;
                        v114[3] = &unk_1E59CB010;
                        objc_copyWeak(&v116, &location);
                        id v115 = v100;
                        [(PKDashboardPassMessage *)v33 setActionOnDismiss:v114];
                        double v73 = [(PKDashboardPaymentPassDataSource *)v103 _physicalCardMessageIdentifierFromIdentifier:@"physicalCardShippedNoDate" physicalCard:v11];
                        [(PKDashboardPassMessage *)v33 setIdentifier:v73];

                        [(PKDashboardPassMessage *)v33 setReportToAnalytics:1];
                        id v74 = [MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForPass:v103->_pass];
                        [(PKDashboardPassMessage *)v33 setAnalyticsReporterSubject:v74];

                        [v95 addObject:v33];
                        objc_destroyWeak(&v116);

                        goto LABEL_91;
                      case 3:
                        id v33 = objc_alloc_init(PKDashboardPassMessage);
                        if (v18)
                        {
                          uint64_t v93 = PKLocalizedFeatureString();
                          PKLocalizedFeatureString();
                        }
                        else
                        {
                          uint64_t v93 = PKLocalizedFeatureString();
                          id v86 = v101;
                          PKLocalizedFeatureString();
                        id v59 = };
                        -[PKDashboardPassMessage setTitle:](v33, "setTitle:", v93, v86);
                        [(PKDashboardPassMessage *)v33 setMessage:v59];
                        long long v60 = PKLocalizedFeatureString();
                        [(PKDashboardPassMessage *)v33 setButtonTitle:v60];

                        id v61 = [(PKDashboardPaymentPassDataSource *)v103 _messageImageWithName:@"MessageAlert" extension:@"pdf"];
                        [(PKDashboardPassMessage *)v33 setImage:v61];

                        v109[0] = MEMORY[0x1E4F143A8];
                        v109[1] = 3221225472;
                        v109[2] = __60__PKDashboardPaymentPassDataSource__messagesForPhysicalCard__block_invoke_16;
                        v109[3] = &unk_1E59CA7F8;
                        objc_copyWeak(&v110, &location);
                        [(PKDashboardPassMessage *)v33 setActionOnButtonPress:v109];
                        long long v62 = [(PKDashboardPaymentPassDataSource *)v103 _physicalCardMessageIdentifierFromIdentifier:@"physicalCardFixShippingAddress" physicalCard:v11];
                        [(PKDashboardPassMessage *)v33 setIdentifier:v62];

                        [(PKDashboardPassMessage *)v33 setReportToAnalytics:1];
                        long long v63 = [MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForPass:v103->_pass];
                        [(PKDashboardPassMessage *)v33 setAnalyticsReporterSubject:v63];

                        [v95 addObject:v33];
                        objc_destroyWeak(&v110);

                        goto LABEL_91;
                      case 4:
                        id v33 = objc_alloc_init(PKDashboardPassMessage);
                        char v39 = PKLocalizedFeatureString();
                        [(PKDashboardPassMessage *)v33 setTitle:v39];

                        uint64_t v40 = [(PKDashboardPassMessage *)v30 localizedReason];
                        id v41 = v40;
                        if (!v40)
                        {
                          v89 = PKLocalizedFeatureString();
                          id v41 = v89;
                        }
                        [(PKDashboardPassMessage *)v33 setMessage:v41];
                        if (!v40) {

                        }
                        id v42 = PKLocalizedFeatureString();
                        [(PKDashboardPassMessage *)v33 setButtonTitle:v42];

                        id v43 = [(PKDashboardPaymentPassDataSource *)v103 _messageImageWithName:@"MessageAlert" extension:@"pdf"];
                        [(PKDashboardPassMessage *)v33 setImage:v43];

                        v107[0] = MEMORY[0x1E4F143A8];
                        v107[1] = 3221225472;
                        v107[2] = __60__PKDashboardPaymentPassDataSource__messagesForPhysicalCard__block_invoke_17;
                        v107[3] = &unk_1E59CA7F8;
                        objc_copyWeak(&v108, &location);
                        [(PKDashboardPassMessage *)v33 setActionOnButtonPress:v107];
                        id v44 = [(PKDashboardPaymentPassDataSource *)v103 _physicalCardMessageIdentifierFromIdentifier:@"physicalCardOrderIssue" physicalCard:v11];
                        [(PKDashboardPassMessage *)v33 setIdentifier:v44];

                        [(PKDashboardPassMessage *)v33 setReportToAnalytics:1];
                        id v45 = [MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForPass:v103->_pass];
                        [(PKDashboardPassMessage *)v33 setAnalyticsReporterSubject:v45];

                        [v95 addObject:v33];
                        objc_destroyWeak(&v108);
                        goto LABEL_91;
                      default:
                        break;
                    }
                  }
                }
              }
            }

            id v26 = v102;
LABEL_93:
          }
          self = v103;
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v135 objects:v144 count:16];
      }
      while (v9);
    }

    if ([(PKAccount *)v103->_account state] == 1
      && [(PKPhysicalCardController *)v103->_physicalCardController physicalCardBlocked])
    {
      uint64_t v79 = objc_alloc_init(PKDashboardPassMessage);
      [(PKDashboardPassMessage *)v79 setIdentifier:@"physicalCardSuspended"];
      uint64_t v80 = PKLocalizedFeatureString();
      [(PKDashboardPassMessage *)v79 setTitle:v80];

      int v81 = PKLocalizedFeatureString();
      [(PKDashboardPassMessage *)v79 setMessage:v81];

      uint64_t v82 = [(PKDashboardPaymentPassDataSource *)v103 _messageImageWithName:@"MessageAlert" extension:@"pdf"];
      [(PKDashboardPassMessage *)v79 setImage:v82];

      id v83 = PKLocalizedFeatureString();
      [(PKDashboardPassMessage *)v79 setButtonTitle:v83];

      v105[0] = MEMORY[0x1E4F143A8];
      v105[1] = 3221225472;
      v105[2] = __60__PKDashboardPaymentPassDataSource__messagesForPhysicalCard__block_invoke_18;
      v105[3] = &unk_1E59CA7F8;
      objc_copyWeak(&v106, &location);
      [(PKDashboardPassMessage *)v79 setActionOnButtonPress:v105];
      [v95 addObject:v79];
      objc_destroyWeak(&v106);
    }
    if (objc_msgSend(v95, "count", v86)) {
      uint64_t v84 = (void *)[v95 copy];
    }
    else {
      uint64_t v84 = 0;
    }

    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v84 = 0;
  }

  return v84;
}

void __60__PKDashboardPaymentPassDataSource__messagesForPhysicalCard__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  PKSharedCacheSetBoolForKey();
  id v1 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained reloadMessages];
    id v1 = WeakRetained;
  }
}

void __60__PKDashboardPaymentPassDataSource__messagesForPhysicalCard__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = (void *)*((void *)WeakRetained + 50);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __60__PKDashboardPaymentPassDataSource__messagesForPhysicalCard__block_invoke_3;
    v4[3] = &unk_1E59D9FE0;
    v4[4] = v2;
    [v3 orderFlowViewControllerForReason:0 content:0 completion:v4];
  }
}

void __60__PKDashboardPaymentPassDataSource__messagesForPhysicalCard__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  if (v7)
  {
    id v5 = [[PKNavigationController alloc] initWithRootViewController:v7];
    [(PKNavigationController *)v5 setModalPresentationStyle:2];
  }
  else
  {
    id v5 = (PKNavigationController *)PKAlertForDisplayableErrorWithHandlers(a3, 0, 0, 0);
  }
  id v6 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "pkui_viewControllerFromResponderChain");
  [v6 presentViewController:v5 animated:1 completion:0];
}

BOOL __60__PKDashboardPaymentPassDataSource__messagesForPhysicalCard__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 state] == 1;
}

void __60__PKDashboardPaymentPassDataSource__messagesForPhysicalCard__block_invoke_5(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v2 openURL:*(void *)(a1 + 32) configuration:0 completionHandler:0];
}

void __60__PKDashboardPaymentPassDataSource__messagesForPhysicalCard__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v1 = [MEMORY[0x1E4F1C9C8] date];
  PKSharedCacheSetObjectForKey();

  id v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained reloadMessages];
    id v2 = WeakRetained;
  }
}

void __60__PKDashboardPaymentPassDataSource__messagesForPhysicalCard__block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _presentActivatePhysicalCard:*(void *)(a1 + 32) accountUser:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

void __60__PKDashboardPaymentPassDataSource__messagesForPhysicalCard__block_invoke_8(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v2 openURL:*(void *)(a1 + 32) configuration:0 completionHandler:0];
}

void __60__PKDashboardPaymentPassDataSource__messagesForPhysicalCard__block_invoke_9(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v1 = [PKBusinessChatPhysicalCardContext alloc];
    id v2 = [WeakRetained[1] frontmostPassView];
    id v3 = [v2 pass];
    uint64_t v4 = [v3 paymentPass];
    id v5 = [(PKBusinessChatPhysicalCardContext *)v1 initWithPaymentPass:v4 intent:3];

    [WeakRetained _presentAccountResolution:3 forBusinessChatContext:v5];
  }
}

void __60__PKDashboardPaymentPassDataSource__messagesForPhysicalCard__block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v1 = [MEMORY[0x1E4F1C9C8] date];
  PKSharedCacheSetObjectForKey();

  [WeakRetained reloadMessages];
}

void __60__PKDashboardPaymentPassDataSource__messagesForPhysicalCard__block_invoke_11(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) shipmentTrackingURL];
  id v1 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v1 openURL:v2 configuration:0 completionHandler:0];
}

void __60__PKDashboardPaymentPassDataSource__messagesForPhysicalCard__block_invoke_12(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v1 = [PKBusinessChatPhysicalCardContext alloc];
    id v2 = [WeakRetained[1] frontmostPassView];
    id v3 = [v2 pass];
    uint64_t v4 = [v3 paymentPass];
    id v5 = [(PKBusinessChatPhysicalCardContext *)v1 initWithPaymentPass:v4 intent:2];

    [WeakRetained _presentAccountResolution:3 forBusinessChatContext:v5];
  }
}

void __60__PKDashboardPaymentPassDataSource__messagesForPhysicalCard__block_invoke_13(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v1 = [MEMORY[0x1E4F1C9C8] date];
  PKSharedCacheSetObjectForKey();

  [WeakRetained reloadMessages];
}

void __60__PKDashboardPaymentPassDataSource__messagesForPhysicalCard__block_invoke_14()
{
  [MEMORY[0x1E4F1CB10] URLWithString:@"https://support.apple.com/kb/HT209434?cid=iOS_UI_AppleCard_article_HT209434#activate"];
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v0 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v0 openURL:v1 configuration:0 completionHandler:0];
}

void __60__PKDashboardPaymentPassDataSource__messagesForPhysicalCard__block_invoke_15(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v1 = [MEMORY[0x1E4F1C9C8] date];
    PKSharedCacheSetObjectForKey();

    [WeakRetained reloadMessages];
  }
}

void __60__PKDashboardPaymentPassDataSource__messagesForPhysicalCard__block_invoke_16(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v1 = [PKBusinessChatPhysicalCardContext alloc];
    id v2 = [WeakRetained[1] frontmostPassView];
    id v3 = [v2 pass];
    uint64_t v4 = [v3 paymentPass];
    id v5 = [(PKBusinessChatPhysicalCardContext *)v1 initWithPaymentPass:v4 intent:1];

    [WeakRetained _presentAccountResolution:3 forBusinessChatContext:v5];
  }
}

void __60__PKDashboardPaymentPassDataSource__messagesForPhysicalCard__block_invoke_17(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v1 = [PKBusinessChatPhysicalCardContext alloc];
    id v2 = [WeakRetained[1] frontmostPassView];
    id v3 = [v2 pass];
    uint64_t v4 = [v3 paymentPass];
    id v5 = [(PKBusinessChatPhysicalCardContext *)v1 initWithPaymentPass:v4 intent:1];

    [WeakRetained _presentAccountResolution:3 forBusinessChatContext:v5];
  }
}

void __60__PKDashboardPaymentPassDataSource__messagesForPhysicalCard__block_invoke_18(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v1 = [[PKBusinessChatAccountStateContext alloc] initWithAccount:WeakRetained[49] paymentPass:WeakRetained[110] eligibleForRecoveryPaymentPlan:0];
    [WeakRetained _presentAccountResolution:2 forBusinessChatContext:v1];
  }
}

- (id)_physicalCardMessageIdentifierFromIdentifier:(id)a3 physicalCard:(id)a4
{
  id v5 = (objc_class *)NSString;
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 alloc];
  uint64_t v9 = [v6 identifier];

  id v10 = (void *)[v8 initWithFormat:@"%@-%@", v7, v9];

  return v10;
}

- (id)_lastPhysicalCardMessageDateKeyForPhysicalCardIdentifier:(id)a3
{
  if (a3)
  {
    id v3 = (objc_class *)NSString;
    id v4 = a3;
    id v5 = [v3 alloc];
    id v6 = (void *)[v5 initWithFormat:@"%@-%@", *MEMORY[0x1E4F87E40], v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)_presentActivatePhysicalCard:(id)a3 accountUser:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [[PKPhysicalCardManualActivationViewController alloc] initWithAccountService:self->_accountService account:self->_account accountUser:v6 paymentPass:self->_pass physicalCard:v7 activationCode:0];

  id v8 = [[PKNavigationController alloc] initWithRootViewController:v10];
  uint64_t v9 = [(UIView *)self->_groupView pkui_viewControllerFromResponderChain];
  [v9 presentViewController:v8 animated:1 completion:0];
}

- (id)_downloadMessageIconURLAndReloadIfNecessary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockIcons);
    id v5 = [(NSMutableDictionary *)self->_icons objectForKey:v4];
    os_unfair_lock_unlock(&self->_lockIcons);
    if (v5) {
      goto LABEL_10;
    }
    id v6 = [MEMORY[0x1E4F84830] sharedImageAssetDownloader];
    id v7 = [v6 cachedDataForURL:v4];

    uint64_t v8 = [MEMORY[0x1E4FB1818] imageWithData:v7];
    if (v8)
    {
      id v5 = (void *)v8;
      os_unfair_lock_lock(&self->_lockIcons);
      [(NSMutableDictionary *)self->_icons setObject:v5 forKey:v4];
      os_unfair_lock_unlock(&self->_lockIcons);

      goto LABEL_10;
    }

    os_unfair_lock_lock(&self->_lockIcons);
    if (([(NSMutableSet *)self->_iconDownloads containsObject:v4] & 1) != 0
      || ([(NSMutableSet *)self->_iconFailedDownloads containsObject:v4] & 1) != 0)
    {
      os_unfair_lock_unlock(&self->_lockIcons);
    }
    else
    {
      [(NSMutableSet *)self->_iconDownloads addObject:v4];
      os_unfair_lock_unlock(&self->_lockIcons);
      objc_initWeak(&location, self);
      uint64_t v9 = [MEMORY[0x1E4F84830] sharedImageAssetDownloader];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      id v11[2] = __80__PKDashboardPaymentPassDataSource__downloadMessageIconURLAndReloadIfNecessary___block_invoke;
      v11[3] = &unk_1E59DA028;
      objc_copyWeak(&v13, &location);
      id v12 = v4;
      [v9 downloadFromUrl:v12 completionHandler:v11];

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
  id v5 = 0;
LABEL_10:

  return v5;
}

void __80__PKDashboardPaymentPassDataSource__downloadMessageIconURLAndReloadIfNecessary___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v11 = a2;
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 132);
    [*(id *)&v7[134]._os_unfair_lock_opaque removeObject:*(void *)(a1 + 32)];
    if (a4 || ![v11 length])
    {
      [*(id *)&v7[136]._os_unfair_lock_opaque addObject:*(void *)(a1 + 32)];
    }
    else if ([v11 length])
    {
      id v10 = [MEMORY[0x1E4FB1818] imageWithData:v11];
      if (v10)
      {
        LOBYTE(v7[140]._os_unfair_lock_opaque) = 1;
        [*(id *)&v7[138]._os_unfair_lock_opaque setObject:v10 forKey:*(void *)(a1 + 32)];
      }
    }
    int os_unfair_lock_opaque_low = LOBYTE(v7[140]._os_unfair_lock_opaque);
    uint64_t v9 = [*(id *)&v7[134]._os_unfair_lock_opaque count];
    os_unfair_lock_unlock(v7 + 132);
    if (os_unfair_lock_opaque_low && !v9)
    {
      os_unfair_lock_lock(v7 + 132);
      LOBYTE(v7[140]._os_unfair_lock_opaque) = 0;
      os_unfair_lock_unlock(v7 + 132);
      [(os_unfair_lock_s *)v7 reloadMessages];
    }
  }
}

- (void)_messagesForPeerPaymentPendingRequestsWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __89__PKDashboardPaymentPassDataSource__messagesForPeerPaymentPendingRequestsWithCompletion___block_invoke;
  v6[3] = &unk_1E59CB0D8;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(PKDashboardPaymentPassDataSource *)self reloadPeerPaymentPendingRequestsWithCompletion:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __89__PKDashboardPaymentPassDataSource__messagesForPeerPaymentPendingRequestsWithCompletion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id from = (id *)(a1 + 40);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (!a2 || !WeakRetained)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    goto LABEL_33;
  }
  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v38 = v4;
  id obj = v4[87];
  uint64_t v37 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (!v37) {
    goto LABEL_31;
  }
  uint64_t v35 = *(void *)v48;
  do
  {
    for (uint64_t i = 0; i != v37; ++i)
    {
      if (*(void *)v48 != v35) {
        objc_enumerationMutation(obj);
      }
      id v6 = *(void **)(*((void *)&v47 + 1) + 8 * i);
      id v7 = [v38 _contactResolver];
      id v8 = [v6 requesterAddress];
      id v9 = [v7 contactForHandle:v8];

      id v10 = (void *)MEMORY[0x1E4F84D88];
      id v11 = [v6 requesterAddress];
      id v12 = [v10 displayNameForCounterpartHandle:v11 contact:v9];

      id v13 = [v6 currencyAmount];
      BOOL v14 = [v13 amount];
      id v15 = [v13 currency];
      uint64_t v16 = PKFormattedCurrencyStringFromNumber();

      if (v12 && v16)
      {
        id v41 = [v6 expiryDate];
        uint64_t v40 = [v6 lastDismissedDate];
        if (!v40) {
          goto LABEL_16;
        }
        BOOL v17 = [MEMORY[0x1E4F1C9A8] currentCalendar];
        id v18 = [(PKDashboardPassMessage *)v17 components:16 fromDate:v40 toDate:v41 options:0];
        uint64_t v19 = [MEMORY[0x1E4F1C9C8] date];
        id v39 = [(PKDashboardPassMessage *)v17 components:16 fromDate:v19 toDate:v41 options:0];

        if ([v18 day] != 1
          && [v18 day]
          && ([v18 day] < 2 || objc_msgSend(v39, "day") <= 1))
        {

LABEL_16:
          BOOL v17 = objc_alloc_init(PKDashboardPassMessage);
          long long v36 = [v6 requestToken];
          id v39 = v12;
          id v34 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPen_0.isa, &stru_1EF1B4C70.isa, v16);
          [(PKDashboardPassMessage *)v17 setType:3];
          [(PKDashboardPassMessage *)v17 setIdentifier:v36];
          [(PKDashboardPassMessage *)v17 setTitle:v39];
          [(PKDashboardPassMessage *)v17 setSecondaryTitle:v34];
          uint64_t v20 = [MEMORY[0x1E4F1C9A8] currentCalendar];
          int v21 = [MEMORY[0x1E4F1C9C8] date];
          uint64_t v22 = PKStartOfDay();
          id v33 = [v20 components:16 fromDate:v22 toDate:v41 options:0];

          uint64_t v23 = [v33 day];
          if (v23 == 1)
          {
            BOOL v32 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPen_2.isa);
          }
          else
          {
            if (v23) {
              PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPen_3.isa, &cfstr_Ld.isa, v23);
            }
            else {
            BOOL v32 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPen_1.isa);
            }
          }
          id v24 = [v6 memo];
          if ([v24 length])
          {
            [(PKDashboardPassMessage *)v17 setMessage:v24];
            [(PKDashboardPassMessage *)v17 setSecondaryMessage:v32];
          }
          else
          {
            [(PKDashboardPassMessage *)v17 setMessage:v32];
          }
          if (!v9)
          {
            id v9 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
            [v9 setContactType:0];
          }
          [(PKDashboardPassMessage *)v17 setAvatarContact:v9];
          char v25 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPen_4.isa);
          [(PKDashboardPassMessage *)v17 setButtonTitle:v25];
          -[PKDashboardPassMessage setShowSpinner:](v17, "setShowSpinner:", [v36 isEqualToString:v38[89]]);
          v45[0] = MEMORY[0x1E4F143A8];
          v45[1] = 3221225472;
          v45[2] = __89__PKDashboardPaymentPassDataSource__messagesForPeerPaymentPendingRequestsWithCompletion___block_invoke_2;
          v45[3] = &unk_1E59CB010;
          objc_copyWeak(&v46, from);
          v45[4] = v6;
          [(PKDashboardPassMessage *)v17 setActionOnButtonPress:v45];
          v42[0] = MEMORY[0x1E4F143A8];
          v42[1] = 3221225472;
          v42[2] = __89__PKDashboardPaymentPassDataSource__messagesForPeerPaymentPendingRequestsWithCompletion___block_invoke_3;
          v42[3] = &unk_1E59CB378;
          objc_copyWeak(&v44, from);
          v42[4] = v6;
          id v18 = v36;
          id v43 = v18;
          [(PKDashboardPassMessage *)v17 setActionOnDismiss:v42];
          [v29 addObject:v17];

          objc_destroyWeak(&v44);
          objc_destroyWeak(&v46);
        }
      }
    }
    uint64_t v37 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
  }
  while (v37);
LABEL_31:

  uint64_t v26 = *(void *)(a1 + 32);
  id v27 = (void *)[v29 copy];
  (*(void (**)(uint64_t, void *))(v26 + 16))(v26, v27);

  id v4 = v38;
LABEL_33:
}

void __89__PKDashboardPaymentPassDataSource__messagesForPeerPaymentPendingRequestsWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _pendingRequestActionButtonPressedWithRequest:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

void __89__PKDashboardPaymentPassDataSource__messagesForPeerPaymentPendingRequestsWithCompletion___block_invoke_3(uint64_t a1)
{
  id v2 = (id *)(a1 + 48);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v4 = (void *)MEMORY[0x1E4FB1418];
    id v5 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPen_5.isa);
    id v6 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPen_6.isa);
    id v7 = [v4 alertControllerWithTitle:v5 message:v6 preferredStyle:1];

    id v8 = (void *)MEMORY[0x1E4FB1410];
    id v9 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPen_7.isa);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    id v29[2] = __89__PKDashboardPaymentPassDataSource__messagesForPeerPaymentPendingRequestsWithCompletion___block_invoke_4;
    v29[3] = &unk_1E59D25D0;
    objc_copyWeak(&v30, v2);
    void v29[4] = *(void *)(a1 + 32);
    id v10 = [v8 actionWithTitle:v9 style:0 handler:v29];

    id v11 = (void *)MEMORY[0x1E4FB1410];
    id v12 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPen_8.isa);
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    uint64_t v23 = __89__PKDashboardPaymentPassDataSource__messagesForPeerPaymentPendingRequestsWithCompletion___block_invoke_5;
    id v24 = &unk_1E59DA0C8;
    objc_copyWeak(&v28, v2);
    id v13 = *(id *)(a1 + 40);
    uint64_t v14 = *(void *)(a1 + 32);
    id v25 = v13;
    uint64_t v26 = v14;
    id v15 = v7;
    id v27 = v15;
    uint64_t v16 = [v11 actionWithTitle:v12 style:0 handler:&v21];

    BOOL v17 = (void *)MEMORY[0x1E4FB1410];
    id v18 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPen_9.isa);
    uint64_t v19 = objc_msgSend(v17, "actionWithTitle:style:handler:", v18, 1, 0, v21, v22, v23, v24);

    [v15 addAction:v16];
    [v15 addAction:v10];
    [v15 addAction:v19];
    [v15 setPreferredAction:v16];
    PKAccessibilityIDAlertSet(v15, (void *)*MEMORY[0x1E4F853B8]);
    [v10 setAccessibilityIdentifier:*MEMORY[0x1E4F85978]];
    uint64_t v20 = objc_msgSend(WeakRetained[1], "pkui_viewControllerFromResponderChain");
    [v20 presentViewController:v15 animated:1 completion:0];

    objc_destroyWeak(&v28);
    objc_destroyWeak(&v30);
  }
}

void __89__PKDashboardPaymentPassDataSource__messagesForPeerPaymentPendingRequestsWithCompletion___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained dismissPendingRequestDashboardMessageWithRequest:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

void __89__PKDashboardPaymentPassDataSource__messagesForPeerPaymentPendingRequestsWithCompletion___block_invoke_5(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  id v5 = WeakRetained;
  if (WeakRetained && !*((void *)WeakRetained + 89))
  {
    objc_storeStrong((id *)WeakRetained + 89, a1[4]);
    [v5 reloadMessages];
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F84D80]) initWithPeerPaymentWebService:v5[109]];
    uint64_t v7 = *MEMORY[0x1E4F87C98];
    id v8 = [a1[5] requestToken];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    id v11[2] = __89__PKDashboardPaymentPassDataSource__messagesForPeerPaymentPendingRequestsWithCompletion___block_invoke_6;
    v11[3] = &unk_1E59DA0A0;
    objc_copyWeak(&v15, a1 + 7);
    id v12 = a1[4];
    id v9 = a1[6];
    id v10 = a1[5];
    id v13 = v9;
    id v14 = v10;
    [v6 performPendingRequestAction:v7 withRequestToken:v8 completion:v11];

    objc_destroyWeak(&v15);
  }
}

void __89__PKDashboardPaymentPassDataSource__messagesForPeerPaymentPendingRequestsWithCompletion___block_invoke_6(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = (void *)*((void *)WeakRetained + 89);
    *((void *)WeakRetained + 89) = 0;

    [v8 reloadMessages];
    if (a2)
    {
      [v8 dismissPendingRequestDashboardMessageWithRequest:*(void *)(a1 + 48)];
    }
    else
    {
      id v10 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = [v6 localizedDescription];
        *(_DWORD *)buf = 138412290;
        uint64_t v19 = v11;
        _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "PKDashboardPaymentPassDataSource: Error attempting to reject pending request: %@", buf, 0xCu);
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __89__PKDashboardPaymentPassDataSource__messagesForPeerPaymentPendingRequestsWithCompletion___block_invoke_1436;
      block[3] = &unk_1E59DA078;
      id v13 = v6;
      objc_copyWeak(&v17, (id *)(a1 + 56));
      id v14 = *(id *)(a1 + 32);
      id v15 = *(id *)(a1 + 40);
      uint64_t v16 = v8;
      dispatch_async(MEMORY[0x1E4F14428], block);

      objc_destroyWeak(&v17);
    }
  }
}

void __89__PKDashboardPaymentPassDataSource__messagesForPeerPaymentPendingRequestsWithCompletion___block_invoke_1436(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = (void *)MEMORY[0x1E4FB1418];
  id v4 = [v2 objectForKey:*MEMORY[0x1E4F28588]];
  id v5 = [v2 objectForKey:*MEMORY[0x1E4F285A0]];
  id v6 = [v3 alertControllerWithTitle:v4 message:v5 preferredStyle:1];

  uint64_t v7 = (void *)MEMORY[0x1E4FB1410];
  id v8 = PKLocalizedString(&cfstr_OkButtonTitle.isa);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  id v12[2] = __89__PKDashboardPaymentPassDataSource__messagesForPeerPaymentPendingRequestsWithCompletion___block_invoke_2_1440;
  v12[3] = &unk_1E59DA050;
  objc_copyWeak(&v15, (id *)(a1 + 64));
  id v9 = v2;
  id v13 = v9;
  id v14 = *(id *)(a1 + 40);
  id v10 = [v7 actionWithTitle:v8 style:0 handler:v12];

  [v6 addAction:v10];
  id v11 = objc_msgSend(*(id *)(*(void *)(a1 + 56) + 8), "pkui_viewControllerFromResponderChain");
  [v11 presentViewController:v6 animated:1 completion:0];

  objc_destroyWeak(&v15);
}

void __89__PKDashboardPaymentPassDataSource__messagesForPeerPaymentPendingRequestsWithCompletion___block_invoke_2_1440(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x1E4F28A50]];
    id v4 = [v3 domain];
    int v5 = [v4 isEqualToString:*MEMORY[0x1E4F87CD8]];

    if (v5)
    {
      uint64_t v6 = [v3 code];
      if ((unint64_t)(v6 - 40314) <= 0x13 && ((1 << (v6 - 122)) & 0xC0003) != 0)
      {
        id v8 = [WeakRetained[109] peerPaymentService];
        v10[0] = *(void *)(a1 + 40);
        id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
        [v8 deletePeerPaymentPendingRequestsForRequestTokens:v9];
      }
    }
  }
}

- (void)_pendingRequestActionButtonPressedWithRequest:(id)a3
{
  id v4 = a3;
  int v5 = [v4 requestToken];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F84D80]) initWithPeerPaymentWebService:self->_peerPaymentWebService];
  uint64_t v7 = [PKPeerPaymentRemoteMessagesComposer alloc];
  id v8 = [(UIView *)self->_groupView pkui_viewControllerFromResponderChain];
  id v9 = [(PKPeerPaymentRemoteMessagesComposer *)v7 initWithPeerPaymentController:v6 presentingViewController:v8 actionType:1 sourceType:1];

  if (!self->_incomingRequestActionInProgressRequestToken)
  {
    objc_storeStrong((id *)&self->_incomingRequestActionInProgressRequestToken, v5);
    [(PKDashboardPaymentPassDataSource *)self reloadMessages];
    objc_initWeak(&location, self);
    id v10 = [v4 requesterAddress];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    id v11[2] = __82__PKDashboardPaymentPassDataSource__pendingRequestActionButtonPressedWithRequest___block_invoke;
    v11[3] = &unk_1E59CCC78;
    objc_copyWeak(&v14, &location);
    id v12 = v4;
    id v13 = v9;
    [(PKPeerPaymentRemoteMessagesComposer *)v13 validateRecipientWithAddress:v10 completion:v11];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __82__PKDashboardPaymentPassDataSource__pendingRequestActionButtonPressedWithRequest___block_invoke(id *a1, int a2)
{
  id v4 = a1 + 6;
  id WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      id v7 = objc_alloc(MEMORY[0x1E4F84DF8]);
      id v8 = [a1[4] requestToken];
      id v9 = (void *)[v7 initWithRequestToken:v8 deviceScoreIdentifier:0];

      id v10 = a1[5];
      id v11 = [a1[4] currencyAmount];
      id v12 = [a1[4] memo];
      id v13 = [a1[4] sessionID];
      id v14 = objc_msgSend(v6[1], "pkui_viewControllerFromResponderChain");
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __82__PKDashboardPaymentPassDataSource__pendingRequestActionButtonPressedWithRequest___block_invoke_2;
      v16[3] = &unk_1E59CCC78;
      objc_copyWeak(&v19, v4);
      id v17 = a1[5];
      id v18 = a1[4];
      [v10 presentRemoteMessageComposerWithAmount:v11 requestToken:v9 memo:v12 sessionID:v13 overViewController:v14 completion:v16];

      objc_destroyWeak(&v19);
    }
    else
    {
      id v15 = WeakRetained[89];
      WeakRetained[89] = 0;

      [v6 reloadMessages];
    }
  }
}

void __82__PKDashboardPaymentPassDataSource__pendingRequestActionButtonPressedWithRequest___block_invoke_2(uint64_t a1, int a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v5 = WeakRetained[89];
    WeakRetained[89] = 0;
    id v7 = WeakRetained;

    uint64_t v6 = objc_msgSend(v7[1], "pkui_viewControllerFromResponderChain");
    [v6 dismissViewControllerAnimated:1 completion:0];

    if (a2) {
      [v7 dismissPendingRequestDashboardMessageWithRequest:*(void *)(a1 + 40)];
    }
    else {
      [v7 reloadMessages];
    }
    id WeakRetained = v7;
  }
}

- (void)dismissPendingRequestDashboardMessageWithRequest:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  peerPaymentWebService = self->_peerPaymentWebService;
  id v4 = a3;
  id v5 = [(PKPeerPaymentWebService *)peerPaymentWebService peerPaymentService];
  uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
  [v4 setLastDismissedDate:v6];

  v8[0] = v4;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  [v5 insertOrUpdatePeerPaymentPendingRequests:v7 shouldScheduleNotifications:0];
}

- (id)_messageForSetUpVirtualCardWithFeatureIdentifier:(unint64_t)a3
{
  void v26[2] = *MEMORY[0x1E4F143B8];
  id v5 = PKDismissedKeyForPass();
  char BoolForKey = PKSharedCacheGetBoolForKey();

  if ((BoolForKey & 1) != 0
    || a3 == 1
    && (unint64_t)([(PKPeerPaymentAccount *)self->_peerPaymentAccount state] - 5) > 0xFFFFFFFFFFFFFFFDLL)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = objc_alloc_init(PKDashboardPassMessage);
    [(PKDashboardPassMessage *)v7 setType:0];
    [(PKDashboardPassMessage *)v7 setIdentifier:@"virtualCardSetUp"];
    if (a3 == 1)
    {
      id v8 = PKLocalizedCashVPANString(&cfstr_VirtualCardDas.isa);
      [(PKDashboardPassMessage *)v7 setTitle:v8];

      PKLocalizedCashVPANString(&cfstr_VirtualCardDas_0.isa);
    }
    else
    {
      id v9 = PKLocalizedVirtualCardString(&cfstr_VirtualCardDas_1.isa);
      [(PKDashboardPassMessage *)v7 setTitle:v9];

      PKLocalizedVirtualCardString(&cfstr_VirtualCardDas_2.isa);
    id v10 = };
    [(PKDashboardPassMessage *)v7 setMessage:v10];

    id v11 = PKLocalizedVirtualCardString(&cfstr_VirtualCardDas_3.isa);
    [(PKDashboardPassMessage *)v7 setButtonTitle:v11];

    id v12 = [(PKDashboardPaymentPassDataSource *)self _virtualCardDashboardImage];
    [(PKDashboardPassMessage *)v7 setImage:v12];

    uint64_t v13 = PKDefaultPaymentNetworkNameForPaymentPass();
    id v14 = (void *)v13;
    if (v13)
    {
      uint64_t v15 = *MEMORY[0x1E4F86C10];
      uint64_t v16 = *MEMORY[0x1E4F86860];
      v25[0] = *MEMORY[0x1E4F86120];
      v25[1] = v16;
      v26[0] = v15;
      v26[1] = v13;
      id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
      [(PKDashboardPassMessage *)v7 setAdditionalEventAnalyticsOnButtonPress:v17];
    }
    [(PKDashboardPassMessage *)v7 setReportToAnalytics:1];
    id v18 = [MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForPass:self->_pass];
    [(PKDashboardPassMessage *)v7 setAnalyticsReporterSubject:v18];

    objc_initWeak(&location, self);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __85__PKDashboardPaymentPassDataSource__messageForSetUpVirtualCardWithFeatureIdentifier___block_invoke;
    v22[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v23, &location);
    [(PKDashboardPassMessage *)v7 setActionOnButtonPress:v22];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    id v20[2] = __85__PKDashboardPaymentPassDataSource__messageForSetUpVirtualCardWithFeatureIdentifier___block_invoke_2;
    v20[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v21, &location);
    [(PKDashboardPassMessage *)v7 setActionOnDismiss:v20];
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __85__PKDashboardPaymentPassDataSource__messageForSetUpVirtualCardWithFeatureIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v1 = -[PKVirtualCardEnrollmentViewController initWithPaymentPass:context:delegate:]([PKVirtualCardEnrollmentViewController alloc], "initWithPaymentPass:context:delegate:", *((void *)WeakRetained + 110), 0);
    id v2 = [[PKNavigationController alloc] initWithRootViewController:v1];
    [(PKNavigationController *)v2 setModalPresentationStyle:2];
    id v3 = objc_msgSend(*((id *)WeakRetained + 1), "pkui_viewControllerFromResponderChain");
    [v3 presentViewController:v2 animated:1 completion:0];
  }
}

void __85__PKDashboardPaymentPassDataSource__messageForSetUpVirtualCardWithFeatureIdentifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = PKDismissedKeyForPass();
    PKSharedCacheSetBoolForKey();

    [v3 reloadMessages];
    id WeakRetained = v3;
  }
}

- (id)_messageForVirtualCardEnabledWithFeatureIdentifier:(unint64_t)a3
{
  id v5 = PKDismissedKeyForPass();
  char BoolForKey = PKSharedCacheGetBoolForKey();

  if ((BoolForKey & 1) != 0
    || a3 == 1
    && (unint64_t)([(PKPeerPaymentAccount *)self->_peerPaymentAccount state] - 5) > 0xFFFFFFFFFFFFFFFDLL)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = objc_alloc_init(PKDashboardPassMessage);
    [(PKDashboardPassMessage *)v7 setType:0];
    [(PKDashboardPassMessage *)v7 setIdentifier:@"virtualCardEnabled"];
    id v8 = PKLocalizedVirtualCardString(&cfstr_VirtualCardDas_4.isa);
    [(PKDashboardPassMessage *)v7 setTitle:v8];

    if (a3 == 1)
    {
      id v9 = PKLocalizedCashVPANString(&cfstr_VirtualCardDas_5.isa);
      id v10 = (void *)MEMORY[0x1E4F870E8];
    }
    else
    {
      id v9 = PKLocalizedVirtualCardString(&cfstr_VirtualCardDas_6.isa);
      id v10 = (void *)MEMORY[0x1E4F88078];
    }
    [(PKDashboardPassMessage *)v7 setMessage:v9];

    id v11 = [(PKDashboardPaymentPassDataSource *)self _virtualCardDashboardImage];
    [(PKDashboardPassMessage *)v7 setImage:v11];

    [(PKDashboardPassMessage *)v7 setReportToAnalytics:1];
    id v12 = [MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForPass:self->_pass];
    [(PKDashboardPassMessage *)v7 setAnalyticsReporterSubject:v12];

    uint64_t v13 = [MEMORY[0x1E4F1CB10] URLWithString:*v10];
    if (v13)
    {
      id v14 = PKLocalizedVirtualCardString(&cfstr_VirtualCardDas_7.isa);
      [(PKDashboardPassMessage *)v7 setButtonTitle:v14];

      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __87__PKDashboardPaymentPassDataSource__messageForVirtualCardEnabledWithFeatureIdentifier___block_invoke;
      v19[3] = &unk_1E59CA7D0;
      id v20 = v13;
      [(PKDashboardPassMessage *)v7 setActionOnButtonPress:v19];
    }
    objc_initWeak(&location, self);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __87__PKDashboardPaymentPassDataSource__messageForVirtualCardEnabledWithFeatureIdentifier___block_invoke_2;
    v16[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v17, &location);
    [(PKDashboardPassMessage *)v7 setActionOnDismiss:v16];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __87__PKDashboardPaymentPassDataSource__messageForVirtualCardEnabledWithFeatureIdentifier___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v2 openURL:*(void *)(a1 + 32) withOptions:0];
}

void __87__PKDashboardPaymentPassDataSource__messageForVirtualCardEnabledWithFeatureIdentifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = PKDismissedKeyForPass();
    PKSharedCacheSetBoolForKey();

    [v3 reloadMessages];
    id WeakRetained = v3;
  }
}

- (id)_virtualCardDashboardImage
{
  id v2 = [MEMORY[0x1E4FB1830] configurationWithPointSize:18.0];
  id v3 = [MEMORY[0x1E4FB1818] systemImageNamed:@"creditcard.and.123" withConfiguration:v2];
  id v4 = [MEMORY[0x1E4FB1618] labelColor];
  id v5 = [v3 imageWithTintColor:v4];

  uint64_t v6 = [MEMORY[0x1E4FB1E20] currentTraitCollection];
  if ([v6 userInterfaceStyle] == 2) {
    [MEMORY[0x1E4FB1618] systemGray4Color];
  }
  else {
  id v7 = [MEMORY[0x1E4FB1618] systemExtraLightGrayColor];
  }

  id v8 = PKUIImageWithBackground(v5, v7, 45.0, 45.0);

  return v8;
}

- (void)virtualCardEnrollmentViewController:(id)a3 didCompleteWithSuccess:(BOOL)a4
{
  id v4 = [a3 presentingViewController];
  [v4 dismissViewControllerAnimated:1 completion:0];
}

- (id)_messageFromEngagementMessage:(id)a3
{
  id v4 = a3;
  id v5 = [v4 localizedTitle];
  uint64_t v6 = [v4 localizedMessage];
  id v7 = (void *)v6;
  id v8 = 0;
  if (v5 && v6)
  {
    id v9 = objc_alloc_init(PKDashboardPassMessage);
    [(PKDashboardPassMessage *)v9 setType:1];
    id v10 = [v4 identifier];
    [(PKDashboardPassMessage *)v9 setIdentifier:v10];

    [(PKDashboardPassMessage *)v9 setTitle:v5];
    [(PKDashboardPassMessage *)v9 setMessage:v7];
    [(PKDashboardPassMessage *)v9 setReportToAnalytics:1];
    id v11 = [MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForPass:self->_pass];
    [(PKDashboardPassMessage *)v9 setAnalyticsReporterSubject:v11];

    id v8 = [(PKDashboardPaymentPassDataSource *)self _replaceDashboardMessagePlaceholders:v9];

    if (!v8)
    {
LABEL_30:

      goto LABEL_31;
    }
    objc_initWeak(location, self);
    id v12 = [v4 iconURLs];
    long long v31 = [v12 objectForKey:self->_scaleKey];
    uint64_t v13 = [v12 objectForKey:@"pdf"];
    BOOL v32 = [v12 objectForKey:@"png"];
    if (v13)
    {
      id v14 = @"pdf";
      uint64_t v15 = v13;
    }
    else
    {
      uint64_t v15 = v32;
      if (!v32)
      {
        if (v31)
        {
          id v23 = objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:");
          id v33 = [(PKDashboardPaymentPassDataSource *)self _downloadMessageIconURLAndReloadIfNecessary:v23];
        }
        else
        {
          id v33 = 0;
        }
        goto LABEL_9;
      }
      id v14 = @"png";
    }
    id v33 = [(PKDashboardPaymentPassDataSource *)self _messageImageWithName:v15 extension:v14];
LABEL_9:
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __66__PKDashboardPaymentPassDataSource__messageFromEngagementMessage___block_invoke;
    v53[3] = &unk_1E59CB010;
    objc_copyWeak(&v55, location);
    id v16 = v4;
    id v54 = v16;
    [v8 setActionOnViewed:v53];
    id v17 = [v16 action];
    id v18 = v17;
    if (v17)
    {
      uint64_t v19 = [v17 localizedTitle];
      uint64_t v20 = v19;
      if (v19)
      {
        uint64_t v30 = v19;
        if ([v18 type]) {
          [v8 setShowDisclosure:1];
        }
        uint64_t v20 = 4;
        switch([v18 type])
        {
          case 1:
            [v8 setButtonTitle:v30];
            v50[0] = MEMORY[0x1E4F143A8];
            v50[1] = 3221225472;
            void v50[2] = __66__PKDashboardPaymentPassDataSource__messageFromEngagementMessage___block_invoke_2;
            v50[3] = &unk_1E59CB010;
            id v21 = &v52;
            objc_copyWeak(&v52, location);
            id v51 = v16;
            [v8 setActionOnButtonPress:v50];
            uint64_t v22 = v51;
            goto LABEL_24;
          case 2:
            id v24 = [v18 actionInfo];
            uint64_t v25 = [v24 objectForKey:*MEMORY[0x1E4F87188]];

            id v29 = (void *)v25;
            [MEMORY[0x1E4F1CB10] URLWithString:v25];
            v26 = uint64_t v20 = v30;
            if (v26)
            {
              [v8 setButtonTitle:v30];
              v46[0] = MEMORY[0x1E4F143A8];
              v46[1] = 3221225472;
              id v46[2] = __66__PKDashboardPaymentPassDataSource__messageFromEngagementMessage___block_invoke_3;
              void v46[3] = &unk_1E59D1400;
              id v47 = v26;
              objc_copyWeak(&v49, location);
              id v48 = v16;
              [v8 setActionOnButtonPress:v46];

              objc_destroyWeak(&v49);
              uint64_t v20 = v30;
            }

            break;
          case 3:
            [v8 setButtonTitle:v30];
            v43[0] = MEMORY[0x1E4F143A8];
            v43[1] = 3221225472;
            v43[2] = __66__PKDashboardPaymentPassDataSource__messageFromEngagementMessage___block_invoke_4;
            v43[3] = &unk_1E59CB010;
            id v21 = &v45;
            objc_copyWeak(&v45, location);
            id v44 = v16;
            [v8 setActionOnButtonPress:v43];
            uint64_t v22 = v44;
            goto LABEL_24;
          case 4:
            [v8 setButtonTitle:v30];
            v37[0] = MEMORY[0x1E4F143A8];
            v37[1] = 3221225472;
            v37[2] = __66__PKDashboardPaymentPassDataSource__messageFromEngagementMessage___block_invoke_6;
            v37[3] = &unk_1E59CB010;
            id v21 = &v39;
            objc_copyWeak(&v39, location);
            id v38 = v16;
            [v8 setActionOnButtonPress:v37];
            uint64_t v22 = v38;
            goto LABEL_24;
          case 5:
            uint64_t v20 = 28;
            goto LABEL_23;
          case 6:
LABEL_23:
            [v8 setButtonTitle:v30];
            v40[0] = MEMORY[0x1E4F143A8];
            v40[1] = 3221225472;
            id v40[2] = __66__PKDashboardPaymentPassDataSource__messageFromEngagementMessage___block_invoke_5;
            v40[3] = &unk_1E59CFBA8;
            id v21 = v42;
            objc_copyWeak(v42, location);
            v42[1] = (id)v20;
            id v41 = v16;
            [v8 setActionOnButtonPress:v40];
            uint64_t v22 = v41;
LABEL_24:

            objc_destroyWeak(v21);
            uint64_t v20 = v30;
            break;
          default:
            break;
        }
      }
    }
    [v8 setImage:v33];
    if ([v16 type] == 3)
    {
      [v8 setActionOnDismiss:0];
    }
    else
    {
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      id v34[2] = __66__PKDashboardPaymentPassDataSource__messageFromEngagementMessage___block_invoke_7;
      v34[3] = &unk_1E59CB010;
      objc_copyWeak(&v36, location);
      id v35 = v16;
      [v8 setActionOnDismiss:v34];

      objc_destroyWeak(&v36);
    }
    id v27 = v8;

    objc_destroyWeak(&v55);
    objc_destroyWeak(location);
    goto LABEL_30;
  }
LABEL_31:

  return v8;
}

void __66__PKDashboardPaymentPassDataSource__messageFromEngagementMessage___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained reportDisplayedEngagementMessageIfNeeded:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

void __66__PKDashboardPaymentPassDataSource__messageFromEngagementMessage___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _presentPassDetailsWithAction:0];
    [v3 _updateDiscoveryEngagementMessageIfNeeded:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

void __66__PKDashboardPaymentPassDataSource__messageFromEngagementMessage___block_invoke_3(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v2 openSensitiveURL:*(void *)(a1 + 32) withOptions:0];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained _updateDiscoveryEngagementMessageIfNeeded:*(void *)(a1 + 40)];
    id WeakRetained = v4;
  }
}

void __66__PKDashboardPaymentPassDataSource__messageFromEngagementMessage___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _presentCardNumbers];
    [v3 _updateDiscoveryEngagementMessageIfNeeded:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

void __66__PKDashboardPaymentPassDataSource__messageFromEngagementMessage___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v2 = objc_alloc(MEMORY[0x1E4F84BB8]);
    id v3 = [MEMORY[0x1E4F84D50] sharedService];
    id v4 = (void *)[v2 initWithWebService:v3];

    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F841C8]) initWithAccount:*((void *)WeakRetained + 49)];
    uint64_t v6 = [[PKAccountFlowController alloc] initWithAccountCredential:v5 provisioningController:v4 setupDelegate:WeakRetained context:0 operations:*(void *)(a1 + 48)];
    id v7 = [(PKAccountFlowController *)v6 firstAccountViewController];
    id v8 = [[PKNavigationController alloc] initWithRootViewController:v7];
    id v9 = objc_msgSend(*((id *)WeakRetained + 1), "pkui_viewControllerFromResponderChain");
    [v9 presentViewController:v8 animated:1 completion:0];

    [WeakRetained _updateDiscoveryEngagementMessageIfNeeded:*(void *)(a1 + 32)];
  }
}

void __66__PKDashboardPaymentPassDataSource__messageFromEngagementMessage___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = (void *)*((void *)WeakRetained + 32);
    id v5 = WeakRetained;
    id v4 = [*((id *)WeakRetained + 110) uniqueID];
    [v3 setDefaultPaymentPassIdentifier:v4];

    [v5 _updateDiscoveryEngagementMessageIfNeeded:*(void *)(a1 + 32)];
    id WeakRetained = v5;
  }
}

void __66__PKDashboardPaymentPassDataSource__messageFromEngagementMessage___block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _updateDiscoveryEngagementMessageIfNeeded:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (id)_replaceDashboardMessagePlaceholders:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x1E4F87200];
  uint64_t v6 = [(PKAccount *)self->_account redeemRewardsFeatureDescriptor];
  id v7 = [v6 savingsAPY];

  if (v7)
  {
    id v8 = [(NSNumberFormatter *)self->_formatterPercentage stringFromNumber:v7];
  }
  else
  {
    id v8 = 0;
  }
  id v9 = [(PKDashboardPaymentPassDataSource *)self _replaceDashboardMessage:v4 placeholder:v5 replacement:v8];

  return v9;
}

- (id)_replaceDashboardMessage:(id)a3 placeholder:(id)a4 replacement:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v27 = a5;
  id v9 = [v7 dialogRequest];
  id v10 = [v7 title];
  id v11 = [v7 message];
  id v12 = [v9 title];
  uint64_t v13 = [v9 message];
  uint64_t v26 = v10;
  int v14 = [v10 containsString:v8];
  int v15 = [v11 containsString:v8];
  int v16 = [v12 containsString:v8];
  int v17 = [v13 containsString:v8];
  int v18 = v17;
  if ((v14 & 1) == 0 && (v15 & 1) == 0 && (v16 & 1) == 0 && !v17) {
    goto LABEL_11;
  }
  if (v27)
  {
    if (v14)
    {
      id v23 = [v26 stringByReplacingOccurrencesOfString:v8 withString:v27];
      [v7 setTitle:v23];

      if (!v15)
      {
LABEL_8:
        if (!v16) {
          goto LABEL_9;
        }
        goto LABEL_20;
      }
    }
    else if (!v15)
    {
      goto LABEL_8;
    }
    id v24 = [v11 stringByReplacingOccurrencesOfString:v8 withString:v27];
    [v7 setMessage:v24];

    if (!v16)
    {
LABEL_9:
      if (!v18)
      {
LABEL_11:
        id v20 = v7;
        goto LABEL_12;
      }
LABEL_10:
      uint64_t v19 = [v13 stringByReplacingOccurrencesOfString:v8 withString:v27];
      [v9 setMessage:v19];

      goto LABEL_11;
    }
LABEL_20:
    uint64_t v25 = [v12 stringByReplacingOccurrencesOfString:v8 withString:v27];
    [v9 setTitle:v25];

    if (!v18) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  uint64_t v22 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v29 = v8;
    _os_log_impl(&dword_19F450000, v22, OS_LOG_TYPE_DEFAULT, "Unavailable to replace placeholder '%@' for dashboard message", buf, 0xCu);
  }

  id v20 = 0;
LABEL_12:

  return v20;
}

- (void)_updateDiscoveryEngagementMessageIfNeeded:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = [MEMORY[0x1E4F84688] sharedInstance];
  uint64_t v6 = [v4 identifier];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  id v7[2] = __78__PKDashboardPaymentPassDataSource__updateDiscoveryEngagementMessageIfNeeded___block_invoke;
  v7[3] = &unk_1E59CB240;
  objc_copyWeak(&v8, &location);
  [v5 updateDiscoveryEngagementMessageWithIdentifier:v6 forAction:2 completion:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __78__PKDashboardPaymentPassDataSource__updateDiscoveryEngagementMessageIfNeeded___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained reloadMessages];
    id WeakRetained = v2;
  }
}

- (void)reportDisplayedEngagementMessageIfNeeded:(id)a3
{
  id obj = [a3 identifier];
  if (!-[NSString isEqualToString:](self->_lastReportedDiscoveryIdentifier, "isEqualToString:"))
  {
    id v4 = [MEMORY[0x1E4F84688] sharedInstance];
    [v4 displayedDiscoveryEngagementMessageWithIdentifier:obj];

    objc_storeStrong((id *)&self->_lastReportedDiscoveryIdentifier, obj);
  }
}

- (id)_messagesForInstallmentPlans
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  val = self;
  id v3 = [(PKAccount *)self->_account creditDetails];
  long long v31 = [v3 installmentPlans];

  if ([v31 count])
  {
    id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v37 = PKSharedCacheGetArrayForKey();
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id obj = v31;
    uint64_t v40 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
    if (!v40) {
      goto LABEL_29;
    }
    uint64_t v39 = *(void *)v50;
    uint64_t v32 = *MEMORY[0x1E4F1C318];
    while (1)
    {
      for (uint64_t i = 0; i != v40; ++i)
      {
        if (*(void *)v50 != v39) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        uint64_t v6 = [v5 identifier];
        uint64_t v7 = [v5 state];
        if (v7 == 2)
        {
          id v12 = [v5 payments];
          id v9 = [v12 firstObject];

          id v10 = [v9 statement];
          id v38 = [v5 product];
          id v11 = 0;
          if (v9)
          {
            id v41 = 0;
            id v8 = 0;
            if (v10)
            {
              if ([v9 isPaid] && !PKForceNewInstallmentDashboardModule())
              {
                id v11 = 0;
                id v41 = 0;
                id v8 = 0;
              }
              else
              {
                id v8 = [NSString stringWithFormat:@"%@-%@", @"installmentPlanPayment", v6];
                id v41 = PKLocalizedBeekmanString(&cfstr_AppleCardInsta.isa);
                uint64_t v13 = [v9 amountDue];
                int v14 = [v9 currencyCode];
                id v34 = PKCurrencyAmountCreate(v13, v14);

                int v15 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:v32];
                int v16 = [v10 closingDate];
                int v17 = [v15 components:8 fromDate:v16];
                [v17 month];

                PKGregorianMonthSpecificLocalizedStringKeyForKey();
                int v18 = (NSString *)objc_claimAutoreleasedReturnValue();
                uint64_t v19 = [v38 model];
                id v20 = [v34 formattedStringValue];
                id v11 = PKLocalizedBeekmanString(v18, &stru_1EF1B5770.isa, v19, v20);
              }
            }
          }
          else
          {
            id v41 = 0;
            id v8 = 0;
          }
        }
        else
        {
          if (v7 != 1)
          {
            id v8 = 0;
            id v41 = 0;
            id v11 = 0;
            goto LABEL_27;
          }
          id v8 = [NSString stringWithFormat:@"%@-%@", @"installmentPlanInitiated", v6];
          id v41 = PKLocalizedBeekmanString(&cfstr_AppleCardInsta.isa);
          id v9 = [v5 product];
          id v10 = [v9 model];
          id v11 = PKLocalizedBeekmanString(&cfstr_InstallmentAdd.isa, &stru_1EF1B4C70.isa, v10);
        }

        if (v8 && ([v37 containsObject:v8] & 1) == 0)
        {
          id v21 = objc_alloc_init(PKDashboardPassMessage);
          [(PKDashboardPassMessage *)v21 setIdentifier:v8];
          [(PKDashboardPassMessage *)v21 setShowDisclosure:1];
          [(PKDashboardPassMessage *)v21 setTitle:v41];
          [(PKDashboardPassMessage *)v21 setMessage:v11];
          uint64_t v22 = PKLocalizedBeekmanString(&cfstr_ViewInstallmen.isa);
          [(PKDashboardPassMessage *)v21 setButtonTitle:v22];

          id v23 = [v5 product];
          id v24 = [v23 iconURLForScale:0 suffix:PKUIScreenScale()];

          uint64_t v25 = [(PKDashboardPaymentPassDataSource *)val _downloadMessageIconURLAndReloadIfNecessary:v24];
          if (!v25)
          {
            uint64_t v26 = PKPassKitUIBundle();
            id v27 = [v26 URLForResource:@"InstallmentsFallback" withExtension:@"pdf"];

            if (v27)
            {
              double v28 = PKUIScreenScale();
              uint64_t v25 = PKUIImageFromPDF(v27, 45.0, 45.0, v28);
            }
            else
            {
              uint64_t v25 = 0;
            }
          }
          [(PKDashboardPassMessage *)v21 setImage:v25];
          objc_initWeak(&location, val);
          v46[0] = MEMORY[0x1E4F143A8];
          v46[1] = 3221225472;
          id v46[2] = __64__PKDashboardPaymentPassDataSource__messagesForInstallmentPlans__block_invoke;
          void v46[3] = &unk_1E59CB010;
          objc_copyWeak(&v47, &location);
          void v46[4] = v5;
          [(PKDashboardPassMessage *)v21 setActionOnButtonPress:v46];
          v42[0] = MEMORY[0x1E4F143A8];
          v42[1] = 3221225472;
          id v42[2] = __64__PKDashboardPaymentPassDataSource__messagesForInstallmentPlans__block_invoke_2;
          v42[3] = &unk_1E59CB378;
          objc_copyWeak(&v45, &location);
          id v8 = v8;
          id v43 = v8;
          id v44 = v37;
          [(PKDashboardPassMessage *)v21 setActionOnDismiss:v42];
          [v33 addObject:v21];

          objc_destroyWeak(&v45);
          objc_destroyWeak(&v47);
          objc_destroyWeak(&location);
        }
LABEL_27:
      }
      uint64_t v40 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
      if (!v40)
      {
LABEL_29:

        id v29 = (void *)[v33 copy];
        goto LABEL_31;
      }
    }
  }
  id v29 = 0;
LABEL_31:

  return v29;
}

void __64__PKDashboardPaymentPassDataSource__messagesForInstallmentPlans__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v2 = [[PKTransactionHistoryViewController alloc] initWithInstallmentPlan:*(void *)(a1 + 32) transactionSourceCollection:*((void *)WeakRetained + 6) familyCollection:*((void *)WeakRetained + 98) account:*((void *)WeakRetained + 49) accountUserCollection:*((void *)WeakRetained + 95) physicalCards:*((void *)WeakRetained + 97)];
    id v3 = objc_msgSend(*((id *)WeakRetained + 1), "pkui_viewControllerFromResponderChain");
    id v4 = [v3 navigationController];
    [v4 pushViewController:v2 animated:1];
  }
}

void __64__PKDashboardPaymentPassDataSource__messagesForInstallmentPlans__block_invoke_2(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (![*(id *)(a1 + 32) hasPrefix:@"installmentPlanPayment"]
    || (PKStoreDemoModeEnabled() & 1) == 0)
  {
    id v3 = *(void **)(a1 + 40);
    if (v3)
    {
      uint64_t v4 = [v3 arrayByAddingObject:*(void *)(a1 + 32)];
    }
    else
    {
      v6[0] = *(void *)(a1 + 32);
      uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
    }
    uint64_t v5 = (void *)v4;
    PKSharedCacheSetObjectForKey();
  }
  if (WeakRetained) {
    [WeakRetained reloadMessages];
  }
}

- (id)_peerPaymentAccountStatusMessage
{
  uint64_t v3 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount state];
  uint64_t v4 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount stateReason];
  if (v3 == 3 && v4 == 4)
  {
    id v9 = objc_alloc_init(PKDashboardPassMessage);
    [(PKDashboardPassMessage *)v9 setIdentifier:@"peerPaymentLockedAndInReview"];
    id v10 = PKDynamicLocalizedPeerPaymentString(&cfstr_PeerPaymentAcc_17.isa);
    [(PKDashboardPassMessage *)v9 setTitle:v10];

    id v11 = PKDynamicLocalizedPeerPaymentString(&cfstr_PeerPaymentAcc_18.isa);
    [(PKDashboardPassMessage *)v9 setMessage:v11];

    id v12 = PKDynamicLocalizedPeerPaymentString(&cfstr_PeerPaymentAcc_19.isa);
    [(PKDashboardPassMessage *)v9 setButtonTitle:v12];

    uint64_t v13 = [(PKDashboardPaymentPassDataSource *)self _messageImageWithName:@"MessageAlert" extension:@"pdf"];
    [(PKDashboardPassMessage *)v9 setImage:v13];

    int v14 = &__block_literal_global_1504;
  }
  else if (v3 == 2 && v4 == 5)
  {
    id v9 = objc_alloc_init(PKDashboardPassMessage);
    [(PKDashboardPassMessage *)v9 setIdentifier:@"peerPaymentRestrictedAndTerminal"];
    int v15 = PKDynamicLocalizedPeerPaymentString(&cfstr_PeerPaymentAcc_20.isa);
    [(PKDashboardPassMessage *)v9 setTitle:v15];

    int v16 = PKDynamicLocalizedPeerPaymentString(&cfstr_PeerPaymentAcc_21.isa);
    [(PKDashboardPassMessage *)v9 setMessage:v16];

    int v17 = PKDynamicLocalizedPeerPaymentString(&cfstr_PeerPaymentAcc_22.isa);
    [(PKDashboardPassMessage *)v9 setButtonTitle:v17];

    int v18 = [(PKDashboardPaymentPassDataSource *)self _messageImageWithName:@"MessageAlert" extension:@"pdf"];
    [(PKDashboardPassMessage *)v9 setImage:v18];

    int v14 = &__block_literal_global_1518;
  }
  else if (v3 == 3 && v4 == 5)
  {
    id v9 = objc_alloc_init(PKDashboardPassMessage);
    [(PKDashboardPassMessage *)v9 setIdentifier:@"peerPaymentLockedAndTerminal"];
    uint64_t v19 = PKDynamicLocalizedPeerPaymentString(&cfstr_PeerPaymentAcc_23.isa);
    [(PKDashboardPassMessage *)v9 setTitle:v19];

    id v20 = PKDynamicLocalizedPeerPaymentString(&cfstr_PeerPaymentAcc_24.isa);
    [(PKDashboardPassMessage *)v9 setMessage:v20];

    id v21 = PKDynamicLocalizedPeerPaymentString(&cfstr_PeerPaymentAcc_25.isa);
    [(PKDashboardPassMessage *)v9 setButtonTitle:v21];

    uint64_t v22 = [(PKDashboardPaymentPassDataSource *)self _messageImageWithName:@"MessageAlert" extension:@"pdf"];
    [(PKDashboardPassMessage *)v9 setImage:v22];

    int v14 = &__block_literal_global_1532;
  }
  else
  {
    if (v3 != 2 || v4 != 4)
    {
      id v9 = 0;
      goto LABEL_23;
    }
    id v9 = objc_alloc_init(PKDashboardPassMessage);
    [(PKDashboardPassMessage *)v9 setIdentifier:@"peerPaymentRestrictedAndInReview"];
    id v23 = PKDynamicLocalizedPeerPaymentString(&cfstr_PeerPaymentAcc_26.isa);
    [(PKDashboardPassMessage *)v9 setTitle:v23];

    id v24 = PKDynamicLocalizedPeerPaymentString(&cfstr_PeerPaymentAcc_27.isa);
    [(PKDashboardPassMessage *)v9 setMessage:v24];

    uint64_t v25 = PKDynamicLocalizedPeerPaymentString(&cfstr_PeerPaymentAcc_28.isa);
    [(PKDashboardPassMessage *)v9 setButtonTitle:v25];

    uint64_t v26 = [(PKDashboardPaymentPassDataSource *)self _messageImageWithName:@"MessageAlert" extension:@"pdf"];
    [(PKDashboardPassMessage *)v9 setImage:v26];

    int v14 = &__block_literal_global_1546;
  }
  [(PKDashboardPassMessage *)v9 setActionOnButtonPress:v14];
LABEL_23:

  return v9;
}

void __68__PKDashboardPaymentPassDataSource__peerPaymentAccountStatusMessage__block_invoke()
{
  [MEMORY[0x1E4F1CB10] URLWithString:@"https://support.apple.com/ht207932?cid=mc-ols-applecash-article_ht207932-ios_ui-03042022#inreview"];
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v0 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v0 openSensitiveURL:v1 withOptions:0];
}

void __68__PKDashboardPaymentPassDataSource__peerPaymentAccountStatusMessage__block_invoke_2()
{
  [MEMORY[0x1E4F1CB10] URLWithString:@"https://support.apple.com/ht207932?cid=mc-ols-applecash-article_ht207932-ios_ui-03102022#restricted"];
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v0 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v0 openSensitiveURL:v1 withOptions:0];
}

void __68__PKDashboardPaymentPassDataSource__peerPaymentAccountStatusMessage__block_invoke_3()
{
  [MEMORY[0x1E4F1CB10] URLWithString:@"https://support.apple.com/ht207932?cid=mc-ols-applecash-article_ht207932-ios_ui-03102022#locked"];
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v0 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v0 openSensitiveURL:v1 withOptions:0];
}

void __68__PKDashboardPaymentPassDataSource__peerPaymentAccountStatusMessage__block_invoke_4()
{
  [MEMORY[0x1E4F1CB10] URLWithString:@"https://support.apple.com/ht207932?cid=mc-ols-applecash-article_ht207932-ios_ui-03042022#inreview"];
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v0 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v0 openSensitiveURL:v1 withOptions:0];
}

- (id)_messageForAMPEnrollment
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v3 = objc_alloc_init(PKDashboardPassMessage);
  [(PKDashboardPassMessage *)v3 setIdentifier:@"ampEnrollment"];
  uint64_t v4 = [MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForPass:self->_pass];
  [(PKDashboardPassMessage *)v3 setAnalyticsReporterSubject:v4];

  [(PKDashboardPassMessage *)v3 setShowDisclosure:1];
  [(PKDashboardPassMessage *)v3 setShowSpinner:self->_performingAMPEnrollment];
  uint64_t v5 = [(PKPaymentPass *)self->_pass localizedDescription];
  uint64_t v6 = PKLocalizedAMPString(&cfstr_PassDashboardA.isa, &stru_1EF1B4C70.isa, v5);
  [(PKDashboardPassMessage *)v3 setTitle:v6];

  uint64_t v7 = PKLocalizedAMPString(&cfstr_PassDashboardA_0.isa);
  [(PKDashboardPassMessage *)v3 setMessage:v7];

  id v8 = PKLocalizedAMPString(&cfstr_PassDashboardA_1.isa);
  [(PKDashboardPassMessage *)v3 setButtonTitle:v8];

  [(PKDashboardPassMessage *)v3 setImage:self->_AMPEnrollmentIcon];
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  id v12[2] = __60__PKDashboardPaymentPassDataSource__messageForAMPEnrollment__block_invoke;
  v12[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v13, &location);
  [(PKDashboardPassMessage *)v3 setActionOnButtonPress:v12];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __60__PKDashboardPaymentPassDataSource__messageForAMPEnrollment__block_invoke_2;
  id v10[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v11, &location);
  [(PKDashboardPassMessage *)v3 setActionOnDismiss:v10];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v3;
}

void __60__PKDashboardPaymentPassDataSource__messageForAMPEnrollment__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _addToAMPButtonTappedForPass:WeakRetained[110]];
    id WeakRetained = v2;
  }
}

void __60__PKDashboardPaymentPassDataSource__messageForAMPEnrollment__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[576] = 0;
    id v3 = WeakRetained;
    id v2 = AMPEnrollmentDismissedKeyForPass();
    PKSharedCacheSetBoolForKey();

    [v3 reloadMessages];
    id WeakRetained = v3;
  }
}

- (id)_messagesForAccountUserInvitations
{
  uint64_t v143 = *MEMORY[0x1E4F143B8];
  if (self->_accountUsersLoaded
    && self->_accountUserInvitationsLoaded
    && self->_familyCollectionLoaded
    && self->_account)
  {
    uint64_t v80 = [(PKPaymentPass *)self->_pass uniqueID];
    id v85 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    int v81 = [(PKAccountUserCollection *)self->_accountUserCollection accountUsersExcludingCurrentAccountUser];
    accountUserInvitations = self->_accountUserInvitations;
    v139[0] = MEMORY[0x1E4F143A8];
    v139[1] = 3221225472;
    v139[2] = __70__PKDashboardPaymentPassDataSource__messagesForAccountUserInvitations__block_invoke;
    v139[3] = &unk_1E59DA0F0;
    void v139[4] = self;
    uint64_t v82 = [(NSArray *)accountUserInvitations pk_objectsPassingTest:v139];
    uint64_t v133 = 0;
    id v134 = &v133;
    uint64_t v135 = 0x3032000000;
    long long v136 = __Block_byref_object_copy__42;
    long long v137 = __Block_byref_object_dispose__42;
    PKSharedCacheGetArrayForKey();
    id v138 = (id)objc_claimAutoreleasedReturnValue();
    if (![v81 count]
      && ![v82 count]
      && +[PKAccountInvitationController canInviteAccountUserWithAccount:](PKAccountInvitationController, "canInviteAccountUserWithAccount:", self->_account)&& ([(id)v134[5] containsObject:v80] & 1) == 0)
    {
      id v3 = objc_alloc_init(PKDashboardPassMessage);
      [(PKDashboardPassMessage *)v3 setIdentifier:@"createAccountUserInvitationPrompt"];
      [(PKDashboardPassMessage *)v3 setShowDisclosure:1];
      uint64_t v4 = PKLocalizedMadisonString(&cfstr_StartSharingDa.isa);
      [(PKDashboardPassMessage *)v3 setTitle:v4];

      uint64_t v5 = PKLocalizedMadisonString(&cfstr_StartSharingDa_0.isa);
      [(PKDashboardPassMessage *)v3 setMessage:v5];

      uint64_t v6 = PKLocalizedMadisonString(&cfstr_StartSharingDa_1.isa);
      [(PKDashboardPassMessage *)v3 setButtonTitle:v6];

      uint64_t v7 = PKDashboardMessagePassIcon(self->_pass);
      [(PKDashboardPassMessage *)v3 setImage:v7];

      [(PKDashboardPassMessage *)v3 setReportToAnalytics:1];
      id v8 = [MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForPass:self->_pass];
      [(PKDashboardPassMessage *)v3 setAnalyticsReporterSubject:v8];

      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v10 = [MEMORY[0x1E4F841A8] analyticsAccountTypeForAccount:self->_account];
      if (v10) {
        [v9 setObject:v10 forKey:*MEMORY[0x1E4F86310]];
      }
      id v11 = (void *)[v9 copy];
      [(PKDashboardPassMessage *)v3 setAdditionalEventAnalyticsOnButtonPress:v11];

      objc_initWeak(&location, self);
      v131[0] = MEMORY[0x1E4F143A8];
      v131[1] = 3221225472;
      v131[2] = __70__PKDashboardPaymentPassDataSource__messagesForAccountUserInvitations__block_invoke_2;
      v131[3] = &unk_1E59CA7F8;
      objc_copyWeak(&v132, &location);
      [(PKDashboardPassMessage *)v3 setActionOnButtonPress:v131];
      v127[0] = MEMORY[0x1E4F143A8];
      v127[1] = 3221225472;
      v127[2] = __70__PKDashboardPaymentPassDataSource__messagesForAccountUserInvitations__block_invoke_3;
      v127[3] = &unk_1E59D4EC0;
      objc_copyWeak(&v130, &location);
      id v129 = &v133;
      id v128 = v80;
      [(PKDashboardPassMessage *)v3 setActionOnDismiss:v127];
      [v85 addObject:v3];

      objc_destroyWeak(&v130);
      objc_destroyWeak(&v132);
      objc_destroyWeak(&location);
    }
    id v12 = objc_msgSend(v82, "pk_objectsPassingTest:", &__block_literal_global_1568);
    long long v125 = 0u;
    long long v126 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    id obj = v12;
    uint64_t v13 = [obj countByEnumeratingWithState:&v123 objects:v142 count:16];
    if (v13)
    {
      uint64_t v89 = *(void *)v124;
      do
      {
        uint64_t v92 = v13;
        for (uint64_t i = 0; i != v92; ++i)
        {
          if (*(void *)v124 != v89) {
            objc_enumerationMutation(obj);
          }
          int v15 = *(void **)(*((void *)&v123 + 1) + 8 * i);
          int v16 = [v15 applicationIdentifier];
          id location = 0;
          p_id location = &location;
          uint64_t v119 = 0x3032000000;
          uint64_t v120 = __Block_byref_object_copy__42;
          id v121 = __Block_byref_object_dispose__42;
          PKSharedCacheGetArrayForKey();
          id v122 = (id)objc_claimAutoreleasedReturnValue();
          if (([p_location[5] containsObject:v16] & 1) == 0)
          {
            int v17 = [v15 invitationDetails];
            int v18 = [v17 accountUserAltDSID];

            uint64_t v19 = [(PKAccountUserCollection *)self->_accountUserCollection accountUserWithAltDSID:v18];
            id v20 = v19;
            if (v19)
            {
              [v19 accountState];
              if ((PKAccountStateIsTerminal() & 1) == 0)
              {
                id v21 = [(PKFamilyMemberCollection *)self->_familyCollection familyMembersByAltDSID];
                uint64_t v22 = [v20 altDSID];
                id v23 = [v21 objectForKey:v22];

                id v24 = (void *)MEMORY[0x1E4F845E8];
                uint64_t v25 = [v20 nameComponents];
                uint64_t v26 = [v24 contactForFamilyMember:v23 nameComponents:v25 imageData:0];

                id v27 = [v26 givenName];
                double v28 = [v15 invitationDetails];
                uint64_t v29 = [v28 accountUserAccessLevel];
                BOOL v30 = v29 == 1;

                long long v31 = objc_alloc_init(PKDashboardPassMessage);
                [(PKDashboardPassMessage *)v31 setIdentifier:v16];
                if (v29 == 1)
                {
                  uint64_t v32 = PKLocalizedMadisonString(&cfstr_OwnerDashboard.isa);
                  [(PKDashboardPassMessage *)v31 setTitle:v32];

                  id v33 = PKLocalizedMadisonString(&cfstr_OwnerDashboard_0.isa, &stru_1EF1B4C70.isa, v27);
                  [(PKDashboardPassMessage *)v31 setMessage:v33];

                  PKLocalizedMadisonString(&cfstr_OwnerDashboard_1.isa);
                }
                else
                {
                  id v35 = PKLocalizedMadisonString(&cfstr_OwnerDashboard_2.isa);
                  [(PKDashboardPassMessage *)v31 setTitle:v35];

                  id v36 = PKLocalizedMadisonString(&cfstr_OwnerDashboard_3.isa, &stru_1EF1B4C70.isa, v27);
                  [(PKDashboardPassMessage *)v31 setMessage:v36];

                  PKLocalizedMadisonString(&cfstr_OwnerDashboard_4.isa, &stru_1EF1B4C70.isa, v27);
                id v34 = };
                [(PKDashboardPassMessage *)v31 setButtonTitle:v34];

                [(PKDashboardPassMessage *)v31 setShowDisclosure:1];
                uint64_t v37 = PKDashboardMessagePassIcon(self->_pass);
                [(PKDashboardPassMessage *)v31 setImage:v37];

                [(PKDashboardPassMessage *)v31 setReportToAnalytics:1];
                id v38 = [MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForPass:self->_pass];
                [(PKDashboardPassMessage *)v31 setAnalyticsReporterSubject:v38];

                objc_initWeak(&from, self);
                v112[0] = MEMORY[0x1E4F143A8];
                v112[1] = 3221225472;
                v112[2] = __70__PKDashboardPaymentPassDataSource__messagesForAccountUserInvitations__block_invoke_5;
                v112[3] = &unk_1E59CFB30;
                objc_copyWeak(&v114, &from);
                BOOL v115 = v30;
                id v113 = v20;
                [(PKDashboardPassMessage *)v31 setActionOnButtonPress:v112];
                v108[0] = MEMORY[0x1E4F143A8];
                v108[1] = 3221225472;
                v108[2] = __70__PKDashboardPaymentPassDataSource__messagesForAccountUserInvitations__block_invoke_6;
                v108[3] = &unk_1E59D4EC0;
                objc_copyWeak(&v111, &from);
                id v110 = &location;
                id v109 = v16;
                [(PKDashboardPassMessage *)v31 setActionOnDismiss:v108];
                [v85 addObject:v31];

                objc_destroyWeak(&v111);
                objc_destroyWeak(&v114);
                objc_destroyWeak(&from);
              }
            }
          }
          _Block_object_dispose(&location, 8);
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v123 objects:v142 count:16];
      }
      while (v13);
    }

    objc_msgSend(v82, "pk_objectsPassingTest:", &__block_literal_global_1588);
    long long v106 = 0u;
    long long v107 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    id v86 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v39 = [v86 countByEnumeratingWithState:&v104 objects:v141 count:16];
    if (v39)
    {
      uint64_t v87 = *(void *)v105;
      do
      {
        uint64_t v93 = v39;
        for (uint64_t j = 0; j != v93; ++j)
        {
          if (*(void *)v105 != v87) {
            objc_enumerationMutation(v86);
          }
          id v41 = *(void **)(*((void *)&v104 + 1) + 8 * j);
          id v42 = [v41 applicationIdentifier];
          id v43 = [v41 invitationDetails];
          id v44 = [v43 accountUserAltDSID];
          id v45 = [(PKAccountUserCollection *)self->_accountUserCollection accountUserWithAltDSID:v44];
          id v46 = v45;
          if (!v45 || ([v45 accountState], (PKAccountStateIsTerminal() & 1) == 0))
          {
            if ([v43 accountUserAccessLevel] == 1)
            {
              id v47 = [(PKFamilyMemberCollection *)self->_familyCollection familyMembersByAltDSID];
              uint64_t v90 = [v47 objectForKey:v44];

              id v48 = (void *)MEMORY[0x1E4F845E8];
              long long v49 = [v46 nameComponents];
              long long v50 = [v48 contactForFamilyMember:v90 nameComponents:v49 imageData:0];

              long long v51 = [v50 givenName];
              long long v52 = objc_alloc_init(PKDashboardPassMessage);
              [(PKDashboardPassMessage *)v52 setIdentifier:v42];
              long long v53 = PKLocalizedMadisonString(&cfstr_AccountUserJoi.isa);
              [(PKDashboardPassMessage *)v52 setTitle:v53];

              uint64_t v54 = PKLocalizedMadisonString(&cfstr_AccountUserJoi_0.isa, &stru_1EF1B4C70.isa, v51);
              [(PKDashboardPassMessage *)v52 setMessage:v54];

              id v55 = PKLocalizedMadisonString(&cfstr_AccountUserJoi_1.isa);
              [(PKDashboardPassMessage *)v52 setButtonTitle:v55];

              [(PKDashboardPassMessage *)v52 setShowDisclosure:1];
              id v56 = PKDashboardMessagePassIcon(self->_pass);
              [(PKDashboardPassMessage *)v52 setImage:v56];

              [(PKDashboardPassMessage *)v52 setReportToAnalytics:1];
              id v57 = [MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForPass:self->_pass];
              [(PKDashboardPassMessage *)v52 setAnalyticsReporterSubject:v57];

              objc_initWeak(&location, self);
              v102[0] = MEMORY[0x1E4F143A8];
              v102[1] = 3221225472;
              v102[2] = __70__PKDashboardPaymentPassDataSource__messagesForAccountUserInvitations__block_invoke_8;
              v102[3] = &unk_1E59CB010;
              objc_copyWeak(&v103, &location);
              v102[4] = v41;
              [(PKDashboardPassMessage *)v52 setActionOnButtonPress:v102];
              [v85 addObject:v52];
              objc_destroyWeak(&v103);
              objc_destroyWeak(&location);
            }
          }
        }
        uint64_t v39 = [v86 countByEnumeratingWithState:&v104 objects:v141 count:16];
      }
      while (v39);
    }

    id v58 = [(PKInboxDataSource *)self->_inboxDataSource activeInboxMessages];
    id v59 = objc_msgSend(v58, "pk_objectsPassingTest:", &__block_literal_global_1600);

    long long v100 = 0u;
    long long v101 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    to = v59;
    uint64_t v60 = [to countByEnumeratingWithState:&v98 objects:v140 count:16];
    if (v60)
    {
      uint64_t v88 = *(void *)v99;
      do
      {
        uint64_t v91 = v60;
        for (uint64_t k = 0; k != v91; ++k)
        {
          if (*(void *)v99 != v88) {
            objc_enumerationMutation(to);
          }
          long long v62 = *(void **)(*((void *)&v98 + 1) + 8 * k);
          long long v63 = [v62 accountUserInvitation];
          uint64_t v64 = [v63 feature];
          if (v64 == [(PKAccount *)self->_account feature])
          {
            uint64_t v94 = [v63 applicationIdentifier];
            long long v65 = [v63 invitationDetails];
            long long v66 = [v65 originatorAltDSID];
            long long v67 = [(PKFamilyMemberCollection *)self->_familyCollection familyMemberForAltDSID:v66];
            v68 = (void *)MEMORY[0x1E4F845E8];
            uint64_t v69 = [v65 originatorNameComponents];
            v70 = [v68 contactForFamilyMember:v67 nameComponents:v69 imageData:0];

            uint64_t v71 = objc_alloc_init(PKDashboardPassMessage);
            [(PKDashboardPassMessage *)v71 setIdentifier:v94];
            uint64_t v72 = PKLocalizedMadisonString(&cfstr_NewOwnerInvita.isa);
            [(PKDashboardPassMessage *)v71 setTitle:v72];

            double v73 = [v70 givenName];
            id v74 = PKLocalizedMadisonString(&cfstr_NewOwnerInvita_0.isa, &stru_1EF1B4C70.isa, v73);
            [(PKDashboardPassMessage *)v71 setMessage:v74];

            uint64_t v75 = PKLocalizedMadisonString(&cfstr_NewOwnerInvita_1.isa);
            [(PKDashboardPassMessage *)v71 setButtonTitle:v75];

            [(PKDashboardPassMessage *)v71 setShowDisclosure:1];
            uint64_t v76 = PKDashboardMessagePassIcon(self->_pass);
            [(PKDashboardPassMessage *)v71 setImage:v76];

            [(PKDashboardPassMessage *)v71 setReportToAnalytics:1];
            uint64_t v77 = [MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForPass:self->_pass];
            [(PKDashboardPassMessage *)v71 setAnalyticsReporterSubject:v77];

            objc_initWeak(&location, self);
            v96[0] = MEMORY[0x1E4F143A8];
            v96[1] = 3221225472;
            v96[2] = __70__PKDashboardPaymentPassDataSource__messagesForAccountUserInvitations__block_invoke_10;
            v96[3] = &unk_1E59CB010;
            objc_copyWeak(&v97, &location);
            v96[4] = v62;
            [(PKDashboardPassMessage *)v71 setActionOnButtonPress:v96];
            [v85 addObject:v71];
            objc_destroyWeak(&v97);
            objc_destroyWeak(&location);
          }
        }
        uint64_t v60 = [to countByEnumeratingWithState:&v98 objects:v140 count:16];
      }
      while (v60);
    }

    if ([v85 count]) {
      uint64_t v78 = (void *)[v85 copy];
    }
    else {
      uint64_t v78 = 0;
    }

    _Block_object_dispose(&v133, 8);
  }
  else
  {
    uint64_t v78 = 0;
  }

  return v78;
}

BOOL __70__PKDashboardPaymentPassDataSource__messagesForAccountUserInvitations__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 applicationState];
  uint64_t v5 = [v3 invitationDetails];

  uint64_t v6 = [v5 originatorAltDSID];
  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 784) currentUserAltDSID];
  id v8 = v6;
  id v9 = v7;
  id v10 = v9;
  if (v8 == v9)
  {
  }
  else
  {
    if (!v8 || !v9)
    {

LABEL_14:
      BOOL v13 = 0;
      goto LABEL_15;
    }
    int v11 = [v8 isEqualToString:v9];

    if (!v11) {
      goto LABEL_14;
    }
  }
  BOOL v13 = v4 != 4 && v4 != 1;
LABEL_15:

  return v13;
}

void __70__PKDashboardPaymentPassDataSource__messagesForAccountUserInvitations__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _presentCreateAccountUserInvitation];
    id WeakRetained = v2;
  }
}

void __70__PKDashboardPaymentPassDataSource__messagesForAccountUserInvitations__block_invoke_3(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v3)
    {
      uint64_t v4 = [v3 arrayByAddingObject:*(void *)(a1 + 32)];
    }
    else
    {
      v6[0] = *(void *)(a1 + 32);
      uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
    }
    uint64_t v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v4);

    PKSharedCacheSetObjectForKey();
    [WeakRetained reloadMessages];
  }
}

BOOL __70__PKDashboardPaymentPassDataSource__messagesForAccountUserInvitations__block_invoke_4(uint64_t a1, void *a2)
{
  return ([a2 applicationState] & 0xFFFFFFFFFFFFFFFELL) == 8;
}

void __70__PKDashboardPaymentPassDataSource__messagesForAccountUserInvitations__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained reloadMessages];
    if (*(unsigned char *)(a1 + 48)) {
      [v3 _presentPassDetailsWithAction:0];
    }
    else {
      [v3 _presentAccountUserDetails:*(void *)(a1 + 32)];
    }
    id WeakRetained = v3;
  }
}

void __70__PKDashboardPaymentPassDataSource__messagesForAccountUserInvitations__block_invoke_6(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v3)
    {
      uint64_t v4 = [v3 arrayByAddingObject:*(void *)(a1 + 32)];
    }
    else
    {
      v6[0] = *(void *)(a1 + 32);
      uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
    }
    uint64_t v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v4);

    PKSharedCacheSetObjectForKey();
    [WeakRetained reloadMessages];
  }
}

BOOL __70__PKDashboardPaymentPassDataSource__messagesForAccountUserInvitations__block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 applicationState] == 6;
}

void __70__PKDashboardPaymentPassDataSource__messagesForAccountUserInvitations__block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _presentAccountUserInvitation:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

BOOL __70__PKDashboardPaymentPassDataSource__messagesForAccountUserInvitations__block_invoke_9(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 type])
  {
    BOOL v3 = 0;
  }
  else
  {
    uint64_t v4 = [v2 accountUserInvitation];
    uint64_t v5 = [v4 invitationDetails];
    BOOL v3 = [v5 accountUserAccessLevel] == 1;
  }
  return v3;
}

void __70__PKDashboardPaymentPassDataSource__messagesForAccountUserInvitations__block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _presentInboxMessage:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (id)_messagesForAccountUserSetupCashForFamily
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  if (self->_accountUsersLoaded
    && (peerPaymentAccount = self->_peerPaymentAccount) != 0
    && self->_familyCollectionLoaded
    && [(PKPeerPaymentAccount *)peerPaymentAccount supportsFamilySharing]
    && [(PKPeerPaymentAccount *)self->_peerPaymentAccount role] != 1
    && ([(PKFamilyMemberCollection *)self->_familyCollection currentUser],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 isOrganizer],
        v4,
        v5))
  {
    uint64_t v6 = [MEMORY[0x1E4F84898] sharedInstance];
    uint64_t v7 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount associatedPassUniqueID];
    id v8 = [v6 passWithUniqueID:v7];
    double v28 = [v8 paymentPass];

    if (v28)
    {
      id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [(PKAccountUserCollection *)self->_accountUserCollection accountUsersExcludingCurrentAccountUser];
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = [obj countByEnumeratingWithState:&v53 objects:v57 count:16];
      if (v9)
      {
        uint64_t v32 = *(void *)v54;
        uint64_t v26 = v34;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v54 != v32) {
              objc_enumerationMutation(obj);
            }
            int v11 = *(void **)(*((void *)&v53 + 1) + 8 * i);
            id v12 = [v11 altDSID];
            uint64_t v47 = 0;
            id v48 = &v47;
            uint64_t v49 = 0x3032000000;
            long long v50 = __Block_byref_object_copy__42;
            long long v51 = __Block_byref_object_dispose__42;
            id v52 = [(PKFamilyMemberCollection *)self->_familyCollection familyMemberForAltDSID:v12];
            BOOL v13 = (void *)v48[5];
            if (v13 && [v13 memberType] && objc_msgSend((id)v48[5], "memberType") != -1)
            {
              uint64_t v41 = 0;
              id v42 = &v41;
              uint64_t v43 = 0x3032000000;
              id v44 = __Block_byref_object_copy__42;
              id v45 = __Block_byref_object_dispose__42;
              PKSharedCacheGetArrayForKey();
              id v46 = (id)objc_claimAutoreleasedReturnValue();
              if (([(id)v42[5] containsObject:v12] & 1) == 0)
              {
                int v14 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount peerPaymentAccountWithAltDSID:v12];
                if (!v14)
                {
                  int v15 = (void *)MEMORY[0x1E4F845E8];
                  uint64_t v16 = v48[5];
                  int v17 = [v11 nameComponents];
                  BOOL v30 = [v15 contactForFamilyMember:v16 nameComponents:v17 imageData:0];

                  int v18 = [v30 givenName];
                  uint64_t v19 = objc_alloc_init(PKDashboardPassMessage);
                  uint64_t v29 = [NSString stringWithFormat:@"%@-%@", @"accountUserSetupCashForFamily", v12, v26];
                  [(PKDashboardPassMessage *)v19 setIdentifier:v29];
                  [(PKDashboardPassMessage *)v19 setShowDisclosure:1];
                  id v20 = PKLocalizedMadisonString(&cfstr_SetupAppleCash.isa, &stru_1EF1B4C70.isa, v18);
                  [(PKDashboardPassMessage *)v19 setTitle:v20];

                  id v21 = PKLocalizedMadisonString(&cfstr_SetupAppleCash_0.isa, &stru_1EF1B4C70.isa, v18);
                  [(PKDashboardPassMessage *)v19 setMessage:v21];

                  uint64_t v22 = PKLocalizedMadisonString(&cfstr_SetupAppleCash_1.isa, &stru_1EF1B4C70.isa, v18);
                  [(PKDashboardPassMessage *)v19 setButtonTitle:v22];

                  id v23 = PKDashboardMessagePassIcon(v28);
                  [(PKDashboardPassMessage *)v19 setImage:v23];

                  objc_initWeak(&location, self);
                  v38[0] = MEMORY[0x1E4F143A8];
                  v38[1] = 3221225472;
                  v38[2] = __77__PKDashboardPaymentPassDataSource__messagesForAccountUserSetupCashForFamily__block_invoke;
                  v38[3] = &unk_1E59D8BD0;
                  objc_copyWeak(&v39, &location);
                  v38[4] = &v47;
                  [(PKDashboardPassMessage *)v19 setActionOnButtonPress:v38];
                  v33[0] = MEMORY[0x1E4F143A8];
                  v33[1] = 3221225472;
                  v34[0] = __77__PKDashboardPaymentPassDataSource__messagesForAccountUserSetupCashForFamily__block_invoke_2;
                  v34[1] = &unk_1E59D4EC0;
                  objc_copyWeak(&v37, &location);
                  id v36 = &v41;
                  id v35 = v12;
                  [(PKDashboardPassMessage *)v19 setActionOnDismiss:v33];
                  [v27 addObject:v19];

                  objc_destroyWeak(&v37);
                  objc_destroyWeak(&v39);
                  objc_destroyWeak(&location);
                }
              }
              _Block_object_dispose(&v41, 8);
            }
            _Block_object_dispose(&v47, 8);
          }
          uint64_t v9 = [obj countByEnumeratingWithState:&v53 objects:v57 count:16];
        }
        while (v9);
      }

      if ([v27 count]) {
        id v24 = (void *)[v27 copy];
      }
      else {
        id v24 = 0;
      }
    }
    else
    {
      id v24 = 0;
    }
  }
  else
  {
    id v24 = 0;
  }

  return v24;
}

void __77__PKDashboardPaymentPassDataSource__messagesForAccountUserSetupCashForFamily__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _presentApplCashFamilySetupForFamilyMember:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
    id WeakRetained = v3;
  }
}

void __77__PKDashboardPaymentPassDataSource__messagesForAccountUserSetupCashForFamily__block_invoke_2(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v3)
    {
      uint64_t v4 = [v3 arrayByAddingObject:*(void *)(a1 + 32)];
    }
    else
    {
      v6[0] = *(void *)(a1 + 32);
      uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
    }
    int v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v4);

    PKSharedCacheSetObjectForKey();
    [WeakRetained reloadMessages];
  }
}

- (id)_messagesToOrderPhysicalCardForUnderageParticipants
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  if (self->_accountUsersLoaded
    && self->_physicalCardsLoaded
    && self->_accountUserInvitationsLoaded
    && self->_familyCollectionLoaded)
  {
    account = self->_account;
    if (account)
    {
      if ([(PKAccount *)account accessLevel] == 1
        && self->_physicalCardController
        && [(PKAccount *)self->_account supportsRequestPhysicalCard])
      {
        val = self;
        id v37 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v61 = 0;
        long long v62 = &v61;
        uint64_t v63 = 0x3032000000;
        uint64_t v64 = __Block_byref_object_copy__42;
        long long v65 = __Block_byref_object_dispose__42;
        PKSharedCacheGetArrayForKey();
        id v66 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v4 = [(PKAccountUserCollection *)self->_accountUserCollection activeAccountUsers];
        int v5 = [v4 allObjects];
        uint64_t v6 = objc_msgSend(v5, "pk_objectsPassingTest:", &__block_literal_global_1621);

        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        id obj = v6;
        uint64_t v7 = [obj countByEnumeratingWithState:&v57 objects:v68 count:16];
        if (!v7) {
          goto LABEL_39;
        }
        uint64_t v41 = *(void *)v58;
        id v36 = v46;
        while (1)
        {
          uint64_t v42 = v7;
          for (uint64_t i = 0; i != v42; ++i)
          {
            if (*(void *)v58 != v41) {
              objc_enumerationMutation(obj);
            }
            uint64_t v9 = *(void **)(*((void *)&v57 + 1) + 8 * i);
            id v10 = [v9 altDSID];
            int v11 = [(PKFamilyMemberCollection *)val->_familyCollection familyMemberForAltDSID:v10];
            id v12 = v11;
            if (!v11
              || ![v11 memberType]
              || [v12 memberType] == -1
              || ([(id)v62[5] containsObject:v10] & 1) != 0
              || ![v9 supportsRequestPhysicalCard])
            {
              goto LABEL_37;
            }
            id v38 = v9;
            long long v55 = 0u;
            long long v56 = 0u;
            long long v53 = 0u;
            long long v54 = 0u;
            uint64_t v40 = val->_physicalCards;
            uint64_t v13 = [(NSSet *)v40 countByEnumeratingWithState:&v53 objects:v67 count:16];
            if (!v13)
            {
LABEL_32:

              goto LABEL_35;
            }
            uint64_t v44 = *(void *)v54;
LABEL_21:
            uint64_t v14 = 0;
            while (1)
            {
              if (*(void *)v54 != v44) {
                objc_enumerationMutation(v40);
              }
              int v15 = *(void **)(*((void *)&v53 + 1) + 8 * v14);
              uint64_t v16 = [v15 accountUserAltDSID];
              int v17 = v16;
              if (!v16) {
                goto LABEL_30;
              }
              id v18 = v16;
              id v19 = v10;
              id v20 = v19;
              if (v18 == v19) {
                break;
              }
              if (v10)
              {
                char v21 = [v18 isEqualToString:v19];

                if (v21) {
                  goto LABEL_34;
                }
              }
              else
              {
              }
LABEL_30:

              if (v13 == ++v14)
              {
                uint64_t v13 = [(NSSet *)v40 countByEnumeratingWithState:&v53 objects:v67 count:16];
                if (v13) {
                  goto LABEL_21;
                }
                goto LABEL_32;
              }
            }

            id v18 = v20;
LABEL_34:
            id v22 = v15;

            if (v22) {
              goto LABEL_36;
            }
LABEL_35:
            id v23 = (void *)MEMORY[0x1E4F845E8];
            id v24 = [v38 nameComponents];
            uint64_t v25 = [v23 contactForFamilyMember:v12 nameComponents:v24 imageData:0];

            uint64_t v26 = [v25 givenName];
            id v27 = objc_alloc_init(PKDashboardPassMessage);
            double v28 = [NSString stringWithFormat:@"%@-%@", @"createAccountUserInvitationPrompt", v10, v36];
            [(PKDashboardPassMessage *)v27 setIdentifier:v28];
            [(PKDashboardPassMessage *)v27 setShowDisclosure:1];
            uint64_t v29 = PKLocalizedMadisonString(&cfstr_OwnerDashboard_5.isa);
            [(PKDashboardPassMessage *)v27 setTitle:v29];

            BOOL v30 = PKLocalizedMadisonString(&cfstr_OwnerDashboard_6.isa, &stru_1EF1B4C70.isa, v26);
            [(PKDashboardPassMessage *)v27 setMessage:v30];

            long long v31 = PKLocalizedMadisonString(&cfstr_OwnerDashboard_7.isa);
            [(PKDashboardPassMessage *)v27 setButtonTitle:v31];

            uint64_t v32 = PKDashboardMessagePassIcon(val->_pass);
            [(PKDashboardPassMessage *)v27 setImage:v32];

            [(PKDashboardPassMessage *)v27 setReportToAnalytics:1];
            id v33 = [MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForPass:val->_pass];
            [(PKDashboardPassMessage *)v27 setAnalyticsReporterSubject:v33];

            objc_initWeak(&location, val);
            v50[0] = MEMORY[0x1E4F143A8];
            v50[1] = 3221225472;
            void v50[2] = __87__PKDashboardPaymentPassDataSource__messagesToOrderPhysicalCardForUnderageParticipants__block_invoke_2;
            v50[3] = &unk_1E59CB010;
            objc_copyWeak(&v51, &location);
            void v50[4] = v38;
            [(PKDashboardPassMessage *)v27 setActionOnButtonPress:v50];
            v45[0] = MEMORY[0x1E4F143A8];
            v45[1] = 3221225472;
            v46[0] = __87__PKDashboardPaymentPassDataSource__messagesToOrderPhysicalCardForUnderageParticipants__block_invoke_4;
            v46[1] = &unk_1E59D4EC0;
            objc_copyWeak(&v49, &location);
            id v48 = &v61;
            id v47 = v10;
            [(PKDashboardPassMessage *)v27 setActionOnDismiss:v45];
            [v37 addObject:v27];

            objc_destroyWeak(&v49);
            objc_destroyWeak(&v51);
            objc_destroyWeak(&location);

            id v22 = 0;
LABEL_36:

LABEL_37:
          }
          uint64_t v7 = [obj countByEnumeratingWithState:&v57 objects:v68 count:16];
          if (!v7)
          {
LABEL_39:

            if ([v37 count]) {
              id v34 = (void *)[v37 copy];
            }
            else {
              id v34 = 0;
            }

            _Block_object_dispose(&v61, 8);
            goto LABEL_42;
          }
        }
      }
    }
  }
  id v34 = 0;
LABEL_42:

  return v34;
}

uint64_t __87__PKDashboardPaymentPassDataSource__messagesToOrderPhysicalCardForUnderageParticipants__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 accessLevel] == 2) {
    uint64_t v3 = [v2 isCurrentUser] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

void __87__PKDashboardPaymentPassDataSource__messagesToOrderPhysicalCardForUnderageParticipants__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = [[PKPhysicalCardController alloc] initWithAccountService:WeakRetained[115] paymentPass:WeakRetained[110] account:WeakRetained[49] accountUser:*(void *)(a1 + 32) physicalCards:WeakRetained[97]];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __87__PKDashboardPaymentPassDataSource__messagesToOrderPhysicalCardForUnderageParticipants__block_invoke_3;
    v4[3] = &unk_1E59D9FE0;
    v4[4] = WeakRetained;
    [(PKPhysicalCardController *)v3 orderFlowViewControllerForReason:0 content:0 completion:v4];
  }
}

void __87__PKDashboardPaymentPassDataSource__messagesToOrderPhysicalCardForUnderageParticipants__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  if (v7)
  {
    int v5 = [[PKNavigationController alloc] initWithRootViewController:v7];
    [(PKNavigationController *)v5 setModalPresentationStyle:2];
  }
  else
  {
    int v5 = (PKNavigationController *)PKAlertForDisplayableErrorWithHandlers(a3, 0, 0, 0);
  }
  uint64_t v6 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "pkui_viewControllerFromResponderChain");
  [v6 presentViewController:v5 animated:1 completion:0];
}

void __87__PKDashboardPaymentPassDataSource__messagesToOrderPhysicalCardForUnderageParticipants__block_invoke_4(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v3)
    {
      uint64_t v4 = [v3 arrayByAddingObject:*(void *)(a1 + 32)];
    }
    else
    {
      v6[0] = *(void *)(a1 + 32);
      uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
    }
    int v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v4);

    PKSharedCacheSetObjectForKey();
    [WeakRetained reloadMessages];
  }
}

- (id)_messagesForLockedCardParticipants
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (self->_accountUsersLoaded
    && self->_accountUserInvitationsLoaded
    && self->_familyCollectionLoaded
    && (account = self->_account) != 0
    && [(PKAccount *)account accessLevel] == 1)
  {
    id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v4 = [(PKAccountUserCollection *)self->_accountUserCollection activeAccountUsers];
    int v5 = [v4 allObjects];
    uint64_t v6 = objc_msgSend(v5, "pk_objectsPassingTest:", &__block_literal_global_1632);

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = v6;
    uint64_t v27 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v27)
    {
      uint64_t v25 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v32 != v25) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          uint64_t v9 = [v8 altDSID];
          id v10 = [(PKFamilyMemberCollection *)self->_familyCollection familyMemberForAltDSID:v9];
          int v11 = (void *)MEMORY[0x1E4F845E8];
          id v12 = [v8 nameComponents];
          uint64_t v13 = [v11 contactForFamilyMember:v10 nameComponents:v12 imageData:0];

          uint64_t v14 = [v13 givenName];
          int v15 = objc_alloc_init(PKDashboardPassMessage);
          uint64_t v16 = [NSString stringWithFormat:@"%@-%@", @"cardParticipantLocked", v9];
          [(PKDashboardPassMessage *)v15 setIdentifier:v16];
          [(PKDashboardPassMessage *)v15 setShowDisclosure:1];
          int v17 = PKLocalizedMadisonString(&cfstr_ParticipantLoc.isa, &stru_1EF1B4C70.isa, v14);
          [(PKDashboardPassMessage *)v15 setTitle:v17];

          id v18 = PKLocalizedMadisonString(&cfstr_ParticipantLoc_0.isa, &stru_1EF1B4C70.isa, v14);
          [(PKDashboardPassMessage *)v15 setMessage:v18];

          id v19 = PKLocalizedMadisonString(&cfstr_ParticipantLoc_1.isa);
          [(PKDashboardPassMessage *)v15 setButtonTitle:v19];

          id v20 = PKDashboardMessagePassIcon(self->_pass);
          [(PKDashboardPassMessage *)v15 setImage:v20];

          [(PKDashboardPassMessage *)v15 setReportToAnalytics:1];
          char v21 = [MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForPass:self->_pass];
          [(PKDashboardPassMessage *)v15 setAnalyticsReporterSubject:v21];

          objc_initWeak(&location, self);
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v28[2] = __70__PKDashboardPaymentPassDataSource__messagesForLockedCardParticipants__block_invoke_2;
          v28[3] = &unk_1E59CA7F8;
          objc_copyWeak(&v29, &location);
          [(PKDashboardPassMessage *)v15 setActionOnButtonPress:v28];
          [v26 addObject:v15];
          objc_destroyWeak(&v29);
          objc_destroyWeak(&location);
        }
        uint64_t v27 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v27);
    }

    if ([v26 count]) {
      id v22 = (void *)[v26 copy];
    }
    else {
      id v22 = 0;
    }
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

uint64_t __70__PKDashboardPaymentPassDataSource__messagesForLockedCardParticipants__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 accessLevel] == 2 && objc_msgSend(v2, "accountState") == 3) {
    uint64_t v3 = [v2 isCurrentUser] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

void __70__PKDashboardPaymentPassDataSource__messagesForLockedCardParticipants__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v1 = [[PKBusinessChatAccountStateContext alloc] initWithAccount:WeakRetained[49] paymentPass:WeakRetained[110] eligibleForRecoveryPaymentPlan:0];
    [WeakRetained _presentAccountResolution:2 forBusinessChatContext:v1];
  }
}

- (id)_messageForAccountPendingFamilyMembers
{
  if (self->_accountPendingFamilyMembersLoaded
    && (PKSharedCacheGetBoolForKey() & 1) == 0
    && [(NSArray *)self->_accountPendingFamilyMembers count])
  {
    uint64_t v3 = objc_alloc_init(PKDashboardPassMessage);
    [(PKDashboardPassMessage *)v3 setIdentifier:@"accountPendingFamilyMember"];
    [(PKDashboardPassMessage *)v3 setShowDisclosure:1];
    uint64_t v4 = PKLocalizedMadisonString(&cfstr_AccountPending.isa);
    [(PKDashboardPassMessage *)v3 setTitle:v4];

    int v5 = PKLocalizedMadisonString(&cfstr_AccountPending_0.isa);
    [(PKDashboardPassMessage *)v3 setMessage:v5];

    uint64_t v6 = PKLocalizedMadisonString(&cfstr_AccountPending_1.isa);
    [(PKDashboardPassMessage *)v3 setButtonTitle:v6];

    id v7 = PKDashboardMessagePassIcon(self->_pass);
    [(PKDashboardPassMessage *)v3 setImage:v7];

    [(PKDashboardPassMessage *)v3 setReportToAnalytics:1];
    id v8 = [MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForPass:self->_pass];
    [(PKDashboardPassMessage *)v3 setAnalyticsReporterSubject:v8];

    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    id v12[2] = __74__PKDashboardPaymentPassDataSource__messageForAccountPendingFamilyMembers__block_invoke;
    v12[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v13, &location);
    [(PKDashboardPassMessage *)v3 setActionOnButtonPress:v12];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __74__PKDashboardPaymentPassDataSource__messageForAccountPendingFamilyMembers__block_invoke_2;
    id v10[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v11, &location);
    [(PKDashboardPassMessage *)v3 setActionOnDismiss:v10];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void __74__PKDashboardPaymentPassDataSource__messageForAccountPendingFamilyMembers__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    PKSharedCacheSetBoolForKey();
    [WeakRetained _presentCreateAccountUserInvitation];
  }
}

void __74__PKDashboardPaymentPassDataSource__messageForAccountPendingFamilyMembers__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    PKSharedCacheSetBoolForKey();
    id WeakRetained = v2;
  }
}

- (id)_messageForFirstMonthCoOwners
{
  if (!self->_accountUsersLoaded
    || !self->_accountUserInvitationsLoaded
    || !self->_familyCollectionLoaded
    || (account = self->_account) == 0
    || [(PKAccount *)account accessLevel] != 1
    || ![(PKAccount *)self->_account isCoOwner]
    || (PKSharedCacheGetBoolForKey() & 1) != 0)
  {
    uint64_t v4 = 0;
    goto LABEL_9;
  }
  uint64_t v6 = [(PKAccount *)self->_account creditDetails];
  id v7 = [v6 accountSummary];
  id v8 = [v7 mergeSummary];

  uint64_t v9 = [v8 accountDetails];
  id v10 = objc_msgSend(v9, "pk_anyObjectPassingTest:", &__block_literal_global_1653);

  if (!v10)
  {
    id v11 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "Not showing first month merge balance dashboard message because no account had a statement balance", (uint8_t *)location, 2u);
    }
    uint64_t v4 = 0;
    goto LABEL_25;
  }
  id v11 = [(PKAccount *)self->_account creditDetails];
  id v12 = [v11 mergeDate];
  if (v12)
  {
    if (![v11 isInMonthOfMerge])
    {
      uint64_t v4 = 0;
      goto LABEL_24;
    }
    id v13 = objc_alloc(MEMORY[0x1E4F1C9A8]);
    uint64_t v14 = [v13 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
    int v15 = PKStartOfLastMonth();
    uint64_t v16 = [v14 components:8 fromDate:v15];
    [v16 month];

    PKGregorianMonthSpecificLocalizedStringKeyForKey();
    int v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v18 = PKLocalizedMadisonString(v17);

    PKGregorianMonthSpecificLocalizedStringKeyForKey();
    id v19 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v20 = PKLocalizedMadisonString(v19);

    uint64_t v4 = objc_alloc_init(PKDashboardPassMessage);
    [(PKDashboardPassMessage *)v4 setIdentifier:@"accountCoOwnerFirstMonthMerge"];
    [(PKDashboardPassMessage *)v4 setTitle:v18];
    [(PKDashboardPassMessage *)v4 setMessage:v20];
    char v21 = PKLocalizedMadisonString(&cfstr_AccountCoowner_1.isa);
    [(PKDashboardPassMessage *)v4 setButtonTitle:v21];

    [(PKDashboardPassMessage *)v4 setShowDisclosure:1];
    id v22 = PKDashboardMessagePassIcon(self->_pass);
    [(PKDashboardPassMessage *)v4 setImage:v22];

    [(PKDashboardPassMessage *)v4 setReportToAnalytics:1];
    id v23 = [MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForPass:self->_pass];
    [(PKDashboardPassMessage *)v4 setAnalyticsReporterSubject:v23];

    objc_initWeak(location, self);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    void v26[2] = __65__PKDashboardPaymentPassDataSource__messageForFirstMonthCoOwners__block_invoke_1663;
    void v26[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v27, location);
    [(PKDashboardPassMessage *)v4 setActionOnDismiss:v26];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    void v24[2] = __65__PKDashboardPaymentPassDataSource__messageForFirstMonthCoOwners__block_invoke_2;
    v24[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v25, location);
    [(PKDashboardPassMessage *)v4 setActionOnButtonPress:v24];
    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
    objc_destroyWeak(location);
  }
  else
  {
    uint64_t v14 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_19F450000, v14, OS_LOG_TYPE_DEFAULT, "Error: no merge date defined on a co-owner account", (uint8_t *)location, 2u);
    }
    uint64_t v4 = 0;
  }

LABEL_24:
LABEL_25:

LABEL_9:

  return v4;
}

BOOL __65__PKDashboardPaymentPassDataSource__messageForFirstMonthCoOwners__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 statementBalance];
  BOOL v3 = v2 != 0;

  return v3;
}

void __65__PKDashboardPaymentPassDataSource__messageForFirstMonthCoOwners__block_invoke_1663(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    PKSharedCacheSetBoolForKey();
    [WeakRetained reloadMessages];
  }
}

void __65__PKDashboardPaymentPassDataSource__messageForFirstMonthCoOwners__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    PKSharedCacheSetBoolForKey();
    [WeakRetained _presentBalanceDetails];
  }
}

- (id)_messageImageWithName:(id)a3 extension:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v6)
  {
    id v11 = 0;
    goto LABEL_15;
  }
  uint64_t v9 = [v6 stringByAppendingFormat:@".%@", v7];
  if (v9)
  {
    os_unfair_lock_lock(&self->_lockImages);
    id v10 = [(NSMutableDictionary *)self->_messageImagesCache objectForKey:v9];
    os_unfair_lock_unlock(&self->_lockImages);
    if (v10)
    {
      id v11 = v10;
LABEL_13:

      goto LABEL_14;
    }
    id v12 = PKPassKitUIBundle();
    id v13 = v8;
    uint64_t v14 = v13;
    if (v13 == @"pdf"
      || v13 && (int v15 = [(__CFString *)v13 isEqualToString:@"pdf"], v14, v15))
    {
      uint64_t v16 = [v12 URLForResource:v6 withExtension:v14];
      double v17 = PKUIScreenScale();
      id v18 = PKUIImageFromPDF(v16, 45.0, 45.0, v17);

      if (!v18)
      {
LABEL_12:
        id v11 = v18;

        goto LABEL_13;
      }
    }
    else
    {
      id v18 = PKUIImageNamed(v6);
      if (!v18) {
        goto LABEL_12;
      }
    }
    os_unfair_lock_lock(&self->_lockImages);
    [(NSMutableDictionary *)self->_messageImagesCache setObject:v18 forKey:v9];
    os_unfair_lock_unlock(&self->_lockImages);
    goto LABEL_12;
  }
  id v11 = 0;
LABEL_14:

LABEL_15:

  return v11;
}

- (id)revokingAccessMessage
{
  id v2 = [(PKPaymentPass *)self->_pass devicePrimaryPaymentApplication];
  BOOL v3 = [v2 subcredentials];
  uint64_t v4 = [v3 anyObject];

  int v5 = [v4 entitlement];
  uint64_t v6 = [v5 carKeyEntitlementType];

  id v7 = @"DASHBOARD_MESSAGE_FULL_ACCESS_REVOKING_MESSAGE";
  if (v6 == 1) {
    id v7 = @"DASHBOARD_MESSAGE_UNLOCK_ONLY_REVOKING_MESSAGE";
  }
  if (v6 == 6) {
    id v8 = @"DASHBOARD_MESSAGE_PROPRIETARY_ACCESS_REVOKING_MESSAGE";
  }
  else {
    id v8 = v7;
  }
  uint64_t v9 = PKLocalizedCredentialString(&v8->isa);

  return v9;
}

- (id)_messageForPaymentInformationEventExtensionInstallation
{
  BOOL v3 = [(PKPaymentPass *)self->_pass uniqueID];
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  char v21 = __Block_byref_object_copy__42;
  id v22 = __Block_byref_object_dispose__42;
  PKSharedCacheGetArrayForKey();
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  if ([(PKPaymentPass *)self->_pass supportsBarcodePayment]
    && ([(id)v19[5] containsObject:v3] & 1) == 0
    && [(PKLinkedApplication *)self->_linkedApplication state] == 1
    && ![(PKLinkedApplication *)self->_linkedApplication isInstalled])
  {
    uint64_t v6 = [(PKPaymentPass *)self->_pass organizationName];
    uint64_t v4 = objc_alloc_init(PKDashboardPassMessage);
    [(PKDashboardPassMessage *)v4 setIdentifier:@"paymentInformationExtensionInstallPrompt"];
    id v7 = PKDashboardMessagePassIcon(self->_pass);
    [(PKDashboardPassMessage *)v4 setImage:v7];

    id v8 = PKLocalizedAquamanString(&cfstr_DashboardAppIn.isa, &stru_1EF1B4C70.isa, v6);
    [(PKDashboardPassMessage *)v4 setTitle:v8];

    uint64_t v9 = PKLocalizedAquamanString(&cfstr_DashboardAppIn_0.isa, &stru_1EF1B5770.isa, v6, v6);
    [(PKDashboardPassMessage *)v4 setMessage:v9];

    id v10 = PKLocalizedAquamanString(&cfstr_ViewInAppStore.isa);
    [(PKDashboardPassMessage *)v4 setButtonTitle:v10];

    [(PKDashboardPassMessage *)v4 setShowDisclosure:1];
    objc_initWeak(&location, self);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    id v15[2] = __91__PKDashboardPaymentPassDataSource__messageForPaymentInformationEventExtensionInstallation__block_invoke;
    v15[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v16, &location);
    [(PKDashboardPassMessage *)v4 setActionOnButtonPress:v15];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    id v11[2] = __91__PKDashboardPaymentPassDataSource__messageForPaymentInformationEventExtensionInstallation__block_invoke_2;
    v11[3] = &unk_1E59D4EC0;
    objc_copyWeak(&v14, &location);
    id v13 = &v18;
    id v12 = v3;
    [(PKDashboardPassMessage *)v4 setActionOnDismiss:v11];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v4 = 0;
  }
  _Block_object_dispose(&v18, 8);

  return v4;
}

void __91__PKDashboardPaymentPassDataSource__messageForPaymentInformationEventExtensionInstallation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = (void *)*((void *)WeakRetained + 80);
    id v4 = WeakRetained;
    BOOL v3 = objc_msgSend(*((id *)WeakRetained + 1), "pkui_viewControllerFromResponderChain");
    [v2 openApplication:v3];

    id WeakRetained = v4;
  }
}

void __91__PKDashboardPaymentPassDataSource__messageForPaymentInformationEventExtensionInstallation__block_invoke_2(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    BOOL v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v3)
    {
      id v4 = [v3 arrayByAddingObject:*(void *)(a1 + 32)];
    }
    else
    {
      v6[0] = *(void *)(a1 + 32);
      id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
    }
    int v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v4);

    PKSharedCacheSetObjectForKey();
    [WeakRetained reloadMessages];
  }
}

- (void)_messageForUnusableIdentityPassWithCompletion:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(PKPaymentPass *)self->_pass devicePrimaryContactlessPaymentApplication];
  uint64_t v6 = [v5 subcredentials];
  id v7 = [v6 anyObject];
  id v8 = [v7 identifier];

  if ([(PKPaymentPass *)self->_pass isIdentityPass]
    && [(PKPaymentPass *)self->_pass activationState] == PKPaymentPassActivationStateActivated
    && v8)
  {
    objc_initWeak(&location, self);
    id v9 = objc_alloc(MEMORY[0x1E4F5C0F8]);
    v16[0] = *MEMORY[0x1E4F872A8];
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    id v11 = (void *)[v9 initWithPartitions:v10];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    id v12[2] = __82__PKDashboardPaymentPassDataSource__messageForUnusableIdentityPassWithCompletion___block_invoke;
    v12[3] = &unk_1E59DA178;
    objc_copyWeak(&v14, &location);
    id v13 = v4;
    [v11 propertiesOfCredential:v8 completion:v12];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

void __82__PKDashboardPaymentPassDataSource__messageForUnusableIdentityPassWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__PKDashboardPaymentPassDataSource__messageForUnusableIdentityPassWithCompletion___block_invoke_2;
  block[3] = &unk_1E59CA960;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
}

void __82__PKDashboardPaymentPassDataSource__messageForUnusableIdentityPassWithCompletion___block_invoke_2(uint64_t a1)
{
  id v2 = (id *)(a1 + 48);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v4 = [*(id *)(a1 + 32) options];
    if ([v4 presentmentAuthPolicy] == 2) {
      int v5 = [*(id *)(a1 + 32) hasUsablePresentmentAuthPolicy] ^ 1;
    }
    else {
      int v5 = 0;
    }

    unint64_t v6 = [WeakRetained[110] identityType];
    if (v6 > 3)
    {
      id v8 = 0;
      id v9 = 0;
      if (!v5) {
        goto LABEL_8;
      }
    }
    else
    {
      id v7 = off_1E59DA558[v6];
      id v8 = PKLocalizedIdentityString(&off_1E59DA538[v6]->isa);
      id v9 = PKLocalizedIdentityString(&v7->isa);
      if (!v5)
      {
LABEL_8:
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_14:

        goto LABEL_15;
      }
    }
    id v10 = objc_alloc_init(PKDashboardPassMessage);
    [(PKDashboardPassMessage *)v10 setIdentifier:@"identityUnusable"];
    id v11 = [MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForPass:WeakRetained[110]];
    [(PKDashboardPassMessage *)v10 setAnalyticsReporterSubject:v11];

    [(PKDashboardPassMessage *)v10 setTitle:v8];
    if (PKPearlIsAvailable()) {
      id v12 = @"DASHBOARD_UNAVAILABLE_FACEID";
    }
    else {
      id v12 = @"DASHBOARD_UNAVAILABLE_TOUCHID";
    }
    id v13 = [WeakRetained[110] localizedDescription];
    id v14 = PKLocalizedIdentityString(&v12->isa, &stru_1EF1B4C70.isa, v13);
    [(PKDashboardPassMessage *)v10 setMessage:v14];

    int v15 = [WeakRetained _messageImageWithName:@"MessageAlert" extension:@"pdf"];
    [(PKDashboardPassMessage *)v10 setImage:v15];

    [(PKDashboardPassMessage *)v10 setButtonTitle:v9];
    [(PKDashboardPassMessage *)v10 setIsDestructiveAction:1];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    void v16[2] = __82__PKDashboardPaymentPassDataSource__messageForUnusableIdentityPassWithCompletion___block_invoke_3;
    v16[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v17, v2);
    [(PKDashboardPassMessage *)v10 setActionOnButtonPress:v16];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    objc_destroyWeak(&v17);

    goto LABEL_14;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_15:
}

void __82__PKDashboardPaymentPassDataSource__messageForUnusableIdentityPassWithCompletion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _deleteButtonPressed];
    id WeakRetained = v2;
  }
}

- (id)_messageForIdentityFirstTimeUse
{
  if (![(PKPaymentPass *)self->_pass isIdentityPass]
    || [(PKPaymentPass *)self->_pass activationState]
    || PKIdentityHasDismissedFirstTimeUseEducationMessage())
  {
    id v3 = 0;
  }
  else
  {
    id v3 = objc_alloc_init(PKDashboardPassMessage);
    [(PKDashboardPassMessage *)v3 setIdentifier:@"identityFirstTimeUse"];
    unint64_t v5 = [(PKPaymentPass *)self->_pass identityType];
    if (v5 > 3)
    {
      unint64_t v6 = 0;
    }
    else
    {
      unint64_t v6 = PKLocalizedIdentityString(&off_1E59DA578[v5]->isa);
    }
    [(PKDashboardPassMessage *)v3 setTitle:v6];
    id v7 = PKLocalizedIdentityString(&cfstr_DashboardIdent.isa);
    [(PKDashboardPassMessage *)v3 setMessage:v7];

    id v8 = PKLocalizedIdentityString(&cfstr_DashboardIdent_0.isa);
    [(PKDashboardPassMessage *)v3 setButtonTitle:v8];

    id v9 = [MEMORY[0x1E4FB1830] configurationWithPointSize:26.0];
    id v10 = [MEMORY[0x1E4FB1818] systemImageNamed:@"person.text.rectangle.fill" withConfiguration:v9];
    id v11 = [MEMORY[0x1E4FB1618] whiteColor];
    id v12 = [v10 imageWithTintColor:v11];

    id v13 = [MEMORY[0x1E4FB1618] blackColor];
    id v14 = PKUIImageWithBackground(v12, v13, 45.0, 45.0);
    [(PKDashboardPassMessage *)v3 setImage:v14];

    objc_initWeak(&location, self);
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    id v17 = __67__PKDashboardPaymentPassDataSource__messageForIdentityFirstTimeUse__block_invoke;
    uint64_t v18 = &unk_1E59CA7F8;
    objc_copyWeak(&v19, &location);
    [(PKDashboardPassMessage *)v3 setActionOnDismiss:&v15];
    -[PKDashboardPassMessage setActionOnButtonPress:](v3, "setActionOnButtonPress:", &__block_literal_global_1730, v15, v16, v17, v18);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v3;
}

void __67__PKDashboardPaymentPassDataSource__messageForIdentityFirstTimeUse__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    PKIdentitySetHasDismissedFirstTimeUseEducationMessageKey();
    [WeakRetained reloadMessages];
  }
}

void __67__PKDashboardPaymentPassDataSource__messageForIdentityFirstTimeUse__block_invoke_2()
{
  id v1 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  unint64_t v0 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://learn.wallet.apple/id"];
  [v1 openURL:v0 configuration:0 completionHandler:0];
}

- (void)_messageForPrecursorPassUpgradeWithController:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 devicePrimaryPrecursorRequest];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  id v11[2] = __93__PKDashboardPaymentPassDataSource__messageForPrecursorPassUpgradeWithController_completion___block_invoke;
  v11[3] = &unk_1E59DA1A0;
  id v12 = v6;
  id v13 = v7;
  void v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  [v9 requestDescriptionFor:v8 completion:v11];
}

void __93__PKDashboardPaymentPassDataSource__messageForPrecursorPassUpgradeWithController_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = objc_alloc_init(PKDashboardPassMessage);
    [(PKDashboardPassMessage *)v4 setIdentifier:@"precursorActionRequired"];
    unint64_t v5 = [v3 localizedTitle];
    [(PKDashboardPassMessage *)v4 setTitle:v5];

    id v6 = [v3 localizedDescription];
    [(PKDashboardPassMessage *)v4 setMessage:v6];

    id v7 = [v3 localizedActionText];
    [(PKDashboardPassMessage *)v4 setButtonTitle:v7];

    [(PKDashboardPassMessage *)v4 setShowSpinner:*(unsigned __int8 *)(*(void *)(a1 + 32) + 211)];
    unint64_t v8 = [v3 actionType];
    if (v8 <= 4)
    {
      if (((1 << v8) & 0x13) != 0)
      {
        id v9 = (void *)MEMORY[0x1E4FB1818];
        id v10 = [*(id *)(*(void *)(a1 + 32) + 880) iconImage];
        id v11 = [v9 imageWithPKImage:v10];
        [(PKDashboardPassMessage *)v4 setImage:v11];
      }
      else
      {
        id v12 = [*(id *)(a1 + 32) _messageImageWithName:@"MessageAlert" extension:@"pdf"];
        [(PKDashboardPassMessage *)v4 setImage:v12];

        [(PKDashboardPassMessage *)v4 setIsDestructiveAction:1];
      }
    }
    id v13 = [v3 localizedActionText];

    if (v13)
    {
      objc_initWeak(&location, *(id *)(a1 + 32));
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      void v16[2] = __93__PKDashboardPaymentPassDataSource__messageForPrecursorPassUpgradeWithController_completion___block_invoke_2;
      v16[3] = &unk_1E59CB378;
      objc_copyWeak(&v19, &location);
      id v17 = v3;
      id v18 = *(id *)(a1 + 40);
      [(PKDashboardPassMessage *)v4 setActionOnButtonPress:v16];

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
    (*(void (**)(void, PKDashboardPassMessage *, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v4, v14, v15);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __93__PKDashboardPaymentPassDataSource__messageForPrecursorPassUpgradeWithController_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    uint64_t v3 = [*(id *)(a1 + 32) actionType] - 1;
    id WeakRetained = v6;
    switch(v3)
    {
      case 0:
        [v6 _presentPrecursorActionFlowWithController:*(void *)(a1 + 40)];
        goto LABEL_8;
      case 1:
      case 2:
        [v6 _deleteButtonPressed];
        goto LABEL_8;
      case 3:
        id v4 = [*(id *)(a1 + 32) actionURL];
        if (v4)
        {
          unint64_t v5 = [MEMORY[0x1E4F223E0] defaultWorkspace];
          [v5 openURL:v4 configuration:0 completionHandler:0];
        }
LABEL_8:
        id WeakRetained = v6;
        break;
      default:
        break;
    }
  }
}

- (BOOL)performPrecursorPassAction
{
  precursorUpgradeController = self->_precursorUpgradeController;
  if (precursorUpgradeController) {
    [(PKDashboardPaymentPassDataSource *)self _presentPrecursorActionFlowWithController:self->_precursorUpgradeController];
  }
  return precursorUpgradeController != 0;
}

- (void)_presentPrecursorActionFlowWithController:(id)a3
{
  id v4 = a3;
  objc_initWeak(location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__PKDashboardPaymentPassDataSource__presentPrecursorActionFlowWithController___block_invoke;
  aBlock[3] = &unk_1E59CB100;
  objc_copyWeak(&v24, location);
  unint64_t v5 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  v5[2](v5, 1);
  id v6 = [[PKPaymentSetupDismissibleNavigationController alloc] initWithContext:0];
  id v7 = objc_alloc(MEMORY[0x1E4F84BB8]);
  unint64_t v8 = [MEMORY[0x1E4F84D50] sharedService];
  id v9 = (void *)[v7 initWithWebService:v8];

  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F84ED0]) initWithEnvironment:0 provisioningController:v9 groupsController:0];
  [v10 setIsFollowupProvisioning:1];
  id v11 = [(UIView *)self->_groupView pkui_viewControllerFromResponderChain];
  id v12 = [v11 navigationController];

  pass = self->_pass;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __78__PKDashboardPaymentPassDataSource__presentPrecursorActionFlowWithController___block_invoke_2;
  v19[3] = &unk_1E59CB038;
  objc_copyWeak(&v22, location);
  uint64_t v20 = v6;
  char v21 = v5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __78__PKDashboardPaymentPassDataSource__presentPrecursorActionFlowWithController___block_invoke_4;
  v16[3] = &unk_1E59CAD68;
  uint64_t v14 = v21;
  id v18 = v14;
  uint64_t v15 = v20;
  id v17 = v15;
  +[PKProvisioningFlowBridge startPrecursorPassFlowWithNavController:v15 context:v10 pass:pass precursorController:v4 parentNavController:v12 presentNavController:v19 completion:v16];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(location);
}

void __78__PKDashboardPaymentPassDataSource__presentPrecursorActionFlowWithController___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && (((WeakRetained[211] == 0) ^ a2) & 1) == 0)
  {
    WeakRetained[211] = a2;
    id v4 = WeakRetained;
    [WeakRetained reloadMessages];
    id WeakRetained = v4;
  }
}

void __78__PKDashboardPaymentPassDataSource__presentPrecursorActionFlowWithController___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = objc_msgSend(WeakRetained[1], "pkui_viewControllerFromResponderChain");
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    void v6[2] = __78__PKDashboardPaymentPassDataSource__presentPrecursorActionFlowWithController___block_invoke_3;
    v6[3] = &unk_1E59CAA98;
    uint64_t v5 = *(void *)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    [v4 presentViewController:v5 animated:1 completion:v6];
  }
}

uint64_t __78__PKDashboardPaymentPassDataSource__presentPrecursorActionFlowWithController___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __78__PKDashboardPaymentPassDataSource__presentPrecursorActionFlowWithController___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = *(void **)(a1 + 32);

  return [v2 dismissViewControllerAnimated:1 completion:0];
}

- (void)_messageForPassInconsistencyWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if (v4)
  {
    uint64_t v5 = [(PKPaymentPass *)self->_pass devicePrimaryContactlessPaymentApplication];
    id v6 = [v5 subcredentials];
    if ((PKUIOnlyDemoModeEnabled() & 1) != 0
      || PKStoreDemoModeEnabled()
      || ![(PKPaymentPass *)self->_pass isCarKeyPass]
      || [(PKPaymentPass *)self->_pass activationState]
      || !v6)
    {
      v4[2](v4, 0);
    }
    else
    {
      id v7 = [v5 applicationIdentifier];
      objc_initWeak(&location, self);
      unint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v7, 0);
      secureElement = self->_secureElement;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      id v11[2] = __79__PKDashboardPaymentPassDataSource__messageForPassInconsistencyWithCompletion___block_invoke;
      v11[3] = &unk_1E59DA1C8;
      objc_copyWeak(&v15, &location);
      uint64_t v14 = v4;
      id v10 = v7;
      id v12 = v10;
      id v13 = v6;
      [(PKSecureElement *)secureElement appletCredentialsForAIDs:v8 completion:v11];

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
  }
}

void __79__PKDashboardPaymentPassDataSource__messageForPassInconsistencyWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && !a3)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    unint64_t v8 = [v5 objectForKey:*(void *)(a1 + 32)];
    id v9 = (void *)[v7 initWithArray:v8];

    if ([*(id *)(a1 + 40) intersectsSet:v9])
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v10 = *(id *)(a1 + 40);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v21;
        while (2)
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v21 != v13) {
              objc_enumerationMutation(v10);
            }
            if (objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v14), "state", (void)v20) == 1)
            {

              id v15 = objc_alloc_init(PKDashboardPassMessage);
              [(PKDashboardPassMessage *)v15 setIdentifier:@"keyInconsistent"];
              uint64_t v16 = [WeakRetained _messageImageWithName:@"MessageAlert" extension:@"pdf"];
              [(PKDashboardPassMessage *)v15 setImage:v16];

              id v17 = [MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForPass:WeakRetained[110]];
              [(PKDashboardPassMessage *)v15 setAnalyticsReporterSubject:v17];

              id v18 = PKLocalizedCredentialString(&cfstr_InconsistentKe.isa);
              [(PKDashboardPassMessage *)v15 setTitle:v18];

              id v19 = PKLocalizedCredentialString(&cfstr_InconsistentKe_0.isa);
              [(PKDashboardPassMessage *)v15 setMessage:v19];

              [(PKDashboardPassMessage *)v15 setIsDestructiveAction:0];
              goto LABEL_16;
            }
            ++v14;
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }

      id v15 = 0;
LABEL_16:
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)executeEngagementActionForURL:(id)a3
{
  id v21 = a3;
  switch(PKEnagementActionTypeForActionURL())
  {
    case 1:
      [(PKDashboardPaymentPassDataSource *)self _presentPassDetailsWithAction:0];
      break;
    case 2:
      id v4 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      [v4 openSensitiveURL:v21 withOptions:0];
      goto LABEL_6;
    case 3:
      [(PKDashboardPaymentPassDataSource *)self _presentCardNumbers];
      break;
    case 4:
      paymentDataProvider = self->_paymentDataProvider;
      id v4 = [(PKPaymentPass *)self->_pass uniqueID];
      [(PKPaymentDefaultDataProvider *)paymentDataProvider setDefaultPaymentPassIdentifier:v4];
LABEL_6:

      break;
    case 5:
      id v6 = objc_alloc(MEMORY[0x1E4F84BB8]);
      id v7 = [MEMORY[0x1E4F84D50] sharedService];
      unint64_t v8 = (void *)[v6 initWithWebService:v7];

      id v9 = (void *)[objc_alloc(MEMORY[0x1E4F841C8]) initWithAccount:self->_account];
      [v9 setPaymentPass:self->_pass];
      id v10 = [PKAccountFlowController alloc];
      uint64_t v11 = v9;
      uint64_t v12 = v8;
      uint64_t v13 = self;
      uint64_t v14 = 24;
      goto LABEL_9;
    case 6:
      id v15 = objc_alloc(MEMORY[0x1E4F84BB8]);
      uint64_t v16 = [MEMORY[0x1E4F84D50] sharedService];
      unint64_t v8 = (void *)[v15 initWithWebService:v16];

      id v9 = (void *)[objc_alloc(MEMORY[0x1E4F841C8]) initWithAccount:self->_account];
      [v9 setPaymentPass:self->_pass];
      id v10 = [PKAccountFlowController alloc];
      uint64_t v11 = v9;
      uint64_t v12 = v8;
      uint64_t v13 = self;
      uint64_t v14 = 4;
LABEL_9:
      id v17 = [(PKAccountFlowController *)v10 initWithAccountCredential:v11 provisioningController:v12 setupDelegate:v13 context:0 operations:v14];
      id v18 = [(PKAccountFlowController *)v17 firstAccountViewController];
      id v19 = [[PKNavigationController alloc] initWithRootViewController:v18];
      long long v20 = [(UIView *)self->_groupView pkui_viewControllerFromResponderChain];
      [v20 presentViewController:v19 animated:1 completion:0];

      break;
    default:
      break;
  }
}

- (id)_messageForRangingSuspendedPass
{
  if ([(PKPaymentPass *)self->_pass effectiveContactlessPaymentApplicationState] == 1)
  {
    uint64_t v3 = [(PKPaymentPass *)self->_pass devicePrimaryContactlessPaymentApplication];
    id v4 = [v3 subcredentials];
    id v5 = [v4 anyObject];

    id v6 = objc_alloc_init(MEMORY[0x1E4F84C38]);
    id v7 = 0;
    if (v3 && v5)
    {
      unint64_t v8 = [v3 applicationIdentifier];
      uint64_t v9 = [v6 rangingSuspensionReasonForAppletSubcredential:v5 forPaymentApplicationID:v8];

      int v10 = [(PKPaymentPass *)self->_pass isHomeKeyPass];
      if (v10)
      {
        uint64_t v11 = 1;
      }
      else
      {
        uint64_t v12 = [v5 entitlement];
        uint64_t v13 = [v12 value];
        [v13 unsignedIntegerValue];
        uint64_t v11 = PKAppletSubcredentialEntitlementTypeFromValue();
      }
      id v7 = 0;
      if ([(PKPaymentPass *)self->_pass activationState] == PKPaymentPassActivationStateActivated)
      {
        if (v9)
        {
          uint64_t v14 = [(PKPaymentPass *)self->_pass secureElementPass];
          uint64_t v15 = [v14 supportedRadioTechnologies];

          id v7 = objc_alloc_init(PKDashboardPassMessage);
          [(PKDashboardPassMessage *)v7 setIdentifier:@"identityUnusable"];
          uint64_t v16 = [(PKDashboardPaymentPassDataSource *)self _messageImageWithName:@"MessageAlert" extension:@"pdf"];
          [(PKDashboardPassMessage *)v7 setImage:v16];

          id v17 = [MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForPass:self->_pass];
          [(PKDashboardPassMessage *)v7 setAnalyticsReporterSubject:v17];

          switch(PKRangingSuspensionDisplayableReasonForRangingSuspensionReason())
          {
            case 0:

              id v7 = 0;
              goto LABEL_12;
            case 1:
              id v19 = PKLocalizedCredentialString(&cfstr_AirplaneModeEn.isa);
              long long v20 = PKLocalizedCredentialString(&cfstr_TurnOffAirplan.isa);
              switch(v11)
              {
                case 0:
                case 2:
                case 3:
                case 4:
                case 5:
                  if (v15 == 2) {
                    long long v22 = @"AIRPLANE_MODE_ENABLED_BODY_FULL_ACCESS_BT_ONLY";
                  }
                  else {
                    long long v22 = @"AIRPLANE_MODE_ENABLED_BODY_FULL_ACCESS";
                  }
                  goto LABEL_28;
                case 1:
                  if (v15 == 2)
                  {
                    long long v22 = @"AIRPLANE_MODE_ENABLED_BODY_UNLOCK_ONLY_BT_ONLY";
LABEL_28:
                    uint64_t v27 = PKLocalizedCredentialString(&v22->isa);
                    goto LABEL_29;
                  }
                  if (!v10)
                  {
                    long long v22 = @"AIRPLANE_MODE_ENABLED_BODY_UNLOCK_ONLY";
                    goto LABEL_28;
                  }
                  uint64_t v27 = PKLocalizedHomeKitUWBString(&cfstr_AirplaneModeEn_3.isa);
LABEL_29:
                  id v18 = (void *)v27;
LABEL_30:
                  id v21 = &__block_literal_global_1752;
                  break;
                case 6:
                  if (v15 == 2) {
                    long long v22 = @"AIRPLANE_MODE_ENABLED_BODY_PROPRIETARY_BT_ONLY";
                  }
                  else {
                    long long v22 = @"AIRPLANE_MODE_ENABLED_BODY_PROPRIETARY";
                  }
                  goto LABEL_28;
                default:
                  id v18 = 0;
                  goto LABEL_30;
              }
              goto LABEL_39;
            case 2:
              id v19 = PKLocalizedCredentialString(&cfstr_BluetoothDisab.isa);
              long long v20 = PKLocalizedCredentialString(&cfstr_TurnOnBluetoot.isa);
              switch(v11)
              {
                case 0:
                case 2:
                case 3:
                case 4:
                case 5:
                  if (v15 == 2) {
                    long long v23 = @"BLUETOOTH_DISABLED_BODY_FULL_ACCESS_BT_ONLY";
                  }
                  else {
                    long long v23 = @"BLUETOOTH_DISABLED_BODY_FULL_ACCESS";
                  }
                  goto LABEL_32;
                case 1:
                  if (v15 == 2)
                  {
                    long long v23 = @"BLUETOOTH_DISABLED_BODY_UNLOCK_ONLY_BT_ONLY";
LABEL_32:
                    uint64_t v28 = PKLocalizedCredentialString(&v23->isa);
                    goto LABEL_33;
                  }
                  if (!v10)
                  {
                    long long v23 = @"BLUETOOTH_DISABLED_BODY_UNLOCK_ONLY";
                    goto LABEL_32;
                  }
                  uint64_t v28 = PKLocalizedHomeKitUWBString(&cfstr_BluetoothDisab_3.isa);
LABEL_33:
                  id v18 = (void *)v28;
LABEL_34:
                  id v21 = &__block_literal_global_1784;
                  break;
                case 6:
                  if (v15 == 2) {
                    long long v23 = @"BLUETOOTH_DISABLED_BODY_PROPRIETARY_BT_ONLY";
                  }
                  else {
                    long long v23 = @"BLUETOOTH_DISABLED_BODY_PROPRIETARY";
                  }
                  goto LABEL_32;
                default:
                  id v18 = 0;
                  goto LABEL_34;
              }
              goto LABEL_39;
            case 3:
              id v19 = PKLocalizedCredentialString(&cfstr_KnownProhibite.isa);
              long long v20 = PKLocalizedCredentialString(&cfstr_LearnMoreButto.isa);
              switch(v11)
              {
                case 0:
                case 2:
                case 3:
                case 4:
                case 5:
                  if (v15 == 2) {
                    id v24 = @"KNOWN_PROHIBITED_LOCATION_BODY_BT_ONLY_FULL_ACCESS";
                  }
                  else {
                    id v24 = @"KNOWN_PROHIBITED_LOCATION_BODY_FULL_ACCESS";
                  }
                  goto LABEL_36;
                case 1:
                  if (v15 == 2)
                  {
                    id v24 = @"KNOWN_PROHIBITED_LOCATION_BODY_BT_ONLY_UNLOCK_ONLY";
LABEL_36:
                    uint64_t v29 = PKLocalizedCredentialString(&v24->isa);
                    goto LABEL_37;
                  }
                  if (!v10)
                  {
                    id v24 = @"KNOWN_PROHIBITED_LOCATION_BODY_UNLOCK_ONLY";
                    goto LABEL_36;
                  }
                  uint64_t v29 = PKLocalizedHomeKitUWBString(&cfstr_KnownProhibite_3.isa);
LABEL_37:
                  id v18 = (void *)v29;
LABEL_38:
                  id v21 = &__block_literal_global_1816;
LABEL_39:
                  [(PKDashboardPassMessage *)v7 setTitle:v19];
                  [(PKDashboardPassMessage *)v7 setMessage:v18];
                  [(PKDashboardPassMessage *)v7 setButtonTitle:v20];
                  [(PKDashboardPassMessage *)v7 setIsDestructiveAction:0];
                  [(PKDashboardPassMessage *)v7 setActionOnButtonPress:v21];

                  break;
                case 6:
                  if (v15 == 2) {
                    id v24 = @"KNOWN_PROHIBITED_LOCATION_BODY_BT_ONLY_PROPRIETARY";
                  }
                  else {
                    id v24 = @"KNOWN_PROHIBITED_LOCATION_BODY_PROPRIETARY";
                  }
                  goto LABEL_36;
                default:
                  id v18 = 0;
                  goto LABEL_38;
              }
              break;
            case 4:
              id v19 = PKLocalizedCredentialString(&cfstr_UwbUpdateFaile.isa);
              long long v20 = PKLocalizedCredentialString(&cfstr_LearnMoreButto.isa);
              switch(v11)
              {
                case 0:
                case 2:
                case 3:
                case 4:
                case 5:
                  uint64_t v25 = @"UWB_UPDATE_FAILED_BODY_FULL_ACCESS";
                  goto LABEL_24;
                case 1:
                  if (v10)
                  {
                    uint64_t v26 = PKLocalizedHomeKitUWBString(&cfstr_UwbUpdateFaile_1.isa);
                  }
                  else
                  {
                    uint64_t v25 = @"UWB_UPDATE_FAILED_BODY_UNLOCK_ONLY";
LABEL_24:
                    uint64_t v26 = PKLocalizedCredentialString(&v25->isa);
                  }
                  id v18 = (void *)v26;
LABEL_26:
                  id v21 = &__block_literal_global_1845;
                  break;
                case 6:
                  uint64_t v25 = @"UWB_UPDATE_FAILED_BODY_PROPRIETARY";
                  goto LABEL_24;
                default:
                  id v18 = 0;
                  goto LABEL_26;
              }
              goto LABEL_39;
            default:
LABEL_12:
              id v18 = 0;
              id v19 = 0;
              long long v20 = 0;
              id v21 = 0;
              goto LABEL_39;
          }
        }
      }
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __67__PKDashboardPaymentPassDataSource__messageForRangingSuspendedPass__block_invoke()
{
  id v1 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  unint64_t v0 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root="];
  [v1 openSensitiveURL:v0 withOptions:0];
}

void __67__PKDashboardPaymentPassDataSource__messageForRangingSuspendedPass__block_invoke_2()
{
  id v1 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  unint64_t v0 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=Bluetooth"];
  [v1 openSensitiveURL:v0 withOptions:0];
}

void __67__PKDashboardPaymentPassDataSource__messageForRangingSuspendedPass__block_invoke_3()
{
  id v1 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  unint64_t v0 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://support.apple.com/HT212274"];
  [v1 openURL:v0 configuration:0 completionHandler:0];
}

void __67__PKDashboardPaymentPassDataSource__messageForRangingSuspendedPass__block_invoke_4()
{
  id v1 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  unint64_t v0 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://support.apple.com/en-us/HT208733"];
  [v1 openURL:v0 configuration:0 completionHandler:0];
}

- (id)_messageForHomeAccessRestricted
{
  if (self->_homeKitIsHomeAccessRestricted)
  {
    uint64_t v3 = objc_alloc_init(PKDashboardPassMessage);
    [(PKDashboardPassMessage *)v3 setIdentifier:@"homeAccessRestricted"];
    id v4 = PKLocalizedHomeKitUWBString(&cfstr_DashboardHomeA.isa);
    [(PKDashboardPassMessage *)v3 setTitle:v4];

    id v5 = PKLocalizedHomeKitUWBString(&cfstr_DashboardHomeA_0.isa);
    [(PKDashboardPassMessage *)v3 setMessage:v5];

    id v6 = [MEMORY[0x1E4FB1830] configurationWithPointSize:26.0];
    id v7 = [MEMORY[0x1E4FB1818] systemImageNamed:@"lock.badge.clock.fill" withConfiguration:v6];
    unint64_t v8 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    uint64_t v9 = [v7 imageWithTintColor:v8];

    int v10 = [MEMORY[0x1E4FB1618] clearColor];
    uint64_t v11 = PKUIImageWithBackground(v9, v10, 45.0, 45.0);
    [(PKDashboardPassMessage *)v3 setImage:v11];

    [(PKDashboardPassMessage *)v3 setIsDestructiveAction:0];
    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __67__PKDashboardPaymentPassDataSource__messageForHomeAccessRestricted__block_invoke;
    v13[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v14, &location);
    [(PKDashboardPassMessage *)v3 setActionOnMessagePress:v13];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void __67__PKDashboardPaymentPassDataSource__messageForHomeAccessRestricted__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _presentRestrictedGuestAccessSchedule];
    id WeakRetained = v2;
  }
}

- (id)_messageForBroadwayDiscoverability
{
  if (PKIsPhone()
    && PKBroadwayDiscoverability2024Enabled()
    && (PKAppleCardDismissedBroadwayDiscoverabilityMessage() & 1) == 0)
  {
    uint64_t v3 = objc_alloc_init(PKDashboardPassMessage);
    [(PKDashboardPassMessage *)v3 setType:1];
    [(PKDashboardPassMessage *)v3 setIdentifier:@"broadwayDiscoverability"];
    id v5 = PKLocalizedBroadwayDiscoverabilityString(&cfstr_ExploreDashboa.isa);
    [(PKDashboardPassMessage *)v3 setTitle:v5];

    id v6 = PKLocalizedBroadwayDiscoverabilityString(&cfstr_ExploreDashboa_0.isa);
    [(PKDashboardPassMessage *)v3 setMessage:v6];

    id v7 = PKLocalizedBroadwayDiscoverabilityString(&cfstr_ExploreDashboa_1.isa);
    [(PKDashboardPassMessage *)v3 setButtonTitle:v7];

    unint64_t v8 = PKUIImageNamed(@"AppleCardFeatures-Benefits");
    [(PKDashboardPassMessage *)v3 setImage:v8];

    [(PKDashboardPassMessage *)v3 setShowDisclosure:1];
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    id v11[2] = __70__PKDashboardPaymentPassDataSource__messageForBroadwayDiscoverability__block_invoke;
    v11[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v12, &location);
    [(PKDashboardPassMessage *)v3 setActionOnButtonPress:v11];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __70__PKDashboardPaymentPassDataSource__messageForBroadwayDiscoverability__block_invoke_2;
    v9[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v10, &location);
    [(PKDashboardPassMessage *)v3 setActionOnDismiss:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void __70__PKDashboardPaymentPassDataSource__messageForBroadwayDiscoverability__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v1 = objc_alloc_init(PKAppleCardFeaturesAndBenefitsViewController);
    id v2 = objc_msgSend(WeakRetained[1], "pkui_viewControllerFromResponderChain");
    uint64_t v3 = [v2 navigationController];
    [v3 pushViewController:v1 animated:1];
  }
}

void __70__PKDashboardPaymentPassDataSource__messageForBroadwayDiscoverability__block_invoke_2(uint64_t a1)
{
  PKAppleCardSetDismissedBroadwayDiscoverabilityMessage();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadMessages];
}

- (void)visibilityDidChangeToState:(unsigned __int8)a3
{
  if (a3 == 1)
  {
    [(PKDashboardPaymentPassDataSource *)self reloadBankConnectData];
    [(PKDashboardPaymentPassDataSource *)self reloadAssociatedPaymentRewardsBalance];
  }
}

- (void)groupView:(id)a3 frontmostPassViewDidChange:(id)a4 withContext:(id)a5
{
  [(PKDashboardPaymentPassDataSource *)self _setPassView:a4];
  [(PKDashboardPaymentPassDataSource *)self reloadFrontmostPass];

  [(PKDashboardPaymentPassDataSource *)self reloadAllContent];
}

- (void)_setPassView:(id)a3
{
  id v5 = (PKPassView *)a3;
  passView = self->_passView;
  if (passView != v5)
  {
    id v7 = v5;
    [(PKPassView *)passView removePassViewObserver:self];
    objc_storeStrong((id *)&self->_passView, a3);
    [(PKPassView *)self->_passView addPassViewObserver:self];
    id v5 = v7;
  }
}

- (void)passView:(id)a3 didUpdatePassState:(id)a4
{
  unint64_t v5 = -[PKDashboardPaymentPassDataSource firstSectionIndexForSectionIdentifier:](self, "firstSectionIndexForSectionIdentifier:", 1, a4);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ([(NSArray *)self->_tileGroups count])
  {
    unint64_t v6 = 0;
    do
    {
      id v7 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:v5 + v6];
      unint64_t v8 = [(PKDashboardPaymentPassDataSource *)self itemAtIndexPath:v7];
      [WeakRetained itemChanged:v8 atIndexPath:v7];

      ++v6;
    }
    while (v6 < [(NSArray *)self->_tileGroups count]);
  }
}

- (void)updateContentIsLoaded
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (!self->_allContentIsLoaded)
  {
    uint64_t v41 = [(PKPaymentPass *)self->_pass uniqueID];
    id v42 = objc_alloc(MEMORY[0x1E4F28E78]);
    if (self->_messagesLoaded) {
      uint64_t v3 = @"YES";
    }
    else {
      uint64_t v3 = @"NO";
    }
    id v39 = v3;
    uint64_t v40 = NSString;
    if (self->_secondaryMessagesLoaded) {
      id v4 = @"YES";
    }
    else {
      id v4 = @"NO";
    }
    if (self->_engagementMessagesLoaded) {
      unint64_t v5 = @"YES";
    }
    else {
      unint64_t v5 = @"NO";
    }
    id v37 = v5;
    id v38 = v4;
    if (self->_balanceLoaded) {
      unint64_t v6 = @"YES";
    }
    else {
      unint64_t v6 = @"NO";
    }
    uint64_t v36 = v6;
    if (self->_productsLoaded) {
      id v7 = @"YES";
    }
    else {
      id v7 = @"NO";
    }
    if (self->_scheduledPaymentsLoaded) {
      unint64_t v8 = @"YES";
    }
    else {
      unint64_t v8 = @"NO";
    }
    if (self->_familyCollectionLoaded) {
      uint64_t v9 = @"YES";
    }
    else {
      uint64_t v9 = @"NO";
    }
    if (self->_creditRecoveryPaymentPlansLoaded) {
      id v10 = @"YES";
    }
    else {
      id v10 = @"NO";
    }
    if (self->_tilesLoaded) {
      uint64_t v11 = @"YES";
    }
    else {
      uint64_t v11 = @"NO";
    }
    if (self->_auxiliarySectionInfoLoaded) {
      id v12 = @"YES";
    }
    else {
      id v12 = @"NO";
    }
    if (self->_homeKitRestrictedGuestAccessStateLoaded) {
      uint64_t v13 = @"YES";
    }
    else {
      uint64_t v13 = @"NO";
    }
    if ([(PKDashboardPaymentPassDataSource *)self accountsLoaded]) {
      id v14 = @"YES";
    }
    else {
      id v14 = @"NO";
    }
    uint64_t v15 = [v40 stringWithFormat:@"Dashboard loading (%p): %@ - m:%@, sm:%@, em:%@, b:%@, p:%@, sp:%@, f:%@, crpp:%@, ti:%@, as:%@, rg:%@, a:%@", self, v41, v39, v38, v37, v36, v7, v8, v9, v10, v11, v12, v13, v14];
    uint64_t v16 = (PKDashboardPaymentPassDataSource *)[v42 initWithString:v15];

    if (self->_accountUsersLoaded) {
      id v17 = @"YES";
    }
    else {
      id v17 = @"NO";
    }
    [(PKDashboardPaymentPassDataSource *)v16 appendFormat:@" u:%@", v17];
    if (self->_accountUserInvitationsLoaded) {
      id v18 = @"YES";
    }
    else {
      id v18 = @"NO";
    }
    [(PKDashboardPaymentPassDataSource *)v16 appendFormat:@" ui:%@", v18];
    if ([(PKDashboardPaymentPassDataSource *)self financingPlansLoaded]) {
      id v19 = @"YES";
    }
    else {
      id v19 = @"NO";
    }
    [(PKDashboardPaymentPassDataSource *)v16 appendFormat:@" fp:%@", v19];
    if (self->_physicalCardsLoaded) {
      long long v20 = @"YES";
    }
    else {
      long long v20 = @"NO";
    }
    [(PKDashboardPaymentPassDataSource *)v16 appendFormat:@" pc:%@", v20];
    if ([(PKDashboardPaymentPassDataSource *)self recurringPeerPaymentsLoaded]) {
      id v21 = @"YES";
    }
    else {
      id v21 = @"NO";
    }
    [(PKDashboardPaymentPassDataSource *)v16 appendFormat:@" rpp:%@", v21];
    if ([(PKDashboardPaymentPassDataSource *)self isBankConnectSupported]
      && ![(PKDashboardPaymentPassDataSource *)self bankConnectDataLoaded])
    {
      [(PKDashboardPaymentPassDataSource *)v16 appendFormat:@" bc:%@", @"NO"];
      BOOL v23 = 0;
      char v22 = 1;
    }
    else
    {
      [(PKDashboardPaymentPassDataSource *)v16 appendFormat:@" bc:%@", @"YES"];
      if ([(PKDashboardPaymentPassDataSource *)self isBankConnectLinked])
      {
        char v22 = 0;
        BOOL v23 = 1;
      }
      else
      {
        if (self->_transactions) {
          id v24 = @"YES";
        }
        else {
          id v24 = @"NO";
        }
        if (self->_transactionsPerPeriodLoaded) {
          uint64_t v25 = @"YES";
        }
        else {
          uint64_t v25 = @"NO";
        }
        if (self->_transactionSourceCollection) {
          uint64_t v26 = @"YES";
        }
        else {
          uint64_t v26 = @"NO";
        }
        [(PKDashboardPaymentPassDataSource *)v16 appendFormat:@" t:%@, tg:%@, tsc:%@", v24, v25, v26];
        if (self->_transactions && self->_transactionsPerPeriodLoaded)
        {
          char v22 = 0;
          BOOL v23 = self->_transactionSourceCollection != 0;
        }
        else
        {
          char v22 = 0;
          BOOL v23 = 0;
        }
      }
    }
    uint64_t v27 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v49 = v16;
      _os_log_impl(&dword_19F450000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }

    if (v23
      && self->_tilesLoaded
      && self->_messagesLoaded
      && self->_secondaryMessagesLoaded
      && self->_auxiliarySectionInfoLoaded
      && self->_balanceLoaded
      && self->_productsLoaded
      && self->_scheduledPaymentsLoaded
      && self->_familyCollectionLoaded
      && self->_creditRecoveryPaymentPlansLoaded
      && self->_physicalCardsLoaded
      && self->_engagementMessagesLoaded
      && self->_accountUsersLoaded
      && self->_accountUserInvitationsLoaded
      && [(PKDashboardPaymentPassDataSource *)self financingPlansLoaded]
      && [(PKDashboardPaymentPassDataSource *)self accountsLoaded]
      && [(PKDashboardPaymentPassDataSource *)self recurringPeerPaymentsLoaded])
    {
      char v28 = self->_homeKitRestrictedGuestAccessStateLoaded ? v22 : 1;
      if ((v28 & 1) == 0)
      {
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          id v49 = self;
          _os_log_impl(&dword_19F450000, v27, OS_LOG_TYPE_DEFAULT, "Dashboard loading (%p): Completed", buf, 0xCu);
        }

        self->_allContentIsLoaded = 1;
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        BOOL v30 = WeakRetained;
        if (WeakRetained) {
          [WeakRetained contentIsLoaded];
        }
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v31 = (void *)[(NSMutableArray *)self->_executionBlocksContentIsLoaded copy];
        uint64_t v32 = [v31 countByEnumeratingWithState:&v43 objects:v47 count:16];
        if (v32)
        {
          uint64_t v33 = v32;
          uint64_t v34 = *(void *)v44;
          do
          {
            for (uint64_t i = 0; i != v33; ++i)
            {
              if (*(void *)v44 != v34) {
                objc_enumerationMutation(v31);
              }
              (*(void (**)(void))(*(void *)(*((void *)&v43 + 1) + 8 * i) + 16))();
            }
            uint64_t v33 = [v31 countByEnumeratingWithState:&v43 objects:v47 count:16];
          }
          while (v33);
        }

        [(NSMutableArray *)self->_executionBlocksContentIsLoaded removeAllObjects];
      }
    }
  }
}

- (void)reloadAllContent
{
  [(PKDashboardPaymentPassDataSource *)self reloadDialogRequests];
  [(PKDashboardPaymentPassDataSource *)self reloadAccount];
  [(PKDashboardPaymentPassDataSource *)self reloadTransitSection];
  [(PKDashboardPaymentPassDataSource *)self reloadBankConnectData];

  [(PKDashboardPaymentPassDataSource *)self reloadAssociatedPaymentRewardsBalance];
}

- (void)secureElementDidEnterRestrictedMode:(id)a3
{
  self->_isInRestrictedMode = 1;
  [(PKDashboardPaymentPassDataSource *)self reloadMessages];
}

- (void)secureElementDidLeaveRestrictedMode:(id)a3
{
  self->_isInRestrictedMode = 0;
  [(PKDashboardPaymentPassDataSource *)self reloadMessages];
}

- (void)dashboardMessageComposer:(id)a3 requestPushViewController:(id)a4
{
  groupView = self->_groupView;
  id v5 = a4;
  id v7 = [(UIView *)groupView pkui_viewControllerFromResponderChain];
  unint64_t v6 = [v7 navigationController];
  [v6 pushViewController:v5 animated:1];
}

- (void)dashboardMessageComposer:(id)a3 requestPresentViewController:(id)a4
{
  groupView = self->_groupView;
  id v5 = a4;
  id v6 = [(UIView *)groupView pkui_viewControllerFromResponderChain];
  [v6 presentViewController:v5 animated:1 completion:0];
}

- (void)dashboardMessageComposer:(id)a3 requestPresentPassDetailsForPass:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    unint64_t v8 = [v6 uniqueID];
    uint64_t v9 = [(PKPaymentPass *)self->_pass uniqueID];
    id v10 = v8;
    id v11 = v9;
    if (v10 == v11)
    {
    }
    else
    {
      id v12 = v11;
      if (!v10 || !v11)
      {

LABEL_10:
        id v14 = [v7 uniqueID];
        PKOpenPassDetails();

        goto LABEL_11;
      }
      char v13 = [v10 isEqualToString:v11];

      if ((v13 & 1) == 0) {
        goto LABEL_10;
      }
    }
    [(PKDashboardPaymentPassDataSource *)self _presentPassDetailsWithHandler:0];
  }
LABEL_11:
}

- (void)dashboardMessageComposer:(id)a3 requestPresentFinancingPlanDetails:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    unint64_t v8 = [PKPayLaterFinancingPlanViewController alloc];
    uint64_t v9 = [(PKDashboardPaymentPassDataSource *)self account];
    id v10 = [(PKDashboardPaymentPassDataSource *)self paymentIntentController];
    id v11 = [(PKPayLaterFinancingPlanViewController *)v8 initWithFinancingPlan:v7 payLaterAccount:v9 paymentIntentController:v10 merchantIcon:0 iconGenerator:0];

    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __96__PKDashboardPaymentPassDataSource_dashboardMessageComposer_requestPresentFinancingPlanDetails___block_invoke;
    v13[3] = &unk_1E59CB268;
    objc_copyWeak(&v15, &location);
    id v12 = v11;
    id v14 = v12;
    [(PKPayLaterFinancingPlanViewController *)v12 preflightWithCompletion:v13];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __96__PKDashboardPaymentPassDataSource_dashboardMessageComposer_requestPresentFinancingPlanDetails___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    uint64_t v3 = objc_msgSend(WeakRetained[1], "pkui_viewControllerFromResponderChain");
    id v4 = [v3 navigationController];
    [v4 pushViewController:*(void *)(a1 + 32) animated:1];

    id WeakRetained = v5;
  }
}

- (void)_lostModeButtonTapped
{
  if (self->_performingLostModeExit)
  {
    id v2 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Skipping FMDFMIP lost mode exit.", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    self->_performingLostModeExit = 1;
    [(PKDashboardPaymentPassDataSource *)self reloadMessages];
    id v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Starting FMDFMIP lost mode exit.", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    id v5 = [MEMORY[0x1E4F61A48] sharedInstance];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    void v6[2] = __57__PKDashboardPaymentPassDataSource__lostModeButtonTapped__block_invoke;
    v6[3] = &unk_1E59CB240;
    objc_copyWeak(&v7, buf);
    [v5 initiateLostModeExitAuthWithCompletion:v6];

    objc_destroyWeak(&v7);
    objc_destroyWeak(buf);
  }
}

void __57__PKDashboardPaymentPassDataSource__lostModeButtonTapped__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      id v6 = [v3 localizedDescription];
      *(_DWORD *)buf = 138412290;
      id v10 = v6;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Error exiting lost mode: %@", buf, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Completed FMDFMIP lost mode exit.", buf, 2u);
    }

    PKSetNeedsLostModeExitAuth();
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__PKDashboardPaymentPassDataSource__lostModeButtonTapped__block_invoke_1910;
  block[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v8);
}

void __57__PKDashboardPaymentPassDataSource__lostModeButtonTapped__block_invoke_1910(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[210] = 0;
    id v2 = WeakRetained;
    [WeakRetained reloadMessages];
    id WeakRetained = v2;
  }
}

- (void)_deleteButtonPressed
{
}

- (void)_presentAboutClosedAccounts
{
  id v3 = [(UIView *)self->_groupView pkui_viewControllerFromResponderChain];
  id v6 = [v3 navigationController];

  id v4 = [[PKAccountClosedViewController alloc] initWithAccount:self->_account accountUserCollection:self->_accountUserCollection familyMemberCollection:self->_familyCollection context:0];
  BOOL v5 = [[PKNavigationController alloc] initWithRootViewController:v4];
  [v6 presentViewController:v5 animated:1 completion:0];
}

- (void)_presentCardNumbers
{
  id v2 = [(UIView *)self->_groupView pkui_viewControllerFromResponderChain];
  id v3 = [v2 navigationController];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 presentCardNumbers];
  }
}

- (void)_presentPassDetailsWithAction:(unint64_t)a3
{
  id v4 = [(UIView *)self->_groupView pkui_viewControllerFromResponderChain];
  id v5 = [v4 navigationController];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 presentPassDetailsAnimated:1 action:a3];
  }
}

- (void)_presentPassDetailsWithHandler:(id)a3
{
  id v6 = a3;
  id v4 = [(UIView *)self->_groupView pkui_viewControllerFromResponderChain];
  id v5 = [v4 navigationController];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 presentPassDetailsAnimated:1 handler:v6];
  }
}

- (void)_presentPassWithPassUniqueIdentifier:(id)a3
{
  id v7 = a3;
  id v4 = [(UIView *)self->_groupView pkui_viewControllerFromResponderChain];
  id v5 = [v4 navigationController];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v5 presentingViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v6 presentPassWithUniqueID:v7 animated:1 completionHandler:0];
    }
  }
}

- (void)_presentApplCashFamilySetupForFamilyMember:(id)a3
{
  id v4 = a3;
  id v5 = [PKPeerPaymentAssociatedAccountsController alloc];
  familyCollection = self->_familyCollection;
  avatarManager = self->_avatarManager;
  id v8 = objc_alloc_init(MEMORY[0x1E4F848A0]);
  uint64_t v9 = [(PKPeerPaymentAssociatedAccountsController *)v5 initWithFamilyCollection:familyCollection avatarManager:avatarManager passLibraryDataProvider:v8 context:0];
  associatedAccountsController = self->_associatedAccountsController;
  self->_associatedAccountsController = v9;

  char v13 = [[PKPeerPaymentAssociatedAccountPresentationContext alloc] initWithPKFamilyMember:v4 setupType:1];
  uint64_t v11 = [(UIView *)self->_groupView pkui_viewControllerFromResponderChain];
  id v12 = [v11 navigationController];

  [(PKPeerPaymentAssociatedAccountsController *)self->_associatedAccountsController presentAssociatedAccountsFlowWithPresentationContext:v13 fromNavigationController:v12];
}

- (void)_presentBalanceDetails
{
  id v3 = [PKCreditBalanceDetailsViewController alloc];
  transactionSourceCollection = self->_transactionSourceCollection;
  familyCollection = self->_familyCollection;
  id v6 = [MEMORY[0x1E4F84D50] sharedService];
  uint64_t v9 = [(PKCreditBalanceDetailsViewController *)v3 initWithStyle:0 transactionSourceCollection:transactionSourceCollection familyCollection:familyCollection webService:v6 account:self->_account accountUserCollection:self->_accountUserCollection physicalCards:self->_physicalCards statement:0 previousStatements:0];

  id v7 = [(UIView *)self->_groupView pkui_viewControllerFromResponderChain];
  id v8 = [v7 navigationController];
  [v8 pushViewController:v9 animated:1];
}

- (void)_presentCreateAccountUserInvitation
{
  id v3 = [(UIView *)self->_groupView pkui_viewControllerFromResponderChain];
  +[PKAccountInvitationController presentCreateAccountUserInvitationWithViewController:v3 account:self->_account accountUserCollection:self->_accountUserCollection familyMemberCollection:self->_familyCollection context:0 completion:0];
}

- (void)_presentAccountUserDetails:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __63__PKDashboardPaymentPassDataSource__presentAccountUserDetails___block_invoke;
  v6[3] = &unk_1E59DA1F0;
  id v7 = v4;
  id v5 = v4;
  [(PKDashboardPaymentPassDataSource *)self _presentPassDetailsWithHandler:v6];
}

void __63__PKDashboardPaymentPassDataSource__presentAccountUserDetails___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 altDSID];
  [v3 presentAccountUserDetailsForAccountUserAltDSID:v4];
}

- (void)_presentAccountUserInvitation:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __66__PKDashboardPaymentPassDataSource__presentAccountUserInvitation___block_invoke;
  v6[3] = &unk_1E59DA1F0;
  id v7 = v4;
  id v5 = v4;
  [(PKDashboardPaymentPassDataSource *)self _presentPassDetailsWithHandler:v6];
}

void __66__PKDashboardPaymentPassDataSource__presentAccountUserInvitation___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 applicationIdentifier];
  [v3 presentAccountUserInvitationWithIdentifier:v4];
}

- (void)_presentInboxMessage:(id)a3
{
  id v4 = a3;
  if (self->_inboxDataSource)
  {
    objc_initWeak(&location, self);
    inboxDataSource = self->_inboxDataSource;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    void v6[2] = __57__PKDashboardPaymentPassDataSource__presentInboxMessage___block_invoke;
    v6[3] = &unk_1E59CB010;
    objc_copyWeak(&v8, &location);
    id v7 = v4;
    [(PKInboxDataSource *)inboxDataSource updateInboxWithCompletion:v6];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __57__PKDashboardPaymentPassDataSource__presentInboxMessage___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __57__PKDashboardPaymentPassDataSource__presentInboxMessage___block_invoke_2;
  v2[3] = &unk_1E59CB010;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  id v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v2);

  objc_destroyWeak(&v4);
}

void __57__PKDashboardPaymentPassDataSource__presentInboxMessage___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained && [WeakRetained[58] hasInboxMessages])
  {
    id v4 = [[PKInboxViewController alloc] initWithInboxDataSource:v3[58] contactAvatarManager:v3[99] context:0];
    id v5 = [[PKNavigationController alloc] initWithRootViewController:v4];
    id v6 = objc_msgSend(v3[1], "pkui_viewControllerFromResponderChain");
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __57__PKDashboardPaymentPassDataSource__presentInboxMessage___block_invoke_3;
    v8[3] = &unk_1E59CA870;
    uint64_t v9 = v4;
    id v10 = *(id *)(a1 + 32);
    id v7 = v4;
    [v6 presentViewController:v5 animated:1 completion:v8];
  }
}

void __57__PKDashboardPaymentPassDataSource__presentInboxMessage___block_invoke_3(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) identifier];
  [v1 presentInboxMessageWithIdentifier:v2];
}

- (void)_presentRestrictedGuestAccessSchedule
{
  homeKitHomeIdentifier = self->_homeKitHomeIdentifier;
  if (homeKitHomeIdentifier)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __73__PKDashboardPaymentPassDataSource__presentRestrictedGuestAccessSchedule__block_invoke;
    v4[3] = &unk_1E59CA870;
    v4[4] = self;
    void v4[5] = homeKitHomeIdentifier;
    id v3 = homeKitHomeIdentifier;
    dispatch_async(MEMORY[0x1E4F14428], v4);
  }
}

void __73__PKDashboardPaymentPassDataSource__presentRestrictedGuestAccessSchedule__block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "pkui_viewControllerFromResponderChain");
  id v3 = [v2 navigationController];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 presentRestrictedGuestAccessScheduleWithHomeIdentifier:*(void *)(a1 + 40)];
  }
}

- (BOOL)_canDisplayBalance
{
  if ([(PKDashboardPaymentPassDataSource *)self _isCreditPass])
  {
    transactionSourceCollection = self->_transactionSourceCollection;
    account = self->_account;
    LOBYTE(v5) = +[PKCreditAccountController shouldDisplayAccountInformationForTransactionSourceCollection:transactionSourceCollection withAccount:account];
  }
  else if ([(PKDashboardPaymentPassDataSource *)self _isPayLaterPass])
  {
    LOBYTE(v5) = [(PKDashboardPaymentPassDataSource *)self canDisplayPayLaterBalance];
  }
  else if ([(PKDashboardPaymentPassDataSource *)self _isAppleBalancePass])
  {
    LOBYTE(v5) = [(PKDashboardPaymentPassDataSource *)self canDisplayAppleBalanceBalance];
  }
  else
  {
    BOOL v5 = [(PKDashboardPaymentPassDataSource *)self _isPeerPaymentPass];
    if (v5)
    {
      LOBYTE(v5) = [(PKDashboardPaymentPassDataSource *)self canDisplayPeerPaymentBalanceModule];
    }
  }
  return v5;
}

- (void)_performReloadTransitSection
{
  id v3 = [(PKPaymentPass *)self->_pass uniqueID];
  id v4 = dispatch_group_create();
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__42;
  void v31[4] = __Block_byref_object_dispose__42;
  id v32 = 0;
  v29[0] = 0;
  v29[1] = v29;
  id v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__42;
  void v29[4] = __Block_byref_object_dispose__42;
  id v30 = 0;
  v27[0] = 0;
  v27[1] = v27;
  void v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__42;
  v27[4] = __Block_byref_object_dispose__42;
  id v28 = 0;
  objc_initWeak(&location, self);
  BOOL v5 = [(PKPaymentPass *)self->_pass devicePrimaryPaymentApplication];
  dispatch_group_enter(v4);
  paymentDataProvider = self->_paymentDataProvider;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __64__PKDashboardPaymentPassDataSource__performReloadTransitSection__block_invoke;
  v21[3] = &unk_1E59DA218;
  objc_copyWeak(&v25, &location);
  id v24 = v31;
  id v7 = v5;
  id v22 = v7;
  id v8 = v4;
  BOOL v23 = v8;
  [(PKPaymentDefaultDataProvider *)paymentDataProvider transitStateWithPassUniqueIdentifier:v3 paymentApplication:v7 completion:v21];
  dispatch_group_enter(v8);
  uint64_t v9 = self->_paymentDataProvider;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __64__PKDashboardPaymentPassDataSource__performReloadTransitSection__block_invoke_2;
  v18[3] = &unk_1E59D1818;
  long long v20 = v29;
  id v10 = v8;
  id v19 = v10;
  [(PKPaymentDefaultDataProvider *)v9 balancesForPaymentPassWithUniqueIdentifier:v3 completion:v18];
  dispatch_group_enter(v10);
  uint64_t v11 = self->_paymentDataProvider;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  id v15[2] = __64__PKDashboardPaymentPassDataSource__performReloadTransitSection__block_invoke_3;
  v15[3] = &unk_1E59CC5A8;
  id v17 = v27;
  id v12 = v10;
  uint64_t v16 = v12;
  [(PKPaymentDefaultDataProvider *)v11 plansForPaymentPassWithUniqueIdentifier:v3 completion:v15];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PKDashboardPaymentPassDataSource__performReloadTransitSection__block_invoke_4;
  block[3] = &unk_1E59DA240;
  objc_copyWeak(&v14, &location);
  void block[4] = v31;
  void block[5] = v29;
  void block[6] = v27;
  dispatch_group_notify(v12, MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v14);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
  _Block_object_dispose(v27, 8);

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v31, 8);
}

void __64__PKDashboardPaymentPassDataSource__performReloadTransitSection__block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = [v8 transitPassPropertiesWithPaymentApplication:*(void *)(a1 + 32) pass:*((void *)WeakRetained + 110)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __64__PKDashboardPaymentPassDataSource__performReloadTransitSection__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __64__PKDashboardPaymentPassDataSource__performReloadTransitSection__block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __64__PKDashboardPaymentPassDataSource__performReloadTransitSection__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _updateTransitBalanceProperties:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) dynamicBalances:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) dynamicPlans:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    id WeakRetained = v3;
  }
}

- (void)reloadTransitSection
{
  transitBalanceModel = self->_transitBalanceModel;
  if (!transitBalanceModel
    || ([(PKTransitBalanceModel *)transitBalanceModel pass],
        id v4 = (PKPaymentPass *)objc_claimAutoreleasedReturnValue(),
        pass = self->_pass,
        v4,
        v4 != pass))
  {
    [(PKDashboardPaymentPassDataSource *)self _performReloadTransitSection];
  }
}

- (void)_cancelExpirationTimerIfNeeded
{
  expirationTimer = self->_expirationTimer;
  if (expirationTimer) {
    dispatch_source_cancel(expirationTimer);
  }
}

- (void)_scheduleExpirationTimerForCommutePlans:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && [v4 count])
  {
    uint64_t v6 = [v5 sortedArrayUsingComparator:&__block_literal_global_1922];
    id v7 = [v6 firstObject];
    id v8 = [v7 expiryDate];
    if (v8)
    {
      uint64_t v9 = [MEMORY[0x1E4F1C9C8] date];
      [v8 timeIntervalSinceDate:v9];
      double v11 = v10;

      if (v11 >= 1.0)
      {
        [(PKDashboardPaymentPassDataSource *)self _cancelExpirationTimerIfNeeded];
        id v12 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
        expirationTimer = self->_expirationTimer;
        self->_expirationTimer = v12;

        id v14 = self->_expirationTimer;
        double v15 = v11 * 1000000000.0;
        dispatch_time_t v16 = dispatch_time(0, (uint64_t)v15);
        dispatch_source_set_timer(v14, v16, (unint64_t)v15, 0);
        objc_initWeak(&location, self);
        id v17 = self->_expirationTimer;
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __76__PKDashboardPaymentPassDataSource__scheduleExpirationTimerForCommutePlans___block_invoke_2;
        v18[3] = &unk_1E59CA7F8;
        objc_copyWeak(&v19, &location);
        dispatch_source_set_event_handler(v17, v18);
        dispatch_resume((dispatch_object_t)self->_expirationTimer);
        objc_destroyWeak(&v19);
        objc_destroyWeak(&location);
      }
    }
  }
  else
  {
    [(PKDashboardPaymentPassDataSource *)self _cancelExpirationTimerIfNeeded];
  }
}

uint64_t __76__PKDashboardPaymentPassDataSource__scheduleExpirationTimerForCommutePlans___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 expiryDate];
  uint64_t v6 = [v4 expiryDate];

  if (v5)
  {
    if (v6) {
      uint64_t v7 = [v5 compare:v6];
    }
    else {
      uint64_t v7 = -1;
    }
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

void __76__PKDashboardPaymentPassDataSource__scheduleExpirationTimerForCommutePlans___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = (void *)WeakRetained[92];
    WeakRetained[92] = 0;
    id v3 = WeakRetained;

    [v3 _performReloadTransitSection];
    id WeakRetained = v3;
  }
}

- (void)_updateTransitBalanceProperties:(id)a3 dynamicBalances:(id)a4 dynamicPlans:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = self->_pass;
  if ([(PKPaymentPass *)v11 isStoredValuePass])
  {
    NSUInteger v12 = [(NSArray *)self->_transitItems count];
    char v13 = self->_transitBalanceModel;
    id v14 = v13;
    if (!v13
      || ([(PKTransitBalanceModel *)v13 pass],
          double v15 = (PKPaymentPass *)objc_claimAutoreleasedReturnValue(),
          v15,
          v15 != v11))
    {
      uint64_t v16 = [objc_alloc(MEMORY[0x1E4F850D0]) initWithPass:v11];

      id v14 = (void *)v16;
    }
    if (v8) {
      [v14 setTransitProperties:v8];
    }
    if (v9) {
      [v14 updateWithDynamicBalances:v9];
    }
    if (v10) {
      [v14 updateWithDynamicCommutePlans:v10];
    }
    id v17 = [v14 displayableCommutePlans];
    [(PKDashboardPaymentPassDataSource *)self _scheduleExpirationTimerForCommutePlans:v17];

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __97__PKDashboardPaymentPassDataSource__updateTransitBalanceProperties_dynamicBalances_dynamicPlans___block_invoke;
    aBlock[3] = &unk_1E59DA2B0;
    uint64_t v29 = v11;
    id v18 = v14;
    id v30 = v18;
    long long v31 = self;
    NSUInteger v32 = v12;
    id v19 = (unsigned int (**)(void))_Block_copy(aBlock);
    long long v20 = v19;
    if (self->_allContentIsLoaded)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (WeakRetained)
      {
        unint64_t v22 = [(PKDashboardPaymentPassDataSource *)self firstSectionIndexForSectionIdentifier:7];
        if (v20[2](v20))
        {
          BOOL v23 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v22];
          [WeakRetained reloadSections:v23];
        }
        else
        {
          transitItems = self->_transitItems;
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          void v25[2] = __97__PKDashboardPaymentPassDataSource__updateTransitBalanceProperties_dynamicBalances_dynamicPlans___block_invoke_3;
          v25[3] = &unk_1E59DA2D8;
          unint64_t v27 = v22;
          id v26 = WeakRetained;
          [(NSArray *)transitItems enumerateObjectsUsingBlock:v25];
          BOOL v23 = v26;
        }
      }
    }
    else
    {
      v19[2](v19);
      [(PKDashboardPaymentPassDataSource *)self updateContentIsLoaded];
    }
  }
}

BOOL __97__PKDashboardPaymentPassDataSource__updateTransitBalanceProperties_dynamicBalances_dynamicPlans___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([*(id *)(a1 + 32) activationState]) {
    goto LABEL_15;
  }
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  BOOL v23 = __97__PKDashboardPaymentPassDataSource__updateTransitBalanceProperties_dynamicBalances_dynamicPlans___block_invoke_2;
  id v24 = &unk_1E59DA288;
  id v25 = *(id *)(a1 + 32);
  id v26 = *(id *)(a1 + 40);
  id v3 = (void (**)(void *, uint64_t))_Block_copy(&v21);
  int v4 = objc_msgSend(*(id *)(a1 + 32), "isEMoneyPass", v21, v22, v23, v24);
  uint64_t v5 = *(void **)(a1 + 40);
  if (v4)
  {
    if ([v5 hasCurrencyBalance])
    {
      uint64_t v6 = v3[2](v3, 1);
      [v2 addObject:v6];
    }
    if (([*(id *)(a1 + 40) hasPointsBalance] & 1) == 0) {
      goto LABEL_10;
    }
    uint64_t v7 = 2;
    goto LABEL_9;
  }
  if ([v5 hasBalanceContent])
  {
    uint64_t v7 = 0;
LABEL_9:
    id v8 = v3[2](v3, v7);
    [v2 addObject:v8];
  }
LABEL_10:
  if ([*(id *)(a1 + 40) hasCommutePlanContent])
  {
    id v9 = v3[2](v3, 3);
    id v10 = [*(id *)(a1 + 40) displayableCommutePlans];
    [v9 setTransitCommutePlans:v10];

    [v2 addObject:v9];
  }
  double v11 = [*(id *)(a1 + 32) actionGroups];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    char v13 = v3[2](v3, 4);
    id v14 = [*(id *)(a1 + 40) displayableCommutePlans];
    [v13 setTransitCommutePlans:v14];

    double v15 = [*(id *)(a1 + 32) actionGroups];
    [v13 setActionGroups:v15];

    [v2 addObject:v13];
  }

LABEL_15:
  objc_storeStrong((id *)(*(void *)(a1 + 48) + 216), *(id *)(a1 + 40));
  uint64_t v16 = [v2 copy];
  uint64_t v17 = *(void *)(a1 + 48);
  id v18 = *(void **)(v17 + 224);
  *(void *)(v17 + 224) = v16;

  *(unsigned char *)(*(void *)(a1 + 48) + 232) = 1;
  BOOL v19 = [v2 count] != *(void *)(a1 + 56);

  return v19;
}

PKDashboardTransitItem *__97__PKDashboardPaymentPassDataSource__updateTransitBalanceProperties_dynamicBalances_dynamicPlans___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v2 = [[PKDashboardTransitItem alloc] initWithPass:*(void *)(a1 + 32) transitBalanceModel:*(void *)(a1 + 40) type:a2];

  return v2;
}

void __97__PKDashboardPaymentPassDataSource__updateTransitBalanceProperties_dynamicBalances_dynamicPlans___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (void *)MEMORY[0x1E4F28D58];
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = a2;
  id v8 = [v5 indexPathForItem:a3 inSection:v6];
  [*(id *)(a1 + 32) itemChanged:v7 atIndexPath:v8];
}

- (BOOL)_passAvailableForAMPEnrollment
{
  id v3 = AMPEnrollmentDismissedKeyForPass();
  char BoolForKey = PKSharedCacheGetBoolForKey();

  if (BoolForKey) {
    goto LABEL_6;
  }
  int v5 = [(PKPaymentPass *)self->_pass hasAssociatedPeerPaymentAccount];
  if (!v5) {
    return v5;
  }
  uint64_t v6 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount currentBalance];
  id v7 = [v6 amount];
  id v8 = [MEMORY[0x1E4F28C28] zero];
  uint64_t v9 = [v7 compare:v8];

  __int16 v10 = [(PKDashboardPaymentPassDataSource *)self _peerPaymentDashboardCondition];
  if (v9 != 1)
  {
LABEL_6:
    LOBYTE(v5) = 0;
    return v5;
  }
  LOBYTE(v5) = (v10 & 0x101) != 0x100
            || [(PKPaymentPass *)self->_pass activationState] == PKPaymentPassActivationStateSuspended;
  return v5;
}

- (void)_fetchAMPEnrollmentEligibility
{
  objc_initWeak(&location, self);
  AMPEnrollmentManager = self->_AMPEnrollmentManager;
  pass = self->_pass;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  id v7[2] = __66__PKDashboardPaymentPassDataSource__fetchAMPEnrollmentEligibility__block_invoke;
  v7[3] = &unk_1E59CC670;
  objc_copyWeak(&v8, &location);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__PKDashboardPaymentPassDataSource__fetchAMPEnrollmentEligibility__block_invoke_3;
  v5[3] = &unk_1E59CEAC0;
  objc_copyWeak(&v6, &location);
  [(PKAMPEnrollmentManager *)AMPEnrollmentManager enrollmentStatusForPaymentPass:pass completion:v7 progress:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __66__PKDashboardPaymentPassDataSource__fetchAMPEnrollmentEligibility__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v10 = v5;
      _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "enrollmentStatusForPaymentPass completion error: %{public}@", buf, 0xCu);
    }
  }
  else if (a2)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    id v7[2] = __66__PKDashboardPaymentPassDataSource__fetchAMPEnrollmentEligibility__block_invoke_1928;
    v7[3] = &unk_1E59CF720;
    objc_copyWeak(v8, (id *)(a1 + 32));
    v8[1] = a2;
    dispatch_async(MEMORY[0x1E4F14428], v7);
    objc_destroyWeak(v8);
  }
}

void __66__PKDashboardPaymentPassDataSource__fetchAMPEnrollmentEligibility__block_invoke_1928(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v4 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 576) = 1;
    *((unsigned char *)WeakRetained + 209) = *(void *)(a1 + 40) == 2;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __66__PKDashboardPaymentPassDataSource__fetchAMPEnrollmentEligibility__block_invoke_2;
    v5[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v6, v2);
    [v4 _fetchAMPEnrollmentIconIfNeeded:v5];
    objc_destroyWeak(&v6);
  }
}

void __66__PKDashboardPaymentPassDataSource__fetchAMPEnrollmentEligibility__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadMessages];
}

void __66__PKDashboardPaymentPassDataSource__fetchAMPEnrollmentEligibility__block_invoke_3(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v11 = v5;
      _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "enrollmentStatusForPaymentPass progress error: %{public}@", buf, 0xCu);
    }
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  id v7[2] = __66__PKDashboardPaymentPassDataSource__fetchAMPEnrollmentEligibility__block_invoke_1930;
  v7[3] = &unk_1E59CB0B0;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  char v9 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v7);
  objc_destroyWeak(&v8);
}

void __66__PKDashboardPaymentPassDataSource__fetchAMPEnrollmentEligibility__block_invoke_1930(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v4 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 576) = *(unsigned char *)(a1 + 40) ^ 1;
    *((unsigned char *)WeakRetained + 209) = 0;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __66__PKDashboardPaymentPassDataSource__fetchAMPEnrollmentEligibility__block_invoke_2_1931;
    v5[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v6, v2);
    [v4 _fetchAMPEnrollmentIconIfNeeded:v5];
    objc_destroyWeak(&v6);
  }
}

void __66__PKDashboardPaymentPassDataSource__fetchAMPEnrollmentEligibility__block_invoke_2_1931(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadMessages];
}

- (void)_addToAMPButtonTappedForPass:(id)a3
{
  id v4 = a3;
  if (!self->_performingAMPEnrollment)
  {
    self->_performingAMPEnrollment = 1;
    [(PKDashboardPaymentPassDataSource *)self reloadMessages];
    id v5 = [(UIView *)self->_groupView pkui_viewControllerFromResponderChain];
    objc_initWeak(&location, v5);

    objc_initWeak(&from, self);
    AMPEnrollmentManager = self->_AMPEnrollmentManager;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    id v7[2] = __65__PKDashboardPaymentPassDataSource__addToAMPButtonTappedForPass___block_invoke;
    v7[3] = &unk_1E59DA328;
    objc_copyWeak(&v9, &from);
    id v8 = v4;
    objc_copyWeak(&v10, &location);
    [(PKAMPEnrollmentManager *)AMPEnrollmentManager enrollPaymentPass:v8 isDefault:0 completion:v7];
    objc_destroyWeak(&v10);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

void __65__PKDashboardPaymentPassDataSource__addToAMPButtonTappedForPass___block_invoke(id *a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__PKDashboardPaymentPassDataSource__addToAMPButtonTappedForPass___block_invoke_2;
  block[3] = &unk_1E59DA300;
  id v8 = v5;
  id v6 = v5;
  objc_copyWeak(&v10, a1 + 5);
  char v12 = a2;
  id v9 = a1[4];
  objc_copyWeak(&v11, a1 + 6);
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&v10);
}

void __65__PKDashboardPaymentPassDataSource__addToAMPButtonTappedForPass___block_invoke_2(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v33 = v2;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "enrollPaymentPass error: %{public}@", buf, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 576) = *(unsigned char *)(a1 + 64) ^ 1;
    *((unsigned char *)WeakRetained + 209) = 0;
    id v6 = AMPEnrollmentDismissedKeyForPass();
    PKSharedCacheSetBoolForKey();

    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __65__PKDashboardPaymentPassDataSource__addToAMPButtonTappedForPass___block_invoke_1932;
    v30[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v31, (id *)(a1 + 48));
    [v5 _fetchAMPEnrollmentIconIfNeeded:v30];
    objc_destroyWeak(&v31);
  }
  id v7 = objc_loadWeakRetained((id *)(a1 + 56));
  if (v7)
  {
    id v8 = (void *)MEMORY[0x1E4FB1418];
    if (*(unsigned char *)(a1 + 64))
    {
      id v9 = PKLocalizedAMPString(&cfstr_PassDashboardA_2.isa);
      id v10 = [*(id *)(a1 + 40) localizedDescription];
      id v11 = PKLocalizedAMPString(&cfstr_PassDashboardA_3.isa, &stru_1EF1B4C70.isa, v10);
      char v12 = [v8 alertControllerWithTitle:v9 message:v11 preferredStyle:1];

      char v13 = (void *)MEMORY[0x1E4FB1410];
      id v14 = PKLocalizedAMPString(&cfstr_PassDashboardA_4.isa);
      double v15 = [v13 actionWithTitle:v14 style:0 handler:&__block_literal_global_1944];
      [v12 addAction:v15];

      uint64_t v16 = (void *)MEMORY[0x1E4FB1410];
      uint64_t v17 = PKLocalizedAMPString(&cfstr_PassDashboardA_5.isa);
      id v18 = [v16 actionWithTitle:v17 style:1 handler:0];
      [v12 addAction:v18];
    }
    else
    {
      BOOL v19 = PKLocalizedAMPString(&cfstr_PassDashboardA_6.isa);
      long long v20 = PKLocalizedAMPString(&cfstr_PassDashboardA_7.isa);
      char v12 = [v8 alertControllerWithTitle:v19 message:v20 preferredStyle:1];

      uint64_t v21 = (void *)MEMORY[0x1E4FB1410];
      uint64_t v22 = PKLocalizedAMPString(&cfstr_PassDashboardA_8.isa);
      BOOL v23 = [v21 actionWithTitle:v22 style:1 handler:0];
      [v12 addAction:v23];

      id v24 = (void *)MEMORY[0x1E4FB1410];
      id v25 = PKLocalizedAMPString(&cfstr_PassDashboardA_9.isa);
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      void v27[2] = __65__PKDashboardPaymentPassDataSource__addToAMPButtonTappedForPass___block_invoke_3;
      v27[3] = &unk_1E59D25D0;
      objc_copyWeak(&v29, (id *)(a1 + 48));
      id v28 = *(id *)(a1 + 40);
      id v26 = [v24 actionWithTitle:v25 style:0 handler:v27];
      [v12 addAction:v26];

      objc_destroyWeak(&v29);
    }
    [v7 presentViewController:v12 animated:1 completion:0];
  }
}

void __65__PKDashboardPaymentPassDataSource__addToAMPButtonTappedForPass___block_invoke_1932(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadMessages];
}

void __65__PKDashboardPaymentPassDataSource__addToAMPButtonTappedForPass___block_invoke_2_1942()
{
  [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE&path=PAYMENT_AND_SHIPPING"];
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v0 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v0 openSensitiveURL:v1 withOptions:0];
}

void __65__PKDashboardPaymentPassDataSource__addToAMPButtonTappedForPass___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _addToAMPButtonTappedForPass:*(void *)(a1 + 32)];
}

- (void)_fetchAMPEnrollmentIconIfNeeded:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_showAMPEnrollmentMessage && !self->_AMPEnrollmentIcon)
  {
    objc_initWeak(&location, self);
    id v6 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__PKDashboardPaymentPassDataSource__fetchAMPEnrollmentIconIfNeeded___block_invoke;
    block[3] = &unk_1E59CB128;
    objc_copyWeak(&v9, &location);
    id v8 = v5;
    dispatch_async(v6, block);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else if (v4)
  {
    (*((void (**)(id))v4 + 2))(v4);
  }
}

void __68__PKDashboardPaymentPassDataSource__fetchAMPEnrollmentIconIfNeeded___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F223C8]);
  id v3 = (void *)[v2 initWithBundleIdentifier:*MEMORY[0x1E4F87498] allowPlaceholder:1 error:0];
  id v4 = PKUIGetAppIconForApplicationRecord(v3);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__PKDashboardPaymentPassDataSource__fetchAMPEnrollmentIconIfNeeded___block_invoke_2;
  block[3] = &unk_1E59CB038;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  id v7 = v4;
  id v8 = *(id *)(a1 + 32);
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
}

void __68__PKDashboardPaymentPassDataSource__fetchAMPEnrollmentIconIfNeeded___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 73, *(id *)(a1 + 32));
    id v3 = v5;
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4)
  {
    (*(void (**)(void))(v4 + 16))();
    id v3 = v5;
  }
}

- (id)AMPEnagementPlacementForCurrentlyDisplayedPass
{
  if ([(PKDashboardPaymentPassDataSource *)self _isCreditPass])
  {
    id v3 = (id *)MEMORY[0x1E4F871E8];
LABEL_7:
    id v4 = *v3;
    goto LABEL_8;
  }
  if ([(PKDashboardPaymentPassDataSource *)self _isPeerPaymentPass])
  {
    id v3 = (id *)MEMORY[0x1E4F871F0];
    goto LABEL_7;
  }
  if ([(PKDashboardPaymentPassDataSource *)self _isPayLaterPass])
  {
    id v3 = (id *)MEMORY[0x1E4F871F8];
    goto LABEL_7;
  }
  id v4 = 0;
LABEL_8:

  return v4;
}

- (void)reloadDialogRequests
{
  id v3 = [(PKDashboardPaymentPassDataSource *)self AMPEnagementPlacementForCurrentlyDisplayedPass];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F84688] sharedInstance];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __56__PKDashboardPaymentPassDataSource_reloadDialogRequests__block_invoke;
    v5[3] = &unk_1E59D4D58;
    void v5[4] = self;
    id v6 = v3;
    [v4 dialogRequestsForPlacement:v6 completion:v5];
  }
  else
  {
    self->_engagementMessagesLoaded = 1;
    [(PKDashboardPaymentPassDataSource *)self updateContentIsLoaded];
  }
}

void __56__PKDashboardPaymentPassDataSource_reloadDialogRequests__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__PKDashboardPaymentPassDataSource_reloadDialogRequests__block_invoke_2;
  v5[3] = &unk_1E59CB378;
  objc_copyWeak(&v8, &location);
  id v6 = v3;
  id v7 = *(id *)(a1 + 40);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __56__PKDashboardPaymentPassDataSource_reloadDialogRequests__block_invoke_2(uint64_t a1)
{
  id v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v4 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    id v7[2] = __56__PKDashboardPaymentPassDataSource_reloadDialogRequests__block_invoke_3;
    v7[3] = &unk_1E59DA378;
    objc_copyWeak(&v10, v2);
    id v8 = *(id *)(a1 + 40);
    id v9 = WeakRetained;
    uint64_t v5 = objc_msgSend(v4, "pk_arrayBySafelyApplyingBlock:", v7);
    id v6 = (void *)WeakRetained[75];
    WeakRetained[75] = v5;

    *((unsigned char *)WeakRetained + 608) = 1;
    [WeakRetained updateContentIsLoaded];
    [WeakRetained reloadMessages];

    objc_destroyWeak(&v10);
  }
}

id __56__PKDashboardPaymentPassDataSource_reloadDialogRequests__block_invoke_3(id *a1, void *a2)
{
  id v3 = a2;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  id v15[2] = __56__PKDashboardPaymentPassDataSource_reloadDialogRequests__block_invoke_4;
  v15[3] = &unk_1E59DA350;
  objc_copyWeak(&v16, a1 + 6);
  id v4 = +[PKDashboardPassMessage messageFromDialogRequest:v3 withAction:v15];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __56__PKDashboardPaymentPassDataSource_reloadDialogRequests__block_invoke_5;
  id v11 = &unk_1E59CC220;
  id v5 = v3;
  id v12 = v5;
  id v13 = a1[4];
  objc_copyWeak(&v14, a1 + 6);
  [v4 setActionOnDismiss:&v8];
  id v6 = objc_msgSend(a1[5], "_replaceDashboardMessagePlaceholders:", v4, v8, v9, v10, v11);
  objc_destroyWeak(&v14);

  objc_destroyWeak(&v16);

  return v6;
}

void __56__PKDashboardPaymentPassDataSource_reloadDialogRequests__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained executeEngagementActionForURL:v3];
}

void __56__PKDashboardPaymentPassDataSource_reloadDialogRequests__block_invoke_5(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F84688] sharedInstance];
  id v3 = [*(id *)(a1 + 32) identifier];
  [v2 dismissDialogRequestWithIdentifier:v3 forPlacement:*(void *)(a1 + 40) completion:0];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained reloadDialogRequests];
}

- (BOOL)_isCreditPass
{
  return [(PKDashboardPaymentPassDataSource *)self _passFeature] == 2;
}

- (BOOL)_isPeerPaymentPass
{
  return [(PKDashboardPaymentPassDataSource *)self _passFeature] == 1;
}

- (BOOL)_isPayLaterPass
{
  return [(PKDashboardPaymentPassDataSource *)self _passFeature] == 3;
}

- (BOOL)_isAppleBalancePass
{
  return [(PKDashboardPaymentPassDataSource *)self _passFeature] == 4;
}

- (void)didUpdateFamilyMembers:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__PKDashboardPaymentPassDataSource_didUpdateFamilyMembers___block_invoke;
  block[3] = &unk_1E59CB010;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __59__PKDashboardPaymentPassDataSource_didUpdateFamilyMembers___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v2 = (void *)[objc_alloc(MEMORY[0x1E4F84710]) initWithFamilyMembers:*(void *)(a1 + 32)];
    [WeakRetained _updateWithFamilyCollection:v2];
  }
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didEnableMessageService:(BOOL)a4
{
  id v5 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__PKDashboardPaymentPassDataSource_paymentPassWithUniqueIdentifier_didEnableMessageService___block_invoke;
  block[3] = &unk_1E59CB010;
  objc_copyWeak(&v9, &location);
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __92__PKDashboardPaymentPassDataSource_paymentPassWithUniqueIdentifier_didEnableMessageService___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    id v3 = objc_loadWeakRetained(WeakRetained + 5);
    if (*((unsigned char *)v7 + 748))
    {
      id v4 = [v7[110] uniqueID];
      int v5 = PKEqualObjects();

      if (v5 && v3 != 0) {
        [v7 reloadMessages];
      }
    }

    id v2 = v7;
  }
}

- (void)passWithUniqueIdentifier:(id)a3 didUpdateTiles:(id)a4 forContext:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5 == 1)
  {
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __87__PKDashboardPaymentPassDataSource_passWithUniqueIdentifier_didUpdateTiles_forContext___block_invoke;
    id v10[3] = &unk_1E59CB378;
    objc_copyWeak(&v13, &location);
    id v11 = v8;
    id v12 = v9;
    dispatch_async(MEMORY[0x1E4F14428], v10);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __87__PKDashboardPaymentPassDataSource_passWithUniqueIdentifier_didUpdateTiles_forContext___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    int v5 = WeakRetained;
    id v3 = [WeakRetained[110] uniqueID];
    int v4 = PKEqualObjects();

    id WeakRetained = v5;
    if (v4)
    {
      [v5 _updateWithTiles:*(void *)(a1 + 40)];
      id WeakRetained = v5;
    }
  }
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveMessage:(id)a4
{
  id v5 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__PKDashboardPaymentPassDataSource_paymentPassWithUniqueIdentifier_didReceiveMessage___block_invoke;
  block[3] = &unk_1E59CB010;
  objc_copyWeak(&v9, &location);
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __86__PKDashboardPaymentPassDataSource_paymentPassWithUniqueIdentifier_didReceiveMessage___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    id v3 = objc_loadWeakRetained(WeakRetained + 5);
    if (*((unsigned char *)v7 + 748))
    {
      int v4 = [v7[110] uniqueID];
      int v5 = PKEqualObjects();

      if (v5 && v3 != 0) {
        [v7 reloadMessages];
      }
    }

    id v2 = v7;
  }
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitPassProperties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __103__PKDashboardPaymentPassDataSource_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke;
  id v10[3] = &unk_1E59CB378;
  objc_copyWeak(&v13, &location);
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __103__PKDashboardPaymentPassDataSource_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (*((unsigned char *)WeakRetained + 748))
    {
      int v5 = WeakRetained;
      id v3 = [WeakRetained[110] uniqueID];
      int v4 = PKEqualObjects();

      id WeakRetained = v5;
      if (v4)
      {
        [v5 _updateTransitBalanceProperties:*(void *)(a1 + 40) dynamicBalances:0 dynamicPlans:0];
        id WeakRetained = v5;
      }
    }
  }
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __92__PKDashboardPaymentPassDataSource_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke;
  id v10[3] = &unk_1E59CB378;
  objc_copyWeak(&v13, &location);
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __92__PKDashboardPaymentPassDataSource_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    int v5 = WeakRetained;
    id v3 = [WeakRetained[110] uniqueID];
    int v4 = PKEqualObjects();

    id WeakRetained = v5;
    if (v4)
    {
      if (*((unsigned char *)v5 + 748))
      {
        [v5 _updateTransitBalanceProperties:0 dynamicBalances:*(void *)(a1 + 40) dynamicPlans:0];
        id WeakRetained = v5;
      }
    }
  }
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceivePlanUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __89__PKDashboardPaymentPassDataSource_paymentPassWithUniqueIdentifier_didReceivePlanUpdate___block_invoke;
  id v10[3] = &unk_1E59CB378;
  objc_copyWeak(&v13, &location);
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __89__PKDashboardPaymentPassDataSource_paymentPassWithUniqueIdentifier_didReceivePlanUpdate___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    int v5 = WeakRetained;
    id v3 = [WeakRetained[110] uniqueID];
    int v4 = PKEqualObjects();

    id WeakRetained = v5;
    if (v4)
    {
      if (*((unsigned char *)v5 + 748))
      {
        [v5 _updateTransitBalanceProperties:0 dynamicBalances:0 dynamicPlans:*(void *)(a1 + 40)];
        id WeakRetained = v5;
      }
    }
  }
}

- (void)credential:(id)a3 forPaymentApplication:(id)a4 didUpdateRangingSuspensionReasons:(unint64_t)a5
{
  id v6 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __103__PKDashboardPaymentPassDataSource_credential_forPaymentApplication_didUpdateRangingSuspensionReasons___block_invoke;
  block[3] = &unk_1E59CB010;
  objc_copyWeak(&v10, &location);
  id v9 = v6;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __103__PKDashboardPaymentPassDataSource_credential_forPaymentApplication_didUpdateRangingSuspensionReasons___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    id v3 = [WeakRetained[110] devicePrimaryPaymentApplication];
    int v4 = [v3 subcredentials];
    int v5 = [v4 anyObject];
    id v6 = [v5 identifier];
    id v7 = [*(id *)(a1 + 32) identifier];
    int v8 = PKEqualObjects();

    id WeakRetained = v9;
    if (v8)
    {
      [v9 reloadMessages];
      id WeakRetained = v9;
    }
  }
}

- (void)sharesDidUpdateWithPaymentPassWithUniqueIdentifier:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__PKDashboardPaymentPassDataSource_sharesDidUpdateWithPaymentPassWithUniqueIdentifier___block_invoke;
  block[3] = &unk_1E59CB010;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __87__PKDashboardPaymentPassDataSource_sharesDidUpdateWithPaymentPassWithUniqueIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v10 = WeakRetained;
    id v3 = [WeakRetained[110] uniqueID];
    id v4 = *(void **)(a1 + 32);
    id v5 = v3;
    id v6 = v4;
    if (v5 == v6)
    {

      id WeakRetained = v10;
      goto LABEL_11;
    }
    id v7 = v6;
    if (v5) {
      BOOL v8 = v6 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {

LABEL_12:
      id WeakRetained = v10;
      goto LABEL_13;
    }
    int v9 = [v5 isEqualToString:v6];

    id WeakRetained = v10;
    if (v9)
    {
LABEL_11:
      id v5 = objc_loadWeakRetained(WeakRetained + 5);
      [v5 reloadNavigationBarAnimated:1];
      goto LABEL_12;
    }
  }
LABEL_13:
}

- (void)inboxDataSourceDidUpdateInboxMessages:(id)a3
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __74__PKDashboardPaymentPassDataSource_inboxDataSourceDidUpdateInboxMessages___block_invoke;
  v3[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __74__PKDashboardPaymentPassDataSource_inboxDataSourceDidUpdateInboxMessages___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained reloadMessages];
    id WeakRetained = v2;
  }
}

- (void)_peerPaymentAccountChanged:(id)a3
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63__PKDashboardPaymentPassDataSource__peerPaymentAccountChanged___block_invoke;
  v3[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __63__PKDashboardPaymentPassDataSource__peerPaymentAccountChanged___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v2 = WeakRetained[23];
    id v3 = [v6[109] targetDevice];
    uint64_t v4 = [v3 account];
    id v5 = v6[23];
    v6[23] = (id)v4;

    if ([v6 _isCreditPass])
    {
      [v6 reloadMessages];
    }
    else
    {
      *((unsigned char *)v6 + 235) = 1;
      *((unsigned char *)v6 + 744) = [v6 _isDisclosureSectionChanged:v2 newAccount:v6[23]];
      [v6 reloadAccount];
    }

    id WeakRetained = v6;
  }
}

- (void)_peerPaymentResolutionTappedWithResolution:(unint64_t)a3
{
  if (!self->_performingPeerPaymentResolution)
  {
    id v5 = [(PKPeerPaymentAccountResolutionController *)self->_peerPaymentAccountResolutionController account];
    id v6 = v5;
    if (v5)
    {
      uint64_t v7 = [v5 pendingPaymentCount];
      BOOL v8 = PKSharedCacheGetStringForKey();
      self->_performingPeerPaymentResolution = 1;
      objc_initWeak(&location, self);
      if (a3 == 1 && v7 == 1 && [v8 length])
      {
        id v9 = objc_alloc_init(MEMORY[0x1E4F84D60]);
        [v9 setRegistrationFlowState:2];
        [v9 setSenderAddress:v8];
        peerPaymentAccountResolutionController = self->_peerPaymentAccountResolutionController;
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        id v15[2] = __79__PKDashboardPaymentPassDataSource__peerPaymentResolutionTappedWithResolution___block_invoke;
        v15[3] = &unk_1E59CB100;
        objc_copyWeak(&v16, &location);
        [(PKPeerPaymentAccountResolutionController *)peerPaymentAccountResolutionController presentFlowForAccountResolution:1 configuration:v9 completion:v15];
        objc_destroyWeak(&v16);
      }
      else
      {
        id v11 = self->_peerPaymentAccountResolutionController;
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        void v13[2] = __79__PKDashboardPaymentPassDataSource__peerPaymentResolutionTappedWithResolution___block_invoke_2;
        v13[3] = &unk_1E59CB100;
        objc_copyWeak(&v14, &location);
        [(PKPeerPaymentAccountResolutionController *)v11 presentFlowForAccountResolution:a3 configuration:0 completion:v13];
        objc_destroyWeak(&v14);
      }
      objc_destroyWeak(&location);
    }
    else
    {
      BOOL v8 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=PASSBOOK"];
      id v12 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      [v12 openSensitiveURL:v8 withOptions:0];
    }
  }
}

void __79__PKDashboardPaymentPassDataSource__peerPaymentResolutionTappedWithResolution___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    WeakRetained[208] = 0;
  }
}

void __79__PKDashboardPaymentPassDataSource__peerPaymentResolutionTappedWithResolution___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    WeakRetained[208] = 0;
  }
}

- (id)_contactResolver
{
  v16[3] = *MEMORY[0x1E4F143B8];
  contactResolver = self->_contactResolver;
  if (!contactResolver)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1B980]);
    id v5 = [MEMORY[0x1E4F84D88] requiredContactKeys];
    id v6 = (void *)[v5 mutableCopy];

    Class v7 = _MergedGlobals_666();
    BOOL v8 = [MEMORY[0x1E4FB16C8] currentDevice];
    id v9 = -[objc_class descriptorForRequiredKeysWithThreeDTouchEnabled:](v7, "descriptorForRequiredKeysWithThreeDTouchEnabled:", [v8 _supportsForceTouch]);
    id v10 = objc_msgSend((Class)off_1EB5459A0(), "descriptorForRequiredKeys", v9);
    v16[1] = v10;
    id v11 = [(Class)off_1EB5459A8() descriptorForRequiredKeys];
    void v16[2] = v11;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:3];
    [v6 addObjectsFromArray:v12];

    id v13 = (PKContactResolver *)[objc_alloc(MEMORY[0x1E4F845E8]) initWithContactStore:v4 keysToFetch:v6];
    id v14 = self->_contactResolver;
    self->_contactResolver = v13;

    contactResolver = self->_contactResolver;
  }

  return contactResolver;
}

- (void)peerPaymentAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  groupView = self->_groupView;
  id v7 = a4;
  id v8 = [(UIView *)groupView pkui_viewControllerFromResponderChain];
  [v8 presentViewController:v7 animated:v5 completion:0];
}

- (void)peerPaymentAccountResolutionController:(id)a3 requestsDismissCurrentViewControllerAnimated:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [(UIView *)self->_groupView pkui_viewControllerFromResponderChain];
  [v5 dismissViewControllerAnimated:v4 completion:0];
}

- (void)reloadPeerPaymentPendingRequestsWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__PKDashboardPaymentPassDataSource_reloadPeerPaymentPendingRequestsWithCompletion___block_invoke;
  aBlock[3] = &unk_1E59CCC50;
  objc_copyWeak(&v15, &location);
  id v5 = (uint64_t (**)(void))_Block_copy(aBlock);
  if (v5[2]())
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F84D80]) initWithPeerPaymentWebService:self->_peerPaymentWebService];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __83__PKDashboardPaymentPassDataSource_reloadPeerPaymentPendingRequestsWithCompletion___block_invoke_2;
    id v10[3] = &unk_1E59DA3C8;
    objc_copyWeak(&v13, &location);
    id v11 = v4;
    id v12 = v5;
    void v10[4] = self;
    [v6 pendingRequestsWithCompletion:v10];

    objc_destroyWeak(&v13);
  }
  else
  {
    if (self->_isShowingPeerPaymentPendingRequests)
    {
      self->_isShowingPeerPaymentPendingRequests = 0;
      if (self->_allContentIsLoaded)
      {
        unint64_t v7 = [(PKDashboardPaymentPassDataSource *)self firstSectionIndexForSectionIdentifier:10];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        id v9 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v7];
        [WeakRetained reloadSections:v9];
      }
    }
    if (v4) {
      (*((void (**)(id, void))v4 + 2))(v4, 0);
    }
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

BOOL __83__PKDashboardPaymentPassDataSource_reloadPeerPaymentPendingRequestsWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v2 = (PKUseMockSURFServer() & 1) == 0
    && [WeakRetained _isPeerPaymentPass]
    && WeakRetained[23]
    && ![WeakRetained[110] activationState]
    && [WeakRetained[23] state] == 1;

  return v2;
}

void __83__PKDashboardPaymentPassDataSource_reloadPeerPaymentPendingRequestsWithCompletion___block_invoke_2(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__PKDashboardPaymentPassDataSource_reloadPeerPaymentPendingRequestsWithCompletion___block_invoke_3;
  block[3] = &unk_1E59DA3A0;
  objc_copyWeak(&v19, (id *)(a1 + 56));
  char v20 = a2;
  id v14 = v8;
  id v17 = *(id *)(a1 + 40);
  id v15 = v7;
  id v9 = *(id *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 32);
  id v18 = v9;
  uint64_t v16 = v10;
  id v11 = v7;
  id v12 = v8;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v19);
}

void __83__PKDashboardPaymentPassDataSource_reloadPeerPaymentPendingRequestsWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  id v3 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_27;
  }
  id v4 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 80))
  {
    if (!v4)
    {
      uint64_t v33 = WeakRetained;
      id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      uint64_t v32 = a1;
      id v5 = *(id *)(a1 + 40);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v37;
        uint64_t v9 = *MEMORY[0x1E4F87CA0];
        uint64_t v10 = *MEMORY[0x1E4F87C98];
        uint64_t v11 = *MEMORY[0x1E4F87C90];
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v37 != v8) {
              objc_enumerationMutation(v5);
            }
            id v13 = *(void **)(*((void *)&v36 + 1) + 8 * i);
            id v14 = objc_msgSend(v13, "status", v32);
            int v15 = [v14 isEqualToString:v9];

            if (v15)
            {
              uint64_t v16 = [v13 actions];
              char v17 = [v16 containsObject:v10];

              id v18 = v35;
              if ((v17 & 1) != 0
                || ([v13 actions],
                    id v19 = objc_claimAutoreleasedReturnValue(),
                    int v20 = [v19 containsObject:v11],
                    v19,
                    id v18 = v34,
                    v20))
              {
                [v18 addObject:v13];
              }
            }
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v36 objects:v40 count:16];
        }
        while (v7);
      }

      uint64_t v21 = [v35 copy];
      id v3 = v33;
      id v22 = v33[87];
      v33[87] = (id)v21;

      uint64_t v23 = [v34 copy];
      id v24 = v33[88];
      v33[88] = (id)v23;

      *((unsigned char *)v33 + 688) = (*(uint64_t (**)(void))(*(void *)(v32 + 64) + 16))();
      if (*((unsigned char *)v33 + 748))
      {
        uint64_t v25 = [*(id *)(v32 + 48) firstSectionIndexForSectionIdentifier:10];
        id v26 = objc_loadWeakRetained(v33 + 5);
        unint64_t v27 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v25];
        [v26 reloadSections:v27];
      }
      else
      {
        [v33 updateContentIsLoaded];
      }
      uint64_t v31 = *(void *)(v32 + 56);
      if (v31) {
        (*(void (**)(uint64_t, uint64_t))(v31 + 16))(v31, 1);
      }

      goto LABEL_27;
    }
    goto LABEL_18;
  }
  if (v4)
  {
LABEL_18:
    id v28 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      id v29 = [v4 localizedDescription];
      *(_DWORD *)buf = 138412290;
      id v42 = v29;
      _os_log_impl(&dword_19F450000, v28, OS_LOG_TYPE_DEFAULT, "PKDashboardPaymentPassDataSource: Error retrieving pending requests: %@", buf, 0xCu);
    }
  }
  uint64_t v30 = *(void *)(a1 + 56);
  if (v30) {
    (*(void (**)(uint64_t, void))(v30 + 16))(v30, 0);
  }
LABEL_27:
}

- (BOOL)_isDisclosureSectionChanged:(id)a3 newAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int IsFDICInsured = PKPeerPaymentAccountIsFDICInsured();
  if (IsFDICInsured == PKPeerPaymentAccountIsFDICInsured()
    && (uint64_t v8 = PKPeerPaymentAccountResolutionForAccountAndPeerPaymentPass(),
        v8 == PKPeerPaymentAccountResolutionForAccountAndPeerPaymentPass()))
  {
    int CanPerformManualIdentityVerification = PKPeerPaymentAccountCanPerformManualIdentityVerification();
    int v10 = CanPerformManualIdentityVerification ^ PKPeerPaymentAccountCanPerformManualIdentityVerification();
  }
  else
  {
    LOBYTE(v10) = 1;
  }

  return v10;
}

- (void)pendingRequestsChanged
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__PKDashboardPaymentPassDataSource_pendingRequestsChanged__block_invoke;
  block[3] = &unk_1E59CA7D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __58__PKDashboardPaymentPassDataSource_pendingRequestsChanged__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _isPeerPaymentPass];
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 reloadMessages];
  }
  return result;
}

- (void)recurringPaymentsChanged
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__PKDashboardPaymentPassDataSource_recurringPaymentsChanged__block_invoke;
  block[3] = &unk_1E59CA7D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __60__PKDashboardPaymentPassDataSource_recurringPaymentsChanged__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _isPeerPaymentPass])
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    BOOL v2 = *(void **)(a1 + 32);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __60__PKDashboardPaymentPassDataSource_recurringPaymentsChanged__block_invoke_2;
    v3[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v4, &location);
    [v2 reloadRecurringPeerPaymentsWithCompletion:v3];
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

void __60__PKDashboardPaymentPassDataSource_recurringPaymentsChanged__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadMessages];
}

- (void)_verificationButtonTapped
{
  id v3 = [[PKPaymentSetupDismissibleNavigationController alloc] initWithContext:0];
  id v4 = objc_alloc(MEMORY[0x1E4F84BB8]);
  id v5 = [MEMORY[0x1E4F84D50] sharedService];
  id v6 = (void *)[v4 initWithWebService:v5];

  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F84ED0]) initWithEnvironment:0 provisioningController:v6 groupsController:0];
  [v7 setIsFollowupProvisioning:1];
  objc_initWeak(&location, self);
  pass = self->_pass;
  paymentVerificationController = self->_paymentVerificationController;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  id v11[2] = __61__PKDashboardPaymentPassDataSource__verificationButtonTapped__block_invoke;
  v11[3] = &unk_1E59CB010;
  objc_copyWeak(&v13, &location);
  int v10 = v3;
  id v12 = v10;
  +[PKProvisioningFlowBridge startVerificationFlowWithNavController:v10 context:v7 pass:pass verificationController:paymentVerificationController presentNavController:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __61__PKDashboardPaymentPassDataSource__verificationButtonTapped__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = objc_msgSend(WeakRetained[1], "pkui_viewControllerFromResponderChain");
    [v3 presentViewController:*(void *)(a1 + 32) animated:1 completion:0];

    id WeakRetained = v4;
  }
}

- (void)presentVerificationViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  int v10 = [(UIView *)self->_groupView pkui_viewControllerFromResponderChain];
  uint64_t v11 = [v10 presentedViewController];
  if (v11)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    id v12[2] = __90__PKDashboardPaymentPassDataSource_presentVerificationViewController_animated_completion___block_invoke;
    v12[3] = &unk_1E59CF8B0;
    id v13 = v10;
    id v14 = v8;
    BOOL v16 = v6;
    id v15 = v9;
    [v13 dismissViewControllerAnimated:v6 completion:v12];
  }
  else
  {
    [v10 presentViewController:v8 animated:v6 completion:v9];
  }
}

uint64_t __90__PKDashboardPaymentPassDataSource_presentVerificationViewController_animated_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 56) completion:*(void *)(a1 + 48)];
}

- (void)dismissVerificationViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(UIView *)self->_groupView pkui_viewControllerFromResponderChain];
  id v4 = [v5 presentedViewController];
  [v4 dismissViewControllerAnimated:v3 completion:0];
}

- (id)presentationContext
{
  BOOL v2 = [(UIView *)self->_groupView pkui_viewControllerFromResponderChain];
  BOOL v3 = [v2 view];
  id v4 = [v3 window];

  return v4;
}

- (void)invalidatedSpendingSummaryOfType:(unint64_t)a3 startingWithDate:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  id v8[2] = __86__PKDashboardPaymentPassDataSource_invalidatedSpendingSummaryOfType_startingWithDate___block_invoke;
  v8[3] = &unk_1E59CFBA8;
  objc_copyWeak(v10, &location);
  v10[1] = (id)a3;
  id v9 = v6;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v8);

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

void __86__PKDashboardPaymentPassDataSource_invalidatedSpendingSummaryOfType_startingWithDate___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    id v7 = WeakRetained;
    uint64_t v5 = [WeakRetained[62] summaryType];
    BOOL v3 = v7;
    if (v4 == v5)
    {
      int v6 = PKEqualObjects();
      BOOL v3 = v7;
      if (v6)
      {
        [v7 loadSummariesWithForceReload:0];
        BOOL v3 = v7;
      }
    }
  }
}

- (void)invalidatedSpendingSummariesOfType:(unint64_t)a3
{
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__PKDashboardPaymentPassDataSource_invalidatedSpendingSummariesOfType___block_invoke;
  block[3] = &unk_1E59CF720;
  objc_copyWeak(v5, &location);
  v5[1] = (id)a3;
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(v5);
  objc_destroyWeak(&location);
}

void __71__PKDashboardPaymentPassDataSource_invalidatedSpendingSummariesOfType___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v5 = WeakRetained;
    BOOL v4 = v3 == [WeakRetained[62] summaryType];
    id WeakRetained = v5;
    if (v4)
    {
      [v5 loadSummariesWithForceReload:0];
      id WeakRetained = v5;
    }
  }
}

- (void)invalidatedSummariesAvailable
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __65__PKDashboardPaymentPassDataSource_invalidatedSummariesAvailable__block_invoke;
  v2[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E4F14428], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __65__PKDashboardPaymentPassDataSource_invalidatedSummariesAvailable__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained loadSummariesWithForceReload:1];
}

- (void)accountServiceAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5
{
  groupView = self->_groupView;
  id v6 = a4;
  id v7 = [(UIView *)groupView pkui_viewControllerFromResponderChain];
  [v7 presentViewController:v6 animated:1 completion:0];
}

- (void)discoveryService:(id)a3 dialogRequestsChangedForPlacement:(id)a4
{
  id v5 = a4;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__PKDashboardPaymentPassDataSource_discoveryService_dialogRequestsChangedForPlacement___block_invoke;
  block[3] = &unk_1E59CB010;
  objc_copyWeak(&v9, &location);
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __87__PKDashboardPaymentPassDataSource_discoveryService_dialogRequestsChangedForPlacement___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = *(void **)(a1 + 32);
    id v9 = WeakRetained;
    BOOL v4 = [WeakRetained AMPEnagementPlacementForCurrentlyDisplayedPass];
    id v5 = v3;
    id v6 = v4;
    if (v5 == v6)
    {
    }
    else
    {
      id v7 = v6;
      if (!v5 || !v6)
      {

        goto LABEL_10;
      }
      int v8 = [v5 isEqualToString:v6];

      id WeakRetained = v9;
      if (!v8) {
        goto LABEL_11;
      }
    }
    [v9 reloadDialogRequests];
LABEL_10:
    id WeakRetained = v9;
  }
LABEL_11:
}

- (void)accountUsersChanged:(id)a3 forAccountIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  id v10[2] = __77__PKDashboardPaymentPassDataSource_accountUsersChanged_forAccountIdentifier___block_invoke;
  id v10[3] = &unk_1E59CB378;
  objc_copyWeak(&v13, &location);
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __77__PKDashboardPaymentPassDataSource_accountUsersChanged_forAccountIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = *(void **)(a1 + 32);
    id v9 = WeakRetained;
    BOOL v4 = [WeakRetained[110] associatedAccountServiceAccountIdentifier];
    id v5 = v3;
    id v6 = v4;
    if (v5 == v6)
    {
    }
    else
    {
      id v7 = v6;
      if (!v5 || !v6)
      {

        goto LABEL_10;
      }
      char v8 = [v5 isEqualToString:v6];

      id WeakRetained = v9;
      if ((v8 & 1) == 0) {
        goto LABEL_11;
      }
    }
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F842C8]) initWithAccountUsers:*(void *)(a1 + 40)];
    [v9 reloadAccountUsersWithNewAccountUserCollection:v7];
LABEL_10:

    id WeakRetained = v9;
  }
LABEL_11:
}

- (void)physicalCardsChanged:(id)a3 forAccountIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  id v10[2] = __78__PKDashboardPaymentPassDataSource_physicalCardsChanged_forAccountIdentifier___block_invoke;
  id v10[3] = &unk_1E59CB378;
  objc_copyWeak(&v13, &location);
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __78__PKDashboardPaymentPassDataSource_physicalCardsChanged_forAccountIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = *(void **)(a1 + 32);
    id v9 = WeakRetained;
    BOOL v4 = [WeakRetained[110] associatedAccountServiceAccountIdentifier];
    id v5 = v3;
    id v6 = v4;
    if (v5 == v6)
    {
    }
    else
    {
      id v7 = v6;
      if (!v5 || !v6)
      {

        goto LABEL_10;
      }
      char v8 = [v5 isEqualToString:v6];

      id WeakRetained = v9;
      if ((v8 & 1) == 0) {
        goto LABEL_11;
      }
    }
    [v9 reloadPhysicalCardsWithNewPhysicalCards:*(void *)(a1 + 40)];
LABEL_10:
    id WeakRetained = v9;
  }
LABEL_11:
}

- (void)featureApplicationAdded:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__PKDashboardPaymentPassDataSource_featureApplicationAdded___block_invoke;
  block[3] = &unk_1E59CB010;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __60__PKDashboardPaymentPassDataSource_featureApplicationAdded___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    id v3 = [*(id *)(a1 + 32) accountIdentifier];
    if (v3)
    {
      id v4 = [v9[110] associatedAccountServiceAccountIdentifier];
      id v5 = v3;
      id v6 = v4;
      if (v5 == v6)
      {
      }
      else
      {
        id v7 = v6;
        if (!v6)
        {

          goto LABEL_10;
        }
        char v8 = [v5 isEqualToString:v6];

        if ((v8 & 1) == 0) {
          goto LABEL_10;
        }
      }
      [v9 reloadAccountUserInvitationsWithNewAccountUserInvitations:0];
    }
LABEL_10:

    id WeakRetained = v9;
  }
}

- (void)featureApplicationChanged:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__PKDashboardPaymentPassDataSource_featureApplicationChanged___block_invoke;
  block[3] = &unk_1E59CB010;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __62__PKDashboardPaymentPassDataSource_featureApplicationChanged___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    id v3 = [*(id *)(a1 + 32) accountIdentifier];
    if (v3)
    {
      id v4 = [v9[110] associatedAccountServiceAccountIdentifier];
      id v5 = v3;
      id v6 = v4;
      if (v5 == v6)
      {
      }
      else
      {
        id v7 = v6;
        if (!v6)
        {

          goto LABEL_10;
        }
        char v8 = [v5 isEqualToString:v6];

        if ((v8 & 1) == 0) {
          goto LABEL_10;
        }
      }
      [v9 reloadAccountUserInvitationsWithNewAccountUserInvitations:0];
    }
LABEL_10:

    id WeakRetained = v9;
  }
}

- (void)featureApplicationRemoved:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__PKDashboardPaymentPassDataSource_featureApplicationRemoved___block_invoke;
  block[3] = &unk_1E59CB010;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __62__PKDashboardPaymentPassDataSource_featureApplicationRemoved___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    id v3 = [*(id *)(a1 + 32) accountIdentifier];
    if (v3)
    {
      id v4 = [v9[110] associatedAccountServiceAccountIdentifier];
      id v5 = v3;
      id v6 = v4;
      if (v5 == v6)
      {
      }
      else
      {
        id v7 = v6;
        if (!v6)
        {

          goto LABEL_10;
        }
        char v8 = [v5 isEqualToString:v6];

        if ((v8 & 1) == 0) {
          goto LABEL_10;
        }
      }
      [v9 reloadAccountUserInvitationsWithNewAccountUserInvitations:0];
    }
LABEL_10:

    id WeakRetained = v9;
  }
}

- (void)accountFinancingPlanUpdated:(id)a3 oldFinancingPlan:(id)a4 accountIdentifier:(id)a5
{
  id v6 = a5;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__PKDashboardPaymentPassDataSource_accountFinancingPlanUpdated_oldFinancingPlan_accountIdentifier___block_invoke;
  block[3] = &unk_1E59CB010;
  objc_copyWeak(&v10, &location);
  id v9 = v6;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __99__PKDashboardPaymentPassDataSource_accountFinancingPlanUpdated_oldFinancingPlan_accountIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = *(void **)(a1 + 32);
    if (v3)
    {
      id v9 = WeakRetained;
      id v4 = [WeakRetained[110] associatedAccountServiceAccountIdentifier];
      id v5 = v3;
      id v6 = v4;
      if (v5 == v6)
      {
      }
      else
      {
        id v7 = v6;
        if (!v6)
        {

          goto LABEL_10;
        }
        char v8 = [v5 isEqualToString:v6];

        id WeakRetained = v9;
        if ((v8 & 1) == 0) {
          goto LABEL_11;
        }
      }
      [v9 reloadFinancingPlans];
LABEL_10:
      id WeakRetained = v9;
    }
  }
LABEL_11:
}

- (void)accountFinancingPlanAdded:(id)a3 accountIdentifier:(id)a4
{
  id v5 = a4;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__PKDashboardPaymentPassDataSource_accountFinancingPlanAdded_accountIdentifier___block_invoke;
  block[3] = &unk_1E59CB010;
  objc_copyWeak(&v9, &location);
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __80__PKDashboardPaymentPassDataSource_accountFinancingPlanAdded_accountIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = *(void **)(a1 + 32);
    if (v3)
    {
      id v9 = WeakRetained;
      id v4 = [WeakRetained[110] associatedAccountServiceAccountIdentifier];
      id v5 = v3;
      id v6 = v4;
      if (v5 == v6)
      {
      }
      else
      {
        id v7 = v6;
        if (!v6)
        {

          goto LABEL_10;
        }
        char v8 = [v5 isEqualToString:v6];

        id WeakRetained = v9;
        if ((v8 & 1) == 0) {
          goto LABEL_11;
        }
      }
      [v9 reloadFinancingPlans];
LABEL_10:
      id WeakRetained = v9;
    }
  }
LABEL_11:
}

- (void)accountFinancingPlanRemoved:(id)a3 accountIdentifier:(id)a4
{
  id v5 = a4;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__PKDashboardPaymentPassDataSource_accountFinancingPlanRemoved_accountIdentifier___block_invoke;
  block[3] = &unk_1E59CB010;
  objc_copyWeak(&v9, &location);
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __82__PKDashboardPaymentPassDataSource_accountFinancingPlanRemoved_accountIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = *(void **)(a1 + 32);
    if (v3)
    {
      id v9 = WeakRetained;
      id v4 = [WeakRetained[110] associatedAccountServiceAccountIdentifier];
      id v5 = v3;
      id v6 = v4;
      if (v5 == v6)
      {
      }
      else
      {
        id v7 = v6;
        if (!v6)
        {

          goto LABEL_10;
        }
        char v8 = [v5 isEqualToString:v6];

        id WeakRetained = v9;
        if ((v8 & 1) == 0) {
          goto LABEL_11;
        }
      }
      [v9 reloadFinancingPlans];
LABEL_10:
      id WeakRetained = v9;
    }
  }
LABEL_11:
}

- (void)accountChanged:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__PKDashboardPaymentPassDataSource_accountChanged___block_invoke;
  block[3] = &unk_1E59CB010;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __51__PKDashboardPaymentPassDataSource_accountChanged___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = [*(id *)(a1 + 32) accountIdentifier];
    if (v3)
    {
      id v4 = [WeakRetained[49] accountIdentifier];
      id v5 = v3;
      id v6 = v5;
      if (v4 == v5)
      {
      }
      else
      {
        if (!v4)
        {

LABEL_10:
          long long v19 = 0u;
          long long v20 = 0u;
          long long v17 = 0u;
          long long v18 = 0u;
          id v8 = objc_msgSend(WeakRetained, "accounts", 0);
          uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = *(void *)v18;
            while (2)
            {
              for (uint64_t i = 0; i != v10; ++i)
              {
                if (*(void *)v18 != v11) {
                  objc_enumerationMutation(v8);
                }
                id v13 = [*(id *)(*((void *)&v17 + 1) + 8 * i) accountIdentifier];
                id v14 = v6;
                id v15 = v14;
                if (v13 == v14)
                {

LABEL_24:
                  [WeakRetained reloadAccounts];
                  goto LABEL_25;
                }
                if (v13)
                {
                  int v16 = [v13 isEqualToString:v14];

                  if (v16) {
                    goto LABEL_24;
                  }
                }
                else
                {
                }
              }
              uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
              if (v10) {
                continue;
              }
              break;
            }
          }
LABEL_25:

          goto LABEL_26;
        }
        int v7 = [v4 isEqualToString:v5];

        if (!v7) {
          goto LABEL_10;
        }
      }
      [WeakRetained reloadAccount];
    }
LABEL_26:
  }
}

- (void)accountAdded:(id)a3
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__PKDashboardPaymentPassDataSource_accountAdded___block_invoke;
  v3[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __49__PKDashboardPaymentPassDataSource_accountAdded___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained reloadAccounts];
    id WeakRetained = v2;
  }
}

- (void)accountRemoved:(id)a3
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__PKDashboardPaymentPassDataSource_accountRemoved___block_invoke;
  v3[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __51__PKDashboardPaymentPassDataSource_accountRemoved___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained reloadAccounts];
    id WeakRetained = v2;
  }
}

- (void)didUpdateAppleBalancePromotion:(id)a3 forAccountIdentifier:(id)a4
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __88__PKDashboardPaymentPassDataSource_didUpdateAppleBalancePromotion_forAccountIdentifier___block_invoke;
  v4[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v5, &location);
  dispatch_async(MEMORY[0x1E4F14428], v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __88__PKDashboardPaymentPassDataSource_didUpdateAppleBalancePromotion_forAccountIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained reloadMessages];
    id WeakRetained = v2;
  }
}

- (void)didRemoveAppleBalancePromotionWithUniqueIdentifier:(id)a3 forAccountIdentifier:(id)a4
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __108__PKDashboardPaymentPassDataSource_didRemoveAppleBalancePromotionWithUniqueIdentifier_forAccountIdentifier___block_invoke;
  v4[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v5, &location);
  dispatch_async(MEMORY[0x1E4F14428], v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __108__PKDashboardPaymentPassDataSource_didRemoveAppleBalancePromotionWithUniqueIdentifier_forAccountIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained reloadMessages];
    id WeakRetained = v2;
  }
}

- (void)creditRecoveryPaymentPlansChangedForAccountIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(PKPaymentPass *)self->_pass associatedAccountServiceAccountIdentifier];
    id v6 = v4;
    id v7 = v5;
    if (v7 == v6)
    {
    }
    else
    {
      id v8 = v7;
      if (!v7)
      {

        goto LABEL_9;
      }
      char v9 = [v6 isEqualToString:v7];

      if ((v9 & 1) == 0) {
        goto LABEL_9;
      }
    }
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    id v10[2] = __90__PKDashboardPaymentPassDataSource_creditRecoveryPaymentPlansChangedForAccountIdentifier___block_invoke;
    id v10[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v11, &location);
    dispatch_async(MEMORY[0x1E4F14428], v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
LABEL_9:
}

void __90__PKDashboardPaymentPassDataSource_creditRecoveryPaymentPlansChangedForAccountIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained reloadCreditRecoveryPaymentPlans];
    id WeakRetained = v2;
  }
}

- (void)foregroundActiveArbiter:(id)a3 didUpdateForegroundActiveState:(id)a4
{
  BOOL foreground = self->_activeState.foreground;
  self->_activeState = ($77BFE790A1370D46B4241309C9753022)a4;
  if (a4.var0 && !foreground)
  {
    [(PKDashboardPaymentPassDataSource *)self reloadAllContent];
    self->_forceTransactionsUpdate = 1;
    [(PKDashboardPaymentPassDataSource *)self reloadTransactions];
    [(PKDashboardPaymentPassDataSource *)self reloadTransactionGroups];
  }

  [(PKDashboardPaymentPassDataSource *)self _updateTransactionsTimer];
}

- (void)viewControllerDidTerminateSetupFlow:(id)a3
{
  id v3 = [a3 presentingViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)viewControllerDidCancelSetupFlow:(id)a3
{
  id v3 = [a3 presentingViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)contactIssuerHelper:(id)a3 didRequestPresentViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  groupView = self->_groupView;
  id v9 = a6;
  id v10 = a4;
  id v11 = [(UIView *)groupView pkui_viewControllerFromResponderChain];
  [v11 presentViewController:v10 animated:v6 completion:v9];
}

- (void)contactIssuerHelper:(id)a3 didRequestDismissViewControllerAnimated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  groupView = self->_groupView;
  id v7 = a5;
  id v8 = [(UIView *)groupView pkui_viewControllerFromResponderChain];
  [v8 dismissViewControllerAnimated:v5 completion:v7];
}

- (id)peerPaymentBalanceItem
{
  id v3 = objc_alloc_init(PKDashboardBalanceItem);
  id v4 = [(PKDashboardPaymentPassDataSource *)self peerPaymentAccount];
  BOOL v5 = [v4 currentBalance];
  BOOL v6 = [v5 formattedStringValue];
  [(PKDashboardBalanceItem *)v3 setBalance:v6];

  id v7 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentBal.isa);
  [(PKDashboardBalanceItem *)v3 setTitle:v7];

  id v8 = [MEMORY[0x1E4FB1618] labelColor];
  [(PKDashboardBalanceItem *)v3 setTitleColor:v8];

  id v9 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentBal_0.isa);
  [(PKDashboardBalanceItem *)v3 setTopUpTitle:v9];

  id v10 = [(PKDashboardPaymentPassDataSource *)self peerPaymentThresholdTopUp];
  id v11 = v10;
  if (v10)
  {
    if ([v10 status] == 4) {
      id v12 = @"DASHBOARD_BALANCE_THRESHOLD_PAUSED";
    }
    else {
      id v12 = @"DASHBOARD_BALANCE_THRESHOLD_ON";
    }
    id v13 = PKLocalizedPeerPaymentRecurringString(&v12->isa);
    [(PKDashboardBalanceItem *)v3 setAvailableCredit:v13];
  }
  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __58__PKDashboardPaymentPassDataSource_peerPaymentBalanceItem__block_invoke;
  v16[3] = &unk_1E59CB010;
  objc_copyWeak(&v17, &location);
  void v16[4] = self;
  [(PKDashboardBalanceItem *)v3 setTopUpAction:v16];
  id v14 = [(PKDashboardPaymentPassDataSource *)self peerPaymentAccount];
  -[PKDashboardBalanceItem setTopUpEnabled:](v3, "setTopUpEnabled:", [v14 state] == 1);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v3;
}

void __58__PKDashboardPaymentPassDataSource_peerPaymentBalanceItem__block_invoke(uint64_t a1)
{
  v23[5] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F87000];
  id v3 = [MEMORY[0x1E4F843E0] reporterForSubject:*MEMORY[0x1E4F87000]];

  if (!v3) {
    [MEMORY[0x1E4F843E0] beginSubjectReporting:v2];
  }
  id v4 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v5 = *MEMORY[0x1E4F869F0];
  uint64_t v6 = *MEMORY[0x1E4F86730];
  v22[0] = *MEMORY[0x1E4F864C8];
  v22[1] = v6;
  uint64_t v7 = *MEMORY[0x1E4F86750];
  v23[0] = v5;
  v23[1] = v7;
  uint64_t v8 = *MEMORY[0x1E4F86380];
  uint64_t v9 = *MEMORY[0x1E4F86120];
  v22[2] = *MEMORY[0x1E4F86308];
  v22[3] = v9;
  uint64_t v10 = *MEMORY[0x1E4F86A90];
  v23[2] = v8;
  v23[3] = v10;
  void v22[4] = *MEMORY[0x1E4F86A10];
  void v23[4] = *MEMORY[0x1E4F86A28];
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:5];
  [v4 subject:v2 sendEvent:v11];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v13 = WeakRetained;
  if (WeakRetained)
  {
    id v14 = [WeakRetained groupView];
    id v15 = objc_msgSend(v14, "pkui_viewControllerFromResponderChain");
    int v16 = [v15 navigationController];

    id v17 = [PKRecipientPickerViewController alloc];
    long long v18 = [v13 transactionSourceCollection];
    long long v19 = [(PKRecipientPickerViewController *)v17 initWithTransactionSourceCollection:v18 familyCollection:v13[98] peerPaymentSendFlowType:1];

    [(PKRecipientPickerViewController *)v19 setDelegate:*(void *)(a1 + 32)];
    long long v20 = [*(id *)(a1 + 32) nearbyPeerPaymentViewProvider];
    [(PKRecipientPickerViewController *)v19 setNearbyViewProvider:v20];

    uint64_t v21 = [[PKNavigationController alloc] initWithRootViewController:v19];
    [(PKNavigationController *)v21 setModalPresentationStyle:1];
    [v16 presentViewController:v21 animated:1 completion:0];
  }
}

- (BOOL)canDisplayPeerPaymentBalanceModule
{
  uint64_t v3 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount state];
  id v4 = [(PKDashboardPaymentPassDataSource *)self pass];
  uint64_t v5 = [v4 effectiveContactlessPaymentApplicationState];

  uint64_t v6 = [(PKDashboardPaymentPassDataSource *)self pass];
  uint64_t v7 = [v6 secureElementPass];
  uint64_t v8 = [v7 passActivationState];

  if (v5 != 1) {
    return 0;
  }
  return (unint64_t)(v3 - 1) < 2 && v8 != 4;
}

- (void)_recurringPeerPaymentSuggestionsWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  pass = self->_pass;
  if (pass
    && [(PKPaymentPass *)pass isValid]
    && [(PKPaymentPass *)self->_pass isPeerPaymentPass])
  {
    objc_initWeak(&location, self);
    v11[0] = 0;
    v11[1] = v11;
    id v11[2] = 0x3032000000;
    v11[3] = __Block_byref_object_copy__42;
    void v11[4] = __Block_byref_object_dispose__42;
    id v12 = (id)objc_opt_new();
    searchSuggestionController = self->_searchSuggestionController;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    id v7[2] = __83__PKDashboardPaymentPassDataSource__recurringPeerPaymentSuggestionsWithCompletion___block_invoke;
    v7[3] = &unk_1E59DA418;
    objc_copyWeak(&v10, &location);
    id v8 = v4;
    uint64_t v9 = v11;
    [(FHSearchSuggestionController *)searchSuggestionController allPeerPaymentForecastingSignals:v7];

    objc_destroyWeak(&v10);
    _Block_object_dispose(v11, 8);

    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, MEMORY[0x1E4F1CBF0]);
  }
}

void __83__PKDashboardPaymentPassDataSource__recurringPeerPaymentSuggestionsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __83__PKDashboardPaymentPassDataSource__recurringPeerPaymentSuggestionsWithCompletion___block_invoke_2;
  v6[3] = &unk_1E59DA3F0;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  uint64_t v9 = *(void *)(a1 + 40);
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);

  objc_destroyWeak(&v10);
}

void __83__PKDashboardPaymentPassDataSource__recurringPeerPaymentSuggestionsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained[23] currentBalance];
    long long v18 = [v4 currency];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      id v8 = 0;
      uint64_t v9 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v5);
          }
          id v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v12 = [v11 forecastingType];
          id v13 = [v11 peerPaymentHeuristicIds];
          if (v12 == 3)
          {
            id v14 = v11;
            if (([v3 _isExistingRecurringPeerPayment:v14] & 1) == 0)
            {
              uint64_t v15 = [v3 _messageForPersonWithAmount:v14 withHeuristicIds:v13 andCurrencyCode:v18];

              id v8 = (void *)v15;
            }
          }
          if (v8) {
            [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v8];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v7);
    }
    else
    {
      id v8 = 0;
    }

    uint64_t v16 = *(void *)(a1 + 40);
    id v17 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) copy];
    (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v17);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (BOOL)_isExistingRecurringPeerPayment:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = self->_recurringPeerPayments;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v10 = objc_msgSend(v4, "amount", (void)v16);
        id v11 = [v9 amount];
        if ([v10 isEqualToNumber:v11])
        {
          uint64_t v12 = [v4 personId];
          id v13 = [v9 recipientAddress];
          char v14 = [v12 isEqualToString:v13];

          if (v14)
          {
            LOBYTE(v6) = 1;
            goto LABEL_12;
          }
        }
        else
        {
        }
      }
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
LABEL_12:

  return v6;
}

- (void)_dismissRecurringPeerPaymentSuggestionsWithIdentifiers:(id)a3 dismissalType:(unint64_t)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = a3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v22 + 1) + 8 * v8);
        id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        id v11 = [NSNumber numberWithInteger:0];
        uint64_t v12 = off_1EB5459B0();
        [v10 setObject:v11 forKey:v12];

        id v13 = [NSNumber numberWithInteger:1];
        char v14 = off_1EB5459B8();
        [v10 setObject:v13 forKey:v14];

        uint64_t v15 = [NSNumber numberWithInteger:a4];
        long long v16 = off_1EB5459C0();
        [v10 setObject:v15 forKey:v16];

        long long v17 = off_1EB5459C8();
        [v10 setObject:v9 forKey:v17];

        searchSuggestionController = self->_searchSuggestionController;
        long long v19 = (void *)[v10 copy];
        [(FHSearchSuggestionController *)searchSuggestionController recordUserInteraction:v19];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v6);
  }
}

- (id)_messageForPersonWithAmount:(id)a3 withHeuristicIds:(id)a4 andCurrencyCode:(id)a5
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v44 = a3;
  id v39 = a4;
  id v41 = a5;
  objc_initWeak(&location, self);
  long long v45 = [v44 personId];
  uint64_t v8 = [(PKDashboardPaymentPassDataSource *)self _contactResolver];
  uint64_t v43 = [v8 contactForHandle:v45];

  id v42 = [v43 givenName];
  uint64_t v9 = [v44 periodicCategory];
  id v34 = (void *)PKPeerPaymentRecurringPaymentFrequencyFromString();

  long long v38 = [v44 signalDate];
  id v35 = [v44 dayOfWeek];
  uint64_t v10 = [v44 amount];
  long long v36 = PKCurrencyAmountMake();
  long long v37 = (void *)v10;
  if ([v42 length])
  {
    uint64_t v40 = objc_alloc_init(PKDashboardPassMessage);
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v11 = [(PKFamilyMemberCollection *)self->_familyCollection familyMembersByAltDSID];
    uint64_t v12 = [v11 allValues];

    uint64_t v13 = [v12 countByEnumeratingWithState:&v58 objects:v64 count:16];
    if (v13)
    {
      char v14 = 0;
      uint64_t v15 = *(void *)v59;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v59 != v15) {
            objc_enumerationMutation(v12);
          }
          long long v17 = *(void **)(*((void *)&v58 + 1) + 8 * i);
          if ([v17 memberType] == 1 || objc_msgSend(v17, "memberType") == 2)
          {
            long long v18 = [v17 contact];
            long long v19 = (void *)[objc_alloc(MEMORY[0x1E4F845D0]) initWithCNContact:v18];
            long long v20 = [v19 contactHandle];
            char v21 = [v45 isEqualToString:v20];

            v14 |= v21;
          }
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v58 objects:v64 count:16];
      }
      while (v13);

      if (v14)
      {
        long long v22 = v40;
        if (v34 == (void *)3)
        {
          long long v23 = [v36 minimalFormattedStringValue];
          uint64_t v24 = PKLocalizedPeerPaymentRecurringString(&cfstr_PeerPaymentSug_1.isa, &stru_1EF1B5770.isa, v42, v23);
          goto LABEL_28;
        }
        if (v34 == (void *)2)
        {
          long long v23 = [v36 minimalFormattedStringValue];
          uint64_t v24 = PKLocalizedPeerPaymentRecurringString(&cfstr_PeerPaymentSug_0.isa, &stru_1EF1B9A70.isa, v42, v23, v35);
          goto LABEL_28;
        }
        if (v34 == (void *)1)
        {
          long long v23 = [v36 minimalFormattedStringValue];
          uint64_t v24 = PKLocalizedPeerPaymentRecurringString(&cfstr_PeerPaymentSug.isa, &stru_1EF1B9A70.isa, v42, v23, v35);
LABEL_28:
          id v26 = (void *)v24;

          long long v22 = v40;
          goto LABEL_29;
        }
        goto LABEL_23;
      }
    }
    else
    {
    }
    long long v22 = v40;
    if (v34 == (void *)3)
    {
      long long v23 = [v36 minimalFormattedStringValue];
      uint64_t v24 = PKLocalizedPeerPaymentRecurringString(&cfstr_PeerPaymentSug_4.isa, &stru_1EF1B5770.isa, v42, v23);
      goto LABEL_28;
    }
    if (v34 == (void *)2)
    {
      long long v23 = [v36 minimalFormattedStringValue];
      uint64_t v24 = PKLocalizedPeerPaymentRecurringString(&cfstr_PeerPaymentSug_3.isa, &stru_1EF1B9A70.isa, v42, v23, v35);
      goto LABEL_28;
    }
    if (v34 == (void *)1)
    {
      long long v23 = [v36 minimalFormattedStringValue];
      uint64_t v24 = PKLocalizedPeerPaymentRecurringString(&cfstr_PeerPaymentSug_2.isa, &stru_1EF1B9A70.isa, v42, v23, v35);
      goto LABEL_28;
    }
LABEL_23:
    id v26 = 0;
LABEL_29:
    uint64_t v27 = PKLocalizedPeerPaymentRecurringString(&cfstr_PeerPaymentSug_5.isa, &stru_1EF1B4C70.isa, v42);
    [(PKDashboardPassMessage *)v22 setTitle:v27];
    [(PKDashboardPassMessage *)v22 setMessage:v26];
    [(PKDashboardPassMessage *)v22 setAvatarContact:v43];
    id v28 = PKLocalizedPeerPaymentRecurringString(&cfstr_PeerPaymentSug_6.isa);
    [(PKDashboardPassMessage *)v22 setButtonTitle:v28];

    memset(v57, 0, sizeof(v57));
    id v29 = v39;
    if ([v29 countByEnumeratingWithState:v57 objects:v63 count:16]) {
      uint64_t v30 = (__CFString *)**((id **)&v57[0] + 1);
    }
    else {
      uint64_t v30 = @"Unknown";
    }

    uint64_t v31 = [NSString stringWithFormat:@"recurringSuggestion-%@", v30];
    [(PKDashboardPassMessage *)v40 setIdentifier:v31];

    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __97__PKDashboardPaymentPassDataSource__messageForPersonWithAmount_withHeuristicIds_andCurrencyCode___block_invoke;
    v49[3] = &unk_1E59D1098;
    objc_copyWeak(v56, &location);
    id v50 = v43;
    id v51 = v45;
    id v52 = v41;
    id v53 = v37;
    v56[1] = v34;
    id v54 = v38;
    id v32 = v29;
    id v55 = v32;
    [(PKDashboardPassMessage *)v40 setActionOnButtonPress:v49];
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    void v46[2] = __97__PKDashboardPaymentPassDataSource__messageForPersonWithAmount_withHeuristicIds_andCurrencyCode___block_invoke_2;
    void v46[3] = &unk_1E59CB010;
    objc_copyWeak(&v48, &location);
    id v47 = v32;
    [(PKDashboardPassMessage *)v40 setActionOnDismiss:v46];
    long long v25 = v40;

    objc_destroyWeak(&v48);
    objc_destroyWeak(v56);

    goto LABEL_33;
  }
  long long v25 = 0;
LABEL_33:

  objc_destroyWeak(&location);

  return v25;
}

void __97__PKDashboardPaymentPassDataSource__messageForPersonWithAmount_withHeuristicIds_andCurrencyCode___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained)
  {
    uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F84D80]) initWithPeerPaymentWebService:*((void *)WeakRetained + 109)];
    id v3 = [PKPeerPaymentRemoteMessagesComposer alloc];
    id v4 = objc_msgSend(*((id *)WeakRetained + 1), "pkui_viewControllerFromResponderChain");
    uint64_t v5 = [(PKPeerPaymentRemoteMessagesComposer *)v3 initWithPeerPaymentController:v2 presentingViewController:v4 actionType:2 sourceType:1];

    uint64_t v6 = (void *)[objc_alloc(getCNComposeRecipientClass()) initWithContact:*(void *)(a1 + 32) address:*(void *)(a1 + 40) kind:5];
    id v7 = objc_alloc_init(MEMORY[0x1E4F84DD8]);
    [v7 setCurrency:*(void *)(a1 + 48)];
    [v7 setAmount:*(void *)(a1 + 56)];
    [v7 setFrequency:*(void *)(a1 + 88)];
    [v7 setStartDate:*(void *)(a1 + 64)];
    uint64_t v8 = [[PKAmountKeypadViewController alloc] initWithRemoteMessagesComposer:v5 recipient:v6 sendFlowType:2 familyCollection:*((void *)WeakRetained + 98)];
    [(PKAmountKeypadViewController *)v8 setRecurringPeerPayment:v7];
    [(PKAmountKeypadViewController *)v8 setShowCancelButton:1];
    uint64_t v9 = [[PKNavigationController alloc] initWithRootViewController:v8];
    uint64_t v10 = objc_msgSend(*((id *)WeakRetained + 1), "pkui_viewControllerFromResponderChain");
    id v11 = [v10 navigationController];
    [v11 presentViewController:v9 animated:1 completion:0];

    [WeakRetained _dismissRecurringPeerPaymentSuggestionsWithIdentifiers:*(void *)(a1 + 72) dismissalType:2];
    [WeakRetained reloadMessages];
  }
}

void __97__PKDashboardPaymentPassDataSource__messageForPersonWithAmount_withHeuristicIds_andCurrencyCode___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _dismissRecurringPeerPaymentSuggestionsWithIdentifiers:*(void *)(a1 + 32) dismissalType:1];
    [v3 reloadMessages];
    id WeakRetained = v3;
  }
}

- (void)setTransactions:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  transactions = self->_transactions;
  self->_transactions = v4;
}

- (void)_calculateDiffAndUpdateWithTransactions:(id)a3
{
  id v4 = a3;
  self->_forceTransactionsUpdate = 0;
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
  lastTransactionReload = self->_lastTransactionReload;
  self->_lastTransactionReload = v5;

  if (self->_allContentIsLoaded)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      objc_initWeak(&location, self);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      id v10[2] = __76__PKDashboardPaymentPassDataSource__calculateDiffAndUpdateWithTransactions___block_invoke;
      id v10[3] = &unk_1E59CB378;
      objc_copyWeak(&v12, &location);
      void v10[4] = self;
      id v11 = v4;
      [WeakRetained performBatchUpdates:v10 completion:0];

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    uint64_t v8 = (NSArray *)[v4 copy];
    transactions = self->_transactions;
    self->_transactions = v8;

    [(PKDashboardPaymentPassDataSource *)self updateContentIsLoaded];
  }
}

void __76__PKDashboardPaymentPassDataSource__calculateDiffAndUpdateWithTransactions___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = +[PKCollectionViewItemsDiffCalculator calculateDiffBetweenOldItems:andNewItems:inSection:](PKCollectionViewItemsDiffCalculator, "calculateDiffBetweenOldItems:andNewItems:inSection:", *(void *)(*(void *)(a1 + 32) + 72), *(void *)(a1 + 40), [*(id *)(a1 + 32) firstSectionIndexForSectionIdentifier:12]);
  id v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v3 deletedIndexPaths];
    uint64_t v5 = [v11 count];
    uint64_t v6 = [v3 insertedIndexPaths];
    uint64_t v7 = [v6 count];
    uint64_t v8 = [v3 movedFromIndexPaths];
    uint64_t v9 = [v8 count];
    uint64_t v10 = [v3 changedIndexPaths];
    *(_DWORD *)buf = 134218752;
    uint64_t v13 = v5;
    __int16 v14 = 2048;
    uint64_t v15 = v7;
    __int16 v16 = 2048;
    uint64_t v17 = v9;
    __int16 v18 = 2048;
    uint64_t v19 = [v10 count];
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Bank Connect transactions batch updates: %ld deletions, %ld insertions, %ld moves, %ld updates", buf, 0x2Au);
  }
  [WeakRetained setTransactions:*(void *)(a1 + 40)];
  [WeakRetained _applyDiff:v3];
}

- (void)_calculateDiffAndUpdateWithTransactionGroups:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[(NSArray *)self->_transactionGroups mutableCopy];
  uint64_t v6 = (void *)[v4 mutableCopy];
  uint64_t v27 = (void *)[v5 count];
  id v26 = (void *)[v6 count];
  if ([v5 count])
  {
    uint64_t v7 = [v5 firstObject];
    uint64_t v8 = [v7 firstObject];
  }
  else
  {
    uint64_t v8 = 0;
  }
  if ([v6 count])
  {
    uint64_t v9 = [v6 firstObject];
    uint64_t v10 = [v9 firstObject];
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v29 = (void *)v8;
  if (v8) {
    LODWORD(v8) = [(PKDashboardPaymentPassDataSource *)self isGroupInTheCurrentYear:v8];
  }
  id v28 = (void *)v10;
  if (v10) {
    BOOL v11 = [(PKDashboardPaymentPassDataSource *)self isGroupInTheCurrentYear:v10];
  }
  else {
    BOOL v11 = 0;
  }
  id v12 = (void *)MEMORY[0x1E4F1CBF0];
  uint64_t v13 = (void *)MEMORY[0x1E4F1CBF0];
  if (v8)
  {
    uint64_t v13 = [v5 firstObject];
    [v5 removeObjectAtIndex:0];
  }
  uint64_t v14 = [v5 firstObject];
  uint64_t v15 = (void *)v14;
  if (v14) {
    __int16 v16 = (void *)v14;
  }
  else {
    __int16 v16 = v12;
  }
  id v30 = v16;

  uint64_t v17 = v12;
  if (v11)
  {
    uint64_t v17 = [v6 firstObject];
    [v6 removeObjectAtIndex:0];
  }
  uint64_t v18 = [v6 firstObject];
  uint64_t v19 = (void *)v18;
  if (v18) {
    uint64_t v20 = (void *)v18;
  }
  else {
    uint64_t v20 = v12;
  }
  id v21 = v20;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    objc_initWeak(location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __81__PKDashboardPaymentPassDataSource__calculateDiffAndUpdateWithTransactionGroups___block_invoke;
    aBlock[3] = &unk_1E59CB010;
    objc_copyWeak(&v41, location);
    id v25 = v4;
    id v40 = v4;
    long long v23 = _Block_copy(aBlock);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __81__PKDashboardPaymentPassDataSource__calculateDiffAndUpdateWithTransactionGroups___block_invoke_2;
    v31[3] = &unk_1E59DA440;
    objc_copyWeak(v38, location);
    id v24 = v23;
    id v37 = v24;
    v38[1] = v26;
    v38[2] = v27;
    id v32 = WeakRetained;
    id v33 = v13;
    id v34 = v17;
    id v35 = v30;
    id v36 = v21;
    [v32 performBatchUpdates:v31 completion:0];

    objc_destroyWeak(v38);
    objc_destroyWeak(&v41);
    objc_destroyWeak(location);
    id v4 = v25;
  }
}

void __81__PKDashboardPaymentPassDataSource__calculateDiffAndUpdateWithTransactionGroups___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    WeakRetained[144] = 1;
    id v6 = WeakRetained;
    uint64_t v3 = [*(id *)(a1 + 32) copy];
    id v4 = (void *)*((void *)v6 + 112);
    *((void *)v6 + 112) = v3;

    uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
    [*((id *)v6 + 8) setObject:v5 forKeyedSubscript:&unk_1EF2B9750];

    id WeakRetained = v6;
  }
}

void __81__PKDashboardPaymentPassDataSource__calculateDiffAndUpdateWithTransactionGroups___block_invoke_2(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained firstSectionIndexForSectionIdentifier:16];
    BOOL v5 = v4 != 0;
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    uint64_t v7 = *(void *)(a1 + 88);
    uint64_t v6 = *(void *)(a1 + 96);
    if (v7 > v6)
    {
      uint64_t v8 = *(void **)(a1 + 32);
      uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v6 + v4, v7 - v6);
      [v8 insertSections:v9];

      uint64_t v10 = *(void **)(a1 + 32);
      BOOL v11 = (void *)MEMORY[0x1E4F28D60];
      uint64_t v12 = v4 - v5;
      uint64_t v13 = *(void *)(a1 + 96);
LABEL_6:
      __int16 v16 = objc_msgSend(v11, "indexSetWithIndexesInRange:", v12, v13 + v5);
      [v10 reloadSections:v16];
LABEL_7:

      goto LABEL_8;
    }
    if (v7 < v6)
    {
      uint64_t v14 = *(void **)(a1 + 32);
      uint64_t v15 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v7 + v4, v6 - v7);
      [v14 deleteSections:v15];

      uint64_t v10 = *(void **)(a1 + 32);
      BOOL v11 = (void *)MEMORY[0x1E4F28D60];
      uint64_t v12 = v4 - v5;
      uint64_t v13 = *(void *)(a1 + 88);
      goto LABEL_6;
    }
    if ([*(id *)(a1 + 40) count] && objc_msgSend(*(id *)(a1 + 48), "count"))
    {
      uint64_t v17 = +[PKCollectionViewItemsDiffCalculator calculateDiffBetweenOldItems:*(void *)(a1 + 40) andNewItems:*(void *)(a1 + 48) inSection:v4];
      uint64_t v18 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        id v35 = [v17 deletedIndexPaths];
        uint64_t v34 = [v35 count];
        uint64_t v19 = [v17 insertedIndexPaths];
        uint64_t v20 = [v19 count];
        id v21 = [v17 movedFromIndexPaths];
        uint64_t v22 = [v21 count];
        long long v23 = [v17 changedIndexPaths];
        *(_DWORD *)buf = 134218752;
        uint64_t v37 = v34;
        __int16 v38 = 2048;
        uint64_t v39 = v20;
        __int16 v40 = 2048;
        uint64_t v41 = v22;
        __int16 v42 = 2048;
        uint64_t v43 = [v23 count];
        _os_log_impl(&dword_19F450000, v18, OS_LOG_TYPE_DEFAULT, "Bank Connect monthly transaction groups batch updates: %ld deletions, %ld insertions, %ld moves, %ld updates", buf, 0x2Au);
      }
      [v3 _applyDiff:v17];

      uint64_t v24 = 1;
    }
    else
    {
      uint64_t v24 = 0;
    }
    if ([*(id *)(a1 + 56) count] && objc_msgSend(*(id *)(a1 + 64), "count"))
    {
      __int16 v16 = +[PKCollectionViewItemsDiffCalculator calculateDiffBetweenOldItems:*(void *)(a1 + 56) andNewItems:*(void *)(a1 + 64) inSection:v24 + v4];
      id v25 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        id v26 = [v16 deletedIndexPaths];
        uint64_t v27 = [v26 count];
        id v28 = [v16 insertedIndexPaths];
        uint64_t v29 = [v28 count];
        id v30 = [v16 movedFromIndexPaths];
        uint64_t v31 = [v30 count];
        id v32 = [v16 changedIndexPaths];
        uint64_t v33 = [v32 count];
        *(_DWORD *)buf = 134218752;
        uint64_t v37 = v27;
        __int16 v38 = 2048;
        uint64_t v39 = v29;
        __int16 v40 = 2048;
        uint64_t v41 = v31;
        __int16 v42 = 2048;
        uint64_t v43 = v33;
        _os_log_impl(&dword_19F450000, v25, OS_LOG_TYPE_DEFAULT, "Bank Connect yearly transaction groups batch updates: %ld deletions, %ld insertions, %ld moves, %ld updates", buf, 0x2Au);
      }
      [v3 _applyDiff:v16];
      goto LABEL_7;
    }
  }
LABEL_8:
}

- (PKAccount)account
{
  return self->_account;
}

- (PKAccountUserCollection)accountUserCollection
{
  return self->_accountUserCollection;
}

- (NSArray)accountUserInvitations
{
  return self->_accountUserInvitations;
}

- (NSSet)physicalCards
{
  return self->_physicalCards;
}

- (PKFamilyMemberCollection)familyCollection
{
  return self->_familyCollection;
}

- (PKDashboardTransactionFetcher)transactionFetcher
{
  return self->_transactionFetcher;
}

- (PKContactAvatarManager)avatarManager
{
  return self->_avatarManager;
}

- (PKSpendingSummaryFetcher)summaryFetcher
{
  return self->_summaryFetcher;
}

- (PKTransactionSourceCollection)transactionSourceCollection
{
  return self->_transactionSourceCollection;
}

- (NSArray)weeks
{
  return self->_weeks;
}

- (void)setWeeks:(id)a3
{
}

- (NSArray)months
{
  return self->_months;
}

- (void)setMonths:(id)a3
{
}

- (NSArray)years
{
  return self->_years;
}

- (NSArray)recurringPayments
{
  return self->_recurringPayments;
}

- (NSOrderedSet)secondaryMessages
{
  return self->_secondaryMessages;
}

- (BOOL)homeKitHasHomeGuestAccessSchedule
{
  return self->_homeKitHasHomeGuestAccessSchedule;
}

- (NSUUID)homeKitHomeIdentifier
{
  return self->_homeKitHomeIdentifier;
}

- (PKDashboardPaymentPassDataSourceDelegate)customDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_customDelegate);

  return (PKDashboardPaymentPassDataSourceDelegate *)WeakRetained;
}

- (void)setCustomDelegate:(id)a3
{
}

- (NSArray)recurringPeerPayments
{
  return self->_recurringPeerPayments;
}

- (void)setRecurringPeerPayments:(id)a3
{
}

- (NSArray)upcomingRecurringPeerPayments
{
  return self->_upcomingRecurringPeerPayments;
}

- (void)setUpcomingRecurringPeerPayments:(id)a3
{
}

- (PKPeerPaymentRecurringPayment)peerPaymentThresholdTopUp
{
  return self->_peerPaymentThresholdTopUp;
}

- (void)setPeerPaymentThresholdTopUp:(id)a3
{
}

- (BOOL)recurringPeerPaymentsLoaded
{
  return self->_recurringPeerPaymentsLoaded;
}

- (void)setRecurringPeerPaymentsLoaded:(BOOL)a3
{
  self->_recurringPeerPaymentsLoaded = a3;
}

- (BOOL)canShowPeerPaymentRecurringPayments
{
  return self->_canShowPeerPaymentRecurringPayments;
}

- (void)setCanShowPeerPaymentRecurringPayments:(BOOL)a3
{
  self->_canShowPeerPaymentRecurringPayments = a3;
}

- (NSArray)accounts
{
  return self->_accounts;
}

- (void)setAccounts:(id)a3
{
}

- (BOOL)accountsLoaded
{
  return self->_accountsLoaded;
}

- (void)setAccountsLoaded:(BOOL)a3
{
  self->_accountsLoaded = a3;
}

- (BOOL)allContentIsLoaded
{
  return self->_allContentIsLoaded;
}

- (void)setAllContentIsLoaded:(BOOL)a3
{
  self->_allContentIsLoaded = a3;
}

- (PKDashboardDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKDashboardDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PKPeerPaymentAccount)peerPaymentAccount
{
  return self->_peerPaymentAccount;
}

- (void)setPeerPaymentAccount:(id)a3
{
}

- (PKPeerPaymentWebService)peerPaymentWebService
{
  return self->_peerPaymentWebService;
}

- (void)setPeerPaymentWebService:(id)a3
{
}

- (PKPaymentPass)pass
{
  return self->_pass;
}

- (void)setPass:(id)a3
{
}

- (BOOL)performingAccountUpdate
{
  return self->_performingAccountUpdate;
}

- (void)setPerformingAccountUpdate:(BOOL)a3
{
  self->_performingAccountUpdate = a3;
}

- (PKPassPresentationContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSError)accountUpdateError
{
  return self->_accountUpdateError;
}

- (void)setAccountUpdateError:(id)a3
{
}

- (NSArray)transactionGroups
{
  return self->_transactionGroups;
}

- (void)setTransactionGroups:(id)a3
{
}

- (PKPayLaterDashboardMessageComposer)payLaterDashboardMessageComposer
{
  return self->_payLaterDashboardMessageComposer;
}

- (void)setPayLaterDashboardMessageComposer:(id)a3
{
}

- (void)setTransactionsCount:(unint64_t)a3
{
  self->_transactionsCount = a3;
}

- (PKAccountService)accountService
{
  return self->_accountService;
}

- (void)setAccountService:(id)a3
{
}

- (PKPaymentRewardsBalance)associatedPaymentRewardsBalance
{
  return self->_associatedPaymentRewardsBalance;
}

- (void)setAssociatedPaymentRewardsBalance:(id)a3
{
}

- (BOOL)payWithRewardsSupportState
{
  return self->_payWithRewardsSupportState;
}

- (void)setPayWithRewardsSupportState:(BOOL)a3
{
  self->_payWithRewardsSupportState = a3;
}

- (PKNearbyPeerPaymentViewProvider)nearbyPeerPaymentViewProvider
{
  return self->_nearbyPeerPaymentViewProvider;
}

- (void)setNearbyPeerPaymentViewProvider:(id)a3
{
}

- (PKPayLaterFinancingPlansFetcher)plansFetcher
{
  return self->_plansFetcher;
}

- (void)setPlansFetcher:(id)a3
{
}

- (PKPayLaterInstallmentPresenter)installmentPresenter
{
  return self->_installmentPresenter;
}

- (void)setInstallmentPresenter:(id)a3
{
}

- (NSArray)financingPlans
{
  return self->_financingPlans;
}

- (void)setFinancingPlans:(id)a3
{
}

- (int64_t)completedFinancingPlansCount
{
  return self->_completedFinancingPlansCount;
}

- (void)setCompletedFinancingPlansCount:(int64_t)a3
{
  self->_completedFinancingPlansCount = a3;
}

- (NSArray)payLaterUpcomingInstallments
{
  return self->_payLaterUpcomingInstallments;
}

- (void)setPayLaterUpcomingInstallments:(id)a3
{
}

- (NSDictionary)installmentIdentifierToFinancingPlan
{
  return self->_installmentIdentifierToFinancingPlan;
}

- (void)setInstallmentIdentifierToFinancingPlan:(id)a3
{
}

- (PKCurrencyAmount)payLaterDueNext30Days
{
  return self->_payLaterDueNext30Days;
}

- (void)setPayLaterDueNext30Days:(id)a3
{
}

- (PKCurrencyAmount)payLaterTotalPending
{
  return self->_payLaterTotalPending;
}

- (void)setPayLaterTotalPending:(id)a3
{
}

- (PKPayLaterCalendarViewController)payLaterCalendarViewController
{
  return self->_payLaterCalendarViewController;
}

- (void)setPayLaterCalendarViewController:(id)a3
{
}

- (PKPayLaterPaymentIntentController)paymentIntentController
{
  return self->_paymentIntentController;
}

- (void)setPaymentIntentController:(id)a3
{
}

- (BOOL)financingPlansLoaded
{
  return self->_financingPlansLoaded;
}

- (void)setFinancingPlansLoaded:(BOOL)a3
{
  self->_financingPlansLoaded = a3;
}

- (BOOL)loadingFinancingPlans
{
  return self->_loadingFinancingPlans;
}

- (void)setLoadingFinancingPlans:(BOOL)a3
{
  self->_loadingFinancingPlans = a3;
}

- (BOOL)hasMoreFinancingPlansToLoad
{
  return self->_hasMoreFinancingPlansToLoad;
}

- (void)setHasMoreFinancingPlansToLoad:(BOOL)a3
{
  self->_hasMoreFinancingPlansToLoad = a3;
}

- (BOOL)shouldDisplayPayLaterItems
{
  return self->_shouldDisplayPayLaterItems;
}

- (void)setShouldDisplayPayLaterItems:(BOOL)a3
{
  self->_shouldDisplayPayLaterItems = a3;
}

- (BOOL)hasPayLaterEligibleSpend
{
  return self->_hasPayLaterEligibleSpend;
}

- (void)setHasPayLaterEligibleSpend:(BOOL)a3
{
  self->_hasPayLaterEligibleSpend = a3;
}

- (BOOL)bankConnectDataLoaded
{
  return self->_bankConnectDataLoaded;
}

- (void)setBankConnectDataLoaded:(BOOL)a3
{
  self->_bankConnectDataLoaded = a3;
}

- (FKBankConnectAccountsProvider)bankConnectAccountsProvider
{
  return self->_bankConnectAccountsProvider;
}

- (void)setBankConnectAccountsProvider:(id)a3
{
}

- (FKBankConnectImageProvider)bankConnectImageProvider
{
  return self->_bankConnectImageProvider;
}

- (void)setBankConnectImageProvider:(id)a3
{
}

- (FKBankConnectInstitutionMatcher)bankConnectInstitutionMatcher
{
  return self->_bankConnectInstitutionMatcher;
}

- (void)setBankConnectInstitutionMatcher:(id)a3
{
}

- (FKBankConnectTransactionsAndGroupsProvider)bankConnectTransactionsProvider
{
  return self->_bankConnectTransactionsProvider;
}

- (void)setBankConnectTransactionsProvider:(id)a3
{
}

- (FKBankConnectMessagesManager)bankConnectMessagesManager
{
  return self->_bankConnectMessagesManager;
}

- (void)setBankConnectMessagesManager:(id)a3
{
}

- (PKDashboardBankConnectLinkedAccountData)bankConnectLinkedAccountData
{
  return self->_bankConnectLinkedAccountData;
}

- (void)setBankConnectLinkedAccountData:(id)a3
{
}

- (NSArray)bankConnectMonthlyTransactionGroups
{
  return self->_bankConnectMonthlyTransactionGroups;
}

- (void)setBankConnectMonthlyTransactionGroups:(id)a3
{
}

- (NSArray)bankConnectYearlyTransactionGroups
{
  return self->_bankConnectYearlyTransactionGroups;
}

- (void)setBankConnectYearlyTransactionGroups:(id)a3
{
}

- (PKDashboardPassMessage)bankConnectMessage
{
  return self->_bankConnectMessage;
}

- (void)setBankConnectMessage:(id)a3
{
}

- (PKCurrencyAmount)lastUpdatedBalance
{
  return self->_lastUpdatedBalance;
}

- (void)setLastUpdatedBalance:(id)a3
{
}

- (PKAppleBalanceAddMoneyUIManager)appleBalanceAddMoneyUIManager
{
  return self->_appleBalanceAddMoneyUIManager;
}

- (void)setAppleBalanceAddMoneyUIManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleBalanceAddMoneyUIManager, 0);
  objc_storeStrong((id *)&self->_lastUpdatedBalance, 0);
  objc_storeStrong((id *)&self->_bankConnectMessage, 0);
  objc_storeStrong((id *)&self->_bankConnectYearlyTransactionGroups, 0);
  objc_storeStrong((id *)&self->_bankConnectMonthlyTransactionGroups, 0);
  objc_storeStrong((id *)&self->_bankConnectLinkedAccountData, 0);
  objc_storeStrong((id *)&self->_bankConnectMessagesManager, 0);
  objc_storeStrong((id *)&self->_bankConnectTransactionsProvider, 0);
  objc_storeStrong((id *)&self->_bankConnectInstitutionMatcher, 0);
  objc_storeStrong((id *)&self->_bankConnectImageProvider, 0);
  objc_storeStrong((id *)&self->_bankConnectAccountsProvider, 0);
  objc_storeStrong((id *)&self->_paymentIntentController, 0);
  objc_storeStrong((id *)&self->_payLaterCalendarViewController, 0);
  objc_storeStrong((id *)&self->_payLaterTotalPending, 0);
  objc_storeStrong((id *)&self->_payLaterDueNext30Days, 0);
  objc_storeStrong((id *)&self->_installmentIdentifierToFinancingPlan, 0);
  objc_storeStrong((id *)&self->_payLaterUpcomingInstallments, 0);
  objc_storeStrong((id *)&self->_financingPlans, 0);
  objc_storeStrong((id *)&self->_installmentPresenter, 0);
  objc_storeStrong((id *)&self->_plansFetcher, 0);
  objc_storeStrong((id *)&self->_nearbyPeerPaymentViewProvider, 0);
  objc_storeStrong((id *)&self->_associatedPaymentRewardsBalance, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_payLaterDashboardMessageComposer, 0);
  objc_storeStrong((id *)&self->_transactionGroups, 0);
  objc_storeStrong((id *)&self->_accountUpdateError, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_peerPaymentWebService, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_storeStrong((id *)&self->_peerPaymentThresholdTopUp, 0);
  objc_storeStrong((id *)&self->_upcomingRecurringPeerPayments, 0);
  objc_storeStrong((id *)&self->_recurringPeerPayments, 0);
  objc_storeStrong((id *)&self->_secondaryMessages, 0);
  objc_storeStrong((id *)&self->_recurringPayments, 0);
  objc_storeStrong((id *)&self->_years, 0);
  objc_storeStrong((id *)&self->_months, 0);
  objc_storeStrong((id *)&self->_weeks, 0);
  objc_storeStrong((id *)&self->_avatarManager, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);
  objc_storeStrong((id *)&self->_physicalCards, 0);
  objc_storeStrong((id *)&self->_accountUserInvitations, 0);
  objc_storeStrong((id *)&self->_accountUserCollection, 0);
  objc_storeStrong((id *)&self->_expirationTimer, 0);
  objc_storeStrong((id *)&self->_searchSuggestionController, 0);
  objc_storeStrong((id *)&self->_incomingRequestActionInProgressRequestToken, 0);
  objc_storeStrong((id *)&self->_outgoingRequests, 0);
  objc_storeStrong((id *)&self->_incomingRequests, 0);
  objc_storeStrong((id *)&self->_contactIssuerHelper, 0);
  objc_storeStrong((id *)&self->_lastReportedDiscoveryIdentifier, 0);
  objc_storeStrong((id *)&self->_linkedApplication, 0);
  objc_storeStrong((id *)&self->_sourcesPerFundingSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_messageImagesCache, 0);
  objc_storeStrong((id *)&self->_engagementMessages, 0);
  objc_storeStrong((id *)&self->_AMPEnrollmentManager, 0);
  objc_storeStrong((id *)&self->_AMPEnrollmentIcon, 0);
  objc_storeStrong((id *)&self->_scaleKey, 0);
  objc_storeStrong((id *)&self->_icons, 0);
  objc_storeStrong((id *)&self->_iconFailedDownloads, 0);
  objc_storeStrong((id *)&self->_iconDownloads, 0);
  objc_storeStrong((id *)&self->_accountResolutionController, 0);
  objc_storeStrong((id *)&self->_homeKitHomeIdentifier, 0);
  objc_storeStrong((id *)&self->_currentSummary, 0);
  objc_storeStrong((id *)&self->_startCurrentPeriod, 0);
  objc_storeStrong((id *)&self->_summaryFetcher, 0);
  objc_storeStrong((id *)&self->_inboxDataSource, 0);
  objc_storeStrong((id *)&self->_accountPendingFamilyMembers, 0);
  objc_storeStrong((id *)&self->_currentMonthTransactions, 0);
  objc_storeStrong((id *)&self->_pendingPayments, 0);
  objc_storeStrong((id *)&self->_upcomingScheduledPayments, 0);
  objc_storeStrong((id *)&self->_currentStatement, 0);
  objc_storeStrong((id *)&self->_physicalCardController, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_executionBlocksContentIsLoaded, 0);
  objc_storeStrong((id *)&self->_formatterPercentage, 0);
  objc_storeStrong((id *)&self->_formatterMonthDay, 0);
  objc_storeStrong((id *)&self->_formatterMonth, 0);
  objc_storeStrong((id *)&self->_formatterYear, 0);
  objc_storeStrong((id *)&self->_messages, 0);
  objc_storeStrong((id *)&self->_tileGroups, 0);
  objc_storeStrong((id *)&self->_secureElement, 0);
  objc_storeStrong((id *)&self->_paymentVerificationController, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_transitItems, 0);
  objc_storeStrong((id *)&self->_transitBalanceModel, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccountResolutionController, 0);
  objc_storeStrong((id *)&self->_contactResolver, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_precursorUpgradeController, 0);
  objc_storeStrong((id *)&self->_lastTransactionReload, 0);
  objc_storeStrong((id *)&self->_timerTransactions, 0);
  objc_storeStrong((id *)&self->_previousTransactions, 0);
  objc_storeStrong((id *)&self->_currentMonthFetcher, 0);
  objc_storeStrong((id *)&self->_transactionFetcher, 0);
  objc_storeStrong((id *)&self->_autoReloadSetupController, 0);
  objc_storeStrong((id *)&self->_associatedAccountsController, 0);
  objc_storeStrong((id *)&self->_auxiliarySectionInfo, 0);
  objc_storeStrong((id *)&self->_transactions, 0);
  objc_storeStrong((id *)&self->_dynamicSections, 0);
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_customDelegate);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_passView, 0);

  objc_storeStrong((id *)&self->_groupView, 0);
}

- (void)_fetchBankConnectTransactions
{
  if ([(PKDashboardPaymentPassDataSource *)self isBankConnectLinked])
  {
    uint64_t v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v5 = 0;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Starting fetching Bank Connect transactions and groups", v5, 2u);
    }

    uint64_t v4 = [(PKDashboardPaymentPassDataSource *)self bankConnectTransactionsProvider];
    [v4 performFetchAndStartObservingNotifications];
  }
}

- (void)clearBankConnectData
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(PKDashboardPaymentPassDataSource *)self delegate];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__PKDashboardPaymentPassDataSource_BankConnect__clearBankConnectData__block_invoke;
  v4[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v5, &location);
  [v3 performBatchUpdates:v4 completion:0];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __69__PKDashboardPaymentPassDataSource_BankConnect__clearBankConnectData__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained setBankConnectLinkedAccountData:0];
    [v2 _hideLatestTransactions];
    [v2 _hideTransactionGroups];
    [v2 _reloadBalance];
    [v2 _hideBankConnectMessageAndReloadIfNeeded];
    id WeakRetained = v2;
  }
}

- (void)reloadBankConnectData
{
  if ([(PKDashboardPaymentPassDataSource *)self isBankConnectSupported]
    && [(PKDashboardPaymentPassDataSource *)self _isBankConnectPassReady])
  {
    uint64_t v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Starting to reload Bank Connect account", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    uint64_t v4 = [(PKDashboardPaymentPassDataSource *)self bankConnectAccountsProvider];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    id v5[2] = __70__PKDashboardPaymentPassDataSource_BankConnect__reloadBankConnectData__block_invoke;
    v5[3] = &unk_1E59DDA18;
    objc_copyWeak(&v6, buf);
    [v4 accountAndReconsentStatusWithCompletion:v5];

    [(PKDashboardPaymentPassDataSource *)self _refetchBalanceAndTransactions];
    objc_destroyWeak(&v6);
    objc_destroyWeak(buf);
  }
  else
  {
    [(PKDashboardPaymentPassDataSource *)self setBankConnectDataLoaded:1];
    if ([(PKDashboardPaymentPassDataSource *)self isBankConnectLinked]) {
      [(PKDashboardPaymentPassDataSource *)self clearBankConnectData];
    }
    [(PKDashboardPaymentPassDataSource *)self _hideBankConnectMessageAndReloadIfNeeded];
  }
}

void __70__PKDashboardPaymentPassDataSource_BankConnect__reloadBankConnectData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__PKDashboardPaymentPassDataSource_BankConnect__reloadBankConnectData__block_invoke_2;
  block[3] = &unk_1E59CC220;
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v12);
}

void __70__PKDashboardPaymentPassDataSource_BankConnect__reloadBankConnectData__block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) account];

  if (!v2)
  {
    uint64_t v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v12 = 138412290;
      uint64_t v13 = v7;
      id v5 = v3;
      uint32_t v6 = 12;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  if ([*(id *)(a1 + 32) consentStatus] == 1)
  {
    uint64_t v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      uint64_t v4 = "Bank Connect consent status is invalid";
      id v5 = v3;
      uint32_t v6 = 2;
LABEL_7:
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v12, v6);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v9 = [*(id *)(a1 + 32) account];
  uint64_t v10 = [*(id *)(a1 + 32) consentStatus];
  id v11 = [*(id *)(a1 + 32) institution];
  [WeakRetained updateWithBankConnectAccount:v9 consentStatus:v10 institution:v11];
}

- (BOOL)_isShowingSetUpMessage
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [(PKDashboardPaymentPassDataSource *)self secondaryMessages];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint32_t v6 = [*(id *)(*((void *)&v8 + 1) + 8 * i) identifier];

        if (v6 == @"bankConnectSetUp")
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)updateWithBankConnectAccount:(id)a3 consentStatus:(unint64_t)a4 institution:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [(PKDashboardPaymentPassDataSource *)self setBankConnectDataLoaded:1];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __104__PKDashboardPaymentPassDataSource_BankConnect__updateWithBankConnectAccount_consentStatus_institution___block_invoke;
  __int16 v16 = &unk_1E59CEF78;
  id v17 = v8;
  uint64_t v18 = self;
  id v19 = v9;
  unint64_t v20 = a4;
  id v10 = v9;
  id v11 = v8;
  int v12 = (void (**)(void))_Block_copy(&v13);
  if ([(PKDashboardPaymentPassDataSource *)self allContentIsLoaded])
  {
    v12[2](v12);
  }
  else
  {
    [(PKDashboardPaymentPassDataSource *)self executeAfterContentIsLoaded:v12];
    [(PKDashboardPaymentPassDataSource *)self updateContentIsLoaded];
  }
}

void __104__PKDashboardPaymentPassDataSource_BankConnect__updateWithBankConnectAccount_consentStatus_institution___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  if (v3)
  {
    uint64_t v4 = [v2 bankConnectLinkedAccountData];

    id v5 = [*(id *)(a1 + 40) bankConnectLinkedAccountData];
    BOOL v6 = [v5 consentStatus] == 1 && *(void *)(a1 + 56) == 0;

    if (v4) {
      int v7 = v6;
    }
    else {
      int v7 = 1;
    }
    id v8 = [*(id *)(a1 + 32) fullyQualifiedAccountIdentifier];
    id v16 = [v8 accountID];

    id v9 = [*(id *)(a1 + 40) bankConnectMessage];
    id v10 = [v9 identifier];

    id v11 = [*(id *)(a1 + 40) bankConnectMessagesManager];
    int v12 = [v11 isAccountMessageDismissed:2 forAccountIdentifier:v16];

    if (v10 != @"bankConnectConnected" || v12) {
      [*(id *)(a1 + 40) _hideBankConnectMessageAndReloadIfNeeded];
    }
    uint64_t v13 = objc_alloc_init(PKDashboardBankConnectLinkedAccountData);
    [(PKDashboardBankConnectLinkedAccountData *)v13 setAccount:*(void *)(a1 + 32)];
    [(PKDashboardBankConnectLinkedAccountData *)v13 setConsentStatus:*(void *)(a1 + 56)];
    [(PKDashboardBankConnectLinkedAccountData *)v13 setInstitution:*(void *)(a1 + 48)];
    [*(id *)(a1 + 40) setBankConnectLinkedAccountData:v13];
    [*(id *)(a1 + 40) _reloadBalance];
    [*(id *)(a1 + 40) _showBankConnectMessageIfNeeded];
    uint64_t v14 = *(void **)(a1 + 40);
    if (v7)
    {
      [v14 _fetchBankConnectTransactions];
    }
    else if (([v14 isBankConnectLinked] & 1) == 0)
    {
      [*(id *)(a1 + 40) reloadTransactions];
      [*(id *)(a1 + 40) reloadTransactionGroups];
    }
  }
  else if (([v2 _isShowingSetUpMessage] & 1) == 0)
  {
    [*(id *)(a1 + 40) _hideBankConnectMessageAndReloadIfNeeded];
    [*(id *)(a1 + 40) setBankConnectLinkedAccountData:0];
    [*(id *)(a1 + 40) _reloadBalance];
    [*(id *)(a1 + 40) _hideLatestTransactions];
    [*(id *)(a1 + 40) _hideTransactionGroups];
    [*(id *)(a1 + 40) reloadTransactions];
    [*(id *)(a1 + 40) reloadTransactionGroups];
    uint64_t v15 = *(void **)(a1 + 40);
    [v15 _showBankConnectMessageIfNeeded];
  }
}

- (void)_refetchBalanceAndTransactions
{
  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F26B78], *MEMORY[0x1E4F26B80], *MEMORY[0x1E4F26B88], 0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = (void *)MEMORY[0x1E4F26BB8];
  uint64_t v4 = [(PKDashboardPaymentPassDataSource *)self pass];
  id v5 = [v4 primaryAccountIdentifier];
  [v3 refreshAttributes:v6 forPrimaryAccountIdentifier:v5 completionHandler:&__block_literal_global_204];
}

void __79__PKDashboardPaymentPassDataSource_BankConnect___refetchBalanceAndTransactions__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = [v2 localizedDescription];
      int v5 = 138412290;
      id v6 = v4;
      _os_log_error_impl(&dword_19F450000, v3, OS_LOG_TYPE_ERROR, "Failed to refresh Bank Connect attributes with error: %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (BOOL)isBankConnectSupported
{
  id v2 = [(PKDashboardPaymentPassDataSource *)self pass];
  char v3 = PKBankConnectAvailableForPass();

  return v3;
}

- (BOOL)_isBankConnectPassReady
{
  id v2 = [(PKDashboardPaymentPassDataSource *)self pass];
  char v3 = [v2 devicePrimaryPaymentApplication];
  uint64_t v4 = [v3 state];

  return v4 == 1;
}

- (BOOL)isBankConnectLinked
{
  if (![(PKDashboardPaymentPassDataSource *)self isBankConnectSupported]) {
    return 0;
  }
  char v3 = [(PKDashboardPaymentPassDataSource *)self bankConnectLinkedAccountData];
  uint64_t v4 = [v3 consentStatus];
  int v5 = [v3 account];
  if (v5) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  BOOL v7 = v6;

  return v7;
}

- (BOOL)hasBankConnectAccountBalance
{
  char v3 = [(PKDashboardPaymentPassDataSource *)self bankConnectLinkedAccountData];
  uint64_t v4 = [v3 account];

  if ([(PKDashboardPaymentPassDataSource *)self isBankConnectLinked]
    && [v4 isAccountEnabled])
  {
    int v5 = [v4 balance];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)hasBankConnectTransactions
{
  id v2 = [(PKDashboardPaymentPassDataSource *)self bankConnectLinkedAccountData];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_reloadBalance
{
  unint64_t v3 = [(PKDashboardPaymentPassDataSource *)self firstSectionIndexForSectionIdentifier:3];
  id v5 = [(PKDashboardPaymentPassDataSource *)self delegate];
  uint64_t v4 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v3];
  [v5 reloadSections:v4];
}

- (void)_hideLatestTransactions
{
}

- (void)_hideTransactionGroups
{
  uint64_t v3 = MEMORY[0x1E4F1CBF0];
  [(PKDashboardPaymentPassDataSource *)self setBankConnectMonthlyTransactionGroups:MEMORY[0x1E4F1CBF0]];

  [(PKDashboardPaymentPassDataSource *)self setBankConnectYearlyTransactionGroups:v3];
}

- (id)getPassProductType
{
  id v2 = [(PKDashboardPaymentPassDataSource *)self bankConnectLinkedAccountData];
  uint64_t v3 = [v2 account];

  uint64_t v4 = [v3 accountType];
  id v5 = (id *)MEMORY[0x1E4F86B08];
  if (v4 == 1) {
    id v5 = (id *)MEMORY[0x1E4F86B00];
  }
  id v6 = *v5;

  return v6;
}

- (void)_hideBankConnectMessageAndReloadIfNeeded
{
  uint64_t v3 = [(PKDashboardPaymentPassDataSource *)self bankConnectMessage];

  [(PKDashboardPaymentPassDataSource *)self setBankConnectMessage:0];
  if (v3)
  {
    [(PKDashboardPaymentPassDataSource *)self reloadSecondaryMessages];
  }
}

- (void)_showBankConnectMessageIfNeeded
{
  if ([(PKDashboardPaymentPassDataSource *)self _isBankConnectPassReady])
  {
    uint64_t v3 = [(PKDashboardPaymentPassDataSource *)self bankConnectLinkedAccountData];
    uint64_t v4 = [v3 account];

    id v5 = [v4 fullyQualifiedAccountIdentifier];
    id v6 = [v4 fullyQualifiedAccountIdentifier];
    BOOL v7 = [v6 accountID];

    id v8 = [(PKDashboardPaymentPassDataSource *)self bankConnectLinkedAccountData];
    id v9 = [v8 institution];

    if (v5)
    {
      id v10 = [(PKDashboardPaymentPassDataSource *)self bankConnectMessagesManager];
      id v11 = [v10 shouldDisplayBackgroundRefreshConfirmationMessageForFQAID:v5];
    }
    else
    {
      id v11 = 0;
    }
    int v12 = [v9 termsAndConditions];
    int v13 = [v12 shouldNotifyAboutChanges];
    uint64_t v14 = [(PKDashboardPaymentPassDataSource *)self bankConnectLinkedAccountData];

    if (v14)
    {
      uint64_t v15 = [(PKDashboardPaymentPassDataSource *)self bankConnectLinkedAccountData];
      uint64_t v16 = [v15 consentStatus];

      if (v16 == 1)
      {
        id v17 = [(PKDashboardPaymentPassDataSource *)self bankConnectMessagesManager];
        char v18 = [v17 isAccountMessageDismissed:1 forAccountIdentifier:v7];

        if ((v18 & 1) == 0)
        {
          id v19 = [(PKDashboardPaymentPassDataSource *)self bankConnectLinkedAccountData];
          unint64_t v20 = [v19 account];
          id v21 = [v20 consentUUID];

          uint64_t v22 = [(PKDashboardPaymentPassDataSource *)self _createReconsentMessageWithInstitution:v9 withPreviousConsentUUID:v21];
          long long v23 = self;
          uint64_t v24 = v22;
          id v25 = v9;
          uint64_t v26 = 1;
LABEL_24:
          [(PKDashboardPaymentPassDataSource *)v23 _showBankConnectMessage:v24 forInstitution:v25 shouldUseInstitutionLogo:v26];
        }
LABEL_25:

        return;
      }
      if ([v4 isAccountMismatched])
      {
        uint64_t v34 = [(PKDashboardPaymentPassDataSource *)self bankConnectMessagesManager];
        char v35 = [v34 isAccountMessageDismissed:3 forAccountIdentifier:v7];

        if ((v35 & 1) == 0)
        {
          long long v45 = [(PKDashboardPaymentPassDataSource *)self bankConnectLinkedAccountData];
          long long v46 = [v45 account];
          id v21 = [v46 consentUUID];

          uint64_t v22 = [(PKDashboardPaymentPassDataSource *)self _createMismatchedAccountMessageWithInstitution:v9 withPreviousConsentUUID:v21];
          long long v23 = self;
          uint64_t v24 = v22;
          id v25 = v9;
          uint64_t v26 = 0;
          goto LABEL_24;
        }
      }
      if (v11 && [v11 shouldShowPrompt])
      {
        id v36 = [(PKDashboardPaymentPassDataSource *)self bankConnectLinkedAccountData];
        uint64_t v37 = [v11 token];
        [v36 setBackgroundRefreshConfirmationToken:v37];

        uint64_t v38 = [(PKDashboardPaymentPassDataSource *)self _createBackgroundRefreshConfirmationMessageWithInstitution:v9];
        goto LABEL_22;
      }
      if (!v13
        || ([(PKDashboardPaymentPassDataSource *)self bankConnectMessagesManager],
            __int16 v40 = objc_claimAutoreleasedReturnValue(),
            char v41 = [v40 isAccountMessageDismissed:5 forAccountIdentifier:v7],
            v40,
            (v41 & 1) != 0))
      {
        __int16 v42 = [(PKDashboardPaymentPassDataSource *)self bankConnectMessagesManager];
        char v43 = [v42 isAccountMessageDismissed:2 forAccountIdentifier:v7];

        if (v43) {
          goto LABEL_25;
        }
        uint64_t v38 = [(PKDashboardPaymentPassDataSource *)self _createConnectedMessageWithInstitution:v9];
LABEL_22:
        uint64_t v44 = (void *)v38;
        [(PKDashboardPaymentPassDataSource *)self _showBankConnectMessage:v38 forInstitution:v9 shouldUseInstitutionLogo:1];

        goto LABEL_25;
      }
      uint64_t v47 = [(PKDashboardPaymentPassDataSource *)self _createTermsAndConditionsUpdateMessageWithTermsAndConditions:v12];
      if (!v47) {
        goto LABEL_25;
      }
      id v30 = (void *)v47;
      id v51 = v12;
      uint64_t v27 = v7;
      id v28 = v11;
      id v48 = [(PKDashboardPaymentPassDataSource *)self bankConnectMessage];
      id v49 = [v48 identifier];

      id v50 = [v30 identifier];
      if (([v49 isEqualToString:v50] & 1) == 0)
      {
        [(PKDashboardPaymentPassDataSource *)self setBankConnectMessage:v30];
        [(PKDashboardPaymentPassDataSource *)self reloadSecondaryMessages];
      }
    }
    else
    {
      id v51 = v12;
      uint64_t v27 = v7;
      id v28 = v11;
      uint64_t v29 = [(PKDashboardPaymentPassDataSource *)self pass];
      id v30 = [v29 fkPaymentPass];

      uint64_t v31 = [(PKDashboardPaymentPassDataSource *)self bankConnectMessagesManager];
      id v32 = [v30 primaryAccountIdentifier];
      char v33 = [v31 isPassMessageDismissed:0 forFPANIdentifier:v32];

      if ((v33 & 1) == 0)
      {
        objc_initWeak(&location, self);
        uint64_t v39 = [(PKDashboardPaymentPassDataSource *)self bankConnectInstitutionMatcher];
        id v11 = v28;
        v52[0] = MEMORY[0x1E4F143A8];
        v52[1] = 3221225472;
        v52[2] = __80__PKDashboardPaymentPassDataSource_BankConnect___showBankConnectMessageIfNeeded__block_invoke;
        v52[3] = &unk_1E59DDA40;
        v52[4] = self;
        objc_copyWeak(&v53, &location);
        [v39 institutionForPaymentPass:v30 withCompletion:v52];
        BOOL v7 = v27;

        objc_destroyWeak(&v53);
        objc_destroyWeak(&location);

        goto LABEL_17;
      }
    }

    id v11 = v28;
    BOOL v7 = v27;
LABEL_17:
    int v12 = v51;
    goto LABEL_25;
  }
}

void __80__PKDashboardPaymentPassDataSource_BankConnect___showBankConnectMessageIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__PKDashboardPaymentPassDataSource_BankConnect___showBankConnectMessageIfNeeded__block_invoke_2;
  block[3] = &unk_1E59CC220;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v9);
}

void __80__PKDashboardPaymentPassDataSource_BankConnect___showBankConnectMessageIfNeeded__block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = [*(id *)(a1 + 40) bankConnectLinkedAccountData];
    id v3 = [v2 account];

    if (!v3)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      uint64_t v4 = [*(id *)(a1 + 40) _createSetupMessageWithInstitution:*(void *)(a1 + 32)];
      [WeakRetained _showBankConnectMessage:v4 forInstitution:*(void *)(a1 + 32) shouldUseInstitutionLogo:1];
    }
  }
}

- (void)_showBankConnectMessage:(id)a3 forInstitution:(id)a4 shouldUseInstitutionLogo:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(PKDashboardPaymentPassDataSource *)self bankConnectMessage];
  id v11 = [v10 identifier];

  int v12 = [v8 identifier];
  if (([v11 isEqualToString:v12] & 1) == 0)
  {
    int v13 = [(PKDashboardPaymentPassDataSource *)self bankConnectImageProvider];
    if (v13)
    {
      double v14 = PKUIScreenScale();
      uint64_t v15 = [v9 institutionIdentifier];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      void v16[2] = __113__PKDashboardPaymentPassDataSource_BankConnect___showBankConnectMessage_forInstitution_shouldUseInstitutionLogo___block_invoke;
      v16[3] = &unk_1E59DDA68;
      BOOL v19 = a5;
      id v17 = v8;
      char v18 = self;
      objc_msgSend(v13, "logoForInstitutionID:size:scale:completion:", v15, v16, 45.0, 45.0, v14);
    }
    else
    {
      [(PKDashboardPaymentPassDataSource *)self setBankConnectMessage:v8];
      [(PKDashboardPaymentPassDataSource *)self reloadSecondaryMessages];
    }
  }
}

void __113__PKDashboardPaymentPassDataSource_BankConnect___showBankConnectMessage_forInstitution_shouldUseInstitutionLogo___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  id v7[2] = __113__PKDashboardPaymentPassDataSource_BankConnect___showBankConnectMessage_forInstitution_shouldUseInstitutionLogo___block_invoke_2;
  v7[3] = &unk_1E59CDC58;
  id v8 = v3;
  char v11 = *(unsigned char *)(a1 + 48);
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v9 = v4;
  uint64_t v10 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __113__PKDashboardPaymentPassDataSource_BankConnect___showBankConnectMessage_forInstitution_shouldUseInstitutionLogo___block_invoke_2(uint64_t result)
{
  if (*(void *)(result + 32))
  {
    uint64_t v1 = result;
    id v2 = *(void **)(result + 40);
    if (*(unsigned char *)(result + 56))
    {
      objc_msgSend(*(id *)(result + 40), "setImage:");
    }
    else
    {
      id v3 = objc_msgSend(*(id *)(result + 48), "_mismatchedAccountImageWithInstitutionImage:");
      [v2 setImage:v3];
    }
    [*(id *)(v1 + 48) setBankConnectMessage:*(void *)(v1 + 40)];
    id v4 = *(void **)(v1 + 48);
    return [v4 reloadSecondaryMessages];
  }
  return result;
}

- (id)_createReconsentMessageWithInstitution:(id)a3 withPreviousConsentUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(PKDashboardPassMessage);
  [(PKDashboardPassMessage *)v8 setIdentifier:@"bankConnectReconsent"];
  [(PKDashboardPassMessage *)v8 setShowDisclosure:1];
  id v9 = PKLocalizedBankConnectString(&cfstr_BankConnectDas_12.isa);
  [(PKDashboardPassMessage *)v8 setTitle:v9];

  uint64_t v10 = PKLocalizedBankConnectString(&cfstr_BankConnectDas_13.isa);
  [(PKDashboardPassMessage *)v8 setMessage:v10];

  char v11 = PKLocalizedBankConnectString(&cfstr_BankConnectDas_14.isa);
  [(PKDashboardPassMessage *)v8 setButtonTitle:v11];

  objc_initWeak(&location, self);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  id v17[2] = __112__PKDashboardPaymentPassDataSource_BankConnect___createReconsentMessageWithInstitution_withPreviousConsentUUID___block_invoke;
  id v17[3] = &unk_1E59CB378;
  objc_copyWeak(&v20, &location);
  id v12 = v6;
  id v18 = v12;
  id v13 = v7;
  id v19 = v13;
  [(PKDashboardPassMessage *)v8 setActionOnButtonPress:v17];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  id v15[2] = __112__PKDashboardPaymentPassDataSource_BankConnect___createReconsentMessageWithInstitution_withPreviousConsentUUID___block_invoke_2;
  v15[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v16, &location);
  [(PKDashboardPassMessage *)v8 setActionOnDismiss:v15];
  objc_destroyWeak(&v16);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v8;
}

void __112__PKDashboardPaymentPassDataSource_BankConnect___createReconsentMessageWithInstitution_withPreviousConsentUUID___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _reconsentInstitution:*(void *)(a1 + 32) withPreviousConsentUUID:*(void *)(a1 + 40)];
}

void __112__PKDashboardPaymentPassDataSource_BankConnect___createReconsentMessageWithInstitution_withPreviousConsentUUID___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained bankConnectLinkedAccountData];
  id v4 = [v3 accountID];

  if (v4)
  {
    id v5 = objc_loadWeakRetained(v1);
    id v6 = [v5 bankConnectMessagesManager];
    [v6 setIsDismissed:1 forAccountMessage:1 withAccountIdentifier:v4];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __112__PKDashboardPaymentPassDataSource_BankConnect___createReconsentMessageWithInstitution_withPreviousConsentUUID___block_invoke_3;
  block[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v8, v1);
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v8);
}

void __112__PKDashboardPaymentPassDataSource_BankConnect___createReconsentMessageWithInstitution_withPreviousConsentUUID___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _hideBankConnectMessageAndReloadIfNeeded];
}

- (id)_createSetupMessageWithInstitution:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(PKDashboardPassMessage);
  [(PKDashboardPassMessage *)v5 setIdentifier:@"bankConnectSetUp"];
  [(PKDashboardPassMessage *)v5 setShowDisclosure:0];
  id v6 = PKLocalizedBankConnectString(&cfstr_BankConnectDas_15.isa);
  [(PKDashboardPassMessage *)v5 setTitle:v6];

  id v7 = [v4 name];
  id v8 = PKLocalizedBankConnectString(&cfstr_BankConnectDas_16.isa, &stru_1EF1B4C70.isa, v7);
  [(PKDashboardPassMessage *)v5 setMessage:v8];

  id v9 = PKLocalizedBankConnectString(&cfstr_BankConnectDas_17.isa);
  [(PKDashboardPassMessage *)v5 setButtonTitle:v9];

  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __84__PKDashboardPaymentPassDataSource_BankConnect___createSetupMessageWithInstitution___block_invoke;
  id v14[3] = &unk_1E59CB010;
  objc_copyWeak(&v16, &location);
  id v10 = v4;
  id v15 = v10;
  [(PKDashboardPassMessage *)v5 setActionOnButtonPress:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  id v12[2] = __84__PKDashboardPaymentPassDataSource_BankConnect___createSetupMessageWithInstitution___block_invoke_2;
  v12[3] = &unk_1E59CB010;
  objc_copyWeak(&v13, &location);
  void v12[4] = self;
  [(PKDashboardPassMessage *)v5 setActionOnDismiss:v12];
  objc_destroyWeak(&v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v5;
}

void __84__PKDashboardPaymentPassDataSource_BankConnect___createSetupMessageWithInstitution___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _authorizeInstitution:*(void *)(a1 + 32)];
}

void __84__PKDashboardPaymentPassDataSource_BankConnect___createSetupMessageWithInstitution___block_invoke_2(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained bankConnectMessagesManager];
  id v5 = [*(id *)(a1 + 32) pass];
  id v6 = [v5 fkPaymentPass];
  id v7 = [v6 primaryAccountIdentifier];
  [v4 setIsDismissed:1 forPassMessage:0 withFPANIdentifier:v7];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__PKDashboardPaymentPassDataSource_BankConnect___createSetupMessageWithInstitution___block_invoke_3;
  block[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v9, v2);
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v9);
}

void __84__PKDashboardPaymentPassDataSource_BankConnect___createSetupMessageWithInstitution___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _hideBankConnectMessageAndReloadIfNeeded];
}

- (id)_createBackgroundRefreshConfirmationMessageWithInstitution:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(PKDashboardPassMessage);
  [(PKDashboardPassMessage *)v5 setIdentifier:@"bankConnectBackgroundRefreshConfirmation"];
  [(PKDashboardPassMessage *)v5 setShowDisclosure:1];
  id v6 = PKLocalizedBankConnectString(&cfstr_BankConnectDas_18.isa);
  [(PKDashboardPassMessage *)v5 setTitle:v6];

  id v7 = [v4 name];
  id v8 = PKLocalizedBankConnectString(&cfstr_BankConnectDas_19.isa, &stru_1EF1B4C70.isa, v7);
  [(PKDashboardPassMessage *)v5 setMessage:v8];

  id v9 = PKLocalizedBankConnectString(&cfstr_BankConnectDas_20.isa);
  [(PKDashboardPassMessage *)v5 setButtonTitle:v9];

  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __108__PKDashboardPaymentPassDataSource_BankConnect___createBackgroundRefreshConfirmationMessageWithInstitution___block_invoke;
  v13[3] = &unk_1E59CA7A8;
  void v13[4] = self;
  objc_copyWeak(&v14, &location);
  [(PKDashboardPassMessage *)v5 setActionOnButtonPress:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  id v11[2] = __108__PKDashboardPaymentPassDataSource_BankConnect___createBackgroundRefreshConfirmationMessageWithInstitution___block_invoke_4;
  v11[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v12, &location);
  [(PKDashboardPassMessage *)v5 setActionOnDismiss:v11];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v5;
}

void __108__PKDashboardPaymentPassDataSource_BankConnect___createBackgroundRefreshConfirmationMessageWithInstitution___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) groupView];
  id v3 = objc_msgSend(v2, "pkui_viewControllerFromResponderChain");

  if (v3)
  {
    id v4 = [(objc_class *)getFKBankConnectBackgroundRefreshConfirmationViewControllerProviderClass_0() makeViewController];
    if (v4)
    {
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      id v5[2] = __108__PKDashboardPaymentPassDataSource_BankConnect___createBackgroundRefreshConfirmationMessageWithInstitution___block_invoke_2;
      v5[3] = &unk_1E59CA7F8;
      objc_copyWeak(&v6, (id *)(a1 + 40));
      [v3 presentViewController:v4 animated:1 completion:v5];
      objc_destroyWeak(&v6);
    }
  }
}

void __108__PKDashboardPaymentPassDataSource_BankConnect___createBackgroundRefreshConfirmationMessageWithInstitution___block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __108__PKDashboardPaymentPassDataSource_BankConnect___createBackgroundRefreshConfirmationMessageWithInstitution___block_invoke_3;
  block[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __108__PKDashboardPaymentPassDataSource_BankConnect___createBackgroundRefreshConfirmationMessageWithInstitution___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _hideBankConnectMessageAndReloadIfNeeded];
}

void __108__PKDashboardPaymentPassDataSource_BankConnect___createBackgroundRefreshConfirmationMessageWithInstitution___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained bankConnectMessagesManager];
  id v4 = objc_loadWeakRetained(v1);
  id v5 = [v4 bankConnectLinkedAccountData];
  id v6 = [v5 backgroundRefreshConfirmationToken];
  [v3 dismissBackgroundRefreshConfirmationMessageWithToken:v6];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __108__PKDashboardPaymentPassDataSource_BankConnect___createBackgroundRefreshConfirmationMessageWithInstitution___block_invoke_5;
  block[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v8, v1);
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v8);
}

void __108__PKDashboardPaymentPassDataSource_BankConnect___createBackgroundRefreshConfirmationMessageWithInstitution___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _hideBankConnectMessageAndReloadIfNeeded];
}

- (id)_createConnectedMessageWithInstitution:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(PKDashboardPassMessage);
  [(PKDashboardPassMessage *)v5 setIdentifier:@"bankConnectConnected"];
  [(PKDashboardPassMessage *)v5 setShowDisclosure:1];
  id v6 = [v4 name];
  id v7 = PKLocalizedBankConnectString(&cfstr_BankConnectDas_21.isa, &stru_1EF1B4C70.isa, v6);
  [(PKDashboardPassMessage *)v5 setTitle:v7];

  id v8 = PKLocalizedBankConnectString(&cfstr_BankConnectDas_22.isa);
  [(PKDashboardPassMessage *)v5 setMessage:v8];

  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  id v10[2] = __88__PKDashboardPaymentPassDataSource_BankConnect___createConnectedMessageWithInstitution___block_invoke;
  id v10[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v11, &location);
  [(PKDashboardPassMessage *)v5 setActionOnDismiss:v10];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v5;
}

void __88__PKDashboardPaymentPassDataSource_BankConnect___createConnectedMessageWithInstitution___block_invoke(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained bankConnectLinkedAccountData];
  id v4 = [v3 accountID];

  if (v4)
  {
    id v5 = objc_loadWeakRetained(v1);
    id v6 = [v5 bankConnectMessagesManager];
    [v6 setIsDismissed:1 forAccountMessage:2 withAccountIdentifier:v4];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__PKDashboardPaymentPassDataSource_BankConnect___createConnectedMessageWithInstitution___block_invoke_2;
  block[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v8, v1);
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v8);
}

void __88__PKDashboardPaymentPassDataSource_BankConnect___createConnectedMessageWithInstitution___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _hideBankConnectMessageAndReloadIfNeeded];
}

- (id)_createTermsAndConditionsUpdateMessageWithTermsAndConditions:(id)a3
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 identifier];
  if (v5)
  {
    id v6 = [v4 inEffectOn];
    id v7 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    id v8 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
    [v7 setCalendar:v8];

    [v7 setDateStyle:3];
    [v7 setTimeStyle:0];
    id v9 = objc_alloc_init(PKDashboardPassMessage);
    [(PKDashboardPassMessage *)v9 setIdentifier:@"bankConnectTermsAndConditionsUpdate"];
    id v10 = PKLocalizedBankConnectString(&cfstr_BankConnectDas_23.isa);
    [(PKDashboardPassMessage *)v9 setTitle:v10];

    id v11 = [v7 stringFromDate:v6];
    id v12 = PKLocalizedBankConnectString(&cfstr_BankConnectDas_24.isa, &stru_1EF1B4C70.isa, v11);
    [(PKDashboardPassMessage *)v9 setMessage:v12];

    id v13 = PKLocalizedBankConnectString(&cfstr_BankConnectDas_25.isa);
    [(PKDashboardPassMessage *)v9 setButtonTitle:v13];

    id v14 = (void *)MEMORY[0x1E4FB1818];
    id v15 = PKPassKitCoreBundle();
    id v16 = [v14 imageNamed:@"GenericIcon" inBundle:v15];
    [(PKDashboardPassMessage *)v9 setImage:v16];

    objc_initWeak(location, self);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    id v20[2] = __110__PKDashboardPaymentPassDataSource_BankConnect___createTermsAndConditionsUpdateMessageWithTermsAndConditions___block_invoke;
    v20[3] = &unk_1E59CC220;
    void v20[4] = self;
    id v21 = v5;
    objc_copyWeak(&v22, location);
    [(PKDashboardPassMessage *)v9 setActionOnButtonPress:v20];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __110__PKDashboardPaymentPassDataSource_BankConnect___createTermsAndConditionsUpdateMessageWithTermsAndConditions___block_invoke_4;
    v18[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v19, location);
    [(PKDashboardPassMessage *)v9 setActionOnDismiss:v18];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v22);

    objc_destroyWeak(location);
  }
  else
  {
    id v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v4;
      _os_log_error_impl(&dword_19F450000, v6, OS_LOG_TYPE_ERROR, "Failed to create a message for T&Cs %@", (uint8_t *)location, 0xCu);
    }
    id v9 = 0;
  }

  return v9;
}

void __110__PKDashboardPaymentPassDataSource_BankConnect___createTermsAndConditionsUpdateMessageWithTermsAndConditions___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) groupView];
  id v3 = objc_msgSend(v2, "pkui_viewControllerFromResponderChain");

  if (v3)
  {
    Class FKBankConnectTermsAndConditionsViewControllerProviderClass = getFKBankConnectTermsAndConditionsViewControllerProviderClass();
    uint64_t v5 = *(void *)(a1 + 40);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    id v7[2] = __110__PKDashboardPaymentPassDataSource_BankConnect___createTermsAndConditionsUpdateMessageWithTermsAndConditions___block_invoke_2;
    v7[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v8, (id *)(a1 + 48));
    id v6 = [(objc_class *)FKBankConnectTermsAndConditionsViewControllerProviderClass makeViewControllerWithTermsAndConditionsID:v5 completion:v7];
    if (v6) {
      [v3 presentViewController:v6 animated:1 completion:0];
    }

    objc_destroyWeak(&v8);
  }
}

void __110__PKDashboardPaymentPassDataSource_BankConnect___createTermsAndConditionsUpdateMessageWithTermsAndConditions___block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __110__PKDashboardPaymentPassDataSource_BankConnect___createTermsAndConditionsUpdateMessageWithTermsAndConditions___block_invoke_3;
  block[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __110__PKDashboardPaymentPassDataSource_BankConnect___createTermsAndConditionsUpdateMessageWithTermsAndConditions___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadBankConnectData];
}

void __110__PKDashboardPaymentPassDataSource_BankConnect___createTermsAndConditionsUpdateMessageWithTermsAndConditions___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained bankConnectLinkedAccountData];
  id v4 = [v3 accountID];

  if (v4)
  {
    id v5 = objc_loadWeakRetained(v1);
    id v6 = [v5 bankConnectMessagesManager];
    [v6 setIsDismissed:1 forAccountMessage:5 withAccountIdentifier:v4];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __110__PKDashboardPaymentPassDataSource_BankConnect___createTermsAndConditionsUpdateMessageWithTermsAndConditions___block_invoke_5;
  block[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v8, v1);
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v8);
}

void __110__PKDashboardPaymentPassDataSource_BankConnect___createTermsAndConditionsUpdateMessageWithTermsAndConditions___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _hideBankConnectMessageAndReloadIfNeeded];
}

- (id)_createMismatchedAccountMessageWithInstitution:(id)a3 withPreviousConsentUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(PKDashboardPassMessage);
  [(PKDashboardPassMessage *)v8 setIdentifier:@"bankConnectMismatchedAccount"];
  [(PKDashboardPassMessage *)v8 setShowDisclosure:1];
  id v9 = PKLocalizedBankConnectString(&cfstr_BankConnectDas_26.isa);
  [(PKDashboardPassMessage *)v8 setTitle:v9];

  id v10 = PKLocalizedBankConnectString(&cfstr_BankConnectDas_27.isa);
  [(PKDashboardPassMessage *)v8 setMessage:v10];

  id v11 = PKLocalizedBankConnectString(&cfstr_BankConnectDas_28.isa);
  [(PKDashboardPassMessage *)v8 setButtonTitle:v11];

  id v12 = [(PKDashboardPaymentPassDataSource *)self _mismatchedAccountImageWithInstitutionImage:0];
  [(PKDashboardPassMessage *)v8 setImage:v12];

  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __120__PKDashboardPaymentPassDataSource_BankConnect___createMismatchedAccountMessageWithInstitution_withPreviousConsentUUID___block_invoke;
  v18[3] = &unk_1E59CD9D8;
  void v18[4] = self;
  id v13 = v6;
  id v19 = v13;
  id v14 = v7;
  id v20 = v14;
  objc_copyWeak(&v21, &location);
  [(PKDashboardPassMessage *)v8 setActionOnButtonPress:v18];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __120__PKDashboardPaymentPassDataSource_BankConnect___createMismatchedAccountMessageWithInstitution_withPreviousConsentUUID___block_invoke_4;
  v16[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v17, &location);
  [(PKDashboardPassMessage *)v8 setActionOnDismiss:v16];
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v21);

  objc_destroyWeak(&location);

  return v8;
}

void __120__PKDashboardPaymentPassDataSource_BankConnect___createMismatchedAccountMessageWithInstitution_withPreviousConsentUUID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) groupView];
  id v3 = objc_msgSend(v2, "pkui_viewControllerFromResponderChain");

  if (v3)
  {
    id v4 = +[PKDismissalPreventionAssertionManager sharedInstance];
    id v5 = [v4 acquireAssertion];

    Class FKBankConnectReviewAccountConnectionFlowViewControllerProviderClass = getFKBankConnectReviewAccountConnectionFlowViewControllerProviderClass();
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = [*(id *)(a1 + 32) pass];
    uint64_t v9 = *(void *)(a1 + 48);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __120__PKDashboardPaymentPassDataSource_BankConnect___createMismatchedAccountMessageWithInstitution_withPreviousConsentUUID___block_invoke_2;
    v13[3] = &unk_1E59CCC78;
    objc_copyWeak(&v16, (id *)(a1 + 56));
    id v10 = v3;
    id v14 = v10;
    id v11 = v5;
    id v15 = v11;
    id v12 = [(objc_class *)FKBankConnectReviewAccountConnectionFlowViewControllerProviderClass makeViewControllerWithInstitution:v7 paymentPass:v8 previousConsentUUID:v9 completion:v13];

    [v10 presentViewController:v12 animated:1 completion:0];
    objc_destroyWeak(&v16);
  }
}

uint64_t __120__PKDashboardPaymentPassDataSource_BankConnect___createMismatchedAccountMessageWithInstitution_withPreviousConsentUUID___block_invoke_2(id *a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 6);
    id v4 = [WeakRetained bankConnectLinkedAccountData];
    id v5 = [v4 accountID];

    if (v5)
    {
      id v6 = objc_loadWeakRetained(a1 + 6);
      uint64_t v7 = [v6 bankConnectMessagesManager];
      [v7 setIsDismissed:1 forAccountMessage:3 withAccountIdentifier:v5];
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __120__PKDashboardPaymentPassDataSource_BankConnect___createMismatchedAccountMessageWithInstitution_withPreviousConsentUUID___block_invoke_3;
    block[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v10, a1 + 6);
    dispatch_async(MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v10);
  }
  [a1[4] dismissViewControllerAnimated:1 completion:0];
  return [a1[5] invalidate];
}

void __120__PKDashboardPaymentPassDataSource_BankConnect___createMismatchedAccountMessageWithInstitution_withPreviousConsentUUID___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _hideBankConnectMessageAndReloadIfNeeded];
}

void __120__PKDashboardPaymentPassDataSource_BankConnect___createMismatchedAccountMessageWithInstitution_withPreviousConsentUUID___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained bankConnectLinkedAccountData];
  id v4 = [v3 accountID];

  if (v4)
  {
    id v5 = objc_loadWeakRetained(v1);
    id v6 = [v5 bankConnectMessagesManager];
    [v6 setIsDismissed:1 forAccountMessage:3 withAccountIdentifier:v4];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __120__PKDashboardPaymentPassDataSource_BankConnect___createMismatchedAccountMessageWithInstitution_withPreviousConsentUUID___block_invoke_5;
  block[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v8, v1);
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v8);
}

void __120__PKDashboardPaymentPassDataSource_BankConnect___createMismatchedAccountMessageWithInstitution_withPreviousConsentUUID___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _hideBankConnectMessageAndReloadIfNeeded];
}

- (id)_mismatchedAccountImageWithInstitutionImage:(id)a3
{
  void v14[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4FB1830];
  id v5 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  v14[0] = v5;
  id v6 = [MEMORY[0x1E4FB1618] labelColor];
  v14[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  id v8 = [v4 configurationWithPaletteColors:v7];

  uint64_t v9 = [MEMORY[0x1E4FB1818] systemImageNamed:@"exclamationmark.circle.fill" withConfiguration:v8];
  if (!v3)
  {
    PKUIImageNamed(@"BankAccountAppInverted");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  [v9 scale];
  CGFloat v11 = v10;
  v16.width = 50.0;
  v16.height = 50.0;
  UIGraphicsBeginImageContextWithOptions(v16, 0, v11);
  objc_msgSend(v3, "drawInRect:", 0.0, 0.0, 40.0, 40.0);
  objc_msgSend(v9, "drawInRect:", 30.0, 30.0, 20.0, 20.0);
  id v12 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v12;
}

- (void)_startRefetchingData
{
  id v2 = [(PKDashboardPaymentPassDataSource *)self bankConnectLinkedAccountData];
  id v3 = [v2 account];
  id v13 = [v3 fullyQualifiedAccountIdentifier];

  id v4 = [NSString alloc];
  id v5 = (void *)[v4 initWithFormat:@"prefs:root=PASSBOOK&path=%@", *MEMORY[0x1E4F87F40]];
  if (v13)
  {
    id v6 = [NSString alloc];
    uint64_t v7 = [v13 institutionID];
    id v8 = [v13 accountID];
    uint64_t v9 = (void *)[v6 initWithFormat:@"/%@/%@", v7, v8];

    uint64_t v10 = [v5 stringByAppendingString:v9];

    id v5 = (void *)v10;
  }
  CGFloat v11 = [MEMORY[0x1E4F1CB10] URLWithString:v5];
  id v12 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v12 openSensitiveURL:v11 withOptions:0];
}

- (void)_authorizeInstitution:(id)a3
{
  v31[6] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PKDashboardPaymentPassDataSource *)self groupView];
  id v6 = objc_msgSend(v5, "pkui_viewControllerFromResponderChain");

  [(PKDashboardPaymentPassDataSource *)self _beginReportingIfNecessary];
  uint64_t v7 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v8 = *MEMORY[0x1E4F86380];
  uint64_t v9 = *MEMORY[0x1E4F86730];
  v30[0] = *MEMORY[0x1E4F86308];
  v30[1] = v9;
  uint64_t v10 = *MEMORY[0x1E4F86760];
  v31[0] = v8;
  v31[1] = v10;
  uint64_t v11 = *MEMORY[0x1E4F86120];
  v31[2] = *MEMORY[0x1E4F865D0];
  uint64_t v12 = *MEMORY[0x1E4F867D0];
  v30[2] = v11;
  v30[3] = v12;
  id v13 = [(PKDashboardPaymentPassDataSource *)self getPassProductType];
  v31[3] = v13;
  void v30[4] = *MEMORY[0x1E4F865A0];
  id v14 = [v4 name];
  void v31[4] = v14;
  void v30[5] = *MEMORY[0x1E4F867B8];
  id v15 = [(PKDashboardPaymentPassDataSource *)self pass];
  CGSize v16 = [v15 issuerCountryCode];
  void v31[5] = v16;
  id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:6];
  [v7 subject:*MEMORY[0x1E4F87038] sendEvent:v17];

  if (v6)
  {
    objc_initWeak(&location, self);
    id v18 = +[PKDismissalPreventionAssertionManager sharedInstance];
    id v19 = [v18 acquireAssertion];

    Class FKBankConnectAuthorizationViewControllerProviderClass_0 = getFKBankConnectAuthorizationViewControllerProviderClass_0();
    id v21 = [(PKDashboardPaymentPassDataSource *)self pass];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    void v25[2] = __71__PKDashboardPaymentPassDataSource_BankConnect___authorizeInstitution___block_invoke;
    v25[3] = &unk_1E59CCC78;
    objc_copyWeak(&v28, &location);
    id v22 = v6;
    id v26 = v22;
    id v23 = v19;
    id v27 = v23;
    uint64_t v24 = [(objc_class *)FKBankConnectAuthorizationViewControllerProviderClass_0 makeAuthorizationViewControllerWithPaymentPass:v21 institution:v4 completion:v25];

    [v22 presentViewController:v24 animated:1 completion:0];
    objc_destroyWeak(&v28);

    objc_destroyWeak(&location);
  }
}

uint64_t __71__PKDashboardPaymentPassDataSource_BankConnect___authorizeInstitution___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained reloadBankConnectData];
  }
  [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
  id v4 = *(void **)(a1 + 40);

  return [v4 invalidate];
}

- (void)_reconsentInstitution:(id)a3 withPreviousConsentUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PKDashboardPaymentPassDataSource *)self groupView];
  uint64_t v9 = objc_msgSend(v8, "pkui_viewControllerFromResponderChain");

  if (v9)
  {
    objc_initWeak(&location, self);
    uint64_t v10 = +[PKDismissalPreventionAssertionManager sharedInstance];
    uint64_t v11 = [v10 acquireAssertion];

    Class FKBankConnectAuthorizationViewControllerProviderClass_0 = getFKBankConnectAuthorizationViewControllerProviderClass_0();
    id v13 = [(PKDashboardPaymentPassDataSource *)self pass];
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    id v19 = __95__PKDashboardPaymentPassDataSource_BankConnect___reconsentInstitution_withPreviousConsentUUID___block_invoke;
    id v20 = &unk_1E59CCC78;
    objc_copyWeak(&v23, &location);
    id v14 = v9;
    id v21 = v14;
    id v15 = v11;
    id v22 = v15;
    CGSize v16 = [(objc_class *)FKBankConnectAuthorizationViewControllerProviderClass_0 makeReconsentAuthorizationViewControllerWithPaymentPass:v13 institution:v6 previousConsentUUID:v7 completion:&v17];

    objc_msgSend(v14, "presentViewController:animated:completion:", v16, 1, 0, v17, v18, v19, v20);
    objc_destroyWeak(&v23);

    objc_destroyWeak(&location);
  }
}

uint64_t __95__PKDashboardPaymentPassDataSource_BankConnect___reconsentInstitution_withPreviousConsentUUID___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained reloadBankConnectData];
  }
  [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
  id v4 = *(void **)(a1 + 40);

  return [v4 invalidate];
}

- (void)didUpdateLatestTransactions:(id)a3 monthlyTransactionGroups:(id)a4 yearlyTransactionGroups:(id)a5
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(PKDashboardPaymentPassDataSource *)self isBankConnectLinked])
  {
    id v45 = v10;
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
    __int16 v42 = self;
    uint64_t v12 = [(PKDashboardPaymentPassDataSource *)self bankConnectLinkedAccountData];
    id v13 = [v12 institution];

    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v44 = v8;
    id v14 = v8;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v57 objects:v63 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v58;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v58 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = (void *)[objc_alloc(MEMORY[0x1E4F84CF8]) initFromFKTransaction:*(void *)(*((void *)&v57 + 1) + 8 * i) institution:v13];
          [v11 addObject:v19];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v57 objects:v63 count:16];
      }
      while (v16);
    }

    id v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v21 = v9;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v53 objects:v62 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v54;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v54 != v24) {
            objc_enumerationMutation(v21);
          }
          id v26 = (void *)[objc_alloc(MEMORY[0x1E4F84D10]) initFromFKTransactionGroup:*(void *)(*((void *)&v53 + 1) + 8 * j)];
          [v20 addObject:v26];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v53 objects:v62 count:16];
      }
      while (v23);
    }
    id v43 = v9;

    id v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v10, "count"));
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v28 = v10;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v49 objects:v61 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v50;
      do
      {
        for (uint64_t k = 0; k != v30; ++k)
        {
          if (*(void *)v50 != v31) {
            objc_enumerationMutation(v28);
          }
          char v33 = (void *)[objc_alloc(MEMORY[0x1E4F84D10]) initFromFKTransactionGroup:*(void *)(*((void *)&v49 + 1) + 8 * k)];
          [v27 addObject:v33];
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v49 objects:v61 count:16];
      }
      while (v30);
    }

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __126__PKDashboardPaymentPassDataSource_BankConnect__didUpdateLatestTransactions_monthlyTransactionGroups_yearlyTransactionGroups___block_invoke;
    aBlock[3] = &unk_1E59D36D8;
    void aBlock[4] = v42;
    id v47 = v20;
    id v48 = v27;
    id v34 = v27;
    id v35 = v20;
    id v36 = _Block_copy(aBlock);
    uint64_t v37 = (void *)MEMORY[0x1E4F84CF8];
    uint64_t v38 = [(PKDashboardPaymentPassDataSource *)v42 transactionSourceCollection];
    uint64_t v39 = [v38 transactionSourceIdentifiers];
    __int16 v40 = [(PKDashboardPaymentPassDataSource *)v42 pass];
    char v41 = [v40 uniqueID];
    [v37 augmentTransactionsIfNeeded:v11 transactionSourceIdentifiers:v39 passUniqueID:v41 usingDataProvider:0 completion:v36];

    id v9 = v43;
    id v8 = v44;
    id v10 = v45;
  }
}

uint64_t __126__PKDashboardPaymentPassDataSource_BankConnect__didUpdateLatestTransactions_monthlyTransactionGroups_yearlyTransactionGroups___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  [v3 setBankConnectMonthlyTransactionGroups:v4];
  [*(id *)(a1 + 32) setBankConnectYearlyTransactionGroups:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) updateWithTransactions:v5];

  id v6 = *(void **)(a1 + 32);

  return [v6 reloadTransactionGroups];
}

- (void)bankConnectAccountDidChange:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PKDashboardPaymentPassDataSource *)self bankConnectLinkedAccountData];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 account];
    char v8 = [v7 isEqual:v4];

    if ((v8 & 1) == 0)
    {
      id v9 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = [v6 account];
        int v13 = 138412546;
        id v14 = v10;
        __int16 v15 = 2112;
        id v16 = v4;
        _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "Handling Bank Connect account update from %@ to %@", (uint8_t *)&v13, 0x16u);
      }
      uint64_t v11 = [v6 consentStatus];
      uint64_t v12 = [v6 institution];
      [(PKDashboardPaymentPassDataSource *)self updateWithBankConnectAccount:v4 consentStatus:v11 institution:v12];
    }
  }
  else
  {
    [(PKDashboardPaymentPassDataSource *)self reloadBankConnectData];
  }
}

- (void)bankConnectConsentStatusDidChange:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = [(PKDashboardPaymentPassDataSource *)self bankConnectLinkedAccountData];
  id v6 = v5;
  if (v5 && [v5 consentStatus] != a3)
  {
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134218240;
      uint64_t v11 = [v6 consentStatus];
      __int16 v12 = 2048;
      unint64_t v13 = a3;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Handling Bank Connect consent status update from %ld to %ld", (uint8_t *)&v10, 0x16u);
    }

    char v8 = [v6 account];
    id v9 = [v6 institution];
    [(PKDashboardPaymentPassDataSource *)self updateWithBankConnectAccount:v8 consentStatus:a3 institution:v9];
  }
}

- (void)_beginReportingIfNecessary
{
  uint64_t v2 = *MEMORY[0x1E4F87038];
  id v3 = [MEMORY[0x1E4F843E0] reporterForSubject:*MEMORY[0x1E4F87038]];

  if (!v3)
  {
    _didBeginPassManagementSubject = 1;
    id v4 = (void *)MEMORY[0x1E4F843E0];
    [v4 beginSubjectReporting:v2];
  }
}

@end