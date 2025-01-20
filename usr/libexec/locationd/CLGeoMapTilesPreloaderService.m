@interface CLGeoMapTilesPreloaderService
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)fetchLOIFromCoreRoutine;
- (BOOL)isAggressiveSettingDataDownloadLimitCrossed:(const CLMapMatcherGeoTilesPrecachingConfig *)a3 building:(BOOL)a4;
- (BOOL)setCoarseCoordinatesFromDefaultsWriteEntry;
- (BOOL)shouldUseAggressiveSettings;
- (CLGeoMapTilesPreloaderService)init;
- (CLMapMatcherGeoTilesPrecachingConfig)getConfigFromMobileAssets;
- (CLMatrixIndex)getInsideOutSpiralMatrixIndicesForSection:(int)a3 matrixSize:(int)a4;
- (CLTileDownloadSection)getSectionCoordinate:(SEL)a3 aroundLatitude:(int)a4 longitude:(double)a5 radius:(double)a6 sectionRadius:(double)a7 useInsideOutDownload:(double)a8;
- (id).cxx_construct;
- (id)getCountryCode;
- (int)getPersistentStoreDataCount;
- (int)getPersistentStoreDataCountForType:(int)a3;
- (int)getSectionNotDownloadedYet:()map<int maxSections:()double;
- (int)getSectionToBeRefreshed:()map<int maxSections:()double refreshPeriod:()std:(std:(double>>> *)a3 :(int)a4 allocator<std:(int)a5 :pair<const)int :less<int>;
- (uint64_t)onDataProtectionNotification:(int)a3 data:(int)a4;
- (uint64_t)onMotionStateMediatorNotification:(int)a3 data:(uint64_t)a4;
- (void)addFakeNPLOIDataForTesting:(CLMapMatcherGeoTilesPrecachingConfig *)a3;
- (void)addGeoMapDataSubscriptionForType:(int)a3 latitude:(double)a4 longitude:(double)a5 config:(CLMapMatcherGeoTilesPrecachingConfig *)a6 nploiIndex:(int)a7;
- (void)beginService;
- (void)clearPersistentStore:(BOOL)a3;
- (void)computeCoarseLocationAndStore:(id)a3;
- (void)computeCoarseLocationAndStoreForType:(int)a3 latitude:(double)a4 longitude:(double)a5 altitude:(double)a6 horizontalAccuracy:(double)a7 verticalAccuracy:(double)a8 referenceFrame:(int)a9 config:(CLMapMatcherGeoTilesPrecachingConfig *)a10 nploiIndex:(int)a11;
- (void)downloadTilesOnXPCFire;
- (void)endService;
- (void)fetchCoarseLocationForNextLOI:(int)a3;
- (void)fetchLOIForType:(int64_t)a3 isSecondTry:(BOOL)a4;
- (void)fetchNPLOI;
- (void)fetchWorkoutCount:(BOOL)a3;
- (void)logRTLocationOfInterest:(id)a3 type:(id)a4;
- (void)onClientManagerNotification:(int)a3 data:(uint64_t)a4;
- (void)onDaemonStatusNotification:(int)a3 data:(int *)a4;
- (void)onLocationNotification:(int)a3 data:(uint64_t)a4;
- (void)onMobileAssetNotification:(int)a3 data:(uint64_t)a4;
- (void)onWifiServiceNotification:(int)a3 data:(uint64_t)a4;
- (void)preloadSectionTilesAtLatitude:(double)a3 longitude:(double)a4 config:(CLMapMatcherGeoTilesPrecachingConfig *)a5 type:(int)a6 building:(BOOL)a7 section:(int)a8 numberOfsectionsToDownload:(int)a9 loiSectionData:(void *)a10;
- (void)preloadTilesAPICallForSection:(CLTileDownloadSection *)a3 sectionDownloadRadius:(double)a4 maxSectionIndex:(int)a5 building:(BOOL)a6 matcherLOIType:(int)a7 config:(CLMapMatcherGeoTilesPrecachingConfig *)a8 completionHandler:(id)a9;
- (void)preloadTilesAPICallForSectionWithSECheck:(CLTileDownloadSection *)a3 sectionDownloadRadius:(double)a4 maxSectionIndex:(int)a5 building:(BOOL)a6 matcherLOIType:(int)a7 config:(CLMapMatcherGeoTilesPrecachingConfig *)a8 completionHandler:(id)a9;
- (void)pullDataFromPersistentStore;
- (void)registerForClientManagerNotification;
- (void)registerForDaemonStatusNotification;
- (void)registerForDataProtectionNotification;
- (void)registerForLocationNotification;
- (void)registerForMobileAssetNotification;
- (void)registerForMotionStateMediatorNotification;
- (void)registerForRoutineMonitor;
- (void)registerForTrackRunEnablementNotifications;
- (void)registerForWifiServiceNotification;
- (void)removeTrackRunSubscriptionForType:(int)a3 nploiIndex:(int)a4;
- (void)setNewCriteria:(int)a3;
- (void)setUpRepeatingActivityToDownloadTiles;
- (void)setXPCActivityToDone;
- (void)storeDataInPersistentStore;
- (void)unregisterForClientManagerNotification;
- (void)unregisterForDaemonStatusNotification;
- (void)unregisterForDataProtectionNotification;
- (void)unregisterForLocationNotification;
- (void)unregisterForMobileAssetNotification;
- (void)unregisterForMotionStateMediatorNotification;
- (void)unregisterForRoutineMonitor;
- (void)unregisterForTrackRunEnablementNotifications;
- (void)unregisterForWifiServiceNotification;
- (void)unregisterXPCActivity:(BOOL)a3;
@end

@implementation CLGeoMapTilesPreloaderService

- (void)fetchWorkoutCount:(BOOL)a3
{
  BOOL v3 = a3;
  p_fTotalNPLOISectionDownloads = &self->fAnalytics.fTotalNPLOISectionDownloads;
  v33 = &self->fAnalytics.fTotalNPLOISectionDownloads;
  (*(void (**)(int64_t *, SEL))(self->fAnalytics.fTotalNPLOISectionDownloads + 16))(&self->fAnalytics.fTotalNPLOISectionDownloads, a2);
  __int16 v34 = 256;
  v6 = &OBJC_IVAR___CLGeoMapTilesPreloaderService_fTimeOfLastWorkoutQueryOnDeviceUnlock;
  if (!v3) {
    v6 = &OBJC_IVAR___CLGeoMapTilesPreloaderService_fTimeOfLastWorkoutQuery;
  }
  uint64_t v7 = *v6;
  double Current = CFAbsoluteTimeGetCurrent();
  double v9 = vabdd_f64(Current, *(double *)&self->CLIntersiloService_opaque[v7]);
  if (v9 >= 10800.0)
  {
    *(double *)&self->CLIntersiloService_opaque[v7] = Current;
    [(CLGeoMapTilesPreloaderService *)self getConfigFromMobileAssets];
    if (sub_1014A9AA4((uint64_t)v37))
    {
      v16 = +[NSDate now];
      int v28 = v44;
      v29 = +[HKQuery predicateForSamplesWithStartDate:endDate:options:](HKQuery, "predicateForSamplesWithStartDate:endDate:options:", +[NSDate dateWithTimeInterval:v16 sinceDate:(double)(-86400 * v44)], v16, 3);
      v27 = v16;
      id v17 = +[HKQuery _predicateForObjectsFromAppleWatches];
      v18 = +[HKQuery predicateForWorkoutsWithActivityPredicate:](HKQuery, "predicateForWorkoutsWithActivityPredicate:", +[HKQuery predicateForWorkoutActivitiesWithWorkoutActivityType:52]);
      v19 = +[HKQuery predicateForWorkoutsWithActivityPredicate:](HKQuery, "predicateForWorkoutsWithActivityPredicate:", +[HKQuery predicateForWorkoutActivitiesWithWorkoutActivityType:13]);
      v20 = +[HKQuery predicateForWorkoutsWithActivityPredicate:](HKQuery, "predicateForWorkoutsWithActivityPredicate:", +[HKQuery predicateForWorkoutActivitiesWithWorkoutActivityType:37]);
      v21 = +[HKQuery predicateForWorkoutsWithActivityPredicate:](HKQuery, "predicateForWorkoutsWithActivityPredicate:", +[HKQuery predicateForWorkoutActivitiesWithWorkoutActivityType:24]);
      v36[0] = v18;
      v36[1] = +[HKQuery predicateForWorkoutsWithActivityPredicate:](HKQuery, "predicateForWorkoutsWithActivityPredicate:", +[HKQuery predicateForWorkoutActivitiesWithWorkoutActivityType:70]);
      v36[2] = v19;
      v36[3] = v20;
      v36[4] = +[HKQuery predicateForWorkoutsWithActivityPredicate:](HKQuery, "predicateForWorkoutsWithActivityPredicate:", +[HKQuery predicateForWorkoutActivitiesWithWorkoutActivityType:71]);
      v36[5] = v21;
      v35[0] = v29;
      v35[1] = v17;
      v35[2] = +[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", +[NSArray arrayWithObjects:v36 count:6]);
      v22 = +[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:v35 count:3]);
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      v23 = qword_102419438;
      if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "CLGMTPS,setting up workout count query", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419430 != -1) {
          dispatch_once(&qword_102419430, &stru_102328DC8);
        }
        __int16 v32 = 0;
        v26 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService fetchWorkoutCount:]", "%s\n", v26);
        if (v26 != (char *)buf) {
          free(v26);
        }
      }
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_1014B8DB8;
      v30[3] = &unk_102328DA8;
      v30[4] = self;
      int v31 = v28;
      id v24 = [objc_alloc((Class)HKSampleQuery) initWithSampleType:+[HKSampleType workoutType](HKSampleType, "workoutType") predicate:v22 limit:0 sortDescriptors:0 resultsHandler:v30];
      [*(id *)&self->fTimeOfLastWorkoutQueryOnDeviceUnlock executeQuery:v24];
    }
    else
    {
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      v25 = qword_102419438;
      if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "CLGMTPS,skipped workout query,as aggressive caching is not allowed", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419430 != -1) {
          dispatch_once(&qword_102419430, &stru_102328DC8);
        }
        __int16 v32 = 0;
        v15 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService fetchWorkoutCount:]", "%s\n", v15);
        goto LABEL_28;
      }
    }
  }
  else
  {
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    v10 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = *(void *)&self->CLIntersiloService_opaque[v7];
      int value = self->fTotalTimeSpentDownloadingData.__tree_.__pair3_.__value_;
      *(_DWORD *)buf = 67240960;
      BOOL v46 = v3;
      __int16 v47 = 2050;
      uint64_t v48 = v11;
      __int16 v49 = 2050;
      double v50 = v9;
      __int16 v51 = 1026;
      int v52 = value;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "CLGMTPS,skipped workout query,unlocked,%{public}d,lastQueryTime,%{public}.1lf,timeSinceLastQuery,%{public}.1lf,numWorkouts,%{public}d", buf, 0x22u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      uint64_t v13 = *(void *)&self->CLIntersiloService_opaque[v7];
      int v14 = self->fTotalTimeSpentDownloadingData.__tree_.__pair3_.__value_;
      v37[0] = 67240960;
      v37[1] = v3;
      __int16 v38 = 2050;
      uint64_t v39 = v13;
      __int16 v40 = 2050;
      double v41 = v9;
      __int16 v42 = 1026;
      int v43 = v14;
      v15 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService fetchWorkoutCount:]", "%s\n", v15);
LABEL_28:
      if (v15 != (char *)buf) {
        free(v15);
      }
    }
  }
  (*(void (**)(int64_t *))(*p_fTotalNPLOISectionDownloads + 24))(p_fTotalNPLOISectionDownloads);
}

- (void)onLocationNotification:(int)a3 data:(uint64_t)a4
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1014B8054;
  v12[3] = &unk_102328D80;
  v12[4] = a1;
  if (a3 == 5)
  {
    uint64_t v5 = a1 + 360;
    int v6 = *(_DWORD *)(a1 + 560);
    sub_1001A459C(a1 + 360, a4, (uint64_t)v12, *(double *)(a1 + 752));
    int v7 = *(_DWORD *)(v5 + 200);
    if ((v6 == 2) != (v7 == 2)) {
      [(id)a1 setNewCriteria:*(unsigned int *)(a1 + 348)];
    }
    if (v7 != 2 && v6 == 2) {
      [(id)a1 unregisterForMotionStateMediatorNotification];
    }
    [(id)a1 fetchLOIFromCoreRoutine];
    [(id)a1 fetchNPLOI];
    [(id)a1 fetchWorkoutCount:0];
  }
  else
  {
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    v10 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67174657;
      int v16 = a3;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "CLGMTPS, received unhandled location notification,%{private}d", buf, 8u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      int v13 = 67174657;
      int v14 = a3;
      uint64_t v11 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService onLocationNotification:data:]", "%s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
    }
  }
}

- (id)getCountryCode
{
  id result = +[GEOCountryConfiguration sharedConfiguration];
  if (result)
  {
    return [result countryCode];
  }
  return result;
}

- (CLMapMatcherGeoTilesPrecachingConfig)getConfigFromMobileAssets
{
  sub_100197E58((uint64_t)retstr);
  id result = [(CLGeoMapTilesPreloaderService *)self getCountryCode];
  if (!result) {
    return result;
  }
  sub_100134750(__p, (char *)[(CLMapMatcherGeoTilesPrecachingConfig *)result UTF8String]);
  id result = (CLMapMatcherGeoTilesPrecachingConfig *)sub_100197F20((uint64_t **)&self->fMapMatcherMobileAssetReader, (const void **)__p, (uint64_t)retstr);
  char v6 = (char)result;
  if (v14 < 0)
  {
    operator delete(__p[0]);
    if (v6) {
      goto LABEL_4;
    }
  }
  else if (result)
  {
LABEL_4:
    int var12 = retstr->var12;
    int var13 = retstr->var13;
    if (self->fSettings.fMinimumBatteryLevel > 0) {
      int var12 = self->fSettings.fMinimumBatteryLevel;
    }
    self->fMinimumBatterylevel = var12;
    self->fMinimumBatteryLevelAggressiveMode = var13;
    int var15 = retstr->var15;
    self->fXPCDownloadInterval = retstr->var14;
    self->fDownloadSizePerSection = var15;
    int var17 = retstr->var17;
    self->fUploadSizePerSection = retstr->var16;
    self->fDownloadTimePerSection = var17;
    self->fIsDiskIntensiveActivity = retstr->var2;
    *(double *)&self->fTotalTimeSpentDownloadingData.__tree_.__pair1_.__value_.__left_ = (double)retstr->var25;
    if (self->fMinimumBatterylevel <= 24) {
      self->fMinimumBatterylevel = 25;
    }
    return result;
  }
  if (qword_102419430 != -1) {
    dispatch_once(&qword_102419430, &stru_102328DC8);
  }
  uint64_t v11 = qword_102419438;
  if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_INFO))
  {
    LOWORD(__p[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "CLGMTPS,precaching config not available, precaching not supported", (uint8_t *)__p, 2u);
  }
  id result = (CLMapMatcherGeoTilesPrecachingConfig *)sub_10013D1A0(115, 2);
  if (result)
  {
    bzero(__p, 0x65CuLL);
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    v12 = (char *)_os_log_send_and_compose_impl();
    id result = (CLMapMatcherGeoTilesPrecachingConfig *)sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService getConfigFromMobileAssets]", "%s\n", v12);
    if (v12 != (char *)__p) {
      free(v12);
    }
  }
  return result;
}

- (void)fetchNPLOI
{
  p_fTotalNPLOISectionDownloads = &self->fAnalytics.fTotalNPLOISectionDownloads;
  int v52 = &self->fAnalytics.fTotalNPLOISectionDownloads;
  (*(void (**)(int64_t *, SEL))(self->fAnalytics.fTotalNPLOISectionDownloads + 16))(&self->fAnalytics.fTotalNPLOISectionDownloads, a2);
  __int16 v53 = 256;
  if (self->fMapMatcherMobileAssetReader.fMapMatcherOperatingCountryConfig.__tree_.__pair3_.__value_)
  {
    [(CLGeoMapTilesPreloaderService *)self getConfigFromMobileAssets];
    p_fRoutineInfo = &self->fRoutineInfo;
    if (BYTE4(v41))
    {
      if (!sub_1014A70D8((uint64_t)&self->fRoutineInfo)) {
        goto LABEL_56;
      }
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      long long v37 = v48;
      long long v38 = v49;
      long long v39 = v50;
      long long v33 = v44;
      long long v34 = v45;
      long long v35 = v46;
      long long v36 = v47;
      long long v30 = v41;
      long long v31 = v42;
      v29[2] = sub_1014A7318;
      v29[3] = &unk_102328C88;
      v29[4] = self;
      int v40 = v51;
      long long v32 = v43;
      double v5 = sub_1014A801C((uint64_t)&self->fRoutineInfo);
      if (v5 < 0.0 || v5 > 21600.0)
      {
        if (qword_102419430 != -1) {
          dispatch_once(&qword_102419430, &stru_102328DC8);
        }
        char v14 = qword_102419438;
        if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134349056;
          double v65 = v5;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "CLGMTPS,NPLOI,current location not available to make query,%{public}.1lf", buf, 0xCu);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419430 != -1) {
            dispatch_once(&qword_102419430, &stru_102328DC8);
          }
          int v54 = 134349056;
          double v55 = v5;
          double v9 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService fetchNPLOI]", "%s\n", v9);
          goto LABEL_48;
        }
      }
      else if (*(double *)((char *)&self->fRoutineInfo.fLastUserLocation.coordinate.longitude + 4) <= 250.0)
      {
        int v16 = +[NSDate dateWithTimeIntervalSinceReferenceDate:*(double *)((char *)&self->fRoutineInfo.fLastUserLocation.courseAccuracy + 4)];
        id v17 = objc_alloc_init((Class)NSDateFormatter);
        [v17 setDateFormat:@"yyyy-MM-dd"];
        double v18 = COERCE_DOUBLE([v17 stringFromDate:v16]);
        id v19 = [v17 stringFromDate:[NSDate date]];
        if (qword_102419430 != -1) {
          dispatch_once(&qword_102419430, &stru_102328DC8);
        }
        v20 = qword_102419438;
        if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_INFO))
        {
          uint64_t v21 = *(void *)(&self->fRoutineInfo.fLastUserLocation.suitability + 1);
          uint64_t v22 = *(void *)((char *)&self->fRoutineInfo.fLastUserLocation.coordinate.latitude + 4);
          *(_DWORD *)buf = 138544387;
          double v65 = v18;
          __int16 v66 = 2114;
          id v67 = v19;
          __int16 v68 = 2049;
          uint64_t v69 = v21;
          __int16 v70 = 2049;
          uint64_t v71 = v22;
          __int16 v72 = 2050;
          double v73 = v5;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "CLGMTPS,NPLOI,requested,dataDate,%{public}@,todaysDate,%{public}@,LL,%{private}.7lf,%{private}.7lf,locationAge,%{public}.1lf", buf, 0x34u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419430 != -1) {
            dispatch_once(&qword_102419430, &stru_102328DC8);
          }
          uint64_t v26 = *(void *)(&self->fRoutineInfo.fLastUserLocation.suitability + 1);
          uint64_t v27 = *(void *)((char *)&self->fRoutineInfo.fLastUserLocation.coordinate.latitude + 4);
          int v54 = 138544387;
          double v55 = v18;
          __int16 v56 = 2114;
          id v57 = v19;
          __int16 v58 = 2049;
          uint64_t v59 = v26;
          __int16 v60 = 2049;
          uint64_t v61 = v27;
          __int16 v62 = 2050;
          double v63 = v5;
          int v28 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService fetchNPLOI]", "%s\n", v28);
          if (v28 != (char *)buf) {
            free(v28);
          }
        }
        self->fRoutineInfo.fDistanceCalc.fRefLatDegs = CFAbsoluteTimeGetCurrent();
        id v23 = objc_alloc((Class)CLLocation);
        CLLocationCoordinate2D v24 = CLLocationCoordinate2DMake(*(CLLocationDegrees *)(&self->fRoutineInfo.fLastUserLocation.suitability + 1), *(CLLocationDegrees *)((char *)&self->fRoutineInfo.fLastUserLocation.coordinate.latitude + 4));
        id v25 = [v23 initWithCoordinate:v16 altitude:v24.latitude horizontalAccuracy:v24.longitude verticalAccuracy:*(double *)((char *)&self->fRoutineInfo.fLastUserLocation.horizontalAccuracy + 4) timestamp:*(double *)((char *)&self->fRoutineInfo.fLastUserLocation.coordinate.longitude + 4) altitude:*(double *)((char *)&self->fRoutineInfo.fLastUserLocation.altitude + 4)];
        [(CLRoutineMonitorServiceProtocol *)self->fRoutineMonitor fetchNextPredictedLocationsOfInterestFromLocation:v25 startDate:+[NSDate date] timeInterval:v29 withReply:86400.0];
      }
      else
      {
        if (qword_102419430 != -1) {
          dispatch_once(&qword_102419430, &stru_102328DC8);
        }
        char v6 = qword_102419438;
        if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_INFO))
        {
          double v7 = *(double *)((char *)&p_fRoutineInfo->fLastUserLocation.coordinate.longitude + 4);
          *(_DWORD *)buf = 134349056;
          double v65 = v7;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "CLGMTPS,NPLOI,not requested as hunc is over threshold,%{public}.1lf", buf, 0xCu);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419430 != -1) {
            dispatch_once(&qword_102419430, &stru_102328DC8);
          }
          double v8 = *(double *)((char *)&p_fRoutineInfo->fLastUserLocation.coordinate.longitude + 4);
          int v54 = 134349056;
          double v55 = v8;
          double v9 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService fetchNPLOI]", "%s\n", v9);
LABEL_48:
          if (v9 != (char *)buf) {
            free(v9);
          }
        }
      }
    }
    else
    {
      *(_DWORD *)buf = 3;
      if (sub_100178BF0((uint64_t)&self->fRoutineInfo.fLOICoarseCoordinates, (int *)buf))
      {
        *(_DWORD *)buf = 3;
        sub_1014BBB18((uint64_t **)&self->fRoutineInfo.fLOICoarseCoordinates, (int *)buf);
        if (qword_102419430 != -1) {
          dispatch_once(&qword_102419430, &stru_102328DC8);
        }
        uint64_t v11 = qword_102419438;
        if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_DEBUG))
        {
          unint64_t value = p_fRoutineInfo->fLOICoarseCoordinates.__tree_.__pair3_.__value_;
          *(_DWORD *)buf = 134349056;
          double v65 = *(double *)&value;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "CLGMTPS,NPLOI caching not allowed, erased all NPLOI coordinates,size,%{public}ld", buf, 0xCu);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419430 != -1) {
            dispatch_once(&qword_102419430, &stru_102328DC8);
          }
          unint64_t v13 = p_fRoutineInfo->fLOICoarseCoordinates.__tree_.__pair3_.__value_;
          int v54 = 134349056;
          double v55 = *(double *)&v13;
          double v9 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService fetchNPLOI]", "%s\n", v9);
          goto LABEL_48;
        }
      }
      else
      {
        if (qword_102419430 != -1) {
          dispatch_once(&qword_102419430, &stru_102328DC8);
        }
        v15 = qword_102419438;
        if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "CLGMTPS,NPLOI caching not allowed", buf, 2u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419430 != -1) {
            dispatch_once(&qword_102419430, &stru_102328DC8);
          }
          LOWORD(v54) = 0;
          double v9 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService fetchNPLOI]", "%s\n", v9);
          goto LABEL_48;
        }
      }
    }
  }
  else
  {
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    v10 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "CLGMTPS,NPLOI query cancelled, mobile assets not received", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      LOWORD(v41) = 0;
      double v9 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService fetchNPLOI]", "%s\n", v9);
      goto LABEL_48;
    }
  }
