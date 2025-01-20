@interface KTSelfVerificationHealableErrors
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (KTSelfVerificationHealableErrors)init;
- (KTSelfVerificationHealableErrors)initWithCoder:(id)a3;
- (NSArray)accountHealableErrors;
- (NSDictionary)deviceIdToHealableErrors;
- (NSMutableArray)_accountHealableErrors;
- (NSMutableDictionary)_deviceIdToHealableErrors;
- (id)description;
- (unint64_t)healableState;
- (void)addAccountHealableError:(unint64_t)a3;
- (void)addDeviceHealableError:(unint64_t)a3 deviceId:(id)a4;
- (void)addHealableState:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)removeHealableState:(unint64_t)a3;
- (void)setHealableState:(unint64_t)a3;
- (void)set_accountHealableErrors:(id)a3;
- (void)set_deviceIdToHealableErrors:(id)a3;
@end

@implementation KTSelfVerificationHealableErrors

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  v4 = [(KTSelfVerificationHealableErrors *)self accountHealableErrors];
  [v6 encodeObject:v4 forKey:@"accountHealableErrors"];

  v5 = [(KTSelfVerificationHealableErrors *)self deviceIdToHealableErrors];
  [v6 encodeObject:v5 forKey:@"deviceIdToHealableErrors"];

  objc_msgSend(v6, "encodeInt64:forKey:", -[KTSelfVerificationHealableErrors healableState](self, "healableState"), @"healableState");
}

- (KTSelfVerificationHealableErrors)initWithCoder:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v4 decodeObjectOfClasses:v7 forKey:@"accountHealableErrors"];
  v9 = (void *)MEMORY[0x263EFFA08];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  v13 = objc_msgSend(v9, "setWithObjects:", v10, v11, v12, objc_opt_class(), 0);
  v14 = [v4 decodeObjectOfClasses:v13 forKey:@"deviceIdToHealableErrors"];
  uint64_t v15 = [v4 decodeInt64ForKey:@"healableState"];
  v39.receiver = self;
  v39.super_class = (Class)KTSelfVerificationHealableErrors;
  v16 = [(KTSelfVerificationHealableErrors *)&v39 init];
  if (v16)
  {
    if ([v8 count]) {
      [MEMORY[0x263EFF980] arrayWithArray:v8];
    }
    else {
    v17 = [MEMORY[0x263EFF980] array];
    }
    [(KTSelfVerificationHealableErrors *)v16 set_accountHealableErrors:v17];

    v18 = [MEMORY[0x263EFF9A0] dictionary];
    [(KTSelfVerificationHealableErrors *)v16 set_deviceIdToHealableErrors:v18];

    if ([v14 count])
    {
      uint64_t v30 = v15;
      v31 = v14;
      v32 = v13;
      v33 = v8;
      v34 = v7;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v19 = v14;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v36 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = *(void *)(*((void *)&v35 + 1) + 8 * i);
            v25 = (void *)MEMORY[0x263EFF980];
            v26 = [v19 objectForKey:v24];
            v27 = [v25 arrayWithArray:v26];

            v28 = [(KTSelfVerificationHealableErrors *)v16 _deviceIdToHealableErrors];
            [v28 setObject:v27 forKey:v24];
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v35 objects:v40 count:16];
        }
        while (v21);
      }

      v8 = v33;
      v7 = v34;
      v14 = v31;
      v13 = v32;
      uint64_t v15 = v30;
    }
    [(KTSelfVerificationHealableErrors *)v16 setHealableState:v15];
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (KTSelfVerificationHealableErrors *)a3;
  if (self == v4)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t v6 = [(KTSelfVerificationHealableErrors *)self healableState];
      if (v6 == [(KTSelfVerificationHealableErrors *)v5 healableState])
      {
        v7 = [(KTSelfVerificationHealableErrors *)self accountHealableErrors];
        uint64_t v8 = [(KTSelfVerificationHealableErrors *)v5 accountHealableErrors];
        if (v7 == (void *)v8)
        {
        }
        else
        {
          v9 = (void *)v8;
          uint64_t v10 = [(KTSelfVerificationHealableErrors *)self accountHealableErrors];
          uint64_t v11 = [(KTSelfVerificationHealableErrors *)v5 accountHealableErrors];
          int v12 = [v10 isEqual:v11];

          if (!v12) {
            goto LABEL_12;
          }
        }
        v14 = [(KTSelfVerificationHealableErrors *)self deviceIdToHealableErrors];
        uint64_t v15 = [(KTSelfVerificationHealableErrors *)v5 deviceIdToHealableErrors];
        if (v14 == (void *)v15)
        {
        }
        else
        {
          v16 = (void *)v15;
          v17 = [(KTSelfVerificationHealableErrors *)self deviceIdToHealableErrors];
          v18 = [(KTSelfVerificationHealableErrors *)v5 deviceIdToHealableErrors];
          char v19 = [v17 isEqual:v18];

          if ((v19 & 1) == 0) {
            goto LABEL_12;
          }
        }
        BOOL v13 = 1;
        goto LABEL_15;
      }
LABEL_12:
      BOOL v13 = 0;
LABEL_15:

      goto LABEL_16;
    }
    BOOL v13 = 0;
  }
LABEL_16:

  return v13;
}

