@interface PKTransactionHistoryDataSource
- (BOOL)_updateGroup:(id)a3 withRegion:(id)a4;
- (BOOL)areTransactionsEditable;
- (BOOL)canDeleteItem:(id)a3;
- (BOOL)isListLayoutForSection:(unint64_t)a3;
- (BOOL)useLargeTitle;
- (CNContact)contact;
- (NSArray)groups;
- (NSIndexPath)headerIndexPath;
- (NSString)footerSecondaryTitle;
- (NSString)footerTitle;
- (PKCurrencyAmount)footerSecondaryTotal;
- (PKCurrencyAmount)footerTotal;
- (PKMerchant)merchant;
- (PKPaymentTransactionGroup)group;
- (PKTransactionHistoryDataSource)initWithFetcher:(id)a3 transactionSourceCollection:(id)a4 familyCollection:(id)a5 account:(id)a6 accountUserCollection:(id)a7 physicalCards:(id)a8 featuredTransaction:(id)a9 selectedTransactions:(id)a10 transactionHistory:(id)a11 type:(unint64_t)a12;
- (PKTransactionHistoryDataSource)initWithInstallmentPlan:(id)a3 transactionSourceCollection:(id)a4 familyCollection:(id)a5 account:(id)a6 accountUserCollection:(id)a7 physicalCards:(id)a8;
- (PKTransactionHistoryDataSource)initWithTransactionGroup:(id)a3 transactionSourceCollection:(id)a4 familyCollection:(id)a5 account:(id)a6 accountUserCollection:(id)a7 physicalCards:(id)a8 fetcher:(id)a9 transactionHistory:(id)a10;
- (PKTransactionHistoryDataSource)initWithTransactionGroups:(id)a3 headerGroup:(id)a4 regionUpdater:(id)a5 tokens:(id)a6 transactionSourceCollection:(id)a7 familyCollection:(id)a8 account:(id)a9 accountUserCollection:(id)a10 physicalCards:(id)a11;
- (PKTransactionHistoryDataSourceDelegate)customDelegate;
- (id)_contactKeysToFetch;
- (id)_groupItemForTransaction:(id)a3;
- (id)_headerItem;
- (id)_totalDailyCashRewardsFromTransactions:(id)a3;
- (id)_totalFromGroups:(id)a3;
- (id)_totalPaymentsFromTransactions:(id)a3 startDate:(id)a4 endDate:(id)a5;
- (id)_totalRewardsFromTransactions:(id)a3;
- (id)_totalSpendingFromTransactions:(id)a3 startDate:(id)a4 endDate:(id)a5;
- (id)_transactionItemForTransaction:(id)a3;
- (id)footerTextItemForSection:(unint64_t)a3;
- (id)itemAtIndexPath:(id)a3;
- (id)navigationBarTitle;
- (id)titleForSection:(unint64_t)a3;
- (unint64_t)numberOfItemsInSection:(unint64_t)a3;
- (unint64_t)numberOfSections;
- (unint64_t)transactionHistoryItemsCount;
- (unint64_t)type;
- (void)_handleAccountsChangedNotification:(id)a3;
- (void)_handleCoarseLocationChangedNotification:(id)a3;
- (void)_handleTransactionHistoryUpdated:(id)a3;
- (void)_loadContact;
- (void)_loadTransactionReceipt;
- (void)_notifyContentLoadedIfNecessary;
- (void)_p2pTotalsFromTransactions:(id)a3 received:(id *)a4 sent:(id *)a5;
- (void)_reloadTransactions;
- (void)_updateFooterTotalFromGroup:(id)a3;
- (void)_updateInstallmentPlan;
- (void)bankConnectConsentStatusDidChange:(unint64_t)a3;
- (void)dealloc;
- (void)deleteItem:(id)a3 completionHandler:(id)a4;
- (void)deleteItems:(id)a3;
- (void)didUpdateTransactions:(id)a3;
- (void)physicalCardsChanged:(id)a3 forAccountIdentifier:(id)a4;
- (void)setCustomDelegate:(id)a3;
- (void)setDataSourceDelegate:(id)a3;
- (void)setTransactionHistory:(id)a3;
- (void)updateGroup:(id)a3;
- (void)updateGroups:(id)a3 headerGroup:(id)a4;
- (void)worldRegionUpdated:(id)a3 updatedRegion:(id)a4;
@end

@implementation PKTransactionHistoryDataSource

- (PKTransactionHistoryDataSource)initWithFetcher:(id)a3 transactionSourceCollection:(id)a4 familyCollection:(id)a5 account:(id)a6 accountUserCollection:(id)a7 physicalCards:(id)a8 featuredTransaction:(id)a9 selectedTransactions:(id)a10 transactionHistory:(id)a11 type:(unint64_t)a12
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v77 = a3;
  id v76 = a4;
  id v75 = a5;
  id v74 = a6;
  id v73 = a7;
  id v19 = a8;
  id v78 = a9;
  id v79 = a10;
  id v20 = a11;
  v88.receiver = self;
  v88.super_class = (Class)PKTransactionHistoryDataSource;
  v21 = [(PKTransactionHistoryDataSource *)&v88 init];
  v22 = v21;
  if (v21)
  {
    v21->_unint64_t type = a12;
    objc_storeStrong((id *)&v21->_featuredTransaction, a9);
    objc_storeStrong((id *)&v22->_selectedTransactions, a10);
    objc_storeStrong((id *)&v22->_transactionFetcher, a3);
    objc_storeStrong((id *)&v22->_familyCollection, a5);
    [(PKDashboardTransactionFetcher *)v22->_transactionFetcher setDelegate:v22];
    objc_storeStrong((id *)&v22->_transactionSourceCollection, a4);
    uint64_t v23 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    currentCalendar = v22->_currentCalendar;
    v22->_currentCalendar = (NSCalendar *)v23;

    uint64_t v25 = [MEMORY[0x1E4F845B8] sharedInstance];
    coarseLocationMonitor = v22->_coarseLocationMonitor;
    v22->_coarseLocationMonitor = (PKCoarseLocationMonitor *)v25;

    v27 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v27 addObserver:v22 selector:sel__handleCoarseLocationChangedNotification_ name:*MEMORY[0x1E4F87108] object:v22->_coarseLocationMonitor];

    objc_storeStrong((id *)&v22->_account, a6);
    objc_storeStrong((id *)&v22->_accountUserCollection, a7);
    uint64_t v28 = [v19 copy];
    physicalCards = v22->_physicalCards;
    v22->_physicalCards = (NSSet *)v28;

    v30 = (PKPaymentDataProvider *)objc_alloc_init(MEMORY[0x1E4F84A88]);
    dataProvider = v22->_dataProvider;
    v22->_dataProvider = v30;

    uint64_t v32 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
    headerIndexPath = v22->_headerIndexPath;
    v22->_headerIndexPath = (NSIndexPath *)v32;

    uint64_t v34 = [MEMORY[0x1E4F84270] sharedInstance];
    accountService = v22->_accountService;
    v22->_accountService = (PKAccountService *)v34;

    [(PKAccountService *)v22->_accountService registerObserver:v22];
    unint64_t type = v22->_type;
    if (type == 1)
    {
      v47 = [v78 merchant];
      v48 = v47;
      if (v47)
      {
        id v49 = v47;
      }
      else
      {
        v50 = [v79 transactions];
        v51 = [v50 firstObject];
        v52 = [v51 merchant];
        v53 = v52;
        if (v52)
        {
          id v49 = v52;
        }
        else
        {
          v54 = [v20 firstObject];
          id v49 = [v54 merchant];
        }
      }

      if (![v49 hasMapsMatch] || objc_msgSend(v49, "useRawMerchantData"))
      {
        long long v86 = 0u;
        long long v87 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        v55 = [v79 transactions];
        uint64_t v56 = [v55 countByEnumeratingWithState:&v84 objects:v90 count:16];
        if (v56)
        {
          uint64_t v57 = v56;
          uint64_t v58 = *(void *)v85;
          while (2)
          {
            for (uint64_t i = 0; i != v57; ++i)
            {
              if (*(void *)v85 != v58) {
                objc_enumerationMutation(v55);
              }
              v60 = [*(id *)(*((void *)&v84 + 1) + 8 * i) merchant];
              if (([v60 useRawMerchantData] & 1) == 0)
              {
                uint64_t v61 = [v60 mapsBrand];
                if (v61)
                {
                  v62 = (void *)v61;

                  goto LABEL_24;
                }
              }
            }
            uint64_t v57 = [v55 countByEnumeratingWithState:&v84 objects:v90 count:16];
            if (v57) {
              continue;
            }
            break;
          }
        }
        v60 = v49;
LABEL_24:

        id v49 = v60;
      }
      if (![v49 hasMapsMatch] || objc_msgSend(v49, "useRawMerchantData"))
      {
        long long v82 = 0u;
        long long v83 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        id v63 = v20;
        uint64_t v64 = [v63 countByEnumeratingWithState:&v80 objects:v89 count:16];
        if (v64)
        {
          uint64_t v65 = v64;
          uint64_t v66 = *(void *)v81;
          while (2)
          {
            for (uint64_t j = 0; j != v65; ++j)
            {
              if (*(void *)v81 != v66) {
                objc_enumerationMutation(v63);
              }
              v68 = [*(id *)(*((void *)&v80 + 1) + 8 * j) merchant];
              if (([v68 useRawMerchantData] & 1) == 0)
              {
                uint64_t v69 = [v68 mapsBrand];
                if (v69)
                {
                  v70 = (void *)v69;

                  goto LABEL_38;
                }
              }
            }
            uint64_t v65 = [v63 countByEnumeratingWithState:&v80 objects:v89 count:16];
            if (v65) {
              continue;
            }
            break;
          }
        }
        v68 = v49;
LABEL_38:

        id v49 = v68;
      }
      merchant = v22->_merchant;
      v22->_merchant = (PKMerchant *)v49;

      [(PKTransactionHistoryDataSource *)v22 _loadTransactionReceipt];
    }
    else if (!type)
    {
      v37 = [(PKDashboardTransactionFetcher *)v22->_transactionFetcher counterpartHandles];
      uint64_t v38 = [v37 anyObject];
      peerPaymentCounterpartHandle = v22->_peerPaymentCounterpartHandle;
      v22->_peerPaymentCounterpartHandle = (NSString *)v38;

      id v40 = objc_alloc_init(MEMORY[0x1E4F1B980]);
      id v41 = objc_alloc(MEMORY[0x1E4F845E8]);
      v42 = [(PKTransactionHistoryDataSource *)v22 _contactKeysToFetch];
      uint64_t v43 = [v41 initWithContactStore:v40 keysToFetch:v42];
      contactResolver = v22->_contactResolver;
      v22->_contactResolver = (PKContactResolver *)v43;

      v45 = objc_alloc_init(PKPeerPaymentCounterpartImageResolver);
      peerPaymentImageResolver = v22->_peerPaymentImageResolver;
      v22->_peerPaymentImageResolver = v45;

      [(PKTransactionHistoryDataSource *)v22 _loadContact];
    }
    v22->_transactionHistoryLoaded = 1;
    if (v20) {
      [(PKTransactionHistoryDataSource *)v22 _handleTransactionHistoryUpdated:v20];
    }
    else {
      [(PKTransactionHistoryDataSource *)v22 _reloadTransactions];
    }
  }

  return v22;
}