LABEL_56:
  (*(void (**)(int64_t *))(*p_fTotalNPLOISectionDownloads + 24))(p_fTotalNPLOISectionDownloads);
}

- (BOOL)fetchLOIFromCoreRoutine
{
  if (self->fMapMatcherMobileAssetReader.fMapMatcherOperatingCountryConfig.__tree_.__pair3_.__value_)
  {
    p_fRoutineInfo = &self->fRoutineInfo;
    BOOL v4 = sub_100184C14(&self->fRoutineInfo.fLOICoarseCoordinateRequestMachContTime);
    if (v4)
    {
      if ([(CLGeoMapTilesPreloaderService *)self setCoarseCoordinatesFromDefaultsWriteEntry])
      {
        if (qword_102419430 != -1) {
          dispatch_once(&qword_102419430, &stru_102328DC8);
        }
        double v5 = qword_102419438;
        if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "CLGMTPS,using coordinates from defaults-write entry", buf, 2u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419430 != -1) {
            dispatch_once(&qword_102419430, &stru_102328DC8);
          }
          char v6 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService fetchLOIFromCoreRoutine]", "%s\n", v6);
          if (v6 != (char *)buf) {
            free(v6);
          }
        }
      }
      else
      {
        double v9 = sub_10016C458();
        if (qword_102419430 != -1) {
          dispatch_once(&qword_102419430, &stru_102328DC8);
        }
        v10 = qword_102419438;
        if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_INFO))
        {
          unint64_t value = p_fRoutineInfo->fLOICoarseCoordinates.__tree_.__pair3_.__value_;
          double v12 = v9 - p_fRoutineInfo->fLOICoarseCoordinateRequestMachContTime;
          *(_DWORD *)buf = 67240448;
          int v16 = value;
          __int16 v17 = 2050;
          double v18 = v12;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "CLGMTPS,requesting home work school LOIs,%{public}d,dT,%{public}.1lf", buf, 0x12u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419430 != -1) {
            dispatch_once(&qword_102419430, &stru_102328DC8);
          }
          unint64_t v13 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService fetchLOIFromCoreRoutine]", "%s\n", v13);
          if (v13 != (char *)buf) {
            free(v13);
          }
        }
        p_fRoutineInfo->fLOICoarseCoordinateRequestMachContTime = v9;
        [(CLGeoMapTilesPreloaderService *)self fetchLOIForType:0 isSecondTry:0];
      }
      LOBYTE(v4) = 1;
    }
  }
  else
  {
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    double v7 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "CLGMTPS,LOI query cancelled,mobile assets not received", buf, 2u);
    }
    BOOL v4 = sub_10013D1A0(115, 2);
    if (v4)
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      double v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService fetchLOIFromCoreRoutine]", "%s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)[a3 count]) {
    [objc_msgSend(a3, "objectAtIndexedSubscript:", v5) becameFatallyBlocked:a3 index:v5];
  }
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_1024881A8 != -1) {
    dispatch_once(&qword_1024881A8, &stru_102328C10);
  }
  return (id)qword_1024881A0;
}

- (CLGeoMapTilesPreloaderService)init
{
  v16.receiver = self;
  v16.super_class = (Class)CLGeoMapTilesPreloaderService;
  v2 = [(CLGeoMapTilesPreloaderService *)&v16 initWithInboundProtocol:&OBJC_PROTOCOL___CLGeoMapTilesPreloaderServiceProtocol outboundProtocol:&OBJC_PROTOCOL___CLGeoMapTilesPreloaderServiceClientProtocol];
  BOOL v3 = v2;
  if (v2)
  {
    p_fSettings = &v2->fSettings;
    sub_1014A1498((unsigned __int8 *)&v2->fSettings);
    v3->fRoutineMonitor = 0;
    v3->fGEOCoarseLocationProvider = 0;
    v3->fGEOMapFeatureAccess = 0;
    v3->fGeoMapSubscriptionManager = 0;
    v3->fIsTrackPrecachingEnabled = 0;
    unint64_t value = v3->fWiFiServiceClient.__ptr_.__value_;
    v3->fWiFiServiceClient.__ptr_.__value_ = 0;
    if (value) {
      (*(void (**)(Client *))(*(void *)value + 8))(value);
    }
    char v6 = v3->fDaemonStatusClient.__ptr_.__value_;
    v3->fDaemonStatusClient.__ptr_.__value_ = 0;
    if (v6) {
      (*(void (**)(Client *))(*(void *)v6 + 8))(v6);
    }
    double v7 = v3->fClientManagerClient.__ptr_.__value_;
    v3->fClientManagerClient.__ptr_.__value_ = 0;
    if (v7) {
      (*(void (**)(Client *))(*(void *)v7 + 8))(v7);
    }
    double v8 = v3->fMobileAssetClient.__ptr_.__value_;
    v3->fMobileAssetClient.__ptr_.__value_ = 0;
    if (v8) {
      (*(void (**)(Client *))(*(void *)v8 + 8))(v8);
    }
    double v9 = v3->fLocationClient.__ptr_.__value_;
    v3->fLocationClient.__ptr_.__value_ = 0;
    if (v9) {
      (*(void (**)(Client *))(*(void *)v9 + 8))(v9);
    }
    v10 = v3->fDataProtectionClient.__ptr_.__value_;
    v3->fDataProtectionClient.__ptr_.__value_ = 0;
    if (v10) {
      (*(void (**)(Client *))(*(void *)v10 + 8))(v10);
    }
    v3->fIsWiFiAssociated = 0;
    v3->fIsCharging = 0;
    v3->fBatteryLevel = -1.0;
    v3->fThermalLevel = -1;
    v3->fTimeOfLastWorkoutQueryOnDeviceUnlock = 0.0;
    v3->fLocationServiceState = 0;
    v3->fDownloadRequestInProgress = 0;
    v3->fIsDiskIntensiveActivity = 0;
    v3->fAnalytics.fTotalTouristSectionDownloads = 0;
    v3->fXPCCurrentInterval = -1;
    v3->fIsXPCSettingAggressive = 0;
    v3->fXPCDownloadInterval = 301;
    v3->fDownloadSizePerSection = 150000;
    v3->fUploadSizePerSection = 10000;
    v3->fDownloadTimePerSection = 150;
    int fMinimumBatteryLevel = v3->fSettings.fMinimumBatteryLevel;
    if (fMinimumBatteryLevel <= 0) {
      int fMinimumBatteryLevel = 75;
    }
    v3->fMinimumBatterylevel = fMinimumBatteryLevel;
    v3->fMinimumBatteryLevelAggressiveMode = 50;
    v3->fTotalTimeSpentDownloadingData.__tree_.__pair1_.__value_.__left_ = (void *)0x40F86A0000000000;
    *(void *)&v3->fNumberOfWorkoutsPerformedRecently = 0xBFF0000000000000;
    v3->fDistanceFromHomeForTouristModeMeters = -1.0;
    LODWORD(v3->fTotalTimeSpentDownloadingData.__tree_.__pair3_.__value_) = 0;
    LOBYTE(v3->fTimeOfLastWorkoutQuery) = 0;
    if (p_fSettings->fEnabled)
    {
      sub_1014BBC2C("CLGMTPSOSTransaction", &v15);
      long long v12 = v15;
      long long v15 = 0uLL;
      unint64_t v13 = *(std::__shared_weak_count **)&v3->fDeviceCurrentlyUnlocked;
      *(_OWORD *)&v3->fHealthStore = v12;
      if (v13)
      {
        sub_1000DB0A0(v13);
        if (*((void *)&v15 + 1)) {
          sub_1000DB0A0(*((std::__shared_weak_count **)&v15 + 1));
        }
      }
      v3->fGEOCoarseLocationProvider = (GEOCoarseLocationProvider *)objc_alloc_init((Class)GEOCoarseLocationProvider);
      operator new();
    }
  }
  return v3;
}

- (void)beginService
{
  if (self->fSettings.fEnabled)
  {
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    BOOL v3 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "CLGMTPS,beginService", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      unint64_t v5 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService beginService]", "%s\n", v5);
      if (v5 != (char *)buf) {
        free(v5);
      }
    }
    [(CLGeoMapTilesPreloaderService *)self registerForRoutineMonitor];
    [(CLGeoMapTilesPreloaderService *)self registerForLocationNotification];
    [(CLGeoMapTilesPreloaderService *)self registerForMobileAssetNotification];
    [(CLGeoMapTilesPreloaderService *)self registerForWifiServiceNotification];
    [(CLGeoMapTilesPreloaderService *)self registerForClientManagerNotification];
    [(CLGeoMapTilesPreloaderService *)self registerForDataProtectionNotification];
    [(CLGeoMapTilesPreloaderService *)self clearPersistentStore:0];
    [(CLGeoMapTilesPreloaderService *)self registerForDaemonStatusNotification];
    [(CLGeoMapTilesPreloaderService *)self registerForTrackRunEnablementNotifications];
  }
  else
  {
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    BOOL v4 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "CLGMTPS,beginService,featureNotEnabled", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      char v6 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService beginService]", "%s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
  }
}

- (void)endService
{
  if (self->fSettings.fEnabled)
  {
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    BOOL v3 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "CLGMTPS,endService", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      double v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService endService]", "%s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
    [(CLGeoMapTilesPreloaderService *)self unregisterForWifiServiceNotification];
    [(CLGeoMapTilesPreloaderService *)self unregisterForRoutineMonitor];
    [(CLGeoMapTilesPreloaderService *)self unregisterForDaemonStatusNotification];
    [(CLGeoMapTilesPreloaderService *)self unregisterForClientManagerNotification];
    [(CLGeoMapTilesPreloaderService *)self unregisterForMobileAssetNotification];
    [(CLGeoMapTilesPreloaderService *)self unregisterForLocationNotification];
    [(CLGeoMapTilesPreloaderService *)self unregisterForMotionStateMediatorNotification];
    [(CLGeoMapTilesPreloaderService *)self unregisterForDataProtectionNotification];
    if (self->fGEOMapFeatureAccess)
    {
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      BOOL v4 = qword_102419438;
      if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CLGCZ,destroy geocodec malloc zone,CLGeoMapTilesPreloaderService,endService", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419430 != -1) {
          dispatch_once(&qword_102419430, &stru_102328DC8);
        }
        double v9 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService endService]", "%s\n", v9);
        if (v9 != (char *)buf) {
          free(v9);
        }
      }
      GEOResetGeoCodecsAllocator();

      self->fGEOMapFeatureAccess = 0;
    }
    fGeoMapSubscriptionManager = self->fGeoMapSubscriptionManager;
    if (fGeoMapSubscriptionManager) {

    }
    [(CLGeoMapTilesPreloaderService *)self unregisterForTrackRunEnablementNotifications];
    fGEOCoarseLocationProvider = self->fGEOCoarseLocationProvider;
    if (fGEOCoarseLocationProvider)
    {

      self->fGEOCoarseLocationProvider = 0;
    }
    [(CLGeoMapTilesPreloaderService *)self unregisterXPCActivity:0];
  }
  else
  {
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    double v7 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "CLGMTPS,endService,featureNotEnabled", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      v10 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService endService]", "%s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
    }
  }
}

- (void)downloadTilesOnXPCFire
{
  p_fTotalNPLOISectionDownloads = &self->fAnalytics.fTotalNPLOISectionDownloads;
  (*(void (**)(int64_t *, SEL))(self->fAnalytics.fTotalNPLOISectionDownloads + 16))(&self->fAnalytics.fTotalNPLOISectionDownloads, a2);
  __int16 v116 = 256;
  [(CLGeoMapTilesPreloaderService *)self getConfigFromMobileAssets];
  if (!self->fPersistentStoreData.__ptr_.__value_)
  {
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    double v7 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_ERROR))
    {
      int fXPCCurrentInterval = self->fXPCCurrentInterval;
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)v138 = fXPCCurrentInterval;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "CLGMTPS,persistentStoreData is null,interval,%{public}d", buf, 8u);
    }
    if (!sub_10013D1A0(115, 0)) {
      goto LABEL_26;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    int v9 = self->fXPCCurrentInterval;
    int v117 = 67240192;
    *(_DWORD *)v118 = v9;
    v10 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService downloadTilesOnXPCFire]", "%s\n", v10);
    goto LABEL_251;
  }
  if (!(_BYTE)v110)
  {
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    uint64_t v11 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_INFO))
    {
      int v12 = self->fXPCCurrentInterval;
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)v138 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "CLGMTPS,roads and building precaching not supported in this region,interval,%{public}d", buf, 8u);
    }
    if (!sub_10013D1A0(115, 2)) {
      goto LABEL_26;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    int v89 = self->fXPCCurrentInterval;
    int v117 = 67240192;
    *(_DWORD *)v118 = v89;
    v10 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService downloadTilesOnXPCFire]", "%s\n", v10);
LABEL_251:
    if (v10 != (char *)buf) {
      free(v10);
    }
LABEL_26:
    [(CLGeoMapTilesPreloaderService *)self setNewCriteria:86400];
    goto LABEL_27;
  }
  if (self->fDownloadRequestInProgress)
  {
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    BOOL v3 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_ERROR))
    {
      BOOL fDownloadRequestInProgress = self->fDownloadRequestInProgress;
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)v138 = fDownloadRequestInProgress;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "CLGMTPS,download request already in progress,%{public}d", buf, 8u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      BOOL v5 = self->fDownloadRequestInProgress;
      int v117 = 67240192;
      *(_DWORD *)v118 = v5;
      char v6 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService downloadTilesOnXPCFire]", "%s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
    goto LABEL_27;
  }
  if (BYTE3(v110))
  {
    if (*(_DWORD *)&self->fRoutineInfo.fLastUserLocation.fromSimulationController == 2)
    {
      left = (char *)self->fRoutineInfo.fLOICoarseCoordinates.__tree_.__pair1_.__value_.__left_;
      if (left)
      {
        p_fLOICoarseCoordinates = (uint64_t **)&self->fRoutineInfo.fLOICoarseCoordinates;
        p_pair1 = &self->fRoutineInfo.fLOICoarseCoordinates.__tree_.__pair1_;
        do
        {
          int v16 = *((_DWORD *)left + 8);
          BOOL v17 = v16 < 4;
          if (v16 >= 4) {
            double v18 = (char **)left;
          }
          else {
            double v18 = (char **)(left + 8);
          }
          if (!v17) {
            p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<CLMapMatcherOperatingPolicy::MatcherLocationOfInterestType, CLCoarseLocationData>, void *>>> *)left;
          }
          left = *v18;
        }
        while (*v18);
        if (p_pair1 != &self->fRoutineInfo.fLOICoarseCoordinates.__tree_.__pair1_
          && SLODWORD(p_pair1[4].__value_.__left_) <= 4
          && sub_1014A4918((double *)&p_pair1[5]))
        {
          double v19 = vabdd_f64(*(double *)&p_pair1[10].__value_.__left_, CFAbsoluteTimeGetCurrent());
          if (v19 > (double)SHIDWORD(v110))
          {
            *(_DWORD *)buf = 4;
            sub_1014BBB18(p_fLOICoarseCoordinates, (int *)buf);
            if (qword_102419430 != -1) {
              dispatch_once(&qword_102419430, &stru_102328DC8);
            }
            v20 = qword_102419438;
            if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134349312;
              *(double *)v138 = v19;
              *(_WORD *)&v138[8] = 1026;
              *(_DWORD *)v139 = HIDWORD(v110);
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "CLGMTPS,tourist stale coarse location erased,age,%{public}.1lf,threshold,%{public}d", buf, 0x12u);
            }
            if (sub_10013D1A0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_102419430 != -1) {
                dispatch_once(&qword_102419430, &stru_102328DC8);
              }
              int v117 = 134349312;
              *(double *)v118 = v19;
              *(_WORD *)&v118[8] = 1026;
              *(_DWORD *)v119 = HIDWORD(v110);
              v94 = (char *)_os_log_send_and_compose_impl();
              sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService downloadTilesOnXPCFire]", "%s\n", v94);
              if (v94 != (char *)buf) {
                free(v94);
              }
            }
            *(_DWORD *)buf = 6;
            if (sub_100178BF0((uint64_t)p_fLOICoarseCoordinates, (int *)buf))
            {
              *(_DWORD *)buf = 6;
              sub_1014BBB18(p_fLOICoarseCoordinates, (int *)buf);
              if (qword_102419430 != -1) {
                dispatch_once(&qword_102419430, &stru_102328DC8);
              }
              uint64_t v21 = qword_102419438;
              if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 134349312;
                *(double *)v138 = v19;
                *(_WORD *)&v138[8] = 1026;
                *(_DWORD *)v139 = HIDWORD(v110);
                _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "CLGMTPS,tourist stale signal env coarse location erased,age,%{public}.1lf,threshold,%{public}d", buf, 0x12u);
              }
              if (sub_10013D1A0(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_102419430 != -1) {
                  dispatch_once(&qword_102419430, &stru_102328DC8);
                }
                int v117 = 134349312;
                *(double *)v118 = v19;
                *(_WORD *)&v118[8] = 1026;
                *(_DWORD *)v119 = HIDWORD(v110);
                uint64_t v22 = (char *)_os_log_send_and_compose_impl();
                sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService downloadTilesOnXPCFire]", "%s\n", v22);
                if (v22 != (char *)buf) {
                  free(v22);
                }
              }
            }
          }
        }
      }
    }
    else
    {
      sub_1014A460C((uint64_t)&self->fRoutineInfo);
    }
  }
  if (!sub_1014A495C((uint64_t)&self->fRoutineInfo))
  {
    [(CLGeoMapTilesPreloaderService *)self setNewCriteria:1800];
    goto LABEL_27;
  }
  if (!self->fRoutineInfo.fLOICoarseCoordinates.__tree_.__pair3_.__value_)
  {
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    v88 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_INFO, "CLGMTPS,no coarse location data available", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      LOWORD(v117) = 0;
      v90 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService downloadTilesOnXPCFire]", "%s\n", v90);
      if (v90 != (char *)buf) {
        free(v90);
      }
    }
    [(CLGeoMapTilesPreloaderService *)self setNewCriteria:28800];
    goto LABEL_27;
  }
  sub_1014BBE84((uint64_t)&v108, (uint64_t)&self->fRoutineInfo.fLOICoarseCoordinates);
  sub_1014A4C10((uint64_t **)self->fPersistentStoreData.__ptr_.__value_, (uint64_t)&v108);
  unsigned int v23 = 0;
  unsigned int v101 = 0;
  int v100 = 1;
  do
  {
    unsigned int v24 = v100;
    if (v23 < 4) {
      unsigned int v24 = 3u >> (v23 & 0xF);
    }
    int v100 = v24;
    unsigned int v25 = v101;
    if (v23 < 4) {
      unsigned int v25 = v23;
    }
    unsigned int v101 = v25;
    uint64_t v26 = v108;
    if (v108 != v109)
    {
      int v99 = v25 & 1;
      int v96 = v24 & 1;
      while (1)
      {
        uint64_t v27 = *((unsigned int *)v26 + 8);
        int v28 = "Unknown";
        if (v27 <= 6) {
          int v28 = off_102328EF0[(int)v27];
        }
        sub_100134750(__p, v28);
        v29 = sub_1014A5018((uint64_t)self->fPersistentStoreData.__ptr_.__value_, *((_DWORD *)v26 + 8), (double *)v26 + 5, 1);
        if (!v29) {
          break;
        }
        BOOL v30 = sub_1014A4918((double *)v26 + 5);
        if (*((double *)v26 + 10) <= 0.0 || !v30)
        {
          if (qword_102419430 != -1) {
            dispatch_once(&qword_102419430, &stru_102328DC8);
          }
          long long v45 = qword_102419438;
          if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_ERROR))
          {
            long long v46 = __p;
            if (v107 < 0) {
              long long v46 = (void **)__p[0];
            }
            long long v47 = v26[10];
            *(_DWORD *)buf = 136446722;
            *(void *)v138 = v46;
            *(_WORD *)&v138[8] = 1026;
            *(_DWORD *)v139 = v23;
            *(_WORD *)&v139[4] = 2050;
            *(void *)v140 = v47;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "CLGMTPS,coarse coordinate for type,%{public}s,is invalid,requesting new,cycle,%{public}d,loiTime,%{public}.1lf", buf, 0x1Cu);
          }
          if (!sub_10013D1A0(115, 0)) {
            goto LABEL_178;
          }
          bzero(buf, 0x65CuLL);
          if (qword_102419430 != -1) {
            dispatch_once(&qword_102419430, &stru_102328DC8);
          }
          long long v48 = __p;
          if (v107 < 0) {
            long long v48 = (void **)__p[0];
          }
          long long v49 = v26[10];
          int v117 = 136446722;
          *(void *)v118 = v48;
          *(_WORD *)&v118[8] = 1026;
          *(_DWORD *)v119 = v23;
          *(_WORD *)&v119[4] = 2050;
          *(void *)v120 = v49;
          long long v41 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService downloadTilesOnXPCFire]", "%s\n", v41);
          goto LABEL_216;
        }
        uint64_t v32 = 64;
        if (v101) {
          uint64_t v32 = 68;
        }
        int v33 = *(_DWORD *)((char *)&v111[-1] + 12 * (int)v27 + v32);
        if (v33 <= 0)
        {
          if (qword_102419430 != -1) {
            dispatch_once(&qword_102419430, &stru_102328DC8);
          }
          long long v50 = qword_102419438;
          if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_INFO))
          {
            int v51 = __p;
            if (v107 < 0) {
              int v51 = (void **)__p[0];
            }
            *(_DWORD *)buf = 136446722;
            *(void *)v138 = v51;
            *(_WORD *)&v138[8] = 1026;
            *(_DWORD *)v139 = v99;
            *(_WORD *)&v139[4] = 1026;
            *(_DWORD *)v140 = v23;
            _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "CLGMTPS,invalid radius for type,%{public}s,building,%{public}d,no download for cycle,%{public}d", buf, 0x18u);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_102419430 != -1) {
              dispatch_once(&qword_102419430, &stru_102328DC8);
            }
            int v52 = __p;
            if (v107 < 0) {
              int v52 = (void **)__p[0];
            }
            int v117 = 136446722;
            *(void *)v118 = v52;
            *(_WORD *)&v118[8] = 1026;
            *(_DWORD *)v119 = v99;
            *(_WORD *)&v119[4] = 1026;
            *(_DWORD *)v120 = v23;
            long long v41 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService downloadTilesOnXPCFire]", "%s\n", v41);
            goto LABEL_216;
          }
