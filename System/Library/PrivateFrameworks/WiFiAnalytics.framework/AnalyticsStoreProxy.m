@interface AnalyticsStoreProxy
+ (BOOL)batchDelete:(id)a3 withPredicate:(id)a4 withFetchRequest:(id)a5 moc:(id)a6;
+ (BOOL)batchUpdate:(id)a3 withPredicate:(id)a4 propertiesToUpdate:(id)a5 moc:(id)a6;
+ (id)analyticsStoreEntitiesWithDate;
+ (id)analyticsStoreEntityNames;
+ (id)analyticsStoreEntityRelationshipNames;
+ (id)createEntity:(id)a3 moc:(id)a4;
+ (id)entity:(id)a3 withPredicate:(id)a4 created:(BOOL *)a5 moc:(id)a6;
+ (id)entityByCounting:(id)a3 withPredicate:(id)a4 created:(BOOL *)a5 moc:(id)a6;
+ (id)fetch:(id)a3 withPredicate:(id)a4 moc:(id)a5;
+ (id)fetchAll:(id)a3 moc:(id)a4;
+ (id)fetchFirst:(id)a3 withPredicate:(id)a4 moc:(id)a5;
+ (id)fetchPropertiesForEntity:(id)a3 properties:(id)a4 predicate:(id)a5 moc:(id)a6;
+ (id)fetchPropertiesForEntityWithLimitAndSortDescriptor:(id)a3 properties:(id)a4 predicate:(id)a5 fetchLimit:(unint64_t)a6 sortDescriptor:(id)a7 returnDistinct:(BOOL)a8 moc:(id)a9;
+ (id)fetchRequestForEntity:(id)a3;
+ (id)fetchRequestForEntityWithBatchSize:(id)a3 batchSize:(unint64_t)a4 prefetch:(id)a5;
+ (id)fetchRequestForEntityWithOffset:(id)a3 limit:(unint64_t)a4 offset:(unint64_t)a5 prefetch:(id)a6;
+ (id)predicateForEntityWithAge:(id)a3 maxAge:(unint64_t)a4;
+ (id)predicateForEntityWithAgeOlderThan:(id)a3 dateAttribute:(id)a4 olderThan:(double)a5;
+ (unint64_t)entityCount:(id)a3 withPredicate:(id)a4 moc:(id)a5;
@end

@implementation AnalyticsStoreProxy

void __47__AnalyticsStoreProxy_fetch_withPredicate_moc___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 executeFetchRequest:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

+ (id)fetch:(id)a3 withPredicate:(id)a4 moc:(id)a5
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = v9;
  if (!v7)
  {
    v15 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&buf[4] = "+[AnalyticsStoreProxy fetch:withPredicate:moc:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 59;
      v16 = "%{public}s::%d:fetch request nil";
LABEL_16:
      _os_log_impl(&dword_21D96D000, v15, OS_LOG_TYPE_ERROR, v16, buf, 0x12u);
    }
LABEL_17:

LABEL_8:
    v12 = 0;
    goto LABEL_9;
  }
  if (!v9)
  {
    v15 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&buf[4] = "+[AnalyticsStoreProxy fetch:withPredicate:moc:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 60;
      v16 = "%{public}s::%d:moc request nil";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v46 = __Block_byref_object_copy__1;
  v47 = __Block_byref_object_dispose__1;
  id v48 = 0;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__1;
  v33 = __Block_byref_object_dispose__1;
  id v34 = 0;
  if (v8) {
    [v7 setPredicate:v8];
  }
  uint64_t v21 = MEMORY[0x263EF8330];
  uint64_t v22 = 3221225472;
  v23 = __47__AnalyticsStoreProxy_fetch_withPredicate_moc___block_invoke;
  v24 = &unk_264466EB0;
  v27 = buf;
  id v25 = v10;
  id v11 = v7;
  id v26 = v11;
  v28 = &v29;
  [v25 performBlockAndWait:&v21];
  v12 = *(void **)(*(void *)&buf[8] + 40);
  if (v12)
  {
    id v13 = v12;
  }
  else
  {
    v17 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v11, "entityName", v21, v22, v23, v24, v25);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      id v19 = [(id)v30[5] localizedDescription];
      v20 = [(id)v30[5] userInfo];
      *(_DWORD *)v35 = 136447234;
      v36 = "+[AnalyticsStoreProxy fetch:withPredicate:moc:]";
      __int16 v37 = 1024;
      int v38 = 71;
      __int16 v39 = 2112;
      id v40 = v18;
      __int16 v41 = 2112;
      id v42 = v19;
      __int16 v43 = 2112;
      v44 = v20;
      _os_log_impl(&dword_21D96D000, v17, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error fetching %@. %@ %@", v35, 0x30u);
    }
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(buf, 8);

  if (!v12) {
    goto LABEL_8;
  }
LABEL_9:

  return v12;
}

