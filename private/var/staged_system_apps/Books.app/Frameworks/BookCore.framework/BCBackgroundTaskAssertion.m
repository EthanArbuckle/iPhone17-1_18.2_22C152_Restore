@interface BCBackgroundTaskAssertion
+ (BCBackgroundTaskAssertion)sharedAssertion;
- (NSMutableArray)taskIDs;
- (NSMutableDictionary)identifiersByTaskID;
- (OS_dispatch_queue)queue;
- (id)_init;
- (void)_claimAssertionForIdentifier:(id)a3 description:(id)a4 signalBlock:(id)a5;
- (void)_releaseAssertionForIdentifier:(id)a3 signalBlock:(id)a4;
- (void)_releaseAssertionForTaskID:(unint64_t)a3;
- (void)claimAssertionForIdentifier:(id)a3 description:(id)a4;
- (void)dealloc;
- (void)dq_claimAssertionForIdentifier:(id)a3 description:(id)a4 signalBlock:(id)a5;
- (void)dq_releaseAssertionForIdentifier:(id)a3 signalBlock:(id)a4;
- (void)dq_releaseAssertionForTaskID:(unint64_t)a3;
- (void)releaseAssertionForIdentifier:(id)a3;
- (void)setIdentifiersByTaskID:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTaskIDs:(id)a3;
@end

@implementation BCBackgroundTaskAssertion

- (id)_init
{
  v11.receiver = self;
  v11.super_class = (Class)BCBackgroundTaskAssertion;
  v2 = [(BCBackgroundTaskAssertion *)&v11 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("BKLibraryIndexerAssetProgressAssertion.queue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = objc_opt_new();
    identifiersByTaskID = v2->_identifiersByTaskID;
    v2->_identifiersByTaskID = (NSMutableDictionary *)v6;

    uint64_t v8 = objc_opt_new();
    taskIDs = v2->_taskIDs;
    v2->_taskIDs = (NSMutableArray *)v8;
  }
  return v2;
}

- (void)dealloc
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_13CDC4;
  block[3] = &unk_2C3C50;
  block[4] = self;
  dispatch_sync(queue, block);
  v4.receiver = self;
  v4.super_class = (Class)BCBackgroundTaskAssertion;
  [(BCBackgroundTaskAssertion *)&v4 dealloc];
}

+ (BCBackgroundTaskAssertion)sharedAssertion
{
  if (qword_349358 != -1) {
    dispatch_once(&qword_349358, &stru_2C9CB8);
  }
  v2 = (void *)qword_349350;

  return (BCBackgroundTaskAssertion *)v2;
}

- (void)claimAssertionForIdentifier:(id)a3 description:(id)a4
{
}

- (void)releaseAssertionForIdentifier:(id)a3
{
}

- (void)_claimAssertionForIdentifier:(id)a3 description:(id)a4 signalBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 length])
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_13D188;
    block[3] = &unk_2C4650;
    objc_copyWeak(&v19, &location);
    id v16 = v8;
    id v17 = v9;
    id v18 = v10;
    dispatch_async(queue, block);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  else
  {
    v12 = BCIMLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1EEAB4(v12);
    }

    id v13 = objc_retainBlock(v10);
    v14 = v13;
    if (v13) {
      (*((void (**)(id))v13 + 2))(v13);
    }
  }
}

- (void)_releaseAssertionForIdentifier:(id)a3 signalBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_13D324;
    v12[3] = &unk_2C4DA8;
    objc_copyWeak(&v15, &location);
    id v13 = v6;
    id v14 = v7;
    dispatch_async(queue, v12);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    id v9 = BCIMLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1EEAF8(v9);
    }

    id v10 = objc_retainBlock(v7);
    objc_super v11 = v10;
    if (v10) {
      (*((void (**)(id))v10 + 2))(v10);
    }
  }
}

- (void)_releaseAssertionForTaskID:(unint64_t)a3
{
  if (UIBackgroundTaskInvalid != a3)
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_13D440;
    block[3] = &unk_2C4F58;
    objc_copyWeak(v7, &location);
    v7[1] = (id)a3;
    dispatch_async(queue, block);
    objc_destroyWeak(v7);
    objc_destroyWeak(&location);
  }
}

