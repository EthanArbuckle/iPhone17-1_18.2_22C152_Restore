@interface ML3ComparisonPredicate
+ (BOOL)supportsSecureCoding;
+ (id)predicateWithProperty:(id)a3 equalToInt64:(int64_t)a4;
+ (id)predicateWithProperty:(id)a3 equalToInteger:(int64_t)a4;
+ (id)predicateWithProperty:(id)a3 equalToValue:(id)a4;
+ (id)predicateWithProperty:(id)a3 value:(id)a4 comparison:(int)a5;
+ (id)predicateWithProperty:(id)a3 value:(id)a4 comparison:(int)a5 caseInsensitive:(BOOL)a6;
+ (id)predicateWithProperty:(id)a3 value:(id)a4 comparison:(int)a5 caseInsensitive:(BOOL)a6 treatNullAsString:(id)a7;
+ (id)predicateWithProperty:(id)a3 value:(id)a4 comparison:(int)a5 transformFunction:(id)a6;
- (BOOL)caseInsensitive;
- (BOOL)containsPropertyPredicate:(id)a3 matchingValue:(id)a4 usingComparison:(int)a5;
- (BOOL)isEqual:(id)a3;
- (ML3ComparisonPredicate)initWithCoder:(id)a3;
- (ML3ComparisonPredicate)initWithProperty:(id)a3 value:(id)a4 comparison:(int)a5 caseInsensitive:(BOOL)a6 transformFunction:(id)a7 treatNullAsString:(id)a8;
- (NSString)transformFunction;
- (NSString)treatNullAsString;
- (id)databaseStatementParameters;
- (id)description;
- (id)operator;
- (id)value;
- (id)valueToBindForOperation:(int64_t)a3;
- (int)comparison;
- (unint64_t)hash;
- (void)appendSQLToMutableString:(id)a3 entityClass:(Class)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ML3ComparisonPredicate

- (id)databaseStatementParameters
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(ML3ComparisonPredicate *)self valueToBindForOperation:0];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)valueToBindForOperation:(int64_t)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (self->_caseInsensitive) {
      v6 = @"%";
    }
    else {
      v6 = @"*";
    }
    v7 = v6;
    int comparison = self->_comparison;
    switch(comparison)
    {
      case 9:
        [NSString stringWithFormat:@"%@%@", v7, self->_value, v15];
        break;
      case 8:
        [NSString stringWithFormat:@"%@%@", self->_value, v7, v15];
        break;
      case 7:
        [NSString stringWithFormat:@"%@%@%@", v7, self->_value, v7];
        break;
      default:
        id value = self->_value;
        if (a3 == 1)
        {
          if (value)
          {
            if (![value length])
            {
              v9 = @"''";
              goto LABEL_17;
            }
            id v13 = self->_value;
          }
          else
          {
            id v13 = 0;
          }
          v10 = (__CFString *)v13;
        }
        else
        {
          v10 = (__CFString *)value;
        }
LABEL_16:
        v9 = v10;
LABEL_17:

        goto LABEL_18;
    }
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, self, @"ML3Predicate.m", 626, @"Unexpected value in predicate: %@", self->_value object file lineNumber description];
    }
  }
  v9 = (__CFString *)self->_value;
LABEL_18:

  return v9;
}

