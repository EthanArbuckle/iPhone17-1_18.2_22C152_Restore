@interface CKDaemon
+ (id)sharedDaemon;
- (CKDaemon)init;
- (NSMutableDictionary)cachedHandlers;
- (void)decreaseWeightForLinkWithLabel:(id)a3 betweenSubject:(id)a4 andObject:(id)a5 inStoreWithIdentifier:(id)a6 completionHandler:(id)a7;
- (void)disableSyncAndDeleteCloudDataWithCompletionHandler:(id)a3;
- (void)dropLinkWithLabel:(id)a3 betweenSubject:(id)a4 andObject:(id)a5 inStoreWithIdentifier:(id)a6 completionHandler:(id)a7;
- (void)dropLinksBetweenSubject:(id)a3 andObject:(id)a4 inStoreWithIdentifier:(id)a5 completionHandler:(id)a6;
- (void)dropLinksWithLabel:(id)a3 fromSubject:(id)a4 inStoreWithIdentifier:(id)a5 completionHandler:(id)a6;
- (void)increaseWeightForLinkWithLabel:(id)a3 betweenSubject:(id)a4 andObject:(id)a5 inStoreWithIdentifier:(id)a6 completionHandler:(id)a7;
- (void)keysAndValuesForKeysMatchingCondition:(id)a3 inStoreWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)keysAndValuesInStoreWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)keysInStoreWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)keysMatchingCondition:(id)a3 inStoreWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)recordEventWithIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 metadata:(id)a6 toStoreWithIdentifier:(id)a7 completionHandler:(id)a8;
- (void)removeAllValuesFromStoreWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)removeAllValuesFromSynchedStoreWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)removeValueForKey:(id)a3 fromStoreWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)removeValueForKey:(id)a3 fromSynchedStoreWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)removeValuesForKeys:(id)a3 fromStoreWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)removeValuesForKeys:(id)a3 fromSynchedStoreWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)removeValuesMatchingCondition:(id)a3 fromStoreWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)removeValuesMatchingCondition:(id)a3 fromSynchedStoreWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)saveKeysAndValues:(id)a3 toStoreWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)saveKeysAndValues:(id)a3 toSynchedStoreWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)setCachedHandlers:(id)a3;
- (void)setWeightForLinkWithLabel:(id)a3 betweenSubject:(id)a4 andObject:(id)a5 toValue:(int64_t)a6 inStoreWithIdentifier:(id)a7 completionHandler:(id)a8;
- (void)triplesComponentsMatching:(id)a3 inStoreWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)valueForKey:(id)a3 inStoreWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)valuesForKeys:(id)a3 inStoreWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)valuesForKeysMatchingCondition:(id)a3 inStoreWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)valuesInStoreWithIdentifier:(id)a3 completionHandler:(id)a4;
@end

@implementation CKDaemon

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedHandlers, 0);
  objc_storeStrong((id *)&self->_concurrentQueue, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

- (void)setCachedHandlers:(id)a3
{
}

- (NSMutableDictionary)cachedHandlers
{
  return self->_cachedHandlers;
}

- (void)disableSyncAndDeleteCloudDataWithCompletionHandler:(id)a3
{
  id v3 = a3;
  id v4 = +[CKNCloudKitManager sharedManager];
  [v4 disableSyncAndDeleteCloudDataWithCompletionHandler:v3];
}

- (void)dropLinksBetweenSubject:(id)a3 andObject:(id)a4 inStoreWithIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A7A4;
  block[3] = &unk_100018CF0;
  block[4] = self;
  id v20 = v12;
  id v21 = v10;
  id v22 = v11;
  id v23 = v13;
  id v15 = v13;
  id v16 = v11;
  id v17 = v10;
  id v18 = v12;
  dispatch_async((dispatch_queue_t)serialQueue, block);
}

- (void)dropLinksWithLabel:(id)a3 fromSubject:(id)a4 inStoreWithIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000AC5C;
  block[3] = &unk_100018CF0;
  block[4] = self;
  id v20 = v12;
  id v21 = v10;
  id v22 = v11;
  id v23 = v13;
  id v15 = v13;
  id v16 = v11;
  id v17 = v10;
  id v18 = v12;
  dispatch_async((dispatch_queue_t)serialQueue, block);
}

- (void)dropLinkWithLabel:(id)a3 betweenSubject:(id)a4 andObject:(id)a5 inStoreWithIdentifier:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  serialQueue = self->_serialQueue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10000AE2C;
  v23[3] = &unk_100018CC8;
  v23[4] = self;
  id v24 = v15;
  id v25 = v12;
  id v26 = v13;
  id v27 = v14;
  id v28 = v16;
  id v18 = v16;
  id v19 = v14;
  id v20 = v13;
  id v21 = v12;
  id v22 = v15;
  dispatch_async((dispatch_queue_t)serialQueue, v23);
}

