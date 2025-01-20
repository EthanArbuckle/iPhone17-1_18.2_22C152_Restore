@interface WFHomeScreenController
+ (WFHomeScreenController)sharedInstance;
+ (id)iconImageForIcon:(id)a3;
+ (id)iconImageWithSymbolName:(id)a3 backgroundColor:(id)a4 roundCorners:(BOOL)a5;
+ (void)migrateOpenAppWebClipsIfNeededWithDatabaseAccessor:(id)a3;
+ (void)migratePreYukonWebClipsIfNeeded;
+ (void)migrateWebClipsIfNeededWithDatabaseAccessor:(id)a3;
- (BOOL)addAppShortcutToHomeScreen:(id)a3 withName:(id)a4 image:(id)a5 error:(id *)a6;
- (BOOL)addAppShortcutToHomeScreen:(id)a3 withName:(id)a4 symbolName:(id)a5 backgroundColor:(id)a6 error:(id *)a7;
- (BOOL)addTopHitToHomeScreen:(id)a3 withName:(id)a4 symbolName:(id)a5 backgroundColor:(id)a6 error:(id *)a7;
- (BOOL)addWorkflowToHomeScreen:(id)a3 withName:(id)a4 icon:(id)a5 error:(id *)a6;
- (BOOL)addWorkflowToHomeScreen:(id)a3 withName:(id)a4 image:(id)a5 error:(id *)a6;
- (BOOL)addWorkflowToHomeScreen:(id)a3 withName:(id)a4 symbolName:(id)a5 backgroundColor:(id)a6 error:(id *)a7;
- (BOOL)createHomeScreenShortcutForAppShortcut:(id)a3 title:(id)a4 image:(id)a5 darkImage:(id)a6 tintableImage:(id)a7 error:(id *)a8;
- (BOOL)createHomeScreenShortcutForWorkflow:(id)a3 name:(id)a4 image:(id)a5 darkImage:(id)a6 tintableImage:(id)a7 error:(id *)a8;
- (NSMutableSet)homeScreenShortcutIDs;
- (OS_dispatch_queue)queue;
- (WFDatabase)database;
- (WFHomeScreenController)init;
- (void)databaseDidChange:(id)a3 modified:(id)a4 inserted:(id)a5 removed:(id)a6;
- (void)getHomeScreenShortcutIDsWithCompletionHandler:(id)a3;
- (void)startListeningForDatabaseChanges;
- (void)updateWebClipIfNeeded:(id)a3;
@end

@implementation WFHomeScreenController

- (void)startListeningForDatabaseChanges
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = [(WFHomeScreenController *)self database];

  if (v3)
  {
    v4 = getWFHomescreenLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[WFHomeScreenController startListeningForDatabaseChanges]";
      _os_log_impl(&dword_1C7F0A000, v4, OS_LOG_TYPE_INFO, "%s Attempted to start database listening, but we are already listening", buf, 0xCu);
    }
  }
  else
  {
    v5 = +[WFDatabase defaultDatabase];
    if (v5)
    {
      v4 = v5;
      objc_storeStrong((id *)&self->_database, v5);
      v6 = getWFHomescreenLogObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v12 = "-[WFHomeScreenController startListeningForDatabaseChanges]";
        _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_DEFAULT, "%s Starting to observe database changes", buf, 0xCu);
      }

      v7 = [(WFHomeScreenController *)self queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __58__WFHomeScreenController_startListeningForDatabaseChanges__block_invoke;
      block[3] = &unk_1E6558B28;
      block[4] = self;
      dispatch_async(v7, block);

      v8 = [(WFHomeScreenController *)self database];
      [v8 addObjectObserver:self];
    }
    else
    {
      v9 = getWFHomescreenLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v12 = "-[WFHomeScreenController startListeningForDatabaseChanges]";
        _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_ERROR, "%s Trying to start observing changes with on a process with no default database", buf, 0xCu);
      }

      v4 = 0;
    }
  }
}

- (WFDatabase)database
{
  return self->_database;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

+ (WFHomeScreenController)sharedInstance
{
  if (sharedInstance_onceToken_57263 != -1) {
    dispatch_once(&sharedInstance_onceToken_57263, &__block_literal_global_57264);
  }
  v2 = (void *)sharedInstance_controller;
  return (WFHomeScreenController *)v2;
}

void __40__WFHomeScreenController_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(WFHomeScreenController);
  v1 = (void *)sharedInstance_controller;
  sharedInstance_controller = (uint64_t)v0;
}

