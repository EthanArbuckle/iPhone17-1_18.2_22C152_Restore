@interface WLMigrationDataCoordinator
+ (BOOL)_allowSegmentedDownloads;
+ (unint64_t)downloadSegmentSize;
+ (unint64_t)segmentCountForItemSize:(unint64_t)a3 segmentSize:(unint64_t)a4;
- (BOOL)stashDataLocally;
- (NSString)downloadsPath;
- (WLMigrationDataCoordinator)init;
- (id)_recordSummaryForMigrator:(id)a3 withInfo:(id)a4 account:(id)a5;
- (void)_downloadFileInMultipleSegmentsFromSource:(id)a3 forMigrator:(id)a4 summary:(id)a5 account:(id)a6 itemSize:(unint64_t)a7 segmentCompletion:(id)a8 completion:(id)a9;
- (void)_downloadSegmentsFromSource:(id)a3 forMigrator:(id)a4 startingAtByteLocation:(unint64_t)a5 ofSummary:(id)a6 account:(id)a7 itemSize:(unint64_t)a8 toFileHandle:(id)a9 segmentCompletion:(id)a10 completion:(id)a11;
- (void)_fetchAccountsFromSource:(id)a3 forMigrator:(id)a4 statistics:(id)a5 completion:(id)a6;
- (void)_fetchSummariesFromSource:(id)a3 forMigrator:(id)a4 account:(id)a5 statistics:(id)a6 completion:(id)a7;
- (void)downloadDataFromSource:(id)a3 forMigrator:(id)a4 summary:(id)a5 account:(id)a6 completion:(id)a7;
- (void)downloadFileFromSource:(id)a3 forMigrator:(id)a4 summary:(id)a5 account:(id)a6 segmentCompletion:(id)a7 completion:(id)a8;
- (void)fetchAccountsAndSummariesFromSource:(id)a3 forMigrator:(id)a4 statistics:(id)a5 accountsRequestDurationBlock:(id)a6 summariesRequestDurationBlock:(id)a7 completion:(id)a8;
- (void)importDataForMigrator:(id)a3 fromProvider:(id)a4 forSummaries:(id)a5 summaryStart:(id)a6 summaryCompletion:(id)a7;
- (void)setDownloadsPath:(id)a3;
- (void)setStashDataLocally:(BOOL)a3;
- (void)updateSource:(id)a3 withProgress:(double)a4 remainingTime:(double)a5 completion:(id)a6;
@end

@implementation WLMigrationDataCoordinator

- (WLMigrationDataCoordinator)init
{
  v6.receiver = self;
  v6.super_class = (Class)WLMigrationDataCoordinator;
  v2 = [(WLMigrationDataCoordinator *)&v6 init];
  if (v2)
  {
    v3 = NSHomeDirectory();
    v4 = [v3 stringByAppendingPathComponent:@"/Library/WelcomeKit/Downloads/"];
    [(WLMigrationDataCoordinator *)v2 setDownloadsPath:v4];
  }
  return v2;
}

- (void)setStashDataLocally:(BOOL)a3
{
  self->_stashDataLocally = a3;
  if (a3) {
    +[WLLocalDataSource deleteLocalData];
  }
}

- (void)fetchAccountsAndSummariesFromSource:(id)a3 forMigrator:(id)a4 statistics:(id)a5 accountsRequestDurationBlock:(id)a6 summariesRequestDurationBlock:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v20 = NSString;
  v21 = [v15 contentType];
  v22 = [v20 stringWithFormat:@"fetch '%@' accounts and summaries", v21];

  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __159__WLMigrationDataCoordinator_fetchAccountsAndSummariesFromSource_forMigrator_statistics_accountsRequestDurationBlock_summariesRequestDurationBlock_completion___block_invoke;
  v30[3] = &unk_26490BE08;
  v30[4] = self;
  id v31 = v14;
  id v32 = v15;
  id v33 = v16;
  id v34 = v22;
  id v35 = v17;
  id v36 = v18;
  id v37 = v19;
  id v23 = v19;
  id v24 = v18;
  id v25 = v22;
  id v26 = v16;
  id v27 = v15;
  id v28 = v14;
  id v29 = v17;
  [(WLMigrationDataCoordinator *)self _fetchAccountsFromSource:v28 forMigrator:v27 statistics:v26 completion:v30];
}

