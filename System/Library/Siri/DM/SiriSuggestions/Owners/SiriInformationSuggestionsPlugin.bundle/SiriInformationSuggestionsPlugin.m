void *SuggestionConstants.serverPayloadKey.unsafeMutableAddressor()
{
  return &static SuggestionConstants.serverPayloadKey;
}

unint64_t static SuggestionConstants.serverPayloadKey.getter()
{
  return 0xD000000000000017;
}

void *SuggestionConstants.alternateQueryPayloadKey.unsafeMutableAddressor()
{
  return &static SuggestionConstants.alternateQueryPayloadKey;
}

unint64_t static SuggestionConstants.alternateQueryPayloadKey.getter()
{
  return 0xD000000000000015;
}

void *SuggestionConstants.alternateSuggestionId.unsafeMutableAddressor()
{
  return &static SuggestionConstants.alternateSuggestionId;
}

unint64_t static SuggestionConstants.alternateSuggestionId.getter()
{
  return 0xD000000000000013;
}

void *SuggestionConstants.relatedQuestionsPayloadKey.unsafeMutableAddressor()
{
  return &static SuggestionConstants.relatedQuestionsPayloadKey;
}

unint64_t static SuggestionConstants.relatedQuestionsPayloadKey.getter()
{
  return 0xD000000000000017;
}

void *SuggestionConstants.relatedQuestionsSuggestionId.unsafeMutableAddressor()
{
  return &static SuggestionConstants.relatedQuestionsSuggestionId;
}

unint64_t static SuggestionConstants.relatedQuestionsSuggestionId.getter()
{
  return 0xD000000000000010;
}

void *SuggestionConstants.serverSuggestionId.unsafeMutableAddressor()
{
  return &static SuggestionConstants.serverSuggestionId;
}

unint64_t static SuggestionConstants.serverSuggestionId.getter()
{
  return 0xD000000000000014;
}

void *SuggestionConstants.serverSuggestionIdMath.unsafeMutableAddressor()
{
  return &static SuggestionConstants.serverSuggestionIdMath;
}

unint64_t static SuggestionConstants.serverSuggestionIdMath.getter()
{
  return 0xD000000000000018;
}

void one-time initialization function for serverIntentName()
{
  static SuggestionConstants.serverIntentName = 0x614E746E65746E69;
  unk_189C0 = 0xEA0000000000656DLL;
}

uint64_t *SuggestionConstants.serverIntentName.unsafeMutableAddressor()
{
  if (one-time initialization token for serverIntentName != -1) {
    swift_once();
  }
  return &static SuggestionConstants.serverIntentName;
}

uint64_t static SuggestionConstants.serverIntentName.getter()
{
  if (one-time initialization token for serverIntentName != -1) {
    swift_once();
  }
  uint64_t v0 = static SuggestionConstants.serverIntentName;
  swift_bridgeObjectRetain();
  return v0;
}

void *SuggestionConstants.serverExampleUtterance.unsafeMutableAddressor()
{
  return &static SuggestionConstants.serverExampleUtterance;
}

unint64_t static SuggestionConstants.serverExampleUtterance.getter()
{
  return 0xD000000000000010;
}

uint64_t one-time initialization function for kOwnerInformation(uint64_t a1)
{
  return one-time initialization function for kOwnerInformation(a1, 0x74616D726F666E49, 0xEB000000006E6F69, &static SuggestionConstants.kOwnerInformation);
}

uint64_t *SuggestionConstants.kOwnerInformation.unsafeMutableAddressor()
{
  if (one-time initialization token for kOwnerInformation != -1) {
    swift_once();
  }
  return &static SuggestionConstants.kOwnerInformation;
}

uint64_t static SuggestionConstants.kOwnerInformation.getter()
{
  return static SuggestionConstants.kOwnerInformation.getter(&one-time initialization token for kOwnerInformation);
}

uint64_t one-time initialization function for kOwnerMaps(uint64_t a1)
{
  return one-time initialization function for kOwnerInformation(a1, 0x6F654769726953, 0xE700000000000000, &static SuggestionConstants.kOwnerMaps);
}

uint64_t one-time initialization function for kOwnerInformation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  type metadata accessor for DomainOwner();
  swift_allocObject();
  uint64_t result = DomainOwner.init(_:)();
  *a4 = result;
  return result;
}

uint64_t *SuggestionConstants.kOwnerMaps.unsafeMutableAddressor()
{
  if (one-time initialization token for kOwnerMaps != -1) {
    swift_once();
  }
  return &static SuggestionConstants.kOwnerMaps;
}

uint64_t static SuggestionConstants.kOwnerMaps.getter()
{
  return static SuggestionConstants.kOwnerInformation.getter(&one-time initialization token for kOwnerMaps);
}

uint64_t static SuggestionConstants.kOwnerInformation.getter(void *a1)
{
  if (*a1 != -1) {
    swift_once();
  }
  return swift_retain();
}

uint64_t one-time initialization function for mathSuggestionIntents()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Apple_Parsec_Siri_V2alpha_SuggestionIntent>);
  uint64_t v0 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SuggestionIntent();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = *(void *)(v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_11500;
  unint64_t v5 = v4 + v3;
  v6 = *(void (**)(unint64_t, void, uint64_t))(v1 + 104);
  v6(v5, enum case for Apple_Parsec_Siri_V2alpha_SuggestionIntent.mathResult(_:), v0);
  v6(v5 + v2, enum case for Apple_Parsec_Siri_V2alpha_SuggestionIntent.mathDecimalToFraction(_:), v0);
  v6(v5 + 2 * v2, enum case for Apple_Parsec_Siri_V2alpha_SuggestionIntent.mathTipCalculation(_:), v0);
  v6(v5 + 3 * v2, enum case for Apple_Parsec_Siri_V2alpha_SuggestionIntent.mathPythagoreanTheorem(_:), v0);
  v6(v5 + 4 * v2, enum case for Apple_Parsec_Siri_V2alpha_SuggestionIntent.mathArithmetic(_:), v0);
  uint64_t result = ((uint64_t (*)(unint64_t, void, uint64_t))v6)(v5 + 5 * v2, enum case for Apple_Parsec_Siri_V2alpha_SuggestionIntent.kgSimpleMathConcept(_:), v0);
  static SuggestionConstants.mathSuggestionIntents = v4;
  return result;
}

uint64_t *SuggestionConstants.mathSuggestionIntents.unsafeMutableAddressor()
{
  if (one-time initialization token for mathSuggestionIntents != -1) {
    swift_once();
  }
  return &static SuggestionConstants.mathSuggestionIntents;
}

uint64_t static SuggestionConstants.mathSuggestionIntents.getter()
{
  return static SuggestionConstants.mathSuggestionIntents.getter(&one-time initialization token for mathSuggestionIntents);
}

uint64_t one-time initialization function for t41Locales()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Locale>);
  type metadata accessor for Locale();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_11510;
  Locale.init(identifier:)();
  Locale.init(identifier:)();
  Locale.init(identifier:)();
  Locale.init(identifier:)();
  Locale.init(identifier:)();
  Locale.init(identifier:)();
  Locale.init(identifier:)();
  Locale.init(identifier:)();
  Locale.init(identifier:)();
  Locale.init(identifier:)();
  Locale.init(identifier:)();
  Locale.init(identifier:)();
  Locale.init(identifier:)();
  Locale.init(identifier:)();
  Locale.init(identifier:)();
  Locale.init(identifier:)();
  Locale.init(identifier:)();
  Locale.init(identifier:)();
  Locale.init(identifier:)();
  Locale.init(identifier:)();
  Locale.init(identifier:)();
  Locale.init(identifier:)();
  Locale.init(identifier:)();
  Locale.init(identifier:)();
  Locale.init(identifier:)();
  Locale.init(identifier:)();
  Locale.init(identifier:)();
  Locale.init(identifier:)();
  Locale.init(identifier:)();
  Locale.init(identifier:)();
  Locale.init(identifier:)();
  Locale.init(identifier:)();
  Locale.init(identifier:)();
  Locale.init(identifier:)();
  Locale.init(identifier:)();
  Locale.init(identifier:)();
  Locale.init(identifier:)();
  Locale.init(identifier:)();
  Locale.init(identifier:)();
  Locale.init(identifier:)();
  Locale.init(identifier:)();
  uint64_t result = destructiveProjectEnumData for SiriSuggestionsFeatureFlags(v0);
  static SuggestionConstants.t41Locales = result;
  return result;
}

uint64_t *SuggestionConstants.t41Locales.unsafeMutableAddressor()
{
  if (one-time initialization token for t41Locales != -1) {
    swift_once();
  }
  return &static SuggestionConstants.t41Locales;
}

uint64_t static SuggestionConstants.t41Locales.getter()
{
  return static SuggestionConstants.mathSuggestionIntents.getter(&one-time initialization token for t41Locales);
}

uint64_t static SuggestionConstants.mathSuggestionIntents.getter(void *a1)
{
  if (*a1 != -1) {
    swift_once();
  }
  return swift_bridgeObjectRetain();
}

unint64_t variable initialization expression of SolarEventResolver.resolverTypeOperand()
{
  return 0xD000000000000010;
}

void default argument 1 of SolarEventResolver.resolveParameter(date:calendar:)()
{
  id v0 = [self currentCalendar];
  static Calendar._unconditionallyBridgeFromObjectiveC(_:)();
}

ValueMetadata *type metadata accessor for SuggestionConstants()
{
  return &type metadata for SuggestionConstants;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

const char *SiriSuggestionsFeatureFlags.domain.getter()
{
  return "SiriAssistantSuggestions";
}

const char *SiriSuggestionsFeatureFlags.feature.getter()
{
  return "relatedQuestions";
}

uint64_t static SiriSuggestionsFeatureFlags.__derived_enum_equals(_:_:)()
{
  return 1;
}

void SiriSuggestionsFeatureFlags.hash(into:)()
{
}

Swift::Int SiriSuggestionsFeatureFlags.hashValue.getter()
{
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance SiriSuggestionsFeatureFlags()
{
  return Hasher._finalize()();
}

uint64_t static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:)(uint64_t a1, uint64_t a2)
{
  v3[13] = a2;
  v3[14] = v2;
  v3[12] = a1;
  uint64_t v4 = type metadata accessor for DialogDetails();
  v3[15] = v4;
  v3[16] = *(void *)(v4 - 8);
  v3[17] = swift_task_alloc();
  return _swift_task_switch(static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:), 0, 0);
}

uint64_t static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:)()
{
  if (one-time initialization token for kOwnerInformation != -1) {
    swift_once();
  }
  uint64_t v1 = (int *)v0[12];
  uint64_t v2 = static SuggestionConstants.kOwnerInformation;
  v0[5] = type metadata accessor for DomainOwner();
  v0[6] = lazy protocol witness table accessor for type DomainOwner and conformance DomainOwner(&lazy protocol witness table cache variable for type DomainOwner and conformance DomainOwner, 255, (void (*)(uint64_t))&type metadata accessor for DomainOwner);
  v0[2] = v2;
  unint64_t v5 = (uint64_t (*)(void *))((char *)v1 + *v1);
  swift_retain();
  unint64_t v3 = (void *)swift_task_alloc();
  v0[18] = v3;
  *unint64_t v3 = v0;
  v3[1] = static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:);
  return v5(v0 + 2);
}

{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, uint64_t, uint64_t);
  void (*v9)(void *, uint64_t);
  void (*v10)(void *, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v23;
  uint64_t v24;

  uint64_t v2 = v0[16];
  uint64_t v1 = (void *)v0[17];
  uint64_t v4 = v0[14];
  unint64_t v3 = v0[15];
  unint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = partial apply for implicit closure #1 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:);
  *(void *)(v6 + 24) = v5;
  *uint64_t v1 = &async function pointer to partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed DialogProperties) -> (@out Any);
  v1[1] = v6;
  v7 = enum case for DialogDetails.catTemplateCallback(_:);
  v8 = *(void (**)(void *, uint64_t, uint64_t))(v2 + 104);
  v8(v1, enum case for DialogDetails.catTemplateCallback(_:), v3);
  dispatch thunk of SuggestionOwnerDefinitionBuilder.add(suggestionId:dialogDetails:builder:)();
  swift_release();
  v9 = *(void (**)(void *, uint64_t))(v2 + 8);
  v9(v1, v3);
  v10 = v9;
  v11 = swift_allocObject();
  *(void *)(v11 + 16) = v4;
  v12 = swift_allocObject();
  *(void *)(v12 + 16) = partial apply for implicit closure #2 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:);
  *(void *)(v12 + 24) = v11;
  *uint64_t v1 = &thunk for @escaping @callee_guaranteed (@in_guaranteed DialogProperties) -> (@out Any)partial apply;
  v1[1] = v12;
  v8(v1, v7, v3);
  dispatch thunk of SuggestionOwnerDefinitionBuilder.add(suggestionId:dialogDetails:builder:)();
  swift_release();
  v10(v1, v3);
  v13 = swift_allocObject();
  *(void *)(v13 + 16) = v4;
  v14 = swift_allocObject();
  *(void *)(v14 + 16) = partial apply for implicit closure #1 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:);
  *(void *)(v14 + 24) = v13;
  *uint64_t v1 = &thunk for @escaping @callee_guaranteed (@in_guaranteed DialogProperties) -> (@out Any)partial apply;
  v1[1] = v14;
  v8(v1, v7, v3);
  dispatch thunk of SuggestionOwnerDefinitionBuilder.add(suggestionId:dialogDetails:builder:)();
  swift_release();
  v10(v1, v3);
  v15 = swift_allocObject();
  *(void *)(v15 + 16) = v4;
  v16 = swift_allocObject();
  *(void *)(v16 + 16) = partial apply for implicit closure #1 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:);
  *(void *)(v16 + 24) = v15;
  *uint64_t v1 = &thunk for @escaping @callee_guaranteed (@in_guaranteed DialogProperties) -> (@out Any)partial apply;
  v1[1] = v16;
  v8(v1, v7, v3);
  dispatch thunk of SuggestionOwnerDefinitionBuilder.add(suggestionId:dialogDetails:builder:)();
  v10(v1, v3);
  v17 = type metadata accessor for InfoServerGenerator();
  v18 = swift_allocObject();
  v23[10] = v17;
  v23[11] = lazy protocol witness table accessor for type DomainOwner and conformance DomainOwner(&lazy protocol witness table cache variable for type InfoServerGenerator and conformance InfoServerGenerator, v19, (void (*)(uint64_t))type metadata accessor for InfoServerGenerator);
  v23[7] = v18;
  dispatch thunk of SuggestionOwnerDefinitionBuilder.withConversationalGenerator(_:)();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v23 + 7));
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<OwnerDefinition>);
  v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_11570;
  dispatch thunk of SuggestionOwnerDefinitionBuilder.build()();
  swift_release();
  swift_task_dealloc();
  v21 = (uint64_t (*)(uint64_t))v23[1];
  return v21(v20);
}

uint64_t static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:)(uint64_t a1)
{
  uint64_t v2 = *(void *)v1 + 16;
  *(void *)(*(void *)v1 + 152) = a1;
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1Tm(v2);
  return _swift_task_switch(static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:), 0, 0);
}

uint64_t sub_321C()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t static InfoServerSuggestionDefinitionFactory.serverUtteranceMapper(dialogProperties:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  v35 = a2;
  uint64_t v34 = type metadata accessor for BehaviorAfterSpeaking();
  uint64_t v3 = *(void *)(v34 - 8);
  __chkstk_darwin();
  unint64_t v5 = (char *)v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TemplatingText?);
  __chkstk_darwin();
  v33 = (char *)v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for TemplatingText();
  uint64_t v31 = *(void *)(v7 - 8);
  uint64_t v32 = v7;
  __chkstk_darwin();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_ServerSuggestionUtterance?);
  __chkstk_darwin();
  v9 = (char *)v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestionUtterance();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin();
  v13 = (char *)v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  uint64_t v14 = dispatch thunk of DialogProperties.getParameters()();
  if (!*(void *)(v14 + 16)
    || (unint64_t v15 = specialized __RawDictionaryStorage.find<A>(_:)(0xD000000000000010, 0x8000000000011E30), (v16 & 1) == 0))
  {
    long long v36 = 0u;
    long long v37 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  outlined init with copy of Any(*(void *)(v14 + 56) + 32 * v15, (uint64_t)&v36);
  swift_bridgeObjectRelease();
  if (!*((void *)&v37 + 1))
  {
LABEL_9:
    outlined destroy of Any?((uint64_t)&v36, &demangling cache variable for type metadata for Any?);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, 1, 1, v10);
    goto LABEL_10;
  }
  int v17 = swift_dynamicCast();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v9, v17 ^ 1u, 1, v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v9, v10);
    if (one-time initialization token for serverIntentName != -1) {
      swift_once();
    }
    v30[4] = static SuggestionConstants.serverIntentName;
    v30[2] = unk_189C0;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<TemplatingSection>);
    uint64_t v18 = *(void *)(type metadata accessor for TemplatingSection() - 8);
    unint64_t v19 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
    uint64_t v20 = swift_allocObject();
    v30[3] = v20;
    *(_OWORD *)(v20 + 16) = xmmword_11570;
    v30[1] = v20 + v19;
    swift_bridgeObjectRetain();
    Apple_Parsec_Siri_V2alpha_ServerSuggestionUtterance.print.getter();
    Apple_Parsec_Siri_V2alpha_ServerSuggestionUtterance.speak.getter();
    TemplatingText.init(text:speakableTextOverride:)();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v31 + 56))(v33, 1, 1, v32);
    TemplatingSection.init(id:content:caption:spokenOnly:)();
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for BehaviorAfterSpeaking.defaultBehavior(_:), v34);
    uint64_t v21 = type metadata accessor for TemplatingResult();
    v22 = v35;
    v35[3] = v21;
    __swift_allocate_boxed_opaque_existential_0Tm(v22);
    TemplatingResult.init(templateIdentifier:sections:behaviorAfterSpeaking:)();
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
LABEL_10:
  outlined destroy of Any?((uint64_t)v9, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_ServerSuggestionUtterance?);
  if (one-time initialization token for suggestions != -1) {
    swift_once();
  }
  uint64_t v24 = type metadata accessor for Logger();
  __swift_project_value_buffer(v24, (uint64_t)static Logger.suggestions);
  v25 = Logger.logObject.getter();
  os_log_type_t v26 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v25, v26))
  {
    v27 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v27 = 0;
    _os_log_impl(&dword_0, v25, v26, "Unable to find example utterance in dialog parameter", v27, 2u);
    swift_slowDealloc();
  }

  if (one-time initialization token for serverIntentName != -1) {
    swift_once();
  }
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for BehaviorAfterSpeaking.defaultBehavior(_:), v34);
  uint64_t v28 = type metadata accessor for TemplatingResult();
  v29 = v35;
  v35[3] = v28;
  __swift_allocate_boxed_opaque_existential_0Tm(v29);
  swift_bridgeObjectRetain();
  return TemplatingResult.init(templateIdentifier:sections:behaviorAfterSpeaking:)();
}

uint64_t thunk for @escaping @callee_guaranteed (@in_guaranteed DialogProperties) -> (@out Any)(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  a3(a2);
  uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
  return thunk for @escaping @callee_guaranteed (@in_guaranteed DialogProperties) -> (@out Any)(v4);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed DialogProperties) -> (@out Any)(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void (**)(uint64_t))(v2 + 16);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed DialogProperties) -> (@out Any);
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, void (*)(uint64_t)))((char *)&async function pointer to thunk for @escaping @callee_guaranteed (@in_guaranteed DialogProperties) -> (@out Any)
                                                                              + async function pointer to thunk for @escaping @callee_guaranteed (@in_guaranteed DialogProperties) -> (@out Any));
  return v8(a1, a2, v6);
}

uint64_t closure #1 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:)(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transformer<Any, Any?>);
  __chkstk_darwin();
  uint64_t v2 = *(void *)(a1 + 40);
  long long v19 = *(_OWORD *)(a1 + 24);
  __swift_project_boxed_opaque_existential_1Tm((void *)a1, v19);
  if (one-time initialization token for serverIntentName != -1) {
    swift_once();
  }
  uint64_t v3 = static SuggestionConstants.serverIntentName;
  uint64_t v4 = unk_189C0;
  uint64_t v5 = type metadata accessor for FromContextResolver();
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = v3;
  v6[3] = v4;
  v6[4] = &async function pointer to closure #1 in closure #1 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:);
  v6[5] = 0;
  *(void *)&long long v34 = v5;
  uint64_t v8 = lazy protocol witness table accessor for type DomainOwner and conformance DomainOwner(&lazy protocol witness table cache variable for type FromContextResolver and conformance FromContextResolver, v7, (void (*)(uint64_t))type metadata accessor for FromContextResolver);
  *((void *)&v34 + 1) = v8;
  v33[0] = (uint64_t)v6;
  type metadata accessor for ResolvableParameter();
  swift_bridgeObjectRetain_n();
  static SuggestionTransformers.removeParameterFromLogging()();
  ResolvableParameter.__allocating_init(typeIdentifier:required:loggingKeyTransformer:)();
  long long v37 = v19;
  uint64_t v38 = v2;
  __swift_allocate_boxed_opaque_existential_0Tm(v36);
  SuggestionDetailsBuilder.parameter(parameterName:resolver:resolveParam:)();
  swift_release();
  outlined destroy of Any?((uint64_t)v33, &demangling cache variable for type metadata for Resolver?);
  uint64_t v9 = v38;
  long long v23 = v37;
  __swift_project_boxed_opaque_existential_1Tm(v36, v37);
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = 0xD000000000000010;
  v10[3] = 0x8000000000011E30;
  v10[4] = &async function pointer to closure #2 in closure #1 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:);
  v10[5] = 0;
  *(void *)&long long v31 = v5;
  *((void *)&v31 + 1) = v8;
  v30[0] = (uint64_t)v10;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  Transformer.init(transform:)();
  ResolvableParameter.__allocating_init(typeIdentifier:required:loggingKeyTransformer:)();
  long long v34 = v23;
  uint64_t v35 = v9;
  __swift_allocate_boxed_opaque_existential_0Tm(v33);
  SuggestionDetailsBuilder.parameter(parameterName:resolver:resolveParam:)();
  swift_release();
  outlined destroy of Any?((uint64_t)v30, &demangling cache variable for type metadata for Resolver?);
  uint64_t v11 = v35;
  long long v20 = v34;
  __swift_project_boxed_opaque_existential_1Tm(v33, v34);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<VersionedInvocation>);
  type metadata accessor for VersionedInvocation();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_11570;
  static VersionedInvocations.latest.getter();
  long long v31 = v20;
  uint64_t v32 = v11;
  __swift_allocate_boxed_opaque_existential_0Tm(v30);
  dispatch thunk of SuggestionDetailsBuilder.validForInvocationTypes(_:)();
  swift_bridgeObjectRelease();
  uint64_t v12 = v32;
  long long v21 = v31;
  __swift_project_boxed_opaque_existential_1Tm(v30, v31);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<DeliveryVehicle>);
  uint64_t v13 = type metadata accessor for DeliveryVehicle();
  uint64_t v14 = *(void *)(v13 - 8);
  unint64_t v15 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_11570;
  (*(void (**)(unint64_t, void, uint64_t))(v14 + 104))(v16 + v15, enum case for DeliveryVehicle.assistantSuggestions(_:), v13);
  long long v28 = v21;
  uint64_t v29 = v12;
  __swift_allocate_boxed_opaque_existential_0Tm(v27);
  dispatch thunk of SuggestionDetailsBuilder.enabledDeliveryVehicles(_:)();
  swift_bridgeObjectRelease();
  uint64_t v17 = v29;
  long long v22 = v28;
  __swift_project_boxed_opaque_existential_1Tm(v27, v28);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Locale>);
  type metadata accessor for Locale();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_11570;
  Locale.init(identifier:)();
  long long v25 = v22;
  uint64_t v26 = v17;
  __swift_allocate_boxed_opaque_existential_0Tm(v24);
  dispatch thunk of SuggestionDetailsBuilder.enabledLocales(_:)();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v24);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v27);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v30);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v33);
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v36);
}

