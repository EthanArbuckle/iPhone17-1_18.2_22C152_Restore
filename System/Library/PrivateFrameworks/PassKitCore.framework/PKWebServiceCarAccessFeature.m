@interface PKWebServiceCarAccessFeature
- (NSArray)supportedTerminals;
- (NSDictionary)brandIdentifierForBrandCode;
- (PKOSVersionRequirementRange)friendSharingOSVersionRequirement;
- (PKOSVersionRequirementRange)ownerSharingOSVersionRequirement;
- (PKWebServiceCarAccessFeature)initWithDictionary:(id)a3 region:(id)a4;
- (id)localizedNameForIssuerWithIdentifier:(id)a3;
- (id)supportedTerminalForIdentifier:(id)a3;
@end

@implementation PKWebServiceCarAccessFeature

- (PKWebServiceCarAccessFeature)initWithDictionary:(id)a3 region:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(PKWebServiceRegionFeature *)self initWithFeatureType:2 dictionary:v6 region:a4];
  if (!v7) {
    goto LABEL_28;
  }
  v8 = [v6 objectForKey:@"ownerSharingVersionRequirement"];
  v9 = [PKOSVersionRequirementRange alloc];
  if (!v8)
  {
    uint64_t v13 = [(PKOSVersionRequirementRange *)v9 initWithMinimumVersion:0 maximumVersion:0];
    ownerSharingOSVersionRequirement = v7->_ownerSharingOSVersionRequirement;
    v7->_ownerSharingOSVersionRequirement = (PKOSVersionRequirementRange *)v13;

    goto LABEL_8;
  }
  uint64_t v10 = [(PKOSVersionRequirementRange *)v9 initWithDictionary:v8];
  v11 = v7->_ownerSharingOSVersionRequirement;
  v7->_ownerSharingOSVersionRequirement = (PKOSVersionRequirementRange *)v10;

  if (v7->_ownerSharingOSVersionRequirement)
  {
LABEL_8:
    v15 = [v6 objectForKey:@"friendSharingVersionRequirement"];
    v16 = [PKOSVersionRequirementRange alloc];
    if (v15)
    {
      uint64_t v17 = [(PKOSVersionRequirementRange *)v16 initWithDictionary:v8];
      friendSharingOSVersionRequirement = v7->_friendSharingOSVersionRequirement;
      v7->_friendSharingOSVersionRequirement = (PKOSVersionRequirementRange *)v17;

      if (!v7->_friendSharingOSVersionRequirement)
      {
        v19 = PKLogFacilityTypeGetObject(6uLL);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v54 = v8;
          _os_log_impl(&dword_190E10000, v19, OS_LOG_TYPE_DEFAULT, "Invalid friend sharing version range: %@", buf, 0xCu);
        }

        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v21 = [(PKOSVersionRequirementRange *)v16 initWithMinimumVersion:0 maximumVersion:0];
      v22 = v7->_friendSharingOSVersionRequirement;
      v7->_friendSharingOSVersionRequirement = (PKOSVersionRequirementRange *)v21;
    }
    v42 = v15;
    v43 = v8;
    v23 = [v6 objectForKey:@"brandIdentifiers"];
    id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __58__PKWebServiceCarAccessFeature_initWithDictionary_region___block_invoke;
    v50[3] = &unk_1E56DD3E8;
    id v25 = v24;
    id v51 = v25;
    [v23 enumerateKeysAndObjectsUsingBlock:v50];
    v41 = v25;
    uint64_t v26 = [v25 copy];
    brandIdentifierForBrandCode = v7->_brandIdentifierForBrandCode;
    v44 = v7;
    v7->_brandIdentifierForBrandCode = (NSDictionary *)v26;

    id v45 = v6;
    v28 = [v6 PKArrayContaining:objc_opt_class() forKey:@"supportedTerminals"];
    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v28, "count"));
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v30 = v28;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v46 objects:v52 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v47 != v33) {
            objc_enumerationMutation(v30);
          }
          v35 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          v36 = [[PKCarUnlockSupportedTerminal alloc] initWithDictionary:v35];
          if (v36)
          {
            [v29 addObject:v36];
          }
          else
          {
            v37 = PKLogFacilityTypeGetObject(0x16uLL);
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v54 = v35;
              _os_log_impl(&dword_190E10000, v37, OS_LOG_TYPE_DEFAULT, "Invalid supported terminal dictionary: %@", buf, 0xCu);
            }
          }
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v46 objects:v52 count:16];
      }
      while (v32);
    }

    uint64_t v38 = [v29 copy];
    v7 = v44;
    supportedTerminals = v44->_supportedTerminals;
    v44->_supportedTerminals = (NSArray *)v38;

    id v6 = v45;
LABEL_28:
    v20 = v7;
    goto LABEL_29;
  }
  v12 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v54 = v8;
    _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Invalid owner sharing version range: %@", buf, 0xCu);
  }

LABEL_13:
  v20 = 0;
LABEL_29:

  return v20;
}

void __58__PKWebServiceCarAccessFeature_initWithDictionary_region___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  v5 = NSNumber;
  id v6 = a3;
  objc_msgSend(v5, "numberWithInteger:", objc_msgSend(a2, "integerValue"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v6 forKey:v7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brandIdentifierForBrandCode, 0);
  objc_storeStrong((id *)&self->_supportedTerminals, 0);
  objc_storeStrong((id *)&self->_friendSharingOSVersionRequirement, 0);
  objc_storeStrong((id *)&self->_ownerSharingOSVersionRequirement, 0);
}

- (id)localizedNameForIssuerWithIdentifier:(id)a3
{
  v3 = [(PKWebServiceCarAccessFeature *)self supportedTerminalForIdentifier:a3];
  v4 = [v3 partnerName];

  return v4;
}

- (id)supportedTerminalForIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = self->_supportedTerminals;
  id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_msgSend(v9, "partnerIdentifier", (void)v15);
        id v10 = (id)objc_claimAutoreleasedReturnValue();
        id v11 = v4;
        v12 = v11;
        if (v10 == v11)
        {

LABEL_16:
          id v6 = v9;
          goto LABEL_17;
        }
        if (v4 && v10)
        {
          char v13 = [v10 isEqualToString:v11];

          if (v13) {
            goto LABEL_16;
          }
        }
        else
        {
        }
      }
      id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  return v6;
}

- (PKOSVersionRequirementRange)ownerSharingOSVersionRequirement
{
  return self->_ownerSharingOSVersionRequirement;
}

- (PKOSVersionRequirementRange)friendSharingOSVersionRequirement
{
  return self->_friendSharingOSVersionRequirement;
}

- (NSArray)supportedTerminals
{
  return self->_supportedTerminals;
}

- (NSDictionary)brandIdentifierForBrandCode
{
  return self->_brandIdentifierForBrandCode;
}

@end