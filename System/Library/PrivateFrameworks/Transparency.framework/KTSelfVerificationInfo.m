@interface KTSelfVerificationInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (KTSelfVerificationInfo)initWithCoder:(id)a3;
- (KTSelfVerificationInfo)initWithSyncedLoggableDatas:(id)a3 uriToServerLoggableDatas:(id)a4;
- (NSArray)syncedLoggableDatas;
- (NSData)selfDeviceID;
- (NSDictionary)diagnosticsJsonDictionary;
- (NSDictionary)uriToServerLoggableDatas;
- (NSError)failure;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setFailure:(id)a3;
- (void)setSelfDeviceID:(id)a3;
- (void)setSyncedLoggableDatas:(id)a3;
- (void)setUriToServerLoggableDatas:(id)a3;
- (void)updateUri:(id)a3 serverLoggableDatas:(id)a4;
@end

@implementation KTSelfVerificationInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  v4 = [(KTSelfVerificationInfo *)self uriToServerLoggableDatas];
  [v12 encodeObject:v4 forKey:@"uriToServerLoggableDatas"];

  v5 = [(KTSelfVerificationInfo *)self syncedLoggableDatas];
  [v12 encodeObject:v5 forKey:@"syncedLoggableDatas"];

  v6 = [(KTSelfVerificationInfo *)self selfDeviceID];

  if (v6)
  {
    v7 = [(KTSelfVerificationInfo *)self selfDeviceID];
    [v12 encodeObject:v7 forKey:@"selfDeviceID"];
  }
  v8 = [(KTSelfVerificationInfo *)self failure];

  if (v8)
  {
    v9 = (void *)MEMORY[0x263F16D80];
    v10 = [(KTSelfVerificationInfo *)self failure];
    v11 = [v9 cleanseErrorForXPC:v10];
    [v12 encodeObject:v11 forKey:@"failure"];
  }
}

- (KTSelfVerificationInfo)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v4, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v9 = [v5 decodeObjectOfClasses:v8 forKey:@"uriToServerLoggableDatas"];
  v10 = (void *)MEMORY[0x263EFFA08];
  uint64_t v11 = objc_opt_class();
  id v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v13 = [v5 decodeObjectOfClasses:v12 forKey:@"syncedLoggableDatas"];
  v14 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  v15 = [MEMORY[0x263F16D80] safeErrorClasses];
  v16 = [v14 setByAddingObjectsFromSet:v15];

  v17 = [v5 decodeObjectOfClasses:v16 forKey:@"failure"];
  v18 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  v19 = [v5 decodeObjectOfClasses:v18 forKey:@"selfDeviceID"];

  v20 = [[KTSelfVerificationInfo alloc] initWithSyncedLoggableDatas:v13 uriToServerLoggableDatas:v9];
  v21 = v20;
  if (v20)
  {
    [(KTSelfVerificationInfo *)v20 setFailure:v17];
    [(KTSelfVerificationInfo *)v21 setSelfDeviceID:v19];
  }

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    uint64_t v7 = [(KTSelfVerificationInfo *)self uriToServerLoggableDatas];
    if (v7 || ([v6 uriToServerLoggableDatas], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v8 = [(KTSelfVerificationInfo *)self uriToServerLoggableDatas];
      v9 = [v6 uriToServerLoggableDatas];
      int v10 = [v8 isEqual:v9];

      if (v7)
      {

        if (!v10) {
          goto LABEL_24;
        }
      }
      else
      {

        if ((v10 & 1) == 0) {
          goto LABEL_24;
        }
      }
    }
    id v12 = [(KTSelfVerificationInfo *)self selfDeviceID];
    if (v12 || ([v6 selfDeviceID], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v13 = [(KTSelfVerificationInfo *)self selfDeviceID];
      v14 = [v6 selfDeviceID];
      int v15 = [v13 isEqual:v14];

      if (v12)
      {

        if (!v15) {
          goto LABEL_24;
        }
      }
      else
      {

        if ((v15 & 1) == 0) {
          goto LABEL_24;
        }
      }
    }
    v16 = [(KTSelfVerificationInfo *)self syncedLoggableDatas];
    if (!v16)
    {
      v3 = [v6 syncedLoggableDatas];
      if (!v3)
      {
LABEL_19:
        v20 = [(KTSelfVerificationInfo *)self failure];
        if (v20 || ([v6 failure], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v21 = (void *)MEMORY[0x263F16D80];
          v22 = [(KTSelfVerificationInfo *)self failure];
          v23 = [v21 cleanseErrorForXPC:v22];
          v24 = (void *)MEMORY[0x263F16D80];
          v25 = [v6 failure];
          v26 = [v24 cleanseErrorForXPC:v25];
          int v27 = [v23 isEqual:v26] ^ 1;

          if (v20)
          {
LABEL_29:

            char v11 = v27 ^ 1;
            goto LABEL_25;
          }
        }
        else
        {
          LOBYTE(v27) = 0;
        }

        goto LABEL_29;
      }
    }
    v17 = [(KTSelfVerificationInfo *)self syncedLoggableDatas];
    v18 = [v6 syncedLoggableDatas];
    int v19 = [v17 isEqual:v18];

    if (v16)
    {

      if (v19) {
        goto LABEL_19;
      }
    }
    else
    {

      if (v19) {
        goto LABEL_19;
      }
    }
LABEL_24:
    char v11 = 0;
LABEL_25:

    goto LABEL_26;
  }
  char v11 = 0;
LABEL_26:

  return v11;
}

- (id)description
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"KTSelfVerificationInfo: "];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v4 = [(KTSelfVerificationInfo *)self uriToServerLoggableDatas];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 appendFormat:@"%@, ", *(void *)(*((void *)&v23 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v6);
  }

  [v3 appendFormat:@"\n"];
  v9 = [(KTSelfVerificationInfo *)self syncedLoggableDatas];

  if (v9)
  {
    [v3 appendFormat:@"syncedDatas: [\n"];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    int v10 = [(KTSelfVerificationInfo *)self syncedLoggableDatas];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          int v15 = [*(id *)(*((void *)&v19 + 1) + 8 * j) shortDescription];
          [v3 appendFormat:@"%@,\n", v15];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v12);
    }

    [v3 appendFormat:@"]\n"];
  }
  v16 = [(KTSelfVerificationInfo *)self failure];

  if (v16)
  {
    v17 = [(KTSelfVerificationInfo *)self failure];
    [v3 appendFormat:@"error=%@\n", v17];
  }

  return v3;
}

