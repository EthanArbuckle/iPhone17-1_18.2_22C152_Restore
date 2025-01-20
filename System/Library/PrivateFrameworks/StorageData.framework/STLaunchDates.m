@interface STLaunchDates
+ (id)sharedDates;
- (NSDate)latestDate;
- (NSMutableDictionary)launchDatesByApp;
- (STLaunchDates)init;
- (id)launchDateForApp:(id)a3;
- (void)_writeDatesPref:(id)a3;
- (void)addBiomeDates;
- (void)addSpotlightDates;
- (void)load;
- (void)readDatesPref;
- (void)setLatestDate:(id)a3;
- (void)setLaunchDatesByApp:(id)a3;
- (void)updateDates:(id)a3;
- (void)writeDatesPref;
@end

@implementation STLaunchDates

+ (id)sharedDates
{
  if (sharedDates_onceToken != -1) {
    dispatch_once(&sharedDates_onceToken, &__block_literal_global_13);
  }
  v2 = (void *)sharedDates__gSharedDates;

  return v2;
}

uint64_t __28__STLaunchDates_sharedDates__block_invoke()
{
  v0 = objc_alloc_init(STLaunchDates);
  v1 = (void *)sharedDates__gSharedDates;
  sharedDates__gSharedDates = (uint64_t)v0;

  v2 = (void *)sharedDates__gSharedDates;

  return [v2 load];
}

- (STLaunchDates)init
{
  v6.receiver = self;
  v6.super_class = (Class)STLaunchDates;
  v2 = [(STLaunchDates *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    launchDatesByApp = v2->_launchDatesByApp;
    v2->_launchDatesByApp = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (id)launchDateForApp:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_super v6 = [(NSMutableDictionary *)v5->_launchDatesByApp objectForKey:v4];
  objc_sync_exit(v5);

  return v6;
}

- (void)_writeDatesPref:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_super v6 = (void *)[(NSMutableDictionary *)v5->_launchDatesByApp copy];
  v7 = dispatch_get_global_queue(9, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__STLaunchDates__writeDatesPref___block_invoke;
  block[3] = &unk_264305098;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);

  objc_sync_exit(v5);
}

uint64_t __33__STLaunchDates__writeDatesPref___block_invoke(uint64_t a1)
{
  CFStringRef v1 = (const __CFString *)*MEMORY[0x263EFFE70];
  CFStringRef v2 = (const __CFString *)*MEMORY[0x263EFFE68];
  CFPreferencesSetValue(@"LaunchTimes", *(CFPropertyListRef *)(a1 + 32), @"com.apple.settings.storage", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE68]);

  return CFPreferencesSynchronize(@"com.apple.settings.storage", v1, v2);
}

- (void)writeDatesPref
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__writeDatesPref_ object:0];

  [(STLaunchDates *)self performSelector:sel__writeDatesPref_ withObject:0 afterDelay:5.0];
}

- (void)readDatesPref
{
  id v3 = (id)CFPreferencesCopyValue(@"LaunchTimes", @"com.apple.settings.storage", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE68]);
  [(STLaunchDates *)self updateDates:v3];
}

- (void)updateDates:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __29__STLaunchDates_updateDates___block_invoke;
  v20[3] = &unk_264305780;
  v20[4] = v5;
  v20[5] = &v21;
  [v4 enumerateKeysAndObjectsUsingBlock:v20];
  if (*((unsigned char *)v22 + 24))
  {
    [(NSMutableDictionary *)v5->_launchDatesByApp allValues];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v25 count:16];
    if (v7)
    {
      id v8 = 0;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (v8)
          {
            uint64_t v12 = objc_msgSend(v8, "laterDate:", v11, (void)v16);

            id v8 = (id)v12;
          }
          else
          {
            id v8 = v11;
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v25 count:16];
      }
      while (v7);

      if (v8)
      {
        v13 = (NSDate *)v8;
        v14 = v13;
LABEL_16:
        latestDate = v5->_latestDate;
        v5->_latestDate = v13;

        [(STLaunchDates *)v5 writeDatesPref];
        goto LABEL_17;
      }
    }
    else
    {
    }
    objc_msgSend(MEMORY[0x263EFF910], "now", (void)v16);
    v13 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    goto LABEL_16;
  }
LABEL_17:
  _Block_object_dispose(&v21, 8);
  objc_sync_exit(v5);
}

void __29__STLaunchDates_updateDates___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:v9];
  uint64_t v7 = v6;
  if (!v6
    || ([v6 laterDate:v5], id v8 = (id)objc_claimAutoreleasedReturnValue(), v8, v8 == v5))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    [*(id *)(*(void *)(a1 + 32) + 8) setObject:v5 forKey:v9];
  }
}

