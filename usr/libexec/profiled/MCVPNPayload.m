@interface MCVPNPayload
- (id)handlerWithProfileHandler:(id)a3;
@end

@implementation MCVPNPayload

- (id)handlerWithProfileHandler:(id)a3
{
  id v4 = a3;
  v5 = [(MCVPNPayloadHandlerBase *)[MCNewVPNPayloadHandler alloc] initWithPayload:self profileHandler:v4];

  return v5;
}

@end