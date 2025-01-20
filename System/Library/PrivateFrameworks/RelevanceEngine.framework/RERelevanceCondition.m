@interface RERelevanceCondition
+ (id)conditionWithBlock:(id)a3;
- (BOOL)isEqual:(id)a3;
- (RERelevanceCondition)initWithCondtionBlock:(id)a3;
- (float)_evaluateRelevanceWithEnvironment:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)_hash;
@end

@implementation RERelevanceCondition

+ (id)conditionWithBlock:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithCondtionBlock:v4];

  return v5;
}

- (RERelevanceCondition)initWithCondtionBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RERelevanceCondition;
  v5 = [(RERelevanceCondition *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id condition = v5->_condition;
    v5->_id condition = (id)v6;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[RERelevanceCondition allocWithZone:a3];
  id condition = self->_condition;
  return [(RERelevanceCondition *)v4 initWithCondtionBlock:condition];
}

- (unint64_t)_hash
{
  return [self->_condition hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RERelevanceCondition *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = (void *)MEMORY[0x223C31700](self->_condition);
      v7 = (void *)MEMORY[0x223C31700](v5->_condition);
      if (v6 == v7) {
        char v8 = 1;
      }
      else {
        char v8 = [v6 isEqual:v7];
      }
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (float)_evaluateRelevanceWithEnvironment:(id)a3
{
  id condition = (void (**)(id, id))self->_condition;
  if (!condition) {
    return 0.0;
  }
  condition[2](condition, a3);
  return result;
}

- (void).cxx_destruct
{
}

@end