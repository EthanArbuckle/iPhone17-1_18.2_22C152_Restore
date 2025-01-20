@interface FMFFenceManager
- (FMFFenceManager)init;
- (FMFFenceManagerDelegate)delegate;
- (FMFFenceTriggerManager)triggerManager;
- (NSSet)allFences;
- (NSSet)allFencesWithoutCKData;
- (id)fenceWithID:(id)a3;
- (id)fencesForHandles:(id)a3;
- (id)pendingFenceWithCKRecordName:(id)a3;
- (id)recurringAndScheduledFencesForHandles:(id)a3;
- (id)triggerForRepeatedFenceBeforeAcceptanceWithFence:(id)a3;
- (void)addFences:(id)a3;
- (void)clearStaleFenceTriggerForFence:(id)a3;
- (void)clearStaleStatusForRemovedFenceID:(id)a3;
- (void)getFenceWithCKRecordName:(id)a3 timeout:(double)a4 block:(id)a5;
- (void)getFenceWithID:(id)a3 timeout:(double)a4 block:(id)a5;
- (void)informParticipantOfRemovedFenceWithID:(id)a3 ckRecordID:(id)a4;
- (void)muteFences:(id)a3 withEndDate:(id)a4 completion:(id)a5;
- (void)receiveTriggerWithUUID:(id)a3 forFenceWithID:(id)a4 withStatus:(id)a5 atDate:(id)a6 triggerLocation:(id)a7;
- (void)removeFences:(id)a3;
- (void)reset;
- (void)setAllFences:(id)a3;
- (void)setAllFencesWithoutCKData:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFences:(id)a3;
- (void)setFencesWithoutCKData:(id)a3;
- (void)triggerAfterAcceptanceWithUUID:(id)a3 forFencewithID:(id)a4 withStatus:(id)a5 withAcceptanceStatus:(id)a6 atDate:(id)a7 triggerLocation:(id)a8 clientSession:(id)a9 completion:(id)a10;
- (void)triggerManager:(id)a3 didModifyFence:(id)a4 clientSession:(id)a5 withCompletion:(id)a6;
- (void)triggerManager:(id)a3 didModifyFence:(id)a4 withCompletion:(id)a5;
- (void)triggerWithUUID:(id)a3 forFenceWithID:(id)a4 withStatus:(id)a5 atDate:(id)a6 triggerLocation:(id)a7 clientSession:(id)a8 completion:(id)a9;
@end

@implementation FMFFenceManager

- (NSSet)allFences
{
  return self->_allFences;
}

- (FMFFenceManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)FMFFenceManager;
  v2 = [(FMFFenceManager *)&v9 init];
  v3 = v2;
  if (v2)
  {
    [(FMFFenceManager *)v2 reset];
    v4 = [[FMFFenceTriggerManager alloc] initWithDelegate:v3];
    triggerManager = v3->_triggerManager;
    v3->_triggerManager = v4;

    v6 = [(FMFFenceManager *)v3 fences];
    v7 = [v6 allObjects];
    [(FMFFenceTriggerManager *)v3->_triggerManager setFences:v7];
  }
  return v3;
}

- (void)setFences:(id)a3
{
  id v4 = a3;
  int v5 = _os_feature_enabled_impl();
  v6 = sub_100005560();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315138;
      v11 = "-[FMFFenceManager setFences:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s: Fences_Migration is enabled - returning", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315394;
      v11 = "-[FMFFenceManager setFences:]";
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v10, 0x16u);
    }

    [(FMFFenceManager *)self setAllFences:v4];
    v8 = [v4 allObjects];
    objc_super v9 = [(FMFFenceManager *)self triggerManager];
    [v9 setFences:v8];

    v7 = +[NSNotificationCenter defaultCenter];
    [v7 postNotificationName:@"FMFFenceManagerFencesDidChangeNotification" object:0];
  }
}