uint64_t closure #1 in closure #1 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[5] = a2;
  v3[6] = a3;
  v3[4] = a1;
  v3[7] = swift_getObjectType();
  uint64_t v5 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(closure #1 in closure #1 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:), v5, v4);
}

uint64_t closure #1 in closure #1 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:)()
{
  Swift::String_optional v1 = Context.getServerIntent()();
  v0[1] = v1;
  v0[4].value._countAndFlagsBits = (uint64_t)v1.value._object;
  return _swift_task_switch(closure #1 in closure #1 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:), 0, 0);
}

Swift::String_optional __swiftcall Context.getServerIntent()()
{
  if (one-time initialization token for kOwnerInformation != -1) {
    swift_once();
  }
  uint64_t v0 = static SuggestionConstants.kOwnerInformation;
  v7[3] = type metadata accessor for DomainOwner();
  v7[4] = &protocol witness table for DomainOwner;
  v7[0] = v0;
  uint64_t v1 = one-time initialization token for serverIntentName;
  swift_retain();
  if (v1 != -1) {
    swift_once();
  }
  Context.getParam(for:key:)();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v7);
  if (v9)
  {
    int v2 = swift_dynamicCast();
    BOOL v3 = v2 == 0;
    if (v2) {
      uint64_t v4 = v7[0];
    }
    else {
      uint64_t v4 = 0;
    }
    if (v3) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = (void *)v7[1];
    }
  }
  else
  {
    outlined destroy of Any?((uint64_t)v8, &demangling cache variable for type metadata for Any?);
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  result.value._object = v5;
  result.value._countAndFlagsBits = v4;
  return result;
}

void *FromContextResolver.__allocating_init(resolverTypeOperand:propertyExtractor:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  Swift::String_optional result = (void *)swift_allocObject();
  result[2] = a1;
  result[3] = a2;
  result[4] = a3;
  result[5] = a4;
  return result;
}

uint64_t closure #2 in closure #1 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_ServerSuggestionUtterance?);
  v3[5] = swift_task_alloc();
  v3[6] = swift_getObjectType();
  uint64_t v5 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(closure #2 in closure #1 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:), v5, v4);
}

uint64_t closure #2 in closure #1 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:)()
{
  Context.getUtterance()(*(void *)(v0 + 40));
  return _swift_task_switch(closure #2 in closure #1 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:), 0, 0);
}

uint64_t Context.getUtterance()@<X0>(uint64_t a1@<X8>)
{
  if (one-time initialization token for kOwnerInformation != -1) {
    swift_once();
  }
  uint64_t v2 = static SuggestionConstants.kOwnerInformation;
  v7[3] = type metadata accessor for DomainOwner();
  v7[4] = &protocol witness table for DomainOwner;
  v7[0] = v2;
  swift_retain();
  Context.getParam(for:key:)();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v7);
  if (v9)
  {
    uint64_t v3 = type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestionUtterance();
    int v4 = swift_dynamicCast();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(a1, v4 ^ 1u, 1, v3);
  }
  else
  {
    outlined destroy of Any?((uint64_t)v8, &demangling cache variable for type metadata for Any?);
    uint64_t v6 = type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestionUtterance();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(a1, 1, 1, v6);
  }
}

uint64_t closure #3 in closure #1 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for UUID();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  UUID.init()();
  uint64_t v6 = UUID.uuidString.getter();
  uint64_t v8 = v7;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  a1[3] = (uint64_t)&type metadata for String;
  *a1 = v6;
  a1[1] = v8;
  return result;
}

uint64_t sub_46A8()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t partial apply for implicit closure #2 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return static InfoServerSuggestionDefinitionFactory.serverUtteranceMapper(dialogProperties:)(a1, a2);
}

uint64_t thunk for @escaping @callee_guaranteed (@in_guaranteed DialogProperties) -> (@out Any)partial apply(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void (**)(uint64_t))(v2 + 16);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = thunk for @escaping @callee_guaranteed (@in_guaranteed DialogProperties) -> (@out Any)partial apply;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, void (*)(uint64_t)))((char *)&async function pointer to thunk for @escaping @callee_guaranteed (@in_guaranteed DialogProperties) -> (@out Any)
                                                                              + async function pointer to thunk for @escaping @callee_guaranteed (@in_guaranteed DialogProperties) -> (@out Any));
  return v8(a1, a2, v6);
}

uint64_t thunk for @escaping @callee_guaranteed (@in_guaranteed DialogProperties) -> (@out Any)partial apply()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t closure #1 in closure #2 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_ServerSuggestionUtterance?);
  v3[5] = swift_task_alloc();
  v3[6] = swift_getObjectType();
  uint64_t v5 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(closure #1 in closure #2 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:), v5, v4);
}

uint64_t closure #1 in closure #2 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:)()
{
  Context.getUtterance()(*(void *)(v0 + 40));
  return _swift_task_switch(closure #1 in closure #2 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:), 0, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t *boxed_opaque_existential_0Tm;
  uint64_t (*v7)(void);
  uint64_t v9;

  uint64_t v1 = v0[5];
  uint64_t v2 = type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestionUtterance();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2);
  uint64_t v5 = v0[2];
  if (v4 == 1)
  {
    outlined destroy of Any?(v1, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_ServerSuggestionUtterance?);
    *(_OWORD *)uint64_t v5 = 0u;
    *(_OWORD *)(v5 + 16) = 0u;
  }
  else
  {
    *(void *)(v5 + 24) = v2;
    boxed_opaque_existential_0Tm = __swift_allocate_boxed_opaque_existential_0Tm((uint64_t *)v5);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v3 + 32))(boxed_opaque_existential_0Tm, v1, v2);
  }
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t InfoServerSuggestionDefinitionFactory.utteranceToLoggingIdTransformer.unsafeMutableAddressor()
{
  if (one-time initialization token for utteranceToLoggingIdTransformer != -1) {
    swift_once();
  }
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transformer<Any, Any?>);
  return __swift_project_value_buffer(v0, (uint64_t)static InfoServerSuggestionDefinitionFactory.utteranceToLoggingIdTransformer);
}

uint64_t closure #3 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:)(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transformer<Any, Any?>);
  __chkstk_darwin();
  uint64_t v2 = *(void *)(a1 + 40);
  long long v22 = *(_OWORD *)(a1 + 24);
  __swift_project_boxed_opaque_existential_1Tm((void *)a1, v22);
  if (one-time initialization token for serverIntentName != -1) {
    swift_once();
  }
  uint64_t v3 = static SuggestionConstants.serverIntentName;
  uint64_t v4 = unk_189C0;
  uint64_t v5 = type metadata accessor for FromContextResolver();
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = v3;
  v6[3] = v4;
  v6[4] = &async function pointer to closure #1 in closure #3 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:);
  v6[5] = 0;
  *(void *)&long long v37 = v5;
  uint64_t v8 = lazy protocol witness table accessor for type DomainOwner and conformance DomainOwner(&lazy protocol witness table cache variable for type FromContextResolver and conformance FromContextResolver, v7, (void (*)(uint64_t))type metadata accessor for FromContextResolver);
  *((void *)&v37 + 1) = v8;
  v36[0] = (uint64_t)v6;
  type metadata accessor for ResolvableParameter();
  swift_bridgeObjectRetain_n();
  static SuggestionTransformers.passthroughParameterForLogging()();
  ResolvableParameter.__allocating_init(typeIdentifier:required:loggingKeyTransformer:)();
  long long v40 = v22;
  uint64_t v41 = v2;
  __swift_allocate_boxed_opaque_existential_0Tm(v39);
  SuggestionDetailsBuilder.parameter(parameterName:resolver:resolveParam:)();
  swift_release();
  outlined destroy of Any?((uint64_t)v36, &demangling cache variable for type metadata for Resolver?);
  uint64_t v9 = v41;
  long long v23 = v40;
  __swift_project_boxed_opaque_existential_1Tm(v39, v40);
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = 0xD000000000000010;
  v10[3] = 0x8000000000011E30;
  v10[4] = &async function pointer to closure #2 in closure #3 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:);
  v10[5] = 0;
  *(void *)&long long v34 = v5;
  *((void *)&v34 + 1) = v8;
  v33[0] = (uint64_t)v10;
  ResolvableParameter.__allocating_init(typeIdentifier:required:)();
  long long v37 = v23;
  uint64_t v38 = v9;
  __swift_allocate_boxed_opaque_existential_0Tm(v36);
  SuggestionDetailsBuilder.parameter(parameterName:resolver:resolveParam:)();
  swift_release();
  outlined destroy of Any?((uint64_t)v33, &demangling cache variable for type metadata for Resolver?);
  uint64_t v11 = v38;
  long long v24 = v37;
  __swift_project_boxed_opaque_existential_1Tm(v36, v37);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<VersionedInvocation>);
  type metadata accessor for VersionedInvocation();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_11570;
  static VersionedInvocations.HintsDawnA.getter();
  long long v34 = v24;
  uint64_t v35 = v11;
  __swift_allocate_boxed_opaque_existential_0Tm(v33);
  dispatch thunk of SuggestionDetailsBuilder.validForInvocationTypes(_:)();
  swift_bridgeObjectRelease();
  uint64_t v12 = v35;
  long long v25 = v34;
  __swift_project_boxed_opaque_existential_1Tm(v33, v34);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<DeliveryVehicle>);
  uint64_t v13 = type metadata accessor for DeliveryVehicle();
  uint64_t v14 = *(void *)(v13 - 8);
  unint64_t v15 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_11570;
  unint64_t v17 = v16 + v15;
  uint64_t v18 = enum case for SiriHintsMode.display(_:);
  uint64_t v19 = type metadata accessor for SiriHintsMode();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 104))(v17, v18, v19);
  (*(void (**)(unint64_t, void, uint64_t))(v14 + 104))(v17, enum case for DeliveryVehicle.siriHints(_:), v13);
  long long v31 = v25;
  uint64_t v32 = v12;
  __swift_allocate_boxed_opaque_existential_0Tm(v30);
  dispatch thunk of SuggestionDetailsBuilder.enabledDeliveryVehicles(_:)();
  swift_bridgeObjectRelease();
  uint64_t v20 = v32;
  long long v26 = v31;
  __swift_project_boxed_opaque_existential_1Tm(v30, v31);
  if (one-time initialization token for t41Locales != -1) {
    swift_once();
  }
  long long v28 = v26;
  uint64_t v29 = v20;
  __swift_allocate_boxed_opaque_existential_0Tm(v27);
  dispatch thunk of SuggestionDetailsBuilder.enabledLocales(_:)();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v27);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v30);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v33);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v36);
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v39);
}

uint64_t closure #1 in closure #3 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[5] = a2;
  v3[6] = a3;
  v3[4] = a1;
  v3[7] = swift_getObjectType();
  uint64_t v5 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(closure #1 in closure #3 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:), v5, v4);
}

uint64_t closure #1 in closure #3 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:)()
{
  Swift::String_optional v1 = Context.getServerIntent()();
  v0[1] = v1;
  v0[4].value._countAndFlagsBits = (uint64_t)v1.value._object;
  return _swift_task_switch(closure #1 in closure #3 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:), 0, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _OWORD *v4;

  Swift::String_optional v1 = *(void *)(v0 + 64);
  if (v1)
  {
    uint64_t v2 = *(void *)(v0 + 16);
    uint64_t v3 = *(void **)(v0 + 32);
    v3[3] = &type metadata for String;
    *uint64_t v3 = v2;
    v3[1] = v1;
  }
  else
  {
    uint64_t v4 = *(_OWORD **)(v0 + 32);
    *uint64_t v4 = 0u;
    v4[1] = 0u;
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t closure #4 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:)(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transformer<Any, Any?>);
  __chkstk_darwin();
  uint64_t v2 = *(void *)(a1 + 40);
  long long v22 = *(_OWORD *)(a1 + 24);
  __swift_project_boxed_opaque_existential_1Tm((void *)a1, v22);
  if (one-time initialization token for serverIntentName != -1) {
    swift_once();
  }
  uint64_t v3 = static SuggestionConstants.serverIntentName;
  uint64_t v4 = unk_189C0;
  uint64_t v5 = type metadata accessor for FromContextResolver();
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = v3;
  v6[3] = v4;
  v6[4] = &async function pointer to closure #1 in closure #4 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:);
  v6[5] = 0;
  *(void *)&long long v37 = v5;
  uint64_t v8 = lazy protocol witness table accessor for type DomainOwner and conformance DomainOwner(&lazy protocol witness table cache variable for type FromContextResolver and conformance FromContextResolver, v7, (void (*)(uint64_t))type metadata accessor for FromContextResolver);
  *((void *)&v37 + 1) = v8;
  v36[0] = (uint64_t)v6;
  type metadata accessor for ResolvableParameter();
  swift_bridgeObjectRetain_n();
  static SuggestionTransformers.passthroughParameterForLogging()();
  ResolvableParameter.__allocating_init(typeIdentifier:required:loggingKeyTransformer:)();
  long long v40 = v22;
  uint64_t v41 = v2;
  __swift_allocate_boxed_opaque_existential_0Tm(v39);
  SuggestionDetailsBuilder.parameter(parameterName:resolver:resolveParam:)();
  swift_release();
  outlined destroy of Any?((uint64_t)v36, &demangling cache variable for type metadata for Resolver?);
  uint64_t v9 = v41;
  long long v23 = v40;
  __swift_project_boxed_opaque_existential_1Tm(v39, v40);
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = 0xD000000000000010;
  v10[3] = 0x8000000000011E30;
  v10[4] = &async function pointer to closure #2 in closure #4 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:);
  v10[5] = 0;
  *(void *)&long long v34 = v5;
  *((void *)&v34 + 1) = v8;
  v33[0] = (uint64_t)v10;
  ResolvableParameter.__allocating_init(typeIdentifier:required:)();
  long long v37 = v23;
  uint64_t v38 = v9;
  __swift_allocate_boxed_opaque_existential_0Tm(v36);
  SuggestionDetailsBuilder.parameter(parameterName:resolver:resolveParam:)();
  swift_release();
  outlined destroy of Any?((uint64_t)v33, &demangling cache variable for type metadata for Resolver?);
  uint64_t v11 = v38;
  long long v24 = v37;
  __swift_project_boxed_opaque_existential_1Tm(v36, v37);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<VersionedInvocation>);
  type metadata accessor for VersionedInvocation();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_11570;
  static VersionedInvocations.HintsDawnC.getter();
  long long v34 = v24;
  uint64_t v35 = v11;
  __swift_allocate_boxed_opaque_existential_0Tm(v33);
  dispatch thunk of SuggestionDetailsBuilder.validForInvocationTypes(_:)();
  swift_bridgeObjectRelease();
  uint64_t v12 = v35;
  long long v25 = v34;
  __swift_project_boxed_opaque_existential_1Tm(v33, v34);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<DeliveryVehicle>);
  uint64_t v13 = type metadata accessor for DeliveryVehicle();
  uint64_t v14 = *(void *)(v13 - 8);
  unint64_t v15 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_11570;
  unint64_t v17 = v16 + v15;
  uint64_t v18 = enum case for SiriHintsMode.display(_:);
  uint64_t v19 = type metadata accessor for SiriHintsMode();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 104))(v17, v18, v19);
  (*(void (**)(unint64_t, void, uint64_t))(v14 + 104))(v17, enum case for DeliveryVehicle.siriHints(_:), v13);
  long long v31 = v25;
  uint64_t v32 = v12;
  __swift_allocate_boxed_opaque_existential_0Tm(v30);
  dispatch thunk of SuggestionDetailsBuilder.enabledDeliveryVehicles(_:)();
  swift_bridgeObjectRelease();
  uint64_t v20 = v32;
  long long v26 = v31;
  __swift_project_boxed_opaque_existential_1Tm(v30, v31);
  if (one-time initialization token for t41Locales != -1) {
    swift_once();
  }
  long long v28 = v26;
  uint64_t v29 = v20;
  __swift_allocate_boxed_opaque_existential_0Tm(v27);
  dispatch thunk of SuggestionDetailsBuilder.enabledLocales(_:)();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v27);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v30);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v33);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v36);
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v39);
}

uint64_t InfoServerSuggestionDefinitionFactory.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t one-time initialization function for utteranceToLoggingIdTransformer()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transformer<Any, Any?>);
  __swift_allocate_value_buffer(v0, static InfoServerSuggestionDefinitionFactory.utteranceToLoggingIdTransformer);
  __swift_project_value_buffer(v0, (uint64_t)static InfoServerSuggestionDefinitionFactory.utteranceToLoggingIdTransformer);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  return Transformer.init(transform:)();
}

void closure #1 in variable initialization expression of static InfoServerSuggestionDefinitionFactory.utteranceToLoggingIdTransformer(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_ServerSuggestionUtterance?);
  __chkstk_darwin();
  uint64_t v6 = (char *)v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestionUtterance();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  uint64_t v10 = (char *)v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of Any(a1, (uint64_t)v25);
  char v11 = swift_dynamicCast();
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56);
  if (v11)
  {
    v12(v6, 0, 1, v7);
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
    v25[0] = Apple_Parsec_Siri_V2alpha_ServerSuggestionUtterance.print.getter();
    v25[1] = v13;
    v24[0] = 32;
    v24[1] = 0xE100000000000000;
    v23[0] = 95;
    v23[1] = 0xE100000000000000;
    lazy protocol witness table accessor for type String and conformance String();
    uint64_t v14 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
    uint64_t v16 = v15;
    swift_bridgeObjectRelease();
    *(void *)(a2 + 24) = &type metadata for String;
    *(void *)a2 = v14;
    *(void *)(a2 + 8) = v16;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  else
  {
    v12(v6, 1, 1, v7);
    outlined destroy of Any?((uint64_t)v6, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_ServerSuggestionUtterance?);
    if (one-time initialization token for suggestions != -1) {
      swift_once();
    }
    uint64_t v17 = type metadata accessor for Logger();
    __swift_project_value_buffer(v17, (uint64_t)static Logger.suggestions);
    outlined init with copy of Any(a1, (uint64_t)v25);
    uint64_t v18 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      v23[0] = swift_slowAlloc();
      v25[5] = v2;
      *(_DWORD *)uint64_t v20 = 136315138;
      outlined init with copy of Any((uint64_t)v25, (uint64_t)v24);
      uint64_t v21 = String.init<A>(describing:)();
      v24[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v21, v22, v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v25);
      _os_log_impl(&dword_0, v18, v19, "Suggestion parameter must be resolved into instance of ServerSuggestionUtterance. It is: %s", v20, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v25);
    }

    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
}

uint64_t static InfoServerSuggestionDefinitionFactory.utteranceToLoggingIdTransformer.getter@<X0>(uint64_t a1@<X8>)
{
  if (one-time initialization token for utteranceToLoggingIdTransformer != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transformer<Any, Any?>);
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)static InfoServerSuggestionDefinitionFactory.utteranceToLoggingIdTransformer);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t InfoServerSuggestionDefinitionFactory.deinit()
{
  return v0;
}

uint64_t protocol witness for static OwnerDefinitionFactory.createOwnerDefinitions() in conformance InfoServerSuggestionDefinitionFactory()
{
  return static OwnerDefinitionFactory.createOwnerDefinitions()();
}

uint64_t protocol witness for static OwnerDefinitionFactory.createOwnerDefinitions(builderFactory:) in conformance InfoServerSuggestionDefinitionFactory(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = protocol witness for static OwnerDefinitionFactory.createOwnerDefinitions(builderFactory:) in conformance InfoServerSuggestionDefinitionFactory;
  return static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:)(a1, a2);
}

uint64_t InfoServerGenerator.generateCandidateSuggestions(interaction:environment:factory:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[75] = v3;
  v4[74] = a3;
  v4[73] = a1;
  uint64_t SuggestionCandidate = type metadata accessor for Apple_Parsec_Siri_V2alpha_AlternateQuerySuggestionCandidate();
  v4[76] = SuggestionCandidate;
  v4[77] = *(void *)(SuggestionCandidate - 8);
  v4[78] = swift_task_alloc();
  uint64_t Suggestion = type metadata accessor for Apple_Parsec_Siri_V2alpha_AlternateQuerySuggestion();
  v4[79] = Suggestion;
  v4[80] = *(void *)(Suggestion - 8);
  v4[81] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestionCandidate();
  v4[82] = v7;
  v4[83] = *(void *)(v7 - 8);
  v4[84] = swift_task_alloc();
  v4[85] = swift_task_alloc();
  type metadata accessor for BinaryDecodingOptions();
  v4[86] = swift_task_alloc();
  v4[87] = swift_task_alloc();
  v4[88] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestion();
  v4[89] = v8;
  v4[90] = *(void *)(v8 - 8);
  v4[91] = swift_task_alloc();
  v4[92] = swift_task_alloc();
  return _swift_task_switch(InfoServerGenerator.generateCandidateSuggestions(interaction:environment:factory:), 0, 0);
}

uint64_t InfoServerGenerator.generateCandidateSuggestions(interaction:environment:factory:)()
{
  uint64_t v80 = v0;
  if (one-time initialization token for suggestions != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  *(void *)(v0 + 744) = __swift_project_value_buffer(v1, (uint64_t)static Logger.suggestions);
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "Info suggestions running generators", v4, 2u);
    swift_slowDealloc();
  }
  uint64_t v5 = *(void **)(v0 + 584);

  __swift_project_boxed_opaque_existential_1Tm(v5, v5[3]);
  uint64_t v6 = dispatch thunk of Interaction.executionParameters.getter();
  if (*(void *)(v6 + 16)
    && (unint64_t v7 = specialized __RawDictionaryStorage.find<A>(_:)(0xD000000000000017, 0x8000000000011D50), (v8 & 1) != 0))
  {
    outlined init with copy of Decodable & Encodable & Sendable(*(void *)(v6 + 56) + 48 * v7, v0 + 16);
    swift_bridgeObjectRelease();
    if (*(void *)(v0 + 40))
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Decodable & Encodable & Sendable);
      int v9 = swift_dynamicCast();
      if (v9) {
        uint64_t v10 = *(void *)(v0 + 520);
      }
      else {
        uint64_t v10 = 0;
      }
      if (v9) {
        unint64_t v11 = *(void *)(v0 + 528);
      }
      else {
        unint64_t v11 = 0xF000000000000000;
      }
      goto LABEL_16;
    }
  }
  else
  {
    *(_OWORD *)(v0 + 32) = 0u;
    *(_OWORD *)(v0 + 48) = 0u;
    *(_OWORD *)(v0 + 16) = 0u;
    swift_bridgeObjectRelease();
  }
  outlined destroy of Any?(v0 + 16, &demangling cache variable for type metadata for (Decodable & Encodable & Sendable)?);
  uint64_t v10 = 0;
  unint64_t v11 = 0xF000000000000000;
