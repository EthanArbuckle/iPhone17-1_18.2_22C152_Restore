@interface FriendPlayedEntry
+ (id)fetchRequest;
@end

@implementation FriendPlayedEntry

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"FriendPlayedEntry"];
}

@end