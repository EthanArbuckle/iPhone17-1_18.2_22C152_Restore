@interface PKPaymentTransactionDetailViewController
- (BOOL)_actionRowIsEnabled:(unint64_t)a3;
- (BOOL)_amountDetailsRowIsEnabled:(unint64_t)a3;
- (BOOL)_canShowAppleCardSupportFooterInAmountDetailsSection;
- (BOOL)_canShowAppleCardSupportFooterInRecognitionHintsSection;
- (BOOL)_hasIssuerPhoneNumber;
- (BOOL)_isPeerPaymentPendingRequestTransaction;
- (BOOL)_recognitionHintsRowIsEnabled:(unint64_t)a3;
- (BOOL)_shouldHighlightAction:(unint64_t)a3;
- (BOOL)_showSeparateReportMerchantInfoButton;
- (BOOL)_transactionHasNonZeroSecondaryFundingSourceAmount;
- (BOOL)_transactionIsTaggedAsRecurring;
- (BOOL)associatedCreditStatementsLoaded;
- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContactProperty:(id)a4;
- (BOOL)inBridge;
- (BOOL)issuerAppDeepLinkingEnabled;
- (BOOL)shouldMapSection:(unint64_t)a3;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (NSArray)associatedCreditStatements;
- (NSArray)lineItems;
- (NSDateFormatter)monthDayLocalFormatter;
- (NSDateFormatter)monthDayYearLocalFormatter;
- (NSDateFormatter)monthFormatter;
- (NSDateFormatter)productTimeZoneFormatter;
- (NSDateFormatter)productTimeZoneMonthDayFormatter;
- (NSDateFormatter)transactionDateFormatter;
- (NSDateFormatter)transactionLocalTimeDateFormatter;
- (NSTimeZone)productTimeZone;
- (PKContactResolver)contactResolver;
- (PKPaymentDataProvider)paymentServiceDataProvider;
- (PKPaymentTransaction)transaction;
- (PKPaymentTransactionDetailHeaderView)headerView;
- (PKPaymentTransactionDetailViewController)initWithTransaction:(id)a3 transactionSourceCollection:(id)a4 familyCollection:(id)a5 account:(id)a6 accountUserCollection:(id)a7 bankConnectInstitution:(id)a8 physicalCards:(id)a9 contactResolver:(id)a10 peerPaymentWebService:(id)a11 paymentServiceDataProvider:(id)a12 detailViewStyle:(int64_t)a13 allowTransactionLinks:(BOOL)a14;
- (PKPaymentTransactionDetailViewControllerDeleteOverrider)deleteOverrider;
- (PKPeerPaymentStatusResponse)peerPaymentStatusResponse;
- (PKTransactionSourceCollection)transactionSourceCollection;
- (UIImage)mapTilePlaceholderImage;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_amountDetailsCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)_applePayBarcodeRowCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)_applePayOrderRowCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)_applePayReceiptRowCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)_associatedFinancingPlanCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)_associatedInstallmentCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)_awardCellForTableView:(id)a3;
- (id)_businessChatContextForNonCancellablePayment;
- (id)_businessChatContextForUnavailableDisputeStatus;
- (id)_coarseLocationHyperlinkFooterView;
- (id)_debugDetailCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)_disputeStatusCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)_disputeStatusDescription;
- (id)_disputeStatusTitle;
- (id)_expiredPhysicalCardCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)_explanationTextForPaymentTransaction:(id)a3;
- (id)_financingPlanDetailsCellForTableView:(id)a3;
- (id)_formattedCounterpartNameForRecurringPayment:(id)a3;
- (id)_fraudRiskCellForTableView:(id)a3;
- (id)_mapTilePlaceholderImage;
- (id)_merchantAddressCellForTableView:(id)a3;
- (id)_merchantTokenDeletedCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)_merchantTokenManagementCellForTableView:(id)a3;
- (id)_peerPaymentController;
- (id)_questionCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)_recognitionHintsCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)_releasedDataCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)_statusCellForTableView:(id)a3;
- (id)_tableView:(id)a3 actionButtonCellForSection:(unint64_t)a4;
- (id)_tableView:(id)a3 cellForActionAtIndex:(int64_t)a4;
- (id)_tableView:(id)a3 cellForAmountDetailLineItemAtIndex:(int64_t)a4 atIndexPath:(id)a5;
- (id)_tableView:(id)a3 cellForAwardAtIndex:(int64_t)a4;
- (id)_tableViewCellForDeleteTransaction:(id)a3;
- (id)_tableViewCellPaymentRewardsRedemptionInfoForTableView:(id)a3 atIndexPath:(id)a4;
- (id)_transactionIdentifierCellForTableView:(id)a3;
- (id)_transactionIdentifierDescription;
- (id)_transactionStatusString;
- (id)contextMenuConfigurationForCopyingText:(id)a3;
- (id)contextMenuConfigurationForTransactionIdentifier;
- (id)formattedBalanceAdjustmentAmountWithTransitDescriptors;
- (id)presentationSceneIdentifierForTopUpController:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)_maximumRetentionPeriodForElements:(id)a3;
- (int64_t)_numberOfActionRowsEnabled;
- (int64_t)_rowIndexForActionRow:(unint64_t)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)_actionRowForRowIndex:(int64_t)a3;
- (unint64_t)_amountDetailsRowForIndex:(unint64_t)a3;
- (unint64_t)_lineItemItemForRowIndex:(unint64_t)a3;
- (unint64_t)_numberOfAmountDetailsRows;
- (unint64_t)_numberOfDataReleaseRows;
- (unint64_t)_numberOfRecognitionHintsRows;
- (unint64_t)_recognitionHintsRowForIndex:(unint64_t)a3;
- (void)_applyAmountDetailSeparatorInsetForTableView:(id)a3 cell:(id)a4;
- (void)_callIssuer;
- (void)_cancelPaymentWithCell:(id)a3;
- (void)_cancelPeerPaymentPendingRequest;
- (void)_deleteTransaction;
- (void)_didSelectMerchantTokenManagement;
- (void)_fetchAllApplePayOrderRowViewModels;
- (void)_fetchAppPrivacyURL;
- (void)_fetchDataReleaseTransactionConfiguration;
- (void)_fetchMerchantToken;
- (void)_handleCoarseLocationChangedNotification:(id)a3;
- (void)_handlePeerPaymentDisplayableError:(id)a3 withPeerPaymentController:(id)a4;
- (void)_handleTransactionHeaderTapRecognizer:(id)a3;
- (void)_loadAppPrivacyURLFromAppStore;
- (void)_openAppPrivacyURL;
- (void)_openBankConnectDigitalServicingURL;
- (void)_openBankConnectPostInstallmentURL;
- (void)_openBankConnectRedeemRewardsURL;
- (void)_openBusinessChatControllerForContext:(id)a3;
- (void)_openMessagesToPresentAction:(unint64_t)a3;
- (void)_openOfferDetailsInIssuerApp:(id)a3;
- (void)_openTransactionInIssuerApp;
- (void)_openURL:(id)a3;
- (void)_performDeleteOverride;
- (void)_performPeerPaymentAction:(id)a3 withCompletion:(id)a4;
- (void)_presentCancelPaymentWithIndexPath:(id)a3;
- (void)_presentCardNumberUpdatedAlert;
- (void)_presentContactIssuer;
- (void)_presentContactViewController;
- (void)_presentRecurringPeerPayment:(id)a3;
- (void)_presentRecurringPeerPaymentAtIndexPath:(id)a3;
- (void)_presentReportIssue;
- (void)_recomputeLineItems;
- (void)_reloadTableHeaderView;
- (void)_reportRadar;
- (void)_showAssociatedFinancingPlanDetailsForIndexPath:(id)a3;
- (void)_showDeleteConfirmationSheet;
- (void)_showInstallmentDetailsForAssociatedInstallment:(id)a3;
- (void)_tableView:(id)a3 didSelectActionAtIndexPath:(id)a4;
- (void)_tableView:(id)a3 didSelectMechantAddressAtIndexPath:(id)a4;
- (void)_tableView:(id)a3 didSelectPeerPaymentAction:(id)a4 atIndexPath:(id)a5;
- (void)_tableView:(id)a3 willDisplayAmountDetailsCell:(id)a4 atIndexPath:(id)a5;
- (void)_updatePeerPaymentTransactionStatusWithCompletion:(id)a3;
- (void)_updateTableHeaderHeight;
- (void)_updateWithTransactionReceipt:(id)a3;
- (void)_updateWithTransactionTags:(id)a3;
- (void)accountServiceAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5;
- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4;
- (void)contactsDidChangeForContactResolver:(id)a3;
- (void)dealloc;
- (void)didUpdateFamilyMembers:(id)a3;
- (void)merchantTokenDetailViewController:(id)a3 didDeleteMerchantToken:(id)a4;
- (void)physicalCardsChanged:(id)a3 forAccountIdentifier:(id)a4;
- (void)recurringPaymentsChanged;
- (void)scrollViewDidScroll:(id)a3;
- (void)setAssociatedCreditStatements:(id)a3;
- (void)setAssociatedCreditStatementsLoaded:(BOOL)a3;
- (void)setContactResolver:(id)a3;
- (void)setDeleteOverrider:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setInBridge:(BOOL)a3;
- (void)setIssuerAppDeepLinkingEnabled:(BOOL)a3;
- (void)setLineItems:(id)a3;
- (void)setMapTilePlaceholderImage:(id)a3;
- (void)setMonthDayLocalFormatter:(id)a3;
- (void)setMonthDayYearLocalFormatter:(id)a3;
- (void)setMonthFormatter:(id)a3;
- (void)setPeerPaymentStatusResponse:(id)a3;
- (void)setProductTimeZone:(id)a3;
- (void)setProductTimeZoneFormatter:(id)a3;
- (void)setProductTimeZoneMonthDayFormatter:(id)a3;
- (void)setTransaction:(id)a3;
- (void)setTransactionDateFormatter:(id)a3;
- (void)setTransactionLocalTimeDateFormatter:(id)a3;
- (void)submitAnswer:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)thresholdTopUpController:(id)a3 requestsDismissViewController:(id)a4;
- (void)thresholdTopUpController:(id)a3 requestsPopViewController:(id)a4;
- (void)thresholdTopUpController:(id)a3 requestsPresentViewController:(id)a4;
- (void)thresholdTopUpController:(id)a3 requestsPushViewController:(id)a4;
- (void)thresholdTopUpControllerCompletedSetup:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4;
- (void)transactionSourceIdentifier:(id)a3 didRemoveTransactionWithIdentifier:(id)a4;
- (void)transactionWithIdentifier:(id)a3 didDownloadTransactionReceipt:(id)a4;
- (void)transactionsChanged:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PKPaymentTransactionDetailViewController

- (PKPaymentTransactionDetailViewController)initWithTransaction:(id)a3 transactionSourceCollection:(id)a4 familyCollection:(id)a5 account:(id)a6 accountUserCollection:(id)a7 bankConnectInstitution:(id)a8 physicalCards:(id)a9 contactResolver:(id)a10 peerPaymentWebService:(id)a11 paymentServiceDataProvider:(id)a12 detailViewStyle:(int64_t)a13 allowTransactionLinks:(BOOL)a14
{
  id v19 = a3;
  id obj = a4;
  id v79 = a4;
  id v78 = a5;
  id v70 = a6;
  id v77 = a6;
  id v72 = a7;
  id v76 = a7;
  id v75 = a8;
  id v20 = a9;
  id v21 = a10;
  id v74 = a11;
  id v80 = a12;
  v82.receiver = self;
  v82.super_class = (Class)PKPaymentTransactionDetailViewController;
  v22 = -[PKSectionTableViewController initWithStyle:numberOfSections:](&v82, sel_initWithStyle_numberOfSections_, objc_msgSend(MEMORY[0x1E4FB1D00], "pkui_groupedStyleDefaultRoundedCornerBehavior"), 25);
  v23 = v22;
  if (!v22) {
    goto LABEL_26;
  }
  v68 = v19;
  objc_storeStrong((id *)&v22->_transactionSourceCollection, obj);
  objc_storeStrong((id *)&v23->_contactResolver, a10);
  v24 = [[PKPaymentTransactionCellController alloc] initWithContactResolver:v23->_contactResolver];
  transactionCellController = v23->_transactionCellController;
  v23->_transactionCellController = v24;

  uint64_t v26 = [MEMORY[0x1E4F84D50] sharedService];
  webService = v23->_webService;
  v23->_webService = (PKPaymentWebService *)v26;

  objc_storeStrong((id *)&v23->_peerPaymentWebService, a11);
  objc_storeStrong((id *)&v23->_paymentServiceDataProvider, a12);
  v23->_detailViewStyle = a13;
  objc_storeStrong((id *)&v23->_familyCollection, a5);
  p_account = (id *)&v23->_account;
  objc_storeStrong((id *)&v23->_account, v70);
  objc_storeStrong((id *)&v23->_accountUserCollection, v72);
  uint64_t v29 = [(PKAccountUserCollection *)v23->_accountUserCollection accountUserForTransaction:v23->_transaction];
  accountUser = v23->_accountUser;
  v23->_accountUser = (PKAccountUser *)v29;

  objc_storeStrong((id *)&v23->_bankConnectInstitution, a8);
  uint64_t v31 = [v20 copy];
  physicalCards = v23->_physicalCards;
  v23->_physicalCards = (NSSet *)v31;

  uint64_t v33 = [MEMORY[0x1E4F84270] sharedInstance];
  accountService = v23->_accountService;
  v23->_accountService = (PKAccountService *)v33;

  [(PKAccountService *)v23->_accountService registerObserver:v23];
  p_transactionSourceCollection = &v23->_transactionSourceCollection;
  uint64_t v35 = [(PKTransactionSourceCollection *)v23->_transactionSourceCollection paymentPass];
  paymentPass = v23->_paymentPass;
  v23->_paymentPass = (PKPaymentPass *)v35;

  if (!v23->_paymentPass && *p_account)
  {
    v37 = [MEMORY[0x1E4F84898] sharedInstance];
    v38 = [*p_account associatedPassUniqueID];
    v39 = [v37 passWithUniqueID:v38];
    uint64_t v40 = [v39 paymentPass];
    v41 = v23->_paymentPass;
    v23->_paymentPass = (PKPaymentPass *)v40;
  }
  v42 = [[PKPhysicalCardController alloc] initWithAccountService:v23->_accountService paymentPass:v23->_paymentPass account:*p_account accountUser:v23->_accountUser physicalCards:v23->_physicalCards];
  physicalCardController = v23->_physicalCardController;
  v23->_physicalCardController = v42;

  v44 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
  transactionDateFormatter = v23->_transactionDateFormatter;
  v23->_transactionDateFormatter = v44;

  id v19 = v68;
  char v46 = [v68 bankConnectRoundTransactionDate];
  [(NSDateFormatter *)v23->_transactionDateFormatter setDateStyle:1];
  if ((v46 & 1) == 0) {
    [(NSDateFormatter *)v23->_transactionDateFormatter setTimeStyle:1];
  }
  v47 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
  monthDayLocalFormatter = v23->_monthDayLocalFormatter;
  v23->_monthDayLocalFormatter = v47;

  [(NSDateFormatter *)v23->_monthDayLocalFormatter setLocalizedDateFormatFromTemplate:@"MMMM d"];
  v49 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
  monthDayYearLocalFormatter = v23->_monthDayYearLocalFormatter;
  v23->_monthDayYearLocalFormatter = v49;

  [(NSDateFormatter *)v23->_monthDayYearLocalFormatter setDateStyle:1];
  [v21 addDelegate:v23];
  [v80 addDelegate:v23];
  v51 = [MEMORY[0x1E4F84E00] sharedInstance];
  [v51 registerObserver:v23];

  if (+[PKPaymentNotificationAppURLHelper applicationExistsToHandleNotificationsForPaymentPass:v23->_paymentPass])
  {
    char v52 = [v68 isBankConnectTransaction] ^ 1;
  }
  else
  {
    char v52 = 0;
  }
  v23->_issuerAppDeepLinkingEnabled = v52;
  v23->_inBridge = PKBridgeUsesDarkAppearance();
  v23->_allowTransactionLinks = a14;
  [(PKPaymentTransactionDetailViewController *)v23 setTransaction:v68];
  uint64_t v53 = [v68 transactionType];
  if (v53 == 3)
  {
    if (![v68 peerPaymentStatus])
    {
      v55 = [(PKPaymentTransaction *)v23->_transaction serviceIdentifier];
      uint64_t v58 = [v55 length];
      v59 = PKLogFacilityTypeGetObject();
      BOOL v60 = os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT);
      if (v58)
      {
        if (v60)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19F450000, v59, OS_LOG_TYPE_DEFAULT, "Fetching remote status for pending transaction.", buf, 2u);
        }

        [(PKPaymentTransactionDetailViewController *)v23 _updatePeerPaymentTransactionStatusWithCompletion:0];
      }
      else
      {
        if (v60)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19F450000, v59, OS_LOG_TYPE_DEFAULT, "Not fetching remote status for pending transaction without a service identifier.", buf, 2u);
        }
      }
      goto LABEL_22;
    }
  }
  else if (v53 == 10)
  {
    v54 = [v68 payments];
    v55 = [v54 firstObject];

    if ([v55 isCurrentlyCancellable])
    {
      uint64_t v56 = [objc_alloc(MEMORY[0x1E4F84620]) initWithTransactionType:10 transactionSourceCollection:*p_transactionSourceCollection paymentDataProvider:0];
      transactionFetcher = v23->_transactionFetcher;
      v23->_transactionFetcher = (PKDashboardTransactionFetcher *)v56;

      [(PKDashboardTransactionFetcher *)v23->_transactionFetcher setDelegate:v23];
    }
LABEL_22:

    id v19 = v68;
  }
  uint64_t v61 = [MEMORY[0x1E4F845B8] sharedInstance];
  coarseLocationMonitor = v23->_coarseLocationMonitor;
  v23->_coarseLocationMonitor = (PKCoarseLocationMonitor *)v61;

  v63 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v63 addObserver:v23 selector:sel__handleCoarseLocationChangedNotification_ name:*MEMORY[0x1E4F87108] object:v23->_coarseLocationMonitor];

  if (*p_account)
  {
    v64 = [[PKAccountServiceAccountResolutionController alloc] initWithAccount:*p_account accountUserCollection:v23->_accountUserCollection transactionSourceCollection:*p_transactionSourceCollection];
    accountResolutionController = v23->_accountResolutionController;
    v23->_accountResolutionController = v64;

    [(PKAccountServiceAccountResolutionController *)v23->_accountResolutionController setDelegate:v23];
  }
  v66 = [(PKPaymentTransactionDetailViewController *)v23 navigationItem];
  objc_msgSend(v66, "pkui_setupScrollEdgeChromelessAppearance");
  objc_msgSend(v66, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);

LABEL_26:
  return v23;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(PKAccountService *)self->_accountService unregisterObserver:self];
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentTransactionDetailViewController;
  [(PKSectionTableViewController *)&v4 dealloc];
}

- (void)setTransaction:(id)a3
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_transaction = &self->_transaction;
  objc_storeStrong((id *)&self->_transaction, a3);
  peerPaymentStatusResponse = self->_peerPaymentStatusResponse;
  self->_peerPaymentStatusResponse = 0;

  associatedTransaction = self->_associatedTransaction;
  self->_associatedTransaction = 0;

  associatedReceipt = self->_associatedReceipt;
  self->_associatedReceipt = 0;

  self->_suppressReceiptImages = 0;
  v9 = [(PKPaymentTransactionDetailViewController *)self _explanationTextForPaymentTransaction:v5];
  transactionExplanation = self->_transactionExplanation;
  self->_transactionExplanation = v9;

  v11 = [v5 isMerchantTokenTransaction];
  if (v11)
  {
    v59 = [v5 recurringPeerPayment];
  }
  else
  {
    v59 = 0;
  }

  [(PKPaymentTransactionDetailViewController *)self _recomputeLineItems];
  [(PKPaymentTransactionDetailViewController *)self _reloadTableHeaderView];
  [(PKSectionTableViewController *)self reloadData];
  if ([v5 transactionType] == 10
    && ([(PKPaymentTransaction *)*p_transaction isBankConnectTransaction] & 1) == 0)
  {
    v23 = [(PKAccount *)self->_account creditDetails];
    v24 = [v23 productTimeZone];
    productTimeZone = self->_productTimeZone;
    self->_productTimeZone = v24;

    uint64_t v26 = [MEMORY[0x1E4F1CAF0] localTimeZone];
    self->_showProductTimeZone = PKEqualObjects() ^ 1;

    if (self->_productTimeZone)
    {
      if (self->_showProductTimeZone)
      {
        v27 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
        productTimeZoneFormatter = self->_productTimeZoneFormatter;
        self->_productTimeZoneFormatter = v27;

        [(NSDateFormatter *)self->_productTimeZoneFormatter setDateStyle:1];
        [(NSDateFormatter *)self->_productTimeZoneFormatter setTimeStyle:1];
        [(NSDateFormatter *)self->_productTimeZoneFormatter setTimeZone:self->_productTimeZone];
        if (self->_showProductTimeZone) {
          [(PKPaymentTransactionDetailViewController *)self _reloadTableHeaderView];
        }
      }
    }
  }
  else if (objc_msgSend(v5, "transactionType", p_transaction) == 11 && objc_msgSend(v5, "accountType") == 2)
  {
    v12 = [(PKAccount *)self->_account creditDetails];
    v13 = [v12 productTimeZone];
    v14 = self->_productTimeZone;
    self->_productTimeZone = v13;

    v15 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    monthFormatter = self->_monthFormatter;
    self->_monthFormatter = v15;

    [(NSDateFormatter *)self->_monthFormatter setTimeZone:self->_productTimeZone];
    [(NSDateFormatter *)self->_monthFormatter setLocalizedDateFormatFromTemplate:@"MMMM"];
    v17 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    productTimeZoneMonthDayFormatter = self->_productTimeZoneMonthDayFormatter;
    self->_productTimeZoneMonthDayFormatter = v17;

    [(NSDateFormatter *)self->_productTimeZoneMonthDayFormatter setTimeZone:self->_productTimeZone];
    [(NSDateFormatter *)self->_productTimeZoneMonthDayFormatter setLocalizedDateFormatFromTemplate:@"MMMM d"];
    id v19 = [v5 associatedStatementIdentifiers];
    if ([v19 count])
    {
      objc_initWeak((id *)location, self);
      accountService = self->_accountService;
      id v21 = [MEMORY[0x1E4F1CAD0] setWithArray:v19];
      v22 = [(PKAccount *)self->_account accountIdentifier];
      v73[0] = MEMORY[0x1E4F143A8];
      v73[1] = 3221225472;
      v73[2] = __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke;
      v73[3] = &unk_1E59E06A8;
      objc_copyWeak(&v74, (id *)location);
      [(PKAccountService *)accountService creditStatementsForStatementIdentifiers:v21 accountIdentifier:v22 completion:v73];

      objc_destroyWeak(&v74);
      objc_destroyWeak((id *)location);
    }
    else
    {
      self->_associatedCreditStatementsLoaded = 1;
      [(PKSectionTableViewController *)self reloadData];
    }
  }
  uint64_t v29 = objc_msgSend(v5, "identifier", p_transaction);
  v30 = [v5 associatedReceiptUniqueID];
  if (v30 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak((id *)location, self);
    paymentServiceDataProvider = self->_paymentServiceDataProvider;
    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_5;
    v71[3] = &unk_1E59E06D0;
    objc_copyWeak(&v72, (id *)location);
    [(PKPaymentDataProvider *)paymentServiceDataProvider transactionReceiptForTransactionWithIdentifier:v29 updateIfNecessary:1 completion:v71];
    objc_destroyWeak(&v72);
    objc_destroyWeak((id *)location);
  }
  if (self->_allowTransactionLinks)
  {
    if ([v5 adjustmentTypeReason] == 3
      || [v5 adjustmentType] == 9
      || [v5 adjustmentType] == 14)
    {
      v32 = [v5 referenceIdentifier];
      uint64_t v33 = [v5 transactionSourceIdentifier];
      v34 = v33;
      if (v33)
      {
        id v35 = v33;
      }
      else
      {
        transactionSourceCollection = self->_transactionSourceCollection;
        v37 = [v5 transactionSourceIdentifier];
        v38 = [(PKTransactionSourceCollection *)transactionSourceCollection transactionSourceForTransactionSourceIdentifier:v37];
        v39 = [v38 transactionSourceIdentifiers];
        id v35 = [v39 anyObject];
      }
      if (v32)
      {
        if (v35)
        {
          if (objc_opt_respondsToSelector())
          {
            objc_initWeak((id *)location, self);
            uint64_t v40 = self->_paymentServiceDataProvider;
            v69[0] = MEMORY[0x1E4F143A8];
            v69[1] = 3221225472;
            v69[2] = __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_7;
            v69[3] = &unk_1E59E06F8;
            objc_copyWeak(&v70, (id *)location);
            [(PKPaymentDataProvider *)v40 transactionWithServiceIdentifier:v32 transactionSourceIdentifier:v35 completion:v69];
            objc_destroyWeak(&v70);
            objc_destroyWeak((id *)location);
          }
        }
        else
        {
          v41 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            v42 = self->_transactionSourceCollection;
            *(_DWORD *)location = 138412546;
            *(void *)&location[4] = v5;
            __int16 v76 = 2112;
            id v77 = v42;
            _os_log_impl(&dword_19F450000, v41, OS_LOG_TYPE_DEFAULT, "Error: the transaction source identifier was not defined for transaction %@ and transactionSourceCollection %@", location, 0x16u);
          }
        }
      }

LABEL_34:
      goto LABEL_35;
    }
    if ([v5 transactionType] == 1)
    {
      v32 = [v5 serviceIdentifier];
      if (v32 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_initWeak((id *)location, self);
        v49 = self->_paymentServiceDataProvider;
        v67[0] = MEMORY[0x1E4F143A8];
        v67[1] = 3221225472;
        v67[2] = __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_233;
        v67[3] = &unk_1E59E06F8;
        objc_copyWeak(&v68, (id *)location);
        [(PKPaymentDataProvider *)v49 transactionWithReferenceIdentifier:v32 completion:v67];
        objc_destroyWeak(&v68);
        objc_destroyWeak((id *)location);
      }
      goto LABEL_34;
    }
    if (![v5 transactionType])
    {
      v32 = [v5 referenceIdentifier];
      if (v32 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_initWeak((id *)location, self);
        uint64_t v53 = self->_paymentServiceDataProvider;
        v65[0] = MEMORY[0x1E4F143A8];
        v65[1] = 3221225472;
        v65[2] = __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_3_237;
        v65[3] = &unk_1E59CBE48;
        objc_copyWeak(&v66, (id *)location);
        [(PKPaymentDataProvider *)v53 installmentPlansWithTransactionReferenceIdentifier:v32 completion:v65];
        objc_destroyWeak(&v66);
        objc_destroyWeak((id *)location);
      }
      if (objc_opt_respondsToSelector())
      {
        objc_initWeak((id *)location, self);
        v54 = self->_paymentServiceDataProvider;
        v63[0] = MEMORY[0x1E4F143A8];
        v63[1] = 3221225472;
        v63[2] = __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_5_246;
        v63[3] = &unk_1E59CBE48;
        objc_copyWeak(&v64, (id *)location);
        [(PKPaymentDataProvider *)v54 transactionTagsForTransactionWithIdentifier:v29 completion:v63];
        objc_destroyWeak(&v64);
        objc_destroyWeak((id *)location);
      }
      if (v59)
      {
        PKPeerPaymentTransactionForRecurringPayment();
        v55 = (PKPaymentTransaction *)objc_claimAutoreleasedReturnValue();
        uint64_t v56 = self->_associatedTransaction;
        self->_associatedTransaction = v55;

        [(PKSectionTableViewController *)self reloadData];
      }
      goto LABEL_34;
    }
    if ([v5 transactionType] == 13)
    {
      v32 = [v5 referenceIdentifier];
      uint64_t v50 = [v5 accountIdentifier];
      v51 = (void *)v50;
      if (v32 && v50)
      {
        objc_initWeak((id *)location, self);
        char v52 = self->_accountService;
        v60[0] = MEMORY[0x1E4F143A8];
        v60[1] = 3221225472;
        v60[2] = __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_7_248;
        v60[3] = &unk_1E59D1DB0;
        objc_copyWeak(&v62, (id *)location);
        id v61 = v32;
        [(PKAccountService *)v52 accountWithIdentifier:v51 completion:v60];

        objc_destroyWeak(&v62);
        objc_destroyWeak((id *)location);
      }

      goto LABEL_34;
    }
  }
LABEL_35:
  if ((PKHideCardBenefitRewards() & 1) == 0)
  {
    v43 = [*v58 paymentRewardsRedemption];
    v44 = v43;
    if (v43)
    {
      v45 = self->_paymentServiceDataProvider;
      char v46 = [v43 balanceIdentifier];
      v47 = [(PKPaymentDataProvider *)v45 paymentRewardsBalanceWithIdentifier:v46];
      associatedPaymentRewardsBalance = self->_associatedPaymentRewardsBalance;
      self->_associatedPaymentRewardsBalance = v47;
    }
  }
}

void __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_2;
  block[3] = &unk_1E59CB378;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v6;
  id v11 = v5;
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    WeakRetained[1394] = 1;
    id v7 = WeakRetained;
    if (!*(void *)(a1 + 32))
    {
      v3 = [*(id *)(a1 + 40) allObjects];
      objc_super v4 = objc_msgSend(v3, "pk_objectsPassingTest:", &__block_literal_global_245);

      uint64_t v5 = [v4 sortedArrayUsingComparator:&__block_literal_global_221];

      id v6 = (void *)v7[181];
      v7[181] = v5;
    }
    [v7 reloadData];
    WeakRetained = v7;
  }
}

BOOL __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 openingDate];
  if (v3)
  {
    objc_super v4 = [v2 closingDate];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

BOOL __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  BOOL v5 = [a2 openingDate];
  id v6 = [v4 openingDate];

  BOOL v7 = [v5 compare:v6] == 1;
  return v7;
}

void __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_6;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _updateWithTransactionReceipt:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

void __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_8;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && (PKEqualObjects() & 1) == 0)
  {
    if ([*(id *)(a1 + 32) transactionType] == 14)
    {
      id v3 = (void *)*((void *)WeakRetained + 177);
      id v4 = [*(id *)(a1 + 32) referenceIdentifier];
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_9;
      v5[3] = &unk_1E59CE000;
      void v5[4] = WeakRetained;
      [v3 installmentPlansWithTransactionReferenceIdentifier:v4 completion:v5];
    }
    else
    {
      objc_storeStrong((id *)WeakRetained + 142, *(id *)(a1 + 32));
      [WeakRetained _recomputeLineItems];
      [WeakRetained reloadData];
    }
  }
}

void __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_10;
  v5[3] = &unk_1E59CA870;
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_10(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) allObjects];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 1144);
  *(void *)(v3 + 1144) = v2;

  [*(id *)(a1 + 32) _recomputeLineItems];
  BOOL v5 = *(void **)(a1 + 32);

  return [v5 reloadData];
}

void __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_233(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_2_234;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_2_234(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained + 142;
    BOOL v5 = WeakRetained;
    char v4 = PKEqualObjects();
    id WeakRetained = v5;
    if ((v4 & 1) == 0)
    {
      objc_storeStrong(v3, *(id *)(a1 + 32));
      [v5 _recomputeLineItems];
      [v5 reloadData];
      id WeakRetained = v5;
    }
  }
}

void __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_3_237(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_4_238;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_4_238(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"lastUpdated" ascending:0];
  id v4 = *(void **)(a1 + 32);
  v7[0] = v3;
  BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  id v6 = [v4 sortedArrayUsingDescriptors:v5];

  if (WeakRetained && (PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong(WeakRetained + 143, v6);
    [WeakRetained _recomputeLineItems];
    [WeakRetained reloadData];
  }
}

void __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_5_246(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_6_247;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_6_247(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _updateWithTransactionTags:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

void __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_7_248(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_8_249;
  block[3] = &unk_1E59CB378;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
}

void __59__PKPaymentTransactionDetailViewController_setTransaction___block_invoke_8_249(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [*(id *)(a1 + 32) creditDetails];
  id v4 = [v3 installmentPlanWithIdentifier:*(void *)(a1 + 40)];

  if (v4)
  {
    v6[0] = v4;
    BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
    if (!WeakRetained) {
      goto LABEL_7;
    }
  }
  else
  {
    BOOL v5 = 0;
    if (!WeakRetained) {
      goto LABEL_7;
    }
  }
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong(WeakRetained + 143, v5);
    [WeakRetained _recomputeLineItems];
    [WeakRetained reloadData];
  }
LABEL_7:
}

- (void)_recomputeLineItems
{
  id v10 = objc_alloc_init(PKPaymentTransactionDetailAmountLineItemGenerator);
  id v3 = [(PKPaymentTransactionDetailAmountLineItemGenerator *)v10 lineItemsForTransaction:self->_transaction transactionSourceCollection:self->_transactionSourceCollection associatedTransaction:self->_associatedTransaction associatedReceipt:self->_associatedReceipt];
  lineItems = self->_lineItems;
  self->_lineItems = v3;

  BOOL v5 = [(PKPaymentTransaction *)self->_transaction timeZone];
  if (v5)
  {
    id v6 = [MEMORY[0x1E4F1CAF0] localTimeZone];
    self->_showTransactionTimeZone = PKEqualObjects() ^ 1;

    if (self->_showTransactionTimeZone)
    {
      id v7 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
      transactionLocalTimeDateFormatter = self->_transactionLocalTimeDateFormatter;
      self->_transactionLocalTimeDateFormatter = v7;

      [(NSDateFormatter *)self->_transactionLocalTimeDateFormatter setDateStyle:1];
      [(NSDateFormatter *)self->_transactionLocalTimeDateFormatter setTimeStyle:1];
      [(NSDateFormatter *)self->_transactionLocalTimeDateFormatter setTimeZone:v5];
      goto LABEL_6;
    }
  }
  else
  {
    self->_showTransactionTimeZone = 0;
  }
  v9 = self->_transactionLocalTimeDateFormatter;
  self->_transactionLocalTimeDateFormatter = 0;

LABEL_6:
}

- (BOOL)shouldMapSection:(unint64_t)a3
{
  id v3 = self;
  switch(a3)
  {
    case 0uLL:
      id v4 = [(PKPaymentTransaction *)self->_transaction unansweredQuestions];
      LOBYTE(v3) = [v4 count] != 0;
      goto LABEL_82;
    case 1uLL:
      uint64_t v5 = [(PKPaymentTransaction *)self->_transaction disputeStatus];
      if (!v5
        || v5 == 7 && ([(PKAccount *)v3->_account hideEnhancedDisputeDetails] & 1) != 0)
      {
        goto LABEL_58;
      }
      LODWORD(v3) = [(PKAccount *)v3->_account hideDisputeDetails] ^ 1;
      return (char)v3;
    case 2uLL:
      id v6 = [(PKPaymentTransaction *)self->_transaction altDSID];
      if (v6)
      {
        id v7 = [(PKPaymentTransaction *)v3->_transaction altDSID];
        id v8 = PKCurrentUserAltDSID();
        if (v7 == v8)
        {
          if ([(PKPhysicalCardController *)v3->_physicalCardController hasExpiredPhysicalCardOnly])
          {
            BOOL v9 = [(PKPhysicalCardController *)v3->_physicalCardController canReplacePhysicalCard];
          }
          else
          {
            BOOL v9 = 0;
          }
          id v8 = v7;
        }
        else
        {
          BOOL v9 = 0;
        }
      }
      else
      {
        BOOL v9 = [(PKPhysicalCardController *)v3->_physicalCardController hasExpiredPhysicalCardOnly]&& [(PKPhysicalCardController *)v3->_physicalCardController canReplacePhysicalCard];
      }

      LOBYTE(v3) = [(PKPaymentTransaction *)v3->_transaction effectiveTransactionSource] == 5
                && v9;
      return (char)v3;
    case 3uLL:
      BOOL v10 = [(PKPaymentTransaction *)self->_transaction transactionType] == 15;
      goto LABEL_51;
    case 4uLL:
      transaction = self->_transaction;
      return [(PKPaymentTransaction *)transaction deviceScoreIdentifiersRequired];
    case 5uLL:
      LOBYTE(v3) = [(PKPaymentTransaction *)self->_transaction transactionType] == 15;
      return (char)v3;
    case 6uLL:
      uint64_t v13 = [(PKPaymentTransactionDetailViewController *)self _numberOfRecognitionHintsRows];
      goto LABEL_50;
    case 7uLL:
      id v4 = [(PKPaymentTransaction *)self->_transaction preferredLocation];
      if (v4) {
        goto LABEL_61;
      }
      v14 = [(PKPaymentTransaction *)v3->_transaction startStationLocation];
      if (v14)
      {
        LOBYTE(v3) = 1;
      }
      else
      {
        id v19 = [(PKPaymentTransaction *)v3->_transaction endStationLocation];
        LOBYTE(v3) = v19 != 0;
      }
      goto LABEL_81;
    case 8uLL:
      if ([(PKPaymentTransaction *)self->_transaction effectiveTransactionSource] != 3) {
        goto LABEL_58;
      }
      id v4 = [(PKPaymentTransaction *)v3->_transaction merchant];
      v15 = [v4 originURL];
      goto LABEL_67;
    case 9uLL:
      BOOL v10 = self->_associatedTransaction == 0;
      goto LABEL_51;
    case 0xAuLL:
      uint64_t v16 = 1144;
      goto LABEL_23;
    case 0xBuLL:
      v17 = [(PKPaymentTransaction *)self->_transaction associatedFinancingPlan];
      goto LABEL_29;
    case 0xCuLL:
      if (![(PKPaymentTransaction *)self->_transaction isIssuerInstallmentTransaction])goto LABEL_58; {
      v17 = [(PKPaymentTransaction *)v3->_transaction issuerInstallmentManagementURL];
      }
      goto LABEL_29;
    case 0xDuLL:
      if (PKHideCardBenefitRewards()) {
        goto LABEL_58;
      }
      v17 = [(PKPaymentTransaction *)v3->_transaction paymentRewardsRedemption];
LABEL_29:
      LOBYTE(v3) = v17 != 0;

      return (char)v3;
    case 0xEuLL:
      if (PKHideCardBenefitRewards()) {
        goto LABEL_58;
      }
      id v4 = [(PKPaymentTransaction *)v3->_transaction paymentRewardsRedemption];
      v15 = [v4 statusLink];
      goto LABEL_67;
    case 0xFuLL:
      id v4 = [(PKPaymentTransaction *)self->_transaction awards];
      if ([v4 count]) {
        goto LABEL_61;
      }
      v15 = [(PKPaymentTransaction *)v3->_transaction barcodeIdentifier];
      if (v15)
      {
        BOOL v18 = !v3->_issuerAppDeepLinkingEnabled;
        goto LABEL_68;
      }
      LOBYTE(v3) = 0;
      goto LABEL_71;
    case 0x10uLL:
      id v4 = [(PKRetrieveMerchantTokensResponse *)self->_merchantTokenResponse merchantTokens];
      if (![v4 count]) {
        goto LABEL_72;
      }
      LOBYTE(v3) = v3->_associatedTransaction == 0;
      goto LABEL_82;
    case 0x11uLL:
      if (!PKIsPhone() || v3->_detailViewStyle || !_os_feature_enabled_impl()) {
        goto LABEL_58;
      }
      uint64_t v16 = 1296;
      goto LABEL_23;
    case 0x12uLL:
      if (!PKIsPhone() || v3->_detailViewStyle || !_os_feature_enabled_impl()) {
        goto LABEL_58;
      }
      uint64_t v16 = 1304;
      goto LABEL_23;
    case 0x13uLL:
      if (!PKIsPhone() || v3->_detailViewStyle || !_os_feature_enabled_impl()) {
        goto LABEL_58;
      }
      uint64_t v16 = 1288;
LABEL_23:
      uint64_t v13 = [*(id *)((char *)&v3->super.super.super.super.super.isa + v16) count];
LABEL_50:
      BOOL v10 = v13 == 0;
LABEL_51:
      LOBYTE(v3) = !v10;
      return (char)v3;
    case 0x14uLL:
      uint64_t v13 = [(PKPaymentTransactionDetailViewController *)self _numberOfActionRowsEnabled];
      goto LABEL_50;
    case 0x15uLL:
      if (!+[PKReportIssueViewController canReportIssueForTransaction:self->_transaction bankConnectInstitution:self->_bankConnectInstitution paymentPass:self->_paymentPass])goto LABEL_58; {
      return [(PKPaymentTransactionDetailViewController *)v3 _showSeparateReportMerchantInfoButton];
      }
    case 0x16uLL:
      id v4 = [(PKPaymentTransaction *)self->_transaction serviceIdentifier];
      if (![v4 length]) {
        goto LABEL_72;
      }
      if ([(PKPaymentPass *)v3->_paymentPass hasAssociatedPeerPaymentAccount])
      {
LABEL_61:
        LOBYTE(v3) = 1;
      }
      else
      {
        v14 = [(PKTransactionSourceCollection *)v3->_transactionSourceCollection transactionSourcesForType:1];
        LOBYTE(v3) = [v14 count] != 0;
LABEL_81:
      }
      goto LABEL_82;
    case 0x17uLL:
      return PKTransactionDebugDetailsEnabled();
    case 0x18uLL:
      id v4 = [(PKPaymentTransactionDetailViewController *)self transaction];
      if ([v4 transactionType] == 15)
      {
        v15 = [(PKPaymentTransaction *)v3->_transaction identifier];
LABEL_67:
        BOOL v18 = v15 == 0;
LABEL_68:
        LOBYTE(v3) = !v18;
LABEL_71:
      }
      else
      {
LABEL_72:
        LOBYTE(v3) = 0;
      }
LABEL_82:

      return (char)v3;
    default:
LABEL_58:
      LOBYTE(v3) = 0;
      return (char)v3;
  }
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentTransactionDetailViewController;
  [(PKSectionTableViewController *)&v6 viewDidLoad];
  id v3 = [(PKPaymentTransactionDetailViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"PKPaymentTransactionTitleValueLabelCellReuseIdentifier"];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"PKPaymentTransactionDefaultCellReuseIdentifier"];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"PKPaymentTransactionConfigurationCellReuseIdentifier"];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"PKPaymentTransactionSubtitleCellReuseIdentifier"];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"PKPaymentTransactionLocationMapCellReuseIdentifier"];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"PKPaymentTransactionDetailLineItemCellReuseIdentifier"];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"PKPaymentTransactionDateLineItemCellReuseIdentifier"];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"PKPaymentTransactionReceiptLineItemCellReuseIdentifier"];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"PKPaymentTransactionTransactionCellReuseIdentifier"];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"PKPaymentTransactionQuestionCellReuseIdentifier"];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"PKPaymentTransactionAwardCellReuseIdentifier"];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"PKPaymentTransactionTransactionExplanationCellReuseIdentifier"];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"PKPaymentTransactionRequestedDataReuseIdentifier"];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"PKPaymentTransactionRequestedElementsDataReuseIdentifier"];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"PKPaymentTransactionMerchantTokenDeletedCellReuseIdentifier"];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"PKPaymentTransactionOrderCellReuseIdentifier"];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"PKPaymentTransactionReceiptCellReuseIdentifier"];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"PKPaymentTransactionBarcodeCellReuseIdentifier"];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"PKPaymentRewardsRedemptionInfoCellReuseIdentifier"];
  [v3 setRowHeight:*MEMORY[0x1E4FB2F28]];
  [v3 setEstimatedRowHeight:50.0];
  id v4 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [v3 setTableFooterView:v4];

  [(PKPaymentTransactionDetailViewController *)self _reloadTableHeaderView];
  uint64_t v5 = [(PKPaymentTransactionDetailViewController *)self view];
  [v5 setAccessibilityIdentifier:*MEMORY[0x1E4F85AD8]];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentTransactionDetailViewController;
  [(PKPaymentTransactionDetailViewController *)&v5 viewWillAppear:a3];
  id v4 = [(PKPaymentTransactionDetailViewController *)self navigationItem];
  [v4 setBackButtonDisplayMode:0];
  [(PKPaymentTransactionDetailViewController *)self _fetchMerchantToken];
  if (PKIsPhone() && !self->_detailViewStyle && _os_feature_enabled_impl()) {
    [(PKPaymentTransactionDetailViewController *)self _fetchAllApplePayOrderRowViewModels];
  }
  [(PKPaymentTransactionDetailViewController *)self _fetchAppPrivacyURL];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentTransactionDetailViewController;
  [(PKPaymentTransactionDetailViewController *)&v5 viewDidAppear:a3];
  if ([(PKPaymentTransaction *)self->_transaction transactionType] == 15)
  {
    id v4 = [MEMORY[0x1E4F843E0] identityViewDidAppearReportEvent:self->_transaction];
    [MEMORY[0x1E4F843E0] subject:*MEMORY[0x1E4F87038] sendEvent:v4];
  }
}

