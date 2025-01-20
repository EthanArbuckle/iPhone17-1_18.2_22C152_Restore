@interface NeighborGraph
- (AnalyticsStoreMOHandler)managedObjectHandler;
- (BOOL)doesPathExist:(id)a3 target:(id)a4;
- (NSArray)bssids;
- (NSMutableArray)bssidsDwellTimes;
- (NSMutableArray)graph;
- (NSString)ssid;
- (NeighborGraph)initWithBssidArray:(id)a3 ssid:(id)a4 handler:(id)a5;
- (id)copyNeighborGraphAsDictionary;
- (unint64_t)graphDensity;
- (void)setBssids:(id)a3;
- (void)setBssidsDwellTimes:(id)a3;
- (void)setGraph:(id)a3;
- (void)setManagedObjectHandler:(id)a3;
- (void)setNeighborsForBssid:(id)a3 dwellTime:(unint64_t)a4 neighborInfoArray:(id)a5;
- (void)setNeighborsForBssid:(id)a3 neighbors:(id)a4;
- (void)setSsid:(id)a3;
@end

@implementation NeighborGraph

- (NeighborGraph)initWithBssidArray:(id)a3 ssid:(id)a4 handler:(id)a5
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v31.receiver = self;
  v31.super_class = (Class)NeighborGraph;
  v11 = [(NeighborGraph *)&v31 init];
  if (!v11) {
    goto LABEL_31;
  }
  if (!v8)
  {
    v28 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      goto LABEL_30;
    }
    *(_DWORD *)buf = 136446466;
    v33 = "-[NeighborGraph initWithBssidArray:ssid:handler:]";
    __int16 v34 = 1024;
    int v35 = 35;
    v29 = "%{public}s::%d:bssidArray nil";
LABEL_29:
    _os_log_impl(&dword_21D96D000, v28, OS_LOG_TYPE_ERROR, v29, buf, 0x12u);
    goto LABEL_30;
  }
  if (![v8 count])
  {
    v28 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      goto LABEL_30;
    }
    *(_DWORD *)buf = 136446466;
    v33 = "-[NeighborGraph initWithBssidArray:ssid:handler:]";
    __int16 v34 = 1024;
    int v35 = 36;
    v29 = "%{public}s::%d:bssidArray has 0 objects";
    goto LABEL_29;
  }
  if (!v10)
  {
    v28 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      goto LABEL_30;
    }
    *(_DWORD *)buf = 136446466;
    v33 = "-[NeighborGraph initWithBssidArray:ssid:handler:]";
    __int16 v34 = 1024;
    int v35 = 37;
    v29 = "%{public}s::%d:analyticsStoreMOHandler nil";
    goto LABEL_29;
  }
  objc_storeStrong((id *)&v11->_managedObjectHandler, a5);
  uint64_t v12 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  graph = v11->_graph;
  v11->_graph = (NSMutableArray *)v12;

  if (!v11->_graph)
  {
    v28 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      goto LABEL_30;
    }
    *(_DWORD *)buf = 136446466;
    v33 = "-[NeighborGraph initWithBssidArray:ssid:handler:]";
    __int16 v34 = 1024;
    int v35 = 42;
    v29 = "%{public}s::%d:bss nil";
    goto LABEL_29;
  }
  if ([v8 count])
  {
    unint64_t v14 = 0;
    do
    {
      v15 = v11->_graph;
      v16 = [MEMORY[0x263EFF980] array];
      [(NSMutableArray *)v15 addObject:v16];

      ++v14;
    }
    while (v14 < [v8 count]);
  }
  uint64_t v17 = [v9 copy];
  ssid = v11->_ssid;
  v11->_ssid = (NSString *)v17;

  uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithArray:v8];
  bssids = v11->_bssids;
  v11->_bssids = (NSArray *)v19;

  if (!v11->_bssids)
  {
    v28 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      goto LABEL_30;
    }
    *(_DWORD *)buf = 136446466;
    v33 = "-[NeighborGraph initWithBssidArray:ssid:handler:]";
    __int16 v34 = 1024;
    int v35 = 51;
    v29 = "%{public}s::%d:path nil";
    goto LABEL_29;
  }
  uint64_t v21 = [MEMORY[0x263EFF980] array];
  bssidsDwellTimes = v11->_bssidsDwellTimes;
  v11->_bssidsDwellTimes = (NSMutableArray *)v21;

  if (!v11->_bssidsDwellTimes)
  {
    v28 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v33 = "-[NeighborGraph initWithBssidArray:ssid:handler:]";
      __int16 v34 = 1024;
      int v35 = 54;
      v29 = "%{public}s::%d:_bssidsDwellTimes nil";
      goto LABEL_29;
    }
LABEL_30:

