@interface WLMigrator
+ (BOOL)_shouldContinueMigrationFromAnotherDevice;
+ (BOOL)_shouldTerminateMigrationBeforeImport;
+ (BOOL)stashDataLocally;
+ (id)_dataTypesAndSizesXMLDataFromMap:(id)a3;
+ (id)_systemVersion;
+ (unint64_t)_bytesFreeOnDevice;
+ (void)_parseDataTypesXMLData:(id)a3 completion:(id)a4;
+ (void)_presentPromptForMigrableApps:(id)a3;
+ (void)setStashDataLocally:(BOOL)a3;
- (BOOL)_shouldForceDownloadError;
- (BOOL)_shouldTerminateMigrationOnError;
- (WLMigrationDataSource)dataSource;
- (WLSocketHandler)activeSocketHandler;
- (double)_didFinishDownloadingSegmentOfSize:(unint64_t)a3 expectedSize:(unint64_t)a4 migratorEstimatesItemSizes:(BOOL)a5 endDate:(id)a6 context:(id)a7;
- (double)_progressIncrementForImportedSummary:(id)a3 summaries:(id)a4 accounts:(id)a5 migrators:(id)a6;
- (id)_downloadDataWithContext:(id)a3 failureDetailsBlock:(id)a4;
- (id)_fetchAccountsAndSummariesWithContext:(id)a3;
- (id)_importDataWithContext:(id)a3 failureDetailsBlock:(id)a4;
- (id)_selectDataTypesWithContext:(id)a3;
- (id)downloadData:(id)a3;
- (id)fetchSummary:(id)a3;
- (id)finishMigration:(id)a3;
- (id)importData:(id)a3;
- (id)migrators:(id)a3;
- (id)prepare:(id)a3 delegate:(id)a4 error:(id *)a5;
- (id)runPostMigrationTasks:(id)a3;
- (id)selectDataTypes:(id)a3;
- (void)_cleanUpAfterFinalizeMigratableAppsWithSQLController:(id)a3 completion:(id)a4;
- (void)_deleteDownloadsPath:(id)a3;
- (void)_finishMigrationWithError:(id)a3 context:(id)a4 disconnected:(BOOL)a5 completion:(id)a6;
- (void)_incrementProgressBy:(double)a3 context:(id)a4;
- (void)_logStatisticsAndSendStatisticsTelemetryWithContext:(id)a3;
- (void)_prepareMetadata:(id)a3 usingRetryPolicies:(BOOL)a4 allowContinuationFromAnotherDevice:(BOOL)a5;
- (void)_reportTimeEstimatesWithContext:(id)a3;
- (void)_selectFromDataTypeToSizeMap:(id)a3 device:(id)a4 completion:(id)a5;
- (void)_setProgressTo:(double)a3 context:(id)a4;
- (void)_updateSourceWithProgress:(double)a3 remainingTime:(double)a4 context:(id)a5 completion:(id)a6;
- (void)cleanup;
- (void)close:(id)a3;
- (void)connectionDidEnd;
- (void)dealloc;
- (void)deleteMessages;
- (void)finalizeMigratableAppsWithCompletion:(id)a3;
- (void)setActiveSocketHandler:(id)a3;
- (void)setDataSource:(id)a3;
- (void)startMigration:(id)a3 usingRetryPolicies:(BOOL)a4 completion:(id)a5;
- (void)startMigrationWithSourceDevice:(id)a3 usingRetryPolicies:(BOOL)a4 delegate:(id)a5 completion:(id)a6;
@end

@implementation WLMigrator

- (void)dealloc
{
  _WLLog();
  v4.receiver = self;
  v4.super_class = (Class)WLMigrator;
  [(WLMigrator *)&v4 dealloc];
}

- (void)connectionDidEnd
{
  _WLLog();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeSocketHandler);
  objc_msgSend(WeakRetained, "cancel", self);
}

- (void)_deleteDownloadsPath:(id)a3
{
  v3 = (void *)MEMORY[0x263F08850];
  id v4 = a3;
  v5 = [v3 defaultManager];
  id v7 = 0;
  [v5 removeItemAtPath:v4 error:&v7];

  id v6 = v7;
  if (v6) {
    _WLLog();
  }
}

- (void)_prepareMetadata:(id)a3 usingRetryPolicies:(BOOL)a4 allowContinuationFromAnotherDevice:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  id v20 = v8;
  if (v5)
  {
    v9 = [MEMORY[0x263EFF910] date];
    [v20 setCommunicationDate:v9];

    [v20 setAttemptCount:1];
    id v8 = v20;
  }
  if (!v6 || (v10 = [v8 state], id v8 = v20, v10 != 3))
  {
    uint64_t v11 = [v8 state];
    id v8 = v20;
    if (v11)
    {
      unint64_t v12 = [v20 state];
      id v8 = v20;
      if (v12 <= 3)
      {
        v13 = [v20 communicationDate];
        v14 = [v13 dateByAddingTimeInterval:*(double *)""];

        v15 = [MEMORY[0x263EFF910] date];
        uint64_t v16 = [v14 compare:v15];

        if (v16 == -1)
        {
          _WLLog();
          objc_msgSend(v20, "setState:", 0, self, v17);
        }
        else if ((unint64_t)[v20 attemptCount] >= 2)
        {
          v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v20, "attemptCount"));
          _WLLog();

          objc_msgSend(v20, "setState:", 0, self, v18);
        }

        id v8 = v20;
      }
    }
  }
  if ([v8 state])
  {
    v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v20, "state"));
    _WLLog();

    objc_msgSend(v20, "setAttemptCount:", objc_msgSend(v20, "attemptCount", self, v19) + 1);
  }
  else
  {
    [v20 setAttemptCount:1];
    [v20 setCrashCount:0];
  }
}

- (void)startMigrationWithSourceDevice:(id)a3 usingRetryPolicies:(BOOL)a4 delegate:(id)a5 completion:(id)a6
{
  BOOL v7 = a4;
  id v13 = 0;
  id v10 = a6;
  uint64_t v11 = [(WLMigrator *)self prepare:a3 delegate:a5 error:&v13];
  id v12 = v13;
  if (v12) {
    [(WLMigrator *)self _finishMigrationWithError:v12 context:v11 disconnected:0 completion:v10];
  }
  else {
    [(WLMigrator *)self startMigration:v11 usingRetryPolicies:v7 completion:v10];
  }
}

- (id)prepare:(id)a3 delegate:(id)a4 error:(id *)a5
{
  v55[1] = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init(WLMigrationContext);
  [(WLMigrationContext *)v10 setSourceDevice:v9];
  [(WLMigrationContext *)v10 setDelegate:v8];

  uint64_t v11 = [v9 apiLevel];
  id v12 = [(WLMigrationContext *)v10 payload];
  [v12 setAndroidAPILevel:v11];

  id v13 = [v9 brand];
  v14 = [(WLMigrationContext *)v10 payload];
  [v14 setAndroidBrand:v13];

  v15 = [v9 locale];
  uint64_t v16 = [(WLMigrationContext *)v10 payload];
  [v16 setAndroidLocale:v15];

  uint64_t v17 = [v9 model];
  v18 = [(WLMigrationContext *)v10 payload];
  [v18 setAndroidModel:v17];

  v19 = [v9 osVersion];
  id v20 = [(WLMigrationContext *)v10 payload];
  [v20 setAndroidOSVersion:v19];

  v21 = [v9 version];
  v22 = [(WLMigrationContext *)v10 payload];
  [v22 setAndroidVersion:v21];

  v23 = [v9 versionCode];

  v24 = [(WLMigrationContext *)v10 payload];
  [v24 setAndroidVersionCode:v23];

  v25 = [(WLMigrationContext *)v10 payload];
  [v25 setState:@"starting"];

  v26 = +[WLCredentialStore sharedInstance];
  v27 = [v26 currentAuthentication];

  if (v27
    || ([(WLMigrationContext *)v10 sourceDevice],
        v28 = objc_claimAutoreleasedReturnValue(),
        char v29 = [v28 isLocal],
        v28,
        (v29 & 1) != 0))
  {
    [(WLMigrationContext *)v10 setPowerAssertion:CPPowerAssertionCreate()];
    uint64_t v52 = [(WLMigrationContext *)v10 powerAssertion];
    _WLLog();
    v30 = -[WLURLSessionController initWithAuthentication:]([WLURLSessionController alloc], "initWithAuthentication:", v27, self, v52);
    [(WLMigrationContext *)v10 setUrlSessionController:v30];

    v31 = [(WLMigrationContext *)v10 sourceDevice];
    int v32 = [v31 isLocal];

    if (v32)
    {
      v33 = objc_alloc_init(WLLocalDataSource);
      [(WLMigrationContext *)v10 setDataSource:v33];
    }
    else if (self->_dataSource)
    {
      -[WLMigrationContext setDataSource:](v10, "setDataSource:");
    }
    else
    {
      v38 = [WLRemoteDeviceDataSource alloc];
      v53 = [(WLMigrationContext *)v10 sourceDevice];
      v39 = [v53 ipAddress];
      v40 = [(WLMigrationContext *)v10 sourceDevice];
      uint64_t v41 = [v40 httpPort];
      v42 = [(WLMigrationContext *)v10 urlSessionController];
      v43 = [v42 urlSession];
      v44 = [(WLRemoteDeviceDataSource *)v38 initWithHost:v39 port:v41 session:v43];
      [(WLMigrationContext *)v10 setDataSource:v44];
    }
    v45 = objc_alloc_init(WLMigrationDataCoordinator);
    [(WLMigrationContext *)v10 setDataCoordinator:v45];

    if ((v32 & 1) == 0 && +[WLMigrator stashDataLocally])
    {
      v46 = [(WLMigrationContext *)v10 dataCoordinator];
      [v46 setStashDataLocally:1];
    }
    v47 = objc_alloc_init(WLSQLController);
    [(WLMigrationContext *)v10 setSqlController:v47];

    id v48 = objc_alloc_init(MEMORY[0x263EFF980]);
    [(WLMigrationContext *)v10 setThroughputSamples:v48];

    v49 = objc_alloc_init(WLTimeEstimateAccuracyTracker);
    [(WLMigrationContext *)v10 setTimeEstimateAccuracyTracker:v49];

    v50 = [(WLMigrator *)self migrators:v10];
    [(WLMigrationContext *)v10 setMigrators:v50];
  }
  else
  {
    v34 = [(WLMigrationContext *)v10 payload];
    [v34 setState:@"authentication_error"];

    if (a5)
    {
      v35 = (void *)MEMORY[0x263F087E8];
      uint64_t v36 = *MEMORY[0x263F86308];
      uint64_t v54 = *MEMORY[0x263F08320];
      v55[0] = @"No device authentication";
      v37 = [NSDictionary dictionaryWithObjects:v55 forKeys:&v54 count:1];
      *a5 = [v35 errorWithDomain:v36 code:4 userInfo:v37];
    }
  }

  return v10;
}

- (void)startMigration:(id)a3 usingRetryPolicies:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v67 = a5;
  _WLLog();
  BOOL v9 = +[WLMigrator _shouldContinueMigrationFromAnotherDevice];
  id v10 = [v8 sqlController];
  uint64_t v11 = [v8 sourceDevice];
  id v12 = [v10 migrationMetadataForSourceDevice:v11 strictMatch:v9 ^ 1];
  [v8 setMetadata:v12];

  id v13 = [v8 sourceDevice];
  LODWORD(v11) = [v13 isSelectingDataTypeInHandshake];

  if (v11)
  {
    v14 = [v8 metadata];
    [v14 setState:0];
  }
  v15 = [v8 metadata];
  [(WLMigrator *)self _prepareMetadata:v15 usingRetryPolicies:v6 allowContinuationFromAnotherDevice:v9];

  uint64_t v16 = [v8 metadata];
  objc_msgSend(v16, "setCrashCount:", objc_msgSend(v16, "crashCount") + 1);

  uint64_t v17 = [v8 metadata];
  unint64_t v18 = [v17 state];

  if (v18 >= 3)
  {
    v66 = self;
    id v19 = objc_alloc(MEMORY[0x263EFF980]);
    id v20 = [v8 migrators];
    v21 = objc_msgSend(v19, "initWithCapacity:", objc_msgSend(v20, "count"));

    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    v22 = [v8 migrators];
    uint64_t v23 = [v22 countByEnumeratingWithState:&v68 objects:v72 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v69;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v69 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = *(void **)(*((void *)&v68 + 1) + 8 * i);
          v28 = [v8 sqlController];
          char v29 = [v27 contentType];
          v30 = [v28 statisticsForContentType:v29];

          if ([v30 selectedForMigration]) {
            [v21 addObject:v27];
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v68 objects:v72 count:16];
      }
      while (v24);
    }

    [v8 setMigrators:v21];
    self = v66;
  }
  v31 = [v8 metadata];
  unint64_t v32 = [v31 state];

  if (v32 >= 4)
  {
    v33 = [v8 sqlController];
    v34 = +[WLStatistics aggregateContentType];
    v35 = [v33 statisticsForContentType:v34];
    [v8 setAggregateStatistics:v35];
  }
  uint64_t v36 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:-5.0];
  [v8 setLastProgressSentDate:v36];

  v37 = [v8 metadata];
  uint64_t v38 = [v37 state];

  double v39 = 0.0;
  switch(v38)
  {
    case 0:
    case 1:
      v40 = [v8 payload];
      [v40 setState:@"fetching"];

      uint64_t v41 = [MEMORY[0x263EFF910] date];
      v42 = [(WLMigrator *)self fetchSummary:v8];
      v43 = [MEMORY[0x263EFF910] date];
      [v43 timeIntervalSinceDate:v41];
      double v39 = v44 + 0.0;

      if (v42)
      {
        v45 = [v8 payload];
        v46 = v45;
        v47 = @"fetching_error";
        goto LABEL_31;
      }

      goto LABEL_21;
    case 2:
LABEL_21:
      id v48 = [v8 payload];
      [v48 setState:@"selecting"];

      uint64_t v49 = [(WLMigrator *)self selectDataTypes:v8];
      if (!v49) {
        goto LABEL_23;
      }
      v42 = (void *)v49;
      uint64_t v41 = [v8 payload];
      [v41 setState:@"selecting_error"];
      goto LABEL_37;
    case 3:
LABEL_23:
      v50 = [v8 payload];
      [v50 setState:@"downloading"];

      uint64_t v41 = [MEMORY[0x263EFF910] date];
      v42 = [(WLMigrator *)self downloadData:v8];
      v51 = [MEMORY[0x263EFF910] date];
      [v51 timeIntervalSinceDate:v41];
      double v39 = v39 + v52;

      if (v42)
      {
        v45 = [v8 payload];
        v46 = v45;
        v47 = @"downloading_error";
LABEL_31:
        [v45 setState:v47];

        goto LABEL_37;
      }

LABEL_26:
      v53 = [v8 payload];
      [v53 setState:@"importing"];

      uint64_t v41 = [MEMORY[0x263EFF910] date];
      v42 = [(WLMigrator *)self importData:v8];
      uint64_t v54 = [MEMORY[0x263EFF910] date];
      [v54 timeIntervalSinceDate:v41];
      double v39 = v39 + v55;

      if (v42)
      {
        v45 = [v8 payload];
        v46 = v45;
        v47 = @"importing_error";
        goto LABEL_31;
      }

LABEL_29:
      v56 = [v8 payload];
      [v56 setState:@"tasking"];

      uint64_t v41 = [MEMORY[0x263EFF910] date];
      v42 = [(WLMigrator *)self runPostMigrationTasks:v8];
      v57 = [MEMORY[0x263EFF910] date];
      [v57 timeIntervalSinceDate:v41];
      double v39 = v39 + v58;

      if (v42)
      {
        v45 = [v8 payload];
        v46 = v45;
        v47 = @"tasking_error";
        goto LABEL_31;
      }

LABEL_33:
      v59 = [v8 payload];
      [v59 setState:@"finishing"];

      uint64_t v41 = [MEMORY[0x263EFF910] date];
      v42 = [(WLMigrator *)self finishMigration:v8];
      if (v42)
      {
        v60 = [v8 payload];
        v61 = v60;
        v62 = @"finishing_error";
      }
      else
      {
        v63 = [MEMORY[0x263EFF910] date];
        [v63 timeIntervalSinceDate:v41];
        double v39 = v39 + v64;

        v60 = [v8 payload];
        v61 = v60;
        v62 = @"finished";
      }
      [v60 setState:v62];

LABEL_37:
      v65 = [v8 payload];
      [v65 setElapsedTime:(unint64_t)v39];

      [(WLMigrator *)self _finishMigrationWithError:v42 context:v8 disconnected:0 completion:v67];
      return;
    case 4:
      goto LABEL_26;
    case 5:
      goto LABEL_29;
    case 6:
      goto LABEL_33;
    default:
      uint64_t v41 = [v8 metadata];
      [v41 state];
      _WLLog();
      v42 = 0;
      double v39 = 0.0;
      goto LABEL_37;
  }
}

