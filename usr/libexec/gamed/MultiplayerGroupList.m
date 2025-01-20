@interface MultiplayerGroupList
+ (id)fetchRequest;
@end

@implementation MultiplayerGroupList

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"MultiplayerGroupList"];
}

@end