- (WFHomeScreenController)init
{
  v11.receiver = self;
  v11.super_class = (Class)WFHomeScreenController;
  v2 = [(WFHomeScreenController *)&v11 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    homeScreenShortcutIDs = v2->_homeScreenShortcutIDs;
    v2->_homeScreenShortcutIDs = (NSMutableSet *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.shortcuts.WFHomeScreenController", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v9 = v2;
  }

  return v2;
}

void __58__WFHomeScreenController_startListeningForDatabaseChanges__block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = [(objc_class *)getUIWebClipClass() webClips];
  uint64_t v2 = [obj countByEnumeratingWithState:&v15 objects:v31 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v16 != v4) {
          objc_enumerationMutation(obj);
        }
        v6 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        dispatch_queue_t v7 = getWFHomescreenLogObject();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v8 = [v6 title];
          v9 = [v6 shortcutIdentifier];
          v10 = [v6 pageURL];
          objc_super v11 = [v6 applicationBundleIdentifier];
          *(_DWORD *)buf = 136316418;
          v20 = "-[WFHomeScreenController startListeningForDatabaseChanges]_block_invoke";
          __int16 v21 = 2112;
          v22 = v6;
          __int16 v23 = 2112;
          v24 = v8;
          __int16 v25 = 2114;
          v26 = v9;
          __int16 v27 = 2112;
          v28 = v10;
          __int16 v29 = 2112;
          v30 = v11;
          _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_DEFAULT, "%s Considering web clip: %@, title: %@, shortcutIdentifier: %{public}@, pageURL: %@, applicationBundleID: %@", buf, 0x3Eu);
        }
        v12 = [v6 shortcutIdentifier];
        if (v12)
        {
          [*(id *)(a1 + 32) updateWebClipIfNeeded:v6];
          uint64_t v13 = [*(id *)(a1 + 32) homeScreenShortcutIDs];
          [v13 addObject:v12];
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v15 objects:v31 count:16];
    }
    while (v3);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeScreenShortcutIDs, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

- (NSMutableSet)homeScreenShortcutIDs
{
  return self->_homeScreenShortcutIDs;
}

- (void)databaseDidChange:(id)a3 modified:(id)a4 inserted:(id)a5 removed:(id)a6
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if ([v7 count])
  {
    v8 = [(WFHomeScreenController *)self queue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __70__WFHomeScreenController_databaseDidChange_modified_inserted_removed___block_invoke;
    v10[3] = &unk_1E6558938;
    objc_super v11 = v7;
    v12 = self;
    dispatch_async(v8, v10);

    v9 = v11;
  }
  else
  {
    v9 = getWFHomescreenLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[WFHomeScreenController databaseDidChange:modified:inserted:removed:]";
      _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_DEFAULT, "%s Database did change, but no shortcuts were modified", buf, 0xCu);
    }
  }
}

void __70__WFHomeScreenController_databaseDidChange_modified_inserted_removed___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v37 objects:v50 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v38;
    uint64_t v28 = *(void *)v38;
    id v29 = v2;
    do
    {
      uint64_t v6 = 0;
      uint64_t v30 = v4;
      do
      {
        if (*(void *)v38 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v37 + 1) + 8 * v6);
        if (!objc_msgSend(v7, "objectType", v28, v29))
        {
          v8 = [*(id *)(v1 + 40) homeScreenShortcutIDs];
          v9 = [v7 identifier];
          int v10 = [v8 containsObject:v9];

          if (v10)
          {
            uint64_t v31 = v6;
            long long v35 = 0u;
            long long v36 = 0u;
            long long v33 = 0u;
            long long v34 = 0u;
            objc_super v11 = [(objc_class *)getUIWebClipClass() webClips];
            uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v49 count:16];
            if (v12)
            {
              uint64_t v13 = v12;
              uint64_t v14 = *(void *)v34;
              do
              {
                uint64_t v15 = 0;
                uint64_t v32 = v13;
                do
                {
                  if (*(void *)v34 != v14) {
                    objc_enumerationMutation(v11);
                  }
                  long long v16 = *(void **)(*((void *)&v33 + 1) + 8 * v15);
                  long long v17 = [v16 shortcutIdentifier];
                  long long v18 = [v7 identifier];
                  int v19 = [v17 isEqualToString:v18];

                  if (v19)
                  {
                    v20 = getWFHomescreenLogObject();
                    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                    {
                      __int16 v21 = [v16 title];
                      v22 = [v16 identifier];
                      [v7 identifier];
                      uint64_t v23 = v14;
                      v24 = v7;
                      __int16 v25 = v11;
                      __int16 v27 = v26 = v1;
                      *(_DWORD *)buf = 136315906;
                      v42 = "-[WFHomeScreenController databaseDidChange:modified:inserted:removed:]_block_invoke";
                      __int16 v43 = 2112;
                      v44 = v21;
                      __int16 v45 = 2112;
                      v46 = v22;
                      __int16 v47 = 2112;
                      v48 = v27;
                      _os_log_impl(&dword_1C7F0A000, v20, OS_LOG_TYPE_DEFAULT, "%s Found webclip (title %@, id %@) that matches shortcut %@... Assessing migration", buf, 0x2Au);

                      uint64_t v1 = v26;
                      objc_super v11 = v25;
                      id v7 = v24;
                      uint64_t v14 = v23;
                      uint64_t v13 = v32;
                    }
                    [*(id *)(v1 + 40) updateWebClipIfNeeded:v16];
                  }
                  ++v15;
                }
                while (v13 != v15);
                uint64_t v13 = [v11 countByEnumeratingWithState:&v33 objects:v49 count:16];
              }
              while (v13);
            }

            uint64_t v5 = v28;
            id v2 = v29;
            uint64_t v4 = v30;
            uint64_t v6 = v31;
          }
        }
        ++v6;
      }
      while (v6 != v4);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v37 objects:v50 count:16];
    }
    while (v4);
  }
}

