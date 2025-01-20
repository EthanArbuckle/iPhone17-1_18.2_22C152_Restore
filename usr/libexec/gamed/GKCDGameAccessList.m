@interface GKCDGameAccessList
+ (id)fetchRequest;
@end

@implementation GKCDGameAccessList

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"GKCDGameAccessList"];
}

@end