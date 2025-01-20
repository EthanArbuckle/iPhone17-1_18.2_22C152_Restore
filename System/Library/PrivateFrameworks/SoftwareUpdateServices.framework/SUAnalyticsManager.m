@interface SUAnalyticsManager
+ (id)sharedManager;
- (BOOL)saveEventToDisk:(id)a3;
- (NSDictionary)events;
- (NSString)savePath;
- (SUAnalyticsManager)init;
- (SUAnalyticsManager)initWithPath:(id)a3;
- (id)copyEventFromPath:(id)a3;
- (id)coreAnalyticEventforSUAnalyticEvent:(id)a3;
- (void)_queue_setEvent:(id)a3;
- (void)_queue_submitAllEvents;
- (void)_queue_submitEvent:(id)a3;
- (void)removeAllEvents;
- (void)removeEvent:(id)a3;
- (void)removeEventsWithName:(id)a3;
- (void)setEvent:(id)a3;
- (void)submitAllEvents;
- (void)submitEvent:(id)a3;
- (void)submitEventsWithName:(id)a3;
@end

@implementation SUAnalyticsManager

- (SUAnalyticsManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)SUAnalyticsManager;
  v2 = [(SUAnalyticsManager *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.SUServices.SUCoreAnalyticsManagerQueue", v3);
    stateQueue = v2->_stateQueue;
    v2->_stateQueue = (OS_dispatch_queue *)v4;

    v6 = (SUCoreAnalyticsEventSubmitter *)objc_alloc_init(MEMORY[0x263F77B38]);
    coreEventSubmitter = v2->_coreEventSubmitter;
    v2->_coreEventSubmitter = v6;

    savePath = v2->_savePath;
    v2->_savePath = (NSString *)@"/var/MobileSoftwareUpdate/Controller/SUCoreAnalytics/";
  }
  return v2;
}

- (SUAnalyticsManager)initWithPath:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUAnalyticsManager;
  v6 = [(SUAnalyticsManager *)&v13 init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.SUServices.SUCoreAnalyticsManagerQueue", v7);
    stateQueue = v6->_stateQueue;
    v6->_stateQueue = (OS_dispatch_queue *)v8;

    objc_super v10 = (SUCoreAnalyticsEventSubmitter *)objc_alloc_init(MEMORY[0x263F77B38]);
    coreEventSubmitter = v6->_coreEventSubmitter;
    v6->_coreEventSubmitter = v10;

    objc_storeStrong((id *)&v6->_savePath, a3);
  }

  return v6;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_13);
  }
  v2 = (void *)sharedManager___manager;
  return v2;
}

void __35__SUAnalyticsManager_sharedManager__block_invoke()
{
  v0 = [MEMORY[0x263F08850] defaultManager];
  if ([v0 fileExistsAtPath:@"/var/MobileSoftwareUpdate/Controller/SUCoreAnalytics/"])
  {
    id v1 = 0;
  }
  else
  {
    id v11 = 0;
    [v0 createDirectoryAtPath:@"/var/MobileSoftwareUpdate/Controller/SUCoreAnalytics/" withIntermediateDirectories:1 attributes:0 error:&v11];
    id v1 = v11;
    if (v1)
    {
      v2 = SULogAnalytics();
      SULogErrorForSubsystem(v2, @"Failed to create directory %@ for SUCoreAnalytics: %@", v3, v4, v5, v6, v7, v8, @"/var/MobileSoftwareUpdate/Controller/SUCoreAnalytics/");
    }
  }
  v9 = objc_alloc_init(SUAnalyticsManager);
  objc_super v10 = (void *)sharedManager___manager;
  sharedManager___manager = (uint64_t)v9;
}

