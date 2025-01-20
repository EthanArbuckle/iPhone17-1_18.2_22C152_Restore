@interface ML3OrderingTerm
+ (BOOL)supportsSecureCoding;
+ (id)orderingTermWithProperty:(id)a3;
+ (id)orderingTermWithProperty:(id)a3 direction:(int)a4;
+ (id)reversedTerms:(id)a3;
- (BOOL)isEqual:(id)a3;
- (ML3OrderingTerm)initWithCoder:(id)a3;
- (ML3OrderingTerm)initWithProperty:(id)a3;
- (ML3OrderingTerm)initWithProperty:(id)a3 direction:(int)a4;
- (ML3OrderingTerm)initWithProperty:(id)a3 direction:(int)a4 collation:(id)a5;
- (NSString)collation;
- (NSString)property;
- (id)description;
- (int)direction;
- (unint64_t)hash;
- (void)appendSQLToMutableString:(id)a3 entityClass:(Class)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ML3OrderingTerm

+ (id)orderingTermWithProperty:(id)a3 direction:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  v6 = [[ML3OrderingTerm alloc] initWithProperty:v5 direction:v4];

  return v6;
}

- (ML3OrderingTerm)initWithProperty:(id)a3 direction:(int)a4
{
  return [(ML3OrderingTerm *)self initWithProperty:a3 direction:*(void *)&a4 collation:0];
}

- (void)appendSQLToMutableString:(id)a3 entityClass:(Class)a4
{
  id v10 = a3;
  BOOL v6 = [(NSString *)self->_property hasPrefix:@"ML3SpotlightMatch"];
  property = self->_property;
  if (v6)
  {
    [v10 appendString:property];
  }
  else
  {
    v8 = [(objc_class *)a4 disambiguatedSQLForProperty:property];
    [v10 appendString:v8];
  }
  if (self->_collation)
  {
    [v10 appendString:@" COLLATE "];
    [v10 appendString:self->_collation];
  }
  v9 = v10;
  if (self->_direction == 2)
  {
    [v10 appendString:@" DESC"];
    v9 = v10;
  }
}

- (NSString)property
{
  return self->_property;
}

+ (id)orderingTermWithProperty:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[ML3OrderingTerm alloc] initWithProperty:v3];

  return v4;
}

- (ML3OrderingTerm)initWithProperty:(id)a3
{
  return [(ML3OrderingTerm *)self initWithProperty:a3 direction:1 collation:0];
}

- (ML3OrderingTerm)initWithProperty:(id)a3 direction:(int)a4 collation:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ML3OrderingTerm;
  id v10 = [(ML3OrderingTerm *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    property = v10->_property;
    v10->_property = (NSString *)v11;

    v10->_direction = a4;
    uint64_t v13 = [v9 copy];
    collation = v10->_collation;
    v10->_collation = (NSString *)v13;
  }
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collation, 0);

  objc_storeStrong((id *)&self->_property, 0);
}

- (NSString)collation
{
  return self->_collation;
}

- (int)direction
{
  return self->_direction;
}

- (id)description
{
  if (self->_direction == 1) {
    id v3 = @"ascending";
  }
  else {
    id v3 = @"descending";
  }
  uint64_t v4 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)ML3OrderingTerm;
  id v5 = v3;
  BOOL v6 = [(ML3OrderingTerm *)&v9 description];
  v7 = [v4 stringWithFormat:@"%@(%@ %@)", v6, self->_property, v5];

  return v7;
}

- (ML3OrderingTerm)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"property"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"direction"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"collation"];

  id v8 = [(ML3OrderingTerm *)self initWithProperty:v5 direction:v6 collation:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  property = self->_property;
  id v5 = a3;
  [v5 encodeObject:property forKey:@"property"];
  [v5 encodeInteger:self->_direction forKey:@"direction"];
  [v5 encodeObject:self->_collation forKey:@"collation"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (NSString **)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ((property = self->_property, property == v4[2]) || -[NSString isEqual:](property, "isEqual:"))
    && self->_direction == *((_DWORD *)v4 + 2))
  {
    collation = self->_collation;
    if (collation == v4[3]) {
      char v7 = 1;
    }
    else {
      char v7 = -[NSString isEqual:](collation, "isEqual:");
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return [(NSString *)self->_property hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)reversedTerms:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "property", (void)v15);
        if ([v10 direction] == 2) {
          uint64_t v12 = 1;
        }
        else {
          uint64_t v12 = 2;
        }
        uint64_t v13 = +[ML3OrderingTerm orderingTermWithProperty:v11 direction:v12];
        [v4 addObject:v13];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

@end