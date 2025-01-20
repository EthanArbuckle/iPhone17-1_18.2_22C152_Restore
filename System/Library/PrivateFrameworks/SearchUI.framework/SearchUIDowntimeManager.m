@interface SearchUIDowntimeManager
+ (BOOL)isChildOrTeenFamilyMember:(id)a3;
+ (BOOL)screenTimeIsEnabledForContact:(id)a3;
+ (id)familyMemberForContact:(id)a3 isMe:(BOOL)a4;
+ (id)screenTimeUserIDForContact:(id)a3;
+ (id)sharedManager;
- (BPSSink)biomeSink;
- (NSCache)downtimeStatuses;
- (NSNotificationCenter)notificationCenter;
- (SearchUIDowntimeManager)init;
- (id)addObserverForDowntimeStatuses:(id)a3;
- (int)statusForSTUserID:(id)a3 forceRecheck:(BOOL)a4;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)setBiomeSink:(id)a3;
- (void)setNotificationCenter:(id)a3;
- (void)setupSink;
- (void)updateWithChildState:(id)a3;
@end

@implementation SearchUIDowntimeManager

+ (id)screenTimeUserIDForContact:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (screenTimeUserIDForContact__onceToken != -1)
  {
    dispatch_once(&screenTimeUserIDForContact__onceToken, &__block_literal_global_36);
    if (v5) {
      goto LABEL_3;
    }
LABEL_12:
    id v9 = 0;
    goto LABEL_13;
  }
  if (!v4) {
    goto LABEL_12;
  }
LABEL_3:
  v6 = (void *)screenTimeUserIDForContact__screenTimeUserIDForContactCache;
  v7 = [v5 identifier];
  v8 = [v6 objectForKey:v7];

  if (v8)
  {
    id v9 = v8;
  }
  else
  {
    v10 = [a1 familyMemberForContact:v5 isMe:0];
    if (v10 && [a1 isChildOrTeenFamilyMember:v10])
    {
      id v11 = objc_alloc(MEMORY[0x1E4F99D78]);
      v12 = [v10 dsid];
      v13 = (void *)[v11 initWithDSID:v12];

      v14 = (void *)screenTimeUserIDForContact__screenTimeUserIDForContactCache;
      v15 = [v5 identifier];
      [v14 setObject:v13 forKey:v15];
    }
    else
    {
      v13 = 0;
    }
    id v9 = v13;
  }
LABEL_13:

  return v9;
}

uint64_t __54__SearchUIDowntimeManager_screenTimeUserIDForContact___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = screenTimeUserIDForContact__screenTimeUserIDForContactCache;
  screenTimeUserIDForContact__screenTimeUserIDForContactCache = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (BOOL)isChildOrTeenFamilyMember:(id)a3
{
  return a3 && (unint64_t)([a3 memberType] - 1) < 2;
}

+ (id)familyMemberForContact:(id)a3 isMe:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = objc_opt_new();
  id v27 = 0;
  v7 = [v6 fetchFamilyCircleWithError:&v27];
  id v8 = v27;
  if (v8)
  {
    obj = SearchUIGeneralLog();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
      +[SearchUIDowntimeManager familyMemberForContact:isMe:]((uint64_t)v8, obj);
    }
    id v9 = 0;
  }
  else
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    obj = [v7 members];
    id v9 = (id)[obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v9)
    {
      v19 = v7;
      v20 = 0;
      v21 = v6;
      uint64_t v10 = *(void *)v24;
      if (v5) {
        BOOL v11 = 0;
      }
      else {
        BOOL v11 = v4;
      }
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(obj);
          }
          v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          v14 = objc_msgSend(v13, "contact", v19, v20, v21);
          v15 = [v14 identifier];
          v16 = [v5 identifier];
          if ([v15 isEqualToString:v16])
          {

LABEL_21:
            id v9 = v13;
            goto LABEL_22;
          }
          if (v11)
          {
            char v17 = [v13 isMe];

            if (v17) {
              goto LABEL_21;
            }
          }
          else
          {
          }
        }
        id v9 = (id)[obj countByEnumeratingWithState:&v23 objects:v28 count:16];
        if (v9) {
          continue;
        }
        break;
      }
LABEL_22:
      id v8 = v20;
      v6 = v21;
      v7 = v19;
    }
  }

  return v9;
}

+ (BOOL)screenTimeIsEnabledForContact:(id)a3
{
  v3 = [a1 screenTimeUserIDForContact:a3];
  if (v3)
  {
    BOOL v4 = objc_opt_new();
    id v10 = 0;
    id v5 = [v4 currentConfigurationForUser:v3 error:&v10];
    id v6 = v10;
    if (v6)
    {
      v7 = SearchUIGeneralLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        +[SearchUIDowntimeManager screenTimeIsEnabledForContact:]((uint64_t)v6, v7);
      }
    }
    BOOL v8 = [v5 screenTimeState] == 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken_2 != -1) {
    dispatch_once(&sharedManager_onceToken_2, &__block_literal_global_36);
  }
  v2 = (void *)sharedManager_sharedObserver_1;
  return v2;
}

uint64_t __40__SearchUIDowntimeManager_sharedManager__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedManager_sharedObserver_1;
  sharedManager_sharedObserver_1 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (SearchUIDowntimeManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)SearchUIDowntimeManager;
  v2 = [(SearchUIDowntimeManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    downtimeStatuses = v2->_downtimeStatuses;
    v2->_downtimeStatuses = (NSCache *)v3;

    uint64_t v5 = objc_opt_new();
    notificationCenter = v2->_notificationCenter;
    v2->_notificationCenter = (NSNotificationCenter *)v5;

    [(SearchUIDowntimeManager *)v2 setupSink];
  }
  return v2;
}