- (void)decreaseWeightForLinkWithLabel:(id)a3 betweenSubject:(id)a4 andObject:(id)a5 inStoreWithIdentifier:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  serialQueue = self->_serialQueue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10000B000;
  v23[3] = &unk_100018CC8;
  v23[4] = self;
  id v24 = v15;
  id v25 = v12;
  id v26 = v13;
  id v27 = v14;
  id v28 = v16;
  id v18 = v16;
  id v19 = v14;
  id v20 = v13;
  id v21 = v12;
  id v22 = v15;
  dispatch_async((dispatch_queue_t)serialQueue, v23);
}

- (void)increaseWeightForLinkWithLabel:(id)a3 betweenSubject:(id)a4 andObject:(id)a5 inStoreWithIdentifier:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  serialQueue = self->_serialQueue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10000B2A4;
  v23[3] = &unk_100018CC8;
  v23[4] = self;
  id v24 = v15;
  id v25 = v12;
  id v26 = v13;
  id v27 = v14;
  id v28 = v16;
  id v18 = v16;
  id v19 = v14;
  id v20 = v13;
  id v21 = v12;
  id v22 = v15;
  dispatch_async((dispatch_queue_t)serialQueue, v23);
}

- (void)setWeightForLinkWithLabel:(id)a3 betweenSubject:(id)a4 andObject:(id)a5 toValue:(int64_t)a6 inStoreWithIdentifier:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B550;
  block[3] = &unk_100018CA0;
  block[4] = self;
  id v26 = v17;
  id v27 = v14;
  id v28 = v15;
  id v30 = v18;
  int64_t v31 = a6;
  id v29 = v16;
  id v20 = v18;
  id v21 = v16;
  id v22 = v15;
  id v23 = v14;
  id v24 = v17;
  dispatch_async((dispatch_queue_t)serialQueue, block);
}

- (void)removeAllValuesFromSynchedStoreWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v15 = "-[CKDaemon removeAllValuesFromSynchedStoreWithIdentifier:completionHandler:]";
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s Removing ALL values in synched store %@", buf, 0x16u);
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000B74C;
  v11[3] = &unk_100018C78;
  id v12 = v6;
  id v13 = v7;
  v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  [(CKDaemon *)self keysInStoreWithIdentifier:v9 completionHandler:v11];
}

- (void)removeAllValuesFromStoreWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B9E4;
  block[3] = &unk_100018B10;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)serialQueue, block);
}

- (void)removeValuesMatchingCondition:(id)a3 fromSynchedStoreWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    id v15 = v11;
    __int16 v16 = [v8 description];
    *(_DWORD *)buf = 136315650;
    id v22 = "-[CKDaemon removeValuesMatchingCondition:fromSynchedStoreWithIdentifier:completionHandler:]";
    __int16 v23 = 2112;
    id v24 = v16;
    __int16 v25 = 2112;
    id v26 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%s Removing values matching condition %@ in synched store %@", buf, 0x20u);
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000BD30;
  v17[3] = &unk_100018C00;
  v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  [(CKDaemon *)self keysInStoreWithIdentifier:v12 completionHandler:v17];
}

- (void)removeValuesMatchingCondition:(id)a3 fromStoreWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  serialQueue = self->_serialQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000C2F8;
  v15[3] = &unk_100018B38;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)serialQueue, v15);
}

- (void)removeValuesForKeys:(id)a3 fromSynchedStoreWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    id v20 = "-[CKDaemon removeValuesForKeys:fromSynchedStoreWithIdentifier:completionHandler:]";
    __int16 v21 = 2112;
    id v22 = v8;
    __int16 v23 = 2112;
    id v24 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s Removing values for keys %@ in synched store %@", buf, 0x20u);
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000C674;
  v15[3] = &unk_100018B88;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(CKDaemon *)self removeValuesForKeys:v14 fromStoreWithIdentifier:v13 completionHandler:v15];
}

- (void)removeValuesForKeys:(id)a3 fromStoreWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  serialQueue = self->_serialQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000C870;
  v15[3] = &unk_100018B38;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)serialQueue, v15);
}

- (void)removeValueForKey:(id)a3 fromSynchedStoreWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    id v20 = "-[CKDaemon removeValueForKey:fromSynchedStoreWithIdentifier:completionHandler:]";
    __int16 v21 = 2112;
    id v22 = v8;
    __int16 v23 = 2112;
    id v24 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s Removing value for key %@ in synched store %@", buf, 0x20u);
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000CBA0;
  v15[3] = &unk_100018B88;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(CKDaemon *)self removeValueForKey:v14 fromStoreWithIdentifier:v13 completionHandler:v15];
}

- (void)removeValueForKey:(id)a3 fromStoreWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  serialQueue = self->_serialQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000CDC8;
  v15[3] = &unk_100018B38;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)serialQueue, v15);
}