- (id)copyEventFromPath:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263F08850] defaultManager];
  id v42 = 0;
  uint64_t v5 = [v4 attributesOfItemAtPath:v3 error:&v42];
  id v6 = v42;
  uint64_t v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (!v8) {
    goto LABEL_13;
  }
  uint64_t v9 = *MEMORY[0x263F080D8];
  uint64_t v10 = [v5 objectForKeyedSubscript:*MEMORY[0x263F080D8]];
  if (!v10
    || (id v11 = (void *)v10,
        [v5 objectForKeyedSubscript:v9],
        v12 = objc_claimAutoreleasedReturnValue(),
        char v13 = [v12 isEqualToString:*MEMORY[0x263F080E8]],
        v12,
        v11,
        (v13 & 1) != 0))
  {
    id v41 = 0;
    v14 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v3 options:0 error:&v41];
    id v15 = v41;
    uint64_t v7 = v15;
    if (!v14 || v15)
    {
      v18 = SULogAnalytics();
      SULogErrorForSubsystem(v18, @"Failed to read contents of event file: %@ (%@)", v26, v27, v28, v29, v30, v31, (uint64_t)v3);
      id v19 = 0;
    }
    else
    {
      id v40 = 0;
      v16 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v14 error:&v40];
      id v17 = v40;
      v18 = v17;
      if (!v16 || v17)
      {
        v32 = SULogAnalytics();
        SULogErrorForSubsystem(v32, @"Invalid event data for :%@ (%@)", v33, v34, v35, v36, v37, v38, (uint64_t)v3);

        id v19 = 0;
      }
      else
      {
        id v19 = v16;
      }
    }
  }
  else
  {
LABEL_13:
    v14 = SULogAnalytics();
    SULogErrorForSubsystem(v14, @"Invalid file type found for even at path: %@ [%@] (skipping)", v20, v21, v22, v23, v24, v25, (uint64_t)v3);
    id v19 = 0;
  }

  return v19;
}

- (BOOL)saveEventToDisk:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__SUAnalyticsManager_saveEventToDisk___block_invoke;
  block[3] = &unk_26447E050;
  id v9 = v4;
  uint64_t v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(stateQueue, block);
  LOBYTE(v4) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __38__SUAnalyticsManager_saveEventToDisk___block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 24))
  {
    uint64_t v28 = SULogAnalytics();
    uint64_t v35 = v28;
    uint64_t v36 = @"Save called on object with no path specified";
LABEL_9:
    SULogErrorForSubsystem(v28, v36, v29, v30, v31, v32, v33, v34, v46);

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    return;
  }
  uint64_t v2 = [*(id *)(a1 + 40) eventUUID];
  if (!v2
    || (id v3 = (void *)v2,
        [*(id *)(a1 + 40) eventName],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        !v4))
  {
    uint64_t v28 = SULogAnalytics();
    uint64_t v35 = v28;
    uint64_t v36 = @"Invalid event passed to saveEvent.Skipping";
    goto LABEL_9;
  }
  uint64_t v5 = NSString;
  id v6 = [*(id *)(a1 + 40) eventName];
  uint64_t v7 = [*(id *)(a1 + 40) eventUUID];
  BOOL v8 = [v5 stringWithFormat:@"%@_%@%s", v6, v7, ".suanalytics"];

  id v9 = [*(id *)(*(void *)(a1 + 32) + 24) stringByAppendingPathComponent:v8];
  uint64_t v10 = SULogAnalytics();
  uint64_t v11 = [*(id *)(a1 + 40) eventName];
  v48 = [*(id *)(a1 + 40) eventUUID];
  SULogInfoForSubsystem(v10, @"Saving event %@:%@ to %@", v12, v13, v14, v15, v16, v17, (uint64_t)v11);

  uint64_t v18 = *(void *)(a1 + 40);
  id v49 = 0;
  id v19 = [MEMORY[0x263F08910] archivedDataWithRootObject:v18 requiringSecureCoding:1 error:&v49];
  uint64_t v20 = (__CFString *)v49;
  if (v19 && ([v19 writeToFile:v9 atomically:1] & 1) != 0)
  {
    uint64_t v21 = SULogAnalytics();
    SULogInfoForSubsystem(v21, @"Successfully saved event", v22, v23, v24, v25, v26, v27, v47);

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    uint64_t v37 = SULogAnalytics();
    v44 = v37;
    v45 = @"Unknown Archiver Error";
    if (v20) {
      v45 = v20;
    }
    SULogErrorForSubsystem(v37, @"Unable to save SU coreanalytics event(%@)", v38, v39, v40, v41, v42, v43, (uint64_t)v45);
  }
}

- (void)setEvent:(id)a3
{
  stateQueue = self->_stateQueue;
  id v5 = a3;
  dispatch_assert_queue_not_V2(stateQueue);
  [(SUAnalyticsManager *)self saveEventToDisk:v5];
}

