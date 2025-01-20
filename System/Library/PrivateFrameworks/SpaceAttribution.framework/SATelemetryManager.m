@interface SATelemetryManager
+ (BOOL)shouldSendTelemetry:(BOOL)a3;
+ (id)SATelAppInfoTranslationTable;
+ (id)SATelTimeInfoTranslationTable;
+ (id)SATelTotalsDirStatsInfoTranslationTable;
+ (id)SATelTotalsInfoTranslationTable;
+ (id)getLastSentTelemetryDate:(BOOL)a3;
+ (id)getiCloudPlanSizeGB;
+ (id)newWithSAFOptions:(unint64_t)a3;
+ (void)clearLastTelemetryData:(id)a3;
+ (void)disableAppsFiltering;
+ (void)getLastTelemetryData:(id)a3;
+ (void)setAppsFilteringToDefault;
+ (void)updateLastSentTelemetryDate:(BOOL)a3;
- (NSMutableDictionary)appsInfo;
- (NSMutableDictionary)firstPartyfilteredInfo;
- (NSMutableDictionary)thirdPartyfilteredInfo;
- (NSMutableDictionary)timeInfo;
- (NSMutableDictionary)times;
- (NSMutableDictionary)totalsDstatsInfo;
- (NSMutableDictionary)totalsInfo;
- (NSNumber)icloudPlan;
- (NSString)runSignature;
- (SATelemetryManager)initWithSAFOptions:(unint64_t)a3;
- (double)stopTimeForTimeInfoEntry:(int64_t)a3;
- (id)createAppColumn:(id)a3;
- (id)dictionaryDescription;
- (id)fillFilteredInfoDict:(id)a3 withNumberOfApps:(unint64_t)a4 withAppInfoArr:(id)a5 withFilterCriteria:(int64_t)a6 withMetricType:(id)a7;
- (id)getFirstPartyAppsInfoKeys;
- (id)getTelAppInfoTranslation:(int64_t)a3;
- (id)getTelTimeInfoTranslation:(int64_t)a3;
- (id)getTelTotalsDirStatsInfoTranslation:(int64_t)a3;
- (id)getTelTotalsInfoTranslation:(int64_t)a3;
- (id)getThirdPartyAppsInfoKeys;
- (id)getTimeInfoTranslatedDictionary;
- (id)getTotalsDirstatInfoTranslatedDictionary;
- (id)getTotalsInfoTranslatedDictionary;
- (id)getVendorValueforBundleSet:(id)a3;
- (id)hasResultsError;
- (id)setAppInfoDictWithFirstPartyAppsKeys:(id)a3 WithThirdPartyAppKeys:(id)a4;
- (id)sortAppsInfo:(id)a3 by:(int64_t)a4 withOption:(int64_t)a5;
- (unint64_t)SAFOptions;
- (unint64_t)appsNumber;
- (unint64_t)getValueForAppInfoEntry:(int64_t)a3 forBundleSet:(id)a4;
- (unint64_t)getValueForDirStatsTotalsInfoEntry:(int64_t)a3;
- (unint64_t)getValueForTimeInfoEntry:(int64_t)a3;
- (unint64_t)getValueForTotalsInfoEntry:(int64_t)a3;
- (void)addValue:(unint64_t)a3 forAppInfoEntry:(int64_t)a4 forBundleSet:(id)a5;
- (void)addValue:(unint64_t)a3 forDirStatsTotalsInfoEntry:(int64_t)a4;
- (void)addValue:(unint64_t)a3 forTimeInfoEntry:(int64_t)a4;
- (void)addValue:(unint64_t)a3 forTotalsInfoEntry:(int64_t)a4;
- (void)removeAppsWithMultipleVendors;
- (void)saveTelemetryDataToDisk:(id)a3 thirdPartyAppKeys:(id)a4;
- (void)sendTelemetry:(BOOL)a3;
- (void)setAppsInfo:(id)a3;
- (void)setAppsNumber:(unint64_t)a3;
- (void)setFirstPartyfilteredInfo:(id)a3;
- (void)setIcloudPlan:(id)a3;
- (void)setRunSignature:(id)a3;
- (void)setSAFOptions:(unint64_t)a3;
- (void)setSystemDataSize:(unint64_t)a3;
- (void)setThirdPartyfilteredInfo:(id)a3;
- (void)setTimeInfo:(id)a3;
- (void)setTimes:(id)a3;
- (void)setTotalsDstatsInfo:(id)a3;
- (void)setTotalsInfo:(id)a3;
- (void)setValue:(unint64_t)a3 forAppInfoEntry:(int64_t)a4 forBundleSet:(id)a5;
- (void)setValue:(unint64_t)a3 forDirStatsTotalsInfoEntry:(int64_t)a4;
- (void)setValue:(unint64_t)a3 forTimeInfoEntry:(int64_t)a4;
- (void)setValue:(unint64_t)a3 forTotalsInfoEntry:(int64_t)a4;
- (void)startTimeForTimeInfoEntry:(int64_t)a3;
- (void)subtractValue:(unint64_t)a3 forAppInfoEntry:(int64_t)a4 forBundleSet:(id)a5;
- (void)subtractValue:(unint64_t)a3 forTotalsInfoEntry:(int64_t)a4;
- (void)updateAppSet:(id)a3 appCacheSize:(unint64_t)a4 CDPluginSize:(unint64_t)a5;
- (void)updateAppSet:(id)a3 attributionSize:(unint64_t)a4 attributionCloneSize:(unint64_t)a5 attributionTagCount:(unint64_t)a6;
- (void)updateAppSet:(id)a3 usedDirStat:(BOOL)a4 fixedSize:(unint64_t)a5 dataSize:(unint64_t)a6 cloneSize:(unint64_t)a7 purgeableSize:(unint64_t)a8;
- (void)updateAppSet:(id)a3 withPurgeableTagSize:(unint64_t)a4;
- (void)updateAppSet:(id)a3 withSUPurgeableSize:(unint64_t)a4;
- (void)updateCloneInfoWithAppSet:(id)a3 withItemSize:(id)a4;
- (void)updateDirStatInfo:(BOOL)a3 usedDirsStat:(BOOL)a4 failedDirStat:(BOOL)a5 skippedDirStat:(BOOL)a6;
- (void)updateSAFOptionWithPathsList:(id)a3;
- (void)updateTotalsInfo:(unint64_t)a3 totalPurgeable:(unint64_t)a4;
@end

@implementation SATelemetryManager

+ (id)getiCloudPlanSizeGB
{
  if (objc_opt_class() && objc_opt_class())
  {
    v2 = +[ACAccountStore defaultStore];
    v3 = objc_msgSend(v2, "aa_primaryAppleAccount");

    v4 = objc_msgSend(v3, "aa_lastKnownQuota");
    v5 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (unint64_t)[v4 unsignedLongLongValue] >> 30);
  }
  else
  {
    v6 = SALog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100033B14();
    }

    v5 = 0;
  }
  return v5;
}