- (PKTransactionHistoryDataSource)initWithTransactionGroup:(id)a3 transactionSourceCollection:(id)a4 familyCollection:(id)a5 account:(id)a6 accountUserCollection:(id)a7 physicalCards:(id)a8 fetcher:(id)a9 transactionHistory:(id)a10
{
  id v17 = a3;
  id v120 = a4;
  id v118 = a5;
  id v119 = a6;
  id v117 = a7;
  id v121 = a8;
  id v116 = a9;
  id v18 = a10;
  v125.receiver = self;
  v125.super_class = (Class)PKTransactionHistoryDataSource;
  id v19 = [(PKTransactionHistoryDataSource *)&v125 init];
  id v20 = v19;
  if (v19)
  {
    v19->_unint64_t type = 2;
    p_group = &v19->_group;
    objc_storeStrong((id *)&v19->_group, a3);
    objc_storeStrong((id *)&v20->_transactionSourceCollection, a4);
    objc_storeStrong((id *)&v20->_familyCollection, a5);
    objc_storeStrong((id *)&v20->_selectedTransactions, a3);
    uint64_t v21 = [v18 copy];
    transactionHistory = v20->_transactionHistory;
    v20->_transactionHistory = (NSArray *)v21;

    objc_storeStrong((id *)&v20->_transactionFetcher, a9);
    if (PKBankConnectEnabled())
    {
      uint64_t v23 = [v120 paymentPass];
      id v24 = objc_alloc(MEMORY[0x1E4F26BB0]);
      uint64_t v25 = [v23 primaryAccountIdentifier];
      uint64_t v26 = [v24 initWithPrimaryAccountIdentifier:v25];
      bankConnectAccountsProvider = v20->_bankConnectAccountsProvider;
      v20->_bankConnectAccountsProvider = (FKBankConnectAccountsProvider *)v26;

      uint64_t v28 = v20->_bankConnectAccountsProvider;
      v122[0] = MEMORY[0x1E4F143A8];
      v122[1] = 3221225472;
      v122[2] = __175__PKTransactionHistoryDataSource_initWithTransactionGroup_transactionSourceCollection_familyCollection_account_accountUserCollection_physicalCards_fetcher_transactionHistory___block_invoke;
      v122[3] = &unk_1E59DE5D8;
      v123 = v20;
      id v124 = v23;
      id v29 = v23;
      [(FKBankConnectAccountsProvider *)v28 accountAndReconsentStatusWithCompletion:v122];
    }
    -[PKTransactionHistoryDataSource _updateFooterTotalFromGroup:](v20, "_updateFooterTotalFromGroup:", v17, p_group);
    uint64_t v30 = [v17 type];
    v31 = [v17 searchQuery];
    uint64_t v32 = [v31 tokens];
    uint64_t v33 = [v32 count];

    if (v30 == 14 && v33 == 1)
    {
      uint64_t v34 = [v17 searchQuery];
      v35 = [v34 merchantToken];
      v36 = [v35 group];
      uint64_t v37 = [v36 merchant];
      merchant = v20->_merchant;
      v20->_merchant = (PKMerchant *)v37;

      v39 = [v17 searchQuery];
      id v40 = [v39 peerPaymentToken];
      id v41 = [v40 group];
      v42 = [v41 handles];
      uint64_t v43 = [v42 anyObject];
      p_peerPaymentCounterpartHandle = &v20->_peerPaymentCounterpartHandle;
      peerPaymentCounterpartHandle = v20->_peerPaymentCounterpartHandle;
      v20->_peerPaymentCounterpartHandle = (NSString *)v43;
    }
    else
    {
      v46 = v20->_merchant;
      v20->_merchant = 0;

      p_peerPaymentCounterpartHandle = &v20->_peerPaymentCounterpartHandle;
      v39 = v20->_peerPaymentCounterpartHandle;
      v20->_peerPaymentCounterpartHandle = 0;
    }

    if (*p_peerPaymentCounterpartHandle)
    {
      id v47 = objc_alloc_init(MEMORY[0x1E4F1B980]);
      id v48 = objc_alloc(MEMORY[0x1E4F845E8]);
      id v49 = [(PKTransactionHistoryDataSource *)v20 _contactKeysToFetch];
      uint64_t v50 = [v48 initWithContactStore:v47 keysToFetch:v49];
      contactResolver = v20->_contactResolver;
      v20->_contactResolver = (PKContactResolver *)v50;

      v52 = objc_alloc_init(PKPeerPaymentCounterpartImageResolver);
      peerPaymentImageResolver = v20->_peerPaymentImageResolver;
      v20->_peerPaymentImageResolver = v52;

      [(PKTransactionHistoryDataSource *)v20 _loadContact];
    }
    else
    {
      v20->_contactLoaded = 1;
    }
    uint64_t v54 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    currentCalendar = v20->_currentCalendar;
    v20->_currentCalendar = (NSCalendar *)v54;

    uint64_t v56 = [MEMORY[0x1E4F845B8] sharedInstance];
    coarseLocationMonitor = v20->_coarseLocationMonitor;
    v20->_coarseLocationMonitor = (PKCoarseLocationMonitor *)v56;

    uint64_t v58 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v58 addObserver:v20 selector:sel__handleCoarseLocationChangedNotification_ name:*MEMORY[0x1E4F87108] object:v20->_coarseLocationMonitor];

    objc_storeStrong((id *)&v20->_account, a6);
    objc_storeStrong((id *)&v20->_accountUserCollection, a7);
    uint64_t v59 = [v121 copy];
    physicalCards = v20->_physicalCards;
    v20->_physicalCards = (NSSet *)v59;

    uint64_t v61 = (PKPaymentDataProvider *)objc_alloc_init(MEMORY[0x1E4F84A88]);
    dataProvider = v20->_dataProvider;
    v20->_dataProvider = v61;

    uint64_t v63 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
    headerIndexPath = v20->_headerIndexPath;
    v20->_headerIndexPath = (NSIndexPath *)v63;

    uint64_t v65 = [MEMORY[0x1E4F84270] sharedInstance];
    accountService = v20->_accountService;
    v20->_accountService = (PKAccountService *)v65;

    [(PKAccountService *)v20->_accountService registerObserver:v20];
    switch([v17 type])
    {
      case 2:
        uint64_t v67 = [objc_alloc(MEMORY[0x1E4F84620]) initWithTransactionSourceCollection:v20->_transactionSourceCollection paymentDataProvider:0];
        transactionFetcher = v20->_transactionFetcher;
        v20->_transactionFetcher = (PKDashboardTransactionFetcher *)v67;

        uint64_t v69 = v20->_transactionFetcher;
        v70 = [v17 startDate];
        v71 = [v17 endDate];
        [(PKDashboardTransactionFetcher *)v69 setLimit:0 startDate:v70 endDate:v71];

        v72 = v20->_transactionFetcher;
        id v73 = [v17 transactionTypes];
        [(PKDashboardTransactionFetcher *)v72 filterTypes:v73];

        [(PKDashboardTransactionFetcher *)v20->_transactionFetcher setDelegate:v20];
        id v74 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
        formatterTitle = v20->_formatterTitle;
        v20->_formatterTitle = v74;

        id v76 = v20->_formatterTitle;
        id v77 = @"MMMM yyyy";
        goto LABEL_18;
      case 3:
        uint64_t v84 = [objc_alloc(MEMORY[0x1E4F84620]) initWithTransactionSourceCollection:v20->_transactionSourceCollection paymentDataProvider:0];
        long long v85 = v20->_transactionFetcher;
        v20->_transactionFetcher = (PKDashboardTransactionFetcher *)v84;

        long long v86 = v20->_transactionFetcher;
        long long v87 = [v17 startDate];
        objc_super v88 = [v17 endDate];
        [(PKDashboardTransactionFetcher *)v86 setLimit:0 startDate:v87 endDate:v88];

        [(PKDashboardTransactionFetcher *)v20->_transactionFetcher setDelegate:v20];
        v89 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
        v90 = v20->_formatterTitle;
        v20->_formatterTitle = v89;

        uint64_t v91 = v20->_formatterTitle;
        id v92 = objc_alloc(MEMORY[0x1E4F1C9A8]);
        v93 = (void *)[v92 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
        [(NSDateFormatter *)v91 setCalendar:v93];

        id v76 = v20->_formatterTitle;
        id v77 = @"y";
        goto LABEL_18;
      case 5:
        long long v80 = [v17 startDate];
        long long v81 = PKStartOfMonth();

        uint64_t v82 = [v119 type];
        if (v82 == 1)
        {
          long long v83 = [v119 creditDetails];
          goto LABEL_23;
        }
        if (v82 == 4)
        {
          long long v83 = [v119 savingsDetails];
LABEL_23:
          v99 = v83;
          v100 = [v83 createdDate];

          goto LABEL_25;
        }
        v100 = 0;
LABEL_25:
        if ([v100 compare:v81] == 1)
        {
          id v101 = v100;

          long long v81 = v101;
        }
        uint64_t v102 = [objc_alloc(MEMORY[0x1E4F84620]) initWithTransactionSourceCollection:v20->_transactionSourceCollection paymentDataProvider:0];
        v103 = v20->_transactionFetcher;
        v20->_transactionFetcher = (PKDashboardTransactionFetcher *)v102;

        v104 = v20->_transactionFetcher;
        v105 = [v17 endDate];
        v106 = PKStartOfNextMonth();
        v107 = [v106 dateByAddingTimeInterval:-1.0];
        [(PKDashboardTransactionFetcher *)v104 setLimit:0 startDate:v81 endDate:v107];

        [(PKDashboardTransactionFetcher *)v20->_transactionFetcher setDelegate:v20];
        v108 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
        v109 = v20->_formatterTitle;
        v20->_formatterTitle = v108;

        [(NSDateFormatter *)v20->_formatterTitle setLocalizedDateFormatFromTemplate:@"MMMM d"];
        v110 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
        formatterMonth = v20->_formatterMonth;
        v20->_formatterMonth = v110;

        [(NSDateFormatter *)v20->_formatterMonth setLocalizedDateFormatFromTemplate:@"MMMM"];
LABEL_28:
        if (v20->_transactionFetcher
          && ([*v115 bankConnectSectionIdentifier],
              v112 = objc_claimAutoreleasedReturnValue(),
              v112,
              !v112))
        {
          [(PKTransactionHistoryDataSource *)v20 _notifyContentLoadedIfNecessary];
          [(PKTransactionHistoryDataSource *)v20 _reloadTransactions];
        }
        else
        {
          v20->_transactionHistoryLoaded = 1;
          [(PKTransactionHistoryDataSource *)v20 _notifyContentLoadedIfNecessary];
        }
        break;
      case 7:
        id v94 = objc_alloc(MEMORY[0x1E4F84620]);
        transactionSourceCollection = v20->_transactionSourceCollection;
        uint64_t v96 = 11;
        goto LABEL_21;
      case 9:
        id v94 = objc_alloc(MEMORY[0x1E4F84620]);
        transactionSourceCollection = v20->_transactionSourceCollection;
        uint64_t v96 = 10;
LABEL_21:
        uint64_t v97 = [v94 initWithTransactionType:v96 transactionSourceCollection:transactionSourceCollection paymentDataProvider:0];
        v98 = v20->_transactionFetcher;
        v20->_transactionFetcher = (PKDashboardTransactionFetcher *)v97;

        [(PKDashboardTransactionFetcher *)v20->_transactionFetcher setLimit:0 startDate:0 endDate:0];
        [(PKDashboardTransactionFetcher *)v20->_transactionFetcher setDelegate:v20];
        goto LABEL_28;
      default:
        id v78 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
        id v79 = v20->_formatterTitle;
        v20->_formatterTitle = v78;

        id v76 = v20->_formatterTitle;
        id v77 = @"MMMM d";
LABEL_18:
        [(NSDateFormatter *)v76 setLocalizedDateFormatFromTemplate:v77];
        goto LABEL_28;
    }
  }

  return v20;
}

void __175__PKTransactionHistoryDataSource_initWithTransactionGroup_transactionSourceCollection_familyCollection_account_accountUserCollection_physicalCards_fetcher_transactionHistory___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __175__PKTransactionHistoryDataSource_initWithTransactionGroup_transactionSourceCollection_familyCollection_account_accountUserCollection_physicalCards_fetcher_transactionHistory___block_invoke_2;
  v9[3] = &unk_1E59CB8B0;
  id v10 = v5;
  id v11 = *(id *)(a1 + 32);
  id v12 = v6;
  id v13 = *(id *)(a1 + 40);
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

void __175__PKTransactionHistoryDataSource_initWithTransactionGroup_transactionSourceCollection_familyCollection_account_accountUserCollection_physicalCards_fetcher_transactionHistory___block_invoke_2(uint64_t a1)
{
  id v14 = [*(id *)(a1 + 32) account];
  uint64_t v2 = [*(id *)(a1 + 32) consentStatus];
  uint64_t v3 = [*(id *)(a1 + 32) institution];
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(void **)(v4 + 264);
  *(void *)(v4 + 264) = v3;

  if (*(void *)(a1 + 48)) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v14 == 0;
  }
  if (!v6 && v2 == 0)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F26BE8]);
    v9 = [*(id *)(a1 + 56) primaryAccountIdentifier];
    id v10 = [*(id *)(*(void *)(a1 + 40) + 304) startDate];
    uint64_t v11 = [v8 initWithPrimaryAccountIdentifier:v9 dateFromYear:v10 groupType:0];
    uint64_t v12 = *(void *)(a1 + 40);
    id v13 = *(void **)(v12 + 256);
    *(void *)(v12 + 256) = v11;

    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 256), "setDelegate:");
    [*(id *)(*(void *)(a1 + 40) + 256) performFetchAndStartObservingNotifications];
  }
}

- (void)updateGroup:(id)a3
{
  id v5 = (PKPaymentTransactionGroup *)a3;
  objc_storeStrong((id *)&self->_group, a3);
  selectedTransactions = self->_selectedTransactions;
  self->_selectedTransactions = v5;
  id v7 = v5;

  [(PKTransactionHistoryDataSource *)self _updateFooterTotalFromGroup:v7];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained updateContent];
}

- (void)_updateFooterTotalFromGroup:(id)a3
{
  id v4 = a3;
  id v5 = [v4 totalAmount];
  footerTotal = self->_footerTotal;
  self->_footerTotal = v5;

  if (!self->_footerTotal)
  {
    id v7 = [v4 transactions];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      if ([(PKPaymentTransactionGroup *)self->_group type] != 14) {
        goto LABEL_8;
      }
      v9 = [(PKPaymentTransactionGroup *)self->_group searchQuery];
      id v10 = [v9 peerPaymentToken];
      uint64_t v11 = [v10 group];

      if (!v11)
      {
LABEL_8:
        uint64_t v11 = [v4 transactions];
        id v18 = [v4 startDate];
        id v19 = [v4 endDate];
        id v20 = [(PKTransactionHistoryDataSource *)self _totalSpendingFromTransactions:v11 startDate:v18 endDate:v19];
        uint64_t v21 = self->_footerTotal;
        self->_footerTotal = v20;

LABEL_13:
        goto LABEL_14;
      }
      p_footerTotal = &self->_footerTotal;
      id v24 = 0;
      obuint64_t j = 0;
      id v13 = [v4 transactions];
      [(PKTransactionHistoryDataSource *)self _p2pTotalsFromTransactions:v13 received:&obj sent:&v24];

      id v14 = [obj amount];
      self->_hasReceived = objc_msgSend(v14, "pk_isPositiveNumber");

      v15 = [v24 amount];
      self->_BOOL hasSent = objc_msgSend(v15, "pk_isPositiveNumber");

      BOOL hasSent = self->_hasSent;
      if (self->_hasReceived)
      {
        objc_storeStrong((id *)&self->_footerTotal, obj);
        if (hasSent)
        {
          id v17 = v24;
          p_footerTotal = &self->_footerSecondaryTotal;
LABEL_11:
          v22 = (PKCurrencyAmount *)v17;
          uint64_t v23 = *p_footerTotal;
          *p_footerTotal = v22;
        }
      }
      else if (self->_hasSent)
      {
        id v17 = v24;
        goto LABEL_11;
      }

      goto LABEL_13;
    }
  }
LABEL_14:
}

- (PKTransactionHistoryDataSource)initWithInstallmentPlan:(id)a3 transactionSourceCollection:(id)a4 familyCollection:(id)a5 account:(id)a6 accountUserCollection:(id)a7 physicalCards:(id)a8
{
  id v15 = a3;
  id v38 = a4;
  id v37 = a5;
  id v36 = a6;
  id v16 = a7;
  id v17 = a8;
  v39.receiver = self;
  v39.super_class = (Class)PKTransactionHistoryDataSource;
  id v18 = [(PKTransactionHistoryDataSource *)&v39 init];
  id v19 = v18;
  if (v18)
  {
    v18->_unint64_t type = 3;
    transactionFetcher = v18->_transactionFetcher;
    v18->_transactionFetcher = 0;

    [(PKDashboardTransactionFetcher *)v19->_transactionFetcher setDelegate:v19];
    objc_storeStrong((id *)&v19->_transactionSourceCollection, a4);
    objc_storeStrong((id *)&v19->_familyCollection, a5);
    uint64_t v21 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    currentCalendar = v19->_currentCalendar;
    v19->_currentCalendar = (NSCalendar *)v21;

    uint64_t v23 = [MEMORY[0x1E4F845B8] sharedInstance];
    coarseLocationMonitor = v19->_coarseLocationMonitor;
    v19->_coarseLocationMonitor = (PKCoarseLocationMonitor *)v23;

    uint64_t v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v25 addObserver:v19 selector:sel__handleCoarseLocationChangedNotification_ name:*MEMORY[0x1E4F87108] object:v19->_coarseLocationMonitor];

    objc_storeStrong((id *)&v19->_account, a6);
    objc_storeStrong((id *)&v19->_accountUserCollection, a7);
    uint64_t v26 = [v17 copy];
    physicalCards = v19->_physicalCards;
    v19->_physicalCards = (NSSet *)v26;

    objc_storeStrong((id *)&v19->_associatedInstallmentPlan, a3);
    uint64_t v28 = [objc_alloc(MEMORY[0x1E4F84620]) initWithInstallmentPlan:v15 transactionSourceCollection:v19->_transactionSourceCollection paymentDataProvider:0];
    id v29 = v19->_transactionFetcher;
    v19->_transactionFetcher = (PKDashboardTransactionFetcher *)v28;

    [(PKDashboardTransactionFetcher *)v19->_transactionFetcher setLimit:0 startDate:0 endDate:0];
    [(PKDashboardTransactionFetcher *)v19->_transactionFetcher setDelegate:v19];
    uint64_t v30 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
    headerIndexPath = v19->_headerIndexPath;
    v19->_headerIndexPath = (NSIndexPath *)v30;

    uint64_t v32 = [MEMORY[0x1E4F84270] sharedInstance];
    accountService = v19->_accountService;
    v19->_accountService = (PKAccountService *)v32;

    [(PKAccountService *)v19->_accountService registerObserver:v19];
    uint64_t v34 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v34 addObserver:v19 selector:sel__handleAccountsChangedNotification_ name:*MEMORY[0x1E4F85BF8] object:0];

    [(PKTransactionHistoryDataSource *)v19 _updateInstallmentPlan];
  }

  return v19;
}

- (PKTransactionHistoryDataSource)initWithTransactionGroups:(id)a3 headerGroup:(id)a4 regionUpdater:(id)a5 tokens:(id)a6 transactionSourceCollection:(id)a7 familyCollection:(id)a8 account:(id)a9 accountUserCollection:(id)a10 physicalCards:(id)a11
{
  id v61 = a3;
  id v17 = a4;
  id v18 = a7;
  id v60 = a5;
  id v59 = a6;
  id v58 = a7;
  id v57 = a8;
  id v56 = a9;
  id v55 = a10;
  id v19 = a11;
  v62.receiver = self;
  v62.super_class = (Class)PKTransactionHistoryDataSource;
  id v20 = [(PKTransactionHistoryDataSource *)&v62 init];
  uint64_t v21 = v20;
  if (v20)
  {
    v20->_unint64_t type = 4;
    objc_storeStrong((id *)&v20->_group, a4);
    objc_storeStrong((id *)&v21->_groups, a3);
    objc_storeStrong((id *)&v21->_tokens, a6);
    objc_storeStrong((id *)&v21->_familyCollection, a8);
    uint64_t v22 = [(PKTransactionHistoryDataSource *)v21 _totalFromGroups:v21->_groups];
    footerTotal = v21->_footerTotal;
    v21->_footerTotal = (PKCurrencyAmount *)v22;

    uint64_t v24 = [v17 type];
    uint64_t v25 = [v17 searchQuery];
    uint64_t v26 = [v25 tokens];
    uint64_t v27 = [v26 count];

    if (v24 == 14 && v27 == 1)
    {
      uint64_t v28 = [v17 searchQuery];
      id v29 = [v28 merchantToken];
      uint64_t v30 = [v29 group];
      uint64_t v31 = [v30 merchant];
      merchant = v21->_merchant;
      v21->_merchant = (PKMerchant *)v31;
    }
    else
    {
      uint64_t v28 = v21->_merchant;
      v21->_merchant = 0;
    }

    objc_storeStrong((id *)&v21->_transactionSourceCollection, v18);
    uint64_t v33 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    currentCalendar = v21->_currentCalendar;
    v21->_currentCalendar = (NSCalendar *)v33;

    uint64_t v35 = [MEMORY[0x1E4F845B8] sharedInstance];
    coarseLocationMonitor = v21->_coarseLocationMonitor;
    v21->_coarseLocationMonitor = (PKCoarseLocationMonitor *)v35;

    id v37 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v37 addObserver:v21 selector:sel__handleCoarseLocationChangedNotification_ name:*MEMORY[0x1E4F87108] object:v21->_coarseLocationMonitor];

    objc_storeStrong((id *)&v21->_account, a9);
    objc_storeStrong((id *)&v21->_accountUserCollection, a10);
    uint64_t v38 = [v19 copy];
    physicalCards = v21->_physicalCards;
    v21->_physicalCards = (NSSet *)v38;

    id v40 = (PKPaymentDataProvider *)objc_alloc_init(MEMORY[0x1E4F84A88]);
    dataProvider = v21->_dataProvider;
    v21->_dataProvider = v40;

    objc_storeStrong((id *)&v21->_regionUpdater, a5);
    [(PKWorldRegionUpdater *)v21->_regionUpdater addObserver:v21];
    uint64_t v42 = [MEMORY[0x1E4F84270] sharedInstance];
    accountService = v21->_accountService;
    v21->_accountService = (PKAccountService *)v42;

    [(PKAccountService *)v21->_accountService registerObserver:v21];
    v21->_transactionHistoryLoaded = 1;
    uint64_t v44 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
    headerIndexPath = v21->_headerIndexPath;
    v21->_headerIndexPath = (NSIndexPath *)v44;

    if ([(PKPaymentTransactionGroup *)v21->_group type] == 3)
    {
      v46 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
      formatterTitle = v21->_formatterTitle;
      v21->_formatterTitle = v46;

      id v48 = v19;
      id v49 = v21->_formatterTitle;
      id v50 = objc_alloc(MEMORY[0x1E4F1C9A8]);
      v51 = (void *)[v50 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
      v52 = v49;
      id v19 = v48;
      [(NSDateFormatter *)v52 setCalendar:v51];

      [(NSDateFormatter *)v21->_formatterTitle setLocalizedDateFormatFromTemplate:@"y"];
    }
    v21->_contactLoaded = 1;
    [(PKTransactionHistoryDataSource *)v21 _notifyContentLoadedIfNecessary];
  }

  return v21;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(PKAccountService *)self->_accountService unregisterObserver:self];
  v4.receiver = self;
  v4.super_class = (Class)PKTransactionHistoryDataSource;
  [(PKTransactionHistoryDataSource *)&v4 dealloc];
}

