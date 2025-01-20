@interface PKRemoteRegistrationRequest
+ (BOOL)supportsSecureCoding;
+ (id)remoteRegistrationRequestWithProtobuf:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRemoteRegistrationRequest:(id)a3;
- (BOOL)registerBroker;
- (BOOL)registerPeerPayment;
- (PKRemoteRegistrationRequest)initWithCoder:(id)a3;
- (id)description;
- (id)protobuf;
- (void)encodeWithCoder:(id)a3;
- (void)setRegisterBroker:(BOOL)a3;
- (void)setRegisterPeerPayment:(BOOL)a3;
@end

@implementation PKRemoteRegistrationRequest

+ (id)remoteRegistrationRequestWithProtobuf:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(PKRemoteRegistrationRequest);
  -[PKRemoteRegistrationRequest setRegisterBroker:](v4, "setRegisterBroker:", [v3 registerBroker]);
  uint64_t v5 = [v3 registerPeerPayment];

  [(PKRemoteRegistrationRequest *)v4 setRegisterPeerPayment:v5];
  return v4;
}

- (id)protobuf
{
  id v3 = objc_alloc_init(PKProtobufRemoteRegistrationRequest);
  [(PKProtobufRemoteRegistrationRequest *)v3 setRegisterBroker:[(PKRemoteRegistrationRequest *)self registerBroker]];
  [(PKProtobufRemoteRegistrationRequest *)v3 setRegisterPeerPayment:[(PKRemoteRegistrationRequest *)self registerPeerPayment]];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKRemoteRegistrationRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKRemoteRegistrationRequest;
  uint64_t v5 = [(PKRemoteRegistrationRequest *)&v7 init];
  if (v5)
  {
    v5->_registerBroker = [v4 decodeBoolForKey:@"registerBroker"];
    v5->_registerPeerPayment = [v4 decodeBoolForKey:@"registerPeerPayment"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL registerBroker = self->_registerBroker;
  id v5 = a3;
  [v5 encodeBool:registerBroker forKey:@"registerBroker"];
  [v5 encodeBool:self->_registerPeerPayment forKey:@"registerPeerPayment"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKRemoteRegistrationRequest *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKRemoteRegistrationRequest *)self isEqualToRemoteRegistrationRequest:v5];

  return v6;
}

- (BOOL)isEqualToRemoteRegistrationRequest:(id)a3
{
  return self->_registerBroker == *((unsigned __int8 *)a3 + 8)
      && self->_registerPeerPayment == *((unsigned __int8 *)a3 + 9);
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  id v4 = v3;
  if (self->_registerBroker) {
    id v5 = @"YES";
  }
  else {
    id v5 = @"NO";
  }
  [v3 appendFormat:@"registerBroker: %@; ", v5];
  if (self->_registerPeerPayment) {
    BOOL v6 = @"YES";
  }
  else {
    BOOL v6 = @"NO";
  }
  [v4 appendFormat:@"registerPeerPayment: %@; ", v6];
  [v4 appendString:@">"];
  objc_super v7 = (void *)[v4 copy];

  return v7;
}

- (BOOL)registerBroker
{
  return self->_registerBroker;
}

- (void)setRegisterBroker:(BOOL)a3
{
  self->_BOOL registerBroker = a3;
}

- (BOOL)registerPeerPayment
{
  return self->_registerPeerPayment;
}

- (void)setRegisterPeerPayment:(BOOL)a3
{
  self->_registerPeerPayment = a3;
}

@end