- (SATelemetryManager)initWithSAFOptions:(unint64_t)a3
{
  v41.receiver = self;
  v41.super_class = (Class)SATelemetryManager;
  v4 = [(SATelemetryManager *)&v41 init];
  if (v4)
  {
    v5 = +[NSUUID UUID];
    uint64_t v6 = [v5 UUIDString];
    runSignature = v4->_runSignature;
    v4->_runSignature = (NSString *)v6;

    v4->_appsNumber = 0;
    v4->_SAFOptions = a3;
    uint64_t v8 = +[SATelemetryManager getiCloudPlanSizeGB];
    icloudPlan = v4->_icloudPlan;
    v4->_icloudPlan = (NSNumber *)v8;

    uint64_t v10 = objc_opt_new();
    appsInfo = v4->_appsInfo;
    v4->_appsInfo = (NSMutableDictionary *)v10;

    uint64_t v12 = objc_opt_new();
    totalsInfo = v4->_totalsInfo;
    v4->_totalsInfo = (NSMutableDictionary *)v12;

    v14 = v4->_totalsInfo;
    v15 = [(SATelemetryManager *)v4 getTelTotalsInfoTranslation:0];
    [(NSMutableDictionary *)v14 setValue:@"totals-info" forKey:v15];

    v16 = v4->_totalsInfo;
    v17 = v4->_runSignature;
    v18 = [(SATelemetryManager *)v4 getTelTotalsInfoTranslation:1];
    [(NSMutableDictionary *)v16 setValue:v17 forKey:v18];

    v19 = v4->_totalsInfo;
    v20 = v4->_icloudPlan;
    v21 = [(SATelemetryManager *)v4 getTelTotalsInfoTranslation:2];
    [(NSMutableDictionary *)v19 setValue:v20 forKey:v21];

    uint64_t v22 = objc_opt_new();
    totalsDstatsInfo = v4->_totalsDstatsInfo;
    v4->_totalsDstatsInfo = (NSMutableDictionary *)v22;

    v24 = v4->_totalsDstatsInfo;
    v25 = [(SATelemetryManager *)v4 getTelTotalsDirStatsInfoTranslation:0];
    [(NSMutableDictionary *)v24 setValue:@"totals-dstats-info" forKey:v25];

    v26 = v4->_totalsDstatsInfo;
    v27 = v4->_runSignature;
    v28 = [(SATelemetryManager *)v4 getTelTotalsDirStatsInfoTranslation:1];
    [(NSMutableDictionary *)v26 setValue:v27 forKey:v28];

    uint64_t v29 = objc_opt_new();
    timeInfo = v4->_timeInfo;
    v4->_timeInfo = (NSMutableDictionary *)v29;

    v31 = v4->_timeInfo;
    v32 = v4->_runSignature;
    v33 = [(SATelemetryManager *)v4 getTelTimeInfoTranslation:1];
    [(NSMutableDictionary *)v31 setValue:v32 forKey:v33];

    uint64_t v34 = objc_opt_new();
    firstPartyfilteredInfo = v4->_firstPartyfilteredInfo;
    v4->_firstPartyfilteredInfo = (NSMutableDictionary *)v34;

    uint64_t v36 = objc_opt_new();
    thirdPartyfilteredInfo = v4->_thirdPartyfilteredInfo;
    v4->_thirdPartyfilteredInfo = (NSMutableDictionary *)v36;

    uint64_t v38 = objc_opt_new();
    times = v4->_times;
    v4->_times = (NSMutableDictionary *)v38;
  }
  return v4;
}

+ (id)newWithSAFOptions:(unint64_t)a3
{
  v4 = [SATelemetryManager alloc];
  return [(SATelemetryManager *)v4 initWithSAFOptions:a3];
}

