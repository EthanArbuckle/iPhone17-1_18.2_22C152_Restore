@interface MCCalDAVAccountPayload
- (id)handlerWithProfileHandler:(id)a3;
@end

@implementation MCCalDAVAccountPayload

- (id)handlerWithProfileHandler:(id)a3
{
  id v4 = a3;
  v5 = [(MCNewPayloadHandler *)[MCNewCalDAVAccountPayloadHandler alloc] initWithPayload:self profileHandler:v4];

  return v5;
}

@end