- (void)_updatePeerPaymentTransactionStatusWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  objc_super v5 = [(PKPaymentTransactionDetailViewController *)self _peerPaymentController];
  objc_super v6 = [(PKPaymentTransaction *)self->_transaction serviceIdentifier];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __94__PKPaymentTransactionDetailViewController__updatePeerPaymentTransactionStatusWithCompletion___block_invoke;
  v8[3] = &unk_1E59E0720;
  objc_copyWeak(&v10, &location);
  v8[4] = self;
  id v7 = v4;
  id v9 = v7;
  [v5 statusForPaymentIdentifier:v6 withCompletion:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __94__PKPaymentTransactionDetailViewController__updatePeerPaymentTransactionStatusWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94__PKPaymentTransactionDetailViewController__updatePeerPaymentTransactionStatusWithCompletion___block_invoke_2;
  block[3] = &unk_1E59D54E8;
  objc_copyWeak(&v16, (id *)(a1 + 48));
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(a1 + 40);
  id v12 = v5;
  uint64_t v13 = v7;
  id v14 = v6;
  id v15 = v8;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v16);
}

void __94__PKPaymentTransactionDetailViewController__updatePeerPaymentTransactionStatusWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  objc_storeStrong(WeakRetained + 184, *(id *)(a1 + 32));
  if (*(void *)(a1 + 32))
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __94__PKPaymentTransactionDetailViewController__updatePeerPaymentTransactionStatusWithCompletion___block_invoke_3;
    v8[3] = &unk_1E59CA870;
    uint64_t v3 = *(void *)(a1 + 40);
    v8[4] = WeakRetained;
    void v8[5] = v3;
    objc_msgSend(MEMORY[0x1E4FB1EB0], "pkui_animateUsingOptions:animations:completion:", 6, v8, 0);
  }
  else
  {
    id v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      uint64_t v10 = v5;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Failed to get updated remote status with error: %@", buf, 0xCu);
    }
  }
  uint64_t v6 = *(void *)(a1 + 56);
  if (v6)
  {
    if (*(void *)(a1 + 32)) {
      BOOL v7 = *(void *)(a1 + 48) == 0;
    }
    else {
      BOOL v7 = 0;
    }
    (*(void (**)(uint64_t, BOOL))(v6 + 16))(v6, v7);
  }
}

uint64_t __94__PKPaymentTransactionDetailViewController__updatePeerPaymentTransactionStatusWithCompletion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateTableHeaderHeight];
  uint64_t v2 = [*(id *)(a1 + 32) tableView];
  [v2 layoutIfNeeded];

  uint64_t v3 = *(void **)(a1 + 40);

  return [v3 updateSectionVisibilityAndReloadIfNecessaryForSections:&unk_1EF2BA398];
}

- (void)viewWillLayoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentTransactionDetailViewController;
  [(PKPaymentTransactionDetailViewController *)&v7 viewWillLayoutSubviews];
  uint64_t v3 = [(PKPaymentTransactionDetailViewController *)self tableView];
  [(PKPaymentTransactionDetailViewController *)self _updateTableHeaderHeight];
  headerView = self->_headerView;
  uint64_t v5 = [(PKPaymentTransactionDetailViewController *)self navigationItem];
  uint64_t v6 = v5;
  if (headerView) {
    objc_msgSend(v3, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v5);
  }
  else {
    [v5 _setManualScrollEdgeAppearanceProgress:1.0];
  }
}

- (void)_reloadTableHeaderView
{
  uint64_t v3 = [(PKPaymentTransaction *)self->_transaction transactionType];
  uint64_t v4 = v3;
  switch(v3)
  {
    case 0:
      if ([(PKPaymentTransaction *)self->_transaction accountType] == 1)
      {
        id v16 = [(PKPaymentTransaction *)self->_transaction payments];
        uint64_t v17 = [v16 count];

        if (v17) {
          goto LABEL_75;
        }
        v65 = [(PKPaymentTransaction *)self->_transaction transfers];
        if ([v65 count])
        {

          goto LABEL_102;
        }
        id v74 = [(PKPaymentTransaction *)self->_transaction referenceIdentifier];
        uint64_t v75 = [v74 length];

        if (v75) {
          goto LABEL_102;
        }
      }
      if ([(PKPaymentTransaction *)self->_transaction associatedFeatureIdentifier] != 3) {
        goto LABEL_2;
      }
      v38 = [(PKPaymentTransaction *)self->_transaction merchant];
      __int16 v76 = [v38 displayName];
      char v52 = v76;
      if (v76)
      {
        id v53 = v76;
      }
      else
      {
        PKLocalizedCocoonString(&cfstr_ApplePayLater.isa);
        id v53 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_109;
    case 1:
    case 4:
    case 9:
    case 12:
    case 13:
    case 14:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
LABEL_2:
      uint64_t v5 = [(PKPaymentTransaction *)self->_transaction merchant];
      uint64_t v6 = v5;
      if (self->_showRawName && ([v5 rawName], (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        id v8 = (void *)v7;
        id v9 = [v6 rawName];
      }
      else
      {
        id v9 = [v6 displayName];
      }
      if (![v9 length])
      {
        uint64_t v10 = PKLocalizedPaymentString(&cfstr_PaymentSummary_2.isa);

        id v9 = (id)v10;
      }
      uint64_t v11 = [(PKPaymentTransaction *)self->_transaction displayLocation];
      uint64_t v12 = [v11 length];

      if (v12)
      {
        uint64_t v13 = NSString;
        id v14 = [(PKPaymentTransaction *)self->_transaction displayLocation];
        uint64_t v15 = [v13 stringWithFormat:@"%@, %@", v9, v14];

        id v9 = (id)v15;
      }

      goto LABEL_111;
    case 2:
      char v18 = [(PKPaymentTransaction *)self->_transaction transitModifiers];
      uint64_t v19 = [(PKPaymentTransaction *)self->_transaction transitType];
      uint64_t v20 = v19;
      uint64_t v161 = v4;
      id v21 = 0;
      if ((v18 & 8) != 0)
      {
        if (v19 > 256)
        {
          v22 = @"MAGLEV_TRANSACTION_LIST_FARE_ADJUSTMENT";
          switch(v20)
          {
            case 257:
              v22 = @"SHINKANSEN_TRANSACTION_LIST_FARE_ADJUSTMENT";
              goto LABEL_203;
            case 258:
              goto LABEL_203;
            case 259:
              v22 = @"TAXI_TRANSACTION_LIST_FARE_ADJUSTMENT";
              goto LABEL_203;
            case 260:
              v22 = @"FERRY_TRANSACTION_LIST_FARE_ADJUSTMENT";
              goto LABEL_203;
            case 261:
              v22 = @"BIKE_TRANSACTION_LIST_FARE_ADJUSTMENT";
              goto LABEL_203;
            default:
              if (v20 == 1025)
              {
                v22 = @"GREEN_CAR_TRANSACTION_LIST_FARE_ADJUSTMENT";
              }
              else
              {
                if (v20 != 1026) {
                  goto LABEL_204;
                }
                v22 = @"METRO_UPGRADE_TRANSACTION_LIST_FARE_ADJUSTMENT";
              }
              break;
          }
          goto LABEL_203;
        }
        switch(v19)
        {
          case 1:
            v22 = @"TRANSIT_TRANSACTION_LIST_FARE_ADJUSTMENT";
            goto LABEL_203;
          case 2:
            v22 = @"METRO_TRANSACTION_LIST_FARE_ADJUSTMENT";
            goto LABEL_203;
          case 3:
            v22 = @"BUS_TRANSACTION_LIST_FARE_ADJUSTMENT";
            goto LABEL_203;
          case 4:
            v22 = @"TRAIN_TRANSACTION_LIST_FARE_ADJUSTMENT";
            goto LABEL_203;
          case 7:
            v22 = @"LIGHT_RAIL_TRANSACTION_LIST_FARE_ADJUSTMENT";
            goto LABEL_203;
          case 8:
            v22 = @"CABLE_CAR_TRANSACTION_LIST_FARE_ADJUSTMENT";
            goto LABEL_203;
          default:
            break;
        }
      }
      else
      {
        if ((v18 & 0x10) == 0) {
          goto LABEL_204;
        }
        if (v19 > 256)
        {
          v22 = @"MAGLEV_TRANSACTION_LIST_FARE_REBATE";
          switch(v20)
          {
            case 257:
              v22 = @"SHINKANSEN_TRANSACTION_LIST_FARE_REBATE";
              break;
            case 258:
              break;
            case 259:
              v22 = @"TAXI_TRANSACTION_LIST_FARE_REBATE";
              break;
            case 260:
              v22 = @"FERRY_TRANSACTION_LIST_FARE_REBATE";
              break;
            case 261:
              v22 = @"BIKE_TRANSACTION_LIST_FARE_REBATE";
              break;
            default:
              if (v20 == 1025)
              {
                v22 = @"GREEN_CAR_TRANSACTION_LIST_FARE_REBATE";
              }
              else
              {
                if (v20 != 1026) {
                  goto LABEL_204;
                }
                v22 = @"METRO_UPGRADE_TRANSACTION_LIST_FARE_REBATE";
              }
              break;
          }
LABEL_203:
          id v21 = PKLocalizedPaymentString(&v22->isa);
          goto LABEL_204;
        }
        switch(v19)
        {
          case 1:
            v22 = @"TRANSIT_TRANSACTION_LIST_FARE_REBATE";
            goto LABEL_203;
          case 2:
            v22 = @"METRO_TRANSACTION_LIST_FARE_REBATE";
            goto LABEL_203;
          case 3:
            v22 = @"BUS_TRANSACTION_LIST_FARE_REBATE";
            goto LABEL_203;
          case 4:
            v22 = @"TRAIN_TRANSACTION_LIST_FARE_REBATE";
            goto LABEL_203;
          case 7:
            v22 = @"LIGHT_RAIL_TRANSACTION_LIST_FARE_REBATE";
            goto LABEL_203;
          case 8:
            v22 = @"CABLE_CAR_TRANSACTION_LIST_FARE_REBATE";
            goto LABEL_203;
          default:
            break;
        }
      }
LABEL_204:
      uint64_t v148 = [(PKPaymentTransaction *)self->_transaction startStation];
      uint64_t v149 = [(PKPaymentTransaction *)self->_transaction endStation];
      v150 = [(PKPaymentTransaction *)self->_transaction displayLocation];
      v151 = [(PKPaymentTransaction *)self->_transaction merchant];
      v152 = [v151 displayName];

      if (v148) {
        BOOL v153 = v149 == 0;
      }
      else {
        BOOL v153 = 1;
      }
      if (!v153)
      {
        PKLocalizedPaymentString(&cfstr_TransitTransac.isa, &cfstr_12.isa, v148, v149);
        id v155 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_218;
      }
      if (v148 | v149)
      {
        if (v148) {
          v154 = (void *)v148;
        }
        else {
          v154 = (void *)v149;
        }
        id v155 = v154;
LABEL_218:
        id v9 = v155;
        if (v21) {
          goto LABEL_220;
        }
        goto LABEL_219;
      }
      if ([v150 length])
      {
        id v155 = v150;
        goto LABEL_218;
      }
      if ([v152 length])
      {
        id v155 = v152;
        goto LABEL_218;
      }
      if (![(PKPaymentTransaction *)self->_transaction transactionSource]
        && (v20 == 516 || v20 == 513))
      {
        id v155 = [(PKPaymentPass *)self->_paymentPass organizationName];
        goto LABEL_218;
      }
      id v9 = 0;
      if (!v21)
      {
LABEL_219:
        id v21 = PKPaymentTransactionTransitSubtypeToLocalizedTitle();
      }
LABEL_220:
      id v156 = v21;
      v157 = v156;
      if (v9)
      {
        if (v156)
        {
          if ([(PKPaymentTransaction *)self->_transaction shouldSuppressDate])
          {
            v167 = 0;
          }
          else
          {
            transactionDateFormatter = self->_transactionDateFormatter;
            v160 = [(PKPaymentTransaction *)self->_transaction transactionDate];
            v167 = [(NSDateFormatter *)transactionDateFormatter stringFromDate:v160];
          }
          v158 = v157;
        }
        else
        {
          v158 = 0;
          v167 = 0;
        }
      }
      else
      {
        v158 = 0;
        v167 = 0;
        id v9 = v156;
      }

      uint64_t v29 = 0;
      uint64_t v27 = 1;
      uint64_t v4 = v161;
      v36 = v158;
      goto LABEL_113;
    case 3:
      uint64_t v162 = v3;
      v23 = [(PKPaymentTransaction *)self->_transaction peerPaymentMemo];
      v24 = [(PKPaymentTransaction *)self->_transaction recurringPeerPayment];
      v25 = [v24 memo];
      uint64_t v26 = v25;
      uint64_t v27 = v25 == 0;
      if (v25)
      {
        uint64_t v28 = [v25 text];

        uint64_t v29 = PKPeerPaymentRecurringPaymentMemoImage(v26, 80.0, 80.0);
        v23 = (void *)v28;
      }
      else
      {
        uint64_t v29 = 0;
      }
      if ([v23 length])
      {
        PKLocalizedPeerPaymentString(&cfstr_PeerPaymentTra.isa, &stru_1EF1B4C70.isa, v23);
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          [v24 frequency];
          v49 = [v24 startDate];
          uint64_t v50 = PKPeerPaymentRecurringPaymentFrequencyToLocalizedWeekdayString();

          if (v50)
          {
            uint64_t v51 = PKLocalizedPeerPaymentRecurringString(&cfstr_RecurringPayme_14.isa, &stru_1EF1B5770.isa, v9, v50);

            id v9 = (id)v51;
          }
        }
      }
      else
      {
        uint64_t v58 = [(PKPaymentTransaction *)self->_transaction peerPaymentCounterpartHandle];
        if ([(PKPaymentTransaction *)self->_transaction peerPaymentPaymentMode] == 2)
        {
          id v59 = v58;
        }
        else
        {
          uint64_t v66 = v27;
          int v67 = [(PKContactResolver *)self->_contactResolver hasCachedResultForHandle:v58];
          contactResolver = self->_contactResolver;
          if (v67)
          {
            v69 = [(PKContactResolver *)contactResolver contactForHandle:v58];
          }
          else
          {
            v169[0] = MEMORY[0x1E4F143A8];
            v169[1] = 3221225472;
            v169[2] = __66__PKPaymentTransactionDetailViewController__reloadTableHeaderView__block_invoke;
            v169[3] = &unk_1E59D25A8;
            v169[4] = self;
            [(PKContactResolver *)contactResolver contactForHandle:v58 withCompletion:v169];
            v69 = 0;
          }
          id v59 = [MEMORY[0x1E4F84D88] displayNameForCounterpartHandle:v58 contact:v69];

          uint64_t v27 = v66;
        }
        unint64_t v73 = [(PKPaymentTransaction *)self->_transaction peerPaymentType] - 1;
        if (v73 > 2)
        {
          id v9 = 0;
        }
        else
        {
          PKLocalizedPeerPaymentString(&off_1E59E0990[v73]->isa, &stru_1EF1B4C70.isa, v59);
          id v9 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      v167 = 0;
      v36 = 0;
      uint64_t v4 = v162;
      goto LABEL_113;
    case 5:
      v30 = [(PKPaymentTransaction *)self->_transaction transfers];
      if (![v30 count]) {
        goto LABEL_42;
      }
      uint64_t v31 = [(PKPaymentTransaction *)self->_transaction featureIdentifier];

      if (v31 != 5) {
        goto LABEL_43;
      }
      v32 = [(PKPaymentTransaction *)self->_transaction transfers];
      v30 = [v32 firstObject];

      uint64_t v33 = [v30 externalAccount];
      uint64_t v34 = [v33 type];

      if (v34 == 2 && [v30 type] == 3)
      {
        [(PKPaymentTransaction *)self->_transaction featureIdentifier];
        PKLocalizedFeatureString();
        id v9 = (id)objc_claimAutoreleasedReturnValue();

        if (v9) {
          goto LABEL_111;
        }
      }
      else
      {
LABEL_42:
      }
LABEL_43:
      uint64_t v47 = [(PKPaymentTransaction *)self->_transaction secondaryFundingSourceType];
      if (v47)
      {
        if (v47 == 2)
        {
          char v46 = @"TRANSACTION_TYPE_WITHDRAWAL_DEBIT";
        }
        else
        {
          if (v47 != 1) {
            goto LABEL_47;
          }
          char v46 = @"TRANSACTION_TYPE_WITHDRAWAL_BANK_ACCOUNT";
        }
      }
      else
      {
LABEL_102:
        char v46 = @"TRANSACTION_TYPE_WITHDRAWAL_GENERIC";
      }
      goto LABEL_103;
    case 6:
      if ([(PKPaymentTransaction *)self->_transaction isRecurring]
        && [(PKPaymentTransaction *)self->_transaction accountType] == 1)
      {
        uint64_t v35 = PKLocalizedPeerPaymentRecurringString(&cfstr_TransactionDet_70.isa);
      }
      else
      {
        char v46 = @"TRANSACTION_TYPE_TOP_UP";
LABEL_103:
        uint64_t v35 = PKLocalizedPaymentString(&v46->isa);
      }
      goto LABEL_104;
    case 7:
      PKLocalizedTitleForTransactionWithAdjustment();
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      v36 = PKLocalizedSubtitleForTransactionWithAdjustment();
      uint64_t v29 = 0;
      v167 = 0;
      goto LABEL_112;
    case 8:
      v37 = [(PKPaymentTransaction *)self->_transaction merchantProvidedDescription];
      v38 = v37;
      if (v37)
      {
        id v9 = v37;
      }
      else
      {
        char v52 = [(PKPaymentTransaction *)self->_transaction merchant];
        id v53 = [v52 displayName];
LABEL_109:
        id v9 = v53;
      }
      goto LABEL_111;
    case 10:
      if (![(PKPaymentTransaction *)self->_transaction isBankConnectTransaction])goto LABEL_75; {
      uint64_t v35 = PKLocalizedBankConnectString(&cfstr_BankConnectTra.isa);
      }
      goto LABEL_104;
    case 11:
      uint64_t v39 = [(PKPaymentTransaction *)self->_transaction accountType];
      if (v39 == 3)
      {
        [(PKPaymentTransaction *)self->_transaction featureIdentifier];
      }
      else if (v39 != 2)
      {
LABEL_47:
        uint64_t v29 = 0;
        v167 = 0;
        v36 = 0;
        id v9 = 0;
        goto LABEL_112;
      }
LABEL_75:
      uint64_t v35 = PKLocalizedFeatureString();
LABEL_104:
      id v9 = (id)v35;
LABEL_111:
      uint64_t v29 = 0;
      v167 = 0;
      v36 = 0;
LABEL_112:
      uint64_t v27 = 1;
      goto LABEL_113;
    case 15:
      uint64_t v40 = v3;
      v41 = [(PKPaymentTransaction *)self->_transaction merchant];
      v42 = v41;
      if (self->_showRawName && ([v41 rawName], (uint64_t v43 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v44 = (void *)v43;
        v45 = [v42 rawName];
      }
      else
      {
        v45 = [v42 displayName];
      }
      uint64_t v48 = [v45 length];
      if (v48)
      {
        id v9 = v45;
      }
      else
      {
        v54 = [(PKPaymentTransaction *)self->_transaction releasedData];
        [v54 verificationType];

        PKTransactionReleasedDataVerificationTypeToLocalizedTitle();
        id v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      v55 = [(PKPaymentTransaction *)self->_transaction displayLocation];
      uint64_t v56 = [v55 length];

      if (v56)
      {
        uint64_t v57 = [(PKPaymentTransaction *)self->_transaction displayLocation];
LABEL_69:
        id v61 = (void *)v57;
        goto LABEL_70;
      }
      if (v48)
      {
        BOOL v60 = [(PKPaymentTransaction *)self->_transaction releasedData];
        [v60 verificationType];

        uint64_t v57 = PKTransactionReleasedDataVerificationTypeToLocalizedTitle();
        goto LABEL_69;
      }
      id v61 = 0;
LABEL_70:
      if ([(PKPaymentTransaction *)self->_transaction shouldSuppressDate])
      {
        v167 = 0;
        v36 = v61;
      }
      else
      {
        id v62 = self->_transactionDateFormatter;
        v63 = [(PKPaymentTransaction *)self->_transaction transactionDate];
        uint64_t v64 = [(NSDateFormatter *)v62 stringFromDate:v63];

        v36 = v61;
        if ([v61 length])
        {
          v167 = (void *)v64;
        }
        else
        {

          v167 = 0;
          v36 = (void *)v64;
        }
      }
      if (v42)
      {
        uint64_t v70 = 0;
      }
      else
      {
        double v71 = PKUIScreenScale();
        id v72 = PKColorForMerchantCategory(v71);
        uint64_t v70 = PKUIGenericBusinessIconImage(v72, 80.0, v71);
      }
      uint64_t v27 = 1;
      uint64_t v4 = v40;
      uint64_t v29 = v70;
LABEL_113:
      int v77 = [(PKPaymentTransaction *)self->_transaction isBankConnectTransaction];
      transaction = self->_transaction;
      v166 = (void *)v29;
      if (v77)
      {
        v165 = v36;
        id v79 = [(PKPaymentTransaction *)transaction merchant];
        id v80 = v79;
        if (self->_showRawName && ([v79 rawName], (uint64_t v81 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          objc_super v82 = (void *)v81;
          id v83 = [v80 rawName];
        }
        else
        {
          id v83 = [v80 displayName];
          objc_super v82 = v83;
        }
        v114 = v83;

        v91 = [(PKPaymentTransaction *)self->_transaction localizedTypeDescription];
        unsigned int v164 = v27;
        v163 = v80;
        if (![v91 length]
          || [(PKPaymentTransaction *)self->_transaction transactionType] == 16)
        {
          uint64_t v92 = PKLocalizedPaymentString(&cfstr_PaymentSummary_2.isa);

          v91 = (void *)v92;
        }
        v93 = self->_transactionDateFormatter;
        v94 = [(PKPaymentTransaction *)self->_transaction transactionDate];
        v95 = [(NSDateFormatter *)v93 stringFromDate:v94];

        uint64_t v96 = [v114 length];
        if (v96) {
          v97 = v114;
        }
        else {
          v97 = v91;
        }
        id v98 = v97;

        v99 = [(PKPaymentTransaction *)self->_transaction displayLocation];
        uint64_t v100 = [v99 length];

        if (v100)
        {
          v101 = NSString;
          [(PKPaymentTransaction *)self->_transaction displayLocation];
          v103 = uint64_t v102 = v4;
          uint64_t v104 = [v101 stringWithFormat:@"%@, %@", v98, v103];

          uint64_t v4 = v102;
          id v9 = (id)v104;
        }
        else
        {
          id v9 = v98;
        }
        unint64_t v105 = [(PKPaymentTransaction *)self->_transaction transactionType];
        if (v105 <= 0x16 && ((1 << v105) & 0x7EFF7D) != 0 && v96)
        {
          id v106 = v91;

          v107 = v167;
          v167 = v95;
        }
        else
        {
          id v106 = v95;
          v107 = v165;
        }
        id v108 = v95;

        id v109 = v106;
        uint64_t v27 = v164;
        v113 = v163;
      }
      else
      {
        if ([(PKPaymentTransaction *)transaction shouldSuppressDate]) {
          goto LABEL_145;
        }
        if (!v36)
        {
          v84 = self->_transactionDateFormatter;
          v85 = [(PKPaymentTransaction *)self->_transaction transactionDate];
          v36 = [(NSDateFormatter *)v84 stringFromDate:v85];
        }
        if (v4 != 10 || !self->_showProductTimeZone)
        {
          if (!self->_showTransactionTimeZone) {
            goto LABEL_145;
          }
          id v109 = v36;
          transactionLocalTimeDateFormatter = self->_transactionLocalTimeDateFormatter;
          v88 = [(PKPaymentTransaction *)self->_transaction transactionDate];
          uint64_t v89 = [(NSDateFormatter *)transactionLocalTimeDateFormatter stringFromDate:v88];

          v113 = (void *)v89;
          v90 = [(PKPaymentTransaction *)self->_transaction timeZone];
          v114 = [v90 abbreviation];

          [NSString stringWithFormat:@"%@ (%@)", v113, v114];
        }
        else
        {
          id v109 = v36;
          productTimeZoneFormatter = self->_productTimeZoneFormatter;
          v111 = [(PKPaymentTransaction *)self->_transaction transactionDate];
          uint64_t v112 = [(NSDateFormatter *)productTimeZoneFormatter stringFromDate:v111];

          v113 = (void *)v112;
          v114 = [(NSTimeZone *)self->_productTimeZone abbreviation];
          [NSString stringWithFormat:@"%@ (%@)", v112, v114];
        }
        v167 = v91 = v167;
      }

      v36 = v109;
LABEL_145:
      if ([(PKPaymentTransaction *)self->_transaction isBankConnectTransaction])
      {
        v115 = [(PKPaymentTransaction *)self->_transaction formattedBalanceAdjustmentAmount];
        v116 = v166;
        goto LABEL_156;
      }
      v116 = v166;
      if (v4 == 2)
      {
        uint64_t v120 = [(PKPaymentTransactionDetailViewController *)self formattedBalanceAdjustmentAmountWithTransitDescriptors];
LABEL_153:
        v115 = (void *)v120;
        goto LABEL_156;
      }
      if (v4 != 3)
      {
        uint64_t v120 = [(PKPaymentTransaction *)self->_transaction formattedBalanceAdjustmentAmount];
        goto LABEL_153;
      }
      v117 = [(PKPaymentTransaction *)self->_transaction formattedBalanceAdjustmentSubtotalAmount];
      v118 = v117;
      if (v117)
      {
        id v119 = v117;
      }
      else
      {
        id v119 = [(PKPaymentTransaction *)self->_transaction formattedBalanceAdjustmentAmount];
      }
      v115 = v119;

LABEL_156:
      if (![v115 length]
        && [(PKPaymentTransaction *)self->_transaction transactionType] != 15)
      {
        headerView = self->_headerView;
        self->_headerView = 0;

        v129 = [(PKPaymentTransactionDetailViewController *)self navigationItem];
        [v129 setTitle:v9];

        v130 = [(PKPaymentTransactionDetailViewController *)self navigationController];
        v131 = [v130 navigationBar];
        [v131 _setTitleOpacity:1.0];

        goto LABEL_176;
      }
      v121 = objc_alloc_init(PKPaymentTransactionDetailHeaderView);
      v122 = self->_headerView;
      self->_headerView = v121;

      [(PKPaymentTransactionDetailHeaderView *)self->_headerView setInBridge:self->_inBridge];
      [(PKPaymentTransactionDetailHeaderView *)self->_headerView setUseStroke:v27];
      v123 = [(PKPaymentTransaction *)self->_transaction merchant];
      v124 = [v123 rawName];

      if (v124)
      {
        v125 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleTransactionHeaderTapRecognizer_];
        [(PKPaymentTransactionDetailHeaderView *)self->_headerView addGestureRecognizer:v125];
      }
      uint64_t v126 = [v115 length];
      v127 = self->_headerView;
      if (!v126)
      {
        [(PKPaymentTransactionDetailHeaderView *)v127 setHasProminentSubtitle:1];
        if (self->_iconGenerator)
        {
          if (!v116)
          {
LABEL_167:
            aBlock[0] = MEMORY[0x1E4F143A8];
            aBlock[1] = 3221225472;
            aBlock[2] = __66__PKPaymentTransactionDetailViewController__reloadTableHeaderView__block_invoke_3;
            aBlock[3] = &unk_1E59DBD88;
            aBlock[4] = self;
            v134 = _Block_copy(aBlock);
            if ([(PKPaymentTransaction *)self->_transaction transactionType] == 15)
            {
              if ([(PKPaymentTransaction *)self->_transaction transactionSource] == 2)
              {
                v135 = [(PKPaymentTransaction *)self->_transaction releasedData];
                v136 = [v135 application];
                BOOL v137 = v136 != 0;
              }
              else
              {
                BOOL v137 = 0;
              }
              v116 = -[PKPaymentTransactionIconGenerator iconForTransaction:size:ignoreLogoURL:requestType:iconHandler:](self->_iconGenerator, "iconForTransaction:size:ignoreLogoURL:requestType:iconHandler:", self->_transaction, v137, 0, v134, 80.0, 80.0);
            }
            else
            {
              iconGenerator = self->_iconGenerator;
              v139 = [(PKPaymentTransaction *)self->_transaction merchant];
              v116 = -[PKPaymentTransactionIconGenerator iconForMerchant:size:ignoreLogoURL:requestType:iconHandler:](iconGenerator, "iconForMerchant:size:ignoreLogoURL:requestType:iconHandler:", v139, 0, 0, v134, 80.0, 80.0);
            }
            if (!v116) {
              goto LABEL_175;
            }
          }
        }
        else
        {
          v132 = [[PKPaymentTransactionIconGenerator alloc] initWithCache:1 scale:PKUIScreenScale()];
          v133 = self->_iconGenerator;
          self->_iconGenerator = v132;

          if (!v116) {
            goto LABEL_167;
          }
        }
        [(PKPaymentTransactionDetailHeaderView *)self->_headerView setMerchantIcon:v116];
        goto LABEL_175;
      }
      [(PKPaymentTransactionDetailHeaderView *)v127 setAmountText:v115];
      [(PKPaymentTransactionDetailHeaderView *)self->_headerView setMerchantIcon:v116];
LABEL_175:
      [(PKPaymentTransactionDetailHeaderView *)self->_headerView setSubtitleText:v9];
      [(PKPaymentTransactionDetailHeaderView *)self->_headerView setSecondarySubtitleText:v36];
      [(PKPaymentTransactionDetailHeaderView *)self->_headerView setTertiarySubtitleText:v167];
      v140 = [(PKPaymentTransactionDetailViewController *)self navigationItem];
      [v140 setTitle:0];

      v130 = [(PKPaymentTransactionDetailViewController *)self navigationItem];
      [v130 setLargeTitleDisplayMode:2];
LABEL_176:

      if ([(PKPaymentTransaction *)self->_transaction transactionType] == 15) {
        [(PKPaymentTransactionDetailViewController *)self _fetchDataReleaseTransactionConfiguration];
      }
      v141 = [(PKPaymentTransactionDetailViewController *)self tableView];
      [v141 setTableHeaderView:self->_headerView];

      if (os_variant_has_internal_ui()
        && [(PKPaymentTransaction *)self->_transaction isBankConnectTransaction])
      {
        v142 = [MEMORY[0x1E4FB1818] systemImageNamed:@"ant.circle"];
        v143 = [v142 imageWithRenderingMode:2];

        v144 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithImage:v143 style:0 target:self action:sel__reportRadar];
        v145 = [MEMORY[0x1E4FB1618] purpleColor];
        [v144 setTintColor:v145];

        v146 = [(PKPaymentTransactionDetailViewController *)self navigationItem];
        [v146 setRightBarButtonItem:v144];
      }
      v147 = [(PKPaymentTransactionDetailViewController *)self view];
      [v147 setNeedsLayout];

      return;
    default:
      goto LABEL_47;
  }
}

void __66__PKPaymentTransactionDetailViewController__reloadTableHeaderView__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__PKPaymentTransactionDetailViewController__reloadTableHeaderView__block_invoke_2;
    block[3] = &unk_1E59CA7D0;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __66__PKPaymentTransactionDetailViewController__reloadTableHeaderView__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadTableHeaderView];
}

void __66__PKPaymentTransactionDetailViewController__reloadTableHeaderView__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__PKPaymentTransactionDetailViewController__reloadTableHeaderView__block_invoke_4;
  v5[3] = &unk_1E59CA870;
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __66__PKPaymentTransactionDetailViewController__reloadTableHeaderView__block_invoke_4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1432) setMerchantIcon:*(void *)(a1 + 40)];
}

- (void)_reportRadar
{
  v17[1] = *MEMORY[0x1E4F143B8];
  if (os_variant_has_internal_ui())
  {
    if ([(PKPaymentTransaction *)self->_transaction isBankConnectTransaction])
    {
      id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v4 = NSString;
      uint64_t v5 = [(PKPaymentTransaction *)self->_transaction identifier];
      id v6 = [v4 stringWithFormat:@"transaction_%@.txt", v5];

      uint64_t v7 = [v3 temporaryDirectory];
      id v8 = [v7 URLByAppendingPathComponent:v6];

      id v9 = (void *)MEMORY[0x1E4F28D90];
      uint64_t v10 = [(PKPaymentTransaction *)self->_transaction dictionaryRepresentation];
      uint64_t v11 = [v9 dataWithJSONObject:v10 options:0 error:0];

      uint64_t v12 = [v8 path];
      [v3 createFileAtPath:v12 contents:v11 attributes:0];

      uint64_t v13 = [v8 path];
      v17[0] = v13;
      id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
      uint64_t v15 = PKCreateTapToRadarURL();

      id v16 = [MEMORY[0x1E4FB1438] sharedApplication];
      [v16 openURL:v15 options:MEMORY[0x1E4F1CC08] completionHandler:0];
    }
  }
}

- (id)formattedBalanceAdjustmentAmountWithTransitDescriptors
{
  id v3 = [(PKPaymentTransaction *)self->_transaction amount];
  transaction = self->_transaction;
  if (!v3)
  {
    id v8 = [(PKPaymentTransaction *)transaction amounts];
    if (v8)
    {
    }
    else
    {
      id v9 = [(PKPaymentTransaction *)self->_transaction plans];

      if (!v9) {
        goto LABEL_10;
      }
    }
    id v9 = [(PKPaymentTransaction *)self->_transaction formattedStringForMultipleAmountsForPass:self->_paymentPass];
    goto LABEL_10;
  }
  uint64_t v5 = [(PKPaymentTransaction *)transaction formattedBalanceAdjustmentSubtotalAmount];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(PKPaymentTransaction *)self->_transaction formattedBalanceAdjustmentAmount];
  }
  id v9 = v7;

LABEL_10:
  if ([(PKPaymentTransaction *)self->_transaction isZeroTransaction])
  {
    uint64_t v10 = [(PKPaymentTransaction *)self->_transaction plans];
    uint64_t v11 = [v10 count];

    if (!v11)
    {
      uint64_t v12 = [MEMORY[0x1E4F28C28] zero];

      id v3 = (void *)v12;
    }
  }
  uint64_t v13 = [(PKPaymentTransaction *)self->_transaction transitType];
  id v14 = [MEMORY[0x1E4F28C28] zero];
  int v15 = [v3 isEqualToNumber:v14];

  if (!v15
    || (([(PKPaymentTransaction *)self->_transaction enRoute] & 1) == 0
      ? (([(PKPaymentTransaction *)self->_transaction transitModifiers] & 1) != 0
       ? (id v16 = @"TRANSIT_TRANSACTION_ANNOTATION_COMMUTE_DISCOUNT")
       : v13 != 1025
       ? ([(PKPaymentTransaction *)self->_transaction transactionStatus]
        ? (id v16 = @"TRANSIT_TRANSACTION_FARE_FREE")
        : (id v16 = @"TRANSIT_TRANSACTION_PENDING"))
       : (id v16 = @"TRANSIT_TRANSACTION_REDEEMED"))
      : (id v16 = @"TRANSIT_TRANSACTION_EN_ROUTE"),
        PKLocalizedPaymentString(&v16->isa),
        (id v17 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v17 = v9;
  }
  id v18 = v17;

  return v18;
}

- (void)_handleTransactionHeaderTapRecognizer:(id)a3
{
  self->_showRawName ^= 1u;
  [(PKPaymentTransactionDetailViewController *)self _reloadTableHeaderView];
}

- (void)_updateTableHeaderHeight
{
  if (self->_headerView)
  {
    id v14 = [(PKPaymentTransactionDetailViewController *)self tableView];
    [v14 bounds];
    double v4 = v3;
    [(PKPaymentTransactionDetailHeaderView *)self->_headerView frame];
    double v6 = v5;
    double v8 = v7;
    -[PKPaymentTransactionDetailHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v4, 1.79769313e308);
    if (v6 != v10 || v8 != v9)
    {
      double v12 = v9;
      headerView = self->_headerView;
      [v14 _rectForTableHeaderView];
      -[PKPaymentTransactionDetailHeaderView setFrame:](headerView, "setFrame:");
      [v14 _tableHeaderHeightDidChangeToHeight:v12];
    }
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  switch([(PKSectionTableViewController *)self sectionForIndex:a4])
  {
    case 0uLL:
    case 4uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 16uLL:
    case 21uLL:
    case 22uLL:
    case 24uLL:
      return 1;
    case 1uLL:
    case 2uLL:
    case 23uLL:
      return 2;
    case 3uLL:
      return [(PKPaymentTransactionDetailViewController *)self _numberOfAmountDetailsRows];
    case 5uLL:
      return [(PKPaymentTransactionDetailViewController *)self _numberOfDataReleaseRows];
    case 6uLL:
      return [(PKPaymentTransactionDetailViewController *)self _numberOfRecognitionHintsRows];
    case 10uLL:
      uint64_t v7 = 1144;
      goto LABEL_23;
    case 11uLL:
      double v8 = [(PKPaymentTransaction *)self->_transaction associatedFinancingPlan];
      goto LABEL_31;
    case 12uLL:
      if (![(PKPaymentTransaction *)self->_transaction isIssuerInstallmentTransaction])return 0; {
      double v8 = [(PKPaymentTransaction *)self->_transaction issuerInstallmentManagementURL];
      }
      goto LABEL_31;
    case 13uLL:
      if (PKHideCardBenefitRewards()) {
        return 0;
      }
      double v8 = [(PKPaymentTransaction *)self->_transaction paymentRewardsRedemption];
LABEL_31:
      int64_t v5 = v8 != 0;

      return v5;
    case 14uLL:
      if (PKHideCardBenefitRewards()) {
        return 0;
      }
      double v9 = [(PKPaymentTransaction *)self->_transaction paymentRewardsRedemption];
      double v10 = [v9 statusLink];
      int64_t v5 = v10 != 0;

      return v5;
    case 15uLL:
      uint64_t v11 = [(PKPaymentTransaction *)self->_transaction awards];
      uint64_t v12 = [v11 count];

      return v12 + self->_issuerAppDeepLinkingEnabled;
    case 17uLL:
      uint64_t v7 = 1296;
      goto LABEL_23;
    case 18uLL:
      uint64_t v7 = 1304;
      goto LABEL_23;
    case 19uLL:
      uint64_t v7 = 1288;
LABEL_23:
      uint64_t v13 = *(Class *)((char *)&self->super.super.super.super.super.isa + v7);
      return [v13 count];
    case 20uLL:
      return [(PKPaymentTransactionDetailViewController *)self _numberOfActionRowsEnabled];
    default:
      return 0;
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  switch(-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", [v7 section]))
  {
    case 0uLL:
      uint64_t v8 = [(PKPaymentTransactionDetailViewController *)self _questionCellForTableView:v6 atIndexPath:v7];
      goto LABEL_29;
    case 1uLL:
      uint64_t v8 = [(PKPaymentTransactionDetailViewController *)self _disputeStatusCellForTableView:v6 atIndexPath:v7];
      goto LABEL_29;
    case 2uLL:
      uint64_t v8 = [(PKPaymentTransactionDetailViewController *)self _expiredPhysicalCardCellForTableView:v6 atIndexPath:v7];
      goto LABEL_29;
    case 3uLL:
      uint64_t v8 = [(PKPaymentTransactionDetailViewController *)self _amountDetailsCellForTableView:v6 atIndexPath:v7];
      goto LABEL_29;
    case 4uLL:
      uint64_t v8 = [(PKPaymentTransactionDetailViewController *)self _fraudRiskCellForTableView:v6];
      goto LABEL_29;
    case 5uLL:
      uint64_t v8 = [(PKPaymentTransactionDetailViewController *)self _releasedDataCellForTableView:v6 atIndexPath:v7];
      goto LABEL_29;
    case 6uLL:
      uint64_t v8 = [(PKPaymentTransactionDetailViewController *)self _recognitionHintsCellForTableView:v6 atIndexPath:v7];
      goto LABEL_29;
    case 7uLL:
      uint64_t v8 = [(PKPaymentTransactionDetailViewController *)self _merchantAddressCellForTableView:v6];
      goto LABEL_29;
    case 8uLL:
      double v9 = [v6 dequeueReusableCellWithIdentifier:@"PKPaymentTransactionDefaultCellReuseIdentifier"];
      double v10 = [v9 textLabel];
      uint64_t v11 = [(PKPaymentTransaction *)self->_transaction merchant];
      uint64_t v12 = [v11 originURL];
      uint64_t v13 = [v12 absoluteString];
      [v10 setText:v13];

      [v9 setAccessoryType:1];
      break;
    case 9uLL:
      transactionSourceCollection = self->_transactionSourceCollection;
      int v15 = self->_associatedTransaction;
      id v16 = [(PKPaymentTransaction *)v15 transactionSourceIdentifier];
      id v17 = [(PKTransactionSourceCollection *)transactionSourceCollection transactionSourceForTransactionSourceIdentifier:v16];

      id v18 = [(PKFamilyMemberCollection *)self->_familyCollection familyMemberForTransactionSource:v17];
      double v9 = [v6 dequeueReusableCellWithIdentifier:@"PKPaymentTransactionTransactionCellReuseIdentifier" forIndexPath:v7];
      [(PKPaymentTransactionCellController *)self->_transactionCellController configureCell:v9 forTransaction:v15 transactionSource:v17 familyMember:v18 account:self->_account detailStyle:0 deviceName:0 avatarViewDelegate:0];

      break;
    case 10uLL:
      uint64_t v8 = [(PKPaymentTransactionDetailViewController *)self _associatedInstallmentCellForTableView:v6 atIndexPath:v7];
      goto LABEL_29;
    case 11uLL:
      uint64_t v8 = [(PKPaymentTransactionDetailViewController *)self _associatedFinancingPlanCellForTableView:v6 atIndexPath:v7];
      goto LABEL_29;
    case 12uLL:
      double v9 = [(PKPaymentTransactionDetailViewController *)self _tableView:v6 actionButtonCellForSection:21];
      uint64_t v19 = [v9 textLabel];
      uint64_t v20 = PKLocalizedPaymentOffersString(&cfstr_ViewPayLaterDe.isa);
      goto LABEL_25;
    case 13uLL:
      uint64_t v8 = [(PKPaymentTransactionDetailViewController *)self _tableViewCellPaymentRewardsRedemptionInfoForTableView:v6 atIndexPath:v7];
      goto LABEL_29;
    case 14uLL:
      double v9 = [(PKPaymentTransactionDetailViewController *)self _tableView:v6 actionButtonCellForSection:14];
      id v21 = [v9 textLabel];
      v22 = PKLocalizedPayWithPointsString(&cfstr_TransactionDet_3.isa);
      [v21 setText:v22];

      [v9 setAccessibilityIdentifier:*MEMORY[0x1E4F858E8]];
      break;
    case 15uLL:
      uint64_t v8 = -[PKPaymentTransactionDetailViewController _tableView:cellForAwardAtIndex:](self, "_tableView:cellForAwardAtIndex:", v6, [v7 row]);
      goto LABEL_29;
    case 16uLL:
      uint64_t v8 = [(PKPaymentTransactionDetailViewController *)self _merchantTokenManagementCellForTableView:v6];
      goto LABEL_29;
    case 17uLL:
      uint64_t v8 = [(PKPaymentTransactionDetailViewController *)self _applePayBarcodeRowCellForTableView:v6 atIndexPath:v7];
      goto LABEL_29;
    case 18uLL:
      uint64_t v8 = [(PKPaymentTransactionDetailViewController *)self _applePayReceiptRowCellForTableView:v6 atIndexPath:v7];
      goto LABEL_29;
    case 19uLL:
      uint64_t v8 = [(PKPaymentTransactionDetailViewController *)self _applePayOrderRowCellForTableView:v6 atIndexPath:v7];
      goto LABEL_29;
    case 20uLL:
      uint64_t v8 = -[PKPaymentTransactionDetailViewController _tableView:cellForActionAtIndex:](self, "_tableView:cellForActionAtIndex:", v6, [v7 row]);
      goto LABEL_29;
    case 21uLL:
      double v9 = [(PKPaymentTransactionDetailViewController *)self _tableView:v6 actionButtonCellForSection:21];
      uint64_t v19 = [v9 textLabel];
      uint64_t v20 = PKLocalizedPaymentString(&cfstr_TransactionDet_73.isa);
LABEL_25:
      v23 = (void *)v20;
      [v19 setText:v20];

      break;
    case 22uLL:
      uint64_t v8 = [(PKPaymentTransactionDetailViewController *)self _transactionIdentifierCellForTableView:v6];
      goto LABEL_29;
    case 23uLL:
      uint64_t v8 = [(PKPaymentTransactionDetailViewController *)self _debugDetailCellForTableView:v6 atIndexPath:v7];
      goto LABEL_29;
    case 24uLL:
      uint64_t v8 = [(PKPaymentTransactionDetailViewController *)self _tableViewCellForDeleteTransaction:v6];
LABEL_29:
      double v9 = (void *)v8;
      break;
    default:
      double v9 = 0;
      break;
  }
  if (self->_detailViewStyle == 2)
  {
    id v24 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    v25 = objc_msgSend(v24, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    uint64_t v26 = PKBridgeAppearanceGetAppearanceSpecifier();
    uint64_t v27 = [v26 tableViewCellHighlightColor];
    [v25 setBackgroundColor:v27];

    [v9 setSelectedBackgroundView:v25];
  }
  else
  {
    [v9 setSelectedBackgroundView:0];
  }

  return v9;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  if (-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", [v9 section]) == 3) {
    [(PKPaymentTransactionDetailViewController *)self _tableView:v10 willDisplayAmountDetailsCell:v8 atIndexPath:v9];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 deselectRowAtIndexPath:v7 animated:1];
  switch(-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", [v7 section]))
  {
    case 1uLL:
      if ([v7 row] == 1)
      {
        if ([(PKPaymentTransaction *)self->_transaction disputeStatus] != 7
          || ([(PKPaymentTransaction *)self->_transaction disputeStatusDetails],
              id v8 = objc_claimAutoreleasedReturnValue(),
              [v8 statusReasons],
              id v9 = objc_claimAutoreleasedReturnValue(),
              char v10 = [v9 containsObject:@"decisioned"],
              v9,
              v8,
              (v10 & 1) != 0))
        {
          uint64_t v11 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://support.apple.com/en-us/HT212270"];
          uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F3AEB8]) initWithURL:v11];
          [v12 setModalPresentationStyle:2];
          goto LABEL_10;
        }
        if (+[PKBusinessChatController deviceSupportsBusinessChat])
        {
          uint64_t v11 = [(PKPaymentTransactionDetailViewController *)self _businessChatContextForUnavailableDisputeStatus];
          [(PKPaymentTransactionDetailViewController *)self _openBusinessChatControllerForContext:v11];
          break;
        }
        [(PKPaymentTransactionDetailViewController *)self _presentContactViewController];
      }
      goto LABEL_40;
    case 2uLL:
      if ([v7 row] == 1)
      {
        objc_initWeak(&location, self);
        physicalCardController = self->_physicalCardController;
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __78__PKPaymentTransactionDetailViewController_tableView_didSelectRowAtIndexPath___block_invoke;
        v34[3] = &unk_1E59DF620;
        objc_copyWeak(&v35, &location);
        [(PKPhysicalCardController *)physicalCardController replaceFlowViewControllerForReason:1 content:0 currentPhysicalCard:0 completion:v34];
        objc_destroyWeak(&v35);
        objc_destroyWeak(&location);
      }
      goto LABEL_40;
    case 7uLL:
      [(PKPaymentTransactionDetailViewController *)self _tableView:v6 didSelectMechantAddressAtIndexPath:v7];
      goto LABEL_40;
    case 8uLL:
      id v18 = [(PKPaymentTransaction *)self->_transaction merchant];
      uint64_t v19 = [v18 originURL];

      if (v19)
      {
        uint64_t v20 = [v19 scheme];

        if (!v20)
        {
          id v21 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v19 resolvingAgainstBaseURL:0];
          [v21 setScheme:@"https"];
          uint64_t v22 = [v21 URL];

          uint64_t v19 = (void *)v22;
        }
        v23 = [MEMORY[0x1E4F223E0] defaultWorkspace];
        [v23 openURL:v19 configuration:0 completionHandler:0];

        goto LABEL_29;
      }
      goto LABEL_40;
    case 9uLL:
      uint64_t v11 = self->_associatedTransaction;
      uint64_t v12 = [(PKPaymentTransaction *)v11 recurringPeerPayment];
      if (v12)
      {
        [(PKPaymentTransactionDetailViewController *)self _presentRecurringPeerPayment:v12];
      }
      else
      {
        LOBYTE(v33) = 0;
        uint64_t v31 = [[PKPaymentTransactionDetailViewController alloc] initWithTransaction:v11 transactionSourceCollection:self->_transactionSourceCollection familyCollection:self->_familyCollection account:self->_account accountUserCollection:self->_accountUserCollection bankConnectInstitution:self->_bankConnectInstitution physicalCards:self->_physicalCards contactResolver:self->_contactResolver peerPaymentWebService:self->_peerPaymentWebService paymentServiceDataProvider:self->_paymentServiceDataProvider detailViewStyle:self->_detailViewStyle allowTransactionLinks:v33];
        v32 = [(PKPaymentTransactionDetailViewController *)self navigationController];
        [v32 pushViewController:v31 animated:1];
      }
      goto LABEL_38;
    case 10uLL:
      -[NSArray objectAtIndex:](self->_associatedInstallmentPlans, "objectAtIndex:", [v7 row]);
      uint64_t v11 = (PKPaymentTransaction *)objc_claimAutoreleasedReturnValue();
      [(PKPaymentTransactionDetailViewController *)self _showInstallmentDetailsForAssociatedInstallment:v11];
      break;
    case 11uLL:
      [(PKPaymentTransactionDetailViewController *)self _showAssociatedFinancingPlanDetailsForIndexPath:v7];
      goto LABEL_40;
    case 12uLL:
      uint64_t v24 = [(PKPaymentTransaction *)self->_transaction issuerInstallmentManagementURL];
      goto LABEL_22;
    case 14uLL:
      if (PKHideCardBenefitRewards()) {
        goto LABEL_40;
      }
      v25 = [(PKPaymentTransaction *)self->_transaction paymentRewardsRedemption];
      uint64_t v11 = [v25 statusLink];

      if (!v11)
      {
        uint64_t v24 = [(PKPaymentRewardsBalance *)self->_associatedPaymentRewardsBalance programURL];
LABEL_22:
        uint64_t v11 = (PKPaymentTransaction *)v24;
      }
      [(PKPaymentTransactionDetailViewController *)self _openURL:v11];
      break;
    case 15uLL:
      unint64_t v26 = [v7 row];
      uint64_t v27 = [(PKPaymentTransaction *)self->_transaction awards];
      unint64_t v28 = [v27 count];

      if (v26 >= v28)
      {
        uint64_t v11 = 0;
      }
      else
      {
        uint64_t v29 = [(PKPaymentTransaction *)self->_transaction awards];
        uint64_t v11 = [v29 objectAtIndex:v26];
      }
      [(PKPaymentTransactionDetailViewController *)self _openOfferDetailsInIssuerApp:v11];
      break;
    case 16uLL:
      [(PKPaymentTransactionDetailViewController *)self _didSelectMerchantTokenManagement];
      goto LABEL_40;
    case 18uLL:
      uint64_t v19 = -[NSArray objectAtIndexedSubscript:](self->_applePayReceiptRowViewModels, "objectAtIndexedSubscript:", [v7 row]);
      [v19 didSelectCell];
LABEL_29:

      goto LABEL_40;
    case 19uLL:
      -[NSArray objectAtIndexedSubscript:](self->_applePayOrderRowViewModels, "objectAtIndexedSubscript:", [v7 row]);
      uint64_t v11 = (PKPaymentTransaction *)objc_claimAutoreleasedReturnValue();
      Class FKOrderDetailsViewControllerProviderClass = getFKOrderDetailsViewControllerProviderClass();
      id v14 = [(PKPaymentTransaction *)v11 orderTypeIdentifier];
      int v15 = [(PKPaymentTransaction *)v11 orderIdentifier];
      id v16 = [(PKPaymentTransaction *)v11 fulfillmentIdentifier];
      uint64_t v12 = [(objc_class *)FKOrderDetailsViewControllerProviderClass makeViewControllerWithOrderTypeIdentifier:v14 orderIdentifier:v15 fulfillmentIdentifier:v16];

LABEL_10:
      [(PKPaymentTransactionDetailViewController *)self presentViewController:v12 animated:1 completion:0];
LABEL_38:

      break;
    case 20uLL:
      [(PKPaymentTransactionDetailViewController *)self _tableView:v6 didSelectActionAtIndexPath:v7];
      goto LABEL_40;
    case 21uLL:
      [(PKPaymentTransactionDetailViewController *)self _presentReportIssue];
      goto LABEL_40;
    case 23uLL:
      if ([v7 row] != 1) {
        goto LABEL_40;
      }
      uint64_t v11 = [[PKTransactionDebugDetailsTabBarController alloc] initWithTransaction:self->_transaction transactionSourceCollection:self->_transactionSourceCollection];
      v30 = [(PKPaymentTransactionDetailViewController *)self navigationController];
      [v30 pushViewController:v11 animated:1];

      break;
    case 24uLL:
      if (self->_deleteOverrider) {
        [(PKPaymentTransactionDetailViewController *)self _performDeleteOverride];
      }
      else {
        [(PKPaymentTransactionDetailViewController *)self _showDeleteConfirmationSheet];
      }
      goto LABEL_40;
    default:
      goto LABEL_40;
  }

LABEL_40:
}

void __78__PKPaymentTransactionDetailViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v8)
    {
      id v7 = [[PKNavigationController alloc] initWithRootViewController:v8];
      [(PKNavigationController *)v7 setModalPresentationStyle:2];
    }
    else
    {
      if (!v5) {
        goto LABEL_7;
      }
      id v7 = (PKNavigationController *)PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);
    }
    [WeakRetained presentViewController:v7 animated:1 completion:0];
  }