- (id)migrators:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  BOOL v5 = objc_alloc_init(WLContactsMigrator);
  BOOL v6 = [v3 payload];
  BOOL v7 = [v6 contacts];
  [(WLContactsMigrator *)v5 setFeaturePayload:v7];

  id v48 = v5;
  [v4 addObject:v5];
  id v8 = objc_alloc_init(WLCalendarMigrator);
  BOOL v9 = [v3 payload];
  id v10 = [v9 calendars];
  [(WLCalendarMigrator *)v8 setFeaturePayload:v10];

  v47 = v8;
  [v4 addObject:v8];
  uint64_t v11 = objc_alloc_init(WLBookmarksMigrator);
  id v12 = [v3 payload];
  id v13 = [v12 bookmarks];
  [(WLBookmarksMigrator *)v11 setFeaturePayload:v13];

  [v4 addObject:v11];
  v14 = [WLMessagesMigrator alloc];
  v15 = [v3 sqlController];
  uint64_t v16 = [(WLMessagesMigrator *)v14 initWithSQLController:v15];

  uint64_t v17 = [v3 payload];
  unint64_t v18 = [v17 messages];
  [(WLMessagesMigrator *)v16 setFeaturePayload:v18];

  [v4 addObject:v16];
  id v19 = objc_alloc_init(WLMailAccountMigrator);
  id v20 = [v3 payload];
  v21 = [v20 accounts];
  [(WLMailAccountMigrator *)v19 setFeaturePayload:v21];

  [v4 addObject:v19];
  v22 = objc_alloc_init(WLPhotosMigrator);
  uint64_t v23 = [v3 payload];
  uint64_t v24 = [v23 photos];
  [(WLPhotosMigrator *)v22 setFeaturePayload:v24];

  [v4 addObject:v22];
  uint64_t v25 = objc_alloc_init(WLVideosMigrator);
  v26 = [v3 payload];
  v27 = [v26 videos];
  [(WLVideosMigrator *)v25 setFeaturePayload:v27];

  [v4 addObject:v25];
  v28 = [v3 sourceDevice];
  LODWORD(v26) = [v28 canAddFiles];

  if (v26)
  {
    char v29 = objc_alloc_init(WLFilesMigrator);
    v30 = [v3 payload];
    v31 = [v30 files];
    [(WLFilesMigrator *)v29 setFeaturePayload:v31];

    [v4 addObject:v29];
  }
  unint64_t v32 = [v3 sourceDevice];
  int v33 = [v32 canAddDisplay];

  if (v33)
  {
    v34 = objc_alloc_init(WLDisplayMigrator);
    v35 = [v3 payload];
    uint64_t v36 = [v35 displaySettings];
    [(WLDisplayMigrator *)v34 setFeaturePayload:v36];

    [v4 addObject:v34];
  }
  v37 = [v3 sourceDevice];
  int v38 = [v37 canAddAccessibility];

  if (v38)
  {
    double v39 = objc_alloc_init(WLAccessibilityMigrator);
    v40 = [v3 payload];
    uint64_t v41 = [v40 accessibilitySettings];
    [(WLAccessibilityMigrator *)v39 setFeaturePayload:v41];

    [v4 addObject:v39];
  }
  v42 = [WLAppMigrator alloc];
  v43 = [v3 sourceDevice];
  double v44 = [v3 sqlController];
  v45 = [(WLAppMigrator *)v42 initWithDevice:v43 sqlController:v44];

  [v4 addObject:v45];
  return v4;
}

- (id)fetchSummary:(id)a3
{
  v30[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [v4 metadata];
  [v5 setState:1];

  BOOL v6 = [v4 delegate];
  [v6 dataMigrator:self didUpdateMigrationState:1];

  BOOL v7 = [MEMORY[0x263EFF910] date];
  id v8 = [v4 metadata];
  [v8 setCommunicationDate:v7];

  BOOL v9 = [v4 sqlController];
  [v9 deleteMetadataForAllDevices];

  id v10 = [v4 sqlController];
  [v10 deleteAccountsAndSummariesForAllDevices];

  uint64_t v11 = [v4 dataCoordinator];
  id v12 = [v11 downloadsPath];
  [(WLMigrator *)self _deleteDownloadsPath:v12];

  id v13 = [v4 sqlController];
  [v13 deleteMigratableAppsForAllDevices];

  v14 = [v4 sqlController];
  [v14 deleteSuggestedAppBundleIDsForAllDevices];

  v15 = [v4 sqlController];
  [v15 deleteGroupMessageInfoForAllDevices];

  uint64_t v16 = [v4 sqlController];
  [v16 deleteMessagePhoneNumbersForAllDevices];

  uint64_t v17 = [v4 sqlController];
  [v17 deleteStatisticsForAllDevices];

  unint64_t v18 = [v4 sqlController];
  id v19 = [v4 metadata];
  id v20 = [v4 sourceDevice];
  [v18 insertMetadata:v19 forSourceDevice:v20];

  v21 = [(WLMigrator *)self _fetchAccountsAndSummariesWithContext:v4];

  if (v21)
  {
    v28 = self;
    _WLLog();
    v22 = (void *)MEMORY[0x263F087E8];
    uint64_t v23 = *MEMORY[0x263F86308];
    uint64_t v24 = *MEMORY[0x263F86300];
    v29[0] = *MEMORY[0x263F08608];
    v29[1] = v24;
    v30[0] = v21;
    v30[1] = @"metaSummaries";
    uint64_t v25 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v30, v29, 2, v28, v21);
    v26 = [v22 errorWithDomain:v23 code:2 userInfo:v25];
  }
  else
  {
    v26 = 0;
  }
  return v26;
}

- (id)selectDataTypes:(id)a3
{
  v25[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [v4 metadata];
  [v5 setState:2];

  BOOL v6 = [v4 sourceDevice];
  char v7 = [v6 isSelectingDataTypeInHandshake];

  if ((v7 & 1) == 0)
  {
    id v8 = [v4 delegate];
    [v8 dataMigrator:self didUpdateMigrationState:2];
  }
  BOOL v9 = [MEMORY[0x263EFF910] date];
  id v10 = [v4 metadata];
  [v10 setCommunicationDate:v9];

  uint64_t v11 = [v4 sqlController];
  id v12 = [v4 metadata];
  id v13 = [v4 sourceDevice];
  [v11 setMetadata:v12 forSourceDevice:v13];

  uint64_t v14 = [(WLMigrator *)self _selectDataTypesWithContext:v4];
  if (v14)
  {
    v15 = (void *)v14;
    v22 = self;
    uint64_t v23 = v14;
    _WLLog();
    uint64_t v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = *MEMORY[0x263F86308];
    uint64_t v18 = *MEMORY[0x263F86300];
    v24[0] = *MEMORY[0x263F08608];
    v24[1] = v18;
    v25[0] = v15;
    v25[1] = @"metaSelectingDataTypes";
    id v19 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v25, v24, 2, v22, v23);
    id v20 = [v16 errorWithDomain:v17 code:2 userInfo:v19];
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

- (id)downloadData:(id)a3
{
  v47[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [v4 metadata];
  [v5 setState:3];

  BOOL v6 = [v4 delegate];
  [v6 dataMigrator:self didUpdateMigrationState:3];

  char v7 = [MEMORY[0x263EFF910] date];
  id v8 = [v4 metadata];
  [v8 setCommunicationDate:v7];

  BOOL v9 = [v4 sqlController];
  id v10 = +[WLStatistics aggregateContentType];
  uint64_t v11 = [v9 statisticsForContentType:v10];
  [v4 setAggregateStatistics:v11];

  [(WLMigrator *)self _setProgressTo:v4 context:0.0];
  dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __27__WLMigrator_downloadData___block_invoke;
  v44[3] = &unk_26490C1A0;
  id v13 = v12;
  v45 = v13;
  [(WLMigrator *)self _updateSourceWithProgress:v4 remainingTime:v44 context:0.0 completion:0.0];
  dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v14 = [v4 sqlController];
  v15 = [v4 metadata];
  uint64_t v16 = [v4 sourceDevice];
  [v14 setMetadata:v15 forSourceDevice:v16];

  uint64_t v38 = 0;
  double v39 = &v38;
  uint64_t v40 = 0x3032000000;
  uint64_t v41 = __Block_byref_object_copy__2;
  v42 = __Block_byref_object_dispose__2;
  id v43 = 0;
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __27__WLMigrator_downloadData___block_invoke_115;
  v37[3] = &unk_26490C868;
  v37[4] = &v38;
  uint64_t v17 = [(WLMigrator *)self _downloadDataWithContext:v4 failureDetailsBlock:v37];
  if (v17)
  {
    unint64_t v32 = self;
    _WLLog();
    id v18 = objc_alloc(MEMORY[0x263EFF9A0]);
    uint64_t v19 = *MEMORY[0x263F86318];
    v46[0] = *MEMORY[0x263F08608];
    v46[1] = v19;
    v47[0] = v17;
    v47[1] = MEMORY[0x263EFFA88];
    id v20 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v47, v46, 2, v32, v17);
    v21 = (void *)[v18 initWithDictionary:v20];

    uint64_t v22 = v39[5];
    if (v22) {
      [v21 setObject:v22 forKeyedSubscript:*MEMORY[0x263F86300]];
    }
    uint64_t v23 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F86308] code:2 userInfo:v21];

    uint64_t v24 = v23;
    uint64_t v25 = v24;
  }
  else
  {
    [(WLMigrator *)self _setProgressTo:v4 context:0.8];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __27__WLMigrator_downloadData___block_invoke_2;
    v35[3] = &unk_26490C1A0;
    v26 = v13;
    uint64_t v36 = v26;
    [(WLMigrator *)self _updateSourceWithProgress:v4 remainingTime:v35 context:1.0 completion:0.0];
    dispatch_semaphore_wait(v26, 0xFFFFFFFFFFFFFFFFLL);
    [(WLMigrator *)self _reportTimeEstimatesWithContext:v4];
    v27 = [v4 throughputSamples];
    [v27 removeAllObjects];

    [v4 setTimeEstimateAccuracyTracker:0];
    dispatch_semaphore_t v28 = dispatch_semaphore_create(0);
    char v29 = +[WLWiFiController sharedInstance];
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __27__WLMigrator_downloadData___block_invoke_3;
    v33[3] = &unk_26490C890;
    v30 = v28;
    v34 = v30;
    [v29 disableSoftAPWithCompletion:v33];

    dispatch_semaphore_wait(v30, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v25 = 0;
    uint64_t v24 = v36;
  }

  _Block_object_dispose(&v38, 8);
  return v25;
}

intptr_t __27__WLMigrator_downloadData___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __27__WLMigrator_downloadData___block_invoke_115(uint64_t a1, void *a2)
{
}

intptr_t __27__WLMigrator_downloadData___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __27__WLMigrator_downloadData___block_invoke_3(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)importData:(id)a3
{
  v42[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [v4 metadata];
  [v5 setState:4];

  BOOL v6 = [v4 delegate];
  [v6 dataMigrator:self didUpdateMigrationState:4];

  char v7 = [MEMORY[0x263EFF910] date];
  id v8 = [v4 aggregateStatistics];
  [v8 setImportStartDate:v7];

  unint64_t v9 = +[WLMigrator _bytesFreeOnDevice];
  id v10 = [v4 aggregateStatistics];
  [v10 setImportStartBytesFree:v9];

  uint64_t v11 = [v4 delegate];
  [v11 dataMigratorDidBecomeRestartable:self];

  [(WLMigrator *)self _setProgressTo:v4 context:0.8];
  dispatch_semaphore_t v12 = [v4 sqlController];
  id v13 = [v4 metadata];
  uint64_t v14 = [v4 sourceDevice];
  [v12 setMetadata:v13 forSourceDevice:v14];

  v15 = [v4 sqlController];
  uint64_t v16 = [v4 aggregateStatistics];
  [v15 updateStatistics:v16];

  if (+[WLMigrator _shouldTerminateMigrationBeforeImport])
  {
    uint64_t v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v41 = *MEMORY[0x263F08320];
    v42[0] = @"Terminating migration before import as requested";
    id v18 = [NSDictionary dictionaryWithObjects:v42 forKeys:&v41 count:1];
    uint64_t v19 = [v17 errorWithDomain:*MEMORY[0x263F86308] code:1 userInfo:v18];

    id v20 = v19;
  }
  else
  {
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x3032000000;
    uint64_t v36 = __Block_byref_object_copy__2;
    v37 = __Block_byref_object_dispose__2;
    id v38 = 0;
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __25__WLMigrator_importData___block_invoke;
    v32[3] = &unk_26490C868;
    v32[4] = &v33;
    v21 = [(WLMigrator *)self _importDataWithContext:v4 failureDetailsBlock:v32];
    if (v21)
    {
      v31 = self;
      _WLLog();
      id v22 = objc_alloc(MEMORY[0x263EFF9A0]);
      uint64_t v39 = *MEMORY[0x263F08608];
      uint64_t v40 = v21;
      uint64_t v23 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1, v31, v21);
      uint64_t v24 = (void *)[v22 initWithDictionary:v23];

      uint64_t v25 = v34[5];
      if (v25) {
        [v24 setObject:v25 forKeyedSubscript:*MEMORY[0x263F86300]];
      }
      v26 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F86308] code:3 userInfo:v24];

      id v20 = v26;
    }
    else
    {
      unint64_t v27 = +[WLMigrator _bytesFreeOnDevice];
      dispatch_semaphore_t v28 = [v4 aggregateStatistics];
      [v28 setImportEndBytesFree:v27];

      uint64_t v24 = [MEMORY[0x263EFF910] date];
      char v29 = [v4 aggregateStatistics];
      [v29 setImportEndDate:v24];

      id v20 = 0;
    }

    _Block_object_dispose(&v33, 8);
  }

  return v20;
}

