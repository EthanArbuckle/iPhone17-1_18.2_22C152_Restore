@interface ML3SearchStringPredicate
+ (BOOL)supportsSecureCoding;
+ (id)predicateWithConcatenatedProperties:(id)a3 searchString:(id)a4;
- (BOOL)isDynamicForEntityClass:(Class)a3;
- (BOOL)isEqual:(id)a3;
- (ML3SearchStringPredicate)initWithCoder:(id)a3;
- (ML3SearchStringPredicate)initWithConcatenatedProperties:(id)a3 searchString:(id)a4;
- (NSArray)properties;
- (NSString)searchString;
- (id)SQLJoinClausesForClass:(Class)a3;
- (id)databaseStatementParameters;
- (id)description;
- (unint64_t)hash;
- (void)appendSQLToMutableString:(id)a3 entityClass:(Class)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setProperties:(id)a3;
- (void)setSearchString:(id)a3;
@end

@implementation ML3SearchStringPredicate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchString, 0);

  objc_storeStrong((id *)&self->_properties, 0);
}

- (void)setSearchString:(id)a3
{
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setProperties:(id)a3
{
}

- (NSArray)properties
{
  return self->_properties;
}

- (BOOL)isDynamicForEntityClass:(Class)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = self->_properties;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (!-[objc_class libraryContentsChangeForProperty:](a3, "libraryContentsChangeForProperty:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (id)databaseStatementParameters
{
  v5[1] = *MEMORY[0x1E4F143B8];
  searchString = (__CFString *)self->_searchString;
  if (!searchString) {
    searchString = &stru_1F08D4D70;
  }
  v5[0] = searchString;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (void)appendSQLToMutableString:(id)a3 entityClass:(Class)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(NSArray *)self->_properties count])
  {
    [v6 appendString:@"ML3SearchStringMatch"];
    objc_msgSend(v6, "appendString:", @"(?, ");
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v7 = self->_properties;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      char v10 = 0;
      uint64_t v11 = *(void *)v18;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * v12);
          if (v10) {
            [v6 appendString:@" || ' ' || "];
          }
          long long v14 = [(objc_class *)a4 disambiguatedSQLForProperty:v13];
          v15 = [NSString stringWithFormat:@"coalesce(%@, '')", v14];
          [v6 appendString:v15];

          ++v12;
          char v10 = 1;
        }
        while (v9 != v12);
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }

    uint64_t v16 = @"");
  }
  else
  {
    uint64_t v16 = @"0";
  }
  [v6 appendString:v16];
}

- (id)SQLJoinClausesForClass:(Class)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = self->_properties;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = [(objc_class *)a3 joinClausesForProperty:*(void *)(*((void *)&v21 + 1) + 8 * i)];
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v18;
          do
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v18 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * j);
              if (!v5)
              {
                uint64_t v5 = [MEMORY[0x1E4F1CA70] orderedSet];
              }
              [v5 addObject:v13];
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
          }
          while (v10);
        }
      }
      uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)description
{
  uint64_t v3 = [(NSArray *)self->_properties componentsJoinedByString:@" + "];
  uint64_t v4 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ML3SearchStringPredicate;
  uint64_t v5 = [(ML3SearchStringPredicate *)&v8 description];
  uint64_t v6 = [v4 stringWithFormat:@"%@((%@) matches '%@')", v5, v3, self->_searchString];

  return v6;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)ML3SearchStringPredicate;
  unint64_t v3 = [(ML3Predicate *)&v7 hash];
  uint64_t v4 = [(ML3SearchStringPredicate *)self searchString];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (ML3SearchStringPredicate *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)ML3SearchStringPredicate;
    if ([(ML3Predicate *)&v12 isEqual:v4])
    {
      id v5 = [(ML3SearchStringPredicate *)self properties];
      id v6 = [(ML3SearchStringPredicate *)v4 properties];
      if (v5 == v6)
      {
      }
      else
      {
        int v7 = [v5 isEqual:v6];

        if (!v7)
        {
          char v8 = 0;
LABEL_13:

          goto LABEL_14;
        }
      }
      uint64_t v9 = [(ML3SearchStringPredicate *)self searchString];
      uint64_t v10 = [(ML3SearchStringPredicate *)v4 searchString];
      if (v9 == v10) {
        char v8 = 1;
      }
      else {
        char v8 = [v9 isEqual:v10];
      }

      goto LABEL_13;
    }
    char v8 = 0;
  }
LABEL_14:

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ML3SearchStringPredicate;
  id v4 = a3;
  [(ML3Predicate *)&v7 encodeWithCoder:v4];
  id v5 = [(ML3SearchStringPredicate *)self properties];
  [v4 encodeObject:v5 forKey:@"properties"];

  id v6 = [(ML3SearchStringPredicate *)self searchString];
  [v4 encodeObject:v6 forKey:@"searchString"];
}

- (ML3SearchStringPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ML3SearchStringPredicate;
  id v5 = [(ML3Predicate *)&v12 initWithCoder:v4];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    char v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"properties"];
    [(ML3SearchStringPredicate *)v5 setProperties:v9];

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"searchString"];
    [(ML3SearchStringPredicate *)v5 setSearchString:v10];
  }
  return v5;
}

- (ML3SearchStringPredicate)initWithConcatenatedProperties:(id)a3 searchString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ML3SearchStringPredicate;
  char v8 = [(ML3SearchStringPredicate *)&v11 init];
  uint64_t v9 = v8;
  if (v8)
  {
    [(ML3SearchStringPredicate *)v8 setProperties:v6];
    [(ML3SearchStringPredicate *)v9 setSearchString:v7];
  }

  return v9;
}

+ (id)predicateWithConcatenatedProperties:(id)a3 searchString:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithConcatenatedProperties:v6 searchString:v5];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end