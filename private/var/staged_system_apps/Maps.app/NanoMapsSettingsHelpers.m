@interface NanoMapsSettingsHelpers
+ (NSUserDefaults)companionUserDefaults;
+ (NSUserDefaults)nanoMapsUserDefaults;
@end

@implementation NanoMapsSettingsHelpers

+ (NSUserDefaults)nanoMapsUserDefaults
{
  if (qword_10160FE38 != -1) {
    dispatch_once(&qword_10160FE38, &stru_1012FF918);
  }
  v2 = (void *)qword_10160FE30;

  return (NSUserDefaults *)v2;
}

+ (NSUserDefaults)companionUserDefaults
{
  if (qword_10160FE48 != -1) {
    dispatch_once(&qword_10160FE48, &stru_1012FF938);
  }
  v2 = (void *)qword_10160FE40;

  return (NSUserDefaults *)v2;
}

@end