- (id)createAppColumn:(id)a3
{
  id v4 = a3;
  v5 = +[SAUtilities createCommaSeparatedString:v4];
  id v6 = [v4 count];
  v7 = objc_opt_new();
  if (v6 == (id)1)
  {
    uint64_t v8 = 2;
  }
  else
  {
    v9 = [v4 anyObject];
    uint64_t v10 = [(SATelemetryManager *)self getTelAppInfoTranslation:2];
    [v7 setValue:v9 forKey:v10];

    uint64_t v8 = 25;
  }
  v11 = [(SATelemetryManager *)self getTelAppInfoTranslation:v8];
  [v7 setValue:v5 forKey:v11];

  uint64_t v12 = [(SATelemetryManager *)self getTelAppInfoTranslation:0];
  [v7 setValue:@"app-info" forKey:v12];

  runSignature = self->_runSignature;
  v14 = [(SATelemetryManager *)self getTelAppInfoTranslation:1];
  [v7 setValue:runSignature forKey:v14];

  v15 = +[NSNumber numberWithUnsignedLongLong:v6];
  v16 = [(SATelemetryManager *)self getTelAppInfoTranslation:7];
  [v7 setValue:v15 forKey:v16];

  v17 = +[NSNumber numberWithUnsignedLongLong:[(SATelemetryManager *)self appsNumber]];
  v18 = [(SATelemetryManager *)self getTelAppInfoTranslation:6];
  [v7 setValue:v17 forKey:v18];

  v19 = +[NSNumber numberWithUnsignedLongLong:[(SATelemetryManager *)self SAFOptions]];
  v20 = [(SATelemetryManager *)self getTelAppInfoTranslation:5];
  [v7 setValue:v19 forKey:v20];

  icloudPlan = self->_icloudPlan;
  uint64_t v22 = [(SATelemetryManager *)self getTelAppInfoTranslation:4];
  [v7 setValue:icloudPlan forKey:v22];

  v23 = objc_opt_new();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v24 = v4;
  id v25 = [v24 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v36;
    do
    {
      for (i = 0; i != v26; i = (char *)i + 1)
      {
        if (*(void *)v36 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = +[SAQuery guesstimateBundleId:](SAQuery, "guesstimateBundleId:", *(void *)(*((void *)&v35 + 1) + 8 * i), (void)v35);
        [v23 addObject:v29];
      }
      id v26 = [v24 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v26);
  }

  v30 = [v23 allObjects];
  v31 = [v30 sortedArrayUsingSelector:"localizedCaseInsensitiveCompare:"];

  v32 = [v31 componentsJoinedByString:@","];
  v33 = [(SATelemetryManager *)self getTelAppInfoTranslation:3];
  [v7 setValue:v32 forKey:v33];

  [(NSMutableDictionary *)self->_appsInfo setValue:v7 forKey:v5];
  [(SATelemetryManager *)self setAppsNumber:(char *)[(SATelemetryManager *)self appsNumber] + 1];

  return v7;
}

- (void)setValue:(unint64_t)a3 forAppInfoEntry:(int64_t)a4 forBundleSet:(id)a5
{
  id v14 = a5;
  v9 = +[SAUtilities createCommaSeparatedString:v14];
  uint64_t v10 = self->_appsInfo;
  objc_sync_enter(v10);
  v11 = [(NSMutableDictionary *)self->_appsInfo objectForKey:v9];
  if (!v11)
  {
    v11 = [(SATelemetryManager *)self createAppColumn:v14];
  }
  uint64_t v12 = +[NSNumber numberWithUnsignedLongLong:a3];
  v13 = [(SATelemetryManager *)self getTelAppInfoTranslation:a4];
  [v11 setValue:v12 forKey:v13];

  objc_sync_exit(v10);
}

- (unint64_t)getValueForAppInfoEntry:(int64_t)a3 forBundleSet:(id)a4
{
  id v6 = a4;
  v7 = self->_appsInfo;
  objc_sync_enter(v7);
  uint64_t v8 = +[SAUtilities createCommaSeparatedString:v6];
  v9 = [(NSMutableDictionary *)self->_appsInfo objectForKey:v8];
  if (v9)
  {
    uint64_t v10 = [(SATelemetryManager *)self getTelAppInfoTranslation:a3];
    v11 = [v9 objectForKey:v10];

    if (v11) {
      id v12 = [v11 longLongValue];
    }
    else {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  objc_sync_exit(v7);
  return (unint64_t)v12;
}

- (id)getVendorValueforBundleSet:(id)a3
{
  id v4 = a3;
  v5 = self->_appsInfo;
  objc_sync_enter(v5);
  id v6 = +[SAUtilities createCommaSeparatedString:v4];
  v7 = [(NSMutableDictionary *)self->_appsInfo objectForKey:v6];
  if (v7)
  {
    uint64_t v8 = [(SATelemetryManager *)self getTelAppInfoTranslation:3];
    v9 = [v7 objectForKey:v8];
  }
  else
  {
    v9 = 0;
  }

  objc_sync_exit(v5);
  return v9;
}

- (void)addValue:(unint64_t)a3 forAppInfoEntry:(int64_t)a4 forBundleSet:(id)a5
{
  id v9 = a5;
  uint64_t v8 = self->_appsInfo;
  objc_sync_enter(v8);
  [(SATelemetryManager *)self setValue:(char *)[(SATelemetryManager *)self getValueForAppInfoEntry:a4 forBundleSet:v9]+ a3 forAppInfoEntry:a4 forBundleSet:v9];
  objc_sync_exit(v8);
}

- (void)subtractValue:(unint64_t)a3 forAppInfoEntry:(int64_t)a4 forBundleSet:(id)a5
{
  id v8 = a5;
  id v9 = self->_appsInfo;
  objc_sync_enter(v9);
  unint64_t v10 = [(SATelemetryManager *)self getValueForAppInfoEntry:a4 forBundleSet:v8];
  if (v10 >= a3)
  {
    [(SATelemetryManager *)self setValue:v10 - a3 forAppInfoEntry:a4 forBundleSet:v8];
  }
  else
  {
    v11 = SALog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100033B48(v11);
    }
  }
  objc_sync_exit(v9);
}

- (void)updateCloneInfoWithAppSet:(id)a3 withItemSize:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[SATelemetryManager addValue:forAppInfoEntry:forBundleSet:](self, "addValue:forAppInfoEntry:forBundleSet:", [v6 dataSize], 22, v7);
  -[SATelemetryManager addValue:forAppInfoEntry:forBundleSet:](self, "addValue:forAppInfoEntry:forBundleSet:", [v6 dataSize], 16, v7);
  -[SATelemetryManager addValue:forAppInfoEntry:forBundleSet:](self, "addValue:forAppInfoEntry:forBundleSet:", [v6 cloneSize], 24, v7);
  -[SATelemetryManager addValue:forAppInfoEntry:forBundleSet:](self, "addValue:forAppInfoEntry:forBundleSet:", [v6 cloneSize], 17, v7);
  -[SATelemetryManager addValue:forAppInfoEntry:forBundleSet:](self, "addValue:forAppInfoEntry:forBundleSet:", [v6 purgeableSize], 23, v7);
  -[SATelemetryManager addValue:forAppInfoEntry:forBundleSet:](self, "addValue:forAppInfoEntry:forBundleSet:", [v6 purgeableSize], 18, v7);

  id v8 = [v6 cloneSize];
  [(SATelemetryManager *)self addValue:v8 forTotalsInfoEntry:20];
}

- (void)updateAppSet:(id)a3 usedDirStat:(BOOL)a4 fixedSize:(unint64_t)a5 dataSize:(unint64_t)a6 cloneSize:(unint64_t)a7 purgeableSize:(unint64_t)a8
{
  BOOL v12 = a4;
  id v14 = a3;
  if (v12)
  {
    [(SATelemetryManager *)self addValue:a6 forAppInfoEntry:8 forBundleSet:v14];
    [(SATelemetryManager *)self addValue:a6 forTotalsInfoEntry:6];
    [(SATelemetryManager *)self addValue:a8 forAppInfoEntry:9 forBundleSet:v14];
    [(SATelemetryManager *)self addValue:a8 forTotalsInfoEntry:7];
    [(SATelemetryManager *)self addValue:a7 forAppInfoEntry:10 forBundleSet:v14];
    [(SATelemetryManager *)self addValue:a7 forTotalsInfoEntry:8];
    [(SATelemetryManager *)self addValue:1 forAppInfoEntry:11 forBundleSet:v14];
  }
  [(SATelemetryManager *)self addValue:a5 forAppInfoEntry:21 forBundleSet:v14];
  [(SATelemetryManager *)self addValue:a6 forAppInfoEntry:22 forBundleSet:v14];
  [(SATelemetryManager *)self addValue:a7 forAppInfoEntry:24 forBundleSet:v14];
  [(SATelemetryManager *)self addValue:a7 forTotalsInfoEntry:20];
  [(SATelemetryManager *)self addValue:a8 forAppInfoEntry:23 forBundleSet:v14];
}

- (void)updateAppSet:(id)a3 attributionSize:(unint64_t)a4 attributionCloneSize:(unint64_t)a5 attributionTagCount:(unint64_t)a6
{
  id v10 = a3;
  [(SATelemetryManager *)self addValue:a4 forAppInfoEntry:22 forBundleSet:v10];
  [(SATelemetryManager *)self addValue:a4 forAppInfoEntry:12 forBundleSet:v10];
  [(SATelemetryManager *)self addValue:a4 forTotalsInfoEntry:10];
  [(SATelemetryManager *)self addValue:a5 forAppInfoEntry:14 forBundleSet:v10];
  [(SATelemetryManager *)self addValue:a5 forTotalsInfoEntry:13];
  [(SATelemetryManager *)self addValue:a6 forAppInfoEntry:15 forBundleSet:v10];

  [(SATelemetryManager *)self addValue:a6 forTotalsInfoEntry:14];
}

- (void)updateAppSet:(id)a3 withPurgeableTagSize:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = [(SATelemetryManager *)self getValueForAppInfoEntry:5 forBundleSet:v6];
  [(SATelemetryManager *)self addValue:a4 forAppInfoEntry:23 forBundleSet:v6];
  [(SATelemetryManager *)self subtractValue:a4 forAppInfoEntry:22 forBundleSet:v6];
  [(SATelemetryManager *)self addValue:a4 forAppInfoEntry:13 forBundleSet:v6];
  [(SATelemetryManager *)self subtractValue:a4 forAppInfoEntry:12 forBundleSet:v6];

  [(SATelemetryManager *)self subtractValue:a4 forTotalsInfoEntry:10];
  [(SATelemetryManager *)self addValue:a4 forTotalsInfoEntry:19];
  if (v7 == 1) {
    uint64_t v8 = 11;
  }
  else {
    uint64_t v8 = 12;
  }
  [(SATelemetryManager *)self addValue:a4 forTotalsInfoEntry:v8];
}

- (void)updateAppSet:(id)a3 appCacheSize:(unint64_t)a4 CDPluginSize:(unint64_t)a5
{
  unint64_t v8 = a5 + a4;
  id v9 = a3;
  [(SATelemetryManager *)self addValue:v8 forAppInfoEntry:23 forBundleSet:v9];
  [(SATelemetryManager *)self addValue:a4 forAppInfoEntry:19 forBundleSet:v9];
  [(SATelemetryManager *)self addValue:a4 forTotalsInfoEntry:15];
  [(SATelemetryManager *)self addValue:a5 forAppInfoEntry:20 forBundleSet:v9];

  [(SATelemetryManager *)self addValue:a5 forTotalsInfoEntry:16];
}

- (void)updateAppSet:(id)a3 withSUPurgeableSize:(unint64_t)a4
{
  id v6 = a3;
  [(SATelemetryManager *)self addValue:a4 forAppInfoEntry:22 forBundleSet:v6];
  [(SATelemetryManager *)self subtractValue:a4 forAppInfoEntry:23 forBundleSet:v6];
}

- (void)setSystemDataSize:(unint64_t)a3
{
  v5 = +[NSSet setWithObject:@"com.apple.fakeapp.SystemData"];
  [(SATelemetryManager *)self setValue:a3 forAppInfoEntry:22 forBundleSet:v5];

  [(SATelemetryManager *)self setValue:a3 forTotalsInfoEntry:18];
}

- (void)updateSAFOptionWithPathsList:(id)a3
{
  id v4 = a3;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v27 = self;
  id obj = [(NSMutableDictionary *)self->_appsInfo allKeys];
  id v5 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v38;
    unint64_t v8 = &APFSContainerGetBootDevice_ptr;
    uint64_t v28 = *(void *)v38;
    do
    {
      id v9 = 0;
      id v29 = v6;
      do
      {
        if (*(void *)v38 != v7) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v37 + 1) + 8 * (void)v9);
        if (([v10 isEqual:@"com.apple.fakeapp.SystemData"] & 1) == 0
          && ([v10 isEqual:@"com.apple.fakeapp.System"] & 1) == 0
          && ([v10 isEqual:@"com.apple.fakeapp.SoftwareUpdate"] & 1) == 0)
        {
          v30 = v9;
          v31 = v11;
          BOOL v12 = v8[172];
          v13 = [v10 componentsSeparatedByString:@","];
          id v14 = [v12 setWithArray:v13];

          v15 = v10;
          if ((unint64_t)[v14 count] >= 2
            && [v14 containsObject:@"com.apple.Bridge"])
          {
            [v14 removeObject:@"com.apple.Bridge"];
          }
          v16 = [v8[172] setWithSet:v14];
          long long v33 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          id v17 = v14;
          id v18 = [v17 countByEnumeratingWithState:&v33 objects:v41 count:16];
          if (v18)
          {
            id v19 = v18;
            uint64_t v20 = *(void *)v34;
            do
            {
              v21 = 0;
              do
              {
                if (*(void *)v34 != v20) {
                  objc_enumerationMutation(v17);
                }
                uint64_t v22 = *(void *)(*((void *)&v33 + 1) + 8 * (void)v21);
                v23 = [v4 appPathList];
                id v24 = [v23 objectForKeyedSubscript:v22];

                if (!v24 || ([v24 isUserVisible] & 1) == 0) {
                  [v16 removeObject:v22];
                }

                v21 = (char *)v21 + 1;
              }
              while (v19 != v21);
              id v19 = [v17 countByEnumeratingWithState:&v33 objects:v41 count:16];
            }
            while (v19);
          }

          if (![v16 count])
          {
            id v25 = [v15 componentsSeparatedByString:@","];
            id v26 = +[NSSet setWithArray:v25];
            [(SATelemetryManager *)v27 setValue:2 forAppInfoEntry:5 forBundleSet:v26];
          }
          uint64_t v7 = v28;
          id v6 = v29;
          unint64_t v8 = &APFSContainerGetBootDevice_ptr;
          id v9 = v30;
          v11 = v31;
        }
        id v9 = (char *)v9 + 1;
      }
      while (v9 != v6);
      id v6 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v6);
  }
}

