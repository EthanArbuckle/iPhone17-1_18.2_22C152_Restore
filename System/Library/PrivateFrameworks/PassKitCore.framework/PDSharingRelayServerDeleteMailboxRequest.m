@interface PDSharingRelayServerDeleteMailboxRequest
- (id)_urlRequest;
@end

@implementation PDSharingRelayServerDeleteMailboxRequest

- (id)_urlRequest
{
  v2 = [(PDSharingRelayServerRequest *)self _murlMailboxRequestWithAdditionalEndpointComponents:0];
  [v2 setHTTPMethod:@"DELETE"];
  return v2;
}

@end