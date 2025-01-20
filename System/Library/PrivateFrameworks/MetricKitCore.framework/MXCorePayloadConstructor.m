@interface MXCorePayloadConstructor
+ (id)buildDiagnosticPayloadForClient:(id)a3 fromClientDiagnosticsDictionary:(id)a4 withDateString:(id)a5;
+ (id)buildDummyDiagnosticPayloadForClient:(id)a3 withDateString:(id)a4;
+ (id)buildDummyPayloadForClient:(id)a3 withDateString:(id)a4;
+ (id)buildPayloadForClient:(id)a3 fromClientMetricsDictionary:(id)a4;
+ (id)constructPayloadWithServiceString:(id)a3 withSourceData:(id)a4 withDateString:(id)a5 forClient:(id)a6;
+ (id)updatePayload:(id)a3 withServiceString:(id)a4 withSourceData:(id)a5 withDateString:(id)a6 forClient:(id)a7;
@end

@implementation MXCorePayloadConstructor

+ (id)buildDiagnosticPayloadForClient:(id)a3 fromClientDiagnosticsDictionary:(id)a4 withDateString:(id)a5
{
  uint64_t v99 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  os_log_t v10 = os_log_create("com.apple.metrickit.core.payload", "constructor");
  v11 = [&unk_26DF1F710 objectAtIndexedSubscript:3];
  v12 = [v8 objectForKey:v11];
  if (v12) {
    goto LABEL_4;
  }
  v12 = [&unk_26DF1F728 objectAtIndexedSubscript:4];
  v13 = [v8 objectForKey:v12];
  if (v13)
  {

LABEL_4:
LABEL_5:
    v14 = v10;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = [v8 allKeys];
      *(_DWORD *)buf = 138412290;
      v98 = v15;
      _os_log_impl(&dword_22BB49000, v14, OS_LOG_TYPE_DEFAULT, "Constructing payload for data sources: %@", buf, 0xCu);
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      +[MXCorePayloadConstructor buildDiagnosticPayloadForClient:fromClientDiagnosticsDictionary:withDateString:].cold.8();
    }
    id v16 = objc_alloc_init(MEMORY[0x263F08790]);
    v70 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
    objc_msgSend(v16, "setLocale:");
    [v16 setDateFormat:@"yyyy-MM-dd HH:mm"];
    v17 = [MEMORY[0x263EFFA18] localTimeZone];
    [v16 setTimeZone:v17];

    v18 = [MEMORY[0x263EFF910] date];
    v19 = [v16 stringFromDate:v18];
    v77 = [v16 dateFromString:v19];

    v20 = [MEMORY[0x263EFF910] date];
    v21 = [v16 stringFromDate:v20];
    v71 = v16;
    v76 = [v16 dateFromString:v21];

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      +[MXCorePayloadConstructor buildDiagnosticPayloadForClient:fromClientDiagnosticsDictionary:withDateString:].cold.7();
    }
    v72 = v10;
    id v73 = v9;
    id v75 = v7;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      +[MXCorePayloadConstructor buildDiagnosticPayloadForClient:fromClientDiagnosticsDictionary:withDateString:].cold.6();
    }
    v22 = [&unk_26DF1F758 objectAtIndexedSubscript:4];
    v23 = [v8 objectForKey:v22];

    id v24 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v25 = objc_alloc_init(MEMORY[0x263EFF980]);
    v80 = v23;
    if (v23)
    {
      long long v92 = 0u;
      long long v93 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      id v26 = v23;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v90 objects:v96 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v91;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v91 != v29) {
              objc_enumerationMutation(v26);
            }
            v31 = *(void **)(*((void *)&v90 + 1) + 8 * i);
            v32 = [v31 cpuExceptionDiagnostic];

            if (v32)
            {
              v33 = [v31 cpuExceptionDiagnostic];
              [v24 addObject:v33];
            }
            v34 = [v31 diskWriteExceptionDiagnostic];

            if (v34)
            {
              v35 = [v31 diskWriteExceptionDiagnostic];
              [v25 addObject:v35];
            }
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v90 objects:v96 count:16];
        }
        while (v28);
      }
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      +[MXCorePayloadConstructor buildDiagnosticPayloadForClient:fromClientDiagnosticsDictionary:withDateString:].cold.5();
    }
    v36 = [&unk_26DF1F770 objectAtIndexedSubscript:3];
    v37 = [v8 objectForKey:v36];

    id v38 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v39 = objc_alloc_init(MEMORY[0x263EFF980]);
    v81 = v24;
    v78 = v37;
    v79 = v14;
    if (v37)
    {
      id v40 = v8;
      long long v88 = 0u;
      long long v89 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      id v41 = v37;
      uint64_t v42 = [v41 countByEnumeratingWithState:&v86 objects:v95 count:16];
      if (v42)
      {
        uint64_t v43 = v42;
        uint64_t v44 = *(void *)v87;
        do
        {
          for (uint64_t j = 0; j != v43; ++j)
          {
            if (*(void *)v87 != v44) {
              objc_enumerationMutation(v41);
            }
            v46 = *(void **)(*((void *)&v86 + 1) + 8 * j);
            v47 = [v46 hangDiagnostic];

            if (v47)
            {
              v48 = [v46 hangDiagnostic];
              [v38 addObject:v48];
            }
            v49 = [v46 appLaunchDiagnostic];

            if (v49)
            {
              v50 = [v46 appLaunchDiagnostic];
              [v39 addObject:v50];
            }
          }
          uint64_t v43 = [v41 countByEnumeratingWithState:&v86 objects:v95 count:16];
        }
        while (v43);
      }

      id v8 = v40;
      v37 = v78;
      v14 = v79;
      id v24 = v81;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      +[MXCorePayloadConstructor buildDiagnosticPayloadForClient:fromClientDiagnosticsDictionary:withDateString:].cold.4();
    }
    v51 = [&unk_26DF1F788 objectAtIndexedSubscript:5];
    id v74 = v8;
    v52 = [v8 objectForKey:v51];

    id v53 = objc_alloc_init(MEMORY[0x263EFF980]);
    if (v52)
    {
      long long v84 = 0u;
      long long v85 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      v69 = v52;
      id v54 = v52;
      uint64_t v55 = [v54 countByEnumeratingWithState:&v82 objects:v94 count:16];
      if (v55)
      {
        uint64_t v56 = v55;
        uint64_t v57 = *(void *)v83;
        do
        {
          for (uint64_t k = 0; k != v56; ++k)
          {
            if (*(void *)v83 != v57) {
              objc_enumerationMutation(v54);
            }
            v59 = *(void **)(*((void *)&v82 + 1) + 8 * k);
            v60 = [v59 crashDiagnostic];

            if (v60)
            {
              v61 = [v59 crashDiagnostic];
              [v53 addObject:v61];
            }
          }
          uint64_t v56 = [v54 countByEnumeratingWithState:&v82 objects:v94 count:16];
        }
        while (v56);
      }

      v37 = v78;
      v14 = v79;
      id v24 = v81;
      v52 = v69;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      +[MXCorePayloadConstructor buildDiagnosticPayloadForClient:fromClientDiagnosticsDictionary:withDateString:]();
    }
    id v62 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v63 = [v24 count];
    id v64 = v24;
    if (v63) {
      [v62 setObject:v24 forKey:@"cpuExceptionDiagnostics"];
    }
    if (objc_msgSend(v25, "count", v64)) {
      [v62 setObject:v25 forKey:@"diskWriteExceptionDiagnostics"];
    }
    if ([v38 count]) {
      [v62 setObject:v38 forKey:@"hangDiagnostics"];
    }
    if ([v39 count]) {
      [v62 setObject:v39 forKey:@"appLaunchDiagnostics"];
    }
    if ([v53 count]) {
      [v62 setObject:v53 forKey:@"crashDiagnostics"];
    }
    if ([v62 count])
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        +[MXCorePayloadConstructor buildDiagnosticPayloadForClient:fromClientDiagnosticsDictionary:withDateString:]();
      }
      v65 = (void *)[objc_alloc(MEMORY[0x263F134E0]) initWithTimeStampBegin:v77 withTimeStampEnd:v76 withDiagnostics:v62];
    }
    else
    {
      v65 = 0;
    }

    id v8 = v74;
    id v7 = v75;
    os_log_t v10 = v72;
    id v9 = v73;
    goto LABEL_72;
  }
  v67 = [&unk_26DF1F740 objectAtIndexedSubscript:5];
  v68 = [v8 objectForKey:v67];

  if (v68) {
    goto LABEL_5;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    +[MXCorePayloadConstructor buildDiagnosticPayloadForClient:fromClientDiagnosticsDictionary:withDateString:]();
  }
  v65 = 0;