LABEL_7:
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  unint64_t v5 = [(PKSectionTableViewController *)self sectionForIndex:a4];
  id v6 = 0;
  switch(v5)
  {
    case 6uLL:
      id v7 = @"TRANSACTION_SHOWN_ON_STATEMENT_AS_TITLE";
      goto LABEL_5;
    case 9uLL:
      if ([(PKPaymentTransaction *)self->_associatedTransaction transactionType] == 1)
      {
        id v7 = @"TRANSACTION_ASSOCIATED_REFUND_TITLE";
LABEL_5:
        PKLocalizedPaymentString(&v7->isa);
        id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        char v10 = [(PKPaymentTransaction *)self->_transaction recurringPeerPayment];

        if (v10)
        {
LABEL_15:
          id v6 = 0;
        }
        else
        {
          [(PKPaymentTransaction *)self->_transaction featureIdentifier];
          PKLocalizedFeatureString();
          id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      break;
    case 0xAuLL:
      PKLocalizedBeekmanString(&cfstr_InstallmentPla_0.isa);
      id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 0xBuLL:
      PKLocalizedCocoonString(&cfstr_PurchaseHeader.isa);
      id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 0xDuLL:
      if (PKHideCardBenefitRewards()) {
        goto LABEL_15;
      }
      PKLocalizedPayWithPointsString(&cfstr_TransactionDet_74.isa);
      id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 0xFuLL:
      id v8 = [(PKPaymentTransaction *)self->_transaction awards];
      uint64_t v9 = [v8 count];

      if (!v9) {
        goto LABEL_15;
      }
      PKLocalizedAquamanString(&cfstr_OffersTitle.isa);
      id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 0x13uLL:
      PKLocalizedOrderManagementString(&cfstr_TransactionOrd.isa);
      id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 0x17uLL:
      id v6 = @"Debug";
      break;
    default:
      break;
  }

  return v6;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  unint64_t v5 = [(PKSectionTableViewController *)self sectionForIndex:a4];
  id v6 = 0;
  switch(v5)
  {
    case 3uLL:
      associatedTransaction = self->_associatedTransaction;
      if (associatedTransaction)
      {
        uint64_t v8 = [(PKPaymentTransaction *)associatedTransaction transactionType];
        uint64_t v9 = self->_associatedTransaction;
        if (v8 == 1)
        {
          char v10 = [(PKPaymentTransaction *)v9 merchant];
          uint64_t v11 = [v10 displayName];
          id v6 = PKLocalizedPaymentString(&cfstr_TransactionAss_1.isa, &stru_1EF1B4C70.isa, v11);
        }
        else
        {
          uint64_t v20 = [(PKPaymentTransaction *)v9 transfers];
          char v10 = [v20 firstObject];

          if (!v10)
          {
            if ([(PKPaymentTransaction *)self->_transaction featureIdentifier] == 2)
            {
              [(PKPaymentTransaction *)self->_transaction featureIdentifier];
              id v6 = PKLocalizedFeatureString();
              char v10 = 0;
            }
            else
            {
              char v10 = 0;
              id v6 = 0;
            }
LABEL_45:

            if ([(PKPaymentPass *)self->_paymentPass isAppleCardPass]
              && [(PKPaymentTransactionDetailViewController *)self _canShowAppleCardSupportFooterInAmountDetailsSection])
            {
              BOOL v32 = +[PKBusinessChatController deviceSupportsBusinessChat];
              uint64_t v33 = [(PKPaymentPass *)self->_paymentPass localizedValueForFieldKey:*MEMORY[0x1E4F87A58]];
              id v14 = v33;
              if (!v32 && [v33 length])
              {
                uint64_t v34 = PKLocalizedFeatureString();
                if (objc_msgSend(v6, "length", v14))
                {
                  id v35 = [NSString stringWithFormat:@"%@\n\n%@", v6, v34];
                }
                else
                {
                  id v35 = v34;
                }
                id v39 = v35;

                id v6 = v39;
              }
LABEL_23:

              goto LABEL_60;
            }
            goto LABEL_60;
          }
          uint64_t v11 = [v10 externalAccount];
          id v21 = [v11 fundingDetails];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            v23 = [v11 fundingDetails];
            uint64_t v24 = [v23 name];
          }
          else
          {
            uint64_t v24 = 0;
          }
          if ([v24 length])
          {
            [(PKPaymentTransaction *)self->_transaction featureIdentifier];
            id v6 = PKLocalizedFeatureString();
          }
          else
          {
            id v6 = 0;
          }
        }
        goto LABEL_45;
      }
      if ([(PKPaymentTransactionDetailViewController *)self _isPeerPaymentPendingRequestTransaction])
      {
        uint64_t v13 = @"TRANSACTION_DETAIL_PENDING_REQUEST_FOOTER_TEXT";
        goto LABEL_9;
      }
      v25 = [(PKPaymentTransaction *)self->_transaction transfers];
      unint64_t v26 = [v25 firstObject];

      if (v26)
      {
        uint64_t v27 = [(PKPaymentTransaction *)self->_transaction transactionType];
        unint64_t v28 = [(PKPaymentTransaction *)self->_transaction transfers];
        id v17 = [v28 firstObject];

        unint64_t v29 = [(PKPaymentTransaction *)self->_transaction transactionStatus];
        v30 = [v17 externalAccount];
        if ([v30 type] != 1)
        {

          goto LABEL_58;
        }
        uint64_t v31 = [(PKPaymentTransaction *)self->_transaction featureIdentifier];

        if (v31 != 5) {
          goto LABEL_58;
        }
        if (v27 == 6)
        {
          if (v29 > 1) {
            goto LABEL_58;
          }
        }
        else if (v27 != 5 || (([v17 fundsAreAvailable] & 1) != 0 || v29 > 1) && v29 != 1)
        {
LABEL_58:
          id v6 = 0;
LABEL_59:

          goto LABEL_60;
        }
        uint64_t v18 = PKLocalizedFeatureString();
        goto LABEL_16;
      }
      if ([(PKPaymentPass *)self->_paymentPass isAppleCardPass]
        && [(PKPaymentTransactionDetailViewController *)self _canShowAppleCardSupportFooterInAmountDetailsSection])
      {
        BOOL v36 = +[PKBusinessChatController deviceSupportsBusinessChat];
        v37 = [(PKPaymentPass *)self->_paymentPass localizedValueForFieldKey:*MEMORY[0x1E4F87A58]];
        id v14 = v37;
        if (!v36 && [v37 length])
        {
          uint64_t v19 = PKLocalizedFeatureString();
          goto LABEL_22;
        }
        id v6 = 0;
        goto LABEL_23;
      }
LABEL_56:
      id v6 = 0;
LABEL_60:
      return v6;
    case 4uLL:
      uint64_t v13 = @"TRANSACTION_DETAIL_FRAUD_RISK_FOOTER_TEXT";
LABEL_9:
      uint64_t v12 = PKLocalizedPeerPaymentString(&v13->isa);
      goto LABEL_19;
    case 5uLL:
      if ([(PKPaymentTransaction *)self->_transaction transactionSource] != 2) {
        goto LABEL_56;
      }
      id v14 = [(PKPaymentTransaction *)self->_transaction releasedData];
      int v15 = [v14 application];
      id v6 = [v15 usageDescription];

      goto LABEL_23;
    case 6uLL:
      BOOL v16 = +[PKBusinessChatController deviceSupportsBusinessChat];
      id v17 = [(PKPaymentPass *)self->_paymentPass localizedValueForFieldKey:*MEMORY[0x1E4F87A58]];
      if (![(PKPaymentPass *)self->_paymentPass isAppleCardPass]
        || !-[PKPaymentTransactionDetailViewController _canShowAppleCardSupportFooterInRecognitionHintsSection](self, "_canShowAppleCardSupportFooterInRecognitionHintsSection")|| v16|| ![v17 length])
      {
        goto LABEL_58;
      }
      uint64_t v18 = PKLocalizedFeatureString();
LABEL_16:
      id v6 = (void *)v18;
      goto LABEL_59;
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
      goto LABEL_60;
    case 0xEuLL:
      if (PKHideCardBenefitRewards()) {
        goto LABEL_56;
      }
      uint64_t v12 = PKLocalizedPayWithPointsString(&cfstr_TransactionDet_2.isa);
      goto LABEL_19;
    default:
      if (v5 != 20)
      {
        if (v5 == 21)
        {
          uint64_t v12 = PKLocalizedPaymentString(&cfstr_TransactionDet_78.isa);
LABEL_19:
          id v6 = (void *)v12;
        }
        goto LABEL_60;
      }
      if (![(PKPaymentTransactionDetailViewController *)self _actionRowIsEnabled:10]) {
        goto LABEL_56;
      }
      id v14 = [(PKPaymentPass *)self->_paymentPass organizationName];
      uint64_t v19 = PKLocalizedPaymentString(&cfstr_TransactionDet_79.isa, &stru_1EF1B4C70.isa, v14);
LABEL_22:
      id v6 = (void *)v19;
      goto LABEL_23;
  }
}

- (id)_coarseLocationHyperlinkFooterView
{
  double v3 = PKLocalizedPaymentString(&cfstr_CoarseLocation_0.isa);
  double v4 = PKLocalizedPaymentString(&cfstr_CoarseLocation.isa);
  unint64_t v5 = PKStringWithValidatedFormat();
  uint64_t v6 = objc_msgSend(v5, "rangeOfString:", v4, v4);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v9 = v6;
    uint64_t v10 = v7;
    uint64_t v8 = objc_alloc_init(PKFooterHyperlinkView);
    uint64_t v11 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=Privacy&path=LOCATION"];
    uint64_t v12 = PKAttributedStringByAddingLinkToRange(v5, v9, v10, v11);
    [(PKFooterHyperlinkView *)v8 setAttributedText:v12];

    id v13 = &__block_literal_global_47;
    [(PKFooterHyperlinkView *)v8 setAction:&__block_literal_global_47];

    if (self->_detailViewStyle == 2)
    {
      id v14 = PKBridgeAppearanceGetAppearanceSpecifier();
      int v15 = [v14 footerHyperlinkColor];
      [(PKFooterHyperlinkView *)v8 setLinkTextColor:v15];
    }
  }

  return v8;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  if ([(PKSectionTableViewController *)self sectionForIndex:a4] == 7
    && [(PKCoarseLocationMonitor *)self->_coarseLocationMonitor coarseLocationEnabled])
  {
    uint64_t v7 = [(PKPaymentTransactionDetailViewController *)self _coarseLocationHyperlinkFooterView];
  }
  else
  {
    uint64_t v8 = [(PKPaymentTransactionDetailViewController *)self tableView:v6 titleForFooterInSection:a4];
    if ([v8 length])
    {
      uint64_t v7 = 0;
    }
    else
    {
      id v9 = objc_alloc(MEMORY[0x1E4FB1EB0]);
      uint64_t v7 = objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    }
  }

  return v7;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  if ([(PKSectionTableViewController *)self sectionForIndex:a4] == 7
    && [(PKCoarseLocationMonitor *)self->_coarseLocationMonitor coarseLocationEnabled])
  {
    double v7 = *MEMORY[0x1E4FB2F28];
  }
  else
  {
    uint64_t v8 = [(PKPaymentTransactionDetailViewController *)self tableView:v6 titleForFooterInSection:a4];
    if ([v8 length]) {
      double v7 = *MEMORY[0x1E4FB2F28];
    }
    else {
      double v7 = 0.0;
    }
  }
  return v7;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  double v4 = [(PKPaymentTransactionDetailViewController *)self tableView:a3 titleForHeaderInSection:a4];
  if ([v4 length])
  {
    unint64_t v5 = 0;
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    unint64_t v5 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  }

  return v5;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double v4 = [(PKPaymentTransactionDetailViewController *)self tableView:a3 titleForHeaderInSection:a4];
  if ([v4 length]) {
    double v5 = *MEMORY[0x1E4FB2F28];
  }
  else {
    double v5 = 16.0;
  }

  return v5;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5 = a4;
  BOOL v6 = 0;
  switch(-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", [v5 section]))
  {
    case 1uLL:
    case 2uLL:
      BOOL v6 = [v5 row] == 1;
      break;
    case 7uLL:
      id v9 = [(PKPaymentTransaction *)self->_transaction merchant];
      if ([v9 useRawMerchantData])
      {
        BOOL v6 = 0;
      }
      else
      {
        uint64_t v10 = [v9 mapsMerchant];
        BOOL v6 = [v10 identifier] != 0;
      }
      break;
    case 8uLL:
    case 9uLL:
    case 10uLL:
    case 11uLL:
    case 12uLL:
    case 14uLL:
    case 18uLL:
    case 19uLL:
    case 21uLL:
    case 23uLL:
    case 24uLL:
      BOOL v6 = 1;
      break;
    case 15uLL:
      BOOL v8 = !self->_issuerAppDeepLinkingEnabled;
      goto LABEL_7;
    case 16uLL:
      BOOL v8 = self->_merchantTokenResponse == 0;
LABEL_7:
      BOOL v6 = !v8;
      break;
    case 20uLL:
      BOOL v6 = -[PKPaymentTransactionDetailViewController _shouldHighlightAction:](self, "_shouldHighlightAction:", -[PKPaymentTransactionDetailViewController _actionRowForRowIndex:](self, "_actionRowForRowIndex:", [v5 row]));
      break;
    default:
      break;
  }

  return v6;
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  if (-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", objc_msgSend(a4, "section", a3, a5.x, a5.y)) == 22)
  {
    BOOL v6 = [(PKPaymentTransactionDetailViewController *)self contextMenuConfigurationForTransactionIdentifier];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)contextMenuConfigurationForTransactionIdentifier
{
  double v3 = [(PKPaymentTransactionDetailViewController *)self _transactionIdentifierDescription];
  double v4 = [(PKPaymentTransactionDetailViewController *)self contextMenuConfigurationForCopyingText:v3];

  return v4;
}

- (id)contextMenuConfigurationForCopyingText:(id)a3
{
  id v3 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__PKPaymentTransactionDetailViewController_contextMenuConfigurationForCopyingText___block_invoke;
  aBlock[3] = &unk_1E59D5228;
  id v9 = v3;
  id v4 = v3;
  id v5 = _Block_copy(aBlock);
  BOOL v6 = [MEMORY[0x1E4FB1678] configurationWithIdentifier:0 previewProvider:0 actionProvider:v5];

  return v6;
}

id __83__PKPaymentTransactionDetailViewController_contextMenuConfigurationForCopyingText___block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FB13F0];
    id v3 = PKLocalizedString(&cfstr_MenuActionCopy.isa);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __83__PKPaymentTransactionDetailViewController_contextMenuConfigurationForCopyingText___block_invoke_2;
    v9[3] = &unk_1E59D5200;
    id v10 = *(id *)(a1 + 32);
    id v4 = [v2 actionWithTitle:v3 image:0 identifier:0 handler:v9];

    id v5 = (void *)MEMORY[0x1E4FB1970];
    v11[0] = v4;
    BOOL v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    double v7 = [v5 menuWithTitle:&stru_1EF1B5B50 children:v6];
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

void __83__PKPaymentTransactionDetailViewController_contextMenuConfigurationForCopyingText___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  [v2 setString:*(void *)(a1 + 32)];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentTransactionDetailViewController;
  [(PKPaymentTransactionDetailViewController *)&v9 traitCollectionDidChange:v4];
  if (v4)
  {
    id v5 = [(PKPaymentTransactionDetailViewController *)self traitCollection];
    BOOL v6 = [v5 preferredContentSizeCategory];
    double v7 = [v4 preferredContentSizeCategory];
    NSComparisonResult v8 = UIContentSizeCategoryCompareToCategory(v6, v7);

    if (v8) {
      [(PKPaymentTransactionDetailViewController *)self _reloadTableHeaderView];
    }
  }
}

- (id)_peerPaymentController
{
  lazyPeerPaymentController = self->_lazyPeerPaymentController;
  if (!lazyPeerPaymentController)
  {
    id v4 = (PKPeerPaymentController *)[objc_alloc(MEMORY[0x1E4F84D80]) initWithPeerPaymentWebService:self->_peerPaymentWebService];
    id v5 = self->_lazyPeerPaymentController;
    self->_lazyPeerPaymentController = v4;

    lazyPeerPaymentController = self->_lazyPeerPaymentController;
  }

  return lazyPeerPaymentController;
}