LABEL_16:
  *(void *)(v0 + 760) = v11;
  *(void *)(v0 + 752) = v10;
  uint64_t v12 = dispatch thunk of Interaction.executionParameters.getter();
  if (*(void *)(v12 + 16)
    && (unint64_t v13 = specialized __RawDictionaryStorage.find<A>(_:)(0xD000000000000015, 0x8000000000011D70), (v14 & 1) != 0))
  {
    outlined init with copy of Decodable & Encodable & Sendable(*(void *)(v12 + 56) + 48 * v13, v0 + 64);
  }
  else
  {
    *(_OWORD *)(v0 + 80) = 0u;
    *(_OWORD *)(v0 + 96) = 0u;
    *(_OWORD *)(v0 + 64) = 0u;
  }
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 88))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Decodable & Encodable & Sendable);
    int v15 = swift_dynamicCast();
    uint64_t v16 = *(void *)(v0 + 552);
    if (v15)
    {
      unint64_t v17 = *(void *)(v0 + 560);
    }
    else
    {
      uint64_t v16 = 0;
      unint64_t v17 = 0xF000000000000000;
    }
  }
  else
  {
    outlined destroy of Any?(v0 + 64, &demangling cache variable for type metadata for (Decodable & Encodable & Sendable)?);
    uint64_t v16 = 0;
    unint64_t v17 = 0xF000000000000000;
  }
  *(void *)(v0 + 776) = v17;
  *(void *)(v0 + 768) = v16;
  uint64_t v18 = dispatch thunk of Interaction.executionParameters.getter();
  if (*(void *)(v18 + 16)
    && (unint64_t v19 = specialized __RawDictionaryStorage.find<A>(_:)(0xD000000000000017, 0x8000000000011DB0), (v20 & 1) != 0))
  {
    outlined init with copy of Decodable & Encodable & Sendable(*(void *)(v18 + 56) + 48 * v19, v0 + 112);
  }
  else
  {
    *(_OWORD *)(v0 + 128) = 0u;
    *(_OWORD *)(v0 + 144) = 0u;
    *(_OWORD *)(v0 + 112) = 0u;
  }
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 136))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Decodable & Encodable & Sendable);
    int v21 = swift_dynamicCast();
    if (v21) {
      uint64_t v22 = *(void *)(v0 + 536);
    }
    else {
      uint64_t v22 = 0;
    }
    if (v21) {
      unint64_t v23 = *(void *)(v0 + 544);
    }
    else {
      unint64_t v23 = 0xF000000000000000;
    }
  }
  else
  {
    outlined destroy of Any?(v0 + 112, &demangling cache variable for type metadata for (Decodable & Encodable & Sendable)?);
    uint64_t v22 = 0;
    unint64_t v23 = 0xF000000000000000;
  }
  *(void *)(v0 + 792) = v23;
  *(void *)(v0 + 784) = v22;
  if (v11 >> 60 == 15)
  {
    if (v17 >> 60 == 15)
    {
      if (v23 >> 60 == 15) {
        goto LABEL_64;
      }
      uint64_t v24 = 0;
LABEL_58:
      uint64_t v79 = 0;
      long long v77 = 0u;
      long long v78 = 0u;
      outlined copy of Data._Representation(v22, v23);
      outlined copy of Data._Representation(v22, v23);
      BinaryDecodingOptions.init()();
      lazy protocol witness table accessor for type DomainOwner and conformance DomainOwner(&lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_ServerSuggestion and conformance Apple_Parsec_Siri_V2alpha_ServerSuggestion, 255, (void (*)(uint64_t))&type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestion);
      Message.init(serializedData:extensions:partial:options:)();
      if (v24)
      {
        unint64_t v36 = *(void *)(v0 + 792);
        uint64_t v37 = *(void *)(v0 + 784);
        goto LABEL_60;
      }
      uint64_t v60 = Apple_Parsec_Siri_V2alpha_ServerSuggestion.candidates.getter();
      *(void *)(v0 + 928) = v60;
      uint64_t v61 = *(void *)(v60 + 16);
      *(void *)(v0 + 936) = v61;
      if (v61)
      {
        uint64_t v62 = *(void *)(v0 + 664);
        v63 = *(void (**)(void, unint64_t, void))(v62 + 16);
        v62 += 16;
        int v64 = *(_DWORD *)(v62 + 64);
        *(_DWORD *)(v0 + 992) = v64;
        *(void *)(v0 + 944) = *(void *)(v62 + 56);
        *(void *)(v0 + 952) = v63;
        *(void *)(v0 + 968) = &_swiftEmptyArrayStorage;
        *(void *)(v0 + 960) = 0;
        v63(*(void *)(v0 + 672), v60 + ((v64 + 32) & ~(unint64_t)v64), *(void *)(v0 + 656));
        v65 = (void *)swift_task_alloc();
        *(void *)(v0 + 976) = v65;
        void *v65 = v0;
        v65[1] = InfoServerGenerator.generateCandidateSuggestions(interaction:environment:factory:);
        uint64_t v66 = *(void *)(v0 + 672);
        uint64_t v67 = *(void *)(v0 + 592);
        return InfoServerGenerator.createRelatedQuestionsSuggestion(candidate:factory:)(v0 + 160, v66, v67);
      }
      unint64_t v68 = *(void *)(v0 + 792);
      uint64_t v69 = *(void *)(v0 + 784);
      unint64_t v70 = *(void *)(v0 + 776);
      uint64_t v71 = *(void *)(v0 + 768);
      unint64_t v72 = *(void *)(v0 + 760);
      uint64_t v73 = *(void *)(v0 + 752);
      uint64_t v76 = *(void *)(v0 + 728);
      uint64_t v74 = *(void *)(v0 + 720);
      uint64_t v75 = *(void *)(v0 + 712);
      outlined consume of Data?(v69, v68);
      outlined consume of Data?(v69, v68);
      outlined consume of Data?(v71, v70);
      outlined consume of Data?(v73, v72);
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v74 + 8))(v76, v75);
LABEL_64:
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      v59 = *(uint64_t (**)(void *))(v0 + 8);
      return v59(&_swiftEmptyArrayStorage);
    }
    uint64_t v24 = 0;
    goto LABEL_46;
  }
  uint64_t v79 = 0;
  long long v77 = 0u;
  long long v78 = 0u;
  outlined copy of Data._Representation(v10, v11);
  BinaryDecodingOptions.init()();
  lazy protocol witness table accessor for type DomainOwner and conformance DomainOwner(&lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_ServerSuggestion and conformance Apple_Parsec_Siri_V2alpha_ServerSuggestion, 255, (void (*)(uint64_t))&type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestion);
  Message.init(serializedData:extensions:partial:options:)();
  *(void *)(v0 + 800) = 0;
  uint64_t v25 = Apple_Parsec_Siri_V2alpha_ServerSuggestion.candidates.getter();
  *(void *)(v0 + 808) = v25;
  uint64_t v26 = *(void *)(v25 + 16);
  *(void *)(v0 + 816) = v26;
  if (!v26)
  {
    v46 = (uint64_t *)(v0 + 800);
    swift_bridgeObjectRelease();
    unint64_t v47 = *(void *)(v0 + 776);
    (*(void (**)(void, void))(*(void *)(v0 + 720) + 8))(*(void *)(v0 + 736), *(void *)(v0 + 712));
    if (v47 >> 60 == 15) {
      goto LABEL_55;
    }
    uint64_t v24 = *v46;
LABEL_46:
    unint64_t v34 = *(void *)(v0 + 776);
    uint64_t v35 = *(void *)(v0 + 768);
    uint64_t v79 = 0;
    long long v77 = 0u;
    long long v78 = 0u;
    outlined copy of Data._Representation(v35, v34);
    outlined copy of Data._Representation(v35, v34);
    BinaryDecodingOptions.init()();
    lazy protocol witness table accessor for type DomainOwner and conformance DomainOwner(&lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_AlternateQuerySuggestion and conformance Apple_Parsec_Siri_V2alpha_AlternateQuerySuggestion, 255, (void (*)(uint64_t))&type metadata accessor for Apple_Parsec_Siri_V2alpha_AlternateQuerySuggestion);
    Message.init(serializedData:extensions:partial:options:)();
    *(void *)(v0 + 864) = v24;
    if (v24)
    {
      unint64_t v36 = *(void *)(v0 + 776);
      uint64_t v37 = *(void *)(v0 + 768);
LABEL_60:
      swift_bridgeObjectRelease();
      outlined consume of Data?(v37, v36);
      swift_errorRetain();
      swift_errorRetain();
      v50 = Logger.logObject.getter();
      os_log_type_t v51 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v50, v51))
      {
        v52 = (uint8_t *)swift_slowAlloc();
        *(void *)&long long v77 = swift_slowAlloc();
        *(_DWORD *)v52 = 136315138;
        *(void *)(v0 + 568) = v24;
        swift_errorRetain();
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
        uint64_t v53 = String.init<A>(describing:)();
        *(void *)(v0 + 576) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v53, v54, (uint64_t *)&v77);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl(&dword_0, v50, v51, "Unable to get candidate from factory: %s", v52, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_errorRelease();
        swift_errorRelease();
      }

      unint64_t v55 = *(void *)(v0 + 792);
      uint64_t v56 = *(void *)(v0 + 784);
      unint64_t v57 = *(void *)(v0 + 760);
      uint64_t v58 = *(void *)(v0 + 752);
      outlined consume of Data?(*(void *)(v0 + 768), *(void *)(v0 + 776));
      outlined consume of Data?(v56, v55);
      outlined consume of Data?(v58, v57);
      swift_errorRelease();
      goto LABEL_64;
    }
    uint64_t v38 = Apple_Parsec_Siri_V2alpha_AlternateQuerySuggestion.candidates.getter();
    *(void *)(v0 + 872) = v38;
    uint64_t v39 = *(void *)(v38 + 16);
    *(void *)(v0 + 880) = v39;
    if (v39)
    {
      uint64_t v40 = *(void *)(v0 + 616);
      uint64_t v41 = *(void (**)(void, unint64_t, void))(v40 + 16);
      v40 += 16;
      int v42 = *(_DWORD *)(v40 + 64);
      *(_DWORD *)(v0 + 988) = v42;
      *(void *)(v0 + 888) = *(void *)(v40 + 56);
      *(void *)(v0 + 896) = v41;
      *(void *)(v0 + 912) = &_swiftEmptyArrayStorage;
      *(void *)(v0 + 904) = 0;
      v41(*(void *)(v0 + 624), v38 + ((v42 + 32) & ~(unint64_t)v42), *(void *)(v0 + 608));
      v43 = (void *)swift_task_alloc();
      *(void *)(v0 + 920) = v43;
      void *v43 = v0;
      v43[1] = InfoServerGenerator.generateCandidateSuggestions(interaction:environment:factory:);
      uint64_t v44 = *(void *)(v0 + 624);
      uint64_t v45 = *(void *)(v0 + 592);
      return InfoServerGenerator.createAlternateQuerySuggestionForCandidate(candidate:factory:)(v0 + 280, v44, v45);
    }
    v46 = (uint64_t *)(v0 + 864);
    outlined consume of Data?(*(void *)(v0 + 768), *(void *)(v0 + 776));
    swift_bridgeObjectRelease();
    (*(void (**)(void, void))(*(void *)(v0 + 640) + 8))(*(void *)(v0 + 648), *(void *)(v0 + 632));
LABEL_55:
    unint64_t v23 = *(void *)(v0 + 792);
    if (v23 >> 60 == 15)
    {
      unint64_t v48 = *(void *)(v0 + 760);
      uint64_t v49 = *(void *)(v0 + 752);
      outlined consume of Data?(*(void *)(v0 + 768), *(void *)(v0 + 776));
      outlined consume of Data?(v49, v48);
      goto LABEL_64;
    }
    uint64_t v24 = *v46;
    uint64_t v22 = *(void *)(v0 + 784);
    goto LABEL_58;
  }
  uint64_t v27 = *(void *)(v0 + 664);
  long long v28 = *(void (**)(void, unint64_t, void))(v27 + 16);
  v27 += 16;
  int v29 = *(_DWORD *)(v27 + 64);
  *(_DWORD *)(v0 + 984) = v29;
  *(void *)(v0 + 824) = *(void *)(v27 + 56);
  *(void *)(v0 + 832) = v28;
  *(void *)(v0 + 848) = &_swiftEmptyArrayStorage;
  *(void *)(v0 + 840) = 0;
  v28(*(void *)(v0 + 680), v25 + ((v29 + 32) & ~(unint64_t)v29), *(void *)(v0 + 656));
  v30 = (void *)swift_task_alloc();
  *(void *)(v0 + 856) = v30;
  void *v30 = v0;
  v30[1] = InfoServerGenerator.generateCandidateSuggestions(interaction:environment:factory:);
  uint64_t v31 = *(void *)(v0 + 680);
  uint64_t v32 = *(void *)(v0 + 592);
  return InfoServerGenerator.createSuggestionForCandidate(candidate:factory:)(v0 + 440, v31, v32);
}

{
  uint64_t v1;

  swift_task_dealloc();
  return _swift_task_switch(InfoServerGenerator.generateCandidateSuggestions(interaction:environment:factory:), 0, 0);
}

{
  uint64_t v0;
  char isUniquelyReferenced_nonNull_native;
  char *v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(char *);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(void, unint64_t, void);
  int v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(void, unint64_t, void);
  int v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  long long v59;
  long long v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;

  uint64_t v62 = v0;
  if (*(void *)(v0 + 464))
  {
    outlined init with take of CandidateSuggestion((long long *)(v0 + 440), v0 + 480);
    outlined init with copy of CandidateSuggestion(v0 + 480, v0 + 360);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v2 = *(char **)(v0 + 848);
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      uint64_t v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v2 + 2) + 1, 1, *(char **)(v0 + 848), &demangling cache variable for type metadata for _ContiguousArrayStorage<CandidateSuggestion>, &demangling cache variable for type metadata for CandidateSuggestion);
    }
    uint64_t v4 = *((void *)v2 + 2);
    os_log_type_t v3 = *((void *)v2 + 3);
    if (v4 >= v3 >> 1) {
      uint64_t v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v3 > 1), v4 + 1, 1, v2, &demangling cache variable for type metadata for _ContiguousArrayStorage<CandidateSuggestion>, &demangling cache variable for type metadata for CandidateSuggestion);
    }
    uint64_t v5 = *(void *)(v0 + 680);
    uint64_t v6 = *(void *)(v0 + 664);
    unint64_t v7 = *(void *)(v0 + 656);
    *((void *)v2 + 2) = v4 + 1;
    outlined init with take of CandidateSuggestion((long long *)(v0 + 360), (uint64_t)&v2[40 * v4 + 32]);
    __swift_destroy_boxed_opaque_existential_1Tm(v0 + 480);
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  }
  else
  {
    (*(void (**)(void, void))(*(void *)(v0 + 664) + 8))(*(void *)(v0 + 680), *(void *)(v0 + 656));
    outlined destroy of Any?(v0 + 440, &demangling cache variable for type metadata for CandidateSuggestion?);
    uint64_t v2 = *(char **)(v0 + 848);
  }
  char v8 = *(void *)(v0 + 840) + 1;
  if (v8 == *(void *)(v0 + 816))
  {
    swift_bridgeObjectRelease();
    int v9 = *(void *)(v0 + 776);
    (*(void (**)(void, void))(*(void *)(v0 + 720) + 8))(*(void *)(v0 + 736), *(void *)(v0 + 712));
    if (v9 >> 60 == 15)
    {
      uint64_t v10 = (uint64_t *)(v0 + 800);
    }
    else
    {
      uint64_t v18 = *(void *)(v0 + 800);
      unint64_t v19 = *(void *)(v0 + 776);
      char v20 = *(void *)(v0 + 768);
      uint64_t v61 = 0;
      v59 = 0u;
      uint64_t v60 = 0u;
      outlined copy of Data._Representation(v20, v19);
      outlined copy of Data._Representation(v20, v19);
      BinaryDecodingOptions.init()();
      lazy protocol witness table accessor for type DomainOwner and conformance DomainOwner(&lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_AlternateQuerySuggestion and conformance Apple_Parsec_Siri_V2alpha_AlternateQuerySuggestion, 255, (void (*)(uint64_t))&type metadata accessor for Apple_Parsec_Siri_V2alpha_AlternateQuerySuggestion);
      Message.init(serializedData:extensions:partial:options:)();
      *(void *)(v0 + 864) = v18;
      if (v18)
      {
        int v21 = *(void *)(v0 + 776);
        uint64_t v22 = *(void *)(v0 + 768);
LABEL_20:
        swift_bridgeObjectRelease();
        outlined consume of Data?(v22, v21);
        swift_errorRetain();
        swift_errorRetain();
        uint64_t v24 = Logger.logObject.getter();
        uint64_t v25 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v24, v25))
        {
          uint64_t v26 = (uint8_t *)swift_slowAlloc();
          *(void *)&v59 = swift_slowAlloc();
          *(_DWORD *)uint64_t v26 = 136315138;
          *(void *)(v0 + 568) = v18;
          swift_errorRetain();
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
          uint64_t v27 = String.init<A>(describing:)();
          *(void *)(v0 + 576) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v27, v28, (uint64_t *)&v59);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          swift_errorRelease();
          swift_errorRelease();
          _os_log_impl(&dword_0, v24, v25, "Unable to get candidate from factory: %s", v26, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
          swift_errorRelease();
          swift_errorRelease();
        }

        int v29 = *(void *)(v0 + 792);
        v30 = *(void *)(v0 + 784);
        uint64_t v31 = *(void *)(v0 + 760);
        uint64_t v32 = *(void *)(v0 + 752);
        outlined consume of Data?(*(void *)(v0 + 768), *(void *)(v0 + 776));
        outlined consume of Data?(v30, v29);
        outlined consume of Data?(v32, v31);
        swift_errorRelease();
        uint64_t v2 = (char *)&_swiftEmptyArrayStorage;
        goto LABEL_24;
      }
      unint64_t v34 = Apple_Parsec_Siri_V2alpha_AlternateQuerySuggestion.candidates.getter();
      *(void *)(v0 + 872) = v34;
      uint64_t v35 = *(void *)(v34 + 16);
      *(void *)(v0 + 880) = v35;
      if (v35)
      {
        unint64_t v36 = *(void *)(v0 + 616);
        uint64_t v37 = *(void (**)(void, unint64_t, void))(v36 + 16);
        v36 += 16;
        uint64_t v38 = *(_DWORD *)(v36 + 64);
        *(_DWORD *)(v0 + 988) = v38;
        *(void *)(v0 + 888) = *(void *)(v36 + 56);
        *(void *)(v0 + 896) = v37;
        *(void *)(v0 + 912) = v2;
        *(void *)(v0 + 904) = 0;
        v37(*(void *)(v0 + 624), v34 + ((v38 + 32) & ~(unint64_t)v38), *(void *)(v0 + 608));
        uint64_t v39 = (void *)swift_task_alloc();
        *(void *)(v0 + 920) = v39;
        *uint64_t v39 = v0;
        v39[1] = InfoServerGenerator.generateCandidateSuggestions(interaction:environment:factory:);
        uint64_t v40 = *(void *)(v0 + 624);
        uint64_t v41 = *(void *)(v0 + 592);
        return InfoServerGenerator.createAlternateQuerySuggestionForCandidate(candidate:factory:)(v0 + 280, v40, v41);
      }
      uint64_t v10 = (uint64_t *)(v0 + 864);
      outlined consume of Data?(*(void *)(v0 + 768), *(void *)(v0 + 776));
      swift_bridgeObjectRelease();
      (*(void (**)(void, void))(*(void *)(v0 + 640) + 8))(*(void *)(v0 + 648), *(void *)(v0 + 632));
    }
    unint64_t v11 = *(void *)(v0 + 792);
    if (v11 >> 60 == 15)
    {
      uint64_t v12 = *(void *)(v0 + 760);
      unint64_t v13 = *(void *)(v0 + 752);
      outlined consume of Data?(*(void *)(v0 + 768), *(void *)(v0 + 776));
      outlined consume of Data?(v13, v12);
LABEL_24:
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      v33 = *(uint64_t (**)(char *))(v0 + 8);
      return v33(v2);
    }
    uint64_t v18 = *v10;
    unint64_t v23 = *(void *)(v0 + 784);
    uint64_t v61 = 0;
    v59 = 0u;
    uint64_t v60 = 0u;
    outlined copy of Data._Representation(v23, v11);
    outlined copy of Data._Representation(v23, v11);
    BinaryDecodingOptions.init()();
    lazy protocol witness table accessor for type DomainOwner and conformance DomainOwner(&lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_ServerSuggestion and conformance Apple_Parsec_Siri_V2alpha_ServerSuggestion, 255, (void (*)(uint64_t))&type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestion);
    Message.init(serializedData:extensions:partial:options:)();
    if (v18)
    {
      int v21 = *(void *)(v0 + 792);
      uint64_t v22 = *(void *)(v0 + 784);
      goto LABEL_20;
    }
    int v42 = Apple_Parsec_Siri_V2alpha_ServerSuggestion.candidates.getter();
    *(void *)(v0 + 928) = v42;
    v43 = *(void *)(v42 + 16);
    *(void *)(v0 + 936) = v43;
    if (!v43)
    {
      v50 = *(void *)(v0 + 792);
      os_log_type_t v51 = *(void *)(v0 + 784);
      v52 = *(void *)(v0 + 776);
      uint64_t v53 = *(void *)(v0 + 768);
      unint64_t v54 = *(void *)(v0 + 760);
      unint64_t v55 = *(void *)(v0 + 752);
      uint64_t v56 = *(void *)(v0 + 720);
      unint64_t v57 = *(void *)(v0 + 712);
      uint64_t v58 = *(void *)(v0 + 728);
      outlined consume of Data?(v51, v50);
      outlined consume of Data?(v51, v50);
      outlined consume of Data?(v53, v52);
      outlined consume of Data?(v55, v54);
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v58, v57);
      goto LABEL_24;
    }
    uint64_t v44 = *(void *)(v0 + 664);
    uint64_t v45 = *(void (**)(void, unint64_t, void))(v44 + 16);
    v44 += 16;
    v46 = *(_DWORD *)(v44 + 64);
    *(_DWORD *)(v0 + 992) = v46;
    *(void *)(v0 + 944) = *(void *)(v44 + 56);
    *(void *)(v0 + 952) = v45;
    *(void *)(v0 + 968) = v2;
    *(void *)(v0 + 960) = 0;
    v45(*(void *)(v0 + 672), v42 + ((v46 + 32) & ~(unint64_t)v46), *(void *)(v0 + 656));
    unint64_t v47 = (void *)swift_task_alloc();
    *(void *)(v0 + 976) = v47;
    *unint64_t v47 = v0;
    v47[1] = InfoServerGenerator.generateCandidateSuggestions(interaction:environment:factory:);
    unint64_t v48 = *(void *)(v0 + 672);
    uint64_t v49 = *(void *)(v0 + 592);
    return InfoServerGenerator.createRelatedQuestionsSuggestion(candidate:factory:)(v0 + 160, v48, v49);
  }
  else
  {
    *(void *)(v0 + 848) = v2;
    *(void *)(v0 + 840) = v8;
    (*(void (**)(void, unint64_t, void))(v0 + 832))(*(void *)(v0 + 680), *(void *)(v0 + 808)+ ((*(unsigned __int8 *)(v0 + 984) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 984))+ *(void *)(v0 + 824) * v8, *(void *)(v0 + 656));
    char v14 = (void *)swift_task_alloc();
    *(void *)(v0 + 856) = v14;
    *char v14 = v0;
    v14[1] = InfoServerGenerator.generateCandidateSuggestions(interaction:environment:factory:);
    int v15 = *(void *)(v0 + 680);
    uint64_t v16 = *(void *)(v0 + 592);
    return InfoServerGenerator.createSuggestionForCandidate(candidate:factory:)(v0 + 440, v15, v16);
  }
}