- (void)setValue:(unint64_t)a3 forTotalsInfoEntry:(int64_t)a4
{
  id obj = self->_totalsInfo;
  objc_sync_enter(obj);
  totalsInfo = self->_totalsInfo;
  unint64_t v8 = +[NSNumber numberWithUnsignedLongLong:a3];
  id v9 = [(SATelemetryManager *)self getTelTotalsInfoTranslation:a4];
  [(NSMutableDictionary *)totalsInfo setValue:v8 forKey:v9];

  objc_sync_exit(obj);
}

- (unint64_t)getValueForTotalsInfoEntry:(int64_t)a3
{
  id v5 = self->_totalsInfo;
  objc_sync_enter(v5);
  totalsInfo = self->_totalsInfo;
  uint64_t v7 = [(SATelemetryManager *)self getTelTotalsInfoTranslation:a3];
  unint64_t v8 = [(NSMutableDictionary *)totalsInfo objectForKey:v7];

  if (v8) {
    id v9 = [v8 longLongValue];
  }
  else {
    id v9 = 0;
  }

  objc_sync_exit(v5);
  return (unint64_t)v9;
}

- (void)addValue:(unint64_t)a3 forTotalsInfoEntry:(int64_t)a4
{
  id obj = self->_totalsInfo;
  objc_sync_enter(obj);
  [(SATelemetryManager *)self setValue:(char *)[(SATelemetryManager *)self getValueForTotalsInfoEntry:a4] + a3 forTotalsInfoEntry:a4];
  objc_sync_exit(obj);
}

- (void)subtractValue:(unint64_t)a3 forTotalsInfoEntry:(int64_t)a4
{
  uint64_t v7 = self->_totalsInfo;
  objc_sync_enter(v7);
  unint64_t v8 = [(SATelemetryManager *)self getValueForTotalsInfoEntry:a4];
  if (v8 >= a3)
  {
    [(SATelemetryManager *)self setValue:v8 - a3 forTotalsInfoEntry:a4];
  }
  else
  {
    id v9 = SALog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100033BCC(v9);
    }
  }
  objc_sync_exit(v7);
}

- (void)updateTotalsInfo:(unint64_t)a3 totalPurgeable:(unint64_t)a4
{
  [(SATelemetryManager *)self setValue:a3 >> 12 forTotalsInfoEntry:21];
  [(SATelemetryManager *)self setValue:a4 forTotalsInfoEntry:19];
}

- (void)setValue:(unint64_t)a3 forDirStatsTotalsInfoEntry:(int64_t)a4
{
  id obj = self->_totalsDstatsInfo;
  objc_sync_enter(obj);
  totalsDstatsInfo = self->_totalsDstatsInfo;
  unint64_t v8 = +[NSNumber numberWithUnsignedLongLong:a3];
  id v9 = [(SATelemetryManager *)self getTelTotalsDirStatsInfoTranslation:a4];
  [(NSMutableDictionary *)totalsDstatsInfo setValue:v8 forKey:v9];

  objc_sync_exit(obj);
}

- (unint64_t)getValueForDirStatsTotalsInfoEntry:(int64_t)a3
{
  id v5 = self->_totalsDstatsInfo;
  objc_sync_enter(v5);
  totalsDstatsInfo = self->_totalsDstatsInfo;
  uint64_t v7 = [(SATelemetryManager *)self getTelTotalsDirStatsInfoTranslation:a3];
  unint64_t v8 = [(NSMutableDictionary *)totalsDstatsInfo objectForKey:v7];

  if (v8) {
    id v9 = [v8 longLongValue];
  }
  else {
    id v9 = 0;
  }

  objc_sync_exit(v5);
  return (unint64_t)v9;
}

- (void)addValue:(unint64_t)a3 forDirStatsTotalsInfoEntry:(int64_t)a4
{
  id obj = self->_totalsDstatsInfo;
  objc_sync_enter(obj);
  [(SATelemetryManager *)self setValue:(char *)[(SATelemetryManager *)self getValueForDirStatsTotalsInfoEntry:a4]+ a3 forDirStatsTotalsInfoEntry:a4];
  objc_sync_exit(obj);
}

- (void)updateDirStatInfo:(BOOL)a3 usedDirsStat:(BOOL)a4 failedDirStat:(BOOL)a5 skippedDirStat:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  BOOL v9 = a3;
  [(SATelemetryManager *)self addValue:1 forDirStatsTotalsInfoEntry:2];
  if (v9)
  {
    [(SATelemetryManager *)self addValue:1 forTotalsInfoEntry:9];
    [(SATelemetryManager *)self addValue:1 forDirStatsTotalsInfoEntry:3];
    if (!v8)
    {
LABEL_3:
      if (!v7) {
        goto LABEL_4;
      }
LABEL_10:
      [(SATelemetryManager *)self addValue:1 forDirStatsTotalsInfoEntry:5];
      if (!v6) {
        return;
      }
      goto LABEL_5;
    }
  }
  else if (!v8)
  {
    goto LABEL_3;
  }
  [(SATelemetryManager *)self addValue:1 forDirStatsTotalsInfoEntry:4];
  if (v7) {
    goto LABEL_10;
  }
