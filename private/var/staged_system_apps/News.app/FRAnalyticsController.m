@interface FRAnalyticsController
- (AAAccessQueue)accessQueue;
- (BOOL)isUserIDLoaded;
- (BOOL)sessionInProgressForID:(id)a3;
- (FCCloudContext)cloudContext;
- (FRAnalyticsController)init;
- (FRAnalyticsController)initWithCloudContext:(id)a3;
- (NSDate)lastAppOpenDate;
- (NSHashTable)appSessionObservers;
- (NSHashTable)observers;
- (NSMutableDictionary)sceneSessionDictionary;
- (NTPBSession)currentSession;
- (OS_dispatch_group)userIDDeterminationGroup;
- (void)_endAllSessionsWithReason:(int64_t)a3 forSceneID:(id)a4;
- (void)_resetUserID;
- (void)_restartAllSessions;
- (void)_startSessionWithReferral:(id)a3 sceneID:(id)a4 restartAllSessions:(BOOL)a5;
- (void)addAppSessionObserver:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)endSessionForReason:(int64_t)a3 byStartingNewSession:(BOOL)a4 resetUserID:(BOOL)a5 forSceneID:(id)a6;
- (void)loadOrRegenerateUserID;
- (void)loadOrRegenerateUserStartDate;
- (void)notifyWhenUserIDHasBeenDeterminedWithBlock:(id)a3;
- (void)resignSessionForSceneID:(id)a3;
- (void)setCloudContext:(id)a3;
- (void)setIsUserIDLoaded:(BOOL)a3;
- (void)setLastAppOpenDate:(id)a3;
- (void)setSceneSessionDictionary:(id)a3;
- (void)setUserIDDeterminationGroup:(id)a3;
- (void)startSessionIfNeededWithReferral:(id)a3 sceneID:(id)a4;
- (void)syncUserStartDate;
- (void)userInfoDidChangeFeldsparID:(id)a3 fromCloud:(BOOL)a4;
@end

@implementation FRAnalyticsController

- (void)addObserver:(id)a3
{
  id v4 = a3;
  +[NSThread isMainThread];
  id v5 = [(FRAnalyticsController *)self observers];
  [v5 addObject:v4];
}

- (void)startSessionIfNeededWithReferral:(id)a3 sceneID:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  +[NSThread isMainThread];
  if (![(FRAnalyticsController *)self sessionInProgressForID:v6]) {
    [(FRAnalyticsController *)self _startSessionWithReferral:v7 sceneID:v6 restartAllSessions:0];
  }
}

- (void)addAppSessionObserver:(id)a3
{
  id v4 = a3;
  +[NSThread isMainThread];
  id v5 = [(FRAnalyticsController *)self appSessionObservers];
  [v5 addObject:v4];
}

- (BOOL)sessionInProgressForID:(id)a3
{
  id v4 = a3;
  +[NSThread isMainThread];
  id v5 = [(FRAnalyticsController *)self sceneSessionDictionary];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6 != 0;
}

- (void)loadOrRegenerateUserStartDate
{
  v3 = +[FCAppleAccount sharedAccount];
  unsigned __int8 v4 = [v3 isPrivateDataSyncingEnabled];

  id v5 = [(FRAnalyticsController *)self cloudContext];
  id v6 = [v5 userInfo];
  id v7 = [v6 userStartDate];

  if (!v7)
  {
    if (v4)
    {
      [(FRAnalyticsController *)self syncUserStartDate];
    }
    else
    {
      v8 = [(FRAnalyticsController *)self lastAppOpenDate];

      if (!v8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10006F0E4();
      }
      v9 = [(FRAnalyticsController *)self lastAppOpenDate];
      v10 = [(FRAnalyticsController *)self cloudContext];
      v11 = [v10 userInfo];
      [v11 setUserStartDate:v9];
    }
  }
}

- (void)loadOrRegenerateUserID
{
  v3 = self->_userIDDeterminationGroup;
  if (!v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10006F1A8();
  }
  dispatch_group_enter((dispatch_group_t)v3);
  unsigned __int8 v4 = [(FRAnalyticsController *)self cloudContext];
  id v5 = [v4 userInfo];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100018C5C;
  v7[3] = &unk_1000C56D0;
  v7[4] = self;
  v8 = v3;
  id v6 = v3;
  [v5 loadFeldsparIDWithCompletion:v7];
}

