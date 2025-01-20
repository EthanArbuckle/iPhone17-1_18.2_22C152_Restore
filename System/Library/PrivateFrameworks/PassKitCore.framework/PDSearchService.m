@interface PDSearchService
- (BOOL)_currentPassSupportsTag:(unint64_t)a3;
- (BOOL)_currentQuerySupportsCategory:(int64_t)a3;
- (BOOL)_currentQuerySupportsDateTokenWithStartDate:(id)a3 endDate:(id)a4;
- (BOOL)_currentQuerySupportsPeerPaymentSubTypeToken:(int64_t)a3;
- (BOOL)_currentQuerySupportsRewardsToken:(id)a3;
- (BOOL)_currentQuerySupportsTagToken:(id)a3;
- (BOOL)_currentQuerySupportsTransactionSourceToken:(unint64_t)a3;
- (BOOL)_currentQuerySupportsTransactionStatusToken:(int64_t)a3;
- (BOOL)_currentQuerySupportsTransactionTypeToken:(int64_t)a3;
- (PDAccountManager)accountManager;
- (PDDatabaseManager)databaseManager;
- (PDFamilyCircleManager)familyCircleManager;
- (PDSearchService)initWithConnection:(id)a3;
- (PDSearchService)initWithConnection:(id)a3 server:(id)a4;
- (PDSpotlightIndexer)indexer;
- (id)_contactKeysToFetch;
- (id)_spotlightFilterQueriesForCurrentQuery;
- (id)_transactionRequestForCurrentFilters;
- (id)_uniqueTagOccurenceRules;
- (id)createCurrentNotificationRegistrationState;
- (void)_addWord:(id)a3 forEntry:(id)a4;
- (void)_buildInvertedIndexWithCompletion:(id)a3;
- (void)_categoriesForCurrentQueryWithCompletion:(id)a3;
- (void)_indexString:(id)a3 forEntry:(id)a4;
- (void)_locationsForCurrentQueryWithSuggestions:(BOOL)a3 completion:(id)a4;
- (void)_matchedHandlesForCurrentQueryWithCompletion:(id)a3;
- (void)_paymentTransactionTagTypesWithCompletion:(id)a3;
- (void)_performQueryWithQueryString:(id)a3 attributes:(id)a4 completion:(id)a5;
- (void)_queue_performCurrentQuery;
- (void)_recentMerchantsWithCompletion:(id)a3;
- (void)_sendInvalidationCallback;
- (void)_suggestionsForCurrentQueryWithCompletion:(id)a3;
- (void)_transactionsForCurrentQueryWithFuzzing:(BOOL)a3 completion:(id)a4;
- (void)_uniqueMerchantsForCurrenQueryWithMerchants:(id)a3 allUniqueMerchants:(id)a4 attemptCount:(unint64_t)a5 fuzzyMatching:(BOOL)a6 completion:(id)a7;
- (void)_updateMerchantArray:(id)a3 allUniqueMerchants:(id)a4 counts:(id)a5 withMerchantIfUnique:(id)a6;
- (void)accountManager:(id)a3 accountUsersChanged:(id)a4 oldUsers:(id)a5 accountIdentifier:(id)a6;
- (void)activated;
- (void)canProvideFullResultsWithCompletion:(id)a3;
- (void)cancelQueryWithIdentifier:(id)a3;
- (void)dispatchSearchRequestBlock:(id)a3 errorBlock:(id)a4;
- (void)handleNotificationWithName:(id)a3 event:(id)a4 forStream:(int64_t)a5;
- (void)hasSearchableContentForQuery:(id)a3 withCompletion:(id)a4;
- (void)indexedItemsWithIdentifiers:(id)a3;
- (void)indexedPassesWithCompletion:(id)a3;
- (void)indexedTransactionWithIdentifier:(id)a3 completion:(id)a4;
- (void)indexedTransactionsWithCompletion:(id)a3;
- (void)indexingCompleted;
- (void)indexingStarted;
- (void)regionsWithCompletion:(id)a3;
- (void)resetRegionsCoordinatesWithCompletion:(id)a3;
- (void)resetRegionsWithCompletion:(id)a3;
- (void)searchWithQuery:(id)a3;
- (void)setAccountManager:(id)a3;
- (void)setDatabaseManager:(id)a3;
- (void)setFamilyCircleManager:(id)a3;
- (void)setIndexer:(id)a3;
- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4 oldTransaction:(id)a5;
- (void)transactionSourceIdentifier:(id)a3 didRemoveTransactionWithIdentifier:(id)a4;
- (void)transactionsMissingRegionsWithCompletion:(id)a3;
- (void)updateRegionWithIdentifier:(id)a3 localizedName:(id)a4 boundingRegion:(id *)a5 mapsIdentifier:(unint64_t)a6 providerIdentifier:(int)a7 completion:(id)a8;
@end

@implementation PDSearchService

- (PDSearchService)initWithConnection:(id)a3
{
  return 0;
}

- (PDSearchService)initWithConnection:(id)a3 server:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)PDSearchService;
  v8 = [(PDSearchService *)&v25 initWithConnection:v6];
  v9 = v8;
  if (v8)
  {
    v8->_lockPendingInvalidationCallback._os_unfair_lock_opaque = 0;
    v8->_lock._os_unfair_lock_opaque = 0;
    v10 = (PKEntitlementWhitelist *)[objc_alloc((Class)PKEntitlementWhitelist) initWithConnection:v6];
    whitelist = v9->_whitelist;
    v9->_whitelist = v10;

    v9->_entitledForSearchUse = [(PKEntitlementWhitelist *)v9->_whitelist searchAllAccess];
    v12 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    queries = v9->_queries;
    v9->_queries = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    accountUsers = v9->_accountUsers;
    v9->_accountUsers = v14;

    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.passd.search.work", v16);
    workQueue = v9->_workQueue;
    v9->_workQueue = (OS_dispatch_queue *)v17;

    v19 = sub_100011FE8((uint64_t)v7);
    uint64_t v20 = sub_100035604((uint64_t)v19);
    notificationStreamManager = v9->_notificationStreamManager;
    v9->_notificationStreamManager = (PDNotificationStreamManager *)v20;

    v22 = PKSearchServiceClientInterface();
    [v6 setRemoteObjectInterface:v22];

    v23 = PKSearchServiceDaemonInterface();
    [v6 setExportedInterface:v23];

    [v6 setExportedObject:v9];
  }

  return v9;
}

- (void)activated
{
  [(PDNotificationStreamManager *)self->_notificationStreamManager registerConsumer:self];
  v3.receiver = self;
  v3.super_class = (Class)PDSearchService;
  [(PDSearchService *)&v3 activated];
}

- (void)setIndexer:(id)a3
{
  v5 = (PDSpotlightIndexer *)a3;
  p_indexer = &self->_indexer;
  indexer = self->_indexer;
  v8 = v5;
  if (indexer != v5)
  {
    if (indexer) {
      [(PDSpotlightIndexer *)indexer removeObserver:self];
    }
    objc_storeStrong((id *)&self->_indexer, a3);
    if (*p_indexer)
    {
      [(PDSpotlightIndexer *)*p_indexer addObserver:self];
      [(PDSpotlightIndexer *)*p_indexer triggerIndexing];
    }
  }
}

- (void)setAccountManager:(id)a3
{
  v5 = (PDAccountManager *)a3;
  accountManager = self->_accountManager;
  if (accountManager != v5)
  {
    id v7 = v5;
    if (accountManager) {
      [(PDAccountManager *)accountManager unregisterObserver:self];
    }
    objc_storeStrong((id *)&self->_accountManager, a3);
    accountManager = (PDAccountManager *)[(PDAccountManager *)self->_accountManager registerObserver:self];
    v5 = v7;
  }
  _objc_release_x1(accountManager, v5);
}

- (void)dispatchSearchRequestBlock:(id)a3 errorBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void (**)(void, void))v7;
  if (!v6)
  {
    if (!v7) {
      goto LABEL_11;
    }
    uint64_t v10 = PKSearchErrorDomain;
    uint64_t v11 = 2;
LABEL_10:
    v13 = +[NSError errorWithDomain:v10 code:v11 userInfo:0];
    ((void (**)(void, void *))v8)[2](v8, v13);

    goto LABEL_11;
  }
  if (self->_entitledForSearchUse)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002B7CE4;
    block[3] = &unk_10072F788;
    id v16 = v6;
    dispatch_async(workQueue, block);

    goto LABEL_11;
  }
  v12 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Client is not entitled for search service", v14, 2u);
  }

  if (v8)
  {
    uint64_t v10 = PKSearchErrorDomain;
    uint64_t v11 = 1;
    goto LABEL_10;
  }
LABEL_11:
}

- (void)canProvideFullResultsWithCompletion:(id)a3
{
  v4 = (void (**)(id, uint64_t))a3;
  if (v4)
  {
    v8 = v4;
    os_unfair_lock_lock(&self->_lock);
    BOOL hasSentResults = self->_hasSentResults;
    os_unfair_lock_unlock(&self->_lock);
    id v6 = v8;
    if (hasSentResults)
    {
      uint64_t v7 = 1;
    }
    else
    {
      if ([(PDSpotlightIndexer *)self->_indexer isIndexing]) {
        uint64_t v7 = 0;
      }
      else {
        uint64_t v7 = [(PDSpotlightIndexer *)self->_indexer willRequireIndexing] ^ 1;
      }
      id v6 = v8;
    }
    v6[2](v8, v7);
    v4 = v8;
  }
}

- (void)hasSearchableContentForQuery:(id)a3 withCompletion:(id)a4
{
  id v10 = a3;
  id v6 = (void (**)(id, BOOL))a4;
  if (v6)
  {
    if ([v10 domain] == (id)1
      && (databaseManager = self->_databaseManager,
          [v10 passUniqueIdentifier],
          v8 = objc_claimAutoreleasedReturnValue(),
          [(PDDatabaseManager *)databaseManager allAssociatedTransactionSourceIdentifiersForPassUniqueIdentifier:v8], v9 = objc_claimAutoreleasedReturnValue(), v8, v9))
    {
      v6[2](v6, [(PDDatabaseManager *)self->_databaseManager hasAnyTransactionsForTransactionSourceIdentifiers:v9]);
    }
    else
    {
      v6[2](v6, [(PDDatabaseManager *)self->_databaseManager hasAnyTransactions]);
    }
  }
}

- (void)searchWithQuery:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];
  os_unfair_lock_lock(&self->_lock);
  BOOL hasSentResults = self->_hasSentResults;
  os_unfair_lock_unlock(&self->_lock);
  if (!hasSentResults)
  {
    if ([(PDSpotlightIndexer *)self->_indexer isIndexing]
      || [(PDSpotlightIndexer *)self->_indexer willRequireIndexing])
    {
      uint64_t v7 = [(PDSearchService *)self remoteObjectProxy];
      v8 = +[NSError errorWithDomain:PKSearchErrorDomain code:5 userInfo:0];
      [v7 searchDidCompleteWithError:v8 forIdentifier:v5];

      goto LABEL_6;
    }
    os_unfair_lock_lock(&self->_lock);
    self->_BOOL hasSentResults = 1;
    os_unfair_lock_unlock(&self->_lock);
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002B8090;
  v11[3] = &unk_10072E238;
  v11[4] = self;
  id v12 = v5;
  id v13 = v4;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1002B8160;
  v9[3] = &unk_10073CFE0;
  v9[4] = self;
  id v10 = v12;
  [(PDSearchService *)self dispatchSearchRequestBlock:v11 errorBlock:v9];

LABEL_6:
}

- (void)cancelQueryWithIdentifier:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = self->_currentQueryIdentifier;
  id v6 = (NSString *)v4;
  uint64_t v7 = v6;
  if (v5 == v6)
  {
  }
  else
  {
    if (!v6 || !v5)
    {

LABEL_11:
      queries = self->_queries;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1002B8408;
      v15[3] = &unk_100745CA0;
      uint64_t v11 = v7;
      id v16 = v11;
      id v12 = [(NSMutableArray *)queries indexOfObjectPassingTest:v15];
      if (v12 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        id v13 = 0;
      }
      else
      {
        [(NSMutableArray *)self->_queries removeObjectAtIndex:v12];
        id v13 = +[NSError errorWithDomain:PKSearchErrorDomain code:4 userInfo:0];
      }

      os_unfair_lock_unlock(&self->_lock);
      if (v13)
      {
        v14 = [(PDSearchService *)self remoteObjectProxy];
        [v14 searchDidCompleteWithError:v13 forIdentifier:v11];
      }
      goto LABEL_16;
    }
    unsigned int v8 = [(NSString *)v5 isEqualToString:v6];

    if (!v8) {
      goto LABEL_11;
    }
  }
  v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Search query %@ will be aborted", buf, 0xCu);
  }

  self->_shouldAbortCurrentQuery = 1;
  os_unfair_lock_unlock(&self->_lock);
LABEL_16:
}

- (void)updateRegionWithIdentifier:(id)a3 localizedName:(id)a4 boundingRegion:(id *)a5 mapsIdentifier:(unint64_t)a6 providerIdentifier:(int)a7 completion:(id)a8
{
  id v12 = *(void **)&a7;
  int v13 = a6;
  uint64_t v15 = v11;
  uint64_t v16 = v10;
  uint64_t v17 = v9;
  uint64_t v18 = v8;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1002B8618;
  v25[3] = &unk_100745CC8;
  v26 = self;
  id v27 = a3;
  id v28 = a4;
  uint64_t v30 = v18;
  uint64_t v31 = v17;
  uint64_t v32 = v16;
  uint64_t v33 = v15;
  v34 = a5;
  int v35 = v13;
  id v29 = v12;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1002B869C;
  v23[3] = &unk_1007378B8;
  id v24 = v29;
  id v20 = v29;
  id v21 = v28;
  id v22 = v27;
  [(PDSearchService *)v26 dispatchSearchRequestBlock:v25 errorBlock:v23];
}

