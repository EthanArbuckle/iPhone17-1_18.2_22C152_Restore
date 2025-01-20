@interface NetworkMO
+ (BOOL)coalesceSsidsIntoColocatedScope:(id)a3 moc:(id)a4;
+ (BOOL)invalidateColocatedScopeForSsidArray:(id)a3 moc:(id)a4;
+ (BOOL)removeNetwork:(id)a3 moc:(id)a4;
+ (BOOL)setNetworkManagedObjectPropertyValueForKey:(id)a3 forKey:(id)a4 withValue:(id)a5;
+ (id)allStoredSsids:(id)a3;
+ (id)copyAllSsids:(id)a3;
+ (id)copyAllSsidsWithColocatedScopeId:(id)a3 moc:(id)a4;
+ (id)copyAllSsidsWithColocatedScopeIdStr:(id)a3 moc:(id)a4;
+ (id)copyAllSsidsWithTrait:(id)a3 trait:(unint64_t)a4;
+ (id)entityName;
+ (id)fetchRequest;
+ (id)generateInstance:(id)a3 created:(BOOL *)a4 moc:(id)a5;
+ (id)getFirstColocatedScopeUuidForSsids:(id)a3 moc:(id)a4;
+ (id)getInstance:(id)a3 moc:(id)a4;
+ (id)networkManagedObjectPropertyValue:(id)a3 forKey:(id)a4;
+ (int64_t)getTotalScore:(id)a3 moc:(id)a4;
+ (void)classifyTraitsForNetwork:(id)a3 distanceFilter:(double)a4 moc:(id)a5;
@end

@implementation NetworkMO

+ (id)entityName
{
  return @"Network";
}

+ (id)generateInstance:(id)a3 created:(BOOL *)a4 moc:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = +[NetworkMO entityName];
  v10 = [MEMORY[0x263F08A98] predicateWithFormat:@"ssid == %@", v7];
  v11 = +[AnalyticsStoreProxy entityByCounting:v9 withPredicate:v10 created:a4 moc:v8];

  if (a4 && *a4) {
    [v11 setSsid:v7];
  }

  return v11;
}

+ (id)getInstance:(id)a3 moc:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[NetworkMO fetchRequest];
  id v8 = [MEMORY[0x263F08A98] predicateWithFormat:@"ssid == %@", v6];

  v9 = +[AnalyticsStoreProxy fetch:v7 withPredicate:v8 moc:v5];

  if (v9)
  {
    v10 = [v9 firstObject];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)removeNetwork:(id)a3 moc:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc(MEMORY[0x263EFF1D0]);
  id v8 = +[NetworkMO fetchRequest];
  v9 = (void *)[v7 initWithFetchRequest:v8];

  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__4;
  v25 = __Block_byref_object_dispose__4;
  id v26 = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __31__NetworkMO_removeNetwork_moc___block_invoke;
  v17[3] = &unk_264466070;
  id v10 = v6;
  id v18 = v10;
  id v11 = v9;
  id v19 = v11;
  v20 = &v21;
  [v10 performBlockAndWait:v17];
  uint64_t v12 = v22[5];
  if (v12)
  {
    v14 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = [(id)v22[5] localizedDescription];
      v16 = [(id)v22[5] userInfo];
      *(_DWORD *)buf = 136447234;
      v28 = "+[NetworkMO removeNetwork:moc:]";
      __int16 v29 = 1024;
      int v30 = 74;
      __int16 v31 = 2112;
      id v32 = v5;
      __int16 v33 = 2112;
      id v34 = v15;
      __int16 v35 = 2112;
      v36 = v16;
      _os_log_impl(&dword_21D96D000, v14, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error executing batch delete for network[%@]. %@ %@", buf, 0x30u);
    }
  }

  _Block_object_dispose(&v21, 8);
  return v12 == 0;
}

void __31__NetworkMO_removeNetwork_moc___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v1 = a1[5];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  id v4 = (id)[v2 executeRequest:v1 error:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
}

