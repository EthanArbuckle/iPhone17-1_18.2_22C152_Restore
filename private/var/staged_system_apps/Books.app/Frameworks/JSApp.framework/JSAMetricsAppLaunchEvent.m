@interface JSAMetricsAppLaunchEvent
+ (id)consumePendingLaunchEvent;
+ (void)createPendingLaunchEvent;
+ (void)markJSBootstrapEndTime;
+ (void)markJSBootstrapStartTime;
+ (void)markLaunchEndTime;
+ (void)updateRequiredBlockingBagLoad:(BOOL)a3;
+ (void)updateUsedBootstrapFallback:(BOOL)a3;
- (BOOL)requiredBlockingBagLoad;
- (BOOL)usedBootstrapFallback;
- (JSAMetricsAppLaunchEvent)init;
- (NSString)launchCorrelationKey;
- (double)jsBootstrapEndTime;
- (double)jsBootstrapStartTime;
- (double)launchEndTime;
- (double)processStartTime;
- (id)metricsDictionary;
- (void)setJsBootstrapEndTime:(double)a3;
- (void)setJsBootstrapStartTime:(double)a3;
- (void)setLaunchCorrelationKey:(id)a3;
- (void)setLaunchEndTime:(double)a3;
- (void)setProcessStartTime:(double)a3;
- (void)setRequiredBlockingBagLoad:(BOOL)a3;
- (void)setUsedBootstrapFallback:(BOOL)a3;
@end

@implementation JSAMetricsAppLaunchEvent

- (JSAMetricsAppLaunchEvent)init
{
  v7.receiver = self;
  v7.super_class = (Class)JSAMetricsAppLaunchEvent;
  v2 = [(JSAMetricsAppLaunchEvent *)&v7 init];
  if (v2)
  {
    v3 = +[NSUUID UUID];
    uint64_t v4 = [v3 UUIDString];
    launchCorrelationKey = v2->_launchCorrelationKey;
    v2->_launchCorrelationKey = (NSString *)v4;
  }
  return v2;
}

+ (void)createPendingLaunchEvent
{
  if ((byte_CE2D8 & 1) == 0 && !qword_CE2D0)
  {
    qword_CE2D0 = (uint64_t)objc_alloc_init((Class)a1);
    _objc_release_x1();
  }
}

+ (id)consumePendingLaunchEvent
{
  id v2 = (id)qword_CE2D0;
  byte_CE2D8 = 1;
  v3 = (void *)qword_CE2D0;
  qword_CE2D0 = 0;

  return v2;
}

+ (void)markJSBootstrapStartTime
{
  double v2 = sub_A180();
  v3 = (void *)qword_CE2D0;

  _[v3 setJsBootstrapStartTime:v2];
}

+ (void)markJSBootstrapEndTime
{
  double v2 = sub_A180();
  v3 = (void *)qword_CE2D0;

  _[v3 setJsBootstrapEndTime:v2];
}

+ (void)markLaunchEndTime
{
  double v2 = sub_A180();
  v3 = (void *)qword_CE2D0;

  _[v3 setLaunchEndTime:v2];
}

+ (void)updateRequiredBlockingBagLoad:(BOOL)a3
{
}

+ (void)updateUsedBootstrapFallback:(BOOL)a3
{
}

- (id)metricsDictionary
{
  if (qword_CE2E8 != -1) {
    dispatch_once(&qword_CE2E8, &stru_B24F0);
  }
  v13[0] = @"launchCorrelationKey";
  v3 = [(JSAMetricsAppLaunchEvent *)self launchCorrelationKey];
  v14[0] = v3;
  v14[1] = &__kCFBooleanTrue;
  v13[1] = @"isAppLaunch";
  v13[2] = @"jsBootstrapStartTime";
  [(JSAMetricsAppLaunchEvent *)self jsBootstrapStartTime];
  uint64_t v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v14[2] = v4;
  v13[3] = @"jsBootstrapEndTime";
  [(JSAMetricsAppLaunchEvent *)self jsBootstrapEndTime];
  v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v14[3] = v5;
  v13[4] = @"launchEndTime";
  [(JSAMetricsAppLaunchEvent *)self launchEndTime];
  v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v14[4] = v6;
  v13[5] = @"processStartTime";
  objc_super v7 = +[NSNumber numberWithDouble:*(double *)&qword_CE2E0];
  v14[5] = v7;
  v13[6] = @"requiredBlockingBagLoad";
  v8 = +[NSNumber numberWithBool:[(JSAMetricsAppLaunchEvent *)self requiredBlockingBagLoad]];
  v14[6] = v8;
  v13[7] = @"usedBootstrapFallback";
  v9 = +[NSNumber numberWithBool:[(JSAMetricsAppLaunchEvent *)self usedBootstrapFallback]];
  v14[7] = v9;
  v10 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:8];

  v11 = JSALog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_8488C((uint64_t)v10, v11);
  }

  return v10;
}

- (double)jsBootstrapStartTime
{
  return self->_jsBootstrapStartTime;
}

- (void)setJsBootstrapStartTime:(double)a3
{
  self->_jsBootstrapStartTime = a3;
}

- (double)jsBootstrapEndTime
{
  return self->_jsBootstrapEndTime;
}

- (void)setJsBootstrapEndTime:(double)a3
{
  self->_jsBootstrapEndTime = a3;
}

- (NSString)launchCorrelationKey
{
  return self->_launchCorrelationKey;
}

- (void)setLaunchCorrelationKey:(id)a3
{
}

- (double)launchEndTime
{
  return self->_launchEndTime;
}

- (void)setLaunchEndTime:(double)a3
{
  self->_launchEndTime = a3;
}

- (double)processStartTime
{
  return self->_processStartTime;
}

- (void)setProcessStartTime:(double)a3
{
  self->_processStartTime = a3;
}

- (BOOL)requiredBlockingBagLoad
{
  return self->_requiredBlockingBagLoad;
}

- (void)setRequiredBlockingBagLoad:(BOOL)a3
{
  self->_requiredBlockingBagLoad = a3;
}

- (BOOL)usedBootstrapFallback
{
  return self->_usedBootstrapFallback;
}

- (void)setUsedBootstrapFallback:(BOOL)a3
{
  self->_usedBootstrapFallback = a3;
}

- (void).cxx_destruct
{
}

@end