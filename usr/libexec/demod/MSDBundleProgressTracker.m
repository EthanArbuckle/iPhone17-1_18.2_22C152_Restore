@interface MSDBundleProgressTracker
+ (BOOL)isBundleInstance:(id)a3 identicalWithNewBundle:(id)a4;
+ (void)migratePreferencesFromFactoryDevicesIfNeeded;
+ (void)migratePreferencesFromLegacyDevicesIfNeeded;
+ (void)removeBundleFromPreferences:(id)a3;
- (BOOL)checkIfAllCriticalComponentsTried;
- (BOOL)getComponentProgressStatus:(id)a3;
- (BOOL)preInstalledContent;
- (NSArray)criticalComponents;
- (NSMutableDictionary)bundleInfo;
- (NSMutableDictionary)bundleTimerInfo;
- (NSMutableDictionary)componentsFromBundle;
- (NSMutableDictionary)contentProgress;
- (NSMutableDictionary)downloadedContentSource;
- (NSMutableDictionary)installedComponentList;
- (NSString)contentIdentifierString;
- (NSString)lastBundleUpdateDate;
- (double)getBundleUpdateTime;
- (id)getLastBundleUpdateDate;
- (id)initializeTrackerForBundle:(id)a3 withContentType:(unsigned __int8)a4;
- (id)retrieveLegacyContentnIdentifier:(unsigned __int8)a3;
- (id)retrieveObjectFromPreferences:(unsigned __int8)a3;
- (int64_t)componentsSuccessful;
- (int64_t)getAllComponentsForUpdate;
- (int64_t)percentageProgress;
- (int64_t)totalComponents;
- (unsigned)bundleState;
- (unsigned)bundleType;
- (void)addToBundleUpdateTime:(double)a3;
- (void)flushRecordsToPreferences;
- (void)markBundleInProgressAsCompleted;
- (void)renameBundleInPrgressToBundleInstalled;
- (void)retrieveAndPopulateBundleInfo:(id)a3;
- (void)setBundleInfo:(id)a3;
- (void)setBundleState:(unsigned __int8)a3;
- (void)setBundleStateAs:(unsigned __int8)a3;
- (void)setBundleTimerInfo:(id)a3;
- (void)setBundleType:(unsigned __int8)a3;
- (void)setComponentsFromBundle:(id)a3;
- (void)setComponentsSuccessful:(int64_t)a3;
- (void)setContentIdentifierString:(id)a3;
- (void)setContentProgress:(id)a3;
- (void)setCriticalComponents:(id)a3;
- (void)setDownloadedContentSource:(id)a3;
- (void)setInstalledComponentList:(id)a3;
- (void)setLastBundleUpdateDate:(id)a3;
- (void)setPercentageProgress:(int64_t)a3;
- (void)setPreInstalledContent:(BOOL)a3;
- (void)setTotalComponents:(int64_t)a3;
- (void)startBundleUpdateTimer;
- (void)stopBundleUpdateTimer;
- (void)updateComponentProgress:(id)a3 withResult:(BOOL)a4 withAdditionalInfo:(id)a5;
- (void)updateDownloadedContent:(unint64_t)a3 fromSource:(id)a4;
@end

@implementation MSDBundleProgressTracker