LABEL_72:

  return v65;
}

+ (id)buildPayloadForClient:(id)a3 fromClientMetricsDictionary:(id)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v30 = a3;
  id v5 = a4;
  v6 = os_log_create("com.apple.metrickit.core.payload", "constructor");
  id v7 = [&unk_26DF1F7A0 objectAtIndexedSubscript:2];
  id v8 = [v5 objectForKey:v7];

  if (v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v25 = v5;
    obuint64_t j = v5;
    uint64_t v27 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
    if (v27)
    {
      uint64_t v26 = *(void *)v37;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v37 != v26) {
            objc_enumerationMutation(obj);
          }
          uint64_t v29 = v10;
          uint64_t v31 = *(void *)(*((void *)&v36 + 1) + 8 * v10);
          v11 = objc_msgSend(obj, "objectForKeyedSubscript:");
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            id v41 = v11;
            _os_log_debug_impl(&dword_22BB49000, v6, OS_LOG_TYPE_DEBUG, "Service data to parse: %@", buf, 0xCu);
          }
          long long v34 = 0u;
          long long v35 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          id v12 = v11;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v44 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v33;
            do
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v33 != v15) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v17 = *(void *)(*((void *)&v32 + 1) + 8 * i);
                v18 = [v9 objectForKeyedSubscript:v17];

                if (v18)
                {
                  v19 = [v9 objectForKeyedSubscript:v17];
                  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412546;
                    id v41 = v19;
                    __int16 v42 = 2112;
                    uint64_t v43 = v17;
                    _os_log_debug_impl(&dword_22BB49000, v6, OS_LOG_TYPE_DEBUG, "Payload: %@ exists for date string: %@", buf, 0x16u);
                  }
                  v20 = [v12 objectForKeyedSubscript:v17];
                  v21 = +[MXCorePayloadConstructor updatePayload:v19 withServiceString:v31 withSourceData:v20 withDateString:v17 forClient:v30];
                  [v9 setObject:v21 forKeyedSubscript:v17];
                }
                else
                {
                  v19 = [v12 objectForKeyedSubscript:v17];
                  v20 = +[MXCorePayloadConstructor constructPayloadWithServiceString:v31 withSourceData:v19 withDateString:v17 forClient:v30];
                  [v9 setObject:v20 forKeyedSubscript:v17];
                }
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v32 objects:v44 count:16];
            }
            while (v14);
          }

          uint64_t v10 = v29 + 1;
        }
        while (v29 + 1 != v27);
        uint64_t v27 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
      }
      while (v27);
    }

    v22 = v6;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      +[MXCorePayloadConstructor buildPayloadForClient:fromClientMetricsDictionary:](v9, v22);
    }

    v23 = [v9 allValues];

    id v5 = v25;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[MXCorePayloadConstructor buildPayloadForClient:fromClientMetricsDictionary:]();
    }
    v23 = 0;
  }

  return v23;
}

+ (id)updatePayload:(id)a3 withServiceString:(id)a4 withSourceData:(id)a5 withDateString:(id)a6 forClient:(id)a7
{
  id v7 = a3;

  return v7;
}

+ (id)constructPayloadWithServiceString:(id)a3 withSourceData:(id)a4 withDateString:(id)a5 forClient:(id)a6
{
  id v50 = a3;
  id v48 = a4;
  id v47 = a5;
  id v9 = a6;
  uint64_t v10 = os_log_create("com.apple.metrickit.core.payload", "constructor");
  v11 = [&unk_26DF1F7B8 objectAtIndexedSubscript:2];
  LODWORD(a5) = [v50 isEqualToString:v11];

  if (a5)
  {
    id v12 = objc_alloc(MEMORY[0x263F13538]);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      +[MXCorePayloadConstructor constructPayloadWithServiceString:withSourceData:withDateString:forClient:]1();
    }
    v49 = [MEMORY[0x263F01868] applicationProxyForIdentifier:v9];
    uint64_t v13 = [v49 shortVersionString];
    if (v13) {
      [v49 shortVersionString];
    }
    else {
    uint64_t v46 = [v49 bundleVersion];
    }

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      +[MXCorePayloadConstructor constructPayloadWithServiceString:withSourceData:withDateString:forClient:]0();
    }
    v45 = [v49 bundleVersion];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      +[MXCorePayloadConstructor constructPayloadWithServiceString:withSourceData:withDateString:forClient:].cold.9();
    }
    id v15 = v48;
    if (v15)
    {
      id v16 = v10;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        +[MXCorePayloadConstructor constructPayloadWithServiceString:withSourceData:withDateString:forClient:].cold.8(v15, v16);
      }

      uint64_t v17 = v12;
      uint64_t v18 = [v15 includesMultipleApplicationVersions];
      v19 = [v15 beginDate];
      v20 = [v15 endDate];
      v21 = [v17 initWithAppVersion:v46 withMutipleAppVersions:v18 withTimeStampBegin:v19 withTimeStampEnd:v20];

      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        +[MXCorePayloadConstructor constructPayloadWithServiceString:withSourceData:withDateString:forClient:].cold.7();
      }
      int v22 = objc_msgSend(MEMORY[0x263F55748], "verifySDKVersionForClient:", v9, v45);
      id v23 = objc_alloc(MEMORY[0x263F13530]);
      id v24 = [MEMORY[0x263F55748] regionFormat];
      id v25 = [MEMORY[0x263F55748] osVersion];
      uint64_t v26 = [MEMORY[0x263F55748] modelIdentifier];
      if (v22)
      {
        uint64_t v27 = [MEMORY[0x263F55748] platformArchitecture];
        uint64_t v28 = (void *)[v23 initWithRegionFormat:v24 osVersion:v25 deviceType:v26 appBuildVersion:v45 platformArchitecture:v27];

        [v21 setMetaData:v28];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          +[MXCorePayloadConstructor constructPayloadWithServiceString:withSourceData:withDateString:forClient:].cold.5();
        }
      }
      else
      {
        uint64_t v28 = (void *)[v23 initWithRegionFormat:v24 osVersion:v25 deviceType:v26 appBuildVersion:v45];

        [v21 setMetaData:v28];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          +[MXCorePayloadConstructor constructPayloadWithServiceString:withSourceData:withDateString:forClient:].cold.6();
        }
      }

      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        +[MXCorePayloadConstructor constructPayloadWithServiceString:withSourceData:withDateString:forClient:].cold.4(v16, v21);
      }
      if (([MEMORY[0x263F55748] verifySDKVersionForClient:v9] & 1) == 0)
      {
        uint64_t v29 = [v15 cpuMetrics];
        [v29 setValue:0 forKey:@"cumulativeCPUInstructions"];
      }
      id v30 = [v15 cpuMetrics];
      [v21 setCpuMetrics:v30];

      uint64_t v31 = [v15 gpuMetrics];
      [v21 setGpuMetrics:v31];

      long long v32 = [v15 cellularConditionMetrics];
      [v21 setCellularConditionMetrics:v32];

      long long v33 = [v15 applicationTimeMetrics];
      [v21 setApplicationTimeMetrics:v33];

      long long v34 = [v15 locationActivityMetrics];
      [v21 setLocationActivityMetrics:v34];

      long long v35 = [v15 networkTransferMetrics];
      [v21 setNetworkTransferMetrics:v35];

      long long v36 = [v15 applicationLaunchMetrics];
      [v21 setApplicationLaunchMetrics:v36];

      long long v37 = [v15 applicationResponsivenessMetrics];
      [v21 setApplicationResponsivenessMetrics:v37];

      long long v38 = [v15 diskIOMetrics];
      [v21 setDiskIOMetrics:v38];

      long long v39 = [v15 displayMetrics];
      [v21 setDisplayMetrics:v39];

      id v40 = [v15 memoryMetrics];
      [v21 setMemoryMetrics:v40];

      id v41 = [v15 signpostMetrics];
      [v21 setSignpostMetrics:v41];

      if ([MEMORY[0x263F55748] verifySDKVersionForClient:v9])
      {
        __int16 v42 = [v15 animationMetrics];
        [v21 setAnimationMetrics:v42];

        uint64_t v43 = [v15 applicationExitMetrics];
        [v21 setApplicationExitMetrics:v43];
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        +[MXCorePayloadConstructor constructPayloadWithServiceString:withSourceData:withDateString:forClient:]();
      }
      id v12 = v21;
      uint64_t v14 = v12;
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        +[MXCorePayloadConstructor constructPayloadWithServiceString:withSourceData:withDateString:forClient:]();
      }
      uint64_t v14 = 0;
    }
  }
  else
  {
    id v12 = v10;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[MXCorePayloadConstructor constructPayloadWithServiceString:withSourceData:withDateString:forClient:]2((uint64_t)v50, v12);
    }
    uint64_t v14 = 0;
  }

  return v14;
}