- (void)setFencesWithoutCKData:(id)a3
{
  id v4 = a3;
  int v5 = _os_feature_enabled_impl();
  v6 = sub_100005560();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      objc_super v9 = "-[FMFFenceManager setFencesWithoutCKData:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s: Fences_Migration is enabled - returning", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315394;
      objc_super v9 = "-[FMFFenceManager setFencesWithoutCKData:]";
      __int16 v10 = 2112;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v8, 0x16u);
    }

    [(FMFFenceManager *)self setAllFencesWithoutCKData:v4];
    v7 = +[NSNotificationCenter defaultCenter];
    [v7 postNotificationName:@"FMFFenceManagerFencesDidChangeNotification" object:0];
  }
}

- (void)reset
{
  id v3 = +[NSSet set];
  [(FMFFenceManager *)self setAllFences:v3];
}

- (id)fencesForHandles:(id)a3
{
  id v4 = a3;
  id v22 = (id)objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [(FMFFenceManager *)self allFences];
  id v5 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v24;
    int v8 = NSFileManager_ptr;
    do
    {
      objc_super v9 = 0;
      id v20 = v6;
      do
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(obj);
        }
        __int16 v10 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v9);
        id v11 = v8[23];
        __int16 v12 = [v10 recipients];
        id v13 = [v11 setWithArray:v12];
        if ([v4 intersectsSet:v13])
        {
        }
        else
        {
          uint64_t v14 = v7;
          v15 = v8;
          v16 = [v10 friendIdentifier];
          v17 = +[FMFHandle handleWithId:v16];
          unsigned int v18 = [v4 containsObject:v17];

          int v8 = v15;
          uint64_t v7 = v14;
          id v6 = v20;

          if (!v18) {
            goto LABEL_10;
          }
        }
        [v22 addObject:v10];
LABEL_10:
        objc_super v9 = (char *)v9 + 1;
      }
      while (v6 != v9);
      id v6 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v6);
  }

  return v22;
}

- (id)recurringAndScheduledFencesForHandles:(id)a3
{
  id v4 = a3;
  id v24 = (id)objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = [(FMFFenceManager *)self allFences];
  id v5 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v27;
    uint64_t v25 = FMFFenceTriggerScheduled;
    int v8 = NSFileManager_ptr;
    do
    {
      objc_super v9 = 0;
      id v22 = v6;
      do
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(obj);
        }
        __int16 v10 = *(void **)(*((void *)&v26 + 1) + 8 * (void)v9);
        id v11 = v8[23];
        __int16 v12 = [v10 recipients:v22];
        id v13 = [v11 setWithArray:v12];
        if ([v4 intersectsSet:v13])
        {
        }
        else
        {
          uint64_t v14 = v7;
          v15 = v8;
          v16 = [v10 friendIdentifier];
          v17 = +[FMFHandle handleWithId:v16];
          unsigned int v18 = [v4 containsObject:v17];

          int v8 = v15;
          uint64_t v7 = v14;
          id v6 = v22;

          if (!v18) {
            goto LABEL_13;
          }
        }
        v19 = [v10 trigger];
        if ([v19 isEqualToString:v25])
        {
        }
        else
        {
          unsigned __int8 v20 = [v10 isRecurring];

          if ((v20 & 1) == 0) {
            goto LABEL_13;
          }
        }
        [v24 addObject:v10];
LABEL_13:
        objc_super v9 = (char *)v9 + 1;
      }
      while (v6 != v9);
      id v6 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v6);
  }

  return v24;
}

- (id)fenceWithID:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFFenceManager *)self fences];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000390D4;
  v9[3] = &unk_1000A2970;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = [v5 fm_firstObjectPassingTest:v9];

  return v7;
}

- (id)pendingFenceWithCKRecordName:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFFenceManager *)self allFences];
  id v6 = [(FMFFenceManager *)self allFencesWithoutCKData];
  uint64_t v7 = [v5 setByAddingObjectsFromSet:v6];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100039264;
  v11[3] = &unk_1000A2970;
  id v12 = v4;
  id v8 = v4;
  objc_super v9 = objc_msgSend(v7, "fm_firstObjectPassingTest:", v11);

  return v9;
}

