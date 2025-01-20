@interface SFRSA_WrappedKeyEncryptionOperation
+ (BOOL)supportsSecureCoding;
- (SFRSAEncryptionOperation)keyWrappingOperation;
- (SFRSA_WrappedKeyEncryptionOperation)init;
- (SFRSA_WrappedKeyEncryptionOperation)initWithCoder:(id)a3;
- (SFRSA_WrappedKeyEncryptionOperation)initWithKeyWrappingOperation:(id)a3;
- (SFRSA_WrappedKeyEncryptionOperation)initWithKeyWrappingOperation:(id)a3 sessionEncryptionOperation:(id)a4;
- (SFSymmetricEncryptionOperation)sessionEncryptionOperation;
- (_SFKeySpecifier)encryptionKeySpecifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)decrypt:(id)a3 withKey:(id)a4 error:(id *)a5;
- (id)encrypt:(id)a3 withKey:(id)a4 error:(id *)a5;
- (void)setKeyWrappingOperation:(id)a3;
- (void)setSessionEncryptionOperation:(id)a3;
@end

@implementation SFRSA_WrappedKeyEncryptionOperation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFRSA_WrappedKeyEncryptionOperation)init
{
  v3 = +[SFRSAEncryptionOperation _defaultEncryptionOperation];
  v4 = [(SFRSA_WrappedKeyEncryptionOperation *)self initWithKeyWrappingOperation:v3];

  return v4;
}

- (SFRSA_WrappedKeyEncryptionOperation)initWithKeyWrappingOperation:(id)a3
{
  id v4 = a3;
  v5 = +[SFSymmetricEncryptionOperation _defaultEncryptionOperation];
  v6 = [(SFRSA_WrappedKeyEncryptionOperation *)self initWithKeyWrappingOperation:v4 sessionEncryptionOperation:v5];

  return v6;
}

- (SFRSA_WrappedKeyEncryptionOperation)initWithKeyWrappingOperation:(id)a3 sessionEncryptionOperation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SFRSA_WrappedKeyEncryptionOperation;
  v9 = [(SFRSA_WrappedKeyEncryptionOperation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)v9->_wrappedKeyEncryptionOperationInternal + 1, a3);
    objc_storeStrong((id *)v10->_wrappedKeyEncryptionOperationInternal + 2, a4);
  }

  return v10;
}

- (SFRSA_WrappedKeyEncryptionOperation)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFRSA_WrappedKeyEncryptionOperation;
  return [(SFRSA_WrappedKeyEncryptionOperation *)&v4 init];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  wrappedKeyEncryptionOperationInternal = self->_wrappedKeyEncryptionOperationInternal;
  uint64_t v6 = wrappedKeyEncryptionOperationInternal[1];
  uint64_t v7 = wrappedKeyEncryptionOperationInternal[2];
  return (id)[v4 initWithKeyWrappingOperation:v6 sessionEncryptionOperation:v7];
}

- (id)encrypt:(id)a3 withKey:(id)a4 error:(id *)a5
{
  return 0;
}

- (id)decrypt:(id)a3 withKey:(id)a4 error:(id *)a5
{
  return 0;
}

- (_SFKeySpecifier)encryptionKeySpecifier
{
  return (_SFKeySpecifier *)[*((id *)self->_wrappedKeyEncryptionOperationInternal + 1) encryptionKeySpecifier];
}

- (SFRSAEncryptionOperation)keyWrappingOperation
{
  v2 = (void *)[*((id *)self->_wrappedKeyEncryptionOperationInternal + 1) copy];
  return (SFRSAEncryptionOperation *)v2;
}

- (void)setKeyWrappingOperation:(id)a3
{
  *((void *)self->_wrappedKeyEncryptionOperationInternal + 1) = [a3 copy];
  MEMORY[0x1F41817F8]();
}

- (SFSymmetricEncryptionOperation)sessionEncryptionOperation
{
  v2 = (void *)[*((id *)self->_wrappedKeyEncryptionOperationInternal + 2) copy];
  return (SFSymmetricEncryptionOperation *)v2;
}

- (void)setSessionEncryptionOperation:(id)a3
{
  *((void *)self->_wrappedKeyEncryptionOperationInternal + 2) = [a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
}

@end