+ (id)buildDummyPayloadForClient:(id)a3 withDateString:(id)a4
{
  v323[3] = *MEMORY[0x263EF8340];
  id v5 = (objc_class *)MEMORY[0x263F13538];
  id v6 = a4;
  id v7 = a3;
  id v283 = [v5 alloc];
  id v8 = objc_alloc_init(MEMORY[0x263F08790]);
  v286 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
  objc_msgSend(v8, "setLocale:");
  [v8 setDateFormat:@"yyyy-MM-dd HH:mm"];
  id v9 = [MEMORY[0x263EFFA18] localTimeZone];
  [v8 setTimeZone:v9];

  uint64_t v10 = [v6 stringByAppendingString:@" 00:00"];
  v314 = [v8 dateFromString:v10];

  v11 = [v6 stringByAppendingString:@" 23:59"];

  v287 = v8;
  v313 = [v8 dateFromString:v11];

  id v12 = [MEMORY[0x263F01868] applicationProxyForIdentifier:v7];

  uint64_t v13 = [v12 shortVersionString];
  if (v13) {
    [v12 shortVersionString];
  }
  else {
  v312 = [v12 bundleVersion];
  }

  v284 = [v12 bundleVersion];
  id v14 = objc_alloc(MEMORY[0x263F13530]);
  [MEMORY[0x263F55748] regionFormat];
  id v15 = v285 = v12;
  id v16 = [MEMORY[0x263F55748] osVersion];
  uint64_t v17 = [MEMORY[0x263F55748] modelIdentifier];
  uint64_t v18 = [MEMORY[0x263F55748] platformArchitecture];
  v311 = (void *)[v14 initWithRegionFormat:v15 osVersion:v16 deviceType:v17 appBuildVersion:v284 platformArchitecture:v18];

  id v19 = objc_alloc(MEMORY[0x263F134B0]);
  id v20 = objc_alloc(MEMORY[0x263F08980]);
  v21 = [MEMORY[0x263F08C98] seconds];
  int v22 = (void *)[v20 initWithDoubleValue:v21 unit:100.0];
  id v23 = objc_alloc(MEMORY[0x263F08980]);
  id v24 = (void *)[objc_alloc(MEMORY[0x263F08C60]) initWithSymbol:@"kiloinstructions"];
  id v25 = (void *)[v23 initWithDoubleValue:v24 unit:100.0];
  v310 = (void *)[v19 initWithCumulativeCPUTimeMeasurement:v22 withCumulativeCPUInstructions:v25];

  id v26 = objc_alloc(MEMORY[0x263F13508]);
  id v27 = objc_alloc(MEMORY[0x263F08980]);
  uint64_t v28 = [MEMORY[0x263F08C98] seconds];
  uint64_t v29 = (void *)[v27 initWithDoubleValue:v28 unit:20.0];
  v309 = (void *)[v26 initWithCumulativeGPUTimeMeasurement:v29];

  id v30 = objc_alloc(MEMORY[0x263F13518]);
  id v31 = objc_alloc(MEMORY[0x263F08980]);
  long long v32 = [MEMORY[0x263F13568] bars];
  long long v33 = (void *)[v31 initWithDoubleValue:v32 unit:1.0];
  id v34 = objc_alloc(MEMORY[0x263F08980]);
  long long v35 = [MEMORY[0x263F13568] bars];
  long long v36 = (void *)[v34 initWithDoubleValue:v35 unit:1.0];
  v282 = (void *)[v30 initWithBucketStart:v33 bucketEnd:v36 bucketCount:20];

  id v37 = objc_alloc(MEMORY[0x263F13518]);
  id v38 = objc_alloc(MEMORY[0x263F08980]);
  long long v39 = [MEMORY[0x263F13568] bars];
  id v40 = (void *)[v38 initWithDoubleValue:v39 unit:2.0];
  id v41 = objc_alloc(MEMORY[0x263F08980]);
  __int16 v42 = [MEMORY[0x263F13568] bars];
  uint64_t v43 = (void *)[v41 initWithDoubleValue:v42 unit:2.0];
  v281 = (void *)[v37 initWithBucketStart:v40 bucketEnd:v43 bucketCount:30];

  id v44 = objc_alloc(MEMORY[0x263F13518]);
  id v45 = objc_alloc(MEMORY[0x263F08980]);
  uint64_t v46 = [MEMORY[0x263F13568] bars];
  id v47 = (void *)[v45 initWithDoubleValue:v46 unit:3.0];
  id v48 = objc_alloc(MEMORY[0x263F08980]);
  v49 = [MEMORY[0x263F13568] bars];
  id v50 = (void *)[v48 initWithDoubleValue:v49 unit:3.0];
  v280 = (void *)[v44 initWithBucketStart:v47 bucketEnd:v50 bucketCount:50];

  id v51 = objc_alloc(MEMORY[0x263F134D0]);
  v323[0] = v282;
  v323[1] = v281;
  v323[2] = v280;
  v52 = [MEMORY[0x263EFF8C0] arrayWithObjects:v323 count:3];
  v308 = (void *)[v51 initWithCellularConditionTime:v52];

  id v53 = objc_alloc(MEMORY[0x263F13490]);
  id v54 = objc_alloc(MEMORY[0x263F08980]);
  uint64_t v55 = [MEMORY[0x263F08C98] seconds];
  uint64_t v56 = (void *)[v54 initWithDoubleValue:v55 unit:700.0];
  id v57 = objc_alloc(MEMORY[0x263F08980]);
  v58 = [MEMORY[0x263F08C98] seconds];
  v59 = (void *)[v57 initWithDoubleValue:v58 unit:40.0];
  id v60 = objc_alloc(MEMORY[0x263F08980]);
  v61 = [MEMORY[0x263F08C98] seconds];
  id v62 = (void *)[v60 initWithDoubleValue:v61 unit:30.0];
  id v63 = objc_alloc(MEMORY[0x263F08980]);
  id v64 = [MEMORY[0x263F08C98] seconds];
  v65 = (void *)[v63 initWithDoubleValue:v64 unit:30.0];
  v307 = (void *)[v53 initWithCumulativeForegroundTimeMeasurement:v56 cumulativeBackgroundTimeMeasurement:v59 cumulativeBackgroundAudioTimeMeasurement:v62 cumulativeBackgroundLocationTimeMeasurement:v65];

  id v305 = objc_alloc(MEMORY[0x263F13520]);
  id v66 = objc_alloc(MEMORY[0x263F08980]);
  v303 = [MEMORY[0x263F08C98] seconds];
  v299 = (void *)[v66 initWithDoubleValue:v303 unit:30.0];
  id v67 = objc_alloc(MEMORY[0x263F08980]);
  v301 = [MEMORY[0x263F08C98] seconds];
  v68 = (void *)[v67 initWithDoubleValue:v301 unit:20.0];
  id v69 = objc_alloc(MEMORY[0x263F08980]);
  v70 = [MEMORY[0x263F08C98] seconds];
  v71 = (void *)[v69 initWithDoubleValue:v70 unit:30.0];
  id v72 = objc_alloc(MEMORY[0x263F08980]);
  id v73 = [MEMORY[0x263F08C98] seconds];
  id v74 = (void *)[v72 initWithDoubleValue:v73 unit:30.0];
  id v75 = objc_alloc(MEMORY[0x263F08980]);
  v76 = [MEMORY[0x263F08C98] seconds];
  v77 = (void *)[v75 initWithDoubleValue:v76 unit:20.0];
  id v78 = objc_alloc(MEMORY[0x263F08980]);
  v79 = [MEMORY[0x263F08C98] seconds];
  v80 = (void *)[v78 initWithDoubleValue:v79 unit:20.0];
  v306 = (void *)[v305 initWithCumulativeBestAccuracyTimeMeasurement:v299 cumulativeBestAccuracyForNavigationTimeMeasurement:v68 nearestTenMetersAccuracyTimeMeasurement:v71 hundredMetersAccuracyTimeMeasurement:v74 kilometerAccuracyTimeMeasurement:v77 threeKilometerAccuracyTimeMeasurement:v80];

  id v81 = objc_alloc(MEMORY[0x263F13540]);
  id v82 = objc_alloc(MEMORY[0x263F08980]);
  long long v83 = [MEMORY[0x263F08CE0] kilobytes];
  long long v84 = (void *)[v82 initWithDoubleValue:v83 unit:50000.0];
  id v85 = objc_alloc(MEMORY[0x263F08980]);
  long long v86 = [MEMORY[0x263F08CE0] kilobytes];
  long long v87 = (void *)[v85 initWithDoubleValue:v86 unit:60000.0];
  id v88 = objc_alloc(MEMORY[0x263F08980]);
  long long v89 = [MEMORY[0x263F08CE0] kilobytes];
  long long v90 = (void *)[v88 initWithDoubleValue:v89 unit:70000.0];
  id v91 = objc_alloc(MEMORY[0x263F08980]);
  long long v92 = [MEMORY[0x263F08CE0] kilobytes];
  long long v93 = (void *)[v91 initWithDoubleValue:v92 unit:80000.0];
  v304 = (void *)[v81 initWithCumulativeWifiUploadMeasurement:v84 cumulativeWifiDownloadMeasurement:v87 cumulativeCellularUploadMeasurement:v90 cumulativeCellularDownloadMeasurement:v93];

  id v94 = objc_alloc(MEMORY[0x263F13518]);
  id v95 = objc_alloc(MEMORY[0x263F08980]);
  v96 = [MEMORY[0x263F08C98] milliseconds];
  v97 = (void *)[v95 initWithDoubleValue:v96 unit:0.0];
  id v98 = objc_alloc(MEMORY[0x263F08980]);
  uint64_t v99 = [MEMORY[0x263F08C98] milliseconds];
  v100 = (void *)[v98 initWithDoubleValue:v99 unit:100.0];
  v279 = (void *)[v94 initWithBucketStart:v97 bucketEnd:v100 bucketCount:50];

  id v101 = objc_alloc(MEMORY[0x263F13518]);
  id v102 = objc_alloc(MEMORY[0x263F08980]);
  v103 = [MEMORY[0x263F08C98] milliseconds];
  v104 = (void *)[v102 initWithDoubleValue:v103 unit:100.0];
  id v105 = objc_alloc(MEMORY[0x263F08980]);
  v106 = [MEMORY[0x263F08C98] milliseconds];
  v107 = (void *)[v105 initWithDoubleValue:v106 unit:400.0];
  v278 = (void *)[v101 initWithBucketStart:v104 bucketEnd:v107 bucketCount:60];

  id v108 = objc_alloc(MEMORY[0x263F13518]);
  id v109 = objc_alloc(MEMORY[0x263F08980]);
  v110 = [MEMORY[0x263F08C98] milliseconds];
  v111 = (void *)[v109 initWithDoubleValue:v110 unit:400.0];
  id v112 = objc_alloc(MEMORY[0x263F08980]);
  v113 = [MEMORY[0x263F08C98] milliseconds];
  v114 = (void *)[v112 initWithDoubleValue:v113 unit:700.0];
  v277 = (void *)[v108 initWithBucketStart:v111 bucketEnd:v114 bucketCount:30];

  id v115 = objc_alloc(MEMORY[0x263F13488]);
  v322[0] = v279;
  v322[1] = v278;
  v322[2] = v277;
  v116 = [MEMORY[0x263EFF8C0] arrayWithObjects:v322 count:3];
  v302 = (void *)[v115 initWithAppResponsivenessData:v116];

  id v117 = objc_alloc(MEMORY[0x263F134E8]);
  id v118 = objc_alloc(MEMORY[0x263F08980]);
  v119 = [MEMORY[0x263F08CE0] kilobytes];
  v120 = (void *)[v118 initWithDoubleValue:v119 unit:1300.0];
  v276 = (void *)[v117 initWithCumulativeLogicalWritesMeasurement:v120];

  id v121 = objc_alloc(MEMORY[0x263F13528]);
  id v122 = objc_alloc(MEMORY[0x263F08980]);
  v123 = [MEMORY[0x263F08CE0] kilobytes];
  v124 = (void *)[v122 initWithDoubleValue:v123 unit:200000.0];
  id v125 = objc_alloc(MEMORY[0x263F13498]);
  id v126 = objc_alloc(MEMORY[0x263F08980]);
  v127 = [MEMORY[0x263F08CE0] kilobytes];
  v128 = (void *)[v126 initWithDoubleValue:v127 unit:100000.0];
  v129 = (void *)[v125 initWithMeasurement:v128 sampleCount:500 standardDeviation:0.0];
  v275 = (void *)[v121 initWithPeakMemoryUsageMeasurement:v124 averageMemoryUsageMeasurement:v129];

  id v130 = objc_alloc(MEMORY[0x263F13518]);
  id v131 = objc_alloc(MEMORY[0x263F08980]);
  v132 = [MEMORY[0x263F08C98] milliseconds];
  v133 = (void *)[v131 initWithDoubleValue:v132 unit:0.0];
  id v134 = objc_alloc(MEMORY[0x263F08980]);
  v135 = [MEMORY[0x263F08C98] milliseconds];
  v136 = (void *)[v134 initWithDoubleValue:v135 unit:100.0];
  v296 = (void *)[v130 initWithBucketStart:v133 bucketEnd:v136 bucketCount:50];

  id v137 = objc_alloc(MEMORY[0x263F13518]);
  id v138 = objc_alloc(MEMORY[0x263F08980]);
  v139 = [MEMORY[0x263F08C98] milliseconds];
  v140 = (void *)[v138 initWithDoubleValue:v139 unit:100.0];
  id v141 = objc_alloc(MEMORY[0x263F08980]);
  v142 = [MEMORY[0x263F08C98] milliseconds];
  v143 = (void *)[v141 initWithDoubleValue:v142 unit:400.0];
  v274 = (void *)[v137 initWithBucketStart:v140 bucketEnd:v143 bucketCount:60];

  id v144 = objc_alloc(MEMORY[0x263F13518]);
  id v145 = objc_alloc(MEMORY[0x263F08980]);
  v146 = [MEMORY[0x263F08C98] milliseconds];
  v147 = (void *)[v145 initWithDoubleValue:v146 unit:400.0];
  id v148 = objc_alloc(MEMORY[0x263F08980]);
  v149 = [MEMORY[0x263F08C98] milliseconds];
  v150 = (void *)[v148 initWithDoubleValue:v149 unit:700.0];
  v273 = (void *)[v144 initWithBucketStart:v147 bucketEnd:v150 bucketCount:30];

  id v151 = objc_alloc(MEMORY[0x263F13518]);
  id v152 = objc_alloc(MEMORY[0x263F08980]);
  v153 = [MEMORY[0x263F08C98] milliseconds];
  v154 = (void *)[v152 initWithDoubleValue:v153 unit:0.0];
  id v155 = objc_alloc(MEMORY[0x263F08980]);
  v156 = [MEMORY[0x263F08C98] milliseconds];
  v157 = (void *)[v155 initWithDoubleValue:v156 unit:200.0];
  v300 = (void *)[v151 initWithBucketStart:v154 bucketEnd:v157 bucketCount:60];

  id v158 = objc_alloc(MEMORY[0x263F13518]);
  id v159 = objc_alloc(MEMORY[0x263F08980]);
  v160 = [MEMORY[0x263F08C98] milliseconds];
  v161 = (void *)[v159 initWithDoubleValue:v160 unit:201.0];
  id v162 = objc_alloc(MEMORY[0x263F08980]);
  v163 = [MEMORY[0x263F08C98] milliseconds];
  v164 = (void *)[v162 initWithDoubleValue:v163 unit:300.0];
  v298 = (void *)[v158 initWithBucketStart:v161 bucketEnd:v164 bucketCount:70];

  id v165 = objc_alloc(MEMORY[0x263F13518]);
  id v166 = objc_alloc(MEMORY[0x263F08980]);
  v167 = [MEMORY[0x263F08C98] milliseconds];
  v168 = (void *)[v166 initWithDoubleValue:v167 unit:301.0];
  id v169 = objc_alloc(MEMORY[0x263F08980]);
  v170 = [MEMORY[0x263F08C98] milliseconds];
  v171 = (void *)[v169 initWithDoubleValue:v170 unit:500.0];
  v297 = (void *)[v165 initWithBucketStart:v168 bucketEnd:v171 bucketCount:80];

  id v292 = objc_alloc(MEMORY[0x263F13550]);
  id v290 = objc_alloc(MEMORY[0x263F13548]);
  v321[0] = v296;
  v321[1] = v274;
  v321[2] = v273;
  uint64_t v172 = [MEMORY[0x263EFF8C0] arrayWithObjects:v321 count:3];
  id v173 = objc_alloc(MEMORY[0x263F08980]);
  v294 = [MEMORY[0x263F08C98] milliseconds];
  v174 = (void *)[v173 initWithDoubleValue:v294 unit:30000.0];
  id v175 = objc_alloc(MEMORY[0x263F13498]);
  id v176 = objc_alloc(MEMORY[0x263F08980]);
  v177 = [MEMORY[0x263F08CE0] kilobytes];
  v178 = (void *)[v176 initWithDoubleValue:v177 unit:100000.0];
  v179 = (void *)[v175 initWithMeasurement:v178 sampleCount:2 standardDeviation:0.0];
  id v180 = objc_alloc(MEMORY[0x263F08980]);
  v181 = [MEMORY[0x263F08CE0] kilobytes];
  v182 = (void *)[v180 initWithDoubleValue:v181 unit:600.0];
  id v183 = objc_alloc(MEMORY[0x263F08980]);
  v184 = (void *)[objc_alloc(MEMORY[0x263F08C60]) initWithSymbol:@"ms per s"];
  v185 = (void *)[v183 initWithDoubleValue:v184 unit:50.0];
  v186 = (void *)v172;
  v187 = (void *)[v290 initWithHistogramDurationData:v172 withCumulativeCPUTime:v174 withAverageMemory:v179 withCumulativeLogicalWrites:v182 withCumulativeHitchTimeRatio:v185];
  v272 = (void *)[v292 initWithSignpostName:@"TestSignpostName1" withSignpostCategory:@"TestSignpostCategory1" withTotalCount:30 withSignpostIntervalData:v187];

  id v188 = objc_alloc(MEMORY[0x263F13550]);
  id v189 = objc_alloc(MEMORY[0x263F13548]);
  v320[0] = v300;
  v320[1] = v298;
  v320[2] = v297;
  v190 = [MEMORY[0x263EFF8C0] arrayWithObjects:v320 count:3];
  id v191 = objc_alloc(MEMORY[0x263F08980]);
  v192 = [MEMORY[0x263F08C98] milliseconds];
  v193 = (void *)[v191 initWithDoubleValue:v192 unit:50000.0];
  id v194 = objc_alloc(MEMORY[0x263F13498]);
  id v195 = objc_alloc(MEMORY[0x263F08980]);
  v196 = [MEMORY[0x263F08CE0] kilobytes];
  v197 = (void *)[v195 initWithDoubleValue:v196 unit:60000.0];
  v198 = (void *)[v194 initWithMeasurement:v197 sampleCount:2 standardDeviation:0.0];
  id v199 = objc_alloc(MEMORY[0x263F08980]);
  v200 = [MEMORY[0x263F08CE0] kilobytes];
  v201 = (void *)[v199 initWithDoubleValue:v200 unit:700.0];
  v202 = (void *)[v189 initWithHistogramDurationData:v190 withCumulativeCPUTime:v193 withAverageMemory:v198 withCumulativeLogicalWrites:v201];
  v271 = (void *)[v188 initWithSignpostName:@"TestSignpostName2" withSignpostCategory:@"TestSignpostCategory2" withTotalCount:40 withSignpostIntervalData:v202];

  id v203 = objc_alloc(MEMORY[0x263F134F8]);
  id v204 = objc_alloc(MEMORY[0x263F13498]);
  id v205 = objc_alloc(MEMORY[0x263F08980]);
  v206 = [MEMORY[0x263F13560] apl];
  v207 = (void *)[v205 initWithDoubleValue:v206 unit:50.0];
  v208 = (void *)[v204 initWithMeasurement:v207 sampleCount:500 standardDeviation:0.0];
  v270 = (void *)[v203 initWithAveragePictureLevel:v208];

  id v209 = objc_alloc(MEMORY[0x263F13468]);
  id v210 = objc_alloc(MEMORY[0x263F08980]);
  v211 = (void *)[objc_alloc(MEMORY[0x263F08C60]) initWithSymbol:@"ms per s"];
  v212 = (void *)[v210 initWithDoubleValue:v211 unit:1000.0];
  v269 = (void *)[v209 initWithGlitchTimeRatio:v212];

  id v213 = objc_alloc(MEMORY[0x263F13470]);
  v214 = (void *)[objc_alloc(MEMORY[0x263F13500]) initWithNormalAppExitCount:1 withMemoryResourceLimitExitCount:1 withCPUResourceLimitExitCount:1 withBadAccessExitCount:1 withAbnormalExitCount:1 withIllegalInstructionExitCount:1 withAppWatchDogExitCount:1];
  v215 = (void *)[objc_alloc(MEMORY[0x263F134A0]) initWithNormalAppExitCount:1 memoryResourceLimitExitCount:1 cpuResourceLimitExitCount:1 memoryPressureExitCount:1 badAccessExitCount:1 abnormalExitCount:1 illegalInstructionExitCount:1 appWatchDogExitCount:1 cumulativeSuspendedWithLockedFileExitCount:1 cumulativeBackgroundTaskAssertionTimeoutExitCount:1 cumulativeBackgroundURLSessionCompletionTimeoutExitCount:1 cumulativeBackgroundFetchCompletionTimeoutExitCount:1];
  v268 = (void *)[v213 initWithForegroundExitData:v214 backgroundExitData:v215];

  id v216 = objc_alloc(MEMORY[0x263F13518]);
  id v217 = objc_alloc(MEMORY[0x263F08980]);
  v218 = [MEMORY[0x263F08C98] milliseconds];
  v219 = (void *)[v217 initWithDoubleValue:v218 unit:1000.0];
  id v220 = objc_alloc(MEMORY[0x263F08980]);
  v221 = [MEMORY[0x263F08C98] milliseconds];
  v222 = (void *)[v220 initWithDoubleValue:v221 unit:1010.0];
  v295 = (void *)[v216 initWithBucketStart:v219 bucketEnd:v222 bucketCount:50];

  id v223 = objc_alloc(MEMORY[0x263F13518]);
  id v224 = objc_alloc(MEMORY[0x263F08980]);
  v225 = [MEMORY[0x263F08C98] milliseconds];
  v226 = (void *)[v224 initWithDoubleValue:v225 unit:2000.0];
  id v227 = objc_alloc(MEMORY[0x263F08980]);
  v228 = [MEMORY[0x263F08C98] milliseconds];
  v229 = (void *)[v227 initWithDoubleValue:v228 unit:2010.0];
  v291 = (void *)[v223 initWithBucketStart:v226 bucketEnd:v229 bucketCount:60];

  id v230 = objc_alloc(MEMORY[0x263F13518]);
  id v231 = objc_alloc(MEMORY[0x263F08980]);
  v232 = [MEMORY[0x263F08C98] milliseconds];
  v233 = (void *)[v231 initWithDoubleValue:v232 unit:3000.0];
  id v234 = objc_alloc(MEMORY[0x263F08980]);
  v235 = [MEMORY[0x263F08C98] milliseconds];
  v236 = (void *)[v234 initWithDoubleValue:v235 unit:3010.0];
  v289 = (void *)[v230 initWithBucketStart:v233 bucketEnd:v236 bucketCount:30];

  id v237 = objc_alloc(MEMORY[0x263F13518]);
  id v238 = objc_alloc(MEMORY[0x263F08980]);
  v239 = [MEMORY[0x263F08C98] milliseconds];
  v240 = (void *)[v238 initWithDoubleValue:v239 unit:200.0];
  id v241 = objc_alloc(MEMORY[0x263F08980]);
  v242 = [MEMORY[0x263F08C98] milliseconds];
  v243 = (void *)[v241 initWithDoubleValue:v242 unit:210.0];
  v293 = (void *)[v237 initWithBucketStart:v240 bucketEnd:v243 bucketCount:60];

  id v244 = objc_alloc(MEMORY[0x263F13518]);
  id v245 = objc_alloc(MEMORY[0x263F08980]);
  v246 = [MEMORY[0x263F08C98] milliseconds];
  v247 = (void *)[v245 initWithDoubleValue:v246 unit:300.0];
  id v248 = objc_alloc(MEMORY[0x263F08980]);
  v249 = [MEMORY[0x263F08C98] milliseconds];
  v250 = (void *)[v248 initWithDoubleValue:v249 unit:310.0];
  v288 = (void *)[v244 initWithBucketStart:v247 bucketEnd:v250 bucketCount:70];

  id v251 = objc_alloc(MEMORY[0x263F13518]);
  id v252 = objc_alloc(MEMORY[0x263F08980]);
  v253 = [MEMORY[0x263F08C98] milliseconds];
  v254 = (void *)[v252 initWithDoubleValue:v253 unit:500.0];
  id v255 = objc_alloc(MEMORY[0x263F08980]);
  v256 = [MEMORY[0x263F08C98] milliseconds];
  v257 = (void *)[v255 initWithDoubleValue:v256 unit:510.0];
  v267 = (void *)[v251 initWithBucketStart:v254 bucketEnd:v257 bucketCount:80];

  id v258 = objc_alloc(MEMORY[0x263F13480]);
  v319[0] = v295;
  v319[1] = v291;
  v319[2] = v289;
  v259 = [MEMORY[0x263EFF8C0] arrayWithObjects:v319 count:3];
  v318[0] = v293;
  v318[1] = v288;
  v318[2] = v267;
  v260 = [MEMORY[0x263EFF8C0] arrayWithObjects:v318 count:3];
  v317[0] = v295;
  v317[1] = v291;
  v317[2] = v289;
  v261 = [MEMORY[0x263EFF8C0] arrayWithObjects:v317 count:3];
  v316[0] = v295;
  v316[1] = v291;
  v316[2] = v289;
  v262 = [MEMORY[0x263EFF8C0] arrayWithObjects:v316 count:3];
  v263 = (void *)[v258 initWithLaunchTimeData:v259 withResumeTimeData:v260 withActivationTimeData:v261 withExtendedLaunchTimeData:v262];

  v264 = (void *)[v283 initWithAppVersion:v312 withMutipleAppVersions:0 withTimeStampBegin:v314 withTimeStampEnd:v313];
  [v264 setMetaData:v311];
  [v264 setCpuMetrics:v310];
  [v264 setGpuMetrics:v309];
  [v264 setCellularConditionMetrics:v308];
  [v264 setApplicationTimeMetrics:v307];
  [v264 setLocationActivityMetrics:v306];
  [v264 setNetworkTransferMetrics:v304];
  [v264 setApplicationLaunchMetrics:v263];
  [v264 setApplicationResponsivenessMetrics:v302];
  [v264 setDiskIOMetrics:v276];
  [v264 setDisplayMetrics:v270];
  [v264 setAnimationMetrics:v269];
  [v264 setApplicationExitMetrics:v268];
  [v264 setMemoryMetrics:v275];
  v315[0] = v272;
  v315[1] = v271;
  v265 = [MEMORY[0x263EFF8C0] arrayWithObjects:v315 count:2];
  [v264 setSignpostMetrics:v265];

  return v264;
}

