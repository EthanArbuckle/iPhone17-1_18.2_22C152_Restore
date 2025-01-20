@interface PDSharingRelayServerGetMailboxRequest
- (id)_urlRequest;
@end

@implementation PDSharingRelayServerGetMailboxRequest

- (id)_urlRequest
{
  v2 = [(PDSharingRelayServerRequest *)self _murlMailboxRequestWithAdditionalEndpointComponents:0];
  [v2 setHTTPMethod:@"POST"];
  return v2;
}

@end