- (void)updateGroups:(id)a3 headerGroup:(id)a4
{
  BOOL v6 = (NSArray *)a3;
  objc_storeStrong((id *)&self->_group, a4);
  id v7 = a4;
  groups = self->_groups;
  self->_groups = v6;
  v9 = v6;

  id v10 = [(PKTransactionHistoryDataSource *)self _totalFromGroups:self->_groups];
  footerTotal = self->_footerTotal;
  self->_footerTotal = v10;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained updateContent];
}

- (unint64_t)transactionHistoryItemsCount
{
  return [(PKTransactionHistoryDataSource *)self numberOfItemsInSection:5];
}

- (BOOL)areTransactionsEditable
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = self->_transactionHistory;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "isDeletable", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (NSString)footerTitle
{
  unint64_t type = self->_type;
  if (type != 1)
  {
    if (type != 4 && type != 2)
    {
LABEL_52:
      id v5 = 0;
      goto LABEL_53;
    }
    id v5 = 0;
    switch([(PKPaymentTransactionGroup *)self->_group type])
    {
      case 0:
      case 1:
      case 10:
      case 11:
      case 13:
      case 15:
      case 16:
        uint64_t v6 = [(PKPaymentTransactionGroup *)self->_group startDate];
        if (v6)
        {
          long long v7 = (void *)v6;
          long long v8 = [(PKPaymentTransactionGroup *)self->_group endDate];

          if (v8)
          {
            long long v9 = [(PKPaymentTransactionGroup *)self->_group startDate];
            long long v10 = [(PKPaymentTransactionGroup *)self->_group endDate];
            goto LABEL_15;
          }
        }
        if (![(NSArray *)self->_transactionHistory count]) {
          goto LABEL_52;
        }
        long long v9 = [(NSArray *)self->_transactionHistory lastObject];
        id v15 = [v9 transactionDate];
        id v16 = [(NSArray *)self->_transactionHistory firstObject];
        id v17 = [v16 transactionDate];
        id v5 = PKDateRangeStringFromDateToDate();

        goto LABEL_19;
      case 5:
        long long v9 = [MEMORY[0x1E4F1C9A8] currentCalendar];
        id v15 = [(PKPaymentTransactionGroup *)self->_group startDate];
        if ([v9 isDateInToday:v15])
        {
          id v5 = PKLocalizedString(&cfstr_RelativeDateTo.isa);
        }
        else
        {
          if ([v9 isDateInYesterday:v15]) {
            PKRelativeDateStringWithFullDateForUnits();
          }
          else {
          id v16 = [(NSDateFormatter *)self->_formatterTitle stringFromDate:v15];
          }
          id v5 = objc_msgSend(v16, "pk_uppercaseFirstStringForPreferredLocale");
LABEL_19:
        }
        goto LABEL_21;
      case 7:
        uint64_t v23 = [(PKAccount *)self->_account feature];
        if (v23 == 5)
        {
          uint64_t v43 = [MEMORY[0x1E4F1C9C8] date];
          id v19 = PKYearStringFromDate();

          id v5 = PKLocalizedFeatureString();
          goto LABEL_50;
        }
        if (v23 != 2) {
          goto LABEL_52;
        }
        goto LABEL_57;
      case 9:
        uint64_t v24 = [(PKPaymentTransactionGroup *)self->_selectedTransactions transactions];
        uint64_t v25 = [v24 firstObject];
        id v19 = [v25 transactionDate];

        id v20 = [MEMORY[0x1E4F1C9A8] currentCalendar];
        uint64_t v26 = [MEMORY[0x1E4F1C9C8] date];
        uint64_t v22 = [v20 components:14 fromDate:v26];

        if ([v20 date:v19 matchesComponents:v22]) {
          goto LABEL_31;
        }
        id v38 = objc_alloc_init(MEMORY[0x1E4F28C10]);
        [v38 setLocalizedDateFormatFromTemplate:@"MMMM"];
        id v39 = [v38 stringFromDate:v19];
        id v5 = PKLocalizedFeatureString();
        goto LABEL_48;
      case 14:
        uint64_t v27 = [(PKPaymentTransactionGroup *)self->_group searchQuery];
        uint64_t v28 = [v27 peerPaymentToken];

        if (v28)
        {
          if ([(PKPaymentTransactionGroup *)self->_group type] == 14)
          {
            id v29 = [(PKPaymentTransactionGroup *)self->_group searchQuery];
            uint64_t v30 = [v29 peerPaymentToken];
            long long v9 = [v30 group];

            if (v9)
            {
              if (self->_hasReceived)
              {
                uint64_t v31 = @"TRANSACTIONS_TOTAL_RECEIVED";
LABEL_65:
                id v5 = PKLocalizedPeerPaymentString(&v31->isa);
                goto LABEL_21;
              }
              if (self->_hasSent)
              {
                uint64_t v31 = @"TRANSACTIONS_TOTAL_SENT";
                goto LABEL_65;
              }
            }
          }
          else
          {
            long long v9 = 0;
          }
          id v5 = 0;
          goto LABEL_21;
        }
        id v40 = [(PKCurrencyAmount *)self->_footerTotal amount];
        uint64_t v41 = objc_msgSend(v40, "pk_isZeroNumber");

        if (v41) {
          goto LABEL_52;
        }
        long long v9 = [(PKPaymentTransactionGroup *)self->_group startDate];
        group = self->_group;
        break;
      default:
        goto LABEL_53;
    }
    goto LABEL_13;
  }
  uint64_t v11 = [(PKPaymentTransactionGroup *)self->_selectedTransactions transactions];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    long long v9 = [(PKPaymentTransactionGroup *)self->_selectedTransactions startDate];
    group = self->_selectedTransactions;
LABEL_13:
    uint64_t v14 = [(PKPaymentTransactionGroup *)group endDate];
    long long v10 = (void *)v14;
    id v5 = 0;
    if (v9 && v14)
    {
LABEL_15:
      id v5 = PKDateRangeStringFromDateToDate();
    }
LABEL_16:

LABEL_21:
    goto LABEL_53;
  }
  featuredTransaction = self->_featuredTransaction;
  if (featuredTransaction)
  {
    id v19 = [(PKPaymentTransaction *)featuredTransaction transactionDate];
    id v20 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v21 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v22 = [v20 components:14 fromDate:v21];

    if ([v20 date:v19 matchesComponents:v22])
    {
LABEL_31:
      id v5 = PKLocalizedFeatureString();
    }
    else
    {
      PKLocalizedFeatureString();
      id v38 = (id)objc_claimAutoreleasedReturnValue();
      id v39 = objc_alloc_init(MEMORY[0x1E4F28C10]);
      [v39 setLocalizedDateFormatFromTemplate:@"MMMM"];
      uint64_t v44 = [v39 stringFromDate:v19];
      id v5 = PKStringWithValidatedFormat();

LABEL_48:
    }

LABEL_50:
  }
  else
  {
    transactionHistory = self->_transactionHistory;
    if (transactionHistory)
    {
      uint64_t v33 = [(NSArray *)transactionHistory lastObject];
      long long v9 = [v33 transactionDate];

      uint64_t v34 = [(NSArray *)self->_transactionHistory firstObject];
      long long v10 = [v34 transactionDate];

      id v5 = 0;
      if (v9 && v10)
      {
        uint64_t v35 = [MEMORY[0x1E4F1C9C8] date];
        if ([v10 compare:v35] == -1) {
          id v36 = v35;
        }
        else {
          id v36 = v10;
        }
        id v37 = v36;

        id v5 = PKDateRangeStringFromDateToDate();

        long long v10 = v37;
      }
      goto LABEL_16;
    }
LABEL_57:
    id v5 = PKLocalizedFeatureString();
  }
LABEL_53:

  return (NSString *)v5;
}

- (NSString)footerSecondaryTitle
{
  unint64_t type = self->_type;
  if (type == 1)
  {
    footerSecondaryTotal = self->_footerSecondaryTotal;
    if (footerSecondaryTotal)
    {
      uint64_t v11 = [(PKCurrencyAmount *)footerSecondaryTotal amount];
      uint64_t v12 = [MEMORY[0x1E4F28C28] zero];
      char v13 = [v11 isEqual:v12];

      if ((v13 & 1) == 0) {
        goto LABEL_18;
      }
    }
    goto LABEL_19;
  }
  if (type != 2) {
    goto LABEL_19;
  }
  uint64_t v4 = [(PKPaymentTransactionGroup *)self->_group type];
  if (v4 != 14)
  {
    if (v4 != 7)
    {
      if (v4 == 5)
      {
        id v5 = [(PKPaymentTransactionGroup *)self->_group startDate];
        uint64_t v6 = [MEMORY[0x1E4F1C9A8] currentCalendar];
        long long v7 = [MEMORY[0x1E4F1C9C8] date];
        long long v8 = [v6 components:14 fromDate:v7];

        if ([v6 date:v5 matchesComponents:v8])
        {
          long long v9 = PKLocalizedFeatureString();
        }
        else
        {
          id v20 = objc_alloc_init(MEMORY[0x1E4F28C10]);
          [v20 setLocalizedDateFormatFromTemplate:@"MMMM"];
          uint64_t v21 = [v20 stringFromDate:v5];
          long long v9 = PKLocalizedFeatureString();
        }
        goto LABEL_20;
      }
      goto LABEL_19;
    }
    if ([(PKAccount *)self->_account feature] == 5)
    {
LABEL_18:
      long long v9 = PKLocalizedFeatureString();
      goto LABEL_20;
    }
LABEL_19:
    long long v9 = 0;
    goto LABEL_20;
  }
  uint64_t v14 = [(PKPaymentTransactionGroup *)self->_group searchQuery];
  id v15 = [v14 peerPaymentToken];

  if (!v15) {
    goto LABEL_19;
  }
  if ([(PKPaymentTransactionGroup *)self->_group type] != 14)
  {
    id v18 = 0;
LABEL_26:
    long long v9 = 0;
    goto LABEL_27;
  }
  id v16 = [(PKPaymentTransactionGroup *)self->_group searchQuery];
  id v17 = [v16 peerPaymentToken];
  id v18 = [v17 group];

  if (!v18 || !self->_hasReceived || !self->_hasSent) {
    goto LABEL_26;
  }
  long long v9 = PKLocalizedPeerPaymentString(&cfstr_TransactionsTo_1.isa);
LABEL_27:

LABEL_20:

  return (NSString *)v9;
}

- (BOOL)useLargeTitle
{
  return [(PKTransactionHistoryDataSource *)self numberOfItemsInSection:0] == 0;
}

- (id)navigationBarTitle
{
  switch(self->_type)
  {
    case 0uLL:
      uint64_t v3 = self->_peerPaymentCounterpartHandle;
      if ([(PKPaymentTransaction *)self->_featuredTransaction peerPaymentPaymentMode] != 2)
      {
        uint64_t v7 = [MEMORY[0x1E4F84D88] displayNameForCounterpartHandle:v3 contact:self->_contact];

        uint64_t v3 = (NSString *)v7;
      }
      break;
    case 1uLL:
      uint64_t v8 = [(PKMerchant *)self->_merchant displayName];
LABEL_15:
      uint64_t v3 = (NSString *)v8;
      break;
    case 2uLL:
    case 4uLL:
      uint64_t v3 = 0;
      switch([(PKPaymentTransactionGroup *)self->_group type])
      {
        case 0:
          [(PKPaymentTransactionGroup *)self->_group merchantCategory];
          uint64_t v8 = PKLocalizedStringFromMerchantCategory();
          goto LABEL_15;
        case 1:
          long long v9 = [(PKPaymentTransactionGroup *)self->_group merchant];
          uint64_t v10 = [v9 displayName];
          goto LABEL_9;
        case 2:
        case 3:
          formatterTitle = self->_formatterTitle;
          id v5 = [(PKPaymentTransactionGroup *)self->_group startDate];
          uint64_t v6 = [(NSDateFormatter *)formatterTitle stringFromDate:v5];
          objc_msgSend(v6, "pk_uppercaseFirstStringForPreferredLocale");
          uint64_t v3 = (NSString *)objc_claimAutoreleasedReturnValue();

          goto LABEL_16;
        case 4:
        case 5:
        case 6:
        case 8:
        case 9:
        case 10:
        case 11:
          goto LABEL_14;
        case 7:
          [(PKAccount *)self->_account feature];
LABEL_14:
          uint64_t v8 = PKLocalizedFeatureString();
          goto LABEL_15;
        case 13:
          long long v9 = [(PKPaymentTransactionGroup *)self->_group regions];
          uint64_t v12 = [v9 firstObject];
          uint64_t v3 = [v12 localizedName];

          goto LABEL_10;
        case 14:
          long long v9 = [(PKPaymentTransactionGroup *)self->_group searchQuery];
          char v13 = [v9 tokens];
          uint64_t v14 = [v13 count];

          if (v14 != 1) {
            goto LABEL_30;
          }
          id v15 = [v9 locationTokens];
          uint64_t v16 = [v15 count];

          if (v16)
          {
            id v17 = [v9 locationTokens];
            id v18 = [v17 lastObject];
            id v19 = [v18 group];
            id v20 = [v19 regions];
            uint64_t v21 = [v20 firstObject];

            uint64_t v3 = [v21 localizedName];

            goto LABEL_10;
          }
          uint64_t v22 = [v9 categoryToken];

          if (v22)
          {
            uint64_t v23 = [v9 categoryToken];
            uint64_t v24 = [v23 group];
            [v24 merchantCategory];

            uint64_t v10 = PKLocalizedStringFromMerchantCategory();
          }
          else
          {
            uint64_t v25 = [v9 transactionTypes];
            uint64_t v26 = [v25 count];

            if (v26)
            {
              uint64_t v27 = [v9 transactionTypes];
              uint64_t v28 = [v27 firstObject];
              uint64_t v29 = [v28 integerValue];

              switch(v29)
              {
                case 1:
                case 7:
                case 10:
                  goto LABEL_35;
                case 5:
                  uint64_t v35 = @"TRANSACTION_TYPE_WITHDRAWAL_GENERIC";
                  break;
                case 6:
                  uint64_t v35 = @"TRANSACTION_TYPE_TOP_UP";
                  break;
                case 11:
                  [(PKAccount *)self->_account feature];
                  goto LABEL_35;
                default:
                  goto LABEL_30;
              }
              uint64_t v10 = PKLocalizedPaymentString(&v35->isa);
            }
            else
            {
              uint64_t v30 = [v9 transactionSources];
              uint64_t v31 = [v30 count];

              if (v31
                && (([v9 transactionSources],
                     uint64_t v32 = objc_claimAutoreleasedReturnValue(),
                     [v32 firstObject],
                     uint64_t v33 = objc_claimAutoreleasedReturnValue(),
                     uint64_t v34 = [v33 integerValue],
                     v33,
                     v32,
                     v34 == 6)
                 || v34 == 5))
              {
LABEL_35:
                uint64_t v10 = PKLocalizedFeatureString();
              }
              else
              {
LABEL_30:
                uint64_t v10 = PKLocalizedString(&cfstr_SearchResults.isa);
              }
            }
          }
          break;
        default:
          goto LABEL_16;
      }
      goto LABEL_9;
    case 3uLL:
      long long v9 = [(PKCreditInstallmentPlan *)self->_associatedInstallmentPlan product];
      uint64_t v10 = [v9 model];
LABEL_9:
      uint64_t v3 = (NSString *)v10;
LABEL_10:

      break;
    default:
      uint64_t v3 = 0;
      break;
  }
LABEL_16:

  return v3;
}