LABEL_4:
  if (!v6) {
    return;
  }
LABEL_5:
  [(SATelemetryManager *)self addValue:1 forDirStatsTotalsInfoEntry:6];
}

- (void)setValue:(unint64_t)a3 forTimeInfoEntry:(int64_t)a4
{
  id obj = self->_timeInfo;
  objc_sync_enter(obj);
  timeInfo = self->_timeInfo;
  BOOL v8 = +[NSNumber numberWithUnsignedLongLong:a3];
  BOOL v9 = [(SATelemetryManager *)self getTelTimeInfoTranslation:a4];
  [(NSMutableDictionary *)timeInfo setValue:v8 forKey:v9];

  objc_sync_exit(obj);
}

- (unint64_t)getValueForTimeInfoEntry:(int64_t)a3
{
  id v5 = self->_timeInfo;
  objc_sync_enter(v5);
  timeInfo = self->_timeInfo;
  BOOL v7 = [(SATelemetryManager *)self getTelTimeInfoTranslation:a3];
  BOOL v8 = [(NSMutableDictionary *)timeInfo valueForKey:v7];

  if (v8) {
    id v9 = [v8 longLongValue];
  }
  else {
    id v9 = 0;
  }

  objc_sync_exit(v5);
  return (unint64_t)v9;
}

- (void)addValue:(unint64_t)a3 forTimeInfoEntry:(int64_t)a4
{
  id obj = self->_timeInfo;
  objc_sync_enter(obj);
  [(SATelemetryManager *)self setValue:(char *)[(SATelemetryManager *)self getValueForTimeInfoEntry:a4] + a3 forTimeInfoEntry:a4];
  objc_sync_exit(obj);
}

- (void)startTimeForTimeInfoEntry:(int64_t)a3
{
  id v5 = self->_timeInfo;
  objc_sync_enter(v5);
  times = self->_times;
  BOOL v7 = +[NSNumber numberWithInteger:a3];
  BOOL v8 = [(NSMutableDictionary *)times objectForKey:v7];

  if (v8)
  {
    id v9 = SALog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100033C50();
    }
  }
  else
  {
    id v10 = self->_times;
    id v9 = +[NSDate date];
    v11 = +[NSNumber numberWithInteger:a3];
    [(NSMutableDictionary *)v10 setObject:v9 forKey:v11];
  }
  objc_sync_exit(v5);
}

- (double)stopTimeForTimeInfoEntry:(int64_t)a3
{
  id v5 = self->_timeInfo;
  objc_sync_enter(v5);
  times = self->_times;
  BOOL v7 = +[NSNumber numberWithInteger:a3];
  BOOL v8 = [(NSMutableDictionary *)times objectForKey:v7];

  if (v8)
  {
    id v9 = +[NSDate date];
    [v9 timeIntervalSinceDate:v8];
    double v11 = v10;

    [(SATelemetryManager *)self addValue:(unint64_t)(v11 * 1000.0) forTimeInfoEntry:a3];
  }
  else
  {
    BOOL v12 = SALog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100033CD0();
    }

    double v11 = 0.0;
  }

  objc_sync_exit(v5);
  return v11;
}

- (id)dictionaryDescription
{
  appsInfo = self->_appsInfo;
  id v4 = [(SATelemetryManager *)self getTotalsInfoTranslatedDictionary];
  id v5 = [(SATelemetryManager *)self getTotalsDirstatInfoTranslatedDictionary];
  BOOL v6 = [(SATelemetryManager *)self getTimeInfoTranslatedDictionary];
  BOOL v7 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:appsInfo, @"AppsInfo", v4, @"TotalsInfo", v5, @"TotalDirstatsInfo", v6, @"TimeInfo", self->_thirdPartyfilteredInfo, @"ThirdPartyFilteredInfo", 0];

  return v7;
}

- (id)sortAppsInfo:(id)a3 by:(int64_t)a4 withOption:(int64_t)a5
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002A158;
  v7[3] = &unk_10004D448;
  v7[4] = self;
  v7[5] = a4;
  id v5 = objc_msgSend(a3, "sortedArrayUsingComparator:", v7, a4, a5);
  return v5;
}

- (id)getFirstPartyAppsInfoKeys
{
  v3 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = self->_appsInfo;
  id v4 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(obj);
        }
        BOOL v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v9 = +[NSSet setWithObject:v8];
        double v10 = [(SATelemetryManager *)self getVendorValueforBundleSet:v9];

        if (([v10 isEqualToString:@"Apple"] & 1) != 0
          || ([v8 isEqualToString:@"com.apple.fakeapp.SystemData"] & 1) != 0
          || ([v8 isEqualToString:@"com.apple.fakeapp.SoftwareUpdate"] & 1) != 0
          || ([v8 isEqualToString:@"com.apple.fakeapp.System"] & 1) != 0
          || [v8 isEqualToString:@"com.apple.fakeapp.SyncedContent"])
        {
          [v3 addObject:v8];
        }
      }
      id v5 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  return v3;
}

- (id)getThirdPartyAppsInfoKeys
{
  id v16 = (id)objc_opt_new();
  id v17 = self;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v3 = self->_appsInfo;
  id v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    id v5 = v4;
    CFStringRef v6 = @"com.apple.fakeapp.System";
    uint64_t v7 = *(void *)v19;
    CFStringRef v8 = @"com.apple.fakeapp.SyncedContent";
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v3);
        }
        double v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isEqualToString:", @"com.apple.fakeapp.SystemData", v16) & 1) == 0
          && ([v10 isEqualToString:@"com.apple.fakeapp.SoftwareUpdate"] & 1) == 0
          && ([v10 isEqualToString:v6] & 1) == 0
          && ([v10 isEqualToString:v8] & 1) == 0)
        {
          CFStringRef v11 = v6;
          CFStringRef v12 = v8;
          long long v13 = +[NSSet setWithObject:v10];
          long long v14 = [(SATelemetryManager *)v17 getVendorValueforBundleSet:v13];

          if (([v14 isEqualToString:@"Apple"] & 1) == 0) {
            [v16 addObject:v10];
          }

          CFStringRef v8 = v12;
          CFStringRef v6 = v11;
        }
      }
      id v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }

  return v16;
}

