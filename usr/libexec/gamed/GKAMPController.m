@interface GKAMPController
+ (id)controller;
- (AMSBag)bag;
- (AMSMetrics)metrics;
- (BOOL)isSetup;
- (GKAMPController)initWithHasAcknowledgedLatestGDPRBlock:(id)a3 bagChanged:(id)a4;
- (GKMultiplayerActivityEventFilter)mafEventFilter;
- (NSDictionary)metadata;
- (OS_dispatch_queue)serialQueue;
- (_TtC14GameDaemonCore17GKMetricsPipeline)metricsPipeline;
- (id)bagChanged;
- (id)hasAcknowledgedLatestGDPRBlock;
- (void)createBagIfNecessary;
- (void)getBagWithCompletion:(id)a3;
- (void)reportClickStreamEventWithHostAppBundleId:(id)a3 metricsFields:(id)a4;
- (void)reportFriendInviteActivityEventAtStage:(unint64_t)a3 hostApp:(id)a4;
- (void)reportLoadUrlMetricsEventWithMetricsFields:(id)a3;
- (void)reportMetricsEventWithTopic:(id)a3 hostAppBundleId:(id)a4 shouldFlush:(id)a5 metricsFields:(id)a6;
- (void)reportMultiplayerActivityEventWithHostAppBundleId:(id)a3 metricsFields:(id)a4;
- (void)reportPerformanceEventWithHostAppBundleId:(id)a3 metricsFields:(id)a4;
- (void)reportURLSessionEventWithTask:(id)a3 metrics:(id)a4;
- (void)setBag:(id)a3;
- (void)setBagChanged:(id)a3;
- (void)setHasAcknowledgedLatestGDPRBlock:(id)a3;
- (void)setMafEventFilter:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setMetrics:(id)a3;
- (void)setMetricsPipeline:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setupAsyncWithStoreBag:(id)a3 withCompletion:(id)a4;
- (void)tearDown;
- (void)updateMetadataWithLocalPlayer:(id)a3;
@end

@implementation GKAMPController

+ (id)controller
{
  if (qword_100329908 != -1) {
    dispatch_once(&qword_100329908, &stru_1002DBCF8);
  }
  v2 = (void *)qword_100329900;

  return v2;
}

- (GKAMPController)initWithHasAcknowledgedLatestGDPRBlock:(id)a3 bagChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)GKAMPController;
  v8 = [(GKAMPController *)&v17 init];
  if (v8)
  {
    id v9 = objc_retainBlock(v6);
    id hasAcknowledgedLatestGDPRBlock = v8->_hasAcknowledgedLatestGDPRBlock;
    v8->_id hasAcknowledgedLatestGDPRBlock = v9;

    id v11 = objc_retainBlock(v7);
    id bagChanged = v8->_bagChanged;
    v8->_id bagChanged = v11;

    metadata = v8->_metadata;
    v8->_metadata = (NSDictionary *)&__NSDictionary0__struct;

    dispatch_queue_t v14 = dispatch_queue_create("com.apple.GameKit.ampController.serialQueue", 0);
    serialQueue = v8->_serialQueue;
    v8->_serialQueue = (OS_dispatch_queue *)v14;
  }
  return v8;
}

- (void)getBagWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(GKAMPController *)self serialQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100125FF0;
  v7[3] = &unk_1002D3C38;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)createBagIfNecessary
{
  v3 = dispatch_get_current_queue();
  id v4 = [(GKAMPController *)self serialQueue];

  if (v3 != v4)
  {
    label = dispatch_queue_get_label(v3);
    id v6 = [(GKAMPController *)self serialQueue];
    id v7 = dispatch_queue_get_label(v6);
    id v8 = +[NSThread callStackSymbols];
    id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s invoked on the wrong queue (got:%s expected:%s) at %@", "-[GKAMPController createBagIfNecessary]", label, v7, v8);
    v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/AMP/GKAMPController.m"];
    id v11 = [v10 lastPathComponent];
    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_actualCurrentQueue == self.serialQueue)\n[%s (%s:%d)]", v9, "-[GKAMPController createBagIfNecessary]", [v11 UTF8String], 91);

    +[NSException raise:@"GameKit Exception", @"%@", v12 format];
  }

  v13 = [(GKAMPController *)self bag];

  if (!v13)
  {
    dispatch_queue_t v14 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v15 = (id)GKOSLoggers();
      dispatch_queue_t v14 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Creating bag", buf, 2u);
    }
    v16 = +[AMSBag bagForProfile:@"GameCenterD" profileVersion:@"1"];
    [(GKAMPController *)self setBag:v16];

    objc_super v17 = [(GKAMPController *)self bagChanged];
    v17[2]();
  }
}

- (void)setupAsyncWithStoreBag:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(GKAMPController *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012642C;
  block[3] = &unk_1002D3A48;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)updateMetadataWithLocalPlayer:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [[GKMetricsIntBucketer alloc] initWithBuckets:&off_1002F2F48];
    id v6 = [[GKMetricsIntBucketer alloc] initWithBuckets:&off_1002F2F60];
    v18[0] = @"friendCount";
    id v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[GKMetricsIntBucketer clamp:](v5, "clamp:", [v4 numberOfFriends]));
    v18[1] = @"gameCount";
    v19[0] = v7;
    id v8 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[GKMetricsIntBucketer clamp:](v6, "clamp:", [v4 numberOfGames]));
    v19[1] = v8;
    id v9 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
    [(GKAMPController *)self setMetadata:v9];

    id v10 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v11 = (id)GKOSLoggers();
      id v10 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v12 = v10;
      id v13 = [(GKAMPController *)self metadata];
      int v16 = 138412290;
      objc_super v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Updated metrics with metadata: %@", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    [(GKAMPController *)self setMetadata:0];
    dispatch_queue_t v14 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v15 = (id)GKOSLoggers();
      dispatch_queue_t v14 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Reset metrics metadata", (uint8_t *)&v16, 2u);
    }
  }
}

