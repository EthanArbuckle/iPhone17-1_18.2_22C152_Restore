@interface WiFiAwarePublishDatapathSecurityConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)passphraseList;
- (NSArray)pmkList;
- (NSData)pmkID;
- (WiFiAwarePairingConfiguration)pairingConfiguration;
- (WiFiAwarePublishDatapathSecurityConfiguration)initWithCoder:(id)a3;
- (WiFiAwarePublishDatapathSecurityConfiguration)initWithPMK:(id)a3 andPMKID:(id)a4;
- (WiFiAwarePublishDatapathSecurityConfiguration)initWithPMKList:(id)a3 passphraseList:(id)a4;
- (WiFiAwarePublishDatapathSecurityConfiguration)initWithPairingConfiguration:(id)a3 usingPairingDelegate:(id)a4;
- (WiFiAwarePublisherPairingDelegate)pairingDelegate;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setPairingDelegate:(id)a3;
@end

@implementation WiFiAwarePublishDatapathSecurityConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WiFiAwarePublishDatapathSecurityConfiguration *)self pmkList];
  [v4 encodeObject:v5 forKey:@"WiFiAwarePublishDatapathSecurityConfiguration.pmkList"];

  v6 = [(WiFiAwarePublishDatapathSecurityConfiguration *)self passphraseList];
  [v4 encodeObject:v6 forKey:@"WiFiAwarePublishDatapathSecurityConfiguration.passphraseList"];

  v7 = [(WiFiAwarePublishDatapathSecurityConfiguration *)self pmkID];
  [v4 encodeObject:v7 forKey:@"WiFiAwarePublishDatapathSecurityConfiguration.pmkID"];

  id v8 = [(WiFiAwarePublishDatapathSecurityConfiguration *)self pairingConfiguration];
  [v4 encodeObject:v8 forKey:@"WiFiAwarePublishDatapathSecurityConfiguration.pairingConfiguration"];
}

- (WiFiAwarePublishDatapathSecurityConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"WiFiAwarePublishDatapathSecurityConfiguration.pmkList"];
  v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"WiFiAwarePublishDatapathSecurityConfiguration.passphraseList"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwarePublishDatapathSecurityConfiguration.pairingConfiguration"];
  if ([v6 count] || objc_msgSend(v5, "count") != 1)
  {
    if (v7)
    {
      v12 = [(WiFiAwarePublishDatapathSecurityConfiguration *)self initWithPairingConfiguration:v7 usingPairingDelegate:0];
LABEL_8:
      v11 = v12;
      goto LABEL_9;
    }
LABEL_7:
    v12 = [(WiFiAwarePublishDatapathSecurityConfiguration *)self initWithPMKList:v5 passphraseList:v6];
    goto LABEL_8;
  }
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwarePublishDatapathSecurityConfiguration.pmkID"];
  if (!v8) {
    goto LABEL_7;
  }
  v9 = (void *)v8;
  v10 = [v5 firstObject];
  v11 = [(WiFiAwarePublishDatapathSecurityConfiguration *)self initWithPMK:v10 andPMKID:v9];

LABEL_9:
  return v11;
}

- (WiFiAwarePublishDatapathSecurityConfiguration)initWithPMKList:(id)a3 passphraseList:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)WiFiAwarePublishDatapathSecurityConfiguration;
  uint64_t v8 = [(WiFiAwarePublishDatapathSecurityConfiguration *)&v16 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    pmkList = v8->_pmkList;
    v8->_pmkList = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    passphraseList = v8->_passphraseList;
    v8->_passphraseList = (NSArray *)v11;

    pmkID = v8->_pmkID;
    v8->_pmkID = 0;

    pairingConfiguration = v8->_pairingConfiguration;
    v8->_pairingConfiguration = 0;
  }
  return v8;
}

- (WiFiAwarePublishDatapathSecurityConfiguration)initWithPMK:(id)a3 andPMKID:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)WiFiAwarePublishDatapathSecurityConfiguration;
  uint64_t v8 = [(WiFiAwarePublishDatapathSecurityConfiguration *)&v17 init];
  if (v8)
  {
    uint64_t v9 = (void *)[v6 copy];
    v18[0] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    pmkList = v8->_pmkList;
    v8->_pmkList = (NSArray *)v10;

    passphraseList = v8->_passphraseList;
    v8->_passphraseList = (NSArray *)MEMORY[0x1E4F1CBF0];

    uint64_t v13 = [v7 copy];
    pmkID = v8->_pmkID;
    v8->_pmkID = (NSData *)v13;

    pairingConfiguration = v8->_pairingConfiguration;
    v8->_pairingConfiguration = 0;
  }
  return v8;
}

