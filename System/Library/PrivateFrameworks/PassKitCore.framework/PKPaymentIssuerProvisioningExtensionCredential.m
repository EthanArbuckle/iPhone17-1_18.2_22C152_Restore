@interface PKPaymentIssuerProvisioningExtensionCredential
- (BOOL)_isEqualToCredential:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSExtension)extension;
- (PKIssuerProvisioningExtensionPaymentPassEntry)entry;
- (PKPaymentIssuerProvisioningExtensionCredential)initWithExtension:(id)a3 entry:(id)a4;
- (id)detailDescriptionWithEnvironment:(unint64_t)a3;
- (id)metadata;
- (unint64_t)hash;
@end

@implementation PKPaymentIssuerProvisioningExtensionCredential

- (PKPaymentIssuerProvisioningExtensionCredential)initWithExtension:(id)a3 entry:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(PKPaymentCredential *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_extension, a3);
    objc_storeStrong((id *)&v10->_entry, a4);
    v11 = [(PKIssuerProvisioningExtensionPassEntry *)v10->_entry title];
    [(PKPaymentCredential *)v10 setLongDescription:v11];
  }
  return v10;
}

- (id)metadata
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v3 = [(PKIssuerProvisioningExtensionPaymentPassEntry *)self->_entry addRequestConfiguration];
  v4 = [v3 _effectiveDetails];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v22[0] = @"text";
        v21[0] = @"valueType";
        v21[1] = @"value";
        v10 = [v9 value];
        v22[1] = v10;
        v21[2] = @"localizedDisplayName";
        v11 = [v9 label];
        v22[2] = v11;
        v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];

        v13 = +[PKPaymentCredentialMetadata paymentCredentialMetadataWithConfiguration:v12];
        if (v13) {
          [v16 addObject:v13];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v6);
  }

  return v16;
}

- (id)detailDescriptionWithEnvironment:(unint64_t)a3
{
  v3 = [(PKPaymentIssuerProvisioningExtensionCredential *)self entry];
  v4 = [v3 addRequestConfiguration];
  uint64_t v5 = [v4 primaryAccountSuffix];

  if ([v5 length])
  {
    uint64_t v6 = PKMaskedPaymentPAN((uint64_t)v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_entry];
  v4 = [(PKPaymentIssuerProvisioningExtensionCredential *)self metadata];
  [v3 safelyAddObject:v4];

  unint64_t v5 = PKCombinedHash(17, v3);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKPaymentIssuerProvisioningExtensionCredential *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PKPaymentIssuerProvisioningExtensionCredential *)self _isEqualToCredential:v4];
  }

  return v5;
}

- (BOOL)_isEqualToCredential:(id)a3
{
  v4 = a3;
  if (!v4) {
    goto LABEL_8;
  }
  entry = self->_entry;
  uint64_t v6 = (PKIssuerProvisioningExtensionPaymentPassEntry *)v4[14];
  if (entry) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    if (-[PKIssuerProvisioningExtensionPassEntry isEqual:](entry, "isEqual:")) {
      goto LABEL_10;
    }
LABEL_8:
    char v8 = 0;
    goto LABEL_15;
  }
  if (entry != v6) {
    goto LABEL_8;
  }
LABEL_10:
  v10 = [(PKPaymentIssuerProvisioningExtensionCredential *)self metadata];
  uint64_t v11 = [v4 metadata];
  v12 = (void *)v11;
  if (v10 && v11) {
    char v8 = [v10 isEqual:v11];
  }
  else {
    char v8 = v10 == (void *)v11;
  }

LABEL_15:
  return v8;
}

- (NSExtension)extension
{
  return self->_extension;
}

- (PKIssuerProvisioningExtensionPaymentPassEntry)entry
{
  return self->_entry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entry, 0);
  objc_storeStrong((id *)&self->_extension, 0);
}

@end