+ (id)networkManagedObjectPropertyValue:(id)a3 forKey:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = v5;
  if (a3 && v5)
  {
    id v7 = [a3 channels];
    id v8 = v7;
    if (v7)
    {
      v9 = [v7 valueForKey:v6];
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    id v10 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446722;
      v13 = "+[NetworkMO networkManagedObjectPropertyValue:forKey:]";
      __int16 v14 = 1024;
      int v15 = 90;
      __int16 v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_21D96D000, v10, OS_LOG_TYPE_ERROR, "%{public}s::%d:Nil networkMO or key %@", (uint8_t *)&v12, 0x1Cu);
    }

    v9 = 0;
  }

  return v9;
}

+ (BOOL)setNetworkManagedObjectPropertyValueForKey:(id)a3 forKey:(id)a4 withValue:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v7)
  {
    id v11 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136446466;
      __int16 v16 = "+[NetworkMO setNetworkManagedObjectPropertyValueForKey:forKey:withValue:]";
      __int16 v17 = 1024;
      int v18 = 100;
      __int16 v14 = "%{public}s::%d:networkMO nil";
LABEL_12:
      _os_log_impl(&dword_21D96D000, v11, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v15, 0x12u);
    }
LABEL_13:
    BOOL v12 = 0;
    goto LABEL_7;
  }
  if (!v8)
  {
    id v11 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136446466;
      __int16 v16 = "+[NetworkMO setNetworkManagedObjectPropertyValueForKey:forKey:withValue:]";
      __int16 v17 = 1024;
      int v18 = 101;
      __int16 v14 = "%{public}s::%d:key nil";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  id v10 = [v7 channels];
  if (v10)
  {
    id v11 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v10];
    [v11 removeObjectForKey:v8];
  }
  else
  {
    id v11 = [MEMORY[0x263EFF9A0] dictionary];
  }
  [v11 setObject:v9 forKey:v8];
  [v7 setChannels:v11];

  BOOL v12 = 1;
LABEL_7:

  return v12;
}

+ (int64_t)getTotalScore:(id)a3 moc:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x223C0F2E0]();
  if (!v5)
  {
    id v9 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      id v26 = "+[NetworkMO getTotalScore:moc:]";
      __int16 v27 = 1024;
      int v28 = 132;
      uint64_t v21 = "%{public}s::%d:ssid nil";
      v22 = v9;
      uint32_t v23 = 18;
LABEL_34:
      _os_log_impl(&dword_21D96D000, v22, OS_LOG_TYPE_ERROR, v21, buf, v23);
    }
LABEL_35:
    int64_t v15 = 0;
    goto LABEL_29;
  }
  id v8 = +[NetworkMO getInstance:v5 moc:v6];
  if (!v8)
  {
    id v9 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v26 = "+[NetworkMO getTotalScore:moc:]";
      __int16 v27 = 1024;
      int v28 = 140;
      __int16 v29 = 2112;
      id v30 = v5;
      uint64_t v21 = "%{public}s::%d:networkMO nil for ssid %@";
      v22 = v9;
      uint32_t v23 = 28;
      goto LABEL_34;
    }
    goto LABEL_35;
  }
  id v9 = v8;
  if ([v8 switchedToCount]) {
    uint64_t v10 = 50 * [v9 switchedToCount];
  }
  else {
    uint64_t v10 = 0;
  }
  id v24 = v6;
  if ([v9 switchedAwayFromCount])
  {
    uint64_t v11 = [v9 switchedAwayFromCount];
    uint64_t v12 = -15 * v11;
    if (((v11 & 0x8000000000000000) == 0 || v10 <= (v12 ^ 0x7FFFFFFFFFFFFFFFLL))
      && (v10 >= (uint64_t)(0x8000000000000000 - v12) || v11 < 1))
    {
      v10 += v12;
    }
  }
  __int16 v14 = v7;
  if (([v9 isOmnipresent] & (v10 > (uint64_t)0x8000000000000009)) != 0) {
    v10 -= 10;
  }
  if ([v9 authFlags]) {
    v10 += 30;
  }
  if ([v9 isMoving]) {
    v10 += 10;
  }
  if ([v9 isTCPGood]) {
    v10 += 5;
  }
  if ([v9 isLongTermNetwork]) {
    int64_t v15 = v10 + 10;
  }
  else {
    int64_t v15 = v10;
  }
  __int16 v16 = NSString;
  __int16 v17 = [v9 ssid];
  int v18 = [v16 stringWithFormat:@"%@: switchedToCount %lld*%d, switchedAwayFromCount %lld*%d, secured %d*%d, tcpGood %d*%d, longTerm %d*%d", v17, -[NSObject switchedToCount](v9, "switchedToCount"), 50, -[NSObject switchedAwayFromCount](v9, "switchedAwayFromCount"), 4294967281, -[NSObject authFlags](v9, "authFlags"), 30, -[NSObject isTCPGood](v9, "isTCPGood"), 5, -[NSObject isLongTermNetwork](v9, "isLongTermNetwork"), 10];

  uint64_t v19 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    id v26 = "+[NetworkMO getTotalScore:moc:]";
    __int16 v27 = 1024;
    int v28 = 207;
    __int16 v29 = 2112;
    id v30 = v18;
    __int16 v31 = 2048;
    int64_t v32 = v15;
    _os_log_impl(&dword_21D96D000, v19, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%@ = %lld", buf, 0x26u);
  }

  id v7 = v14;
  id v6 = v24;
