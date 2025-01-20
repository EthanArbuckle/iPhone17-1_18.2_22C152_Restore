@interface RoamMO
+ (id)entityName;
+ (id)fetchRequest;
+ (id)fetchRoamCache:(id)a3 fetchLimit:(unint64_t)a4 moc:(id)a5;
+ (id)fetchRoamObjects:(id)a3 fetchLimit:(unint64_t)a4 moc:(id)a5;
+ (id)fetchRoamProperties:(id)a3 lookForRoamStatus:(BOOL)a4 fetchLimit:(unint64_t)a5 properties:(id)a6 moc:(id)a7;
+ (id)generateInstance:(id)a3;
+ (unint64_t)dwellTimeInBand:(id)a3 bandIs24:(BOOL)a4 bssid:(id)a5 maxAgeInDays:(unint64_t)a6 moc:(id)a7;
+ (unint64_t)roamsCount:(id)a3 fetchLimit:(unint64_t)a4 moc:(id)a5;
+ (unint64_t)roamsCountBetweenBssids:(id)a3 target:(id)a4 moc:(id)a5;
@end

@implementation RoamMO

+ (id)entityName
{
  return @"Roam";
}

+ (id)generateInstance:(id)a3
{
  id v3 = a3;
  v4 = +[RoamMO entityName];
  v5 = +[AnalyticsStoreProxy createEntity:v4 moc:v3];

  return v5;
}

+ (id)fetchRoamProperties:(id)a3 lookForRoamStatus:(BOOL)a4 fetchLimit:(unint64_t)a5 properties:(id)a6 moc:(id)a7
{
  BOOL v10 = a4;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a6;
  id v13 = a7;
  v14 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v14, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ManagedObjects RoamMO fetchRoamProperties:lookForRoamStatus:fetchLimit:", "", buf, 2u);
  }

  v15 = +[RoamMO entityName];
  if (!v11)
  {
    v25 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v32 = "+[RoamMO fetchRoamProperties:lookForRoamStatus:fetchLimit:properties:moc:]";
      __int16 v33 = 1024;
      int v34 = 38;
      v26 = "%{public}s::%d:bssid nil.. bailing";
      v27 = v25;
      uint32_t v28 = 18;
LABEL_19:
      _os_log_impl(&dword_21D96D000, v27, OS_LOG_TYPE_ERROR, v26, buf, v28);
    }
LABEL_20:
    id v21 = 0;
    v17 = 0;
    v16 = 0;
    goto LABEL_26;
  }
  if (+[WAUtil isWildcardMacAddress:v11])
  {
    v25 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v32 = "+[RoamMO fetchRoamProperties:lookForRoamStatus:fetchLimit:properties:moc:]";
      __int16 v33 = 1024;
      int v34 = 39;
      __int16 v35 = 2112;
      id v36 = v11;
      v26 = "%{public}s::%d:bssid(%@) is the wildcard address!! bailing";
      v27 = v25;
      uint32_t v28 = 28;
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  v16 = [MEMORY[0x263F08A98] predicateWithFormat:@"source.bssid == %@", v11];
  v17 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"date" ascending:0];
  if (v10)
  {
    v18 = (void *)MEMORY[0x263F08730];
    v30[0] = v16;
    v19 = [MEMORY[0x263F08A98] predicateWithFormat:@"status == 0"];
    v30[1] = v19;
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:2];
    id v21 = [v18 andPredicateWithSubpredicates:v20];
  }
  else
  {
    id v21 = v16;
  }
  if (v12)
  {
    if ([v12 count])
    {
      v22 = +[AnalyticsStoreProxy fetchPropertiesForEntityWithLimitAndSortDescriptor:v15 properties:v12 predicate:v21 fetchLimit:a5 sortDescriptor:v17 returnDistinct:1 moc:v13];
      v23 = WALogCategoryDeviceStoreHandle();
      if (os_signpost_enabled(v23))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_21D96D000, v23, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ManagedObjects RoamMO fetchRoamProperties:lookForRoamStatus:fetchLimit:", "", buf, 2u);
      }
      goto LABEL_12;
    }
    v25 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v32 = "+[RoamMO fetchRoamProperties:lookForRoamStatus:fetchLimit:properties:moc:]";
      __int16 v33 = 1024;
      int v34 = 51;
      v29 = "%{public}s::%d:properties array empty.. bailing";
      goto LABEL_25;
    }
  }
  else
  {
    v25 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v32 = "+[RoamMO fetchRoamProperties:lookForRoamStatus:fetchLimit:properties:moc:]";
      __int16 v33 = 1024;
      int v34 = 50;
      v29 = "%{public}s::%d:properties array nil.. bailing";
LABEL_25:
      _os_log_impl(&dword_21D96D000, v25, OS_LOG_TYPE_ERROR, v29, buf, 0x12u);
    }
  }
