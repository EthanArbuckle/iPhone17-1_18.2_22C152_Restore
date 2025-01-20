@interface WFAccessibilitySettingUpdaterAction
- (NSString)iconBackgroundColorName;
- (NSString)iconSymbolName;
- (_TtC11WorkflowKit35WFAccessibilitySettingUpdaterAction)initWithIdentifier:(id)a3 actionMetadata:(id)a4 entityMetadataForParameterIdentifier:(id)a5 metadataForParameterIdentifier:(id)a6 definition:(id)a7 serializedParameters:(id)a8 appIntentDescriptor:(id)a9 fullyQualifiedActionIdentifier:(id)a10;
- (id)copyWithSerializedParameters:(id)a3;
- (id)localizedDescriptionSummaryWithContext:(id)a3;
- (id)localizedNameWithContext:(id)a3;
@end

@implementation WFAccessibilitySettingUpdaterAction

- (id)copyWithSerializedParameters:(id)a3
{
  return (id)sub_1C81AF970(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))sub_1C81AF768);
}

- (NSString)iconSymbolName
{
  v2 = (void *)sub_1C8532618();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)iconBackgroundColorName
{
  v2 = (void *)sub_1C8532618();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (id)localizedNameWithContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C81AFAB0();

  v6 = (void *)sub_1C8532618();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)localizedDescriptionSummaryWithContext:(id)a3
{
  return sub_1C81AFDC4(self, (uint64_t)a2, a3, (uint64_t (*)(id))sub_1C81AFC70);
}

- (_TtC11WorkflowKit35WFAccessibilitySettingUpdaterAction)initWithIdentifier:(id)a3 actionMetadata:(id)a4 entityMetadataForParameterIdentifier:(id)a5 metadataForParameterIdentifier:(id)a6 definition:(id)a7 serializedParameters:(id)a8 appIntentDescriptor:(id)a9 fullyQualifiedActionIdentifier:(id)a10
{
  return (_TtC11WorkflowKit35WFAccessibilitySettingUpdaterAction *)sub_1C81AFE8C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, (uint64_t)a6, a7, (uint64_t)a8, a9, a10, (uint64_t (*)(uint64_t, uint64_t, void *, uint64_t, uint64_t, void *, uint64_t, void *, void *))WFAccessibilitySettingUpdaterAction.init(identifier:actionMetadata:entityMetadataForParameterIdentifier:metadataForParameterIdentifier:definition:serializedParameters:appIntentDescriptor:fullyQualifiedActionIdentifier:));
}

@end