- (FRAnalyticsController)initWithCloudContext:(id)a3
{
  id v5 = a3;
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10006EDC4();
  }
  v23.receiver = self;
  v23.super_class = (Class)FRAnalyticsController;
  id v6 = [(FRAnalyticsController *)&v23 init];
  if (v6)
  {
    id v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.news.analytics", v7);

    v9 = (AAAccessQueue *)[objc_alloc((Class)AAAccessQueue) initWithQueue:v8];
    accessQueue = v6->_accessQueue;
    v6->_accessQueue = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    sceneSessionDictionary = v6->_sceneSessionDictionary;
    v6->_sceneSessionDictionary = v11;

    objc_storeStrong((id *)&v6->_cloudContext, a3);
    v6->_isUserIDLoaded = 0;
    dispatch_group_t v13 = dispatch_group_create();
    userIDDeterminationGroup = v6->_userIDDeterminationGroup;
    v6->_userIDDeterminationGroup = (OS_dispatch_group *)v13;

    v15 = [v5 userInfo];
    [v15 addObserver:v6];
    uint64_t v16 = +[NSDate date];
    lastAppOpenDate = v6->_lastAppOpenDate;
    v6->_lastAppOpenDate = (NSDate *)v16;

    [(FRAnalyticsController *)v6 loadOrRegenerateUserID];
    [(FRAnalyticsController *)v6 loadOrRegenerateUserStartDate];
    uint64_t v18 = +[NSHashTable hashTableWithOptions:517];
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v18;

    uint64_t v20 = +[NSHashTable hashTableWithOptions:517];
    appSessionObservers = v6->_appSessionObservers;
    v6->_appSessionObservers = (NSHashTable *)v20;
  }
  return v6;
}

- (void)_startSessionWithReferral:(id)a3 sceneID:(id)a4 restartAllSessions:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  +[NSThread isMainThread];
  if (v5)
  {
    v10 = [(FRAnalyticsController *)self sceneSessionDictionary];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10001AB2C;
    v37[3] = &unk_1000C56F8;
    v37[4] = self;
    [v10 enumerateKeysAndObjectsUsingBlock:v37];

    [(FRAnalyticsController *)self _restartAllSessions];
  }
  else
  {
    v11 = +[NSUUID UUID];
    v12 = [v11 UUIDString];

    dispatch_group_t v13 = [(FRAnalyticsController *)self sceneSessionDictionary];
    [v13 setObject:v12 forKeyedSubscript:v9];

    v14 = [v8 referringURL];

    if (v14)
    {
      id v15 = objc_alloc((Class)NSURL);
      uint64_t v16 = [v8 referringURL];
      id v32 = [v15 initWithString:v16];
    }
    else
    {
      id v32 = 0;
    }
    v17 = [(FRAnalyticsController *)self observers];
    uint64_t v18 = [v17 allObjects];

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v19 = v18;
    id v20 = [v19 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v34;
      objc_super v23 = &selRef_invalidate;
      while (2)
      {
        v24 = 0;
        v25 = v23;
        do
        {
          if (*(void *)v34 != v22) {
            objc_enumerationMutation(v19);
          }
          v26 = *(void **)(*((void *)&v33 + 1) + 8 * (void)v24);
          if (objc_opt_respondsToSelector())
          {
            id v27 = [v26 sceneSessionIdentifier];

            if (v27 == v9)
            {
              v28 = [(FRAnalyticsController *)self sceneSessionDictionary];
              v29 = [v28 objectForKeyedSubscript:v9];
              v30 = [v31 referringApplication];
              [v26 sessionDidStartWithSessionID:v29 sourceApplication:v30 url:v32];

              goto LABEL_17;
            }
          }
          v24 = (char *)v24 + 1;
        }
        while (v21 != v24);
        id v21 = [v19 countByEnumeratingWithState:&v33 objects:v38 count:16];
        objc_super v23 = v25;
        if (v21) {
          continue;
        }
        break;
      }
    }
LABEL_17:

    id v8 = v31;
  }
}

