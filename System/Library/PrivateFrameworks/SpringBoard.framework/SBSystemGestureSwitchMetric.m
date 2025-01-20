@interface SBSystemGestureSwitchMetric
- (SBSystemGestureSwitchMetric)init;
- (void)postWithDataBuilder:(id)a3;
@end

@implementation SBSystemGestureSwitchMetric

- (SBSystemGestureSwitchMetric)init
{
  v4.receiver = self;
  v4.super_class = (Class)SBSystemGestureSwitchMetric;
  v2 = [(SBSystemGestureSwitchMetric *)&v4 init];
  if (v2 && init_onceToken != -1) {
    dispatch_once(&init_onceToken, &__block_literal_global_1);
  }
  return v2;
}

void __35__SBSystemGestureSwitchMetric_init__block_invoke()
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F93720];
  v8[0] = &unk_1F3348FA8;
  v8[1] = &unk_1F3348FC0;
  v9[0] = @"Next";
  v9[1] = @"Previous";
  v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  v2 = [v0 propertyWithName:@"Direction" enumMapping:v1];

  id v3 = objc_alloc(MEMORY[0x1E4F93738]);
  v7 = v2;
  objc_super v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v7 count:1];
  uint64_t v5 = [v3 initWithFeatureId:@"SpringBoard" event:@"SwitchGesture" registerProperties:v4];
  v6 = (void *)sTracker;
  sTracker = v5;
}

- (void)postWithDataBuilder:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  (*((void (**)(id, uint64_t *))a3 + 2))(a3, &v6);
  id v3 = (void *)sTracker;
  objc_super v4 = [NSNumber numberWithUnsignedInteger:v6];
  v7[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [v3 trackEventWithPropertyValues:v5];
}

@end