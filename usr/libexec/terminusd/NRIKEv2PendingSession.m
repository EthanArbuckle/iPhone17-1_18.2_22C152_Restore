@interface NRIKEv2PendingSession
- (id)description;
@end

@implementation NRIKEv2PendingSession

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseBlock, 0);
  objc_storeStrong(&self->_validateAuthBlock, 0);
  objc_storeStrong((id *)&self->_childConfig, 0);
  objc_storeStrong((id *)&self->_sessionConfig, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

- (id)description
{
  id v2 = [objc_alloc((Class)NSString) initWithFormat:@"%@", self->_session];

  return v2;
}

@end