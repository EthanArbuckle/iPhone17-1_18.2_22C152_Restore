@interface WFConditionalSubjectParameter
- (BOOL)allowsMultipleValues;
- (Class)stateClass;
- (id)defaultSupportedVariableTypes;
- (id)disallowedVariableTypes;
- (id)importQuestionBehavior;
@end

@implementation WFConditionalSubjectParameter

- (id)disallowedVariableTypes
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"Ask", 0);
  return v2;
}

- (id)defaultSupportedVariableTypes
{
  v2 = objc_opt_class();
  return (id)[v2 allInsertableVariableTypes];
}

- (id)importQuestionBehavior
{
  v2 = @"NotSupported";
  return @"NotSupported";
}

- (BOOL)allowsMultipleValues
{
  return 0;
}

- (Class)stateClass
{
  return (Class)objc_opt_class();
}

@end