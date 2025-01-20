@interface GKCDLoadedGame
+ (id)fetchRequest;
@end

@implementation GKCDLoadedGame

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"GKCDLoadedGame"];
}

@end