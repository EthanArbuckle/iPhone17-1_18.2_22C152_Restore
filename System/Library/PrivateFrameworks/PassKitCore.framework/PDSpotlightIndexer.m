@interface PDSpotlightIndexer
+ (BOOL)isIndexingAvailable;
- (BOOL)_supportsCardInformationItemForPass:(id)a3;
- (BOOL)databaseWillRestore;
- (BOOL)hasCompletedIndexingSetup;
- (BOOL)isIndexing;
- (BOOL)performingOperation;
- (BOOL)performingOverallIndexing;
- (BOOL)resetPending;
- (BOOL)willRequireIndexing;
- (CSSearchableIndex)index;
- (FHSearchSuggestionController)suggestionsController;
- (NSCountedSet)initiatedTransactionFetches;
- (NSHashTable)observers;
- (NSMutableArray)resetCompletions;
- (OS_dispatch_queue)indexAccessQueue;
- (PDDatabaseManager)databaseManager;
- (PDPaymentWebServiceCoordinator)paymentWebServiceCoordinator;
- (PDPeerPaymentWebServiceCoordinator)peerPaymentWebServiceCoordinator;
- (PDSpotlightIndexer)initWithDatabaseManager:(id)a3 transactionReceiptFileManager:(id)a4 paymentWebServiceCoordinator:(id)a5 peerPaymentWebServiceCoordinator:(id)a6 databaseRecreated:(BOOL)a7;
- (PDTransactionReceiptFileManager)receiptFileManager;
- (PDWorldRegionAggregator)worldRegionAggregator;
- (PKCancelable)indexingOperation;
- (PKCancelable)metadataOperation;
- (PKContactResolver)contactResolver;
- (PKPassKitServicesXPCService)passKitServicesXPCService;
- (PKServicePaymentTransactionImageGenerator)imageGenerator;
- (id)_processMissingTransactionswithIdentifiers:(id)a3 spotlightItems:(id)a4 itemsToDelete:(id)a5 regions:(id *)a6 tags:(id *)a7;
- (id)featuresCompletion;
- (id)updateRegionWithIdentifier:(id)a3 localizedName:(id)a4 boundingRegion:(id *)a5 mapsIdentifier:(unint64_t)a6 providerIdentifier:(int)a7;
- (id)worldRegionAggregatorCompletion;
- (os_unfair_lock_s)lockObservers;
- (os_unfair_lock_s)lockOperation;
- (os_unfair_lock_s)lockSuggestions;
- (unint64_t)_finHealthAggregateFeatureToPaymentTransactionTagType:(id)a3;
- (unint64_t)_finHealthCompoundFeatureToPaymentTransactionTagType:(id)a3;
- (unint64_t)suggestionsControllerCounter;
- (void)_accessObserversWithHandler:(id)a3;
- (void)_checkConsistencyForItemsOfType:(unint64_t)a3 withCompletion:(id)a4;
- (void)_checkConsistencyWithCompletion:(id)a3;
- (void)_cleanupIndexingState;
- (void)_indexedItemCountsWithCompletion:(id)a3;
- (void)_indexingCompleted;
- (void)_indexingStarted;
- (void)_parseFeatureResponse:(id)a3;
- (void)_performIndexingOperationsWithOrigin:(unint64_t)a3;
- (void)_performQueryWithQueryString:(id)a3 completion:(id)a4;
- (void)_queue_completeReset;
- (void)_queue_fetchFinanceKitAccountsMetadataWithCompletion:(id)a3;
- (void)_queue_fetchFinanceKitTransactionsMetadataWithCompletion:(id)a3;
- (void)_queue_fetchPassesMetadataWithCompletion:(id)a3;
- (void)_queue_fetchTransactionsMetadataWithCompletion:(id)a3;
- (void)_queue_processAllIndexingBatchesWithCompletion:(id)a3;
- (void)_queue_processItemsToDelete:(id)a3 completion:(id)a4;
- (void)_releaseSuggestionsControllerIfNecessary;
- (void)_setupXPCActivity;
- (void)_updateFinHealthAccountEvent:(id)a3 deferFeatureComputation:(BOOL)a4 completion:(id)a5;
- (void)accessSuggestionsController:(id)a3;
- (void)accountManager:(id)a3 didAddAccount:(id)a4;
- (void)accountManager:(id)a3 didAddAccountEvent:(id)a4;
- (void)accountManager:(id)a3 didRemoveAccount:(id)a4;
- (void)accountManager:(id)a3 didUpdateAccount:(id)a4 oldAccount:(id)a5;
- (void)accountManager:(id)a3 didUpdateAccountEvent:(id)a4;
- (void)addObserver:(id)a3;
- (void)databaseRestored;
- (void)deleteAllFinHealthDataWithCompletion:(id)a3;
- (void)didUpdateFeatures:(id)a3 moreComing:(BOOL)a4 readyForNextBatch:(id)a5 error:(id)a6;
- (void)passAddedOrUpdated:(id)a3;
- (void)passDidDisappear:(id)a3;
- (void)paymentWebServiceCoordinator:(id)a3 didDownloadTransactionReceipt:(id)a4 forTransactionWithIdentifier:(id)a5;
- (void)peerPaymentAccountDidUpdate:(id)a3;
- (void)peerPaymentWebServiceCoordinator:(id)a3 didUpdateAccount:(id)a4 oldAccount:(id)a5;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)placemarkFound:(id)a3 forTransaction:(id)a4;
- (void)reindexAllContent;
- (void)reindexContentForIdentifiers:(id)a3;
- (void)removeObserver:(id)a3;
- (void)resetCoordinatesForAllRegions;
- (void)resetRegions;
- (void)resetWithCompletion:(id)a3;
- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4;
- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5;
- (void)setContactResolver:(id)a3;
- (void)setDatabaseWillRestore:(BOOL)a3;
- (void)setFeaturesCompletion:(id)a3;
- (void)setHasCompletedIndexingSetup:(BOOL)a3;
- (void)setImageGenerator:(id)a3;
- (void)setIndex:(id)a3;
- (void)setIndexingOperation:(id)a3;
- (void)setInitiatedTransactionFetches:(id)a3;
- (void)setLockObservers:(os_unfair_lock_s)a3;
- (void)setLockOperation:(os_unfair_lock_s)a3;
- (void)setLockSuggestions:(os_unfair_lock_s)a3;
- (void)setMetadataOperation:(id)a3;
- (void)setObservers:(id)a3;
- (void)setPassKitServicesXPCService:(id)a3;
- (void)setPerformingOperation:(BOOL)a3;
- (void)setPerformingOverallIndexing:(BOOL)a3;
- (void)setResetCompletions:(id)a3;
- (void)setResetPending:(BOOL)a3;
- (void)setSuggestionsController:(id)a3;
- (void)setSuggestionsControllerCounter:(unint64_t)a3;
- (void)setWillRequireIndexing:(BOOL)a3;
- (void)setWorldRegionAggregator:(id)a3;
- (void)setWorldRegionAggregatorCompletion:(id)a3;
- (void)statusWithCompletion:(id)a3;
- (void)transaction:(id)a3 associatedToWorldRegion:(id)a4;
- (void)transactionFetchCompletedForPassUniqueID:(id)a3;
- (void)transactionFetchInitiatedForPassUniqueID:(id)a3;
- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4 oldTransaction:(id)a5;
- (void)transactionSourceIdentifier:(id)a3 didRemoveTransactionWithIdentifier:(id)a4;
- (void)triggerIndexing;
- (void)worldRegionProcessingCompletedWithSuccess:(BOOL)a3;
@end

@implementation PDSpotlightIndexer

- (PDSpotlightIndexer)initWithDatabaseManager:(id)a3 transactionReceiptFileManager:(id)a4 paymentWebServiceCoordinator:(id)a5 peerPaymentWebServiceCoordinator:(id)a6 databaseRecreated:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v40.receiver = self;
  v40.super_class = (Class)PDSpotlightIndexer;
  v17 = [(PDSpotlightIndexer *)&v40 init];
  v18 = v17;
  if (v17)
  {
    v17->_databaseWillRestore = a7;
    objc_storeStrong((id *)&v17->_databaseManager, a3);
    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = dispatch_queue_attr_make_with_qos_class(v19, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v21 = dispatch_queue_create("com.apple.passd.PDSpotlightIndexer.indexAccess", v20);
    indexAccessQueue = v18->_indexAccessQueue;
    v18->_indexAccessQueue = (OS_dispatch_queue *)v21;

    *(void *)&v18->_lockOperation._os_unfair_lock_opaque = 0;
    v18->_lockSuggestions._os_unfair_lock_opaque = 0;
    uint64_t v23 = +[NSHashTable pk_weakObjectsHashTableUsingPointerPersonality];
    observers = v18->_observers;
    v18->_observers = (NSHashTable *)v23;

    v25 = [[PDWorldRegionAggregator alloc] initWithDatabaseManager:v13];
    worldRegionAggregator = v18->_worldRegionAggregator;
    v18->_worldRegionAggregator = v25;

    [(PDWorldRegionAggregator *)v18->_worldRegionAggregator addObserver:v18];
    objc_storeStrong((id *)&v18->_receiptFileManager, a4);
    v27 = +[PKPeerPaymentCounterpartHandleFormatter requiredContactKeys];
    id v28 = objc_alloc_init((Class)CNContactStore);
    v29 = (PKContactResolver *)[objc_alloc((Class)PKContactResolver) initWithContactStore:v28 keysToFetch:v27];
    contactResolver = v18->_contactResolver;
    v18->_contactResolver = v29;

    v31 = (NSCountedSet *)objc_alloc_init((Class)NSCountedSet);
    initiatedTransactionFetches = v18->_initiatedTransactionFetches;
    v18->_initiatedTransactionFetches = v31;

    objc_storeStrong((id *)&v18->_peerPaymentWebServiceCoordinator, a6);
    [(PDPeerPaymentWebServiceCoordinator *)v18->_peerPaymentWebServiceCoordinator registerObserver:v18];
    v33 = (PKPassKitServicesXPCService *)objc_alloc_init((Class)PKPassKitServicesXPCService);
    passKitServicesXPCService = v18->_passKitServicesXPCService;
    v18->_passKitServicesXPCService = v33;

    [(PDSpotlightIndexer *)v18 _cleanupIndexingState];
    if ([(id)objc_opt_class() isIndexingAvailable])
    {
      id v35 = objc_alloc((Class)CSSearchableIndex);
      v36 = (CSSearchableIndex *)[v35 initWithName:PKServiceBundleIdentifier protectionClass:NSFileProtectionCompleteUntilFirstUserAuthentication bundleIdentifier:PKServiceBundleIdentifier];
      index = v18->_index;
      v18->_index = v36;

      [(CSSearchableIndex *)v18->_index setIndexDelegate:v18];
    }
    objc_storeStrong((id *)&v18->_paymentWebServiceCoordinator, a5);
    [(PDPaymentWebServiceCoordinator *)v18->_paymentWebServiceCoordinator registerObserver:v18];
    v38 = PDDefaultQueue();
    PDScheduledActivityClientRegister();

    [(PDSpotlightIndexer *)v18 _setupXPCActivity];
  }

  return v18;
}