- (NSMutableDictionary)sceneSessionDictionary
{
  return self->_sceneSessionDictionary;
}

- (void)setIsUserIDLoaded:(BOOL)a3
{
  self->_isUserIDLoaded = a3;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (FCCloudContext)cloudContext
{
  return self->_cloudContext;
}

- (NSHashTable)appSessionObservers
{
  return self->_appSessionObservers;
}

- (AAAccessQueue)accessQueue
{
  return self->_accessQueue;
}

- (FRAnalyticsController)init
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    id v6 = "-[FRAnalyticsController init]";
    __int16 v7 = 2080;
    id v8 = "FRAnalyticsController.m";
    __int16 v9 = 1024;
    int v10 = 61;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[FRAnalyticsController init]");
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (void)dealloc
{
  v3 = [(FRAnalyticsController *)self cloudContext];
  id v4 = [v3 userInfo];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)FRAnalyticsController;
  [(FRAnalyticsController *)&v5 dealloc];
}

- (NTPBSession)currentSession
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10006EE88();
  }
  return 0;
}

- (void)userInfoDidChangeFeldsparID:(id)a3 fromCloud:(BOOL)a4
{
  if (a4)
  {
    if ([(FRAnalyticsController *)self isUserIDLoaded]) {
      FCPerformBlockOnMainThread();
    }
  }
}

