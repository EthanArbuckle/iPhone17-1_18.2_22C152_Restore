@interface _PFLLog
+ (id)extension;
+ (id)framework;
+ (id)telemetry;
@end

@implementation _PFLLog

+ (id)framework
{
  if (qword_10003DCC0 != -1) {
    dispatch_once(&qword_10003DCC0, &stru_1000307A8);
  }
  v2 = off_10003DB10;
  return v2;
}

+ (id)telemetry
{
  if (qword_10003DCC8 != -1) {
    dispatch_once(&qword_10003DCC8, &stru_1000307C8);
  }
  v2 = (void *)qword_10003DCD0;
  return v2;
}

+ (id)extension
{
  if (qword_10003DCD8 != -1) {
    dispatch_once(&qword_10003DCD8, &stru_1000307E8);
  }
  v2 = off_10003DB18;
  return v2;
}

@end