LABEL_31:
    v27 = 0;
    goto LABEL_32;
  }
  if ([v8 count])
  {
    unint64_t v23 = 0;
    do
    {
      [(NSMutableArray *)v11->_bssidsDwellTimes addObject:&unk_26CE65DE8];
      ++v23;
    }
    while (v23 < [v8 count]);
  }
  v24 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v25 = [(NSArray *)v11->_bssids count];
    uint64_t v26 = [(NSMutableArray *)v11->_graph count];
    *(_DWORD *)buf = 136446978;
    v33 = "-[NeighborGraph initWithBssidArray:ssid:handler:]";
    __int16 v34 = 1024;
    int v35 = 60;
    __int16 v36 = 2048;
    uint64_t v37 = v25;
    __int16 v38 = 2048;
    uint64_t v39 = v26;
    _os_log_impl(&dword_21D96D000, v24, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Initialized with bssids count:%lu graph count: %lu", buf, 0x26u);
  }

  v27 = v11;
LABEL_32:

  return v27;
}

- (void)setNeighborsForBssid:(id)a3 neighbors:(id)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v6)
  {
    v13 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    *(_DWORD *)buf = 136446466;
    v43 = "-[NeighborGraph setNeighborsForBssid:neighbors:]";
    __int16 v44 = 1024;
    int v45 = 70;
    objc_super v31 = "%{public}s::%d:bssid nil";
    goto LABEL_28;
  }
  if (!v7)
  {
    v13 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    *(_DWORD *)buf = 136446466;
    v43 = "-[NeighborGraph setNeighborsForBssid:neighbors:]";
    __int16 v44 = 1024;
    int v45 = 71;
    objc_super v31 = "%{public}s::%d:neighborBssids nil";
    goto LABEL_28;
  }
  if (![v7 count])
  {
    v13 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    *(_DWORD *)buf = 136446466;
    v43 = "-[NeighborGraph setNeighborsForBssid:neighbors:]";
    __int16 v44 = 1024;
    int v45 = 72;
    objc_super v31 = "%{public}s::%d:neighborBssids empty";
LABEL_28:
    v32 = v13;
    uint32_t v33 = 18;
    goto LABEL_31;
  }
  id v9 = [(NeighborGraph *)self bssids];
  uint64_t v10 = [v9 indexOfObject:v6];

  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v13 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    *(_DWORD *)buf = 136446722;
    v43 = "-[NeighborGraph setNeighborsForBssid:neighbors:]";
    __int16 v44 = 1024;
    int v45 = 75;
    __int16 v46 = 2112;
    id v47 = v6;
    objc_super v31 = "%{public}s::%d:bssid %@ not found";
    v32 = v13;
    uint32_t v33 = 28;
LABEL_31:
    _os_log_impl(&dword_21D96D000, v32, OS_LOG_TYPE_ERROR, v31, buf, v33);
    goto LABEL_21;
  }
  uint64_t v34 = v10;
  id v35 = v6;
  v11 = (void *)MEMORY[0x263EFF980];
  uint64_t v12 = [(NeighborGraph *)self bssids];
  v13 = objc_msgSend(v11, "arrayWithCapacity:", objc_msgSend(v12, "count"));

  unint64_t v14 = [(NeighborGraph *)self bssids];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    unint64_t v16 = 0;
    do
    {
      uint64_t v17 = [NSNumber numberWithBool:0];
      [v13 addObject:v17];

      ++v16;
      v18 = [(NeighborGraph *)self bssids];
      unint64_t v19 = [v18 count];
    }
    while (v16 < v19);
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v8;
  uint64_t v20 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v38;
    while (2)
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        v24 = v13;
        if (*(void *)v38 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        uint64_t v26 = [(NeighborGraph *)self bssids];
        uint64_t v27 = [v26 indexOfObject:v25];

        if (v27 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v30 = WALogCategoryDeviceStoreHandle();
          v13 = v24;
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446722;
            v43 = "-[NeighborGraph setNeighborsForBssid:neighbors:]";
            __int16 v44 = 1024;
            int v45 = 84;
            __int16 v46 = 2112;
            id v47 = v25;
            _os_log_impl(&dword_21D96D000, v30, OS_LOG_TYPE_ERROR, "%{public}s::%d:neighbor %@ not found", buf, 0x1Cu);
          }

          goto LABEL_20;
        }
        v28 = [NSNumber numberWithBool:1];
        v13 = v24;
        [v24 insertObject:v28 atIndex:v27];
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v21) {
        continue;
      }
      break;
    }
  }

  v29 = [(NeighborGraph *)self graph];
  [v29 insertObject:v13 atIndex:v34];

LABEL_20:
  id v6 = v35;
LABEL_21:
}