- (id)_explanationTextForPaymentTransaction:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4 || [v4 transactionType] != 10)
  {
    NSComparisonResult v8 = 0;
    goto LABEL_42;
  }
  uint64_t v6 = [v5 transactionStatus];
  uint64_t v7 = v6;
  if (v6)
  {
    if (v6 == 5)
    {
      NSComparisonResult v8 = PKDynamicLocalizedAppleCardString(&cfstr_TransactionDet_80.isa);
      goto LABEL_42;
    }
    NSComparisonResult v8 = 0;
  }
  else
  {
    NSComparisonResult v8 = PKDynamicLocalizedAppleCardString(&cfstr_TransactionDet_81.isa);
  }
  objc_super v9 = [v5 payments];
  id v10 = [v9 firstObject];

  uint64_t v11 = [v10 expectedCreditReleaseDate];
  uint64_t v12 = [(PKAccount *)self->_account creditDetails];
  id v13 = [v12 accountSummary];
  id v14 = [v13 availableCredit];

  if (v14)
  {
    int v15 = [MEMORY[0x1E4F28C28] zero];
    BOOL v16 = [v15 compare:v14] == -1 || -[PKAccount state](self->_account, "state") == 1;
  }
  else
  {
    BOOL v16 = [(PKAccount *)self->_account state] == 1;
  }
  if (v7 != 2 && v16)
  {
    if (!v11 || ([(PKAccount *)self->_account hideBillPaymentHoldTime] & 1) != 0)
    {
      id v17 = [v10 fundingSource];
      uint64_t v18 = [v17 type];

      if (v18 != 1) {
        goto LABEL_41;
      }
      uint64_t v19 = PKDynamicLocalizedAppleCardString(&cfstr_TransactionDet_86.isa);
      if (!v19) {
        goto LABEL_41;
      }
LABEL_37:
      unint64_t v26 = [v8 stringByAppendingString:@" "];
      uint64_t v27 = [v26 stringByAppendingString:v19];
      unint64_t v28 = (void *)v27;
      if (v27) {
        unint64_t v29 = (void *)v27;
      }
      else {
        unint64_t v29 = v19;
      }
      id v30 = v29;

      NSComparisonResult v8 = v30;
      goto LABEL_41;
    }
    uint64_t v20 = [v5 transactionDate];
    uint64_t v21 = PKDateRangeNumberOfIntervalsForUnit();

    if (v21 >= 1)
    {
      uint64_t v22 = [MEMORY[0x1E4F1C9C8] now];
      if ([v22 compare:v11] != -1)
      {
        v23 = [(NSDateFormatter *)self->_monthDayYearLocalFormatter stringFromDate:v11];
        PKDynamicLocalizedAppleCardString(&cfstr_TransactionDet_87.isa, &cfstr_1_1.isa, v23);
        uint64_t v19 = LABEL_25:;

        goto LABEL_36;
      }
      uint64_t v24 = PKDateRangeNumberOfIntervalsForUnit();
      if (v24)
      {
        if (v24 <= 5)
        {
          v23 = [(NSDateFormatter *)self->_monthDayLocalFormatter stringFromDate:v11];
          PKDynamicLocalizedAppleCardString(&cfstr_TransactionDet_83.isa, &cfstr_1_1.isa, v23);
          goto LABEL_25;
        }
        if ((unint64_t)v24 > 9)
        {
          if ((unint64_t)v24 > 0x11) {
            v25 = @"TRANSACTION_DETAIL_BILL_PAYMENT_EXPLANATION_CREDIT_RELEASE_GENERIC";
          }
          else {
            v25 = @"TRANSACTION_DETAIL_BILL_PAYMENT_EXPLANATION_CREDIT_RELEASE_HOLD_2";
          }
        }
        else
        {
          v25 = @"TRANSACTION_DETAIL_BILL_PAYMENT_EXPLANATION_CREDIT_RELEASE_HOLD_1";
        }
      }
      else
      {
        v25 = @"TRANSACTION_DETAIL_BILL_PAYMENT_EXPLANATION_CREDIT_RELEASE_DATE_TODAY";
      }
      uint64_t v19 = PKDynamicLocalizedAppleCardString(&v25->isa);
LABEL_36:

      if (v19) {
        goto LABEL_37;
      }
    }
  }
LABEL_41:

LABEL_42:

  return v8;
}

- (id)_formattedCounterpartNameForRecurringPayment:(id)a3
{
  id v3 = [a3 recipientAddress];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1B980]);
  id v5 = [MEMORY[0x1E4F84D88] requiredContactKeys];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F845E8]) initWithContactStore:v4 keysToFetch:v5];
  uint64_t v7 = [v6 contactForHandle:v3];
  NSComparisonResult v8 = [MEMORY[0x1E4F84D88] displayNameForCounterpartHandle:v3 contact:v7];

  return v8;
}

- (BOOL)_transactionIsTaggedAsRecurring
{
  return [(NSSet *)self->_transactionTags pk_hasObjectPassingTest:&__block_literal_global_621];
}

BOOL __75__PKPaymentTransactionDetailViewController__transactionIsTaggedAsRecurring__block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == 1;
}

- (void)_updateWithTransactionReceipt:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_associatedReceipt, a3);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v6 = objc_msgSend(v5, "lineItems", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = [*(id *)(*((void *)&v13 + 1) + 8 * v10) image];

          if (v11)
          {
            BOOL v12 = 0;
            goto LABEL_12;
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    BOOL v12 = 1;
LABEL_12:

    self->_suppressReceiptImages = v12;
    [(PKPaymentTransactionDetailViewController *)self _recomputeLineItems];
    [(PKSectionTableViewController *)self reloadData];
  }
}

- (void)_updateWithTransactionTags:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_transactionTags, a3);
    [(PKSectionTableViewController *)self updateSectionVisibilityAndReloadIfNecessaryForSection:6];
  }
}

- (void)_performPeerPaymentAction:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PKPaymentTransaction *)self->_transaction serviceIdentifier];
  uint64_t v9 = [(PKPaymentTransactionDetailViewController *)self _peerPaymentController];
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __85__PKPaymentTransactionDetailViewController__performPeerPaymentAction_withCompletion___block_invoke;
  v13[3] = &unk_1E59E0790;
  objc_copyWeak(&v17, &location);
  id v10 = v6;
  id v14 = v10;
  id v11 = v9;
  id v15 = v11;
  id v12 = v7;
  id v16 = v12;
  [v11 performAction:v10 withPaymentIdentifier:v8 completion:v13];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __85__PKPaymentTransactionDetailViewController__performPeerPaymentAction_withCompletion___block_invoke(id *a1, char a2, void *a3, void *a4)
{
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__PKPaymentTransactionDetailViewController__performPeerPaymentAction_withCompletion___block_invoke_2;
  block[3] = &unk_1E59E0768;
  id v10 = v7;
  id v8 = v7;
  objc_copyWeak(v14, a1 + 7);
  char v15 = a2;
  id v11 = a1[4];
  id v12 = a1[5];
  id v13 = a1[6];
  v14[1] = a3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(v14);
}

void __85__PKPaymentTransactionDetailViewController__performPeerPaymentAction_withCompletion___block_invoke_2(uint64_t a1)
{
  id v12 = *(id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (!*(unsigned char *)(a1 + 80) && *(void *)(a1 + 32))
  {
    id v3 = [v12 userInfo];
    id v4 = [v3 objectForKey:*MEMORY[0x1E4F28A50]];

    id v5 = [v4 domain];
    if (![v5 isEqualToString:*MEMORY[0x1E4F87CD8]])
    {
LABEL_12:

      goto LABEL_13;
    }
    uint64_t v6 = [v4 code];

    if (!v6)
    {
      uint64_t v7 = *(void *)(a1 + 40);
      if (v7 == *MEMORY[0x1E4F87C38])
      {
        id v5 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentAcc_31.isa);
        id v8 = @"PEER_PAYMENT_ACCEPT_MONEY_GENERIC_ERROR_MESSAGE";
        goto LABEL_11;
      }
      if (v7 == *MEMORY[0x1E4F87C48])
      {
        id v5 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentRej.isa);
        id v8 = @"PEER_PAYMENT_REJECT_MONEY_GENERIC_ERROR_MESSAGE";
        goto LABEL_11;
      }
      if (v7 == *MEMORY[0x1E4F87C40])
      {
        id v5 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentCan_1.isa);
        id v8 = @"PEER_PAYMENT_CANCEL_MONEY_GENERIC_ERROR_MESSAGE";
LABEL_11:
        uint64_t v9 = PKLocalizedPeerPaymentString(&v8->isa);
        uint64_t v10 = PKDisplayableErrorCustom();

        id v12 = (id)v10;
        goto LABEL_12;
      }
    }
LABEL_13:
    [WeakRetained _handlePeerPaymentDisplayableError:v12 withPeerPaymentController:*(void *)(a1 + 48)];
  }
  uint64_t v11 = *(void *)(a1 + 56);
  if (v11) {
    (*(void (**)(uint64_t, void, void, void))(v11 + 16))(v11, *(unsigned __int8 *)(a1 + 80), *(void *)(a1 + 72), *(void *)(a1 + 32));
  }
}

- (void)_handlePeerPaymentDisplayableError:(id)a3 withPeerPaymentController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = [MEMORY[0x1E4F84D80] proposedResolutionForError:v6];
    switch(v8)
    {
      case 1:
        uint64_t v10 = [MEMORY[0x1E4F84D80] displayableErrorForError:v6];

        id v11 = PKAlertForDisplayableErrorWithHandlers(v10, 0, &__block_literal_global_649, 0);
        [(PKPaymentTransactionDetailViewController *)self presentViewController:v11 animated:1 completion:0];

        id v6 = v10;
        break;
      case 3:
        id v12 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v14 = 0;
          _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "Displaying identity verification flow...", v14, 2u);
        }

        if (PKDeviceSupportsPeerPaymentIdentityVerification())
        {
          [v7 handleIdentityVerificationWithError:v6 completion:&__block_literal_global_646];
        }
        else
        {
          id v13 = PKCreateAlertControllerForPeerPaymentIdentityVerificationNotSupported(0);
          [(PKPaymentTransactionDetailViewController *)self presentViewController:v13 animated:1 completion:0];
        }
        break;
      case 2:
        uint64_t v9 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "Displaying terms acceptance flow...", buf, 2u);
        }

        [v7 handleTermsAcceptanceRequiredWithError:v6 completion:&__block_literal_global_643];
        break;
    }
  }
}

void __105__PKPaymentTransactionDetailViewController__handlePeerPaymentDisplayableError_withPeerPaymentController___block_invoke(uint64_t a1, int a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = a2;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Terms acceptance flow appeared with success: %d", (uint8_t *)v4, 8u);
  }
}

void __105__PKPaymentTransactionDetailViewController__handlePeerPaymentDisplayableError_withPeerPaymentController___block_invoke_644(uint64_t a1, int a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = a2;
    _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Identity verification flow appeared with success: %d", (uint8_t *)v4, 8u);
  }
}

- (void)_fetchMerchantToken
{
  id v8 = [(PKPaymentTransaction *)self->_transaction isMerchantTokenTransaction];
  if ([v8 BOOLValue])
  {
    merchantTokenResponse = self->_merchantTokenResponse;

    if (!merchantTokenResponse)
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F84F40]);
      uint64_t v5 = [(PKTransactionSourceCollection *)self->_transactionSourceCollection paymentPass];
      [v4 setPass:v5];

      id v6 = [(PKPaymentTransaction *)self->_transaction panIdentifier];
      [v4 setMerchantTokenId:v6];

      objc_initWeak(&location, self);
      webService = self->_webService;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __63__PKPaymentTransactionDetailViewController__fetchMerchantToken__block_invoke;
      v9[3] = &unk_1E59E07B8;
      objc_copyWeak(&v10, &location);
      void v9[4] = self;
      [(PKPaymentWebService *)webService retrieveMerchantTokensWithRequest:v4 completion:v9];
      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
  else
  {
  }
}

void __63__PKPaymentTransactionDetailViewController__fetchMerchantToken__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__PKPaymentTransactionDetailViewController__fetchMerchantToken__block_invoke_2;
  v9[3] = &unk_1E59CE888;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  id v10 = v6;
  id v11 = v5;
  uint64_t v12 = *(void *)(a1 + 32);
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v9);

  objc_destroyWeak(&v13);
}

void __63__PKPaymentTransactionDetailViewController__fetchMerchantToken__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32))
    {
      id v14 = WeakRetained;
      id v4 = PKLocalizedMerchantTokensString(&cfstr_MerchantTokenT.isa);
      id v5 = PKLocalizedMerchantTokensString(&cfstr_MerchantTokenT_0.isa);
      id v6 = PKLocalizedMerchantTokensString(&cfstr_MerchantTokenT_1.isa);
      id v7 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v4 message:v5 preferredStyle:1];
      id v8 = [MEMORY[0x1E4FB1410] actionWithTitle:v6 style:0 handler:0];
      [v7 addAction:v8];

      if (v7) {
        [v14 presentViewController:v7 animated:1 completion:0];
      }

      goto LABEL_6;
    }
    uint64_t v9 = *(void **)(a1 + 40);
    if (v9)
    {
      id v10 = (id *)(WeakRetained + 1280);
      if (!v3[160])
      {
        id v14 = v3;
        objc_storeStrong(v10, v9);
        id v11 = [*(id *)(a1 + 40) merchantTokens];
        uint64_t v12 = [v11 count];

        if (v12) {
          uint64_t v13 = 16;
        }
        else {
          uint64_t v13 = 3;
        }
        [*(id *)(a1 + 48) updateSectionVisibilityAndReloadIfNecessaryForSection:v13];
LABEL_6:
        id v3 = v14;
      }
    }
  }
}

- (void)_fetchAllApplePayOrderRowViewModels
{
  id v3 = [(PKPaymentTransaction *)self->_transaction paymentHash];
  objc_initWeak(&location, self);
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  id v8 = __79__PKPaymentTransactionDetailViewController__fetchAllApplePayOrderRowViewModels__block_invoke;
  uint64_t v9 = &unk_1E59E07E0;
  objc_copyWeak(&v10, &location);
  id v4 = _Block_copy(&v6);
  id v5 = objc_alloc_init(getFKApplePayOrderFetchControllerClass());
  objc_msgSend(v5, "fetchAllRowViewModelsForTransactionWithIdentifier:completionHandler:", v3, v4, v6, v7, v8, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __79__PKPaymentTransactionDetailViewController__fetchAllApplePayOrderRowViewModels__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __79__PKPaymentTransactionDetailViewController__fetchAllApplePayOrderRowViewModels__block_invoke_2;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __79__PKPaymentTransactionDetailViewController__fetchAllApplePayOrderRowViewModels__block_invoke_2(uint64_t a1)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = [*(id *)(a1 + 32) orderRowViewModel];

    if (v3)
    {
      id v4 = [*(id *)(a1 + 32) orderRowViewModel];
      v17[0] = v4;
      uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
      id v6 = (void *)WeakRetained[161];
      WeakRetained[161] = v5;
    }
    id v7 = [*(id *)(a1 + 32) barcodeRowViewModel];

    if (v7)
    {
      id v8 = [*(id *)(a1 + 32) barcodeRowViewModel];
      id v16 = v8;
      uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
      id v10 = (void *)WeakRetained[162];
      WeakRetained[162] = v9;
    }
    id v11 = [*(id *)(a1 + 32) receiptRowViewModel];

    if (v11)
    {
      uint64_t v12 = [*(id *)(a1 + 32) receiptRowViewModel];
      char v15 = v12;
      uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
      id v14 = (void *)WeakRetained[163];
      WeakRetained[163] = v13;
    }
    [WeakRetained reloadData];
  }
}

- (BOOL)_showSeparateReportMerchantInfoButton
{
  id v2 = [(PKPaymentTransaction *)self->_transaction accountIdentifier];
  if (v2) {
    BOOL v3 = !+[PKBusinessChatController deviceSupportsBusinessChat];
  }
  else {
    LOBYTE(v3) = 1;
  }

  return v3;
}

- (void)_presentContactIssuer
{
  BOOL v3 = [(PKPaymentPass *)self->_paymentPass localizedValueForFieldKey:*MEMORY[0x1E4F87A58]];
  uint64_t v4 = [(PKPaymentPass *)self->_paymentPass organizationName];
  uint64_t v5 = (void *)v4;
  if (v3)
  {
    id v6 = PKLocalizedPaymentString(&cfstr_ContactIssuer.isa, &stru_1EF1B4C70.isa, v4);
    id v7 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v6 message:0 preferredStyle:0];
    if ([(PKPaymentTransactionDetailViewController *)self _hasIssuerPhoneNumber])
    {
      id v8 = (void *)MEMORY[0x1E4FB1410];
      uint64_t v9 = PKLocalizedPaymentString(&cfstr_Call_0.isa);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __65__PKPaymentTransactionDetailViewController__presentContactIssuer__block_invoke;
      v19[3] = &unk_1E59CB1F0;
      v19[4] = self;
      id v10 = [v8 actionWithTitle:v9 style:0 handler:v19];
      [v7 addAction:v10];
    }
    if ([(PKPaymentTransaction *)self->_transaction isBankConnectTransaction])
    {
      id v11 = [(PKPaymentTransaction *)self->_transaction bankConnectDigitalServicingURL];

      if (v11)
      {
        uint64_t v12 = (void *)MEMORY[0x1E4FB1410];
        uint64_t v13 = PKLocalizedPaymentString(&cfstr_Chat.isa);
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __65__PKPaymentTransactionDetailViewController__presentContactIssuer__block_invoke_2;
        v18[3] = &unk_1E59CB1F0;
        v18[4] = self;
        id v14 = [v12 actionWithTitle:v13 style:0 handler:v18];
        [v7 addAction:v14];
      }
    }
    char v15 = (void *)MEMORY[0x1E4FB1410];
    id v16 = PKLocalizedString(&cfstr_Cancel.isa);
    id v17 = [v15 actionWithTitle:v16 style:1 handler:0];
    [v7 addAction:v17];

    [(PKPaymentTransactionDetailViewController *)self presentViewController:v7 animated:1 completion:0];
  }
}

uint64_t __65__PKPaymentTransactionDetailViewController__presentContactIssuer__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _callIssuer];
}

uint64_t __65__PKPaymentTransactionDetailViewController__presentContactIssuer__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _openBankConnectDigitalServicingURL];
}

- (BOOL)_hasIssuerPhoneNumber
{
  id v2 = [(PKPaymentPass *)self->_paymentPass localizedValueForFieldKey:*MEMORY[0x1E4F87A58]];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (void)_callIssuer
{
  id v4 = [(PKPaymentPass *)self->_paymentPass localizedValueForFieldKey:*MEMORY[0x1E4F87A58]];
  id v2 = PKTelephoneURLFromPhoneNumber();
  BOOL v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v3 openSensitiveURL:v2 withOptions:0];
}

- (BOOL)_isPeerPaymentPendingRequestTransaction
{
  return [(PKPaymentTransaction *)self->_transaction transactionType] == 3
      && [(PKPaymentTransaction *)self->_transaction peerPaymentType] == 3
      && [(PKPaymentTransaction *)self->_transaction transactionStatus] == 0;
}

- (BOOL)_canShowAppleCardSupportFooterInAmountDetailsSection
{
  unint64_t v2 = [(PKPaymentTransaction *)self->_transaction transactionType];
  return (v2 > 0x16) | (0x7FF0u >> v2) & 1;
}

- (BOOL)_canShowAppleCardSupportFooterInRecognitionHintsSection
{
  return (unint64_t)([(PKPaymentTransaction *)self->_transaction transactionType] - 23) < 0xFFFFFFFFFFFFFFEBLL;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v3 = [(PKPaymentTransactionDetailViewController *)self view];
  [v3 setNeedsLayout];
}

- (void)contactsDidChangeForContactResolver:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__PKPaymentTransactionDetailViewController_contactsDidChangeForContactResolver___block_invoke;
  block[3] = &unk_1E59CA7D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __80__PKPaymentTransactionDetailViewController_contactsDidChangeForContactResolver___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isViewLoaded];
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 reloadSection:3];
  }
  return result;
}

- (id)_associatedInstallmentCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v35 = v6;
  id v8 = [v6 dequeueReusableCellWithIdentifier:@"PKPaymentTransactionTransactionCellReuseIdentifier" forIndexPath:v7];
  uint64_t v9 = [v8 transactionView];
  id v10 = (void *)[v7 row];
  id v11 = [(NSArray *)self->_associatedInstallmentPlans objectAtIndex:v10];
  uint64_t v12 = [v11 product];
  uint64_t v13 = [v12 serialNumber];
  id v14 = PKSerialNumber();
  id v15 = v13;
  id v16 = v14;
  id v33 = v8;
  uint64_t v34 = v7;
  uint64_t v31 = v11;
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

LABEL_10:
      uint64_t v20 = objc_msgSend(v12, "model", v31);
      uint64_t v21 = 0;
      goto LABEL_12;
    }
    uint64_t v19 = objc_msgSend(v15, "caseInsensitiveCompare:", v16, v11);

    if (v19) {
      goto LABEL_10;
    }
  }
  uint64_t v20 = PKDeviceName();
  uint64_t v21 = [v12 model];
LABEL_12:
  uint64_t v22 = [v12 iconURLForScale:0 suffix:PKUIScreenScale()];
  if (!v22)
  {
LABEL_17:
    uint64_t v27 = PKPassKitUIBundle();
    unint64_t v28 = [v27 URLForResource:@"InstallmentsFallback" withExtension:@"pdf"];

    if (v28)
    {
      double v29 = PKUIScreenScale();
      unint64_t v26 = PKUIImageFromPDF(v28, 100.0, 100.0, v29);
    }
    else
    {
      unint64_t v26 = 0;
    }

    goto LABEL_21;
  }
  v23 = [MEMORY[0x1E4F84830] sharedImageAssetDownloader];
  uint64_t v24 = [v23 cachedDataForURL:v22];
  if (!v24)
  {
    objc_initWeak(&location, self);
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __95__PKPaymentTransactionDetailViewController__associatedInstallmentCellForTableView_atIndexPath___block_invoke;
    v36[3] = &unk_1E59E0808;
    objc_copyWeak(v38, &location);
    v38[1] = v10;
    id v37 = v35;
    [v23 downloadFromUrl:v22 completionHandler:v36];

    objc_destroyWeak(v38);
    objc_destroyWeak(&location);

    goto LABEL_17;
  }
  v25 = (void *)v24;
  unint64_t v26 = [MEMORY[0x1E4FB1818] imageWithData:v24];

  if (!v26) {
    goto LABEL_17;
  }
LABEL_21:
  objc_msgSend(v9, "setPrimaryString:", v20, v31);
  [v9 setSecondaryString:v21];
  [v9 setShowsDisclosureView:1];
  [v9 setPrimaryImage:v26];
  [v9 setStrokeImage:0];

  return v33;
}

void __95__PKPaymentTransactionDetailViewController__associatedInstallmentCellForTableView_atIndexPath___block_invoke(id *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 && !a4)
  {
    uint64_t v5 = [MEMORY[0x1E4FB1818] imageWithData:a2];
    if (v5)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      void v6[2] = __95__PKPaymentTransactionDetailViewController__associatedInstallmentCellForTableView_atIndexPath___block_invoke_2;
      v6[3] = &unk_1E59CE838;
      objc_copyWeak(v9, a1 + 5);
      v9[1] = a1[6];
      id v7 = a1[4];
      id v8 = v5;
      dispatch_async(MEMORY[0x1E4F14428], v6);

      objc_destroyWeak(v9);
    }
  }
}

void __95__PKPaymentTransactionDetailViewController__associatedInstallmentCellForTableView_atIndexPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v3 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", *(void *)(a1 + 56), objc_msgSend(WeakRetained, "indexForSection:", 10));
    id v4 = [*(id *)(a1 + 32) cellForRowAtIndexPath:v3];
    uint64_t v5 = [v4 transactionView];
    [v5 setPrimaryImage:*(void *)(a1 + 40) animated:1];

    id WeakRetained = v6;
  }
}

- (id)_associatedFinancingPlanCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 dequeueReusableCellWithIdentifier:@"PKPaymentTransactionTransactionCellReuseIdentifier" forIndexPath:v7];
  uint64_t v9 = [v8 transactionView];
  id v10 = [(PKPaymentTransaction *)self->_transaction associatedFinancingPlan];
  id v11 = [v10 merchant];

  if (!self->_iconGenerator)
  {
    uint64_t v12 = [[PKPaymentTransactionIconGenerator alloc] initWithCache:1 scale:PKUIScreenScale()];
    iconGenerator = self->_iconGenerator;
    self->_iconGenerator = v12;
  }
  objc_initWeak(&location, self);
  id v14 = self->_iconGenerator;
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  uint64_t v22 = __97__PKPaymentTransactionDetailViewController__associatedFinancingPlanCellForTableView_atIndexPath___block_invoke;
  v23 = &unk_1E59D0EB8;
  objc_copyWeak(&v26, &location);
  id v15 = v6;
  id v24 = v15;
  id v16 = v7;
  id v25 = v16;
  id v17 = -[PKPaymentTransactionIconGenerator iconForPayLaterMerchant:size:ignoreLogoURL:requestType:iconHandler:](v14, "iconForPayLaterMerchant:size:ignoreLogoURL:requestType:iconHandler:", v11, 0, 0, &v20, 45.0, 45.0);
  BOOL v18 = objc_msgSend(v11, "displayName", v20, v21, v22, v23);
  [v9 setPrimaryString:v18];

  [v9 setShowsDisclosureView:1];
  [v9 setPrimaryImage:v17];
  [v9 setStrokeImage:0];

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

  return v8;
}

void __97__PKPaymentTransactionDetailViewController__associatedFinancingPlanCellForTableView_atIndexPath___block_invoke(id *a1, void *a2, char a3)
{
  id v5 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__PKPaymentTransactionDetailViewController__associatedFinancingPlanCellForTableView_atIndexPath___block_invoke_2;
  block[3] = &unk_1E59DF6E8;
  objc_copyWeak(&v11, a1 + 6);
  char v12 = a3;
  id v8 = v5;
  id v9 = a1[4];
  id v10 = a1[5];
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v11);
}

void __97__PKPaymentTransactionDetailViewController__associatedFinancingPlanCellForTableView_atIndexPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && *(unsigned char *)(a1 + 64) && *(void *)(a1 + 32))
  {
    id v5 = WeakRetained;
    id v3 = [*(id *)(a1 + 40) cellForRowAtIndexPath:*(void *)(a1 + 48)];
    id v4 = [v3 transactionView];
    [v4 setPrimaryImage:*(void *)(a1 + 32) animated:1];

    id WeakRetained = v5;
  }
}

- (void)_showInstallmentDetailsForAssociatedInstallment:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v6 = [[PKTransactionHistoryViewController alloc] initWithInstallmentPlan:v4 transactionSourceCollection:self->_transactionSourceCollection familyCollection:self->_familyCollection account:self->_account accountUserCollection:self->_accountUserCollection physicalCards:self->_physicalCards];

    id v5 = [(PKPaymentTransactionDetailViewController *)self navigationController];
    [v5 pushViewController:v6 animated:1];
  }
}

- (void)_showAssociatedFinancingPlanDetailsForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentTransaction *)self->_transaction associatedFinancingPlan];
  if (v5)
  {
    id v6 = [(PKPaymentTransactionDetailViewController *)self tableView];
    id v7 = [v6 cellForRowAtIndexPath:v4];

    [v7 setShowsActionSpinner:1];
    id v8 = objc_alloc_init(MEMORY[0x1E4F84518]);
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x3032000000;
    v24[3] = __Block_byref_object_copy__68;
    v24[4] = __Block_byref_object_dispose__68;
    id v25 = 0;
    objc_initWeak(&location, self);
    if (!self->_associatedPayLaterAccount)
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __92__PKPaymentTransactionDetailViewController__showAssociatedFinancingPlanDetailsForIndexPath___block_invoke;
      v20[3] = &unk_1E59E0830;
      v20[4] = self;
      objc_copyWeak(&v22, &location);
      id v21 = v5;
      [v8 addOperation:v20];

      objc_destroyWeak(&v22);
    }
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __92__PKPaymentTransactionDetailViewController__showAssociatedFinancingPlanDetailsForIndexPath___block_invoke_686;
    v16[3] = &unk_1E59E0858;
    v16[4] = self;
    BOOL v18 = v24;
    id v17 = v5;
    objc_copyWeak(&v19, &location);
    [v8 addOperation:v16];
    id v9 = [MEMORY[0x1E4F1CA98] null];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __92__PKPaymentTransactionDetailViewController__showAssociatedFinancingPlanDetailsForIndexPath___block_invoke_3_693;
    v12[3] = &unk_1E59E0880;
    objc_copyWeak(&v15, &location);
    id v14 = v24;
    id v10 = v7;
    id v13 = v10;
    id v11 = (id)[v8 evaluateWithInput:v9 completion:v12];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v19);

    objc_destroyWeak(&location);
    _Block_object_dispose(v24, 8);
  }
}

void __92__PKPaymentTransactionDetailViewController__showAssociatedFinancingPlanDetailsForIndexPath___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *(void **)(*(void *)(a1 + 32) + 1264);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __92__PKPaymentTransactionDetailViewController__showAssociatedFinancingPlanDetailsForIndexPath___block_invoke_2;
  v13[3] = &unk_1E59DA6E0;
  objc_copyWeak(&v17, (id *)(a1 + 48));
  id v14 = *(id *)(a1 + 40);
  id v11 = v9;
  id v16 = v11;
  id v12 = v8;
  id v15 = v12;
  [v10 defaultAccountForFeature:3 completion:v13];

  objc_destroyWeak(&v17);
}

void __92__PKPaymentTransactionDetailViewController__showAssociatedFinancingPlanDetailsForIndexPath___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__PKPaymentTransactionDetailViewController__showAssociatedFinancingPlanDetailsForIndexPath___block_invoke_3;
  block[3] = &unk_1E59CD3E8;
  objc_copyWeak(&v10, a1 + 7);
  id v6 = v3;
  id v7 = a1[4];
  id v9 = a1[6];
  id v8 = a1[5];
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v10);
}

void __92__PKPaymentTransactionDetailViewController__showAssociatedFinancingPlanDetailsForIndexPath___block_invoke_3(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 144, *(id *)(a1 + 32));
    uint64_t v4 = *(void *)(a1 + 32);
    if (!v4)
    {
      id v5 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(a1 + 40);
        int v7 = 138412290;
        uint64_t v8 = v6;
        _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Error: there is no pay later account for associated transaction financing plan %@", (uint8_t *)&v7, 0xCu);
      }

      uint64_t v4 = *(void *)(a1 + 32);
    }
    (*(void (**)(void, void, BOOL))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), *(void *)(a1 + 48), v4 == 0);
  }
}

void __92__PKPaymentTransactionDetailViewController__showAssociatedFinancingPlanDetailsForIndexPath___block_invoke_686(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v23 = a2;
  id v26 = a3;
  id v25 = a4;
  id v24 = objc_alloc(MEMORY[0x1E4F849D0]);
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 1152);
  uint64_t v8 = [MEMORY[0x1E4F84D50] sharedService];
  uint64_t v9 = [MEMORY[0x1E4F84898] sharedInstance];
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void *)(v10 + 1104);
  if (v11)
  {
    id v12 = *(void **)(v10 + 1104);
  }
  else
  {
    id v12 = [MEMORY[0x1E4F84E10] sharedService];
    uint64_t v10 = *(void *)(a1 + 32);
  }
  uint64_t v13 = *(void *)(v10 + 1264);
  id v14 = objc_alloc_init(MEMORY[0x1E4F84C38]);
  id v15 = [v14 defaultPaymentPassUniqueIdentifier];
  id v16 = (void *)[v24 initWithPayLaterAccount:v7 paymentWebService:v8 passLibrary:v9 peerPaymentWebService:v12 accountService:v13 defaultPassUniqueIdentifier:v15];

  if (!v11) {
  id v17 = [[PKPayLaterFinancingPlanViewController alloc] initWithFinancingPlan:*(void *)(a1 + 40) payLaterAccount:*(void *)(*(void *)(a1 + 32) + 1152) paymentIntentController:v16 merchantIcon:0 iconGenerator:0];
  }
  uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
  id v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v17;

  uint64_t v20 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __92__PKPaymentTransactionDetailViewController__showAssociatedFinancingPlanDetailsForIndexPath___block_invoke_2_691;
  v27[3] = &unk_1E59CAE30;
  objc_copyWeak(&v30, (id *)(a1 + 56));
  id v21 = v25;
  id v29 = v21;
  id v22 = v26;
  id v28 = v22;
  [v20 preflightWithCompletion:v27];

  objc_destroyWeak(&v30);
}

void __92__PKPaymentTransactionDetailViewController__showAssociatedFinancingPlanDetailsForIndexPath___block_invoke_2_691(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id WeakRetained = v3;
  }
}

void __92__PKPaymentTransactionDetailViewController__showAssociatedFinancingPlanDetailsForIndexPath___block_invoke_3_693(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__PKPaymentTransactionDetailViewController__showAssociatedFinancingPlanDetailsForIndexPath___block_invoke_4;
  block[3] = &unk_1E59D4EC0;
  objc_copyWeak(&v6, (id *)(a1 + 48));
  long long v3 = *(_OWORD *)(a1 + 32);
  id v2 = (id)v3;
  long long v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v6);
}

void __92__PKPaymentTransactionDetailViewController__showAssociatedFinancingPlanDetailsForIndexPath___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    long long v3 = [WeakRetained navigationController];
    [v3 pushViewController:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) animated:1];

    [*(id *)(a1 + 32) setShowsActionSpinner:0];
    id WeakRetained = v4;
  }
}

- (void)accountServiceAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5
{
}

- (BOOL)_actionRowIsEnabled:(unint64_t)a3
{
  transactionSourceCollection = self->_transactionSourceCollection;
  id v6 = [(PKPaymentTransaction *)self->_transaction transactionSourceIdentifier];
  uint64_t v7 = [(PKTransactionSourceCollection *)transactionSourceCollection transactionSourceForTransactionSourceIdentifier:v6];

  switch(a3)
  {
    case 0uLL:
      BOOL v8 = !self->_issuerAppDeepLinkingEnabled;
      goto LABEL_51;
    case 1uLL:
      if ([(PKPaymentTransaction *)self->_transaction transactionType] != 3
        || ![(PKPaymentTransaction *)self->_transaction transactionStatus]
        || [(PKPaymentTransaction *)self->_transaction peerPaymentType] != 2)
      {
        goto LABEL_70;
      }
      goto LABEL_9;
    case 2uLL:
      if ([(PKPaymentTransaction *)self->_transaction transactionType] != 3
        || [(PKPaymentTransaction *)self->_transaction peerPaymentType] != 1)
      {
        goto LABEL_70;
      }
LABEL_9:
      uint64_t v9 = [(PKPaymentTransaction *)self->_transaction peerPaymentCounterpartHandle];
      if (![v9 length] || objc_msgSend(v7, "type")) {
        goto LABEL_72;
      }
      uint64_t v10 = [(PKPaymentTransaction *)self->_transaction recurringPeerPayment];
      if (v10) {
        goto LABEL_40;
      }
      LOBYTE(v11) = [(PKPaymentTransaction *)self->_transaction peerPaymentPaymentMode] != 2;
      goto LABEL_75;
    case 3uLL:
      if ([(PKPaymentTransaction *)self->_transaction transactionType] != 3) {
        goto LABEL_70;
      }
      id v12 = [(PKPeerPaymentStatusResponse *)self->_peerPaymentStatusResponse actions];
      if (![v12 containsObject:*MEMORY[0x1E4F87C38]]) {
        goto LABEL_59;
      }
      LOBYTE(v11) = [v7 type] == 0;
      goto LABEL_60;
    case 4uLL:
      if ([(PKPaymentTransaction *)self->_transaction transactionType] != 3) {
        goto LABEL_70;
      }
      uint64_t v13 = [(PKPeerPaymentStatusResponse *)self->_peerPaymentStatusResponse actions];
      uint64_t v9 = v13;
      id v14 = (void *)MEMORY[0x1E4F87C40];
      goto LABEL_20;
    case 5uLL:
      if ([(PKPaymentTransaction *)self->_transaction transactionType] != 3) {
        goto LABEL_70;
      }
      uint64_t v13 = [(PKPeerPaymentStatusResponse *)self->_peerPaymentStatusResponse actions];
      uint64_t v9 = v13;
      id v14 = (void *)MEMORY[0x1E4F87C48];
LABEL_20:
      if (![v13 containsObject:*v14] || objc_msgSend(v7, "type")) {
        goto LABEL_72;
      }
      LOBYTE(v11) = [(PKPaymentTransaction *)self->_transaction peerPaymentPaymentMode] != 2;
      break;
    case 6uLL:
      id v15 = [(PKPaymentTransaction *)self->_transaction recurringPeerPayment];
      uint64_t v16 = [v15 status];

      uint64_t v17 = [(PKPaymentTransaction *)self->_transaction transactionType];
      uint64_t v18 = [(PKPaymentTransaction *)self->_transaction peerPaymentType];
      uint64_t v19 = [(PKPaymentTransaction *)self->_transaction accountType];
      BOOL v21 = v17 == 6 || v18 == 1;
      if (v19 != 1 || v16 == 0 || !v21) {
        goto LABEL_70;
      }
      BOOL v8 = self->_detailViewStyle == 2;
LABEL_51:
      LOBYTE(v11) = !v8;
      goto LABEL_77;
    case 7uLL:
      if ([(PKPaymentTransaction *)self->_transaction transactionType] != 10) {
        goto LABEL_70;
      }
      uint64_t v9 = [(PKPaymentTransaction *)self->_transaction payments];
      uint64_t v10 = [v9 firstObject];
      if ([v10 isCurrentlyCancellable]
        && [(PKPaymentTransaction *)self->_transaction transactionStatus] != 5)
      {
        LOBYTE(v11) = [(PKPaymentTransaction *)self->_transaction featureIdentifier] == 2;
      }
      else
      {
LABEL_40:
        LOBYTE(v11) = 0;
      }
LABEL_75:

      break;
    case 8uLL:
      if (+[PKBusinessChatController deviceSupportsBusinessChat])
      {
        id v24 = [(PKPaymentPass *)self->_paymentPass businessChatIdentifier];
        BOOL v25 = v24 != 0;
      }
      else
      {
        BOOL v25 = 0;
      }
      if (!+[PKReportIssueViewController canReportIssueForTransaction:self->_transaction bankConnectInstitution:self->_bankConnectInstitution paymentPass:self->_paymentPass]&& !v25)
      {
        goto LABEL_70;
      }
      uint64_t v9 = [(PKPaymentTransaction *)self->_transaction questions];
      if ([v9 count]) {
        goto LABEL_72;
      }
      int v11 = ![(PKPaymentTransactionDetailViewController *)self _showSeparateReportMerchantInfoButton];
      break;
    case 9uLL:
      id v12 = [(PKPaymentTransaction *)self->_transaction questions];
      LOBYTE(v11) = [v12 count] != 0;
      goto LABEL_60;
    case 0xAuLL:
      uint64_t v9 = [(PKPaymentTransaction *)self->_transaction bankConnectDigitalServicingURL];
      if ([(PKPaymentTransaction *)self->_transaction isBankConnectTransaction])BOOL v26 = v9 == 0; {
      else
      }
        BOOL v26 = 1;
      if (v26
        || ([MEMORY[0x1E4FB1438] sharedApplication],
            uint64_t v27 = objc_claimAutoreleasedReturnValue(),
            char v28 = [v27 canOpenURL:v9],
            v27,
            (v28 & 1) == 0))
      {
        BOOL v31 = +[PKBusinessChatController deviceSupportsBusinessChat];
        char v32 = [(PKPaymentPass *)self->_paymentPass isAppleCardPass];
        uint64_t v33 = [(PKPaymentTransaction *)self->_transaction transactionType];
        if ([(PKPaymentTransactionDetailViewController *)self _showSeparateReportMerchantInfoButton])
        {
          LOBYTE(v11) = 0;
          if ([(PKPaymentTransactionDetailViewController *)self _hasIssuerPhoneNumber] && !v33)
          {
            if ([(PKPaymentPass *)self->_paymentPass isTransitPass]) {
              LOBYTE(v11) = 0;
            }
            else {
              LOBYTE(v11) = v32 ^ 1 | v31;
            }
          }
        }
        else
        {
LABEL_72:
          LOBYTE(v11) = 0;
        }
      }
      else
      {
        LOBYTE(v11) = 1;
      }
      break;
    case 0xBuLL:
      BOOL v8 = self->_privacyURL == 0;
      goto LABEL_51;
    case 0xCuLL:
      LOBYTE(v11) = [(PKPaymentTransactionDetailViewController *)self _isPeerPaymentPendingRequestTransaction];
      goto LABEL_77;
    case 0xDuLL:
      uint64_t v29 = [(PKPaymentTransaction *)self->_transaction bankConnectPostInstallmentURL];
      goto LABEL_57;
    case 0xEuLL:
      uint64_t v29 = [(PKPaymentTransaction *)self->_transaction bankConnectRedeemRewardsURL];
LABEL_57:
      id v12 = (void *)v29;
      if (v29)
      {
        id v30 = [MEMORY[0x1E4FB1438] sharedApplication];
        LOBYTE(v11) = [v30 canOpenURL:v12];
      }
      else
      {
LABEL_59:
        LOBYTE(v11) = 0;
      }
LABEL_60:

      goto LABEL_77;
    default:
LABEL_70:
      LOBYTE(v11) = 0;
      goto LABEL_77;
  }

LABEL_77:
  return v11;
}

