@interface MCLDAPAccountPayload
- (id)handlerWithProfileHandler:(id)a3;
@end

@implementation MCLDAPAccountPayload

- (id)handlerWithProfileHandler:(id)a3
{
  id v4 = a3;
  v5 = [(MCNewPayloadHandler *)[MCNewLDAPAccountPayloadHandler alloc] initWithPayload:self profileHandler:v4];

  return v5;
}

@end