void __25__WLMigrator_importData___block_invoke(uint64_t a1, void *a2)
{
}

- (id)runPostMigrationTasks:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 metadata];
  [v5 setState:5];

  [(WLMigrator *)self _setProgressTo:v4 context:1.0];
  return 0;
}

- (id)finishMigration:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [v4 metadata];
  [v5 setState:6];

  [(WLMigrator *)self _setProgressTo:v4 context:1.0];
  BOOL v6 = [v4 delegate];
  [v6 dataMigrator:self didUpdateMigrationState:5];

  char v7 = [v4 sqlController];
  id v8 = [v7 migrationErrors];
  [v4 setImportErrors:v8];

  unint64_t v9 = [v4 importErrors];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    [v4 importErrors];
    unint64_t v32 = v31 = self;
    _WLLog();
  }
  CFStringRef v11 = (const __CFString *)*MEMORY[0x263EFFE48];
  CFStringRef v12 = (const __CFString *)*MEMORY[0x263EFFE70];
  CFStringRef v13 = (const __CFString *)*MEMORY[0x263EFFE50];
  CFPreferencesSetValue(@"MigratedFromAndroid", (CFPropertyListRef)*MEMORY[0x263EFFB40], (CFStringRef)*MEMORY[0x263EFFE48], (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  CFPreferencesSetValue(@"MigratedFromAndroidToiOSVersion", +[WLMigrator _systemVersion], v11, v12, v13);
  uint64_t v14 = [v4 metadata];
  v15 = [v14 deviceType];
  CFPreferencesSetValue(@"MigratedFromAndroidDeviceType", v15, v11, v12, v13);

  uint64_t v16 = [v4 metadata];
  uint64_t v17 = [v16 deviceOSVersion];
  CFPreferencesSetValue(@"MigratedFromAndroidOSVersion", v17, v11, v12, v13);

  id v18 = objc_alloc_init(MEMORY[0x263F86278]);
  [v18 setIsEnabled:0];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v19 = [v4 migrators];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v34 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v25 = [v24 importErrorCount];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v26 = [v18 image];
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              continue;
            }
            v26 = [v18 video];
          }
          unint64_t v27 = v26;
          if (v26)
          {
            [v26 setImportErrorCount:v25];
          }
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v21);
  }

  dispatch_semaphore_t v28 = [v4 delegate];
  char v29 = [v4 importErrors];
  objc_msgSend(v28, "dataMigratorDidFinish:withImportErrors:context:", self, objc_msgSend(v29, "count") != 0, v18, v31, v32);

  return 0;
}

- (void)_finishMigrationWithError:(id)a3 context:(id)a4 disconnected:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  CFStringRef v12 = (void (**)(void))a6;
  if (!v10)
  {
    uint64_t v25 = [v11 metadata];
    objc_msgSend(v25, "setCrashCount:", objc_msgSend(v25, "crashCount") - 1);

    v26 = [v11 sqlController];
    unint64_t v27 = [v11 metadata];
    dispatch_semaphore_t v28 = [v11 sourceDevice];
    [v26 setMetadata:v27 forSourceDevice:v28];

    char v29 = [MEMORY[0x263F862E0] sharedInstance];
    v30 = [v11 payload];
    [v29 migratorDidFinish:v30];

    [(WLMigrator *)self _logStatisticsAndSendStatisticsTelemetryWithContext:v11];
    v31 = [v11 importErrors];
    uint64_t v32 = [v31 count];

    if (v32) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  if (!a5)
  {
    objc_initWeak(&location, self);
    long long v33 = +[WLWiFiController sharedInstance];
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __72__WLMigrator__finishMigrationWithError_context_disconnected_completion___block_invoke;
    v34[3] = &unk_26490C8B8;
    objc_copyWeak(&v38, &location);
    id v35 = v10;
    id v36 = v11;
    v37 = v12;
    [v33 disableSoftAPWithCompletion:v34];

    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
    goto LABEL_14;
  }
  CFStringRef v13 = [MEMORY[0x263F862E0] sharedInstance];
  uint64_t v14 = [v11 payload];
  [v13 migratorDidFinish:v14];

  v15 = [v11 delegate];
  [v15 dataMigrator:self didFailWithError:v10];

  uint64_t v16 = [v11 metadata];
  uint64_t v17 = [v16 state];

  if (v17 == 4)
  {
LABEL_4:
    id v18 = [v11 sqlController];
    [v18 deleteMetadataForAllDevices];

    uint64_t v19 = [v11 sqlController];
    [v19 deleteAccountsAndSummariesForAllDevices];

    uint64_t v20 = [v11 sqlController];
    [v20 deleteStatisticsForAllDevices];

    uint64_t v21 = [v11 dataCoordinator];
    uint64_t v22 = [v21 downloadsPath];
    [(WLMigrator *)self _deleteDownloadsPath:v22];
  }
LABEL_5:
  uint64_t v23 = [v11 urlSessionController];
  [v23 invalidate];

  uint64_t v24 = [v11 migrators];
  [v24 removeAllObjects];

  if (+[WLMigrator stashDataLocally]) {
    +[WLMigrator setStashDataLocally:0];
  }
  if ([v11 powerAssertion])
  {
    CFRelease((CFTypeRef)[v11 powerAssertion]);
    [v11 setPowerAssertion:0];
  }
  if (v12) {
    v12[2](v12);
  }
LABEL_14:
}

void __72__WLMigrator__finishMigrationWithError_context_disconnected_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _finishMigrationWithError:*(void *)(a1 + 32) context:*(void *)(a1 + 40) disconnected:1 completion:*(void *)(a1 + 48)];
}

- (id)_fetchAccountsAndSummariesWithContext:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v40 = 0;
  uint64_t v41 = &v40;
  uint64_t v42 = 0x3032000000;
  id v43 = __Block_byref_object_copy__2;
  double v44 = __Block_byref_object_dispose__2;
  id v45 = 0;
  id v4 = [v3 sqlController];
  BOOL v5 = +[WLStatistics fetchContentType];
  v26 = [v4 statisticsForContentType:v5];

  uint64_t v23 = [MEMORY[0x263EFF910] date];
  objc_msgSend(v26, "setFetchStartBytesFree:", +[WLMigrator _bytesFreeOnDevice](WLMigrator, "_bytesFreeOnDevice"));
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  BOOL v6 = [v3 migrators];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v36 objects:v46 count:16];
  if (v7)
  {
    uint64_t v24 = *(void *)v37;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v37 != v24) {
        objc_enumerationMutation(v6);
      }
      unint64_t v9 = *(void **)(*((void *)&v36 + 1) + 8 * v8);
      id v10 = [MEMORY[0x263EFF910] date];
      dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
      CFStringRef v12 = [v3 dataCoordinator];
      CFStringRef v13 = [v3 dataSource];
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __52__WLMigrator__fetchAccountsAndSummariesWithContext___block_invoke;
      v34[3] = &unk_26490C8E0;
      void v34[4] = v9;
      id v35 = v3;
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __52__WLMigrator__fetchAccountsAndSummariesWithContext___block_invoke_2;
      v32[3] = &unk_26490C8E0;
      v32[4] = v9;
      id v33 = v35;
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __52__WLMigrator__fetchAccountsAndSummariesWithContext___block_invoke_3;
      v27[3] = &unk_26490C908;
      v31 = &v40;
      v27[4] = self;
      id v28 = v33;
      char v29 = v9;
      uint64_t v14 = v11;
      v30 = v14;
      [v12 fetchAccountsAndSummariesFromSource:v13 forMigrator:v9 statistics:v26 accountsRequestDurationBlock:v34 summariesRequestDurationBlock:v32 completion:v27];

      dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
      uint64_t v15 = [MEMORY[0x263EFF910] date];
      [(id)v15 timeIntervalSinceDate:v10];
      double v17 = v16;

      [v9 addWorkingTime:(unint64_t)v17];
      LOBYTE(v15) = v41[5] == 0;

      if ((v15 & 1) == 0) {
        break;
      }
      if (v7 == ++v8)
      {
        uint64_t v7 = [v6 countByEnumeratingWithState:&v36 objects:v46 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  objc_msgSend(v26, "setFetchEndBytesFree:", +[WLMigrator _bytesFreeOnDevice](WLMigrator, "_bytesFreeOnDevice"));
  id v18 = [MEMORY[0x263EFF910] date];
  [v18 timeIntervalSinceDate:v23];
  [v26 setFetchDuration:vcvtpd_u64_f64(v19)];
  uint64_t v20 = [v3 sqlController];
  [v20 updateStatistics:v26];

  id v21 = (id)v41[5];
  _Block_object_dispose(&v40, 8);

  return v21;
}

void __52__WLMigrator__fetchAccountsAndSummariesWithContext___block_invoke(uint64_t a1, double a2)
{
  id v11 = [MEMORY[0x263F862E0] sharedInstance];
  id v4 = [*(id *)(a1 + 32) contentType];
  BOOL v5 = [*(id *)(a1 + 40) metadata];
  BOOL v6 = [v5 deviceOSVersion];
  uint64_t v7 = [*(id *)(a1 + 40) metadata];
  uint64_t v8 = [v7 deviceModel];
  unint64_t v9 = [*(id *)(a1 + 40) metadata];
  id v10 = [v9 clientVersion];
  [v11 preparatoryDataDidComplete:@"accounts" contentType:v4 duration:v6 android:v8 model:v10 version:a2];
}

void __52__WLMigrator__fetchAccountsAndSummariesWithContext___block_invoke_2(uint64_t a1, double a2)
{
  id v11 = [MEMORY[0x263F862E0] sharedInstance];
  id v4 = [*(id *)(a1 + 32) contentType];
  BOOL v5 = [*(id *)(a1 + 40) metadata];
  BOOL v6 = [v5 deviceOSVersion];
  uint64_t v7 = [*(id *)(a1 + 40) metadata];
  uint64_t v8 = [v7 deviceModel];
  unint64_t v9 = [*(id *)(a1 + 40) metadata];
  id v10 = [v9 clientVersion];
  [v11 preparatoryDataDidComplete:@"summaries" contentType:v4 duration:v6 android:v8 model:v10 version:a2];
}

void __52__WLMigrator__fetchAccountsAndSummariesWithContext___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v27 = a3;
  id v8 = a4;
  if (v8)
  {
    if ([*(id *)(a1 + 32) _shouldTerminateMigrationOnError]) {
      unint64_t v9 = v8;
    }
    else {
      unint64_t v9 = 0;
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v9);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        double v16 = [*(id *)(a1 + 40) sqlController];
        uint64_t v17 = *(void *)(a1 + 48);
        id v18 = [*(id *)(a1 + 40) sourceDevice];
        objc_msgSend(v15, "setSqlID:", objc_msgSend(v16, "insertAccount:migrator:device:", v15, v17, v18));
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v12);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v19 = v27;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v29 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void **)(*((void *)&v28 + 1) + 8 * j);
        uint64_t v25 = [*(id *)(a1 + 40) sqlController];
        v26 = [v24 account];
        objc_msgSend(v24, "setSqlID:", objc_msgSend(v25, "insertRecordSummary:account:", v24, v26));
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v21);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

