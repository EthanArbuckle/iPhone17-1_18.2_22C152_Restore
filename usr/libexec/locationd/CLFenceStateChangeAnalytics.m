@interface CLFenceStateChangeAnalytics
- (CLFenceAnalyticsManager)fenceAnalyticsManager;
- (CLFenceStateChangeAnalytics)initWithUniverse:(id)a3 fenceAnalyticsManager:(id)a4;
- (CLIntersiloUniverse)universe;
- (id)createMetricsDict:(id)a3 isInternal:(BOOL)a4;
- (uint64_t)evaluatePossibleFalseExitFromNotification:(long long *)a3;
- (uint64_t)submitAllMetricsFromNotification:(long long *)a3;
- (unint64_t)binForDistance:(double)a3;
- (unint64_t)binForFenceRadius:(double)a3;
- (unint64_t)binForSteps:(int)a3;
- (unint64_t)binForTimeInterval:(double)a3;
- (void)conditionsSatisfiedForFalseExitFromNotification:(long long *)a3 handler:(uint64_t)a4;
- (void)dealloc;
- (void)extractAnalyticsFromNotification:(uint64_t)a1 isInternal:handler:;
- (void)promptPossibleFalseExitDetectionUI;
- (void)setFenceAnalyticsManager:(id)a3;
- (void)setUniverse:(id)a3;
@end

@implementation CLFenceStateChangeAnalytics

- (CLFenceStateChangeAnalytics)initWithUniverse:(id)a3 fenceAnalyticsManager:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CLFenceStateChangeAnalytics;
  v6 = [(CLFenceStateChangeAnalytics *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(CLFenceStateChangeAnalytics *)v6 setUniverse:a3];
    [(CLFenceStateChangeAnalytics *)v7 setFenceAnalyticsManager:a4];
    v7->_binsForDistances = (NSArray *)&off_102397F20;
    v7->_binsForFenceRadius = (NSArray *)&off_102397F38;
    v7->_binsForSteps = (NSArray *)&off_102397F50;
    v7->_binsForTimeIntervals = (NSArray *)&off_102397F68;
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLFenceStateChangeAnalytics;
  [(CLFenceStateChangeAnalytics *)&v3 dealloc];
}

- (unint64_t)binForDistance:(double)a3
{
  id v3 = +[CLFenceBinner binForNumber:bins:](CLFenceBinner, "binForNumber:bins:", +[NSNumber numberWithDouble:a3], self->_binsForDistances);

  return (unint64_t)[v3 unsignedIntegerValue];
}

- (unint64_t)binForFenceRadius:(double)a3
{
  id v3 = +[CLFenceBinner binForNumber:bins:](CLFenceBinner, "binForNumber:bins:", +[NSNumber numberWithDouble:a3], self->_binsForFenceRadius);

  return (unint64_t)[v3 unsignedIntegerValue];
}

- (unint64_t)binForSteps:(int)a3
{
  id v3 = +[CLFenceBinner binForNumber:bins:](CLFenceBinner, "binForNumber:bins:", +[NSNumber numberWithInt:*(void *)&a3], self->_binsForSteps);

  return (unint64_t)[v3 unsignedIntegerValue];
}

- (unint64_t)binForTimeInterval:(double)a3
{
  id v3 = +[CLFenceBinner binForNumber:bins:](CLFenceBinner, "binForNumber:bins:", +[NSNumber numberWithDouble:a3], self->_binsForTimeIntervals);

  return (unint64_t)[v3 unsignedIntegerValue];
}