- (BOOL)doesPathExist:(id)a3 target:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v6)
  {
    v18 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    int v21 = 136446466;
    uint64_t v22 = "-[NeighborGraph doesPathExist:target:]";
    __int16 v23 = 1024;
    int v24 = 99;
    unint64_t v19 = "%{public}s::%d:sourceBssid nil";
LABEL_18:
    _os_log_impl(&dword_21D96D000, v18, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v21, 0x12u);
    goto LABEL_19;
  }
  if (!v7)
  {
    v18 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    int v21 = 136446466;
    uint64_t v22 = "-[NeighborGraph doesPathExist:target:]";
    __int16 v23 = 1024;
    int v24 = 100;
    unint64_t v19 = "%{public}s::%d:targetBssid nil";
    goto LABEL_18;
  }
  id v9 = [(NeighborGraph *)self bssids];
  uint64_t v10 = [v9 indexOfObject:v6];

  v11 = [(NeighborGraph *)self bssids];
  uint64_t v12 = [v11 indexOfObject:v8];

  if (v12 == v10)
  {
    v18 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v21 = 136446466;
      uint64_t v22 = "-[NeighborGraph doesPathExist:target:]";
      __int16 v23 = 1024;
      int v24 = 105;
      unint64_t v19 = "%{public}s::%d:source and target are same.. bailing";
      goto LABEL_18;
    }
LABEL_19:

    unint64_t v14 = 0;
LABEL_20:
    char isKindOfClass = 0;
    goto LABEL_21;
  }
  v13 = [(NeighborGraph *)self graph];
  unint64_t v14 = [v13 objectAtIndex:v10];

  if (!v14 || ![v14 count]) {
    goto LABEL_20;
  }
  uint64_t v15 = [v14 objectAtIndex:v12];
  unint64_t v16 = [MEMORY[0x263EFF9D0] null];

  if (v15 == v16)
  {
    char isKindOfClass = 0;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char isKindOfClass = 1;
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
  }

LABEL_21:
  return isKindOfClass & 1;
}

- (unint64_t)graphDensity
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  v3 = [(NeighborGraph *)self bssids];
  uint64_t v21 = [v3 count];

  v4 = [(NeighborGraph *)self bssids];
  v5 = (void *)[v4 mutableCopy];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v44 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    unint64_t v9 = 0;
    uint64_t v22 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v22) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v6, "mutableCopy", v21);
        [v12 removeObject:v11];
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v13 = v12;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v43 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v24;
          do
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v24 != v16) {
                objc_enumerationMutation(v13);
              }
              v9 += [(NeighborGraph *)self doesPathExist:v11 target:*(void *)(*((void *)&v23 + 1) + 8 * j)];
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v43 count:16];
          }
          while (v15);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v44 count:16];
    }
    while (v8);
  }
  else
  {
    unint64_t v9 = 0;
  }

  unint64_t v18 = (unint64_t)((v21 - 1) * v21) >> 1;
  unint64_t v19 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136447490;
    v32 = "-[NeighborGraph graphDensity]";
    __int16 v33 = 1024;
    int v34 = 144;
    __int16 v35 = 2048;
    uint64_t v36 = v21;
    __int16 v37 = 2048;
    unint64_t v38 = (unint64_t)((v21 - 1) * v21) >> 1;
    __int16 v39 = 2048;
    unint64_t v40 = v9;
    __int16 v41 = 2048;
    unint64_t v42 = (unint64_t)((double)v9 / (double)v18 * 100.0);
    _os_log_impl(&dword_21D96D000, v19, OS_LOG_TYPE_DEBUG, "%{public}s::%d:BssCount:%lu MaxPaths:%lu actualPaths:%lu Density:%lu", buf, 0x3Au);
  }

  return (unint64_t)((double)v9 / (double)v18 * 100.0);
}

- (void)setNeighborsForBssid:(id)a3 dwellTime:(unint64_t)a4 neighborInfoArray:(id)a5
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  unint64_t v9 = v8;
  if (!v7)
  {
    log = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    *(_DWORD *)buf = 136446466;
    v69 = "-[NeighborGraph setNeighborsForBssid:dwellTime:neighborInfoArray:]";
    __int16 v70 = 1024;
    int v71 = 151;
    v53 = "%{public}s::%d:bssid nil";
    goto LABEL_33;
  }
  if (!v8)
  {
    log = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    *(_DWORD *)buf = 136446466;
    v69 = "-[NeighborGraph setNeighborsForBssid:dwellTime:neighborInfoArray:]";
    __int16 v70 = 1024;
    int v71 = 152;
    v53 = "%{public}s::%d:neighborInfoArray nil";
    goto LABEL_33;
  }
  if (![v8 count])
  {
    log = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    *(_DWORD *)buf = 136446466;
    v69 = "-[NeighborGraph setNeighborsForBssid:dwellTime:neighborInfoArray:]";
    __int16 v70 = 1024;
    int v71 = 153;
    v53 = "%{public}s::%d:neighborInfoArray empty";
LABEL_33:
    v54 = log;
    uint32_t v55 = 18;
    goto LABEL_36;
  }
  uint64_t v10 = [(NeighborGraph *)self bssids];
  uint64_t v11 = [v10 indexOfObject:v7];

  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    log = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    *(_DWORD *)buf = 136446722;
    v69 = "-[NeighborGraph setNeighborsForBssid:dwellTime:neighborInfoArray:]";
    __int16 v70 = 1024;
    int v71 = 156;
    __int16 v72 = 2112;
    id v73 = v7;
    v53 = "%{public}s::%d:bssid %@ not found";
    v54 = log;
    uint32_t v55 = 28;