- (void)appendSQLToMutableString:(id)a3 entityClass:(Class)a4
{
  id v20 = a3;
  v6 = &stru_1F08D4D70;
  if (self->_transformFunction)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%@("), self->_transformFunction;
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (self->_transformFunction) {
      v8 = @"");
    }
    else {
      v8 = &stru_1F08D4D70;
    }
  }
  else
  {
    v8 = &stru_1F08D4D70;
    v7 = &stru_1F08D4D70;
  }
  v9 = v8;
  if (self->_treatNullAsString) {
    v10 = CFSTR("IFNULL(");
  }
  else {
    v10 = &stru_1F08D4D70;
  }
  v11 = v10;
  if (self->_treatNullAsString)
  {
    [NSString stringWithFormat:@", '%@'"], self->_treatNullAsString);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v12 = [(objc_class *)a4 subselectStatementForProperty:self->super._property];
  if (v12
    && ([(objc_class *)a4 subselectPropertyForProperty:self->super._property],
        (uint64_t v13 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v14 = (void *)v13;
    uint64_t v15 = v12;
    v16 = [(objc_class *)a4 disambiguatedSQLForProperty:v14];
  }
  else
  {
    uint64_t v15 = [(objc_class *)a4 disambiguatedSQLForProperty:self->super._property];
    v16 = 0;
  }
  uint64_t v17 = [v16 length];
  objc_msgSend(v20, "appendString:", @"(");
  if (v17)
  {
    [v20 appendString:v16];
    [v20 appendString:@" IN "];
    objc_msgSend(v20, "appendString:", @"(");
    v18 = v15;
  }
  else
  {
    [v20 appendString:v11];
    [v20 appendString:v15];
    v18 = v6;
  }
  [v20 appendString:v18];
  [v20 appendString:@" "];
  v19 = [(ML3ComparisonPredicate *)self operator];
  [v20 appendString:v19];

  [v20 appendString:@" "];
  [v20 appendString:v7];
  [v20 appendString:v11];
  [v20 appendString:@"?"];
  [v20 appendString:v6];
  [v20 appendString:v9];
  [v20 appendString:@""]);
  if ([v16 length]) {
    [v20 appendString:@""]);
  }
}

- (id)operator
{
  int v3 = self->_comparison - 1;
  id result = @"=";
  switch(v3)
  {
    case 0:
      return result;
    case 1:
      id result = @"!=";
      break;
    case 2:
      id result = @">";
      break;
    case 3:
      id result = @">=";
      break;
    case 4:
      id result = @"<";
      break;
    case 5:
      id result = @"<=";
      break;
    case 6:
    case 7:
    case 8:
      if (self->_caseInsensitive) {
        id result = @"LIKE";
      }
      else {
        id result = @"GLOB";
      }
      break;
    case 9:
      id result = @"&";
      break;
    default:
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ML3Predicate.m", 538, @"Unknown comparison: %d", self->_comparison);

      id result = 0;
      break;
  }
  return result;
}

+ (id)predicateWithProperty:(id)a3 value:(id)a4 comparison:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v7 = a4;
  id v8 = a3;
  v9 = (void *)[objc_alloc((Class)objc_opt_class()) initWithProperty:v8 value:v7 comparison:v5 caseInsensitive:0 transformFunction:0 treatNullAsString:0];

  return v9;
}

+ (id)predicateWithProperty:(id)a3 value:(id)a4 comparison:(int)a5 caseInsensitive:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)objc_opt_class()) initWithProperty:v10 value:v9 comparison:v7 caseInsensitive:v6 transformFunction:0 treatNullAsString:0];

  return v11;
}

- (ML3ComparisonPredicate)initWithProperty:(id)a3 value:(id)a4 comparison:(int)a5 caseInsensitive:(BOOL)a6 transformFunction:(id)a7 treatNullAsString:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)ML3ComparisonPredicate;
  v18 = [(ML3PropertyPredicate *)&v23 initWithProperty:v14];
  if (v18)
  {
    if (v15)
    {
      if (a5)
      {
LABEL_4:
        objc_storeStrong(&v18->_value, a4);
        v18->_int comparison = a5;
        v18->_caseInsensitive = a6;
        objc_storeStrong((id *)&v18->_treatNullAsString, a8);
        objc_storeStrong((id *)&v18->_transformFunction, a7);
        goto LABEL_5;
      }
    }
    else
    {
      id v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:a2, v18, @"ML3Predicate.m", 429, @"invalid value (nil) for property %@.", v14 object file lineNumber description];

      if (a5) {
        goto LABEL_4;
      }
    }
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:v18 file:@"ML3Predicate.m" lineNumber:430 description:&stru_1F08D4D70];

    goto LABEL_4;
  }