- (void)notifyWhenUserIDHasBeenDeterminedWithBlock:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10006EF5C();
  }
  objc_super v5 = [(FRAnalyticsController *)self userIDDeterminationGroup];
  dispatch_group_notify(v5, (dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)syncUserStartDate
{
  v3 = [(FRAnalyticsController *)self cloudContext];
  id v4 = [v3 userInfo];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001A3B0;
  v5[3] = &unk_1000C56A8;
  v5[4] = self;
  [v4 syncWithCompletion:v5];
}

- (void)resignSessionForSceneID:(id)a3
{
  id v4 = a3;
  +[NSThread isMainThread];
  objc_super v5 = [(FRAnalyticsController *)self observers];
  id v6 = [v5 allObjects];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          [v12 sceneSessionIdentifier];
          id v13 = (id)objc_claimAutoreleasedReturnValue();

          if (v13 == v4) {
            [v12 performSelector:"sessionWillResignActive" withObject:v4];
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (void)endSessionForReason:(int64_t)a3 byStartingNewSession:(BOOL)a4 resetUserID:(BOOL)a5 forSceneID:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v10 = a6;
  +[NSThread isMainThread];
  if (v10)
  {
    __int16 v11 = [(FRAnalyticsController *)self sceneSessionDictionary];
    id v12 = [v11 objectForKeyedSubscript:v10];

    if (v12)
    {
      BOOL v13 = a3 == 4 && v7;
      if (!v13 && !v6)
      {
        BOOL v29 = v7;
        v30 = v12;
        long long v14 = [(FRAnalyticsController *)self observers];
        long long v15 = [v14 allObjects];

        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v16 = v15;
        id v17 = [v16 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v17)
        {
          id v18 = v17;
          uint64_t v19 = *(void *)v32;
          id v20 = &selRef_activityMonitor;
          while (2)
          {
            id v21 = 0;
            uint64_t v22 = v20[492];
            do
            {
              if (*(void *)v32 != v19) {
                objc_enumerationMutation(v16);
              }
              objc_super v23 = *(void **)(*((void *)&v31 + 1) + 8 * (void)v21);
              if (objc_opt_respondsToSelector())
              {
                id v24 = [v23 sceneSessionIdentifier];

                if (v24 == v10)
                {
                  v26 = +[NSNumber numberWithInteger:a3];
                  [v23 performSelector:v22 withObject:v26 withObject:v10];

                  goto LABEL_23;
                }
              }
              id v21 = (char *)v21 + 1;
            }
            while (v18 != v21);
            id v18 = [v16 countByEnumeratingWithState:&v31 objects:v39 count:16];
            id v20 = &selRef_activityMonitor;
            if (v18) {
              continue;
            }
            break;
          }
        }
LABEL_23:

        uint64_t v25 = 0;
        id v12 = v30;
        BOOL v6 = 0;
        BOOL v7 = v29;
        goto LABEL_24;
      }
LABEL_21:
      [(FRAnalyticsController *)self _endAllSessionsWithReason:a3 forSceneID:v10];
      uint64_t v25 = 1;
LABEL_24:
      id v27 = FCAnalyticsLog;
      if (os_log_type_enabled(FCAnalyticsLog, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v36 = v10;
        __int16 v37 = 2112;
        v38 = v12;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Ending analytics session with scene ID session ID: %@, %@", buf, 0x16u);
      }
      if (v6) {
        [(FRAnalyticsController *)self _resetUserID];
      }
      if ((v25 | v7) == 1)
      {
        [(FRAnalyticsController *)self _startSessionWithReferral:0 sceneID:v10 restartAllSessions:v25];
      }
      else
      {
        v28 = [(FRAnalyticsController *)self sceneSessionDictionary];
        [v28 setObject:0 forKeyedSubscript:v10];
      }
      goto LABEL_33;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10006F26C();
      if (v6) {
        goto LABEL_21;
      }
    }
    else if (v6)
    {
      goto LABEL_21;
    }
    sub_10001A954();
LABEL_33:

    goto LABEL_34;
  }
  sub_10001A8EC();
LABEL_34:
}

- (void)_endAllSessionsWithReason:(int64_t)a3 forSceneID:(id)a4
{
  +[NSThread isMainThread];
  BOOL v6 = [(FRAnalyticsController *)self appSessionObservers];
  BOOL v7 = [v6 allObjects];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        BOOL v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          long long v14 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3, (void)v15);
          [v13 performSelector:"endAppSessionWithEndReason:" withObject:v14];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

- (void)_restartAllSessions
{
  +[NSThread isMainThread];
  id v27 = self;
  v3 = [(FRAnalyticsController *)self appSessionObservers];
  id v4 = [v3 allObjects];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v33;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v11 = +[NSNumber numberWithBool:1];
          [v10 performSelector:"startAppSessionWithUserIDReset:" withObject:v11];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v7);
  }
  v26 = v5;

  id v12 = [(FRAnalyticsController *)v27 observers];
  BOOL v13 = [v12 allObjects];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v14 = v13;
  id v15 = [v14 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v29;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v29 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void **)(*((void *)&v28 + 1) + 8 * (void)j);
        id v20 = [v19 sceneSessionIdentifier:v26];
        if (objc_opt_respondsToSelector())
        {
          id v21 = [(FRAnalyticsController *)v27 sceneSessionDictionary];
          uint64_t v22 = [v21 allKeys];
          unsigned int v23 = [v22 containsObject:v20];

          if (v23)
          {
            id v24 = [(FRAnalyticsController *)v27 sceneSessionDictionary];
            uint64_t v25 = [v24 objectForKeyedSubscript:v20];
            [v19 sessionDidStartWithSessionID:v25 sourceApplication:0 url:0];
          }
        }
      }
      id v16 = [v14 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v16);
  }
}

- (void)_resetUserID
{
  id v3 = [(FRAnalyticsController *)self cloudContext];
  id v2 = [v3 userInfo];
  [v2 resetUserIDs];
}

- (void)setSceneSessionDictionary:(id)a3
{
}

- (void)setCloudContext:(id)a3
{
}

- (BOOL)isUserIDLoaded
{
  return self->_isUserIDLoaded;
}

- (NSDate)lastAppOpenDate
{
  return self->_lastAppOpenDate;
}

- (void)setLastAppOpenDate:(id)a3
{
}

- (OS_dispatch_group)userIDDeterminationGroup
{
  return self->_userIDDeterminationGroup;
}

- (void)setUserIDDeterminationGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appSessionObservers, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_userIDDeterminationGroup, 0);
  objc_storeStrong((id *)&self->_lastAppOpenDate, 0);
  objc_storeStrong((id *)&self->_cloudContext, 0);
  objc_storeStrong((id *)&self->_sceneSessionDictionary, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end