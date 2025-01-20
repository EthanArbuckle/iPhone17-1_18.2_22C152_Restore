@interface NSUserDefaults
+ (void)crl_registerDefaults;
@end

@implementation NSUserDefaults

+ (void)crl_registerDefaults
{
  if (qword_100095B40[0] != -1) {
    dispatch_once(qword_100095B40, &stru_100082170);
  }
}

@end