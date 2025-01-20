@interface PKPassbookSettingsController
- (BOOL)_deviceRegionSupportsApplePayLater;
- (BOOL)_isPeerPaymentRegistered;
- (BOOL)_supportsApplePay;
- (BOOL)canPresentLaunchPrompts;
- (BOOL)canShareCompanionPass:(id)a3;
- (PKPassbookSettingsController)initWithDelegate:(id)a3 dataSource:(id)a4 context:(int64_t)a5;
- (PKPassbookSettingsDelegate)delegate;
- (id)_accountSpecifierForAccount:(id)a3;
- (id)_bankConnectGroupSpecifiers;
- (id)_bridgeSpecifiers;
- (id)_cardBenefitSpecifiers;
- (id)_closedAccountsGroupSpecifiers;
- (id)_companionPassSpecifiers;
- (id)_credentialCenterSpecifiers;
- (id)_currentDefaultPaymentPass;
- (id)_defaultAppSpecifiers;
- (id)_defaultContactEmailSpecifier;
- (id)_defaultContactPhoneSpecifier;
- (id)_defaultExpressTransitPassDescription;
- (id)_defaultExpressTransitSpecifier;
- (id)_defaultPaymentSpecifier;
- (id)_defaultShippingAddressSpecifier;
- (id)_defaultsGroupSpecifiers;
- (id)_doubleClickSwitchSettingForSpecifier:(id)a3;
- (id)_expiredPassesSwitchGroupSpecifiers;
- (id)_expiredPassesSwitchSettingForSpecifier:(id)a3;
- (id)_fallbackExpressTransitFooterText;
- (id)_getDefaultContactEmail;
- (id)_getDefaultContactPhone;
- (id)_getDefaultPaymentCard;
- (id)_getDefaultShippingAddress;
- (id)_handoffSwitchGroupSpecifiers;
- (id)_handoffSwitchSettingForSpecifier:(id)a3;
- (id)_invitationFromCredential:(id)a3;
- (id)_lockscreenSwitchGroupSpecifiers;
- (id)_matchingInvitationForPass:(id)a3 withInvitations:(id)a4;
- (id)_onlinePaymentsGroupSpecifiers;
- (id)_onlinePaymentsSettingForSpecifier:(id)a3;
- (id)_openAccountsGroupSpecifiers;
- (id)_orderManagementGroupSpecifiers;
- (id)_orderManagementNotificationsSettingForSpecifier:(id)a3;
- (id)_orderManagementSettingForSpecifier:(id)a3;
- (id)_otherPassSpecifiers;
- (id)_passSpecifiersForPasses:(id)a3;
- (id)_passSpecifiersForPasses:(id)a3 peerPaymentPassUniqueID:(id)a4 showPeerPaymentSetup:(BOOL)a5;
- (id)_paymentPassSpecifiers;
- (id)_peerPaymentGroupSpecifiers;
- (id)_peerPaymentSwitchSpecifier;
- (id)_peerPaymentTinkerGroupSpecifiers;
- (id)_pendingCompanionPassSpecifiers;
- (id)_pendingInvitationsGroupSpecifiers;
- (id)_restrictedModeSpecifier;
- (id)_settingsSpecifiers;
- (id)_showCardBenefitPayLaterSettingForSpecifier:(id)a3;
- (id)_showCardBenefitRewardsSettingForSpecifier:(id)a3;
- (id)_showPayLaterOptionsSettingForSpecifier:(id)a3;
- (id)_showPayLaterOptionsSpecifiers;
- (id)_specifierForPassUniqueID:(id)a3;
- (id)_subtitleTextForActiveAccount:(id)a3;
- (id)_systemPolicyForAppSpecifiers;
- (id)_transitDefaultsGroupSpecifiers;
- (id)_uppercaseGroupSpecifierTitleIfNecessary:(id)a3;
- (id)passWithUniqueIdentifier:(id)a3;
- (id)rendererStateForPaymentPass:(id)a3;
- (id)specifiers;
- (id)watchPassReaderIdentifiers;
- (int64_t)_paymentPreferencesStyle;
- (int64_t)_paymentSetupContextForSettingsContext:(int64_t)a3;
- (void)_checkPairedDeviceSupportOfHiddenPassesAndRefreshUIIfNecessary;
- (void)_credentialPairingContextForPass:(id)a3 withCompletion:(id)a4;
- (void)_fetchAccounts;
- (void)_fetchBalancesAndTransitPassPropertiesForPass:(id)a3 withDataProvider:(id)a4 completion:(id)a5;
- (void)_fetchInstitutions;
- (void)_handleDefaultPaymentPassChangedTo:(id)a3 withSender:(id)a4 optionsController:(id)a5 canPrompt:(BOOL)a6;
- (void)_handleProvisioningError:(id)a3 viewController:(id)a4;
- (void)_openExpressTransitSettings:(id)a3;
- (void)_openPrivacyLink;
- (void)_peerPaymentAccountDidChangeNotification:(id)a3;
- (void)_peerPaymentWebServiceDidChangeNotification:(id)a3;
- (void)_performPhoneToWatchProvisioningForPaymentPass:(id)a3 withCompletion:(id)a4;
- (void)_presentCredentialCenter:(id)a3;
- (void)_presentCredentialSetupViewControllerForPaymentPass:(id)a3 withCompletion:(id)a4;
- (void)_presentFeatureNotEnabledForDemoForSpecifier:(id)a3;
- (void)_presentInboxMessage:(id)a3;
- (void)_presentLegacyCredentialSetupViewControllerForPaymentPass:(id)a3 withCompletion:(id)a4;
- (void)_presentPaymentSetupViewController:(id)a3 paymentPass:(id)a4;
- (void)_presentPeerPaymentReOpenCardFlowForSpecifier:(id)a3;
- (void)_presentPeerPaymentSetupFlowForSpecifier:(id)a3;
- (void)_presentPeerPaymentSetupFlowForSpecifier:(id)a3 completion:(id)a4;
- (void)_presentPeerPaymentSetupFlowWithAmount:(id)a3 flowState:(unint64_t)a4 senderAddress:(id)a5 completion:(id)a6;
- (void)_processAccountChanged:(id)a3;
- (void)_refreshAccountSpecifiers;
- (void)_refreshCIDVUIConfigurations;
- (void)_refreshCompanionGroupSpecififiers;
- (void)_refreshPasses;
- (void)_regionConfigurationDidChangeNotification;
- (void)_registerForPeerPaymentWithSpecifier:(id)a3;
- (void)_reloadBalancesAndTransitPassPropertiesForPass:(id)a3 withDataProvider:(id)a4;
- (void)_reloadPassData;
- (void)_reloadPendingInvitationSpecifiers;
- (void)_requestDelegatePresentViewController:(id)a3;
- (void)_requestDelegatePresentViewController:(id)a3 completion:(id)a4;
- (void)_setCardAddProvisioningButtonEnabled:(BOOL)a3 forPaymentPass:(id)a4;
- (void)_setDoubleClickSwitchSetting:(id)a3 forSpecifier:(id)a4;
- (void)_setExpiredPassesSwitchSetting:(id)a3 forSpecifier:(id)a4;
- (void)_setHandoffSwitchSetting:(id)a3 forSpecifier:(id)a4;
- (void)_setOnlinePaymentsSetting:(id)a3 forSpecifier:(id)a4;
- (void)_setOrderManagementNotificationsSetting:(id)a3 forSpecifier:(id)a4;
- (void)_setOrderManagementSetting:(id)a3 forSpecifier:(id)a4;
- (void)_setShowCardBenefitPayLaterSwitchSetting:(id)a3 forSpecifier:(id)a4;
- (void)_setShowCardBenefitRewardsSwitchSetting:(id)a3 forSpecifier:(id)a4;
- (void)_setShowPayLaterOptionsSwitchSetting:(id)a3 forSpecifier:(id)a4;
- (void)_showAccountInfoForSavingsAccountSpecifier:(id)a3;
- (void)_showBankConnectInstitutionDetails:(id)a3;
- (void)_showCardDetails:(id)a3;
- (void)_showDefaultContactEmailOptions:(id)a3;
- (void)_showDefaultContactPhoneOptions:(id)a3;
- (void)_showDefaultPaymentOptions:(id)a3;
- (void)_showDefaultShippingAddressOptions:(id)a3;
- (void)_showDocumentsForAccounts:(id)a3 title:(id)a4 sender:(id)a5;
- (void)_transitPropertiesForPaymentPass:(id)a3 withCompletion:(id)a4;
- (void)_unregisterForPeerPaymentWithSpecifier:(id)a3;
- (void)_updateAccountIfNecessary:(id)a3;
- (void)_updateAddButtonSpecifier;
- (void)_updateBalancesWithServerBalances:(id)a3 transitPassProperties:(id)a4 forPassWithUniqueIdentifier:(id)a5;
- (void)_updateCardSpecifier:(id)a3 withAccountStateForPaymentPass:(id)a4;
- (void)_updateCardsGroupSpecifier;
- (void)_updateCompanionGroupSpecifier;
- (void)_updateCompanionPassesAddButton;
- (void)_updateDefaultCardsPreferences;
- (void)_updatePendingCompanionGroupSpecifier;
- (void)_updateTransitExpressPassIdentifiersWithReload:(BOOL)a3;
- (void)accountRemoved:(id)a3;
- (void)addButtonPressedForPaymentPass:(id)a3;
- (void)addCardTapped;
- (void)addCardTappedForPaymentPassWithSpecifier:(id)a3;
- (void)addCardTappedForPaymentPassWithUniqueID:(id)a3;
- (void)addCardTappedForPaymentPassWithUniqueID:(id)a3 withCompletion:(id)a4;
- (void)applicationDidBecomeActive;
- (void)connectedInstitutionsDidChange:(id)a3;
- (void)dealloc;
- (void)didUpdateDefaultPaymentPassWithUniqueIdentifier:(id)a3;
- (void)inboxDataSourceDidUpdateInboxMessages:(id)a3;
- (void)openExpressTransitSettings:(id)a3 withPassUniqueIdentifier:(id)a4;
- (void)openPaymentSetupWithMode:(int64_t)a3 referrerIdentifier:(id)a4 allowedFeatureIdentifiers:(id)a5;
- (void)openPeerPaymentSetupWithCurrencyAmount:(id)a3 state:(unint64_t)a4 senderAddress:(id)a5;
- (void)openTransactionDefaultsEmailSettings;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitPassProperties:(id)a4;
- (void)paymentSetupDidFinish:(id)a3;
- (void)peerPaymentAccountResolutionController:(id)a3 requestsDismissCurrentViewControllerAnimated:(BOOL)a4;
- (void)peerPaymentAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5;
- (void)proofingFlowManager:(id)a3 completedProofingWithError:(id)a4;
- (void)proofingFlowManager:(id)a3 didChangeActiveConfigurations:(id)a4;
- (void)refreshDefaultCard;
- (void)refreshExpressTransitCard;
- (void)refreshPasses;
- (void)refreshPeerPaymentStatus;
- (void)reloadSpecifiers;
- (void)setDelegate:(id)a3;
- (void)setupPeerPaymentTinkerButtonTapped;
- (void)showBankConnectAuthorizationFlowWithRedirectURL:(id)a3 completion:(id)a4 animated:(BOOL)a5;
- (void)showBankConnectManagementForInstitution:(id)a3 accountIdentifier:(id)a4 sender:(id)a5 completion:(id)a6;
- (void)showController:(id)a3 animate:(BOOL)a4;
- (void)showDocumentsForClosedSavingsAccounts:(id)a3;
- (void)showSavingsAccount:(id)a3 destination:(unint64_t)a4 transaction:(id)a5 fundingSource:(id)a6 animated:(BOOL)a7;
- (void)startPreflightWithMode:(int64_t)a3 referrerIdentifier:(id)a4 allowedFeatureIdentifiers:(id)a5;
- (void)subcredentialProvisioningFlowController:(id)a3 didFinishWithPass:(id)a4 error:(id)a5;
- (void)switchSpinnerCell:(id)a3 hasToggledSwitch:(BOOL)a4;
- (void)userCanceledPairingWithSubcredentialProvisioningFlowController:(id)a3;
- (void)viewDidAppear;
- (void)willHandleURL;
@end

@implementation PKPassbookSettingsController

- (PKPassbookSettingsController)initWithDelegate:(id)a3 dataSource:(id)a4 context:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v93.receiver = self;
  v93.super_class = (Class)PKPassbookSettingsController;
  v10 = [(PKPassbookSettingsController *)&v93 init];
  if (!v10) {
    goto LABEL_22;
  }
  objc_initWeak(&location, v10);
  objc_storeWeak((id *)&v10->_delegate, v8);
  objc_storeStrong((id *)&v10->_dataSource, a4);
  v11 = [(PKPassbookSettingsDataSource *)v10->_dataSource setupDelegate];
  if (v11) {
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11 = v10->_dataSource;
    [(PKPassbookSettingsDataSource *)v11 setSetupDelegate:v10];
LABEL_5:
  }
  v10->_context = a5;
  v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  latestTransitBalanceModel = v10->_latestTransitBalanceModel;
  v10->_latestTransitBalanceModel = v12;

  v14 = [(PKPassbookSettingsDataSource *)v10->_dataSource passLibraryDataProvider];
  objc_storeWeak((id *)&v10->_passLibraryDataProvider, v14);

  v15 = [(PKPassbookSettingsDataSource *)v10->_dataSource paymentDataProvider];
  objc_storeWeak((id *)&v10->_paymentDataProvider, v15);

  id WeakRetained = objc_loadWeakRetained((id *)&v10->_paymentDataProvider);
  char v17 = objc_opt_respondsToSelector();

  if (v17)
  {
    id v18 = objc_loadWeakRetained((id *)&v10->_paymentDataProvider);
    uint64_t v19 = [v18 paymentWebService];
    webService = v10->_webService;
    v10->_webService = (PKPaymentWebService *)v19;
  }
  id v21 = objc_loadWeakRetained((id *)&v10->_paymentDataProvider);
  char v22 = objc_opt_respondsToSelector();

  if (v22)
  {
    id v23 = objc_loadWeakRetained((id *)&v10->_paymentDataProvider);
    [v23 addDelegate:v10];
  }
  id v24 = objc_alloc(MEMORY[0x1E4F846D8]);
  id v25 = objc_loadWeakRetained((id *)&v10->_paymentDataProvider);
  id v26 = objc_loadWeakRetained((id *)&v10->_passLibraryDataProvider);
  uint64_t v27 = [v24 initWithPaymentDataProvider:v25 passLibraryDataProvider:v26 isForWatch:v10->_context == 1];
  expressPassController = v10->_expressPassController;
  v10->_expressPassController = (PKExpressPassController *)v27;

  v29 = [PKContactAvatarManager alloc];
  v30 = [MEMORY[0x1E4F845E8] defaultContactResolver];
  id v31 = objc_loadWeakRetained((id *)&v10->_paymentDataProvider);
  uint64_t v32 = [(PKContactAvatarManager *)v29 initWithContactResolver:v30 paymentDataProvider:v31];
  avatarManager = v10->_avatarManager;
  v10->_avatarManager = (PKContactAvatarManager *)v32;

  [(PKPassbookSettingsController *)v10 _reloadPassData];
  if (v10->_context == 1) {
    uint64_t v34 = 4;
  }
  else {
    uint64_t v34 = 3;
  }
  v35 = [PKLaunchAuthorizationPromptController alloc];
  id v36 = objc_loadWeakRetained((id *)&v10->_passLibraryDataProvider);
  uint64_t v37 = [(PKLaunchAuthorizationPromptController *)v35 initWithContext:v34 dataProvider:v36 delegate:v10];
  launchAuthorizationPromptController = v10->_launchAuthorizationPromptController;
  v10->_launchAuthorizationPromptController = (PKLaunchAuthorizationPromptController *)v37;

  uint64_t v39 = [(PKPassbookSettingsDataSource *)v10->_dataSource peerPaymentDelegate];
  peerPaymentDelegate = v10->_peerPaymentDelegate;
  v10->_peerPaymentDelegate = (PKPassbookPeerPaymentSettingsDelegate *)v39;

  v41 = [(PKPassbookSettingsDataSource *)v10->_dataSource peerPaymentDataSource];
  uint64_t v42 = [v41 peerPaymentWebService];
  peerPaymentWebService = v10->_peerPaymentWebService;
  v10->_peerPaymentWebService = (PKPeerPaymentWebService *)v42;

  v44 = [(PKPeerPaymentWebService *)v10->_peerPaymentWebService targetDevice];
  uint64_t v45 = [v44 account];
  peerPaymentAccount = v10->_peerPaymentAccount;
  v10->_peerPaymentAccount = (PKPeerPaymentAccount *)v45;

  v47 = [PKPeerPaymentAccountResolutionController alloc];
  v48 = v10->_peerPaymentAccount;
  v49 = v10->_peerPaymentWebService;
  id v50 = objc_loadWeakRetained((id *)&v10->_passLibraryDataProvider);
  uint64_t v51 = [(PKPeerPaymentAccountResolutionController *)v47 initWithAccount:v48 webService:v49 context:v34 delegate:v10 passLibraryDataProvider:v50];
  peerPaymentAccountResolutionController = v10->_peerPaymentAccountResolutionController;
  v10->_peerPaymentAccountResolutionController = (PKPeerPaymentAccountResolutionController *)v51;

  v53 = v10->_peerPaymentAccountResolutionController;
  v54 = [(PKPassbookSettingsDataSource *)v10->_dataSource setupDelegate];
  [(PKPeerPaymentAccountResolutionController *)v53 setSetupDelegate:v54];

  v55 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v56 = [(PKPeerPaymentWebService *)v10->_peerPaymentWebService targetDevice];
  [v55 addObserver:v10 selector:sel__peerPaymentAccountDidChangeNotification_ name:*MEMORY[0x1E4F87CC8] object:v56];

  v57 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v57 addObserver:v10 selector:sel__peerPaymentWebServiceDidChangeNotification_ name:*MEMORY[0x1E4F87E98] object:v10->_peerPaymentWebService];

  uint64_t v58 = [MEMORY[0x1E4F84270] sharedInstance];
  accountService = v10->_accountService;
  v10->_accountService = (PKAccountService *)v58;

  [(PKAccountService *)v10->_accountService registerObserver:v10];
  [(PKPassbookSettingsController *)v10 _fetchAccounts];
  v60 = [[PKInboxDataSource alloc] initWithDelegate:v10];
  inboxDataSource = v10->_inboxDataSource;
  v10->_inboxDataSource = v60;

  if (!a5)
  {
    v62 = (FKBankConnectInstitutionsProvider *)objc_alloc_init(MEMORY[0x1E4F26BD0]);
    institutionsDataProvider = v10->_institutionsDataProvider;
    v10->_institutionsDataProvider = v62;

    [(FKBankConnectInstitutionsProvider *)v10->_institutionsDataProvider setDelegate:v10];
    [(PKPassbookSettingsController *)v10 _fetchInstitutions];
    v64 = (void *)MEMORY[0x1E4F97A20];
    uint64_t v65 = *MEMORY[0x1E4F87D30];
    v90[0] = MEMORY[0x1E4F143A8];
    v90[1] = 3221225472;
    v90[2] = __68__PKPassbookSettingsController_initWithDelegate_dataSource_context___block_invoke;
    v90[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v91, &location);
    uint64_t v66 = [v64 contextWithBundleId:v65 onChange:v90];
    defaultWalletContext = v10->_defaultWalletContext;
    v10->_defaultWalletContext = (SESNFCAppSettingsContext *)v66;

    objc_destroyWeak(&v91);
  }
  [(PKPassbookSettingsController *)v10 _updateCardsGroupSpecifier];
  [(PKPassbookSettingsController *)v10 _updateCompanionGroupSpecifier];
  [(PKPassbookSettingsController *)v10 _updatePendingCompanionGroupSpecifier];
  [(PKPassbookSettingsController *)v10 _updateAddButtonSpecifier];
  v68 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v68 addObserver:v10 selector:sel_applicationDidBecomeActive name:*MEMORY[0x1E4FB2628] object:0];
  [v68 addObserver:v10 selector:sel__regionConfigurationDidChangeNotification name:*MEMORY[0x1E4F87E90] object:0];
  [v68 addObserver:v10 selector:sel__expressPassDidChange name:@"PKExpressPassesViewControllerExpressPassChangedNotification" object:0];
  v10->_notifyToken = -1;
  v69 = (const char *)[(id)*MEMORY[0x1E4F87160] UTF8String];
  v70 = MEMORY[0x1E4F14428];
  id v71 = MEMORY[0x1E4F14428];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __68__PKPassbookSettingsController_initWithDelegate_dataSource_context___block_invoke_3;
  handler[3] = &unk_1E59CBA90;
  objc_copyWeak(&v89, &location);
  notify_register_dispatch(v69, &v10->_notifyToken, v70, handler);

  v72 = [v9 optionsDelegate];
  objc_storeWeak((id *)&v10->_optionsDelegate, v72);

  if (a5 == 1)
  {
    v73 = (PKPaymentDataProvider *)objc_alloc_init(MEMORY[0x1E4F84A88]);
    companionPaymentDataProvider = v10->_companionPaymentDataProvider;
    v10->_companionPaymentDataProvider = v73;

    if (objc_opt_respondsToSelector()) {
      [(PKPaymentDataProvider *)v10->_companionPaymentDataProvider addDelegate:v10];
    }
  }
  v75 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  pairedDeviceSupportsFeatureByAccountID = v10->_pairedDeviceSupportsFeatureByAccountID;
  v10->_pairedDeviceSupportsFeatureByAccountID = v75;

  [(PKPassbookSettingsController *)v10 _checkPairedDeviceSupportOfHiddenPassesAndRefreshUIIfNecessary];
  v77 = [(PKPaymentWebService *)v10->_webService context];
  v78 = [v77 configuration];
  v79 = [v78 contactFormatConfiguration];

  uint64_t v80 = [objc_alloc(MEMORY[0x1E4F845D8]) initWithConfiguration:v79];
  contactFormatValidator = v10->_contactFormatValidator;
  v10->_contactFormatValidator = (PKContactFormatValidator *)v80;

  v82 = (PKHideMyEmailManager *)objc_alloc_init(MEMORY[0x1E4F84750]);
  hideMyEmailManager = v10->_hideMyEmailManager;
  v10->_hideMyEmailManager = v82;

  if (!a5 && [(NSArray *)v10->_paymentPasses count])
  {
    v84 = v10->_hideMyEmailManager;
    v86[0] = MEMORY[0x1E4F143A8];
    v86[1] = 3221225472;
    v86[2] = __68__PKPassbookSettingsController_initWithDelegate_dataSource_context___block_invoke_4;
    v86[3] = &unk_1E59CDF18;
    v87 = v10;
    [(PKHideMyEmailManager *)v84 isAvailable:v86];
  }
  objc_destroyWeak(&v89);

  objc_destroyWeak(&location);
LABEL_22:

  return v10;
}

void __68__PKPassbookSettingsController_initWithDelegate_dataSource_context___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__PKPassbookSettingsController_initWithDelegate_dataSource_context___block_invoke_2;
    block[3] = &unk_1E59CA7D0;
    id v4 = WeakRetained;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __68__PKPassbookSettingsController_initWithDelegate_dataSource_context___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 648));
  [WeakRetained settingsControllerRequestsReloadSpecifiers:*(void *)(a1 + 32)];
}

void __68__PKPassbookSettingsController_initWithDelegate_dataSource_context___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _expressPassDidChange];
    id WeakRetained = v2;
  }
}

void __68__PKPassbookSettingsController_initWithDelegate_dataSource_context___block_invoke_4(uint64_t a1, int a2)
{
  uint64_t v2 = 1;
  if (!a2) {
    uint64_t v2 = 2;
  }
  *(void *)(*(void *)(a1 + 32) + 632) = v2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__PKPassbookSettingsController_initWithDelegate_dataSource_context___block_invoke_5;
  block[3] = &unk_1E59CA7D0;
  id v4 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __68__PKPassbookSettingsController_initWithDelegate_dataSource_context___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 648));
  [WeakRetained settingsController:*(void *)(a1 + 32) requestsReloadSpecifier:*(void *)(*(void *)(a1 + 32) + 392)];
}

- (void)dealloc
{
  p_paymentDataProvider = &self->_paymentDataProvider;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paymentDataProvider);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_paymentDataProvider);
    [v6 removeDelegate:self];
  }
  if (self->_companionPaymentDataProvider && (objc_opt_respondsToSelector() & 1) != 0) {
    [(PKPaymentDataProvider *)self->_companionPaymentDataProvider removeDelegate:self];
  }
  int notifyToken = self->_notifyToken;
  if (notifyToken != -1) {
    notify_cancel(notifyToken);
  }
  LAContext = self->_LAContext;
  if (LAContext)
  {
    [LAContext invalidate];
    id v9 = self->_LAContext;
    self->_LAContext = 0;
  }
  [(PKAccountService *)self->_accountService unregisterObserver:self];
  v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 removeObserver:self];

  [(SESNFCAppSettingsContext *)self->_defaultWalletContext invalidate];
  v11.receiver = self;
  v11.super_class = (Class)PKPassbookSettingsController;
  [(PKPassbookSettingsController *)&v11 dealloc];
}

- (void)applicationDidBecomeActive
{
  [(PKPassbookSettingsController *)self _fetchAccounts];
  [(PKPassbookSettingsController *)self refreshPasses];
  if ([(PKPassbookSettingsController *)self canPresentLaunchPrompts])
  {
    [(PKLaunchAuthorizationPromptController *)self->_launchAuthorizationPromptController enableLaunchPromptsForSession];
    launchAuthorizationPromptController = self->_launchAuthorizationPromptController;
    paymentPasses = self->_paymentPasses;
    [(PKLaunchAuthorizationPromptController *)launchAuthorizationPromptController presentLaunchPromptsForPassesIfNeeded:paymentPasses];
  }
}

- (void)viewDidAppear
{
}

- (void)_updateCompanionPassesAddButton
{
  v3 = [(PKPassbookSettingsController *)self _companionPassSpecifiers];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__PKPassbookSettingsController__updateCompanionPassesAddButton__block_invoke;
  v6[3] = &unk_1E59D19A8;
  v6[4] = self;
  [v3 enumerateObjectsUsingBlock:v6];

  id v4 = [(PKPassbookSettingsController *)self _pendingCompanionPassSpecifiers];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__PKPassbookSettingsController__updateCompanionPassesAddButton__block_invoke_2;
  v5[3] = &unk_1E59D19A8;
  v5[4] = self;
  [v4 enumerateObjectsUsingBlock:v5];
}

void __63__PKPassbookSettingsController__updateCompanionPassesAddButton__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F93220];
  id v4 = a2;
  id v9 = [v4 objectForKeyedSubscript:v3];
  char v5 = [v9 actionButton];
  id v6 = [*(id *)(*(void *)(a1 + 32) + 336) objectForKeyedSubscript:*MEMORY[0x1E4F93130]];
  objc_msgSend(v5, "setEnabled:", objc_msgSend(v6, "BOOLValue"));

  v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F93188]];

  uint64_t v8 = [v7 isEqualToString:*(void *)(*(void *)(a1 + 32) + 128)];
  [v9 showActivitySpinner:v8];
}

void __63__PKPassbookSettingsController__updateCompanionPassesAddButton__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F93220];
  id v4 = a2;
  id v9 = [v4 objectForKeyedSubscript:v3];
  char v5 = [v9 actionButton];
  id v6 = [*(id *)(*(void *)(a1 + 32) + 336) objectForKeyedSubscript:*MEMORY[0x1E4F93130]];
  objc_msgSend(v5, "setEnabled:", objc_msgSend(v6, "BOOLValue"));

  v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F93188]];

  uint64_t v8 = [v7 isEqualToString:*(void *)(*(void *)(a1 + 32) + 128)];
  [v9 showActivitySpinner:v8];
}

- (void)_updateAddButtonSpecifier
{
  uint64_t v3 = PKLocalizedPaymentString(&cfstr_SettingsAddPay.isa);
  addCardButtonSpecifier = self->_addCardButtonSpecifier;
  id v13 = (id)v3;
  if (addCardButtonSpecifier)
  {
    uint64_t v5 = *MEMORY[0x1E4F931B0];
    id v6 = (void *)v3;
  }
  else
  {
    v7 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:v3 target:self set:0 get:0 detail:0 cell:13 edit:0];
    uint64_t v8 = self->_addCardButtonSpecifier;
    self->_addCardButtonSpecifier = v7;

    [(PSSpecifier *)self->_addCardButtonSpecifier setButtonAction:sel_addCardTapped];
    [(PSSpecifier *)self->_addCardButtonSpecifier setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x1E4F930A8]];
    addCardButtonSpecifier = self->_addCardButtonSpecifier;
    uint64_t v5 = *MEMORY[0x1E4F93060];
    id v6 = &unk_1EF2B8E20;
  }
  [(PSSpecifier *)addCardButtonSpecifier setObject:v6 forKeyedSubscript:v5];
  id v9 = [(PSSpecifier *)self->_addCardButtonSpecifier objectForKeyedSubscript:@"PKSettingsSpecifierLoadingKey"];
  if (([v9 BOOLValue] & 1) == 0)
  {
    provisioningPassIdentifier = self->_provisioningPassIdentifier;

    if (provisioningPassIdentifier) {
      goto LABEL_12;
    }
    if (PKSecureElementIsAvailable() || self->_context == 1) {
      uint64_t v11 = PKStoreDemoModeEnabled() ^ 1;
    }
    else {
      uint64_t v11 = 0;
    }
    v12 = self->_addCardButtonSpecifier;
    id v9 = [NSNumber numberWithBool:v11];
    [(PSSpecifier *)v12 setProperty:v9 forKey:*MEMORY[0x1E4F93130]];
  }

LABEL_12:
}

- (void)_updateCardsGroupSpecifier
{
  if (self->_context == 1) {
    uint64_t v3 = @"SETTINGS_PAYMENT_CARDS_GROUP_PLURAL_WATCH";
  }
  else {
    uint64_t v3 = @"SETTINGS_PAYMENT_CARDS_GROUP";
  }
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[PKPassbookSettingsDataSource secureElementIsProductionSigned](self->_dataSource, "secureElementIsProductionSigned"));
  PKLocalizedEnvironmentHint();
  id v15 = (id)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    id v5 = v15;
  }
  else
  {
    id v6 = PKLocalizedPaymentString(&v3->isa);
    id v5 = [(PKPassbookSettingsController *)self _uppercaseGroupSpecifierTitleIfNecessary:v6];
  }
  v7 = [MEMORY[0x1E4F92E70] groupSpecifierWithName:v5];
  paymentCardsGroupSpecifier = self->_paymentCardsGroupSpecifier;
  self->_paymentCardsGroupSpecifier = v7;

  uint64_t v9 = *MEMORY[0x1E4F93188];
  [(PSSpecifier *)self->_paymentCardsGroupSpecifier setProperty:v3 forKey:*MEMORY[0x1E4F93188]];
  if (self->_context == 1) {
    v10 = @"SETTINGS_OTHER_CARDS_GROUP_PLURAL_WATCH";
  }
  else {
    v10 = @"SETTINGS_OTHER_CARDS_GROUP";
  }
  uint64_t v11 = PKLocalizedPaymentString(&v10->isa);
  v12 = [(PKPassbookSettingsController *)self _uppercaseGroupSpecifierTitleIfNecessary:v11];

  id v13 = [MEMORY[0x1E4F92E70] groupSpecifierWithName:v12];
  otherCardsGroupSpecifier = self->_otherCardsGroupSpecifier;
  self->_otherCardsGroupSpecifier = v13;

  [(PSSpecifier *)self->_otherCardsGroupSpecifier setProperty:v10 forKey:v9];
}

- (void)_updateCompanionGroupSpecifier
{
  if ([(NSArray *)self->_paymentPasses count]) {
    uint64_t v3 = @"SETTINGS_PAYMENT_COMPANION_OTHER_CARDS_PLURAL_GROUP";
  }
  else {
    uint64_t v3 = @"SETTINGS_PAYMENT_COMPANION_CARDS_PLURAL_GROUP";
  }
  id v4 = PKLocalizedPaymentString(&v3->isa);
  id v7 = [(PKPassbookSettingsController *)self _uppercaseGroupSpecifierTitleIfNecessary:v4];

  id v5 = [MEMORY[0x1E4F92E70] groupSpecifierWithName:v7];
  companionCardsGroupSpecifier = self->_companionCardsGroupSpecifier;
  self->_companionCardsGroupSpecifier = v5;

  [(PSSpecifier *)self->_companionCardsGroupSpecifier setProperty:v3 forKey:*MEMORY[0x1E4F93188]];
}

- (void)_updatePendingCompanionGroupSpecifier
{
  uint64_t v3 = PKLocalizedPaymentString(&cfstr_SettingsPaymen_3.isa);
  id v6 = [(PKPassbookSettingsController *)self _uppercaseGroupSpecifierTitleIfNecessary:v3];

  id v4 = [MEMORY[0x1E4F92E70] groupSpecifierWithName:v6];
  pendingCompanionCardsGroupSpecifier = self->_pendingCompanionCardsGroupSpecifier;
  self->_pendingCompanionCardsGroupSpecifier = v4;

  [(PSSpecifier *)self->_pendingCompanionCardsGroupSpecifier setProperty:@"SETTINGS_PAYMENT_COMPANION_PENDING_CARDS_GROUP" forKey:*MEMORY[0x1E4F93188]];
}

- (id)_uppercaseGroupSpecifierTitleIfNecessary:(id)a3
{
  id v3 = a3;
  if (PKIsVision())
  {
    id v4 = v3;
  }
  else
  {
    objc_msgSend(v3, "pk_uppercaseStringForPreferredLocale");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v5 = v4;

  return v5;
}

- (void)_refreshCompanionGroupSpecififiers
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v3 = self->_companionPassSpecifiers;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v21 + 1) + 8 * v7);
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained settingsController:self requestsReloadSpecifier:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v5);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v10 = self->_pendingCompanionPassSpecifiers;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v17 + 1) + 8 * v14);
        id v16 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v16, "settingsController:requestsReloadSpecifier:", self, v15, (void)v17);

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v12);
  }
}

- (id)_bridgeSpecifiers
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  if ([(PKPassbookSettingsDataSource *)self->_dataSource canRegisterForPeerPayment])
  {
    uint64_t v4 = [(PKPeerPaymentWebService *)self->_peerPaymentWebService targetDevice];
    uint64_t v5 = [v4 account];

    if (!PKIsAltAccountPairedOrPairing() || v5)
    {
      uint64_t v6 = [(PKPassbookSettingsController *)self _peerPaymentGroupSpecifiers];
    }
    else
    {
      uint64_t v6 = [(PKPassbookSettingsController *)self _peerPaymentTinkerGroupSpecifiers];
    }
    uint64_t v9 = (void *)v6;
    [v3 addObjectsFromArray:v6];

    p_paymentPasses = &self->_paymentPasses;
    if (![(NSArray *)self->_paymentPasses count])
    {
      v10 = [MEMORY[0x1E4F92E70] emptyGroupSpecifier];
      [v3 addObject:v10];
      uint64_t v8 = 0;
      goto LABEL_11;
    }
  }
  else
  {
    p_paymentPasses = &self->_paymentPasses;
    if (![(NSArray *)self->_paymentPasses count])
    {
      uint64_t v8 = 0;
      goto LABEL_12;
    }
  }
  uint64_t v8 = self->_paymentCardsGroupSpecifier;
  [v3 addObject:self->_paymentCardsGroupSpecifier];
  v10 = [(PKPassbookSettingsController *)self _paymentPassSpecifiers];
  [v3 addObjectsFromArray:v10];
LABEL_11:

LABEL_12:
  [v3 addObject:self->_addCardButtonSpecifier];
  if ([(NSArray *)self->_otherPasses count])
  {
    [v3 addObject:self->_otherCardsGroupSpecifier];
    uint64_t v11 = [(PKPassbookSettingsController *)self _otherPassSpecifiers];
    [v3 addObjectsFromArray:v11];
  }
  if ([(NSArray *)self->_companionPasses count])
  {
    [v3 safelyAddObject:self->_companionCardsGroupSpecifier];
    uint64_t v12 = self->_companionCardsGroupSpecifier;

    uint64_t v13 = [(PKPassbookSettingsController *)self _companionPassSpecifiers];
    [v3 addObjectsFromArray:v13];

    uint64_t v8 = v12;
  }
  if ([(NSArray *)self->_pendingCompanionPasses count])
  {
    [v3 safelyAddObject:self->_pendingCompanionCardsGroupSpecifier];
    uint64_t v14 = [(PKPassbookSettingsController *)self _pendingCompanionPassSpecifiers];
    [v3 addObjectsFromArray:v14];
  }
  BOOL v15 = [(PKPassbookSettingsController *)self _supportsApplePay];
  if (![(NSArray *)self->_paymentPasses count])
  {
    long long v18 = objc_msgSend(MEMORY[0x1E4F83AC8], "pk_privacyFlowForContext:", 1);
    long long v19 = [v18 localizedButtonTitle];
    int IsAvailable = PKPearlIsAvailable();
    int64_t context = self->_context;
    if (!IsAvailable || context == 1)
    {
      if (context == 1) {
        int v23 = 1;
      }
      else {
        int v23 = IsAvailable;
      }
      long long v22 = @"SETTINGS_ABOUT_FOOTER";
    }
    else
    {
      long long v22 = @"SETTINGS_ABOUT_FOOTER_FACEID";
      int v23 = 0;
    }
    PKDeviceSpecificLocalizedStringKeyForKey(v22, v23);
    long long v24 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v25 = PKLocalizedPaymentString(v24);

    id v26 = [NSString stringWithFormat:@"%@ %@", v25, v19];
    uint64_t v27 = (objc_class *)objc_opt_class();
    v28 = NSStringFromClass(v27);
    [(PSSpecifier *)v8 setProperty:v28 forKey:*MEMORY[0x1E4F93140]];

    [(PSSpecifier *)v8 setProperty:v26 forKey:*MEMORY[0x1E4F93160]];
    v36.id location = [v26 rangeOfString:v19];
    v29 = NSStringFromRange(v36);
    [(PSSpecifier *)v8 setProperty:v29 forKey:*MEMORY[0x1E4F93150]];

    v30 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:self];
    [(PSSpecifier *)v8 setProperty:v30 forKey:*MEMORY[0x1E4F93158]];

    [(PSSpecifier *)v8 setProperty:@"_openPrivacyLink" forKey:*MEMORY[0x1E4F93148]];
    if (!v15) {
      goto LABEL_36;
    }
    goto LABEL_31;
  }
  if (self->_hasExpressCapablePass)
  {
    id v16 = [(PKPassbookSettingsController *)self _transitDefaultsGroupSpecifiers];
    [v3 addObjectsFromArray:v16];
  }
  long long v17 = [(PKPassbookSettingsController *)self _defaultsGroupSpecifiers];
  [v3 addObjectsFromArray:v17];

  [(PSSpecifier *)v8 removePropertyForKey:*MEMORY[0x1E4F93140]];
  [(PSSpecifier *)v8 removePropertyForKey:*MEMORY[0x1E4F93160]];
  [(PSSpecifier *)v8 removePropertyForKey:*MEMORY[0x1E4F93150]];
  [(PSSpecifier *)v8 removePropertyForKey:*MEMORY[0x1E4F93158]];
  [(PSSpecifier *)v8 removePropertyForKey:*MEMORY[0x1E4F93148]];
  if (v15)
  {
LABEL_31:
    id v31 = PKPairedOrPairingDevice();
    uint64_t v32 = v31;
    if (v31
      && softLinkNRWatchOSVersionForRemoteDevice(v31) >= 0x30000
      && [(NSArray *)*p_paymentPasses count])
    {
      v33 = [(PKPassbookSettingsController *)self _handoffSwitchGroupSpecifiers];
      [v3 addObjectsFromArray:v33];
    }
  }
