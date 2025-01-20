@interface PKPaymentRequirementsResponse
+ (BOOL)supportsSecureCoding;
+ (id)emptyRequirementsResponse;
- (NSArray)possibleProducts;
- (NSArray)requiredPaymentSetupFields;
- (NSString)nonce;
- (NSString)productIdentifier;
- (NSString)region;
- (NSURL)learnMoreURL;
- (PKPaymentRequirementsResponse)initWithData:(id)a3 headers:(id)a4;
- (PKPaymentRequirementsResponse)initWithProduct:(id)a3;
- (PKPaymentRequirementsResponse)initWithProvisioningMethodMetadata:(id)a3;
- (int64_t)status;
@end

@implementation PKPaymentRequirementsResponse

- (PKPaymentRequirementsResponse)initWithData:(id)a3 headers:(id)a4
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v62.receiver = self;
  v62.super_class = (Class)PKPaymentRequirementsResponse;
  v7 = [(PKWebServiceResponse *)&v62 initWithData:a3 headers:v6];
  v8 = v7;
  if (v7)
  {
    v9 = [(PKWebServiceResponse *)v7 JSONObject];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([v9 objectForKeyedSubscript:@"requirementsStatus"],
          v10 = objc_claimAutoreleasedReturnValue(),
          v10,
          v10))
    {
      v11 = [v9 objectForKeyedSubscript:@"requirementsStatus"];
      v8->_int64_t status = [v11 integerValue];

      v12 = [v9 PKStringForKey:@"nonce"];
      uint64_t v13 = [v12 copy];
      nonce = v8->_nonce;
      v8->_nonce = (NSString *)v13;

      uint64_t v15 = [v6 PKStringForKey:@"x-pod-region"];
      region = v8->_region;
      v8->_region = (NSString *)v15;

      int64_t status = v8->_status;
      if (status == 2)
      {
        v18 = [v9 PKArrayContaining:objc_opt_class() forKey:@"possibleProducts"];
        if (!v18) {
          goto LABEL_18;
        }
        v51 = v8;
        id obja = v9;
        productIdentifier = [MEMORY[0x1E4F1CA48] array];
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        id v38 = v18;
        uint64_t v39 = [v38 countByEnumeratingWithState:&v54 objects:v67 count:16];
        if (v39)
        {
          uint64_t v40 = v39;
          uint64_t v41 = *(void *)v55;
          do
          {
            uint64_t v42 = 0;
            do
            {
              if (*(void *)v55 != v41) {
                objc_enumerationMutation(v38);
              }
              uint64_t v43 = *(void *)(*((void *)&v54 + 1) + 8 * v42);
              v44 = objc_alloc_init(PKPaymentSetupProduct);
              [(PKPaymentSetupProduct *)v44 updateWithProductDictionary:v43];
              [productIdentifier safelyAddObject:v44];

              ++v42;
            }
            while (v40 != v42);
            uint64_t v40 = [v38 countByEnumeratingWithState:&v54 objects:v67 count:16];
          }
          while (v40);
        }

        uint64_t v45 = [MEMORY[0x1E4F1C978] arrayWithArray:productIdentifier];
        v8 = v51;
        possibleProducts = v51->_possibleProducts;
        v51->_possibleProducts = (NSArray *)v45;

        v9 = obja;
      }
      else if (status == 1)
      {
        id v49 = v6;
        v50 = v8;
        v18 = [MEMORY[0x1E4F1CA48] array];
        long long v58 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        id obj = [v9 PKArrayContaining:objc_opt_class() forKey:@"requiredFields"];
        uint64_t v19 = [obj countByEnumeratingWithState:&v58 objects:v68 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v59;
          do
          {
            uint64_t v22 = 0;
            do
            {
              v23 = v18;
              if (*(void *)v59 != v21) {
                objc_enumerationMutation(obj);
              }
              uint64_t v24 = *(void *)(*((void *)&v58 + 1) + 8 * v22);
              [v9 PKDictionaryForKey:@"requiredFieldOptions"];
              v26 = v25 = v9;
              v27 = [v26 PKDictionaryForKey:v24];

              v9 = v25;
              v28 = +[PKPaymentSetupField paymentSetupFieldWithIdentifier:v24 configuration:v27];
              v18 = v23;
              [v23 safelyAddObject:v28];

              ++v22;
            }
            while (v20 != v22);
            uint64_t v20 = [obj countByEnumeratingWithState:&v58 objects:v68 count:16];
          }
          while (v20);
        }

        uint64_t v29 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v18];
        v8 = v50;
        requiredPaymentSetupFields = v50->_requiredPaymentSetupFields;
        v50->_requiredPaymentSetupFields = (NSArray *)v29;

        uint64_t v31 = [v9 PKStringForKey:@"productIdentifier"];
        productIdentifier = v50->_productIdentifier;
        v50->_productIdentifier = (NSString *)v31;
        id v6 = v49;
      }
      else
      {
        v47 = (void *)MEMORY[0x1E4F1CB10];
        v18 = [v9 objectForKeyedSubscript:@"learnMoreURL"];
        uint64_t v48 = [v47 URLWithString:v18];
        productIdentifier = &v8->_learnMoreURL->super;
        v8->_learnMoreURL = (NSURL *)v48;
      }
    }
    else
    {
      productIdentifier = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(productIdentifier, OS_LOG_TYPE_DEFAULT))
      {
        v33 = (objc_class *)objc_opt_class();
        v34 = NSStringFromClass(v33);
        v35 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v64 = v34;
        __int16 v65 = 2112;
        v66 = v35;
        id v36 = v35;
        _os_log_impl(&dword_190E10000, productIdentifier, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);
      }
      v18 = v8;
      v8 = 0;
    }