- (void)_setupXPCActivity
{
  v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Scheduling spotlight indexing activity", v4, 2u);
  }

  dispatch_async((dispatch_queue_t)self->_indexAccessQueue, &stru_100750DC8);
}

- (void)_cleanupIndexingState
{
  v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Cleaning up spotlight indexing state", buf, 2u);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10042FCB4;
  v8[3] = &unk_100750DF0;
  v8[4] = self;
  v4 = objc_retainBlock(v8);
  ((void (*)(void *, void, uint64_t))v4[2])(v4, 0, 6);
  ((void (*)(void *, uint64_t, uint64_t))v4[2])(v4, 4, 3);
  ((void (*)(void *, uint64_t, uint64_t))v4[2])(v4, 1, 11);
  if (PKWalletFinanceKitTransactionsEnabled())
  {
    ((void (*)(void *, uint64_t, uint64_t))v4[2])(v4, 5, 1);
    ((void (*)(void *, uint64_t, uint64_t))v4[2])(v4, 6, 1);
  }
  [(PDDatabaseManager *)self->_databaseManager resetIndexingItems];
  [(PDDatabaseManager *)self->_databaseManager resetVerifyingItems];
  if ((id)[(PDDatabaseManager *)self->_databaseManager indexingMetadataVersionForType:2] != (id)1)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Region version changed: reindexing required", buf, 2u);
    }

    [(PDDatabaseManager *)self->_databaseManager deleteAllRegions];
    [(PDDatabaseManager *)self->_databaseManager updateIndexingMetadataStatus:2 version:1 forType:2];
    os_unfair_lock_lock(&self->_lockOperation);
    self->_willRequireIndexing = 1;
    os_unfair_lock_unlock(&self->_lockOperation);
  }
  if (PDSpotlighIndexNeedsIndexing())
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Needs full reindexing", buf, 2u);
    }

    [(PDDatabaseManager *)self->_databaseManager markAllIndexedContentForReindexing];
    PDSetSpotlightIndexNeedsIndexing();
    os_unfair_lock_lock(&self->_lockOperation);
    self->_willRequireIndexing = 1;
    os_unfair_lock_unlock(&self->_lockOperation);
  }
  os_unfair_lock_lock(&self->_lockOperation);
  if (!self->_willRequireIndexing)
  {
    if ((id)[(PDDatabaseManager *)self->_databaseManager spotlightIndexingVersion] != (id)4)
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v7 = "Indexing version changed: reindexing required";
        goto LABEL_21;
      }
LABEL_22:

      self->_willRequireIndexing = 1;
      goto LABEL_23;
    }
    if (!self->_willRequireIndexing)
    {
      v5 = [(PDDatabaseManager *)self->_databaseManager batchOfActionableIndexerItemsWithCount:1];
      id v6 = [v5 count];

      if (v6 == (id)1)
      {
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v7 = "At least one item requires indexing";
LABEL_21:
          _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
          goto LABEL_22;
        }
        goto LABEL_22;
      }
    }
  }
LABEL_23:
  os_unfair_lock_unlock(&self->_lockOperation);
}

+ (BOOL)isIndexingAvailable
{
  int IsCurrentlyAvailable = PKPassbookIsCurrentlyAvailable();
  if (IsCurrentlyAvailable)
  {
    LOBYTE(IsCurrentlyAvailable) = +[CSSearchableIndex isIndexingAvailable];
  }
  return IsCurrentlyAvailable;
}

- (void)reindexAllContent
{
  unsigned __int8 v3 = [(id)objc_opt_class() isIndexingAvailable];
  v4 = PKLogFacilityTypeGetObject();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Mark all content for reindexing", v6, 2u);
    }

    [(PDDatabaseManager *)self->_databaseManager markAllIndexedContentForReindexing];
    [(PDSpotlightIndexer *)self _indexingStarted];
    [(PDSpotlightIndexer *)self _performIndexingOperationsWithOrigin:1];
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Cannot index entries. Spotlight indexing is not available.", buf, 2u);
    }
  }
}

- (void)reindexContentForIdentifiers:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(id)objc_opt_class() isIndexingAvailable];
  id v6 = PKLogFacilityTypeGetObject();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 134217984;
      id v16 = [v4 count];
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Mark %ld item(s) for reindexing", buf, 0xCu);
    }

    databaseManager = self->_databaseManager;
    v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    v11 = sub_100430140;
    v12 = &unk_100738A00;
    id v13 = v4;
    id v14 = self;
    [(PDDatabaseManager *)databaseManager performTransactionWithBlock:&v9];
    os_unfair_lock_lock(&self->_lockOperation);
    self->_willRequireIndexing = 1;
    os_unfair_lock_unlock(&self->_lockOperation);
    -[PDSpotlightIndexer _performIndexingOperationsWithOrigin:](self, "_performIndexingOperationsWithOrigin:", 1, v9, v10, v11, v12);
    id v6 = v13;
  }
  else if (v7)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Cannot index entries. Spotlight indexing is not available.", buf, 2u);
  }
}

- (void)resetWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(id)objc_opt_class() isIndexingAvailable])
  {
    p_lockOperation = &self->_lockOperation;
    os_unfair_lock_lock(&self->_lockOperation);
    resetCompletions = self->_resetCompletions;
    if (resetCompletions)
    {
      id v7 = objc_retainBlock(v4);
      [(NSMutableArray *)resetCompletions addObject:v7];

      os_unfair_lock_unlock(p_lockOperation);
    }
    else
    {
      v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      uint64_t v10 = self->_resetCompletions;
      self->_resetCompletions = v9;

      v11 = self->_resetCompletions;
      id v12 = objc_retainBlock(v4);
      [(NSMutableArray *)v11 addObject:v12];

      os_unfair_lock_unlock(&self->_lockOperation);
      [(PDSpotlightIndexer *)self _indexingStarted];
      indexAccessQueue = self->_indexAccessQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10043047C;
      block[3] = &unk_10072E1E8;
      block[4] = self;
      dispatch_async(indexAccessQueue, block);
    }
  }
  else
  {
    v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Cannot delete index entries. Spotlight indexing is not available.", buf, 2u);
    }
  }
}

- (void)_queue_completeReset
{
  p_lockOperation = &self->_lockOperation;
  os_unfair_lock_lock(&self->_lockOperation);
  self->_performingOperation = 1;
  self->_hasCompletedIndexingSetup = 0;
  os_unfair_lock_unlock(p_lockOperation);
  [(PDDatabaseManager *)self->_databaseManager resetIndexedContent];
  index = self->_index;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1004305F0;
  v5[3] = &unk_10072F6E8;
  v5[4] = self;
  [(CSSearchableIndex *)index deleteAllSearchableItemsWithCompletionHandler:v5];
}

- (void)triggerIndexing
{
}

- (BOOL)willRequireIndexing
{
  p_lockOperation = &self->_lockOperation;
  os_unfair_lock_lock(&self->_lockOperation);
  if (self->_willRequireIndexing) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = [(PDWorldRegionAggregator *)self->_worldRegionAggregator willRequireProcessing];
  }
  os_unfair_lock_unlock(p_lockOperation);
  return v4;
}

- (BOOL)isIndexing
{
  v2 = self;
  p_lockOperation = &self->_lockOperation;
  os_unfair_lock_lock(&self->_lockOperation);
  LOBYTE(v2) = v2->_performingOverallIndexing;
  os_unfair_lock_unlock(p_lockOperation);
  return (char)v2;
}

- (void)_indexingStarted
{
  p_lockOperation = &self->_lockOperation;
  os_unfair_lock_lock(&self->_lockOperation);
  BOOL performingOverallIndexing = self->_performingOverallIndexing;
  self->_BOOL performingOverallIndexing = 1;
  os_unfair_lock_unlock(p_lockOperation);
  if (!performingOverallIndexing)
  {
    [(PDSpotlightIndexer *)self _accessObserversWithHandler:&stru_100750E30];
  }
}

- (void)_indexingCompleted
{
  p_lockOperation = &self->_lockOperation;
  os_unfair_lock_lock(&self->_lockOperation);
  BOOL performingOverallIndexing = self->_performingOverallIndexing;
  self->_BOOL performingOverallIndexing = 0;
  self->_willRequireIndexing = 0;
  os_unfair_lock_unlock(p_lockOperation);
  if (performingOverallIndexing)
  {
    [(PDSpotlightIndexer *)self _accessObserversWithHandler:&stru_100750E50];
  }
}

- (void)_checkConsistencyWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Marking any missing items as needing reindexing...", buf, 2u);
  }

  *(void *)buf = 0;
  uint64_t v23 = buf;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = [&off_10078C588 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v19;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(&off_10078C588);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_100430C74;
        v17[3] = &unk_100730730;
        v17[4] = self;
        v17[5] = v10;
        v17[6] = buf;
        [v5 addOperation:v17];
      }
      id v7 = [&off_10078C588 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v7);
  }
  v11 = +[NSNull null];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100430D80;
  v14[3] = &unk_10073DAA0;
  id v16 = buf;
  id v12 = v4;
  id v15 = v12;
  id v13 = [v5 evaluateWithInput:v11 completion:v14];

  _Block_object_dispose(buf, 8);
}