+ (id)buildDummyDiagnosticPayloadForClient:(id)a3 withDateString:(id)a4
{
  v95[5] = *MEMORY[0x263EF8340];
  v4 = (objc_class *)MEMORY[0x263F08790];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v82 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
  objc_msgSend(v6, "setLocale:");
  [v6 setDateFormat:@"yyyy-MM-dd HH:mm"];
  id v7 = [MEMORY[0x263EFFA18] localTimeZone];
  [v6 setTimeZone:v7];

  id v8 = [MEMORY[0x263EFF910] date];
  id v9 = [v6 stringFromDate:v8];
  id v81 = [v6 dateFromString:v9];

  uint64_t v10 = [MEMORY[0x263EFF910] date];
  v11 = [v6 stringFromDate:v10];
  long long v83 = v6;
  v80 = [v6 dateFromString:v11];

  id v12 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v5 allowPlaceholder:0 error:0];
  uint64_t v13 = [v12 shortVersionString];
  if (v13) {
    [v12 shortVersionString];
  }
  else {
  v79 = [v12 bundleVersion];
  }

  v77 = [v12 bundleVersion];
  id v14 = objc_alloc(MEMORY[0x263F13530]);
  [MEMORY[0x263F55748] regionFormat];
  id v15 = v78 = v12;
  id v16 = [MEMORY[0x263F55748] osVersion];
  uint64_t v17 = [MEMORY[0x263F55748] modelIdentifier];
  uint64_t v18 = [MEMORY[0x263F55748] platformArchitecture];
  id v19 = (void *)[v14 initWithRegionFormat:v15 osVersion:v16 deviceType:v17 appBuildVersion:v77 platformArchitecture:v18];

  long long v87 = v19;
  [v19 setLowPowerModeEnabled:1];
  [v19 setIsTestFlightApp:0];
  [v19 setPid:123];
  id v20 = objc_alloc(MEMORY[0x263F08980]);
  v21 = [MEMORY[0x263F08C98] seconds];
  long long v86 = (void *)[v20 initWithDoubleValue:v21 unit:20.0];

  id v22 = objc_alloc(MEMORY[0x263F08980]);
  id v23 = [MEMORY[0x263F08CE0] bytes];
  id v88 = (void *)[v22 initWithDoubleValue:v23 unit:2000.0];

  id v24 = objc_alloc(MEMORY[0x263F134C8]);
  id v25 = objc_alloc(MEMORY[0x263EFF8C0]);
  id v26 = objc_alloc(MEMORY[0x263F134C0]);
  id v27 = objc_alloc(MEMORY[0x263EFF8C0]);
  id v28 = objc_alloc(MEMORY[0x263F134B8]);
  uint64_t v29 = [MEMORY[0x263F08C38] UUID];
  id v30 = [NSNumber numberWithLongLong:74565];
  id v31 = objc_alloc_init(MEMORY[0x263EFF8C0]);
  long long v32 = (void *)[v28 initWithBinaryName:@"testBinaryName" binaryUUID:v29 address:v30 binaryOffset:&unk_26DF1F800 sampleCount:&unk_26DF1F818 withDepth:0 subFrameArray:v31];
  long long v33 = objc_msgSend(v27, "initWithObjects:", v32, 0);
  id v34 = (void *)[v26 initWithTopCallStackFrames:v33 isAttributedThread:1];
  long long v35 = (void *)[v25 initWithObjects:v34];
  id v85 = (void *)[v24 initWithThreadArray:v35 aggregatedByProcess:1];

  id v36 = objc_alloc(MEMORY[0x263F134C8]);
  id v37 = objc_alloc(MEMORY[0x263EFF8C0]);
  id v38 = objc_alloc(MEMORY[0x263F134C0]);
  id v39 = objc_alloc(MEMORY[0x263EFF8C0]);
  id v40 = objc_alloc(MEMORY[0x263F134B8]);
  id v41 = [MEMORY[0x263F08C38] UUID];
  __int16 v42 = [NSNumber numberWithLongLong:74565];
  id v43 = objc_alloc_init(MEMORY[0x263EFF8C0]);
  id v44 = (void *)[v40 initWithBinaryName:@"testBinaryName" binaryUUID:v41 address:v42 binaryOffset:&unk_26DF1F800 sampleCount:&unk_26DF1F818 withDepth:0 subFrameArray:v43];
  id v45 = objc_msgSend(v39, "initWithObjects:", v44, 0);
  uint64_t v46 = (void *)[v38 initWithTopCallStackFrames:v45 isAttributedThread:1];
  id v47 = (void *)[v37 initWithObjects:v46];
  uint64_t v48 = [v36 initWithThreadArray:v47 aggregatedByProcess:0];

  v49 = [MEMORY[0x263EFF910] date];
  LOBYTE(v64) = 0;
  id v75 = (void *)[objc_alloc(MEMORY[0x263F13558]) initWithSubSystem:@"testEventSubsystem" category:@"testEventCategory" name:@"testEventName" beginTimeStamp:v49 endTimeStamp:0 duration:0 isInterval:v64];
  id v50 = objc_alloc(MEMORY[0x263F13558]);
  v76 = v49;
  id v51 = [v49 addTimeInterval:-5.0];
  id v52 = objc_alloc(MEMORY[0x263F08980]);
  id v53 = [MEMORY[0x263F08C98] milliseconds];
  id v54 = (void *)[v52 initWithDoubleValue:v53 unit:5000.0];
  LOBYTE(v65) = 1;
  id v74 = (void *)[v50 initWithSubSystem:@"testIntervalSubsystem" category:@"testIntervalCategory" name:@"testIntervalName" beginTimeStamp:v51 endTimeStamp:v49 duration:v54 isInterval:v65];

  uint64_t v55 = [MEMORY[0x263EFF980] array];
  [v55 addObject:v75];
  [v55 addObject:v74];
  long long v84 = (void *)[objc_alloc(MEMORY[0x263F134A8]) initWithMetaData:v87 applicationVersion:v79 signpostData:v55 pid:123 callStack:v85 totalCpuTime:v86 totalSampledTime:v86];
  v71 = (void *)[objc_alloc(MEMORY[0x263F13510]) initWithMetaData:v87 applicationVersion:v79 signpostData:v55 pid:123 callStack:v48 hangDuration:v86];
  id v73 = (void *)v48;
  v70 = (void *)[objc_alloc(MEMORY[0x263F13478]) initWithMetaData:v87 applicationVersion:v79 signpostData:v55 pid:123 callStack:v48 launchDuration:v86];
  id v72 = (void *)[objc_alloc(MEMORY[0x263F134F0]) initWithMetaData:v87 applicationVersion:v79 signpostData:v55 pid:123 totalWritesCaused:v88 stackTrace:v85];
  id v66 = (void *)[objc_alloc(MEMORY[0x263F134D8]) initWithMetaData:v87, v79, v55, 123, @"Namespace SIGNAL, Code 0xb", &unk_26DF1F7E8, @"0 is not in any region.  Bytes before following region: 4000000000 REGION TYPE                      START - END             [ VSIZE] PRT/MAX SHRMOD  REGION DETAIL UNUSED SPACE AT START ---> __TEXT                 0000000000000000-0000000000000000 [   32K] r-x/r-x SM=COW  ...pp/Test", &unk_26DF1F830, &unk_26DF1F848, &unk_26DF1F860, v48 applicationVersion signpostData pid terminationReason applicationSpecificInfo virtualMemoryRegionInfo exceptionType exceptionCode signal stackTrace];
  id v68 = objc_alloc(MEMORY[0x263F134E0]);
  uint64_t v56 = [MEMORY[0x263EFF910] now];
  id v67 = [MEMORY[0x263EFF910] now];
  long long v93 = v72;
  v94[0] = @"diskWriteExceptionDiagnostics";
  id v57 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v93 count:1];
  v95[0] = v57;
  v94[1] = @"hangDiagnostics";
  long long v92 = v71;
  v58 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v92 count:1];
  v95[1] = v58;
  v94[2] = @"appLaunchDiagnostics";
  id v91 = v70;
  v59 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v91 count:1];
  v95[2] = v59;
  v94[3] = @"cpuExceptionDiagnostics";
  long long v90 = v84;
  id v60 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v90 count:1];
  v95[3] = v60;
  v94[4] = @"crashDiagnostics";
  long long v89 = v66;
  v61 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v89 count:1];
  v95[4] = v61;
  id v62 = [NSDictionary dictionaryWithObjects:v95 forKeys:v94 count:5];
  id v69 = (id)[v68 initWithTimeStampBegin:v56 withTimeStampEnd:v67 withDiagnostics:v62];

  return v69;
}

