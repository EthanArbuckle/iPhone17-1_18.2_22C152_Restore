@interface PendingPublishRequest
+ (NSString)dateCreatedKeyPath;
+ (NSString)statusTypeIdentifierKeyPath;
+ (NSString)statusUniqueIdentifierKeyPath;
+ (id)fetchRequest;
+ (id)predicateForStatusTypeIdentifier:(id)a3;
+ (id)predicateForStatusUniqueIdentifier:(id)a3;
+ (id)sortDescriptorForDateCreatedAscending:(BOOL)a3;
@end

@implementation PendingPublishRequest

+ (NSString)statusTypeIdentifierKeyPath
{
  return (NSString *)@"statusTypeIdentifier";
}

+ (NSString)dateCreatedKeyPath
{
  return (NSString *)@"dateCreated";
}

+ (NSString)statusUniqueIdentifierKeyPath
{
  return (NSString *)@"statusUniqueIdentifier";
}

+ (id)predicateForStatusTypeIdentifier:(id)a3
{
  v3 = (void *)MEMORY[0x263F08A98];
  id v4 = a3;
  v5 = +[PendingPublishRequest statusTypeIdentifierKeyPath];
  v6 = [v3 predicateWithFormat:@"%K == %@", v5, v4];

  return v6;
}

+ (id)predicateForStatusUniqueIdentifier:(id)a3
{
  v3 = (void *)MEMORY[0x263F08A98];
  id v4 = a3;
  v5 = +[PendingPublishRequest statusUniqueIdentifierKeyPath];
  v6 = [v3 predicateWithFormat:@"%K == %@", v5, v4];

  return v6;
}

+ (id)sortDescriptorForDateCreatedAscending:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (void *)MEMORY[0x263F08B30];
  v5 = +[PendingPublishRequest dateCreatedKeyPath];
  v6 = [v4 sortDescriptorWithKey:v5 ascending:v3];

  return v6;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"PendingPublishRequest"];
}

@end