void __159__WLMigrationDataCoordinator_fetchAccountsAndSummariesFromSource_forMigrator_statistics_accountsRequestDurationBlock_summariesRequestDurationBlock_completion___block_invoke(uint64_t a1, void *a2, void *a3, int a4, double a5)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v20 = a3;
  if (a4)
  {
    uint64_t v10 = *(void *)(a1 + 72);
    if (v10) {
      (*(void (**)(double))(v10 + 16))(a5);
    }
  }
  id v24 = [MEMORY[0x263EFF980] array];
  uint64_t v35 = 0;
  id v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy_;
  v39 = __Block_byref_object_dispose_;
  id v40 = 0;
  dispatch_semaphore_t v23 = dispatch_semaphore_create(0);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v9;
  uint64_t v11 = [obj countByEnumeratingWithState:&v31 objects:v41 count:16];
  if (v11)
  {
    uint64_t v22 = *(void *)v32;
LABEL_6:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v32 != v22) {
        objc_enumerationMutation(obj);
      }
      uint64_t v13 = *(void *)(*((void *)&v31 + 1) + 8 * v12);
      id v14 = *(void **)(a1 + 32);
      uint64_t v15 = *(void *)(a1 + 40);
      uint64_t v16 = *(void *)(a1 + 48);
      uint64_t v17 = *(void *)(a1 + 56);
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __159__WLMigrationDataCoordinator_fetchAccountsAndSummariesFromSource_forMigrator_statistics_accountsRequestDurationBlock_summariesRequestDurationBlock_completion___block_invoke_6;
      v25[3] = &unk_26490BDE0;
      v25[4] = v14;
      id v26 = *(id *)(a1 + 64);
      v30 = &v35;
      id v29 = *(id *)(a1 + 80);
      id v27 = v24;
      id v18 = v23;
      id v28 = v18;
      [v14 _fetchSummariesFromSource:v15 forMigrator:v16 account:v13 statistics:v17 completion:v25];
      dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
      LOBYTE(v16) = v36[5] == 0;

      if ((v16 & 1) == 0) {
        break;
      }
      if (v11 == ++v12)
      {
        uint64_t v11 = [obj countByEnumeratingWithState:&v31 objects:v41 count:16];
        if (v11) {
          goto LABEL_6;
        }
        break;
      }
    }
  }

  uint64_t v19 = *(void *)(a1 + 88);
  if (v19) {
    (*(void (**)(void))(v19 + 16))();
  }

  _Block_object_dispose(&v35, 8);
}

void __159__WLMigrationDataCoordinator_fetchAccountsAndSummariesFromSource_forMigrator_statistics_accountsRequestDurationBlock_summariesRequestDurationBlock_completion___block_invoke_6(uint64_t a1, void *a2, void *a3, double a4)
{
  id v12 = a2;
  id v7 = a3;
  if (v7)
  {
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = v7;
    uint64_t v9 = *(void *)(a1 + 32);
    _WLLog();
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a3);
  uint64_t v8 = *(void *)(a1 + 64);
  if (v8) {
    (*(void (**)(double))(v8 + 16))(a4);
  }
  if (objc_msgSend(v12, "count", v9, v10, v11)) {
    [*(id *)(a1 + 48) addObjectsFromArray:v12];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

- (void)_fetchAccountsFromSource:(id)a3 forMigrator:(id)a4 statistics:(id)a5 completion:(id)a6
{
  v22[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v11 accountBased])
  {
    id v14 = NSString;
    uint64_t v15 = [v11 contentType];
    uint64_t v16 = [v14 stringWithFormat:@"fetch '%@' accounts", v15];

    _WLLog();
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __89__WLMigrationDataCoordinator__fetchAccountsFromSource_forMigrator_statistics_completion___block_invoke;
    v19[3] = &unk_26490BE30;
    id v20 = v12;
    id v21 = v13;
    objc_msgSend(v10, "accountsDataForMigrator:completion:", v11, v19, self, v16);

    uint64_t v17 = v20;
LABEL_5:

    goto LABEL_6;
  }
  id v18 = objc_alloc_init(WLSourceDeviceAccount);
  uint64_t v16 = v18;
  if (v13)
  {
    v22[0] = v18;
    uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
    (*((void (**)(id, void *, void, void, double))v13 + 2))(v13, v17, 0, 0, 0.0);
    goto LABEL_5;
  }
LABEL_6:
}

void __89__WLMigrationDataCoordinator__fetchAccountsFromSource_forMigrator_statistics_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, double a5)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a4;
  id v11 = *(void **)(a1 + 32);
  if (v9)
  {
    id v24 = v10;
    [v11 addToFetchByteCount:a3];
    [*(id *)(a1 + 32) incrementFetchRequestCount];
    id v12 = [MEMORY[0x263EFF980] array];
    id v13 = [v9 objectForKeyedSubscript:@"dataItemSummaries"];
    BOOL v14 = +[WLSourceDeviceAccount accountInfoArrayContainsNonSyncableAccount:v13];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v15 = v13;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v26;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v26 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v25 + 1) + 8 * v19);
          if (!v14
            || !+[WLSourceDeviceAccount accountInfoRepresentsSyncableAccount:*(void *)(*((void *)&v25 + 1) + 8 * v19)])
          {
            id v21 = +[WLSourceDeviceAccount accountWithInfo:v20];
            [v12 addObject:v21];
          }
          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v17);
    }

    uint64_t v22 = *(void *)(a1 + 40);
    if (v22) {
      (*(void (**)(uint64_t, void *, void, uint64_t, double))(v22 + 16))(v22, v12, 0, 1, a5);
    }

    id v10 = v24;
  }
  else
  {
    [v11 incrementFetchFailedRequestCount];
    uint64_t v23 = *(void *)(a1 + 40);
    if (v23) {
      (*(void (**)(uint64_t, void, id, uint64_t, double))(v23 + 16))(v23, 0, v10, 1, a5);
    }
  }
}

