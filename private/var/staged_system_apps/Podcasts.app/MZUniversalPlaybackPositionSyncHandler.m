@interface MZUniversalPlaybackPositionSyncHandler
- (BOOL)_shouldStop;
- (BOOL)_synchronize:(id *)a3;
- (BOOL)canRequestStoreSignIn;
- (BOOL)canceled;
- (BOOL)keyValueStoreController:(id)a3 shouldScheduleTransaction:(id)a4;
- (BOOL)keyValueStoreController:(id)a3 transaction:(id)a4 didFailWithError:(id)a5;
- (BOOL)syncInProgress;
- (MZKeyValueStoreController)kvsController;
- (MZKeyValueStoreTransaction)currentKVSTransaction;
- (MZUPPAsynchronousTask)task;
- (MZUPPBagContext)bagContext;
- (MZUniversalPlaybackPositionDataSource)dataSource;
- (MZUniversalPlaybackPositionSyncHandler)initWithDataSource:(id)a3 bagContext:(id)a4 andTask:(id)a5;
- (MZUniversalPlaybackPositionTransactionContext)dataSourceTransactionContext;
- (MZUppSyncProcessor)transactionProcessor;
- (NSError)fatalSyncError;
- (id)_synchronouslyRunKVSTransaction:(id)a3;
- (id)newKVSGetAllTransactionSinceDomainVersion:(id)a3;
- (id)newKVSGetAllTransactionWithMetadataItems:(id)a3;
- (id)newKVSPutAllTransactionWithMetadataItems:(id)a3;
- (id)newKVSTransactionWithType:(int)a3 keys:(id)a4;
- (void)_dataSourceCancelTransaction;
- (void)_fillEmptyMetadataIdentifiersIfNeeded;
- (void)_resetState;
- (void)_signalKVSTransactionCompletion:(id)a3;
- (void)_signalKVSTransactionCompletion:(id)a3 withError:(id)a4;
- (void)cancel;
- (void)cancelWithError:(id)a3;
- (void)keyValueStoreController:(id)a3 transaction:(id)a4 didCancelWithError:(id)a5;
- (void)keyValueStoreController:(id)a3 transactionDidFinish:(id)a4;
- (void)setBagContext:(id)a3;
- (void)setCanRequestStoreSignIn:(BOOL)a3;
- (void)setCanceled:(BOOL)a3;
- (void)setCurrentKVSTransaction:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDataSourceTransactionContext:(id)a3;
- (void)setFatalSyncError:(id)a3;
- (void)setKvsController:(id)a3;
- (void)setNumMetadataItemsFromKVSStorage:(int64_t)a3;
- (void)setNumMetadataItemsToCommitToDataSource:(int64_t)a3;
- (void)setNumMetadataItemsToCommitToKVSStorage:(int64_t)a3;
- (void)setSyncInProgress:(BOOL)a3;
- (void)setTask:(id)a3;
- (void)setTransactionProcessor:(id)a3;
- (void)synchronizeWithCompletionHandler:(id)a3;
- (void)timeout;
@end

@implementation MZUniversalPlaybackPositionSyncHandler

- (MZUniversalPlaybackPositionSyncHandler)initWithDataSource:(id)a3 bagContext:(id)a4 andTask:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)MZUniversalPlaybackPositionSyncHandler;
  v11 = [(MZUniversalPlaybackPositionSyncHandler *)&v26 init];
  v12 = v11;
  if (v11)
  {
    [(MZUniversalPlaybackPositionSyncHandler *)v11 setDataSource:v8];
    [(MZUniversalPlaybackPositionSyncHandler *)v12 setBagContext:v9];
    v13 = [[MZUppSyncProcessor alloc] initWithStorageProviderDelegate:v12];
    [(MZUniversalPlaybackPositionSyncHandler *)v12 setTransactionProcessor:v13];

    [(MZUniversalPlaybackPositionSyncHandler *)v12 setTask:v10];
    v14 = [MZKeyValueStoreController alloc];
    v15 = [v9 domain];
    v16 = [v9 baseURLForGETAll];
    v17 = [v9 baseURLForPUTAll];
    v18 = [(MZKeyValueStoreController *)v14 initWithDomain:v15 baseURLForGETAll:v16 baseURLForPUTAll:v17];

    [(MZKeyValueStoreController *)v18 setDelegate:v12];
    [(MZUniversalPlaybackPositionSyncHandler *)v12 setKvsController:v18];
    dispatch_queue_t v19 = dispatch_queue_create("MZUniversalPlaybackPositionSyncHandler.queue", 0);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v19;

    dispatch_queue_t v21 = dispatch_queue_create("MZUniversalPlaybackPositionSyncHandler.syncOperationQueue", 0);
    syncOperationQueue = v12->_syncOperationQueue;
    v12->_syncOperationQueue = (OS_dispatch_queue *)v21;

    v23 = v12->_syncOperationQueue;
    v24 = dispatch_get_global_queue(-32768, 0);
    dispatch_set_target_queue(v23, v24);
  }
  return v12;
}

