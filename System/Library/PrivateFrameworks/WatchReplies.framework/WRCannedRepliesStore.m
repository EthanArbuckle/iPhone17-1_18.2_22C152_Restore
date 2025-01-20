@interface WRCannedRepliesStore
+ (BOOL)isTinker;
+ (BOOL)supportsEnhancedEditing;
+ (id)supportedLanguages;
- (BOOL)includeSmartReplies;
- (BOOL)supportsSmartReplies;
- (BOOL)usesFormalReplies;
- (WRCannedRepliesStore)init;
- (WRCannedRepliesStore)initWithCategory:(unint64_t)a3;
- (id)cannedReplies;
- (id)domainAccessor;
- (id)keyForDefaultReply:(id)a3;
- (id)localizedDefaultReply:(id)a3;
- (id)localizedFormalDefaultReply:(id)a3;
- (id)migrateRepliesIfNeeded:(id)a3;
- (id)npsManager;
- (id)repliesForLanguage:(id)a3;
- (void)dealloc;
- (void)handleStoreChange;
- (void)invalidateCachesIfNeededForLanguage:(id)a3;
- (void)loadCannedRepliesIfNeeded;
- (void)localizeDefaultRepliesIfNeeded;
- (void)saveReplies:(id)a3;
- (void)setCannedReplies:(id)a3;
- (void)setIncludeSmartReplies:(BOOL)a3;
@end

@implementation WRCannedRepliesStore

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)WRCannedRepliesStore;
  [(WRCannedRepliesStore *)&v4 dealloc];
}

+ (BOOL)supportsEnhancedEditing
{
  v2 = [MEMORY[0x263F57730] sharedInstance];
  v3 = [v2 getActivePairedDevice];

  LOBYTE(v2) = BPSDeviceHasCapabilityForString();
  return (char)v2;
}

+ (BOOL)isTinker
{
  return 0;
}

- (WRCannedRepliesStore)init
{
  return [(WRCannedRepliesStore *)self initWithCategory:0];
}

- (WRCannedRepliesStore)initWithCategory:(unint64_t)a3
{
  v15.receiver = self;
  v15.super_class = (Class)WRCannedRepliesStore;
  objc_super v4 = [(WRCannedRepliesStore *)&v15 init];
  v5 = v4;
  if (v4)
  {
    v4->_category = a3;
    uint64_t v6 = +[WRReplyStoreInfo infoForCategory:a3];
    info = v5->_info;
    v5->_info = (WRReplyStoreInfo *)v6;

    os_log_t v8 = os_log_create("WatchReplies", "CannedReplies");
    log = v5->_log;
    v5->_log = (OS_os_log *)v8;

    v10 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x263F08AE0]);
    lock = v5->_lock;
    v5->_lock = v10;

    v12 = [(WRReplyStoreInfo *)v5->_info defaultsChangedNotificationName];
    if (v12)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)_WRCannedRepliesStore_handleStoreChange, v12, v5, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
  }
  return v5;
}

- (id)domainAccessor
{
  domainAccessor = self->_domainAccessor;
  if (!domainAccessor)
  {
    objc_super v4 = [(WRReplyStoreInfo *)self->_info defaultsDomain];
    if (v4)
    {
      v5 = (NPSDomainAccessor *)[objc_alloc(MEMORY[0x263F57520]) initWithDomain:v4];
      uint64_t v6 = self->_domainAccessor;
      self->_domainAccessor = v5;

      id v7 = (id)[(NPSDomainAccessor *)self->_domainAccessor synchronize];
    }

    domainAccessor = self->_domainAccessor;
  }

  return domainAccessor;
}

- (id)npsManager
{
  npsManager = self->_npsManager;
  if (!npsManager)
  {
    objc_super v4 = (NPSManager *)objc_alloc_init(MEMORY[0x263F57528]);
    v5 = self->_npsManager;
    self->_npsManager = v4;

    npsManager = self->_npsManager;
  }

  return npsManager;
}

