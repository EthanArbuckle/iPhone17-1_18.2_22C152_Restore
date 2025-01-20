@interface ML3ContainsPredicate
+ (BOOL)supportsSecureCoding;
+ (id)predicateWithProperty:(id)a3 valueSet:(id)a4;
+ (id)predicateWithProperty:(id)a3 values:(id)a4;
- (BOOL)containsPropertyPredicate:(id)a3 matchingValue:(id)a4 usingComparison:(int)a5;
- (BOOL)isEqual:(id)a3;
- (ML3ContainsPredicate)initWithCoder:(id)a3;
- (ML3ContainsPredicate)initWithProperty:(id)a3 values:(id)a4;
- (id)databaseStatementParameters;
- (id)description;
- (id)values;
- (void)appendSQLToMutableString:(id)a3 entityClass:(Class)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setValues:(id)a3;
@end

@implementation ML3ContainsPredicate

- (void).cxx_destruct
{
}

- (void)setValues:(id)a3
{
}

- (id)values
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
    id v12 = self->_values;
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
          if (objc_msgSend(v9, "ml_matchesValue:usingComparison:", *(void *)(*((void *)&v19 + 1) + 8 * i), v5, (void)v19))
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
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_values)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(self->_values, "count"));
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = self->_values;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(v3, "addObject:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)appendSQLToMutableString:(id)a3 entityClass:(Class)a4
{
  id v10 = a3;
  uint64_t v6 = [(objc_class *)a4 disambiguatedSQLForProperty:self->super._property];
  [v10 appendString:v6];

  objc_msgSend(v10, "appendString:", @" IN (");
  uint64_t v7 = [self->_values count];
  if (v7)
  {
    uint64_t v8 = v7;
    [v10 appendString:@"?"];
    uint64_t v9 = v8 - 1;
    if (v8 != 1)
    {
      do
      {
        [v10 appendString:@",?"];
        --v9;
      }
      while (v9);
    }
  }
  [v10 appendString:@""]);
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)ML3ContainsPredicate;
  id v4 = [(ML3PropertyPredicate *)&v7 description];
  uint64_t v5 = [v3 stringWithFormat:@"%@(%@ IN %@)", v4, self->super._property, self->_values];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ML3ContainsPredicate *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)ML3ContainsPredicate;
    if ([(ML3PropertyPredicate *)&v9 isEqual:v4])
    {
      uint64_t v5 = [(ML3ContainsPredicate *)self values];
      uint64_t v6 = [(ML3ContainsPredicate *)v4 values];
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
  v6.super_class = (Class)ML3ContainsPredicate;
  id v4 = a3;
  [(ML3PropertyPredicate *)&v6 encodeWithCoder:v4];
  uint64_t v5 = [(ML3ContainsPredicate *)self values];
  [v4 encodeObject:v5 forKey:@"values"];
}

- (ML3ContainsPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ML3ContainsPredicate;
  uint64_t v5 = [(ML3PropertyPredicate *)&v9 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = MSVPropertyListDataClasses();
    char v7 = [v4 decodeObjectOfClasses:v6 forKey:@"value"];
    [(ML3ContainsPredicate *)v5 setValues:v7];
  }
  return v5;
}

- (ML3ContainsPredicate)initWithProperty:(id)a3 values:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)ML3ContainsPredicate;
  char v7 = [(ML3PropertyPredicate *)&v10 initWithProperty:a3];
  uint64_t v8 = v7;
  if (v7) {
    [(ML3ContainsPredicate *)v7 setValues:v6];
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)predicateWithProperty:(id)a3 valueSet:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)[objc_alloc((Class)a1) initWithProperty:v7 values:v6];

  return v8;
}

+ (id)predicateWithProperty:(id)a3 values:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)[objc_alloc((Class)a1) initWithProperty:v7 values:v6];

  return v8;
}

@end