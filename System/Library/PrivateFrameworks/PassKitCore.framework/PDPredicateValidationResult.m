@interface PDPredicateValidationResult
- (BOOL)isValid;
- (NSSet)usedKeys;
- (NSSet)usedOperators;
- (PDPredicateValidationResult)init;
- (PDPredicateValidationResult)initWithValid:(BOOL)a3 usedKeys:(id)a4;
@end

@implementation PDPredicateValidationResult

- (PDPredicateValidationResult)init
{
  return [(PDPredicateValidationResult *)self initWithValid:0 usedKeys:0];
}

- (PDPredicateValidationResult)initWithValid:(BOOL)a3 usedKeys:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PDPredicateValidationResult;
  v8 = [(PDPredicateValidationResult *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_valid = a3;
    objc_storeStrong((id *)&v8->_usedKeys, a4);
  }

  return v9;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (NSSet)usedKeys
{
  return self->_usedKeys;
}

- (NSSet)usedOperators
{
  return self->_usedOperators;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usedOperators, 0);
  objc_storeStrong((id *)&self->_usedKeys, 0);
}

@end