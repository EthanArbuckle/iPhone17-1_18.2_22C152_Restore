@interface WFGetAppSettingAction
- (BOOL)isApprovedForPublicShortcutsDrawer;
- (BOOL)visibleForUse:(int64_t)a3;
- (INAppDescriptor)displayableAppDescriptor;
- (NSArray)disabledOnPlatforms;
- (NSArray)parameterDefinitions;
- (NSDictionary)outputDictionary;
- (WFActionParameterSummary)parameterSummary;
- (_TtC11WorkflowKit21WFGetAppSettingAction)init;
- (_TtC11WorkflowKit21WFGetAppSettingAction)initWithIdentifier:(id)a3 definition:(id)a4 entityByEntityIdentifier:(id)a5 serializedParameters:(id)a6 fullyQualifiedActionIdentifier:(id)a7;
- (_TtC11WorkflowKit21WFGetAppSettingAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5;
- (id)backingActionIdentifiers;
- (id)copyWithSerializedParameters:(id)a3;
- (id)entityMetadataForIdentifier:(id)a3;
- (id)localizedCategoryWithContext:(id)a3;
- (id)localizedDefaultOutputNameWithContext:(id)a3;
- (id)localizedDescriptionResultWithContext:(id)a3;
- (id)localizedDescriptionSummaryWithContext:(id)a3;
- (id)localizedKeywordsWithContext:(id)a3;
- (id)localizedNameWithContext:(id)a3;
- (void)configureParameter:(id)a3;
- (void)runWithInput:(WFContentCollection *)a3 completionHandler:(id)a4;
- (void)wasAddedToWorkflowByUser:(id)a3;
@end

@implementation WFGetAppSettingAction

- (_TtC11WorkflowKit21WFGetAppSettingAction)initWithIdentifier:(id)a3 definition:(id)a4 entityByEntityIdentifier:(id)a5 serializedParameters:(id)a6 fullyQualifiedActionIdentifier:(id)a7
{
  return (_TtC11WorkflowKit21WFGetAppSettingAction *)sub_1C821B4DC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, (uint64_t)a6, a7, (uint64_t (*)(uint64_t, uint64_t, void *, uint64_t, uint64_t, void *))sub_1C8216750);
}

- (id)copyWithSerializedParameters:(id)a3
{
  return (id)sub_1C821AFEC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))sub_1C8216888);
}

- (NSArray)disabledOnPlatforms
{
  v2 = self;
  sub_1C8216AA0();

  type metadata accessor for WFExecutionPlatform(0);
  v3 = (void *)sub_1C8532828();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (INAppDescriptor)displayableAppDescriptor
{
  v2 = self;
  id v3 = sub_1C8216F44();

  return (INAppDescriptor *)v3;
}

- (void)wasAddedToWorkflowByUser:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C8217108();
}

- (void)runWithInput:(WFContentCollection *)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_1C82A95B4((uint64_t)&unk_1EA516900, (uint64_t)v7);
}

- (NSArray)parameterDefinitions
{
  v2 = self;
  sub_1C8218608();

  sub_1C7F42470(0, (unint64_t *)&unk_1EA5148D0);
  id v3 = (void *)sub_1C8532828();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (NSDictionary)outputDictionary
{
  v2 = self;
  sub_1C8218920();

  id v3 = (void *)sub_1C8532518();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v3;
}

- (void)configureParameter:(id)a3
{
}

- (id)localizedDefaultOutputNameWithContext:(id)a3
{
  return sub_1C821B438(self, (uint64_t)a2, a3, (uint64_t (*)(id))sub_1C8218BE0);
}

- (id)localizedDescriptionResultWithContext:(id)a3
{
  return sub_1C821B438(self, (uint64_t)a2, a3, (uint64_t (*)(id))sub_1C8218D34);
}

- (id)localizedNameWithContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C8218E88();

  v6 = (void *)sub_1C8532618();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)localizedCategoryWithContext:(id)a3
{
  return sub_1C821B438(self, (uint64_t)a2, a3, (uint64_t (*)(id))sub_1C8219318);
}

- (id)localizedDescriptionSummaryWithContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C821946C();
  uint64_t v7 = v6;

  if (v7)
  {
    v8 = (void *)sub_1C8532618();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)localizedKeywordsWithContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C8219774(v4);

  uint64_t v6 = (void *)sub_1C8532828();
  swift_bridgeObjectRelease();
  return v6;
}

- (WFActionParameterSummary)parameterSummary
{
  v2 = self;
  id v3 = sub_1C8219E18();

  return (WFActionParameterSummary *)v3;
}

- (BOOL)visibleForUse:(int64_t)a3
{
  id v4 = self;
  LOBYTE(a3) = sub_1C8219F48(a3);

  return a3 & 1;
}

- (BOOL)isApprovedForPublicShortcutsDrawer
{
  v2 = self;
  char v3 = sub_1C821A07C();

  return v3 & 1;
}

- (id)backingActionIdentifiers
{
  v2 = self;
  sub_1C821A0E0();

  char v3 = (void *)sub_1C8532828();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)entityMetadataForIdentifier:(id)a3
{
  uint64_t v4 = sub_1C8532658();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  v8 = sub_1C821A1C8(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (_TtC11WorkflowKit21WFGetAppSettingAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5
{
  sub_1C8532658();
  if (a5)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA512650);
    sub_1C8532538();
  }
  id v7 = a4;
  WFGetAppSettingAction.init(identifier:definition:serializedParameters:)();
}

- (_TtC11WorkflowKit21WFGetAppSettingAction)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC11WorkflowKit21WFGetAppSettingAction_fullyQualifiedActionIdentifier));
  swift_bridgeObjectRelease();
}

@end