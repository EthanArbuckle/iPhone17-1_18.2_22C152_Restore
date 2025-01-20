@interface DMDSecureUnarchiveFromEventSubscriptionRegistrationDataTransformer
+ (id)allowedTopLevelClasses;
+ (void)initialize;
@end

@implementation DMDSecureUnarchiveFromEventSubscriptionRegistrationDataTransformer

+ (void)initialize
{
  if (qword_1000FBAF0 != -1) {
    dispatch_once(&qword_1000FBAF0, &stru_1000CB078);
  }
}

+ (id)allowedTopLevelClasses
{
  if (qword_1000FBB00 != -1) {
    dispatch_once(&qword_1000FBB00, &stru_1000CB098);
  }
  v2 = (void *)qword_1000FBAF8;

  return v2;
}

@end