{
  uint64_t v1;

  swift_task_dealloc();
  return _swift_task_switch(InfoServerGenerator.generateCandidateSuggestions(interaction:environment:factory:), 0, 0);
}

{
  uint64_t v0;
  char isUniquelyReferenced_nonNull_native;
  char *v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(void, unint64_t, void);
  int v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(char *);
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _OWORD v47[2];
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  uint64_t v49 = v0;
  if (*(void *)(v0 + 304))
  {
    outlined init with take of CandidateSuggestion((long long *)(v0 + 280), v0 + 240);
    outlined init with copy of CandidateSuggestion(v0 + 240, v0 + 200);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v2 = *(char **)(v0 + 912);
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      uint64_t v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v2 + 2) + 1, 1, *(char **)(v0 + 912), &demangling cache variable for type metadata for _ContiguousArrayStorage<CandidateSuggestion>, &demangling cache variable for type metadata for CandidateSuggestion);
    }
    uint64_t v4 = *((void *)v2 + 2);
    os_log_type_t v3 = *((void *)v2 + 3);
    if (v4 >= v3 >> 1) {
      uint64_t v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v3 > 1), v4 + 1, 1, v2, &demangling cache variable for type metadata for _ContiguousArrayStorage<CandidateSuggestion>, &demangling cache variable for type metadata for CandidateSuggestion);
    }
    uint64_t v5 = *(void *)(v0 + 624);
    uint64_t v6 = *(void *)(v0 + 616);
    unint64_t v7 = *(void *)(v0 + 608);
    *((void *)v2 + 2) = v4 + 1;
    outlined init with take of CandidateSuggestion((long long *)(v0 + 200), (uint64_t)&v2[40 * v4 + 32]);
    __swift_destroy_boxed_opaque_existential_1Tm(v0 + 240);
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  }
  else
  {
    (*(void (**)(void, void))(*(void *)(v0 + 616) + 8))(*(void *)(v0 + 624), *(void *)(v0 + 608));
    outlined destroy of Any?(v0 + 280, &demangling cache variable for type metadata for CandidateSuggestion?);
    uint64_t v2 = *(char **)(v0 + 912);
  }
  char v8 = *(void *)(v0 + 904) + 1;
  if (v8 == *(void *)(v0 + 880))
  {
    outlined consume of Data?(*(void *)(v0 + 768), *(void *)(v0 + 776));
    swift_bridgeObjectRelease();
    (*(void (**)(void, void))(*(void *)(v0 + 640) + 8))(*(void *)(v0 + 648), *(void *)(v0 + 632));
    int v9 = *(void *)(v0 + 792);
    if (v9 >> 60 == 15)
    {
      uint64_t v10 = *(void *)(v0 + 760);
      unint64_t v11 = *(void *)(v0 + 752);
      outlined consume of Data?(*(void *)(v0 + 768), *(void *)(v0 + 776));
      outlined consume of Data?(v11, v10);
LABEL_23:
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v37 = *(uint64_t (**)(char *))(v0 + 8);
      return v37(v2);
    }
    uint64_t v16 = *(void *)(v0 + 864);
    unint64_t v17 = *(void *)(v0 + 784);
    unint64_t v48 = 0;
    memset(v47, 0, sizeof(v47));
    outlined copy of Data._Representation(v17, v9);
    outlined copy of Data._Representation(v17, v9);
    BinaryDecodingOptions.init()();
    lazy protocol witness table accessor for type DomainOwner and conformance DomainOwner(&lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_ServerSuggestion and conformance Apple_Parsec_Siri_V2alpha_ServerSuggestion, 255, (void (*)(uint64_t))&type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestion);
    Message.init(serializedData:extensions:partial:options:)();
    if (v16)
    {
      uint64_t v18 = *(void *)(v0 + 792);
      unint64_t v19 = *(void *)(v0 + 784);
      swift_bridgeObjectRelease();
      outlined consume of Data?(v19, v18);
      swift_errorRetain();
      swift_errorRetain();
      char v20 = Logger.logObject.getter();
      int v21 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v20, v21))
      {
        uint64_t v22 = (uint8_t *)swift_slowAlloc();
        *(void *)&v47[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v22 = 136315138;
        *(void *)(v0 + 568) = v16;
        swift_errorRetain();
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
        unint64_t v23 = String.init<A>(describing:)();
        *(void *)(v0 + 576) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v23, v24, (uint64_t *)v47);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl(&dword_0, v20, v21, "Unable to get candidate from factory: %s", v22, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_errorRelease();
        swift_errorRelease();
      }

      v33 = *(void *)(v0 + 792);
      unint64_t v34 = *(void *)(v0 + 784);
      uint64_t v35 = *(void *)(v0 + 760);
      unint64_t v36 = *(void *)(v0 + 752);
      outlined consume of Data?(*(void *)(v0 + 768), *(void *)(v0 + 776));
      outlined consume of Data?(v34, v33);
      outlined consume of Data?(v36, v35);
      swift_errorRelease();
      uint64_t v2 = (char *)&_swiftEmptyArrayStorage;
      goto LABEL_23;
    }
    uint64_t v25 = Apple_Parsec_Siri_V2alpha_ServerSuggestion.candidates.getter();
    *(void *)(v0 + 928) = v25;
    uint64_t v26 = *(void *)(v25 + 16);
    *(void *)(v0 + 936) = v26;
    if (!v26)
    {
      uint64_t v38 = *(void *)(v0 + 792);
      uint64_t v39 = *(void *)(v0 + 784);
      uint64_t v40 = *(void *)(v0 + 776);
      uint64_t v41 = *(void *)(v0 + 768);
      int v42 = *(void *)(v0 + 760);
      v43 = *(void *)(v0 + 752);
      uint64_t v44 = *(void *)(v0 + 720);
      uint64_t v45 = *(void *)(v0 + 712);
      v46 = *(void *)(v0 + 728);
      outlined consume of Data?(v39, v38);
      outlined consume of Data?(v39, v38);
      outlined consume of Data?(v41, v40);
      outlined consume of Data?(v43, v42);
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v46, v45);
      goto LABEL_23;
    }
    uint64_t v27 = *(void *)(v0 + 664);
    long long v28 = *(void (**)(void, unint64_t, void))(v27 + 16);
    v27 += 16;
    int v29 = *(_DWORD *)(v27 + 64);
    *(_DWORD *)(v0 + 992) = v29;
    *(void *)(v0 + 944) = *(void *)(v27 + 56);
    *(void *)(v0 + 952) = v28;
    *(void *)(v0 + 968) = v2;
    *(void *)(v0 + 960) = 0;
    v28(*(void *)(v0 + 672), v25 + ((v29 + 32) & ~(unint64_t)v29), *(void *)(v0 + 656));
    v30 = (void *)swift_task_alloc();
    *(void *)(v0 + 976) = v30;
    void *v30 = v0;
    v30[1] = InfoServerGenerator.generateCandidateSuggestions(interaction:environment:factory:);
    uint64_t v31 = *(void *)(v0 + 672);
    uint64_t v32 = *(void *)(v0 + 592);
    return InfoServerGenerator.createRelatedQuestionsSuggestion(candidate:factory:)(v0 + 160, v31, v32);
  }
  else
  {
    *(void *)(v0 + 912) = v2;
    *(void *)(v0 + 904) = v8;
    (*(void (**)(void, unint64_t, void))(v0 + 896))(*(void *)(v0 + 624), *(void *)(v0 + 872)+ ((*(unsigned __int8 *)(v0 + 988) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 988))+ *(void *)(v0 + 888) * v8, *(void *)(v0 + 608));
    uint64_t v12 = (void *)swift_task_alloc();
    *(void *)(v0 + 920) = v12;
    *uint64_t v12 = v0;
    v12[1] = InfoServerGenerator.generateCandidateSuggestions(interaction:environment:factory:);
    unint64_t v13 = *(void *)(v0 + 624);
    char v14 = *(void *)(v0 + 592);
    return InfoServerGenerator.createAlternateQuerySuggestionForCandidate(candidate:factory:)(v0 + 280, v13, v14);
  }
}

{
  uint64_t v1;

  swift_task_dealloc();
  return _swift_task_switch(InfoServerGenerator.generateCandidateSuggestions(interaction:environment:factory:), 0, 0);
}

{
  uint64_t v0;
  char isUniquelyReferenced_nonNull_native;
  char *v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(char *);
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (*(void *)(v0 + 184))
  {
    outlined init with take of CandidateSuggestion((long long *)(v0 + 160), v0 + 320);
    outlined init with copy of CandidateSuggestion(v0 + 320, v0 + 400);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v2 = *(char **)(v0 + 968);
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      uint64_t v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v2 + 2) + 1, 1, *(char **)(v0 + 968), &demangling cache variable for type metadata for _ContiguousArrayStorage<CandidateSuggestion>, &demangling cache variable for type metadata for CandidateSuggestion);
    }
    uint64_t v4 = *((void *)v2 + 2);
    os_log_type_t v3 = *((void *)v2 + 3);
    if (v4 >= v3 >> 1) {
      uint64_t v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v3 > 1), v4 + 1, 1, v2, &demangling cache variable for type metadata for _ContiguousArrayStorage<CandidateSuggestion>, &demangling cache variable for type metadata for CandidateSuggestion);
    }
    uint64_t v5 = *(void *)(v0 + 672);
    uint64_t v6 = *(void *)(v0 + 664);
    unint64_t v7 = *(void *)(v0 + 656);
    *((void *)v2 + 2) = v4 + 1;
    outlined init with take of CandidateSuggestion((long long *)(v0 + 400), (uint64_t)&v2[40 * v4 + 32]);
    __swift_destroy_boxed_opaque_existential_1Tm(v0 + 320);
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  }
  else
  {
    (*(void (**)(void, void))(*(void *)(v0 + 664) + 8))(*(void *)(v0 + 672), *(void *)(v0 + 656));
    outlined destroy of Any?(v0 + 160, &demangling cache variable for type metadata for CandidateSuggestion?);
    uint64_t v2 = *(char **)(v0 + 968);
  }
  char v8 = *(void *)(v0 + 960) + 1;
  if (v8 == *(void *)(v0 + 936))
  {
    int v9 = *(void *)(v0 + 792);
    uint64_t v10 = *(void *)(v0 + 784);
    unint64_t v11 = *(void *)(v0 + 776);
    uint64_t v12 = *(void *)(v0 + 768);
    unint64_t v13 = *(void *)(v0 + 760);
    char v14 = *(void *)(v0 + 752);
    uint64_t v22 = *(void *)(v0 + 728);
    int v15 = *(void *)(v0 + 720);
    uint64_t v16 = *(void *)(v0 + 712);
    outlined consume of Data?(v10, v9);
    outlined consume of Data?(v10, v9);
    outlined consume of Data?(v12, v11);
    outlined consume of Data?(v14, v13);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v22, v16);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v17 = *(uint64_t (**)(char *))(v0 + 8);
    return v17(v2);
  }
  else
  {
    *(void *)(v0 + 968) = v2;
    *(void *)(v0 + 960) = v8;
    (*(void (**)(void, unint64_t, void))(v0 + 952))(*(void *)(v0 + 672), *(void *)(v0 + 928)+ ((*(unsigned __int8 *)(v0 + 992) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 992))+ *(void *)(v0 + 944) * v8, *(void *)(v0 + 656));
    unint64_t v19 = (void *)swift_task_alloc();
    *(void *)(v0 + 976) = v19;
    *unint64_t v19 = v0;
    v19[1] = InfoServerGenerator.generateCandidateSuggestions(interaction:environment:factory:);
    char v20 = *(void *)(v0 + 672);
    int v21 = *(void *)(v0 + 592);
    return InfoServerGenerator.createRelatedQuestionsSuggestion(candidate:factory:)(v0 + 160, v20, v21);
  }
}

uint64_t InfoServerGenerator.createSuggestionForCandidate(candidate:factory:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[15] = a2;
  v3[16] = a3;
  v3[14] = a1;
  uint64_t v4 = type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestionCandidate();
  v3[17] = v4;
  v3[18] = *(void *)(v4 - 8);
  v3[19] = swift_task_alloc();
  v3[20] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestionUtterance();
  v3[21] = v5;
  v3[22] = *(void *)(v5 - 8);
  v3[23] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for Objective();
  v3[24] = v6;
  v3[25] = *(void *)(v6 - 8);
  v3[26] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SuggestionIntent();
  v3[27] = v7;
  v3[28] = *(void *)(v7 - 8);
  v3[29] = swift_task_alloc();
  v3[30] = swift_task_alloc();
  v3[31] = swift_task_alloc();
  v3[32] = swift_task_alloc();
  return _swift_task_switch(InfoServerGenerator.createSuggestionForCandidate(candidate:factory:), 0, 0);
}

uint64_t InfoServerGenerator.createSuggestionForCandidate(candidate:factory:)()
{
  uint64_t v2 = *(void *)(v0 + 248);
  uint64_t v1 = *(void *)(v0 + 256);
  uint64_t v3 = *(void *)(v0 + 216);
  uint64_t v4 = *(void *)(v0 + 224);
  Apple_Parsec_Siri_V2alpha_ServerSuggestionCandidate.intent.getter();
  (*(void (**)(uint64_t, void, uint64_t))(v4 + 104))(v2, enum case for Apple_Parsec_Siri_V2alpha_SuggestionIntent.unspecified(_:), v3);
  lazy protocol witness table accessor for type DomainOwner and conformance DomainOwner(&lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_SuggestionIntent and conformance Apple_Parsec_Siri_V2alpha_SuggestionIntent, 255, (void (*)(uint64_t))&type metadata accessor for Apple_Parsec_Siri_V2alpha_SuggestionIntent);
  char v5 = dispatch thunk of static Equatable.== infix(_:_:)();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v6(v2, v3);
  os_log_type_t v51 = v6;
  v6(v1, v3);
  if (v5)
  {
    if (one-time initialization token for suggestions == -1)
    {
LABEL_3:
      uint64_t v8 = *(void *)(v0 + 144);
      uint64_t v7 = *(void *)(v0 + 152);
      uint64_t v9 = *(void *)(v0 + 136);
      uint64_t v10 = *(void *)(v0 + 120);
      uint64_t v11 = type metadata accessor for Logger();
      __swift_project_value_buffer(v11, (uint64_t)static Logger.suggestions);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v7, v10, v9);
      uint64_t v12 = Logger.logObject.getter();
      os_log_type_t v13 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v12, v13))
      {
        uint64_t v14 = *(void *)(v0 + 256);
        uint64_t v46 = *(void *)(v0 + 216);
        uint64_t v15 = *(void *)(v0 + 144);
        uint64_t v16 = *(void *)(v0 + 152);
        uint64_t v48 = *(void *)(v0 + 136);
        unint64_t v17 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)unint64_t v17 = 134217984;
        Apple_Parsec_Siri_V2alpha_ServerSuggestionCandidate.intent.getter();
        uint64_t v18 = Apple_Parsec_Siri_V2alpha_SuggestionIntent.rawValue.getter();
        v51(v14, v46);
        (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v16, v48);
        *(void *)(v0 + 104) = v18;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl(&dword_0, v12, v13, "Encountered unspecified intent of id %ld. Filtering out", v17, 0xCu);
        swift_slowDealloc();
      }
      else
      {
        (*(void (**)(void, void))(*(void *)(v0 + 144) + 8))(*(void *)(v0 + 152), *(void *)(v0 + 136));
      }

      uint64_t v26 = *(void *)(v0 + 112);
LABEL_27:
      *(void *)(v26 + 32) = 0;
      *(_OWORD *)uint64_t v26 = 0u;
      *(_OWORD *)(v26 + 16) = 0u;
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v44 = *(uint64_t (**)(void))(v0 + 8);
      return v44();
    }
LABEL_32:
    swift_once();
    goto LABEL_3;
  }
  if (one-time initialization token for mathSuggestionIntents != -1) {
    swift_once();
  }
  uint64_t v19 = static SuggestionConstants.mathSuggestionIntents;
  swift_bridgeObjectRetain();
  Apple_Parsec_Siri_V2alpha_ServerSuggestionCandidate.intent.getter();
  uint64_t v50 = *(void *)(v19 + 16);
  if (v50)
  {
    uint64_t v20 = *(void *)(v0 + 232);
    uint64_t v21 = *(void *)(v0 + 216);
    uint64_t v22 = *(void *)(v0 + 224);
    uint64_t v23 = v19;
    unint64_t v24 = (*(unsigned __int8 *)(v22 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
    uint64_t v49 = *(void (**)(uint64_t, unint64_t, uint64_t))(v22 + 16);
    v49(v20, v23 + v24, v21);
    swift_bridgeObjectRetain();
    char v25 = dispatch thunk of static Equatable.== infix(_:_:)();
    v51(v20, v21);
    if ((v25 & 1) == 0 && v50 != 1)
    {
      uint64_t v47 = *(void *)(*(void *)(v0 + 224) + 72);
      unint64_t v27 = v23 + v47 + v24;
      uint64_t v28 = 1;
      while (1)
      {
        v49(*(void *)(v0 + 232), v27, *(void *)(v0 + 216));
        uint64_t v29 = v28 + 1;
        if (__OFADD__(v28, 1)) {
          break;
        }
        uint64_t v30 = *(void *)(v0 + 232);
        uint64_t v31 = *(void *)(v0 + 216);
        char v32 = dispatch thunk of static Equatable.== infix(_:_:)();
        v51(v30, v31);
        if ((v32 & 1) == 0)
        {
          ++v28;
          v27 += v47;
          if (v29 != v50) {
            continue;
          }
        }
        goto LABEL_17;
      }
      __break(1u);
      goto LABEL_32;
    }
LABEL_17:
    swift_bridgeObjectRelease();
  }
  uint64_t v33 = *(void *)(v0 + 208);
  uint64_t v35 = *(void *)(v0 + 192);
  uint64_t v34 = *(void *)(v0 + 200);
  unint64_t v36 = *(void **)(v0 + 128);
  v51(*(void *)(v0 + 240), *(void *)(v0 + 216));
  swift_bridgeObjectRelease();
  __swift_project_boxed_opaque_existential_1Tm(v36, v36[3]);
  specialized Dictionary.init(dictionaryLiteral:)((uint64_t)&_swiftEmptyArrayStorage);
  (*(void (**)(uint64_t, void, uint64_t))(v34 + 104))(v33, enum case for Objective.discoverability(_:), v35);
  CandidateSuggestionFactory.create(suggestionId:params:objective:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v33, v35);
  if (!*(void *)(v0 + 80))
  {
    outlined destroy of Any?(v0 + 56, &demangling cache variable for type metadata for CandidateSuggestion?);
    if (one-time initialization token for suggestions != -1) {
      swift_once();
    }
    uint64_t v40 = type metadata accessor for Logger();
    __swift_project_value_buffer(v40, (uint64_t)static Logger.suggestions);
    uint64_t v41 = Logger.logObject.getter();
    os_log_type_t v42 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v43 = 0;
      _os_log_impl(&dword_0, v41, v42, "Unable to find server suggestionID", v43, 2u);
      swift_slowDealloc();
    }
    uint64_t v26 = *(void *)(v0 + 112);

    goto LABEL_27;
  }
  outlined init with take of CandidateSuggestion((long long *)(v0 + 56), v0 + 16);
  __swift_project_boxed_opaque_existential_1Tm((void *)(v0 + 16), *(void *)(v0 + 40));
  *(void *)(v0 + 264) = dispatch thunk of CandidateSuggestion.context.getter();
  *(void *)(v0 + 272) = v37;
  *(void *)(v0 + 280) = swift_getObjectType();
  Apple_Parsec_Siri_V2alpha_ServerSuggestionCandidate.utterance.getter();
  uint64_t v39 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(InfoServerGenerator.createSuggestionForCandidate(candidate:factory:), v39, v38);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  uint64_t v2 = v0[22];
  uint64_t v1 = v0[23];
  uint64_t v3 = v0[21];
  Context.setUtterance(_:)(v1);
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return _swift_task_switch(InfoServerGenerator.createSuggestionForCandidate(candidate:factory:), 0, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  __swift_project_boxed_opaque_existential_1Tm(v0 + 2, v0[5]);
  v0[36] = dispatch thunk of CandidateSuggestion.context.getter();
  v0[37] = v1;
  v0[38] = swift_getObjectType();
  Apple_Parsec_Siri_V2alpha_ServerSuggestionCandidate.intent.getter();
  v0[39] = String.init<A>(describing:)();
  v0[40] = v2;
  uint64_t v4 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(InfoServerGenerator.createSuggestionForCandidate(candidate:factory:), v4, v3);
}

{
  uint64_t v0;
  uint64_t v2;

  Context.setServerIntent(_:)(*(Swift::String *)(v0 + 312));
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return _swift_task_switch(InfoServerGenerator.createSuggestionForCandidate(candidate:factory:), 0, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t (*v15)(void);
  uint64_t v17;
  void *v18;
  uint64_t v19;

  uint64_t v18 = v0;
  if (one-time initialization token for suggestions != -1) {
    swift_once();
  }
  uint64_t v1 = v0[20];
  uint64_t v2 = v0[17];
  uint64_t v3 = v0[18];
  uint64_t v4 = v0[15];
  char v5 = type metadata accessor for Logger();
  __swift_project_value_buffer(v5, (uint64_t)static Logger.suggestions);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  uint64_t v6 = Logger.logObject.getter();
  uint64_t v7 = static os_log_type_t.error.getter();
  uint64_t v8 = os_log_type_enabled(v6, v7);
  uint64_t v9 = v0[20];
  uint64_t v10 = v0[17];
  uint64_t v11 = v0[18];
  if (v8)
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    unint64_t v17 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315138;
    lazy protocol witness table accessor for type DomainOwner and conformance DomainOwner(&lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_ServerSuggestionCandidate and conformance Apple_Parsec_Siri_V2alpha_ServerSuggestionCandidate, 255, (void (*)(uint64_t))&type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestionCandidate);
    os_log_type_t v13 = Message.debugDescription.getter();
    v0[12] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v13, v14, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
    _os_log_impl(&dword_0, v6, v7, "Found and constructed server based info suggestion: %s", v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(void, void))(v11 + 8))(v0[20], v0[17]);
  }

  outlined init with copy of CandidateSuggestion((uint64_t)(v0 + 2), v0[14]);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 2));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

