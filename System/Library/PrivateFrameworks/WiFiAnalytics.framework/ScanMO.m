@interface ScanMO
+ (BOOL)getSsidAndBssidWithinRangeForColocatedScopeTransition:(id)a3 bssid:(id)a4 minRssi:(int)a5 maxRssi:(int)a6 band:(unsigned int)a7 transitionSsid:(id *)a8 transitionBssid:(id *)a9 transitionRssi:(int *)a10 authFlags:(id *)a11 moc:(id)a12;
+ (id)entityName;
+ (id)fetchRequest;
+ (id)generateInstance:(id)a3;
@end

@implementation ScanMO

+ (id)entityName
{
  return @"Scan";
}

+ (id)generateInstance:(id)a3
{
  id v3 = a3;
  v4 = +[ScanMO entityName];
  v5 = +[AnalyticsStoreProxy createEntity:v4 moc:v3];

  return v5;
}

+ (BOOL)getSsidAndBssidWithinRangeForColocatedScopeTransition:(id)a3 bssid:(id)a4 minRssi:(int)a5 maxRssi:(int)a6 band:(unsigned int)a7 transitionSsid:(id *)a8 transitionBssid:(id *)a9 transitionRssi:(int *)a10 authFlags:(id *)a11 moc:(id)a12
{
  uint64_t v81 = *(void *)&a6;
  uint64_t v84 = *(void *)&a5;
  v114[4] = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v78 = a4;
  id v15 = a12;
  v76 = +[ScanMO fetchRequest];
  v79 = v14;
  v16 = +[NetworkMO getInstance:v14 moc:v15];
  v17 = v16;
  if (!v16)
  {
    v36 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v90 = "+[ScanMO getSsidAndBssidWithinRangeForColocatedScopeTransition:bssid:minRssi:maxRssi:band:transitionSsid:tra"
            "nsitionBssid:transitionRssi:authFlags:moc:]";
      __int16 v91 = 1024;
      int v92 = 51;
      __int16 v93 = 2112;
      uint64_t v94 = (uint64_t)v79;
      v68 = "%{public}s::%d:networkMO nil for ssid %@";
      v69 = v36;
      uint32_t v70 = 28;
LABEL_42:
      _os_log_impl(&dword_21D96D000, v69, OS_LOG_TYPE_ERROR, v68, buf, v70);
    }
LABEL_43:
    v30 = 0;
    v64 = 0;
    v20 = 0;
    v32 = 0;
    v31 = 0;
    goto LABEL_34;
  }
  uint64_t v18 = [v16 colocatedScopeId];
  if (!v18)
  {
    v36 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v90 = "+[ScanMO getSsidAndBssidWithinRangeForColocatedScopeTransition:bssid:minRssi:maxRssi:band:transitionSsid:tra"
            "nsitionBssid:transitionRssi:authFlags:moc:]";
      __int16 v91 = 1024;
      int v92 = 54;
      v68 = "%{public}s::%d:No colocated scope id";
      v69 = v36;
      uint32_t v70 = 18;
      goto LABEL_42;
    }
    goto LABEL_43;
  }
  v80 = (void *)v18;
  v74 = v17;
  id v75 = v15;
  unsigned int obj = a7;
  if (a7 == 1)
  {
    v19 = @"result.channel <= %d";
    goto LABEL_7;
  }
  if (a7 == 2)
  {
    v19 = @"result.channel > %d";
LABEL_7:
    v20 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", v19, 14);
    goto LABEL_9;
  }
  v20 = 0;