LABEL_29:

  return v15;
}

+ (id)allStoredSsids:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF980] array];
  id v5 = +[NetworkMO entityName];
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObject:@"network.ssid"];
  id v7 = +[AnalyticsStoreProxy fetchRequestForEntityWithBatchSize:v5 batchSize:100 prefetch:v6];
  id v8 = +[AnalyticsStoreProxy fetch:v7 withPredicate:0 moc:v3];

  id v9 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v27 = "+[NetworkMO allStoredSsids:]";
    __int16 v28 = 1024;
    int v29 = 224;
    __int16 v30 = 2048;
    uint64_t v31 = [v8 count];
    _os_log_impl(&dword_21D96D000, v9, OS_LOG_TYPE_DEBUG, "%{public}s::%d:ResultCount:%lu", buf, 0x1Cu);
  }

  if (v8)
  {
    id v20 = v3;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(id *)(*((void *)&v21 + 1) + 8 * i);
          __int16 v16 = v15;
          if (v15)
          {
            __int16 v17 = [v15 ssid];

            if (v17)
            {
              int v18 = [v16 ssid];
              [v4 addObject:v18];
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v12);
    }

    id v3 = v20;
  }
  if (![v4 count])
  {

    id v4 = 0;
  }

  return v4;
}

+ (void)classifyTraitsForNetwork:(id)a3 distanceFilter:(double)a4 moc:(id)a5
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  id v9 = (void *)MEMORY[0x223C0F2E0]();
  if (!v7)
  {
    uint64_t v11 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_38;
    }
    *(_DWORD *)buf = 136446466;
    v64 = "+[NetworkMO classifyTraitsForNetwork:distanceFilter:moc:]";
    __int16 v65 = 1024;
    int v66 = 250;
    v50 = "%{public}s::%d:ssid nil";
    v51 = v11;
    uint32_t v52 = 18;
