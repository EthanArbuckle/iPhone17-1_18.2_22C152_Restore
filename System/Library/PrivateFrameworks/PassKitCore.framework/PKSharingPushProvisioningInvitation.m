@interface PKSharingPushProvisioningInvitation
+ (BOOL)supportsSecureCoding;
- (BOOL)configureWithContent:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)metadatas;
- (NSString)provisioningCredentialHash;
- (PKPassShareActivationOptions)activationOptions;
- (PKSharingMesageProprietaryData)proprietaryData;
- (PKSharingPushProvisioningInvitation)initWithDisplayInformation:(id)a3 provisioningVouchersByOEM:(id)a4 activationOptions:(id)a5 proprietaryData:(id)a6;
- (id)description;
@end

@implementation PKSharingPushProvisioningInvitation

- (PKSharingPushProvisioningInvitation)initWithDisplayInformation:(id)a3 provisioningVouchersByOEM:(id)a4 activationOptions:(id)a5 proprietaryData:(id)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v11)
  {
    v14 = [v11 objectForKeyedSubscript:@"appleAuthorizationToken"];

    if (v14)
    {
      v15 = [v11 mutableCopy];
      id v16 = v12;
      v17 = v16;
      v18 = 0;
      if (self && v16)
      {
        v34 = v15;
        id v35 = v12;
        v36 = self;
        id v37 = v11;
        id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        v33 = v17;
        v19 = [v17 options];
        uint64_t v20 = [v19 countByEnumeratingWithState:&v40 objects:buf count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v41;
          do
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v41 != v22) {
                objc_enumerationMutation(v19);
              }
              v24 = *(void **)(*((void *)&v40 + 1) + 8 * i);
              if ([v24 type] == 1)
              {
                id v25 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                [v25 setObject:@"pinCode" forKeyedSubscript:@"type"];
                v26 = [v24 value];
                [v25 setObject:v26 forKeyedSubscript:@"value"];

                uint64_t v27 = [v24 valueLength];
                if (v27)
                {
                  v28 = [NSNumber numberWithInteger:v27];
                  [v25 setObject:v28 forKeyedSubscript:@"length"];
                }
                [v38 addObject:v25];
              }
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v40 objects:buf count:16];
          }
          while (v21);
        }

        v18 = (void *)[v38 copy];
        id v11 = v37;
        id v12 = v35;
        self = v36;
        v15 = v34;
        v17 = v33;
      }

      [v15 setObject:v18 forKeyedSubscript:@"activationOptions"];
      id v29 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v29 setObject:v15 forKeyedSubscript:@"genericData"];
      v30 = [v13 dictionaryRepresentation];
      [v29 setObject:v30 forKeyedSubscript:@"apple"];

      v39.receiver = self;
      v39.super_class = (Class)PKSharingPushProvisioningInvitation;
      self = [(PKSharingMessage *)&v39 initWithContent:v29 format:1 type:1 displayInformation:v10];

      v31 = self;
    }
    else
    {
      v15 = PKLogFacilityTypeGetObject(0x21uLL);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v45 = v11;
        _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "PKSharingPushProvisioningInvitation: provisioningDict missing Apple provisioning information. \n %@", buf, 0xCu);
      }
      v31 = 0;
    }
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (BOOL)configureWithContent:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)PKSharingPushProvisioningInvitation;
  BOOL v5 = [(PKSharingMessage *)&v40 configureWithContent:v4];
  if (!v5) {
    goto LABEL_25;
  }
  v6 = [v4 PKDictionaryForKey:@"genericData"];
  uint64_t v7 = [v6 PKDictionaryForKey:@"appleAuthorizationToken"];
  id v37 = (void *)v7;
  if (v7)
  {
    v8 = [[PKPushProvisioningTarget alloc] initWithProvisioningDict:v7];
    [(PKPushProvisioningTarget *)v8 setSecondarySource:@"share"];
    v9 = [[PKShareablePassMetadata alloc] initWithPushProvisioningTarget:v8];
    id v10 = [(PKShareablePassMetadata *)v9 preview];
    id v11 = [(PKSharingMessage *)self displayInformation];
    id v12 = [v11 title];
    [v10 setLocalizedDescription:v12];

    id v13 = [v11 imageURL];
    [v10 setThumbnailURL:v13];

    id v45 = v9;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
    metadatas = self->_metadatas;
    self->_metadatas = v14;
  }
  else
  {
    v8 = (PKPushProvisioningTarget *)self->_metadatas;
    self->_metadatas = (NSArray *)MEMORY[0x1E4F1CBF0];
  }

  id v16 = [v6 PKArrayContaining:objc_opt_class() forKey:@"activationOptions"];
  if (!v16)
  {
    v17 = 0;
    goto LABEL_24;
  }
  v34 = v6;
  BOOL v35 = v5;
  id v36 = v4;
  id v39 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v33 = v16;
  id obj = v16;
  uint64_t v18 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (!v18) {
    goto LABEL_23;
  }
  uint64_t v19 = v18;
  uint64_t v20 = *(void *)v42;
  do
  {
    for (uint64_t i = 0; i != v19; ++i)
    {
      if (*(void *)v42 != v20) {
        objc_enumerationMutation(obj);
      }
      uint64_t v22 = *(void **)(*((void *)&v41 + 1) + 8 * i);
      objc_msgSend(v22, "PKStringForKey:", @"type", v33);
      v23 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      if (v23 == @"pinCode")
      {

LABEL_18:
        v24 = [[PKPassShareActivationOption alloc] initWithDefaultIdentifierForType:1];
        v26 = [v22 PKStringForKey:@"value"];
        [(PKPassShareActivationOption *)v24 setValue:v26];

        -[PKPassShareActivationOption setValueLength:](v24, "setValueLength:", [v22 PKIntegerForKey:@"length"]);
        [v39 addObject:v24];
LABEL_20:

        continue;
      }
      v24 = (PKPassShareActivationOption *)v23;
      if (!@"pinCode" || !v23)
      {

        goto LABEL_20;
      }
      int v25 = [(__CFString *)v23 isEqualToString:@"pinCode"];

      if (v25) {
        goto LABEL_18;
      }
    }
    uint64_t v19 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
  }
  while (v19);
