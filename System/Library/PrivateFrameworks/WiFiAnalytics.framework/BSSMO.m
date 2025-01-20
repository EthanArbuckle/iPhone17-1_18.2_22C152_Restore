@interface BSSMO
+ (BOOL)coalesceBssidsIntoDeployment:(id)a3 moc:(id)a4;
+ (BOOL)setBssManagedObjectPropertyValueForKey:(id)a3 forKey:(id)a4 withValue:(id)a5;
+ (id)allBssidsForSsid:(id)a3 moc:(id)a4;
+ (id)allSsidsForBssid:(id)a3 moc:(id)a4;
+ (id)bssManagedObjectPropertyValue:(id)a3 forKey:(id)a4;
+ (id)copyBssidsForDeployment:(id)a3 deploymentUuid:(id)a4 moc:(id)a5;
+ (id)copyDeploymentUuidsForSsid:(id)a3 moc:(id)a4;
+ (id)entityName;
+ (id)fetchRequest;
+ (id)generateInstance:(id)a3 ssid:(id)a4 created:(BOOL *)a5 moc:(id)a6;
+ (id)getDeploymentUuidForBssids:(id)a3 moc:(id)a4;
+ (id)getInstance:(id)a3 ssid:(id)a4 moc:(id)a5;
+ (unint64_t)numBssInBand:(id)a3 bandIs24:(BOOL)a4 moc:(id)a5;
@end

@implementation BSSMO

+ (id)getInstance:(id)a3 ssid:(id)a4 moc:(id)a5
{
  v19[2] = *MEMORY[0x263EF8340];
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = +[BSSMO fetchRequest];
  v11 = (void *)MEMORY[0x263F08730];
  v12 = [MEMORY[0x263F08A98] predicateWithFormat:@"network.ssid == %@", v8];

  v13 = [MEMORY[0x263F08A98] predicateWithFormat:@"bssid == %@", v9, v12];

  v19[1] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
  v15 = [v11 andPredicateWithSubpredicates:v14];

  v16 = +[AnalyticsStoreProxy fetch:v10 withPredicate:v15 moc:v7];

  if (v16 && [v16 count])
  {
    v17 = [v16 firstObject];
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"BSS"];
}

+ (id)entityName
{
  return @"BSS";
}

+ (id)generateInstance:(id)a3 ssid:(id)a4 created:(BOOL *)a5 moc:(id)a6
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (+[WAUtil isWildcardMacAddress:v9])
  {
    v12 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v23 = "+[BSSMO generateInstance:ssid:created:moc:]";
      __int16 v24 = 1024;
      int v25 = 26;
      __int16 v26 = 2112;
      id v27 = v9;
      _os_log_impl(&dword_21D96D000, v12, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssid(%@) is the wildcard address!! bailing", buf, 0x1Cu);
    }

    v13 = 0;
    *a5 = 0;
  }
  else
  {
    v14 = (void *)MEMORY[0x263F08730];
    v15 = [MEMORY[0x263F08A98] predicateWithFormat:@"network.ssid == %@", v10];
    v21[0] = v15;
    v16 = [MEMORY[0x263F08A98] predicateWithFormat:@"bssid == %@", v9];
    v21[1] = v16;
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
    v18 = [v14 andPredicateWithSubpredicates:v17];

    v19 = +[BSSMO entityName];
    v13 = +[AnalyticsStoreProxy entityByCounting:v19 withPredicate:v18 created:a5 moc:v11];

    if (a5 && *a5) {
      [v13 setBssid:v9];
    }
  }
  return v13;
}

+ (id)allBssidsForSsid:(id)a3 moc:(id)a4
{
  v5 = (void *)MEMORY[0x263EFF980];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 array];
  id v9 = [MEMORY[0x263F08A98] predicateWithFormat:@"network.ssid == %@", v7];

  id v10 = +[BSSMO fetchRequest];
  id v11 = +[AnalyticsStoreProxy fetch:v10 withPredicate:v9 moc:v6];

  if (v11)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __30__BSSMO_allBssidsForSsid_moc___block_invoke;
    v15[3] = &unk_2644677E8;
    id v12 = v8;
    id v16 = v12;
    [v11 enumerateObjectsUsingBlock:v15];
    id v13 = v12;
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

