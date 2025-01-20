@interface PKAddPaymentPassRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)_hasRequiredFields:(BOOL)a3;
- (BOOL)_hasRequiredThirdPartyFields:(BOOL)a3;
- (NSData)FPInfo;
- (NSData)activationData;
- (NSData)encryptedPassData;
- (NSData)ephemeralPublicKey;
- (NSData)nonce;
- (NSData)publicKeyHash;
- (NSData)wrappedKey;
- (NSString)encryptionVersion;
- (NSString)hostApplicationIdentifier;
- (NSString)hostApplicationVersion;
- (NSString)issuerIdentifier;
- (PKAddPaymentPassRequest)init;
- (PKAddPaymentPassRequest)initWithCoder:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setActivationData:(NSData *)activationData;
- (void)setEncryptedPassData:(NSData *)encryptedPassData;
- (void)setEncryptionVersion:(id)a3;
- (void)setEphemeralPublicKey:(NSData *)ephemeralPublicKey;
- (void)setFPInfo:(id)a3;
- (void)setHostApplicationIdentifier:(id)a3;
- (void)setHostApplicationVersion:(id)a3;
- (void)setIssuerIdentifier:(id)a3;
- (void)setNonce:(id)a3;
- (void)setPublicKeyHash:(id)a3;
- (void)setWrappedKey:(NSData *)wrappedKey;
@end

@implementation PKAddPaymentPassRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAddPaymentPassRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)PKAddPaymentPassRequest;
  return [(PKAddPaymentPassRequest *)&v3 init];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PKAddPaymentPassRequest;
  [(PKAddPaymentPassRequest *)&v2 dealloc];
}

- (PKAddPaymentPassRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKAddPaymentPassRequest;
  v5 = [(PKAddPaymentPassRequest *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"encryptedPassData"];
    encryptedPassData = v5->_encryptedPassData;
    v5->_encryptedPassData = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activationData"];
    activationData = v5->_activationData;
    v5->_activationData = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ephemeralPublicKey"];
    ephemeralPublicKey = v5->_ephemeralPublicKey;
    v5->_ephemeralPublicKey = (NSData *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"wrappedKey"];
    wrappedKey = v5->_wrappedKey;
    v5->_wrappedKey = (NSData *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  encryptedPassData = self->_encryptedPassData;
  id v5 = a3;
  [v5 encodeObject:encryptedPassData forKey:@"encryptedPassData"];
  [v5 encodeObject:self->_activationData forKey:@"activationData"];
  [v5 encodeObject:self->_ephemeralPublicKey forKey:@"ephemeralPublicKey"];
  [v5 encodeObject:self->_wrappedKey forKey:@"wrappedKey"];
}

- (BOOL)_hasRequiredThirdPartyFields:(BOOL)a3
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 1;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__PKAddPaymentPassRequest__hasRequiredThirdPartyFields___block_invoke;
  aBlock[3] = &unk_1E56ED898;
  BOOL v9 = a3;
  aBlock[4] = self;
  aBlock[5] = &v10;
  id v4 = (void (**)(void *, BOOL, __CFString *))_Block_copy(aBlock);
  v4[2](v4, self->_encryptedPassData != 0, @"encryptedPassData missing");
  v4[2](v4, self->_activationData != 0, @"activationData missing");
  if (self->_ephemeralPublicKey) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = [(NSString *)self->_encryptionVersion isEqualToString:@"EV_ECC_v2"] ^ 1;
  }
  v4[2](v4, v5, @"ephemeralPublicKey missing");
  char v6 = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v6;
}

void __56__PKAddPaymentPassRequest__hasRequiredThirdPartyFields___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v6 + 24))
  {
    if ((a2 & 1) == 0)
    {
      *(unsigned char *)(v6 + 24) = 0;
      if (*(unsigned char *)(a1 + 48))
      {
        v7 = PKLogFacilityTypeGetObject(0);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          uint64_t v8 = *(void *)(a1 + 32);
          int v9 = 134218242;
          uint64_t v10 = v8;
          __int16 v11 = 2114;
          id v12 = v5;
          _os_log_error_impl(&dword_190E10000, v7, OS_LOG_TYPE_ERROR, "PKAddPaymentPassRequest (%p): %{public}@", (uint8_t *)&v9, 0x16u);
        }
      }
    }
  }
}

