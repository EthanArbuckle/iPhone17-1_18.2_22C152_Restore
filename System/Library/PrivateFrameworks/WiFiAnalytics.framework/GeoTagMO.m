@interface GeoTagMO
+ (BOOL)isNetworkWithinRangeOfLocation:(id)a3 range:(double)a4 location:(id)a5 moc:(id)a6 count:(unint64_t *)a7;
+ (id)entityName;
+ (id)fetchRequest;
+ (id)generateInstance:(id)a3;
+ (id)geoTagsAtLocationInBand:(id)a3 distance:(double)a4 band:(unsigned int)a5 moc:(id)a6;
+ (id)geoTagsForNetwork:(id)a3 moc:(id)a4;
+ (id)geoTagsInBandForNetwork:(unsigned int)a3 ssid:(id)a4 moc:(id)a5;
@end

@implementation GeoTagMO

+ (id)entityName
{
  return @"GeoTag";
}

+ (id)generateInstance:(id)a3
{
  id v3 = a3;
  v4 = +[GeoTagMO entityName];
  v5 = +[AnalyticsStoreProxy createEntity:v4 moc:v3];

  return v5;
}

+ (id)geoTagsForNetwork:(id)a3 moc:(id)a4
{
  v23[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = +[GeoTagMO entityName];
  v8 = +[AnalyticsStoreProxy fetchRequestForEntity:v7];

  [v8 setFetchLimit:10];
  [v8 setRelationshipKeyPathsForPrefetching:&unk_26CE65F50];
  v9 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"date" ascending:0];
  v23[0] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
  [v8 setSortDescriptors:v10];

  v11 = [MEMORY[0x263F08A98] predicateWithFormat:@"bss.network.ssid == %@", v5];
  v12 = +[AnalyticsStoreProxy fetch:v8 withPredicate:v11 moc:v6];

  if (v12)
  {
    v13 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446978;
      v16 = "+[GeoTagMO geoTagsForNetwork:moc:]";
      __int16 v17 = 1024;
      int v18 = 46;
      __int16 v19 = 2048;
      uint64_t v20 = [v12 count];
      __int16 v21 = 2112;
      id v22 = v5;
      _os_log_impl(&dword_21D96D000, v13, OS_LOG_TYPE_DEBUG, "%{public}s::%d:ResultCount:%lu ssid:%@", buf, 0x26u);
    }
  }
  return v12;
}

+ (id)geoTagsInBandForNetwork:(unsigned int)a3 ssid:(id)a4 moc:(id)a5
{
  v33[1] = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  v9 = +[GeoTagMO entityName];
  v10 = +[AnalyticsStoreProxy fetchRequestForEntity:v9];

  [v10 setFetchLimit:10];
  [v10 setRelationshipKeyPathsForPrefetching:&unk_26CE65F68];
  v11 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"date" ascending:0];
  v33[0] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:1];
  [v10 setSortDescriptors:v12];

  if (a3 == 2)
  {
    v13 = (void *)MEMORY[0x263F08730];
    v14 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"bss.channel > %d", 14);
    v31[0] = v14;
    v15 = [MEMORY[0x263F08A98] predicateWithFormat:@"bss.network.ssid == %@", v7];
    v31[1] = v15;
    v16 = (void *)MEMORY[0x263EFF8C0];
    __int16 v17 = v31;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v13 = (void *)MEMORY[0x263F08730];
    v14 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"bss.channel <= %d", 14);
    v32[0] = v14;
    v15 = [MEMORY[0x263F08A98] predicateWithFormat:@"bss.network.ssid == %@", v7];
    v32[1] = v15;
    v16 = (void *)MEMORY[0x263EFF8C0];
    __int16 v17 = v32;
LABEL_5:
    int v18 = [v16 arrayWithObjects:v17 count:2];
    __int16 v19 = [v13 andPredicateWithSubpredicates:v18];

    goto LABEL_7;
  }
  __int16 v19 = [MEMORY[0x263F08A98] predicateWithFormat:@"bss.network.ssid == %@", v7];
LABEL_7:
  uint64_t v20 = +[AnalyticsStoreProxy fetch:v10 withPredicate:v19 moc:v8];

  if (v20)
  {
    __int16 v21 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446978;
      v24 = "+[GeoTagMO geoTagsInBandForNetwork:ssid:moc:]";
      __int16 v25 = 1024;
      int v26 = 86;
      __int16 v27 = 2048;
      uint64_t v28 = [v20 count];
      __int16 v29 = 2112;
      id v30 = v7;
      _os_log_impl(&dword_21D96D000, v21, OS_LOG_TYPE_DEBUG, "%{public}s::%d:ResultCount:%lu ssid:%@", buf, 0x26u);
    }
  }
  return v20;
}