- (id)_selectDataTypesWithContext:(id)a3
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  id v57 = a3;
  uint64_t v84 = 0;
  v85 = &v84;
  uint64_t v86 = 0x3032000000;
  v87 = __Block_byref_object_copy__2;
  v88 = __Block_byref_object_dispose__2;
  id v89 = 0;
  id v3 = objc_alloc(MEMORY[0x263EFF9A0]);
  id v4 = [v57 migrators];
  BOOL v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  dispatch_semaphore_t v54 = dispatch_semaphore_create(0);
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  BOOL v6 = [v57 migrators];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v80 objects:v92 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v81;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v81 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v80 + 1) + 8 * i);
        uint64_t v11 = [v57 sqlController];
        uint64_t v12 = [v57 sourceDevice];
        uint64_t v13 = [v11 accountsForMigrator:v10 device:v12];

        if ([v13 count])
        {
          v53 = [v10 contentType];
          _WLLog();

          uint64_t v14 = objc_msgSend(v57, "sqlController", self, v53);
          v76[0] = MEMORY[0x263EF8330];
          v76[1] = 3221225472;
          v76[2] = __42__WLMigrator__selectDataTypesWithContext___block_invoke;
          v76[3] = &unk_26490C930;
          v76[4] = self;
          v76[5] = v10;
          v79 = &v84;
          id v77 = v5;
          uint64_t v15 = v54;
          v78 = v15;
          [(id)v14 totalSummaryItemSizeForAccounts:v13 addOverhead:1 completion:v76];

          dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
          LOBYTE(v14) = v85[5] == 0;

          if ((v14 & 1) == 0)
          {

            goto LABEL_12;
          }
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v80 objects:v92 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  if (!v85[5])
  {
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    double v16 = [v5 allKeys];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v72 objects:v91 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v73;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v73 != v18) {
            objc_enumerationMutation(v16);
          }
          uint64_t v20 = *(void *)(*((void *)&v72 + 1) + 8 * j);
          uint64_t v21 = [v5 objectForKeyedSubscript:v20];
          unint64_t v22 = [v21 unsignedLongLongValue];

          uint64_t v23 = [NSNumber numberWithUnsignedLongLong:(unint64_t)((double)v22 * 1.2)];
          [v5 setObject:v23 forKeyedSubscript:v20];
        }
        uint64_t v17 = [v16 countByEnumeratingWithState:&v72 objects:v91 count:16];
      }
      while (v17);
    }
  }
  uint64_t v24 = +[WLAppMigrator dataType];
  uint64_t v25 = [v5 objectForKeyedSubscript:v24];

  if (v25)
  {
    v26 = +[WLAppMigrator dataType];
    [v5 removeObjectForKey:v26];
  }
  uint64_t v66 = 0;
  id v67 = &v66;
  uint64_t v68 = 0x3032000000;
  long long v69 = __Block_byref_object_copy__2;
  long long v70 = __Block_byref_object_dispose__2;
  id v71 = 0;
  if (!v85[5])
  {
    _WLLog();
    id v27 = objc_msgSend(v57, "sourceDevice", self, v5);
    v62[0] = MEMORY[0x263EF8330];
    v62[1] = 3221225472;
    v62[2] = __42__WLMigrator__selectDataTypesWithContext___block_invoke_2;
    v62[3] = &unk_26490C958;
    v62[4] = self;
    double v64 = &v66;
    v65 = &v84;
    long long v28 = v54;
    v63 = v28;
    [(WLMigrator *)self _selectFromDataTypeToSizeMap:v5 device:v27 completion:v62];

    dispatch_semaphore_wait(v28, 0xFFFFFFFFFFFFFFFFLL);
  }
  if (v25)
  {
    long long v29 = (void *)v67[5];
    long long v30 = +[WLAppMigrator dataType];
    uint64_t v31 = [v29 arrayByAddingObject:v30];
    long long v32 = (void *)v67[5];
    v67[5] = v31;
  }
  long long v33 = (void *)v85[5];
  if (!v33)
  {
    id v34 = objc_alloc(MEMORY[0x263EFF980]);
    long long v35 = [v57 migrators];
    v56 = objc_msgSend(v34, "initWithCapacity:", objc_msgSend(v35, "count"));

    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v36 = [v57 migrators];
    uint64_t v37 = [v36 countByEnumeratingWithState:&v58 objects:v90 count:16];
    if (v37)
    {
      uint64_t v38 = *(void *)v59;
      do
      {
        for (uint64_t k = 0; k != v37; ++k)
        {
          if (*(void *)v59 != v38) {
            objc_enumerationMutation(v36);
          }
          uint64_t v40 = *(void **)(*((void *)&v58 + 1) + 8 * k);
          uint64_t v41 = (void *)v67[5];
          uint64_t v42 = [v40 dataType];
          LODWORD(v41) = [v41 containsObject:v42];

          if (v41)
          {
            [v56 addObject:v40];
            id v43 = [v57 sqlController];
            double v44 = [v40 contentType];
            id v45 = [v43 statisticsForContentType:v44];

            [v45 setSelectedForMigration:1];
            v46 = [v57 sqlController];
            [v46 updateStatistics:v45];

            uint64_t v47 = [v40 dataType];
            id v48 = [v5 objectForKeyedSubscript:v47];
            uint64_t v49 = [v48 unsignedLongLongValue];

            [v40 enable];
            [v40 setEstimatedDataSize:v49];
          }
          else
          {
            id v45 = [v57 sqlController];
            v50 = [v57 sourceDevice];
            [v45 deleteAccountsAndSummariesForMigrator:v40 device:v50];
          }
        }
        uint64_t v37 = [v36 countByEnumeratingWithState:&v58 objects:v90 count:16];
      }
      while (v37);
    }

    [v57 setMigrators:v56];
    long long v33 = (void *)v85[5];
  }
  id v51 = v33;
  _Block_object_dispose(&v66, 8);

  _Block_object_dispose(&v84, 8);
  return v51;
}

void __42__WLMigrator__selectDataTypesWithContext___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v17 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  BOOL v6 = [*(id *)(a1 + 40) contentType];
  double v16 = [NSNumber numberWithUnsignedLongLong:a2];
  _WLLog();

  if (v17)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
    id v8 = v17;
    unint64_t v9 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v8;
  }
  else
  {
    if (!a2) {
      goto LABEL_6;
    }
    id v10 = *(void **)(a1 + 48);
    uint64_t v11 = objc_msgSend(*(id *)(a1 + 40), "dataType", v5, v6, v16, 0);
    unint64_t v9 = [v10 objectForKeyedSubscript:v11];

    uint64_t v12 = [v9 unsignedLongLongValue];
    uint64_t v13 = [NSNumber numberWithUnsignedLongLong:v12 + a2];
    uint64_t v14 = *(void **)(a1 + 48);
    uint64_t v15 = [*(id *)(a1 + 40) dataType];
    [v14 setObject:v13 forKeyedSubscript:v15];
  }
LABEL_6:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

void __42__WLMigrator__selectDataTypesWithContext___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v11 = a3;
  _WLLog();
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v12 = v5;

  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  unint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v11;
  id v10 = v11;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)_selectFromDataTypeToSizeMap:(id)a3 device:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 socketPort])
  {
    objc_initWeak(&location, self);
    id v11 = dispatch_get_global_queue(25, 0);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __61__WLMigrator__selectFromDataTypeToSizeMap_device_completion___block_invoke;
    v13[3] = &unk_26490CA20;
    objc_copyWeak(&v17, &location);
    v13[4] = self;
    id v14 = v9;
    id v15 = v8;
    id v16 = v10;
    dispatch_async(v11, v13);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else if (v10)
  {
    id v12 = [v8 allKeys];
    (*((void (**)(id, void *, void))v10 + 2))(v10, v12, 0);
  }
}

void __61__WLMigrator__selectFromDataTypeToSizeMap_device_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v103 = 0;
  v104 = &v103;
  uint64_t v105 = 0x2020000000;
  int v106 = -1;
  uint64_t v97 = 0;
  v98 = (id *)&v97;
  uint64_t v99 = 0x3032000000;
  v100 = __Block_byref_object_copy__2;
  v101 = __Block_byref_object_dispose__2;
  id v102 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v4 = *(void *)(a1 + 32);
  id v45 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(*(id *)(a1 + 40), "socketPort"));
  _WLLog();

  id v5 = objc_alloc_init(WLSocketHandler);
  objc_msgSend(WeakRetained, "setActiveSocketHandler:", v5, v4, v45);
  uint64_t v6 = [*(id *)(a1 + 40) ipAddress];
  uint64_t v7 = [*(id *)(a1 + 40) socketPort];
  v93[0] = MEMORY[0x263EF8330];
  v93[1] = 3221225472;
  v93[2] = __61__WLMigrator__selectFromDataTypeToSizeMap_device_completion___block_invoke_2;
  v93[3] = &unk_26490C980;
  v93[4] = *(void *)(a1 + 32);
  v95 = &v103;
  v96 = &v97;
  id v8 = v3;
  v94 = v8;
  +[WLSocketHandler lookupAndConnectToHost:v6 port:v7 completion:v93];

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  uint64_t v89 = 0;
  v90 = &v89;
  uint64_t v91 = 0x2020000000;
  int v92 = -1;
  uint64_t v83 = 0;
  uint64_t v84 = &v83;
  uint64_t v85 = 0x3032000000;
  uint64_t v86 = __Block_byref_object_copy__2;
  v87 = __Block_byref_object_dispose__2;
  v88 = objc_alloc_init(WLSocketHandler);
  if (!v98[5])
  {
    id v10 = +[WLDeviceDiscoveryController sharedInstance];
    v78[0] = MEMORY[0x263EF8330];
    v78[1] = 3221225472;
    v78[2] = __61__WLMigrator__selectFromDataTypeToSizeMap_device_completion___block_invoke_3;
    v78[3] = &unk_26490C9A8;
    v78[4] = *(void *)(a1 + 32);
    long long v80 = &v97;
    long long v81 = &v89;
    long long v82 = &v83;
    v79 = v9;
    [v10 setNextIncomingConnectionHandler:v78];

    if (!v98[5])
    {
      [(WLSocketHandler *)v5 beginReadingIntoCacheFromSocket:*((unsigned int *)v104 + 6)];
      uint64_t v37 = *(void *)(a1 + 32);
      _WLLog();
      uint64_t v11 = *((unsigned int *)v104 + 6);
      v75[0] = MEMORY[0x263EF8330];
      v75[1] = 3221225472;
      v75[2] = __61__WLMigrator__selectFromDataTypeToSizeMap_device_completion___block_invoke_4;
      v75[3] = &unk_26490C9D0;
      v75[4] = *(void *)(a1 + 32);
      id v77 = &v97;
      id v12 = v8;
      v76 = v12;
      [(WLSocketHandler *)v5 sendCommand:@"DATASETSAVAILABLE", v11, v75, v37 toSocket completion];
      dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);

      if (!v98[5])
      {
        uint64_t v38 = *(void *)(a1 + 32);
        _WLLog();
        uint64_t v13 = v98;
        obuint64_t j = v98[5];
        [(WLSocketHandler *)v5 waitForCommand:@"OK", &obj, v38 fromReadCacheReturningError];
        objc_storeStrong(v13 + 5, obj);
        uint64_t v36 = *(void *)(a1 + 32);
        uint64_t v46 = (uint64_t)v98[5];
        _WLLog();
        if (!v98[5])
        {
          uint64_t v68 = 0;
          long long v69 = &v68;
          uint64_t v70 = 0x3032000000;
          id v71 = __Block_byref_object_copy__2;
          long long v72 = __Block_byref_object_dispose__2;
          +[WLMigrator _dataTypesAndSizesXMLDataFromMap:](WLMigrator, "_dataTypesAndSizesXMLDataFromMap:", *(void *)(a1 + 48), v36, v46);
          id v73 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v14 = *(void *)(a1 + 32);
          id v15 = [NSString alloc];
          uint64_t v47 = (void *)[v15 initWithData:v69[5] encoding:4];
          _WLLog();

          uint64_t v16 = objc_msgSend( (id) v69[5], "bytes", v14, v47);
          uint64_t v17 = [(id)v69[5] length];
          uint64_t v18 = *((unsigned int *)v104 + 6);
          v64[0] = MEMORY[0x263EF8330];
          v64[1] = 3221225472;
          v64[2] = __61__WLMigrator__selectFromDataTypeToSizeMap_device_completion___block_invoke_5;
          v64[3] = &unk_26490C9F8;
          v64[4] = *(void *)(a1 + 32);
          uint64_t v66 = &v97;
          id v67 = &v68;
          id v19 = v12;
          v65 = v19;
          [(WLSocketHandler *)v5 writeBytes:v16 length:v17 toSocket:v18 completion:v64];
          dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);

          _Block_object_dispose(&v68, 8);
          if (!v98[5])
          {
            uint64_t v39 = *(void *)(a1 + 32);
            _WLLog();
            uint64_t v20 = v98;
            id v63 = v98[5];
            [(WLSocketHandler *)v5 waitForCommand:@"OK", &v63, v39 fromReadCacheReturningError];
            objc_storeStrong(v20 + 5, v63);
            uint64_t v36 = *(void *)(a1 + 32);
            uint64_t v46 = (uint64_t)v98[5];
            _WLLog();
          }
        }
      }
    }
  }
  [(WLSocketHandler *)v5 endReadingIntoCache];
  uint64_t v21 = v98;
  if (!v98[5])
  {
    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v21 = v98;
    if (!v98[5])
    {
      [WeakRetained setActiveSocketHandler:v84[5]];
      uint64_t v41 = *(void *)(a1 + 32);
      _WLLog();
      unint64_t v22 = (void *)v84[5];
      uint64_t v23 = v98;
      id v62 = v98[5];
      objc_msgSend(v22, "waitForCommand:fromReadCacheReturningError:", @"DATASETSSELECTED", &v62, v41);
      objc_storeStrong(v23 + 5, v62);
      uint64_t v40 = *(void *)(a1 + 32);
      uint64_t v48 = (uint64_t)v98[5];
      _WLLog();
      uint64_t v21 = v98;
      if (!v98[5])
      {
        uint64_t v42 = *(void *)(a1 + 32);
        _WLLog();
        uint64_t v24 = (void *)v84[5];
        uint64_t v25 = *((unsigned int *)v90 + 6);
        v59[0] = MEMORY[0x263EF8330];
        v59[1] = 3221225472;
        v59[2] = __61__WLMigrator__selectFromDataTypeToSizeMap_device_completion___block_invoke_6;
        v59[3] = &unk_26490C9D0;
        v59[4] = *(void *)(a1 + 32);
        long long v61 = &v97;
        v26 = v8;
        long long v60 = v26;
        objc_msgSend(v24, "sendCommand:toSocket:completion:", @"OK", v25, v59, v42, v48);
        dispatch_semaphore_wait(v26, 0xFFFFFFFFFFFFFFFFLL);

        uint64_t v21 = v98;
      }
    }
  }
  uint64_t v68 = 0;
  long long v69 = &v68;
  uint64_t v70 = 0x3032000000;
  id v71 = __Block_byref_object_copy__2;
  long long v72 = __Block_byref_object_dispose__2;
  id v73 = 0;
  if (!v21[5])
  {
    uint64_t v43 = *(void *)(a1 + 32);
    _WLLog();
    id v27 = (void *)v84[5];
    long long v28 = v98;
    id v58 = v98[5];
    long long v29 = objc_msgSend(v27, "waitForDataFromReadCacheReturningError:", &v58, v43);
    objc_storeStrong(v28 + 5, v58);
    uint64_t v40 = *(void *)(a1 + 32);
    uint64_t v49 = (uint64_t)v98[5];
    _WLLog();
    if (!v98[5])
    {
      uint64_t v30 = *(void *)(a1 + 32);
      v50 = objc_msgSend([NSString alloc], "initWithData:encoding:", v29, 4, v40, v49);
      _WLLog();

      v54[0] = MEMORY[0x263EF8330];
      v54[1] = 3221225472;
      v54[2] = __61__WLMigrator__selectFromDataTypeToSizeMap_device_completion___block_invoke_7;
      v54[3] = &unk_26490C958;
      v54[4] = *(void *)(a1 + 32);
      v56 = &v68;
      id v57 = &v97;
      uint64_t v31 = v8;
      double v55 = v31;
      +[WLMigrator _parseDataTypesXMLData:completion:](WLMigrator, "_parseDataTypesXMLData:completion:", v29, v54, v30, v50);
      dispatch_semaphore_wait(v31, 0xFFFFFFFFFFFFFFFFLL);
    }
    if (!v98[5])
    {
      uint64_t v44 = *(void *)(a1 + 32);
      _WLLog();
      long long v32 = (void *)v84[5];
      uint64_t v33 = *((unsigned int *)v90 + 6);
      v51[0] = MEMORY[0x263EF8330];
      v51[1] = 3221225472;
      v51[2] = __61__WLMigrator__selectFromDataTypeToSizeMap_device_completion___block_invoke_8;
      v51[3] = &unk_26490C9D0;
      v51[4] = *(void *)(a1 + 32);
      v53 = &v97;
      id v34 = v8;
      double v52 = v34;
      objc_msgSend(v32, "sendCommand:toSocket:completion:", @"OK", v33, v51, v44);
      dispatch_semaphore_wait(v34, 0xFFFFFFFFFFFFFFFFLL);
    }
  }
  objc_msgSend((id)v84[5], "endReadingIntoCache", v40);
  uint64_t v35 = *(void *)(a1 + 56);
  if (v35) {
    (*(void (**)(uint64_t, uint64_t, id))(v35 + 16))(v35, v69[5], v98[5]);
  }
  _Block_object_dispose(&v68, 8);

  _Block_object_dispose(&v83, 8);
  _Block_object_dispose(&v89, 8);

  _Block_object_dispose(&v97, 8);
  _Block_object_dispose(&v103, 8);
}

