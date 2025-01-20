@interface RBCompoundNoneDomainRestriction
+ (id)domainRestrictionForDictionary:(id)a3 withError:(id *)a4;
- (BOOL)allowsContext:(id)a3 withError:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (id)_initWithRestrictions:(id)a3;
- (id)allEntitlements;
- (id)description;
- (unint64_t)hash;
@end

@implementation RBCompoundNoneDomainRestriction

- (id)_initWithRestrictions:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RBCompoundNoneDomainRestriction;
  v5 = [(RBDomainRestriction *)&v10 _init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    v7 = (void *)v5[1];
    v5[1] = v6;

    v8 = v5;
  }

  return v5;
}

+ (id)domainRestrictionForDictionary:(id)a3 withError:(id *)a4
{
  v27[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKey:@"Restrictions"];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v7 = [MEMORY[0x263EFF980] array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = +[RBDomainRestriction domainRestrictionForDictionary:*(void *)(*((void *)&v21 + 1) + 8 * i) withError:a4];
          if (!v13)
          {

            id v15 = 0;
            goto LABEL_16;
          }
          v14 = (void *)v13;
          [v7 addObject:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    id v15 = [[RBCompoundNoneDomainRestriction alloc] _initWithRestrictions:v7];
  }
  else
  {
    if (!a4)
    {
      id v15 = 0;
      goto LABEL_17;
    }
    v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v26 = *MEMORY[0x263F08338];
    v17 = [NSString stringWithFormat:@"RBCompoundNoneDomainRestriction doesn't specify restrictions: %@", v5];
    v27[0] = v17;
    v18 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];
    v19 = [v16 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:1 userInfo:v18];

    id v7 = v19;
    id v15 = 0;
    *a4 = v7;
  }
LABEL_16:

LABEL_17:
  return v15;
}

- (BOOL)allowsContext:(id)a3 withError:(id *)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = objc_msgSend(MEMORY[0x263F089D8], "stringWithString:", @"(");
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v8 = self->_restrictions;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v24 objects:v30 count:16];
  char v10 = v9 == 0;
  if (!v9) {
    goto LABEL_18;
  }
  uint64_t v11 = v9;
  BOOL v23 = v9 == 0;
  uint64_t v12 = *(void *)v25;
  char v10 = 1;
  char v13 = 1;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v25 != v12) {
        objc_enumerationMutation(v8);
      }
      id v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
      int v16 = [v15 allowsContext:v6 withError:0];
      v10 &= v16 ^ 1;
      if (a4 && v16)
      {
        if ((v13 & 1) == 0) {
          [v7 appendString:@" AND "];
        }
        v17 = [v15 description];
        [v7 appendString:v17];

        char v10 = 0;
        char v13 = 0;
      }
    }
    uint64_t v11 = [(NSArray *)v8 countByEnumeratingWithState:&v24 objects:v30 count:16];
  }
  while (v11);

  if (a4) {
    char v18 = v10;
  }
  else {
    char v18 = 1;
  }
  if ((v18 & 1) == 0)
  {
    [v7 appendString:@""]);
    v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = *MEMORY[0x263F646B8];
    uint64_t v28 = *MEMORY[0x263F08338];
    id v8 = [NSString stringWithFormat:@"Not allowed because it has %@", v7];
    v29 = v8;
    long long v21 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    *a4 = [v19 errorWithDomain:v20 code:1 userInfo:v21];

    char v10 = v23;
LABEL_18:
  }
  return v10;
}

- (id)allEntitlements
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9C0] set];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_restrictions;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "allEntitlements", (void)v12);
        [v3 unionSet:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  char v10 = (void *)[v3 copy];
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RBCompoundNoneDomainRestriction *)a3;
  if (self == v4) {
    goto LABEL_10;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()) {
    goto LABEL_3;
  }
  restrictions = self->_restrictions;
  id v8 = v4->_restrictions;
  if (restrictions == v8)
  {
LABEL_10:
    char v6 = 1;
    goto LABEL_11;
  }
  if (restrictions) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char v6 = -[NSArray isEqual:](restrictions, "isEqual:");
    goto LABEL_11;
  }
LABEL_3:
  char v6 = 0;
LABEL_11:

  return v6;
}

- (unint64_t)hash
{
  return [(NSArray *)self->_restrictions hash];
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(id)objc_opt_class() description];
  uint64_t v5 = (void *)[v3 initWithFormat:@"<%@| %@>", v4, self->_restrictions];

  return v5;
}

- (void).cxx_destruct
{
}

@end