- (void)setDataSourceDelegate:(id)a3
{
  id v4 = a3;
  objc_storeWeak((id *)&self->_delegate, v4);
  if (self->_contentIsLoaded) {
    [v4 contentIsLoaded];
  }
}

- (id)itemAtIndexPath:(id)a3
{
  id v4 = a3;
  switch([v4 section])
  {
    case 0:
      if (self->_type == 4 && self->_regionUpdater && [(PKPaymentTransactionGroup *)self->_group type] == 13)
      {
        regionUpdater = self->_regionUpdater;
        uint64_t v6 = [(PKPaymentTransactionGroup *)self->_group regions];
        uint64_t v7 = [v6 firstObject];
        [(PKWorldRegionUpdater *)regionUpdater updateCoordinatesForWorldRegionIfNeeded:v7];
      }
      uint64_t v8 = [(PKTransactionHistoryDataSource *)self _headerItem];
      goto LABEL_48;
    case 1:
      uint64_t v9 = [v4 row];
      if (v9 == 1)
      {
        uint64_t v27 = [(PKPaymentTransaction *)self->_featuredTransaction preferredLocation];

        if (v27)
        {
          uint64_t v10 = objc_alloc_init(PKDashboardTransactionMapItem);
          [(PKDashboardTransactionMapItem *)v10 setTransaction:self->_featuredTransaction];
          goto LABEL_49;
        }
        if (self->_associatedInstallmentPlan)
        {
          uint64_t v10 = objc_alloc_init(PKDashboardTransactionInstallmentItem);
          [(PKDashboardTransactionMapItem *)v10 setInstallmentPlan:self->_associatedInstallmentPlan];
          [(PKDashboardTransactionMapItem *)v10 setAccount:self->_account];
          [(PKDashboardTransactionMapItem *)v10 setTransactionSourceCollection:self->_transactionSourceCollection];
          goto LABEL_49;
        }
        if (self->_associatedReceipt)
        {
          uint64_t v10 = objc_alloc_init(PKDashboardTransactionReceiptItem);
          [(PKDashboardTransactionMapItem *)v10 setReceipt:self->_associatedReceipt];
          [(PKDashboardTransactionMapItem *)v10 setTransaction:self->_featuredTransaction];
          [(PKDashboardTransactionMapItem *)v10 setTransactionSourceCollection:self->_transactionSourceCollection];
          [(PKDashboardTransactionMapItem *)v10 setFamilyCollection:self->_familyCollection];
          [(PKDashboardTransactionMapItem *)v10 setAccount:self->_account];
          [(PKDashboardTransactionMapItem *)v10 setAccountUserCollection:self->_accountUserCollection];
          [(PKDashboardTransactionMapItem *)v10 setPhysicalCards:self->_physicalCards];
          goto LABEL_49;
        }
      }
      else if (!v9)
      {
        uint64_t v10 = [(PKTransactionHistoryDataSource *)self _transactionItemForTransaction:self->_featuredTransaction];
        [(PKDashboardTransactionMapItem *)v10 setIsFeaturedTransaction:1];
        goto LABEL_49;
      }
      uint64_t v33 = [v4 row];
      if (self->_associatedInstallmentPlan) {
        goto LABEL_45;
      }
      uint64_t v34 = [(PKPaymentTransaction *)self->_featuredTransaction preferredLocation];
      if (v34)
      {

LABEL_45:
        uint64_t v16 = v33 - 2;
        goto LABEL_46;
      }
      if (self->_associatedReceipt) {
        goto LABEL_45;
      }
      uint64_t v16 = v33 - 1;
LABEL_46:
      featuredTransactionActions = self->_featuredTransactionActions;
LABEL_47:
      uint64_t v8 = [(NSArray *)featuredTransactionActions objectAtIndex:v16];
LABEL_48:
      uint64_t v10 = (PKDashboardTransactionMapItem *)v8;
LABEL_49:

      return v10;
    case 2:
      unint64_t v11 = [v4 row];
      uint64_t v12 = [(PKPaymentTransactionGroup *)self->_selectedTransactions transactions];
      if (v11 < [v12 count])
      {
        char v13 = [v12 objectAtIndex:v11];
        uint64_t v10 = [(PKTransactionHistoryDataSource *)self _transactionItemForTransaction:v13];
        goto LABEL_19;
      }

      goto LABEL_26;
    case 3:
      uint64_t v14 = [v4 item];
      if (v14 == 1)
      {
        uint64_t v10 = objc_alloc_init(PKDashboardTextActionItem);
        [(PKDashboardTransactionMapItem *)v10 setLayoutStyle:0];
        uint64_t v28 = PKLocalizedBeekmanString(&cfstr_TotalFinanced.isa);
        [(PKDashboardTransactionMapItem *)v10 setTitle:v28];

        uint64_t v12 = [(PKCreditInstallmentPlan *)self->_associatedInstallmentPlan totalAmount];
        if (v12)
        {
          uint64_t v29 = [(PKCreditInstallmentPlan *)self->_associatedInstallmentPlan currencyCode];

          if (v29)
          {
            uint64_t v30 = [(PKCreditInstallmentPlan *)self->_associatedInstallmentPlan totalAmount];
            uint64_t v31 = [(PKCreditInstallmentPlan *)self->_associatedInstallmentPlan currencyCode];
            uint64_t v32 = PKCurrencyAmountCreate(v30, v31);

            uint64_t v12 = [v32 formattedStringValue];
          }
          else
          {
            uint64_t v12 = 0;
          }
        }
        [(PKDashboardTransactionMapItem *)v10 setSubtitle:v12];
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __50__PKTransactionHistoryDataSource_itemAtIndexPath___block_invoke;
        v36[3] = &unk_1E59D97B8;
        v36[4] = self;
        [(PKDashboardTransactionMapItem *)v10 setAction:v36];
LABEL_38:
      }
      else if (v14)
      {
LABEL_26:
        uint64_t v10 = 0;
      }
      else
      {
        uint64_t v10 = objc_alloc_init(PKDashboardInstallmentPlanStatusItem);
        [(PKDashboardTransactionMapItem *)v10 setInstallmentPlan:self->_associatedInstallmentPlan];
        [(PKDashboardTransactionMapItem *)v10 setAccount:self->_account];
        [(PKDashboardTransactionMapItem *)v10 setTransactionSourceCollection:self->_transactionSourceCollection];
        [(PKDashboardTransactionMapItem *)v10 setAccountUserCollection:self->_accountUserCollection];
        [(PKDashboardTransactionMapItem *)v10 setFamilyMemberCollection:self->_familyCollection];
      }
      goto LABEL_49;
    case 4:
      actionItems = self->_actionItems;
      uint64_t v16 = [v4 item];
      featuredTransactionActions = actionItems;
      goto LABEL_47;
    case 5:
      unint64_t v18 = [v4 row];
      if (v18 >= [(NSArray *)self->_transactionHistory count]) {
        goto LABEL_26;
      }
      uint64_t v12 = [(NSArray *)self->_transactionHistory objectAtIndex:v18];
      if ([v12 transactionType] == 9)
      {
        uint64_t v10 = objc_alloc_init(PKDashboardPaymentTransactionGroupItem);
        transactionFetcher = self->_transactionFetcher;
        id v20 = [v12 identifier];
        char v13 = [(PKDashboardTransactionFetcher *)transactionFetcher cashbackGroupForTransactionWithIdentifier:v20 cashbackTransactionSourceCollection:0];

        [(PKDashboardTransactionMapItem *)v10 setTransactionSourceCollection:self->_transactionSourceCollection];
        [(PKDashboardTransactionMapItem *)v10 setFamilyCollection:self->_familyCollection];
        [(PKDashboardTransactionMapItem *)v10 setAccount:self->_account];
        [(PKDashboardTransactionMapItem *)v10 setAccountUserCollection:self->_accountUserCollection];
        [(PKDashboardTransactionMapItem *)v10 setPhysicalCards:self->_physicalCards];
        [(PKDashboardTransactionMapItem *)v10 setGroup:v13];
LABEL_19:
      }
      else
      {
        uint64_t v26 = [(PKTransactionHistoryDataSource *)self _transactionItemForTransaction:v12];
LABEL_33:
        uint64_t v10 = (PKDashboardTransactionMapItem *)v26;
      }
      goto LABEL_38;
    case 6:
      unint64_t v21 = [v4 row];
      if (v21 >= [(NSArray *)self->_groups count]) {
        goto LABEL_26;
      }
      uint64_t v22 = [(NSArray *)self->_groups objectAtIndex:v21];
      uint64_t v12 = v22;
      if (self->_regionUpdater && [v22 type] == 13)
      {
        uint64_t v23 = self->_regionUpdater;
        uint64_t v24 = [v12 regions];
        uint64_t v25 = [v24 firstObject];
        [(PKWorldRegionUpdater *)v23 updateCoordinatesForWorldRegionIfNeeded:v25];
      }
      uint64_t v26 = [(PKTransactionHistoryDataSource *)self _groupItemForTransaction:v12];
      goto LABEL_33;
    default:
      goto LABEL_26;
  }
}

void __50__PKTransactionHistoryDataSource_itemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [PKInstallmentPlanDetailsViewController alloc];
  id v5 = *(void **)(a1 + 32);
  uint64_t v8 = [(PKInstallmentPlanDetailsViewController *)v4 initWithAccount:v5[28] installmentPlan:v5[9] accountService:v5[19] accountUserCollection:v5[29] familyMemberCollection:v5[17] transactionSourceCollection:v5[1]];
  uint64_t v6 = objc_msgSend(v3, "pkui_viewControllerFromResponderChain");

  uint64_t v7 = [v6 navigationController];
  [v7 pushViewController:v8 animated:1];
}

- (unint64_t)numberOfItemsInSection:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      unint64_t type = self->_type;
      BOOL v5 = type == 4 || type == 2;
      return !v5 || ([(PKPaymentTransactionGroup *)self->_group type] & 0xFFFFFFFFFFFFFFFELL) != 2;
    case 1uLL:
      if (self->_type == 2) {
        return 0;
      }
      unint64_t result = (unint64_t)self->_featuredTransaction;
      if (!result) {
        return result;
      }
      uint64_t v7 = [(id)result preferredLocation];
      if (v7 || self->_associatedInstallmentPlan)
      {

LABEL_14:
        uint64_t v8 = 2;
        return [(NSArray *)self->_featuredTransactionActions count] + v8;
      }
      if (self->_associatedReceipt) {
        goto LABEL_14;
      }
      uint64_t v8 = 1;
      return [(NSArray *)self->_featuredTransactionActions count] + v8;
    case 2uLL:
      uint64_t v9 = [(PKPaymentTransactionGroup *)self->_selectedTransactions transactions];
      unint64_t v10 = [v9 count];

      return v10;
    case 3uLL:
      if (self->_type != 3) {
        return 0;
      }
      if ([(PKAccount *)self->_account accessLevel] == 1) {
        return 2;
      }
      else {
        return 1;
      }
    case 4uLL:
      actionItems = self->_actionItems;
      goto LABEL_26;
    case 5uLL:
      actionItems = self->_transactionHistory;
      goto LABEL_26;
    case 6uLL:
      actionItems = self->_groups;
LABEL_26:
      return [(NSArray *)actionItems count];
    default:
      return 0;
  }
}

- (unint64_t)numberOfSections
{
  return 7;
}

- (id)titleForSection:(unint64_t)a3
{
  BOOL v5 = [(PKPaymentTransactionGroup *)self->_selectedTransactions endDate];
  uint64_t v6 = 0;
  switch(a3)
  {
    case 1uLL:
      if ([(PKPaymentTransaction *)self->_featuredTransaction transactionType] != 3
        || [(PKPaymentTransaction *)self->_featuredTransaction peerPaymentType] != 3
        || [(PKPaymentTransaction *)self->_featuredTransaction transactionStatus])
      {
        goto LABEL_41;
      }
      uint64_t v7 = @"PEER_PAYMENT_PENDING_REQUESTS";
LABEL_31:
      uint64_t v19 = PKLocalizedPaymentString(&v7->isa);
      goto LABEL_39;
    case 2uLL:
      uint64_t v8 = [(PKPaymentTransactionGroup *)self->_selectedTransactions transactions];
      uint64_t v9 = [v8 count];

      if (!v9) {
        goto LABEL_41;
      }
      uint64_t v6 = 0;
      switch([(PKPaymentTransactionGroup *)self->_selectedTransactions type])
      {
        case 0:
        case 1:
        case 4:
        case 6:
        case 8:
        case 15:
        case 16:
          if (![(NSArray *)self->_transactionHistory count]) {
            goto LABEL_30;
          }
          unint64_t v10 = [(PKPaymentTransactionGroup *)self->_selectedTransactions startDate];
          unint64_t v11 = [(PKPaymentTransactionGroup *)self->_selectedTransactions endDate];
          uint64_t v12 = PKDateRangeStringFromDateToDate();

          goto LABEL_10;
        case 5:
          if ([(NSCalendar *)self->_currentCalendar isDateInToday:v5])
          {
            id v15 = @"RELATIVE_DATE_RECEIVED_TODAY";
            goto LABEL_38;
          }
          if ([(NSCalendar *)self->_currentCalendar isDateInYesterday:v5])
          {
            id v15 = @"RELATIVE_DATE_RECEIVED_YESTERDAY";
            goto LABEL_38;
          }
          unint64_t v10 = [(NSDateFormatter *)self->_formatterTitle stringFromDate:v5];
          uint64_t v18 = PKLocalizedString(&cfstr_RelativeDateRe_1.isa, &stru_1EF1B4C70.isa, v10);
          break;
        case 12:
          uint64_t v19 = PKLocalizedPeerPaymentRecurringString(&cfstr_TransactionHis.isa);
          goto LABEL_39;
        case 14:
          goto LABEL_30;
        default:
          goto LABEL_42;
      }
LABEL_46:
      uint64_t v12 = (void *)v18;
LABEL_10:

      if (!v12) {
        goto LABEL_41;
      }
      goto LABEL_40;
    case 5uLL:
      if (!self->_contentIsLoaded || ![(NSArray *)self->_transactionHistory count]) {
        goto LABEL_41;
      }
      switch(self->_type)
      {
        case 0uLL:
LABEL_15:
          uint64_t v7 = @"PEER_PAYMENT_HISTORY";
          goto LABEL_31;
        case 1uLL:
          uint64_t v7 = @"PAYMENT_TRANSACTION_HISTORY";
          goto LABEL_31;
        case 2uLL:
          uint64_t v6 = 0;
          switch([(PKPaymentTransactionGroup *)self->_group type])
          {
            case 2:
            case 3:
              goto LABEL_42;
            case 5:
              uint64_t v16 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
              id v17 = [v16 components:8 fromDate:v5];
              [v17 month];

              unint64_t v10 = PKGregorianMonthSpecificLocalizedStringKeyForKey();
              uint64_t v18 = PKLocalizedString((NSString *)v10);
              goto LABEL_46;
            case 7:
              goto LABEL_15;
            case 9:
              uint64_t v19 = PKLocalizedFeatureString();
              goto LABEL_39;
            default:
LABEL_30:
              uint64_t v7 = @"PAYMENT_TRANSACTIONS";
              goto LABEL_31;
          }
        case 3uLL:
          uint64_t v19 = PKLocalizedBeekmanString(&cfstr_InstallmentHis.isa);
          goto LABEL_39;
        default:
          goto LABEL_41;
      }
      goto LABEL_42;
    case 6uLL:
      if (![(NSArray *)self->_groups count]) {
        goto LABEL_41;
      }
      char v13 = [(NSArray *)self->_groups firstObject];
      uint64_t v14 = [v13 type];

      uint64_t v6 = 0;
      if (v14 <= 11)
      {
        if (v14)
        {
          if (v14 != 1) {
            goto LABEL_42;
          }
          id v15 = @"SEARCH_TITLE_MERCHANTS";
        }
        else
        {
          id v15 = @"SEARCH_TITLE_CATEGORIES";
        }
      }
      else
      {
        if (v14 == 12)
        {
LABEL_21:
          id v15 = @"SEARCH_TITLE_PEOPLE";
          goto LABEL_38;
        }
        if (v14 != 13)
        {
          if (v14 != 16) {
            goto LABEL_42;
          }
          goto LABEL_21;
        }
        id v15 = @"SEARCH_TITLE_LOCATION";
      }
LABEL_38:
      uint64_t v19 = PKLocalizedString(&v15->isa);
LABEL_39:
      uint64_t v12 = (void *)v19;
      if (v19)
      {
LABEL_40:
        uint64_t v6 = +[PKDashboardHeaderTextItem itemWithHeaderText:v12];
      }
      else
      {
LABEL_41:
        uint64_t v6 = 0;
      }
LABEL_42:

      return v6;
    default:
      goto LABEL_42;
  }
}

