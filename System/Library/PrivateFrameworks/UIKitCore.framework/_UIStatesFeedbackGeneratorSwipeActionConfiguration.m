@interface _UIStatesFeedbackGeneratorSwipeActionConfiguration
+ (id)confirmState;
+ (id)defaultConfiguration;
+ (id)openState;
+ (id)restingState;
- (int64_t)requiredPeripheralSupportLevel;
- (int64_t)requiredSupportLevel;
@end

@implementation _UIStatesFeedbackGeneratorSwipeActionConfiguration

+ (id)defaultConfiguration
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __74___UIStatesFeedbackGeneratorSwipeActionConfiguration_defaultConfiguration__block_invoke;
  v4[3] = &__block_descriptor_40_e43_v16__0___UIFeedbackGeneratorConfiguration_8l;
  v4[4] = a1;
  v2 = [a1 _configurationWithKey:@"swipeAction" preparationBlock:v4];
  [v2 setInitialState:@"resting"];
  return v2;
}

- (int64_t)requiredSupportLevel
{
  return 2;
}

- (int64_t)requiredPeripheralSupportLevel
{
  return 1;
}

+ (id)restingState
{
  return @"resting";
}

+ (id)openState
{
  return @"open";
}

+ (id)confirmState
{
  return @"confirm";
}

@end