LABEL_23:

  v17 = [[PKPassShareActivationOptions alloc] initWithOptions:v39];
  id v4 = v36;
  LOBYTE(v5) = v35;
  v6 = v34;
  id v16 = v33;
LABEL_24:

  activationOptions = self->_activationOptions;
  self->_activationOptions = v17;

  v28 = [PKSharingMesageProprietaryData alloc];
  id v29 = [v4 PKDictionaryForKey:@"apple"];
  v30 = [(PKSharingMesageProprietaryData *)v28 initWithDictionary:v29];
  proprietaryData = self->_proprietaryData;
  self->_proprietaryData = v30;

  [(PKSharingMessage *)self setType:1];
LABEL_25:

  return v5;
}

- (NSString)provisioningCredentialHash
{
  v2 = [(NSArray *)self->_metadatas firstObject];
  v3 = [v2 credentialIdentifier];

  if (v3)
  {
    id v4 = [v3 dataUsingEncoding:4];
    BOOL v5 = [v4 SHA256Hash];
    v6 = [v5 base64EncodedStringWithOptions:0];
  }
  else
  {
    v6 = 0;
  }

  return (NSString *)v6;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  id v4 = [(PKSharingMessage *)self identifier];
  [v3 appendFormat:@"identifier: '%@'; ", v4];

  BOOL v5 = PKSharingMessageTypeToString([(PKSharingMessage *)self type]);
  [v3 appendFormat:@"type: '%@'; ", v5];

  v6 = [(PKSharingMessage *)self displayInformation];
  [v3 appendFormat:@"displayInformation: '%@'; ", v6];

  [v3 appendFormat:@"metadatas: '%@'; ", self->_metadatas];
  [v3 appendFormat:@"activationOptions: '%@'; ", self->_activationOptions];
  [v3 appendFormat:@"proprietaryData: '%@'; ", self->_proprietaryData];
  [v3 appendFormat:@">"];
  uint64_t v7 = (void *)[v3 copy];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKSharingPushProvisioningInvitation *)a3;
  BOOL v5 = v4;
  if (v4 == self)
  {
    LOBYTE(self) = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (self)
    {
      v11.receiver = self;
      v11.super_class = (Class)PKSharingPushProvisioningInvitation;
      if ([(PKSharingPushProvisioningInvitation *)&v11 isEqual:v6])
      {
        metadatas = self->_metadatas;
        v8 = v6->_metadatas;
        if (metadatas) {
          BOOL v9 = v8 == 0;
        }
        else {
          BOOL v9 = 1;
        }
        if (v9) {
          LOBYTE(self) = metadatas == v8;
        }
        else {
          LOBYTE(self) = -[NSArray isEqual:](metadatas, "isEqual:");
        }
      }
      else
      {
        LOBYTE(self) = 0;
      }
    }
  }
  else
  {
    LOBYTE(self) = 0;
  }

  return (char)self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)metadatas
{
  return self->_metadatas;
}

- (PKPassShareActivationOptions)activationOptions
{
  return self->_activationOptions;
}

- (PKSharingMesageProprietaryData)proprietaryData
{
  return self->_proprietaryData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proprietaryData, 0);
  objc_storeStrong((id *)&self->_activationOptions, 0);
  objc_storeStrong((id *)&self->_metadatas, 0);
}

@end