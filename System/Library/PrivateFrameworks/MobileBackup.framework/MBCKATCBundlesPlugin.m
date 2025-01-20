@interface MBCKATCBundlesPlugin
- (BOOL)shouldBackgroundRestoreContentWithPolicy:(id)a3 fileInfo:(id)a4;
- (BOOL)shouldRestoreContentWithPolicy:(id)a3 fileInfo:(id)a4;
@end

@implementation MBCKATCBundlesPlugin

- (BOOL)shouldRestoreContentWithPolicy:(id)a3 fileInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[ATClientController sharedInstance];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v8 = [v7 allClients];
  id v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    id v10 = v9;
    v19 = v7;
    uint64_t v11 = *(void *)v21;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          v15 = +[MBCKManager sharedInstance];
          unsigned int v16 = [v13 shouldRestoreFile:v6 backupManager:v15];

          if (!v16)
          {
            BOOL v17 = 0;
            goto LABEL_12;
          }
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v10) {
        continue;
      }
      break;
    }
    BOOL v17 = 1;
LABEL_12:
    v7 = v19;
  }
  else
  {
    BOOL v17 = 1;
  }

  return v17;
}

- (BOOL)shouldBackgroundRestoreContentWithPolicy:(id)a3 fileInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isRestoringPrimaryAccount])
  {
    v7 = +[ATClientController sharedInstance];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = [v7 allClients];
    id v8 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v8)
    {
      v28 = v7;
      id v29 = v5;
      uint64_t v9 = *(void *)v33;
      id v10 = &selRef_setSpaceSavingsThreshold_;
      uint64_t v11 = &selRef_setSpaceSavingsThreshold_;
      while (2)
      {
        v12 = 0;
        v13 = v10[198];
        v14 = v11[197];
        do
        {
          if (*(void *)v33 != v9) {
            objc_enumerationMutation(obj);
          }
          v15 = *(void **)(*((void *)&v32 + 1) + 8 * (void)v12);
          if (objc_opt_respondsToSelector())
          {
            [v6 path];
            context = v16;
            BOOL v17 = v14;
            v18 = v13;
            id v19 = v8;
            uint64_t v20 = v9;
            v22 = id v21 = v6;
            long long v23 = +[MBCKManager sharedInstance];
            unsigned __int8 v24 = [v15 shouldBackgroundRestorePath:v22 backupManager:v23];

            id v6 = v21;
            uint64_t v9 = v20;
            id v8 = v19;
            v13 = v18;
            v14 = v17;
            unsigned int v16 = context;
            if (v24) {
              goto LABEL_15;
            }
          }
          if (objc_opt_respondsToSelector())
          {
            v25 = +[MBCKManager sharedInstance];
            unsigned __int8 v26 = [v15 shouldBackgroundRestoreFile:v6 backupManager:v25];

            if (v26)
            {
LABEL_15:
              LOBYTE(v8) = 1;
              goto LABEL_16;
            }
          }
          v12 = (char *)v12 + 1;
        }
        while (v8 != v12);
        id v8 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
        id v10 = &selRef_setSpaceSavingsThreshold_;
        uint64_t v11 = &selRef_setSpaceSavingsThreshold_;
        if (v8) {
          continue;
        }
        break;
      }
LABEL_16:
      v7 = v28;
      id v5 = v29;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return (char)v8;
}

@end