- (void)_resetState
{
  [(MZUniversalPlaybackPositionSyncHandler *)self setDataSourceTransactionContext:0];
  [(MZUniversalPlaybackPositionSyncHandler *)self setCurrentKVSTransaction:0];
  v3 = [[MZUppSyncProcessor alloc] initWithStorageProviderDelegate:self];
  [(MZUniversalPlaybackPositionSyncHandler *)self setTransactionProcessor:v3];
}

- (void)_dataSourceCancelTransaction
{
  [(MZUniversalPlaybackPositionSyncHandler *)self _resetState];
  id v4 = [(MZUniversalPlaybackPositionSyncHandler *)self dataSource];
  if (objc_opt_respondsToSelector())
  {
    v3 = [(MZUniversalPlaybackPositionSyncHandler *)self dataSourceTransactionContext];
    [v4 cancelUniversalPlaybackPositionTransaction:v3];
  }
}

- (BOOL)_synchronize:(id *)a3
{
  uint64_t v152 = 0;
  v153 = &v152;
  uint64_t v154 = 0x2020000000;
  char v155 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009F720;
  block[3] = &unk_10054E2A8;
  block[4] = self;
  block[5] = &v152;
  dispatch_sync(queue, block);
  if (!*((unsigned char *)v153 + 24))
  {
    [(MZUniversalPlaybackPositionSyncHandler *)self _fillEmptyMetadataIdentifiersIfNeeded];
    kdebug_trace();
    v7 = _MTLogCategoryUPPSync();
    v139 = a3;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Beginning synchronization", buf, 2u);
    }

    id v8 = _MTLogCategoryUPPSync();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Begin STEP 0. Gather local items to sync from data source.", buf, 2u);
    }

    id v9 = _MTLogCategoryCloudSync();
    os_signpost_id_t spid = os_signpost_id_generate(v9);

    id v10 = _MTLogCategoryUPPSync();
    v11 = v10;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, spid, "UPP.Sync.Step.0.Begin", "", buf, 2u);
    }

    v12 = [(MZUniversalPlaybackPositionSyncHandler *)self task];
    v13 = [v12 metrics];
    [v13 setLatestUPPSubtask:1];

    objc_initWeak(&location, self);
    v14 = [(MZUniversalPlaybackPositionSyncHandler *)self dataSource];
    v148[0] = _NSConcreteStackBlock;
    v148[1] = 3221225472;
    v148[2] = sub_10009F76C;
    v148[3] = &unk_10054F5E0;
    v140 = &v149;
    objc_copyWeak(&v149, &location);
    v15 = [v14 beginTransactionWithItemsToSyncEnumerationBlock:v148];
    [(MZUniversalPlaybackPositionSyncHandler *)self setDataSourceTransactionContext:v15];

    v16 = [(MZUniversalPlaybackPositionSyncHandler *)self transactionProcessor];
    v17 = [v16 metadataItemsFromDataSource];
    id v18 = [v17 count];
    uint64_t v19 = [(MZUniversalPlaybackPositionSyncHandler *)self task];
    v20 = [(id)v19 metrics];
    [v20 setNumMetadataItemsFromDataSource:v18];

    dispatch_queue_t v21 = [(MZUniversalPlaybackPositionSyncHandler *)self dataSourceTransactionContext];
    LOBYTE(v19) = v21 == 0;

    if (v19) {
      goto LABEL_13;
    }
    if ([(MZUniversalPlaybackPositionSyncHandler *)self _shouldStop])
    {
      [(MZUniversalPlaybackPositionSyncHandler *)self _dataSourceCancelTransaction];
LABEL_13:
      BOOL v6 = 0;
LABEL_76:
      objc_destroyWeak(v140);
      objc_destroyWeak(&location);
      goto LABEL_77;
    }
    v22 = _MTLogCategoryUPPSync();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = [(MZUniversalPlaybackPositionSyncHandler *)self transactionProcessor];
      v24 = [v23 metadataItemsFromDataSource];
      v25 = [v24 allKeys];
      unsigned int v26 = [v25 count];
      v27 = [(MZUniversalPlaybackPositionSyncHandler *)self transactionProcessor];
      v28 = [v27 metadataItemsFromDataSource];
      id v29 = [v28 allKeys];
      *(_DWORD *)buf = 67240450;
      *(_DWORD *)v157 = v26;
      *(_WORD *)&v157[4] = 2114;
      *(void *)&v157[6] = v29;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Gathered local %{public}d items to sync from dataSource: %{public}@", buf, 0x12u);
    }
    v30 = _MTLogCategoryUPPSync();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = [(MZUniversalPlaybackPositionSyncHandler *)self dataSourceTransactionContext];
      *(_DWORD *)buf = 138543362;
      *(void *)v157 = v31;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "dataSource transaction context = %{public}@", buf, 0xCu);
    }
    kdebug_trace();
    v32 = _MTLogCategoryUPPSync();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Finish STEP 0.", buf, 2u);
    }

    v33 = _MTLogCategoryUPPSync();
    v34 = v33;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v34, OS_SIGNPOST_INTERVAL_END, spid, "UPP.Sync.Step.0.End", "", buf, 2u);
    }

    v35 = _MTLogCategoryCloudSync();
    os_signpost_id_t v36 = os_signpost_id_generate(v35);

    v37 = _MTLogCategoryUPPSync();
    v38 = v37;
    if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v38, OS_SIGNPOST_INTERVAL_BEGIN, v36, "UPP.Sync.Step.1.Begin", "", buf, 2u);
    }

    kdebug_trace();
    v39 = _MTLogCategoryUPPSync();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Begin STEP 1. Perform iTMS-kvs getAll to update new items.", buf, 2u);
    }

    v40 = [(MZUniversalPlaybackPositionSyncHandler *)self task];
    v41 = [v40 metrics];
    [v41 setLatestUPPSubtask:2];

    v42 = +[NSMutableArray array];
    long long v146 = 0u;
    long long v147 = 0u;
    long long v144 = 0u;
    long long v145 = 0u;
    v43 = [(MZUniversalPlaybackPositionSyncHandler *)self transactionProcessor];
    v44 = [v43 metadataItemsFromDataSource];
    v45 = [v44 allValues];

    id v46 = [v45 countByEnumeratingWithState:&v144 objects:v158 count:16];
    if (v46)
    {
      uint64_t v47 = *(void *)v145;
      do
      {
        for (i = 0; i != v46; i = (char *)i + 1)
        {
          if (*(void *)v145 != v47) {
            objc_enumerationMutation(v45);
          }
          v49 = *(void **)(*((void *)&v144 + 1) + 8 * i);
          if (objc_msgSend(v49, "isNew", v139, v140)) {
            [v42 addObject:v49];
          }
        }
        id v46 = [v45 countByEnumeratingWithState:&v144 objects:v158 count:16];
      }
      while (v46);
    }

    if ([v42 count])
    {
      id v50 = [(MZUniversalPlaybackPositionSyncHandler *)self newKVSGetAllTransactionWithMetadataItems:v42];
      [(MZUniversalPlaybackPositionSyncHandler *)self setCurrentKVSTransaction:v50];

      if ([(MZUniversalPlaybackPositionSyncHandler *)self _shouldStop])
      {
LABEL_60:
        [(MZUniversalPlaybackPositionSyncHandler *)self _dataSourceCancelTransaction];
        BOOL v6 = 0;
LABEL_75:

        goto LABEL_76;
      }
      v51 = _MTLogCategoryUPPSync();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v52 = [v42 count];
        *(_DWORD *)buf = 67240450;
        *(_DWORD *)v157 = v52;
        *(_WORD *)&v157[4] = 2112;
        *(void *)&v157[6] = v42;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Requesting remote items for %{public}d new Items: %{pubic}@", buf, 0x12u);
      }

      v53 = [(MZUniversalPlaybackPositionSyncHandler *)self currentKVSTransaction];
      v54 = [(MZUniversalPlaybackPositionSyncHandler *)self _synchronouslyRunKVSTransaction:v53];

      if (v54)
      {
        if (!v139) {
          goto LABEL_73;
        }
        goto LABEL_71;
      }
      if ([(MZUniversalPlaybackPositionSyncHandler *)self _shouldStop]) {
        goto LABEL_73;
      }
      v55 = [(MZUniversalPlaybackPositionSyncHandler *)self transactionProcessor];
      [v55 mergeMetadataItemsFromGetResponse];
    }
    kdebug_trace();
    v56 = _MTLogCategoryUPPSync();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "Finish STEP 1.", buf, 2u);
    }

    v57 = _MTLogCategoryUPPSync();
    v58 = v57;
    if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v58, OS_SIGNPOST_INTERVAL_END, v36, "UPP.Sync.Step.1.End", "", buf, 2u);
    }

    v59 = _MTLogCategoryCloudSync();
    os_signpost_id_t v60 = os_signpost_id_generate(v59);

    v61 = _MTLogCategoryUPPSync();
    v62 = v61;
    if (v60 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v61))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v62, OS_SIGNPOST_INTERVAL_BEGIN, v60, "UPP.Sync.Step.2.Begin", "", buf, 2u);
    }

    kdebug_trace();
    v63 = _MTLogCategoryUPPSync();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "Begin STEP 2.1. Perform iTMS-kvs getAll for remote changes.", buf, 2u);
    }

    v64 = _MTLogCategoryUPPSync();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "      Start newKVSGetAllTransactionSinceDomainVersion...", buf, 2u);
    }

    v65 = [(MZUniversalPlaybackPositionSyncHandler *)self task];
    v66 = [v65 metrics];
    [v66 setLatestUPPSubtask:3];

    v67 = [(MZUniversalPlaybackPositionSyncHandler *)self dataSourceTransactionContext];
    v68 = [v67 lastSyncedDomainVersion];
    id v69 = [(MZUniversalPlaybackPositionSyncHandler *)self newKVSGetAllTransactionSinceDomainVersion:v68];
    [(MZUniversalPlaybackPositionSyncHandler *)self setCurrentKVSTransaction:v69];

    if ([(MZUniversalPlaybackPositionSyncHandler *)self _shouldStop]) {
      goto LABEL_60;
    }
    v70 = _MTLogCategoryUPPSync();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "      Finish newKVSGetAllTransactionSinceDomainVersion.", buf, 2u);
    }

    v71 = _MTLogCategoryUPPSync();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      v72 = [(MZUniversalPlaybackPositionSyncHandler *)self currentKVSTransaction];
      id v73 = [v72 sinceDomainVersion];
      *(_DWORD *)buf = 138543362;
      *(void *)v157 = v73;
      _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "Requesting remote items from server -since domain-version = %{public}@", buf, 0xCu);
    }
    v74 = _MTLogCategoryUPPSync();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "      Start _synchronouslyRunKVSTransaction...", buf, 2u);
    }

    v75 = [(MZUniversalPlaybackPositionSyncHandler *)self currentKVSTransaction];
    v54 = [(MZUniversalPlaybackPositionSyncHandler *)self _synchronouslyRunKVSTransaction:v75];

    v76 = _MTLogCategoryUPPSync();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "      Finish _synchronouslyRunKVSTransaction.", buf, 2u);
    }

    if (v54)
    {
      if (!v139)
      {
LABEL_73:
        [(MZUniversalPlaybackPositionSyncHandler *)self _dataSourceCancelTransaction];
        BOOL v6 = 0;
LABEL_74:

        goto LABEL_75;
      }
LABEL_71:
      id *v139 = v54;
      goto LABEL_73;
    }
    if ([(MZUniversalPlaybackPositionSyncHandler *)self _shouldStop]) {
      goto LABEL_73;
    }
    v78 = _MTLogCategoryUPPSync();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "Finish STEP 2.1.", buf, 2u);
    }

    v79 = _MTLogCategoryUPPSync();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "Begin STEP 2.2. Merge local and remote deltas.", buf, 2u);
    }

    v80 = [(MZUniversalPlaybackPositionSyncHandler *)self task];
    v81 = [v80 metrics];
    [v81 setLatestUPPSubtask:4];

    v82 = [(MZUniversalPlaybackPositionSyncHandler *)self transactionProcessor];
    [v82 mergeMetadataItemsFromGetResponse];

    kdebug_trace();
    v83 = _MTLogCategoryUPPSync();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEFAULT, "Finish STEP 2.2.", buf, 2u);
    }

    v84 = _MTLogCategoryUPPSync();
    v85 = v84;
    if (v60 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v84))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v85, OS_SIGNPOST_INTERVAL_END, v60, "UPP.Sync.Step.2.End", "", buf, 2u);
    }

    v86 = _MTLogCategoryCloudSync();
    os_signpost_id_t v87 = os_signpost_id_generate(v86);

    v88 = _MTLogCategoryUPPSync();
    v89 = v88;
    if (v87 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v88))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v89, OS_SIGNPOST_INTERVAL_BEGIN, v87, "UPP.Sync.Step.3.Begin", "", buf, 2u);
    }

    kdebug_trace();
    v90 = _MTLogCategoryUPPSync();
    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "Begin STEP 3. Push changes to server.", buf, 2u);
    }

    v91 = [(MZUniversalPlaybackPositionSyncHandler *)self task];
    v92 = [v91 metrics];
    [v92 setLatestUPPSubtask:5];

    v93 = [(MZUniversalPlaybackPositionSyncHandler *)self transactionProcessor];
    v94 = [v93 metadataItemsToCommitToKVSStorage];
    id v95 = [v94 count];

    if (v95)
    {
      v96 = _MTLogCategoryUPPSync();
      if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
      {
        v97 = [(MZUniversalPlaybackPositionSyncHandler *)self transactionProcessor];
        v98 = [v97 metadataItemsToCommitToKVSStorage];
        id v99 = [v98 allKeys];
        *(_DWORD *)buf = 138543362;
        *(void *)v157 = v99;
        _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEFAULT, "Sending merged items to server: %{public}@", buf, 0xCu);
      }
      v100 = [(MZUniversalPlaybackPositionSyncHandler *)self transactionProcessor];
      v101 = [v100 metadataItemsToCommitToKVSStorage];
      v102 = [v101 allValues];
      id v103 = [(MZUniversalPlaybackPositionSyncHandler *)self newKVSPutAllTransactionWithMetadataItems:v102];
      [(MZUniversalPlaybackPositionSyncHandler *)self setCurrentKVSTransaction:v103];

      v104 = [(MZUniversalPlaybackPositionSyncHandler *)self currentKVSTransaction];
      id v105 = [(MZUniversalPlaybackPositionSyncHandler *)self _synchronouslyRunKVSTransaction:v104];

      if (v105)
      {
        if (v139) {
          id *v139 = v105;
        }
        goto LABEL_99;
      }
      if ([(MZUniversalPlaybackPositionSyncHandler *)self _shouldStop])
      {
LABEL_99:
        [(MZUniversalPlaybackPositionSyncHandler *)self _dataSourceCancelTransaction];
        BOOL v6 = 0;
LABEL_124:

        goto LABEL_74;
      }
    }
    v106 = [(MZUniversalPlaybackPositionSyncHandler *)self transactionProcessor];
    v107 = [v106 responseDomainVersion];
    BOOL v108 = v107 == 0;

    if (v108)
    {
      v109 = _MTLogCategoryUPPSync();
      if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_DEFAULT, "[StoreBookkeeper] ERROR: expected to get a domainVersion in server response", buf, 2u);
      }

      v110 = [(MZUniversalPlaybackPositionSyncHandler *)self dataSourceTransactionContext];
      v111 = [v110 lastSyncedDomainVersion];
      v112 = [(MZUniversalPlaybackPositionSyncHandler *)self transactionProcessor];
      [v112 setResponseDomainVersion:v111];
    }
    kdebug_trace();
    v113 = _MTLogCategoryUPPSync();
    if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v113, OS_LOG_TYPE_DEFAULT, "Finish STEP 3.", buf, 2u);
    }

    v114 = _MTLogCategoryUPPSync();
    v115 = v114;
    if (v87 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v114))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v115, OS_SIGNPOST_INTERVAL_END, v87, "UPP.Sync.Step.3.End", "", buf, 2u);
    }

    v116 = _MTLogCategoryCloudSync();
    os_signpost_id_t v117 = os_signpost_id_generate(v116);

    v118 = _MTLogCategoryUPPSync();
    v119 = v118;
    if (v117 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v118))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v119, OS_SIGNPOST_INTERVAL_BEGIN, v117, "UPP.Sync.Step.4.Begin", "", buf, 2u);
    }

    kdebug_trace();
    v120 = _MTLogCategoryUPPSync();
    if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_DEFAULT, "Begin STEP 4. Commit changes to data source.", buf, 2u);
    }

    v121 = _MTLogCategoryUPPSync();
    if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
    {
      v122 = [(MZUniversalPlaybackPositionSyncHandler *)self transactionProcessor];
      v123 = [v122 responseDomainVersion];
      v124 = [(MZUniversalPlaybackPositionSyncHandler *)self transactionProcessor];
      v125 = [v124 metadataItemsToCommitToDataSource];
      *(_DWORD *)buf = 138543618;
      *(void *)v157 = v123;
      *(_WORD *)&v157[8] = 2114;
      *(void *)&v157[10] = v125;
      _os_log_impl((void *)&_mh_execute_header, v121, OS_LOG_TYPE_DEFAULT, "Committing merged items with domainRevision: %{public}@ to local database: %{public}@", buf, 0x16u);
    }
    v126 = [(MZUniversalPlaybackPositionSyncHandler *)self task];
    v127 = [v126 metrics];
    [v127 setLatestUPPSubtask:6];

    v128 = [(MZUniversalPlaybackPositionSyncHandler *)self transactionProcessor];
    v129 = [v128 metadataItemsToCommitToDataSource];
    v130 = [v129 objectEnumerator];

    v131 = [(MZUniversalPlaybackPositionSyncHandler *)self dataSource];
    v132 = [(MZUniversalPlaybackPositionSyncHandler *)self dataSourceTransactionContext];
    v133 = [(MZUniversalPlaybackPositionSyncHandler *)self transactionProcessor];
    v134 = [v133 responseDomainVersion];
    v142[0] = _NSConcreteStackBlock;
    v142[1] = 3221225472;
    v142[2] = sub_10009F8C0;
    v142[3] = &unk_10054F608;
    id v105 = v130;
    id v143 = v105;
    [v131 commitUniversalPlaybackPositionTransaction:v132 domainVersion:v134 metadataEnumerationBlock:v142];

    [(MZUniversalPlaybackPositionSyncHandler *)self _resetState];
    v135 = _MTLogCategoryUPPSync();
    if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v135, OS_LOG_TYPE_DEFAULT, "Finished synchronization", buf, 2u);
    }

    kdebug_trace();
    v136 = _MTLogCategoryUPPSync();
    if (os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v136, OS_LOG_TYPE_DEFAULT, "Finish STEP 4.", buf, 2u);
    }

    v137 = _MTLogCategoryUPPSync();
    v138 = v137;
    if (v117 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v137))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v138, OS_SIGNPOST_INTERVAL_END, v117, "UPP.Sync.Step.4.End", "", buf, 2u);
    }

    BOOL v6 = 1;
    goto LABEL_124;
  }
  BOOL v6 = 1;