- (void)_fetchSummariesFromSource:(id)a3 forMigrator:(id)a4 account:(id)a5 statistics:(id)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = NSString;
  id v17 = a3;
  uint64_t v18 = [v12 contentType];
  uint64_t v19 = [v13 identifier];
  uint64_t v20 = [v16 stringWithFormat:@"fetch data summaries for '%@' account '%@'", v18, v19];

  long long v25 = self;
  _WLLog();
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __98__WLMigrationDataCoordinator__fetchSummariesFromSource_forMigrator_account_statistics_completion___block_invoke;
  v26[3] = &unk_26490BE58;
  id v27 = v14;
  long long v28 = self;
  id v29 = v12;
  id v30 = v13;
  id v31 = v15;
  id v21 = v15;
  id v22 = v13;
  id v23 = v12;
  id v24 = v14;
  objc_msgSend(v17, "summariesDataForAccount:migrator:completion:", v22, v23, v26, v25, v20);
}

void __98__WLMigrationDataCoordinator__fetchSummariesFromSource_forMigrator_account_statistics_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, double a5)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a4;
  id v11 = *(void **)(a1 + 32);
  if (v9)
  {
    [v11 addToFetchByteCount:a3];
    [*(id *)(a1 + 32) incrementFetchRequestCount];
    id v12 = [v9 objectForKeyedSubscript:@"dataItemSummaries"];
    uint64_t v13 = *(void *)(a1 + 40);
    id v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
    id v15 = [*(id *)(a1 + 48) contentType];
    long long v25 = [*(id *)(a1 + 56) identifier];
    _WLLog();

    uint64_t v16 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v12, "count", v13, v14, v15, v25));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v17 = v12;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v27;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v27 != v20) {
            objc_enumerationMutation(v17);
          }
          id v22 = [*(id *)(a1 + 40) _recordSummaryForMigrator:*(void *)(a1 + 48) withInfo:*(void *)(*((void *)&v26 + 1) + 8 * v21) account:*(void *)(a1 + 56)];
          if (v22) {
            [v16 addObject:v22];
          }

          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v19);
    }

    uint64_t v23 = *(void *)(a1 + 64);
    if (v23) {
      (*(void (**)(uint64_t, void *, void, double))(v23 + 16))(v23, v16, 0, a5);
    }
  }
  else
  {
    [v11 incrementFetchFailedRequestCount];
    uint64_t v24 = *(void *)(a1 + 64);
    if (v24) {
      (*(void (**)(uint64_t, void, id, double))(v24 + 16))(v24, 0, v10, a5);
    }
  }
}

