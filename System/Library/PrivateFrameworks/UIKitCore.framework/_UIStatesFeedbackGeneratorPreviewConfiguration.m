@interface _UIStatesFeedbackGeneratorPreviewConfiguration
+ (id)cancelState;
+ (id)commitState;
+ (id)defaultConfiguration;
+ (id)previewState;
+ (id)revealState;
- (BOOL)defaultEnabled;
- (int64_t)requiredSupportLevel;
@end

@implementation _UIStatesFeedbackGeneratorPreviewConfiguration

+ (id)defaultConfiguration
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __70___UIStatesFeedbackGeneratorPreviewConfiguration_defaultConfiguration__block_invoke;
  v4[3] = &__block_descriptor_40_e43_v16__0___UIFeedbackGeneratorConfiguration_8l;
  v4[4] = a1;
  v2 = [a1 _configurationWithKey:@"preview" preparationBlock:v4];
  [v2 setInitialState:@"reveal"];
  [v2 setActivationStyle:1];
  return v2;
}

- (int64_t)requiredSupportLevel
{
  return 1;
}

- (BOOL)defaultEnabled
{
  return 1;
}

+ (id)revealState
{
  return @"reveal";
}

+ (id)previewState
{
  return @"preview";
}

+ (id)commitState
{
  return @"commit";
}

+ (id)cancelState
{
  return @"cancel";
}

@end