LABEL_178:
          int v64 = 42;
          goto LABEL_179;
        }
        BOOL v34 = sub_1014A595C((uint64_t)&self->fRoutineInfo, (double *)v26 + 5);
        BOOL v35 = 0;
        if ((v27 & 0xFFFFFFFD) == 4 && *(_DWORD *)&self->fRoutineInfo.fLastUserLocation.fromSimulationController == 2) {
          BOOL v35 = BYTE3(v110) != 0;
        }
        unsigned int v36 = v27 - 5;
        if (v27 == 3) {
          BOOL v35 = 1;
        }
        if (!v34 && !v35)
        {
          if (qword_102419430 != -1) {
            dispatch_once(&qword_102419430, &stru_102328DC8);
          }
          __int16 v53 = qword_102419438;
          if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_INFO))
          {
            int v54 = __p;
            if (v107 < 0) {
              int v54 = (void **)__p[0];
            }
            *(_DWORD *)buf = 136446978;
            *(void *)v138 = v54;
            *(_WORD *)&v138[8] = 1026;
            *(_DWORD *)v139 = v27;
            *(_WORD *)&v139[4] = 1026;
            *(_DWORD *)v140 = v23;
            *(_WORD *)&v140[4] = 1026;
            *(_DWORD *)&v140[6] = BYTE3(v110);
            _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "CLGMTPS,caching not allowed,type,%{public}s,%{public}d,cycle,%{public}d,touristModeAllowed,%{public}d", buf, 0x1Eu);
          }
          if (!sub_10013D1A0(115, 2)) {
            goto LABEL_178;
          }
          bzero(buf, 0x65CuLL);
          if (qword_102419430 != -1) {
            dispatch_once(&qword_102419430, &stru_102328DC8);
          }
          double v55 = __p;
          if (v107 < 0) {
            double v55 = (void **)__p[0];
          }
          goto LABEL_215;
        }
        double v37 = dbl_101E0CBC0[(v27 - 5) < 2];
        if (self->fIsXPCSettingAggressive)
        {
          if (v27 != 6)
          {
            if (qword_102419430 != -1) {
              dispatch_once(&qword_102419430, &stru_102328DC8);
            }
            id v57 = qword_102419438;
            if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_INFO))
            {
              __int16 v58 = __p;
              if (v107 < 0) {
                __int16 v58 = (void **)__p[0];
              }
              *(_DWORD *)buf = 136446978;
              *(void *)v138 = v58;
              *(_WORD *)&v138[8] = 1026;
              *(_DWORD *)v139 = v27;
              *(_WORD *)&v139[4] = 1026;
              *(_DWORD *)v140 = v23;
              *(_WORD *)&v140[4] = 1026;
              *(_DWORD *)&v140[6] = BYTE3(v110);
              _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_INFO, "CLGMTPS,aggressive caching not allowed,type,%{public}s,%{public}d,cycle,%{public}d,touristModeAllowed,%{public}d", buf, 0x1Eu);
            }
            if (!sub_10013D1A0(115, 2)) {
              goto LABEL_178;
            }
            bzero(buf, 0x65CuLL);
            if (qword_102419430 != -1) {
              dispatch_once(&qword_102419430, &stru_102328DC8);
            }
            double v55 = __p;
            if (v107 < 0) {
              double v55 = (void **)__p[0];
            }
            goto LABEL_215;
          }
          if ([(CLGeoMapTilesPreloaderService *)self isAggressiveSettingDataDownloadLimitCrossed:&v110 building:v101 & 1])
          {
            [(CLGeoMapTilesPreloaderService *)self storeDataInPersistentStore];
            if (qword_102419430 != -1) {
              dispatch_once(&qword_102419430, &stru_102328DC8);
            }
            long long v38 = qword_102419438;
            if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_INFO))
            {
              long long v39 = __p;
              if (v107 < 0) {
                long long v39 = (void **)__p[0];
              }
              *(_DWORD *)buf = 136446978;
              *(void *)v138 = v39;
              *(_WORD *)&v138[8] = 1026;
              *(_DWORD *)v139 = 6;
              *(_WORD *)&v139[4] = 1026;
              *(_DWORD *)v140 = v23;
              *(_WORD *)&v140[4] = 1026;
              *(_DWORD *)&v140[6] = BYTE3(v110);
              _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "CLGMTPS,aggressive caching not allowed as data download limit crossed,type,%{public}s,%{public}d,cycle,%{public}d,touristModeAllowed,%{public}d", buf, 0x1Eu);
            }
            if (sub_10013D1A0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_102419430 != -1) {
                dispatch_once(&qword_102419430, &stru_102328DC8);
              }
              int v40 = __p;
              if (v107 < 0) {
                int v40 = (void **)__p[0];
              }
              int v117 = 136446978;
              *(void *)v118 = v40;
              *(_WORD *)&v118[8] = 1026;
              *(_DWORD *)v119 = 6;
              *(_WORD *)&v119[4] = 1026;
              *(_DWORD *)v120 = v23;
              *(_WORD *)&v120[4] = 1026;
              *(_DWORD *)&v120[6] = BYTE3(v110);
              long long v41 = (char *)_os_log_send_and_compose_impl();
              sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService downloadTilesOnXPCFire]", "%s\n", v41);
              goto LABEL_216;
            }
            goto LABEL_178;
          }
          if (!self->fIsXPCSettingAggressive)
          {
LABEL_171:
            if (qword_102419430 != -1) {
              dispatch_once(&qword_102419430, &stru_102328DC8);
            }
            __int16 v62 = qword_102419438;
            if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_INFO))
            {
              double v63 = __p;
              if (v107 < 0) {
                double v63 = (void **)__p[0];
              }
              *(_DWORD *)buf = 136446978;
              *(void *)v138 = v63;
              *(_WORD *)&v138[8] = 1026;
              *(_DWORD *)v139 = v27;
              *(_WORD *)&v139[4] = 1026;
              *(_DWORD *)v140 = v23;
              *(_WORD *)&v140[4] = 1026;
              *(_DWORD *)&v140[6] = BYTE3(v110);
              _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_INFO, "CLGMTPS,aggressive caching not allowed in non-aggressive settings,type,%{public}s,%{public}d,cycle,%{public}d,touristModeAllowed,%{public}d", buf, 0x1Eu);
            }
            if (!sub_10013D1A0(115, 2)) {
              goto LABEL_178;
            }
            bzero(buf, 0x65CuLL);
            if (qword_102419430 != -1) {
              dispatch_once(&qword_102419430, &stru_102328DC8);
            }
            double v55 = __p;
            if (v107 < 0) {
              double v55 = (void **)__p[0];
            }
LABEL_215:
            int v117 = 136446978;
            *(void *)v118 = v55;
            *(_WORD *)&v118[8] = 1026;
            *(_DWORD *)v119 = v27;
            *(_WORD *)&v119[4] = 1026;
            *(_DWORD *)v120 = v23;
            *(_WORD *)&v120[4] = 1026;
            *(_DWORD *)&v120[6] = BYTE3(v110);
            long long v41 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService downloadTilesOnXPCFire]", "%s\n", v41);
            goto LABEL_216;
          }
          unsigned int v97 = (int)((double)v33 / v37 + 0.5) * (int)((double)v33 / v37 + 0.5);
          __int16 v56 = (unsigned int *)v111 + 1;
        }
        else
        {
          if (v27 == 6) {
            goto LABEL_171;
          }
          unsigned int v97 = (int)((double)v33 / v37 + 0.5) * (int)((double)v33 / v37 + 0.5);
          __int16 v56 = (unsigned int *)v111 + 1;
          if ((v27 - 3) >= 2) {
            __int16 v56 = (unsigned int *)v111;
          }
        }
        unsigned int v95 = *v56;
        uint64_t v59 = 6;
        if (v101) {
          uint64_t v59 = 9;
        }
        uint64_t v60 = (uint64_t)&v29[v59];
        if (v100)
        {
          sub_1014BC0E8(v105, v60);
          uint64_t v61 = v105;
          unsigned int v98 = [(CLGeoMapTilesPreloaderService *)self getSectionNotDownloadedYet:v105 maxSections:v97];
        }
        else
        {
          sub_1014BC0E8(v104, v60);
          uint64_t v61 = v104;
          unsigned int v98 = [(CLGeoMapTilesPreloaderService *)self getSectionToBeRefreshed:v104 maxSections:v97 refreshPeriod:v95];
        }
        sub_1000F5BB0((uint64_t)v61, (void *)v61[1]);
        if (v98 == -1)
        {
          int v64 = 0;
        }
        else
        {
          if (qword_102419430 != -1) {
            dispatch_once(&qword_102419430, &stru_102328DC8);
          }
          __int16 v68 = qword_102419438;
          if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v69 = __p;
            if (v107 < 0) {
              uint64_t v69 = (void **)__p[0];
            }
            __int16 v70 = (char *)v112 + 12;
            if (v36 >= 2)
            {
              if (v27 == 3)
              {
                __int16 v70 = (char *)v112 + 8;
              }
              else
              {
                __int16 v70 = (char *)v112;
                if (v27 == 4) {
                  __int16 v70 = (char *)v112 + 4;
                }
              }
            }
            uint64_t v71 = v26[5];
            __int16 v72 = v26[6];
            int v73 = *(_DWORD *)v70;
            *(_DWORD *)buf = 136449027;
            *(void *)v138 = v69;
            *(_WORD *)&v138[8] = 1026;
            *(_DWORD *)v139 = v98;
            *(_WORD *)&v139[4] = 1026;
            *(_DWORD *)v140 = v97;
            *(_WORD *)&v140[4] = 1026;
            *(_DWORD *)&v140[6] = v99;
            __int16 v141 = 2049;
            v142 = v71;
            __int16 v143 = 2049;
            v144 = v72;
            __int16 v145 = 1026;
            int v146 = v33;
            __int16 v147 = 1026;
            unsigned int v148 = v23;
            __int16 v149 = 1026;
            int v150 = v96;
            __int16 v151 = 1026;
            unsigned int v152 = v95;
            __int16 v153 = 1026;
            int v154 = v73;
            __int16 v155 = 2050;
            double v156 = v37;
            _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEBUG, "CLGMTPS,requesting tiles,for type,%{public}s,section,%{public}d/%{public}d,building,%{public}d,around,%{private}.7lf,%{private}.7lf,radius,%{public}d,current cycle,%{public}d,download,%{public}d,tileRefreshPeriod,%{public}d,sections,%{public}d,sectionRadius,%{public}.1lf", buf, 0x5Au);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_102419430 != -1) {
              dispatch_once(&qword_102419430, &stru_102328DC8);
            }
            if (v107 >= 0) {
              v77 = __p;
            }
            else {
              v77 = (void **)__p[0];
            }
            v79 = v26[5];
            v78 = v26[6];
            v80 = (char *)v112 + 12;
            if (v36 >= 2)
            {
              if (v27 == 3)
              {
                v80 = (char *)v112 + 8;
              }
              else
              {
                v80 = (char *)v112;
                if (v27 == 4) {
                  v80 = (char *)v112 + 4;
                }
              }
            }
            int v81 = *(_DWORD *)v80;
            int v117 = 136449027;
            *(void *)v118 = v77;
            *(_WORD *)&v118[8] = 1026;
            *(_DWORD *)v119 = v98;
            *(_WORD *)&v119[4] = 1026;
            *(_DWORD *)v120 = v97;
            *(_WORD *)&v120[4] = 1026;
            *(_DWORD *)&v120[6] = v99;
            __int16 v121 = 2049;
            v122 = v79;
            __int16 v123 = 2049;
            v124 = v78;
            __int16 v125 = 1026;
            int v126 = v33;
            __int16 v127 = 1026;
            unsigned int v128 = v23;
            __int16 v129 = 1026;
            int v130 = v96;
            __int16 v131 = 1026;
            unsigned int v132 = v95;
            __int16 v133 = 1026;
            int v134 = v81;
            __int16 v135 = 2050;
            double v136 = v37;
            v82 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService downloadTilesOnXPCFire]", "%s\n", v82);
            if (v82 != (char *)buf) {
              free(v82);
            }
          }
          double v74 = *((double *)v26 + 5);
          double v75 = *((double *)v26 + 6);
          v102[0] = v110;
          v102[1] = v111[0];
          v102[8] = v112[5];
          v102[9] = v112[6];
          int v103 = v113;
          v102[4] = v112[1];
          v102[5] = v112[2];
          v102[6] = v112[3];
          v102[7] = v112[4];
          v76 = (unsigned int *)v112 + 3;
          v102[2] = v111[1];
          v102[3] = v112[0];
          if (v36 >= 2)
          {
            if (v27 == 3)
            {
              v76 = (unsigned int *)v112 + 2;
            }
            else
            {
              v76 = (unsigned int *)v112;
              if (v27 == 4) {
                v76 = (unsigned int *)v112 + 1;
              }
            }
          }
          [(CLGeoMapTilesPreloaderService *)self preloadSectionTilesAtLatitude:v102 longitude:v27 config:v101 & 1 type:v98 building:*v76 section:v29 numberOfsectionsToDownload:v74 loiSectionData:v75];
          int v64 = 1;
        }
LABEL_179:
        if (v107 < 0) {
          operator delete(__p[0]);
        }
        if (v64 != 42 && v64) {
          goto LABEL_240;
        }
        double v65 = v26[1];
        if (v65)
        {
          do
          {
            __int16 v66 = (void **)v65;
            double v65 = (void *)*v65;
          }
          while (v65);
        }
        else
        {
          do
          {
            __int16 v66 = (void **)v26[2];
            BOOL v67 = *v66 == v26;
            uint64_t v26 = v66;
          }
          while (!v67);
        }
        uint64_t v26 = v66;
        if (v66 == v109) {
          goto LABEL_230;
        }
      }
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      long long v42 = qword_102419438;
      if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_ERROR))
      {
        long long v43 = __p;
        if (v107 < 0) {
          long long v43 = (void **)__p[0];
        }
        *(_DWORD *)buf = 136446210;
        *(void *)v138 = v43;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "CLGMTPS,Unexpected,downloadTilesOnXPCFire,loiSectionData does not exist for type,%{public}s", buf, 0xCu);
      }
      if (!sub_10013D1A0(115, 0)) {
        goto LABEL_178;
      }
      bzero(buf, 0x65CuLL);
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      long long v44 = __p;
      if (v107 < 0) {
        long long v44 = (void **)__p[0];
      }
      int v117 = 136446210;
      *(void *)v118 = v44;
      long long v41 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService downloadTilesOnXPCFire]", "%s\n", v41);
LABEL_216:
      if (v41 != (char *)buf) {
        free(v41);
      }
      goto LABEL_178;
    }
LABEL_230:
    ++v23;
  }
  while (v23 != 4);
  int v83 = sub_1014A5B54(self->fPersistentStoreData.__ptr_.__value_, (uint64_t)&v110, *(_DWORD *)&self->fRoutineInfo.fLastUserLocation.fromSimulationController == 2, self->fIsXPCSettingAggressive);
  if (qword_102419430 != -1) {
    dispatch_once(&qword_102419430, &stru_102328DC8);
  }
  v84 = qword_102419438;
  if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_INFO))
  {
    int v85 = self->fXPCCurrentInterval;
    BOOL v86 = *(_DWORD *)&self->fRoutineInfo.fLastUserLocation.fromSimulationController == 2;
    *(_DWORD *)buf = 67240705;
    *(_DWORD *)v138 = v85;
    *(_WORD *)&v138[4] = 1026;
    *(_DWORD *)&v138[6] = v83;
    *(_WORD *)v139 = 1025;
    *(_DWORD *)&v139[2] = v86;
    _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_INFO, "CLGMTPS,nothing to download or refresh,currentInterval,%{public}d,nextXPCTriggerDelay,%{public}d,tourist,%{private}d", buf, 0x14u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    int v91 = self->fXPCCurrentInterval;
    BOOL v92 = *(_DWORD *)&self->fRoutineInfo.fLastUserLocation.fromSimulationController == 2;
    int v117 = 67240705;
    *(_DWORD *)v118 = v91;
    *(_WORD *)&v118[4] = 1026;
    *(_DWORD *)&v118[6] = v83;
    *(_WORD *)v119 = 1025;
    *(_DWORD *)&v119[2] = v92;
    v93 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService downloadTilesOnXPCFire]", "%s\n", v93);
    if (v93 != (char *)buf) {
      free(v93);
    }
  }
  if (v83 >= 86400) {
    uint64_t v87 = 86400;
  }
  else {
    uint64_t v87 = v83;
  }
  [(CLGeoMapTilesPreloaderService *)self setNewCriteria:v87];
LABEL_240:
  sub_1000F5BB0((uint64_t)&v108, v109[0]);
LABEL_27:
  if (HIBYTE(v116))
  {
    if ((_BYTE)v116) {
      pthread_mutex_unlock(v115);
    }
    else {
      (*(void (**)(int64_t *))(*p_fTotalNPLOISectionDownloads + 24))(p_fTotalNPLOISectionDownloads);
    }
  }
}

- (void)fetchLOIForType:(int64_t)a3 isSecondTry:(BOOL)a4
{
  p_fTotalNPLOISectionDownloads = &self->fAnalytics.fTotalNPLOISectionDownloads;
  char v14 = &self->fAnalytics.fTotalNPLOISectionDownloads;
  (*(void (**)(int64_t *, SEL))(self->fAnalytics.fTotalNPLOISectionDownloads + 16))(&self->fAnalytics.fTotalNPLOISectionDownloads, a2);
  __int16 v15 = 256;
  if (a3 != -1)
  {
    if ([(CLGeoMapTilesPreloaderService *)self setCoarseCoordinatesFromDefaultsWriteEntry])
    {
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      double v8 = qword_102419438;
      if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "CLGMTPS,coarse coordinate set from defaults write entry", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419430 != -1) {
          dispatch_once(&qword_102419430, &stru_102328DC8);
        }
        LOWORD(v16) = 0;
        int v9 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService fetchLOIForType:isSecondTry:]", "%s\n", v9);
        if (v9 != (char *)buf) {
          free(v9);
        }
      }
    }
    else
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1014A64A4;
      v12[3] = &unk_102328C38;
      v12[4] = self;
      void v12[5] = a3;
      BOOL v13 = a4;
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      v10 = qword_102419438;
      if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67240192;
        int v19 = a3;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "CLGMTPS,requesting locations of type,%{public}d,from routinemanager", buf, 8u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419430 != -1) {
          dispatch_once(&qword_102419430, &stru_102328DC8);
        }
        int v16 = 67240192;
        int v17 = a3;
        uint64_t v11 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService fetchLOIForType:isSecondTry:]", "%s\n", v11);
        if (v11 != (char *)buf) {
          free(v11);
        }
      }
      [(CLRoutineMonitorServiceProtocol *)self->fRoutineMonitor fetchLocationsOfInterestOfType:a3 withReply:v12];
    }
  }
  (*(void (**)(int64_t *))(*p_fTotalNPLOISectionDownloads + 24))(p_fTotalNPLOISectionDownloads);
}

- (void)addFakeNPLOIDataForTesting:(CLMapMatcherGeoTilesPrecachingConfig *)a3
{
  if (self->fSettings.fAddFakeNPLOIData)
  {
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    BOOL v5 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CLGMTPS,NPLOI,adding fake NPLOIs", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      __int16 v28 = 0;
      uint64_t v21 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService addFakeNPLOIDataForTesting:]", "%s\n", v21);
      if (v21 != (char *)buf) {
        free(v21);
      }
    }
    *(_DWORD *)buf = 3;
    sub_1014BBB18((uint64_t **)&self->fRoutineInfo.fLOICoarseCoordinates, (int *)buf);
    long long v6 = *(_OWORD *)&a3->var22[6].var2;
    v26[8] = *(_OWORD *)&a3->var22[5].var1;
    v26[9] = v6;
    int var26 = a3->var26;
    long long v7 = *(_OWORD *)&a3->var22[1].var1;
    v26[4] = *(_OWORD *)&a3->var22[0].var0;
    v26[5] = v7;
    long long v8 = *(_OWORD *)&a3->var22[4].var0;
    v26[6] = *(_OWORD *)&a3->var22[2].var2;
    v26[7] = v8;
    long long v9 = *(_OWORD *)&a3->var10;
    v26[0] = *(_OWORD *)&a3->var0;
    v26[1] = v9;
    long long v10 = *(_OWORD *)&a3->var18;
    v26[2] = *(_OWORD *)&a3->var14;
    v26[3] = v10;
    [(CLGeoMapTilesPreloaderService *)self computeCoarseLocationAndStoreForType:3 latitude:1 longitude:v26 altitude:0 horizontalAccuracy:37.2949791 verticalAccuracy:-121.807884 referenceFrame:20.0 config:20.0 nploiIndex:20.0];
    long long v11 = *(_OWORD *)&a3->var22[6].var2;
    v24[8] = *(_OWORD *)&a3->var22[5].var1;
    v24[9] = v11;
    int v25 = a3->var26;
    long long v12 = *(_OWORD *)&a3->var22[1].var1;
    v24[4] = *(_OWORD *)&a3->var22[0].var0;
    v24[5] = v12;
    long long v13 = *(_OWORD *)&a3->var22[4].var0;
    v24[6] = *(_OWORD *)&a3->var22[2].var2;
    v24[7] = v13;
    long long v14 = *(_OWORD *)&a3->var10;
    v24[0] = *(_OWORD *)&a3->var0;
    v24[1] = v14;
    long long v15 = *(_OWORD *)&a3->var18;
    v24[2] = *(_OWORD *)&a3->var14;
    v24[3] = v15;
    [(CLGeoMapTilesPreloaderService *)self computeCoarseLocationAndStoreForType:3 latitude:1 longitude:v24 altitude:1 horizontalAccuracy:37.3402175 verticalAccuracy:-122.005546 referenceFrame:20.0 config:20.0 nploiIndex:20.0];
    long long v16 = *(_OWORD *)&a3->var22[6].var2;
    v22[8] = *(_OWORD *)&a3->var22[5].var1;
    v22[9] = v16;
    int v23 = a3->var26;
    long long v17 = *(_OWORD *)&a3->var22[1].var1;
    v22[4] = *(_OWORD *)&a3->var22[0].var0;
    v22[5] = v17;
    long long v18 = *(_OWORD *)&a3->var22[4].var0;
    v22[6] = *(_OWORD *)&a3->var22[2].var2;
    v22[7] = v18;
    long long v19 = *(_OWORD *)&a3->var10;
    v22[0] = *(_OWORD *)&a3->var0;
    v22[1] = v19;
    long long v20 = *(_OWORD *)&a3->var18;
    v22[2] = *(_OWORD *)&a3->var14;
    v22[3] = v20;
    [(CLGeoMapTilesPreloaderService *)self computeCoarseLocationAndStoreForType:3 latitude:1 longitude:v22 altitude:2 horizontalAccuracy:37.2350657 verticalAccuracy:-121.782939 referenceFrame:20.0 config:20.0 nploiIndex:20.0];
  }
}

- (void)computeCoarseLocationAndStore:(id)a3
{
  p_fTotalNPLOISectionDownloads = &self->fAnalytics.fTotalNPLOISectionDownloads;
  int v23 = &self->fAnalytics.fTotalNPLOISectionDownloads;
  (*(void (**)(int64_t *, SEL))(self->fAnalytics.fTotalNPLOISectionDownloads + 16))(&self->fAnalytics.fTotalNPLOISectionDownloads, a2);
  __int16 v24 = 256;
  if (a3)
  {
    id v6 = [a3 type];
    if ((unint64_t)v6 >= 3) {
      uint64_t v7 = 7;
    }
    else {
      uint64_t v7 = v6;
    }
    [(CLGeoMapTilesPreloaderService *)self getConfigFromMobileAssets];
    [objc_msgSend(a3, "location") latitude];
    double v9 = v8;
    [objc_msgSend(a3, "location") longitude];
    double v11 = v10;
    [objc_msgSend(a3, "location") altitude];
    double v13 = v12;
    [objc_msgSend(a3, "location") horizontalUncertainty];
    double v15 = v14;
    [objc_msgSend(a3, "location") verticalUncertainty];
    double v17 = v16;
    id v18 = [objc_msgSend(a3, "location") referenceFrame];
    v21[8] = v35;
    v21[9] = v36;
    int v22 = v37;
    v21[4] = v31;
    v21[5] = v32;
    v21[6] = v33;
    v21[7] = v34;
    v21[0] = *(_OWORD *)buf;
    v21[1] = v28;
    v21[2] = v29;
    v21[3] = v30;
    [(CLGeoMapTilesPreloaderService *)self computeCoarseLocationAndStoreForType:v7 latitude:v18 longitude:v21 altitude:0xFFFFFFFFLL horizontalAccuracy:v9 verticalAccuracy:v11 referenceFrame:v13 config:v15 nploiIndex:v17];
  }
  else
  {
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    long long v19 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)&uint8_t buf[4] = [0 type];
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "CLGMTPS,unexpected,loi is nil,type,%{public}d,requesting next", buf, 8u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      int v25 = 67240192;
      unsigned int v26 = [0 type];
      long long v20 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService computeCoarseLocationAndStore:]", "%s\n", v20);
      if (v20 != (char *)buf) {
        free(v20);
      }
    }
  }
  (*(void (**)(int64_t *))(*p_fTotalNPLOISectionDownloads + 24))(p_fTotalNPLOISectionDownloads);
}