LABEL_36:

  return v3;
}

- (BOOL)_supportsApplePay
{
  uint64_t v2 = (void *)MEMORY[0x1E4F84BD0];
  id v3 = [MEMORY[0x1E4F84D50] sharedService];
  LOBYTE(v2) = [v2 _isPaymentSetupSupportedForWebService:v3];

  return (char)v2;
}

- (id)_settingsSpecifiers
{
  uint64_t v3 = PKUserInterfaceIdiom();
  uint64_t v4 = PKUserInterfaceIdiom();
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v6 = [(PKPassbookSettingsController *)self _systemPolicyForAppSpecifiers];
  [v5 addObjectsFromArray:v6];

  if (v3 == 1)
  {
    uint64_t v7 = [(PKPassbookSettingsController *)self _pendingInvitationsGroupSpecifiers];
    if ([v7 count]) {
      [v5 addObjectsFromArray:v7];
    }
  }
  int IsAvailable = PKSecureElementIsAvailable();
  NSUInteger v9 = [(NSArray *)self->_paymentPasses count];
  BOOL v10 = [(PKPassbookSettingsController *)self _supportsApplePay];
  if ([(PKPassbookSettingsDataSource *)self->_dataSource canRegisterForPeerPayment]&& IsAvailable)
  {
    uint64_t v11 = [(PKPassbookSettingsController *)self _peerPaymentGroupSpecifiers];
    [v5 addObjectsFromArray:v11];
  }
  else if (!IsAvailable && !v9)
  {
    goto LABEL_13;
  }
  [v5 addObject:self->_paymentCardsGroupSpecifier];
  uint64_t v12 = [(PKPassbookSettingsController *)self _paymentPassSpecifiers];
  [v5 addObjectsFromArray:v12];
  if (IsAvailable) {
    [v5 addObject:self->_addCardButtonSpecifier];
  }

LABEL_13:
  if ([(NSArray *)self->_otherPasses count])
  {
    [v5 addObject:self->_otherCardsGroupSpecifier];
    uint64_t v13 = [(PKPassbookSettingsController *)self _otherPassSpecifiers];
    [v5 addObjectsFromArray:v13];
  }
  if (PKBankCredentialCenterEnabled())
  {
    uint64_t v14 = [(PKPassbookSettingsController *)self _credentialCenterSpecifiers];
    [v5 addObjectsFromArray:v14];
  }
  BOOL v15 = [(PKPassbookSettingsController *)self _openAccountsGroupSpecifiers];
  [v5 addObjectsFromArray:v15];

  if (PKBankConnectEnabled() && !self->_context)
  {
    id v16 = [(PKPassbookSettingsController *)self _bankConnectGroupSpecifiers];
    [v5 addObjectsFromArray:v16];
  }
  BOOL v17 = v3 == 1 || v4 == 6;
  char v18 = v17;
  if (v17)
  {
    if (v9)
    {
LABEL_39:
      int v23 = [(PKPassbookSettingsController *)self _defaultsGroupSpecifiers];
      [v5 addObjectsFromArray:v23];
    }
  }
  else
  {
    if (v10)
    {
      long long v19 = [(PKPassbookSettingsController *)self _defaultAppSpecifiers];
      if (v19) {
        [v5 addObjectsFromArray:v19];
      }
      long long v20 = [(PKPassbookSettingsController *)self _lockscreenSwitchGroupSpecifiers];
      [v5 addObjectsFromArray:v20];
    }
    if (PKExpiredPassesRefreshEnabled())
    {
      long long v21 = [(PKPassbookSettingsController *)self _expiredPassesSwitchGroupSpecifiers];
      [v5 addObjectsFromArray:v21];
    }
    if (v9)
    {
      if (self->_hasExpressCapablePass)
      {
        long long v22 = [(PKPassbookSettingsController *)self _transitDefaultsGroupSpecifiers];
        [v5 addObjectsFromArray:v22];
      }
      goto LABEL_39;
    }
  }
  long long v24 = [(PKPassbookSettingsController *)self _cardBenefitSpecifiers];
  [v5 addObjectsFromArray:v24];

  id v25 = [(PKPassbookSettingsController *)self _showPayLaterOptionsSpecifiers];
  [v5 addObjectsFromArray:v25];

  if ((PKSafariCredentialProvisioningEnabled() & v10) == 1)
  {
    id v26 = [(PKPassbookSettingsController *)self _onlinePaymentsGroupSpecifiers];
    [v5 addObjectsFromArray:v26];
  }
  if (v9)
  {
    if (v18)
    {
      if (v4 == 6) {
        goto LABEL_51;
      }
    }
    else
    {
      v33 = [(PKPassbookSettingsController *)self _handoffSwitchGroupSpecifiers];
      [v5 addObjectsFromArray:v33];
    }
    uint64_t v34 = [(PKPassbookSettingsController *)self _orderManagementGroupSpecifiers];
    [v5 addObjectsFromArray:v34];

LABEL_51:
    [(PSSpecifier *)self->_paymentCardsGroupSpecifier removePropertyForKey:*MEMORY[0x1E4F93140]];
    [(PSSpecifier *)self->_paymentCardsGroupSpecifier removePropertyForKey:*MEMORY[0x1E4F93160]];
    [(PSSpecifier *)self->_paymentCardsGroupSpecifier removePropertyForKey:*MEMORY[0x1E4F93150]];
    [(PSSpecifier *)self->_paymentCardsGroupSpecifier removePropertyForKey:*MEMORY[0x1E4F93158]];
    [(PSSpecifier *)self->_paymentCardsGroupSpecifier removePropertyForKey:*MEMORY[0x1E4F93148]];
    goto LABEL_57;
  }
  uint64_t v27 = objc_msgSend(MEMORY[0x1E4F83AC8], "pk_privacyFlowForContext:", 1);
  v28 = [v27 localizedButtonTitle];
  int v29 = PKPearlIsAvailable();
  int64_t context = self->_context;
  if (!v29 || context == 1)
  {
    if (context == 1) {
      int v32 = 1;
    }
    else {
      int v32 = v29;
    }
    id v31 = @"SETTINGS_ABOUT_FOOTER";
  }
  else
  {
    id v31 = @"SETTINGS_ABOUT_FOOTER_FACEID";
    int v32 = 0;
  }
  PKDeviceSpecificLocalizedStringKeyForKey(v31, v32);
  v35 = (NSString *)objc_claimAutoreleasedReturnValue();
  NSRange v36 = PKLocalizedPaymentString(v35);

  uint64_t v37 = [NSString stringWithFormat:@"%@ %@", v36, v28];
  paymentCardsGroupSpecifier = self->_paymentCardsGroupSpecifier;
  uint64_t v39 = (objc_class *)objc_opt_class();
  v40 = NSStringFromClass(v39);
  [(PSSpecifier *)paymentCardsGroupSpecifier setProperty:v40 forKey:*MEMORY[0x1E4F93140]];

  [(PSSpecifier *)self->_paymentCardsGroupSpecifier setProperty:v37 forKey:*MEMORY[0x1E4F93160]];
  v41 = self->_paymentCardsGroupSpecifier;
  v48.id location = [v37 rangeOfString:v28];
  uint64_t v42 = NSStringFromRange(v48);
  [(PSSpecifier *)v41 setProperty:v42 forKey:*MEMORY[0x1E4F93150]];

  v43 = self->_paymentCardsGroupSpecifier;
  v44 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:self];
  [(PSSpecifier *)v43 setProperty:v44 forKey:*MEMORY[0x1E4F93158]];

  [(PSSpecifier *)self->_paymentCardsGroupSpecifier setProperty:@"_openPrivacyLink" forKey:*MEMORY[0x1E4F93148]];
LABEL_57:
  uint64_t v45 = [(PKPassbookSettingsController *)self _closedAccountsGroupSpecifiers];
  [v5 addObjectsFromArray:v45];

  return v5;
}

- (id)_pendingInvitationsGroupSpecifiers
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = [(PKInboxDataSource *)self->_inboxDataSource activeInboxMessages];
  if ([v4 count])
  {
    id v5 = PKLocalizedMadisonString(&cfstr_PendingInvitat.isa);
    uint64_t v6 = [MEMORY[0x1E4F92E70] groupSpecifierWithName:v5];
    [v3 addObject:v6];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __66__PKPassbookSettingsController__pendingInvitationsGroupSpecifiers__block_invoke;
    v10[3] = &unk_1E59D19D0;
    v10[4] = self;
    uint64_t v7 = objc_msgSend(v4, "pk_arrayByApplyingBlock:", v10);
    [v3 addObjectsFromArray:v7];
  }
  uint64_t v8 = (void *)[v3 copy];

  return v8;
}

id __66__PKPassbookSettingsController__pendingInvitationsGroupSpecifiers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F92E70];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  id v5 = [v2 preferenceSpecifierNamed:0 target:v3 set:0 get:0 detail:0 cell:3 edit:0];
  [v5 setObject:v4 forKeyedSubscript:@"pkInboxMessage"];
  [v5 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x1E4F930A8]];
  [v5 setObject:&unk_1EF2B8E38 forKeyedSubscript:*MEMORY[0x1E4F93050]];
  uint64_t v6 = [v4 identifier];

  [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F93188]];
  [v5 setControllerLoadAction:sel__presentInboxMessage_];

  return v5;
}

- (void)_presentInboxMessage:(id)a3
{
  id v5 = [a3 objectForKeyedSubscript:@"pkInboxMessage"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained settingsController:self requestsPresentInboxMessage:v5 animated:1 completion:0];
}

- (void)_reloadPendingInvitationSpecifiers
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained settingsControllerRequestsReloadSpecifiers:self];
}

- (void)inboxDataSourceDidUpdateInboxMessages:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__PKPassbookSettingsController_inboxDataSourceDidUpdateInboxMessages___block_invoke;
  block[3] = &unk_1E59CA7D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __70__PKPassbookSettingsController_inboxDataSourceDidUpdateInboxMessages___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadPendingInvitationSpecifiers];
}

- (id)_restrictedModeSpecifier
{
  if (![(PKPassbookSettingsDataSource *)self->_dataSource deviceInRestrictedMode])
  {
    id v5 = 0;
    goto LABEL_9;
  }
  uint64_t v3 = (void *)MEMORY[0x1E4F92E70];
  id v4 = PKLocalizedPaymentString(&cfstr_SettingsRestri.isa);
  id v5 = [v3 groupSpecifierWithID:v4];

  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  [v5 setProperty:v7 forKey:*MEMORY[0x1E4F93140]];

  uint64_t v8 = PKLocalizedPaymentString(&cfstr_SettingsRestri.isa);
  NSUInteger v9 = [(PKPassbookSettingsController *)self _uppercaseGroupSpecifierTitleIfNecessary:v8];
  [v5 setProperty:v9 forKey:@"settingsAlertHeaderText"];

  if (PKUserInterfaceIdiom() == 1)
  {
    BOOL v10 = @"SETTINGS_RESTRICTED_MODE_TEXT_IPAD";
  }
  else
  {
    if (self->_context != 1) {
      goto LABEL_9;
    }
    BOOL v10 = @"SETTINGS_RESTRICTED_MODE_TEXT_WATCH";
  }
  uint64_t v11 = PKLocalizedPaymentString(&v10->isa);
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    [v5 setProperty:v11 forKey:@"settingsAlertDescriptionText"];
  }
LABEL_9:

  return v5;
}

- (id)specifiers
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  if ((PKUserInterfaceIdiom() == 1 || self->_context == 1)
    && ([(PKPassbookSettingsController *)self _restrictedModeSpecifier],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v3 safelyAddObject:v4],
        v4,
        self->_context == 1))
  {
    uint64_t v5 = [(PKPassbookSettingsController *)self _bridgeSpecifiers];
  }
  else
  {
    uint64_t v5 = [(PKPassbookSettingsController *)self _settingsSpecifiers];
  }
  uint64_t v6 = (void *)v5;
  [v3 addObjectsFromArray:v5];

  return v3;
}

- (void)_reloadPassData
{
  uint64_t v152 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "PKPassbookSettingsController: reloading pass data", buf, 2u);
  }

  paymentPassSpecifiers = self->_paymentPassSpecifiers;
  self->_paymentPassSpecifiers = 0;

  otherPassSpecifiers = self->_otherPassSpecifiers;
  self->_otherPassSpecifiers = 0;

  if (self->_context == 1)
  {
    uint64_t v6 = [(PKPaymentWebService *)self->_webService targetDevice];
    uint64_t v7 = [v6 deviceVersion];
    uint64_t v8 = [v6 deviceClass];
    NSUInteger v9 = [v6 paymentWebService:self->_webService supportedRegionFeatureOfType:2];
    BOOL v10 = [v9 ownerSharingOSVersionRequirement];
    self->_ownerCredentialSharingAllowed = [v10 versionMeetsRequirements:v7 deviceClass:v8];

    uint64_t v11 = [v9 friendSharingOSVersionRequirement];
    self->_canAcceptCredentialInvitations = [v11 versionMeetsRequirements:v7 deviceClass:v8];

    uint64_t v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = "enabled";
      if (self->_ownerCredentialSharingAllowed) {
        uint64_t v14 = "enabled";
      }
      else {
        uint64_t v14 = "disabled";
      }
      if (!self->_canAcceptCredentialInvitations) {
        uint64_t v13 = "disabled";
      }
      *(_DWORD *)buf = 136315394;
      uint64_t v142 = (uint64_t)v14;
      __int16 v143 = 2080;
      uint64_t v144 = (uint64_t)v13;
      _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "Configuring passes with owner sharing %s, accepting invitations %s", buf, 0x16u);
    }
  }
  id v120 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int64_t context = self->_context;
  long long v136 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  v114 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_passLibraryDataProvider);
  long long v19 = [WeakRetained paymentPasses];

  uint64_t v20 = [v19 countByEnumeratingWithState:&v136 objects:v151 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v137;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v137 != v22) {
          objc_enumerationMutation(v19);
        }
        long long v24 = *(void **)(*((void *)&v136 + 1) + 8 * i);
        if ([v24 passType] == 1)
        {
          id v25 = v24;
          id v26 = v25;
          if (context == 1) {
            [v25 setPreferredImageSuffix:0];
          }
          char v27 = [v26 isAccessPass];
          v28 = v16;
          if ((v27 & 1) == 0)
          {
            if ([v26 isIdentityPass]) {
              v28 = v16;
            }
            else {
              v28 = v15;
            }
          }
          [v28 addObject:v26];
          int v29 = [v26 primaryAccountIdentifier];
          if (v29) {
            [v120 addObject:v29];
          }
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v136 objects:v151 count:16];
    }
    while (v21);
  }

  uint64_t v30 = [v15 copy];
  id v31 = v114;
  paymentPasses = v114->_paymentPasses;
  v114->_paymentPasses = (NSArray *)v30;

  uint64_t v33 = [v16 copy];
  otherPasses = v114->_otherPasses;
  v114->_otherPasses = (NSArray *)v33;

  if (v114->_context == 1)
  {
    companionPassSpecifiers = v114->_companionPassSpecifiers;
    if (companionPassSpecifiers)
    {
      v114->_companionPassSpecifiers = 0;
    }
    pendingCompanionPassSpecifiers = v114->_pendingCompanionPassSpecifiers;
    if (pendingCompanionPassSpecifiers)
    {
      v114->_pendingCompanionPassSpecifiers = 0;
    }
    if ((PKIsAltAccountPairedOrPairing() & 1) == 0)
    {
      v107 = objc_alloc_init(PKPassbookSettingsDefaultBehavior);
      uint64_t v37 = [(PKPassbookSettingsDefaultBehavior *)v107 passLibraryDataProvider];
      v38 = [v37 paymentPasses];
      uint64_t v39 = (void *)[v38 copy];

      id v110 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v118 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v108 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v109 = [(PKPassbookSettingsController *)v114 watchPassReaderIdentifiers];
      v40 = [(PKPaymentWebService *)v114->_webService targetDevice];
      if (objc_opt_respondsToSelector()) {
        char v41 = [v40 areUnifiedAccessPassesSupported];
      }
      else {
        char v41 = 0;
      }
      v106 = v40;
      long long v134 = 0u;
      long long v135 = 0u;
      long long v132 = 0u;
      long long v133 = 0u;
      id v42 = v39;
      uint64_t v43 = [v42 countByEnumeratingWithState:&v132 objects:v150 count:16];
      if (v43)
      {
        uint64_t v44 = v43;
        uint64_t v45 = *(void *)v133;
        id v113 = v42;
        char v112 = v41;
        uint64_t v111 = *(void *)v133;
        do
        {
          uint64_t v46 = 0;
          uint64_t v115 = v44;
          do
          {
            if (*(void *)v133 != v45) {
              objc_enumerationMutation(v42);
            }
            v47 = *(void **)(*((void *)&v132 + 1) + 8 * v46);
            int v48 = objc_msgSend(v47, "hasCredentials", v106);
            if (([v47 supportsSerialNumberBasedProvisioning] & 1) != 0
              || (([v47 associatedAccountServiceAccountIdentifier],
                   (v49 = objc_claimAutoreleasedReturnValue()) != 0)
                ? (int v50 = 1)
                : (int v50 = v48),
                  v49,
                  v50 == 1))
            {
              if (![v47 activationState] || objc_msgSend(v47, "activationState") == 2)
              {
                if (!v48 || ![v47 isCarKeyPass])
                {
                  uint64_t v51 = [v47 primaryAccountIdentifier];
                  v52 = v120;
                  goto LABEL_55;
                }
                if ([(PKPassbookSettingsController *)v31 canShareCompanionPass:v47])
                {
                  uint64_t v51 = [v47 pairedTerminalIdentifier];
                  v52 = v109;
LABEL_55:
                  char v53 = [v52 containsObject:v51];

                  if (v53) {
                    goto LABEL_110;
                  }
                }
                v54 = [v47 devicePrimaryPaymentApplication];
                uint64_t v55 = [v54 paymentType];

                if ((unint64_t)(v55 - 1005) < 0xFFFFFFFFFFFFFFFELL) {
                  char v56 = 1;
                }
                else {
                  char v56 = v41;
                }
                uint64_t v57 = [v47 associatedAccountServiceAccountIdentifier];
                v119 = (void *)v57;
                if (v57)
                {
                  uint64_t v58 = [(NSMutableDictionary *)v31->_pairedDeviceSupportsFeatureByAccountID objectForKeyedSubscript:v57];
                  int v59 = [v58 BOOLValue];

                  char v60 = [v47 hasAssociatedPeerPaymentAccount];
                  if (!v59)
                  {
                    int v61 = [v47 isIdentityPass];
                    v62 = v118;
                    if (v61)
                    {
                      char v63 = 1;
                      goto LABEL_65;
                    }
                    goto LABEL_109;
                  }
                }
                else
                {
                  char v60 = [v47 hasAssociatedPeerPaymentAccount];
                }
                char v63 = v60 | v56 ^ 1;
                if ([v47 isIdentityPass])
                {
LABEL_65:
                  activeCIDVUIConfigurations = v31->_activeCIDVUIConfigurations;
                  if (!activeCIDVUIConfigurations)
                  {
                    v90 = PKLogFacilityTypeGetObject();
                    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_19F450000, v90, OS_LOG_TYPE_DEFAULT, "Waiting for configurations, hiding pass for now", buf, 2u);
                    }

                    v62 = v118;
                    goto LABEL_109;
                  }
                  char v116 = v63;
                  uint64_t v117 = v46;
                  long long v130 = 0u;
                  long long v131 = 0u;
                  long long v128 = 0u;
                  long long v129 = 0u;
                  obuint64_t j = activeCIDVUIConfigurations;
                  uint64_t v65 = [(NSArray *)obj countByEnumeratingWithState:&v128 objects:v149 count:16];
                  if (v65)
                  {
                    uint64_t v66 = v65;
                    char v121 = 0;
                    uint64_t v67 = *(void *)v129;
                    while (1)
                    {
                      uint64_t v68 = 0;
                      uint64_t v122 = v66;
                      do
                      {
                        if (*(void *)v129 != v67) {
                          objc_enumerationMutation(obj);
                        }
                        v69 = *(void **)(*((void *)&v128 + 1) + 8 * v68);
                        v70 = PKLogFacilityTypeGetObject();
                        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
                        {
                          id v71 = [v69 state];
                          uint64_t v72 = [v69 target];
                          v73 = [v69 state];
                          v74 = [v69 country];
                          *(_DWORD *)buf = 134218754;
                          uint64_t v142 = (uint64_t)v71;
                          __int16 v143 = 2048;
                          uint64_t v144 = v72;
                          __int16 v145 = 2112;
                          v146 = v73;
                          __int16 v147 = 2112;
                          v148 = v74;
                          _os_log_impl(&dword_19F450000, v70, OS_LOG_TYPE_DEFAULT, "Checking for match with config %lu/%lu/%@/%@", buf, 0x2Au);
                        }
                        v75 = [v47 issuerAdministrativeAreaCode];
                        v76 = [v69 state];
                        v77 = v75;
                        v78 = v76;
                        v79 = v78;
                        if (v77 == v78)
                        {
                        }
                        else
                        {
                          if (!v77 || !v78)
                          {

LABEL_85:
                            goto LABEL_96;
                          }
                          uint64_t v80 = [v77 caseInsensitiveCompare:v78];

                          if (v80) {
                            goto LABEL_85;
                          }
                        }
                        uint64_t v81 = v67;
                        v82 = v47;
                        v83 = [v47 issuerCountryCode];
                        v84 = [v69 country];
                        id v85 = v83;
                        id v86 = v84;
                        if (v85 == v86)
                        {
                        }
                        else
                        {
                          v87 = v86;
                          if (!v85 || !v86)
                          {

                            v47 = v82;
                            uint64_t v67 = v81;
                            uint64_t v66 = v122;
                            goto LABEL_96;
                          }
                          uint64_t v88 = [v85 caseInsensitiveCompare:v86];

                          if (v88)
                          {
                            v47 = v82;
LABEL_94:
                            uint64_t v67 = v81;
                            uint64_t v66 = v122;
                            goto LABEL_97;
                          }
                        }
                        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
                        {
                          uint64_t v89 = [v69 status];
                          *(_DWORD *)buf = 134217984;
                          uint64_t v142 = v89;
                          _os_log_impl(&dword_19F450000, v70, OS_LOG_TYPE_DEFAULT, "Config status %lu", buf, 0xCu);
                        }

                        v47 = v82;
                        if ([v69 target] != 2) {
                          goto LABEL_94;
                        }
                        uint64_t v67 = v81;
                        uint64_t v66 = v122;
                        if ([v69 status] == 3) {
                          goto LABEL_97;
                        }
                        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_impl(&dword_19F450000, v70, OS_LOG_TYPE_DEFAULT, "Config status is not None, apply pending state", buf, 2u);
                        }
                        char v121 = 1;
                        v77 = v70;
LABEL_96:

LABEL_97:
                        ++v68;
                      }
                      while (v66 != v68);
                      uint64_t v66 = [(NSArray *)obj countByEnumeratingWithState:&v128 objects:v149 count:16];
                      if (!v66) {
                        goto LABEL_106;
                      }
                    }
                  }
                  char v121 = 0;
LABEL_106:

                  uint64_t v46 = v117;
                  v62 = v118;
                  id v42 = v113;
                  id v31 = v114;
                  char v41 = v112;
                  uint64_t v45 = v111;
                  uint64_t v44 = v115;
                  if (v116) {
                    goto LABEL_109;
                  }
                  v62 = v108;
                  if (v121) {
                    goto LABEL_109;
                  }
                }
                else
                {
                  v62 = v118;
                  if (v63) {
                    goto LABEL_109;
                  }
                }
                v62 = v110;
LABEL_109:
                [v62 addObject:v47];
              }
            }
LABEL_110:
            ++v46;
          }
          while (v46 != v44);
          uint64_t v44 = [v42 countByEnumeratingWithState:&v132 objects:v150 count:16];
        }
        while (v44);
      }

      uint64_t v91 = [v110 copy];
      companionPasses = v31->_companionPasses;
      v31->_companionPasses = (NSArray *)v91;

      uint64_t v93 = [v108 copy];
      pendingCompanionPasses = v31->_pendingCompanionPasses;
      v31->_pendingCompanionPasses = (NSArray *)v93;

      uint64_t v95 = [v118 copy];
      hiddenCompanionPasses = v31->_hiddenCompanionPasses;
      v31->_hiddenCompanionPasses = (NSArray *)v95;
    }
  }
  if (v31->_defaultCardIdentifier)
  {
    id v97 = objc_loadWeakRetained((id *)&v31->_paymentDataProvider);
    uint64_t v98 = [v97 defaultPaymentPassIdentifier];
    defaultCardIdentifier = v31->_defaultCardIdentifier;
    v31->_defaultCardIdentifier = (NSString *)v98;
  }
  -[PKPassbookSettingsController _updateTransitExpressPassIdentifiersWithReload:](v31, "_updateTransitExpressPassIdentifiersWithReload:", 1, v106);
  v31->_hasExpressCapablePass = 0;
  long long v124 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  v100 = v31->_paymentPasses;
  uint64_t v101 = [(NSArray *)v100 countByEnumeratingWithState:&v124 objects:v140 count:16];
  if (v101)
  {
    uint64_t v102 = v101;
    uint64_t v103 = *(void *)v125;
    while (2)
    {
      for (uint64_t j = 0; j != v102; ++j)
      {
        if (*(void *)v125 != v103) {
          objc_enumerationMutation(v100);
        }
        v105 = *(void **)(*((void *)&v124 + 1) + 8 * j);
        if (([v105 isAccessPass] & 1) == 0
          && (([(PKExpressPassController *)v31->_expressPassController isExpressModeSupportedForPass:v105] & 1) != 0|| [(PKExpressPassController *)v31->_expressPassController hasEligibleExpressUpgradeRequestForPass:v105]))
        {
          v31->_hasExpressCapablePass = 1;
          goto LABEL_127;
        }
      }
      uint64_t v102 = [(NSArray *)v100 countByEnumeratingWithState:&v124 objects:v140 count:16];
      if (v102) {
        continue;
      }
      break;
    }
  }
LABEL_127:
}

- (void)refreshPasses
{
  uint64_t v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  pairedDeviceSupportsFeatureByAccountID = self->_pairedDeviceSupportsFeatureByAccountID;
  self->_pairedDeviceSupportsFeatureByAccountID = v3;

  [(PKPassbookSettingsController *)self _refreshPasses];

  [(PKPassbookSettingsController *)self _checkPairedDeviceSupportOfHiddenPassesAndRefreshUIIfNecessary];
}

- (void)_refreshPasses
{
  [(PKPassbookSettingsController *)self _reloadPassData];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_expressPassesViewController);
  [WeakRetained setPasses:self->_paymentPasses];

  [(PKPassbookSettingsController *)self _updateCardsGroupSpecifier];
  [(PKPassbookSettingsController *)self _updateCompanionGroupSpecifier];
  [(PKPassbookSettingsController *)self _updatePendingCompanionGroupSpecifier];
  [(PKPassbookSettingsController *)self _updateAddButtonSpecifier];
  if (self->_context == 1) {
    [(PKPassbookSettingsController *)self _updateCompanionPassesAddButton];
  }
  [(PKPassbookSettingsController *)self _updateDefaultCardsPreferences];
  if (self->_defaultCardIdentifier)
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    [v4 addObject:self->_availableCards];
    if (self->_unavailableCards) {
      objc_msgSend(v4, "addObject:");
    }
    [(PKPaymentPreferencesListViewController *)self->_defaultCardsController setPreferences:v4];
  }
  id v5 = objc_loadWeakRetained((id *)&self->_delegate);
  [v5 settingsControllerRequestsReloadSpecifiers:self];
}

- (void)refreshDefaultCard
{
  if (self->_defaultCardIdentifier)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_paymentDataProvider);
    id v4 = [WeakRetained defaultPaymentPassIdentifier];
    defaultCardIdentifier = self->_defaultCardIdentifier;
    self->_defaultCardIdentifier = v4;
  }
  id v7 = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v6 = [(PKPassbookSettingsController *)self _defaultPaymentSpecifier];
  [v7 settingsController:self requestsReloadSpecifier:v6];
}

- (void)refreshExpressTransitCard
{
}

- (id)_fallbackExpressTransitFooterText
{
  if ([(PKExpressPassController *)self->_expressPassController deviceUsesAutomaticAuthorization])
  {
    uint64_t v3 = @"SETTINGS_AUTOMATIC_TRANSIT_SECTION_FOOTER";
LABEL_5:
    uint64_t v4 = PKLocalizedPaymentString(&v3->isa);
LABEL_6:
    id v5 = (void *)v4;
    goto LABEL_7;
  }
  if (self->_context == 1)
  {
    uint64_t v3 = @"SETTINGS_EXPRESS_TRANSIT_SECTION_FOOTER_WATCH";
    goto LABEL_5;
  }
  p_paymentDataProvider = &self->_paymentDataProvider;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paymentDataProvider);
  if (objc_opt_respondsToSelector())
  {
    id v9 = objc_loadWeakRetained((id *)p_paymentDataProvider);
    int v10 = [v9 supportsLowPowerExpressMode];

    if (v10)
    {
      if (PKPearlIsAvailable()) {
        uint64_t v3 = @"SETTINGS_EXPRESS_TRANSIT_SECTION_FOOTER_IPHONE_LPEM_FACEID";
      }
      else {
        uint64_t v3 = @"SETTINGS_EXPRESS_TRANSIT_SECTION_FOOTER_IPHONE_LPEM_TOUCHID";
      }
      goto LABEL_5;
    }
  }
  else
  {
  }
  if (PKPearlIsAvailable())
  {
    uint64_t v4 = PKLocalizedPearlString(&cfstr_SettingsTransi.isa);
    goto LABEL_6;
  }
  PKDeviceSpecificLocalizedStringKeyForKey(@"SETTINGS_EXPRESS_TRANSIT_SECTION_FOOTER", 0);
  uint64_t v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  id v5 = PKLocalizedPaymentString(v11);

LABEL_7:

  return v5;
}

- (void)_updateTransitExpressPassIdentifiersWithReload:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(PKExpressPassController *)self->_expressPassController enabledExpressPasses];
  id v5 = (void *)[v4 mutableCopy];
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  uint64_t v6 = [v4 allValues];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v77 objects:v82 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v78;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v78 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v77 + 1) + 8 * i);
        uint64_t v12 = [v11 passInformation];
        uint64_t v13 = [v12 cardType];

        if ((unint64_t)(v13 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          uint64_t v14 = [v11 passUniqueIdentifier];
          [v5 removeObjectForKey:v14];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v77 objects:v82 count:16];
    }
    while (v8);
  }

  id v15 = (void *)[v5 copy];
  uint64_t v16 = [v15 count];
  uint64_t v17 = v16;
  if (v16 >= 2)
  {
    uint64_t v18 = PKLocalizedPaymentString(&cfstr_SettingsDefaul_0.isa);
    long long v19 = self;
LABEL_15:
    id expressTransitSubtitleText = v19->_expressTransitSubtitleText;
    v19->_id expressTransitSubtitleText = (NSString *)v18;
    goto LABEL_16;
  }
  long long v19 = self;
  if (v16 != 1)
  {
    uint64_t v18 = PKLocalizedPaymentString(&cfstr_None_0.isa);
    goto LABEL_15;
  }
  id expressTransitSubtitleText = objc_loadWeakRetained((id *)&self->_passLibraryDataProvider);
  uint64_t v21 = [v15 allKeys];
  uint64_t v22 = [v21 objectAtIndexedSubscript:0];
  [expressTransitSubtitleText passWithUniqueID:v22];
  v24 = BOOL v23 = v3;
  id v25 = [v24 localizedDescription];
  id v26 = self->_expressTransitSubtitleText;
  self->_id expressTransitSubtitleText = v25;

  BOOL v3 = v23;
LABEL_16:

  id WeakRetained = objc_loadWeakRetained((id *)&v19->_paymentDataProvider);
  if (objc_opt_respondsToSelector())
  {
    v28 = &stru_1EF1B5B50;
    id v29 = objc_loadWeakRetained((id *)&v19->_paymentDataProvider);
    int v30 = [v29 supportsLowPowerExpressMode];

    if (v30) {
      v28 = @"_LPEM";
    }
  }
  else
  {

    v28 = &stru_1EF1B5B50;
  }
  if (v17 < 2)
  {
    if (v17 == 1)
    {
      v52 = [v15 allKeys];
      char v53 = [v52 objectAtIndexedSubscript:0];
      v54 = [(PKPassbookSettingsController *)v19 passWithUniqueIdentifier:v53];
      NSRange v36 = [v54 localizedDescription];

      uint64_t v55 = [@"SETTINGS_EXPRESS_TRANSIT_SECTION_FOOTER_ONE_CARD" stringByAppendingString:v28];
      char v56 = v55;
      if (v36) {
        PKLocalizedPaymentString(v55, &stru_1EF1B4C70.isa, v36);
      }
      else {
      uint64_t v57 = [(PKPassbookSettingsController *)v19 _fallbackExpressTransitFooterText];
      }
      expressTransitSectionFooterText = v19->_expressTransitSectionFooterText;
      v19->_expressTransitSectionFooterText = (NSString *)v57;
    }
    else
    {
      uint64_t v58 = [(PKPassbookSettingsController *)v19 _fallbackExpressTransitFooterText];
      NSRange v36 = v19->_expressTransitSectionFooterText;
      v19->_expressTransitSectionFooterText = (NSString *)v58;
    }
    goto LABEL_64;
  }
  BOOL v69 = v3;
  v70 = v5;
  id v71 = v4;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v31 = [v15 allValues];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v73 objects:v81 count:16];
  if (!v32)
  {

    NSRange v36 = 0;
    v35 = 0;
    goto LABEL_54;
  }
  uint64_t v33 = v32;
  uint64_t v67 = v28;
  uint64_t v68 = v15;
  char v34 = 0;
  v35 = 0;
  NSRange v36 = 0;
  uint64_t v37 = *(void *)v74;
  do
  {
    uint64_t v38 = 0;
    do
    {
      if (*(void *)v74 != v37) {
        objc_enumerationMutation(v31);
      }
      uint64_t v39 = *(void **)(*((void *)&v73 + 1) + 8 * v38);
      v40 = [v39 passInformation];
      uint64_t v41 = [v40 cardType];

      if (v35) {
        BOOL v42 = v41 == 2;
      }
      else {
        BOOL v42 = 0;
      }
      char v43 = v42;
      if (!v35 && v41 == 2)
      {
        v35 = [v39 passUniqueIdentifier];
LABEL_37:
        uint64_t v44 = v36;
LABEL_38:
        id v45 = v44;

        NSRange v36 = v45;
        goto LABEL_39;
      }
      if (v36) {
        goto LABEL_37;
      }
      if (v41 != 1)
      {
        uint64_t v44 = 0;
        goto LABEL_38;
      }
      NSRange v36 = [v39 passUniqueIdentifier];
LABEL_39:
      v34 |= v43;
      ++v38;
    }
    while (v33 != v38);
    uint64_t v46 = [v31 countByEnumeratingWithState:&v73 objects:v81 count:16];
    uint64_t v33 = v46;
  }
  while (v46);

  if (v34)
  {
    long long v19 = self;
    v47 = [(PKPassbookSettingsController *)self passWithUniqueIdentifier:v36];
    int v48 = [v47 localizedDescription];

    v49 = [@"SETTINGS_EXPRESS_TRANSIT_SECTION_FOOTER_MANY_CARDS" stringByAppendingString:v67];
    int v50 = v49;
    if (v48) {
      PKLocalizedPaymentString(v49, &stru_1EF1B4C70.isa, v48);
    }
    else {
    uint64_t v51 = [(PKPassbookSettingsController *)self _fallbackExpressTransitFooterText];
    }
    v62 = self->_expressTransitSectionFooterText;
    self->_expressTransitSectionFooterText = v51;
    id v15 = v68;
    goto LABEL_63;
  }
  long long v19 = self;
  v28 = v67;
  id v15 = v68;
LABEL_54:
  int v59 = [(PKPassbookSettingsController *)v19 passWithUniqueIdentifier:v36];
  int v48 = [v59 localizedDescription];

  char v60 = [(PKPassbookSettingsController *)v19 passWithUniqueIdentifier:v35];
  int v50 = [v60 localizedDescription];

  int v61 = [@"SETTINGS_EXPRESS_TRANSIT_SECTION_FOOTER_TWO_CARDS" stringByAppendingString:v28];
  v62 = v61;
  if (v48 && v50)
  {
    uint64_t v63 = PKLocalizedPaymentString(v61, &stru_1EF1B5770.isa, v48, v50);
  }
  else
  {
    uint64_t v63 = [(PKPassbookSettingsController *)v19 _fallbackExpressTransitFooterText];
  }
  v64 = v19->_expressTransitSectionFooterText;
  v19->_expressTransitSectionFooterText = (NSString *)v63;

LABEL_63:
  id v5 = v70;
  uint64_t v4 = v71;
  BOOL v3 = v69;
LABEL_64:

  if (v3)
  {
    id v66 = objc_loadWeakRetained((id *)&v19->_delegate);
    [v66 settingsControllerRequestsReloadSpecifiers:v19];
  }
}

- (void)refreshPeerPaymentStatus
{
  id v7 = [(PKPassbookSettingsController *)self _peerPaymentSwitchSpecifier];
  BOOL v3 = [v7 objectForKeyedSubscript:@"PKSwitchSpinnerTableCellShowSpinner"];
  char v4 = [v3 BOOLValue];

  if ((v4 & 1) == 0)
  {
    id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[PKPassbookSettingsController _isPeerPaymentRegistered](self, "_isPeerPaymentRegistered"));
    [v7 setObject:v5 forKeyedSubscript:@"PKSwitchSpinnerTableCellSwitchIsOn"];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained settingsController:self requestsReloadSpecifier:v7];
  }
}

- (void)_refreshAccountSpecifiers
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained settingsControllerRequestsReloadSpecifiers:self];
}

- (id)passWithUniqueIdentifier:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = self->_paymentPasses;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v24 != v8) {
        objc_enumerationMutation(v5);
      }
      int v10 = *(void **)(*((void *)&v23 + 1) + 8 * v9);
      uint64_t v11 = [v10 uniqueID];
      char v12 = [v11 isEqualToString:v4];

      if (v12) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
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

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v5 = self->_otherPasses;
    id v13 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (!v13) {
      goto LABEL_19;
    }
    uint64_t v14 = *(void *)v20;