+ (void)buildDiagnosticPayloadForClient:fromClientDiagnosticsDictionary:withDateString:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_1();
  _os_log_error_impl(&dword_22BB49000, v0, OS_LOG_TYPE_ERROR, "No diagnostic service payloads found for client: %@ date: %@", v1, 0x16u);
}

+ (void)buildDiagnosticPayloadForClient:fromClientDiagnosticsDictionary:withDateString:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_22BB49000, v0, v1, "Construction Step: Finalize diagnostic payload", v2, v3, v4, v5, v6);
}

+ (void)buildDiagnosticPayloadForClient:fromClientDiagnosticsDictionary:withDateString:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_22BB49000, v0, v1, "Construction Step: Dictionary of Array of Diagnostics", v2, v3, v4, v5, v6);
}

+ (void)buildDiagnosticPayloadForClient:fromClientDiagnosticsDictionary:withDateString:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_22BB49000, v0, v1, "Construction Step: ReportCrash Data", v2, v3, v4, v5, v6);
}

+ (void)buildDiagnosticPayloadForClient:fromClientDiagnosticsDictionary:withDateString:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_22BB49000, v0, v1, "Construction Step: HangTracer Data", v2, v3, v4, v5, v6);
}

+ (void)buildDiagnosticPayloadForClient:fromClientDiagnosticsDictionary:withDateString:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_22BB49000, v0, v1, "Construction Step: SpinTracer Data", v2, v3, v4, v5, v6);
}

