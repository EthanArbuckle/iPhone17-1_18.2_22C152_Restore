@interface _TSF_TSDKextNotifier
- (_TSF_TSDKextNotifier)init;
- (void)dealloc;
- (void)notifyWhenServiceIsAvailable:(id)a3;
- (void)notifyWhenServiceIsUnavailable:(id)a3;
- (void)serviceMatched:(id)a3;
- (void)serviceTerminated:(id)a3;
@end

@implementation _TSF_TSDKextNotifier

- (_TSF_TSDKextNotifier)init
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)_TSF_TSDKextNotifier;
  v2 = [(_TSF_TSDIOKServiceMatcher *)&v9 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    matchNotificationsArray = v2->_matchNotificationsArray;
    v2->_matchNotificationsArray = v3;

    if (v2->_matchNotificationsArray)
    {
      v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      terminateNotificationsArray = v2->_terminateNotificationsArray;
      v2->_terminateNotificationsArray = v5;

      if (v2->_terminateNotificationsArray) {
        return v2;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v11 = "_terminateNotificationsArray";
        __int16 v12 = 2048;
        uint64_t v13 = 0;
        __int16 v14 = 2048;
        uint64_t v15 = 0;
        __int16 v16 = 2080;
        v17 = "";
        __int16 v18 = 2080;
        v19 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDKextNotifier.m";
        __int16 v20 = 1024;
        int v21 = 179;
        v8 = MEMORY[0x1E4F14500];
        goto LABEL_9;
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v11 = "_matchNotificationsArray != nil";
      __int16 v12 = 2048;
      uint64_t v13 = 0;
      __int16 v14 = 2048;
      uint64_t v15 = 0;
      __int16 v16 = 2080;
      v17 = "";
      __int16 v18 = 2080;
      v19 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDKextNotifier.m";
      __int16 v20 = 1024;
      int v21 = 177;
      v8 = MEMORY[0x1E4F14500];
LABEL_9:
      _os_log_impl(&dword_1BA88B000, v8, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }

    return 0;
  }
  return v2;
}

- (void)serviceMatched:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1BA9F1DF0]();
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(NSString *)self->super._identifier UTF8String];
    int v7 = [(NSMutableArray *)self->_matchNotificationsArray count];
    *(_DWORD *)buf = 136315394;
    v19 = v6;
    __int16 v20 = 1024;
    int v21 = v7;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TSDKextNotifier serviceMatched %s matchedCount dispatching notifications to %d registered", buf, 0x12u);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v8 = self->_matchNotificationsArray;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * v12) + 16))(*(void *)(*((void *)&v13 + 1) + 8 * v12));
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  [(NSMutableArray *)self->_matchNotificationsArray removeAllObjects];
}

- (void)serviceTerminated:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((int)[(_TSF_TSDIOKServiceMatcher *)self getMatchedCount] <= 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      v5 = [(NSString *)self->super._identifier UTF8String];
      int v6 = [(NSMutableArray *)self->_terminateNotificationsArray count];
      *(_DWORD *)buf = 136315394;
      v19 = v5;
      __int16 v20 = 1024;
      int v21 = v6;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TSDKextNotifier serviceTerminated %s, dispatching notifications to %d registered", buf, 0x12u);
    }
    int v7 = (void *)MEMORY[0x1BA9F1DF0]();
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v8 = self->_terminateNotificationsArray;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * v12) + 16))(*(void *)(*((void *)&v13 + 1) + 8 * v12));
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }

    [(NSMutableArray *)self->_terminateNotificationsArray removeAllObjects];
  }
}

- (void)notifyWhenServiceIsAvailable:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  int v6 = _sharedTSDIOKServiceMatcherNotificationsQueue;
  if (_sharedTSDIOKServiceMatcherNotificationsQueue)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __53___TSF_TSDKextNotifier_notifyWhenServiceIsAvailable___block_invoke;
    v7[3] = &unk_1E622ACB0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(v6, v7);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v10 = "_sharedTSDIOKServiceMatcherNotificationsQueue != nil";
    __int16 v11 = 2048;
    uint64_t v12 = 0;
    __int16 v13 = 2048;
    uint64_t v14 = 0;
    __int16 v15 = 2080;
    long long v16 = "";
    __int16 v17 = 2080;
    __int16 v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDKextNotifier.m";
    __int16 v19 = 1024;
    int v20 = 223;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
}

- (void)notifyWhenServiceIsUnavailable:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  int v6 = _sharedTSDIOKServiceMatcherNotificationsQueue;
  if (_sharedTSDIOKServiceMatcherNotificationsQueue)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __55___TSF_TSDKextNotifier_notifyWhenServiceIsUnavailable___block_invoke;
    v7[3] = &unk_1E622ACB0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(v6, v7);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v10 = "_sharedTSDIOKServiceMatcherNotificationsQueue != nil";
    __int16 v11 = 2048;
    uint64_t v12 = 0;
    __int16 v13 = 2048;
    uint64_t v14 = 0;
    __int16 v15 = 2080;
    long long v16 = "";
    __int16 v17 = 2080;
    __int16 v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDKextNotifier.m";
    __int16 v19 = 1024;
    int v20 = 250;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
}

- (void)dealloc
{
  v3 = (void *)[(NSMutableArray *)self->_matchNotificationsArray copy];
  id v4 = (void *)[(NSMutableArray *)self->_terminateNotificationsArray copy];
  v5 = _sharedTSDIOKServiceMatcherNotificationsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31___TSF_TSDKextNotifier_dealloc__block_invoke;
  block[3] = &unk_1E622AAB0;
  id v10 = v3;
  id v11 = v4;
  id v6 = v4;
  id v7 = v3;
  dispatch_async(v5, block);

  v8.receiver = self;
  v8.super_class = (Class)_TSF_TSDKextNotifier;
  [(_TSF_TSDIOKServiceMatcher *)&v8 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_terminateNotificationsArray, 0);
  objc_storeStrong((id *)&self->_matchNotificationsArray, 0);
}

@end