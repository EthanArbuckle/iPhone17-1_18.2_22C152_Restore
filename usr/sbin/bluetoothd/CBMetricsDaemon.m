@interface CBMetricsDaemon
+ (id)sharedCBMetricsDaemon;
- (CBMetricsDaemon)init;
- (id)description;
- (void)_reportAggressiveScanMetricEvents;
- (void)_reportAuthTagType:(unsigned __int8)a3 authTagStatus:(unsigned __int8)a4 integrityTagStatus:(unsigned __int8)a5 resolutionWindow:(char)a6;
- (void)_reportEvents;
- (void)_scheduleReport;
- (void)_setupAggressiveScanMetricExportTimer;
- (void)_setupMetricExportTimer;
- (void)_startIfNeeded;
- (void)_whbMetricExportTimerFired;
- (void)reportAggressiveScan:(id)a3 action:(id)a4;
- (void)reportAuthTagType:(unsigned __int8)a3 authTagStatus:(unsigned __int8)a4 integrityTagStatus:(unsigned __int8)a5 resolutionWindow:(char)a6;
- (void)reportCBDiscovery:(id)a3 daemonCnx:(id)a4 action:(id)a5;
- (void)reportRSSIMetric:(id)a3;
- (void)reportWhbMetric:(id)a3;
- (void)reportxpcCBAdvertiserUpdate:(id)a3;
@end

@implementation CBMetricsDaemon

+ (id)sharedCBMetricsDaemon
{
  if (qword_1009FC150 != -1) {
    dispatch_once(&qword_1009FC150, &stru_100998498);
  }
  v2 = (void *)qword_1009FC148;

  return v2;
}

- (CBMetricsDaemon)init
{
  v10.receiver = self;
  v10.super_class = (Class)CBMetricsDaemon;
  v2 = [(CBMetricsDaemon *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v6 = dispatch_queue_create("CBMetrics", v5);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v6;

    v8 = v3;
  }

  return v3;
}

- (id)description
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  os_unfair_lock_unlock(p_lock);
  v5 = [(id)objc_opt_class() description];
  v3 = NSPrintF_safe();

  return v3;
}

- (void)_reportEvents
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  self->_scheduledReport = 0;
  v4 = self->_discoveryEventsArray;
  discoveryEventsArray = self->_discoveryEventsArray;
  self->_discoveryEventsArray = 0;

  unint64_t discoveryEventsDroppedReported = self->_discoveryEventsDroppedReported;
  unint64_t discoveryEventsDroppedTotal = self->_discoveryEventsDroppedTotal;
  self->_unint64_t discoveryEventsDroppedReported = discoveryEventsDroppedTotal;
  os_unfair_lock_unlock(p_lock);
  v26 = v4;
  id v6 = [(NSMutableArray *)v4 count];
  if (&_PLLogRegisteredEvent && v6)
  {
    id v29 = objc_alloc_init((Class)NSMutableArray);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    obj = v4;
    id v7 = [(NSMutableArray *)obj countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v7)
    {
      uint64_t v28 = *(void *)v32;
      do
      {
        id v30 = v7;
        for (i = 0; i != v30; i = (char *)i + 1)
        {
          if (*(void *)v32 != v28) {
            objc_enumerationMutation(obj);
          }
          v9 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          v37[0] = @"actn";
          uint64_t v10 = [v9 action];
          v11 = (void *)v10;
          if (v10) {
            CFStringRef v12 = (const __CFString *)v10;
          }
          else {
            CFStringRef v12 = &stru_1009C1AC8;
          }
          v38[0] = v12;
          v37[1] = @"apID";
          uint64_t v13 = [v9 appID];
          v14 = (void *)v13;
          if (v13) {
            CFStringRef v15 = (const __CFString *)v13;
          }
          else {
            CFStringRef v15 = &stru_1009C1AC8;
          }
          v38[1] = v15;
          v37[2] = @"cid";
          v16 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v9 clientID]);
          v38[2] = v16;
          v37[3] = @"dsFl";
          v17 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v9 discoveryFlags]);
          v38[3] = v17;
          v37[4] = @"pid";
          v18 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v9 pid]);
          v38[4] = v18;
          v37[5] = @"scnR";
          v19 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v9 scanRate]);
          v38[5] = v19;
          v37[6] = @"timS";
          [v9 timestamp];
          v20 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          v38[6] = v20;
          v21 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:7];

          [v29 addObject:v21];
        }
        id v7 = [(NSMutableArray *)obj countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v7);
    }

    v35[0] = @"dscE";
    v35[1] = @"drpE";
    v36[0] = v29;
    v22 = +[NSNumber numberWithUnsignedLongLong:discoveryEventsDroppedTotal - discoveryEventsDroppedReported];
    v36[1] = v22;
    v23 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];

    if (dword_1009F8250 <= 20 && (dword_1009F8250 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    PLLogRegisteredEvent();
  }
}