uint64_t InfoServerGenerator.createAlternateQuerySuggestionForCandidate(candidate:factory:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[14] = a2;
  v3[15] = a3;
  v3[13] = a1;
  uint64_t SuggestionCandidate = type metadata accessor for Apple_Parsec_Siri_V2alpha_AlternateQuerySuggestionCandidate();
  v3[16] = SuggestionCandidate;
  v3[17] = *(void *)(SuggestionCandidate - 8);
  v3[18] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestionUtterance();
  v3[19] = v5;
  v3[20] = *(void *)(v5 - 8);
  v3[21] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Preference?);
  v3[22] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DeliveryVehicle?);
  v3[23] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for Objective();
  v3[24] = v6;
  v3[25] = *(void *)(v6 - 8);
  v3[26] = swift_task_alloc();
  return _swift_task_switch(InfoServerGenerator.createAlternateQuerySuggestionForCandidate(candidate:factory:), 0, 0);
}

uint64_t InfoServerGenerator.createAlternateQuerySuggestionForCandidate(candidate:factory:)()
{
  uint64_t v2 = *(void *)(v0 + 200);
  uint64_t v1 = *(void *)(v0 + 208);
  uint64_t v4 = *(void *)(v0 + 184);
  uint64_t v3 = *(void *)(v0 + 192);
  uint64_t v5 = *(void *)(v0 + 176);
  uint64_t v21 = v3;
  __swift_project_boxed_opaque_existential_1Tm(*(void **)(v0 + 120), *(void *)(*(void *)(v0 + 120) + 24));
  specialized Dictionary.init(dictionaryLiteral:)((uint64_t)&_swiftEmptyArrayStorage);
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, enum case for Objective.discoverability(_:), v3);
  uint64_t v6 = enum case for DeliveryVehicle.assistantSuggestions(_:);
  uint64_t v7 = type metadata accessor for DeliveryVehicle();
  uint64_t v8 = *(void *)(v7 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 104))(v4, v6, v7);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v8 + 56))(v4, 0, 1, v7);
  uint64_t v9 = (long long *)(v0 + 56);
  uint64_t v10 = type metadata accessor for Preference();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v5, 1, 1, v10);
  CandidateSuggestionFactory.create(suggestionId:params:objective:deliveryVehicle:preference:)();
  swift_bridgeObjectRelease();
  outlined destroy of Any?(v5, &demangling cache variable for type metadata for Preference?);
  outlined destroy of Any?(v4, &demangling cache variable for type metadata for DeliveryVehicle?);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v21);
  if (*(void *)(v0 + 80))
  {
    outlined init with take of CandidateSuggestion(v9, v0 + 16);
    __swift_project_boxed_opaque_existential_1Tm((void *)(v0 + 16), *(void *)(v0 + 40));
    *(void *)(v0 + 216) = dispatch thunk of CandidateSuggestion.context.getter();
    *(void *)(v0 + 224) = v11;
    *(void *)(v0 + 232) = swift_getObjectType();
    Apple_Parsec_Siri_V2alpha_AlternateQuerySuggestionCandidate.utterance.getter();
    uint64_t v13 = dispatch thunk of Actor.unownedExecutor.getter();
    return _swift_task_switch(InfoServerGenerator.createAlternateQuerySuggestionForCandidate(candidate:factory:), v13, v12);
  }
  else
  {
    outlined destroy of Any?((uint64_t)v9, &demangling cache variable for type metadata for CandidateSuggestion?);
    if (one-time initialization token for suggestions != -1) {
      swift_once();
    }
    uint64_t v14 = type metadata accessor for Logger();
    __swift_project_value_buffer(v14, (uint64_t)static Logger.suggestions);
    uint64_t v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      unint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v17 = 0;
      _os_log_impl(&dword_0, v15, v16, "Unable to find server suggestionID", v17, 2u);
      swift_slowDealloc();
    }
    uint64_t v18 = *(void *)(v0 + 104);

    *(void *)(v18 + 32) = 0;
    *(_OWORD *)uint64_t v18 = 0u;
    *(_OWORD *)(v18 + 16) = 0u;
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v19 = *(uint64_t (**)(void))(v0 + 8);
    return v19();
  }
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  uint64_t v2 = v0[20];
  uint64_t v1 = v0[21];
  uint64_t v3 = v0[19];
  Context.setUtterance(_:)(v1);
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return _swift_task_switch(InfoServerGenerator.createAlternateQuerySuggestionForCandidate(candidate:factory:), 0, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  __swift_project_boxed_opaque_existential_1Tm(v0 + 2, v0[5]);
  v0[30] = dispatch thunk of CandidateSuggestion.context.getter();
  v0[31] = v1;
  v0[32] = swift_getObjectType();
  uint64_t v3 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(InfoServerGenerator.createAlternateQuerySuggestionForCandidate(candidate:factory:), v3, v2);
}

{
  Swift::String v0;
  uint64_t v2;

  v0._object = (void *)0x8000000000012340;
  v0._countAndFlagsBits = 0xD000000000000015;
  Context.setServerIntent(_:)(v0);
  swift_unknownObjectRelease();
  return _swift_task_switch(InfoServerGenerator.createAlternateQuerySuggestionForCandidate(candidate:factory:), 0, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t (*v15)(void);
  uint64_t v17;
  void *v18;
  uint64_t v19;

  uint64_t v18 = v0;
  if (one-time initialization token for suggestions != -1) {
    swift_once();
  }
  uint64_t v2 = v0[17];
  uint64_t v1 = v0[18];
  uint64_t v3 = v0[16];
  uint64_t v4 = v0[14];
  uint64_t v5 = type metadata accessor for Logger();
  __swift_project_value_buffer(v5, (uint64_t)static Logger.suggestions);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  uint64_t v6 = Logger.logObject.getter();
  uint64_t v7 = static os_log_type_t.debug.getter();
  uint64_t v8 = os_log_type_enabled(v6, v7);
  uint64_t v10 = v0[17];
  uint64_t v9 = v0[18];
  uint64_t v11 = v0[16];
  if (v8)
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    unint64_t v17 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315138;
    lazy protocol witness table accessor for type DomainOwner and conformance DomainOwner(&lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_AlternateQuerySuggestionCandidate and conformance Apple_Parsec_Siri_V2alpha_AlternateQuerySuggestionCandidate, 255, (void (*)(uint64_t))&type metadata accessor for Apple_Parsec_Siri_V2alpha_AlternateQuerySuggestionCandidate);
    uint64_t v13 = Message.debugDescription.getter();
    v0[12] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v13, v14, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
    _os_log_impl(&dword_0, v6, v7, "Found and constructed server based alternate query suggestion: %s", v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(void, void))(v10 + 8))(v0[18], v0[16]);
  }

  outlined init with copy of CandidateSuggestion((uint64_t)(v0 + 2), v0[13]);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 2));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

uint64_t InfoServerGenerator.createRelatedQuestionsSuggestion(candidate:factory:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[14] = a2;
  v3[15] = a3;
  v3[13] = a1;
  uint64_t v4 = type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestionCandidate();
  v3[16] = v4;
  v3[17] = *(void *)(v4 - 8);
  v3[18] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestionUtterance();
  v3[19] = v5;
  v3[20] = *(void *)(v5 - 8);
  v3[21] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Preference?);
  v3[22] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DeliveryVehicle?);
  v3[23] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for Objective();
  v3[24] = v6;
  v3[25] = *(void *)(v6 - 8);
  v3[26] = swift_task_alloc();
  return _swift_task_switch(InfoServerGenerator.createRelatedQuestionsSuggestion(candidate:factory:), 0, 0);
}

uint64_t InfoServerGenerator.createRelatedQuestionsSuggestion(candidate:factory:)()
{
  uint64_t v2 = *(void *)(v0 + 200);
  uint64_t v1 = *(void *)(v0 + 208);
  uint64_t v4 = *(void *)(v0 + 184);
  uint64_t v3 = *(void *)(v0 + 192);
  uint64_t v5 = *(void *)(v0 + 176);
  __swift_project_boxed_opaque_existential_1Tm(*(void **)(v0 + 120), *(void *)(*(void *)(v0 + 120) + 24));
  specialized Dictionary.init(dictionaryLiteral:)((uint64_t)&_swiftEmptyArrayStorage);
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, enum case for Objective.discoverability(_:), v3);
  uint64_t v6 = type metadata accessor for DeliveryVehicle();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v4, 1, 1, v6);
  uint64_t v7 = type metadata accessor for Preference();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v5, 1, 1, v7);
  CandidateSuggestionFactory.create(suggestionId:params:objective:deliveryVehicle:preference:)();
  swift_bridgeObjectRelease();
  outlined destroy of Any?(v5, &demangling cache variable for type metadata for Preference?);
  outlined destroy of Any?(v4, &demangling cache variable for type metadata for DeliveryVehicle?);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  if (*(void *)(v0 + 80))
  {
    outlined init with take of CandidateSuggestion((long long *)(v0 + 56), v0 + 16);
    __swift_project_boxed_opaque_existential_1Tm((void *)(v0 + 16), *(void *)(v0 + 40));
    *(void *)(v0 + 216) = dispatch thunk of CandidateSuggestion.context.getter();
    *(void *)(v0 + 224) = v8;
    *(void *)(v0 + 232) = swift_getObjectType();
    Apple_Parsec_Siri_V2alpha_ServerSuggestionCandidate.utterance.getter();
    uint64_t v10 = dispatch thunk of Actor.unownedExecutor.getter();
    return _swift_task_switch(InfoServerGenerator.createRelatedQuestionsSuggestion(candidate:factory:), v10, v9);
  }
  else
  {
    outlined destroy of Any?(v0 + 56, &demangling cache variable for type metadata for CandidateSuggestion?);
    if (one-time initialization token for suggestions != -1) {
      swift_once();
    }
    uint64_t v11 = type metadata accessor for Logger();
    __swift_project_value_buffer(v11, (uint64_t)static Logger.suggestions);
    uint64_t v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_0, v12, v13, "Unable to find server suggestionID", v14, 2u);
      swift_slowDealloc();
    }
    uint64_t v15 = *(void *)(v0 + 104);

    *(void *)(v15 + 32) = 0;
    *(_OWORD *)uint64_t v15 = 0u;
    *(_OWORD *)(v15 + 16) = 0u;
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    os_log_type_t v16 = *(uint64_t (**)(void))(v0 + 8);
    return v16();
  }
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  uint64_t v2 = v0[20];
  uint64_t v1 = v0[21];
  uint64_t v3 = v0[19];
  Context.setUtterance(_:)(v1);
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return _swift_task_switch(InfoServerGenerator.createRelatedQuestionsSuggestion(candidate:factory:), 0, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t (*v15)(void);
  uint64_t v17;
  void *v18;
  uint64_t v19;

  uint64_t v18 = v0;
  if (one-time initialization token for suggestions != -1) {
    swift_once();
  }
  uint64_t v2 = v0[17];
  uint64_t v1 = v0[18];
  uint64_t v3 = v0[16];
  uint64_t v4 = v0[14];
  uint64_t v5 = type metadata accessor for Logger();
  __swift_project_value_buffer(v5, (uint64_t)static Logger.suggestions);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  uint64_t v6 = Logger.logObject.getter();
  uint64_t v7 = static os_log_type_t.debug.getter();
  uint64_t v8 = os_log_type_enabled(v6, v7);
  uint64_t v10 = v0[17];
  uint64_t v9 = v0[18];
  uint64_t v11 = v0[16];
  if (v8)
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    unint64_t v17 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315138;
    lazy protocol witness table accessor for type DomainOwner and conformance DomainOwner(&lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_ServerSuggestionCandidate and conformance Apple_Parsec_Siri_V2alpha_ServerSuggestionCandidate, 255, (void (*)(uint64_t))&type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestionCandidate);
    os_log_type_t v13 = Message.debugDescription.getter();
    v0[12] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v13, v14, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
    _os_log_impl(&dword_0, v6, v7, "Found and constructed server based related questions suggestion: %s", v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(void, void))(v10 + 8))(v0[18], v0[16]);
  }

  outlined init with copy of CandidateSuggestion((uint64_t)(v0 + 2), v0[13]);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 2));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

uint64_t Context.setUtterance(_:)(uint64_t a1)
{
  if (one-time initialization token for kOwnerInformation != -1) {
    swift_once();
  }
  uint64_t v2 = static SuggestionConstants.kOwnerInformation;
  v7[3] = type metadata accessor for DomainOwner();
  v7[4] = &protocol witness table for DomainOwner;
  v7[0] = v2;
  uint64_t v3 = type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestionUtterance();
  v6[3] = v3;
  boxed_opaque_existential_0Tm = __swift_allocate_boxed_opaque_existential_0Tm(v6);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16))(boxed_opaque_existential_0Tm, a1, v3);
  swift_retain();
  Context.setParam(for:key:value:)();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v6);
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v7);
}

Swift::Void __swiftcall Context.setServerIntent(_:)(Swift::String a1)
{
  object = a1._object;
  uint64_t countAndFlagsBits = a1._countAndFlagsBits;
  if (one-time initialization token for kOwnerInformation != -1) {
    swift_once();
  }
  uint64_t v3 = static SuggestionConstants.kOwnerInformation;
  v6[3] = type metadata accessor for DomainOwner();
  uint64_t v6[4] = &protocol witness table for DomainOwner;
  v6[0] = v3;
  uint64_t v4 = one-time initialization token for serverIntentName;
  swift_retain();
  if (v4 != -1) {
    swift_once();
  }
  v5[3] = &type metadata for String;
  v5[0] = countAndFlagsBits;
  v5[1] = object;
  swift_bridgeObjectRetain();
  Context.setParam(for:key:value:)();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v5);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v6);
}

uint64_t InfoServerGenerator.__deallocating_deinit()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t protocol witness for InternalGenerator.generateCandidateSuggestions(interaction:environment:factory:) in conformance InfoServerGenerator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *uint64_t v6 = v3;
  v6[1] = protocol witness for static OwnerDefinitionFactory.createOwnerDefinitions(builderFactory:) in conformance InfoServerSuggestionDefinitionFactory;
  return InfoServerGenerator.generateCandidateSuggestions(interaction:environment:factory:)(a1, v7, a3);
}

uint64_t protocol witness for Wrappable.getRoot() in conformance InfoServerGenerator()
{
  return Wrappable.getRoot()();
}

uint64_t FromContextResolver.resolverTypeOperand.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FromContextResolver.propertyExtractor.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_retain();
  return v1;
}

void *FromContextResolver.init(resolverTypeOperand:propertyExtractor:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a1;
  v4[3] = a2;
  v4[4] = a3;
  v4[5] = a4;
  return v4;
}

uint64_t FromContextResolver.resolveParameter(parameter:suggestion:interaction:environment:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&async function pointer to specialized FromContextResolver.resolveParameter(parameter:suggestion:interaction:environment:)
                                                          + async function pointer to specialized FromContextResolver.resolveParameter(parameter:suggestion:interaction:environment:));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  *uint64_t v8 = v4;
  v8[1] = protocol witness for static OwnerDefinitionFactory.createOwnerDefinitions(builderFactory:) in conformance InfoServerSuggestionDefinitionFactory;
  return v10(a2, a3, a4);
}

uint64_t FromContextResolver.deinit()
{
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t FromContextResolver.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_release();
  return _swift_deallocClassInstance(v0, 48, 7);
}

uint64_t protocol witness for InternalResolver.resolverTypeOperand.getter in conformance FromContextResolver()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t protocol witness for InternalResolver.resolveParameter(parameter:suggestion:interaction:environment:) in conformance FromContextResolver(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&async function pointer to specialized FromContextResolver.resolveParameter(parameter:suggestion:interaction:environment:)
                                                          + async function pointer to specialized FromContextResolver.resolveParameter(parameter:suggestion:interaction:environment:));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  *uint64_t v8 = v4;
  v8[1] = protocol witness for InternalResolver.resolveParameter(parameter:suggestion:interaction:environment:) in conformance FromContextResolver;
  return v10(a2, a3, a4);
}

uint64_t protocol witness for InternalResolver.resolveParameter(parameter:suggestion:interaction:environment:) in conformance FromContextResolver(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *a1, int64_t a2, char a3, char *a4)
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, a4, &demangling cache variable for type metadata for _ContiguousArrayStorage<OwnerDefinition>, &demangling cache variable for type metadata for OwnerDefinition);
}

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, char *a4, uint64_t *a5, uint64_t *a6)
{
  char v8 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v10 = a2;
    goto LABEL_8;
  }
  unint64_t v9 = *((void *)a4 + 3);
  uint64_t v10 = v9 >> 1;
  if ((uint64_t)(v9 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v10 + 0x4000000000000000 >= 0)
  {
    uint64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v10 = a2;
    }
LABEL_8:
    uint64_t v11 = *((void *)a4 + 2);
    if (v10 <= v11) {
      uint64_t v12 = *((void *)a4 + 2);
    }
    else {
      uint64_t v12 = v10;
    }
    if (v12)
    {
      __swift_instantiateConcreteTypeFromMangledName(a5);
      os_log_type_t v13 = (char *)swift_allocObject();
      size_t v14 = _swift_stdlib_malloc_size(v13);
      *((void *)v13 + 2) = v11;
      *((void *)v13 + 3) = 2 * ((uint64_t)(v14 - 32) / 40);
      uint64_t v15 = v13 + 32;
      if (v8)
      {
LABEL_13:
        if (v13 != a4 || v15 >= &a4[40 * v11 + 32]) {
          memmove(v15, a4 + 32, 40 * v11);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      os_log_type_t v13 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v15 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result) {
        goto LABEL_13;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v11, (unint64_t)v15, (uint64_t)a4, a6);
LABEL_22:
    swift_bridgeObjectRelease();
    return v13;
  }
  __break(1u);
  return result;
}

uint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = specialized _StringGuts._deconstructUTF8<A>(scratch:)(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t specialized _StringGuts._deconstructUTF8<A>(scratch:)(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = _StringGuts._allocateForDeconstruct()(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t _StringGuts._allocateForDeconstruct()(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = _StringGuts.copyUTF8(into:)();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  os_log_type_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(char a1)
{
  Hasher.init(_seed:)();
  InformationSuggestion.rawValue.getter(a1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  Swift::Int v2 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        os_log_type_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = a1;
    while (1)
    {
      unint64_t v7 = 0xD000000000000014;
      unint64_t v8 = 0x8000000000011F20;
      switch(*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        case 1:
          unint64_t v7 = 0xD000000000000018;
          uint64_t v9 = "calculatorArithmetic";
          goto LABEL_24;
        case 2:
          unint64_t v7 = 0xD000000000000013;
          uint64_t v9 = "calculatorUnitConversion";
          goto LABEL_24;
        case 3:
          unint64_t v7 = 0xD000000000000014;
          uint64_t v9 = "knowledgeAnimalFact";
          goto LABEL_24;
        case 4:
          unint64_t v7 = 0xD000000000000015;
          uint64_t v9 = "knowledgeAnimalSound";
          goto LABEL_24;
        case 5:
          unint64_t v7 = 0xD000000000000015;
          uint64_t v9 = "knowledgeBuildingFact";
          goto LABEL_24;
        case 6:
          unint64_t v7 = 0xD000000000000016;
          uint64_t v9 = "knowledgeCalendarFact";
          goto LABEL_24;
        case 7:
          unint64_t v7 = 0xD00000000000001CLL;
          uint64_t v9 = "knowledgeCelebrityFact";
          goto LABEL_24;
        case 8:
          unint64_t v7 = 0xD000000000000019;
          uint64_t v9 = "knowledgeDaylightSavingsTime";
          goto LABEL_24;
        case 9:
          unint64_t v7 = 0xD00000000000001BLL;
          uint64_t v9 = "knowledgeDictionaryLookup";
          goto LABEL_24;
        case 0xA:
          unint64_t v7 = 0xD000000000000016;
          uint64_t v9 = "knowledgeEncyclopediaLookup";
          goto LABEL_24;
        case 0xB:
          unint64_t v7 = 0xD000000000000018;
          uint64_t v9 = "knowledgeGeographyFact";
          goto LABEL_24;
        case 0xC:
          unint64_t v7 = 0x6165536C61636F6CLL;
          unint64_t v8 = 0xEB00000000686372;
          break;
        case 0xD:
          unint64_t v7 = 0xD000000000000018;
          uint64_t v9 = "onalFact";
          goto LABEL_24;
        case 0xE:
          unint64_t v8 = 0xE400000000000000;
          unint64_t v7 = 1937204590;
          break;
        case 0xF:
          uint64_t v10 = "localSearchBusinessHours";
          goto LABEL_21;
        case 0x10:
          uint64_t v10 = "weatherConditions";
          goto LABEL_21;
        case 0x11:
          uint64_t v10 = "weatherSolarEvent";
LABEL_21:
          unint64_t v8 = (unint64_t)v10 | 0x8000000000000000;
          unint64_t v7 = 0xD000000000000011;
          break;
        case 0x12:
          unint64_t v7 = 0xD000000000000017;
          uint64_t v9 = "edutainmentTrivia";
          goto LABEL_24;
        case 0x13:
          unint64_t v7 = 0xD000000000000015;
          uint64_t v9 = "edutainmentFlyingFlower";
LABEL_24:
          unint64_t v8 = (unint64_t)v9 | 0x8000000000000000;
          break;
        default:
          break;
      }
      unint64_t v11 = 0xD000000000000014;
      unint64_t v12 = 0x8000000000011F20;
      switch(v6)
      {
        case 1:
          unint64_t v13 = 0xD000000000000018;
          BOOL v14 = "calculatorArithmetic";
          goto LABEL_50;
        case 2:
          unint64_t v13 = 0xD000000000000013;
          BOOL v14 = "calculatorUnitConversion";
          goto LABEL_50;
        case 3:
          unint64_t v13 = 0xD000000000000014;
          BOOL v14 = "knowledgeAnimalFact";
          goto LABEL_50;
        case 4:
          unint64_t v13 = 0xD000000000000015;
          BOOL v14 = "knowledgeAnimalSound";
          goto LABEL_50;
        case 5:
          unint64_t v13 = 0xD000000000000015;
          BOOL v14 = "knowledgeBuildingFact";
          goto LABEL_50;
        case 6:
          unint64_t v13 = 0xD000000000000016;
          BOOL v14 = "knowledgeCalendarFact";
          goto LABEL_50;
        case 7:
          unint64_t v13 = 0xD00000000000001CLL;
          BOOL v14 = "knowledgeCelebrityFact";
          goto LABEL_50;
        case 8:
          unint64_t v13 = 0xD000000000000019;
          BOOL v14 = "knowledgeDaylightSavingsTime";
          goto LABEL_50;
        case 9:
          unint64_t v13 = 0xD00000000000001BLL;
          BOOL v14 = "knowledgeDictionaryLookup";
          goto LABEL_50;
        case 10:
          unint64_t v13 = 0xD000000000000016;
          BOOL v14 = "knowledgeEncyclopediaLookup";
          goto LABEL_50;
        case 11:
          unint64_t v13 = 0xD000000000000018;
          BOOL v14 = "knowledgeGeographyFact";
          goto LABEL_50;
        case 12:
          unint64_t v12 = 0xEB00000000686372;
          if (v7 != 0x6165536C61636F6CLL) {
            goto LABEL_52;
          }
          goto LABEL_51;
        case 13:
          unint64_t v13 = 0xD000000000000018;
          BOOL v14 = "onalFact";
          goto LABEL_50;
        case 14:
          unint64_t v12 = 0xE400000000000000;
          if (v7 != 1937204590) {
            goto LABEL_52;
          }
          goto LABEL_51;
        case 15:
          uint64_t v15 = "localSearchBusinessHours";
          goto LABEL_45;
        case 16:
          uint64_t v15 = "weatherConditions";
          goto LABEL_45;
        case 17:
          uint64_t v15 = "weatherSolarEvent";
LABEL_45:
          unint64_t v12 = (unint64_t)v15 | 0x8000000000000000;
          unint64_t v11 = 0xD000000000000011;
          goto LABEL_46;
        case 18:
          unint64_t v13 = 0xD000000000000017;
          BOOL v14 = "edutainmentTrivia";
          goto LABEL_50;
        case 19:
          unint64_t v13 = 0xD000000000000015;
          BOOL v14 = "edutainmentFlyingFlower";
LABEL_50:
          unint64_t v12 = (unint64_t)v14 | 0x8000000000000000;
          if (v7 == v13) {
            goto LABEL_51;
          }
          goto LABEL_52;
        default:
LABEL_46:
          if (v7 != v11) {
            goto LABEL_52;
          }
LABEL_51:
          if (v8 == v12)
          {
            swift_bridgeObjectRelease_n();
            return v4;
          }
LABEL_52:
          char v16 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v16) {
            return v4;
          }
          unint64_t v4 = (v4 + 1) & v5;
          if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) == 0) {
            return v4;
          }
          break;
      }
    }
  }
  return v4;
}

uint64_t specialized closure #2 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:)(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transformer<Any, Any?>);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for FromContextResolver();
  unint64_t v7 = (void *)swift_allocObject();
  v7[2] = 0xD000000000000010;
  v7[3] = 0x8000000000011E30;
  v7[4] = &async function pointer to closure #1 in closure #2 in static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:);
  void v7[5] = 0;
  uint64_t v8 = *(void *)(a1 + 40);
  long long v22 = *(_OWORD *)(a1 + 24);
  __swift_project_boxed_opaque_existential_1Tm((void *)a1, v22);
  *(void *)&long long v30 = v6;
  *((void *)&v30 + 1) = lazy protocol witness table accessor for type DomainOwner and conformance DomainOwner(&lazy protocol witness table cache variable for type FromContextResolver and conformance FromContextResolver, v9, (void (*)(uint64_t))type metadata accessor for FromContextResolver);
  v29[0] = (uint64_t)v7;
  type metadata accessor for ResolvableParameter();
  uint64_t v10 = one-time initialization token for utteranceToLoggingIdTransformer;
  swift_retain();
  if (v10 != -1) {
    swift_once();
  }
  uint64_t v11 = __swift_project_value_buffer(v2, (uint64_t)static InfoServerSuggestionDefinitionFactory.utteranceToLoggingIdTransformer);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v11, v2);
  ResolvableParameter.__allocating_init(typeIdentifier:required:loggingKeyTransformer:)();
  long long v33 = v22;
  uint64_t v34 = v8;
  __swift_allocate_boxed_opaque_existential_0Tm(v32);
  SuggestionDetailsBuilder.parameter(parameterName:resolver:resolveParam:)();
  swift_release();
  outlined destroy of Any?((uint64_t)v29, &demangling cache variable for type metadata for Resolver?);
  uint64_t v12 = v34;
  long long v21 = v33;
  __swift_project_boxed_opaque_existential_1Tm(v32, v33);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<VersionedInvocation>);
  type metadata accessor for VersionedInvocation();
  uint64_t v13 = swift_allocObject();
  long long v22 = xmmword_11570;
  *(_OWORD *)(v13 + 16) = xmmword_11570;
  static VersionedInvocations.latest.getter();
  long long v30 = v21;
  uint64_t v31 = v12;
  __swift_allocate_boxed_opaque_existential_0Tm(v29);
  dispatch thunk of SuggestionDetailsBuilder.validForInvocationTypes(_:)();
  swift_bridgeObjectRelease();
  uint64_t v14 = v31;
  long long v21 = v30;
  __swift_project_boxed_opaque_existential_1Tm(v29, v30);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<DeliveryVehicle>);
  uint64_t v15 = type metadata accessor for DeliveryVehicle();
  uint64_t v16 = *(void *)(v15 - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = v22;
  (*(void (**)(unint64_t, void, uint64_t))(v16 + 104))(v18 + v17, enum case for DeliveryVehicle.assistantSuggestions(_:), v15);
  long long v27 = v21;
  uint64_t v28 = v14;
  __swift_allocate_boxed_opaque_existential_0Tm(v26);
  dispatch thunk of SuggestionDetailsBuilder.enabledDeliveryVehicles(_:)();
  swift_bridgeObjectRelease();
  uint64_t v19 = v28;
  long long v21 = v27;
  __swift_project_boxed_opaque_existential_1Tm(v26, v27);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Locale>);
  type metadata accessor for Locale();
  *(_OWORD *)(swift_allocObject() + 16) = v22;
  Locale.init(identifier:)();
  long long v24 = v21;
  uint64_t v25 = v19;
  __swift_allocate_boxed_opaque_existential_0Tm(v23);
  dispatch thunk of SuggestionDetailsBuilder.enabledLocales(_:)();
  swift_bridgeObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v23);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v26);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v29);
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v32);
}

