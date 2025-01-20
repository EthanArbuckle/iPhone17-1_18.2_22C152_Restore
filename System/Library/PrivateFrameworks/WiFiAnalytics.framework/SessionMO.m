@interface SessionMO
+ (BOOL)addMostRecentSession:(id)a3 moc:(id)a4;
+ (BOOL)addSession:(id)a3 leave:(id)a4 roams:(id)a5 moc:(id)a6;
+ (BOOL)addSessionsForFirstUse:(id)a3;
+ (BOOL)buildAndAddSessionWithJoin:(id)a3 moc:(id)a4;
+ (BOOL)firstSessionCreated:(id)a3;
+ (id)entityName;
+ (id)fetchRequest;
+ (id)getMostRecentSession:(id)a3 moc:(id)a4;
+ (id)getSessions:(id)a3 sortedAscending:(BOOL)a4 moc:(id)a5;
+ (id)getSessionsWithMostRecentDays:(id)a3 days:(unint64_t)a4 sortedAscending:(BOOL)a5 moc:(id)a6;
@end

@implementation SessionMO

+ (id)entityName
{
  return @"Session";
}

+ (BOOL)firstSessionCreated:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = +[SessionMO entityName];
  unint64_t v5 = +[AnalyticsStoreProxy entityCount:v4 withPredicate:0 moc:v3];

  if (!v5)
  {
    v6 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446466;
      v9 = "+[SessionMO firstSessionCreated:]";
      __int16 v10 = 1024;
      int v11 = 35;
      _os_log_impl(&dword_21D96D000, v6, OS_LOG_TYPE_ERROR, "%{public}s::%d:First session not yet created", (uint8_t *)&v8, 0x12u);
    }
  }
  return v5 != 0;
}

+ (BOOL)addSession:(id)a3 leave:(id)a4 roams:(id)a5 moc:(id)a6
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = (void *)MEMORY[0x223C0F2E0]();
  v14 = +[SessionMO entityName];
  v15 = +[AnalyticsStoreProxy createEntity:v14 moc:v12];

  if (!v15)
  {
    v21 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    int v23 = 136446466;
    v24 = "+[SessionMO addSession:leave:roams:moc:]";
    __int16 v25 = 1024;
    int v26 = 47;
    v22 = "%{public}s::%d:sessionMo nil";
LABEL_14:
    _os_log_impl(&dword_21D96D000, v21, OS_LOG_TYPE_ERROR, v22, (uint8_t *)&v23, 0x12u);
    goto LABEL_15;
  }
  if (!v9)
  {
    v21 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    int v23 = 136446466;
    v24 = "+[SessionMO addSession:leave:roams:moc:]";
    __int16 v25 = 1024;
    int v26 = 48;
    v22 = "%{public}s::%d:join nil";
    goto LABEL_14;
  }
  if (!v10)
  {
    v21 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      int v23 = 136446466;
      v24 = "+[SessionMO addSession:leave:roams:moc:]";
      __int16 v25 = 1024;
      int v26 = 49;
      v22 = "%{public}s::%d:leave nil";
      goto LABEL_14;
    }
LABEL_15:

    BOOL v19 = 0;
    goto LABEL_7;
  }
  v16 = [v9 date];
  [v15 setDate:v16];

  v17 = [v10 date];
  [v15 setEnd:v17];

  [v15 setJoin:v9];
  [v15 setLeave:v10];
  [v15 setInChargingDayTime:0];
  [v15 setInChargingNightTime:0];
  [v15 setInStationaryDayTime:0];
  [v15 setInChargingNightTime:0];
  [v15 setUsageDayTime:0];
  [v15 setUsageNightTime:0];
  if (v11)
  {
    v18 = [MEMORY[0x263EFFA08] setWithArray:v11];
    [v15 addRoamsSet:v18];
  }
  BOOL v19 = 1;
LABEL_7:

  return v19;
}