- (void)updateWebClipIfNeeded:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(WFHomeScreenController *)self queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [v4 shortcutIdentifier];
  id v7 = [(WFHomeScreenController *)self database];
  int v8 = WFUpdateWebClipForShortcutIfNeeded(v4, v6, v7);

  if (v8)
  {
    v9 = getWFHomescreenLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = [v4 identifier];
      int v13 = 136315394;
      uint64_t v14 = "-[WFHomeScreenController updateWebClipIfNeeded:]";
      __int16 v15 = 2112;
      long long v16 = v10;
      _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_INFO, "%s Updated web clip %@, pinging SpringBoard", (uint8_t *)&v13, 0x16u);
    }
    Class SBSWebClipServiceClass = getSBSWebClipServiceClass();
    uint64_t v12 = [v4 identifier];
    [(objc_class *)SBSWebClipServiceClass updateWebClipPropertiesWithIdentifier:v12];
  }
}

- (void)getHomeScreenShortcutIDsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFHomeScreenController *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__WFHomeScreenController_getHomeScreenShortcutIDsWithCompletionHandler___block_invoke;
  block[3] = &unk_1E6558678;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

void __72__WFHomeScreenController_getHomeScreenShortcutIDsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = objc_opt_new();
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [(objc_class *)getUIWebClipClass() webClips];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(*((void *)&v9 + 1) + 8 * v7) shortcutIdentifier];
        if (v8) {
          [v2 addObject:v8];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)createHomeScreenShortcutForAppShortcut:(id)a3 title:(id)a4 image:(id)a5 darkImage:(id)a6 tintableImage:(id)a7 error:(id *)a8
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = [a3 base64ArchivedData];
  if ([v17 length])
  {
    long long v18 = [NSString stringWithFormat:@"%@%@", *MEMORY[0x1E4FB4DB8], v17];
    int v19 = [MEMORY[0x1E4F29128] UUID];
    v20 = [v19 UUIDString];
    __int16 v21 = [v20 stringByReplacingOccurrencesOfString:@"-" withString:&stru_1F229A4D8];

    id v22 = objc_alloc_init(getUIWebClipClass());
    [v22 setTitle:v13];
    [v22 setIdentifier:v21];
    [v22 setShortcutIdentifier:v18];
    uint64_t v23 = [MEMORY[0x1E4F1CB10] URLWithString:@"shortcuts://run-app-shortcut"];
    [v22 setPageURL:v23];

    [v22 setApplicationBundleIdentifier:*MEMORY[0x1E4FB4BB8]];
    [v22 setFullScreen:1];
    if (v14) {
      [v22 setIconImage:v14 isPrecomposed:0];
    }
    if (v15) {
      [v22 setDarkIconImage:v15];
    }
    if (v16) {
      [v22 setTintableIconImage:v16];
    }
    id v41 = v15;
    id v24 = v14;
    if ([v22 createOnDisk])
    {
      __int16 v25 = softLinkSBSSpringBoardServerPort();
      uint64_t v26 = [v21 cStringUsingEncoding:4];
      unsigned int v27 = softLinkSBAddWebClipToHomeScreen((uint64_t)v25, v26);
      uint64_t v28 = a8;
      LOBYTE(a8) = v27 == 0;
      if (!v28 || !v27) {
        goto LABEL_19;
      }
      id v29 = v28;
      id v40 = v13;
      uint64_t v30 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v42 = *MEMORY[0x1E4F28568];
      WFLocalizedString(@"Unable to add Home Screen icon.");
      a8 = (id *)objc_claimAutoreleasedReturnValue();
      __int16 v43 = a8;
      uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
      uint64_t v32 = v30;
      uint64_t v33 = 2;
    }
    else
    {
      if (!a8)
      {
LABEL_19:

        id v14 = v24;
        id v15 = v41;
        goto LABEL_20;
      }
      id v29 = a8;
      id v40 = v13;
      long long v38 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v44 = *MEMORY[0x1E4F28568];
      WFLocalizedString(@"Unable to save Home Screen icon.");
      a8 = (id *)objc_claimAutoreleasedReturnValue();
      __int16 v45 = a8;
      uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
      uint64_t v32 = v38;
      uint64_t v33 = 1;
    }
    *id v29 = [v32 errorWithDomain:@"WFAddToHomeScreenErrorDomain" code:v33 userInfo:v31];

    LOBYTE(a8) = 0;
    id v13 = v40;
    goto LABEL_19;
  }
  long long v34 = getWFHomescreenLogObject();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v49 = "-[WFHomeScreenController createHomeScreenShortcutForAppShortcut:title:image:darkImage:tintableImage:error:]";
    _os_log_impl(&dword_1C7F0A000, v34, OS_LOG_TYPE_ERROR, "%s Could not get base64 encoding for the auto shortcut", buf, 0xCu);
  }

  if (a8)
  {
    long long v35 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v46 = *MEMORY[0x1E4F28568];
    long long v18 = WFLocalizedString(@"Unable to add Home Screen icon.");
    __int16 v47 = v18;
    __int16 v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
    id v36 = [v35 errorWithDomain:@"WFAddToHomeScreenErrorDomain" code:2 userInfo:v21];
    long long v37 = a8;
    LOBYTE(a8) = 0;
    *long long v37 = v36;
LABEL_20:
  }
  return (char)a8;
}

