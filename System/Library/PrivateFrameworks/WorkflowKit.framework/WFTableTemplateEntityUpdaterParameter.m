@interface WFTableTemplateEntityUpdaterParameter
- (BOOL)allowsMultipleValues;
- (Class)singleStateClass;
- (WFPropertyListObject)defaultSerializedRepresentation;
- (_TtC11WorkflowKit37WFTableTemplateEntityUpdaterParameter)initWithDefinition:(id)a3;
@end

@implementation WFTableTemplateEntityUpdaterParameter

- (BOOL)allowsMultipleValues
{
  return 0;
}

- (WFPropertyListObject)defaultSerializedRepresentation
{
  v2 = self;
  v3 = (void *)sub_1C815C290();

  return (WFPropertyListObject *)v3;
}

- (_TtC11WorkflowKit37WFTableTemplateEntityUpdaterParameter)initWithDefinition:(id)a3
{
  return (_TtC11WorkflowKit37WFTableTemplateEntityUpdaterParameter *)WFTableTemplateEntityUpdaterParameter.init(definition:)(a3);
}

- (Class)singleStateClass
{
  sub_1C815C474();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void).cxx_destruct
{
}

@end