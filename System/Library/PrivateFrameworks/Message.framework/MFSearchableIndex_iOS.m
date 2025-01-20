@interface MFSearchableIndex_iOS
+ (OS_os_log)log;
- (BOOL)isPluggedIn;
- (MFSearchableIndex_iOS)initWithName:(id)a3 dataSource:(id)a4;
- (id)currentReasons;
- (id)dataSourceRefreshReasons;
- (id)exclusionReasons;
- (id)powerObservable;
- (id)purgeReasons;
- (void)_indexMessage:(id)a3 includeBody:(BOOL)a4 indexingType:(int64_t)a5;
- (void)indexMessages:(id)a3 includeBody:(BOOL)a4 indexingType:(int64_t)a5;
@end

@implementation MFSearchableIndex_iOS

- (id)purgeReasons
{
  if (purgeReasons_onceToken != -1) {
    dispatch_once(&purgeReasons_onceToken, &__block_literal_global_15);
  }
  v2 = (void *)purgeReasons_reasons;
  return v2;
}

- (id)exclusionReasons
{
  if (exclusionReasons_onceToken != -1) {
    dispatch_once(&exclusionReasons_onceToken, &__block_literal_global_17);
  }
  v2 = (void *)exclusionReasons_reasons;
  return v2;
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__MFSearchableIndex_iOS_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_30 != -1) {
    dispatch_once(&log_onceToken_30, block);
  }
  v2 = (void *)log_log_30;
  return (OS_os_log *)v2;
}

- (MFSearchableIndex_iOS)initWithName:(id)a3 dataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MFSearchableIndex_iOS;
  v8 = [(EDSearchableIndex *)&v13 initWithName:v6 dataSource:v7];
  if (v8)
  {
    v9 = MFUserAgent();
    -[EDSearchableIndex setForeground:](v8, "setForeground:", [v9 isForeground]);

    v10 = [MEMORY[0x1E4F734D0] sharedController];
    [v10 addDiagnosticsGenerator:v8];
  }
  v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 addObserver:v8 selector:sel_attachmentBecameAvailable_ name:@"LibraryMessageAttachmentDataBecameAvailableNotification" object:0];

  return v8;
}

- (id)dataSourceRefreshReasons
{
  if (dataSourceRefreshReasons_onceToken != -1) {
    dispatch_once(&dataSourceRefreshReasons_onceToken, &__block_literal_global_57);
  }
  v2 = (void *)dataSourceRefreshReasons_reasons;
  return v2;
}

- (id)currentReasons
{
  v3 = +[MFActivityMonitor currentMonitor];
  v4 = [v3 reasons];

  if ([v4 count])
  {
    id v5 = v4;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)MFSearchableIndex_iOS;
    id v5 = [(EDSearchableIndex *)&v8 currentReasons];
  }
  id v6 = v5;

  return v6;
}

- (void)_indexMessage:(id)a3 includeBody:(BOOL)a4 indexingType:(int64_t)a5
{
  BOOL v6 = a4;
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = v8;
  if (v6)
  {
    char v15 = 0;
    v10 = [v8 bestAlternativePart:&v15];
    v11 = [v10 dataUsingEncoding:4];
  }
  else
  {
    v11 = 0;
  }
  v12 = [(EDSearchableIndexItem *)[MFSearchableIndexItem_iOS alloc] initWithMessage:v9 bodyData:v11 fetchBody:v6];
  [(EDSearchableIndexItem *)v12 setIndexingType:a5];
  int v13 = [MEMORY[0x1E4F60C08] isIncrementalIndexingType:a5];
  v16[0] = v12;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  [(EDSearchableIndex *)self indexItems:v14 immediately:v13 & (v6 ^ 1)];
}

- (void)indexMessages:(id)a3 includeBody:(BOOL)a4 indexingType:(int64_t)a5
{
  BOOL v6 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = a3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v9)
  {
    uint64_t v11 = *(void *)v18;
    *(void *)&long long v10 = 138543362;
    long long v16 = v10;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        int v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ((objc_msgSend(v13, "messageFlags", v16, (void)v17) & 0x80) != 0)
        {
          v14 = +[MFSearchableIndex_iOS log];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            char v15 = objc_msgSend(v13, "ef_publicDescription");
            *(_DWORD *)buf = v16;
            v22 = v15;
            _os_log_impl(&dword_1A7EFF000, v14, OS_LOG_TYPE_INFO, "Skipping indexing of message %{public}@ since it's a server search result...", buf, 0xCu);
          }
        }
        else
        {
          [(MFSearchableIndex_iOS *)self _indexMessage:v13 includeBody:v6 indexingType:a5];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v9);
  }
}

- (id)powerObservable
{
  v2 = +[MFPowerController sharedInstance];
  v3 = [v2 powerObservable];

  return v3;
}

- (BOOL)isPluggedIn
{
  v2 = +[MFPowerController sharedInstance];
  char v3 = [v2 isPluggedIn];

  return v3;
}

@end