- (BOOL)_shouldHighlightAction:(unint64_t)a3
{
  return a3 < 0xF;
}

- (int64_t)_numberOfActionRowsEnabled
{
  uint64_t v3 = 0;
  int64_t v4 = 0;
  do
    v4 += [(PKPaymentTransactionDetailViewController *)self _actionRowIsEnabled:v3++];
  while (v3 != 15);
  return v4;
}

- (unint64_t)_actionRowForRowIndex:(int64_t)a3
{
  unint64_t v5 = 0;
  uint64_t v6 = 0;
  do
  {
    if ([(PKPaymentTransactionDetailViewController *)self _actionRowIsEnabled:v5])
    {
      if (v6 == a3) {
        return v5;
      }
      ++v6;
    }
    ++v5;
  }
  while (v5 != 15);
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)_rowIndexForActionRow:(unint64_t)a3
{
  uint64_t v5 = 0;
  int64_t v6 = 0;
  do
  {
    if ([(PKPaymentTransactionDetailViewController *)self _actionRowIsEnabled:v5])
    {
      if (a3 == v5) {
        return v6;
      }
      ++v6;
    }
    ++v5;
  }
  while (v5 != 15);
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)_tableView:(id)a3 cellForAwardAtIndex:(int64_t)a4
{
  transaction = self->_transaction;
  id v7 = a3;
  BOOL v8 = [(PKPaymentTransaction *)transaction awards];
  if ([v8 count] == a4)
  {
    uint64_t v9 = [(PKPaymentTransactionDetailViewController *)self _tableView:v7 actionButtonCellForSection:15];

    uint64_t v10 = [(PKPaymentPass *)self->_paymentPass organizationName];
    int v11 = PKLocalizedAquamanString(&cfstr_ViewOfferDetai.isa, &stru_1EF1B4C70.isa, v10);

    id v12 = [v9 textLabel];
    [v12 setText:v11];
  }
  else
  {
    uint64_t v9 = [(PKPaymentTransactionDetailViewController *)self _awardCellForTableView:v7];

    uint64_t v13 = [(PKPaymentTransaction *)self->_transaction awards];
    int v11 = [v13 objectAtIndex:a4];

    id v12 = [v11 awardDescription];
    if ([v11 type] == 1)
    {
      id v14 = [v11 amount];
      id v15 = [v14 amount];
      uint64_t v16 = [v15 formattedStringValue];
    }
    else
    {
      uint64_t v16 = [v11 localizedAmount];
    }
    uint64_t v27 = PKLocalizedAquamanString(&cfstr_Expired.isa);
    id v30 = [v11 claimExpiryDate];
    uint64_t v29 = [v11 redeemExpiryDate];
    id v28 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    uint64_t v17 = PKLocalizedAquamanString(&cfstr_TransactionDet_88.isa, &stru_1EF1B5770.isa, v12, v16);
    uint64_t v18 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    uint64_t v19 = [v9 textLabel];
    uint64_t v20 = [v9 detailTextLabel];
    [v19 setText:v17];
    if (([v11 claimExpired] & 1) == 0 && (objc_msgSend(v11, "redeemExpired") & 1) == 0)
    {
      BOOL v26 = v16;
      if (v30)
      {
        BOOL v21 = [v28 earlierDate:v30];

        BOOL v22 = v21 == v30;
        uint64_t v16 = v26;
        if (v22) {
          [v11 setClaimExpired:1];
        }
      }
      if (v29)
      {
        id v23 = [v28 earlierDate:v29];

        BOOL v22 = v23 == v29;
        uint64_t v16 = v26;
        if (v22) {
          [v11 setRedeemExpired:1];
        }
      }
    }
    if (([v11 claimExpired] & 1) != 0 || objc_msgSend(v11, "redeemExpired"))
    {
      id v24 = (void *)v27;
      [v20 setText:v27];
      [v19 setTextColor:v18];
      [v20 setTextColor:v18];
    }
    else
    {
      [v9 setAccessoryType:self->_issuerAppDeepLinkingEnabled];
      id v24 = (void *)v27;
    }
  }

  return v9;
}

- (id)_tableView:(id)a3 cellForActionAtIndex:(int64_t)a4
{
  id v6 = a3;
  switch([(PKPaymentTransactionDetailViewController *)self _actionRowForRowIndex:a4])
  {
    case 0uLL:
      id v7 = [(PKPaymentPass *)self->_paymentPass organizationName];
      BOOL v8 = [(PKPaymentTransaction *)self->_transaction awards];
      if ([v8 count]) {
        uint64_t v9 = @"TRANSACTION_DETAIL_ACTION_OPEN_TRANSACTION_DETAILS_IN_ISSUER_APP_FORMAT";
      }
      else {
        uint64_t v9 = @"TRANSACTION_DETAIL_ACTION_VIEW_IN_ISSUER_APP_FORMAT";
      }
      uint64_t v10 = PKLocalizedPeerPaymentString(&v9->isa, &stru_1EF1B4C70.isa, v7);

      goto LABEL_22;
    case 1uLL:
      id v12 = @"TRANSACTION_DETAIL_ACTION_REQUEST_AGAIN";
      goto LABEL_13;
    case 2uLL:
      id v12 = @"TRANSACTION_DETAIL_ACTION_SEND_AGAIN";
      goto LABEL_13;
    case 3uLL:
      id v12 = @"TRANSACTION_DETAIL_ACTION_ACCEPT_PENDING";
      goto LABEL_13;
    case 4uLL:
      uint64_t v13 = [(PKPaymentTransaction *)self->_transaction recurringPeerPayment];

      id v12 = @"TRANSACTION_DETAIL_ACTION_CANCEL_PENDING";
      if (!v13) {
        goto LABEL_13;
      }
      uint64_t v14 = PKLocalizedPeerPaymentRecurringString(&cfstr_TransactionDet_94.isa);
      goto LABEL_30;
    case 5uLL:
      id v12 = @"TRANSACTION_DETAIL_ACTION_REJECT_PENDING";
LABEL_13:
      uint64_t v14 = PKLocalizedPeerPaymentString(&v12->isa);
      goto LABEL_30;
    case 6uLL:
      id v15 = [(PKPaymentTransaction *)self->_transaction recurringPeerPayment];
      uint64_t v16 = [v15 type];
      if (v16 == 1)
      {
        uint64_t v17 = @"TRANSACTION_DETAIL_ACTION_VIEW_RECURRING_PAYMENT";
        goto LABEL_41;
      }
      if (v16 == 3)
      {
        uint64_t v17 = @"TRANSACTION_DETAIL_ACTION_VIEW_AUTO_RELOAD";
LABEL_41:
        uint64_t v10 = PKLocalizedPeerPaymentRecurringString(&v17->isa);
        goto LABEL_43;
      }
      uint64_t v10 = 0;
LABEL_43:

      BOOL v25 = [v6 dequeueReusableCellWithIdentifier:@"PKPaymentTransactionConfigurationCellReuseIdentifier"];
      int v11 = [v25 defaultContentConfiguration];
      [v11 setText:v10];
      [v25 setAccessoryType:1];
      [v25 setContentConfiguration:v11];
LABEL_35:

      return v25;
    case 7uLL:
      uint64_t v18 = PKLocalizedPaymentString(&cfstr_TransactionDet_98.isa);
      goto LABEL_26;
    case 8uLL:
      uint64_t v19 = @"TRANSACTION_DETAILS_REPORT_PROBLEM_TITLE";
      goto LABEL_20;
    case 9uLL:
      uint64_t v19 = @"TRANSACTION_DETAILS_CONTACT_SUPPORT_TITLE";
LABEL_20:
      uint64_t v14 = PKLocalizedPaymentString(&v19->isa);
      goto LABEL_30;
    case 10uLL:
      id v7 = [(PKPaymentPass *)self->_paymentPass organizationName];
      uint64_t v10 = PKLocalizedPaymentString(&cfstr_TransactionDet_99.isa, &stru_1EF1B4C70.isa, v7);
LABEL_22:

      goto LABEL_31;
    case 11uLL:
      uint64_t v20 = [(PKPaymentTransaction *)self->_transaction releasedData];
      BOOL v21 = [v20 merchantNameOverride];
      BOOL v22 = v21;
      if (v21)
      {
        id v23 = v21;
      }
      else
      {
        id v28 = [(PKPaymentTransaction *)self->_transaction merchant];
        id v23 = [v28 name];
      }
      uint64_t v10 = PKLocalizedIdentityString(&cfstr_TransactionDet_100.isa, &stru_1EF1B4C70.isa, v23);

      goto LABEL_31;
    case 12uLL:
      uint64_t v18 = PKLocalizedPeerPaymentString(&cfstr_TransactionDet_101.isa);
LABEL_26:
      uint64_t v10 = (void *)v18;
      int v11 = [MEMORY[0x1E4FB1618] systemRedColor];
      goto LABEL_32;
    case 13uLL:
      id v24 = @"BANK_CONNECT_TRANSACTION_DETAILS_POST_INSTALLMENT";
      goto LABEL_29;
    case 14uLL:
      id v24 = @"BANK_CONNECT_TRANSACTION_DETAILS_REDEEM_REWARDS";
LABEL_29:
      uint64_t v14 = PKLocalizedBankConnectString(&v24->isa);
LABEL_30:
      uint64_t v10 = (void *)v14;
LABEL_31:
      int v11 = 0;
      goto LABEL_32;
    default:
      int v11 = 0;
      uint64_t v10 = 0;
LABEL_32:
      BOOL v25 = [(PKPaymentTransactionDetailViewController *)self _tableView:v6 actionButtonCellForSection:20];
      BOOL v26 = [v25 textLabel];
      [v26 setText:v10];
      if (v11) {
        [v26 setTextColor:v11];
      }

      goto LABEL_35;
  }
}

- (id)_tableView:(id)a3 actionButtonCellForSection:(unint64_t)a4
{
  id v5 = a3;
  id v6 = [v5 dequeueReusableCellWithIdentifier:@"PKPaymentTransactionDefaultCellReuseIdentifier"];
  id v7 = [v6 textLabel];
  if (self->_inBridge) {
    BPSBridgeTintColor();
  }
  else {
  BOOL v8 = [v5 tintColor];
  }
  [v7 setTextColor:v8];

  [v7 setNumberOfLines:0];
  [v6 setAccessoryType:0];
  objc_msgSend(v6, "setSeparatorInset:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  [v6 setAccessibilityIdentifier:*MEMORY[0x1E4F851B0]];

  return v6;
}

- (id)_tableViewCellForDeleteTransaction:(id)a3
{
  int64_t v4 = [(PKPaymentTransactionDetailViewController *)self _tableView:a3 actionButtonCellForSection:20];
  id v5 = [v4 textLabel];
  deleteOverrider = self->_deleteOverrider;
  if (deleteOverrider) {
    [(PKPaymentTransactionDetailViewControllerDeleteOverrider *)deleteOverrider transactionDetailViewControllerDeleteOverriderActionTitle];
  }
  else {
  id v7 = PKLocalizedIdentityString(&cfstr_TransactionDel_0.isa);
  }
  [v5 setText:v7];
  BOOL v8 = [MEMORY[0x1E4FB1618] systemRedColor];
  [v5 setTextColor:v8];

  [v4 setAccessibilityIdentifier:*MEMORY[0x1E4F858F0]];

  return v4;
}

- (id)_tableViewCellPaymentRewardsRedemptionInfoForTableView:(id)a3 atIndexPath:(id)a4
{
  id v5 = [a3 dequeueReusableCellWithIdentifier:@"PKPaymentRewardsRedemptionInfoCellReuseIdentifier" forIndexPath:a4];
  id v6 = [(PKPaymentTransaction *)self->_transaction paymentRewardsRedemption];
  [v5 configureWithRewardsRedemption:v6 rewardsBalance:self->_associatedPaymentRewardsBalance];

  return v5;
}

- (void)_tableView:(id)a3 didSelectActionAtIndexPath:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  switch(-[PKPaymentTransactionDetailViewController _actionRowForRowIndex:](self, "_actionRowForRowIndex:", [v6 row]))
  {
    case 0uLL:
      [(PKPaymentTransactionDetailViewController *)self _openTransactionInIssuerApp];
      break;
    case 1uLL:
      MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85ED0], 0);
      id v7 = self;
      uint64_t v8 = 1;
      goto LABEL_6;
    case 2uLL:
      MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85ED8], 0);
      id v7 = self;
      uint64_t v8 = 2;
LABEL_6:
      [(PKPaymentTransactionDetailViewController *)v7 _openMessagesToPresentAction:v8];
      break;
    case 3uLL:
      uint64_t v9 = (void *)MEMORY[0x1E4F87C38];
      goto LABEL_10;
    case 4uLL:
      MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85EB8], 0);
      uint64_t v9 = (void *)MEMORY[0x1E4F87C40];
      goto LABEL_10;
    case 5uLL:
      MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85EC8], 0);
      uint64_t v9 = (void *)MEMORY[0x1E4F87C48];
LABEL_10:
      [(PKPaymentTransactionDetailViewController *)self _tableView:v10 didSelectPeerPaymentAction:*v9 atIndexPath:v6];
      break;
    case 6uLL:
      [(PKPaymentTransactionDetailViewController *)self _presentRecurringPeerPaymentAtIndexPath:v6];
      break;
    case 7uLL:
      [(PKPaymentTransactionDetailViewController *)self _presentCancelPaymentWithIndexPath:v6];
      break;
    case 8uLL:
      [(PKPaymentTransactionDetailViewController *)self _presentReportIssue];
      break;
    case 9uLL:
    case 10uLL:
      [(PKPaymentTransactionDetailViewController *)self _presentContactViewController];
      break;
    case 11uLL:
      [(PKPaymentTransactionDetailViewController *)self _openAppPrivacyURL];
      break;
    case 12uLL:
      [(PKPaymentTransactionDetailViewController *)self _cancelPeerPaymentPendingRequest];
      break;
    case 13uLL:
      [(PKPaymentTransactionDetailViewController *)self _openBankConnectPostInstallmentURL];
      break;
    case 14uLL:
      [(PKPaymentTransactionDetailViewController *)self _openBankConnectRedeemRewardsURL];
      break;
    default:
      break;
  }
}

- (void)_tableView:(id)a3 didSelectPeerPaymentAction:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [v8 cellForRowAtIndexPath:v10];
  [v11 setShowsActionSpinner:1];
  objc_initWeak(location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __94__PKPaymentTransactionDetailViewController__tableView_didSelectPeerPaymentAction_atIndexPath___block_invoke;
  aBlock[3] = &unk_1E59CB378;
  objc_copyWeak(&v46, location);
  id v12 = v9;
  id v44 = v12;
  id v13 = v10;
  id v45 = v13;
  uint64_t v14 = (void (**)(void))_Block_copy(aBlock);
  id v15 = (void *)*MEMORY[0x1E4F87C40];
  id v16 = v12;
  id v17 = v15;
  if (v17 == v16)
  {
  }
  else
  {
    uint64_t v18 = v17;
    if (!v16 || !v17)
    {

      goto LABEL_11;
    }
    int v19 = [v16 isEqualToString:v17];

    if (!v19) {
      goto LABEL_11;
    }
  }
  uint64_t v20 = [(PKPaymentTransaction *)self->_transaction recurringPeerPayment];

  if (!v20)
  {
LABEL_11:
    v14[2](v14);
    goto LABEL_14;
  }
  uint64_t v21 = PKLocalizedPeerPaymentRecurringString(&cfstr_TransactionDet_102.isa);
  uint64_t v22 = [(PKPaymentTransaction *)self->_transaction peerPaymentCounterpartHandle];
  uint64_t v33 = [(PKContactResolver *)self->_contactResolver contactForHandle:v22];
  id v37 = [MEMORY[0x1E4F84D88] displayNameForCounterpartHandle:v22 contact:v33];
  id v23 = [(PKPaymentTransaction *)self->_transaction transactionDate];
  BOOL v36 = PKMediumDayAndMonthStringFromDate();

  if ([v37 length]) {
    PKLocalizedPeerPaymentRecurringString(&cfstr_TransactionDet_103.isa, &stru_1EF1B5770.isa, v36, v37);
  }
  else {
  id v35 = PKLocalizedPeerPaymentRecurringString(&cfstr_TransactionDet_104.isa, &stru_1EF1B4C70.isa, v36);
  }
  uint64_t v34 = PKLocalizedPeerPaymentRecurringString(&cfstr_TransactionDet_105.isa);
  BOOL v31 = (void *)v22;
  id v32 = v8;
  id v24 = PKLocalizedPeerPaymentRecurringString(&cfstr_TransactionDet_106.isa);
  id v30 = (void *)v21;
  BOOL v25 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v21 message:v35 preferredStyle:1];
  BOOL v26 = (void *)MEMORY[0x1E4FB1410];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __94__PKPaymentTransactionDetailViewController__tableView_didSelectPeerPaymentAction_atIndexPath___block_invoke_5;
  v41[3] = &unk_1E59CB150;
  v42 = v14;
  uint64_t v27 = [v26 actionWithTitle:v34 style:2 handler:v41];
  [v25 addAction:v27];

  id v28 = (void *)MEMORY[0x1E4FB1410];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  id v38[2] = __94__PKPaymentTransactionDetailViewController__tableView_didSelectPeerPaymentAction_atIndexPath___block_invoke_6;
  v38[3] = &unk_1E59D25D0;
  objc_copyWeak(&v40, location);
  id v39 = v13;
  uint64_t v29 = [v28 actionWithTitle:v24 style:1 handler:v38];
  [v25 addAction:v29];

  [(PKPaymentTransactionDetailViewController *)self presentViewController:v25 animated:1 completion:0];
  objc_destroyWeak(&v40);

  id v8 = v32;
LABEL_14:

  objc_destroyWeak(&v46);
  objc_destroyWeak(location);
}

void __94__PKPaymentTransactionDetailViewController__tableView_didSelectPeerPaymentAction_atIndexPath___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __94__PKPaymentTransactionDetailViewController__tableView_didSelectPeerPaymentAction_atIndexPath___block_invoke_2;
    v5[3] = &unk_1E59E08A8;
    objc_copyWeak(&v7, v2);
    id v6 = *(id *)(a1 + 40);
    [WeakRetained _performPeerPaymentAction:v4 withCompletion:v5];

    objc_destroyWeak(&v7);
  }
}

void __94__PKPaymentTransactionDetailViewController__tableView_didSelectPeerPaymentAction_atIndexPath___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    void v7[2] = __94__PKPaymentTransactionDetailViewController__tableView_didSelectPeerPaymentAction_atIndexPath___block_invoke_3;
    v7[3] = &unk_1E59CB268;
    objc_copyWeak(&v9, (id *)(a1 + 40));
    id v8 = *(id *)(a1 + 32);
    [WeakRetained _updatePeerPaymentTransactionStatusWithCompletion:v7];

    objc_destroyWeak(&v9);
  }
}

void __94__PKPaymentTransactionDetailViewController__tableView_didSelectPeerPaymentAction_atIndexPath___block_invoke_3(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __94__PKPaymentTransactionDetailViewController__tableView_didSelectPeerPaymentAction_atIndexPath___block_invoke_4;
  v2[3] = &unk_1E59CB010;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  id v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v2);

  objc_destroyWeak(&v4);
}

void __94__PKPaymentTransactionDetailViewController__tableView_didSelectPeerPaymentAction_atIndexPath___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v3 = [WeakRetained tableView];
    id v4 = [v3 cellForRowAtIndexPath:*(void *)(a1 + 32)];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    [v5 setShowsActionSpinner:0];

    id WeakRetained = v6;
  }
}

uint64_t __94__PKPaymentTransactionDetailViewController__tableView_didSelectPeerPaymentAction_atIndexPath___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __94__PKPaymentTransactionDetailViewController__tableView_didSelectPeerPaymentAction_atIndexPath___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v3 = [WeakRetained tableView];
    id v4 = [v3 cellForRowAtIndexPath:*(void *)(a1 + 32)];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    [v5 setShowsActionSpinner:0];

    id WeakRetained = v6;
  }
}

- (void)_openMessagesToPresentAction:(unint64_t)a3
{
  id v11 = [(PKPaymentTransaction *)self->_transaction peerPaymentCounterpartHandle];
  id v4 = [(PKPaymentTransaction *)self->_transaction subtotalAmount];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(PKPaymentTransaction *)self->_transaction amount];
  }
  id v7 = v6;

  id v8 = [(PKPaymentTransaction *)self->_transaction currencyCode];
  id v9 = PKPeerPaymentGetSendPaymentSensitiveURL();
  if (v9)
  {
    id v10 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v10 openSensitiveURL:v9 withOptions:0];
  }
}

- (void)_openTransactionInIssuerApp
{
  id v3 = self->_paymentPass;
  id v7 = [(PKPaymentPass *)v3 uniqueID];
  id v4 = -[PKPaymentDataProvider transactionsAppLaunchTokenForPassWithUniqueIdentifier:](self->_paymentServiceDataProvider, "transactionsAppLaunchTokenForPassWithUniqueIdentifier:");
  id v5 = +[PKPaymentNotificationAppURLHelper appURLForTransactionNotification:self->_transaction pass:v3 appLaunchToken:v4];

  if (v5)
  {
    id v6 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v6 openURL:v5 configuration:0 completionHandler:0];
  }
}

- (void)_openOfferDetailsInIssuerApp:(id)a3
{
  id v12 = self->_paymentPass;
  id v5 = a3;
  id v6 = [(PKPaymentPass *)v12 uniqueID];
  id v7 = [(PKPaymentDataProvider *)self->_paymentServiceDataProvider transactionsAppLaunchTokenForPassWithUniqueIdentifier:v6];
  id v8 = [v5 identifier];

  if (v8)
  {
    id v9 = [NSString stringWithFormat:@"/offers/%@", v8];
  }
  else
  {
    id v9 = @"/offers";
  }
  id v10 = +[PKPaymentNotificationAppURLHelper appURLForTransactionNotification:self->_transaction excludeTransactionIdentifier:0 pass:v12 pathSuffix:v9 appLaunchToken:v7];
  if (v10)
  {
    id v11 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v11 openURL:v10 configuration:0 completionHandler:0];
  }
}

- (BOOL)_transactionHasNonZeroSecondaryFundingSourceAmount
{
  id v2 = [(PKPaymentTransaction *)self->_transaction secondaryFundingSourceAmount];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F28C28] zero];
    BOOL v4 = [v2 compare:v3] != 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)_presentRecurringPeerPaymentAtIndexPath:(id)a3
{
  id v4 = [(PKPaymentTransaction *)self->_transaction recurringPeerPayment];
  [(PKPaymentTransactionDetailViewController *)self _presentRecurringPeerPayment:v4];
}

- (void)_presentRecurringPeerPayment:(id)a3
{
  id v25 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F84D80]);
  id v5 = [MEMORY[0x1E4F84E10] sharedService];
  id v6 = (void *)[v4 initWithPeerPaymentWebService:v5];

  id v7 = [v6 account];
  int64_t detailViewStyle = self->_detailViewStyle;
  uint64_t v9 = 3;
  if (detailViewStyle != 1) {
    uint64_t v9 = 0;
  }
  if (detailViewStyle == 2) {
    uint64_t v10 = 4;
  }
  else {
    uint64_t v10 = v9;
  }
  uint64_t v11 = [v25 type];
  if (v11 == 3)
  {
    thresholdTopUpController = self->_thresholdTopUpController;
    if (!thresholdTopUpController)
    {
      uint64_t v20 = [PKPeerPaymentThresholdTopUpController alloc];
      paymentPass = self->_paymentPass;
      id v22 = objc_alloc_init(MEMORY[0x1E4F848A0]);
      id v23 = [(PKPeerPaymentThresholdTopUpController *)v20 initWithPeerPaymentAccount:v7 pass:paymentPass context:v10 passLibraryDataProvider:v22 delegate:self];
      id v24 = self->_thresholdTopUpController;
      self->_thresholdTopUpController = v23;

      thresholdTopUpController = self->_thresholdTopUpController;
    }
    [(PKPeerPaymentThresholdTopUpController *)thresholdTopUpController presentTopUpFlowForRecurringPayment:v25];
  }
  else if (v11 == 1)
  {
    id v12 = [v7 recurringPaymentsFeatureDescriptor];
    id v13 = [PKPeerPaymentRecurringPaymentDetailViewController alloc];
    uint64_t v14 = [v25 recipientAddress];
    id v15 = [(PKPeerPaymentRecurringPaymentDetailViewController *)v13 initWithRecurringPayment:v25 recipientAddress:v14 mode:2 context:v10 peerPaymentController:v6 remoteMessagesComposer:0];

    id v16 = [v12 minimumAmount];
    [(PKPeerPaymentRecurringPaymentDetailViewController *)v15 setMinimumAmount:v16];

    id v17 = [v12 maximumAmount];
    [(PKPeerPaymentRecurringPaymentDetailViewController *)v15 setMaximumAmount:v17];

    uint64_t v18 = [(PKPaymentTransactionDetailViewController *)self navigationController];
    [v18 pushViewController:v15 animated:1];
  }
}

- (void)_presentCancelPaymentWithIndexPath:(id)a3
{
  id v4 = a3;
  if (!self->_cancelingPayment)
  {
    self->_cancelingPayment = 1;
    id v5 = (void *)MEMORY[0x1E4FB1418];
    id v6 = PKLocalizedPaymentString(&cfstr_TransactionDet_102.isa);
    id v7 = PKLocalizedPaymentString(&cfstr_TransactionDet_103.isa);
    id v8 = [v5 alertControllerWithTitle:v6 message:v7 preferredStyle:1];

    uint64_t v9 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v10 = PKLocalizedPaymentString(&cfstr_TransactionDet_105.isa);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __79__PKPaymentTransactionDetailViewController__presentCancelPaymentWithIndexPath___block_invoke;
    v16[3] = &unk_1E59CB218;
    v16[4] = self;
    id v17 = v4;
    uint64_t v11 = [v9 actionWithTitle:v10 style:2 handler:v16];
    [v8 addAction:v11];

    id v12 = (void *)MEMORY[0x1E4FB1410];
    id v13 = PKLocalizedPaymentString(&cfstr_TransactionDet_106.isa);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __79__PKPaymentTransactionDetailViewController__presentCancelPaymentWithIndexPath___block_invoke_2;
    v15[3] = &unk_1E59CB1F0;
    v15[4] = self;
    uint64_t v14 = [v12 actionWithTitle:v13 style:1 handler:v15];
    [v8 addAction:v14];

    [(PKPaymentTransactionDetailViewController *)self presentViewController:v8 animated:1 completion:0];
  }
}

void __79__PKPaymentTransactionDetailViewController__presentCancelPaymentWithIndexPath___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tableView];
  id v5 = [v2 cellForRowAtIndexPath:*(void *)(a1 + 40)];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v5;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;
  [v4 setShowsActionSpinner:1];
  [*(id *)(a1 + 32) _cancelPaymentWithCell:v4];
}

uint64_t __79__PKPaymentTransactionDetailViewController__presentCancelPaymentWithIndexPath___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1328) = 0;
  return result;
}

- (void)_cancelPaymentWithCell:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentTransaction *)self->_transaction payments];
  id v6 = [v5 firstObject];

  id v7 = objc_alloc_init(MEMORY[0x1E4F842F8]);
  id v8 = [(PKAccount *)self->_account accountIdentifier];
  [v7 setAccountIdentifier:v8];

  uint64_t v9 = [(PKAccount *)self->_account accountBaseURL];
  [v7 setBaseURL:v9];

  uint64_t v10 = [v6 referenceIdentifier];
  [v7 setPaymentReferenceIdentifier:v10];

  objc_initWeak(&location, self);
  webService = self->_webService;
  if (!webService)
  {
    id v12 = [MEMORY[0x1E4F84D50] sharedService];
    id v13 = self->_webService;
    self->_webService = v12;

    webService = self->_webService;
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__PKPaymentTransactionDetailViewController__cancelPaymentWithCell___block_invoke;
  v15[3] = &unk_1E59D09F0;
  objc_copyWeak(&v17, &location);
  id v14 = v4;
  id v16 = v14;
  [(PKPaymentWebService *)webService cancelPaymentWithRequest:v7 completion:v15];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __67__PKPaymentTransactionDetailViewController__cancelPaymentWithCell___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = v5;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Cancel Payment => %@:%@", buf, 0x16u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__PKPaymentTransactionDetailViewController__cancelPaymentWithCell___block_invoke_784;
  block[3] = &unk_1E59CB378;
  objc_copyWeak(&v12, (id *)(a1 + 40));
  id v10 = *(id *)(a1 + 32);
  id v11 = v6;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __67__PKPaymentTransactionDetailViewController__cancelPaymentWithCell___block_invoke_784(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 1328) = 0;
    [*(id *)(a1 + 32) setShowsActionSpinner:0];
    if (*(void *)(a1 + 40))
    {
      id v4 = (void *)MEMORY[0x1E4FB1418];
      id v5 = PKLocalizedPaymentString(&cfstr_TransactionDet_107.isa);
      id v6 = PKLocalizedPaymentString(&cfstr_TransactionDet_108.isa);
      id v7 = [v4 alertControllerWithTitle:v5 message:v6 preferredStyle:1];

      if (+[PKBusinessChatController deviceSupportsBusinessChat])
      {
        id v8 = (void *)MEMORY[0x1E4FB1410];
        uint64_t v9 = PKLocalizedPaymentString(&cfstr_TransactionDet_109.isa);
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __67__PKPaymentTransactionDetailViewController__cancelPaymentWithCell___block_invoke_2;
        v16[3] = &unk_1E59CB1F0;
        v16[4] = v3;
        id v10 = [v8 actionWithTitle:v9 style:0 handler:v16];
        [v7 addAction:v10];
      }
      id v11 = (void *)MEMORY[0x1E4FB1410];
      id v12 = PKLocalizedPaymentString(&cfstr_TransactionDet_110.isa);
      id v13 = [v11 actionWithTitle:v12 style:1 handler:0];
      [v7 addAction:v13];

      [v3 presentViewController:v7 animated:1 completion:0];
    }
    else
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F84C38]);
      id v14 = v3[175];
      [v14 setTransactionStatus:5];
      __int16 v15 = [v14 transactionSourceIdentifier];
      [v7 insertOrUpdatePaymentTransaction:v14 forTransactionSourceIdentifier:v15 completion:0];
    }
  }
}

void __67__PKPaymentTransactionDetailViewController__cancelPaymentWithCell___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _businessChatContextForNonCancellablePayment];
  [*(id *)(a1 + 32) _openBusinessChatControllerForContext:v2];
}

- (id)_businessChatContextForNonCancellablePayment
{
  familyCollection = self->_familyCollection;
  id v4 = [(PKAccountUser *)self->_accountUser altDSID];
  id v5 = [(PKFamilyMemberCollection *)familyCollection familyMemberForAltDSID:v4];

  id v6 = [PKBusinessChatTransactionDisputeContext alloc];
  id v7 = [(PKTransactionSourceCollection *)self->_transactionSourceCollection paymentPass];
  id v8 = [(PKBusinessChatTransactionDisputeContext *)v6 initWithPaymentPass:v7 transaction:self->_transaction account:self->_account accountUser:self->_accountUser familyMember:v5 physicalCards:self->_physicalCards intent:9];

  return v8;
}

- (id)_businessChatContextForUnavailableDisputeStatus
{
  familyCollection = self->_familyCollection;
  id v4 = [(PKAccountUser *)self->_accountUser altDSID];
  id v5 = [(PKFamilyMemberCollection *)familyCollection familyMemberForAltDSID:v4];

  id v6 = [[PKBusinessChatTransactionDisputeContext alloc] initWithPaymentPass:self->_paymentPass transaction:self->_transaction account:self->_account accountUser:self->_accountUser familyMember:v5 physicalCards:self->_physicalCards intent:10];

  return v6;
}

- (void)_openURL:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __53__PKPaymentTransactionDetailViewController__openURL___block_invoke;
    v5[3] = &unk_1E59E08D0;
    id v6 = v3;
    [v4 openURL:v6 configuration:0 completionHandler:v5];
  }
}

void __53__PKPaymentTransactionDetailViewController__openURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [*(id *)(a1 + 32) absoluteString];
      int v9 = 138412546;
      id v10 = v8;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Failed to open url %@ with error: %@", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (void)_presentReportIssue
{
  if (!PKStoreDemoModeEnabled())
  {
    BOOL v3 = +[PKReportIssueViewController canSelectIssueTypeForTransaction:self->_transaction];
    BOOL v4 = +[PKBusinessChatController deviceSupportsBusinessChat];
    id v5 = self->_paymentPass;
    if ([(PKPaymentPass *)v5 isAppleCardPass]) {
      BOOL v6 = !v4;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      if (v3)
      {
        id v7 = [[PKReportIssueViewController alloc] initWithTransaction:self->_transaction transactionSourceCollection:self->_transactionSourceCollection paymentPass:v5 familyCollection:self->_familyCollection account:self->_account accountUserCollection:self->_accountUserCollection bankConnectInstitution:self->_bankConnectInstitution physicalCards:self->_physicalCards detailViewStyle:self->_detailViewStyle context:0];
        id v8 = [[PKNavigationController alloc] initWithRootViewController:v7];
        [(PKPaymentTransactionDetailViewController *)self presentViewController:v8 animated:1 completion:0];
LABEL_30:

LABEL_32:
LABEL_33:

        return;
      }
      uint64_t v13 = [(PKPaymentPass *)v5 businessChatIdentifier];
      if (!v13) {
        BOOL v4 = 0;
      }

      if (!v4) {
        goto LABEL_33;
      }
      if ([(PKPaymentTransaction *)self->_transaction transactionType] == 10) {
        uint64_t v14 = 9;
      }
      else {
        uint64_t v14 = 5;
      }
      id v7 = [(PKAccountUserCollection *)self->_accountUserCollection accountUserForTransaction:self->_transaction];
      familyCollection = self->_familyCollection;
      id v16 = [(PKReportIssueViewController *)v7 altDSID];
      id v8 = [(PKFamilyMemberCollection *)familyCollection familyMemberForAltDSID:v16];

      uint64_t v17 = [[PKBusinessChatTransactionDisputeContext alloc] initWithPaymentPass:v5 transaction:self->_transaction account:self->_account accountUser:v7 familyMember:v8 physicalCards:self->_physicalCards intent:v14];
      [(PKPaymentTransactionDetailViewController *)self _openBusinessChatControllerForContext:v17];
LABEL_29:

      goto LABEL_30;
    }
    int v9 = [(PKPaymentPass *)v5 associatedAccountServiceAccountIdentifier];
    id v10 = [(PKAccount *)self->_account accountIdentifier];
    __int16 v11 = v9;
    id v7 = v11;
    if (v10 != v11)
    {
      if (v11) {
        BOOL v12 = v10 == 0;
      }
      else {
        BOOL v12 = 1;
      }
      if (v12)
      {
      }
      else
      {
        char v18 = [(PKReportIssueViewController *)v10 isEqualToString:v11];

        if (v18) {
          goto LABEL_28;
        }
      }
      objc_initWeak(&location, self);
      accountService = self->_accountService;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __63__PKPaymentTransactionDetailViewController__presentReportIssue__block_invoke;
      v21[3] = &unk_1E59CFFF8;
      objc_copyWeak(&v22, &location);
      [(PKAccountService *)accountService accountWithIdentifier:v7 completion:v21];
      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
      goto LABEL_32;
    }

LABEL_28:
    id v8 = [[PKTransactionSupportTopicsViewController alloc] initWithAccount:self->_account transaction:self->_transaction transactionSourceCollection:self->_transactionSourceCollection familyCollection:self->_familyCollection accountUserCollection:self->_accountUserCollection physicalCards:self->_physicalCards];
    uint64_t v17 = [[PKNavigationController alloc] initWithRootViewController:v8];
    [(PKPaymentTransactionDetailViewController *)self presentViewController:v17 animated:1 completion:0];
    goto LABEL_29;
  }
  PKUIStoreDemoGatewayViewController();
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  [(PKPaymentTransactionDetailViewController *)self presentViewController:v20 animated:1 completion:0];
}

void __63__PKPaymentTransactionDetailViewController__presentReportIssue__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__PKPaymentTransactionDetailViewController__presentReportIssue__block_invoke_2;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __63__PKPaymentTransactionDetailViewController__presentReportIssue__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && *(void *)(a1 + 32))
  {
    id v5 = WeakRetained;
    id v3 = [[PKTransactionSupportTopicsViewController alloc] initWithAccount:*(void *)(a1 + 32) transaction:v5[175] transactionSourceCollection:v5[176] familyCollection:v5[153] accountUserCollection:v5[155] physicalCards:v5[157]];
    id v4 = [[PKNavigationController alloc] initWithRootViewController:v3];
    [v5 presentViewController:v4 animated:1 completion:0];

    id WeakRetained = v5;
  }
}

- (void)_presentContactViewController
{
  if (self->_accountResolutionController)
  {
    accountUserCollection = self->_accountUserCollection;
    transaction = self->_transaction;
    id v5 = self->_paymentPass;
    id v11 = [(PKAccountUserCollection *)accountUserCollection accountUserForTransaction:transaction];
    familyCollection = self->_familyCollection;
    id v7 = [v11 altDSID];
    id v8 = [(PKFamilyMemberCollection *)familyCollection familyMemberForAltDSID:v7];

    int v9 = [[PKBusinessChatTransactionDisputeContext alloc] initWithPaymentPass:v5 transaction:self->_transaction account:self->_account accountUser:v11 familyMember:v8 physicalCards:self->_physicalCards intent:6];
    id v10 = objc_alloc_init(MEMORY[0x1E4F84278]);
    [v10 setBusinessChatContext:v9];
    [(PKAccountServiceAccountResolutionController *)self->_accountResolutionController presentFlowForAccountResolution:2 configuration:v10 completion:0];
  }
  else
  {
    [(PKPaymentTransactionDetailViewController *)self _presentContactIssuer];
  }
}

- (void)_cancelPeerPaymentPendingRequest
{
  id v3 = [(PKPaymentTransactionDetailViewController *)self _peerPaymentController];
  id v4 = [(PKPaymentTransaction *)self->_transaction identifier];
  uint64_t v5 = *MEMORY[0x1E4F87C90];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __76__PKPaymentTransactionDetailViewController__cancelPeerPaymentPendingRequest__block_invoke;
  v7[3] = &unk_1E59E08F8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v3 performPendingRequestAction:v5 withRequestToken:v6 completion:v7];
}

