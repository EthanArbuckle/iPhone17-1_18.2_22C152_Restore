@interface SSVFamilyContentDeletionEvent
+ (id)notificationPayloadWithAccountPairs:(id)a3;
+ (void)postDistributedNotificationWithAccountPairs:(id)a3;
- (NSArray)deletedAccounts;
- (SSVFamilyContentDeletionEvent)initWithNotificationUserInfo:(id)a3;
- (SSVFamilyContentDeletionEvent)initWithXPCEventStreamEvent:(id)a3;
@end

@implementation SSVFamilyContentDeletionEvent

- (SSVFamilyContentDeletionEvent)initWithNotificationUserInfo:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)SSVFamilyContentDeletionEvent;
  v5 = [(SSVFamilyContentDeletionEvent *)&v39 init];
  if (v5)
  {
    id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v6 = [v4 objectForKey:@"pairs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v30 = v5;
      id v31 = v4;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      v29 = v6;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        unint64_t v10 = 0x1E4F1C000uLL;
        uint64_t v11 = *(void *)v36;
        v12 = @"did";
        id v32 = v7;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v36 != v11) {
              objc_enumerationMutation(v7);
            }
            v14 = *(void **)(*((void *)&v35 + 1) + 8 * v13);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v15 = [v14 objectForKey:v12];
              v16 = [v14 objectForKey:@"fid"];
              v17 = [v14 objectForKey:@"pid"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    v34 = [SSVFamilyAccountPair alloc];
                    v18 = v12;
                    uint64_t v19 = [v15 unsignedLongLongValue];
                    unint64_t v20 = v10;
                    uint64_t v21 = [v17 unsignedLongLongValue];
                    uint64_t v22 = [v16 unsignedLongLongValue];
                    uint64_t v23 = v19;
                    v12 = v18;
                    uint64_t v24 = v21;
                    unint64_t v10 = v20;
                    v25 = [(SSVFamilyAccountPair *)v34 initWithDownloaderAccountIdentifier:v23 purchaserAccountIdentifier:v24 familyIdentifier:v22];
                    [v33 addObject:v25];

                    id v7 = v32;
                  }
                }
              }
            }
            ++v13;
          }
          while (v9 != v13);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v35 objects:v40 count:16];
        }
        while (v9);
      }

      v5 = v30;
      id v4 = v31;
      v6 = v29;
    }
    uint64_t v26 = objc_msgSend(v33, "copy", v29, v30, v31);
    deletedAccounts = v5->_deletedAccounts;
    v5->_deletedAccounts = (NSArray *)v26;
  }
  return v5;
}

- (SSVFamilyContentDeletionEvent)initWithXPCEventStreamEvent:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SSVFamilyContentDeletionEvent;
  v5 = [(SSVFamilyContentDeletionEvent *)&v18 init];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v4)
    {
      uint64_t v7 = MEMORY[0x1A62689E0](v4);
      uint64_t v8 = MEMORY[0x1E4F14590];
      if (v7 == MEMORY[0x1E4F14590])
      {
        uint64_t v9 = xpc_dictionary_get_value(v4, "UserInfo");
        unint64_t v10 = (void *)v9;
        if (v9 && MEMORY[0x1A62689E0](v9) == v8)
        {
          uint64_t v11 = xpc_dictionary_get_value(v10, "pairs");
          v12 = (void *)v11;
          if (v11 && MEMORY[0x1A62689E0](v11) == MEMORY[0x1E4F14568])
          {
            applier[0] = MEMORY[0x1E4F143A8];
            applier[1] = 3221225472;
            applier[2] = __61__SSVFamilyContentDeletionEvent_initWithXPCEventStreamEvent___block_invoke;
            applier[3] = &unk_1E5BA73C8;
            id v17 = v6;
            xpc_array_apply(v12, applier);
          }
        }
      }
    }
    uint64_t v13 = [v6 copy];
    deletedAccounts = v5->_deletedAccounts;
    v5->_deletedAccounts = (NSArray *)v13;
  }
  return v5;
}

uint64_t __61__SSVFamilyContentDeletionEvent_initWithXPCEventStreamEvent___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A62689E0](v4) == MEMORY[0x1E4F14590])
  {
    id v6 = xpc_dictionary_get_value(v5, "did");
    uint64_t v7 = xpc_dictionary_get_value(v5, "fid");
    uint64_t v8 = xpc_dictionary_get_value(v5, "pid");
    if (v6)
    {
      uint64_t v9 = MEMORY[0x1A62689E0](v6);
      uint64_t v10 = MEMORY[0x1E4F145C0];
      if (v9 == MEMORY[0x1E4F145C0] && v7 && MEMORY[0x1A62689E0](v7) == v10 && v8 && MEMORY[0x1A62689E0](v8) == v10)
      {
        uint64_t v11 = [SSVFamilyAccountPair alloc];
        int64_t value = xpc_int64_get_value(v6);
        int64_t v13 = xpc_int64_get_value(v8);
        v14 = [(SSVFamilyAccountPair *)v11 initWithDownloaderAccountIdentifier:value purchaserAccountIdentifier:v13 familyIdentifier:xpc_int64_get_value(v7)];
        [*(id *)(a1 + 32) addObject:v14];
      }
    }
  }
  return 1;
}

+ (id)notificationPayloadWithAccountPairs:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v9, "downloaderAccountIdentifier"));
        [v10 setObject:v11 forKey:@"did"];

        v12 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v9, "familyIdentifier"));
        [v10 setObject:v12 forKey:@"fid"];

        int64_t v13 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v9, "purchaserAccountIdentifier"));
        [v10 setObject:v13 forKey:@"pid"];

        [v4 addObject:v10];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  if ([v4 count]) {
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v4, @"pairs", 0);
  }
  else {
    v14 = 0;
  }

  return v14;
}

+ (void)postDistributedNotificationWithAccountPairs:(id)a3
{
  id v3 = [a1 notificationPayloadWithAccountPairs:a3];
  if (v3)
  {
    id v6 = v3;
    CFDictionaryRef v4 = v3;
    DistributedCenter = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterPostNotification(DistributedCenter, @"com.apple.StoreServices.SSVFamilyContentDeletionNotification", 0, v4, 0);
    CFRelease(v4);
    id v3 = v6;
  }
}

- (NSArray)deletedAccounts
{
  return self->_deletedAccounts;
}

- (void).cxx_destruct
{
}

@end