- (void)removeTrackRunSubscriptionForType:(int)a3 nploiIndex:(int)a4
{
  BOOL v5 = "Home";
  switch(a3)
  {
    case 0:
      goto LABEL_9;
    case 1:
      BOOL v5 = "Work";
      goto LABEL_9;
    case 2:
      BOOL v5 = "School";
      goto LABEL_9;
    case 3:
      sub_100134750(&v30, "NPLOI");
      std::to_string(&v25, a4);
      goto LABEL_10;
    case 4:
      BOOL v5 = "Tourist";
      goto LABEL_9;
    case 5:
      BOOL v5 = "SignalEnvironment";
      goto LABEL_9;
    case 6:
      BOOL v5 = "TouristSignalEnvironment";
      goto LABEL_9;
    default:
      BOOL v5 = "Unknown";
LABEL_9:
      sub_100134750(&v30, v5);
      sub_100134750(&v25, "");
LABEL_10:
      if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        uint64_t v7 = &v25;
      }
      else {
        uint64_t v7 = (std::string *)v25.__r_.__value_.__r.__words[0];
      }
      if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type size = HIBYTE(v25.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type size = v25.__r_.__value_.__l.__size_;
      }
      double v9 = std::string::append(&v30, (const std::string::value_type *)v7, size);
      long long v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
      std::string::size_type v27 = v9->__r_.__value_.__r.__words[2];
      *(_OWORD *)unsigned int v26 = v10;
      v9->__r_.__value_.__l.__size_ = 0;
      v9->__r_.__value_.__r.__words[2] = 0;
      v9->__r_.__value_.__r.__words[0] = 0;
      if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v25.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v30.__r_.__value_.__l.__data_);
      }
      std::operator+<char>();
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      double v11 = qword_102419438;
      if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_DEFAULT))
      {
        double v12 = &v25;
        if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          double v12 = (std::string *)v25.__r_.__value_.__r.__words[0];
        }
        LODWORD(v30.__r_.__value_.__l.__data_) = 136446210;
        *(std::string::size_type *)((char *)v30.__r_.__value_.__r.__words + 4) = (std::string::size_type)v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CLGMTPS,TrackRun,Removing subscription for,%{public}s", (uint8_t *)&v30, 0xCu);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(&v30, 0x65CuLL);
        if (qword_102419430 != -1) {
          dispatch_once(&qword_102419430, &stru_102328DC8);
        }
        long long v20 = &v25;
        if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          long long v20 = (std::string *)v25.__r_.__value_.__r.__words[0];
        }
        int v28 = 136446210;
        long long v29 = v20;
        uint64_t v21 = (std::string *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService removeTrackRunSubscriptionForType:nploiIndex:]", "%s\n", (const char *)v21);
        if (v21 != &v30) {
          free(v21);
        }
      }
      int v13 = SHIBYTE(v25.__r_.__value_.__r.__words[2]);
      std::string::size_type v14 = v25.__r_.__value_.__r.__words[0];
      NSStringEncoding v15 = +[NSString defaultCStringEncoding];
      if (v13 >= 0) {
        double v16 = &v25;
      }
      else {
        double v16 = (std::string *)v14;
      }
      double v17 = +[NSString stringWithCString:v16 encoding:v15];
      fGeoMapSubscriptionManager = self->fGeoMapSubscriptionManager;
      id v19 = [[-[CLGeoMapTilesPreloaderService universe](self, "universe") silo] queue];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3321888768;
      v22[2] = sub_1014A8864;
      v22[3] = &unk_102328CA8;
      if (SHIBYTE(v27) < 0)
      {
        sub_1000DC48C(&__p, v26[0], (unint64_t)v26[1]);
      }
      else
      {
        long long __p = *(_OWORD *)v26;
        std::string::size_type v24 = v27;
      }
      [(GEOMapDataSubscriptionManager *)fGeoMapSubscriptionManager removeSubscriptionWithIdentifier:v17 callbackQueue:v19 completionHandler:v22];
      if (SHIBYTE(v24) < 0) {
        operator delete((void *)__p);
      }
      if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v25.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v27) < 0) {
        operator delete(v26[0]);
      }
      return;
  }
}

- (void)computeCoarseLocationAndStoreForType:(int)a3 latitude:(double)a4 longitude:(double)a5 altitude:(double)a6 horizontalAccuracy:(double)a7 verticalAccuracy:(double)a8 referenceFrame:(int)a9 config:(CLMapMatcherGeoTilesPrecachingConfig *)a10 nploiIndex:(int)a11
{
  if (a10->var22[a3].var0 <= 0 && a10->var22[a3].var1 <= 0 && a10->var22[a3].var2 <= 0)
  {
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    long long v33 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67240192;
      int v53 = a3;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "CLGMTPS,no valid radius for type,%{public}d,coarse location not computed", buf, 8u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      int v50 = 67240192;
      int v51 = a3;
      long long v34 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService computeCoarseLocationAndStoreForType:latitude:longitude:altitude:horizontalAccuracy:verticalAccuracy:referenceFrame:config:nploiIndex:]", "%s\n", v34);
      if (v34 != (char *)buf) {
        free(v34);
      }
    }
  }
  else
  {
    id v21 = [objc_alloc((Class)GEOLocation) initWithGEOCoordinate:a4, a5];
    [v21 setTimestamp:CFAbsoluteTimeGetCurrent()];
    [v21 setAltitude:(int)a6];
    [v21 setHorizontalAccuracy:a7];
    [v21 setVerticalAccuracy:a8];
    [v21 setSpeed:0.0];
    [v21 setCourse:0.0];
    if (a9 == 1) {
      uint64_t v22 = 1;
    }
    else {
      uint64_t v22 = 2 * (a9 == 2);
    }
    [v21 setReferenceFrame:v22];
    fHealthStore = self->fHealthStore;
    if (fHealthStore) {
      sub_100DEE0E4((uint64_t)fHealthStore);
    }
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    std::string::size_type v24 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67240192;
      int v53 = a3;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "CLGMTPS,getting coarse location for type,%{public}d", buf, 8u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      int v50 = 67240192;
      int v51 = a3;
      long long v35 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService computeCoarseLocationAndStoreForType:latitude:longitude:altitude:horizontalAccuracy:verticalAccuracy:referenceFrame:config:nploiIndex:]", "%s\n", v35);
      if (v35 != (char *)buf) {
        free(v35);
      }
    }
    fGEOCoarseLocationProvider = self->fGEOCoarseLocationProvider;
    id v26 = [[-[CLGeoMapTilesPreloaderService universe](self, "universe") silo] queue];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    *(double *)&v36[5] = a4;
    *(double *)&void v36[6] = a5;
    long long v27 = *(_OWORD *)&a10->var22[2].var2;
    long long v45 = *(_OWORD *)&a10->var22[4].var0;
    long long v28 = *(_OWORD *)&a10->var22[6].var2;
    long long v46 = *(_OWORD *)&a10->var22[5].var1;
    long long v47 = v28;
    long long v29 = *(_OWORD *)&a10->var14;
    long long v41 = *(_OWORD *)&a10->var18;
    long long v30 = *(_OWORD *)&a10->var22[1].var1;
    long long v42 = *(_OWORD *)&a10->var22[0].var0;
    v36[2] = sub_1014A9080;
    v36[3] = &unk_102328CE0;
    int v37 = a3;
    v36[4] = self;
    int var26 = a10->var26;
    long long v43 = v30;
    long long v44 = v27;
    long long v32 = *(_OWORD *)&a10->var10;
    long long v38 = *(_OWORD *)&a10->var0;
    long long v39 = v32;
    long long v40 = v29;
    int v48 = var26;
    int v49 = a11;
    [fGEOCoarseLocationProvider fetchCoarseEquivalentForLocation:v21 callbackQueue:v26 callback:v36];
  }
}

- (void)addGeoMapDataSubscriptionForType:(int)a3 latitude:(double)a4 longitude:(double)a5 config:(CLMapMatcherGeoTilesPrecachingConfig *)a6 nploiIndex:(int)a7
{
  double v12 = "Home";
  switch(a3)
  {
    case 0:
      goto LABEL_9;
    case 1:
      double v12 = "Work";
      goto LABEL_9;
    case 2:
      double v12 = "School";
      goto LABEL_9;
    case 3:
      sub_100134750(&v55, "NPLOI");
      std::to_string(&v51, a7);
      goto LABEL_10;
    case 4:
      double v12 = "Tourist";
      goto LABEL_9;
    case 5:
      double v12 = "SignalEnvironment";
      goto LABEL_9;
    case 6:
      double v12 = "TouristSignalEnvironment";
      goto LABEL_9;
    default:
      double v12 = "Unknown";
LABEL_9:
      sub_100134750(&v55, v12);
      sub_100134750(&v51, "");
LABEL_10:
      if ((v51.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v14 = &v51;
      }
      else {
        std::string::size_type v14 = (std::string *)v51.__r_.__value_.__r.__words[0];
      }
      if ((v51.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type size = HIBYTE(v51.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type size = v51.__r_.__value_.__l.__size_;
      }
      double v16 = std::string::append(&v55, (const std::string::value_type *)v14, size);
      long long v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
      int64_t v50 = v16->__r_.__value_.__r.__words[2];
      *(_OWORD *)int v49 = v17;
      v16->__r_.__value_.__l.__size_ = 0;
      v16->__r_.__value_.__r.__words[2] = 0;
      v16->__r_.__value_.__r.__words[0] = 0;
      if (SHIBYTE(v51.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v51.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v55.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v55.__r_.__value_.__l.__data_);
      }
      int var2 = a6->var22[a3].var2;
      double v19 = (double)var2;
      if (var2 <= 0)
      {
        if (qword_102419430 != -1) {
          dispatch_once(&qword_102419430, &stru_102328DC8);
        }
        long long v36 = qword_102419438;
        if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_DEFAULT))
        {
          int v37 = v49;
          if (v50 < 0) {
            int v37 = (void **)v49[0];
          }
          LODWORD(v55.__r_.__value_.__l.__data_) = 136446466;
          *(std::string::size_type *)((char *)v55.__r_.__value_.__r.__words + 4) = (std::string::size_type)v37;
          WORD2(v55.__r_.__value_.__r.__words[1]) = 2048;
          *(double *)((char *)&v55.__r_.__value_.__r.__words[1] + 6) = v19;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "CLGMTPS,TrackRun,loiCacheRadiusMeters non-positive. Not adding subscription for,%{public}s,radius,%.lf", (uint8_t *)&v55, 0x16u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(&v55, 0x65CuLL);
          if (qword_102419430 != -1) {
            dispatch_once(&qword_102419430, &stru_102328DC8);
          }
          long long v38 = v49;
          if (v50 < 0) {
            long long v38 = (void **)v49[0];
          }
          LODWORD(v51.__r_.__value_.__l.__data_) = 136446466;
          *(std::string::size_type *)((char *)v51.__r_.__value_.__r.__words + 4) = (std::string::size_type)v38;
          WORD2(v51.__r_.__value_.__r.__words[1]) = 2048;
          *(double *)((char *)&v51.__r_.__value_.__r.__words[1] + 6) = v19;
          long long v39 = (std::string *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService addGeoMapDataSubscriptionForType:latitude:longitude:config:nploiIndex:]", "%s\n", (const char *)v39);
          goto LABEL_54;
        }
      }
      else
      {
        GEOCoordinateRegionMakeWithDistance();
        id v24 = [objc_alloc((Class)GEOMapRegion) initWithCoordinateRegion:v20, v21, v22, v23];
        std::string v25 = +[NSDate dateWithTimeIntervalSinceNow:1209600.0];
        if (self->fGeoMapSubscriptionManager)
        {
          id v26 = v25;
          std::operator+<char>();
          if (qword_102419430 != -1) {
            dispatch_once(&qword_102419430, &stru_102328DC8);
          }
          long long v27 = qword_102419438;
          if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_DEFAULT))
          {
            long long v28 = v47;
            if (v48 < 0) {
              long long v28 = (void **)v47[0];
            }
            LODWORD(v55.__r_.__value_.__l.__data_) = 136446979;
            *(std::string::size_type *)((char *)v55.__r_.__value_.__r.__words + 4) = (std::string::size_type)v28;
            WORD2(v55.__r_.__value_.__r.__words[1]) = 2049;
            *(double *)((char *)&v55.__r_.__value_.__r.__words[1] + 6) = a4;
            HIWORD(v55.__r_.__value_.__r.__words[2]) = 2049;
            double v56 = a5;
            __int16 v57 = 2050;
            double v58 = v19;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "CLGMTPS,TrackRun,Adding subscription for,%{public}s,LL,%{private}.7lf,%{private}.7lf,radius_m,%{public}.2lf", (uint8_t *)&v55, 0x2Au);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(&v55, 0x65CuLL);
            if (qword_102419430 != -1) {
              dispatch_once(&qword_102419430, &stru_102328DC8);
            }
            long long v41 = v47;
            if (v48 < 0) {
              long long v41 = (void **)v47[0];
            }
            LODWORD(v51.__r_.__value_.__l.__data_) = 136446979;
            *(std::string::size_type *)((char *)v51.__r_.__value_.__r.__words + 4) = (std::string::size_type)v41;
            WORD2(v51.__r_.__value_.__r.__words[1]) = 2049;
            *(double *)((char *)&v51.__r_.__value_.__r.__words[1] + 6) = a4;
            HIWORD(v51.__r_.__value_.__r.__words[2]) = 2049;
            double v52 = a5;
            __int16 v53 = 2050;
            double v54 = v19;
            LODWORD(v43) = 42;
            long long v42 = (std::string *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService addGeoMapDataSubscriptionForType:latitude:longitude:config:nploiIndex:]", "%s\n", (const char *)v42);
            if (v42 != &v55) {
              free(v42);
            }
          }
          int v29 = v48;
          long long v30 = (void **)v47[0];
          NSStringEncoding v31 = +[NSString defaultCStringEncoding];
          if (v29 >= 0) {
            long long v32 = v47;
          }
          else {
            long long v32 = v30;
          }
          long long v33 = +[NSString stringWithCString:v32 encoding:v31];
          fGeoMapSubscriptionManager = self->fGeoMapSubscriptionManager;
          id v35 = [[-[CLGeoMapTilesPreloaderService universe](self, "universe") silo] queue];
          v44[0] = _NSConcreteStackBlock;
          v44[1] = 3321888768;
          v44[2] = sub_1014AA368;
          v44[3] = &unk_102328CA8;
          if (SHIBYTE(v50) < 0)
          {
            sub_1000DC48C(&__p, v49[0], (unint64_t)v49[1]);
          }
          else
          {
            long long __p = *(_OWORD *)v49;
            uint64_t v46 = v50;
          }
          -[GEOMapDataSubscriptionManager addSubscriptionWithIdentifier:dataTypes:policy:region:expirationDate:callbackQueue:completionHandler:](fGeoMapSubscriptionManager, "addSubscriptionWithIdentifier:dataTypes:policy:region:expirationDate:callbackQueue:completionHandler:", v33, 4, 0, v24, v26, v35, v44, v43);
          if (SHIBYTE(v46) < 0) {
            operator delete((void *)__p);
          }
          if (v48 < 0) {
            operator delete(v47[0]);
          }
          goto LABEL_61;
        }
        if (qword_102419430 != -1) {
          dispatch_once(&qword_102419430, &stru_102328DC8);
        }
        long long v40 = qword_102419438;
        if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v55.__r_.__value_.__l.__data_) = 0;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "CLGMTPS,TrackRun,fGeoMapSubscriptionManager unallocated, cannot proceed to set up precaching subscriptions.", (uint8_t *)&v55, 2u);
        }
        if (sub_10013D1A0(115, 0))
        {
          bzero(&v55, 0x65CuLL);
          if (qword_102419430 != -1) {
            dispatch_once(&qword_102419430, &stru_102328DC8);
          }
          LOWORD(v51.__r_.__value_.__l.__data_) = 0;
          long long v39 = (std::string *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService addGeoMapDataSubscriptionForType:latitude:longitude:config:nploiIndex:]", "%s\n", (const char *)v39);
LABEL_54:
          if (v39 != &v55) {
            free(v39);
          }
        }
      }
LABEL_61:
      if (SHIBYTE(v50) < 0) {
        operator delete(v49[0]);
      }
      return;
  }
}

- (void)fetchCoarseLocationForNextLOI:(int)a3
{
  if (a3 == 7)
  {
    uint64_t v3 = 0;
  }
  else if (a3 == 1)
  {
    uint64_t v3 = 2;
  }
  else
  {
    if (a3) {
      return;
    }
    uint64_t v3 = 1;
  }
  [(CLGeoMapTilesPreloaderService *)self fetchLOIForType:v3 isSecondTry:0];
}

- (BOOL)setCoarseCoordinatesFromDefaultsWriteEntry
{
  p_fSettings = &self->fSettings;
  if (sub_1000EF668(self->fSettings.fLatitudeInDeg, self->fSettings.fLongitudeInDeg)
    || p_fSettings->fRadiusInMeters <= 0.0)
  {
    return 0;
  }
  v31[0] = 0;
  if (!sub_100178BF0((uint64_t)&self->fRoutineInfo.fLOICoarseCoordinates, v31))
  {
    sub_1000E9354(v30);
    if (byte_102487D67 >= 0) {
      BOOL v4 = (const char *)&qword_102487D50;
    }
    else {
      BOOL v4 = (const char *)qword_102487D50;
    }
    buf[0] = 1;
    sub_1000EA238((uint64_t)v30, v4, buf);
    if (byte_102487D7F >= 0) {
      BOOL v5 = (const char *)&qword_102487D68;
    }
    else {
      BOOL v5 = (const char *)qword_102487D68;
    }
    sub_10016332C((uint64_t)v30, v5, &p_fSettings->fRadiusInMeters);
    if (byte_102487D97 >= 0) {
      id v6 = (const char *)&qword_102487D80;
    }
    else {
      id v6 = (const char *)qword_102487D80;
    }
    sub_10016332C((uint64_t)v30, v6, &p_fSettings->fRadiusInMeters);
    int v16 = 16777472;
    char v17 = 1;
    int v18 = 0;
    long long v20 = xmmword_101D2C9F0;
    long long v21 = xmmword_101D2CA00;
    int v22 = 400;
    *(void *)&long long v7 = -1;
    *((void *)&v7 + 1) = -1;
    long long v23 = v7;
    long long v24 = v7;
    long long v25 = v7;
    long long v26 = v7;
    long long v27 = v7;
    long long v29 = xmmword_101D2CA10;
    long long v19 = xmmword_101D2CA20;
    if (sub_10016CCBC()) {
      DWORD1(v19) = 4233600;
    }
    DWORD2(v23) = 125000;
    DWORD1(v24) = 125000;
    LODWORD(v25) = 125000;
    HIDWORD(v25) = 15000;
    DWORD2(v26) = 25000;
    DWORD1(v27) = -1;
    int v28 = -1;
    sub_100758980((BOOL *)&v16, (uint64_t)v30);
    sub_1000F5BB0((uint64_t)&self->fRoutineInfo.fLOICoarseCoordinates, (void *)self->fRoutineInfo.fLOICoarseCoordinates.__tree_.__pair1_.__value_.__left_);
    self->fRoutineInfo.fLOICoarseCoordinates.__tree_.__begin_node_ = &self->fRoutineInfo.fLOICoarseCoordinates.__tree_.__pair1_;
    self->fRoutineInfo.fLOICoarseCoordinates.__tree_.__pair1_.__value_.__left_ = 0;
    self->fRoutineInfo.fLOICoarseCoordinates.__tree_.__pair3_.__value_ = 0;
    [(CLGeoMapTilesPreloaderService *)self clearPersistentStore:1];
    double fLatitudeInDeg = p_fSettings->fLatitudeInDeg;
    double fLongitudeInDeg = p_fSettings->fLongitudeInDeg;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)buf = v31[0];
    *(double *)long long v38 = fLatitudeInDeg;
    *(double *)&v38[8] = fLongitudeInDeg;
    *(void *)&v38[16] = 0;
    double v39 = fLatitudeInDeg;
    double v40 = fLongitudeInDeg;
    CFAbsoluteTime v41 = Current;
    sub_1014BC140((uint64_t **)&self->fRoutineInfo.fLOICoarseCoordinates, (int *)buf);
    *(_DWORD *)buf = 5;
    *(double *)long long v38 = fLatitudeInDeg;
    *(double *)&v38[8] = fLongitudeInDeg;
    *(void *)&v38[16] = 0;
    double v39 = fLatitudeInDeg;
    double v40 = fLongitudeInDeg;
    CFAbsoluteTime v41 = Current;
    sub_1014BC140((uint64_t **)&self->fRoutineInfo.fLOICoarseCoordinates, (int *)buf);
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    double v11 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t value = self->fRoutineInfo.fLOICoarseCoordinates.__tree_.__pair3_.__value_;
      *(_DWORD *)buf = 67240705;
      int v37 = value;
      *(_WORD *)long long v38 = 2049;
      *(double *)&v38[2] = fLatitudeInDeg;
      *(_WORD *)&v38[10] = 2049;
      *(double *)&v38[12] = fLongitudeInDeg;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CLGMTPS,set coordinates from defaults-write entry,%{public}d,LL,%{private}.8lf,%{private}.8lf", buf, 0x1Cu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      unint64_t v14 = self->fRoutineInfo.fLOICoarseCoordinates.__tree_.__pair3_.__value_;
      v31[1] = 67240705;
      v31[2] = v14;
      __int16 v32 = 2049;
      double v33 = fLatitudeInDeg;
      __int16 v34 = 2049;
      double v35 = fLongitudeInDeg;
      NSStringEncoding v15 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService setCoarseCoordinatesFromDefaultsWriteEntry]", "%s\n", v15);
      if (v15 != (char *)buf) {
        free(v15);
      }
    }
    sub_10013F3C4(v30);
  }
  return 1;
}