LABEL_43:
    _os_log_impl(&dword_21D96D000, v51, OS_LOG_TYPE_ERROR, v50, buf, v52);
    goto LABEL_38;
  }
  uint64_t v10 = +[NetworkMO getInstance:v7 moc:v8];
  if (!v10)
  {
    uint64_t v11 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_38;
    }
    *(_DWORD *)buf = 136446722;
    v64 = "+[NetworkMO classifyTraitsForNetwork:distanceFilter:moc:]";
    __int16 v65 = 1024;
    int v66 = 253;
    __int16 v67 = 2112;
    id v68 = v7;
    v50 = "%{public}s::%d:networkMO nil for ssid %@";
    v51 = v11;
    uint32_t v52 = 28;
    goto LABEL_43;
  }
  uint64_t v11 = v10;
  uint64_t v12 = +[GeoTagMO geoTagsForNetwork:v7 moc:v8];
  uint64_t v13 = v12;
  v59 = v12;
  if (v12)
  {
    v53 = v11;
    v54 = v9;
    id v55 = v8;
    id v56 = v7;
    if ([v12 count])
    {
      int v14 = 0;
      int v15 = 0;
      uint64_t v16 = 0;
      uint64_t v17 = 0;
      unint64_t v18 = 1;
      while (1)
      {
        uint64_t v58 = v17;
        uint64_t v19 = [v13 objectAtIndex:v17];
        unint64_t v57 = v18;
        if (v19) {
          break;
        }
LABEL_24:

        uint64_t v17 = v58 + 1;
        unint64_t v18 = v57 + 1;
        if (v58 + 1 >= (unint64_t)[v13 count]) {
          goto LABEL_28;
        }
      }
      while (1)
      {
        if (v18 >= [v13 count]) {
          goto LABEL_24;
        }
        context = (void *)MEMORY[0x223C0F2E0]();
        id v20 = [v13 objectAtIndex:v18];
        id v21 = objc_alloc(MEMORY[0x263F00A58]);
        [v19 latitude];
        double v23 = v22;
        [v19 longitude];
        v25 = (void *)[v21 initWithLatitude:v23 longitude:v24];
        id v26 = objc_alloc(MEMORY[0x263F00A58]);
        [v20 latitude];
        double v28 = v27;
        [v20 longitude];
        __int16 v30 = (void *)[v26 initWithLatitude:v28 longitude:v29];
        [v25 distanceFromLocation:v30];
        if (v31 < a4) {
          break;
        }
        if ((unint64_t)++v16 > 1) {
          int v15 = 1;
        }
        if (v14)
        {
          int v43 = 1;
          if ((v15 & 1) == 0) {
            break;
          }
        }
        else
        {
          uint64_t v32 = [v19 bss];
          v60 = [v32 bssid];

          uint64_t v33 = [v20 bss];
          [v33 bssid];
          id v34 = v61 = v15;

          __int16 v35 = [v19 date];
          [v20 date];
          uint64_t v36 = v16;
          v38 = int v37 = v14;
          [v35 timeIntervalSinceDate:v38];
          double v40 = v39;

          int v14 = v37;
          uint64_t v16 = v36;

          unsigned __int8 v41 = [v60 isEqualToString:v34];
          if (v40 > 0.0) {
            unsigned __int8 v42 = v41;
          }
          else {
            unsigned __int8 v42 = 0;
          }
          if ((v42 & (v40 <= 604800.0)) != 0) {
            int v14 = 1;
          }

          int v15 = v61;
          uint64_t v13 = v59;
          int v43 = v14 & 1;
          if ((v61 & 1) == 0) {
            break;
          }
        }
        if (!v43) {
          break;
        }
        char v44 = 0;
LABEL_23:

        ++v18;
        if ((v44 & 1) == 0) {
          goto LABEL_24;
        }
      }
      char v44 = 1;
      goto LABEL_23;
    }
    LOBYTE(v15) = 0;
    LOBYTE(v14) = 0;
LABEL_28:
    uint64_t v13 = (void *)(v15 & 1);
    uint64_t v45 = v14 & 1;
    id v8 = v55;
    id v7 = v56;
    uint64_t v11 = v53;
    id v9 = v54;
  }
  else
  {
    uint64_t v45 = 0;
  }
  [v11 setIsOmnipresent:v13];
  v46 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
  {
    v47 = "NOT Omnipresent";
    v64 = "+[NetworkMO classifyTraitsForNetwork:distanceFilter:moc:]";
    __int16 v65 = 1024;
    int v66 = 298;
    *(_DWORD *)buf = 136446978;
    if (v13) {
      v47 = "Omnipresent";
    }
    __int16 v67 = 2112;
    id v68 = v7;
    __int16 v69 = 2080;
    v70 = v47;
    _os_log_impl(&dword_21D96D000, v46, OS_LOG_TYPE_INFO, "%{public}s::%d:Marking network %@ as %s.", buf, 0x26u);
  }

  [v11 setIsMoving:v45];
  v48 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
  {
    v49 = "NOT Moving";
    v64 = "+[NetworkMO classifyTraitsForNetwork:distanceFilter:moc:]";
    __int16 v65 = 1024;
    int v66 = 301;
    *(_DWORD *)buf = 136446978;
    if (v45) {
      v49 = "Moving";
    }
    __int16 v67 = 2112;
    id v68 = v7;
    __int16 v69 = 2080;
    v70 = v49;
    _os_log_impl(&dword_21D96D000, v48, OS_LOG_TYPE_INFO, "%{public}s::%d:Marking network %@ as %s.", buf, 0x26u);
  }