- (id)initializeTrackerForBundle:(id)a3 withContentType:(unsigned __int8)a4
{
  unsigned int v41 = a4;
  id v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  v44 = v5;
  v7 = [v5 installationOrder];
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  [(MSDBundleProgressTracker *)v6 setComponentsFromBundle:v8];

  v9 = [v44 criticalComponents];
  [(MSDBundleProgressTracker *)v6 setCriticalComponents:v9];

  v10 = sub_100068600();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [(MSDBundleProgressTracker *)v6 criticalComponents];
    *(_DWORD *)buf = 134217984;
    *(void *)v52 = [v11 count];
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "criticalComponents count:%ld", buf, 0xCu);
  }
  v12 = [(MSDBundleProgressTracker *)v6 criticalComponents];
  BOOL v13 = v12 == 0;

  if (v13) {
    [(MSDBundleProgressTracker *)v6 setCriticalComponents:v7];
  }
  v14 = sub_100068600();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = [(MSDBundleProgressTracker *)v6 criticalComponents];
    id v16 = [v15 count];
    *(_DWORD *)buf = 134217984;
    *(void *)v52 = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "installation order items are:%ld", buf, 0xCu);
  }
  v17 = [(MSDBundleProgressTracker *)v6 retrieveLegacyContentnIdentifier:v41];
  [(MSDBundleProgressTracker *)v6 setContentIdentifierString:v17];

  v18 = sub_100068600();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v52 = v41;
    *(_WORD *)&v52[4] = 2114;
    *(void *)&v52[6] = v44;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "initializing tracker:%d %{public}@", buf, 0x12u);
  }

  [(MSDBundleProgressTracker *)v6 retrieveAndPopulateBundleInfo:v44];
  v19 = [(MSDBundleProgressTracker *)v6 bundleInfo];
  v20 = [v19 objectForKey:@"ManifestVersion"];
  v45 = +[MSDSignedManifest appsPrefixForManifestVersion:v20];

  v21 = sub_100068600();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)v52 = "-[MSDBundleProgressTracker initializeTrackerForBundle:withContentType:]";
    *(_WORD *)&v52[8] = 2114;
    *(void *)&v52[10] = v45;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s - installationOrderAppsPrefix:  %{public}@", buf, 0x16u);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = v7;
  v22 = 0;
  id v23 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v23)
  {
    uint64_t v43 = *(void *)v47;
    do
    {
      v24 = 0;
      v25 = v22;
      do
      {
        if (*(void *)v47 != v43) {
          objc_enumerationMutation(obj);
        }
        id v26 = *(id *)(*((void *)&v46 + 1) + 8 * (void)v24);
        v27 = [(MSDBundleProgressTracker *)v6 criticalComponents];
        id v28 = [v27 containsObject:v26];

        if ([v26 hasPrefix:v45])
        {
          v29 = [v26 substringFromIndex:[v45 length]];

          uint64_t v30 = [v44 getComponentVersion:v29];
          goto LABEL_20;
        }
        if ([v44 isItemStandAlonePackage:v26])
        {
          v29 = [v26 substringFromIndex:[@"/Packages/" length]];

          uint64_t v30 = [v44 getStandAlonePackageVersion:v29];
LABEL_20:
          v31 = (__CFString *)v30;
          if (v30) {
            goto LABEL_24;
          }
          goto LABEL_23;
        }
        v29 = v26;
LABEL_23:
        v31 = @"1";
LABEL_24:
        v32 = [(MSDBundleProgressTracker *)v6 bundleInfo];
        v33 = [v32 objectForKey:@"ManifestVersion"];
        v22 = +[MSDSignedManifest getComponentFromPath:v29 forManifestVersion:v33];

        v34 = +[NSNumber numberWithBool:v28];
        v35 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:v31, @"Version", &__NSDictionary0__struct, @"DebugInfo", &off_100161F58, @"Status", v34, @"CriticalComponent", 0];

        v36 = [(MSDBundleProgressTracker *)v6 componentsFromBundle];
        [v36 setObject:v35 forKey:v22];

        v24 = (char *)v24 + 1;
        v25 = v22;
      }
      while (v23 != v24);
      id v23 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
    }
    while (v23);
  }

  [(MSDBundleProgressTracker *)v6 setPercentageProgress:0];
  id v37 = objc_alloc_init((Class)NSMutableDictionary);
  [(MSDBundleProgressTracker *)v6 setDownloadedContentSource:v37];

  [(MSDBundleProgressTracker *)v6 setBundleState:1];
  [(MSDBundleProgressTracker *)v6 setBundleType:v41];
  [(MSDBundleProgressTracker *)v6 addBundleSpecificCompoments:v41];
  v38 = [(MSDBundleProgressTracker *)v6 componentsFromBundle];
  -[MSDBundleProgressTracker setTotalComponents:](v6, "setTotalComponents:", [v38 count]);

  [(MSDBundleProgressTracker *)v6 setComponentsSuccessful:0];
  [(MSDBundleProgressTracker *)v6 setLastBundleUpdateDate:@"<unknown>"];
  v39 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:@"startTime", &off_100161F70, @"totalTimeTaken", 0];
  [(MSDBundleProgressTracker *)v6 setBundleTimerInfo:v39];

  [(MSDBundleProgressTracker *)v6 flushRecordsToPreferences];
  objc_sync_exit(v6);

  return v6;
}

- (id)retrieveObjectFromPreferences:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v4 = self;
  objc_sync_enter(v4);
  id v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v32 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "loadFromPreferences called:%d", buf, 8u);
  }

  [(MSDBundleProgressTracker *)v4 setPreInstalledContent:0];
  v6 = [(MSDBundleProgressTracker *)v4 retrieveLegacyContentnIdentifier:v3];
  [(MSDBundleProgressTracker *)v4 setContentIdentifierString:v6];

  v7 = +[MSDPreferencesFile sharedInstance];
  id v8 = [(MSDBundleProgressTracker *)v4 contentIdentifierString];
  v9 = [v7 objectForKey:v8];

  if (v9)
  {
    v10 = [v9 objectForKey:@"ContentStatus"];
    -[MSDBundleProgressTracker setBundleState:](v4, "setBundleState:", [v10 integerValue]);

    v11 = [v9 objectForKey:@"ComponentInfo"];
    [(MSDBundleProgressTracker *)v4 setComponentsFromBundle:v11];

    v12 = [v9 objectForKey:@"BundleInfo"];
    [(MSDBundleProgressTracker *)v4 setBundleInfo:v12];

    BOOL v13 = [v9 objectForKey:@"BundleTimerInfo"];

    if (v13) {
      [v9 objectForKey:@"BundleTimerInfo"];
    }
    else {
    v14 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:@"startTime", &off_100161F70, @"totalTimeTaken", 0];
    }
    [(MSDBundleProgressTracker *)v4 setBundleTimerInfo:v14];

    id v16 = [v9 objectForKey:@"PreInstalledContent"];
    -[MSDBundleProgressTracker setPreInstalledContent:](v4, "setPreInstalledContent:", [v16 BOOLValue]);

    v17 = [v9 objectForKey:@"ContentSource"];
    id v18 = [v17 mutableCopy];
    [(MSDBundleProgressTracker *)v4 setDownloadedContentSource:v18];

    v19 = [v9 objectForKey:@"TotalComponents"];
    -[MSDBundleProgressTracker setTotalComponents:](v4, "setTotalComponents:", [v19 integerValue]);

    v20 = [v9 objectForKey:@"SuccessfulComponents"];
    -[MSDBundleProgressTracker setComponentsSuccessful:](v4, "setComponentsSuccessful:", [v20 integerValue]);

    if ([(MSDBundleProgressTracker *)v4 totalComponents])
    {
      int64_t v21 = [(MSDBundleProgressTracker *)v4 componentsSuccessful];
      uint64_t v22 = 100 * v21 / [(MSDBundleProgressTracker *)v4 totalComponents];
    }
    else
    {
      uint64_t v22 = 100;
    }
    [(MSDBundleProgressTracker *)v4 setPercentageProgress:v22];
    [(MSDBundleProgressTracker *)v4 setBundleType:v3];
    id v23 = [v9 objectForKey:@"LastBundleUpdateDate"];
    [(MSDBundleProgressTracker *)v4 setLastBundleUpdateDate:v23];

    v24 = [(MSDBundleProgressTracker *)v4 lastBundleUpdateDate];
    LODWORD(v23) = v24 == 0;

    if (v23) {
      [(MSDBundleProgressTracker *)v4 setLastBundleUpdateDate:@"<unknown>"];
    }
    v25 = [(MSDBundleProgressTracker *)v4 bundleInfo];
    id v26 = [v25 objectForKey:@"PreInstalledContent"];

    if (v26)
    {
      v27 = [(MSDBundleProgressTracker *)v4 bundleInfo];
      id v28 = [v27 objectForKey:@"PreInstalledContent"];
      -[MSDBundleProgressTracker setPreInstalledContent:](v4, "setPreInstalledContent:", [v28 BOOLValue]);

      v29 = [(MSDBundleProgressTracker *)v4 bundleInfo];
      [v29 removeObjectForKey:@"PreInstalledContent"];

      [(MSDBundleProgressTracker *)v4 flushRecordsToPreferences];
    }
    v15 = v4;
  }
  else
  {
    v15 = 0;
  }

  objc_sync_exit(v4);

  return v15;
}

