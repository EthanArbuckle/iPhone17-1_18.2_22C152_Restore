@interface NRRTCPairingReporter
+ (id)sharedInstance;
+ (void)submitRTCPairingMetricWithMetricID:(id)a3 withCompletion:(id)a4;
- (NRRTCPairingReporter)init;
- (NSString)gizmoBuild;
- (NSString)gizmoHW;
- (id)lastControllerPushed:(id)a3;
- (unsigned)reportSubreason;
- (void)addToOrCapOffRTCPairingMetric:(unsigned int)a3;
- (void)assembleAndSubmitPairingMetricWithMetricID:(id)a3 withCompletion:(id)a4;
- (void)setGizmoBuild:(id)a3;
- (void)setGizmoHW:(id)a3;
- (void)setReportSubreason:(unsigned int)a3;
@end

@implementation NRRTCPairingReporter

- (NRRTCPairingReporter)init
{
  v7.receiver = self;
  v7.super_class = (Class)NRRTCPairingReporter;
  v2 = [(NRRTCPairingReporter *)&v7 init];
  v3 = v2;
  if (v2 && !v2->_queue)
  {
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.nanoregistry.rtcpairingreport", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;
  }
  return v3;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BCE20;
  block[3] = &unk_100165618;
  block[4] = a1;
  if (qword_1001A13A0 != -1) {
    dispatch_once(&qword_1001A13A0, block);
  }
  v2 = (void *)qword_1001A1398;

  return v2;
}

+ (void)submitRTCPairingMetricWithMetricID:(id)a3 withCompletion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[NRRTCPairingReporter sharedInstance];
  [v7 assembleAndSubmitPairingMetricWithMetricID:v6 withCompletion:v5];
}

- (void)addToOrCapOffRTCPairingMetric:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (BRStaleOrNoPairingMetric())
  {
    id v5 = nr_pairing_reporter_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (!v6) {
      return;
    }
    id v7 = nr_pairing_reporter_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Stale or no pairing metric in metric dir, will not attempt to submit anything to RTC", buf, 2u);
    }
    goto LABEL_7;
  }
  if (v3)
  {
    v8 = +[NRRTCPairingReporter sharedInstance];
    [v8 setReportSubreason:v3];

    id v7 = +[NRRTCPairingReporter sharedInstance];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000BD1EC;
    v28[3] = &unk_1001692F0;
    int v29 = v3;
    [v7 assembleAndSubmitPairingMetricWithMetricID:0 withCompletion:v28];
LABEL_7:

    return;
  }
  v9 = nr_pairing_reporter_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    v11 = nr_pairing_reporter_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Not finished with pairing report, but will add success subreason", buf, 2u);
    }
  }
  v30[0] = kPairingMetricsDir;
  v12 = BRGetCurrentMetricIDFromMetricDir();
  v30[1] = v12;
  v30[2] = kPairingMetricNRPlistName;
  v13 = +[NSArray arrayWithObjects:v30 count:3];
  v14 = +[NSString pathWithComponents:v13];
  v15 = +[NSURL fileURLWithPath:v14];

  objc_initWeak(&location, self);
  *(void *)buf = 0;
  v24 = buf;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  queue = self->_queue;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000BD308;
  v18[3] = &unk_100169318;
  objc_copyWeak(&v21, &location);
  int v22 = 0;
  id v19 = v15;
  v20 = buf;
  id v17 = v15;
  dispatch_async((dispatch_queue_t)queue, v18);

  objc_destroyWeak(&v21);
  _Block_object_dispose(buf, 8);
  objc_destroyWeak(&location);
}

- (void)assembleAndSubmitPairingMetricWithMetricID:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = nr_pairing_reporter_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

  if (v9)
  {
    BOOL v10 = nr_pairing_reporter_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000FB3C0(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  v18 = BRGetCurrentMetricIDFromMetricDir();
  BOOL v19 = v18 == 0;

  if (v19)
  {
    v33 = nr_pairing_reporter_log();
    BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);

    if (v34)
    {
      v35 = nr_pairing_reporter_log();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "No pairing metric in metric dir, will not attempt to submit anything to RTC", buf, 2u);
      }
    }
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
  else
  {
    *(void *)buf = 0;
    v44 = buf;
    uint64_t v45 = 0x3032000000;
    v46 = sub_1000BD99C;
    v47 = sub_1000BD9AC;
    id v48 = 0;
    objc_initWeak(&location, self);
    v51[0] = kPairingMetricsDir;
    v20 = BRGetCurrentMetricIDFromMetricDir();
    v51[1] = v20;
    id v21 = +[NSArray arrayWithObjects:v51 count:2];
    int v22 = +[NSString pathWithComponents:v21];

    v50[0] = v22;
    v50[1] = kPairingMetricBridgePlistName;
    v23 = +[NSArray arrayWithObjects:v50 count:2];
    v24 = +[NSString pathWithComponents:v23];
    uint64_t v25 = +[NSURL fileURLWithPath:v24];

    v49[0] = v22;
    v49[1] = kPairingMetricNRPlistName;
    char v26 = +[NSArray arrayWithObjects:v49 count:2];
    v27 = +[NSString pathWithComponents:v26];
    v28 = +[NSURL fileURLWithPath:v27];

    int v29 = +[NSMutableDictionary dictionaryWithContentsOfURL:v25];
    queue = self->_queue;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_1000BD9B4;
    v36[3] = &unk_100169368;
    objc_copyWeak(&v41, &location);
    v40 = buf;
    id v37 = v28;
    id v38 = v29;
    id v39 = v7;
    id v31 = v29;
    id v32 = v28;
    dispatch_async((dispatch_queue_t)queue, v36);

    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
    _Block_object_dispose(buf, 8);
  }
}

- (id)lastControllerPushed:(id)a3
{
  id v3 = a3;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = sub_1000BD99C;
  v17[4] = sub_1000BD9AC;
  id v18 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = sub_1000BD99C;
  uint64_t v15 = sub_1000BD9AC;
  id v16 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000BE060;
  v6[3] = &unk_100169390;
  BOOL v9 = v17;
  BOOL v10 = &v11;
  id v7 = @"PushedControllerNumber";
  v8 = @"HoldControllerNumber";
  [v3 enumerateKeysAndObjectsUsingBlock:v6];
  id v4 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(v17, 8);

  return v4;
}

- (unsigned)reportSubreason
{
  return self->_reportSubreason;
}

- (void)setReportSubreason:(unsigned int)a3
{
  self->_reportSubreason = a3;
}

- (NSString)gizmoBuild
{
  return self->_gizmoBuild;
}

- (void)setGizmoBuild:(id)a3
{
}

- (NSString)gizmoHW
{
  return self->_gizmoHW;
}

- (void)setGizmoHW:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gizmoHW, 0);
  objc_storeStrong((id *)&self->_gizmoBuild, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end