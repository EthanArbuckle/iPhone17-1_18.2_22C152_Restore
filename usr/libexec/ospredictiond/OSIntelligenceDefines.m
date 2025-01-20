@interface OSIntelligenceDefines
+ (id)chargingUserDefaults;
+ (id)inactivityUserDefaults;
@end

@implementation OSIntelligenceDefines

+ (id)inactivityUserDefaults
{
  if (qword_10007A8D0 != -1) {
    dispatch_once(&qword_10007A8D0, &stru_100065288);
  }
  v2 = (void *)qword_10007A8C8;

  return v2;
}

+ (id)chargingUserDefaults
{
  if (qword_10007A8E0 != -1) {
    dispatch_once(&qword_10007A8E0, &stru_1000652A8);
  }
  v2 = (void *)qword_10007A8D8;

  return v2;
}

@end