- (void)_queue_performCurrentQuery
{
  if (self->_currentQuery)
  {
    int v3 = PKSearchDetailedLoggingEnabledInWallet();
    id v4 = PKLogFacilityTypeGetObject();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        currentQuery = self->_currentQuery;
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = currentQuery;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Search query started: %@", (uint8_t *)&buf, 0xCu);
      }
    }
    else if (v5)
    {
      uint64_t v7 = [(PKSearchQuery *)self->_currentQuery identifier];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v7;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Search query started:  %@", (uint8_t *)&buf, 0xCu);
    }
    kdebug_trace();
    uint64_t v8 = [(PKSearchQuery *)self->_currentQuery identifier];
    PKTimeProfileBegin();

    uint64_t v9 = dispatch_group_create();
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v97 = 0x3032000000;
    v98 = sub_100020ACC;
    v99 = sub_100021058;
    id v100 = 0;
    uint64_t v10 = [(PKSearchQuery *)self->_currentQuery dateToken];
    uint64_t v11 = [v10 startDate];
    currentStartDate = self->_currentStartDate;
    self->_currentStartDate = v11;

    int v13 = [(PKSearchQuery *)self->_currentQuery dateToken];
    v14 = [v13 endDate];
    currentEndDate = self->_currentEndDate;
    self->_currentEndDate = v14;

    uint64_t v16 = [(PKSearchQuery *)self->_currentQuery transactionTypes];
    currentTransactionTypes = self->_currentTransactionTypes;
    self->_currentTransactionTypes = v16;

    uint64_t v18 = [(PKSearchQuery *)self->_currentQuery transactionSources];
    currentTransactionSources = self->_currentTransactionSources;
    self->_currentTransactionSources = v18;

    id v20 = [(PKSearchQuery *)self->_currentQuery transactionStatuses];
    currentTransactionStatuses = self->_currentTransactionStatuses;
    self->_currentTransactionStatuses = v20;

    id v22 = [(PKSearchQuery *)self->_currentQuery locationTokens];
    PKSearchRegionsFromLocationItems();
    v23 = (NSArray *)objc_claimAutoreleasedReturnValue();
    currentRegions = self->_currentRegions;
    self->_currentRegions = v23;

    v74 = [(PKSearchQuery *)self->_currentQuery amountToken];
    objc_super v25 = [v74 amount];
    currentAmount = self->_currentAmount;
    self->_currentAmount = v25;

    self->_currentAmountComparison = (int64_t)[v74 comparison];
    id v27 = [(PKSearchQuery *)self->_currentQuery tags];
    id v28 = +[NSSet setWithArray:v27];
    currentTags = self->_currentTags;
    self->_currentTags = v28;

    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {
      uint64_t v31 = [(PKSearchQuery *)self->_currentQuery passUniqueIdentifier];
    }
    else
    {
      uint64_t v31 = 0;
    }
    p_currentPassUniqueIdentifier = &self->_currentPassUniqueIdentifier;
    objc_storeStrong((id *)&self->_currentPassUniqueIdentifier, v31);
    if (isKindOfClass) {

    }
    currentTransactionSourceIdentifiers = self->_currentTransactionSourceIdentifiers;
    self->_currentTransactionSourceIdentifiers = 0;

    v34 = [(PDDatabaseManager *)self->_databaseManager associatedAccountIdentifierForPassWithUniqueIdentifier:*p_currentPassUniqueIdentifier];
    currentAccountIdentifier = self->_currentAccountIdentifier;
    self->_currentAccountIdentifier = v34;

    v36 = [(PKSearchQuery *)self->_currentQuery accountUserToken];
    v37 = [v36 group];
    v73 = [v37 accountUser];

    v38 = [v73 altDSID];
    if (v38 && self->_currentAccountIdentifier)
    {
      unsigned int v39 = [v73 isCurrentUser];
      databaseManager = self->_databaseManager;
      if (v39)
      {
        v41 = [(PDDatabaseManager *)databaseManager transactionSourceIdentifiersForPassUniqueIdentifier:*p_currentPassUniqueIdentifier];
        v42 = self->_currentTransactionSourceIdentifiers;
        self->_currentTransactionSourceIdentifiers = v41;
      }
      else
      {
        v42 = [(PDDatabaseManager *)databaseManager transactionSourceIdentifierForAccountUserAltDSID:v38 accountIdentifier:self->_currentAccountIdentifier];
        if (v42)
        {
          v43 = (NSSet *)objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", v42, 0);
          v44 = self->_currentTransactionSourceIdentifiers;
          self->_currentTransactionSourceIdentifiers = v43;
        }
      }
    }
    if (!self->_currentTransactionSourceIdentifiers)
    {
      v45 = [(PDDatabaseManager *)self->_databaseManager allAssociatedTransactionSourceIdentifiersForPassUniqueIdentifier:*p_currentPassUniqueIdentifier];
      v46 = self->_currentTransactionSourceIdentifiers;
      self->_currentTransactionSourceIdentifiers = v45;
    }
    if (!self->_peerPaymentUniqueID)
    {
      v47 = [(PDDatabaseManager *)self->_databaseManager dbPeerPaymentAccount];
      v48 = [v47 associatedPassUniqueID];
      peerPaymentUniqueID = self->_peerPaymentUniqueID;
      self->_peerPaymentUniqueID = v48;
    }
    v50 = *p_currentPassUniqueIdentifier;
    if (*p_currentPassUniqueIdentifier)
    {
      v51 = self->_peerPaymentUniqueID;
      v52 = v50;
      if (v51 == v52)
      {
        unsigned __int8 v53 = 1;
      }
      else if (v51)
      {
        unsigned __int8 v53 = [(NSString *)v51 isEqualToString:v52];
      }
      else
      {
        unsigned __int8 v53 = 0;
      }
    }
    else
    {
      unsigned __int8 v53 = 0;
    }
    self->_currentQueryIncludesCash = v53;
    matchedTransactions = self->_matchedTransactions;
    self->_matchedTransactions = 0;

    matchedMerchants = self->_matchedMerchants;
    self->_matchedMerchants = 0;

    matchedCategories = self->_matchedCategories;
    self->_matchedCategories = 0;

    matchedLocations = self->_matchedLocations;
    self->_matchedLocations = 0;

    matchedPeople = self->_matchedPeople;
    self->_matchedPeople = 0;

    matchedTags = self->_matchedTags;
    self->_matchedTags = 0;

    id v60 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
    v61 = v60;
    if (!self->_invertedIndex)
    {
      v95[0] = _NSConcreteStackBlock;
      v95[1] = 3221225472;
      v95[2] = sub_1002B9120;
      v95[3] = &unk_10072E5C0;
      v95[4] = self;
      [v60 addOperation:v95];
    }
    v94[0] = _NSConcreteStackBlock;
    v94[1] = 3221225472;
    v94[2] = sub_1002B92D8;
    v94[3] = &unk_10073AFA8;
    v94[4] = self;
    v62 = objc_retainBlock(v94);
    unsigned __int8 v63 = [(PKSearchQuery *)self->_currentQuery isEmpty];
    dispatch_group_enter(v9);
    if (v63)
    {
      v88[0] = _NSConcreteStackBlock;
      v88[1] = 3221225472;
      v88[2] = sub_1002B986C;
      v88[3] = &unk_100745D18;
      v88[4] = self;
      v64 = v9;
      v89 = v64;
      [(PDSearchService *)self _recentMerchantsWithCompletion:v88];
      if (PKFinHealthTagsSectionEnabled())
      {
        dispatch_group_enter(v64);
        v86[0] = _NSConcreteStackBlock;
        v86[1] = 3221225472;
        v86[2] = sub_1002B9934;
        v86[3] = &unk_100745D18;
        v86[4] = self;
        v87 = v64;
        [(PDSearchService *)self _paymentTransactionTagTypesWithCompletion:v86];
      }
    }
    else
    {
      PKTimeProfileBegin();

      v90[0] = _NSConcreteStackBlock;
      v90[1] = 3221225472;
      v90[2] = sub_1002B9348;
      v90[3] = &unk_100745CF0;
      v92 = v62;
      v90[4] = self;
      v91 = v9;
      p_long long buf = &buf;
      [(PDSearchService *)self _transactionsForCurrentQueryWithFuzzing:0 completion:v90];
    }
    v84[0] = _NSConcreteStackBlock;
    v84[1] = 3221225472;
    v84[2] = sub_1002B9A08;
    v84[3] = &unk_100745D68;
    v65 = v62;
    v84[4] = self;
    id v85 = v65;
    [v61 addOperation:v84];
    v82[0] = _NSConcreteStackBlock;
    v82[1] = 3221225472;
    v82[2] = sub_1002B9C30;
    v82[3] = &unk_100745D68;
    v66 = v65;
    v82[4] = self;
    id v83 = v66;
    [v61 addOperation:v82];
    v80[0] = _NSConcreteStackBlock;
    v80[1] = 3221225472;
    v80[2] = sub_1002B9E70;
    v80[3] = &unk_100745D68;
    v67 = v66;
    v80[4] = self;
    id v81 = v67;
    [v61 addOperation:v80];
    dispatch_group_enter(v9);
    v68 = +[NSNull null];
    v78[0] = _NSConcreteStackBlock;
    v78[1] = 3221225472;
    v78[2] = sub_1002BA0A8;
    v78[3] = &unk_100739590;
    v69 = v9;
    v79 = v69;
    id v70 = [v61 evaluateWithInput:v68 completion:v78];

    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002BA0B0;
    block[3] = &unk_100736D10;
    void block[4] = self;
    id v76 = v67;
    v77 = &buf;
    v72 = v67;
    dispatch_group_notify(v69, workQueue, block);

    _Block_object_dispose(&buf, 8);
  }
}

- (BOOL)_currentQuerySupportsTransactionTypeToken:(int64_t)a3
{
  BOOL v5 = [(PKSearchQuery *)self->_currentQuery transactionTypes];
  id v6 = [v5 count];

  if (v6) {
    return 0;
  }
  uint64_t v8 = [(PDSearchService *)self _transactionRequestForCurrentFilters];
  uint64_t v9 = +[NSNumber numberWithInteger:a3];
  int v13 = v9;
  uint64_t v10 = +[NSArray arrayWithObjects:&v13 count:1];
  [v8 setTransactionTypes:v10];

  [v8 setLimit:1];
  uint64_t v11 = [(PDDatabaseManager *)self->_databaseManager transactionsForRequest:v8];
  BOOL v7 = [v11 count] != 0;

  return v7;
}

- (BOOL)_currentQuerySupportsTransactionSourceToken:(unint64_t)a3
{
  BOOL v5 = [(PKSearchQuery *)self->_currentQuery transactionSources];
  id v6 = [v5 count];

  if (v6) {
    return 0;
  }
  uint64_t v8 = [(PDSearchService *)self _transactionRequestForCurrentFilters];
  uint64_t v9 = +[NSNumber numberWithUnsignedInteger:a3];
  int v13 = v9;
  uint64_t v10 = +[NSArray arrayWithObjects:&v13 count:1];
  [v8 setTransactionSources:v10];

  [v8 setLimit:1];
  uint64_t v11 = [(PDDatabaseManager *)self->_databaseManager transactionsForRequest:v8];
  BOOL v7 = [v11 count] != 0;

  return v7;
}

- (BOOL)_currentQuerySupportsTransactionStatusToken:(int64_t)a3
{
  BOOL v5 = [(PKSearchQuery *)self->_currentQuery transactionStatuses];
  id v6 = [v5 count];

  if (v6) {
    return 0;
  }
  uint64_t v8 = [(PDSearchService *)self _transactionRequestForCurrentFilters];
  uint64_t v9 = +[NSNumber numberWithInteger:a3];
  v14 = v9;
  uint64_t v10 = +[NSArray arrayWithObjects:&v14 count:1];

  if (!a3)
  {
    uint64_t v11 = [v10 arrayByAddingObject:&off_10078B4C0];

    uint64_t v10 = (void *)v11;
  }
  [v8 setTransactionStatuses:v10];
  [v8 setLimit:1];
  id v12 = [(PDDatabaseManager *)self->_databaseManager transactionsForRequest:v8];
  BOOL v7 = [v12 count] != 0;

  return v7;
}

- (BOOL)_currentQuerySupportsPeerPaymentSubTypeToken:(int64_t)a3
{
  uint64_t v5 = [(PKSearchQuery *)self->_currentQuery peerPaymentSubTypeToken];
  if (v5)
  {
    id v6 = (void *)v5;
    BOOL v7 = 0;
  }
  else
  {
    if (!self->_currentQueryIncludesCash) {
      return 0;
    }
    id v6 = [(PDSearchService *)self _transactionRequestForCurrentFilters];
    [v6 setPeerPaymentSubType:a3];
    [v6 setLimit:1];
    uint64_t v8 = [(PDDatabaseManager *)self->_databaseManager transactionsForRequest:v6];
    BOOL v7 = [v8 count] != 0;
  }
  return v7;
}

- (BOOL)_currentQuerySupportsRewardsToken:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKSearchQuery *)self->_currentQuery rewardsToken];
  if (v5)
  {
    id v6 = (void *)v5;
    BOOL v7 = 0;
  }
  else
  {
    if (self->_currentQueryIncludesCash)
    {
      BOOL v7 = 0;
      goto LABEL_6;
    }
    id v6 = [(PDSearchService *)self _transactionRequestForCurrentFilters];
    objc_msgSend(v6, "setRewardsValueUnit:", objc_msgSend(v4, "rewardsValueUnit"));
    uint64_t v9 = [v4 rewardsValue];
    [v6 setRewardsValue:v9];

    [v6 setLimit:1];
    uint64_t v10 = [(PDDatabaseManager *)self->_databaseManager transactionsForRequest:v6];
    BOOL v7 = [v10 count] != 0;
  }
LABEL_6:

  return v7;
}

- (BOOL)_currentQuerySupportsTagToken:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PDSearchService *)self _transactionRequestForCurrentFilters];
  id v6 = objc_alloc((Class)NSSet);
  BOOL v7 = [v4 tag];

  id v8 = objc_msgSend(v6, "initWithObjects:", v7, 0);
  [v5 setTags:v8];

  [v5 setLimit:1];
  uint64_t v9 = [(PDDatabaseManager *)self->_databaseManager transactionsForRequest:v5];
  LOBYTE(v8) = [v9 count] != 0;

  return (char)v8;
}

- (BOOL)_currentQuerySupportsDateTokenWithStartDate:(id)a3 endDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PDSearchService *)self _transactionRequestForCurrentFilters];
  [v8 setStartDate:v7];

  [v8 setEndDate:v6];
  [v8 setLimit:1];
  uint64_t v9 = [(PDDatabaseManager *)self->_databaseManager transactionsForRequest:v8];
  LOBYTE(self) = [v9 count] != 0;

  return (char)self;
}

