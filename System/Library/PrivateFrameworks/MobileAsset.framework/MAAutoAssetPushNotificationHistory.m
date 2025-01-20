@interface MAAutoAssetPushNotificationHistory
+ (id)sharedInstance;
- (BOOL)_loadHistoryWithError:(id *)a3;
- (BOOL)addNotificationsToHistory:(id)a3 withError:(id *)a4;
- (BOOL)clearHistoryWithError:(id *)a3;
- (MAAutoAssetPushNotificationHistory)init;
- (NSArray)notificationHistory;
- (id)_historyURL;
- (void)setNotificationHistory:(id)a3;
@end

@implementation MAAutoAssetPushNotificationHistory

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_7);
  }
  v2 = (void *)sharedInstance_singleton;
  return v2;
}

uint64_t __52__MAAutoAssetPushNotificationHistory_sharedInstance__block_invoke()
{
  sharedInstance_singleton = objc_alloc_init(MAAutoAssetPushNotificationHistory);
  return MEMORY[0x1F41817F8]();
}

- (MAAutoAssetPushNotificationHistory)init
{
  v12.receiver = self;
  v12.super_class = (Class)MAAutoAssetPushNotificationHistory;
  v2 = [(MAAutoAssetPushNotificationHistory *)&v12 init];
  v3 = v2;
  if (v2)
  {
    id v11 = 0;
    [(MAAutoAssetPushNotificationHistory *)v2 _loadHistoryWithError:&v11];
    id v4 = v11;
    v9 = v4;
    if (v4) {
      _MobileAssetLog(0, 3, (uint64_t)"-[MAAutoAssetPushNotificationHistory init]", @"Error loading history: %@", v5, v6, v7, v8, (uint64_t)v4);
    }
  }
  return v3;
}

- (NSArray)notificationHistory
{
  [(MAAutoAssetPushNotificationHistory *)self _loadHistoryWithError:0];
  notificationHistory = self->_notificationHistory;
  return notificationHistory;
}

- (id)_historyURL
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  v3 = getRepositoryPath(@"/private/var/MobileAsset/AssetsV2/persisted");
  id v4 = [v3 stringByAppendingPathComponent:@"PushNotificationManager"];
  uint64_t v5 = [v4 stringByAppendingPathComponent:@"pushnotificationhistory.plist"];
  uint64_t v6 = [v2 fileURLWithPath:v5];

  return v6;
}

- (BOOL)_loadHistoryWithError:(id *)a3
{
  uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v6 = [(MAAutoAssetPushNotificationHistory *)self _historyURL];
  uint64_t v7 = [v6 path];
  int v8 = [v5 fileExistsAtPath:v7];

  if (v8)
  {
    _MobileAssetLog(0, 6, (uint64_t)"-[MAAutoAssetPushNotificationHistory _loadHistoryWithError:]", @"Reading pushnotificationhistory.plist file", v9, v10, v11, v12, v34);
    v13 = (void *)MEMORY[0x1E4F1C978];
    v14 = [(MAAutoAssetPushNotificationHistory *)self _historyURL];
    v15 = [v13 arrayWithContentsOfURL:v14];
    [(MAAutoAssetPushNotificationHistory *)self setNotificationHistory:v15];

LABEL_3:
    LOBYTE(v16) = 0;
    goto LABEL_9;
  }
  _MobileAssetLog(0, 6, (uint64_t)"-[MAAutoAssetPushNotificationHistory _loadHistoryWithError:]", @"pushnotificationhistory.plist file does not exist, create it", v9, v10, v11, v12, v34);
  v17 = getRepositoryPath(@"/private/var/MobileAsset/AssetsV2/persisted");
  v14 = [v17 stringByAppendingPathComponent:@"PushNotificationManager"];

  char v35 = 0;
  if (([v5 fileExistsAtPath:v14 isDirectory:&v35] & 1) == 0)
  {
    _MobileAssetLog(0, 6, (uint64_t)"-[MAAutoAssetPushNotificationHistory _loadHistoryWithError:]", @"%@ doesn't exist, create it", v18, v19, v20, v21, (uint64_t)v14);
    if (([v5 createDirectoryAtPath:v14 withIntermediateDirectories:1 attributes:0 error:a3] & 1) == 0)
    {
      if (a3) {
        v33 = (__CFString *)*a3;
      }
      else {
        v33 = @"no error";
      }
      _MobileAssetLog(0, 3, (uint64_t)"-[MAAutoAssetPushNotificationHistory _loadHistoryWithError:]", @"Error creating directory: %@", v22, v23, v24, v25, (uint64_t)v33);
      goto LABEL_3;
    }
  }
  v26 = [(MAAutoAssetPushNotificationHistory *)self _historyURL];
  int v16 = [MEMORY[0x1E4F1CBF0] writeToURL:v26 error:a3];

  v31 = @"failure";
  if (v16) {
    v31 = @"success";
  }
  _MobileAssetLog(0, 6, (uint64_t)"-[MAAutoAssetPushNotificationHistory _loadHistoryWithError:]", @"Created pushnotificationhistory.plist with result %@", v27, v28, v29, v30, (uint64_t)v31);

LABEL_9:
  return v16;
}

- (BOOL)addNotificationsToHistory:(id)a3 withError:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(MAAutoAssetPushNotificationHistory *)self _loadHistoryWithError:a4];
  uint64_t v7 = [(MAAutoAssetPushNotificationHistory *)self notificationHistory];
  int v8 = (void *)[v7 mutableCopy];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = [*(id *)(*((void *)&v22 + 1) + 8 * v13) historyRepresentation];
        [v8 addObject:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }

  v15 = [(MAAutoAssetPushNotificationHistory *)self _historyURL];
  char v16 = [v8 writeToURL:v15 error:a4];

  if ((v16 & 1) == 0) {
    _MobileAssetLog(0, 3, (uint64_t)"-[MAAutoAssetPushNotificationHistory addNotificationsToHistory:withError:]", @"Error writing notifications to history: %@", v17, v18, v19, v20, (uint64_t)*a4);
  }

  return v16;
}

- (BOOL)clearHistoryWithError:(id *)a3
{
  id v4 = [(MAAutoAssetPushNotificationHistory *)self _historyURL];
  LOBYTE(a3) = [MEMORY[0x1E4F1CBF0] writeToURL:v4 error:a3];

  return (char)a3;
}

- (void)setNotificationHistory:(id)a3
{
}

- (void).cxx_destruct
{
}

@end