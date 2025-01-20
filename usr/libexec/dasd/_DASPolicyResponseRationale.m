@interface _DASPolicyResponseRationale
- (NSMutableArray)reasons;
- (NSPredicate)condition;
- (NSString)policyName;
- (_DASPolicyResponseRationale)initWithPolicyName:(id)a3;
- (id)description;
- (int64_t)responseOptions;
- (void)addRationaleForCondition:(id)a3 withRequiredValue:(double)a4 withCurrentValue:(double)a5;
- (void)addRationaleWithCondition:(id)a3;
- (void)setCondition:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setReasons:(id)a3;
- (void)setResponseOptions:(int64_t)a3;
@end

@implementation _DASPolicyResponseRationale

- (id)description
{
  if ([(NSMutableArray *)self->_reasons count] || self->_condition)
  {
    v3 = +[NSMutableString string];
    [(__CFString *)v3 appendString:@"["];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v4 = self->_reasons;
    id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = [*(id *)(*((void *)&v13 + 1) + 8 * i) description];
          [(__CFString *)v3 appendFormat:@"{%@},", v9];
        }
        id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }

    condition = self->_condition;
    if (condition)
    {
      v11 = [(NSPredicate *)condition description];
      [(__CFString *)v3 appendFormat:@"{%@}", v11];
    }
    [(__CFString *)v3 appendString:@"]"];
  }
  else
  {
    v3 = &stru_100179948;
  }

  return v3;
}

- (_DASPolicyResponseRationale)initWithPolicyName:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_DASPolicyResponseRationale;
  id v6 = [(_DASPolicyResponseRationale *)&v11 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_policyName, a3);
    uint64_t v8 = +[NSMutableArray array];
    reasons = v7->_reasons;
    v7->_reasons = (NSMutableArray *)v8;
  }
  return v7;
}

- (void)addRationaleForCondition:(id)a3 withRequiredValue:(double)a4 withCurrentValue:(double)a5
{
  id v8 = a3;
  v9 = [[_DASPolicyRequiredValueRationale alloc] initWithCondition:v8 withRequiredValue:a4 withCurrentValue:a5];

  [(NSMutableArray *)self->_reasons addObject:v9];
}

- (void)addRationaleWithCondition:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  condition = self->_condition;
  p_condition = (id *)&self->_condition;
  uint64_t v7 = condition;
  if (condition)
  {
    v13[0] = v7;
    v13[1] = v5;
    v10 = +[NSArray arrayWithObjects:v13 count:2];
    uint64_t v11 = +[NSCompoundPredicate andPredicateWithSubpredicates:v10];
    id v12 = *p_condition;
    id *p_condition = (id)v11;
  }
  else
  {
    objc_storeStrong(p_condition, a3);
  }
}

- (int64_t)responseOptions
{
  return self->_responseOptions;
}

- (void)setResponseOptions:(int64_t)a3
{
  self->_responseOptions = a3;
}

- (NSString)policyName
{
  return self->_policyName;
}

- (void)setPolicyName:(id)a3
{
}

- (NSPredicate)condition
{
  return self->_condition;
}

- (void)setCondition:(id)a3
{
}

- (NSMutableArray)reasons
{
  return self->_reasons;
}

- (void)setReasons:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reasons, 0);
  objc_storeStrong((id *)&self->_condition, 0);

  objc_storeStrong((id *)&self->_policyName, 0);
}

@end