- (void)getFenceWithID:(id)a3 timeout:(double)a4 block:(id)a5
{
  id v8 = a3;
  objc_super v9 = (void (**)(id, void *, void))a5;
  id v10 = [(FMFFenceManager *)self fenceWithID:v8];
  if (v10)
  {
    v9[2](v9, v10, 0);
  }
  else
  {
    id v11 = +[NSNotificationCenter defaultCenter];
    objc_initWeak(&location, v11);

    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x3032000000;
    v32 = sub_100007638;
    v33 = sub_1000075E0;
    id v34 = 0;
    id v12 = objc_loadWeakRetained(&location);
    id v13 = +[NSOperationQueue mainQueue];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100039678;
    v24[3] = &unk_1000A2998;
    v24[4] = self;
    id v25 = v8;
    objc_copyWeak(&v28, &location);
    long long v27 = &v29;
    uint64_t v14 = v9;
    id v26 = v14;
    uint64_t v15 = [v12 addObserverForName:@"FMFFenceManagerFencesDidChangeNotification" object:0 queue:v13 usingBlock:v24];
    v16 = (void *)v30[5];
    v30[5] = v15;

    v17 = sub_100005560();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = v30[5];
      *(_DWORD *)buf = 136315394;
      v37 = "-[FMFFenceManager getFenceWithID:timeout:block:]";
      __int16 v38 = 2112;
      uint64_t v39 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s: listening for fence changes: %@", buf, 0x16u);
    }

    dispatch_time_t v19 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000397A0;
    block[3] = &unk_1000A29C0;
    id v22 = &v29;
    objc_copyWeak(&v23, &location);
    v21 = v14;
    dispatch_after(v19, (dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&v23);
    _Block_object_dispose(&v29, 8);

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
}

- (void)getFenceWithCKRecordName:(id)a3 timeout:(double)a4 block:(id)a5
{
  id v8 = a3;
  objc_super v9 = (void (**)(id, void *, void))a5;
  id v10 = [(FMFFenceManager *)self pendingFenceWithCKRecordName:v8];
  if (v10)
  {
    v9[2](v9, v10, 0);
  }
  else
  {
    id v11 = +[NSNotificationCenter defaultCenter];
    objc_initWeak(&location, v11);

    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x3032000000;
    v32 = sub_100007638;
    v33 = sub_1000075E0;
    id v34 = 0;
    id v12 = objc_loadWeakRetained(&location);
    id v13 = +[NSOperationQueue mainQueue];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100039BF4;
    v24[3] = &unk_1000A2998;
    v24[4] = self;
    id v25 = v8;
    objc_copyWeak(&v28, &location);
    long long v27 = &v29;
    uint64_t v14 = v9;
    id v26 = v14;
    uint64_t v15 = [v12 addObserverForName:@"FMFFenceManagerFencesDidChangeNotification" object:0 queue:v13 usingBlock:v24];
    v16 = (void *)v30[5];
    v30[5] = v15;

    v17 = sub_100005560();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = v30[5];
      *(_DWORD *)buf = 136315394;
      v37 = "-[FMFFenceManager getFenceWithCKRecordName:timeout:block:]";
      __int16 v38 = 2112;
      uint64_t v39 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s: listening for fence changes: %@", buf, 0x16u);
    }

    dispatch_time_t v19 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100039D1C;
    block[3] = &unk_1000A29C0;
    id v22 = &v29;
    objc_copyWeak(&v23, &location);
    v21 = v14;
    dispatch_after(v19, (dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&v23);
    _Block_object_dispose(&v29, 8);

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
}

- (void)removeFences:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFFenceManager *)self allFences];
  id v6 = [v5 mutableCopy];

  [v6 minusSet:v4];
  [(FMFFenceManager *)self setFences:v6];
}

- (void)addFences:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFFenceManager *)self allFences];
  id v6 = [v5 mutableCopy];

  [v6 minusSet:v4];
  [v6 unionSet:v4];

  [(FMFFenceManager *)self setFences:v6];
}