LABEL_77:
  _Block_object_dispose(&v152, 8);
  return v6;
}

- (void)_fillEmptyMetadataIdentifiersIfNeeded
{
  v2 = +[MTDB sharedInstance];
  v3 = [v2 importContext];

  +[NSPredicate predicateForNilValueOrEmptyStringForKey:kEpisodeMetadataIdentifier];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10009F9A4;
  v6[3] = &unk_10054D9B0;
  id v7 = v3;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = v8;
  id v5 = v3;
  [v5 performBlockAndWaitWithSave:v6];
}

- (BOOL)_shouldStop
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10009FC7C;
  v5[3] = &unk_10054E2A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setCanRequestStoreSignIn:(BOOL)a3
{
  BOOL v3 = a3;
  self->_canRequestStoreSignIn = a3;
  id v4 = [(MZUniversalPlaybackPositionSyncHandler *)self kvsController];
  [v4 setCanRequestStoreSignIn:v3];
}

- (void)cancelWithError:(id)a3
{
  id v8 = a3;
  [(MZUniversalPlaybackPositionSyncHandler *)self setCanceled:1];
  id v4 = [(MZUniversalPlaybackPositionSyncHandler *)self kvsController];
  if ([v4 isIdle])
  {
    id v5 = [(MZUniversalPlaybackPositionSyncHandler *)self currentKVSTransaction];

    if (!v5) {
      goto LABEL_7;
    }
    if (!v8)
    {
      uint64_t v6 = [(MZUniversalPlaybackPositionSyncHandler *)self currentKVSTransaction];
      id v8 = +[MZKeyValueStoreError transactionCancelledErrorWithTransaction:v6 underlyingError:0];
    }
    id v4 = [(MZUniversalPlaybackPositionSyncHandler *)self currentKVSTransaction];
    [(MZUniversalPlaybackPositionSyncHandler *)self _signalKVSTransactionCompletion:v4 withError:v8];
  }

LABEL_7:
  id v7 = [(MZUniversalPlaybackPositionSyncHandler *)self kvsController];
  if (v8) {
    [v7 cancelAllTransactionsCancelCode:[v8 code]];
  }
  else {
    [v7 cancelAllTransactions];
  }
}