void __61__WLMigrator__selectFromDataTypeToSizeMap_device_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v8 = [NSNumber numberWithInt:a2];
  _WLLog();

  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v9 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __61__WLMigrator__selectFromDataTypeToSizeMap_device_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = [NSNumber numberWithInt:a2];
  _WLLog();

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  if (!v8)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a2;
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "beginReadingIntoCacheFromSocket:", a2, v6, v7, 0);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __61__WLMigrator__selectFromDataTypeToSizeMap_device_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  _WLLog();
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  id v6 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __61__WLMigrator__selectFromDataTypeToSizeMap_device_completion___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  _WLLog();
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
  id v9 = v4;

  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __61__WLMigrator__selectFromDataTypeToSizeMap_device_completion___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  _WLLog();
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  id v6 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __61__WLMigrator__selectFromDataTypeToSizeMap_device_completion___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  _WLLog();
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __61__WLMigrator__selectFromDataTypeToSizeMap_device_completion___block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  _WLLog();
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  id v6 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

+ (id)_dataTypesAndSizesXMLDataFromMap:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [@"<?xml version=\"1.0\"?>\r\n" stringByAppendingString:@"<root>\r\n"];
  id v5 = [v4 stringByAppendingString:@"<datasetsavailable>\r\n"];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = [v3 allKeys];
  uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        id v11 = [v5 stringByAppendingString:@"<dataset>\r\n"];

        id v12 = [NSString stringWithFormat:@"<datasetid>%@</datasetid>\r\n", v10];
        uint64_t v13 = [v11 stringByAppendingString:v12];

        uint64_t v14 = NSString;
        id v15 = [v3 objectForKeyedSubscript:v10];
        uint64_t v16 = [v15 stringValue];
        uint64_t v17 = [v14 stringWithFormat:@"<datasetsize>%@</datasetsize>\r\n", v16];
        uint64_t v18 = [v13 stringByAppendingString:v17];

        id v5 = [v18 stringByAppendingString:@"</dataset>\r\n"];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v7);
  }

  id v19 = [v5 stringByAppendingString:@"</datasetsavailable>\r\n"];

  uint64_t v20 = [v19 stringByAppendingString:@"</root>\r\n"];

  uint64_t v21 = [v20 dataUsingEncoding:4];

  return v21;
}

+ (void)_parseDataTypesXMLData:(id)a3 completion:(id)a4
{
  v34[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = (void (**)(id, void, xmlNode *))a4;
  id v7 = v5;
  Memory = xmlReadMemory((const char *)[v7 bytes], objc_msgSend(v7, "length"), 0, 0, 0);
  if (Memory)
  {
    xmlNodePtr RootElement = xmlDocGetRootElement(Memory);
    if (RootElement)
    {
      children = RootElement->children;
      if (children)
      {
        while (1)
        {
          name = (const char *)children->name;
          if (name)
          {
            if (!strcmp(name, "datasetsselected")) {
              break;
            }
          }
          children = children->next;
          if (!children) {
            goto LABEL_7;
          }
        }
        uint64_t v18 = 0;
        goto LABEL_11;
      }
LABEL_7:
      id v12 = (void *)MEMORY[0x263F087E8];
      uint64_t v13 = *MEMORY[0x263F86308];
      uint64_t v29 = *MEMORY[0x263F08320];
      uint64_t v30 = @"Parsed xml has no datasetsselected node";
      uint64_t v14 = NSDictionary;
      id v15 = &v30;
      uint64_t v16 = &v29;
    }
    else
    {
      id v12 = (void *)MEMORY[0x263F087E8];
      uint64_t v13 = *MEMORY[0x263F86308];
      uint64_t v31 = *MEMORY[0x263F08320];
      long long v32 = @"Parsed xml has no root node";
      uint64_t v14 = NSDictionary;
      id v15 = &v32;
      uint64_t v16 = &v31;
    }
  }
  else
  {
    id v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = *MEMORY[0x263F86308];
    uint64_t v33 = *MEMORY[0x263F08320];
    v34[0] = @"Failed to parse xml";
    uint64_t v14 = NSDictionary;
    id v15 = (__CFString **)v34;
    uint64_t v16 = &v33;
  }
  uint64_t v17 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:1];
  uint64_t v18 = [v12 errorWithDomain:v13 code:1 userInfo:v17];

  children = 0;
LABEL_11:
  id v19 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:0];
  if (!children || v18 || (uint64_t v18 = children->children) == 0)
  {
LABEL_19:
    if (v6) {
      goto LABEL_20;
    }
    goto LABEL_24;
  }
  while (1)
  {
    uint64_t v20 = (const char *)v18->name;
    if (!v20 || strcmp(v20, "datasetid")) {
      goto LABEL_18;
    }
    Content = xmlNodeGetContent(v18);
    if (!Content) {
      break;
    }
    unint64_t v22 = [NSString stringWithUTF8String:Content];
    [v19 addObject:v22];

LABEL_18:
    uint64_t v18 = v18->next;
    if (!v18) {
      goto LABEL_19;
    }
  }
  long long v24 = (void *)MEMORY[0x263F087E8];
  uint64_t v25 = *MEMORY[0x263F86308];
  uint64_t v27 = *MEMORY[0x263F08320];
  long long v28 = @"Parsed xml has no value for datasetid";
  long long v26 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  uint64_t v18 = [v24 errorWithDomain:v25 code:1 userInfo:v26];

  if (!v6) {
    goto LABEL_24;
  }
LABEL_20:
  if (v18) {
    uint64_t v23 = 0;
  }
  else {
    uint64_t v23 = v19;
  }
  ((void (**)(id, void *, xmlNode *))v6)[2](v6, v23, v18);
LABEL_24:
}

- (BOOL)_shouldForceDownloadError
{
  return [MEMORY[0x263F862C0] BOOLForKey:@"ForceDownloadError"] == 1;
}

- (id)_downloadDataWithContext:(id)a3 failureDetailsBlock:(id)a4
{
  uint64_t v155 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v85 = (void (**)(id, void *))a4;
  uint64_t v143 = 0;
  v144 = &v143;
  uint64_t v145 = 0x3032000000;
  v146 = __Block_byref_object_copy__2;
  v147 = __Block_byref_object_dispose__2;
  id v148 = 0;
  [v6 setCompletedDownloadSegmentCount:0];
  [v6 setExpectedDownloadSegmentsRemaining:0];
  [v6 setExpectedDownloadSegmentsRemainingForItemsWithEstimatedSizes:0];
  dsema = dispatch_semaphore_create(0);
  long long v139 = 0u;
  long long v140 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  id v7 = [v6 migrators];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v139 objects:v154 count:16];
  if (v8)
  {
    uint64_t v98 = *(void *)v140;
    obuint64_t j = v7;
    do
    {
      uint64_t v9 = 0;
      uint64_t v100 = v8;
      do
      {
        if (*(void *)v140 != v98) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v139 + 1) + 8 * v9);
        id v11 = (void *)MEMORY[0x230F5E5D0]();
        id v12 = [v6 sqlController];
        uint64_t v13 = [v6 sourceDevice];
        uint64_t v14 = [v12 accountsForMigrator:v10 device:v13];

        if ([v14 count])
        {
          v76 = [v10 contentType];
          _WLLog();

          id v15 = objc_msgSend(v6, "sqlController", self, v76);
          uint64_t v16 = [v15 totalSummaryDownloadedSegmentCountForAccounts:v14];

          uint64_t v17 = [v10 contentType];
          long long v80 = [NSNumber numberWithUnsignedInteger:v16];
          _WLLog();

          objc_msgSend(v6, "setCompletedDownloadSegmentCount:", objc_msgSend(v6, "completedDownloadSegmentCount", self, v17, v80) + v16);
          id v77 = [v10 contentType];
          _WLLog();

          uint64_t v18 = objc_msgSend(v6, "sqlController", self, v77);
          uint64_t v19 = [v18 totalSummaryDownloadSegmentCountForAccounts:v14];

          uint64_t v20 = [v10 contentType];
          long long v81 = [NSNumber numberWithUnsignedInteger:v19];
          _WLLog();

          objc_msgSend(v6, "setExpectedDownloadSegmentsRemaining:", objc_msgSend(v6, "expectedDownloadSegmentsRemaining", self, v20, v81) + v19);
          if (objc_opt_respondsToSelector())
          {
            objc_msgSend(v6, "setExpectedDownloadSegmentsRemainingForItemsWithEstimatedSizes:", objc_msgSend(v6, "expectedDownloadSegmentsRemainingForItemsWithEstimatedSizes") + v19);
          }
          else
          {
            v78 = [v10 contentType];
            _WLLog();

            uint64_t v135 = 0;
            v136 = &v135;
            uint64_t v137 = 0x2020000000;
            uint64_t v138 = 0;
            uint64_t v21 = objc_msgSend(v6, "sqlController", self, v78);
            v132[0] = MEMORY[0x263EF8330];
            v132[1] = 3221225472;
            v132[2] = __59__WLMigrator__downloadDataWithContext_failureDetailsBlock___block_invoke;
            v132[3] = &unk_26490CA48;
            v132[4] = self;
            v132[5] = v10;
            v134 = &v135;
            unint64_t v22 = dsema;
            v133 = v22;
            [v21 totalSummaryItemSizeForAccounts:v14 addOverhead:0 completion:v132];

            dispatch_semaphore_wait(v22, 0xFFFFFFFFFFFFFFFFLL);
            objc_msgSend(v6, "setExpectedDownloadBytesRemainingForItemsWithConcreteSizes:", v136[3] + objc_msgSend(v6, "expectedDownloadBytesRemainingForItemsWithConcreteSizes"));

            _Block_object_dispose(&v135, 8);
          }
        }

        ++v9;
      }
      while (v100 != v9);
      id v7 = obj;
      uint64_t v8 = [obj countByEnumeratingWithState:&v139 objects:v154 count:16];
    }
    while (v8);
  }

  uint64_t v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "completedDownloadSegmentCount"));
  long long v82 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "expectedDownloadSegmentsRemaining"));
  _WLLog();

  if (objc_msgSend(v6, "completedDownloadSegmentCount", self, v23, v82))
  {
    unint64_t v24 = [v6 completedDownloadSegmentCount];
    uint64_t v25 = [v6 expectedDownloadSegmentsRemaining];
    uint64_t v26 = [v6 completedDownloadSegmentCount];
    if ((double)v24 / (double)(unint64_t)(v26 + v25) * 0.8 <= 0.8) {
      double v27 = (double)v24 / (double)(unint64_t)(v26 + v25) * 0.8;
    }
    else {
      double v27 = 0.8;
    }
    uint64_t v28 = [v6 completedDownloadSegmentCount];
    uint64_t v29 = [v6 expectedDownloadSegmentsRemaining];
    uint64_t v84 = [NSNumber numberWithDouble:v27];
    _WLLog();

    -[WLMigrator _setProgressTo:context:](self, "_setProgressTo:context:", v6, v27, v28, v29, v84);
    dispatch_semaphore_t v30 = dispatch_semaphore_create(0);
    [v6 progress];
    double v32 = v31;
    v130[0] = MEMORY[0x263EF8330];
    v130[1] = 3221225472;
    v130[2] = __59__WLMigrator__downloadDataWithContext_failureDetailsBlock___block_invoke_2;
    v130[3] = &unk_26490C1A0;
    uint64_t v33 = v30;
    v131 = v33;
    [(WLMigrator *)self _updateSourceWithProgress:v6 remainingTime:v130 context:v32 completion:0.0];
  }
  id v34 = [MEMORY[0x263EFF910] date];
  [v6 setThroughputSegmentStartDate:v34];

  uint64_t v35 = [v6 migrators];
  uint64_t v36 = [v35 sortedArrayUsingComparator:&__block_literal_global_9];

  long long v128 = 0u;
  long long v129 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  id v86 = v36;
  uint64_t v37 = [v86 countByEnumeratingWithState:&v126 objects:v153 count:16];
  uint64_t v38 = 0;
  if (!v37) {
    goto LABEL_54;
  }
  uint64_t v88 = *(void *)v127;
  while (2)
  {
    uint64_t v90 = 0;
    uint64_t v87 = v37;
    uint64_t v39 = v38;
    do
    {
      if (*(void *)v127 != v88) {
        objc_enumerationMutation(v86);
      }
      id v99 = *(id *)(*((void *)&v126 + 1) + 8 * v90);

      [v99 setState:@"downloading"];
      uint64_t v40 = [v6 sqlController];
      uint64_t v41 = [v99 contentType];
      uint64_t v97 = [v40 statisticsForContentType:v41];

      uint64_t v89 = [MEMORY[0x263EFF910] date];
      if ([(WLMigrator *)self _shouldForceDownloadError])
      {
        _WLLog();
        uint64_t v68 = (void *)MEMORY[0x263F087E8];
        uint64_t v151 = *MEMORY[0x263F08338];
        v152 = @"Forced download error";
        uint64_t v69 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v152, &v151, 1, self);
        uint64_t v70 = [v68 errorWithDomain:*MEMORY[0x263F86308] code:1 userInfo:v69];
        id v91 = (id)v69;
        id v71 = (void *)v144[5];
        v144[5] = v70;
LABEL_53:

        uint64_t v38 = v99;
        goto LABEL_54;
      }
      char v42 = objc_opt_respondsToSelector();
      uint64_t v43 = [v6 sqlController];
      uint64_t v44 = [v6 sourceDevice];
      id v45 = [v43 accountsForMigrator:v99 device:v44];

      long long v124 = 0u;
      long long v125 = 0u;
      long long v122 = 0u;
      long long v123 = 0u;
      id v46 = v45;
      uint64_t v47 = [v46 countByEnumeratingWithState:&v122 objects:v150 count:16];
      id v91 = v46;
      if (!v47) {
        goto LABEL_46;
      }
      char v48 = 0;
      char v96 = v42 & 1;
      uint64_t v92 = v47;
      uint64_t v93 = *(void *)v123;
LABEL_25:
      uint64_t v49 = 0;
      while (1)
      {
        if (*(void *)v123 != v93) {
          objc_enumerationMutation(v91);
        }
        uint64_t v94 = v49;
        v50 = *(void **)(*((void *)&v122 + 1) + 8 * v49);
        id v51 = objc_msgSend(v6, "sqlController", v75);
        double v52 = [v51 summariesForAccount:v50];

        long long v120 = 0u;
        long long v121 = 0u;
        long long v118 = 0u;
        long long v119 = 0u;
        id v53 = v52;
        uint64_t v54 = [v53 countByEnumeratingWithState:&v118 objects:v149 count:16];
        if (v54)
        {
          uint64_t v55 = *(void *)v119;
          do
          {
            for (uint64_t i = 0; i != v54; ++i)
            {
              if (*(void *)v119 != v55) {
                objc_enumerationMutation(v53);
              }
              id v57 = *(void **)(*((void *)&v118 + 1) + 8 * i);
              if (objc_msgSend(v57, "didDownload", v75, v79, v83))
              {
                id v58 = [v57 identifier];
                [v50 identifier];
                uint64_t v83 = v79 = v58;
                long long v75 = self;
                _WLLog();
              }
              else
              {
                if ([v57 storeDataAsFile])
                {
                  long long v59 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v57, "itemSize"));
                  [v57 dataFilePath];
                  uint64_t v83 = v79 = v59;
                  long long v75 = self;
                  _WLLog();

                  long long v60 = [v6 dataCoordinator];
                  long long v61 = [v6 dataSource];
                  v115[0] = MEMORY[0x263EF8330];
                  v115[1] = 3221225472;
                  v115[2] = __59__WLMigrator__downloadDataWithContext_failureDetailsBlock___block_invoke_5;
                  v115[3] = &unk_26490CA90;
                  v115[4] = self;
                  v115[5] = v57;
                  char v117 = v96;
                  id v116 = v6;
                  v110[0] = MEMORY[0x263EF8330];
                  v110[1] = 3221225472;
                  v110[2] = __59__WLMigrator__downloadDataWithContext_failureDetailsBlock___block_invoke_7;
                  v110[3] = &unk_26490CAB8;
                  v110[4] = self;
                  v110[5] = v57;
                  id v111 = v116;
                  v114 = &v143;
                  id v112 = v97;
                  v113 = dsema;
                  [v60 downloadFileFromSource:v61 forMigrator:v99 summary:v57 account:v50 segmentCompletion:v115 completion:v110];
                }
                else
                {
                  id v62 = [v6 dataCoordinator];
                  id v63 = [v6 dataSource];
                  v102[0] = MEMORY[0x263EF8330];
                  v102[1] = 3221225472;
                  v102[2] = __59__WLMigrator__downloadDataWithContext_failureDetailsBlock___block_invoke_8;
                  v102[3] = &unk_26490CAE0;
                  id v103 = v6;
                  v104 = v57;
                  id v105 = v97;
                  int v106 = self;
                  char v109 = v96;
                  v108 = &v143;
                  v107 = dsema;
                  [v62 downloadDataFromSource:v63 forMigrator:v99 summary:v57 account:v50 completion:v102];
                }
                dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
                char v48 = 1;
                if (v144[5]) {
                  goto LABEL_41;
                }
              }
            }
            uint64_t v54 = [v53 countByEnumeratingWithState:&v118 objects:v149 count:16];
          }
          while (v54);
        }
