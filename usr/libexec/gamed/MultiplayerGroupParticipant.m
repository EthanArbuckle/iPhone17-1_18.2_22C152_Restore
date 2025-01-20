@interface MultiplayerGroupParticipant
+ (id)fetchRequest;
@end

@implementation MultiplayerGroupParticipant

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"MultiplayerGroupParticipant"];
}

@end