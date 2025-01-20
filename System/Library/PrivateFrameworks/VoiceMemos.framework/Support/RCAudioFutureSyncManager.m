@interface RCAudioFutureSyncManager
- (BOOL)___pushAudioFutureIntoBatch:(id)a3;
- (BOOL)_shouldRetryFutureDownloadForError:(id)a3;
- (BOOL)_transactionHasAudioFutureChange:(id)a3;
- (RCAudioFutureSyncManager)initWithScheduler:(id)a3;
- (RCAudioFutureSyncManagerDelegate)delegate;
- (id)___popAudioFutureBatch;
- (id)_audioFutureEntityToAttributesDict;
- (id)_mostRecentAudioFutureTransactionForObjectID:(id)a3 model:(id)a4;
- (id)_newBackgroundMirroringModel;
- (void)___fetchAudioFuturesWithCompletionBlock:(id)a3;
- (void)___fetchNextAudioFutureBatch:(id)a3;
- (void)__fetchAudioFuture:(id)a3 completionBlock:(id)a4;
- (void)_checkProgressAndUpdateIfNeeded:(id)a3 latestToken:(id)a4 model:(id)a5;
- (void)_checkProgressOfExportingRecordings:(id)a3;
- (void)_fetchProgressAndUpdateIfNeeded:(id)a3 mirroringModel:(id)a4;
- (void)_handleCloudKitContainerEvent:(id)a3;
- (void)_handleCloudKitContainerEventChangedNotification:(id)a3;
- (void)_performOnSchedulerQueue:(id)a3;
- (void)_processExportProgressResult:(id)a3 mirroringModel:(id)a4;
- (void)_updateRecordingOnAssetExportCompletion:(id)a3 model:(id)a4;
- (void)_validateCorrectStore:(id)a3;
- (void)importAudioFuture:(id)a3 mirroringModel:(id)a4;
- (void)markRecordingAsNeedingExport:(id)a3 model:(id)a4;
- (void)markRecordingsAsNeedingExportAndCheckProgress:(id)a3 mirroringModel:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setPersistentStore:(id)a3;
@end

@implementation RCAudioFutureSyncManager

- (RCAudioFutureSyncManager)initWithScheduler:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RCAudioFutureSyncManager;
  v6 = [(RCAudioFutureSyncManager *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_scheduler, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.voicememod.RCAudioFutureSyncManager", 0);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v8;
  }
  return v7;
}

- (void)markRecordingsAsNeedingExportAndCheckProgress:(id)a3 mirroringModel:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100010A64;
    v8[3] = &unk_100038CF8;
    id v9 = v6;
    id v10 = v7;
    objc_super v11 = self;
    [v10 performBlockAndWait:v8];
  }
}

- (void)markRecordingAsNeedingExport:(id)a3 model:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100010C54;
  v9[3] = &unk_100038CF8;
  id v10 = a4;
  id v11 = v6;
  v12 = self;
  id v7 = v6;
  id v8 = v10;
  [v8 performBlockAndWait:v9];
}

- (void)setPersistentStore:(id)a3
{
  v4 = (NSPersistentStore *)a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [(NSPersistentStore *)v4 rc_mirroringDelegate];
    id v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:self selector:"_handleCloudKitContainerEventChangedNotification:" name:NSPersistentCloudKitContainerEventChangedNotification object:v6];
  }
  else
  {
    id v6 = [(NSPersistentStore *)self->_persistentStore rc_mirroringDelegate];
    id v7 = +[NSNotificationCenter defaultCenter];
    [v7 removeObserver:self name:NSPersistentCloudKitContainerEventChangedNotification object:v6];
  }

  persistentStore = self->_persistentStore;
  self->_persistentStore = v5;
  id v9 = v5;

  id v10 = [(NSPersistentStore *)v9 persistentStoreCoordinator];
  id v11 = [v10 managedObjectModel];
  v12 = [v11 entitiesByName];
  id v19 = [v12 objectForKeyedSubscript:RCCloudRecording_EntityName];

  v13 = [v19 attributesByName];
  v14 = [v13 objectForKeyedSubscript:RCCloudRecording_AudioFuture];
  audioFutureDescription = self->_audioFutureDescription;
  self->_audioFutureDescription = v14;

  v16 = [v19 attributesByName];
  v17 = [v16 objectForKeyedSubscript:RCCloudRecording_MtAudioFuture];
  mtAudioFutureDescription = self->_mtAudioFutureDescription;
  self->_mtAudioFutureDescription = v17;
}

