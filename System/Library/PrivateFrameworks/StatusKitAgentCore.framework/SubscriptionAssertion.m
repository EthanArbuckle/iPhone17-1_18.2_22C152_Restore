@interface SubscriptionAssertion
+ (NSString)applicationIdentifierKeyPath;
+ (NSString)channelIdentifierKeyPath;
+ (NSString)statusTypeIdentifierKeyPath;
+ (id)fetchRequest;
+ (id)predicateForApplicationIdentifier:(id)a3;
+ (id)predicateForChannelIdentifier:(id)a3;
+ (id)predicateForStatusTypeIdentifier:(id)a3;
@end

@implementation SubscriptionAssertion

+ (NSString)applicationIdentifierKeyPath
{
  return (NSString *)@"applicationIdentifier";
}

+ (NSString)channelIdentifierKeyPath
{
  return (NSString *)@"channelIdentifier";
}

+ (NSString)statusTypeIdentifierKeyPath
{
  return (NSString *)@"statusTypeIdentifier";
}

+ (id)predicateForApplicationIdentifier:(id)a3
{
  v3 = (void *)MEMORY[0x263F08A98];
  id v4 = a3;
  v5 = +[SubscriptionAssertion applicationIdentifierKeyPath];
  v6 = [v3 predicateWithFormat:@"%K == %@", v5, v4];

  return v6;
}

+ (id)predicateForChannelIdentifier:(id)a3
{
  v3 = (void *)MEMORY[0x263F08A98];
  id v4 = a3;
  v5 = +[SubscriptionAssertion channelIdentifierKeyPath];
  v6 = [v3 predicateWithFormat:@"%K == %@", v5, v4];

  return v6;
}

+ (id)predicateForStatusTypeIdentifier:(id)a3
{
  v3 = (void *)MEMORY[0x263F08A98];
  id v4 = a3;
  v5 = +[SubscriptionAssertion statusTypeIdentifierKeyPath];
  v6 = [v3 predicateWithFormat:@"%K == %@", v5, v4];

  return v6;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"SubscriptionAssertion"];
}

@end