- (void)_checkConsistencyForItemsOfType:(unint64_t)a3 withCompletion:(id)a4
{
  id v6 = (void (**)(id, void))a4;
  id v7 = [(PDDatabaseManager *)self->_databaseManager indexerItemCountsOfType:a3];
  uint64_t v8 = [v7 objectForKeyedSubscript:&off_10078B9D0];
  id v9 = [v8 unsignedIntegerValue];

  [(PDDatabaseManager *)self->_databaseManager markAllIndexedContentForVerifyingOfType:a3];
  if (a3 == 4)
  {
    uint64_t v10 = (id *)&PKPassDetailDataTypeIdentifier;
  }
  else if (a3 == 1)
  {
    uint64_t v10 = (id *)&PKTransactionDataTypeIdentifier;
  }
  else
  {
    if (a3)
    {
      v6[2](v6, 0);
      goto LABEL_9;
    }
    uint64_t v10 = (id *)&PKPassDataTypeIdentifier;
  }
  id v11 = *v10;
  id v12 = objc_alloc((Class)CSSearchQuery);
  id v13 = +[NSString stringWithFormat:@"contentType == %@", v11];
  id v14 = [v12 initWithQueryString:v13 attributes:0];

  uint64_t v29 = PKServiceBundleIdentifier;
  id v15 = +[NSArray arrayWithObjects:&v29 count:1];
  [v14 setBundleIDs:v15];

  NSFileProtectionType v28 = NSFileProtectionCompleteUntilFirstUserAuthentication;
  id v16 = +[NSArray arrayWithObjects:&v28 count:1];
  [v14 setProtectionClasses:v16];

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1004311B8;
  v25[3] = &unk_100750E78;
  v25[4] = self;
  unint64_t v27 = a3;
  id v17 = v11;
  id v26 = v17;
  [v14 setFoundItemsHandler:v25];
  objc_initWeak(&location, v14);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100431488;
  v19[3] = &unk_100750EA0;
  objc_copyWeak(v23, &location);
  v23[1] = v9;
  id v18 = v17;
  id v20 = v18;
  long long v21 = self;
  v23[2] = (id)a3;
  v22 = v6;
  [v14 setCompletionHandler:v19];
  [v14 start];

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);

LABEL_9:
}

- (void)_performIndexingOperationsWithOrigin:(unint64_t)a3
{
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Performing indexing operations with origin %lu", (uint8_t *)&buf, 0xCu);
  }

  unsigned __int8 v6 = [(PDSpotlightIndexer *)self willRequireIndexing];
  os_unfair_lock_lock(&self->_lockOperation);
  if (self->_performingOperation)
  {
    os_unfair_lock_unlock(&self->_lockOperation);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Indexing operations cancelled, we're already performing operations", (uint8_t *)&buf, 2u);
    }
  }
  else
  {
    self->_performingOperation = 1;
    os_unfair_lock_unlock(&self->_lockOperation);
    if (v6) {
      [(PDSpotlightIndexer *)self _indexingStarted];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Indexing operation pending", (uint8_t *)&buf, 2u);
    }

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v21 = 0x3032000000;
    v22 = sub_100020DCC;
    uint64_t v23 = sub_1000211D8;
    id v24 = (id)PDOSTransactionCreate("PDSpotlightIndexer.indexing");
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1004318F0;
    v19[3] = &unk_100750F30;
    v19[5] = &buf;
    v19[6] = a3;
    void v19[4] = self;
    id v7 = objc_retainBlock(v19);
    uint64_t v8 = v7;
    if (a3 == 2)
    {
      indexAccessQueue = self->_indexAccessQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100432F84;
      block[3] = &unk_10072F788;
      uint64_t v10 = (id *)&v18;
      id v18 = v7;
      id v11 = v7;
      dispatch_async(indexAccessQueue, block);
    }
    else
    {
      dispatch_time_t v12 = dispatch_time(0, 5000000000);
      id v13 = self->_indexAccessQueue;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100432F94;
      v15[3] = &unk_10072F788;
      uint64_t v10 = &v16;
      id v16 = v8;
      id v14 = v8;
      dispatch_after(v12, v13, v15);
    }

    _Block_object_dispose(&buf, 8);
  }
}

- (void)statusWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockOperation);
    BOOL v5 = self->_metadataOperation != 0;
    BOOL v6 = self->_indexingOperation != 0;
    os_unfair_lock_unlock(&self->_lockOperation);
    v33 = [(PDDatabaseManager *)self->_databaseManager indexerItemCountsOfType:0];
    v31 = [(PDDatabaseManager *)self->_databaseManager indexerItemCountsOfType:4];
    v30 = [(PDDatabaseManager *)self->_databaseManager indexerItemCountsOfType:1];
    uint64_t v29 = [(PDDatabaseManager *)self->_databaseManager indexerItemCountsOfType:5];
    NSFileProtectionType v28 = [(PDDatabaseManager *)self->_databaseManager indexerItemCountsOfType:6];
    id v7 = +[NSLocale currentLocale];
    uint64_t v8 = [v7 localeIdentifier];

    id v9 = [(PDDatabaseManager *)self->_databaseManager regionsMissingLocalizedContentForLocaleIdentifier:v8];
    id v27 = [v9 count];

    uint64_t v10 = [(PDDatabaseManager *)self->_databaseManager regionsOfType:0 localeIdentifier:v8];
    id v26 = [v10 count];

    id v11 = [(PDDatabaseManager *)self->_databaseManager regionsOfType:1 localeIdentifier:v8];
    id v25 = [v11 count];

    dispatch_time_t v12 = [(PDDatabaseManager *)self->_databaseManager regionsOfType:2 localeIdentifier:v8];
    v32 = v4;
    id v13 = [v12 count];

    id v14 = [(PDDatabaseManager *)self->_databaseManager regionsOfType:3 localeIdentifier:v8];
    id v24 = [v14 count];

    id v15 = [(PDDatabaseManager *)self->_databaseManager regionsOfType:4 localeIdentifier:v8];
    id v16 = [v15 count];

    id v17 = [(PDDatabaseManager *)self->_databaseManager transactionsMissingWorldRegionWithLimit:0 onlyEligibleForProcessing:0];
    id v18 = [v17 count];

    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1004332B4;
    v34[3] = &unk_100750F58;
    BOOL v48 = v5;
    BOOL v49 = v6;
    id v35 = v33;
    id v36 = v31;
    id v37 = v30;
    id v38 = v29;
    id v39 = v28;
    id v41 = v26;
    id v42 = v25;
    id v43 = v13;
    id v4 = v32;
    id v44 = v24;
    id v45 = v16;
    id v46 = v27;
    id v47 = v18;
    id v40 = v32;
    id v19 = v28;
    id v20 = v29;
    id v21 = v30;
    id v22 = v31;
    id v23 = v33;
    [(PDSpotlightIndexer *)self _indexedItemCountsWithCompletion:v34];
  }
}

- (void)_indexedItemCountsWithCompletion:(id)a3
{
  id v4 = a3;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v27[3] = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v26[3] = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v25[3] = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  id v23[3] = sub_100020DCC;
  v23[4] = sub_1000211D8;
  id v24 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1004339B4;
  v16[3] = &unk_100750FD0;
  id v5 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
  id v17 = v5;
  id v18 = self;
  id v19 = v27;
  id v20 = v26;
  id v21 = v25;
  id v22 = v23;
  BOOL v6 = objc_retainBlock(v16);
  ((void (*)(void *, void, uint64_t))v6[2])(v6, PKTransactionDataTypeIdentifier, 1);
  ((void (*)(void *, void, void))v6[2])(v6, PKPassDataTypeIdentifier, 0);
  ((void (*)(void *, void, uint64_t))v6[2])(v6, PKPassDetailDataTypeIdentifier, 4);
  id v7 = +[NSNull null];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100433C24;
  v10[3] = &unk_100750FF8;
  id v8 = v4;
  id v11 = v8;
  dispatch_time_t v12 = v27;
  id v13 = v26;
  id v14 = v25;
  id v15 = v23;
  id v9 = [v5 evaluateWithInput:v7 completion:v10];

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v27, 8);
}

- (void)_performQueryWithQueryString:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [objc_alloc((Class)CSSearchQuery) initWithQueryString:v5 attributes:0];
  uint64_t v19 = PKServiceBundleIdentifier;
  id v8 = +[NSArray arrayWithObjects:&v19 count:1];
  [v7 setBundleIDs:v8];

  NSFileProtectionType v18 = NSFileProtectionCompleteUntilFirstUserAuthentication;
  id v9 = +[NSArray arrayWithObjects:&v18 count:1];
  [v7 setProtectionClasses:v9];

  objc_initWeak(&location, v7);
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  id v13 = sub_100433E30;
  id v14 = &unk_100751020;
  objc_copyWeak(&v16, &location);
  id v10 = v6;
  id v15 = v10;
  [v7 setCompletionHandler:&v11];
  objc_msgSend(v7, "start", v11, v12, v13, v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)resetRegions
{
  [(PDDatabaseManager *)self->_databaseManager deleteAllRegions];
  os_unfair_lock_lock(&self->_lockOperation);
  *(_WORD *)&self->_hasCompletedIndexingSetup = 256;
  unsigned __int8 v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Region reset requested.", v4, 2u);
  }

  os_unfair_lock_unlock(&self->_lockOperation);
  [(PDSpotlightIndexer *)self resetWithCompletion:&stru_100751040];
}

- (void)resetCoordinatesForAllRegions
{
  [(PDDatabaseManager *)self->_databaseManager resetCoordinatesForAllRegions];
  os_unfair_lock_lock(&self->_lockOperation);
  self->_hasCompletedIndexingSetup = 0;
  os_unfair_lock_unlock(&self->_lockOperation);
}

