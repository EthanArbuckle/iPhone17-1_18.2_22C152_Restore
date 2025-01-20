@interface TAFilterKnownDevices
+ (id)removeAndProcessBackgroundDetections:(id)a3 deviceRecord:(id)a4;
+ (id)removeDuplicateSuspiciousDevices:(id)a3;
+ (id)removeIssuedDevices:(id)a3 deviceRecord:(id)a4;
+ (id)removeKnownSuspiciousDevices:(id)a3 deviceRecord:(id)a4;
+ (id)removeMetricsFromKnownDevices:(id)a3 deviceRecord:(id)a4;
@end

@implementation TAFilterKnownDevices

+ (id)removeMetricsFromKnownDevices:(id)a3 deviceRecord:(id)a4
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  v8 = (void *)MEMORY[0x263EFFA68];
  if (v5 && v6)
  {
    v43 = [MEMORY[0x263EFF980] array];
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v40 = v5;
    obuint64_t j = v5;
    uint64_t v44 = [obj countByEnumeratingWithState:&v56 objects:v66 count:16];
    if (!v44) {
      goto LABEL_38;
    }
    uint64_t v42 = *(void *)v57;
    while (1)
    {
      for (uint64_t i = 0; i != v44; ++i)
      {
        if (*(void *)v57 != v42) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "key", v40);
        int v12 = [v11 isEqualToString:@"DonatingInterVisitMetrics"];

        if (v12)
        {
          v45 = v10;
          uint64_t v47 = i;
          v13 = [v10 additionalInformation];
          v14 = (void *)[v13 mutableCopy];

          long long v54 = 0u;
          long long v55 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          v15 = [v14 allKeys];
          uint64_t v16 = [v15 countByEnumeratingWithState:&v52 objects:v65 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v53;
            do
            {
              for (uint64_t j = 0; j != v17; ++j)
              {
                if (*(void *)v53 != v18) {
                  objc_enumerationMutation(v15);
                }
                v20 = *(void **)(*((void *)&v52 + 1) + 8 * j);
                if ([v7 isKnownDevice:v20])
                {
                  v21 = (void *)TAStatusLog;
                  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG)) {
                    +[TAFilterKnownDevices removeMetricsFromKnownDevices:v20 deviceRecord:&v64];
                  }
                  [v14 removeObjectForKey:v20];
                }
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v52 objects:v65 count:16];
            }
            while (v17);
          }

          v22 = [TAOutgoingRequests alloc];
          v23 = [v45 date];
          v24 = [(TAOutgoingRequests *)v22 initWithRequestKey:@"DonatingInterVisitMetrics" additionalInformation:v14 date:v23];

          [v43 addObject:v24];
LABEL_34:
          uint64_t i = v47;
          continue;
        }
        v25 = [v10 key];
        int v26 = [v25 isEqualToString:@"DonatingVisitMetrics"];

        if (v26)
        {
          v46 = v10;
          uint64_t v47 = i;
          v27 = [v10 additionalInformation];
          v28 = (void *)[v27 mutableCopy];

          long long v50 = 0u;
          long long v51 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          v29 = [v28 allKeys];
          uint64_t v30 = [v29 countByEnumeratingWithState:&v48 objects:v62 count:16];
          if (v30)
          {
            uint64_t v31 = v30;
            uint64_t v32 = *(void *)v49;
            do
            {
              for (uint64_t k = 0; k != v31; ++k)
              {
                if (*(void *)v49 != v32) {
                  objc_enumerationMutation(v29);
                }
                v34 = *(void **)(*((void *)&v48 + 1) + 8 * k);
                if ([v7 isKnownDevice:v34])
                {
                  v35 = (void *)TAStatusLog;
                  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG)) {
                    +[TAFilterKnownDevices removeMetricsFromKnownDevices:v34 deviceRecord:&v61];
                  }
                  [v28 removeObjectForKey:v34];
                }
              }
              uint64_t v31 = [v29 countByEnumeratingWithState:&v48 objects:v62 count:16];
            }
            while (v31);
          }

          v36 = [TAOutgoingRequests alloc];
          v37 = [v46 date];
          v38 = [(TAOutgoingRequests *)v36 initWithRequestKey:@"DonatingVisitMetrics" additionalInformation:v28 date:v37];

          [v43 addObject:v38];
          goto LABEL_34;
        }
        [v43 addObject:v10];
      }
      uint64_t v44 = [obj countByEnumeratingWithState:&v56 objects:v66 count:16];
      if (!v44)
      {
LABEL_38:

        v8 = (void *)[v43 copy];
        id v5 = v40;
        break;
      }
    }
  }

  return v8;
}

