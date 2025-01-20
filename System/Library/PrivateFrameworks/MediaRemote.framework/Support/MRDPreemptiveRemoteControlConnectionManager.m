@interface MRDPreemptiveRemoteControlConnectionManager
+ (id)sharedManager;
- (MRAVEndpoint)groupLeader;
- (MRAVEndpoint)preferredClusterLeader;
- (NSHashTable)observers;
- (NSOperationQueue)clusterLeaderOperations;
- (NSOperationQueue)groupLeaderOperations;
- (NSString)debugDescription;
- (NSString)previousClusterLeaderID;
- (NSString)previousGroupID;
- (OS_dispatch_queue)queue;
- (id)_init;
- (void)_clearPendingClusterLeaderOperations;
- (void)_clearPendingGroupLeaderOperations;
- (void)_reevaluateClusterLeaderConnectionWithDeviceInfo:(id)a3;
- (void)_reevaluateGroupLeaderConnectionWithDeviceInfo:(id)a3;
- (void)_reevaluateWithReason:(id)a3;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setClusterLeaderOperations:(id)a3;
- (void)setGroupLeader:(id)a3;
- (void)setGroupLeaderOperations:(id)a3;
- (void)setObservers:(id)a3;
- (void)setPreferredClusterLeader:(id)a3;
- (void)setPreviousClusterLeaderID:(id)a3;
- (void)setPreviousGroupID:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation MRDPreemptiveRemoteControlConnectionManager

- (id)_init
{
  v16.receiver = self;
  v16.super_class = (Class)MRDPreemptiveRemoteControlConnectionManager;
  v2 = [(MRDPreemptiveRemoteControlConnectionManager *)&v16 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.MediaRemote.MRDPreemptiveRemoteControlConnectionManager", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = +[NSNotificationCenter defaultCenter];
    uint64_t v7 = kMRDeviceInfoDidChangeNotification;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100162F4C;
    v14[3] = &unk_100418568;
    v8 = v2;
    v15 = v8;
    id v9 = [v6 addObserverForName:v7 object:0 queue:0 usingBlock:v14];

    v10 = [(MRDPreemptiveRemoteControlConnectionManager *)v8 queue];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100163064;
    v12[3] = &unk_100415CC8;
    v13 = v8;
    sub_10016A738(v10, v12);
  }
  return v2;
}

+ (id)sharedManager
{
  if (qword_10047E4B0 != -1) {
    dispatch_once(&qword_10047E4B0, &stru_10041F2F8);
  }
  v2 = (void *)qword_10047E4A8;

  return v2;
}