- (BOOL)_currentQuerySupportsCategory:(int64_t)a3
{
  uint64_t v5 = [(PKSearchQuery *)self->_currentQuery categoryToken];
  if (v5
    || ([(PKSearchQuery *)self->_currentQuery merchantToken],
        (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v6 = (void *)v5;
    BOOL v7 = 0;
  }
  else
  {
    uint64_t v9 = [(PKSearchQuery *)self->_currentQuery transactionTypes];
    id v10 = [v9 count];

    if (v10) {
      return 0;
    }
    id v6 = [(PDSearchService *)self _transactionRequestForCurrentFilters];
    [v6 setMerchantCategory:a3];
    [v6 setLimit:1];
    uint64_t v11 = [(PDDatabaseManager *)self->_databaseManager transactionsForRequest:v6];
    BOOL v7 = [v11 count] != 0;
  }
  return v7;
}

- (id)_transactionRequestForCurrentFilters
{
  id v3 = objc_alloc_init((Class)PKPaymentTransactionRequest);
  [v3 setTransactionSourceIdentifiers:self->_currentTransactionSourceIdentifiers];
  [v3 setTransactionTypes:self->_currentTransactionTypes];
  [v3 setTransactionSources:self->_currentTransactionSources];
  [v3 setTransactionStatuses:self->_currentTransactionStatuses];
  [v3 setRegions:self->_currentRegions];
  id v4 = [(PKSearchQuery *)self->_currentQuery merchantToken];
  uint64_t v5 = [v4 group];
  id v6 = [v5 merchant];
  [v3 setMerchant:v6];

  BOOL v7 = [(PKSearchQuery *)self->_currentQuery categoryToken];
  id v8 = [v7 group];
  objc_msgSend(v3, "setMerchantCategory:", objc_msgSend(v8, "merchantCategory"));

  [v3 setStartDate:self->_currentStartDate];
  [v3 setEndDate:self->_currentEndDate];
  [v3 setDateOrder:1];
  [v3 setAmount:self->_currentAmount];
  [v3 setAmountComparison:self->_currentAmountComparison];
  uint64_t v9 = [(PKSearchQuery *)self->_currentQuery rewardsToken];
  id v10 = [v9 rewardsValue];
  [v3 setRewardsValue:v10];

  uint64_t v11 = [(PKSearchQuery *)self->_currentQuery rewardsToken];
  objc_msgSend(v3, "setRewardsValueUnit:", objc_msgSend(v11, "rewardsValueUnit"));

  id v12 = [(PKSearchQuery *)self->_currentQuery peerPaymentSubTypeToken];
  objc_msgSend(v3, "setPeerPaymentSubType:", objc_msgSend(v12, "subType"));

  [v3 setTags:self->_currentTags];
  [v3 setCurrencyCode:@"USD"];
  return v3;
}

- (void)_buildInvertedIndexWithCompletion:(id)a3
{
  v121 = (void (**)(void))a3;
  id v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  invertedIndex = self->_invertedIndex;
  self->_invertedIndex = v4;

  for (uint64_t i = 0; i != 8; ++i)
  {
    if (i)
    {
      BOOL v7 = PKLocalizedStringFromMerchantCategory();
      if (v7)
      {
        id v8 = objc_alloc_init(PDSearchServiceInvertedIndexEntry);
        [(PDSearchServiceInvertedIndexEntry *)v8 setType:0];
        [(PDSearchServiceInvertedIndexEntry *)v8 setCategory:i];
        [(PDSearchService *)self _addWord:v7 forEntry:v8];
      }
    }
  }
  uint64_t v9 = objc_alloc_init(PDSearchServiceInvertedIndexEntry);
  [(PDSearchServiceInvertedIndexEntry *)v9 setType:1];
  [(PDSearchServiceInvertedIndexEntry *)v9 setTransactionType:10];
  id v10 = PKLocalizedPaymentString(@"TRANSACTION_TYPE_PAYMENT");
  [(PDSearchService *)self _addWord:v10 forEntry:v9];

  uint64_t v11 = objc_alloc_init(PDSearchServiceInvertedIndexEntry);
  [(PDSearchServiceInvertedIndexEntry *)v11 setType:1];
  [(PDSearchServiceInvertedIndexEntry *)v11 setTransactionType:11];
  id v12 = PKLocalizedPaymentString(@"TRANSACTION_TYPE_INTEREST_CHARGE");
  [(PDSearchService *)self _addWord:v12 forEntry:v11];

  int v13 = objc_alloc_init(PDSearchServiceInvertedIndexEntry);
  [(PDSearchServiceInvertedIndexEntry *)v13 setType:1];
  [(PDSearchServiceInvertedIndexEntry *)v13 setTransactionType:1];
  v14 = PKLocalizedPaymentString(@"PAYMENT_TRANSACTION_REFUND");
  [(PDSearchService *)self _addWord:v14 forEntry:v13];

  uint64_t v15 = objc_alloc_init(PDSearchServiceInvertedIndexEntry);
  [(PDSearchServiceInvertedIndexEntry *)v15 setType:1];
  [(PDSearchServiceInvertedIndexEntry *)v15 setTransactionType:0];
  uint64_t v16 = PKLocalizedPaymentString(@"PAYMENT_TRANSACTION_PURCHASE");
  [(PDSearchService *)self _addWord:v16 forEntry:v15];

  uint64_t v17 = objc_alloc_init(PDSearchServiceInvertedIndexEntry);
  [(PDSearchServiceInvertedIndexEntry *)v17 setType:1];
  [(PDSearchServiceInvertedIndexEntry *)v17 setTransactionType:5];
  uint64_t v18 = PKLocalizedPaymentString(@"TRANSACTION_TYPE_WITHDRAWAL_GENERIC");
  [(PDSearchService *)self _addWord:v18 forEntry:v17];

  v19 = objc_alloc_init(PDSearchServiceInvertedIndexEntry);
  [(PDSearchServiceInvertedIndexEntry *)v19 setType:1];
  [(PDSearchServiceInvertedIndexEntry *)v19 setTransactionType:6];
  id v20 = PKLocalizedPaymentString(@"TRANSACTION_TYPE_TOP_UP");
  [(PDSearchService *)self _addWord:v20 forEntry:v19];

  id v21 = objc_alloc_init(PDSearchServiceInvertedIndexEntry);
  [(PDSearchServiceInvertedIndexEntry *)v21 setType:1];
  [(PDSearchServiceInvertedIndexEntry *)v21 setTransactionType:7];
  id v22 = PKLocalizedPaymentString(@"TRANSACTION_TYPE_ADJUSTMENT");
  [(PDSearchService *)self _addWord:v22 forEntry:v21];

  v23 = objc_alloc_init(PDSearchServiceInvertedIndexEntry);
  [(PDSearchServiceInvertedIndexEntry *)v23 setType:1];
  [(PDSearchServiceInvertedIndexEntry *)v23 setTransactionType:13];
  id v24 = PKLocalizedBeekmanString(@"APPLE_CARD_INSTALLMENTS_SEARCH");
  [(PDSearchService *)self _addWord:v24 forEntry:v23];

  objc_super v25 = objc_alloc_init(PDSearchServiceInvertedIndexEntry);
  [(PDSearchServiceInvertedIndexEntry *)v25 setType:3];
  [(PDSearchServiceInvertedIndexEntry *)v25 setTransactionSource:6];
  v26 = PKLocalizedFeatureString();
  [(PDSearchService *)self _addWord:v26 forEntry:v25];

  id v27 = objc_alloc_init(PDSearchServiceInvertedIndexEntry);
  [(PDSearchServiceInvertedIndexEntry *)v27 setType:3];
  [(PDSearchServiceInvertedIndexEntry *)v27 setTransactionSource:5];
  id v28 = PKLocalizedFeatureString();
  [(PDSearchService *)self _addWord:v28 forEntry:v27];

  id v29 = objc_alloc_init(PDSearchServiceInvertedIndexEntry);
  [(PDSearchServiceInvertedIndexEntry *)v29 setType:2];
  [(PDSearchServiceInvertedIndexEntry *)v29 setTransactionStatus:0];
  uint64_t v30 = PKLocalizedPaymentString(@"PAYMENT_TRANSACTION_PENDING");
  [(PDSearchService *)self _addWord:v30 forEntry:v29];

  uint64_t v31 = objc_alloc_init(PDSearchServiceInvertedIndexEntry);
  [(PDSearchServiceInvertedIndexEntry *)v31 setType:2];
  [(PDSearchServiceInvertedIndexEntry *)v31 setTransactionStatus:2];
  uint64_t v32 = PKLocalizedPaymentString(@"PAYMENT_TRANSACTION_DECLINED");
  [(PDSearchService *)self _addWord:v32 forEntry:v31];

  uint64_t v33 = objc_alloc_init(PDSearchServiceInvertedIndexEntry);
  [(PDSearchServiceInvertedIndexEntry *)v33 setType:2];
  [(PDSearchServiceInvertedIndexEntry *)v33 setTransactionStatus:5];
  v34 = PKLocalizedPaymentString(@"PAYMENT_TRANSACTION_CANCELED");
  [(PDSearchService *)self _addWord:v34 forEntry:v33];

  int v35 = objc_alloc_init(PDSearchServiceInvertedIndexEntry);
  [(PDSearchServiceInvertedIndexEntry *)v35 setType:2];
  [(PDSearchServiceInvertedIndexEntry *)v35 setTransactionStatus:6];
  v36 = PKLocalizedPaymentString(@"PAYMENT_TRANSACTION_REJECTED");
  [(PDSearchService *)self _addWord:v36 forEntry:v35];

  v37 = objc_alloc_init(PDSearchServiceInvertedIndexEntry);
  [(PDSearchServiceInvertedIndexEntry *)v37 setType:2];
  [(PDSearchServiceInvertedIndexEntry *)v37 setTransactionStatus:7];
  v38 = PKLocalizedPaymentString(@"PAYMENT_TRANSACTION_EXPIRED");
  [(PDSearchService *)self _addWord:v38 forEntry:v37];

  unsigned int v39 = objc_alloc_init(PDSearchServiceInvertedIndexEntry);
  [(PDSearchServiceInvertedIndexEntry *)v39 setType:7];
  [(PDSearchServiceInvertedIndexEntry *)v39 setPeerPaymentSubType:1];
  v40 = PKLocalizedPeerPaymentString(@"TRANSACTION_DETAILS_AMOUNT_LINE_ITEM_TOTAL_SENT");
  [(PDSearchService *)self _addWord:v40 forEntry:v39];

  v41 = objc_alloc_init(PDSearchServiceInvertedIndexEntry);
  [(PDSearchServiceInvertedIndexEntry *)v41 setType:7];
  [(PDSearchServiceInvertedIndexEntry *)v41 setPeerPaymentSubType:2];
  v42 = PKLocalizedPeerPaymentString(@"TRANSACTION_DETAILS_AMOUNT_LINE_ITEM_TOTAL_RECEIVED");
  [(PDSearchService *)self _addWord:v42 forEntry:v41];

  v43 = +[NSDate date];
  v44 = [(PDDatabaseManager *)self->_databaseManager transactionsForTransactionSourceIdentifiers:self->_currentTransactionSourceIdentifiers withTransactionSource:0 withBackingData:0 startDate:0 endDate:0 orderedByDate:-1 limit:1];
  v45 = [v44 anyObject];
  id v46 = [v45 transactionDate];

  if (!v46) {
    id v46 = v43;
  }
  id v125 = objc_alloc_init((Class)NSDateFormatter);
  [v125 setLocalizedDateFormatFromTemplate:@"yyyy"];
  v47 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  years = self->_years;
  self->_years = v47;

  v49 = PKStartOfYear();
  if ([v49 compare:v43] == (id)-1)
  {
    do
    {
      [(NSMutableArray *)self->_years addObject:v49];
      v50 = PKStartOfNextYear();

      v49 = v50;
    }
    while ([v50 compare:v43] == (id)-1);
  }
  else
  {
    v50 = v49;
  }
  v122 = v46;
  v127 = self;
  v123 = v43;
  v120 = v50;
  if ([(NSMutableArray *)self->_years count])
  {
    v51 = (char *)[(NSMutableArray *)self->_years count] - 1;
    if ((uint64_t)v51 >= 0)
    {
      uint64_t v52 = 0;
      while (1)
      {
        unsigned __int8 v53 = v41;
        v54 = [(NSMutableArray *)v127->_years objectAtIndex:v51];
        v41 = objc_alloc_init(PDSearchServiceInvertedIndexEntry);

        [(PDSearchServiceInvertedIndexEntry *)v41 setType:6];
        [(PDSearchServiceInvertedIndexEntry *)v41 setDate:v54];
        v55 = [v125 stringFromDate:v54];
        [(PDSearchService *)v127 _addWord:v55 forEntry:v41];

        if (!v52) {
          break;
        }
        if (v52 == 1)
        {
          v56 = @"SEARCH_LAST_YEAR";
LABEL_19:
          v57 = PKLocalizedString(&v56->isa);
          [(PDSearchService *)v127 _addWord:v57 forEntry:v41];
        }
        ++v52;

        if (--v51 == (char *)-1) {
          goto LABEL_21;
        }
      }
      v56 = @"SEARCH_THIS_YEAR";
      goto LABEL_19;
    }
  }
LABEL_21:
  id v124 = objc_alloc_init((Class)NSDateFormatter);
  [v124 setLocalizedDateFormatFromTemplate:@"LLLL yyyy"];
  v58 = PKStartOfMonth();
  v59 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  months = v127->_months;
  v127->_months = v59;

  if ([v58 compare:v123] == (id)-1)
  {
    do
    {
      [(NSMutableArray *)v127->_months addObject:v58];
      v61 = PKStartOfNextMonth();

      v58 = v61;
    }
    while ([v61 compare:v123] == (id)-1);
  }
  else
  {
    v61 = v58;
  }
  v119 = v61;
  if ([(NSMutableArray *)v127->_months count])
  {
    v62 = (char *)[(NSMutableArray *)v127->_months count] - 1;
    if ((uint64_t)v62 >= 0)
    {
      uint64_t v63 = 0;
      while (1)
      {
        v64 = v41;
        v65 = [(NSMutableArray *)v127->_months objectAtIndex:v62];
        v41 = objc_alloc_init(PDSearchServiceInvertedIndexEntry);

        [(PDSearchServiceInvertedIndexEntry *)v41 setType:5];
        [(PDSearchServiceInvertedIndexEntry *)v41 setDate:v65];
        v66 = [v124 stringFromDate:v65];
        [(PDSearchService *)v127 _addWord:v66 forEntry:v41];

        if (!v63) {
          break;
        }
        if (v63 == 1)
        {
          v67 = @"SEARCH_LAST_MONTH";
LABEL_31:
          v68 = PKLocalizedString(&v67->isa);
          [(PDSearchService *)v127 _addWord:v68 forEntry:v41];
        }
        ++v63;

        if (--v62 == (char *)-1) {
          goto LABEL_33;
        }
      }
      v67 = @"SEARCH_THIS_MONTH";
      goto LABEL_31;
    }
  }
LABEL_33:
  uint64_t v69 = PKStartOfDay();
  id v70 = +[NSCalendar currentCalendar];
  v118 = (void *)v69;
  v71 = objc_msgSend(v70, "nextDateAfterDate:matchingUnit:value:options:", v69, 512, objc_msgSend(v70, "component:fromDate:", 512, v69), 516);
  v72 = [v70 dateByAddingUnit:16 value:1 toDate:v71 options:0];

  v73 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  weekdays = v127->_weekdays;
  v127->_weekdays = v73;

  if ([v72 compare:v123] == (id)-1)
  {
    do
    {
      [(NSMutableArray *)v127->_weekdays addObject:v72];
      v75 = [v70 dateByAddingUnit:16 value:1 toDate:v72 options:0];

      v72 = v75;
    }
    while ([v75 compare:v123] == (id)-1);
  }
  else
  {
    v75 = v72;
  }
  v116 = v75;
  v117 = v70;
  id v76 = (char *)[(NSMutableArray *)v127->_weekdays count] - 1;
  if ((uint64_t)v76 >= 0)
  {
    uint64_t v77 = 0;
    while (1)
    {
      v78 = v41;
      v79 = [(NSMutableArray *)v127->_weekdays objectAtIndex:v76];
      v41 = objc_alloc_init(PDSearchServiceInvertedIndexEntry);

      [(PDSearchServiceInvertedIndexEntry *)v41 setType:4];
      [(PDSearchServiceInvertedIndexEntry *)v41 setDate:v79];
      if (!v77) {
        break;
      }
      if (v77 == 1)
      {
        v80 = @"SEARCH_YESTERDAY";
LABEL_42:
        id v81 = PKLocalizedString(&v80->isa);
        [(PDSearchService *)v127 _addWord:v81 forEntry:v41];
      }
      v82 = PKFullWeekdayStringFromDate();
      [(PDSearchService *)v127 _addWord:v82 forEntry:v41];

      ++v77;
      if (--v76 == (char *)-1) {
        goto LABEL_44;
      }
    }
    v80 = @"SEARCH_TODAY";
    goto LABEL_42;
  }
LABEL_44:
  id v83 = [(PDDatabaseManager *)v127->_databaseManager rewardsValuesForUnit:1];
  v84 = [v83 allObjects];
  id v85 = [v84 sortedArrayUsingComparator:&stru_100745D88];

  long long v138 = 0u;
  long long v139 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  id obj = v85;
  id v86 = [obj countByEnumeratingWithState:&v136 objects:v142 count:16];
  if (v86)
  {
    id v87 = v86;
    uint64_t v88 = *(void *)v137;
    do
    {
      v89 = 0;
      v90 = v41;
      do
      {
        if (*(void *)v137 != v88) {
          objc_enumerationMutation(obj);
        }
        uint64_t v91 = *(void *)(*((void *)&v136 + 1) + 8 * (void)v89);
        v41 = objc_alloc_init(PDSearchServiceInvertedIndexEntry);

        [(PDSearchServiceInvertedIndexEntry *)v41 setType:8];
        [(PDSearchServiceInvertedIndexEntry *)v41 setRewardsValue:v91];
        [(PDSearchServiceInvertedIndexEntry *)v41 setRewardsValueUnit:1];
        v115 = PKFormattedStringMinimalFractionDigitsFromNumber();
        v92 = PKLocalizedFeatureString();

        v93 = objc_msgSend(v92, "stringByReplacingOccurrencesOfString:withString:", @" ", @" ", v115);

        [(PDSearchService *)v127 _addWord:v93 forEntry:v41];
        v94 = PKLocalizedFeatureString();
        v95 = [v94 stringByReplacingOccurrencesOfString:@" " withString:@" "];
        [(PDSearchService *)v127 _addWord:v95 forEntry:v41];

        v89 = (char *)v89 + 1;
        v90 = v41;
      }
      while (v87 != v89);
      id v87 = [obj countByEnumeratingWithState:&v136 objects:v142 count:16];
    }
    while (v87);
  }

  v96 = [(PDDatabaseManager *)v127->_databaseManager allTagsWithTitles];
  long long v132 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  id v97 = [v96 countByEnumeratingWithState:&v132 objects:v141 count:16];
  if (v97)
  {
    id v98 = v97;
    uint64_t v99 = *(void *)v133;
    do
    {
      for (j = 0; j != v98; j = (char *)j + 1)
      {
        if (*(void *)v133 != v99) {
          objc_enumerationMutation(v96);
        }
        v101 = *(void **)(*((void *)&v132 + 1) + 8 * (void)j);
        v102 = [v101 localizedTitle];
        id v103 = [v102 length];

        if (v103)
        {
          v104 = objc_alloc_init(PDSearchServiceInvertedIndexEntry);

          [(PDSearchServiceInvertedIndexEntry *)v104 setType:9];
          [(PDSearchServiceInvertedIndexEntry *)v104 setTag:v101];
          v105 = [v101 localizedTitle];
          [(PDSearchService *)v127 _addWord:v105 forEntry:v104];

          v41 = v104;
        }
      }
      id v98 = [v96 countByEnumeratingWithState:&v132 objects:v141 count:16];
    }
    while (v98);
  }
  long long v130 = 0u;
  long long v131 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  id v106 = [&off_10078C3A8 countByEnumeratingWithState:&v128 objects:v140 count:16];
  if (v106)
  {
    id v107 = v106;
    uint64_t v108 = *(void *)v129;
    do
    {
      for (k = 0; k != v107; k = (char *)k + 1)
      {
        if (*(void *)v129 != v108) {
          objc_enumerationMutation(&off_10078C3A8);
        }
        id v110 = [*(id *)(*((void *)&v128 + 1) + 8 * (void)k) unsignedIntegerValue];
        v111 = PKPaymentTransactionTagTypeToLocalizedString();
        v112 = v111;
        if (v110 && [v111 length])
        {
          id v113 = objc_alloc_init((Class)PKPaymentTransactionTag);
          [v113 setType:v110];
          v114 = objc_alloc_init(PDSearchServiceInvertedIndexEntry);

          [(PDSearchServiceInvertedIndexEntry *)v114 setType:9];
          [(PDSearchServiceInvertedIndexEntry *)v114 setTag:v113];
          [(PDSearchService *)v127 _addWord:v112 forEntry:v114];

          v41 = v114;
        }
      }
      id v107 = [&off_10078C3A8 countByEnumeratingWithState:&v128 objects:v140 count:16];
    }
    while (v107);
  }
  v121[2](v121);
}

- (void)_addWord:(id)a3 forEntry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(PDSearchService *)self _indexString:v6 forEntry:v7];
  id v8 = +[NSCharacterSet whitespaceCharacterSet];
  uint64_t v9 = [v6 componentsSeparatedByCharactersInSet:v8];

  if ((unint64_t)[v9 count] >= 2)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v10 = v9;
    id v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if ((unint64_t)objc_msgSend(v15, "length", (void)v16) >= 4) {
            [(PDSearchService *)self _indexString:v15 forEntry:v7];
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }
  }
}