LABEL_41:

        BOOL v64 = v144[5] == 0;
        if (!v64) {
          break;
        }
        uint64_t v49 = v94 + 1;
        if (v94 + 1 == v92)
        {
          uint64_t v92 = [v91 countByEnumeratingWithState:&v122 objects:v150 count:16];
          if (v92) {
            goto LABEL_25;
          }
          break;
        }
      }

      if (v48)
      {
        id v46 = [MEMORY[0x263EFF910] date];
        [v46 timeIntervalSinceDate:v89];
        unint64_t v66 = vcvtpd_u64_f64(v65);
        objc_msgSend(v97, "setDownloadDuration:", objc_msgSend(v97, "downloadDuration") + v66);
        id v67 = [v6 sqlController];
        [v67 updateStatistics:v97];

        [v99 addWorkingTime:v66];
LABEL_46:
      }
      if (v144[5])
      {
        id v71 = [v99 contentType];
        v85[2](v85, v71);
        goto LABEL_53;
      }
      [v99 setState:@"downloaded"];

      uint64_t v38 = v99;
      uint64_t v39 = v99;
      ++v90;
    }
    while (v90 != v87);
    uint64_t v37 = [v86 countByEnumeratingWithState:&v126 objects:v153 count:16];
    if (v37) {
      continue;
    }
    break;
  }
LABEL_54:

  long long v72 = (void *)v144[5];
  if (v72 && v38)
  {
    [v38 setState:@"downloading_error"];
    long long v72 = (void *)v144[5];
  }
  id v73 = v72;

  _Block_object_dispose(&v143, 8);
  return v73;
}

void __59__WLMigrator__downloadDataWithContext_failureDetailsBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id v5 = [*(id *)(a1 + 40) contentType];
  if (v7)
  {
    _WLLog();
  }
  else
  {
    id v6 = [NSNumber numberWithUnsignedLongLong:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
    _WLLog();

    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a2;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

intptr_t __59__WLMigrator__downloadDataWithContext_failureDetailsBlock___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __59__WLMigrator__downloadDataWithContext_failureDetailsBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = NSNumber;
  id v5 = a3;
  id v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", __59__WLMigrator__downloadDataWithContext_failureDetailsBlock___block_invoke_4((uint64_t)v5, a2));
  id v7 = NSNumber;
  uint64_t v8 = __59__WLMigrator__downloadDataWithContext_failureDetailsBlock___block_invoke_4((uint64_t)v6, v5);

  uint64_t v9 = [v7 numberWithUnsignedInteger:v8];
  uint64_t v10 = [v6 compare:v9];

  return v10;
}

uint64_t __59__WLMigrator__downloadDataWithContext_failureDetailsBlock___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 storeRecordDataInDatabase])
  {
    if (objc_opt_respondsToSelector() & 1) != 0 && ([v2 potentiallyLargeRecordData]) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = 2;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void __59__WLMigrator__downloadDataWithContext_failureDetailsBlock___block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v16 = [*(id *)(a1 + 40) dataFilePath];
  _WLLog();

  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 56);
  id v7 = objc_msgSend(MEMORY[0x263EFF910], "date", v4, v16);
  [v5 _didFinishDownloadingSegmentOfSize:a2 expectedSize:a2 migratorEstimatesItemSizes:v6 endDate:v7 context:*(void *)(a1 + 48)];
  double v9 = v8;

  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  id v11 = *(void **)(a1 + 32);
  [*(id *)(a1 + 48) progress];
  double v13 = v12;
  uint64_t v14 = *(void *)(a1 + 48);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __59__WLMigrator__downloadDataWithContext_failureDetailsBlock___block_invoke_6;
  v17[3] = &unk_26490C1A0;
  dispatch_semaphore_t v18 = v10;
  id v15 = v10;
  [v11 _updateSourceWithProgress:v14 remainingTime:v17 context:v13 completion:v9];
  dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __59__WLMigrator__downloadDataWithContext_failureDetailsBlock___block_invoke_6(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __59__WLMigrator__downloadDataWithContext_failureDetailsBlock___block_invoke_7(uint64_t a1, void *a2)
{
  id v12 = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "itemSize"));
  id v11 = [*(id *)(a1 + 40) dataFilePath];
  _WLLog();

  if (v12)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "_shouldTerminateMigrationOnError", v3, v4, v11, v12)) {
      id v5 = v12;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    uint64_t v6 = objc_msgSend(*(id *)(a1 + 48), "sqlController", v3, v4, v11, 0);
    uint64_t v7 = *(void *)(a1 + 40);
    double v8 = [*(id *)(a1 + 48) sourceDevice];
    [v6 setDidDownloadForSummary:v7 forSourceDevice:v8];

    id v5 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v5);
  double v9 = *(void **)(a1 + 56);
  if (v12) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = [*(id *)(a1 + 40) itemSize];
  }
  objc_msgSend(v9, "setDownloadByteCount:", objc_msgSend(v9, "downloadByteCount") + v10);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
}

void __59__WLMigrator__downloadDataWithContext_failureDetailsBlock___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5 && !v6)
  {
    double v8 = [*(id *)(a1 + 32) sqlController];
    [v8 setData:v5 forSummary:*(void *)(a1 + 40)];

    objc_msgSend(*(id *)(a1 + 48), "setDownloadByteCount:", objc_msgSend(*(id *)(a1 + 48), "downloadByteCount") + objc_msgSend(v5, "length"));
    double v9 = *(void **)(a1 + 56);
    uint64_t v10 = [v5 length];
    uint64_t v11 = [*(id *)(a1 + 40) itemSize];
    uint64_t v12 = *(unsigned __int8 *)(a1 + 80);
    double v13 = [MEMORY[0x263EFF910] date];
    [v9 _didFinishDownloadingSegmentOfSize:v10 expectedSize:v11 migratorEstimatesItemSizes:v12 endDate:v13 context:*(void *)(a1 + 32)];
    double v15 = v14;

    uint64_t v16 = [*(id *)(a1 + 32) sqlController];
    uint64_t v17 = *(void *)(a1 + 40);
    dispatch_semaphore_t v18 = [*(id *)(a1 + 32) sourceDevice];
    [v16 setDidDownloadForSummary:v17 forSourceDevice:v18];

    dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
    uint64_t v20 = *(void **)(a1 + 56);
    [*(id *)(a1 + 32) progress];
    double v22 = v21;
    uint64_t v23 = *(void *)(a1 + 32);
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __59__WLMigrator__downloadDataWithContext_failureDetailsBlock___block_invoke_9;
    v26[3] = &unk_26490C1A0;
    dispatch_semaphore_t v27 = v19;
    unint64_t v24 = v19;
    [v20 _updateSourceWithProgress:v23 remainingTime:v26 context:v22 completion:v15];
    dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL);

LABEL_8:
    uint64_t v25 = 0;
    goto LABEL_9;
  }
  if (!v6) {
    goto LABEL_8;
  }
  if ([*(id *)(a1 + 56) _shouldTerminateMigrationOnError]) {
    uint64_t v25 = v7;
  }
  else {
    uint64_t v25 = 0;
  }
LABEL_9:
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v25);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
}

