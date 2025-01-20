@interface SXDataTableConditionEngine
+ (id)engine;
- (BOOL)isValid;
- (id)description;
- (unint64_t)conditionCount;
- (unint64_t)isEvenInteger:(int64_t)a3;
- (unint64_t)isOddInteger:(int64_t)a3;
- (unint64_t)validConditionCount;
- (void)addConditionForEqualInteger:(unint64_t)a3 withInteger:(unint64_t)a4;
- (void)addConditionForEqualString:(id)a3 withString:(id)a4;
- (void)addConditionForEvenBoolean:(unint64_t)a3 withInteger:(unint64_t)a4;
- (void)addConditionForOddBoolean:(unint64_t)a3 withInteger:(unint64_t)a4;
- (void)setConditionCount:(unint64_t)a3;
- (void)setValidConditionCount:(unint64_t)a3;
@end

@implementation SXDataTableConditionEngine

+ (id)engine
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (void)addConditionForEvenBoolean:(unint64_t)a3 withInteger:(unint64_t)a4
{
  if (a3)
  {
    [(SXDataTableConditionEngine *)self setConditionCount:[(SXDataTableConditionEngine *)self conditionCount] + 1];
    if ([(SXDataTableConditionEngine *)self isEvenInteger:a4] == a3)
    {
      unint64_t v7 = [(SXDataTableConditionEngine *)self validConditionCount] + 1;
      [(SXDataTableConditionEngine *)self setValidConditionCount:v7];
    }
  }
}

- (void)addConditionForOddBoolean:(unint64_t)a3 withInteger:(unint64_t)a4
{
  if (a3)
  {
    [(SXDataTableConditionEngine *)self setConditionCount:[(SXDataTableConditionEngine *)self conditionCount] + 1];
    if ([(SXDataTableConditionEngine *)self isOddInteger:a4] == a3)
    {
      unint64_t v7 = [(SXDataTableConditionEngine *)self validConditionCount] + 1;
      [(SXDataTableConditionEngine *)self setValidConditionCount:v7];
    }
  }
}

- (void)addConditionForEqualInteger:(unint64_t)a3 withInteger:(unint64_t)a4
{
  if (a3 != -1)
  {
    [(SXDataTableConditionEngine *)self setConditionCount:[(SXDataTableConditionEngine *)self conditionCount] + 1];
    if (a3 == a4)
    {
      unint64_t v7 = [(SXDataTableConditionEngine *)self validConditionCount] + 1;
      [(SXDataTableConditionEngine *)self setValidConditionCount:v7];
    }
  }
}

- (void)addConditionForEqualString:(id)a3 withString:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (v7)
  {
    [(SXDataTableConditionEngine *)self setConditionCount:[(SXDataTableConditionEngine *)self conditionCount] + 1];
    if ([v7 isEqualToString:v6]) {
      [(SXDataTableConditionEngine *)self setValidConditionCount:[(SXDataTableConditionEngine *)self validConditionCount] + 1];
    }
  }
}

- (BOOL)isValid
{
  unint64_t v3 = [(SXDataTableConditionEngine *)self conditionCount];
  return v3 == [(SXDataTableConditionEngine *)self validConditionCount];
}

- (unint64_t)isEvenInteger:(int64_t)a3
{
  if (a3) {
    return 2;
  }
  else {
    return 1;
  }
}

- (unint64_t)isOddInteger:(int64_t)a3
{
  if (a3) {
    return 1;
  }
  else {
    return 2;
  }
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; isValid: %d; conditions: %lu; valid conditions: %lu>",
               objc_opt_class(),
               self,
               [(SXDataTableConditionEngine *)self isValid],
               [(SXDataTableConditionEngine *)self conditionCount],
               [(SXDataTableConditionEngine *)self validConditionCount]);
}

- (unint64_t)conditionCount
{
  return self->_conditionCount;
}

- (void)setConditionCount:(unint64_t)a3
{
  self->_conditionCount = a3;
}

- (unint64_t)validConditionCount
{
  return self->_validConditionCount;
}

- (void)setValidConditionCount:(unint64_t)a3
{
  self->_validConditionCount = a3;
}

@end