- (NSString)debugDescription
{
  id v3 = [objc_alloc((Class)NSMutableString) initWithFormat:@"<%@:%p {\n", objc_opt_class(), self];
  dispatch_queue_t v4 = [(MRDPreemptiveRemoteControlConnectionManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100163208;
  block[3] = &unk_1004158D8;
  block[4] = self;
  id v5 = v3;
  id v10 = v5;
  dispatch_sync(v4, block);

  [v5 appendString:@"}>"];
  v6 = v10;
  id v7 = v5;

  return (NSString *)v7;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(MRDPreemptiveRemoteControlConnectionManager *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001633C4;
  v7[3] = &unk_1004158D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(MRDPreemptiveRemoteControlConnectionManager *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100163508;
  v7[3] = &unk_1004158D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)setPreviousGroupID:(id)a3
{
  id v5 = (NSString *)a3;
  id v6 = [(MRDPreemptiveRemoteControlConnectionManager *)self queue];
  dispatch_assert_queue_V2(v6);

  previousGroupID = self->_previousGroupID;
  p_previousGroupID = (id *)&self->_previousGroupID;
  id v9 = previousGroupID;
  if (v9 == v5)
  {
  }
  else
  {
    id v10 = v9;
    unsigned __int8 v11 = [(NSString *)v9 isEqual:v5];

    if ((v11 & 1) == 0)
    {
      id v12 = *p_previousGroupID;
      v13 = _MRLogForCategory();
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        if (v14)
        {
          v15 = (NSString *)*p_previousGroupID;
          int v19 = 138544130;
          CFStringRef v20 = @"PreemptiveRemoteControlConnectionManager";
          __int16 v21 = 2114;
          CFStringRef v22 = @"previousGroupID";
          __int16 v23 = 2112;
          v24 = v15;
          __int16 v25 = 2112;
          v26 = v5;
          objc_super v16 = "Set: %{public}@ setting %{public}@ from <%@> to <%@>";
          v17 = v13;
          uint32_t v18 = 42;
LABEL_9:
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v19, v18);
        }
      }
      else if (v14)
      {
        int v19 = 138543874;
        CFStringRef v20 = @"PreemptiveRemoteControlConnectionManager";
        __int16 v21 = 2114;
        CFStringRef v22 = @"previousGroupID";
        __int16 v23 = 2112;
        v24 = v5;
        objc_super v16 = "Set: %{public}@ setting %{public}@ to <%@>";
        v17 = v13;
        uint32_t v18 = 32;
        goto LABEL_9;
      }

      objc_storeStrong(p_previousGroupID, a3);
    }
  }
}

- (void)setGroupLeader:(id)a3
{
  id v5 = (MRAVEndpoint *)a3;
  id v6 = [(MRDPreemptiveRemoteControlConnectionManager *)self queue];
  dispatch_assert_queue_V2(v6);

  p_groupLeader = &self->_groupLeader;
  id v8 = self->_groupLeader;
  if (v8 == v5)
  {

    goto LABEL_12;
  }
  id v9 = v8;
  unsigned __int8 v10 = [(MRAVEndpoint *)v8 isEqual:v5];

  if ((v10 & 1) == 0)
  {
    unsigned __int8 v11 = [(MRAVEndpoint *)*p_groupLeader debugName];

    id v12 = _MRLogForCategory();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (!v13) {
        goto LABEL_10;
      }
      BOOL v14 = [(MRAVEndpoint *)*p_groupLeader debugName];
      v15 = [(MRAVEndpoint *)v5 debugName];
      *(_DWORD *)buf = 138544130;
      CFStringRef v22 = @"PreemptiveRemoteControlConnectionManager";
      __int16 v23 = 2114;
      CFStringRef v24 = @"groupLeader";
      __int16 v25 = 2112;
      v26 = v14;
      __int16 v27 = 2112;
      v28 = v15;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Set: %{public}@ setting %{public}@ from <%@> to <%@>", buf, 0x2Au);
    }
    else
    {
      if (!v13) {
        goto LABEL_10;
      }
      BOOL v14 = [(MRAVEndpoint *)v5 debugName];
      *(_DWORD *)buf = 138543874;
      CFStringRef v22 = @"PreemptiveRemoteControlConnectionManager";
      __int16 v23 = 2114;
      CFStringRef v24 = @"groupLeader";
      __int16 v25 = 2112;
      v26 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Set: %{public}@ setting %{public}@ to <%@>", buf, 0x20u);
    }

LABEL_10:
    objc_storeStrong((id *)&self->_groupLeader, a3);
    if (v5)
    {
      [(NSHashTable *)self->_observers allObjects];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1001639B0;
      block[3] = &unk_1004159B8;
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      int v19 = self;
      CFStringRef v20 = v5;
      id v16 = v18;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
LABEL_12:
}

- (void)setPreviousClusterLeaderID:(id)a3
{
  id v5 = (NSString *)a3;
  id v6 = [(MRDPreemptiveRemoteControlConnectionManager *)self queue];
  dispatch_assert_queue_V2(v6);

  previousClusterLeaderID = self->_previousClusterLeaderID;
  p_previousClusterLeaderID = (id *)&self->_previousClusterLeaderID;
  id v9 = previousClusterLeaderID;
  if (v9 == v5)
  {
  }
  else
  {
    unsigned __int8 v10 = v9;
    unsigned __int8 v11 = [(NSString *)v9 isEqual:v5];

    if ((v11 & 1) == 0)
    {
      id v12 = *p_previousClusterLeaderID;
      BOOL v13 = _MRLogForCategory();
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        if (v14)
        {
          v15 = (NSString *)*p_previousClusterLeaderID;
          int v19 = 138544130;
          CFStringRef v20 = @"PreemptiveRemoteControlConnectionManager";
          __int16 v21 = 2114;
          CFStringRef v22 = @"previousClusterLeaderID";
          __int16 v23 = 2112;
          CFStringRef v24 = v15;
          __int16 v25 = 2112;
          v26 = v5;
          id v16 = "Set: %{public}@ setting %{public}@ from <%@> to <%@>";
          v17 = v13;
          uint32_t v18 = 42;
LABEL_9:
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v19, v18);
        }
      }
      else if (v14)
      {
        int v19 = 138543874;
        CFStringRef v20 = @"PreemptiveRemoteControlConnectionManager";
        __int16 v21 = 2114;
        CFStringRef v22 = @"previousClusterLeaderID";
        __int16 v23 = 2112;
        CFStringRef v24 = v5;
        id v16 = "Set: %{public}@ setting %{public}@ to <%@>";
        v17 = v13;
        uint32_t v18 = 32;
        goto LABEL_9;
      }

      objc_storeStrong(p_previousClusterLeaderID, a3);
    }
  }
}

- (void)setPreferredClusterLeader:(id)a3
{
  id v5 = (MRAVEndpoint *)a3;
  id v6 = [(MRDPreemptiveRemoteControlConnectionManager *)self queue];
  dispatch_assert_queue_V2(v6);

  p_preferredClusterLeader = &self->_preferredClusterLeader;
  id v8 = self->_preferredClusterLeader;
  if (v8 == v5)
  {

    goto LABEL_12;
  }
  id v9 = v8;
  unsigned __int8 v10 = [(MRAVEndpoint *)v8 isEqual:v5];

  if ((v10 & 1) == 0)
  {
    unsigned __int8 v11 = [(MRAVEndpoint *)*p_preferredClusterLeader debugName];

    id v12 = _MRLogForCategory();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (!v13) {
        goto LABEL_10;
      }
      BOOL v14 = [(MRAVEndpoint *)*p_preferredClusterLeader debugName];
      v15 = [(MRAVEndpoint *)v5 debugName];
      *(_DWORD *)buf = 138544130;
      CFStringRef v22 = @"PreemptiveRemoteControlConnectionManager";
      __int16 v23 = 2114;
      CFStringRef v24 = @"clusterLeader";
      __int16 v25 = 2112;
      v26 = v14;
      __int16 v27 = 2112;
      v28 = v15;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Set: %{public}@ setting %{public}@ from <%@> to <%@>", buf, 0x2Au);
    }
    else
    {
      if (!v13) {
        goto LABEL_10;
      }
      BOOL v14 = [(MRAVEndpoint *)v5 debugName];
      *(_DWORD *)buf = 138543874;
      CFStringRef v22 = @"PreemptiveRemoteControlConnectionManager";
      __int16 v23 = 2114;
      CFStringRef v24 = @"clusterLeader";
      __int16 v25 = 2112;
      v26 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Set: %{public}@ setting %{public}@ to <%@>", buf, 0x20u);
    }

LABEL_10:
    objc_storeStrong((id *)&self->_preferredClusterLeader, a3);
    if (v5)
    {
      [(NSHashTable *)self->_observers allObjects];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100163F24;
      block[3] = &unk_1004159B8;
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      int v19 = self;
      CFStringRef v20 = v5;
      id v16 = v18;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
LABEL_12:
}

- (void)_reevaluateWithReason:(id)a3
{
  id v4 = [(MRDPreemptiveRemoteControlConnectionManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001640CC;
  block[3] = &unk_100415CC8;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)_reevaluateGroupLeaderConnectionWithDeviceInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(MRDPreemptiveRemoteControlConnectionManager *)self queue];
  dispatch_assert_queue_V2(v5);

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1001643EC;
  v25[3] = &unk_10041F320;
  id v6 = v4;
  id v26 = v6;
  id v7 = sub_1001643EC((uint64_t)v25);
  if ([v7 result])
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10016447C;
    v23[3] = &unk_10041F348;
    v23[4] = self;
    id v8 = v6;
    id v24 = v8;
    id v9 = sub_10016447C((uint64_t)v23);
    if ([v9 result])
    {
      unsigned __int8 v10 = [v8 groupUID];
      [(MRDPreemptiveRemoteControlConnectionManager *)self setPreviousGroupID:v10];
      [(MRDPreemptiveRemoteControlConnectionManager *)self _clearPendingGroupLeaderOperations];
      unsigned __int8 v11 = [[MRDConenctToGroupLeaderOperation alloc] initWithGroupID:v10];
      objc_initWeak(&location, v11);
      id v16 = _NSConcreteStackBlock;
      uint64_t v17 = 3221225472;
      id v18 = sub_1001645A0;
      int v19 = &unk_1004182A8;
      objc_copyWeak(&v21, &location);
      CFStringRef v20 = self;
      [(MRDConenctToGroupLeaderOperation *)v11 setCompletionBlock:&v16];
      id v12 = [(MRDPreemptiveRemoteControlConnectionManager *)self groupLeaderOperations];

      if (!v12)
      {
        id v13 = objc_alloc_init((Class)NSOperationQueue);
        [(MRDPreemptiveRemoteControlConnectionManager *)self setGroupLeaderOperations:v13];

        BOOL v14 = [(MRDPreemptiveRemoteControlConnectionManager *)self groupLeaderOperations];
        [v14 setMaxConcurrentOperationCount:3];
      }
      v15 = [(MRDPreemptiveRemoteControlConnectionManager *)self groupLeaderOperations];
      [v15 addOperation:v11];

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    [(MRDPreemptiveRemoteControlConnectionManager *)self _clearPendingGroupLeaderOperations];
    [(MRDPreemptiveRemoteControlConnectionManager *)self setPreviousGroupID:0];
    [(MRDPreemptiveRemoteControlConnectionManager *)self setGroupLeader:0];
  }
}

- (void)_reevaluateClusterLeaderConnectionWithDeviceInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(MRDPreemptiveRemoteControlConnectionManager *)self queue];
  dispatch_assert_queue_V2(v5);

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100164910;
  v24[3] = &unk_10041F320;
  id v6 = v4;
  id v25 = v6;
  id v7 = sub_100164910((uint64_t)v24);
  if ([v7 result])
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1001649D4;
    v22[3] = &unk_10041F348;
    v22[4] = self;
    id v8 = v6;
    id v23 = v8;
    id v9 = sub_1001649D4((uint64_t)v22);
    if ([v9 result])
    {
      unsigned __int8 v10 = [v8 clusterLeaderID];
      [(MRDPreemptiveRemoteControlConnectionManager *)self setPreviousClusterLeaderID:v10];
      [(MRDPreemptiveRemoteControlConnectionManager *)self _clearPendingClusterLeaderOperations];
      unsigned __int8 v11 = [[MRDConenctToClusterLeaderOperation alloc] initWithClusterLeaderID:v10];
      objc_initWeak(&location, v11);
      v15 = _NSConcreteStackBlock;
      uint64_t v16 = 3221225472;
      uint64_t v17 = sub_100164AF8;
      id v18 = &unk_1004182A8;
      objc_copyWeak(&v20, &location);
      int v19 = self;
      [(MRDConenctToClusterLeaderOperation *)v11 setCompletionBlock:&v15];
      id v12 = [(MRDPreemptiveRemoteControlConnectionManager *)self clusterLeaderOperations];

      if (!v12)
      {
        id v13 = objc_alloc_init((Class)NSOperationQueue);
        [(MRDPreemptiveRemoteControlConnectionManager *)self setClusterLeaderOperations:v13];
      }
      BOOL v14 = [(MRDPreemptiveRemoteControlConnectionManager *)self clusterLeaderOperations];
      [v14 addOperation:v11];

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    [(MRDPreemptiveRemoteControlConnectionManager *)self _clearPendingClusterLeaderOperations];
    [(MRDPreemptiveRemoteControlConnectionManager *)self setPreferredClusterLeader:0];
  }
}