- (void)updateComponentProgress:(id)a3 withResult:(BOOL)a4 withAdditionalInfo:(id)a5
{
  BOOL v6 = a4;
  id v37 = a3;
  id v38 = a5;
  id v8 = self;
  objc_sync_enter(v8);
  v42 = v8;
  v9 = [(MSDBundleProgressTracker *)v8 bundleInfo];

  if (v9)
  {
    v10 = [(MSDBundleProgressTracker *)v42 bundleInfo];
    uint64_t v11 = [v10 objectForKey:@"ManifestVersion"];

    v36 = (void *)v11;
    if (v11)
    {
      v39 = +[MSDSignedManifest getComponentFromPath:v37 forManifestVersion:v11];
      v12 = [(MSDBundleProgressTracker *)v42 componentsFromBundle];
      BOOL v13 = [v12 objectForKey:v39];
      id v40 = [v13 mutableCopy];

      v14 = sub_100068600();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        long long v49 = v39;
        __int16 v50 = 1026;
        BOOL v51 = v6;
        __int16 v52 = 2114;
        id v53 = v38;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Updating component record:%{public}@ result:%{public, BOOL}d info:%{public}@", buf, 0x1Cu);
      }

      if (v40)
      {
        if (v6) {
          uint64_t v15 = 2;
        }
        else {
          uint64_t v15 = 1;
        }
        id v16 = +[NSNumber numberWithUnsignedInteger:v15];
        [v40 setObject:v16 forKey:@"Status"];

        [v40 setObject:v38 forKey:@"DebugInfo"];
        v17 = [(MSDBundleProgressTracker *)v42 componentsFromBundle];
        [v17 setObject:v40 forKey:v39];
      }
      id v18 = +[MSDTargetDevice sharedInstance];
      unsigned int v19 = [v18 criticalUpdatePrioritized];

      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      v20 = [(MSDBundleProgressTracker *)v42 componentsFromBundle];
      uint64_t v21 = 0;
      uint64_t v22 = 0;
      id v23 = [v20 countByEnumeratingWithState:&v43 objects:v47 count:16];
      if (v23)
      {
        uint64_t v24 = *(void *)v44;
        id obj = v20;
        do
        {
          for (i = 0; i != v23; i = (char *)i + 1)
          {
            if (*(void *)v44 != v24) {
              objc_enumerationMutation(obj);
            }
            uint64_t v26 = *(void *)(*((void *)&v43 + 1) + 8 * i);
            v27 = [(MSDBundleProgressTracker *)v42 componentsFromBundle];
            id v28 = [v27 objectForKey:v26];

            v29 = [v28 objectForKey:@"Status"];
            LODWORD(v27) = [v29 intValue];

            uint64_t v30 = [v28 objectForKey:@"CriticalComponent"];
            unsigned int v31 = [v30 BOOLValue];

            if (v27 == 2) {
              ++v21;
            }
            if (v31) {
              uint64_t v32 = v22 + 1;
            }
            else {
              uint64_t v32 = v22;
            }
            if (v19) {
              uint64_t v22 = v32;
            }
            else {
              ++v22;
            }
          }
          v20 = obj;
          id v23 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
        }
        while (v23);
      }

      [(MSDBundleProgressTracker *)v42 setComponentsSuccessful:v21];
      if (v22) {
        uint64_t v33 = 100 * [(MSDBundleProgressTracker *)v42 componentsSuccessful] / v22;
      }
      else {
        uint64_t v33 = 100;
      }
      [(MSDBundleProgressTracker *)v42 setPercentageProgress:v33];
      [(MSDBundleProgressTracker *)v42 flushRecordsToPreferences];
    }
    else
    {
      v35 = sub_100068600();
      v39 = v35;
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        sub_1000C9C48(v35);
      }
    }
  }
  else
  {
    v34 = sub_100068600();
    v36 = v34;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_1000C9BC4(v34);
    }
  }

  objc_sync_exit(v42);
}