- (void)downloadFileFromSource:(id)a3 forMigrator:(id)a4 summary:(id)a5 account:(id)a6 segmentCompletion:(id)a7 completion:(id)a8
{
  id v36 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v38 = a7;
  id v37 = a8;
  id v17 = NSURL;
  uint64_t v18 = [v15 dataFilePath];
  uint64_t v19 = [v17 fileURLWithPath:v18 isDirectory:0];

  uint64_t v20 = [MEMORY[0x263F08850] defaultManager];
  v55[0] = 0;
  uint64_t v21 = [v20 removeItemAtURL:v19 error:v55];
  id v22 = v55[0];

  if (v21) {
    goto LABEL_7;
  }
  uint64_t v23 = [v22 domain];
  if (([v23 isEqualToString:*MEMORY[0x263F07F70]] & 1) == 0)
  {

LABEL_7:
    uint64_t v35 = [NSNumber numberWithBool:v21];
    long long v33 = self;
    long long v34 = v19;
    _WLLog();

    goto LABEL_8;
  }
  uint64_t v24 = [v22 code];
  long long v25 = v19;
  id v26 = v22;
  id v27 = v16;
  uint64_t v28 = v24;

  BOOL v29 = v28 == 4;
  id v16 = v27;
  id v22 = v26;
  uint64_t v19 = v25;
  if (!v29) {
    goto LABEL_7;
  }
  long long v33 = self;
  long long v34 = v25;
  _WLLog();
LABEL_8:
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v14, "confirmItemSizeWithSourceBeforeDownloading", v33, v34))
  {
    id v30 = v22;
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __110__WLMigrationDataCoordinator_downloadFileFromSource_forMigrator_summary_account_segmentCompletion_completion___block_invoke;
    v47[3] = &unk_26490BE80;
    id v48 = v15;
    id v53 = v38;
    id v54 = v37;
    v49 = self;
    uint64_t v31 = v36;
    id v50 = v36;
    id v51 = v14;
    id v52 = v16;
    [v50 itemSizeForSummary:v48 migrator:v51 completion:v47];

    long long v32 = v48;
  }
  else
  {
    id v30 = v22;
    if (objc_msgSend(v15, "downloadSegmentCount", v33) != 1)
    {
      uint64_t v31 = v36;
      -[WLMigrationDataCoordinator _downloadFileInMultipleSegmentsFromSource:forMigrator:summary:account:itemSize:segmentCompletion:completion:](self, "_downloadFileInMultipleSegmentsFromSource:forMigrator:summary:account:itemSize:segmentCompletion:completion:", v36, v14, v15, v16, [v15 itemSize], v38, v37);
      goto LABEL_15;
    }
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __110__WLMigrationDataCoordinator_downloadFileFromSource_forMigrator_summary_account_segmentCompletion_completion___block_invoke_2;
    v44[3] = &unk_26490BEA8;
    id v45 = v19;
    v46 = self;
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __110__WLMigrationDataCoordinator_downloadFileFromSource_forMigrator_summary_account_segmentCompletion_completion___block_invoke_3;
    v39[3] = &unk_26490BED0;
    v39[4] = self;
    id v40 = v15;
    id v41 = v14;
    id v42 = v38;
    id v43 = v37;
    uint64_t v31 = v36;
    [v36 fileForSummary:v40 migrator:v41 fileAccessor:v44 completion:v39];

    long long v32 = v45;
  }

LABEL_15:
}

uint64_t __110__WLMigrationDataCoordinator_downloadFileFromSource_forMigrator_summary_account_segmentCompletion_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3)
  {
    uint64_t v5 = *(void *)(a1 + 80);
    if (v5) {
      (*(void (**)(void))(v5 + 16))();
    }
  }
  else
  {
    objc_super v6 = -[WLItemSizeConfirmationCompletionAdapter initWithUnconfirmedItemSize:segmentSize:originalSegmentCompletion:originalCompletion:]([WLItemSizeConfirmationCompletionAdapter alloc], "initWithUnconfirmedItemSize:segmentSize:originalSegmentCompletion:originalCompletion:", [*(id *)(a1 + 32) itemSize], +[WLMigrationDataCoordinator downloadSegmentSize](WLMigrationDataCoordinator, "downloadSegmentSize"), *(void *)(a1 + 72), *(void *)(a1 + 80));
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 32);
    id v9 = *(void **)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 64);
    id v12 = [(WLItemSizeConfirmationCompletionAdapter *)v6 segmentCompletion];
    uint64_t v13 = [(WLItemSizeConfirmationCompletionAdapter *)v6 completion];
    [v9 _downloadFileInMultipleSegmentsFromSource:v7 forMigrator:v8 summary:v10 account:v11 itemSize:a2 segmentCompletion:v12 completion:v13];
  }
  return MEMORY[0x270F9A758]();
}

