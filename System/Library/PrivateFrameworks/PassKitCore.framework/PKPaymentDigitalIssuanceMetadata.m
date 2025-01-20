@interface PKPaymentDigitalIssuanceMetadata
- (BOOL)isPurchaseBased;
- (NSArray)defaultSuggestions;
- (NSArray)serviceProviderAcceptedNetworks;
- (NSArray)serviceProviderCapabilities;
- (NSArray)serviceProviderProducts;
- (NSArray)serviceProviderSupportedNetworks;
- (NSDictionary)serviceProviderDict;
- (NSSet)serviceProviderSupportedCountries;
- (NSString)action;
- (NSString)balanceIdentifier;
- (NSString)balanceLocalizedDescription;
- (NSString)balanceLocalizedDisplayName;
- (NSString)merchantID;
- (NSString)serviceProviderCountryCode;
- (NSString)serviceProviderIdentifier;
- (NSString)serviceProviderLocalizedDisplayName;
- (NSString)serviceProviderProductsLocalizedDescription;
- (NSString)serviceProviderProductsLocalizedDisplayName;
- (PKDigitalIssuanceServiceProviderProduct)autoTopUpProduct;
- (PKPaymentDigitalIssuanceMetadata)initWithDictionary:(id)a3;
@end

@implementation PKPaymentDigitalIssuanceMetadata

- (PKPaymentDigitalIssuanceMetadata)initWithDictionary:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v60.receiver = self;
  v60.super_class = (Class)PKPaymentDigitalIssuanceMetadata;
  v5 = [(PKPaymentDigitalIssuanceMetadata *)&v60 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"serviceProviderIdentifier"];
    serviceProviderIdentifier = v5->_serviceProviderIdentifier;
    v5->_serviceProviderIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 PKStringForKey:@"serviceProviderLocalizedDisplayName"];
    serviceProviderLocalizedDisplayName = v5->_serviceProviderLocalizedDisplayName;
    v5->_serviceProviderLocalizedDisplayName = (NSString *)v8;

    uint64_t v10 = [v4 PKStringForKey:@"serviceProviderCountryCode"];
    serviceProviderCountryCode = v5->_serviceProviderCountryCode;
    v5->_serviceProviderCountryCode = (NSString *)v10;

    v12 = [v4 PKArrayContaining:objc_opt_class() forKey:@"serviceProviderAcceptedNetworks"];
    if (!v12)
    {
      v12 = [v4 PKArrayContaining:objc_opt_class() forKey:@"serviceProviderSupportedNetworks"];
    }
    v13 = +[PKServiceProviderPaymentRequest availableNetworks];
    v55 = v12;
    uint64_t v14 = objc_msgSend(v12, "pk_intersectArray:", v13);
    serviceProviderAcceptedNetworks = v5->_serviceProviderAcceptedNetworks;
    v5->_serviceProviderAcceptedNetworks = (NSArray *)v14;

    uint64_t v16 = [v4 PKArrayContaining:objc_opt_class() forKey:@"serviceProviderCapabilities"];
    serviceProviderCapabilities = v5->_serviceProviderCapabilities;
    v5->_serviceProviderCapabilities = (NSArray *)v16;

    uint64_t v18 = [v4 PKDictionaryForKey:@"serviceProviderData"];
    serviceProviderDict = v5->_serviceProviderDict;
    v5->_serviceProviderDict = (NSDictionary *)v18;

    uint64_t v20 = [v4 PKStringForKey:@"action"];
    action = v5->_action;
    v5->_action = (NSString *)v20;

    uint64_t v22 = [v4 PKStringForKey:@"merchantId"];
    merchantID = v5->_merchantID;
    v5->_merchantID = (NSString *)v22;

    v54 = [v4 PKArrayForKey:@"defaultSuggestions"];
    uint64_t v24 = objc_msgSend(v54, "pk_arrayByApplyingBlock:", &__block_literal_global_10);
    defaultSuggestions = v5->_defaultSuggestions;
    v5->_defaultSuggestions = (NSArray *)v24;

    v26 = [v4 PKSetForKey:@"serviceProviderSupportedCountries"];
    if ([v26 count]) {
      v27 = v26;
    }
    else {
      v27 = 0;
    }
    objc_storeStrong((id *)&v5->_serviceProviderSupportedCountries, v27);
    uint64_t v28 = [v4 PKStringForKey:@"balanceIdentifier"];
    balanceIdentifier = v5->_balanceIdentifier;
    v5->_balanceIdentifier = (NSString *)v28;

    v53 = [v4 PKDictionaryForKey:@"autoTopUpMetaData"];
    v30 = [[PKDigitalIssuanceServiceProviderProduct alloc] initWithDictionary:v53];
    autoTopUpProduct = v5->_autoTopUpProduct;
    v5->_autoTopUpProduct = v30;

    v32 = [v4 PKArrayContaining:objc_opt_class() forKey:@"serviceProviderProducts"];
    id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v34 = v32;
    uint64_t v35 = [v34 countByEnumeratingWithState:&v56 objects:v61 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v57;
      do
      {
        uint64_t v38 = 0;
        do
        {
          if (*(void *)v57 != v37) {
            objc_enumerationMutation(v34);
          }
          v39 = [[PKDigitalIssuanceServiceProviderProduct alloc] initWithDictionary:*(void *)(*((void *)&v56 + 1) + 8 * v38)];
          [v33 safelyAddObject:v39];

          ++v38;
        }
        while (v36 != v38);
        uint64_t v36 = [v34 countByEnumeratingWithState:&v56 objects:v61 count:16];
      }
      while (v36);
    }

    uint64_t v40 = [v33 copy];
    serviceProviderProducts = v5->_serviceProviderProducts;
    v5->_serviceProviderProducts = (NSArray *)v40;

    v42 = [v4 PKDictionaryForKey:@"balanceMetaData"];
    uint64_t v43 = [v42 objectForKeyedSubscript:@"localizedDisplayName"];
    balanceLocalizedDisplayName = v5->_balanceLocalizedDisplayName;
    v5->_balanceLocalizedDisplayName = (NSString *)v43;

    uint64_t v45 = [v42 objectForKeyedSubscript:@"localizedDescription"];
    balanceLocalizedDescription = v5->_balanceLocalizedDescription;
    v5->_balanceLocalizedDescription = (NSString *)v45;

    v47 = [v4 PKDictionaryForKey:@"serviceProviderProductsMetaData"];
    uint64_t v48 = [v47 objectForKeyedSubscript:@"localizedDisplayName"];
    serviceProviderProductsLocalizedDisplayName = v5->_serviceProviderProductsLocalizedDisplayName;
    v5->_serviceProviderProductsLocalizedDisplayName = (NSString *)v48;

    uint64_t v50 = [v47 objectForKeyedSubscript:@"localizedDescription"];
    serviceProviderProductsLocalizedDescription = v5->_serviceProviderProductsLocalizedDescription;
    v5->_serviceProviderProductsLocalizedDescription = (NSString *)v50;

    v5->_purchaseBased = [v4 PKBoolForKey:@"isPurchaseBased"];
  }

  return v5;
}