+ (BOOL)addSessionsForFirstUse:(id)a3
{
  v29[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  context = (void *)MEMORY[0x223C0F2E0]();
  uint64_t v4 = [objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"date" ascending:1];
  uint64_t v5 = [MEMORY[0x263F08A98] predicateWithFormat:@"success == 1"];
  v6 = +[JoinMO fetchRequest];
  [v6 setFetchBatchSize:50];
  [v6 setRelationshipKeyPathsForPrefetching:&unk_26CE65E90];
  v18 = (void *)v4;
  v29[0] = v4;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:1];
  [v6 setSortDescriptors:v7];

  v17 = (void *)v5;
  int v8 = +[AnalyticsStoreProxy fetch:v6 withPredicate:v5 moc:v3];
  uint64_t v16 = [v8 count];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        if (!+[SessionMO buildAndAddSessionWithJoin:*(void *)(*((void *)&v20 + 1) + 8 * i) moc:v3])
        {
          v14 = WALogCategoryDeviceStoreHandle();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446466;
            __int16 v25 = "+[SessionMO addSessionsForFirstUse:]";
            __int16 v26 = 1024;
            int v27 = 95;
            _os_log_impl(&dword_21D96D000, v14, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to add session", buf, 0x12u);
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v11);
  }

  return v16 != 0;
}

+ (BOOL)addMostRecentSession:(id)a3 moc:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)MEMORY[0x223C0F2E0]();
  if (+[SessionMO firstSessionCreated:v6])
  {
    int v8 = +[JoinMO mostRecentJoin:0 ssid:v5 moc:v6];
    if (v8)
    {
      if (+[SessionMO buildAndAddSessionWithJoin:v8 moc:v6])
      {
        BOOL v9 = 1;
LABEL_10:

        goto LABEL_11;
      }
      uint64_t v10 = WALogCategoryDeviceStoreHandle();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
LABEL_9:

        BOOL v9 = 0;
        goto LABEL_10;
      }
      int v13 = 136446466;
      v14 = "+[SessionMO addMostRecentSession:moc:]";
      __int16 v15 = 1024;
      int v16 = 122;
      uint64_t v11 = "%{public}s::%d:Failed to add session";
    }
    else
    {
      uint64_t v10 = WALogCategoryDeviceStoreHandle();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
      int v13 = 136446466;
      v14 = "+[SessionMO addMostRecentSession:moc:]";
      __int16 v15 = 1024;
      int v16 = 119;
      uint64_t v11 = "%{public}s::%d:join nil";
    }
    _os_log_impl(&dword_21D96D000, v10, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v13, 0x12u);
    goto LABEL_9;
  }
  +[SessionMO addSessionsForFirstUse:v6];
  BOOL v9 = 1;
LABEL_11:

  return v9;
}

+ (id)getSessions:(id)a3 sortedAscending:(BOOL)a4 moc:(id)a5
{
  BOOL v5 = a4;
  v16[1] = *MEMORY[0x263EF8340];
  v7 = (objc_class *)MEMORY[0x263F08B30];
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = (void *)[[v7 alloc] initWithKey:@"date" ascending:v5];
  uint64_t v11 = [MEMORY[0x263F08A98] predicateWithFormat:@"join.bss.network.ssid == %@", v9];

  uint64_t v12 = +[SessionMO fetchRequest];
  [v12 setFetchBatchSize:50];
  [v12 setRelationshipKeyPathsForPrefetching:&unk_26CE65EA8];
  v16[0] = v10;
  int v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  [v12 setSortDescriptors:v13];

  v14 = +[AnalyticsStoreProxy fetch:v12 withPredicate:v11 moc:v8];

  return v14;
}

+ (id)getSessionsWithMostRecentDays:(id)a3 days:(unint64_t)a4 sortedAscending:(BOOL)a5 moc:(id)a6
{
  BOOL v6 = a5;
  v24[2] = *MEMORY[0x263EF8340];
  id v9 = (objc_class *)MEMORY[0x263F08B30];
  id v10 = a6;
  id v11 = a3;
  uint64_t v12 = (void *)[[v9 alloc] initWithKey:@"date" ascending:v6];
  int v13 = (void *)MEMORY[0x263F08730];
  v14 = +[SessionMO entityName];
  __int16 v15 = +[AnalyticsStoreProxy predicateForEntityWithAge:v14 maxAge:a4];
  v24[0] = v15;
  int v16 = [MEMORY[0x263F08A98] predicateWithFormat:@"join.bss.network.ssid == %@", v11];

  v24[1] = v16;
  uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
  v18 = [v13 andPredicateWithSubpredicates:v17];

  BOOL v19 = +[SessionMO fetchRequest];
  [v19 setFetchBatchSize:50];
  [v19 setRelationshipKeyPathsForPrefetching:&unk_26CE65EC0];
  long long v23 = v12;
  long long v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
  [v19 setSortDescriptors:v20];

  long long v21 = +[AnalyticsStoreProxy fetch:v19 withPredicate:v18 moc:v10];

  return v21;
}

