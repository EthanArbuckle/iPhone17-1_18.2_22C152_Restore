@interface TSDKextNotifier
- (TSDKextNotifier)init;
- (void)dealloc;
- (void)notifyWhenServiceIsAvailable:(id)a3;
- (void)notifyWhenServiceIsUnavailable:(id)a3;
- (void)serviceMatched:(id)a3;
- (void)serviceTerminated:(id)a3;
@end

@implementation TSDKextNotifier

- (TSDKextNotifier)init
{
  v8.receiver = self;
  v8.super_class = (Class)TSDKextNotifier;
  v2 = [(TSDIOKServiceMatcher *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    matchNotificationsArray = v2->_matchNotificationsArray;
    v2->_matchNotificationsArray = v3;

    if (v2->_matchNotificationsArray)
    {
      v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      terminateNotificationsArray = v2->_terminateNotificationsArray;
      v2->_terminateNotificationsArray = v5;

      if (v2->_terminateNotificationsArray) {
        return v2;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v10 = "_terminateNotificationsArray";
        __int16 v11 = 2048;
        uint64_t v12 = 0;
        __int16 v13 = 2048;
        uint64_t v14 = 0;
        __int16 v15 = 2080;
        v16 = &unk_100030E47;
        __int16 v17 = 2080;
        v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKextNotifier.m";
        __int16 v19 = 1024;
        int v20 = 179;
        goto LABEL_9;
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v10 = "_matchNotificationsArray != nil";
      __int16 v11 = 2048;
      uint64_t v12 = 0;
      __int16 v13 = 2048;
      uint64_t v14 = 0;
      __int16 v15 = 2080;
      v16 = &unk_100030E47;
      __int16 v17 = 2080;
      v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKextNotifier.m";
      __int16 v19 = 1024;
      int v20 = 177;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }

    return 0;
  }
  return v2;
}

- (void)serviceMatched:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(NSString *)self->super._identifier UTF8String];
    unsigned int v7 = [(NSMutableArray *)self->_matchNotificationsArray count];
    *(_DWORD *)buf = 136315394;
    __int16 v19 = v6;
    __int16 v20 = 1024;
    unsigned int v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "TSDKextNotifier serviceMatched %s matchedCount dispatching notifications to %d registered", buf, 0x12u);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  objc_super v8 = self->_matchNotificationsArray;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * (void)v12) + 16))(*(void *)(*((void *)&v13 + 1) + 8 * (void)v12));
        uint64_t v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  [(NSMutableArray *)self->_matchNotificationsArray removeAllObjects];
}

- (void)serviceTerminated:(id)a3
{
  id v4 = a3;
  if ((int)[(TSDIOKServiceMatcher *)self getMatchedCount] <= 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v5 = [(NSString *)self->super._identifier UTF8String];
      unsigned int v6 = [(NSMutableArray *)self->_terminateNotificationsArray count];
      *(_DWORD *)buf = 136315394;
      __int16 v19 = v5;
      __int16 v20 = 1024;
      unsigned int v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "TSDKextNotifier serviceTerminated %s, dispatching notifications to %d registered", buf, 0x12u);
    }
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    objc_super v8 = self->_terminateNotificationsArray;
    id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * (void)v12) + 16))(*(void *)(*((void *)&v13 + 1) + 8 * (void)v12));
          uint64_t v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }

    [(NSMutableArray *)self->_terminateNotificationsArray removeAllObjects];
  }
}

- (void)notifyWhenServiceIsAvailable:(id)a3
{
  id v4 = a3;
  v5 = v4;
  unsigned int v6 = qword_100047C20;
  if (qword_100047C20)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000BA24;
    v7[3] = &unk_10003C5E8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(v6, v7);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    id v10 = "_sharedTSDIOKServiceMatcherNotificationsQueue != nil";
    __int16 v11 = 2048;
    uint64_t v12 = 0;
    __int16 v13 = 2048;
    uint64_t v14 = 0;
    __int16 v15 = 2080;
    long long v16 = &unk_100030E47;
    __int16 v17 = 2080;
    v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKextNotifier.m";
    __int16 v19 = 1024;
    int v20 = 223;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
}

- (void)notifyWhenServiceIsUnavailable:(id)a3
{
  id v4 = a3;
  v5 = v4;
  unsigned int v6 = qword_100047C20;
  if (qword_100047C20)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000BD20;
    v7[3] = &unk_10003C5E8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(v6, v7);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    id v10 = "_sharedTSDIOKServiceMatcherNotificationsQueue != nil";
    __int16 v11 = 2048;
    uint64_t v12 = 0;
    __int16 v13 = 2048;
    uint64_t v14 = 0;
    __int16 v15 = 2080;
    long long v16 = &unk_100030E47;
    __int16 v17 = 2080;
    v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKextNotifier.m";
    __int16 v19 = 1024;
    int v20 = 250;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
}

- (void)dealloc
{
  id v3 = [(NSMutableArray *)self->_matchNotificationsArray copy];
  id v4 = [(NSMutableArray *)self->_terminateNotificationsArray copy];
  v5 = qword_100047C20;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000BF94;
  block[3] = &unk_10003C610;
  id v10 = v3;
  id v11 = v4;
  id v6 = v4;
  id v7 = v3;
  dispatch_async(v5, block);

  v8.receiver = self;
  v8.super_class = (Class)TSDKextNotifier;
  [(TSDIOKServiceMatcher *)&v8 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_terminateNotificationsArray, 0);

  objc_storeStrong((id *)&self->_matchNotificationsArray, 0);
}

@end