- (void)addSpotlightDates
{
  v29[2] = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2050000000;
  id v4 = (void *)getCSSearchQueryContextClass_softClass;
  uint64_t v27 = getCSSearchQueryContextClass_softClass;
  if (!getCSSearchQueryContextClass_softClass)
  {
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    uint64_t v21 = __getCSSearchQueryContextClass_block_invoke;
    v22 = &unk_2643053C0;
    uint64_t v23 = &v24;
    __getCSSearchQueryContextClass_block_invoke((uint64_t)&v19);
    id v4 = (void *)v25[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v24, 8);
  id v6 = objc_opt_new();
  [v6 setBundleIDs:&unk_26C92C4C8];
  v29[0] = @"_kMDItemExternalID";
  v29[1] = @"_kMDItemApplicationLastLaunchedDate";
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:2];
  [v6 setFetchAttributes:v7];

  uint64_t v28 = *MEMORY[0x263F08098];
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v28 count:1];
  [v6 setProtectionClasses:v8];

  [v6 setInternal:1];
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2050000000;
  id v9 = (void *)getCSSearchQueryClass_softClass;
  uint64_t v27 = getCSSearchQueryClass_softClass;
  if (!getCSSearchQueryClass_softClass)
  {
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    uint64_t v21 = __getCSSearchQueryClass_block_invoke;
    v22 = &unk_2643053C0;
    uint64_t v23 = &v24;
    __getCSSearchQueryClass_block_invoke((uint64_t)&v19);
    id v9 = (void *)v25[3];
  }
  id v10 = v9;
  _Block_object_dispose(&v24, 8);
  v11 = (void *)[[v10 alloc] initWithQueryString:@"true" context:v6];
  dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __34__STLaunchDates_addSpotlightDates__block_invoke;
  v17[3] = &unk_2643057A8;
  id v18 = v3;
  id v13 = v3;
  [v11 setFoundItemsHandler:v17];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __34__STLaunchDates_addSpotlightDates__block_invoke_2;
  v15[3] = &unk_2643057D0;
  dispatch_semaphore_t v16 = v12;
  v14 = v12;
  [v11 setCompletionHandler:v15];
  [v11 start];
  dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  [(STLaunchDates *)self updateDates:v13];
}

void __34__STLaunchDates_addSpotlightDates__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(*((void *)&v13 + 1) + 8 * i) attributeSet];
        id v9 = [v8 attributeForKey:@"_kMDItemExternalID"];
        uint64_t v10 = [v8 attributeForKey:@"_kMDItemApplicationLastLaunchedDate"];
        v11 = (void *)v10;
        if (v9) {
          BOOL v12 = v10 == 0;
        }
        else {
          BOOL v12 = 1;
        }
        if (!v12) {
          [*(id *)(a1 + 32) setObject:v10 forKey:v9];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
}

intptr_t __34__STLaunchDates_addSpotlightDates__block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)addBiomeDates
{
  id v3 = [MEMORY[0x263F2A9B8] appLaunch];
  [(NSDate *)self->_latestDate timeIntervalSinceReferenceDate];
  uint64_t v4 = objc_msgSend(v3, "publisherFromStartTime:");
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v6 = [v4 filterWithIsIncluded:&__block_literal_global_23];
  uint64_t v7 = objc_opt_new();
  id v8 = [v6 reduceWithInitial:v7 nextPartialResult:&__block_literal_global_26];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __30__STLaunchDates_addBiomeDates__block_invoke_3;
  v13[3] = &unk_264305838;
  dispatch_semaphore_t v14 = v5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __30__STLaunchDates_addBiomeDates__block_invoke_4;
  v12[3] = &unk_264305860;
  v12[4] = self;
  id v9 = v5;
  id v10 = (id)[v8 sinkWithCompletion:v13 shouldContinue:v12];

  dispatch_time_t v11 = dispatch_time(0, 2000000000);
  dispatch_semaphore_wait(v9, v11);
}

uint64_t __30__STLaunchDates_addBiomeDates__block_invoke(uint64_t a1, void *a2)
{
  CFStringRef v2 = [a2 eventBody];
  uint64_t v3 = [v2 isStarting];

  return v3;
}

id __30__STLaunchDates_addBiomeDates__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v5 eventBody];
  uint64_t v7 = [v6 dateInterval];
  id v8 = [v7 startDate];
  id v9 = [v5 eventBody];

  id v10 = [v9 bundleID];
  [v4 setObject:v8 forKeyedSubscript:v10];

  return v4;
}

intptr_t __30__STLaunchDates_addBiomeDates__block_invoke_3(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __30__STLaunchDates_addBiomeDates__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return 0;
}

- (void)load
{
  [(STLaunchDates *)self readDatesPref];

  [(STLaunchDates *)self addSpotlightDates];
}

- (NSMutableDictionary)launchDatesByApp
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLaunchDatesByApp:(id)a3
{
}

- (NSDate)latestDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLatestDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestDate, 0);

  objc_storeStrong((id *)&self->_launchDatesByApp, 0);
}

@end