LABEL_9:
  v21 = (void *)MEMORY[0x263F08730];
  v22 = [MEMORY[0x263F08A98] predicateWithFormat:@"origin.network.ssid == %@", v79];
  v114[0] = v22;
  v23 = [MEMORY[0x263F08A98] predicateWithFormat:@"origin.bssid == %@", v78];
  v114[1] = v23;
  v24 = [MEMORY[0x263F08A98] predicateWithFormat:@"result.bssid != %@", v78];
  v114[2] = v24;
  v25 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"(resultRssi > %d) AND (resultRssi <= %d)", v84, v81);
  v114[3] = v25;
  v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v114 count:4];
  v27 = [v21 andPredicateWithSubpredicates:v26];

  if (v20)
  {
    v28 = (void *)MEMORY[0x263F08730];
    v113[0] = v27;
    v113[1] = v20;
    v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v113 count:2];
    v30 = [v28 andPredicateWithSubpredicates:v29];

    v31 = v80;
  }
  else
  {
    v31 = v80;
    v30 = v27;
  }
  id v15 = v75;
  v32 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"resultRssi" ascending:0];
  [v76 setFetchBatchSize:100];
  [v76 setRelationshipKeyPathsForPrefetching:&unk_26CE65FC8];
  v112 = v32;
  v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v112 count:1];
  [v76 setSortDescriptors:v33];

  v34 = +[AnalyticsStoreProxy fetch:v76 withPredicate:v30 moc:v75];
  v35 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446978;
    v90 = "+[ScanMO getSsidAndBssidWithinRangeForColocatedScopeTransition:bssid:minRssi:maxRssi:band:transitionSsid:trans"
          "itionBssid:transitionRssi:authFlags:moc:]";
    __int16 v91 = 1024;
    int v92 = 86;
    __int16 v93 = 2048;
    uint64_t v94 = [v34 count];
    __int16 v95 = 1024;
    LODWORD(v96) = obj;
    _os_log_impl(&dword_21D96D000, v35, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Found %lu results with bandPref:%d", buf, 0x22u);
  }

  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  v36 = v34;
  uint64_t v37 = [v36 countByEnumeratingWithState:&v85 objects:v111 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    obja = v36;
    v71 = v32;
    v72 = v30;
    v73 = v20;
    uint64_t v39 = *(void *)v86;
    while (2)
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v86 != v39) {
          objc_enumerationMutation(obja);
        }
        v41 = *(void **)(*((void *)&v85 + 1) + 8 * i);
        v42 = [v41 result];
        v43 = [v42 network];
        v44 = [v43 colocatedScopeId];
        int v45 = [v31 isEqual:v44];

        if (v45)
        {
          v46 = NSString;
          v47 = [v41 result];
          v48 = [v47 network];
          v49 = [v48 ssid];
          v50 = [v46 stringWithString:v49];

          v51 = NSString;
          v52 = [v41 result];
          v53 = [v52 bssid];
          v54 = [v51 stringWithString:v53];

          if ((int)[v41 resultRssi] > (int)v84 && (int)objc_msgSend(v41, "resultRssi") <= (int)v81)
          {
            *a8 = [NSString stringWithString:v50];
            *a9 = [NSString stringWithString:v54];
            *a10 = [v41 resultRssi];
            v56 = NSNumber;
            v57 = [v41 result];
            v58 = [v57 network];
            objc_msgSend(v56, "numberWithInt:", objc_msgSend(v58, "authFlags"));
            *a11 = (id)objc_claimAutoreleasedReturnValue();

            v31 = v80;
            int v55 = 1;
          }
          else
          {
            int v55 = 0;
          }
          v59 = WALogCategoryDeviceStoreHandle();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
          {
            int v60 = [v41 resultRssi];
            v61 = [v41 result];
            int v62 = [v61 channel];
            *(_DWORD *)buf = 136448770;
            v63 = "Will not";
            if (v55) {
              v63 = "Will";
            }
            v90 = "+[ScanMO getSsidAndBssidWithinRangeForColocatedScopeTransition:bssid:minRssi:maxRssi:band:transitionSs"
                  "id:transitionBssid:transitionRssi:authFlags:moc:]";
            __int16 v91 = 1024;
            int v92 = 104;
            __int16 v93 = 2112;
            uint64_t v94 = (uint64_t)v50;
            __int16 v95 = 2112;
            id v96 = v54;
            __int16 v97 = 1024;
            int v98 = v60;
            __int16 v99 = 1024;
            int v100 = v62;
            __int16 v101 = 2112;
            v102 = v79;
            __int16 v103 = 2112;
            id v104 = v78;
            __int16 v105 = 1024;
            int v106 = v81;
            __int16 v107 = 1024;
            int v108 = v84;
            __int16 v109 = 2080;
            v110 = v63;
            _os_log_impl(&dword_21D96D000, v59, OS_LOG_TYPE_DEBUG, "%{public}s::%d:%@[%@] at rssi %d on chan: %d for %@[%@] in range [%d, %d). %s use", buf, 0x5Cu);

            v31 = v80;
          }

          if (v55)
          {
            BOOL v65 = 1;
            v66 = obja;
            v64 = obja;
            v17 = v74;
            id v15 = v75;
            v30 = v72;
            v20 = v73;
            v32 = v71;
            goto LABEL_37;
          }
        }
      }
      uint64_t v38 = [obja countByEnumeratingWithState:&v85 objects:v111 count:16];
      if (v38) {
        continue;
      }
      break;
    }
    v36 = obja;
    v64 = obja;
    v17 = v74;
    id v15 = v75;
    v30 = v72;
    v20 = v73;
    v32 = v71;
  }
  else
  {
    v64 = v36;
    v17 = v74;
  }
LABEL_34:

  *a8 = 0;
  *a9 = 0;
  v66 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136447490;
    v90 = "+[ScanMO getSsidAndBssidWithinRangeForColocatedScopeTransition:bssid:minRssi:maxRssi:band:transitionSsid:trans"
          "itionBssid:transitionRssi:authFlags:moc:]";
    __int16 v91 = 1024;
    int v92 = 114;
    __int16 v93 = 2112;
    uint64_t v94 = (uint64_t)v79;
    __int16 v95 = 2112;
    id v96 = v78;
    __int16 v97 = 1024;
    int v98 = v81;
    __int16 v99 = 1024;
    int v100 = v84;
    _os_log_impl(&dword_21D96D000, v66, OS_LOG_TYPE_ERROR, "%{public}s::%d:Nothing found for %@[%@] in range [%d, %d)", buf, 0x32u);
  }
  BOOL v65 = 0;
LABEL_37:

  return v65;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"Scan"];
}

@end