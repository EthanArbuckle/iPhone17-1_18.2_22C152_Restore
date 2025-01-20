@interface RTPredicateValidator
+ (BOOL)validatePredicate:(id)a3 allowedKeys:(id)a4 error:(id *)a5;
- (BOOL)validateWithError:(id *)a3;
- (BOOL)validated;
- (NSError)error;
- (NSPredicate)predicate;
- (NSSet)allowedKeys;
- (RTPredicateValidator)initWithPredicate:(id)a3 allowedKeys:(id)a4;
- (void)setAllowedKeys:(id)a3;
- (void)setError:(id)a3;
- (void)setPredicate:(id)a3;
- (void)setValidated:(BOOL)a3;
- (void)visitPredicateExpression:(id)a3;
@end

@implementation RTPredicateValidator

+ (BOOL)validatePredicate:(id)a3 allowedKeys:(id)a4 error:(id *)a5
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)[objc_alloc((Class)a1) initWithPredicate:v9 allowedKeys:v8];

  if (v10)
  {
    LOBYTE(a5) = [v10 validateWithError:a5];
  }
  else if (a5)
  {
    uint64_t v13 = *MEMORY[0x1E4F28568];
    v14[0] = @"Predicate was invalid because it was nil.";
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:0 userInfo:v11];

    LOBYTE(a5) = 0;
  }

  return (char)a5;
}

- (RTPredicateValidator)initWithPredicate:(id)a3 allowedKeys:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v15.receiver = self;
    v15.super_class = (Class)RTPredicateValidator;
    id v8 = [(RTPredicateValidator *)&v15 init];
    if (v8)
    {
      uint64_t v9 = [v6 copy];
      predicate = v8->_predicate;
      v8->_predicate = (NSPredicate *)v9;

      if (v7)
      {
        uint64_t v11 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
        allowedKeys = v8->_allowedKeys;
        v8->_allowedKeys = (NSSet *)v11;
      }
    }
    self = v8;
    uint64_t v13 = self;
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (BOOL)validateWithError:(id *)a3
{
  [(RTPredicateValidator *)self setValidated:1];
  uint64_t v5 = [(RTPredicateValidator *)self predicate];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = [(RTPredicateValidator *)self allowedKeys];

    if (v7)
    {
      id v8 = [(RTPredicateValidator *)self predicate];
      [v8 acceptVisitor:self flags:3];

      if (a3)
      {
        uint64_t v9 = [(RTPredicateValidator *)self error];

        if (v9)
        {
          *a3 = [(RTPredicateValidator *)self error];
        }
      }
    }
  }

  return [(RTPredicateValidator *)self validated];
}

- (void)visitPredicateExpression:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(RTPredicateValidator *)self validated]) {
    goto LABEL_32;
  }
  id v5 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v29 = [v5 initWithObjects:*MEMORY[0x1E4F281E0], *MEMORY[0x1E4F28200], *MEMORY[0x1E4F28238], *MEMORY[0x1E4F28240], *MEMORY[0x1E4F28248], *MEMORY[0x1E4F285B0], *MEMORY[0x1E4F28748], *MEMORY[0x1E4F28910], *MEMORY[0x1E4F28AA0], *MEMORY[0x1E4F28AA8], *MEMORY[0x1E4F28AB0], 0];
  uint64_t v6 = [v4 expressionType];
  id v28 = v4;
  if (v6 != 10)
  {
    if (v6 == 4)
    {
      v21 = (void *)MEMORY[0x1E4F28C68];
      v22 = [v4 function];
      v23 = [v4 arguments];
      v24 = [v21 expressionForFunction:v22 arguments:v23];

      if (!v24)
      {
        [(RTPredicateValidator *)self setValidated:0];
        v25 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:0 userInfo:0];
        [(RTPredicateValidator *)self setError:v25];

        v24 = 0;
      }

      goto LABEL_31;
    }
    if (v6 != 3) {
      goto LABEL_31;
    }
  }
  v27 = [v4 keyPath];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v26 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:0 userInfo:0];
    [(RTPredicateValidator *)self setError:v26];

    [(RTPredicateValidator *)self setValidated:0];
    goto LABEL_30;
  }
  id v7 = [v4 keyPath];
  id v8 = [v7 componentsSeparatedByString:@"."];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v9 = v8;
  v10 = 0;
  uint64_t v11 = [v9 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (!v11) {
    goto LABEL_23;
  }
  uint64_t v12 = *(void *)v31;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v31 != v12) {
        objc_enumerationMutation(v9);
      }
      v14 = *(void **)(*((void *)&v30 + 1) + 8 * i);
      if ([v14 hasPrefix:@"@"])
      {
        if ((unint64_t)[v14 length] < 2) {
          goto LABEL_20;
        }
        objc_super v15 = [v14 substringFromIndex:1];
        if (([v29 containsObject:v15] & 1) == 0) {
          [(RTPredicateValidator *)self setValidated:0];
        }
      }
      else
      {
        v16 = [(RTPredicateValidator *)self allowedKeys];
        char v17 = [v16 containsObject:v14];

        if ((v17 & 1) == 0)
        {
LABEL_20:
          [(RTPredicateValidator *)self setValidated:0];
          continue;
        }
        if (!v10) {
          v10 = objc_opt_new();
        }
        [v10 addObject:v14];
      }
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v30 objects:v36 count:16];
  }
  while (v11);
LABEL_23:

  if (![(RTPredicateValidator *)self validated])
  {
    uint64_t v34 = *MEMORY[0x1E4F28568];
    v18 = [NSString stringWithFormat:@"Used keys: %@", v10];
    v35 = v18;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];

    v20 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:0 userInfo:v19];
    [(RTPredicateValidator *)self setError:v20];
  }
LABEL_30:

LABEL_31:
  id v4 = v28;
LABEL_32:
}

- (BOOL)validated
{
  return self->_validated;
}

- (void)setValidated:(BOOL)a3
{
  self->_validated = a3;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
}

- (NSSet)allowedKeys
{
  return self->_allowedKeys;
}

- (void)setAllowedKeys:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_allowedKeys, 0);

  objc_storeStrong((id *)&self->_predicate, 0);
}

@end