- (void)_clearPendingGroupLeaderOperations
{
  id v3 = [(MRDPreemptiveRemoteControlConnectionManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(MRDPreemptiveRemoteControlConnectionManager *)self groupLeaderOperations];
  id v5 = [v4 operationCount];

  if (v5)
  {
    id v6 = _MRLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[PreemptiveRemoteControlConnectionManager] Cancelling pending groupLeaderOperations", v8, 2u);
    }

    id v7 = [(MRDPreemptiveRemoteControlConnectionManager *)self groupLeaderOperations];
    [v7 cancelAllOperations];
  }
}

- (void)_clearPendingClusterLeaderOperations
{
  id v3 = [(MRDPreemptiveRemoteControlConnectionManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(MRDPreemptiveRemoteControlConnectionManager *)self clusterLeaderOperations];
  id v5 = [v4 operationCount];

  if (v5)
  {
    id v6 = _MRLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[PreemptiveRemoteControlConnectionManager] Cancelling Pending clusterLeaderOperations", v8, 2u);
    }

    id v7 = [(MRDPreemptiveRemoteControlConnectionManager *)self clusterLeaderOperations];
    [v7 cancelAllOperations];
  }
}

- (MRAVEndpoint)groupLeader
{
  return self->_groupLeader;
}

- (MRAVEndpoint)preferredClusterLeader
{
  return self->_preferredClusterLeader;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (NSString)previousGroupID
{
  return self->_previousGroupID;
}

- (NSOperationQueue)groupLeaderOperations
{
  return self->_groupLeaderOperations;
}

- (void)setGroupLeaderOperations:(id)a3
{
}

- (NSString)previousClusterLeaderID
{
  return self->_previousClusterLeaderID;
}

- (NSOperationQueue)clusterLeaderOperations
{
  return self->_clusterLeaderOperations;
}

- (void)setClusterLeaderOperations:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_clusterLeaderOperations, 0);
  objc_storeStrong((id *)&self->_previousClusterLeaderID, 0);
  objc_storeStrong((id *)&self->_groupLeaderOperations, 0);
  objc_storeStrong((id *)&self->_previousGroupID, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_preferredClusterLeader, 0);

  objc_storeStrong((id *)&self->_groupLeader, 0);
}

@end