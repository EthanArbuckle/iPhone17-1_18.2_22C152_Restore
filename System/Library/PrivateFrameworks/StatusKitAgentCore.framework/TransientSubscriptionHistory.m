@interface TransientSubscriptionHistory
+ (NSString)channelIdentifierKeyPath;
+ (NSString)lastSubscriptionDateKeyPath;
+ (id)fetchRequest;
+ (id)predicateForChannelIdentifier:(id)a3;
+ (id)predicateForLastSubscriptionDate:(id)a3;
+ (id)sortDescriptorForLastSubscriptionDateAscending:(BOOL)a3;
@end

@implementation TransientSubscriptionHistory

+ (NSString)lastSubscriptionDateKeyPath
{
  return (NSString *)@"lastSubscriptionDate";
}

+ (NSString)channelIdentifierKeyPath
{
  return (NSString *)@"channelIdentifier";
}

+ (id)predicateForLastSubscriptionDate:(id)a3
{
  v3 = (void *)MEMORY[0x263F08A98];
  id v4 = a3;
  v5 = +[TransientSubscriptionHistory lastSubscriptionDateKeyPath];
  v6 = [v3 predicateWithFormat:@"%K == %@", v5, v4];

  return v6;
}

+ (id)predicateForChannelIdentifier:(id)a3
{
  v3 = (void *)MEMORY[0x263F08A98];
  id v4 = a3;
  v5 = +[TransientSubscriptionHistory channelIdentifierKeyPath];
  v6 = [v3 predicateWithFormat:@"%K == %@", v5, v4];

  return v6;
}

+ (id)sortDescriptorForLastSubscriptionDateAscending:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (void *)MEMORY[0x263F08B30];
  v5 = +[TransientSubscriptionHistory lastSubscriptionDateKeyPath];
  v6 = [v4 sortDescriptorWithKey:v5 ascending:v3];

  return v6;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"TransientSubscriptionHistory"];
}

@end