- (CLMatrixIndex)getInsideOutSpiralMatrixIndicesForSection:(int)a3 matrixSize:(int)a4
{
  if (a4 >= 0x79)
  {
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    BOOL v5 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67240448;
      int v30 = a4;
      __int16 v31 = 1026;
      int v32 = 120;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "CLGMTPS,too big matrix size for inside out index computation,size,%{public}d,maxSize,%{public}d", buf, 0xEu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      id v6 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService getInsideOutSpiralMatrixIndicesForSection:matrixSize:]", "%s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
    goto LABEL_49;
  }
  unsigned int v8 = (a4 + 1) >> 1;
  if (a3 < 0)
  {
    int v15 = 0;
    int v9 = 0;
  }
  else
  {
    int v9 = 0;
    unsigned int v10 = -1;
    int v11 = 4;
    int v12 = a3;
    do
    {
      BOOL v13 = __OFSUB__(v12, v11);
      v12 -= v11;
      if (v12 < 0 != v13) {
        int v14 = 0;
      }
      else {
        int v14 = v11;
      }
      v9 += v14;
      ++v10;
      v11 += 8;
    }
    while ((v12 & 0x80000000) == 0);
    if (v10 >= v8)
    {
LABEL_49:
      int v15 = -1;
      uint64_t v19 = 0xFFFFFFFFLL;
      int v18 = -1;
      goto LABEL_55;
    }
    int v15 = v10 + 1;
  }
  int v16 = 0;
  int v17 = (2 * (v15 - 1)) | 1;
  if (v17 >= a4) {
    int v17 = a4;
  }
  int v18 = v15 - 1 + v8 - 1;
  uint64_t v19 = v8 - v15;
  if ((a4 & (v15 == v8)) != 0) {
    int v20 = 2;
  }
  else {
    int v20 = 4;
  }
  int v21 = a4 - 1;
  while (v17 < 1)
  {
LABEL_48:
    if (++v16 == v20) {
      goto LABEL_49;
    }
  }
  int v22 = 0;
  while (1)
  {
    if (!v16 && v22 && v18)
    {
      --v18;
    }
    else if (v16 == 1 && (int)v19 < v21)
    {
      uint64_t v19 = (v19 + 1);
    }
    else if (v16 == 2 && v18 < v21)
    {
      ++v18;
    }
    else
    {
      BOOL v23 = v16 != 3 || v19 == 0;
      BOOL v24 = !v23;
      uint64_t v19 = (v19 - v24);
    }
    if (v9 - a3 == v22) {
      break;
    }
    if (-v17 == --v22)
    {
      v9 -= v22;
      goto LABEL_48;
    }
  }
  if (qword_102419430 != -1) {
    dispatch_once(&qword_102419430, &stru_102328DC8);
  }
  long long v25 = qword_102419438;
  if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67241216;
    int v30 = a3;
    __int16 v31 = 1026;
    int v32 = v15;
    __int16 v33 = 1026;
    int v34 = v18;
    __int16 v35 = 1026;
    int v36 = v19;
    __int16 v37 = 1026;
    int v38 = a4;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "CLGMTPS,getInsideOutSpiralMatrixIndicesForSection,section,%{public}d,spiral,%{public}d,rowcol,%{public}d,%{public}d,size,%{public}d", buf, 0x20u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    int v28 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService getInsideOutSpiralMatrixIndicesForSection:matrixSize:]", "%s\n", v28);
    if (v28 != (char *)buf) {
      free(v28);
    }
  }
LABEL_55:
  unint64_t v26 = v18 | (unint64_t)(v19 << 32);
  int v27 = v15;
  result.var0 = v26;
  result.var1 = HIDWORD(v26);
  result.int var2 = v27;
  return result;
}

- (CLTileDownloadSection)getSectionCoordinate:(SEL)a3 aroundLatitude:(int)a4 longitude:(double)a5 radius:(double)a6 sectionRadius:(double)a7 useInsideOutDownload:(double)a8
{
  retstr->int var2 = 0.0;
  p_int var2 = &retstr->var2;
  *(void *)&retstr->var0 = -1;
  *(void *)&retstr->var1.var1 = -1;
  retstr->var3 = 0.0;
  retstr->var4 = -1.0;
  retstr->var5 = 0;
  if (a7 < 0.0) {
    goto LABEL_7;
  }
  if (a7 <= 0.0 || a8 <= 0.0)
  {
    if (a4 <= 3)
    {
      uint64_t v17 = 2;
      goto LABEL_14;
    }
LABEL_7:
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    int v18 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67240448;
      int v62 = a4;
      __int16 v63 = 2050;
      *(double *)int v64 = a7;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "CLGMTPS,getSectionCoordinate,invalid input,section,%{public}d,radius,%{public}.2lf", buf, 0x12u);
    }
    CLMatrixIndex result = (CLTileDownloadSection *)sub_10013D1A0(115, 0);
    if (result)
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      int v43 = 67240448;
      int v44 = a4;
      __int16 v45 = 2050;
      *(double *)uint64_t v46 = a7;
      goto LABEL_62;
    }
    return result;
  }
  uint64_t v17 = (int)(a7 / a8 + 0.5);
  if ((int)v17 * (int)v17 <= a4) {
    goto LABEL_7;
  }
LABEL_14:
  int v20 = a4 / (int)v17;
  LODWORD(v21) = a4 % (int)v17;
  if (!a9
    || (v22 = (uint64_t)[(CLGeoMapTilesPreloaderService *)self getInsideOutSpiralMatrixIndicesForSection:*(void *)&a4 matrixSize:v17], (v22 & 0x80000000) != 0)|| ((int)v17 > (int)v22 ? (BOOL v24 = v22 <= -1) : (BOOL v24 = 1), !v24 ? (v25 = (int)v17 <= SHIDWORD(v22)) : (v25 = 1), v25))
  {
    int v26 = -1;
  }
  else
  {
    int v26 = v23;
    unint64_t v21 = HIDWORD(v22);
    int v20 = v22;
  }
  BOOL v27 = v20 < (int)v17 && (int)v21 < (int)v17;
  if (!v27 || ((v20 | v21) & 0x80000000) != 0)
  {
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    int v28 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67240960;
      int v62 = v26;
      __int16 v63 = 1026;
      *(_DWORD *)int v64 = v20;
      *(_WORD *)&v64[4] = 1026;
      *(_DWORD *)&v64[6] = v21;
      __int16 v65 = 1026;
      *(_DWORD *)__int16 v66 = v17;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "CLGMTPS,getSectionCoordinate,invalid size,spiral,%{public}d,row,%{public}d,col,%{public}d,size,%{public}d", buf, 0x1Au);
    }
    CLMatrixIndex result = (CLTileDownloadSection *)sub_10013D1A0(115, 0);
    if (result)
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      int v43 = 67240960;
      int v44 = v26;
      __int16 v45 = 1026;
      *(_DWORD *)uint64_t v46 = v20;
      *(_WORD *)&v46[4] = 1026;
      *(_DWORD *)&v46[6] = v21;
      __int16 v47 = 1026;
      *(_DWORD *)char v48 = v17;
      goto LABEL_62;
    }
  }
  else
  {
    double v29 = (double)(int)v17 * a8;
    p_fDistanceCalc = &self->fDistanceCalc;
    p_var3 = &retstr->var3;
    uint64_t v42 = 0;
    if (sub_10005B848(&self->fDistanceCalc.fM, p_var2, &retstr->var3, (double *)&v42, a5, a6, 0.0, v29 - (double)((2 * v20) | 1) * a8, -(v29 - (double)(int)((2 * v21) | 1) * a8), 0.0))
    {
      goto LABEL_45;
    }
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    __int16 v31 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67241472;
      int v62 = v26;
      __int16 v63 = 1026;
      *(_DWORD *)int v64 = v20;
      *(_WORD *)&v64[4] = 1026;
      *(_DWORD *)&v64[6] = v21;
      __int16 v65 = 1026;
      *(_DWORD *)__int16 v66 = v17;
      *(_WORD *)&v66[4] = 2050;
      *(double *)&v66[6] = v29 - (double)((2 * v20) | 1) * a8;
      *(_WORD *)&v66[14] = 2050;
      *(double *)&v66[16] = -(v29 - (double)(int)((2 * v21) | 1) * a8);
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "CLGMTPS,calculateNewPosUsingDelta failed,trying NoLimit spiral,%{public}d,row,%{public}d,col,%{public}d,size,%{public}d,northing,%{public}.1lf,easting,%{public}.1lf", buf, 0x2Eu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      int v43 = 67241472;
      int v44 = v26;
      __int16 v45 = 1026;
      *(_DWORD *)uint64_t v46 = v20;
      *(_WORD *)&v46[4] = 1026;
      *(_DWORD *)&v46[6] = v21;
      __int16 v47 = 1026;
      *(_DWORD *)char v48 = v17;
      *(_WORD *)&v48[4] = 2050;
      *(double *)&v48[6] = v29 - (double)((2 * v20) | 1) * a8;
      *(_WORD *)&v48[14] = 2050;
      *(double *)&v48[16] = -(v29 - (double)(int)((2 * v21) | 1) * a8);
      double v40 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService getSectionCoordinate:aroundLatitude:longitude:radius:sectionRadius:useInsideOutDownload:]", "%s\n", v40);
      if (v40 != (char *)buf) {
        free(v40);
      }
    }
    if (sub_101171EC8(&p_fDistanceCalc->fM, p_var2, p_var3, (double *)&v42, a5, a6, 0.0, v29 - (double)((2 * v20) | 1) * a8, -(v29 - (double)(int)((2 * v21) | 1) * a8), 0.0))
    {
LABEL_45:
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      int v32 = qword_102419438;
      if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_DEBUG))
      {
        double v33 = *p_var2;
        double v34 = *p_var3;
        *(_DWORD *)buf = 67243009;
        int v62 = v17;
        __int16 v63 = 1026;
        *(_DWORD *)int v64 = v20;
        *(_WORD *)&v64[4] = 1026;
        *(_DWORD *)&v64[6] = v21;
        __int16 v65 = 2049;
        *(double *)__int16 v66 = v33;
        *(_WORD *)&v66[8] = 2049;
        *(double *)&v66[10] = v34;
        *(_WORD *)&v66[18] = 2049;
        *(double *)&v66[20] = a5;
        __int16 v67 = 2049;
        double v68 = a6;
        __int16 v69 = 2050;
        double v70 = a7;
        __int16 v71 = 2049;
        double v72 = -(v29 - (double)(int)((2 * v21) | 1) * a8);
        __int16 v73 = 2049;
        double v74 = v29 - (double)((2 * v20) | 1) * a8;
        __int16 v75 = 2048;
        double v76 = a8;
        __int16 v77 = 2048;
        double v78 = (double)(int)v17 * a8;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "CLGMTPS,getSectionCoordinate,size,%{public}d,row,%{public}d,col,%{public}d,LL,%{private}.7lf,%{private}.7lf,inLL,%{private}.7lf,%{private}.7lf,radius,%{public}.2lf,east,%{private}.3lf,north,%{private}.3lf,sectionRadius,%.2lf,radiusBasedOnSize,%.2lf", buf, 0x6Eu);
      }
      CLMatrixIndex result = (CLTileDownloadSection *)sub_10013D1A0(115, 2);
      if (result)
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419430 != -1) {
          dispatch_once(&qword_102419430, &stru_102328DC8);
        }
        double v37 = *p_var2;
        uint64_t v38 = *(void *)p_var3;
        int v43 = 67243009;
        int v44 = v17;
        __int16 v45 = 1026;
        *(_DWORD *)uint64_t v46 = v20;
        *(_WORD *)&v46[4] = 1026;
        *(_DWORD *)&v46[6] = v21;
        __int16 v47 = 2049;
        *(double *)char v48 = v37;
        *(_WORD *)&v48[8] = 2049;
        *(void *)&v48[10] = v38;
        *(_WORD *)&v48[18] = 2049;
        *(double *)&v48[20] = a5;
        __int16 v49 = 2049;
        double v50 = a6;
        __int16 v51 = 2050;
        double v52 = a7;
        __int16 v53 = 2049;
        double v54 = -(v29 - (double)(int)((2 * v21) | 1) * a8);
        __int16 v55 = 2049;
        double v56 = v29 - (double)((2 * v20) | 1) * a8;
        __int16 v57 = 2048;
        double v58 = a8;
        __int16 v59 = 2048;
        double v60 = (double)(int)v17 * a8;
        double v39 = (char *)_os_log_send_and_compose_impl();
        CLMatrixIndex result = (CLTileDownloadSection *)sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService getSectionCoordinate:aroundLatitude:longitude:radius:sectionRadius:useInsideOutDownload:]", "%s\n", v39);
        if (v39 != (char *)buf) {
          free(v39);
        }
      }
      retstr->var1.var1 = v21;
      retstr->var1.int var2 = v26;
      retstr->var4 = a8;
      retstr->var0 = a4;
      retstr->var1.var0 = v20;
      return result;
    }
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    __int16 v35 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67241472;
      int v62 = v26;
      __int16 v63 = 1026;
      *(_DWORD *)int v64 = v20;
      *(_WORD *)&v64[4] = 1026;
      *(_DWORD *)&v64[6] = v21;
      __int16 v65 = 1026;
      *(_DWORD *)__int16 v66 = v17;
      *(_WORD *)&v66[4] = 2050;
      *(double *)&v66[6] = v29 - (double)((2 * v20) | 1) * a8;
      *(_WORD *)&v66[14] = 2050;
      *(double *)&v66[16] = -(v29 - (double)(int)((2 * v21) | 1) * a8);
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "CLGMTPS,calculateNewPosUsingDelta failed,spiral,%{public}d,row,%{public}d,col,%{public}d,size,%{public}d,northing,%{public}.1lf,easting,%{public}.1lf", buf, 0x2Eu);
    }
    CLMatrixIndex result = (CLTileDownloadSection *)sub_10013D1A0(115, 0);
    if (result)
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      int v43 = 67241472;
      int v44 = v26;
      __int16 v45 = 1026;
      *(_DWORD *)uint64_t v46 = v20;
      *(_WORD *)&v46[4] = 1026;
      *(_DWORD *)&v46[6] = v21;
      __int16 v47 = 1026;
      *(_DWORD *)char v48 = v17;
      *(_WORD *)&v48[4] = 2050;
      *(double *)&v48[6] = v29 - (double)((2 * v20) | 1) * a8;
      *(_WORD *)&v48[14] = 2050;
      *(double *)&v48[16] = -(v29 - (double)(int)((2 * v21) | 1) * a8);
LABEL_62:
      int v36 = (char *)_os_log_send_and_compose_impl();
      CLMatrixIndex result = (CLTileDownloadSection *)sub_1004BA5E4("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService getSectionCoordinate:aroundLatitude:longitude:radius:sectionRadius:useInsideOutDownload:]", "%s\n", v36);
      if (v36 != (char *)buf) {
        free(v36);
      }
    }
  }
  return result;
}

- (void)preloadSectionTilesAtLatitude:(double)a3 longitude:(double)a4 config:(CLMapMatcherGeoTilesPrecachingConfig *)a5 type:(int)a6 building:(BOOL)a7 section:(int)a8 numberOfsectionsToDownload:(int)a9 loiSectionData:(void *)a10
{
  uint64_t v12 = *(void *)&a8;
  BOOL v13 = a7;
  uint64_t v14 = *(void *)&a6;
  int v87 = a8;
  p_fTotalNPLOISectionDownloads = &self->fAnalytics.fTotalNPLOISectionDownloads;
  int v85 = &self->fAnalytics.fTotalNPLOISectionDownloads;
  (*(void (**)(int64_t *, SEL))(self->fAnalytics.fTotalNPLOISectionDownloads + 16))(&self->fAnalytics.fTotalNPLOISectionDownloads, a2);
  __int16 v86 = 256;
  if (v14 != 7)
  {
    if (a9 <= 0)
    {
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      double v29 = qword_102419438;
      if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67240192;
        *(_DWORD *)&uint8_t buf[4] = a9;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "CLGMTPS,invalid sections to download,%{public}d", buf, 8u);
      }
      if (!sub_10013D1A0(115, 0)) {
        goto LABEL_30;
      }
      bzero(buf, 0x65CuLL);
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      *(_DWORD *)BOOL v92 = 67240192;
      *(_DWORD *)&v92[4] = a9;
      unint64_t v21 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService preloadSectionTilesAtLatitude:longitude:config:type:building:section:numberOfsectionsToDownload:loiSectionData:]", "%s\n", v21);
      goto LABEL_102;
    }
    uint64_t v22 = 64;
    if (v13) {
      uint64_t v22 = 68;
    }
    int v23 = *(_DWORD *)(&a5->var0 + 12 * (int)v14 + v22);
    double v24 = (double)v23;
    unint64_t v25 = (unint64_t)(COERCE__INT64(fabs((double)v23)) - 0x10000000000000) >> 53;
    if ((double)v23) {
      BOOL v26 = v25 >= 0x3FF;
    }
    else {
      BOOL v26 = 0;
    }
    char v27 = !v26;
    if (v23 > 0x1E848 || (v27 & 1) == 0)
    {
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      int v30 = qword_102419438;
      if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349056;
        *(double *)&uint8_t buf[4] = v24;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "CLGMTPS,invalid radius,%{public}.1lf", buf, 0xCu);
      }
      if (!sub_10013D1A0(115, 2)) {
        goto LABEL_30;
      }
      bzero(buf, 0x65CuLL);
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      *(_DWORD *)BOOL v92 = 134349056;
      *(double *)&v92[4] = v24;
      unint64_t v21 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService preloadSectionTilesAtLatitude:longitude:config:type:building:section:numberOfsectionsToDownload:loiSectionData:]", "%s\n", v21);
      if (v21 == buf) {
        goto LABEL_30;
      }
      goto LABEL_103;
    }
    if (!a10 || !self->fPersistentStoreData.__ptr_.__value_)
    {
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      __int16 v31 = qword_102419438;
      if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_ERROR))
      {
        int v32 = v14 > 6 ? "Unknown" : off_102328EF0[(int)v14];
        sub_100134750(buf, v32);
        double v37 = v102 >= 0 ? buf : *(unsigned char **)buf;
        *(_DWORD *)BOOL v92 = 136446210;
        *(void *)&v92[4] = v37;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "CLGMTPS,%{public}s,uninitialized map entry, preloadSectionTilesAtLatitude", v92, 0xCu);
        if (v102 < 0) {
          operator delete(*(void **)buf);
        }
      }
      if (!sub_10013D1A0(115, 0)) {
        goto LABEL_30;
      }
      bzero(buf, 0x65CuLL);
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      sub_1014A4FEC(v14, v92);
      if (v92[23] >= 0) {
        double v60 = v92;
      }
      else {
        double v60 = *(unsigned char **)v92;
      }
      LODWORD(v96) = 136446210;
      *(void *)((char *)&v96 + 4) = v60;
      unint64_t v21 = (char *)_os_log_send_and_compose_impl();
      if ((v92[23] & 0x80000000) != 0) {
        operator delete(*(void **)v92);
      }
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService preloadSectionTilesAtLatitude:longitude:config:type:building:section:numberOfsectionsToDownload:loiSectionData:]", "%s\n", v21);
      if (v21 == buf) {
        goto LABEL_30;
      }
      goto LABEL_103;
    }
    *(void *)&long long v96 = 0;
    *((void *)&v96 + 1) = &v96;
    uint64_t v97 = 0x2020000000;
    if (v23) {
      int v28 = (int)(v24 / dbl_101E0CBC0[(v14 - 5) < 2] + 0.5);
    }
    else {
      int v28 = 2;
    }
    int v33 = v28 * v28;
    int v98 = v33 - 1;
    if (v33 <= (int)v12)
    {
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      int v36 = qword_102419438;
      if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134349312;
        *(double *)&uint8_t buf[4] = v24;
        __int16 v100 = 1026;
        int v101 = v87;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "CLGMTPS,reached end of download cycle for this LOI or invalid radius,radius,%{public}.1lf,section,%{public}d", buf, 0x12u);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419430 != -1) {
          dispatch_once(&qword_102419430, &stru_102328DC8);
        }
        *(_DWORD *)BOOL v92 = 134349312;
        *(double *)&v92[4] = v24;
        *(_WORD *)&v92[12] = 1026;
        *(_DWORD *)&v92[14] = v87;
        uint64_t v61 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService preloadSectionTilesAtLatitude:longitude:config:type:building:section:numberOfsectionsToDownload:loiSectionData:]", "%s\n", v61);
        if (v61 != buf) {
          free(v61);
        }
      }
      [(CLGeoMapTilesPreloaderService *)self setXPCActivityToDone];
      goto LABEL_97;
    }
    *(void *)BOOL v92 = 0;
    *(void *)&v92[8] = v92;
    *(void *)&v92[16] = 0x6012000000;
    v93 = sub_100177FC0;
    v94 = nullsub_58;
    unsigned int v95 = "";
    -[CLGeoMapTilesPreloaderService getSectionCoordinate:aroundLatitude:longitude:radius:sectionRadius:useInsideOutDownload:](self, "getSectionCoordinate:aroundLatitude:longitude:radius:sectionRadius:useInsideOutDownload:", v12, a5->var1, a3, a4, v24);
    v83[0] = 0;
    v83[1] = v83;
    v83[2] = 0x2020000000;
    double v84 = 0.0;
    double v84 = sub_10016C458();
    v81[0] = 0;
    v81[1] = v81;
    v81[2] = 0x2020000000;
    CFAbsoluteTime Current = 0.0;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    v69[0] = _NSConcreteStackBlock;
    v69[1] = 3221225472;
    double v70 = sub_1014ACA90;
    __int16 v71 = &unk_102328D08;
    BOOL v80 = v13;
    double v72 = self;
    __int16 v73 = v83;
    int v77 = v14;
    int v78 = v87;
    double v74 = v81;
    __int16 v75 = v92;
    double v76 = &v96;
    int v79 = a9;
    if (self->fAnalytics.fTotalTouristSectionDownloads)
    {
      CFAbsoluteTime v34 = CFAbsoluteTimeGetCurrent();
      *(void *)buf = &v87;
      if (v13) {
        __int16 v35 = sub_1000FEE0C((uint64_t **)a10 + 9, &v87, (uint64_t)&unk_101D0B290, (_DWORD **)buf);
      }
      else {
        __int16 v35 = sub_1000FEE0C((uint64_t **)a10 + 6, &v87, (uint64_t)&unk_101D0B290, (_DWORD **)buf);
      }
      *((CFAbsoluteTime *)v35 + 5) = v34;
      if ((*(_DWORD *)(*(void *)&v92[8] + 48) & 0x80000000) != 0)
      {
        id v43 = objc_alloc((Class)NSError);
        NSErrorUserInfoKey v90 = NSLocalizedDescriptionKey;
        int v91 = +[NSString stringWithFormat:@"Invalid download section"];
        v70((uint64_t)v69, 0, [[v43 initWithDomain:@"com.apple.locationd.CLGMTPS" code:0 userInfo:[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v91, &v90, 1)]);
      }
      else
      {
        if (xpc_activity_get_state((xpc_activity_t)self->fAnalytics.fTotalTouristSectionDownloads) == 4
          || xpc_activity_set_state((xpc_activity_t)self->fAnalytics.fTotalTouristSectionDownloads, 4))
        {
          if (!xpc_activity_should_defer((xpc_activity_t)self->fAnalytics.fTotalTouristSectionDownloads)
            || !xpc_activity_set_state((xpc_activity_t)self->fAnalytics.fTotalTouristSectionDownloads, 3))
          {
            long long v44 = *(_OWORD *)(*(void *)&v92[8] + 80);
            long long v45 = *(_OWORD *)(*(void *)&v92[8] + 48);
            if ((v14 - 5) > 1)
            {
              v65[1] = *(_OWORD *)(*(void *)&v92[8] + 64);
              v65[2] = v44;
              v65[0] = v45;
              uint64_t v52 = *(unsigned int *)(*((void *)&v96 + 1) + 24);
              long long v53 = *(_OWORD *)&a5->var22[6].var2;
              v63[8] = *(_OWORD *)&a5->var22[5].var1;
              v63[9] = v53;
              int var26 = a5->var26;
              long long v54 = *(_OWORD *)&a5->var22[1].var1;
              v63[4] = *(_OWORD *)&a5->var22[0].var0;
              v63[5] = v54;
              long long v55 = *(_OWORD *)&a5->var22[4].var0;
              v63[6] = *(_OWORD *)&a5->var22[2].var2;
              v63[7] = v55;
              long long v56 = *(_OWORD *)&a5->var10;
              v63[0] = *(_OWORD *)&a5->var0;
              v63[1] = v56;
              long long v57 = *(_OWORD *)&a5->var18;
              v63[2] = *(_OWORD *)&a5->var14;
              v63[3] = v57;
              [(CLGeoMapTilesPreloaderService *)self preloadTilesAPICallForSection:v65 sectionDownloadRadius:v52 maxSectionIndex:v13 building:v14 matcherLOIType:v63 config:v69 completionHandler:3000.0];
            }
            else
            {
              v68[1] = *(_OWORD *)(*(void *)&v92[8] + 64);
              v68[2] = v44;
              v68[0] = v45;
              uint64_t v46 = *(unsigned int *)(*((void *)&v96 + 1) + 24);
              long long v47 = *(_OWORD *)&a5->var22[6].var2;
              v66[8] = *(_OWORD *)&a5->var22[5].var1;
              v66[9] = v47;
              int v67 = a5->var26;
              long long v48 = *(_OWORD *)&a5->var22[1].var1;
              v66[4] = *(_OWORD *)&a5->var22[0].var0;
              v66[5] = v48;
              long long v49 = *(_OWORD *)&a5->var22[4].var0;
              v66[6] = *(_OWORD *)&a5->var22[2].var2;
              v66[7] = v49;
              long long v50 = *(_OWORD *)&a5->var10;
              v66[0] = *(_OWORD *)&a5->var0;
              v66[1] = v50;
              long long v51 = *(_OWORD *)&a5->var18;
              v66[2] = *(_OWORD *)&a5->var14;
              v66[3] = v51;
              [(CLGeoMapTilesPreloaderService *)self preloadTilesAPICallForSectionWithSECheck:v68 sectionDownloadRadius:v46 maxSectionIndex:v13 building:v14 matcherLOIType:v66 config:v69 completionHandler:3000.0];
            }
            goto LABEL_96;
          }
          if (qword_102419430 != -1) {
            dispatch_once(&qword_102419430, &stru_102328DC8);
          }
          double v40 = qword_102419438;
          if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_INFO))
          {
            xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)self->fAnalytics.fTotalTouristSectionDownloads);
            *(_DWORD *)buf = 134349056;
            *(void *)&uint8_t buf[4] = state;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "CLGMTPS,setting activity to defer,currentState,%{public}ld", buf, 0xCu);
          }
          if (!sub_10013D1A0(115, 2)) {
            goto LABEL_96;
          }
          bzero(buf, 0x65CuLL);
          if (qword_102419430 != -1) {
            dispatch_once(&qword_102419430, &stru_102328DC8);
          }
          xpc_activity_state_t v42 = xpc_activity_get_state((xpc_activity_t)self->fAnalytics.fTotalTouristSectionDownloads);
          int v88 = 134349056;
          xpc_activity_state_t v89 = v42;
          double v39 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService preloadSectionTilesAtLatitude:longitude:config:type:building:section:numberOfsectionsToDownload:loiSectionData:]", "%s\n", v39);
        }
        else
        {
          if (qword_102419430 != -1) {
            dispatch_once(&qword_102419430, &stru_102328DC8);
          }
          double v58 = qword_102419438;
          if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_ERROR))
          {
            xpc_activity_state_t v59 = xpc_activity_get_state((xpc_activity_t)self->fAnalytics.fTotalTouristSectionDownloads);
            *(_DWORD *)buf = 134349056;
            *(void *)&uint8_t buf[4] = v59;
            _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "CLGMTPS,failed to mark activity as Continue,state,%{public}ld", buf, 0xCu);
          }
          if (!sub_10013D1A0(115, 0)) {
            goto LABEL_96;
          }
          bzero(buf, 0x65CuLL);
          if (qword_102419430 != -1) {
            dispatch_once(&qword_102419430, &stru_102328DC8);
          }
          xpc_activity_state_t v62 = xpc_activity_get_state((xpc_activity_t)self->fAnalytics.fTotalTouristSectionDownloads);
          int v88 = 134349056;
          xpc_activity_state_t v89 = v62;
          double v39 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService preloadSectionTilesAtLatitude:longitude:config:type:building:section:numberOfsectionsToDownload:loiSectionData:]", "%s\n", v39);
        }
        if (v39 != buf) {
          goto LABEL_121;
        }
      }
