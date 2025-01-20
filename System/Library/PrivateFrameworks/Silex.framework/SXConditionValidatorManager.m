@interface SXConditionValidatorManager
- (BOOL)validateCondition:(id)a3 context:(id)a4;
- (NSMutableArray)validators;
- (SXConditionValidatorManager)init;
- (void)addConditionValidator:(id)a3;
@end

@implementation SXConditionValidatorManager

- (SXConditionValidatorManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)SXConditionValidatorManager;
  v2 = [(SXConditionValidatorManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    validators = v2->_validators;
    v2->_validators = (NSMutableArray *)v3;
  }
  return v2;
}

- (void)addConditionValidator:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(SXConditionValidatorManager *)self validators];
    [v5 addObject:v4];
  }
}

- (BOOL)validateCondition:(id)a3 context:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v8 = [(SXConditionValidatorManager *)self validators];
  v9 = (void *)[v8 copy];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        if (![*(id *)(*((void *)&v16 + 1) + 8 * i) validateCondition:v6 context:v7])
        {
          BOOL v14 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 1;
LABEL_11:

  return v14;
}

- (NSMutableArray)validators
{
  return self->_validators;
}

- (void).cxx_destruct
{
}

@end