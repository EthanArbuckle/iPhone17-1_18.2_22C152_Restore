@interface GamesPlayed
+ (id)fetchRequest;
@end

@implementation GamesPlayed

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"GamesPlayed"];
}

@end