- (void)_scheduleReport
{
  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_scheduledReport)
  {
    self->_scheduledReport = 1;
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000867E0;
    block[3] = &unk_100997450;
    block[4] = self;
    dispatch_async(dispatchQueue, block);
  }
}

- (void)_startIfNeeded
{
  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_startCalled)
  {
    self->_startCalled = 1;
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10008687C;
    block[3] = &unk_100997450;
    block[4] = self;
    dispatch_async(dispatchQueue, block);
  }
}

- (void)reportAuthTagType:(unsigned __int8)a3 authTagStatus:(unsigned __int8)a4 integrityTagStatus:(unsigned __int8)a5 resolutionWindow:(char)a6
{
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100086B6C;
  v7[3] = &unk_100997550;
  v7[4] = self;
  unsigned __int8 v8 = a3;
  unsigned __int8 v9 = a4;
  unsigned __int8 v10 = a5;
  char v11 = a6;
  dispatch_async(dispatchQueue, v7);
}

- (void)_reportAuthTagType:(unsigned __int8)a3 authTagStatus:(unsigned __int8)a4 integrityTagStatus:(unsigned __int8)a5 resolutionWindow:(char)a6
{
  int v6 = a6;
  int v7 = a5;
  int v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  double Current = CFAbsoluteTimeGetCurrent();
  double v20 = -1.0;
  double v19 = -1.0;
  int v18 = -1;
  if (([gCBDaemonServer prefSystemReferenceTimeDisabled] & 1) != 0
    || !TMGetReferenceTime())
  {
    double v11 = -1.0;
    if (dword_1009F8250 <= 20 && (dword_1009F8250 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
  }
  else
  {
    double v10 = v20;
    double v11 = v20 - Current;
    if (dword_1009F8250 > 20) {
      goto LABEL_12;
    }
    if (dword_1009F8250 != -1) {
      goto LABEL_5;
    }
    if (_LogCategory_Initialize())
    {
      double v10 = v20;
LABEL_5:
      CFStringRef v12 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v10];
      id v13 = [v12 description];
      [v13 UTF8String];
      LogPrintF_safe();
    }
  }
LABEL_12:
  uint64_t v17 = 0;
  uint64_t v16 = 0;
  v15[0] = (int)v11;
  v15[1] = (int)v19;
  v15[2] = v18;
  if (v7 == 1)
  {
    WORD1(v16) = 1;
    switch(v6)
    {
      case -1:
        WORD1(v17) = 1;
        break;
      case 1:
        WORD2(v17) = 1;
        break;
      case 0:
        LOWORD(v17) = 1;
        break;
    }
  }
  else if (v8 == 5)
  {
    HIWORD(v16) = 1;
  }
  else if (v8 == 1)
  {
    WORD2(v16) = 1;
  }
  LOWORD(v16) = 1;
  uint64_t v14 = sub_100050530();
  (*(void (**)(uint64_t, _DWORD *))(*(void *)v14 + 32))(v14, v15);
}

- (void)reportCBDiscovery:(id)a3 daemonCnx:(id)a4 action:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = objc_alloc_init(CBMetricsDiscoveryEvent);
  [(CBMetricsDiscoveryEvent *)v11 setAction:v10];
  CFStringRef v12 = [v9 appID];
  [(CBMetricsDiscoveryEvent *)v11 setAppID:v12];

  -[CBMetricsDiscoveryEvent setClientID:](v11, "setClientID:", [v8 clientID]);
  -[CBMetricsDiscoveryEvent setDiscoveryFlags:](v11, "setDiscoveryFlags:", [v8 discoveryFlags]);
  -[CBMetricsDiscoveryEvent setPid:](v11, "setPid:", [v9 pid]);
  -[CBMetricsDiscoveryEvent setScanRate:](v11, "setScanRate:", [v8 bleScanRate]);
  [(CBMetricsDiscoveryEvent *)v11 setTimestamp:CFAbsoluteTimeGetCurrent()];
  os_unfair_lock_lock(&self->_lock);
  ++self->_discoveryEventsTotal;
  id v13 = [(NSMutableArray *)self->_discoveryEventsArray count];
  unint64_t discoveryEventsDroppedTotal = self->_discoveryEventsDroppedTotal;
  if ((unint64_t)v13 < 0x96)
  {
    discoveryEventsArray = self->_discoveryEventsArray;
    if (!discoveryEventsArray)
    {
      uint64_t v17 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      int v18 = self->_discoveryEventsArray;
      self->_discoveryEventsArray = v17;

      discoveryEventsArray = self->_discoveryEventsArray;
    }
    [(NSMutableArray *)discoveryEventsArray addObject:v11];
    if ((unint64_t)v13 < 0x64) {
      [(CBMetricsDaemon *)self _startIfNeeded];
    }
    else {
      [(CBMetricsDaemon *)self _scheduleReport];
    }
    os_unfair_lock_unlock(&self->_lock);
    if (dword_1009F8250 <= 20 && (dword_1009F8250 != -1 || _LogCategory_Initialize()))
    {
      double v19 = [v9 appID];
      id v25 = v13;
      unint64_t v26 = discoveryEventsDroppedTotal;
      id v23 = [v9 pid];
      id v24 = [v8 clientID];
      v21 = v19;
      id v22 = v10;
      LogPrintF_safe();
    }
    if (objc_msgSend(v10, "isEqual:", @"strt", v21, v22, v23, v24, v25, v26))
    {
      dispatchQueue = self->_dispatchQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100087180;
      block[3] = &unk_100997450;
      block[4] = v11;
      dispatch_async(dispatchQueue, block);
    }
  }
  else
  {
    self->_unint64_t discoveryEventsDroppedTotal = discoveryEventsDroppedTotal + 1;
    os_unfair_lock_unlock(&self->_lock);
    if (__ROR8__(0x8F5C28F5C28F5C29 * discoveryEventsDroppedTotal, 1) <= 0x51EB851EB851EB8uLL
      && dword_1009F8250 <= 30
      && (dword_1009F8250 != -1 || _LogCategory_Initialize()))
    {
      CFStringRef v15 = [(CBMetricsDiscoveryEvent *)v11 appID];
      [(CBMetricsDiscoveryEvent *)v11 pid];
      [(CBMetricsDiscoveryEvent *)v11 clientID];
      LogPrintF_safe();
    }
  }
}

