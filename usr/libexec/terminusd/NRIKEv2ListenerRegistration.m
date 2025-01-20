@interface NRIKEv2ListenerRegistration
- (id)description;
@end

@implementation NRIKEv2ListenerRegistration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingClient, 0);
  objc_storeStrong((id *)&self->_link, 0);
  objc_storeStrong((id *)&self->_localEndpoint, 0);

  objc_storeStrong((id *)&self->_interfaceName, 0);
}

- (id)description
{
  id v2 = [objc_alloc((Class)NSString) initWithFormat:@"%@/%@/%@", self->_localEndpoint, self->_interfaceName, self->_link];

  return v2;
}

@end