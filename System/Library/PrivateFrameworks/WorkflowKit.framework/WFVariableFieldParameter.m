@interface WFVariableFieldParameter
- (Class)singleStateClass;
- (id)defaultSupportedVariableTypes;
- (id)importQuestionBehavior;
@end

@implementation WFVariableFieldParameter

- (id)importQuestionBehavior
{
  v2 = @"NotSupported";
  return @"NotSupported";
}

- (id)defaultSupportedVariableTypes
{
  return 0;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

@end