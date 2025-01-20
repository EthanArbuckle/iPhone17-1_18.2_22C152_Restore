@interface MultiplayerGroup
+ (id)fetchRequest;
@end

@implementation MultiplayerGroup

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"MultiplayerGroup"];
}

@end