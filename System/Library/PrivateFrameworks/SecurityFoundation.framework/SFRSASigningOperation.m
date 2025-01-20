@interface SFRSASigningOperation
+ (BOOL)supportsSecureCoding;
- (SFDigestOperation)digestOperation;
- (SFRSASigningOperation)init;
- (SFRSASigningOperation)initWithCoder:(id)a3;
- (SFRSASigningOperation)initWithKeySpecifier:(id)a3;
- (SFRSASigningOperation)initWithKeySpecifier:(id)a3 digestOperation:(id)a4;
- (_SFRSAKeySpecifier)signingKeySpecifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)sign:(id)a3 withKey:(id)a4 error:(id *)a5;
- (id)verify:(id)a3 withKey:(id)a4 error:(id *)a5;
- (void)setDigestOperation:(id)a3;
- (void)setSigningKeySpecifier:(id)a3;
@end

@implementation SFRSASigningOperation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFRSASigningOperation)init
{
  v3 = [[_SFRSAKeySpecifier alloc] initWithBitSize:2048];
  v4 = [(SFRSASigningOperation *)self initWithKeySpecifier:v3];

  return v4;
}

- (SFRSASigningOperation)initWithKeySpecifier:(id)a3
{
  id v4 = a3;
  v5 = _defaultDigestOperation();
  v6 = [(SFRSASigningOperation *)self initWithKeySpecifier:v4 digestOperation:v5];

  return v6;
}

- (SFRSASigningOperation)initWithKeySpecifier:(id)a3 digestOperation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SFRSASigningOperation;
  v9 = [(SFRSASigningOperation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)v9->_rsaSigningOperationInternal + 1, a3);
    objc_storeStrong((id *)v10->_rsaSigningOperationInternal + 2, a4);
  }

  return v10;
}

- (SFRSASigningOperation)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFRSASigningOperation;
  return [(SFRSASigningOperation *)&v4 init];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  rsaSigningOperationInternal = self->_rsaSigningOperationInternal;
  uint64_t v6 = rsaSigningOperationInternal[1];
  uint64_t v7 = rsaSigningOperationInternal[2];
  return (id)[v4 initWithKeySpecifier:v6 digestOperation:v7];
}

- (id)sign:(id)a3 withKey:(id)a4 error:(id *)a5
{
  return 0;
}

- (id)verify:(id)a3 withKey:(id)a4 error:(id *)a5
{
  return 0;
}

- (_SFRSAKeySpecifier)signingKeySpecifier
{
  v2 = (void *)[*((id *)self->_rsaSigningOperationInternal + 1) copy];
  return (_SFRSAKeySpecifier *)v2;
}

- (void)setSigningKeySpecifier:(id)a3
{
  *((void *)self->_rsaSigningOperationInternal + 1) = [a3 copy];
  MEMORY[0x1F41817F8]();
}

- (SFDigestOperation)digestOperation
{
  v2 = (void *)[*((id *)self->_rsaSigningOperationInternal + 2) copyWithZone:0];
  return (SFDigestOperation *)v2;
}

- (void)setDigestOperation:(id)a3
{
  *((void *)self->_rsaSigningOperationInternal + 2) = [a3 copyWithZone:0];
  MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
}

@end