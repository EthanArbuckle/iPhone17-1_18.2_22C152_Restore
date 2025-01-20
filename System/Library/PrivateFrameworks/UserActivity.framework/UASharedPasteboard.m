@interface UASharedPasteboard
+ (id)remotePasteboard;
+ (void)clearLocalPasteboardInformation;
+ (void)localPasteboardDidAddData:(id)a3 toItemAtIndex:(unint64_t)a4 generation:(unint64_t)a5;
+ (void)localPasteboardDidAddItems:(id)a3 forGeneration:(unint64_t)a4;
+ (void)localPasteboardDidPasteGeneration:(unint64_t)a3;
+ (void)startPreventingPasteboardSharing;
+ (void)stopPreventingPasteboardSharing;
- (BOOL)returnPasteboardDataBeforeArchives;
- (UASharedPasteboardManager)manager;
- (id)currentRemoteDeviceName;
- (void)prefetchRemotePasteboardTypes:(id)a3;
- (void)requestRemotePasteboardDataForProcess:(int)a3 withCompletion:(id)a4;
- (void)requestRemotePasteboardTypesForProcess:(int)a3 withCompletion:(id)a4;
- (void)setManager:(id)a3;
@end

@implementation UASharedPasteboard

+ (void)localPasteboardDidAddData:(id)a3 toItemAtIndex:(unint64_t)a4 generation:(unint64_t)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = [v7 type];
    int v11 = 134218243;
    unint64_t v12 = a4;
    __int16 v13 = 2113;
    v14 = v9;
    _os_log_impl(&dword_1B3DF6000, v8, OS_LOG_TYPE_INFO, "PBOARD CLIENT: add type for index: %lu/%{private}@", (uint8_t *)&v11, 0x16u);
  }
  v10 = +[UASharedPasteboardManager sharedManager];
  [v10 addData:v7 toItemAtIndex:a4 generation:a5];
}

+ (void)localPasteboardDidAddItems:(id)a3 forGeneration:(unint64_t)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218243;
    uint64_t v22 = [v5 count];
    __int16 v23 = 2113;
    id v24 = v5;
    _os_log_impl(&dword_1B3DF6000, v6, OS_LOG_TYPE_INFO, "PBOARD CLIENT: addItems, %lud items added, items=%{private}@", buf, 0x16u);
  }

  if ([v5 count])
  {
    unint64_t v7 = 0;
    do
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      v8 = objc_msgSend(v5, "objectAtIndexedSubscript:", v7, 0);
      v9 = [v8 types];

      uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v17;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v17 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * v13);
            uint64_t v15 = +[UASharedPasteboardManager sharedManager];
            [v15 addData:v14 toItemAtIndex:v7 generation:a4];

            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v11);
      }

      ++v7;
    }
    while ([v5 count] > v7);
  }
}

+ (void)clearLocalPasteboardInformation
{
  v2 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B3DF6000, v2, OS_LOG_TYPE_INFO, "PBOARD CLIENT: Clear Local Pasteboard Info", v4, 2u);
  }

  v3 = +[UASharedPasteboardManager sharedManager];
  [v3 clearLocalPasteboardInformation];
}

+ (void)localPasteboardDidPasteGeneration:(unint64_t)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 134217984;
    unint64_t v6 = a3;
    _os_log_impl(&dword_1B3DF6000, v4, OS_LOG_TYPE_INFO, "PBOARD CLIENT: localPasteboardDidPasteGeneration = %ld", (uint8_t *)&v5, 0xCu);
  }
}

+ (id)remotePasteboard
{
  if (remotePasteboard_onceToken != -1) {
    dispatch_once(&remotePasteboard_onceToken, &__block_literal_global_13);
  }
  v2 = (void *)remotePasteboard_remotePasteboard;

  return v2;
}

void __38__UASharedPasteboard_remotePasteboard__block_invoke()
{
  v0 = objc_alloc_init(UASharedPasteboard);
  v1 = (void *)remotePasteboard_remotePasteboard;
  remotePasteboard_remotePasteboard = (uint64_t)v0;

  id v2 = +[UASharedPasteboardManager sharedManager];
  [(id)remotePasteboard_remotePasteboard setManager:v2];
}

- (BOOL)returnPasteboardDataBeforeArchives
{
  id v2 = +[UASharedPasteboardManager sharedManager];
  char v3 = [v2 requestPasteboardFetchReturnEarly];

  return v3;
}

- (void)requestRemotePasteboardTypesForProcess:(int)a3 withCompletion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  unint64_t v6 = _uaGetLogForCategory(@"pasteboard-client");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 136446210;
    v9 = "-[UASharedPasteboard requestRemotePasteboardTypesForProcess:withCompletion:]";
    _os_log_impl(&dword_1B3DF6000, v6, OS_LOG_TYPE_INFO, "[PBOARD CLIENT] %{public}s", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v7 = +[UASharedPasteboardManager sharedManager];
  [v7 requestRemotePasteboardTypesForProcess:v4 withCompletion:v5];
}

- (void)requestRemotePasteboardDataForProcess:(int)a3 withCompletion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  unint64_t v6 = _uaGetLogForCategory(@"pasteboard-client");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 136446210;
    v9 = "-[UASharedPasteboard requestRemotePasteboardDataForProcess:withCompletion:]";
    _os_log_impl(&dword_1B3DF6000, v6, OS_LOG_TYPE_INFO, "[PBOARD CLIENT] %{public}s", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v7 = +[UASharedPasteboardManager sharedManager];
  [v7 requestRemotePasteboardDataForProcess:v4 withCompletion:v5];
}

- (void)prefetchRemotePasteboardTypes:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  char v3 = _uaGetLogForCategory(@"pasteboard-client");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 136446210;
    id v5 = "-[UASharedPasteboard prefetchRemotePasteboardTypes:]";
    _os_log_impl(&dword_1B3DF6000, v3, OS_LOG_TYPE_INFO, "[PBOARD CLIENT] %{public}s", (uint8_t *)&v4, 0xCu);
  }
}

- (id)currentRemoteDeviceName
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = _uaGetLogForCategory(@"pasteboard-client");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v6 = 136446210;
    uint64_t v7 = "-[UASharedPasteboard currentRemoteDeviceName]";
    _os_log_impl(&dword_1B3DF6000, v2, OS_LOG_TYPE_INFO, "[PBOARD CLIENT] %{public}s", (uint8_t *)&v6, 0xCu);
  }

  char v3 = +[UASharedPasteboardManager sharedManager];
  int v4 = [v3 currentRemoteDeviceName];

  return v4;
}

+ (void)startPreventingPasteboardSharing
{
  id v2 = +[UASharedPasteboardManager sharedManager];
  [v2 startPreventingPasteboardSharing];
}

+ (void)stopPreventingPasteboardSharing
{
  id v2 = +[UASharedPasteboardManager sharedManager];
  [v2 stopPreventingPasteboardSharing];
}

- (UASharedPasteboardManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
  self->_manager = (UASharedPasteboardManager *)a3;
}

@end