LABEL_26:

  v23 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v23, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ManagedObjects RoamMO fetchRoamProperties:lookForRoamStatus:fetchLimit:", "", buf, 2u);
  }
  v22 = 0;
LABEL_12:

  return v22;
}

+ (unint64_t)roamsCount:(id)a3 fetchLimit:(unint64_t)a4 moc:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  v9 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ManagedObjects RoamMO roamsCount:fetchLimit:", "", buf, 2u);
  }

  BOOL v10 = +[RoamMO entityName];
  id v11 = +[AnalyticsStoreProxy fetchRequestForEntity:v10];
  id v12 = v11;
  if (v11)
  {
    [v11 setFetchLimit:a4];
    id v13 = (void *)MEMORY[0x263F08730];
    v14 = [MEMORY[0x263F08A98] predicateWithFormat:@"source.bssid == %@", v7];
    v22[0] = v14;
    v15 = [MEMORY[0x263F08A98] predicateWithFormat:@"status == 0"];
    v22[1] = v15;
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
    v17 = [v13 andPredicateWithSubpredicates:v16];

    [v12 setPredicate:v17];
    id v21 = 0;
    unint64_t v18 = [v8 countForFetchRequest:v12 error:&v21];
  }
  else
  {
    v17 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v24 = "+[RoamMO roamsCount:fetchLimit:moc:]";
      __int16 v25 = 1024;
      int v26 = 72;
      __int16 v27 = 2112;
      uint32_t v28 = v10;
      _os_log_impl(&dword_21D96D000, v17, OS_LOG_TYPE_ERROR, "%{public}s::%d:fetch request nil for entity:%@", buf, 0x1Cu);
    }
    unint64_t v18 = 0;
  }

  v19 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v19, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ManagedObjects RoamMO roamsCount:fetchLimit:", "", buf, 2u);
  }
  if (v18 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v18 = 0;
  }

  return v18;
}

+ (id)fetchRoamObjects:(id)a3 fetchLimit:(unint64_t)a4 moc:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  v9 = +[RoamMO entityName];
  BOOL v10 = +[AnalyticsStoreProxy fetchRequestForEntity:v9];
  id v11 = v10;
  if (!v10)
  {
    v15 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v23 = "+[RoamMO fetchRoamObjects:fetchLimit:moc:]";
      __int16 v24 = 1024;
      int v25 = 100;
      __int16 v26 = 2112;
      __int16 v27 = v9;
      _os_log_impl(&dword_21D96D000, v15, OS_LOG_TYPE_ERROR, "%{public}s::%d:fetch request nil for entity:%@", buf, 0x1Cu);
    }
    id v13 = 0;
    goto LABEL_11;
  }
  [v10 setFetchLimit:a4];
  id v20 = 0;
  uint64_t v12 = [v8 countForFetchRequest:v11 error:&v20];
  id v13 = v20;
  if (v12) {
    BOOL v14 = v12 == 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14)
  {
    unint64_t v18 = 0;
    goto LABEL_13;
  }
  v15 = [objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"date" ascending:0];
  id v21 = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v21 count:1];
  [v11 setSortDescriptors:v16];

  v17 = [MEMORY[0x263F08A98] predicateWithFormat:@"source.bssid == %@", v7];
  unint64_t v18 = +[AnalyticsStoreProxy fetch:v11 withPredicate:v17 moc:v8];

  if (!v18 || ![v18 count])
  {

LABEL_11:
    unint64_t v18 = 0;
  }

