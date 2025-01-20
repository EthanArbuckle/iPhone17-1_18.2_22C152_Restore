@interface RBCompoundAnyDomainRestriction
+ (id)domainRestrictionForDictionary:(id)a3 withError:(id *)a4;
- (BOOL)allowsContext:(id)a3 withError:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (id)_initWithRestrictions:(id)a3;
- (id)allEntitlements;
- (id)description;
- (unint64_t)hash;
@end

@implementation RBCompoundAnyDomainRestriction

- (BOOL)allowsContext:(id)a3 withError:(id *)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v7 = self->_restrictions;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v39 objects:v46 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v40;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v40 != v10) {
          objc_enumerationMutation(v7);
        }
        if ([*(id *)(*((void *)&v39 + 1) + 8 * i) allowsContext:v6 withError:0])
        {
          BOOL v31 = 1;
          goto LABEL_24;
        }
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v39 objects:v46 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  if (a4)
  {
    v33 = a4;
    objc_msgSend(MEMORY[0x263F089D8], "stringWithString:", @"(");
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v12 = self->_restrictions;
    uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v35 objects:v45 count:16];
    uint64_t v14 = *MEMORY[0x263F08338];
    if (v13)
    {
      uint64_t v15 = v13;
      uint64_t v16 = *(void *)v36;
      char v17 = 1;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v36 != v16) {
            objc_enumerationMutation(v12);
          }
          v19 = *(void **)(*((void *)&v35 + 1) + 8 * j);
          if ((v17 & 1) == 0) {
            [(NSArray *)v7 appendString:@" AND "];
          }
          id v34 = 0;
          int v20 = [v19 allowsContext:v6 withError:&v34];
          id v21 = v34;
          if (v20) {
            -[RBCompoundAnyDomainRestriction allowsContext:withError:]();
          }
          v22 = v21;
          if (!v21) {
            -[RBCompoundAnyDomainRestriction allowsContext:withError:]();
          }
          v23 = [v21 userInfo];
          v24 = [v23 objectForKey:v14];
          if (!v24) {
            -[RBCompoundAnyDomainRestriction allowsContext:withError:]();
          }

          v25 = [v22 userInfo];
          v26 = [v25 objectForKey:v14];
          [(NSArray *)v7 appendString:v26];

          char v17 = 0;
        }
        uint64_t v15 = [(NSArray *)v12 countByEnumeratingWithState:&v35 objects:v45 count:16];
        char v17 = 0;
      }
      while (v15);
    }

    [(NSArray *)v7 appendString:@""]);
    v27 = (void *)MEMORY[0x263F087E8];
    uint64_t v28 = *MEMORY[0x263F646B8];
    uint64_t v43 = v14;
    v29 = (void *)[(NSArray *)v7 copy];
    v44 = v29;
    v30 = [NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
    id *v33 = [v27 errorWithDomain:v28 code:1 userInfo:v30];

    BOOL v31 = 0;
LABEL_24:
  }
  else
  {
    BOOL v31 = 0;
  }

  return v31;
}

- (id)_initWithRestrictions:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RBCompoundAnyDomainRestriction;
  v5 = [(RBDomainRestriction *)&v10 _init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    v7 = (void *)v5[1];
    v5[1] = v6;

    uint64_t v8 = v5;
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
          uint64_t v14 = (void *)v13;
          [v7 addObject:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    id v15 = [[RBCompoundAnyDomainRestriction alloc] _initWithRestrictions:v7];
  }
  else
  {
    if (!a4)
    {
      id v15 = 0;
      goto LABEL_17;
    }
    uint64_t v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v26 = *MEMORY[0x263F08338];
    char v17 = [NSString stringWithFormat:@"RBCompoundAnyDomainRestriction doesn't specify restrictions: %@", v5];
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
  id v4 = (RBCompoundAnyDomainRestriction *)a3;
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

- (void)allowsContext:withError:.cold.1()
{
}

- (void)allowsContext:withError:.cold.2()
{
}

- (void)allowsContext:withError:.cold.3()
{
}

@end