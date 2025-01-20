@interface CSPower
+ (CSPower)sharedInstance;
- (BOOL)isAssertionActive;
- (CSPower)init;
- (void)clearAllPowerloggingInfo;
- (void)clearPowerloggingInfo:(int)a3;
- (void)createPowerAssertion:(id)a3;
- (void)dealloc;
- (void)onKappaSessionUpdate:(int)a3 data:(id)a4;
- (void)powerlogActivity:(double)a3 state:(int)a4;
- (void)releaseAllCFObjects;
- (void)releasePowerAssertion;
- (void)sendPowerlogMetrics:(int)a3 start:(id)a4 end:(id)a5;
@end

@implementation CSPower

+ (CSPower)sharedInstance
{
  if (qword_1003DD818 != -1) {
    dispatch_once(&qword_1003DD818, &stru_1003BB0F0);
  }
  v2 = (void *)qword_1003DD820;

  return (CSPower *)v2;
}

- (CSPower)init
{
  if (qword_1003DB760 != -1) {
    dispatch_once(&qword_1003DB760, &stru_1003BB160);
  }
  v3 = qword_1003DB768;
  if (os_log_type_enabled((os_log_t)qword_1003DB768, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "init", buf, 2u);
  }
  v16.receiver = self;
  v16.super_class = (Class)CSPower;
  v4 = [(CSPower *)&v16 init];
  if (v4)
  {
    dispatch_queue_t v5 = dispatch_queue_create("CSPowerDispatchQueue", 0);
    dispatchQueue = v4->_dispatchQueue;
    v4->_dispatchQueue = (OS_dispatch_queue *)v5;

    if ([(CSPower *)v4 isAssertionActive]) {
      [(CSPower *)v4 releasePowerAssertion];
    }
    v4->_valid = 1;
    v4->_refCount = 0;
    v4->_assertionID = @"com.apple.anomalydetectiond.PowerAssertion";
    v7 = +[NSNull null];
    v8 = +[NSNull null];
    v9 = +[NSNull null];
    v10 = +[NSNull null];
    v11 = +[NSNull null];
    v12 = +[NSNull null];
    uint64_t v13 = +[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", v7, v8, v9, v10, v11, v12, 0);
    activeReasons = v4->_activeReasons;
    v4->_activeReasons = (NSMutableArray *)v13;
  }
  return v4;
}

- (void)dealloc
{
  [(CSPower *)self releaseAllCFObjects];
  v3.receiver = self;
  v3.super_class = (Class)CSPower;
  [(CSPower *)&v3 dealloc];
}

- (BOOL)isAssertionActive
{
  if (qword_1003DB760 != -1) {
    dispatch_once(&qword_1003DB760, &stru_1003BB160);
  }
  objc_super v3 = qword_1003DB768;
  if (os_log_type_enabled((os_log_t)qword_1003DB768, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)dispatch_queue_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "isAssertionActive", v5, 2u);
  }
  return self->_assertionReference != 0;
}

- (void)createPowerAssertion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10031FD5C;
  v7[3] = &unk_10039C138;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(dispatchQueue, v7);
}

- (void)releasePowerAssertion
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100320090;
  block[3] = &unk_10039F568;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

- (void)releaseAllCFObjects
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003203CC;
  block[3] = &unk_10039F568;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

- (void)clearAllPowerloggingInfo
{
  if (qword_1003DB760 != -1) {
    dispatch_once(&qword_1003DB760, &stru_1003BB160);
  }
  objc_super v3 = qword_1003DB768;
  if (os_log_type_enabled((os_log_t)qword_1003DB768, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "clearAllPowerloggingInfo", v7, 2u);
  }
  if ([(NSMutableArray *)self->_activeReasons count])
  {
    unint64_t v4 = 0;
    do
    {
      activeReasons = self->_activeReasons;
      id v6 = +[NSNull null];
      [(NSMutableArray *)activeReasons addObject:v6];

      ++v4;
    }
    while ((unint64_t)[(NSMutableArray *)self->_activeReasons count] > v4);
  }
}

- (void)clearPowerloggingInfo:(int)a3
{
  if (qword_1003DB760 != -1) {
    dispatch_once(&qword_1003DB760, &stru_1003BB160);
  }
  dispatch_queue_t v5 = qword_1003DB768;
  if (os_log_type_enabled((os_log_t)qword_1003DB768, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "clearPowerloggingInfo", v8, 2u);
  }
  activeReasons = self->_activeReasons;
  v7 = +[NSNull null];
  [(NSMutableArray *)activeReasons replaceObjectAtIndex:a3 withObject:v7];

  if ((a3 - 1) <= 1) {
    self->_sessionType = 0;
  }
}

- (void)powerlogActivity:(double)a3 state:(int)a4
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003206F8;
  block[3] = &unk_1003BB118;
  int v6 = a4;
  block[4] = self;
  *(double *)&void block[5] = a3;
  dispatch_sync(dispatchQueue, block);
}

- (void)sendPowerlogMetrics:(int)a3 start:(id)a4 end:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v7 = a4;
  id v8 = a5;
  if (qword_1003DB760 != -1) {
    dispatch_once(&qword_1003DB760, &stru_1003BB160);
  }
  v9 = qword_1003DB768;
  if (os_log_type_enabled((os_log_t)qword_1003DB768, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "sendPowerlogMetrics", v12, 2u);
  }
  v13[0] = @"APWakeReason";
  v10 = +[NSNumber numberWithUnsignedInt:v6];
  v14[0] = v10;
  v14[1] = v7;
  v13[1] = @"reasonStartTimestamp";
  v13[2] = @"reasonEndTimestamp";
  v14[2] = v8;
  v11 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];

  +[NSString stringWithCString:"KappaEvent" encoding:4];
  PLLogRegisteredEvent();
}

- (void)onKappaSessionUpdate:(int)a3 data:(id)a4
{
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100320AF4;
  v5[3] = &unk_1003BB140;
  int v6 = a3;
  v5[4] = self;
  dispatch_sync(dispatchQueue, v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeReasons, 0);
  objc_storeStrong((id *)&self->_osTransaction, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end