- (void)removeEvent:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34__SUAnalyticsManager_removeEvent___block_invoke;
  v7[3] = &unk_26447C8C8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(stateQueue, v7);
}

void __34__SUAnalyticsManager_removeEvent___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F08850] defaultManager];
  id v3 = NSString;
  id v4 = [*(id *)(a1 + 32) eventName];
  id v5 = [*(id *)(a1 + 32) eventUUID];
  id v6 = [v3 stringWithFormat:@"%@_%@%s", v4, v5, ".suanalytics"];

  uint64_t v7 = [*(id *)(*(void *)(a1 + 40) + 24) stringByAppendingPathComponent:v6];
  if ([v2 fileExistsAtPath:v7])
  {
    id v19 = 0;
    char v8 = [v2 removeItemAtPath:v7 error:&v19];
    id v9 = v19;
    if ((v8 & 1) == 0)
    {
      uint64_t v10 = SULogAnalytics();
      uint64_t v11 = [*(id *)(a1 + 32) eventName];
      uint64_t v12 = [*(id *)(a1 + 32) eventUUID];
      SULogErrorForSubsystem(v10, @"Unable to remove event %@ : %@ : %@", v13, v14, v15, v16, v17, v18, (uint64_t)v11);
    }
  }
  else
  {
    id v9 = 0;
  }
}

- (void)removeEventsWithName:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__SUAnalyticsManager_removeEventsWithName___block_invoke;
  v7[3] = &unk_26447C8C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(stateQueue, v7);
}

void __43__SUAnalyticsManager_removeEventsWithName___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F08850] defaultManager];
  id v3 = [*(id *)(a1 + 32) savePath];
  uint64_t v26 = v2;
  id v4 = [v2 enumeratorAtPath:v3];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if ([v10 hasSuffix:@".suanalytics"])
        {
          uint64_t v11 = [*(id *)(a1 + 32) savePath];
          uint64_t v12 = [v11 stringByAppendingPathComponent:v10];

          uint64_t v13 = (void *)[*(id *)(a1 + 32) copyEventFromPath:v12];
          uint64_t v14 = v13;
          if (v13)
          {
            uint64_t v15 = [v13 eventName];
            int v16 = [v15 isEqualToString:*(void *)(a1 + 40)];

            if (v16)
            {
              id v27 = 0;
              [v26 removeItemAtPath:v12 error:&v27];
              id v17 = v27;
              uint64_t v18 = SULogAnalytics();
              uint64_t v25 = v18;
              if (v17)
              {
                SULogErrorForSubsystem(v18, @"Unable to remove event file %@: %@", v19, v20, v21, v22, v23, v24, (uint64_t)v12);

                uint64_t v25 = v17;
              }
              else
              {
                SULogInfoForSubsystem(v18, @"Succssfully removed event file %@", v19, v20, v21, v22, v23, v24, (uint64_t)v12);
              }
            }
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v7);
  }
}

- (void)removeAllEvents
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__SUAnalyticsManager_removeAllEvents__block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_sync(stateQueue, block);
}

void __37__SUAnalyticsManager_removeAllEvents__block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v3 = a1;
  id v4 = [*(id *)(a1 + 32) savePath];
  uint64_t v24 = v2;
  id v5 = [v2 enumeratorAtPath:v4];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if ([v11 hasSuffix:@".suanalytics"])
        {
          uint64_t v12 = [*(id *)(v3 + 32) savePath];
          uint64_t v13 = [v12 stringByAppendingPathComponent:v11];

          id v25 = 0;
          char v14 = [v24 removeItemAtPath:v13 error:&v25];
          id v15 = v25;
          int v16 = SULogAnalytics();
          uint64_t v23 = v16;
          if (v14) {
            SULogInfoForSubsystem(v16, @"Successfully removed event file %@", v17, v18, v19, v20, v21, v22, (uint64_t)v13);
          }
          else {
            SULogErrorForSubsystem(v16, @"Unable to remove event file %@: %@", v17, v18, v19, v20, v21, v22, (uint64_t)v13);
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v8);
  }
}

- (void)submitEvent:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34__SUAnalyticsManager_submitEvent___block_invoke;
  v7[3] = &unk_26447C8C8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_sync(stateQueue, v7);
}

