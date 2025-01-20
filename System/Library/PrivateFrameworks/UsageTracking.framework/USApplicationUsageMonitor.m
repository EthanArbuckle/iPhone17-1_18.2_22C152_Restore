@interface USApplicationUsageMonitor
+ (BOOL)shouldMergeUnchangedEvents;
+ (id)_eventWithBundleIdentifier:(id)a3 startDate:(id)a4 usageType:(int64_t)a5 usageTrusted:(BOOL)a6;
+ (id)eventStream;
- (BMSource)appUsageSource;
- (FBSDisplayLayoutMonitor)carPlayMonitor;
- (FBSDisplayLayoutMonitor)continuityMonitor;
- (FBSDisplayLayoutMonitor)externalMonitor;
- (FBSDisplayLayoutMonitor)monitor;
- (FBSDisplayMonitor)displayMonitor;
- (NSDictionary)inUseApplicationEvents;
- (NSSet)activeApplications;
- (NSSet)activeCarPlayApplications;
- (NSSet)activeContinuityApplications;
- (NSSet)activeExternalApplications;
- (USApplicationUsageMonitor)init;
- (void)clearAppWebAndMediaUsageInContextStoreMatchingBundleIDs:(id)a3 clearAll:(BOOL)a4;
- (void)displayMonitor:(id)a3 didConnectIdentity:(id)a4 withConfiguration:(id)a5;
- (void)invalidateInstantState;
- (void)obtainCurrentValue;
- (void)platformSpecificStart;
- (void)platformSpecificStop;
- (void)setActiveApplications:(id)a3;
- (void)setActiveCarPlayApplications:(id)a3;
- (void)setActiveContinuityApplications:(id)a3;
- (void)setActiveExternalApplications:(id)a3;
- (void)setAppUsageSource:(id)a3;
- (void)setCarPlayMonitor:(id)a3;
- (void)setContinuityMonitor:(id)a3;
- (void)setDisplayMonitor:(id)a3;
- (void)setExternalMonitor:(id)a3;
- (void)setInUseApplicationEvents:(id)a3;
- (void)setMonitor:(id)a3;
- (void)start;
- (void)stop;
- (void)updateActiveApplicationsWithLayout:(id)a3 displayType:(unint64_t)a4;
- (void)updateAppDataInContextStore;
- (void)updateInUseApplications:(id)a3 activeApplications:(id)a4;
@end

@implementation USApplicationUsageMonitor

uint64_t __50__USApplicationUsageMonitor_platformSpecificStart__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) updateActiveApplicationsWithLayout:a3 displayType:0];
}

- (void)obtainCurrentValue
{
  v3 = [(USApplicationUsageMonitor *)self monitor];
  v4 = [v3 currentLayout];
  [(USApplicationUsageMonitor *)self updateActiveApplicationsWithLayout:v4 displayType:0];

  v5 = [(USApplicationUsageMonitor *)self carPlayMonitor];
  v6 = [v5 currentLayout];
  [(USApplicationUsageMonitor *)self updateActiveApplicationsWithLayout:v6 displayType:1];

  id v8 = [(USApplicationUsageMonitor *)self externalMonitor];
  v7 = [v8 currentLayout];
  [(USApplicationUsageMonitor *)self updateActiveApplicationsWithLayout:v7 displayType:2];
}

- (void)updateActiveApplicationsWithLayout:(id)a3 displayType:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(_DKMonitor *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__USApplicationUsageMonitor_updateActiveApplicationsWithLayout_displayType___block_invoke;
  block[3] = &unk_26431DB00;
  v11 = self;
  unint64_t v12 = a4;
  id v10 = v6;
  id v8 = v6;
  dispatch_sync(v7, block);
}

- (FBSDisplayLayoutMonitor)monitor
{
  return self->_monitor;
}

- (FBSDisplayLayoutMonitor)externalMonitor
{
  return self->_externalMonitor;
}

- (FBSDisplayLayoutMonitor)carPlayMonitor
{
  return self->_carPlayMonitor;
}