- (void)updateDownloadedContent:(unint64_t)a3 fromSource:(id)a4
{
  id v13 = a4;
  BOOL v6 = self;
  objc_sync_enter(v6);
  v7 = [(MSDBundleProgressTracker *)v6 downloadedContentSource];
  id v8 = [v7 objectForKey:v13];

  if (v8)
  {
    v9 = [(MSDBundleProgressTracker *)v6 downloadedContentSource];
    v10 = [v9 objectForKey:v13];
    id v8 = (char *)[v10 longLongValue];
  }
  uint64_t v11 = [(MSDBundleProgressTracker *)v6 downloadedContentSource];
  v12 = +[NSNumber numberWithLongLong:&v8[a3]];
  [v11 setObject:v12 forKey:v13];

  [(MSDBundleProgressTracker *)v6 flushRecordsToPreferences];
  objc_sync_exit(v6);
}

- (void)markBundleInProgressAsCompleted
{
  id obj = self;
  objc_sync_enter(obj);
  if ([(MSDBundleProgressTracker *)obj bundleState] == 1)
  {
    id v2 = [(MSDBundleProgressTracker *)obj totalComponents];
    if (v2 == (id)[(MSDBundleProgressTracker *)obj componentsSuccessful])
    {
      unsigned __int8 v3 = 3;
    }
    else
    {
      v4 = +[MSDTargetDevice sharedInstance];
      unsigned int v5 = [v4 criticalUpdatePrioritized];

      if (v5)
      {
        if ([(MSDBundleProgressTracker *)obj checkIfAllCriticalComponentsTried]) {
          unsigned __int8 v3 = 5;
        }
        else {
          unsigned __int8 v3 = 6;
        }
      }
      else
      {
        unsigned __int8 v3 = 4;
      }
    }
    [(MSDBundleProgressTracker *)obj setBundleState:v3];
    id v6 = objc_alloc_init((Class)NSDateFormatter);
    [v6 setDateFormat:@"yyyyMMdd"];
    v7 = +[NSDate date];
    id v8 = [v6 stringFromDate:v7];

    [(MSDBundleProgressTracker *)obj setLastBundleUpdateDate:v8];
  }
  [(MSDBundleProgressTracker *)obj flushRecordsToPreferences];
  objc_sync_exit(obj);
}

- (void)renameBundleInPrgressToBundleInstalled
{
  id obj = self;
  objc_sync_enter(obj);
  id v2 = [(MSDBundleProgressTracker *)obj contentIdentifierString];
  unsigned int v3 = [v2 isEqualToString:@"Content.Installing"];

  if (v3)
  {
    [(MSDBundleProgressTracker *)obj setContentIdentifierString:@"Content.Existing"];
    [(MSDBundleProgressTracker *)obj setBundleType:0];
    v4 = +[MSDTargetDevice sharedInstance];
    [v4 setCriticalUpdatePrioritized:0];

    [(MSDBundleProgressTracker *)obj flushRecordsToPreferences];
    unsigned int v5 = +[MSDPreferencesFile sharedInstance];
    [v5 removeObjectForKey:@"Content.Installing"];
  }
  objc_sync_exit(obj);
}

- (void)setBundleStateAs:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id obj = self;
  objc_sync_enter(obj);
  [(MSDBundleProgressTracker *)obj setBundleState:v3];
  [(MSDBundleProgressTracker *)obj flushRecordsToPreferences];
  objc_sync_exit(obj);
}

- (int64_t)getAllComponentsForUpdate
{
  uint64_t v3 = +[MSDTargetDevice sharedInstance];
  unsigned int v4 = [v3 criticalUpdatePrioritized];

  if (v4)
  {
    unsigned int v5 = [(MSDBundleProgressTracker *)self criticalComponents];
    id v6 = [v5 count];
  }
  else
  {
    id v6 = [(MSDBundleProgressTracker *)self totalComponents];
  }
  v7 = sub_100068600();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_1000C9CCC(self, (uint64_t)v6, v7);
  }

  return (int64_t)v6;
}

- (id)getLastBundleUpdateDate
{
  id v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(MSDBundleProgressTracker *)v2 lastBundleUpdateDate];
  objc_sync_exit(v2);

  return v3;
}

- (double)getBundleUpdateTime
{
  id v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(MSDBundleProgressTracker *)v2 bundleTimerInfo];
  unsigned int v4 = [v3 objectForKey:@"startTime"];
  [v4 doubleValue];
  double v6 = v5;

  v7 = [(MSDBundleProgressTracker *)v2 bundleTimerInfo];
  id v8 = [v7 objectForKey:@"totalTimeTaken"];
  [v8 doubleValue];
  double v10 = v9;

  if (v6 == 0.0)
  {
    double v14 = 0.0;
  }
  else
  {
    uint64_t v11 = +[NSDate dateWithTimeIntervalSince1970:v6];
    v12 = +[NSDate now];
    [v12 timeIntervalSinceDate:v11];
    double v14 = v13;
  }
  objc_sync_exit(v2);

  return v10 + v14;
}

- (void)addToBundleUpdateTime:(double)a3
{
  id obj = self;
  objc_sync_enter(obj);
  unsigned int v4 = [(MSDBundleProgressTracker *)obj bundleTimerInfo];
  double v5 = [v4 objectForKey:@"totalTimeTaken"];
  [v5 doubleValue];
  double v7 = v6;

  id v8 = [(MSDBundleProgressTracker *)obj bundleTimerInfo];
  double v9 = +[NSNumber numberWithDouble:v7 + a3];
  [v8 setObject:v9 forKey:@"totalTimeTaken"];

  [(MSDBundleProgressTracker *)obj flushRecordsToPreferences];
  objc_sync_exit(obj);
}

