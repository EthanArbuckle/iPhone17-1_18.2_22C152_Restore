@interface TSDIOKServiceMatcher
- (BOOL)startNotificationsWithMatchingDictionary:(id)a3;
- (TSDIOKServiceMatcher)init;
- (unint64_t)getMatchedCount;
- (void)dealloc;
- (void)handleServiceMatched:(id)a3;
- (void)handleServiceTerminated:(id)a3;
@end

@implementation TSDIOKServiceMatcher

- (TSDIOKServiceMatcher)init
{
  v6.receiver = self;
  v6.super_class = (Class)TSDIOKServiceMatcher;
  v2 = [(TSDIOKServiceMatcher *)&v6 init];
  if (v2)
  {
    if (qword_100047C30 != -1) {
      dispatch_once(&qword_100047C30, &stru_10003C598);
    }
    if (qword_100047C20)
    {
      if (qword_100047C28)
      {
        uint64_t v3 = +[NSMutableSet set];
        matchedEntryIDs = v2->_matchedEntryIDs;
        v2->_matchedEntryIDs = (NSMutableSet *)v3;

        if (v2->_matchedEntryIDs) {
          return v2;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          v8 = "_matchedEntryIDs != nil";
          __int16 v9 = 2048;
          uint64_t v10 = 0;
          __int16 v11 = 2048;
          uint64_t v12 = 0;
          __int16 v13 = 2080;
          v14 = &unk_100030E47;
          __int16 v15 = 2080;
          v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKextNotifier.m";
          __int16 v17 = 1024;
          int v18 = 47;
          goto LABEL_14;
        }
LABEL_15:

        return 0;
      }
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      *(_DWORD *)buf = 136316418;
      v8 = "_sharedTSDIOKServiceMatcherNotificationsPort != nil";
      __int16 v9 = 2048;
      uint64_t v10 = 0;
      __int16 v11 = 2048;
      uint64_t v12 = 0;
      __int16 v13 = 2080;
      v14 = &unk_100030E47;
      __int16 v15 = 2080;
      v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKextNotifier.m";
      __int16 v17 = 1024;
      int v18 = 44;
    }
    else
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      *(_DWORD *)buf = 136316418;
      v8 = "_sharedTSDIOKServiceMatcherNotificationsQueue != nil";
      __int16 v9 = 2048;
      uint64_t v10 = 0;
      __int16 v11 = 2048;
      uint64_t v12 = 0;
      __int16 v13 = 2080;
      v14 = &unk_100030E47;
      __int16 v15 = 2080;
      v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKextNotifier.m";
      __int16 v17 = 1024;
      int v18 = 43;
    }
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    goto LABEL_15;
  }
  return v2;
}

- (BOOL)startNotificationsWithMatchingDictionary:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
LABEL_9:
    BOOL v15 = 0;
    goto LABEL_10;
  }
  objc_super v6 = [v4 objectForKeyedSubscript:@"IOProviderClass"];
  identifier = self->_identifier;
  self->_identifier = v6;

  objc_initWeak(&location, self);
  uint64_t v8 = qword_100047C28;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10000AF58;
  v22[3] = &unk_10003C5C0;
  objc_copyWeak(&v23, &location);
  __int16 v9 = +[IOKService addNotificationOfType:IOKFirstMatchNotification forMatching:v5 usingNotificationPort:v8 error:0 withHandler:v22];
  matchNotification = self->_matchNotification;
  self->_matchNotification = v9;

  if (!self->_matchNotification)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v26 = "_matchNotification != nil";
      __int16 v27 = 2048;
      v28 = 0;
      __int16 v29 = 2048;
      uint64_t v30 = 0;
      __int16 v31 = 2080;
      v32 = &unk_100030E47;
      __int16 v33 = 2080;
      v34 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKextNotifier.m";
      __int16 v35 = 1024;
      int v36 = 80;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
    goto LABEL_9;
  }
  uint64_t v11 = qword_100047C28;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10000B028;
  v20[3] = &unk_10003C5C0;
  objc_copyWeak(&v21, &location);
  uint64_t v12 = +[IOKService addNotificationOfType:IOKTerminatedNotification forMatching:v5 usingNotificationPort:v11 error:0 withHandler:v20];
  terminateNotification = self->_terminateNotification;
  self->_terminateNotification = v12;

  v14 = self->_terminateNotification;
  BOOL v15 = v14 != 0;
  if (v14)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10000B0F8;
    v19[3] = &unk_10003C4B0;
    v19[4] = self;
    dispatch_async((dispatch_queue_t)qword_100047C20, v19);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v26 = "_terminateNotification != nil";
    __int16 v27 = 2048;
    v28 = 0;
    __int16 v29 = 2048;
    uint64_t v30 = 0;
    __int16 v31 = 2080;
    v32 = &unk_100030E47;
    __int16 v33 = 2080;
    v34 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDKextNotifier.m";
    __int16 v35 = 1024;
    int v36 = 99;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
LABEL_10:
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v16 = [(NSString *)self->_identifier UTF8String];
    __int16 v17 = "failed";
    if (v15) {
      __int16 v17 = "success";
    }
    *(_DWORD *)buf = 136315394;
    v26 = v16;
    __int16 v27 = 2080;
    v28 = v17;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "TSDIOKServiceMatcher startNotificationsWithMatchingDictionary %s %s", buf, 0x16u);
  }

  return v15;
}

- (void)dealloc
{
  matchedEntryIDs = self->_matchedEntryIDs;
  self->_matchedEntryIDs = 0;

  matchNotification = self->_matchNotification;
  self->_matchNotification = 0;

  terminateNotification = self->_terminateNotification;
  self->_terminateNotification = 0;

  v6.receiver = self;
  v6.super_class = (Class)TSDIOKServiceMatcher;
  [(TSDIOKServiceMatcher *)&v6 dealloc];
}

- (unint64_t)getMatchedCount
{
  return (unint64_t)[(NSMutableSet *)self->_matchedEntryIDs count];
}

- (void)handleServiceMatched:(id)a3
{
  id v5 = a3;
  id v4 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v5 entryID]);
  if (([(NSMutableSet *)self->_matchedEntryIDs containsObject:v4] & 1) == 0)
  {
    [(NSMutableSet *)self->_matchedEntryIDs addObject:v4];
    [(TSDIOKServiceMatcher *)self serviceMatched:v5];
  }
}

- (void)handleServiceTerminated:(id)a3
{
  id v5 = a3;
  id v4 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v5 entryID]);
  if ([(NSMutableSet *)self->_matchedEntryIDs containsObject:v4])
  {
    [(NSMutableSet *)self->_matchedEntryIDs removeObject:v4];
    [(TSDIOKServiceMatcher *)self serviceTerminated:v5];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_matchedEntryIDs, 0);
  objc_storeStrong((id *)&self->_terminateNotification, 0);

  objc_storeStrong((id *)&self->_matchNotification, 0);
}

@end