LABEL_5:

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformFunction, 0);
  objc_storeStrong((id *)&self->_treatNullAsString, 0);

  objc_storeStrong(&self->_value, 0);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ML3ComparisonPredicate *)a3;
  if (v4 == self)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)ML3ComparisonPredicate;
    if ([(ML3PropertyPredicate *)&v18 isEqual:v4])
    {
      id v5 = [(ML3ComparisonPredicate *)self value];
      id v6 = [(ML3ComparisonPredicate *)v4 value];
      if (v5 == v6)
      {
      }
      else
      {
        int v7 = [v5 isEqual:v6];

        if (!v7)
        {
          LOBYTE(v8) = 0;
LABEL_22:

          goto LABEL_23;
        }
      }
      id v9 = [(ML3ComparisonPredicate *)self transformFunction];
      id v10 = [(ML3ComparisonPredicate *)v4 transformFunction];
      if (v9 == v10)
      {
      }
      else
      {
        int v11 = [v9 isEqual:v10];

        if (!v11) {
          goto LABEL_17;
        }
      }
      int v12 = [(ML3ComparisonPredicate *)self comparison];
      if (v12 != [(ML3ComparisonPredicate *)v4 comparison])
      {
LABEL_17:
        LOBYTE(v8) = 0;
LABEL_21:

        goto LABEL_22;
      }
      id v13 = [(ML3ComparisonPredicate *)self treatNullAsString];
      id v14 = [(ML3ComparisonPredicate *)v4 treatNullAsString];
      if (v13 == v14)
      {
      }
      else
      {
        int v15 = [v13 isEqual:v14];

        if (!v15)
        {
          LOBYTE(v8) = 0;
LABEL_20:

          goto LABEL_21;
        }
      }
      BOOL v16 = [(ML3ComparisonPredicate *)self caseInsensitive];
      BOOL v8 = v16 ^ [(ML3ComparisonPredicate *)v4 caseInsensitive] ^ 1;
      goto LABEL_20;
    }
    LOBYTE(v8) = 0;
  }
LABEL_23:

  return v8;
}

- (id)value
{
  return self->_value;
}

- (NSString)treatNullAsString
{
  return self->_treatNullAsString;
}

- (NSString)transformFunction
{
  return self->_transformFunction;
}

- (int)comparison
{
  return self->_comparison;
}

- (BOOL)caseInsensitive
{
  return self->_caseInsensitive;
}

+ (id)predicateWithProperty:(id)a3 equalToInt64:(int64_t)a4
{
  id v6 = NSNumber;
  id v7 = a3;
  BOOL v8 = [v6 numberWithLongLong:a4];
  id v9 = [a1 predicateWithProperty:v7 equalToValue:v8];

  return v9;
}

+ (id)predicateWithProperty:(id)a3 equalToValue:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithProperty:v6 value:v5 comparison:1 caseInsensitive:0 transformFunction:0 treatNullAsString:0];

  return v7;
}

+ (id)predicateWithProperty:(id)a3 equalToInteger:(int64_t)a4
{
  id v6 = NSNumber;
  id v7 = a3;
  BOOL v8 = [v6 numberWithInteger:a4];
  id v9 = [a1 predicateWithProperty:v7 equalToValue:v8];

  return v9;
}