- (id)description
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  v3 = objc_msgSend(MEMORY[0x263F089D8], "stringWithFormat:", @"KTHealableErrors: <%p>\n", self);
  id v4 = [(KTSelfVerificationHealableErrors *)self accountHealableErrors];
  if (v4)
  {
    [v3 appendString:@"account="];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v34 != v8) {
            objc_enumerationMutation(v5);
          }
          [v3 appendFormat:@"%@,", *(void *)(*((void *)&v33 + 1) + 8 * i)];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v33 objects:v39 count:16];
      }
      while (v7);
    }

    [v3 appendString:@"\n"];
  }
  uint64_t v10 = [(KTSelfVerificationHealableErrors *)self deviceIdToHealableErrors];
  if (v10)
  {
    [v3 appendString:@"devices = {\n"];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v24 = v10;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v38 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v30 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v29 + 1) + 8 * j);
          v17 = objc_msgSend(v16, "kt_hexString");
          [v3 appendFormat:@"%@ : ", v17];

          long long v27 = 0u;
          long long v28 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          v18 = [v11 objectForKey:v16];
          uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v37 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v26;
            do
            {
              for (uint64_t k = 0; k != v20; ++k)
              {
                if (*(void *)v26 != v21) {
                  objc_enumerationMutation(v18);
                }
                [v3 appendFormat:@"%@,", *(void *)(*((void *)&v25 + 1) + 8 * k)];
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v25 objects:v37 count:16];
            }
            while (v20);
          }

          [v3 appendString:@"\n"];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v29 objects:v38 count:16];
      }
      while (v13);
    }

    [v3 appendString:@"}\n"];
    uint64_t v10 = v24;
  }

  return v3;
}

- (KTSelfVerificationHealableErrors)init
{
  v6.receiver = self;
  v6.super_class = (Class)KTSelfVerificationHealableErrors;
  v2 = [(KTSelfVerificationHealableErrors *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x263EFF980] array];
    [(KTSelfVerificationHealableErrors *)v2 set_accountHealableErrors:v3];

    id v4 = [MEMORY[0x263EFF9A0] dictionary];
    [(KTSelfVerificationHealableErrors *)v2 set_deviceIdToHealableErrors:v4];
  }
  return v2;
}

- (NSArray)accountHealableErrors
{
  v3 = [(KTSelfVerificationHealableErrors *)self _accountHealableErrors];
  objc_sync_enter(v3);
  id v4 = [(KTSelfVerificationHealableErrors *)self _accountHealableErrors];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x263EFF8C0];
    uint64_t v7 = [(KTSelfVerificationHealableErrors *)self _accountHealableErrors];
    uint64_t v8 = [v6 arrayWithArray:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }
  objc_sync_exit(v3);

  return (NSArray *)v8;
}

- (NSDictionary)deviceIdToHealableErrors
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  obuint64_t j = [(KTSelfVerificationHealableErrors *)self _deviceIdToHealableErrors];
  objc_sync_enter(obj);
  v3 = [(KTSelfVerificationHealableErrors *)self _deviceIdToHealableErrors];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    objc_super v6 = [(KTSelfVerificationHealableErrors *)self _deviceIdToHealableErrors];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          id v11 = (void *)MEMORY[0x263EFF8C0];
          uint64_t v12 = [(KTSelfVerificationHealableErrors *)self _deviceIdToHealableErrors];
          uint64_t v13 = [v12 objectForKey:v10];
          uint64_t v14 = [v11 arrayWithArray:v13];

          [v5 setObject:v14 forKey:v10];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v7);
    }

    uint64_t v15 = [NSDictionary dictionaryWithDictionary:v5];
  }
  else
  {
    uint64_t v15 = 0;
  }
  objc_sync_exit(obj);

  return (NSDictionary *)v15;
}

- (void)addAccountHealableError:(unint64_t)a3
{
  obuint64_t j = [(KTSelfVerificationHealableErrors *)self _accountHealableErrors];
  objc_sync_enter(obj);
  uint64_t v5 = [(KTSelfVerificationHealableErrors *)self _accountHealableErrors];
  objc_super v6 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 addObject:v6];

  objc_sync_exit(obj);
}

- (void)addDeviceHealableError:(unint64_t)a3 deviceId:(id)a4
{
  id v11 = a4;
  objc_super v6 = [(KTSelfVerificationHealableErrors *)self _deviceIdToHealableErrors];
  objc_sync_enter(v6);
  uint64_t v7 = [(KTSelfVerificationHealableErrors *)self _deviceIdToHealableErrors];
  uint64_t v8 = [v7 objectForKey:v11];

  if (!v8)
  {
    uint64_t v8 = [MEMORY[0x263EFF980] array];
    v9 = [(KTSelfVerificationHealableErrors *)self _deviceIdToHealableErrors];
    [v9 setObject:v8 forKey:v11];
  }
  uint64_t v10 = [NSNumber numberWithUnsignedInteger:a3];
  [v8 addObject:v10];

  objc_sync_exit(v6);
}

- (void)addHealableState:(unint64_t)a3
{
  unint64_t v4 = [(KTSelfVerificationHealableErrors *)self healableState] | a3;

  [(KTSelfVerificationHealableErrors *)self setHealableState:v4];
}

- (void)removeHealableState:(unint64_t)a3
{
  unint64_t v4 = [(KTSelfVerificationHealableErrors *)self healableState] & ~a3;

  [(KTSelfVerificationHealableErrors *)self setHealableState:v4];
}

- (unint64_t)healableState
{
  return self->_healableState;
}

- (void)setHealableState:(unint64_t)a3
{
  self->_healableState = a3;
}

- (NSMutableArray)_accountHealableErrors
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)set_accountHealableErrors:(id)a3
{
}

- (NSMutableDictionary)_deviceIdToHealableErrors
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)set_deviceIdToHealableErrors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__deviceIdToHealableErrors, 0);

  objc_storeStrong((id *)&self->__accountHealableErrors, 0);
}

@end