- (void)_queue_fetchPassesMetadataWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  unint64_t v23 = 0;
  unint64_t v23 = [(PDDatabaseManager *)self->_databaseManager indexingMetadataStatusForType:0];
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  unint64_t v19 = 0;
  unint64_t v19 = [(PDDatabaseManager *)self->_databaseManager indexingMetadataStatusForType:4];
  uint64_t v5 = v21[3];
  BOOL v6 = v5 == 0;
  id v7 = v17;
  uint64_t v8 = v17[3];
  BOOL v9 = v8 == 0;
  if (v5 && v8)
  {
    v21[3] = 2;
    v7[3] = 2;
  }
  else
  {
    [(PDSpotlightIndexer *)self _indexingStarted];
    databaseManager = self->_databaseManager;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1004341C4;
    v12[3] = &unk_100751068;
    BOOL v14 = v6;
    v12[4] = self;
    v12[5] = &v20;
    BOOL v15 = v9;
    v12[6] = &v16;
    long long v13 = xmmword_1005B3B00;
    [(PDDatabaseManager *)databaseManager performTransactionWithBlock:v12];
  }
  if (v4)
  {
    uint64_t v11 = v21[3];
    if (v11 == 2) {
      uint64_t v11 = v17[3];
    }
    v4[2](v4, v11);
  }
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
}

- (void)_queue_fetchFinanceKitTransactionsMetadataWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id, uint64_t))a3 + 2))(a3, 2);
  }
}

- (void)_queue_fetchFinanceKitAccountsMetadataWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id, uint64_t))a3 + 2))(a3, 2);
  }
}

- (void)_queue_fetchTransactionsMetadataWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x2020000000;
  unint64_t v15 = 0;
  unint64_t v15 = [(PDDatabaseManager *)self->_databaseManager indexingMetadataStatusForType:1];
  if (v13[3])
  {
    v13[3] = 2;
    if (v4) {
      v4[2](v4, 2);
    }
  }
  else
  {
    [(PDSpotlightIndexer *)self _indexingStarted];
    uint64_t v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating transactions metadata", buf, 2u);
    }

    v13[3] = 1;
    [(PDDatabaseManager *)self->_databaseManager updateIndexingMetadataStatus:1 version:11 forType:1];
    databaseManager = self->_databaseManager;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10043475C;
    v7[3] = &unk_100751090;
    v7[4] = self;
    BOOL v9 = &v12;
    uint64_t v10 = 11;
    uint64_t v8 = v4;
    [(PDDatabaseManager *)databaseManager allPassTransactionIdentifiersWithBatchHandler:v7];
  }
  _Block_object_dispose(&v12, 8);
}

- (void)_queue_processAllIndexingBatchesWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  v63 = self;
  BOOL v6 = [(PDDatabaseManager *)self->_databaseManager batchOfActionableIndexerItemsWithCount:20];
  id v7 = [v6 count];
  uint64_t v8 = PKLogFacilityTypeGetObject();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    v58 = v5;
    v59 = v4;
    if (v9)
    {
      *(_DWORD *)long long buf = 134217984;
      *(void *)&uint8_t buf[4] = [v6 count];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Processing batch of %lu items", buf, 0xCu);
    }

    id v10 = objc_alloc_init((Class)NSMutableArray);
    id v11 = objc_alloc_init((Class)NSMutableSet);
    id v55 = objc_alloc_init((Class)NSMutableSet);
    id v52 = objc_alloc_init((Class)NSMutableSet);
    id v60 = objc_alloc_init((Class)NSMutableDictionary);
    id v54 = objc_alloc_init((Class)NSMutableDictionary);
    id v51 = objc_alloc_init((Class)NSMutableDictionary);
    id v61 = objc_alloc_init((Class)NSMutableArray);
    id v62 = objc_alloc_init((Class)NSMutableArray);
    long long v99 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    v57 = v6;
    id v12 = v6;
    id v13 = [v12 countByEnumeratingWithState:&v99 objects:v105 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v100;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v100 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(void **)(*((void *)&v99 + 1) + 8 * (void)v16);
          if ([v17 status])
          {
            if ([v17 status] != (id)3) {
              goto LABEL_17;
            }
            uint64_t v18 = v61;
            goto LABEL_16;
          }
          id v19 = [v17 type];
          if (v19 == (id)4) {
            goto LABEL_15;
          }
          if (v19 != (id)1)
          {
            if (v19) {
              goto LABEL_17;
            }
LABEL_15:
            uint64_t v18 = v10;
LABEL_16:
            [v18 addObject:v17];
            goto LABEL_17;
          }
          uint64_t v20 = [v17 uniqueIdentifier];
          id v21 = +[PKCoreSpotlightUtilities transactionIdentifierFromSpotlightIdentifier:v20];

          [v60 setObject:v17 forKey:v21];
          [v11 addObject:v21];

LABEL_17:
          uint64_t v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        id v22 = [v12 countByEnumeratingWithState:&v99 objects:v105 count:16];
        id v14 = v22;
      }
      while (v22);
    }

    id v23 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
    id v24 = objc_alloc_init((Class)NSMutableArray);
    id v25 = objc_alloc_init((Class)NSMutableArray);
    if ([v10 count])
    {
      context = v11;
      long long v97 = 0u;
      long long v98 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      id v26 = v10;
      id v27 = [v26 countByEnumeratingWithState:&v95 objects:v104 count:16];
      if (v27)
      {
        id v28 = v27;
        uint64_t v29 = *(void *)v96;
        do
        {
          for (i = 0; i != v28; i = (char *)i + 1)
          {
            if (*(void *)v96 != v29) {
              objc_enumerationMutation(v26);
            }
            uint64_t v31 = *(void *)(*((void *)&v95 + 1) + 8 * i);
            v91[0] = _NSConcreteStackBlock;
            v91[1] = 3221225472;
            v91[2] = sub_1004352A0;
            v91[3] = &unk_100733B00;
            v91[4] = v31;
            v91[5] = v63;
            id v92 = v24;
            id v93 = v62;
            id v94 = v25;
            [v23 addOperation:v91];
          }
          id v28 = [v26 countByEnumeratingWithState:&v95 objects:v104 count:16];
        }
        while (v28);
      }

      id v11 = context;
    }
    if ([v11 count])
    {
      *(void *)long long buf = 0;
      id v90 = 0;
      v32 = [(PDSpotlightIndexer *)v63 _processMissingTransactionswithIdentifiers:v11 spotlightItems:v60 itemsToDelete:v61 regions:buf tags:&v90];
      long long v86 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      id v33 = [v32 countByEnumeratingWithState:&v86 objects:v103 count:16];
      if (v33)
      {
        id v34 = v33;
        uint64_t v35 = *(void *)v87;
        do
        {
          for (j = 0; j != v34; j = (char *)j + 1)
          {
            if (*(void *)v87 != v35) {
              objc_enumerationMutation(v32);
            }
            uint64_t v37 = *(void *)(*((void *)&v86 + 1) + 8 * (void)j);
            v77[0] = _NSConcreteStackBlock;
            v77[1] = 3221225472;
            v77[2] = sub_10043587C;
            v77[3] = &unk_100751108;
            v77[4] = v37;
            id v78 = v60;
            v79 = v63;
            id v80 = *(id *)buf;
            id v81 = v90;
            id v82 = v24;
            id v83 = v62;
            id v84 = v25;
            id v85 = v61;
            [v23 addOperation:v77];
          }
          id v34 = [v32 countByEnumeratingWithState:&v86 objects:v103 count:16];
        }
        while (v34);
      }
    }
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472;
    v68[2] = sub_100435FD8;
    v68[3] = &unk_100751108;
    v68[4] = v63;
    id v69 = v62;
    id v70 = v51;
    id v71 = v54;
    id v72 = v10;
    id v73 = v55;
    id v74 = v52;
    id v75 = v24;
    id v76 = v25;
    id contextb = v25;
    id v47 = v24;
    id v53 = v52;
    id v56 = v55;
    id v38 = v10;
    id v39 = v54;
    id v40 = v51;
    id v41 = v11;
    id v42 = v62;
    [v23 addOperation:v68];
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472;
    v66[2] = sub_1004369E4;
    v66[3] = &unk_100731CB8;
    v66[4] = v63;
    id v67 = v61;
    id v43 = v61;
    [v23 addOperation:v66];
    id v44 = +[NSNull null];
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = sub_100436AC8;
    v64[3] = &unk_100747FA8;
    v64[4] = v63;
    id v4 = v59;
    v65 = v59;
    uint64_t v45 = [v23 evaluateWithInput:v44 completion:v64];
    indexingOperation = v63->_indexingOperation;
    v63->_indexingOperation = (PKCancelable *)v45;

    BOOL v6 = v57;
    uint64_t v5 = v58;
  }
  else
  {
    if (v9)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "No items to process", buf, 2u);
    }

    if (v4) {
      v4[2](v4);
    }
  }
}

- (void)_queue_processItemsToDelete:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = sub_100020DCC;
  uint64_t v29 = sub_1000211D8;
  id v8 = v6;
  id v30 = v8;
  if ([(id)v26[5] count])
  {
    BOOL v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(id)v26[5] count];
      *(_DWORD *)long long buf = 134217984;
      id v33 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Deleting %lu items", buf, 0xCu);
    }

    id v11 = objc_alloc_init((Class)NSMutableArray);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v12 = (id)v26[5];
    id v13 = [v12 countByEnumeratingWithState:&v21 objects:v31 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v22;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v12);
          }
          uint64_t v16 = [*(id *)(*((void *)&v21 + 1) + 8 * (void)v15) uniqueIdentifier];
          [v11 addObject:v16];

          uint64_t v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [v12 countByEnumeratingWithState:&v21 objects:v31 count:16];
      }
      while (v13);
    }

    index = self->_index;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100436EC8;
    v18[3] = &unk_1007511A8;
    v18[4] = self;
    uint64_t v20 = &v25;
    id v19 = v7;
    [(CSSearchableIndex *)index deleteSearchableItemsWithIdentifiers:v11 completionHandler:v18];
  }
  else if (v7)
  {
    v7[2](v7);
  }
  _Block_object_dispose(&v25, 8);
}

