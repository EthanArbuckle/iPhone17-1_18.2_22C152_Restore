@interface FriendPlayedGameEntry
+ (id)fetchRequest;
@end

@implementation FriendPlayedGameEntry

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"FriendPlayedGameEntry"];
}

@end