+ (id)getMostRecentSession:(id)a3 moc:(id)a4
{
  v18[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = +[SessionMO fetchRequest];
  id v8 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"date" ascending:0];
  v18[0] = v8;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
  [v7 setSortDescriptors:v9];

  if (v5)
  {
    id v10 = (void *)MEMORY[0x263F08730];
    id v11 = [MEMORY[0x263F08A98] predicateWithFormat:@"join.bss.network.ssid == %@", v5];
    v17[0] = v11;
    uint64_t v12 = [MEMORY[0x263F08A98] predicateWithFormat:@"join.success == 1"];
    v17[1] = v12;
    int v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
    v14 = [v10 andPredicateWithSubpredicates:v13];
  }
  else
  {
    v14 = 0;
  }
  __int16 v15 = +[AnalyticsStoreProxy fetchFirst:v7 withPredicate:v14 moc:v6];

  return v15;
}

+ (BOOL)buildAndAddSessionWithJoin:(id)a3 moc:(id)a4
{
  v68[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (!v5)
  {
    v45 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      goto LABEL_37;
    }
    *(_DWORD *)buf = 136446466;
    v59 = "+[SessionMO buildAndAddSessionWithJoin:moc:]";
    __int16 v60 = 1024;
    int v61 = 191;
    v46 = "%{public}s::%d:join nil";
LABEL_36:
    _os_log_impl(&dword_21D96D000, v45, OS_LOG_TYPE_ERROR, v46, buf, 0x12u);
    goto LABEL_37;
  }
  v7 = [v5 date];

  if (!v7)
  {
    v45 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      goto LABEL_37;
    }
    *(_DWORD *)buf = 136446466;
    v59 = "+[SessionMO buildAndAddSessionWithJoin:moc:]";
    __int16 v60 = 1024;
    int v61 = 192;
    v46 = "%{public}s::%d:join.date nil";
    goto LABEL_36;
  }
  id v8 = [v5 bss];

  if (!v8)
  {
    v45 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      goto LABEL_37;
    }
    *(_DWORD *)buf = 136446466;
    v59 = "+[SessionMO buildAndAddSessionWithJoin:moc:]";
    __int16 v60 = 1024;
    int v61 = 193;
    v46 = "%{public}s::%d:join.bss nil";
    goto LABEL_36;
  }
  id v9 = [v5 bss];
  id v10 = [v9 network];

  if (!v10)
  {
    v45 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      goto LABEL_37;
    }
    *(_DWORD *)buf = 136446466;
    v59 = "+[SessionMO buildAndAddSessionWithJoin:moc:]";
    __int16 v60 = 1024;
    int v61 = 194;
    v46 = "%{public}s::%d:join.bss.network nil";
    goto LABEL_36;
  }
  id v11 = [v5 bss];
  uint64_t v12 = [v11 network];
  int v13 = [v12 ssid];

  if (!v13)
  {
    v45 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v59 = "+[SessionMO buildAndAddSessionWithJoin:moc:]";
      __int16 v60 = 1024;
      int v61 = 195;
      v46 = "%{public}s::%d:join.bss.network.ssid nil";
      goto LABEL_36;
    }
LABEL_37:

    BOOL v31 = 0;
    goto LABEL_25;
  }
  v14 = (void *)MEMORY[0x223C0F2E0]();
  __int16 v15 = [v5 date];
  int v16 = +[RoamMO fetchRequest];
  uint64_t v17 = [objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"date" ascending:1];
  [v16 setFetchBatchSize:50];
  v56 = (void *)v17;
  v68[0] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v68 count:1];
  [v16 setSortDescriptors:v18];

  BOOL v19 = [v5 bss];
  long long v20 = [v19 network];
  long long v21 = [v20 ssid];
  long long v22 = +[LeaveMO firstLeaveAfter:v15 ssid:v21 moc:v6];

  v57 = v16;
  if (!v22)
  {
    v24 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v47 = [v5 date];
      *(_DWORD *)buf = 136446722;
      v59 = "+[SessionMO buildAndAddSessionWithJoin:moc:]";
      __int16 v60 = 1024;
      int v61 = 208;
      __int16 v62 = 2112;
      uint64_t v63 = (uint64_t)v47;
      v48 = "%{public}s::%d:Leave nil for join @ %@";
LABEL_42:
      _os_log_impl(&dword_21D96D000, v24, OS_LOG_TYPE_ERROR, v48, buf, 0x1Cu);
    }
