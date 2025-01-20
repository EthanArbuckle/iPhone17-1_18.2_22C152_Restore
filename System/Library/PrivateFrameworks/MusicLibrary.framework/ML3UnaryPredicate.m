@interface ML3UnaryPredicate
+ (BOOL)supportsSecureCoding;
+ (id)predicateWithPredicate:(id)a3;
- (BOOL)isEqual:(id)a3;
- (ML3Predicate)predicate;
- (ML3UnaryPredicate)initWithCoder:(id)a3;
- (ML3UnaryPredicate)initWithPredicate:(id)a3;
- (id)SQLJoinClausesForClass:(Class)a3;
- (id)databaseStatementParameters;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setPredicate:(id)a3;
@end

@implementation ML3UnaryPredicate

- (void).cxx_destruct
{
}

+ (id)predicateWithPredicate:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithPredicate:v4];

  return v5;
}

- (ML3UnaryPredicate)initWithPredicate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ML3UnaryPredicate;
  v5 = [(ML3UnaryPredicate *)&v8 init];
  v6 = v5;
  if (v5) {
    [(ML3UnaryPredicate *)v5 setPredicate:v4];
  }

  return v6;
}

- (void)setPredicate:(id)a3
{
}

- (ML3Predicate)predicate
{
  return self->_predicate;
}

- (id)databaseStatementParameters
{
  return [(ML3Predicate *)self->_predicate databaseStatementParameters];
}

- (id)SQLJoinClausesForClass:(Class)a3
{
  return [(ML3Predicate *)self->_predicate SQLJoinClausesForClass:a3];
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)ML3UnaryPredicate;
  id v3 = [(ML3Predicate *)&v7 hash];
  id v4 = [(ML3UnaryPredicate *)self predicate];
  unint64_t v5 = (unint64_t)v3 + [v4 hash];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ML3UnaryPredicate *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)ML3UnaryPredicate;
    if ([(ML3Predicate *)&v9 isEqual:v4])
    {
      unint64_t v5 = [(ML3UnaryPredicate *)self predicate];
      v6 = [(ML3UnaryPredicate *)v4 predicate];
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
  v6.super_class = (Class)ML3UnaryPredicate;
  id v4 = a3;
  [(ML3Predicate *)&v6 encodeWithCoder:v4];
  unint64_t v5 = [(ML3UnaryPredicate *)self predicate];
  [v4 encodeObject:v5 forKey:@"predicate"];
}

- (ML3UnaryPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ML3UnaryPredicate;
  unint64_t v5 = [(ML3UnaryPredicate *)&v8 init];
  if (v5)
  {
    objc_super v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"predicate"];
    [(ML3UnaryPredicate *)v5 setPredicate:v6];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end