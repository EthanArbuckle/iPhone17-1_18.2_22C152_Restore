@interface PKAddShareablePassConfiguration
+ (BOOL)supportsSecureCoding;
+ (void)_configurationForPassMetadata:(id)a3 provisioningPolicyIdentifier:(id)a4 primaryAction:(unint64_t)a5 completion:(id)a6;
+ (void)configurationForPassMetadata:(NSArray *)passMetadata primaryAction:(PKAddShareablePassConfigurationPrimaryAction)action completion:(void *)completion;
- (BOOL)hasRequiredDataForProvisioning;
- (BOOL)requiresNonceValidityChecks;
- (NSArray)credentialsMetadata;
- (NSArray)metadataProviders;
- (NSString)provisioningPolicyIdentifier;
- (PKAddIdentityDocumentConfiguration)identityDocumentConfiguration;
- (PKAddShareablePassConfiguration)initWithCoder:(id)a3;
- (PKAddShareablePassConfiguration)initWithPrimaryAction:(unint64_t)a3 credentialsMetadata:(id)a4;
- (PKAddShareablePassConfigurationPrimaryAction)primaryAction;
- (id)_primaryActionToString:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_extendableDescription:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setRequiresNonceValidityChecks:(BOOL)a3;
@end

@implementation PKAddShareablePassConfiguration

+ (void)configurationForPassMetadata:(NSArray *)passMetadata primaryAction:(PKAddShareablePassConfigurationPrimaryAction)action completion:(void *)completion
{
}

+ (void)_configurationForPassMetadata:(id)a3 provisioningPolicyIdentifier:(id)a4 primaryAction:(unint64_t)a5 completion:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a6;
  id v11 = a3;
  v12 = [[PKAddShareablePassConfiguration alloc] initWithPrimaryAction:a5 credentialsMetadata:v11];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __119__PKAddShareablePassConfiguration__configurationForPassMetadata_provisioningPolicyIdentifier_primaryAction_completion___block_invoke;
  aBlock[3] = &unk_1E56E2520;
  id v27 = v10;
  v13 = v12;
  v25 = v13;
  id v26 = v9;
  id v14 = v9;
  id v15 = v10;
  v16 = _Block_copy(aBlock);
  v17 = PKLogFacilityTypeGetObject(0x1BuLL);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v13;
    _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, "Push Provisioning: Preflighting %@", buf, 0xCu);
  }

  v18 = +[PKPassLibrary sharedInstance];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __119__PKAddShareablePassConfiguration__configurationForPassMetadata_provisioningPolicyIdentifier_primaryAction_completion___block_invoke_252;
  v21[3] = &unk_1E56DE740;
  v22 = v13;
  id v23 = v16;
  v19 = v13;
  id v20 = v16;
  [v18 configurePushProvisioningConfigurationV2:v19 completion:v21];
}

uint64_t __119__PKAddShareablePassConfiguration__configurationForPassMetadata_provisioningPolicyIdentifier_primaryAction_completion___block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  if (a3 || (a2 & 1) == 0)
  {
    v4 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 72), *(id *)(a1 + 40));
    v4 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  }
  return v4();
}

void __119__PKAddShareablePassConfiguration__configurationForPassMetadata_provisioningPolicyIdentifier_primaryAction_completion___block_invoke_252(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __119__PKAddShareablePassConfiguration__configurationForPassMetadata_provisioningPolicyIdentifier_primaryAction_completion___block_invoke_2;
  v9[3] = &unk_1E56DEB98;
  id v10 = v5;
  id v11 = v6;
  id v13 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 32);
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

void __119__PKAddShareablePassConfiguration__configurationForPassMetadata_provisioningPolicyIdentifier_primaryAction_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) shareablePassConfiguration];
  v3 = v2;
  if (v2 && !*(void *)(a1 + 40))
  {
    uint64_t v8 = [v2 credentialsMetadata];
    uint64_t v9 = *(void *)(a1 + 48);
    id v10 = *(void **)(v9 + 64);
    *(void *)(v9 + 64) = v8;

    *(unsigned char *)(*(void *)(a1 + 48) + 48) = [v3 requiresNonceValidityChecks];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    v4 = PKLogFacilityTypeGetObject(0x16uLL);
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

- (PKAddShareablePassConfiguration)initWithPrimaryAction:(unint64_t)a3 credentialsMetadata:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PKAddShareablePassConfiguration;
  uint64_t v8 = [(PKAddSecureElementPassConfiguration *)&v11 initWithType:2];
  uint64_t v9 = v8;
  if (v8)
  {
    v8->_primaryAction = a3;
    objc_storeStrong((id *)&v8->_credentialsMetadata, a4);
  }

  return v9;
}

