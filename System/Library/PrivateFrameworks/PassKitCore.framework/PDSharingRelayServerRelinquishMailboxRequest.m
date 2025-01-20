@interface PDSharingRelayServerRelinquishMailboxRequest
- (id)_urlRequest;
@end

@implementation PDSharingRelayServerRelinquishMailboxRequest

- (id)_urlRequest
{
  v2 = [(PDSharingRelayServerRequest *)self _murlMailboxRequestWithAdditionalEndpointComponents:0];
  [v2 setHTTPMethod:@"PATCH"];
  return v2;
}

@end