- (void)timeout
{
  id v4 = [(MZUniversalPlaybackPositionSyncHandler *)self currentKVSTransaction];
  BOOL v3 = +[MZKeyValueStoreError transactionTimeoutErrorWithTransaction:v4 underlyingError:0];
  [(MZUniversalPlaybackPositionSyncHandler *)self cancelWithError:v3];
}

- (void)cancel
{
}

- (void)synchronizeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  char v12 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A0044;
  block[3] = &unk_10054E2A8;
  block[4] = self;
  block[5] = v11;
  dispatch_sync(queue, block);
  syncOperationQueue = self->_syncOperationQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000A0078;
  v8[3] = &unk_10054D738;
  v8[4] = self;
  id v7 = v4;
  id v9 = v7;
  dispatch_async(syncOperationQueue, v8);
  kdebug_trace();

  _Block_object_dispose(v11, 8);
}

- (id)newKVSTransactionWithType:(int)a3 keys:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  kvsController = self->_kvsController;
  id v7 = a4;
  id v8 = [(MZKeyValueStoreController *)kvsController defaultDomain];
  id v9 = self->_kvsController;
  if (v4 == 1) {
    [(MZKeyValueStoreController *)v9 defaultGetURL];
  }
  else {
  id v10 = [(MZKeyValueStoreController *)v9 defaultSetURL];
  }
  v11 = [[MZKeyValueStoreTransaction alloc] initWithType:v4 domain:v8 URL:v10 keys:v7];

  char v12 = [(MZUniversalPlaybackPositionSyncHandler *)self transactionProcessor];
  [(MZKeyValueStoreTransaction *)v11 setProcessor:v12];

  id v13 = [objc_alloc((Class)NSConditionLock) initWithCondition:0];
  [(MZKeyValueStoreTransaction *)v11 setUserInfoValue:v13 forKey:@"completionConditionLock"];

  return v11;
}