- (BOOL)hasRequiredDataForProvisioning
{
  v3 = [(PKAddShareablePassConfiguration *)self credentialsMetadata];
  int v4 = objc_msgSend(v3, "pk_containsObjectPassingTest:", &__block_literal_global_57);
  uint64_t v5 = [v3 count];
  BOOL v6 = v5 != 0;
  if (v5 && v4) {
    BOOL v6 = !self->_requiresNonceValidityChecks;
  }

  return v6;
}

uint64_t __65__PKAddShareablePassConfiguration_hasRequiredDataForProvisioning__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 provisioningTarget];
  uint64_t v3 = [v2 targetDevice];
  int v4 = [v2 nonce];

  if (v3) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  uint64_t v6 = v5;

  return v6;
}

- (NSArray)metadataProviders
{
  if (self->_credentialsMetadata) {
    return self->_credentialsMetadata;
  }
  else {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
}

- (PKAddIdentityDocumentConfiguration)identityDocumentConfiguration
{
  return 0;
}

- (void)_extendableDescription:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKAddShareablePassConfiguration;
  id v4 = a3;
  [(PKAddSecureElementPassConfiguration *)&v6 _extendableDescription:v4];
  [v4 appendFormat:@"credentialsMetadata: '%@'; ", self->_credentialsMetadata];
  objc_msgSend(v4, "appendFormat:", @"requiresNVC: '%d'; ", self->_requiresNonceValidityChecks);
  BOOL v5 = [(PKAddShareablePassConfiguration *)self _primaryActionToString:self->_primaryAction];
  [v4 appendFormat:@"primaryAction: '%@'; ", v5];
}

- (id)_primaryActionToString:(unint64_t)a3
{
  uint64_t v3 = @"Unknown";
  if (a3 == 1) {
    uint64_t v3 = @"Share";
  }
  if (a3) {
    return v3;
  }
  else {
    return @"Add";
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PKAddShareablePassConfiguration;
  id v4 = [(PKAddSecureElementPassConfiguration *)&v8 copyWithZone:a3];
  uint64_t v5 = [(NSArray *)self->_credentialsMetadata copy];
  objc_super v6 = (void *)v4[8];
  v4[8] = v5;

  *((unsigned char *)v4 + 48) = self->_requiresNonceValidityChecks;
  v4[7] = self->_primaryAction;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKAddShareablePassConfiguration;
  id v4 = a3;
  [(PKAddSecureElementPassConfiguration *)&v6 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_credentialsMetadata, @"credentialsMetadata", v6.receiver, v6.super_class);
  [v4 encodeBool:self->_requiresNonceValidityChecks forKey:@"requiresNonceValidityChecks"];
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:self->_primaryAction];
  [v4 encodeObject:v5 forKey:@"primaryAction"];
}

- (PKAddShareablePassConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKAddShareablePassConfiguration;
  uint64_t v5 = [(PKAddSecureElementPassConfiguration *)&v13 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    objc_super v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"credentialsMetadata"];
    credentialsMetadata = v5->_credentialsMetadata;
    v5->_credentialsMetadata = (NSArray *)v9;

    v5->_requiresNonceValidityChecks = [v4 decodeBoolForKey:@"requiresNonceValidityChecks"];
    objc_super v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"primaryAction"];
    v5->_primaryAction = [v11 unsignedIntegerValue];
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

- (PKAddShareablePassConfigurationPrimaryAction)primaryAction
{
  return self->_primaryAction;
}

- (NSArray)credentialsMetadata
{
  return self->_credentialsMetadata;
}

- (NSString)provisioningPolicyIdentifier
{
  return self->_provisioningPolicyIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisioningPolicyIdentifier, 0);
  objc_storeStrong((id *)&self->_credentialsMetadata, 0);
}

@end