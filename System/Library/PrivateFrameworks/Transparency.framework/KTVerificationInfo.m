@interface KTVerificationInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (KTVerificationInfo)initWithAccountKey:(id)a3;
- (KTVerificationInfo)initWithAccountKey:(id)a3 serverLoggableDatas:(id)a4;
- (KTVerificationInfo)initWithCoder:(id)a3;
- (NSArray)serverLoggableDatas;
- (NSData)accountKey;
- (NSDate)idsResponseTime;
- (NSDictionary)diagnosticsJsonDictionary;
- (NSError)failure;
- (id)description;
- (unint64_t)optedIn;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountKey:(id)a3;
- (void)setFailure:(id)a3;
- (void)setIdsResponseTime:(id)a3;
- (void)setOptedIn:(unint64_t)a3;
- (void)setServerLoggableDatas:(id)a3;
@end

@implementation KTVerificationInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v13 = a3;
  v4 = [(KTVerificationInfo *)self accountKey];
  [v13 encodeObject:v4 forKey:@"accountKey"];

  v5 = [(KTVerificationInfo *)self serverLoggableDatas];
  [v13 encodeObject:v5 forKey:@"serverLoggableDatas"];

  v6 = [(KTVerificationInfo *)self failure];

  if (v6)
  {
    v7 = (void *)MEMORY[0x263F16D80];
    v8 = [(KTVerificationInfo *)self failure];
    v9 = [v7 cleanseErrorForXPC:v8];
    [v13 encodeObject:v9 forKey:@"failure"];
  }
  v10 = [(KTVerificationInfo *)self idsResponseTime];

  if (v10)
  {
    v11 = [(KTVerificationInfo *)self idsResponseTime];
    [v13 encodeObject:v11 forKey:@"idsResponseTime"];
  }
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[KTVerificationInfo optedIn](self, "optedIn"));
  [v13 encodeObject:v12 forKey:@"optedIn"];
}

- (KTVerificationInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountKey"];
  v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"serverLoggableDatas"];
  v10 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  v11 = [MEMORY[0x263F16D80] safeErrorClasses];
  v12 = [v10 setByAddingObjectsFromSet:v11];

  id v13 = [v4 decodeObjectOfClasses:v12 forKey:@"failure"];
  v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"idsResponseTime"];
  v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"optedIn"];

  v16 = [[KTVerificationInfo alloc] initWithAccountKey:v5 serverLoggableDatas:v9];
  v17 = v16;
  if (v16)
  {
    [(KTVerificationInfo *)v16 setFailure:v13];
    [(KTVerificationInfo *)v17 setIdsResponseTime:v14];
    -[KTVerificationInfo setOptedIn:](v17, "setOptedIn:", [v15 unsignedIntegerValue]);
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (KTVerificationInfo *)a3;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(KTVerificationInfo *)self accountKey];
      uint64_t v7 = [(KTVerificationInfo *)v5 accountKey];
      if (v6 == (void *)v7)
      {
      }
      else
      {
        v8 = (void *)v7;
        v9 = [(KTVerificationInfo *)self accountKey];
        v10 = [(KTVerificationInfo *)v5 accountKey];
        int v11 = [v9 isEqual:v10];

        if (!v11) {
          goto LABEL_23;
        }
      }
      id v13 = [(KTVerificationInfo *)self serverLoggableDatas];
      uint64_t v14 = [(KTVerificationInfo *)v5 serverLoggableDatas];
      if (v13 == (void *)v14)
      {
      }
      else
      {
        v15 = (void *)v14;
        v16 = [(KTVerificationInfo *)self serverLoggableDatas];
        v17 = [(KTVerificationInfo *)v5 serverLoggableDatas];
        int v18 = [v16 isEqual:v17];

        if (!v18) {
          goto LABEL_23;
        }
      }
      v19 = [(KTVerificationInfo *)self failure];
      uint64_t v20 = [(KTVerificationInfo *)v5 failure];
      if (v19 == (void *)v20)
      {
      }
      else
      {
        v21 = (void *)v20;
        v22 = (void *)MEMORY[0x263F16D80];
        v23 = [(KTVerificationInfo *)self failure];
        v24 = [v22 cleanseErrorForXPC:v23];
        v25 = (void *)MEMORY[0x263F16D80];
        v26 = [(KTVerificationInfo *)v5 failure];
        v27 = [v25 cleanseErrorForXPC:v26];
        int v28 = [v24 isEqual:v27];

        if (!v28) {
          goto LABEL_23;
        }
      }
      v29 = [(KTVerificationInfo *)self idsResponseTime];
      uint64_t v30 = [(KTVerificationInfo *)v5 idsResponseTime];
      if (v29 == (void *)v30)
      {
      }
      else
      {
        v31 = (void *)v30;
        v32 = [(KTVerificationInfo *)self idsResponseTime];
        v33 = [(KTVerificationInfo *)v5 idsResponseTime];
        int v34 = [v32 isEqual:v33];

        if (!v34) {
          goto LABEL_23;
        }
      }
      unint64_t v35 = [(KTVerificationInfo *)self optedIn];
      if (v35 == [(KTVerificationInfo *)v5 optedIn])
      {
        BOOL v12 = 1;
LABEL_24:

        goto LABEL_25;
      }