LABEL_11:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v20 != v14) {
        objc_enumerationMutation(v5);
      }
      int v10 = *(void **)(*((void *)&v19 + 1) + 8 * v15);
      uint64_t v16 = objc_msgSend(v10, "uniqueID", (void)v19);
      char v17 = [v16 isEqualToString:v4];

      if (v17) {
        break;
      }
      if (v13 == (id)++v15)
      {
        id v13 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v13) {
          goto LABEL_11;
        }
        goto LABEL_19;
      }
    }
  }
  id v13 = v10;
LABEL_19:

  return v13;
}

- (id)rendererStateForPaymentPass:(id)a3
{
  id v4 = [a3 uniqueID];
  id v5 = [(PKPassbookSettingsController *)self _specifierForPassUniqueID:v4];

  uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F93220]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v6 rendererState];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)addCardTapped
{
  v13[2] = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(PKPassbookSettingsController *)self _paymentSetupContextForSettingsContext:self->_context];
  id v4 = (void **)MEMORY[0x1E4F87008];
  if (v3 != 4) {
    id v4 = (void **)MEMORY[0x1E4F87058];
  }
  id v5 = *v4;
  uint64_t v6 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v7 = *MEMORY[0x1E4F86120];
  v12[0] = *MEMORY[0x1E4F86308];
  v12[1] = v7;
  uint64_t v8 = *MEMORY[0x1E4F86AB0];
  v13[0] = *MEMORY[0x1E4F86380];
  v13[1] = v8;
  uint64_t v9 = (void *)MEMORY[0x1E4F1C9E8];
  id v10 = v5;
  uint64_t v11 = [v9 dictionaryWithObjects:v13 forKeys:v12 count:2];
  [v6 subject:v10 sendEvent:v11];

  [(PKPassbookSettingsController *)self openPaymentSetupWithMode:0 referrerIdentifier:0 allowedFeatureIdentifiers:0];
}

- (void)addCardTappedForPaymentPassWithSpecifier:(id)a3
{
  id v4 = [a3 propertyForKey:*MEMORY[0x1E4F93188]];
  [(PKPassbookSettingsController *)self addCardTappedForPaymentPassWithUniqueID:v4 withCompletion:0];
}

- (void)addCardTappedForPaymentPassWithUniqueID:(id)a3
{
}

- (void)addCardTappedForPaymentPassWithUniqueID:(id)a3 withCompletion:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v8 = self->_companionPasses;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v30 objects:v37 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v31;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v31 != v11) {
        objc_enumerationMutation(v8);
      }
      id v13 = *(void **)(*((void *)&v30 + 1) + 8 * v12);
      uint64_t v14 = [v13 uniqueID];
      char v15 = [v14 isEqualToString:v6];

      if (v15) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v30 objects:v37 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v16 = v13;

    if (v16) {
      goto LABEL_21;
    }
  }
  else
  {
LABEL_9:
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  char v17 = self->_pendingCompanionPasses;
  uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v27;
LABEL_13:
    uint64_t v21 = 0;
    while (1)
    {
      if (*(void *)v27 != v20) {
        objc_enumerationMutation(v17);
      }
      long long v22 = *(void **)(*((void *)&v26 + 1) + 8 * v21);
      long long v23 = objc_msgSend(v22, "uniqueID", (void)v26);
      char v24 = [v23 isEqualToString:v6];

      if (v24) {
        break;
      }
      if (v19 == ++v21)
      {
        uint64_t v19 = [(NSArray *)v17 countByEnumeratingWithState:&v26 objects:v36 count:16];
        if (v19) {
          goto LABEL_13;
        }
        goto LABEL_19;
      }
    }
    id v16 = v22;

    if (!v16) {
      goto LABEL_22;
    }
LABEL_21:
    [(PKPassbookSettingsController *)self _performPhoneToWatchProvisioningForPaymentPass:v16 withCompletion:v7];
  }
  else
  {
LABEL_19:

LABEL_22:
    long long v25 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v35 = v6;
      _os_log_impl(&dword_19F450000, v25, OS_LOG_TYPE_DEFAULT, "No companion payment pass with unique ID %@. Not starting provisioning.", buf, 0xCu);
    }

    if (v7) {
      v7[2](v7, 0);
    }
  }
}

- (void)openPeerPaymentSetupWithCurrencyAmount:(id)a3 state:(unint64_t)a4 senderAddress:(id)a5
{
  if (!self->_registeringForPeerPayment)
  {
    self->_registeringForPeerPayment = 1;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __91__PKPassbookSettingsController_openPeerPaymentSetupWithCurrencyAmount_state_senderAddress___block_invoke;
    v5[3] = &unk_1E59CB6D8;
    v5[4] = self;
    [(PKPassbookSettingsController *)self _presentPeerPaymentSetupFlowWithAmount:a3 flowState:a4 senderAddress:a5 completion:v5];
  }
}

uint64_t __91__PKPassbookSettingsController_openPeerPaymentSetupWithCurrencyAmount_state_senderAddress___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 456) = 0;
  return [*(id *)(a1 + 32) _refreshPasses];
}

- (int64_t)_paymentPreferencesStyle
{
  if (self->_context == 1) {
    return 2;
  }
  else {
    return 1;
  }
}

- (id)watchPassReaderIdentifiers
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (self->_context == 1)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v4 = self->_paymentPasses;
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v23 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = [*(id *)(*((void *)&v22 + 1) + 8 * i) pairedTerminalIdentifier];
          if (v9) {
            [v3 addObject:v9];
          }
        }
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v6);
    }

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v10 = self->_otherPasses;
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          char v15 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * j), "pairedTerminalIdentifier", (void)v18);
          if (v15) {
            [v3 addObject:v15];
          }
        }
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v12);
    }

    if ([v3 count]) {
      id v16 = (void *)[v3 copy];
    }
    else {
      id v16 = 0;
    }
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (BOOL)canShareCompanionPass:(id)a3
{
  if (self->_context != 1) {
    return 0;
  }
  id v4 = [a3 devicePrimaryPaymentApplication];
  uint64_t v5 = [v4 subcredentials];
  uint64_t v6 = [v5 anyObject];

  if (v6)
  {
    int v7 = [v6 isSharedCredential];
    uint64_t v8 = 568;
    if (v7) {
      uint64_t v8 = 569;
    }
    BOOL v9 = *((unsigned char *)&self->super.isa + v8) != 0;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)openPaymentSetupWithMode:(int64_t)a3 referrerIdentifier:(id)a4 allowedFeatureIdentifiers:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  [(PKPassbookSettingsController *)self _updateAddButtonSpecifier];
  uint64_t v10 = *MEMORY[0x1E4F93130];
  uint64_t v11 = [(PSSpecifier *)self->_addCardButtonSpecifier objectForKeyedSubscript:*MEMORY[0x1E4F93130]];
  if (([v11 BOOLValue] & 1) == 0)
  {
LABEL_10:

    goto LABEL_11;
  }
  uint64_t v12 = [(PSSpecifier *)self->_addCardButtonSpecifier objectForKeyedSubscript:@"PKSettingsSpecifierLoadingKey"];
  char v13 = [v12 BOOLValue];

  if ((v13 & 1) == 0)
  {
    uint64_t v11 = PKUIStoreDemoGatewayViewController();
    if (v11)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained settingsController:self requestsPresentViewController:v11 animated:1 completion:0];
    }
    else
    {
      [(PSSpecifier *)self->_addCardButtonSpecifier setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v10];
      [(PSSpecifier *)self->_addCardButtonSpecifier setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"PKSettingsSpecifierLoadingKey"];
      [(PKPassbookSettingsController *)self _updateCompanionPassesAddButton];
      id v15 = objc_loadWeakRetained((id *)&self->_delegate);
      [v15 settingsController:self requestsReloadSpecifier:self->_addCardButtonSpecifier];

      if (PKUserInterfaceIdiom() == 1
        && PKSafariCredentialProvisioningEnabled()
        && !PKSafariCredentialProvisioningConsented())
      {
        objc_initWeak(&location, self);
        id v16 = (void *)MEMORY[0x1E4F84F68];
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __102__PKPassbookSettingsController_openPaymentSetupWithMode_referrerIdentifier_allowedFeatureIdentifiers___block_invoke;
        v17[3] = &unk_1E59D1A48;
        objc_copyWeak(v20, &location);
        v20[1] = (id)a3;
        id v18 = v8;
        id v19 = v9;
        [v16 hasSafariCredentials:v17];

        objc_destroyWeak(v20);
        objc_destroyWeak(&location);
      }
      [(PKPassbookSettingsController *)self startPreflightWithMode:a3 referrerIdentifier:v8 allowedFeatureIdentifiers:v9];
    }
    goto LABEL_10;
  }
LABEL_11:
}

void __102__PKPassbookSettingsController_openPaymentSetupWithMode_referrerIdentifier_allowedFeatureIdentifiers___block_invoke(id *a1, char a2, uint64_t a3, char a4)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __102__PKPassbookSettingsController_openPaymentSetupWithMode_referrerIdentifier_allowedFeatureIdentifiers___block_invoke_2;
  block[3] = &unk_1E59D1A20;
  objc_copyWeak(v10, a1 + 6);
  char v11 = a2;
  char v12 = a4;
  v10[1] = a1[7];
  id v8 = a1[4];
  id v9 = a1[5];
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(v10);
}

void __102__PKPassbookSettingsController_openPaymentSetupWithMode_referrerIdentifier_allowedFeatureIdentifiers___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(unsigned char *)(a1 + 64) && *(unsigned char *)(a1 + 65))
    {
      id v4 = [PKVirtualCardPrivacyExplanationViewController alloc];
      uint64_t v10 = MEMORY[0x1E4F143A8];
      uint64_t v11 = 3221225472;
      char v12 = __102__PKPassbookSettingsController_openPaymentSetupWithMode_referrerIdentifier_allowedFeatureIdentifiers___block_invoke_3;
      char v13 = &unk_1E59D19F8;
      uint64_t v5 = *(void *)(a1 + 56);
      uint64_t v14 = v3;
      uint64_t v17 = v5;
      id v15 = *(id *)(a1 + 32);
      id v16 = *(id *)(a1 + 40);
      uint64_t v6 = [(PKVirtualCardPrivacyExplanationViewController *)v4 initWithContext:3 referralSource:2 resultCallback:&v10];
      int v7 = [PKNavigationController alloc];
      id v8 = -[PKNavigationController initWithRootViewController:](v7, "initWithRootViewController:", v6, v10, v11, v12, v13, v14);
      [(PKNavigationController *)v8 setNavigationBarHidden:1];
      [(PKNavigationController *)v8 setModalInPresentation:1];
      [(PKNavigationController *)v8 setModalPresentationStyle:2];
      id v9 = objc_loadWeakRetained(v3 + 81);
      [v9 settingsController:v3 requestsPresentViewController:v8 animated:1 completion:0];
    }
    else
    {
      [WeakRetained startPreflightWithMode:*(void *)(a1 + 56) referrerIdentifier:*(void *)(a1 + 32) allowedFeatureIdentifiers:*(void *)(a1 + 40)];
    }
  }
}

void *__102__PKPassbookSettingsController_openPaymentSetupWithMode_referrerIdentifier_allowedFeatureIdentifiers___block_invoke_3(void *a1)
{
  result = (void *)a1[4];
  if (result) {
    return (void *)[result startPreflightWithMode:a1[7] referrerIdentifier:a1[5] allowedFeatureIdentifiers:a1[6]];
  }
  return result;
}

- (void)startPreflightWithMode:(int64_t)a3 referrerIdentifier:(id)a4 allowedFeatureIdentifiers:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __100__PKPassbookSettingsController_startPreflightWithMode_referrerIdentifier_allowedFeatureIdentifiers___block_invoke;
  void v13[3] = &unk_1E59D1A98;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  [WeakRetained settingsController:self requestsAddCardPreflightWithCompletion:v13];
}

void __100__PKPassbookSettingsController_startPreflightWithMode_referrerIdentifier_allowedFeatureIdentifiers___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__PKPassbookSettingsController_startPreflightWithMode_referrerIdentifier_allowedFeatureIdentifiers___block_invoke_2;
  block[3] = &unk_1E59D1A70;
  char v20 = a2;
  id v9 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v15 = v7;
  id v16 = v9;
  id v10 = *(id *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  id v18 = v8;
  uint64_t v19 = v11;
  id v17 = v10;
  id v12 = v8;
  id v13 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __100__PKPassbookSettingsController_startPreflightWithMode_referrerIdentifier_allowedFeatureIdentifiers___block_invoke_2(uint64_t a1)
{
  v34[1] = *MEMORY[0x1E4F143B8];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __100__PKPassbookSettingsController_startPreflightWithMode_referrerIdentifier_allowedFeatureIdentifiers___block_invoke_3;
  aBlock[3] = &unk_1E59CA7D0;
  aBlock[4] = *(void *)(a1 + 32);
  uint64_t v2 = (void (**)(void))_Block_copy(aBlock);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 648));
  [WeakRetained settingsControllerRequestsReloadSpecifiers:*(void *)(a1 + 32)];

  if (*(unsigned char *)(a1 + 80))
  {
    id v4 = *(id *)(a1 + 40);
    uint64_t v5 = [v4 provisioningController];
    [v5 setReferrerIdentifier:*(void *)(a1 + 48)];
    [v5 setAllowedFeatureIdentifiers:*(void *)(a1 + 56)];
    if (PKIsAltAccountPairedOrPairing() && *(void *)(*(void *)(a1 + 32) + 40) == 1) {
      [v5 setIsProvisioningForAltAccount:1];
    }
    [v4 setCustomFormSheetPresentationStyleForiPad];
    [v4 setPaymentSetupMode:*(void *)(a1 + 72)];
    uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 8) setupDelegate];

    if (v6)
    {
      id v7 = [*(id *)(*(void *)(a1 + 32) + 8) setupDelegate];
      [v4 setSetupDelegate:v7];
    }
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __100__PKPassbookSettingsController_startPreflightWithMode_referrerIdentifier_allowedFeatureIdentifiers___block_invoke_4;
    v25[3] = &unk_1E59CF8D8;
    v25[4] = *(void *)(a1 + 32);
    id v26 = v4;
    long long v27 = v2;
    id v8 = v4;
    [v8 preflightWithCompletion:v25];

    goto LABEL_21;
  }
  v2[2](v2);
  if (*(void *)(a1 + 40))
  {
    uint64_t v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 648));
    [v5 settingsController:*(void *)(a1 + 32) requestsPresentViewController:*(void *)(a1 + 40) animated:1 completion:0];
    goto LABEL_21;
  }
  id v9 = [*(id *)(a1 + 64) domain];
  int v10 = [v9 isEqualToString:*MEMORY[0x1E4F871A0]];

  if (!v10) {
    goto LABEL_17;
  }
  uint64_t v11 = [*(id *)(a1 + 64) code];
  id v12 = *(void **)(a1 + 64);
  if (v11 == 6)
  {
    id v13 = v12;
    id v14 = (void *)MEMORY[0x1E4F843E0];
    v34[0] = *MEMORY[0x1E4F87068];
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
    uint64_t v16 = *MEMORY[0x1E4F86730];
    v32[0] = *MEMORY[0x1E4F86308];
    v32[1] = v16;
    uint64_t v17 = *MEMORY[0x1E4F86E20];
    v33[0] = *MEMORY[0x1E4F864A0];
    v33[1] = v17;
    id v18 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v19 = v33;
    char v20 = v32;
  }
  else
  {
    if ([v12 code] != 9)
    {
LABEL_17:
      uint64_t v5 = +[PKPaymentSetupNavigationController viewControllerForPresentingPaymentError:*(void *)(a1 + 64)];
      id v13 = 0;
      goto LABEL_18;
    }
    id v13 = *(id *)(a1 + 64);
    id v14 = (void *)MEMORY[0x1E4F843E0];
    uint64_t v31 = *MEMORY[0x1E4F87068];
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
    uint64_t v21 = *MEMORY[0x1E4F86730];
    v29[0] = *MEMORY[0x1E4F86308];
    v29[1] = v21;
    uint64_t v22 = *MEMORY[0x1E4F86F20];
    v30[0] = *MEMORY[0x1E4F864A0];
    v30[1] = v22;
    id v18 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v19 = v30;
    char v20 = v29;
  }
  long long v23 = [v18 dictionaryWithObjects:v19 forKeys:v20 count:2];
  [v14 subjects:v15 sendEvent:v23];

  if (!v13) {
    goto LABEL_17;
  }
  uint64_t v5 = PKAlertForDisplayableErrorWithHandlers(v13, 0, 0, 0);
LABEL_18:
  if (v5)
  {
    id v24 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 648));
    [v24 settingsController:*(void *)(a1 + 32) requestsPresentViewController:v5 animated:1 completion:0];
  }
LABEL_21:
}

void __100__PKPassbookSettingsController_startPreflightWithMode_referrerIdentifier_allowedFeatureIdentifiers___block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 336) setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F93130]];
  [*(id *)(*(void *)(a1 + 32) + 336) setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"PKSettingsSpecifierLoadingKey"];
  [*(id *)(a1 + 32) _updateCompanionPassesAddButton];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 648));
  [WeakRetained settingsController:*(void *)(a1 + 32) requestsReloadSpecifier:*(void *)(*(void *)(a1 + 32) + 336)];
}

void __100__PKPassbookSettingsController_startPreflightWithMode_referrerIdentifier_allowedFeatureIdentifiers___block_invoke_4(void *a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 648));
    [WeakRetained settingsController:a1[4] requestsPresentViewController:a1[5] animated:1 completion:a1[6]];
  }
}

- (id)_passSpecifiersForPasses:(id)a3
{
  return [(PKPassbookSettingsController *)self _passSpecifiersForPasses:a3 peerPaymentPassUniqueID:0 showPeerPaymentSetup:0];
}

- (id)_passSpecifiersForPasses:(id)a3 peerPaymentPassUniqueID:(id)a4 showPeerPaymentSetup:(BOOL)a5
{
  id v8 = a4;
  id v9 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v10 = a3;
  id v11 = objc_alloc_init(v9);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __102__PKPassbookSettingsController__passSpecifiersForPasses_peerPaymentPassUniqueID_showPeerPaymentSetup___block_invoke;
  v28[3] = &unk_1E59D1AC0;
  id v12 = v8;
  id v29 = v12;
  id v13 = [v10 sortedArrayUsingComparator:v28];

  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  uint64_t v21 = __102__PKPassbookSettingsController__passSpecifiersForPasses_peerPaymentPassUniqueID_showPeerPaymentSetup___block_invoke_2;
  uint64_t v22 = &unk_1E59D1AE8;
  long long v23 = self;
  id v24 = v12;
  BOOL v27 = a5;
  id v25 = v13;
  id v26 = v11;
  id v14 = v11;
  id v15 = v13;
  id v16 = v12;
  [v15 enumerateObjectsUsingBlock:&v19];
  uint64_t v17 = objc_msgSend(v14, "copy", v19, v20, v21, v22, v23);

  return v17;
}

uint64_t __102__PKPassbookSettingsController__passSpecifiersForPasses_peerPaymentPassUniqueID_showPeerPaymentSetup___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!*(void *)(a1 + 32))
  {
LABEL_13:
    id v12 = [v5 ingestedDate];
    id v13 = [v6 ingestedDate];
    uint64_t v11 = [v12 compare:v13];

    goto LABEL_15;
  }
  if ([v5 hasAssociatedPeerPaymentAccount])
  {
    id v7 = [v5 uniqueID];
    int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];
  }
  else
  {
    int v8 = 0;
  }
  if (*(void *)(a1 + 32) && [v6 hasAssociatedPeerPaymentAccount])
  {
    id v9 = [v6 uniqueID];
    int v10 = [v9 isEqualToString:*(void *)(a1 + 32)];

    if (!v8)
    {
LABEL_12:
      if ((v10 ^ 1 | v8) != 1)
      {
        uint64_t v11 = 1;
        goto LABEL_15;
      }
      goto LABEL_13;
    }
  }
  else
  {
    int v10 = 0;
    if (!v8) {
      goto LABEL_12;
    }
  }
  if (v10) {
    goto LABEL_12;
  }
  uint64_t v11 = -1;
LABEL_15:

  return v11;
}

void __102__PKPassbookSettingsController__passSpecifiersForPasses_peerPaymentPassUniqueID_showPeerPaymentSetup___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v54 = a2;
  id v5 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:0 target:*(void *)(a1 + 32) set:0 get:0 detail:0 cell:3 edit:0];
  id v6 = sel__showCardDetails_;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F84E78]) initWithPass:v54 webService:*(void *)(*(void *)(a1 + 32) + 80)];
  int v8 = [v54 devicePrimaryPaymentApplication];
  if (v8)
  {
  }
  else
  {
    id v14 = [v7 devicePrimaryPrecursorRequest];

    if (v14)
    {
      uint64_t v15 = PKLocalizedPaymentString(&cfstr_PrecursorPassC.isa);
      goto LABEL_10;
    }
  }
  if ([v54 isAccessPass])
  {
    if ([v54 hasCredentials])
    {
      uint64_t v9 = 0;
      goto LABEL_26;
    }
    uint64_t v20 = [v54 provisioningCredentialHash];

    if (v20) {
      uint64_t v21 = (void *)MEMORY[0x1E4F87A28];
    }
    else {
      uint64_t v21 = (void *)MEMORY[0x1E4F87A30];
    }
    int v10 = [v54 fieldForKey:*v21];
    uint64_t v28 = [v10 value];
    [v5 setObject:v28 forKeyedSubscript:@"pkCustomSubTitle"];

    goto LABEL_24;
  }
  if ([v54 isStoredValuePass])
  {
    int v10 = [v54 uniqueID];
    uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 536) objectForKeyedSubscript:v10];
    [v5 setObject:v11 forKeyedSubscript:@"pkTransitServerBalance"];

    id v12 = *(id **)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained(v12 + 3);
    [v12 _reloadBalancesAndTransitPassPropertiesForPass:v54 withDataProvider:WeakRetained];

LABEL_24:
LABEL_25:
    uint64_t v9 = 1;
    goto LABEL_26;
  }
  if (![v54 hasAssociatedPeerPaymentAccount]) {
    goto LABEL_39;
  }
  uint64_t v22 = [v54 uniqueID];
  long long v23 = *(void **)(a1 + 40);
  id v24 = v22;
  id v25 = v23;
  if (v24 == v25)
  {

LABEL_34:
    if (PKStoreDemoModeEnabled())
    {
      uint64_t v37 = [*(id *)(*(void *)(a1 + 32) + 448) currentBalance];

      if (v37)
      {
        uint64_t v38 = [*(id *)(*(void *)(a1 + 32) + 448) currentBalance];
        uint64_t v39 = [v38 minimalFormattedStringValue];
        v40 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentInA.isa, &stru_1EF1B4C70.isa, v39);
        [v5 setObject:v40 forKeyedSubscript:@"pkCustomSubTitle"];
      }
      uint64_t v18 = 0;
      uint64_t v19 = 0;
      id v6 = sel__presentFeatureNotEnabledForDemoForSpecifier_;
      goto LABEL_13;
    }
    if (!*(unsigned char *)(a1 + 64))
    {
      uint64_t v46 = [*(id *)(*(void *)(a1 + 32) + 448) state];
      if (v46 == 4)
      {
        int v48 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentSet_12.isa);
        [v5 setObject:v48 forKeyedSubscript:@"pkCustomSubTitle"];

        v49 = [MEMORY[0x1E4FB1618] systemRedColor];
        [v5 setObject:v49 forKeyedSubscript:@"pkCustomSubTitleColor"];

        uint64_t v18 = 0;
        uint64_t v19 = 0;
        id v6 = sel__presentPeerPaymentReOpenCardFlowForSpecifier_;
        goto LABEL_13;
      }
      if (v46 != 3)
      {
        int v50 = [v54 devicePrimaryPaymentApplication];
        uint64_t v51 = [v50 state];

        if (v51 == 7) {
          goto LABEL_25;
        }
        uint64_t v19 = [*(id *)(*(void *)(a1 + 32) + 448) currentBalance];

        if (!v19) {
          goto LABEL_52;
        }
        id v16 = [*(id *)(*(void *)(a1 + 32) + 448) currentBalance];
        v52 = [v16 minimalFormattedStringValue];
        char v53 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentInA.isa, &stru_1EF1B4C70.isa, v52);
        [v5 setObject:v53 forKeyedSubscript:@"pkCustomSubTitle"];

        goto LABEL_12;
      }
      v47 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentSet_11.isa);
      [v5 setObject:v47 forKeyedSubscript:@"pkCustomSubTitle"];

      id v16 = [MEMORY[0x1E4FB1618] systemRedColor];
      uint64_t v17 = PKPassbookCardTableCellCustomSubTitleColorKey;
LABEL_11:
      [v5 setObject:v16 forKeyedSubscript:*v17];
LABEL_12:

      uint64_t v18 = 0;
      uint64_t v19 = 0;
      goto LABEL_13;
    }
    id v6 = sel__presentPeerPaymentSetupFlowForSpecifier_;
    uint64_t v15 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentSet_10.isa);
LABEL_10:
    id v16 = (void *)v15;
    uint64_t v17 = PKPassbookCardTableCellCustomSubTitleKey;
    goto LABEL_11;
  }
  id v26 = v25;
  if (!v24 || !v25)
  {

    goto LABEL_39;
  }
  int v27 = [v24 isEqualToString:v25];

  if (v27) {
    goto LABEL_34;
  }
LABEL_39:
  uint64_t v41 = [v54 associatedAccountServiceAccountIdentifier];
  uint64_t v42 = [v41 length];

  if (v42)
  {
    if ((PKIsLowEndDevice() & 1) != 0 || [v54 associatedAccountFeatureIdentifier] == 3)
    {
      uint64_t v19 = 0;
    }
    else
    {
      uint64_t v19 = [[PKPassView alloc] initWithPass:v54 content:4 suppressedContent:1527 rendererState:0];
      [(PKPassView *)v19 setPaused:1];
      [v5 setObject:v19 forKeyedSubscript:@"pkSnapshotPassView"];
    }
    char v43 = [v54 isShellPass];
    uint64_t v44 = [v54 devicePrimaryPaymentApplication];
    [v44 state];
    if (PKPaymentApplicationStateIsPersonalized())
    {
    }
    else
    {
      char v45 = [v54 isShellPass];

      if ((v45 & 1) == 0)
      {
LABEL_51:
        if (v43)
        {
LABEL_52:
          uint64_t v18 = 0;
          goto LABEL_13;
        }
        if ([v54 activationState] == 1)
        {
          uint64_t v9 = 1;
          if (v19) {
            goto LABEL_28;
          }
          goto LABEL_27;
        }
        uint64_t v18 = 1;
LABEL_13:
        uint64_t v9 = 1;
        goto LABEL_30;
      }
    }
    [*(id *)(a1 + 32) _updateCardSpecifier:v5 withAccountStateForPaymentPass:v54];
    goto LABEL_51;
  }
  uint64_t v9 = [v54 isIdentityPass] ^ 1;
LABEL_26:
  if ([v54 activationState] == 1)
  {
LABEL_27:
    uint64_t v19 = [[PKPassView alloc] initWithPass:v54 content:4 suppressedContent:1527 rendererState:0];
LABEL_28:
    uint64_t v18 = 1;
    id v29 = -[PKPaymentVerificationController initWithPaymentPass:passView:webService:context:delegate:setupDelegate:verificationContext:]([PKPaymentVerificationController alloc], "initWithPaymentPass:passView:webService:context:delegate:setupDelegate:verificationContext:", v54, v19, *(void *)(*(void *)(a1 + 32) + 80), [*(id *)(a1 + 32) _paymentSetupContextForSettingsContext:*(void *)(*(void *)(a1 + 32) + 40)], 0, 0, 1);
    long long v30 = (void *)[objc_alloc(MEMORY[0x1E4F84BB8]) initWithWebService:*(void *)(*(void *)(a1 + 32) + 80)];
    [(PKPaymentVerificationController *)v29 setProvisioningController:v30];
    [v5 setObject:v29 forKeyedSubscript:@"pkVerificationController"];

    goto LABEL_30;
  }
  uint64_t v19 = 0;
  uint64_t v18 = 1;
LABEL_30:
  [v5 setObject:v54 forKeyedSubscript:@"pkPass"];
  [v5 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"pkShowAddButton"];
  uint64_t v31 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 48), "count") - 1 == a3);
  [v5 setObject:v31 forKeyedSubscript:@"pkShowFullSeparatorInset"];

  long long v32 = [NSNumber numberWithBool:v9];
  [v5 setObject:v32 forKeyedSubscript:@"pkShowSubTitle"];

  long long v33 = [NSNumber numberWithBool:v18];
  [v5 setObject:v33 forKeyedSubscript:@"pkShowState"];

  char v34 = [NSNumber numberWithInteger:*(void *)(*(void *)(a1 + 32) + 40)];
  [v5 setObject:v34 forKeyedSubscript:@"pkSettingsContext"];

  [v5 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x1E4F930A8]];
  [v5 setObject:&unk_1EF2B8E38 forKeyedSubscript:*MEMORY[0x1E4F93050]];
  +[PKPaymentPassTableCell heightForCellWithMinimum:1 hasSubTitle:56.0];
  id v35 = objc_msgSend(NSNumber, "numberWithDouble:");
  [v5 setObject:v35 forKeyedSubscript:*MEMORY[0x1E4F93218]];

  NSRange v36 = [v54 uniqueID];
  [v5 setObject:v36 forKeyedSubscript:*MEMORY[0x1E4F93188]];

  [v5 setControllerLoadAction:v6];
  [*(id *)(a1 + 56) addObject:v5];
}

- (id)_paymentPassSpecifiers
{
  paymentPassSpecifiers = self->_paymentPassSpecifiers;
  if (!paymentPassSpecifiers)
  {
    if (self->_paymentPasses)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_passLibraryDataProvider);
      id v5 = [WeakRetained peerPaymentPassUniqueID];

      if (self->_registeringForPeerPayment && v5)
      {
        paymentPasses = self->_paymentPasses;
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        void v12[2] = __54__PKPassbookSettingsController__paymentPassSpecifiers__block_invoke;
        v12[3] = &unk_1E59D1458;
        id v13 = v5;
        id v7 = [(NSArray *)paymentPasses pk_objectsPassingTest:v12];
        int v8 = self->_paymentPasses;
        self->_paymentPasses = v7;
      }
      [(PKPassbookSettingsController *)self _passSpecifiersForPasses:self->_paymentPasses peerPaymentPassUniqueID:v5 showPeerPaymentSetup:[(PKPeerPaymentAccountResolutionController *)self->_peerPaymentAccountResolutionController currentPeerPaymentAccountResolution] == 1];
      uint64_t v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
      int v10 = self->_paymentPassSpecifiers;
      self->_paymentPassSpecifiers = v9;

      paymentPassSpecifiers = self->_paymentPassSpecifiers;
    }
    else
    {
      paymentPassSpecifiers = 0;
    }
  }

  return paymentPassSpecifiers;
}

uint64_t __54__PKPassbookSettingsController__paymentPassSpecifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 hasAssociatedPeerPaymentAccount])
  {
    id v4 = [v3 uniqueID];
    uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)] ^ 1;
  }
  else
  {
    uint64_t v5 = 1;
  }

  return v5;
}

- (id)_otherPassSpecifiers
{
  otherPassSpecifiers = self->_otherPassSpecifiers;
  if (!otherPassSpecifiers)
  {
    if (self->_otherPasses)
    {
      -[PKPassbookSettingsController _passSpecifiersForPasses:](self, "_passSpecifiersForPasses:");
      id v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
      uint64_t v5 = self->_otherPassSpecifiers;
      self->_otherPassSpecifiers = v4;

      otherPassSpecifiers = self->_otherPassSpecifiers;
    }
    else
    {
      otherPassSpecifiers = 0;
    }
  }

  return otherPassSpecifiers;
}

- (id)_pendingCompanionPassSpecifiers
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  pendingCompanionPassSpecifiers = self->_pendingCompanionPassSpecifiers;
  if (!pendingCompanionPassSpecifiers)
  {
    pendingCompanionPassSpecifiers = self->_pendingCompanionPasses;
    if (pendingCompanionPassSpecifiers)
    {
      uint64_t v5 = (void *)[(NSArray *)pendingCompanionPassSpecifiers copy];
      uint64_t v11 = MEMORY[0x1E4F143A8];
      uint64_t v12 = 3221225472;
      id v13 = __63__PKPassbookSettingsController__pendingCompanionPassSpecifiers__block_invoke;
      id v14 = &unk_1E59D1B10;
      uint64_t v15 = self;
      id v6 = v3;
      id v16 = v6;
      [v5 enumerateObjectsUsingBlock:&v11];

      id v7 = (NSArray *)objc_msgSend(v6, "copy", v11, v12, v13, v14, v15);
      int v8 = self->_pendingCompanionPassSpecifiers;
      self->_pendingCompanionPassSpecifiers = v7;

      pendingCompanionPassSpecifiers = self->_pendingCompanionPassSpecifiers;
    }
  }
  uint64_t v9 = pendingCompanionPassSpecifiers;

  return v9;
}

void __63__PKPassbookSettingsController__pendingCompanionPassSpecifiers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v35 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:0 target:*(void *)(a1 + 32) set:0 get:0 detail:0 cell:3 edit:0];
  uint64_t v37 = v3;
  if ([v3 isIdentityPass])
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v34 = a1;
    obuint64_t j = *(id *)(*(void *)(a1 + 32) + 320);
    uint64_t v4 = [obj countByEnumeratingWithState:&v38 objects:v50 count:16];
    if (!v4) {
      goto LABEL_46;
    }
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v39;
    while (1)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v39 != v6) {
          objc_enumerationMutation(obj);
        }
        int v8 = *(void **)(*((void *)&v38 + 1) + 8 * v7);
        uint64_t v9 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int v10 = [v8 state];
          uint64_t v11 = [v8 target];
          uint64_t v12 = [v8 state];
          id v13 = [v8 country];
          *(_DWORD *)buf = 134218754;
          uint64_t v43 = (uint64_t)v10;
          __int16 v44 = 2048;
          uint64_t v45 = v11;
          __int16 v46 = 2112;
          v47 = v12;
          __int16 v48 = 2112;
          v49 = v13;
          _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "Checking for match with config %lu/%lu/%@/%@", buf, 0x2Au);
        }
        if ([v8 target] == 2)
        {
          id v14 = [v37 issuerAdministrativeAreaCode];
          uint64_t v15 = [v8 state];
          id v16 = v14;
          id v17 = v15;
          uint64_t v18 = v17;
          if (v16 == v17)
          {

            goto LABEL_16;
          }
          if (v16 && v17)
          {
            uint64_t v19 = [v16 caseInsensitiveCompare:v17];

            if (!v19)
            {
LABEL_16:
              uint64_t v20 = [v37 issuerCountryCode];
              uint64_t v21 = [v8 country];
              id v22 = v20;
              id v23 = v21;
              if (v22 == v23)
              {

                goto LABEL_23;
              }
              id v24 = v23;
              if (v22 && v23)
              {
                uint64_t v25 = [v22 caseInsensitiveCompare:v23];

                if (v25) {
                  goto LABEL_30;
                }
LABEL_23:
                if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v26 = [v8 status];
                  *(_DWORD *)buf = 134217984;
                  uint64_t v43 = v26;
                  _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "Config status %lu", buf, 0xCu);
                }

                id v16 = 0;
                uint64_t v27 = [v8 status];
                uint64_t v28 = @"CARD_TYPE_IDENTITY_PENDING";
                switch(v27)
                {
                  case 0:
                    uint64_t v28 = @"CARD_TYPE_IDENTITY_ACTION_REQUIRED";
                    goto LABEL_42;
                  case 1:
                    goto LABEL_42;
                  case 2:
                    uint64_t v28 = @"CARD_TYPE_IDENTITY_READY";
                    goto LABEL_42;
                  case 4:
                    uint64_t v28 = @"CARD_TYPE_IDENTITY_AUTH_CODE";
                    goto LABEL_42;
                  case 5:
                    uint64_t v28 = @"CARD_TYPE_IDENTITY_RETRY_ADDING";
                    goto LABEL_42;
                  case 6:
                  case 8:
                    uint64_t v28 = @"CARD_TYPE_IDENTITY_UNABLE_TO_ADD";
                    goto LABEL_42;
                  case 7:
                    uint64_t v28 = @"CARD_TYPE_IDENTITY_CANNOT_ADD";
                    goto LABEL_42;
                  case 9:
                    if (PKUseWLAN()) {
                      uint64_t v28 = @"CARD_TYPE_IDENTITY_WAITING_WLAN";
                    }
                    else {
                      uint64_t v28 = @"CARD_TYPE_IDENTITY_WAITING_WIFI";
                    }
                    goto LABEL_42;
                  case 10:
                    uint64_t v28 = @"CARD_TYPE_IDENTITY_RETRY_AUTH_CODE";
                    goto LABEL_42;
                  case 12:
                    uint64_t v28 = @"CARD_TYPE_IDENTITY_LIVENESS_STEP_UP";
LABEL_42:
                    PKLocalizedIdentityString(&v28->isa);
                    id v16 = (id)objc_claimAutoreleasedReturnValue();
                    break;
                  default:
                    break;
                }
                if ([v16 length]) {
                  [v35 setObject:v16 forKeyedSubscript:@"pkCustomSubTitle"];
                }
LABEL_29:

                goto LABEL_30;
              }
            }
          }
          else
          {
          }
          goto LABEL_29;
        }
LABEL_30:
        ++v7;
      }
      while (v5 != v7);
      uint64_t v29 = [obj countByEnumeratingWithState:&v38 objects:v50 count:16];
      uint64_t v5 = v29;
      if (!v29)
      {
LABEL_46:

        a1 = v34;
        break;
      }
    }
  }
  [v35 setObject:v37 forKeyedSubscript:@"pkPass"];
  long long v30 = [NSNumber numberWithBool:1];
  [v35 setObject:v30 forKeyedSubscript:@"pkShowSubTitle"];

  [v35 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"pkShowState"];
  uint64_t v31 = [NSNumber numberWithInteger:*(void *)(*(void *)(a1 + 32) + 40)];
  [v35 setObject:v31 forKeyedSubscript:@"pkSettingsContext"];

  [v35 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x1E4F930A8]];
  [v35 setObject:&unk_1EF2B8E38 forKeyedSubscript:*MEMORY[0x1E4F93050]];
  +[PKPaymentPassTableCell heightForCellWithMinimum:1 hasSubTitle:56.0];
  long long v32 = objc_msgSend(NSNumber, "numberWithDouble:");
  [v35 setObject:v32 forKeyedSubscript:*MEMORY[0x1E4F93218]];

  long long v33 = [v37 uniqueID];
  [v35 setObject:v33 forKeyedSubscript:*MEMORY[0x1E4F93188]];

  [v35 setControllerLoadAction:sel_addCardTappedForPaymentPassWithSpecifier_];
  [*(id *)(a1 + 40) addObject:v35];
}

