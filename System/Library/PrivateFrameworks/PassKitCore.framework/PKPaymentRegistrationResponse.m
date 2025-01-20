@interface PKPaymentRegistrationResponse
- (NSArray)certificates;
- (NSDictionary)regions;
- (NSNumber)cardsOnFile;
- (NSNumber)maxCards;
- (NSString)deviceIdentifier;
- (NSString)environmentName;
- (NSString)primaryRegion;
- (NSURL)brokerURL;
- (NSURL)paymentServicesURL;
- (NSURL)trustedServiceManagerURL;
- (PKPaymentRegistrationResponse)initWithData:(id)a3;
- (void)setBrokerURL:(id)a3;
- (void)setCardsOnFile:(id)a3;
- (void)setCertificates:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setEnvironmentName:(id)a3;
- (void)setMaxCards:(id)a3;
- (void)setPaymentServicesURL:(id)a3;
- (void)setRegions:(id)a3;
- (void)setTrustedServiceManagerURL:(id)a3;
@end

@implementation PKPaymentRegistrationResponse

- (PKPaymentRegistrationResponse)initWithData:(id)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  v64.receiver = self;
  v64.super_class = (Class)PKPaymentRegistrationResponse;
  v3 = [(PKWebServiceResponse *)&v64 initWithData:a3];
  if (!v3) {
    return 0;
  }
  v4 = v3;
  v5 = [(PKWebServiceResponse *)v3 JSONObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v5 PKStringForKey:@"deviceIdentifier"];
    deviceIdentifier = v4->_deviceIdentifier;
    v4->_deviceIdentifier = (NSString *)v6;

    uint64_t v8 = [v5 PKNumberForKey:@"cardsOnFile"];
    cardsOnFile = v4->_cardsOnFile;
    v4->_cardsOnFile = (NSNumber *)v8;

    uint64_t v10 = [v5 PKNumberForKey:@"maxCards"];
    maxCards = v4->_maxCards;
    v4->_maxCards = (NSNumber *)v10;

    uint64_t v12 = [v5 PKStringForKey:@"primaryRegion"];
    primaryRegion = v4->_primaryRegion;
    v4->_primaryRegion = (NSString *)v12;

    uint64_t v14 = [v5 PKStringForKey:@"environmentName"];
    environmentName = v4->_environmentName;
    v55 = v4;
    v4->_environmentName = (NSString *)v14;

    v16 = [v5 PKDictionaryForKey:@"regions"];
    v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v54 = v5;
    uint64_t v18 = [v5 PKBoolForKey:@"hasPeerPaymentAccount"];
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    v19 = v16;
    uint64_t v20 = [(PKPaymentRegistrationResponse *)v19 countByEnumeratingWithState:&v60 objects:v70 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v61;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v61 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v60 + 1) + 8 * i);
          v25 = [PKPaymentWebServiceRegion alloc];
          v26 = [(PKPaymentRegistrationResponse *)v19 PKDictionaryForKey:v24];
          v27 = [(PKPaymentWebServiceRegion *)v25 initWithDictionary:v26 hasPeerPaymentAccount:v18];
          [v17 setObject:v27 forKeyedSubscript:v24];
        }
        uint64_t v21 = [(PKPaymentRegistrationResponse *)v19 countByEnumeratingWithState:&v60 objects:v70 count:16];
      }
      while (v21);
    }

    [(PKPaymentRegistrationResponse *)v4 setRegions:v17];
    v28 = [v54 objectForKey:@"brokerURL"];
    if (v28)
    {
      uint64_t v29 = [objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v28];
      brokerURL = v4->_brokerURL;
      v4->_brokerURL = (NSURL *)v29;
    }
    uint64_t v31 = [v54 objectForKey:@"trustedServiceManagerURL"];
    if (v31)
    {
      uint64_t v32 = [objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v31];
      trustedServiceManagerURL = v4->_trustedServiceManagerURL;
      v4->_trustedServiceManagerURL = (NSURL *)v32;
    }
    v34 = objc_msgSend(v54, "objectForKey:", @"paymentServicesURL", v31);
    if (v34)
    {
      uint64_t v35 = [objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v34];
      paymentServicesURL = v4->_paymentServicesURL;
      v4->_paymentServicesURL = (NSURL *)v35;
    }
    v37 = [v54 objectForKey:@"certificates"];
    id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v39 = v37;
    uint64_t v40 = [v39 countByEnumeratingWithState:&v56 objects:v69 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v57;
      do
      {
        for (uint64_t j = 0; j != v41; ++j)
        {
          if (*(void *)v57 != v42) {
            objc_enumerationMutation(v39);
          }
          v44 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:*(void *)(*((void *)&v56 + 1) + 8 * j) options:0];
          if (v44) {
            [v38 addObject:v44];
          }
        }
        uint64_t v41 = [v39 countByEnumeratingWithState:&v56 objects:v69 count:16];
      }
      while (v41);
    }

    uint64_t v45 = [v38 copy];
    v46 = v55;
    certificates = v55->_certificates;
    v55->_certificates = (NSArray *)v45;

    v5 = v54;
  }
  else
  {
    v17 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v48 = (objc_class *)objc_opt_class();
      v49 = NSStringFromClass(v48);
      v50 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v66 = v49;
      __int16 v67 = 2112;
      v68 = v50;
      id v51 = v50;
      _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);
    }
    v19 = v4;
    v46 = 0;
  }

  return v46;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (NSNumber)cardsOnFile
{
  return self->_cardsOnFile;
}

- (void)setCardsOnFile:(id)a3
{
}

- (NSNumber)maxCards
{
  return self->_maxCards;
}

- (void)setMaxCards:(id)a3
{
}

- (NSString)primaryRegion
{
  return self->_primaryRegion;
}

- (NSDictionary)regions
{
  return self->_regions;
}

- (void)setRegions:(id)a3
{
}

- (NSString)environmentName
{
  return self->_environmentName;
}

- (void)setEnvironmentName:(id)a3
{
}

- (NSURL)brokerURL
{
  return self->_brokerURL;
}

- (void)setBrokerURL:(id)a3
{
}

- (NSURL)trustedServiceManagerURL
{
  return self->_trustedServiceManagerURL;
}

- (void)setTrustedServiceManagerURL:(id)a3
{
}

- (NSURL)paymentServicesURL
{
  return self->_paymentServicesURL;
}

- (void)setPaymentServicesURL:(id)a3
{
}

- (NSArray)certificates
{
  return self->_certificates;
}

- (void)setCertificates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificates, 0);
  objc_storeStrong((id *)&self->_paymentServicesURL, 0);
  objc_storeStrong((id *)&self->_trustedServiceManagerURL, 0);
  objc_storeStrong((id *)&self->_brokerURL, 0);
  objc_storeStrong((id *)&self->_environmentName, 0);
  objc_storeStrong((id *)&self->_regions, 0);
  objc_storeStrong((id *)&self->_primaryRegion, 0);
  objc_storeStrong((id *)&self->_maxCards, 0);
  objc_storeStrong((id *)&self->_cardsOnFile, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

@end