- (BOOL)containsPropertyPredicate:(id)a3 matchingValue:(id)a4 usingComparison:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(ML3PropertyPredicate *)self property];
  int v11 = [v10 isEqualToString:v9];

  if (v11)
  {
    int v12 = [(ML3ComparisonPredicate *)self value];
    char v13 = objc_msgSend(v8, "ml_matchesValue:usingComparison:", v12, v5);
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (id)description
{
  transformFunction = self->_transformFunction;
  v4 = &stru_1F08D4D70;
  if (transformFunction)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%@("), transformFunction;
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (self->_transformFunction) {
      v4 = @"");
    }
  }
  else
  {
    uint64_t v5 = &stru_1F08D4D70;
  }
  id v6 = v4;
  if ([(NSString *)self->super._property isEqualToString:@"media_type"])
  {
    id v7 = NSString;
    id v8 = NSStringFromMLMediaType([self->_value integerValue]);
    id v9 = [v7 stringWithFormat:@" [%@]", v8];
  }
  else
  {
    id v9 = &stru_1F08D4D70;
  }
  id v10 = NSString;
  v17.receiver = self;
  v17.super_class = (Class)ML3ComparisonPredicate;
  int v11 = [(ML3PropertyPredicate *)&v17 description];
  property = self->super._property;
  char v13 = [(ML3ComparisonPredicate *)self operator];
  id v14 = [(ML3ComparisonPredicate *)self valueToBindForOperation:1];
  int v15 = [v10 stringWithFormat:@"%@(%@ %@ %@%@%@)%@", v11, property, v13, v5, v14, v6, v9];

  return v15;
}

- (unint64_t)hash
{
  int v3 = [(ML3PropertyPredicate *)self property];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(ML3ComparisonPredicate *)self value];
  unint64_t v6 = [v5 hash] + v4;

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ML3ComparisonPredicate;
  id v4 = a3;
  [(ML3PropertyPredicate *)&v8 encodeWithCoder:v4];
  uint64_t v5 = [(ML3ComparisonPredicate *)self value];
  [v4 encodeObject:v5 forKey:@"value"];

  objc_msgSend(v4, "encodeInt:forKey:", -[ML3ComparisonPredicate comparison](self, "comparison"), @"comparison");
  objc_msgSend(v4, "encodeBool:forKey:", -[ML3ComparisonPredicate caseInsensitive](self, "caseInsensitive"), @"caseInsensitive");
  unint64_t v6 = [(ML3ComparisonPredicate *)self treatNullAsString];
  [v4 encodeObject:v6 forKey:@"treatNullAsString"];

  id v7 = [(ML3ComparisonPredicate *)self transformFunction];
  [v4 encodeObject:v7 forKey:@"transformFunction"];
}

- (ML3ComparisonPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ML3ComparisonPredicate;
  uint64_t v5 = [(ML3PropertyPredicate *)&v17 initWithCoder:v4];
  if (v5)
  {
    unint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    id v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"value"];
    id value = v5->_value;
    v5->_id value = (id)v10;

    v5->_int comparison = [v4 decodeIntForKey:@"comparison"];
    v5->_caseInsensitive = [v4 decodeBoolForKey:@"caseInsensitive"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"treatNullAsString"];
    treatNullAsString = v5->_treatNullAsString;
    v5->_treatNullAsString = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transformFunction"];
    transformFunction = v5->_transformFunction;
    v5->_transformFunction = (NSString *)v14;
  }
  return v5;
}

+ (id)predicateWithProperty:(id)a3 value:(id)a4 comparison:(int)a5 transformFunction:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = (void *)[objc_alloc((Class)objc_opt_class()) initWithProperty:v11 value:v10 comparison:v6 caseInsensitive:0 transformFunction:v9 treatNullAsString:0];

  return v12;
}

+ (id)predicateWithProperty:(id)a3 value:(id)a4 comparison:(int)a5 caseInsensitive:(BOOL)a6 treatNullAsString:(id)a7
{
  BOOL v7 = a6;
  uint64_t v8 = *(void *)&a5;
  id v11 = a7;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = (void *)[objc_alloc((Class)objc_opt_class()) initWithProperty:v13 value:v12 comparison:v8 caseInsensitive:v7 transformFunction:0 treatNullAsString:v11];

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end