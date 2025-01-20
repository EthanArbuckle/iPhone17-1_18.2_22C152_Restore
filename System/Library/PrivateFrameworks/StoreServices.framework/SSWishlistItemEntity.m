@interface SSWishlistItemEntity
+ (id)databaseTable;
@end

@implementation SSWishlistItemEntity

+ (id)databaseTable
{
  return @"item";
}

@end