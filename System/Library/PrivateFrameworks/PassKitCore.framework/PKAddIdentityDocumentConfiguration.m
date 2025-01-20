@interface PKAddIdentityDocumentConfiguration
+ (BOOL)supportsSecureCoding;
+ (void)configurationForMetadata:(id)a3 completion:(id)a4;
- (BOOL)requiresNonceValidityChecks;
- (NSArray)metadataProviders;
- (PKAddIdentityDocumentConfiguration)initWithCoder:(id)a3;
- (PKAddIdentityDocumentConfiguration)initWithMetadata:(id)a3;
- (PKAddShareablePassConfiguration)shareablePassConfiguration;
- (PKIdentityDocumentMetadata)metadata;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_extendableDescription:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setRequiresNonceValidityChecks:(BOOL)a3;
@end

@implementation PKAddIdentityDocumentConfiguration

- (PKAddIdentityDocumentConfiguration)initWithMetadata:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAddIdentityDocumentConfiguration;
  v6 = [(PKAddSecureElementPassConfiguration *)&v9 initWithType:4];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_metadata, a3);
  }

  return v7;
}

+ (void)configurationForMetadata:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  v7 = [[PKAddIdentityDocumentConfiguration alloc] initWithMetadata:v6];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__PKAddIdentityDocumentConfiguration_configurationForMetadata_completion___block_invoke;
  aBlock[3] = &unk_1E56D8928;
  id v20 = v5;
  v8 = v7;
  v19 = v8;
  id v9 = v5;
  v10 = _Block_copy(aBlock);
  v11 = PKLogFacilityTypeGetObject(0x1BuLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v8;
    _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Push Provisioning: Preflighting %@", buf, 0xCu);
  }

  v12 = +[PKPassLibrary sharedInstance];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __74__PKAddIdentityDocumentConfiguration_configurationForMetadata_completion___block_invoke_228;
  v15[3] = &unk_1E56DE740;
  v16 = v8;
  id v17 = v10;
  v13 = v8;
  id v14 = v10;
  [v12 configurePushProvisioningConfigurationV2:v13 completion:v15];
}

uint64_t __74__PKAddIdentityDocumentConfiguration_configurationForMetadata_completion___block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  if (a3 || (a2 & 1) == 0) {
    return (*(uint64_t (**)(uint64_t, void))(v4 + 16))(v4, 0);
  }
  else {
    return (*(uint64_t (**)(uint64_t, void, void))(v4 + 16))(v4, *(void *)(a1 + 32), 0);
  }
}

void __74__PKAddIdentityDocumentConfiguration_configurationForMetadata_completion___block_invoke_228(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__PKAddIdentityDocumentConfiguration_configurationForMetadata_completion___block_invoke_2;
  v9[3] = &unk_1E56DEB98;
  id v10 = v5;
  id v11 = v6;
  id v13 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 32);
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

void __74__PKAddIdentityDocumentConfiguration_configurationForMetadata_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) identityDocumentConfiguration];
  v3 = v2;
  if (*(void *)(a1 + 32) && !*(void *)(a1 + 40))
  {
    uint64_t v8 = [v2 metadata];
    uint64_t v9 = *(void *)(a1 + 48);
    id v10 = *(void **)(v9 + 56);
    *(void *)(v9 + 56) = v8;

    *(unsigned char *)(*(void *)(a1 + 48) + 48) = [v3 requiresNonceValidityChecks];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    uint64_t v4 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v11 = 138412290;
      uint64_t v12 = v5;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Unable to fetch provisioning nonces with error: %@", (uint8_t *)&v11, 0xCu);
    }

    uint64_t v6 = *(void *)(a1 + 56);
    if (*(void *)(a1 + 40))
    {
      (*(void (**)(void, void))(v6 + 16))(*(void *)(a1 + 56), 0);
    }
    else
    {
      id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKAddSecureElementPassErrorDomain" code:0 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
    }
  }
}

- (NSArray)metadataProviders
{
  v4[1] = *MEMORY[0x1E4F143B8];
  if (self->_metadata)
  {
    v4[0] = self->_metadata;
    v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  }
  else
  {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return (NSArray *)v2;
}

- (PKAddShareablePassConfiguration)shareablePassConfiguration
{
  return 0;
}

- (void)_extendableDescription:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKAddIdentityDocumentConfiguration;
  id v4 = a3;
  [(PKAddSecureElementPassConfiguration *)&v5 _extendableDescription:v4];
  [v4 appendFormat:@"metadata: '%@'; ", self->_metadata];
  objc_msgSend(v4, "appendFormat:", @"requiresNVC: '%d'; ", self->_requiresNonceValidityChecks);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PKAddIdentityDocumentConfiguration;
  id v4 = [(PKAddSecureElementPassConfiguration *)&v8 copyWithZone:a3];
  uint64_t v5 = [(PKIdentityDocumentMetadata *)self->_metadata copy];
  uint64_t v6 = (void *)v4[7];
  v4[7] = v5;

  *((unsigned char *)v4 + 48) = self->_requiresNonceValidityChecks;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKAddIdentityDocumentConfiguration;
  id v4 = a3;
  [(PKAddSecureElementPassConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_metadata, @"metadata", v5.receiver, v5.super_class);
  [v4 encodeBool:self->_requiresNonceValidityChecks forKey:@"requiresNonceValidityChecks"];
}

- (PKAddIdentityDocumentConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKAddIdentityDocumentConfiguration;
  objc_super v5 = [(PKAddSecureElementPassConfiguration *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"metadata"];
    metadata = v5->_metadata;
    v5->_metadata = (PKIdentityDocumentMetadata *)v10;

    v5->_requiresNonceValidityChecks = [v4 decodeBoolForKey:@"requiresNonceValidityChecks"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)requiresNonceValidityChecks
{
  return self->_requiresNonceValidityChecks;
}

- (void)setRequiresNonceValidityChecks:(BOOL)a3
{
  self->_requiresNonceValidityChecks = a3;
}

- (PKIdentityDocumentMetadata)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
}

@end