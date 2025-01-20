@interface WFAppSettingUpdaterAction
- (BOOL)isApprovedForPublicShortcutsDrawer;
- (BOOL)setParameterState:(id)a3 forKey:(id)a4;
- (BOOL)visibleForUse:(int64_t)a3;
- (INAppDescriptor)displayableAppDescriptor;
- (NSArray)availableSubjectValues;
- (NSArray)parameterDefinitions;
- (NSDictionary)outputDictionary;
- (_TtC11WorkflowKit25WFAppSettingUpdaterAction)initWithIdentifier:(id)a3 actionMetadata:(id)a4 entityMetadataForParameterIdentifier:(id)a5 metadataForParameterIdentifier:(id)a6 definition:(id)a7 serializedParameters:(id)a8 appIntentDescriptor:(id)a9 fullyQualifiedActionIdentifier:(id)a10;
- (_TtC11WorkflowKit25WFAppSettingUpdaterAction)initWithIdentifier:(id)a3 metadata:(id)a4 metadataForParameterIdentifier:(id)a5 definition:(id)a6 serializedParameters:(id)a7 appIntentDescriptor:(id)a8 fullyQualifiedActionIdentifier:(id)a9;
- (id)copyWithSerializedParameters:(id)a3;
- (id)localizedCategoryWithContext:(id)a3;
- (id)localizedDefaultOutputNameWithContext:(id)a3;
- (id)localizedDescriptionResultWithContext:(id)a3;
- (id)localizedDescriptionSummaryWithContext:(id)a3;
- (id)localizedNameWithContext:(id)a3;
- (void)configureParameter:(id)a3;
- (void)wasAddedToWorkflowByUser:(id)a3;
@end

@implementation WFAppSettingUpdaterAction

- (_TtC11WorkflowKit25WFAppSettingUpdaterAction)initWithIdentifier:(id)a3 actionMetadata:(id)a4 entityMetadataForParameterIdentifier:(id)a5 metadataForParameterIdentifier:(id)a6 definition:(id)a7 serializedParameters:(id)a8 appIntentDescriptor:(id)a9 fullyQualifiedActionIdentifier:(id)a10
{
  return (_TtC11WorkflowKit25WFAppSettingUpdaterAction *)sub_1C81AFE8C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, (uint64_t)a6, a7, (uint64_t)a8, a9, a10, (uint64_t (*)(uint64_t, uint64_t, void *, uint64_t, uint64_t, void *, uint64_t, void *, void *))WFAppSettingUpdaterAction.init(identifier:actionMetadata:entityMetadataForParameterIdentifier:metadataForParameterIdentifier:definition:serializedParameters:appIntentDescriptor:fullyQualifiedActionIdentifier:));
}

- (id)copyWithSerializedParameters:(id)a3
{
  return (id)sub_1C81AF970(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))sub_1C81AC97C);
}

- (NSDictionary)outputDictionary
{
  v2 = self;
  sub_1C81AD00C();

  v3 = (void *)sub_1C8532518();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v3;
}

- (INAppDescriptor)displayableAppDescriptor
{
  v2 = self;
  id v3 = sub_1C81AD27C();

  return (INAppDescriptor *)v3;
}

- (id)localizedDefaultOutputNameWithContext:(id)a3
{
  return sub_1C81AFDC4(self, (uint64_t)a2, a3, (uint64_t (*)(id))sub_1C81AD308);
}

- (id)localizedDescriptionResultWithContext:(id)a3
{
  return sub_1C81AFDC4(self, (uint64_t)a2, a3, (uint64_t (*)(id))sub_1C81AD45C);
}

- (id)localizedDescriptionSummaryWithContext:(id)a3
{
  return sub_1C81B04F4(self, (uint64_t)a2, a3, (uint64_t (*)(id))sub_1C81AD5B0);
}

- (id)localizedCategoryWithContext:(id)a3
{
  return sub_1C81AFDC4(self, (uint64_t)a2, a3, (uint64_t (*)(id))sub_1C81AD85C);
}

- (id)localizedNameWithContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C81AD9B0();

  v6 = (void *)sub_1C8532618();
  swift_bridgeObjectRelease();
  return v6;
}

- (void)wasAddedToWorkflowByUser:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C81ADE7C();
}

- (NSArray)parameterDefinitions
{
  v2 = self;
  sub_1C81AE0D4();

  sub_1C7F42470(0, (unint64_t *)&unk_1EA5148D0);
  id v3 = (void *)sub_1C8532828();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)configureParameter:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C81AE980((uint64_t)v4);
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  uint64_t v6 = sub_1C8532658();
  uint64_t v8 = v7;
  swift_unknownObjectRetain();
  v9 = self;
  LOBYTE(v6) = sub_1C81AEA60((uint64_t)a3, v6, v8);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (BOOL)visibleForUse:(int64_t)a3
{
  id v4 = self;
  LOBYTE(a3) = sub_1C81AEE60(a3);

  return a3 & 1;
}

- (BOOL)isApprovedForPublicShortcutsDrawer
{
  v2 = self;
  char v3 = sub_1C81AEF9C();

  return v3 & 1;
}

- (NSArray)availableSubjectValues
{
  v2 = self;
  sub_1C81AF4C8();

  char v3 = (void *)sub_1C8532828();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (_TtC11WorkflowKit25WFAppSettingUpdaterAction)initWithIdentifier:(id)a3 metadata:(id)a4 metadataForParameterIdentifier:(id)a5 definition:(id)a6 serializedParameters:(id)a7 appIntentDescriptor:(id)a8 fullyQualifiedActionIdentifier:(id)a9
{
  sub_1C8532658();
  sub_1C7F42470(0, (unint64_t *)&unk_1EA513E40);
  sub_1C8532538();
  if (a7)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA512650);
    sub_1C8532538();
  }
  id v13 = a4;
  id v14 = a6;
  id v15 = a8;
  id v16 = a9;
  WFAppSettingUpdaterAction.init(identifier:metadata:metadataForParameterIdentifier:definition:serializedParameters:appIntentDescriptor:fullyQualifiedActionIdentifier:)();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end