void __30__BSSMO_allBssidsForSsid_moc___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6)
  {
    v3 = [v6 bssid];

    if (v3)
    {
      v4 = *(void **)(a1 + 32);
      v5 = [v6 bssid];
      [v4 addObject:v5];
    }
  }
}

+ (id)allSsidsForBssid:(id)a3 moc:(id)a4
{
  v5 = (void *)MEMORY[0x263EFF980];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 array];
  id v9 = [MEMORY[0x263F08A98] predicateWithFormat:@"bssid == %@", v7];

  id v10 = +[BSSMO fetchRequest];
  id v11 = +[AnalyticsStoreProxy fetch:v10 withPredicate:v9 moc:v6];

  if (v11)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __30__BSSMO_allSsidsForBssid_moc___block_invoke;
    v15[3] = &unk_2644677E8;
    id v12 = v8;
    id v16 = v12;
    [v11 enumerateObjectsUsingBlock:v15];
    id v13 = v12;
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

void __30__BSSMO_allSsidsForBssid_moc___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  if (v10)
  {
    uint64_t v3 = [v10 network];
    if (v3)
    {
      v4 = (void *)v3;
      v5 = [v10 network];
      id v6 = [v5 ssid];

      if (v6)
      {
        id v7 = *(void **)(a1 + 32);
        id v8 = [v10 network];
        id v9 = [v8 ssid];
        [v7 addObject:v9];
      }
    }
  }
}

+ (id)bssManagedObjectPropertyValue:(id)a3 forKey:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = v5;
  if (a3 && v5)
  {
    id v7 = [a3 unparsedBeacon];
    id v8 = v7;
    if (v7)
    {
      id v9 = [v7 valueForKey:v6];
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v10 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446722;
      id v13 = "+[BSSMO bssManagedObjectPropertyValue:forKey:]";
      __int16 v14 = 1024;
      int v15 = 103;
      __int16 v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_21D96D000, v10, OS_LOG_TYPE_ERROR, "%{public}s::%d:Nil bssMO or key %@", (uint8_t *)&v12, 0x1Cu);
    }

    id v9 = 0;
  }

  return v9;
}

+ (BOOL)setBssManagedObjectPropertyValueForKey:(id)a3 forKey:(id)a4 withValue:(id)a5
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
      __int16 v16 = "+[BSSMO setBssManagedObjectPropertyValueForKey:forKey:withValue:]";
      __int16 v17 = 1024;
      int v18 = 113;
      __int16 v14 = "%{public}s::%d:bssMO nil";
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
      __int16 v16 = "+[BSSMO setBssManagedObjectPropertyValueForKey:forKey:withValue:]";
      __int16 v17 = 1024;
      int v18 = 114;
      __int16 v14 = "%{public}s::%d:key nil";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  id v10 = [v7 unparsedBeacon];
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
  [v7 setUnparsedBeacon:v11];

  BOOL v12 = 1;
LABEL_7:

  return v12;
}