- (id)_companionPassSpecifiers
{
  companionPassSpecifiers = self->_companionPassSpecifiers;
  if (!companionPassSpecifiers)
  {
    if (self->_companionPasses)
    {
      uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
      if (objc_opt_respondsToSelector()) {
        char v5 = [(PKPassbookSettingsDataSource *)self->_dataSource hasFelicaSecureElement];
      }
      else {
        char v5 = 0;
      }
      char v6 = objc_opt_respondsToSelector() & 1;
      char v7 = objc_opt_respondsToSelector() & 1;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_passLibraryDataProvider);
      char v9 = [WeakRetained canAddPaymentPass];

      if (v9)
      {
        char v10 = 1;
      }
      else
      {
        uint64_t v11 = [(PKPaymentWebService *)self->_webService targetDevice];
        uint64_t v12 = [v11 deviceRegion];
        id v13 = v12;
        if (v12 == @"PR")
        {
          char v10 = 1;
        }
        else if (v12)
        {
          char v10 = [(__CFString *)v12 isEqualToString:@"PR"];
        }
        else
        {
          char v10 = 0;
        }
      }
      companionPasses = self->_companionPasses;
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __56__PKPassbookSettingsController__companionPassSpecifiers__block_invoke;
      v31[3] = &__block_descriptor_33_e27_q24__0__PKPass_8__PKPass_16l;
      char v32 = v5;
      uint64_t v15 = [(NSArray *)companionPasses sortedArrayUsingComparator:v31];
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      id v22 = __56__PKPassbookSettingsController__companionPassSpecifiers__block_invoke_2;
      id v23 = &unk_1E59D1B58;
      char v26 = v5;
      char v27 = v6;
      char v28 = v7;
      char v29 = v9;
      char v30 = v10;
      id v24 = self;
      id v25 = v4;
      id v16 = v4;
      [v15 enumerateObjectsUsingBlock:&v20];
      id v17 = (NSArray *)objc_msgSend(v16, "copy", v20, v21, v22, v23, v24);
      uint64_t v18 = self->_companionPassSpecifiers;
      self->_companionPassSpecifiers = v17;

      companionPassSpecifiers = self->_companionPassSpecifiers;
    }
    else
    {
      companionPassSpecifiers = 0;
    }
  }

  return companionPassSpecifiers;
}

uint64_t __56__PKPassbookSettingsController__companionPassSpecifiers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  char v7 = [v5 ingestedDate];
  int v8 = [v6 ingestedDate];
  uint64_t v9 = [v7 compare:v8];

  if (!*(unsigned char *)(a1 + 32))
  {
    char v10 = [v5 paymentPass];
    uint64_t v11 = v10;
    if (v10)
    {
      uint64_t v12 = [v10 devicePrimaryPaymentApplication];
      BOOL v13 = [v12 paymentNetworkIdentifier] != 103;
    }
    else
    {
      BOOL v13 = 1;
    }
    id v14 = [v6 paymentPass];
    uint64_t v15 = v14;
    if (v14)
    {
      id v16 = [v14 devicePrimaryPaymentApplication];
      uint64_t v17 = [v16 paymentNetworkIdentifier];

      if (v17 == 103 || v13) {
        uint64_t v19 = v9;
      }
      else {
        uint64_t v19 = 1;
      }
      if (v13) {
        uint64_t v9 = -1;
      }
      if (v17 != 103) {
        uint64_t v9 = v19;
      }
    }
    else if (!v13)
    {
      uint64_t v9 = 1;
    }
  }
  return v9;
}

void __56__PKPassbookSettingsController__companionPassSpecifiers__block_invoke_2(uint64_t a1, void *a2)
{
  id v22 = a2;
  if ([v22 hasAssociatedPeerPaymentAccount]) {
    goto LABEL_25;
  }
  id v3 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:0 target:*(void *)(a1 + 32) set:0 get:0 detail:0 cell:-1 edit:0];
  uint64_t v4 = [v22 devicePrimaryPaymentApplication];
  uint64_t v5 = [v4 paymentNetworkIdentifier];

  if (v5 == 129)
  {
    id v6 = [v22 devicePrimaryContactlessPaymentApplication];
    char v7 = [v6 subcredentials];
    uint64_t v8 = [v7 count];

    if (!v8)
    {
LABEL_17:
      uint64_t v9 = 0;
      goto LABEL_18;
    }
  }
  else if (v5 == 103 && !*(unsigned char *)(a1 + 48))
  {
    goto LABEL_17;
  }
  if (!*(unsigned char *)(a1 + 49)
    || ![*(id *)(*(void *)(a1 + 32) + 8) supportsCredentialType:v5]
    || *(unsigned char *)(a1 + 50)
    && ![*(id *)(*(void *)(a1 + 32) + 8) supportsAddingPaymentPass:v22]
    || [v22 requiresTransferSerialNumberBasedProvisioning]
    && [v22 activationState]
    || !*(unsigned char *)(a1 + 51) && (v5 != 129 || !*(unsigned char *)(a1 + 52)))
  {
    goto LABEL_17;
  }
  uint64_t v9 = 1;
LABEL_18:
  int v10 = [v22 hasCredentials];
  if ((v10 & 1) == 0)
  {
    if ([v22 isStoredValuePass])
    {
      uint64_t v11 = [v22 uniqueID];
      uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 536) objectForKeyedSubscript:v11];
      [v3 setObject:v12 forKeyedSubscript:@"pkTransitServerBalance"];

      [*(id *)(a1 + 32) _reloadBalancesAndTransitPassPropertiesForPass:v22 withDataProvider:*(void *)(*(void *)(a1 + 32) + 544)];
    }
    else
    {
      BOOL v13 = [v22 associatedAccountServiceAccountIdentifier];
      uint64_t v14 = [v13 length];

      if (v14)
      {
        uint64_t v15 = [v22 devicePrimaryPaymentApplication];
        [v15 state];
        int IsPersonalized = PKPaymentApplicationStateIsPersonalized();

        if (IsPersonalized) {
          [*(id *)(a1 + 32) _updateCardSpecifier:v3 withAccountStateForPaymentPass:v22];
        }
      }
    }
  }
  [v3 setObject:v22 forKeyedSubscript:@"pkPass"];
  uint64_t v17 = [NSNumber numberWithBool:v9];
  [v3 setObject:v17 forKeyedSubscript:@"pkShowAddButton"];

  uint64_t v18 = [NSNumber numberWithBool:v10 ^ 1u];
  [v3 setObject:v18 forKeyedSubscript:@"pkShowSubTitle"];

  [v3 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"pkShowState"];
  uint64_t v19 = [NSNumber numberWithInteger:*(void *)(*(void *)(a1 + 32) + 40)];
  [v3 setObject:v19 forKeyedSubscript:@"pkSettingsContext"];

  [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"pkActionButtonEnabled"];
  [v3 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x1E4F930A8]];
  [v3 setObject:&unk_1EF2B8E50 forKeyedSubscript:*MEMORY[0x1E4F93050]];
  +[PKPaymentPassTableCell heightForCellWithMinimum:1 hasSubTitle:56.0];
  uint64_t v20 = objc_msgSend(NSNumber, "numberWithDouble:");
  [v3 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F93218]];

  uint64_t v21 = [v22 uniqueID];
  [v3 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F93188]];

  [*(id *)(a1 + 40) addObject:v3];
LABEL_25:
}

- (id)_specifierForPassUniqueID:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    uint64_t v5 = [(PKPassbookSettingsController *)self _paymentPassSpecifiers];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v49 objects:v56 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v50;
      uint64_t v9 = *MEMORY[0x1E4F93188];
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v50 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v49 + 1) + 8 * v10);
        uint64_t v12 = [v11 objectForKeyedSubscript:v9];
        char v13 = [v12 isEqualToString:v4];

        if (v13) {
          break;
        }
        if (v7 == ++v10)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v49 objects:v56 count:16];
          if (v7) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:

      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      uint64_t v5 = [(PKPassbookSettingsController *)self _otherPassSpecifiers];
      uint64_t v14 = [v5 countByEnumeratingWithState:&v45 objects:v55 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v46;
        uint64_t v17 = *MEMORY[0x1E4F93188];
LABEL_12:
        uint64_t v18 = 0;
        while (1)
        {
          if (*(void *)v46 != v16) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(void **)(*((void *)&v45 + 1) + 8 * v18);
          uint64_t v19 = [v11 objectForKeyedSubscript:v17];
          char v20 = [v19 isEqualToString:v4];

          if (v20) {
            break;
          }
          if (v15 == ++v18)
          {
            uint64_t v15 = [v5 countByEnumeratingWithState:&v45 objects:v55 count:16];
            if (v15) {
              goto LABEL_12;
            }
            goto LABEL_18;
          }
        }
      }
      else
      {
LABEL_18:

        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        uint64_t v5 = [(PKPassbookSettingsController *)self _companionPassSpecifiers];
        uint64_t v21 = [v5 countByEnumeratingWithState:&v41 objects:v54 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v42;
          uint64_t v24 = *MEMORY[0x1E4F93188];
LABEL_20:
          uint64_t v25 = 0;
          while (1)
          {
            if (*(void *)v42 != v23) {
              objc_enumerationMutation(v5);
            }
            uint64_t v11 = *(void **)(*((void *)&v41 + 1) + 8 * v25);
            char v26 = [v11 objectForKeyedSubscript:v24];
            char v27 = [v26 isEqualToString:v4];

            if (v27) {
              break;
            }
            if (v22 == ++v25)
            {
              uint64_t v22 = [v5 countByEnumeratingWithState:&v41 objects:v54 count:16];
              if (v22) {
                goto LABEL_20;
              }
              goto LABEL_26;
            }
          }
        }
        else
        {
LABEL_26:

          long long v39 = 0u;
          long long v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          uint64_t v5 = [(PKPassbookSettingsController *)self _pendingCompanionPassSpecifiers];
          uint64_t v28 = [v5 countByEnumeratingWithState:&v37 objects:v53 count:16];
          if (!v28)
          {
LABEL_34:
            id v35 = 0;
LABEL_36:

            goto LABEL_38;
          }
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v38;
          uint64_t v31 = *MEMORY[0x1E4F93188];
LABEL_28:
          uint64_t v32 = 0;
          while (1)
          {
            if (*(void *)v38 != v30) {
              objc_enumerationMutation(v5);
            }
            uint64_t v11 = *(void **)(*((void *)&v37 + 1) + 8 * v32);
            long long v33 = [v11 objectForKeyedSubscript:v31];
            char v34 = [v33 isEqualToString:v4];

            if (v34) {
              break;
            }
            if (v29 == ++v32)
            {
              uint64_t v29 = [v5 countByEnumeratingWithState:&v37 objects:v53 count:16];
              if (v29) {
                goto LABEL_28;
              }
              goto LABEL_34;
            }
          }
        }
      }
    }
    id v35 = v11;
    goto LABEL_36;
  }
  id v35 = 0;
LABEL_38:

  return v35;
}

- (id)_credentialCenterSpecifiers
{
  credentialCenterSpecifiers = self->_credentialCenterSpecifiers;
  if (!credentialCenterSpecifiers)
  {
    id v4 = [MEMORY[0x1E4F92E70] groupSpecifierWithName:&stru_1EF1B5B50];
    uint64_t v5 = PKLocalizedPaymentString(&cfstr_CredentialCent_14.isa);
    [v4 setProperty:v5 forKey:*MEMORY[0x1E4F93170]];

    uint64_t v6 = (void *)MEMORY[0x1E4F92E70];
    uint64_t v7 = PKLocalizedPaymentString(&cfstr_CredentialCent_15.isa);
    uint64_t v8 = [v6 preferenceSpecifierNamed:v7 target:self set:0 get:0 detail:0 cell:2 edit:0];

    [v8 setControllerLoadAction:sel__presentCredentialCenter_];
    objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v4, v8, 0);
    uint64_t v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = self->_credentialCenterSpecifiers;
    self->_credentialCenterSpecifiers = v9;

    credentialCenterSpecifiers = self->_credentialCenterSpecifiers;
  }

  return credentialCenterSpecifiers;
}

- (void)_presentCredentialCenter:(id)a3
{
  uint64_t v6 = objc_alloc_init(PKCredentialCenterViewController);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained settingsController:self requestsPushViewController:v6 animated:a3 != 0];
  }
}

- (id)_expiredPassesSwitchGroupSpecifiers
{
  expiredPassesSwitchSpecifiers = self->_expiredPassesSwitchSpecifiers;
  if (!expiredPassesSwitchSpecifiers)
  {
    id v4 = [MEMORY[0x1E4F92E70] groupSpecifierWithName:&stru_1EF1B5B50];
    uint64_t v5 = (void *)MEMORY[0x1E4F92E70];
    uint64_t v6 = PKLocalizedString(&cfstr_AllowExpiredPa.isa);
    uint64_t v7 = [v5 preferenceSpecifierNamed:v6 target:self set:sel__setExpiredPassesSwitchSetting_forSpecifier_ get:sel__expiredPassesSwitchSettingForSpecifier_ detail:0 cell:6 edit:0];

    [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F93068]];
    objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v4, v7, 0);
    uint64_t v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = self->_expiredPassesSwitchSpecifiers;
    self->_expiredPassesSwitchSpecifiers = v8;

    expiredPassesSwitchSpecifiers = self->_expiredPassesSwitchSpecifiers;
  }

  return expiredPassesSwitchSpecifiers;
}

- (void)_setExpiredPassesSwitchSetting:(id)a3 forSpecifier:(id)a4
{
  uint64_t v4 = [a3 BOOLValue] ^ 1;

  MEMORY[0x1F413BA40](v4);
}

- (id)_expiredPassesSwitchSettingForSpecifier:(id)a3
{
  id v3 = NSNumber;
  uint64_t v4 = PKExpiredPassesDisabledByUser() ^ 1;

  return (id)[v3 numberWithInt:v4];
}

- (id)_handoffSwitchGroupSpecifiers
{
  handoffSwitchSpecifiers = self->_handoffSwitchSpecifiers;
  if (!handoffSwitchSpecifiers)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F92E70];
    uint64_t v5 = PKLocalizedPaymentString(&cfstr_AllowHandoffPa.isa);
    uint64_t v6 = [(PKPassbookSettingsController *)self _uppercaseGroupSpecifierTitleIfNecessary:v5];
    uint64_t v7 = [v4 groupSpecifierWithName:v6];

    PKDeviceSpecificLocalizedStringKeyForKey(@"ALLOW_HANDOFF_PAYMENTS_FOOTER", self->_context == 1);
    uint64_t v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = PKLocalizedPaymentString(v8);

    [v7 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F93170]];
    uint64_t v10 = (void *)MEMORY[0x1E4F92E70];
    uint64_t v11 = PKLocalizedPaymentString(&cfstr_AllowHandoffPa_1.isa);
    uint64_t v12 = [v10 preferenceSpecifierNamed:v11 target:self set:sel__setHandoffSwitchSetting_forSpecifier_ get:sel__handoffSwitchSettingForSpecifier_ detail:0 cell:6 edit:0];

    [v12 setProperty:*MEMORY[0x1E4F87250] forKey:*MEMORY[0x1E4F93188]];
    char v13 = [MEMORY[0x1E4F74230] sharedConnection];
    int v14 = [v13 isBoolSettingLockedDownByRestrictions:*MEMORY[0x1E4F73F88]];

    uint64_t v15 = [MEMORY[0x1E4F843E8] shared];
    char v16 = [v15 isEffectivelyLocked];

    if (v14 && (v16 & 1) == 0) {
      [v12 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F93130]];
    }
    objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v7, v12, 0);
    uint64_t v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = self->_handoffSwitchSpecifiers;
    self->_handoffSwitchSpecifiers = v17;

    handoffSwitchSpecifiers = self->_handoffSwitchSpecifiers;
  }

  return handoffSwitchSpecifiers;
}

- (void)_setHandoffSwitchSetting:(id)a3 forSpecifier:(id)a4
{
  id v9 = a3;
  p_paymentDataProvider = &self->_paymentDataProvider;
  id WeakRetained = objc_loadWeakRetained((id *)p_paymentDataProvider);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_paymentDataProvider);
    objc_msgSend(v8, "setPaymentHandoffDisabled:", objc_msgSend(v9, "BOOLValue") ^ 1);
  }
}

- (id)_handoffSwitchSettingForSpecifier:(id)a3
{
  p_paymentDataProvider = &self->_paymentDataProvider;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paymentDataProvider);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_paymentDataProvider);
    uint64_t v7 = [v6 isPaymentHandoffDisabled] ^ 1;
  }
  else
  {
    uint64_t v7 = 1;
  }
  id v8 = NSNumber;

  return (id)[v8 numberWithBool:v7];
}

- (id)_showPayLaterOptionsSpecifiers
{
  id v20[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PKPassbookSettingsController *)self _deviceRegionSupportsApplePayLater];
  char v4 = PKPaymentOffersEligibleInDeviceRegion();
  int v5 = PKHideCardBenefitPayLater();
  if (!v3 && (v4 & 1) == 0)
  {
    id v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v7 = "Pay Later offers switch not being shown in settings because payment offers and apple pay later arent supporte"
           "d in the device region";
LABEL_8:
      _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  if (v5)
  {
    id v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v7 = "Pay Later offers switch not being shown in settings because payment offers were disabled";
      goto LABEL_8;
    }
LABEL_9:

    showPayLaterOptionsSpecifiers = self->_showPayLaterOptionsSpecifiers;
    self->_showPayLaterOptionsSpecifiers = 0;

    id v9 = 0;
    goto LABEL_13;
  }
  uint64_t v10 = self->_showPayLaterOptionsSpecifiers;
  if (!v10)
  {
    uint64_t v11 = [MEMORY[0x1E4F92E70] groupSpecifierWithName:&stru_1EF1B5B50];
    uint64_t v12 = PKLocalizedCocoonString(&cfstr_OnlinePurchase.isa);
    [v11 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F93170]];

    char v13 = (void *)MEMORY[0x1E4F92E70];
    int v14 = PKLocalizedCocoonString(&cfstr_ShowPayLaterOp.isa);
    uint64_t v15 = [v13 preferenceSpecifierNamed:v14 target:self set:sel__setShowPayLaterOptionsSwitchSetting_forSpecifier_ get:sel__showPayLaterOptionsSettingForSpecifier_ detail:0 cell:6 edit:0];

    [v15 setProperty:*MEMORY[0x1E4F87290] forKey:*MEMORY[0x1E4F93188]];
    [v15 setProperty:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F93068]];
    v20[0] = v11;
    v20[1] = v15;
    char v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
    uint64_t v17 = self->_showPayLaterOptionsSpecifiers;
    self->_showPayLaterOptionsSpecifiers = v16;

    uint64_t v10 = self->_showPayLaterOptionsSpecifiers;
  }
  id v9 = v10;
LABEL_13:

  return v9;
}

- (void)_setShowPayLaterOptionsSwitchSetting:(id)a3 forSpecifier:(id)a4
{
  id v5 = a3;
  p_paymentDataProvider = &self->_paymentDataProvider;
  id WeakRetained = objc_loadWeakRetained((id *)p_paymentDataProvider);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)p_paymentDataProvider);
    -[NSObject setHidePayLaterOptions:](v9, "setHidePayLaterOptions:", [v5 BOOLValue] ^ 1);
  }
  else
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "_paymentDataProvider doesnt respond to setHidePayLaterOptions", v10, 2u);
    }
  }
}

- (id)_showPayLaterOptionsSettingForSpecifier:(id)a3
{
  p_paymentDataProvider = &self->_paymentDataProvider;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paymentDataProvider);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = NSNumber;
    id v7 = objc_loadWeakRetained((id *)p_paymentDataProvider);
    char v8 = objc_msgSend(v6, "numberWithInt:", objc_msgSend(v7, "hidePayLaterOptions") ^ 1);
  }
  else
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "_paymentDataProvider doesnt respond to hidePayLaterOptions", v11, 2u);
    }

    char v8 = (void *)MEMORY[0x1E4F1CC28];
  }

  return v8;
}

- (BOOL)_deviceRegionSupportsApplePayLater
{
  payLaterAccount = self->_payLaterAccount;
  if (!payLaterAccount
    || ([(PKAccount *)payLaterAccount hidePayLaterInPaymentSheet] & 1) != 0)
  {
    return 0;
  }
  char v5 = [(PKAccount *)self->_payLaterAccount payLaterDetails];
  char v6 = [v5 isPayLaterSupportedInCurrentRegion];

  return v6;
}

- (id)_cardBenefitSpecifiers
{
  BOOL v3 = [(PKPassbookSettingsController *)self _deviceRegionSupportsApplePayLater];
  int v4 = PKPaymentOffersEligibleInDeviceRegion();
  int v5 = v4;
  if (v3 || (v4 & 1) != 0)
  {
    cardBenefitSpecifiers = self->_cardBenefitSpecifiers;
    if (!cardBenefitSpecifiers)
    {
      uint64_t v10 = (void *)MEMORY[0x1E4F92E70];
      uint64_t v11 = PKLocalizedPaymentOffersString(&cfstr_CardBenefitsHe.isa);
      uint64_t v12 = [v10 groupSpecifierWithName:v11];

      char v13 = PKLocalizedPaymentString(&cfstr_CardBenefitsFo.isa);
      if (v5)
      {
        uint64_t v14 = PKLocalizedPaymentOffersString(&cfstr_CardBenefitsFo.isa);

        char v13 = (void *)v14;
      }
      [v12 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F93170]];
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      char v16 = (void *)MEMORY[0x1E4F92E70];
      uint64_t v17 = PKLocalizedPaymentOffersString(&cfstr_CardBenefitsPa.isa);
      uint64_t v18 = [v16 preferenceSpecifierNamed:v17 target:self set:sel__setShowCardBenefitPayLaterSwitchSetting_forSpecifier_ get:sel__showCardBenefitPayLaterSettingForSpecifier_ detail:0 cell:6 edit:0];

      uint64_t v19 = *MEMORY[0x1E4F93188];
      [v18 setProperty:*MEMORY[0x1E4F87268] forKey:*MEMORY[0x1E4F93188]];
      uint64_t v20 = *MEMORY[0x1E4F93068];
      [v18 setProperty:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F93068]];
      [v15 addObject:v18];

      if (v5)
      {
        uint64_t v21 = (void *)MEMORY[0x1E4F92E70];
        uint64_t v22 = PKLocalizedPayWithPointsString(&cfstr_CardBenefitsRe.isa);
        uint64_t v23 = [v21 preferenceSpecifierNamed:v22 target:self set:sel__setShowCardBenefitRewardsSwitchSetting_forSpecifier_ get:sel__showCardBenefitRewardsSettingForSpecifier_ detail:0 cell:6 edit:0];

        [v23 setProperty:*MEMORY[0x1E4F87270] forKey:v19];
        [v23 setProperty:MEMORY[0x1E4F1CC38] forKey:v20];
        [v15 addObject:v23];
      }
      uint64_t v24 = (NSArray *)[v15 count];
      if (v24)
      {
        [v15 insertObject:v12 atIndex:0];
        uint64_t v24 = (NSArray *)[v15 copy];
      }
      uint64_t v25 = self->_cardBenefitSpecifiers;
      self->_cardBenefitSpecifiers = v24;

      cardBenefitSpecifiers = self->_cardBenefitSpecifiers;
    }
    char v8 = cardBenefitSpecifiers;
  }
  else
  {
    char v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Card benefits switch not being shown in settings because payment offers and apple pay later arent supported in the device region", buf, 2u);
    }

    id v7 = self->_cardBenefitSpecifiers;
    self->_cardBenefitSpecifiers = 0;

    char v8 = 0;
  }

  return v8;
}

- (void)_setShowCardBenefitPayLaterSwitchSetting:(id)a3 forSpecifier:(id)a4
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paymentDataProvider);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_paymentDataProvider);
    objc_msgSend(v8, "setHideCardBenefitPayLater:", objc_msgSend(v5, "BOOLValue") ^ 1);

    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 settingsControllerRequestsReloadSpecifiers:self];
  }
  else
  {
    uint64_t v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "_paymentDataProvider doesnt respond to setHideCardBenefitPayLater", v11, 2u);
    }
  }
}

- (id)_showCardBenefitPayLaterSettingForSpecifier:(id)a3
{
  p_paymentDataProvider = &self->_paymentDataProvider;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paymentDataProvider);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = NSNumber;
    id v7 = objc_loadWeakRetained((id *)p_paymentDataProvider);
    id v8 = objc_msgSend(v6, "numberWithInt:", objc_msgSend(v7, "hideCardBenefitPayLater") ^ 1);
  }
  else
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "_paymentDataProvider doesnt respond to hideCardBenefitPayLater", v11, 2u);
    }

    id v8 = (void *)MEMORY[0x1E4F1CC28];
  }

  return v8;
}

- (void)_setShowCardBenefitRewardsSwitchSetting:(id)a3 forSpecifier:(id)a4
{
  id v5 = a3;
  p_paymentDataProvider = &self->_paymentDataProvider;
  id WeakRetained = objc_loadWeakRetained((id *)p_paymentDataProvider);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)p_paymentDataProvider);
    -[NSObject setHideCardBenefitRewards:](v9, "setHideCardBenefitRewards:", [v5 BOOLValue] ^ 1);
  }
  else
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "_paymentDataProvider doesnt respond to setHideCardBenefitRewards", v10, 2u);
    }
  }
}

- (id)_showCardBenefitRewardsSettingForSpecifier:(id)a3
{
  p_paymentDataProvider = &self->_paymentDataProvider;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paymentDataProvider);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = NSNumber;
    id v7 = objc_loadWeakRetained((id *)p_paymentDataProvider);
    char v8 = objc_msgSend(v6, "numberWithInt:", objc_msgSend(v7, "hideCardBenefitRewards") ^ 1);
  }
  else
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "_paymentDataProvider doesnt respond to hideCardBenefitRewards", v11, 2u);
    }

    char v8 = (void *)MEMORY[0x1E4F1CC28];
  }

  return v8;
}

- (id)_onlinePaymentsGroupSpecifiers
{
  onlinePaymentsSpecifiers = self->_onlinePaymentsSpecifiers;
  if (!onlinePaymentsSpecifiers)
  {
    int v4 = (void *)MEMORY[0x1E4F92E70];
    char v5 = PKLocalizedVirtualCardString(&cfstr_AllowOnlinePay_1.isa);
    char v6 = [(PKPassbookSettingsController *)self _uppercaseGroupSpecifierTitleIfNecessary:v5];
    id v7 = [v4 groupSpecifierWithName:v6];

    char v8 = PKLocalizedVirtualCardString(&cfstr_AllowOnlinePay_0.isa);
    [v7 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F93170]];

    id v9 = (void *)MEMORY[0x1E4F92E70];
    uint64_t v10 = PKLocalizedVirtualCardString(&cfstr_AllowOnlinePay.isa);
    uint64_t v11 = [v9 preferenceSpecifierNamed:v10 target:self set:sel__setOnlinePaymentsSetting_forSpecifier_ get:sel__onlinePaymentsSettingForSpecifier_ detail:0 cell:6 edit:0];

    [v11 setProperty:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F93068]];
    [v11 setProperty:@"ALLOW_ONLINE_PAYMENTS" forKey:*MEMORY[0x1E4F93188]];
    objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v7, v11, 0);
    uint64_t v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
    char v13 = self->_onlinePaymentsSpecifiers;
    self->_onlinePaymentsSpecifiers = v12;

    onlinePaymentsSpecifiers = self->_onlinePaymentsSpecifiers;
  }

  return onlinePaymentsSpecifiers;
}

- (void)_setOnlinePaymentsSetting:(id)a3 forSpecifier:(id)a4
{
  [a3 BOOLValue];

  PKSetSafariCredentialImportConsented();
}

- (id)_onlinePaymentsSettingForSpecifier:(id)a3
{
  BOOL v3 = PKSafariCredentialProvisioningConsented() == 1;
  int v4 = NSNumber;

  return (id)[v4 numberWithBool:v3];
}

- (id)_orderManagementGroupSpecifiers
{
  orderManagementSpecifiers = self->_orderManagementSpecifiers;
  if (!orderManagementSpecifiers)
  {
    int v4 = (void *)MEMORY[0x1E4F92E70];
    char v5 = PKLocalizedOrderManagementString(&cfstr_AllowOrderMana_1.isa);
    char v6 = [(PKPassbookSettingsController *)self _uppercaseGroupSpecifierTitleIfNecessary:v5];
    id v7 = [v4 groupSpecifierWithName:v6];

    uint64_t v8 = *MEMORY[0x1E4F93188];
    [v7 setProperty:@"ORDER_TRACKING" forKey:*MEMORY[0x1E4F93188]];
    PKDeviceSpecificLocalizedStringKeyForKey(@"ALLOW_ORDER_MANAGEMENT_FOOTER", 0);
    id v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = PKLocalizedOrderManagementString(v9);

    [v7 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F93170]];
    uint64_t v11 = (void *)MEMORY[0x1E4F92E70];
    uint64_t v12 = PKLocalizedOrderManagementString(&cfstr_AllowOrderMana.isa);
    char v13 = [v11 preferenceSpecifierNamed:v12 target:self set:sel__setOrderManagementSetting_forSpecifier_ get:sel__orderManagementSettingForSpecifier_ detail:0 cell:6 edit:0];

    uint64_t v14 = *MEMORY[0x1E4F93068];
    [v13 setProperty:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F93068]];
    [v13 setProperty:*MEMORY[0x1E4F874D8] forKey:v8];
    id v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v7, v13, 0);
    if ([MEMORY[0x1E4F85128] isWalletVisible])
    {
      char v16 = [MEMORY[0x1E4F92E70] groupSpecifierWithName:&stru_1EF1B5B50];
      [v15 addObject:v16];
      uint64_t v17 = (void *)MEMORY[0x1E4F92E70];
      uint64_t v18 = PKLocalizedOrderManagementString(&cfstr_AllowOrderMana_3.isa);
      uint64_t v19 = [v17 preferenceSpecifierNamed:v18 target:self set:sel__setOrderManagementNotificationsSetting_forSpecifier_ get:sel__orderManagementNotificationsSettingForSpecifier_ detail:0 cell:6 edit:0];

      [v19 setProperty:MEMORY[0x1E4F1CC38] forKey:v14];
      [v15 addObject:v19];
    }
    uint64_t v20 = (NSArray *)[v15 copy];
    uint64_t v21 = self->_orderManagementSpecifiers;
    self->_orderManagementSpecifiers = v20;

    orderManagementSpecifiers = self->_orderManagementSpecifiers;
  }

  return orderManagementSpecifiers;
}

- (void)_setOrderManagementSetting:(id)a3 forSpecifier:(id)a4
{
  id v9 = a3;
  p_paymentDataProvider = &self->_paymentDataProvider;
  id WeakRetained = objc_loadWeakRetained((id *)p_paymentDataProvider);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_paymentDataProvider);
    objc_msgSend(v8, "setOrderManagementDisabled:", objc_msgSend(v9, "BOOLValue") ^ 1);
  }
}

- (id)_orderManagementSettingForSpecifier:(id)a3
{
  p_paymentDataProvider = &self->_paymentDataProvider;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paymentDataProvider);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_paymentDataProvider);
    uint64_t v7 = [v6 isOrderManagementDisabled] ^ 1;
  }
  else
  {
    uint64_t v7 = 1;
  }
  id v8 = NSNumber;

  return (id)[v8 numberWithBool:v7];
}

- (void)_setOrderManagementNotificationsSetting:(id)a3 forSpecifier:(id)a4
{
  id v9 = a3;
  p_paymentDataProvider = &self->_paymentDataProvider;
  id WeakRetained = objc_loadWeakRetained((id *)p_paymentDataProvider);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_paymentDataProvider);
    objc_msgSend(v8, "setOrderManagementNotificationsDisabled:", objc_msgSend(v9, "BOOLValue") ^ 1);
  }
}

- (id)_orderManagementNotificationsSettingForSpecifier:(id)a3
{
  p_paymentDataProvider = &self->_paymentDataProvider;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paymentDataProvider);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_paymentDataProvider);
    uint64_t v7 = [v6 isOrderManagementNotificationsDisabled] ^ 1;
  }
  else
  {
    uint64_t v7 = 1;
  }
  id v8 = NSNumber;

  return (id)[v8 numberWithBool:v7];
}

- (id)_bankConnectGroupSpecifiers
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(NSArray *)self->_institutionsProviderResponses count])
  {
    BOOL v3 = (void *)MEMORY[0x1E4F92E70];
    int v4 = PKLocalizedBankConnectString(&cfstr_BankConnectSet.isa);
    char v5 = [(PKPassbookSettingsController *)self _uppercaseGroupSpecifierTitleIfNecessary:v4];
    uint64_t v6 = [v3 groupSpecifierWithName:v5];

    uint64_t v19 = (void *)v6;
    [v25 addObject:v6];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    obuint64_t j = self->_institutionsProviderResponses;
    uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v24 = *(void *)v27;
      uint64_t v23 = *MEMORY[0x1E4F930A8];
      uint64_t v21 = *MEMORY[0x1E4F93218];
      uint64_t v22 = *MEMORY[0x1E4F93050];
      uint64_t v9 = *MEMORY[0x1E4F93188];
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v27 != v24) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          uint64_t v12 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:3 edit:0];
          [v12 setObject:v11 forKeyedSubscript:@"pkConnectedInsitution"];
          [v12 setObject:objc_opt_class() forKeyedSubscript:v23];
          char v13 = [v11 institution];
          uint64_t v14 = [v13 institutionIdentifier];
          [v12 setProperty:v14 forKey:@"pkBankConnectInstitutionIdentifier"];

          [v12 setControllerLoadAction:sel__showBankConnectInstitutionDetails_];
          [v12 setObject:&unk_1EF2B8E38 forKeyedSubscript:v22];
          +[PKInsitutionTableCell estimatedHeightForCell];
          id v15 = objc_msgSend(NSNumber, "numberWithDouble:");
          [v12 setObject:v15 forKeyedSubscript:v21];

          char v16 = [v11 institution];
          uint64_t v17 = [v16 institutionIdentifier];
          [v12 setObject:v17 forKeyedSubscript:v9];

          [v25 addObject:v12];
        }
        uint64_t v8 = [(NSArray *)obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v8);
    }
  }

  return v25;
}

- (void)_showBankConnectInstitutionDetails:(id)a3
{
  id v4 = a3;
  id v5 = [v4 propertyForKey:@"pkBankConnectInstitutionIdentifier"];
  [(PKPassbookSettingsController *)self showBankConnectManagementForInstitution:v5 accountIdentifier:0 sender:v4 completion:0];
}

- (void)showBankConnectManagementForInstitution:(id)a3 accountIdentifier:(id)a4 sender:(id)a5 completion:(id)a6
{
  id v15 = a3;
  id v10 = a4;
  uint64_t v11 = (void (**)(void))a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    char v13 = [(objc_class *)_MergedGlobals_662() makeViewControllerWithInstitutionIdentifier:v15];
    [WeakRetained settingsController:self requestsPushViewController:v13 animated:a5 != 0];
    if (v10)
    {
      uint64_t v14 = [(objc_class *)off_1EB545958() makeViewControllerWithAccountIdentifier:v10 institutionIdentifier:v15];
      [WeakRetained settingsController:self requestsPushViewController:v14 animated:a5 != 0];
    }
    if (v11) {
      v11[2](v11);
    }
  }
  else if (v11)
  {
    v11[2](v11);
  }
}

- (void)showBankConnectAuthorizationFlowWithRedirectURL:(id)a3 completion:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  p_delegate = &self->_delegate;
  id v9 = a4;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained settingsController:self requestsPresentAuthorizationFlowWithRedirectURL:v10 animated:v5 completion:v9];
}

- (id)_defaultAppSpecifiers
{
  defaultWalletContext = self->_defaultWalletContext;
  if (defaultWalletContext
    && [(SESNFCAppSettingsContext *)defaultWalletContext shouldShowDefaultNFCAppPicker])
  {
    defaultAppSpecifiers = self->_defaultAppSpecifiers;
    if (defaultAppSpecifiers)
    {
      BOOL v5 = defaultAppSpecifiers;
    }
    else
    {
      id v7 = objc_alloc(MEMORY[0x1E4F92E50]);
      uint64_t v8 = [(SESNFCAppSettingsContext *)self->_defaultWalletContext bundleId];
      id v9 = (void *)[v7 initWithBundleID:v8 delegate:self onChange:&__block_literal_global_66];

      if (v9)
      {
        id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v11 = [MEMORY[0x1E4F92E70] groupSpecifierWithName:&stru_1EF1B5B50];
        [v10 addObject:v11];

        [v10 addObject:v9];
        uint64_t v12 = (NSArray *)[v10 copy];
        char v13 = self->_defaultAppSpecifiers;
        self->_defaultAppSpecifiers = v12;

        BOOL v5 = self->_defaultAppSpecifiers;
      }
      else
      {
        BOOL v5 = 0;
      }
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)_lockscreenSwitchGroupSpecifiers
{
  if (self->_lockscreenSwitchSpecifiers)
  {
LABEL_8:
    defaultWalletContext = self->_defaultWalletContext;
    if (defaultWalletContext) {
      BOOL v15 = [(SESNFCAppSettingsContext *)defaultWalletContext doubleClickToggleVisibilityType] == 0;
    }
    else {
      BOOL v15 = 1;
    }
    char v16 = [NSNumber numberWithBool:v15];
    [(PSSpecifier *)self->_lockscreenSwitchSpecifier setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F93130]];

    uint64_t v17 = self->_lockscreenSwitchSpecifiers;
    goto LABEL_12;
  }
  if (PKPearlIsAvailable())
  {
    BOOL v3 = [MEMORY[0x1E4F92E70] groupSpecifierWithName:&stru_1EF1B5B50];
    id v4 = PKLocalizedPearlString(&cfstr_AllowDoubleCli.isa);
    uint64_t v5 = PKLocalizedPearlString(&cfstr_AllowDoubleCli_0.isa);
LABEL_7:
    id v9 = (void *)v5;
    [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F93170]];
    id v10 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:v4 target:self set:sel__setDoubleClickSwitchSetting_forSpecifier_ get:sel__doubleClickSwitchSettingForSpecifier_ detail:0 cell:6 edit:0];
    lockscreenSwitchSpecifier = self->_lockscreenSwitchSpecifier;
    self->_lockscreenSwitchSpecifier = v10;

    [(PSSpecifier *)self->_lockscreenSwitchSpecifier setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F93068]];
    uint64_t v12 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v3, self->_lockscreenSwitchSpecifier, 0);
    lockscreenSwitchSpecifiers = self->_lockscreenSwitchSpecifiers;
    self->_lockscreenSwitchSpecifiers = v12;

    goto LABEL_8;
  }
  if (PKHomeButtonIsAvailable() && PKSecureElementIsAvailable())
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F92E70];
    id v7 = PKLocalizedPaymentString(&cfstr_AllowAccessOnL.isa);
    uint64_t v8 = [(PKPassbookSettingsController *)self _uppercaseGroupSpecifierTitleIfNecessary:v7];
    BOOL v3 = [v6 groupSpecifierWithName:v8];

    id v4 = PKLocalizedPaymentString(&cfstr_AllowAccessOnL_0.isa);
    uint64_t v5 = PKLocalizedPaymentString(&cfstr_AllowAccessOnL_1.isa);
    goto LABEL_7;
  }
  uint64_t v17 = 0;
