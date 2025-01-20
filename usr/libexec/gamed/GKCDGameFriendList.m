@interface GKCDGameFriendList
+ (id)fetchRequest;
@end

@implementation GKCDGameFriendList

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"GKCDGameFriendList"];
}

@end