- (void)updateAppDataInContextStore
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v41 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = [(USApplicationUsageMonitor *)self inUseApplicationEvents];
  uint64_t v45 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (v45)
  {
    v43 = self;
    uint64_t v44 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v45; ++i)
      {
        if (*(void *)v52 != v44) {
          objc_enumerationMutation(obj);
        }
        v4 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        v5 = [(USApplicationUsageMonitor *)self inUseApplicationEvents];
        id v6 = [v5 objectForKeyedSubscript:v4];

        v7 = [v6 startDate];
        if (v7)
        {
          id v8 = [v6 metadata];
          v9 = [MEMORY[0x263F35008] appBundleID];
          uint64_t v10 = [v8 objectForKeyedSubscript:v9];

          uint64_t v11 = [v6 stringValue];
          v50 = (void *)v10;
          if (v10)
          {
            v46 = (void *)v11;
            v49 = v4;
          }
          else
          {
            if (!v11) {
              goto LABEL_26;
            }
            v49 = v4;
            v50 = (void *)v11;
            v46 = 0;
          }
          unint64_t v12 = [v6 metadata];
          v13 = [MEMORY[0x263F35080] usageType];
          uint64_t v14 = [v12 objectForKeyedSubscript:v13];
          v15 = (void *)v14;
          v16 = &unk_26C98EBE8;
          if (v14) {
            v16 = (void *)v14;
          }
          id v17 = v16;

          v18 = [v6 metadata];
          v19 = [MEMORY[0x263F35080] isUsageTrusted];
          uint64_t v20 = [v18 objectForKeyedSubscript:v19];
          v21 = (void *)v20;
          v22 = (void *)MEMORY[0x263EFFA88];
          if (v20) {
            v22 = (void *)v20;
          }
          id v23 = v22;

          v24 = [MEMORY[0x263F351D0] appUsageBundleID];
          v55[0] = v24;
          v56[0] = v50;
          v25 = [MEMORY[0x263F351D0] appUsageStartDate];
          v55[1] = v25;
          v56[1] = v7;
          v26 = [MEMORY[0x263F351D0] appUsageType];
          v55[2] = v26;
          v48 = v17;
          v56[2] = v17;
          v27 = [MEMORY[0x263F351D0] isUsageTrusted];
          v55[3] = v27;
          v47 = v23;
          v56[3] = v23;
          v28 = [NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:4];
          v29 = (void *)[v28 mutableCopy];

          if (v46)
          {
            v30 = [MEMORY[0x263F351D0] clipBundleIDKey];
            [v29 setObject:v46 forKeyedSubscript:v30];
          }
          if (([v49 isEqualToString:@"com.apple.springboard.stand-by"] & 1) == 0)
          {
            v31 = (void *)[v29 copy];
            [v41 addObject:v31];
          }
          id v32 = objc_alloc(MEMORY[0x263F2A380]);
          if (v46) {
            v33 = v46;
          }
          else {
            v33 = v50;
          }
          if (v46) {
            v34 = v50;
          }
          else {
            v34 = 0;
          }
          v35 = (void *)[v32 initWithStarting:MEMORY[0x263EFFA88] absoluteTimestamp:v7 bundleID:v33 parentBundleID:v34 isUsageTrusted:v47];
          [(USApplicationUsageMonitor *)v43 appUsageSource];
          v37 = v36 = v29;
          [v7 timeIntervalSinceReferenceDate];
          objc_msgSend(v37, "sendEvent:timestamp:", v35);

          self = v43;
        }
LABEL_26:
      }
      uint64_t v45 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
    }
    while (v45);
  }

  v38 = [MEMORY[0x263F351D0] keyPathForAppUsageDataDictionaries];
  v39 = (void *)[v41 copy];
  v40 = [MEMORY[0x263F351B8] userContext];
  [v40 setObject:v39 forKeyedSubscript:v38];
}

void __76__USApplicationUsageMonitor_updateActiveApplicationsWithLayout_displayType___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) displayBacklightLevel];
  id v3 = objc_alloc_init(MEMORY[0x263EFFA08]);
  id v4 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  if (v2)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v5 = [*(id *)(v1 + 32) elements];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      id v23 = v3;
      uint64_t v24 = v1;
      uint64_t v8 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v26 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          objc_msgSend(v10, "bundleIdentifier", v23, v24);
          uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (!v11)
          {
            unint64_t v12 = [v10 identifier];
            int v13 = [v12 isEqualToString:@"com.apple.springboard.stand-by"];

            if (v13) {
              uint64_t v11 = @"com.apple.springboard.stand-by";
            }
            else {
              uint64_t v11 = 0;
            }
          }
          uint64_t v14 = [v10 identifier];
          char v15 = [v14 isEqualToString:@"com.apple.lock-screen"];

          if (v15)
          {
            uint64_t v16 = [MEMORY[0x263EFF9C0] set];

            id v4 = (id)v16;
            goto LABEL_19;
          }
          if (v11
            && ([(__CFString *)v11 isEqualToString:@"com.apple.SleepLockScreen"] & 1) == 0)
          {
            [v4 addObject:v11];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v7) {
          continue;
        }
        break;
      }
