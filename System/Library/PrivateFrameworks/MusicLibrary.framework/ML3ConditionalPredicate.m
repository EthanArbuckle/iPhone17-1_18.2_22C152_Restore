@interface ML3ConditionalPredicate
+ (BOOL)supportsSecureCoding;
+ (id)predicateWithConditionPredicate:(id)a3 thenPredicate:(id)a4 elsePredicate:(id)a5;
- (BOOL)isDynamicForEntityClass:(Class)a3;
- (BOOL)isEqual:(id)a3;
- (ML3ConditionalPredicate)initWithCoder:(id)a3;
- (ML3ConditionalPredicate)initWithConditionPredicate:(id)a3 thenPredicate:(id)a4 elsePredicate:(id)a5;
- (ML3Predicate)conditionPredicate;
- (ML3Predicate)elsePredicate;
- (ML3Predicate)thenPredicate;
- (id)SQLJoinClausesForClass:(Class)a3;
- (id)databaseStatementParameters;
- (id)description;
- (id)spotlightPredicate;
- (unint64_t)hash;
- (void)appendSQLToMutableString:(id)a3 entityClass:(Class)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ML3ConditionalPredicate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elsePredicate, 0);
  objc_storeStrong((id *)&self->_thenPredicate, 0);

  objc_storeStrong((id *)&self->_conditionPredicate, 0);
}

- (ML3Predicate)elsePredicate
{
  return self->_elsePredicate;
}

- (ML3Predicate)thenPredicate
{
  return self->_thenPredicate;
}

- (ML3Predicate)conditionPredicate
{
  return self->_conditionPredicate;
}

- (id)spotlightPredicate
{
  v3 = [(ML3Predicate *)self->_conditionPredicate spotlightPredicate];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = [(ML3Predicate *)self->_thenPredicate spotlightPredicate];
    v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [(ML3Predicate *)self->_elsePredicate spotlightPredicate];
    }
    id v5 = v8;
  }

  return v5;
}

- (BOOL)isDynamicForEntityClass:(Class)a3
{
  if (-[ML3Predicate isDynamicForEntityClass:](self->_conditionPredicate, "isDynamicForEntityClass:")
    || [(ML3Predicate *)self->_thenPredicate isDynamicForEntityClass:a3])
  {
    return 1;
  }
  elsePredicate = self->_elsePredicate;

  return [(ML3Predicate *)elsePredicate isDynamicForEntityClass:a3];
}

- (id)databaseStatementParameters
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  conditionPredicate = self->_conditionPredicate;
  if (conditionPredicate)
  {
    id v5 = [(ML3Predicate *)conditionPredicate databaseStatementParameters];
    [v3 addObjectsFromArray:v5];
  }
  thenPredicate = self->_thenPredicate;
  if (thenPredicate)
  {
    v7 = [(ML3Predicate *)thenPredicate databaseStatementParameters];
    [v3 addObjectsFromArray:v7];
  }
  elsePredicate = self->_elsePredicate;
  if (elsePredicate)
  {
    v9 = [(ML3Predicate *)elsePredicate databaseStatementParameters];
    [v3 addObjectsFromArray:v9];
  }

  return v3;
}

- (void)appendSQLToMutableString:(id)a3 entityClass:(Class)a4
{
  id v6 = a3;
  id v8 = v6;
  if (self->_conditionPredicate && self->_thenPredicate)
  {
    objc_msgSend(v6, "appendString:", @"(CASE WHEN ");
    [(ML3Predicate *)self->_conditionPredicate appendSQLToMutableString:v8 entityClass:a4];
    [v8 appendString:@" THEN "];
    [(ML3Predicate *)self->_thenPredicate appendSQLToMutableString:v8 entityClass:a4];
    if (self->_elsePredicate)
    {
      [v8 appendString:@" ELSE "];
      [(ML3Predicate *)self->_elsePredicate appendSQLToMutableString:v8 entityClass:a4];
    }
    else
    {
      [v8 appendString:@" ELSE 1"];
    }
    v7 = @" END");
    id v6 = v8;
  }
  else
  {
    v7 = @"1";
  }
  [v6 appendString:v7];
}

- (id)SQLJoinClausesForClass:(Class)a3
{
  id v5 = [MEMORY[0x1E4F1CA70] orderedSet];
  id v6 = [(ML3ConditionalPredicate *)self conditionPredicate];
  v7 = [v6 SQLJoinClausesForClass:a3];
  [v5 unionOrderedSet:v7];

  id v8 = [(ML3ConditionalPredicate *)self thenPredicate];
  v9 = [v8 SQLJoinClausesForClass:a3];
  [v5 unionOrderedSet:v9];

  v10 = [(ML3ConditionalPredicate *)self elsePredicate];
  v11 = [v10 SQLJoinClausesForClass:a3];
  [v5 unionOrderedSet:v11];

  return v5;
}