id __110__WLMigrationDataCoordinator_downloadFileFromSource_forMigrator_summary_account_segmentCompletion_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v5 = [*(id *)(a1 + 32) URLByDeletingLastPathComponent];
  id v14 = 0;
  uint64_t v6 = [v4 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:0 error:&v14];
  id v7 = v14;

  if (v6) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    id v9 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v10 = *(void *)(a1 + 32);
    id v13 = 0;
    uint64_t v6 = [v9 copyItemAtURL:v3 toURL:v10 error:&v13];
    id v7 = v13;
  }
  id v12 = [NSNumber numberWithBool:v6];
  _WLLog();

  return v7;
}

uint64_t __110__WLMigrationDataCoordinator_downloadFileFromSource_forMigrator_summary_account_segmentCompletion_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (!v6 && [*(id *)(a1 + 32) stashDataLocally]) {
    +[WLLocalDataSource stashFileForSummary:*(void *)(a1 + 40) migrator:*(void *)(a1 + 48)];
  }
  uint64_t v3 = *(void *)(a1 + 56);
  if (v3) {
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, [*(id *)(a1 + 40) itemSize]);
  }
  uint64_t v4 = *(void *)(a1 + 64);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);
  }
  return MEMORY[0x270F9A758]();
}

+ (BOOL)_allowSegmentedDownloads
{
  return [a1 downloadSegmentSize] != 0;
}

+ (unint64_t)downloadSegmentSize
{
  if (downloadSegmentSize_onceToken != -1) {
    dispatch_once(&downloadSegmentSize_onceToken, &__block_literal_global_2);
  }
  return downloadSegmentSize_downloadSegmentSize;
}

void __49__WLMigrationDataCoordinator_downloadSegmentSize__block_invoke()
{
  id v1 = (id)CFPreferencesCopyAppValue(@"DownloadSegmentSize", @"com.apple.welcomekit");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    downloadSegmentSize_downloadSegmentSize = [v1 unsignedIntegerValue];
    v0 = [NSNumber numberWithUnsignedInteger:downloadSegmentSize_downloadSegmentSize];
    _WLLog();
  }
}

- (void)_downloadSegmentsFromSource:(id)a3 forMigrator:(id)a4 startingAtByteLocation:(unint64_t)a5 ofSummary:(id)a6 account:(id)a7 itemSize:(unint64_t)a8 toFileHandle:(id)a9 segmentCompletion:(id)a10 completion:(id)a11
{
  id v40 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v38 = a9;
  id v37 = a10;
  id v36 = a11;
  unint64_t v19 = +[WLMigrationDataCoordinator downloadSegmentSize];
  unint64_t v35 = a8;
  if (v19 + a5 <= a8) {
    unint64_t v20 = v19;
  }
  else {
    unint64_t v20 = a8 - a5;
  }
  unint64_t v34 = v20;
  uint64_t v21 = NSString;
  id v22 = [NSNumber numberWithUnsignedInteger:a5];
  uint64_t v23 = [NSNumber numberWithUnsignedInteger:v20];
  uint64_t v24 = [v16 contentType];
  long long v25 = [v17 identifier];
  id v26 = [v18 identifier];
  id v41 = [v21 stringWithFormat:@"fetch segment from byte start %@ len %@ into file '%@' record '%@' in account '%@'", v22, v23, v24, v25, v26];

  _WLLog();
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __162__WLMigrationDataCoordinator__downloadSegmentsFromSource_forMigrator_startingAtByteLocation_ofSummary_account_itemSize_toFileHandle_segmentCompletion_completion___block_invoke;
  v42[3] = &unk_26490BEF8;
  unint64_t v51 = a5;
  unint64_t v52 = v34;
  unint64_t v53 = v35;
  id v49 = v37;
  id v50 = v36;
  id v43 = v38;
  v44 = self;
  id v45 = v40;
  id v46 = v16;
  id v47 = v17;
  id v48 = v18;
  id v27 = v18;
  id v28 = v17;
  id v29 = v16;
  id v30 = v40;
  id v31 = v36;
  id v32 = v37;
  id v33 = v38;
  objc_msgSend(v30, "dataSegmentForSummary:byteRange:migrator:completion:", v28, a5, v34, v29, v42, self, v41);
}

