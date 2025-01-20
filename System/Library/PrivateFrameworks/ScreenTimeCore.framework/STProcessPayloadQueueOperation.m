@interface STProcessPayloadQueueOperation
- (id)_dequeuePayloadsFromPayloads:(id)a3 fromUser:(id)a4 inContext:(id)a5;
- (void)_endWithoutSaving;
- (void)_processPayloadQueue;
- (void)main;
@end

@implementation STProcessPayloadQueueOperation

- (void)main
{
  os_activity_t v3 = _os_activity_create((void *)&_mh_execute_header, "STProcessPayloadQueueOperation start", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  [(STOperation *)self setActivity:v3];

  v4 = [(STOperation *)self activity];
  os_activity_scope_enter(v4, &v6);

  v5 = +[STLog payloadQueue];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10026366C(v5);
  }

  [(STProcessPayloadQueueOperation *)self _processPayloadQueue];
  os_activity_scope_leave(&v6);
}

- (void)_endWithoutSaving
{
  os_activity_t v3 = +[STLog payloadQueue];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 136446210;
    v5 = "-[STProcessPayloadQueueOperation _endWithoutSaving]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%{public}s: \nNo processing to be done", (uint8_t *)&v4, 0xCu);
  }

  [(STProcessPayloadQueueOperation *)self endOperationWithResultObject:0];
}

- (void)_processPayloadQueue
{
  os_activity_t v3 = [(STPersistenceOperation *)self persistenceController];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10005BBB8;
  v4[3] = &unk_1002FC4B0;
  v4[4] = self;
  [v3 performBackgroundTask:v4];
}

- (id)_dequeuePayloadsFromPayloads:(id)a3 fromUser:(id)a4 inContext:(id)a5
{
  id v7 = a3;
  id v26 = a4;
  id v8 = a5;
  id v25 = (id)objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v7;
  id v9 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v29;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v28 + 1) + 8 * (void)v12);
        uint64_t v14 = objc_opt_class();
        v15 = [v13 payloadData];
        id v27 = 0;
        v16 = +[NSKeyedUnarchiver unarchivedObjectOfClass:v14 fromData:v15 error:&v27];
        id v17 = v27;

        if (v16)
        {
          v18 = [v26 appleID];
          v19 = [v16 userInfo];
          [v19 setObject:v18 forKeyedSubscript:@"FromID"];

          v20 = [v13 identifier];
          [v16 setUUID:v20];

          v21 = [v13 destinations];
          [v16 setDestinations:v21];

          [v25 addObject:v16];
          v22 = +[STLog payloadQueue];
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138477827;
            v33 = v13;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Deleting dequeued payload: %{private}@", buf, 0xCu);
          }
        }
        else
        {
          v22 = +[STLog payloadQueue];
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v33 = v13;
            __int16 v34 = 2114;
            id v35 = v17;
            _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Failed to prepare next payload (%{public}@): %{public}@\nSkipping...", buf, 0x16u);
          }
        }

        [v8 deleteObject:v13];
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v10);
  }

  return v25;
}

@end