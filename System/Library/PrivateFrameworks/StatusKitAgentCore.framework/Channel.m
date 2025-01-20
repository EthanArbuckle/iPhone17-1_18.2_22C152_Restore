@interface Channel
+ (NSString)channelTypeKeyPath;
+ (NSString)decomissionedKeyPath;
+ (NSString)encryptionKeysKeyPath;
+ (NSString)identifierKeyPath;
+ (NSString)personalKeyPath;
+ (NSString)presenceIdentifierKeyPath;
+ (NSString)statusTypeKeyPath;
+ (id)dateChannelCreatedKeyPath;
+ (id)fetchRequest;
+ (id)predicateForChannelIdentifier:(id)a3;
+ (id)predicateForChannelTypePresence;
+ (id)predicateForChannelTypeStatus;
+ (id)predicateForCreationDateNotNil;
+ (id)predicateForDecomissioned:(BOOL)a3;
+ (id)predicateForPersonal:(BOOL)a3;
+ (id)predicateForPresenceIdentifier:(id)a3;
+ (id)predicateForStatusTypeIdentifier:(id)a3;
+ (id)sortDescriptorForChannelIdentifierOrderedAscending:(BOOL)a3;
+ (id)sortDescriptorForCreationDateAscending:(BOOL)a3;
+ (id)sortDescriptorForPersonalOrderedAscending:(BOOL)a3;
+ (id)sortDescriptorForStatusTypeIdentifierOrderedAscending:(BOOL)a3;
@end

@implementation Channel

+ (NSString)identifierKeyPath
{
  return (NSString *)@"identifier";
}

+ (NSString)personalKeyPath
{
  return (NSString *)@"personal";
}

+ (NSString)decomissionedKeyPath
{
  return (NSString *)@"decomissioned";
}

+ (NSString)statusTypeKeyPath
{
  return (NSString *)@"statusType";
}

+ (NSString)encryptionKeysKeyPath
{
  return (NSString *)@"encryptionKeys";
}

+ (id)dateChannelCreatedKeyPath
{
  return @"dateChannelCreated";
}

+ (NSString)presenceIdentifierKeyPath
{
  return (NSString *)@"presenceIdentifier";
}

+ (NSString)channelTypeKeyPath
{
  return (NSString *)@"channelType";
}

+ (id)predicateForStatusTypeIdentifier:(id)a3
{
  v3 = (void *)MEMORY[0x263F08A98];
  id v4 = a3;
  v5 = +[Channel statusTypeKeyPath];
  v6 = [v3 predicateWithFormat:@"%K == %@", v5, v4];

  return v6;
}

+ (id)predicateForPersonal:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (void *)MEMORY[0x263F08A98];
  v5 = +[Channel personalKeyPath];
  v6 = [NSNumber numberWithBool:v3];
  v7 = [v4 predicateWithFormat:@"%K == %@", v5, v6];

  return v7;
}

+ (id)predicateForDecomissioned:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (void *)MEMORY[0x263F08A98];
  v5 = +[Channel decomissionedKeyPath];
  v6 = [NSNumber numberWithBool:v3];
  v7 = [v4 predicateWithFormat:@"%K == %@", v5, v6];

  return v7;
}

+ (id)predicateForChannelTypeStatus
{
  v2 = (void *)MEMORY[0x263F08A98];
  BOOL v3 = +[Channel channelTypeKeyPath];
  id v4 = [v2 predicateWithFormat:@"%K == %@", v3, &unk_26D7BA0D0];

  return v4;
}

+ (id)predicateForChannelTypePresence
{
  v2 = (void *)MEMORY[0x263F08A98];
  BOOL v3 = +[Channel channelTypeKeyPath];
  id v4 = [v2 predicateWithFormat:@"%K == %@", v3, &unk_26D7BA0E8];

  return v4;
}

+ (id)predicateForPresenceIdentifier:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x263F08A98];
  id v4 = a3;
  v5 = +[Channel presenceIdentifierKeyPath];
  v6 = [v3 predicateWithFormat:@"%K == %@", v5, v4];

  return v6;
}

+ (id)predicateForChannelIdentifier:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x263F08A98];
  id v4 = a3;
  v5 = +[Channel identifierKeyPath];
  v6 = [v3 predicateWithFormat:@"%K == %@", v5, v4];

  return v6;
}

+ (id)predicateForCreationDateNotNil
{
  v2 = (void *)MEMORY[0x263F08A98];
  BOOL v3 = +[Channel dateChannelCreatedKeyPath];
  id v4 = objc_msgSend(v2, "predicateWithFormat:", @"%K != nil", v3);

  return v4;
}

+ (id)sortDescriptorForStatusTypeIdentifierOrderedAscending:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (void *)MEMORY[0x263F08B30];
  v5 = +[Channel statusTypeKeyPath];
  v6 = [v4 sortDescriptorWithKey:v5 ascending:v3];

  return v6;
}

+ (id)sortDescriptorForPersonalOrderedAscending:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (void *)MEMORY[0x263F08B30];
  v5 = +[Channel personalKeyPath];
  v6 = [v4 sortDescriptorWithKey:v5 ascending:v3];

  return v6;
}

+ (id)sortDescriptorForChannelIdentifierOrderedAscending:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (void *)MEMORY[0x263F08B30];
  v5 = +[Channel identifierKeyPath];
  v6 = [v4 sortDescriptorWithKey:v5 ascending:v3];

  return v6;
}

+ (id)sortDescriptorForCreationDateAscending:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (void *)MEMORY[0x263F08B30];
  v5 = +[Channel dateChannelCreatedKeyPath];
  v6 = [v4 sortDescriptorWithKey:v5 ascending:v3];

  return v6;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"Channel"];
}

@end