- (id)fillFilteredInfoDict:(id)a3 withNumberOfApps:(unint64_t)a4 withAppInfoArr:(id)a5 withFilterCriteria:(int64_t)a6 withMetricType:(id)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a7;
  if ((unint64_t)[v12 count] <= a4)
  {
    id v39 = v12;
  }
  else
  {
    int64_t v41 = a6;
    id v42 = v13;
    v43 = v12;
    objc_msgSend(v12, "subarrayWithRange:", a4, (char *)objc_msgSend(v12, "count") - a4);
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v47 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
    if (v47)
    {
      uint64_t v45 = *(void *)v54;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v54 != v45) {
            objc_enumerationMutation(obj);
          }
          uint64_t v48 = v14;
          long long v15 = [(NSMutableDictionary *)self->_appsInfo valueForKey:*(void *)(*((void *)&v53 + 1) + 8 * v14)];
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          id v16 = [v15 countByEnumeratingWithState:&v49 objects:v57 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v50;
            do
            {
              for (i = 0; i != v17; i = (char *)i + 1)
              {
                if (*(void *)v50 != v18) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v20 = *(void *)(*((void *)&v49 + 1) + 8 * i);
                long long v21 = [v15 valueForKey:v20];
                objc_opt_class();
                char isKindOfClass = objc_opt_isKindOfClass();

                if (isKindOfClass)
                {
                  v23 = [v15 valueForKey:v20];
                  id v24 = (char *)[v23 longLongValue];
                  uint64_t v25 = [v11 valueForKey:v20];
                  id v26 = (void *)v25;
                  if (v25) {
                    uint64_t v25 = (uint64_t)[(id)v25 longLongValue];
                  }
                  uint64_t v27 = +[NSNumber numberWithUnsignedLongLong:&v24[v25]];
                  [v11 setValue:v27 forKey:v20];
                }
              }
              id v17 = [v15 countByEnumeratingWithState:&v49 objects:v57 count:16];
            }
            while (v17);
          }

          uint64_t v14 = v48 + 1;
        }
        while ((id)(v48 + 1) != v47);
        id v47 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
      }
      while (v47);
    }
    uint64_t v28 = [(SATelemetryManager *)self getTelAppInfoTranslation:0];
    id v13 = v42;
    [v11 setValue:v42 forKey:v28];

    runSignature = self->_runSignature;
    v30 = [(SATelemetryManager *)self getTelAppInfoTranslation:1];
    [v11 setValue:runSignature forKey:v30];

    icloudPlan = self->_icloudPlan;
    v32 = [(SATelemetryManager *)self getTelAppInfoTranslation:4];
    [v11 setValue:icloudPlan forKey:v32];

    long long v33 = +[NSNumber numberWithUnsignedLongLong:self->_SAFOptions];
    long long v34 = [(SATelemetryManager *)self getTelAppInfoTranslation:5];
    [v11 setValue:v33 forKey:v34];

    long long v35 = [(SATelemetryManager *)self getTelAppInfoTranslation:v41];
    long long v36 = [(SATelemetryManager *)self getTelAppInfoTranslation:2];
    [v11 setValue:v35 forKey:v36];

    long long v37 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [obj count]);
    long long v38 = [(SATelemetryManager *)self getTelAppInfoTranslation:6];
    [v11 setValue:v37 forKey:v38];

    id v12 = v43;
    objc_msgSend(v43, "subarrayWithRange:", 0, a4);
    id v39 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v39;
}

- (id)setAppInfoDictWithFirstPartyAppsKeys:(id)a3 WithThirdPartyAppKeys:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFStringRef v8 = objc_opt_new();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v6;
  id v9 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v9)
  {
    id v10 = v9;
    id v26 = v7;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v33;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        long long v15 = +[NSSet setWithObject:](NSSet, "setWithObject:", v14, v26);
        [(SATelemetryManager *)self setValue:(char *)i + v11 forAppInfoEntry:6 forBundleSet:v15];

        id v16 = [(NSMutableDictionary *)self->_appsInfo objectForKey:v14];
        [v8 addObject:v16];
      }
      id v10 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
      v11 += (uint64_t)i;
    }
    while (v10);
    id v7 = v26;
  }
  else
  {
    uint64_t v11 = 0;
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v17 = v7;
  id v18 = [v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v29;
    do
    {
      for (j = 0; j != v19; j = (char *)j + 1)
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v28 + 1) + 8 * (void)j);
        v23 = +[NSSet setWithObject:v22];
        [(SATelemetryManager *)self setValue:(char *)j + v11 forAppInfoEntry:6 forBundleSet:v23];

        id v24 = [(NSMutableDictionary *)self->_appsInfo objectForKey:v22];
        [v8 addObject:v24];
      }
      id v19 = [v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
      v11 += (uint64_t)j;
    }
    while (v19);
  }

  return v8;
}

- (void)removeAppsWithMultipleVendors
{
  id v3 = [(NSMutableDictionary *)self->_appsInfo copy];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002AD3C;
  v4[3] = &unk_10004D470;
  v4[4] = self;
  [v3 enumerateKeysAndObjectsUsingBlock:v4];
}

- (void)sendTelemetry:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SATelemetryManager *)self hasResultsError];
  if (+[SATapToRadar forceTTR] || v4) {
    +[SATapToRadar sendTapToRadarNotificationWithDescription:v4 highPriorityProblem:0];
  }
  timeInfo = self->_timeInfo;
  id v6 = [(SATelemetryManager *)self getTelTimeInfoTranslation:0];
  if (v3) {
    CFStringRef v7 = @"daily-activity-time-info";
  }
  else {
    CFStringRef v7 = @"user-time-info";
  }
  [(NSMutableDictionary *)timeInfo setValue:v7 forKey:v6];

  [(SATelemetryManager *)self removeAppsWithMultipleVendors];
  [(SATelemetryManager *)self setValue:[(SATelemetryManager *)self appsNumber] forTotalsInfoEntry:4];
  CFStringRef v8 = +[SASupport getEnterpriseVolumesPaths];
  -[SATelemetryManager setValue:forTotalsInfoEntry:](self, "setValue:forTotalsInfoEntry:", [v8 count], 5);

  [(SATelemetryManager *)self setValue:[(SATelemetryManager *)self appsNumber] forTimeInfoEntry:2];
  id v9 = [(SATelemetryManager *)self getFirstPartyAppsInfoKeys];
  id v10 = [(SATelemetryManager *)self sortAppsInfo:v9 by:22 withOption:1];
  uint64_t v11 = +[NSArray arrayWithArray:v10];

  uint64_t v12 = [(SATelemetryManager *)self getThirdPartyAppsInfoKeys];
  id v13 = [(SATelemetryManager *)self sortAppsInfo:v12 by:22 withOption:1];
  uint64_t v14 = +[NSArray arrayWithArray:v13];

  if ((byte_10005AB68 & 1) == 0)
  {
    uint64_t v15 = [(SATelemetryManager *)self fillFilteredInfoDict:self->_thirdPartyfilteredInfo withNumberOfApps:10 withAppInfoArr:v14 withFilterCriteria:22 withMetricType:@"filtered-third-party-apps-info"];

    uint64_t v16 = [(SATelemetryManager *)self fillFilteredInfoDict:self->_firstPartyfilteredInfo withNumberOfApps:285 withAppInfoArr:v11 withFilterCriteria:22 withMetricType:@"filtered-first-party-apps-info"];

    uint64_t v14 = (void *)v15;
    uint64_t v11 = (void *)v16;
  }
  [(SATelemetryManager *)self saveTelemetryDataToDisk:v11 thirdPartyAppKeys:v14];
  id v17 = self;
  if (+[SATelemetryManager shouldSendTelemetry:v3]
    || +[SAVolumeScanner shouldForceTelemetry])
  {
    id v18 = SALog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Sending telemetry", buf, 2u);
    }

    v75 = _NSConcreteStackBlock;
    uint64_t v76 = 3221225472;
    v77 = sub_10002B6A4;
    v78 = &unk_10004D120;
    v79 = self;
    if ((AnalyticsSendEventLazy() & 1) == 0)
    {
      id v19 = SALog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_100033E20();
      }

      id v17 = self;
    }
    v70 = _NSConcreteStackBlock;
    uint64_t v71 = 3221225472;
    v72 = sub_10002B6AC;
    v73 = &unk_10004D120;
    v74 = v17;
    if ((AnalyticsSendEventLazy() & 1) == 0)
    {
      uint64_t v20 = SALog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_100033DEC();
      }

      id v17 = self;
    }
    v65 = _NSConcreteStackBlock;
    uint64_t v66 = 3221225472;
    v67 = sub_10002B6B4;
    v68 = &unk_10004D120;
    v69 = v17;
    if ((AnalyticsSendEventLazy() & 1) == 0)
    {
      long long v21 = SALog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_100033DB8();
      }

      id v17 = self;
    }
    v60 = _NSConcreteStackBlock;
    uint64_t v61 = 3221225472;
    v62 = sub_10002B6BC;
    v63 = &unk_10004D120;
    v64 = v17;
    if ((AnalyticsSendEventLazy() & 1) == 0)
    {
      uint64_t v22 = SALog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_100033D84();
      }

      id v17 = self;
    }
    long long v55 = _NSConcreteStackBlock;
    uint64_t v56 = 3221225472;
    v57 = sub_10002B6C4;
    v58 = &unk_10004D120;
    v59 = v17;
    if ((AnalyticsSendEventLazy() & 1) == 0)
    {
      v23 = SALog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_100033D50();
      }

      id v17 = self;
    }
    id v39 = v4;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v38 = v14;
    id v24 = v14;
    id v25 = [v24 countByEnumeratingWithState:&v51 objects:v83 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v52;
      do
      {
        long long v28 = 0;
        do
        {
          if (*(void *)v52 != v27) {
            objc_enumerationMutation(v24);
          }
          uint64_t v29 = *(void *)(*((void *)&v51 + 1) + 8 * (void)v28);
          uint64_t v45 = _NSConcreteStackBlock;
          uint64_t v46 = 3221225472;
          id v47 = sub_10002B6CC;
          uint64_t v48 = &unk_10004D498;
          long long v49 = v17;
          uint64_t v50 = v29;
          if ((AnalyticsSendEventLazy() & 1) == 0)
          {
            long long v30 = SALog();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v82 = v29;
              _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "FAILED to log %@ appInfo using AnalyticsSendEventLazy\n", buf, 0xCu);
            }

            id v17 = self;
          }
          long long v28 = (char *)v28 + 1;
        }
        while (v26 != v28);
        id v26 = [v24 countByEnumeratingWithState:&v51 objects:v83 count:16];
      }
      while (v26);
    }

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v31 = v11;
    id v32 = [v31 countByEnumeratingWithState:&v41 objects:v80 count:16];
    if (v32)
    {
      id v33 = v32;
      uint64_t v34 = *(void *)v42;
      do
      {
        long long v35 = 0;
        do
        {
          if (*(void *)v42 != v34) {
            objc_enumerationMutation(v31);
          }
          uint64_t v36 = *(void *)(*((void *)&v41 + 1) + 8 * (void)v35);
          if ((AnalyticsSendEventLazy() & 1) == 0)
          {
            long long v37 = SALog();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v82 = v36;
              _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "FAILED to log %@ appInfo using AnalyticsSendEventLazy\n", buf, 0xCu);
            }
          }
          long long v35 = (char *)v35 + 1;
        }
        while (v33 != v35);
        id v33 = [v31 countByEnumeratingWithState:&v41 objects:v80 count:16];
      }
      while (v33);
    }

    +[SATelemetryManager updateLastSentTelemetryDate:v3];
    id v4 = v39;
    uint64_t v14 = v38;
  }
}