- (id)footerTextItemForSection:(unint64_t)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (a3 != 1) {
    goto LABEL_5;
  }
  id v4 = [(PKPaymentTransaction *)self->_featuredTransaction preferredLocation];
  if (!v4) {
    goto LABEL_6;
  }
  int v5 = [(PKCoarseLocationMonitor *)self->_coarseLocationMonitor coarseLocationEnabled];

  if (v5)
  {
    uint64_t v6 = PKLocalizedPaymentString(&cfstr_CoarseLocation.isa);
    uint64_t v7 = PKLocalizedPaymentString(&cfstr_CoarseLocation_0.isa, &stru_1EF1B4C70.isa, v6);
    id v4 = +[PKDashboardFooterTextItem itemWithFooterText:v7];
    uint64_t v8 = [MEMORY[0x1E4FB1618] linkColor];
    [v4 setLinkTextColor:v8];

    uint64_t v9 = [[PKTextRangeHyperlink alloc] initWithLinkText:v6 action:&__block_literal_global_213];
    v12[0] = v9;
    unint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    [v4 setSources:v10];
  }
  else
  {
LABEL_5:
    id v4 = 0;
  }
LABEL_6:

  return v4;
}

void __59__PKTransactionHistoryDataSource_footerTextItemForSection___block_invoke()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F1CB10] URLWithString:@"settings-navigation://com.apple.Settings.PrivacyAndSecurity/LOCATION"];
  v1 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = [v0 absoluteString];
    int v4 = 138412290;
    int v5 = v2;
    _os_log_impl(&dword_19F450000, v1, OS_LOG_TYPE_DEFAULT, "Opening URL: %@", (uint8_t *)&v4, 0xCu);
  }
  id v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v3 openSensitiveURL:v0 withOptions:0];
}

- (id)_totalSpendingFromTransactions:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v31 = a4;
  id v30 = a5;
  if ([v7 count])
  {
    uint64_t v8 = [MEMORY[0x1E4F28C28] zero];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v29 = v7;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      if (v31) {
        BOOL v12 = v30 == 0;
      }
      else {
        BOOL v12 = 1;
      }
      uint64_t v13 = *(void *)v33;
      int v14 = !v12;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v33 != v13) {
            objc_enumerationMutation(v9);
          }
          uint64_t v16 = *(void **)(*((void *)&v32 + 1) + 8 * v15);
          unint64_t v17 = [v16 transactionType];
          if (v17 <= 0xD)
          {
            if (((1 << v17) & 0x2882) != 0
              || !v17
              && ((unint64_t v22 = [v16 transactionStatus], v22 <= 8)
                ? (BOOL v23 = ((1 << v22) & 0x103) == 0)
                : (BOOL v23 = 1),
                  !v23))
            {
              if (!v14) {
                goto LABEL_17;
              }
              uint64_t v18 = [v16 transactionDate];
              if ([v18 compare:v31] != -1)
              {
                id v19 = v9;
                uint64_t v20 = [v18 compare:v30];

                BOOL v12 = v20 == 1;
                id v9 = v19;
                if (v12) {
                  goto LABEL_20;
                }
LABEL_17:
                uint64_t v18 = [v16 amount];
                if (v18)
                {
                  uint64_t v21 = [(NSDecimalNumber *)v8 decimalNumberByAdding:v18];

                  uint64_t v8 = (NSDecimalNumber *)v21;
                }
              }
            }
          }
LABEL_20:
          ++v15;
        }
        while (v11 != v15);
        uint64_t v24 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
        uint64_t v11 = v24;
      }
      while (v24);
    }

    uint64_t v25 = [v9 firstObject];
    uint64_t v26 = [v25 currencyCode];

    if (v26)
    {
      uint64_t v27 = PKCurrencyAmountCreate(v8, v26);
    }
    else
    {
      uint64_t v27 = 0;
    }
    id v7 = v29;
  }
  else
  {
    uint64_t v27 = 0;
  }

  return v27;
}

- (id)_totalPaymentsFromTransactions:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v32 = a5;
  if ([v7 count])
  {
    id v9 = [MEMORY[0x1E4F28C28] zero];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v31 = v7;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (!v11) {
      goto LABEL_31;
    }
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v34;
    if (v8) {
      BOOL v14 = v32 == 0;
    }
    else {
      BOOL v14 = 1;
    }
    char v15 = !v14;
    char v16 = v15 ^ 1;
    while (1)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v18 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v19 = objc_msgSend(v18, "transactionType", v31);
        if (v19 == 10 || v19 == 0)
        {
          unint64_t v21 = [v18 transactionStatus];
          if (v21 > 1) {
            char v22 = 1;
          }
          else {
            char v22 = v16;
          }
          if (v22)
          {
            if (v21 > 1) {
              continue;
            }
LABEL_26:
            uint64_t v25 = [v18 amount];
            BOOL v23 = objc_msgSend(v25, "pk_absoluteValue");

            if (v23)
            {
              uint64_t v26 = [(NSDecimalNumber *)v9 decimalNumberByAdding:v23];

              id v9 = (NSDecimalNumber *)v26;
            }
LABEL_28:

            continue;
          }
          BOOL v23 = [v18 transactionDate];
          if ([v23 compare:v8] == -1) {
            goto LABEL_28;
          }
          uint64_t v24 = [v23 compare:v32];

          if (v24 != 1) {
            goto LABEL_26;
          }
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (!v12)
      {
LABEL_31:

        uint64_t v27 = [v10 firstObject];
        uint64_t v28 = [v27 currencyCode];
        id v29 = PKCurrencyAmountCreate(v9, v28);

        id v7 = v31;
        goto LABEL_33;
      }
    }
  }
  id v29 = 0;
LABEL_33:

  return v29;
}

- (id)_totalRewardsFromTransactions:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    int v4 = [MEMORY[0x1E4F28C28] zero];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (!v6) {
      goto LABEL_18;
    }
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    while (1)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v10, "transactionType", (void)v19) == 8)
        {
          uint64_t v11 = [v10 amount];
          goto LABEL_14;
        }
        if (![v10 transactionType])
        {
          uint64_t v11 = [v10 rewardsTotalAmount];
LABEL_14:
          uint64_t v13 = v11;
          uint64_t v12 = objc_msgSend(v11, "pk_absoluteValue");

          if (!v12) {
            continue;
          }
LABEL_15:
          uint64_t v14 = [(NSDecimalNumber *)v4 decimalNumberByAdding:v12];

          int v4 = (NSDecimalNumber *)v14;
          continue;
        }
        if ([v10 transactionType] == 14)
        {
          uint64_t v12 = [v10 rewardsTotalAmount];
          if (v12) {
            goto LABEL_15;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (!v7)
      {
LABEL_18:

        char v15 = [v5 firstObject];
        char v16 = [v15 currencyCode];
        unint64_t v17 = PKCurrencyAmountCreate(v4, v16);

        goto LABEL_20;
      }
    }
  }
  unint64_t v17 = 0;
LABEL_20:

  return v17;
}

- (id)_totalDailyCashRewardsFromTransactions:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    int v4 = [MEMORY[0x1E4F28C28] zero];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "rewardsTotalAmount", (void)v16);
          if (v10)
          {
            uint64_t v11 = [(NSDecimalNumber *)v4 decimalNumberByAdding:v10];

            int v4 = (NSDecimalNumber *)v11;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }

    uint64_t v12 = [v5 firstObject];
    uint64_t v13 = [v12 currencyCode];
    uint64_t v14 = PKCurrencyAmountCreate(v4, v13);
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)_totalFromGroups:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = [v3 firstObject];
  id v5 = [v4 totalAmount];
  uint64_t v6 = [v5 currency];

  if (v6)
  {
    id v31 = v6;
    id v32 = [MEMORY[0x1E4F28C28] zero];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v30 = v3;
    id v7 = v3;
    uint64_t v38 = [v7 countByEnumeratingWithState:&v47 objects:v53 count:16];
    if (!v38) {
      goto LABEL_36;
    }
    uint64_t v37 = *(void *)v48;
    id v34 = v7;
    while (1)
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v48 != v37) {
          objc_enumerationMutation(v7);
        }
        id v9 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        if ([v9 type] == 13)
        {
          long long v45 = 0u;
          long long v46 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          id v10 = [v9 regions];
          uint64_t v35 = [v10 countByEnumeratingWithState:&v43 objects:v52 count:16];
          if (v35)
          {
            uint64_t v11 = *(void *)v44;
            uint64_t v33 = *(void *)v44;
            do
            {
              uint64_t v12 = 0;
              do
              {
                if (*(void *)v44 != v11) {
                  objc_enumerationMutation(v10);
                }
                uint64_t v36 = v12;
                uint64_t v13 = *(void **)(*((void *)&v43 + 1) + 8 * v12);
                long long v39 = 0u;
                long long v40 = 0u;
                long long v41 = 0u;
                long long v42 = 0u;
                id v14 = v7;
                uint64_t v15 = [v14 countByEnumeratingWithState:&v39 objects:v51 count:16];
                if (v15)
                {
                  uint64_t v16 = v15;
                  uint64_t v17 = *(void *)v40;
                  while (2)
                  {
                    for (uint64_t j = 0; j != v16; ++j)
                    {
                      if (*(void *)v40 != v17) {
                        objc_enumerationMutation(v14);
                      }
                      long long v19 = *(void **)(*((void *)&v39 + 1) + 8 * j);
                      if (v19 != v9)
                      {
                        long long v20 = [v19 regions];
                        char v21 = [v13 isIncludedInRegions:v20];

                        if (v21)
                        {
                          id v7 = v34;
                          goto LABEL_33;
                        }
                      }
                    }
                    uint64_t v16 = [v14 countByEnumeratingWithState:&v39 objects:v51 count:16];
                    if (v16) {
                      continue;
                    }
                    break;
                  }
                }

                uint64_t v12 = v36 + 1;
                uint64_t v11 = v33;
                id v7 = v34;
              }
              while (v36 + 1 != v35);
              uint64_t v35 = [v10 countByEnumeratingWithState:&v43 objects:v52 count:16];
            }
            while (v35);
          }
        }
        long long v22 = [v9 totalAmount];
        id v10 = v22;
        if (v22)
        {
          BOOL v23 = [v22 currency];
          id v14 = v31;
          id v24 = v23;
          if (v14 == v24)
          {

LABEL_32:
            id v14 = [v10 amount];
            uint64_t v27 = [v32 decimalNumberByAdding:v14];

            id v32 = (void *)v27;
LABEL_33:

            goto LABEL_34;
          }
          uint64_t v25 = v24;
          if (!v24) {
            goto LABEL_33;
          }
          int v26 = [v14 isEqualToString:v24];

          if (v26) {
            goto LABEL_32;
          }
        }
LABEL_34:
      }
      uint64_t v38 = [v7 countByEnumeratingWithState:&v47 objects:v53 count:16];
      if (!v38)
      {
LABEL_36:

        uint64_t v6 = v31;
        uint64_t v28 = PKCurrencyAmountMake();

        id v3 = v30;
        goto LABEL_38;
      }
    }
  }
  uint64_t v28 = 0;
LABEL_38:

  return v28;
}

- (void)_p2pTotalsFromTransactions:(id)a3 received:(id *)a4 sent:(id *)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = [v7 count];
  if (a5 || a4 || v8)
  {
    id v34 = a4;
    uint64_t v35 = a5;
    uint64_t v38 = [MEMORY[0x1E4F28C28] zero];
    uint64_t v37 = [MEMORY[0x1E4F28C28] zero];
    id v9 = [v7 firstObject];
    id v10 = [v9 currencyCode];

    context = (void *)MEMORY[0x1A6224460]();
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v41;
LABEL_6:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v41 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v40 + 1) + 8 * v15);
        if ([v16 transactionType] != 3) {
          goto LABEL_27;
        }
        uint64_t v17 = [v16 currencyCode];
        id v18 = v10;
        id v19 = v17;
        if (v18 == v19)
        {
        }
        else
        {
          long long v20 = v19;
          if (!v10 || !v19)
          {

LABEL_34:
            uint64_t v33 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19F450000, v33, OS_LOG_TYPE_DEFAULT, "Found different currency codes in p2p transactions.", buf, 2u);
            }

            id v30 = v37;
            uint64_t v27 = v38;
            goto LABEL_37;
          }
          char v21 = [v18 isEqualToString:v19];

          if ((v21 & 1) == 0) {
            goto LABEL_34;
          }
        }
        long long v22 = [v16 subtotalAmount];
        if (v22)
        {
          BOOL v23 = v22;
          if ((objc_msgSend(v22, "pk_isNotANumber") & 1) != 0 || objc_msgSend(v16, "transactionStatus") != 1)
          {
            id v24 = v23;
          }
          else
          {
            id v24 = objc_msgSend(v23, "pk_absoluteValue");

            uint64_t v25 = [v16 peerPaymentType];
            if (v25 == 2)
            {
              int v26 = v38;
              uint64_t v38 = [v38 decimalNumberByAdding:v24];
              goto LABEL_25;
            }
            if (v25 == 1)
            {
              int v26 = v37;
              uint64_t v37 = [v37 decimalNumberByAdding:v24];
LABEL_25:
            }
          }
        }
        else
        {
          id v24 = 0;
        }

LABEL_27:
        if (v13 == ++v15)
        {
          uint64_t v13 = [v11 countByEnumeratingWithState:&v40 objects:v44 count:16];
          if (v13) {
            goto LABEL_6;
          }
          break;
        }
      }
    }

    uint64_t v27 = v38;
    if (v34)
    {
      uint64_t v28 = PKCurrencyAmountMake();
      id v29 = *v34;
      *id v34 = (id)v28;
    }
    id v30 = v37;
    if (v35)
    {
      uint64_t v31 = PKCurrencyAmountMake();
      id v32 = *v35;
      id *v35 = (id)v31;
    }
LABEL_37:
  }
}

- (id)_transactionItemForTransaction:(id)a3
{
  group = self->_group;
  id v5 = a3;
  if ([(PKPaymentTransactionGroup *)group type] == 5)
  {
    uint64_t v6 = [(PKDashboardTransactionFetcher *)self->_transactionFetcher cashbackTransactionSourceCollection];
  }
  else
  {
    uint64_t v6 = self->_transactionSourceCollection;
  }
  id v7 = v6;
  uint64_t v8 = [[PKDashboardPaymentTransactionItem alloc] initWithTransactionSourceCollection:v6 familyCollection:self->_familyCollection transaction:v5 account:self->_account accountUserCollection:self->_accountUserCollection bankConnectInstitution:self->_bankConnectInstitution];
  [(PKDashboardPaymentTransactionItem *)v8 setPhysicalCards:self->_physicalCards];
  id v9 = [v5 secondaryFundingSourceFPANIdentifier];

  if (v9)
  {
    sourcesPerFundingSourceIdentifier = self->_sourcesPerFundingSourceIdentifier;
    if (!sourcesPerFundingSourceIdentifier)
    {
      id v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v12 = self->_sourcesPerFundingSourceIdentifier;
      self->_sourcesPerFundingSourceIdentifier = v11;

      sourcesPerFundingSourceIdentifier = self->_sourcesPerFundingSourceIdentifier;
    }
    uint64_t v13 = [(NSMutableDictionary *)sourcesPerFundingSourceIdentifier objectForKey:v9];
    if (!v13)
    {
      uint64_t v14 = [MEMORY[0x1E4F84898] sharedInstance];
      uint64_t v15 = [v14 passWithFPANIdentifier:v9];

      if (v15)
      {
        uint64_t v16 = [objc_alloc(MEMORY[0x1E4F850C0]) initWithPaymentPass:v15];
      }
      else
      {
        uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
      }
      uint64_t v13 = (void *)v16;
      [(NSMutableDictionary *)self->_sourcesPerFundingSourceIdentifier setObject:v16 forKey:v9];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(PKDashboardPaymentTransactionItem *)v8 setSecondaryTransactionSource:v13];
    }
  }

  return v8;
}