LABEL_19:
      id v3 = v23;
      uint64_t v1 = v24;
    }

    uint64_t v17 = [v4 copy];
    id v3 = (id)v17;
  }
  switch(*(void *)(v1 + 48))
  {
    case 0:
      [*(id *)(v1 + 40) setActiveApplications:v3];
      break;
    case 1:
      [*(id *)(v1 + 40) setActiveCarPlayApplications:v3];
      break;
    case 2:
      [*(id *)(v1 + 40) setActiveExternalApplications:v3];
      break;
    case 3:
      [*(id *)(v1 + 40) setActiveContinuityApplications:v3];
      break;
    default:
      break;
  }
  v18 = [*(id *)(v1 + 40) activeApplications];
  [v4 unionSet:v18];

  v19 = [*(id *)(v1 + 40) activeCarPlayApplications];
  [v4 unionSet:v19];

  uint64_t v20 = [*(id *)(v1 + 40) activeExternalApplications];
  [v4 unionSet:v20];

  v21 = [*(id *)(v1 + 40) activeContinuityApplications];
  [v4 unionSet:v21];

  v22 = (void *)[v4 copy];
  [*(id *)(v1 + 40) updateInUseApplications:v22 activeApplications:0];
}

- (NSSet)activeCarPlayApplications
{
  return self->_activeCarPlayApplications;
}

- (void)updateInUseApplications:(id)a3 activeApplications:(id)a4
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [(_DKMonitor *)self queue];
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = [(USApplicationUsageMonitor *)self inUseApplicationEvents];
  id v8 = objc_alloc(MEMORY[0x263EFFA08]);
  v9 = [v7 allKeys];
  uint64_t v10 = (void *)[v8 initWithArray:v9];

  uint64_t v11 = [MEMORY[0x263EFF910] date];
  if (([v5 isEqual:v10] & 1) == 0)
  {
    long long v53 = v10;
    id v54 = v5;
    v55 = (void *)[v7 mutableCopy];
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id v12 = v5;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v71 objects:v77 count:16];
    v56 = v7;
    id obj = v12;
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v72;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v72 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void *)(*((void *)&v71 + 1) + 8 * i);
          v18 = [v7 objectForKeyedSubscript:v17];
          if (!v18)
          {
            v19 = [(USApplicationUsageMonitor *)self activeCarPlayApplications];
            int v20 = [v19 containsObject:v17];

            if (v20) {
              uint64_t v21 = 3;
            }
            else {
              uint64_t v21 = 1;
            }
            v18 = +[USApplicationUsageMonitor _eventWithBundleIdentifier:v17 startDate:v11 usageType:v21 usageTrusted:1];
            if (v18) {
              [v55 setObject:v18 forKey:v17];
            }
            uint64_t v7 = v56;
          }
        }
        id v12 = obj;
        uint64_t v14 = [obj countByEnumeratingWithState:&v71 objects:v77 count:16];
      }
      while (v14);
    }

    id v22 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v62 = v7;
    uint64_t v23 = [v62 countByEnumeratingWithState:&v67 objects:v76 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v68;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v68 != v25) {
            objc_enumerationMutation(v62);
          }
          uint64_t v27 = *(void *)(*((void *)&v67 + 1) + 8 * j);
          if (([v12 containsObject:v27] & 1) == 0)
          {
            [v22 addObject:v27];
            [v55 removeObjectForKey:v27];
          }
        }
        uint64_t v24 = [v62 countByEnumeratingWithState:&v67 objects:v76 count:16];
      }
      while (v24);
    }
    v60 = self;

    id v57 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v59 = v22;
    uint64_t v28 = [v59 countByEnumeratingWithState:&v63 objects:v75 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v61 = *(void *)v64;
      do
      {
        for (uint64_t k = 0; k != v29; ++k)
        {
          if (*(void *)v64 != v61) {
            objc_enumerationMutation(v59);
          }
          v31 = [v62 objectForKeyedSubscript:*(void *)(*((void *)&v63 + 1) + 8 * k)];
          [v31 setEndDate:v11];
          id v32 = [v31 metadata];
          v33 = [MEMORY[0x263F35008] appBundleID];
          uint64_t v34 = [v32 objectForKeyedSubscript:v33];

          uint64_t v35 = [v31 stringValue];
          v36 = (void *)v35;
          if (v34)
          {
            v37 = (void *)v35;
            v36 = (void *)v34;
          }
          else
          {
            if (!v35) {
              goto LABEL_45;
            }
            v37 = 0;
          }
          if (([v36 isEqualToString:@"com.apple.springboard.stand-by"] & 1) == 0) {
            [v57 addObject:v31];
          }
          v38 = [v31 metadata];
          v39 = [MEMORY[0x263F35080] isUsageTrusted];
          uint64_t v40 = [v38 objectForKeyedSubscript:v39];
          id v41 = (void *)v40;
          v42 = (void *)MEMORY[0x263EFFA88];
          if (v40) {
            v42 = (void *)v40;
          }
          id v43 = v42;

          id v44 = objc_alloc(MEMORY[0x263F2A380]);
          if (v37) {
            uint64_t v45 = v37;
          }
          else {
            uint64_t v45 = v36;
          }
          if (v37) {
            v46 = v36;
          }
          else {
            v46 = 0;
          }
          v47 = (void *)[v44 initWithStarting:MEMORY[0x263EFFA80] absoluteTimestamp:v11 bundleID:v45 parentBundleID:v46 isUsageTrusted:v43];

          v48 = [(USApplicationUsageMonitor *)v60 appUsageSource];
          [v11 timeIntervalSinceReferenceDate];
          objc_msgSend(v48, "sendEvent:timestamp:", v47);

LABEL_45:
        }
        uint64_t v29 = [v59 countByEnumeratingWithState:&v63 objects:v75 count:16];
      }
      while (v29);
    }

    uint64_t v49 = [obj count];
    if ([v59 count] || !v49) {
      [(USApplicationUsageMonitor *)v60 clearAppWebAndMediaUsageInContextStoreMatchingBundleIDs:v59 clearAll:v49 == 0];
    }
    v50 = (void *)[v55 copy];
    [(USApplicationUsageMonitor *)v60 setInUseApplicationEvents:v50];

    long long v51 = [(_DKMonitor *)v60 historicalHandler];

    id v5 = v54;
    uint64_t v7 = v56;
    if (v51)
    {
      long long v52 = [(_DKMonitor *)v60 historicalHandler];
      ((void (**)(void, id))v52)[2](v52, v57);
    }
    [(USApplicationUsageMonitor *)v60 updateAppDataInContextStore];
    uint64_t v10 = v53;
  }
}

