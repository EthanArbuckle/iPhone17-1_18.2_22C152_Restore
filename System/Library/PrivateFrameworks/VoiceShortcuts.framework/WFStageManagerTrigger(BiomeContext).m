@interface WFStageManagerTrigger(BiomeContext)
- (id)publisherWithScheduler:()BiomeContext;
- (void)shouldFireInResponseToEvent:()BiomeContext triggerIdentifier:completion:;
@end

@implementation WFStageManagerTrigger(BiomeContext)

- (void)shouldFireInResponseToEvent:()BiomeContext triggerIdentifier:completion:
{
  v11 = a5;
  v7 = [a3 eventBody];
  int v8 = [v7 starting];
  if (v8 == [a1 onEnable])
  {
    uint64_t v10 = 1;
  }
  else
  {
    int v9 = [v7 starting];
    uint64_t v10 = v9 ^ [a1 onDisable];
  }
  v11[2](v11, v10);
}

- (id)publisherWithScheduler:()BiomeContext
{
  id v3 = a3;
  v4 = BiomeLibrary();
  v5 = [v4 SpringBoard];
  v6 = [v5 WindowManagement];
  v7 = [v6 StageManagerMode];

  int v8 = [v7 DSLPublisher];
  int v9 = [v8 subscribeOn:v3];

  return v9;
}

@end