uint64_t sub_BEEC()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_BEFC()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_BF34()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t type metadata accessor for InfoServerGenerator()
{
  return self;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t outlined copy of Data._Representation(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }
  return swift_retain();
}

uint64_t outlined consume of Data?(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return outlined consume of Data._Representation(a1, a2);
  }
  return a1;
}

uint64_t outlined consume of Data._Representation(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }
  return swift_release();
}

uint64_t outlined init with take of CandidateSuggestion(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t outlined init with copy of CandidateSuggestion(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t outlined init with copy of Decodable & Encodable & Sendable(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t specialized FromContextResolver.resolveParameter(parameter:suggestion:interaction:environment:)(uint64_t a1)
{
  *(void *)(v2 + 80) = a1;
  *(void *)(v2 + 88) = v1;
  return _swift_task_switch(specialized FromContextResolver.resolveParameter(parameter:suggestion:interaction:environment:), 0, 0);
}

uint64_t specialized FromContextResolver.resolveParameter(parameter:suggestion:interaction:environment:)()
{
  uint64_t v1 = *(int **)(*(void *)(v0 + 88) + 32);
  __swift_project_boxed_opaque_existential_1Tm(*(void **)(v0 + 80), *(void *)(*(void *)(v0 + 80) + 24));
  uint64_t v2 = dispatch thunk of CandidateSuggestion.context.getter();
  uint64_t v4 = v3;
  *(void *)(v0 + 96) = v2;
  unint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)v1 + *v1);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 104) = v5;
  *uint64_t v5 = v0;
  v5[1] = specialized FromContextResolver.resolveParameter(parameter:suggestion:interaction:environment:);
  return v7(v0 + 48, v2, v4);
}

{
  uint64_t v1;

  swift_task_dealloc();
  swift_unknownObjectRelease();
  return _swift_task_switch(specialized FromContextResolver.resolveParameter(parameter:suggestion:interaction:environment:), 0, 0);
}

{
  uint64_t v0;
  _OWORD *v1;
  _OWORD *v2;
  uint64_t (*v3)(_OWORD *);
  uint64_t v5;

  uint64_t v1 = (_OWORD *)(v0 + 48);
  if (*(void *)(v0 + 72))
  {
    outlined init with take of Any(v1, (_OWORD *)(v0 + 16));
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
    uint64_t v2 = (_OWORD *)swift_allocObject();
    v2[1] = xmmword_11570;
    outlined init with take of Any((_OWORD *)(v0 + 16), v2 + 2);
  }
  else
  {
    outlined destroy of Any?((uint64_t)v1, &demangling cache variable for type metadata for Any?);
    uint64_t v2 = &_swiftEmptyArrayStorage;
  }
  uint64_t v3 = *(uint64_t (**)(_OWORD *))(v0 + 8);
  return v3(v2);
}

unint64_t lazy protocol witness table accessor for type SiriSuggestionsFeatureFlags and conformance SiriSuggestionsFeatureFlags()
{
  unint64_t result = lazy protocol witness table cache variable for type SiriSuggestionsFeatureFlags and conformance SiriSuggestionsFeatureFlags;
  if (!lazy protocol witness table cache variable for type SiriSuggestionsFeatureFlags and conformance SiriSuggestionsFeatureFlags)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SiriSuggestionsFeatureFlags and conformance SiriSuggestionsFeatureFlags);
  }
  return result;
}

uint64_t base witness table accessor for InternalGenerator in InfoServerGenerator(uint64_t a1, uint64_t a2)
{
  return lazy protocol witness table accessor for type DomainOwner and conformance DomainOwner(&lazy protocol witness table cache variable for type InfoServerGenerator and conformance InfoServerGenerator, a2, (void (*)(uint64_t))type metadata accessor for InfoServerGenerator);
}

uint64_t base witness table accessor for Wrappable in InfoServerGenerator(uint64_t a1, uint64_t a2)
{
  return lazy protocol witness table accessor for type DomainOwner and conformance DomainOwner(&lazy protocol witness table cache variable for type InfoServerGenerator and conformance InfoServerGenerator, a2, (void (*)(uint64_t))type metadata accessor for InfoServerGenerator);
}

uint64_t base witness table accessor for InternalResolver in FromContextResolver(uint64_t a1, uint64_t a2)
{
  return lazy protocol witness table accessor for type DomainOwner and conformance DomainOwner(&lazy protocol witness table cache variable for type FromContextResolver and conformance FromContextResolver, a2, (void (*)(uint64_t))type metadata accessor for FromContextResolver);
}

uint64_t type metadata accessor for FromContextResolver()
{
  return self;
}

uint64_t base witness table accessor for Wrappable in FromContextResolver(uint64_t a1, uint64_t a2)
{
  return lazy protocol witness table accessor for type DomainOwner and conformance DomainOwner(&lazy protocol witness table cache variable for type FromContextResolver and conformance FromContextResolver, a2, (void (*)(uint64_t))type metadata accessor for FromContextResolver);
}

uint64_t getEnumTagSinglePayload for SiriSuggestionsFeatureFlags(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for SiriSuggestionsFeatureFlags(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0xC74CLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t getEnumTag for SiriSuggestionsFeatureFlags()
{
  return 0;
}

ValueMetadata *type metadata accessor for SiriSuggestionsFeatureFlags()
{
  return &type metadata for SiriSuggestionsFeatureFlags;
}

uint64_t type metadata accessor for InfoServerSuggestionDefinitionFactory()
{
  return self;
}

uint64_t specialized _ArrayBuffer._copyContents(subRange:initializing:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    unint64_t v6 = a4 + 40 * a1 + 32;
    unint64_t v7 = a3 + 40 * v5;
    if (v6 >= v7 || v6 + 40 * v5 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(a5);
      swift_arrayInitWithCopy();
      return v7;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

_OWORD *outlined init with take of Any(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t lazy protocol witness table accessor for type String and conformance String()
{
  unint64_t result = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
  }
  return result;
}

void *__swift_project_boxed_opaque_existential_1Tm(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t lazy protocol witness table accessor for type DomainOwner and conformance DomainOwner(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_0Tm(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t outlined destroy of Any?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t thunk for @escaping @callee_guaranteed (@in_guaranteed DialogProperties) -> (@out Any)(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t one-time initialization function for resolvers()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Resolver>);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_11570;
  uint64_t v1 = type metadata accessor for SolarEventResolver();
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = 0xD000000000000010;
  *(void *)(v2 + 24) = 0x8000000000011E50;
  *(void *)(v0 + 56) = v1;
  uint64_t result = lazy protocol witness table accessor for type SolarEventResolver and conformance SolarEventResolver(&lazy protocol witness table cache variable for type SolarEventResolver and conformance SolarEventResolver);
  *(void *)(v0 + 64) = result;
  *(void *)(v0 + 32) = v2;
  static InformationSuggestionsResolvableParameter.resolvers = v0;
  return result;
}

uint64_t SolarEventResolver.__allocating_init()()
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0xD000000000000010;
  *(void *)(result + 24) = 0x8000000000011E50;
  return result;
}

uint64_t *InformationSuggestionsResolvableParameter.resolvers.unsafeMutableAddressor()
{
  if (one-time initialization token for resolvers != -1) {
    swift_once();
  }
  return &static InformationSuggestionsResolvableParameter.resolvers;
}

uint64_t static InformationSuggestionsResolvableParameter.resolvers.getter()
{
  if (one-time initialization token for resolvers != -1) {
    swift_once();
  }
  return swift_bridgeObjectRetain();
}

BOOL InformationSuggestionsResolvableParameter.init(rawValue:)(Swift::String string)
{
  object = string._object;
  v2._uint64_t countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of InformationSuggestionsResolvableParameter.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  return v3 != 0;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance InformationSuggestionsResolvableParameter()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance InformationSuggestionsResolvableParameter()
{
  return String.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance InformationSuggestionsResolvableParameter()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance InformationSuggestionsResolvableParameter@<X0>(Swift::String *a1@<X0>, BOOL *a2@<X8>)
{
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of protocol witness for RawRepresentable.init(rawValue:) in conformance InformationSuggestionsResolvableParameter, *a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3 != 0;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance InformationSuggestionsResolvableParameter(void *a1@<X8>)
{
  *a1 = 0xD000000000000010;
  a1[1] = 0x8000000000011E50;
}

uint64_t SolarEventResolver.nightBeginsAtHour.getter()
{
  return 18;
}

uint64_t SolarEventResolver.nightEndsAtHour.getter()
{
  return 6;
}

Swift::Bool __swiftcall SolarEventResolver.isNight(hour:)(Swift::Int hour)
{
  return (unint64_t)(hour - 18) < 0xFFFFFFFFFFFFFFF4;
}

uint64_t SolarEventResolver.resolveParameter(parameter:suggestion:interaction:environment:)()
{
  return _swift_task_switch(SolarEventResolver.resolveParameter(parameter:suggestion:interaction:environment:), 0, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v4;

  uint64_t v1 = specialized SolarEventResolver.resolveParameter()();
  Swift::String v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t SolarEventResolver.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t SolarEventResolver.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t SolarEventResolver.init()()
{
  uint64_t result = v0;
  *(void *)(v0 + 16) = 0xD000000000000010;
  *(void *)(v0 + 24) = 0x8000000000011E50;
  return result;
}

uint64_t specialized SolarEventResolver.resolveParameter()()
{
  uint64_t v0 = type metadata accessor for Calendar.Component();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  Swift::Int v3 = (char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for Calendar();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  unint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Date();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin();
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  Date.init()();
  id v12 = [self currentCalendar];
  static Calendar._unconditionallyBridgeFromObjectiveC(_:)();

  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for Calendar.Component.hour(_:), v0);
  uint64_t v13 = Calendar.component(_:from:)();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
  uint64_t v14 = swift_allocObject();
  uint64_t v15 = v14;
  uint64_t v16 = 0x657369726E7573;
  if ((unint64_t)(v13 - 6) < 0xC) {
    uint64_t v16 = 0x7465736E7573;
  }
  unint64_t v17 = 0xE700000000000000;
  if ((unint64_t)(v13 - 6) < 0xC) {
    unint64_t v17 = 0xE600000000000000;
  }
  *(_OWORD *)(v14 + 16) = xmmword_11570;
  *(void *)(v14 + 56) = &type metadata for String;
  *(void *)(v14 + 32) = v16;
  *(void *)(v14 + 40) = v17;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v15;
}

uint64_t specialized SolarEventResolver.resolveParameter(date:calendar:)()
{
  uint64_t v0 = type metadata accessor for Calendar.Component();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  Swift::Int v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for Calendar.Component.hour(_:), v0);
  uint64_t v4 = Calendar.component(_:from:)();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
  uint64_t result = swift_allocObject();
  *(_OWORD *)(result + 16) = xmmword_11570;
  uint64_t v6 = 0x657369726E7573;
  if ((unint64_t)(v4 - 6) < 0xC) {
    uint64_t v6 = 0x7465736E7573;
  }
  unint64_t v7 = 0xE700000000000000;
  *(void *)(result + 56) = &type metadata for String;
  if ((unint64_t)(v4 - 6) < 0xC) {
    unint64_t v7 = 0xE600000000000000;
  }
  *(void *)(result + 32) = v6;
  *(void *)(result + 40) = v7;
  return result;
}

unint64_t lazy protocol witness table accessor for type InformationSuggestionsResolvableParameter and conformance InformationSuggestionsResolvableParameter()
{
  unint64_t result = lazy protocol witness table cache variable for type InformationSuggestionsResolvableParameter and conformance InformationSuggestionsResolvableParameter;
  if (!lazy protocol witness table cache variable for type InformationSuggestionsResolvableParameter and conformance InformationSuggestionsResolvableParameter)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type InformationSuggestionsResolvableParameter and conformance InformationSuggestionsResolvableParameter);
  }
  return result;
}

uint64_t base witness table accessor for InternalResolver in SolarEventResolver()
{
  return lazy protocol witness table accessor for type SolarEventResolver and conformance SolarEventResolver(&lazy protocol witness table cache variable for type SolarEventResolver and conformance SolarEventResolver);
}

uint64_t type metadata accessor for SolarEventResolver()
{
  return self;
}

uint64_t base witness table accessor for Wrappable in SolarEventResolver()
{
  return lazy protocol witness table accessor for type SolarEventResolver and conformance SolarEventResolver(&lazy protocol witness table cache variable for type SolarEventResolver and conformance SolarEventResolver);
}

unsigned char *storeEnumTagSinglePayload for InformationSuggestionsResolvableParameter(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0xD54CLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for InformationSuggestionsResolvableParameter()
{
  return &type metadata for InformationSuggestionsResolvableParameter;
}

uint64_t lazy protocol witness table accessor for type SolarEventResolver and conformance SolarEventResolver(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for SolarEventResolver();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t Logger.suggestions.unsafeMutableAddressor()
{
  if (one-time initialization token for suggestions != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  return __swift_project_value_buffer(v0, (uint64_t)static Logger.suggestions);
}

void *Logger.subsystem.unsafeMutableAddressor()
{
  return &static Logger.subsystem;
}

unint64_t static Logger.subsystem.getter()
{
  return 0xD000000000000010;
}

uint64_t one-time initialization function for suggestions()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Logger.suggestions);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.suggestions);
  type metadata accessor for OS_os_log();
  OS_os_log.init(subsystem:category:)();
  return Logger.init(_:)();
}

uint64_t static Logger.suggestions.getter@<X0>(uint64_t a1@<X8>)
{
  if (one-time initialization token for suggestions != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)static Logger.suggestions);
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

ValueMetadata *type metadata accessor for Logger()
{
  return &type metadata for Logger;
}

unint64_t type metadata accessor for OS_os_log()
{
  unint64_t result = lazy cache variable for type metadata for OS_os_log;
  if (!lazy cache variable for type metadata for OS_os_log)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for OS_os_log);
  }
  return result;
}

ValueMetadata *type metadata accessor for ParsecAlias()
{
  return &type metadata for ParsecAlias;
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, Any>);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    outlined init with copy of (String, Any)(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)outlined init with take of Any(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

{
  void *v2;
  uint64_t v3;
  void *v4;
  char v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;

  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<InformationSuggestion, [Signal]>);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void *)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *((unsigned char *)v4 - 8);
    uint64_t v6 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(v5);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(unsigned char *)(v2[6] + result) = v5;
    *(void *)(v2[7] + 8 * result) = v6;
    uint64_t v9 = v2[2];
    char v10 = __OFADD__(v9, 1);
    uint64_t v11 = v9 + 1;
    if (v10) {
      goto LABEL_11;
    }
    v2[2] = v11;
    v4 += 2;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t one-time initialization function for kOwner()
{
  type metadata accessor for DomainOwner();
  swift_allocObject();
  uint64_t result = DomainOwner.init(_:)();
  static InformationSuggestionsPluginOwnerDefinitionFactory.kOwner = result;
  return result;
}

uint64_t *InformationSuggestionsPluginOwnerDefinitionFactory.kOwner.unsafeMutableAddressor()
{
  if (one-time initialization token for kOwner != -1) {
    swift_once();
  }
  return &static InformationSuggestionsPluginOwnerDefinitionFactory.kOwner;
}

uint64_t static InformationSuggestionsPluginOwnerDefinitionFactory.kOwner.getter()
{
  if (one-time initialization token for kOwner != -1) {
    swift_once();
  }
  return swift_retain();
}

void *InformationSuggestionsPluginOwnerDefinitionFactory.kTemplateRoot.unsafeMutableAddressor()
{
  return &static InformationSuggestionsPluginOwnerDefinitionFactory.kTemplateRoot;
}

unint64_t static InformationSuggestionsPluginOwnerDefinitionFactory.kTemplateRoot.getter()
{
  return 0xD000000000000054;
}

uint64_t static InformationSuggestionsPluginOwnerDefinitionFactory.createOwnerDefinitions(builderFactory:)(uint64_t a1, uint64_t a2)
{
  v3[14] = a2;
  v3[15] = v2;
  v3[13] = a1;
  return _swift_task_switch(static InformationSuggestionsPluginOwnerDefinitionFactory.createOwnerDefinitions(builderFactory:), 0, 0);
}

uint64_t static InformationSuggestionsPluginOwnerDefinitionFactory.createOwnerDefinitions(builderFactory:)()
{
  if (one-time initialization token for kOwnerInformation != -1) {
    swift_once();
  }
  uint64_t v1 = (int *)v0[13];
  uint64_t v2 = static SuggestionConstants.kOwnerInformation;
  v0[5] = type metadata accessor for DomainOwner();
  v0[6] = _s18SiriSuggestionsKit11DomainOwnerCAcA0E0AAWlTm_0(&lazy protocol witness table cache variable for type DomainOwner and conformance DomainOwner, (void (*)(uint64_t))&type metadata accessor for DomainOwner);
  v0[2] = v2;
  uint64_t v5 = (uint64_t (*)(void *))((char *)v1 + *v1);
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[16] = v3;
  *uint64_t v3 = v0;
  v3[1] = static InformationSuggestionsPluginOwnerDefinitionFactory.createOwnerDefinitions(builderFactory:);
  return v5(v0 + 2);
}

{
  void *v0;
  void *v1;
  uint64_t v2;
  char *v3;
  char v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  Swift::String v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  uint64_t v1 = v0;
  uint64_t v2 = 20;
  uint64_t v3 = &byte_14A18;
  do
  {
    uint64_t v16 = v1[15];
    uint64_t v4 = *v3++;
    uint64_t v5 = specialized static InformationSuggestionsPluginOwnerDefinitionFactory.enabledLocales(for:)(v4);
    uint64_t v6 = InformationSuggestion.rawValue.getter(v4);
    uint64_t v8 = v7;
    _StringGuts.grow(_:)(25);
    swift_bridgeObjectRelease();
    v9._uint64_t countAndFlagsBits = v6;
    v9._object = v8;
    String.append(_:)(v9);
    swift_bridgeObjectRelease();
    char v10 = swift_task_alloc();
    *(unsigned char *)(v10 + 16) = v4;
    *(void *)(v10 + 24) = v5;
    *(void *)(v10 + 32) = v16;
    dispatch thunk of SuggestionOwnerDefinitionBuilder.add(suggestionId:catId:builder:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    --v2;
  }
  while (v2);
  dispatch thunk of SuggestionOwnerDefinitionBuilder.build()();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<OwnerDefinition>);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_11570;
  outlined init with copy of CandidateSuggestion((uint64_t)(v1 + 7), v11 + 32);
  v1[12] = v11;
  type metadata accessor for InfoServerSuggestionDefinitionFactory();
  uint64_t v12 = (void *)swift_task_alloc();
  v1[18] = v12;
  *uint64_t v12 = v1;
  v12[1] = static InformationSuggestionsPluginOwnerDefinitionFactory.createOwnerDefinitions(builderFactory:);
  BOOL v13 = v1[14];
  uint64_t v14 = v1[13];
  return static InfoServerSuggestionDefinitionFactory.createOwnerDefinitions(builderFactory:)(v14, v13);
}

{
  void *v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v4;

  specialized Array.append<A>(contentsOf:)(v0[19]);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 7));
  uint64_t v1 = v0[12];
  uint64_t v2 = (uint64_t (*)(uint64_t))v0[1];
  return v2(v1);
}

uint64_t static InformationSuggestionsPluginOwnerDefinitionFactory.createOwnerDefinitions(builderFactory:)(uint64_t a1)
{
  uint64_t v2 = *(void *)v1 + 16;
  *(void *)(*(void *)v1 + 136) = a1;
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1Tm(v2);
  return _swift_task_switch(static InformationSuggestionsPluginOwnerDefinitionFactory.createOwnerDefinitions(builderFactory:), 0, 0);
}

{
  uint64_t v1;
  uint64_t v3;

  *(void *)(*(void *)v1 + 152) = a1;
  swift_task_dealloc();
  return _swift_task_switch(static InformationSuggestionsPluginOwnerDefinitionFactory.createOwnerDefinitions(builderFactory:), 0, 0);
}

_UNKNOWN **static InformationSuggestion.allCases.getter()
{
  return &outlined read-only object #0 of static InformationSuggestion.allCases.getter;
}

unint64_t InformationSuggestion.rawValue.getter(char a1)
{
  unint64_t result = 0xD000000000000014;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000018;
      break;
    case 2:
      unint64_t result = 0xD000000000000013;
      break;
    case 3:
      unint64_t result = 0xD000000000000014;
      break;
    case 4:
      unint64_t result = 0xD000000000000015;
      break;
    case 5:
      unint64_t result = 0xD000000000000015;
      break;
    case 6:
      unint64_t result = 0xD000000000000016;
      break;
    case 7:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 8:
      unint64_t result = 0xD000000000000019;
      break;
    case 9:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 10:
      unint64_t result = 0xD000000000000016;
      break;
    case 11:
      unint64_t result = 0xD000000000000018;
      break;
    case 12:
      unint64_t result = 0x6165536C61636F6CLL;
      break;
    case 13:
      unint64_t result = 0xD000000000000018;
      break;
    case 14:
      unint64_t result = 1937204590;
      break;
    case 15:
    case 16:
    case 17:
      unint64_t result = 0xD000000000000011;
      break;
    case 18:
      unint64_t result = 0xD000000000000017;
      break;
    case 19:
      unint64_t result = 0xD000000000000015;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t InformationSuggestion.catIdentifier.getter(char a1)
{
  _StringGuts.grow(_:)(25);
  swift_bridgeObjectRelease();
  v2._uint64_t countAndFlagsBits = InformationSuggestion.rawValue.getter(a1);
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  return 0xD000000000000017;
}

uint64_t closure #1 in closure #1 in static InformationSuggestionsPluginOwnerDefinitionFactory.createOwnerDefinitions(builderFactory:)(uint64_t a1, char a2)
{
  outlined init with copy of Decodable & Encodable & Sendable(a1, (uint64_t)v57);
  uint64_t v4 = *(void *)v58;
  long long v29 = *(_OWORD *)&v58[8];
  __swift_project_boxed_opaque_existential_1Tm(v57, *(uint64_t *)v58);
  if (one-time initialization token for signals != -1) {
    swift_once();
  }
  long long v27 = (void *)a1;
  char v28 = a2;
  if (*(void *)((char *)&dword_10 + (void)static InformationSuggestionSignals.signals))
  {
    specialized __RawDictionaryStorage.find<A>(_:)(a2);
    if (v5) {
      swift_bridgeObjectRetain();
    }
  }
  *(void *)uint64_t v56 = v4;
  *(_OWORD *)&v56[8] = v29;
  __swift_allocate_boxed_opaque_existential_0Tm(v55);
  dispatch thunk of SiriHelpSuggestionDetailsBuilderExtension.register(signals:)();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)&v56[16];
  long long v30 = *(_OWORD *)v56;
  __swift_project_boxed_opaque_existential_1Tm(v55, *(uint64_t *)v56);
  long long v53 = v30;
  uint64_t v54 = v6;
  __swift_allocate_boxed_opaque_existential_0Tm(v52);
  dispatch thunk of SuggestionDetailsBuilder.enabledLocales(_:)();
  uint64_t v7 = v54;
  long long v31 = v53;
  __swift_project_boxed_opaque_existential_1Tm(v52, v53);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<DeviceType>);
  uint64_t v8 = type metadata accessor for DeviceType();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 72);
  unint64_t v11 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_11A80;
  unint64_t v13 = v12 + v11;
  uint64_t v14 = *(void (**)(unint64_t, void, uint64_t))(v9 + 104);
  v14(v13, enum case for DeviceType.iPhone(_:), v8);
  v14(v13 + v10, enum case for DeviceType.iPad(_:), v8);
  v14(v13 + 2 * v10, enum case for DeviceType.mac(_:), v8);
  long long v50 = v31;
  uint64_t v51 = v7;
  __swift_allocate_boxed_opaque_existential_0Tm(v49);
  dispatch thunk of SuggestionDetailsBuilder.enabledDevices(_:)();
  swift_bridgeObjectRelease();
  uint64_t v15 = v51;
  long long v32 = v50;
  __swift_project_boxed_opaque_existential_1Tm(v49, v50);
  unint64_t v16 = InformationSuggestion.rawValue.getter(v28);
  uint64_t v18 = v17;
  long long v47 = v32;
  uint64_t v48 = v15;
  __swift_allocate_boxed_opaque_existential_0Tm(v46);
  dispatch thunk of SuggestionDetailsBuilder.loggingIdentifier(_:)();
  swift_bridgeObjectRelease();
  uint64_t v19 = v48;
  long long v33 = v47;
  __swift_project_boxed_opaque_existential_1Tm(v46, v47);
  long long v44 = v33;
  uint64_t v45 = v19;
  __swift_allocate_boxed_opaque_existential_0Tm(v43);
  dispatch thunk of SuggestionDetailsBuilder.requiresNetworkConnection()();
  uint64_t v20 = v45;
  long long v34 = v44;
  __swift_project_boxed_opaque_existential_1Tm(v43, v44);
  long long v41 = v34;
  uint64_t v42 = v20;
  __swift_allocate_boxed_opaque_existential_0Tm(v40);
  dispatch thunk of SuggestionDetailsBuilder.templateRoot(_:)();
  uint64_t v21 = v42;
  long long v35 = v41;
  __swift_project_boxed_opaque_existential_1Tm(v40, v41);
  long long v38 = v35;
  uint64_t v39 = v21;
  __swift_allocate_boxed_opaque_existential_0Tm(v37);
  dispatch thunk of SuggestionDetailsBuilder.exampleUtteranceDialogId(_:)();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v37);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v40);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v43);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v46);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v49);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v52);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v55);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v57);
  if (v16 == 0xD000000000000011 && v18 == 0x80000000000120F0)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v22 = _stringCompareWithSmolCheck(_:_:expecting:)();
    uint64_t result = swift_bridgeObjectRelease();
    if ((v22 & 1) == 0) {
      return result;
    }
  }
  uint64_t v24 = v27[5];
  long long v36 = *(_OWORD *)(v27 + 3);
  __swift_project_boxed_opaque_existential_1Tm(v27, v27[3]);
  uint64_t v25 = type metadata accessor for SolarEventResolver();
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = 0xD000000000000010;
  *(void *)(v26 + 24) = 0x8000000000011E50;
  *(void *)uint64_t v56 = v25;
  *(void *)&v56[8] = _s18SiriSuggestionsKit11DomainOwnerCAcA0E0AAWlTm_0(&lazy protocol witness table cache variable for type SolarEventResolver and conformance SolarEventResolver, (void (*)(uint64_t))type metadata accessor for SolarEventResolver);
  v55[0] = v26;
  type metadata accessor for ResolvableParameter();
  ResolvableParameter.__allocating_init(typeIdentifier:required:)();
  *(_OWORD *)uint64_t v58 = v36;
  *(void *)&v58[16] = v24;
  __swift_allocate_boxed_opaque_existential_0Tm(v57);
  SuggestionDetailsBuilder.parameter(parameterName:resolver:resolveParam:)();
  swift_release();
  outlined destroy of Resolver?((uint64_t)v55);
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v57);
}