+ (void)buildDiagnosticPayloadForClient:fromClientDiagnosticsDictionary:withDateString:.cold.7()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_1();
  _os_log_debug_impl(&dword_22BB49000, v0, OS_LOG_TYPE_DEBUG, "Construction Step: Date Data: %@, %@", v1, 0x16u);
}

+ (void)buildDiagnosticPayloadForClient:fromClientDiagnosticsDictionary:withDateString:.cold.8()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_22BB49000, v0, v1, "Construction Step: Date Data: %@", v2, v3, v4, v5, v6);
}

+ (void)buildPayloadForClient:fromClientMetricsDictionary:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_22BB49000, v0, OS_LOG_TYPE_ERROR, "Required service payloads not found.", v1, 2u);
}

+ (void)buildPayloadForClient:(void *)a1 fromClientMetricsDictionary:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 allValues];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_22BB49000, a2, OS_LOG_TYPE_DEBUG, "Payload Construction complete: %@", v4, 0xCu);
}

+ (void)constructPayloadWithServiceString:withSourceData:withDateString:forClient:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_22BB49000, v0, OS_LOG_TYPE_ERROR, "Failed to retrieve powerlog data.", v1, 2u);
}

+ (void)constructPayloadWithServiceString:withSourceData:withDateString:forClient:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_22BB49000, v0, v1, "Construction Step: Powerlog Data: %@", v2, v3, v4, v5, v6);
}