LABEL_13:
  return v18;
}

+ (id)fetchRoamCache:(id)a3 fetchLimit:(unint64_t)a4 moc:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  v9 = +[RoamMO entityName];
  BOOL v10 = +[AnalyticsStoreProxy fetchRequestForEntity:v9];
  id v11 = v10;
  if (!v10)
  {
    v16 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v20 = "+[RoamMO fetchRoamCache:fetchLimit:moc:]";
      __int16 v21 = 1024;
      int v22 = 130;
      __int16 v23 = 2112;
      uint64_t v24 = (uint64_t)v9;
      _os_log_impl(&dword_21D96D000, v16, OS_LOG_TYPE_ERROR, "%{public}s::%d:fetch request nil for entity:%@", buf, 0x1Cu);
    }
    id v13 = 0;
    v15 = 0;
    goto LABEL_7;
  }
  [v10 setFetchLimit:a4];
  id v18 = 0;
  uint64_t v12 = [v8 countForFetchRequest:v11 error:&v18];
  id v13 = v18;
  BOOL v14 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446722;
    id v20 = "+[RoamMO fetchRoamCache:fetchLimit:moc:]";
    __int16 v21 = 1024;
    int v22 = 135;
    __int16 v23 = 2048;
    uint64_t v24 = v12;
    _os_log_impl(&dword_21D96D000, v14, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Count %lu", buf, 0x1Cu);
  }

  v15 = 0;
  if (v12 && v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v16 = [MEMORY[0x263F08A98] predicateWithFormat:@"source.bssid.neighborCache == %@", v7];
    v15 = +[AnalyticsStoreProxy fetch:v11 withPredicate:v16 moc:v8];
LABEL_7:
  }
  return v15;
}

