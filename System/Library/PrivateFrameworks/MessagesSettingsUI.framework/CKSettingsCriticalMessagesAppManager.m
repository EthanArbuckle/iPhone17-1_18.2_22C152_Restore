@interface CKSettingsCriticalMessagesAppManager
- (CKSettingsCriticalMessagesAppManager)init;
- (NSMutableArray)appList;
- (id)criticalMessagesAppForBundleID:(id)a3;
- (id)criticalMessagesApps;
- (void)setActive:(BOOL)a3 forPhoneNumber:(id)a4 inAppForBundle:(id)a5;
- (void)setAppList:(id)a3;
@end

@implementation CKSettingsCriticalMessagesAppManager

- (CKSettingsCriticalMessagesAppManager)init
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  v33.receiver = self;
  v33.super_class = (Class)CKSettingsCriticalMessagesAppManager;
  v21 = [(CKSettingsCriticalMessagesAppManager *)&v33 init];
  if (v21)
  {
    v2 = [MEMORY[0x263F4AF28] appBundleIDs];
    id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
    [(CKSettingsCriticalMessagesAppManager *)v21 setAppList:v3];

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = v2;
    uint64_t v22 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v22)
    {
      uint64_t v20 = *(void *)v30;
      do
      {
        uint64_t v4 = 0;
        do
        {
          if (*(void *)v30 != v20) {
            objc_enumerationMutation(obj);
          }
          uint64_t v23 = *(void *)(*((void *)&v29 + 1) + 8 * v4);
          uint64_t v24 = v4;
          v5 = objc_msgSend(MEMORY[0x263F4AF28], "recipientsForBundleID:");
          id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          v7 = [v5 allKeys];
          uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v34 count:16];
          if (v8)
          {
            uint64_t v9 = v8;
            uint64_t v10 = *(void *)v26;
            do
            {
              for (uint64_t i = 0; i != v9; ++i)
              {
                if (*(void *)v26 != v10) {
                  objc_enumerationMutation(v7);
                }
                uint64_t v12 = *(void *)(*((void *)&v25 + 1) + 8 * i);
                v13 = [v5 objectForKey:v12];
                int v14 = [v13 intValue];

                v15 = [[CKSettingsCriticalMessagesAppRecipient alloc] initWithRecipient:v12 isActive:v14 == 2];
                [v6 addObject:v15];
              }
              uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v34 count:16];
            }
            while (v9);
          }

          v16 = [(CKSettingsCriticalMessagesAppManager *)v21 appList];
          v17 = [[CKSettingsCriticalMessagesApp alloc] initWithBundleID:v23 recipients:v6];
          [v16 addObject:v17];

          uint64_t v4 = v24 + 1;
        }
        while (v24 + 1 != v22);
        uint64_t v22 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
      }
      while (v22);
    }
  }
  return v21;
}

- (id)criticalMessagesApps
{
  v2 = (void *)[(NSMutableArray *)self->_appList copy];
  return v2;
}

- (id)criticalMessagesAppForBundleID:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(CKSettingsCriticalMessagesAppManager *)self criticalMessagesApps];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 bundleID];
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)setActive:(BOOL)a3 forPhoneNumber:(id)a4 inAppForBundle:(id)a5
{
  BOOL v6 = a3;
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v10 = self->_appList;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v38;
    long long v31 = v10;
    id v32 = v9;
    unsigned int v30 = v6;
    uint64_t v29 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v38 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        long long v16 = objc_msgSend(v15, "bundleID", v29);
        int v17 = [v16 isEqualToString:v9];

        if (v17)
        {
          long long v35 = 0u;
          long long v36 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          uint64_t v18 = [v15 recipients];
          uint64_t v19 = [v18 countByEnumeratingWithState:&v33 objects:v41 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v34;
            while (2)
            {
              for (uint64_t j = 0; j != v20; ++j)
              {
                if (*(void *)v34 != v21) {
                  objc_enumerationMutation(v18);
                }
                uint64_t v23 = *(void **)(*((void *)&v33 + 1) + 8 * j);
                uint64_t v24 = [v23 number];
                int v25 = [v8 isEqual:v24];

                if (v25)
                {
                  if ([v23 isActive] != v30)
                  {
                    [v23 setActive:v30];
                    long long v26 = [MEMORY[0x263F08A00] defaultCenter];
                    [v26 postNotificationName:@"CKSettingsCriticalMessagesAppsChangedNotification" object:0];
                  }
                  long long v27 = (void *)MEMORY[0x263F4AF28];
                  long long v28 = [v23 getIMRecipient];
                  id v9 = v32;
                  [v27 toggleEnablement:v30 forRecipient:v28 inAppBundleID:v32];

                  uint64_t v10 = v31;
                  goto LABEL_22;
                }
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v33 objects:v41 count:16];
              if (v20) {
                continue;
              }
              break;
            }
          }

          uint64_t v10 = v31;
          id v9 = v32;
          uint64_t v13 = v29;
        }
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v12);
  }
LABEL_22:
}

- (NSMutableArray)appList
{
  return self->_appList;
}

- (void)setAppList:(id)a3
{
}

- (void).cxx_destruct
{
}

@end