- (id)repliesForLanguage:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(WRCannedRepliesStore *)self invalidateCachesIfNeededForLanguage:v4];
  v22 = v4;
  [(NSRecursiveLock *)self->_lock lock];
  if (!self->_cachedLocalizedReplies)
  {
    [(WRCannedRepliesStore *)self loadCannedRepliesIfNeeded];
    id v7 = objc_msgSend(MEMORY[0x263EFF9B0], "orderedSetWithCapacity:", -[NSArray count](self->_cannedReplies, "count"));
    BOOL v8 = [(WRCannedRepliesStore *)self usesFormalReplies];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v9 = self->_cannedReplies;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (!v10) {
      goto LABEL_20;
    }
    uint64_t v11 = *(void *)v24;
    while (1)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v14 = [v13 defaultReplyKey];

        if (v14)
        {
          objc_super v15 = [(WRCannedRepliesStore *)self localizedDefaultReply:v13];
          [v7 addObject:v15];

          if (!v8) {
            continue;
          }
          v16 = [(WRCannedRepliesStore *)self localizedFormalDefaultReply:v13];
          [v7 addObject:v16];
        }
        else
        {
          v17 = [v13 defaultReplyText];
          int v18 = [v17 isEqualToString:@"SMART_REPLIES_MARKER"];

          if (v18) {
            [v13 defaultReplyText];
          }
          else {
          v16 = [v13 text];
          }
          [v7 addObject:v16];
        }
      }
      uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (!v10)
      {
LABEL_20:

        v19 = [v7 array];
        cachedLocalizedReplies = self->_cachedLocalizedReplies;
        self->_cachedLocalizedReplies = v19;

        uint64_t v6 = self->_cachedLocalizedReplies;
        goto LABEL_21;
      }
    }
  }
  v5 = self->_log;
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEBUG)) {
    [(WRCannedRepliesStore *)buf repliesForLanguage:(os_log_t)v5];
  }

  uint64_t v6 = self->_cachedLocalizedReplies;
LABEL_21:
  [(NSRecursiveLock *)self->_lock unlock];

  return v6;
}

- (id)keyForDefaultReply:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(WRCannedRepliesStore *)self usesFormalReplies];
  [(NSRecursiveLock *)self->_lock lock];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = self->_cannedReplies;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "defaultReplyKey", (void)v19);

        if (v11)
        {
          v12 = [(WRCannedRepliesStore *)self localizedDefaultReply:v10];
          int v13 = [v12 isEqualToString:v4];

          if (v13)
          {
            v16 = [v10 defaultReplyKey];
            goto LABEL_15;
          }
          if (v5)
          {
            v14 = [(WRCannedRepliesStore *)self localizedFormalDefaultReply:v10];
            int v15 = [v14 isEqualToString:v4];

            if (v15)
            {
              v17 = [v10 defaultReplyKey];
              v16 = [v17 stringByAppendingString:@"_FORMAL"];

              goto LABEL_15;
            }
          }
        }
      }
      uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  v16 = 0;
LABEL_15:

  [(NSRecursiveLock *)self->_lock unlock];

  return v16;
}

+ (id)supportedLanguages
{
  v2 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.WatchReplies"];
  v3 = [v2 localizations];

  return v3;
}

- (id)cannedReplies
{
  [(WRCannedRepliesStore *)self invalidateCachesIfNeededForLanguage:0];
  [(WRCannedRepliesStore *)self loadCannedRepliesIfNeeded];
  [(WRCannedRepliesStore *)self localizeDefaultRepliesIfNeeded];
  cannedReplies = self->_cannedReplies;

  return cannedReplies;
}

- (void)setCannedReplies:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a3;
  [(NSRecursiveLock *)self->_lock lock];
  objc_storeStrong((id *)&self->_cannedReplies, a3);
  long long v22 = self;
  [(NSRecursiveLock *)self->_lock unlock];
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v5, "count"));
  BOOL v23 = +[WRCannedRepliesStore supportsEnhancedEditing];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v24 + 1) + 8 * v11);
        int v13 = [v12 defaultReplyText];
        int v14 = [v13 isEqualToString:@"SMART_REPLIES_MARKER"];

        if (v14)
        {
          uint64_t v15 = [v12 defaultReplyText];
LABEL_10:
          int v18 = (__CFString *)v15;
          goto LABEL_11;
        }
        v16 = [v12 text];
        uint64_t v17 = [v16 length];

        if (v17)
        {
          uint64_t v15 = [v12 text];
          goto LABEL_10;
        }
        long long v19 = [v12 defaultReplyKey];

        if (v19)
        {
          int v18 = [v12 defaultReplyKey];
          if (([(__CFString *)v18 hasSuffix:@"_FORMAL"] & 1) == 0)
          {
            if (!v23)
            {

              int v18 = &stru_26DE2D188;
            }
LABEL_11:
            [v6 addObject:v18];
          }
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v20 = [v7 countByEnumeratingWithState:&v24 objects:v30 count:16];
      uint64_t v9 = v20;
    }
    while (v20);
  }

  log = v22->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v6;
    _os_log_impl(&dword_22A5E2000, log, OS_LOG_TYPE_DEFAULT, "saving canned replies: %{public}@", buf, 0xCu);
  }
  [(WRCannedRepliesStore *)v22 saveReplies:v6];
}

