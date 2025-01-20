@interface NAIdentity
+ (id)na_identity;
- (BOOL)isEqual:(id)a3;
- (BOOL)isObject:(id)a3 equalToObject:(id)a4;
- (NAIdentity)initWithCharacteristics:(id)a3;
- (NSArray)characteristics;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)hashOfObject:(id)a3;
- (void)setCharacteristics:(id)a3;
@end

@implementation NAIdentity

- (BOOL)isObject:(id)a3 equalToObject:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6 == v7)
  {
    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = 0;
    if (v6 && v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id obj = [(NAIdentity *)self characteristics];
        uint64_t v10 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v23;
          while (2)
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v23 != v12) {
                objc_enumerationMutation(obj);
              }
              v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
              if (([v14 role] & 2) != 0)
              {
                v15 = [v14 retrievalBlock];
                v16 = [v14 comparisonBlock];
                v17 = ((void (**)(void, id))v15)[2](v15, v6);
                v18 = ((void (**)(void, void *))v15)[2](v15, v8);
                uint64_t v19 = ((uint64_t (**)(void, void *, void *))v16)[2](v16, v17, v18);

                if (v19)
                {
                  BOOL v9 = 0;
                  goto LABEL_18;
                }
              }
            }
            uint64_t v11 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }
        BOOL v9 = 1;
LABEL_18:
      }
      else
      {
        BOOL v9 = 0;
      }
    }
  }

  return v9;
}

- (unint64_t)hashOfObject:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = [(NAIdentity *)self characteristics];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    unint64_t v9 = 17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v11 role])
        {
          uint64_t v12 = [v11 retrievalBlock];
          v13 = ((void (**)(void, id))v12)[2](v12, v4);

          if (v13)
          {
            v14 = [v11 hashBlock];
            uint64_t v15 = ((uint64_t (**)(void, void *))v14)[2](v14, v13);

            unint64_t v9 = v15 - v9 + 32 * v9;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }
  else
  {
    unint64_t v9 = 17;
  }

  return v9;
}

- (NSArray)characteristics
{
  return self->_characteristics;
}

- (NAIdentity)initWithCharacteristics:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NAIdentity;
  v5 = [(NAIdentity *)&v8 init];
  uint64_t v6 = v5;
  if (v5) {
    [(NAIdentity *)v5 setCharacteristics:v4];
  }

  return v6;
}

- (void)setCharacteristics:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[NAIdentity allocWithZone:a3];
  v5 = [(NAIdentity *)self characteristics];
  uint64_t v6 = [(NAIdentity *)v4 initWithCharacteristics:v5];

  return v6;
}

- (unint64_t)hash
{
  v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

+ (id)na_identity
{
  if (na_identity_onceToken_0 != -1) {
    dispatch_once(&na_identity_onceToken_0, &__block_literal_global_104);
  }
  v2 = (void *)na_identity_identity_0;
  return v2;
}

void __25__NAIdentity_na_identity__block_invoke()
{
  id v3 = +[NAIdentityBuilder builder];
  id v0 = (id)[v3 appendCharacteristic:&__block_literal_global_108];
  uint64_t v1 = [v3 build];
  v2 = (void *)na_identity_identity_0;
  na_identity_identity_0 = v1;
}

uint64_t __25__NAIdentity_na_identity__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 characteristics];
}

- (void).cxx_destruct
{
}

@end