intptr_t __59__WLMigrator__downloadDataWithContext_failureDetailsBlock___block_invoke_9(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (double)_didFinishDownloadingSegmentOfSize:(unint64_t)a3 expectedSize:(unint64_t)a4 migratorEstimatesItemSizes:(BOOL)a5 endDate:(id)a6 context:(id)a7
{
  BOOL v8 = a5;
  id v11 = a6;
  id v12 = a7;
  objc_msgSend(v12, "setCompletedDownloadSegmentCount:", objc_msgSend(v12, "completedDownloadSegmentCount") + 1);
  objc_msgSend(v12, "setExpectedDownloadSegmentsRemaining:", objc_msgSend(v12, "expectedDownloadSegmentsRemaining") - 1);
  if (v8) {
    objc_msgSend(v12, "setExpectedDownloadSegmentsRemainingForItemsWithEstimatedSizes:", objc_msgSend(v12, "expectedDownloadSegmentsRemainingForItemsWithEstimatedSizes") - 1);
  }
  else {
    objc_msgSend(v12, "setExpectedDownloadBytesRemainingForItemsWithConcreteSizes:", objc_msgSend(v12, "expectedDownloadBytesRemainingForItemsWithConcreteSizes") - a4);
  }
  while (1)
  {
    double v13 = [v12 throughputSamples];
    if ((unint64_t)[v13 count] < 0x14) {
      break;
    }

LABEL_8:
    dispatch_semaphore_t v19 = [v12 throughputSamples];
    [v19 removeObjectAtIndex:0];

    uint64_t v20 = [v12 throughputSamples];
    double v21 = [v20 firstObject];
    objc_msgSend(v12, "setThroughputBytesInCurrentPeriod:", objc_msgSend(v12, "throughputBytesInCurrentPeriod") - objc_msgSend(v21, "bytes"));

    objc_msgSend(v12, "setThroughputSegmentsInCurrentPeriod:", objc_msgSend(v12, "throughputSegmentsInCurrentPeriod") - 1);
  }
  double v14 = [v12 throughputSamples];
  double v15 = [v14 firstObject];
  uint64_t v16 = [v15 endDate];
  [v11 timeIntervalSinceDate:v16];
  double v18 = v17;

  if (v18 > 120.0) {
    goto LABEL_8;
  }
  double v22 = objc_alloc_init(WLThroughputSample);
  uint64_t v23 = [v12 throughputSegmentStartDate];
  [(WLThroughputSample *)v22 setStartDate:v23];

  [(WLThroughputSample *)v22 setEndDate:v11];
  unint64_t v24 = [(WLThroughputSample *)v22 startDate];
  [v11 timeIntervalSinceDate:v24];
  -[WLThroughputSample setDuration:](v22, "setDuration:");

  [(WLThroughputSample *)v22 setBytes:a3];
  [(WLThroughputSample *)v22 setExpectedBytes:a4];
  [(WLThroughputSample *)v22 duration];
  uint64_t v26 = v25;
  uint64_t v27 = [(WLThroughputSample *)v22 bytes];
  [(WLThroughputSample *)v22 duration];
  if (v28 == 0.0)
  {
    unint64_t v31 = 0;
  }
  else
  {
    double v29 = (double)[(WLThroughputSample *)v22 bytes];
    [(WLThroughputSample *)v22 duration];
    unint64_t v31 = (unint64_t)(v29 / v30);
  }
  unint64_t v57 = v31;
  _WLLog();
  double v32 = objc_msgSend(v12, "throughputSamples", v26, v27, v57);
  [v32 addObject:v22];

  objc_msgSend(v12, "setThroughputBytesInCurrentPeriod:", objc_msgSend(v12, "throughputBytesInCurrentPeriod") + -[WLThroughputSample bytes](v22, "bytes"));
  objc_msgSend(v12, "setThroughputSegmentsInCurrentPeriod:", objc_msgSend(v12, "throughputSegmentsInCurrentPeriod") + 1);
  [v12 setThroughputSegmentStartDate:v11];
  uint64_t v33 = [v12 throughputSamples];
  id v34 = [v33 firstObject];
  uint64_t v35 = [v34 startDate];
  [v11 timeIntervalSinceDate:v35];
  double v37 = v36;

  double v38 = -1.0;
  if (v37 > 0.0)
  {
    if ([v12 throughputBytesInCurrentPeriod])
    {
      if ([v12 throughputSegmentsInCurrentPeriod])
      {
        double v39 = (double)(unint64_t)[v12 throughputBytesInCurrentPeriod] / v37;
        double v40 = (double)(unint64_t)[v12 throughputSegmentsInCurrentPeriod] / v37;
        uint64_t v41 = [v12 throughputBytesInCurrentPeriod];
        uint64_t v59 = [v12 throughputSegmentsInCurrentPeriod];
        double v55 = v37;
        _WLLog();
        if (v39 > 0.0 && v40 > 0.0)
        {
          unint64_t v42 = (unint64_t)((double)(unint64_t)objc_msgSend(v12, "expectedDownloadBytesRemainingForItemsWithConcreteSizes", *(void *)&v37, v41, (unint64_t)v39, v59, *(void *)&v40)/ v39);
          unint64_t v43 = (unint64_t)((double)(unint64_t)[v12 expectedDownloadSegmentsRemainingForItemsWithEstimatedSizes]/ v40);
          double v38 = (double)(v43 + v42);
          uint64_t v44 = [v12 expectedDownloadBytesRemainingForItemsWithConcreteSizes];
          uint64_t v58 = [v12 expectedDownloadSegmentsRemainingForItemsWithEstimatedSizes];
          double v55 = *(double *)&v44;
          _WLLog();
          if (v43 + v42)
          {
            id v45 = @"all items";
            if (!v42) {
              id v45 = @"items without sizes";
            }
            if (v43) {
              id v46 = v45;
            }
            else {
              id v46 = @"items with sizes";
            }
            uint64_t v47 = objc_msgSend(MEMORY[0x263EFF910], "date", *(void *)&v55, v42, v58, v43, (unint64_t)v38);
            char v48 = [v12 timeEstimateAccuracyTracker];
            [v48 didCalculateTimeEstimate:(unint64_t)v38 atDate:v47 associatedObject:v46];
          }
        }
      }
    }
  }
  double v49 = (double)(unint64_t)objc_msgSend(v12, "completedDownloadSegmentCount", *(void *)&v55);
  uint64_t v50 = [v12 expectedDownloadSegmentsRemaining];
  uint64_t v51 = [v12 completedDownloadSegmentCount];
  if (v49 / (double)(unint64_t)(v51 + v50) * 0.8 <= 0.8) {
    double v52 = v49 / (double)(unint64_t)(v51 + v50) * 0.8;
  }
  else {
    double v52 = 0.8;
  }
  v56 = [NSNumber numberWithDouble:v52];
  _WLLog();

  -[WLMigrator _setProgressTo:context:](self, "_setProgressTo:context:", v12, v52, v56);
  if (v38 != -1.0)
  {
    id v53 = [v12 delegate];
    [v53 dataMigrator:self didUpdateRemainingDownloadTime:v38];
  }
  return v38;
}

- (void)_reportTimeEstimatesWithContext:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263EFF910];
  id v4 = a3;
  id v6 = [v3 date];
  id v5 = [v4 timeEstimateAccuracyTracker];

  [v5 estimatesDidResolveAtDate:v6 block:&__block_literal_global_362];
}

void __46__WLMigrator__reportTimeEstimatesWithContext___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  BOOL v8 = (void *)MEMORY[0x263F862E0];
  id v9 = a5;
  id v10 = [v8 sharedInstance];
  [v10 didResolveTimeEstimate:a2 forDownloadTask:v9 threshold:a3 actualTime:a4];
}

- (id)_importDataWithContext:(id)a3 failureDetailsBlock:(id)a4
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void (**)(id, id))a4;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  uint64_t v7 = [v5 migrators];
  uint64_t v56 = [v7 countByEnumeratingWithState:&v76 objects:v81 count:16];
  if (!v56)
  {

    uint64_t v50 = 0;
    id v8 = 0;
    goto LABEL_34;
  }
  id v8 = 0;
  uint64_t v58 = 0;
  uint64_t v55 = *(void *)v77;
  double v52 = v6;
  unint64_t v57 = v7;
  do
  {
    uint64_t v9 = 0;
    id v10 = v8;
    do
    {
      if (*(void *)v77 != v55) {
        objc_enumerationMutation(v7);
      }
      uint64_t v60 = v9;
      id v8 = *(id *)(*((void *)&v76 + 1) + 8 * v9);

      context = (void *)MEMORY[0x230F5E5D0]([v8 setState:@"importing"]);
      id v11 = [v5 sqlController];
      id v12 = [v8 contentType];
      double v13 = [v11 statisticsForContentType:v12];

      double v14 = [v13 importStartDate];

      if (!v14)
      {
        double v15 = [MEMORY[0x263EFF910] date];
        [v13 setImportStartDate:v15];

        objc_msgSend(v13, "setImportStartBytesFree:", +[WLMigrator _bytesFreeOnDevice](WLMigrator, "_bytesFreeOnDevice"));
        uint64_t v16 = [v5 sqlController];
        [v16 updateStatistics:v13];
      }
      double v17 = [v5 sqlController];
      double v18 = [v5 sourceDevice];
      dispatch_semaphore_t v19 = [v17 accountsForMigrator:v8 device:v18];

      long long v61 = v19;
      if (objc_opt_respondsToSelector())
      {
        uint64_t v54 = v13;
        uint64_t v20 = [v5 sqlController];
        double v21 = [v20 summariesForAccounts:v19 sortedByModifiedDate:0];

        long long v74 = 0u;
        long long v75 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        id v22 = v21;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v72 objects:v80 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v73;
          do
          {
            for (uint64_t i = 0; i != v24; ++i)
            {
              if (*(void *)v73 != v25) {
                objc_enumerationMutation(v22);
              }
              uint64_t v27 = *(void *)(*((void *)&v72 + 1) + 8 * i);
              double v28 = (void *)MEMORY[0x230F5E5D0]();
              double v29 = [v5 sqlController];
              double v30 = [v29 dataForSummary:v27];

              [v8 performPreImportPhaseForSummary:v27 data:v30];
            }
            uint64_t v24 = [v22 countByEnumeratingWithState:&v72 objects:v80 count:16];
          }
          while (v24);
        }

        id v6 = v52;
        uint64_t v7 = v57;
        double v13 = v54;
        dispatch_semaphore_t v19 = v61;
      }
      if (objc_opt_respondsToSelector())
      {
        uint64_t v31 = [v8 importWillBegin];

        if (v31)
        {
          id v32 = [v8 contentType];
          v6[2](v6, v32);
          int v33 = 2;
          uint64_t v58 = (void *)v31;
          uint64_t v34 = v60;
          goto LABEL_27;
        }
        uint64_t v58 = 0;
      }
      uint64_t v35 = [v5 sqlController];
      double v36 = [v35 summariesForAccounts:v19 sortedByModifiedDate:1];

      v70[0] = MEMORY[0x263EF8330];
      v70[1] = 3221225472;
      v70[2] = __57__WLMigrator__importDataWithContext_failureDetailsBlock___block_invoke;
      v70[3] = &unk_26490CB28;
      id v37 = v5;
      id v71 = v37;
      double v38 = (void *)MEMORY[0x230F5E7D0](v70);
      double v39 = [v37 dataCoordinator];
      v68[0] = MEMORY[0x263EF8330];
      v68[1] = 3221225472;
      v68[2] = __57__WLMigrator__importDataWithContext_failureDetailsBlock___block_invoke_2;
      v68[3] = &unk_26490CB50;
      id v40 = v37;
      id v69 = v40;
      v62[0] = MEMORY[0x263EF8330];
      v62[1] = 3221225472;
      v62[2] = __57__WLMigrator__importDataWithContext_failureDetailsBlock___block_invoke_3;
      v62[3] = &unk_26490CB78;
      v62[4] = self;
      id v32 = v36;
      id v63 = v32;
      id v64 = v19;
      id v41 = v40;
      id v65 = v41;
      id v66 = v8;
      unint64_t v42 = v13;
      id v43 = v13;
      id v67 = v43;
      [v39 importDataForMigrator:v8 fromProvider:v38 forSummaries:v32 summaryStart:v68 summaryCompletion:v62];

      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_25;
      }
      uint64_t v44 = [v8 importDidEnd];

      if (!v44)
      {
        uint64_t v58 = 0;
LABEL_25:
        objc_msgSend(v43, "setImportEndBytesFree:", +[WLMigrator _bytesFreeOnDevice](WLMigrator, "_bytesFreeOnDevice"));
        id v46 = [MEMORY[0x263EFF910] date];
        [v43 setImportEndDate:v46];

        uint64_t v47 = [v41 sqlController];
        [v47 updateStatistics:v43];

        id v45 = [v43 importEndDate];
        char v48 = [v43 importStartDate];
        [v45 timeIntervalSinceDate:v48];
        [v8 addWorkingTime:(unint64_t)v49];

        int v33 = 0;
        goto LABEL_26;
      }
      id v45 = [v8 contentType];
      v6[2](v6, v45);
      int v33 = 2;
      uint64_t v58 = (void *)v44;
LABEL_26:

      double v13 = v42;
      uint64_t v7 = v57;
      uint64_t v34 = v60;
      dispatch_semaphore_t v19 = v61;
LABEL_27:

      if (v33) {
        goto LABEL_30;
      }
      [v8 setState:@"imported"];
      uint64_t v9 = v34 + 1;
      id v10 = v8;
    }
    while (v9 != v56);
    uint64_t v56 = [v7 countByEnumeratingWithState:&v76 objects:v81 count:16];
  }
  while (v56);
LABEL_30:

  uint64_t v50 = v58;
  if (v58 && v8) {
    [v8 setState:@"importing_error"];
  }
LABEL_34:

  return v50;
}

id __57__WLMigrator__importDataWithContext_failureDetailsBlock___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 sqlController];
  id v5 = [v4 dataForSummary:v3];

  return v5;
}

void __57__WLMigrator__importDataWithContext_failureDetailsBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 sqlController];
  [v4 setWillImportForSummary:v3];
}

void __57__WLMigrator__importDataWithContext_failureDetailsBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  id v10 = [*(id *)(a1 + 56) migrators];
  [v7 _progressIncrementForImportedSummary:v5 summaries:v8 accounts:v9 migrators:v10];
  double v12 = v11;

  [*(id *)(a1 + 32) _incrementProgressBy:*(void *)(a1 + 56) context:v12];
  if (v6)
  {
    double v13 = [MEMORY[0x263F862E0] sharedInstance];
    double v14 = [*(id *)(a1 + 64) contentType];
    [v13 importDidFailSilentlyForContentType:v14];

    double v15 = [*(id *)(a1 + 56) sqlController];
    [v15 setMigrationError:v6 forSummary:v5];

    objc_msgSend(*(id *)(a1 + 72), "setImportFailedRecordCount:", objc_msgSend(*(id *)(a1 + 72), "importFailedRecordCount") + 1);
  }
  else
  {
    uint64_t v16 = [*(id *)(a1 + 56) sqlController];
    [v16 removeDataAndSetDidImportForSummary:v5];

    if ([v5 storeDataAsFile])
    {
      double v17 = NSURL;
      double v18 = [v5 dataFilePath];
      dispatch_semaphore_t v19 = [v17 fileURLWithPath:v18 isDirectory:0];

      uint64_t v20 = [MEMORY[0x263F08850] defaultManager];
      id v28 = 0;
      uint64_t v21 = [v20 removeItemAtURL:v19 error:&v28];
      id v6 = v28;

      uint64_t v22 = *(void *)(a1 + 32);
      uint64_t v26 = [NSNumber numberWithBool:v21];
      id v27 = v6;
      uint64_t v24 = v22;
      uint64_t v25 = v19;
      _WLLog();
    }
    else
    {
      id v6 = 0;
    }
    objc_msgSend(*(id *)(a1 + 72), "setImportRecordCount:", objc_msgSend(*(id *)(a1 + 72), "importRecordCount", v24, v25, v26, v27) + 1);
  }
  uint64_t v23 = [*(id *)(a1 + 56) sqlController];
  [v23 updateStatistics:*(void *)(a1 + 72)];
}

- (double)_progressIncrementForImportedSummary:(id)a3 summaries:(id)a4 accounts:(id)a5 migrators:(id)a6
{
  id v8 = a6;
  id v9 = a5;
  double v10 = 1.0 / (double)(unint64_t)[a4 count];
  unint64_t v11 = [v9 count];

  unint64_t v12 = [v8 count];
  return v10 * (1.0 / (double)v11) * (1.0 / (double)v12) * 0.2;
}

