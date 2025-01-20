@interface BICWorkQueue
+ (BICWorkQueue)workQueueWithHighPriorityTargetQueue:(id)a3 backgroundTargetQueue:(id)a4 numConcurrentWorkItems:(unint64_t)a5;
- (BOOL)hasLargeBacklog;
- (BOOL)manualCompletion;
- (NSMutableSet)al_workItems;
- (NSMutableSet)al_workingOnItems;
- (NSString)identifier;
- (OS_dispatch_queue)highPriorityWorkQ;
- (OS_dispatch_queue)lowPriorityWorkQ;
- (OS_dispatch_queue)targetQ;
- (double)workItemTimeout;
- (id)_statsString;
- (id)description;
- (unint64_t)al_totalWorkItemsRun;
- (unint64_t)numConcurrentWorkItems;
- (void)_startNextWorkItem;
- (void)addWorkItemWithPriority:(id)a3 description:(id)a4 block:(id)a5;
- (void)setAl_totalWorkItemsRun:(unint64_t)a3;
- (void)setAl_workItems:(id)a3;
- (void)setAl_workingOnItems:(id)a3;
- (void)setHighPriorityWorkQ:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLowPriorityWorkQ:(id)a3;
- (void)setManualCompletion:(BOOL)a3;
- (void)setNumConcurrentWorkItems:(unint64_t)a3;
- (void)setTargetQ:(id)a3;
- (void)setWorkItemTimeout:(double)a3;
- (void)workComplete:(id)a3;
@end

@implementation BICWorkQueue

+ (BICWorkQueue)workQueueWithHighPriorityTargetQueue:(id)a3 backgroundTargetQueue:(id)a4 numConcurrentWorkItems:(unint64_t)a5
{
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init((Class)a1);
  [v10 setNumConcurrentWorkItems:a5];
  if (a5 <= 1) {
    v11 = 0;
  }
  else {
    v11 = &_dispatch_queue_attr_concurrent;
  }
  v12 = dispatch_queue_attr_make_with_autorelease_frequency(v11, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v13 = dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v14 = dispatch_queue_create_with_target_V2("com.apple.coverWorkQ_high", v13, v9);

  [v10 setHighPriorityWorkQ:v14];
  v15 = dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v16 = dispatch_queue_create_with_target_V2("com.apple.coverWorkQ_low", v15, v8);

  [v10 setLowPriorityWorkQ:v16];
  v17 = +[NSMutableSet set];
  [v10 setAl_workItems:v17];

  v18 = +[NSMutableSet set];
  [v10 setAl_workingOnItems:v18];

  [v10 setWorkItemTimeout:5.0];
  v10[2] = 0;

  return (BICWorkQueue *)v10;
}

- (BOOL)hasLargeBacklog
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  p_accessLock = &self->_accessLock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v6 = sub_80198;
  v7 = &unk_2C39F0;
  v8 = self;
  v9 = &v10;
  v3 = v5;
  os_unfair_lock_lock_with_options();
  v6((uint64_t)v3);
  os_unfair_lock_unlock(p_accessLock);

  LOBYTE(p_accessLock) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)p_accessLock;
}

- (void)addWorkItemWithPriority:(id)a3 description:(id)a4 block:(id)a5
{
  +[BICWorkItem workItemWithPriority:a3 description:a4 block:a5];
  uint64_t v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  uint64_t v12 = sub_8038C;
  char v13 = &unk_2C3AF8;
  dispatch_queue_t v14 = self;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v15 = v6;
  os_unfair_lock_lock_with_options();
  sub_8038C((uint64_t)&v10);
  os_unfair_lock_unlock(&self->_accessLock);
  v7 = BCImageCacheLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = [(BICWorkQueue *)self identifier];
    v9 = [(BICWorkQueue *)self _statsString];
    *(_DWORD *)buf = 138543874;
    id v17 = v6;
    __int16 v18 = 2112;
    v19 = v8;
    __int16 v20 = 2114;
    v21 = v9;
    _os_log_impl(&def_7D91C, v7, OS_LOG_TYPE_INFO, "BICWorkQueue: Adding %{public}@ to queue \"%@\". %{public}@", buf, 0x20u);
  }
  [(BICWorkQueue *)self _startNextWorkItem];
}

- (void)_startNextWorkItem
{
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = sub_80680;
  v24 = sub_80690;
  id v25 = 0;
  p_accessLock = &self->_accessLock;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  dispatch_queue_t v16 = sub_80698;
  id v17 = &unk_2C6758;
  __int16 v18 = self;
  v19 = &v20;
  v4 = v15;
  os_unfair_lock_lock_with_options();
  v16((uint64_t)v4);
  os_unfair_lock_unlock(p_accessLock);

  v5 = (void *)v21[5];
  if (v5)
  {
    if ((unint64_t)[v5 priority] < 5) {
      [(BICWorkQueue *)self lowPriorityWorkQ];
    }
    else {
    id v6 = [(BICWorkQueue *)self highPriorityWorkQ];
    }
    v7 = BCImageCacheLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = v21[5];
      v9 = [(BICWorkQueue *)self identifier];
      uint64_t v10 = [(BICWorkQueue *)self _statsString];
      *(_DWORD *)buf = 138543874;
      uint64_t v27 = v8;
      __int16 v28 = 2112;
      v29 = v9;
      __int16 v30 = 2114;
      v31 = v10;
      _os_log_impl(&def_7D91C, v7, OS_LOG_TYPE_INFO, "BICWorkQueue: Starting %{public}@ on queue \"%@\". %{public}@", buf, 0x20u);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_807BC;
    block[3] = &unk_2C3AD0;
    id v13 = v6;
    dispatch_queue_t v14 = &v20;
    block[4] = self;
    uint64_t v11 = v6;
    dispatch_async(v11, block);
  }
  _Block_object_dispose(&v20, 8);
}

