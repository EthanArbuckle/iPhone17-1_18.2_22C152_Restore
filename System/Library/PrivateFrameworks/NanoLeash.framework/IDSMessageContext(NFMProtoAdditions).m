@interface IDSMessageContext(NFMProtoAdditions)
- (id)nfmDescription;
@end

@implementation IDSMessageContext(NFMProtoAdditions)

- (id)nfmDescription
{
  v2 = NSString;
  v3 = [a1 description];
  v4 = [a1 outgoingResponseIdentifier];
  v5 = [a1 incomingResponseIdentifier];
  v6 = [v2 stringWithFormat:@"(%@ outgoingResponseIdentifier %@ incomingResponseIdentifier %@ expectsPeerResponse %d)", v3, v4, v5, objc_msgSend(a1, "expectsPeerResponse")];

  return v6;
}

@end