void __34__SUAnalyticsManager_submitEvent___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v3 = NSString;
  id v4 = [*(id *)(a1 + 32) eventName];
  id v5 = [*(id *)(a1 + 32) eventUUID];
  id v6 = [v3 stringWithFormat:@"%@_%@%s", v4, v5, ".suanalytics"];

  uint64_t v7 = [*(id *)(*(void *)(a1 + 40) + 24) stringByAppendingPathComponent:v6];
  if ([v2 fileExistsAtPath:v7])
  {
    id v8 = (void *)[*(id *)(a1 + 40) copyEventFromPath:v7];
    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 40), "_queue_setEvent:", v8);
      objc_msgSend(*(id *)(a1 + 40), "_queue_submitEvent:", v8);
      uint64_t v9 = SULogAnalytics();
      SULogInfoForSubsystem(v9, @"Submitted event %@\n", v10, v11, v12, v13, v14, v15, (uint64_t)v8);
    }
    else
    {
      uint64_t v9 = SULogAnalytics();
      uint64_t v24 = [*(id *)(a1 + 32) eventName];
      uint64_t v40 = [*(id *)(a1 + 32) eventUUID];
      SULogErrorForSubsystem(v9, @"Unable to find/reconstruct stashed event for event %@ with uuid %@", v25, v26, v27, v28, v29, v30, (uint64_t)v24);
    }
    id v41 = 0;
    [v2 removeItemAtPath:v7 error:&v41];
    id v31 = v41;
    if (v31)
    {
      uint64_t v32 = SULogAnalytics();
      SULogErrorForSubsystem(v32, @"Failed to remove event file after event submission %@: %@", v33, v34, v35, v36, v37, v38, (uint64_t)v7);
    }
  }
  else
  {
    int v16 = SULogAnalytics();
    uint64_t v17 = [*(id *)(a1 + 32) eventName];
    uint64_t v39 = [*(id *)(a1 + 32) eventUUID];
    SULogErrorForSubsystem(v16, @"Event %@ with uuid %@ does not exist", v18, v19, v20, v21, v22, v23, (uint64_t)v17);
  }
}

- (void)submitEventsWithName:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__SUAnalyticsManager_submitEventsWithName___block_invoke;
  v7[3] = &unk_26447C8C8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_sync(stateQueue, v7);
}

void __43__SUAnalyticsManager_submitEventsWithName___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v3 = [*(id *)(a1 + 40) savePath];
    id v31 = v2;
    id v4 = [v2 enumeratorAtPath:v3];

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (!v6)
    {
      id v32 = 0;
      goto LABEL_22;
    }
    uint64_t v7 = v6;
    id v32 = 0;
    uint64_t v8 = *(void *)v36;
    while (1)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v36 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v35 + 1) + 8 * v9);
        uint64_t v11 = [*(id *)(*(void *)(a1 + 40) + 24) stringByAppendingPathComponent:v10];
        if ([v10 hasSuffix:@".suanalytics"])
        {
          uint64_t v12 = (void *)[*(id *)(a1 + 40) copyEventFromPath:v11];
          uint64_t v13 = v12;
          if (!v12) {
            goto LABEL_12;
          }
          uint64_t v14 = [v12 eventName];
          int v15 = [v14 isEqualToString:*(void *)(a1 + 32)];

          if (!v15) {
            goto LABEL_12;
          }
          objc_msgSend(*(id *)(a1 + 40), "_queue_setEvent:", v13);
          objc_msgSend(*(id *)(a1 + 40), "_queue_submitEvent:", v13);

          id v34 = v32;
          [v31 removeItemAtPath:v11 error:&v34];
          id v16 = v34;

          if (v16)
          {
            uint64_t v13 = SULogAnalytics();
            SULogErrorForSubsystem(v13, @"Failed to remove event file %@: %@", v17, v18, v19, v20, v21, v22, (uint64_t)v11);
            id v32 = v16;
LABEL_12:

            goto LABEL_13;
          }
          id v32 = 0;
        }