- (NSDictionary)inUseApplicationEvents
{
  return self->_inUseApplicationEvents;
}

- (NSSet)activeExternalApplications
{
  return self->_activeExternalApplications;
}

- (NSSet)activeContinuityApplications
{
  return self->_activeContinuityApplications;
}

- (NSSet)activeApplications
{
  return self->_activeApplications;
}

- (void)setActiveApplications:(id)a3
{
}

- (void)setActiveExternalApplications:(id)a3
{
}

- (void)setActiveCarPlayApplications:(id)a3
{
}

- (void)setInUseApplicationEvents:(id)a3
{
}

- (BMSource)appUsageSource
{
  return self->_appUsageSource;
}

+ (id)_eventWithBundleIdentifier:(id)a3 startDate:(id)a4 usageType:(int64_t)a5 usageTrusted:(BOOL)a6
{
  BOOL v6 = a6;
  v48[2] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = v10;
  id v12 = 0;
  if (v9 && v10)
  {
    if ([v9 isEqualToString:@"com.apple.springboard.stand-by"])
    {
      uint64_t v13 = (void *)MEMORY[0x263F35088];
      uint64_t v14 = [MEMORY[0x263F35148] appUsageStream];
      uint64_t v15 = [MEMORY[0x263EFF910] distantFuture];
      uint64_t v16 = [MEMORY[0x263F35058] withBundle:@"com.apple.springboard.stand-by"];
      uint64_t v17 = [MEMORY[0x263F35080] usageType];
      v47[0] = v17;
      v18 = [NSNumber numberWithInteger:a5];
      v48[0] = v18;
      v19 = [MEMORY[0x263F35080] isUsageTrusted];
      v47[1] = v19;
      v48[1] = MEMORY[0x263EFFA88];
      int v20 = [NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:2];
      uint64_t v21 = v13;
      id v22 = (id)v15;
      id v12 = [v21 eventWithStream:v14 startDate:v11 endDate:v15 value:v16 metadata:v20];

LABEL_23:
      goto LABEL_24;
    }
    uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
    uint64_t v23 = [NSNumber numberWithInteger:a5];
    uint64_t v24 = [MEMORY[0x263F35080] usageType];
    [v14 setObject:v23 forKeyedSubscript:v24];

    uint64_t v25 = [NSNumber numberWithBool:v6];
    long long v26 = [MEMORY[0x263F35080] isUsageTrusted];
    [v14 setObject:v25 forKeyedSubscript:v26];

    id v45 = 0;
    uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v9 allowPlaceholder:1 error:&v45];
    id v22 = v45;
    if (v22)
    {
      uint64_t v17 = [MEMORY[0x263F34FB8] knowledgeChannel];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        +[USApplicationUsageMonitor _eventWithBundleIdentifier:startDate:usageType:usageTrusted:]((uint64_t)v9, (uint64_t)v22, v17);
      }
      id v12 = 0;
      goto LABEL_23;
    }
    uint64_t v27 = [v16 shortVersionString];
    uint64_t v17 = v27;
    if (v27 && [v27 length])
    {
      uint64_t v28 = [MEMORY[0x263F35028] shortVersionString];
      [v14 setObject:v17 forKeyedSubscript:v28];
    }
    uint64_t v29 = [v16 exactBundleVersion];
    if ([v29 length])
    {
      uint64_t v30 = [MEMORY[0x263F35028] exactBundleVersion];
      [v14 setObject:v29 forKeyedSubscript:v30];
    }
    v31 = [v16 appClipMetadata];
    id v44 = v31;
    if (v31)
    {
      id v32 = [v31 parentApplicationIdentifiers];
      uint64_t v33 = [v32 firstObject];

      uint64_t v34 = (void *)v33;
      v46 = 0;
      if (!CPCopyBundleIdentifierAndTeamFromApplicationIdentifier() || (uint64_t v35 = v46) == 0)
      {
        v38 = [MEMORY[0x263F34FB8] knowledgeChannel];
        if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT)) {
          +[USApplicationUsageMonitor _eventWithBundleIdentifier:startDate:usageType:usageTrusted:]((uint64_t)v9, v38);
        }
        id v12 = 0;
        goto LABEL_22;
      }
      [MEMORY[0x263F35008] appBundleID];
      v36 = id v43 = v34;
      [v14 setObject:v35 forKeyedSubscript:v36];
    }
    uint64_t v34 = (void *)[v14 copy];
    v37 = (void *)MEMORY[0x263F35088];
    v38 = [MEMORY[0x263F35148] appUsageStream];
    v39 = [MEMORY[0x263EFF910] distantFuture];
    [MEMORY[0x263F35058] withBundle:v9];
    uint64_t v40 = v42 = v29;
    id v12 = [v37 eventWithStream:v38 startDate:v11 endDate:v39 value:v40 metadata:v34];

    uint64_t v29 = v42;
    id v22 = 0;
