@interface CLDurianPlatform
+ (BOOL)isInternalInstall;
+ (BOOL)isPhone;
+ (BOOL)isTinkerWatch;
+ (BOOL)isWatch;
+ (NSString)systemModel;
+ (NSString)systemVersion;
@end

@implementation CLDurianPlatform

+ (BOOL)isInternalInstall
{
  if (qword_102488F68 != -1) {
    dispatch_once(&qword_102488F68, &stru_102331AB0);
  }
  return byte_102488F60;
}

+ (BOOL)isPhone
{
  if (qword_102488F78 != -1) {
    dispatch_once(&qword_102488F78, &stru_102331AD0);
  }
  return byte_102488F70;
}

+ (BOOL)isWatch
{
  return 0;
}

+ (BOOL)isTinkerWatch
{
  return 0;
}

+ (NSString)systemVersion
{
  if (qword_102488F88 != -1) {
    dispatch_once(&qword_102488F88, &stru_102331AF0);
  }
  return (NSString *)qword_102488F80;
}

+ (NSString)systemModel
{
  if (qword_102488F98 != -1) {
    dispatch_once(&qword_102488F98, &stru_102331B10);
  }
  return (NSString *)qword_102488F90;
}

@end