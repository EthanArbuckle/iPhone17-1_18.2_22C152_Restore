@interface _TSF_TSDIOKServiceMatcher
- (BOOL)startNotificationsWithMatchingDictionary:(id)a3;
- (_TSF_TSDIOKServiceMatcher)init;
- (unint64_t)getMatchedCount;
- (void)dealloc;
- (void)handleServiceMatched:(id)a3;
- (void)handleServiceTerminated:(id)a3;
@end

@implementation _TSF_TSDIOKServiceMatcher

- (_TSF_TSDIOKServiceMatcher)init
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)_TSF_TSDIOKServiceMatcher;
  v2 = [(_TSF_TSDIOKServiceMatcher *)&v7 init];
  if (v2)
  {
    if (init_onceToken != -1) {
      dispatch_once(&init_onceToken, &__block_literal_global_3);
    }
    if (_sharedTSDIOKServiceMatcherNotificationsQueue)
    {
      if (_sharedTSDIOKServiceMatcherNotificationsPort)
      {
        uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
        matchedEntryIDs = v2->_matchedEntryIDs;
        v2->_matchedEntryIDs = (NSMutableSet *)v3;

        if (v2->_matchedEntryIDs) {
          return v2;
        }
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          v9 = "_matchedEntryIDs != nil";
          __int16 v10 = 2048;
          uint64_t v11 = 0;
          __int16 v12 = 2048;
          uint64_t v13 = 0;
          __int16 v14 = 2080;
          v15 = "";
          __int16 v16 = 2080;
          v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDKextNotifier.m";
          __int16 v18 = 1024;
          int v19 = 47;
          v6 = MEMORY[0x1E4F14500];
          goto LABEL_14;
        }
LABEL_15:

        return 0;
      }
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      *(_DWORD *)buf = 136316418;
      v9 = "_sharedTSDIOKServiceMatcherNotificationsPort != nil";
      __int16 v10 = 2048;
      uint64_t v11 = 0;
      __int16 v12 = 2048;
      uint64_t v13 = 0;
      __int16 v14 = 2080;
      v15 = "";
      __int16 v16 = 2080;
      v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDKextNotifier.m";
      __int16 v18 = 1024;
      int v19 = 44;
      v6 = MEMORY[0x1E4F14500];
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      *(_DWORD *)buf = 136316418;
      v9 = "_sharedTSDIOKServiceMatcherNotificationsQueue != nil";
      __int16 v10 = 2048;
      uint64_t v11 = 0;
      __int16 v12 = 2048;
      uint64_t v13 = 0;
      __int16 v14 = 2080;
      v15 = "";
      __int16 v16 = 2080;
      v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDKextNotifier.m";
      __int16 v18 = 1024;
      int v19 = 43;
      v6 = MEMORY[0x1E4F14500];
    }
LABEL_14:
    _os_log_impl(&dword_1BA88B000, v6, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    goto LABEL_15;
  }
  return v2;
}

- (BOOL)startNotificationsWithMatchingDictionary:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
LABEL_9:
    BOOL v17 = 0;
    goto LABEL_10;
  }
  v6 = [v4 objectForKeyedSubscript:@"IOProviderClass"];
  identifier = self->_identifier;
  self->_identifier = v6;

  objc_initWeak(&location, self);
  v8 = (void *)MEMORY[0x1E4F6EC30];
  uint64_t v9 = _sharedTSDIOKServiceMatcherNotificationsPort;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __70___TSF_TSDIOKServiceMatcher_startNotificationsWithMatchingDictionary___block_invoke;
  v24[3] = &unk_1E622AC88;
  objc_copyWeak(&v25, &location);
  __int16 v10 = [v8 addNotificationOfType:*MEMORY[0x1E4F6EC10] forMatching:v5 usingNotificationPort:v9 error:0 withHandler:v24];
  matchNotification = self->_matchNotification;
  self->_matchNotification = v10;

  if (!self->_matchNotification)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v28 = "_matchNotification != nil";
      __int16 v29 = 2048;
      v30 = 0;
      __int16 v31 = 2048;
      uint64_t v32 = 0;
      __int16 v33 = 2080;
      v34 = "";
      __int16 v35 = 2080;
      v36 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDKextNotifier.m";
      __int16 v37 = 1024;
      int v38 = 80;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
    goto LABEL_9;
  }
  __int16 v12 = (void *)MEMORY[0x1E4F6EC30];
  uint64_t v13 = _sharedTSDIOKServiceMatcherNotificationsPort;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __70___TSF_TSDIOKServiceMatcher_startNotificationsWithMatchingDictionary___block_invoke_12;
  v22[3] = &unk_1E622AC88;
  objc_copyWeak(&v23, &location);
  __int16 v14 = [v12 addNotificationOfType:*MEMORY[0x1E4F6EC20] forMatching:v5 usingNotificationPort:v13 error:0 withHandler:v22];
  terminateNotification = self->_terminateNotification;
  self->_terminateNotification = v14;

  __int16 v16 = self->_terminateNotification;
  BOOL v17 = v16 != 0;
  if (v16)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __70___TSF_TSDIOKServiceMatcher_startNotificationsWithMatchingDictionary___block_invoke_14;
    v21[3] = &unk_1E622A8F8;
    v21[4] = self;
    dispatch_async((dispatch_queue_t)_sharedTSDIOKServiceMatcherNotificationsQueue, v21);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v28 = "_terminateNotification != nil";
    __int16 v29 = 2048;
    v30 = 0;
    __int16 v31 = 2048;
    uint64_t v32 = 0;
    __int16 v33 = 2080;
    v34 = "";
    __int16 v35 = 2080;
    v36 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDKextNotifier.m";
    __int16 v37 = 1024;
    int v38 = 99;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  objc_destroyWeak(&v23);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
LABEL_10:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    __int16 v18 = [(NSString *)self->_identifier UTF8String];
    int v19 = "failed";
    if (v17) {
      int v19 = "success";
    }
    *(_DWORD *)buf = 136315394;
    v28 = v18;
    __int16 v29 = 2080;
    v30 = v19;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TSDIOKServiceMatcher startNotificationsWithMatchingDictionary %s %s", buf, 0x16u);
  }

  return v17;
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
  v6.super_class = (Class)_TSF_TSDIOKServiceMatcher;
  [(_TSF_TSDIOKServiceMatcher *)&v6 dealloc];
}

- (unint64_t)getMatchedCount
{
  return [(NSMutableSet *)self->_matchedEntryIDs count];
}

- (void)handleServiceMatched:(id)a3
{
  id v5 = a3;
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v5, "entryID"));
  if (([(NSMutableSet *)self->_matchedEntryIDs containsObject:v4] & 1) == 0)
  {
    [(NSMutableSet *)self->_matchedEntryIDs addObject:v4];
    [(_TSF_TSDIOKServiceMatcher *)self serviceMatched:v5];
  }
}

- (void)handleServiceTerminated:(id)a3
{
  id v5 = a3;
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v5, "entryID"));
  if ([(NSMutableSet *)self->_matchedEntryIDs containsObject:v4])
  {
    [(NSMutableSet *)self->_matchedEntryIDs removeObject:v4];
    [(_TSF_TSDIOKServiceMatcher *)self serviceTerminated:v5];
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