- (void)workComplete:(id)a3
{
  uint64_t v17 = 0;
  __int16 v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  uint64_t v12 = sub_80E98;
  id v13 = &unk_2C3AD0;
  dispatch_queue_t v16 = &v17;
  dispatch_queue_t v14 = self;
  id v4 = a3;
  id v15 = v4;
  v5 = v11;
  os_unfair_lock_lock_with_options();
  v12((uint64_t)v5);
  os_unfair_lock_unlock(&self->_accessLock);

  if (*((unsigned char *)v18 + 24))
  {
    id v6 = BCImageCacheLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = [(BICWorkQueue *)self identifier];
      uint64_t v8 = [(BICWorkQueue *)self _statsString];
      *(_DWORD *)buf = 138543874;
      id v22 = v4;
      __int16 v23 = 2112;
      v24 = v7;
      __int16 v25 = 2114;
      v26 = v8;
      _os_log_impl(&def_7D91C, v6, OS_LOG_TYPE_INFO, "BICWorkQueue: Finished %{public}@ on queue \"%@\". %{public}@", buf, 0x20u);
    }
    [(BICWorkQueue *)self _startNextWorkItem];
  }
  else
  {
    v9 = BCImageCacheLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [(BICWorkQueue *)self identifier];
      *(_DWORD *)buf = 138543618;
      id v22 = v4;
      __int16 v23 = 2112;
      v24 = v10;
      _os_log_impl(&def_7D91C, v9, OS_LOG_TYPE_DEFAULT, "BICWorkQueue: Already timed-out %{public}@ now completed on queue \"%@\"", buf, 0x16u);
    }
  }

  _Block_object_dispose(&v17, 8);
}

- (id)_statsString
{
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  uint64_t v17 = 0;
  __int16 v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  uint64_t v13 = 0;
  dispatch_queue_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  p_accessLock = &self->_accessLock;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v7 = sub_810C0;
  uint64_t v8 = &unk_2C7090;
  v9 = self;
  uint64_t v10 = &v21;
  uint64_t v11 = &v17;
  uint64_t v12 = &v13;
  v3 = v6;
  os_unfair_lock_lock_with_options();
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_accessLock);

  id v4 = +[NSString stringWithFormat:@"Pending=%tu, WIP=%tu, Finished=%tu.", v22[3], v18[3], v14[3]];
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v4;
}

- (id)description
{
  v3 = [(BICWorkQueue *)self identifier];
  id v4 = [(BICWorkQueue *)self _statsString];
  v5 = +[NSString stringWithFormat:@"BICWorkQueue %@. %@", v3, v4];

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)manualCompletion
{
  return self->_manualCompletion;
}

- (void)setManualCompletion:(BOOL)a3
{
  self->_manualCompletion = a3;
}

- (double)workItemTimeout
{
  return self->_workItemTimeout;
}

- (void)setWorkItemTimeout:(double)a3
{
  self->_workItemTimeout = a3;
}

- (OS_dispatch_queue)targetQ
{
  return self->_targetQ;
}

- (void)setTargetQ:(id)a3
{
}

- (OS_dispatch_queue)highPriorityWorkQ
{
  return self->_highPriorityWorkQ;
}

- (void)setHighPriorityWorkQ:(id)a3
{
}

- (OS_dispatch_queue)lowPriorityWorkQ
{
  return self->_lowPriorityWorkQ;
}

- (void)setLowPriorityWorkQ:(id)a3
{
}

- (NSMutableSet)al_workItems
{
  return self->_al_workItems;
}

- (void)setAl_workItems:(id)a3
{
}

- (NSMutableSet)al_workingOnItems
{
  return self->_al_workingOnItems;
}

- (void)setAl_workingOnItems:(id)a3
{
}

- (unint64_t)numConcurrentWorkItems
{
  return self->_numConcurrentWorkItems;
}

- (void)setNumConcurrentWorkItems:(unint64_t)a3
{
  self->_numConcurrentWorkItems = a3;
}

- (unint64_t)al_totalWorkItemsRun
{
  return self->_al_totalWorkItemsRun;
}

- (void)setAl_totalWorkItemsRun:(unint64_t)a3
{
  self->_al_totalWorkItemsRun = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_al_workingOnItems, 0);
  objc_storeStrong((id *)&self->_al_workItems, 0);
  objc_storeStrong((id *)&self->_lowPriorityWorkQ, 0);
  objc_storeStrong((id *)&self->_highPriorityWorkQ, 0);
  objc_storeStrong((id *)&self->_targetQ, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end