- (id)_processMissingTransactionswithIdentifiers:(id)a3 spotlightItems:(id)a4 itemsToDelete:(id)a5 regions:(id *)a6 tags:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v26 = [(PDDatabaseManager *)self->_databaseManager paymentTransactionsWithIdentifiers:v12 regions:a6 tags:a7];
  id v15 = objc_msgSend(v26, "pk_createSetByApplyingBlock:", &stru_1007511E8);
  id v28 = v12;
  id v16 = [v12 mutableCopy];
  uint64_t v27 = v15;
  [v16 minusSet:v15];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v17 = v16;
  id v18 = [v17 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v30;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v30 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        long long v23 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          uint64_t v34 = v22;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Transaction %@ no longer exists, delete from indexing", buf, 0xCu);
        }

        long long v24 = [v13 objectForKey:v22];
        if (v24)
        {
          [v14 addObject:v24];
        }
        else
        {
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            uint64_t v34 = v22;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Transaction %@ not matched to a spotlight item, could not delete", buf, 0xCu);
          }
        }
      }
      id v19 = [v17 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v19);
  }

  return v26;
}

- (BOOL)_supportsCardInformationItemForPass:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 paymentPass];

  if (v5)
  {
    id v6 = [v4 paymentPass];
    databaseManager = self->_databaseManager;
    id v8 = [v6 associatedAccountServiceAccountIdentifier];
    BOOL v9 = [(PDDatabaseManager *)databaseManager accountWithIdentifier:v8];

    if ([v9 feature] == (id)2) {
      unsigned __int8 v10 = [v9 supportsShowVirtualCard];
    }
    else {
      unsigned __int8 v10 = 0;
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (void)passAddedOrUpdated:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(id)objc_opt_class() isIndexingAvailable];
  if (v4 && v5)
  {
    id v6 = [v4 uniqueID];
    id v7 = +[PKCoreSpotlightUtilities spotlightIdentifierForPassUniqueIdentifier:v6];

    databaseManager = self->_databaseManager;
    BOOL v9 = [v4 groupingID];
    [(PDDatabaseManager *)databaseManager insertOrUpdateIndexerItemWithIdentifier:v7 domainIdentifier:v9 searchableItemData:0 type:0 status:0 error:0];

    indexAccessQueue = self->_indexAccessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1004377A4;
    block[3] = &unk_10072E238;
    id v11 = v4;
    id v24 = v11;
    uint64_t v25 = self;
    id v12 = v7;
    id v26 = v12;
    dispatch_async(indexAccessQueue, block);
    if ([(PDSpotlightIndexer *)self _supportsCardInformationItemForPass:v11])
    {
      id v13 = [v11 uniqueID];
      id v14 = +[PKCoreSpotlightUtilities spotlightIdentifierForCardInformationUniqueIdentifier:v13];

      id v15 = self->_databaseManager;
      id v16 = [v11 groupingID];
      [(PDDatabaseManager *)v15 insertOrUpdateIndexerItemWithIdentifier:v14 domainIdentifier:v16 searchableItemData:0 type:4 status:0 error:0];

      id v17 = self->_indexAccessQueue;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1004379C8;
      v19[3] = &unk_10072E238;
      id v20 = v11;
      long long v21 = self;
      id v22 = v14;
      id v18 = v14;
      dispatch_async(v17, v19);
    }
  }
}

- (void)passDidDisappear:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(id)objc_opt_class() isIndexingAvailable];
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109378;
    *(_DWORD *)id v40 = v5;
    *(_WORD *)&v40[4] = 2112;
    *(void *)&v40[6] = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PDSpotlightIndexer passDidDisappear isIndexingAvailable: %d; pass: %@",
      buf,
      0x12u);
  }

  if (v4)
  {
    id v7 = [v4 paymentPass];
    id v8 = objc_alloc((Class)NSMutableSet);
    BOOL v9 = [v7 deviceTransactionSourceIdentifiers];
    id v10 = [v8 initWithSet:v9];

    id v11 = [v7 associatedAccountServiceAccountIdentifier];
    if ([v11 length])
    {
      unsigned int v30 = v5;
      long long v31 = v11;
      id v12 = [(PDDatabaseManager *)self->_databaseManager accountUsersForAccountWithIdentifier:v11];
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v13 = [v12 countByEnumeratingWithState:&v35 objects:v41 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v36;
        do
        {
          id v16 = 0;
          do
          {
            if (*(void *)v36 != v15) {
              objc_enumerationMutation(v12);
            }
            id v17 = [*(id *)(*((void *)&v35 + 1) + 8 * (void)v16) transactionSourceIdentifiers];
            [v10 unionSet:v17];

            id v16 = (char *)v16 + 1;
          }
          while (v14 != v16);
          id v14 = [v12 countByEnumeratingWithState:&v35 objects:v41 count:16];
        }
        while (v14);
      }

      id v11 = v31;
      unsigned int v5 = v30;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      *(void *)id v40 = v7;
      *(_WORD *)&v40[8] = 2112;
      *(void *)&v40[10] = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PDSpotlightIndexer passDidDisappear paymentPass: %@; transactionSourceIdentifiers: %@",
        buf,
        0x16u);
    }

    if (v7)
    {
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_100438010;
      v32[3] = &unk_100751238;
      id v33 = v10;
      id v34 = v7;
      [(PDSpotlightIndexer *)self accessSuggestionsController:v32];
    }
    if (v5)
    {
      id v18 = [v4 uniqueID];
      id v19 = +[PKCoreSpotlightUtilities spotlightIdentifierForPassUniqueIdentifier:v18];

      databaseManager = self->_databaseManager;
      long long v21 = [v4 groupingID];
      [(PDDatabaseManager *)databaseManager insertOrUpdateIndexerItemWithIdentifier:v19 domainIdentifier:v21 searchableItemData:0 type:0 status:3 error:0];

      id v22 = self->_databaseManager;
      long long v23 = [v4 uniqueID];
      [(PDDatabaseManager *)v22 updateIndexerItemsWithDomainIdentifier:v23 type:1 status:3 error:0];

      if (PKWalletFinanceKitTransactionsEnabled())
      {
        id v24 = self->_databaseManager;
        uint64_t v25 = [v4 uniqueID];
        [(PDDatabaseManager *)v24 updateIndexerItemsWithDomainIdentifier:v25 type:5 status:3 error:0];
      }
      id v26 = [v4 uniqueID];
      uint64_t v27 = +[PKCoreSpotlightUtilities spotlightIdentifierForCardInformationUniqueIdentifier:v26];

      id v28 = self->_databaseManager;
      long long v29 = [v4 groupingID];
      [(PDDatabaseManager *)v28 insertOrUpdateIndexerItemWithIdentifier:v27 domainIdentifier:v29 searchableItemData:0 type:4 status:3 error:0];

      [(PDSpotlightIndexer *)self _performIndexingOperationsWithOrigin:1];
    }
  }
}

- (void)transactionFetchInitiatedForPassUniqueID:(id)a3
{
  id v5 = a3;
  unsigned int v4 = [(id)objc_opt_class() isIndexingAvailable];
  if (v5 && v4)
  {
    os_unfair_lock_lock(&self->_lockSuggestions);
    [(NSCountedSet *)self->_initiatedTransactionFetches addObject:v5];
    os_unfair_lock_unlock(&self->_lockSuggestions);
  }
}

- (void)transactionFetchCompletedForPassUniqueID:(id)a3
{
  id v4 = a3;
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PDSpotlightIndexer transactionFetchCompletedForPassUniqueID: %@", buf, 0xCu);
  }

  unsigned int v6 = [(id)objc_opt_class() isIndexingAvailable];
  if (v4 && v6)
  {
    id v7 = [(PDDatabaseManager *)self->_databaseManager associatedAccountIdentifierForPassWithUniqueIdentifier:v4];

    if (v7)
    {
      id v8 = [(PDDatabaseManager *)self->_databaseManager dbPeerPaymentAccount];
      BOOL v9 = [v8 associatedPassUniqueID];

      if (v9) {
        [(PDDatabaseManager *)self->_databaseManager updateIndexerItemsWithDomainIdentifier:v9 type:1 status:0 error:0];
      }
    }
    os_unfair_lock_lock(&self->_lockSuggestions);
    [(NSCountedSet *)self->_initiatedTransactionFetches removeObject:v4];
    os_unfair_lock_unlock(&self->_lockSuggestions);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10043841C;
    v10[3] = &unk_100751260;
    void v10[4] = self;
    [(PDSpotlightIndexer *)self accessSuggestionsController:v10];
  }
}

- (void)transactionSourceIdentifier:(id)a3 didRemoveTransactionWithIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = [(PDDatabaseManager *)self->_databaseManager passUniqueIdentifierForTransactionSourceIdentifier:a3 includingAccountUsers:1];
  unsigned int v8 = [(id)objc_opt_class() isIndexingAvailable];
  if (v6 && v8 && v7)
  {
    BOOL v9 = +[PKCoreSpotlightUtilities spotlightIdentifierForTransactionIdentifier:v6];
    [(PDDatabaseManager *)self->_databaseManager insertOrUpdateIndexerItemWithIdentifier:v9 domainIdentifier:v7 searchableItemData:0 type:1 status:3 error:0];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1004385B4;
    v10[3] = &unk_100751260;
    id v11 = v6;
    [(PDSpotlightIndexer *)self accessSuggestionsController:v10];
    [(PDSpotlightIndexer *)self _performIndexingOperationsWithOrigin:1];
  }
}

- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4 oldTransaction:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(PDDatabaseManager *)self->_databaseManager passUniqueIdentifierForTransactionSourceIdentifier:v8 includingAccountUsers:1];
  unsigned int v12 = [(id)objc_opt_class() isIndexingAvailable];
  if (v9 && v12 && v11)
  {
    id v13 = [v9 identifier];
    id v14 = +[PKCoreSpotlightUtilities spotlightIdentifierForTransactionIdentifier:v13];

    [(PDDatabaseManager *)self->_databaseManager insertOrUpdateIndexerItemWithIdentifier:v14 domainIdentifier:v11 searchableItemData:0 type:1 status:0 error:0];
    os_unfair_lock_lock(&self->_lockOperation);
    self->_hasCompletedIndexingSetup = 0;
    os_unfair_lock_unlock(&self->_lockOperation);
    [(PDWorldRegionAggregator *)self->_worldRegionAggregator transactionSourceIdentifier:v8 didReceiveTransaction:v9 oldTransaction:v10];
    LOBYTE(v13) = [v9 updateReasonIsInitialDownload];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100438968;
    v22[3] = &unk_10072F078;
    char v23 = (char)v13;
    v22[4] = self;
    uint64_t v15 = objc_retainBlock(v22);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100438980;
    v17[3] = &unk_1007512B0;
    char v21 = (char)v13;
    id v18 = v9;
    id v19 = self;
    id v20 = v15;
    id v16 = v15;
    [(PDSpotlightIndexer *)self accessSuggestionsController:v17];
  }
}

