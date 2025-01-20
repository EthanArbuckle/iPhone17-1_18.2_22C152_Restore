@interface ASGeoCodeCacheEntry
+ (id)fetchRequest;
@end

@implementation ASGeoCodeCacheEntry

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"DB_GeoCodeCache"];
}

@end