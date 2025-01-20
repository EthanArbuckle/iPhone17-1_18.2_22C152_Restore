@interface CRLLogHelper
+ (id)sharedInstance;
- (BOOL)incrementThrottleCountAndCheckThottleMax:(unint64_t)a3;
- (NSDate)lastThrottleCheck;
- (unint64_t)throttleCount;
- (void)setLastThrottleCheck:(id)a3;
- (void)setThrottleCount:(unint64_t)a3;
@end

@implementation CRLLogHelper

+ (id)sharedInstance
{
  if (qword_100095AA8 != -1) {
    dispatch_once(&qword_100095AA8, &stru_100081E20);
  }
  v2 = (void *)qword_100095AA0;

  return v2;
}

- (BOOL)incrementThrottleCountAndCheckThottleMax:(unint64_t)a3
{
  unint64_t v5 = [(CRLLogHelper *)self throttleCount];
  [(CRLLogHelper *)self setThrottleCount:(char *)[(CRLLogHelper *)self throttleCount] + 1];
  v6 = [(CRLLogHelper *)self lastThrottleCheck];
  if (v5 == a3)
  {
    if (CRLPerformanceCat_init_token != -1) {
      dispatch_once(&CRLPerformanceCat_init_token, &stru_100081E40);
    }
    v7 = CRLPerformanceCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLPerformanceCat_log_t, OS_LOG_TYPE_DEFAULT))
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
    if (CRLPerformanceCat_init_token != -1) {
      dispatch_once(&CRLPerformanceCat_init_token, &stru_100081E60);
    }
    v11 = CRLPerformanceCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLPerformanceCat_log_t, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "End throttling logging", v15, 2u);
    }
    [(CRLLogHelper *)self setThrottleCount:0];
  }
  if (v9 >= -60.0)
  {
    BOOL v12 = 1;
  }
  else
  {
LABEL_16:
    v13 = +[NSDate date];
    [(CRLLogHelper *)self setLastThrottleCheck:v13];

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