void __76__PKPaymentTransactionDetailViewController__cancelPeerPaymentPendingRequest__block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__PKPaymentTransactionDetailViewController__cancelPeerPaymentPendingRequest__block_invoke_2;
  v10[3] = &unk_1E59DF6E8;
  objc_copyWeak(&v14, &location);
  char v15 = a2;
  id v11 = v6;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  id v12 = v7;
  uint64_t v13 = v8;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v10);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __76__PKPaymentTransactionDetailViewController__cancelPeerPaymentPendingRequest__block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (*(unsigned char *)(a1 + 64) || (id v6 = *(void **)(a1 + 32)) == 0)
    {
      id v4 = [*(id *)(a1 + 48) navigationController];
      id v5 = (id)[v4 popToRootViewControllerAnimated:1];
    }
    else
    {
      id v7 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = [v6 localizedDescription];
        *(_DWORD *)buf = 138412290;
        int v19 = v8;
        _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "PKPaymentTransactionDetailViewController: Error attempting to cancel pending request: %@", buf, 0xCu);
      }
      id v9 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPen_11.isa);
      id v10 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v9 message:0 preferredStyle:1];
      id v11 = (void *)MEMORY[0x1E4FB1410];
      id v12 = PKLocalizedString(&cfstr_OkButtonTitle.isa);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      id v14[2] = __76__PKPaymentTransactionDetailViewController__cancelPeerPaymentPendingRequest__block_invoke_808;
      v14[3] = &unk_1E59DA050;
      objc_copyWeak(&v17, v2);
      id v15 = *(id *)(a1 + 32);
      id v16 = *(id *)(a1 + 40);
      uint64_t v13 = [v11 actionWithTitle:v12 style:0 handler:v14];

      [v10 addAction:v13];
      [WeakRetained presentViewController:v10 animated:1 completion:0];

      objc_destroyWeak(&v17);
    }
  }
}

void __76__PKPaymentTransactionDetailViewController__cancelPeerPaymentPendingRequest__block_invoke_808(uint64_t a1)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = [*(id *)(a1 + 32) userInfo];
    id v4 = [v3 objectForKey:*MEMORY[0x1E4F28A50]];
    id v5 = [v4 domain];
    int v6 = [v5 isEqualToString:*MEMORY[0x1E4F87CD8]];

    if (v6)
    {
      uint64_t v7 = [v4 code];
      if ((unint64_t)(v7 - 40314) <= 0x13 && ((1 << (v7 - 122)) & 0xC0003) != 0)
      {
        id v9 = [WeakRetained[138] peerPaymentService];
        v13[0] = *(void *)(a1 + 40);
        id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
        [v9 deletePeerPaymentPendingRequestsForRequestTokens:v10];
      }
    }
    id v11 = [WeakRetained navigationController];
    id v12 = (id)[v11 popToRootViewControllerAnimated:1];
  }
}

- (void)_openBusinessChatControllerForContext:(id)a3
{
  if (self->_accountResolutionController)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F84278];
    id v5 = a3;
    id v6 = objc_alloc_init(v4);
    [v6 setBusinessChatContext:v5];

    [(PKAccountServiceAccountResolutionController *)self->_accountResolutionController presentFlowForAccountResolution:3 configuration:v6 completion:0];
  }
}

- (id)_transactionStatusString
{
  peerPaymentStatusResponse = self->_peerPaymentStatusResponse;
  if (!peerPaymentStatusResponse
    || [(PKPeerPaymentStatusResponse *)peerPaymentStatusResponse status] == -1
    || (uint64_t v4 = PKPaymentTransactionStatusFromPeerPaymentStatus(), v4 == -1))
  {
    uint64_t v5 = [(PKPaymentTransaction *)self->_transaction transactionStatus];
  }
  else
  {
    uint64_t v5 = v4;
  }
  if ((unint64_t)([(PKPaymentTransaction *)self->_transaction disputeStatus] - 1) > 4)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = PKLocalizedFeatureString();
  }
  uint64_t v7 = [(PKPaymentTransaction *)self->_transaction transactionType];
  uint64_t v8 = [(PKPaymentTransaction *)self->_transaction featureIdentifier];
  if (v6) {
    goto LABEL_37;
  }
  switch(v5)
  {
    case 0:
    case 8:
      if (v7 != 2)
      {
        if (v8 == 2)
        {
          if (v7 != 10) {
            goto LABEL_31;
          }
        }
        else if (v8 != 5)
        {
          goto LABEL_31;
        }
        uint64_t v9 = PKLocalizedFeatureString();
        goto LABEL_36;
      }
      if ([(PKPaymentTransaction *)self->_transaction enRoute]) {
        goto LABEL_13;
      }
LABEL_31:
      id v10 = @"TRANSACTION_DETAIL_STATUS_VALUE_PENDING";
LABEL_35:
      uint64_t v9 = PKLocalizedPeerPaymentString(&v10->isa);
LABEL_36:
      id v6 = (void *)v9;
LABEL_37:
      return v6;
    case 1:
      switch(v7)
      {
        case 1:
          goto LABEL_20;
        case 10:
          break;
        case 3:
          if ([(PKPaymentTransaction *)self->_transaction peerPaymentStatus] != 1)
          {
LABEL_40:
            id v12 = [(PKPaymentTransaction *)self->_transaction transfers];
            uint64_t v13 = [v12 firstObject];

            if (v13)
            {
              if (![v13 fundsAreAvailable])
              {
                uint64_t v14 = PKLocalizedFeatureString();
LABEL_48:
                id v6 = (void *)v14;

                goto LABEL_37;
              }
            }
            else
            {
              id v15 = [(PKPaymentTransaction *)self->_transaction accountIdentifier];

              if (v15)
              {
                id v16 = @"TRANSACTION_DETAIL_STATUS_VALUE_CLEARED";
LABEL_47:
                uint64_t v14 = PKLocalizedPeerPaymentString(&v16->isa);
                goto LABEL_48;
              }
              id v17 = [(PKPaymentTransaction *)self->_transaction barcodeIdentifier];

              if (!v17)
              {
                id v16 = @"TRANSACTION_DETAIL_STATUS_VALUE_APPROVED";
                goto LABEL_47;
              }
            }
            id v16 = @"TRANSACTION_DETAIL_STATUS_VALUE_COMPLETED";
            goto LABEL_47;
          }
          break;
        case 2:
          if ([(PKPaymentTransaction *)self->_transaction enRoute])
          {
LABEL_13:
            uint64_t v9 = PKLocalizedPaymentString(&cfstr_TransitTransac_7.isa);
            goto LABEL_36;
          }
          break;
        default:
          goto LABEL_40;
      }
      id v10 = @"TRANSACTION_DETAIL_STATUS_VALUE_COMPLETED";
      goto LABEL_35;
    case 2:
      id v10 = @"TRANSACTION_DETAIL_STATUS_VALUE_DECLINED";
      goto LABEL_35;
    case 3:
LABEL_20:
      id v10 = @"TRANSACTION_DETAIL_STATUS_VALUE_REFUNDED";
      goto LABEL_35;
    case 4:
      id v10 = @"TRANSACTION_DETAIL_STATUS_VALUE_FAILED";
      goto LABEL_35;
    case 5:
      id v10 = @"TRANSACTION_DETAIL_STATUS_VALUE_CANCELED";
      goto LABEL_35;
    case 6:
      id v10 = @"TRANSACTION_DETAIL_STATUS_VALUE_REJECTED";
      goto LABEL_35;
    case 7:
      id v10 = @"TRANSACTION_DETAIL_STATUS_VALUE_EXPIRED";
      goto LABEL_35;
    default:
      id v6 = 0;
      goto LABEL_37;
  }
}

- (void)transactionsChanged:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [(PKPaymentTransaction *)self->_transaction identifier];
        id v11 = [v9 identifier];
        int v12 = PKEqualObjects();

        if (v12)
        {
          [(PKPaymentTransactionDetailViewController *)self setTransaction:v9];
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (id)_merchantAddressCellForTableView:(id)a3
{
  id v4 = [a3 dequeueReusableCellWithIdentifier:@"PKPaymentTransactionLocationMapCellReuseIdentifier"];
  [v4 setTransaction:self->_transaction];
  if (self->_inBridge)
  {
    uint64_t v5 = PKBridgeAppearanceGetAppearanceSpecifier();
    uint64_t v6 = [v5 textColor];
    [v4 setTitleLabelColor:v6];

    BOOL inBridge = self->_inBridge;
  }
  else
  {
    BOOL inBridge = 0;
  }
  [v4 setUsesDarkMapAppearance:inBridge];

  return v4;
}

- (id)_mapTilePlaceholderImage
{
  mapTilePlaceholderImage = self->_mapTilePlaceholderImage;
  if (!mapTilePlaceholderImage)
  {
    PKUIImageNamed(@"MapTilePlaceholder");
    id v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = self->_mapTilePlaceholderImage;
    self->_mapTilePlaceholderImage = v4;

    mapTilePlaceholderImage = self->_mapTilePlaceholderImage;
  }

  return mapTilePlaceholderImage;
}

- (void)_tableView:(id)a3 didSelectMechantAddressAtIndexPath:(id)a4
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 cellForRowAtIndexPath:v7];
  uint64_t v9 = self->_transaction;
  id v10 = [(PKPaymentTransaction *)v9 merchant];
  id v11 = [v10 mapsMerchant];

  uint64_t v12 = [v11 identifier];
  uint64_t v13 = [v11 resultProviderIdentifier];
  if (v12)
  {
    uint64_t v14 = v13;
    id v15 = objc_alloc_init(MEMORY[0x1E4F30EF0]);
    long long v16 = [NSNumber numberWithUnsignedLongLong:v12];
    v33[0] = v16;
    id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
    [v15 _setMuids:v17];

    if ((int)v14 >= 1) {
      [v15 _setResultProviderID:v14];
    }
    uint64_t v18 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
    dispatch_time_t v19 = dispatch_time(0, 1000000000);
    dispatch_source_set_timer(v18, v19, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __90__PKPaymentTransactionDetailViewController__tableView_didSelectMechantAddressAtIndexPath___block_invoke;
    handler[3] = &unk_1E59CA870;
    uint64_t v20 = v18;
    BOOL v31 = v20;
    id v21 = v8;
    id v32 = v21;
    dispatch_source_set_event_handler(v20, handler);
    dispatch_resume(v20);
    [v21 setUserInteractionEnabled:0];
    objc_initWeak(&location, self);
    id v22 = (void *)[objc_alloc(MEMORY[0x1E4F30ED8]) initWithRequest:v15];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __90__PKPaymentTransactionDetailViewController__tableView_didSelectMechantAddressAtIndexPath___block_invoke_2;
    v24[3] = &unk_1E59E0920;
    id v23 = v20;
    id v25 = v23;
    objc_copyWeak(&v28, &location);
    id v26 = v21;
    id v27 = v11;
    [v22 startWithCompletionHandler:v24];

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
}

uint64_t __90__PKPaymentTransactionDetailViewController__tableView_didSelectMechantAddressAtIndexPath___block_invoke(uint64_t a1)
{
  id v2 = *(NSObject **)(a1 + 32);
  if (v2) {
    dispatch_source_cancel(v2);
  }
  id v3 = *(void **)(a1 + 40);

  return [v3 setShowsActionSpinner:1];
}

void __90__PKPaymentTransactionDetailViewController__tableView_didSelectMechantAddressAtIndexPath___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(a1 + 32);
  if (v7) {
    dispatch_source_cancel(v7);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if ([WeakRetained isViewLoaded])
  {
    [*(id *)(a1 + 40) setShowsActionSpinner:0];
    [*(id *)(a1 + 40) setUserInteractionEnabled:1];
    if (v6
      || ([v5 mapItems],
          uint64_t v12 = objc_claimAutoreleasedReturnValue(),
          uint64_t v13 = [v12 count],
          v12,
          !v13))
    {
      uint64_t v9 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = [*(id *)(a1 + 48) identifier];
        if (v6)
        {
          id v11 = [v6 localizedDescription];
        }
        else
        {
          id v11 = @"no map items.";
        }
        *(_DWORD *)buf = 134218242;
        uint64_t v24 = v10;
        __int16 v25 = 2112;
        id v26 = v11;
        _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "PKPaymentTransactionDetailViewController: MKLocalSearch could not resolve merchant maps for mapsID: %llu. Error: %@", buf, 0x16u);
        if (v6) {
      }
        }
    }
    else if (WeakRetained[136] == 2)
    {
      uint64_t v14 = (void *)MEMORY[0x1E4F30F08];
      id v15 = [v5 mapItems];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __90__PKPaymentTransactionDetailViewController__tableView_didSelectMechantAddressAtIndexPath___block_invoke_3;
      v21[3] = &unk_1E59CB6D8;
      id v22 = *(id *)(a1 + 48);
      [v14 openMapsWithItems:v15 launchOptions:0 completionHandler:v21];
    }
    else
    {
      long long v16 = [PKMerchantMapViewController alloc];
      id v17 = [v5 mapItems];
      uint64_t v18 = [v17 firstObject];
      dispatch_time_t v19 = [(PKMerchantMapViewController *)v16 initWithMapItem:v18 configOptions:129];

      uint64_t v20 = [WeakRetained navigationController];
      [v20 pushViewController:v19 animated:1];
    }
  }
}

void __90__PKPaymentTransactionDetailViewController__tableView_didSelectMechantAddressAtIndexPath___block_invoke_3(uint64_t a1, char a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ((a2 & 1) == 0)
  {
    id v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = [*(id *)(a1 + 32) identifier];
      int v5 = 134217984;
      uint64_t v6 = v4;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Bridge failed to launch Maps with merchant maps identifier: %llu", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)_handleCoarseLocationChangedNotification:(id)a3
{
  uint64_t v4 = [a3 object];
  coarseLocationMonitor = self->_coarseLocationMonitor;

  if (v4 == coarseLocationMonitor)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __85__PKPaymentTransactionDetailViewController__handleCoarseLocationChangedNotification___block_invoke;
    block[3] = &unk_1E59CA7D0;
    void block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __85__PKPaymentTransactionDetailViewController__handleCoarseLocationChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isSectionMapped:7];
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 reloadSection:7];
  }
  return result;
}

- (unint64_t)_amountDetailsRowForIndex:(unint64_t)a3
{
  unint64_t v5 = 0;
  uint64_t v6 = 0;
  do
  {
    if ([(PKPaymentTransactionDetailViewController *)self _amountDetailsRowIsEnabled:v5])
    {
      if (v6 == a3) {
        break;
      }
      ++v6;
    }
    ++v5;
  }
  while (v5 != 5);
  if (v5 >= 4) {
    return 4;
  }
  else {
    return v5;
  }
}

- (unint64_t)_numberOfAmountDetailsRows
{
  uint64_t v3 = 0;
  unint64_t v4 = 0;
  while (![(PKPaymentTransactionDetailViewController *)self _amountDetailsRowIsEnabled:v3])
  {
LABEL_5:
    if (++v3 == 5) {
      return v4;
    }
  }
  if (v3 != 4)
  {
    ++v4;
    goto LABEL_5;
  }
  v4 += [(NSArray *)self->_lineItems count];
  return v4;
}

- (BOOL)_amountDetailsRowIsEnabled:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      unint64_t v4 = [(PKPaymentTransaction *)self->_transaction associatedFinancingPlan];
      BOOL v5 = v4 != 0;

      return v5;
    case 1uLL:
      if ([(PKPaymentTransaction *)self->_transaction transactionType] == 2)
      {
        uint64_t v6 = [(PKPaymentTransaction *)self->_transaction transitType];
        return MEMORY[0x1F413B5F0](v6);
      }
      else
      {
        return 1;
      }
    case 2uLL:
      BOOL v7 = self->_transactionExplanation == 0;
      return !v7;
    case 3uLL:
      merchantTokenResponse = self->_merchantTokenResponse;
      if (!merchantTokenResponse) {
        return 0;
      }
      uint64_t v9 = [(PKRetrieveMerchantTokensResponse *)merchantTokenResponse merchantTokens];
      BOOL v5 = [v9 count] == 0;

      return v5;
    case 4uLL:
      BOOL v7 = [(NSArray *)self->_lineItems count] == 0;
      return !v7;
    default:
      return 0;
  }
}

- (unint64_t)_lineItemItemForRowIndex:(unint64_t)a3
{
  unint64_t v5 = [(PKPaymentTransactionDetailViewController *)self _numberOfAmountDetailsRows];
  return a3 - v5 + [(NSArray *)self->_lineItems count];
}

- (void)_applyAmountDetailSeparatorInsetForTableView:(id)a3 cell:(id)a4
{
  id v7 = a4;
  [v7 separatorInset];
  double v6 = fmax(v4, v5);
  objc_msgSend(v7, "setSeparatorInset:", 0.0, v6, 0.0, v6);
}

- (id)_amountDetailsCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  switch(-[PKPaymentTransactionDetailViewController _amountDetailsRowForIndex:](self, "_amountDetailsRowForIndex:", [v7 row]))
  {
    case 0uLL:
      uint64_t v8 = [(PKPaymentTransactionDetailViewController *)self _financingPlanDetailsCellForTableView:v6];
      goto LABEL_8;
    case 1uLL:
      uint64_t v8 = [(PKPaymentTransactionDetailViewController *)self _statusCellForTableView:v6];
      goto LABEL_8;
    case 2uLL:
      uint64_t v9 = [v6 dequeueReusableCellWithIdentifier:@"PKPaymentTransactionTransactionExplanationCellReuseIdentifier" forIndexPath:v7];
      uint64_t v10 = [v9 textLabel];
      [v10 setNumberOfLines:0];
      id v11 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      [v10 setTextColor:v11];

      [v10 setText:self->_transactionExplanation];
      [v10 setAccessibilityIdentifier:*MEMORY[0x1E4F85A60]];
      [(PKPaymentTransactionDetailViewController *)self _applyAmountDetailSeparatorInsetForTableView:v6 cell:v9];

      break;
    case 3uLL:
      uint64_t v8 = [(PKPaymentTransactionDetailViewController *)self _merchantTokenDeletedCellForTableView:v6 atIndexPath:v7];
      goto LABEL_8;
    case 4uLL:
      uint64_t v8 = -[PKPaymentTransactionDetailViewController _tableView:cellForAmountDetailLineItemAtIndex:atIndexPath:](self, "_tableView:cellForAmountDetailLineItemAtIndex:atIndexPath:", v6, -[PKPaymentTransactionDetailViewController _lineItemItemForRowIndex:](self, "_lineItemItemForRowIndex:", [v7 row]), v7);
LABEL_8:
      uint64_t v9 = (void *)v8;
      break;
    default:
      uint64_t v9 = 0;
      break;
  }

  return v9;
}

- (id)_questionCellForTableView:(id)a3 atIndexPath:(id)a4
{
  double v5 = [a3 dequeueReusableCellWithIdentifier:@"PKPaymentTransactionQuestionCellReuseIdentifier" forIndexPath:a4];
  id v6 = [(PKPaymentTransaction *)self->_transaction altDSID];
  if (!v6) {
    goto LABEL_5;
  }
  id v7 = PKCurrentUserAltDSID();
  id v8 = v6;
  id v9 = v7;
  if (v8 == v9)
  {
    uint64_t v12 = 0;
    uint64_t v13 = v8;
    uint64_t v14 = v8;
  }
  else
  {
    uint64_t v10 = v9;
    if (v9)
    {
      char v11 = [v8 isEqualToString:v9];

      if (v11)
      {
LABEL_5:
        uint64_t v12 = 0;
        goto LABEL_10;
      }
    }
    else
    {
    }
    uint64_t v14 = [(PKAccountUserCollection *)self->_accountUserCollection accountUserWithAltDSID:v8];
    uint64_t v13 = [(PKFamilyMemberCollection *)self->_familyCollection familyMemberForAltDSID:v8];
    id v15 = (void *)MEMORY[0x1E4F845E8];
    id v8 = [v14 nameComponents];
    uint64_t v12 = [v15 contactForFamilyMember:v13 nameComponents:v8 imageData:0];
  }

LABEL_10:
  [v5 setTransaction:self->_transaction accountUserContact:v12 submittingAnswer:self->_submittingAnswer];
  [v5 setQuestionDelegate:self];

  return v5;
}

- (id)_statusCellForTableView:(id)a3
{
  id v192 = a3;
  double v4 = self->_paymentPass;
  double v5 = [(PKPaymentPass *)v4 localizedDescription];
  id v6 = &OBJC_IVAR___PKSegmentedBarView__placeholder;
  if (!v5)
  {
    id v7 = [(PKTransactionSourceCollection *)self->_transactionSourceCollection transactionSourcesForType:1];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      id v9 = [MEMORY[0x1E4F84898] sharedInstance];
      uint64_t v10 = [MEMORY[0x1E4F84E00] sharedInstance];
      char v11 = [v10 account];
      uint64_t v12 = [v11 associatedPassUniqueID];
      uint64_t v13 = [v9 passWithUniqueID:v12];
      uint64_t v14 = [v13 localizedDescription];

      double v5 = (void *)v14;
    }
    else
    {
      double v5 = 0;
    }
  }
  v193 = v4;
  uint64_t v15 = [(PKAccount *)self->_account feature];
  if (v5) {
    BOOL v16 = 0;
  }
  else {
    BOOL v16 = v15 == 5;
  }
  if (v16)
  {
    double v5 = PKLocalizedFeatureString();
  }
  id v17 = 0;
  uint64_t v18 = 0;
  v194 = 0;
  v196 = 0;
  dispatch_time_t v19 = 0;
  uint64_t v20 = 0;
  switch([(PKPaymentTransaction *)self->_transaction transactionType])
  {
    case 0:
    case 17:
      uint64_t v20 = [(PKPaymentTransactionDetailViewController *)self _transactionStatusString];
      uint64_t v22 = [(PKPaymentTransaction *)self->_transaction transactionStatus];
      transaction = self->_transaction;
      if (v22 == 2)
      {
        uint64_t v24 = [(PKPaymentTransaction *)transaction transactionDeclinedReason];
        __int16 v25 = self->_transaction;
        if (v24 == 14)
        {
          uint64_t v26 = [(PKPaymentTransaction *)v25 cardType];
          if (v26 == 6 || v26 == 5)
          {
            uint64_t v100 = PKLocalizedFeatureString();
          }
          else
          {
            uint64_t v100 = PKPaymentTransactionDeclinedReasonLocalizedString();
          }
          dispatch_time_t v19 = (void *)v100;
          if (v100)
          {
            id v17 = [MEMORY[0x1E4FB1618] systemRedColor];
            goto LABEL_154;
          }
          goto LABEL_141;
        }
        uint64_t v56 = v20;
        uint64_t v57 = [(PKPaymentTransaction *)v25 unansweredQuestions];
        uint64_t v58 = [v57 count];

        if (v58)
        {
          uint64_t v59 = PKLocalizedFeatureString();
          id v17 = [MEMORY[0x1E4FB1618] systemRedColor];
          uint64_t v20 = v56;
          id v6 = &OBJC_IVAR___PKSegmentedBarView__placeholder;
          dispatch_time_t v19 = (void *)v59;
          goto LABEL_67;
        }
        uint64_t v81 = [(PKPaymentTransaction *)self->_transaction questions];
        uint64_t v82 = [v81 count];

        if (v82)
        {
          if ([(PKPaymentTransaction *)self->_transaction reviewed])
          {
            PKLocalizedFeatureString();
            id v17 = 0;
            uint64_t v20 = v56;
            dispatch_time_t v19 = v6 = &OBJC_IVAR___PKSegmentedBarView__placeholder;
            goto LABEL_67;
          }
        }
        else
        {
          uint64_t v133 = PKPaymentTransactionDeclinedReasonLocalizedString();
          if (v133)
          {
            v134 = (void *)v133;
            id v17 = [MEMORY[0x1E4FB1618] systemRedColor];
            uint64_t v18 = 0;
            v194 = 0;
            v196 = 0;
            uint64_t v20 = v56;
            id v6 = &OBJC_IVAR___PKSegmentedBarView__placeholder;
            dispatch_time_t v19 = v134;
            goto LABEL_156;
          }
        }
        id v17 = 0;
        uint64_t v20 = v56;
        id v6 = &OBJC_IVAR___PKSegmentedBarView__placeholder;
        goto LABEL_142;
      }
      v54 = [(PKPaymentTransaction *)transaction unansweredQuestions];
      uint64_t v55 = [v54 count];

      if (v55 || [(PKPaymentTransaction *)self->_transaction reviewed])
      {
        dispatch_time_t v19 = PKLocalizedFeatureString();
      }
      else
      {
        v97 = [(PKPaymentTransaction *)self->_transaction primaryFundingSourceDescription];

        id v98 = self->_transaction;
        if (!v97)
        {
          v135 = [(PKPaymentTransaction *)v98 transfers];
          uint64_t v136 = [v135 count];

          if (!v136)
          {
LABEL_141:
            id v17 = 0;
LABEL_142:
            uint64_t v147 = [(PKPaymentTransaction *)self->_transaction effectiveTransactionSource];
            if (v147 == 6 || v147 == 5)
            {
              PKLocalizedFeatureString();
              id v148 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              id v148 = v5;
            }
            dispatch_time_t v19 = v148;
            uint64_t v149 = [(PKPaymentTransaction *)self->_transaction cardNumberSuffix];
            if (v149)
            {
              v194 = PKMaskedPaymentPAN();
            }
            else
            {
              v194 = 0;
            }

            uint64_t v18 = 0;
            v196 = 0;
            goto LABEL_156;
          }
          BOOL v137 = v20;
          v138 = [(PKPaymentTransaction *)self->_transaction transfers];
          v139 = [v138 firstObject];

          v140 = [v139 externalAccount];
          uint64_t v141 = [(PKPaymentTransaction *)self->_transaction featureIdentifier];
          uint64_t v142 = [(PKPaymentTransaction *)self->_transaction associatedFeatureIdentifier];
          uint64_t v143 = 0;
          if (v141 == 1 && v142)
          {
            v144 = PKLocalizedFeatureString();
            [v140 displayDescription];
            v146 = v145 = v5;
            uint64_t v143 = PKLocalizedPeerPaymentString(&cfstr_TransactionDet_129.isa, &stru_1EF1B5770.isa, v146, v144);

            double v5 = v145;
          }

          id v17 = 0;
          uint64_t v20 = v137;
          id v6 = &OBJC_IVAR___PKSegmentedBarView__placeholder;
          dispatch_time_t v19 = (void *)v143;
LABEL_67:
          if (v19) {
            goto LABEL_154;
          }
          goto LABEL_142;
        }
        v99 = [(PKPaymentTransaction *)v98 primaryFundingSourceDescription];
        dispatch_time_t v19 = PKLocalizedPeerPaymentString(&cfstr_TransactionDet_128.isa, &stru_1EF1B4C70.isa, v99);
      }
      id v17 = 0;
      goto LABEL_67;
    case 1:
      uint64_t v27 = PKLocalizedPaymentString(&cfstr_RefundedPurcha_0.isa);
      goto LABEL_23;
    case 2:
      uint64_t v20 = [(PKPaymentTransactionDetailViewController *)self _transactionStatusString];
      int v31 = [(PKPaymentTransaction *)self->_transaction transitModifiers];
      if ((v31 & 1) == 0)
      {
        if ((~v31 & 6) != 0)
        {
          if ((v31 & 2) != 0)
          {
            id v32 = @"TRANSIT_TRANSACTION_TRANSFER";
          }
          else if ((v31 & 4) != 0)
          {
            id v32 = @"TRANSIT_TRANSACTION_ANNOTATION_FARECAPPED_DISCOUNT";
          }
          else
          {
            if ([(PKPaymentTransaction *)self->_transaction transitType] != 1026)
            {
              v173 = [(PKPaymentPass *)v4 localizedDescription];
              uint64_t v174 = PKLocalizedPeerPaymentString(&cfstr_TransactionDet_128.isa, &stru_1EF1B4C70.isa, v173);

              id v17 = 0;
              uint64_t v18 = 0;
              v194 = 0;
              v196 = 0;
              dispatch_time_t v19 = 0;
              uint64_t v20 = (void *)v174;
              goto LABEL_156;
            }
            id v32 = @"TRANSIT_TRANSACTION_ANNOTATION_NO_CHARGE";
          }
        }
        else
        {
          id v32 = @"TRANSIT_TRANSACTION_ANNOTATION_FARECAPPED_TRANSFER_DISCOUNT";
        }
        uint64_t v30 = PKLocalizedPaymentString(&v32->isa);
        goto LABEL_152;
      }
      id v28 = PKPassLocalizedStringWithFormat();
      uint64_t v29 = PKLocalizedPeerPaymentString(&cfstr_TransactionDet_128.isa, &stru_1EF1B4C70.isa, v28);
LABEL_54:
      dispatch_time_t v19 = (void *)v29;

      goto LABEL_153;
    case 3:
      v183 = v5;
      uint64_t v33 = [(PKPaymentTransaction *)self->_transaction peerPaymentCounterpartHandle];
      if ([(PKPaymentTransaction *)self->_transaction peerPaymentPaymentMode] == 2)
      {
        id v34 = v33;
        id v35 = 0;
      }
      else
      {
        int v60 = [(PKContactResolver *)self->_contactResolver hasCachedResultForHandle:v33];
        contactResolver = self->_contactResolver;
        if (v60)
        {
          id v35 = [(PKContactResolver *)contactResolver contactForHandle:v33];
        }
        else
        {
          v200[0] = MEMORY[0x1E4F143A8];
          v200[1] = 3221225472;
          v200[2] = __68__PKPaymentTransactionDetailViewController__statusCellForTableView___block_invoke;
          v200[3] = &unk_1E59D25A8;
          v200[4] = self;
          [(PKContactResolver *)contactResolver contactForHandle:v33 withCompletion:v200];
          id v35 = 0;
        }
        id v34 = [MEMORY[0x1E4F84D88] displayNameForCounterpartHandle:v33 contact:v35];
      }
      uint64_t v20 = [(PKPaymentTransactionDetailViewController *)self _transactionStatusString];
      switch([(PKPaymentTransaction *)self->_transaction peerPaymentType])
      {
        case 0:
          id v72 = v34;
          goto LABEL_85;
        case 1:
          unint64_t v73 = v20;
          id v74 = @"TRANSACTION_DETAIL_STATUS_SUBTITLE_SENT_TO_CONTACT_NAME_FORMAT";
          if (!v35) {
            id v74 = @"TRANSACTION_DETAIL_STATUS_SUBTITLE_SENT_TO_HANDLE_FORMAT";
          }
          uint64_t v75 = self->_transaction;
          __int16 v76 = v74;
          if ([(PKPaymentTransaction *)v75 isRecurring])
          {
            int v77 = PKLocalizedPeerPaymentRecurringString(v76, &stru_1EF1B4C70.isa, v34);

LABEL_111:
            uint64_t v20 = v73;
            id v6 = &OBJC_IVAR___PKSegmentedBarView__placeholder;
            dispatch_time_t v19 = v77;
            goto LABEL_114;
          }
          int v77 = PKLocalizedPeerPaymentString(v76, &stru_1EF1B4C70.isa, v34);

          if ([(PKPaymentTransaction *)self->_transaction peerPaymentPaymentMode] != 2) {
            goto LABEL_111;
          }
          uint64_t v80 = PKLocalizedNearbyPeerPaymentString(&cfstr_TransactionDet_133.isa, &stru_1EF1B4C70.isa, v77);

LABEL_109:
          uint64_t v20 = v73;
          id v6 = &OBJC_IVAR___PKSegmentedBarView__placeholder;
LABEL_110:
          dispatch_time_t v19 = (void *)v80;
LABEL_114:

LABEL_115:
          id v17 = 0;
          uint64_t v18 = 0;
          v194 = 0;
          v196 = 0;
LABEL_116:
          double v5 = v183;
          break;
        case 2:
          if ([(PKPaymentTransaction *)self->_transaction isRecurring])
          {
            PKLocalizedPeerPaymentRecurringString(&cfstr_TransactionDet_134.isa, &stru_1EF1B4C70.isa, v34);
            id v72 = (id)objc_claimAutoreleasedReturnValue();
LABEL_85:
            dispatch_time_t v19 = v72;
            goto LABEL_114;
          }
          dispatch_time_t v19 = PKLocalizedPeerPaymentString(&cfstr_TransactionDet_134.isa, &stru_1EF1B4C70.isa, v34);
          if ([(PKPaymentTransaction *)self->_transaction peerPaymentPaymentMode] != 2) {
            goto LABEL_114;
          }
          uint64_t v80 = PKLocalizedNearbyPeerPaymentString(&cfstr_TransactionDet_133.isa, &stru_1EF1B4C70.isa, v19);

          goto LABEL_110;
        case 3:
          uint64_t v78 = [(PKPaymentTransaction *)self->_transaction expirationDate];
          PKMediumDateString();
          id v79 = v73 = v20;

          uint64_t v80 = PKLocalizedPeerPaymentString(&cfstr_TransactionDet_135.isa, &stru_1EF1B5770.isa, v34, v79);

          goto LABEL_109;
        default:
          dispatch_time_t v19 = 0;
          goto LABEL_114;
      }
      goto LABEL_156;
    case 4:
      if ([(PKPaymentTransaction *)self->_transaction isBankConnectTransaction])goto LABEL_12; {
      uint64_t v21 = PKLocalizedPaymentString(&cfstr_TransactionTyp_8.isa);
      }
      goto LABEL_13;
    case 5:
      uint64_t v20 = [(PKPaymentTransactionDetailViewController *)self _transactionStatusString];
      uint64_t v36 = [(PKPaymentTransaction *)self->_transaction secondaryFundingSourceType];
      id v37 = self->_transaction;
      if (v36 != 2)
      {
        id v62 = v20;
        v184 = v5;
        v63 = [(PKPaymentTransaction *)v37 transfers];
        uint64_t v64 = [v63 count];

        if (v64)
        {
          v65 = [(PKPaymentTransaction *)self->_transaction transfers];
          uint64_t v66 = [v65 firstObject];

          int v67 = [v66 externalAccount];
          uint64_t v68 = [(PKPaymentTransaction *)self->_transaction featureIdentifier];
          uint64_t v69 = [(PKPaymentTransaction *)self->_transaction associatedFeatureIdentifier];
          uint64_t v70 = [v67 displayDescription];
          if (v68 == 1)
          {
            if (v69) {
              PKLocalizedFeatureString();
            }
            else {
              PKLocalizedPeerPaymentString(&cfstr_TransactionSec.isa);
            }
            uint64_t v70 = v101 = v70;
          }
          else
          {
            v101 = PKLocalizedFeatureString();
          }
          dispatch_time_t v19 = PKLocalizedPeerPaymentString(&cfstr_TransactionDet_129.isa, &stru_1EF1B5770.isa, v101, v70);

          id v17 = 0;
          uint64_t v18 = 0;
          v194 = 0;
          v196 = 0;
          double v5 = v184;
          uint64_t v20 = v62;
          goto LABEL_186;
        }
        id v83 = objc_alloc(MEMORY[0x1E4F850C0]);
        v84 = [MEMORY[0x1E4F84898] sharedInstance];
        v85 = [(PKPaymentTransaction *)self->_transaction secondaryFundingSourceFPANIdentifier];
        v86 = [v84 passWithFPANIdentifier:v85];
        v87 = (void *)[v83 initWithPaymentPass:v86];

        uint64_t v88 = [MEMORY[0x1E4F84D18] secondaryFundingSourceDescriptionForTransaction:self->_transaction secondarySource:v87 includeBankAccountSuffix:1 useGenericNameIfNoDescriptionAvailable:1];
        uint64_t v89 = (void *)v88;
        if (v88)
        {
          double v5 = v184;
          PKLocalizedPeerPaymentString(&cfstr_TransactionDet_129.isa, &stru_1EF1B5770.isa, v184, v88);
        }
        else
        {
          double v5 = v184;
          if ([(PKPaymentTransaction *)self->_transaction isBankConnectTransaction])
          {
            dispatch_time_t v19 = 0;
LABEL_185:
            uint64_t v20 = v62;

            id v17 = 0;
            uint64_t v18 = 0;
            v194 = 0;
            v196 = 0;
LABEL_186:
            id v6 = &OBJC_IVAR___PKSegmentedBarView__placeholder;
            goto LABEL_156;
          }
          PKLocalizedPeerPaymentString(&cfstr_TransactionDet_136.isa, &stru_1EF1B4C70.isa, v184);
        dispatch_time_t v19 = };
        goto LABEL_185;
      }
      if ([(PKPaymentTransaction *)v37 isBankConnectTransaction])
      {
LABEL_14:
        id v17 = 0;
        uint64_t v18 = 0;
        v194 = 0;
        v196 = 0;
        dispatch_time_t v19 = 0;
        goto LABEL_156;
      }
      PKLocalizedPeerPaymentString(&cfstr_TransactionDet_136.isa, &stru_1EF1B4C70.isa, v5);
      uint64_t v30 = LABEL_25:;
LABEL_152:
      dispatch_time_t v19 = (void *)v30;
LABEL_153:
      id v17 = 0;
LABEL_154:
      uint64_t v18 = 0;
      v196 = 0;
LABEL_155:
      v194 = 0;
LABEL_156:
      uint64_t v150 = [(PKPaymentTransaction *)self->_transaction disputeStatus];
      uint64_t v151 = [(PKPaymentTransaction *)self->_transaction disputeType];
      uint64_t v152 = [(PKPaymentTransaction *)self->_transaction transactionType];
      if (v150 == 5)
      {
        if (v152) {
          BOOL v153 = 0;
        }
        else {
          BOOL v153 = v151 == 1;
        }
        if (v153)
        {
          v154 = [(PKPaymentTransaction *)self->_transaction disputeStatusDetails];
          id v155 = [v154 statusReasons];
          [v155 containsObject:@"splitLiability"];
        }
      }
      else if (v150 != 4)
      {
        goto LABEL_166;
      }
      uint64_t v156 = PKLocalizedFeatureString();

      dispatch_time_t v19 = (void *)v156;
LABEL_166:
      v157 = [PKTransactionStatusCell alloc];
      v158 = -[PKTransactionStatusCell initWithFrame:](v157, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      v159 = v158;
      if (v17) {
        [(PKTransactionStatusCell *)v158 setSecondaryTextOverrideColor:v17];
      }
      if (self->_detailViewStyle == 2) {
        [(PKTransactionStatusCell *)v159 setIsBridge:1];
      }
      [(PKTransactionStatusCell *)v159 setPrimaryText:v20];
      if (v18 && [v196 length])
      {
        [(PKTransactionStatusCell *)v159 setSecondaryTitleLinkText:v196];
        [(PKTransactionStatusCell *)v159 setSecondaryTitleLinkURL:v18];
        objc_initWeak(&location, self);
        v197[0] = MEMORY[0x1E4F143A8];
        v197[1] = 3221225472;
        v197[2] = __68__PKPaymentTransactionDetailViewController__statusCellForTableView___block_invoke_3;
        v197[3] = &unk_1E59DA350;
        objc_copyWeak(&v198, &location);
        [(PKTransactionStatusCell *)v159 setSecondaryTitleButtonAction:v197];
        objc_destroyWeak(&v198);
        objc_destroyWeak(&location);
      }
      v191 = v20;
      [(PKTransactionStatusCell *)v159 setSecondaryTitle:v19];
      [(PKTransactionStatusCell *)v159 setSecondaryValue:v194];
      v160 = *(Class *)((char *)&self->super.super.super.super.super.isa + v6[711]);
      uint64_t v161 = [(PKPaymentTransaction *)self->_transaction transactionSourceIdentifier];
      uint64_t v162 = [v160 transactionSourceForTransactionSourceIdentifier:v161];

      unsigned int v164 = v192;
      v163 = v4;
      if ([v162 type] == 2)
      {
        v186 = v5;
        v165 = [v162 accountUser];
        v188 = self;
        v166 = [(PKFamilyMemberCollection *)self->_familyCollection familyMemberForTransactionSource:v162];
        v167 = (void *)MEMORY[0x1E4F845E8];
        v168 = [v165 nameComponents];
        v169 = [v167 contactForFamilyMember:v166 nameComponents:v168 imageData:0];

        v170 = [v169 givenName];
        if (v170)
        {
          v171 = PKLocalizedFeatureString();
          -[PKTransactionStatusCell setTertiaryText:](v159, "setTertiaryText:", v171, v170);
        }
        unsigned int v164 = v192;
        v163 = v193;
        double v5 = v186;
        self = v188;
      }
      [(PKPaymentTransactionDetailViewController *)self _applyAmountDetailSeparatorInsetForTableView:v164 cell:v159];

      return v159;
    case 6:
      v183 = v5;
      v38 = [(PKPaymentTransaction *)self->_transaction transfers];
      uint64_t v39 = [v38 count];

      if (v39)
      {
        uint64_t v189 = [(PKPaymentTransactionDetailViewController *)self _transactionStatusString];
        id v40 = [(PKPaymentTransaction *)self->_transaction transfers];
        v41 = [v40 firstObject];

        v42 = [v41 externalAccount];
        uint64_t v43 = [(PKPaymentTransaction *)self->_transaction featureIdentifier];
        uint64_t v44 = [(PKPaymentTransaction *)self->_transaction associatedFeatureIdentifier];
        if (v43 == 1)
        {
          uint64_t v45 = v44;
          id v46 = [v42 displayDescription];
          if (v45) {
            PKLocalizedFeatureString();
          }
          else {
          uint64_t v47 = PKLocalizedPeerPaymentString(&cfstr_TransactionSec.isa);
          }
        }
        else
        {
          id v46 = PKLocalizedFeatureString();
          uint64_t v47 = [v42 displayDescription];
        }
        uint64_t v102 = (void *)v47;
        dispatch_time_t v19 = PKLocalizedPeerPaymentString(&cfstr_TransactionDet_129.isa, &stru_1EF1B5770.isa, v47, v46);

        id v17 = 0;
        uint64_t v18 = 0;
        v194 = 0;
        v196 = 0;
        double v5 = v183;
        uint64_t v20 = (void *)v189;
        goto LABEL_156;
      }
      uint64_t v71 = [(PKPaymentTransaction *)self->_transaction featureIdentifier];
      uint64_t v20 = [(PKPaymentTransactionDetailViewController *)self _transactionStatusString];
      if (v71 != 4)
      {
        id v90 = objc_alloc(MEMORY[0x1E4F850C0]);
        v91 = [MEMORY[0x1E4F84898] sharedInstance];
        [(PKPaymentTransaction *)self->_transaction secondaryFundingSourceFPANIdentifier];
        v93 = uint64_t v92 = v20;
        v94 = [v91 passWithFPANIdentifier:v93];
        v95 = (void *)[v90 initWithPaymentPass:v94];

        uint64_t v20 = v92;
        id v6 = &OBJC_IVAR___PKSegmentedBarView__placeholder;

        uint64_t v96 = [MEMORY[0x1E4F84D18] secondaryFundingSourceDescriptionForTransaction:self->_transaction secondarySource:v95 includeBankAccountSuffix:1 useGenericNameIfNoDescriptionAvailable:1];
        dispatch_time_t v19 = PKLocalizedPeerPaymentString(&cfstr_TransactionDet_137.isa, &stru_1EF1B4C70.isa, v96);

        goto LABEL_115;
      }
      if ([(PKPaymentTransaction *)self->_transaction topUpType] == 8)
      {
        dispatch_time_t v19 = PKLocalizedLynxString(&cfstr_TransactionGif.isa);
        goto LABEL_115;
      }
      id v17 = 0;
      uint64_t v18 = 0;
      v194 = 0;
      v196 = 0;
      dispatch_time_t v19 = 0;
      goto LABEL_116;
    case 7:
      uint64_t v20 = PKLocalizedTitleForTransactionWithAdjustment();
      uint64_t v30 = PKLocalizedSubtitleForTransactionWithAdjustment();
      goto LABEL_152;
    case 8:
      uint64_t v20 = PKLocalizedPaymentString(&cfstr_TransactionTyp_9.isa);
      if ([(PKPaymentPass *)v4 associatedAccountFeatureIdentifier] != 2) {
        goto LABEL_24;
      }
LABEL_102:
      uint64_t v30 = PKLocalizedFeatureString();
      goto LABEL_152;
    case 9:
    case 12:
      uint64_t v27 = PKLocalizedFeatureString();
LABEL_23:
      uint64_t v20 = (void *)v27;
LABEL_24:
      PKLocalizedPeerPaymentString(&cfstr_TransactionDet_130.isa, &stru_1EF1B4C70.isa, v5);
      goto LABEL_25;
    case 10:
      uint64_t v48 = [(PKPaymentTransactionDetailViewController *)self _transactionStatusString];
      id v49 = objc_alloc(MEMORY[0x1E4F850C0]);
      uint64_t v50 = [MEMORY[0x1E4F84898] sharedInstance];
      uint64_t v51 = [(PKPaymentTransaction *)self->_transaction secondaryFundingSourceFPANIdentifier];
      [v50 passWithFPANIdentifier:v51];
      v53 = char v52 = v5;
      id v28 = (void *)[v49 initWithPaymentPass:v53];

      double v5 = v52;
      uint64_t v20 = (void *)v48;
      id v6 = &OBJC_IVAR___PKSegmentedBarView__placeholder;

      uint64_t v29 = [MEMORY[0x1E4F84D18] secondaryFundingSourceDescriptionForTransaction:self->_transaction secondarySource:v28 includeBankAccountSuffix:1 useGenericNameIfNoDescriptionAvailable:1];
      goto LABEL_54;
    case 11:
      switch([(PKPaymentTransaction *)self->_transaction accountType])
      {
        case 0:
        case 1:
        case 4:
          if ([(PKPaymentTransaction *)self->_transaction isBankConnectTransaction])goto LABEL_12; {
          goto LABEL_47;
          }
        case 2:
          uint64_t v20 = PKDynamicLocalizedAppleCardString(&cfstr_TransactionDet_71.isa);
          v196 = PKDynamicLocalizedAppleCardString(&cfstr_TransactionDet_122.isa);
          uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:@"https://support.apple.com/en-us/HT209230"];
          if ([(PKAccount *)self->_account hideInterestChargeClarity])
          {
            dispatch_time_t v19 = PKDynamicLocalizedAppleCardString(&cfstr_TransactionDet_127.isa);
            id v17 = 0;
            goto LABEL_155;
          }
          v182 = v18;
          v185 = v5;
          v190 = v20;
          v103 = [(PKAccount *)self->_account creditDetails];
          uint64_t v104 = [v103 mergeDate];

          id v105 = objc_alloc(MEMORY[0x1E4F1C9A8]);
          id v106 = self;
          v107 = (void *)v104;
          id v108 = (void *)[v105 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
          [v108 setTimeZone:v106->_productTimeZone];
          id v109 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
          [v109 setMonth:2];
          uint64_t v110 = [v108 dateByAddingComponents:v109 toDate:v104 options:0];
          v111 = [(PKPaymentTransaction *)v106->_transaction transactionDate];
          v195 = (void *)v110;
          int IsBetweenDates = PKDateIsBetweenDates();
          char v113 = IsBetweenDates;
          int v114 = IsBetweenDates ^ 1;
          v115 = [(PKPaymentTransaction *)v106->_transaction associatedStatementIdentifiers];
          uint64_t v116 = [v115 count];

          v187 = v106;
          int v117 = [(PKPaymentTransaction *)v106->_transaction interestReassessment];
          if (v116) {
            int v118 = 0;
          }
          else {
            int v118 = v114;
          }
          int v119 = v117 | v118;
          if (v119) {
            uint64_t v120 = @"TRANSACTION_DETAIL_INTEREST_CHARGED_GENERIC_MESSAGE";
          }
          else {
            uint64_t v120 = @"TRANSACTION_DETAIL_INTEREST_CHARGED_SUBTITLE_CO_OWNERS_MERGED_RECENTLY";
          }
          if (v119)
          {
            double v5 = v185;
            uint64_t v20 = v190;
            goto LABEL_195;
          }
          double v5 = v185;
          uint64_t v20 = v190;
          if (v113) {
            goto LABEL_195;
          }
          if (!v106->_associatedCreditStatementsLoaded)
          {
            uint64_t v175 = 0;
            goto LABEL_196;
          }
          v180 = v107;
          v181 = v108;
          if ([(NSArray *)v106->_associatedCreditStatements count] != v116)
          {
            uint64_t v120 = @"TRANSACTION_DETAIL_INTEREST_CHARGED_GENERIC_MESSAGE";
            goto LABEL_195;
          }
          v121 = [(NSArray *)v106->_associatedCreditStatements objectAtIndexedSubscript:0];
          v122 = [v121 openingDate];
          v179 = v121;
          v123 = [v121 closingDate];
          uint64_t v124 = PKDatesMidpoint();

          v178 = (void *)v124;
          v125 = [(NSDateFormatter *)v106->_monthFormatter stringFromDate:v124];
          if (v116 == 1)
          {
            productTimeZoneMonthDayFormatter = v106->_productTimeZoneMonthDayFormatter;
            v177 = [v121 paymentDueDate];
            v127 = [(NSDateFormatter *)productTimeZoneMonthDayFormatter stringFromDate:v177];

            uint64_t v132 = PKDynamicLocalizedAppleCardString(&cfstr_TransactionDet_126.isa, &cfstr_12.isa, v125, v127);
            double v5 = v185;
          }
          else
          {
            uint64_t v126 = 0;
            double v5 = v185;
            if (v116 != 2) {
              goto LABEL_193;
            }
            v127 = [(NSArray *)v187->_associatedCreditStatements objectAtIndexedSubscript:1];
            v128 = [v127 openingDate];
            v129 = [v127 closingDate];
            v130 = PKDatesMidpoint();

            double v5 = v185;
            v131 = [(NSDateFormatter *)v187->_monthFormatter stringFromDate:v130];
            uint64_t v132 = PKDynamicLocalizedAppleCardString(&cfstr_TransactionDet_125.isa, &cfstr_12.isa, v125, v131);
          }
          uint64_t v126 = v132;
LABEL_193:

          uint64_t v20 = v190;
          uint64_t v175 = v126;
          v107 = v180;
          id v108 = v181;
          if (v126) {
            goto LABEL_196;
          }
          uint64_t v120 = @"TRANSACTION_DETAIL_INTEREST_CHARGED_GENERIC_MESSAGE";
LABEL_195:
          uint64_t v175 = PKDynamicLocalizedAppleCardString(&v120->isa);
LABEL_196:

          id v17 = 0;
          v194 = 0;
          self = v187;
          id v6 = &OBJC_IVAR___PKSegmentedBarView__placeholder;
          dispatch_time_t v19 = (void *)v175;
          uint64_t v18 = v182;
          break;
        case 3:
          uint64_t v20 = PKLocalizedFeatureString();
          goto LABEL_102;
        default:
LABEL_47:
          id v17 = 0;
          uint64_t v18 = 0;
          v194 = 0;
          v196 = 0;
          dispatch_time_t v19 = 0;
          uint64_t v20 = 0;
          goto LABEL_156;
      }
      goto LABEL_156;
    case 13:
    case 14:
      uint64_t v20 = PKLocalizedBeekmanString(&cfstr_AppleCardInsta.isa);
      id v28 = [(PKPaymentTransaction *)self->_transaction installmentPayment];
      uint64_t v29 = [v28 localizedDisplay];
      goto LABEL_54;
    case 15:
      goto LABEL_156;
    case 16:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
LABEL_12:
      uint64_t v21 = [(PKPaymentTransactionDetailViewController *)self _transactionStatusString];
LABEL_13:
      uint64_t v20 = (void *)v21;
      goto LABEL_14;
    default:
      v194 = 0;
      v196 = 0;
      dispatch_time_t v19 = 0;
      uint64_t v20 = 0;
      goto LABEL_156;
  }
}