+ (id)fetchAll:(id)a3 moc:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v11 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&buf[4] = "+[AnalyticsStoreProxy fetchAll:moc:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 18;
      _os_log_impl(&dword_21D96D000, v11, OS_LOG_TYPE_ERROR, "%{public}s::%d:moc nil", buf, 0x12u);
    }

    goto LABEL_7;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v17 = __Block_byref_object_copy__1;
  id v18 = __Block_byref_object_dispose__1;
  id v19 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __36__AnalyticsStoreProxy_fetchAll_moc___block_invoke;
  v12[3] = &unk_264466E88;
  v15 = buf;
  id v13 = v6;
  id v14 = v7;
  [v14 performBlockAndWait:v12];
  id v8 = *(void **)(*(void *)&buf[8] + 40);
  if (v8 && [v8 count])
  {
    id v4 = *(id *)(*(void *)&buf[8] + 40);
    int v9 = 0;
  }
  else
  {
    int v9 = 1;
  }

  _Block_object_dispose(buf, 8);
  if (v9) {
LABEL_7:
  }
    id v4 = 0;

  return v4;
}

void __36__AnalyticsStoreProxy_fetchAll_moc___block_invoke(void *a1)
{
  id v5 = +[AnalyticsStoreProxy fetchRequestForEntity:a1[4]];
  uint64_t v2 = +[AnalyticsStoreProxy fetch:v5 withPredicate:0 moc:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

+ (id)createEntity:(id)a3 moc:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (!v5)
  {
    v12 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&buf[4] = "+[AnalyticsStoreProxy createEntity:moc:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 33;
      id v13 = "%{public}s::%d:entityName nil";
LABEL_14:
      _os_log_impl(&dword_21D96D000, v12, OS_LOG_TYPE_ERROR, v13, buf, 0x12u);
    }
LABEL_15:

LABEL_6:
    int v9 = 0;
    goto LABEL_7;
  }
  if (!v6)
  {
    v12 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&buf[4] = "+[AnalyticsStoreProxy createEntity:moc:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 34;
      id v13 = "%{public}s::%d:moc nil";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v26 = __Block_byref_object_copy__1;
  v27 = __Block_byref_object_dispose__1;
  id v28 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __40__AnalyticsStoreProxy_createEntity_moc___block_invoke;
  v15[3] = &unk_264466E88;
  id v18 = buf;
  id v8 = v5;
  id v16 = v8;
  id v17 = v7;
  [v17 performBlockAndWait:v15];
  int v9 = *(void **)(*(void *)&buf[8] + 40);
  if (v9)
  {
    id v10 = v9;
  }
  else
  {
    id v14 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v19 = 136446722;
      uint64_t v20 = "+[AnalyticsStoreProxy createEntity:moc:]";
      __int16 v21 = 1024;
      int v22 = 41;
      __int16 v23 = 2112;
      id v24 = v8;
      _os_log_impl(&dword_21D96D000, v14, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error creating entity:%@", v19, 0x1Cu);
    }
  }
  _Block_object_dispose(buf, 8);

  if (!v9) {
    goto LABEL_6;
  }
LABEL_7:

  return v9;
}

void __40__AnalyticsStoreProxy_createEntity_moc___block_invoke(void *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263EFF240] insertNewObjectForEntityForName:a1[4] inManagedObjectContext:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = a1[4];
    uint64_t v6 = a1[5];
    int v8 = 136446978;
    int v9 = "+[AnalyticsStoreProxy createEntity:moc:]_block_invoke";
    __int16 v10 = 1024;
    int v11 = 39;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    __int16 v14 = 2112;
    uint64_t v15 = v7;
    _os_log_impl(&dword_21D96D000, v5, OS_LOG_TYPE_DEBUG, "%{public}s::%d:[moc: %@] Inserted new %@", (uint8_t *)&v8, 0x26u);
  }
}

+ (id)fetchFirst:(id)a3 withPredicate:(id)a4 moc:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [v10 setFetchLimit:1];
  int v11 = [a1 fetch:v10 withPredicate:v9 moc:v8];

  if (v11)
  {
    __int16 v12 = [v11 firstObject];
  }
  else
  {
    __int16 v12 = 0;
  }

  return v12;
}