+ (BOOL)coalesceBssidsIntoDeployment:(id)a3 moc:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = +[BSSMO getDeploymentUuidForBssids:v5 moc:v6];
    if (v7)
    {
      id v8 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v7];
      id v9 = WALogCategoryDeviceStoreHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        id v10 = [v8 UUIDString];
        *(_DWORD *)buf = 136446722;
        v20 = "+[BSSMO coalesceBssidsIntoDeployment:moc:]";
        __int16 v21 = 1024;
        int v22 = 147;
        __int16 v23 = 2112;
        __int16 v24 = v10;
        id v11 = "%{public}s::%d:Existing UUID %@";
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
        id v10 = [v8 UUIDString];
        *(_DWORD *)buf = 136446722;
        v20 = "+[BSSMO coalesceBssidsIntoDeployment:moc:]";
        __int16 v21 = 1024;
        int v22 = 144;
        __int16 v23 = 2112;
        __int16 v24 = v10;
        id v11 = "%{public}s::%d:Created UUID %@";
        goto LABEL_7;
      }
    }

    BOOL v12 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      id v13 = [v8 UUIDString];
      *(_DWORD *)buf = 136446978;
      v20 = "+[BSSMO coalesceBssidsIntoDeployment:moc:]";
      __int16 v21 = 1024;
      int v22 = 150;
      __int16 v23 = 2112;
      __int16 v24 = v13;
      __int16 v25 = 2112;
      id v26 = v5;
      _os_log_impl(&dword_21D96D000, v12, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Applying deployment UUID %@ bssidsArray %@", buf, 0x26u);
    }
    __int16 v14 = [MEMORY[0x263EFF9A0] dictionary];
    [v14 setValue:v8 forKey:@"apid"];
    int v15 = +[BSSMO entityName];
    __int16 v16 = [MEMORY[0x263F08A98] predicateWithFormat:@"bssid IN %@", v5];
    BOOL v17 = +[AnalyticsStoreProxy batchUpdate:v15 withPredicate:v16 propertiesToUpdate:v14 moc:v6];

    goto LABEL_11;
  }
  id v7 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v20 = "+[BSSMO coalesceBssidsIntoDeployment:moc:]";
    __int16 v21 = 1024;
    int v22 = 139;
    _os_log_impl(&dword_21D96D000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssidArray nil", buf, 0x12u);
  }
  BOOL v17 = 0;
LABEL_11:

  return v17;
}

+ (id)getDeploymentUuidForBssids:(id)a3 moc:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = +[BSSMO entityName];
    id v8 = [MEMORY[0x263F08A98] predicateWithFormat:@"bssid IN %@", v5];
    id v9 = +[AnalyticsStoreProxy fetchPropertiesForEntity:v7 properties:&unk_26CE65F80 predicate:v8 moc:v6];

    if (v9 && [v9 count])
    {
      id v10 = [v9 valueForKey:@"apid"];
      if (![v10 count])
      {
LABEL_11:
        BOOL v17 = 0;
        goto LABEL_12;
      }
      uint64_t v11 = 0;
      while (1)
      {
        BOOL v12 = [v10 objectAtIndex:v11];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          __int16 v14 = [v10 objectAtIndex:v11];
          int v15 = v14;
          if (v14)
          {
            __int16 v16 = [v14 UUIDString];

            if (v16)
            {
              BOOL v17 = [v15 UUIDString];

              goto LABEL_12;
            }
          }
        }
        if (++v11 >= (unint64_t)[v10 count]) {
          goto LABEL_11;
        }
      }
    }
    uint64_t v19 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      int v22 = "+[BSSMO getDeploymentUuidForBssids:moc:]";
      __int16 v23 = 1024;
      int v24 = 169;
      _os_log_impl(&dword_21D96D000, v19, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssidsArray nil", buf, 0x12u);
    }

    BOOL v17 = 0;
    id v10 = 0;
  }
  else
  {
    v20 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      int v22 = "+[BSSMO getDeploymentUuidForBssids:moc:]";
      __int16 v23 = 1024;
      int v24 = 166;
      _os_log_impl(&dword_21D96D000, v20, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssidArray nil", buf, 0x12u);
    }

    BOOL v17 = 0;
    id v10 = 0;
    id v9 = 0;
  }
LABEL_12:

  return v17;
}