- (void)_handleCloudKitContainerEventChangedNotification:(id)a3
{
  v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:NSPersistentCloudKitContainerEventUserInfoKey];

  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(RCAudioFutureSyncManager *)self _handleCloudKitContainerEvent:v5];
    }
  }
}

- (void)_handleCloudKitContainerEvent:(id)a3
{
  id v6 = a3;
  if ([v6 type] == (id)2)
  {
    if ([v6 succeeded])
    {
      v4 = [v6 endDate];

      if (v4)
      {
        id v5 = [(RCAudioFutureSyncManager *)self _newBackgroundMirroringModel];
        [(RCAudioFutureSyncManager *)self _checkProgressOfExportingRecordings:v5];
      }
    }
  }
}

- (void)_checkProgressOfExportingRecordings:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001103C;
  v5[3] = &unk_100038D20;
  id v6 = a3;
  id v7 = self;
  id v4 = v6;
  [v4 performBlockAndWait:v5];
}

- (void)_fetchProgressAndUpdateIfNeeded:(id)a3 mirroringModel:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100011138;
  v6[3] = &unk_100039000;
  v6[4] = self;
  id v7 = a4;
  id v5 = v7;
  [v5 fetchExportProgress:a3 forStore:0 completionHandler:v6];
}

- (void)_processExportProgressResult:(id)a3 mirroringModel:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000112A4;
  v8[3] = &unk_100038CF8;
  id v9 = a3;
  id v10 = self;
  id v11 = a4;
  id v6 = v11;
  id v7 = v9;
  [v6 performBlockAndWait:v8];
}

- (void)_checkProgressAndUpdateIfNeeded:(id)a3 latestToken:(id)a4 model:(id)a5
{
  id v13 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [(RCAudioFutureSyncManager *)self _mostRecentAudioFutureTransactionForObjectID:v13 model:v8];
  id v11 = [v8 transactionForToken:v9 forStore:0];

  if (v11)
  {
    if (v10)
    {
      id v12 = [v11 transactionNumber];
      if ((uint64_t)v12 >= (uint64_t)[v10 transactionNumber]) {
        [(RCAudioFutureSyncManager *)self _updateRecordingOnAssetExportCompletion:v13 model:v8];
      }
    }
  }
}

- (void)_updateRecordingOnAssetExportCompletion:(id)a3 model:(id)a4
{
  id v5 = a4;
  id v6 = [v5 recordingWithID:a3];
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 syncedAudioFuture];

    if (v8)
    {
      [v7 setAudioFutureNeedsExport:0];
      id v9 = [v7 url];
      id v16 = 0;
      unsigned int v10 = [v7 markRecordingAsExported:v9 error:&v16];
      id v11 = v16;
      id v12 = OSLogForCategory();
      id v13 = v12;
      if (v10)
      {
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
LABEL_8:

          [v5 saveIfNecessary];
          goto LABEL_9;
        }
        v14 = [v7 uuid];
        v15 = [v9 lastPathComponent];
        *(_DWORD *)buf = 136315650;
        v18 = "-[RCAudioFutureSyncManager _updateRecordingOnAssetExportCompletion:model:]";
        __int16 v19 = 2112;
        v20 = v14;
        __int16 v21 = 2112;
        v22 = v15;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s -- Marked recording as exported, uniqueID = %@, path = %@", buf, 0x20u);
      }
      else
      {
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          goto LABEL_8;
        }
        v14 = [v7 uuid];
        v15 = [v9 lastPathComponent];
        *(_DWORD *)buf = 136315906;
        v18 = "-[RCAudioFutureSyncManager _updateRecordingOnAssetExportCompletion:model:]";
        __int16 v19 = 2112;
        v20 = v14;
        __int16 v21 = 2112;
        v22 = v15;
        __int16 v23 = 2112;
        id v24 = v11;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s -- ERROR: uniqueID = %@, path = %@, mark as exported error = %@", buf, 0x2Au);
      }

      goto LABEL_8;
    }
  }