+ (id)fetchRequestForEntity:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a3)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x263EFF260], "fetchRequestWithEntityName:");
  }
  else
  {
    id v5 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446466;
      uint64_t v7 = "+[AnalyticsStoreProxy fetchRequestForEntity:]";
      __int16 v8 = 1024;
      int v9 = 79;
      _os_log_impl(&dword_21D96D000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:entityName nil", (uint8_t *)&v6, 0x12u);
    }

    uint64_t v3 = 0;
  }
  return v3;
}

+ (unint64_t)entityCount:(id)a3 withPredicate:(id)a4 moc:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = v9;
  if (!v7)
  {
    uint64_t v16 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 136446466;
    id v26 = "+[AnalyticsStoreProxy entityCount:withPredicate:moc:]";
    __int16 v27 = 1024;
    int v28 = 89;
    id v17 = "%{public}s::%d:entityName nil";
LABEL_12:
    id v18 = v16;
    uint32_t v19 = 18;
LABEL_15:
    _os_log_impl(&dword_21D96D000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);
    goto LABEL_16;
  }
  if (!v9)
  {
    uint64_t v16 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 136446466;
    id v26 = "+[AnalyticsStoreProxy entityCount:withPredicate:moc:]";
    __int16 v27 = 1024;
    int v28 = 90;
    id v17 = "%{public}s::%d:entityName nil";
    goto LABEL_12;
  }
  int v11 = +[AnalyticsStoreProxy fetchRequestForEntity:v7];
  if (!v11)
  {
    uint64_t v16 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v26 = "+[AnalyticsStoreProxy entityCount:withPredicate:moc:]";
      __int16 v27 = 1024;
      int v28 = 93;
      __int16 v29 = 2112;
      id v30 = v7;
      id v17 = "%{public}s::%d:fetch request nil for entity:%@";
      id v18 = v16;
      uint32_t v19 = 28;
      goto LABEL_15;
    }
LABEL_16:
    __int16 v12 = 0;
    unint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_20:

    goto LABEL_7;
  }
  __int16 v12 = v11;
  if (v8) {
    [v11 setPredicate:v8];
  }
  id v24 = 0;
  unint64_t v13 = [v10 countForFetchRequest:v12 error:&v24];
  __int16 v14 = v24;
  if (v14)
  {
    uint64_t v16 = v14;
    uint64_t v20 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      __int16 v21 = [v12 entityName];
      int v22 = [v16 localizedDescription];
      __int16 v23 = [v16 userInfo];
      *(_DWORD *)buf = 136447234;
      id v26 = "+[AnalyticsStoreProxy entityCount:withPredicate:moc:]";
      __int16 v27 = 1024;
      int v28 = 100;
      __int16 v29 = 2112;
      id v30 = v21;
      __int16 v31 = 2112;
      v32 = v22;
      __int16 v33 = 2112;
      id v34 = v23;
      _os_log_impl(&dword_21D96D000, v20, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error countForFetchRequest for entity %@. %@ %@", buf, 0x30u);
    }
    goto LABEL_20;
  }
LABEL_7:

  return v13;
}

+ (id)entityByCounting:(id)a3 withPredicate:(id)a4 created:(BOOL *)a5 moc:(id)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  __int16 v12 = v11;
  if (!v9)
  {
    __int16 v14 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    int v23 = 136446466;
    id v24 = "+[AnalyticsStoreProxy entityByCounting:withPredicate:created:moc:]";
    __int16 v25 = 1024;
    int v26 = 106;
    uint64_t v15 = "%{public}s::%d:entityName nil";
    goto LABEL_28;
  }
  if (!v11)
  {
    __int16 v14 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    int v23 = 136446466;
    id v24 = "+[AnalyticsStoreProxy entityByCounting:withPredicate:created:moc:]";
    __int16 v25 = 1024;
    int v26 = 107;
    uint64_t v15 = "%{public}s::%d:moc nil";
LABEL_28:
    uint64_t v16 = v14;
    uint32_t v17 = 18;
    goto LABEL_7;
  }
  unint64_t v13 = +[AnalyticsStoreProxy entityCount:v9 withPredicate:v10 moc:v11];
  if (v13)
  {
    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    {
      __int16 v14 = WALogCategoryDeviceStoreHandle();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
LABEL_20:

        id v18 = 0;
        goto LABEL_21;
      }
      int v23 = 136446722;
      id v24 = "+[AnalyticsStoreProxy entityByCounting:withPredicate:created:moc:]";
      __int16 v25 = 1024;
      int v26 = 111;
      __int16 v27 = 2112;
      id v28 = v9;
      uint64_t v15 = "%{public}s::%d:count NSNotFound for entity:%@";
      uint64_t v16 = v14;
      uint32_t v17 = 28;
LABEL_7:
      _os_log_impl(&dword_21D96D000, v16, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v23, v17);
      goto LABEL_20;
    }
    uint32_t v19 = +[AnalyticsStoreProxy fetchRequestForEntity:v9];
    __int16 v14 = +[AnalyticsStoreProxy fetch:v19 withPredicate:v10 moc:v12];

    if (!v14 || ![v14 count])
    {
      uint64_t v20 = WALogCategoryDeviceStoreHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        __int16 v21 = [v10 predicateFormat];
        int v23 = 136446978;
        id v24 = "+[AnalyticsStoreProxy entityByCounting:withPredicate:created:moc:]";
        __int16 v25 = 1024;
        int v26 = 130;
        __int16 v27 = 2112;
        id v28 = v9;
        __int16 v29 = 2112;
        id v30 = v21;
        _os_log_impl(&dword_21D96D000, v20, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error fetching entity %@ with predicate %@", (uint8_t *)&v23, 0x26u);
      }
      goto LABEL_20;
    }
    if (a5) {
      *a5 = 0;
    }
    if ([v14 count] != 1) {
      abort();
    }
    id v18 = [v14 firstObject];
  }
  else
  {
    if (a5) {
      *a5 = 1;
    }
    id v18 = +[AnalyticsStoreProxy createEntity:v9 moc:v12];
  }