LABEL_22:

    goto LABEL_23;
  }
LABEL_24:

  return v12;
}

- (USApplicationUsageMonitor)init
{
  v11.receiver = self;
  v11.super_class = (Class)USApplicationUsageMonitor;
  uint64_t v2 = [(_DKMonitor *)&v11 init];
  id v3 = v2;
  if (v2)
  {
    inUseApplicationEvents = v2->_inUseApplicationEvents;
    v2->_inUseApplicationEvents = (NSDictionary *)MEMORY[0x263EFFA78];

    id v5 = BiomeLibrary();
    BOOL v6 = [v5 ScreenTime];
    uint64_t v7 = [v6 AppUsage];
    uint64_t v8 = [v7 source];
    appUsageSource = v3->_appUsageSource;
    v3->_appUsageSource = (BMSource *)v8;
  }
  return v3;
}

+ (id)eventStream
{
  return @"AppUsage";
}

+ (BOOL)shouldMergeUnchangedEvents
{
  return 1;
}

- (void)clearAppWebAndMediaUsageInContextStoreMatchingBundleIDs:(id)a3 clearAll:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v5 = a3;
  BOOL v6 = [MEMORY[0x263F34FB8] knowledgeChannel];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[USApplicationUsageMonitor clearAppWebAndMediaUsageInContextStoreMatchingBundleIDs:clearAll:]((uint64_t)v5, v6);
  }

  long long v51 = [MEMORY[0x263EFF910] date];
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  unint64_t v8 = 0x263F35000uLL;
  uint64_t v9 = [MEMORY[0x263F351D0] keyPathForAppWebUsageDataDictionaries];
  id v10 = (void *)MEMORY[0x263F08A98];
  uint64_t v11 = [MEMORY[0x263F351D0] appWebUsageBundleID];
  id v12 = (void *)v11;
  v48 = v5;
  uint64_t v49 = v7;
  if (v4) {
    [v10 predicateWithFormat:@"SELF.%K != %@", v11, 0];
  }
  else {
  uint64_t v13 = [v10 predicateWithFormat:@"SELF.%K IN %@", v11, v5];
  }

  uint64_t v14 = [MEMORY[0x263F351B8] userContext];
  v46 = (void *)v13;
  v47 = (void *)v9;
  uint64_t v15 = [v14 removeObjectsMatchingPredicate:v13 fromArrayAtKeyPath:v9];

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = v15;
  uint64_t v16 = [obj countByEnumeratingWithState:&v54 objects:v62 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v55;
    uint64_t v50 = *(void *)v55;
    do
    {
      uint64_t v19 = 0;
      uint64_t v52 = v17;
      do
      {
        if (*(void *)v55 != v18) {
          objc_enumerationMutation(obj);
        }
        int v20 = *(void **)(*((void *)&v54 + 1) + 8 * v19);
        uint64_t v21 = [*(id *)(v8 + 464) appWebUsageStartDate];
        id v22 = [v20 objectForKeyedSubscript:v21];

        uint64_t v23 = [*(id *)(v8 + 464) appWebUsageBundleID];
        uint64_t v24 = [v20 objectForKeyedSubscript:v23];

        if (v22) {
          BOOL v25 = v24 == 0;
        }
        else {
          BOOL v25 = 1;
        }
        if (!v25)
        {
          id v26 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          uint64_t v27 = [*(id *)(v8 + 464) appWebUsageWepageURL];
          uint64_t v28 = [v20 objectForKeyedSubscript:v27];

          if (v28)
          {
            uint64_t v29 = [MEMORY[0x263F35080] webpageURL];
            [v26 setObject:v28 forKeyedSubscript:v29];
          }
          uint64_t v30 = [*(id *)(v8 + 464) appWebUsageWebDomain];
          v31 = [v20 objectForKeyedSubscript:v30];

          if (v31)
          {
            id v32 = [MEMORY[0x263F35080] webDomain];
            [v26 setObject:v31 forKeyedSubscript:v32];
          }
          uint64_t v33 = [*(id *)(v8 + 464) isUsageTrusted];
          uint64_t v34 = [v20 objectForKeyedSubscript:v33];

          if (v34)
          {
            uint64_t v35 = [MEMORY[0x263F35080] isUsageTrusted];
            [v26 setObject:v34 forKeyedSubscript:v35];
          }
          v36 = [*(id *)(v8 + 464) appWebUsageType];
          v37 = [v20 objectForKeyedSubscript:v36];

          if (v37)
          {
            v38 = [MEMORY[0x263F35080] usageType];
            [v26 setObject:v37 forKeyedSubscript:v38];
          }
          v39 = (void *)MEMORY[0x263F35088];
          uint64_t v40 = [MEMORY[0x263F35148] appWebUsageStream];
          id v41 = [v39 eventWithStream:v40 source:0 startDate:v22 endDate:v51 identifierStringValue:v24 metadata:v26];

          if (v41) {
            [v49 addObject:v41];
          }

          unint64_t v8 = 0x263F35000;
          uint64_t v18 = v50;
          uint64_t v17 = v52;
        }

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [obj countByEnumeratingWithState:&v54 objects:v62 count:16];
    }
    while (v17);
  }

  if ([v49 count])
  {
    v42 = [MEMORY[0x263F34FB8] knowledgeChannel];
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      id v43 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v49, "count"));
      *(_DWORD *)buf = 138412546;
      id v59 = v43;
      __int16 v60 = 2112;
      uint64_t v61 = v48;
      _os_log_impl(&dword_218373000, v42, OS_LOG_TYPE_INFO, "Cleared %@ events from bundleIDs: %@", buf, 0x16u);
    }
    id v44 = [(_DKMonitor *)self historicalHandler];
    ((void (**)(void, void *))v44)[2](v44, v49);
  }
}