- (id)_groupItemForTransaction:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(PKDashboardPaymentTransactionGroupItem);
  [(PKDashboardPaymentTransactionGroupItem *)v5 setTransactionSourceCollection:self->_transactionSourceCollection];
  [(PKDashboardPaymentTransactionGroupItem *)v5 setFamilyCollection:self->_familyCollection];
  [(PKDashboardPaymentTransactionGroupItem *)v5 setAccount:self->_account];
  [(PKDashboardPaymentTransactionGroupItem *)v5 setAccountUserCollection:self->_accountUserCollection];
  [(PKDashboardPaymentTransactionGroupItem *)v5 setPhysicalCards:self->_physicalCards];
  [(PKDashboardPaymentTransactionGroupItem *)v5 setGroup:v4];

  [(PKDashboardPaymentTransactionGroupItem *)v5 setTokens:self->_tokens];

  return v5;
}

- (id)_headerItem
{
  switch(self->_type)
  {
    case 0uLL:
      uint64_t v13 = [[PKTransactionHistoryHeaderItem alloc] initWithType:1];
      uint64_t v14 = [(PKDashboardTransactionFetcher *)self->_transactionFetcher counterpartHandles];
      uint64_t v15 = [v14 anyObject];
      [(PKTransactionHistoryHeaderItem *)v13 setPeerPaymentCounterpartHandle:v15];

      [(PKTransactionHistoryHeaderItem *)v13 setContact:self->_contact];
      goto LABEL_24;
    case 1uLL:
      uint64_t v13 = [[PKTransactionHistoryHeaderItem alloc] initWithType:0];
      [(PKTransactionHistoryHeaderItem *)v13 setMerchant:self->_merchant];
      if (!self->_featuredTransaction)
      {
        uint64_t v16 = [(PKPaymentTransactionGroup *)self->_selectedTransactions transactions];
        BOOL v23 = [v16 firstObject];
        [(PKTransactionHistoryHeaderItem *)v13 setTransaction:v23];

        goto LABEL_23;
      }
      -[PKTransactionHistoryHeaderItem setTransaction:](v13, "setTransaction:");
      goto LABEL_24;
    case 2uLL:
    case 4uLL:
      if ([(PKPaymentTransactionGroup *)self->_group type] == 14)
      {
        id v3 = [(PKPaymentTransactionGroup *)self->_group searchQuery];
        id v4 = [v3 tokens];
        uint64_t v5 = [v4 count];

        uint64_t v6 = [(PKPaymentTransactionGroup *)self->_group searchQuery];
        id v7 = [v6 merchantToken];
        uint64_t v8 = [v7 group];
        id v9 = [v8 merchant];

        id v10 = [(PKPaymentTransactionGroup *)self->_group searchQuery];
        id v11 = [v10 peerPaymentToken];
        uint64_t v12 = [v11 group];

        if (v5 == 1 && v9)
        {
          uint64_t v13 = [[PKTransactionHistoryHeaderItem alloc] initWithType:0];
          [(PKTransactionHistoryHeaderItem *)v13 setMerchant:v9];
          goto LABEL_21;
        }
        if (v5 == 1 && v12)
        {
          uint64_t v13 = [[PKTransactionHistoryHeaderItem alloc] initWithType:1];
          id v19 = [v12 handles];
          long long v20 = [v19 anyObject];
          [(PKTransactionHistoryHeaderItem *)v13 setPeerPaymentCounterpartHandle:v20];

          [(PKTransactionHistoryHeaderItem *)v13 setContact:self->_contact];
          goto LABEL_21;
        }
      }
      else
      {
        uint64_t v12 = 0;
        id v9 = 0;
      }
      uint64_t v13 = [[PKTransactionHistoryHeaderItem alloc] initWithType:2];
      [(PKTransactionHistoryHeaderItem *)v13 setTransactionGroup:self->_group];
      account = self->_account;
      if (account)
      {
        uint64_t v18 = [(PKAccount *)account feature];
      }
      else
      {
        char v21 = [(PKTransactionSourceCollection *)self->_transactionSourceCollection paymentPass];
        int v22 = [v21 hasAssociatedPeerPaymentAccount];

        if (!v22) {
          goto LABEL_20;
        }
        uint64_t v18 = 1;
      }
      [(PKTransactionHistoryHeaderItem *)v13 setFeatureIdentifier:v18];
LABEL_20:
      [(PKTransactionHistoryHeaderItem *)v13 setHistoryCount:[(PKPaymentTransactionGroup *)self->_group transactionCount]+ [(NSArray *)self->_transactionHistory count]];
LABEL_21:

LABEL_24:
      return v13;
    case 3uLL:
      uint64_t v13 = [[PKTransactionHistoryHeaderItem alloc] initWithType:4];
      uint64_t v16 = [(PKCreditInstallmentPlan *)self->_associatedInstallmentPlan product];
      [(PKTransactionHistoryHeaderItem *)v13 setInstallmentProduct:v16];
LABEL_23:

      goto LABEL_24;
    default:
      uint64_t v13 = 0;
      goto LABEL_24;
  }
}

- (void)_loadContact
{
  id v3 = [(PKPaymentTransaction *)self->_featuredTransaction peerPaymentCounterpartImageRecordIdentifier];
  if ([(PKPaymentTransaction *)self->_featuredTransaction peerPaymentPaymentMode] == 2
    && v3 != 0)
  {
    if ([(PKPeerPaymentCounterpartImageResolver *)self->_peerPaymentImageResolver hasCachedImageDataForIdentifier:v3])
    {
      id v7 = [(PKPeerPaymentCounterpartImageResolver *)self->_peerPaymentImageResolver counterpartImageDataForIdentifier:v3];
      uint64_t v8 = (CNContact *)objc_alloc_init(MEMORY[0x1E4F1BA40]);
      [(CNContact *)v8 setImageData:v7];
      contact = self->_contact;
      self->_contact = v8;

      self->_contactLoaded = 1;
      [(PKTransactionHistoryDataSource *)self _notifyContentLoadedIfNecessary];

      goto LABEL_14;
    }
    objc_initWeak(&location, self);
    peerPaymentImageResolver = self->_peerPaymentImageResolver;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __46__PKTransactionHistoryDataSource__loadContact__block_invoke;
    v16[3] = &unk_1E59DE600;
    id v11 = &v17;
    objc_copyWeak(&v17, &location);
    [(PKPeerPaymentCounterpartImageResolver *)peerPaymentImageResolver counterpartImageDataForIdentifier:v3 completion:v16];
LABEL_13:
    objc_destroyWeak(v11);
    objc_destroyWeak(&location);
    goto LABEL_14;
  }
  if (self->_peerPaymentCounterpartHandle)
  {
    if (!-[PKContactResolver hasCachedResultForHandle:](self->_contactResolver, "hasCachedResultForHandle:"))
    {
      objc_initWeak(&location, self);
      contactResolver = self->_contactResolver;
      peerPaymentCounterpartHandle = self->_peerPaymentCounterpartHandle;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __46__PKTransactionHistoryDataSource__loadContact__block_invoke_3;
      v14[3] = &unk_1E59DE628;
      id v11 = &v15;
      objc_copyWeak(&v15, &location);
      [(PKContactResolver *)contactResolver contactForHandle:peerPaymentCounterpartHandle withCompletion:v14];
      goto LABEL_13;
    }
    uint64_t v5 = [(PKContactResolver *)self->_contactResolver contactForHandle:self->_peerPaymentCounterpartHandle];
    uint64_t v6 = self->_contact;
    self->_contact = v5;

    self->_contactLoaded = 1;
    [(PKTransactionHistoryDataSource *)self _notifyContentLoadedIfNecessary];
  }
LABEL_14:
}

void __46__PKTransactionHistoryDataSource__loadContact__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__PKTransactionHistoryDataSource__loadContact__block_invoke_2;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __46__PKTransactionHistoryDataSource__loadContact__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained;
    if (*(void *)(a1 + 32))
    {
      id v3 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
      [v3 setImageData:*(void *)(a1 + 32)];
      id v4 = (void *)v5[36];
      v5[36] = v3;

      id WeakRetained = v5;
    }
    WeakRetained[177] = 1;
    [v5 _notifyContentLoadedIfNecessary];
    id WeakRetained = v5;
  }
}

void __46__PKTransactionHistoryDataSource__loadContact__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__PKTransactionHistoryDataSource__loadContact__block_invoke_4;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __46__PKTransactionHistoryDataSource__loadContact__block_invoke_4(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    objc_storeStrong(WeakRetained + 36, *(id *)(a1 + 32));
    *((unsigned char *)v3 + 177) = 1;
    [v3 _notifyContentLoadedIfNecessary];
    id WeakRetained = v3;
  }
}

- (void)_loadTransactionReceipt
{
  id v3 = [(PKPaymentTransaction *)self->_featuredTransaction associatedReceiptUniqueID];
  if (v3)
  {
    dataProvider = self->_dataProvider;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __57__PKTransactionHistoryDataSource__loadTransactionReceipt__block_invoke;
    v5[3] = &unk_1E59D79D8;
    void v5[4] = self;
    [(PKPaymentDataProvider *)dataProvider transactionReceiptWithUniqueID:v3 completion:v5];
  }
  else
  {
    self->_associatedReceiptLoaded = 1;
    [(PKTransactionHistoryDataSource *)self _notifyContentLoadedIfNecessary];
  }
}

void __57__PKTransactionHistoryDataSource__loadTransactionReceipt__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__PKTransactionHistoryDataSource__loadTransactionReceipt__block_invoke_2;
  v6[3] = &unk_1E59CA870;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __57__PKTransactionHistoryDataSource__loadTransactionReceipt__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) lineItems];
  id v3 = [v2 firstObject];
  uint64_t v4 = [v3 image];

  if (v4) {
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 80), *(id *)(a1 + 32));
  }
  *(unsigned char *)(*(void *)(a1 + 40) + 179) = 1;
  id v5 = *(void **)(a1 + 40);

  return [v5 _notifyContentLoadedIfNecessary];
}

- (void)_reloadTransactions
{
  transactionFetcher = self->_transactionFetcher;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__PKTransactionHistoryDataSource__reloadTransactions__block_invoke;
  v3[3] = &unk_1E59CB328;
  v3[4] = self;
  [(PKDashboardTransactionFetcher *)transactionFetcher reloadTransactionsWithCompletion:v3];
}

void __53__PKTransactionHistoryDataSource__reloadTransactions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__PKTransactionHistoryDataSource__reloadTransactions__block_invoke_2;
  v5[3] = &unk_1E59CA870;
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __53__PKTransactionHistoryDataSource__reloadTransactions__block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 178) = 1;
  return [*(id *)(a1 + 32) _handleTransactionHistoryUpdated:*(void *)(a1 + 40)];
}

- (void)_notifyContentLoadedIfNecessary
{
  if (!self->_contentIsLoaded)
  {
    switch(self->_type)
    {
      case 0uLL:
      case 2uLL:
      case 4uLL:
        if (self->_contactLoaded) {
          goto LABEL_5;
        }
        break;
      case 1uLL:
        if (self->_transactionHistoryLoaded && self->_associatedReceiptLoaded) {
          goto LABEL_6;
        }
        break;
      case 3uLL:
LABEL_5:
        if (self->_transactionHistoryLoaded)
        {
LABEL_6:
          self->_contentIsLoaded = 1;
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          [WeakRetained contentIsLoaded];
        }
        break;
      default:
        return;
    }
  }
}

- (BOOL)isListLayoutForSection:(unint64_t)a3
{
  return a3 == 5;
}

- (BOOL)canDeleteItem:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 transaction];
    char v5 = [v4 isDeletable];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)deleteItem:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_customDelegate);
  id v9 = objc_loadWeakRetained((id *)&self->_delegate);
  id v10 = [v7 transaction];

  if (WeakRetained && v9 && v10)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __63__PKTransactionHistoryDataSource_deleteItem_completionHandler___block_invoke;
    v11[3] = &unk_1E59D4928;
    id v14 = v6;
    v11[4] = self;
    id v12 = v10;
    id v13 = v9;
    [WeakRetained presentActivityDeletionConfirmationWithCompletion:v11];
  }
  else if (v6)
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

void __63__PKTransactionHistoryDataSource_deleteItem_completionHandler___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0
    && (uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 184) indexOfObject:*(void *)(a1 + 40)],
        v3 != 0x7FFFFFFFFFFFFFFFLL))
  {
    uint64_t v6 = v3;
    id v7 = (void *)[*(id *)(*(void *)(a1 + 32) + 184) mutableCopy];
    [v7 removeObject:*(void *)(a1 + 40)];
    uint64_t v8 = *(void **)(a1 + 48);
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __63__PKTransactionHistoryDataSource_deleteItem_completionHandler___block_invoke_2;
    id v17 = &unk_1E59CEF78;
    uint64_t v18 = *(void *)(a1 + 32);
    id v9 = v7;
    id v19 = v9;
    uint64_t v21 = v6;
    id v20 = *(id *)(a1 + 48);
    [v8 performBatchUpdates:&v14 completion:0];
    uint64_t v10 = *(void *)(a1 + 56);
    if (v10) {
      (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, 1);
    }
    id v11 = *(void **)(a1 + 40);
    id v12 = *(void **)(*(void *)(a1 + 32) + 112);
    id v13 = objc_msgSend(v11, "identifier", v14, v15, v16, v17, v18);
    [v12 deletePaymentTransactionWithIdentifier:v13];
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 56);
    if (v4)
    {
      char v5 = *(void (**)(void))(v4 + 16);
      v5();
    }
  }
}

void __63__PKTransactionHistoryDataSource_deleteItem_completionHandler___block_invoke_2(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 184);
  *(void *)(v3 + 184) = v2;

  char v5 = [MEMORY[0x1E4F28D58] indexPathForItem:*(void *)(a1 + 56) inSection:5];
  uint64_t v6 = *(void **)(a1 + 48);
  v8[0] = v5;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [v6 deleteItemsAtIndexPaths:v7];
}

- (void)deleteItems:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v24 = (void *)[(NSArray *)self->_transactionHistory mutableCopy];
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v10;
          id v12 = [v11 transaction];
          id v13 = [v12 identifier];

          [v25 addObject:v13];
          transactionHistory = self->_transactionHistory;
          uint64_t v15 = [v11 transaction];
          uint64_t v16 = [(NSArray *)transactionHistory indexOfObject:v15];

          if (v16 != 0x7FFFFFFFFFFFFFFFLL)
          {
            id v17 = [MEMORY[0x1E4F28D58] indexPathForItem:v16 inSection:5];
            [v23 addObject:v17];
          }
          uint64_t v18 = objc_msgSend(v11, "transaction", v23);
          [v24 removeObject:v18];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v7);
  }
  id v19 = v5;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __46__PKTransactionHistoryDataSource_deleteItems___block_invoke;
  v26[3] = &unk_1E59CA8E8;
  v26[4] = self;
  id v27 = v24;
  id v28 = v23;
  id v21 = v23;
  id v22 = v24;
  [WeakRetained performBatchUpdates:v26 completion:0];

  [(PKPaymentDataProvider *)self->_dataProvider deletePaymentTransactionsWithIdentifiers:v25];
}

void __46__PKTransactionHistoryDataSource_deleteItems___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 184);
  *(void *)(v3 + 184) = v2;

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  [WeakRetained deleteItemsAtIndexPaths:*(void *)(a1 + 48)];
}