LABEL_38:
}

+ (id)copyAllSsidsWithTrait:(id)a3 trait:(unint64_t)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a4 >= 3)
  {
    uint64_t v12 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136446722;
      uint64_t v16 = "+[NetworkMO copyAllSsidsWithTrait:trait:]";
      __int16 v17 = 1024;
      int v18 = 321;
      __int16 v19 = 2048;
      unint64_t v20 = a4;
      _os_log_impl(&dword_21D96D000, v12, OS_LOG_TYPE_ERROR, "%{public}s::%d:unknown trait %lu", (uint8_t *)&v15, 0x1Cu);
    }

    id v8 = 0;
    id v6 = 0;
    goto LABEL_9;
  }
  id v6 = [MEMORY[0x263F08A98] predicateWithFormat:off_264467578[a4]];
  id v7 = +[NetworkMO entityName];
  id v8 = +[AnalyticsStoreProxy fetchPropertiesForEntity:v7 properties:&unk_26CE65ED8 predicate:v6 moc:v5];

  if (!v8 || ![v8 count])
  {
    int v14 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136446466;
      uint64_t v16 = "+[NetworkMO copyAllSsidsWithTrait:trait:]";
      __int16 v17 = 1024;
      int v18 = 326;
      _os_log_impl(&dword_21D96D000, v14, OS_LOG_TYPE_ERROR, "%{public}s::%d:resultsArrOfDicts nil", (uint8_t *)&v15, 0x12u);
    }

LABEL_9:
    uint64_t v10 = 0;
    goto LABEL_10;
  }
  id v9 = [v8 valueForKey:@"ssid"];
  uint64_t v10 = v9;
  if (!v9)
  {
LABEL_10:
    uint64_t v11 = 0;
    goto LABEL_11;
  }
  uint64_t v11 = (void *)[v9 copy];
LABEL_11:

  return v11;
}

+ (id)copyAllSsids:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = +[NetworkMO entityName];
  id v5 = +[AnalyticsStoreProxy fetchPropertiesForEntity:v4 properties:&unk_26CE65EF0 predicate:0 moc:v3];

  if (v5 && [v5 count])
  {
    id v6 = [v5 valueForKey:@"ssid"];
  }
  else
  {
    id v9 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136446466;
      uint64_t v11 = "+[NetworkMO copyAllSsids:]";
      __int16 v12 = 1024;
      int v13 = 343;
      _os_log_impl(&dword_21D96D000, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:resultsArrOfDicts nil", (uint8_t *)&v10, 0x12u);
    }

    id v6 = 0;
  }
  id v7 = (void *)[v6 copy];

  return v7;
}