LABEL_12:

  return v17;
}

- (void)_setDoubleClickSwitchSetting:(id)a3 forSpecifier:(id)a4
{
  uint64_t v4 = [a3 BOOLValue];

  MEMORY[0x1F413BA38](v4);
}

- (id)_doubleClickSwitchSettingForSpecifier:(id)a3
{
  BOOL v3 = NSNumber;
  uint64_t v4 = PKDoubleClickAllowed();

  return (id)[v3 numberWithBool:v4];
}

- (void)_showCardDetails:(id)a3
{
  id v5 = [a3 propertyForKey:@"pkPass"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained settingsController:self requestsDetailViewControllerForPass:v5 animated:1];
}

- (id)_systemPolicyForAppSpecifiers
{
  if (!self->_systemPolicyForApp)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F92EA0]);
    uint64_t v4 = (PSSystemPolicyForApp *)[v3 initWithBundleIdentifier:*MEMORY[0x1E4F87D30]];
    systemPolicyForApp = self->_systemPolicyForApp;
    self->_systemPolicyForApp = v4;
  }
  if (PKIsPhone()) {
    uint64_t v6 = 0x10000818001;
  }
  else {
    uint64_t v6 = 8486913;
  }
  id v7 = [(PSSystemPolicyForApp *)self->_systemPolicyForApp specifiersForPolicyOptions:v6 force:0];
  uint64_t v8 = [v7 firstObject];
  if (v8)
  {
    id v9 = PKLocalizedPaymentString(&cfstr_AllowWalletAnd.isa);
    id v10 = [(PKPassbookSettingsController *)self _uppercaseGroupSpecifierTitleIfNecessary:v9];
    [v8 setName:v10];
  }

  return v7;
}

- (id)_defaultsGroupSpecifiers
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  int v4 = [(PKPassbookSettingsDataSource *)self->_dataSource deviceSupportsInAppPayments];
  id v5 = (void *)MEMORY[0x1E4F92E70];
  uint64_t v6 = PKLocalizedPaymentString(&cfstr_SettingsTransa.isa);
  if (v4) {
    [v5 groupSpecifierWithName:v6];
  }
  else {
  id v7 = [v5 groupSpecifierWithID:v6];
  }

  [v3 addObject:v7];
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F83AC8], "pk_privacyFlowForContext:", 1);
  id v9 = [v8 localizedButtonTitle];
  id v10 = PKLocalizedPaymentString(&cfstr_SettingsTransa_0.isa);
  uint64_t v11 = [NSString stringWithFormat:@"%@ %@", v10, v9];
  uint64_t v12 = (objc_class *)objc_opt_class();
  char v13 = NSStringFromClass(v12);
  [v7 setProperty:v13 forKey:*MEMORY[0x1E4F93140]];

  [v7 setProperty:v11 forKey:*MEMORY[0x1E4F93160]];
  v22.id location = [v11 rangeOfString:v9];
  uint64_t v14 = NSStringFromRange(v22);
  [v7 setProperty:v14 forKey:*MEMORY[0x1E4F93150]];

  BOOL v15 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:self];
  [v7 setProperty:v15 forKey:*MEMORY[0x1E4F93158]];

  [v7 setProperty:@"_openPrivacyLink" forKey:*MEMORY[0x1E4F93148]];
  char v16 = [(PKPassbookSettingsController *)self _defaultPaymentSpecifier];
  [v3 addObject:v16];

  if (v4)
  {
    uint64_t v17 = [(PKPassbookSettingsController *)self _defaultShippingAddressSpecifier];
    [v3 addObject:v17];

    uint64_t v18 = [(PKPassbookSettingsController *)self _defaultContactEmailSpecifier];
    [v3 addObject:v18];

    uint64_t v19 = [(PKPassbookSettingsController *)self _defaultContactPhoneSpecifier];
    [v3 addObject:v19];
  }

  return v3;
}

- (id)_currentDefaultPaymentPass
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paymentDataProvider);
  int v4 = [WeakRetained defaultPaymentPassIdentifier];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = self->_paymentPasses;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v28;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v28 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v27 + 1) + 8 * v9);
      uint64_t v11 = [v10 uniqueID];
      char v12 = [v11 isEqualToString:v4];

      if (v12) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v13 = v10;

    if (v13) {
      goto LABEL_22;
    }
  }
  else
  {
LABEL_9:
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v14 = self->_otherPasses;
  uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v20 = objc_msgSend(v19, "uniqueID", (void)v23);
        int v21 = [v20 isEqualToString:v4];

        if (v21)
        {
          id v13 = v19;
          goto LABEL_21;
        }
      }
      uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }
  id v13 = 0;
LABEL_21:

LABEL_22:

  return v13;
}

- (void)_updateDefaultCardsPreferences
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:self->_paymentPasses];
  [v3 sortUsingComparator:&__block_literal_global_483];
  int v4 = [v3 indexesOfObjectsPassingTest:&__block_literal_global_485];
  id v5 = [v3 objectsAtIndexes:v4];
  [v3 removeObjectsAtIndexes:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paymentDataProvider);
  uint64_t v7 = [WeakRetained defaultPaymentPassIdentifier];

  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __62__PKPassbookSettingsController__updateDefaultCardsPreferences__block_invoke_3;
  v35[3] = &unk_1E59D1BA8;
  id v8 = v7;
  id v36 = v8;
  uint64_t v9 = [v3 indexOfObjectPassingTest:v35];
  id v10 = PKLocalizedPaymentString(&cfstr_InAppPaymentOp_1.isa);
  uint64_t v11 = (PKPaymentPreference *)[objc_alloc(MEMORY[0x1E4F84B78]) initWithTitle:v10 preferences:v3 selectedIndex:v9 readOnly:0];
  availableCards = self->_availableCards;
  self->_availableCards = v11;

  if ([v5 count])
  {
    id v27 = v8;
    long long v29 = self;
    long long v30 = v4;
    uint64_t v26 = PKLocalizedPaymentString(&cfstr_SettingsSetDef.isa);
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v28 = v5;
    id v14 = v5;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v37 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v32 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          id v20 = objc_alloc_init(MEMORY[0x1E4F84B80]);
          [v20 setPass:v19];
          [v20 setShouldShowCardUI:1];
          [v20 setIsSelectable:0];
          int v21 = [v19 devicePrimaryPaymentApplication];
          [v21 state];

          NSRange v22 = PKDisplayableStringForPaymentApplicationState();
          [v20 setAvailabilityString:v22];

          [v13 addObject:v20];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v31 objects:v37 count:16];
      }
      while (v16);
    }

    long long v23 = (PKPaymentPreferenceCard *)v26;
    uint64_t v24 = [objc_alloc(MEMORY[0x1E4F84B78]) initWithTitle:v26 preferences:v13 selectedIndex:0x7FFFFFFFFFFFFFFFLL readOnly:1];
    unavailableCards = v29->_unavailableCards;
    v29->_unavailableCards = (PKPaymentPreferenceCard *)v24;

    int v4 = v30;
    id v8 = v27;
    id v5 = v28;
  }
  else
  {
    long long v23 = self->_unavailableCards;
    self->_unavailableCards = 0;
  }
}

uint64_t __62__PKPassbookSettingsController__updateDefaultCardsPreferences__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 localizedName];
  uint64_t v7 = [v5 localizedName];
  uint64_t v8 = [v6 compare:v7];

  if (!v8)
  {
    uint64_t v9 = [v4 serialNumber];
    id v10 = [v5 serialNumber];
    uint64_t v8 = [v9 compare:v10];
  }
  return v8;
}

BOOL __62__PKPassbookSettingsController__updateDefaultCardsPreferences__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 supportsDefaultCardSelection])
  {
    [v2 effectiveContactlessPaymentApplicationState];
    BOOL v3 = PKPaymentApplicationStateIsPersonalized() == 0;
  }
  else
  {
    BOOL v3 = 1;
  }

  return v3;
}

uint64_t __62__PKPassbookSettingsController__updateDefaultCardsPreferences__block_invoke_3(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 uniqueID];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)_showDefaultPaymentOptions:(id)a3
{
  id v4 = a3;
  [(PKPassbookSettingsController *)self _updateDefaultCardsPreferences];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__PKPassbookSettingsController__showDefaultPaymentOptions___block_invoke;
  aBlock[3] = &unk_1E59D1BD0;
  objc_copyWeak(&v16, &location);
  id v5 = v4;
  id v15 = v5;
  uint64_t v6 = _Block_copy(aBlock);
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  [v7 addObject:self->_availableCards];
  if (self->_unavailableCards) {
    objc_msgSend(v7, "addObject:");
  }
  uint64_t v8 = [PKPaymentPreferencesListViewController alloc];
  uint64_t v9 = PKLocalizedPaymentString(&cfstr_SettingsOption.isa);
  id v10 = [(PKPaymentPreferencesListViewController *)v8 initWithPreferences:v7 title:v9 style:[(PKPassbookSettingsController *)self _paymentPreferencesStyle] handler:v6 contactFormatValidator:self->_contactFormatValidator];
  defaultCardsController = self->_defaultCardsController;
  self->_defaultCardsController = v10;

  if (self->_context == 1)
  {
    char v12 = PKBridgeAppearanceGetAppearanceSpecifier();
    PKAppearanceApplyToContainer(v12, self->_defaultCardsController);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained settingsController:self requestsPushViewController:self->_defaultCardsController animated:1];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __59__PKPassbookSettingsController__showDefaultPaymentOptions___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v6 = [v4 firstObject];
    uint64_t v7 = [v6 preferences];
    unint64_t v8 = [v6 selectedIndex];
    if (v8 == 0x7FFFFFFFFFFFFFFFLL || v8 >= [v7 count])
    {
      id v10 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = [v7 count];
        if (v8 == 0x7FFFFFFFFFFFFFFFLL)
        {
          char v12 = @"not found";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"%lu", v8);
          char v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        *(_DWORD *)buf = 134218242;
        uint64_t v14 = v11;
        __int16 v15 = 2112;
        id v16 = v12;
        _os_log_error_impl(&dword_19F450000, v10, OS_LOG_TYPE_ERROR, "Could not get selected pass, count: %lu, selected: %@", buf, 0x16u);
        if (v8 != 0x7FFFFFFFFFFFFFFFLL) {
      }
        }
    }
    else
    {
      uint64_t v9 = [v7 objectAtIndex:v8];
      [WeakRetained _handleDefaultPaymentPassChangedTo:v9 withSender:*(void *)(a1 + 32) optionsController:0 canPrompt:1];
    }
  }
}

- (void)_handleDefaultPaymentPassChangedTo:(id)a3 withSender:(id)a4 optionsController:(id)a5 canPrompt:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if ([v10 isPrivateLabel] && v6)
    {
      id v13 = [v10 localizedDescription];
      uint64_t v14 = PKLocalizedPaymentString(&cfstr_SettingsSetDef_0.isa, &stru_1EF1B4C70.isa, v13);

      __int16 v15 = PKLocalizedPaymentString(&cfstr_SettingsSetDef_1.isa);
      id v16 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v14 message:v15 preferredStyle:1];
      uint64_t v17 = (void *)MEMORY[0x1E4FB1410];
      uint64_t v18 = PKLocalizedString(&cfstr_OkButtonTitle.isa);
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __106__PKPassbookSettingsController__handleDefaultPaymentPassChangedTo_withSender_optionsController_canPrompt___block_invoke;
      v28[3] = &unk_1E59CCA50;
      void v28[4] = self;
      id v29 = v10;
      id v30 = v11;
      id v19 = v12;
      id v31 = v19;
      id v20 = [v17 actionWithTitle:v18 style:1 handler:v28];

      [v16 addAction:v20];
      int v21 = (void *)MEMORY[0x1E4FB1410];
      NSRange v22 = PKLocalizedString(&cfstr_Cancel.isa);
      long long v23 = [v21 actionWithTitle:v22 style:0 handler:0];

      [v16 addAction:v23];
      [v19 presentViewController:v16 animated:1 completion:0];
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_paymentDataProvider);
      long long v25 = [v10 uniqueID];
      [WeakRetained setDefaultPaymentPassIdentifier:v25];

      if (self->_defaultCardIdentifier)
      {
        uint64_t v26 = [v10 uniqueID];
        defaultCardIdentifier = self->_defaultCardIdentifier;
        self->_defaultCardIdentifier = v26;
      }
      uint64_t v14 = objc_loadWeakRetained((id *)&self->_delegate);
      [v14 settingsController:self requestsReloadSpecifier:v11];
    }
  }
}

uint64_t __106__PKPassbookSettingsController__handleDefaultPaymentPassChangedTo_withSender_optionsController_canPrompt___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleDefaultPaymentPassChangedTo:*(void *)(a1 + 40) withSender:*(void *)(a1 + 48) optionsController:*(void *)(a1 + 56) canPrompt:0];
}

- (void)_openPrivacyLink
{
  objc_msgSend(MEMORY[0x1E4F83AD8], "pk_presenterForContext:", 1);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if (PKUserInterfaceIdiomSupportsLargeLayouts()) {
    [v7 setModalPresentationStyle:2];
  }
  if (self->_context == 1)
  {
    BOOL v3 = [v7 splashController];
    id v4 = [v3 view];
    id v5 = BPSBridgeTintColor();
    [v4 setTintColor:v5];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained settingsControllerRequestsPresentPrivacyWithPresenter:v7];
}

- (id)_defaultPaymentSpecifier
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!self->_defaultPaymentSpecifier)
  {
    BOOL v3 = (char *)objc_alloc_init(MEMORY[0x1E4F92E70]);
    *(void *)&v3[*MEMORY[0x1E4F92F28]] = 2;
    [v3 setTarget:self];
    *(void *)&v3[*MEMORY[0x1E4F92F38]] = sel__getDefaultPaymentCard;
    [v3 setControllerLoadAction:sel__showDefaultPaymentOptions_];
    id v4 = PKLocalizedPaymentString(&cfstr_SettingsTransa_1.isa);
    [v3 setName:v4];

    [v3 setProperty:@"SETTINGS_TRANSACTION_DEFAULTS_PAYMENT_CARD" forKey:*MEMORY[0x1E4F93188]];
    defaultPaymentSpecifier = self->_defaultPaymentSpecifier;
    self->_defaultPaymentSpecifier = (PSSpecifier *)v3;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v6 = self->_paymentPasses;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v10), "contactlessActivationState", (void)v14))
        {

          if (PKStoreDemoModeEnabled()) {
            uint64_t v11 = MEMORY[0x1E4F1CC28];
          }
          else {
            uint64_t v11 = MEMORY[0x1E4F1CC38];
          }
          goto LABEL_15;
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  uint64_t v11 = MEMORY[0x1E4F1CC28];
LABEL_15:
  -[PSSpecifier setProperty:forKey:](self->_defaultPaymentSpecifier, "setProperty:forKey:", v11, *MEMORY[0x1E4F93130], (void)v14);
  id v12 = self->_defaultPaymentSpecifier;

  return v12;
}

- (id)_getDefaultPaymentCard
{
  if (!self->_defaultCardIdentifier)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_paymentDataProvider);
    id v4 = [WeakRetained defaultPaymentPassIdentifier];
    defaultCardIdentifier = self->_defaultCardIdentifier;
    self->_defaultCardIdentifier = v4;
  }
  if ([(NSArray *)self->_paymentPasses count] && self->_defaultCardIdentifier)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_passLibraryDataProvider);
    uint64_t v7 = [v6 passWithUniqueID:self->_defaultCardIdentifier];
    uint64_t v8 = [v7 localizedDescription];
  }
  else
  {
    uint64_t v8 = &stru_1EF1B5B50;
  }

  return v8;
}

- (id)_defaultShippingAddressSpecifier
{
  defaultShippingAddressSpecifier = self->_defaultShippingAddressSpecifier;
  if (!defaultShippingAddressSpecifier)
  {
    id v4 = (char *)objc_alloc_init(MEMORY[0x1E4F92E70]);
    *(void *)&v4[*MEMORY[0x1E4F92F28]] = 2;
    [v4 setTarget:self];
    *(void *)&v4[*MEMORY[0x1E4F92F38]] = sel__getDefaultShippingAddress;
    [v4 setControllerLoadAction:sel__showDefaultShippingAddressOptions_];
    id v5 = PKLocalizedPaymentString(&cfstr_SettingsTransa_2.isa);
    [v4 setName:v5];

    [v4 setProperty:@"SETTINGS_TRANSACTION_DEFAULTS_SHIPPING_ADDRESS" forKey:*MEMORY[0x1E4F93188]];
    if (PKStoreDemoModeEnabled()) {
      uint64_t v6 = MEMORY[0x1E4F1CC28];
    }
    else {
      uint64_t v6 = MEMORY[0x1E4F1CC38];
    }
    [v4 setProperty:v6 forKey:*MEMORY[0x1E4F93130]];
    uint64_t v7 = self->_defaultShippingAddressSpecifier;
    self->_defaultShippingAddressSpecifier = (PSSpecifier *)v4;

    defaultShippingAddressSpecifier = self->_defaultShippingAddressSpecifier;
  }

  return defaultShippingAddressSpecifier;
}

- (id)_defaultContactEmailSpecifier
{
  defaultContactEmailSpecifier = self->_defaultContactEmailSpecifier;
  if (!defaultContactEmailSpecifier)
  {
    id v4 = (char *)objc_alloc_init(MEMORY[0x1E4F92E70]);
    *(void *)&v4[*MEMORY[0x1E4F92F28]] = 2;
    [v4 setTarget:self];
    *(void *)&v4[*MEMORY[0x1E4F92F38]] = sel__getDefaultContactEmail;
    [v4 setControllerLoadAction:sel__showDefaultContactEmailOptions_];
    id v5 = PKLocalizedPaymentString(&cfstr_SettingsTransa_3.isa);
    [v4 setName:v5];

    [v4 setProperty:@"SETTINGS_TRANSACTION_DEFAULTS_EMAIL" forKey:*MEMORY[0x1E4F93188]];
    if (PKStoreDemoModeEnabled()) {
      uint64_t v6 = MEMORY[0x1E4F1CC28];
    }
    else {
      uint64_t v6 = MEMORY[0x1E4F1CC38];
    }
    [v4 setProperty:v6 forKey:*MEMORY[0x1E4F93130]];
    uint64_t v7 = self->_defaultContactEmailSpecifier;
    self->_defaultContactEmailSpecifier = (PSSpecifier *)v4;

    defaultContactEmailSpecifier = self->_defaultContactEmailSpecifier;
  }

  return defaultContactEmailSpecifier;
}

- (id)_defaultContactPhoneSpecifier
{
  defaultContactPhoneSpecifier = self->_defaultContactPhoneSpecifier;
  if (!defaultContactPhoneSpecifier)
  {
    id v4 = (char *)objc_alloc_init(MEMORY[0x1E4F92E70]);
    *(void *)&v4[*MEMORY[0x1E4F92F28]] = 2;
    [v4 setTarget:self];
    *(void *)&v4[*MEMORY[0x1E4F92F38]] = sel__getDefaultContactPhone;
    [v4 setControllerLoadAction:sel__showDefaultContactPhoneOptions_];
    id v5 = PKLocalizedPaymentString(&cfstr_SettingsTransa_4.isa);
    [v4 setName:v5];

    [v4 setProperty:@"SETTINGS_TRANSACTION_DEFAULTS_PHONE" forKey:*MEMORY[0x1E4F93188]];
    if (PKStoreDemoModeEnabled()) {
      uint64_t v6 = MEMORY[0x1E4F1CC28];
    }
    else {
      uint64_t v6 = MEMORY[0x1E4F1CC38];
    }
    [v4 setProperty:v6 forKey:*MEMORY[0x1E4F93130]];
    uint64_t v7 = self->_defaultContactPhoneSpecifier;
    self->_defaultContactPhoneSpecifier = (PSSpecifier *)v4;

    defaultContactPhoneSpecifier = self->_defaultContactPhoneSpecifier;
  }

  return defaultContactPhoneSpecifier;
}

- (void)_showDefaultShippingAddressOptions:(id)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_optionsDelegate);
  uint64_t v7 = [WeakRetained defaultShippingAddress];
  [v5 safelyAddObject:v7];

  uint64_t v8 = PKLocalizedPaymentString(&cfstr_InAppPaymentOp_2.isa);
  id v9 = objc_alloc(MEMORY[0x1E4F84B88]);
  if ([v5 count]) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v11 = (void *)[v9 initWithTitle:v8 preferences:v5 selectedIndex:v10 readOnly:0];
  [v11 setType:1];
  id v12 = PKLocalizedPaymentString(&cfstr_InAppPaymentOp_3.isa);
  [v11 setAddNewTitle:v12];

  id v13 = PKLocalizedPaymentString(&cfstr_InAppPaymentOp_4.isa);
  [v11 setAddExistingTitle:v13];

  long long v14 = PKLocalizedPaymentString(&cfstr_InAppPaymentOp_5.isa);
  [v11 setEditExistingTitle:v14];

  [v11 setContactKey:*MEMORY[0x1E4F1AF10]];
  [v11 mergeRecentsAndMeCard];
  if (![v5 count]) {
    [v11 setSelectedIndex:0x7FFFFFFFFFFFFFFFLL];
  }
  PKContactFormatAssignFormatErrorsToPreferenceContact();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__PKPassbookSettingsController__showDefaultShippingAddressOptions___block_invoke;
  aBlock[3] = &unk_1E59D1BF8;
  id v24 = v11;
  long long v25 = self;
  id v26 = v4;
  id v15 = v4;
  id v16 = v11;
  long long v17 = _Block_copy(aBlock);
  uint64_t v18 = PKLocalizedPaymentString(&cfstr_SettingsOption_0.isa);
  uint64_t v19 = [PKPaymentPreferencesListViewController alloc];
  v27[0] = v16;
  id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  int v21 = [(PKPaymentPreferencesListViewController *)v19 initWithPreferences:v20 title:v18 style:[(PKPassbookSettingsController *)self _paymentPreferencesStyle] handler:v17 contactFormatValidator:self->_contactFormatValidator];

  id v22 = objc_loadWeakRetained((id *)&self->_delegate);
  [v22 settingsController:self requestsPushViewController:v21 animated:1];
}

void __67__PKPassbookSettingsController__showDefaultShippingAddressOptions___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) selectedIndex] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 32));
    [WeakRetained setDefaultShippingAddress:0];
  }
  else
  {
    BOOL v3 = [*(id *)(a1 + 32) preferences];
    id WeakRetained = objc_msgSend(v3, "objectAtIndex:", objc_msgSend(*(id *)(a1 + 32), "selectedIndex"));

    [WeakRetained setContactSource:2];
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 32));
    [v4 setDefaultShippingAddress:WeakRetained];
  }
  id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 648));
  [v5 settingsController:*(void *)(a1 + 40) requestsReloadSpecifier:*(void *)(a1 + 48)];
}

- (void)_showDefaultContactEmailOptions:(id)a3
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_optionsDelegate);
  uint64_t v7 = [WeakRetained defaultContactEmail];
  [v5 safelyAddObject:v7];

  uint64_t v8 = PKLocalizedPaymentString(&cfstr_InAppPaymentOp_6.isa);
  id v9 = objc_alloc(MEMORY[0x1E4F84B88]);
  if ([v5 count]) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v11 = (void *)[v9 initWithTitle:v8 preferences:v5 selectedIndex:v10 readOnly:0];
  [v11 setType:1];
  id v12 = PKLocalizedPaymentString(&cfstr_InAppPaymentOp_7.isa);
  [v11 setAddNewTitle:v12];

  id v13 = PKLocalizedPaymentString(&cfstr_InAppPaymentOp_8.isa);
  [v11 setAddExistingTitle:v13];

  long long v14 = PKLocalizedPaymentString(&cfstr_InAppPaymentOp_9.isa);
  [v11 setEditExistingTitle:v14];

  [v11 setContactKey:*MEMORY[0x1E4F1ADC8]];
  [v11 mergeRecentsAndMeCard];
  if (![v5 count]) {
    [v11 setSelectedIndex:0x7FFFFFFFFFFFFFFFLL];
  }
  PKContactFormatAssignFormatErrorsToPreferenceContact();
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__PKPassbookSettingsController__showDefaultContactEmailOptions___block_invoke;
  aBlock[3] = &unk_1E59D1C20;
  objc_copyWeak(&v36, &location);
  id v15 = v11;
  id v34 = v15;
  id v16 = v4;
  id v35 = v16;
  long long v17 = _Block_copy(aBlock);
  uint64_t v18 = PKLocalizedPaymentString(&cfstr_SettingsOption_1.isa);
  uint64_t v19 = [PKPaymentPreferencesListViewController alloc];
  v38[0] = v15;
  id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
  int v21 = [(PKPaymentPreferencesListViewController *)v19 initWithPreferences:v20 title:v18 style:[(PKPassbookSettingsController *)self _paymentPreferencesStyle] handler:v17 contactFormatValidator:self->_contactFormatValidator];

  hideMyEmailManager = self->_hideMyEmailManager;
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  long long v28 = __64__PKPassbookSettingsController__showDefaultContactEmailOptions___block_invoke_2;
  id v29 = &unk_1E59D1C48;
  id v30 = self;
  id v23 = v15;
  id v31 = v23;
  id v24 = v21;
  long long v32 = v24;
  [(PKHideMyEmailManager *)hideMyEmailManager isAvailable:&v26];
  id v25 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v25, "settingsController:requestsPushViewController:animated:", self, v24, 1, v26, v27, v28, v29, v30);

  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);
}

void __64__PKPassbookSettingsController__showDefaultContactEmailOptions___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v15 = WeakRetained;
    if ([*(id *)(a1 + 32) selectedIndex] == 0x7FFFFFFFFFFFFFFFLL)
    {
      BOOL v3 = objc_loadWeakRetained(v15 + 4);
      [v3 setDefaultContactEmail:0];
    }
    else
    {
      id v4 = [*(id *)(a1 + 32) preferences];
      uint64_t v5 = [v4 count];

      uint64_t v6 = v5 - 1;
      if (v5 >= 1)
      {
        uint64_t v7 = [*(id *)(a1 + 32) preferences];
        uint64_t v8 = [v7 lastObject];
        int v9 = [v8 isHideMyEmail];

        if (v9)
        {
          uint64_t v10 = [*(id *)(a1 + 32) selectedIndex];
          id v11 = objc_loadWeakRetained(v15 + 4);
          [v11 setUseHideMyEmail:v10 == v6];

          if (v10 == v6) {
            goto LABEL_9;
          }
        }
      }
      id v12 = [*(id *)(a1 + 32) preferences];
      BOOL v3 = objc_msgSend(v12, "objectAtIndex:", objc_msgSend(*(id *)(a1 + 32), "selectedIndex"));

      PKContactFormatAssignEmailFormatErrorToPreferenceForContact();
      id v13 = objc_loadWeakRetained(v15 + 4);
      [v13 setDefaultContactEmail:v3];
    }
LABEL_9:
    id v14 = objc_loadWeakRetained(v15 + 81);
    [v14 settingsController:v15 requestsReloadSpecifier:*(void *)(a1 + 40)];

    id WeakRetained = v15;
  }
}

void __64__PKPassbookSettingsController__showDefaultContactEmailOptions___block_invoke_2(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3 = 1;
  if (!a2) {
    uint64_t v3 = 2;
  }
  *(void *)(*(void *)(a1 + 32) + 632) = v3;
  if (!a3)
  {
    if (a2)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __64__PKPassbookSettingsController__showDefaultContactEmailOptions___block_invoke_3;
      block[3] = &unk_1E59CA8E8;
      uint64_t v5 = *(void **)(a1 + 40);
      void block[4] = *(void *)(a1 + 32);
      id v7 = v5;
      id v8 = *(id *)(a1 + 48);
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

void __64__PKPassbookSettingsController__showDefaultContactEmailOptions___block_invoke_3(uint64_t a1)
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  uint64_t v3 = [WeakRetained useHideMyEmail];

  [*(id *)(a1 + 40) addHideMyEmailPreference:v3];
  id v4 = PKLocalizedHideMyEmailString(&cfstr_HmeSettingsDes.isa);
  uint64_t v5 = PKLocalizedHideMyEmailString(&cfstr_HmeSettingsDes_0.isa);
  uint64_t v6 = PKStringWithValidatedFormat();
  uint64_t v7 = objc_msgSend(v6, "rangeOfString:", v5, v5);
  uint64_t v9 = v8;
  [*(id *)(a1 + 40) setFooter:v6];
  objc_msgSend(*(id *)(a1 + 40), "setFooterLinkRange:", v7, v9);
  [*(id *)(a1 + 40) setFooterLinkActionBlock:&__block_literal_global_589];
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F84B88]) initWithTitle:0 preferences:0 selectedIndex:0 readOnly:1];
  [v10 setContactKey:*MEMORY[0x1E4F1ADC8]];
  id v11 = [*(id *)(a1 + 40) addNewTitle];
  [v10 setAddNewTitle:v11];

  id v12 = [*(id *)(a1 + 40) addExistingTitle];
  [v10 setAddExistingTitle:v12];

  [*(id *)(a1 + 48) setPreferenceHasSeparateAddItemsSection:1];
  id v13 = *(void **)(a1 + 48);
  v15[0] = *(void *)(a1 + 40);
  v15[1] = v10;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  [v13 setPreferences:v14];
}

void __64__PKPassbookSettingsController__showDefaultContactEmailOptions___block_invoke_4()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CB10]);
  id v2 = (id)[v0 initWithString:*MEMORY[0x1E4F87280]];
  if (v2)
  {
    v1 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v1 openSensitiveURL:v2 withOptions:0];
  }
}

- (void)_showDefaultContactPhoneOptions:(id)a3
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_optionsDelegate);
  uint64_t v7 = [WeakRetained defaultContactPhone];
  [v5 safelyAddObject:v7];

  uint64_t v8 = PKLocalizedPaymentString(&cfstr_InAppPaymentOp_10.isa);
  id v9 = objc_alloc(MEMORY[0x1E4F84B88]);
  if ([v5 count]) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  id v11 = (void *)[v9 initWithTitle:v8 preferences:v5 selectedIndex:v10 readOnly:0];
  [v11 setType:1];
  id v12 = PKLocalizedPaymentString(&cfstr_InAppPaymentOp_11.isa);
  [v11 setAddNewTitle:v12];

  id v13 = PKLocalizedPaymentString(&cfstr_InAppPaymentOp_12.isa);
  [v11 setAddExistingTitle:v13];

  id v14 = PKLocalizedPaymentString(&cfstr_InAppPaymentOp_13.isa);
  [v11 setEditExistingTitle:v14];

  [v11 setContactKey:*MEMORY[0x1E4F1AEE0]];
  [v11 mergeRecentsAndMeCard];
  if (![v5 count]) {
    [v11 setSelectedIndex:0x7FFFFFFFFFFFFFFFLL];
  }
  PKContactFormatAssignFormatErrorsToPreferenceContact();
  objc_initWeak(&location, self);
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  id v25 = __64__PKPassbookSettingsController__showDefaultContactPhoneOptions___block_invoke;
  uint64_t v26 = &unk_1E59D1C20;
  objc_copyWeak(&v29, &location);
  id v15 = v11;
  id v27 = v15;
  id v16 = v4;
  id v28 = v16;
  long long v17 = _Block_copy(&v23);
  uint64_t v18 = PKLocalizedPaymentString(&cfstr_SettingsOption_1.isa);
  uint64_t v19 = [PKPaymentPreferencesListViewController alloc];
  v31[0] = v15;
  id v20 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v31, 1, v23, v24, v25, v26);
  int v21 = [(PKPaymentPreferencesListViewController *)v19 initWithPreferences:v20 title:v18 style:[(PKPassbookSettingsController *)self _paymentPreferencesStyle] handler:v17 contactFormatValidator:self->_contactFormatValidator];

  id v22 = objc_loadWeakRetained((id *)&self->_delegate);
  [v22 settingsController:self requestsPushViewController:v21 animated:1];

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

void __64__PKPassbookSettingsController__showDefaultContactPhoneOptions___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v7 = WeakRetained;
    if ([*(id *)(a1 + 32) selectedIndex] == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v3 = objc_loadWeakRetained(v7 + 4);
      [v3 setDefaultContactPhone:0];
    }
    else
    {
      id v4 = [*(id *)(a1 + 32) preferences];
      uint64_t v3 = objc_msgSend(v4, "objectAtIndex:", objc_msgSend(*(id *)(a1 + 32), "selectedIndex"));

      PKContactFormatAssignPhoneFormatErrorToPreferenceForContact();
      id v5 = objc_loadWeakRetained(v7 + 4);
      [v5 setDefaultContactPhone:v3];
    }
    id v6 = objc_loadWeakRetained(v7 + 81);
    [v6 settingsController:v7 requestsReloadSpecifier:*(void *)(a1 + 40)];

    id WeakRetained = v7;
  }
}

- (id)_getDefaultShippingAddress
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_optionsDelegate);
  uint64_t v3 = [WeakRetained defaultShippingAddress];
  id v4 = objc_msgSend(v3, "pk_displayName");

  if (![v4 length])
  {
    uint64_t v5 = PKLocalizedPaymentString(&cfstr_SettingsTransa_5.isa);

    id v4 = (void *)v5;
  }

  return v4;
}

- (id)_getDefaultContactEmail
{
  if (self->_isHideMyEmailAvailable == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_optionsDelegate);
    if ([WeakRetained useHideMyEmail])
    {
      int64_t context = self->_context;

      if (!context)
      {
        PKLocalizedHideMyEmailString(&cfstr_HmeSettingsRow_0.isa);
        uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v5) {
          goto LABEL_8;
        }
      }
    }
    else
    {
    }
  }
  id v6 = objc_loadWeakRetained((id *)&self->_optionsDelegate);
  uint64_t v7 = [v6 defaultContactEmail];
  uint64_t v8 = [v7 emailAddresses];
  id v9 = [v8 firstObject];

  uint64_t v5 = [v9 value];

LABEL_8:
  if ([(__CFString *)v5 length]) {
    uint64_t v10 = v5;
  }
  else {
    uint64_t v10 = &stru_1EF1B5B50;
  }
  id v11 = v10;

  return v11;
}

- (id)_getDefaultContactPhone
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_optionsDelegate);
  uint64_t v3 = [WeakRetained defaultContactPhone];
  id v4 = [v3 phoneNumbers];
  uint64_t v5 = [v4 firstObject];

  id v6 = [v5 value];
  uint64_t v7 = [v6 pkFormattedStringValue];
  if ([(__CFString *)v7 length]) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = &stru_1EF1B5B50;
  }
  id v9 = v8;

  return v9;
}

- (id)_openAccountsGroupSpecifiers
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(NSMutableArray *)self->_openAccounts count])
  {
    openAccountGroupSpecifier = self->_openAccountGroupSpecifier;
    if (!openAccountGroupSpecifier)
    {
      uint64_t v5 = (void *)MEMORY[0x1E4F92E70];
      id v6 = PKLocalizedFeatureString();
      uint64_t v7 = [v5 groupSpecifierWithName:v6];
      uint64_t v8 = self->_openAccountGroupSpecifier;
      self->_openAccountGroupSpecifier = v7;

      id v9 = PKLocalizedFeatureString();
      [(PSSpecifier *)self->_openAccountGroupSpecifier setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F93170]];

      [(PSSpecifier *)self->_openAccountGroupSpecifier setObject:*MEMORY[0x1E4F85958] forKeyedSubscript:*MEMORY[0x1E4F93188]];
      openAccountGroupSpecifier = self->_openAccountGroupSpecifier;
    }
    [v3 addObject:openAccountGroupSpecifier];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v10 = self->_openAccounts;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      id v13 = 0;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v10);
          }
          id v16 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if (objc_msgSend(v16, "type", (void)v19) == 4)
          {
            id v17 = v16;

            id v13 = v17;
          }
        }
        uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v12);

      if (!v13) {
        goto LABEL_17;
      }
      uint64_t v10 = [(PKPassbookSettingsController *)self _accountSpecifierForAccount:v13];
      [v3 addObject:v10];
    }
    else
    {
      id v13 = 0;
    }

LABEL_17:
  }

  return v3;
}

- (id)_closedAccountsGroupSpecifiers
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(NSMutableArray *)self->_closedSavingsAccounts count])
  {
    closedAccountGroupSpecifier = self->_closedAccountGroupSpecifier;
    if (!closedAccountGroupSpecifier)
    {
      uint64_t v5 = (void *)MEMORY[0x1E4F92E70];
      id v6 = PKLocalizedFeatureString();
      uint64_t v7 = [v5 groupSpecifierWithName:v6];

      uint64_t v8 = PKLocalizedFeatureString();
      [v7 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F93170]];
      id v9 = self->_closedAccountGroupSpecifier;
      self->_closedAccountGroupSpecifier = (PSSpecifier *)v7;

      closedAccountGroupSpecifier = self->_closedAccountGroupSpecifier;
    }
    [v3 addObject:closedAccountGroupSpecifier];
    uint64_t v10 = (void *)MEMORY[0x1E4F92E70];
    uint64_t v11 = PKLocalizedFeatureString();
    uint64_t v12 = [v10 preferenceSpecifierNamed:v11 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v12 setObject:&unk_1EF2B8E38 forKeyedSubscript:*MEMORY[0x1E4F93050]];
    [v12 setControllerLoadAction:sel_showDocumentsForClosedSavingsAccounts_];
    [v3 addObject:v12];
  }

  return v3;
}

- (id)_accountSpecifierForAccount:(id)a3
{
  id v4 = a3;
  if ([v4 type] == 4)
  {
    uint64_t v5 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:3 edit:0];
    [v5 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x1E4F930A8]];
    [v5 setObject:&unk_1EF2B8E38 forKeyedSubscript:*MEMORY[0x1E4F93050]];
    +[PKAccountTableCell estimatedHeightForCellWithAccount:v4];
    id v6 = objc_msgSend(NSNumber, "numberWithDouble:");
    [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F93218]];

    uint64_t v7 = [v4 accountIdentifier];
    [v5 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F93188]];

    [v5 setObject:v4 forKeyedSubscript:@"pkAccount"];
    [v5 setControllerLoadAction:sel__showAccountInfoForSavingsAccountSpecifier_];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)showDocumentsForClosedSavingsAccounts:(id)a3
{
  closedSavingsAccounts = self->_closedSavingsAccounts;
  id v5 = a3;
  PKLocalizedFeatureString();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(PKPassbookSettingsController *)self _showDocumentsForAccounts:closedSavingsAccounts title:v6 sender:v5];
}

