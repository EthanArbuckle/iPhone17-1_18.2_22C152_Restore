@interface PDPredicateValidator
+ (id)validatePredicate:(id)a3 allowedKeysAndOperators:(id)a4 error:(id *)a5;
- (PDPredicateValidator)init;
- (PDPredicateValidator)initWithPredicate:(id)a3 allowedKeysAndOperators:(id)a4;
- (id)validateWithError:(id *)a3;
- (void)visitPredicateExpression:(id)a3;
- (void)visitPredicateOperator:(id)a3;
@end

@implementation PDPredicateValidator

+ (id)validatePredicate:(id)a3 allowedKeysAndOperators:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = [[PDPredicateValidator alloc] initWithPredicate:v8 allowedKeysAndOperators:v7];

  if (v9)
  {
    v10 = [(PDPredicateValidator *)v9 validateWithError:a5];
  }
  else
  {
    if (a5)
    {
      *a5 = +[NSError errorWithDomain:PKRulesErrorDomain code:4 userInfo:0];
    }
    v10 = [[PDPredicateValidationResult alloc] initWithValid:0 usedKeys:0];
  }
  v11 = v10;

  return v11;
}

- (PDPredicateValidator)init
{
  return 0;
}

- (PDPredicateValidator)initWithPredicate:(id)a3 allowedKeysAndOperators:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v15.receiver = self;
    v15.super_class = (Class)PDPredicateValidator;
    id v8 = [(PDPredicateValidator *)&v15 init];
    if (v8)
    {
      v9 = (NSPredicate *)[v6 copy];
      predicate = v8->_predicate;
      v8->_predicate = v9;

      if (v7)
      {
        v11 = (NSDictionary *)[v7 copy];
        allowedKeysAndOperators = v8->_allowedKeysAndOperators;
        v8->_allowedKeysAndOperators = v11;
      }
    }
    self = v8;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)validateWithError:(id *)a3
{
  *(_WORD *)&self->_validatedPredicate = 257;
  v5 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  usedKeys = self->_usedKeys;
  self->_usedKeys = v5;

  self->_allowedOperators = 0;
  predicate = self->_predicate;
  if (predicate)
  {
    if (self->_allowedKeysAndOperators)
    {
      [(NSPredicate *)predicate acceptVisitor:self flags:3];
      if (a3)
      {
        error = self->_error;
        if (error) {
          *a3 = error;
        }
      }
    }
  }
  v9 = [PDPredicateValidationResult alloc];
  BOOL v10 = self->_validatedPredicate && self->_validatedOperator;
  v11 = [(PDPredicateValidationResult *)v9 initWithValid:v10 usedKeys:self->_usedKeys];
  return v11;
}

- (void)visitPredicateExpression:(id)a3
{
  uint64_t v4 = (uint64_t)a3;
  v5 = (void *)v4;
  if (self->_validatedPredicate)
  {
    v13 = (void *)v4;
    uint64_t v4 = (uint64_t)[(id)v4 expressionType];
    if (v4 > 9)
    {
      v5 = v13;
      if (v4 == 19)
      {
LABEL_12:
        self->_validatedPredicate = 0;
        BOOL v10 = +[NSError errorWithDomain:PKRulesErrorDomain code:6 userInfo:0];
        error = self->_error;
        self->_error = v10;
        goto LABEL_15;
      }
      if (v4 != 10) {
        goto LABEL_16;
      }
    }
    else
    {
      v5 = v13;
      if (v4 != 3)
      {
        if (v4 != 4) {
          goto LABEL_16;
        }
        goto LABEL_12;
      }
    }
    error = [v5 keyPath];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (([error hasPrefix:@"@"] & 1) == 0)
      {
        id v7 = [(NSDictionary *)self->_allowedKeysAndOperators allKeys];
        unsigned __int8 v8 = [v7 containsObject:error];

        if (v8)
        {
          [(NSMutableSet *)self->_usedKeys addObject:error];
          v9 = [(NSDictionary *)self->_allowedKeysAndOperators objectForKeyedSubscript:error];
          self->_allowedOperators |= (unint64_t)[v9 unsignedIntegerValue];

LABEL_15:
          v5 = v13;
          goto LABEL_16;
        }
      }
    }
    else
    {
      v11 = +[NSError errorWithDomain:PKPassKitErrorDomain code:5 userInfo:0];
      v12 = self->_error;
      self->_error = v11;
    }
    self->_validatedPredicate = 0;
    goto LABEL_15;
  }
LABEL_16:
  _objc_release_x1(v4, v5);
}

- (void)visitPredicateOperator:(id)a3
{
  id v4 = a3;
  if (self->_validatedOperator)
  {
    id v12 = v4;
    id v5 = [v4 operatorType];
    switch((unint64_t)v5)
    {
      case 0uLL:
      case 1uLL:
      case 2uLL:
      case 3uLL:
      case 4uLL:
      case 5uLL:
        id v4 = v12;
        if ((self->_allowedOperators & 1) == 0) {
          goto LABEL_11;
        }
        break;
      case 6uLL:
      case 7uLL:
      case 8uLL:
      case 9uLL:
        goto LABEL_10;
      case 0xAuLL:
        id v4 = v12;
        if ((self->_allowedOperators & 8) != 0) {
          break;
        }
        goto LABEL_11;
      case 0xBuLL:
        error = self->_error;
        p_error = &self->_error;
        *((unsigned char *)p_error - 39) = 0;
        id v4 = v12;
        if (!error) {
          goto LABEL_12;
        }
        break;
      default:
        if (v5 == (id)99)
        {
LABEL_10:
          id v4 = v12;
          if ((self->_allowedOperators & 4) != 0) {
            break;
          }
        }
        else
        {
          BOOL v6 = v5 == (id)100;
          id v4 = v12;
          if (!v6 || (self->_allowedOperators & 2) != 0) {
            break;
          }
        }
LABEL_11:
        unsigned __int8 v8 = self->_error;
        p_error = &self->_error;
        *((unsigned char *)p_error - 39) = 0;
        if (!v8)
        {
LABEL_12:
          uint64_t v9 = +[NSError errorWithDomain:PKRulesErrorDomain code:7 userInfo:0];
          BOOL v10 = *p_error;
          *p_error = (NSError *)v9;

          id v4 = v12;
        }
        break;
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_usedKeys, 0);
  objc_storeStrong((id *)&self->_allowedKeysAndOperators, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

@end