- (void)setupSink
{
  uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.SearchUI.SearchUIScreenTimeUtilities.queue", v3);

  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F502E8]) initWithIdentifier:@"com.apple.SearchUI.SearchUIScreenTimeUtilities.scheduler" targetQueue:v4 waking:0];
  objc_initWeak(&location, self);
  id v6 = BiomeLibrary();
  v7 = [v6 Family];
  objc_super v8 = [v7 ScreenTime];
  id v9 = [v8 ChildState];
  id v10 = [v9 DSLPublisher];
  BOOL v11 = [v10 subscribeOn:v5];

  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __36__SearchUIDowntimeManager_setupSink__block_invoke_2;
  v16 = &unk_1E6E725D0;
  objc_copyWeak(&v17, &location);
  v12 = [v11 sinkWithCompletion:&__block_literal_global_46 receiveInput:&v13];
  -[SearchUIDowntimeManager setBiomeSink:](self, "setBiomeSink:", v12, v13, v14, v15, v16);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __36__SearchUIDowntimeManager_setupSink__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  dispatch_queue_t v4 = [v3 eventBody];

  [WeakRetained updateWithChildState:v4];
}

- (int)statusForSTUserID:(id)a3 forceRecheck:(BOOL)a4
{
  id v6 = a3;
  v7 = [v6 dsid];
  objc_super v8 = [v7 stringValue];

  if (v8)
  {
    id v9 = [(SearchUIDowntimeManager *)self downtimeStatuses];
    id v10 = [v9 objectForKey:v8];

    if (a4 || !v10)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __58__SearchUIDowntimeManager_statusForSTUserID_forceRecheck___block_invoke;
      v13[3] = &unk_1E6E72938;
      id v14 = v6;
      v15 = self;
      id v16 = v8;
      +[SearchUIUtilities dispatchAsyncIfNecessary:v13];
    }
    int v11 = [v10 intValue];
  }
  else
  {
    int v11 = 0;
  }

  return v11;
}

void __58__SearchUIDowntimeManager_statusForSTUserID_forceRecheck___block_invoke(uint64_t a1)
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  uint64_t v3 = [v2 isDowntimeEnabledForUserID:*(void *)(a1 + 32)];

  dispatch_queue_t v4 = [*(id *)(a1 + 40) downtimeStatuses];
  uint64_t v5 = [NSNumber numberWithInt:v3];
  [v4 setObject:v5 forKey:*(void *)(a1 + 48)];

  id v6 = [*(id *)(a1 + 40) notificationCenter];
  uint64_t v7 = *(void *)(a1 + 48);
  v10[0] = @"userDSIDKey";
  v10[1] = @"statusKey";
  v11[0] = v7;
  objc_super v8 = [NSNumber numberWithInt:v3];
  v11[1] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  [v6 postNotificationName:@"downtimeStatusDidChangeNotification" object:0 userInfo:v9];
}

- (id)addObserverForDowntimeStatuses:(id)a3
{
  id v4 = a3;
  notificationCenter = self->_notificationCenter;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__SearchUIDowntimeManager_addObserverForDowntimeStatuses___block_invoke;
  v9[3] = &unk_1E6E725F8;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = [(NSNotificationCenter *)notificationCenter addObserverForName:@"downtimeStatusDidChangeNotification" object:0 queue:0 usingBlock:v9];

  return v7;
}

void __58__SearchUIDowntimeManager_addObserverForDowntimeStatuses___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v7 = [v3 userInfo];
  id v4 = [v7 objectForKeyedSubscript:@"userDSIDKey"];
  uint64_t v5 = [v3 userInfo];

  id v6 = [v5 objectForKeyedSubscript:@"statusKey"];
  (*(void (**)(uint64_t, void *, uint64_t))(v2 + 16))(v2, v4, [v6 intValue]);
}

- (void)removeObserver:(id)a3
{
  if (a3) {
    -[NSNotificationCenter removeObserver:](self->_notificationCenter, "removeObserver:");
  }
}

- (void)updateWithChildState:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SearchUIDowntimeManager *)self downtimeStatuses];
  int v6 = [v4 starting];
  if (v6)
  {
    id v7 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "state"));
  }
  else
  {
    id v7 = &unk_1F404B040;
  }
  objc_super v8 = [v4 userDSID];
  [v5 setObject:v7 forKey:v8];

  if (v6) {
  notificationCenter = self->_notificationCenter;
  }
  v13[0] = @"userDSIDKey";
  id v10 = [v4 userDSID];
  v13[1] = @"statusKey";
  v14[0] = v10;
  int v11 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "state"));
  v14[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  [(NSNotificationCenter *)notificationCenter postNotificationName:@"downtimeStatusDidChangeNotification" object:0 userInfo:v12];
}

- (void)dealloc
{
  id v3 = [(SearchUIDowntimeManager *)self biomeSink];
  [v3 cancel];

  v4.receiver = self;
  v4.super_class = (Class)SearchUIDowntimeManager;
  [(SearchUIDowntimeManager *)&v4 dealloc];
}

- (BPSSink)biomeSink
{
  return (BPSSink *)objc_getProperty(self, a2, 8, 1);
}

- (void)setBiomeSink:(id)a3
{
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
}

- (NSCache)downtimeStatuses
{
  return (NSCache *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downtimeStatuses, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_biomeSink, 0);
}

+ (void)familyMemberForContact:(uint64_t)a1 isMe:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E45B5000, a2, OS_LOG_TYPE_ERROR, "SearchUIPersonHeaderViewController: fetched family circle with error: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)screenTimeIsEnabledForContact:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E45B5000, a2, OS_LOG_TYPE_ERROR, "SearchUIPersonHeaderViewController: grabbed config with error: %@", (uint8_t *)&v2, 0xCu);
}

@end