- (void)platformSpecificStart
{
  id v3 = [MEMORY[0x263F3F738] configurationForDefaultMainDisplayMonitor];
  [v3 setNeedsUserInteractivePriority:1];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __50__USApplicationUsageMonitor_platformSpecificStart__block_invoke;
  v13[3] = &unk_26431DB28;
  v13[4] = self;
  [v3 setTransitionHandler:v13];
  BOOL v4 = [MEMORY[0x263F3F728] monitorWithConfiguration:v3];
  [(USApplicationUsageMonitor *)self setMonitor:v4];

  id v5 = [MEMORY[0x263F3F738] configurationForCarDisplayMonitor];

  if (v5)
  {
    [v5 setNeedsUserInteractivePriority:1];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __50__USApplicationUsageMonitor_platformSpecificStart__block_invoke_2;
    v12[3] = &unk_26431DB28;
    v12[4] = self;
    [v5 setTransitionHandler:v12];
    BOOL v6 = [MEMORY[0x263F3F728] monitorWithConfiguration:v5];
    [(USApplicationUsageMonitor *)self setCarPlayMonitor:v6];
  }
  id v7 = [MEMORY[0x263F3F738] configurationForContinuityDisplay];

  if (v7)
  {
    [v7 setNeedsUserInteractivePriority:1];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __50__USApplicationUsageMonitor_platformSpecificStart__block_invoke_3;
    v11[3] = &unk_26431DB28;
    v11[4] = self;
    [v7 setTransitionHandler:v11];
    unint64_t v8 = [MEMORY[0x263F3F728] monitorWithConfiguration:v7];
    [(USApplicationUsageMonitor *)self setContinuityMonitor:v8];
  }
  id v9 = objc_alloc_init(MEMORY[0x263F3F750]);
  [(USApplicationUsageMonitor *)self setDisplayMonitor:v9];

  id v10 = [(USApplicationUsageMonitor *)self displayMonitor];
  [v10 addObserver:self];
}

