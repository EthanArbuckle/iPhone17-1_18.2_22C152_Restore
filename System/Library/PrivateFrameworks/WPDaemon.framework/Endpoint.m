@interface Endpoint
- (BOOL)requireEncyption;
- (NSUUID)clientUUID;
- (id)description;
- (unsigned)requireAck;
- (void)setClientUUID:(id)a3;
- (void)setRequireAck:(unsigned __int8)a3;
- (void)setRequireEncyption:(BOOL)a3;
@end

@implementation Endpoint

- (id)description
{
  return (id)[NSString stringWithFormat:@"Endpoint: ack? %d enc? %d client %@", self->_requireAck, self->_requireEncyption, self->_clientUUID];
}

- (unsigned)requireAck
{
  return self->_requireAck;
}

- (void)setRequireAck:(unsigned __int8)a3
{
  self->_requireAck = a3;
}

- (BOOL)requireEncyption
{
  return self->_requireEncyption;
}

- (void)setRequireEncyption:(BOOL)a3
{
  self->_requireEncyption = a3;
}

- (NSUUID)clientUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void)setClientUUID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end