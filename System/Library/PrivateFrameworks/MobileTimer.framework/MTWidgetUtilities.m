@interface MTWidgetUtilities
+ (id)reloadAlarmWidgetTimeline;
+ (id)timeZoneFromCities:(id)a3;
+ (id)timeZonesForCurrentClockWidgets;
@end

@implementation MTWidgetUtilities

+ (id)timeZonesForCurrentClockWidgets
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2050000000;
  v3 = (void *)getCHSWidgetConfigurationReaderClass_softClass;
  uint64_t v16 = getCHSWidgetConfigurationReaderClass_softClass;
  if (!getCHSWidgetConfigurationReaderClass_softClass)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __getCHSWidgetConfigurationReaderClass_block_invoke;
    v12[3] = &unk_1E5914EC0;
    v12[4] = &v13;
    __getCHSWidgetConfigurationReaderClass_block_invoke((uint64_t)v12);
    v3 = (void *)v14[3];
  }
  v4 = v3;
  _Block_object_dispose(&v13, 8);
  id v5 = objc_alloc_init(v4);
  v6 = objc_opt_new();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__MTWidgetUtilities_timeZonesForCurrentClockWidgets__block_invoke;
  v9[3] = &unk_1E5914E78;
  id v11 = a1;
  id v7 = v6;
  id v10 = v7;
  [v5 allConfiguredWidgetsWithCompletion:v9];

  return v7;
}

void __52__MTWidgetUtilities_timeZonesForCurrentClockWidgets__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    id obj = v5;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    uint64_t v43 = [v5 countByEnumeratingWithState:&v51 objects:v60 count:16];
    v8 = 0;
    if (!v43) {
      goto LABEL_33;
    }
    uint64_t v42 = *(void *)v52;
    while (1)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v52 != v42) {
          objc_enumerationMutation(obj);
        }
        uint64_t v44 = v9;
        id v10 = [*(id *)(*((void *)&v51 + 1) + 8 * v9) widgetConfigurations];
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id v45 = v10;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v47 objects:v59 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v46 = *(void *)v48;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v48 != v46) {
                objc_enumerationMutation(v45);
              }
              v14 = *(void **)(*((void *)&v47 + 1) + 8 * i);
              uint64_t v15 = [v14 widget];
              uint64_t v16 = [v15 intent];

              if (v16)
              {
                uint64_t v17 = a1;
                v18 = [v14 widget];
                v19 = [v18 intent];
                v20 = [v19 _className];
                v21 = (objc_class *)objc_opt_class();
                v22 = NSStringFromClass(v21);
                int v23 = [v20 isEqualToString:v22];

                if (v23)
                {
                  v24 = MTLogForCategory(8);
                  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
                  {
                    a1 = v17;
                    uint64_t v25 = *(void *)(v17 + 40);
                    *(_DWORD *)buf = 138543362;
                    uint64_t v56 = v25;
                    v26 = v24;
                    v27 = "%{public}@ read widget intent ClocksIntent";
                    goto LABEL_22;
                  }
                  a1 = v17;
                  goto LABEL_24;
                }
                v28 = [v14 widget];
                v29 = [v28 intent];
                v30 = [v29 _className];
                v31 = (objc_class *)objc_opt_class();
                v32 = NSStringFromClass(v31);
                int v33 = [v30 isEqualToString:v32];

                if (v33)
                {
                  v24 = MTLogForCategory(8);
                  a1 = v17;
                  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
                  {
                    uint64_t v34 = *(void *)(v17 + 40);
                    *(_DWORD *)buf = 138543362;
                    uint64_t v56 = v34;
                    v26 = v24;
                    v27 = "%{public}@ read widget intent ClocksSingleIntent";
LABEL_22:
                    _os_log_impl(&dword_19CC95000, v26, OS_LOG_TYPE_INFO, v27, buf, 0xCu);
                  }
LABEL_24:

                  v35 = [v14 widget];
                  v36 = [v35 intent];
                  v37 = [v36 valueForKey:@"cities"];

                  uint64_t v38 = [*(id *)(a1 + 40) timeZoneFromCities:v37];

                  v8 = (void *)v38;
                }
                else
                {
                  a1 = v17;
                }
                v39 = MTLogForCategory(8);
                if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
                {
                  uint64_t v40 = *(void *)(a1 + 40);
                  *(_DWORD *)buf = 138543618;
                  uint64_t v56 = v40;
                  __int16 v57 = 2114;
                  v58 = v8;
                  _os_log_impl(&dword_19CC95000, v39, OS_LOG_TYPE_INFO, "%{public}@ read clock widget timezones: %{public}@", buf, 0x16u);
                }

                continue;
              }
            }
            uint64_t v12 = [v45 countByEnumeratingWithState:&v47 objects:v59 count:16];
          }
          while (v12);
        }

        uint64_t v9 = v44 + 1;
      }
      while (v44 + 1 != v43);
      uint64_t v43 = [obj countByEnumeratingWithState:&v51 objects:v60 count:16];
      if (!v43)
      {
LABEL_33:
        [*(id *)(a1 + 32) finishWithResult:v8];

        id v6 = 0;
        id v5 = obj;
        goto LABEL_34;
      }
    }
  }
  id v7 = MTLogForCategory(8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __52__MTWidgetUtilities_timeZonesForCurrentClockWidgets__block_invoke_cold_1(a1, (uint64_t)v6, v7);
  }

  [*(id *)(a1 + 32) finishWithError:v6];
LABEL_34:
}

+ (id)timeZoneFromCities:(id)a3
{
  return (id)objc_msgSend(a3, "na_map:", &__block_literal_global_2);
}

uint64_t __40__MTWidgetUtilities_timeZoneFromCities___block_invoke(uint64_t a1, void *a2)
{
  return [a2 timeZoneName];
}

+ (id)reloadAlarmWidgetTimeline
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = MTLogForCategory(3);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = a1;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = @"com.apple.mobiletimer.WorldClockWidget";
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ reloading widget timeline for %{bundleIdentifier}@", buf, 0x16u);
  }

  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2050000000;
  v4 = (void *)getCHSTimelineControllerClass_softClass;
  uint64_t v13 = getCHSTimelineControllerClass_softClass;
  if (!getCHSTimelineControllerClass_softClass)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getCHSTimelineControllerClass_block_invoke;
    uint64_t v15 = &unk_1E5914EC0;
    uint64_t v16 = &v10;
    __getCHSTimelineControllerClass_block_invoke((uint64_t)buf);
    v4 = (void *)v11[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v10, 8);
  id v6 = [v5 alloc];
  id v7 = objc_msgSend(v6, "initWithExtensionBundleIdentifier:kind:", @"com.apple.mobiletimer.WorldClockWidget", @"com.apple.mobiletimer.alarm", v10);
  v8 = [v7 reloadTimelineWithReason:@"alarm update"];

  return v8;
}

void __52__MTWidgetUtilities_timeZonesForCurrentClockWidgets__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_19CC95000, log, OS_LOG_TYPE_ERROR, "%{public}@ error reading into widgets config: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end