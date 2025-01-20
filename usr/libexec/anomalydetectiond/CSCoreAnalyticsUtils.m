@interface CSCoreAnalyticsUtils
+ (BOOL)shouldAttemptCoreAnalyticsUploadWithInterval:(double)a3 persistentKey:(id)a4;
+ (double)getSecondsSinceReboot;
@end

@implementation CSCoreAnalyticsUtils

+ (double)getSecondsSinceReboot
{
  if (qword_1003DB750 != -1) {
    dispatch_once(&qword_1003DB750, &stru_1003A2A00);
  }
  v2 = qword_1003DB758;
  if (os_log_type_enabled((os_log_t)qword_1003DB758, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "getSecondsSinceReboot", buf, 2u);
  }
  uint64_t v3 = mach_continuous_time();
  mach_timebase_info(&info);
  uint64_t v4 = info.numer / info.denom;
  if (qword_1003DB750 != -1) {
    dispatch_once(&qword_1003DB750, &stru_1003A2A00);
  }
  unint64_t v5 = v3 * v4 / 0x3B9ACA00;
  v6 = qword_1003DB758;
  if (os_log_type_enabled((os_log_t)qword_1003DB758, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218496;
    uint64_t v10 = v3;
    __int16 v11 = 2048;
    uint64_t v12 = v4;
    __int16 v13 = 2048;
    double v14 = (double)v5 / 60.0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "UserInfo machTime - currentTicks:%llu, ticksToNanoseconds:%llu, minutesSinceReboot:%f", buf, 0x20u);
  }
  return (double)v5;
}

+ (BOOL)shouldAttemptCoreAnalyticsUploadWithInterval:(double)a3 persistentKey:(id)a4
{
  id v5 = a4;
  v6 = +[CSPersistentConfiguration sharedConfiguration];
  v7 = [v6 objectForKey:v5];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = +[NSDate date];
    [v10 timeIntervalSinceDate:v9];
    BOOL v12 = a3 > 0.0;
    if (v11 <= 0.0) {
      BOOL v12 = 0;
    }
    BOOL v13 = v11 < a3 * 0.9 && v12;
    if (v13)
    {
      if (qword_1003DB750 != -1) {
        dispatch_once(&qword_1003DB750, &stru_1003A2A00);
      }
      double v14 = qword_1003DB758;
      if (os_log_type_enabled((os_log_t)qword_1003DB758, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "CoreAnalytics upload ran recently, skipping now.", v17, 2u);
      }
    }
    char v15 = !v13;
  }
  else
  {
    char v15 = 1;
  }

  return v15;
}

@end