- (BOOL)_hasRequiredFields:(BOOL)a3
{
  id v4 = self;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  BOOL v12 = 0;
  BOOL v12 = -[PKAddPaymentPassRequest _hasRequiredThirdPartyFields:](self, "_hasRequiredThirdPartyFields:");
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__PKAddPaymentPassRequest__hasRequiredFields___block_invoke;
  aBlock[3] = &unk_1E56ED898;
  BOOL v8 = a3;
  aBlock[4] = v4;
  aBlock[5] = &v9;
  id v5 = (void (**)(void *, BOOL, __CFString *))_Block_copy(aBlock);
  v5[2](v5, v4->_encryptionVersion != 0, @"encryptionVersion missing");
  v5[2](v5, v4->_issuerIdentifier != 0, @"teamID missing");
  v5[2](v5, v4->_hostApplicationIdentifier != 0, @"applicationIdentifier missing");
  v5[2](v5, v4->_hostApplicationVersion != 0, @"bundleVersion missing");
  v5[2](v5, v4->_publicKeyHash != 0, @"precondition failed");
  LOBYTE(v4) = *((unsigned char *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return (char)v4;
}

void __46__PKAddPaymentPassRequest__hasRequiredFields___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v6 + 24))
  {
    if ((a2 & 1) == 0)
    {
      *(unsigned char *)(v6 + 24) = 0;
      if (*(unsigned char *)(a1 + 48))
      {
        v7 = PKLogFacilityTypeGetObject(0);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          uint64_t v8 = *(void *)(a1 + 32);
          int v9 = 134218242;
          uint64_t v10 = v8;
          __int16 v11 = 2114;
          id v12 = v5;
          _os_log_error_impl(&dword_190E10000, v7, OS_LOG_TYPE_ERROR, "PKAddPaymentPassRequest (%p): %{public}@", (uint8_t *)&v9, 0x16u);
        }
      }
    }
  }
}

- (NSData)encryptedPassData
{
  return self->_encryptedPassData;
}

- (void)setEncryptedPassData:(NSData *)encryptedPassData
{
}

- (NSData)activationData
{
  return self->_activationData;
}

- (void)setActivationData:(NSData *)activationData
{
}

- (NSData)ephemeralPublicKey
{
  return self->_ephemeralPublicKey;
}

- (void)setEphemeralPublicKey:(NSData *)ephemeralPublicKey
{
}

- (NSData)wrappedKey
{
  return self->_wrappedKey;
}

- (void)setWrappedKey:(NSData *)wrappedKey
{
}

- (NSString)encryptionVersion
{
  return self->_encryptionVersion;
}

- (void)setEncryptionVersion:(id)a3
{
}

- (NSData)publicKeyHash
{
  return self->_publicKeyHash;
}

- (void)setPublicKeyHash:(id)a3
{
}

- (NSString)issuerIdentifier
{
  return self->_issuerIdentifier;
}

- (void)setIssuerIdentifier:(id)a3
{
}

- (NSData)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
}

- (NSString)hostApplicationIdentifier
{
  return self->_hostApplicationIdentifier;
}

- (void)setHostApplicationIdentifier:(id)a3
{
}

- (NSString)hostApplicationVersion
{
  return self->_hostApplicationVersion;
}

- (void)setHostApplicationVersion:(id)a3
{
}

- (NSData)FPInfo
{
  return self->_FPInfo;
}

- (void)setFPInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_FPInfo, 0);
  objc_storeStrong((id *)&self->_hostApplicationVersion, 0);
  objc_storeStrong((id *)&self->_hostApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_issuerIdentifier, 0);
  objc_storeStrong((id *)&self->_publicKeyHash, 0);
  objc_storeStrong((id *)&self->_encryptionVersion, 0);
  objc_storeStrong((id *)&self->_wrappedKey, 0);
  objc_storeStrong((id *)&self->_ephemeralPublicKey, 0);
  objc_storeStrong((id *)&self->_activationData, 0);
  objc_storeStrong((id *)&self->_encryptedPassData, 0);
}

@end