LABEL_18:
  }

  return v8;
}

- (PKPaymentRequirementsResponse)initWithProduct:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentRequirementsResponse;
  v5 = [(PKPaymentRequirementsResponse *)&v15 init];
  id v6 = v5;
  if (v5)
  {
    v5->_int64_t status = 1;
    v7 = [v4 requiredFields];
    uint64_t v8 = [v7 copy];
    requiredPaymentSetupFields = v6->_requiredPaymentSetupFields;
    v6->_requiredPaymentSetupFields = (NSArray *)v8;

    v10 = [v4 configuration];
    v11 = [v10 productIdentifier];
    uint64_t v12 = [v11 copy];
    productIdentifier = v6->_productIdentifier;
    v6->_productIdentifier = (NSString *)v12;
  }
  return v6;
}

- (PKPaymentRequirementsResponse)initWithProvisioningMethodMetadata:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentRequirementsResponse;
  v5 = [(PKPaymentRequirementsResponse *)&v14 init];
  id v6 = v5;
  if (v5)
  {
    v5->_int64_t status = 1;
    v7 = [v4 requiredFields];
    uint64_t v8 = [v7 copy];
    requiredPaymentSetupFields = v6->_requiredPaymentSetupFields;
    v6->_requiredPaymentSetupFields = (NSArray *)v8;

    v10 = [v4 productIdentifier];
    uint64_t v11 = [v10 copy];
    productIdentifier = v6->_productIdentifier;
    v6->_productIdentifier = (NSString *)v11;
  }
  return v6;
}

+ (id)emptyRequirementsResponse
{
  v2 = objc_alloc_init(PKPaymentRequirementsResponse);
  v2->_int64_t status = 1;
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)status
{
  return self->_status;
}

- (NSArray)requiredPaymentSetupFields
{
  return self->_requiredPaymentSetupFields;
}

- (NSString)productIdentifier
{
  return self->_productIdentifier;
}

- (NSArray)possibleProducts
{
  return self->_possibleProducts;
}

- (NSURL)learnMoreURL
{
  return self->_learnMoreURL;
}

- (NSString)nonce
{
  return self->_nonce;
}

- (NSString)region
{
  return self->_region;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_learnMoreURL, 0);
  objc_storeStrong((id *)&self->_possibleProducts, 0);
  objc_storeStrong((id *)&self->_productIdentifier, 0);
  objc_storeStrong((id *)&self->_requiredPaymentSetupFields, 0);
}

@end