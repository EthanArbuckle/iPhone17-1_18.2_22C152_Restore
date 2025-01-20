@interface SSAppImageDatabaseCacheEntry
+ (id)databaseTable;
@end

@implementation SSAppImageDatabaseCacheEntry

+ (id)databaseTable
{
  return @"app_image_cache";
}

@end