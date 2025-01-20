@interface ChannelCheckpoint
+ (NSString)identifierKeyPath;
+ (id)fetchRequest;
+ (id)predicateForChannelIdentifier:(id)a3;
@end

@implementation ChannelCheckpoint

+ (NSString)identifierKeyPath
{
  return (NSString *)@"channelID";
}

+ (id)predicateForChannelIdentifier:(id)a3
{
  v3 = (void *)MEMORY[0x263F08A98];
  id v4 = a3;
  v5 = +[ChannelCheckpoint identifierKeyPath];
  v6 = [v3 predicateWithFormat:@"%K == %@", v5, v4];

  return v6;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"ChannelCheckpoint"];
}

@end