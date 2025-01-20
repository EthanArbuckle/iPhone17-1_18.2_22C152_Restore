@interface PDMapsMerchantProcessingService
- (PDMapsMerchantProcessingService)initWithDatabaseManager:(id)a3 transactionProcessor:(id)a4 webServiceCoordinator:(id)a5;
- (id)_processingItemsForScheduledActivity;
- (void)_logScheduledActivityWithItems:(id)a3;
- (void)_processItem:(id)a3;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)start;
@end

@implementation PDMapsMerchantProcessingService

- (PDMapsMerchantProcessingService)initWithDatabaseManager:(id)a3 transactionProcessor:(id)a4 webServiceCoordinator:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PDMapsMerchantProcessingService;
  v12 = [(PDMapsMerchantProcessingService *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_databaseManager, a3);
    objc_storeStrong((id *)&v13->_transactionProcessor, a4);
    objc_storeStrong((id *)&v13->_webServiceCoordinator, a5);
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.passd.PDMapsMerchantProcessingService.work", v14);
    workQueue = v13->_workQueue;
    v13->_workQueue = (OS_dispatch_queue *)v15;
  }
  return v13;
}

- (void)start
{
  webServiceCoordinator = self->_webServiceCoordinator;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10041922C;
  v3[3] = &unk_100743188;
  v3[4] = self;
  [(PDPaymentWebServiceCoordinator *)webServiceCoordinator performHandlerOnSharedWebServiceQueue:v3];
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100419548;
  block[3] = &unk_10072E1E8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)_logScheduledActivityWithItems:(id)a3
{
  id v12 = a3;
  if (PKEnableMerchantReprocessingLogging())
  {
    v3 = +[NSFileManager defaultManager];
    v4 = PKHomeDirectoryPath();
    v5 = [v4 stringByAppendingPathComponent:@"MerchantReprocessingLogs.txt"];
    if (([v3 fileExistsAtPath:v5] & 1) != 0
      || (unsigned int v6 = [v3 createFileAtPath:v5 contents:0 attributes:0],
          PKExcludePathFromBackup(),
          v6))
    {
      v7 = +[NSFileHandle fileHandleForUpdatingAtPath:v5];
      [v7 seekToEndOfFile];
      v8 = +[NSDate date];
      id v9 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v12 count]);
      id v10 = +[NSString stringWithFormat:@"%@ - Reprocessed %@ transactions", v8, v9];

      id v11 = [v10 dataUsingEncoding:4];
      [v7 writeData:v11];

      [v7 closeFile];
    }
  }
}

- (id)_processingItemsForScheduledActivity
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = +[NSDate date];
  v20 = [v4 dateByAddingTimeInterval:-self->_waitTime];

  v5 = [(PDDatabaseManager *)self->_databaseManager passesOfType:1];
  v17 = (void *)PDOSTransactionCreate("PDMapsMerchantProcessingService");
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v5;
  id v21 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v21)
  {
    uint64_t v19 = *(void *)v27;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(obj);
        }
        v7 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * i), "deviceTransactionSourceIdentifiers", v17);
        v8 = [(PDDatabaseManager *)self->_databaseManager transactionsRequiringMerchantCleanupForTransactionSourceIdentifiers:v7 withLastReprocessingDateBeforeDate:v20 transactionDateWithinWindow:1814400.0];
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v9 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v23;
          do
          {
            for (j = 0; j != v10; j = (char *)j + 1)
            {
              if (*(void *)v23 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * (void)j);
              v14 = objc_alloc_init(PDMapsMerchantProcessingItem);
              [(PDMapsMerchantProcessingItem *)v14 setTransaction:v13];
              [(PDMapsMerchantProcessingItem *)v14 setTransactionSourceIdentifiers:v7];
              [v3 addObject:v14];
            }
            id v10 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v10);
        }
      }
      id v21 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v21);
  }

  id v15 = [v3 copy];
  return v15;
}

- (void)_processItem:(id)a3
{
  id v4 = a3;
  id v12 = [v4 transaction];
  databaseManager = self->_databaseManager;
  unsigned int v6 = [v4 transactionSourceIdentifiers];

  v7 = [v6 anyObject];
  v8 = [(PDDatabaseManager *)databaseManager passUniqueIdentifierForTransactionSourceIdentifier:v7];

  id v9 = [(PDDatabaseManager *)self->_databaseManager defaultPaymentApplicationForPassUniqueIdentifier:v8];
  if (([v12 processedForMerchantCleanup] & 1) == 0)
  {
    [v12 setProcessedForLocation:1];
    [v12 setProcessedForStations:1];
    [v12 setProcessedForMerchantCleanup:1];
  }
  transactionProcessor = self->_transactionProcessor;
  uint64_t v11 = [v9 transactionSourceIdentifier];
  [(PDPaymentTransactionProcessor *)transactionProcessor processPaymentTransaction:v12 forTransactionSourceIdentifier:v11];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_webServiceCoordinator, 0);
  objc_storeStrong((id *)&self->_transactionProcessor, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
}

@end