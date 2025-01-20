@interface RPTInteractionTestParameters
+ (id)interactionTestParametersWithTestName:(id)a3 interaction:(id)a4 duration:(double)a5 completionHandler:(id)a6;
- (NSArray)delays;
- (NSArray)durations;
- (NSArray)interactions;
- (NSString)testName;
- (RPTInteractionTestParameters)initWithTestName:(id)a3 interactions:(id)a4 completionHandler:(id)a5;
- (id)completionHandler;
- (id)composerBlock;
- (void)setDelays:(id)a3;
- (void)setDurations:(id)a3;
- (void)setTestName:(id)a3;
@end

@implementation RPTInteractionTestParameters

- (void)setDurations:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    while (1)
    {
      if (*(void *)v11 != v7) {
        objc_enumerationMutation(v4);
      }
      if (!--v6)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (!v6) {
          break;
        }
      }
    }
  }
  v8 = (NSArray *)[v4 copy];
  durations = self->_durations;
  self->_durations = v8;
}

- (void)setDelays:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    while (1)
    {
      if (*(void *)v11 != v7) {
        objc_enumerationMutation(v4);
      }
      if (!--v6)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (!v6) {
          break;
        }
      }
    }
  }
  v8 = (NSArray *)[v4 copy];
  delays = self->_delays;
  self->_delays = v8;
}

- (RPTInteractionTestParameters)initWithTestName:(id)a3 interactions:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)RPTInteractionTestParameters;
  long long v11 = [(RPTInteractionTestParameters *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    testName = v11->_testName;
    v11->_testName = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    interactions = v11->_interactions;
    v11->_interactions = (NSArray *)v14;

    uint64_t v16 = MEMORY[0x1BA9B23F0](v10);
    id completionHandler = v11->_completionHandler;
    v11->_id completionHandler = (id)v16;
  }
  return v11;
}

+ (id)interactionTestParametersWithTestName:(id)a3 interaction:(id)a4 duration:(double)a5 completionHandler:(id)a6
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a6;
  id v12 = a3;
  id v13 = objc_alloc((Class)a1);
  v20[0] = v10;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  uint64_t v15 = (void *)[v13 initWithTestName:v12 interactions:v14 completionHandler:v11];

  if (v15)
  {
    uint64_t v16 = [NSNumber numberWithDouble:a5];
    objc_super v19 = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
    [v15 setDurations:v17];
  }
  return v15;
}

- (id)composerBlock
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__RPTInteractionTestParameters_composerBlock__block_invoke;
  v4[3] = &unk_1E613DF78;
  v4[4] = self;
  v2 = (void *)MEMORY[0x1BA9B23F0](v4, a2);
  return v2;
}

void __45__RPTInteractionTestParameters_composerBlock__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) interactions];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__RPTInteractionTestParameters_composerBlock__block_invoke_2;
  v6[3] = &unk_1E613DF50;
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v6];
}

void __45__RPTInteractionTestParameters_composerBlock__block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  id v17 = a2;
  id v5 = [*(id *)(a1 + 32) durations];
  unint64_t v6 = [v5 count];

  double v7 = 1.0;
  if (v6 > a3)
  {
    id v8 = [*(id *)(a1 + 32) durations];
    id v9 = [v8 objectAtIndexedSubscript:a3];
    [v9 doubleValue];
    double v7 = v10;
  }
  [v17 invokeWithComposer:*(void *)(a1 + 40) duration:v7];
  id v11 = [*(id *)(a1 + 32) delays];
  unint64_t v12 = [v11 count];

  if (v12 > a3)
  {
    id v13 = [*(id *)(a1 + 32) delays];
    uint64_t v14 = [v13 objectAtIndexedSubscript:a3];
    [v14 doubleValue];
    double v16 = v15;

    if (v16 > 0.0) {
      [*(id *)(a1 + 40) advanceTime:v16];
    }
  }
}

- (NSString)testName
{
  return self->_testName;
}

- (void)setTestName:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (NSArray)interactions
{
  return self->_interactions;
}

- (NSArray)durations
{
  return self->_durations;
}

- (NSArray)delays
{
  return self->_delays;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delays, 0);
  objc_storeStrong((id *)&self->_durations, 0);
  objc_storeStrong((id *)&self->_interactions, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_testName, 0);
}

@end