- (id)newKVSPutAllTransactionWithMetadataItems:(id)a3
{
  id v4 = a3;
  if (![v4 count])
  {
    id v5 = 0;
    goto LABEL_32;
  }
  v25 = self;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v26 = v4;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (!v7) {
    goto LABEL_30;
  }
  id v8 = v7;
  uint64_t v9 = *(void *)v28;
  do
  {
    id v10 = 0;
    do
    {
      if (*(void *)v28 != v9) {
        objc_enumerationMutation(v6);
      }
      v11 = *(void **)(*((void *)&v27 + 1) + 8 * (void)v10);
      if (objc_msgSend(v11, "isNew", v25))
      {
        [v11 bookmarkTime];
        double v13 = v12;
        if ((os_feature_enabled_skip_empty_upp_sync() & 1) == 0)
        {
          if (v13 > 0.0) {
            goto LABEL_22;
          }
          goto LABEL_10;
        }
      }
      else if (!os_feature_enabled_skip_empty_upp_sync())
      {
        goto LABEL_22;
      }
      [v11 bookmarkTime];
      if (v18 > 0.0
        || ([v11 hasBeenPlayed] & 1) != 0
        || [v11 playCount]
        || ([v11 lastDatePlayed], v19 > 0.0)
        || ([v11 lastUserMarkedAsPlayedDate], v20 > 0.0)
        || ([v11 playStateManuallySet] & 1) != 0)
      {
LABEL_22:
        dispatch_queue_t v21 = [v11 itemIdentifier];
        [v5 addObject:v21];

        v15 = _MTLogCategoryUPPSync();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_25;
        }
        *(_DWORD *)buf = 138543362;
        v32 = v11;
        v16 = v15;
        v17 = "Adding UPP sync item...%{public}@";
        goto LABEL_24;
      }
LABEL_10:
      if (os_feature_enabled_skip_empty_upp_sync())
      {
        if (![v11 isNew] || (objc_msgSend(v11, "bookmarkTime"), v14 > 0.0))
        {
          v15 = _MTLogCategoryUPPSync();
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_25;
          }
          *(_DWORD *)buf = 138543362;
          v32 = v11;
          v16 = v15;
          v17 = "Preventing UPP sync item...%{public}@";
          goto LABEL_24;
        }
      }
      v15 = _MTLogCategoryUPPSync();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v32 = v11;
        v16 = v15;
        v17 = "Skipping UPP sync item...%{public}@";
LABEL_24:
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v17, buf, 0xCu);
      }