- (void)_indexString:(id)a3 forEntry:(id)a4
{
  id v6 = a4;
  id v10 = [a3 lowercaseString];
  if ([v10 length])
  {
    unint64_t v7 = 1;
    do
    {
      id v8 = [v10 substringToIndex:v7];
      id v9 = [(NSMutableDictionary *)self->_invertedIndex objectForKey:v8];
      if (!v9)
      {
        id v9 = objc_alloc_init((Class)NSMutableArray);
        [(NSMutableDictionary *)self->_invertedIndex setObject:v9 forKey:v8];
      }
      [v9 addObject:v6];

      ++v7;
    }
    while (v7 <= (unint64_t)[v10 length]);
  }
}

- (void)_categoriesForCurrentQueryWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  if (v4)
  {
    id v5 = [(PKSearchQuery *)self->_currentQuery type];
    if ([(PKSearchQuery *)self->_currentQuery type]) {
      BOOL v6 = v5 == (id)3;
    }
    else {
      BOOL v6 = 1;
    }
    if (!v6) {
      goto LABEL_10;
    }
    unint64_t v7 = [(PKSearchQuery *)self->_currentQuery categoryToken];
    if (v7
      || ([(PKSearchQuery *)self->_currentQuery merchantToken],
          (unint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0))
    {

LABEL_10:
      v4[2](v4, &__NSArray0__struct, 0);
      goto LABEL_11;
    }
    id v8 = [(PKSearchQuery *)self->_currentQuery peerPaymentToken];

    if (v8) {
      goto LABEL_10;
    }
    id v9 = objc_alloc_init((Class)NSMutableArray);
    id v10 = [(PKSearchQuery *)self->_currentQuery text];
    id v11 = (char *)[v10 length];
    unsigned int v12 = [(PKSearchQuery *)self->_currentQuery isEmpty];
    id v13 = objc_alloc_init((Class)NSMutableSet);
    if (v11)
    {
      unsigned int v29 = v12;
      id v30 = v9;
      uint64_t v31 = v10;
      invertedIndex = self->_invertedIndex;
      uint64_t v15 = [v10 lowercaseString];
      long long v16 = [(NSMutableDictionary *)invertedIndex objectForKey:v15];

      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v17 = v16;
      id v18 = [v17 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v19; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v36 != v20) {
              objc_enumerationMutation(v17);
            }
            id v22 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            if (![v22 type])
            {
              v23 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v22 category]);
              [v13 addObject:v23];
            }
          }
          id v19 = [v17 countByEnumeratingWithState:&v35 objects:v39 count:16];
        }
        while (v19);
      }

      id v10 = v31;
      id v9 = v30;
      unsigned int v12 = v29;
    }
    else
    {
      do
      {
        if (v11)
        {
          id v24 = +[NSNumber numberWithInteger:v11];
          [v13 addObject:v24];
        }
        ++v11;
      }
      while (v11 != (char *)8);
    }
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1002BC674;
    v32[3] = &unk_100745DB0;
    v32[4] = self;
    char v34 = v12;
    id v25 = v9;
    id v33 = v25;
    [v13 enumerateObjectsUsingBlock:v32];
    [v25 sortUsingComparator:&stru_100746068];
    if (v12) {
      unint64_t v26 = 12;
    }
    else {
      unint64_t v26 = 3;
    }
    if (v5 == (id)3 || (unint64_t)[v25 count] <= v26)
    {
      id v27 = [v25 copy];
    }
    else
    {
      objc_msgSend(v25, "subarrayWithRange:", 0, v26);
      id v27 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v28 = v27;
    v4[2](v4, v27, 0);
  }
LABEL_11:
}

- (void)_transactionsForCurrentQueryWithFuzzing:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  unint64_t v7 = v6;
  if (v6)
  {
    v50 = (void (**)(void, void, void))v6;
    id v8 = [(PKSearchQuery *)self->_currentQuery type];
    BOOL v9 = v8 == (id)5;
    if (([(PKSearchQuery *)self->_currentQuery isEmpty] & 1) == 0
      && ([(PKSearchQuery *)self->_currentQuery type] ? (BOOL v10 = v8 == (id)5) : (BOOL v10 = 1), v10))
    {
      v48 = [(PKSearchQuery *)self->_currentQuery text];
      id v51 = objc_alloc_init((Class)NSMutableArray);
      if ([v48 length]
        || ([(PKSearchQuery *)self->_currentQuery peerPaymentToken],
            id v11 = objc_claimAutoreleasedReturnValue(),
            v11,
            v11))
      {
        unsigned int v12 = [(PDSearchService *)self _spotlightFilterQueriesForCurrentQuery];
        id v46 = [v12 mutableCopy];

        id v13 = [(PKSearchQuery *)self->_currentQuery transactionTypes];
        unsigned __int8 v45 = [v13 containsObject:&off_10078B5B0];

        v47 = sub_1002BCED4(v48);
        id v14 = objc_alloc_init((Class)NSMutableArray);
        uint64_t v15 = @"cdw";
        if (v4) {
          uint64_t v15 = @"cdwf070";
        }
        long long v16 = v15;
        id v17 = [(PKSearchQuery *)self->_currentQuery merchantToken];

        if (!v17)
        {
          id v18 = +[NSString stringWithFormat:@"(displayName == '%@*'%@)", v47, v16];
          [v14 addObject:v18];
        }
        id v19 = +[NSString stringWithFormat:@"(contentDescription == '%@*'%@)", v47, v16];
        [v14 addObject:v19];

        uint64_t v20 = +[NSString stringWithFormat:@"(keywords == '%@'%@)", v47, v16];
        [v14 addObject:v20];

        id v21 = [(PKSearchQuery *)self->_currentQuery peerPaymentToken];

        if (!v21)
        {
          id v22 = +[NSString stringWithFormat:@"(%@ == '%@'%@)", PKCoreSpotlightCustomKeyTransactionHandle, v47, v16];
          [v14 addObject:v22];
        }
        BOOL v23 = v8 == (id)5;
        id v24 = [v14 componentsJoinedByString:@" || "];
        id v25 = [v24 stringByAppendingString:@""]);

        unint64_t v26 = objc_msgSend(@"("), "stringByAppendingString:", v25;

        [v46 addObject:v26];
        if (v23 || v4)
        {
          id v27 = objc_alloc((Class)CSSearchQuery);
          id v28 = [v46 componentsJoinedByString:@" && "];
          id val = [v27 initWithQueryString:v28 attributes:0];
        }
        else
        {
          id v29 = objc_alloc((Class)CSTopHitSearchQuery);
          id v30 = [(PKSearchQuery *)self->_currentQuery keyboardLanguage];
          id v31 = [v29 initWithSearchString:v48 keyboardLanguage:v30 attributes:0 hitCount:3];

          id val = v31;
          [v31 setFilterQueries:v46];
        }
        uint64_t v69 = PKServiceBundleIdentifier;
        uint64_t v32 = +[NSArray arrayWithObjects:&v69 count:1];
        [val setBundleIDs:v32];

        NSFileProtectionType v68 = NSFileProtectionCompleteUntilFirstUserAuthentication;
        id v33 = +[NSArray arrayWithObjects:&v68 count:1];
        [val setProtectionClasses:v33];

        objc_initWeak(&location, val);
        v61[0] = _NSConcreteStackBlock;
        v61[1] = 3221225472;
        v61[2] = sub_1002BD01C;
        v61[3] = &unk_100745DD8;
        v61[4] = self;
        unsigned __int8 v64 = v45;
        id v34 = v51;
        id v62 = v34;
        BOOL v65 = v9;
        objc_copyWeak(&v63, &location);
        [val setFoundItemsHandler:v61];
        v56[0] = _NSConcreteStackBlock;
        v56[1] = 3221225472;
        v56[2] = sub_1002BD2DC;
        v56[3] = &unk_100745E00;
        v56[4] = self;
        id v35 = v46;
        id v57 = v35;
        BOOL v60 = v4;
        id v58 = v34;
        v59 = v50;
        [val setCompletionHandler:v56];
        [val start];

        objc_destroyWeak(&v63);
        objc_destroyWeak(&location);
      }
      else
      {
        id val = [(PDSearchService *)self _transactionRequestForCurrentFilters];
        if (v8 == (id)5) {
          uint64_t v36 = 0;
        }
        else {
          uint64_t v36 = 3;
        }
        [val setLimit:v36];
        [val setDateOrder:1];
        id v35 = [(PDDatabaseManager *)self->_databaseManager transactionsForRequest:val];
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        id v37 = [v35 countByEnumeratingWithState:&v52 objects:v67 count:16];
        if (v37)
        {
          uint64_t v38 = *(void *)v53;
          do
          {
            for (uint64_t i = 0; i != v37; uint64_t i = (char *)i + 1)
            {
              if (*(void *)v53 != v38) {
                objc_enumerationMutation(v35);
              }
              v40 = *(void **)(*((void *)&v52 + 1) + 8 * i);
              id v41 = objc_alloc_init((Class)PKSearchTransactionResult);
              [v41 setTransaction:v40];
              databaseManager = self->_databaseManager;
              v43 = [v40 identifier];
              v44 = [(PDDatabaseManager *)databaseManager passUniqueIdentifierForTransactionWithIdentifier:v43];
              [v41 setPassUniqueIdentifier:v44];

              [v51 addObject:v41];
            }
            id v37 = [v35 countByEnumeratingWithState:&v52 objects:v67 count:16];
          }
          while (v37);
        }
        ((void (**)(void, id, void))v50)[2](v50, v51, 0);
      }

      unint64_t v7 = v50;
    }
    else
    {
      unint64_t v7 = v50;
      ((void (**)(void, void *, void))v50)[2](v50, &__NSArray0__struct, 0);
    }
  }
}

