@interface CLFenceBinner
+ (id)binForAccuracy:(double)a3;
+ (id)binForAge:(double)a3;
+ (id)binForConvergingSessionCount:(int)a3;
+ (id)binForConvergingSessionDuration:(double)a3;
+ (id)binForConvergingUsageMetricCount:(int)a3;
+ (id)binForDistance:(double)a3;
+ (id)binForNumber:(id)a3 bins:(id)a4;
@end

@implementation CLFenceBinner

+ (id)binForNumber:(id)a3 bins:(id)a4
{
  if (a3 && a4)
  {
    id v6 = [a4 indexOfObject:a3 inSortedRange:0 options:1536 usingComparator:&stru_102325000];
    return +[NSNumber numberWithUnsignedInteger:v6];
  }
  else
  {
    if (qword_1024193C0 != -1) {
      dispatch_once(&qword_1024193C0, &stru_1023250E0);
    }
    v8 = qword_1024193C8;
    if (os_log_type_enabled((os_log_t)qword_1024193C8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v11 = a3;
      __int16 v12 = 2112;
      id v13 = a4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "#FenceMetrics Error creating bins for number %@, bins, %@, invalid input", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193C0 != -1) {
        dispatch_once(&qword_1024193C0, &stru_1023250E0);
      }
      v9 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "+[CLFenceBinner binForNumber:bins:]", "%s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
    return 0;
  }
}

+ (id)binForDistance:(double)a3
{
  if (qword_1024879B8 != -1) {
    dispatch_once(&qword_1024879B8, &stru_102325020);
  }
  v5 = +[NSNumber numberWithDouble:a3];
  uint64_t v6 = qword_1024879B0;

  return [a1 binForNumber:v5 bins:v6];
}

+ (id)binForAccuracy:(double)a3
{
  if (qword_1024879C8 != -1) {
    dispatch_once(&qword_1024879C8, &stru_102325040);
  }
  v5 = +[NSNumber numberWithDouble:a3];
  uint64_t v6 = qword_1024879C0;

  return [a1 binForNumber:v5 bins:v6];
}

+ (id)binForAge:(double)a3
{
  if (qword_1024879D8 != -1) {
    dispatch_once(&qword_1024879D8, &stru_102325060);
  }
  v5 = +[NSNumber numberWithDouble:a3];
  uint64_t v6 = qword_1024879D0;

  return [a1 binForNumber:v5 bins:v6];
}

+ (id)binForConvergingSessionDuration:(double)a3
{
  if (qword_1024879E8 != -1) {
    dispatch_once(&qword_1024879E8, &stru_102325080);
  }
  v5 = +[NSNumber numberWithDouble:a3];
  uint64_t v6 = qword_1024879E0;

  return [a1 binForNumber:v5 bins:v6];
}

+ (id)binForConvergingSessionCount:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (qword_1024879F8 != -1) {
    dispatch_once(&qword_1024879F8, &stru_1023250A0);
  }
  v5 = +[NSNumber numberWithInt:v3];
  uint64_t v6 = qword_1024879F0;

  return [a1 binForNumber:v5 bins:v6];
}

+ (id)binForConvergingUsageMetricCount:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (qword_102487A08 != -1) {
    dispatch_once(&qword_102487A08, &stru_1023250C0);
  }
  v5 = +[NSNumber numberWithInt:v3];
  uint64_t v6 = qword_102487A00;

  return [a1 binForNumber:v5 bins:v6];
}

@end