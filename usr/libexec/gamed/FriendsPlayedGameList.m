@interface FriendsPlayedGameList
+ (id)fetchRequest;
@end

@implementation FriendsPlayedGameList

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"FriendsPlayedGameList"];
}

@end