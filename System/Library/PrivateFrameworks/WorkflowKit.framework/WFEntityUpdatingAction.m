@interface WFEntityUpdatingAction
+ (NSString)entityParameterName;
- (BOOL)setParameterState:(id)a3 forKey:(id)a4;
- (BOOL)showsAddButtonForParameter:(id)a3;
- (INAppDescriptor)displayableAppDescriptor;
- (NSArray)availableSubjectValues;
- (NSArray)disabledOnPlatforms;
- (_TtC11WorkflowKit22WFEntityUpdatingAction)initWithIdentifier:(id)a3 metadata:(id)a4 definition:(id)a5 serializedParameters:(id)a6 appIntentDescriptor:(id)a7 fullyQualifiedActionIdentifier:(id)a8;
- (_TtC11WorkflowKit22WFEntityUpdatingAction)initWithIdentifier:(id)a3 metadata:(id)a4 metadataForParameterIdentifier:(id)a5 definition:(id)a6 serializedParameters:(id)a7 appIntentDescriptor:(id)a8 fullyQualifiedActionIdentifier:(id)a9;
- (id)backingActionIdentifiers;
- (id)copyWithSerializedParameters:(id)a3;
- (id)localizedDefaultOutputNameWithContext:(id)a3;
- (id)localizedKeywordsWithContext:(id)a3;
- (id)parameterStateForKey:(id)a3;
- (id)serializedParameters;
- (id)visibleParametersWithProcessing:(BOOL)a3;
- (unint64_t)parameterCollapsingBehavior;
- (void)configureParameter:(id)a3;
- (void)finishRunningWithError:(id)a3;
- (void)getValueForParameterData:(id)a3 ofProcessedParameters:(id)a4 fallingBackToDefaultValue:(BOOL)a5 completionHandler:(id)a6;
- (void)runWithInput:(WFContentCollection *)a3 completionHandler:(id)a4;
@end

@implementation WFEntityUpdatingAction

+ (NSString)entityParameterName
{
  v2 = (void *)sub_1C8532618();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (_TtC11WorkflowKit22WFEntityUpdatingAction)initWithIdentifier:(id)a3 metadata:(id)a4 metadataForParameterIdentifier:(id)a5 definition:(id)a6 serializedParameters:(id)a7 appIntentDescriptor:(id)a8 fullyQualifiedActionIdentifier:(id)a9
{
  uint64_t v13 = sub_1C8532658();
  uint64_t v15 = v14;
  sub_1C7F42470(0, (unint64_t *)&unk_1EA513E40);
  uint64_t v16 = sub_1C8532538();
  if (a7)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA512650);
    a7 = (id)sub_1C8532538();
  }
  return (_TtC11WorkflowKit22WFEntityUpdatingAction *)WFEntityUpdatingAction.init(identifier:metadata:metadataForParameterIdentifier:definition:serializedParameters:appIntentDescriptor:fullyQualifiedActionIdentifier:)(v13, v15, a4, v16, a6, (uint64_t)a7, a8, a9);
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
  uint64_t v13 = (void *)sub_1C82ADAE0(v4, v6, v7, v8, v9, v10, v11, v12, v15, v16, v17, v18, vars0, vars8);

  swift_bridgeObjectRelease();
  return v13;
}

- (INAppDescriptor)displayableAppDescriptor
{
  v2 = self;
  id v3 = sub_1C82ADD80();

  return (INAppDescriptor *)v3;
}

- (NSArray)disabledOnPlatforms
{
  v2 = self;
  sub_1C82ADE94();

  type metadata accessor for WFExecutionPlatform(0);
  id v3 = (void *)sub_1C8532828();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (id)localizedDefaultOutputNameWithContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C82ADF74(v4);
  uint64_t v7 = v6;

  if (v7)
  {
    uint64_t v8 = (void *)sub_1C8532618();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

- (id)localizedKeywordsWithContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C82AE1BC();

  uint64_t v6 = (void *)sub_1C8532828();
  swift_bridgeObjectRelease();
  return v6;
}

- (unint64_t)parameterCollapsingBehavior
{
  return 2;
}

- (id)serializedParameters
{
  v2 = self;
  sub_1C82AE61C();

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA512650);
  id v3 = (void *)sub_1C8532518();
  swift_bridgeObjectRelease();
  return v3;
}

- (void)configureParameter:(id)a3
{
  id v5 = a3;
  id v4 = self;
  sub_1C82AE7B4((uint64_t)v5);
}

- (id)visibleParametersWithProcessing:(BOOL)a3
{
  id v4 = self;
  sub_1C82AEBF0(a3);

  sub_1C7F42470(0, (unint64_t *)&qword_1EA5135D0);
  id v5 = (void *)sub_1C8532828();
  swift_bridgeObjectRelease();
  return v5;
}

- (id)parameterStateForKey:(id)a3
{
  sub_1C8532658();
  id v4 = self;
  id v5 = sub_1C82AF2E4();
  swift_bridgeObjectRelease();

  return v5;
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  uint64_t v6 = sub_1C8532658();
  swift_unknownObjectRetain();
  uint64_t v7 = self;
  LOBYTE(v6) = sub_1C82AF580((uint64_t)a3, (void *)v6);
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  return v6 & 1;
}

- (void)runWithInput:(WFContentCollection *)a3 completionHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  uint64_t v8 = a3;
  uint64_t v9 = self;
  sub_1C82A95B4((uint64_t)&unk_1EA5178D8, (uint64_t)v7);
}

- (void)finishRunningWithError:(id)a3
{
  id v5 = self;
  id v4 = a3;
  sub_1C82B1B00(a3);
}

- (void)getValueForParameterData:(id)a3 ofProcessedParameters:(id)a4 fallingBackToDefaultValue:(BOOL)a5 completionHandler:(id)a6
{
  uint64_t v10 = _Block_copy(a6);
  if (a4) {
    a4 = (id)sub_1C8532538();
  }
  _Block_copy(v10);
  id v11 = a3;
  uint64_t v12 = self;
  sub_1C82B1BC4(v11, a4, a5, v12, (void (**)(void, void, void))v10);
  _Block_release(v10);

  swift_bridgeObjectRelease();
}

- (id)backingActionIdentifiers
{
  return sub_1C82B2894(self, (uint64_t)a2, (void (*)(void))sub_1C82B2288);
}

- (BOOL)showsAddButtonForParameter:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = sub_1C82AAD54();

  return self & 1;
}

- (_TtC11WorkflowKit22WFEntityUpdatingAction)initWithIdentifier:(id)a3 metadata:(id)a4 definition:(id)a5 serializedParameters:(id)a6 appIntentDescriptor:(id)a7 fullyQualifiedActionIdentifier:(id)a8
{
  sub_1C8532658();
  if (a6)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA512650);
    sub_1C8532538();
  }
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = a8;
  WFEntityUpdatingAction.init(identifier:metadata:definition:serializedParameters:appIntentDescriptor:fullyQualifiedActionIdentifier:)();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WorkflowKit22WFEntityUpdatingAction_preprocessedEntity));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WorkflowKit22WFEntityUpdatingAction____lazy_storage___addButtonParameter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WorkflowKit22WFEntityUpdatingAction____lazy_storage___tableParameter));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11WorkflowKit22WFEntityUpdatingAction____lazy_storage___batchExecutor);
}

- (NSArray)availableSubjectValues
{
  return (NSArray *)sub_1C82B2894(self, (uint64_t)a2, (void (*)(void))WFEntityUpdatingAction.availableSubjectValues.getter);
}

@end