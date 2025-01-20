@interface _PFLLog
+ (id)extension;
+ (id)framework;
+ (id)telemetry;
@end

@implementation _PFLLog

+ (id)framework
{
  if (qword_10003DCE8 != -1) {
    dispatch_once(&qword_10003DCE8, &stru_100030850);
  }
  v2 = off_10003DB78;
  return v2;
}

+ (id)telemetry
{
  if (qword_10003DCF0 != -1) {
    dispatch_once(&qword_10003DCF0, &stru_100030870);
  }
  v2 = (void *)qword_10003DCF8;
  return v2;
}

+ (id)extension
{
  if (qword_10003DD00 != -1) {
    dispatch_once(&qword_10003DD00, &stru_100030890);
  }
  v2 = off_10003DB80;
  return v2;
}

@end