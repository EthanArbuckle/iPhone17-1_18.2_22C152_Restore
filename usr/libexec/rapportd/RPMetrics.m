@interface RPMetrics
+ (id)sharedMetrics;
+ (id)sharedMetricsNoCreate;
- (NSMutableDictionary)awdlBrowseMetrics;
- (NSMutableDictionary)needsAWDLAdvertisementMetrics;
- (OS_dispatch_queue)dispatchQueue;
- (RPMetrics)init;
- (id)descriptionWithLevel:(int)a3;
- (void)_activate;
- (void)_logReceivedMessageType:(int)a3 identifier:(id)a4 options:(id)a5 appID:(id)a6 timeBegin:(double)a7 timeEnd:(double)a8 bytesAdded:(unint64_t)a9 messagesAdded:(unint64_t)a10;
- (void)_reportMetrics;
- (void)activate;
- (void)invalidate;
- (void)logAWDLBrowseClient:(id)a3;
- (void)logNeedsAWDLAdvertisementClient:(id)a3 actionType:(unsigned __int8)a4 bluetoothType:(unsigned __int8)a5;
- (void)logReceivedMessageType:(int)a3 identifier:(id)a4 options:(id)a5 appID:(id)a6 ctx:(id *)a7;
- (void)setAwdlBrowseMetrics:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setNeedsAWDLAdvertisementMetrics:(id)a3;
@end

@implementation RPMetrics

+ (id)sharedMetrics
{
  if (qword_100142E28 != -1) {
    dispatch_once(&qword_100142E28, &stru_1001238D8);
  }
  v2 = (void *)qword_100142E20;

  return v2;
}

+ (id)sharedMetricsNoCreate
{
  return (id)qword_100142E20;
}

- (RPMetrics)init
{
  v20.receiver = self;
  v20.super_class = (Class)RPMetrics;
  v2 = [(RPMetrics *)&v20 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    awdlBrowseMetrics = v3->_awdlBrowseMetrics;
    v3->_awdlBrowseMetrics = v4;

    v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    needsAWDLAdvertisementMetrics = v3->_needsAWDLAdvertisementMetrics;
    v3->_needsAWDLAdvertisementMetrics = v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_BACKGROUND, 0);

    dispatch_queue_t v10 = dispatch_queue_create("RPMetrics", v9);
    reportQueue = v3->_reportQueue;
    v3->_reportQueue = (OS_dispatch_queue *)v10;

    dispatch_source_t v12 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)v3->_reportQueue);
    reportTimer = v3->_reportTimer;
    v3->_reportTimer = (OS_dispatch_source *)v12;

    v14 = v3->_reportTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000789D8;
    handler[3] = &unk_100121158;
    v15 = v3;
    v19 = v15;
    dispatch_source_set_event_handler(v14, handler);
    CUDispatchTimerSet();
    dispatch_resume((dispatch_object_t)v3->_reportTimer);
    v16 = v15;
  }
  return v3;
}