+ (id)copyAllSsidsWithColocatedScopeId:(id)a3 moc:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = +[NetworkMO entityName];
    id v8 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"colocatedScopeId", v5];
    id v9 = +[AnalyticsStoreProxy fetchPropertiesForEntity:v7 properties:&unk_26CE65F08 predicate:v8 moc:v6];

    if (v9 && [v9 count])
    {
      int v10 = [v9 valueForKey:@"ssid"];
    }
    else
    {
      int v13 = WALogCategoryDeviceStoreHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        uint64_t v16 = "+[NetworkMO copyAllSsidsWithColocatedScopeId:moc:]";
        __int16 v17 = 1024;
        int v18 = 358;
        _os_log_impl(&dword_21D96D000, v13, OS_LOG_TYPE_ERROR, "%{public}s::%d:resultsArrOfDicts nil", buf, 0x12u);
      }

      int v10 = 0;
    }
  }
  else
  {
    uint64_t v14 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v16 = "+[NetworkMO copyAllSsidsWithColocatedScopeId:moc:]";
      __int16 v17 = 1024;
      int v18 = 355;
      _os_log_impl(&dword_21D96D000, v14, OS_LOG_TYPE_ERROR, "%{public}s::%d:colocatedScopeId nil", buf, 0x12u);
    }

    int v10 = 0;
    id v9 = 0;
  }
  uint64_t v11 = (void *)[v10 copy];

  return v11;
}

+ (id)copyAllSsidsWithColocatedScopeIdStr:(id)a3 moc:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = (objc_class *)MEMORY[0x263F08C38];
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[[v5 alloc] initWithUUIDString:v7];

  id v9 = +[NetworkMO entityName];
  int v10 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"colocatedScopeId", v8];
  uint64_t v11 = +[AnalyticsStoreProxy fetchPropertiesForEntity:v9 properties:&unk_26CE65F20 predicate:v10 moc:v6];

  if (v11 && [v11 count])
  {
    __int16 v12 = [v11 valueForKey:@"ssid"];
  }
  else
  {
    int v15 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      __int16 v17 = "+[NetworkMO copyAllSsidsWithColocatedScopeIdStr:moc:]";
      __int16 v18 = 1024;
      int v19 = 374;
      _os_log_impl(&dword_21D96D000, v15, OS_LOG_TYPE_ERROR, "%{public}s::%d:resultsArrOfDicts nil", buf, 0x12u);
    }

    __int16 v12 = 0;
  }
  int v13 = (void *)[v12 copy];

  return v13;
}

+ (id)getFirstColocatedScopeUuidForSsids:(id)a3 moc:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = +[NetworkMO entityName];
    id v8 = [MEMORY[0x263F08A98] predicateWithFormat:@"ssid IN %@", v5];
    id v9 = +[AnalyticsStoreProxy fetchPropertiesForEntity:v7 properties:&unk_26CE65F38 predicate:v8 moc:v6];

    if (v9 && [v9 count])
    {
      int v10 = [v9 valueForKey:@"colocatedScopeId"];
      if (![v10 count])
      {
LABEL_11:
        __int16 v17 = 0;
        goto LABEL_12;
      }
      uint64_t v11 = 0;
      while (1)
      {
        __int16 v12 = [v10 objectAtIndex:v11];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          uint64_t v14 = [v10 objectAtIndex:v11];
          int v15 = v14;
          if (v14)
          {
            uint64_t v16 = [v14 UUIDString];

            if (v16)
            {
              __int16 v17 = [v15 UUIDString];

              goto LABEL_12;
            }
          }
        }
        if (++v11 >= (unint64_t)[v10 count]) {
          goto LABEL_11;
        }
      }
    }
    int v19 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      double v22 = "+[NetworkMO getFirstColocatedScopeUuidForSsids:moc:]";
      __int16 v23 = 1024;
      int v24 = 389;
      _os_log_impl(&dword_21D96D000, v19, OS_LOG_TYPE_ERROR, "%{public}s::%d:ssidArray nil", buf, 0x12u);
    }

    __int16 v17 = 0;
    int v10 = 0;
  }
  else
  {
    uint64_t v20 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      double v22 = "+[NetworkMO getFirstColocatedScopeUuidForSsids:moc:]";
      __int16 v23 = 1024;
      int v24 = 386;
      _os_log_impl(&dword_21D96D000, v20, OS_LOG_TYPE_ERROR, "%{public}s::%d:ssidArray nil", buf, 0x12u);
    }

    __int16 v17 = 0;
    int v10 = 0;
    id v9 = 0;
  }