- (BOOL)addAppShortcutToHomeScreen:(id)a3 withName:(id)a4 image:(id)a5 error:(id *)a6
{
  return [(WFHomeScreenController *)self createHomeScreenShortcutForAppShortcut:a3 title:a4 image:a5 darkImage:0 tintableImage:0 error:a6];
}

- (BOOL)addAppShortcutToHomeScreen:(id)a3 withName:(id)a4 symbolName:(id)a5 backgroundColor:(id)a6 error:(id *)a7
{
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [(id)objc_opt_class() iconImageWithSymbolName:v13 backgroundColor:v12 roundCorners:0];

  LOBYTE(a7) = [(WFHomeScreenController *)self addAppShortcutToHomeScreen:v15 withName:v14 image:v16 error:a7];
  return (char)a7;
}

- (BOOL)addTopHitToHomeScreen:(id)a3 withName:(id)a4 symbolName:(id)a5 backgroundColor:(id)a6 error:(id *)a7
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (a7)
  {
    id v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F28568];
    id v16 = WFLocalizedString(@"An internal error occurred.");
    v23[0] = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    *a7 = [v15 errorWithDomain:@"WFAddToHomeScreenErrorDomain" code:2 userInfo:v17];
  }
  long long v18 = getWFAppIntentsLogObject();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
  {
    int v20 = 136315138;
    __int16 v21 = "-[WFHomeScreenController addTopHitToHomeScreen:withName:symbolName:backgroundColor:error:]";
    _os_log_impl(&dword_1C7F0A000, v18, OS_LOG_TYPE_FAULT, "%s WFHomeScreenController does not yet support WFTopHitItemContextualAction", (uint8_t *)&v20, 0xCu);
  }

  return 0;
}