- (BOOL)includeSmartReplies
{
  char v6 = 0;
  v3 = [(WRCannedRepliesStore *)self domainAccessor];
  char v4 = [v3 BOOLForKey:@"IncludeSmartRepliesKey" keyExistsAndHasValidFormat:&v6];

  if (!v6) {
    return [(WRReplyStoreInfo *)self->_info supportsSmartReplies];
  }
  return v4;
}

- (void)setIncludeSmartReplies:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(WRCannedRepliesStore *)self domainAccessor];
  [v5 setBool:v3 forKey:@"IncludeSmartRepliesKey"];

  char v6 = [(WRCannedRepliesStore *)self domainAccessor];
  id v7 = (id)[v6 synchronize];

  uint64_t v8 = [(WRCannedRepliesStore *)self npsManager];
  uint64_t v9 = [(WRReplyStoreInfo *)self->_info defaultsDomain];
  uint64_t v10 = [MEMORY[0x263EFFA08] setWithObject:@"IncludeSmartRepliesKey"];
  [v8 synchronizeNanoDomain:v9 keys:v10];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.MobileSMS.IncludeSmartRepliesKey.changed", 0, 0, 1u);
}

- (BOOL)supportsSmartReplies
{
  return [(WRReplyStoreInfo *)self->_info supportsSmartReplies];
}

- (BOOL)usesFormalReplies
{
  v2 = WRLocalizedCategoryString(@"USES_FORMAL_REPLIES", self->_category, self->_cachedLanguage);
  char v3 = [v2 BOOLValue];

  return v3;
}

- (id)localizedDefaultReply:(id)a3
{
  char v4 = [a3 defaultReplyKey];
  id v5 = WRLocalizedCategoryString(v4, self->_category, self->_cachedLanguage);

  return v5;
}

- (id)localizedFormalDefaultReply:(id)a3
{
  char v4 = [a3 defaultReplyKey];
  id v5 = [v4 stringByAppendingString:@"_FORMAL"];

  char v6 = WRLocalizedCategoryString(v5, self->_category, self->_cachedLanguage);

  return v6;
}

- (void)loadCannedRepliesIfNeeded
{
  [(NSRecursiveLock *)self->_lock lock];
  if (!self->_cannedReplies)
  {
    uint64_t v24 = 0;
    long long v25 = &v24;
    uint64_t v26 = 0x2020000000;
    char v27 = 0;
    char v3 = [(WRReplyStoreInfo *)self->_info defaultsKey];
    char v4 = [(WRCannedRepliesStore *)self domainAccessor];

    if (!v4 || !v3) {
      goto LABEL_14;
    }
    id v5 = [(WRCannedRepliesStore *)self domainAccessor];
    char v6 = [(WRReplyStoreInfo *)self->_info defaultsKey];
    id v7 = [v5 objectForKey:v6];

    uint64_t v8 = [(WRCannedRepliesStore *)self migrateRepliesIfNeeded:v7];

    uint64_t v9 = v8
       ? objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v8, "count"))
       : 0;
    BOOL v10 = +[WRCannedRepliesStore supportsEnhancedEditing];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __49__WRCannedRepliesStore_loadCannedRepliesIfNeeded__block_invoke;
    v20[3] = &unk_264881150;
    v20[4] = self;
    long long v22 = &v24;
    BOOL v23 = v10;
    id v11 = v9;
    id v21 = v11;
    [v8 enumerateObjectsUsingBlock:v20];
    v12 = v21;
    id v13 = v11;

    if (!v13)
    {
LABEL_14:
      id v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[WRReplyStoreInfo defaultCount](self->_info, "defaultCount"));
      for (unint64_t i = 0; i < [(WRReplyStoreInfo *)self->_info defaultCount]; ++i)
      {
        int v18 = objc_alloc_init(WRCannedReply);
        long long v19 = objc_msgSend(@"DEFAULT_REPLY_", "stringByAppendingFormat:", @"%tu", i);
        [(WRCannedReply *)v18 setDefaultReplyKey:v19];

        [v13 addObject:v18];
      }
    }
    if ([(id)objc_opt_class() supportsEnhancedEditing]
      && [(WRCannedRepliesStore *)self supportsSmartReplies]
      && !*((unsigned char *)v25 + 24))
    {
      int v14 = objc_alloc_init(WRCannedReply);
      [(WRCannedReply *)v14 setDefaultReplyText:@"SMART_REPLIES_MARKER"];
      [v13 insertObject:v14 atIndex:0];
    }
    uint64_t v15 = (NSArray *)[v13 copy];
    cannedReplies = self->_cannedReplies;
    self->_cannedReplies = v15;

    _Block_object_dispose(&v24, 8);
  }
  [(NSRecursiveLock *)self->_lock unlock];
}