- (void)accountManager:(id)a3 didAddAccountEvent:(id)a4
{
  id v5 = a4;
  id v6 = [v5 updateReasonIsInitialDownload];
  if ([v5 type] == (id)4)
  {
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Added Account Event of type dispute", buf, 2u);
    }

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100438CD4;
    v8[3] = &unk_10072F078;
    char v9 = (char)v6;
    v8[4] = self;
    [(PDSpotlightIndexer *)self _updateFinHealthAccountEvent:v5 deferFeatureComputation:v6 completion:v8];
  }
}

- (void)accountManager:(id)a3 didUpdateAccountEvent:(id)a4
{
  id v5 = a4;
  id v6 = [v5 updateReasonIsInitialDownload];
  if ([v5 type] == (id)4)
  {
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Updated Account Event of type dispute", buf, 2u);
    }

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100438DE8;
    v8[3] = &unk_10072F078;
    char v9 = (char)v6;
    v8[4] = self;
    [(PDSpotlightIndexer *)self _updateFinHealthAccountEvent:v5 deferFeatureComputation:v6 completion:v8];
  }
}

- (void)accountManager:(id)a3 didAddAccount:(id)a4
{
  id v5 = a4;
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 accountIdentifier];
    int v8 = 138412290;
    char v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PDSpotlightIndexer: Received received add account: %@", (uint8_t *)&v8, 0xCu);
  }
  [(PDSpotlightIndexer *)self _processAccountUpdate:v5 didRemove:0];
}

- (void)accountManager:(id)a3 didUpdateAccount:(id)a4 oldAccount:(id)a5
{
  id v6 = a4;
  id v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = [v6 accountIdentifier];
    int v9 = 138412290;
    id v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PDSpotlightIndexer: Received received update account: %@", (uint8_t *)&v9, 0xCu);
  }
  [(PDSpotlightIndexer *)self _processAccountUpdate:v6 didRemove:0];
}

- (void)accountManager:(id)a3 didRemoveAccount:(id)a4
{
  id v5 = a4;
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 accountIdentifier];
    int v8 = 138412290;
    int v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PDSpotlightIndexer: Received received remove account: %@", (uint8_t *)&v8, 0xCu);
  }
  [(PDSpotlightIndexer *)self _processAccountUpdate:v5 didRemove:1];
}

- (void)peerPaymentAccountDidUpdate:(id)a3
{
  id v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [a3 identifier];
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PDSpotlightIndexer: Received received update peer payment account: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)paymentWebServiceCoordinator:(id)a3 didDownloadTransactionReceipt:(id)a4 forTransactionWithIdentifier:(id)a5
{
  id v9 = a5;
  int v6 = [(PDDatabaseManager *)self->_databaseManager passUniqueIdentifierForTransactionWithIdentifier:v9];
  unsigned int v7 = [(id)objc_opt_class() isIndexingAvailable];
  if (v9 && v7 && v6)
  {
    int v8 = +[PKCoreSpotlightUtilities spotlightIdentifierForTransactionIdentifier:v9];
    [(PDDatabaseManager *)self->_databaseManager insertOrUpdateIndexerItemWithIdentifier:v8 domainIdentifier:v6 searchableItemData:0 type:1 status:0 error:0];
    [(PDSpotlightIndexer *)self _performIndexingOperationsWithOrigin:1];
  }
}

- (void)peerPaymentWebServiceCoordinator:(id)a3 didUpdateAccount:(id)a4 oldAccount:(id)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100439294;
  v5[3] = &unk_100751260;
  v5[4] = self;
  -[PDSpotlightIndexer accessSuggestionsController:](self, "accessSuggestionsController:", v5, a4, a5);
}

- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4
{
  id v5 = (void (**)(void))a4;
  [(PDSpotlightIndexer *)self reindexAllContent];
  v5[2]();
}

- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5
{
  unsigned int v7 = (void (**)(void))a5;
  [(PDSpotlightIndexer *)self reindexContentForIdentifiers:a4];
  v7[2]();
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
}

- (void)_releaseSuggestionsControllerIfNecessary
{
  p_lockSuggestions = &self->_lockSuggestions;
  os_unfair_lock_lock(&self->_lockSuggestions);
  if (!self->_suggestionsControllerCounter && ![(NSCountedSet *)self->_initiatedTransactionFetches count])
  {
    suggestionsController = self->_suggestionsController;
    self->_suggestionsController = 0;
  }
  os_unfair_lock_unlock(p_lockSuggestions);
}

- (void)accessSuggestionsController:(id)a3
{
  if (a3)
  {
    id v4 = (void (**)(id, FHSearchSuggestionController *, void *))a3;
    sub_10043227C();
    os_unfair_lock_lock(&self->_lockSuggestions);
    suggestionsController = self->_suggestionsController;
    ++self->_suggestionsControllerCounter;
    if (!suggestionsController)
    {
      int v6 = (FHSearchSuggestionController *)[objc_alloc(off_100807268()) initWithDelegate:self];
      unsigned int v7 = self->_suggestionsController;
      self->_suggestionsController = v6;
    }
    os_unfair_lock_unlock(&self->_lockSuggestions);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1004397A4;
    v9[3] = &unk_10072E1E8;
    v9[4] = self;
    int v8 = objc_retainBlock(v9);
    v4[2](v4, self->_suggestionsController, v8);
  }
}

- (void)deleteAllFinHealthDataWithCompletion:(id)a3
{
  id v4 = a3;
  [(PDDatabaseManager *)self->_databaseManager deleteAllPaymentTransactionTags];
  [(PDDatabaseManager *)self->_databaseManager updateIndexingMetadataStatus:0 version:0 forType:3];
  sub_10043227C();
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100439904;
  v6[3] = &unk_100751300;
  id v7 = v4;
  id v5 = v4;
  [(PDSpotlightIndexer *)self accessSuggestionsController:v6];
}

- (void)_updateFinHealthAccountEvent:(id)a3 deferFeatureComputation:(BOOL)a4 completion:(id)a5
{
  int v8 = (void (**)(void))a5;
  id v9 = a3;
  sub_10043227C();
  id v10 = [v9 accountIdentifier];
  id v11 = [v9 items];
  unsigned int v12 = [v11 anyObject];

  id v13 = [v9 type];
  if (v13 != (id)4 || !v12) {
    goto LABEL_9;
  }
  id v14 = [v12 activityIdentifier];
  uint64_t v15 = v14;
  if (!v14 || !v10)
  {

    goto LABEL_9;
  }
  id v16 = [v12 activityType];

  if (v16 != (id)1)
  {
LABEL_9:
    char v21 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v28 = v10;
      __int16 v29 = 2112;
      unsigned int v30 = v12;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Account Event is not a transaction accountIdentifier %@ event %@ ", buf, 0x16u);
    }

    goto LABEL_12;
  }
  databaseManager = self->_databaseManager;
  id v18 = [v12 activityIdentifier];
  id v19 = [(PDDatabaseManager *)databaseManager transactionWithServiceIdentifier:v18 accountIdentifier:v10 accountType:2];

  if (v19)
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100439DC4;
    v22[3] = &unk_1007512B0;
    BOOL v26 = a4;
    id v23 = v19;
    id v24 = self;
    uint64_t v25 = v8;
    id v20 = v19;
    [(PDSpotlightIndexer *)self accessSuggestionsController:v22];

    goto LABEL_16;
  }
  char v21 = PKLogFacilityTypeGetObject();
LABEL_12:
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v28 = v12;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Missing transaction for activity event %@", buf, 0xCu);
  }

  if (v8) {
    v8[2](v8);
  }
LABEL_16:
}

- (void)didUpdateFeatures:(id)a3 moreComing:(BOOL)a4 readyForNextBatch:(id)a5 error:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = (void (**)(void))a5;
  id v12 = a6;
  id v13 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = [v10 count];
    CFStringRef v15 = @"NO";
    *(_DWORD *)long long buf = 134218498;
    id v29 = v14;
    __int16 v30 = 2112;
    if (v8) {
      CFStringRef v15 = @"YES";
    }
    CFStringRef v31 = v15;
    __int16 v32 = 2112;
    id v33 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "didUpdateFeatures: %lu, moreComing %@, error: %@", buf, 0x20u);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v16 = v10;
  id v17 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      id v20 = 0;
      do
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        [(PDSpotlightIndexer *)self _parseFeatureResponse:*(void *)(*((void *)&v23 + 1) + 8 * (void)v20)];
        id v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      id v18 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v18);
  }

  if (!v8)
  {
    indexAccessQueue = self->_indexAccessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10043A2EC;
    block[3] = &unk_10072E1E8;
    void block[4] = self;
    dispatch_async(indexAccessQueue, block);
  }
  if (v11) {
    v11[2](v11);
  }
}

