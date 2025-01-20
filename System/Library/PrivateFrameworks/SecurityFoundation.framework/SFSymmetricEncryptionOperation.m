@interface SFSymmetricEncryptionOperation
+ (BOOL)supportsSecureCoding;
+ (id)_defaultEncryptionOperation;
+ (int64_t)_defaultEncryptionMode;
- (SFSymmetricEncryptionOperation)init;
- (SFSymmetricEncryptionOperation)initWithCoder:(id)a3;
- (SFSymmetricEncryptionOperation)initWithKeySpecifier:(id)a3;
- (SFSymmetricEncryptionOperation)initWithKeySpecifier:(id)a3 mode:(int64_t)a4;
- (_SFSymmetricKeySpecifier)encryptionKeySpecifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)decrypt:(id)a3 withKey:(id)a4 error:(id *)a5;
- (id)encrypt:(id)a3 withKey:(id)a4 error:(id *)a5;
- (id)encrypt:(id)a3 withKey:(id)a4 ivGenerator:(id)a5 error:(id *)a6;
- (int64_t)mode;
- (void)setEncryptionKeySpecifier:(id)a3;
- (void)setMode:(int64_t)a3;
@end

@implementation SFSymmetricEncryptionOperation

+ (int64_t)_defaultEncryptionMode
{
  return 0;
}

+ (id)_defaultEncryptionOperation
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFSymmetricEncryptionOperation)init
{
  v3 = [[_SFAESKeySpecifier alloc] initWithBitSize:0];
  v4 = [(SFSymmetricEncryptionOperation *)self initWithKeySpecifier:v3];

  return v4;
}

- (SFSymmetricEncryptionOperation)initWithKeySpecifier:(id)a3
{
  id v4 = a3;
  v5 = -[SFSymmetricEncryptionOperation initWithKeySpecifier:mode:](self, "initWithKeySpecifier:mode:", v4, [(id)objc_opt_class() _defaultEncryptionMode]);

  return v5;
}

- (SFSymmetricEncryptionOperation)initWithKeySpecifier:(id)a3 mode:(int64_t)a4
{
  id v8 = a3;
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SFEncryptionOperation.m", 469, @"Invalid parameter not satisfying: %@", @"keySpecifier" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)SFSymmetricEncryptionOperation;
  v9 = [(SFSymmetricEncryptionOperation *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)v9->_symmetricEncryptionOperationInternal + 2, a3);
    *((void *)v10->_symmetricEncryptionOperationInternal + 1) = a4;
  }

  return v10;
}

- (SFSymmetricEncryptionOperation)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFSymmetricEncryptionOperation;
  return [(SFSymmetricEncryptionOperation *)&v4 init];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  symmetricEncryptionOperationInternal = self->_symmetricEncryptionOperationInternal;
  uint64_t v7 = symmetricEncryptionOperationInternal[1];
  uint64_t v6 = symmetricEncryptionOperationInternal[2];
  return (id)[v4 initWithKeySpecifier:v6 mode:v7];
}

- (id)encrypt:(id)a3 withKey:(id)a4 error:(id *)a5
{
  return 0;
}

- (id)decrypt:(id)a3 withKey:(id)a4 error:(id *)a5
{
  return 0;
}

- (id)encrypt:(id)a3 withKey:(id)a4 ivGenerator:(id)a5 error:(id *)a6
{
  return 0;
}

- (int64_t)mode
{
  return *((void *)self->_symmetricEncryptionOperationInternal + 1);
}

- (void)setMode:(int64_t)a3
{
  *((void *)self->_symmetricEncryptionOperationInternal + 1) = a3;
}

- (_SFSymmetricKeySpecifier)encryptionKeySpecifier
{
  id v2 = (void *)[*((id *)self->_symmetricEncryptionOperationInternal + 2) copy];
  return (_SFSymmetricKeySpecifier *)v2;
}

- (void)setEncryptionKeySpecifier:(id)a3
{
  *((void *)self->_symmetricEncryptionOperationInternal + 2) = [a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
}

@end