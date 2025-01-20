@interface PSDSchedulerIDSObserver
- (PSDSchedulerIDSObserver)init;
- (id)aggdKeyForStatistics:(id)a3 channelName:(id)a4;
- (void)_diffWithStatistics:(id)a3;
- (void)_logAggdKey:(id)a3 value:(int64_t)a4;
- (void)_logStatistics:(id)a3 channelName:(id)a4;
- (void)_logStatisticsCollectionDiff:(id)a3;
- (void)_requestFinalStatisticsIfPossibleWithBlock:(id)a3;
- (void)scheduler:(id)a3 didClearSyncSession:(id)a4 withBlock:(id)a5;
- (void)scheduler:(id)a3 willStartSyncSession:(id)a4;
@end

@implementation PSDSchedulerIDSObserver

- (PSDSchedulerIDSObserver)init
{
  v6.receiver = self;
  v6.super_class = (Class)PSDSchedulerIDSObserver;
  v2 = [(PSDSchedulerIDSObserver *)&v6 init];
  if (v2)
  {
    uint64_t v3 = dispatch_get_global_queue(2, 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)scheduler:(id)a3 willStartSyncSession:(id)a4
{
  if (objc_msgSend(a4, "syncSessionType", a3))
  {
    v5 = dispatch_semaphore_create(0);
    objc_super v6 = dispatch_get_global_queue(17, 0);
    IDSLocalPairingReunionSyncStartedForServices();

    dispatch_time_t v7 = dispatch_time(0, 30000000000);
    dispatch_semaphore_wait(v5, v7);
    v8 = psd_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v9)
    {
      v10 = psd_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "IDSLocalPairingReunionSyncStartedForServices", buf, 2u);
      }
    }
  }
  else
  {
    IDSInitialLocalSyncStartedForServices();
    v11 = psd_log();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

    if (v12)
    {
      v13 = psd_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "IDSInitialLocalSyncStartedForServices", buf, 2u);
      }
    }
    v14 = psd_log();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

    if (v15)
    {
      v16 = psd_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Requesting IDS stats for sync start", buf, 2u);
      }
    }
    IDSGetDeliveryStatsWithCompletionBlock();
  }
  self->_syncComplete = 0;
}

- (void)scheduler:(id)a3 didClearSyncSession:(id)a4 withBlock:(id)a5
{
  dispatch_time_t v7 = (void (**)(void))a5;
  if ([a4 syncSessionType])
  {
    v8 = dispatch_semaphore_create(0);
    BOOL v9 = dispatch_get_global_queue(17, 0);
    IDSLocalPairingReunionSyncCompletedForServices();

    dispatch_time_t v10 = dispatch_time(0, 30000000000);
    dispatch_semaphore_wait(v8, v10);
    v11 = psd_log();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

    if (v12)
    {
      v13 = psd_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "IDSLocalPairingReunionSyncCompletedForServices", buf, 2u);
      }
    }
    self->_syncComplete = 1;
    if (v7) {
      v7[2](v7);
    }
  }
  else
  {
    self->_syncComplete = 1;
    IDSInitialLocalSyncCompletedForServices();
    v14 = psd_log();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

    if (v15)
    {
      v16 = psd_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "IDSInitialLocalSyncCompletedForServices", buf, 2u);
      }
    }
    [(PSDSchedulerIDSObserver *)self _requestFinalStatisticsIfPossibleWithBlock:v7];
  }
}

- (void)_requestFinalStatisticsIfPossibleWithBlock:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100003218;
  v7[3] = &unk_10002C6D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)_diffWithStatistics:(id)a3
{
  id v4 = a3;
  if (self->_startingStatistics)
  {
    +[PSDIDSServiceStatisticsCollection knownChannelNames];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v18;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          dispatch_time_t v10 = [(NSDictionary *)self->_startingStatistics objectForKeyedSubscript:v9];
          v11 = +[PSDIDSServiceStatisticsCollection statisticsCollectionWithChannelName:v9 statisticsDictionary:v10];

          BOOL v12 = [v4 objectForKeyedSubscript:v9];
          v13 = +[PSDIDSServiceStatisticsCollection statisticsCollectionWithChannelName:v9 statisticsDictionary:v12];

          v14 = [v13 statisticsCollectionByDiffingStatisticsCollection:v11];
          [(PSDSchedulerIDSObserver *)self _logStatisticsCollectionDiff:v14];
        }
        id v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v6);
    }
    startingStatistics = self->_startingStatistics;
    self->_startingStatistics = 0;
  }
}

- (void)_logStatisticsCollectionDiff:(id)a3
{
  id v4 = a3;
  id v5 = psd_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    uint64_t v7 = psd_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Log statistics %@", buf, 0xCu);
    }
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100003718;
  v9[3] = &unk_10002C6F8;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v8 enumerateServiceStatisticsWithBlock:v9];
}

- (void)_logStatistics:(id)a3 channelName:(id)a4
{
  id v6 = a3;
  id v10 = [(PSDSchedulerIDSObserver *)self aggdKeyForStatistics:v6 channelName:a4];
  uint64_t v7 = [v10 stringByAppendingString:@".deliveredBytes"];
  -[PSDSchedulerIDSObserver _logAggdKey:value:](self, "_logAggdKey:value:", v7, [v6 deliveredBytes]);
  id v8 = [v10 stringByAppendingString:@".deliveredMessagesCount"];
  id v9 = [v6 deliveredMessageCount];

  [(PSDSchedulerIDSObserver *)self _logAggdKey:v8 value:v9];
}

- (id)aggdKeyForStatistics:(id)a3 channelName:(id)a4
{
  id v5 = a4;
  id v6 = [a3 serviceName];
  uint64_t v7 = +[NSString stringWithFormat:@"pairedsync.%@.%@", v5, v6];

  return v7;
}

- (void)_logAggdKey:(id)a3 value:(int64_t)a4
{
  id v5 = a3;
  ADClientClearScalarKey();
  ADClientAddValueForScalarKey();
  id v6 = psd_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    id v8 = psd_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543618;
      id v10 = v5;
      __int16 v11 = 2048;
      int64_t v12 = a4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "ADClientAddValueForScalarKey(%{public}@, %lld)", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startingStatistics, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end