+ (id)geoTagsAtLocationInBand:(id)a3 distance:(double)a4 band:(unsigned int)a5 moc:(id)a6
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  id v67 = a3;
  id v8 = a6;
  v56 = [MEMORY[0x263EFF980] array];
  v58 = v8;
  +[NetworkMO allStoredSsids:v8];
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v59 = [obj countByEnumeratingWithState:&v78 objects:v95 count:16];
  if (v59)
  {
    uint64_t v57 = *(void *)v79;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v79 != v57) {
          objc_enumerationMutation(obj);
        }
        uint64_t v64 = v9;
        double v10 = *(double *)(*((void *)&v78 + 1) + 8 * v9);
        context = (void *)MEMORY[0x223C0F2E0]();
        double v60 = v10;
        v11 = +[GeoTagMO geoTagsInBandForNetwork:a5 ssid:*(void *)&v10 moc:v58];
        v12 = [MEMORY[0x263F089D8] string];
        v68 = [MEMORY[0x263F089D8] string];
        v62 = [MEMORY[0x263EFF910] date];
        long long v74 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        id v66 = v11;
        uint64_t v70 = [v66 countByEnumeratingWithState:&v74 objects:v94 count:16];
        if (v70)
        {
          uint64_t v69 = *(void *)v75;
          v65 = v12;
          while (2)
          {
            for (uint64_t i = 0; i != v70; ++i)
            {
              if (*(void *)v75 != v69) {
                objc_enumerationMutation(v66);
              }
              v14 = *(void **)(*((void *)&v74 + 1) + 8 * i);
              v15 = (void *)MEMORY[0x223C0F2E0]();
              if (v14)
              {
                id v16 = objc_alloc(MEMORY[0x263F00A58]);
                [v14 latitude];
                double v18 = v17;
                [v14 longitude];
                uint64_t v20 = [v16 initWithLatitude:v18 longitude:v19];
                [v20 distanceFromLocation:v67];
                double v22 = v21;
                if (a4 != 0.0 && v21 < a4)
                {
                  [v56 addObject:v14];
                  v32 = [v14 bss];
                  v73 = [v32 network];
                  v33 = [v73 ssid];
                  v34 = [v14 bss];
                  v35 = [v34 bssid];
                  v36 = [v14 bss];
                  v37 = [v36 network];
                  uint64_t v38 = [v37 authFlags];
                  v39 = [v14 bss];
                  uint64_t v54 = v38;
                  v12 = v65;
                  [v65 appendFormat:@"[ssid: %@[%@] {auth:%d, chan:%d, %fm away}], ", v33, v35, v54, (int)objc_msgSend(v39, "channel"), *(void *)&v22];

                  goto LABEL_21;
                }
                v71 = [v14 bss];
                v23 = [v71 network];
                v24 = [v23 ssid];
                __int16 v25 = [v14 bss];
                int v26 = [v25 bssid];
                [v14 bss];
                __int16 v27 = v72 = v15;
                uint64_t v28 = [v27 network];
                __int16 v29 = v20;
                uint64_t v30 = [v28 authFlags];
                v31 = [v14 bss];
                [v68 appendFormat:@"[ssid: %@[%@] {auth:%d, chan:%d, %fm away}], ", v24, v26, v30, (int)objc_msgSend(v31, "channel"), *(void *)&v22];

                v15 = v72;
              }
              else
              {
                __int16 v29 = WALogCategoryDeviceStoreHandle();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136446466;
                  v83 = "+[GeoTagMO geoTagsAtLocationInBand:distance:band:moc:]";
                  __int16 v84 = 1024;
                  int v85 = 114;
                  _os_log_impl(&dword_21D96D000, v29, OS_LOG_TYPE_ERROR, "%{public}s::%d:geoTag nil", buf, 0x12u);
                }
              }
            }
            v12 = v65;
            uint64_t v70 = [v66 countByEnumeratingWithState:&v74 objects:v94 count:16];
            if (v70) {
              continue;
            }
            break;
          }
        }
LABEL_21:

        v40 = WALogCategoryDeviceStoreHandle();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          [v62 timeIntervalSinceNow];
          uint64_t v42 = v41;
          uint64_t v43 = [v66 count];
          *(_DWORD *)buf = 136447234;
          v83 = "+[GeoTagMO geoTagsAtLocationInBand:distance:band:moc:]";
          __int16 v84 = 1024;
          int v85 = 139;
          __int16 v86 = 2112;
          double v87 = v60;
          __int16 v88 = 2048;
          uint64_t v89 = v42;
          __int16 v90 = 2048;
          uint64_t v91 = v43;
          _os_log_impl(&dword_21D96D000, v40, OS_LOG_TYPE_DEBUG, "%{public}s::%d:GeoTag operation for %@ took %f for %lu objects", buf, 0x30u);
        }

        v44 = WALogCategoryDeviceStoreHandle();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        {
          [v67 coordinate];
          uint64_t v46 = v45;
          [v67 coordinate];
          *(_DWORD *)buf = 136447746;
          v83 = "+[GeoTagMO geoTagsAtLocationInBand:distance:band:moc:]";
          __int16 v84 = 1024;
          int v85 = 140;
          __int16 v86 = 2048;
          double v87 = a4;
          __int16 v88 = 2048;
          uint64_t v89 = v46;
          __int16 v90 = 2048;
          uint64_t v91 = v47;
          __int16 v92 = 1024;
          *(_DWORD *)v93 = a5;
          *(_WORD *)&v93[4] = 2112;
          *(void *)&v93[6] = v12;
          _os_log_impl(&dword_21D96D000, v44, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Networks within %fm of <%f, %f> in band :%d - %@", buf, 0x40u);
        }

        v48 = WALogCategoryDeviceStoreHandle();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
        {
          [v67 coordinate];
          uint64_t v50 = v49;
          [v67 coordinate];
          *(_DWORD *)buf = 136447490;
          v83 = "+[GeoTagMO geoTagsAtLocationInBand:distance:band:moc:]";
          __int16 v84 = 1024;
          int v85 = 141;
          __int16 v86 = 2048;
          double v87 = a4;
          __int16 v88 = 2048;
          uint64_t v89 = v50;
          __int16 v90 = 2048;
          uint64_t v91 = v51;
          __int16 v92 = 2112;
          *(void *)v93 = v68;
          _os_log_impl(&dword_21D96D000, v48, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Networks NOT within %fm of <%f, %f> - %@", buf, 0x3Au);
        }

        uint64_t v9 = v64 + 1;
      }
      while (v64 + 1 != v59);
      uint64_t v59 = [obj countByEnumeratingWithState:&v78 objects:v95 count:16];
    }
    while (v59);
  }

  v52 = v56;
  if (![v56 count])
  {

    v52 = 0;
  }

  return v52;
}

