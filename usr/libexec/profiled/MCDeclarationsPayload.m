@interface MCDeclarationsPayload
- (id)handlerWithProfileHandler:(id)a3;
@end

@implementation MCDeclarationsPayload

- (id)handlerWithProfileHandler:(id)a3
{
  id v4 = a3;
  v5 = [(MCNewPayloadHandler *)[MCDeclarationsPayloadHandler alloc] initWithPayload:self profileHandler:v4];

  return v5;
}

@end