- (void)_parseFeatureResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 transactionIdentifier];
  if (PKSearchDetailedLoggingEnabledInWallet())
  {
    int v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [v4 aggregateFeatures];
      BOOL v8 = [v4 compoundFeatures];
      *(_DWORD *)long long buf = 138412802;
      v58 = v7;
      __int16 v59 = 2112;
      id v60 = v8;
      __int16 v61 = 2112;
      uint64_t v62 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Parsing features %@, %@ for %@", buf, 0x20u);
    }
  }
  long long v35 = (void *)v5;
  id v9 = objc_alloc_init((Class)NSMutableSet);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v36 = v4;
  id obj = [v4 compoundFeatures];
  id v40 = [obj countByEnumeratingWithState:&v50 objects:v56 count:16];
  if (v40)
  {
    long long v38 = self;
    uint64_t v39 = *(void *)v51;
    do
    {
      for (i = 0; i != v40; i = (char *)i + 1)
      {
        if (*(void *)v51 != v39) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        unint64_t v12 = [(PDSpotlightIndexer *)self _finHealthCompoundFeatureToPaymentTransactionTagType:v11];
        if (v12)
        {
          unint64_t v13 = v12;
          id v41 = i;
          id v14 = [v11 rankedValues];
          long long v46 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          id v15 = [v14 countByEnumeratingWithState:&v46 objects:v55 count:16];
          if (v15)
          {
            id v16 = v15;
            uint64_t v17 = *(void *)v47;
            do
            {
              for (j = 0; j != v16; j = (char *)j + 1)
              {
                if (*(void *)v47 != v17) {
                  objc_enumerationMutation(v14);
                }
                uint64_t v19 = *(void **)(*((void *)&v46 + 1) + 8 * (void)j);
                id v20 = objc_alloc_init((Class)PKPaymentTransactionTag);
                [v20 setType:v13];
                char v21 = [v19 featureRank];
                [v20 setRank:v21];

                id v22 = [v19 featureLabel];
                [v20 setLocalizedTitle:v22];

                long long v23 = [v11 locale];
                [v20 setLocaleIdentifier:v23];

                [v9 addObject:v20];
              }
              id v16 = [v14 countByEnumeratingWithState:&v46 objects:v55 count:16];
            }
            while (v16);
          }

          self = v38;
          i = v41;
        }
      }
      id v40 = [obj countByEnumeratingWithState:&v50 objects:v56 count:16];
    }
    while (v40);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v24 = [v36 aggregateFeatures];
  id v25 = [v24 countByEnumeratingWithState:&v42 objects:v54 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v43;
    do
    {
      for (k = 0; k != v26; k = (char *)k + 1)
      {
        if (*(void *)v43 != v27) {
          objc_enumerationMutation(v24);
        }
        unint64_t v29 = [(PDSpotlightIndexer *)self _finHealthAggregateFeatureToPaymentTransactionTagType:*(void *)(*((void *)&v42 + 1) + 8 * (void)k)];
        if (v29)
        {
          unint64_t v30 = v29;
          id v31 = objc_alloc_init((Class)PKPaymentTransactionTag);
          [v31 setType:v30];
          [v9 addObject:v31];
        }
      }
      id v26 = [v24 countByEnumeratingWithState:&v42 objects:v54 count:16];
    }
    while (v26);
  }

  [(PDDatabaseManager *)self->_databaseManager setTags:v9 toTransactionWithIdentifier:v35];
  id v32 = [v9 count];
  if (v32)
  {
    id v33 = v32;
    id v34 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218242;
      v58 = v33;
      __int16 v59 = 2112;
      id v60 = v35;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Found %lu tags for transaction %@", buf, 0x16u);
    }
  }
}

- (unint64_t)_finHealthAggregateFeatureToPaymentTransactionTagType:(id)a3
{
  id v3 = a3;
  id v4 = off_100807270();
  id v5 = v3;
  id v6 = v4;
  if (v6 == v5)
  {

    goto LABEL_7;
  }
  id v7 = v6;
  if (!v5 || !v6)
  {

    goto LABEL_9;
  }
  unsigned __int8 v8 = [v5 isEqualToString:v6];

  if (v8)
  {
LABEL_7:
    unint64_t v9 = 2;
    goto LABEL_114;
  }
LABEL_9:
  id v10 = off_100807278();
  id v11 = v5;
  id v12 = v10;
  if (v12 == v11)
  {

    goto LABEL_15;
  }
  unint64_t v13 = v12;
  if (!v5 || !v12)
  {

    goto LABEL_17;
  }
  unsigned __int8 v14 = [v11 isEqualToString:v12];

  if (v14)
  {
LABEL_15:
    unint64_t v9 = 3;
    goto LABEL_114;
  }
LABEL_17:
  id v15 = off_100807280();
  id v16 = v11;
  id v17 = v15;
  if (v17 == v16)
  {

    goto LABEL_23;
  }
  id v18 = v17;
  if (!v5 || !v17)
  {

    goto LABEL_25;
  }
  unsigned __int8 v19 = [v16 isEqualToString:v17];

  if (v19)
  {
LABEL_23:
    unint64_t v9 = 1;
    goto LABEL_114;
  }
LABEL_25:
  id v20 = off_100807288();
  id v21 = v16;
  id v22 = v20;
  if (v22 == v21)
  {

    goto LABEL_31;
  }
  long long v23 = v22;
  if (!v5 || !v22)
  {

    goto LABEL_33;
  }
  unsigned __int8 v24 = [v21 isEqualToString:v22];

  if (v24)
  {
LABEL_31:
    unint64_t v9 = 6;
    goto LABEL_114;
  }
LABEL_33:
  id v25 = off_100807290();
  id v26 = v21;
  id v27 = v25;
  if (v27 == v26)
  {

    goto LABEL_39;
  }
  id v28 = v27;
  if (!v5 || !v27)
  {

    goto LABEL_41;
  }
  unsigned __int8 v29 = [v26 isEqualToString:v27];

  if (v29)
  {
LABEL_39:
    unint64_t v9 = 7;
    goto LABEL_114;
  }
LABEL_41:
  unint64_t v30 = off_100807298();
  id v31 = v26;
  id v32 = v30;
  if (v32 == v31)
  {

    goto LABEL_47;
  }
  id v33 = v32;
  if (!v5 || !v32)
  {

    goto LABEL_49;
  }
  unsigned __int8 v34 = [v31 isEqualToString:v32];

  if (v34)
  {
LABEL_47:
    unint64_t v9 = 8;
    goto LABEL_114;
  }
LABEL_49:
  long long v35 = off_1008072A0();
  id v36 = v31;
  id v37 = v35;
  if (v37 == v36)
  {

    goto LABEL_55;
  }
  long long v38 = v37;
  if (!v5 || !v37)
  {

    goto LABEL_57;
  }
  unsigned __int8 v39 = [v36 isEqualToString:v37];

  if (v39)
  {
LABEL_55:
    unint64_t v9 = 9;
    goto LABEL_114;
  }
LABEL_57:
  id v40 = off_1008072A8();
  id v41 = v36;
  id v42 = v40;
  if (v42 == v41)
  {

    goto LABEL_63;
  }
  long long v43 = v42;
  if (!v5 || !v42)
  {

    goto LABEL_65;
  }
  unsigned __int8 v44 = [v41 isEqualToString:v42];

  if (v44)
  {
LABEL_63:
    unint64_t v9 = 4;
    goto LABEL_114;
  }
LABEL_65:
  long long v45 = off_1008072B0();
  id v46 = v41;
  id v47 = v45;
  if (v47 == v46)
  {

    goto LABEL_71;
  }
  long long v48 = v47;
  if (!v5 || !v47)
  {

    goto LABEL_73;
  }
  unsigned __int8 v49 = [v46 isEqualToString:v47];

  if (v49)
  {
LABEL_71:
    unint64_t v9 = 5;
    goto LABEL_114;
  }
LABEL_73:
  long long v50 = off_1008072B8();
  id v51 = v46;
  id v52 = v50;
  if (v52 == v51)
  {

    goto LABEL_79;
  }
  long long v53 = v52;
  if (!v5 || !v52)
  {

    goto LABEL_81;
  }
  unsigned __int8 v54 = [v51 isEqualToString:v52];

  if (v54)
  {
LABEL_79:
    unint64_t v9 = 10;
    goto LABEL_114;
  }
LABEL_81:
  id v55 = off_1008072C0();
  id v56 = v51;
  id v57 = v55;
  if (v57 == v56)
  {

    goto LABEL_87;
  }
  v58 = v57;
  if (!v5 || !v57)
  {

    goto LABEL_89;
  }
  unsigned __int8 v59 = [v56 isEqualToString:v57];

  if (v59)
  {
LABEL_87:
    unint64_t v9 = 11;
    goto LABEL_114;
  }
LABEL_89:
  id v60 = off_1008072C8();
  id v61 = v56;
  id v62 = v60;
  if (v62 == v61)
  {

    goto LABEL_95;
  }
  v63 = v62;
  if (!v5 || !v62)
  {

    goto LABEL_97;
  }
  unsigned __int8 v64 = [v61 isEqualToString:v62];

  if (v64)
  {
LABEL_95:
    unint64_t v9 = 18;
    goto LABEL_114;
  }
LABEL_97:
  v65 = off_1008072D0();
  id v66 = v61;
  id v67 = v65;
  if (v67 == v66)
  {

    goto LABEL_103;
  }
  v68 = v67;
  if (v5 && v67)
  {
    unsigned __int8 v69 = [v66 isEqualToString:v67];

    if ((v69 & 1) == 0) {
      goto LABEL_105;
    }
LABEL_103:
    unint64_t v9 = 19;
    goto LABEL_114;
  }

LABEL_105:
  id v70 = off_1008072D8();
  id v71 = v66;
  id v72 = v70;
  if (v72 == v71)
  {
  }
  else
  {
    id v73 = v72;
    if (!v5 || !v72)
    {

LABEL_113:
      unint64_t v9 = 0;
      goto LABEL_114;
    }
    unsigned int v74 = [v71 isEqualToString:v72];

    if (!v74) {
      goto LABEL_113;
    }
  }
  unint64_t v9 = 20;
LABEL_114:

  return v9;
}

