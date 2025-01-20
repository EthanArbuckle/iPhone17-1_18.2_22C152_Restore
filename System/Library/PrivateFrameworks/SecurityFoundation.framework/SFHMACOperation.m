@interface SFHMACOperation
- (SFDigestOperation)digestOperation;
- (SFHMACOperation)init;
- (SFHMACOperation)initWithCoder:(id)a3;
- (SFHMACOperation)initWithDigestOperation:(id)a3;
- (void)setDigestOperation:(id)a3;
@end

@implementation SFHMACOperation

- (SFHMACOperation)init
{
  v3 = _defaultDigestOperation();
  v4 = [(SFHMACOperation *)self initWithDigestOperation:v3];

  return v4;
}

- (SFHMACOperation)initWithDigestOperation:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFHMACOperation;
  v6 = [(SFMessageAuthenticationCodeOperation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)v6->_hmacOperationInternal + 1, a3);
  }

  return v7;
}

- (SFHMACOperation)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFHMACOperation;
  return [(SFMessageAuthenticationCodeOperation *)&v4 initWithCoder:a3];
}

- (SFDigestOperation)digestOperation
{
  v2 = (void *)[*((id *)self->_hmacOperationInternal + 1) copyWithZone:0];
  return (SFDigestOperation *)v2;
}

- (void)setDigestOperation:(id)a3
{
  *((void *)self->_hmacOperationInternal + 1) = [a3 copyWithZone:0];
  MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
}

@end