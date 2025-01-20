@interface KTSelfValidationDiagnostics
+ (BOOL)supportsSecureCoding;
+ (id)jsonClasses;
- (BOOL)isEqual:(id)a3;
- (KTSelfValidationDiagnostics)initWithCoder:(id)a3;
- (NSDictionary)diagnosticsJsonDictionary;
- (NSDictionary)ktSelfVerificationInfoDiagnosticsJson;
- (NSDictionary)uriToDiagnostics;
- (NSString)accountKey;
- (NSString)pushToken;
- (NSString)rawAccountKey;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountKey:(id)a3;
- (void)setKtSelfVerificationInfoDiagnosticsJson:(id)a3;
- (void)setPushToken:(id)a3;
- (void)setRawAccountKey:(id)a3;
- (void)setUriToDiagnostics:(id)a3;
@end

@implementation KTSelfValidationDiagnostics

+ (id)jsonClasses
{
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, objc_opt_class(), 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  uint64_t v4 = [(KTSelfValidationDiagnostics *)self rawAccountKey];

  if (v4)
  {
    uint64_t v5 = [(KTSelfValidationDiagnostics *)self rawAccountKey];
    [v11 encodeObject:v5 forKey:@"rawAccountKey"];
  }
  uint64_t v6 = [(KTSelfValidationDiagnostics *)self accountKey];

  if (v6)
  {
    v7 = [(KTSelfValidationDiagnostics *)self accountKey];
    [v11 encodeObject:v7 forKey:@"accountKey"];
  }
  v8 = [(KTSelfValidationDiagnostics *)self ktSelfVerificationInfoDiagnosticsJson];
  [v11 encodeObject:v8 forKey:@"KTSelfVerificationInfo"];

  v9 = [(KTSelfValidationDiagnostics *)self uriToDiagnostics];
  [v11 encodeObject:v9 forKey:@"uriData"];

  v10 = [(KTSelfValidationDiagnostics *)self pushToken];
  [v11 encodeObject:v10 forKey:@"pushToken"];
}

- (KTSelfValidationDiagnostics)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rawAccountKey"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountKey"];
  v7 = +[KTSelfValidationDiagnostics jsonClasses];
  v8 = [v4 decodeObjectOfClasses:v7 forKey:@"KTSelfVerificationInfo"];

  v9 = (void *)MEMORY[0x263EFF9C0];
  v10 = +[KTSelfValidationDiagnostics jsonClasses];
  id v11 = [v9 setWithSet:v10];

  [v11 addObject:objc_opt_class()];
  v12 = [v4 decodeObjectOfClasses:v11 forKey:@"uriData"];
  v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pushToken"];

  v14 = 0;
  if (v12 && v8)
  {
    if (v5) {
      [(KTSelfValidationDiagnostics *)self setRawAccountKey:v5];
    }
    if (v6) {
      [(KTSelfValidationDiagnostics *)self setAccountKey:v6];
    }
    [(KTSelfValidationDiagnostics *)self setUriToDiagnostics:v12];
    [(KTSelfValidationDiagnostics *)self setKtSelfVerificationInfoDiagnosticsJson:v8];
    [(KTSelfValidationDiagnostics *)self setPushToken:v13];
    v14 = self;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v6 = (KTSelfValidationDiagnostics *)a3;
  if (self == v6)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = v6;
      v8 = [(KTSelfValidationDiagnostics *)self rawAccountKey];
      if (v8)
      {
        uint64_t v3 = [(KTSelfValidationDiagnostics *)self rawAccountKey];
        id v4 = [(KTSelfValidationDiagnostics *)v7 rawAccountKey];
        if (([v3 isEqual:v4] & 1) == 0) {
          goto LABEL_13;
        }
      }
      v10 = [(KTSelfValidationDiagnostics *)self rawAccountKey];
      if (v10)
      {

        if (v8)
        {
        }
      }
      else
      {
        id v11 = [(KTSelfValidationDiagnostics *)v7 rawAccountKey];

        if (v8)
        {

          if (v11) {
            goto LABEL_30;
          }
        }
        else if (v11)
        {
          goto LABEL_30;
        }
      }
      v8 = [(KTSelfValidationDiagnostics *)self accountKey];
      if (v8)
      {
        uint64_t v3 = [(KTSelfValidationDiagnostics *)self accountKey];
        id v4 = [(KTSelfValidationDiagnostics *)v7 accountKey];
        if (([v3 isEqual:v4] & 1) == 0)
        {
LABEL_13:

          goto LABEL_30;
        }
      }
      v12 = [(KTSelfValidationDiagnostics *)self accountKey];
      if (v12)
      {

        if (v8)
        {
        }
      }
      else
      {
        v13 = [(KTSelfValidationDiagnostics *)v7 accountKey];

        if (v8)
        {
        }
        if (v13) {
          goto LABEL_30;
        }
      }
      v14 = [(KTSelfValidationDiagnostics *)self ktSelfVerificationInfoDiagnosticsJson];
      v15 = [(KTSelfValidationDiagnostics *)v7 ktSelfVerificationInfoDiagnosticsJson];
      int v16 = [v14 isEqual:v15];

      if (!v16
        || ([(KTSelfValidationDiagnostics *)self uriToDiagnostics],
            v17 = objc_claimAutoreleasedReturnValue(),
            [(KTSelfValidationDiagnostics *)v7 uriToDiagnostics],
            v18 = objc_claimAutoreleasedReturnValue(),
            int v19 = [v17 isEqual:v18],
            v18,
            v17,
            !v19))
      {
LABEL_30:
        char v9 = 0;
LABEL_31:

        goto LABEL_32;
      }
      v20 = [(KTSelfValidationDiagnostics *)self pushToken];
      if (v20
        || ([(KTSelfValidationDiagnostics *)v7 pushToken],
            (v18 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v21 = [(KTSelfValidationDiagnostics *)self pushToken];
        v22 = [(KTSelfValidationDiagnostics *)v7 pushToken];
        int v23 = [v21 isEqual:v22] ^ 1;

        if (v20)
        {
LABEL_35:

          char v9 = v23 ^ 1;
          goto LABEL_31;
        }
      }
      else
      {
        LOBYTE(v23) = 0;
      }

      goto LABEL_35;
    }
    char v9 = 0;
  }
LABEL_32:

  return v9;
}