+ (unint64_t)numBssInBand:(id)a3 bandIs24:(BOOL)a4 moc:(id)a5
{
  BOOL v6 = a4;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  if (v7)
  {
    id v9 = (void *)MEMORY[0x223C0F2E0]();
    id v10 = +[BSSMO entityName];
    uint64_t v11 = [MEMORY[0x263F08A98] predicateWithFormat:@"network.ssid == %@", v7];
    BOOL v12 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"channel <= %d", 14);
    uint64_t v13 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"channel > %d", 14);
    __int16 v14 = (void *)v13;
    int v15 = (void *)MEMORY[0x263F08730];
    if (v6)
    {
      int v24 = v11;
      __int16 v16 = &v24;
      uint64_t v17 = (uint64_t)v12;
    }
    else
    {
      __int16 v23 = v11;
      __int16 v16 = &v23;
      uint64_t v17 = v13;
    }
    v16[1] = (void *)v17;
    int v18 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:");
    uint64_t v19 = [v15 andPredicateWithSubpredicates:v18];

    unint64_t v20 = +[AnalyticsStoreProxy entityCount:v10 withPredicate:v19 moc:v8];
  }
  else
  {
    int v22 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      id v26 = "+[BSSMO numBssInBand:bandIs24:moc:]";
      __int16 v27 = 1024;
      int v28 = 189;
      _os_log_impl(&dword_21D96D000, v22, OS_LOG_TYPE_ERROR, "%{public}s::%d:ssid nil", buf, 0x12u);
    }

    unint64_t v20 = 0;
  }

  return v20;
}

+ (id)copyBssidsForDeployment:(id)a3 deploymentUuid:(id)a4 moc:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v7)
  {
    __int16 v23 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      id v26 = "+[BSSMO copyBssidsForDeployment:deploymentUuid:moc:]";
      __int16 v27 = 1024;
      int v28 = 218;
      _os_log_impl(&dword_21D96D000, v23, OS_LOG_TYPE_ERROR, "%{public}s::%d:ssid nil", buf, 0x12u);
    }

    __int16 v16 = 0;
    int v18 = 0;
    id v10 = 0;
    goto LABEL_15;
  }
  id v10 = +[BSSMO entityName];
  if (v8)
  {
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v8];
    BOOL v12 = (void *)MEMORY[0x263F08730];
    uint64_t v13 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"apid", v11];
    v24[0] = v13;
    __int16 v14 = [MEMORY[0x263F08A98] predicateWithFormat:@"network.ssid == %@", v7];
    v24[1] = v14;
    int v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
    __int16 v16 = [v12 andPredicateWithSubpredicates:v15];
  }
  else
  {
    __int16 v16 = [MEMORY[0x263F08A98] predicateWithFormat:@"network.ssid == %@", v7];
  }
  uint64_t v17 = +[AnalyticsStoreProxy fetchPropertiesForEntity:v10 properties:&unk_26CE65F98 predicate:v16 moc:v9];
  int v18 = v17;
  if (!v17 || ![v17 count])
  {
    int v22 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      id v26 = "+[BSSMO copyBssidsForDeployment:deploymentUuid:moc:]";
      __int16 v27 = 1024;
      int v28 = 233;
      _os_log_impl(&dword_21D96D000, v22, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssidsArray nil", buf, 0x12u);
    }

LABEL_15:
    uint64_t v19 = 0;
    goto LABEL_8;
  }
  uint64_t v19 = [v18 valueForKey:@"bssid"];
LABEL_8:
  unint64_t v20 = (void *)[v19 copy];

  return v20;
}

+ (id)copyDeploymentUuidsForSsid:(id)a3 moc:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = a3;
  id v7 = +[BSSMO entityName];
  id v8 = [MEMORY[0x263F08A98] predicateWithFormat:@"network.ssid == %@", v6];

  id v9 = +[AnalyticsStoreProxy fetchPropertiesForEntity:v7 properties:&unk_26CE65FB0 predicate:v8 moc:v5];

  if (v9 && [v9 count])
  {
    id v10 = [v9 valueForKey:@"apid"];
  }
  else
  {
    uint64_t v13 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      int v15 = "+[BSSMO copyDeploymentUuidsForSsid:moc:]";
      __int16 v16 = 1024;
      int v17 = 248;
      _os_log_impl(&dword_21D96D000, v13, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssidsArray nil", buf, 0x12u);
    }

    id v10 = 0;
  }
  uint64_t v11 = (void *)[v10 copy];

  return v11;
}

@end