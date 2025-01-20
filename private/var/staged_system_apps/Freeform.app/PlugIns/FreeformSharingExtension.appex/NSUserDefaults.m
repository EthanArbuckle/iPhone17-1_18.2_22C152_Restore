@interface NSUserDefaults
+ (void)crl_registerDefaults;
@end

@implementation NSUserDefaults

+ (void)crl_registerDefaults
{
  if (qword_10007DBD0 != -1) {
    dispatch_once(&qword_10007DBD0, &stru_100071DB8);
  }
}

@end