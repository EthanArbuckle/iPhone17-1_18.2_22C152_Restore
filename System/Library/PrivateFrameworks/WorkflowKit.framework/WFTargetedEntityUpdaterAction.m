@interface WFTargetedEntityUpdaterAction
- (BOOL)isApprovedForPublicShortcutsDrawer;
- (BOOL)visibleForUse:(int64_t)a3;
- (NSArray)parameterDefinitions;
- (_TtC11WorkflowKit29WFTargetedEntityUpdaterAction)initWithIdentifier:(id)a3 actionMetadata:(id)a4 entityMetadata:(id)a5 metadataForParameterIdentifier:(id)a6 definition:(id)a7 serializedParameters:(id)a8 appIntentDescriptor:(id)a9 fullyQualifiedActionIdentifier:(id)a10;
- (_TtC11WorkflowKit29WFTargetedEntityUpdaterAction)initWithIdentifier:(id)a3 metadata:(id)a4 metadataForParameterIdentifier:(id)a5 definition:(id)a6 serializedParameters:(id)a7 appIntentDescriptor:(id)a8 fullyQualifiedActionIdentifier:(id)a9;
- (id)copyWithSerializedParameters:(id)a3;
- (id)localizedCategoryWithContext:(id)a3;
- (id)localizedDefaultOutputNameWithContext:(id)a3;
- (id)localizedDescriptionSummaryWithContext:(id)a3;
- (id)localizedNameWithContext:(id)a3;
@end

@implementation WFTargetedEntityUpdaterAction

- (_TtC11WorkflowKit29WFTargetedEntityUpdaterAction)initWithIdentifier:(id)a3 actionMetadata:(id)a4 entityMetadata:(id)a5 metadataForParameterIdentifier:(id)a6 definition:(id)a7 serializedParameters:(id)a8 appIntentDescriptor:(id)a9 fullyQualifiedActionIdentifier:(id)a10
{
  uint64_t v14 = sub_1C8532658();
  uint64_t v16 = v15;
  sub_1C7F42470(0, (unint64_t *)&unk_1EA513E40);
  uint64_t v17 = sub_1C8532538();
  if (a8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA512650);
    a8 = (id)sub_1C8532538();
  }
  return (_TtC11WorkflowKit29WFTargetedEntityUpdaterAction *)WFTargetedEntityUpdaterAction.init(identifier:actionMetadata:entityMetadata:metadataForParameterIdentifier:definition:serializedParameters:appIntentDescriptor:fullyQualifiedActionIdentifier:)(v14, v16, a4, (uint64_t)a5, v17, a7, (uint64_t)a8, a9, a10);
}

- (id)copyWithSerializedParameters:(id)a3
{
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA512650);
    uint64_t v4 = sub_1C8532538();
  }
  else
  {
    uint64_t v4 = 0;
  }
  v5 = self;
  v6 = (void *)sub_1C7FBBA30(v4);

  swift_bridgeObjectRelease();
  return v6;
}

- (NSArray)parameterDefinitions
{
  v2 = self;
  sub_1C7FBBDB0();

  sub_1C7F42470(0, (unint64_t *)&unk_1EA5148D0);
  v3 = (void *)sub_1C8532828();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (id)localizedNameWithContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C7FBC5BC();

  v6 = (void *)sub_1C8532618();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)localizedDescriptionSummaryWithContext:(id)a3
{
  return sub_1C7FBD4E4(self, (uint64_t)a2, a3, (void (*)(id))sub_1C7FBCAAC);
}

- (id)localizedDefaultOutputNameWithContext:(id)a3
{
  return sub_1C7FBD4E4(self, (uint64_t)a2, a3, (void (*)(id))sub_1C7FBD180);
}

- (id)localizedCategoryWithContext:(id)a3
{
  return sub_1C7FBD4E4(self, (uint64_t)a2, a3, (void (*)(id))sub_1C7FBD30C);
}

- (BOOL)visibleForUse:(int64_t)a3
{
  id v4 = self;
  LOBYTE(a3) = sub_1C7FBD578(a3);

  return a3 & 1;
}

- (BOOL)isApprovedForPublicShortcutsDrawer
{
  v2 = self;
  char v3 = sub_1C7FBDC24();

  return v3 & 1;
}

- (_TtC11WorkflowKit29WFTargetedEntityUpdaterAction)initWithIdentifier:(id)a3 metadata:(id)a4 metadataForParameterIdentifier:(id)a5 definition:(id)a6 serializedParameters:(id)a7 appIntentDescriptor:(id)a8 fullyQualifiedActionIdentifier:(id)a9
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
  WFTargetedEntityUpdaterAction.init(identifier:metadata:metadataForParameterIdentifier:definition:serializedParameters:appIntentDescriptor:fullyQualifiedActionIdentifier:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11WorkflowKit29WFTargetedEntityUpdaterAction__entityMetadata));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end