LABEL_96:
      _Block_object_dispose(v81, 8);
      _Block_object_dispose(v83, 8);
      _Block_object_dispose(v92, 8);
LABEL_97:
      _Block_object_dispose(&v96, 8);
      goto LABEL_98;
    }
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    uint64_t v38 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "CLGMTPS,failed to mark activity as Continue,activity does not exist", buf, 2u);
    }
    if (!sub_10013D1A0(115, 0)) {
      goto LABEL_96;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    LOWORD(v88) = 0;
    double v39 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService preloadSectionTilesAtLatitude:longitude:config:type:building:section:numberOfsectionsToDownload:loiSectionData:]", "%s\n", v39);
    if (v39 == buf) {
      goto LABEL_96;
    }
LABEL_121:
    free(v39);
    goto LABEL_96;
  }
  if (qword_102419430 != -1) {
    dispatch_once(&qword_102419430, &stru_102328DC8);
  }
  int v20 = qword_102419438;
  if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "CLGMTPS,invalid matcher LOI type", buf, 2u);
  }
  if (!sub_10013D1A0(115, 0)) {
    goto LABEL_30;
  }
  bzero(buf, 0x65CuLL);
  if (qword_102419430 != -1) {
    dispatch_once(&qword_102419430, &stru_102328DC8);
  }
  *(_WORD *)BOOL v92 = 0;
  unint64_t v21 = (char *)_os_log_send_and_compose_impl();
  sub_1004BA5E4("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService preloadSectionTilesAtLatitude:longitude:config:type:building:section:numberOfsectionsToDownload:loiSectionData:]", "%s\n", v21);
LABEL_102:
  if (v21 != buf) {
LABEL_103:
  }
    free(v21);
LABEL_30:
  [(CLGeoMapTilesPreloaderService *)self setXPCActivityToDone];
LABEL_98:
  (*(void (**)(int64_t *))(*p_fTotalNPLOISectionDownloads + 24))(p_fTotalNPLOISectionDownloads);
}

- (void)preloadTilesAPICallForSection:(CLTileDownloadSection *)a3 sectionDownloadRadius:(double)a4 maxSectionIndex:(int)a5 building:(BOOL)a6 matcherLOIType:(int)a7 config:(CLMapMatcherGeoTilesPrecachingConfig *)a8 completionHandler:(id)a9
{
  BOOL v11 = a6;
  p_fCosRefLat = &self->fRoutineInfo.fDistanceCalc.fCosRefLat;
  ++self->fAnalytics.fXPCCallBackCount;
  if (a7 == 6)
  {
    unint64_t value = self->fPersistentStoreData.__ptr_.__value_;
    if (value)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      sub_1014AD998((uint64_t)value, 6, a5, a3->var0, v11, a8->var24, Current);
    }
  }
  if (qword_102419430 != -1) {
    dispatch_once(&qword_102419430, &stru_102328DC8);
  }
  int v20 = qword_102419438;
  if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_DEBUG))
  {
    double var2 = a3->var2;
    double var3 = a3->var3;
    double var4 = a3->var4;
    int var0 = a3->var0;
    int v25 = a3->var1.var0;
    int var1 = a3->var1.var1;
    int v26 = a3->var1.var2;
    uint64_t v28 = *((void *)p_fCosRefLat + 3);
    int fMapsBuildingTileStyleToUse = self->fSettings.fMapsBuildingTileStyleToUse;
    *(_DWORD *)buf = 67242753;
    int v35 = var0;
    __int16 v36 = 2049;
    double v37 = var2;
    __int16 v38 = 2049;
    double v39 = var3;
    __int16 v40 = 2050;
    double v41 = var4;
    __int16 v42 = 1026;
    BOOL v43 = v11;
    __int16 v44 = 1026;
    int v45 = v26;
    __int16 v46 = 1026;
    int v47 = v25;
    __int16 v48 = 1026;
    int v49 = var1;
    __int16 v50 = 2050;
    uint64_t v51 = v28;
    __int16 v52 = 1026;
    int v53 = a7;
    __int16 v54 = 1026;
    int v55 = fMapsBuildingTileStyleToUse;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "CLGMTPS,requesting tiles,section,%{public}d,around,%{private}.7lf,%{private}.7lf,radius,%{public}.2lf,building,%{public}d,spiral,%{public}d,rowcol,%{public}d,%{public}d,downloadReqCount,%{public}ld,loiType,%{public}d,mapsBuildingTileStyle,%{public}d", buf, 0x54u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    int v33 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService preloadTilesAPICallForSection:sectionDownloadRadius:maxSectionIndex:building:matcherLOIType:config:completionHandler:]", "%s\n", v33);
    if (v33 != (char *)buf) {
      free(v33);
    }
  }
  self->BOOL fDownloadRequestInProgress = 1;
  double v30 = a3->var2;
  double v31 = a3->var3;
  fGEOMapFeatureAccess = self->fGEOMapFeatureAccess;
  if (v11) {
    -[GEOMapFeatureAccess preloadBuildingTilesNear:radius:tileSetStyle:preloadToDiskOnly:completionHandler:](fGEOMapFeatureAccess, "preloadBuildingTilesNear:radius:tileSetStyle:preloadToDiskOnly:completionHandler:", self->fSettings.fMapsBuildingTileStyleToUse, 1, a9, v30, v31, a4);
  }
  else {
    -[GEOMapFeatureAccess preloadRoadTilesNear:radius:preloadToDiskOnly:completionHandler:](fGEOMapFeatureAccess, "preloadRoadTilesNear:radius:preloadToDiskOnly:completionHandler:", 1, a9, v30, v31, a4);
  }
}

- (void)preloadTilesAPICallForSectionWithSECheck:(CLTileDownloadSection *)a3 sectionDownloadRadius:(double)a4 maxSectionIndex:(int)a5 building:(BOOL)a6 matcherLOIType:(int)a7 config:(CLMapMatcherGeoTilesPrecachingConfig *)a8 completionHandler:(id)a9
{
  id v17 = [[-[CLGeoMapTilesPreloaderService vendor](self, "vendor") proxyForService:@"CLSignalEnvironmentProvider"];
  [v17 registerDelegate:self inSilo:[-[CLGeoMapTilesPreloaderService universe](self, "universe") silo]];
  double var2 = a3->var2;
  double var3 = a3->var3;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1014ADBA0;
  v26[3] = &unk_102328D30;
  long long v20 = *(_OWORD *)&a3->var2;
  long long v27 = *(_OWORD *)&a3->var0;
  long long v28 = v20;
  long long v29 = *(_OWORD *)&a3->var4;
  double v30 = a4;
  int v31 = a7;
  int v32 = a5;
  BOOL v44 = a6;
  long long v21 = *(_OWORD *)&a8->var10;
  long long v33 = *(_OWORD *)&a8->var0;
  long long v34 = v21;
  long long v22 = *(_OWORD *)&a8->var22[0].var0;
  long long v38 = *(_OWORD *)&a8->var22[1].var1;
  long long v37 = v22;
  long long v23 = *(_OWORD *)&a8->var18;
  long long v35 = *(_OWORD *)&a8->var14;
  long long v36 = v23;
  int var26 = a8->var26;
  long long v24 = *(_OWORD *)&a8->var22[5].var1;
  long long v42 = *(_OWORD *)&a8->var22[6].var2;
  long long v41 = v24;
  long long v25 = *(_OWORD *)&a8->var22[4].var0;
  long long v39 = *(_OWORD *)&a8->var22[2].var2;
  long long v40 = v25;
  v26[4] = self;
  v26[5] = a9;
  [v17 fetchCoarseSignalEnvironmentForLatitude:v26 longitude:var2 withReply:var3];
}

- (void)logRTLocationOfInterest:(id)a3 type:(id)a4
{
  if (a3)
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v4 = [a3 countByEnumeratingWithState:&v40 objects:v80 count:16];
    if (v4)
    {
      id v5 = v4;
      id v6 = &qword_102419000;
      long long v7 = &qword_102419000;
      uint64_t v8 = *(void *)v41;
      do
      {
        int v9 = 0;
        do
        {
          if (*(void *)v41 != v8) {
            objc_enumerationMutation(a3);
          }
          unsigned int v10 = *(void **)(*((void *)&v40 + 1) + 8 * (void)v9);
          if (v6[134] != -1) {
            dispatch_once(&qword_102419430, &stru_102328DC8);
          }
          BOOL v11 = v7[135];
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            unsigned int v12 = [v10 type];
            [objc_msgSend(v10, "location") latitude];
            uint64_t v14 = v13;
            [objc_msgSend(v10, "location") longitude];
            uint64_t v16 = v15;
            [objc_msgSend(v10, "location") horizontalUncertainty];
            uint64_t v18 = v17;
            [v10 confidence];
            uint64_t v20 = v19;
            unsigned int v21 = [[v10 visits] count];
            id v22 = [[[v10 preferredName] UTF8String];
            unsigned int v23 = [v10 typeSource];
            *(_DWORD *)buf = 138545411;
            id v63 = a4;
            __int16 v64 = 1026;
            unsigned int v65 = v12;
            long long v7 = &qword_102419000;
            __int16 v66 = 2049;
            uint64_t v67 = v14;
            __int16 v68 = 2049;
            uint64_t v69 = v16;
            __int16 v70 = 2050;
            uint64_t v71 = v18;
            __int16 v72 = 2050;
            uint64_t v73 = v20;
            __int16 v74 = 1026;
            unsigned int v75 = v21;
            __int16 v76 = 2081;
            id v77 = v22;
            id v6 = &qword_102419000;
            __int16 v78 = 1026;
            unsigned int v79 = v23;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "CLGMTPS,%{public}@,receivedType,%{public}d,ll,%{private}.7lf,%{private}.7lf,unc,%{public}.1lf,confidence,%{public}.1lf,visitsCount,%{public}d,name,%{private}s,source,%{public}d", buf, 0x50u);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (v6[134] != -1) {
              dispatch_once(&qword_102419430, &stru_102328DC8);
            }
            unsigned int v24 = [v10 type];
            [objc_msgSend(v10, "location") latitude];
            uint64_t v26 = v25;
            [objc_msgSend(v10, "location") longitude];
            uint64_t v28 = v27;
            [objc_msgSend(v10, "location") horizontalUncertainty];
            uint64_t v30 = v29;
            [v10 confidence];
            uint64_t v32 = v31;
            unsigned int v33 = [[v10 visits] count];
            id v34 = [[[v10 preferredName] UTF8String];
            unsigned int v35 = [v10 typeSource];
            int v44 = 138545411;
            id v45 = a4;
            __int16 v46 = 1026;
            unsigned int v47 = v24;
            __int16 v48 = 2049;
            uint64_t v49 = v26;
            __int16 v50 = 2049;
            uint64_t v51 = v28;
            __int16 v52 = 2050;
            uint64_t v53 = v30;
            __int16 v54 = 2050;
            uint64_t v55 = v32;
            __int16 v56 = 1026;
            unsigned int v57 = v33;
            __int16 v58 = 2081;
            id v59 = v34;
            __int16 v60 = 1026;
            unsigned int v61 = v35;
            long long v36 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService logRTLocationOfInterest:type:]", "%s\n", v36);
            if (v36 != (char *)buf) {
              free(v36);
            }
            id v6 = &qword_102419000;
            long long v7 = &qword_102419000;
          }
          int v9 = (char *)v9 + 1;
        }
        while (v5 != v9);
        id v37 = [a3 countByEnumeratingWithState:&v40 objects:v80 count:16];
        id v5 = v37;
      }
      while (v37);
    }
  }
}

- (void)pullDataFromPersistentStore
{
  unint64_t value = self->fPersistentStoreData.__ptr_.__value_;
  if (value)
  {
    sub_100DEE0E4((uint64_t)value + 56);
    [(CLGeoMapTilesPreloaderService *)self getConfigFromMobileAssets];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1014AE5C0;
    v10[3] = &unk_1022A56E0;
    v10[4] = self;
    v10[5] = &v11;
    [objc_msgSend(-[CLGeoMapTilesPreloaderService universe](self, "universe"), "silo") sync:v10];
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    id v4 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_INFO))
    {
      unsigned int v5 = [(CLGeoMapTilesPreloaderService *)self getPersistentStoreDataCount];
      *(_DWORD *)buf = 67240192;
      unsigned int v15 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "CLGMTPS,persistent store read with datacount,%{public}d", buf, 8u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      unsigned int v7 = [(CLGeoMapTilesPreloaderService *)self getPersistentStoreDataCount];
      int v12 = 67240192;
      unsigned int v13 = v7;
      uint64_t v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService pullDataFromPersistentStore]", "%s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
    sub_100DEE0B0((id *)self->fPersistentStoreData.__ptr_.__value_ + 7);
  }
  else
  {
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    id v6 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "CLGMTPS,pullDataFromPersistentStore,invalid persistent store data pointer", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      __int16 v11 = 0;
      int v9 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService pullDataFromPersistentStore]", "%s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
  }
}

- (void)storeDataInPersistentStore
{
  unint64_t value = self->fPersistentStoreData.__ptr_.__value_;
  if (value)
  {
    sub_100DEE0E4((uint64_t)value + 56);
    id v4 = (uint64_t *)self->fPersistentStoreData.__ptr_.__value_;
    [(CLGeoMapTilesPreloaderService *)self universe];
    sub_1014B0A10(v4, self->fRoutineInfo.fDistanceCalc.fRefLatDegs);
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    unsigned int v5 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "CLGMTPS,persistent store written", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      unsigned int v7 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService storeDataInPersistentStore]", "%s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
    sub_100DEE0B0((id *)self->fPersistentStoreData.__ptr_.__value_ + 7);
  }
  else
  {
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    id v6 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "CLGMTPS,invalid persistent store data pointer", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      uint64_t v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService storeDataInPersistentStore]", "%s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
  }
}

- (void)clearPersistentStore:(BOOL)a3
{
  unint64_t value = self->fPersistentStoreData.__ptr_.__value_;
  if (value)
  {
    if (!self->fSettings.fClearPersistentStore && !a3) {
      return;
    }
    sub_1014B1794((uint64_t)value);
    uint64_t v6 = *((void *)self->fPersistentStoreData.__ptr_.__value_ + 11);
    if (v6) {
      (*(void (**)(uint64_t))(*(void *)v6 + 944))(v6);
    }
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    unsigned int v7 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67240192;
      unsigned int v11 = [(CLGeoMapTilesPreloaderService *)self getPersistentStoreDataCount];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "CLGMTPS,persistent store with datacount,%{public}d,cleared", buf, 8u);
    }
    if (!sub_10013D1A0(115, 2)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    [(CLGeoMapTilesPreloaderService *)self getPersistentStoreDataCount];
    uint64_t v8 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService clearPersistentStore:]", "%s\n", v8);
    if (v8 == (char *)buf) {
      return;
    }
LABEL_26:
    free(v8);
    return;
  }
  if (qword_102419430 != -1) {
    dispatch_once(&qword_102419430, &stru_102328DC8);
  }
  int v9 = qword_102419438;
  if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "CLGMTPS,clearPersistentStore,invalid persistent store data pointer", buf, 2u);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    uint64_t v8 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService clearPersistentStore:]", "%s\n", v8);
    if (v8 != (char *)buf) {
      goto LABEL_26;
    }
  }
}

- (int)getPersistentStoreDataCount
{
  unint64_t value = self->fPersistentStoreData.__ptr_.__value_;
  if (value)
  {
    return sub_1014B19AC((uint64_t)value);
  }
  else
  {
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    id v4 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "CLGMTPS,getPersistentStoreDataCount,invalid persistent store data pointer", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      unsigned int v5 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService getPersistentStoreDataCount]", "%s\n", v5);
      if (v5 != (char *)buf) {
        free(v5);
      }
    }
    return -1;
  }
}

- (int)getPersistentStoreDataCountForType:(int)a3
{
  unint64_t value = self->fPersistentStoreData.__ptr_.__value_;
  if (value)
  {
    return sub_1014B1BF4((uint64_t)value, a3);
  }
  else
  {
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    unsigned int v5 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "CLGMTPS,getPersistentStoreDataCount,invalid persistent store data pointer", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      uint64_t v6 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService getPersistentStoreDataCountForType:]", "%s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
    return -1;
  }
}

- (void)registerForClientManagerNotification
{
  if (!self->fClientManagerClient.__ptr_.__value_)
  {
    [(CLGeoMapTilesPreloaderService *)self universe];
    sub_1007E0344();
  }
}

- (void)unregisterForClientManagerNotification
{
  unint64_t value = self->fClientManagerClient.__ptr_.__value_;
  if (value)
  {
    [*((id *)value + 2) unregister:*((void *)value + 1) forNotification:4];
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    uint64_t v3 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "CLGMTPS,unregisterForClientManagerNotification", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      id v4 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService unregisterForClientManagerNotification]", "%s\n", v4);
      if (v4 != (char *)buf) {
        free(v4);
      }
    }
  }
}

- (void)onClientManagerNotification:(int)a3 data:(uint64_t)a4
{
  if (a3 == 4)
  {
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    uint64_t v6 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_INFO))
    {
      int v7 = a1[54];
      int v8 = *(_DWORD *)(a4 + 188);
      *(_DWORD *)buf = 67240448;
      int v15 = v7;
      __int16 v16 = 1026;
      int v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "CLGMTPS,received clientManager notification,prev,%{public}d,now,%{public}d", buf, 0xEu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      int v12 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService onClientManagerNotification:data:]", "%s\n", v12);
      if (v12 != (char *)buf) {
        free(v12);
      }
    }
    int v9 = a1[54];
    if (v9 == 1)
    {
      if (!*(_DWORD *)(a4 + 188))
      {
        a1[54] = 0;
        [a1 unregisterXPCActivity:0];
        [a1 clearPersistentStore:1];
      }
    }
    else if (!v9 && *(_DWORD *)(a4 + 188) == 1)
    {
      a1[54] = 1;
      [a1 setUpRepeatingActivityToDownloadTiles];
    }
  }
  else
  {
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    unsigned int v11 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67240192;
      int v15 = a3;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "CLGMTPS,unhandled clientManager notification,%{public}d", buf, 8u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      unsigned int v13 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService onClientManagerNotification:data:]", "%s\n", v13);
      if (v13 != (char *)buf) {
        free(v13);
      }
    }
  }
}

- (void)registerForWifiServiceNotification
{
  if (!self->fWiFiServiceClient.__ptr_.__value_)
  {
    [(CLGeoMapTilesPreloaderService *)self universe];
    sub_1001AE6FC();
  }
}

- (void)unregisterForWifiServiceNotification
{
  unint64_t value = self->fWiFiServiceClient.__ptr_.__value_;
  if (value)
  {
    [*((id *)value + 2) unregister:*((void *)value + 1) forNotification:6];
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    uint64_t v3 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "CLGMTPS,unregisterForWifiServiceNotification", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      id v4 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService unregisterForWifiServiceNotification]", "%s\n", v4);
      if (v4 != (char *)buf) {
        free(v4);
      }
    }
  }
}

- (void)onWifiServiceNotification:(int)a3 data:(uint64_t)a4
{
  if (a3 == 6)
  {
    char v5 = *(unsigned char *)(a4 + 96);
    if (v5) {
      char v5 = *(_DWORD *)(a4 + 48) > 0;
    }
    *(unsigned char *)(a1 + 192) = v5;
    [(id)a1 setNewCriteria:*(unsigned int *)(a1 + 348)];
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    uint64_t v6 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_INFO))
    {
      int v7 = *(unsigned __int8 *)(a1 + 192);
      *(_DWORD *)buf = 67174657;
      int v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "CLGMTPS,received wifi service link status,%{private}d", buf, 8u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      int v8 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService onWifiServiceNotification:data:]", "%s\n");
LABEL_21:
      if (v8 != buf) {
        free(v8);
      }
    }
  }
  else
  {
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    unsigned int v10 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67174657;
      int v12 = a3;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "CLGMTPS, received unhandled wifi service notification,%{private}d", buf, 8u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      int v8 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService onWifiServiceNotification:data:]", "%s\n");
      goto LABEL_21;
    }
  }
}

