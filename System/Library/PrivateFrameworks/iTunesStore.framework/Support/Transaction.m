@interface Transaction
+ (Class)databaseEntityClass;
@end

@implementation Transaction

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class();
}

@end