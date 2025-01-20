@interface GKCDSuggestedFriends
+ (id)fetchRequest;
@end

@implementation GKCDSuggestedFriends

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"SuggestedFriends"];
}

@end