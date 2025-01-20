@interface PurchaseManager
+ (Class)databaseEntityClass;
@end

@implementation PurchaseManager

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class();
}

@end