+ (BOOL)isNetworkWithinRangeOfLocation:(id)a3 range:(double)a4 location:(id)a5 moc:(id)a6 count:(unint64_t *)a7
{
  v62[1] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v14 = +[GeoTagMO entityName];
  v15 = +[AnalyticsStoreProxy fetchRequestForEntity:v14];

  [v15 setFetchLimit:10];
  id v16 = [MEMORY[0x263EFF8C0] arrayWithObject:@"geoTag.bss.bssid"];
  [v15 setRelationshipKeyPathsForPrefetching:v16];

  double v17 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"date" ascending:0];
  v62[0] = v17;
  double v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v62 count:1];
  [v15 setSortDescriptors:v18];

  double v19 = [MEMORY[0x263F08A98] predicateWithFormat:@"bss.network.ssid == %@", v11];
  uint64_t v20 = +[AnalyticsStoreProxy fetch:v15 withPredicate:v19 moc:v13];
  double v21 = v20;
  if (!v20)
  {
    unint64_t v22 = 0;
    BOOL v36 = 0;
    if (!a7) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  uint64_t v45 = v17;
  id v46 = v13;
  unint64_t v22 = [v20 count];
  v23 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446978;
    v52 = "+[GeoTagMO isNetworkWithinRangeOfLocation:range:location:moc:count:]";
    __int16 v53 = 1024;
    int v54 = 173;
    __int16 v55 = 2048;
    unint64_t v56 = v22;
    __int16 v57 = 2112;
    id v58 = v11;
    _os_log_impl(&dword_21D96D000, v23, OS_LOG_TYPE_DEBUG, "%{public}s::%d:ResultCount:%lu ssid:%@", buf, 0x26u);
  }

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v24 = v21;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v47 objects:v61 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    unint64_t v42 = v22;
    uint64_t v43 = v19;
    v44 = a7;
    uint64_t v27 = *(void *)v48;
    while (2)
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v48 != v27) {
          objc_enumerationMutation(v24);
        }
        __int16 v29 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        id v30 = objc_alloc(MEMORY[0x263F00A58]);
        [v29 latitude];
        double v32 = v31;
        [v29 longitude];
        v34 = (void *)[v30 initWithLatitude:v32 longitude:v33];
        [v34 distanceFromLocation:v12];
        if (v35 < a4)
        {
          double v37 = v35;
          uint64_t v38 = WALogCategoryDeviceStoreHandle();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
            v39 = [v29 bss];
            v40 = [v39 bssid];
            *(_DWORD *)buf = 136447234;
            v52 = "+[GeoTagMO isNetworkWithinRangeOfLocation:range:location:moc:count:]";
            __int16 v53 = 1024;
            int v54 = 179;
            __int16 v55 = 2112;
            unint64_t v56 = (unint64_t)v40;
            __int16 v57 = 2112;
            id v58 = v11;
            __int16 v59 = 2048;
            double v60 = v37;
            _os_log_impl(&dword_21D96D000, v38, OS_LOG_TYPE_DEBUG, "%{public}s::%d:GeoTag for %@[%@] is %f away", buf, 0x30u);
          }
          BOOL v36 = 1;
          goto LABEL_16;
        }
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v47 objects:v61 count:16];
      if (v26) {
        continue;
      }
      break;
    }
    BOOL v36 = 0;
LABEL_16:
    double v19 = v43;
    a7 = v44;
    unint64_t v22 = v42;
  }
  else
  {
    BOOL v36 = 0;
  }

  double v17 = v45;
  id v13 = v46;
  if (a7) {
LABEL_21:
  }
    *a7 = v22;
LABEL_22:

  return v36;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"GeoTag"];
}

@end