- (void)_showDocumentsForAccounts:(id)a3 title:(id)a4 sender:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  id v13 = objc_alloc_init(PKAccountDocumentsViewInterfaceConfiguration);
  [(PKAccountDocumentsViewInterfaceConfiguration *)v13 setAccounts:v9];

  uint64_t v10 = [[PKAccountDocumentsViewController alloc] initWithConfiguration:v13];
  uint64_t v11 = [(PKAccountDocumentsViewController *)v10 navigationItem];
  [v11 setTitle:v8];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained settingsController:self requestsPushViewController:v10 animated:a5 != 0];
  }
}

- (void)showSavingsAccount:(id)a3 destination:(unint64_t)a4 transaction:(id)a5 fundingSource:(id)a6 animated:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  [(PKPassbookSettingsController *)self _updateAccountIfNecessary:v14];
  uint64_t v23 = objc_alloc_init(PKAccountViewInterfaceConfiguration);
  [(PKAccountViewInterfaceConfiguration *)v23 setAccount:v14];
  [(PKAccountViewInterfaceConfiguration *)v23 setViewStyle:1];
  [(PKAccountViewInterfaceConfiguration *)v23 setTransaction:v13];

  [(PKAccountViewInterfaceConfiguration *)v23 setFundingSource:v12];
  id v15 = [v14 savingsDetails];

  id v16 = [v15 fccStepUpDetails];
  int v17 = [v16 thresholdExceeded];

  if (v12) {
    BOOL v18 = 0;
  }
  else {
    BOOL v18 = a4 == 12;
  }
  unint64_t v19 = 4;
  if (!v18) {
    unint64_t v19 = a4;
  }
  if (v17) {
    uint64_t v20 = 11;
  }
  else {
    uint64_t v20 = v19;
  }
  [(PKAccountViewInterfaceConfiguration *)v23 setDestination:v20];
  long long v21 = [[PKSavingsAccountDetailsViewController alloc] initWithConfiguration:v23];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained settingsController:self requestsPushViewController:v21 animated:v7];
  }
}

- (void)_showAccountInfoForSavingsAccountSpecifier:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"pkAccount"];
  if (v4)
  {
    id v5 = v4;
    [(PKPassbookSettingsController *)self showSavingsAccount:v4 destination:1 transaction:0 fundingSource:0 animated:1];
    id v4 = v5;
  }
}

- (void)didUpdateDefaultPaymentPassWithUniqueIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__PKPassbookSettingsController_didUpdateDefaultPaymentPassWithUniqueIdentifier___block_invoke;
  v6[3] = &unk_1E59CA870;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __80__PKPassbookSettingsController_didUpdateDefaultPaymentPassWithUniqueIdentifier___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 120), *(id *)(a1 + 40));
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 648));
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 _defaultPaymentSpecifier];
  [WeakRetained settingsController:v2 requestsReloadSpecifier:v3];
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitPassProperties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__PKPassbookSettingsController_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke;
  block[3] = &unk_1E59CA8E8;
  id v11 = v7;
  id v12 = self;
  id v13 = v6;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __99__PKPassbookSettingsController_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1) {
    return [*(id *)(result + 40) _updateBalancesWithServerBalances:0 transitPassProperties:v1 forPassWithUniqueIdentifier:*(void *)(result + 48)];
  }
  return result;
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__PKPassbookSettingsController_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke;
  block[3] = &unk_1E59CA8E8;
  void block[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __88__PKPassbookSettingsController_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateBalancesWithServerBalances:*(void *)(a1 + 40) transitPassProperties:0 forPassWithUniqueIdentifier:*(void *)(a1 + 48)];
}

- (void)_peerPaymentWebServiceDidChangeNotification:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__PKPassbookSettingsController__peerPaymentWebServiceDidChangeNotification___block_invoke;
  block[3] = &unk_1E59CA7D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __76__PKPassbookSettingsController__peerPaymentWebServiceDidChangeNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) refreshPeerPaymentStatus];
}

- (void)_peerPaymentAccountDidChangeNotification:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__PKPassbookSettingsController__peerPaymentAccountDidChangeNotification___block_invoke;
  block[3] = &unk_1E59CA7D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __73__PKPassbookSettingsController__peerPaymentAccountDidChangeNotification___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 416) targetDevice];
  uint64_t v3 = [v2 account];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 448);
  *(void *)(v4 + 448) = v3;

  [*(id *)(a1 + 32) _refreshPasses];
  id v6 = *(void **)(a1 + 32);

  return [v6 refreshPeerPaymentStatus];
}

- (void)peerPaymentAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  p_delegate = &self->_delegate;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained settingsController:self requestsPresentViewController:v8 animated:v5 completion:0];
}

- (void)peerPaymentAccountResolutionController:(id)a3 requestsDismissCurrentViewControllerAnimated:(BOOL)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained requestDismissingPresentedViewControllerWithSettingsController:self animated:1 completion:0];
}

- (BOOL)_isPeerPaymentRegistered
{
  if (PKUseMockSURFServer() & 1) != 0 || (PKStoreDemoModeEnabled())
  {
    LOBYTE(v3) = 1;
  }
  else if ([(PKPeerPaymentWebService *)self->_peerPaymentWebService needsRegistration])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    BOOL v5 = [(PKPeerPaymentWebService *)self->_peerPaymentWebService targetDevice];
    int v3 = [v5 userHasDisabledPeerPayment] ^ 1;
  }
  return v3;
}

- (void)_registerForPeerPaymentWithSpecifier:(id)a3
{
  id v4 = a3;
  self->_registeringForPeerPayment = 1;
  BOOL v5 = [(PKPeerPaymentWebService *)self->_peerPaymentWebService targetDevice];
  char v6 = [v5 userHasDisabledPeerPayment];

  id v7 = [(PKPeerPaymentWebService *)self->_peerPaymentWebService targetDevice];
  [v7 setUserHasDisabledPeerPayment:0];

  uint64_t v8 = MEMORY[0x1E4F1CC38];
  [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"PKSwitchSpinnerTableCellShowSpinner"];
  [v4 setObject:v8 forKeyedSubscript:@"PKSwitchSpinnerTableCellSwitchIsOn"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained settingsController:self requestsReloadSpecifier:v4];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__PKPassbookSettingsController__registerForPeerPaymentWithSpecifier___block_invoke;
  aBlock[3] = &unk_1E59CA870;
  void aBlock[4] = self;
  id v10 = v4;
  id v34 = v10;
  id v11 = _Block_copy(aBlock);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  void v30[2] = __69__PKPassbookSettingsController__registerForPeerPaymentWithSpecifier___block_invoke_2;
  v30[3] = &unk_1E59CE110;
  v30[4] = self;
  id v12 = v10;
  id v31 = v12;
  id v13 = v11;
  id v32 = v13;
  id v14 = _Block_copy(v30);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  void v27[2] = __69__PKPassbookSettingsController__registerForPeerPaymentWithSpecifier___block_invoke_4;
  v27[3] = &unk_1E59D1C70;
  v27[4] = self;
  char v29 = v6;
  id v15 = v13;
  id v28 = v15;
  id v16 = _Block_copy(v27);
  peerPaymentDelegate = self->_peerPaymentDelegate;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __69__PKPassbookSettingsController__registerForPeerPaymentWithSpecifier___block_invoke_5;
  v22[3] = &unk_1E59D1D10;
  v22[4] = self;
  id v23 = v12;
  id v24 = v16;
  id v25 = v15;
  id v26 = v14;
  id v18 = v14;
  id v19 = v15;
  id v20 = v12;
  id v21 = v16;
  [(PKPassbookPeerPaymentSettingsDelegate *)peerPaymentDelegate peerPaymentRegistrationStatusHasChanged:1 completion:v22];
}

void __69__PKPassbookSettingsController__registerForPeerPaymentWithSpecifier___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 456) = 0;
  [*(id *)(a1 + 32) _refreshPasses];
  [*(id *)(a1 + 40) setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"PKSwitchSpinnerTableCellShowSpinner"];
  id v2 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "_isPeerPaymentRegistered"));
  [*(id *)(a1 + 40) setObject:v2 forKeyedSubscript:@"PKSwitchSpinnerTableCellSwitchIsOn"];

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 648));
  [WeakRetained settingsControllerRequestsReloadSpecifiers:*(void *)(a1 + 32)];
}

void __69__PKPassbookSettingsController__registerForPeerPaymentWithSpecifier___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __69__PKPassbookSettingsController__registerForPeerPaymentWithSpecifier___block_invoke_3;
  v3[3] = &unk_1E59CA9F8;
  id v4 = *(id *)(a1 + 48);
  [v1 _presentPeerPaymentSetupFlowForSpecifier:v2 completion:v3];
}

uint64_t __69__PKPassbookSettingsController__registerForPeerPaymentWithSpecifier___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __69__PKPassbookSettingsController__registerForPeerPaymentWithSpecifier___block_invoke_4(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4) {
    [*(id *)(a1 + 32) _requestDelegatePresentViewController:v4];
  }
  if (*(unsigned char *)(a1 + 48))
  {
    int v3 = [*(id *)(*(void *)(a1 + 32) + 416) targetDevice];
    [v3 setUserHasDisabledPeerPayment:1];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __69__PKPassbookSettingsController__registerForPeerPaymentWithSpecifier___block_invoke_5(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__PKPassbookSettingsController__registerForPeerPaymentWithSpecifier___block_invoke_6;
  block[3] = &unk_1E59D1CE8;
  char v17 = a2;
  id v11 = v5;
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(a1 + 40);
  id v14 = v6;
  uint64_t v12 = v7;
  id v13 = v8;
  id v15 = *(id *)(a1 + 56);
  id v16 = *(id *)(a1 + 64);
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __69__PKPassbookSettingsController__registerForPeerPaymentWithSpecifier___block_invoke_6(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 80);
  int v3 = *(void **)(a1 + 32);
  if (v2) {
    BOOL v4 = v3 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    id v5 = [v3 userInfo];
    id v6 = [v5 objectForKey:*MEMORY[0x1E4F28A50]];

    uint64_t v7 = [*(id *)(a1 + 32) domain];
    uint64_t v8 = *MEMORY[0x1E4F87CD8];
    if ([v7 isEqualToString:*MEMORY[0x1E4F87CD8]])
    {
      uint64_t v9 = [*(id *)(a1 + 32) code];

      if (!v9)
      {
        PKLocalizedPeerPaymentString(&cfstr_PeerPaymentSet_0.isa);
        id v10 = (id)objc_claimAutoreleasedReturnValue();
        id v11 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentSet_1.isa);
        uint64_t v12 = PKDisplayableErrorCustom();
        id v13 = PKAlertForDisplayableErrorWithHandlers(v12, 0, 0, 0);
LABEL_8:
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

LABEL_27:
        goto LABEL_28;
      }
    }
    else
    {
    }
    id v18 = [v6 domain];
    if ([v18 isEqualToString:*MEMORY[0x1E4F879E0]] && objc_msgSend(v6, "code") == 9)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 648));
      char v20 = objc_opt_respondsToSelector();

      if (v20)
      {
        id v21 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 648));
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __69__PKPassbookSettingsController__registerForPeerPaymentWithSpecifier___block_invoke_7;
        v36[3] = &unk_1E59D1CC0;
        uint64_t v22 = *(void *)(a1 + 40);
        id v23 = *(id *)(a1 + 32);
        uint64_t v24 = *(void *)(a1 + 40);
        id v25 = *(void **)(a1 + 48);
        id v37 = v23;
        uint64_t v38 = v24;
        id v39 = v25;
        id v40 = *(id *)(a1 + 64);
        id v41 = *(id *)(a1 + 56);
        [v21 settingsController:v22 requestsPresentSecurityRepairFlowWithSecurityCapabilities:72 completion:v36];

        uint64_t v12 = v37;
LABEL_28:

        return;
      }
    }
    else
    {
    }
    if (*(void *)(*(void *)(a1 + 40) + 40) == 1)
    {
      id v26 = [*(id *)(a1 + 32) domain];
      if ([v26 isEqualToString:v8] && objc_msgSend(*(id *)(a1 + 32), "code") == 40308)
      {
        int v27 = PKIsAltAccountPairedOrPairing();

        if (v27)
        {
          id v28 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19F450000, v28, OS_LOG_TYPE_DEFAULT, "A parent tried to turn on apple cash for a childs tinker device.", buf, 2u);
          }

          uint64_t v12 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentDas.isa);
          PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentDas_0.isa);
          id v10 = (id)objc_claimAutoreleasedReturnValue();
          id v11 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentDas_1.isa);
          id v13 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v12 message:v10 preferredStyle:1];
          v34[0] = MEMORY[0x1E4F143A8];
          v34[1] = 3221225472;
          void v34[2] = __69__PKPassbookSettingsController__registerForPeerPaymentWithSpecifier___block_invoke_654;
          v34[3] = &unk_1E59CB1F0;
          v34[4] = *(void *)(a1 + 40);
          char v29 = [MEMORY[0x1E4FB1410] actionWithTitle:v11 style:0 handler:v34];
          [v13 addAction:v29];

          id v30 = (void *)MEMORY[0x1E4FB1410];
          id v31 = PKLocalizedString(&cfstr_Cancel.isa);
          id v32 = [v30 actionWithTitle:v31 style:1 handler:0];
          [v13 addAction:v32];

          goto LABEL_8;
        }
      }
      else
      {
      }
    }
    uint64_t v12 = [MEMORY[0x1E4F84D80] displayableErrorForError:*(void *)(a1 + 32)];
    id v10 = PKAlertForDisplayableErrorWithHandlers(v12, 0, 0, 0);
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_27;
  }
  id v14 = [*(id *)(*(void *)(a1 + 40) + 416) targetDevice];
  id v15 = [v14 account];

  uint64_t v16 = *(void *)(a1 + 40);
  char v17 = *(void **)(v16 + 448);
  *(void *)(v16 + 448) = v15;
  id v33 = v15;

  [*(id *)(*(void *)(a1 + 40) + 440) setAccount:v33];
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

void __69__PKPassbookSettingsController__registerForPeerPaymentWithSpecifier___block_invoke_7(uint64_t a1, uint64_t a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__PKPassbookSettingsController__registerForPeerPaymentWithSpecifier___block_invoke_8;
  v6[3] = &unk_1E59D1C98;
  uint64_t v12 = a2;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(void **)(a1 + 48);
  id v7 = v3;
  uint64_t v8 = v4;
  id v9 = v5;
  id v10 = *(id *)(a1 + 56);
  id v11 = *(id *)(a1 + 64);
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __69__PKPassbookSettingsController__registerForPeerPaymentWithSpecifier___block_invoke_8(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = PKSecurityCapabilitiesErrorToString(*(void *)(a1 + 72));
    uint64_t v4 = *(void *)(a1 + 32);
    int v8 = 138412546;
    id v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Finished checking peer payment security capabilities with upgrade error %@, error %@", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 72);
  if (v5 == 3)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else if (v5)
  {
    id v6 = [MEMORY[0x1E4F84D80] displayableErrorForError:*(void *)(a1 + 32)];
    id v7 = PKAlertForDisplayableErrorWithHandlers(v6, 0, 0, 0);
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    [*(id *)(a1 + 40) _registerForPeerPaymentWithSpecifier:*(void *)(a1 + 48)];
  }
}

void __69__PKPassbookSettingsController__registerForPeerPaymentWithSpecifier___block_invoke_654(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = [*(id *)(*(void *)(a1 + 32) + 416) _appleAccountInformation];
  int v2 = [v1 aaAlternateDSID];

  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v2;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Presenting apple cash family sharing in settings for altDSID %@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v4 = PKPeerPaymentGetAppleCashFamilySettingsSensitiveURLForAltDSID();
  uint64_t v5 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v5 openSensitiveURL:v4 withOptions:0];
}

- (void)_presentFeatureNotEnabledForDemoForSpecifier:(id)a3
{
  PKUIStoreDemoGatewayViewController();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [(PKPassbookSettingsController *)self delegate];
  [v4 settingsController:self requestsPresentViewController:v5 animated:1 completion:0];
}

- (void)_presentPeerPaymentReOpenCardFlowForSpecifier:(id)a3
{
  if ([(PKPeerPaymentAccountResolutionController *)self->_peerPaymentAccountResolutionController currentPeerPaymentAccountResolution] == 4)
  {
    peerPaymentAccountResolutionController = self->_peerPaymentAccountResolutionController;
    [(PKPeerPaymentAccountResolutionController *)peerPaymentAccountResolutionController presentResolutionForCurrentAccountStateWithCompletion:0];
  }
}

- (void)_presentPeerPaymentSetupFlowForSpecifier:(id)a3
{
}

- (void)_presentPeerPaymentSetupFlowForSpecifier:(id)a3 completion:(id)a4
{
  id v5 = (void (**)(id, void))a4;
  if ([(PKPeerPaymentAccountResolutionController *)self->_peerPaymentAccountResolutionController currentPeerPaymentAccountResolution] == 1)
  {
    [(PKPeerPaymentAccountResolutionController *)self->_peerPaymentAccountResolutionController presentResolutionForCurrentAccountStateWithCompletion:v5];
  }
  else if (v5)
  {
    v5[2](v5, 0);
  }
}

- (void)_presentPeerPaymentSetupFlowWithAmount:(id)a3 flowState:(unint64_t)a4 senderAddress:(id)a5 completion:(id)a6
{
  id v13 = a3;
  id v10 = a5;
  uint64_t v11 = (void (**)(id, void))a6;
  if ([(PKPeerPaymentAccountResolutionController *)self->_peerPaymentAccountResolutionController currentPeerPaymentAccountResolution] == 1)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F84D60]);
    if (v13) {
      [v12 setCurrencyAmount:v13];
    }
    [v12 setRegistrationFlowState:a4];
    if (v10) {
      [v12 setSenderAddress:v10];
    }
    [(PKPeerPaymentAccountResolutionController *)self->_peerPaymentAccountResolutionController presentFlowForAccountResolution:1 configuration:v12 completion:v11];
  }
  else if (v11)
  {
    v11[2](v11, 0);
  }
}

- (void)_unregisterForPeerPaymentWithSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPeerPaymentWebService *)self->_peerPaymentWebService targetDevice];
  int v6 = [v5 account];

  id v7 = [v6 associatedPassUniqueID];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_passLibraryDataProvider);
  id v9 = [WeakRetained passWithUniqueID:v7];
  id v10 = [v9 secureElementPass];

  int v11 = [v10 hasMerchantTokens];
  id v12 = [(PKPeerPaymentWebService *)self->_peerPaymentWebService peerPaymentService];
  int v13 = [v12 hasRecurringPayments];

  v62 = v6;
  int v63 = v11;
  if (self->_context == 1 && PKIsAltAccountPairedOrPairing())
  {
    int v14 = v11;
    id v15 = objc_alloc(MEMORY[0x1E4F84708]);
    uint64_t v16 = [MEMORY[0x1E4F50C20] sharedInstance];
    char v17 = [v16 cachedTinkerFamilyMemeber];
    id v18 = (void *)[v15 initWithFAFamilyMember:v17];

    uint64_t v19 = [v18 firstName];
    if (v19)
    {
      char v20 = (void *)v19;
      id v21 = [v18 appleID];

      if (v21)
      {
        uint64_t v22 = [v18 firstName];
        uint64_t v64 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentBri.isa, &stru_1EF1B4C70.isa, v22);

        id v23 = [v18 firstName];
        if ((v14 & v13) == 1)
        {
          uint64_t v24 = [v18 firstName];
          [v18 appleID];
          v26 = id v25 = v23;
          id v23 = PKLocalizedMerchantTokensString(&cfstr_DeleteMerchant_4.isa, &stru_1EF1B9A70.isa, v23, v24, v26);

          int v27 = PKLocalizedPeerPaymentRecurringString(&cfstr_RemovePeerPaym.isa);
          uint64_t v28 = [NSString stringWithFormat:@"%@\n\n%@", v23, v27];
LABEL_28:
          uint64_t v60 = v28;
LABEL_29:

          uint64_t v34 = v64;
          uint64_t v29 = v60;
          int v11 = v63;
          if (v64) {
            goto LABEL_19;
          }
          goto LABEL_8;
        }
        if (v14)
        {
          int v27 = [v18 firstName];
          uint64_t v58 = [v18 appleID];
          uint64_t v59 = PKLocalizedMerchantTokensString(&cfstr_DeleteMerchant_4.isa, &stru_1EF1B9A70.isa, v23, v27, v58);
        }
        else
        {
          if (!v13)
          {
            int v27 = [v18 appleID];
            uint64_t v28 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentBri_0.isa, &stru_1EF1B5770.isa, v23, v27);
            goto LABEL_28;
          }
          int v27 = [v18 firstName];
          uint64_t v58 = [v18 appleID];
          uint64_t v59 = PKLocalizedPeerPaymentRecurringString(&cfstr_RemovePeerPaym_0.isa, &stru_1EF1B9A70.isa, v23, v27, v58);
        }
        uint64_t v60 = v59;

        goto LABEL_29;
      }
    }

    uint64_t v29 = 0;
    int v11 = v14;
  }
  else
  {
    uint64_t v29 = 0;
  }
LABEL_8:
  uint64_t v65 = v10;
  id v30 = v7;
  id v31 = v4;
  id v32 = (void *)v29;
  PKDeviceSpecificLocalizedStringKeyForKey(@"PEER_PAYMENT_TURN_OFF_ALERT_TITLE", self->_context == 1);
  id v33 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v34 = PKLocalizedPeerPaymentString(v33);

  uint64_t v35 = PKPrimaryAppleAccountFormattedUsername();
  id v36 = (void *)v35;
  if ((v11 & v13) == 1)
  {
    uint64_t v37 = PKLocalizedMerchantTokensString(&cfstr_DeleteMerchant_5.isa, &stru_1EF1B4C70.isa, v35);

    uint64_t v38 = PKLocalizedPeerPaymentRecurringString(&cfstr_RemovePeerPaym.isa);
    uint64_t v29 = [NSString stringWithFormat:@"%@\n\n%@", v37, v38];

    id v39 = (void *)v38;
    id v36 = (void *)v37;
  }
  else
  {
    if (v11)
    {
      uint64_t v40 = PKLocalizedMerchantTokensString(&cfstr_DeleteMerchant_5.isa, &stru_1EF1B4C70.isa, v35);
    }
    else
    {
      if (v13) {
        PKLocalizedPeerPaymentRecurringString(&cfstr_RemovePeerPaym_1.isa, &stru_1EF1B4C70.isa, v35);
      }
      else {
      uint64_t v40 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentTur_0.isa, &stru_1EF1B4C70.isa, v35);
      }
    }
    uint64_t v29 = v40;
    id v39 = v32;
  }
  id v4 = v31;
  id v7 = v30;
  id v10 = v65;

LABEL_19:
  id v66 = (void *)v34;
  int v61 = (void *)v29;
  id v41 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v34 message:v29 preferredStyle:1];
  long long v42 = (void *)MEMORY[0x1E4FB1410];
  long long v43 = PKLocalizedString(&cfstr_Cancel.isa);
  v74[0] = MEMORY[0x1E4F143A8];
  v74[1] = 3221225472;
  v74[2] = __71__PKPassbookSettingsController__unregisterForPeerPaymentWithSpecifier___block_invoke;
  v74[3] = &unk_1E59CB218;
  v74[4] = self;
  id v44 = v4;
  id v75 = v44;
  long long v45 = [v42 actionWithTitle:v43 style:1 handler:v74];

  long long v46 = (void *)MEMORY[0x1E4FB1410];
  long long v47 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentTur_1.isa);
  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = __71__PKPassbookSettingsController__unregisterForPeerPaymentWithSpecifier___block_invoke_2;
  v70[3] = &unk_1E59CCA50;
  v70[4] = self;
  id v48 = v44;
  id v71 = v48;
  id v49 = v10;
  id v72 = v49;
  id v50 = v7;
  id v73 = v50;
  long long v51 = [v46 actionWithTitle:v47 style:0 handler:v70];

  long long v52 = (void *)MEMORY[0x1E4FB1410];
  char v53 = PKLocalizedMerchantTokensString(&cfstr_DeleteMerchant_2.isa);
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __71__PKPassbookSettingsController__unregisterForPeerPaymentWithSpecifier___block_invoke_697;
  v67[3] = &unk_1E59CAC80;
  v67[4] = self;
  id v68 = v48;
  id v69 = v49;
  id v54 = v49;
  id v55 = v48;
  char v56 = [v52 actionWithTitle:v53 style:0 handler:v67];

  [v41 addAction:v45];
  [v41 addAction:v51];
  if (v63) {
    [v41 addAction:v56];
  }
  [v41 setPreferredAction:v51];
  id v57 = objc_loadWeakRetained((id *)&self->_delegate);
  [v57 settingsController:self requestsPresentViewController:v41 animated:1 completion:0];
}

void __71__PKPassbookSettingsController__unregisterForPeerPaymentWithSpecifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 648));
  [WeakRetained settingsController:*(void *)(a1 + 32) requestsReloadSpecifier:*(void *)(a1 + 40)];
}

void __71__PKPassbookSettingsController__unregisterForPeerPaymentWithSpecifier___block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(*(void *)(a1 + 32) + 416) targetDevice];
  [v2 setUserHasDisabledPeerPayment:1];

  [*(id *)(a1 + 40) setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"PKSwitchSpinnerTableCellShowSpinner"];
  [*(id *)(a1 + 40) setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"PKSwitchSpinnerTableCellSwitchIsOn"];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 648));
  [WeakRetained settingsController:*(void *)(a1 + 32) requestsReloadSpecifier:*(void *)(a1 + 40)];

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 408);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__PKPassbookSettingsController__unregisterForPeerPaymentWithSpecifier___block_invoke_3;
  v6[3] = &unk_1E59D1D60;
  void v6[4] = v4;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  id v9 = *(id *)(a1 + 40);
  [v5 peerPaymentRegistrationStatusHasChanged:0 completion:v6];
}

void __71__PKPassbookSettingsController__unregisterForPeerPaymentWithSpecifier___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__PKPassbookSettingsController__unregisterForPeerPaymentWithSpecifier___block_invoke_4;
  v9[3] = &unk_1E59D1D38;
  char v15 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  id v10 = v5;
  uint64_t v11 = v6;
  id v12 = v7;
  id v13 = *(id *)(a1 + 48);
  id v14 = *(id *)(a1 + 56);
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

void __71__PKPassbookSettingsController__unregisterForPeerPaymentWithSpecifier___block_invoke_4(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 72) && !*(void *)(a1 + 32))
  {
    if (*(void *)(a1 + 48))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16));
      [WeakRetained removePass:*(void *)(a1 + 48)];
    }
    else
    {
      id WeakRetained = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(a1 + 56);
        int v9 = 138412290;
        uint64_t v10 = v6;
        _os_log_impl(&dword_19F450000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Unable to remove peer payment pass. Pass library data provider failed to vend pass with uniqueID: %@", (uint8_t *)&v9, 0xCu);
      }
    }

    [*(id *)(a1 + 40) _refreshPasses];
  }
  else
  {
    int v2 = [*(id *)(*(void *)(a1 + 40) + 416) targetDevice];
    [v2 setUserHasDisabledPeerPayment:0];

    id v3 = [MEMORY[0x1E4F84D80] displayableErrorForError:*(void *)(a1 + 32)];
    id v4 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);

    [*(id *)(a1 + 40) _requestDelegatePresentViewController:v4];
  }
  [*(id *)(a1 + 64) setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"PKSwitchSpinnerTableCellShowSpinner"];
  id v7 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "_isPeerPaymentRegistered"));
  [*(id *)(a1 + 64) setObject:v7 forKeyedSubscript:@"PKSwitchSpinnerTableCellSwitchIsOn"];

  id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 648));
  [v8 settingsControllerRequestsReloadSpecifiers:*(void *)(a1 + 40)];
}

void __71__PKPassbookSettingsController__unregisterForPeerPaymentWithSpecifier___block_invoke_697(void *a1)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 648));
  [WeakRetained settingsController:a1[4] requestsReloadSpecifier:a1[5]];

  id v3 = (void *)MEMORY[0x1E4F843E0];
  v12[0] = *MEMORY[0x1E4F87038];
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  uint64_t v5 = *MEMORY[0x1E4F86380];
  uint64_t v6 = *MEMORY[0x1E4F86120];
  v10[0] = *MEMORY[0x1E4F86308];
  v10[1] = v6;
  v11[0] = v5;
  v11[1] = @"learnMore";
  id v10[2] = *MEMORY[0x1E4F86730];
  v11[2] = *MEMORY[0x1E4F86758];
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];
  [v3 subjects:v4 sendEvent:v7];

  id v8 = [[PKMerchantTokensViewController alloc] initWithPass:a1[6] merchantTokensResponse:0];
  id v9 = objc_loadWeakRetained((id *)(a1[4] + 648));
  [v9 settingsController:a1[4] requestsPushViewController:v8 animated:1];
}

- (id)_peerPaymentGroupSpecifiers
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [MEMORY[0x1E4F92E70] emptyGroupSpecifier];
  PKDeviceSpecificLocalizedStringKeyForKey(@"PEER_PAYMENT_REGISTRATION_FOOTER_TEXT", self->_context == 1);
  uint64_t v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = PKLocalizedPeerPaymentString(v5);

  [v4 setProperty:v6 forKey:*MEMORY[0x1E4F93170]];
  [v3 addObject:v4];
  id v7 = [(PKPassbookSettingsController *)self _peerPaymentSwitchSpecifier];
  [v3 addObject:v7];

  return v3;
}

- (id)_peerPaymentTinkerGroupSpecifiers
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentBri_1.isa);
  uint64_t v5 = [MEMORY[0x1E4F92E70] groupSpecifierWithName:v4];
  [v5 setProperty:v4 forKey:*MEMORY[0x1E4F93188]];
  uint64_t v6 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentBri_2.isa);
  [v5 setProperty:v6 forKey:*MEMORY[0x1E4F93170]];

  id v7 = (void *)MEMORY[0x1E4F92E70];
  id v8 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentBri_3.isa);
  id v9 = [v7 preferenceSpecifierNamed:v8 target:self set:0 get:0 detail:0 cell:13 edit:0];
  peerPaymentTinkerSetupButton = self->_peerPaymentTinkerSetupButton;
  self->_peerPaymentTinkerSetupButton = v9;

  [(PSSpecifier *)self->_peerPaymentTinkerSetupButton setButtonAction:sel_setupPeerPaymentTinkerButtonTapped];
  [(PSSpecifier *)self->_peerPaymentTinkerSetupButton setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x1E4F930A8]];
  [(PSSpecifier *)self->_peerPaymentTinkerSetupButton setObject:&unk_1EF2B8E20 forKeyedSubscript:*MEMORY[0x1E4F93060]];
  [v3 addObject:v5];
  [v3 addObject:self->_peerPaymentTinkerSetupButton];

  return v3;
}

- (void)setupPeerPaymentTinkerButtonTapped
{
  [(PSSpecifier *)self->_peerPaymentTinkerSetupButton setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F93130]];
  [(PSSpecifier *)self->_peerPaymentTinkerSetupButton setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"PKSettingsSpecifierLoadingKey"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained settingsController:self requestsReloadSpecifier:self->_peerPaymentTinkerSetupButton];

  id v4 = objc_alloc_init(MEMORY[0x1E4F84C38]);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__PKPassbookSettingsController_setupPeerPaymentTinkerButtonTapped__block_invoke;
  v5[3] = &unk_1E59CB328;
  v5[4] = self;
  [v4 familyMembersWithCompletion:v5];
}

void __66__PKPassbookSettingsController_setupPeerPaymentTinkerButtonTapped__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__PKPassbookSettingsController_setupPeerPaymentTinkerButtonTapped__block_invoke_2;
  v6[3] = &unk_1E59CA870;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __66__PKPassbookSettingsController_setupPeerPaymentTinkerButtonTapped__block_invoke_2(uint64_t a1)
{
  id v13 = (id)[objc_alloc(MEMORY[0x1E4F84710]) initWithFamilyMembers:*(void *)(a1 + 32)];
  if (*(void *)(*(void *)(a1 + 40) + 40) == 1) {
    uint64_t v2 = 4;
  }
  else {
    uint64_t v2 = 3;
  }
  id v3 = [PKPeerPaymentAssociatedAccountsController alloc];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(v4 + 88);
  id WeakRetained = objc_loadWeakRetained((id *)(v4 + 16));
  uint64_t v7 = [(PKPeerPaymentAssociatedAccountsController *)v3 initWithFamilyCollection:v13 avatarManager:v5 passLibraryDataProvider:WeakRetained context:v2];
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = *(void **)(v8 + 96);
  *(void *)(v8 + 96) = v7;

  id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 648));
  LOBYTE(v3) = objc_opt_respondsToSelector();

  if (v3)
  {
    id v11 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 648));
    [v11 settingsController:*(void *)(a1 + 40) requestShowPeerPaymentAssociatedAccountsFlowWithController:*(void *)(*(void *)(a1 + 40) + 96) withPresentationContext:0];
  }
  [*(id *)(*(void *)(a1 + 40) + 432) setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F93130]];
  [*(id *)(*(void *)(a1 + 40) + 432) setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"PKSettingsSpecifierLoadingKey"];
  id v12 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 648));
  [v12 settingsController:*(void *)(a1 + 40) requestsReloadSpecifier:*(void *)(*(void *)(a1 + 40) + 432)];
}

- (void)_fetchAccounts
{
  objc_initWeak(&location, self);
  accountService = self->_accountService;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__PKPassbookSettingsController__fetchAccounts__block_invoke;
  v4[3] = &unk_1E59CDFB0;
  objc_copyWeak(&v5, &location);
  v4[4] = self;
  [(PKAccountService *)accountService accountsWithCompletion:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __46__PKPassbookSettingsController__fetchAccounts__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__PKPassbookSettingsController__fetchAccounts__block_invoke_2;
  block[3] = &unk_1E59CB378;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
}

void __46__PKPassbookSettingsController__fetchAccounts__block_invoke_2(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v24 = (id *)(a1 + 48);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v4 = WeakRetained[73];
    WeakRetained[73] = v3;

    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v6 = WeakRetained[74];
    id v26 = WeakRetained;
    WeakRetained[74] = v5;

    long long v37 = 0u;
    long long v38 = 0u;
    long long v36 = 0u;
    long long v35 = 0u;
    uint64_t v25 = a1;
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (!v8)
    {

      goto LABEL_37;
    }
    char v27 = 0;
    char v9 = 0;
    uint64_t v10 = *(void *)v36;
    id v11 = WeakRetained + 31;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v36 != v10) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v14 = [v13 feature];
        switch(v14)
        {
          case 2:
            uint64_t v16 = [v13 creditDetails];
            BOOL v17 = [v16 rewardsDestination] == 3;

            if (v17)
            {
              long long v33 = 0u;
              long long v34 = 0u;
              long long v31 = 0u;
              long long v32 = 0u;
              id v18 = *(id *)(v25 + 32);
              uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v39 count:16];
              if (v19)
              {
                uint64_t v20 = *(void *)v32;
                while (2)
                {
                  for (uint64_t j = 0; j != v19; ++j)
                  {
                    if (*(void *)v32 != v20) {
                      objc_enumerationMutation(v18);
                    }
                    if ([*(id *)(*((void *)&v31 + 1) + 8 * j) feature] == 5)
                    {

                      goto LABEL_30;
                    }
                  }
                  uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v39 count:16];
                  if (v19) {
                    continue;
                  }
                  break;
                }
              }

              if ((PKCheckedForSavingsPresence() & 1) == 0)
              {
                uint64_t v22 = PKLogFacilityTypeGetObject();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_19F450000, v22, OS_LOG_TYPE_DEFAULT, "Card account rewards destination is set to Savings, but not Savings account present, refreshing accounts", buf, 2u);
                }

                id v23 = *(void **)(*(void *)(v25 + 40) + 472);
                v28[0] = MEMORY[0x1E4F143A8];
                v28[1] = 3221225472;
                v28[2] = __46__PKPassbookSettingsController__fetchAccounts__block_invoke_722;
                v28[3] = &unk_1E59D1D88;
                objc_copyWeak(&v29, v24);
                [v23 updateAccountsWithCompletion:v28];
                objc_destroyWeak(&v29);
              }
            }
            break;
          case 5:
            uint64_t v15 = [v13 state];
            if ((unint64_t)(v15 - 1) >= 3)
            {
              if (v15 == 4) {
                [v26[73] addObject:v13];
              }
            }
            else
            {
              [v26[74] addObject:v13];
            }
            char v9 = 1;
            break;
          case 3:
            objc_storeStrong(v11, v13);
            char v27 = 1;
            break;
        }
LABEL_30:
        ;
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v8);

    if (v9) {
      [v26 _refreshAccountSpecifiers];
    }
    id WeakRetained = v26;
    if (v27)
    {
      [v26 _refreshPasses];
LABEL_37:
      id WeakRetained = v26;
    }
  }
}

void __46__PKPassbookSettingsController__fetchAccounts__block_invoke_722(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Refreshed accounts after missing destination account, with error %@", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__PKPassbookSettingsController__fetchAccounts__block_invoke_723;
  v7[3] = &unk_1E59CA7A8;
  id v8 = v4;
  id v6 = v4;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], v7);
  objc_destroyWeak(&v9);
}

void __46__PKPassbookSettingsController__fetchAccounts__block_invoke_723(uint64_t a1)
{
  if (!*(void *)(a1 + 32)) {
    PKSetCheckedForSavingsPresence();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _fetchAccounts];
    id WeakRetained = v3;
  }
}

- (void)_updateAccountIfNecessary:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F1C9C8] date];
    id v6 = [v4 lastUpdated];
    [v5 timeIntervalSinceDate:v6];
    double v8 = v7;

    if (v8 > 300.0)
    {
      accountService = self->_accountService;
      uint64_t v10 = [v4 accountIdentifier];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __58__PKPassbookSettingsController__updateAccountIfNecessary___block_invoke;
      void v11[3] = &unk_1E59D1DB0;
      objc_copyWeak(&v13, &location);
      id v12 = v4;
      [(PKAccountService *)accountService updateAccountWithIdentifier:v10 extended:0 completion:v11];

      objc_destroyWeak(&v13);
    }
  }
  objc_destroyWeak(&location);
}

void __58__PKPassbookSettingsController__updateAccountIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v4 && WeakRetained && (PKEqualObjects() & 1) == 0) {
    [WeakRetained _processAccountChanged:v4];
  }
}

- (void)_processAccountChanged:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__PKPassbookSettingsController__processAccountChanged___block_invoke;
  v6[3] = &unk_1E59CA870;
  id v7 = v4;
  double v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __55__PKPassbookSettingsController__processAccountChanged___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) feature];
  if (result == 5)
  {
    id v4 = *(void **)(*(void *)(a1 + 40) + 584);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __55__PKPassbookSettingsController__processAccountChanged___block_invoke_2;
    v12[3] = &unk_1E59D1DD8;
    id v13 = *(id *)(a1 + 32);
    objc_msgSend(v4, "pk_removeObjectsPassingTest:", v12);
    id v5 = *(void **)(*(void *)(a1 + 40) + 592);
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    id v9 = __55__PKPassbookSettingsController__processAccountChanged___block_invoke_3;
    uint64_t v10 = &unk_1E59D1DD8;
    id v11 = *(id *)(a1 + 32);
    objc_msgSend(v5, "pk_removeObjectsPassingTest:", &v7);
    uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "state", v7, v8, v9, v10);
    if ((unint64_t)(v6 - 1) <= 3) {
      [*(id *)(*(void *)(a1 + 40) + qword_1A0443AB0[v6 - 1]) addObject:*(void *)(a1 + 32)];
    }

    return [*(id *)(a1 + 40) _refreshAccountSpecifiers];
  }
  else if (result == 3)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 248), *(id *)(a1 + 32));
    id v3 = *(void **)(a1 + 40);
    return [v3 _refreshPasses];
  }
  return result;
}