uint64_t specialized Array.append<A>(contentsOf:)(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *((void *)*v1 + 2);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *((void *)v3 + 3) >> 1)
  {
    unint64_t v8 = *(void *)(a1 + 16);
    if (v8) {
      goto LABEL_5;
    }
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (v4 <= v5) {
    int64_t v15 = v4 + v2;
  }
  else {
    int64_t v15 = v4;
  }
  uint64_t v3 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = *((void *)v3 + 2);
  if ((*((void *)v3 + 3) >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v10 = (unint64_t)&v3[40 * v9 + 32];
  if (a1 + 32 < v10 + 40 * v8 && v10 < a1 + 32 + 40 * v8) {
    goto LABEL_24;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for OwnerDefinition);
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v12 = *((void *)v3 + 2);
  BOOL v13 = __OFADD__(v12, v8);
  uint64_t v14 = v12 + v8;
  if (!v13)
  {
    *((void *)v3 + 2) = v14;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t protocol witness for static OwnerDefinitionFactory.createOwnerDefinitions(builderFactory:) in conformance InformationSuggestionsPluginOwnerDefinitionFactory(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *uint64_t v6 = v3;
  v6[1] = protocol witness for InternalResolver.resolveParameter(parameter:suggestion:interaction:environment:) in conformance FromContextResolver;
  v6[14] = a2;
  v6[15] = v2;
  v6[13] = a1;
  return _swift_task_switch(static InformationSuggestionsPluginOwnerDefinitionFactory.createOwnerDefinitions(builderFactory:), 0, 0);
}

unint64_t AppBundleIdentifier.rawValue.getter(char a1)
{
  unint64_t result = 0xD000000000000013;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000016;
      break;
    case 2:
    case 4:
    case 5:
      unint64_t result = 0x6C7070612E6D6F63;
      break;
    case 3:
      unint64_t result = 0xD000000000000014;
      break;
    case 6:
      unint64_t result = 0xD000000000000011;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance AppBundleIdentifier(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static Equatable.== infix(_:_:) in conformance AppBundleIdentifier(a1, a2, a3, a4, (uint64_t (*)(uint64_t))AppBundleIdentifier.rawValue.getter);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance AppBundleIdentifier(uint64_t a1, uint64_t a2)
{
  return protocol witness for Hashable.hashValue.getter in conformance AppBundleIdentifier(a1, a2, (void (*)(uint64_t))AppBundleIdentifier.rawValue.getter);
}

uint64_t protocol witness for Hashable.hash(into:) in conformance AppBundleIdentifier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return protocol witness for Hashable.hash(into:) in conformance AppBundleIdentifier(a1, a2, a3, (void (*)(void))AppBundleIdentifier.rawValue.getter);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance AppBundleIdentifier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return protocol witness for Hashable._rawHashValue(seed:) in conformance AppBundleIdentifier(a1, a2, a3, (void (*)(uint64_t))AppBundleIdentifier.rawValue.getter);
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance AppBundleIdentifier@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = specialized AppBundleIdentifier.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

unint64_t protocol witness for RawRepresentable.rawValue.getter in conformance AppBundleIdentifier@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = AppBundleIdentifier.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t InformationSuggestion.appBundleIdentifier.getter(unsigned __int8 a1)
{
  int v1 = a1;
  unint64_t result = 0xD000000000000014;
  switch(v1)
  {
    case 0:
    case 1:
      return result;
    case 15:
    case 16:
      unint64_t result = 0xD000000000000011;
      break;
    default:
      unint64_t result = 0x6C7070612E6D6F63;
      break;
  }
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance InformationSuggestion(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4)
{
  return protocol witness for static Equatable.== infix(_:_:) in conformance AppBundleIdentifier(a1, a2, a3, a4, (uint64_t (*)(uint64_t))InformationSuggestion.rawValue.getter);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance AppBundleIdentifier(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  uint64_t v6 = *a2;
  uint64_t v7 = a5(*a1);
  uint64_t v9 = v8;
  if (v7 == a5(v6) && v9 == v10) {
    char v12 = 1;
  }
  else {
    char v12 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v12 & 1;
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance InformationSuggestion@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = specialized InformationSuggestion.init(rawValue:)();
  *a1 = result;
  return result;
}

unint64_t protocol witness for RawRepresentable.rawValue.getter in conformance InformationSuggestion@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = InformationSuggestion.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void protocol witness for static CaseIterable.allCases.getter in conformance InformationSuggestion(void *a1@<X8>)
{
  *a1 = &outlined read-only object #0 of static InformationSuggestion.allCases.getter;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance InformationSuggestion(uint64_t a1, uint64_t a2)
{
  return protocol witness for Hashable.hashValue.getter in conformance AppBundleIdentifier(a1, a2, (void (*)(uint64_t))InformationSuggestion.rawValue.getter);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance AppBundleIdentifier(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v5 = *v3;
  Hasher.init(_seed:)();
  a3(v5);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance InformationSuggestion(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return protocol witness for Hashable.hash(into:) in conformance AppBundleIdentifier(a1, a2, a3, (void (*)(void))InformationSuggestion.rawValue.getter);
}

uint64_t protocol witness for Hashable.hash(into:) in conformance AppBundleIdentifier(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  a4(*v4);
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance InformationSuggestion(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return protocol witness for Hashable._rawHashValue(seed:) in conformance AppBundleIdentifier(a1, a2, a3, (void (*)(uint64_t))InformationSuggestion.rawValue.getter);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance AppBundleIdentifier(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v6 = *v4;
  Hasher.init(_seed:)();
  a4(v6);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t one-time initialization function for calendar(uint64_t a1)
{
  return one-time initialization function for calendar(a1, 0xD000000000000013, 0x8000000000011E70, &static InformationSuggestionSignals.calendar);
}

uint64_t one-time initialization function for deviceLocked()
{
  type metadata accessor for Signal();
  uint64_t result = static Signal.DeviceLocked.getter();
  static InformationSuggestionSignals.deviceLocked = result;
  return result;
}

uint64_t one-time initialization function for fallback()
{
  type metadata accessor for Signal();
  uint64_t result = static Signal.Fallback.getter();
  static InformationSuggestionSignals.fallback = result;
  return result;
}

uint64_t one-time initialization function for homescreen()
{
  type metadata accessor for Signal();
  uint64_t result = static Signal.HomeScreen.getter();
  static InformationSuggestionSignals.homescreen = result;
  return result;
}

uint64_t one-time initialization function for maps(uint64_t a1)
{
  return one-time initialization function for maps(a1, 0xEE007370614D2E65, &static InformationSuggestionSignals.maps);
}

uint64_t one-time initialization function for safari(uint64_t a1)
{
  return one-time initialization function for calendar(a1, 0xD000000000000016, 0x8000000000011E90, &static InformationSuggestionSignals.safari);
}

uint64_t one-time initialization function for calendar(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  type metadata accessor for Signal();
  uint64_t v5 = type metadata accessor for CoreSignalTypes();
  v8[3] = v5;
  v8[4] = _s18SiriSuggestionsKit11DomainOwnerCAcA0E0AAWlTm_0(&lazy protocol witness table cache variable for type CoreSignalTypes and conformance CoreSignalTypes, (void (*)(uint64_t))&type metadata accessor for CoreSignalTypes);
  boxed_opaque_existential_0Tm = __swift_allocate_boxed_opaque_existential_0Tm(v8);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v5 - 8) + 104))(boxed_opaque_existential_0Tm, enum case for CoreSignalTypes.app(_:), v5);
  uint64_t result = Signal.__allocating_init(signalType:signalValue:fallbackSignals:)();
  *a4 = result;
  return result;
}

uint64_t one-time initialization function for weather(uint64_t a1)
{
  return one-time initialization function for calendar(a1, 0xD000000000000011, 0x8000000000011F00, &static InformationSuggestionSignals.weather);
}

uint64_t one-time initialization function for news(uint64_t a1)
{
  return one-time initialization function for maps(a1, 0xEE007377656E2E65, &static InformationSuggestionSignals.news);
}

uint64_t one-time initialization function for maps(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4 = type metadata accessor for CoreSignalTypes();
  v7[3] = v4;
  v7[4] = _s18SiriSuggestionsKit11DomainOwnerCAcA0E0AAWlTm_0(&lazy protocol witness table cache variable for type CoreSignalTypes and conformance CoreSignalTypes, (void (*)(uint64_t))&type metadata accessor for CoreSignalTypes);
  boxed_opaque_existential_0Tm = __swift_allocate_boxed_opaque_existential_0Tm(v7);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v4 - 8) + 104))(boxed_opaque_existential_0Tm, enum case for CoreSignalTypes.app(_:), v4);
  type metadata accessor for Signal();
  uint64_t result = Signal.__allocating_init(signalType:signalValue:fallbackSignals:)();
  *a3 = result;
  return result;
}

int *one-time initialization function for signals()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(InformationSuggestion, [Signal])>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_11A90;
  *(unsigned char *)(inited + 32) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_11AA0;
  if (one-time initialization token for deviceLocked != -1) {
    swift_once();
  }
  *(void *)(v1 + 32) = static InformationSuggestionSignals.deviceLocked;
  uint64_t v2 = one-time initialization token for fallback;
  swift_retain();
  if (v2 != -1) {
    swift_once();
  }
  *(void *)(v1 + 40) = static InformationSuggestionSignals.fallback;
  uint64_t v3 = one-time initialization token for homescreen;
  swift_retain();
  if (v3 != -1) {
    swift_once();
  }
  *(void *)(v1 + 48) = static InformationSuggestionSignals.homescreen;
  uint64_t v4 = one-time initialization token for safari;
  swift_retain();
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v5 = static InformationSuggestionSignals.safari;
  *(void *)(v1 + 56) = static InformationSuggestionSignals.safari;
  specialized Array._endMutation()();
  *(void *)(inited + 40) = v1;
  *(unsigned char *)(inited + 48) = 1;
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_11AB0;
  uint64_t v7 = static InformationSuggestionSignals.deviceLocked;
  uint64_t v8 = static InformationSuggestionSignals.fallback;
  *(void *)(v6 + 32) = static InformationSuggestionSignals.deviceLocked;
  *(void *)(v6 + 40) = v8;
  uint64_t v9 = static InformationSuggestionSignals.homescreen;
  *(void *)(v6 + 48) = static InformationSuggestionSignals.homescreen;
  uint64_t v48 = v6;
  specialized Array._endMutation()();
  *(void *)(inited + 56) = v48;
  *(unsigned char *)(inited + 64) = 2;
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_11AB0;
  *(void *)(v10 + 32) = v8;
  *(void *)(v10 + 40) = v9;
  *(void *)(v10 + 48) = v5;
  uint64_t v49 = v10;
  specialized Array._endMutation()();
  *(void *)(inited + 72) = v49;
  *(unsigned char *)(inited + 80) = 3;
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_11AC0;
  *(void *)(v11 + 32) = v8;
  *(void *)(v11 + 40) = v9;
  uint64_t v50 = v11;
  swift_retain();
  swift_retain();
  specialized Array._endMutation()();
  *(void *)(inited + 88) = v50;
  *(unsigned char *)(inited + 96) = 4;
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_11AA0;
  *(void *)(v12 + 32) = v7;
  *(void *)(v12 + 40) = v8;
  *(void *)(v12 + 48) = v9;
  *(void *)(v12 + 56) = v5;
  uint64_t v51 = v12;
  swift_retain();
  swift_retain();
  swift_retain();
  specialized Array._endMutation()();
  *(void *)(inited + 104) = v51;
  *(unsigned char *)(inited + 112) = 5;
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_11AB0;
  *(void *)(v13 + 32) = v7;
  *(void *)(v13 + 40) = v8;
  *(void *)(v13 + 48) = v9;
  uint64_t v52 = v13;
  swift_retain();
  swift_retain();
  swift_retain();
  specialized Array._endMutation()();
  *(void *)(inited + 120) = v52;
  *(unsigned char *)(inited + 128) = 6;
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_11AC0;
  *(void *)(v14 + 32) = v8;
  *(void *)(v14 + 40) = v9;
  uint64_t v53 = v14;
  swift_retain();
  swift_retain();
  specialized Array._endMutation()();
  *(void *)(inited + 136) = v53;
  *(unsigned char *)(inited + 144) = 7;
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_11AB0;
  uint64_t v16 = one-time initialization token for calendar;
  swift_retain_n();
  swift_retain_n();
  swift_retain_n();
  swift_retain_n();
  if (v16 != -1) {
    swift_once();
  }
  uint64_t v17 = static InformationSuggestionSignals.fallback;
  *(void *)(v15 + 32) = static InformationSuggestionSignals.calendar;
  *(void *)(v15 + 40) = v17;
  uint64_t v18 = static InformationSuggestionSignals.homescreen;
  *(void *)(v15 + 48) = static InformationSuggestionSignals.homescreen;
  specialized Array._endMutation()();
  *(void *)(inited + 152) = v15;
  *(unsigned char *)(inited + 160) = 8;
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_11AA0;
  uint64_t v20 = static InformationSuggestionSignals.deviceLocked;
  *(void *)(v19 + 32) = static InformationSuggestionSignals.deviceLocked;
  *(void *)(v19 + 40) = v17;
  uint64_t v21 = static InformationSuggestionSignals.safari;
  *(void *)(v19 + 48) = v18;
  *(void *)(v19 + 56) = v21;
  uint64_t v54 = v19;
  specialized Array._endMutation()();
  *(void *)(inited + 168) = v54;
  *(unsigned char *)(inited + 176) = 9;
  uint64_t v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_11AA0;
  *(void *)(v22 + 32) = v20;
  *(void *)(v22 + 40) = v17;
  *(void *)(v22 + 48) = v18;
  *(void *)(v22 + 56) = v21;
  uint64_t v55 = v22;
  swift_retain();
  swift_retain();
  specialized Array._endMutation()();
  *(void *)(inited + 184) = v55;
  *(unsigned char *)(inited + 192) = 10;
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_11AD0;
  *(void *)(v23 + 32) = v20;
  *(void *)(v23 + 40) = v17;
  *(void *)(v23 + 48) = v18;
  uint64_t v24 = one-time initialization token for maps;
  swift_retain_n();
  swift_retain_n();
  swift_retain_n();
  swift_retain_n();
  swift_retain();
  if (v24 != -1) {
    swift_once();
  }
  uint64_t v25 = static InformationSuggestionSignals.maps;
  uint64_t v26 = static InformationSuggestionSignals.safari;
  *(void *)(v23 + 56) = static InformationSuggestionSignals.maps;
  *(void *)(v23 + 64) = v26;
  specialized Array._endMutation()();
  *(void *)(inited + 200) = v23;
  *(unsigned char *)(inited + 208) = 11;
  uint64_t v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_11AA0;
  uint64_t v28 = static InformationSuggestionSignals.deviceLocked;
  uint64_t v29 = static InformationSuggestionSignals.fallback;
  *(void *)(v27 + 32) = static InformationSuggestionSignals.deviceLocked;
  *(void *)(v27 + 40) = v29;
  uint64_t v30 = static InformationSuggestionSignals.homescreen;
  *(void *)(v27 + 48) = static InformationSuggestionSignals.homescreen;
  *(void *)(v27 + 56) = v26;
  uint64_t v56 = v27;
  specialized Array._endMutation()();
  *(void *)(inited + 216) = v56;
  *(unsigned char *)(inited + 224) = 12;
  uint64_t v31 = swift_allocObject();
  *(_OWORD *)(v31 + 16) = xmmword_11AA0;
  *(void *)(v31 + 32) = v28;
  *(void *)(v31 + 40) = v29;
  *(void *)(v31 + 48) = v30;
  *(void *)(v31 + 56) = v25;
  uint64_t v57 = v31;
  specialized Array._endMutation()();
  *(void *)(inited + 232) = v57;
  *(unsigned char *)(inited + 240) = 13;
  uint64_t v32 = swift_allocObject();
  *(_OWORD *)(v32 + 16) = xmmword_11AC0;
  *(void *)(v32 + 32) = v29;
  *(void *)(v32 + 40) = v30;
  uint64_t v58 = v32;
  swift_retain();
  swift_retain();
  specialized Array._endMutation()();
  *(void *)(inited + 248) = v58;
  *(unsigned char *)(inited + 256) = 14;
  uint64_t v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_11AA0;
  *(void *)(v33 + 32) = v28;
  *(void *)(v33 + 40) = v29;
  *(void *)(v33 + 48) = v30;
  uint64_t v34 = one-time initialization token for news;
  swift_retain_n();
  swift_retain_n();
  swift_retain_n();
  swift_retain_n();
  swift_retain_n();
  if (v34 != -1) {
    swift_once();
  }
  *(void *)(v33 + 56) = static InformationSuggestionSignals.news;
  specialized Array._endMutation()();
  *(void *)(inited + 264) = v33;
  *(unsigned char *)(inited + 272) = 15;
  uint64_t v35 = swift_allocObject();
  *(_OWORD *)(v35 + 16) = xmmword_11AB0;
  uint64_t v36 = static InformationSuggestionSignals.homescreen;
  *(void *)(v35 + 32) = static InformationSuggestionSignals.deviceLocked;
  *(void *)(v35 + 40) = v36;
  uint64_t v37 = one-time initialization token for weather;
  swift_retain();
  swift_retain();
  swift_retain();
  if (v37 != -1) {
    swift_once();
  }
  uint64_t v38 = static InformationSuggestionSignals.weather;
  *(void *)(v35 + 48) = static InformationSuggestionSignals.weather;
  specialized Array._endMutation()();
  *(void *)(inited + 280) = v35;
  *(unsigned char *)(inited + 288) = 16;
  uint64_t v39 = swift_allocObject();
  *(_OWORD *)(v39 + 16) = xmmword_11AE0;
  uint64_t v40 = static InformationSuggestionSignals.deviceLocked;
  *(void *)(v39 + 32) = v38;
  *(void *)(v39 + 40) = v40;
  uint64_t v41 = static InformationSuggestionSignals.homescreen;
  uint64_t v42 = static InformationSuggestionSignals.fallback;
  *(void *)(v39 + 48) = static InformationSuggestionSignals.homescreen;
  *(void *)(v39 + 56) = v42;
  uint64_t v43 = static InformationSuggestionSignals.calendar;
  *(void *)(v39 + 64) = static InformationSuggestionSignals.safari;
  *(void *)(v39 + 72) = v43;
  uint64_t v59 = v39;
  specialized Array._endMutation()();
  *(void *)(inited + 296) = v59;
  *(unsigned char *)(inited + 304) = 17;
  uint64_t v44 = swift_allocObject();
  *(_OWORD *)(v44 + 16) = xmmword_11AB0;
  *(void *)(v44 + 32) = v40;
  *(void *)(v44 + 40) = v41;
  *(void *)(v44 + 48) = v42;
  uint64_t v60 = v44;
  specialized Array._endMutation()();
  *(void *)(inited + 312) = v60;
  *(unsigned char *)(inited + 320) = 18;
  uint64_t v45 = swift_allocObject();
  *(_OWORD *)(v45 + 16) = xmmword_11AB0;
  *(void *)(v45 + 32) = v40;
  *(void *)(v45 + 40) = v41;
  *(void *)(v45 + 48) = v42;
  uint64_t v61 = v45;
  swift_retain();
  swift_retain();
  swift_retain();
  specialized Array._endMutation()();
  *(void *)(inited + 328) = v61;
  *(unsigned char *)(inited + 336) = 19;
  uint64_t v46 = swift_allocObject();
  *(_OWORD *)(v46 + 16) = xmmword_11AB0;
  *(void *)(v46 + 32) = v40;
  *(void *)(v46 + 40) = v41;
  *(void *)(v46 + 48) = v42;
  uint64_t v62 = v46;
  swift_retain();
  swift_retain();
  swift_retain();
  specialized Array._endMutation()();
  *(void *)(inited + 344) = v62;
  swift_retain_n();
  swift_retain_n();
  swift_retain_n();
  swift_retain_n();
  swift_retain();
  swift_retain();
  uint64_t result = (int *)specialized Dictionary.init(dictionaryLiteral:)(inited);
  static InformationSuggestionSignals.signals = result;
  return result;
}

uint64_t specialized static InformationSuggestionsPluginOwnerDefinitionFactory.enabledLocales(for:)(char a1)
{
  unint64_t v2 = InformationSuggestion.rawValue.getter(a1);
  uint64_t v3 = v1;
  if (v2 == 0xD000000000000011 && v1 == 0x8000000000012110) {
    goto LABEL_3;
  }
  char v4 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v4) {
    goto LABEL_8;
  }
  if (v2 == 0xD000000000000017 && v3 == 0x8000000000012130)
  {
LABEL_3:
    swift_bridgeObjectRelease();
LABEL_8:
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Locale>);
    type metadata accessor for Locale();
    uint64_t v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_11570;
LABEL_9:
    Locale.init(identifier:)();
    return v6;
  }
  char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v5) {
    goto LABEL_8;
  }
  if (v2 == 0xD000000000000015 && v3 == 0x8000000000012150)
  {
    swift_bridgeObjectRelease();
LABEL_15:
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Locale>);
    type metadata accessor for Locale();
    uint64_t v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_11B00;
    Locale.init(identifier:)();
    goto LABEL_9;
  }
  char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v8) {
    goto LABEL_15;
  }
  if (v2 == 0xD000000000000019 && v3 == 0x8000000000012020)
  {
    swift_bridgeObjectRelease();
LABEL_20:
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Locale>);
    type metadata accessor for Locale();
    uint64_t v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_11AF0;
    Locale.init(identifier:)();
    Locale.init(identifier:)();
    Locale.init(identifier:)();
    Locale.init(identifier:)();
    Locale.init(identifier:)();
    Locale.init(identifier:)();
    Locale.init(identifier:)();
    Locale.init(identifier:)();
    Locale.init(identifier:)();
    Locale.init(identifier:)();
    Locale.init(identifier:)();
    Locale.init(identifier:)();
    Locale.init(identifier:)();
    Locale.init(identifier:)();
    Locale.init(identifier:)();
    Locale.init(identifier:)();
    Locale.init(identifier:)();
    Locale.init(identifier:)();
    Locale.init(identifier:)();
    Locale.init(identifier:)();
    Locale.init(identifier:)();
    Locale.init(identifier:)();
    Locale.init(identifier:)();
    Locale.init(identifier:)();
    Locale.init(identifier:)();
    Locale.init(identifier:)();
    Locale.init(identifier:)();
    Locale.init(identifier:)();
    goto LABEL_9;
  }
  char v9 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v9) {
    goto LABEL_20;
  }
  if (one-time initialization token for t41Locales != -1) {
    swift_once();
  }
  uint64_t v6 = static SuggestionConstants.t41Locales;
  swift_bridgeObjectRetain();
  return v6;
}

uint64_t partial apply for closure #1 in closure #1 in static InformationSuggestionsPluginOwnerDefinitionFactory.createOwnerDefinitions(builderFactory:)(uint64_t a1)
{
  return closure #1 in closure #1 in static InformationSuggestionsPluginOwnerDefinitionFactory.createOwnerDefinitions(builderFactory:)(a1, *(unsigned char *)(v1 + 16));
}

unint64_t specialized AppBundleIdentifier.init(rawValue:)(Swift::String string)
{
  object = string._object;
  v2._uint64_t countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of AppBundleIdentifier.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 >= 7) {
    return 7;
  }
  else {
    return v3;
  }
}

