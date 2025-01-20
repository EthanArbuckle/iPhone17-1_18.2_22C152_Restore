@interface RERankingRule
- (BOOL)isEqual:(id)a3;
- (REComparisonCondition)comparison;
- (RECondition)leftCondition;
- (RECondition)rightCondition;
- (REConditionEvaluator)comparisonConditionEvaluator;
- (REConditionEvaluator)leftConditionEvaluator;
- (REConditionEvaluator)rightConditionEvaluator;
- (RERankingRule)initWithLeftCondition:(id)a3 rightCondition:(id)a4 comparisonCondition:(id)a5 order:(int64_t)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)order;
- (unint64_t)hash;
@end

@implementation RERankingRule

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)RERankingRule;
  unint64_t v3 = [(RERule *)&v7 hash];
  uint64_t v4 = [(RECondition *)self->_leftCondition hash] ^ v3;
  uint64_t v5 = [(RECondition *)self->_rightCondition hash];
  return v4 ^ v5 ^ [(REComparisonCondition *)self->_comparison hash] ^ self->_order;
}

- (RECondition)rightCondition
{
  return self->_rightCondition;
}

- (RECondition)leftCondition
{
  return self->_leftCondition;
}

- (REComparisonCondition)comparison
{
  return self->_comparison;
}

- (REConditionEvaluator)rightConditionEvaluator
{
  os_unfair_lock_lock(&GlobalRuleConditionEvaluatorLock);
  if (!self->_rightConditionEvaluator)
  {
    unint64_t v3 = [[REConditionEvaluator alloc] initWithCondition:self->_rightCondition];
    rightConditionEvaluator = self->_rightConditionEvaluator;
    self->_rightConditionEvaluator = v3;
  }
  os_unfair_lock_unlock(&GlobalRuleConditionEvaluatorLock);
  uint64_t v5 = self->_rightConditionEvaluator;
  return v5;
}

- (REConditionEvaluator)leftConditionEvaluator
{
  os_unfair_lock_lock(&GlobalRuleConditionEvaluatorLock);
  if (!self->_leftConditionEvaluator)
  {
    unint64_t v3 = [[REConditionEvaluator alloc] initWithCondition:self->_leftCondition];
    leftConditionEvaluator = self->_leftConditionEvaluator;
    self->_leftConditionEvaluator = v3;
  }
  os_unfair_lock_unlock(&GlobalRuleConditionEvaluatorLock);
  uint64_t v5 = self->_leftConditionEvaluator;
  return v5;
}

- (REConditionEvaluator)comparisonConditionEvaluator
{
  os_unfair_lock_lock(&GlobalRuleConditionEvaluatorLock);
  if (!self->_comparisonConditionEvaluator)
  {
    unint64_t v3 = [[REConditionEvaluator alloc] initWithCondition:self->_comparison];
    comparisonConditionEvaluator = self->_comparisonConditionEvaluator;
    self->_comparisonConditionEvaluator = v3;
  }
  os_unfair_lock_unlock(&GlobalRuleConditionEvaluatorLock);
  uint64_t v5 = self->_comparisonConditionEvaluator;
  return v5;
}

- (RERankingRule)initWithLeftCondition:(id)a3 rightCondition:(id)a4 comparisonCondition:(id)a5 order:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v19 = a5;
  v20 = (void **)MEMORY[0x263EFF4A0];
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    RERaiseInternalException((void *)*MEMORY[0x263EFF4A0], @"Condition must be non-nil", v13, v14, v15, v16, v17, v18, (uint64_t)v41.receiver);
    if (v12)
    {
LABEL_3:
      if (v19) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  RERaiseInternalException(*v20, @"Condition must be non-nil", v13, v14, v15, v16, v17, v18, (uint64_t)v41.receiver);
  if (!v19) {
LABEL_4:
  }
    RERaiseInternalException(*v20, @"Condition must be non-nil", v13, v14, v15, v16, v17, v18, (uint64_t)v41.receiver);
LABEL_5:
  v41.receiver = self;
  v41.super_class = (Class)RERankingRule;
  v21 = [(RERule *)&v41 init];
  if (v21)
  {
    if ([v11 _validForRanking]) {
      RERaiseInternalException(*v20, @"REComparisonCondition cannot be used for the left condition", v22, v23, v24, v25, v26, v27, (uint64_t)v41.receiver);
    }
    if ([v12 _validForRanking]) {
      RERaiseInternalException(*v20, @"REComparisonCondition cannot be used for the right condition", v28, v29, v30, v31, v32, v33, (uint64_t)v41.receiver);
    }
    if (([v19 _validForRanking] & 1) == 0) {
      RERaiseInternalException(*v20, @"REComparisonCondition must be used for the comparison condition", v34, v35, v36, v37, v38, v39, (uint64_t)v41.receiver);
    }
    objc_storeStrong((id *)&v21->_leftCondition, a3);
    objc_storeStrong((id *)&v21->_rightCondition, a4);
    objc_storeStrong((id *)&v21->_comparison, a5);
    v21->_order = a6;
  }

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (RERankingRule *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v23.receiver = self;
      v23.super_class = (Class)RERankingRule;
      if ([(RERule *)&v23 isEqual:v4])
      {
        uint64_t v5 = v4;
        leftCondition = self->_leftCondition;
        objc_super v7 = v5->_leftCondition;
        if (leftCondition == v7)
        {
        }
        else
        {
          v8 = v7;
          v9 = leftCondition;
          int v10 = [(RECondition *)v9 isEqual:v8];

          if (!v10) {
            goto LABEL_16;
          }
        }
        rightCondition = self->_rightCondition;
        uint64_t v13 = v5->_rightCondition;
        if (rightCondition == v13)
        {
        }
        else
        {
          uint64_t v14 = v13;
          uint64_t v15 = rightCondition;
          int v16 = [(RECondition *)v15 isEqual:v14];

          if (!v16) {
            goto LABEL_16;
          }
        }
        comparison = self->_comparison;
        uint64_t v18 = v5->_comparison;
        if (comparison == v18)
        {
        }
        else
        {
          id v19 = v18;
          v20 = comparison;
          int v21 = [(REComparisonCondition *)v20 isEqual:v19];

          if (!v21)
          {
LABEL_16:
            BOOL v11 = 0;
LABEL_19:

            goto LABEL_20;
          }
        }
        BOOL v11 = self->_order == v5->_order;
        goto LABEL_19;
      }
    }
    BOOL v11 = 0;
  }
LABEL_20:

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_comparison, 0);
  objc_storeStrong((id *)&self->_rightCondition, 0);
  objc_storeStrong((id *)&self->_leftCondition, 0);
  objc_storeStrong((id *)&self->_comparisonConditionEvaluator, 0);
  objc_storeStrong((id *)&self->_rightConditionEvaluator, 0);
  objc_storeStrong((id *)&self->_leftConditionEvaluator, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithLeftCondition:rightCondition:comparisonCondition:order:", self->_leftCondition, self->_rightCondition, self->_comparison, self->_order);
  [(RERule *)self priority];
  objc_msgSend(v4, "setPriority:");
  return v4;
}

- (int64_t)order
{
  return self->_order;
}

@end