LABEL_25:

      id v10 = (char *)v10 + 1;
    }
    while (v8 != v10);
    id v22 = [v6 countByEnumeratingWithState:&v27 objects:v33 count:16];
    id v8 = v22;
  }
  while (v22);
LABEL_30:

  self = v25;
  id v4 = v26;
LABEL_32:
  id v23 = -[MZUniversalPlaybackPositionSyncHandler newKVSTransactionWithType:keys:](self, "newKVSTransactionWithType:keys:", 2, v5, v25);

  return v23;
}

- (id)newKVSGetAllTransactionWithMetadataItems:(id)a3
{
  id v4 = [a3 valueForKey:@"itemIdentifier"];
  id v5 = [(MZUniversalPlaybackPositionSyncHandler *)self newKVSTransactionWithType:1 keys:v4];

  return v5;
}

- (id)newKVSGetAllTransactionSinceDomainVersion:(id)a3
{
  id v4 = @"0";
  if (a3) {
    id v4 = (__CFString *)a3;
  }
  id v5 = v4;
  id v6 = [(MZUniversalPlaybackPositionSyncHandler *)self newKVSTransactionWithType:1 keys:0];
  [v6 setSinceDomainVersion:v5];

  return v6;
}

- (id)_synchronouslyRunKVSTransaction:(id)a3
{
  id v4 = a3;
  id v5 = [(MZUniversalPlaybackPositionSyncHandler *)self kvsController];
  [v5 scheduleTransaction:v4];

  id v6 = [v4 userInfoValueForKey:@"completionConditionLock"];

  id v7 = +[NSDate dateWithTimeIntervalSinceNow:10.0];
  unsigned int v8 = [v6 lockWhenCondition:1 beforeDate:v7];

  if (v8)
  {
    [v6 unlock];
  }
  else
  {
    uint64_t v9 = [(MZUniversalPlaybackPositionSyncHandler *)self currentKVSTransaction];
    id v10 = +[MZKeyValueStoreError transactionTimeoutErrorWithTransaction:v9 underlyingError:0];
    [(MZUniversalPlaybackPositionSyncHandler *)self setFatalSyncError:v10];
  }
  v11 = [(MZUniversalPlaybackPositionSyncHandler *)self fatalSyncError];

  return v11;
}