- (BOOL)createHomeScreenShortcutForWorkflow:(id)a3 name:(id)a4 image:(id)a5 darkImage:(id)a6 tintableImage:(id)a7 error:(id *)a8
{
  v57[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v50 = a4;
  id v15 = a5;
  id v51 = a6;
  id v16 = a7;
  uint64_t v17 = [MEMORY[0x1E4F29128] UUID];
  long long v18 = [v17 UUIDString];
  int v19 = [v18 stringByReplacingOccurrencesOfString:@"-" withString:&stru_1F229A4D8];

  int v20 = +[WFDatabase defaultDatabase];
  __int16 v21 = +[WFWorkflow workflowWithReference:v14 database:v20 error:a8];

  if (v21)
  {
    uint64_t v22 = WFFastPathBundleIdentifierIfApplicable(v21);
    uint64_t v23 = [v14 identifier];
    id v24 = objc_alloc_init(getUIWebClipClass());
    [v24 setTitle:v50];
    [v24 setIdentifier:v19];
    v49 = (void *)v23;
    [v24 setShortcutIdentifier:v23];
    if (v22)
    {
      [v24 setPageURL:0];
    }
    else
    {
      [v14 externalURLForRunningWithSource:*MEMORY[0x1E4FB4F20]];
      __int16 v25 = self;
      uint64_t v26 = a8;
      unsigned int v27 = v19;
      id v28 = v16;
      v30 = id v29 = v15;
      [v24 setPageURL:v30];

      id v15 = v29;
      id v16 = v28;
      int v19 = v27;
      a8 = v26;
      self = v25;
    }
    if (v22) {
      uint64_t v31 = v22;
    }
    else {
      uint64_t v31 = (void *)*MEMORY[0x1E4FB4BB8];
    }
    [v24 setApplicationBundleIdentifier:v31];
    [v24 setFullScreen:1];
    [v24 setIconImage:v15 isPrecomposed:0];
    if (v51) {
      [v24 setDarkIconImage:v51];
    }
    if (v16) {
      [v24 setTintableIconImage:v16];
    }
    if ([v24 createOnDisk])
    {
      id v47 = v15;
      uint64_t v32 = softLinkSBSSpringBoardServerPort();
      uint64_t v33 = [v19 cStringUsingEncoding:4];
      if (softLinkSBAddWebClipToHomeScreen((uint64_t)v32, v33))
      {
        if (a8)
        {
          long long v34 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v54 = *MEMORY[0x1E4F28568];
          WFLocalizedString(@"Unable to add Home Screen icon.");
          long long v35 = v46 = v16;
          v55 = v35;
          id v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
          *a8 = [v34 errorWithDomain:@"WFAddToHomeScreenErrorDomain" code:2 userInfo:v36];

          id v16 = v46;
          LOBYTE(a8) = 0;
        }
      }
      else
      {
        uint64_t v44 = [(WFHomeScreenController *)self queue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __103__WFHomeScreenController_createHomeScreenShortcutForWorkflow_name_image_darkImage_tintableImage_error___block_invoke;
        block[3] = &unk_1E6558938;
        void block[4] = self;
        id v53 = v49;
        dispatch_async(v44, block);

        LOBYTE(a8) = 1;
      }
      id v15 = v47;
    }
    else if (a8)
    {
      id v48 = v15;
      long long v37 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v56 = *MEMORY[0x1E4F28568];
      long long v38 = WFLocalizedString(@"Unable to save Home Screen icon.");
      v57[0] = v38;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:&v56 count:1];
      id v39 = v14;
      id v40 = v19;
      v42 = id v41 = v16;
      __int16 v43 = v37;
      id v15 = v48;
      *a8 = [v43 errorWithDomain:@"WFAddToHomeScreenErrorDomain" code:1 userInfo:v42];

      id v16 = v41;
      int v19 = v40;
      id v14 = v39;

      LOBYTE(a8) = 0;
    }
  }
  else
  {
    LOBYTE(a8) = 0;
  }

  return (char)a8;
}

void __103__WFHomeScreenController_createHomeScreenShortcutForWorkflow_name_image_darkImage_tintableImage_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) homeScreenShortcutIDs];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (BOOL)addWorkflowToHomeScreen:(id)a3 withName:(id)a4 image:(id)a5 error:(id *)a6
{
  return [(WFHomeScreenController *)self createHomeScreenShortcutForWorkflow:a3 name:a4 image:a5 darkImage:0 tintableImage:0 error:a6];
}

- (BOOL)addWorkflowToHomeScreen:(id)a3 withName:(id)a4 symbolName:(id)a5 backgroundColor:(id)a6 error:(id *)a7
{
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [(id)objc_opt_class() iconImageWithSymbolName:v13 backgroundColor:v12 roundCorners:0];

  LOBYTE(a7) = [(WFHomeScreenController *)self createHomeScreenShortcutForWorkflow:v15 name:v14 image:v16 darkImage:0 tintableImage:0 error:a7];
  return (char)a7;
}

- (BOOL)addWorkflowToHomeScreen:(id)a3 withName:(id)a4 icon:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(id)objc_opt_class() iconImageForIcon:v10];

  LOBYTE(a6) = [(WFHomeScreenController *)self createHomeScreenShortcutForWorkflow:v12 name:v11 image:v13 darkImage:0 tintableImage:0 error:a6];
  return (char)a6;
}

+ (id)iconImageWithSymbolName:(id)a3 backgroundColor:(id)a4 roundCorners:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  long long v9 = objc_opt_new();
  [v9 setRounded:v5];
  [v9 setBackgroundColor:v7];

  [v9 setSymbolName:v8];
  id v10 = objc_msgSend(v9, "imageWithSize:scale:", 200.0, 200.0, 1.0);
  id v11 = [v10 UIImage];

  return v11;
}