uint64_t __50__USApplicationUsageMonitor_platformSpecificStart__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) updateActiveApplicationsWithLayout:a3 displayType:1];
}

uint64_t __50__USApplicationUsageMonitor_platformSpecificStart__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) updateActiveApplicationsWithLayout:a3 displayType:3];
}

- (void)platformSpecificStop
{
  id v3 = [(USApplicationUsageMonitor *)self monitor];
  [v3 invalidate];

  [(USApplicationUsageMonitor *)self setMonitor:0];
  [(USApplicationUsageMonitor *)self setActiveApplications:0];
  BOOL v4 = [(USApplicationUsageMonitor *)self carPlayMonitor];
  [v4 invalidate];

  [(USApplicationUsageMonitor *)self setCarPlayMonitor:0];
  [(USApplicationUsageMonitor *)self setActiveCarPlayApplications:0];
  id v5 = [(USApplicationUsageMonitor *)self externalMonitor];
  [v5 invalidate];

  [(USApplicationUsageMonitor *)self setExternalMonitor:0];
  [(USApplicationUsageMonitor *)self setActiveExternalApplications:0];
  BOOL v6 = [(USApplicationUsageMonitor *)self continuityMonitor];
  [v6 invalidate];

  [(USApplicationUsageMonitor *)self setContinuityMonitor:0];
  [(USApplicationUsageMonitor *)self setActiveContinuityApplications:0];
  id v7 = [(USApplicationUsageMonitor *)self displayMonitor];
  [v7 removeObserver:self];

  [(USApplicationUsageMonitor *)self setDisplayMonitor:0];
}

- (void)displayMonitor:(id)a3 didConnectIdentity:(id)a4 withConfiguration:(id)a5
{
  BOOL v6 = SBSCreateLayoutServiceEndpointForExternalDisplay();
  id v7 = [MEMORY[0x263F3F738] configurationWithEndpoint:v6];
  unint64_t v8 = v7;
  if (v7)
  {
    [v7 setNeedsUserInteractivePriority:1];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __81__USApplicationUsageMonitor_displayMonitor_didConnectIdentity_withConfiguration___block_invoke;
    v12[3] = &unk_26431DB28;
    v12[4] = self;
    [v8 setTransitionHandler:v12];
    id v9 = [MEMORY[0x263F3F728] monitorWithConfiguration:v8];
    id v10 = [(USApplicationUsageMonitor *)self externalMonitor];

    if (v10)
    {
      uint64_t v11 = [(USApplicationUsageMonitor *)self externalMonitor];
      [v11 invalidate];

      [(USApplicationUsageMonitor *)self setExternalMonitor:0];
    }
    [(USApplicationUsageMonitor *)self setExternalMonitor:v9];
  }
}