- (void)tearDown
{
  v3 = dispatch_get_current_queue();
  id v4 = [(GKAMPController *)self serialQueue];

  if (v3 != v4)
  {
    label = dispatch_queue_get_label(v3);
    id v6 = [(GKAMPController *)self serialQueue];
    id v7 = dispatch_queue_get_label(v6);
    id v8 = +[NSThread callStackSymbols];
    id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s invoked on the wrong queue (got:%s expected:%s) at %@", "-[GKAMPController tearDown]", label, v7, v8);
    id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/AMP/GKAMPController.m"];
    id v11 = [v10 lastPathComponent];
    id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_actualCurrentQueue == self.serialQueue)\n[%s (%s:%d)]", v9, "-[GKAMPController tearDown]", [v11 UTF8String], 153);

    +[NSException raise:@"GameKit Exception", @"%@", v12 format];
  }

  if ([(GKAMPController *)self isSetup])
  {
    id v13 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v14 = (id)GKOSLoggers();
      id v13 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Tearing down metrics", buf, 2u);
    }
    [(GKAMPController *)self setMetricsPipeline:0];
    [(GKAMPController *)self setMetrics:0];
  }
}

- (BOOL)isSetup
{
  v3 = [(GKAMPController *)self metricsPipeline];
  if (v3)
  {
    id v4 = [(GKAMPController *)self metrics];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)reportMetricsEventWithTopic:(id)a3 hostAppBundleId:(id)a4 shouldFlush:(id)a5 metricsFields:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v15 = (id)GKOSLoggers();
    id v14 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)objc_super v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Metrics event added to queue", v17, 2u);
  }
  int v16 = [(GKAMPController *)self metricsPipeline];
  [v16 processEventWithTopic:v10 shouldFlush:[v12 BOOLValue] metricsFields:v13 hostAppBundleId:v11 completionHandler:&stru_1002DBD78];
}

- (void)reportClickStreamEventWithHostAppBundleId:(id)a3 metricsFields:(id)a4
{
}

- (void)reportPerformanceEventWithHostAppBundleId:(id)a3 metricsFields:(id)a4
{
}

- (void)reportMultiplayerActivityEventWithHostAppBundleId:(id)a3 metricsFields:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(GKAMPController *)self mafEventFilter];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100126D3C;
  v10[3] = &unk_1002D9C10;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 filterEventWithMetricsFields:v7 completionHandler:v10];
}

- (void)reportLoadUrlMetricsEventWithMetricsFields:(id)a3
{
  id v4 = +[NSMutableDictionary dictionaryWithDictionary:a3];
  BOOL v5 = [(GKAMPController *)self metadata];
  [v4 addEntriesFromDictionary:v5];

  uint64_t v6 = GKDaemonIdentifier;
  v9[0] = @"app";
  v9[1] = @"topic";
  uint64_t v7 = GKReporterGCPerformanceTopic;
  v10[0] = GKDaemonIdentifier;
  v10[1] = GKReporterGCPerformanceTopic;
  id v8 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  [v4 addEntriesFromDictionary:v8];

  [(GKAMPController *)self reportMetricsEventWithTopic:v7 hostAppBundleId:v6 shouldFlush:&__kCFBooleanFalse metricsFields:v4];
}

- (void)reportFriendInviteActivityEventAtStage:(unint64_t)a3 hostApp:(id)a4
{
  id v6 = a4;
  uint64_t v7 = +[GKFriendInviteActivityEvent metricsFieldsForStage:a3 hostApp:v6];
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  id v9 = (void *)os_log_GKFriending;
  if (os_log_type_enabled(os_log_GKFriending, OS_LOG_TYPE_INFO))
  {
    id v10 = v9;
    id v11 = +[GKFriendInviteActivityEvent stringForStage:a3];
    int v12 = 138412290;
    id v13 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "GKAMPController: Reporting inviteActivity stage %@", (uint8_t *)&v12, 0xCu);
  }
  [(GKAMPController *)self reportClickStreamEventWithHostAppBundleId:v6 metricsFields:v7];
}

- (AMSBag)bag
{
  return (AMSBag *)objc_getProperty(self, a2, 8, 1);
}

- (void)setBag:(id)a3
{
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMetadata:(id)a3
{
}

- (AMSMetrics)metrics
{
  return (AMSMetrics *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMetrics:(id)a3
{
}

- (_TtC14GameDaemonCore17GKMetricsPipeline)metricsPipeline
{
  return (_TtC14GameDaemonCore17GKMetricsPipeline *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMetricsPipeline:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (id)hasAcknowledgedLatestGDPRBlock
{
  return self->_hasAcknowledgedLatestGDPRBlock;
}

- (void)setHasAcknowledgedLatestGDPRBlock:(id)a3
{
}

- (id)bagChanged
{
  return self->_bagChanged;
}

- (void)setBagChanged:(id)a3
{
}

- (GKMultiplayerActivityEventFilter)mafEventFilter
{
  return self->_mafEventFilter;
}

- (void)setMafEventFilter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mafEventFilter, 0);
  objc_storeStrong(&self->_bagChanged, 0);
  objc_storeStrong(&self->_hasAcknowledgedLatestGDPRBlock, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_metricsPipeline, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_bag, 0);
}

- (void)reportURLSessionEventWithTask:(id)a3 metrics:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1001CF174(v6, v7);
}

@end