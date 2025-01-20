@interface SESLegacyKeyCreateResponse
+ (BOOL)supportsSecureCoding;
+ (id)withPublicKeyData:(id)a3 CASDSignature:(id)a4 keySlot:(id)a5 legacyKeyAttestation:(id)a6;
- (NSData)CASDSignature;
- (NSData)legacyKeyAttestation;
- (NSData)publicKeyData;
- (NSNumber)keySlot;
- (SESLegacyKeyCreateResponse)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCASDSignature:(id)a3;
- (void)setKeySlot:(id)a3;
- (void)setLegacyKeyAttestation:(id)a3;
- (void)setPublicKeyData:(id)a3;
@end

@implementation SESLegacyKeyCreateResponse

+ (id)withPublicKeyData:(id)a3 CASDSignature:(id)a4 keySlot:(id)a5 legacyKeyAttestation:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_opt_new();
  [v13 setLegacyKeyAttestation:v9];

  [v13 setPublicKeyData:v12];
  [v13 setCASDSignature:v11];

  [v13 setKeySlot:v10];
  return v13;
}

- (id)description
{
  v3 = NSString;
  v4 = [(SESLegacyKeyCreateResponse *)self legacyKeyAttestation];
  v5 = [v4 asHexString];
  v6 = [(SESLegacyKeyCreateResponse *)self publicKeyData];
  v7 = [v6 asHexString];
  v8 = [(SESLegacyKeyCreateResponse *)self CASDSignature];
  id v9 = [v8 asHexString];
  id v10 = [(SESLegacyKeyCreateResponse *)self keySlot];
  id v11 = [v3 stringWithFormat:@"{\n\tlegacyKeyAttestation : %@,\n\tpublicKeyData : %@,\n\tCASDSignature : %@,\n\tkeySlot : %d\n}", v5, v7, v9, objc_msgSend(v10, "unsignedShortValue")];

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SESLegacyKeyCreateResponse *)self legacyKeyAttestation];
  [v4 encodeObject:v5 forKey:@"legacyKeyAttestation"];

  v6 = [(SESLegacyKeyCreateResponse *)self publicKeyData];
  [v4 encodeObject:v6 forKey:@"publicKeyData"];

  v7 = [(SESLegacyKeyCreateResponse *)self CASDSignature];
  [v4 encodeObject:v7 forKey:@"CASDSignature"];

  id v8 = [(SESLegacyKeyCreateResponse *)self keySlot];
  [v4 encodeObject:v8 forKey:@"keySlot"];
}

- (SESLegacyKeyCreateResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SESLegacyKeyCreateResponse;
  v5 = [(SESLegacyKeyCreateResponse *)&v20 init];
  v6 = v5;
  if (v5)
  {
    v7 = [(SESLegacyKeyCreateResponse *)v5 legacyKeyAttestation];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"legacyKeyAttestation"];
    legacyKeyAttestation = v6->_legacyKeyAttestation;
    v6->_legacyKeyAttestation = (NSData *)v8;

    id v10 = [(SESLegacyKeyCreateResponse *)v6 publicKeyData];
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"publicKeyData"];
    publicKeyData = v6->_publicKeyData;
    v6->_publicKeyData = (NSData *)v11;

    v13 = [(SESLegacyKeyCreateResponse *)v6 CASDSignature];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CASDSignature"];
    CASDSignature = v6->_CASDSignature;
    v6->_CASDSignature = (NSData *)v14;

    v16 = [(SESLegacyKeyCreateResponse *)v6 keySlot];
    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keySlot"];
    keySlot = v6->_keySlot;
    v6->_keySlot = (NSNumber *)v17;
  }
  return v6;
}

- (NSNumber)keySlot
{
  return self->_keySlot;
}

- (void)setKeySlot:(id)a3
{
}

- (NSData)publicKeyData
{
  return self->_publicKeyData;
}

- (void)setPublicKeyData:(id)a3
{
}

- (NSData)CASDSignature
{
  return self->_CASDSignature;
}

- (void)setCASDSignature:(id)a3
{
}

- (NSData)legacyKeyAttestation
{
  return self->_legacyKeyAttestation;
}

- (void)setLegacyKeyAttestation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyKeyAttestation, 0);
  objc_storeStrong((id *)&self->_CASDSignature, 0);
  objc_storeStrong((id *)&self->_publicKeyData, 0);
  objc_storeStrong((id *)&self->_keySlot, 0);
}

@end