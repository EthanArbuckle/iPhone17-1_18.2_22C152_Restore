@interface RMCTestSuite
+ (id)registeredClasses;
@end

@implementation RMCTestSuite

+ (id)registeredClasses
{
  if (qword_100025390 != -1) {
    dispatch_once(&qword_100025390, &stru_10001C4E8);
  }
  v2 = (void *)qword_100025388;

  return v2;
}

@end