LABEL_9:
}

- (id)_mostRecentAudioFutureTransactionForObjectID:(id)a3 model:(id)a4
{
  id v5 = [a4 transactionsAndChangesForObjectID:a3];
  id v6 = (char *)[v5 count];
  while ((uint64_t)--v6 >= 0)
  {
    id v7 = [v5 objectAtIndexedSubscript:v6];
    unsigned int v8 = [(RCAudioFutureSyncManager *)self _transactionHasAudioFutureChange:v7];

    if (v8)
    {
      id v9 = [v5 objectAtIndexedSubscript:v6];
      goto LABEL_6;
    }
  }
  id v9 = 0;
LABEL_6:

  return v9;
}

- (BOOL)_transactionHasAudioFutureChange:(id)a3
{
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v3 = [a3 changes];
  id v4 = [v3 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v25;
    uint64_t v7 = RCCloudRecording_AudioFuture;
    uint64_t v8 = RCCloudRecording_MtAudioFuture;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(v3);
        }
        unsigned int v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (![v10 changeType])
        {
LABEL_20:
          BOOL v17 = 1;
          goto LABEL_22;
        }
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v11 = [v10 updatedProperties];
        id v12 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v21;
          uint64_t v19 = v6;
          while (2)
          {
            for (j = 0; j != v13; j = (char *)j + 1)
            {
              if (*(void *)v21 != v14) {
                objc_enumerationMutation(v11);
              }
              id v16 = [*(id *)(*((void *)&v20 + 1) + 8 * (void)j) name];
              if (([v16 isEqualToString:v7] & 1) != 0
                || ([v16 isEqualToString:v8] & 1) != 0)
              {

                goto LABEL_20;
              }
            }
            id v13 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
            uint64_t v6 = v19;
            if (v13) {
              continue;
            }
            break;
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v24 objects:v29 count:16];
      BOOL v17 = 0;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v17 = 0;
  }
LABEL_22:

  return v17;
}

- (id)_newBackgroundMirroringModel
{
  v2 = [(RCAudioFutureSyncManager *)self delegate];
  id v3 = [v2 newBackgroundMirroringModel];

  return v3;
}

- (void)importAudioFuture:(id)a3 mirroringModel:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 recordingWithID:v6];
  id v9 = v8;
  if (v8)
  {
    if ([v8 isContentBeingModified])
    {
      unsigned int v10 = OSLogForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = [v9 url];
        *(_DWORD *)buf = 136315394;
        BOOL v17 = "-[RCAudioFutureSyncManager importAudioFuture:mirroringModel:]";
        __int16 v18 = 2112;
        uint64_t v19 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s -- Ignoring iCloud change for actively modified recording at URL:  %@", buf, 0x16u);
      }
    }
    else
    {
      unsigned int v10 = [v9 syncedAudioFuture];
      if (v10 && ![v9 localAssetIsCurrent])
      {
        id v12 = [v10 fileURL];
        id v13 = v12;
        if (v12
          && [v12 checkResourceIsReachableAndReturnError:0]
          && (uint64_t v15 = 0, [v9 synchronizeWithExistingAudioFuture:&v15]))
        {
          [v7 saveIfNecessary];
        }
        else
        {
          [v9 setAudioFutureNeedsDownload:1];
          [v7 saveIfNecessary];
          v14[0] = _NSConcreteStackBlock;
          v14[1] = 3221225472;
          v14[2] = sub_100011BA4;
          v14[3] = &unk_100039078;
          v14[4] = self;
          [(RCAudioFutureSyncManager *)self __fetchAudioFuture:v6 completionBlock:v14];
        }
      }
      else if ([v9 audioFutureNeedsDownload])
      {
        [v9 setAudioFutureNeedsDownload:0];
        [v7 saveIfNecessary];
      }
    }
  }
  else
  {
    unsigned int v10 = OSLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100023400();
    }
  }
}

