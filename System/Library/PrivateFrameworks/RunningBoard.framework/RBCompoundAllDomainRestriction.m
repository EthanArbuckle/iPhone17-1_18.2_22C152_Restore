@interface RBCompoundAllDomainRestriction
+ (id)domainRestrictionForDictionary:(id)a3 withError:(id *)a4;
- (BOOL)allowsContext:(id)a3 withError:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (id)_initWithRestrictions:(id)a3;
- (id)allEntitlements;
- (id)description;
- (unint64_t)hash;
@end

@implementation RBCompoundAllDomainRestriction

- (BOOL)allowsContext:(id)a3 withError:(id *)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v27 = a3;
  v26 = objc_msgSend(MEMORY[0x263F089D8], "stringWithString:", @"(");
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v6 = self->_restrictions;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v29 objects:v35 count:16];
  char v8 = v7 == 0;
  if (!v7)
  {
    id v10 = 0;
    goto LABEL_19;
  }
  uint64_t v9 = v7;
  BOOL v24 = v7 == 0;
  id v10 = 0;
  uint64_t v11 = *(void *)v30;
  uint64_t v25 = *MEMORY[0x263F08338];
  char v8 = 1;
  char v12 = 1;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      v14 = v10;
      if (*(void *)v30 != v11) {
        objc_enumerationMutation(v6);
      }
      v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
      id v28 = v10;
      char v16 = [v15 allowsContext:v27 withError:&v28];
      id v10 = v28;

      v8 &= v16;
      if ((v16 & 1) == 0 && a4)
      {
        if ((v12 & 1) == 0) {
          [v26 appendString:@" AND "];
        }
        v17 = [v10 userInfo];
        v18 = [v17 objectForKey:v25];
        [v26 appendString:v18];

        char v8 = 0;
        char v12 = 0;
      }
    }
    uint64_t v9 = [(NSArray *)v6 countByEnumeratingWithState:&v29 objects:v35 count:16];
  }
  while (v9);

  if (a4) {
    char v19 = v8;
  }
  else {
    char v19 = 1;
  }
  if ((v19 & 1) == 0)
  {
    [v26 appendString:@""]);
    v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v21 = *MEMORY[0x263F646B8];
    uint64_t v33 = v25;
    v6 = (NSArray *)[v26 copy];
    v34 = v6;
    v22 = [NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    *a4 = [v20 errorWithDomain:v21 code:1 userInfo:v22];

    char v8 = v24;
LABEL_19:
  }
  return v8;
}

- (id)_initWithRestrictions:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RBCompoundAllDomainRestriction;
  v5 = [(RBDomainRestriction *)&v10 _init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    uint64_t v7 = (void *)v5[1];
    v5[1] = v6;

    char v8 = v5;
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

    id v15 = [[RBCompoundAllDomainRestriction alloc] _initWithRestrictions:v7];
  }
  else
  {
    if (!a4)
    {
      id v15 = 0;
      goto LABEL_17;
    }
    char v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v26 = *MEMORY[0x263F08338];
    v17 = [NSString stringWithFormat:@"RBCompoundAllDomainRestriction doesn't specify restrictions: %@", v5];
    v27[0] = v17;
    v18 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];
    char v19 = [v16 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:1 userInfo:v18];

    id v7 = v19;
    id v15 = 0;
    *a4 = v7;
  }
LABEL_16:

LABEL_17:
  return v15;
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

  uint64_t v10 = (void *)[v3 copy];
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RBCompoundAllDomainRestriction *)a3;
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