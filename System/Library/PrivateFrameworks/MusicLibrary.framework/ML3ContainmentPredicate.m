@interface ML3ContainmentPredicate
+ (BOOL)supportsSecureCoding;
+ (id)predicateWithProperty:(id)a3 values:(id)a4;
- (BOOL)containsPropertyPredicate:(id)a3 matchingValue:(id)a4 usingComparison:(int)a5;
- (BOOL)isEqual:(id)a3;
- (ML3ContainmentPredicate)initWithCoder:(id)a3;
- (ML3ContainmentPredicate)initWithProperty:(id)a3 values:(id)a4;
- (NSSet)values;
- (id)_orderedValues;
- (id)databaseStatementParameters;
- (id)description;
- (unint64_t)hash;
- (void)appendSQLToMutableString:(id)a3 entityClass:(Class)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setValues:(id)a3;
@end

@implementation ML3ContainmentPredicate

- (void).cxx_destruct
{
}

- (void)setValues:(id)a3
{
}

- (NSSet)values
{
  return self->_values;
}

- (BOOL)containsPropertyPredicate:(id)a3 matchingValue:(id)a4 usingComparison:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [(ML3PropertyPredicate *)self property];
  int v11 = [v10 isEqualToString:v8];

  if (v11)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v12 = [(ML3ContainmentPredicate *)self values];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          if (objc_msgSend(v9, "ml_matchesValue:usingComparison:", *(void *)(*((void *)&v19 + 1) + 8 * i), v5))
          {
            BOOL v17 = 1;
            goto LABEL_13;
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
    BOOL v17 = 0;
LABEL_13:
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (id)databaseStatementParameters
{
  v2 = [(ML3ContainmentPredicate *)self _orderedValues];
  v3 = (void *)[v2 copy];

  return v3;
}

- (void)appendSQLToMutableString:(id)a3 entityClass:(Class)a4
{
  id v11 = a3;
  v6 = [(objc_class *)a4 disambiguatedSQLForProperty:self->super._property];
  v7 = [(ML3ContainmentPredicate *)self _orderedValues];
  [v11 appendString:v6];
  if ([v7 count] == 1)
  {
    [v11 appendString:@" = "];
    [v11 appendString:@" ? "];
  }
  else
  {
    objc_msgSend(v11, "appendString:", @" IN (");
    id v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    if ([v7 count])
    {
      unint64_t v9 = 0;
      do
      {
        [v8 addObject:@"?"];
        ++v9;
      }
      while (v9 < [v7 count]);
    }
    if ([v8 count])
    {
      v10 = [v8 componentsJoinedByString:@","];
      [v11 appendString:v10];
    }
    [v11 appendString:@""]);
  }
}

- (id)description
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = [(ML3ContainmentPredicate *)self _orderedValues];
  if ([(NSString *)self->super._property isEqualToString:@"media_type"])
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = NSStringFromMLMediaType([*(id *)(*((void *)&v19 + 1) + 8 * i) integerValue]);
          [v4 addObject:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v7);
    }

    id v11 = NSString;
    v12 = [v4 componentsJoinedByString:@", "];
    uint64_t v13 = [v11 stringWithFormat:@" [%@]", v12];
  }
  else
  {
    uint64_t v13 = &stru_1F08D4D70;
  }
  uint64_t v14 = NSString;
  v18.receiver = self;
  v18.super_class = (Class)ML3ContainmentPredicate;
  uint64_t v15 = [(ML3PropertyPredicate *)&v18 description];
  v16 = objc_msgSend(v14, "stringWithFormat:", @"%@(%@ IN (%@)%@"), v15, self->super._property, v3, v13;

  return v16;
}

- (unint64_t)hash
{
  v3 = [(ML3PropertyPredicate *)self property];
  uint64_t v4 = [v3 hash];
  id v5 = [(ML3ContainmentPredicate *)self values];
  unint64_t v6 = [v5 hash] + v4;

  return v6;
}

- (id)_orderedValues
{
  v2 = [(ML3ContainmentPredicate *)self values];
  v3 = [v2 allObjects];
  uint64_t v4 = [v3 sortedArrayUsingSelector:sel_compare_];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (ML3ContainmentPredicate *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)ML3ContainmentPredicate;
    if ([(ML3PropertyPredicate *)&v9 isEqual:v4])
    {
      id v5 = [(ML3ContainmentPredicate *)self values];
      unint64_t v6 = [(ML3ContainmentPredicate *)v4 values];
      if (v5 == v6) {
        char v7 = 1;
      }
      else {
        char v7 = [v5 isEqual:v6];
      }
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ML3ContainmentPredicate;
  id v4 = a3;
  [(ML3PropertyPredicate *)&v6 encodeWithCoder:v4];
  id v5 = [(ML3ContainmentPredicate *)self values];
  [v4 encodeObject:v5 forKey:@"values"];
}

- (ML3ContainmentPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ML3ContainmentPredicate;
  id v5 = [(ML3PropertyPredicate *)&v13 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    id v11 = [v4 decodeObjectOfClasses:v10 forKey:@"values"];
    [(ML3ContainmentPredicate *)v5 setValues:v11];
  }
  return v5;
}

- (ML3ContainmentPredicate)initWithProperty:(id)a3 values:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ML3ContainmentPredicate;
  uint64_t v9 = [(ML3PropertyPredicate *)&v12 initWithProperty:v7];
  if (v9)
  {
    if (!v8)
    {
      id v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2, v9, @"ML3Predicate.m", 329, @"invalid value (nil) for property %@.", v7 object file lineNumber description];
    }
    [(ML3ContainmentPredicate *)v9 setValues:v8];
  }

  return v9;
}

+ (id)predicateWithProperty:(id)a3 values:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithProperty:v6 values:v5];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end