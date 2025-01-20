@interface REConditionalRelevanceProvider
- (BOOL)isEqual:(id)a3;
- (REConditionalRelevanceProvider)initWithRelevanceCondition:(id)a3;
- (RERelevanceCondition)condition;
- (float)_evaluateCondition;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)_hash;
@end

@implementation REConditionalRelevanceProvider

- (REConditionalRelevanceProvider)initWithRelevanceCondition:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  if ([v5 isMemberOfClass:objc_opt_class()])
  {
    v6 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)REConditionalRelevanceProvider;
    v7 = [(RERelevanceProvider *)&v11 init];
    if (v7)
    {
      uint64_t v8 = [v4 copy];
      condition = v7->_condition;
      v7->_condition = (RERelevanceCondition *)v8;
    }
    self = v7;
    v6 = self;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)REConditionalRelevanceProvider;
  id v4 = [(RERelevanceProvider *)&v8 copyWithZone:a3];
  uint64_t v5 = [(RERelevanceCondition *)self->_condition copy];
  v6 = (void *)v4[4];
  v4[4] = v5;

  return v4;
}

- (unint64_t)_hash
{
  return [(RERelevanceCondition *)self->_condition hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (REConditionalRelevanceProvider *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v11.receiver = self,
          v11.super_class = (Class)REConditionalRelevanceProvider,
          [(RERelevanceProvider *)&v11 isEqual:v4]))
    {
      condition = self->_condition;
      v6 = v4->_condition;
      v7 = condition;
      objc_super v8 = v7;
      if (v7 == v6) {
        char v9 = 1;
      }
      else {
        char v9 = [(RERelevanceCondition *)v7 isEqual:v6];
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (RERelevanceCondition)condition
{
  return self->_condition;
}

- (float)_evaluateCondition
{
  v3 = [(RERelevanceProvider *)self environment];
  if (v3)
  {
    [(RERelevanceCondition *)self->_condition _evaluateRelevanceWithEnvironment:v3];
    float v5 = v4;
  }
  else
  {
    float v5 = 0.0;
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end