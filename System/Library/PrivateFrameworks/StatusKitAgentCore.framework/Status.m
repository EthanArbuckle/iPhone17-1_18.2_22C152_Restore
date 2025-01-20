@interface Status
+ (NSString)channelIdentifierKeyPath;
+ (NSString)dateCreatedKeyPath;
+ (NSString)datePublishedKeyPath;
+ (NSString)uniqueIdentifierKeyPath;
+ (id)fetchRequest;
+ (id)predicateForChannelIdentifier:(id)a3;
+ (id)predicateForStatusUniqueIdentifier:(id)a3;
+ (id)sortDescriptorForDateCreatedAscending:(BOOL)a3;
+ (id)sortDescriptorForDatePublishedAscending:(BOOL)a3;
@end

@implementation Status

+ (NSString)channelIdentifierKeyPath
{
  return (NSString *)@"channelIdentifier";
}

+ (NSString)datePublishedKeyPath
{
  return (NSString *)@"datePublished";
}

+ (NSString)dateCreatedKeyPath
{
  return (NSString *)@"dateCreated";
}

+ (NSString)uniqueIdentifierKeyPath
{
  return (NSString *)@"uniqueIdentifier";
}

+ (id)predicateForChannelIdentifier:(id)a3
{
  v3 = (void *)MEMORY[0x263F08A98];
  id v4 = a3;
  v5 = +[Status channelIdentifierKeyPath];
  v6 = [v3 predicateWithFormat:@"%K == %@", v5, v4];

  return v6;
}

+ (id)predicateForStatusUniqueIdentifier:(id)a3
{
  v3 = (void *)MEMORY[0x263F08A98];
  id v4 = a3;
  v5 = +[Status uniqueIdentifierKeyPath];
  v6 = [v3 predicateWithFormat:@"%K == %@", v5, v4];

  return v6;
}

+ (id)sortDescriptorForDatePublishedAscending:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (void *)MEMORY[0x263F08B30];
  v5 = +[Status datePublishedKeyPath];
  v6 = [v4 sortDescriptorWithKey:v5 ascending:v3];

  return v6;
}

+ (id)sortDescriptorForDateCreatedAscending:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (void *)MEMORY[0x263F08B30];
  v5 = +[Status dateCreatedKeyPath];
  v6 = [v4 sortDescriptorWithKey:v5 ascending:v3];

  return v6;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"Status"];
}

@end