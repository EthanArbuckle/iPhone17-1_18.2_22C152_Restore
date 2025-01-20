@interface _UIButtonFeedbackGeneratorConfiguration
+ (id)defaultConfiguration;
+ (id)prominentConfiguration;
- (int64_t)requiredSupportLevel;
@end

@implementation _UIButtonFeedbackGeneratorConfiguration

- (int64_t)requiredSupportLevel
{
  return 2;
}

+ (id)defaultConfiguration
{
  return (id)[a1 _configurationWithKey:@"default" preparationBlock:&__block_literal_global_186];
}

+ (id)prominentConfiguration
{
  return (id)[a1 _configurationWithKey:@"prominent" preparationBlock:&__block_literal_global_33_0];
}

@end