@interface SFCMACOperation
- (SFCMACOperation)init;
- (SFCMACOperation)initWithCoder:(id)a3;
- (SFCMACOperation)initWithEncryptionOperation:(id)a3;
- (SFSymmetricEncryptionOperation)encryptionOperation;
- (void)setEncryptionOperation:(id)a3;
@end

@implementation SFCMACOperation

- (SFCMACOperation)init
{
  v3 = +[SFSymmetricEncryptionOperation _defaultEncryptionOperation];
  v4 = [(SFCMACOperation *)self initWithEncryptionOperation:v3];

  return v4;
}

- (SFCMACOperation)initWithEncryptionOperation:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFCMACOperation;
  v6 = [(SFMessageAuthenticationCodeOperation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)v6->_cmacOperationInternal + 1, a3);
  }

  return v7;
}

- (SFCMACOperation)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFCMACOperation;
  return [(SFMessageAuthenticationCodeOperation *)&v4 initWithCoder:a3];
}

- (SFSymmetricEncryptionOperation)encryptionOperation
{
  v2 = (void *)[*((id *)self->_cmacOperationInternal + 1) copy];
  return (SFSymmetricEncryptionOperation *)v2;
}

- (void)setEncryptionOperation:(id)a3
{
  *((void *)self->_cmacOperationInternal + 1) = [a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
}

@end