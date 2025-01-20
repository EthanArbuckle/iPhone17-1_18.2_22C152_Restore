@interface ML3PropertyPredicate
+ (BOOL)supportsSecureCoding;
+ (id)predicateWithProperty:(id)a3;
- (BOOL)isDynamicForEntityClass:(Class)a3;
- (BOOL)isEqual:(id)a3;
- (ML3PropertyPredicate)initWithCoder:(id)a3;
- (ML3PropertyPredicate)initWithProperty:(id)a3;
- (NSString)property;
- (id)SQLJoinClausesForClass:(Class)a3;
- (id)description;
- (unint64_t)hash;
- (void)appendSQLToMutableString:(id)a3 entityClass:(Class)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setProperty:(id)a3;
@end

@implementation ML3PropertyPredicate

- (void).cxx_destruct
{
}

- (id)SQLJoinClausesForClass:(Class)a3
{
  v5 = [(objc_class *)a3 subselectStatementForProperty:self->_property];
  if (v5
    || ([(objc_class *)a3 joinClausesForProperty:self->_property],
        (uint64_t v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v6 = 0;
  }
  else
  {
    v8 = (void *)v7;
    v6 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v7];
  }

  return v6;
}

- (void)appendSQLToMutableString:(id)a3 entityClass:(Class)a4
{
  property = self->_property;
  id v6 = a3;
  id v7 = [(objc_class *)a4 disambiguatedSQLForProperty:property];
  [v6 appendString:v7];
}

+ (id)predicateWithProperty:(id)a3
{
  id v3 = a3;
  v4 = [[ML3PropertyPredicate alloc] initWithProperty:v3];

  return v4;
}

- (ML3PropertyPredicate)initWithProperty:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ML3PropertyPredicate;
  v5 = [(ML3PropertyPredicate *)&v8 init];
  id v6 = v5;
  if (v5) {
    [(ML3PropertyPredicate *)v5 setProperty:v4];
  }

  return v6;
}

- (void)setProperty:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ML3PropertyPredicate *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)ML3PropertyPredicate;
    if ([(ML3Predicate *)&v9 isEqual:v4])
    {
      v5 = [(ML3PropertyPredicate *)self property];
      id v6 = [(ML3PropertyPredicate *)v4 property];
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

- (NSString)property
{
  return self->_property;
}

- (BOOL)isDynamicForEntityClass:(Class)a3
{
  return [(objc_class *)a3 libraryContentsChangeForProperty:self->_property] ^ 1;
}

- (id)description
{
  id v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)ML3PropertyPredicate;
  id v4 = [(ML3PropertyPredicate *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@(%@)", v4, self->_property];

  return v5;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)ML3PropertyPredicate;
  id v3 = [(ML3Predicate *)&v7 hash];
  id v4 = [(ML3PropertyPredicate *)self property];
  unint64_t v5 = (unint64_t)v3 + [v4 hash];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ML3PropertyPredicate;
  id v4 = a3;
  [(ML3Predicate *)&v6 encodeWithCoder:v4];
  unint64_t v5 = [(ML3PropertyPredicate *)self property];
  [v4 encodeObject:v5 forKey:@"property"];
}

- (ML3PropertyPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ML3PropertyPredicate;
  unint64_t v5 = [(ML3Predicate *)&v8 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"property"];
    [(ML3PropertyPredicate *)v5 setProperty:v6];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end