LABEL_21:

  return v18;
}

+ (id)entity:(id)a3 withPredicate:(id)a4 created:(BOOL *)a5 moc:(id)a6
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  __int16 v12 = v11;
  if (!v9)
  {
    uint32_t v19 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "+[AnalyticsStoreProxy entity:withPredicate:created:moc:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 139;
      _os_log_impl(&dword_21D96D000, v19, OS_LOG_TYPE_ERROR, "%{public}s::%d:entityName nil", buf, 0x12u);
    }
    goto LABEL_21;
  }
  if (!v11)
  {
    uint32_t v19 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "+[AnalyticsStoreProxy entity:withPredicate:created:moc:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 140;
      _os_log_impl(&dword_21D96D000, v19, OS_LOG_TYPE_ERROR, "%{public}s::%d:moc nil", buf, 0x12u);
    }
LABEL_21:

    uint32_t v17 = 0;
    goto LABEL_13;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  __int16 v29 = __Block_byref_object_copy__1;
  id v30 = __Block_byref_object_dispose__1;
  id v31 = 0;
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  int v22 = __56__AnalyticsStoreProxy_entity_withPredicate_created_moc___block_invoke;
  int v23 = &unk_264466ED8;
  __int16 v27 = buf;
  id v13 = v9;
  id v24 = v13;
  id v25 = v10;
  id v14 = v12;
  id v26 = v14;
  [v14 performBlockAndWait:&v20];
  uint64_t v15 = *(void **)(*(void *)&buf[8] + 40);
  if (v15 && objc_msgSend(v15, "count", v20, v21, v22, v23, v24, v25))
  {
    if (a5) {
      *a5 = 0;
    }
    if ([*(id *)(*(void *)&buf[8] + 40) count] != 1) {
      abort();
    }
    uint64_t v16 = [*(id *)(*(void *)&buf[8] + 40) firstObject];
  }
  else
  {
    if (a5) {
      *a5 = 1;
    }
    uint64_t v16 = +[AnalyticsStoreProxy createEntity:moc:](AnalyticsStoreProxy, "createEntity:moc:", v13, v14, v20, v21, v22, v23);
  }
  uint32_t v17 = (void *)v16;

  _Block_object_dispose(buf, 8);
LABEL_13:

  return v17;
}