- (void)_uniqueMerchantsForCurrenQueryWithMerchants:(id)a3 allUniqueMerchants:(id)a4 attemptCount:(unint64_t)a5 fuzzyMatching:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v54 = a3;
  id v53 = a4;
  id v11 = a7;
  unsigned int v12 = v11;
  if (v11)
  {
    BOOL v49 = v8;
    long long v52 = (void (**)(void, void, void))v11;
    id v13 = [(PKSearchQuery *)self->_currentQuery type];
    id v51 = self;
    id v14 = [(PKSearchQuery *)self->_currentQuery merchantToken];
    if (v14
      || ([(PKSearchQuery *)self->_currentQuery peerPaymentToken],
          (id v14 = objc_claimAutoreleasedReturnValue()) != 0))
    {

LABEL_5:
      unsigned int v12 = v52;
      ((void (**)(void, void *, void))v52)[2](v52, &__NSArray0__struct, 0);
      goto LABEL_6;
    }
    if ([(PKSearchQuery *)self->_currentQuery type]) {
      BOOL v15 = v13 == (id)4;
    }
    else {
      BOOL v15 = 1;
    }
    if (!v15) {
      goto LABEL_5;
    }
    if ((unint64_t)[v54 count] < 3 || -[PKSearchQuery type](self->_currentQuery, "type") == (id)4)
    {
      long long v16 = [(PDSearchService *)self _spotlightFilterQueriesForCurrentQuery];
      id v17 = [v16 mutableCopy];

      v48 = [(PKSearchQuery *)self->_currentQuery text];
      if ([v48 length])
      {
        uint64_t v18 = sub_1002BCED4(v48);
        id v19 = (void *)v18;
        if (v8) {
          CFStringRef v20 = @"displayName == '*%@*'cdwf070";
        }
        else {
          CFStringRef v20 = @"displayName == '%@*'cdw";
        }
        id v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v20, v18);
        [v17 addObject:v21];
      }
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      id obj = v53;
      id v22 = [obj countByEnumeratingWithState:&v75 objects:v81 count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v76;
        uint64_t v24 = PKCoreSpotlightCustomKeyTransactionBrandmuid;
        uint64_t v55 = PKCoreSpotlightCustomKeyTransactionPOImuid;
        do
        {
          for (uint64_t i = 0; i != v22; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v76 != v23) {
              objc_enumerationMutation(obj);
            }
            unint64_t v26 = *(void **)(*((void *)&v75 + 1) + 8 * i);
            id v27 = [v26 mapsBrand];
            id v28 = [v26 mapsMerchant];
            id v29 = v28;
            if (v27)
            {
              id v30 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v27 identifier]);
              id v31 = [v30 stringValue];
              uint64_t v32 = +[NSString stringWithFormat:@"%@ != '%@'", v24, v31];
            }
            else
            {
              if (v28)
              {
                id v30 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v28 identifier]);
                id v31 = [v30 stringValue];
                +[NSString stringWithFormat:@"%@ != '%@'", v55, v31];
              }
              else
              {
                id v30 = [v26 displayName];
                id v31 = sub_1002BCED4(v30);
                +[NSString stringWithFormat:@"displayName != '%@'", v31];
              uint64_t v32 = };
            }
            id v33 = (void *)v32;
            [v17 addObject:v32];
          }
          id v22 = [obj countByEnumeratingWithState:&v75 objects:v81 count:16];
        }
        while (v22);
      }

      id v34 = +[NSString stringWithFormat:@"%@ == %ld", PKCoreSpotlightCustomKeyTransactionType, 0];
      [v17 addObject:v34];

      id v35 = [v54 mutableCopy];
      id v36 = [obj mutableCopy];
      id v37 = objc_alloc((Class)CSSearchQuery);
      uint64_t v38 = [v17 componentsJoinedByString:@" && "];
      id v39 = [v37 initWithQueryString:v38 attributes:0];

      uint64_t v80 = PKServiceBundleIdentifier;
      v40 = +[NSArray arrayWithObjects:&v80 count:1];
      [v39 setBundleIDs:v40];

      NSFileProtectionType v79 = NSFileProtectionCompleteUntilFirstUserAuthentication;
      id v41 = +[NSArray arrayWithObjects:&v79 count:1];
      [v39 setProtectionClasses:v41];

      objc_initWeak(&location, v39);
      v73[0] = 0;
      v73[1] = v73;
      v73[2] = 0x2020000000;
      v73[3] = 0;
      v72[0] = 0;
      v72[1] = v72;
      v72[2] = 0x2020000000;
      v72[3] = 0;
      v66[0] = _NSConcreteStackBlock;
      v66[1] = 3221225472;
      v66[2] = sub_1002BDD6C;
      v66[3] = &unk_100745E28;
      uint64_t v69 = v72;
      v66[4] = v51;
      id v42 = v35;
      id v67 = v42;
      id v43 = v36;
      id v68 = v43;
      id v70 = v73;
      objc_copyWeak(&v71, &location);
      [v39 setFoundItemsHandler:v66];
      v57[0] = _NSConcreteStackBlock;
      v57[1] = 3221225472;
      v57[2] = sub_1002BE078;
      v57[3] = &unk_100745E78;
      v57[4] = v51;
      id v44 = v17;
      id v58 = v44;
      id v45 = v42;
      id v59 = v45;
      BOOL v65 = v49;
      id v46 = v43;
      id v60 = v46;
      id v62 = v52;
      unint64_t v64 = a5;
      id v61 = v54;
      id v63 = v72;
      [v39 setCompletionHandler:v57];
      [v39 start];

      objc_destroyWeak(&v71);
      _Block_object_dispose(v72, 8);
      _Block_object_dispose(v73, 8);
      objc_destroyWeak(&location);

      unsigned int v12 = v52;
    }
    else
    {
      v47 = objc_msgSend(v54, "subarrayWithRange:", 0, 3);
      unsigned int v12 = v52;
      ((void (**)(void, void *, void))v52)[2](v52, v47, 0);
    }
  }
LABEL_6:
}

- (id)_spotlightFilterQueriesForCurrentQuery
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  [v3 addObject:@"contentType == com.apple.pktransaction"];
  objc_opt_class();
  BOOL v4 = NSNumber_ptr;
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(PKSearchQuery *)self->_currentQuery passUniqueIdentifier];
    id v6 = +[NSString stringWithFormat:@"domainIdentifier == '%@'", v5];
    [v3 addObject:v6];
  }
  unint64_t v7 = [(PKSearchQuery *)self->_currentQuery categoryToken];
  BOOL v8 = v7;
  if (v7)
  {
    uint64_t v9 = PKCoreSpotlightCustomKeyTransactionCategory;
    BOOL v10 = [v7 group];
    id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ == %ld", v9, [v10 merchantCategory]);
    [v3 addObject:v11];
  }
  v144 = v8;
  unsigned int v12 = [(PKSearchQuery *)self->_currentQuery merchantToken];
  id v13 = v12;
  if (v12)
  {
    id v14 = [v12 group];
    BOOL v15 = [v14 merchant];
    long long v16 = [v15 displayName];
    id v17 = sub_1002BCED4(v16);
    uint64_t v18 = +[NSString stringWithFormat:@"displayName == '%@'cd", v17];
    [v3 addObject:v18];
  }
  v143 = v13;
  v148 = [(PKSearchQuery *)self->_currentQuery peerPaymentToken];
  if (v148)
  {
    id v19 = objc_alloc_init((Class)NSMutableArray);
    long long v183 = 0u;
    long long v184 = 0u;
    long long v185 = 0u;
    long long v186 = 0u;
    CFStringRef v20 = [v148 group];
    id v21 = [v20 handles];

    id v22 = [v21 countByEnumeratingWithState:&v183 objects:v194 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v184;
      uint64_t v25 = PKCoreSpotlightCustomKeyTransactionHandle;
      do
      {
        for (uint64_t i = 0; i != v23; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v184 != v24) {
            objc_enumerationMutation(v21);
          }
          id v27 = +[NSString stringWithFormat:@"%@ == '%@'cd", v25, *(void *)(*((void *)&v183 + 1) + 8 * i)];
          [v19 addObject:v27];
        }
        id v23 = [v21 countByEnumeratingWithState:&v183 objects:v194 count:16];
      }
      while (v23);
    }

    id v28 = [v19 componentsJoinedByString:@" || "];
    id v29 = [v28 stringByAppendingString:@""]);

    id v30 = objc_msgSend(@"("), "stringByAppendingString:", v29;

    [v3 addObject:v30];
    BOOL v4 = NSNumber_ptr;
  }
  id v153 = objc_alloc_init((Class)NSMutableArray);
  long long v179 = 0u;
  long long v180 = 0u;
  long long v181 = 0u;
  long long v182 = 0u;
  id v31 = self->_currentTransactionSourceIdentifiers;
  id v32 = [(NSSet *)v31 countByEnumeratingWithState:&v179 objects:v193 count:16];
  if (v32)
  {
    id v33 = v32;
    uint64_t v34 = *(void *)v180;
    uint64_t v35 = PKCoreSpotlightCustomKeyTransactionSourceIdentifier;
    do
    {
      for (j = 0; j != v33; j = (char *)j + 1)
      {
        if (*(void *)v180 != v34) {
          objc_enumerationMutation(v31);
        }
        id v37 = +[NSString stringWithFormat:@"%@ == '%@'", v35, *(void *)(*((void *)&v179 + 1) + 8 * (void)j)];
        [v153 addObject:v37];
      }
      id v33 = [(NSSet *)v31 countByEnumeratingWithState:&v179 objects:v193 count:16];
    }
    while (v33);
  }

  uint64_t v38 = [v153 componentsJoinedByString:@" || "];
  id v39 = [v38 stringByAppendingString:@""]);

  uint64_t v40 = objc_msgSend(@"("), "stringByAppendingString:", v39;

  v142 = (void *)v40;
  [v3 addObject:v40];
  id v41 = [(PKSearchQuery *)self->_currentQuery dateToken];
  id v42 = v41;
  if (v41)
  {
    id v43 = [v41 startDate];
    [v43 timeIntervalSinceReferenceDate];
    uint64_t v45 = v44;
    id v46 = [v42 endDate];
    [v46 timeIntervalSinceReferenceDate];
    v48 = +[NSString stringWithFormat:@"InRange(addedDate,%.2f,%.2f)", v45, v47];
    [v3 addObject:v48];
  }
  v141 = v42;
  BOOL v49 = [(PKSearchQuery *)self->_currentQuery amountToken];
  v50 = v49;
  if (v49)
  {
    id v51 = [v49 comparison];
    if (v51 == (id)1)
    {
      uint64_t v55 = PKCoreSpotlightCustomKeyTransactionAmount;
      id v53 = [v50 amount];
      id v54 = [v53 amount];
      +[NSString stringWithFormat:@"%@ < %@", v55, v54];
    }
    else
    {
      uint64_t v52 = PKCoreSpotlightCustomKeyTransactionAmount;
      if (v51 == (id)-1)
      {
        id v53 = [v50 amount];
        id v54 = [v53 amount];
        +[NSString stringWithFormat:@"%@ > %@", v52, v54];
      }
      else
      {
        id v53 = [v50 amount];
        id v54 = [v53 amount];
        +[NSString stringWithFormat:@"%@ == %@", v52, v54];
      }
    v56 = };
    [v3 addObject:v56];

    uint64_t v57 = PKCoreSpotlightCustomKeyTransactionCurrencyCode;
    id v58 = [v50 amount];
    id v59 = [v58 currency];
    id v60 = +[NSString stringWithFormat:@"%@ == '%@'", v57, v59];
    [v3 addObject:v60];
  }
  v140 = v50;
  v147 = [(PKSearchQuery *)self->_currentQuery transactionTypes];
  if ([v147 count])
  {
    id v61 = objc_alloc_init((Class)NSMutableArray);
    long long v175 = 0u;
    long long v176 = 0u;
    long long v177 = 0u;
    long long v178 = 0u;
    id v62 = v147;
    id v63 = [v62 countByEnumeratingWithState:&v175 objects:v192 count:16];
    if (v63)
    {
      id v64 = v63;
      uint64_t v65 = *(void *)v176;
      uint64_t v66 = PKCoreSpotlightCustomKeyTransactionType;
      do
      {
        for (k = 0; k != v64; k = (char *)k + 1)
        {
          if (*(void *)v176 != v65) {
            objc_enumerationMutation(v62);
          }
          id v68 = [v4[11] stringWithFormat:@"(%@ == %@)", v66, *(void *)(*((void *)&v175 + 1) + 8 * (void)k)];
          [v61 addObject:v68];

          BOOL v4 = NSNumber_ptr;
        }
        id v64 = [v62 countByEnumeratingWithState:&v175 objects:v192 count:16];
      }
      while (v64);
    }

    uint64_t v69 = [v61 componentsJoinedByString:@" || "];
    id v70 = [v69 stringByAppendingString:@""]);

    id v71 = objc_msgSend(@"("), "stringByAppendingString:", v70;

    [v3 addObject:v71];
  }
  v146 = [(PKSearchQuery *)self->_currentQuery transactionSources];
  v149 = self;
  if ([v146 count])
  {
    id v72 = objc_alloc_init((Class)NSMutableArray);
    long long v171 = 0u;
    long long v172 = 0u;
    long long v173 = 0u;
    long long v174 = 0u;
    id v73 = v146;
    id v74 = [v73 countByEnumeratingWithState:&v171 objects:v191 count:16];
    if (v74)
    {
      id v75 = v74;
      uint64_t v76 = *(void *)v172;
      uint64_t v77 = PKCoreSpotlightCustomKeyTransactionSource;
      do
      {
        for (m = 0; m != v75; m = (char *)m + 1)
        {
          if (*(void *)v172 != v76) {
            objc_enumerationMutation(v73);
          }
          NSFileProtectionType v79 = +[NSString stringWithFormat:@"(%@ == %@)", v77, *(void *)(*((void *)&v171 + 1) + 8 * (void)m)];
          [v72 addObject:v79];
        }
        id v75 = [v73 countByEnumeratingWithState:&v171 objects:v191 count:16];
      }
      while (v75);
    }

    uint64_t v80 = [v72 componentsJoinedByString:@" || "];
    id v81 = [v80 stringByAppendingString:@""]);

    v82 = objc_msgSend(@"("), "stringByAppendingString:", v81;

    [v3 addObject:v82];
    self = v149;
  }
  v145 = [(PKSearchQuery *)self->_currentQuery transactionStatuses];
  v154 = v3;
  if ([v145 count])
  {
    id v83 = objc_alloc_init((Class)NSMutableArray);
    long long v167 = 0u;
    long long v168 = 0u;
    long long v169 = 0u;
    long long v170 = 0u;
    id v84 = v145;
    id v85 = [v84 countByEnumeratingWithState:&v167 objects:v190 count:16];
    if (v85)
    {
      id v86 = v85;
      uint64_t v87 = *(void *)v168;
      uint64_t v88 = PKCoreSpotlightCustomKeyTransactionStatus;
      do
      {
        for (n = 0; n != v86; n = (char *)n + 1)
        {
          if (*(void *)v168 != v87) {
            objc_enumerationMutation(v84);
          }
          v90 = +[NSString stringWithFormat:@"(%@ == %@)", v88, *(void *)(*((void *)&v167 + 1) + 8 * (void)n)];
          [v83 addObject:v90];
        }
        id v86 = [v84 countByEnumeratingWithState:&v167 objects:v190 count:16];
      }
      while (v86);
    }

    uint64_t v91 = [v83 componentsJoinedByString:@" || "];
    v92 = [v91 stringByAppendingString:@""]);

    v93 = objc_msgSend(@"("), "stringByAppendingString:", v92;

    [v3 addObject:v93];
    self = v149;
  }
  if ([(NSArray *)self->_currentRegions count])
  {
    id v94 = +[PKWorldRegion mostConstrainingTypeInRegions:self->_currentRegions];
    id v95 = objc_alloc_init((Class)NSMutableArray);
    long long v163 = 0u;
    long long v164 = 0u;
    long long v165 = 0u;
    long long v166 = 0u;
    v96 = self->_currentRegions;
    id v97 = [(NSArray *)v96 countByEnumeratingWithState:&v163 objects:v189 count:16];
    if (v97)
    {
      id v98 = v97;
      uint64_t v99 = *(void *)v164;
      do
      {
        for (iuint64_t i = 0; ii != v98; iuint64_t i = (char *)ii + 1)
        {
          if (*(void *)v164 != v99) {
            objc_enumerationMutation(v96);
          }
          v101 = *(void **)(*((void *)&v163 + 1) + 8 * (void)ii);
          if ([v101 type] == v94)
          {
            v102 = [v101 identifier];
            [v95 addObject:v102];
          }
        }
        id v98 = [(NSArray *)v96 countByEnumeratingWithState:&v163 objects:v189 count:16];
      }
      while (v98);
    }

    id v103 = [v95 count];
    if ((unint64_t)v103 < 2)
    {
      v115 = v154;
      self = v149;
      if (v103 != (id)1)
      {
LABEL_81:

        goto LABEL_82;
      }
      uint64_t v116 = PKCoreSpotlightCustomKeyTransactionRegions;
      id v104 = [v95 firstObject];
      v114 = +[NSString stringWithFormat:@"%@ == '%@'", v116, v104];
    }
    else
    {
      id v104 = objc_alloc_init((Class)NSMutableArray);
      long long v159 = 0u;
      long long v160 = 0u;
      long long v161 = 0u;
      long long v162 = 0u;
      id v105 = v95;
      id v106 = [v105 countByEnumeratingWithState:&v159 objects:v188 count:16];
      if (v106)
      {
        id v107 = v106;
        uint64_t v108 = *(void *)v160;
        uint64_t v109 = PKCoreSpotlightCustomKeyTransactionRegions;
        do
        {
          for (jj = 0; jj != v107; jj = (char *)jj + 1)
          {
            if (*(void *)v160 != v108) {
              objc_enumerationMutation(v105);
            }
            v111 = +[NSString stringWithFormat:@"(%@ == '%@')", v109, *(void *)(*((void *)&v159 + 1) + 8 * (void)jj)];
            [v104 addObject:v111];
          }
          id v107 = [v105 countByEnumeratingWithState:&v159 objects:v188 count:16];
        }
        while (v107);
      }

      v112 = [v104 componentsJoinedByString:@" || "];
      id v113 = [v112 stringByAppendingString:@""]);

      v114 = objc_msgSend(@"("), "stringByAppendingString:", v113;

      v115 = v154;
      self = v149;
    }
    [v115 addObject:v114];

    goto LABEL_81;
  }
