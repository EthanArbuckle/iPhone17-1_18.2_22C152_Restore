@interface WFTableTemplateParameter
- (BOOL)allowsMultipleValues;
- (Class)singleStateClass;
- (NSString)importQuestionBehavior;
- (WFPropertyListObject)defaultSerializedRepresentation;
- (WFTableTemplateParameter)initWithDefinition:(id)a3;
- (id)defaultSupportedVariableTypes;
@end

@implementation WFTableTemplateParameter

- (Class)singleStateClass
{
  sub_1C815A7E0();
  return (Class)swift_getObjCClassFromMetadata();
}

- (WFPropertyListObject)defaultSerializedRepresentation
{
  v2 = self;
  v3 = (void *)sub_1C815A8AC();

  return (WFPropertyListObject *)v3;
}

- (NSString)importQuestionBehavior
{
  v2 = sub_1C815A8E8();
  return (NSString *)v2;
}

- (BOOL)allowsMultipleValues
{
  return 0;
}

- (WFTableTemplateParameter)initWithDefinition:(id)a3
{
  return (WFTableTemplateParameter *)WFTableTemplateParameter.init(definition:)(a3);
}

- (id)defaultSupportedVariableTypes
{
  id v1 = a1;
  uint64_t v2 = sub_1C815C1E0();

  if (v2)
  {
    type metadata accessor for WFVariableType(0);
    v4 = v3;
    sub_1C815A818();
    sub_1C8532A28();
    OUTLINED_FUNCTION_11_0();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end