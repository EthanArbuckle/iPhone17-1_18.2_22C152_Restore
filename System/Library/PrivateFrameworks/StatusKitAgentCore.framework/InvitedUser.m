@interface InvitedUser
+ (NSString)invitedHandleKeyPath;
+ (NSString)senderHandleKeyPath;
+ (id)channelKeyPath;
+ (id)fetchRequest;
+ (id)predicateForChannel:(id)a3;
+ (id)predicateForInvitedHandle:(id)a3;
+ (id)predicateForSenderHandle:(id)a3;
@end

@implementation InvitedUser

+ (NSString)invitedHandleKeyPath
{
  return (NSString *)@"invitedHandle";
}

+ (NSString)senderHandleKeyPath
{
  return (NSString *)@"senderHandle";
}

+ (id)channelKeyPath
{
  return @"channel";
}

+ (id)predicateForInvitedHandle:(id)a3
{
  v3 = (void *)MEMORY[0x263F08A98];
  id v4 = a3;
  v5 = +[InvitedUser invitedHandleKeyPath];
  v6 = [v3 predicateWithFormat:@"%K == %@", v5, v4];

  return v6;
}

+ (id)predicateForSenderHandle:(id)a3
{
  v3 = (void *)MEMORY[0x263F08A98];
  id v4 = a3;
  v5 = +[InvitedUser senderHandleKeyPath];
  v6 = [v3 predicateWithFormat:@"%K == %@", v5, v4];

  return v6;
}

+ (id)predicateForChannel:(id)a3
{
  v3 = (void *)MEMORY[0x263F08A98];
  id v4 = a3;
  v5 = +[InvitedUser channelKeyPath];
  v6 = [v3 predicateWithFormat:@"%K == %@", v5, v4];

  return v6;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"InvitedUser"];
}

@end