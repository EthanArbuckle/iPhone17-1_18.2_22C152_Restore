@interface IDSMessageContext
- (NSString)csd_pseudonym;
@end

@implementation IDSMessageContext

- (NSString)csd_pseudonym
{
  v2 = [(IDSMessageContext *)self toID];
  v3 = (void *)IDSCopyAddressDestinationForDestination();

  v4 = (void *)IDSCopyRawAddressForDestination();
  if ([v4 destinationIdIsPseudonym]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return (NSString *)v5;
}

@end