- (BOOL)getComponentProgressStatus:(id)a3
{
  id v4 = a3;
  double v5 = self;
  objc_sync_enter(v5);
  double v6 = [(MSDBundleProgressTracker *)v5 bundleInfo];
  double v7 = [v6 objectForKey:@"ManifestVersion"];
  id v8 = +[MSDSignedManifest getComponentFromPath:v4 forManifestVersion:v7];

  double v9 = [(MSDBundleProgressTracker *)v5 componentsFromBundle];
  double v10 = [v9 objectForKey:v8];

  uint64_t v11 = [v10 objectForKey:@"Status"];
  BOOL v12 = [v11 intValue] == 2;

  objc_sync_exit(v5);
  return v12;
}

- (NSMutableDictionary)installedComponentList
{
  id v2 = self;
  objc_sync_enter(v2);
  id v17 = objc_alloc_init((Class)NSMutableDictionary);
  if (![(MSDBundleProgressTracker *)v2 preInstalledContent])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v3 = [(MSDBundleProgressTracker *)v2 componentsFromBundle];
    id v4 = [v3 allKeys];

    id v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v19;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v19 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v8 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          double v9 = [(MSDBundleProgressTracker *)v2 componentsFromBundle];
          double v10 = [v9 objectForKey:v8];
          uint64_t v11 = [v10 objectForKey:@"Status"];
          BOOL v12 = [v11 integerValue] == (id)2;

          if (v12)
          {
            double v13 = [(MSDBundleProgressTracker *)v2 componentsFromBundle];
            double v14 = [v13 objectForKey:v8];
            uint64_t v15 = [v14 objectForKey:@"Version"];
            [v17 setObject:v15 forKey:v8];
          }
        }
        id v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v5);
    }
  }
  objc_sync_exit(v2);

  return (NSMutableDictionary *)v17;
}

- (NSMutableDictionary)contentProgress
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  unsigned int v4 = [(MSDBundleProgressTracker *)v2 bundleState];
  if (v4 == 5)
  {
    uint64_t v5 = 3;
  }
  else if (v4 == 6)
  {
    uint64_t v5 = 4;
  }
  else
  {
    uint64_t v5 = [(MSDBundleProgressTracker *)v2 bundleState];
  }
  uint64_t v6 = [(MSDBundleProgressTracker *)v2 contentIdentifierString];
  unsigned int v7 = [v6 isEqualToString:@"Content.Installing"];

  if (v7)
  {
    uint64_t v8 = +[NSNumber numberWithInteger:[(MSDBundleProgressTracker *)v2 percentageProgress]];
    [v3 setObject:v8 forKey:@"InstalledComponentsPercent"];

    [v3 setObject:&off_100161F70 forKey:@"InstalledSizePercent"];
    double v9 = +[NSNumber numberWithUnsignedChar:v5];
    [v3 setObject:v9 forKey:@"InstallState"];
  }
  else
  {
    double v10 = [(MSDBundleProgressTracker *)v2 contentIdentifierString];
    unsigned int v11 = [v10 isEqualToString:@"Content.Downloading"];

    if (!v11) {
      goto LABEL_11;
    }
    BOOL v12 = +[NSNumber numberWithInteger:[(MSDBundleProgressTracker *)v2 percentageProgress]];
    [v3 setObject:v12 forKey:@"DownloadedComponentsPercent"];

    [v3 setObject:&off_100161F70 forKey:@"DownloadedSizePercent"];
    double v9 = +[NSNumber numberWithUnsignedChar:v5];
    [v3 setObject:v9 forKey:@"DownloadState"];
  }

LABEL_11:
  objc_sync_exit(v2);

  return (NSMutableDictionary *)v3;
}

- (void)retrieveAndPopulateBundleInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 getInfo];
  uint64_t v6 = +[NSMutableDictionary dictionary];
  [(MSDBundleProgressTracker *)self setBundleInfo:v6];

  unsigned int v7 = [v5 objectForKey:@"PartNumber"];
  if (v7)
  {
    uint64_t v8 = [(MSDBundleProgressTracker *)self bundleInfo];
    [v8 setObject:v7 forKey:@"PartNumber"];
  }
  double v9 = [v5 objectForKey:@"Revision"];

  if (v9)
  {
    double v10 = [(MSDBundleProgressTracker *)self bundleInfo];
    [v10 setObject:v9 forKey:@"Revision"];
  }
  unsigned int v11 = [v5 objectForKey:@"BundleName"];

  if (v11)
  {
    BOOL v12 = [(MSDBundleProgressTracker *)self bundleInfo];
    [v12 setObject:v11 forKey:@"BundleName"];
  }
  id v19 = +[MSDFileDownloadCredentials sharedInstance];
  double v13 = [v19 manifestInfo];
  double v14 = [v13 objectForKey:@"SigningKey"];

  if (v14)
  {
    uint64_t v15 = [(MSDBundleProgressTracker *)self bundleInfo];
    [v15 setObject:v14 forKey:@"SigningKey"];
  }
  id v16 = [(MSDBundleProgressTracker *)self bundleInfo];
  id v17 = [v4 getVersion];

  long long v18 = +[NSNumber numberWithInt:v17];
  [v16 setObject:v18 forKey:@"ManifestVersion"];
}

