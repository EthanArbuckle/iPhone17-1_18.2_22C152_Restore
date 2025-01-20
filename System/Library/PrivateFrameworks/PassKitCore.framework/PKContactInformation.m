@interface PKContactInformation
+ (BOOL)supportsSecureCoding;
+ (id)_keychainWrapper;
+ (id)contactInformationFromKeychain;
+ (void)deleteContactInformationFromKeychain;
+ (void)saveContactInformationToKeychain:(id)a3;
- (NSArray)emailAddresses;
- (NSArray)phoneNumbers;
- (NSArray)postalAddresses;
- (PKContactInformation)init;
- (PKContactInformation)initWithCoder:(id)a3;
- (PKContactInformation)initWithDictionary:(id)a3;
- (PKContactInformation)initWithKeychainData:(id)a3;
- (PKContactInformation)initWithPostalAddresses:(id)a3 emailAddresses:(id)a4 phoneNumbers:(id)a5;
- (id)description;
- (id)keychainData;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKContactInformation

+ (id)contactInformationFromKeychain
{
  v3 = [a1 _keychainWrapper];
  v4 = [v3 objectForKey:*MEMORY[0x1E4F3BD38]];
  v5 = (void *)[objc_alloc((Class)a1) initWithKeychainData:v4];

  return v5;
}

+ (void)saveContactInformationToKeychain:(id)a3
{
  id v5 = [a3 keychainData];
  if (v5)
  {
    v4 = [a1 _keychainWrapper];
    [v4 setObject:v5 forKey:*MEMORY[0x1E4F3BD38]];
  }
}

+ (void)deleteContactInformationFromKeychain
{
  id v2 = [a1 _keychainWrapper];
  [v2 resetKeychainItem];
}

- (PKContactInformation)init
{
  return [(PKContactInformation *)self initWithPostalAddresses:0 emailAddresses:0 phoneNumbers:0];
}

- (PKContactInformation)initWithPostalAddresses:(id)a3 emailAddresses:(id)a4 phoneNumbers:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKContactInformation;
  v12 = [(PKContactInformation *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_postalAddresses, a3);
    objc_storeStrong((id *)&v13->_emailAddresses, a4);
    objc_storeStrong((id *)&v13->_phoneNumbers, a5);
  }

  return v13;
}

- (PKContactInformation)initWithDictionary:(id)a3
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 PKArrayForKey:@"addresses"];
  unint64_t v5 = 0x1E4F1C000uLL;
  v55 = (void *)v4;
  id v56 = v3;
  if (v4)
  {
    v6 = (void *)v4;
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    obuint64_t j = v6;
    uint64_t v8 = [obj countByEnumeratingWithState:&v68 objects:v77 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v69;
      uint64_t v11 = *MEMORY[0x1E4F1B700];
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v69 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v68 + 1) + 8 * i);
          id v14 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
          objc_super v15 = [MEMORY[0x1E4F1BA80] postalAddressFromWebServiceDictionaryRepresentation:v13];
          if (v15)
          {
            v16 = (void *)[objc_alloc(MEMORY[0x1E4F1BA20]) initWithLabel:v11 value:v15];
            v76 = v16;
            v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v76 count:1];
            [v14 setPostalAddresses:v17];

            v18 = (void *)[v14 copy];
            [v7 addObject:v18];
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v68 objects:v77 count:16];
      }
      while (v9);
    }

    v19 = v7;
    if ([v7 count]) {
      v53 = (void *)[v7 copy];
    }
    else {
      v53 = 0;
    }
    id v3 = v56;

    unint64_t v5 = 0x1E4F1C000uLL;
  }
  else
  {
    v53 = 0;
  }
  uint64_t v20 = [v3 PKArrayForKey:@"emails"];
  v52 = (void *)v20;
  if (v20)
  {
    v21 = (void *)v20;
    id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id obja = v21;
    uint64_t v23 = [obja countByEnumeratingWithState:&v64 objects:v75 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v65;
      uint64_t v26 = *MEMORY[0x1E4F1B700];
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v65 != v25) {
            objc_enumerationMutation(obja);
          }
          uint64_t v28 = *(void *)(*((void *)&v64 + 1) + 8 * j);
          id v29 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
          v30 = (void *)[objc_alloc(MEMORY[0x1E4F1BA20]) initWithLabel:v26 value:v28];
          v74 = v30;
          v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v74 count:1];
          [v29 setEmailAddresses:v31];

          v32 = (void *)[v29 copy];
          [v22 addObject:v32];
        }
        uint64_t v24 = [obja countByEnumeratingWithState:&v64 objects:v75 count:16];
      }
      while (v24);
    }

    v33 = (void *)[v22 copy];
    id v3 = v56;
    unint64_t v5 = 0x1E4F1C000;
  }
  else
  {
    v33 = 0;
  }
  v34 = [v3 PKArrayForKey:@"phoneNumbers"];
  if (v34)
  {
    v51 = v33;
    id v35 = objc_alloc_init(*(Class *)(v5 + 2632));
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    v50 = v34;
    id objb = v34;
    uint64_t v36 = [objb countByEnumeratingWithState:&v60 objects:v73 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v61;
      uint64_t v39 = *MEMORY[0x1E4F1B700];
      do
      {
        for (uint64_t k = 0; k != v37; ++k)
        {
          if (*(void *)v61 != v38) {
            objc_enumerationMutation(objb);
          }
          uint64_t v41 = *(void *)(*((void *)&v60 + 1) + 8 * k);
          id v42 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
          v43 = (void *)[objc_alloc(MEMORY[0x1E4F1BA70]) initWithStringValue:v41];
          if (v43)
          {
            v44 = (void *)[objc_alloc(MEMORY[0x1E4F1BA20]) initWithLabel:v39 value:v43];
            v72 = v44;
            v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v72 count:1];
            [v42 setPhoneNumbers:v45];

            v46 = (void *)[v42 copy];
            [v35 addObject:v46];
          }
        }
        uint64_t v37 = [objb countByEnumeratingWithState:&v60 objects:v73 count:16];
      }
      while (v37);
    }

    if ([v35 count]) {
      v47 = (void *)[v35 copy];
    }
    else {
      v47 = 0;
    }
    id v3 = v56;
    v33 = v51;

    v34 = v50;
  }
  else
  {
    v47 = 0;
  }
  v48 = -[PKContactInformation initWithPostalAddresses:emailAddresses:phoneNumbers:](self, "initWithPostalAddresses:emailAddresses:phoneNumbers:", v53, v33, v47, v50);

  return v48;
}

