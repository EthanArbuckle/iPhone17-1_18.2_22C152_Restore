@interface TSgPTPManagerTest
+ (BOOL)mangled;
@end

@implementation TSgPTPManagerTest

+ (BOOL)mangled
{
  v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  return [v2 isSubclassOfClass:v3];
}

@end