@interface HDSPSleepScheduleModelChangeEvaluation
+ (id)combinedEvaluation:(id)a3;
+ (id)emptyEvaluation;
+ (id)significantChangeWithTopLevelChangeKeys:(id)a3;
- (BOOL)isSignificantChange;
- (HDSPSleepScheduleModelChangeEvaluation)initWithIsSignificantChange:(BOOL)a3 topLevelChangeKeys:(id)a4;
- (NSSet)topLevelChangeKeys;
- (NSString)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescriptionBuilder;
@end

@implementation HDSPSleepScheduleModelChangeEvaluation

- (HDSPSleepScheduleModelChangeEvaluation)initWithIsSignificantChange:(BOOL)a3 topLevelChangeKeys:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDSPSleepScheduleModelChangeEvaluation;
  v8 = [(HDSPSleepScheduleModelChangeEvaluation *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_isSignificantChange = a3;
    objc_storeStrong((id *)&v8->_topLevelChangeKeys, a4);
    v10 = v9;
  }

  return v9;
}

+ (id)combinedEvaluation:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263EFF9C0] set];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    int v8 = 0;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v8 |= objc_msgSend(v11, "isSignificantChange", (void)v15);
        objc_super v12 = [v11 topLevelChangeKeys];
        [v4 unionSet:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  v13 = [[HDSPSleepScheduleModelChangeEvaluation alloc] initWithIsSignificantChange:v8 & 1 topLevelChangeKeys:v4];

  return v13;
}

+ (id)emptyEvaluation
{
  v2 = [HDSPSleepScheduleModelChangeEvaluation alloc];
  id v3 = [MEMORY[0x263EFFA08] set];
  v4 = [(HDSPSleepScheduleModelChangeEvaluation *)v2 initWithIsSignificantChange:0 topLevelChangeKeys:v3];

  return v4;
}

+ (id)significantChangeWithTopLevelChangeKeys:(id)a3
{
  id v3 = a3;
  v4 = [[HDSPSleepScheduleModelChangeEvaluation alloc] initWithIsSignificantChange:1 topLevelChangeKeys:v3];

  return v4;
}

- (NSString)description
{
  return (NSString *)[(HDSPSleepScheduleModelChangeEvaluation *)self descriptionWithMultilinePrefix:&stru_26D3FAEE0];
}

- (id)succinctDescriptionBuilder
{
  return [(HDSPSleepScheduleModelChangeEvaluation *)self descriptionBuilderWithMultilinePrefix:&stru_26D3FAEE0];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(HDSPSleepScheduleModelChangeEvaluation *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v5 = (id)[v4 appendBool:self->_isSignificantChange withName:@"isSignificantChange" ifEqualTo:1];
  id v6 = (id)objc_msgSend(v4, "appendInteger:withName:", -[NSSet count](self->_topLevelChangeKeys, "count"), @"topLevelChangeKeys");

  return v4;
}

- (BOOL)isSignificantChange
{
  return self->_isSignificantChange;
}

- (NSSet)topLevelChangeKeys
{
  return self->_topLevelChangeKeys;
}

- (void).cxx_destruct
{
}

@end