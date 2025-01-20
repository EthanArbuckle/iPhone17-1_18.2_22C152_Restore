@interface _GCAgentConnectionRegistration
- (_GCAgentConnectionRegistration)initWithUserIdentifier:(unsigned int)a3;
- (id)connectionInterruptedRegistration;
- (id)connectionInvalidationRegistration;
- (unsigned)userIdentifier;
- (void)invalidate;
- (void)setConnectionInterruptedRegistration:(id)a3;
- (void)setConnectionInvalidationRegistration:(id)a3;
@end

@implementation _GCAgentConnectionRegistration

- (_GCAgentConnectionRegistration)initWithUserIdentifier:(unsigned int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_GCAgentConnectionRegistration;
  result = [(_GCAgentConnectionRegistration *)&v5 init];
  if (result) {
    result->_userIdentifier = a3;
  }
  return result;
}

- (void)invalidate
{
  id connectionInterruptedRegistration = self->_connectionInterruptedRegistration;
  self->_id connectionInterruptedRegistration = 0;

  id connectionInvalidationRegistration = self->_connectionInvalidationRegistration;
  self->_id connectionInvalidationRegistration = 0;
}

- (unsigned)userIdentifier
{
  return self->_userIdentifier;
}

- (id)connectionInvalidationRegistration
{
  return self->_connectionInvalidationRegistration;
}

- (void)setConnectionInvalidationRegistration:(id)a3
{
}

- (id)connectionInterruptedRegistration
{
  return self->_connectionInterruptedRegistration;
}

- (void)setConnectionInterruptedRegistration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_connectionInterruptedRegistration, 0);

  objc_storeStrong(&self->_connectionInvalidationRegistration, 0);
}

@end