@interface GKCDGameFriend
+ (id)fetchRequest;
@end

@implementation GKCDGameFriend

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"GKCDGameFriend"];
}

@end