@interface NRTailspinCapture
+ (id)sharedInstance;
- (BOOL)_gateCheckOk;
- (BOOL)loggedOpenFail;
- (NRTailspinCapture)init;
- (NSDateFormatter)formatter;
- (OS_dispatch_queue)queue;
- (double)gateTime;
- (double)minRestSec;
- (os_unfair_lock_s)gateLock;
- (void)captureForApp:(id)a3 startEdge:(unint64_t)a4;
- (void)setFormatter:(id)a3;
- (void)setGateLock:(os_unfair_lock_s)a3;
- (void)setGateTime:(double)a3;
- (void)setLoggedOpenFail:(BOOL)a3;
- (void)setMinRestSec:(double)a3;
- (void)setQueue:(id)a3;
@end

@implementation NRTailspinCapture

+ (id)sharedInstance
{
  if (qword_1001A11E0 != -1) {
    dispatch_once(&qword_1001A11E0, &stru_100168418);
  }
  v2 = (void *)qword_1001A11E8;

  return v2;
}

- (NRTailspinCapture)init
{
  v11.receiver = self;
  v11.super_class = (Class)NRTailspinCapture;
  v2 = [(NRTailspinCapture *)&v11 init];
  if (v2)
  {
    v3 = +[NSUserDefaults standardUserDefaults];
    id v4 = [v3 integerForKey:@"minRestSec"];
    uint64_t v5 = 30;
    if (v4) {
      uint64_t v5 = (uint64_t)v4;
    }
    [(NRTailspinCapture *)v2 setMinRestSec:(double)v5];
    id v6 = objc_alloc_init((Class)NSDateFormatter);
    [(NRTailspinCapture *)v2 setFormatter:v6];

    v7 = [(NRTailspinCapture *)v2 formatter];
    [v7 setDateFormat:@"yyyyMMdd_HHmmSS"];

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("nanoregistry.tailspin", v8);
    [(NRTailspinCapture *)v2 setQueue:v9];

    [(NRTailspinCapture *)v2 setGateLock:0];
  }
  return v2;
}

- (void)captureForApp:(id)a3 startEdge:(unint64_t)a4
{
  id v6 = a3;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if ([(NRTailspinCapture *)self _gateCheckOk])
  {
    v8 = [(NRTailspinCapture *)self queue];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000844EC;
    v9[3] = &unk_100168440;
    id v10 = v6;
    objc_super v11 = self;
    unint64_t v12 = a4;
    CFAbsoluteTime v13 = Current;
    dispatch_async(v8, v9);
  }
}

- (BOOL)_gateCheckOk
{
  BOOL v3 = os_unfair_lock_trylock(&self->_gateLock);
  if (v3)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    [(NRTailspinCapture *)self gateTime];
    if (Current <= v5)
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      [(NRTailspinCapture *)self minRestSec];
      [(NRTailspinCapture *)self setGateTime:Current + v6];
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (double)minRestSec
{
  return self->_minRestSec;
}

- (void)setMinRestSec:(double)a3
{
  self->_minRestSec = a3;
}

- (NSDateFormatter)formatter
{
  return self->_formatter;
}

- (void)setFormatter:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (os_unfair_lock_s)gateLock
{
  return self->_gateLock;
}

- (void)setGateLock:(os_unfair_lock_s)a3
{
  self->_gateLock = a3;
}

- (double)gateTime
{
  return self->_gateTime;
}

- (void)setGateTime:(double)a3
{
  self->_gateTime = a3;
}

- (BOOL)loggedOpenFail
{
  return self->_loggedOpenFail;
}

- (void)setLoggedOpenFail:(BOOL)a3
{
  self->_loggedOpenFail = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_formatter, 0);
}

@end