uint64_t __81__USApplicationUsageMonitor_displayMonitor_didConnectIdentity_withConfiguration___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) updateActiveApplicationsWithLayout:a3 displayType:2];
}

- (void)start
{
  v6.receiver = self;
  v6.super_class = (Class)USApplicationUsageMonitor;
  if ([(_DKMonitor *)&v6 instantMonitorNeedsActivation])
  {
    [(USApplicationUsageMonitor *)self platformSpecificStart];
    [(USApplicationUsageMonitor *)self obtainCurrentValue];
    objc_initWeak(&location, self);
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __34__USApplicationUsageMonitor_start__block_invoke;
    v3[3] = &unk_26431DB78;
    objc_copyWeak(&v4, &location);
    [(_DKMonitor *)self setShutdownHandler:v3];
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

void __34__USApplicationUsageMonitor_start__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F34FB8] knowledgeChannel];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __34__USApplicationUsageMonitor_start__block_invoke_cold_1(v2);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __34__USApplicationUsageMonitor_start__block_invoke_43;
    block[3] = &unk_26431DB50;
    void block[4] = v4;
    dispatch_sync(v5, block);
  }
}

void __34__USApplicationUsageMonitor_start__block_invoke_43(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x263EFFA08] set];
  uint64_t v2 = [MEMORY[0x263EFFA08] set];
  [v1 updateInUseApplications:v3 activeApplications:v2];
}

- (void)stop
{
  v3.receiver = self;
  v3.super_class = (Class)USApplicationUsageMonitor;
  if ([(_DKMonitor *)&v3 instantMonitorNeedsDeactivation])
  {
    [(USApplicationUsageMonitor *)self platformSpecificStop];
    [(_DKMonitor *)self setShutdownHandler:0];
  }
}

- (void)invalidateInstantState
{
  objc_super v3 = [(_DKMonitor *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__USApplicationUsageMonitor_invalidateInstantState__block_invoke;
  block[3] = &unk_26431DB50;
  void block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __51__USApplicationUsageMonitor_invalidateInstantState__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setInUseApplicationEvents:MEMORY[0x263EFFA78]];
}

- (void)setMonitor:(id)a3
{
}

- (void)setCarPlayMonitor:(id)a3
{
}

- (void)setExternalMonitor:(id)a3
{
}

- (FBSDisplayLayoutMonitor)continuityMonitor
{
  return self->_continuityMonitor;
}

- (void)setContinuityMonitor:(id)a3
{
}

- (void)setActiveContinuityApplications:(id)a3
{
}

- (FBSDisplayMonitor)displayMonitor
{
  return self->_displayMonitor;
}

- (void)setDisplayMonitor:(id)a3
{
}

- (void)setAppUsageSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appUsageSource, 0);
  objc_storeStrong((id *)&self->_inUseApplicationEvents, 0);
  objc_storeStrong((id *)&self->_displayMonitor, 0);
  objc_storeStrong((id *)&self->_activeContinuityApplications, 0);
  objc_storeStrong((id *)&self->_continuityMonitor, 0);
  objc_storeStrong((id *)&self->_activeExternalApplications, 0);
  objc_storeStrong((id *)&self->_externalMonitor, 0);
  objc_storeStrong((id *)&self->_activeCarPlayApplications, 0);
  objc_storeStrong((id *)&self->_carPlayMonitor, 0);
  objc_storeStrong((id *)&self->_activeApplications, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
}

+ (void)_eventWithBundleIdentifier:(uint64_t)a1 startDate:(NSObject *)a2 usageType:usageTrusted:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_218373000, a2, OS_LOG_TYPE_FAULT, "Failed to find app bundleID for app clip usage event with bundleID %@", (uint8_t *)&v2, 0xCu);
}

+ (void)_eventWithBundleIdentifier:(os_log_t)log startDate:usageType:usageTrusted:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_218373000, log, OS_LOG_TYPE_ERROR, "Failed to lookup LSApplicationRecord for app usage event with bundleID %@: %@", (uint8_t *)&v3, 0x16u);
}

- (void)clearAppWebAndMediaUsageInContextStoreMatchingBundleIDs:(uint64_t)a1 clearAll:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_218373000, a2, OS_LOG_TYPE_DEBUG, "Clearing app and media usage for bundleIDs: %@", (uint8_t *)&v2, 0xCu);
}

void __34__USApplicationUsageMonitor_start__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_218373000, log, OS_LOG_TYPE_DEBUG, "Marking all running apps as closed to force persistence.", v1, 2u);
}

@end