- (void)_signalKVSTransactionCompletion:(id)a3
{
  id v3 = [a3 userInfoValueForKey:@"completionConditionLock"];
  [v3 lock];
  [v3 unlockWithCondition:1];
}

- (void)_signalKVSTransactionCompletion:(id)a3 withError:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unsigned int v8 = [(MZUniversalPlaybackPositionSyncHandler *)self currentKVSTransaction];
  unsigned int v9 = [v7 isEqual:v8];

  if (v9)
  {
    if (v6)
    {
      id v10 = _MTLogCategoryUPPSync();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138543362;
        id v13 = v6;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "transaction is being canceled.  error = %{public}@", (uint8_t *)&v12, 0xCu);
      }
    }
    [(MZUniversalPlaybackPositionSyncHandler *)self setFatalSyncError:v6];
    v11 = [(MZUniversalPlaybackPositionSyncHandler *)self currentKVSTransaction];
    [(MZUniversalPlaybackPositionSyncHandler *)self _signalKVSTransactionCompletion:v11];
  }
}

- (BOOL)keyValueStoreController:(id)a3 shouldScheduleTransaction:(id)a4
{
  return 1;
}

- (BOOL)keyValueStoreController:(id)a3 transaction:(id)a4 didFailWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 isAccountsChangedError])
  {
    v11 = _MTLogCategoryUPPSync();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = [v9 sinceDomainVersion];
      int v16 = 138543362;
      id v17 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Detected account change.  Getting remote items since version 0 instead of %{public}@\n", (uint8_t *)&v16, 0xCu);
    }
    [v9 setSinceDomainVersion:@"0"];
    goto LABEL_8;
  }
  if ([v10 isAuthenticationError]
    && ![(MZUniversalPlaybackPositionSyncHandler *)self canRequestStoreSignIn])
  {
    double v14 = _MTLogCategoryUPPSync();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543362;
      id v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Detected authentication error (%{public}@) -- Bailing out", (uint8_t *)&v16, 0xCu);
    }

    [v8 resolveError:v10 transaction:v9 resolution:2];
    goto LABEL_12;
  }
  if (([v10 isRecoverableError] & 1) == 0)
  {
LABEL_12:
    [(MZUniversalPlaybackPositionSyncHandler *)self _signalKVSTransactionCompletion:v9 withError:v10];
    BOOL v13 = 1;
    goto LABEL_13;
  }