- (void)extractAnalyticsFromNotification:(uint64_t)a1 isInternal:handler:
{
  __chkstk_darwin(a1);
  uint64_t v2 = v1;
  int v47 = v3;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v49 = mach_continuous_time();
  if (qword_1024193C0 != -1) {
    dispatch_once(&qword_1024193C0, &stru_10230E048);
  }
  v8 = qword_1024193C8;
  if (os_log_type_enabled((os_log_t)qword_1024193C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#FenceMetrics Extracting and submitting state change analytics", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193C0 != -1) {
      dispatch_once(&qword_1024193C0, &stru_10230E048);
    }
    LOWORD(__dst[0]) = 0;
    v45 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLFenceStateChangeAnalytics extractAnalyticsFromNotification:isInternal:handler:]", "%s\n", v45);
    if (v45 != (char *)buf) {
      free(v45);
    }
  }
  objc_super v9 = dispatch_group_create();
  int v48 = *(_DWORD *)(v7 + 8);
  *(_DWORD *)(v7 + 8) = v48 + 1;
  long long v10 = *(_OWORD *)(v5 + 752);
  v151[4] = *(_OWORD *)(v5 + 736);
  v151[5] = v10;
  v151[6] = *(_OWORD *)(v5 + 768);
  v152[0] = *(double *)(v5 + 784);
  long long v11 = *(_OWORD *)(v5 + 688);
  v151[0] = *(_OWORD *)(v5 + 672);
  v151[1] = v11;
  long long v12 = *(_OWORD *)(v5 + 720);
  v151[2] = *(_OWORD *)(v5 + 704);
  v151[3] = v12;
  v13 = objc_alloc_init(CLFenceStateChangeMetrics);
  memcpy(__dst, (const void *)(v5 + 664), sizeof(__dst));
  sub_10048AEC0((char *)v134, (long long *)v5);
  v14 = +[NSDate dateWithTimeIntervalSinceReferenceDate:*(double *)&__dst[8]];
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_102485028, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_102485028))
  {
    sub_101171D90((uint64_t)dbl_102485000);
    __cxa_guard_release(&qword_102485028);
  }
  [(CLFenceStateChangeMetrics *)v13 setAdjustedDistance:(unint64_t)*(double *)&__dst[39]];
  -[CLFenceStateChangeMetrics setDistanceToFenceBoundary:](v13, "setDistanceToFenceBoundary:", [(id)v7 binForDistance:*((double *)&__dst[38] + 1) - sub_100044A78((uint64_t)v134)]);
  -[CLFenceStateChangeMetrics setAdjustedDistanceToFenceBoundary:](v13, "setAdjustedDistanceToFenceBoundary:", [(id)v7 binForDistance:*(double *)&__dst[39] - sub_100044A78((uint64_t)v134)]);
  -[CLFenceStateChangeMetrics setEntryRadius:](v13, "setEntryRadius:", [(id)v7 binForDistance:*(double *)&__dst[40]]);
  double v15 = -1.0;
  if (v141 > 0.0) {
    double v15 = *(double *)&__dst[8] - v141;
  }
  -[CLFenceStateChangeMetrics setEventLatency:](v13, "setEventLatency:", [(id)v7 binForTimeInterval:v15]);
  v16 = *(void **)(v7 + 56);
  sub_10048AEC0((char *)v123, (long long *)v134);
  [v16 updateTimeToInitialStateChangeForFence:v123 previousStatus:LODWORD(__dst[38]) timeOfStateChange:*(double *)&__dst[8]];
  if (__p)
  {
    v133 = __p;
    operator delete(__p);
  }

  if (v130 < 0) {
    operator delete(v129);
  }
  if (v128 < 0) {
    operator delete(v127);
  }
  if (v126 < 0) {
    operator delete(v125);
  }
  if (v124 < 0) {
    operator delete(v123[0]);
  }
  v17 = *(void **)(v7 + 56);
  sub_10048AEC0((char *)v112, (long long *)v134);
  id v18 = [v17 historicalFenceStateForFence:v112];
  if (v121)
  {
    v122 = v121;
    operator delete(v121);
  }

  if (v119 < 0) {
    operator delete(v118);
  }
  if (v117 < 0) {
    operator delete(v116);
  }
  if (v115 < 0) {
    operator delete(v114);
  }
  if (v113 < 0) {
    operator delete(v112[0]);
  }
  [v18 timeToInitialStateChange];
  -[CLFenceStateChangeMetrics setTimeToInitialStateChange:](v13, "setTimeToInitialStateChange:", (int)[+[CLFenceBinner binForNumber:bins:](CLFenceBinner, "binForNumber:bins:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), *(void *)(v7 + 40)) intValue]);
  [(CLFenceStateChangeMetrics *)v13 setCurrentState:SLODWORD(__dst[0])];
  [(CLFenceStateChangeMetrics *)v13 setEventType:+[CLFenceAnalyticsCommon fenceEventType:HIDWORD(__dst[37])]];
  -[CLFenceStateChangeMetrics setExitRadius:](v13, "setExitRadius:", [(id)v7 binForDistance:*((double *)&__dst[40] + 1)]);
  -[CLFenceStateChangeMetrics setLocationAccuracy:](v13, "setLocationAccuracy:", [(id)v7 binForDistance:*(double *)((char *)&__dst[9] + 12)]);
  [(CLFenceStateChangeMetrics *)v13 setLocationProvider:DWORD2(__dst[14])];
  -[CLFenceStateChangeMetrics setPreviousLocationAccuracy:](v13, "setPreviousLocationAccuracy:", [(id)v7 binForDistance:*(double *)((char *)&__dst[29] + 4)]);
  [(NSDate *)v14 timeIntervalSinceDate:+[NSDate dateWithTimeIntervalSinceReferenceDate:*(double *)((char *)&__dst[32] + 12)]];
  -[CLFenceStateChangeMetrics setPreviousLocationAge:](v13, "setPreviousLocationAge:", (int)[+[CLFenceBinner binForNumber:bins:](CLFenceBinner, "binForNumber:bins:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), *(void *)(v7 + 40)) intValue]);
  [(CLFenceStateChangeMetrics *)v13 setPreviousLocationProvider:LODWORD(__dst[34])];
  [(NSDate *)v14 timeIntervalSinceDate:+[NSDate dateWithTimeIntervalSinceReferenceDate:*(double *)&__dst[23]]];
  [-[CLFenceStateChangeMetrics setLastHandledLocationAge:](v13, "setLastHandledLocationAge:", [v7 binForTimeInterval:]);
  [(CLFenceStateChangeMetrics *)v13 setLastHandledLocationProvider:DWORD1(__dst[24])];
  -[CLFenceStateChangeMetrics setLastHandledLocationAccuracy:](v13, "setLastHandledLocationAccuracy:", [(id)v7 binForDistance:*((double *)&__dst[19] + 1)]);
  [(CLFenceStateChangeMetrics *)v13 setSignalEnvironmentType:DWORD1(__dst[17])];
  [(CLFenceStateChangeMetrics *)v13 setSignificantFence:(v142 >> 7) & 1];
  [(CLFenceStateChangeMetrics *)v13 setSettledState:DWORD1(__dst[38])];
  [(CLFenceStateChangeMetrics *)v13 setIsFreeWake:LOBYTE(v151[0])];
  [(NSDate *)v14 timeIntervalSinceReferenceDate];
  *(void *)buf = v19;
  -[CLFenceStateChangeMetrics setTimeSinceWifiRoam:](v13, "setTimeSinceWifiRoam:", [v7 binForTimeInterval:sub_100DCDB7C((uint64_t)v151, (double *)buf, v152)]);
  dispatch_group_enter(v9);
  v20 = *(void **)(v7 + 56);
  v110[0] = _NSConcreteStackBlock;
  v110[1] = 3221225472;
  v110[2] = sub_101097C34;
  v110[3] = &unk_10230DEF8;
  int v111 = v48;
  v110[6] = v49;
  v110[4] = v13;
  v110[5] = v9;
  [v20 fetchLocationSystemStateWithHandler:v110];
  v108[6] = __dst[48];
  v108[7] = __dst[49];
  uint64_t v109 = *(void *)&__dst[50];
  v108[2] = __dst[44];
  v108[3] = __dst[45];
  v108[4] = __dst[46];
  v108[5] = __dst[47];
  v108[0] = __dst[42];
  v108[1] = __dst[43];
  [(CLFenceStateChangeMetrics *)v13 setMotionState:+[CLFenceAnalyticsCommon motionTypeFromCLMotionActivity:v108]];
  uint64_t v107 = *((void *)&__dst[58] + 1);
  v106[6] = *(_OWORD *)((char *)&__dst[56] + 8);
  v106[7] = *(_OWORD *)((char *)&__dst[57] + 8);
  v106[2] = *(_OWORD *)((char *)&__dst[52] + 8);
  v106[3] = *(_OWORD *)((char *)&__dst[53] + 8);
  v106[4] = *(_OWORD *)((char *)&__dst[54] + 8);
  v106[5] = *(_OWORD *)((char *)&__dst[55] + 8);
  v106[0] = *(_OWORD *)((char *)&__dst[50] + 8);
  v106[1] = *(_OWORD *)((char *)&__dst[51] + 8);
  [(CLFenceStateChangeMetrics *)v13 setDominantMotionState:+[CLFenceAnalyticsCommon motionTypeFromCLMotionActivity:v106]];
  id v21 = [objc_alloc((Class)NSDateInterval) initWithStartDate:-[NSDate dateByAddingTimeInterval:](v14, "dateByAddingTimeInterval:", -600.0) endDate:v14];
  dispatch_group_enter(v9);
  v22 = *(void **)(v7 + 56);
  v104[0] = _NSConcreteStackBlock;
  v104[1] = 3221225472;
  v104[2] = sub_101097E74;
  v104[3] = &unk_10230DF20;
  int v105 = v48;
  v104[6] = v49;
  v104[4] = v13;
  v104[5] = v9;
  [v22 fetchDominantMotionActivityInInterval:v21 handler:v104];
  if (!v18 || ![v18 timeOfNMinusOneStateChange]) {
    goto LABEL_59;
  }
  [v18 nMinusOneStateChangeLocation];
  sub_1000F1268(dbl_102485000, (uint64_t)&__dst[8] + 8, (uint64_t)buf);
  -[CLFenceStateChangeMetrics setDistanceFromNMinusOneStateChange:](v13, "setDistanceFromNMinusOneStateChange:", [v7 binForDistance:]);
  id v23 = [v18 timeOfNMinusOneStateChange];
  [(NSDate *)v14 timeIntervalSinceDate:v23];
  -[CLFenceStateChangeMetrics setTimeSinceNMinusOneStateChange:](v13, "setTimeSinceNMinusOneStateChange:", [v7 binForTimeInterval:]);
  if ([v23 compare:v14] == (id)1)
  {
    if (qword_1024193C0 != -1) {
      dispatch_once(&qword_1024193C0, &stru_10230E048);
    }
    v24 = qword_1024193C8;
    if (os_log_type_enabled((os_log_t)qword_1024193C8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v23;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v14;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "#FenceMetrics dateOfNMinusOneStateChange %@ comes after locationReceivedDate %@", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193C0 != -1) {
        dispatch_once(&qword_1024193C0, &stru_10230E048);
      }
      v157[0] = 138412546;
      *(void *)&v157[1] = v23;
      LOWORD(v157[3]) = 2112;
      *(void *)((char *)&v157[3] + 2) = v14;
      v25 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLFenceStateChangeAnalytics extractAnalyticsFromNotification:isInternal:handler:]", "%s\n", v25);
LABEL_53:
      if (v25 != (char *)buf) {
        free(v25);
      }
      goto LABEL_121;
    }
    goto LABEL_121;
  }
  id v26 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v23 endDate:v14];
  uint64_t v159 = 0;
  long long v158 = 0u;
  memset(v157, 0, sizeof(v157));
  v27 = *(void **)(v7 + 56);
  if (v27)
  {
    [v27 fetchStepCountInInterval:v26];
    uint64_t v28 = v157[0];
  }
  else
  {
    uint64_t v28 = 0;
  }
  -[CLFenceStateChangeMetrics setStepsSinceNMinusOneStateChange:](v13, "setStepsSinceNMinusOneStateChange:", [(id)v7 binForSteps:v28]);
  dispatch_group_enter(v9);
  id v29 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v23 endDate:-[NSDate earlierDate:](v14, "earlierDate:", objc_msgSend(v23, "dateByAddingTimeInterval:", 600.0))];
  v30 = *(void **)(v7 + 56);
  v102[0] = _NSConcreteStackBlock;
  v102[1] = 3221225472;
  v102[2] = sub_101098084;
  v102[3] = &unk_10230DF20;
  int v103 = v48;
  v102[6] = v49;
  v102[4] = v13;
  v102[5] = v9;
  [v30 fetchDominantMotionActivityInInterval:v29 handler:v102];
  dispatch_group_enter(v9);
  id v31 = [objc_alloc((Class)NSDateInterval) initWithStartDate:[v23 dateByAddingTimeInterval:-600.0] endDate:v23];
  v32 = *(void **)(v7 + 56);
  v100[0] = _NSConcreteStackBlock;
  v100[1] = 3221225472;
  v100[2] = sub_101098294;
  v100[3] = &unk_10230DF20;
  int v101 = v48;
  v100[6] = v49;
  v100[4] = v13;
  v100[5] = v9;
  [v32 fetchDominantMotionActivityInInterval:v31 handler:v100];
  if (![v18 timeOfNMinusTwoStateChange])
  {
LABEL_59:
    [(NSDate *)v14 timeIntervalSinceDate:+[NSDate dateWithTimeIntervalSinceReferenceDate:*((double *)&__dst[44] + 1)]];
    -[CLFenceStateChangeMetrics setTimeSinceDominantActivityChange:](v13, "setTimeSinceDominantActivityChange:", (int)[+[CLFenceBinner binForNumber:bins:](CLFenceBinner, "binForNumber:bins:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), *(void *)(v7 + 40)) intValue]);
    [(NSDate *)v14 timeIntervalSinceDate:+[NSDate dateWithTimeIntervalSinceReferenceDate:*(double *)&__dst[53]]];
    -[CLFenceStateChangeMetrics setTimeSinceMotionActivityChange:](v13, "setTimeSinceMotionActivityChange:", (int)[+[CLFenceBinner binForNumber:bins:](CLFenceBinner, "binForNumber:bins:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), *(void *)(v7 + 40)) intValue]);
    -[CLFenceStateChangeMetrics setNMinusOneState:](v13, "setNMinusOneState:", (int)[v18 nMinusOneState]);
    -[CLFenceStateChangeMetrics setNMinusTwoState:](v13, "setNMinusTwoState:", (int)[v18 nMinusTwoState]);
    -[CLFenceStateChangeMetrics setNMinusThreeState:](v13, "setNMinusThreeState:", (int)[v18 nMinusThreeState]);
    -[CLFenceStateChangeMetrics setEventTypeNMinusOneStateChange:](v13, "setEventTypeNMinusOneStateChange:", +[CLFenceAnalyticsCommon fenceEventType:](CLFenceAnalyticsCommon, "fenceEventType:", [v18 nMinusOneState]));
    if (v18)
    {
      [v18 nMinusOneStateChangeLocation];
      if (sub_100124E04((uint64_t)buf, (uint64_t)&xmmword_101D82EB8)) {
        goto LABEL_68;
      }
      [v18 nMinusOneStateChangeLocation];
      unsigned int v39 = v165;
    }
    else
    {
      long long v166 = 0u;
      memset(v167, 0, sizeof(v167));
      long long v164 = 0u;
      long long v165 = 0u;
      long long v162 = 0u;
      long long v163 = 0u;
      long long v161 = 0u;
      memset(buf, 0, sizeof(buf));
      if (sub_100124E04((uint64_t)buf, (uint64_t)&xmmword_101D82EB8)) {
        goto LABEL_70;
      }
      unsigned int v39 = 0;
      long long v166 = 0u;
      memset(v167, 0, sizeof(v167));
      long long v164 = 0u;
      long long v165 = 0u;
      long long v162 = 0u;
      long long v163 = 0u;
      long long v161 = 0u;
      memset(buf, 0, sizeof(buf));
    }
    [(CLFenceStateChangeMetrics *)v13 setNMinusOneStateChangeLocationProvider:v39];
    if (v18)
    {
      [v18 nMinusOneStateChangeLocation];
      double v40 = *(double *)&buf[20];
    }
    else
    {
      long long v166 = 0u;
      memset(v167, 0, sizeof(v167));
      long long v164 = 0u;
      long long v165 = 0u;
      long long v162 = 0u;
      long long v163 = 0u;
      long long v161 = 0u;
      double v40 = 0.0;
      memset(buf, 0, sizeof(buf));
    }
    -[CLFenceStateChangeMetrics setNMinusOneStateChangeLocationAccuracy:](v13, "setNMinusOneStateChangeLocationAccuracy:", [(id)v7 binForDistance:v40]);
    if (v18)
    {
LABEL_68:
      [v18 nMinusTwoStateChangeLocation];
      if (!sub_100124E04((uint64_t)buf, (uint64_t)&xmmword_101D82EB8))
      {
        [v18 nMinusTwoStateChangeLocation];
        unsigned int v41 = v165;
LABEL_72:
        [(CLFenceStateChangeMetrics *)v13 setNMinusTwoStateChangeLocationProvider:v41];
        if (v18)
        {
          [v18 nMinusTwoStateChangeLocation];
          double v42 = *(double *)&buf[20];
        }
        else
        {
          long long v166 = 0u;
          memset(v167, 0, sizeof(v167));
          long long v164 = 0u;
          long long v165 = 0u;
          long long v162 = 0u;
          long long v163 = 0u;
          long long v161 = 0u;
          double v42 = 0.0;
          memset(buf, 0, sizeof(buf));
        }
        -[CLFenceStateChangeMetrics setNMinusTwoStateChangeLocationAccuracy:](v13, "setNMinusTwoStateChangeLocationAccuracy:", [(id)v7 binForDistance:v42]);
        goto LABEL_76;
      }
      goto LABEL_76;
    }
LABEL_70:
    long long v166 = 0u;
    memset(v167, 0, sizeof(v167));
    long long v164 = 0u;
    long long v165 = 0u;
    long long v162 = 0u;
    long long v163 = 0u;
    long long v161 = 0u;
    memset(buf, 0, sizeof(buf));
    if (!sub_100124E04((uint64_t)buf, (uint64_t)&xmmword_101D82EB8))
    {
      unsigned int v41 = 0;
      long long v166 = 0u;
      memset(v167, 0, sizeof(v167));
      long long v164 = 0u;
      long long v165 = 0u;
      long long v162 = 0u;
      long long v163 = 0u;
      long long v161 = 0u;
      memset(buf, 0, sizeof(buf));
      goto LABEL_72;
    }
LABEL_76:
    -[CLFenceStateChangeMetrics setEffectiveRadius:](v13, "setEffectiveRadius:", [(id)v7 binForFenceRadius:sub_100044A78((uint64_t)v134)]);
    sub_10048AEC0((char *)v87, (long long *)v134);
    [(CLFenceStateChangeMetrics *)v13 setFenceCategoryType:+[CLFenceAnalyticsCommon fenceCategoryForFence:v87]];
    if (v96)
    {
      v97 = v96;
      operator delete(v96);
    }

    if (v94 < 0) {
      operator delete(v93);
    }
    if (v92 < 0) {
      operator delete(v91);
    }
    if (v90 < 0) {
      operator delete(v89);
    }
    if (v88 < 0) {
      operator delete(v87[0]);
    }
    -[CLFenceStateChangeMetrics setFenceRadius:](v13, "setFenceRadius:", [(id)v7 binForFenceRadius:v140]);
    sub_10048AEC0((char *)v76, (long long *)v134);
    [(CLFenceStateChangeMetrics *)v13 setFenceType:+[CLFenceAnalyticsCommon fenceSizeForFence:v76]];
    if (v85)
    {
      v86 = v85;
      operator delete(v85);
    }

    if (v83 < 0) {
      operator delete(v82);
    }
    if (v81 < 0) {
      operator delete(v80);
    }
    if (v79 < 0) {
      operator delete(v78);
    }
    if (v77 < 0) {
      operator delete(v76[0]);
    }
    [(CLFenceStateChangeMetrics *)v13 setIsConservativeEntry:(~v142 & 5) == 0];
    [(CLFenceStateChangeMetrics *)v13 setIsEmergencyFence:(v142 >> 4) & 1];
    [(CLFenceStateChangeMetrics *)v13 setIsHelperFence:v143];
    [(CLFenceStateChangeMetrics *)v13 setIsLowPower:(v142 >> 5) & 1];
    [(CLFenceStateChangeMetrics *)v13 setIsThrottledFence:v144];
    if (v47)
    {
      if (v135 >= 0) {
        v43 = v134;
      }
      else {
        v43 = (void **)v134[0];
      }
      [(CLFenceStateChangeMetrics *)v13 setBundleId:+[CLFenceAnalyticsCommon masqueradeBundleId:](CLFenceAnalyticsCommon, "masqueradeBundleId:", +[NSString stringWithCString:v43 encoding:4])];
      dispatch_group_enter(v9);
      v44 = *(void **)(v7 + 56);
      sub_10048AEC0((char *)v65, (long long *)v134);
      v52[0] = _NSConcreteStackBlock;
      v52[1] = 3321888768;
      v52[2] = sub_1010986B4;
      v52[3] = &unk_10230DF48;
      int v64 = v48;
      v52[6] = v49;
      v52[4] = v13;
      sub_10048AEC0((char *)&v53, (long long *)v134);
      v52[5] = v9;
      [v44 fetchLocationOfInterestForFence:v65 handler:v52];
      if (v74)
      {
        v75 = v74;
        operator delete(v74);
      }

      if (v72 < 0) {
        operator delete(v71);
      }
      if (v70 < 0) {
        operator delete(v69);
      }
      if (v68 < 0) {
        operator delete(v67);
      }
      if (v66 < 0) {
        operator delete(v65[0]);
      }
      if (v62)
      {
        v63 = v62;
        operator delete(v62);
      }

      if (v60 < 0) {
        operator delete(v59);
      }
      if (v58 < 0) {
        operator delete(v57);
      }
      if (v56 < 0) {
        operator delete(v55);
      }
      if (v54 < 0) {
        operator delete(v53);
      }
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_101098ACC;
    block[3] = &unk_10230DF80;
    int v51 = v48;
    block[6] = v2;
    block[7] = v49;
    block[4] = v13;
    block[5] = v9;
    dispatch_group_notify(v9, (dispatch_queue_t)[objc_msgSend(objc_msgSend(objc_msgSend((id)v7, "universe"), "silo"), "queue") block]);
    goto LABEL_121;
  }
  id v46 = [v18 timeOfNMinusTwoStateChange];
  [v18 nMinusTwoStateChangeLocation];
  sub_1000F1268(dbl_102485000, (uint64_t)&__dst[8] + 8, (uint64_t)buf);
  -[CLFenceStateChangeMetrics setDistanceFromNMinusTwoStateChange:](v13, "setDistanceFromNMinusTwoStateChange:", (int)[+[CLFenceBinner binForNumber:bins:](CLFenceBinner, "binForNumber:bins:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), *(void *)(v7 + 16)) intValue]);
  if ([v46 compare:v14] != (id)1)
  {
    id v34 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v46 endDate:v14];
    v35 = *(void **)(v7 + 56);
    if (v35)
    {
      [v35 fetchStepCountInInterval:v34];
      uint64_t v36 = *(unsigned int *)buf;
    }
    else
    {
      uint64_t v36 = 0;
      *(void *)&long long v162 = 0;
      long long v161 = 0u;
      memset(buf, 0, sizeof(buf));
    }
    -[CLFenceStateChangeMetrics setStepsSinceNMinusTwoStateChange:](v13, "setStepsSinceNMinusTwoStateChange:", (int)[+[CLFenceBinner binForNumber:bins:](CLFenceBinner, "binForNumber:bins:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v36), *(void *)(v7 + 32)) intValue]);
    [(NSDate *)v14 timeIntervalSinceDate:v46];
    -[CLFenceStateChangeMetrics setTimeSinceNMinusTwoStateChange:](v13, "setTimeSinceNMinusTwoStateChange:", (int)[+[CLFenceBinner binForNumber:bins:](CLFenceBinner, "binForNumber:bins:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), *(void *)(v7 + 40)) intValue]);
    dispatch_group_enter(v9);
    id v37 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v46 endDate:[v23 earlierDate:[v46 dateByAddingTimeInterval:600.0]]];
    v38 = *(void **)(v7 + 56);
    v98[0] = _NSConcreteStackBlock;
    v98[1] = 3221225472;
    v98[2] = sub_1010984A4;
    v98[3] = &unk_10230DF20;
    int v99 = v48;
    v98[6] = v49;
    v98[4] = v13;
    v98[5] = v9;
    [v38 fetchDominantMotionActivityInInterval:v37 handler:v98];
    -[CLFenceStateChangeMetrics setEventTypeNMinusTwoStateChange:](v13, "setEventTypeNMinusTwoStateChange:", +[CLFenceAnalyticsCommon fenceEventType:](CLFenceAnalyticsCommon, "fenceEventType:", [v18 nMinusTwoState]));
    goto LABEL_59;
  }
  if (qword_1024193C0 != -1) {
    dispatch_once(&qword_1024193C0, &stru_10230E048);
  }
  v33 = qword_1024193C8;
  if (os_log_type_enabled((os_log_t)qword_1024193C8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v46;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v14;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "#FenceMetrics dateOfNMinusTwoStateChange %@ comes after locationReceivedDate %@", buf, 0x16u);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193C0 != -1) {
      dispatch_once(&qword_1024193C0, &stru_10230E048);
    }
    int v153 = 138412546;
    id v154 = v46;
    __int16 v155 = 2112;
    v156 = v14;
    v25 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLFenceStateChangeAnalytics extractAnalyticsFromNotification:isInternal:handler:]", "%s\n", v25);
    goto LABEL_53;
  }
LABEL_121:
  if (v148)
  {
    v149 = v148;
    operator delete(v148);
  }

  if (v146 < 0) {
    operator delete(v145);
  }
  if (v139 < 0) {
    operator delete(v138);
  }
  if (v137 < 0) {
    operator delete(v136);
  }
  if (v135 < 0) {
    operator delete(v134[0]);
  }
}

- (id)createMetricsDict:(id)a3 isInternal:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  v10[0] = @"adjustedDistance";
  v11[0] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 adjustedDistance]);
  v10[1] = @"airplaneMode";
  v11[1] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [a3 airplaneMode]);
  v10[2] = @"cellAvailable";
  v11[2] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [a3 cellAvailable]);
  v10[3] = @"distanceFromNMinusOneStateChange";
  v11[3] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 distanceFromNMinusOneStateChange]);
  v10[4] = @"distanceFromNMinusTwoStateChange";
  v11[4] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 distanceFromNMinusTwoStateChange]);
  v10[5] = @"distanceToFenceBoundary";
  v11[5] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 distanceToFenceBoundary]);
  v10[6] = @"adjustedDistanceToFenceBoundary";
  v11[6] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 adjustedDistanceToFenceBoundary]);
  v10[7] = @"dominantMotionState";
  v11[7] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 dominantMotionState]);
  v10[8] = @"effectiveRadius";
  v11[8] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 effectiveRadius]);
  v10[9] = @"entryRadius";
  v11[9] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 entryRadius]);
  v10[10] = @"eventLatency";
  v11[10] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 eventLatency]);
  v10[11] = @"timeToInitialStateChange";
  v11[11] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 timeToInitialStateChange]);
  v10[12] = @"currentState";
  v11[12] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 currentState]);
  v10[13] = @"nMinusOneState";
  v11[13] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 nMinusOneState]);
  v10[14] = @"nMinusTwoState";
  v11[14] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 nMinusTwoState]);
  v10[15] = @"nMinusThreeState";
  v11[15] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 nMinusThreeState]);
  v10[16] = @"nMinusOneStateChangeLocationAccuracy";
  v11[16] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 nMinusOneStateChangeLocationAccuracy]);
  v10[17] = @"nMinusTwoStateChangeLocationAccuracy";
  v11[17] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 nMinusTwoStateChangeLocationAccuracy]);
  v10[18] = @"nMinusOneStateChangeLocationProvider";
  v11[18] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 nMinusOneStateChangeLocationProvider]);
  v10[19] = @"nMinusTwoStateChangeLocationProvider";
  v11[19] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 nMinusTwoStateChangeLocationProvider]);
  v10[20] = @"eventType";
  v11[20] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 eventType]);
  v10[21] = @"eventTypeNMinusOneStateChange";
  v11[21] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 eventTypeNMinusOneStateChange]);
  v10[22] = @"eventTypeNMinusTwoStateChange";
  v11[22] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 eventTypeNMinusTwoStateChange]);
  v10[23] = @"exitRadius";
  v11[23] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 exitRadius]);
  v10[24] = @"fenceCategoryType";
  v11[24] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 fenceCategoryType]);
  v10[25] = @"fenceRadius";
  v11[25] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 fenceRadius]);
  v10[26] = @"fenceType";
  v11[26] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 fenceType]);
  v10[27] = @"hasSignificantPrior";
  v11[27] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [a3 hasSignificantPrior]);
  v10[28] = @"isConservativeEntry";
  v11[28] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [a3 isConservativeEntry]);
  v10[29] = @"isEmergencyFence";
  v11[29] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [a3 isEmergencyFence]);
  v10[30] = @"isFreeWake";
  v11[30] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [a3 isFreeWake]);
  v10[31] = @"isHelperFence";
  v11[31] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [a3 isHelperFence]);
  v10[32] = @"isLowPower";
  v11[32] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [a3 isLowPower]);
  v10[33] = @"isThrottledFence";
  v11[33] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [a3 isThrottledFence]);
  v10[34] = @"locationAccuracy";
  v11[34] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 locationAccuracy]);
  v10[35] = @"locationProvider";
  v11[35] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 locationProvider]);
  v10[36] = @"loiDistance";
  [a3 loiDistance];
  v11[36] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v10[37] = @"loiRadius";
  [a3 loiRadius];
  v11[37] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v10[38] = @"motionStateBeforeNMinusOneStateChange";
  v11[38] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 motionStateBeforeNMinusOneStateChange]);
  v10[39] = @"motionState";
  v11[39] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 motionState]);
  v10[40] = @"motionStateAfterNMinusOneStateChange";
  v11[40] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 motionStateAfterNMinusOneStateChange]);
  v10[41] = @"motionStateAfterNMinusTwoStateChange";
  v11[41] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 motionStateAfterNMinusTwoStateChange]);
  v10[42] = @"motionStateBeforeStateChange";
  v11[42] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 motionStateBeforeStateChange]);
  v10[43] = @"previousLocationAccuracy";
  v11[43] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 previousLocationAccuracy]);
  v10[44] = @"passcodeLocked";
  v11[44] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [a3 passcodeLocked]);
  v10[45] = @"previousLocationAge";
  v11[45] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 previousLocationAge]);
  v10[46] = @"previousLocationProvider";
  v11[46] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 previousLocationProvider]);
  v10[47] = @"lastHandledLocationAccuracy";
  v11[47] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 lastHandledLocationAccuracy]);
  v10[48] = @"lastHandledLocationAge";
  v11[48] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 lastHandledLocationAge]);
  v10[49] = @"lastHandledLocationProvider";
  v11[49] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 lastHandledLocationProvider]);
  v10[50] = @"reachabilityStatus";
  v11[50] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 reachabilityStatus]);
  v10[51] = @"settledState";
  v11[51] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 settledState]);
  v10[52] = @"signalEnvironmentType";
  v11[52] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 signalEnvironmentType]);
  v10[53] = @"significantFence";
  v11[53] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [a3 significantFence]);
  v10[54] = @"stepsSinceNMinusOneStateChange";
  v11[54] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 stepsSinceNMinusOneStateChange]);
  v10[55] = @"stepsSinceNMinusTwoStateChange";
  v11[55] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 stepsSinceNMinusTwoStateChange]);
  v10[56] = @"timeSinceDominantActivityChange";
  v11[56] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 timeSinceDominantActivityChange]);
  v10[57] = @"timeSinceMotionActivityChange";
  v11[57] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 timeSinceMotionActivityChange]);
  v10[58] = @"timeSinceNMinusOneStateChange";
  v11[58] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 timeSinceNMinusOneStateChange]);
  v10[59] = @"timeSinceNMinusTwoStateChange";
  v11[59] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 timeSinceNMinusTwoStateChange]);
  v10[60] = @"timeSinceWifiRoam";
  v11[60] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 timeSinceWifiRoam]);
  v10[61] = @"wifiAvailable";
  v11[61] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [a3 wifiAvailable]);
  [v6 addEntriesFromDictionary:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 62)];
  if (v4)
  {
    v8[0] = @"bundleId";
    v9[0] = [a3 bundleId];
    v8[1] = @"loiType";
    v9[1] = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [a3 loiType]);
    v8[2] = @"hasLoiAtFence";
    v9[2] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [a3 hasLoiAtFence]);
    [v6 addEntriesFromDictionary:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 3)];
  }
  return v6;
}