void __56__AnalyticsStoreProxy_entity_withPredicate_created_moc___block_invoke(void *a1)
{
  id v5 = +[AnalyticsStoreProxy fetchRequestForEntity:a1[4]];
  uint64_t v2 = +[AnalyticsStoreProxy fetch:v5 withPredicate:a1[5] moc:a1[6]];
  uint64_t v3 = *(void *)(a1[7] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

+ (id)fetchRequestForEntityWithOffset:(id)a3 limit:(unint64_t)a4 offset:(unint64_t)a5 prefetch:(id)a6
{
  id v9 = a6;
  id v10 = +[AnalyticsStoreProxy fetchRequestForEntity:a3];
  [v10 setFetchLimit:a4];
  [v10 setFetchOffset:a5];
  if (v9) {
    [v10 setRelationshipKeyPathsForPrefetching:v9];
  }

  return v10;
}

+ (id)fetchRequestForEntityWithBatchSize:(id)a3 batchSize:(unint64_t)a4 prefetch:(id)a5
{
  id v7 = a5;
  id v8 = +[AnalyticsStoreProxy fetchRequestForEntity:a3];
  [v8 setFetchBatchSize:a4];
  if (v7) {
    [v8 setRelationshipKeyPathsForPrefetching:v7];
  }

  return v8;
}

+ (id)predicateForEntityWithAge:(id)a3 maxAge:(unint64_t)a4
{
  id v5 = a3;
  int v6 = +[AnalyticsStoreProxy analyticsStoreEntitiesWithDate];
  int v7 = [v6 containsObject:v5];

  if (v7)
  {
    id v8 = [MEMORY[0x263EFF910] date];
    id v9 = objc_alloc_init(MEMORY[0x263EFF918]);
    [v9 setDay:-(uint64_t)a4];
    id v10 = [MEMORY[0x263EFF8F0] currentCalendar];
    id v11 = [v10 dateByAddingComponents:v9 toDate:v8 options:0];
    __int16 v12 = [MEMORY[0x263F08A98] predicateWithFormat:@"(date >= %@) AND (date <= %@)", v11, v8];
  }
  else
  {
    __int16 v12 = 0;
  }
  return v12;
}

+ (id)predicateForEntityWithAgeOlderThan:(id)a3 dateAttribute:(id)a4 olderThan:(double)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = (void *)MEMORY[0x263EFF910];
  id v9 = a4;
  id v10 = [v8 date];
  id v11 = objc_alloc_init(MEMORY[0x263EFF918]);
  [v11 setDay:-(uint64_t)(a5 / 86400.0)];
  __int16 v12 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v13 = [v12 dateByAddingComponents:v11 toDate:v10 options:0];
  id v14 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K < %@", v9, v13];

  uint64_t v15 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = [v14 description];
    *(_DWORD *)buf = 136446978;
    uint32_t v19 = "+[AnalyticsStoreProxy predicateForEntityWithAgeOlderThan:dateAttribute:olderThan:]";
    __int16 v20 = 1024;
    int v21 = 217;
    __int16 v22 = 2112;
    id v23 = v7;
    __int16 v24 = 2112;
    id v25 = v16;
    _os_log_impl(&dword_21D96D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Batch deleted predicate on %@: %@", buf, 0x26u);
  }
  return v14;
}

+ (BOOL)batchDelete:(id)a3 withPredicate:(id)a4 withFetchRequest:(id)a5 moc:(id)a6
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v11) {
    id v13 = v11;
  }
  else {
    id v13 = (id)[objc_alloc(MEMORY[0x263EFF260]) initWithEntityName:v9];
  }
  id v14 = v13;
  if (v10)
  {
    [v13 setPredicate:v10];
    uint64_t v15 = [v10 predicateFormat];
  }
  else
  {
    uint64_t v15 = 0;
  }
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263EFF1D0]) initWithFetchRequest:v14];
  [v16 setResultType:1];
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  uint64_t v49 = __Block_byref_object_copy__1;
  v50 = __Block_byref_object_dispose__1;
  id v51 = 0;
  uint64_t v40 = 0;
  __int16 v41 = &v40;
  uint64_t v42 = 0x3032000000;
  __int16 v43 = __Block_byref_object_copy__1;
  v44 = __Block_byref_object_dispose__1;
  id v45 = 0;
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __70__AnalyticsStoreProxy_batchDelete_withPredicate_withFetchRequest_moc___block_invoke;
  v35[3] = &unk_264466EB0;
  int v38 = &v46;
  id v17 = v12;
  id v36 = v17;
  id v18 = v16;
  id v37 = v18;
  __int16 v39 = &v40;
  [v17 performBlockAndWait:v35];
  if (v41[5])
  {
    id v25 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      id v27 = [(id)v41[5] localizedDescription];
      uint64_t v28 = [(id)v41[5] userInfo];
      *(_DWORD *)buf = 136447490;
      v53 = "+[AnalyticsStoreProxy batchDelete:withPredicate:withFetchRequest:moc:]";
      __int16 v54 = 1024;
      int v55 = 246;
      __int16 v56 = 2112;
      uint64_t v57 = (uint64_t)v9;
      __int16 v58 = 2112;
      id v59 = v15;
      __int16 v60 = 2112;
      uint64_t v61 = (uint64_t)v27;
      __int16 v62 = 2112;
      id v30 = (void *)v28;
      uint64_t v63 = v28;
      _os_log_impl(&dword_21D96D000, v25, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error executing batch delete for entity[%@] predicateFormat[%@]. %@ %@", buf, 0x3Au);
    }
  }
  else
  {
    uint32_t v19 = [(id)v47[5] result];
    BOOL v20 = [v19 count] == 0;

    if (v20)
    {
      BOOL v24 = 1;
      goto LABEL_15;
    }
    if ([(id)v47[5] resultType] == 1)
    {
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __70__AnalyticsStoreProxy_batchDelete_withPredicate_withFetchRequest_moc___block_invoke_12;
      v31[3] = &unk_264466F28;
      __int16 v33 = &v46;
      uint64_t v32 = v17;
      id v34 = &v40;
      [v32 performBlockAndWait:v31];
      int v21 = WALogCategoryDeviceStoreHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        __int16 v22 = [(id)v47[5] result];
        uint64_t v23 = [v22 count];
        *(_DWORD *)buf = 136447234;
        v53 = "+[AnalyticsStoreProxy batchDelete:withPredicate:withFetchRequest:moc:]";
        __int16 v54 = 1024;
        int v55 = 260;
        __int16 v56 = 2048;
        uint64_t v57 = v23;
        __int16 v58 = 2112;
        id v59 = v9;
        __int16 v60 = 2112;
        uint64_t v61 = (uint64_t)v15;
        _os_log_impl(&dword_21D96D000, v21, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Batch deleted %lu MOs of entity[%@] predicateFormat[%@]", buf, 0x30u);
      }
      BOOL v24 = 1;
      id v25 = v32;
      goto LABEL_13;
    }
    id v25 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = [(id)v47[5] resultType];
      *(_DWORD *)buf = 136447234;
      v53 = "+[AnalyticsStoreProxy batchDelete:withPredicate:withFetchRequest:moc:]";
      __int16 v54 = 1024;
      int v55 = 249;
      __int16 v56 = 2112;
      uint64_t v57 = (uint64_t)v9;
      __int16 v58 = 2112;
      id v59 = v15;
      __int16 v60 = 2048;
      uint64_t v61 = v29;
      _os_log_impl(&dword_21D96D000, v25, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error executing batch delete for entity[%@] predicateFormat[%@]. Unexpected ResultType %lu ", buf, 0x30u);
    }
  }
  BOOL v24 = 0;