- (BOOL)_shouldRetryFutureDownloadForError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  if (![v4 isEqualToString:CKErrorDomain])
  {

    goto LABEL_5;
  }
  id v5 = [v3 code];

  if (v5 != (id)11)
  {
LABEL_5:
    BOOL v6 = 1;
    goto LABEL_6;
  }
  BOOL v6 = 0;
LABEL_6:

  return v6;
}

- (BOOL)___pushAudioFutureIntoBatch:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012370;
  block[3] = &unk_1000390A0;
  block[4] = self;
  id v9 = v4;
  unsigned int v10 = &v11;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  LOBYTE(serialQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)serialQueue;
}

- (id)___popAudioFutureBatch
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_100007E48;
  unsigned int v10 = sub_100012578;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100012580;
  v5[3] = &unk_100038F08;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)___fetchNextAudioFutureBatch:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  serialQueue = self->_serialQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000126D8;
  v6[3] = &unk_1000390C8;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync((dispatch_queue_t)serialQueue, v6);
  if (*((unsigned char *)v8 + 24)) {
    [(RCAudioFutureSyncManager *)self ___fetchAudioFuturesWithCompletionBlock:v4];
  }
  _Block_object_dispose(&v7, 8);
}

- (id)_audioFutureEntityToAttributesDict
{
  id v3 = self->_audioFutureDescription;
  id v4 = v3;
  mtAudioFutureDescription = self->_mtAudioFutureDescription;
  if (v3) {
    BOOL v6 = mtAudioFutureDescription == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    uint64_t v9 = 0;
  }
  else
  {
    v11[1] = self->_mtAudioFutureDescription;
    uint64_t v12 = RCCloudRecording_EntityName;
    v11[0] = v3;
    uint64_t v7 = mtAudioFutureDescription;
    uint64_t v8 = +[NSArray arrayWithObjects:v11 count:2];
    uint64_t v13 = v8;
    uint64_t v9 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  }
  return v9;
}

- (void)___fetchAudioFuturesWithCompletionBlock:(id)a3
{
  id v4 = a3;
  scheduler = self->_scheduler;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000128D8;
  v7[3] = &unk_100039140;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(RCBlockScheduler *)scheduler scheduleBlock:v7];
}

- (void)__fetchAudioFuture:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  if ([(RCAudioFutureSyncManager *)self ___pushAudioFutureIntoBatch:a3]) {
    [(RCAudioFutureSyncManager *)self ___fetchAudioFuturesWithCompletionBlock:v6];
  }
}

- (void)_validateCorrectStore:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_persistentStore)
  {
    id v6 = [v4 persistentStore];
    uint64_t v7 = [v6 identifier];
    id v8 = [(NSPersistentStore *)self->_persistentStore identifier];
    unsigned __int8 v9 = [v7 isEqual:v8];

    if ((v9 & 1) == 0)
    {
      char v10 = OSLogForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        sub_100023504(v10);
      }
    }
  }
}

- (void)_performOnSchedulerQueue:(id)a3
{
  id v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = sub_100007E48;
  v10[4] = sub_100012578;
  id v11 = (id)os_transaction_create();
  id v5 = [(RCBlockScheduler *)self->_scheduler queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100012EF0;
  v7[3] = &unk_100039190;
  id v8 = v4;
  unsigned __int8 v9 = v10;
  id v6 = v4;
  dispatch_async(v5, v7);

  _Block_object_dispose(v10, 8);
}

- (RCAudioFutureSyncManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RCAudioFutureSyncManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_mtAudioFutureDescription, 0);
  objc_storeStrong((id *)&self->_audioFutureDescription, 0);
  objc_storeStrong((id *)&self->_persistentStore, 0);
  objc_storeStrong((id *)&self->_audioFuturesToFetchBatches, 0);
}

@end