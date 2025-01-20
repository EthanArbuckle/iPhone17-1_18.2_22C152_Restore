@interface PurchaseManagerEntity
+ (id)databaseTable;
@end

@implementation PurchaseManagerEntity

+ (id)databaseTable
{
  return @"purchase_manager";
}

@end