- (void)promptPossibleFalseExitDetectionUI
{
  sub_100103240();
  if (sub_10073E30C())
  {
    BOOL v12 = 0;
    sub_1000C7F88(buf);
    int v2 = sub_1000D2988(*(uint64_t *)buf, "promptPossibleFalseExitDetectionUI", &v12);
    if (v16) {
      sub_1000DB0A0(v16);
    }
    if (!v2) {
      goto LABEL_11;
    }
    if (qword_1024193C0 != -1) {
      dispatch_once(&qword_1024193C0, &stru_10230E048);
    }
    int v3 = qword_1024193C8;
    if (os_log_type_enabled((os_log_t)qword_1024193C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v12;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#FenceMetrics, promptPossibleFalseExitDetectionUI, override, %d", buf, 8u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193C0 != -1) {
        dispatch_once(&qword_1024193C0, &stru_10230E048);
      }
      int v13 = 67109120;
      BOOL v14 = v12;
      long long v10 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLFenceStateChangeAnalytics promptPossibleFalseExitDetectionUI]", "%s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
    }
    if (v12)
    {
LABEL_11:
      id v4 = (id)objc_opt_new();
      [v4 setLocale:[+[NSLocale autoupdatingCurrentLocale](NSLocale, "autoupdatingCurrentLocale")]];
      [v4 setDateStyle:1];
      [v4 setTimeStyle:1];
      id v5 = (id)objc_opt_new();
      [v5 setObject:@"Detected Possible False Exit" forKeyedSubscript:kCFUserNotificationAlertHeaderKey];
      [v5 setObject:+[NSString stringWithFormat:](NSString, @"Please file a radar if you did not intentionally exit and reenter home @ %@", [v4 stringFromDate:+[NSDate date](NSDate, "date")]), kCFUserNotificationAlertMessageKey forKeyedSubscript];
      [v5 setObject:@"Tap-to-Radar" forKeyedSubscript:kCFUserNotificationAlternateButtonTitleKey];
      [v5 setObject:@"Dismiss" forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];
      id v6 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0, 0, (CFDictionaryRef)v5);
      if (v6)
      {
        RunLoopSource = CFUserNotificationCreateRunLoopSource(kCFAllocatorDefault, v6, (CFUserNotificationCallBack)sub_101099C74, 0);
        if (RunLoopSource)
        {
          v8 = (__CFRunLoop *)sub_1001C2710();
          CFRunLoopAddSource(v8, RunLoopSource, kCFRunLoopCommonModes);
          if (qword_1024193C0 != -1) {
            dispatch_once(&qword_1024193C0, &stru_10230E048);
          }
          objc_super v9 = qword_1024193C8;
          if (os_log_type_enabled((os_log_t)qword_1024193C8, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#FenceMetrics, promptPossibleFalseExitDetectionUI", buf, 2u);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1024193C0 != -1) {
              dispatch_once(&qword_1024193C0, &stru_10230E048);
            }
            LOWORD(v13) = 0;
            long long v11 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLFenceStateChangeAnalytics promptPossibleFalseExitDetectionUI]", "%s\n", v11);
            if (v11 != (char *)buf) {
              free(v11);
            }
          }
          id v6 = RunLoopSource;
        }
        CFRelease(v6);
      }
    }
  }
}