+ (id)SATelAppInfoTranslationTable
{
  if (qword_10005AB78 != -1) {
    dispatch_once(&qword_10005AB78, &stru_10004D4B8);
  }
  v2 = (void *)qword_10005AB70;
  return v2;
}

+ (id)SATelTotalsInfoTranslationTable
{
  if (qword_10005AB88 != -1) {
    dispatch_once(&qword_10005AB88, &stru_10004D4D8);
  }
  v2 = (void *)qword_10005AB80;
  return v2;
}

+ (id)SATelTotalsDirStatsInfoTranslationTable
{
  if (qword_10005AB98 != -1) {
    dispatch_once(&qword_10005AB98, &stru_10004D4F8);
  }
  v2 = (void *)qword_10005AB90;
  return v2;
}

+ (id)SATelTimeInfoTranslationTable
{
  if (qword_10005ABA8 != -1) {
    dispatch_once(&qword_10005ABA8, &stru_10004D518);
  }
  v2 = (void *)qword_10005ABA0;
  return v2;
}

- (id)getTelAppInfoTranslation:(int64_t)a3
{
  id v4 = +[SATelemetryManager SATelAppInfoTranslationTable];
  id v5 = +[NSNumber numberWithInteger:a3];
  id v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

- (id)getTelTotalsInfoTranslation:(int64_t)a3
{
  id v4 = +[SATelemetryManager SATelTotalsInfoTranslationTable];
  id v5 = +[NSNumber numberWithInteger:a3];
  id v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

- (id)getTelTotalsDirStatsInfoTranslation:(int64_t)a3
{
  id v4 = +[SATelemetryManager SATelTotalsDirStatsInfoTranslationTable];
  id v5 = +[NSNumber numberWithInteger:a3];
  id v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

- (id)getTelTimeInfoTranslation:(int64_t)a3
{
  id v4 = +[SATelemetryManager SATelTimeInfoTranslationTable];
  id v5 = +[NSNumber numberWithInteger:a3];
  id v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

- (id)hasResultsError
{
  unint64_t v3 = [(SATelemetryManager *)self getValueForTotalsInfoEntry:18];
  if (v3 <= 0x640000000)
  {
    if (v3 == 0x40000000)
    {
      SALog();
      id obj = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&obj->super.super, OS_LOG_TYPE_ERROR)) {
        sub_100033EC8(&obj->super.super, v5, v6, v7, v8, v9, v10, v11);
      }
      id v4 = @"SystemData size is negative";
    }
    else
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id obj = self->_appsInfo;
      id v25 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v25)
      {
        uint64_t v24 = *(void *)v31;
        do
        {
          for (i = 0; i != v25; i = (char *)i + 1)
          {
            if (*(void *)v31 != v24) {
              objc_enumerationMutation(obj);
            }
            id v13 = [(NSMutableDictionary *)self->_appsInfo objectForKey:*(void *)(*((void *)&v30 + 1) + 8 * i)];
            long long v26 = 0u;
            long long v27 = 0u;
            long long v28 = 0u;
            long long v29 = 0u;
            id v14 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
            if (v14)
            {
              id v15 = v14;
              uint64_t v16 = *(void *)v27;
              do
              {
                for (j = 0; j != v15; j = (char *)j + 1)
                {
                  if (*(void *)v27 != v16) {
                    objc_enumerationMutation(v13);
                  }
                  id v18 = *(void **)(*((void *)&v26 + 1) + 8 * (void)j);
                  id v19 = [(SATelemetryManager *)self getTelAppInfoTranslation:8];
                  unsigned __int8 v20 = [v18 isEqualToString:v19];

                  if ((v20 & 1) == 0)
                  {
                    long long v21 = [v13 objectForKey:v18];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass()) {
                      [v21 longLongValue];
                    }
                  }
                }
                id v15 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
              }
              while (v15);
            }
          }
          id v25 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v30 objects:v35 count:16];
        }
        while (v25);
      }
      id v4 = 0;
    }
  }
  else
  {
    id v4 = +[NSString stringWithFormat:@"SystemData size: %llu > %llu", v3, 0x640000000];
    SALog();
    id obj = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&obj->super.super, OS_LOG_TYPE_ERROR)) {
      sub_100033E54();
    }
  }

  return v4;
}

+ (void)updateLastSentTelemetryDate:(BOOL)a3
{
  unint64_t v3 = @"lastUserSentTelemetryDate";
  if (a3) {
    unint64_t v3 = @"lastDailyActivitySentTelemetryDate";
  }
  id v4 = v3;
  id v5 = +[NSDate date];
  +[SARunTimeDataManager setRunTimeDataObject:v5 forKey:v4];
}

