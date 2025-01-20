@interface _SFIdentity
+ (BOOL)supportsSecureCoding;
- (SFIdentityAttributes)attributes;
- (_SFCertificate)certificate;
- (_SFIdentity)initWithCoder:(id)a3;
- (_SFIdentity)initWithKeyPair:(id)a3;
- (_SFIdentity)initWithKeyPair:(id)a3 certificate:(id)a4;
- (_SFIdentity)initWithPublicKey:(id)a3;
- (_SFIdentity)initWithPublicKey:(id)a3 certificate:(id)a4;
- (_SFKeyPair)keyPair;
- (_SFPublicKey)publicKey;
- (void)setCertificate:(id)a3;
- (void)setKeyPair:(id)a3;
@end

@implementation _SFIdentity

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SFIdentity)initWithPublicKey:(id)a3
{
  return [(_SFIdentity *)self initWithPublicKey:a3 certificate:0];
}

- (_SFIdentity)initWithKeyPair:(id)a3
{
  return [(_SFIdentity *)self initWithKeyPair:a3 certificate:0];
}

- (_SFIdentity)initWithPublicKey:(id)a3 certificate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_SFIdentity;
  v9 = [(_SFIdentity *)&v13 init];
  if (v9)
  {
    v10 = objc_alloc_init(SFIdentity_Ivars);
    id identityInternal = v9->_identityInternal;
    v9->_id identityInternal = v10;

    objc_storeStrong((id *)v9->_identityInternal + 1, a3);
    objc_storeStrong((id *)v9->_identityInternal + 3, a4);
  }

  return v9;
}

- (_SFIdentity)initWithKeyPair:(id)a3 certificate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_SFIdentity;
  v9 = [(_SFIdentity *)&v16 init];
  if (v9)
  {
    v10 = objc_alloc_init(SFIdentity_Ivars);
    id identityInternal = v9->_identityInternal;
    v9->_id identityInternal = v10;

    uint64_t v12 = [v7 publicKey];
    objc_super v13 = v9->_identityInternal;
    v14 = (void *)v13[1];
    v13[1] = v12;

    objc_storeStrong((id *)v9->_identityInternal + 3, a4);
    objc_storeStrong((id *)v9->_identityInternal + 2, a3);
  }

  return v9;
}

- (_SFIdentity)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_SFIdentity;
  return [(_SFIdentity *)&v4 init];
}

- (_SFPublicKey)publicKey
{
  return (_SFPublicKey *)*((id *)self->_identityInternal + 1);
}

- (_SFKeyPair)keyPair
{
  return (_SFKeyPair *)*((id *)self->_identityInternal + 2);
}

- (void)setKeyPair:(id)a3
{
}

- (_SFCertificate)certificate
{
  return (_SFCertificate *)*((id *)self->_identityInternal + 3);
}

- (void)setCertificate:(id)a3
{
}

- (SFIdentityAttributes)attributes
{
  return (SFIdentityAttributes *)*((id *)self->_identityInternal + 4);
}

- (void).cxx_destruct
{
}

@end