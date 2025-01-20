@interface PKPaymentSendOwnershipTokensRequest
- (NSSet)passOwnershipTokens;
- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 deviceMetadata:(id)a5 appleAccountInformation:(id)a6;
- (unint64_t)reason;
- (void)setPassOwnershipTokens:(id)a3;
- (void)setReason:(unint64_t)a3;
@end

@implementation PKPaymentSendOwnershipTokensRequest

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 deviceMetadata:(id)a5 appleAccountInformation:(id)a6
{
  v39[3] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v39[0] = @"devices";
  v39[1] = v11;
  v32 = v11;
  v39[2] = @"ownershipTokens";
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:3];
  v33 = v10;
  v31 = v13;
  v15 = [(PKPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v10 endpointComponents:v14 queryParameters:0 appleAccountInformation:v13];

  [v15 setHTTPMethod:@"POST"];
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v12)
  {
    v17 = [v12 dictionaryRepresentation];
    [v16 setObject:v17 forKey:@"deviceMetadata"];
  }
  unint64_t reason = self->_reason;
  if (reason > 2) {
    v19 = @"unknown";
  }
  else {
    v19 = off_1E56EDE78[reason];
  }
  [v16 setObject:v19 forKey:@"reason"];
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v21 = self->_passOwnershipTokens;
  uint64_t v22 = [(NSSet *)v21 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v35 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = [*(id *)(*((void *)&v34 + 1) + 8 * i) dictionaryRepresentation];
        [v20 addObject:v26];
      }
      uint64_t v23 = [(NSSet *)v21 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v23);
  }

  if ([v20 count])
  {
    v27 = (void *)[v20 copy];
    [v16 setObject:v27 forKey:@"ownershipTokens"];
  }
  v28 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v16];
  [v15 setHTTPBody:v28];

  v29 = (void *)[v15 copy];
  return v29;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (void)setReason:(unint64_t)a3
{
  self->_unint64_t reason = a3;
}

- (NSSet)passOwnershipTokens
{
  return self->_passOwnershipTokens;
}

- (void)setPassOwnershipTokens:(id)a3
{
}

- (void).cxx_destruct
{
}

@end