- (id)retrieveLegacyContentnIdentifier:(unsigned __int8)a3
{
  CFStringRef v3 = @"Content.Downloading";
  if (a3 == 2) {
    CFStringRef v3 = @"Content.Installing";
  }
  if (a3) {
    return (id)v3;
  }
  else {
    return @"Content.Existing";
  }
}

- (void)flushRecordsToPreferences
{
  v15[0] = @"BundleInfo";
  double v14 = [(MSDBundleProgressTracker *)self bundleInfo];
  v16[0] = v14;
  v15[1] = @"PreInstalledContent";
  CFStringRef v3 = +[NSNumber numberWithBool:[(MSDBundleProgressTracker *)self preInstalledContent]];
  v16[1] = v3;
  v15[2] = @"ComponentInfo";
  id v4 = [(MSDBundleProgressTracker *)self componentsFromBundle];
  v16[2] = v4;
  v15[3] = @"ContentStatus";
  uint64_t v5 = +[NSNumber numberWithUnsignedChar:[(MSDBundleProgressTracker *)self bundleState]];
  v16[3] = v5;
  v15[4] = @"ContentSource";
  uint64_t v6 = [(MSDBundleProgressTracker *)self downloadedContentSource];
  v16[4] = v6;
  v15[5] = @"TotalComponents";
  unsigned int v7 = +[NSNumber numberWithInteger:[(MSDBundleProgressTracker *)self totalComponents]];
  v16[5] = v7;
  v15[6] = @"SuccessfulComponents";
  uint64_t v8 = +[NSNumber numberWithInteger:[(MSDBundleProgressTracker *)self componentsSuccessful]];
  v16[6] = v8;
  v15[7] = @"LastBundleUpdateDate";
  double v9 = [(MSDBundleProgressTracker *)self lastBundleUpdateDate];
  v16[7] = v9;
  v15[8] = @"BundleTimerInfo";
  double v10 = [(MSDBundleProgressTracker *)self bundleTimerInfo];
  v16[8] = v10;
  unsigned int v11 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:9];

  BOOL v12 = +[MSDPreferencesFile sharedInstance];
  double v13 = [(MSDBundleProgressTracker *)self contentIdentifierString];
  [v12 setObject:v11 forKey:v13];
}

- (BOOL)checkIfAllCriticalComponentsTried
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = [(MSDBundleProgressTracker *)self criticalComponents];
  id v3 = [obj countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v21;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v21 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(id *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v8 = [(MSDBundleProgressTracker *)self bundleInfo];
        double v9 = [v8 objectForKey:@"ManifestVersion"];
        double v10 = +[MSDSignedManifest getComponentFromPath:v7 forManifestVersion:v9];

        unsigned int v11 = [(MSDBundleProgressTracker *)self componentsFromBundle];
        BOOL v12 = [v11 objectForKey:v10];

        if (v12)
        {
          double v13 = [v12 objectForKey:@"Status"];
          unsigned int v14 = [v13 intValue];

          if (!v14)
          {

            BOOL v16 = 0;
            goto LABEL_15;
          }
        }
        else
        {
          uint64_t v15 = sub_100068600();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v25 = v10;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Couldn't get componentInfo for: %{public}@, skipping...", buf, 0xCu);
          }
        }
      }
      id v4 = [obj countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v4);
  }
  BOOL v16 = 1;
LABEL_15:

  id v17 = sub_100068600();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v25) = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Critical components tried:%d", buf, 8u);
  }

  return v16;
}

+ (void)removeBundleFromPreferences:(id)a3
{
  id v3 = a3;
  id v4 = sub_100068600();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "removing bundlepreferences:%{public}@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = +[MSDPreferencesFile sharedInstance];
  [v5 removeObjectForKey:v3];
}

+ (BOOL)isBundleInstance:(id)a3 identicalWithNewBundle:(id)a4
{
  id v5 = a3;
  int v6 = [a4 getInfo];
  id v7 = +[MSDFileDownloadCredentials sharedInstance];
  BOOL v8 = 0;
  if (v5 && a4)
  {
    long long v22 = [v6 objectForKey:@"PartNumber"];
    double v9 = [v5 bundleInfo];
    double v10 = [v9 objectForKey:@"PartNumber"];

    unsigned int v11 = [v5 bundleInfo];
    BOOL v12 = [v11 objectForKey:@"Revision"];
    id v13 = [v12 integerValue];

    unsigned int v14 = [v6 objectForKey:@"Revision"];
    id v15 = [v14 integerValue];

    BOOL v16 = [v5 bundleInfo];
    id v17 = [v16 objectForKey:@"SigningKey"];

    long long v18 = [v7 manifestInfo];
    id v19 = [v18 objectForKey:@"SigningKey"];

    if ([v22 isEqualToString:v10]
      && v13 == v15
      && [v19 isEqualToString:v17])
    {
      long long v20 = sub_100068600();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "It is the same old bundle.", buf, 2u);
      }
      BOOL v8 = 1;
    }
    else
    {
      long long v20 = sub_100068600();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v23 = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "It is not the same old bundle.", v23, 2u);
      }
      BOOL v8 = 0;
    }
  }
  return v8;
}