- (void)recordEventWithIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 metadata:(id)a6 toStoreWithIdentifier:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = (void (**)(id, void *))a8;
  if ([v15 compare:v16] == (id)1)
  {
    id v20 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v34 = "-[CKDaemon recordEventWithIdentifier:startDate:endDate:metadata:toStoreWithIdentifier:completionHandler:]";
      __int16 v35 = 2112;
      id v36 = v15;
      __int16 v37 = 2112;
      id v38 = v16;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s event startDate should NOT be greater than endDate. (startDate = %@, endDate = %@).", buf, 0x20u);
    }
    v31[0] = @"localizedDescription";
    v31[1] = @"storeIdentifier";
    v32[0] = @"Event startDate is greater than endDate";
    v32[1] = v14;
    __int16 v21 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:2];
    id v22 = +[NSError errorWithDomain:@"com.apple.siriknowledged" code:101 userInfo:v21];

    v19[2](v19, v22);
  }
  else
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10000D224;
    v23[3] = &unk_100018BB0;
    id v24 = v14;
    id v30 = v19;
    id v25 = v18;
    id v26 = v15;
    id v27 = v16;
    id v28 = v17;
    id v29 = self;
    [(CKDaemon *)self valueForKey:v24 inStoreWithIdentifier:v25 completionHandler:v23];

    id v22 = v24;
  }
}

- (void)saveKeysAndValues:(id)a3 toSynchedStoreWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    id v15 = v11;
    id v16 = [v8 allKeys];
    *(_DWORD *)buf = 136315650;
    id v22 = "-[CKDaemon saveKeysAndValues:toSynchedStoreWithIdentifier:completionHandler:]";
    __int16 v23 = 2112;
    id v24 = v16;
    __int16 v25 = 2112;
    id v26 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%s Setting all values for keys=[%@] in synched store %@", buf, 0x20u);
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000D600;
  v17[3] = &unk_100018B88;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(CKDaemon *)self saveKeysAndValues:v14 toStoreWithIdentifier:v13 completionHandler:v17];
}

- (void)saveKeysAndValues:(id)a3 toStoreWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  serialQueue = self->_serialQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000D7F4;
  v15[3] = &unk_100018B38;
  id v16 = v8;
  id v17 = v9;
  id v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)serialQueue, v15);
}

- (void)triplesComponentsMatching:(id)a3 inStoreWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  concurrentQueue = self->_concurrentQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000DB18;
  v15[3] = &unk_100018B38;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)concurrentQueue, v15);
}

- (void)keysAndValuesForKeysMatchingCondition:(id)a3 inStoreWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  concurrentQueue = self->_concurrentQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000DDF0;
  v15[3] = &unk_100018B38;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)concurrentQueue, v15);
}

- (void)keysAndValuesInStoreWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  concurrentQueue = self->_concurrentQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E0A8;
  block[3] = &unk_100018B10;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)concurrentQueue, block);
}

- (void)valuesForKeysMatchingCondition:(id)a3 inStoreWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  concurrentQueue = self->_concurrentQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000E33C;
  v15[3] = &unk_100018B38;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)concurrentQueue, v15);
}

- (void)valuesForKeys:(id)a3 inStoreWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = sub_10000E6B8;
  v24[4] = sub_10000E6C8;
  id v25 = &__NSArray0__struct;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = sub_10000E6B8;
  v22[4] = sub_10000E6C8;
  id v23 = 0;
  concurrentQueue = self->_concurrentQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000E6D0;
  v15[3] = &unk_100018B60;
  id v16 = v8;
  id v17 = self;
  id v20 = v22;
  __int16 v21 = v24;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)concurrentQueue, v15);

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);
}

- (void)valuesInStoreWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  concurrentQueue = self->_concurrentQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E96C;
  block[3] = &unk_100018B10;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)concurrentQueue, block);
}

- (void)valueForKey:(id)a3 inStoreWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  concurrentQueue = self->_concurrentQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000EC00;
  v15[3] = &unk_100018B38;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)concurrentQueue, v15);
}

- (void)keysMatchingCondition:(id)a3 inStoreWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  concurrentQueue = self->_concurrentQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000EF08;
  v15[3] = &unk_100018B38;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)concurrentQueue, v15);
}

- (void)keysInStoreWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  concurrentQueue = self->_concurrentQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F1C0;
  block[3] = &unk_100018B10;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)concurrentQueue, block);
}

- (CKDaemon)init
{
  v13.receiver = self;
  v13.super_class = (Class)CKDaemon;
  v2 = [(CKDaemon *)&v13 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("CKDaemon._serialQueue", v3);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v4;

    id v6 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v7 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_USER_INTERACTIVE, 0);

    dispatch_queue_t v8 = dispatch_queue_create("CKDaemon._concurrentQueue", v7);
    concurrentQueue = v2->_concurrentQueue;
    v2->_concurrentQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = +[NSMutableDictionary dictionaryWithCapacity:0];
    cachedHandlers = v2->_cachedHandlers;
    v2->_cachedHandlers = (NSMutableDictionary *)v10;
  }
  return v2;
}

+ (id)sharedDaemon
{
  if (qword_10001DEE8 != -1) {
    dispatch_once(&qword_10001DEE8, &stru_100018AE8);
  }
  v2 = (void *)qword_10001DEF0;

  return v2;
}

@end