- (NSDictionary)diagnosticsJsonDictionary
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [(KTSelfVerificationInfo *)self uriToServerLoggableDatas];
  uint64_t v5 = [v4 allKeys];
  [v3 setObject:v5 forKeyedSubscript:@"uris"];

  uint64_t v6 = [(KTSelfVerificationInfo *)self syncedLoggableDatas];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    v8 = (void *)MEMORY[0x263EFF980];
    v9 = [(KTSelfVerificationInfo *)self syncedLoggableDatas];
    int v10 = objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "count"));

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v11 = [(KTSelfVerificationInfo *)self syncedLoggableDatas];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [*(id *)(*((void *)&v22 + 1) + 8 * i) diagnosticsJsonDictionary];
          [v10 addObject:v16];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v13);
    }

    [v3 setObject:v10 forKeyedSubscript:@"syncedLoggableDatas"];
  }
  v17 = [(KTSelfVerificationInfo *)self selfDeviceID];
  v18 = objc_msgSend(v17, "kt_hexString");
  [v3 setObject:v18 forKeyedSubscript:@"selfDeviceID"];

  long long v19 = [(KTSelfVerificationInfo *)self failure];
  long long v20 = +[TransparencyError diagnosticError:v19];
  [v3 setObject:v20 forKeyedSubscript:@"error"];

  return (NSDictionary *)v3;
}

- (KTSelfVerificationInfo)initWithSyncedLoggableDatas:(id)a3 uriToServerLoggableDatas:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)KTSelfVerificationInfo;
  v8 = [(KTSelfVerificationInfo *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(KTSelfVerificationInfo *)v8 setSyncedLoggableDatas:v6];
    [(KTSelfVerificationInfo *)v9 setUriToServerLoggableDatas:v7];
  }

  return v9;
}

- (void)updateUri:(id)a3 serverLoggableDatas:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(KTSelfVerificationInfo *)self uriToServerLoggableDatas];
  id v9 = [v8 objectForKeyedSubscript:v7];

  [v9 updateServerLoggableDatas:v6];
}

- (NSDictionary)uriToServerLoggableDatas
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUriToServerLoggableDatas:(id)a3
{
}

- (NSArray)syncedLoggableDatas
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSyncedLoggableDatas:(id)a3
{
}

- (NSData)selfDeviceID
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSelfDeviceID:(id)a3
{
}

- (NSError)failure
{
  return (NSError *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFailure:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failure, 0);
  objc_storeStrong((id *)&self->_selfDeviceID, 0);
  objc_storeStrong((id *)&self->_syncedLoggableDatas, 0);

  objc_storeStrong((id *)&self->_uriToServerLoggableDatas, 0);
}

@end