@interface SFRSAEncryptionOperation
+ (BOOL)supportsSecureCoding;
+ (id)_defaultEncryptionOperation;
- (SFRSAEncryptionOperation)init;
- (SFRSAEncryptionOperation)initWithCoder:(id)a3;
- (SFRSAEncryptionOperation)initWithKeySpecifier:(id)a3;
- (_SFRSAKeySpecifier)encryptionKeySpecifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)decrypt:(id)a3 withKey:(id)a4 error:(id *)a5;
- (id)encrypt:(id)a3 withKey:(id)a4 error:(id *)a5;
- (void)setEncryptionKeySpecifier:(id)a3;
@end

@implementation SFRSAEncryptionOperation

+ (id)_defaultEncryptionOperation
{
  v2 = [SFRSA_PKCS1EncryptionOperation alloc];
  v3 = [[_SFRSAKeySpecifier alloc] initWithBitSize:4096];
  v4 = [(SFRSAEncryptionOperation *)v2 initWithKeySpecifier:v3];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFRSAEncryptionOperation)init
{
  v3 = [[_SFRSAKeySpecifier alloc] initWithBitSize:4096];
  v4 = [(SFRSAEncryptionOperation *)self initWithKeySpecifier:v3];

  return v4;
}

- (SFRSAEncryptionOperation)initWithKeySpecifier:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SFEncryptionOperation.m", 831, @"Invalid parameter not satisfying: %@", @"keySpecifier" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)SFRSAEncryptionOperation;
  v7 = [(SFRSAEncryptionOperation *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)v7->_rsaEncryptionOperationInternal + 1, a3);
  }

  return v8;
}

- (SFRSAEncryptionOperation)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFRSAEncryptionOperation;
  return [(SFRSAEncryptionOperation *)&v4 init];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = *((void *)self->_rsaEncryptionOperationInternal + 1);
  return (id)[v4 initWithKeySpecifier:v5];
}

- (id)encrypt:(id)a3 withKey:(id)a4 error:(id *)a5
{
  return 0;
}

- (id)decrypt:(id)a3 withKey:(id)a4 error:(id *)a5
{
  return 0;
}

- (_SFRSAKeySpecifier)encryptionKeySpecifier
{
  v2 = (void *)[*((id *)self->_rsaEncryptionOperationInternal + 1) copy];
  return (_SFRSAKeySpecifier *)v2;
}

- (void)setEncryptionKeySpecifier:(id)a3
{
  *((void *)self->_rsaEncryptionOperationInternal + 1) = [a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
}

@end