+ (id)getLastSentTelemetryDate:(BOOL)a3
{
  if (a3) {
    CFStringRef v3 = @"lastDailyActivitySentTelemetryDate";
  }
  else {
    CFStringRef v3 = @"lastUserSentTelemetryDate";
  }
  return +[SARunTimeDataManager runTimeDataObjectForKey:v3];
}

+ (BOOL)shouldSendTelemetry:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[SATelemetryManager getLastSentTelemetryDate:](SATelemetryManager, "getLastSentTelemetryDate:");
  if (v4)
  {
    if (v3) {
      double v5 = 86400.0;
    }
    else {
      double v5 = 604800.0;
    }
    uint64_t v6 = +[NSDate date];
    [v6 timeIntervalSinceDate:v4];
    BOOL v8 = v7 >= v5;
  }
  else
  {
    +[SATelemetryManager updateLastSentTelemetryDate:v3];
    BOOL v8 = 0;
  }

  return v8;
}

- (void)saveTelemetryDataToDisk:(id)a3 thirdPartyAppKeys:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = +[NSFileManager defaultManager];
  id v26 = 0;
  unsigned __int8 v9 = [v8 createDirectoryAtPath:@"/var/db/spaceattribution" withIntermediateDirectories:1 attributes:0 error:&v26];
  id v10 = v26;
  if (v9)
  {
    uint64_t v11 = [(SATelemetryManager *)self setAppInfoDictWithFirstPartyAppsKeys:v6 WithThirdPartyAppKeys:v7];
    uint64_t v12 = [(SATelemetryManager *)self dictionaryDescription];
    [v12 setObject:v11 forKey:@"AppsInfo"];
    id v25 = v10;
    id v13 = +[NSJSONSerialization dataWithJSONObject:v12 options:1 error:&v25];
    id v14 = v25;

    if (v14)
    {
      id v15 = SALog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_100033FC8();
      }
    }
    else
    {
      v23 = +[NSString stringWithFormat:@"%@/%@", @"/var/db/spaceattribution", @"SpaceAttributionTelemetryData.json"];
      id v24 = 0;
      [v13 writeToFile:v23 options:1 error:&v24];
      id v14 = v24;

      if (!v14)
      {
LABEL_11:

        id v10 = v14;
        goto LABEL_12;
      }
      id v15 = SALog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_100033F54();
      }
    }

    goto LABEL_11;
  }
  uint64_t v11 = SALog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_10003403C(v11, v16, v17, v18, v19, v20, v21, v22);
  }
LABEL_12:
}

+ (void)getLastTelemetryData:(id)a3
{
  BOOL v3 = (void (**)(id, void, id))a3;
  id v4 = +[NSString stringWithFormat:@"%@/%@", @"/var/db/spaceattribution", @"SpaceAttributionTelemetryData.json"];
  id v13 = 0;
  double v5 = +[NSData dataWithContentsOfFile:v4 options:0 error:&v13];
  id v6 = v13;

  if (v6) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v5 == 0;
  }
  if (v7)
  {
    BOOL v8 = SALog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000340C8();
    }

    v3[2](v3, 0, v6);
  }
  else
  {
    id v12 = 0;
    unsigned __int8 v9 = +[NSJSONSerialization JSONObjectWithData:v5 options:0 error:&v12];
    id v10 = v12;
    id v6 = v10;
    if (v10)
    {
      uint64_t v11 = SALog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10003413C();
      }
    }
    ((void (**)(id, void *, id))v3)[2](v3, v9, v6);
  }
}

- (id)getTimeInfoTranslatedDictionary
{
  if (qword_10005ABB8 != -1) {
    dispatch_once(&qword_10005ABB8, &stru_10004D538);
  }
  BOOL v3 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = self->_timeInfo;
  id v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        id v10 = -[NSMutableDictionary objectForKey:](self->_timeInfo, "objectForKey:", v9, (void)v13);
        uint64_t v11 = [(id)qword_10005ABB0 objectForKey:v9];
        [v3 setValue:v10 forKey:v11];
      }
      id v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)getTotalsDirstatInfoTranslatedDictionary
{
  if (qword_10005ABC8 != -1) {
    dispatch_once(&qword_10005ABC8, &stru_10004D558);
  }
  BOOL v3 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = self->_totalsDstatsInfo;
  id v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        id v10 = -[NSMutableDictionary objectForKey:](self->_totalsDstatsInfo, "objectForKey:", v9, (void)v13);
        uint64_t v11 = [(id)qword_10005ABC0 objectForKey:v9];
        [v3 setValue:v10 forKey:v11];
      }
      id v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)getTotalsInfoTranslatedDictionary
{
  if (qword_10005ABD8 != -1) {
    dispatch_once(&qword_10005ABD8, &stru_10004D578);
  }
  BOOL v3 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = self->_totalsInfo;
  id v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        id v10 = -[NSMutableDictionary objectForKey:](self->_totalsInfo, "objectForKey:", v9, (void)v13);
        uint64_t v11 = [(id)qword_10005ABD0 objectForKey:v9];
        [v3 setValue:v10 forKey:v11];
      }
      id v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

+ (void)clearLastTelemetryData:(id)a3
{
  BOOL v3 = (void (**)(id, id))a3;
  id v4 = +[NSFileManager defaultManager];
  id v5 = +[NSString stringWithFormat:@"%@/%@", @"/var/db/spaceattribution", @"SpaceAttributionTelemetryData.json"];
  id v7 = 0;
  [v4 removeItemAtPath:v5 error:&v7];
  id v6 = v7;

  v3[2](v3, v6);
}

+ (void)disableAppsFiltering
{
  byte_10005AB68 = 1;
}

+ (void)setAppsFilteringToDefault
{
  byte_10005AB68 = 0;
}

- (NSMutableDictionary)appsInfo
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAppsInfo:(id)a3
{
}

- (NSMutableDictionary)totalsInfo
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTotalsInfo:(id)a3
{
}

- (NSMutableDictionary)totalsDstatsInfo
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTotalsDstatsInfo:(id)a3
{
}

- (NSMutableDictionary)timeInfo
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTimeInfo:(id)a3
{
}

- (NSMutableDictionary)firstPartyfilteredInfo
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFirstPartyfilteredInfo:(id)a3
{
}

- (NSMutableDictionary)thirdPartyfilteredInfo
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setThirdPartyfilteredInfo:(id)a3
{
}

- (NSNumber)icloudPlan
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setIcloudPlan:(id)a3
{
}

- (unint64_t)appsNumber
{
  return self->_appsNumber;
}

- (void)setAppsNumber:(unint64_t)a3
{
  self->_appsNumber = a3;
}

- (NSMutableDictionary)times
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTimes:(id)a3
{
}

- (NSString)runSignature
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setRunSignature:(id)a3
{
}

- (unint64_t)SAFOptions
{
  return self->_SAFOptions;
}

- (void)setSAFOptions:(unint64_t)a3
{
  self->_SAFOptions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runSignature, 0);
  objc_storeStrong((id *)&self->_times, 0);
  objc_storeStrong((id *)&self->_icloudPlan, 0);
  objc_storeStrong((id *)&self->_thirdPartyfilteredInfo, 0);
  objc_storeStrong((id *)&self->_firstPartyfilteredInfo, 0);
  objc_storeStrong((id *)&self->_timeInfo, 0);
  objc_storeStrong((id *)&self->_totalsDstatsInfo, 0);
  objc_storeStrong((id *)&self->_totalsInfo, 0);
  objc_storeStrong((id *)&self->_appsInfo, 0);
}

@end