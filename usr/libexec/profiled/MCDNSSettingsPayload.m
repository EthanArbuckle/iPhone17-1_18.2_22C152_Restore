@interface MCDNSSettingsPayload
- (id)handlerWithProfileHandler:(id)a3;
@end

@implementation MCDNSSettingsPayload

- (id)handlerWithProfileHandler:(id)a3
{
  id v4 = a3;
  v5 = [[MCDNSSettingsPayloadHandler alloc] initWithPayload:self profileHandler:v4];

  return v5;
}

@end