LABEL_13:

LABEL_15:
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v46, 8);
  return v24;
}

void __70__AnalyticsStoreProxy_batchDelete_withPredicate_withFetchRequest_moc___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 executeRequest:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[6] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __70__AnalyticsStoreProxy_batchDelete_withPredicate_withFetchRequest_moc___block_invoke_12(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) result];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __70__AnalyticsStoreProxy_batchDelete_withPredicate_withFetchRequest_moc___block_invoke_2;
  v5[3] = &unk_264466F00;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 enumerateObjectsUsingBlock:v5];
}

void __70__AnalyticsStoreProxy_batchDelete_withPredicate_withFetchRequest_moc___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v3 existingObjectWithID:a2 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  if (v5 && ([v5 isFault] & 1) == 0) {
    [*(id *)(a1 + 32) refreshObject:v5 mergeChanges:1];
  }
}

+ (BOOL)batchUpdate:(id)a3 withPredicate:(id)a4 propertiesToUpdate:(id)a5 moc:(id)a6
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v9) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  BOOL v14 = !v13;
  if (v13)
  {
    uint64_t v15 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      uint64_t v23 = "+[AnalyticsStoreProxy batchUpdate:withPredicate:propertiesToUpdate:moc:]";
      __int16 v24 = 1024;
      int v25 = 307;
      __int16 v26 = 2112;
      id v27 = v9;
      __int16 v28 = 2112;
      id v29 = v11;
      _os_log_impl(&dword_21D96D000, v15, OS_LOG_TYPE_ERROR, "%{public}s::%d:entityName %@ or propertiesToUpdate %@ nil", buf, 0x26u);
    }
  }
  else
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __72__AnalyticsStoreProxy_batchUpdate_withPredicate_propertiesToUpdate_moc___block_invoke;
    v17[3] = &unk_264466F50;
    id v18 = v9;
    id v19 = v11;
    id v20 = v10;
    id v21 = v12;
    [v21 performBlockAndWait:v17];

    uint64_t v15 = v18;
  }

  return v14;
}

