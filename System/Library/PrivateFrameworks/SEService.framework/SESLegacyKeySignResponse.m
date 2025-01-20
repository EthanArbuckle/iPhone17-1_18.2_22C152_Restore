@interface SESLegacyKeySignResponse
+ (BOOL)supportsSecureCoding;
+ (id)withSignature:(id)a3 localValidationVerified:(id)a4;
- (NSData)signature;
- (NSNumber)localValidationVerified;
- (SESLegacyKeySignResponse)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setLocalValidationVerified:(id)a3;
- (void)setSignature:(id)a3;
@end

@implementation SESLegacyKeySignResponse

+ (id)withSignature:(id)a3 localValidationVerified:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setSignature:v6];

  [v7 setLocalValidationVerified:v5];
  return v7;
}

- (id)description
{
  v3 = NSString;
  v4 = [(SESLegacyKeySignResponse *)self signature];
  id v5 = [v4 asHexString];
  id v6 = [(SESLegacyKeySignResponse *)self localValidationVerified];
  v7 = [v3 stringWithFormat:@"{\n\tsignature : %@,\n\tlocalValidationVerified : %d,\n}", v5, objc_msgSend(v6, "intValue")];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SESLegacyKeySignResponse *)self signature];
  [v4 encodeObject:v5 forKey:@"signature"];

  id v6 = [(SESLegacyKeySignResponse *)self localValidationVerified];
  [v4 encodeObject:v6 forKey:@"localValidationVerified"];
}

- (SESLegacyKeySignResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SESLegacyKeySignResponse;
  id v5 = [(SESLegacyKeySignResponse *)&v14 init];
  id v6 = v5;
  if (v5)
  {
    v7 = [(SESLegacyKeySignResponse *)v5 signature];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signature"];
    signature = v6->_signature;
    v6->_signature = (NSData *)v8;

    v10 = [(SESLegacyKeySignResponse *)v6 localValidationVerified];
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localValidationVerified"];
    localValidationVerified = v6->_localValidationVerified;
    v6->_localValidationVerified = (NSNumber *)v11;
  }
  return v6;
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
}

- (NSNumber)localValidationVerified
{
  return self->_localValidationVerified;
}

- (void)setLocalValidationVerified:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localValidationVerified, 0);
  objc_storeStrong((id *)&self->_signature, 0);
}

@end