void __162__WLMigrationDataCoordinator__downloadSegmentsFromSource_forMigrator_startingAtByteLocation_ofSummary_account_itemSize_toFileHandle_segmentCompletion_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  uint64_t v6 = MEMORY[0x230F5E5D0]();
  id v7 = v12;
  BOOL v8 = (void *)v6;
  if (v12)
  {
    [*(id *)(a1 + 32) writeData:v12];
    [*(id *)(a1 + 32) synchronizeFile];
    id v7 = v12;
  }
  if (v5) {
    goto LABEL_7;
  }
  uint64_t v9 = *(void *)(a1 + 80);
  if (v9) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, [v7 length]);
  }
  uint64_t v10 = *(void *)(a1 + 104) + *(void *)(a1 + 96);
  if (v10 == *(void *)(a1 + 112))
  {
LABEL_7:
    uint64_t v11 = *(void *)(a1 + 88);
    if (v11) {
      (*(void (**)(uint64_t, id))(v11 + 16))(v11, v5);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_downloadSegmentsFromSource:forMigrator:startingAtByteLocation:ofSummary:account:itemSize:toFileHandle:segmentCompletion:completion:", *(void *)(a1 + 48), *(void *)(a1 + 56), v10, *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 32), *(void *)(a1 + 80), *(void *)(a1 + 88));
  }
}

- (void)_downloadFileInMultipleSegmentsFromSource:(id)a3 forMigrator:(id)a4 summary:(id)a5 account:(id)a6 itemSize:(unint64_t)a7 segmentCompletion:(id)a8 completion:(id)a9
{
  id v44 = a4;
  id v14 = a5;
  id v15 = a9;
  id v16 = (void *)MEMORY[0x263F08850];
  id v46 = a8;
  id v45 = a6;
  id v17 = a3;
  id v18 = [v16 defaultManager];
  unint64_t v19 = [v14 dataFilePath];
  [v18 createFileAtPath:v19 contents:0 attributes:0];

  unint64_t v20 = [v14 dataFilePath];
  uint64_t v21 = [v20 stringByDeletingLastPathComponent];

  _WLLog();
  id v22 = objc_msgSend(MEMORY[0x263F08850], "defaultManager", self, v21);
  LOBYTE(a8) = [v22 fileExistsAtPath:v21];

  if ((a8 & 1) == 0)
  {
    uint64_t v23 = [MEMORY[0x263F08850] defaultManager];
    id v54 = 0;
    uint64_t v24 = [v23 createDirectoryAtPath:v21 withIntermediateDirectories:1 attributes:0 error:&v54];
    id v25 = v54;

    id v41 = [NSNumber numberWithBool:v24];
    id v43 = v25;
    id v37 = self;
    id v38 = v21;
    _WLLog();
  }
  v39 = objc_msgSend(v14, "dataFilePath", v37, v38, v41, v43);
  _WLLog();

  id v26 = objc_msgSend(MEMORY[0x263F08850], "defaultManager", self, v39);
  id v27 = [v14 dataFilePath];
  uint64_t v28 = [v26 createFileAtPath:v27 contents:0 attributes:0];

  id v29 = [v14 dataFilePath];
  [NSNumber numberWithBool:v28];
  v42 = id v40 = v29;
  _WLLog();

  id v30 = (void *)MEMORY[0x263F08840];
  id v31 = objc_msgSend(v14, "dataFilePath", self, v40, v42);
  id v32 = [v30 fileHandleForWritingAtPath:v31];

  _WLLog();
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __138__WLMigrationDataCoordinator__downloadFileInMultipleSegmentsFromSource_forMigrator_summary_account_itemSize_segmentCompletion_completion___block_invoke;
  v48[3] = &unk_26490BF20;
  id v49 = v32;
  id v50 = self;
  id v51 = v14;
  id v52 = v44;
  id v53 = v15;
  id v33 = v15;
  id v34 = v44;
  id v35 = v14;
  id v36 = v32;
  [(WLMigrationDataCoordinator *)self _downloadSegmentsFromSource:v17 forMigrator:v34 startingAtByteLocation:0 ofSummary:v35 account:v45 itemSize:a7 toFileHandle:v36 segmentCompletion:v46 completion:v48];
}

uint64_t __138__WLMigrationDataCoordinator__downloadFileInMultipleSegmentsFromSource_forMigrator_summary_account_itemSize_segmentCompletion_completion___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  [*(id *)(a1 + 32) closeFile];
  if (!v5 && [*(id *)(a1 + 40) stashDataLocally]) {
    +[WLLocalDataSource stashFileForSummary:*(void *)(a1 + 48) migrator:*(void *)(a1 + 56)];
  }
  uint64_t v3 = *(void *)(a1 + 64);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
  }
  return MEMORY[0x270F9A758]();
}