LABEL_8:
  BOOL v13 = 0;
LABEL_13:

  return v13;
}

- (void)keyValueStoreController:(id)a3 transaction:(id)a4 didCancelWithError:(id)a5
{
}

- (void)keyValueStoreController:(id)a3 transactionDidFinish:(id)a4
{
}

- (void)setNumMetadataItemsFromKVSStorage:(int64_t)a3
{
  id v5 = [(MZUniversalPlaybackPositionSyncHandler *)self task];
  id v4 = [v5 metrics];
  [v4 setNumMetadataItemsFromKVSStorage:a3];
}

- (void)setNumMetadataItemsToCommitToDataSource:(int64_t)a3
{
  id v5 = [(MZUniversalPlaybackPositionSyncHandler *)self task];
  id v4 = [v5 metrics];
  [v4 setNumMetadataItemsToCommitToDataSource:a3];
}

- (void)setNumMetadataItemsToCommitToKVSStorage:(int64_t)a3
{
  id v5 = [(MZUniversalPlaybackPositionSyncHandler *)self task];
  id v4 = [v5 metrics];
  [v4 setNumMetadataItemsToCommitToKVSStorage:a3];
}

- (MZKeyValueStoreController)kvsController
{
  return (MZKeyValueStoreController *)objc_getProperty(self, a2, 32, 1);
}

- (void)setKvsController:(id)a3
{
}

- (MZUniversalPlaybackPositionDataSource)dataSource
{
  return (MZUniversalPlaybackPositionDataSource *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDataSource:(id)a3
{
}

- (MZUniversalPlaybackPositionTransactionContext)dataSourceTransactionContext
{
  return (MZUniversalPlaybackPositionTransactionContext *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDataSourceTransactionContext:(id)a3
{
}

- (MZUPPBagContext)bagContext
{
  return (MZUPPBagContext *)objc_getProperty(self, a2, 56, 1);
}

- (void)setBagContext:(id)a3
{
}

- (MZUPPAsynchronousTask)task
{
  return (MZUPPAsynchronousTask *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTask:(id)a3
{
}

- (BOOL)canRequestStoreSignIn
{
  return self->_canRequestStoreSignIn;
}

- (MZKeyValueStoreTransaction)currentKVSTransaction
{
  return (MZKeyValueStoreTransaction *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCurrentKVSTransaction:(id)a3
{
}

- (BOOL)syncInProgress
{
  return self->_syncInProgress;
}

- (void)setSyncInProgress:(BOOL)a3
{
  self->_syncInProgress = a3;
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (NSError)fatalSyncError
{
  return (NSError *)objc_getProperty(self, a2, 80, 1);
}

- (void)setFatalSyncError:(id)a3
{
}

- (MZUppSyncProcessor)transactionProcessor
{
  return (MZUppSyncProcessor *)objc_getProperty(self, a2, 88, 1);
}

- (void)setTransactionProcessor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionProcessor, 0);
  objc_storeStrong((id *)&self->_fatalSyncError, 0);
  objc_storeStrong((id *)&self->currentKVSTransaction, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_bagContext, 0);
  objc_storeStrong((id *)&self->_dataSourceTransactionContext, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_kvsController, 0);
  objc_storeStrong((id *)&self->_syncOperationQueue, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end