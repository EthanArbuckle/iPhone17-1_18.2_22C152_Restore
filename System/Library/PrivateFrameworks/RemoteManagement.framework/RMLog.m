@interface RMLog
+ (id)httpconduitstate;
+ (id)managementSettings;
+ (id)mdmconduitstate;
+ (id)predicateDescription;
+ (id)storeHelper;
@end

@implementation RMLog

+ (id)httpconduitstate
{
  if (qword_1000253A0 != -1) {
    dispatch_once(&qword_1000253A0, &stru_10001C590);
  }
  v2 = (void *)qword_100025398;

  return v2;
}

+ (id)managementSettings
{
  if (qword_1000253C0 != -1) {
    dispatch_once(&qword_1000253C0, &stru_10001C6C0);
  }
  v2 = (void *)qword_1000253B8;

  return v2;
}

+ (id)mdmconduitstate
{
  if (qword_1000253E0 != -1) {
    dispatch_once(&qword_1000253E0, &stru_10001C700);
  }
  v2 = (void *)qword_1000253D8;

  return v2;
}

+ (id)predicateDescription
{
  if (qword_1000253F0 != -1) {
    dispatch_once(&qword_1000253F0, &stru_10001C720);
  }
  v2 = (void *)qword_1000253E8;

  return v2;
}

+ (id)storeHelper
{
  if (qword_100025400 != -1) {
    dispatch_once(&qword_100025400, &stru_10001C788);
  }
  v2 = (void *)qword_1000253F8;

  return v2;
}

@end