- (void)reportAggressiveScan:(id)a3 action:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 appID];
  if (v8)
  {
    id v9 = [v6 appID];
  }
  else
  {
    id v9 = @"unknown";
  }

  id v10 = [v6 description];
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  unint64_t v26 = sub_10004CEFC;
  v27 = sub_10004CD50;
  uint64_t v28 = 0;
  uint64_t v28 = objc_alloc_init(CBMetricsAggressiveScanEvent);
  unsigned int v11 = [v7 isEqual:@"agsN"];
  [(id)v24[5] setScanScreenOnCount:v11];
  unsigned int v12 = [v7 isEqual:@"agsF"];
  [(id)v24[5] setScanScreenOffCount:v12];
  id v13 = [v6 bleScanRate];
  [(id)v24[5] setScanRateScreenOn:v13];
  id v14 = [v6 bleScanRateScreenOff];
  [(id)v24[5] setScanRateScreenOff:v14];
  id v15 = [v6 discoveryFlags];
  [(id)v24[5] setDiscoveryFlags:v15];
  [(id)v24[5] setDiscoveryTypes:0];
  [(id)v24[5] discoveryTypesPtr];
  id v16 = v6;
  [v16 discoveryTypesInternalPtr];
  CBDiscoveryTypesAddTypes();
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008762C;
  block[3] = &unk_1009984E8;
  block[4] = self;
  void block[5] = v9;
  v21 = v10;
  id v22 = &v23;
  id v20 = v7;
  id v18 = v7;
  dispatch_async(dispatchQueue, block);

  _Block_object_dispose(&v23, 8);
}

