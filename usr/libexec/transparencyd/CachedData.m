@interface CachedData
+ (id)fetchRequest;
@end

@implementation CachedData

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"CachedData"];
}

@end