- (WiFiAwarePublishDatapathSecurityConfiguration)initWithPairingConfiguration:(id)a3 usingPairingDelegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)WiFiAwarePublishDatapathSecurityConfiguration;
  uint64_t v8 = [(WiFiAwarePublishDatapathSecurityConfiguration *)&v17 init];
  uint64_t v9 = v8;
  if (v8)
  {
    pmkList = v8->_pmkList;
    uint64_t v11 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v8->_pmkList = (NSArray *)MEMORY[0x1E4F1CBF0];

    passphraseList = v9->_passphraseList;
    v9->_passphraseList = v11;

    pmkID = v9->_pmkID;
    v9->_pmkID = 0;

    uint64_t v14 = [v6 copy];
    pairingConfiguration = v9->_pairingConfiguration;
    v9->_pairingConfiguration = (WiFiAwarePairingConfiguration *)v14;

    objc_storeWeak((id *)&v9->_pairingDelegate, v7);
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WiFiAwarePublishDatapathSecurityConfiguration *)a3;
  if (self == v4)
  {
    v5 = 0;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v14 = 0;
    v5 = 0;
    goto LABEL_14;
  }
  v5 = v4;
  id v6 = [(WiFiAwarePublishDatapathSecurityConfiguration *)self pmkList];
  id v7 = [(WiFiAwarePublishDatapathSecurityConfiguration *)v5 pmkList];
  if (([v6 isEqualToArray:v7] & 1) == 0)
  {
LABEL_12:

LABEL_13:
    BOOL v14 = 0;
    goto LABEL_14;
  }
  uint64_t v8 = [(WiFiAwarePublishDatapathSecurityConfiguration *)self passphraseList];
  uint64_t v9 = [(WiFiAwarePublishDatapathSecurityConfiguration *)v5 passphraseList];
  if (![v8 isEqualToArray:v9])
  {

    goto LABEL_12;
  }
  uint64_t v10 = [(WiFiAwarePublishDatapathSecurityConfiguration *)self pmkID];
  uint64_t v11 = [(WiFiAwarePublishDatapathSecurityConfiguration *)v5 pmkID];
  v12 = (void *)v11;
  if (v10 == (void *)v11)
  {
    v26 = (void *)v11;
  }
  else
  {
    uint64_t v13 = [(WiFiAwarePublishDatapathSecurityConfiguration *)self pmkID];
    v25 = [(WiFiAwarePublishDatapathSecurityConfiguration *)v5 pmkID];
    if (!objc_msgSend(v13, "isEqual:"))
    {
      char v21 = 1;
      goto LABEL_22;
    }
    v24 = v13;
    v26 = v12;
  }
  objc_super v16 = [(WiFiAwarePublishDatapathSecurityConfiguration *)self pairingConfiguration];
  uint64_t v17 = [(WiFiAwarePublishDatapathSecurityConfiguration *)v5 pairingConfiguration];
  if (v16 != (void *)v17)
  {
    v18 = (void *)v17;
    v19 = [(WiFiAwarePublishDatapathSecurityConfiguration *)self pairingConfiguration];
    [(WiFiAwarePublishDatapathSecurityConfiguration *)v5 pairingConfiguration];
    v20 = v23 = v10;
    int v22 = [v19 isEqual:v20] ^ 1;

    uint64_t v10 = v23;
    char v21 = v22;

    v12 = v26;
    uint64_t v13 = v24;
    if (v23 == v26)
    {
LABEL_23:

      if (v21) {
        goto LABEL_13;
      }
      goto LABEL_9;
    }
LABEL_22:

    goto LABEL_23;
  }

  v12 = v26;
  if (v10 != v26)
  {
    char v21 = 0;
    uint64_t v13 = v24;
    goto LABEL_22;
  }

LABEL_9:
  BOOL v14 = 1;
LABEL_14:

  return v14;
}

- (id)description
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28E78] string];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v4 = [(WiFiAwarePublishDatapathSecurityConfiguration *)self pmkList];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        if ([v3 length]) {
          [v3 appendString:@", "];
        }
        [v3 appendFormat:@"%@", v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v6);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v10 = [(WiFiAwarePublishDatapathSecurityConfiguration *)self passphraseList];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * j);
        if ([v3 length]) {
          [v3 appendString:@", "];
        }
        [v3 appendFormat:@"%@", v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v12);
  }

  objc_super v16 = [(WiFiAwarePublishDatapathSecurityConfiguration *)self pmkID];

  if (v16)
  {
    uint64_t v17 = [(WiFiAwarePublishDatapathSecurityConfiguration *)self pmkID];
    [v3 appendFormat:@", PMK-ID: %@", v17];
  }
  v18 = [(WiFiAwarePublishDatapathSecurityConfiguration *)self pairingConfiguration];

  if (v18)
  {
    if ([v3 length]) {
      [v3 appendString:@", "];
    }
    v19 = [(WiFiAwarePublishDatapathSecurityConfiguration *)self pairingConfiguration];
    [v3 appendFormat:@"%@", v19];
  }
  v20 = [NSString stringWithFormat:@"<%@>", v3];

  return v20;
}

- (NSArray)pmkList
{
  return self->_pmkList;
}

- (NSArray)passphraseList
{
  return self->_passphraseList;
}

- (NSData)pmkID
{
  return self->_pmkID;
}

- (WiFiAwarePairingConfiguration)pairingConfiguration
{
  return self->_pairingConfiguration;
}

- (WiFiAwarePublisherPairingDelegate)pairingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pairingDelegate);

  return (WiFiAwarePublisherPairingDelegate *)WeakRetained;
}

- (void)setPairingDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pairingDelegate);
  objc_storeStrong((id *)&self->_pairingConfiguration, 0);
  objc_storeStrong((id *)&self->_pmkID, 0);
  objc_storeStrong((id *)&self->_passphraseList, 0);

  objc_storeStrong((id *)&self->_pmkList, 0);
}

@end