uint64_t specialized InformationSuggestion.init(rawValue:)()
{
  unint64_t v0 = _findStringSwitchCaseWithCache(cases:string:cache:)();
  swift_bridgeObjectRelease();
  if (v0 >= 0x14) {
    return 20;
  }
  else {
    return v0;
  }
}

unint64_t lazy protocol witness table accessor for type AppBundleIdentifier and conformance AppBundleIdentifier()
{
  unint64_t result = lazy protocol witness table cache variable for type AppBundleIdentifier and conformance AppBundleIdentifier;
  if (!lazy protocol witness table cache variable for type AppBundleIdentifier and conformance AppBundleIdentifier)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AppBundleIdentifier and conformance AppBundleIdentifier);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type [InformationSuggestion] and conformance [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [InformationSuggestion] and conformance [A];
  if (!lazy protocol witness table cache variable for type [InformationSuggestion] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [InformationSuggestion]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [InformationSuggestion] and conformance [A]);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type InformationSuggestion and conformance InformationSuggestion()
{
  unint64_t result = lazy protocol witness table cache variable for type InformationSuggestion and conformance InformationSuggestion;
  if (!lazy protocol witness table cache variable for type InformationSuggestion and conformance InformationSuggestion)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type InformationSuggestion and conformance InformationSuggestion);
  }
  return result;
}

uint64_t type metadata accessor for InformationSuggestionsPluginOwnerDefinitionFactory()
{
  return self;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AppBundleIdentifier(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 6;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AppBundleIdentifier(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *unint64_t result = a2 + 6;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1080CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppBundleIdentifier()
{
  return &type metadata for AppBundleIdentifier;
}

uint64_t getEnumTagSinglePayload for InformationSuggestion(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xED) {
    goto LABEL_17;
  }
  if (a2 + 19 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 19) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 19;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 19;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 19;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x14;
  int v8 = v6 - 20;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for InformationSuggestion(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 19 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 19) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xED) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xEC)
  {
    unsigned int v6 = ((a2 - 237) >> 8) + 1;
    *unint64_t result = a2 + 19;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x109A0);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 19;
        break;
    }
  }
  return result;
}

uint64_t getEnumTag for InformationSuggestion(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *destructiveInjectEnumTag for InformationSuggestion(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for InformationSuggestion()
{
  return &type metadata for InformationSuggestion;
}

uint64_t outlined destroy of Resolver?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Resolver?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t _s18SiriSuggestionsKit11DomainOwnerCAcA0E0AAWlTm_0(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t outlined init with copy of (String, Any)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t Date.init()()
{
  return Date.init()();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t UUID.uuidString.getter()
{
  return UUID.uuidString.getter();
}

uint64_t UUID.init()()
{
  return UUID.init()();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t Locale.init(identifier:)()
{
  return Locale.init(identifier:)();
}

uint64_t type metadata accessor for Locale()
{
  return type metadata accessor for Locale();
}

uint64_t static Calendar._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Calendar._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for Calendar.Component()
{
  return type metadata accessor for Calendar.Component();
}

uint64_t Calendar.component(_:from:)()
{
  return Calendar.component(_:from:)();
}

uint64_t type metadata accessor for Calendar()
{
  return type metadata accessor for Calendar();
}

uint64_t Apple_Parsec_Siri_V2alpha_ServerSuggestion.candidates.getter()
{
  return Apple_Parsec_Siri_V2alpha_ServerSuggestion.candidates.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestion()
{
  return type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestion();
}

uint64_t Apple_Parsec_Siri_V2alpha_SuggestionIntent.rawValue.getter()
{
  return Apple_Parsec_Siri_V2alpha_SuggestionIntent.rawValue.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_SuggestionIntent()
{
  return type metadata accessor for Apple_Parsec_Siri_V2alpha_SuggestionIntent();
}

uint64_t Apple_Parsec_Siri_V2alpha_AlternateQuerySuggestion.candidates.getter()
{
  return Apple_Parsec_Siri_V2alpha_AlternateQuerySuggestion.candidates.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AlternateQuerySuggestion()
{
  return type metadata accessor for Apple_Parsec_Siri_V2alpha_AlternateQuerySuggestion();
}

uint64_t Apple_Parsec_Siri_V2alpha_ServerSuggestionCandidate.intent.getter()
{
  return Apple_Parsec_Siri_V2alpha_ServerSuggestionCandidate.intent.getter();
}

uint64_t Apple_Parsec_Siri_V2alpha_ServerSuggestionCandidate.utterance.getter()
{
  return Apple_Parsec_Siri_V2alpha_ServerSuggestionCandidate.utterance.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestionCandidate()
{
  return type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestionCandidate();
}

uint64_t Apple_Parsec_Siri_V2alpha_ServerSuggestionUtterance.print.getter()
{
  return Apple_Parsec_Siri_V2alpha_ServerSuggestionUtterance.print.getter();
}

uint64_t Apple_Parsec_Siri_V2alpha_ServerSuggestionUtterance.speak.getter()
{
  return Apple_Parsec_Siri_V2alpha_ServerSuggestionUtterance.speak.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestionUtterance()
{
  return type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestionUtterance();
}

uint64_t Apple_Parsec_Siri_V2alpha_AlternateQuerySuggestionCandidate.utterance.getter()
{
  return Apple_Parsec_Siri_V2alpha_AlternateQuerySuggestionCandidate.utterance.getter();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AlternateQuerySuggestionCandidate()
{
  return type metadata accessor for Apple_Parsec_Siri_V2alpha_AlternateQuerySuggestionCandidate();
}

uint64_t TemplatingText.init(text:speakableTextOverride:)()
{
  return TemplatingText.init(text:speakableTextOverride:)();
}

uint64_t type metadata accessor for TemplatingText()
{
  return type metadata accessor for TemplatingText();
}

uint64_t TemplatingResult.init(templateIdentifier:sections:behaviorAfterSpeaking:)()
{
  return TemplatingResult.init(templateIdentifier:sections:behaviorAfterSpeaking:)();
}

uint64_t type metadata accessor for TemplatingResult()
{
  return type metadata accessor for TemplatingResult();
}

uint64_t TemplatingSection.init(id:content:caption:spokenOnly:)()
{
  return TemplatingSection.init(id:content:caption:spokenOnly:)();
}

uint64_t type metadata accessor for TemplatingSection()
{
  return type metadata accessor for TemplatingSection();
}

uint64_t type metadata accessor for BehaviorAfterSpeaking()
{
  return type metadata accessor for BehaviorAfterSpeaking();
}

uint64_t Transformer.init(transform:)()
{
  return Transformer.init(transform:)();
}

uint64_t dispatch thunk of SiriHelpSuggestionDetailsBuilderExtension.register(signals:)()
{
  return dispatch thunk of SiriHelpSuggestionDetailsBuilderExtension.register(signals:)();
}

uint64_t type metadata accessor for SiriHintsMode()
{
  return type metadata accessor for SiriHintsMode();
}

uint64_t type metadata accessor for DeviceType()
{
  return type metadata accessor for DeviceType();
}

uint64_t type metadata accessor for Preference()
{
  return type metadata accessor for Preference();
}

uint64_t type metadata accessor for DomainOwner()
{
  return type metadata accessor for DomainOwner();
}

uint64_t DomainOwner.init(_:)()
{
  return DomainOwner.init(_:)();
}

uint64_t dispatch thunk of Interaction.executionParameters.getter()
{
  return dispatch thunk of Interaction.executionParameters.getter();
}

uint64_t type metadata accessor for DialogDetails()
{
  return type metadata accessor for DialogDetails();
}

uint64_t type metadata accessor for CoreSignalTypes()
{
  return type metadata accessor for CoreSignalTypes();
}

uint64_t type metadata accessor for DeliveryVehicle()
{
  return type metadata accessor for DeliveryVehicle();
}

uint64_t dispatch thunk of DialogProperties.getParameters()()
{
  return dispatch thunk of DialogProperties.getParameters()();
}

uint64_t dispatch thunk of CandidateSuggestion.context.getter()
{
  return dispatch thunk of CandidateSuggestion.context.getter();
}

uint64_t ResolvableParameter.__allocating_init(typeIdentifier:required:loggingKeyTransformer:)()
{
  return ResolvableParameter.__allocating_init(typeIdentifier:required:loggingKeyTransformer:)();
}

uint64_t ResolvableParameter.__allocating_init(typeIdentifier:required:)()
{
  return ResolvableParameter.__allocating_init(typeIdentifier:required:)();
}

uint64_t type metadata accessor for ResolvableParameter()
{
  return type metadata accessor for ResolvableParameter();
}

uint64_t type metadata accessor for VersionedInvocation()
{
  return type metadata accessor for VersionedInvocation();
}

uint64_t static VersionedInvocations.HintsDawnA.getter()
{
  return static VersionedInvocations.HintsDawnA.getter();
}

uint64_t static VersionedInvocations.HintsDawnC.getter()
{
  return static VersionedInvocations.HintsDawnC.getter();
}

uint64_t static VersionedInvocations.latest.getter()
{
  return static VersionedInvocations.latest.getter();
}

uint64_t static SuggestionTransformers.removeParameterFromLogging()()
{
  return static SuggestionTransformers.removeParameterFromLogging()();
}

uint64_t static SuggestionTransformers.passthroughParameterForLogging()()
{
  return static SuggestionTransformers.passthroughParameterForLogging()();
}

uint64_t dispatch thunk of SuggestionDetailsBuilder.templateRoot(_:)()
{
  return dispatch thunk of SuggestionDetailsBuilder.templateRoot(_:)();
}

uint64_t dispatch thunk of SuggestionDetailsBuilder.enabledDevices(_:)()
{
  return dispatch thunk of SuggestionDetailsBuilder.enabledDevices(_:)();
}

uint64_t dispatch thunk of SuggestionDetailsBuilder.enabledLocales(_:)()
{
  return dispatch thunk of SuggestionDetailsBuilder.enabledLocales(_:)();
}

uint64_t dispatch thunk of SuggestionDetailsBuilder.loggingIdentifier(_:)()
{
  return dispatch thunk of SuggestionDetailsBuilder.loggingIdentifier(_:)();
}

uint64_t dispatch thunk of SuggestionDetailsBuilder.enabledDeliveryVehicles(_:)()
{
  return dispatch thunk of SuggestionDetailsBuilder.enabledDeliveryVehicles(_:)();
}

uint64_t dispatch thunk of SuggestionDetailsBuilder.validForInvocationTypes(_:)()
{
  return dispatch thunk of SuggestionDetailsBuilder.validForInvocationTypes(_:)();
}

uint64_t dispatch thunk of SuggestionDetailsBuilder.exampleUtteranceDialogId(_:)()
{
  return dispatch thunk of SuggestionDetailsBuilder.exampleUtteranceDialogId(_:)();
}

uint64_t dispatch thunk of SuggestionDetailsBuilder.requiresNetworkConnection()()
{
  return dispatch thunk of SuggestionDetailsBuilder.requiresNetworkConnection()();
}

uint64_t SuggestionDetailsBuilder.parameter(parameterName:resolver:resolveParam:)()
{
  return SuggestionDetailsBuilder.parameter(parameterName:resolver:resolveParam:)();
}

uint64_t CandidateSuggestionFactory.create(suggestionId:params:objective:deliveryVehicle:preference:)()
{
  return CandidateSuggestionFactory.create(suggestionId:params:objective:deliveryVehicle:preference:)();
}

uint64_t CandidateSuggestionFactory.create(suggestionId:params:objective:)()
{
  return CandidateSuggestionFactory.create(suggestionId:params:objective:)();
}

uint64_t dispatch thunk of SuggestionOwnerDefinitionBuilder.withConversationalGenerator(_:)()
{
  return dispatch thunk of SuggestionOwnerDefinitionBuilder.withConversationalGenerator(_:)();
}

uint64_t dispatch thunk of SuggestionOwnerDefinitionBuilder.add(suggestionId:catId:builder:)()
{
  return dispatch thunk of SuggestionOwnerDefinitionBuilder.add(suggestionId:catId:builder:)();
}

uint64_t dispatch thunk of SuggestionOwnerDefinitionBuilder.add(suggestionId:dialogDetails:builder:)()
{
  return dispatch thunk of SuggestionOwnerDefinitionBuilder.add(suggestionId:dialogDetails:builder:)();
}

uint64_t dispatch thunk of SuggestionOwnerDefinitionBuilder.build()()
{
  return dispatch thunk of SuggestionOwnerDefinitionBuilder.build()();
}

uint64_t static Signal.HomeScreen.getter()
{
  return static Signal.HomeScreen.getter();
}

uint64_t Signal.__allocating_init(signalType:signalValue:fallbackSignals:)()
{
  return Signal.__allocating_init(signalType:signalValue:fallbackSignals:)();
}

uint64_t static Signal.DeviceLocked.getter()
{
  return static Signal.DeviceLocked.getter();
}

uint64_t static Signal.Fallback.getter()
{
  return static Signal.Fallback.getter();
}

uint64_t type metadata accessor for Signal()
{
  return type metadata accessor for Signal();
}

uint64_t Context.getParam(for:key:)()
{
  return Context.getParam(for:key:)();
}

uint64_t Context.setParam(for:key:value:)()
{
  return Context.setParam(for:key:value:)();
}

uint64_t type metadata accessor for Objective()
{
  return type metadata accessor for Objective();
}

uint64_t BinaryDecodingOptions.init()()
{
  return BinaryDecodingOptions.init()();
}

uint64_t type metadata accessor for BinaryDecodingOptions()
{
  return type metadata accessor for BinaryDecodingOptions();
}

uint64_t Message.init(serializedData:extensions:partial:options:)()
{
  return Message.init(serializedData:extensions:partial:options:)();
}

uint64_t Message.debugDescription.getter()
{
  return Message.debugDescription.getter();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t Logger.init(_:)()
{
  return Logger.init(_:)();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t OS_os_log.init(subsystem:category:)()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)()
{
  return StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t _findStringSwitchCaseWithCache(cases:string:cache:)()
{
  return _findStringSwitchCaseWithCache(cases:string:cache:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}