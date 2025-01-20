@interface WFGetAccessibilitySettingAction
- (NSString)iconBackgroundColorName;
- (NSString)iconSymbolName;
- (_TtC11WorkflowKit31WFGetAccessibilitySettingAction)initWithIdentifier:(id)a3 definition:(id)a4 entityByEntityIdentifier:(id)a5 serializedParameters:(id)a6 fullyQualifiedActionIdentifier:(id)a7;
- (id)copyWithSerializedParameters:(id)a3;
- (id)localizedDescriptionSummaryWithContext:(id)a3;
- (id)localizedNameWithContext:(id)a3;
@end

@implementation WFGetAccessibilitySettingAction

- (id)copyWithSerializedParameters:(id)a3
{
  return (id)sub_1C821AFEC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))sub_1C821AE58);
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
  sub_1C821B12C();

  v6 = (void *)sub_1C8532618();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)localizedDescriptionSummaryWithContext:(id)a3
{
  return sub_1C821B438(self, (uint64_t)a2, a3, (uint64_t (*)(id))sub_1C821B2E4);
}

- (_TtC11WorkflowKit31WFGetAccessibilitySettingAction)initWithIdentifier:(id)a3 definition:(id)a4 entityByEntityIdentifier:(id)a5 serializedParameters:(id)a6 fullyQualifiedActionIdentifier:(id)a7
{
  return (_TtC11WorkflowKit31WFGetAccessibilitySettingAction *)sub_1C821B4DC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, (uint64_t)a6, a7, (uint64_t (*)(uint64_t, uint64_t, void *, uint64_t, uint64_t, void *))sub_1C821B4C0);
}

@end