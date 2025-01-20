@interface RMLog
+ (id)watchEnrollmentAdapter;
@end

@implementation RMLog

+ (id)watchEnrollmentAdapter
{
  if (qword_100008B20 != -1) {
    dispatch_once(&qword_100008B20, &stru_100004198);
  }
  v2 = (void *)qword_100008B18;

  return v2;
}

@end