LABEL_36:
    _os_log_impl(&dword_21D96D000, v54, OS_LOG_TYPE_ERROR, v53, buf, v55);
    goto LABEL_26;
  }
  uint64_t v12 = [(NeighborGraph *)self bssidsDwellTimes];
  id v13 = [NSNumber numberWithUnsignedInteger:a4];
  uint64_t v58 = v11;
  [v12 insertObject:v13 atIndex:v11];

  uint64_t v14 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = [v9 count];
    uint64_t v16 = [(NeighborGraph *)self bssids];
    *(_DWORD *)buf = 136447746;
    v69 = "-[NeighborGraph setNeighborsForBssid:dwellTime:neighborInfoArray:]";
    __int16 v70 = 1024;
    int v71 = 160;
    __int16 v72 = 2048;
    id v73 = (id)(v11 + 1);
    __int16 v74 = 2112;
    uint64_t v75 = (uint64_t)v7;
    __int16 v76 = 2048;
    unint64_t v77 = a4;
    __int16 v78 = 2048;
    uint64_t v79 = v15;
    __int16 v80 = 2048;
    uint64_t v81 = [v16 count];
    _os_log_impl(&dword_21D96D000, v14, OS_LOG_TYPE_DEBUG, "%{public}s::%d:(%lu) BSSID: %@ dwell:%lu has %lu neighbors. BssidsCount:%lu", buf, 0x44u);
  }
  id v57 = v7;

  log = [MEMORY[0x263EFF980] array];
  uint64_t v17 = [(NeighborGraph *)self bssids];
  uint64_t v18 = [v17 count];

  if (v18)
  {
    unint64_t v19 = 0;
    do
    {
      uint64_t v20 = [MEMORY[0x263EFF980] array];
      [log addObject:v20];

      ++v19;
      uint64_t v21 = [(NeighborGraph *)self bssids];
      unint64_t v22 = [v21 count];
    }
    while (v19 < v22);
  }
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  v56 = v9;
  id obj = v9;
  uint64_t v23 = [obj countByEnumeratingWithState:&v63 objects:v67 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = 0;
    uint64_t v61 = *(void *)v64;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v64 != v61) {
          objc_enumerationMutation(obj);
        }
        long long v27 = *(void **)(*((void *)&v63 + 1) + 8 * i);
        long long v28 = [v27 valueForKey:@"NeighborBssid"];
        long long v29 = [(NeighborGraph *)self bssids];
        uint64_t v30 = [v29 indexOfObject:v28];

        objc_super v31 = WALogCategoryDeviceStoreHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136447234;
          v69 = "-[NeighborGraph setNeighborsForBssid:dwellTime:neighborInfoArray:]";
          __int16 v70 = 1024;
          int v71 = 173;
          __int16 v72 = 2112;
          id v73 = v28;
          __int16 v74 = 2048;
          uint64_t v75 = v30;
          __int16 v76 = 2048;
          unint64_t v77 = v25 + 1;
          _os_log_impl(&dword_21D96D000, v31, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Neighbor: %@ has index %lu at iteration:%lu", buf, 0x30u);
        }

        if (v30 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v32 = WALogCategoryDeviceStoreHandle();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446978;
            v69 = "-[NeighborGraph setNeighborsForBssid:dwellTime:neighborInfoArray:]";
            __int16 v70 = 1024;
            int v71 = 176;
            __int16 v72 = 2112;
            id v73 = v28;
            __int16 v74 = 2048;
            uint64_t v75 = v25 + 1;
            _os_log_impl(&dword_21D96D000, v32, OS_LOG_TYPE_ERROR, "%{public}s::%d:Couldnt find Neighbor: %@ in iteration:%lu", buf, 0x26u);
          }
        }
        else
        {
          v32 = [MEMORY[0x263EFF9A0] dictionary];
          __int16 v33 = [v27 objectForKeyedSubscript:@"NeighborBssNumRoamCacheRssiHigh"];
          [v32 setObject:v33 forKeyedSubscript:@"NeighborBssNumRoamCacheRssiHigh"];

          int v34 = [v27 objectForKeyedSubscript:@"NeighborBssNumRoamCacheRssiMid"];
          [v32 setObject:v34 forKeyedSubscript:@"NeighborBssNumRoamCacheRssiMid"];

          __int16 v35 = [v27 objectForKeyedSubscript:@"NeighborBssNumRoamCacheRssiUpperMid"];
          [v32 setObject:v35 forKeyedSubscript:@"NeighborBssNumRoamCacheRssiUpperMid"];

          uint64_t v36 = [v27 objectForKeyedSubscript:@"NeighborBssNumRoamCacheRssiLow"];
          [v32 setObject:v36 forKeyedSubscript:@"NeighborBssNumRoamCacheRssiLow"];

          __int16 v37 = [v27 objectForKeyedSubscript:@"NeighborBssNumRoamCacheRssiReallyLow"];
          [v32 setObject:v37 forKeyedSubscript:@"NeighborBssNumRoamCacheRssiReallyLow"];

          unint64_t v38 = [v27 objectForKeyedSubscript:@"NeighborBssNumRoamOriginRssiHigh"];
          [v32 setObject:v38 forKeyedSubscript:@"NeighborBssNumRoamOriginRssiHigh"];

          __int16 v39 = [v27 objectForKeyedSubscript:@"NeighborBssNumRoamOriginRssiUpperHigh"];
          [v32 setObject:v39 forKeyedSubscript:@"NeighborBssNumRoamOriginRssiUpperHigh"];

          unint64_t v40 = [v27 objectForKeyedSubscript:@"NeighborBssNumRoamOriginRssiOptimum"];
          [v32 setObject:v40 forKeyedSubscript:@"NeighborBssNumRoamOriginRssiOptimum"];

          __int16 v41 = [v27 objectForKeyedSubscript:@"NeighborBssNumRoamOriginRssiUpperOptimum"];
          [v32 setObject:v41 forKeyedSubscript:@"NeighborBssNumRoamOriginRssiUpperOptimum"];

          unint64_t v42 = [v27 objectForKeyedSubscript:@"NeighborBssNumRoamOriginRssiMid"];
          [v32 setObject:v42 forKeyedSubscript:@"NeighborBssNumRoamOriginRssiMid"];

          v43 = [v27 objectForKeyedSubscript:@"NeighborBssNumRoamOriginRssiUpperMid"];
          [v32 setObject:v43 forKeyedSubscript:@"NeighborBssNumRoamOriginRssiUpperMid"];

          __int16 v44 = [v27 objectForKeyedSubscript:@"NeighborBssNumRoamOriginRssiLow"];
          [v32 setObject:v44 forKeyedSubscript:@"NeighborBssNumRoamOriginRssiLow"];

          uint64_t v45 = [v27 objectForKeyedSubscript:@"NeighborBssNumLazyRoamOriginRssiHigh"];
          [v32 setObject:v45 forKeyedSubscript:@"NeighborBssNumLazyRoamOriginRssiHigh"];

          __int16 v46 = [v27 objectForKeyedSubscript:@"NeighborBssNumLazyRoamOriginRssiUpperHigh"];
          [v32 setObject:v46 forKeyedSubscript:@"NeighborBssNumLazyRoamOriginRssiUpperHigh"];

          id v47 = [v27 objectForKeyedSubscript:@"NeighborBssNumLazyRoamOriginRssiOptimum"];
          [v32 setObject:v47 forKeyedSubscript:@"NeighborBssNumLazyRoamOriginRssiOptimum"];

          uint64_t v48 = [v27 objectForKeyedSubscript:@"NeighborBssNumLazyRoamOriginRssiUpperOptimum"];
          [v32 setObject:v48 forKeyedSubscript:@"NeighborBssNumLazyRoamOriginRssiUpperOptimum"];

          v49 = [v27 objectForKeyedSubscript:@"NeighborBssNumLazyRoamOriginRssiMid"];
          [v32 setObject:v49 forKeyedSubscript:@"NeighborBssNumLazyRoamOriginRssiMid"];

          [log replaceObjectAtIndex:v30 withObject:v32];
          ++v25;
        }
      }
      uint64_t v24 = [obj countByEnumeratingWithState:&v63 objects:v67 count:16];
    }
    while (v24);
  }

  v50 = WALogCategoryDeviceStoreHandle();
  id v7 = v57;
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v51 = [log count];
    *(_DWORD *)buf = 136447234;
    v69 = "-[NeighborGraph setNeighborsForBssid:dwellTime:neighborInfoArray:]";
    __int16 v70 = 1024;
    int v71 = 205;
    __int16 v72 = 2112;
    id v73 = v57;
    __int16 v74 = 2048;
    uint64_t v75 = v58;
    __int16 v76 = 2048;
    unint64_t v77 = v51;
    _os_log_impl(&dword_21D96D000, v50, OS_LOG_TYPE_DEBUG, "%{public}s::%d:BSSID %@ at %lu has Neighbor count: %lu", buf, 0x30u);
  }

  v52 = [(NeighborGraph *)self graph];
  [v52 insertObject:log atIndex:v58];

  unint64_t v9 = v56;