+ (id)iconImageForIcon:(id)a3
{
  uint64_t v3 = (Class (__cdecl *)())getISImageDescriptorClass;
  id v4 = a3;
  Class v5 = v3();
  uint64_t v6 = getkISImageDescriptorHomeScreen();
  id v7 = [(objc_class *)v5 imageDescriptorNamed:v6];

  [v7 size];
  double v9 = v8;
  double v11 = v10;
  [v7 scale];
  CGAffineTransformMakeScale(&v19, v12, v12);
  double v13 = v11 * v19.c + v19.a * v9;
  double v14 = v11 * v19.d + v19.b * v9;
  id v15 = (void *)[objc_alloc(MEMORY[0x1E4FB4A58]) initWithHomeScreenIcon:v4];

  [v15 setRounded:0];
  id v16 = objc_msgSend(v15, "imageWithSize:", v13, v14);
  uint64_t v17 = [v16 UIImage];

  return v17;
}

+ (void)migrateOpenAppWebClipsIfNeededWithDatabaseAccessor:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void (**)(void))a3;
  id v4 = [MEMORY[0x1E4F1CB18] systemShortcutsUserDefaults];
  char v5 = [v4 BOOLForKey:@"WFOpenAppWebClipsMigratedToFastPath"];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = getWFHomescreenLogObject();
    id v7 = "+[WFHomeScreenController migrateOpenAppWebClipsIfNeededWithDatabaseAccessor:]";
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v48 = "+[WFHomeScreenController migrateOpenAppWebClipsIfNeededWithDatabaseAccessor:]";
      _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_DEFAULT, "%s Migrating Open App web clips to the fast path...", buf, 0xCu);
    }

    long long v38 = v3[2](v3);
    if (v38)
    {
      long long v37 = v3;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id obj = [(objc_class *)getUIWebClipClass() webClips];
      uint64_t v42 = [obj countByEnumeratingWithState:&v43 objects:v53 count:16];
      if (!v42) {
        goto LABEL_42;
      }
      uint64_t v8 = *(void *)v44;
      id v9 = (id)*MEMORY[0x1E4FB4BB8];
      uint64_t v40 = *(void *)v44;
      while (1)
      {
        for (uint64_t i = 0; i != v42; ++i)
        {
          if (*(void *)v44 != v8) {
            objc_enumerationMutation(obj);
          }
          double v11 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          CGFloat v12 = (void *)MEMORY[0x1C87CA430]();
          double v13 = getWFHomescreenLogObject();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            double v14 = [v11 title];
            id v15 = [v11 pageURL];
            *(_DWORD *)buf = 136315650;
            id v48 = v7;
            __int16 v49 = 2112;
            id v50 = v14;
            __int16 v51 = 2112;
            v52 = v15;
            _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_INFO, "%s Considering web clip with title, URL: %@, %@", buf, 0x20u);
          }
          id v16 = [v11 applicationBundleIdentifier];
          uint64_t v17 = v16;
          if (v16 == v9)
          {
          }
          else
          {
            if (v16) {
              BOOL v18 = v9 == 0;
            }
            else {
              BOOL v18 = 1;
            }
            if (v18)
            {

LABEL_39:
              goto LABEL_40;
            }
            int v19 = [v16 isEqualToString:v9];

            if (!v19) {
              goto LABEL_39;
            }
          }
          int v20 = [v11 pageURL];
          __int16 v21 = [v20 scheme];
          uint64_t v22 = v21;
          if (v21 != @"shortcuts")
          {
            if (!v21
              || (int v23 = [(__CFString *)v21 isEqualToString:@"shortcuts"],
                  v22,
                  !v23))
            {

              goto LABEL_39;
            }
          }
          id v24 = v7;
          __int16 v25 = [v11 pageURL];
          uint64_t v26 = [v25 host];
          if (v26 == @"x-callback-url")
          {

LABEL_30:
            id v28 = getWFHomescreenLogObject();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              id v29 = [v11 title];
              uint64_t v30 = [v11 pageURL];
              *(_DWORD *)buf = 136315650;
              id v48 = v7;
              __int16 v49 = 2112;
              id v50 = v29;
              __int16 v51 = 2112;
              v52 = v30;
              _os_log_impl(&dword_1C7F0A000, v28, OS_LOG_TYPE_INFO, "%s Web clip with title, URL is coming from shortcuts, checking if we need to migrate: %@, %@", buf, 0x20u);
            }
            uint64_t v31 = [v11 pageURL];
            uint64_t v32 = objc_msgSend(v31, "dc_queryDictionary");
            uint64_t v17 = [v32 objectForKeyedSubscript:@"id"];

            if (v17)
            {
              WFUpdateWebClipForShortcutIfNeeded(v11, v17, v38);
            }
            else
            {
              uint64_t v33 = getWFHomescreenLogObject();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              {
                long long v34 = [v11 pageURL];
                *(_DWORD *)buf = 136315394;
                id v48 = v7;
                __int16 v49 = 2112;
                id v50 = v34;
                _os_log_impl(&dword_1C7F0A000, v33, OS_LOG_TYPE_ERROR, "%s Can't migrate web clip with page URL %@ -- couldn't extract shortcut identifier", buf, 0x16u);
              }
              uint64_t v17 = 0;
            }
            goto LABEL_38;
          }
          unsigned int v27 = v26;
          if (!v26)
          {

            id v7 = v24;
LABEL_38:
            uint64_t v8 = v40;
            goto LABEL_39;
          }
          char v39 = [(__CFString *)v26 isEqualToString:@"x-callback-url"];

          id v7 = v24;
          uint64_t v8 = v40;
          if (v39) {
            goto LABEL_30;
          }