LABEL_12:

  return v17;
}

+ (BOOL)invalidateColocatedScopeForSsidArray:(id)a3 moc:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = [MEMORY[0x263EFF9A0] dictionary];
    id v8 = [MEMORY[0x263F087F0] expressionForConstantValue:0];
    [v7 setValue:v8 forKey:@"colocatedScopeId"];

    id v9 = +[NetworkMO entityName];
    int v10 = [MEMORY[0x263F08A98] predicateWithFormat:@"ssid IN %@", v5];
    BOOL v11 = +[AnalyticsStoreProxy batchUpdate:v9 withPredicate:v10 propertiesToUpdate:v7 moc:v6];
  }
  else
  {
    id v7 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v14 = "+[NetworkMO invalidateColocatedScopeForSsidArray:moc:]";
      __int16 v15 = 1024;
      int v16 = 411;
      _os_log_impl(&dword_21D96D000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:ssidArray nil", buf, 0x12u);
    }
    BOOL v11 = 0;
  }

  return v11;
}

+ (BOOL)coalesceSsidsIntoColocatedScope:(id)a3 moc:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = +[NetworkMO getFirstColocatedScopeUuidForSsids:v5 moc:v6];
    if (v7)
    {
      id v8 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v7];
      id v9 = WALogCategoryDeviceStoreHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        int v10 = [v8 UUIDString];
        *(_DWORD *)buf = 136446722;
        uint64_t v20 = "+[NetworkMO coalesceSsidsIntoColocatedScope:moc:]";
        __int16 v21 = 1024;
        int v22 = 434;
        __int16 v23 = 2112;
        int v24 = v10;
        BOOL v11 = "%{public}s::%d:Existing ColocatedScope UUID %@";
LABEL_7:
        _os_log_impl(&dword_21D96D000, v9, OS_LOG_TYPE_DEBUG, v11, buf, 0x1Cu);
      }
    }
    else
    {
      id v8 = [MEMORY[0x263F08C38] UUID];
      id v9 = WALogCategoryDeviceStoreHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        int v10 = [v8 UUIDString];
        *(_DWORD *)buf = 136446722;
        uint64_t v20 = "+[NetworkMO coalesceSsidsIntoColocatedScope:moc:]";
        __int16 v21 = 1024;
        int v22 = 431;
        __int16 v23 = 2112;
        int v24 = v10;
        BOOL v11 = "%{public}s::%d:Created ColocatedScope UUID %@";
        goto LABEL_7;
      }
    }

    __int16 v12 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v13 = [v8 UUIDString];
      *(_DWORD *)buf = 136446978;
      uint64_t v20 = "+[NetworkMO coalesceSsidsIntoColocatedScope:moc:]";
      __int16 v21 = 1024;
      int v22 = 436;
      __int16 v23 = 2112;
      int v24 = v13;
      __int16 v25 = 2112;
      id v26 = v5;
      _os_log_impl(&dword_21D96D000, v12, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Applying ColocatedScope UUID %@ to ssidArray %@", buf, 0x26u);
    }
    uint64_t v14 = [MEMORY[0x263EFF9A0] dictionary];
    [v14 setValue:v8 forKey:@"colocatedScopeId"];
    __int16 v15 = +[NetworkMO entityName];
    int v16 = [MEMORY[0x263F08A98] predicateWithFormat:@"ssid IN %@", v5];
    BOOL v17 = +[AnalyticsStoreProxy batchUpdate:v15 withPredicate:v16 propertiesToUpdate:v14 moc:v6];

    goto LABEL_11;
  }
  id v7 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    uint64_t v20 = "+[NetworkMO coalesceSsidsIntoColocatedScope:moc:]";
    __int16 v21 = 1024;
    int v22 = 426;
    _os_log_impl(&dword_21D96D000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:ssidsArray nil", buf, 0x12u);
  }
  BOOL v17 = 0;
LABEL_11:

  return v17;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"Network"];
}

@end