LABEL_46:
    BOOL v31 = 0;
    v42 = v56;
    goto LABEL_24;
  }
  long long v23 = [v22 date];

  if (!v23)
  {
    v24 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v47 = [v5 date];
      *(_DWORD *)buf = 136446722;
      v59 = "+[SessionMO buildAndAddSessionWithJoin:moc:]";
      __int16 v60 = 1024;
      int v61 = 209;
      __int16 v62 = 2112;
      uint64_t v63 = (uint64_t)v47;
      v48 = "%{public}s::%d:Leave date nil for join @ %@";
      goto LABEL_42;
    }
    goto LABEL_46;
  }
  v24 = [v22 date];
  uint64_t v25 = [v15 compare:v24];
  __int16 v26 = WALogCategoryDeviceStoreHandle();
  int v27 = v26;
  if (v25 == 1)
  {
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v49 = [v5 bss];
      v50 = [v49 network];
      v51 = [v50 ssid];
      *(_DWORD *)buf = 136447234;
      v59 = "+[SessionMO buildAndAddSessionWithJoin:moc:]";
      __int16 v60 = 1024;
      int v61 = 213;
      __int16 v62 = 2112;
      uint64_t v63 = (uint64_t)v15;
      __int16 v64 = 2112;
      v65 = v24;
      __int16 v66 = 2112;
      uint64_t v67 = (uint64_t)v51;
      _os_log_impl(&dword_21D96D000, v27, OS_LOG_TYPE_ERROR, "%{public}s::%d:Join (%@) is after Leave (%@) for %@. Skipping session", buf, 0x30u);
    }
    goto LABEL_46;
  }
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446978;
    v59 = "+[SessionMO buildAndAddSessionWithJoin:moc:]";
    __int16 v60 = 1024;
    int v61 = 215;
    __int16 v62 = 2112;
    uint64_t v63 = (uint64_t)v15;
    __int16 v64 = 2112;
    v65 = v24;
    _os_log_impl(&dword_21D96D000, v27, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Fetching roams between %@ and %@", buf, 0x26u);
  }

  [MEMORY[0x263F08A98] predicateWithFormat:@"(date >= %@) AND (date <= %@)", v15, v24];
  v29 = v28 = v15;
  v30 = +[AnalyticsStoreProxy fetch:v16 withPredicate:v29 moc:v6];
  BOOL v31 = +[SessionMO addSession:v5 leave:v22 roams:v30 moc:v6];
  v55 = v28;
  if (v31)
  {
    v52 = v24;
    v53 = v14;
    [v24 timeIntervalSinceDate:v28];
    double v33 = v32;
    [v5 bss];
    v35 = id v34 = v6;
    v36 = [v35 network];
    v37 = [v36 ssid];
    v54 = v34;
    v38 = +[NetworkMO getInstance:v37 moc:v34];

    if (!v38)
    {
      v14 = v53;
      id v6 = v54;
      v42 = v56;
      v24 = v52;
      goto LABEL_23;
    }
    v39 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      v40 = [v38 ssid];
      uint64_t v41 = [v38 usageTime];
      *(_DWORD *)buf = 136447234;
      v59 = "+[SessionMO buildAndAddSessionWithJoin:moc:]";
      __int16 v60 = 1024;
      int v61 = 228;
      __int16 v62 = 2048;
      uint64_t v63 = (uint64_t)v33;
      __int16 v64 = 2112;
      v65 = v40;
      __int16 v66 = 2048;
      uint64_t v67 = v41;
      _os_log_impl(&dword_21D96D000, v39, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Adding %llu secs to network %@ with usageTime:%llu", buf, 0x30u);
    }
    v24 = v52;
    v14 = v53;

    [v38 setUsageTime:[v38 usageTime] + (uint64_t)v33];
    id v6 = v54;
  }
  else
  {
    v38 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v42 = v56;
      if (v30) {
        uint64_t v43 = [v30 count];
      }
      else {
        uint64_t v43 = 0;
      }
      *(_DWORD *)buf = 136447234;
      v59 = "+[SessionMO buildAndAddSessionWithJoin:moc:]";
      __int16 v60 = 1024;
      int v61 = 223;
      __int16 v62 = 2112;
      uint64_t v63 = (uint64_t)v5;
      __int16 v64 = 2112;
      v65 = v22;
      __int16 v66 = 2048;
      uint64_t v67 = v43;
      _os_log_impl(&dword_21D96D000, v38, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to add session between %@ and %@ with roamsCount:%lu", buf, 0x30u);
      goto LABEL_23;
    }
  }
  v42 = v56;
LABEL_23:

  __int16 v15 = v55;
LABEL_24:

LABEL_25:

  return v31;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"Session"];
}

@end