@interface TSULogHelper
+ (id)sharedInstance;
- (BOOL)incrementThrottleCountAndCheckThottleMax:(unint64_t)a3;
- (NSDate)lastThrottleCheck;
- (unint64_t)throttleCount;
- (void)setLastThrottleCheck:(id)a3;
- (void)setThrottleCount:(unint64_t)a3;
@end

@implementation TSULogHelper

+ (id)sharedInstance
{
  if (qword_1001EB960 != -1) {
    dispatch_once(&qword_1001EB960, &stru_1001CD988);
  }
  v2 = (void *)qword_1001EB958;
  return v2;
}

- (BOOL)incrementThrottleCountAndCheckThottleMax:(unint64_t)a3
{
  unint64_t v5 = [(TSULogHelper *)self throttleCount];
  [(TSULogHelper *)self setThrottleCount:(char *)[(TSULogHelper *)self throttleCount] + 1];
  v6 = [(TSULogHelper *)self lastThrottleCheck];
  if (v5 == a3)
  {
    if (TSUPerformanceCat_init_token != -1) {
      dispatch_once(&TSUPerformanceCat_init_token, &stru_1001CD9A8);
    }
    v7 = TSUPerformanceCat_log_t;
    if (os_log_type_enabled((os_log_t)TSUPerformanceCat_log_t, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Start throttling logging", buf, 2u);
    }
  }
  if (v5 < a3 || !v6) {
    goto LABEL_16;
  }
  [v6 timeIntervalSinceNow];
  double v9 = v8;
  [v6 timeIntervalSinceNow];
  if (v10 < -300.0)
  {
    if (TSUPerformanceCat_init_token != -1) {
      dispatch_once(&TSUPerformanceCat_init_token, &stru_1001CD9C8);
    }
    v11 = TSUPerformanceCat_log_t;
    if (os_log_type_enabled((os_log_t)TSUPerformanceCat_log_t, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "End throttling logging", v15, 2u);
    }
    [(TSULogHelper *)self setThrottleCount:0];
  }
  if (v9 >= -60.0)
  {
    BOOL v12 = 1;
  }
  else
  {
LABEL_16:
    v13 = +[NSDate date];
    [(TSULogHelper *)self setLastThrottleCheck:v13];

    BOOL v12 = 0;
  }

  return v12;
}

- (unint64_t)throttleCount
{
  return self->_throttleCount;
}

- (void)setThrottleCount:(unint64_t)a3
{
  self->_throttleCount = a3;
}

- (NSDate)lastThrottleCheck
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLastThrottleCheck:(id)a3
{
}

- (void).cxx_destruct
{
}

@end