+ (void)constructPayloadWithServiceString:(os_log_t)log withSourceData:withDateString:forClient:.cold.3(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_22BB49000, log, OS_LOG_TYPE_ERROR, "Error in payload constructor: %@", buf, 0xCu);
}

+ (void)constructPayloadWithServiceString:(void *)a1 withSourceData:(void *)a2 withDateString:forClient:.cold.4(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 metaData];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_22BB49000, v3, OS_LOG_TYPE_DEBUG, "Payload Meta Data:%@", v5, 0xCu);
}

+ (void)constructPayloadWithServiceString:withSourceData:withDateString:forClient:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_22BB49000, v0, v1, "Meta Data V2: %@", v2, v3, v4, v5, v6);
}

+ (void)constructPayloadWithServiceString:withSourceData:withDateString:forClient:.cold.6()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_22BB49000, v0, v1, "Meta Data V1: %@", v2, v3, v4, v5, v6);
}

+ (void)constructPayloadWithServiceString:withSourceData:withDateString:forClient:.cold.7()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_22BB49000, v0, v1, "Construction Step: Meta Data", v2, v3, v4, v5, v6);
}

+ (void)constructPayloadWithServiceString:(void *)a1 withSourceData:(NSObject *)a2 withDateString:forClient:.cold.8(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a1 beginDate];
  uint64_t v5 = [a1 endDate];
  int v6 = 138412546;
  id v7 = v4;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_debug_impl(&dword_22BB49000, a2, OS_LOG_TYPE_DEBUG, "Construction Step: Date Data: %@, %@", (uint8_t *)&v6, 0x16u);
}

+ (void)constructPayloadWithServiceString:withSourceData:withDateString:forClient:.cold.9()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_22BB49000, v0, v1, "Bundle Version: %@", v2, v3, v4, v5, v6);
}

+ (void)constructPayloadWithServiceString:withSourceData:withDateString:forClient:.cold.10()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_22BB49000, v0, v1, "Latest App Version: %@", v2, v3, v4, v5, v6);
}

+ (void)constructPayloadWithServiceString:withSourceData:withDateString:forClient:.cold.11()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_22BB49000, v0, v1, "Construction Step: Powerlog Data", v2, v3, v4, v5, v6);
}

+ (void)constructPayloadWithServiceString:(uint64_t)a1 withSourceData:(NSObject *)a2 withDateString:forClient:.cold.12(uint64_t a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v4 = [&unk_26DF1F7D0 objectAtIndexedSubscript:2];
  int v5 = 138412546;
  uint8_t v6 = v4;
  __int16 v7 = 2112;
  uint64_t v8 = a1;
  _os_log_error_impl(&dword_22BB49000, a2, OS_LOG_TYPE_ERROR, "Compatible service string not found. Expected: %@, Received: %@", (uint8_t *)&v5, 0x16u);
}

@end