@interface GKCDScopedIds
+ (id)fetchRequest;
@end

@implementation GKCDScopedIds

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"GKCDScopedIds"];
}

@end