- (id)description
{
  id v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)ML3ConditionalPredicate;
  v4 = [(ML3ConditionalPredicate *)&v10 description];
  id v5 = [(ML3ConditionalPredicate *)self conditionPredicate];
  id v6 = [(ML3ConditionalPredicate *)self thenPredicate];
  v7 = [(ML3ConditionalPredicate *)self elsePredicate];
  id v8 = [v3 stringWithFormat:@"%@(If %@ then %@ else %@)", v4, v5, v6, v7];

  return v8;
}

- (unint64_t)hash
{
  v11.receiver = self;
  v11.super_class = (Class)ML3ConditionalPredicate;
  unint64_t v3 = [(ML3Predicate *)&v11 hash];
  v4 = [(ML3ConditionalPredicate *)self conditionPredicate];
  uint64_t v5 = [v4 hash];
  id v6 = [(ML3ConditionalPredicate *)self thenPredicate];
  uint64_t v7 = v5 ^ [v6 hash];
  id v8 = [(ML3ConditionalPredicate *)self elsePredicate];
  unint64_t v9 = v7 ^ [v8 hash] ^ v3;

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ML3ConditionalPredicate *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)ML3ConditionalPredicate;
    if ([(ML3Predicate *)&v15 isEqual:v4])
    {
      id v5 = [(ML3ConditionalPredicate *)self conditionPredicate];
      id v6 = [(ML3ConditionalPredicate *)v4 conditionPredicate];
      if (v5 == v6)
      {
      }
      else
      {
        int v7 = [v5 isEqual:v6];

        if (!v7)
        {
          char v8 = 0;
LABEL_18:

          goto LABEL_19;
        }
      }
      id v9 = [(ML3ConditionalPredicate *)self thenPredicate];
      id v10 = [(ML3ConditionalPredicate *)v4 thenPredicate];
      if (v9 == v10)
      {
      }
      else
      {
        int v11 = [v9 isEqual:v10];

        if (!v11)
        {
          char v8 = 0;
LABEL_17:

          goto LABEL_18;
        }
      }
      v12 = [(ML3ConditionalPredicate *)self elsePredicate];
      v13 = [(ML3ConditionalPredicate *)v4 elsePredicate];
      if (v12 == v13) {
        char v8 = 1;
      }
      else {
        char v8 = [v12 isEqual:v13];
      }

      goto LABEL_17;
    }
    char v8 = 0;
  }
LABEL_19:

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ML3ConditionalPredicate;
  id v4 = a3;
  [(ML3Predicate *)&v8 encodeWithCoder:v4];
  id v5 = [(ML3ConditionalPredicate *)self conditionPredicate];
  [v4 encodeObject:v5 forKey:@"condition"];

  id v6 = [(ML3ConditionalPredicate *)self thenPredicate];
  [v4 encodeObject:v6 forKey:@"then"];

  int v7 = [(ML3ConditionalPredicate *)self elsePredicate];
  [v4 encodeObject:v7 forKey:@"else"];
}

- (ML3ConditionalPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ML3ConditionalPredicate;
  id v5 = [(ML3Predicate *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"condition"];
    conditionPredicate = v5->_conditionPredicate;
    v5->_conditionPredicate = (ML3Predicate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"then"];
    thenPredicate = v5->_thenPredicate;
    v5->_thenPredicate = (ML3Predicate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"else"];
    elsePredicate = v5->_elsePredicate;
    v5->_elsePredicate = (ML3Predicate *)v10;
  }
  return v5;
}

- (ML3ConditionalPredicate)initWithConditionPredicate:(id)a3 thenPredicate:(id)a4 elsePredicate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ML3ConditionalPredicate;
  v12 = [(ML3ConditionalPredicate *)&v15 init];
  objc_super v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_conditionPredicate, a3);
    objc_storeStrong((id *)&v13->_thenPredicate, a4);
    objc_storeStrong((id *)&v13->_elsePredicate, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)predicateWithConditionPredicate:(id)a3 thenPredicate:(id)a4 elsePredicate:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)[objc_alloc((Class)objc_opt_class()) initWithConditionPredicate:v9 thenPredicate:v8 elsePredicate:v7];

  return v10;
}

@end