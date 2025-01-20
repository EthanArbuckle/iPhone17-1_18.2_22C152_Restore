@interface TCCDAssumedIdentityMonitor
- (TCCDAssumedIdentityMonitor)initWithStateDirectoryPath:(id)a3;
- (id)_osStateDump;
- (id)_serializeState;
- (id)monitoredProcessesAssumingIdentityWithIdentifier:(id)a3;
- (void)_createOSStateHandler;
- (void)_loadState;
- (void)_saveState;
- (void)startMonitoringProcess:(id)a3 assumingIdentity:(id)a4;
- (void)stopMonitoringProcess:(id)a3;
@end

@implementation TCCDAssumedIdentityMonitor

- (TCCDAssumedIdentityMonitor)initWithStateDirectoryPath:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TCCDAssumedIdentityMonitor;
  v5 = [(TCCDAssumedIdentityMonitor *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 stringByAppendingPathComponent:@"AssumedIdentityMonitorState"];
    stateFilePath = v5->_stateFilePath;
    v5->_stateFilePath = (NSString *)v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.tcc.AssumedIdentityMonitor", v8);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v9;

    uint64_t v11 = objc_opt_new();
    assumedIdentityIdentifiersToProcesses = v5->_assumedIdentityIdentifiersToProcesses;
    v5->_assumedIdentityIdentifiersToProcesses = (NSMutableDictionary *)v11;

    [(TCCDAssumedIdentityMonitor *)v5 _loadState];
    [(TCCDAssumedIdentityMonitor *)v5 _createOSStateHandler];
  }

  return v5;
}

- (id)_serializeState
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v21 = self;
  v22 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obj = self->_assumedIdentityIdentifiersToProcesses;
  id v3 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v20 = *(void *)v30;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v30 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        v7 = objc_opt_new();
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        v8 = [(NSMutableDictionary *)v21->_assumedIdentityIdentifiersToProcesses objectForKeyedSubscript:v6];
        id v9 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v26;
          do
          {
            for (j = 0; j != v10; j = (char *)j + 1)
            {
              if (*(void *)v26 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = *(void **)(*((void *)&v25 + 1) + 8 * (void)j);
              memset(v24, 0, sizeof(v24));
              if (v13) {
                [v13 auditToken];
              }
              objc_super v14 = +[NSData dataWithBytes:v24 length:32];
              [v7 addObject:v14];
            }
            id v10 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }
          while (v10);
        }

        [v22 setObject:v7 forKeyedSubscript:v6];
      }
      id v4 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v4);
  }

  id v23 = 0;
  v15 = +[NSKeyedArchiver archivedDataWithRootObject:v22 requiringSecureCoding:1 error:&v23];
  id v16 = v23;
  if (v16)
  {
    v17 = tcc_assumed_identity_monitor_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10002DB8C();
    }
  }
  return v15;
}

- (void)_loadState
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002CA44;
  block[3] = &unk_100094E78;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)_saveState
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = [(TCCDAssumedIdentityMonitor *)self _serializeState];
  stateFilePath = self->_stateFilePath;
  id v8 = 0;
  unsigned __int8 v5 = [v3 writeToFile:stateFilePath options:1 error:&v8];
  id v6 = v8;
  if ((v5 & 1) == 0)
  {
    v7 = tcc_assumed_identity_monitor_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10002DE3C();
    }
  }
}

- (id)_osStateDump
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_10000F8E4;
  id v10 = sub_10000F884;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002D0E8;
  v5[3] = &unk_100095BC0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)_createOSStateHandler
{
  v2 = dispatch_get_global_queue(0, 0);
  os_state_add_handler();
}

- (void)startMonitoringProcess:(id)a3 assumingIdentity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend(v7, "client_type"))
  {
    uint64_t v8 = tcc_assumed_identity_monitor_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10002DF88();
    }
  }
  else
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002D5F0;
    block[3] = &unk_100094FB8;
    block[4] = self;
    id v11 = v7;
    id v12 = v6;
    dispatch_async((dispatch_queue_t)queue, block);
  }
}

- (void)stopMonitoringProcess:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002D788;
  v7[3] = &unk_100094FE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (id)monitoredProcessesAssumingIdentityWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_10000F8E4;
  id v16 = sub_10000F884;
  id v17 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002DAAC;
  block[3] = &unk_100094F68;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assumedIdentityIdentifiersToProcesses, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_stateFilePath, 0);
}

@end