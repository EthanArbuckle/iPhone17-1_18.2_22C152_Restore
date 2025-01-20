@interface PurchaseEntity
+ (id)databaseTable;
@end

@implementation PurchaseEntity

+ (id)databaseTable
{
  return @"purchase";
}

@end