- (void)registerForRoutineMonitor
{
  if (!self->fRoutineMonitor)
  {
    uint64_t v3 = (CLRoutineMonitorServiceProtocol *)[[-[CLGeoMapTilesPreloaderService universe](self, "universe") vendor] proxyForService:@"CLRoutineMonitor"];
    self->fRoutineMonitor = v3;
    [(CLRoutineMonitorServiceProtocol *)v3 registerDelegate:self inSilo:[(CLGeoMapTilesPreloaderService *)self silo]];
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    id v4 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "CLGMTPS,registerForRoutineMonitor", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      char v5 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService registerForRoutineMonitor]", "%s\n", v5);
      if (v5 != (char *)buf) {
        free(v5);
      }
    }
  }
}

- (void)unregisterForRoutineMonitor
{
  fRoutineMonitor = self->fRoutineMonitor;
  if (fRoutineMonitor) {

  }
  self->fRoutineMonitor = 0;
  if (qword_102419430 != -1) {
    dispatch_once(&qword_102419430, &stru_102328DC8);
  }
  id v4 = qword_102419438;
  if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "CLGMTPS,unregisterForRoutineMonitor", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    char v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService unregisterForRoutineMonitor]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
}

- (void)registerForTrackRunEnablementNotifications
{
  uint64_t v3 = sub_100D530F0();
  self->fIsTrackPrecachingEnabled = sub_100D5377C(v3);
  uint64_t v4 = sub_100D530F0();
  sub_100134750(__p, "CLGeoMapTilesPreloaderService");
  id v7 = [[-[CLGeoMapTilesPreloaderService universe](self, "universe") silo] queue];
  *(void *)buf = off_102328E68;
  unsigned int v11 = self;
  int v12 = buf;
  sub_100D53438(v4, (uint64_t)__p, (uint64_t *)&v7, (uint64_t)buf);
  sub_10065ABCC(buf);
  if (v9 < 0) {
    operator delete(__p[0]);
  }
  if (qword_102419430 != -1) {
    dispatch_once(&qword_102419430, &stru_102328DC8);
  }
  char v5 = qword_102419438;
  if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CLGMTPS,registerForTrackRunEnablementNotifications", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    LOWORD(__p[0]) = 0;
    uint64_t v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService registerForTrackRunEnablementNotifications]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
}

- (void)unregisterForTrackRunEnablementNotifications
{
  uint64_t v2 = sub_100D530F0();
  sub_100134750(__p, "CLGeoMapTilesPreloaderService");
  sub_100D537B8(v2, (unsigned __int8 **)__p);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
  if (qword_102419430 != -1) {
    dispatch_once(&qword_102419430, &stru_102328DC8);
  }
  uint64_t v3 = qword_102419438;
  if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(__p[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLGMTPS,unregisterForTrackRunEnablementNotifications", (uint8_t *)__p, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(__p, 0x65CuLL);
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    uint64_t v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService unregisterForTrackRunEnablementNotifications]", "%s\n", v4);
    if (v4 != (char *)__p) {
      free(v4);
    }
  }
}

- (void)registerForDaemonStatusNotification
{
  if (!self->fDaemonStatusClient.__ptr_.__value_)
  {
    [(CLGeoMapTilesPreloaderService *)self universe];
    sub_10060F068();
  }
}

- (void)unregisterForDaemonStatusNotification
{
  unint64_t value = self->fDaemonStatusClient.__ptr_.__value_;
  if (value)
  {
    [*((id *)value + 2) unregister:*((void *)value + 1) forNotification:7];
    [*((id *)self->fDaemonStatusClient.__ptr_.__value_ + 2) unregister:*((void *)self->fDaemonStatusClient.__ptr_.__value_ + 1) forNotification:13];
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    uint64_t v4 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "CLGMTPS,unregisterForDaemonStatusNotification", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      char v5 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService unregisterForDaemonStatusNotification]", "%s\n", v5);
      if (v5 != (char *)buf) {
        free(v5);
      }
    }
  }
}

- (void)onDaemonStatusNotification:(int)a3 data:(int *)a4
{
  if (a3 == 13)
  {
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    uint64_t v29 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_INFO))
    {
      int v30 = *a4;
      int v31 = *(_DWORD *)(a1 + 208);
      *(_DWORD *)buf = 67240448;
      *(_DWORD *)int v44 = v30;
      *(_WORD *)&void v44[4] = 1026;
      *(_DWORD *)&v44[6] = v31;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "CLGMTPS,received thermal notification,level,%{public}d,prevLevel,%{public}d", buf, 0xEu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      id v34 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService onDaemonStatusNotification:data:]", "%s\n", v34);
      if (v34 != (char *)buf) {
        free(v34);
      }
    }
    *(_DWORD *)(a1 + 208) = *a4;
  }
  else if (a3 == 7)
  {
    id v7 = &qword_102419000;
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    int v8 = &qword_102419000;
    char v9 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_DEFAULT))
    {
      double v39 = *(double *)a4;
      long long v42 = a4;
      int v38 = *((unsigned __int8 *)a4 + 9);
      int v40 = *(_DWORD *)(a1 + 352);
      int v41 = *(unsigned __int8 *)(a1 + 192);
      double v10 = *(double *)(a1 + 616);
      double v11 = 0.0;
      if (v10 >= 0.0) {
        double v11 = vabdd_f64(CFAbsoluteTimeGetCurrent(), *(double *)(a1 + 616));
      }
      uint64_t v12 = *(void *)(a1 + 624);
      uint64_t v13 = *(void *)(a1 + 632);
      uint64_t v14 = *(void *)(a1 + 640);
      uint64_t v37 = *(void *)(a1 + 648);
      unsigned int v15 = [(id)a1 getPersistentStoreDataCount];
      unsigned int v16 = [(id)a1 getPersistentStoreDataCountForType:0];
      unsigned int v17 = [(id)a1 getPersistentStoreDataCountForType:1];
      unsigned int v18 = [(id)a1 getPersistentStoreDataCountForType:2];
      uint64_t v19 = *(void *)(a1 + 672);
      uint64_t v20 = *(void *)(a1 + 680);
      uint64_t v21 = *(void *)(a1 + 656);
      uint64_t v22 = *(void *)(a1 + 664);
      *(_DWORD *)buf = 134353409;
      *(double *)int v44 = v39;
      *(_WORD *)&v44[8] = 1025;
      int v45 = v38;
      __int16 v46 = 1025;
      int v47 = v41;
      __int16 v48 = 1026;
      int v49 = v40;
      __int16 v50 = 2050;
      double v51 = v10;
      __int16 v52 = 2050;
      double v53 = v11;
      __int16 v54 = 2050;
      uint64_t v55 = v12;
      __int16 v56 = 2050;
      uint64_t v57 = v13;
      __int16 v58 = 2050;
      uint64_t v59 = v14;
      __int16 v60 = 2050;
      uint64_t v61 = v37;
      __int16 v62 = 1026;
      unsigned int v63 = v15;
      __int16 v64 = 1026;
      unsigned int v65 = v16;
      __int16 v66 = 1026;
      unsigned int v67 = v17;
      __int16 v68 = 1026;
      unsigned int v69 = v18;
      __int16 v70 = 2050;
      uint64_t v71 = v19;
      __int16 v72 = 2050;
      uint64_t v73 = v20;
      __int16 v74 = 2050;
      uint64_t v75 = v21;
      __int16 v76 = 2050;
      uint64_t v77 = v22;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CLGMTPS,received battery notification,level,%{public}.1lf,charging,%{private}d,wifi,%{private}d,xpcInt,%{public}d,startTime,%{public}.1lf,dT,%{public}.1lf,callBack,%{public}ld,intervalChng,%{public}ld,dwnldReq,%{public}ld,success,%{public}ld,store,%{public}d,home,%{public}d,work,%{public}d,school,%{public}d,tourist,%{public}ld,nploi,%{public}ld,road,%{public}ld,bldg,%{public}ld", buf, 0x9Au);
      a4 = v42;
      id v7 = &qword_102419000;
      int v8 = &qword_102419000;
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      if (*(double *)(a1 + 616) >= 0.0) {
        vabdd_f64(CFAbsoluteTimeGetCurrent(), *(double *)(a1 + 616));
      }
      [(id)a1 getPersistentStoreDataCount];
      [(id)a1 getPersistentStoreDataCountForType:0];
      [(id)a1 getPersistentStoreDataCountForType:1];
      [(id)a1 getPersistentStoreDataCountForType:2];
      unsigned int v33 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService onDaemonStatusNotification:data:]", "%s\n", v33);
      if (v33 != (char *)buf) {
        free(v33);
      }
      id v7 = &qword_102419000;
      int v8 = &qword_102419000;
    }
    int v23 = *((unsigned __int8 *)a4 + 9);
    int v24 = *(unsigned __int8 *)(a1 + 193);
    *(unsigned char *)(a1 + 193) = v23;
    if (v23 != v24) {
      [(id)a1 setNewCriteria:*(unsigned int *)(a1 + 348)];
    }
    if (sub_1004BABCC(*(double *)a4, 50.0, 0.01)
      || ((double v25 = *(double *)a4, *(double *)(a1 + 200) < 0.0) ? (v26 = v25 < 50.0) : (v26 = 1), !v26))
    {
      if (v7[134] != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      uint64_t v27 = v8[135];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        double v28 = *(double *)a4;
        *(_DWORD *)buf = 134349056;
        *(double *)int v44 = v28;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "CLGMTPS,prefetch LOIs at batteryLevel,%{public}.1lf", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (v7[134] != -1) {
          dispatch_once(&qword_102419430, &stru_102328DC8);
        }
        long long v36 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService onDaemonStatusNotification:data:]", "%s\n", v36);
        if (v36 != (char *)buf) {
          free(v36);
        }
      }
      [(id)a1 fetchLOIFromCoreRoutine];
      [(id)a1 fetchNPLOI];
      double v25 = *(double *)a4;
    }
    *(double *)(a1 + 200) = v25;
  }
  else
  {
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    uint64_t v32 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)int v44 = a3;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "CLGMTPS,daemonStatus notification,%{public}d", buf, 8u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      unsigned int v35 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService onDaemonStatusNotification:data:]", "%s\n", v35);
      if (v35 != (char *)buf) {
        free(v35);
      }
    }
  }
}

- (void)registerForMotionStateMediatorNotification
{
  if (!self->fMotionStateMediatorClient.__ptr_.__value_)
  {
    [(CLGeoMapTilesPreloaderService *)self universe];
    sub_1006A564C();
  }
}

- (void)unregisterForMotionStateMediatorNotification
{
  unint64_t value = self->fMotionStateMediatorClient.__ptr_.__value_;
  if (value)
  {
    [*((id *)value + 2) unregister:*((void *)value + 1) forNotification:0];
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    uint64_t v3 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "CLGMTPS,unregisterForMotionStateMediatorNotification", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      uint64_t v4 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService unregisterForMotionStateMediatorNotification]", "%s\n", v4);
      if (v4 != (char *)buf) {
        free(v4);
      }
    }
  }
}

- (uint64_t)onMotionStateMediatorNotification:(int)a3 data:(uint64_t)a4
{
  if (a3) {
    return result;
  }
  uint64_t v5 = result;
  uint64_t v6 = result + 696;
  (*(void (**)(uint64_t))(*(void *)(result + 696) + 16))(result + 696);
  id v7 = (unsigned char *)(v5 + 712);
  if (*(unsigned char *)(v5 + 712)) {
    int v8 = 1;
  }
  else {
    int v8 = *(double *)(v5 + 720) > 0.0 && vabdd_f64(sub_10016C458(), *(double *)(v5 + 720)) < 3600.0;
  }
  if (!CLMotionActivity::isTypeInVehicle())
  {
    *id v7 = 0;
    double v9 = *(double *)(v5 + 720);
LABEL_11:
    int v10 = v9 > 0.0 && vabdd_f64(sub_10016C458(), *(double *)(v5 + 720)) < 3600.0;
    goto LABEL_14;
  }
  *id v7 = 1;
  double v9 = sub_10016C458();
  *(double *)(v5 + 720) = v9;
  if (!*v7) {
    goto LABEL_11;
  }
  int v10 = 1;
LABEL_14:
  if (qword_102419430 != -1) {
    dispatch_once(&qword_102419430, &stru_102328DC8);
  }
  double v11 = qword_102419438;
  if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_DEBUG))
  {
    int v12 = *(_DWORD *)(a4 + 8);
    *(_DWORD *)buf = 67240704;
    int v15 = v12;
    __int16 v16 = 1026;
    int v17 = v8;
    __int16 v18 = 1026;
    int v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "CLGMTPS,onMotionStateMediator,type,%{public}d,inVehicleBefore,%{public}d,inVehicleAfter,%{public}d", buf, 0x14u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    uint64_t v13 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService onMotionStateMediatorNotification:data:]", "%s\n", v13);
    if (v13 != (char *)buf) {
      free(v13);
    }
  }
  if (v8 != v10) {
    [(id)v5 setNewCriteria:*(unsigned int *)(v5 + 348)];
  }
  return (*(uint64_t (**)(uint64_t))(*(void *)v6 + 24))(v6);
}

- (void)registerForMobileAssetNotification
{
  if (!self->fMobileAssetClient.__ptr_.__value_)
  {
    [(CLGeoMapTilesPreloaderService *)self universe];
    sub_1014CC69C();
  }
}

- (void)unregisterForMobileAssetNotification
{
  unint64_t value = self->fMobileAssetClient.__ptr_.__value_;
  if (value)
  {
    [*((id *)value + 2) unregister:*((void *)value + 1) forNotification:2];
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    uint64_t v3 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "CLGMTPS,unregisterForMobileAssetNotification", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      uint64_t v4 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService unregisterForMobileAssetNotification]", "%s\n", v4);
      if (v4 != (char *)buf) {
        free(v4);
      }
    }
  }
}

- (void)onMobileAssetNotification:(int)a3 data:(uint64_t)a4
{
  if (a3 == 2)
  {
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    uint64_t v6 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67240192;
      int v19 = 2;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "CLGMTPS,received MA-OTA,notification,%{public}d", buf, 8u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      v17[0] = 0x204020100;
      int v15 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService onMobileAssetNotification:data:]", "%s\n", v15);
      if (v15 != (char *)buf) {
        free(v15);
      }
    }
    sub_1000E9354(v17);
    if (sub_100012960(a4, "MapMatcherConfig", v17))
    {
      sub_10075AC38(a1 + 264, (uint64_t)v17);
      id v7 = *(void **)(a1 + 120);
      if (v7 != (void *)(a1 + 128))
      {
        do
        {
          sub_10075A6F4((uint64_t **)(a1 + 264), (std::string *)(v7 + 4), (long long *)(v7 + 7));
          int v8 = (void *)v7[1];
          if (v8)
          {
            do
            {
              double v9 = v8;
              int v8 = (void *)*v8;
            }
            while (v8);
          }
          else
          {
            do
            {
              double v9 = (void *)v7[2];
              BOOL v10 = *v9 == (void)v7;
              id v7 = v9;
            }
            while (!v10);
          }
          id v7 = v9;
        }
        while (v9 != (void *)(a1 + 128));
      }
      [(id)a1 getConfigFromMobileAssets];
      [(id)a1 setUpRepeatingActivityToDownloadTiles];
      if (*(double *)(a1 + 200) > 50.0) {
        [(id)a1 fetchLOIFromCoreRoutine];
      }
    }
    else
    {
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      uint64_t v14 = qword_102419438;
      if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "CLGMTPS,MA-OTA,map matcher config not available", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419430 != -1) {
          dispatch_once(&qword_102419430, &stru_102328DC8);
        }
        __int16 v16 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService onMobileAssetNotification:data:]", "%s\n", v16);
        if (v16 != (char *)buf) {
          free(v16);
        }
      }
    }
    sub_10013F3C4(v17);
  }
  else
  {
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    int v12 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67240192;
      int v19 = a3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "CLGMTPS,MA-OTA,invalid notification,%{public}d", buf, 8u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      LODWORD(v17[0]) = 67240192;
      HIDWORD(v17[0]) = a3;
      uint64_t v13 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService onMobileAssetNotification:data:]", "%s\n", v13);
      if (v13 != (char *)buf) {
        free(v13);
      }
    }
  }
}

- (void)setUpRepeatingActivityToDownloadTiles
{
  if (self->fXPCCurrentInterval == -1)
  {
    if (self->fPersistentStoreData.__ptr_.__value_
      && self->fGEOMapFeatureAccess
      && self->fLocationServiceState
      && self->fMapMatcherMobileAssetReader.fMapMatcherOperatingCountryConfig.__tree_.__pair3_.__value_)
    {
      [(CLGeoMapTilesPreloaderService *)self unregisterXPCActivity:1];
      uint64_t v16 = 0;
      int v17 = &v16;
      uint64_t v18 = 0x2020000000;
      CFAbsoluteTime Current = 0.0;
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      self->fRoutineInfo.fDistanceCalc.fCosRefLat = CFAbsoluteTimeGetCurrent();
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      id v7 = qword_102419438;
      if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "CLGMTPS,XPC activity Check-in", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419430 != -1) {
          dispatch_once(&qword_102419430, &stru_102328DC8);
        }
        __int16 v15 = 0;
        uint64_t v13 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService setUpRepeatingActivityToDownloadTiles]", "%s\n", v13);
        if (v13 != (char *)buf) {
          free(v13);
        }
      }
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_1014B5884;
      handler[3] = &unk_102328D58;
      handler[4] = self;
      handler[5] = &v16;
      xpc_activity_register("com.apple.locationd.GeoMapTilesPreloaderServiceDownload", XPC_ACTIVITY_CHECK_IN, handler);
      _Block_object_dispose(&v16, 8);
    }
    else
    {
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      int v8 = qword_102419438;
      if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_INFO))
      {
        int fLocationServiceState = self->fLocationServiceState;
        BOOL v10 = self->fMapMatcherMobileAssetReader.fMapMatcherOperatingCountryConfig.__tree_.__pair3_.__value_ != 0;
        *(_DWORD *)buf = 67240448;
        int v21 = fLocationServiceState;
        __int16 v22 = 1026;
        BOOL v23 = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "CLGMTPS,conditions not ideal to set XPC Activity,lsState,%{public}d,maConfig,%{public}d", buf, 0xEu);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419430 != -1) {
          dispatch_once(&qword_102419430, &stru_102328DC8);
        }
        int v11 = self->fLocationServiceState;
        BOOL v12 = self->fMapMatcherMobileAssetReader.fMapMatcherOperatingCountryConfig.__tree_.__pair3_.__value_ != 0;
        LODWORD(v16) = 67240448;
        HIDWORD(v16) = v11;
        LOWORD(v17) = 1026;
        *(_DWORD *)((char *)&v17 + 2) = v12;
        uint64_t v6 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService setUpRepeatingActivityToDownloadTiles]", "%s\n", v6);
        goto LABEL_29;
      }
    }
  }
  else
  {
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    uint64_t v3 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_INFO))
    {
      int fXPCCurrentInterval = self->fXPCCurrentInterval;
      *(_DWORD *)buf = 67240192;
      int v21 = fXPCCurrentInterval;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "CLGMTPS,activity already set with interval,%{public}d", buf, 8u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      int v5 = self->fXPCCurrentInterval;
      LODWORD(v16) = 67240192;
      HIDWORD(v16) = v5;
      uint64_t v6 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService setUpRepeatingActivityToDownloadTiles]", "%s\n", v6);
LABEL_29:
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
  }
}

- (void)setNewCriteria:(int)a3
{
  p_fTotalNPLOISectionDownloads = &self->fAnalytics.fTotalNPLOISectionDownloads;
  (*(void (**)(int64_t *, SEL))(self->fAnalytics.fTotalNPLOISectionDownloads + 16))(&self->fAnalytics.fTotalNPLOISectionDownloads, a2);
  if (!self->fAnalytics.fTotalTouristSectionDownloads)
  {
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    BOOL v10 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_ERROR))
    {
      int fXPCCurrentInterval = self->fXPCCurrentInterval;
      *(_DWORD *)buf = 67240448;
      int v33 = fXPCCurrentInterval;
      __int16 v34 = 1026;
      int v35 = a3;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "CLGMTPS,activity is nil,interval,%{public}d,newInterval,%{public}d", buf, 0xEu);
    }
    if (!sub_10013D1A0(115, 0)) {
      goto LABEL_52;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419430 == -1)
    {
LABEL_18:
      BOOL v12 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService setNewCriteria:]", "%s\n", v12);
      goto LABEL_43;
    }
LABEL_57:
    dispatch_once(&qword_102419430, &stru_102328DC8);
    goto LABEL_18;
  }
  if (self->fXPCCurrentInterval == -1)
  {
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    uint64_t v18 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67240192;
      int v33 = a3;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "CLGMTPS,activity currently not registered,interval,%{public}d", buf, 8u);
    }
    if (!sub_10013D1A0(115, 0)) {
      goto LABEL_52;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419430 == -1) {
      goto LABEL_18;
    }
    goto LABEL_57;
  }
  [(CLGeoMapTilesPreloaderService *)self setXPCActivityToDone];
  unsigned int v6 = [(CLGeoMapTilesPreloaderService *)self shouldUseAggressiveSettings];
  BOOL v7 = v6;
  int v8 = self->fXPCCurrentInterval - a3;
  if (v8 || self->fIsXPCSettingAggressive != v6)
  {
    if (v8 >= 0) {
      int v13 = self->fXPCCurrentInterval - a3;
    }
    else {
      int v13 = a3 - self->fXPCCurrentInterval;
    }
    int fXPCDownloadInterval = self->fXPCDownloadInterval;
    if (fXPCDownloadInterval != a3 && v13 < fXPCDownloadInterval)
    {
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      int v19 = qword_102419438;
      if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_DEBUG))
      {
        int v20 = self->fXPCCurrentInterval;
        *(_DWORD *)buf = 67240704;
        int v33 = a3;
        __int16 v34 = 1026;
        int v35 = v20;
        __int16 v36 = 1026;
        int v37 = v13;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "CLGMTPS,new activity interval,%{public}d,is close to current,%{public}d,delta,%{public}d", buf, 0x14u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419430 == -1)
        {
LABEL_42:
          BOOL v12 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService setNewCriteria:]", "%s\n", v12);
LABEL_43:
          if (v12 != (char *)buf) {
            free(v12);
          }
          goto LABEL_52;
        }