LABEL_82:
  [(PKSearchQuery *)self->_currentQuery tags];
  long long v155 = 0u;
  long long v156 = 0u;
  long long v157 = 0u;
  long long v158 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v117 = [obj countByEnumeratingWithState:&v155 objects:v187 count:16];
  if (v117)
  {
    id v118 = v117;
    uint64_t v152 = *(void *)v156;
    uint64_t v151 = PKCoreSpotlightCustomKeyTransactionTagKeywords;
    uint64_t v119 = PKCoreSpotlightCustomKeyTransactionTags;
    do
    {
      for (kk = 0; kk != v118; kk = (char *)kk + 1)
      {
        if (*(void *)v156 != v152) {
          objc_enumerationMutation(obj);
        }
        v121 = *(void **)(*((void *)&v155 + 1) + 8 * (void)kk);
        v122 = [v121 localizedTitle];
        if (v122)
        {
          v123 = [v121 localizedTitle];
          id v124 = +[NSString stringWithFormat:@"(%@ == '%@')", v151, v123];
          [v154 addObject:v124];
        }
        id v125 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v121 type]);
        v126 = +[NSString stringWithFormat:@"(%@ == '%@')", v119, v125];
        [v154 addObject:v126];
      }
      id v118 = [obj countByEnumeratingWithState:&v155 objects:v187 count:16];
    }
    while (v118);
  }
  v127 = v149;
  long long v128 = [(PKSearchQuery *)v149->_currentQuery rewardsToken];
  long long v129 = v128;
  if (v128)
  {
    id v130 = [v128 rewardsValueUnit];
    if (v130 == (id)2)
    {
      long long v131 = (uint64_t *)&PKCoreSpotlightCustomKeyTransactionRewardsCashAggregate;
    }
    else
    {
      if (v130 != (id)1) {
        goto LABEL_97;
      }
      long long v131 = (uint64_t *)&PKCoreSpotlightCustomKeyTransactionRewardsPercentAggregate;
    }
    uint64_t v132 = *v131;
    long long v133 = [v129 rewardsValue];
    long long v134 = +[NSString stringWithFormat:@"%@ == %@", v132, v133];
    [v154 addObject:v134];

    v127 = v149;
  }
LABEL_97:
  long long v135 = [(PKSearchQuery *)v127->_currentQuery peerPaymentSubTypeToken];
  long long v136 = v135;
  if (v135)
  {
    long long v137 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ == %ld", PKCoreSpotlightCustomKeyTransactionSubType, [v135 subType]);
    [v154 addObject:v137];
  }
  id v138 = [v154 copy];

  return v138;
}

- (void)_recentMerchantsWithCompletion:(id)a3
{
  uint64_t v25 = (void (**)(id, id))a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v6 = [(PDDatabaseManager *)self->_databaseManager transactionsForTransactionSourceIdentifiers:self->_currentTransactionSourceIdentifiers withTransactionType:0 withTransactionSource:1 withBackingData:1 startDate:self->_currentStartDate endDate:self->_currentEndDate limit:50];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v33;
    do
    {
      BOOL v10 = 0;
      do
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v32 + 1) + 8 * (void)v10) merchant];
        if (v11) {
          [(PDSearchService *)self _updateMerchantArray:v5 allUniqueMerchants:0 counts:v4 withMerchantIfUnique:v11];
        }

        BOOL v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v8);
  }
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1002BF880;
  v30[3] = &unk_100745EA0;
  id v24 = v4;
  id v31 = v24;
  unsigned int v12 = [v5 sortedArrayUsingComparator:v30];
  id v13 = objc_alloc_init((Class)NSMutableArray);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v14 = v12;
  id v15 = [v14 countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v27;
LABEL_12:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v27 != v17) {
        objc_enumerationMutation(v14);
      }
      uint64_t v19 = *(void *)(*((void *)&v26 + 1) + 8 * v18);
      id v20 = objc_alloc_init((Class)PKPaymentTransactionGroup);
      [v20 setMerchant:v19];
      [v20 setType:1];
      id v21 = objc_alloc_init((Class)PKSearchTransactionGroupResult);
      [v21 setGroup:v20];
      [v13 addObject:v21];
      id v22 = [v13 count];

      if ((unint64_t)v22 > 0xB) {
        break;
      }
      if (v16 == (id)++v18)
      {
        id v16 = [v14 countByEnumeratingWithState:&v26 objects:v36 count:16];
        if (v16) {
          goto LABEL_12;
        }
        break;
      }
    }
  }

  id v23 = [v13 copy];
  v25[2](v25, v23);
}

- (void)_paymentTransactionTagTypesWithCompletion:(id)a3
{
  long long v28 = (void (**)(id, id))a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v5 = [&off_10078C390 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v38;
    uint64_t v29 = *(void *)v38;
    id v30 = self;
    do
    {
      id v8 = 0;
      id v31 = v6;
      do
      {
        if (*(void *)v38 != v7) {
          objc_enumerationMutation(&off_10078C390);
        }
        unint64_t v9 = (unint64_t)[*(id *)(*((void *)&v37 + 1) + 8 * (void)v8) unsignedIntegerValue];
        if ([(PDSearchService *)self _currentPassSupportsTag:v9]) {
          BOOL v10 = v9 > 0x14;
        }
        else {
          BOOL v10 = 1;
        }
        if (!v10)
        {
          if (((1 << v9) & 0x80842) != 0) {
            goto LABEL_11;
          }
          if (((1 << v9) & 0x24000) != 0)
          {
            id v15 = [(PDSearchService *)self _uniqueTagOccurenceRules];
            id v16 = +[NSNumber numberWithUnsignedInteger:v9];
            id v14 = [v15 objectForKey:v16];

            if (!v14 || (objc_msgSend(v14, "pk_isNotANumber") & 1) != 0)
            {
              id v6 = v31;
              goto LABEL_14;
            }
            id v32 = v14;
            uint64_t v17 = -[PDDatabaseManager compoundTags:limit:](self->_databaseManager, "compoundTags:limit:", v9, [v14 unsignedIntegerValue]);
            id v12 = v17;
            id v6 = v31;
            if (v17 && [v17 count])
            {
              long long v35 = 0u;
              long long v36 = 0u;
              long long v33 = 0u;
              long long v34 = 0u;
              id v13 = v12;
              id v18 = [v13 countByEnumeratingWithState:&v33 objects:v41 count:16];
              if (v18)
              {
                id v19 = v18;
                uint64_t v20 = *(void *)v34;
                do
                {
                  id v21 = 0;
                  do
                  {
                    if (*(void *)v34 != v20) {
                      objc_enumerationMutation(v13);
                    }
                    uint64_t v22 = *(void *)(*((void *)&v33 + 1) + 8 * (void)v21);
                    id v23 = objc_alloc_init((Class)PKPaymentTransactionGroup);
                    [v23 setType:15];
                    [v23 setTag:v22];
                    id v24 = objc_alloc_init((Class)PKSearchTransactionGroupResult);
                    [v24 setGroup:v23];
                    [v4 addObject:v24];

                    id v21 = (char *)v21 + 1;
                  }
                  while (v19 != v21);
                  id v19 = [v13 countByEnumeratingWithState:&v33 objects:v41 count:16];
                }
                while (v19);
                id v12 = v13;
                uint64_t v7 = v29;
                self = v30;
                id v6 = v31;
              }
              else
              {
                id v12 = v13;
              }
              goto LABEL_12;
            }
            goto LABEL_13;
          }
          if (v9 == 20)
          {
            unint64_t v9 = 18;
LABEL_11:
            id v11 = objc_alloc_init((Class)PKPaymentTransactionGroup);
            [v11 setType:15];
            id v12 = objc_alloc_init((Class)PKPaymentTransactionTag);
            [v12 setType:v9];
            [v11 setTag:v12];
            id v13 = objc_alloc_init((Class)PKSearchTransactionGroupResult);
            id v32 = v11;
            [v13 setGroup:v11];
            [v4 addObject:v13];
LABEL_12:

LABEL_13:
            id v14 = v32;
LABEL_14:
          }
        }
        id v8 = (char *)v8 + 1;
      }
      while (v8 != v6);
      id v25 = [&off_10078C390 countByEnumeratingWithState:&v37 objects:v42 count:16];
      id v6 = v25;
    }
    while (v25);
  }
  long long v26 = (char *)[v4 count];
  if ((unint64_t)v26 >= 5) {
    objc_msgSend(v4, "removeObjectsInRange:", 4, v26 - 4);
  }
  id v27 = [v4 copy];
  v28[2](v28, v27);
}

- (id)_uniqueTagOccurenceRules
{
  if (qword_100808DF0 != -1) {
    dispatch_once(&qword_100808DF0, &stru_100745EC0);
  }
  v2 = (void *)qword_100808DE8;
  return v2;
}

- (BOOL)_currentPassSupportsTag:(unint64_t)a3
{
  id v5 = objc_alloc_init((Class)PKPaymentTransactionTag);
  [v5 setType:a3];
  id v6 = [(PDSearchService *)self _transactionRequestForCurrentFilters];
  id v7 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", v5, 0);
  [v6 setTags:v7];

  [v6 setLimit:1];
  [v6 setTransactionTypes:&off_10078C3C0];
  id v8 = [(PDDatabaseManager *)self->_databaseManager transactionsForRequest:v6];
  LOBYTE(v7) = [v8 count] != 0;

  return (char)v7;
}

- (void)_updateMerchantArray:(id)a3 allUniqueMerchants:(id)a4 counts:(id)a5 withMerchantIfUnique:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = v12;
  if (v9 && v12)
  {
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1002C0160;
    v30[3] = &unk_100745EE8;
    id v14 = v12;
    id v31 = v14;
    id v15 = [v9 indexOfObjectPassingTest:v30];
    if (v15 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      [v9 addObject:v14];
      [v10 addObject:v14];
      if (!v11)
      {
LABEL_20:

        goto LABEL_21;
      }
      id v16 = [v14 uniqueIdentifier];
      [v11 setObject:&off_10078B5E0 forKey:v16];
LABEL_19:

      goto LABEL_20;
    }
    id v17 = v15;
    id v16 = [v9 objectAtIndex:v15];
    id v18 = [v16 mapsBrand];
    id v19 = [v18 identifier];
    uint64_t v20 = [v14 mapsBrand];
    id v29 = v10;
    if (v19 == [v20 identifier])
    {
      id v21 = [v16 mapsMerchant];
      id v28 = [v21 identifier];
      uint64_t v22 = [v14 mapsMerchant];
      id v27 = [v22 identifier];

      id v10 = v29;
      if (v28 == v27) {
        goto LABEL_11;
      }
    }
    else
    {
    }
    objc_msgSend(v10, "addObject:", v14, v27);
LABEL_11:
    id v23 = objc_msgSend(v16, "uniqueIdentifier", v27);
    if (v11)
    {
      id v24 = [v11 objectForKey:v23];
      id v25 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[v24 integerValue] + 1);
      if ([v14 hasBetterVisualPropertiesThanMerchant:v16])
      {
        [v9 replaceObjectAtIndex:v17 withObject:v14];
        [v11 removeObjectForKey:v23];
        long long v26 = [v14 uniqueIdentifier];
        [v11 setObject:v25 forKey:v26];
      }
      else
      {
        [v11 setObject:v25 forKey:v23];
      }

      id v10 = v29;
    }
    else if ([v14 hasBetterVisualPropertiesThanMerchant:v16])
    {
      [v9 replaceObjectAtIndex:v17 withObject:v14];
    }

    goto LABEL_19;
  }
LABEL_21:
}

- (void)_matchedHandlesForCurrentQueryWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    id v5 = [(PKSearchQuery *)self->_currentQuery peerPaymentToken];
    if (v5) {
      goto LABEL_4;
    }
    id v5 = [(PKSearchQuery *)self->_currentQuery accountUserToken];
    if (v5) {
      goto LABEL_4;
    }
    if (self->_currentQueryIncludesCash)
    {
      id v5 = [(PKSearchQuery *)self->_currentQuery categoryToken];
      if (v5
        || ([(PKSearchQuery *)self->_currentQuery locationTokens],
            id v5 = objc_claimAutoreleasedReturnValue(),
            [v5 count]))
      {
LABEL_4:

LABEL_5:
        v4[2](v4, &__NSArray0__struct);
        goto LABEL_6;
      }
      id v6 = [(PKSearchQuery *)self->_currentQuery merchantToken];

      if (v6) {
        goto LABEL_5;
      }
    }
    if ([(PKSearchQuery *)self->_currentQuery type]
      && [(PKSearchQuery *)self->_currentQuery type] != (id)6)
    {
      goto LABEL_5;
    }
    unsigned __int8 v7 = [(PKSearchQuery *)self->_currentQuery isEmpty];
    id v8 = [(PKSearchQuery *)self->_currentQuery text];
    currentTransactionSourceIdentifiers = self->_currentTransactionSourceIdentifiers;
    if (currentTransactionSourceIdentifiers && !self->_currentQueryIncludesCash)
    {
      if (self->_currentAccountIdentifier)
      {
        v30[0] = 0;
        v30[1] = v30;
        v30[2] = 0x3032000000;
        v30[3] = sub_100020ACC;
        void v30[4] = sub_100021058;
        -[NSMutableDictionary objectForKey:](self->_accountUsers, "objectForKey:");
        id v31 = (id)objc_claimAutoreleasedReturnValue();
        id v20 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_1002C0DB8;
        v29[3] = &unk_10072E610;
        v29[4] = self;
        v29[5] = v30;
        [v20 addOperation:v29];
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_1002C1040;
        v28[3] = &unk_10072E610;
        v28[4] = self;
        v28[5] = v30;
        [v20 addOperation:v28];
        id v21 = +[NSNull null];
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_1002C13B0;
        v23[3] = &unk_100745F60;
        id v25 = v4;
        long long v26 = v30;
        void v23[4] = self;
        unsigned __int8 v27 = v7;
        id v24 = v8;
        id v22 = [v20 evaluateWithInput:v21 completion:v23];

        _Block_object_dispose(v30, 8);
      }
      else
      {
        v4[2](v4, 0);
      }
    }
    else
    {
      if (!self->_contactResolver)
      {
        id v10 = objc_alloc((Class)PKContactResolver);
        id v11 = objc_alloc_init((Class)CNContactStore);
        id v12 = [(PDSearchService *)self _contactKeysToFetch];
        id v13 = (PKContactResolver *)[v10 initWithContactStore:v11 keysToFetch:v12];
        contactResolver = self->_contactResolver;
        self->_contactResolver = v13;

        currentTransactionSourceIdentifiers = self->_currentTransactionSourceIdentifiers;
      }
      databaseManager = self->_databaseManager;
      id v16 = [(NSSet *)currentTransactionSourceIdentifiers anyObject];
      id v17 = [(PDDatabaseManager *)databaseManager peerPaymentCounterpartHandlesForTransactionSourceIdentifier:v16 excludingPaymentMode:2 startDate:0 endDate:0];

      id v18 = self->_contactResolver;
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_1002C05F0;
      v32[3] = &unk_100745F10;
      v32[4] = self;
      id v33 = v17;
      unsigned __int8 v36 = v7;
      id v34 = v8;
      long long v35 = v4;
      id v19 = v17;
      [(PKContactResolver *)v18 contactForHandles:v19 withCompletion:v32];
    }
  }