LABEL_26:
}

- (id)copyNeighborGraphAsDictionary
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v21 = 0;
  unint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__2;
  uint64_t v25 = __Block_byref_object_dispose__2;
  id v26 = [MEMORY[0x263EFF980] array];
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__2;
  unint64_t v19 = __Block_byref_object_dispose__2;
  id v20 = [MEMORY[0x263EFF980] array];
  v3 = [(NeighborGraph *)self bssidsDwellTimes];
  v4 = [v3 valueForKeyPath:@"@sum.self"];

  uint64_t v5 = [v4 unsignedIntegerValue];
  id v6 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = [(NeighborGraph *)self bssids];
    uint64_t v8 = [v7 count];
    unint64_t v9 = [(NeighborGraph *)self bssids];
    *(_DWORD *)buf = 136447234;
    long long v28 = "-[NeighborGraph copyNeighborGraphAsDictionary]";
    __int16 v29 = 1024;
    int v30 = 221;
    __int16 v31 = 2048;
    uint64_t v32 = v8;
    __int16 v33 = 2048;
    uint64_t v34 = v5;
    __int16 v35 = 2112;
    uint64_t v36 = v9;
    _os_log_impl(&dword_21D96D000, v6, OS_LOG_TYPE_DEBUG, "%{public}s::%d:bssidCount:%lu totalDwell:%lu BSSIDs:%@", buf, 0x30u);
  }
  uint64_t v10 = [(NeighborGraph *)self bssids];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __46__NeighborGraph_copyNeighborGraphAsDictionary__block_invoke;
  v14[3] = &unk_264466FA0;
  v14[4] = self;
  v14[5] = &v21;
  v14[6] = &v15;
  v14[7] = v5;
  [v10 enumerateObjectsUsingBlock:v14];

  uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
  [v11 setObject:v22[5] forKey:@"nodes"];
  [v11 setObject:v16[5] forKey:@"links"];
  uint64_t v12 = (void *)[v11 copy];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v12;
}

