@interface PDSharingRelayServerPingMailboxRequest
- (id)_urlRequest;
@end

@implementation PDSharingRelayServerPingMailboxRequest

- (id)_urlRequest
{
  v2 = [(PDSharingRelayServerRequest *)self _murlMailboxRequestWithAdditionalEndpointComponents:0];
  [v2 setHTTPMethod:@"GET"];
  return v2;
}

@end