LABEL_6:
}

- (id)_contactKeysToFetch
{
  v2 = +[CNContactFormatter descriptorForRequiredKeysForStyle:0];
  v5[0] = v2;
  v5[1] = CNContactEmailAddressesKey;
  v5[2] = CNContactPhoneNumbersKey;
  id v3 = +[NSArray arrayWithObjects:v5 count:3];

  return v3;
}

- (void)_suggestionsForCurrentQueryWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  if (([(PKSearchQuery *)self->_currentQuery isEmpty] & 1) != 0
    || [(PKSearchQuery *)self->_currentQuery type])
  {
    v4[2](v4, &__NSArray0__struct);
    goto LABEL_4;
  }
  id v5 = [(PKSearchQuery *)self->_currentQuery text];
  id v78 = objc_alloc_init((Class)NSMutableArray);
  id v6 = +[NSDecimalNumber decimalNumberWithString:v5];
  unsigned __int8 v7 = v6;
  if (v6 && !objc_msgSend(v6, "pk_isNotANumber")) {
    goto LABEL_11;
  }
  id v8 = PKMutableNumberFormatterForCurrencyCode();
  id v9 = [v8 numberFromString:v5];
  id v10 = v9;
  if (v9 && (objc_msgSend(v9, "pk_isNotANumber") & 1) == 0)
  {
    [v10 decimalValue];
    uint64_t v11 = +[NSDecimalNumber decimalNumberWithDecimal:v88];

    unsigned __int8 v7 = (void *)v11;
  }

  if (v7)
  {
LABEL_11:
    if ((objc_msgSend(v7, "pk_isNotANumber") & 1) == 0)
    {
      id v12 = +[NSDecimalNumber zero];
      if ([v7 compare:v12] == (id)1)
      {
        NSUInteger v13 = [(NSSet *)self->_currentTransactionSourceIdentifiers count];

        if (!v13) {
          goto LABEL_16;
        }
        id v12 = objc_alloc_init((Class)PKSearchAmountResult);
        [v12 setComparison:0];
        id v14 = PKCurrencyAmountMake();
        [v12 setAmount:v14];

        [v78 safelyAddObject:v12];
        id v15 = objc_alloc_init((Class)PKSearchAmountResult);
        [v15 setComparison:-1];
        id v16 = PKCurrencyAmountMake();
        [v15 setAmount:v16];

        [v78 safelyAddObject:v15];
        id v17 = objc_alloc_init((Class)PKSearchAmountResult);
        [v17 setComparison:1];
        id v18 = PKCurrencyAmountMake();
        [v17 setAmount:v18];

        [v78 safelyAddObject:v17];
      }
    }
  }
LABEL_16:
  id v73 = v4;
  id v75 = v7;
  invertedIndex = self->_invertedIndex;
  id v71 = v5;
  id v20 = [v5 lowercaseString];
  id v21 = [(NSMutableDictionary *)invertedIndex objectForKey:v20];

  id v76 = objc_alloc_init((Class)NSMutableSet);
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id v22 = v21;
  id v23 = [v22 countByEnumeratingWithState:&v84 objects:v94 count:16];
  if (v23)
  {
    id v24 = v23;
    unint64_t v25 = 0;
    char v77 = 0;
    uint64_t v26 = *(void *)v85;
    unsigned __int8 v27 = v78;
LABEL_18:
    uint64_t v28 = 0;
    while (2)
    {
      if (*(void *)v85 != v26) {
        objc_enumerationMutation(v22);
      }
      id v29 = *(void **)(*((void *)&v84 + 1) + 8 * v28);
      switch((unint64_t)[v29 type])
      {
        case 0uLL:
          if (!-[PDSearchService _currentQuerySupportsCategory:](self, "_currentQuerySupportsCategory:", [v29 category]))goto LABEL_62; {
          id v30 = objc_alloc_init((Class)PKPaymentTransactionGroup);
          }
          [v30 setType:0];
          objc_msgSend(v30, "setMerchantCategory:", objc_msgSend(v29, "category"));
          id v31 = objc_alloc_init((Class)PKSearchTransactionGroupResult);
          [v31 setGroup:v30];
          goto LABEL_60;
        case 1uLL:
          id v32 = [v29 transactionType];
          if (![(PDSearchService *)self _currentQuerySupportsTransactionTypeToken:v32])goto LABEL_62; {
          id v31 = objc_alloc_init((Class)PKSearchTransactionTypeResult);
          }
          [v31 setTransactionType:v32];
          if (!v31) {
            goto LABEL_67;
          }
          goto LABEL_65;
        case 2uLL:
          id v33 = [v29 transactionStatus];
          if (![(PDSearchService *)self _currentQuerySupportsTransactionStatusToken:v33])goto LABEL_62; {
          id v31 = objc_alloc_init((Class)PKSearchTransactionStatusResult);
          }
          [v31 setTransactionStatus:v33];
          if (!v31) {
            goto LABEL_67;
          }
          goto LABEL_65;
        case 3uLL:
          id v34 = [v29 transactionSource];
          if (![(PDSearchService *)self _currentQuerySupportsTransactionSourceToken:v34])goto LABEL_62; {
          id v31 = objc_alloc_init((Class)PKSearchTransactionSourceResult);
          }
          [v31 setTransactionSource:v34];
          if (!v31) {
            goto LABEL_67;
          }
          goto LABEL_65;
        case 4uLL:
          if (self->_currentStartDate) {
            BOOL v35 = 1;
          }
          else {
            BOOL v35 = v25 > 2;
          }
          if (v35) {
            goto LABEL_62;
          }
          unsigned __int8 v36 = [v29 date];
          long long v37 = [v29 date];
          long long v38 = PKEndOfDay();

          if (![(PDSearchService *)self _currentQuerySupportsDateTokenWithStartDate:v36 endDate:v38])goto LABEL_63; {
          [v76 addObject:v36];
          }
          ++v25;
          id v31 = objc_alloc_init((Class)PKSearchDateResult);
          char v77 = 1;
          [v31 setType:1];
          [v31 setStartDate:v36];
          [v31 setEndDate:v38];
          goto LABEL_64;
        case 5uLL:
          if (self->_currentStartDate) {
            BOOL v39 = 1;
          }
          else {
            BOOL v39 = v25 > 2;
          }
          if (v39) {
            goto LABEL_62;
          }
          unsigned __int8 v36 = [v29 date];
          long long v40 = [v29 date];
          long long v38 = PKEndOfMonth();

          if (![(PDSearchService *)self _currentQuerySupportsDateTokenWithStartDate:v36 endDate:v38])goto LABEL_63; {
          ++v25;
          }
          id v41 = objc_alloc_init((Class)PKSearchDateResult);
          id v31 = v41;
          uint64_t v42 = 2;
          goto LABEL_51;
        case 6uLL:
          if (self->_currentStartDate) {
            BOOL v43 = 1;
          }
          else {
            BOOL v43 = v25 > 2;
          }
          if (v43) {
            goto LABEL_62;
          }
          unsigned __int8 v36 = [v29 date];
          uint64_t v44 = [v29 date];
          long long v38 = PKEndOfYear();

          if ([(PDSearchService *)self _currentQuerySupportsDateTokenWithStartDate:v36 endDate:v38])
          {
            ++v25;
            id v41 = objc_alloc_init((Class)PKSearchDateResult);
            id v31 = v41;
            uint64_t v42 = 3;
LABEL_51:
            [v41 setType:v42];
            [v31 setStartDate:v36];
            [v31 setEndDate:v38];
            char v77 = 1;
          }
          else
          {
LABEL_63:
            id v31 = 0;
          }
LABEL_64:
          unsigned __int8 v27 = v78;

          if (!v31) {
            goto LABEL_67;
          }
LABEL_65:
          if (([v27 containsObject:v31] & 1) == 0)
          {
            [v27 addObject:v31];
            if ((unint64_t)[v27 count] >= 5)
            {

              goto LABEL_72;
            }
          }
LABEL_67:

          if (v24 != (id)++v28) {
            continue;
          }
          id v24 = [v22 countByEnumeratingWithState:&v84 objects:v94 count:16];
          if (!v24) {
            goto LABEL_72;
          }
          goto LABEL_18;
        case 7uLL:
          id v45 = [v29 peerPaymentSubType];
          if (![(PDSearchService *)self _currentQuerySupportsPeerPaymentSubTypeToken:v45])goto LABEL_62; {
          id v31 = objc_alloc_init((Class)PKSearchTransactionPeerPaymentSubTypeResult);
          }
          [v31 setSubType:v45];
          if (!v31) {
            goto LABEL_67;
          }
          goto LABEL_65;
        case 8uLL:
          if (![(PDSearchService *)self _currentQuerySupportsRewardsToken:v29]) {
            goto LABEL_62;
          }
          id v31 = objc_alloc_init((Class)PKSearchTransactionRewardsResult);
          id v46 = [v29 rewardsValue];
          [v31 setRewardsValue:v46];

          unsigned __int8 v27 = v78;
          objc_msgSend(v31, "setRewardsValueUnit:", objc_msgSend(v29, "rewardsValueUnit"));
          if (!v31) {
            goto LABEL_67;
          }
          goto LABEL_65;
        case 9uLL:
          if (![(PDSearchService *)self _currentQuerySupportsTagToken:v29]) {
            goto LABEL_62;
          }
          id v31 = objc_alloc_init((Class)PKSearchTagResult);
          id v30 = [v29 tag];
          [v31 setTag:v30];
LABEL_60:

          unsigned __int8 v27 = v78;
          if (!v31) {
            goto LABEL_67;
          }
          goto LABEL_65;
        default:
LABEL_62:
          id v31 = 0;
          goto LABEL_67;
      }
    }
  }
  char v77 = 0;
  unsigned __int8 v27 = v78;
LABEL_72:

  id v47 = v71;
  id v93 = 0;
  v48 = +[NSDataDetector dataDetectorWithTypes:8 error:&v93];
  id v49 = v93;
  if (v48)
  {
    id v50 = v47;
    id v51 = objc_msgSend(v48, "matchesInString:options:range:", v47, 0, 0, objc_msgSend(v47, "length"));
    long long v89 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    id v52 = [v51 countByEnumeratingWithState:&v89 objects:v95 count:16];
    if (v52)
    {
      uint64_t v53 = *(void *)v90;
      while (2)
      {
        for (uint64_t i = 0; i != v52; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v90 != v53) {
            objc_enumerationMutation(v51);
          }
          uint64_t v55 = *(void **)(*((void *)&v89 + 1) + 8 * i);
          if ([v55 resultType] == (id)8)
          {
            id v52 = v55;
            goto LABEL_83;
          }
        }
        id v52 = [v51 countByEnumeratingWithState:&v89 objects:v95 count:16];
        if (v52) {
          continue;
        }
        break;
      }
LABEL_83:
      unsigned __int8 v27 = v78;
    }
    v56 = v75;

    id v4 = v73;
    id v47 = v50;
  }
  else
  {
    id v52 = 0;
    id v4 = v73;
    v56 = v75;
  }

  if (!v52 || self->_currentStartDate) {
    goto LABEL_101;
  }
  id v74 = v47;
  uint64_t v57 = [v52 date];
  id v58 = PKStartOfDay();

  id v59 = +[NSDate date];
  id v60 = +[NSCalendar currentCalendar];
  id v61 = v59;
  if ([v59 compare:v58] == (id)-1)
  {
    id v62 = objc_msgSend(v60, "nextDateAfterDate:matchingUnit:value:options:", v58, 512, objc_msgSend(v60, "component:fromDate:", 512, v58), 516);
    if ([v76 containsObject:v62])
    {
      id v63 = v62;
    }
    else
    {
      id v72 = objc_alloc_init((Class)NSDateComponents);
      [v72 setYear:-1];
      id v64 = [v60 dateByAddingComponents:v72 toDate:v58 options:0];
      PKStartOfDay();
      id v63 = (id)objc_claimAutoreleasedReturnValue();

      id v58 = v72;
    }
    unsigned __int8 v27 = v78;

    id v58 = v63;
  }
  else
  {
    unsigned __int8 v27 = v78;
  }
  id v65 = objc_alloc_init((Class)PKSearchDateResult);
  [v65 setType:0];
  [v52 duration];
  if (v66 != 0.0)
  {
    id v68 = objc_msgSend(v58, "dateByAddingTimeInterval:");
    id v67 = PKEndOfDay();

    unsigned __int8 v27 = v78;
LABEL_98:
    if ([(PDSearchService *)self _currentQuerySupportsDateTokenWithStartDate:v58 endDate:v67])
    {
      [v65 setStartDate:v58];
      [v65 setEndDate:v67];
      [v27 safelyAddObject:v65];
    }
    goto LABEL_100;
  }
  id v67 = PKEndOfDay();
  if (([v76 containsObject:v58] & 1) == 0) {
    goto LABEL_98;
  }
LABEL_100:

  id v47 = v74;
  v56 = v75;
LABEL_101:
  id v69 = [v27 count];
  if ((unint64_t)v69 > 4)
  {
    id v70 = [v27 copy];
    v4[2](v4, v70);
  }
  else
  {
    v79[0] = _NSConcreteStackBlock;
    v79[1] = 3221225472;
    v79[2] = sub_1002C2538;
    v79[3] = &unk_100746048;
    v79[4] = self;
    uint64_t v82 = 5 - (void)v69;
    id v80 = v27;
    char v83 = v77 & 1;
    id v81 = v4;
    [(PDSearchService *)self _locationsForCurrentQueryWithSuggestions:1 completion:v79];
  }
LABEL_4:
}

- (void)_locationsForCurrentQueryWithSuggestions:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, void *))a4;
  if (!v6) {
    goto LABEL_16;
  }
  unsigned __int8 v7 = [(PKSearchQuery *)self->_currentQuery peerPaymentToken];
  if (v7)
  {

LABEL_15:
    v6[2](v6, &__NSArray0__struct);
    goto LABEL_16;
  }
  [(PKSearchQuery *)self->_currentQuery transactionSources];
  id v8 = v79 = v6;
  unsigned int v9 = [v8 containsObject:&off_10078B4A8];

  id v6 = v79;
  if (v9) {
    goto LABEL_15;
  }
  id v10 = [(PKSearchQuery *)self->_currentQuery type];
  if ([(PKSearchQuery *)self->_currentQuery type] && v10 != (id)7) {
    goto LABEL_15;
  }
  id v12 = [(PKSearchQuery *)self->_currentQuery locationTokens];
  NSUInteger v13 = PKSearchRegionsFromLocationItems();
  id v14 = +[PKWorldRegion mostConstrainingTypeInRegions:v13];

  if (!v14)
  {
    id v6 = v79;
    goto LABEL_15;
  }
  id v77 = v10;
  if (!v4)
  {
    unsigned __int8 v15 = [(PKSearchQuery *)self->_currentQuery isEmpty];
    id v16 = &off_10078C3F0;
    id v17 = &off_10078C420;
    if (v14 == (id)1) {
      id v17 = &off_10078C408;
    }
    if ((v15 & 1) == 0) {
      id v16 = v17;
    }
    goto LABEL_23;
  }
  if (!self->_hasMultipleCountries)
  {
    id v16 = &off_10078C3D8;
LABEL_23:
    id v78 = v16;
    goto LABEL_24;
  }
  id v78 = [&off_10078C3D8 arrayByAddingObject:&off_10078B508];