- (void)_setupAggressiveScanMetricExportTimer
{
  p_aggrScanMetricExportTimer = &self->_aggrScanMetricExportTimer;
  v4 = self->_aggrScanMetricExportTimer;
  if (!v4)
  {
    dispatch_source_t v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    objc_storeStrong((id *)p_aggrScanMetricExportTimer, v5);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100087B40;
    v6[3] = &unk_100998510;
    v4 = v5;
    id v7 = v4;
    id v8 = self;
    dispatch_source_set_event_handler((dispatch_source_t)v4, v6);
    CUDispatchTimerSet();
    dispatch_activate((dispatch_object_t)v4);
    if (dword_1009F8250 <= 20 && (dword_1009F8250 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
  }
}

- (void)_reportAggressiveScanMetricEvents
{
  if (&_PLLogRegisteredEvent && self->_aggrScanMetricDict)
  {
    id v3 = objc_alloc_init((Class)NSMutableArray);
    aggrScanMetricDict = self->_aggrScanMetricDict;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100087D70;
    v7[3] = &unk_100998538;
    v7[4] = v3;
    [(NSMutableDictionary *)aggrScanMetricDict enumerateKeysAndObjectsUsingBlock:v7];
    CFStringRef v8 = @"agsE";
    id v9 = v3;
    dispatch_source_t v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    if (dword_1009F8250 <= 20 && (dword_1009F8250 != -1 || _LogCategory_Initialize()))
    {
      [v3 count];
      LogPrintF_safe();
    }
    PLLogRegisteredEvent();
  }
  id v6 = self->_aggrScanMetricDict;
  self->_aggrScanMetricDict = 0;
}

- (void)reportxpcCBAdvertiserUpdate:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100088184;
  block[3] = &unk_100997450;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, block);
}

- (void)reportRSSIMetric:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000882B0;
  v7[3] = &unk_100998510;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_setupMetricExportTimer
{
  p_whbMetricExportTimer = &self->_whbMetricExportTimer;
  id v4 = self->_whbMetricExportTimer;
  if (!v4)
  {
    dispatch_source_t v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    objc_storeStrong((id *)p_whbMetricExportTimer, v5);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10008846C;
    v6[3] = &unk_100998510;
    id v4 = v5;
    id v7 = v4;
    id v8 = self;
    dispatch_source_set_event_handler((dispatch_source_t)v4, v6);
    CUDispatchTimerSet();
    dispatch_activate((dispatch_object_t)*p_whbMetricExportTimer);
    if (dword_1009F8250 <= 30 && (dword_1009F8250 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
  }
}

- (void)_whbMetricExportTimerFired
{
  if (dword_1009F8250 <= 20 && (dword_1009F8250 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  unint64_t numRssiBucketChanges = self->_numRssiBucketChanges;
  unint64_t v5 = self->_numRssiNoBucketChanges + numRssiBucketChanges;
  if (v5) {
    *(float *)&double v2 = (float)((float)numRssiBucketChanges / (float)v5) * 100.0;
  }
  else {
    double v2 = 0.0;
  }
  v12[0] = @"CBWHBMetricsKeyEventType";
  v12[1] = @"CBWHBMetricsKeyRSSIChangePercent";
  v13[0] = @"RSSILevelEvent";
  id v6 = +[NSNumber numberWithFloat:v2];
  v13[1] = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];

  id v8 = +[CBMetricsDaemon sharedCBMetricsDaemon];
  [v8 reportWhbMetric:v7];

  self->_numRssiNoBucketChanges = 0;
  self->_unint64_t numRssiBucketChanges = 0;
  whbMetricExportTimer = self->_whbMetricExportTimer;
  if (whbMetricExportTimer)
  {
    id v10 = whbMetricExportTimer;
    dispatch_source_cancel(v10);
    unsigned int v11 = self->_whbMetricExportTimer;
    self->_whbMetricExportTimer = 0;
  }
}

- (void)reportWhbMetric:(id)a3
{
  id v4 = a3;
  if (dword_1009F8250 <= 20 && (dword_1009F8250 != -1 || _LogCategory_Initialize()))
  {
    id v7 = CUPrintNSObjectOneLine();
    LogPrintF_safe();
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100088764;
  block[3] = &unk_100997450;
  id v9 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whbMetricExportTimer, 0);
  objc_storeStrong((id *)&self->_aggrScanMetricExportTimer, 0);
  objc_storeStrong((id *)&self->_aggrScanMetricDict, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_discoveryEventsArray, 0);
}

@end