- (id)descriptionWithLevel:(int)a3
{
  return 0;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100078A5C;
  block[3] = &unk_100121158;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  if (dword_100141D68 <= 30 && (dword_100141D68 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)invalidate
{
}

- (void)logAWDLBrowseClient:(id)a3
{
  id v4 = a3;
  reportQueue = self->_reportQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100078BF4;
  v7[3] = &unk_1001219D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(reportQueue, v7);
}

- (void)logNeedsAWDLAdvertisementClient:(id)a3 actionType:(unsigned __int8)a4 bluetoothType:(unsigned __int8)a5
{
  int v5 = a5;
  int v6 = a4;
  id v8 = a3;
  v9 = v8;
  if (v8 && v6 && v5)
  {
    reportQueue = self->_reportQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100078D68;
    block[3] = &unk_100123920;
    char v14 = v6;
    char v15 = v5;
    id v12 = v8;
    v13 = self;
    dispatch_async(reportQueue, block);
  }
}

- (void)logReceivedMessageType:(int)a3 identifier:(id)a4 options:(id)a5 appID:(id)a6 ctx:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  unint64_t var1 = a7->var1;
  unint64_t v16 = CFDictionaryGetInt64() + var1;
  a7->unint64_t var1 = v16;
  unint64_t v17 = a7->var2 + 1;
  a7->var2 = v17;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  double var0 = a7->var0;
  if (Current - a7->var0 >= 60.0)
  {
    a7->double var0 = Current;
    a7->unint64_t var1 = 0;
    a7->var2 = 0;
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100078FE4;
    block[3] = &unk_100123948;
    void block[4] = self;
    int v29 = a3;
    id v22 = v12;
    id v23 = v13;
    id v24 = v14;
    double v25 = var0;
    CFAbsoluteTime v26 = Current;
    unint64_t v27 = v16;
    unint64_t v28 = v17;
    dispatch_async(dispatchQueue, block);
  }
}

- (void)_logReceivedMessageType:(int)a3 identifier:(id)a4 options:(id)a5 appID:(id)a6 timeBegin:(double)a7 timeEnd:(double)a8 bytesAdded:(unint64_t)a9 messagesAdded:(unint64_t)a10
{
  uint64_t v15 = *(void *)&a3;
  if (a7 == 0.0) {
    double v16 = a8;
  }
  else {
    double v16 = a7;
  }
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v27 = objc_alloc_init((Class)NSMutableDictionary);
  [v27 setObject:v17 forKeyedSubscript:@"appID"];

  objc_super v20 = +[NSNumber numberWithUnsignedLongLong:a9];
  [v27 setObject:v20 forKeyedSubscript:@"bytes"];

  [v27 setObject:v19 forKeyedSubscript:@"identifier"];
  v21 = NSDictionaryGetNSNumber();
  [v27 setObject:v21 forKeyedSubscript:@"linkType"];

  id v22 = +[NSNumber numberWithUnsignedLongLong:a10];
  [v27 setObject:v22 forKeyedSubscript:@"messages"];

  CFStringGetTypeID();
  uint64_t TypedValue = CFDictionaryGetTypedValue();

  [v27 setObject:TypedValue forKeyedSubscript:@"senderID"];
  id v24 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:v16];
  [v27 setObject:v24 forKeyedSubscript:@"timeBegin"];

  id v25 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:a8];
  [v27 setObject:v25 forKeyedSubscript:@"timeEnd"];

  CFAbsoluteTime v26 = +[NSNumber numberWithInt:v15];
  [v27 setObject:v26 forKeyedSubscript:@"type"];

  if (qword_100142E30 != -1) {
    dispatch_once(&qword_100142E30, &stru_100123968);
  }
  if (qword_100142E38 && dlsym((void *)qword_100142E38, "PLLogRegisteredEvent"))
  {
    if (dword_100141D68 <= 10 && (dword_100141D68 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    off_100141DD8(91, @"com.apple.rapport.receivedEvent", (uint64_t)v27, 0);
  }
}

- (void)_reportMetrics
{
  if (self->_sendReport)
  {
    v2 = self;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v3 = [(NSMutableDictionary *)self->_awdlBrowseMetrics allKeys];
    id v4 = [v3 countByEnumeratingWithState:&v33 objects:v42 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v34;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v34 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          v40[0] = @"browseCount";
          v9 = [(NSMutableDictionary *)v2->_awdlBrowseMetrics objectForKey:v8];
          v40[1] = @"client";
          v41[0] = v9;
          v41[1] = v8;
          dispatch_queue_t v10 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];

          CUMetricsLog();
        }
        id v5 = [v3 countByEnumeratingWithState:&v33 objects:v42 count:16];
      }
      while (v5);
    }

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = [(NSMutableDictionary *)v2->_needsAWDLAdvertisementMetrics allKeys];
    id v28 = [obj countByEnumeratingWithState:&v29 objects:v39 count:16];
    if (v28)
    {
      uint64_t v27 = *(void *)v30;
      do
      {
        for (j = 0; j != v28; j = (char *)j + 1)
        {
          if (*(void *)v30 != v27) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v29 + 1) + 8 * (void)j);
          id v13 = [v12 componentsSeparatedByString:@","];
          v37[0] = @"advCount";
          id v14 = [(NSMutableDictionary *)v2->_needsAWDLAdvertisementMetrics objectForKey:v12];
          v38[0] = v14;
          v37[1] = @"actionType";
          uint64_t v15 = v2;
          double v16 = [v13 objectAtIndexedSubscript:0];
          id v17 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v16 intValue]);
          v38[1] = v17;
          v37[2] = @"bluetoothType";
          id v18 = [v13 objectAtIndexedSubscript:1];
          id v19 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v18 intValue]);
          v38[2] = v19;
          v37[3] = @"client";
          objc_super v20 = [v13 objectAtIndexedSubscript:2];
          v38[3] = v20;
          v21 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:4];

          v2 = v15;
          CUMetricsLog();
        }
        id v28 = [obj countByEnumeratingWithState:&v29 objects:v39 count:16];
      }
      while (v28);
    }

    uint64_t v22 = +[NSMutableDictionary dictionary];
    awdlBrowseMetrics = v2->_awdlBrowseMetrics;
    v2->_awdlBrowseMetrics = (NSMutableDictionary *)v22;

    uint64_t v24 = +[NSMutableDictionary dictionary];
    needsAWDLAdvertisementMetrics = v2->_needsAWDLAdvertisementMetrics;
    v2->_needsAWDLAdvertisementMetrics = (NSMutableDictionary *)v24;

    v2->_sendReport = 0;
  }
}

- (NSMutableDictionary)awdlBrowseMetrics
{
  return self->_awdlBrowseMetrics;
}

- (void)setAwdlBrowseMetrics:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (NSMutableDictionary)needsAWDLAdvertisementMetrics
{
  return self->_needsAWDLAdvertisementMetrics;
}

- (void)setNeedsAWDLAdvertisementMetrics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_needsAWDLAdvertisementMetrics, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_awdlBrowseMetrics, 0);
  objc_storeStrong((id *)&self->_reportTimer, 0);

  objc_storeStrong((id *)&self->_reportQueue, 0);
}

@end