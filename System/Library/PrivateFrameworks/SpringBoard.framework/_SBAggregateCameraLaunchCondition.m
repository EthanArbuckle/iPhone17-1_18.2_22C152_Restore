@interface _SBAggregateCameraLaunchCondition
- (BOOL)isMet;
- (NSArray)conditions;
- (void)setConditions:(id)a3;
@end

@implementation _SBAggregateCameraLaunchCondition

- (BOOL)isMet
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_conditions;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "isMet", (void)v9))
        {
          BOOL v7 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (NSArray)conditions
{
  return self->_conditions;
}

- (void)setConditions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end