- (void)_handleTransactionHistoryUpdated:(id)a3
{
  v125[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v102 = v4;
  if (self->_featuredTransaction)
  {
    v123[0] = MEMORY[0x1E4F143A8];
    v123[1] = 3221225472;
    v123[2] = __67__PKTransactionHistoryDataSource__handleTransactionHistoryUpdated___block_invoke;
    v123[3] = &unk_1E59CDE60;
    v123[4] = self;
    uint64_t v5 = [v4 indexOfObjectPassingTest:v123];
    BOOL v101 = v5 != 0x7FFFFFFFFFFFFFFFLL;
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v6 = [v102 objectAtIndex:v5];
      featuredTransaction = self->_featuredTransaction;
      self->_featuredTransaction = v6;
    }
    uint64_t v8 = self->_featuredTransaction;
  }
  else
  {
    uint64_t v8 = 0;
    BOOL v101 = 0;
  }
  if ([(PKPaymentTransaction *)v8 transactionType] == 13
    || ![(PKPaymentTransaction *)self->_featuredTransaction transactionType])
  {
    id v9 = [(PKPaymentTransaction *)self->_featuredTransaction referenceIdentifier];
    uint64_t v10 = [(PKAccount *)self->_account creditDetails];
    id v11 = [v10 installmentPlans];
    v121[0] = MEMORY[0x1E4F143A8];
    v121[1] = 3221225472;
    v121[2] = __67__PKTransactionHistoryDataSource__handleTransactionHistoryUpdated___block_invoke_2;
    v121[3] = &unk_1E59DE650;
    id v12 = v9;
    id v122 = v12;
    id v13 = [v11 objectsPassingTest:v121];

    if ([v13 count] == 1)
    {
      uint64_t v14 = [v13 anyObject];
      associatedInstallmentPlan = self->_associatedInstallmentPlan;
      self->_associatedInstallmentPlan = v14;
    }
    if (self->_associatedInstallmentPlan)
    {
      uint64_t v16 = objc_alloc_init(PKDashboardTextActionItem);
      [(PKDashboardTextActionItem *)v16 setLayoutStyle:0];
      id v17 = PKLocalizedBeekmanString(&cfstr_ViewInstallmen.isa);
      [(PKDashboardTextActionItem *)v16 setTitle:v17];

      objc_initWeak(&location, self);
      v118[0] = MEMORY[0x1E4F143A8];
      v118[1] = 3221225472;
      v118[2] = __67__PKTransactionHistoryDataSource__handleTransactionHistoryUpdated___block_invoke_3;
      v118[3] = &unk_1E59DE678;
      objc_copyWeak(&v119, &location);
      [(PKDashboardTextActionItem *)v16 setAction:v118];
      v125[0] = v16;
      uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v125 count:1];
      featuredTransactionActions = self->_featuredTransactionActions;
      self->_featuredTransactionActions = v18;

      objc_destroyWeak(&v119);
      objc_destroyWeak(&location);
    }
  }
  selectedTransactions = self->_selectedTransactions;
  if (selectedTransactions)
  {
    id v21 = [(PKPaymentTransactionGroup *)selectedTransactions transactions];
    id v22 = (void *)[v21 mutableCopy];

    if (![v22 count]) {
      goto LABEL_20;
    }
    char v23 = 0;
    unint64_t v24 = 0;
    uint64_t v25 = MEMORY[0x1E4F143A8];
    do
    {
      int v26 = [v22 objectAtIndex:v24];
      v116[0] = v25;
      v116[1] = 3221225472;
      v116[2] = __67__PKTransactionHistoryDataSource__handleTransactionHistoryUpdated___block_invoke_4;
      v116[3] = &unk_1E59CDE60;
      id v27 = v26;
      id v117 = v27;
      uint64_t v28 = [v102 indexOfObjectPassingTest:v116];
      if (v28 != 0x7FFFFFFFFFFFFFFFLL)
      {
        long long v29 = [v102 objectAtIndex:v28];
        [v22 replaceObjectAtIndex:v24 withObject:v29];

        char v23 = 1;
      }

      ++v24;
    }
    while (v24 < [v22 count]);
    if (v23)
    {
      long long v30 = self->_selectedTransactions;
      long long v31 = (void *)[v22 copy];
      [(PKPaymentTransactionGroup *)v30 setTransactions:v31];

      char v100 = 1;
    }
    else
    {
LABEL_20:
      char v100 = 0;
    }
  }
  else
  {
    char v100 = 0;
  }
  unint64_t type = self->_type;
  uint64_t v33 = v102;
  if (type == 2)
  {
    switch([(PKPaymentTransactionGroup *)self->_selectedTransactions type])
    {
      case 2:
      case 3:
        uint64_t v41 = [(PKTransactionHistoryDataSource *)self _totalSpendingFromTransactions:v102 startDate:0 endDate:0];
        goto LABEL_39;
      case 5:
        id v51 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v113 = 0u;
        long long v114 = 0u;
        long long v111 = 0u;
        long long v112 = 0u;
        id v52 = v102;
        uint64_t v53 = [v52 countByEnumeratingWithState:&v111 objects:v124 count:16];
        if (v53)
        {
          uint64_t v54 = *(void *)v112;
          do
          {
            for (uint64_t i = 0; i != v53; ++i)
            {
              if (*(void *)v112 != v54) {
                objc_enumerationMutation(v52);
              }
              id v56 = *(void **)(*((void *)&v111 + 1) + 8 * i);
              if ([v56 transactionType] == 9)
              {
                transactionFetcher = self->_transactionFetcher;
                id v58 = [v56 identifier];
                id v59 = [(PKDashboardTransactionFetcher *)transactionFetcher cashbackGroupForTransactionWithIdentifier:v58 cashbackTransactionSourceCollection:0];

                id v60 = [v59 transactions];
                [v51 addObjectsFromArray:v60];
              }
            }
            uint64_t v53 = [v52 countByEnumeratingWithState:&v111 objects:v124 count:16];
          }
          while (v53);
        }

        long long v48 = [(PKPaymentTransactionGroup *)self->_group totalAmount];
        uint64_t v33 = (void *)[v51 copy];

        id v43 = [(PKTransactionHistoryDataSource *)self _totalRewardsFromTransactions:v33];

        char v42 = 0;
        goto LABEL_76;
      case 7:
        uint64_t v61 = [(PKAccount *)self->_account feature];
        objc_super v62 = [MEMORY[0x1E4F1C9C8] date];
        if (v61 == 5)
        {
          uint64_t v63 = [(PKAccount *)self->_account savingsDetails];
          uint64_t v84 = PKStartOfYear();
          long long v48 = [(PKTransactionHistoryDataSource *)self _totalSpendingFromTransactions:v102 startDate:v84 endDate:v62];
          long long v85 = [v63 createdDate];
          long long v86 = [(PKTransactionHistoryDataSource *)self _totalSpendingFromTransactions:v102 startDate:v85 endDate:v62];

          if ((PKEqualObjects() & 1) != 0
            || ([v86 amount],
                long long v87 = objc_claimAutoreleasedReturnValue(),
                int v88 = objc_msgSend(v87, "pk_isPositiveNumber"),
                v87,
                !v88))
          {
            id v43 = 0;
          }
          else
          {
            id v43 = v86;
          }

          char v42 = 1;
        }
        else
        {
          if (v61 != 2)
          {
            char v42 = 0;
            id v43 = 0;
            long long v48 = 0;
            goto LABEL_74;
          }
          uint64_t v63 = PKStartOfYear();
          long long v48 = [(PKTransactionHistoryDataSource *)self _totalSpendingFromTransactions:v102 startDate:v63 endDate:v62];
          char v42 = 0;
          id v43 = 0;
        }

LABEL_74:
        goto LABEL_75;
      case 9:
        uint64_t v64 = [(PKPaymentTransactionGroup *)self->_selectedTransactions transactions];
        uint64_t v65 = [v64 firstObject];
        uint64_t v66 = [v65 transactionDate];

        uint64_t v67 = [MEMORY[0x1E4F1C9A8] currentCalendar];
        v68 = [MEMORY[0x1E4F1C9C8] date];
        uint64_t v69 = [v67 components:14 fromDate:v68];
        [v67 date:v66 matchesComponents:v69];
        id v77 = PKStartOfMonth();
        id v78 = PKStartOfNextMonth();
        id v79 = [v78 dateByAddingTimeInterval:-1.0];
        long long v48 = [(PKTransactionHistoryDataSource *)self _totalPaymentsFromTransactions:v102 startDate:v77 endDate:v79];

        goto LABEL_61;
      default:
        long long v50 = [(PKPaymentTransactionGroup *)self->_selectedTransactions totalAmount];

        if (v50)
        {
          uint64_t v41 = [(PKPaymentTransactionGroup *)self->_selectedTransactions totalAmount];
LABEL_39:
          long long v48 = (void *)v41;
        }
        else
        {
          uint64_t v80 = [v102 count];
          group = self->_group;
          if (v80)
          {
            uint64_t v82 = [(PKPaymentTransactionGroup *)group startDate];
            long long v83 = [(PKPaymentTransactionGroup *)self->_group endDate];
            long long v48 = [(PKTransactionHistoryDataSource *)self _totalSpendingFromTransactions:v102 startDate:v82 endDate:v83];
          }
          else
          {
            uint64_t v96 = [(PKPaymentTransactionGroup *)group transactions];
            id v43 = (id)[v96 count];

            if (!v43)
            {
              char v42 = 0;
              long long v48 = 0;
              goto LABEL_75;
            }
            uint64_t v97 = [(PKPaymentTransactionGroup *)self->_group transactions];
            v98 = [(PKPaymentTransactionGroup *)self->_group startDate];
            v99 = [(PKPaymentTransactionGroup *)self->_group endDate];
            long long v48 = [(PKTransactionHistoryDataSource *)self _totalSpendingFromTransactions:v97 startDate:v98 endDate:v99];
          }
        }
LABEL_61:
        char v42 = 0;
        id v43 = 0;
        goto LABEL_75;
    }
  }
  if (type != 1)
  {
    char v42 = 0;
    id v43 = 0;
    long long v48 = 0;
    goto LABEL_76;
  }
  if (self->_featuredTransaction)
  {
    v115[0] = MEMORY[0x1E4F143A8];
    v115[1] = 3221225472;
    v115[2] = __67__PKTransactionHistoryDataSource__handleTransactionHistoryUpdated___block_invoke_5;
    v115[3] = &unk_1E59CDE60;
    v115[4] = self;
    uint64_t v34 = [v102 indexOfObjectPassingTest:v115];
    if (v34 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v35 = [v102 objectAtIndex:v34];
      uint64_t v36 = self->_featuredTransaction;
      self->_featuredTransaction = v35;
    }
    uint64_t v37 = [(PKPaymentTransaction *)self->_featuredTransaction transactionDate];
    uint64_t v38 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    long long v39 = [MEMORY[0x1E4F1C9C8] date];
    long long v40 = [v38 components:14 fromDate:v39];
    [v38 date:v37 matchesComponents:v40];
    uint64_t v45 = PKStartOfMonth();
    long long v46 = PKStartOfNextMonth();
    long long v47 = [v46 dateByAddingTimeInterval:-1.0];
    long long v48 = [(PKTransactionHistoryDataSource *)self _totalSpendingFromTransactions:v102 startDate:v45 endDate:v47];
  }
  else
  {
    long long v44 = [(PKPaymentTransactionGroup *)self->_selectedTransactions totalAmount];

    if (v44)
    {
      long long v48 = [(PKPaymentTransactionGroup *)self->_selectedTransactions totalAmount];
    }
    else
    {
      long long v49 = v102;
      if (!v102)
      {
        long long v48 = 0;
        goto LABEL_36;
      }
      v70 = [v102 lastObject];
      v71 = [v70 transactionDate];

      v72 = [v102 firstObject];
      id v73 = [v72 transactionDate];

      long long v48 = 0;
      if (v71 && v73)
      {
        id v74 = [MEMORY[0x1E4F1C9C8] date];
        if ([v73 compare:v74] == -1) {
          id v75 = v74;
        }
        else {
          id v75 = v73;
        }
        id v76 = v75;

        long long v48 = [(PKTransactionHistoryDataSource *)self _totalSpendingFromTransactions:v102 startDate:v71 endDate:v76];
      }
      else
      {
        id v76 = v73;
      }
    }
  }
  long long v49 = v102;
LABEL_36:
  id v43 = [(PKTransactionHistoryDataSource *)self _totalDailyCashRewardsFromTransactions:v49];
  char v42 = 0;
LABEL_75:
  uint64_t v33 = v102;
LABEL_76:
  if (self->_featuredTransaction)
  {
    v89 = v33;
    uint64_t v33 = objc_msgSend(v33, "pk_arrayByRemovingObject:");
  }
  v90 = self->_selectedTransactions;
  if (v90)
  {
    uint64_t v91 = v33;
    id v92 = [(PKPaymentTransactionGroup *)v90 transactions];
    uint64_t v33 = objc_msgSend(v33, "pk_arrayByRemovingObjectsInArray:", v92);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__PKTransactionHistoryDataSource__handleTransactionHistoryUpdated___block_invoke_6;
  block[3] = &unk_1E59DE6A0;
  id v104 = v33;
  v105 = self;
  id v106 = v48;
  id v107 = v43;
  BOOL v108 = v101;
  char v109 = v100;
  char v110 = v42;
  id v93 = v43;
  id v94 = v48;
  id v95 = v33;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __67__PKTransactionHistoryDataSource__handleTransactionHistoryUpdated___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 identifier];
  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 56) identifier];
  id v8 = v6;
  id v9 = v7;
  uint64_t v10 = v9;
  if (v8 == v9)
  {
    uint64_t v11 = 1;
  }
  else
  {
    uint64_t v11 = 0;
    if (v8 && v9) {
      uint64_t v11 = [v8 isEqualToString:v9];
    }
  }

  if (v11) {
    *a4 = 1;
  }
  return v11;
}

uint64_t __67__PKTransactionHistoryDataSource__handleTransactionHistoryUpdated___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 identifier];
  uint64_t v5 = [v3 transactionReferenceIdentifier];

  if ([v4 isEqualToString:*(void *)(a1 + 32)]) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = [v5 isEqualToString:*(void *)(a1 + 32)];
  }

  return v6;
}

void __67__PKTransactionHistoryDataSource__handleTransactionHistoryUpdated___block_invoke_3(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = [[PKTransactionHistoryViewController alloc] initWithInstallmentPlan:WeakRetained[9] transactionSourceCollection:WeakRetained[1] familyCollection:WeakRetained[17] account:WeakRetained[28] accountUserCollection:WeakRetained[29] physicalCards:WeakRetained[30]];
    uint64_t v5 = objc_msgSend(v7, "pkui_viewControllerFromResponderChain");
    uint64_t v6 = [v5 navigationController];
    [v6 pushViewController:v4 animated:1];
  }
}

uint64_t __67__PKTransactionHistoryDataSource__handleTransactionHistoryUpdated___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 identifier];
  id v7 = [*(id *)(a1 + 32) identifier];
  id v8 = v6;
  id v9 = v7;
  uint64_t v10 = v9;
  if (v8 == v9)
  {
    uint64_t v11 = 1;
  }
  else
  {
    uint64_t v11 = 0;
    if (v8 && v9) {
      uint64_t v11 = [v8 isEqualToString:v9];
    }
  }

  if (v11) {
    *a4 = 1;
  }
  return v11;
}

uint64_t __67__PKTransactionHistoryDataSource__handleTransactionHistoryUpdated___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 identifier];
  id v7 = [*(id *)(*(void *)(a1 + 32) + 56) identifier];
  id v8 = v6;
  id v9 = v7;
  uint64_t v10 = v9;
  if (v8 == v9)
  {
    uint64_t v11 = 1;
  }
  else
  {
    uint64_t v11 = 0;
    if (v8 && v9) {
      uint64_t v11 = [v8 isEqualToString:v9];
    }
  }

  if (v11) {
    *a4 = 1;
  }
  return v11;
}