void __72__AnalyticsStoreProxy_batchUpdate_withPredicate_propertiesToUpdate_moc___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263EFF1E0] batchUpdateRequestWithEntityName:*(void *)(a1 + 32)];
  [v2 setPropertiesToUpdate:*(void *)(a1 + 40)];
  [v2 setPredicate:*(void *)(a1 + 48)];
  id v3 = *(void **)(a1 + 48);
  if (v3)
  {
    uint64_t v4 = [v3 predicateFormat];
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t v5 = [*(id *)(a1 + 56) persistentStoreCoordinator];
  id v6 = [v5 persistentStores];
  [v2 setAffectedStores:v6];

  [v2 setResultType:1];
  uint64_t v7 = *(void **)(a1 + 56);
  id v22 = 0;
  id v8 = [v7 executeRequest:v2 error:&v22];
  id v9 = v22;
  id v10 = [v8 result];
  char v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) == 0)
  {
    uint64_t v15 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 136446466;
    __int16 v24 = "+[AnalyticsStoreProxy batchUpdate:withPredicate:propertiesToUpdate:moc:]_block_invoke";
    __int16 v25 = 1024;
    int v26 = 302;
    uint64_t v16 = "%{public}s::%d:batchUpdate results empty";
LABEL_11:
    _os_log_impl(&dword_21D96D000, v15, OS_LOG_TYPE_ERROR, v16, buf, 0x12u);
    goto LABEL_12;
  }
  id v12 = [v8 result];
  uint64_t v13 = [v12 count];

  if (!v13)
  {
    uint64_t v15 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 136446466;
    __int16 v24 = "+[AnalyticsStoreProxy batchUpdate:withPredicate:propertiesToUpdate:moc:]_block_invoke";
    __int16 v25 = 1024;
    int v26 = 299;
    uint64_t v16 = "%{public}s::%d:batchUpdate count is 0";
    goto LABEL_11;
  }
  BOOL v14 = *(void **)(a1 + 56);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __72__AnalyticsStoreProxy_batchUpdate_withPredicate_propertiesToUpdate_moc___block_invoke_2;
  v17[3] = &unk_264466F50;
  id v18 = v8;
  id v19 = *(id *)(a1 + 56);
  id v20 = *(id *)(a1 + 32);
  id v21 = v4;
  [v14 performBlockAndWait:v17];

  uint64_t v15 = v18;
LABEL_12:
}

void __72__AnalyticsStoreProxy_batchUpdate_withPredicate_propertiesToUpdate_moc___block_invoke_2(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v2 = [*(id *)(a1 + 32) result];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v19 objects:v33 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v20;
    *(void *)&long long v4 = 136447234;
    long long v17 = v4;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 8 * v7);
        id v9 = *(void **)(a1 + 40);
        id v18 = 0;
        id v10 = objc_msgSend(v9, "existingObjectWithID:error:", v8, &v18, v17);
        id v11 = v18;
        [*(id *)(a1 + 40) refreshObject:v10 mergeChanges:1];
        id v12 = WALogCategoryDeviceStoreHandle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v13 = [*(id *)(a1 + 32) result];
          uint64_t v14 = [v13 count];
          uint64_t v15 = *(void *)(a1 + 48);
          uint64_t v16 = *(void *)(a1 + 56);
          *(_DWORD *)buf = v17;
          __int16 v24 = "+[AnalyticsStoreProxy batchUpdate:withPredicate:propertiesToUpdate:moc:]_block_invoke_2";
          __int16 v25 = 1024;
          int v26 = 295;
          __int16 v27 = 2048;
          uint64_t v28 = v14;
          __int16 v29 = 2112;
          uint64_t v30 = v15;
          __int16 v31 = 2112;
          uint64_t v32 = v16;
          _os_log_impl(&dword_21D96D000, v12, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Batch updated %lu MOs of entity[%@] predicateFormat[%@]", buf, 0x30u);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v2 countByEnumeratingWithState:&v19 objects:v33 count:16];
    }
    while (v5);
  }
}

+ (id)fetchPropertiesForEntity:(id)a3 properties:(id)a4 predicate:(id)a5 moc:(id)a6
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = +[AnalyticsStoreProxy fetchRequestForEntity:v9];
  uint64_t v14 = v13;
  if (v13)
  {
    if (v12)
    {
      [v13 setResultType:2];
      [v14 setReturnsDistinctResults:1];
      [v14 setPropertiesToFetch:v10];
      uint64_t v15 = +[AnalyticsStoreProxy fetch:v14 withPredicate:v11 moc:v12];
      goto LABEL_4;
    }
    long long v17 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v21 = 136446466;
      long long v22 = "+[AnalyticsStoreProxy fetchPropertiesForEntity:properties:predicate:moc:]";
      __int16 v23 = 1024;
      int v24 = 320;
      id v18 = "%{public}s::%d:moc nil";
      long long v19 = v17;
      uint32_t v20 = 18;
      goto LABEL_11;
    }
  }
  else
  {
    long long v17 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v21 = 136446722;
      long long v22 = "+[AnalyticsStoreProxy fetchPropertiesForEntity:properties:predicate:moc:]";
      __int16 v23 = 1024;
      int v24 = 319;
      __int16 v25 = 2112;
      id v26 = v9;
      id v18 = "%{public}s::%d:fetch request nil for entity:%@";
      long long v19 = v17;
      uint32_t v20 = 28;
LABEL_11:
      _os_log_impl(&dword_21D96D000, v19, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v21, v20);
    }
  }

  uint64_t v15 = 0;