+ (void)migratePreferencesFromLegacyDevicesIfNeeded
{
  id v2 = +[MSDPreferencesFile sharedInstance];
  id v3 = [v2 objectForKey:@"ContentInstalled"];

  id v4 = sub_100068600();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Found the key contentInstalled...", buf, 2u);
    }

    int v6 = +[MSDPreferencesFile sharedInstance];
    id v7 = [v6 objectForKey:@"Content.Existing"];

    if (v7)
    {
      BOOL v8 = +[MSDPreferencesFile sharedInstance];
      double v9 = [v8 objectForKey:@"ContentInstalled"];

      if (v9)
      {
        double v10 = [v9 objectForKey:@"DemoContent"];
        if (v10)
        {
          unsigned int v11 = [v9 objectForKey:@"Installed"];
          uint64_t v12 = (int)[v11 intValue];

          id v13 = [v9 objectForKey:@"Total"];
          uint64_t v14 = (int)[v13 intValue];
        }
        else
        {
          uint64_t v14 = 0;
          uint64_t v12 = 0;
        }
      }
      else
      {
        uint64_t v14 = 0;
        uint64_t v12 = 0;
      }
      if (v12 == v14) {
        unsigned __int8 v16 = 3;
      }
      else {
        unsigned __int8 v16 = 4;
      }
      id v17 = +[MSDPreferencesFile sharedInstance];
      id v4 = [v17 objectForKey:@"Content.Existing"];

      id v15 = objc_alloc_init((Class)NSMutableDictionary);
      id v7 = objc_alloc_init((Class)NSMutableDictionary);
      long long v18 = sub_100068600();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v46 = v14;
        __int16 v47 = 2048;
        uint64_t v48 = v12;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "totalComponents:%ld componentsSuccessful:%ld", buf, 0x16u);
      }

      id v19 = +[NSNumber numberWithUnsignedChar:v16];
      long long v20 = +[NSNumber numberWithInteger:v14];
      long long v21 = +[NSNumber numberWithInteger:v12];
      long long v22 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:v4, @"BundleInfo", v15, @"ComponentInfo", v19, @"ContentStatus", v7, @"ContentSource", v20, @"TotalComponents", v21, @"SuccessfulComponents", @"<unknown>", @"LastBundleUpdateDate", 0];

      long long v23 = +[MSDPreferencesFile sharedInstance];
      [v23 setObject:v22 forKey:@"Content.Existing"];
    }
    else
    {
      id v15 = 0;
      id v4 = 0;
    }
    uint64_t v24 = +[MSDPreferencesFile sharedInstance];
    v25 = [v24 objectForKey:@"Content.Downloading"];

    if (v25)
    {
      uint64_t v26 = +[MSDPreferencesFile sharedInstance];
      v27 = [v26 objectForKey:@"BackgroundDownloadedComponents"];

      id v28 = +[MSDPreferencesFile sharedInstance];
      v29 = [v28 objectForKey:@"TotalDownloadedContent"];
      signed int v30 = [v29 intValue];

      unsigned int v31 = +[MSDPreferencesFile sharedInstance];
      uint64_t v32 = [v31 objectForKey:@"Content.Downloading"];

      id v33 = objc_alloc_init((Class)NSMutableDictionary);
      id v34 = objc_alloc_init((Class)NSMutableDictionary);

      unint64_t v35 = 100 * (uint64_t)[v27 count] / (unint64_t)v30;
      id v36 = [v27 count];
      if (v30 == 100) {
        uint64_t v37 = 3;
      }
      else {
        uint64_t v37 = 4;
      }
      id v38 = +[NSNumber numberWithUnsignedChar:v37];
      v39 = +[NSNumber numberWithInteger:v35];
      id v40 = +[NSNumber numberWithInteger:v36];
      unsigned int v41 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:v32, @"BundleInfo", v33, @"ComponentInfo", v38, @"ContentStatus", v34, @"ContentSource", v39, @"TotalComponents", v40, @"SuccessfulComponents", @"<unknown>", @"LastBundleUpdateDate", 0];

      v42 = +[MSDPreferencesFile sharedInstance];
      [v42 setObject:v41 forKey:@"Content.Existing"];

      id v7 = v34;
      id v15 = v33;
      id v4 = v32;
    }
    long long v43 = +[MSDPreferencesFile sharedInstance];
    [v43 removeObjectForKey:@"ContentInstalled"];

    long long v44 = sub_100068600();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Migrating preferences from legacy device done.", buf, 2u);
    }
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Nothing to migrate in preferences file for legacy device.", buf, 2u);
  }
}

+ (void)migratePreferencesFromFactoryDevicesIfNeeded
{
  id v2 = +[MSDHelperAgent sharedInstance];
  if ([v2 fileExistsAtPath:@"/private/var/demo_backup/Metadata/Content.plist"])
  {
    id v3 = +[NSMutableDictionary dictionary];
    id v4 = [v2 readPlistFile:@"/private/var/demo_backup/Metadata/Content.plist"];
    if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      [v3 addEntriesFromDictionary:v4];
      BOOL v5 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:v3, @"BundleInfo", &__kCFBooleanTrue, @"PreInstalledContent", &__NSDictionary0__struct, @"ComponentInfo", &off_100161F88, @"ContentStatus", &__NSDictionary0__struct, @"ContentSource", &off_100161FA0, @"TotalComponents", &off_100161FA0, @"SuccessfulComponents", @"<unknown>", @"LastBundleUpdateDate", 0];
      int v6 = +[MSDPreferencesFile sharedInstance];
      [v6 setObject:v5 forKey:@"Content.Existing"];
    }
    else
    {
      BOOL v5 = sub_100068600();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)double v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Cannot parse Content.plist.", v10, 2u);
      }
    }

    [v2 removeFileAtPath:@"/private/var/demo_backup/Metadata/Content.plist"];
    id v7 = sub_100068600();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Migrating Content.plist for factory device done.", v9, 2u);
    }
  }
  else
  {
    id v3 = sub_100068600();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "No Content.plist to migrate for factory device.", buf, 2u);
    }
  }
}

