@interface MCDefaultsPayload
- (id)handlerWithProfileHandler:(id)a3;
@end

@implementation MCDefaultsPayload

- (id)handlerWithProfileHandler:(id)a3
{
  id v4 = a3;
  v5 = [[MCNewDefaultsPayloadHandler alloc] initWithPayload:self profileHandler:v4];

  return v5;
}

@end