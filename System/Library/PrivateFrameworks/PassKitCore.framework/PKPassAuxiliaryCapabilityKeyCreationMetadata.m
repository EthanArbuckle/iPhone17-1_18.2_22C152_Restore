@interface PKPassAuxiliaryCapabilityKeyCreationMetadata
+ (BOOL)supportsSecureCoding;
+ (id)createMetadataFromDictionary:(id)a3 forCapability:(id)a4;
+ (id)createMetadataFromDictionary:(id)a3 forDecryptionCapabilityType:(unint64_t)a4;
+ (id)createMetadataFromDictionary:(id)a3 forSignatureCapabilityType:(unint64_t)a4;
- (PKPassAuxiliaryCapabilityKeyCreationMetadata)init;
- (PKPassAuxiliaryCapabilityKeyCreationMetadata)initWithDictionary:(id)a3;
- (id)_init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)decryptionISO18013;
- (id)signatureAliroHome;
- (id)signatureAliroHydra;
- (id)signatureCarConnectivityConsortium;
- (id)signatureFido;
- (id)signatureIdentityAccount;
- (id)signatureUnifiedAccessHome;
- (id)signatureUnifiedAccessHydra;
@end

@implementation PKPassAuxiliaryCapabilityKeyCreationMetadata

- (PKPassAuxiliaryCapabilityKeyCreationMetadata)init
{
  return 0;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)PKPassAuxiliaryCapabilityKeyCreationMetadata;
  return [(PKPassAuxiliaryCapabilityKeyCreationMetadata *)&v3 init];
}

- (PKPassAuxiliaryCapabilityKeyCreationMetadata)initWithDictionary:(id)a3
{
  if (a3)
  {
    return (PKPassAuxiliaryCapabilityKeyCreationMetadata *)[(PKPassAuxiliaryCapabilityKeyCreationMetadata *)self _init];
  }
  else
  {

    return 0;
  }
}

+ (id)createMetadataFromDictionary:(id)a3 forCapability:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 role];
  if (v8 == 2)
  {
    uint64_t v9 = objc_msgSend(a1, "createMetadataFromDictionary:forSignatureCapabilityType:", v6, objc_msgSend(v7, "type"));
    goto LABEL_5;
  }
  if (v8 == 1)
  {
    uint64_t v9 = objc_msgSend(a1, "createMetadataFromDictionary:forDecryptionCapabilityType:", v6, objc_msgSend(v7, "type"));
LABEL_5:
    v10 = (void *)v9;
    goto LABEL_7;
  }
  v10 = 0;
LABEL_7:

  return v10;
}

+ (id)createMetadataFromDictionary:(id)a3 forDecryptionCapabilityType:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __105__PKPassAuxiliaryCapabilityKeyCreationMetadata_createMetadataFromDictionary_forDecryptionCapabilityType___block_invoke;
  aBlock[3] = &__block_descriptor_40_e5__8__0l;
  aBlock[4] = a4;
  id v6 = (uint64_t (**)(void))_Block_copy(aBlock);
  id v7 = (objc_class *)v6[2]();
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = (void *)[[v7 alloc] initWithDictionary:v5];
    if (v9) {
      goto LABEL_7;
    }
    v10 = PKLogFacilityTypeGetObject(0x1CuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v14 = v8;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Failed to initialize %@ metadata from %@", buf, 0x16u);
    }
  }
  uint64_t v9 = 0;
LABEL_7:

  return v9;
}

id __105__PKPassAuxiliaryCapabilityKeyCreationMetadata_createMetadataFromDictionary_forDecryptionCapabilityType___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32) == 1)
  {
    v1 = objc_opt_class();
  }
  else
  {
    v1 = 0;
  }
  return v1;
}

+ (id)createMetadataFromDictionary:(id)a3 forSignatureCapabilityType:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __104__PKPassAuxiliaryCapabilityKeyCreationMetadata_createMetadataFromDictionary_forSignatureCapabilityType___block_invoke;
  aBlock[3] = &__block_descriptor_40_e5__8__0l;
  aBlock[4] = a4;
  id v6 = (uint64_t (**)(void))_Block_copy(aBlock);
  id v7 = (objc_class *)v6[2]();
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = (void *)[[v7 alloc] initWithDictionary:v5];
    if (v9) {
      goto LABEL_7;
    }
    v10 = PKLogFacilityTypeGetObject(0x1CuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v14 = v8;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Failed to initialize %@ metadata from %@", buf, 0x16u);
    }
  }
  uint64_t v9 = 0;
LABEL_7:

  return v9;
}

id __104__PKPassAuxiliaryCapabilityKeyCreationMetadata_createMetadataFromDictionary_forSignatureCapabilityType___block_invoke(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 32) - 1;
  if (v1 <= 6 && ((0x65u >> v1) & 1) != 0)
  {
    v2 = objc_opt_class();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(PKPassAuxiliaryCapabilityKeyCreationMetadata);
  [(PKPassAuxiliaryCapabilityKeyCreationMetadata *)self _copyInto:v4];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)decryptionISO18013
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = self;
  }
  else {
    uint64_t v3 = 0;
  }
  return v3;
}

- (id)signatureCarConnectivityConsortium
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = self;
  }
  else {
    uint64_t v3 = 0;
  }
  return v3;
}

- (id)signatureFido
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = self;
  }
  else {
    uint64_t v3 = 0;
  }
  return v3;
}

- (id)signatureIdentityAccount
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = self;
  }
  else {
    uint64_t v3 = 0;
  }
  return v3;
}

- (id)signatureUnifiedAccessHydra
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = self;
  }
  else {
    uint64_t v3 = 0;
  }
  return v3;
}

- (id)signatureUnifiedAccessHome
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = self;
  }
  else {
    uint64_t v3 = 0;
  }
  return v3;
}

- (id)signatureAliroHydra
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = self;
  }
  else {
    uint64_t v3 = 0;
  }
  return v3;
}

- (id)signatureAliroHome
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = self;
  }
  else {
    uint64_t v3 = 0;
  }
  return v3;
}

@end