@interface MCDNSProxyPayload
- (id)handlerWithProfileHandler:(id)a3;
@end

@implementation MCDNSProxyPayload

- (id)handlerWithProfileHandler:(id)a3
{
  id v4 = a3;
  v5 = [[MCDNSProxyPayloadHandler alloc] initWithPayload:self profileHandler:v4];

  return v5;
}

@end