- (void)conditionsSatisfiedForFalseExitFromNotification:(long long *)a3 handler:(uint64_t)a4
{
  sub_100103240();
  if (sub_10073E30C() & 1) != 0 && (sub_100103240(), (sub_10016CCBC()))
  {
    sub_10048AEC0((char *)__dst, a3);
    id v7 = objc_alloc((Class)NSString);
    if (v22 >= 0) {
      v8 = &v21;
    }
    else {
      v8 = v21;
    }
    id v9 = [*(id *)(a1 + 56) historicalFenceStateForFenceName:[v7 initWithCString:v8 encoding:4]];
    if ([v9 currentState]
      || [v9 nMinusOneState] != 1
      || [v9 nMinusTwoState]
      || (objc_msgSend(objc_msgSend(v9, "timeOfNMinusOneStateChange"), "timeIntervalSinceDate:", objc_msgSend(v9, "timeOfNMinusTwoStateChange")), double v12 = v11, objc_msgSend(objc_msgSend(v9, "timeOfCurrentStateChange"), "timeIntervalSinceDate:", objc_msgSend(v9, "timeOfNMinusOneStateChange")), v12 <= 7200.0)|| v13 > 240.0|| (v14 = -[NSCalendar components:fromDate:](+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"), "components:fromDate:", 32, objc_msgSend(v9, "timeOfCurrentStateChange")), -[NSDateComponents hour](v14, "hour") >= 5)&& -[NSDateComponents hour](v14, "hour") <= 22)
    {
      (*(void (**)(uint64_t, void, void))(a4 + 16))(a4, 0, 0);
    }
    else
    {
      sub_10048AEC0(v18, (long long *)__dst);
      id v15 = +[CLFenceAnalyticsManager regionForFence:v18];
      sub_100488394((uint64_t)v18);
      v16 = *(void **)(a1 + 56);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10109A1FC;
      v17[3] = &unk_10230DFA8;
      v17[4] = a4;
      [v16 fetchLocationOfInterestForRegion:v15 handler:v17];
    }
    if (__p)
    {
      id v29 = __p;
      operator delete(__p);
    }

    if (v26 < 0) {
      operator delete(v25);
    }
    if (v24 < 0) {
      operator delete(v23);
    }
    if (v22 < 0) {
      operator delete(v21);
    }
    if (v20 < 0) {
      operator delete(__dst[0]);
    }
  }
  else
  {
    long long v10 = *(void (**)(uint64_t, void, void))(a4 + 16);
    v10(a4, 0, 0);
  }
}

- (uint64_t)evaluatePossibleFalseExitFromNotification:(long long *)a3
{
  sub_10089FBB8(v8, a3);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3321888768;
  v6[2] = sub_10109A328;
  v6[3] = &unk_10230DFD0;
  sub_10089FBB8(v7, a3);
  v6[4] = a1;
  [a1 conditionsSatisfiedForFalseExitFromNotification:v8 handler:v6];
  sub_1001111C8((uint64_t)v8);
  return sub_1001111C8((uint64_t)v7);
}

- (uint64_t)submitAllMetricsFromNotification:(long long *)a3
{
  sub_100103240();
  uint64_t v5 = sub_10073E30C();
  sub_10089FBB8(v9, a3);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10109A824;
  v7[3] = &unk_10230E028;
  v7[4] = a1;
  char v8 = v5;
  [a1 extractAnalyticsFromNotification:v9 isInternal:v5 handler:v7];
  return sub_1001111C8((uint64_t)v9);
}

- (CLIntersiloUniverse)universe
{
  return self->_universe;
}

- (void)setUniverse:(id)a3
{
}

- (CLFenceAnalyticsManager)fenceAnalyticsManager
{
  return self->_fenceAnalyticsManager;
}

- (void)setFenceAnalyticsManager:(id)a3
{
}

@end