uint64_t __55__PKPaymentDigitalIssuanceMetadata_initWithDictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F28C28] decimalNumberWithString:a2];
}

- (NSArray)serviceProviderSupportedNetworks
{
  return self->_serviceProviderAcceptedNetworks;
}

- (NSString)serviceProviderIdentifier
{
  return self->_serviceProviderIdentifier;
}

- (NSString)serviceProviderLocalizedDisplayName
{
  return self->_serviceProviderLocalizedDisplayName;
}

- (NSString)serviceProviderCountryCode
{
  return self->_serviceProviderCountryCode;
}

- (NSArray)serviceProviderAcceptedNetworks
{
  return self->_serviceProviderAcceptedNetworks;
}

- (NSArray)serviceProviderCapabilities
{
  return self->_serviceProviderCapabilities;
}

- (NSDictionary)serviceProviderDict
{
  return self->_serviceProviderDict;
}

- (NSString)action
{
  return self->_action;
}

- (NSString)merchantID
{
  return self->_merchantID;
}

- (NSArray)defaultSuggestions
{
  return self->_defaultSuggestions;
}

- (NSSet)serviceProviderSupportedCountries
{
  return self->_serviceProviderSupportedCountries;
}

- (NSString)balanceIdentifier
{
  return self->_balanceIdentifier;
}

- (NSString)balanceLocalizedDisplayName
{
  return self->_balanceLocalizedDisplayName;
}

- (NSString)balanceLocalizedDescription
{
  return self->_balanceLocalizedDescription;
}

- (NSString)serviceProviderProductsLocalizedDisplayName
{
  return self->_serviceProviderProductsLocalizedDisplayName;
}

- (NSString)serviceProviderProductsLocalizedDescription
{
  return self->_serviceProviderProductsLocalizedDescription;
}

- (PKDigitalIssuanceServiceProviderProduct)autoTopUpProduct
{
  return self->_autoTopUpProduct;
}

- (NSArray)serviceProviderProducts
{
  return self->_serviceProviderProducts;
}

- (BOOL)isPurchaseBased
{
  return self->_purchaseBased;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProviderProducts, 0);
  objc_storeStrong((id *)&self->_autoTopUpProduct, 0);
  objc_storeStrong((id *)&self->_serviceProviderProductsLocalizedDescription, 0);
  objc_storeStrong((id *)&self->_serviceProviderProductsLocalizedDisplayName, 0);
  objc_storeStrong((id *)&self->_balanceLocalizedDescription, 0);
  objc_storeStrong((id *)&self->_balanceLocalizedDisplayName, 0);
  objc_storeStrong((id *)&self->_balanceIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceProviderSupportedCountries, 0);
  objc_storeStrong((id *)&self->_defaultSuggestions, 0);
  objc_storeStrong((id *)&self->_merchantID, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_serviceProviderDict, 0);
  objc_storeStrong((id *)&self->_serviceProviderCapabilities, 0);
  objc_storeStrong((id *)&self->_serviceProviderAcceptedNetworks, 0);
  objc_storeStrong((id *)&self->_serviceProviderCountryCode, 0);
  objc_storeStrong((id *)&self->_serviceProviderLocalizedDisplayName, 0);
  objc_storeStrong((id *)&self->_serviceProviderIdentifier, 0);
}

@end