void __68__PKPaymentTransactionDetailViewController__statusCellForTableView___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__PKPaymentTransactionDetailViewController__statusCellForTableView___block_invoke_2;
    block[3] = &unk_1E59CA7D0;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __68__PKPaymentTransactionDetailViewController__statusCellForTableView___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSection:3];
}

void __68__PKPaymentTransactionDetailViewController__statusCellForTableView___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v4 = (void *)[objc_alloc(MEMORY[0x1E4F3AEB8]) initWithURL:v5];
    [v4 setModalPresentationStyle:2];
    [WeakRetained presentViewController:v4 animated:1 completion:0];
  }
}

- (id)_financingPlanDetailsCellForTableView:(id)a3
{
  id v4 = a3;
  id v5 = [PKTransactionStatusCell alloc];
  id v6 = -[PKTransactionStatusCell initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(PKTransactionStatusCell *)v6 setIsBridge:self->_detailViewStyle == 2];
  id v7 = [(PKPaymentTransaction *)self->_transaction merchant];
  uint64_t v8 = [v7 displayName];
  if (v8)
  {
    [(PKTransactionStatusCell *)v6 setPrimaryText:v8];
  }
  else
  {
    id v9 = PKLocalizedCocoonString(&cfstr_ApplePayLater.isa);
    [(PKTransactionStatusCell *)v6 setPrimaryText:v9];
  }
  uint64_t v10 = [(PKPaymentTransaction *)self->_transaction associatedFinancingPlan];
  char v11 = [v10 merchant];

  uint64_t v12 = [v11 displayNamePurchase];
  [(PKTransactionStatusCell *)v6 setSecondaryTitle:v12];
  [(PKPaymentTransactionDetailViewController *)self _applyAmountDetailSeparatorInsetForTableView:v4 cell:v6];

  return v6;
}

- (id)_expiredPhysicalCardCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [a4 row];
  if (v7 == 1)
  {
    uint64_t v8 = [(PKPaymentTransactionDetailViewController *)self _tableView:v6 actionButtonCellForSection:2];
    __int16 v25 = [v8 textLabel];
    uint64_t v26 = PKLocalizedFeatureString();
    [v25 setText:v26];

    uint64_t v27 = [v8 textLabel];
    id v28 = [MEMORY[0x1E4FB1618] labelColor];
    [v27 setTextColor:v28];

    [v8 setAccessoryType:1];
  }
  else if (v7)
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = [v6 dequeueReusableCellWithIdentifier:@"PKPaymentTransactionConfigurationCellReuseIdentifier"];
    id v9 = [MEMORY[0x1E4FB1948] subtitleCellConfiguration];
    uint64_t v10 = PKLocalizedFeatureString();
    [v9 setText:v10];

    char v11 = [v9 textProperties];
    uint64_t v12 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB27F0], *MEMORY[0x1E4FB09B8]);
    [v11 setFont:v12];

    uint64_t v13 = PKLocalizedFeatureString();
    [v9 setSecondaryText:v13];

    uint64_t v14 = [v9 secondaryTextProperties];
    uint64_t v15 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB2950], 0);
    [v14 setFont:v15];

    BOOL v16 = [v9 secondaryTextProperties];
    id v17 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [v16 setColor:v17];

    [v9 setTextToSecondaryTextVerticalPadding:5.0];
    uint64_t v18 = PKPassKitUIBundle();
    dispatch_time_t v19 = [v18 URLForResource:@"MessageAlert" withExtension:@"pdf"];
    double v20 = PKUIScreenScale();
    uint64_t v21 = PKUIImageFromPDF(v19, 42.0, 42.0, v20);

    [v9 setImage:v21];
    uint64_t v22 = [v9 imageProperties];
    id v23 = [MEMORY[0x1E4FB1830] configurationWithPointSize:42.0];
    [v22 setPreferredSymbolConfiguration:v23];

    [v9 setImageToTextPadding:12.0];
    uint64_t v24 = [v9 imageProperties];
    objc_msgSend(v24, "setReservedLayoutSize:", 42.0, 42.0);

    objc_msgSend(v9, "setDirectionalLayoutMargins:", 12.0, 20.0, 12.0, 20.0);
    [v8 setContentConfiguration:v9];
    objc_msgSend(v8, "setSeparatorInset:", 0.0, 20.0, 0.0, 0.0);
  }

  return v8;
}

- (id)_disputeStatusCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [a4 row];
  if (v7 == 1)
  {
    uint64_t v8 = [(PKPaymentTransactionDetailViewController *)self _tableView:v6 actionButtonCellForSection:1];
    if ([(PKPaymentTransaction *)self->_transaction disputeStatus] == 7)
    {
      uint64_t v24 = [(PKPaymentTransaction *)self->_transaction disputeStatusDetails];
      __int16 v25 = [v24 statusReasons];
      [v25 containsObject:@"decisioned"];
    }
    id v9 = [v8 textLabel];
    double v20 = PKLocalizedFeatureString();
    [v9 setText:v20];
  }
  else
  {
    if (v7)
    {
      uint64_t v8 = 0;
      goto LABEL_9;
    }
    uint64_t v8 = [v6 dequeueReusableCellWithIdentifier:@"PKPaymentTransactionConfigurationCellReuseIdentifier"];
    id v9 = [MEMORY[0x1E4FB1948] subtitleCellConfiguration];
    uint64_t v10 = [(PKPaymentTransactionDetailViewController *)self _disputeStatusTitle];
    [v9 setText:v10];

    char v11 = [v9 textProperties];
    uint64_t v12 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB27F0], *MEMORY[0x1E4FB09B8]);
    [v11 setFont:v12];

    uint64_t v13 = [(PKPaymentTransactionDetailViewController *)self _disputeStatusDescription];
    [v9 setSecondaryText:v13];

    uint64_t v14 = [v9 secondaryTextProperties];
    uint64_t v15 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB2950], 0);
    [v14 setFont:v15];

    BOOL v16 = [v9 secondaryTextProperties];
    id v17 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [v16 setColor:v17];

    [v9 setTextToSecondaryTextVerticalPadding:5.0];
    uint64_t v18 = [MEMORY[0x1E4FB1818] systemImageNamed:@"flag.circle.fill"];
    dispatch_time_t v19 = [MEMORY[0x1E4FB1618] systemOrangeColor];
    double v20 = [v18 imageWithTintColor:v19 renderingMode:1];

    [v9 setImage:v20];
    uint64_t v21 = [v9 imageProperties];
    uint64_t v22 = [MEMORY[0x1E4FB1830] configurationWithPointSize:50.0];
    [v21 setPreferredSymbolConfiguration:v22];

    [v9 setImageToTextPadding:12.0];
    id v23 = [v9 imageProperties];
    objc_msgSend(v23, "setReservedLayoutSize:", 50.0, 50.0);

    objc_msgSend(v9, "setDirectionalLayoutMargins:", 12.0, 20.0, 12.0, 20.0);
    [v8 setContentConfiguration:v9];
    objc_msgSend(v8, "setSeparatorInset:", 0.0, 20.0, 0.0, 0.0);
  }

LABEL_9:

  return v8;
}

- (id)_disputeStatusTitle
{
  uint64_t v3 = [(PKPaymentTransaction *)self->_transaction disputeStatusDetails];
  int v4 = [(PKAccount *)self->_account hideEnhancedDisputeDetails];
  uint64_t v5 = [(PKPaymentTransaction *)self->_transaction disputeStatus] - 1;
  id v6 = @"DISPUTE_STATUS_NEW_TITLE";
  switch(v5)
  {
    case 0:
      goto LABEL_14;
    case 1:
      id v6 = @"DISPUTE_STATUS_OPEN_TITLE";
      goto LABEL_14;
    case 2:
      uint64_t v8 = [v3 statusReasons];
      int v9 = [v8 containsObject:@"evidenceRequestedFromCustomer"];

      int v10 = v9 ^ 1 | v4;
      char v11 = @"DISPUTE_STATUS_PENDING_EVIDENCE_REQUESTED_TITLE";
      uint64_t v12 = @"DISPUTE_STATUS_PENDING_TITLE";
      goto LABEL_7;
    case 3:
      id v6 = @"DISPUTE_STATUS_APPROVED_TITLE";
      goto LABEL_14;
    case 4:
      uint64_t v13 = [v3 statusReasons];
      int v14 = [v13 containsObject:@"splitLiability"];

      int v10 = v14 ^ 1 | v4;
      char v11 = @"DISPUTE_STATUS_REJECTED_SPLIT_LIABILITY_TITLE";
      uint64_t v12 = @"DISPUTE_STATUS_REJECTED_TITLE";
LABEL_7:
      if (v10) {
        id v6 = v12;
      }
      else {
        id v6 = v11;
      }
      goto LABEL_14;
    case 5:
      id v6 = @"DISPUTE_STATUS_WITHDRAWN_TITLE";
      goto LABEL_14;
    case 6:
      uint64_t v15 = [v3 statusReasons];
      int v16 = [v15 containsObject:@"decisioned"];

      if (v16) {
        id v6 = @"DISPUTE_STATUS_UNAVAILABLE_DECISIONED_TITLE";
      }
      else {
        id v6 = @"DISPUTE_STATUS_UNAVAILABLE_TITLE";
      }
LABEL_14:
      uint64_t v7 = PKDynamicLocalizedAppleCardString(&v6->isa);
      break;
    default:
      uint64_t v7 = 0;
      break;
  }

  return v7;
}

- (id)_disputeStatusDescription
{
  uint64_t v3 = [(PKPaymentTransaction *)self->_transaction latestDisputeEvent];
  int v4 = [(PKPaymentTransaction *)self->_transaction disputeStatusDetails];
  int v5 = [(PKAccount *)self->_account hideEnhancedDisputeDetails];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__PKPaymentTransactionDetailViewController__disputeStatusDescription__block_invoke;
  aBlock[3] = &unk_1E59E0948;
  void aBlock[4] = self;
  id v6 = v4;
  id v20 = v6;
  id v7 = v3;
  id v21 = v7;
  uint64_t v8 = (void (**)(void *, __CFString *))_Block_copy(aBlock);
  switch([(PKPaymentTransaction *)self->_transaction disputeStatus])
  {
    case 1:
      v8[2](v8, @"DISPUTE_STATUS_NEW_DESCRIPTION");
      goto LABEL_17;
    case 2:
      v8[2](v8, @"DISPUTE_STATUS_OPEN_DESCRIPTION");
      goto LABEL_17;
    case 3:
      int v10 = [v6 statusReasons];
      int v11 = [v10 containsObject:@"evidenceRequestedFromCustomer"];

      uint64_t v12 = v8[2];
      if ((v11 ^ 1 | v5)) {
        uint64_t v13 = @"DISPUTE_STATUS_PENDING_DESCRIPTION";
      }
      else {
        uint64_t v13 = @"DISPUTE_STATUS_PENDING_EVIDENCE_REQUESTED_DESCRIPTION";
      }
      goto LABEL_16;
    case 4:
      v8[2](v8, @"DISPUTE_STATUS_APPROVED_DESCRIPTION");
      goto LABEL_17;
    case 5:
      int v14 = [v6 statusReasons];
      int v15 = [v14 containsObject:@"splitLiability"];

      uint64_t v12 = v8[2];
      if ((v15 ^ 1 | v5)) {
        uint64_t v13 = @"DISPUTE_STATUS_REJECTED_DESCRIPTION";
      }
      else {
        uint64_t v13 = @"DISPUTE_STATUS_REJECTED_SPLIT_LIABILITY_DESCRIPTION";
      }
      goto LABEL_16;
    case 6:
      v8[2](v8, @"DISPUTE_STATUS_WITHDRAWN_DESCRIPTION");
      goto LABEL_17;
    case 7:
      int v16 = [v6 statusReasons];
      int v17 = [v16 containsObject:@"decisioned"];

      uint64_t v12 = v8[2];
      if (v17) {
        uint64_t v13 = @"DISPUTE_STATUS_UNAVAILABLE_DECISIONED_DESCRIPTION";
      }
      else {
        uint64_t v13 = @"DISPUTE_STATUS_UNAVAILABLE_DESCRIPTION";
      }
LABEL_16:
      v12(v8, v13);
      int v9 = LABEL_17:;
      break;
    default:
      int v9 = 0;
      break;
  }

  return v9;
}

id __69__PKPaymentTransactionDetailViewController__disputeStatusDescription__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 1400);
  int v17 = a2;
  id v21 = [v3 disputeOpenDate];
  int v16 = PKShortDateString();
  id v20 = [*(id *)(a1 + 40) customerResponseByDate];
  uint64_t v13 = PKShortDateString();
  dispatch_time_t v19 = [*(id *)(a1 + 40) merchantResponseByDate];
  int v4 = PKShortDateString();
  uint64_t v18 = [*(id *)(a1 + 40) partiallyApprovedAmount];
  int v5 = [v18 formattedStringValue];
  int v15 = [*(id *)(a1 + 40) resolutionDate];
  id v6 = PKShortDateString();
  id v7 = [*(id *)(a1 + 48) claimIdentifier];
  uint64_t v8 = [*(id *)(a1 + 48) amount];
  int v9 = [v8 formattedStringValue];
  int v10 = [*(id *)(a1 + 48) lastUpdatedDate];
  int v11 = PKShortDateString();
  PKDynamicLocalizedAppleCardString(v17, &cfstr_12345678.isa, v16, v13, v4, v5, v6, v7, v9, v11);
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_transactionIdentifierDescription
{
  id v2 = [(PKPaymentTransaction *)self->_transaction serviceIdentifier];
  if (v2)
  {
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v2];

    if (v3)
    {
      int v4 = [v2 componentsSeparatedByString:@"-"];
      uint64_t v5 = [v4 lastObject];

      id v2 = (void *)v5;
    }
  }

  return v2;
}

- (id)_transactionIdentifierCellForTableView:(id)a3
{
  int v4 = [a3 dequeueReusableCellWithIdentifier:@"PKPaymentTransactionSubtitleCellReuseIdentifier"];
  uint64_t v5 = [v4 textLabel];
  id v6 = [v4 detailTextLabel];
  id v7 = PKLocalizedPeerPaymentString(&cfstr_TransactionDet_139.isa);
  [v5 setText:v7];

  if (self->_inBridge) {
    [MEMORY[0x1E4FB1618] systemGrayColor];
  }
  else {
  uint64_t v8 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  }
  [v5 setTextColor:v8];

  int v9 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  [v5 setFont:v9];

  [v5 setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];
  if (self->_inBridge) {
    [MEMORY[0x1E4FB1618] whiteColor];
  }
  else {
  int v10 = [MEMORY[0x1E4FB1618] labelColor];
  }
  [v6 setTextColor:v10];

  int v11 = [(PKPaymentTransactionDetailViewController *)self _transactionIdentifierDescription];
  [v6 setText:v11];

  uint64_t v12 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28D0], 0, 0, 4);
  [v6 setFont:v12];

  [v6 setNumberOfLines:0];
  [v6 setAccessibilityIdentifier:*MEMORY[0x1E4F85B58]];
  [v4 setSelectionStyle:0];

  return v4;
}

- (id)_fraudRiskCellForTableView:(id)a3
{
  uint64_t v3 = [a3 dequeueReusableCellWithIdentifier:@"PKPaymentTransactionDefaultCellReuseIdentifier"];
  [v3 setSelectionStyle:0];
  int v4 = [v3 textLabel];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4FB1618], "pkui_osloErrorColor");
  id v6 = PKLocalizedPeerPaymentString(&cfstr_TransactionDet_140.isa);
  [v4 setText:v6];

  [v4 setTextColor:v5];

  return v3;
}

- (unint64_t)_recognitionHintsRowForIndex:(unint64_t)a3
{
  unint64_t v5 = 0;
  uint64_t v6 = 0;
  char v7 = 1;
  do
  {
    char v8 = v7;
    if ([(PKPaymentTransactionDetailViewController *)self _recognitionHintsRowIsEnabled:v5])
    {
      if (v6 == a3) {
        return v5;
      }
      ++v6;
    }
    char v7 = 0;
    unint64_t v5 = 1;
  }
  while ((v8 & 1) != 0);
  return 0;
}

- (unint64_t)_numberOfRecognitionHintsRows
{
  unint64_t v3 = 0;
  if ([(PKPaymentTransactionDetailViewController *)self _recognitionHintsRowIsEnabled:0])
  {
    uint64_t v4 = 0;
    unint64_t v3 = 0;
    char v5 = 1;
    do
    {
      char v6 = v5;
      BOOL v7 = [(PKPaymentTransactionDetailViewController *)self _recognitionHintsRowIsEnabled:v4];
      char v5 = 0;
      v3 += v7;
      uint64_t v4 = 1;
    }
    while ((v6 & 1) != 0);
  }
  return v3;
}

- (BOOL)_recognitionHintsRowIsEnabled:(unint64_t)a3
{
  if ([(PKPaymentTransaction *)self->_transaction transactionType]) {
    BOOL v5 = [(PKPaymentTransaction *)self->_transaction transactionType] != 1;
  }
  else {
    BOOL v5 = 0;
  }
  char v6 = [(PKPaymentTransaction *)self->_transaction isBankConnectTransaction];
  BOOL v7 = 0;
  if ([(PKAccount *)self->_account feature] != 2 || v5 || (v6 & 1) != 0) {
    return v7;
  }
  if (a3 != 1)
  {
    if (a3) {
      return 0;
    }
    char v8 = [(PKPaymentTransaction *)self->_transaction unansweredQuestions];
    if ([v8 count])
    {
      BOOL v7 = 1;
    }
    else
    {
      int v10 = [(PKPaymentTransaction *)self->_transaction merchant];
      int v11 = [v10 rawName];
      BOOL v7 = [v11 length] != 0;
    }
    return v7;
  }

  return [(PKPaymentTransactionDetailViewController *)self _transactionIsTaggedAsRecurring];
}

- (id)_recognitionHintsCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  char v8 = [v7 dequeueReusableCellWithIdentifier:@"PKPaymentTransactionDefaultCellReuseIdentifier"];
  int v9 = [v8 detailTextLabel];
  [v9 setText:0];

  [v8 setAccessoryType:0];
  int v10 = [v8 textLabel];
  [v10 setNumberOfLines:0];
  [(PKPaymentTransactionDetailViewController *)self _applyAmountDetailSeparatorInsetForTableView:v7 cell:v8];

  uint64_t v11 = [v6 row];
  unint64_t v12 = [(PKPaymentTransactionDetailViewController *)self _recognitionHintsRowForIndex:v11];
  switch(v12)
  {
    case 2uLL:
      id v16 = 0;
      goto LABEL_9;
    case 1uLL:
      int v17 = PKLocalizedPaymentString(&cfstr_TransactionPos.isa);
      [v10 setText:v17];

      uint64_t v15 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      goto LABEL_7;
    case 0uLL:
      uint64_t v13 = [(PKPaymentTransaction *)self->_transaction merchant];
      id v14 = [v13 rawName];
      [v10 setText:v14];

      uint64_t v15 = [MEMORY[0x1E4FB1618] labelColor];
LABEL_7:
      uint64_t v18 = (void *)v15;
      [v10 setTextColor:v15];

      break;
  }
  id v16 = v8;
LABEL_9:

  return v16;
}

- (id)_releasedDataCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if (PKIdentityPresentmentV2Enabled())
  {
    char v8 = [v7 dequeueReusableCellWithIdentifier:@"PKPaymentTransactionRequestedElementsDataReuseIdentifier" forIndexPath:v6];

    [v8 setDataReleaseConfiguration:self->_dataReleaseTransactionConfiguration];
    goto LABEL_20;
  }
  id v38 = v6;
  char v8 = [v7 dequeueReusableCellWithIdentifier:@"PKPaymentTransactionRequestedDataReuseIdentifier"];

  int v9 = (NSString *)*MEMORY[0x1E4FB28C8];
  int v10 = (NSString *)*MEMORY[0x1E4FB27F0];
  uint64_t v37 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28C8], (void *)*MEMORY[0x1E4FB27F0], 2, 0);
  objc_msgSend(v8, "setTitleFont:");
  uint64_t v36 = PKFontForDefaultDesign(v9, v10);
  objc_msgSend(v8, "setSubtitleFont:");
  uint64_t v35 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB2950], v10);
  objc_msgSend(v8, "setBodyFont:");
  uint64_t v11 = [(PKPaymentTransaction *)self->_transaction releasedData];
  unint64_t v12 = [v11 elements];
  id v41 = 0;
  id v42 = 0;
  id v40 = 0;
  PKISO180135AcceptedFieldsFromElements(v12, 0, &v42, &v41, &v40);
  id v13 = v42;
  id v14 = v41;
  id v15 = v40;

  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v39 = v14;
  id v17 = v14;
  uint64_t v18 = v15;
  [v16 addObjectsFromArray:v17];
  [v16 addObjectsFromArray:v15];
  dispatch_time_t v19 = [(PKTransactionSourceCollection *)self->_transactionSourceCollection paymentPass];
  id v20 = [v19 localizedDescription];

  uint64_t v21 = [(PKPaymentTransaction *)self->_transaction transactionSource];
  if (v21 == 2) {
    uint64_t v22 = @"TRANSACTION_DETAILS_REQUESTED_DATA_SHARED";
  }
  else {
    uint64_t v22 = @"TRANSACTION_DETAILS_REQUESTED_DATA_PRESENTED";
  }
  id v23 = PKLocalizedIdentityString(&v22->isa, &stru_1EF1B4C70.isa, v20);
  [v8 setTitle:v23];

  [v8 setIntentRetainElements:v13];
  [v8 setIntentDoNotRetainElements:v16];
  if ([v13 count])
  {
    if (v21 == 2)
    {
      uint64_t v24 = [(PKPaymentTransaction *)self->_transaction releasedData];
      __int16 v25 = [v24 elements];
      uint64_t v26 = [(PKPaymentTransactionDetailViewController *)self _maximumRetentionPeriodForElements:v25];

      id v6 = v38;
      if (v26 < 1) {
        PKLocalizedIdentityString(&cfstr_TransactionDet_144.isa);
      }
      else {
      id v32 = PKLocalizedIdentityString(&cfstr_TransactionDet_143.isa, &cfstr_Ld.isa, v26);
      }
      id v28 = (void *)v36;
      uint64_t v27 = (void *)v37;
      uint64_t v29 = (void *)v35;
      [v8 setIntentRetainTitle:v32];

      if (![v16 count]) {
        goto LABEL_19;
      }
      goto LABEL_17;
    }
    uint64_t v30 = PKLocalizedIdentityString(&cfstr_TransactionDet_145.isa);
    [v8 setIntentRetainTitle:v30];

    id v28 = (void *)v36;
    uint64_t v27 = (void *)v37;
    uint64_t v29 = (void *)v35;
    id v6 = v38;
    if ([v16 count]) {
      goto LABEL_14;
    }
  }
  else
  {
    id v28 = (void *)v36;
    uint64_t v27 = (void *)v37;
    uint64_t v29 = (void *)v35;
    id v6 = v38;
    if ([v16 count])
    {
      if (v21 == 2)
      {
LABEL_17:
        int v31 = @"TRANSACTION_DETAILS_SHARED_DATA_NOT_STORED";
        goto LABEL_18;
      }
LABEL_14:
      int v31 = @"TRANSACTION_DETAILS_PRESENTED_DATA_NOT_STORED";
LABEL_18:
      uint64_t v33 = PKLocalizedIdentityString(&v31->isa);
      [v8 setIntentDoNotRetainTitle:v33];
    }
  }
LABEL_19:

LABEL_20:

  return v8;
}

- (int64_t)_maximumRetentionPeriodForElements:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int64_t v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        int v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 retentionPeriod] >= 1 && objc_msgSend(v9, "retentionPeriod") > v6) {
          int64_t v6 = [v9 retentionPeriod];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)_numberOfDataReleaseRows
{
  return !PKIdentityPresentmentV2Enabled() || self->_dataReleaseTransactionConfiguration != 0;
}

- (void)_fetchDataReleaseTransactionConfiguration
{
  if (PKIdentityPresentmentV2Enabled() && !self->_dataReleaseTransactionConfiguration)
  {
    id v3 = [_TtC9PassKitUI45PKIdentityDataReleaseTransactionConfiguration alloc];
    uint64_t v4 = [(PKPaymentTransaction *)self->_transaction releasedData];
    uint64_t v5 = [v4 documentType];
    int64_t v6 = [(PKPaymentTransaction *)self->_transaction releasedData];
    uint64_t v7 = [v6 elements];
    uint64_t v8 = [(PKPaymentTransaction *)self->_transaction transactionSource];
    int v9 = [(PKTransactionSourceCollection *)self->_transactionSourceCollection paymentPass];
    int v10 = [v9 localizedDescription];
    long long v11 = [(PKIdentityDataReleaseTransactionConfiguration *)v3 initWithDocumentType:v5 elements:v7 transactionSource:v8 passName:v10];
    dataReleaseTransactionConfiguration = self->_dataReleaseTransactionConfiguration;
    self->_dataReleaseTransactionConfiguration = v11;

    [(PKSectionTableViewController *)self reloadData];
  }
}

- (id)_merchantTokenManagementCellForTableView:(id)a3
{
  id v3 = [a3 dequeueReusableCellWithIdentifier:@"PKPaymentTransactionConfigurationCellReuseIdentifier"];
  uint64_t v4 = [v3 defaultContentConfiguration];
  uint64_t v5 = PKLocalizedMerchantTokensString(&cfstr_MerchantTokenT_2.isa);
  [v4 setText:v5];

  [v3 setAccessoryType:1];
  [v3 setContentConfiguration:v4];

  return v3;
}

- (id)_merchantTokenDeletedCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v5 = a3;
  int64_t v6 = [v5 dequeueReusableCellWithIdentifier:@"PKPaymentTransactionMerchantTokenDeletedCellReuseIdentifier"];
  [(PKPaymentTransactionDetailViewController *)self _applyAmountDetailSeparatorInsetForTableView:v5 cell:v6];

  uint64_t v7 = [v6 defaultContentConfiguration];
  uint64_t v8 = PKLocalizedMerchantTokensString(&cfstr_MerchantTokenT_3.isa);
  [v7 setText:v8];

  int v9 = [v7 textProperties];
  int v10 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v9 setColor:v10];

  [v6 setContentConfiguration:v7];

  return v6;
}