void __49__WRCannedRepliesStore_loadCannedRepliesIfNeeded__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  if (![(id)objc_opt_class() isTinker]
    || ([*(id *)(*(void *)(a1 + 32) + 16) hiddenTinkerReplyKeys],
        id v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 containsObject:v10],
        v5,
        (v6 & 1) == 0))
  {
    id v7 = objc_alloc_init(WRCannedReply);
    if ([v10 isEqualToString:@"SMART_REPLIES_MARKER"])
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
      if (*(unsigned char *)(v8 + 24))
      {
LABEL_13:

        goto LABEL_14;
      }
      *(unsigned char *)(v8 + 24) = 1;
      [(WRCannedReply *)v7 setDefaultReplyText:v10];
    }
    else if ([v10 hasPrefix:@"DEFAULT_REPLY_"])
    {
      [(WRCannedReply *)v7 setDefaultReplyKey:v10];
    }
    else if (*(unsigned char *)(a1 + 56) || ![v10 isEqualToString:&stru_26DE2D188])
    {
      [(WRCannedReply *)v7 setText:v10];
    }
    else
    {
      uint64_t v9 = objc_msgSend(@"DEFAULT_REPLY_", "stringByAppendingFormat:", @"%tu", a3);
      [(WRCannedReply *)v7 setDefaultReplyKey:v9];
    }
    [*(id *)(a1 + 40) addObject:v7];
    goto LABEL_13;
  }
LABEL_14:
}

- (void)localizeDefaultRepliesIfNeeded
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  [(NSRecursiveLock *)self->_lock lock];
  if (!self->_didLocalizeDefaultReplies)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    char v3 = self->_cannedReplies;
    uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v12 != v5) {
            objc_enumerationMutation(v3);
          }
          id v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          uint64_t v8 = objc_msgSend(v7, "defaultReplyKey", (void)v11);

          if (v8)
          {
            uint64_t v9 = [v7 defaultReplyKey];
            id v10 = WRLocalizedCategoryString(v9, self->_category, self->_cachedLanguage);
            [v7 setDefaultReplyText:v10];
          }
        }
        uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v4);
    }

    self->_didLocalizeDefaultReplies = 1;
  }
  [(NSRecursiveLock *)self->_lock unlock];
}

- (void)invalidateCachesIfNeededForLanguage:(id)a3
{
  id obj = a3;
  if (!obj)
  {
    WRDeviceLanguage();
    id obj = (id)objc_claimAutoreleasedReturnValue();
  }
  [(NSRecursiveLock *)self->_lock lock];
  if (([obj isEqualToString:self->_cachedLanguage] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_cachedLanguage, obj);
    cachedLocalizedReplies = self->_cachedLocalizedReplies;
    self->_cachedLocalizedReplies = 0;

    self->_didLocalizeDefaultReplies = 0;
  }
  [(NSRecursiveLock *)self->_lock unlock];
}

