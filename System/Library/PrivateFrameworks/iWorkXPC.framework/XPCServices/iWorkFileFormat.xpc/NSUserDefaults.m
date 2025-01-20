@interface NSUserDefaults
+ (void)tsu_registerDefaults;
@end

@implementation NSUserDefaults

+ (void)tsu_registerDefaults
{
  if (qword_1001EB8C0 != -1) {
    dispatch_once(&qword_1001EB8C0, &stru_1001CBD98);
  }
}

@end