uint64_t __55__PKPassbookSettingsController__processAccountChanged___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 accountIdentifier];
  id v4 = [*(id *)(a1 + 32) accountIdentifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

uint64_t __55__PKPassbookSettingsController__processAccountChanged___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 accountIdentifier];
  id v4 = [*(id *)(a1 + 32) accountIdentifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (void)accountRemoved:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__PKPassbookSettingsController_accountRemoved___block_invoke;
  v6[3] = &unk_1E59CA870;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __47__PKPassbookSettingsController_accountRemoved___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) feature];
  if (v2 == 5)
  {
    id v7 = *(void **)(*(void *)(a1 + 40) + 584);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __47__PKPassbookSettingsController_accountRemoved___block_invoke_2;
    v16[3] = &unk_1E59D1DD8;
    id v17 = *(id *)(a1 + 32);
    objc_msgSend(v7, "pk_removeObjectsPassingTest:", v16);
    uint64_t v8 = *(void **)(*(void *)(a1 + 40) + 592);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __47__PKPassbookSettingsController_accountRemoved___block_invoke_3;
    v14[3] = &unk_1E59D1DD8;
    id v15 = *(id *)(a1 + 32);
    objc_msgSend(v8, "pk_removeObjectsPassingTest:", v14);

    [*(id *)(a1 + 40) _refreshAccountSpecifiers];
    return;
  }
  if (v2 != 3) {
    return;
  }
  id v3 = [*(id *)(*(void *)(a1 + 40) + 248) accountIdentifier];
  id v4 = [*(id *)(a1 + 32) accountIdentifier];
  id v13 = v3;
  id v5 = v4;
  if (v13 == v5)
  {

LABEL_16:
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = *(void **)(v10 + 248);
    *(void *)(v10 + 248) = 0;

    id v12 = *(void **)(a1 + 40);
    [v12 _refreshPasses];
    return;
  }
  if (v13) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    char v9 = [v13 isEqualToString:v5];

    if ((v9 & 1) == 0) {
      return;
    }
    goto LABEL_16;
  }
}

uint64_t __47__PKPassbookSettingsController_accountRemoved___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 accountIdentifier];
  id v4 = [*(id *)(a1 + 32) accountIdentifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

uint64_t __47__PKPassbookSettingsController_accountRemoved___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 accountIdentifier];
  id v4 = [*(id *)(a1 + 32) accountIdentifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (void)_checkPairedDeviceSupportOfHiddenPassesAndRefreshUIIfNecessary
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (self->_context == 1)
  {
    uint64_t v2 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      hiddenCompanionPasses = self->_hiddenCompanionPasses;
      *(_DWORD *)buf = 138412290;
      id v44 = hiddenCompanionPasses;
      _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "(account-pass-feature-check) (Bridge) checking companion passes hidden from add %@", buf, 0xCu);
    }

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v4 = self->_hiddenCompanionPasses;
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v39 objects:v48 count:16];
    if (v5)
    {
      char v6 = 0;
      id v7 = 0;
      uint64_t v8 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v40 != v8) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          if ([v10 passType] == 1)
          {
            id v11 = v10;
            id v12 = v11;
            if (!v7)
            {
              id v7 = [v11 associatedAccountServiceAccountIdentifier];
              if (v7)
              {
                if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  id v44 = v7;
                  _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "(account-pass-feature-check) (Bridge) found hidden account pass for account %@", buf, 0xCu);
                }
              }
            }
            char v13 = [v12 isIdentityPass];

            v6 |= v13;
          }
        }
        uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v39 objects:v48 count:16];
      }
      while (v5);

      if ((v6 & 1) != 0 && !self->_coreIDVUIProofingFlowManager)
      {
        uint64_t v14 = (CIDVUIProofingFlowManager *)[objc_alloc(MEMORY[0x1E4F5C258]) initWithDelegate:self];
        coreIDVUIProofingFlowManager = self->_coreIDVUIProofingFlowManager;
        self->_coreIDVUIProofingFlowManager = v14;

        self->_requiresCIDVUIConfigurations = 1;
      }
    }
    else
    {

      id v7 = 0;
    }
    if (self->_requiresCIDVUIConfigurations)
    {
      self->_requiresCIDVUIConfigurations = 0;
      objc_initWeak((id *)buf, self);
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v38 = 0;
        _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Requesting proofingFlowAvailability", v38, 2u);
      }

      uint64_t v16 = self->_coreIDVUIProofingFlowManager;
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __94__PKPassbookSettingsController__checkPairedDeviceSupportOfHiddenPassesAndRefreshUIIfNecessary__block_invoke;
      v36[3] = &unk_1E59D1E28;
      objc_copyWeak(&v37, (id *)buf);
      [(CIDVUIProofingFlowManager *)v16 proofingFlowAvailability:v36];
      objc_destroyWeak(&v37);
      objc_destroyWeak((id *)buf);
    }
    if (v7)
    {
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        paymentPasses = self->_paymentPasses;
        *(_DWORD *)buf = 138412290;
        id v44 = paymentPasses;
        _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "(account-pass-feature-check) (Bridge) checking payment passes %@", buf, 0xCu);
      }

      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v18 = self->_paymentPasses;
      uint64_t v19 = [(NSArray *)v18 countByEnumeratingWithState:&v32 objects:v47 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v33;
        while (2)
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v33 != v20) {
              objc_enumerationMutation(v18);
            }
            uint64_t v22 = *(void **)(*((void *)&v32 + 1) + 8 * j);
            if ([v22 passType] == 1)
            {
              id v23 = v22;
              uint64_t v24 = [v23 associatedAccountServiceAccountIdentifier];
              int v25 = [v24 isEqualToString:v7];

              if (v25)
              {
                if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  id v44 = v7;
                  _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "(account-pass-feature-check) (Bridge) found account pass with same account ID %@, no need to show the hidden one", buf, 0xCu);
                }

                id v26 = 0;
                id v7 = 0;
                goto LABEL_44;
              }
            }
          }
          uint64_t v19 = [(NSArray *)v18 countByEnumeratingWithState:&v32 objects:v47 count:16];
          if (v19) {
            continue;
          }
          break;
        }
      }

      id v26 = [(NSMutableDictionary *)self->_pairedDeviceSupportsFeatureByAccountID objectForKeyedSubscript:v7];
    }
    else
    {
      id v26 = 0;
    }
LABEL_44:
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v44 = v7;
      __int16 v45 = 2112;
      long long v46 = v26;
      _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "(account-pass-feature-check) accountIdentifier %@ supports feature %@", buf, 0x16u);
    }

    if ([(NSArray *)v7 length] && !v26)
    {
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v44 = v7;
        _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "(account-pass-feature-check) checking paired device feature support for account %@", buf, 0xCu);
      }

      char v27 = [MEMORY[0x1E4F84270] sharedInstance];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      void v29[2] = __94__PKPassbookSettingsController__checkPairedDeviceSupportOfHiddenPassesAndRefreshUIIfNecessary__block_invoke_730;
      v29[3] = &unk_1E59D1E50;
      v29[4] = self;
      id v30 = v7;
      id v31 = 0;
      [v27 accountWithIdentifier:v30 completion:v29];
    }
  }
}

void __94__PKPassbookSettingsController__checkPairedDeviceSupportOfHiddenPassesAndRefreshUIIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __94__PKPassbookSettingsController__checkPairedDeviceSupportOfHiddenPassesAndRefreshUIIfNecessary__block_invoke_2;
  void v11[3] = &unk_1E59D1E00;
  v14[1] = a2;
  id v12 = v7;
  id v9 = v7;
  objc_copyWeak(v14, (id *)(a1 + 32));
  id v13 = v8;
  id v10 = v8;
  dispatch_async(MEMORY[0x1E4F14428], v11);

  objc_destroyWeak(v14);
}

void __94__PKPassbookSettingsController__checkPairedDeviceSupportOfHiddenPassesAndRefreshUIIfNecessary__block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 56);
    uint64_t v4 = [*(id *)(a1 + 32) count];
    int v8 = 134218240;
    uint64_t v9 = v3;
    __int16 v10 = 2048;
    uint64_t v11 = v4;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Proofing availability %lu - %lu configurations,", (uint8_t *)&v8, 0x16u);
  }

  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6)
    {
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 138412290;
        uint64_t v9 = v6;
        _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Could not get proofing availability: %@", (uint8_t *)&v8, 0xCu);
      }
    }
    if (*(void *)(a1 + 32)) {
      id v7 = *(void **)(a1 + 32);
    }
    else {
      id v7 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong(WeakRetained + 40, v7);
    [WeakRetained _refreshPasses];
  }
}

void __94__PKPassbookSettingsController__checkPairedDeviceSupportOfHiddenPassesAndRefreshUIIfNecessary__block_invoke_730(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    int v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v24 = v13;
      __int16 v25 = 2112;
      id v26 = v7;
      _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "(account-pass-feature-check) failed to get account %@ to check feature support %@", buf, 0x16u);
    }
  }
  else
  {
    int v8 = [*(id *)(*(void *)(a1 + 32) + 80) targetDevice];
    [v5 feature];
    char v9 = objc_opt_respondsToSelector();
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 80);
    if (v9)
    {
      uint64_t v11 = [v8 supportedFeatureIdentifiersForAccountProvisioningWithPaymentWebService:v10];
      uint64_t v12 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v24 = v11;
        _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "(account-pass-feature-check) supportedFeatureIdentifiersForAccountProvisioning %@", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v11 = [v8 supportedFeatureIdentifiersWithPaymentWebService:v10];
    }
    uint64_t v14 = PKFeatureIdentifierToString();
    int v15 = [v11 containsObject:v14];

    uint64_t v16 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = @"NO";
      if (v15) {
        id v17 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v24 = v11;
      __int16 v25 = 2112;
      id v26 = v17;
      _os_log_impl(&dword_19F450000, v16, OS_LOG_TYPE_DEFAULT, "(account-pass-feature-check) target device featureIdentifiers %@ contains feature: %@", buf, 0x16u);
    }

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __94__PKPassbookSettingsController__checkPairedDeviceSupportOfHiddenPassesAndRefreshUIIfNecessary__block_invoke_739;
    v19[3] = &unk_1E59CDC58;
    id v18 = *(void **)(a1 + 40);
    v19[4] = *(void *)(a1 + 32);
    id v20 = v18;
    char v22 = v15;
    id v21 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E4F14428], v19);
  }
}

uint64_t __94__PKPassbookSettingsController__checkPairedDeviceSupportOfHiddenPassesAndRefreshUIIfNecessary__block_invoke_739(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
  [*(id *)(*(void *)(a1 + 32) + 480) setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];

  uint64_t result = [*(id *)(a1 + 48) BOOLValue];
  int v4 = *(unsigned __int8 *)(a1 + 56);
  if (((result ^ (*(unsigned char *)(a1 + 56) == 0)) & 1) == 0)
  {
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = @"YES";
      uint64_t v7 = *(void *)(a1 + 40);
      if (!v4) {
        uint64_t v6 = @"NO";
      }
      int v8 = 138412546;
      uint64_t v9 = v7;
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "(account-pass-feature-check) feature support for account %@ changed to %@. Refreshing passes", (uint8_t *)&v8, 0x16u);
    }

    return [*(id *)(a1 + 32) _refreshPasses];
  }
  return result;
}

- (id)_peerPaymentSwitchSpecifier
{
  peerPaymentSwitchSpecifier = self->_peerPaymentSwitchSpecifier;
  if (!peerPaymentSwitchSpecifier)
  {
    int v4 = (void *)MEMORY[0x1E4F92E70];
    id v5 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentSet_13.isa);
    uint64_t v6 = [v4 preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v6 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x1E4F930A8]];
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[PKPassbookSettingsController _isPeerPaymentRegistered](self, "_isPeerPaymentRegistered"));
    [v6 setObject:v7 forKeyedSubscript:@"PKSwitchSpinnerTableCellSwitchIsOn"];

    [v6 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"PKSwitchSpinnerTableCellShowSpinner"];
    int v8 = NSNumber;
    if (PKUseMockSURFServer()) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = PKStoreDemoModeEnabled();
    }
    __int16 v10 = [v8 numberWithInt:v9];
    [v6 setObject:v10 forKeyedSubscript:@"PKSwitchSpinnerTableCellSwitchIsDisabled"];

    uint64_t v11 = self->_peerPaymentSwitchSpecifier;
    self->_peerPaymentSwitchSpecifier = (PSSpecifier *)v6;

    peerPaymentSwitchSpecifier = self->_peerPaymentSwitchSpecifier;
  }

  return peerPaymentSwitchSpecifier;
}

- (void)switchSpinnerCell:(id)a3 hasToggledSwitch:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = [a3 specifier];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__PKPassbookSettingsController_switchSpinnerCell_hasToggledSwitch___block_invoke;
  aBlock[3] = &unk_1E59CAEA8;
  void aBlock[4] = self;
  id v7 = v6;
  id v18 = v7;
  int v8 = _Block_copy(aBlock);
  if (v4)
  {
    uint64_t v9 = [(PKPeerPaymentWebService *)self->_peerPaymentWebService _appleAccountInformation];
    uint64_t v10 = [v9 appleID];
    if (v10
      && (uint64_t v11 = (void *)v10,
          id v12 = objc_loadWeakRetained((id *)&self->_delegate),
          char v13 = objc_opt_respondsToSelector(),
          v12,
          v11,
          (v13 & 1) != 0)
      && (PKIsAltAccountPairedOrPairing() & 1) == 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __67__PKPassbookSettingsController_switchSpinnerCell_hasToggledSwitch___block_invoke_3;
      void v15[3] = &unk_1E59CA9F8;
      id v16 = v8;
      [WeakRetained settingsController:self requestsAuthenticationChallengeForAppleAccountInformation:v9 completion:v15];
    }
    else
    {
      [(PKPassbookSettingsController *)self _registerForPeerPaymentWithSpecifier:v7];
    }
  }
  else
  {
    [(PKPassbookSettingsController *)self _unregisterForPeerPaymentWithSpecifier:v7];
  }
}

void __67__PKPassbookSettingsController_switchSpinnerCell_hasToggledSwitch___block_invoke(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__PKPassbookSettingsController_switchSpinnerCell_hasToggledSwitch___block_invoke_2;
  block[3] = &unk_1E59CD7B0;
  char v5 = a2;
  uint64_t v2 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v4 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __67__PKPassbookSettingsController_switchSpinnerCell_hasToggledSwitch___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    [v2 _registerForPeerPaymentWithSpecifier:v3];
  }
  else
  {
    [*(id *)(a1 + 40) setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"PKSwitchSpinnerTableCellShowSpinner"];
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "_isPeerPaymentRegistered"));
    [*(id *)(a1 + 40) setObject:v4 forKeyedSubscript:@"PKSwitchSpinnerTableCellSwitchIsOn"];

    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 648));
    [WeakRetained settingsControllerRequestsReloadSpecifiers:*(void *)(a1 + 32)];
  }
}

uint64_t __67__PKPassbookSettingsController_switchSpinnerCell_hasToggledSwitch___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_transitDefaultsGroupSpecifiers
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = (void *)MEMORY[0x1E4F92E70];
  char v5 = PKLocalizedPaymentString(&cfstr_SettingsTransi_0.isa);
  uint64_t v6 = [(PKPassbookSettingsController *)self _uppercaseGroupSpecifierTitleIfNecessary:v5];
  id v7 = [v4 groupSpecifierWithName:v6];

  [v7 setObject:self->_expressTransitSectionFooterText forKeyedSubscript:*MEMORY[0x1E4F93170]];
  [v3 addObject:v7];
  int v8 = [(PKPassbookSettingsController *)self _defaultExpressTransitSpecifier];
  [v3 addObject:v8];

  return v3;
}

- (id)_defaultExpressTransitSpecifier
{
  if (!self->_defaultExpressTransitSpecifier)
  {
    int v3 = [(PKExpressPassController *)self->_expressPassController deviceUsesAutomaticAuthorization];
    id v4 = (char *)objc_alloc_init(MEMORY[0x1E4F92E70]);
    *(void *)&v4[*MEMORY[0x1E4F92F28]] = 2;
    [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F93068]];
    [v4 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x1E4F930A8]];
    char v5 = [NSNumber numberWithInteger:self->_context];
    [v4 setObject:v5 forKeyedSubscript:@"pkSettingsContext"];

    [v4 setTarget:self];
    *(void *)&v4[*MEMORY[0x1E4F92F38]] = sel__defaultExpressTransitPassDescription;
    [v4 setControllerLoadAction:sel__openExpressTransitSettings_];
    if (v3) {
      uint64_t v6 = @"SETTINGS_DEFAULT_AUTOMATIC_TRANSIT_CELL_TITLE";
    }
    else {
      uint64_t v6 = @"SETTINGS_DEFAULT_EXPRESS_TRANSIT_CELL_TITLE";
    }
    id v7 = PKLocalizedPaymentString(&v6->isa);
    [v4 setName:v7];

    [v4 setProperty:v6 forKey:*MEMORY[0x1E4F93188]];
    defaultExpressTransitSpecifier = self->_defaultExpressTransitSpecifier;
    self->_defaultExpressTransitSpecifier = (PSSpecifier *)v4;
  }
  if (PKStoreDemoModeEnabled()) {
    uint64_t v9 = MEMORY[0x1E4F1CC28];
  }
  else {
    uint64_t v9 = MEMORY[0x1E4F1CC38];
  }
  [(PSSpecifier *)self->_defaultExpressTransitSpecifier setProperty:v9 forKey:*MEMORY[0x1E4F93130]];
  uint64_t v10 = self->_defaultExpressTransitSpecifier;

  return v10;
}

- (id)_defaultExpressTransitPassDescription
{
  return self->_expressTransitSubtitleText;
}

- (void)_openExpressTransitSettings:(id)a3
{
}

- (void)openExpressTransitSettings:(id)a3 withPassUniqueIdentifier:(id)a4
{
  BOOL v6 = self->_context != 0;
  id v7 = [PKExpressPassesViewController alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_paymentDataProvider);
  obuint64_t j = [(PKExpressPassesViewController *)v7 initWithPaymentDataProvider:WeakRetained controller:self->_expressPassController style:v6];

  [(PKExpressPassesViewController *)obj setPasses:self->_paymentPasses];
  id v9 = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [v9 settingsController:self requestsPushViewController:obj animated:a3 != 0];
  }
  objc_storeWeak((id *)&self->_expressPassesViewController, obj);
}

- (void)openTransactionDefaultsEmailSettings
{
  if ([(NSArray *)self->_paymentPasses count]
    && [(PKPassbookSettingsDataSource *)self->_dataSource deviceSupportsInAppPayments])
  {
    [(PKPassbookSettingsController *)self _showDefaultContactEmailOptions:self];
  }
  else
  {
    int v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Attempted to open email settings for a device that has no passes or doesn't support payments", v4, 2u);
    }
  }
}

- (void)addButtonPressedForPaymentPass:(id)a3
{
}

- (BOOL)canPresentLaunchPrompts
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    id v4 = objc_loadWeakRetained((id *)p_delegate);
    int v5 = [v4 isPresentingViewController] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 1;
  }

  return v5;
}

- (void)_regionConfigurationDidChangeNotification
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__PKPassbookSettingsController__regionConfigurationDidChangeNotification__block_invoke;
  block[3] = &unk_1E59CA7D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __73__PKPassbookSettingsController__regionConfigurationDidChangeNotification__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateCardsGroupSpecifier];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _updateAddButtonSpecifier];
}

- (void)_presentPaymentSetupViewController:(id)a3 paymentPass:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 setCustomFormSheetPresentationStyleForiPad];
  int v8 = [(PKPassbookSettingsDataSource *)self->_dataSource setupDelegate];

  if (v8)
  {
    id v9 = [(PKPassbookSettingsDataSource *)self->_dataSource setupDelegate];
    [v6 setSetupDelegate:v9];
  }
  [v6 setShowsWelcomeViewController:0];
  [v6 setAllowsManualEntry:0];
  [v6 setPaymentSetupMode:1];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__PKPassbookSettingsController__presentPaymentSetupViewController_paymentPass___block_invoke;
  aBlock[3] = &unk_1E59D1E78;
  id v10 = v6;
  id v19 = v10;
  id v20 = self;
  objc_copyWeak(&v21, &location);
  uint64_t v11 = _Block_copy(aBlock);
  id v12 = [v7 associatedAccountServiceAccountIdentifier];
  if ([v12 length])
  {
    accountService = self->_accountService;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __79__PKPassbookSettingsController__presentPaymentSetupViewController_paymentPass___block_invoke_4;
    void v15[3] = &unk_1E59D1EA0;
    id v16 = v7;
    id v17 = v11;
    [(PKAccountService *)accountService accountWithIdentifier:v12 completion:v15];

    uint64_t v14 = v16;
  }
  else
  {
    if ([v7 isHomeKeyPass]) {
      uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F84758]) initWithPaymentPass:v7];
    }
    else {
      uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F84AF0]) initWithPaymentPass:v7];
    }
    (*((void (**)(void *, void *))v11 + 2))(v11, v14);
  }

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __79__PKPassbookSettingsController__presentPaymentSetupViewController_paymentPass___block_invoke(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) provisioningController];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 24));
  [v4 setPaymentDataProvider:WeakRetained];

  if (PKIsAltAccountPairedOrPairing() && *(void *)(*(void *)(a1 + 40) + 40) == 1) {
    [v4 setIsProvisioningForAltAccount:1];
  }
  v10[0] = v3;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__PKPassbookSettingsController__presentPaymentSetupViewController_paymentPass___block_invoke_2;
  v7[3] = &unk_1E59CBA18;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  id v8 = *(id *)(a1 + 32);
  [v4 associateCredentials:v6 withCompletionHandler:v7];

  objc_destroyWeak(&v9);
}

void __79__PKPassbookSettingsController__presentPaymentSetupViewController_paymentPass___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    if (v5 || !a2)
    {
      [WeakRetained _handleProvisioningError:v5 viewController:0];
      [v7 _setCardAddProvisioningButtonEnabled:1 forPaymentPass:0];
    }
    else
    {
      id v8 = *(void **)(a1 + 32);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __79__PKPassbookSettingsController__presentPaymentSetupViewController_paymentPass___block_invoke_3;
      v9[3] = &unk_1E59CB268;
      objc_copyWeak(&v11, (id *)(a1 + 40));
      id v10 = *(id *)(a1 + 32);
      [v8 preflightWithCompletion:v9];

      objc_destroyWeak(&v11);
    }
  }
}

void __79__PKPassbookSettingsController__presentPaymentSetupViewController_paymentPass___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _requestDelegatePresentViewController:*(void *)(a1 + 32)];
    [v3 _setCardAddProvisioningButtonEnabled:1 forPaymentPass:0];
    id WeakRetained = v3;
  }
}

void __79__PKPassbookSettingsController__presentPaymentSetupViewController_paymentPass___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__PKPassbookSettingsController__presentPaymentSetupViewController_paymentPass___block_invoke_5;
  block[3] = &unk_1E59CE110;
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __79__PKPassbookSettingsController__presentPaymentSetupViewController_paymentPass___block_invoke_5(uint64_t a1)
{
  if ([*(id *)(a1 + 32) feature] == 4) {
    uint64_t v2 = [objc_alloc(MEMORY[0x1E4F84AF0]) initWithPaymentPass:*(void *)(a1 + 40)];
  }
  else {
    uint64_t v2 = [objc_alloc(MEMORY[0x1E4F841C8]) initWithAccount:*(void *)(a1 + 32)];
  }
  id v3 = (id)v2;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)_invitationFromCredential:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F84428];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = [v5 partnerIdentifier];
  id v8 = [v5 brandIdentifier];
  id v9 = [v5 pairedReaderIdentifier];
  id v10 = [(PKPaymentWebService *)self->_webService targetDevice];
  id v11 = [v10 deviceName];
  id v12 = [v5 entitlement];
  char v13 = [v12 value];
  uint64_t v14 = objc_msgSend(v6, "initWithPartnerIdentifier:brandIdentifier:pairedReaderIdentifier:recipientName:entitlement:supportedRadioTechnologies:", v7, v8, v9, v11, objc_msgSend(v13, "unsignedIntegerValue"), objc_msgSend(v5, "supportedRadioTechnologies"));

  int v15 = [v5 sharingSessionIdentifier];
  [v14 setSharingSessionIdentifier:v15];

  id v16 = [v5 originatorIDSHandle];

  [v14 setOriginatorIDSHandle:v16];

  return v14;
}

- (id)_matchingInvitationForPass:(id)a3 withInvitations:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v32 = a4;
  id v6 = [a3 devicePrimaryPaymentApplication];
  id v7 = [v6 subcredentials];
  id v8 = [v7 anyObject];

  id v9 = objc_alloc(MEMORY[0x1E4F84428]);
  id v10 = [v8 partnerIdentifier];
  id v11 = [v8 brandIdentifier];
  id v12 = [v8 pairedReaderIdentifier];
  char v13 = [(PKPaymentWebService *)self->_webService targetDevice];
  uint64_t v14 = [v13 deviceName];
  int v15 = [v8 entitlement];
  id v16 = [v15 value];
  id v17 = objc_msgSend(v9, "initWithPartnerIdentifier:brandIdentifier:pairedReaderIdentifier:recipientName:entitlement:supportedRadioTechnologies:", v10, v11, v12, v14, objc_msgSend(v16, "unsignedIntegerValue"), objc_msgSend(v8, "supportedRadioTechnologies"));

  id v18 = [v8 sharingSessionIdentifier];
  [v17 setSharingSessionIdentifier:v18];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v19 = v32;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v38;
LABEL_3:
    uint64_t v23 = 0;
    while (1)
    {
      if (*(void *)v38 != v22) {
        objc_enumerationMutation(v19);
      }
      uint64_t v24 = *(void **)(*((void *)&v37 + 1) + 8 * v23);
      if ([v17 isSameInvitationAsInvitation:v24]) {
        goto LABEL_18;
      }
      if (v21 == ++v23)
      {
        uint64_t v21 = [v19 countByEnumeratingWithState:&v37 objects:v42 count:16];
        if (v21) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  [v17 setSharingSessionIdentifier:0];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v25 = v19;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v34;
LABEL_11:
    uint64_t v29 = 0;
    while (1)
    {
      if (*(void *)v34 != v28) {
        objc_enumerationMutation(v25);
      }
      uint64_t v24 = *(void **)(*((void *)&v33 + 1) + 8 * v29);
      if ([v17 isSameInvitationAsInvitation:v24]) {
        break;
      }
      if (v27 == ++v29)
      {
        uint64_t v27 = [v25 countByEnumeratingWithState:&v33 objects:v41 count:16];
        id v30 = 0;
        if (v27) {
          goto LABEL_11;
        }
        goto LABEL_19;
      }
    }
LABEL_18:
    id v30 = v24;
    goto LABEL_19;
  }
  id v30 = 0;
LABEL_19:

  return v30;
}

- (void)_credentialPairingContextForPass:(id)a3 withCompletion:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (self->_context == 1)
    {
      id v8 = [v6 devicePrimaryPaymentApplication];
      id v9 = [v8 subcredentials];
      id v10 = [v9 anyObject];

      id v11 = [[PKSubcredentialPairingFlowControllerContext alloc] initWithFlowType:3 referralSource:7];
      id v12 = [(PKPaymentDataProvider *)self->_companionPaymentDataProvider paymentWebService];
      [(PKSubcredentialProvisioningFlowControllerContext *)v11 setLocalDeviceWebService:v12];

      [(PKSubcredentialProvisioningFlowControllerContext *)v11 setRemoteDeviceWebService:self->_webService];
      [(PKSubcredentialProvisioningFlowControllerContext *)v11 setProvisionedPass:v6];
      id v13 = objc_alloc_init(MEMORY[0x1E4F84390]);
      objc_msgSend(v13, "setSupportedRadioTechnologies:", objc_msgSend(v10, "supportedRadioTechnologies"));
      uint64_t v14 = [v10 manufacturerIdentifier];
      uint64_t v15 = [v10 brandIdentifier];
      id v16 = (void *)v15;
      if (v15) {
        id v17 = (void *)v15;
      }
      else {
        id v17 = v14;
      }
      [v13 setIssuerIdentifier:v17];

      [v13 setManufacturerIdentifier:v14];
      [(PKSubcredentialPairingFlowControllerContext *)v11 setConfiguration:v13];
      if ([v10 isSharedCredential])
      {
        objc_initWeak(&location, self);
        id v18 = [(PKPaymentWebService *)self->_webService targetDevice];
        if (objc_opt_respondsToSelector())
        {
          char v19 = objc_opt_respondsToSelector();
          uint64_t v20 = PKLogFacilityTypeGetObject();
          BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
          if (v19)
          {
            if (v21)
            {
              *(_DWORD *)buf = 138412290;
              id v38 = v13;
              _os_log_impl(&dword_19F450000, v20, OS_LOG_TYPE_DEFAULT, "Checking if device can add SE pass with configuration: %@", buf, 0xCu);
            }

            webService = self->_webService;
            v28[0] = MEMORY[0x1E4F143A8];
            v28[1] = 3221225472;
            v28[2] = __80__PKPassbookSettingsController__credentialPairingContextForPass_withCompletion___block_invoke;
            v28[3] = &unk_1E59D1F18;
            objc_copyWeak(&v35, &location);
            id v34 = v7;
            void v28[4] = self;
            id v29 = v10;
            id v30 = v18;
            id v31 = v6;
            id v32 = v11;
            id v33 = v13;
            [v30 paymentWebService:webService canAddSecureElementPassWithConfiguration:v33 completion:v28];

            objc_destroyWeak(&v35);
          }
          else
          {
            if (v21)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19F450000, v20, OS_LOG_TYPE_DEFAULT, "Unable to load invitations", buf, 2u);
            }

            uint64_t v27 = PKDisplayableErrorForCommonType();
            (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v27);
          }
        }
        else
        {
          id v25 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19F450000, v25, OS_LOG_TYPE_DEFAULT, "Unable to determine whether we can add secure element passes with configuration", buf, 2u);
          }

          uint64_t v26 = PKDisplayableErrorForCommonType();
          (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v26);
        }
        objc_destroyWeak(&location);
      }
      else
      {
        [(PKSubcredentialPairingFlowControllerContext *)v11 setCredentialToShare:v10];
        uint64_t v24 = +[PKSubcredentialPairingFlowController sharingRequestForContext:v11 withCredential:v10];
        [(PKSubcredentialPairingFlowControllerContext *)v11 setRemoteDeviceSharingRequest:v24];
        (*((void (**)(id, PKSubcredentialPairingFlowControllerContext *, void))v7 + 2))(v7, v11, 0);
      }
    }
    else
    {
      uint64_t v23 = PKDisplayableErrorForCommonType();
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v23);
    }
  }
}

void __80__PKPassbookSettingsController__credentialPairingContextForPass_withCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (WeakRetained)
  {
    if (a2)
    {
      id v7 = [*(id *)(a1 + 32) _invitationFromCredential:*(void *)(a1 + 40)];
      id v8 = *(void **)(a1 + 48);
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 80);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __80__PKPassbookSettingsController__credentialPairingContextForPass_withCompletion___block_invoke_2;
      v16[3] = &unk_1E59D1EF0;
      id v10 = v7;
      id v17 = v10;
      id v23 = *(id *)(a1 + 80);
      id v11 = *(id *)(a1 + 48);
      uint64_t v12 = *(void *)(a1 + 32);
      id v18 = v11;
      uint64_t v19 = v12;
      objc_copyWeak(&v24, (id *)(a1 + 88));
      id v20 = *(id *)(a1 + 56);
      id v21 = *(id *)(a1 + 40);
      id v22 = *(id *)(a1 + 64);
      [v8 paymentWebService:v9 canAcceptInvitation:v10 withCompletionV2:v16];

      objc_destroyWeak(&v24);
    }
    else
    {
      uint64_t v14 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = *(void *)(a1 + 72);
        *(_DWORD *)buf = 138412546;
        uint64_t v26 = v15;
        __int16 v27 = 2112;
        id v28 = v5;
        _os_log_impl(&dword_19F450000, v14, OS_LOG_TYPE_DEFAULT, "Device cannot add secure element pass with configuration %@. Error: %@", buf, 0x16u);
      }

      (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
    }
  }
  else
  {
    id v13 = PKDisplayableErrorForCommonType();
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
}

void __80__PKPassbookSettingsController__credentialPairingContextForPass_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v16 = v5;
      __int16 v17 = 2112;
      id v18 = v3;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Device cannot accept invitations similar to %@. Error: %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
  else
  {
    id v6 = *(void **)(a1 + 40);
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 80);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __80__PKPassbookSettingsController__credentialPairingContextForPass_withCompletion___block_invoke_774;
    v8[3] = &unk_1E59D1EC8;
    objc_copyWeak(&v14, (id *)(a1 + 88));
    id v13 = *(id *)(a1 + 80);
    id v9 = *(id *)(a1 + 56);
    id v10 = *(id *)(a1 + 64);
    id v11 = *(id *)(a1 + 72);
    id v12 = *(id *)(a1 + 32);
    [v6 paymentWebService:v7 subcredentialInvitationsWithCompletion:v8];

    objc_destroyWeak(&v14);
  }
}

void __80__PKPassbookSettingsController__credentialPairingContextForPass_withCompletion___block_invoke_774(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    uint64_t v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v3;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Invitations on watch: %@", (uint8_t *)&v12, 0xCu);
    }

    id v6 = [WeakRetained _matchingInvitationForPass:*(void *)(a1 + 32) withInvitations:v3];
    BOOL v7 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v7)
      {
        id v8 = [*(id *)(a1 + 32) uniqueID];
        uint64_t v9 = *(void *)(a1 + 40);
        int v12 = 138412802;
        id v13 = v6;
        __int16 v14 = 2112;
        uint64_t v15 = v8;
        __int16 v16 = 2112;
        uint64_t v17 = v9;
        _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Found matching invite (%@) for pass (%@) with credential: %@", (uint8_t *)&v12, 0x20u);
      }
      [*(id *)(a1 + 48) setRemoteDeviceInvitation:v6];
    }
    else
    {
      if (v7)
      {
        id v11 = [*(id *)(a1 + 32) uniqueID];
        int v12 = 138412290;
        id v13 = v11;
        _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "No matching invite for pass (%@) found", (uint8_t *)&v12, 0xCu);
      }
      [*(id *)(a1 + 48) setRemoteDeviceInvitation:*(void *)(a1 + 56)];
      [*(id *)(a1 + 48) setShouldRequestInvitation:1];
    }
    [*(id *)(a1 + 48) setDeclineRelatedInvitations:1];
    id v10 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
  }
  else
  {
    id v6 = PKDisplayableErrorForCommonType();
    id v10 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
  }
  v10();
}

- (void)_presentCredentialSetupViewControllerForPaymentPass:(id)a3 withCompletion:(id)a4
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (PKV2SharingFlowEnabled())
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Using v2 share flow", buf, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v10 = objc_opt_respondsToSelector();

    id v11 = objc_loadWeakRetained((id *)&self->_delegate);
    id v12 = v11;
    if (v10)
    {
      uint64_t v13 = [v11 requestParentNavigationControllerWithSettingsController:self];
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        goto LABEL_11;
      }
      id v12 = objc_loadWeakRetained((id *)&self->_delegate);
      uint64_t v13 = [v12 navigationController];
    }
    uint64_t v15 = (void *)v13;

    if (v15)
    {
      __int16 v16 = [v6 devicePrimaryPaymentApplication];
      uint64_t v17 = [v16 subcredentials];
      id v25 = [v17 anyObject];

      id v23 = (void *)[objc_alloc(MEMORY[0x1E4F84AE8]) initWithPaymentPass:v6 credentialToShare:v25];
      id v24 = (void *)[objc_alloc(MEMORY[0x1E4F84BB8]) initWithWebService:self->_webService];
      id v22 = (void *)[objc_alloc(MEMORY[0x1E4F84ED0]) initWithEnvironment:4 provisioningController:v24 groupsController:0];
      uint64_t v18 = [[PKPaymentSetupDismissibleNavigationController alloc] initWithContext:4];
      objc_initWeak(&location, self);
      *(void *)buf = 0;
      long long v36 = buf;
      uint64_t v37 = 0x2020000000;
      char v38 = 0;
      v40[0] = v23;
      uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      void v30[2] = __99__PKPassbookSettingsController__presentCredentialSetupViewControllerForPaymentPass_withCompletion___block_invoke;
      v30[3] = &unk_1E59D1F40;
      objc_copyWeak(&v34, &location);
      id v33 = buf;
      id v20 = v18;
      id v31 = v20;
      id v21 = v7;
      id v32 = v21;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __99__PKPassbookSettingsController__presentCredentialSetupViewControllerForPaymentPass_withCompletion___block_invoke_3;
      v26[3] = &unk_1E59D1F68;
      objc_copyWeak(&v29, &location);
      id v28 = buf;
      id v27 = v21;
      +[PKProvisioningFlowBridge startCredentialsProvisioningFlowWithNavController:v20 context:v22 credentials:v19 parentNavController:v15 presentNavController:v30 completion:v26];

      objc_destroyWeak(&v29);
      objc_destroyWeak(&v34);
      _Block_object_dispose(buf, 8);
      objc_destroyWeak(&location);

LABEL_12:
      goto LABEL_13;
    }
LABEL_11:
    uint64_t v15 = PKDisplayableErrorForCommonType();
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v15);
    goto LABEL_12;
  }
  [(PKPassbookSettingsController *)self _presentLegacyCredentialSetupViewControllerForPaymentPass:v6 withCompletion:v7];
LABEL_13:
}

void __99__PKPassbookSettingsController__presentCredentialSetupViewControllerForPaymentPass_withCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    id v4 = objc_loadWeakRetained(WeakRetained + 81);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __99__PKPassbookSettingsController__presentCredentialSetupViewControllerForPaymentPass_withCompletion___block_invoke_2;
    v6[3] = &unk_1E59CAA98;
    uint64_t v5 = *(void *)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    [v4 settingsController:v3 requestsPresentViewController:v5 animated:1 completion:v6];
  }
}

uint64_t __99__PKPassbookSettingsController__presentCredentialSetupViewControllerForPaymentPass_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

void __99__PKPassbookSettingsController__presentCredentialSetupViewControllerForPaymentPass_withCompletion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      id v3 = objc_loadWeakRetained(WeakRetained + 81);
      [v3 requestDismissingPresentedViewControllerWithSettingsController:v5 animated:1 completion:0];
    }
    else
    {
      uint64_t v4 = *(void *)(a1 + 32);
      id v3 = PKDisplayableErrorForCommonType();
      (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v3);
    }

    id WeakRetained = v5;
  }
}