+ (unint64_t)dwellTimeInBand:(id)a3 bandIs24:(BOOL)a4 bssid:(id)a5 maxAgeInDays:(unint64_t)a6 moc:(id)a7
{
  BOOL v10 = a4;
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a5;
  id v54 = a7;
  if (!v11)
  {
    v44 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v60 = "+[RoamMO dwellTimeInBand:bandIs24:bssid:maxAgeInDays:moc:]";
      __int16 v61 = 1024;
      int v62 = 152;
      _os_log_impl(&dword_21D96D000, v44, OS_LOG_TYPE_ERROR, "%{public}s::%d:ssid nil", buf, 0x12u);
    }

    goto LABEL_14;
  }
  BOOL v49 = v10;
  context = (void *)MEMORY[0x223C0F2E0]();
  uint64_t v13 = +[RoamMO entityName];
  id v52 = v12;
  id v53 = v11;
  if (v12)
  {
    BOOL v14 = (void *)MEMORY[0x263F08730];
    v15 = [MEMORY[0x263F08A98] predicateWithFormat:@"source.network.ssid == %@", v11];
    v58[0] = v15;
    v16 = [MEMORY[0x263F08A98] predicateWithFormat:@"source.bssid == %@", v12];
    v58[1] = v16;
    [MEMORY[0x263F08A98] predicateWithFormat:@"status == 0"];
    id v18 = v17 = v13;
    v58[2] = v18;
    v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v58 count:3];
    id v20 = [v14 andPredicateWithSubpredicates:v19];

    uint64_t v13 = v17;
  }
  else
  {
    id v20 = [MEMORY[0x263F08A98] predicateWithFormat:@"source.network.ssid == %@", v11];
  }
  v48 = v20;
  if (a6)
  {
    __int16 v21 = (void *)MEMORY[0x263F08730];
    v57[0] = v20;
    int v22 = +[AnalyticsStoreProxy predicateForEntityWithAge:v13 maxAge:a6];
    __int16 v23 = (void *)[v22 copy];
    v57[1] = v23;
    uint64_t v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v57 count:2];
    id v25 = [v21 andPredicateWithSubpredicates:v24];
  }
  else
  {
    id v25 = v20;
  }
  uint64_t v26 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"source.channel <= %d", 14);
  uint64_t v27 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"source.channel > %d", 14);
  uint64_t v28 = (void *)MEMORY[0x263F08730];
  v46 = (void *)v26;
  v47 = v25;
  v45 = (void *)v27;
  if (v49)
  {
    id v56 = v25;
    uint64_t v29 = &v56;
  }
  else
  {
    id v55 = v25;
    uint64_t v29 = &v55;
    uint64_t v26 = v27;
  }
  v29[1] = (id)v26;
  v30 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:");
  v31 = [v28 andPredicateWithSubpredicates:v30];

  v50 = (void *)v13;
  v32 = +[AnalyticsStoreProxy fetchRequestForEntity:v13];
  [v32 setResultType:2];
  [v32 setReturnsDistinctResults:1];
  __int16 v33 = [MEMORY[0x263F087F0] expressionForKeyPath:@"sourceTimeSpentSecs"];
  int v34 = (void *)MEMORY[0x263F087F0];
  __int16 v35 = [MEMORY[0x263EFF8C0] arrayWithObject:v33];
  id v36 = [v34 expressionForFunction:@"sum:" arguments:v35];

  id v37 = objc_alloc_init(MEMORY[0x263EFF248]);
  [v37 setName:@"dwellTimeInBand"];
  [v37 setExpression:v36];
  [v37 setExpressionResultType:300];
  v38 = [MEMORY[0x263EFF8C0] arrayWithObject:v37];
  [v32 setPropertiesToFetch:v38];

  v39 = +[AnalyticsStoreProxy fetch:v32 withPredicate:v31 moc:v54];
  v40 = v39;
  if (v39)
  {
    v41 = [v39 lastObject];
    v42 = [v41 valueForKey:@"dwellTimeInBand"];
    __int16 v35 = (void *)[v42 unsignedIntegerValue];
  }
  else
  {
    v41 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v60 = "+[RoamMO dwellTimeInBand:bandIs24:bssid:maxAgeInDays:moc:]";
      __int16 v61 = 1024;
      int v62 = 207;
      _os_log_impl(&dword_21D96D000, v41, OS_LOG_TYPE_ERROR, "%{public}s::%d:resultsArray nil", buf, 0x12u);
    }
  }

  id v12 = v52;
  id v11 = v53;
  if (!v40) {
LABEL_14:
  }
    __int16 v35 = 0;

  return (unint64_t)v35;
}

+ (unint64_t)roamsCountBetweenBssids:(id)a3 target:(id)a4 moc:(id)a5
{
  v22[3] = *MEMORY[0x263EF8340];
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  BOOL v10 = +[RoamMO entityName];
  id v11 = +[AnalyticsStoreProxy fetchRequestForEntity:v10];
  id v12 = (void *)MEMORY[0x263F08730];
  uint64_t v13 = [MEMORY[0x263F08A98] predicateWithFormat:@"source.bssid == %@", v9];

  v22[0] = v13;
  BOOL v14 = [MEMORY[0x263F08A98] predicateWithFormat:@"target.bssid == %@", v8];

  v22[1] = v14;
  v15 = [MEMORY[0x263F08A98] predicateWithFormat:@"status == 0"];
  void v22[2] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:3];
  uint64_t v17 = [v12 andPredicateWithSubpredicates:v16];

  [v11 setPredicate:v17];
  uint64_t v21 = 0;
  uint64_t v18 = [v7 countForFetchRequest:v11 error:&v21];

  if (v18 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v19 = 0;
  }
  else {
    unint64_t v19 = v18;
  }

  return v19;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"Roam"];
}

@end