LABEL_40:
        }
        uint64_t v42 = [obj countByEnumeratingWithState:&v43 objects:v53 count:16];
        if (!v42)
        {
LABEL_42:

          long long v35 = getWFHomescreenLogObject();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            id v48 = v7;
            _os_log_impl(&dword_1C7F0A000, v35, OS_LOG_TYPE_DEFAULT, "%s Open App web clip fast path migration complete.", buf, 0xCu);
          }

          id v36 = [MEMORY[0x1E4F1CB18] systemShortcutsUserDefaults];
          [v36 setBool:1 forKey:@"WFOpenAppWebClipsMigratedToFastPath"];
          uint64_t v3 = v37;
          goto LABEL_47;
        }
      }
    }
    id v36 = getWFHomescreenLogObject();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v48 = "+[WFHomeScreenController migrateOpenAppWebClipsIfNeededWithDatabaseAccessor:]";
      _os_log_impl(&dword_1C7F0A000, v36, OS_LOG_TYPE_ERROR, "%s Couldn't access database for Open App migration... bailing out", buf, 0xCu);
    }
LABEL_47:
  }
}

+ (void)migratePreYukonWebClipsIfNeeded
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1CB18] workflowUserDefaults];
  char v3 = [v2 BOOLForKey:@"WFWebClipsMigratedToDirectLaunch"];

  if ((v3 & 1) == 0)
  {
    id v4 = getWFHomescreenLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v49 = "+[WFHomeScreenController migratePreYukonWebClipsIfNeeded]";
      _os_log_impl(&dword_1C7F0A000, v4, OS_LOG_TYPE_DEFAULT, "%s Migrating web clips to directly launch the Shortcuts app...", buf, 0xCu);
    }

    char v5 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"<a id=\"jump\" href=\"(.*?)\">" options:0 error:0];
    [(objc_class *)getUIWebClipClass() webClips];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 countByEnumeratingWithState:&v44 objects:v54 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v42 = *(void *)v45;
      uint64_t v43 = *MEMORY[0x1E4FB4BB8];
      long long v38 = v5;
      id v40 = v6;
      while (2)
      {
        uint64_t v9 = 0;
        uint64_t v41 = v8;
        do
        {
          if (*(void *)v45 != v42) {
            objc_enumerationMutation(v6);
          }
          double v10 = *(void **)(*((void *)&v44 + 1) + 8 * v9);
          double v11 = (void *)MEMORY[0x1C87CA430]();
          CGFloat v12 = [v10 applicationBundleIdentifier];
          int v13 = [v12 isEqualToString:v43];

          if (v13)
          {
            long long v35 = getWFHomescreenLogObject();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              __int16 v49 = "+[WFHomeScreenController migratePreYukonWebClipsIfNeeded]";
              _os_log_impl(&dword_1C7F0A000, v35, OS_LOG_TYPE_DEFAULT, "%s Web clip migration is stopping because it found an already migrated web clip.", buf, 0xCu);
            }

            goto LABEL_40;
          }
          double v14 = [v10 pageURL];
          id v15 = [v14 absoluteString];

          if ([v15 hasPrefix:@"data:text/html;base64,"])
          {
            id v16 = [v15 substringFromIndex:objc_msgSend(@"data:text/html;base64,", "length")];
            uint64_t v17 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v16 options:1];
            if (v17)
            {
              BOOL v18 = (void *)v17;
              int v19 = (void *)[[NSString alloc] initWithData:v17 encoding:4];
              if ([v19 containsString:@"/webclips/images/"])
              {
                int v20 = objc_msgSend(v5, "firstMatchInString:options:range:", v19, 0, 0, objc_msgSend(v19, "length"));
                __int16 v21 = v20;
                if (v20)
                {
                  uint64_t v22 = [v20 rangeAtIndex:1];
                  id v24 = objc_msgSend(v19, "substringWithRange:", v22, v23);
                  if (([v24 hasPrefix:@"shortcuts"] & 1) != 0
                    || ([v24 hasPrefix:@"workflow"] & 1) != 0)
                  {
                    char v39 = v21;
                    __int16 v25 = getWFHomescreenLogObject();
                    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                    {
                      uint64_t v26 = [v10 identifier];
                      *(_DWORD *)buf = 136315394;
                      __int16 v49 = "+[WFHomeScreenController migratePreYukonWebClipsIfNeeded]";
                      __int16 v50 = 2114;
                      __int16 v51 = v26;
                      _os_log_impl(&dword_1C7F0A000, v25, OS_LOG_TYPE_DEFAULT, "%s Updating page URL and bundle ID for web clip: %{public}@", buf, 0x16u);
                    }
                    unsigned int v27 = [MEMORY[0x1E4F1CB10] URLWithString:v24];
                    [v10 setPageURL:v27];

                    [v10 setApplicationBundleIdentifier:v43];
                    [v10 updateOnDisk];
                    char v5 = v38;
                    __int16 v21 = v39;
                  }
                  else
                  {
                    uint64_t v33 = getWFHomescreenLogObject();
                    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                    {
                      long long v34 = [v10 identifier];
                      *(_DWORD *)buf = 136315650;
                      __int16 v49 = "+[WFHomeScreenController migratePreYukonWebClipsIfNeeded]";
                      __int16 v50 = 2114;
                      __int16 v51 = v34;
                      __int16 v52 = 2112;
                      id v53 = v24;
                      _os_log_impl(&dword_1C7F0A000, v33, OS_LOG_TYPE_DEFAULT, "%s Skipping web clip migration for web clip: %{public}@, with link: %@", buf, 0x20u);
                    }
                    char v5 = v38;
                  }
                }
                else
                {
                  id v24 = getWFHomescreenLogObject();
                  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
                  {
                    uint64_t v32 = [v10 identifier];
                    *(_DWORD *)buf = 136315394;
                    __int16 v49 = "+[WFHomeScreenController migratePreYukonWebClipsIfNeeded]";
                    __int16 v50 = 2114;
                    __int16 v51 = v32;
                    _os_log_impl(&dword_1C7F0A000, v24, OS_LOG_TYPE_DEFAULT, "%s Skipping web clip migration due to no regex match for web clip: %{public}@", buf, 0x16u);
                  }
                }
              }
              else
              {
                __int16 v21 = getWFHomescreenLogObject();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v31 = [v10 identifier];
                  *(_DWORD *)buf = 136315394;
                  __int16 v49 = "+[WFHomeScreenController migratePreYukonWebClipsIfNeeded]";
                  __int16 v50 = 2114;
                  __int16 v51 = v31;
                  _os_log_impl(&dword_1C7F0A000, v21, OS_LOG_TYPE_DEFAULT, "%s Skipping web clip migration because it was not created by shortcuts: %{public}@", buf, 0x16u);
                }
              }

              id v6 = v40;
            }
            else
            {
              id v29 = getWFHomescreenLogObject();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v30 = [v10 identifier];
                *(_DWORD *)buf = 136315394;
                __int16 v49 = "+[WFHomeScreenController migratePreYukonWebClipsIfNeeded]";
                __int16 v50 = 2114;
                __int16 v51 = v30;
                _os_log_impl(&dword_1C7F0A000, v29, OS_LOG_TYPE_DEFAULT, "%s Skipping web clip migration because it contained invalid base64-encoded data in its URL: %{public}@", buf, 0x16u);
              }
            }
            uint64_t v8 = v41;
          }
          else
          {
            id v16 = getWFHomescreenLogObject();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              id v28 = [v10 identifier];
              *(_DWORD *)buf = 136315394;
              __int16 v49 = "+[WFHomeScreenController migratePreYukonWebClipsIfNeeded]";
              __int16 v50 = 2114;
              __int16 v51 = v28;
              _os_log_impl(&dword_1C7F0A000, v16, OS_LOG_TYPE_DEFAULT, "%s Skipping web clip migration because it isn't a base64-encoded data URL: %{public}@", buf, 0x16u);
            }
          }

          ++v9;
        }
        while (v8 != v9);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v44 objects:v54 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_40:

    id v36 = getWFHomescreenLogObject();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v49 = "+[WFHomeScreenController migratePreYukonWebClipsIfNeeded]";
      _os_log_impl(&dword_1C7F0A000, v36, OS_LOG_TYPE_DEFAULT, "%s Web clip migration complete.", buf, 0xCu);
    }

    long long v37 = [MEMORY[0x1E4F1CB18] workflowUserDefaults];
    [v37 setBool:1 forKey:@"WFWebClipsMigratedToDirectLaunch"];
  }
}

+ (void)migrateWebClipsIfNeededWithDatabaseAccessor:(id)a3
{
  id v4 = a3;
  [a1 migratePreYukonWebClipsIfNeeded];
  [a1 migrateOpenAppWebClipsIfNeededWithDatabaseAccessor:v4];
}

@end