LABEL_59:
        dispatch_once(&qword_102419430, &stru_102328DC8);
        goto LABEL_42;
      }
    }
    else
    {
      int fMinimumBatterylevel = self->fMinimumBatterylevel;
      xpc_object_t v16 = xpc_activity_copy_criteria((xpc_activity_t)self->fAnalytics.fTotalTouristSectionDownloads);
      if (v16)
      {
        self->int fXPCCurrentInterval = a3;
        self->BOOL fIsXPCSettingAggressive = v7;
        xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
        if (v7)
        {
          xpc_dictionary_set_BOOL(v16, XPC_ACTIVITY_ALLOW_BATTERY, 1);
          xpc_dictionary_set_string(v16, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
          xpc_dictionary_set_BOOL(v16, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, 0);
          int v17 = (const char *)[(id)off_1024790A0() cStringUsingEncoding:4];
          xpc_dictionary_set_int64(xdict, v17, self->fMinimumBatteryLevelAggressiveMode);
          int fMinimumBatterylevel = self->fMinimumBatteryLevelAggressiveMode;
        }
        else
        {
          xpc_dictionary_set_BOOL(v16, XPC_ACTIVITY_ALLOW_BATTERY, 0);
          xpc_dictionary_set_string(v16, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
          xpc_dictionary_set_BOOL(v16, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, 1);
          int v21 = (const char *)[(id)off_1024790A0() cStringUsingEncoding:4];
          xpc_dictionary_set_int64(xdict, v21, self->fMinimumBatterylevel);
        }
        xpc_dictionary_set_value(v16, XPC_ACTIVITY_DUET_ACTIVITY_SCHEDULER_DATA, xdict);
        xpc_dictionary_set_int64(v16, XPC_ACTIVITY_NETWORK_DOWNLOAD_SIZE, self->fDownloadSizePerSection);
        xpc_dictionary_set_int64(v16, XPC_ACTIVITY_NETWORK_UPLOAD_SIZE, self->fUploadSizePerSection);
        xpc_dictionary_set_int64(v16, XPC_ACTIVITY_EXPECTED_DURATION, self->fDownloadTimePerSection);
        xpc_dictionary_set_BOOL(v16, XPC_ACTIVITY_DISK_INTENSIVE, self->fIsDiskIntensiveActivity);
        xpc_dictionary_set_int64(v16, XPC_ACTIVITY_INTERVAL, self->fXPCCurrentInterval);
        ++*(void *)&self->fAnalytics.fXPCSetUpTime;
        if (qword_102419430 != -1) {
          dispatch_once(&qword_102419430, &stru_102328DC8);
        }
        __int16 v22 = qword_102419438;
        if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_INFO))
        {
          int v23 = self->fXPCCurrentInterval;
          int fDownloadSizePerSection = self->fDownloadSizePerSection;
          int fUploadSizePerSection = self->fUploadSizePerSection;
          int fDownloadTimePerSection = self->fDownloadTimePerSection;
          double fXPCSetUpTime = self->fAnalytics.fXPCSetUpTime;
          BOOL fIsXPCSettingAggressive = self->fIsXPCSettingAggressive;
          *(_DWORD *)buf = 67241728;
          int v33 = v23;
          __int16 v34 = 1026;
          int v35 = fMinimumBatterylevel;
          __int16 v36 = 1026;
          int v37 = fDownloadSizePerSection;
          __int16 v38 = 1026;
          int v39 = fUploadSizePerSection;
          __int16 v40 = 1026;
          int v41 = fDownloadTimePerSection;
          __int16 v42 = 2050;
          double v43 = fXPCSetUpTime;
          __int16 v44 = 1026;
          BOOL v45 = fIsXPCSettingAggressive;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "CLGMTPS,Setting new XPC interval,%{public}d,minimumBatterylevel,%{public}d,downloadSz,%{public}d,uploadSz,%{public}d,downloadTime,%{public}d,changeCount,%{public}ld,aggressive,%{public}d", buf, 0x30u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419430 != -1) {
            dispatch_once(&qword_102419430, &stru_102328DC8);
          }
          uint64_t v29 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService setNewCriteria:]", "%s\n", v29);
          if (v29 != (char *)buf) {
            free(v29);
          }
        }
        xpc_activity_set_criteria((xpc_activity_t)self->fAnalytics.fTotalTouristSectionDownloads, v16);
        xpc_release(xdict);
        xpc_release(v16);
      }
    }
  }
  else
  {
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    double v9 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67240448;
      int v33 = a3;
      __int16 v34 = 1026;
      int v35 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "CLGMTPS,activity interval,%{public}d,already set,aggressive,%{public}d", buf, 0xEu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419430 == -1) {
        goto LABEL_42;
      }
      goto LABEL_59;
    }
  }
LABEL_52:
  (*(void (**)(int64_t *))(*p_fTotalNPLOISectionDownloads + 24))(p_fTotalNPLOISectionDownloads);
}

- (void)unregisterXPCActivity:(BOOL)a3
{
  BOOL v3 = a3;
  if (!a3 && self->fXPCCurrentInterval == -1)
  {
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    BOOL v7 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "CLGMTPS,activity not registered, nothing to unregister", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      int v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService unregisterXPCActivity:]", "%s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
  }
  else
  {
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    int v5 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_INFO))
    {
      int fXPCCurrentInterval = self->fXPCCurrentInterval;
      *(_DWORD *)buf = 67240448;
      int v11 = fXPCCurrentInterval;
      __int16 v12 = 1026;
      BOOL v13 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "CLGMTPS,activity with interval,%{public}d,unregistered,force,%{public}d", buf, 0xEu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      double v9 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService unregisterXPCActivity:]", "%s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
    self->int fXPCCurrentInterval = -1;
    xpc_activity_unregister("com.apple.locationd.GeoMapTilesPreloaderServiceDownload");
    self->fAnalytics.fTotalTouristSectionDownloads = 0;
  }
}

- (void)setXPCActivityToDone
{
  p_fTotalNPLOISectionDownloads = &self->fAnalytics.fTotalNPLOISectionDownloads;
  (*(void (**)(int64_t *, SEL))(self->fAnalytics.fTotalNPLOISectionDownloads + 16))(&self->fAnalytics.fTotalNPLOISectionDownloads, a2);
  fTotalTouristSectionDownloads = (_xpc_activity_s *)self->fAnalytics.fTotalTouristSectionDownloads;
  if (fTotalTouristSectionDownloads)
  {
    if (xpc_activity_get_state(fTotalTouristSectionDownloads) != 4) {
      goto LABEL_23;
    }
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    int v5 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "CLGMTPS,Set xpcActivity to Done", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      BOOL v10 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService setXPCActivityToDone]", "%s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
    }
    if (xpc_activity_set_state((xpc_activity_t)self->fAnalytics.fTotalTouristSectionDownloads, 5)) {
      goto LABEL_23;
    }
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    unsigned int v6 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_INFO))
    {
      xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)self->fAnalytics.fTotalTouristSectionDownloads);
      *(_DWORD *)buf = 134349056;
      xpc_activity_state_t v12 = state;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "CLGMTPS,failed to mark xpcActivity as Done,XPC error,currentState,%{public}ld", buf, 0xCu);
    }
    if (!sub_10013D1A0(115, 2)) {
      goto LABEL_23;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    xpc_activity_get_state((xpc_activity_t)self->fAnalytics.fTotalTouristSectionDownloads);
    int v8 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService setXPCActivityToDone]", "%s\n", v8);
    if (v8 == (char *)buf) {
      goto LABEL_23;
    }
LABEL_27:
    free(v8);
    goto LABEL_23;
  }
  if (qword_102419430 != -1) {
    dispatch_once(&qword_102419430, &stru_102328DC8);
  }
  double v9 = qword_102419438;
  if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "CLGMTPS,setXPCActivityToDone,activity is nil", buf, 2u);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    int v8 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLGeoMapTilesPreloaderService setXPCActivityToDone]", "%s\n", v8);
    if (v8 != (char *)buf) {
      goto LABEL_27;
    }
  }
LABEL_23:
  (*(void (**)(int64_t *))(*p_fTotalNPLOISectionDownloads + 24))(p_fTotalNPLOISectionDownloads);
}

- (BOOL)shouldUseAggressiveSettings
{
  if (*(_DWORD *)&self->fRoutineInfo.fLastUserLocation.fromSimulationController != 2
    || self->fIsCharging && self->fIsWiFiAssociated
    || LOBYTE(self->fGeoMapTilesPreloaderMutex.fMutex._vptr$Mutex)
    || *(double *)&self->fGeoMapTilesPreloaderMutex.fMutex.info > 0.0
    && vabdd_f64(sub_10016C458(), *(double *)&self->fGeoMapTilesPreloaderMutex.fMutex.info) < 3600.0
    || SLODWORD(self->fTotalTimeSpentDownloadingData.__tree_.__pair3_.__value_) < 1)
  {
    return 0;
  }
  [(CLGeoMapTilesPreloaderService *)self getConfigFromMobileAssets];
  return sub_1014A9AA4((uint64_t)v4);
}

- (BOOL)isAggressiveSettingDataDownloadLimitCrossed:(const CLMapMatcherGeoTilesPrecachingConfig *)a3 building:(BOOL)a4
{
  if (!self->fIsXPCSettingAggressive) {
    return 0;
  }
  unint64_t value = self->fPersistentStoreData.__ptr_.__value_;
  if (!value) {
    return 0;
  }
  int v5 = (uint64_t *)*((void *)value + 16);
  if (!v5) {
    return 0;
  }
  BOOL v6 = a4;
  while (1)
  {
    int v8 = *((_DWORD *)v5 + 8);
    if (v8 <= 6) {
      break;
    }
LABEL_8:
    int v5 = (uint64_t *)*v5;
    if (!v5) {
      return 0;
    }
  }
  if (v8 != 6)
  {
    ++v5;
    goto LABEL_8;
  }
  int v11 = sub_1014B7BC0((uint64_t)value, 6, a4, (double)a3->var24);
  int var23 = a3->var23;
  BOOL v9 = v11 >= var23;
  if (qword_102419430 != -1) {
    dispatch_once(&qword_102419430, &stru_102328DC8);
  }
  BOOL v13 = qword_102419438;
  if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67240704;
    int v16 = v11;
    __int16 v17 = 1026;
    BOOL v18 = v6;
    __int16 v19 = 1026;
    BOOL v20 = v11 >= var23;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "CLGMTPS,isAggressiveSettingDataDownloadLimitCrossed,numDownloaded,%{public}d,building,%{public}d,limitCrossed,%{public}d", buf, 0x14u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    uint64_t v14 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService isAggressiveSettingDataDownloadLimitCrossed:building:]", "%s\n", v14);
    if (v14 != (char *)buf) {
      free(v14);
    }
  }
  return v9;
}

- (void)registerForLocationNotification
{
}

- (void)unregisterForLocationNotification
{
  unint64_t value = self->fLocationClient.__ptr_.__value_;
  if (value)
  {
    [*((id *)value + 2) unregister:*((void *)value + 1) forNotification:5];
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    BOOL v3 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "CLGMTPS,unregisterForClientManagerNotification", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      uint64_t v4 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService unregisterForLocationNotification]", "%s\n", v4);
      if (v4 != (char *)buf) {
        free(v4);
      }
    }
  }
}

- (int)getSectionNotDownloadedYet:()map<int maxSections:()double
{
  if (a4 < 1) {
    return -1;
  }
  int v4 = 0;
  int result = -1;
  do
  {
    if (!a3->var0.var1.var0.__left_) {
      return 0;
    }
    left = a3->var0.var1.var0.__left_;
    while (1)
    {
      int v7 = left[8];
      if (v4 >= v7) {
        break;
      }
LABEL_8:
      left = *(_DWORD **)left;
      if (!left) {
        return v4;
      }
    }
    if (v7 < v4)
    {
      left += 2;
      goto LABEL_8;
    }
    ++v4;
  }
  while (v4 != a4);
  return result;
}

- (int)getSectionToBeRefreshed:()map<int maxSections:()double refreshPeriod:()std:(std:(double>>> *)a3 :(int)a4 allocator<std:(int)a5 :pair<const)int :less<int>
{
  double Current = CFAbsoluteTimeGetCurrent();
  int v14 = 0;
  if (a4 < 1) {
    return -1;
  }
  double v9 = Current;
  int result = 0;
  while (2)
  {
    left = a3->var0.var1.var0.__left_;
    if (!left) {
      goto LABEL_10;
    }
    while (1)
    {
      int v12 = left[8];
      if (result >= v12) {
        break;
      }
LABEL_7:
      left = *(_DWORD **)left;
      if (!left) {
        goto LABEL_10;
      }
    }
    if (v12 < result)
    {
      left += 2;
      goto LABEL_7;
    }
    __int16 v15 = &v14;
    double v13 = vabdd_f64(*((double *)sub_1000FEE0C((uint64_t **)a3, &v14, (uint64_t)&unk_101D0B290, &v15) + 5), v9);
    int result = v14;
    if (v13 <= (double)a5)
    {
LABEL_10:
      int v14 = ++result;
      if (result >= a4) {
        return -1;
      }
      continue;
    }
    return result;
  }
}

- (void)registerForDataProtectionNotification
{
  if (!self->fDataProtectionClient.__ptr_.__value_)
  {
    [(CLGeoMapTilesPreloaderService *)self universe];
    sub_100EB2E6C();
  }
}

- (void)unregisterForDataProtectionNotification
{
  unint64_t value = self->fDataProtectionClient.__ptr_.__value_;
  if (value)
  {
    [*((id *)value + 2) unregister:*((void *)value + 1) forNotification:0];
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    int v4 = qword_102419438;
    if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "CLGMTPS,unregistered for data protection notifications", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419430 != -1) {
        dispatch_once(&qword_102419430, &stru_102328DC8);
      }
      BOOL v6 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService unregisterForDataProtectionNotification]", "%s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
    LOBYTE(self->fTimeOfLastWorkoutQuery) = 0;
    int v5 = self->fDataProtectionClient.__ptr_.__value_;
    self->fDataProtectionClient.__ptr_.__value_ = 0;
    if (v5) {
      (*(void (**)(Client *))(*(void *)v5 + 8))(v5);
    }
  }
}

- (uint64_t)onDataProtectionNotification:(int)a3 data:(int)a4
{
  uint64_t v7 = a1 + 696;
  (*(void (**)(uint64_t))(*(void *)(a1 + 696) + 16))(a1 + 696);
  if (!a3)
  {
    if (a4 == 1)
    {
      *(unsigned char *)(a1 + 792) = 1;
      [(id)a1 fetchWorkoutCount:1];
    }
    else
    {
      *(unsigned char *)(a1 + 792) = 0;
    }
  }
  if (qword_102419430 != -1) {
    dispatch_once(&qword_102419430, &stru_102328DC8);
  }
  int v8 = qword_102419438;
  if (os_log_type_enabled((os_log_t)qword_102419438, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67240448;
    int v12 = a3;
    __int16 v13 = 1026;
    int v14 = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "CLGMTPS,Received dataProtectionManager notification,%{public}d,data availability %{public}d", buf, 0xEu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419430 != -1) {
      dispatch_once(&qword_102419430, &stru_102328DC8);
    }
    BOOL v10 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGeoMapTilesPreloaderService onDataProtectionNotification:data:]", "%s\n", v10);
    if (v10 != (char *)buf) {
      free(v10);
    }
  }
  return (*(uint64_t (**)(uint64_t))(*(void *)v7 + 24))(v7);
}

- (void).cxx_destruct
{
  BOOL v3 = *(std::__shared_weak_count **)&self->fDeviceCurrentlyUnlocked;
  if (v3) {
    sub_1000DB0A0(v3);
  }
  sub_1000F5BB0((uint64_t)&self->fVehicleMotionTracker, *(void **)&self->fVehicleMotionTracker.fVehicleActivitySetTimeMachCont);
  sub_10051310C(&self->fAnalytics.fTotalNPLOISectionDownloads);
  sub_1000F5BB0((uint64_t)&self->fRoutineInfo.fLOICoarseCoordinates, (void *)self->fRoutineInfo.fLOICoarseCoordinates.__tree_.__pair1_.__value_.__left_);
  sub_10075FBA0((uint64_t)&self->fMapMatcherMobileAssetReader, (void *)self->fMapMatcherMobileAssetReader.fMapMatcherOperatingCountryConfig.__tree_.__pair1_.__value_.__left_);
  sub_1000DB264((uint64_t)&self->fSettings.fAdditionalCountryConfigs, (char *)self->fSettings.fAdditionalCountryConfigs.__tree_.__pair1_.__value_.__left_);
  unint64_t value = self->fPersistentStoreData.__ptr_.__value_;
  self->fPersistentStoreData.__ptr_.__value_ = 0;
  if (value) {
    sub_1014BBDE4((uint64_t)&self->fPersistentStoreData, (uint64_t)value);
  }
  int v5 = self->fDataProtectionClient.__ptr_.__value_;
  self->fDataProtectionClient.__ptr_.__value_ = 0;
  if (v5) {
    (*(void (**)(Client *))(*(void *)v5 + 8))(v5);
  }
  BOOL v6 = self->fLocationClient.__ptr_.__value_;
  self->fLocationClient.__ptr_.__value_ = 0;
  if (v6) {
    (*(void (**)(Client *))(*(void *)v6 + 8))(v6);
  }
  uint64_t v7 = self->fMotionStateMediatorClient.__ptr_.__value_;
  self->fMotionStateMediatorClient.__ptr_.__value_ = 0;
  if (v7) {
    (*(void (**)(Client *))(*(void *)v7 + 8))(v7);
  }
  int v8 = self->fMobileAssetClient.__ptr_.__value_;
  self->fMobileAssetClient.__ptr_.__value_ = 0;
  if (v8) {
    (*(void (**)(Client *))(*(void *)v8 + 8))(v8);
  }
  double v9 = self->fClientManagerClient.__ptr_.__value_;
  self->fClientManagerClient.__ptr_.__value_ = 0;
  if (v9) {
    (*(void (**)(Client *))(*(void *)v9 + 8))(v9);
  }
  BOOL v10 = self->fDaemonStatusClient.__ptr_.__value_;
  self->fDaemonStatusClient.__ptr_.__value_ = 0;
  if (v10) {
    (*(void (**)(Client *))(*(void *)v10 + 8))(v10);
  }
  int v11 = self->fWiFiServiceClient.__ptr_.__value_;
  self->fWiFiServiceClient.__ptr_.__value_ = 0;
  if (v11)
  {
    int v12 = *(void (**)(void))(*(void *)v11 + 8);
    v12();
  }
}

- (id).cxx_construct
{
  self->fWiFiServiceClient.__ptr_.__value_ = 0;
  self->fDaemonStatusClient.__ptr_.__value_ = 0;
  self->fClientManagerClient.__ptr_.__value_ = 0;
  self->fMobileAssetClient.__ptr_.__value_ = 0;
  self->fMotionStateMediatorClient.__ptr_.__value_ = 0;
  self->fLocationClient.__ptr_.__value_ = 0;
  self->fDataProtectionClient.__ptr_.__value_ = 0;
  self->fPersistentStoreData.__ptr_.__value_ = 0;
  self->fSettings.fEnabled = 1;
  self->fSettings.int fMinimumBatteryLevel = -1;
  self->fSettings.double fLongitudeInDeg = 0.0;
  self->fSettings.fRadiusInMeters = 0.0;
  self->fSettings.double fLatitudeInDeg = 0.0;
  *(_WORD *)&self->fSettings.fUseMotionStateStationaryAsXPCCriteria = 1;
  self->fSettings.fAdditionalCountryConfigs.__tree_.__pair3_.__value_ = 0;
  self->fSettings.fAdditionalCountryConfigs.__tree_.__pair1_.__value_.__left_ = 0;
  self->fSettings.fAddFakeNPLOIData = 0;
  self->fSettings.int fMapsBuildingTileStyleToUse = 1;
  self->fSettings.fAdditionalCountryConfigs.__tree_.__begin_node_ = &self->fSettings.fAdditionalCountryConfigs.__tree_.__pair1_;
  sub_101171D90((uint64_t)&self->fDistanceCalc);
  self->fMapMatcherMobileAssetReader.fMapMatcherOperatingCountryConfig.__tree_.__pair1_.__value_.__left_ = 0;
  self->fMapMatcherMobileAssetReader.fMapMatcherOperatingCountryConfig.__tree_.__begin_node_ = &self->fMapMatcherMobileAssetReader.fMapMatcherOperatingCountryConfig.__tree_.__pair1_;
  self->fMapMatcherMobileAssetReader.fMapMatcherOperatingCountryConfig.__tree_.__pair3_.__value_ = 0;
  self->fMapMatcherMobileAssetReader.fRoadWidthBufferForFitnessUseCase = 5.0;
  *(_WORD *)&self->fMapMatcherMobileAssetReader.fUseMapDataBuffer = 257;
  *(_OWORD *)&self->fMapMatcherMobileAssetReader.fMapsRoadDataBufferRadiusVehicle = xmmword_101DAE050;
  self->fMapMatcherMobileAssetReader.fMapsBuildingDataBufferRadiusBicycle = 125;
  self->fMapMatcherMobileAssetReader.fTrackRunProximityThreshold = 100.0;
  self->fRoutineInfo.fLOICoarseCoordinateRequestMachContTime = -1.0;
  self->fRoutineInfo.fLOICoarseCoordinates.__tree_.__pair1_.__value_.__left_ = 0;
  self->fRoutineInfo.fLOICoarseCoordinates.__tree_.__begin_node_ = &self->fRoutineInfo.fLOICoarseCoordinates.__tree_.__pair1_;
  self->fRoutineInfo.fLOICoarseCoordinates.__tree_.__pair3_.__value_ = 0;
  self->fRoutineInfo.fLastUserLocation.suitability = 0xFFFF;
  *(double *)((char *)&self->fRoutineInfo.fLastUserLocation.coordinate.latitude + 4) = 0.0;
  *(void *)(&self->fRoutineInfo.fLastUserLocation.suitability + 1) = 0;
  *(_OWORD *)((char *)&self->fRoutineInfo.fLastUserLocation.coordinate.longitude + 4) = xmmword_101D1C320;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)((char *)&self->fRoutineInfo.fLastUserLocation.altitude + 4) = _Q0;
  *(_OWORD *)((char *)&self->fRoutineInfo.fLastUserLocation.speed + 4) = _Q0;
  *(_OWORD *)((char *)&self->fRoutineInfo.fLastUserLocation.course + 4) = _Q0;
  HIDWORD(self->fRoutineInfo.fLastUserLocation.timestamp) = 0;
  LODWORD(self->fRoutineInfo.fLastUserLocation.rawCoordinate.latitude) = 0;
  self->fRoutineInfo.fLastUserLocation.lifespan = 0.0;
  *(void *)&self->fRoutineInfo.fLastUserLocation.type = 0;
  *(void *)&self->fRoutineInfo.fLastUserLocation.confidence = 0xBFF0000000000000;
  *(double *)((char *)&self->fRoutineInfo.fLastUserLocation.rawCoordinate.latitude + 4) = -1.0;
  HIDWORD(self->fRoutineInfo.fLastUserLocation.rawCoordinate.longitude) = 0x7FFFFFFF;
  *(void *)&self->fRoutineInfo.fLastUserLocation.floor = 0;
  *(void *)&self->fRoutineInfo.fLastUserLocation.referenceFrame = 0;
  self->fRoutineInfo.fLastUserLocation.rawCourse = 0.0;
  LOBYTE(self->fRoutineInfo.fLastUserLocation.signalEnvironmentType) = 0;
  self->fRoutineInfo.fLastUserLocation.ellipsoidalAltitude = -1.0;
  *(_DWORD *)&self->fRoutineInfo.fLastUserLocation.fromSimulationController = 0;
  sub_101171D90((uint64_t)&self->fRoutineInfo.fLastTouristModeQueryMachContTime);
  self->fRoutineInfo.fDistanceCalc.fRefLatDegs = -1.0;
  self->fRoutineInfo.fDistanceCalc.fCosRefLat = -1.0;
  *(_OWORD *)&self->fRoutineInfo.fNPLOIQueryTime = 0u;
  *(_OWORD *)&self->fAnalytics.fXPCCallBackCount = 0u;
  *(_OWORD *)&self->fAnalytics.fDownloadRequestCount = 0u;
  *(_OWORD *)&self->fAnalytics.fTotalRoadTilesCount = 0u;
  sub_100513074(&self->fAnalytics.fTotalNPLOISectionDownloads, "CLGeoMapTilesPreloaderMutex", 1, 1);
  LOBYTE(self->fGeoMapTilesPreloaderMutex.fMutex._vptr$Mutex) = 0;
  self->fGeoMapTilesPreloaderMutex.fMutex.info = (MutexInfo *)0xBFF0000000000000;
  self->fTotalTimeSpentDownloadingData.__tree_.__begin_node_ = 0;
  self->fVehicleMotionTracker.fVehicleActivitySetTimeMachCont = 0.0;
  *(void *)&self->fVehicleMotionTracker.fIsInVehicle = &self->fVehicleMotionTracker.fVehicleActivitySetTimeMachCont;
  self->fHealthStore = 0;
  *(void *)&self->fDeviceCurrentlyUnlocked = 0;
  return self;
}

@end