- (unint64_t)_finHealthCompoundFeatureToPaymentTransactionTagType:(id)a3
{
  id v3 = [a3 compoundFeatureKey];
  id v4 = off_1008072E0();
  id v5 = v3;
  id v6 = v4;
  if (v5 == v6)
  {

    goto LABEL_7;
  }
  id v7 = v6;
  if (!v5 || !v6)
  {

    goto LABEL_9;
  }
  unsigned __int8 v8 = [v5 isEqualToString:v6];

  if (v8)
  {
LABEL_7:
    unint64_t v9 = 13;
    goto LABEL_50;
  }
LABEL_9:
  id v10 = off_1008072E8();
  id v11 = v5;
  id v12 = v10;
  if (v11 == v12)
  {

    goto LABEL_15;
  }
  unint64_t v13 = v12;
  if (!v5 || !v12)
  {

    goto LABEL_17;
  }
  unsigned __int8 v14 = [v11 isEqualToString:v12];

  if (v14)
  {
LABEL_15:
    unint64_t v9 = 14;
    goto LABEL_50;
  }
LABEL_17:
  id v15 = off_1008072F0();
  id v16 = v11;
  id v17 = v15;
  if (v16 == v17)
  {

    goto LABEL_23;
  }
  id v18 = v17;
  if (!v5 || !v17)
  {

    goto LABEL_25;
  }
  unsigned __int8 v19 = [v16 isEqualToString:v17];

  if (v19)
  {
LABEL_23:
    unint64_t v9 = 16;
    goto LABEL_50;
  }
LABEL_25:
  id v20 = off_1008072F8();
  id v21 = v16;
  id v22 = v20;
  if (v21 == v22)
  {

    goto LABEL_31;
  }
  long long v23 = v22;
  if (!v5 || !v22)
  {

    goto LABEL_33;
  }
  unsigned __int8 v24 = [v21 isEqualToString:v22];

  if (v24)
  {
LABEL_31:
    unint64_t v9 = 15;
    goto LABEL_50;
  }
LABEL_33:
  id v25 = off_100807300();
  id v26 = v21;
  id v27 = v25;
  if (v26 == v27)
  {

    goto LABEL_39;
  }
  id v28 = v27;
  if (v5 && v27)
  {
    unsigned __int8 v29 = [v26 isEqualToString:v27];

    if ((v29 & 1) == 0) {
      goto LABEL_41;
    }
LABEL_39:
    unint64_t v9 = 12;
    goto LABEL_50;
  }

LABEL_41:
  unint64_t v30 = off_100807308();
  id v31 = v26;
  id v32 = v30;
  if (v31 == v32)
  {
  }
  else
  {
    id v33 = v32;
    if (!v5 || !v32)
    {

LABEL_49:
      unint64_t v9 = 0;
      goto LABEL_50;
    }
    unsigned int v34 = [v31 isEqualToString:v32];

    if (!v34) {
      goto LABEL_49;
    }
  }
  unint64_t v9 = 17;
LABEL_50:

  return v9;
}

- (void)transaction:(id)a3 associatedToWorldRegion:(id)a4
{
  id v5 = [a3 identifier];
  id v6 = +[PKCoreSpotlightUtilities spotlightIdentifierForTransactionIdentifier:v5];
  unsigned __int8 v8 = v6;
  id v7 = +[NSArray arrayWithObjects:&v8 count:1];
  [(PDSpotlightIndexer *)self reindexContentForIdentifiers:v7];
}

- (void)worldRegionProcessingCompletedWithSuccess:(BOOL)a3
{
  indexAccessQueue = self->_indexAccessQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10043B2C8;
  v4[3] = &unk_10072F078;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(indexAccessQueue, v4);
}

- (void)placemarkFound:(id)a3 forTransaction:(id)a4
{
}

- (id)updateRegionWithIdentifier:(id)a3 localizedName:(id)a4 boundingRegion:(id *)a5 mapsIdentifier:(unint64_t)a6 providerIdentifier:(int)a7
{
  return [(PDWorldRegionAggregator *)self->_worldRegionAggregator updateRegionWithIdentifier:a3 localizedName:a4 boundingRegion:a5 mapsIdentifier:a6 providerIdentifier:*(void *)&a7];
}

- (void)addObserver:(id)a3
{
  if (a3)
  {
    p_lockObservers = &self->_lockObservers;
    id v5 = a3;
    os_unfair_lock_lock(p_lockObservers);
    [(NSHashTable *)self->_observers addObject:v5];

    os_unfair_lock_unlock(p_lockObservers);
  }
}

- (void)removeObserver:(id)a3
{
  if (a3)
  {
    p_lockObservers = &self->_lockObservers;
    id v5 = a3;
    os_unfair_lock_lock(p_lockObservers);
    [(NSHashTable *)self->_observers removeObject:v5];

    os_unfair_lock_unlock(p_lockObservers);
  }
}

- (void)_accessObserversWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    p_lockObservers = &self->_lockObservers;
    os_unfair_lock_lock(&self->_lockObservers);
    id v6 = [(NSHashTable *)self->_observers allObjects];
    os_unfair_lock_unlock(p_lockObservers);
    id v7 = PDUtilityQueue();
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10043B50C;
    v9[3] = &unk_10072FDC8;
    id v10 = v6;
    id v11 = v4;
    id v8 = v6;
    dispatch_async(v7, v9);
  }
}

- (void)databaseRestored
{
  if (self->_databaseWillRestore)
  {
    self->_databaseWillRestore = 0;
    id v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Database restored, deleting all FinHealth data", v4, 2u);
    }

    [(PDSpotlightIndexer *)self deleteAllFinHealthDataWithCompletion:&stru_100751320];
  }
  else
  {
    __break(1u);
  }
}

- (PDWorldRegionAggregator)worldRegionAggregator
{
  return self->_worldRegionAggregator;
}

- (void)setWorldRegionAggregator:(id)a3
{
}

- (CSSearchableIndex)index
{
  return self->_index;
}

- (void)setIndex:(id)a3
{
}

- (PKServicePaymentTransactionImageGenerator)imageGenerator
{
  return self->_imageGenerator;
}

- (void)setImageGenerator:(id)a3
{
}

- (PKPassKitServicesXPCService)passKitServicesXPCService
{
  return self->_passKitServicesXPCService;
}

- (void)setPassKitServicesXPCService:(id)a3
{
}

- (PKCancelable)metadataOperation
{
  return self->_metadataOperation;
}

- (void)setMetadataOperation:(id)a3
{
}

- (PKCancelable)indexingOperation
{
  return self->_indexingOperation;
}

- (void)setIndexingOperation:(id)a3
{
}

- (BOOL)performingOperation
{
  return self->_performingOperation;
}

- (void)setPerformingOperation:(BOOL)a3
{
  self->_performingOperation = a3;
}

- (BOOL)performingOverallIndexing
{
  return self->_performingOverallIndexing;
}

- (void)setPerformingOverallIndexing:(BOOL)a3
{
  self->_BOOL performingOverallIndexing = a3;
}

- (BOOL)resetPending
{
  return self->_resetPending;
}

- (void)setResetPending:(BOOL)a3
{
  self->_resetPending = a3;
}

- (NSMutableArray)resetCompletions
{
  return self->_resetCompletions;
}

- (void)setResetCompletions:(id)a3
{
}

- (BOOL)hasCompletedIndexingSetup
{
  return self->_hasCompletedIndexingSetup;
}

- (void)setHasCompletedIndexingSetup:(BOOL)a3
{
  self->_hasCompletedIndexingSetup = a3;
}

- (void)setWillRequireIndexing:(BOOL)a3
{
  self->_willRequireIndexing = a3;
}

- (os_unfair_lock_s)lockOperation
{
  return self->_lockOperation;
}

- (void)setLockOperation:(os_unfair_lock_s)a3
{
  self->_lockOperation = a3;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (os_unfair_lock_s)lockObservers
{
  return self->_lockObservers;
}

- (void)setLockObservers:(os_unfair_lock_s)a3
{
  self->_lockObservers = a3;
}

- (os_unfair_lock_s)lockSuggestions
{
  return self->_lockSuggestions;
}

- (void)setLockSuggestions:(os_unfair_lock_s)a3
{
  self->_lockSuggestions = a3;
}

- (id)worldRegionAggregatorCompletion
{
  return self->_worldRegionAggregatorCompletion;
}

- (void)setWorldRegionAggregatorCompletion:(id)a3
{
}

- (id)featuresCompletion
{
  return self->_featuresCompletion;
}

- (void)setFeaturesCompletion:(id)a3
{
}

- (PKContactResolver)contactResolver
{
  return self->_contactResolver;
}

- (void)setContactResolver:(id)a3
{
}

- (unint64_t)suggestionsControllerCounter
{
  return self->_suggestionsControllerCounter;
}

- (void)setSuggestionsControllerCounter:(unint64_t)a3
{
  self->_suggestionsControllerCounter = a3;
}

- (FHSearchSuggestionController)suggestionsController
{
  return self->_suggestionsController;
}

- (void)setSuggestionsController:(id)a3
{
}

- (NSCountedSet)initiatedTransactionFetches
{
  return self->_initiatedTransactionFetches;
}

- (void)setInitiatedTransactionFetches:(id)a3
{
}

- (BOOL)databaseWillRestore
{
  return self->_databaseWillRestore;
}

- (void)setDatabaseWillRestore:(BOOL)a3
{
  self->_databaseWillRestore = a3;
}

- (PDDatabaseManager)databaseManager
{
  return self->_databaseManager;
}

- (PDTransactionReceiptFileManager)receiptFileManager
{
  return self->_receiptFileManager;
}

- (PDPaymentWebServiceCoordinator)paymentWebServiceCoordinator
{
  return self->_paymentWebServiceCoordinator;
}

- (PDPeerPaymentWebServiceCoordinator)peerPaymentWebServiceCoordinator
{
  return self->_peerPaymentWebServiceCoordinator;
}

- (OS_dispatch_queue)indexAccessQueue
{
  return self->_indexAccessQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexAccessQueue, 0);
  objc_storeStrong((id *)&self->_peerPaymentWebServiceCoordinator, 0);
  objc_storeStrong((id *)&self->_paymentWebServiceCoordinator, 0);
  objc_storeStrong((id *)&self->_receiptFileManager, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_initiatedTransactionFetches, 0);
  objc_storeStrong((id *)&self->_suggestionsController, 0);
  objc_storeStrong((id *)&self->_contactResolver, 0);
  objc_storeStrong(&self->_featuresCompletion, 0);
  objc_storeStrong(&self->_worldRegionAggregatorCompletion, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_resetCompletions, 0);
  objc_storeStrong((id *)&self->_indexingOperation, 0);
  objc_storeStrong((id *)&self->_metadataOperation, 0);
  objc_storeStrong((id *)&self->_passKitServicesXPCService, 0);
  objc_storeStrong((id *)&self->_imageGenerator, 0);
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_worldRegionAggregator, 0);
}

@end