LABEL_24:
  unsigned __int8 v76 = [(PKSearchQuery *)self->_currentQuery isEmpty];
  id v18 = [(PDSearchService *)self _transactionRequestForCurrentFilters];
  id v19 = [(PKSearchQuery *)self->_currentQuery transactionSources];
  id v20 = [v19 count];

  if (!v20) {
    [v18 setTransactionSources:&off_10078C438];
  }
  if (v10 == (id)7) {
    uint64_t v21 = 0;
  }
  else {
    uint64_t v21 = 12;
  }
  id v22 = +[NSLocale currentLocale];
  uint64_t v23 = [v22 localeIdentifier];

  databaseManager = self->_databaseManager;
  unint64_t v25 = [(PKSearchQuery *)self->_currentQuery text];
  long long v86 = (void *)v23;
  uint64_t v26 = [(PDDatabaseManager *)databaseManager regionIdentifiersMatchingName:v25 types:v78 localeIdentifier:v23 withRequest:v18 limit:v21];

  id v27 = objc_alloc_init((Class)NSMutableArray);
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  id obj = v26;
  id v28 = [obj countByEnumeratingWithState:&v103 objects:v110 count:16];
  if (v28)
  {
    id v29 = v28;
    uint64_t v30 = *(void *)v104;
    do
    {
      for (uint64_t i = 0; i != v29; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v104 != v30) {
          objc_enumerationMutation(obj);
        }
        id v32 = [(PDDatabaseManager *)self->_databaseManager worldRegionWithIdentifier:*(void *)(*((void *)&v103 + 1) + 8 * i) localeIdentifier:v86];
        [v27 safelyAddObject:v32];
      }
      id v29 = [obj countByEnumeratingWithState:&v103 objects:v110 count:16];
    }
    while (v29);
  }

  id v84 = objc_alloc_init((Class)NSMutableArray);
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  id v33 = v27;
  id v82 = v33;
  id v87 = [v33 countByEnumeratingWithState:&v99 objects:v109 count:16];
  if (v87)
  {
    uint64_t v85 = *(void *)v100;
    id v80 = v18;
    id v81 = self;
    do
    {
      for (j = 0; j != v87; j = (char *)j + 1)
      {
        if (*(void *)v100 != v85) {
          objc_enumerationMutation(v33);
        }
        long long v89 = *(void **)(*((void *)&v99 + 1) + 8 * (void)j);
        if (![v89 type])
        {
          v56 = [v89 localizedName];
          id v53 = [v89 parentRegion];
          uint64_t v57 = [v53 localizedName];
          id v55 = v56;
          id v58 = v57;
          if (v55 == v58)
          {
            uint64_t v88 = j;

            id v38 = v55;
            goto LABEL_79;
          }
          id v59 = v58;
          if (v55) {
            BOOL v60 = v58 == 0;
          }
          else {
            BOOL v60 = 1;
          }
          if (v60)
          {
          }
          else
          {
            unsigned __int8 v61 = [v55 isEqualToString:v58];

            if (v61) {
              continue;
            }
          }
        }
        if ([(NSArray *)self->_currentRegions count]
          && ![v89 isIncludedInRegions:self->_currentRegions])
        {
          continue;
        }
        uint64_t v88 = j;
        if ([v89 type] != (id)1) {
          goto LABEL_78;
        }
        long long v97 = 0u;
        long long v98 = 0u;
        long long v95 = 0u;
        long long v96 = 0u;
        id v35 = v84;
        id v36 = [v35 countByEnumeratingWithState:&v95 objects:v108 count:16];
        if (!v36)
        {

          goto LABEL_78;
        }
        id v37 = v36;
        id v38 = 0;
        uint64_t v39 = *(void *)v96;
        do
        {
          for (k = 0; k != v37; k = (char *)k + 1)
          {
            if (*(void *)v96 != v39) {
              objc_enumerationMutation(v35);
            }
            id v41 = *(void **)(*((void *)&v95 + 1) + 8 * (void)k);
            uint64_t v42 = [v41 group];
            BOOL v43 = [v42 regions];
            uint64_t v44 = [v43 firstObject];

            if ([v44 type] == (id)1)
            {
              id v45 = [v44 localizedName];
              id v46 = [v89 localizedName];
              id v47 = v45;
              id v48 = v46;
              if (v47 == v48)
              {

LABEL_60:
                id v52 = v41;

                [v44 displayRegion];
                if (!CLLocationCoordinate2DIsValid(v111))
                {
                  [v89 displayRegion];
                  objc_msgSend(v44, "setDisplayRegion:");
                }
                id v38 = v52;
                goto LABEL_63;
              }
              id v49 = v48;
              if (v47) {
                BOOL v50 = v48 == 0;
              }
              else {
                BOOL v50 = 1;
              }
              if (v50)
              {

                goto LABEL_63;
              }
              unsigned __int8 v51 = [v47 isEqualToString:v48];

              if (v51) {
                goto LABEL_60;
              }
            }
LABEL_63:
          }
          id v37 = [v35 countByEnumeratingWithState:&v95 objects:v108 count:16];
        }
        while (v37);

        id v18 = v80;
        self = v81;
        id v33 = v82;
        if (v38)
        {
          id v53 = [v38 group];
          id v54 = [v53 regions];
          id v55 = [v54 arrayByAddingObject:v89];

          [v53 setRegions:v55];
          [v80 setRegions:v55];
          id v94 = 0;
          [(PDDatabaseManager *)v81->_databaseManager totalAmount:0 forTransactionsWithRequest:v80 count:&v94];
          [v53 setTransactionCount:v94];
          goto LABEL_79;
        }
LABEL_78:
        id v53 = objc_alloc_init((Class)PKPaymentTransactionGroup);
        [v53 setType:13];
        id v55 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v89, 0);
        [v53 setRegions:v55];
        [v18 setRegions:v55];
        id v94 = 0;
        [(PDDatabaseManager *)self->_databaseManager totalAmount:0 forTransactionsWithRequest:v18 count:&v94];
        [v53 setTransactionCount:v94];
        id v38 = objc_alloc_init((Class)PKSearchTransactionGroupResult);
        [v38 setGroup:v53];
        [v84 addObject:v38];
LABEL_79:

        j = v88;
      }
      id v87 = [v33 countByEnumeratingWithState:&v99 objects:v109 count:16];
    }
    while (v87);
  }

  id v62 = v84;
  [v84 sortUsingComparator:&stru_100746068];
  unsigned __int8 v63 = v76;
  if (v77 == (id)7) {
    char v64 = 1;
  }
  else {
    char v64 = v76;
  }
  if ((v64 & 1) == 0 && (unint64_t)[v84 count] >= 4)
  {
    id v65 = objc_msgSend(v84, "subarrayWithRange:", 0, 3);
    id v66 = [v65 mutableCopy];

    unsigned __int8 v63 = v76;
    id v62 = v66;
  }
  id v6 = v79;
  if ((v63 & 1) == 0)
  {
    long long v92 = 0u;
    long long v93 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    id v67 = v62;
    id v68 = v62;
    id v69 = [v68 countByEnumeratingWithState:&v90 objects:v107 count:16];
    if (v69)
    {
      id v70 = v69;
      uint64_t v71 = *(void *)v91;
      do
      {
        for (m = 0; m != v70; m = (char *)m + 1)
        {
          if (*(void *)v91 != v71) {
            objc_enumerationMutation(v68);
          }
          id v73 = [*(id *)(*((void *)&v90 + 1) + 8 * (void)m) group];
          id v74 = [v73 regions];
          [v18 setRegions:v74];

          id v94 = 0;
          [(PDDatabaseManager *)self->_databaseManager totalAmount:&v94 forTransactionsWithRequest:v18 count:0];
          [v73 setTotalAmount:v94];
        }
        id v70 = [v68 countByEnumeratingWithState:&v90 objects:v107 count:16];
      }
      while (v70);
    }

    id v6 = v79;
    id v33 = v82;
    id v62 = v67;
  }
  id v75 = [v62 copy];
  v6[2](v6, v75);

LABEL_16:
}

- (void)regionsWithCompletion:(id)a3
{
  if (a3)
  {
    databaseManager = self->_databaseManager;
    BOOL v4 = (void (**)(id, void *))a3;
    id v5 = +[NSLocale currentLocale];
    id v6 = [v5 localeIdentifier];
    id v8 = [(PDDatabaseManager *)databaseManager regionsMatchingName:0 types:0 localeIdentifier:v6];

    unsigned __int8 v7 = +[NSSet setWithArray:v8];
    v4[2](v4, v7);
  }
}

- (void)resetRegionsWithCompletion:(id)a3
{
  id v5 = a3;
  [(PDSpotlightIndexer *)self->_indexer resetRegions];
  BOOL v4 = v5;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    BOOL v4 = v5;
  }
}

- (void)resetRegionsCoordinatesWithCompletion:(id)a3
{
  id v5 = a3;
  [(PDSpotlightIndexer *)self->_indexer resetCoordinatesForAllRegions];
  BOOL v4 = v5;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    BOOL v4 = v5;
  }
}

- (void)transactionsMissingRegionsWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(id, id, id))a3;
  if (v4)
  {
    id v5 = [(PDDatabaseManager *)self->_databaseManager transactionsMissingWorldRegionWithLimit:2000 onlyEligibleForProcessing:0];
    id v6 = objc_alloc_init((Class)NSMutableDictionary);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          NSUInteger v13 = -[PDDatabaseManager lastRegionErrorForTransaction:](self->_databaseManager, "lastRegionErrorForTransaction:", v12, (void)v16);
          if (v13)
          {
            id v14 = [v12 identifier];
            [v6 setObject:v13 forKey:v14];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    id v15 = [v6 copy];
    v4[2](v4, v7, v15);
  }
}

- (void)indexedTransactionsWithCompletion:(id)a3
{
  [(PDSearchService *)self _performQueryWithQueryString:@"contentType == com.apple.pktransaction" attributes:0 completion:a3];
}

- (void)indexedTransactionWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PKCoreSpotlightTransactionKeys();
  id v9 = PKCoreSpotlightTransactionCustomKeys();
  uint64_t v10 = [v8 arrayByAddingObjectsFromArray:v9];

  uint64_t v11 = +[NSString stringWithFormat:@"%@ == '%@'", PKCoreSpotlightCustomKeyTransactionIdentifier, v6];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1002C3C10;
  v14[3] = &unk_1007427D0;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v12 = v7;
  id v13 = v6;
  [(PDSearchService *)self _performQueryWithQueryString:v11 attributes:v10 completion:v14];
}

- (void)indexedPassesWithCompletion:(id)a3
{
  [(PDSearchService *)self _performQueryWithQueryString:@"contentType == com.apple.pkpass" attributes:0 completion:a3];
}

- (void)_performQueryWithQueryString:(id)a3 attributes:(id)a4 completion:(id)a5
{
  id v7 = (_UNKNOWN **)a4;
  id v8 = a5;
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = &off_10078C450;
  }
  id v10 = a3;
  id v11 = [objc_alloc((Class)CSSearchQuery) initWithQueryString:v10 attributes:v9];

  uint64_t v26 = PKServiceBundleIdentifier;
  id v12 = +[NSArray arrayWithObjects:&v26 count:1];
  [v11 setBundleIDs:v12];

  NSFileProtectionType v25 = NSFileProtectionCompleteUntilFirstUserAuthentication;
  id v13 = +[NSArray arrayWithObjects:&v25 count:1];
  [v11 setProtectionClasses:v13];

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1002C3FD4;
  v23[3] = &unk_10072FC20;
  id v14 = objc_alloc_init((Class)NSMutableArray);
  id v24 = v14;
  [v11 setFoundItemsHandler:v23];
  long long v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  long long v19 = sub_1002C3FE0;
  id v20 = &unk_100731538;
  id v21 = v14;
  id v22 = v8;
  id v15 = v14;
  id v16 = v8;
  [v11 setCompletionHandler:&v17];
  objc_msgSend(v11, "start", v17, v18, v19, v20);
}

- (void)accountManager:(id)a3 accountUsersChanged:(id)a4 oldUsers:(id)a5 accountIdentifier:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002C40C4;
  block[3] = &unk_10072E238;
  id v14 = v8;
  id v15 = self;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(workQueue, block);
}

- (id)createCurrentNotificationRegistrationState
{
  v2 = objc_alloc_init(PDNotificationStreamRegistrationState);
  id v3 = +[NSSet setWithObject:PDDarwinNotificationEventSignificantTimeChanged];
  [(PDNotificationStreamRegistrationState *)v2 setNotificationNames:v3 forStream:0];

  return v2;
}

- (void)handleNotificationWithName:(id)a3 event:(id)a4 forStream:(int64_t)a5
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002C4210;
  block[3] = &unk_10072E1E8;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4 oldTransaction:(id)a5
{
}

- (void)transactionSourceIdentifier:(id)a3 didRemoveTransactionWithIdentifier:(id)a4
{
}

- (void)indexingStarted
{
}

- (void)indexingCompleted
{
}

- (void)indexedItemsWithIdentifiers:(id)a3
{
}

- (void)_sendInvalidationCallback
{
  p_lockPendingInvalidationCallback = &self->_lockPendingInvalidationCallback;
  os_unfair_lock_lock(&self->_lockPendingInvalidationCallback);
  if (self->_pendingInvalidationCallback)
  {
    os_unfair_lock_unlock(p_lockPendingInvalidationCallback);
  }
  else
  {
    self->_pendingInvalidationCallback = 1;
    os_unfair_lock_unlock(p_lockPendingInvalidationCallback);
    dispatch_time_t v4 = dispatch_time(0, 3000000000);
    id v5 = PDUtilityQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002C4344;
    block[3] = &unk_10072E1E8;
    void block[4] = self;
    dispatch_after(v4, v5, block);
  }
}

- (PDDatabaseManager)databaseManager
{
  return self->_databaseManager;
}

- (void)setDatabaseManager:(id)a3
{
}

- (PDAccountManager)accountManager
{
  return self->_accountManager;
}

- (PDFamilyCircleManager)familyCircleManager
{
  return self->_familyCircleManager;
}

- (void)setFamilyCircleManager:(id)a3
{
}

- (PDSpotlightIndexer)indexer
{
  return self->_indexer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexer, 0);
  objc_storeStrong((id *)&self->_familyCircleManager, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_notificationStreamManager, 0);
  objc_storeStrong((id *)&self->_matchedTransactions, 0);
  objc_storeStrong((id *)&self->_matchedTags, 0);
  objc_storeStrong((id *)&self->_matchedPeople, 0);
  objc_storeStrong((id *)&self->_matchedLocations, 0);
  objc_storeStrong((id *)&self->_matchedMerchants, 0);
  objc_storeStrong((id *)&self->_matchedCategories, 0);
  objc_storeStrong((id *)&self->_years, 0);
  objc_storeStrong((id *)&self->_months, 0);
  objc_storeStrong((id *)&self->_weekdays, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);
  objc_storeStrong((id *)&self->_accountUsers, 0);
  objc_storeStrong((id *)&self->_currentAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_peerPaymentUniqueID, 0);
  objc_storeStrong((id *)&self->_currentTags, 0);
  objc_storeStrong((id *)&self->_currentPassUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_currentTransactionSourceIdentifiers, 0);
  objc_storeStrong((id *)&self->_currentAmount, 0);
  objc_storeStrong((id *)&self->_currentRegions, 0);
  objc_storeStrong((id *)&self->_currentTransactionSources, 0);
  objc_storeStrong((id *)&self->_currentTransactionStatuses, 0);
  objc_storeStrong((id *)&self->_currentTransactionTypes, 0);
  objc_storeStrong((id *)&self->_currentEndDate, 0);
  objc_storeStrong((id *)&self->_currentStartDate, 0);
  objc_storeStrong((id *)&self->_invertedIndex, 0);
  objc_storeStrong((id *)&self->_contactResolver, 0);
  objc_storeStrong((id *)&self->_currentQuery, 0);
  objc_storeStrong((id *)&self->_queries, 0);
  objc_storeStrong((id *)&self->_currentQueryIdentifier, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_whitelist, 0);
}

@end