LABEL_23:
      BOOL v12 = 0;
      goto LABEL_24;
    }
    BOOL v12 = 0;
  }
LABEL_25:

  return v12;
}

- (id)description
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"KTVerificationInfo: "];
  id v4 = [(KTVerificationInfo *)self accountKey];

  if (v4)
  {
    v5 = [(KTVerificationInfo *)self accountKey];
    v6 = objc_msgSend(v5, "kt_hexString");
    [v3 appendFormat:@"account key=%@\n", v6];
  }
  uint64_t v7 = [(KTVerificationInfo *)self idsResponseTime];

  if (v7)
  {
    v8 = [(KTVerificationInfo *)self idsResponseTime];
    v9 = [(KTVerificationInfo *)self idsResponseTime];
    v10 = objc_msgSend(v9, "kt_toISO_8601_UTCString");
    [v3 appendFormat:@"ids response time=%@ (%@)\n", v8, v10];
  }
  int v11 = [(KTVerificationInfo *)self serverLoggableDatas];

  if (v11)
  {
    [v3 appendFormat:@"[\n"];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    BOOL v12 = [(KTVerificationInfo *)self serverLoggableDatas];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [*(id *)(*((void *)&v21 + 1) + 8 * i) shortDescription];
          [v3 appendFormat:@"%@,\n", v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v14);
    }

    [v3 appendFormat:@"]\n"];
  }
  int v18 = [(KTVerificationInfo *)self failure];

  if (v18)
  {
    v19 = [(KTVerificationInfo *)self failure];
    [v3 appendFormat:@"error=%@\n", v19];
  }
  objc_msgSend(v3, "appendFormat:", @"opted in=%lu\n", -[KTVerificationInfo optedIn](self, "optedIn"));

  return v3;
}

- (NSDictionary)diagnosticsJsonDictionary
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [(KTVerificationInfo *)self accountKey];
  v5 = objc_msgSend(v4, "kt_hexString");
  [v3 setObject:v5 forKeyedSubscript:@"accountKey"];

  v6 = [(KTVerificationInfo *)self serverLoggableDatas];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    v8 = (void *)MEMORY[0x263EFF980];
    v9 = [(KTVerificationInfo *)self serverLoggableDatas];
    v10 = objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "count"));

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    int v11 = [(KTVerificationInfo *)self serverLoggableDatas];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v27 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [*(id *)(*((void *)&v26 + 1) + 8 * i) diagnosticsJsonDictionary];
          [v10 addObject:v16];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v13);
    }

    [v3 setObject:v10 forKeyedSubscript:@"serverLoggableDatas"];
  }
  v17 = [(KTVerificationInfo *)self failure];
  int v18 = +[TransparencyError diagnosticError:v17];
  [v3 setObject:v18 forKeyedSubscript:@"error"];

  v19 = [(KTVerificationInfo *)self idsResponseTime];

  if (v19)
  {
    uint64_t v20 = [(KTVerificationInfo *)self idsResponseTime];
    long long v21 = objc_msgSend(v20, "kt_dateToString");
    [v3 setObject:v21 forKeyedSubscript:@"idsResponseTime"];

    long long v22 = [(KTVerificationInfo *)self idsResponseTime];
    long long v23 = objc_msgSend(v22, "kt_toISO_8601_UTCString");
    [v3 setObject:v23 forKeyedSubscript:@"idsResponseTimeReadable"];
  }
  long long v24 = KTOptInGetString([(KTVerificationInfo *)self optedIn]);
  [v3 setObject:v24 forKeyedSubscript:@"optedIn"];

  return (NSDictionary *)v3;
}

- (KTVerificationInfo)initWithAccountKey:(id)a3
{
  return [(KTVerificationInfo *)self initWithAccountKey:a3 serverLoggableDatas:0];
}

- (KTVerificationInfo)initWithAccountKey:(id)a3 serverLoggableDatas:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)KTVerificationInfo;
  v8 = [(KTVerificationInfo *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(KTVerificationInfo *)v8 setAccountKey:v6];
    [(KTVerificationInfo *)v9 setServerLoggableDatas:v7];
    [(KTVerificationInfo *)v9 setOptedIn:2];
  }

  return v9;
}

- (NSData)accountKey
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAccountKey:(id)a3
{
}

- (NSArray)serverLoggableDatas
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setServerLoggableDatas:(id)a3
{
}

- (NSError)failure
{
  return (NSError *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFailure:(id)a3
{
}

- (NSDate)idsResponseTime
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIdsResponseTime:(id)a3
{
}

- (unint64_t)optedIn
{
  return self->_optedIn;
}

- (void)setOptedIn:(unint64_t)a3
{
  self->_optedIn = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsResponseTime, 0);
  objc_storeStrong((id *)&self->_failure, 0);
  objc_storeStrong((id *)&self->_serverLoggableDatas, 0);

  objc_storeStrong((id *)&self->_accountKey, 0);
}

@end