void __46__NeighborGraph_copyNeighborGraphAsDictionary__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = [MEMORY[0x263EFF9A0] dictionary];
  id v7 = [NSNumber numberWithUnsignedInteger:a3 + 1];
  [v6 setValue:v7 forKey:@"id"];

  [v6 setValue:v5 forKey:@"bssid"];
  uint64_t v8 = [*(id *)(a1 + 32) bssidsDwellTimes];
  unint64_t v9 = [v8 objectAtIndex:a3];
  unint64_t v10 = (unint64_t)(100 * [v9 unsignedIntegerValue]) / *(void *)(a1 + 56);

  uint64_t v11 = [NSNumber numberWithUnsignedInteger:v10];
  [v6 setValue:v11 forKey:@"dwellTime"];

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v6];
  uint64_t v12 = [*(id *)(a1 + 32) ssid];
  id v13 = [*(id *)(a1 + 32) managedObjectHandler];
  uint64_t v14 = [v13 managedObjectContext];
  uint64_t v15 = +[BSSMO getInstance:v5 ssid:v12 moc:v14];

  uint64_t v16 = [NSNumber numberWithUnsignedInteger:v10];
  [v6 setValue:v16 forKey:@"dwellTime"];

  uint64_t v17 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v15, "channel"));
  [v6 setValue:v17 forKey:@"channel"];

  uint64_t v18 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v15, "isEdgeForJoin"));
  [v6 setValue:v18 forKey:@"isEdgeForJoin"];

  unint64_t v19 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v15, "isEdgeForLeave"));
  [v6 setValue:v19 forKey:@"isEdgeForLeave"];

  id v20 = [*(id *)(a1 + 32) graph];
  uint64_t v21 = [v20 objectAtIndex:a3];

  unint64_t v22 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v23 = [*(id *)(a1 + 32) bssidsDwellTimes];
    uint64_t v24 = [v23 objectAtIndex:a3];
    *(_DWORD *)buf = 136447746;
    __int16 v33 = "-[NeighborGraph copyNeighborGraphAsDictionary]_block_invoke";
    __int16 v34 = 1024;
    int v35 = 241;
    __int16 v36 = 2112;
    id v37 = v5;
    __int16 v38 = 2112;
    __int16 v39 = v24;
    __int16 v40 = 2048;
    unint64_t v41 = v10;
    __int16 v42 = 2048;
    uint64_t v43 = a3;
    __int16 v44 = 2048;
    uint64_t v45 = [v21 count];
    _os_log_impl(&dword_21D96D000, v22, OS_LOG_TYPE_DEBUG, "%{public}s::%d:BSSID %@ dwell:%@ dwellPct:%lu at %lu has Neighbor count: %lu", buf, 0x44u);
  }
  if (v21 && [v21 count])
  {
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __46__NeighborGraph_copyNeighborGraphAsDictionary__block_invoke_80;
    v27[3] = &unk_264466F78;
    uint64_t v31 = a3;
    id v25 = v5;
    uint64_t v26 = *(void *)(a1 + 32);
    id v28 = v25;
    uint64_t v29 = v26;
    uint64_t v30 = *(void *)(a1 + 48);
    [v21 enumerateObjectsUsingBlock:v27];
  }
}

