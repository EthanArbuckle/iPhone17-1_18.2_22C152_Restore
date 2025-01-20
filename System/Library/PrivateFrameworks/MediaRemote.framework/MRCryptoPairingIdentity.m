@interface MRCryptoPairingIdentity
- (MRCryptoPairingIdentity)init;
- (MRCryptoPairingIdentity)initWithIdentifier:(id)a3 publicKey:(id)a4 privateKey:(id)a5;
- (NSData)privateKey;
- (NSData)publicKey;
- (NSString)identifier;
@end

@implementation MRCryptoPairingIdentity

- (MRCryptoPairingIdentity)initWithIdentifier:(id)a3 publicKey:(id)a4 privateKey:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MRCryptoPairingIdentity;
  v11 = [(MRCryptoPairingIdentity *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    publicKey = v11->_publicKey;
    v11->_publicKey = (NSData *)v14;

    uint64_t v16 = [v10 copy];
    privateKey = v11->_privateKey;
    v11->_privateKey = (NSData *)v16;
  }
  return v11;
}

- (MRCryptoPairingIdentity)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3A8];
  v5 = NSStringFromSelector(sel_initWithIdentifier_publicKey_privateKey_);
  [v3 raise:v4, @"use %@ instead", v5 format];

  return 0;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (NSData)privateKey
{
  return self->_privateKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateKey, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end