- (void)informParticipantOfRemovedFenceWithID:(id)a3 ckRecordID:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100039FC8;
  v8[3] = &unk_1000A29E8;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  [(FMFFenceManager *)self getFenceWithID:v7 timeout:v8 block:15.0];
}

- (void)clearStaleStatusForRemovedFenceID:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFFenceManager *)self triggerManager];
  [v5 clearStaleFenceStatusForFenceID:v4];
}

- (void)muteFences:(id)a3 withEndDate:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void))a5;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v13);
        if (v14) {
          [v14 updateFenceMuteEndDate:v8];
        }
        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
  v9[2](v9, 0);
}

- (void)triggerWithUUID:(id)a3 forFenceWithID:(id)a4 withStatus:(id)a5 atDate:(id)a6 triggerLocation:(id)a7 clientSession:(id)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10003A3EC;
  v24[3] = &unk_1000A2A10;
  v24[4] = self;
  id v25 = v15;
  id v26 = a5;
  id v27 = a6;
  id v28 = a7;
  id v29 = a8;
  id v30 = v16;
  id v31 = a9;
  id v17 = v16;
  id v18 = v31;
  id v19 = v29;
  id v20 = v28;
  id v21 = v27;
  id v22 = v15;
  id v23 = a5;
  [(FMFFenceManager *)self getFenceWithID:v17 timeout:v24 block:15.0];
}

- (void)receiveTriggerWithUUID:(id)a3 forFenceWithID:(id)a4 withStatus:(id)a5 atDate:(id)a6 triggerLocation:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10003A6F8;
    v17[3] = &unk_1000A2A58;
    v17[4] = self;
    id v18 = v12;
    id v19 = v14;
    id v20 = v15;
    id v21 = v16;
    id v22 = v13;
    [(FMFFenceManager *)self getFenceWithID:v22 timeout:v17 block:15.0];
  }
}

- (void)triggerAfterAcceptanceWithUUID:(id)a3 forFencewithID:(id)a4 withStatus:(id)a5 withAcceptanceStatus:(id)a6 atDate:(id)a7 triggerLocation:(id)a8 clientSession:(id)a9 completion:(id)a10
{
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10003A95C;
  v21[3] = &unk_1000A2A80;
  id v22 = a6;
  id v23 = self;
  id v24 = a3;
  id v25 = a5;
  id v26 = a7;
  id v27 = a8;
  id v28 = a9;
  id v29 = a10;
  id v13 = v29;
  id v14 = v28;
  id v15 = v27;
  id v16 = v26;
  id v17 = v24;
  id v18 = v22;
  id v19 = a5;
  [(FMFFenceManager *)v23 getFenceWithID:a4 timeout:v21 block:15.0];
}

- (id)triggerForRepeatedFenceBeforeAcceptanceWithFence:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFFenceManager *)self triggerManager];
  id v6 = [v5 triggerForRepeatedFenceBeforeAcceptanceWithFence:v4];

  return v6;
}

- (void)clearStaleFenceTriggerForFence:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFFenceManager *)self triggerManager];
  [v5 clearStaleFenceTriggerForFence:v4];
}

- (void)triggerManager:(id)a3 didModifyFence:(id)a4 clientSession:(id)a5 withCompletion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = [(FMFFenceManager *)self delegate];
  [v12 fenceManager:self didModifyFence:v11 clientSession:v10 withCompletion:v9];
}

- (void)triggerManager:(id)a3 didModifyFence:(id)a4 withCompletion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(FMFFenceManager *)self delegate];
  [v9 fenceManager:self didModifyFence:v8 withCompletion:v7];
}

- (FMFFenceManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FMFFenceManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (FMFFenceTriggerManager)triggerManager
{
  return self->_triggerManager;
}

- (void)setAllFences:(id)a3
{
}

- (NSSet)allFencesWithoutCKData
{
  return self->_allFencesWithoutCKData;
}

- (void)setAllFencesWithoutCKData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allFencesWithoutCKData, 0);
  objc_storeStrong((id *)&self->_allFences, 0);
  objc_storeStrong((id *)&self->_triggerManager, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end