LABEL_13:

        ++v9;
      }
      while (v7 != v9);
      uint64_t v23 = [v5 countByEnumeratingWithState:&v35 objects:v39 count:16];
      uint64_t v7 = v23;
      if (!v23)
      {
LABEL_22:

        return;
      }
    }
  }
  SULogAnalytics();
  id v33 = (id)objc_claimAutoreleasedReturnValue();
  SULogErrorForSubsystem(v33, @"Invalid event name passed to submitEventWithName", v24, v25, v26, v27, v28, v29, v30);
}

- (void)submitAllEvents
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__SUAnalyticsManager_submitAllEvents__block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_sync(stateQueue, block);
}

void __37__SUAnalyticsManager_submitAllEvents__block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v3 = [*(id *)(a1 + 32) savePath];
  long long v37 = v2;
  id v4 = [v2 enumeratorAtPath:v3];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v41 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        if ([v10 hasSuffix:@".suanalytics"])
        {
          uint64_t v11 = [*(id *)(a1 + 32) savePath];
          uint64_t v12 = [v11 stringByAppendingPathComponent:v10];

          uint64_t v13 = (void *)[*(id *)(a1 + 32) copyEventFromPath:v12];
          if (v13)
          {
            objc_msgSend(*(id *)(a1 + 32), "_queue_setEvent:", v13);
            id v38 = 0;
            [v37 removeItemAtPath:v12 error:&v38];
            id v14 = v38;
            if (v14)
            {
              int v15 = v14;
              id v16 = SULogAnalytics();
              SULogErrorForSubsystem(v16, @"Failed to remove event file after event submission %@: %@", v17, v18, v19, v20, v21, v22, (uint64_t)v12);
              goto LABEL_12;
            }
          }
          else
          {
            uint64_t v23 = SULogAnalytics();
            SULogErrorForSubsystem(v23, @"Unable to read event at %@ for submission..Removing and moving on", v24, v25, v26, v27, v28, v29, (uint64_t)v12);

            id v39 = 0;
            [v37 removeItemAtPath:v12 error:&v39];
            id v30 = v39;
            if (v30)
            {
              int v15 = v30;
              id v16 = SULogAnalytics();
              SULogErrorForSubsystem(v16, @"Failed to remove event file %@: %@", v31, v32, v33, v34, v35, v36, (uint64_t)v12);
LABEL_12:
            }
          }

          continue;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v7);
  }

  objc_msgSend(*(id *)(a1 + 32), "_queue_submitAllEvents");
}

- (NSDictionary)events
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__13;
  uint64_t v11 = __Block_byref_object_dispose__13;
  id v12 = 0;
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __28__SUAnalyticsManager_events__block_invoke;
  v6[3] = &unk_26447C8A0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

uint64_t __28__SUAnalyticsManager_events__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 16) events];
  return MEMORY[0x270F9A758]();
}

- (void)_queue_setEvent:(id)a3
{
  stateQueue = self->_stateQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(stateQueue);
  coreEventSubmitter = self->_coreEventSubmitter;
  id v7 = [(SUAnalyticsManager *)self coreAnalyticEventforSUAnalyticEvent:v5];

  [(SUCoreAnalyticsEventSubmitter *)coreEventSubmitter setEvent:v7];
}

- (void)_queue_submitAllEvents
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  coreEventSubmitter = self->_coreEventSubmitter;
  [(SUCoreAnalyticsEventSubmitter *)coreEventSubmitter submitAllEvents];
}

- (void)_queue_submitEvent:(id)a3
{
  stateQueue = self->_stateQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(stateQueue);
  coreEventSubmitter = self->_coreEventSubmitter;
  id v7 = [(SUAnalyticsManager *)self coreAnalyticEventforSUAnalyticEvent:v5];

  [(SUCoreAnalyticsEventSubmitter *)coreEventSubmitter submitEvent:v7];
}

- (id)coreAnalyticEventforSUAnalyticEvent:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x263F77B30]);
  id v5 = [v3 eventName];
  uint64_t v6 = (void *)[v4 initWithEventName:v5];

  id v7 = [v3 eventUUID];
  [v6 setEventUUID:v7];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = objc_msgSend(v3, "eventPayload", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v14 = [v3 eventPayload];
        int v15 = [v14 objectForKey:v13];
        [v6 setEventPayloadEntry:v13 value:v15];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  return v6;
}

- (NSString)savePath
{
  return self->_savePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savePath, 0);
  objc_storeStrong((id *)&self->_coreEventSubmitter, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
}

@end