- (void)_logStatisticsAndSendStatisticsTelemetryWithContext:(id)a3
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 sourceDevice];
  char v6 = [v5 isLocal];

  uint64_t v7 = v3;
  _WLLog();
  id v8 = [v4 sqlController];
  id v9 = +[WLStatistics fetchContentType];
  double v10 = [v8 statisticsForContentType:v9];

  id v41 = v10;
  double v38 = [v10 fetchLogString];
  _WLLog();

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  unint64_t v11 = objc_msgSend(v4, "migrators", v38);
  uint64_t v58 = [v11 countByEnumeratingWithState:&v59 objects:v63 count:16];
  if (v58)
  {
    uint64_t v56 = *(void *)v60;
    char v43 = v6;
    id v42 = v4;
    do
    {
      for (uint64_t i = 0; i != v58; ++i)
      {
        if (*(void *)v60 != v56) {
          objc_enumerationMutation(v11);
        }
        double v13 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        double v14 = [v4 sqlController];
        double v15 = [v13 contentType];
        uint64_t v16 = [v14 statisticsForContentType:v15];

        double v39 = v16;
        _WLLog();
        if ((v6 & 1) == 0)
        {
          double v17 = objc_msgSend(v13, "contentType", v16);
          char v18 = [v17 isEqualToString:@"unsupported"];

          if ((v18 & 1) == 0)
          {
            if (v16)
            {
              char v48 = [MEMORY[0x263F862E0] sharedInstance];
              uint64_t v54 = [v13 contentType];
              uint64_t v50 = [v16 downloadByteCount];
              uint64_t v49 = [v16 importRecordCount];
              uint64_t v47 = [v16 importFailedRecordCount];
              uint64_t v46 = [v16 downloadDuration];
              uint64_t v45 = [v16 importDuration];
              double v52 = [v4 metadata];
              uint64_t v44 = [v52 deviceOSVersion];
              dispatch_semaphore_t v19 = [v4 metadata];
              uint64_t v20 = [v19 deviceModel];
              uint64_t v21 = [v4 metadata];
              [v21 clientVersion];
              uint64_t v22 = v11;
              v24 = uint64_t v23 = v7;
              [v48 contentTypeDidComplete:v54 downloadByteCount:v50 importRecordCount:v49 importFailedRecordCount:v47 downloadDuration:v46 importDuration:v45 android:v44 model:v20 version:v24];

              uint64_t v7 = v23;
              unint64_t v11 = v22;

              char v6 = v43;
              id v4 = v42;
            }
          }
        }
        uint64_t v25 = objc_msgSend(v4, "aggregateStatistics", v39);
        objc_msgSend(v25, "setDownloadDuration:", objc_msgSend(v25, "downloadDuration") + objc_msgSend(v16, "downloadDuration"));

        uint64_t v26 = [v4 aggregateStatistics];
        objc_msgSend(v26, "setDownloadByteCount:", objc_msgSend(v26, "downloadByteCount") + objc_msgSend(v16, "downloadByteCount"));

        id v27 = [v4 aggregateStatistics];
        objc_msgSend(v27, "setImportRecordCount:", objc_msgSend(v27, "importRecordCount") + objc_msgSend(v16, "importRecordCount"));

        id v28 = [v4 aggregateStatistics];
        objc_msgSend(v28, "setImportFailedRecordCount:", objc_msgSend(v28, "importFailedRecordCount") + objc_msgSend(v16, "importFailedRecordCount"));
      }
      uint64_t v58 = [v11 countByEnumeratingWithState:&v59 objects:v63 count:16];
    }
    while (v58);
  }

  id v40 = [v4 aggregateStatistics];
  _WLLog();

  if ((v6 & 1) == 0)
  {
    double v29 = objc_msgSend(v4, "aggregateStatistics", v40);
    double v30 = [MEMORY[0x263F862E0] sharedInstance];
    uint64_t v57 = [v29 downloadByteCount];
    uint64_t v55 = [v29 importRecordCount];
    uint64_t v53 = [v29 importFailedRecordCount];
    uint64_t v51 = [v29 downloadDuration];
    uint64_t v31 = [v29 importDuration];
    id v32 = [v4 metadata];
    int v33 = [v32 deviceOSVersion];
    uint64_t v34 = [v4 metadata];
    uint64_t v35 = [v34 deviceModel];
    double v36 = [v4 metadata];
    id v37 = [v36 clientVersion];
    [v30 contentTypeDidComplete:@"(aggregate)" downloadByteCount:v57 importRecordCount:v55 importFailedRecordCount:v53 downloadDuration:v51 importDuration:v31 android:v33 model:v35 version:v37];
  }
  _WLLog();
}

+ (id)_systemVersion
{
  id v2 = (void *)_CFCopySystemVersionDictionary();
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263EFFAB0]];

  return v3;
}

- (void)close:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __20__WLMigrator_close___block_invoke;
  v6[3] = &unk_26490CBA0;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(WLMigrator *)self finalizeMigratableAppsWithCompletion:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __20__WLMigrator_close___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained cleanup];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
}

- (void)cleanup
{
  if (([MEMORY[0x263F862A0] isInternal] & 1) == 0)
  {
    uint64_t v3 = NSHomeDirectory();
    id v4 = [v3 stringByAppendingString:@"/Library/WelcomeKit/"];

    [(WLMigrator *)self _deleteDownloadsPath:v4];
  }
}

- (void)finalizeMigratableAppsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(WLSQLController);
  char v6 = [(WLSQLController *)v5 migratableAppsForAllDevices];
  id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
  _WLLog();

  if (objc_msgSend(v6, "count", v7))
  {
    _WLLog();
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __51__WLMigrator_finalizeMigratableAppsWithCompletion___block_invoke;
    v8[3] = &unk_26490CBF0;
    id v9 = v6;
    double v10 = self;
    unint64_t v11 = v5;
    id v12 = v4;
    +[WLMigrator _presentPromptForMigrableApps:v8];
  }
  else
  {
    [(WLMigrator *)self _cleanUpAfterFinalizeMigratableAppsWithSQLController:v5 completion:v4];
  }
}

void __51__WLMigrator_finalizeMigratableAppsWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  double v10 = [NSNumber numberWithBool:a2];
  _WLLog();

  id v4 = objc_msgSend(MEMORY[0x263F862E0], "sharedInstance", v10);
  [v4 userDidChooseToInstallMigratableApps:a2];

  if (a2)
  {
    _WLLog();
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __51__WLMigrator_finalizeMigratableAppsWithCompletion___block_invoke_2;
    v11[3] = &unk_26490CBC8;
    uint64_t v5 = *(void *)(a1 + 32);
    char v6 = *(void **)(a1 + 48);
    v11[4] = *(void *)(a1 + 40);
    id v12 = v6;
    id v13 = *(id *)(a1 + 56);
    +[WLAppMigrator installMigratableApps:v5 completion:v11];
  }
  else
  {
    id v7 = *(void **)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    [v7 _cleanUpAfterFinalizeMigratableAppsWithSQLController:v8 completion:v9];
  }
}

uint64_t __51__WLMigrator_finalizeMigratableAppsWithCompletion___block_invoke_2(void *a1)
{
  _WLLog();
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  return [v2 _cleanUpAfterFinalizeMigratableAppsWithSQLController:v3 completion:v4];
}

+ (void)_presentPromptForMigrableApps:(id)a3
{
  v16[4] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v15[0] = *MEMORY[0x263EFFFC8];
  uint64_t v4 = WLLocalizedString();
  v16[0] = v4;
  v15[1] = *MEMORY[0x263EFFFD8];
  uint64_t v5 = WLLocalizedString();
  v16[1] = v5;
  v15[2] = *MEMORY[0x263F00000];
  char v6 = WLLocalizedString();
  v16[2] = v6;
  v15[3] = *MEMORY[0x263EFFFE8];
  id v7 = WLLocalizedString();
  v16[3] = v7;
  CFDictionaryRef v8 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:4];

  CFUserNotificationRef v9 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0.0, 0, 0, v8);
  double v10 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__WLMigrator__presentPromptForMigrableApps___block_invoke;
  block[3] = &unk_26490CC18;
  id v13 = v3;
  CFUserNotificationRef v14 = v9;
  id v11 = v3;
  dispatch_async(v10, block);
}

uint64_t __44__WLMigrator__presentPromptForMigrableApps___block_invoke(uint64_t a1)
{
  CFOptionFlags responseFlags = 0;
  CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(a1 + 40), 0.0, &responseFlags);
  CFRelease(*(CFTypeRef *)(a1 + 40));
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), responseFlags == 0);
}

- (void)_cleanUpAfterFinalizeMigratableAppsWithSQLController:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v5 = a3;
  [v5 deleteMigratableAppsForAllDevices];
  [v5 deleteSuggestedAppBundleIDsForAllDevices];

  char v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    char v6 = v7;
  }
}

+ (BOOL)stashDataLocally
{
  return [MEMORY[0x263F862C0] BOOLForKey:@"WLStashDataLocally"] == 1;
}

+ (void)setStashDataLocally:(BOOL)a3
{
}

+ (BOOL)_shouldContinueMigrationFromAnotherDevice
{
  if (_shouldContinueMigrationFromAnotherDevice_onceToken != -1) {
    dispatch_once(&_shouldContinueMigrationFromAnotherDevice_onceToken, &__block_literal_global_430);
  }
  return _shouldContinueMigrationFromAnotherDevice_shouldContinueMigrationFromAnotherDevice;
}

uint64_t __55__WLMigrator__shouldContinueMigrationFromAnotherDevice__block_invoke()
{
  uint64_t result = [MEMORY[0x263F862C0] BOOLForKey:@"WLContinueMigrationFromAnotherDevice"];
  _shouldContinueMigrationFromAnotherDevice_shouldContinueMigrationFromAnotherDevice = result == 1;
  if (result == 1)
  {
    return _WLLog();
  }
  return result;
}

+ (BOOL)_shouldTerminateMigrationBeforeImport
{
  if (_shouldTerminateMigrationBeforeImport_onceToken != -1) {
    dispatch_once(&_shouldTerminateMigrationBeforeImport_onceToken, &__block_literal_global_438);
  }
  return _shouldTerminateMigrationBeforeImport_shouldTerminateMigrationBeforeImport;
}

uint64_t __51__WLMigrator__shouldTerminateMigrationBeforeImport__block_invoke()
{
  uint64_t result = [MEMORY[0x263F862C0] BOOLForKey:@"WLTerminateMigrationBeforeImport"];
  _shouldTerminateMigrationBeforeImport_shouldTerminateMigrationBeforeImport = result == 1;
  if (result == 1)
  {
    return _WLLog();
  }
  return result;
}

- (BOOL)_shouldTerminateMigrationOnError
{
  if (_shouldTerminateMigrationOnError_onceToken != -1) {
    dispatch_once(&_shouldTerminateMigrationOnError_onceToken, &__block_literal_global_446);
  }
  return _shouldTerminateMigrationOnError_shouldTerminateMigrationOnError;
}

uint64_t __46__WLMigrator__shouldTerminateMigrationOnError__block_invoke()
{
  uint64_t result = [MEMORY[0x263F862C0] BOOLForKey:@"TolerateMigrationErrors"];
  _shouldTerminateMigrationOnError_shouldTerminateMigrationOnError = result != 1;
  return result;
}

- (void)_setProgressTo:(double)a3 context:(id)a4
{
  obuint64_t j = a4;
  objc_sync_enter(obj);
  [obj setProgress:a3];
  char v6 = [obj delegate];
  *(float *)&double v7 = a3;
  [v6 dataMigrator:self didUpdateProgressPercentage:v7];

  _WLLog();
  objc_sync_exit(obj);
}

- (void)_incrementProgressBy:(double)a3 context:(id)a4
{
  obuint64_t j = a4;
  objc_sync_enter(obj);
  [obj progress];
  [obj setProgress:v6 + a3];
  double v7 = [obj delegate];
  [obj progress];
  *(float *)&double v8 = v8;
  [v7 dataMigrator:self didUpdateProgressPercentage:v8];

  [obj progress];
  _WLLog();
  objc_sync_exit(obj);
}

- (void)_updateSourceWithProgress:(double)a3 remainingTime:(double)a4 context:(id)a5 completion:(id)a6
{
  id v10 = a5;
  if (a6) {
    id v11 = a6;
  }
  else {
    id v11 = &__block_literal_global_457;
  }
  id v12 = (void (**)(void))MEMORY[0x230F5E7D0](v11);
  id v13 = [MEMORY[0x263EFF910] now];
  CFUserNotificationRef v14 = [v10 lastProgressSentDate];
  [v13 timeIntervalSinceDate:v14];
  double v16 = v15;

  if (v16 >= 5.0 || ([v10 lastProgressSentToAndroidDevice], a3 == 0.8) || a3 - v17 >= 0.01)
  {
    [v10 setLastProgressSentToAndroidDevice:a3];
    [v10 setLastProgressSentDate:v13];
    [v10 lastProgressSentToAndroidDevice];
    uint64_t v19 = v18;
    uint64_t v24 = [NSNumber numberWithDouble:a3];
    _WLLog();

    uint64_t v20 = objc_msgSend(v10, "dataCoordinator", self, v19, v24);
    uint64_t v21 = [v10 dataSource];
    [v10 lastProgressSentToAndroidDevice];
    double v23 = v22;
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __73__WLMigrator__updateSourceWithProgress_remainingTime_context_completion___block_invoke_2;
    void v25[3] = &unk_26490CC40;
    v25[4] = self;
    id v26 = v10;
    id v27 = v12;
    [v20 updateSource:v21 withProgress:v25 remainingTime:v23 completion:a4];
  }
  else
  {
    v12[2](v12);
  }
}

uint64_t __73__WLMigrator__updateSourceWithProgress_remainingTime_context_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 40);
  id v6 = a3;
  [v5 lastProgressSentToAndroidDevice];
  CFUserNotificationRef v9 = [NSNumber numberWithBool:a2];
  _WLLog();

  double v7 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v7();
}

+ (unint64_t)_bytesFreeOnDevice
{
  uint64_t v2 = (void *)MGCopyAnswer();
  objc_opt_class();
  unint64_t v3 = 0;
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v2 objectForKeyedSubscript:*MEMORY[0x263F8BD10]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unint64_t v3 = [v4 unsignedLongLongValue];
    }
    else {
      unint64_t v3 = 0;
    }
  }
  return v3;
}

- (void)deleteMessages
{
  _WLLog();
  uint64_t v2 = objc_alloc_init(WLMessagesMigrator);
  [(WLMessagesMigrator *)v2 deleteData];
}

- (WLSocketHandler)activeSocketHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeSocketHandler);
  return (WLSocketHandler *)WeakRetained;
}

- (void)setActiveSocketHandler:(id)a3
{
}

- (WLMigrationDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_activeSocketHandler);
}

@end