void __46__NeighborGraph_copyNeighborGraphAsDictionary__block_invoke_80(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = [MEMORY[0x263EFF9D0] null];

  if (v6 != v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = WALogCategoryDeviceStoreHandle();
      uint64_t v70 = a3;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v8 = *(void *)(a1 + 56) + 1;
        unint64_t v9 = (void *)(a3 + 1);
        uint64_t v10 = *(void *)(a1 + 32);
        uint64_t v11 = [*(id *)(a1 + 40) bssids];
        uint64_t v12 = [v11 objectAtIndex:a3];
        *(_DWORD *)buf = 136447490;
        uint64_t v75 = "-[NeighborGraph copyNeighborGraphAsDictionary]_block_invoke";
        __int16 v76 = 1024;
        int v77 = 248;
        __int16 v78 = 2048;
        uint64_t v79 = v8;
        __int16 v80 = 2112;
        uint64_t v81 = v10;
        __int16 v82 = 2048;
        v83 = v9;
        __int16 v84 = 2112;
        v85 = v12;
        _os_log_impl(&dword_21D96D000, v7, OS_LOG_TYPE_DEBUG, "%{public}s::%d:(%lu) BSSID: %@ -> (%lu) BSSID: %@", buf, 0x3Au);
      }
      else
      {
        unint64_t v9 = (void *)(a3 + 1);
      }

      uint64_t v17 = [MEMORY[0x263EFF9A0] dictionary];
      uint64_t v72 = a1;
      uint64_t v18 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 56) + 1];
      [v17 setObject:v18 forKey:@"source"];

      unint64_t v19 = [NSNumber numberWithUnsignedInteger:v9];
      v69 = v17;
      [v17 setObject:v19 forKey:@"target"];

      id v73 = v5;
      id v20 = v5;
      uint64_t v21 = [v20 objectForKeyedSubscript:@"NeighborBssNumRoamOriginRssiHigh"];
      uint64_t v22 = [v21 unsignedIntegerValue];
      uint64_t v23 = [v20 objectForKeyedSubscript:@"NeighborBssNumRoamOriginRssiUpperHigh"];
      uint64_t v24 = [v23 unsignedIntegerValue] + v22;
      id v25 = [v20 objectForKeyedSubscript:@"NeighborBssNumRoamOriginRssiOptimum"];
      uint64_t v26 = [v25 unsignedIntegerValue];
      long long v27 = [v20 objectForKeyedSubscript:@"NeighborBssNumRoamOriginRssiUpperOptimum"];
      uint64_t v28 = v24 + v26 + [v27 unsignedIntegerValue];
      uint64_t v29 = [v20 objectForKeyedSubscript:@"NeighborBssNumRoamOriginRssiMid"];
      uint64_t v30 = [v29 unsignedIntegerValue];
      uint64_t v31 = [v20 objectForKeyedSubscript:@"NeighborBssNumRoamOriginRssiUpperMid"];
      uint64_t v32 = v30 + [v31 unsignedIntegerValue];
      __int16 v33 = [v20 objectForKeyedSubscript:@"NeighborBssNumRoamOriginRssiLow"];
      unint64_t v34 = v28 + v32 + [v33 unsignedIntegerValue];

      int v35 = [v20 objectForKeyedSubscript:@"NeighborBssNumRoamOriginRssiHigh"];
      unint64_t v66 = 100 * [v35 unsignedIntegerValue] / v34;

      __int16 v36 = [v20 objectForKeyedSubscript:@"NeighborBssNumRoamOriginRssiUpperHigh"];
      unint64_t v65 = 100 * [v36 unsignedIntegerValue] / v34;

      id v37 = [v20 objectForKeyedSubscript:@"NeighborBssNumRoamOriginRssiOptimum"];
      unint64_t v38 = 100 * [v37 unsignedIntegerValue] / v34;

      __int16 v39 = [v20 objectForKeyedSubscript:@"NeighborBssNumRoamOriginRssiUpperOptimum"];
      unint64_t v40 = 100 * [v39 unsignedIntegerValue] / v34;

      unint64_t v41 = [v20 objectForKeyedSubscript:@"NeighborBssNumRoamOriginRssiMid"];
      unint64_t v42 = 100 * [v41 unsignedIntegerValue] / v34;

      uint64_t v43 = [v20 objectForKeyedSubscript:@"NeighborBssNumRoamOriginRssiUpperMid"];
      unint64_t v44 = 100 * [v43 unsignedIntegerValue] / v34;

      v68 = v20;
      uint64_t v45 = [v20 objectForKeyedSubscript:@"NeighborBssNumRoamOriginRssiLow"];
      unint64_t v46 = 100 * [v45 unsignedIntegerValue] / v34;

      id v47 = [MEMORY[0x263EFF980] array];
      uint64_t v48 = [NSNumber numberWithUnsignedInteger:v66];
      [v47 addObject:v48];

      v49 = [NSNumber numberWithUnsignedInteger:v65];
      [v47 addObject:v49];

      v50 = [NSNumber numberWithUnsignedInteger:v38];
      [v47 addObject:v50];

      uint64_t v51 = [NSNumber numberWithUnsignedInteger:v40];
      [v47 addObject:v51];

      v52 = [NSNumber numberWithUnsignedInteger:v42];
      [v47 addObject:v52];

      v53 = [NSNumber numberWithUnsignedInteger:v44];
      [v47 addObject:v53];

      v54 = [NSNumber numberWithUnsignedInteger:v46];
      [v47 addObject:v54];

      uint64_t v55 = [v47 valueForKeyPath:@"@max.integerValue"];
      uint64_t v56 = [v47 indexOfObject:v55];
      id v57 = WALogCategoryDeviceStoreHandle();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136447234;
        uint64_t v75 = "-[NeighborGraph copyNeighborGraphAsDictionary]_block_invoke";
        __int16 v76 = 1024;
        int v77 = 286;
        __int16 v78 = 2112;
        uint64_t v79 = v55;
        __int16 v80 = 2048;
        uint64_t v81 = v56;
        __int16 v82 = 2112;
        v83 = v47;
        _os_log_impl(&dword_21D96D000, v57, OS_LOG_TYPE_DEBUG, "%{public}s::%d:max:%@ level:%lu %@", buf, 0x30u);
      }

      v67 = +[RoamPolicyStore rangeStringWithRssiLevel:v56];
      uint64_t v14 = v69;
      [v69 setObject:v67 forKey:@"rssiBucketWithMostRoams"];
      [v69 setObject:v55 forKey:@"rssiBucketWithRoamsPct"];
      uint64_t v58 = NSNumber;
      uint64_t v59 = *(void *)(v72 + 32);
      v60 = [*(id *)(v72 + 40) bssids];
      uint64_t v61 = [v60 objectAtIndex:v70];
      [*(id *)(v72 + 40) managedObjectHandler];
      v62 = int v71 = (void *)v55;
      long long v63 = [v62 managedObjectContext];
      long long v64 = objc_msgSend(v58, "numberWithUnsignedInteger:", +[RoamMO roamsCountBetweenBssids:target:moc:](RoamMO, "roamsCountBetweenBssids:target:moc:", v59, v61, v63));
      [v69 setObject:v64 forKey:@"roamsCount"];

      [*(id *)(*(void *)(*(void *)(v72 + 48) + 8) + 40) addObject:v69];
      id v5 = v73;
      goto LABEL_15;
    }
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v14 = WALogCategoryDeviceStoreHandle();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (isKindOfClass)
    {
      if (v15)
      {
        *(_DWORD *)buf = 136446466;
        uint64_t v75 = "-[NeighborGraph copyNeighborGraphAsDictionary]_block_invoke";
        __int16 v76 = 1024;
        int v77 = 296;
        uint64_t v16 = "%{public}s::%d:Unexpected neighborInfo class";
LABEL_14:
        _os_log_impl(&dword_21D96D000, v14, OS_LOG_TYPE_ERROR, v16, buf, 0x12u);
      }
    }
    else if (v15)
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v75 = "-[NeighborGraph copyNeighborGraphAsDictionary]_block_invoke";
      __int16 v76 = 1024;
      int v77 = 298;
      uint64_t v16 = "%{public}s::%d:Invalid neighborInfo class";
      goto LABEL_14;
    }
LABEL_15:
  }
}

- (NSArray)bssids
{
  return self->_bssids;
}

- (void)setBssids:(id)a3
{
}

- (NSMutableArray)graph
{
  return self->_graph;
}

- (void)setGraph:(id)a3
{
}

- (AnalyticsStoreMOHandler)managedObjectHandler
{
  return self->_managedObjectHandler;
}

- (void)setManagedObjectHandler:(id)a3
{
}

- (NSMutableArray)bssidsDwellTimes
{
  return self->_bssidsDwellTimes;
}

- (void)setBssidsDwellTimes:(id)a3
{
}

- (NSString)ssid
{
  return self->_ssid;
}

- (void)setSsid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ssid, 0);
  objc_storeStrong((id *)&self->_bssidsDwellTimes, 0);
  objc_storeStrong((id *)&self->_managedObjectHandler, 0);
  objc_storeStrong((id *)&self->_graph, 0);
  objc_storeStrong((id *)&self->_bssids, 0);
}

@end