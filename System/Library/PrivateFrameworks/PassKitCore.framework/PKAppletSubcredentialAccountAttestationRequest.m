@interface PKAppletSubcredentialAccountAttestationRequest
+ (BOOL)supportsSecureCoding;
- (NSData)sharingTokenHash;
- (NSData)subCASEResidencyAttestation;
- (PKAppletSubcredentialAccountAttestationRequest)initWithCoder:(id)a3;
- (PKAppletSubcredentialAccountAttestationRequest)initWithRequestData:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setSharingTokenHash:(id)a3;
- (void)setSubCASEResidencyAttestation:(id)a3;
@end

@implementation PKAppletSubcredentialAccountAttestationRequest

- (PKAppletSubcredentialAccountAttestationRequest)initWithRequestData:(id)a3
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = [(PKAppletSubcredentialAccountAttestationRequest *)self init];
    if (v5)
    {
      uint64_t v6 = [v4 subCaAttestation];
      subCASEResidencyAttestation = v5->_subCASEResidencyAttestation;
      v5->_subCASEResidencyAttestation = (NSData *)v6;

      v20[0] = 0;
      v20[1] = 0;
      v8 = [v4 sharingSessionIdentifier];
      [v8 getUUIDBytes:v20];

      v9 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v20 length:16];
      uint64_t v10 = [v9 SHA256Hash];
      sharingTokenHash = v5->_sharingTokenHash;
      v5->_sharingTokenHash = (NSData *)v10;

      v12 = [PKSecureElementCertificateSet alloc];
      v13 = [v4 rsaCertData];
      v14 = [v13 hexEncoding];
      v15 = [v4 casd];
      v16 = [v15 hexEncoding];
      v17 = [(PKSecureElementCertificateSet *)v12 initWithRSACertificate:v14 ECDSACertificate:v16];
      [(PKAccountAttestationRequest *)v5 setCasdCertificate:v17];
    }
    self = v5;
    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAppletSubcredentialAccountAttestationRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAppletSubcredentialAccountAttestationRequest;
  v5 = [(PKAccountAttestationRequest *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subCASEResidencyAttestation"];
    subCASEResidencyAttestation = v5->_subCASEResidencyAttestation;
    v5->_subCASEResidencyAttestation = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharingTokenHash"];
    sharingTokenHash = v5->_sharingTokenHash;
    v5->_sharingTokenHash = (NSData *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKAppletSubcredentialAccountAttestationRequest;
  id v4 = a3;
  [(PKAccountAttestationRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_subCASEResidencyAttestation, @"subCASEResidencyAttestation", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_sharingTokenHash forKey:@"sharingTokenHash"];
}

- (NSData)subCASEResidencyAttestation
{
  return self->_subCASEResidencyAttestation;
}

- (void)setSubCASEResidencyAttestation:(id)a3
{
}

- (NSData)sharingTokenHash
{
  return self->_sharingTokenHash;
}

- (void)setSharingTokenHash:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingTokenHash, 0);
  objc_storeStrong((id *)&self->_subCASEResidencyAttestation, 0);
}

@end