- (void)downloadDataFromSource:(id)a3 forMigrator:(id)a4 summary:(id)a5 account:(id)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  id v15 = NSString;
  id v16 = a6;
  id v17 = a3;
  id v18 = [v12 contentType];
  unint64_t v19 = [v13 identifier];
  unint64_t v20 = [v16 identifier];

  uint64_t v21 = [v15 stringWithFormat:@"fetch '%@' record '%@' in account '%@'", v18, v19, v20];

  id v26 = self;
  _WLLog();
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __92__WLMigrationDataCoordinator_downloadDataFromSource_forMigrator_summary_account_completion___block_invoke;
  v27[3] = &unk_26490BF48;
  v27[4] = self;
  id v28 = v21;
  id v29 = v13;
  id v30 = v12;
  id v31 = v14;
  id v22 = v14;
  id v23 = v12;
  id v24 = v13;
  id v25 = v21;
  objc_msgSend(v17, "dataForSummary:migrator:completion:", v24, v23, v27, v26, v21);
}

void __92__WLMigrationDataCoordinator_downloadDataFromSource_forMigrator_summary_account_completion___block_invoke(uint64_t *a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  uint64_t v6 = a1[4];
  uint64_t v7 = a1[5];
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "length"));
  _WLLog();

  if (v10 && !v5 && objc_msgSend((id)a1[4], "stashDataLocally", v6, v7, v9, 0)) {
    +[WLLocalDataSource stashData:v10 forSummary:a1[6] migrator:a1[7]];
  }
  uint64_t v8 = a1[8];
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v10, v5);
  }
}

- (void)importDataForMigrator:(id)a3 fromProvider:(id)a4 forSummaries:(id)a5 summaryStart:(id)a6 summaryCompletion:(id)a7
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v37 = (void (**)(id, void *))a4;
  id v13 = a5;
  id v14 = (void (**)(id, void))a6;
  id v15 = (void (**)(id, uint64_t, void))a7;
  id v32 = self;
  if ([(WLMigrationDataCoordinator *)self stashDataLocally])
  {
    long long v47 = 0u;
    long long v48 = 0u;
    long long v46 = 0u;
    long long v45 = 0u;
    id v31 = v13;
    id v16 = v13;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v46 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v45 + 1) + 8 * i);
          if (v14) {
            v14[2](v14, *(void *)(*((void *)&v45 + 1) + 8 * i));
          }
          if (v15) {
            v15[2](v15, v21, 0);
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v45 objects:v50 count:16];
      }
      while (v18);
    }

LABEL_32:
    id v13 = v31;
    goto LABEL_33;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    id v35 = v12;
    dispatch_semaphore_t v34 = dispatch_semaphore_create(0);
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v31 = v13;
    id obj = v13;
    uint64_t v22 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v36 = *(void *)v42;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v42 != v36) {
            objc_enumerationMutation(obj);
          }
          id v25 = *(void **)(*((void *)&v41 + 1) + 8 * v24);
          id v26 = (void *)MEMORY[0x230F5E5D0](v22);
          if (v14) {
            ((void (**)(id, void *))v14)[2](v14, v25);
          }
          id v27 = v37[2](v37, v25);
          if (v27 || [v25 storeDataAsFile])
          {
            id v28 = objc_msgSend(v25, "account", v30);
            v38[0] = MEMORY[0x263EF8330];
            v38[1] = 3221225472;
            v38[2] = __109__WLMigrationDataCoordinator_importDataForMigrator_fromProvider_forSummaries_summaryStart_summaryCompletion___block_invoke;
            v38[3] = &unk_26490BF70;
            id v40 = v15;
            v38[4] = v25;
            id v29 = v34;
            v39 = v29;
            [v35 importRecordData:v27 summary:v25 account:v28 completion:v38];

            dispatch_semaphore_wait(v29, 0xFFFFFFFFFFFFFFFFLL);
          }
          else
          {
            id v30 = v32;
            _WLLog();
            if (v15) {
              v15[2](v15, (uint64_t)v25, 0);
            }
          }

          ++v24;
        }
        while (v23 != v24);
        uint64_t v22 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
        uint64_t v23 = v22;
      }
      while (v22);
    }

    id v12 = v35;
    goto LABEL_32;
  }
  [v12 importDataFromProvider:v37 forSummaries:v13 summaryStart:v14 summaryCompletion:v15];