- (void)dq_claimAssertionForIdentifier:(id)a3 description:(id)a4 signalBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_super v11 = [(BCBackgroundTaskAssertion *)self queue];
  dispatch_assert_queue_V2(v11);

  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0;
  v12 = +[UIApplication jsa_sharedApplicationIfNotExtension];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_13D730;
  v23[3] = &unk_2C4720;
  id v13 = v8;
  id v24 = v13;
  v25 = self;
  v26 = &v27;
  id v14 = [v12 beginBackgroundTaskWithName:v9 expirationHandler:v23];

  v28[3] = (uint64_t)v14;
  id v15 = BCIMLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = v28[3];
    *(_DWORD *)buf = 134218498;
    uint64_t v32 = v16;
    __int16 v33 = 2112;
    id v34 = v13;
    __int16 v35 = 2112;
    id v36 = v9;
    _os_log_impl(&def_7D91C, v15, OS_LOG_TYPE_INFO, "Background task assertion %lu taken for identifier %@ and description %@", buf, 0x20u);
  }

  id v17 = [(BCBackgroundTaskAssertion *)self taskIDs];
  id v18 = +[NSNumber numberWithUnsignedInteger:v28[3]];
  [v17 addObject:v18];

  id v19 = [(BCBackgroundTaskAssertion *)self identifiersByTaskID];
  v20 = +[NSNumber numberWithUnsignedInteger:v28[3]];
  [v19 setObject:v13 forKeyedSubscript:v20];

  id v21 = objc_retainBlock(v10);
  v22 = v21;
  if (v21) {
    (*((void (**)(id))v21 + 2))(v21);
  }

  _Block_object_dispose(&v27, 8);
}

- (void)dq_releaseAssertionForTaskID:(unint64_t)a3
{
  v5 = [(BCBackgroundTaskAssertion *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = BCIMLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [(BCBackgroundTaskAssertion *)self identifiersByTaskID];
    id v8 = +[NSNumber numberWithUnsignedInteger:a3];
    id v9 = [v7 objectForKeyedSubscript:v8];
    int v15 = 134218242;
    unint64_t v16 = a3;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl(&def_7D91C, v6, OS_LOG_TYPE_INFO, "Releasing background task assertion %lu for identifier %@.", (uint8_t *)&v15, 0x16u);
  }
  id v10 = +[UIApplication jsa_sharedApplicationIfNotExtension];
  [v10 endBackgroundTask:a3];

  objc_super v11 = [(BCBackgroundTaskAssertion *)self taskIDs];
  v12 = +[NSNumber numberWithUnsignedInteger:a3];
  [v11 removeObject:v12];

  id v13 = [(BCBackgroundTaskAssertion *)self identifiersByTaskID];
  id v14 = +[NSNumber numberWithUnsignedInteger:a3];
  [v13 removeObjectForKey:v14];
}

- (void)dq_releaseAssertionForIdentifier:(id)a3 signalBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BCBackgroundTaskAssertion *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(BCBackgroundTaskAssertion *)self identifiersByTaskID];
  id v10 = [v9 allValues];
  unsigned int v11 = [v10 containsObject:v6];

  if (v11)
  {
    v12 = [(BCBackgroundTaskAssertion *)self taskIDs];
    id v13 = [v12 objectEnumerator];

    id v14 = [v13 nextObject];
    if (!v14) {
      goto LABEL_7;
    }
    while (1)
    {
      int v15 = [(BCBackgroundTaskAssertion *)self identifiersByTaskID];
      unint64_t v16 = [v15 objectForKeyedSubscript:v14];

      if ([v6 isEqualToString:v16]) {
        break;
      }

      uint64_t v17 = [v13 nextObject];

      id v14 = (void *)v17;
      if (!v17) {
        goto LABEL_7;
      }
    }
    id v18 = [v14 unsignedIntegerValue];

    if (v18 != (id)UIBackgroundTaskInvalid)
    {
      v22 = BCIMLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        int v27 = 134218242;
        id v28 = v18;
        __int16 v29 = 2112;
        id v30 = v6;
        _os_log_impl(&def_7D91C, v22, OS_LOG_TYPE_INFO, "Releasing background task assertion %lu for identifier %@.", (uint8_t *)&v27, 0x16u);
      }

      v23 = [(BCBackgroundTaskAssertion *)self identifiersByTaskID];
      id v24 = +[NSNumber numberWithUnsignedInteger:v18];
      [v23 removeObjectForKey:v24];

      v25 = [(BCBackgroundTaskAssertion *)self taskIDs];
      v26 = +[NSNumber numberWithUnsignedInteger:v18];
      [v25 removeObject:v26];

      id v19 = +[UIApplication jsa_sharedApplicationIfNotExtension];
      [v19 endBackgroundTask:v18];
    }
    else
    {
LABEL_7:
      id v19 = BCIMLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1EEBB8((uint64_t)v6, v19);
      }
    }
  }
  id v20 = objc_retainBlock(v7);
  id v21 = v20;
  if (v20) {
    (*((void (**)(id))v20 + 2))(v20);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableDictionary)identifiersByTaskID
{
  return self->_identifiersByTaskID;
}

- (void)setIdentifiersByTaskID:(id)a3
{
}

- (NSMutableArray)taskIDs
{
  return self->_taskIDs;
}

- (void)setTaskIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskIDs, 0);
  objc_storeStrong((id *)&self->_identifiersByTaskID, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end