+ (id)removeDuplicateSuspiciousDevices:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    v4 = [MEMORY[0x263EFF9A0] dictionary];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v23 = v3;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v34 count:16];
    if (!v6) {
      goto LABEL_21;
    }
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    while (1)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (v10)
        {
          if (![*(id *)(*((void *)&v24 + 1) + 8 * i) immediacyType])
          {
            uint64_t v15 = TAStatusLog;
            if (!os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR)) {
              continue;
            }
            *(_DWORD *)buf = 68289283;
            int v29 = 0;
            __int16 v30 = 2082;
            uint64_t v31 = "";
            __int16 v32 = 2113;
            v33 = v10;
            int v12 = v15;
            os_log_type_t v13 = OS_LOG_TYPE_ERROR;
            v14 = "{\"msg%{public}.0s\":\"#TAFilterKnownDevices got TANotificationImmediacyTypeNever device\", \"detectio"
                  "n\":\"%{private}@\"}";
            goto LABEL_14;
          }
          if ([v10 immediacyType] == 3)
          {
            uint64_t v11 = TAStatusLog;
            if (!os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT)) {
              continue;
            }
            *(_DWORD *)buf = 68289283;
            int v29 = 0;
            __int16 v30 = 2082;
            uint64_t v31 = "";
            __int16 v32 = 2113;
            v33 = v10;
            int v12 = v11;
            os_log_type_t v13 = OS_LOG_TYPE_FAULT;
            v14 = "{\"msg%{public}.0s\":\"#TAFilterKnownDevices got background immediate type. This is unexpected\", \"de"
                  "tection\":\"%{private}@\"}";
LABEL_14:
            _os_log_impl(&dword_22345C000, v12, v13, v14, buf, 0x1Cu);
            continue;
          }
          uint64_t v16 = [v10 address];
          uint64_t v17 = [v4 objectForKey:v16];

          if (!v17 || (unint64_t v18 = [v17 immediacyType], objc_msgSend(v10, "immediacyType") > v18))
          {
            v19 = [v10 address];
            [v4 setObject:v10 forKey:v19];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v34 count:16];
      if (!v7)
      {
LABEL_21:

        v20 = [v4 allValues];
        v21 = (void *)[v20 copy];

        id v3 = v23;
        goto LABEL_23;
      }
    }
  }
  v21 = (void *)MEMORY[0x263EFFA68];
LABEL_23:

  return v21;
}