LABEL_33:
}

intptr_t __109__WLMigrationDataCoordinator_importDataForMigrator_fromProvider_forSummaries_summaryStart_summaryCompletion___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, a1[4]);
  }
  uint64_t v3 = a1[5];
  return dispatch_semaphore_signal(v3);
}

- (void)updateSource:(id)a3 withProgress:(double)a4 remainingTime:(double)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = v11;
  if (self->_doneSent)
  {
    if (v11) {
      (*((void (**)(id, uint64_t, void))v11 + 2))(v11, 1, 0);
    }
  }
  else
  {
    uint64_t v13 = vcvtmd_s64_f64(a4 * 100.0) | 0x4059000000000000;
    if (a4 >= 1.0) {
      id v14 = @"update progress to status=done (percentProgress=%d, remainingTime=%f)";
    }
    else {
      id v14 = @"update progress to status=active (percentProgress=%d, remainingTime=%f)";
    }
    id v15 = objc_msgSend(NSString, "stringWithFormat:", v14, v13, *(void *)&a5);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __81__WLMigrationDataCoordinator_updateSource_withProgress_remainingTime_completion___block_invoke;
    v16[3] = &unk_26490BF98;
    double v18 = a4;
    v16[4] = self;
    id v17 = v12;
    [v10 updateUIWithProgress:v15 remainingTime:v16 logString:a4 completion:a5];
  }
}

void __81__WLMigrationDataCoordinator_updateSource_withProgress_remainingTime_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3 && *(double *)(a1 + 48) >= 1.0) {
    *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4)
  {
    id v5 = v3;
    (*(void (**)(uint64_t, BOOL))(v4 + 16))(v4, v3 == 0);
    id v3 = v5;
  }
}

- (id)_recordSummaryForMigrator:(id)a3 withInfo:(id)a4 account:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = +[WLSourceDeviceRecordSummary summaryWithInfo:a4 account:v9];
  int v11 = [v8 storeRecordDataInDatabase];
  if ((v11 & 1) == 0)
  {
    [v10 setStoreDataAsFile:1];
    id v25 = [(WLMigrationDataCoordinator *)self downloadsPath];
    id v12 = [MEMORY[0x263F08C38] UUID];
    uint64_t v13 = [v12 UUIDString];

    id v14 = [MEMORY[0x263F08C38] UUID];
    id v15 = [v14 UUIDString];

    id v16 = [v10 identifier];
    id v17 = [v16 lastPathComponent];
    double v18 = [v17 pathExtension];
    uint64_t v19 = [v18 lowercaseString];

    if (v19)
    {
      uint64_t v20 = [v15 stringByAppendingPathExtension:v19];

      id v15 = (void *)v20;
    }
    uint64_t v21 = [v25 stringByAppendingPathComponent:v13];
    uint64_t v22 = [v21 stringByAppendingPathComponent:v15];
    [v10 setDataFilePath:v22];
  }
  if (((v11 | !+[WLMigrationDataCoordinator _allowSegmentedDownloads](WLMigrationDataCoordinator, "_allowSegmentedDownloads")) & 1) == 0&& [v10 itemSize]&& objc_msgSend(v8, "wantsSegmentedDownloads"))
  {
    unint64_t v23 = +[WLMigrationDataCoordinator segmentCountForItemSize:segmentSize:](WLMigrationDataCoordinator, "segmentCountForItemSize:segmentSize:", [v10 itemSize], +[WLMigrationDataCoordinator downloadSegmentSize](WLMigrationDataCoordinator, "downloadSegmentSize"));
  }
  else
  {
    unint64_t v23 = 1;
  }
  [v10 setDownloadSegmentCount:v23];
  if (![v10 itemSize] && (objc_opt_respondsToSelector() & 1) != 0) {
    [v8 estimateItemSizeForSummary:v10 account:v9];
  }

  return v10;
}

+ (unint64_t)segmentCountForItemSize:(unint64_t)a3 segmentSize:(unint64_t)a4
{
  if (a3 / a4 * a4 >= a3) {
    return a3 / a4;
  }
  else {
    return a3 / a4 + 1;
  }
}

- (BOOL)stashDataLocally
{
  return self->_stashDataLocally;
}

- (NSString)downloadsPath
{
  return self->_downloadsPath;
}

- (void)setDownloadsPath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end