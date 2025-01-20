@interface SUAlertPresentationManager
+ (SUAlertPresentationManager)sharedInstance;
- (BOOL)_presentAlert:(id)a3 animated:(BOOL)a4;
- (BOOL)isPresentingAlertsOfClass:(Class)a3;
- (SUAlertPresentationManager)init;
- (id)_presentedAlerts;
- (id)_presentedAlertsOfClass:(Class)a3;
- (void)_dismissAlert:(id)a3 animated:(BOOL)a4;
- (void)_dismissAlertsOfClass:(Class)a3 animated:(BOOL)a4;
- (void)_dismissAllAlertsExcludingClasses:(id)a3 animated:(BOOL)a4;
- (void)_noteAlertDeactivated:(id)a3;
- (void)_updateAlert:(id)a3 animated:(BOOL)a4;
- (void)_updateAllAlertLockState:(BOOL)a3;
- (void)dismissAllAlertsAnimated:(BOOL)a3;
@end

@implementation SUAlertPresentationManager

+ (SUAlertPresentationManager)sharedInstance
{
  if (sharedInstance___once_1 != -1) {
    dispatch_once(&sharedInstance___once_1, &__block_literal_global_7);
  }
  v2 = (void *)sharedInstance___instance_3;
  return (SUAlertPresentationManager *)v2;
}

uint64_t __44__SUAlertPresentationManager_sharedInstance__block_invoke()
{
  sharedInstance___instance_3 = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (SUAlertPresentationManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)SUAlertPresentationManager;
  v2 = [(SUAlertPresentationManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    alerts = v2->_alerts;
    v2->_alerts = (NSMutableArray *)v3;
  }
  return v2;
}

- (id)_presentedAlerts
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [MEMORY[0x263EFFA08] setWithArray:v2->_alerts];
  objc_sync_exit(v2);

  return v3;
}

- (id)_presentedAlertsOfClass:(Class)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = self;
  objc_sync_enter(v3);
  v4 = [MEMORY[0x263EFF9C0] set];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = v3->_alerts;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v4, "addObject:", v9, (void)v11);
        }
      }
      uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  objc_sync_exit(v3);
  return v4;
}

- (BOOL)_presentAlert:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  uint64_t v6 = SULogAlerts();
  SULogInfoForSubsystem(v6, @"[Alerts] Presenting alert: %@", v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  long long v13 = self;
  objc_sync_enter(v13);
  int v14 = [v5 present];
  if (v14)
  {
    if (([(NSMutableArray *)v13->_alerts containsObject:v5] & 1) == 0) {
      [(NSMutableArray *)v13->_alerts addObject:v5];
    }
  }
  else
  {
    v15 = SULogAlerts();
    SULogInfoForSubsystem(v15, @"[Alerts] Failed presenting alert: %@", v16, v17, v18, v19, v20, v21, (uint64_t)v5);
  }
  objc_sync_exit(v13);

  return v14;
}

- (void)_dismissAlert:(id)a3 animated:(BOOL)a4
{
  id v11 = a3;
  v4 = SULogAlerts();
  SULogInfoForSubsystem(v4, @"[Alerts] Dismissing alert: %@", v5, v6, v7, v8, v9, v10, (uint64_t)v11);

  [v11 dismiss];
}

- (void)_dismissAlertsOfClass:(Class)a3 animated:(BOOL)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v6 = SULogAlerts();
  SULogInfoForSubsystem(v6, @"[Alerts] Dismissing alerts of class: %@", v7, v8, v9, v10, v11, v12, (uint64_t)a3);

  long long v13 = self;
  objc_sync_enter(v13);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  int v14 = v13->_alerts;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v20;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = *(void **)(*((void *)&v19 + 1) + 8 * v17);
        if (objc_opt_isKindOfClass()) {
          [v18 dismiss];
        }
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v15);
  }

  objc_sync_exit(v13);
}

- (void)_dismissAllAlertsExcludingClasses:(id)a3 animated:(BOOL)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = SULogAlerts();
  SULogInfoForSubsystem(v6, @"[Alerts] Dismissing all alerts excluding classes: %@", v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  long long v13 = self;
  objc_sync_enter(v13);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obj = v13;
  int v14 = v13->_alerts;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v29;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v29 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = *(void **)(*((void *)&v28 + 1) + 8 * v17);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v19 = v5;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v25;
          while (2)
          {
            uint64_t v22 = 0;
            do
            {
              if (*(void *)v25 != v21) {
                objc_enumerationMutation(v19);
              }
              if (objc_opt_isKindOfClass())
              {

                goto LABEL_16;
              }
              ++v22;
            }
            while (v20 != v22);
            uint64_t v20 = [v19 countByEnumeratingWithState:&v24 objects:v32 count:16];
            if (v20) {
              continue;
            }
            break;
          }
        }

        [v18 dismiss];
LABEL_16:
        ++v17;
      }
      while (v17 != v15);
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v15);
  }

  objc_sync_exit(obj);
}

- (void)_updateAlert:(id)a3 animated:(BOOL)a4
{
  id v11 = a3;
  v4 = SULogAlerts();
  SULogInfoForSubsystem(v4, @"[Alerts] Updating alert: %@", v5, v6, v7, v8, v9, v10, (uint64_t)v11);

  [v11 update];
}

- (void)_updateAllAlertLockState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v5 = SULogAlerts();
  uint64_t v12 = v5;
  long long v13 = @"NO";
  if (v3) {
    long long v13 = @"YES";
  }
  SULogInfoForSubsystem(v5, @"[Alerts] Updating alert lock state to isUILocked: %@", v6, v7, v8, v9, v10, v11, (uint64_t)v13);

  int v14 = self;
  objc_sync_enter(v14);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v15 = v14->_alerts;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v15);
        }
        id v19 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        [v19 setIsUILocked:v3];
        [v19 update];
      }
      uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v16);
  }

  objc_sync_exit(v14);
}

- (BOOL)isPresentingAlertsOfClass:(Class)a3
{
  BOOL v3 = [(SUAlertPresentationManager *)self presentedAlertsOfClass:a3];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (void)dismissAllAlertsAnimated:(BOOL)a3
{
}

- (void)_noteAlertDeactivated:(id)a3
{
  id v5 = a3;
  BOOL v4 = self;
  objc_sync_enter(v4);
  [(NSMutableArray *)v4->_alerts removeObject:v5];
  objc_sync_exit(v4);
}

- (void).cxx_destruct
{
}

@end