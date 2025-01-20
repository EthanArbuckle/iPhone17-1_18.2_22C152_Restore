@interface PKAuxiliaryCapabilityKeyCreationMetadataRequest
- (NSArray)capabilityStates;
- (PKAuxiliaryCapabilityKeyCreationMetadataRequest)init;
- (PKAuxiliaryCapabilityKeyCreationMetadataRequest)initWithCapabilityStates:(id)a3 pass:(id)a4;
- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5;
@end

@implementation PKAuxiliaryCapabilityKeyCreationMetadataRequest

- (PKAuxiliaryCapabilityKeyCreationMetadataRequest)init
{
  return 0;
}

- (PKAuxiliaryCapabilityKeyCreationMetadataRequest)initWithCapabilityStates:(id)a3 pass:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKAuxiliaryCapabilityKeyCreationMetadataRequest;
  v9 = [(PKAuxiliaryCapabilityWebServiceRequest *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_capabilityStates, a3);
    [(PKAuxiliaryCapabilityWebServiceRequest *)v10 setPass:v8];
  }

  return v10;
}

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  v32[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v32[0] = @"devices";
  v32[1] = v9;
  v25 = v9;
  v32[2] = @"auxiliaryCapabilityKeyCreationMetadata";
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:3];
  v26 = v8;
  objc_super v12 = [(PKAuxiliaryCapabilityWebServiceRequest *)self _murlRequestWithServiceURL:v8 endpointComponents:v11 queryParameters:0 appleAccountInformation:v10];

  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v14 = [(NSArray *)self->_capabilityStates pk_arrayByApplyingBlock:&__block_literal_global_39];
  [v13 setObject:v14 forKeyedSubscript:@"capabilityStates"];

  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v16 = [(PKAuxiliaryCapabilityWebServiceRequest *)self pass];
  v17 = [v16 devicePaymentApplications];

  uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = [*(id *)(*((void *)&v27 + 1) + 8 * i) dpanIdentifier];
        [v15 addObject:v22];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v19);
  }

  [v13 setObject:v15 forKeyedSubscript:@"dpanIdentifiers"];
  v23 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v13];
  [v12 setHTTPBody:v23];

  [v12 setHTTPMethod:@"POST"];
  return v12;
}

uint64_t __118__PKAuxiliaryCapabilityKeyCreationMetadataRequest__urlRequestWithServiceURL_deviceIdentifier_appleAccountInformation___block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

- (NSArray)capabilityStates
{
  return self->_capabilityStates;
}

- (void).cxx_destruct
{
}

@end