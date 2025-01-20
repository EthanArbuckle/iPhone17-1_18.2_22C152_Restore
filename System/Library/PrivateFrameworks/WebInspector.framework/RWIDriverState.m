@interface RWIDriverState
+ (BOOL)isValidPayload:(id)a3;
+ (id)active;
+ (id)decodeFromPayload:(id)a3;
+ (id)inactive;
- (BOOL)isActive;
- (NSSet)sessionIdentifiers;
- (RWIDriverState)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeToPayload:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setSessionIdentifiers:(id)a3;
@end

@implementation RWIDriverState

- (RWIDriverState)init
{
  v6.receiver = self;
  v6.super_class = (Class)RWIDriverState;
  v2 = [(RWIDriverState *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

+ (id)active
{
  v2 = objc_alloc_init(RWIDriverState);
  [(RWIDriverState *)v2 setActive:1];
  return v2;
}

+ (id)inactive
{
  v2 = objc_alloc_init(RWIDriverState);
  [(RWIDriverState *)v2 setActive:0];
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setActive:", -[RWIDriverState isActive](self, "isActive"));
  v5 = [(RWIDriverState *)self sessionIdentifiers];
  objc_super v6 = (void *)[v5 copy];
  [v4 setSessionIdentifiers:v6];

  return v4;
}

+ (BOOL)isValidPayload:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"WIRDriverIsActiveKey"];
  v5 = objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v5,
        v4,
        [v3 objectForKeyedSubscript:@"WIRDriverSessionListKey"],
        v4 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        v5 = objc_claimAutoreleasedReturnValue(),
        (objc_opt_isKindOfClass() & 1) != 0))
  {

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    objc_super v6 = objc_msgSend(v3, "objectForKeyedSubscript:", @"WIRDriverIdentifierKey", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(id *)(*((void *)&v17 + 1) + 8 * i);
          v12 = objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v15 = objc_opt_class();
            logUnexpectedType(v15, v12);

            BOOL v13 = 0;
            goto LABEL_14;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    BOOL v13 = 1;
LABEL_14:
  }
  else
  {
    v14 = objc_opt_class();
    logUnexpectedType(v14, v5);

    BOOL v13 = 0;
  }

  return v13;
}

+ (id)decodeFromPayload:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"WIRDriverIsActiveKey"];
  uint64_t v5 = [v4 BOOLValue];

  objc_super v6 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = objc_msgSend(v3, "objectForKeyedSubscript:", @"WIRDriverSessionListKey", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(id *)(*((void *)&v17 + 1) + 8 * i);
        BOOL v13 = objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v15 = objc_opt_class();
          logUnexpectedType(v15, v13);

          v14 = 0;
          goto LABEL_11;
        }

        [v6 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  v14 = objc_opt_new();
  [v14 setActive:v5];
  [v14 setSessionIdentifiers:v6];
LABEL_11:

  return v14;
}

- (void)encodeToPayload:(id)a3
{
  v4 = NSNumber;
  id v5 = a3;
  objc_super v6 = objc_msgSend(v4, "numberWithBool:", -[RWIDriverState isActive](self, "isActive"));
  [v5 setObject:v6 forKeyedSubscript:@"WIRDriverIsActiveKey"];

  id v8 = [(RWIDriverState *)self sessionIdentifiers];
  uint64_t v7 = [v8 allObjects];
  [v5 setObject:v7 forKeyedSubscript:@"WIRDriverSessionListKey"];
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (NSSet)sessionIdentifiers
{
  return self->_sessionIdentifiers;
}

- (void)setSessionIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end