- (void)saveReplies:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WRCannedRepliesStore *)self domainAccessor];

  if (v5)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
      -[WRCannedRepliesStore saveReplies:]((uint64_t)v4, log);
    }
    id v7 = [(WRCannedRepliesStore *)self domainAccessor];
    uint64_t v8 = [(WRReplyStoreInfo *)self->_info defaultsKey];
    [v7 setObject:v4 forKey:v8];

    uint64_t v9 = [(WRCannedRepliesStore *)self domainAccessor];
    id v10 = (id)[v9 synchronize];

    long long v11 = (void *)MEMORY[0x263EFFA08];
    long long v12 = [(WRReplyStoreInfo *)self->_info defaultsKey];
    long long v13 = objc_msgSend(v11, "setWithObjects:", v12, @"WatchRepliesVersion", 0);

    long long v14 = [(WRCannedRepliesStore *)self npsManager];
    uint64_t v15 = [(WRReplyStoreInfo *)self->_info defaultsDomain];
    [v14 synchronizeNanoDomain:v15 keys:v13];

    uint64_t v16 = [(WRReplyStoreInfo *)self->_info defaultsChangedNotificationName];
    if (v16)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, v16, 0, 0, 1u);
    }
  }
}

- (id)migrateRepliesIfNeeded:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (self->_didMigrationCheck)
  {
    id v6 = v4;
    goto LABEL_62;
  }
  id v7 = [(WRCannedRepliesStore *)self domainAccessor];
  uint64_t v8 = [v7 objectForKey:@"WatchRepliesVersion"];

  if (!v8)
  {
    uint64_t v9 = [(WRCannedRepliesStore *)self domainAccessor];
    uint64_t v8 = &unk_26DE2DF30;
    [v9 setObject:&unk_26DE2DF30 forKey:@"WatchRepliesVersion"];
  }
  unint64_t v10 = [v8 unsignedIntegerValue];
  BOOL v11 = +[WRCannedRepliesStore supportsEnhancedEditing];
  v39 = self;
  if (!v10 || v11)
  {
    if (v10) {
      BOOL v18 = 0;
    }
    else {
      BOOL v18 = v11;
    }
    if (v18)
    {
      if (!v5) {
        id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
      }
      unint64_t v19 = [v5 count];
      if (v19 >= [(WRReplyStoreInfo *)self->_info defaultCount])
      {
        uint64_t v20 = v5;
      }
      else
      {
        uint64_t v20 = (void *)[v5 mutableCopy];
        unint64_t v21 = [v20 count];
        if (v21 < [(WRReplyStoreInfo *)self->_info defaultCount])
        {
          do
          {
            [v20 addObject:&stru_26DE2D188];
            unint64_t v22 = [v20 count];
          }
          while (v22 < [(WRReplyStoreInfo *)self->_info defaultCount]);
        }
      }
      BOOL v23 = (void *)[v20 mutableCopy];
      v44[0] = MEMORY[0x263EF8330];
      v44[1] = 3221225472;
      v44[2] = __47__WRCannedRepliesStore_migrateRepliesIfNeeded___block_invoke;
      v44[3] = &unk_264881178;
      id v24 = v23;
      id v45 = v24;
      [v20 enumerateObjectsUsingBlock:v44];
      if ([v24 count])
      {
        long long v25 = [(WRCannedRepliesStore *)self domainAccessor];
        [v25 setObject:&unk_26DE2DF48 forKey:@"WatchRepliesVersion"];

        [(WRCannedRepliesStore *)self saveReplies:v24];
      }
      id v12 = v24;

      goto LABEL_37;
    }
  }
  else if ([v5 count])
  {
    id v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[WRReplyStoreInfo defaultCount](self->_info, "defaultCount"));
    if ([(WRReplyStoreInfo *)self->_info defaultCount])
    {
      unint64_t v13 = 0;
      do
      {
        if (v13 >= [v5 count])
        {
          [v12 addObject:&stru_26DE2D188];
        }
        else
        {
          long long v14 = [v5 objectAtIndexedSubscript:v13];
          if (([(__CFString *)v14 isEqualToString:@"SMART_REPLIES_MARKER"] & 1) == 0)
          {
            if ([(__CFString *)v14 hasPrefix:@"DEFAULT_REPLY_"])
            {
              uint64_t v15 = v12;
              uint64_t v16 = &stru_26DE2D188;
            }
            else
            {
              uint64_t v15 = v12;
              uint64_t v16 = v14;
            }
            [v15 addObject:v16];
          }

          self = v39;
        }
        ++v13;
      }
      while (v13 < [(WRReplyStoreInfo *)self->_info defaultCount]);
    }
    if ([v12 count])
    {
      uint64_t v17 = [(WRCannedRepliesStore *)self domainAccessor];
      [v17 setObject:&unk_26DE2DF30 forKey:@"WatchRepliesVersion"];

      [(WRCannedRepliesStore *)self saveReplies:v12];
    }

    goto LABEL_37;
  }
  id v12 = v5;