void __67__PKTransactionHistoryDataSource__handleTransactionHistoryUpdated___block_invoke_6(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 40);
  char v3 = [*(id *)(a1 + 32) isEqualToArray:*(void *)(*(void *)(a1 + 40) + 184)];
  objc_storeStrong((id *)*v2 + 39, v2[1]);
  objc_storeStrong((id *)*v2 + 40, *(id *)(a1 + 56));
  if (*((unsigned char *)*v2 + 176))
  {
    if (PKBankConnectEnabled()
      && [*(id *)(a1 + 32) count]
      && ([*(id *)(a1 + 32) firstObject],
          id v4 = objc_claimAutoreleasedReturnValue(),
          int v5 = [v4 isBankConnectTransaction],
          v4,
          v5))
    {
      uint64_t v6 = +[PKCollectionViewItemsDiffCalculator calculateDiffBetweenOldItems:*(void *)(*(void *)(a1 + 40) + 184) andNewItems:*(void *)(a1 + 32) inSection:5];
      id v7 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = [v6 deletedIndexPaths];
        uint64_t v9 = [v8 count];
        uint64_t v10 = [v6 insertedIndexPaths];
        uint64_t v11 = [v10 count];
        id v12 = [v6 movedFromIndexPaths];
        uint64_t v13 = [v12 count];
        uint64_t v14 = [v6 changedIndexPaths];
        *(_DWORD *)buf = 134218752;
        uint64_t v36 = v9;
        __int16 v37 = 2048;
        uint64_t v38 = v11;
        __int16 v39 = 2048;
        uint64_t v40 = v13;
        __int16 v41 = 2048;
        uint64_t v42 = [v14 count];
        _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Bank Connect history transactions batch updates: %ld deletions, %ld insertions, %ld moves, %ld updates", buf, 0x2Au);
      }
      objc_initWeak((id *)buf, *(id *)(a1 + 40));
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 48));
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __67__PKTransactionHistoryDataSource__handleTransactionHistoryUpdated___block_invoke_255;
      v30[3] = &unk_1E59CE888;
      objc_copyWeak(&v34, (id *)buf);
      id v16 = *(id *)(a1 + 32);
      uint64_t v17 = *(void *)(a1 + 40);
      id v31 = v16;
      uint64_t v32 = v17;
      id v18 = v6;
      id v33 = v18;
      [WeakRetained performBatchUpdates:v30 completion:0];

      objc_destroyWeak(&v34);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      uint64_t v19 = [*(id *)(a1 + 32) copy];
      uint64_t v20 = *(void *)(a1 + 40);
      id v21 = *(void **)(v20 + 184);
      *(void *)(v20 + 184) = v19;

      id v29 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      if ((v3 & 1) == 0) {
        [v29 addIndex:5];
      }
      uint64_t v22 = *(void *)(a1 + 40);
      if (*(void *)(v22 + 56) && *(unsigned char *)(a1 + 64))
      {
        [v29 addIndex:1];
        uint64_t v22 = *(void *)(a1 + 40);
      }
      if (*(void *)(v22 + 64) && *(unsigned char *)(a1 + 65)) {
        [v29 addIndex:2];
      }
      if (*(unsigned char *)(a1 + 66)) {
        [v29 addIndex:0];
      }
      id v23 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 48));
      [v23 reloadSections:v29];

      id v24 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 40));
      [v24 transactionHistoryUpdated];
    }
  }
  else
  {
    uint64_t v25 = [*(id *)(a1 + 32) copy];
    uint64_t v26 = *(void *)(a1 + 40);
    id v27 = *(void **)(v26 + 184);
    *(void *)(v26 + 184) = v25;

    uint64_t v28 = *(void **)(a1 + 40);
    [v28 _notifyContentLoadedIfNecessary];
  }
}

void __67__PKTransactionHistoryDataSource__handleTransactionHistoryUpdated___block_invoke_255(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained setTransactionHistory:*(void *)(a1 + 32)];
  id v3 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 48));
  id v4 = [*(id *)(a1 + 48) deletedIndexPaths];
  [v3 deleteItemsAtIndexPaths:v4];

  id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 48));
  uint64_t v6 = [*(id *)(a1 + 48) insertedIndexPaths];
  [v5 insertItemsAtIndexPaths:v6];

  id v7 = [*(id *)(a1 + 48) movedFromIndexPaths];
  id v8 = [*(id *)(a1 + 48) movedToIndexPaths];
  if ([v7 count])
  {
    unint64_t v9 = 0;
    do
    {
      id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 48));
      uint64_t v11 = [v7 objectAtIndexedSubscript:v9];
      id v12 = [v8 objectAtIndexedSubscript:v9];
      [v10 moveItemAtIndexPath:v11 toIndexPath:v12];

      ++v9;
    }
    while ([v7 count] > v9);
  }
  id v21 = v8;
  uint64_t v13 = [*(id *)(a1 + 48) changedIndexPaths];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v23;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v22 + 1) + 8 * v17);
        id v19 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 48));
        uint64_t v20 = [WeakRetained itemAtIndexPath:v18];
        [v19 itemChanged:v20 atIndexPath:v18];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v15);
  }
}

- (void)setTransactionHistory:(id)a3
{
}

- (id)_contactKeysToFetch
{
  v11[6] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  v11[0] = v2;
  Class v3 = _MergedGlobals_668();
  id v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  id v5 = -[objc_class descriptorForRequiredKeysWithThreeDTouchEnabled:](v3, "descriptorForRequiredKeysWithThreeDTouchEnabled:", [v4 _supportsForceTouch]);
  v11[1] = v5;
  uint64_t v6 = [(Class)off_1EB5459E8() descriptorForRequiredKeys];
  v11[2] = v6;
  id v7 = [(Class)off_1EB5459F0() descriptorForRequiredKeys];
  uint64_t v8 = *MEMORY[0x1E4F1ADC8];
  v11[3] = v7;
  v11[4] = v8;
  void v11[5] = *MEMORY[0x1E4F1AEE0];
  unint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:6];

  return v9;
}

- (void)_handleAccountsChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(PKAccount *)self->_account accountIdentifier];
  objc_initWeak(&location, self);
  accountService = self->_accountService;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__PKTransactionHistoryDataSource__handleAccountsChangedNotification___block_invoke;
  v7[3] = &unk_1E59CFFF8;
  objc_copyWeak(&v8, &location);
  [(PKAccountService *)accountService accountWithIdentifier:v5 completion:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __69__PKTransactionHistoryDataSource__handleAccountsChangedNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__PKTransactionHistoryDataSource__handleAccountsChangedNotification___block_invoke_2;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __69__PKTransactionHistoryDataSource__handleAccountsChangedNotification___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 28, *(id *)(a1 + 32));
    if (v3[35] == (id)3)
    {
      id v4 = [v3[9] identifier];
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v5 = objc_msgSend(*(id *)(a1 + 32), "creditDetails", 0);
      id v6 = [v5 installmentPlans];

      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v15;
        while (2)
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v15 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
            id v12 = [v11 identifier];
            int v13 = [v4 isEqualToString:v12];

            if (v13)
            {
              objc_storeStrong(v3 + 9, v11);
              goto LABEL_13;
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }
LABEL_13:

      [v3 _updateInstallmentPlan];
    }
  }
}

- (void)_handleCoarseLocationChangedNotification:(id)a3
{
  id v4 = [a3 object];
  coarseLocationMonitor = self->_coarseLocationMonitor;

  if (v4 == coarseLocationMonitor)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__PKTransactionHistoryDataSource__handleCoarseLocationChangedNotification___block_invoke;
    block[3] = &unk_1E59CA7D0;
    void block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __75__PKTransactionHistoryDataSource__handleCoarseLocationChangedNotification___block_invoke(uint64_t a1)
{
  id v3 = (id)[objc_alloc(MEMORY[0x1E4F28E60]) initWithIndex:1];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  [WeakRetained reloadSections:v3];
}

- (void)_updateInstallmentPlan
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(PKCreditInstallmentPlan *)self->_associatedInstallmentPlan remainingAmount];
  id v4 = [MEMORY[0x1E4F28C28] zero];
  uint64_t v5 = [v3 compare:v4];

  BOOL v6 = +[PKCreditAccountController shouldDisplayAccountInformationForTransactionSourceCollection:self->_transactionSourceCollection withAccount:self->_account];
  if ([(PKAccount *)self->_account supportsSchedulePayment]) {
    BOOL v7 = !v6;
  }
  else {
    BOOL v7 = 1;
  }
  BOOL v8 = !v7 && v5 == 1;
  if (v8 && [(PKCreditInstallmentPlan *)self->_associatedInstallmentPlan state] == 2)
  {
    uint64_t v9 = objc_alloc_init(PKDashboardTextActionItem);
    id v10 = PKLocalizedBeekmanString(&cfstr_EarlyPaymentBu.isa);
    [(PKDashboardTextActionItem *)v9 setTitle:v10];

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __56__PKTransactionHistoryDataSource__updateInstallmentPlan__block_invoke;
    v16[3] = &unk_1E59D97B8;
    void v16[4] = self;
    [(PKDashboardTextActionItem *)v9 setAction:v16];
    [(PKDashboardTextActionItem *)v9 setLayoutStyle:0];
    [(PKDashboardTextActionItem *)v9 setActionStyle:1];
    v17[0] = v9;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    actionItems = self->_actionItems;
    self->_actionItems = v11;
  }
  else
  {
    int v13 = self->_actionItems;
    self->_actionItems = 0;
  }
  [(PKTransactionHistoryDataSource *)self _reloadTransactions];
  id v14 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  [v14 addIndex:3];
  [v14 addIndex:4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained reloadSections:v14];
}

void __56__PKTransactionHistoryDataSource__updateInstallmentPlan__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!*(void *)(*(void *)(a1 + 32) + 104))
  {
    id v4 = [[PKAccountServiceAccountResolutionController alloc] initWithAccount:*(void *)(*(void *)(a1 + 32) + 224) accountUserCollection:*(void *)(*(void *)(a1 + 32) + 232) transactionSourceCollection:*(void *)(*(void *)(a1 + 32) + 8)];
    uint64_t v5 = *(void *)(a1 + 32);
    BOOL v6 = *(void **)(v5 + 104);
    *(void *)(v5 + 104) = v4;

    BOOL v7 = *(void **)(*(void *)(a1 + 32) + 104);
    BOOL v8 = objc_msgSend(v3, "pkui_viewControllerFromResponderChain");
    [v7 setPresentingViewController:v8];
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F84278]);
  [v9 setEarlyInstallmentPlan:*(void *)(*(void *)(a1 + 32) + 72)];
  id v10 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 72) identifier];
    int v12 = 138412290;
    int v13 = v11;
    _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "Presenting bill payment for early installment payment with identifier %@", (uint8_t *)&v12, 0xCu);
  }
  [*(id *)(*(void *)(a1 + 32) + 104) presentFlowForAccountResolution:1 configuration:v9 completion:0];
}

- (void)worldRegionUpdated:(id)a3 updatedRegion:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__PKTransactionHistoryDataSource_worldRegionUpdated_updatedRegion___block_invoke;
  v7[3] = &unk_1E59CA870;
  void v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __67__PKTransactionHistoryDataSource_worldRegionUpdated_updatedRegion___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 160);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(a1 + 32), "_updateGroup:withRegion:", v8, *(void *)(a1 + 40), (void)v16))
        {
          id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
          id v10 = [*(id *)(a1 + 32) _groupItemForTransaction:v8];
          uint64_t v11 = [MEMORY[0x1E4F28D58] indexPathForRow:v5 + i inSection:6];
          [WeakRetained itemChanged:v10 atIndexPath:v11];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
      v5 += i;
    }
    while (v4);
  }

  uint64_t v12 = *(void *)(a1 + 32);
  if (*(void *)(v12 + 280) == 4 && [*(id *)(v12 + 304) type] == 13)
  {
    if ([*(id *)(a1 + 32) _updateGroup:*(void *)(*(void *)(a1 + 32) + 304) withRegion:*(void *)(a1 + 40)])
    {
      id v13 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
      uint64_t v14 = [*(id *)(a1 + 32) _headerItem];
      long long v15 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
      [v13 itemChanged:v14 atIndexPath:v15];
    }
  }
}

- (BOOL)_updateGroup:(id)a3 withRegion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 type] == 13)
  {
    BOOL v7 = [v6 identifier];
    uint64_t v8 = [v5 regions];
    id v9 = (void *)[v8 mutableCopy];

    if ([v9 count])
    {
      uint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = [v9 objectAtIndex:v10];
        id v12 = [v11 identifier];
        id v13 = v7;
        uint64_t v14 = v13;
        if (v12 == v13) {
          break;
        }
        if (v7 && v12)
        {
          char v15 = [v12 isEqualToString:v13];

          if (v15) {
            goto LABEL_14;
          }
        }
        else
        {
        }
        if (++v10 >= (unint64_t)[v9 count]) {
          goto LABEL_11;
        }
      }

LABEL_14:
      [v9 replaceObjectAtIndex:v10 withObject:v6];
      long long v17 = (void *)[v9 copy];
      [v5 setRegions:v17];

      BOOL v16 = 1;
    }
    else
    {
LABEL_11:
      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (void)didUpdateTransactions:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (PKBankConnectEnabled())
  {
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F84CF8]) initFromFKTransaction:*(void *)(*((void *)&v17 + 1) + 8 * v10) institution:self->_bankConnectInstitution];
          [v5 addObject:v11];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }

    id v12 = (void *)MEMORY[0x1E4F84CF8];
    id v13 = [(PKTransactionSourceCollection *)self->_transactionSourceCollection transactionSourceIdentifiers];
    uint64_t v14 = [(PKTransactionSourceCollection *)self->_transactionSourceCollection paymentPass];
    char v15 = [v14 uniqueID];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __56__PKTransactionHistoryDataSource_didUpdateTransactions___block_invoke;
    v16[3] = &unk_1E59CB328;
    void v16[4] = self;
    [v12 augmentTransactionsIfNeeded:v5 transactionSourceIdentifiers:v13 passUniqueID:v15 usingDataProvider:0 completion:v16];
  }
}

uint64_t __56__PKTransactionHistoryDataSource_didUpdateTransactions___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleTransactionHistoryUpdated:a2];
}

- (void)bankConnectConsentStatusDidChange:(unint64_t)a3
{
  int v5 = PKBankConnectEnabled();
  if (a3 && v5)
  {
    uint64_t v6 = MEMORY[0x1E4F1CBF0];
    [(PKTransactionHistoryDataSource *)self _handleTransactionHistoryUpdated:v6];
  }
}

- (void)physicalCardsChanged:(id)a3 forAccountIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__PKTransactionHistoryDataSource_physicalCardsChanged_forAccountIdentifier___block_invoke;
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

void __76__PKTransactionHistoryDataSource_physicalCardsChanged_forAccountIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = (void *)*((void *)WeakRetained + 28);
  if (v3)
  {
    uint64_t v10 = (id *)WeakRetained;
    id v4 = *(void **)(a1 + 32);
    int v5 = [v3 accountIdentifier];
    id v6 = v4;
    id v7 = v5;
    if (v6 == v7)
    {

      id WeakRetained = v10;
    }
    else
    {
      id v8 = v7;
      if (!v6 || !v7)
      {

        goto LABEL_10;
      }
      int v9 = [v6 isEqualToString:v7];

      id WeakRetained = v10;
      if (!v9) {
        goto LABEL_11;
      }
    }
    objc_storeStrong((id *)WeakRetained + 30, *(id *)(a1 + 40));
    id v8 = objc_loadWeakRetained(v10 + 5);
    [v8 transactionHistoryUpdated];
LABEL_10:

    id WeakRetained = v10;
  }
LABEL_11:
}

- (unint64_t)type
{
  return self->_type;
}

- (CNContact)contact
{
  return self->_contact;
}

- (PKMerchant)merchant
{
  return self->_merchant;
}

- (PKPaymentTransactionGroup)group
{
  return self->_group;
}

- (NSArray)groups
{
  return self->_groups;
}

- (PKCurrencyAmount)footerTotal
{
  return self->_footerTotal;
}

- (PKCurrencyAmount)footerSecondaryTotal
{
  return self->_footerSecondaryTotal;
}

- (NSIndexPath)headerIndexPath
{
  return self->_headerIndexPath;
}

- (PKTransactionHistoryDataSourceDelegate)customDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_customDelegate);

  return (PKTransactionHistoryDataSourceDelegate *)WeakRetained;
}

- (void)setCustomDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerIndexPath, 0);
  objc_storeStrong((id *)&self->_footerSecondaryTotal, 0);
  objc_storeStrong((id *)&self->_footerTotal, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_merchant, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_peerPaymentImageResolver, 0);
  objc_storeStrong((id *)&self->_bankConnectInstitution, 0);
  objc_storeStrong((id *)&self->_bankConnectTransactionsProvider, 0);
  objc_storeStrong((id *)&self->_bankConnectAccountsProvider, 0);
  objc_storeStrong((id *)&self->_physicalCards, 0);
  objc_storeStrong((id *)&self->_accountUserCollection, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_currentCalendar, 0);
  objc_storeStrong((id *)&self->_formatterMonth, 0);
  objc_storeStrong((id *)&self->_formatterTitle, 0);
  objc_storeStrong((id *)&self->_transactionHistory, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_sourcesPerFundingSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);
  objc_storeStrong((id *)&self->_coarseLocationMonitor, 0);
  objc_storeStrong((id *)&self->_regionUpdater, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_resolutionController, 0);
  objc_storeStrong((id *)&self->_actionItems, 0);
  objc_storeStrong((id *)&self->_featuredTransactionActions, 0);
  objc_storeStrong((id *)&self->_associatedReceipt, 0);
  objc_storeStrong((id *)&self->_associatedInstallmentPlan, 0);
  objc_storeStrong((id *)&self->_selectedTransactions, 0);
  objc_storeStrong((id *)&self->_featuredTransaction, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_customDelegate);
  objc_storeStrong((id *)&self->_peerPaymentCounterpartHandle, 0);
  objc_storeStrong((id *)&self->_contactResolver, 0);
  objc_storeStrong((id *)&self->_transactionFetcher, 0);

  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
}

@end