- (void)_didSelectMerchantTokenManagement
{
  id v3 = [(PKRetrieveMerchantTokensResponse *)self->_merchantTokenResponse merchantTokens];
  uint64_t v4 = [v3 firstObject];

  id v5 = [[PKMerchantTokenDetailViewController alloc] initWithMerchantToken:v4];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __77__PKPaymentTransactionDetailViewController__didSelectMerchantTokenManagement__block_invoke;
  v7[3] = &unk_1E59CAEA8;
  uint64_t v8 = v5;
  int v9 = self;
  int64_t v6 = v5;
  [(PKMerchantTokenDetailViewController *)v6 preflightWithCompletion:v7];
}

void __77__PKPaymentTransactionDetailViewController__didSelectMerchantTokenManagement__block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  _DWORD v4[2] = __77__PKPaymentTransactionDetailViewController__didSelectMerchantTokenManagement__block_invoke_2;
  v4[3] = &unk_1E59CA870;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = v2;
  uint64_t v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

void __77__PKPaymentTransactionDetailViewController__didSelectMerchantTokenManagement__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
  id v3 = [*(id *)(a1 + 40) navigationItem];
  [v3 setBackButtonDisplayMode:2];
  id v2 = [*(id *)(a1 + 40) navigationController];
  [v2 pushViewController:*(void *)(a1 + 32) animated:1];
}

- (void)merchantTokenDetailViewController:(id)a3 didDeleteMerchantToken:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [(PKPaymentTransactionDetailViewController *)self navigationController];
  id v7 = [v6 topViewController];

  if (v7 == v5)
  {
    uint64_t v8 = [(PKPaymentTransactionDetailViewController *)self navigationController];
    id v9 = (id)[v8 popViewControllerAnimated:1];
  }
  merchantTokenResponse = self->_merchantTokenResponse;
  self->_merchantTokenResponse = 0;

  [(PKSectionTableViewController *)self updateSectionVisibilityAndReloadIfNecessaryForSection:16];

  [(PKPaymentTransactionDetailViewController *)self _fetchMerchantToken];
}

- (id)_applePayOrderRowCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"PKPaymentTransactionOrderCellReuseIdentifier"];
  applePayOrderRowViewModels = self->_applePayOrderRowViewModels;
  uint64_t v9 = [v6 row];

  int v10 = [(NSArray *)applePayOrderRowViewModels objectAtIndexedSubscript:v9];
  [v10 configureCell:v7];

  return v7;
}

- (id)_applePayBarcodeRowCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"PKPaymentTransactionBarcodeCellReuseIdentifier"];
  applePayBarcodeRowViewModels = self->_applePayBarcodeRowViewModels;
  uint64_t v9 = [v6 row];

  int v10 = [(NSArray *)applePayBarcodeRowViewModels objectAtIndexedSubscript:v9];
  [v10 configureCell:v7];

  return v7;
}

- (id)_applePayReceiptRowCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"PKPaymentTransactionReceiptCellReuseIdentifier"];
  applePayReceiptRowViewModels = self->_applePayReceiptRowViewModels;
  uint64_t v9 = [v6 row];

  int v10 = [(NSArray *)applePayReceiptRowViewModels objectAtIndexedSubscript:v9];
  [v10 configureCell:v7];

  return v7;
}

- (id)_debugDetailCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [a4 row];
  if (v7 == 1)
  {
    uint64_t v8 = [(PKPaymentTransactionDetailViewController *)self _tableView:v6 actionButtonCellForSection:23];
    uint64_t v9 = [v8 textLabel];
    [v9 setText:@"Transaction Details"];

    [v8 setAccessoryType:1];
  }
  else if (v7)
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = [(PKPaymentTransactionDetailViewController *)self _transactionIdentifierCellForTableView:v6];
  }

  return v8;
}

- (id)_awardCellForTableView:(id)a3
{
  uint64_t v4 = [a3 dequeueReusableCellWithIdentifier:@"PKPaymentTransactionAwardCellReuseIdentifier"];
  id v5 = [v4 textLabel];
  if (self->_inBridge) {
    [MEMORY[0x1E4FB1618] whiteColor];
  }
  else {
  id v6 = [MEMORY[0x1E4FB1618] labelColor];
  }
  [v5 setTextColor:v6];

  return v4;
}

- (id)_tableView:(id)a3 cellForAmountDetailLineItemAtIndex:(int64_t)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  int v10 = [(NSArray *)self->_lineItems objectAtIndexedSubscript:a4];
  if ([v10 lineItemType] == 10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v11 = v10;
    long long v12 = [v8 dequeueReusableCellWithIdentifier:@"PKPaymentTransactionReceiptLineItemCellReuseIdentifier" forIndexPath:v9];
    [v12 setSuppressImage:self->_suppressReceiptImages];
    long long v13 = [v11 label];
    [v12 setPrimaryText:v13];

    long long v14 = [v11 image];
    [v12 setImage:v14];

    id v15 = [v11 secondaryLabel];
    [v12 setSecondaryText:v15];

    uint64_t v16 = [v11 tertiaryLabel];
    [v12 setTertiaryText:v16];

    id v17 = [v11 value];
    [v12 setAmountText:v17];

    uint64_t v18 = [v11 hasTrailingLineSeperator];
    [v12 setHasTrailingLineSeparator:v18];
    [(PKPaymentTransactionDetailViewController *)self _applyAmountDetailSeparatorInsetForTableView:v8 cell:v12];
  }
  else if ([v10 lineItemType] == 11)
  {
    long long v12 = [v8 dequeueReusableCellWithIdentifier:@"PKPaymentTransactionDateLineItemCellReuseIdentifier"];
    dispatch_time_t v19 = (void *)*MEMORY[0x1E4FB28C8];
    id v20 = (void *)*MEMORY[0x1E4FB27F0];
    uint64_t v21 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28C8], (void *)*MEMORY[0x1E4FB27F0], 2, 0);
    uint64_t v22 = PKFontForDefaultDesign(v19, v20, 0, 0);
    id v23 = [v12 textLabel];
    uint64_t v24 = [v12 detailTextLabel];
    __int16 v25 = [v10 label];
    [v23 setText:v25];

    [v23 setFont:v21];
    if (self->_inBridge) {
      [MEMORY[0x1E4FB1618] whiteColor];
    }
    else {
    int v31 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    }
    id v32 = [v10 value];
    [v24 setText:v32];

    [v24 setTextColor:v31];
    [v24 setFont:v22];
    [v12 setAccessibilityIdentifier:*MEMORY[0x1E4F85678]];
  }
  else
  {
    long long v12 = [v8 dequeueReusableCellWithIdentifier:@"PKPaymentTransactionDetailLineItemCellReuseIdentifier"];
    int v26 = [v10 isEmphasized];
    uint64_t v27 = (void *)*MEMORY[0x1E4FB28C8];
    id v28 = (void *)*MEMORY[0x1E4FB27F0];
    uint64_t v29 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28C8], (void *)*MEMORY[0x1E4FB27F0], 0, 0);
    uint64_t v30 = PKFontForDefaultDesign(v27, v28, 2, 0);
    id v38 = v9;
    if (self->_inBridge) {
      [MEMORY[0x1E4FB1618] whiteColor];
    }
    else {
    uint64_t v33 = [MEMORY[0x1E4FB1618] labelColor];
    }
    id v34 = [v10 label];
    uint64_t v35 = [v10 value];
    objc_msgSend(v12, "setHasTrailingLineSeperator:", objc_msgSend(v10, "hasTrailingLineSeperator"));
    if (v26) {
      uint64_t v36 = v30;
    }
    else {
      uint64_t v36 = v29;
    }
    [v12 setTitleFont:v36];
    [v12 setTitleColor:v33];
    [v12 setTitleText:v34];
    [v12 setValueFont:v36];
    [v12 setValueColor:v33];
    [v12 setValueText:v35];
    [(PKPaymentTransactionDetailViewController *)self _applyAmountDetailSeparatorInsetForTableView:v8 cell:v12];

    id v9 = v38;
  }

  return v12;
}

- (void)_tableView:(id)a3 willDisplayAmountDetailsCell:(id)a4 atIndexPath:(id)a5
{
  id v10 = a4;
  id v7 = a5;
  if (-[PKPaymentTransactionDetailViewController _amountDetailsRowForIndex:](self, "_amountDetailsRowForIndex:", [v7 row]) == 4)
  {
    unint64_t v8 = -[PKPaymentTransactionDetailViewController _lineItemItemForRowIndex:](self, "_lineItemItemForRowIndex:", [v7 row]);
    if (v8 < [(NSArray *)self->_lineItems count])
    {
      id v9 = [(NSArray *)self->_lineItems objectAtIndexedSubscript:v8];
      objc_msgSend(v10, "setSeparatorStyle:", objc_msgSend(v9, "hasTrailingLineSeperator"));
    }
  }
}

- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __94__PKPaymentTransactionDetailViewController_transactionSourceIdentifier_didReceiveTransaction___block_invoke;
  v7[3] = &unk_1E59CA870;
  id v8 = v5;
  id v9 = self;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __94__PKPaymentTransactionDetailViewController_transactionSourceIdentifier_didReceiveTransaction___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) identifier];
  id v3 = [*(id *)(*(void *)(a1 + 40) + 1400) identifier];
  char v4 = [v2 isEqualToString:v3];
  id v5 = PKLogFacilityTypeGetObject();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      id v7 = *(void **)(a1 + 32);
      id v8 = *(void **)(*(void *)(a1 + 40) + 1400);
      int v9 = 138412546;
      id v10 = v8;
      __int16 v11 = 2112;
      long long v12 = v7;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Transaction currently being viewed, %@, has been updated to transaction %@", (uint8_t *)&v9, 0x16u);
    }

    [*(id *)(a1 + 40) setTransaction:*(void *)(a1 + 32)];
  }
  else
  {
    if (v6)
    {
      int v9 = 138412546;
      id v10 = v2;
      __int16 v11 = 2112;
      long long v12 = v3;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Received an update to a different transaction, %@, while viewing transaction details for transaction: %@.", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (void)transactionSourceIdentifier:(id)a3 didRemoveTransactionWithIdentifier:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __107__PKPaymentTransactionDetailViewController_transactionSourceIdentifier_didRemoveTransactionWithIdentifier___block_invoke;
  v7[3] = &unk_1E59CA870;
  void v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __107__PKPaymentTransactionDetailViewController_transactionSourceIdentifier_didRemoveTransactionWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1400) identifier];
  if ([*(id *)(a1 + 40) isEqualToString:v2])
  {
    id v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      int v7 = 138412290;
      uint64_t v8 = v4;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Transaction currently being viewed has been deleted. Dismissing transaction details. TransactionID: %@", (uint8_t *)&v7, 0xCu);
    }

    id v5 = [*(id *)(a1 + 32) navigationController];
    id v6 = (id)[v5 popViewControllerAnimated:1];
  }
}

- (void)transactionWithIdentifier:(id)a3 didDownloadTransactionReceipt:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__PKPaymentTransactionDetailViewController_transactionWithIdentifier_didDownloadTransactionReceipt___block_invoke;
  block[3] = &unk_1E59CA8E8;
  id v11 = v7;
  id v12 = v6;
  uint64_t v13 = self;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __100__PKPaymentTransactionDetailViewController_transactionWithIdentifier_didDownloadTransactionReceipt___block_invoke(void *a1)
{
  if (!a1[4]) {
    return;
  }
  id v2 = (void *)a1[5];
  id v3 = [*(id *)(a1[6] + 1400) identifier];
  id v4 = v2;
  id v5 = v3;
  if (v4 == v5)
  {

LABEL_8:
    id v7 = (void *)a1[6];
    uint64_t v8 = a1[4];
    [v7 _updateWithTransactionReceipt:v8];
    return;
  }
  id v9 = v5;
  if (v4 && v5)
  {
    int v6 = [v4 isEqualToString:v5];

    if (!v6) {
      return;
    }
    goto LABEL_8;
  }
}

- (void)didUpdateFamilyMembers:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __67__PKPaymentTransactionDetailViewController_didUpdateFamilyMembers___block_invoke;
  v6[3] = &unk_1E59CA870;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __67__PKPaymentTransactionDetailViewController_didUpdateFamilyMembers___block_invoke(uint64_t a1)
{
  id obj = (id)[objc_alloc(MEMORY[0x1E4F84710]) initWithFamilyMembers:*(void *)(a1 + 32)];
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 1224), obj);
    [*(id *)(a1 + 40) reloadData];
  }
}

- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContactProperty:(id)a4
{
  return 1;
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  id v5 = [(PKPaymentTransactionDetailViewController *)self navigationController];
  id v4 = (id)[v5 popViewControllerAnimated:1];
}

- (void)submitAnswer:(id)a3
{
  id v5 = a3;
  if (!self->_submittingAnswer)
  {
    objc_storeStrong((id *)&self->_submittingAnswer, a3);
    int v6 = [(PKPaymentTransaction *)self->_transaction unansweredQuestions];
    id v7 = [v6 anyObject];
    uint64_t v8 = [v7 type];

    paymentServiceDataProvider = self->_paymentServiceDataProvider;
    id v10 = [(PKPaymentTransaction *)self->_transaction identifier];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __57__PKPaymentTransactionDetailViewController_submitAnswer___block_invoke;
    v11[3] = &unk_1E59E0970;
    v11[4] = self;
    id v12 = v5;
    [(PKPaymentDataProvider *)paymentServiceDataProvider submitTransactionAnswerForTransaction:v10 questionType:v8 answer:v12 completion:v11];
  }
}

void __57__PKPaymentTransactionDetailViewController_submitAnswer___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__PKPaymentTransactionDetailViewController_submitAnswer___block_invoke_2;
  block[3] = &unk_1E59CE888;
  objc_copyWeak(&v11, &location);
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __57__PKPaymentTransactionDetailViewController_submitAnswer___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained) {
    goto LABEL_6;
  }
  int v26 = WeakRetained;
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v4 = +[PKAccountFlowController displayableErrorForError:v3 featureIdentifier:2 genericErrorTitle:0 genericErrorMessage:0];
    id v5 = PKAlertForDisplayableErrorWithHandlers(v4, 0, 0, 0);
    [v26 presentViewController:v5 animated:1 completion:0];
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = *(void **)(v6 + 1312);
    *(void *)(v6 + 1312) = 0;

    [*(id *)(a1 + 40) updateSectionVisibilityAndReloadIfNecessaryForSection:0];
LABEL_4:

LABEL_5:
    id WeakRetained = v26;
    goto LABEL_6;
  }
  id v8 = (void *)*MEMORY[0x1E4F87C20];
  id v9 = *(id *)(a1 + 48);
  id v10 = v8;
  if (v9 == v10)
  {

LABEL_15:
    if ([v26[175] transactionStatus] == 2)
    {
      uint64_t v13 = (void *)MEMORY[0x1E4FB1418];
      long long v14 = PKLocalizedFeatureString();
      id v15 = PKLocalizedFeatureString();
      uint64_t v16 = [v13 alertControllerWithTitle:v14 message:v15 preferredStyle:1];

      id v17 = (void *)MEMORY[0x1E4FB1410];
      uint64_t v18 = PKLocalizedFeatureString();
      dispatch_time_t v19 = [v17 actionWithTitle:v18 style:0 handler:0];
      [v16 addAction:v19];

      [v26 presentViewController:v16 animated:1 completion:0];
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  id v11 = v10;
  if (!v9 || !v10)
  {

    goto LABEL_18;
  }
  int v12 = [v9 isEqualToString:v10];

  if (v12) {
    goto LABEL_15;
  }
LABEL_18:
  id v20 = (void *)*MEMORY[0x1E4F87C18];
  id v4 = *(id *)(a1 + 48);
  id v21 = v20;
  if (v4 == v21)
  {

LABEL_24:
    BOOL v23 = [v26[175] effectiveTransactionSource] == 6;
    id WeakRetained = v26;
    if (v23)
    {
      uint64_t v24 = [*(id *)(*(void *)(a1 + 40) + 1232) accountIdentifier];
      PKCardSetShouldShowVPANReissuedMessage();

      __int16 v25 = [*(id *)(*(void *)(a1 + 40) + 1400) altDSID];
      PKCardSetAltDSIDForVPANReissuedMessage();

      [v26 _presentCardNumberUpdatedAlert];
      goto LABEL_5;
    }
    goto LABEL_6;
  }
  id v5 = v21;
  if (!v4 || !v21) {
    goto LABEL_4;
  }
  int v22 = [v4 isEqualToString:v21];

  id WeakRetained = v26;
  if (v22) {
    goto LABEL_24;
  }
LABEL_6:
}

- (void)_presentCardNumberUpdatedAlert
{
  id v16 = [(PKPaymentTransaction *)self->_transaction altDSID];
  if (!v16) {
    goto LABEL_7;
  }
  uint64_t v3 = PKCurrentUserAltDSID();
  id v4 = v16;
  id v5 = v3;
  if (v4 == v5)
  {

    goto LABEL_7;
  }
  uint64_t v6 = v5;
  if (v5)
  {
    char v7 = [v4 isEqualToString:v5];

    if ((v7 & 1) == 0) {
      goto LABEL_9;
    }
LABEL_7:
    uint64_t v8 = PKLocalizedFeatureString();
    goto LABEL_10;
  }

LABEL_9:
  uint64_t v8 = PKLocalizedMadisonString(&cfstr_TransactionAns_1.isa);
LABEL_10:
  id v9 = (void *)v8;
  id v10 = (void *)MEMORY[0x1E4FB1418];
  id v11 = PKLocalizedFeatureString();
  int v12 = [v10 alertControllerWithTitle:v11 message:v9 preferredStyle:1];

  uint64_t v13 = (void *)MEMORY[0x1E4FB1410];
  long long v14 = PKLocalizedFeatureString();
  id v15 = [v13 actionWithTitle:v14 style:0 handler:0];
  [v12 addAction:v15];

  [(PKPaymentTransactionDetailViewController *)self presentViewController:v12 animated:1 completion:0];
}

- (void)_loadAppPrivacyURLFromAppStore
{
  uint64_t v3 = [(PKPaymentTransaction *)self->_transaction releasedData];
  id v4 = [v3 application];
  id v5 = [v4 bundleIdentifier];

  if (v5)
  {
    objc_initWeak(&location, self);
    self->_privacyURLCallInProgress = 1;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    void v7[2] = __74__PKPaymentTransactionDetailViewController__loadAppPrivacyURLFromAppStore__block_invoke;
    v7[3] = &unk_1E59DA350;
    objc_copyWeak(&v8, &location);
    id v6 = PKLookupAppStoreApplicationPrivacyPolicy(v5, v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __74__PKPaymentTransactionDetailViewController__loadAppPrivacyURLFromAppStore__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __74__PKPaymentTransactionDetailViewController__loadAppPrivacyURLFromAppStore__block_invoke_2;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __74__PKPaymentTransactionDetailViewController__loadAppPrivacyURLFromAppStore__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = *(void **)(a1 + 32);
    if (v4)
    {
      objc_storeStrong((id *)WeakRetained + 168, v4);
      [v3 reloadData];
      v3[1352] = 0;
    }
    else
    {
      id v5 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "PKPaymentTransactionDetailViewController failed to get privacy policy.", v6, 2u);
      }
    }
  }
}

- (void)_fetchAppPrivacyURL
{
  if (self->_privacyURL
    || self->_privacyURLCallInProgress
    || [(PKPaymentTransaction *)self->_transaction transactionType] != 15)
  {
    return;
  }
  uint64_t v3 = [(PKPaymentTransaction *)self->_transaction transactionSource];
  if (v3 != 2)
  {
    if (v3 != 1) {
      return;
    }
    id v4 = [(PKPaymentTransaction *)self->_transaction releasedData];
    id v5 = [v4 privacyPolicyURL];
    privacyURL = self->_privacyURL;
    self->_privacyURL = v5;

    goto LABEL_16;
  }
  id v7 = [(PKPaymentTransaction *)self->_transaction releasedData];
  id v8 = [v7 application];
  uint64_t v9 = [v8 client];

  if (v9 == 1)
  {
    id v4 = [(PKPaymentTransaction *)self->_transaction releasedData];
    id v10 = [v4 privacyPolicyURL];
    id v11 = v10;
    if (v10)
    {
      int v12 = v10;
    }
    else
    {
      int v12 = [MEMORY[0x1E4F1CB10] URLWithString:*MEMORY[0x1E4F87090]];
    }
    uint64_t v13 = self->_privacyURL;
    self->_privacyURL = v12;

LABEL_16:
    [(PKSectionTableViewController *)self reloadData];
    return;
  }

  [(PKPaymentTransactionDetailViewController *)self _loadAppPrivacyURLFromAppStore];
}

- (void)_openBankConnectDigitalServicingURL
{
  id v2 = [(PKPaymentTransaction *)self->_transaction bankConnectDigitalServicingURL];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    _DWORD v4[2] = __79__PKPaymentTransactionDetailViewController__openBankConnectDigitalServicingURL__block_invoke;
    v4[3] = &unk_1E59E08D0;
    id v5 = v2;
    [v3 openURL:v5 configuration:0 completionHandler:v4];
  }
}

void __79__PKPaymentTransactionDetailViewController__openBankConnectDigitalServicingURL__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [*(id *)(a1 + 32) absoluteString];
      int v9 = 138412546;
      id v10 = v8;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Failed to open digital servicing url: %@ with error: %@", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (void)_openBankConnectPostInstallmentURL
{
  id v2 = [(PKPaymentTransaction *)self->_transaction bankConnectPostInstallmentURL];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    _DWORD v4[2] = __78__PKPaymentTransactionDetailViewController__openBankConnectPostInstallmentURL__block_invoke;
    v4[3] = &unk_1E59E08D0;
    id v5 = v2;
    [v3 openURL:v5 configuration:0 completionHandler:v4];
  }
}

void __78__PKPaymentTransactionDetailViewController__openBankConnectPostInstallmentURL__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [*(id *)(a1 + 32) absoluteString];
      int v9 = 138412546;
      id v10 = v8;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Failed to open post installment url: %@ with error: %@", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (void)_openBankConnectRedeemRewardsURL
{
  id v2 = [(PKPaymentTransaction *)self->_transaction bankConnectRedeemRewardsURL];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    _DWORD v4[2] = __76__PKPaymentTransactionDetailViewController__openBankConnectRedeemRewardsURL__block_invoke;
    v4[3] = &unk_1E59E08D0;
    id v5 = v2;
    [v3 openURL:v5 configuration:0 completionHandler:v4];
  }
}

void __76__PKPaymentTransactionDetailViewController__openBankConnectRedeemRewardsURL__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [*(id *)(a1 + 32) absoluteString];
      int v9 = 138412546;
      id v10 = v8;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Failed to open redeem rewards url: %@ with error: %@", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (void)_openAppPrivacyURL
{
  void v15[4] = *MEMORY[0x1E4F143B8];
  if (self->_privacyURL)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F843E0];
    uint64_t v4 = *MEMORY[0x1E4F87038];
    uint64_t v5 = *MEMORY[0x1E4F86380];
    uint64_t v6 = *MEMORY[0x1E4F86730];
    v14[0] = *MEMORY[0x1E4F86308];
    v14[1] = v6;
    uint64_t v7 = *MEMORY[0x1E4F86608];
    v15[0] = v5;
    v15[1] = v7;
    uint64_t v8 = *MEMORY[0x1E4F867D0];
    id v14[2] = *MEMORY[0x1E4F86120];
    v14[3] = v8;
    uint64_t v9 = *MEMORY[0x1E4F86540];
    v15[2] = *MEMORY[0x1E4F86620];
    v15[3] = v9;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
    [v3 subject:v4 sendEvent:v10];

    __int16 v11 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    privacyURL = self->_privacyURL;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __62__PKPaymentTransactionDetailViewController__openAppPrivacyURL__block_invoke;
    v13[3] = &unk_1E59E08D0;
    void v13[4] = self;
    [v11 openURL:privacyURL configuration:0 completionHandler:v13];
  }
}

void __62__PKPaymentTransactionDetailViewController__openAppPrivacyURL__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 1344) absoluteString];
      int v9 = 138412546;
      id v10 = v8;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Failed to re-direct url: %@ to Safari with error: %@", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (void)_showDeleteConfirmationSheet
{
  if (self->_inBridge) {
    uint64_t v3 = @"TRANSACTION_DELETE_ACTIVITY_SHEET_TITLE_WATCH";
  }
  else {
    uint64_t v3 = @"TRANSACTION_DELETE_ACTIVITY_SHEET_TITLE_IPHONE";
  }
  uint64_t v4 = PKLocalizedIdentityString(&v3->isa);
  id v5 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v4 message:0 preferredStyle:0];
  objc_initWeak(&location, self);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __72__PKPaymentTransactionDetailViewController__showDeleteConfirmationSheet__block_invoke;
  id v16 = &unk_1E59CCFF0;
  objc_copyWeak(&v17, &location);
  id v6 = _Block_copy(&v13);
  uint64_t v7 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v8 = PKLocalizedIdentityString(&cfstr_TransactionDel_0.isa);
  int v9 = objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 2, v6, v13, v14, v15, v16);

  id v10 = (void *)MEMORY[0x1E4FB1410];
  __int16 v11 = PKLocalizedIdentityString(&cfstr_TransactionDel_1.isa);
  id v12 = [v10 actionWithTitle:v11 style:1 handler:0];

  [v5 addAction:v9];
  [v5 addAction:v12];
  [(PKPaymentTransactionDetailViewController *)self presentViewController:v5 animated:1 completion:0];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __72__PKPaymentTransactionDetailViewController__showDeleteConfirmationSheet__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _deleteTransaction];
    id WeakRetained = v2;
  }
}

- (void)_deleteTransaction
{
  void v24[4] = *MEMORY[0x1E4F143B8];
  if ([(PKPaymentTransaction *)self->_transaction transactionType] == 15)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F843E0];
    uint64_t v4 = *MEMORY[0x1E4F87038];
    uint64_t v5 = *MEMORY[0x1E4F86380];
    uint64_t v6 = *MEMORY[0x1E4F86730];
    v23[0] = *MEMORY[0x1E4F86308];
    v23[1] = v6;
    uint64_t v7 = *MEMORY[0x1E4F86608];
    v24[0] = v5;
    v24[1] = v7;
    uint64_t v8 = *MEMORY[0x1E4F867D0];
    v23[2] = *MEMORY[0x1E4F86120];
    v23[3] = v8;
    uint64_t v9 = *MEMORY[0x1E4F86540];
    v24[2] = *MEMORY[0x1E4F86B80];
    v24[3] = v9;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:4];
    [v3 subject:v4 sendEvent:v10];
  }
  transaction = self->_transaction;
  if (transaction)
  {
    id v12 = [(PKPaymentTransaction *)transaction identifier];
    BOOL v13 = v12 == 0;
  }
  else
  {
    BOOL v13 = 1;
  }
  char v14 = objc_opt_respondsToSelector();
  if (v13 || (v14 & 1) == 0)
  {
    id v17 = (void *)MEMORY[0x1E4FB1418];
    uint64_t v18 = PKLocalizedIdentityString(&cfstr_TransactionDel_3.isa);
    dispatch_time_t v19 = PKLocalizedIdentityString(&cfstr_TransactionDel_4.isa);
    id v16 = [v17 alertControllerWithTitle:v18 message:v19 preferredStyle:1];

    id v20 = (void *)MEMORY[0x1E4FB1410];
    id v21 = PKLocalizedIdentityString(&cfstr_TransactionDel_5.isa);
    int v22 = [v20 actionWithTitle:v21 style:0 handler:0];
    [v16 addAction:v22];

    [(PKPaymentTransactionDetailViewController *)self presentViewController:v16 animated:1 completion:0];
  }
  else
  {
    paymentServiceDataProvider = self->_paymentServiceDataProvider;
    id v16 = [(PKPaymentTransaction *)self->_transaction identifier];
    [(PKPaymentDataProvider *)paymentServiceDataProvider deletePaymentTransactionWithIdentifier:v16];
  }
}

- (void)thresholdTopUpController:(id)a3 requestsPushViewController:(id)a4
{
  id v5 = a4;
  id v6 = [(PKPaymentTransactionDetailViewController *)self navigationController];
  [v6 pushViewController:v5 animated:1];
}

- (void)thresholdTopUpController:(id)a3 requestsDismissViewController:(id)a4
{
}

- (void)thresholdTopUpController:(id)a3 requestsPresentViewController:(id)a4
{
}

- (id)presentationSceneIdentifierForTopUpController:(id)a3
{
  uint64_t v3 = [(PKPaymentTransactionDetailViewController *)self view];
  uint64_t v4 = [v3 window];
  id v5 = [v4 windowScene];
  id v6 = [v5 _sceneIdentifier];

  return v6;
}

- (void)thresholdTopUpControllerCompletedSetup:(id)a3
{
  id v4 = [(PKPaymentTransactionDetailViewController *)self navigationController];
  uint64_t v3 = [v4 presentingViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)thresholdTopUpController:(id)a3 requestsPopViewController:(id)a4
{
  id v5 = [(PKPaymentTransactionDetailViewController *)self navigationController];
  id v4 = (id)[v5 popViewControllerAnimated:1];
}

- (void)recurringPaymentsChanged
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __68__PKPaymentTransactionDetailViewController_recurringPaymentsChanged__block_invoke;
  v2[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E4F14428], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __68__PKPaymentTransactionDetailViewController_recurringPaymentsChanged__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained[175];
    id v5 = [v4 recurringPeerPayment];

    if (v5)
    {
      id v6 = [MEMORY[0x1E4F84E00] sharedInstance];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      void v7[2] = __68__PKPaymentTransactionDetailViewController_recurringPaymentsChanged__block_invoke_2;
      v7[3] = &unk_1E59CF060;
      objc_copyWeak(&v9, v1);
      id v8 = v4;
      [v6 recurringPaymentsWithCompletion:v7];

      objc_destroyWeak(&v9);
    }
  }
}

void __68__PKPaymentTransactionDetailViewController_recurringPaymentsChanged__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__PKPaymentTransactionDetailViewController_recurringPaymentsChanged__block_invoke_3;
  block[3] = &unk_1E59CB378;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
}

void __68__PKPaymentTransactionDetailViewController_recurringPaymentsChanged__block_invoke_3(id *a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v18 = WeakRetained;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v4 = a1[4];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v20 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          id v10 = [a1[5] recurringPeerPayment];
          __int16 v11 = [v10 identifier];
          id v12 = [v9 identifier];
          id v13 = v11;
          id v14 = v12;
          if (v13 == v14)
          {

LABEL_19:
            [a1[5] setRecurringPeerPayment:v9];

            goto LABEL_20;
          }
          id v15 = v14;
          if (v13) {
            BOOL v16 = v14 == 0;
          }
          else {
            BOOL v16 = 1;
          }
          if (v16)
          {
          }
          else
          {
            char v17 = [v13 isEqualToString:v14];

            if (v17) {
              goto LABEL_19;
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    [a1[5] setRecurringPeerPayment:0];
LABEL_20:
    id v3 = v18;
    [v18 setTransaction:a1[5]];
  }
}

- (void)_performDeleteOverride
{
  deleteOverrider = self->_deleteOverrider;
  if (deleteOverrider)
  {
    [(PKPaymentTransactionDetailViewControllerDeleteOverrider *)deleteOverrider transactionDetailViewControllerDidDeleteTransaction:self->_transaction];
    id v5 = [(PKPaymentTransactionDetailViewController *)self navigationController];
    id v4 = (id)[v5 popViewControllerAnimated:1];
  }
}

- (void)physicalCardsChanged:(id)a3 forAccountIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __86__PKPaymentTransactionDetailViewController_physicalCardsChanged_forAccountIdentifier___block_invoke;
  v10[3] = &unk_1E59CB378;
  objc_copyWeak(&v13, &location);
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __86__PKPaymentTransactionDetailViewController_physicalCardsChanged_forAccountIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained[154];
  if (v3)
  {
    id v11 = WeakRetained;
    id v4 = *(void **)(a1 + 32);
    id v5 = [v3 accountIdentifier];
    id v6 = v4;
    id v7 = v5;
    id v8 = v7;
    if (v6 == v7)
    {
    }
    else
    {
      if (!v6 || !v7)
      {

LABEL_11:
        id WeakRetained = v11;
        goto LABEL_12;
      }
      int v9 = [v6 isEqualToString:v7];

      if (!v9) {
        goto LABEL_11;
      }
    }
    int v10 = [v11 shouldMapSection:2];

    id WeakRetained = v11;
    if (!v10) {
      goto LABEL_12;
    }
    [v11[140] updateWithPhysicalCards:*(void *)(a1 + 40)];
    id v8 = objc_alloc_init(MEMORY[0x1E4F28D60]);
    [v11 recomputeMappedSectionsAndReloadSections:v8];
    goto LABEL_11;
  }
LABEL_12:
}

- (PKPaymentTransaction)transaction
{
  return self->_transaction;
}

- (PKTransactionSourceCollection)transactionSourceCollection
{
  return self->_transactionSourceCollection;
}

- (PKPaymentDataProvider)paymentServiceDataProvider
{
  return self->_paymentServiceDataProvider;
}

- (PKPaymentTransactionDetailViewControllerDeleteOverrider)deleteOverrider
{
  return self->_deleteOverrider;
}

- (void)setDeleteOverrider:(id)a3
{
}

- (PKPaymentTransactionDetailHeaderView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
}

- (PKContactResolver)contactResolver
{
  return self->_contactResolver;
}

- (void)setContactResolver:(id)a3
{
}

- (BOOL)issuerAppDeepLinkingEnabled
{
  return self->_issuerAppDeepLinkingEnabled;
}

- (void)setIssuerAppDeepLinkingEnabled:(BOOL)a3
{
  self->_issuerAppDeepLinkingEnabled = a3;
}

- (BOOL)inBridge
{
  return self->_inBridge;
}

- (void)setInBridge:(BOOL)a3
{
  self->_BOOL inBridge = a3;
}

- (BOOL)associatedCreditStatementsLoaded
{
  return self->_associatedCreditStatementsLoaded;
}

- (void)setAssociatedCreditStatementsLoaded:(BOOL)a3
{
  self->_associatedCreditStatementsLoaded = a3;
}

- (NSArray)associatedCreditStatements
{
  return self->_associatedCreditStatements;
}

- (void)setAssociatedCreditStatements:(id)a3
{
}

- (UIImage)mapTilePlaceholderImage
{
  return self->_mapTilePlaceholderImage;
}

- (void)setMapTilePlaceholderImage:(id)a3
{
}

- (NSArray)lineItems
{
  return self->_lineItems;
}

- (void)setLineItems:(id)a3
{
}

- (PKPeerPaymentStatusResponse)peerPaymentStatusResponse
{
  return self->_peerPaymentStatusResponse;
}

- (void)setPeerPaymentStatusResponse:(id)a3
{
}

- (NSDateFormatter)transactionDateFormatter
{
  return self->_transactionDateFormatter;
}

- (void)setTransactionDateFormatter:(id)a3
{
}

- (NSDateFormatter)transactionLocalTimeDateFormatter
{
  return self->_transactionLocalTimeDateFormatter;
}

- (void)setTransactionLocalTimeDateFormatter:(id)a3
{
}

- (NSDateFormatter)productTimeZoneFormatter
{
  return self->_productTimeZoneFormatter;
}

- (void)setProductTimeZoneFormatter:(id)a3
{
}

- (NSDateFormatter)productTimeZoneMonthDayFormatter
{
  return self->_productTimeZoneMonthDayFormatter;
}

- (void)setProductTimeZoneMonthDayFormatter:(id)a3
{
}

- (NSDateFormatter)monthDayLocalFormatter
{
  return self->_monthDayLocalFormatter;
}

- (void)setMonthDayLocalFormatter:(id)a3
{
}

- (NSDateFormatter)monthDayYearLocalFormatter
{
  return self->_monthDayYearLocalFormatter;
}

- (void)setMonthDayYearLocalFormatter:(id)a3
{
}

- (NSDateFormatter)monthFormatter
{
  return self->_monthFormatter;
}

- (void)setMonthFormatter:(id)a3
{
}

- (NSTimeZone)productTimeZone
{
  return self->_productTimeZone;
}

- (void)setProductTimeZone:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productTimeZone, 0);
  objc_storeStrong((id *)&self->_monthFormatter, 0);
  objc_storeStrong((id *)&self->_monthDayYearLocalFormatter, 0);
  objc_storeStrong((id *)&self->_monthDayLocalFormatter, 0);
  objc_storeStrong((id *)&self->_productTimeZoneMonthDayFormatter, 0);
  objc_storeStrong((id *)&self->_productTimeZoneFormatter, 0);
  objc_storeStrong((id *)&self->_transactionLocalTimeDateFormatter, 0);
  objc_storeStrong((id *)&self->_transactionDateFormatter, 0);
  objc_storeStrong((id *)&self->_peerPaymentStatusResponse, 0);
  objc_storeStrong((id *)&self->_lineItems, 0);
  objc_storeStrong((id *)&self->_mapTilePlaceholderImage, 0);
  objc_storeStrong((id *)&self->_associatedCreditStatements, 0);
  objc_storeStrong((id *)&self->_contactResolver, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_deleteOverrider, 0);
  objc_storeStrong((id *)&self->_paymentServiceDataProvider, 0);
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_dataReleaseTransactionConfiguration, 0);
  objc_storeStrong((id *)&self->_associatedPaymentRewardsBalance, 0);
  objc_storeStrong((id *)&self->_bankConnectInstitution, 0);
  objc_storeStrong((id *)&self->_thresholdTopUpController, 0);
  objc_storeStrong((id *)&self->_privacyURL, 0);
  objc_storeStrong((id *)&self->_iconGenerator, 0);
  objc_storeStrong((id *)&self->_transactionFetcher, 0);
  objc_storeStrong((id *)&self->_submittingAnswer, 0);
  objc_storeStrong((id *)&self->_applePayReceiptRowViewModels, 0);
  objc_storeStrong((id *)&self->_applePayBarcodeRowViewModels, 0);
  objc_storeStrong((id *)&self->_applePayOrderRowViewModels, 0);
  objc_storeStrong((id *)&self->_merchantTokenResponse, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_physicalCards, 0);
  objc_storeStrong((id *)&self->_accountUser, 0);
  objc_storeStrong((id *)&self->_accountUserCollection, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);
  objc_storeStrong((id *)&self->_coarseLocationMonitor, 0);
  objc_storeStrong((id *)&self->_accountResolutionController, 0);
  objc_storeStrong((id *)&self->_transactionCellController, 0);
  objc_storeStrong((id *)&self->_transactionExplanation, 0);
  objc_storeStrong((id *)&self->_transactionTags, 0);
  objc_storeStrong((id *)&self->_associatedReceipt, 0);
  objc_storeStrong((id *)&self->_associatedPayLaterAccount, 0);
  objc_storeStrong((id *)&self->_associatedInstallmentPlans, 0);
  objc_storeStrong((id *)&self->_associatedTransaction, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_storeStrong((id *)&self->_physicalCardController, 0);
  objc_storeStrong((id *)&self->_lazyPeerPaymentController, 0);

  objc_storeStrong((id *)&self->_peerPaymentWebService, 0);
}

@end