- (void)_presentLegacyCredentialSetupViewControllerForPaymentPass:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __105__PKPassbookSettingsController__presentLegacyCredentialSetupViewControllerForPaymentPass_withCompletion___block_invoke;
  v9[3] = &unk_1E59D1F90;
  objc_copyWeak(&v11, &location);
  id v8 = v7;
  id v10 = v8;
  [(PKPassbookSettingsController *)self _credentialPairingContextForPass:v6 withCompletion:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __105__PKPassbookSettingsController__presentLegacyCredentialSetupViewControllerForPaymentPass_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __105__PKPassbookSettingsController__presentLegacyCredentialSetupViewControllerForPaymentPass_withCompletion___block_invoke_2;
  void v10[3] = &unk_1E59CFAE0;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  id v7 = *(id *)(a1 + 32);
  id v12 = v5;
  id v13 = v7;
  id v11 = v6;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v10);

  objc_destroyWeak(&v14);
}

void __105__PKPassbookSettingsController__presentLegacyCredentialSetupViewControllerForPaymentPass_withCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (*(void *)(a1 + 40))
    {
      id v3 = [[PKSubcredentialPairingFlowController alloc] initWithDelegate:WeakRetained];
      uint64_t v4 = [(PKSubcredentialPairingFlowController *)v3 startingViewControllerForContext:*(void *)(a1 + 40)];
      if (v4)
      {
        id v5 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v4];
        id v6 = objc_loadWeakRetained(WeakRetained + 81);
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        void v10[2] = __105__PKPassbookSettingsController__presentLegacyCredentialSetupViewControllerForPaymentPass_withCompletion___block_invoke_786;
        void v10[3] = &unk_1E59CAA98;
        id v11 = *(id *)(a1 + 48);
        [v6 settingsController:WeakRetained requestsPresentViewController:v5 animated:1 completion:v10];
      }
      else
      {
        id v9 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "Unable to share pass", buf, 2u);
        }

        if (!*(void *)(a1 + 48)) {
          goto LABEL_16;
        }
        id v5 = PKDisplayableErrorForCommonType();
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      }

LABEL_16:
      goto LABEL_17;
    }
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Unable to create provisioning context from pass", buf, 2u);
    }

    if (*(void *)(a1 + 48))
    {
      PKDisplayableErrorForCommonType();
      id v3 = (PKSubcredentialPairingFlowController *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_17:
    }
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7) {
      (*(void (**)(uint64_t, void, void))(v7 + 16))(v7, 0, *(void *)(a1 + 32));
    }
  }
}

uint64_t __105__PKPassbookSettingsController__presentLegacyCredentialSetupViewControllerForPaymentPass_withCompletion___block_invoke_786(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

- (void)_handleProvisioningError:(id)a3 viewController:(id)a4
{
  if (a4)
  {
    [(PKPassbookSettingsController *)self _requestDelegatePresentViewController:a4];
  }
  else
  {
    id v5 = +[PKPaymentSetupNavigationController viewControllerForPresentingPaymentError:a3];
    [(PKPassbookSettingsController *)self _requestDelegatePresentViewController:v5];
  }
}

- (void)_requestDelegatePresentViewController:(id)a3
{
}

- (void)_requestDelegatePresentViewController:(id)a3 completion:(id)a4
{
  if (a3)
  {
    p_delegate = &self->_delegate;
    id v7 = a4;
    id v8 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    [WeakRetained settingsController:self requestsPresentViewController:v8 animated:1 completion:v7];
  }
}

- (void)_setCardAddProvisioningButtonEnabled:(BOOL)a3 forPaymentPass:(id)a4
{
  BOOL v4 = a3;
  id v10 = a4;
  id v6 = [NSNumber numberWithBool:v4];
  [(PSSpecifier *)self->_addCardButtonSpecifier setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F93130]];

  if (v10)
  {
    id v7 = [v10 uniqueID];
    provisioningPassIdentifier = self->_provisioningPassIdentifier;
    self->_provisioningPassIdentifier = v7;
  }
  else
  {
    provisioningPassIdentifier = self->_provisioningPassIdentifier;
    self->_provisioningPassIdentifier = 0;
  }

  [(PKPassbookSettingsController *)self _updateCompanionPassesAddButton];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained settingsController:self requestsReloadSpecifier:self->_addCardButtonSpecifier];
}

- (void)_performPhoneToWatchProvisioningForPaymentPass:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  [(PKPassbookSettingsController *)self _setCardAddProvisioningButtonEnabled:0 forPaymentPass:v6];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke;
  aBlock[3] = &unk_1E59D1FB8;
  objc_copyWeak(&v18, &location);
  id v8 = v7;
  id v17 = v8;
  id v9 = _Block_copy(aBlock);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_2;
  v12[3] = &unk_1E59D2120;
  void v12[4] = self;
  id v10 = v9;
  id v14 = v10;
  id v11 = v6;
  id v13 = v11;
  objc_copyWeak(&v15, &location);
  [(PKPassbookSettingsController *)self _transitPropertiesForPaymentPass:v11 withCompletion:v12];
  objc_destroyWeak(&v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

uint64_t __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _setCardAddProvisioningButtonEnabled:1 forPaymentPass:0];
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    id v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

void __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = v3;
  if (v3)
  {
    if ([v3 isEnRoute])
    {
      id v5 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Unable to perform transfer. Pass is in transit.", buf, 2u);
      }

      id v6 = (void *)MEMORY[0x1E4FB1418];
      id v7 = PKLocalizedPaymentString(&cfstr_CardInTransit.isa);
      id v8 = @"CARD_IN_TRANSIT_MESSAGE_TRANSFER_CARD";
LABEL_10:
      id v10 = PKLocalizedPaymentString(&v8->isa);
      id v11 = [v6 alertControllerWithTitle:v7 message:v10 preferredStyle:1];

      id v12 = (void *)MEMORY[0x1E4FB1410];
      id v13 = PKLocalizedString(&cfstr_OkButtonTitle.isa);
      id v14 = [v12 actionWithTitle:v13 style:1 handler:0];
      [v11 addAction:v14];

      [a1[4] _requestDelegatePresentViewController:v11];
      (*((void (**)(void))a1[6] + 2))();
LABEL_16:

      goto LABEL_17;
    }
    if ([v4 isBlocked])
    {
      id v9 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "Unable to perform transfer. Pass is blacklisted.", buf, 2u);
      }

      id v6 = (void *)MEMORY[0x1E4FB1418];
      id v7 = PKLocalizedPaymentString(&cfstr_CouldNotAddCar.isa);
      id v8 = @"COULD_NOT_ADD_CARD_MESSAGE";
      goto LABEL_10;
    }
  }
  if ([a1[5] isCarKeyPass])
  {
    id v15 = a1[4];
    id v16 = a1[5];
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_801;
    v57[3] = &unk_1E59CD2F8;
    objc_copyWeak(&v59, a1 + 7);
    id v58 = a1[6];
    [v15 _presentCredentialSetupViewControllerForPaymentPass:v16 withCompletion:v57];

    objc_destroyWeak(&v59);
  }
  else
  {
    if (![a1[5] isIdentityPass])
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F84518]);
      *(void *)buf = 0;
      long long v47 = buf;
      uint64_t v48 = 0x3032000000;
      uint64_t v49 = __Block_byref_object_copy__13;
      id v50 = __Block_byref_object_dispose__13;
      id v51 = 0;
      v44[0] = 0;
      v44[1] = v44;
      v44[2] = 0x3032000000;
      v44[3] = __Block_byref_object_copy__13;
      v44[4] = __Block_byref_object_dispose__13;
      id v45 = 0;
      v42[0] = 0;
      v42[1] = v42;
      v42[2] = 0x3032000000;
      v42[3] = __Block_byref_object_copy__13;
      v42[4] = __Block_byref_object_dispose__13;
      id v43 = 0;
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_805;
      v41[3] = &unk_1E59CC878;
      v41[4] = a1[4];
      v41[5] = v42;
      v41[6] = buf;
      v41[7] = v44;
      [v11 addOperation:v41];
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_3_810;
      v37[3] = &unk_1E59D2080;
      id v22 = a1[5];
      v37[4] = a1[4];
      uint64_t v39 = buf;
      long long v40 = v42;
      id v38 = v22;
      [v11 addOperation:v37];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      void v34[2] = __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_5;
      v34[3] = &unk_1E59CC7D8;
      id v23 = a1[5];
      v34[4] = a1[4];
      id v35 = v23;
      long long v36 = v42;
      [v11 addOperation:v34];
      objc_initWeak(&location, a1[4]);
      id v24 = [MEMORY[0x1E4F1CA98] null];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_7;
      v26[3] = &unk_1E59D20F8;
      objc_copyWeak(&v32, &location);
      id v29 = v42;
      id v30 = buf;
      id v31 = v44;
      id v28 = a1[6];
      id v27 = a1[5];
      id v25 = (id)[v11 evaluateWithInput:v24 completion:v26];

      objc_destroyWeak(&v32);
      objc_destroyWeak(&location);

      _Block_object_dispose(v42, 8);
      _Block_object_dispose(v44, 8);

      _Block_object_dispose(buf, 8);
      goto LABEL_16;
    }
    id v17 = (void *)[objc_alloc(MEMORY[0x1E4F84BB8]) initWithWebService:*((void *)a1[4] + 10)];
    [v17 setAllowProductsInUnsupportedRegion:1];
    objc_initWeak((id *)buf, a1[4]);
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_802;
    v52[3] = &unk_1E59D2008;
    objc_copyWeak(&v56, (id *)buf);
    id v18 = a1[6];
    id v19 = a1[4];
    id v20 = a1[5];
    id v55 = v18;
    v52[4] = v19;
    id v53 = v20;
    id v21 = v17;
    id v54 = v21;
    [v21 preflightWithRequirements:13 completionRequirements:13 completion:v52];

    objc_destroyWeak(&v56);
    objc_destroyWeak((id *)buf);
  }
LABEL_17:
}

void __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_801(uint64_t a1, char a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && (a2 & 1) == 0)
  {
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Unable to present credential setup. Error: %@.", (uint8_t *)&v9, 0xCu);
    }

    id v8 = PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);
    [WeakRetained _requestDelegatePresentViewController:v8];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_802(uint64_t a1, char a2, void *a3)
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = objc_loadWeakRetained(WeakRetained + 81);
    if (v5 || (a2 & 1) == 0)
    {
      if (v5)
      {
        id v9 = v5;
      }
      else
      {
        PKDisplayableErrorForCommonType();
        id v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      id v16 = v9;
      id v17 = PKAlertForDisplayableErrorWithHandlers(v9, 0, 0, 0);
      [v8 settingsController:v7 requestsPresentViewController:v17 animated:1 completion:0];
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

      goto LABEL_16;
    }
    if (objc_opt_respondsToSelector())
    {
      id v19 = [v8 requestParentNavigationControllerWithSettingsController:*(void *)(a1 + 32)];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_13;
      }
      id v19 = [v8 navigationController];
    }
    if (v19)
    {
      id v10 = (void *)[objc_alloc(MEMORY[0x1E4F84AF0]) initWithPaymentPass:*(void *)(a1 + 40)];
      id v18 = (void *)[objc_alloc(MEMORY[0x1E4F84ED0]) initWithEnvironment:4 provisioningController:*(void *)(a1 + 48) groupsController:0];
      uint64_t v11 = [[PKPaymentSetupDismissibleNavigationController alloc] initWithContext:4];
      [(PKPaymentSetupDismissibleNavigationController *)v11 useStandardPlatformPresentationStyle];
      v29[0] = 0;
      v29[1] = v29;
      void v29[2] = 0x2020000000;
      char v30 = 0;
      v31[0] = v10;
      id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_2_803;
      v24[3] = &unk_1E59D1F40;
      objc_copyWeak(&v28, (id *)(a1 + 64));
      id v27 = v29;
      id v13 = v11;
      id v25 = v13;
      id v26 = *(id *)(a1 + 56);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      id v20[2] = __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_4;
      void v20[3] = &unk_1E59D1F68;
      objc_copyWeak(&v23, (id *)(a1 + 64));
      id v22 = v29;
      id v21 = *(id *)(a1 + 56);
      +[PKProvisioningFlowBridge startCredentialsProvisioningFlowWithNavController:v13 context:v18 credentials:v12 parentNavController:v19 presentNavController:v24 completion:v20];

      objc_destroyWeak(&v23);
      objc_destroyWeak(&v28);
      _Block_object_dispose(v29, 8);

LABEL_16:
      goto LABEL_17;
    }
LABEL_13:
    id v14 = PKDisplayableErrorForCommonType();
    id v15 = PKAlertForDisplayableErrorWithHandlers(v14, 0, 0, 0);

    [v8 settingsController:v7 requestsPresentViewController:v15 animated:1 completion:0];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

    goto LABEL_16;
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_17:
}

void __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_2_803(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    id v4 = objc_loadWeakRetained(WeakRetained + 81);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_3;
    v8[3] = &unk_1E59D1FE0;
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(id *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    id v9 = v6;
    uint64_t v10 = v7;
    [v4 settingsController:v3 requestsPresentViewController:v5 animated:1 completion:v8];
  }
}

uint64_t __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), 1);
}

void __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_4(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      id v3 = objc_loadWeakRetained(WeakRetained + 81);
      [v3 requestDismissingPresentedViewControllerWithSettingsController:v4 animated:1 completion:0];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    id WeakRetained = v4;
  }
}

void __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_805(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 648));
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 648));
    uint64_t v11 = *(void *)(a1 + 32);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_2_808;
    v12[3] = &unk_1E59D2030;
    long long v15 = *(_OWORD *)(a1 + 40);
    uint64_t v16 = *(void *)(a1 + 56);
    id v14 = v7;
    id v13 = v6;
    [v10 settingsController:v11 requestsAddLocalCardPreflightWithCompletion:v12];
  }
  else
  {
    (*((void (**)(id, id, uint64_t))v7 + 2))(v7, v6, 1);
  }
}

void __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_2_808(void *a1, int a2, void *a3, void *a4)
{
  id v11 = a3;
  id v8 = a4;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a4);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v9 = a1[7];
  }
  else {
    uint64_t v9 = a1[8];
  }
  objc_storeStrong((id *)(*(void *)(v9 + 8) + 40), a3);
  if (a2) {
    BOOL v10 = *(void *)(*(void *)(a1[8] + 8) + 40) != 0;
  }
  else {
    BOOL v10 = 1;
  }
  (*(void (**)(void, void, BOOL))(a1[5] + 16))(a1[5], a1[4], v10);
}

void __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_3_810(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (*(void *)(*(void *)(a1 + 32) + 40) == 1)
  {
    uint64_t v9 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) provisioningController];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_4_811;
    void v10[3] = &unk_1E59D2058;
    uint64_t v14 = *(void *)(a1 + 56);
    id v11 = *(id *)(a1 + 40);
    id v13 = v8;
    id v12 = v6;
    [v9 requestExternalizedAuthForWatchWithVisibleViewController:0 completion:v10];
  }
  else
  {
    (*((void (**)(id, id, void))v7 + 2))(v7, v6, 0);
  }
}

void __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_4_811(uint64_t a1, int a2, void *a3)
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6 && a2)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  }
  else if ((a2 & 1) == 0)
  {
    id v7 = [*(id *)(a1 + 32) devicePrimaryContactlessPaymentApplication];
    uint64_t v8 = [v7 paymentNetworkIdentifier];

    if (v8 == 130)
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = *MEMORY[0x1E4F871A0];
      v17[0] = *MEMORY[0x1E4F28568];
      id v11 = PKLocalizedPaymentString(&cfstr_WatchOnWristRe.isa);
      v18[0] = v11;
      v17[1] = *MEMORY[0x1E4F285A0];
      id v12 = PKLocalizedPaymentString(&cfstr_WatchOnWristRe_0.isa);
      v18[1] = v12;
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
      uint64_t v14 = [v9 errorWithDomain:v10 code:60000 userInfo:v13];
      uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;
    }
  }
  (*(void (**)(void, void, BOOL))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 40), *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) != 0);
}

void __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_5(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 80) targetDevice];
  uint64_t v9 = [*(id *)(a1 + 40) fidoProfile];
  if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v10 = [v9 relyingPartyIdentifier];
    id v11 = [v9 accountHash];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_6;
    v12[3] = &unk_1E59D20A8;
    uint64_t v15 = *(void *)(a1 + 48);
    id v14 = v7;
    id v13 = v6;
    [v8 checkFidoKeyPresenceForRelyingParty:v10 relyingPartyAccountHash:v11 fidoKeyHash:0 completion:v12];
  }
  else
  {
    (*((void (**)(id, id, void))v7 + 2))(v7, v6, 0);
  }
}

uint64_t __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_6(uint64_t a1, char a2)
{
  v13[2] = *MEMORY[0x1E4F143B8];
  if ((a2 & 1) == 0)
  {
    id v3 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v4 = *MEMORY[0x1E4F871A0];
    v12[0] = *MEMORY[0x1E4F28568];
    uint64_t v5 = PKLocalizedPaymentString(&cfstr_BridgeSerialBa.isa);
    v13[0] = v5;
    v12[1] = *MEMORY[0x1E4F285A0];
    id v6 = PKLocalizedPaymentString(&cfstr_BridgeSerialBa_0.isa);
    v13[1] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
    uint64_t v8 = [v3 errorWithDomain:v4 code:60000 userInfo:v7];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_8;
    v4[3] = &unk_1E59D20D0;
    long long v8 = *(_OWORD *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 64);
    id v5 = WeakRetained;
    id v7 = *(id *)(a1 + 40);
    id v6 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], v4);
  }
}

uint64_t __94__PKPassbookSettingsController__performPhoneToWatchProvisioningForPaymentPass_withCompletion___block_invoke_8(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
LABEL_2:
    objc_msgSend(*(id *)(a1 + 32), "_handleProvisioningError:viewController:");
LABEL_3:
    uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_6;
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)) {
      goto LABEL_3;
    }
    goto LABEL_2;
  }
  [*(id *)(a1 + 32) _presentPaymentSetupViewController:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) paymentPass:*(void *)(a1 + 40)];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_6:

  return v2();
}

- (void)_transitPropertiesForPaymentPass:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    long long v8 = [v6 uniqueID];
    uint64_t v9 = [v6 devicePrimaryPaymentApplication];
    uint64_t v10 = objc_alloc_init(PKPassbookSettingsDefaultBehavior);
    id v11 = [(PKPassbookSettingsDefaultBehavior *)v10 paymentDataProvider];
    if (objc_opt_respondsToSelector())
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      void v12[2] = __80__PKPassbookSettingsController__transitPropertiesForPaymentPass_withCompletion___block_invoke;
      v12[3] = &unk_1E59D2170;
      id v13 = v9;
      id v14 = v6;
      uint64_t v15 = self;
      id v16 = v8;
      id v17 = v7;
      [v11 transitStateWithPassUniqueIdentifier:v16 paymentApplication:v13 completion:v12];
    }
    else
    {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
}

void __80__PKPassbookSettingsController__transitPropertiesForPaymentPass_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __80__PKPassbookSettingsController__transitPropertiesForPaymentPass_withCompletion___block_invoke_2;
  v8[3] = &unk_1E59D2148;
  id v9 = v3;
  id v10 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = *(void **)(a1 + 56);
  id v11 = v4;
  uint64_t v12 = v5;
  id v13 = v6;
  id v14 = *(id *)(a1 + 64);
  id v7 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

void __80__PKPassbookSettingsController__transitPropertiesForPaymentPass_withCompletion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) transitPassPropertiesWithPaymentApplication:*(void *)(a1 + 40) pass:*(void *)(a1 + 48)];
  [*(id *)(a1 + 56) _updateBalancesWithServerBalances:0 transitPassProperties:v2 forPassWithUniqueIdentifier:*(void *)(a1 + 64)];
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

- (int64_t)_paymentSetupContextForSettingsContext:(int64_t)a3
{
  if (!a3) {
    return 3;
  }
  if (a3 == 1) {
    return 4;
  }
  uint64_t v8 = v3;
  uint64_t v9 = v4;
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v7 = 0;
    _os_log_error_impl(&dword_19F450000, v6, OS_LOG_TYPE_ERROR, "Context case not mapped", v7, 2u);
  }

  return 0;
}

- (void)_reloadBalancesAndTransitPassPropertiesForPass:(id)a3 withDataProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __96__PKPassbookSettingsController__reloadBalancesAndTransitPassPropertiesForPass_withDataProvider___block_invoke;
  v9[3] = &unk_1E59D2198;
  objc_copyWeak(&v11, &location);
  id v8 = v6;
  id v10 = v8;
  [(PKPassbookSettingsController *)self _fetchBalancesAndTransitPassPropertiesForPass:v8 withDataProvider:v7 completion:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __96__PKPassbookSettingsController__reloadBalancesAndTransitPassPropertiesForPass_withDataProvider___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v8 = [*(id *)(a1 + 32) uniqueID];
  [WeakRetained _updateBalancesWithServerBalances:v7 transitPassProperties:v6 forPassWithUniqueIdentifier:v8];
}

- (void)_fetchBalancesAndTransitPassPropertiesForPass:(id)a3 withDataProvider:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v7 uniqueID];
  id v11 = dispatch_group_create();
  v32[0] = 0;
  v32[1] = v32;
  void v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__13;
  v32[4] = __Block_byref_object_dispose__13;
  id v33 = 0;
  v30[0] = 0;
  v30[1] = v30;
  void v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__13;
  void v30[4] = __Block_byref_object_dispose__13;
  id v31 = 0;
  uint64_t v12 = [v7 devicePrimaryPaymentApplication];
  dispatch_group_enter(v11);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __106__PKPassbookSettingsController__fetchBalancesAndTransitPassPropertiesForPass_withDataProvider_completion___block_invoke;
  v25[3] = &unk_1E59D17F0;
  id v29 = v32;
  id v13 = v12;
  id v26 = v13;
  id v14 = v7;
  id v27 = v14;
  uint64_t v15 = v11;
  id v28 = v15;
  [v8 transitStateWithPassUniqueIdentifier:v10 paymentApplication:v13 completion:v25];
  dispatch_group_enter(v15);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __106__PKPassbookSettingsController__fetchBalancesAndTransitPassPropertiesForPass_withDataProvider_completion___block_invoke_2;
  v22[3] = &unk_1E59D1818;
  id v24 = v30;
  id v16 = v15;
  id v23 = v16;
  [v8 balancesForPaymentPassWithUniqueIdentifier:v10 completion:v22];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __106__PKPassbookSettingsController__fetchBalancesAndTransitPassPropertiesForPass_withDataProvider_completion___block_invoke_4;
  block[3] = &unk_1E59CC990;
  id v19 = v9;
  id v20 = v30;
  id v21 = v32;
  id v17 = v9;
  dispatch_group_notify(v16, MEMORY[0x1E4F14428], block);

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);
}

void __106__PKPassbookSettingsController__fetchBalancesAndTransitPassPropertiesForPass_withDataProvider_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = [a2 transitPassPropertiesWithPaymentApplication:a1[4] pass:a1[5]];
  uint64_t v4 = *(void *)(a1[7] + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = a1[6];

  dispatch_group_leave(v6);
}

void __106__PKPassbookSettingsController__fetchBalancesAndTransitPassPropertiesForPass_withDataProvider_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __106__PKPassbookSettingsController__fetchBalancesAndTransitPassPropertiesForPass_withDataProvider_completion___block_invoke_3;
  block[3] = &unk_1E59D21C0;
  id v8 = v3;
  long long v6 = *(_OWORD *)(a1 + 32);
  id v4 = (id)v6;
  long long v9 = v6;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __106__PKPassbookSettingsController__fetchBalancesAndTransitPassPropertiesForPass_withDataProvider_completion___block_invoke_3(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(a1 + 32));
  id v2 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v2);
}

uint64_t __106__PKPassbookSettingsController__fetchBalancesAndTransitPassPropertiesForPass_withDataProvider_completion___block_invoke_4(void *a1)
{
  uint64_t result = a1[4];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(void *)(*(void *)(a1[5] + 8) + 40), *(void *)(*(void *)(a1[6] + 8) + 40));
  }
  return result;
}

- (void)_updateBalancesWithServerBalances:(id)a3 transitPassProperties:(id)a4 forPassWithUniqueIdentifier:(id)a5
{
  id v15 = a4;
  id v8 = a5;
  if (v8)
  {
    id v9 = a3;
    id v10 = [(PKPassbookSettingsController *)self _specifierForPassUniqueID:v8];
    id v11 = [v10 objectForKeyedSubscript:@"pkPass"];
    uint64_t v12 = [(NSMutableDictionary *)self->_latestTransitBalanceModel objectForKeyedSubscript:v8];
    id v13 = (void *)[v12 copy];
    if (!v13) {
      id v13 = (void *)[objc_alloc(MEMORY[0x1E4F850D0]) initWithPass:v11];
    }
    [v13 setTransitProperties:v15];
    [v13 setDynamicBalances:v9];

    [(NSMutableDictionary *)self->_latestTransitBalanceModel setObject:v13 forKeyedSubscript:v8];
    if ((PKEqualObjects() & 1) == 0)
    {
      [v10 setObject:v13 forKeyedSubscript:@"pkTransitServerBalance"];
      id v14 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F93220]];
      [v14 updateSubtitleForTransitProperties];
    }
  }
}

- (id)_subtitleTextForActiveAccount:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 feature];
  if (v4 == 4)
  {
    id v5 = [v3 appleBalanceDetails];
    id v11 = [v5 accountSummary];
    uint64_t v12 = [v11 currentBalance];
    id v13 = [v5 currencyCode];
    id v10 = PKCurrencyAmountMake();

    long long v6 = [v10 formattedStringValue];
  }
  else
  {
    if (v4 != 2)
    {
      id v14 = 0;
      goto LABEL_16;
    }
    id v5 = [v3 creditDetails];
    if ([v3 accessLevel] != 1)
    {
      id v15 = [v5 accountSummary];
      id v16 = [v3 altDSID];
      id v10 = [v15 accountUserActivityForAccountUserAltDSID:v16];

      long long v6 = [v10 totalSpending];
      uint64_t v17 = [v5 currencyCode];
      id v18 = (void *)v17;
      id v19 = 0;
      if (v6)
      {
        if (v17)
        {
          id v19 = PKCurrencyAmountMake();
          id v20 = [v19 amount];
          id v21 = [MEMORY[0x1E4F28C28] zero];
          uint64_t v22 = [v20 compare:v21];

          if (v22 == -1)
          {
            uint64_t v23 = [v19 negativeValue];

            id v19 = (void *)v23;
          }
        }
      }
      id v24 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
      id v25 = [MEMORY[0x1E4F1C9C8] date];
      id v26 = [v24 components:8 fromDate:v25];
      [v26 month];

      PKGregorianMonthSpecificLocalizedStringKeyForKey();
      id v27 = (NSString *)objc_claimAutoreleasedReturnValue();
      id v28 = [v19 formattedStringValue];
      id v14 = PKLocalizedMadisonString(v27, &stru_1EF1B4C70.isa, v28);

      goto LABEL_15;
    }
    long long v6 = [v5 cardBalance];
    id v7 = [v6 amount];
    id v8 = [MEMORY[0x1E4F28C28] zero];
    uint64_t v9 = [v7 compare:v8];

    if (v9 == -1)
    {
      id v29 = [v6 negativeValue];

      char v30 = [v29 formattedStringValue];
      id v10 = PKLocalizedPaymentString(&cfstr_AmountFormatRe.isa, &stru_1EF1B4C70.isa, v30);

      long long v6 = v29;
    }
    else
    {
      id v10 = [v6 formattedStringValue];
    }
  }
  id v14 = PKLocalizedFeatureString();
LABEL_15:

LABEL_16:

  return v14;
}

- (void)_updateCardSpecifier:(id)a3 withAccountStateForPaymentPass:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 associatedAccountServiceAccountIdentifier];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __84__PKPassbookSettingsController__updateCardSpecifier_withAccountStateForPaymentPass___block_invoke;
  id v16 = &unk_1E59D21E8;
  uint64_t v17 = self;
  id v9 = v6;
  id v18 = v9;
  id v10 = _Block_copy(&v13);
  int v11 = objc_msgSend(v7, "isAppleBalancePass", v13, v14, v15, v16, v17);

  if (v11)
  {
    uint64_t v12 = [(PKPaymentWebService *)self->_webService targetDevice];
    [v12 accountWithIdentifier:v8 completion:v10];
  }
  else
  {
    [(PKAccountService *)self->_accountService accountWithIdentifier:v8 completion:v10];
  }
}

void __84__PKPassbookSettingsController__updateCardSpecifier_withAccountStateForPaymentPass___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__PKPassbookSettingsController__updateCardSpecifier_withAccountStateForPaymentPass___block_invoke_2;
  block[3] = &unk_1E59CA8E8;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __84__PKPassbookSettingsController__updateCardSpecifier_withAccountStateForPaymentPass___block_invoke_2(id *a1)
{
  uint64_t v2 = [a1[4] state];
  uint64_t v3 = [a1[4] feature];
  switch(v2)
  {
    case 1:
      id v8 = [a1[5] _subtitleTextForActiveAccount:a1[4]];
      break;
    case 2:
    case 3:
    case 4:
      PKLocalizedFeatureString();
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v4 = [MEMORY[0x1E4FB1618] systemRedColor];
      [a1[6] setObject:v4 forKeyedSubscript:@"pkCustomSubTitleColor"];

      break;
    default:
      id v8 = 0;
      break;
  }
  if (v3 == 2)
  {
    id v5 = [a1[4] creditDetails];
    id v6 = [v5 accountSummary];
    if ([v6 requiresDebtCollectionNotices])
    {

      id v8 = 0;
    }
  }
  [a1[6] setObject:v8 forKeyedSubscript:@"pkCustomSubTitle"];
  id v7 = [a1[6] objectForKeyedSubscript:*MEMORY[0x1E4F93220]];
  [v7 updateSubtitle];
}

- (void)paymentSetupDidFinish:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained requestDismissingPresentedViewControllerWithSettingsController:self animated:1 completion:0];
}

- (void)_fetchInstitutions
{
  objc_initWeak(&location, self);
  institutionsDataProvider = self->_institutionsDataProvider;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__PKPassbookSettingsController__fetchInstitutions__block_invoke;
  v4[3] = &unk_1E59CB088;
  objc_copyWeak(&v5, &location);
  [(FKBankConnectInstitutionsProvider *)institutionsDataProvider connectedInstitutionsWithCompletion:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __50__PKPassbookSettingsController__fetchInstitutions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__PKPassbookSettingsController__fetchInstitutions__block_invoke_2;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __50__PKPassbookSettingsController__fetchInstitutions__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    objc_storeStrong(WeakRetained + 37, *(id *)(a1 + 32));
    id v3 = objc_loadWeakRetained(v4 + 81);
    [v3 settingsControllerRequestsReloadSpecifiers:v4];

    id WeakRetained = v4;
  }
}

- (void)connectedInstitutionsDidChange:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__PKPassbookSettingsController_connectedInstitutionsDidChange___block_invoke;
  v6[3] = &unk_1E59CA870;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __63__PKPassbookSettingsController_connectedInstitutionsDidChange___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 296), *(id *)(a1 + 40));
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 648));
  [WeakRetained settingsControllerRequestsReloadSpecifiers:*(void *)(a1 + 32)];
}

- (void)subcredentialProvisioningFlowController:(id)a3 didFinishWithPass:(id)a4 error:(id)a5
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)p_delegate);
    [v10 requestDismissingPresentedViewControllerWithSettingsController:self animated:1 completion:0];
  }
  if (a4)
  {
    [(PKPassbookSettingsController *)self _refreshPasses];
  }
}

- (void)userCanceledPairingWithSubcredentialProvisioningFlowController:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 requestDismissingPresentedViewControllerWithSettingsController:self animated:1 completion:0];
  }
}

- (void)_refreshCIDVUIConfigurations
{
  if (self->_context == 1)
  {
    self->_requiresCIDVUIConfigurations = 1;
    [(PKPassbookSettingsController *)self refreshPasses];
  }
}

- (void)proofingFlowManager:(id)a3 completedProofingWithError:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__PKPassbookSettingsController_proofingFlowManager_completedProofingWithError___block_invoke;
  v7[3] = &unk_1E59CA870;
  id v8 = v5;
  char v9 = self;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __79__PKPassbookSettingsController_proofingFlowManager_completedProofingWithError___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v12 = v3;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Proofing completed with error %@", buf, 0xCu);
  }

  [*(id *)(a1 + 40) _refreshCIDVUIConfigurations];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 648));
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = *(void *)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __79__PKPassbookSettingsController_proofingFlowManager_completedProofingWithError___block_invoke_857;
    v8[3] = &unk_1E59CA870;
    id v6 = WeakRetained;
    uint64_t v7 = *(void *)(a1 + 40);
    id v9 = v6;
    uint64_t v10 = v7;
    [v6 requestDismissingPresentedViewControllerWithSettingsController:v5 animated:1 completion:v8];
  }
}

uint64_t __79__PKPassbookSettingsController_proofingFlowManager_completedProofingWithError___block_invoke_857(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 requestResetToRootWithSettingsController:v4 animated:1];
  }
  return result;
}

- (void)proofingFlowManager:(id)a3 didChangeActiveConfigurations:(id)a4
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__PKPassbookSettingsController_proofingFlowManager_didChangeActiveConfigurations___block_invoke;
  block[3] = &unk_1E59CA7D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __82__PKPassbookSettingsController_proofingFlowManager_didChangeActiveConfigurations___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _refreshCIDVUIConfigurations];
}

- (void)willHandleURL
{
}

- (void)reloadSpecifiers
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained settingsControllerRequestsReloadSpecifiers:self];
}

- (void)showController:(id)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    if (objc_opt_respondsToSelector()) {
      [WeakRetained settingsController:self requestsForcedPresentViewController:v6 animated:v4 completion:0];
    }
    else {
      [WeakRetained settingsController:self requestsPresentViewController:v6 animated:v4 completion:0];
    }
  }
  else
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134218498;
      uint64_t v10 = self;
      __int16 v11 = 2048;
      id v12 = v6;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "PKPassbookSettingsController (%p): dropping request to show view controller (%p): %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (PKPassbookSettingsDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPassbookSettingsDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_defaultWalletContext, 0);
  objc_storeStrong((id *)&self->_hideMyEmailManager, 0);
  objc_storeStrong((id *)&self->_systemPolicyForApp, 0);
  objc_storeStrong((id *)&self->_openAccountGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_closedAccountGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_openAccounts, 0);
  objc_storeStrong((id *)&self->_closedSavingsAccounts, 0);
  objc_storeStrong((id *)&self->_launchAuthorizationPromptController, 0);
  objc_storeStrong((id *)&self->_contactFormatValidator, 0);
  objc_storeStrong((id *)&self->_companionPaymentDataProvider, 0);
  objc_storeStrong((id *)&self->_latestTransitBalanceModel, 0);
  objc_destroyWeak((id *)&self->_expressPassesViewController);
  objc_storeStrong((id *)&self->_defaultExpressTransitSpecifier, 0);
  objc_storeStrong((id *)&self->_expressTransitSectionFooterText, 0);
  objc_storeStrong((id *)&self->_expressTransitSubtitleText, 0);
  objc_storeStrong((id *)&self->_LAContext, 0);
  objc_storeStrong((id *)&self->_pairedDeviceSupportsFeatureByAccountID, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_expressPassController, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccountResolutionController, 0);
  objc_storeStrong((id *)&self->_peerPaymentTinkerSetupButton, 0);
  objc_storeStrong((id *)&self->_peerPaymentSwitchSpecifier, 0);
  objc_storeStrong((id *)&self->_peerPaymentWebService, 0);
  objc_storeStrong((id *)&self->_peerPaymentDelegate, 0);
  objc_storeStrong((id *)&self->_defaultContactPhoneSpecifier, 0);
  objc_storeStrong((id *)&self->_defaultContactEmailSpecifier, 0);
  objc_storeStrong((id *)&self->_defaultShippingAddressSpecifier, 0);
  objc_storeStrong((id *)&self->_defaultPaymentSpecifier, 0);
  objc_storeStrong((id *)&self->_pendingCompanionCardsGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_companionCardsGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_otherCardsGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_paymentCardsGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_addCardButtonSpecifier, 0);
  objc_storeStrong((id *)&self->_activeCIDVUIConfigurations, 0);
  objc_storeStrong((id *)&self->_coreIDVUIProofingFlowManager, 0);
  objc_storeStrong((id *)&self->_bankConnectSpecifiers, 0);
  objc_storeStrong((id *)&self->_institutionsProviderResponses, 0);
  objc_storeStrong((id *)&self->_orderManagementSpecifiers, 0);
  objc_storeStrong((id *)&self->_onlinePaymentsSpecifiers, 0);
  objc_storeStrong((id *)&self->_expiredPassesSwitchSpecifiers, 0);
  objc_storeStrong((id *)&self->_credentialCenterSpecifiers, 0);
  objc_storeStrong((id *)&self->_cardBenefitSpecifiers, 0);
  objc_storeStrong((id *)&self->_payLaterAccount, 0);
  objc_storeStrong((id *)&self->_showPayLaterOptionsSpecifiers, 0);
  objc_storeStrong((id *)&self->_handoffSwitchSpecifiers, 0);
  objc_storeStrong((id *)&self->_lockscreenSwitchSpecifier, 0);
  objc_storeStrong((id *)&self->_lockscreenSwitchSpecifiers, 0);
  objc_storeStrong((id *)&self->_defaultAppSpecifiers, 0);
  objc_storeStrong((id *)&self->_pendingCompanionPassSpecifiers, 0);
  objc_storeStrong((id *)&self->_companionPassSpecifiers, 0);
  objc_storeStrong((id *)&self->_pendingCompanionPasses, 0);
  objc_storeStrong((id *)&self->_hiddenCompanionPasses, 0);
  objc_storeStrong((id *)&self->_companionPasses, 0);
  objc_storeStrong((id *)&self->_otherPassSpecifiers, 0);
  objc_storeStrong((id *)&self->_paymentPassSpecifiers, 0);
  objc_storeStrong((id *)&self->_otherPasses, 0);
  objc_storeStrong((id *)&self->_paymentPasses, 0);
  objc_storeStrong((id *)&self->_provisioningPassIdentifier, 0);
  objc_storeStrong((id *)&self->_defaultCardIdentifier, 0);
  objc_storeStrong((id *)&self->_institutionsDataProvider, 0);
  objc_storeStrong((id *)&self->_inboxDataSource, 0);
  objc_storeStrong((id *)&self->_associatedAccountController, 0);
  objc_storeStrong((id *)&self->_avatarManager, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_unavailableCards, 0);
  objc_storeStrong((id *)&self->_availableCards, 0);
  objc_storeStrong((id *)&self->_defaultCardsController, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_destroyWeak((id *)&self->_optionsDelegate);
  objc_destroyWeak((id *)&self->_paymentDataProvider);
  objc_destroyWeak((id *)&self->_passLibraryDataProvider);

  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end