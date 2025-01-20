@interface ReceivedInvitation
+ (NSString)dateInvitationCreatedKeyPath;
+ (id)fetchRequest;
+ (id)predicateForSenderHandle:(id)a3;
+ (id)predicateForSenderHandleString:(id)a3;
+ (id)predicateForStatusTypeIdentifier:(id)a3;
+ (id)senderHandleKeyPath;
+ (id)sortDescriptorForDateInvitationCreatedOrderedAscending:(BOOL)a3;
+ (id)sortDescriptorForSenderHandleOrderedAscending:(BOOL)a3;
+ (id)statusTypeIdentifierKeyPath;
@end

@implementation ReceivedInvitation

+ (NSString)dateInvitationCreatedKeyPath
{
  return (NSString *)@"dateInvitationCreated";
}

+ (id)senderHandleKeyPath
{
  return @"senderHandle";
}

+ (id)statusTypeIdentifierKeyPath
{
  return @"statusTypeIdentifier";
}

+ (id)predicateForSenderHandle:(id)a3
{
  v4 = [a3 normalizedHandleString];
  v5 = [a1 predicateForSenderHandleString:v4];

  return v5;
}

+ (id)predicateForSenderHandleString:(id)a3
{
  v3 = (void *)MEMORY[0x263F08A98];
  id v4 = a3;
  v5 = +[ReceivedInvitation senderHandleKeyPath];
  v6 = [v3 predicateWithFormat:@"%K == %@", v5, v4];

  return v6;
}

+ (id)predicateForStatusTypeIdentifier:(id)a3
{
  v3 = (void *)MEMORY[0x263F08A98];
  id v4 = a3;
  v5 = +[ReceivedInvitation statusTypeIdentifierKeyPath];
  v6 = [v3 predicateWithFormat:@"%K == %@", v5, v4];

  return v6;
}

+ (id)sortDescriptorForDateInvitationCreatedOrderedAscending:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (void *)MEMORY[0x263F08B30];
  v5 = +[ReceivedInvitation dateInvitationCreatedKeyPath];
  v6 = [v4 sortDescriptorWithKey:v5 ascending:v3];

  return v6;
}

+ (id)sortDescriptorForSenderHandleOrderedAscending:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (void *)MEMORY[0x263F08B30];
  v5 = +[ReceivedInvitation senderHandleKeyPath];
  v6 = [v4 sortDescriptorWithKey:v5 ascending:v3];

  return v6;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"ReceivedInvitation"];
}

@end