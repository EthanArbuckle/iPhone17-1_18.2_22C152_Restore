@interface IDSDestination
+ (IDSDestination)destinationWithTUConversationMember:(id)a3;
+ (IDSDestination)destinationWithTUConversationParticipant:(id)a3;
- (BOOL)canReceiveMessagesForCallProvider:(id)a3;
- (BOOL)canReceiveRelayedCalls;
- (id)deviceForService:(id)a3;
@end

@implementation IDSDestination

+ (IDSDestination)destinationWithTUConversationMember:(id)a3
{
  id v4 = a3;
  v5 = [v4 idsDestination];
  id v6 = [v4 isLightweightMember];

  v7 = [a1 destinationWithStringURI:v5 isLightWeight:v6];

  return (IDSDestination *)v7;
}

+ (IDSDestination)destinationWithTUConversationParticipant:(id)a3
{
  id v4 = a3;
  if ([v4 audioVideoMode]) {
    uint64_t v5 = (uint64_t)[v4 isLightweight];
  }
  else {
    uint64_t v5 = 1;
  }
  id v6 = [v4 handle];
  v7 = [v6 value];
  v8 = [v7 IDSFormattedDestinationID];
  v9 = [a1 destinationWithStringURI:v8 isLightWeight:v5];

  return (IDSDestination *)v9;
}

- (BOOL)canReceiveRelayedCalls
{
  v2 = self;
  unsigned __int8 v3 = sub_1002CBCC8();

  return v3 & 1;
}

- (BOOL)canReceiveMessagesForCallProvider:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  LOBYTE(self) = sub_1002CBCEC();

  return self & 1;
}

- (id)deviceForService:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_1002CBD5C(v4);

  return v6;
}

@end