- (PKContactInformation)initWithKeychainData:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    unint64_t v5 = 0;
    goto LABEL_7;
  }
  id v11 = 0;
  unint64_t v5 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v11];
  id v6 = v11;
  if (!v6)
  {
LABEL_7:
    unint64_t v5 = v5;
    uint64_t v9 = v5;
    goto LABEL_8;
  }
  id v7 = v6;
  uint64_t v8 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v13 = self;
    __int16 v14 = 2112;
    objc_super v15 = v7;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "%@: Error initializing from Keychain data: %@", buf, 0x16u);
  }

  uint64_t v9 = 0;
LABEL_8:

  return v9;
}

- (id)keychainData
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v8 = 0;
  id v3 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v8];
  id v4 = v8;
  if (v4)
  {
    unint64_t v5 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v10 = self;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "%@: Error serializing data for Keychain: %@", buf, 0x16u);
    }

    id v6 = 0;
  }
  else
  {
    id v6 = v3;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  postalAddresses = self->_postalAddresses;
  id v5 = a3;
  [v5 encodeObject:postalAddresses forKey:@"postalAddresses"];
  [v5 encodeObject:self->_emailAddresses forKey:@"emailAddresses"];
  [v5 encodeObject:self->_phoneNumbers forKey:@"phoneNumbers"];
}

- (PKContactInformation)initWithCoder:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  id v6 = [v4 alloc];
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  id v8 = (void *)[v6 initWithArray:v7];

  uint64_t v9 = [v5 decodeObjectOfClasses:v8 forKey:@"postalAddresses"];
  uint64_t v10 = [v5 decodeObjectOfClasses:v8 forKey:@"emailAddresses"];
  __int16 v11 = [v5 decodeObjectOfClasses:v8 forKey:@"phoneNumbers"];

  id v12 = [(PKContactInformation *)self initWithPostalAddresses:v9 emailAddresses:v10 phoneNumbers:v11];
  return v12;
}

- (id)description
{
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"<%@: %p; ",
                 objc_opt_class(),
                 self);
  [v3 appendFormat:@"%@: %@; ", @"postalAddresses", self->_postalAddresses];
  [v3 appendFormat:@"%@: %@; ", @"emailAddresses", self->_emailAddresses];
  [v3 appendFormat:@"%@: %@; ", @"phoneNumbers", self->_phoneNumbers];
  [v3 appendFormat:@">"];
  id v4 = (void *)[v3 copy];

  return v4;
}

+ (id)_keychainWrapper
{
  BOOL v2 = +[PKPaymentOptionsSynchronization shouldSyncToCloud];
  if (v2)
  {
    id v3 = @"contactInformation";
  }
  else
  {
    id v3 = [@"contactInformation" stringByAppendingFormat:@"Local"];
  }
  id v4 = [[PKKeychainItemWrapper alloc] initWithIdentifier:v3 accessGroup:@"com.apple.PassbookUIService" serviceName:@"com.apple.passkit" type:v2 invisible:0 accessibility:1];
  [(PKKeychainItemWrapper *)v4 setLabel:@"com.apple.passkit"];

  return v4;
}

- (NSArray)postalAddresses
{
  return self->_postalAddresses;
}

- (NSArray)emailAddresses
{
  return self->_emailAddresses;
}

- (NSArray)phoneNumbers
{
  return self->_phoneNumbers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_postalAddresses, 0);
}

@end