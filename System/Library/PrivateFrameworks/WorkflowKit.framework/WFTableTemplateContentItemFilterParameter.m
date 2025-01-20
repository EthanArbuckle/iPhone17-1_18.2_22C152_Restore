@interface WFTableTemplateContentItemFilterParameter
- (BOOL)allowsMultipleValues;
- (Class)singleStateClass;
- (NSDictionary)linkValueTypes;
- (WFPropertyListObject)defaultSerializedRepresentation;
- (WFTableTemplateContentItemFilterParameter)initWithDefinition:(id)a3;
- (void)setLinkValueTypes:(id)a3;
@end

@implementation WFTableTemplateContentItemFilterParameter

- (NSDictionary)linkValueTypes
{
  sub_1C815AC40();
  sub_1C7F42470(0, &qword_1EA511C00);
  v2 = (void *)sub_1C8532518();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (void)setLinkValueTypes:(id)a3
{
  sub_1C7F42470(0, &qword_1EA511C00);
  uint64_t v4 = sub_1C8532538();
  v5 = self;
  sub_1C815AD08(v4);
}

- (WFTableTemplateContentItemFilterParameter)initWithDefinition:(id)a3
{
  return (WFTableTemplateContentItemFilterParameter *)WFTableTemplateContentItemFilterParameter.init(definition:)(a3);
}

- (Class)singleStateClass
{
  sub_1C815B134();
  return (Class)swift_getObjCClassFromMetadata();
}

- (WFPropertyListObject)defaultSerializedRepresentation
{
  v2 = self;
  v3 = sub_1C815B224();

  return (WFPropertyListObject *)v3;
}

- (BOOL)allowsMultipleValues
{
  return 0;
}

- (void).cxx_destruct
{
}

@end