@interface REFilteringRule
- (BOOL)isEqual:(id)a3;
- (RECondition)condition;
- (REConditionEvaluator)conditionEvaluator;
- (REFilteringRule)initWithCondition:(id)a3;
- (REFilteringRule)initWithCondition:(id)a3 type:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)type;
@end

@implementation REFilteringRule

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)REFilteringRule;
  unint64_t v3 = [(RERule *)&v5 hash];
  return [(RECondition *)self->_condition hash] ^ v3;
}

- (REConditionEvaluator)conditionEvaluator
{
  os_unfair_lock_lock(&GlobalRuleConditionEvaluatorLock);
  if (!self->_conditionEvaluator)
  {
    unint64_t v3 = [[REConditionEvaluator alloc] initWithCondition:self->_condition];
    conditionEvaluator = self->_conditionEvaluator;
    self->_conditionEvaluator = v3;
  }
  os_unfair_lock_unlock(&GlobalRuleConditionEvaluatorLock);
  objc_super v5 = self->_conditionEvaluator;
  return v5;
}

- (RECondition)condition
{
  return self->_condition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_condition, 0);
  objc_storeStrong((id *)&self->_conditionEvaluator, 0);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (REFilteringRule *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13.receiver = self;
      v13.super_class = (Class)REFilteringRule;
      if ([(RERule *)&v13 isEqual:v4])
      {
        objc_super v5 = v4;
        condition = self->_condition;
        v7 = v5->_condition;
        if (condition == v7)
        {
        }
        else
        {
          v8 = v7;
          v9 = condition;
          int v10 = [(RECondition *)v9 isEqual:v8];

          if (!v10)
          {
            BOOL v11 = 0;
LABEL_11:

            goto LABEL_12;
          }
        }
        BOOL v11 = self->_type == v5->_type;
        goto LABEL_11;
      }
    }
    BOOL v11 = 0;
  }
LABEL_12:

  return v11;
}

- (REFilteringRule)initWithCondition:(id)a3 type:(unint64_t)a4
{
  id v13 = a3;
  if (!v13) {
    RERaiseInternalException((void *)*MEMORY[0x263EFF4A0], @"Condition must be non-nil", v7, v8, v9, v10, v11, v12, (uint64_t)v22.receiver);
  }
  v22.receiver = self;
  v22.super_class = (Class)REFilteringRule;
  v14 = [(RERule *)&v22 init];
  if (v14)
  {
    if ([v13 _validForRanking]) {
      RERaiseInternalException((void *)*MEMORY[0x263EFF4A0], @"REComparisonCondition cannot be used for a filtering rule", v15, v16, v17, v18, v19, v20, (uint64_t)v22.receiver);
    }
    objc_storeStrong((id *)&v14->_condition, a3);
    v14->_type = a4;
  }

  return v14;
}

- (REFilteringRule)initWithCondition:(id)a3
{
  return [(REFilteringRule *)self initWithCondition:a3 type:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithCondition:type:", self->_condition, self->_type);
  [(RERule *)self priority];
  objc_msgSend(v4, "setPriority:");
  return v4;
}

- (unint64_t)type
{
  return self->_type;
}

@end