+ (id)removeKnownSuspiciousDevices:(id)a3 deviceRecord:(id)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  uint64_t v8 = (void *)MEMORY[0x263EFFA68];
  if (v5 && v6)
  {
    uint64_t v31 = [MEMORY[0x263EFF980] array];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v30 = v5;
    obuint64_t j = v5;
    uint64_t v9 = [obj countByEnumeratingWithState:&v36 objects:v50 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v37;
      uint64_t v32 = *(void *)v37;
      do
      {
        uint64_t v12 = 0;
        uint64_t v33 = v10;
        do
        {
          if (*(void *)v37 != v11) {
            objc_enumerationMutation(obj);
          }
          os_log_type_t v13 = *(void **)(*((void *)&v36 + 1) + 8 * v12);
          if (v13)
          {
            v14 = [*(id *)(*((void *)&v36 + 1) + 8 * v12) address];
            int v15 = [v7 isKnownDevice:v14];

            uint64_t v16 = [v13 address];
            uint64_t v17 = [v7 getDeviceNotificationState:v16];

            if ([v13 immediacyType] == 2)
            {
              unint64_t v18 = [v13 address];
              int v35 = [v7 hasStagedImmediateDetections:v18] ^ 1;
            }
            else
            {
              int v35 = 0;
            }
            v19 = (void *)TAStatusLog;
            if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
            {
              v20 = v19;
              v21 = [v13 address];
              *(_DWORD *)buf = 68290563;
              *(_DWORD *)v41 = 0;
              *(_WORD *)&v41[4] = 2082;
              *(void *)&v41[6] = "";
              *(_WORD *)&v41[14] = 2113;
              *(void *)&v41[16] = v21;
              *(_WORD *)&v41[24] = 1026;
              *(_DWORD *)&v41[26] = v15;
              __int16 v42 = 1026;
              BOOL v43 = v17 == 0;
              __int16 v44 = 1026;
              BOOL v45 = v17 == 4;
              __int16 v46 = 1026;
              BOOL v47 = v17 == 3;
              uint64_t v11 = v32;
              uint64_t v10 = v33;
              __int16 v48 = 1026;
              int v49 = v35;
              _os_log_impl(&dword_22345C000, v20, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#TAFilterKnownDevices decisions\", \"address\":\"%{private}@\", \"isKnownDevice\":%{public}hhd, \"isUnknownState\":%{public}hhd, \"isPendingReprompt\":%{public}hhd, \"isStaged\":%{public}hhd, \"isFirstImmediateType\":%{public}hhd}", buf, 0x3Au);
            }
            if ((v15 & 1) == 0 && ((v17 | 4) == 4 || (v17 == 3 ? (int v28 = v35) : (int v28 = 0), v28 == 1)))
            {
              [v31 addObject:v13];
            }
            else
            {
              v22 = (void *)TAStatusLog;
              if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
              {
                id v23 = v22;
                long long v24 = [v13 address];
                long long v25 = [v24 hexString];
                if (v15) {
                  long long v26 = "known device";
                }
                else {
                  long long v26 = "unknown device";
                }
                long long v27 = +[TADeviceRecord notificationInternalStateToString:v17];
                *(_DWORD *)buf = 138478339;
                *(void *)v41 = v25;
                *(_WORD *)&v41[8] = 2082;
                *(void *)&v41[10] = v26;
                *(_WORD *)&v41[18] = 2114;
                *(void *)&v41[20] = v27;
                _os_log_debug_impl(&dword_22345C000, v23, OS_LOG_TYPE_DEBUG, "#TAFilterKnownDevices not surfacing notification for %{private}@ due to %{public}s and device state %{public}@", buf, 0x20u);
              }
            }
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [obj countByEnumeratingWithState:&v36 objects:v50 count:16];
      }
      while (v10);
    }

    uint64_t v8 = (void *)[v31 copy];
    id v5 = v30;
  }

  return v8;
}

+ (id)removeIssuedDevices:(id)a3 deviceRecord:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  uint64_t v8 = (void *)MEMORY[0x263EFFA68];
  if (v5 && v6)
  {
    uint64_t v8 = [MEMORY[0x263EFF980] array];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v19 = v5;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v30 count:16];
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
          v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          int v15 = [v14 address];
          uint64_t v16 = [v7 getDeviceNotificationState:v15];

          if (v16 == 2)
          {
            uint64_t v17 = TAStatusLog;
            if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 68289283;
              int v25 = 0;
              __int16 v26 = 2082;
              long long v27 = "";
              __int16 v28 = 2113;
              int v29 = v14;
              _os_log_impl(&dword_22345C000, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TAFilterKnownDevices dropping detection due to Issued state\", \"detection\":\"%{private}@\"}", buf, 0x1Cu);
            }
          }
          else
          {
            [v8 addObject:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v30 count:16];
      }
      while (v11);
    }

    id v5 = v19;
  }

  return v8;
}

+ (id)removeAndProcessBackgroundDetections:(id)a3 deviceRecord:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  uint64_t v8 = (void *)MEMORY[0x263EFFA68];
  if (v5 && v6)
  {
    id v9 = [MEMORY[0x263EFF980] array];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v10 = v5;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          int v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v15, "immediacyType", (void)v17) == 3) {
            [v7 processBackgroundDetection:v15];
          }
          else {
            [v9 addObject:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }

    uint64_t v8 = (void *)[v9 copy];
  }

  return v8;
}

+ (void)removeMetricsFromKnownDevices:(void *)a3 deviceRecord:(void *)a4 .cold.1(_DWORD *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  uint64_t v8 = [a3 hexString];
  *a1 = 138477827;
  *a4 = v8;
  OUTLINED_FUNCTION_0(&dword_22345C000, v9, v10, "#TAFilterKnownDevices dropping %{private}@ intervisit metrics since it is from owner, shared, or ignored device");
}

+ (void)removeMetricsFromKnownDevices:(void *)a3 deviceRecord:(void *)a4 .cold.2(_DWORD *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  uint64_t v8 = [a3 hexString];
  *a1 = 138477827;
  *a4 = v8;
  OUTLINED_FUNCTION_0(&dword_22345C000, v9, v10, "#TATrackingAvoidanceService dropping %{private}@ intervisit metrics since it is from owner, shared, or ignored device");
}

@end