LABEL_37:
  if (v10 <= 1
    && self->_category == 1
    && ([(WRCannedRepliesStore *)self domainAccessor],
        uint64_t v26 = objc_claimAutoreleasedReturnValue(),
        [v26 setObject:&unk_26DE2DF60 forKey:@"WatchRepliesVersion"],
        v26,
        [v12 count]))
  {
    v38 = v8;
    id v27 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v28 = v12;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v41 != v31) {
            objc_enumerationMutation(v28);
          }
          v33 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          if (objc_msgSend(v33, "isEqualToString:", @"SMART_REPLIES_MARKER", v38)
            || ![v33 hasPrefix:@"DEFAULT_REPLY_"])
          {
            [v27 addObject:v33];
          }
          else
          {
            v34 = objc_alloc_init(WRCannedReply);
            [(WRCannedReply *)v34 setDefaultReplyKey:v33];
            if ([(WRCannedRepliesStore *)self usesFormalReplies]) {
              [(WRCannedRepliesStore *)self localizedFormalDefaultReply:v34];
            }
            else {
            v35 = [(WRCannedRepliesStore *)self localizedDefaultReply:v34];
            }
            if (([v35 isEqualToString:v33] & 1) == 0) {
              [v27 addObject:v33];
            }

            self = v39;
          }
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v40 objects:v46 count:16];
      }
      while (v30);
    }

    if ([v27 count])
    {
      uint64_t v36 = [v27 count];
      if (v36 != [v28 count]) {
        [(WRCannedRepliesStore *)self saveReplies:v27];
      }
    }

    uint64_t v8 = v38;
  }
  else
  {
    id v27 = v12;
  }
  self->_didMigrationCheck = 1;
  id v6 = v27;

LABEL_62:

  return v6;
}

void __47__WRCannedRepliesStore_migrateRepliesIfNeeded___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (![a2 length])
  {
    objc_msgSend(@"DEFAULT_REPLY_", "stringByAppendingFormat:", @"%tu", a3);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) setObject:v5 atIndexedSubscript:a3];
  }
}

- (void)handleStoreChange
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v11 = 0;
    _os_log_impl(&dword_22A5E2000, log, OS_LOG_TYPE_DEFAULT, "canned replies did change", v11, 2u);
  }
  id v4 = [(WRCannedRepliesStore *)self domainAccessor];
  id v5 = (id)[v4 synchronize];

  [(NSRecursiveLock *)self->_lock lock];
  cachedLanguage = self->_cachedLanguage;
  self->_cachedLanguage = 0;

  cachedLocalizedReplies = self->_cachedLocalizedReplies;
  self->_cachedLocalizedReplies = 0;

  cannedReplies = self->_cannedReplies;
  self->_cannedReplies = 0;

  self->_didMigrationCheck = 0;
  [(NSRecursiveLock *)self->_lock unlock];
  uint64_t v9 = [MEMORY[0x263F08A00] defaultCenter];
  unint64_t v10 = [(WRReplyStoreInfo *)self->_info defaultsChangedNotificationName];
  [v9 postNotificationName:v10 object:self];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_npsManager, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_domainAccessor, 0);
  objc_storeStrong((id *)&self->_cannedReplies, 0);
  objc_storeStrong((id *)&self->_cachedLocalizedReplies, 0);
  objc_storeStrong((id *)&self->_cachedLanguage, 0);

  objc_storeStrong((id *)&self->_info, 0);
}

- (void)repliesForLanguage:(os_log_t)log .cold.1(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134349056;
  *(void *)(buf + 4) = a2;
  _os_log_debug_impl(&dword_22A5E2000, log, OS_LOG_TYPE_DEBUG, "using cached replies: (count: %{public}lu)", buf, 0xCu);
}

- (void)saveReplies:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_22A5E2000, a2, OS_LOG_TYPE_DEBUG, "saving canned replies: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end