LABEL_4:

  return v15;
}

+ (id)fetchPropertiesForEntityWithLimitAndSortDescriptor:(id)a3 properties:(id)a4 predicate:(id)a5 fetchLimit:(unint64_t)a6 sortDescriptor:(id)a7 returnDistinct:(BOOL)a8 moc:(id)a9
{
  BOOL v9 = a8;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a9;
  long long v19 = +[AnalyticsStoreProxy fetchRequestForEntity:v14];
  uint32_t v20 = v19;
  if (!v19)
  {
    int v24 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      uint64_t v30 = "+[AnalyticsStoreProxy fetchPropertiesForEntityWithLimitAndSortDescriptor:properties:predicate:fetchLimit:sor"
            "tDescriptor:returnDistinct:moc:]";
      __int16 v31 = 1024;
      int v32 = 340;
      __int16 v33 = 2112;
      id v34 = v14;
      __int16 v25 = "%{public}s::%d:fetch request nil for entity:%@";
      id v26 = v24;
      uint32_t v27 = 28;
LABEL_15:
      _os_log_impl(&dword_21D96D000, v26, OS_LOG_TYPE_ERROR, v25, buf, v27);
    }
LABEL_16:

    long long v22 = 0;
    goto LABEL_8;
  }
  if (!v18)
  {
    int v24 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v30 = "+[AnalyticsStoreProxy fetchPropertiesForEntityWithLimitAndSortDescriptor:properties:predicate:fetchLimit:sor"
            "tDescriptor:returnDistinct:moc:]";
      __int16 v31 = 1024;
      int v32 = 341;
      __int16 v25 = "%{public}s::%d:moc nil";
      id v26 = v24;
      uint32_t v27 = 18;
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  [v19 setResultType:2];
  [v20 setReturnsDistinctResults:v9];
  [v20 setPropertiesToFetch:v15];
  if (v17)
  {
    id v28 = v17;
    int v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v28 count:1];
    [v20 setSortDescriptors:v21];
  }
  if (a6) {
    [v20 setFetchLimit:a6];
  }
  long long v22 = +[AnalyticsStoreProxy fetch:v20 withPredicate:v16 moc:v18];
LABEL_8:

  return v22;
}

+ (id)analyticsStoreEntityNames
{
  id v14 = (void *)MEMORY[0x263EFF8C0];
  id v18 = +[BSSMO entityName];
  id v17 = +[NetworkMO entityName];
  id v16 = +[JoinMO entityName];
  uint64_t v13 = +[LeaveMO entityName];
  id v12 = +[RoamMO entityName];
  uint64_t v2 = +[GeoTagMO entityName];
  uint64_t v3 = +[ScanMO entityName];
  long long v4 = +[SessionMO entityName];
  uint64_t v5 = +[FaultMO entityName];
  uint64_t v6 = +[MetricEntryMO entityName];
  uint64_t v7 = +[WiFiStatMO entityName];
  uint64_t v8 = +[DiagnosticStateMO entityName];
  BOOL v9 = +[LinkTestMO entityName];
  id v10 = +[RecoveryMO entityName];
  id v15 = objc_msgSend(v14, "arrayWithObjects:", v18, v17, v16, v13, v12, v2, v3, v4, v5, v6, v7, v8, v9, v10, 0);

  return v15;
}

+ (id)analyticsStoreEntityRelationshipNames
{
  return (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"bss", @"network", @"roamsTo", @"roamsFrom", @"source", @"target", @"geoTag", @"joins", @"leaves", @"blacklist", @"join", @"leave", @"roamsSet", @"origin", @"result", @"metricEntry", @"faults",
               @"linkTest",
               @"linkTest",
               @"recoveries",
               0);
}

+ (id)analyticsStoreEntitiesWithDate
{
  id v13 = (id)MEMORY[0x263EFFA08];
  id v15 = +[JoinMO entityName];
  uint64_t v2 = +[LeaveMO entityName];
  uint64_t v3 = +[RoamMO entityName];
  long long v4 = +[GeoTagMO entityName];
  uint64_t v5 = +[ScanMO entityName];
  uint64_t v6 = +[SessionMO entityName];
  uint64_t v7 = +[FaultMO entityName];
  uint64_t v8 = +[MetricEntryMO entityName];
  BOOL v9 = +[DiagnosticStateMO entityName];
  id v10 = +[LinkTestMO entityName];
  id v11 = +[RecoveryMO entityName];
  objc_msgSend(v13, "setWithObjects:", v15, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, 0);
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end