- (NSDictionary)diagnosticsJsonDictionary
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = [(KTSelfValidationDiagnostics *)self uriToDiagnostics];
  uint64_t v5 = objc_msgSend(v3, "dictionaryWithCapacity:", objc_msgSend(v4, "count"));

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v6 = [(KTSelfValidationDiagnostics *)self uriToDiagnostics];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        v12 = [(KTSelfValidationDiagnostics *)self uriToDiagnostics];
        v13 = [v12 objectForKeyedSubscript:v11];
        v14 = [v13 diagnosticsJsonDictionary];
        [v5 setObject:v14 forKeyedSubscript:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v8);
  }

  v15 = [MEMORY[0x263EFF9A0] dictionary];
  int v16 = [(KTSelfValidationDiagnostics *)self accountKey];

  if (v16)
  {
    v17 = [(KTSelfValidationDiagnostics *)self accountKey];
    [v15 setObject:v17 forKeyedSubscript:@"accountKey"];
  }
  v18 = [(KTSelfValidationDiagnostics *)self rawAccountKey];

  if (v18)
  {
    int v19 = [(KTSelfValidationDiagnostics *)self rawAccountKey];
    [v15 setObject:v19 forKeyedSubscript:@"rawAccountKey"];
  }
  v20 = [(KTSelfValidationDiagnostics *)self ktSelfVerificationInfoDiagnosticsJson];

  if (v20)
  {
    v21 = [(KTSelfValidationDiagnostics *)self ktSelfVerificationInfoDiagnosticsJson];
    [v15 setObject:v21 forKeyedSubscript:@"KTSelfVerificationInfo"];
  }
  v22 = [(KTSelfValidationDiagnostics *)self pushToken];
  [v15 setObject:v22 forKeyedSubscript:@"pushToken"];

  [v15 setObject:v5 forKeyedSubscript:@"uriData"];
  if ([MEMORY[0x263F08900] isValidJSONObject:v15]) {
    id v23 = v15;
  }
  else {
    id v23 = 0;
  }

  return (NSDictionary *)v23;
}

- (id)description
{
  v2 = [(KTSelfValidationDiagnostics *)self diagnosticsJsonDictionary];
  uint64_t v3 = [v2 description];

  return v3;
}

- (NSString)rawAccountKey
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRawAccountKey:(id)a3
{
}

- (NSString)accountKey
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAccountKey:(id)a3
{
}

- (NSString)pushToken
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPushToken:(id)a3
{
}

- (NSDictionary)uriToDiagnostics
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUriToDiagnostics:(id)a3
{
}

- (NSDictionary)ktSelfVerificationInfoDiagnosticsJson
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setKtSelfVerificationInfoDiagnosticsJson:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ktSelfVerificationInfoDiagnosticsJson, 0);
  objc_storeStrong((id *)&self->_uriToDiagnostics, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_accountKey, 0);

  objc_storeStrong((id *)&self->_rawAccountKey, 0);
}

@end