- (void)startBundleUpdateTimer
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = [(MSDBundleProgressTracker *)v2 bundleTimerInfo];
  id v4 = [v3 objectForKey:@"startTime"];
  [v4 doubleValue];
  double v6 = v5;

  if (v6 == 0.0)
  {
    id v7 = sub_100068600();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Starting bundle update timer.", v12, 2u);
    }

    BOOL v8 = +[NSDate now];
    [v8 timeIntervalSince1970];
    double v6 = v9;
  }
  else
  {
    BOOL v8 = sub_100068600();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_1000C9DA0(v8);
    }
  }

  double v10 = [(MSDBundleProgressTracker *)v2 bundleTimerInfo];
  unsigned int v11 = +[NSNumber numberWithDouble:v6];
  [v10 setObject:v11 forKey:@"startTime"];

  [(MSDBundleProgressTracker *)v2 flushRecordsToPreferences];
  objc_sync_exit(v2);
}

- (void)stopBundleUpdateTimer
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = [(MSDBundleProgressTracker *)v2 bundleTimerInfo];
  id v4 = [v3 objectForKey:@"startTime"];
  [v4 doubleValue];
  double v6 = v5;

  id v7 = [(MSDBundleProgressTracker *)v2 bundleTimerInfo];
  BOOL v8 = [v7 objectForKey:@"totalTimeTaken"];
  [v8 doubleValue];
  double v10 = v9;

  if (v6 != 0.0)
  {
    unsigned int v11 = +[NSDate dateWithTimeIntervalSince1970:v6];
    uint64_t v12 = +[NSDate now];
    [v12 timeIntervalSinceDate:v11];
    double v14 = v13;

    id v15 = sub_100068600();
    double v16 = v10 + v14;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = +[NSDate now];
      [v17 timeIntervalSinceDate:v11];
      int v23 = 134218240;
      uint64_t v24 = v18;
      __int16 v25 = 2048;
      double v26 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Stopping bundle update timer. Time taken in this attempt: %lf, Total time taken: %lf", (uint8_t *)&v23, 0x16u);
    }
    id v19 = [(MSDBundleProgressTracker *)v2 bundleTimerInfo];
    long long v20 = +[NSNumber numberWithDouble:0.0];
    [v19 setObject:v20 forKey:@"startTime"];

    long long v21 = [(MSDBundleProgressTracker *)v2 bundleTimerInfo];
    long long v22 = +[NSNumber numberWithDouble:v16];
    [v21 setObject:v22 forKey:@"totalTimeTaken"];

    [(MSDBundleProgressTracker *)v2 flushRecordsToPreferences];
  }
  objc_sync_exit(v2);
}

- (unsigned)bundleType
{
  return self->_bundleType;
}

- (void)setBundleType:(unsigned __int8)a3
{
  self->_bundleType = a3;
}

- (unsigned)bundleState
{
  return self->_bundleState;
}

- (void)setBundleState:(unsigned __int8)a3
{
  self->_bundleState = a3;
}

- (NSMutableDictionary)bundleInfo
{
  return self->_bundleInfo;
}

- (void)setBundleInfo:(id)a3
{
}

- (void)setContentProgress:(id)a3
{
}

- (void)setInstalledComponentList:(id)a3
{
}

- (NSMutableDictionary)downloadedContentSource
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDownloadedContentSource:(id)a3
{
}

- (BOOL)preInstalledContent
{
  return self->_preInstalledContent;
}

- (void)setPreInstalledContent:(BOOL)a3
{
  self->_preInstalledContent = a3;
}

- (NSString)contentIdentifierString
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setContentIdentifierString:(id)a3
{
}

- (NSMutableDictionary)componentsFromBundle
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setComponentsFromBundle:(id)a3
{
}

- (int64_t)percentageProgress
{
  return self->_percentageProgress;
}

- (void)setPercentageProgress:(int64_t)a3
{
  self->_percentageProgress = a3;
}

- (int64_t)totalComponents
{
  return self->_totalComponents;
}

- (void)setTotalComponents:(int64_t)a3
{
  self->_totalComponents = a3;
}

- (int64_t)componentsSuccessful
{
  return self->_componentsSuccessful;
}

- (void)setComponentsSuccessful:(int64_t)a3
{
  self->_componentsSuccessful = a3;
}

- (NSArray)criticalComponents
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCriticalComponents:(id)a3
{
}

- (NSString)lastBundleUpdateDate
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLastBundleUpdateDate:(id)a3
{
}

- (NSMutableDictionary)bundleTimerInfo
{
  return self->_bundleTimerInfo;
}

- (void)setBundleTimerInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleTimerInfo, 0);
  objc_storeStrong((id *)&self->_lastBundleUpdateDate, 0);
  objc_storeStrong((id *)&self->_criticalComponents, 0);
  objc_storeStrong((id *)&self->_componentsFromBundle, 0);
  objc_storeStrong((id *)&self->_contentIdentifierString, 0);
  objc_storeStrong((id *)&self->_downloadedContentSource, 0);
  objc_storeStrong((id *)&self->_installedComponentList, 0);
  objc_storeStrong((id *)&self->_contentProgress, 0);

  objc_storeStrong((id *)&self->_bundleInfo, 0);
}

@end