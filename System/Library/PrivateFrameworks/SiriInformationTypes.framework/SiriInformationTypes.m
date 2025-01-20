uint64_t UserPromptExperience.PromptType.init(rawValue:)@<X0>(Swift::String string@<0:X0, 8:X1>, BOOL *a2@<X8>)
{
  void *object;
  Swift::String v3;
  Swift::Int v5;
  uint64_t result;

  object = string._object;
  v3._countAndFlagsBits = string._countAndFlagsBits;
  v3._object = object;
  v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of UserPromptExperience.PromptType.init(rawValue:), v3);
  result = swift_bridgeObjectRelease();
  *a2 = v5 != 0;
  return result;
}

unint64_t UserPromptExperience.PromptType.rawValue.getter()
{
  return 0xD000000000000012;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance UserPromptExperience.PromptType()
{
  return 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance UserPromptExperience.PromptType()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance UserPromptExperience.PromptType()
{
  return String.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance UserPromptExperience.PromptType()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance UserPromptExperience.PromptType@<X0>(Swift::String *a1@<X0>, BOOL *a2@<X8>)
{
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of protocol witness for RawRepresentable.init(rawValue:) in conformance UserPromptExperience.PromptType, *a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3 != 0;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance UserPromptExperience.PromptType(void *a1@<X8>)
{
  *a1 = 0xD000000000000012;
  a1[1] = 0x800000025C981330;
}

uint64_t UserPromptExperience.domain.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC20SiriInformationTypes20UserPromptExperience_domain);
  swift_bridgeObjectRetain();
  return v1;
}

double UserPromptExperience.queryConfidence.getter()
{
  return 1.0;
}

id UserPromptExperience.__allocating_init(domain:prompType:)(uint64_t a1, uint64_t a2)
{
  v5 = (char *)objc_allocWithZone(v2);
  v6 = &v5[OBJC_IVAR____TtC20SiriInformationTypes20UserPromptExperience_domain];
  *(void *)v6 = a1;
  *((void *)v6 + 1) = a2;
  return Experience.init(pluginId:queryConfidence:)(0x73757361676570, 0xE700000000000000, 1.0);
}

id UserPromptExperience.init(domain:prompType:)(uint64_t a1, uint64_t a2)
{
  Swift::Int v3 = (void *)(v2 + OBJC_IVAR____TtC20SiriInformationTypes20UserPromptExperience_domain);
  *Swift::Int v3 = a1;
  v3[1] = a2;
  return Experience.init(pluginId:queryConfidence:)(0x73757361676570, 0xE700000000000000, 1.0);
}

Swift::Void __swiftcall UserPromptExperience.encode(with:)(NSCoder with)
{
  Experience.encode(with:)(with);
  Swift::Int v3 = (void *)MEMORY[0x261198B80](*(void *)(v1 + OBJC_IVAR____TtC20SiriInformationTypes20UserPromptExperience_domain), *(void *)(v1 + OBJC_IVAR____TtC20SiriInformationTypes20UserPromptExperience_domain + 8));
  v4 = (void *)MEMORY[0x261198B80](0x6E69616D6F64, 0xE600000000000000);
  [(objc_class *)with.super.isa encodeObject:v3 forKey:v4];

  v5 = (void *)MEMORY[0x261198B80](0xD000000000000012, 0x800000025C981330);
  id v6 = (id)MEMORY[0x261198B80](0x795474706D6F7270, 0xEA00000000006570);
  [(objc_class *)with.super.isa encodeObject:v5 forKey:v6];
}

id UserPromptExperience.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return UserPromptExperience.init(coder:)(a1);
}

id UserPromptExperience.init(coder:)(void *a1)
{
  type metadata accessor for NSString();
  id v3 = v1;
  uint64_t v4 = NSCoder.decodeObject<A>(of:forKey:)();
  if (!v4) {
    goto LABEL_9;
  }
  v5 = (void *)v4;
  id v6 = (void *)MEMORY[0x261198B80](0x795474706D6F7270, 0xEA00000000006570);
  id v7 = objc_msgSend(a1, sel_decodeObjectForKey_, v6);

  if (v7)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v20, 0, sizeof(v20));
  }
  outlined init with take of Any?((uint64_t)v20, (uint64_t)v21);
  if (!v22)
  {

    outlined destroy of Any?((uint64_t)v21);
    goto LABEL_11;
  }
  if ((swift_dynamicCast() & 1) == 0
    || (Swift::Int v8 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of UserPromptExperience.init(coder:), v19), swift_bridgeObjectRelease(), v8))
  {

LABEL_9:
LABEL_11:
    if (one-time initialization token for pommes != -1) {
      swift_once();
    }
    uint64_t v9 = type metadata accessor for Logger();
    __swift_project_value_buffer(v9, (uint64_t)static Logger.pommes);
    v10 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_25C8FE000, v10, v11, "UserPromptExperience cannot be decoded", v12, 2u);
      MEMORY[0x261199590](v12, -1, -1);
    }

    type metadata accessor for UserPromptExperience();
    swift_deallocPartialClassInstance();
    return 0;
  }
  uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v16 = (uint64_t *)&v3[OBJC_IVAR____TtC20SiriInformationTypes20UserPromptExperience_domain];
  uint64_t *v16 = v15;
  v16[1] = v17;

  id v13 = Experience.init(coder:)(a1);
  id v18 = v13;

  if (v13) {
  return v13;
  }
}

unint64_t type metadata accessor for NSString()
{
  unint64_t result = lazy cache variable for type metadata for NSString;
  if (!lazy cache variable for type metadata for NSString)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for NSString);
  }
  return result;
}

void UserPromptExperience.__allocating_init(pluginId:queryConfidence:)()
{
}

void UserPromptExperience.init(pluginId:queryConfidence:)()
{
}

void UserPromptExperience.__allocating_init(pluginId:queryConfidence:userDialogAct:)()
{
}

void UserPromptExperience.init(pluginId:queryConfidence:userDialogAct:)()
{
}

void UserPromptExperience.__allocating_init(pluginId:queryConfidence:userDialogAct:renderOptions:)()
{
}

void UserPromptExperience.init(pluginId:queryConfidence:userDialogAct:renderOptions:)()
{
}

void UserPromptExperience.__allocating_init(pluginId:queryConfidence:userDialogAct:intent:)()
{
}

void UserPromptExperience.init(pluginId:queryConfidence:userDialogAct:intent:)()
{
}

void UserPromptExperience.__allocating_init(pluginId:queryConfidence:userDialogAct:renderOptions:intent:)()
{
}

void UserPromptExperience.init(pluginId:queryConfidence:userDialogAct:renderOptions:intent:)()
{
}

uint64_t UserPromptExperience.__ivar_destroyer()
{
  return swift_bridgeObjectRelease();
}

id UserPromptExperience.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UserPromptExperience();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t type metadata accessor for UserPromptExperience()
{
  uint64_t result = type metadata singleton initialization cache for UserPromptExperience;
  if (!type metadata singleton initialization cache for UserPromptExperience) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void *protocol witness for RawRepresentable.init(rawValue:) in conformance KVItemType@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance KVItemType(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t outlined init with take of Any?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
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

uint64_t outlined destroy of Any?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t lazy protocol witness table accessor for type UserPromptExperience.PromptType and conformance UserPromptExperience.PromptType()
{
  unint64_t result = lazy protocol witness table cache variable for type UserPromptExperience.PromptType and conformance UserPromptExperience.PromptType;
  if (!lazy protocol witness table cache variable for type UserPromptExperience.PromptType and conformance UserPromptExperience.PromptType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UserPromptExperience.PromptType and conformance UserPromptExperience.PromptType);
  }
  return result;
}

uint64_t ObjC metadata update function for UserPromptExperience()
{
  return type metadata accessor for UserPromptExperience();
}

uint64_t type metadata completion function for UserPromptExperience()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for UserPromptExperience(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for UserPromptExperience);
}

uint64_t dispatch thunk of UserPromptExperience.__allocating_init(domain:prompType:)()
{
  return (*(uint64_t (**)(void))(v0 + 344))();
}

uint64_t getEnumTagSinglePayload for UserPromptExperience.PromptType(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for UserPromptExperience.PromptType(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x25C900FA4);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t getEnumTag for UserPromptExperience.PromptType()
{
  return 0;
}

ValueMetadata *type metadata accessor for UserPromptExperience.PromptType()
{
  return &type metadata for UserPromptExperience.PromptType;
}

void type metadata accessor for KVItemType(uint64_t a1)
{
}

void type metadata accessor for KVFieldType(uint64_t a1)
{
}

void type metadata accessor for KVItemType(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

unint64_t static AudioExperience.overrideFeatureFlagDomain.getter()
{
  return 0xD000000000000010;
}

unint64_t static AudioExperience.overrideFeatureFlagKey.getter()
{
  return 0xD000000000000017;
}

uint64_t static AudioExperience.userDefaultOverride.getter()
{
  return 0;
}

uint64_t key path setter for AudioExperience.serverAudioResults : AudioExperience(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  int v3 = (void *)(*a2 + OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_serverAudioResults);
  swift_beginAccess();
  *int v3 = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t AudioExperience.serverAudioResults.getter()
{
  return AudioExperience.serverAudioResults.getter();
}

{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t AudioExperience.isGlideEligible.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_isGlideEligible);
  swift_beginAccess();
  return *v1;
}

uint64_t AudioExperience.isGlideEligible.setter(char a1)
{
  int v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_isGlideEligible);
  uint64_t result = swift_beginAccess();
  *int v3 = a1;
  return result;
}

uint64_t (*AudioExperience.isGlideEligible.modify())()
{
  return AudioExperience.isGlideEligible.modify;
}

uint64_t AudioExperience.networkAvailableAtRequest.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_networkAvailableAtRequest);
  swift_beginAccess();
  return *v1;
}

uint64_t AudioExperience.audioUnderstanding.getter@<X0>(uint64_t a1@<X8>)
{
  return AudioExperience.audioUnderstanding.getter(&OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_audioUnderstanding, MEMORY[0x263F5CEC0], a1);
}

uint64_t AudioExperience.parse.getter()
{
  return swift_retain();
}

uint64_t AudioExperience.playbackSignals.getter@<X0>(uint64_t a1@<X8>)
{
  return AudioExperience.audioUnderstanding.getter(&OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_playbackSignals, MEMORY[0x263F5CE70], a1);
}

uint64_t AudioExperience.internalSignals.getter()
{
  uint64_t v1 = *(void *)((char *)v0 + OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_originalSignals);
  uint64_t v2 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x220))();
  swift_bridgeObjectRetain();
  specialized Array.append<A>(contentsOf:)(v2);
  return v1;
}

uint64_t AudioExperience.originalSignals.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t AudioExperience.internalSignalsFromSiriAudio.getter()
{
  return AudioExperience.serverAudioResults.getter();
}

uint64_t AudioExperience.internalSignalsFromSiriAudio.setter(uint64_t a1)
{
  int v3 = (void *)(v1 + OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_internalSignalsFromSiriAudio);
  swift_beginAccess();
  *int v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*AudioExperience.internalSignalsFromSiriAudio.modify())()
{
  return AudioExperience.internalSignalsFromSiriAudio.modify;
}

uint64_t AudioExperience.pegasusAudioType.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_pegasusAudioType);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AudioExperience.launchID.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_launchID);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AudioExperience.systemExtensionBundleID.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_systemExtensionBundleID);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AudioExperience.boltProxiedBundleID.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_boltProxiedBundleID);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AudioExperience.shouldPerformAppSelection.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_shouldPerformAppSelection);
}

uint64_t AudioExperience.audioClientComponent.getter@<X0>(uint64_t a1@<X8>)
{
  return AudioExperience.audioUnderstanding.getter(&OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_audioClientComponent, MEMORY[0x263F5CF38], a1);
}

uint64_t AudioExperience.audioUnderstanding.getter@<X0>(void *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = v3 + *a1;
  uint64_t v6 = a2(0);
  id v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);

  return v7(a3, v5, v6);
}

uint64_t AudioExperience.matchingSpans.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t AudioExperience.multiUserContext.getter@<X0>(uint64_t a1@<X8>)
{
  return outlined init with copy of Apple_Parsec_Siri_V2alpha_MultiUserContext?(v1 + OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_multiUserContext, a1, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_MultiUserContext?);
}

void *AudioExperience.catIds.getter()
{
  return &outlined read-only object #0 of AudioExperience.catIds.getter;
}

uint64_t AudioExperience.__allocating_init(pluginId:audioClientComponent:queryConfidenceScore:usoGraphData:isGlideEligible:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, int a6, double a7)
{
  int v31 = a6;
  uint64_t v28 = a4;
  uint64_t v29 = a1;
  uint64_t v30 = a2;
  uint64_t v11 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioClientComponent();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  Swift::String v19 = (char *)&v27 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  v21 = (char *)&v27 - v20;
  uint64_t v22 = a4;
  unint64_t v23 = a5;
  closure #1 in AudioExperience.init(pluginId:audioClientComponent:queryConfidenceScore:usoGraphData:isGlideEligible:)(v22, a5, (uint64_t)&v27 - v20);
  uint64_t v24 = a3;
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a3, v11);
  (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v19, v21, v15);
  uint64_t v25 = AudioExperience.__allocating_init(pluginId:audioClientComponent:queryConfidenceScore:userDialogAct:isGlideEligible:)(v29, v30, (uint64_t)v14, (uint64_t)v19, v31, a7);
  outlined consume of Data._Representation(v28, v23);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v24, v11);
  (*(void (**)(char *, uint64_t))(v16 + 8))(v21, v15);
  return v25;
}

uint64_t closure #1 in AudioExperience.init(pluginId:audioClientComponent:queryConfidenceScore:usoGraphData:isGlideEligible:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v28 = a3;
  uint64_t v5 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v26 = v5;
  uint64_t v27 = v6;
  MEMORY[0x270FA5388](v5);
  Swift::Int v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Siri_Nlu_External_UserStatedTask();
  uint64_t v25 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for BinaryDecodingOptions();
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for Siri_Nlu_External_UsoGraph();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  Swift::String v19 = (char *)&v24 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = 0;
  long long v29 = 0u;
  long long v30 = 0u;
  outlined copy of Data._Representation(a1, a2);
  BinaryDecodingOptions.init()();
  lazy protocol witness table accessor for type Apple_Parsec_Siri_V2alpha_AudioItem and conformance Apple_Parsec_Siri_V2alpha_AudioItem(&lazy protocol witness table cache variable for type Siri_Nlu_External_UsoGraph and conformance Siri_Nlu_External_UsoGraph, MEMORY[0x263F714B0]);
  Message.init(serializedData:extensions:partial:options:)();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v15, 0, 1, v16);
  uint64_t v20 = (*(uint64_t (**)(char *, char *, uint64_t))(v17 + 32))(v19, v15, v16);
  MEMORY[0x270FA5388](v20);
  *(&v24 - 2) = (uint64_t)v19;
  lazy protocol witness table accessor for type Apple_Parsec_Siri_V2alpha_AudioItem and conformance Apple_Parsec_Siri_V2alpha_AudioItem(&lazy protocol witness table cache variable for type Siri_Nlu_External_UserStatedTask and conformance Siri_Nlu_External_UserStatedTask, MEMORY[0x263F71600]);
  uint64_t v21 = static Message.with(_:)();
  MEMORY[0x270FA5388](v21);
  *(&v24 - 2) = (uint64_t)v11;
  lazy protocol witness table accessor for type Apple_Parsec_Siri_V2alpha_AudioItem and conformance Apple_Parsec_Siri_V2alpha_AudioItem(&lazy protocol witness table cache variable for type Siri_Nlu_External_UserDialogAct and conformance Siri_Nlu_External_UserDialogAct, MEMORY[0x263F71570]);
  uint64_t v22 = v26;
  static Message.with(_:)();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v11, v9);
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v27 + 32))(v28, v8, v22);
}

uint64_t closure #1 in closure #1 in AudioExperience.init(pluginId:audioClientComponent:queryConfidenceScore:usoGraphData:isGlideEligible:)(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t (*a4)(char *))
{
  a3(0);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)v10 - v6;
  (*(void (**)(char *, uint64_t))(v8 + 16))((char *)v10 - v6, a2);
  return a4(v7);
}

uint64_t AudioExperience.__allocating_init(pluginId:audioClientComponent:queryConfidenceScore:userDialogAct:isGlideEligible:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, double a6)
{
  uint64_t v56 = a2;
  int v58 = a5;
  uint64_t v59 = a4;
  uint64_t v57 = a1;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_MultiUserContext?);
  MEMORY[0x270FA5388](v8 - 8);
  v54 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  uint64_t v42 = *(void *)(v53 - 8);
  uint64_t v10 = v42;
  MEMORY[0x270FA5388](v53);
  uint64_t v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioClientComponent();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v45 = v13;
  uint64_t v46 = v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for Apple_Parsec_Siri_V2alpha_PlaybackSignals();
  MEMORY[0x270FA5388](v17 - 8);
  Swift::String v19 = (char *)&v39 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioUnderstanding();
  MEMORY[0x270FA5388](v20 - 8);
  uint64_t v22 = (char *)&v39 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = Apple_Parsec_Siri_V2alpha_AudioClientComponent.audioSearchResults.getter();
  Apple_Parsec_Siri_V2alpha_AudioClientComponent.understanding.getter();
  Apple_Parsec_Siri_V2alpha_AudioClientComponent.playbackSignals.getter();
  uint64_t v51 = Apple_Parsec_Siri_V2alpha_AudioClientComponent.internalSignals.getter();
  uint64_t v23 = Apple_Parsec_Siri_V2alpha_AudioClientComponent.pegasusAudioType.getter();
  uint64_t v49 = v24;
  uint64_t v50 = v23;
  uint64_t v25 = Apple_Parsec_Siri_V2alpha_AudioClientComponent.launchID.getter();
  uint64_t v47 = v26;
  uint64_t v48 = v25;
  uint64_t v27 = Apple_Parsec_Siri_V2alpha_AudioClientComponent.systemExtensionBundleID.getter();
  uint64_t v43 = v28;
  uint64_t v44 = v27;
  uint64_t v41 = Apple_Parsec_Siri_V2alpha_AudioClientComponent.boltProxiedBundleID.getter();
  uint64_t v40 = v29;
  char v30 = Apple_Parsec_Siri_V2alpha_AudioClientComponent.shouldPerformAppSelection.getter();
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, a3, v13);
  uint64_t v31 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  uint64_t v32 = v53;
  v31(v12, v59, v53);
  uint64_t v33 = type metadata accessor for Apple_Parsec_Siri_V2alpha_MultiUserContext();
  v34 = v54;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v54, 1, 1, v33);
  HIBYTE(v38) = 1;
  LOBYTE(v38) = v58;
  char v37 = v30 & 1;
  uint64_t v35 = (*(uint64_t (**)(uint64_t, char *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, double, uint64_t, uint64_t, uint64_t, uint64_t, char, char *, uint64_t, uint64_t, char *, __int16, void, char *))(v55 + 568))(v52, v22, v19, v51, v50, v49, v48, v47, a6, v44, v43, v41, v40, v37, v16, v57, v56, v12, v38,
          MEMORY[0x263F8EE78],
          v34);
  (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v59, v32);
  (*(void (**)(uint64_t, uint64_t))(v46 + 8))(a3, v45);
  return v35;
}

uint64_t AudioExperience.__allocating_init(pluginId:audioClientComponent:queryConfidenceScore:userDialogAct:clientExperienceSignals:)(uint64_t a1, uint64_t a2, char *a3, char *a4, uint64_t a5, double a6)
{
  uint64_t v32 = a3;
  uint64_t v36 = a5;
  char v37 = a4;
  uint64_t v34 = a1;
  uint64_t v35 = a2;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ClientExperienceSignals?);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v30 - v16;
  uint64_t v31 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioClientComponent();
  uint64_t v18 = *(void *)(v31 - 8);
  MEMORY[0x270FA5388](v31);
  uint64_t v20 = (char *)&v30 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, char *))(v18 + 16))(v20, a3);
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v21(v17, (uint64_t)v37, v11);
  outlined init with copy of Apple_Parsec_Siri_V2alpha_MultiUserContext?(v36, (uint64_t)v10, &demangling cache variable for type metadata for ClientExperienceSignals?);
  id v22 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for PommesRenderOptions(0)), sel_init);
  v21(v15, (uint64_t)v17, v11);
  uint64_t v39 = v20;
  uint64_t v40 = v10;
  uint64_t v23 = (uint64_t)v10;
  id v41 = v22;
  uint64_t v42 = v33;
  uint64_t v24 = (*(uint64_t (**)(uint64_t, uint64_t, char *, uint64_t (*)(uint64_t *), char *, double))(v33 + 576))(v34, v35, v15, partial apply for closure #1 in AudioExperience.init(pluginId:audioClientComponent:queryConfidenceScore:userDialogAct:clientExperienceSignals:renderOptions:), v38, a6);
  uint64_t v25 = *(void (**)(char *, uint64_t))(v12 + 8);
  v25(v17, v11);

  outlined destroy of ClientExperienceSignals?(v23, &demangling cache variable for type metadata for ClientExperienceSignals?);
  uint64_t v26 = *(void (**)(char *, uint64_t))(v18 + 8);
  uint64_t v27 = v20;
  uint64_t v28 = v31;
  v26(v27, v31);
  outlined destroy of ClientExperienceSignals?(v36, &demangling cache variable for type metadata for ClientExperienceSignals?);
  v25(v37, v11);
  v26(v32, v28);
  return v24;
}

uint64_t AudioExperience.__allocating_init(pluginId:audioClientComponent:queryConfidenceScore:userDialogAct:clientExperienceSignals:renderOptions:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, double a7)
{
  uint64_t v15 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = &v22[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v16 + 16))(v18, a4, v15);
  uint64_t v23 = a3;
  uint64_t v24 = a5;
  uint64_t v25 = a6;
  uint64_t v26 = v7;
  uint64_t v19 = (*(uint64_t (**)(uint64_t, uint64_t, unsigned char *, uint64_t (*)(), unsigned char *, double))(v7 + 576))(a1, a2, v18, closure #1 in AudioExperience.init(pluginId:audioClientComponent:queryConfidenceScore:userDialogAct:clientExperienceSignals:renderOptions:)partial apply, v22, a7);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(a4, v15);

  outlined destroy of ClientExperienceSignals?(a5, &demangling cache variable for type metadata for ClientExperienceSignals?);
  uint64_t v20 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioClientComponent();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v20 - 8) + 8))(a3, v20);
  return v19;
}

uint64_t closure #1 in AudioExperience.init(pluginId:audioClientComponent:queryConfidenceScore:userDialogAct:clientExperienceSignals:renderOptions:)(uint64_t *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v68 = a4;
  uint64_t v66 = a3;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_MultiUserContext?);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v69 = (uint64_t)&v66 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ClientExperienceSignals?);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v67 = (uint64_t)&v66 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v66 - v12;
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v66 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v66 - v17;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_PlaybackSignals?);
  MEMORY[0x270FA5388](v19 - 8);
  uint64_t v21 = (char *)&v66 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_AudioUnderstanding?);
  MEMORY[0x270FA5388](v22 - 8);
  uint64_t v24 = (char *)&v66 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = Apple_Parsec_Siri_V2alpha_AudioClientComponent.audioSearchResults.getter();
  swift_bridgeObjectRelease();
  *a1 = v25;
  Apple_Parsec_Siri_V2alpha_AudioClientComponent.understanding.getter();
  uint64_t v26 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioUnderstanding();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v24, 0, 1, v26);
  uint64_t v27 = (int *)type metadata accessor for AudioExperience.Builder(0);
  outlined assign with take of Apple_Parsec_Siri_V2alpha_AudioUnderstanding?((uint64_t)v24, (uint64_t)a1 + v27[5], &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_AudioUnderstanding?);
  Apple_Parsec_Siri_V2alpha_AudioClientComponent.playbackSignals.getter();
  uint64_t v28 = type metadata accessor for Apple_Parsec_Siri_V2alpha_PlaybackSignals();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v21, 0, 1, v28);
  outlined assign with take of Apple_Parsec_Siri_V2alpha_AudioUnderstanding?((uint64_t)v21, (uint64_t)a1 + v27[6], &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_PlaybackSignals?);
  uint64_t v29 = Apple_Parsec_Siri_V2alpha_AudioClientComponent.internalSignals.getter();
  uint64_t v30 = v27[7];
  swift_bridgeObjectRelease();
  *(uint64_t *)((char *)a1 + v30) = v29;
  uint64_t v31 = Apple_Parsec_Siri_V2alpha_AudioClientComponent.pegasusAudioType.getter();
  uint64_t v33 = v32;
  uint64_t v34 = (uint64_t *)((char *)a1 + v27[9]);
  swift_bridgeObjectRelease();
  uint64_t *v34 = v31;
  v34[1] = v33;
  uint64_t v35 = Apple_Parsec_Siri_V2alpha_AudioClientComponent.launchID.getter();
  uint64_t v37 = v36;
  __int16 v38 = (uint64_t *)((char *)a1 + v27[10]);
  swift_bridgeObjectRelease();
  *__int16 v38 = v35;
  v38[1] = v37;
  uint64_t v39 = Apple_Parsec_Siri_V2alpha_AudioClientComponent.systemExtensionBundleID.getter();
  uint64_t v41 = v40;
  uint64_t v42 = (uint64_t *)((char *)a1 + v27[11]);
  swift_bridgeObjectRelease();
  *uint64_t v42 = v39;
  v42[1] = v41;
  uint64_t v43 = Apple_Parsec_Siri_V2alpha_AudioClientComponent.boltProxiedBundleID.getter();
  uint64_t v45 = v44;
  uint64_t v46 = (uint64_t *)((char *)a1 + v27[12]);
  swift_bridgeObjectRelease();
  *uint64_t v46 = v43;
  v46[1] = v45;
  *((unsigned char *)a1 + v27[13]) = Apple_Parsec_Siri_V2alpha_AudioClientComponent.shouldPerformAppSelection.getter() & 1;
  uint64_t v47 = (uint64_t)a1 + v27[14];
  outlined destroy of ClientExperienceSignals?(v47, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_AudioClientComponent?);
  uint64_t v48 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioClientComponent();
  uint64_t v49 = *(void *)(v48 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v49 + 16))(v47, a2, v48);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v49 + 56))(v47, 0, 1, v48);
  uint64_t v50 = v66;
  outlined init with copy of Apple_Parsec_Siri_V2alpha_MultiUserContext?(v66, (uint64_t)v18, &demangling cache variable for type metadata for ClientExperienceSignals?);
  uint64_t v51 = type metadata accessor for ClientExperienceSignals();
  uint64_t v52 = *(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v51 - 8) + 48);
  if (v52(v18, 1, v51) == 1)
  {
    outlined destroy of ClientExperienceSignals?((uint64_t)v18, &demangling cache variable for type metadata for ClientExperienceSignals?);
    char v53 = 2;
  }
  else
  {
    char v53 = *v18;
    outlined destroy of AudioExperience.Builder((uint64_t)v18, (uint64_t (*)(void))type metadata accessor for ClientExperienceSignals);
  }
  *((unsigned char *)a1 + v27[15]) = v53;
  outlined init with copy of Apple_Parsec_Siri_V2alpha_MultiUserContext?(v50, (uint64_t)v16, &demangling cache variable for type metadata for ClientExperienceSignals?);
  if (v52(v16, 1, v51) == 1)
  {
    outlined destroy of ClientExperienceSignals?((uint64_t)v16, &demangling cache variable for type metadata for ClientExperienceSignals?);
    char v54 = 2;
  }
  else
  {
    char v54 = v16[16];
    outlined destroy of AudioExperience.Builder((uint64_t)v16, (uint64_t (*)(void))type metadata accessor for ClientExperienceSignals);
  }
  *((unsigned char *)a1 + v27[16]) = v54;
  outlined init with copy of Apple_Parsec_Siri_V2alpha_MultiUserContext?(v50, (uint64_t)v13, &demangling cache variable for type metadata for ClientExperienceSignals?);
  if (v52(v13, 1, v51) == 1)
  {
    outlined destroy of ClientExperienceSignals?((uint64_t)v13, &demangling cache variable for type metadata for ClientExperienceSignals?);
    uint64_t v55 = 0;
  }
  else
  {
    uint64_t v55 = *((void *)v13 + 3);
    swift_bridgeObjectRetain();
    outlined destroy of AudioExperience.Builder((uint64_t)v13, (uint64_t (*)(void))type metadata accessor for ClientExperienceSignals);
  }
  uint64_t v56 = v27[17];
  swift_bridgeObjectRelease();
  *(uint64_t *)((char *)a1 + v56) = v55;
  uint64_t v57 = v27[18];
  int v58 = *(void **)((char *)a1 + v57);
  uint64_t v59 = (uint64_t)v68;
  id v60 = v68;

  *(uint64_t *)((char *)a1 + v57) = v59;
  uint64_t v61 = v67;
  outlined init with copy of Apple_Parsec_Siri_V2alpha_MultiUserContext?(v50, v67, &demangling cache variable for type metadata for ClientExperienceSignals?);
  if (v52((char *)v61, 1, v51) == 1)
  {
    outlined destroy of ClientExperienceSignals?(v61, &demangling cache variable for type metadata for ClientExperienceSignals?);
    uint64_t v62 = type metadata accessor for Apple_Parsec_Siri_V2alpha_MultiUserContext();
    uint64_t v63 = v69;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v62 - 8) + 56))(v69, 1, 1, v62);
  }
  else
  {
    uint64_t v64 = v61 + *(int *)(v51 + 36);
    uint64_t v63 = v69;
    outlined init with copy of Apple_Parsec_Siri_V2alpha_MultiUserContext?(v64, v69, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_MultiUserContext?);
    outlined destroy of AudioExperience.Builder(v61, (uint64_t (*)(void))type metadata accessor for ClientExperienceSignals);
  }
  return outlined assign with take of Apple_Parsec_Siri_V2alpha_AudioUnderstanding?(v63, (uint64_t)a1 + v27[19], &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_MultiUserContext?);
}

id AudioExperience.__allocating_init(serverAudioResults:audioUnderstanding:playbackSignals:internalSignals:pegasusAudioType:launchID:systemExtensionBundleID:boltProxiedBundleID:shouldPerformAppSelection:audioClientComponent:pluginId:queryConfidence:userDialogAct:isGlideEligible:networkAvailableAtRequest:matchingSpans:multiUserContext:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, long long a10, uint64_t a11, uint64_t a12, char a13, long long a14, uint64_t a15, char *a16, char a17, char a18, uint64_t a19, uint64_t a20)
{
  id v22 = objc_allocWithZone(v20);
  return AudioExperience.init(serverAudioResults:audioUnderstanding:playbackSignals:internalSignals:pegasusAudioType:launchID:systemExtensionBundleID:boltProxiedBundleID:shouldPerformAppSelection:audioClientComponent:pluginId:queryConfidence:userDialogAct:isGlideEligible:networkAvailableAtRequest:matchingSpans:multiUserContext:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, *((uint64_t *)&a10 + 1), a11, a12, a13, a14, *((uint64_t *)&a14 + 1), a15, a16, a17,
           a18,
           a19,
           a20);
}

id AudioExperience.init(serverAudioResults:audioUnderstanding:playbackSignals:internalSignals:pegasusAudioType:launchID:systemExtensionBundleID:boltProxiedBundleID:shouldPerformAppSelection:audioClientComponent:pluginId:queryConfidence:userDialogAct:isGlideEligible:networkAvailableAtRequest:matchingSpans:multiUserContext:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, unsigned __int8 a14, uint64_t a15, uint64_t a16, uint64_t a17, char *a18, unsigned __int8 a19, unsigned __int8 a20,uint64_t a21,uint64_t a22)
{
  uint64_t v23 = v22;
  uint64_t v71 = a8;
  uint64_t v70 = a7;
  uint64_t v68 = a6;
  uint64_t v67 = a5;
  uint64_t v64 = a4;
  uint64_t v83 = a2;
  uint64_t v80 = a3;
  uint64_t v81 = a17;
  uint64_t v76 = a21;
  v77 = a18;
  int v74 = a20;
  int v73 = a19;
  uint64_t v78 = a16;
  uint64_t v85 = a15;
  int v69 = a14;
  uint64_t v66 = a13;
  uint64_t v65 = a12;
  uint64_t v63 = a11;
  uint64_t v75 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  uint64_t v62 = *(void *)(v75 - 8);
  uint64_t v28 = v62;
  MEMORY[0x270FA5388](v75);
  v72 = (char *)&v62 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = &v22[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_isGlideEligible];
  *uint64_t v30 = 0;
  uint64_t v31 = &v22[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_networkAvailableAtRequest];
  *uint64_t v31 = 1;
  *(void *)&v22[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_internalSignalsFromSiriAudio] = MEMORY[0x263F8EE78];
  uint64_t v32 = OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_lock;
  *(void *)&v22[v32] = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08958]), sel_init);
  *(void *)&v22[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_serverAudioResults] = a1;
  uint64_t v33 = &v22[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_audioUnderstanding];
  uint64_t v82 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioUnderstanding();
  uint64_t v84 = *(void *)(v82 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v84 + 16))(v33, a2, v82);
  uint64_t v34 = &v22[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_playbackSignals];
  uint64_t v79 = type metadata accessor for Apple_Parsec_Siri_V2alpha_PlaybackSignals();
  uint64_t v35 = *(void *)(v79 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v35 + 16))(v34, a3, v79);
  *(void *)&v22[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_originalSignals] = v64;
  uint64_t v36 = &v22[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_pegasusAudioType];
  uint64_t v37 = v68;
  *(void *)uint64_t v36 = v67;
  *((void *)v36 + 1) = v37;
  __int16 v38 = &v22[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_launchID];
  uint64_t v39 = v71;
  *(void *)__int16 v38 = v70;
  *((void *)v38 + 1) = v39;
  uint64_t v40 = &v22[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_systemExtensionBundleID];
  uint64_t v41 = v63;
  *(void *)uint64_t v40 = a10;
  *((void *)v40 + 1) = v41;
  uint64_t v42 = &v22[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_boltProxiedBundleID];
  uint64_t v43 = v66;
  *(void *)uint64_t v42 = v65;
  *((void *)v42 + 1) = v43;
  v22[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_shouldPerformAppSelection] = v69;
  uint64_t v44 = &v22[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_audioClientComponent];
  uint64_t v71 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioClientComponent();
  uint64_t v45 = *(void *)(v71 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v45 + 16))(v44, v85, v71);
  type metadata accessor for Graph();
  swift_allocObject();
  *(void *)&v23[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_parse] = Graph.init()();
  swift_beginAccess();
  *uint64_t v30 = v73;
  swift_beginAccess();
  *uint64_t v31 = v74;
  *(void *)&v23[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_matchingSpans] = v76;
  outlined init with copy of Apple_Parsec_Siri_V2alpha_MultiUserContext?(a22, (uint64_t)&v23[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_multiUserContext], &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_MultiUserContext?);
  uint64_t v46 = *(void (**)(char *, uint64_t, uint64_t))(v28 + 16);
  uint64_t v47 = v72;
  uint64_t v48 = v77;
  uint64_t v49 = v75;
  v46(v72, (uint64_t)v77, v75);
  *(void *)&v23[OBJC_IVAR____TtC21SiriInformationSearch10Experience_associatedEntities] = MEMORY[0x263F8EE78];
  uint64_t v50 = &v23[OBJC_IVAR____TtC21SiriInformationSearch10Experience_pluginIdentifier];
  uint64_t v51 = v81;
  *(void *)uint64_t v50 = v78;
  *((void *)v50 + 1) = v51;
  *(double *)&v23[OBJC_IVAR____TtC21SiriInformationSearch10Experience_queryConfidence] = a9;
  v46(&v23[OBJC_IVAR____TtC21SiriInformationSearch10Experience_userDialogAct], (uint64_t)v47, v49);
  id v52 = objc_allocWithZone((Class)type metadata accessor for PommesRenderOptions(0));
  char v53 = v23;
  id v54 = objc_msgSend(v52, sel_init);
  *(void *)&v53[OBJC_IVAR____TtC21SiriInformationSearch10Experience_renderOptions] = v54;
  uint64_t v55 = &v53[OBJC_IVAR____TtC21SiriInformationSearch10Experience_intent];
  uint64_t v56 = *MEMORY[0x263F5CA28];
  uint64_t v57 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v57 - 8) + 104))(v55, v56, v57);

  int v58 = (objc_class *)type metadata accessor for Experience(0);
  v86.receiver = v53;
  v86.super_class = v58;
  id v59 = objc_msgSendSuper2(&v86, sel_init);
  id v60 = *(void (**)(char *, uint64_t))(v62 + 8);
  v60(v47, v49);
  outlined destroy of ClientExperienceSignals?(a22, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_MultiUserContext?);
  v60(v48, v49);
  (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v85, v71);
  (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v80, v79);
  (*(void (**)(uint64_t, uint64_t))(v84 + 8))(v83, v82);
  return v59;
}

uint64_t AudioExperience.Builder.serverAudioResults.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t AudioExperience.Builder.serverAudioResults.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v1 = a1;
  return result;
}

uint64_t (*AudioExperience.Builder.serverAudioResults.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

uint64_t AudioExperience.Builder.audioUnderstanding.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for AudioExperience.Builder(0);
  return outlined init with copy of Apple_Parsec_Siri_V2alpha_MultiUserContext?(v1 + *(int *)(v3 + 20), a1, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_AudioUnderstanding?);
}

uint64_t AudioExperience.Builder.audioUnderstanding.setter(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for AudioExperience.Builder(0);
  return outlined assign with take of Apple_Parsec_Siri_V2alpha_AudioUnderstanding?(a1, v1 + *(int *)(v3 + 20), &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_AudioUnderstanding?);
}

uint64_t (*AudioExperience.Builder.audioUnderstanding.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

uint64_t AudioExperience.Builder.playbackSignals.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for AudioExperience.Builder(0);
  return outlined init with copy of Apple_Parsec_Siri_V2alpha_MultiUserContext?(v1 + *(int *)(v3 + 24), a1, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_PlaybackSignals?);
}

uint64_t AudioExperience.Builder.playbackSignals.setter(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for AudioExperience.Builder(0);
  return outlined assign with take of Apple_Parsec_Siri_V2alpha_AudioUnderstanding?(a1, v1 + *(int *)(v3 + 24), &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_PlaybackSignals?);
}

uint64_t (*AudioExperience.Builder.playbackSignals.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

uint64_t AudioExperience.Builder.internalSignals.getter()
{
  type metadata accessor for AudioExperience.Builder(0);

  return swift_bridgeObjectRetain();
}

uint64_t AudioExperience.Builder.internalSignals.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for AudioExperience.Builder(0) + 28);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*AudioExperience.Builder.internalSignals.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

uint64_t AudioExperience.Builder.internalSignalsFromSiriAudio.getter()
{
  type metadata accessor for AudioExperience.Builder(0);

  return swift_bridgeObjectRetain();
}

uint64_t AudioExperience.Builder.internalSignalsFromSiriAudio.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for AudioExperience.Builder(0) + 32);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*AudioExperience.Builder.internalSignalsFromSiriAudio.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

uint64_t AudioExperience.Builder.pegasusAudioType.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for AudioExperience.Builder(0) + 36));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AudioExperience.Builder.pegasusAudioType.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for AudioExperience.Builder(0) + 36));
  uint64_t result = swift_bridgeObjectRelease();
  void *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*AudioExperience.Builder.pegasusAudioType.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

uint64_t AudioExperience.Builder.launchID.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for AudioExperience.Builder(0) + 40));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AudioExperience.Builder.launchID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for AudioExperience.Builder(0) + 40));
  uint64_t result = swift_bridgeObjectRelease();
  void *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*AudioExperience.Builder.launchID.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

uint64_t AudioExperience.Builder.systemExtensionBundleID.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for AudioExperience.Builder(0) + 44));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AudioExperience.Builder.systemExtensionBundleID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for AudioExperience.Builder(0) + 44));
  uint64_t result = swift_bridgeObjectRelease();
  void *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*AudioExperience.Builder.systemExtensionBundleID.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

uint64_t AudioExperience.Builder.boltProxiedBundleID.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for AudioExperience.Builder(0) + 48));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AudioExperience.Builder.boltProxiedBundleID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for AudioExperience.Builder(0) + 48));
  uint64_t result = swift_bridgeObjectRelease();
  void *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*AudioExperience.Builder.boltProxiedBundleID.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

uint64_t AudioExperience.Builder.shouldPerformAppSelection.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for AudioExperience.Builder(0) + 52));
}

uint64_t AudioExperience.Builder.shouldPerformAppSelection.setter(char a1)
{
  uint64_t result = type metadata accessor for AudioExperience.Builder(0);
  *(unsigned char *)(v1 + *(int *)(result + 52)) = a1;
  return result;
}

uint64_t (*AudioExperience.Builder.shouldPerformAppSelection.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

uint64_t AudioExperience.Builder.audioClientComponent.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for AudioExperience.Builder(0);
  return outlined init with copy of Apple_Parsec_Siri_V2alpha_MultiUserContext?(v1 + *(int *)(v3 + 56), a1, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_AudioClientComponent?);
}

uint64_t AudioExperience.Builder.audioClientComponent.setter(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for AudioExperience.Builder(0);
  return outlined assign with take of Apple_Parsec_Siri_V2alpha_AudioUnderstanding?(a1, v1 + *(int *)(v3 + 56), &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_AudioClientComponent?);
}

uint64_t (*AudioExperience.Builder.audioClientComponent.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

uint64_t AudioExperience.Builder.isGlideEligible.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for AudioExperience.Builder(0) + 60));
}

uint64_t AudioExperience.Builder.isGlideEligible.setter(char a1)
{
  uint64_t result = type metadata accessor for AudioExperience.Builder(0);
  *(unsigned char *)(v1 + *(int *)(result + 60)) = a1;
  return result;
}

uint64_t (*AudioExperience.Builder.isGlideEligible.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

uint64_t AudioExperience.Builder.networkAvailableAtRequest.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for AudioExperience.Builder(0) + 64));
}

uint64_t AudioExperience.Builder.networkAvailableAtRequest.setter(char a1)
{
  uint64_t result = type metadata accessor for AudioExperience.Builder(0);
  *(unsigned char *)(v1 + *(int *)(result + 64)) = a1;
  return result;
}

uint64_t (*AudioExperience.Builder.networkAvailableAtRequest.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

uint64_t AudioExperience.Builder.matchingSpans.getter()
{
  type metadata accessor for AudioExperience.Builder(0);

  return swift_bridgeObjectRetain();
}

uint64_t AudioExperience.Builder.matchingSpans.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for AudioExperience.Builder(0) + 68);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*AudioExperience.Builder.matchingSpans.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

void *AudioExperience.Builder.renderOptions.getter()
{
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for AudioExperience.Builder(0) + 72));
  id v2 = v1;
  return v1;
}

void AudioExperience.Builder.renderOptions.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for AudioExperience.Builder(0) + 72);

  *(void *)(v1 + v3) = a1;
}

uint64_t (*AudioExperience.Builder.renderOptions.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

uint64_t AudioExperience.Builder.multiUserContext.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for AudioExperience.Builder(0);
  return outlined init with copy of Apple_Parsec_Siri_V2alpha_MultiUserContext?(v1 + *(int *)(v3 + 76), a1, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_MultiUserContext?);
}

uint64_t AudioExperience.Builder.multiUserContext.setter(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for AudioExperience.Builder(0);
  return outlined assign with take of Apple_Parsec_Siri_V2alpha_AudioUnderstanding?(a1, v1 + *(int *)(v3 + 76), &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_MultiUserContext?);
}

uint64_t (*AudioExperience.Builder.multiUserContext.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

uint64_t specialized AudioExperience.Builder.require<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t (*a3)(void)@<X2>, uint64_t *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(a2);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getAtKeyPath();
  uint64_t v13 = a3(0);
  uint64_t v14 = *(void *)(v13 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v14 + 32))(a5, v12, v13);
  }
  outlined destroy of ClientExperienceSignals?((uint64_t)v12, a2);
  v17[2] = 0;
  v17[3] = 0xE000000000000000;
  _StringGuts.grow(_:)(56);
  v16._object = (void *)0x800000025C9817C0;
  v16._countAndFlagsBits = 0xD000000000000036;
  String.append(_:)(v16);
  v17[1] = a1;
  __swift_instantiateConcreteTypeFromMangledName(a4);
  _print_unlocked<A, B>(_:_:)();
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized AudioExperience.Builder.require<A>(_:)(uint64_t a1, uint64_t *a2)
{
  swift_getAtKeyPath();
  uint64_t result = v5;
  if (!v5)
  {
    _StringGuts.grow(_:)(56);
    v4._object = (void *)0x800000025C9817C0;
    v4._countAndFlagsBits = 0xD000000000000036;
    String.append(_:)(v4);
    __swift_instantiateConcreteTypeFromMangledName(a2);
    _print_unlocked<A, B>(_:_:)();
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

uint64_t specialized AudioExperience.Builder.require<A>(_:)()
{
  swift_getAtKeyPath();
  if (v3) {
    return v2;
  }
  _StringGuts.grow(_:)(56);
  v1._object = (void *)0x800000025C9817C0;
  v1._countAndFlagsBits = 0xD000000000000036;
  String.append(_:)(v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyPath<AudioExperience.Builder, String?>);
  _print_unlocked<A, B>(_:_:)();
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

{
  uint64_t result;
  Swift::String v1;
  char v2;

  swift_getAtKeyPath();
  if (v2 != 2) {
    return v2 & 1;
  }
  _StringGuts.grow(_:)(56);
  v1._object = (void *)0x800000025C9817C0;
  v1._countAndFlagsBits = 0xD000000000000036;
  String.append(_:)(v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyPath<AudioExperience.Builder, Bool?>);
  _print_unlocked<A, B>(_:_:)();
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t AudioExperience.Builder.require<A>(_:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(*MEMORY[0x263F8EA20] + *a1 + 8);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v7 = (char *)v12 - v6;
  swift_getAtKeyPath();
  uint64_t v8 = *(void *)(v4 + 16);
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(a2, v7, v8);
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v12[2] = 0;
  v12[3] = 0xE000000000000000;
  _StringGuts.grow(_:)(56);
  v11._object = (void *)0x800000025C9817C0;
  v11._countAndFlagsBits = 0xD000000000000036;
  String.append(_:)(v11);
  v12[1] = a1;
  type metadata accessor for KeyPath();
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t AudioExperience.Builder.init()@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  uint64_t v2 = (int *)type metadata accessor for AudioExperience.Builder(0);
  uint64_t v3 = (char *)a1 + v2[5];
  uint64_t v4 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioUnderstanding();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  uint64_t v5 = (char *)a1 + v2[6];
  uint64_t v6 = type metadata accessor for Apple_Parsec_Siri_V2alpha_PlaybackSignals();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(void *)((char *)a1 + v2[7]) = 0;
  *(void *)((char *)a1 + v2[8]) = 0;
  uint64_t v7 = (void *)((char *)a1 + v2[9]);
  *uint64_t v7 = 0;
  v7[1] = 0;
  uint64_t v8 = (void *)((char *)a1 + v2[10]);
  *uint64_t v8 = 0;
  v8[1] = 0;
  uint64_t v9 = (void *)((char *)a1 + v2[11]);
  *uint64_t v9 = 0;
  v9[1] = 0;
  uint64_t v10 = (void *)((char *)a1 + v2[12]);
  void *v10 = 0;
  v10[1] = 0;
  *((unsigned char *)a1 + v2[13]) = 2;
  Swift::String v11 = (char *)a1 + v2[14];
  uint64_t v12 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioClientComponent();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  *((unsigned char *)a1 + v2[15]) = 2;
  *((unsigned char *)a1 + v2[16]) = 2;
  *(void *)((char *)a1 + v2[17]) = 0;
  *(void *)((char *)a1 + v2[18]) = 0;
  uint64_t v13 = (char *)a1 + v2[19];
  uint64_t v14 = type metadata accessor for Apple_Parsec_Siri_V2alpha_MultiUserContext();
  uint64_t v15 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56);

  return v15(v13, 1, 1, v14);
}

uint64_t AudioExperience.Builder.init(serverAudioResults:audioUnderstanding:playbackSignals:internalSignals:internalSignalsFromSiriAudio:pegasusAudioType:launchID:systemExtensionBundleID:boltProxiedBundleID:shouldPerformAppSelection:audioClientComponent:isGlideEligible:networkAvailableAtRequest:matchingSpans:renderOptions:multiUserContext:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  *a9 = a1;
  uint64_t v26 = (int *)type metadata accessor for AudioExperience.Builder(0);
  outlined init with take of Apple_Parsec_Siri_V2alpha_AudioUnderstanding?(a2, (uint64_t)a9 + v26[5], &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_AudioUnderstanding?);
  outlined init with take of Apple_Parsec_Siri_V2alpha_AudioUnderstanding?(a3, (uint64_t)a9 + v26[6], &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_PlaybackSignals?);
  *(void *)((char *)a9 + v26[7]) = a4;
  *(void *)((char *)a9 + v26[8]) = a5;
  uint64_t v27 = (void *)((char *)a9 + v26[9]);
  *uint64_t v27 = a6;
  v27[1] = a7;
  uint64_t v28 = (void *)((char *)a9 + v26[10]);
  *uint64_t v28 = a8;
  v28[1] = a10;
  uint64_t v29 = (void *)((char *)a9 + v26[11]);
  *uint64_t v29 = a11;
  v29[1] = a12;
  uint64_t v30 = (void *)((char *)a9 + v26[12]);
  *uint64_t v30 = a13;
  v30[1] = a14;
  *((unsigned char *)a9 + v26[13]) = a15;
  outlined init with take of Apple_Parsec_Siri_V2alpha_AudioUnderstanding?(a16, (uint64_t)a9 + v26[14], &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_AudioClientComponent?);
  *((unsigned char *)a9 + v26[15]) = a17;
  *((unsigned char *)a9 + v26[16]) = a18;
  *(void *)((char *)a9 + v26[17]) = a19;
  *(void *)((char *)a9 + v26[18]) = a20;
  return outlined init with take of Apple_Parsec_Siri_V2alpha_AudioUnderstanding?(a21, (uint64_t)a9 + v26[19], &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_MultiUserContext?);
}

id AudioExperience.__allocating_init(pluginId:queryConfidence:userDialogAct:builder:)(uint64_t a1, uint64_t a2, char *a3, void (*a4)(char *), uint64_t a5, double a6)
{
  id v13 = objc_allocWithZone(v6);
  return AudioExperience.init(pluginId:queryConfidence:userDialogAct:builder:)(a1, a2, a3, a4, a5, a6);
}

id AudioExperience.init(pluginId:queryConfidence:userDialogAct:builder:)(uint64_t a1, uint64_t a2, char *a3, void (*a4)(char *), uint64_t a5, double a6)
{
  uint64_t v86 = a5;
  v87 = a4;
  v108 = a3;
  uint64_t v101 = a2;
  uint64_t v100 = a1;
  uint64_t v8 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent();
  uint64_t v103 = *(void *)(v8 - 8);
  uint64_t v104 = v8;
  MEMORY[0x270FA5388](v8);
  v102 = (char *)&v81 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  uint64_t v107 = *(void *)(v88 - 8);
  MEMORY[0x270FA5388](v88);
  v99 = (char *)&v81 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioClientComponent();
  uint64_t v105 = *(void *)(v11 - 8);
  id v106 = (id)v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v97 = (uint64_t)&v81 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = type metadata accessor for Apple_Parsec_Siri_V2alpha_PlaybackSignals();
  uint64_t v82 = *(void *)(v83 - 8);
  MEMORY[0x270FA5388](v83);
  uint64_t v85 = (uint64_t)&v81 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioUnderstanding();
  uint64_t v84 = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v81 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for AudioExperience.Builder(0);
  uint64_t v19 = (int *)(v18 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  id v22 = (char *)&v81 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)&v81 - v23;
  v95 = &v6[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_isGlideEligible];
  v6[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_isGlideEligible] = 0;
  v96 = &v6[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_networkAvailableAtRequest];
  v6[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_networkAvailableAtRequest] = 1;
  v98 = &v6[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_internalSignalsFromSiriAudio];
  *(void *)&v6[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_internalSignalsFromSiriAudio] = MEMORY[0x263F8EE78];
  uint64_t v25 = OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_lock;
  id v26 = objc_allocWithZone(MEMORY[0x263F08958]);
  uint64_t v27 = v6;
  *(void *)&v6[v25] = objc_msgSend(v26, sel_init);
  *(void *)uint64_t v24 = 0;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(&v24[v19[7]], 1, 1, v14);
  uint64_t v28 = v82;
  uint64_t v29 = v83;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v82 + 56))(&v24[v19[8]], 1, 1, v83);
  *(void *)&v24[v19[9]] = 0;
  uint64_t v93 = v19[10];
  *(void *)&v24[v93] = 0;
  uint64_t v30 = &v24[v19[11]];
  *(void *)uint64_t v30 = 0;
  *((void *)v30 + 1) = 0;
  uint64_t v31 = &v24[v19[12]];
  *(void *)uint64_t v31 = 0;
  *((void *)v31 + 1) = 0;
  uint64_t v32 = &v24[v19[13]];
  *(void *)uint64_t v32 = 0;
  *((void *)v32 + 1) = 0;
  uint64_t v33 = &v24[v19[14]];
  *(void *)uint64_t v33 = 0;
  *((void *)v33 + 1) = 0;
  v24[v19[15]] = 2;
  (*(void (**)(char *, uint64_t, uint64_t, id))(v105 + 56))(&v24[v19[16]], 1, 1, v106);
  uint64_t v89 = v19[17];
  v24[v89] = 2;
  uint64_t v90 = v19[18];
  v24[v90] = 2;
  uint64_t v91 = v19[19];
  *(void *)&v24[v91] = 0;
  uint64_t v94 = v19[20];
  *(void *)&v24[v94] = 0;
  v92 = &v24[v19[21]];
  uint64_t v34 = (uint64_t)v92;
  uint64_t v35 = type metadata accessor for Apple_Parsec_Siri_V2alpha_MultiUserContext();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v34, 1, 1, v35);
  v87(v24);
  outlined init with copy of AudioExperience.Builder((uint64_t)v24, (uint64_t)v22);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v37 = specialized AudioExperience.Builder.require<A>(_:)(KeyPath, &demangling cache variable for type metadata for KeyPath<AudioExperience.Builder, [Apple_Parsec_Siri_V2alpha_AudioItem]?>);
  swift_release();
  outlined destroy of AudioExperience.Builder((uint64_t)v22, type metadata accessor for AudioExperience.Builder);
  *(void *)&v27[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_serverAudioResults] = v37;
  outlined init with copy of AudioExperience.Builder((uint64_t)v24, (uint64_t)v22);
  uint64_t v38 = swift_getKeyPath();
  specialized AudioExperience.Builder.require<A>(_:)(v38, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_AudioUnderstanding?, MEMORY[0x263F5CEC0], &demangling cache variable for type metadata for KeyPath<AudioExperience.Builder, Apple_Parsec_Siri_V2alpha_AudioUnderstanding?>, (uint64_t)v17);
  swift_release();
  outlined destroy of AudioExperience.Builder((uint64_t)v22, type metadata accessor for AudioExperience.Builder);
  (*(void (**)(unsigned char *, char *, uint64_t))(v15 + 32))(&v27[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_audioUnderstanding], v17, v84);
  outlined init with copy of AudioExperience.Builder((uint64_t)v24, (uint64_t)v22);
  uint64_t v39 = swift_getKeyPath();
  uint64_t v40 = v85;
  specialized AudioExperience.Builder.require<A>(_:)(v39, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_PlaybackSignals?, MEMORY[0x263F5CE70], &demangling cache variable for type metadata for KeyPath<AudioExperience.Builder, Apple_Parsec_Siri_V2alpha_PlaybackSignals?>, v85);
  swift_release();
  outlined destroy of AudioExperience.Builder((uint64_t)v22, type metadata accessor for AudioExperience.Builder);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v28 + 32))(&v27[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_playbackSignals], v40, v29);
  uint64_t v41 = v88;
  outlined init with copy of AudioExperience.Builder((uint64_t)v24, (uint64_t)v22);
  uint64_t v42 = swift_getKeyPath();
  uint64_t v43 = specialized AudioExperience.Builder.require<A>(_:)(v42, &demangling cache variable for type metadata for KeyPath<AudioExperience.Builder, [String]?>);
  swift_release();
  outlined destroy of AudioExperience.Builder((uint64_t)v22, type metadata accessor for AudioExperience.Builder);
  *(void *)&v27[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_originalSignals] = v43;
  outlined init with copy of AudioExperience.Builder((uint64_t)v24, (uint64_t)v22);
  swift_getKeyPath();
  uint64_t v44 = specialized AudioExperience.Builder.require<A>(_:)();
  uint64_t v46 = v45;
  swift_release();
  outlined destroy of AudioExperience.Builder((uint64_t)v22, type metadata accessor for AudioExperience.Builder);
  uint64_t v47 = (uint64_t *)&v27[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_pegasusAudioType];
  *uint64_t v47 = v44;
  v47[1] = v46;
  outlined init with copy of AudioExperience.Builder((uint64_t)v24, (uint64_t)v22);
  swift_getKeyPath();
  uint64_t v48 = specialized AudioExperience.Builder.require<A>(_:)();
  uint64_t v50 = v49;
  swift_release();
  outlined destroy of AudioExperience.Builder((uint64_t)v22, type metadata accessor for AudioExperience.Builder);
  uint64_t v51 = (uint64_t *)&v27[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_launchID];
  *uint64_t v51 = v48;
  v51[1] = v50;
  outlined init with copy of AudioExperience.Builder((uint64_t)v24, (uint64_t)v22);
  swift_getKeyPath();
  uint64_t v52 = specialized AudioExperience.Builder.require<A>(_:)();
  uint64_t v54 = v53;
  swift_release();
  outlined destroy of AudioExperience.Builder((uint64_t)v22, type metadata accessor for AudioExperience.Builder);
  uint64_t v55 = (uint64_t *)&v27[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_systemExtensionBundleID];
  *uint64_t v55 = v52;
  v55[1] = v54;
  outlined init with copy of AudioExperience.Builder((uint64_t)v24, (uint64_t)v22);
  swift_getKeyPath();
  uint64_t v56 = specialized AudioExperience.Builder.require<A>(_:)();
  uint64_t v58 = v57;
  swift_release();
  outlined destroy of AudioExperience.Builder((uint64_t)v22, type metadata accessor for AudioExperience.Builder);
  id v59 = (uint64_t *)&v27[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_boltProxiedBundleID];
  *id v59 = v56;
  v59[1] = v58;
  outlined init with copy of AudioExperience.Builder((uint64_t)v24, (uint64_t)v22);
  swift_getKeyPath();
  LOBYTE(v56) = specialized AudioExperience.Builder.require<A>(_:)();
  swift_release();
  outlined destroy of AudioExperience.Builder((uint64_t)v22, type metadata accessor for AudioExperience.Builder);
  v27[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_shouldPerformAppSelection] = v56 & 1;
  outlined init with copy of AudioExperience.Builder((uint64_t)v24, (uint64_t)v22);
  uint64_t v60 = swift_getKeyPath();
  uint64_t v61 = v97;
  specialized AudioExperience.Builder.require<A>(_:)(v60, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_AudioClientComponent?, MEMORY[0x263F5CF38], &demangling cache variable for type metadata for KeyPath<AudioExperience.Builder, Apple_Parsec_Siri_V2alpha_AudioClientComponent?>, v97);
  swift_release();
  outlined destroy of AudioExperience.Builder((uint64_t)v22, type metadata accessor for AudioExperience.Builder);
  (*(void (**)(unsigned char *, uint64_t, id))(v105 + 32))(&v27[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_audioClientComponent], v61, v106);
  type metadata accessor for Graph();
  swift_allocObject();
  *(void *)&v27[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_parse] = Graph.init()();
  LOBYTE(v34) = v24[v89] & 1;
  uint64_t v62 = v95;
  swift_beginAccess();
  *uint64_t v62 = v34;
  LOBYTE(v34) = (v24[v90] == 2) | v24[v90];
  uint64_t v63 = v96;
  swift_beginAccess();
  *uint64_t v63 = v34 & 1;
  uint64_t v64 = MEMORY[0x263F8EE78];
  if (*(void *)&v24[v91]) {
    uint64_t v65 = *(void *)&v24[v91];
  }
  else {
    uint64_t v65 = MEMORY[0x263F8EE78];
  }
  *(void *)&v27[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_matchingSpans] = v65;
  if (*(void *)&v24[v93]) {
    uint64_t v66 = *(void *)&v24[v93];
  }
  else {
    uint64_t v66 = v64;
  }
  uint64_t v67 = v98;
  swift_beginAccess();
  *uint64_t v67 = v66;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  outlined init with copy of Apple_Parsec_Siri_V2alpha_MultiUserContext?((uint64_t)v92, (uint64_t)&v27[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_multiUserContext], &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_MultiUserContext?);

  uint64_t v68 = *(void (**)(void))(v107 + 16);
  int v69 = v99;
  v68();
  uint64_t v70 = *(void **)&v24[v94];
  if (v70) {
    id v106 = *(id *)&v24[v94];
  }
  else {
    id v106 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for PommesRenderOptions(0)), sel_init);
  }
  uint64_t v71 = v102;
  uint64_t v72 = v103;
  uint64_t v73 = v104;
  (*(void (**)(char *, void, uint64_t))(v103 + 104))(v102, *MEMORY[0x263F5CA28], v104);
  *(void *)&v27[OBJC_IVAR____TtC21SiriInformationSearch10Experience_associatedEntities] = MEMORY[0x263F8EE78];
  int v74 = &v27[OBJC_IVAR____TtC21SiriInformationSearch10Experience_pluginIdentifier];
  uint64_t v75 = v101;
  *int v74 = v100;
  v74[1] = v75;
  *(double *)&v27[OBJC_IVAR____TtC21SiriInformationSearch10Experience_queryConfidence] = a6;
  ((void (*)(unsigned char *, char *, uint64_t))v68)(&v27[OBJC_IVAR____TtC21SiriInformationSearch10Experience_userDialogAct], v69, v41);
  *(void *)&v27[OBJC_IVAR____TtC21SiriInformationSearch10Experience_renderOptions] = v106;
  (*(void (**)(unsigned char *, char *, uint64_t))(v72 + 16))(&v27[OBJC_IVAR____TtC21SiriInformationSearch10Experience_intent], v71, v73);
  uint64_t v76 = (objc_class *)type metadata accessor for Experience(0);
  v109.receiver = v27;
  v109.super_class = v76;
  id v77 = v70;
  id v78 = objc_msgSendSuper2(&v109, sel_init);
  (*(void (**)(char *, uint64_t))(v72 + 8))(v71, v73);
  uint64_t v79 = *(void (**)(char *, uint64_t))(v107 + 8);
  v79(v69, v41);
  v79(v108, v41);
  outlined destroy of AudioExperience.Builder((uint64_t)v24, type metadata accessor for AudioExperience.Builder);
  return v78;
}

uint64_t AudioExperience.__allocating_init(coder:)(NSObject *a1)
{
  id v3 = objc_allocWithZone(v1);
  return AudioExperience.init(coder:)(a1);
}

uint64_t AudioExperience.init(coder:)(NSObject *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_MultiUserContext?);
  MEMORY[0x270FA5388](v3 - 8);
  v143 = (char *)&v130 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v144 = type metadata accessor for Siri_Nlu_External_Span();
  uint64_t v150 = *(void *)(v144 - 8);
  MEMORY[0x270FA5388](v144);
  v153 = (char *)&v130 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v156 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioClientComponent();
  uint64_t v154 = *(void *)(v156 - 8);
  MEMORY[0x270FA5388](v156);
  v148 = (char *)&v130 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v159 = type metadata accessor for Apple_Parsec_Siri_V2alpha_PlaybackSignals();
  uint64_t v155 = *(void *)(v159 - 8);
  MEMORY[0x270FA5388](v159);
  v152 = (char *)&v130 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v163 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioItem();
  uint64_t v162 = *(void *)(v163 - 8);
  MEMORY[0x270FA5388](v163);
  uint64_t v9 = (char *)&v130 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for BinaryDecodingOptions();
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  v142 = (char *)&v130 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  v149 = (char *)&v130 - v14;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  v147 = (char *)&v130 - v16;
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  v151 = (char *)&v130 - v18;
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  MEMORY[0x270FA5388](v19);
  v157 = ((char *)&v130 - v20);
  uint64_t v161 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioUnderstanding();
  uint64_t v158 = *(void *)(v161 - 8);
  MEMORY[0x270FA5388](v161);
  v160 = ((char *)&v130 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  v145 = &v1[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_isGlideEligible];
  v1[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_isGlideEligible] = 0;
  v146 = &v1[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_networkAvailableAtRequest];
  v1[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_networkAvailableAtRequest] = 1;
  v170 = &v1[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_internalSignalsFromSiriAudio];
  *(void *)&v1[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_internalSignalsFromSiriAudio] = MEMORY[0x263F8EE78];
  uint64_t v22 = OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_lock;
  id v23 = objc_allocWithZone(MEMORY[0x263F08958]);
  uint64_t v24 = v1;
  id v25 = objc_msgSend(v23, sel_init);
  v169 = v1;
  uint64_t v168 = v22;
  *(void *)&v1[v22] = v25;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject.Type>);
  uint64_t v26 = swift_allocObject();
  long long v164 = xmmword_25C97F8F0;
  *(_OWORD *)(v26 + 16) = xmmword_25C97F8F0;
  uint64_t v27 = type metadata accessor for NSArray(0, &lazy cache variable for type metadata for NSArray);
  *(void *)(v26 + 32) = v27;
  uint64_t v167 = type metadata accessor for NSArray(0, (unint64_t *)&lazy cache variable for type metadata for NSData);
  *(void *)(v26 + 40) = v167;
  v171 = a1;
  NSCoder.decodeObject(of:forKey:)();
  swift_bridgeObjectRelease();
  if (!*((void *)&v176 + 1))
  {

LABEL_29:
    outlined destroy of ClientExperienceSignals?((uint64_t)&v175, (uint64_t *)&demangling cache variable for type metadata for Any?);
LABEL_31:
    uint64_t v29 = v171;
LABEL_36:
    if (one-time initialization token for pommes != -1) {
      swift_once();
    }
    uint64_t v57 = type metadata accessor for Logger();
    __swift_project_value_buffer(v57, (uint64_t)static Logger.pommes);
    uint64_t v58 = Logger.logObject.getter();
    os_log_type_t v59 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v58, v59))
    {
      uint64_t v60 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v60 = 0;
      _os_log_impl(&dword_25C8FE000, v58, v59, "AudioExperience cannot be decoded", v60, 2u);
      MEMORY[0x261199590](v60, -1, -1);
    }

    uint64_t v61 = v169;
    uint64_t v62 = v168;
LABEL_41:
    swift_bridgeObjectRelease();
LABEL_42:

    type metadata accessor for AudioExperience(0);
    swift_deallocPartialClassInstance();
    return 0;
  }
  v166 = v24;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [NSData]);
  if ((swift_dynamicCast() & 1) == 0)
  {

    goto LABEL_31;
  }
  uint64_t v28 = v173;
  uint64_t v29 = v171;
  uint64_t v30 = NSCoder.decodeObject<A>(of:forKey:)();
  if (!v30)
  {
LABEL_32:
    swift_bridgeObjectRelease();
LABEL_35:

    goto LABEL_36;
  }
  id v141 = v30;
  uint64_t v31 = NSCoder.decodeObject<A>(of:forKey:)();
  if (!v31)
  {
    swift_bridgeObjectRelease();
    uint64_t v56 = (id *)&v172;
LABEL_34:

    goto LABEL_35;
  }
  uint64_t v32 = (void *)v31;
  uint64_t v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = v164;
  *(void *)(v33 + 32) = v27;
  uint64_t v34 = type metadata accessor for NSArray(0, (unint64_t *)&lazy cache variable for type metadata for NSString);
  *(void *)(v33 + 40) = v34;
  NSCoder.decodeObject(of:forKey:)();
  swift_bridgeObjectRelease();
  if (!*((void *)&v176 + 1))
  {

    swift_bridgeObjectRelease();
    goto LABEL_29;
  }
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [String]);
  if ((swift_dynamicCast() & 1) == 0)
  {

    swift_bridgeObjectRelease();
    goto LABEL_31;
  }
  v139 = v35;
  unint64_t v140 = (unint64_t)v28;
  uint64_t v36 = v173;
  uint64_t v37 = swift_allocObject();
  *(_OWORD *)(v37 + 16) = v164;
  *(void *)(v37 + 32) = v27;
  *(void *)(v37 + 40) = v34;
  uint64_t v29 = v171;
  NSCoder.decodeObject(of:forKey:)();
  swift_bridgeObjectRelease();
  if (!*((void *)&v176 + 1))
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    outlined destroy of ClientExperienceSignals?((uint64_t)&v175, (uint64_t *)&demangling cache variable for type metadata for Any?);
    goto LABEL_36;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_36;
  }
  uint64_t v38 = v173;
  uint64_t v39 = NSCoder.decodeObject<A>(of:forKey:)();
  if (!v39)
  {
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    goto LABEL_32;
  }
  v139 = v39;
  v138 = v38;
  uint64_t v40 = NSCoder.decodeObject<A>(of:forKey:)();
  if (!v40)
  {
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v56 = (id *)&v170;
    goto LABEL_34;
  }
  uint64_t v41 = (void *)v40;
  v135 = v36;
  uint64_t v42 = NSCoder.decodeObject<A>(of:forKey:)();
  if (!v42)
  {
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    goto LABEL_35;
  }
  uint64_t v43 = v42;
  uint64_t v44 = NSCoder.decodeObject<A>(of:forKey:)();
  if (!v44)
  {
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    goto LABEL_35;
  }
  v134 = v44;
  uint64_t v45 = NSCoder.decodeObject<A>(of:forKey:)();
  if (!v45)
  {
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    uint64_t v56 = (id *)&v165;
    goto LABEL_34;
  }
  id v130 = v45;
  id v131 = v32;
  id v133 = v41;
  id v132 = (id)v43;
  if (v140 >> 62) {
    goto LABEL_110;
  }
  uint64_t v46 = *(void *)((v140 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t v47 = (char *)v160;
    unint64_t v48 = 0x26A5DD000;
    if (!v46) {
      break;
    }
    v173 = (void *)MEMORY[0x263F8EE78];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v46 & ~(v46 >> 63), 0);
    if (v46 < 0)
    {
      __break(1u);
      goto LABEL_112;
    }
    uint64_t v49 = 0;
    *(void *)&long long v164 = 0;
    uint64_t v32 = v173;
    unint64_t v137 = v140 & 0xC000000000000001;
    uint64_t v136 = v162 + 32;
    uint64_t v43 = v46;
    while ((void *)v46 != v49)
    {
      if (v137) {
        id v50 = (id)MEMORY[0x261198DD0](v49, v140);
      }
      else {
        id v50 = *(id *)(v140 + 8 * (void)v49 + 32);
      }
      uint64_t v51 = v50;
      static Data._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v177 = 0;
      long long v176 = 0u;
      long long v175 = 0u;
      BinaryDecodingOptions.init()();
      lazy protocol witness table accessor for type Apple_Parsec_Siri_V2alpha_AudioItem and conformance Apple_Parsec_Siri_V2alpha_AudioItem((unint64_t *)&lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_AudioItem and conformance Apple_Parsec_Siri_V2alpha_AudioItem, MEMORY[0x263F5CCC8]);
      uint64_t v52 = v164;
      Message.init(serializedData:extensions:partial:options:)();
      *(void *)&long long v164 = v52;
      if (v52)
      {
        __int16 v65 = 128;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        swift_release();
        swift_bridgeObjectRelease();
        uint64_t v66 = v166;

        uint64_t v67 = (void *)v164;
        goto LABEL_58;
      }

      uint64_t v53 = v32;
      v173 = v32;
      unint64_t v55 = v32[2];
      unint64_t v54 = v32[3];
      if (v55 >= v54 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v54 > 1, v55 + 1, 1);
        uint64_t v53 = v173;
      }
      uint64_t v49 = (char *)v49 + 1;
      v53[2] = v55 + 1;
      uint64_t v32 = v53;
      (*(void (**)(unint64_t, char *, unint64_t))(v162 + 32))((unint64_t)v53+ ((*(unsigned __int8 *)(v162 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v162 + 80))+ *(void *)(v162 + 72) * v55, v9, v163);
      uint64_t v46 = v43;
      uint64_t v29 = v171;
      if ((void *)v43 == v49)
      {
        uint64_t v47 = (char *)v160;
        swift_bridgeObjectRelease();
        uint64_t v46 = v164;
        unint64_t v48 = 0x26A5DD000uLL;
        goto LABEL_55;
      }
    }
    __break(1u);
LABEL_110:
    swift_bridgeObjectRetain();
    uint64_t v46 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  uint64_t v32 = (void *)MEMORY[0x263F8EE78];
LABEL_55:
  uint64_t v66 = v166;
  *(void *)&v166[*(void *)(v48 + 3120)] = v32;
  id v68 = v141;
  static Data._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v177 = 0;
  long long v176 = 0u;
  long long v175 = 0u;
  BinaryDecodingOptions.init()();
  lazy protocol witness table accessor for type Apple_Parsec_Siri_V2alpha_AudioItem and conformance Apple_Parsec_Siri_V2alpha_AudioItem((unint64_t *)&lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_AudioUnderstanding and conformance Apple_Parsec_Siri_V2alpha_AudioUnderstanding, MEMORY[0x263F5CEC0]);
  Message.init(serializedData:extensions:partial:options:)();
  uint64_t v67 = (void *)v46;
  if (v46)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    __int16 v65 = 129;
    goto LABEL_58;
  }
  *(void *)&long long v164 = v68;
  (*(void (**)(char *, char *, uint64_t))(v158 + 32))(&v66[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_audioUnderstanding], v47, v161);
  int v69 = v131;
  static Data._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v177 = 0;
  long long v176 = 0u;
  long long v175 = 0u;
  BinaryDecodingOptions.init()();
  lazy protocol witness table accessor for type Apple_Parsec_Siri_V2alpha_AudioItem and conformance Apple_Parsec_Siri_V2alpha_AudioItem((unint64_t *)&lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_PlaybackSignals and conformance Apple_Parsec_Siri_V2alpha_PlaybackSignals, MEMORY[0x263F5CE70]);
  uint64_t v70 = v152;
  Message.init(serializedData:extensions:partial:options:)();
  v160 = v69;
  (*(void (**)(char *, char *, uint64_t))(v155 + 32))(&v66[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_playbackSignals], v70, v159);
  *(void *)&v66[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_originalSignals] = v135;
  uint64_t v71 = v170;
  swift_beginAccess();
  *uint64_t v71 = v138;
  swift_bridgeObjectRelease();
  uint64_t v72 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v73 = (uint64_t *)&v66[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_pegasusAudioType];
  *uint64_t v73 = v72;
  v73[1] = v74;
  uint64_t v75 = (char *)v130;
  static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v157 = v75;

  uint64_t v177 = 0;
  long long v176 = 0u;
  long long v175 = 0u;
  BinaryDecodingOptions.init()();
  lazy protocol witness table accessor for type Apple_Parsec_Siri_V2alpha_AudioItem and conformance Apple_Parsec_Siri_V2alpha_AudioItem((unint64_t *)&lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_AudioClientComponent and conformance Apple_Parsec_Siri_V2alpha_AudioClientComponent, MEMORY[0x263F5CF38]);
  uint64_t v76 = v148;
  Message.init(serializedData:extensions:partial:options:)();
  uint64_t v32 = 0;
  (*(void (**)(char *, char *, uint64_t))(v154 + 32))(&v66[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_audioClientComponent], v76, v156);
  type metadata accessor for Graph();
  swift_allocObject();
  *(void *)&v66[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_parse] = Graph.init()();
  uint64_t v87 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v88 = (uint64_t *)&v66[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_launchID];
  *uint64_t v88 = v87;
  v88[1] = v89;
  uint64_t v90 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v91 = (uint64_t *)&v66[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_systemExtensionBundleID];
  *uint64_t v91 = v90;
  v91[1] = v92;
  uint64_t v93 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v94 = (uint64_t *)&v66[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_boltProxiedBundleID];
  *uint64_t v94 = v93;
  v94[1] = v95;
  v96 = (void *)MEMORY[0x261198B80](0xD000000000000019, 0x800000025C981900);
  unsigned __int8 v97 = [v29 decodeBoolForKey:v96];

  v66[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_shouldPerformAppSelection] = v97;
  v98 = (void *)MEMORY[0x261198B80](0x456564696C477369, 0xEF656C626967696CLL);
  unsigned __int8 v99 = [v29 decodeBoolForKey:v98];

  uint64_t v100 = v145;
  swift_beginAccess();
  *uint64_t v100 = v99;
  uint64_t v101 = (void *)MEMORY[0x261198B80](0xD000000000000019, 0x800000025C981930);
  LOBYTE(v98) = [v29 decodeBoolForKey:v101];

  v102 = v146;
  swift_beginAccess();
  unsigned char *v102 = (_BYTE)v98;
  unint64_t v103 = NSCoder.decodeArrayOfObjects<A>(ofClass:forKey:)();
  if (!v103)
  {

LABEL_103:
    if (one-time initialization token for pommes != -1) {
      swift_once();
    }
    uint64_t v112 = type metadata accessor for Logger();
    __swift_project_value_buffer(v112, (uint64_t)static Logger.pommes);
    v113 = Logger.logObject.getter();
    os_log_type_t v114 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v113, v114))
    {
      id v115 = v132;
      v116 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v116 = 0;
      _os_log_impl(&dword_25C8FE000, v113, v114, "Unable to decode matchingSpans", v116, 2u);
      MEMORY[0x261199590](v116, -1, -1);
      v117 = v164;
      v118 = v160;
      v119 = v139;
      id v132 = v133;
      id v133 = v115;
      v139 = v134;
      v160 = v113;
      v120 = v171;
      v121 = (char *)&v178;
    }
    else
    {
      v117 = v113;
      v118 = v171;
      v119 = v157;
      v120 = v134;
      v121 = (char *)&v175 + 8;
    }
    *((void *)v121 - 32) = v120;
    __int16 v65 = 12281;

    uint64_t v66 = v166;
    uint64_t v61 = v169;
    uint64_t v62 = v168;
    goto LABEL_64;
  }
  uint64_t v43 = v103;
  if (v103 >> 62) {
    goto LABEL_113;
  }
  uint64_t v104 = *(void *)((v103 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v104)
  {
LABEL_114:
    swift_bridgeObjectRelease();
    uint64_t v106 = MEMORY[0x263F8EE78];
LABEL_115:
    *(void *)&v166[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_matchingSpans] = v106;
    uint64_t v122 = NSCoder.decodeObject<A>(of:forKey:)();
    if (v122)
    {
      v123 = (void *)v122;
      uint64_t v124 = type metadata accessor for Apple_Parsec_Siri_V2alpha_MultiUserContext();
      static Data._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v177 = 0;
      long long v176 = 0u;
      long long v175 = 0u;
      BinaryDecodingOptions.init()();
      lazy protocol witness table accessor for type Apple_Parsec_Siri_V2alpha_AudioItem and conformance Apple_Parsec_Siri_V2alpha_AudioItem((unint64_t *)&lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_MultiUserContext and conformance Apple_Parsec_Siri_V2alpha_MultiUserContext, MEMORY[0x263F5CEA0]);
      Message.init(serializedData:extensions:partial:options:)();
      if (v32)
      {

        v125 = v166;
        uint64_t v66 = v125;
        __int16 v65 = 28665;
        uint64_t v29 = v171;
        uint64_t v67 = v32;
LABEL_58:
        if (one-time initialization token for pommes != -1) {
          swift_once();
        }
        uint64_t v77 = type metadata accessor for Logger();
        __swift_project_value_buffer(v77, (uint64_t)static Logger.pommes);
        id v78 = v67;
        id v79 = v67;
        uint64_t v80 = Logger.logObject.getter();
        os_log_type_t v81 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v80, v81))
        {
          uint64_t v82 = (uint8_t *)swift_slowAlloc();
          uint64_t v83 = swift_slowAlloc();
          *(void *)&long long v175 = v83;
          *(_DWORD *)uint64_t v82 = 136315138;
          swift_getErrorValue();
          uint64_t v84 = Error.localizedDescription.getter();
          uint64_t v174 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v84, v85, (uint64_t *)&v175);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();

          _os_log_impl(&dword_25C8FE000, v80, v81, "Failed to decode AudioExperience %s", v82, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x261199590](v83, -1, -1);
          uint64_t v86 = v82;
          uint64_t v66 = v166;
          MEMORY[0x261199590](v86, -1, -1);
        }
        else
        {
        }
        uint64_t v61 = v169;
        uint64_t v62 = v168;
        if ((v65 & 1) == 0)
        {
LABEL_65:
          if ((v65 & 8) != 0)
          {
            (*(void (**)(char *, uint64_t))(v158 + 8))(&v66[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_audioUnderstanding], v161);
            if ((v65 & 0x10) == 0)
            {
LABEL_67:
              if ((v65 & 0x20) == 0) {
                goto LABEL_68;
              }
              goto LABEL_79;
            }
          }
          else if ((v65 & 0x10) == 0)
          {
            goto LABEL_67;
          }
          swift_release();
          if ((v65 & 0x20) == 0)
          {
LABEL_68:
            if ((v65 & 0x40) == 0) {
              goto LABEL_70;
            }
            goto LABEL_69;
          }
LABEL_79:
          (*(void (**)(char *, uint64_t))(v155 + 8))(&v66[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_playbackSignals], v159);
          if ((v65 & 0x40) == 0)
          {
LABEL_70:
            swift_bridgeObjectRelease();
            if ((v65 & 0x100) != 0)
            {
              swift_bridgeObjectRelease();
              if ((v65 & 0x200) == 0)
              {
LABEL_72:
                if ((v65 & 0x400) == 0) {
                  goto LABEL_73;
                }
                goto LABEL_83;
              }
            }
            else if ((v65 & 0x200) == 0)
            {
              goto LABEL_72;
            }
            swift_bridgeObjectRelease();
            if ((v65 & 0x400) == 0)
            {
LABEL_73:
              if ((v65 & 0x800) == 0) {
                goto LABEL_74;
              }
              goto LABEL_84;
            }
LABEL_83:
            swift_bridgeObjectRelease();
            if ((v65 & 0x800) == 0)
            {
LABEL_74:
              if ((v65 & 0x2000) == 0) {
                goto LABEL_75;
              }
LABEL_85:
              (*(void (**)(char *, uint64_t))(v154 + 8))(&v66[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_audioClientComponent], v156);
              if ((v65 & 0x4000) == 0) {
                goto LABEL_42;
              }
              goto LABEL_41;
            }
LABEL_84:
            swift_bridgeObjectRelease();
            if ((v65 & 0x2000) == 0)
            {
LABEL_75:
              if ((v65 & 0x4000) == 0) {
                goto LABEL_42;
              }
              goto LABEL_41;
            }
            goto LABEL_85;
          }
LABEL_69:
          swift_bridgeObjectRelease();
          goto LABEL_70;
        }
LABEL_64:
        swift_bridgeObjectRelease();
        goto LABEL_65;
      }

      uint64_t v128 = (uint64_t)v143;
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v124 - 8) + 56))(v143, 0, 1, v124);
      outlined init with take of Apple_Parsec_Siri_V2alpha_AudioUnderstanding?(v128, (uint64_t)&v166[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_multiUserContext], &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_MultiUserContext?);
    }
    else
    {
      v126 = &v166[OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_multiUserContext];
      uint64_t v127 = type metadata accessor for Apple_Parsec_Siri_V2alpha_MultiUserContext();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v127 - 8) + 56))(v126, 1, 1, v127);
    }

    id v63 = Experience.init(coder:)(v171);
    id v129 = v63;

    if (v63) {
    return (uint64_t)v63;
    }
  }
  while (1)
  {
    uint64_t v174 = MEMORY[0x263F8EE78];
    uint64_t result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v104 & ~(v104 >> 63), 0);
    if (v104 < 0) {
      break;
    }
    uint64_t v105 = 0;
    uint64_t v106 = v174;
    unint64_t v163 = v43 & 0xC000000000000001;
    uint64_t v162 = v150 + 32;
    uint64_t v107 = v144;
    while (v104 != v105)
    {
      if (v163) {
        id v108 = (id)MEMORY[0x261198DD0](v105, v43);
      }
      else {
        id v108 = *(id *)(v43 + 8 * v105 + 32);
      }
      objc_super v109 = v108;
      static Data._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v177 = 0;
      long long v176 = 0u;
      long long v175 = 0u;
      BinaryDecodingOptions.init()();
      lazy protocol witness table accessor for type Apple_Parsec_Siri_V2alpha_AudioItem and conformance Apple_Parsec_Siri_V2alpha_AudioItem((unint64_t *)&lazy protocol witness table cache variable for type Siri_Nlu_External_Span and conformance Siri_Nlu_External_Span, MEMORY[0x263F71430]);
      Message.init(serializedData:extensions:partial:options:)();
      if (v32)
      {

        swift_release();
        swift_bridgeObjectRelease();
        goto LABEL_103;
      }

      uint64_t v174 = v106;
      unint64_t v111 = *(void *)(v106 + 16);
      unint64_t v110 = *(void *)(v106 + 24);
      if (v111 >= v110 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v110 > 1, v111 + 1, 1);
        uint64_t v106 = v174;
      }
      ++v105;
      *(void *)(v106 + 16) = v111 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v150 + 32))(v106+ ((*(unsigned __int8 *)(v150 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v150 + 80))+ *(void *)(v150 + 72) * v111, v153, v107);
      if (v104 == v105)
      {
        swift_bridgeObjectRelease();
        goto LABEL_115;
      }
    }
LABEL_112:
    __break(1u);
LABEL_113:
    uint64_t v104 = _CocoaArrayWrapper.endIndex.getter();
    if (!v104) {
      goto LABEL_114;
    }
  }
  __break(1u);
  return result;
}

Swift::Void __swiftcall AudioExperience.encode(with:)(NSCoder with)
{
  uint64_t v2 = v1;
  Class isa = with.super.isa;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_MultiUserContext?);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v84 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v90 = type metadata accessor for Siri_Nlu_External_Span();
  uint64_t v85 = *(void *)(v90 - 8);
  MEMORY[0x270FA5388](v90);
  uint64_t v89 = (char *)&v84 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioItem();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v84 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)MEMORY[0x263F8EED0];
  uint64_t v13 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v1) + 0x1D0))(v9);
  uint64_t v14 = *(void *)(v13 + 16);
  uint64_t v86 = v5;
  if (v14)
  {
    uint64_t v88 = v1;
    v94[0] = MEMORY[0x263F8EE78];
    uint64_t v15 = v13;
    specialized ContiguousArray.reserveCapacity(_:)();
    uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
    uint64_t v16 = v8 + 16;
    uint64_t v18 = *(unsigned __int8 *)(v16 + 64);
    uint64_t v87 = v15;
    uint64_t v19 = v15 + ((v18 + 32) & ~v18);
    uint64_t v92 = *(void *)(v16 + 56);
    uint64_t v93 = v17;
    do
    {
      v93(v11, v19, v7);
      lazy protocol witness table accessor for type Apple_Parsec_Siri_V2alpha_AudioItem and conformance Apple_Parsec_Siri_V2alpha_AudioItem(&lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_AudioItem and conformance Apple_Parsec_Siri_V2alpha_AudioItem, MEMORY[0x263F5CCC8]);
      uint64_t v20 = Message.serializedData(partial:)();
      unint64_t v22 = v21;
      Data._bridgeToObjectiveC()();
      outlined consume of Data._Representation(v20, v22);
      (*(void (**)(char *, uint64_t))(v16 - 8))(v11, v7);
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
      v19 += v92;
      --v14;
    }
    while (v14);
    swift_bridgeObjectRelease();
    uint64_t v2 = v88;
    uint64_t v12 = (void *)MEMORY[0x263F8EED0];
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  type metadata accessor for NSArray(0, (unint64_t *)&lazy cache variable for type metadata for NSData);
  Class v23 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  uint64_t v24 = (void *)MEMORY[0x261198B80](0xD000000000000012, 0x800000025C981800);
  Class v25 = isa;
  [(objc_class *)isa encodeObject:v23 forKey:v24];

  type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioUnderstanding();
  lazy protocol witness table accessor for type Apple_Parsec_Siri_V2alpha_AudioItem and conformance Apple_Parsec_Siri_V2alpha_AudioItem(&lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_AudioUnderstanding and conformance Apple_Parsec_Siri_V2alpha_AudioUnderstanding, MEMORY[0x263F5CEC0]);
  uint64_t v26 = Message.serializedData(partial:)();
  unint64_t v28 = v27;
  Class v29 = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data._Representation(v26, v28);
  uint64_t v30 = (void *)MEMORY[0x261198B80](0xD000000000000012, 0x800000025C981820);
  [(objc_class *)v25 encodeObject:v29 forKey:v30];

  type metadata accessor for Apple_Parsec_Siri_V2alpha_PlaybackSignals();
  lazy protocol witness table accessor for type Apple_Parsec_Siri_V2alpha_AudioItem and conformance Apple_Parsec_Siri_V2alpha_AudioItem(&lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_PlaybackSignals and conformance Apple_Parsec_Siri_V2alpha_PlaybackSignals, MEMORY[0x263F5CE70]);
  uint64_t v31 = Message.serializedData(partial:)();
  unint64_t v33 = v32;
  Class v34 = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data._Representation(v31, v33);
  uint64_t v35 = (void *)MEMORY[0x261198B80](0x6B63616279616C70, 0xEF736C616E676953);
  [(objc_class *)v25 encodeObject:v34 forKey:v35];

  Class v36 = Array._bridgeToObjectiveC()().super.isa;
  uint64_t v37 = (void *)MEMORY[0x261198B80](0x6C616E696769726FLL, 0xEF736C616E676953);
  [(objc_class *)v25 encodeObject:v36 forKey:v37];

  (*(void (**)(void))((*v12 & *v2) + 0x220))();
  Class v38 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  uint64_t v39 = (void *)MEMORY[0x261198B80](0xD00000000000001CLL, 0x800000025C981860);
  [(objc_class *)v25 encodeObject:v38 forKey:v39];

  uint64_t v40 = (void *)MEMORY[0x261198B80](*(void *)((char *)v2 + OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_pegasusAudioType), *(void *)((char *)v2 + OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_pegasusAudioType + 8));
  uint64_t v41 = (void *)MEMORY[0x261198B80](0xD000000000000010, 0x800000025C981880);
  [(objc_class *)v25 encodeObject:v40 forKey:v41];

  uint64_t v42 = (void *)MEMORY[0x261198B80](*(void *)((char *)v2 + OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_launchID), *(void *)((char *)v2 + OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_launchID + 8));
  uint64_t v43 = (void *)MEMORY[0x261198B80](0x444968636E75616CLL, 0xE800000000000000);
  [(objc_class *)v25 encodeObject:v42 forKey:v43];

  uint64_t v44 = (void *)MEMORY[0x261198B80](*(void *)((char *)v2+ OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_systemExtensionBundleID), *(void *)((char *)v2+ OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_systemExtensionBundleID+ 8));
  uint64_t v45 = (void *)MEMORY[0x261198B80](0xD000000000000017, 0x800000025C9818A0);
  [(objc_class *)v25 encodeObject:v44 forKey:v45];

  uint64_t v46 = (void *)MEMORY[0x261198B80](*(void *)((char *)v2 + OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_boltProxiedBundleID), *(void *)((char *)v2+ OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_boltProxiedBundleID+ 8));
  uint64_t v47 = (void *)MEMORY[0x261198B80](0xD000000000000013, 0x800000025C9818C0);
  [(objc_class *)v25 encodeObject:v46 forKey:v47];

  uint64_t v48 = *((unsigned __int8 *)v2 + OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_shouldPerformAppSelection);
  uint64_t v49 = (void *)MEMORY[0x261198B80](0xD000000000000019, 0x800000025C981900);
  [(objc_class *)v25 encodeBool:v48 forKey:v49];

  type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioClientComponent();
  lazy protocol witness table accessor for type Apple_Parsec_Siri_V2alpha_AudioItem and conformance Apple_Parsec_Siri_V2alpha_AudioItem(&lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_AudioClientComponent and conformance Apple_Parsec_Siri_V2alpha_AudioClientComponent, MEMORY[0x263F5CF38]);
  uint64_t v50 = Message.serializedData(partial:)();
  unint64_t v52 = v51;
  Class v53 = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data._Representation(v50, v52);
  unint64_t v54 = (void *)MEMORY[0x261198B80](0xD000000000000014, 0x800000025C9818E0);
  [(objc_class *)v25 encodeObject:v53 forKey:v54];

  unint64_t v55 = (void *)MEMORY[0x263F8EED0];
  LOBYTE(v53) = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v2) + 0x1E8))();
  uint64_t v56 = (void *)MEMORY[0x261198B80](0x456564696C477369, 0xEF656C626967696CLL);
  [(objc_class *)v25 encodeBool:v53 & 1 forKey:v56];

  LOBYTE(v53) = (*(uint64_t (**)(void))((*v55 & *v2) + 0x200))();
  uint64_t v57 = (void *)MEMORY[0x261198B80](0xD000000000000019, 0x800000025C981930);
  [(objc_class *)v25 encodeBool:v53 & 1 forKey:v57];

  uint64_t v58 = *(void *)((char *)v2 + OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_matchingSpans);
  int64_t v59 = *(void *)(v58 + 16);
  if (v59)
  {
    uint64_t v88 = v2;
    v94[0] = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v59, 0);
    uint64_t v60 = *(void (**)(char *, uint64_t, uint64_t))(v85 + 16);
    uint64_t v61 = *(unsigned __int8 *)(v85 + 80);
    uint64_t v87 = v58;
    uint64_t v62 = v58 + ((v61 + 32) & ~v61);
    uint64_t v92 = *(void *)(v85 + 72);
    uint64_t v93 = v60;
    id v63 = (void (**)(char *, uint64_t))(v85 + 8);
    do
    {
      __int16 v65 = v89;
      uint64_t v64 = v90;
      v93(v89, v62, v90);
      lazy protocol witness table accessor for type Apple_Parsec_Siri_V2alpha_AudioItem and conformance Apple_Parsec_Siri_V2alpha_AudioItem(&lazy protocol witness table cache variable for type Siri_Nlu_External_Span and conformance Siri_Nlu_External_Span, MEMORY[0x263F71430]);
      uint64_t v66 = Message.serializedData(partial:)();
      uint64_t v68 = v67;
      (*v63)(v65, v64);
      uint64_t v69 = v94[0];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v69 + 16) + 1, 1);
        uint64_t v69 = v94[0];
      }
      unint64_t v71 = *(void *)(v69 + 16);
      unint64_t v70 = *(void *)(v69 + 24);
      if (v71 >= v70 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v70 > 1, v71 + 1, 1);
        uint64_t v69 = v94[0];
      }
      *(void *)(v69 + 16) = v71 + 1;
      uint64_t v72 = v69 + 16 * v71;
      *(void *)(v72 + 32) = v66;
      *(void *)(v72 + 40) = v68;
      v62 += v92;
      --v59;
    }
    while (v59);
    swift_bridgeObjectRelease();
    uint64_t v2 = v88;
  }
  uint64_t v73 = (uint64_t)v86;
  Class v74 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  uint64_t v75 = (void *)MEMORY[0x261198B80](0x676E69686374616DLL, 0xED0000736E617053);
  Class v76 = isa;
  [(objc_class *)isa encodeObject:v74 forKey:v75];

  outlined init with copy of Apple_Parsec_Siri_V2alpha_MultiUserContext?((uint64_t)v2 + OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_multiUserContext, v73, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_MultiUserContext?);
  uint64_t v77 = type metadata accessor for Apple_Parsec_Siri_V2alpha_MultiUserContext();
  uint64_t v78 = *(void *)(v77 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v78 + 48))(v73, 1, v77) == 1)
  {
    outlined destroy of ClientExperienceSignals?(v73, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_MultiUserContext?);
    uint64_t v79 = 0;
  }
  else
  {
    lazy protocol witness table accessor for type Apple_Parsec_Siri_V2alpha_AudioItem and conformance Apple_Parsec_Siri_V2alpha_AudioItem(&lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_MultiUserContext and conformance Apple_Parsec_Siri_V2alpha_MultiUserContext, MEMORY[0x263F5CEA0]);
    uint64_t v80 = Message.serializedData(partial:)();
    uint64_t v82 = v81;
    (*(void (**)(uint64_t, uint64_t))(v78 + 8))(v73, v77);
    v94[0] = v80;
    v94[1] = v82;
    uint64_t v79 = _bridgeAnythingToObjectiveC<A>(_:)();
    outlined destroy of Data((uint64_t)v94);
  }
  uint64_t v83 = (void *)MEMORY[0x261198B80](0xD000000000000010, 0x800000025C981960);
  [(objc_class *)v76 encodeObject:v79 forKey:v83];
  swift_unknownObjectRelease();

  Experience.encode(with:)((NSCoder)v76);
}

id AudioExperience.appendResult(_:)(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioItem();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void **)(v1 + OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_lock);
  objc_msgSend(v7, sel_lock);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  uint64_t v8 = (unint64_t *)(v1 + OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_serverAudioResults);
  swift_beginAccess();
  unint64_t v9 = *v8;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v8 = v9;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    unint64_t v9 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v9 + 16) + 1, 1, v9);
    *uint64_t v8 = v9;
  }
  unint64_t v12 = *(void *)(v9 + 16);
  unint64_t v11 = *(void *)(v9 + 24);
  if (v12 >= v11 >> 1)
  {
    unint64_t v9 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v11 > 1, v12 + 1, 1, v9);
    *uint64_t v8 = v9;
  }
  *(void *)(v9 + 16) = v12 + 1;
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v9+ ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))+ *(void *)(v4 + 72) * v12, v6, v3);
  swift_endAccess();
  return objc_msgSend(v7, sel_unlock);
}

void AudioExperience.__allocating_init(pluginId:queryConfidence:)()
{
}

void AudioExperience.init(pluginId:queryConfidence:)()
{
}

void AudioExperience.__allocating_init(pluginId:queryConfidence:userDialogAct:)()
{
}

void AudioExperience.init(pluginId:queryConfidence:userDialogAct:)()
{
}

void AudioExperience.__allocating_init(pluginId:queryConfidence:userDialogAct:renderOptions:)()
{
}

void AudioExperience.init(pluginId:queryConfidence:userDialogAct:renderOptions:)()
{
}

void AudioExperience.__allocating_init(pluginId:queryConfidence:userDialogAct:intent:)()
{
}

void AudioExperience.init(pluginId:queryConfidence:userDialogAct:intent:)()
{
}

void AudioExperience.__allocating_init(pluginId:queryConfidence:userDialogAct:renderOptions:intent:)()
{
}

void AudioExperience.init(pluginId:queryConfidence:userDialogAct:renderOptions:intent:)()
{
}

void AudioExperience.__ivar_destroyer()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_audioUnderstanding;
  uint64_t v2 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioUnderstanding();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  uint64_t v3 = v0 + OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_playbackSignals;
  uint64_t v4 = type metadata accessor for Apple_Parsec_Siri_V2alpha_PlaybackSignals();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v5 = v0 + OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_audioClientComponent;
  uint64_t v6 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioClientComponent();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  outlined destroy of ClientExperienceSignals?(v0 + OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_multiUserContext, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_MultiUserContext?);
  uint64_t v7 = *(void **)(v0 + OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_lock);
}

id AudioExperience.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AudioExperience(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t specialized Array.append<A>(contentsOf:)(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
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
  uint64_t v9 = v3[2];
  if ((v3[3] >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v10 = (unint64_t)&v3[2 * v9 + 4];
  if (a1 + 32 < v10 + 16 * v8 && v10 < a1 + 32 + 16 * v8) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v12 = v3[2];
  BOOL v13 = __OFADD__(v12, v8);
  uint64_t v14 = v12 + v8;
  if (!v13)
  {
    v3[2] = v14;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
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

uint64_t partial apply for closure #1 in AudioExperience.init(pluginId:audioClientComponent:queryConfidenceScore:userDialogAct:clientExperienceSignals:renderOptions:)(uint64_t *a1)
{
  return closure #1 in AudioExperience.init(pluginId:audioClientComponent:queryConfidenceScore:userDialogAct:clientExperienceSignals:renderOptions:)(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32));
}

uint64_t type metadata accessor for AudioExperience.Builder(uint64_t a1)
{
  return type metadata accessor for AudioExperience.Builder(a1, (uint64_t *)&type metadata singleton initialization cache for AudioExperience.Builder);
}

uint64_t outlined init with copy of Apple_Parsec_Siri_V2alpha_MultiUserContext?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t outlined assign with take of Apple_Parsec_Siri_V2alpha_AudioUnderstanding?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t outlined init with take of Apple_Parsec_Siri_V2alpha_AudioUnderstanding?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t outlined init with copy of AudioExperience.Builder(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AudioExperience.Builder(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for AudioExperience(uint64_t a1)
{
  return type metadata accessor for AudioExperience.Builder(a1, (uint64_t *)&type metadata singleton initialization cache for AudioExperience);
}

uint64_t type metadata accessor for AudioExperience.Builder(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t type metadata accessor for NSArray(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3)
{
  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, (void *)*v3, &demangling cache variable for type metadata for _ContiguousArrayStorage<Siri_Nlu_External_Span>, MEMORY[0x263F71430]);
  *uint64_t v3 = result;
  return result;
}

{
  uint64_t *v3;
  uint64_t result;

  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, (void *)*v3, &demangling cache variable for type metadata for _ContiguousArrayStorage<Apple_Parsec_Siri_V2alpha_AudioItem>, MEMORY[0x263F5CCC8]);
  *uint64_t v3 = result;
  return result;
}

{
  char **v3;
  uint64_t result;

  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

{
  uint64_t *v3;
  uint64_t result;

  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

{
  uint64_t *v3;
  uint64_t result;

  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, (void *)*v3, &demangling cache variable for type metadata for _ContiguousArrayStorage<Apple_Parsec_Siri_V2alpha_ExperienceComponent>, MEMORY[0x263F5CF28]);
  *uint64_t v3 = result;
  return result;
}

{
  char **v3;
  uint64_t result;

  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

{
  char **v3;
  uint64_t result;

  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

{
  uint64_t *v3;
  uint64_t result;

  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, (void *)*v3, &demangling cache variable for type metadata for _ContiguousArrayStorage<Apple_Parsec_Responseframework_PatternComponent>, MEMORY[0x263F5CFC0]);
  *uint64_t v3 = result;
  return result;
}

{
  uint64_t *v3;
  uint64_t result;

  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, (void *)*v3, &demangling cache variable for type metadata for _ContiguousArrayStorage<Google_Protobuf_StringValue>, MEMORY[0x263F50330]);
  *uint64_t v3 = result;
  return result;
}

uint64_t outlined destroy of Data(uint64_t a1)
{
  return a1;
}

uint64_t sub_25C9092B8@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x1D0))();
  *a2 = result;
  return result;
}

uint64_t sub_25C909320@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x1E8))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_25C909388(unsigned __int8 *a1, void **a2)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a2) + 0x1F0))(*a1);
}

uint64_t sub_25C9093E8@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x200))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_25C909450(char *a1, void *a2)
{
  char v2 = *a1;
  uint64_t v3 = (unsigned char *)(*a2 + OBJC_IVAR____TtC21SiriInformationSearch15AudioExperience_networkAvailableAtRequest);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = v2;
  return result;
}

uint64_t sub_25C9094A0@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x220))();
  *a2 = result;
  return result;
}

uint64_t sub_25C909504(uint64_t a1, void **a2)
{
  char v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & **a2) + 0x228);
  uint64_t v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

uint64_t ObjC metadata update function for AudioExperience()
{
  return type metadata accessor for AudioExperience(0);
}

void type metadata completion function for AudioExperience()
{
  type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioUnderstanding();
  if (v0 <= 0x3F)
  {
    type metadata accessor for Apple_Parsec_Siri_V2alpha_PlaybackSignals();
    if (v1 <= 0x3F)
    {
      type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioClientComponent();
      if (v2 <= 0x3F)
      {
        type metadata accessor for Apple_Parsec_Siri_V2alpha_MultiUserContext?(319, (unint64_t *)&lazy cache variable for type metadata for Apple_Parsec_Siri_V2alpha_MultiUserContext?, MEMORY[0x263F5CEA0]);
        if (v3 <= 0x3F) {
          swift_updateClassMetadata2();
        }
      }
    }
  }
}

uint64_t method lookup function for AudioExperience(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AudioExperience);
}

uint64_t dispatch thunk of AudioExperience.serverAudioResults.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1D0))();
}

uint64_t dispatch thunk of AudioExperience.isGlideEligible.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1E8))();
}

uint64_t dispatch thunk of AudioExperience.isGlideEligible.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1F0))();
}

uint64_t dispatch thunk of AudioExperience.isGlideEligible.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1F8))();
}

uint64_t dispatch thunk of AudioExperience.networkAvailableAtRequest.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x200))();
}

uint64_t dispatch thunk of AudioExperience.internalSignals.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x218))();
}

uint64_t dispatch thunk of AudioExperience.internalSignalsFromSiriAudio.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x220))();
}

uint64_t dispatch thunk of AudioExperience.internalSignalsFromSiriAudio.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x228))();
}

uint64_t dispatch thunk of AudioExperience.internalSignalsFromSiriAudio.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x230))();
}

uint64_t dispatch thunk of AudioExperience.__allocating_init(serverAudioResults:audioUnderstanding:playbackSignals:internalSignals:pegasusAudioType:launchID:systemExtensionBundleID:boltProxiedBundleID:shouldPerformAppSelection:audioClientComponent:pluginId:queryConfidence:userDialogAct:isGlideEligible:networkAvailableAtRequest:matchingSpans:multiUserContext:)()
{
  return (*(uint64_t (**)(void))(v0 + 568))();
}

uint64_t dispatch thunk of AudioExperience.__allocating_init(pluginId:queryConfidence:userDialogAct:builder:)()
{
  return (*(uint64_t (**)(void))(v0 + 576))();
}

uint64_t dispatch thunk of AudioExperience.appendResult(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x248))();
}

void *initializeBufferWithCopyOfBuffer for AudioExperience.Builder(void *a1, void *a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (void *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a1;
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    unint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioUnderstanding();
    uint64_t v12 = *(void *)(v11 - 8);
    BOOL v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_AudioUnderstanding?);
      memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    uint64_t v15 = a3[6];
    uint64_t v16 = (char *)v7 + v15;
    uint64_t v17 = (char *)a2 + v15;
    uint64_t v18 = type metadata accessor for Apple_Parsec_Siri_V2alpha_PlaybackSignals();
    uint64_t v19 = *(void *)(v18 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
    {
      uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_PlaybackSignals?);
      memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v16, v17, v18);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
    }
    uint64_t v21 = a3[8];
    *(void *)((char *)v7 + a3[7]) = *(void *)((char *)a2 + a3[7]);
    *(void *)((char *)v7 + v21) = *(void *)((char *)a2 + v21);
    uint64_t v22 = a3[9];
    uint64_t v23 = a3[10];
    uint64_t v24 = (void *)((char *)v7 + v22);
    Class v25 = (void *)((char *)a2 + v22);
    uint64_t v26 = v25[1];
    *uint64_t v24 = *v25;
    v24[1] = v26;
    unint64_t v27 = (void *)((char *)v7 + v23);
    unint64_t v28 = (void *)((char *)a2 + v23);
    uint64_t v29 = v28[1];
    *unint64_t v27 = *v28;
    v27[1] = v29;
    uint64_t v30 = a3[11];
    uint64_t v31 = a3[12];
    unint64_t v32 = (void *)((char *)v7 + v30);
    unint64_t v33 = (void *)((char *)a2 + v30);
    uint64_t v34 = v33[1];
    *unint64_t v32 = *v33;
    v32[1] = v34;
    uint64_t v35 = (void *)((char *)v7 + v31);
    Class v36 = (void *)((char *)a2 + v31);
    uint64_t v37 = v36[1];
    *uint64_t v35 = *v36;
    v35[1] = v37;
    uint64_t v38 = a3[14];
    *((unsigned char *)v7 + a3[13]) = *((unsigned char *)a2 + a3[13]);
    __dst = (char *)v7 + v38;
    unint64_t v55 = (char *)a2 + v38;
    uint64_t v39 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioClientComponent();
    uint64_t v40 = *(void *)(v39 - 8);
    unint64_t v54 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v54(v55, 1, v39))
    {
      uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_AudioClientComponent?);
      memcpy(__dst, v55, *(void *)(*(void *)(v41 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v40 + 16))(__dst, v55, v39);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v40 + 56))(__dst, 0, 1, v39);
    }
    uint64_t v42 = a3[16];
    *((unsigned char *)v7 + a3[15]) = *((unsigned char *)a2 + a3[15]);
    *((unsigned char *)v7 + v42) = *((unsigned char *)a2 + v42);
    uint64_t v43 = a3[18];
    *(void *)((char *)v7 + a3[17]) = *(void *)((char *)a2 + a3[17]);
    uint64_t v44 = *(void **)((char *)a2 + v43);
    *(void *)((char *)v7 + v43) = v44;
    uint64_t v45 = a3[19];
    uint64_t v46 = (char *)v7 + v45;
    uint64_t v47 = (char *)a2 + v45;
    uint64_t v48 = type metadata accessor for Apple_Parsec_Siri_V2alpha_MultiUserContext();
    uint64_t v49 = *(void *)(v48 - 8);
    uint64_t v50 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v49 + 48);
    swift_bridgeObjectRetain();
    id v51 = v44;
    if (v50(v47, 1, v48))
    {
      uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_MultiUserContext?);
      memcpy(v46, v47, *(void *)(*(void *)(v52 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v49 + 16))(v46, v47, v48);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v49 + 56))(v46, 0, 1, v48);
    }
  }
  return v7;
}

uint64_t destroy for AudioExperience.Builder(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[5];
  uint64_t v5 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioUnderstanding();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  uint64_t v7 = a1 + a2[6];
  uint64_t v8 = type metadata accessor for Apple_Parsec_Siri_V2alpha_PlaybackSignals();
  uint64_t v9 = *(void *)(v8 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8)) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v10 = a1 + a2[14];
  uint64_t v11 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioClientComponent();
  uint64_t v12 = *(void *)(v11 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11)) {
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
  }
  swift_bridgeObjectRelease();

  uint64_t v13 = a1 + a2[19];
  uint64_t v14 = type metadata accessor for Apple_Parsec_Siri_V2alpha_MultiUserContext();
  uint64_t v17 = *(void *)(v14 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v17 + 48))(v13, 1, v14);
  if (!result)
  {
    uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t))(v17 + 8);
    return v16(v13, v14);
  }
  return result;
}

void *initializeWithCopy for AudioExperience.Builder(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioUnderstanding();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  swift_bridgeObjectRetain();
  if (v11(v8, 1, v9))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_AudioUnderstanding?);
    memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v13 = a3[6];
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = type metadata accessor for Apple_Parsec_Siri_V2alpha_PlaybackSignals();
  uint64_t v17 = *(void *)(v16 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
  {
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_PlaybackSignals?);
    memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v14, v15, v16);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  }
  uint64_t v19 = a3[8];
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  *(void *)((char *)a1 + v19) = *(void *)((char *)a2 + v19);
  uint64_t v20 = a3[9];
  uint64_t v21 = a3[10];
  uint64_t v22 = (void *)((char *)a1 + v20);
  uint64_t v23 = (void *)((char *)a2 + v20);
  uint64_t v24 = v23[1];
  *uint64_t v22 = *v23;
  v22[1] = v24;
  Class v25 = (void *)((char *)a1 + v21);
  uint64_t v26 = (void *)((char *)a2 + v21);
  uint64_t v27 = v26[1];
  *Class v25 = *v26;
  v25[1] = v27;
  uint64_t v28 = a3[11];
  uint64_t v29 = a3[12];
  uint64_t v30 = (void *)((char *)a1 + v28);
  uint64_t v31 = (void *)((char *)a2 + v28);
  uint64_t v32 = v31[1];
  *uint64_t v30 = *v31;
  v30[1] = v32;
  unint64_t v33 = (void *)((char *)a1 + v29);
  uint64_t v34 = (void *)((char *)a2 + v29);
  uint64_t v35 = v34[1];
  *unint64_t v33 = *v34;
  v33[1] = v35;
  uint64_t v36 = a3[14];
  *((unsigned char *)a1 + a3[13]) = *((unsigned char *)a2 + a3[13]);
  __dst = (char *)a1 + v36;
  Class v53 = (char *)a2 + v36;
  uint64_t v37 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioClientComponent();
  uint64_t v38 = *(void *)(v37 - 8);
  uint64_t v52 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v38 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v52(v53, 1, v37))
  {
    uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_AudioClientComponent?);
    memcpy(__dst, v53, *(void *)(*(void *)(v39 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v38 + 16))(__dst, v53, v37);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v38 + 56))(__dst, 0, 1, v37);
  }
  uint64_t v40 = a3[16];
  *((unsigned char *)a1 + a3[15]) = *((unsigned char *)a2 + a3[15]);
  *((unsigned char *)a1 + v40) = *((unsigned char *)a2 + v40);
  uint64_t v41 = a3[18];
  *(void *)((char *)a1 + a3[17]) = *(void *)((char *)a2 + a3[17]);
  uint64_t v42 = *(void **)((char *)a2 + v41);
  *(void *)((char *)a1 + v41) = v42;
  uint64_t v43 = a3[19];
  uint64_t v44 = (char *)a1 + v43;
  uint64_t v45 = (char *)a2 + v43;
  uint64_t v46 = type metadata accessor for Apple_Parsec_Siri_V2alpha_MultiUserContext();
  uint64_t v47 = *(void *)(v46 - 8);
  uint64_t v48 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v47 + 48);
  swift_bridgeObjectRetain();
  id v49 = v42;
  if (v48(v45, 1, v46))
  {
    uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_MultiUserContext?);
    memcpy(v44, v45, *(void *)(*(void *)(v50 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v47 + 16))(v44, v45, v46);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v47 + 56))(v44, 0, 1, v46);
  }
  return a1;
}

void *assignWithCopy for AudioExperience.Builder(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioUnderstanding();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_AudioUnderstanding?);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  uint64_t v15 = a3[6];
  uint64_t v16 = (char *)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  uint64_t v18 = type metadata accessor for Apple_Parsec_Siri_V2alpha_PlaybackSignals();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 48);
  int v21 = v20(v16, 1, v18);
  int v22 = v20(v17, 1, v18);
  if (v21)
  {
    if (!v22)
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v16, v17, v18);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v22)
  {
    (*(void (**)(char *, uint64_t))(v19 + 8))(v16, v18);
LABEL_12:
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_PlaybackSignals?);
    memcpy(v16, v17, *(void *)(*(void *)(v23 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v19 + 24))(v16, v17, v18);
LABEL_13:
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v24 = a3[9];
  Class v25 = (void *)((char *)a1 + v24);
  uint64_t v26 = (void *)((char *)a2 + v24);
  *Class v25 = *v26;
  v25[1] = v26[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v27 = a3[10];
  uint64_t v28 = (void *)((char *)a1 + v27);
  uint64_t v29 = (void *)((char *)a2 + v27);
  *uint64_t v28 = *v29;
  v28[1] = v29[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v30 = a3[11];
  uint64_t v31 = (void *)((char *)a1 + v30);
  uint64_t v32 = (void *)((char *)a2 + v30);
  *uint64_t v31 = *v32;
  v31[1] = v32[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v33 = a3[12];
  uint64_t v34 = (void *)((char *)a1 + v33);
  uint64_t v35 = (void *)((char *)a2 + v33);
  void *v34 = *v35;
  v34[1] = v35[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((unsigned char *)a1 + a3[13]) = *((unsigned char *)a2 + a3[13]);
  uint64_t v36 = a3[14];
  uint64_t v37 = (char *)a1 + v36;
  uint64_t v38 = (char *)a2 + v36;
  uint64_t v39 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioClientComponent();
  uint64_t v40 = *(void *)(v39 - 8);
  uint64_t v41 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v40 + 48);
  int v42 = v41(v37, 1, v39);
  int v43 = v41(v38, 1, v39);
  if (v42)
  {
    if (!v43)
    {
      (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v37, v38, v39);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v40 + 56))(v37, 0, 1, v39);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v43)
  {
    (*(void (**)(char *, uint64_t))(v40 + 8))(v37, v39);
LABEL_18:
    uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_AudioClientComponent?);
    memcpy(v37, v38, *(void *)(*(void *)(v44 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(char *, char *, uint64_t))(v40 + 24))(v37, v38, v39);
LABEL_19:
  *((unsigned char *)a1 + a3[15]) = *((unsigned char *)a2 + a3[15]);
  *((unsigned char *)a1 + a3[16]) = *((unsigned char *)a2 + a3[16]);
  *(void *)((char *)a1 + a3[17]) = *(void *)((char *)a2 + a3[17]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v45 = a3[18];
  uint64_t v46 = *(void **)((char *)a1 + v45);
  uint64_t v47 = *(void **)((char *)a2 + v45);
  *(void *)((char *)a1 + v45) = v47;
  id v48 = v47;

  uint64_t v49 = a3[19];
  uint64_t v50 = (char *)a1 + v49;
  id v51 = (char *)a2 + v49;
  uint64_t v52 = type metadata accessor for Apple_Parsec_Siri_V2alpha_MultiUserContext();
  uint64_t v53 = *(void *)(v52 - 8);
  unint64_t v54 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v53 + 48);
  int v55 = v54(v50, 1, v52);
  int v56 = v54(v51, 1, v52);
  if (!v55)
  {
    if (!v56)
    {
      (*(void (**)(char *, char *, uint64_t))(v53 + 24))(v50, v51, v52);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v53 + 8))(v50, v52);
    goto LABEL_24;
  }
  if (v56)
  {
LABEL_24:
    uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_MultiUserContext?);
    memcpy(v50, v51, *(void *)(*(void *)(v57 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v53 + 16))(v50, v51, v52);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v53 + 56))(v50, 0, 1, v52);
  return a1;
}

void *initializeWithTake for AudioExperience.Builder(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioUnderstanding();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_AudioUnderstanding?);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v12 = a3[6];
  int v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = type metadata accessor for Apple_Parsec_Siri_V2alpha_PlaybackSignals();
  uint64_t v16 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
  {
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_PlaybackSignals?);
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v13, v14, v15);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  }
  uint64_t v18 = a3[8];
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  *(void *)((char *)a1 + v18) = *(void *)((char *)a2 + v18);
  uint64_t v19 = a3[10];
  *(_OWORD *)((char *)a1 + a3[9]) = *(_OWORD *)((char *)a2 + a3[9]);
  *(_OWORD *)((char *)a1 + v19) = *(_OWORD *)((char *)a2 + v19);
  uint64_t v20 = a3[12];
  *(_OWORD *)((char *)a1 + a3[11]) = *(_OWORD *)((char *)a2 + a3[11]);
  *(_OWORD *)((char *)a1 + v20) = *(_OWORD *)((char *)a2 + v20);
  uint64_t v21 = a3[14];
  *((unsigned char *)a1 + a3[13]) = *((unsigned char *)a2 + a3[13]);
  int v22 = (char *)a1 + v21;
  uint64_t v23 = (char *)a2 + v21;
  uint64_t v24 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioClientComponent();
  uint64_t v25 = *(void *)(v24 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24))
  {
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_AudioClientComponent?);
    memcpy(v22, v23, *(void *)(*(void *)(v26 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v22, v23, v24);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
  }
  uint64_t v27 = a3[16];
  *((unsigned char *)a1 + a3[15]) = *((unsigned char *)a2 + a3[15]);
  *((unsigned char *)a1 + v27) = *((unsigned char *)a2 + v27);
  uint64_t v28 = a3[18];
  *(void *)((char *)a1 + a3[17]) = *(void *)((char *)a2 + a3[17]);
  *(void *)((char *)a1 + v28) = *(void *)((char *)a2 + v28);
  uint64_t v29 = a3[19];
  uint64_t v30 = (char *)a1 + v29;
  uint64_t v31 = (char *)a2 + v29;
  uint64_t v32 = type metadata accessor for Apple_Parsec_Siri_V2alpha_MultiUserContext();
  uint64_t v33 = *(void *)(v32 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v31, 1, v32))
  {
    uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_MultiUserContext?);
    memcpy(v30, v31, *(void *)(*(void *)(v34 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v30, v31, v32);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v33 + 56))(v30, 0, 1, v32);
  }
  return a1;
}

void *assignWithTake for AudioExperience.Builder(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioUnderstanding();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_AudioUnderstanding?);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 40))(v7, v8, v9);
LABEL_7:
  uint64_t v15 = a3[6];
  uint64_t v16 = (char *)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  uint64_t v18 = type metadata accessor for Apple_Parsec_Siri_V2alpha_PlaybackSignals();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 48);
  int v21 = v20(v16, 1, v18);
  int v22 = v20(v17, 1, v18);
  if (v21)
  {
    if (!v22)
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v16, v17, v18);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v22)
  {
    (*(void (**)(char *, uint64_t))(v19 + 8))(v16, v18);
LABEL_12:
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_PlaybackSignals?);
    memcpy(v16, v17, *(void *)(*(void *)(v23 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v19 + 40))(v16, v17, v18);
LABEL_13:
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[8]) = *(void *)((char *)a2 + a3[8]);
  swift_bridgeObjectRelease();
  uint64_t v24 = a3[9];
  uint64_t v25 = (void *)((char *)a1 + v24);
  uint64_t v26 = (void *)((char *)a2 + v24);
  uint64_t v28 = *v26;
  uint64_t v27 = v26[1];
  *uint64_t v25 = v28;
  v25[1] = v27;
  swift_bridgeObjectRelease();
  uint64_t v29 = a3[10];
  uint64_t v30 = (void *)((char *)a1 + v29);
  uint64_t v31 = (void *)((char *)a2 + v29);
  uint64_t v33 = *v31;
  uint64_t v32 = v31[1];
  *uint64_t v30 = v33;
  v30[1] = v32;
  swift_bridgeObjectRelease();
  uint64_t v34 = a3[11];
  uint64_t v35 = (void *)((char *)a1 + v34);
  uint64_t v36 = (void *)((char *)a2 + v34);
  uint64_t v38 = *v36;
  uint64_t v37 = v36[1];
  *uint64_t v35 = v38;
  v35[1] = v37;
  swift_bridgeObjectRelease();
  uint64_t v39 = a3[12];
  uint64_t v40 = (void *)((char *)a1 + v39);
  uint64_t v41 = (void *)((char *)a2 + v39);
  uint64_t v43 = *v41;
  uint64_t v42 = v41[1];
  *uint64_t v40 = v43;
  v40[1] = v42;
  swift_bridgeObjectRelease();
  uint64_t v44 = a3[14];
  *((unsigned char *)a1 + a3[13]) = *((unsigned char *)a2 + a3[13]);
  uint64_t v45 = (char *)a1 + v44;
  uint64_t v46 = (char *)a2 + v44;
  uint64_t v47 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioClientComponent();
  uint64_t v48 = *(void *)(v47 - 8);
  uint64_t v49 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v48 + 48);
  int v50 = v49(v45, 1, v47);
  int v51 = v49(v46, 1, v47);
  if (v50)
  {
    if (!v51)
    {
      (*(void (**)(char *, char *, uint64_t))(v48 + 32))(v45, v46, v47);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v48 + 56))(v45, 0, 1, v47);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v51)
  {
    (*(void (**)(char *, uint64_t))(v48 + 8))(v45, v47);
LABEL_18:
    uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_AudioClientComponent?);
    memcpy(v45, v46, *(void *)(*(void *)(v52 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(char *, char *, uint64_t))(v48 + 40))(v45, v46, v47);
LABEL_19:
  uint64_t v53 = a3[16];
  *((unsigned char *)a1 + a3[15]) = *((unsigned char *)a2 + a3[15]);
  *((unsigned char *)a1 + v53) = *((unsigned char *)a2 + v53);
  *(void *)((char *)a1 + a3[17]) = *(void *)((char *)a2 + a3[17]);
  swift_bridgeObjectRelease();
  uint64_t v54 = a3[18];
  int v55 = *(void **)((char *)a1 + v54);
  *(void *)((char *)a1 + v54) = *(void *)((char *)a2 + v54);

  uint64_t v56 = a3[19];
  uint64_t v57 = (char *)a1 + v56;
  uint64_t v58 = (char *)a2 + v56;
  uint64_t v59 = type metadata accessor for Apple_Parsec_Siri_V2alpha_MultiUserContext();
  uint64_t v60 = *(void *)(v59 - 8);
  uint64_t v61 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v60 + 48);
  int v62 = v61(v57, 1, v59);
  int v63 = v61(v58, 1, v59);
  if (!v62)
  {
    if (!v63)
    {
      (*(void (**)(char *, char *, uint64_t))(v60 + 40))(v57, v58, v59);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v60 + 8))(v57, v59);
    goto LABEL_24;
  }
  if (v63)
  {
LABEL_24:
    uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_MultiUserContext?);
    memcpy(v57, v58, *(void *)(*(void *)(v64 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v60 + 32))(v57, v58, v59);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v60 + 56))(v57, 0, 1, v59);
  return a1;
}

uint64_t getEnumTagSinglePayload for AudioExperience.Builder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C90B7BC);
}

uint64_t sub_25C90B7BC(char *a1, uint64_t a2, int *a3)
{
  if (a2 == 2147483646)
  {
    uint64_t v4 = *(void *)a1;
    if (*(void *)a1 >= 0xFFFFFFFFuLL) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_AudioUnderstanding?);
  if (*(_DWORD *)(*(void *)(v9 - 8) + 84) == a2)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)(v9 - 8);
    uint64_t v12 = a3[5];
LABEL_13:
    uint64_t v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
    return v15(&a1[v12], a2, v10);
  }
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_PlaybackSignals?);
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a2)
  {
    uint64_t v10 = v13;
    uint64_t v11 = *(void *)(v13 - 8);
    uint64_t v12 = a3[6];
    goto LABEL_13;
  }
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_AudioClientComponent?);
  if (*(_DWORD *)(*(void *)(v14 - 8) + 84) == a2)
  {
    uint64_t v10 = v14;
    uint64_t v11 = *(void *)(v14 - 8);
    uint64_t v12 = a3[14];
    goto LABEL_13;
  }
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_MultiUserContext?);
  uint64_t v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48);
  uint64_t v18 = v16;
  uint64_t v19 = &a1[a3[19]];

  return v17(v19, a2, v18);
}

uint64_t storeEnumTagSinglePayload for AudioExperience.Builder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C90B9B0);
}

char *sub_25C90B9B0(char *result, uint64_t a2, int a3, int *a4)
{
  int v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)uint64_t result = a2;
    return result;
  }
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_AudioUnderstanding?);
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a4[5];
LABEL_9:
    uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
    return (char *)v14(&v5[v11], a2, a2, v9);
  }
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_PlaybackSignals?);
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a3)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a4[6];
    goto LABEL_9;
  }
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_AudioClientComponent?);
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
  {
    uint64_t v9 = v13;
    uint64_t v10 = *(void *)(v13 - 8);
    uint64_t v11 = a4[14];
    goto LABEL_9;
  }
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_MultiUserContext?);
  uint64_t v16 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  uint64_t v17 = v15;
  uint64_t v18 = &v5[a4[19]];

  return (char *)v16(v18, a2, a2, v17);
}

void type metadata completion function for AudioExperience.Builder()
{
  type metadata accessor for Apple_Parsec_Siri_V2alpha_MultiUserContext?(319, &lazy cache variable for type metadata for Apple_Parsec_Siri_V2alpha_AudioUnderstanding?, MEMORY[0x263F5CEC0]);
  if (v0 <= 0x3F)
  {
    type metadata accessor for Apple_Parsec_Siri_V2alpha_MultiUserContext?(319, &lazy cache variable for type metadata for Apple_Parsec_Siri_V2alpha_PlaybackSignals?, MEMORY[0x263F5CE70]);
    if (v1 <= 0x3F)
    {
      type metadata accessor for Apple_Parsec_Siri_V2alpha_MultiUserContext?(319, &lazy cache variable for type metadata for Apple_Parsec_Siri_V2alpha_AudioClientComponent?, MEMORY[0x263F5CF38]);
      if (v2 <= 0x3F)
      {
        type metadata accessor for Apple_Parsec_Siri_V2alpha_MultiUserContext?(319, (unint64_t *)&lazy cache variable for type metadata for Apple_Parsec_Siri_V2alpha_MultiUserContext?, MEMORY[0x263F5CEA0]);
        if (v3 <= 0x3F) {
          swift_initStructMetadata();
        }
      }
    }
  }
}

void type metadata accessor for Apple_Parsec_Siri_V2alpha_MultiUserContext?(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = type metadata accessor for Optional();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Data>);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<KVFieldType>);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Data?>);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    void v10[2] = v8;
    v10[3] = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = (unint64_t)(v10 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v13 >= v14 + 16 * v8) {
      memmove(v10 + 4, a4 + 4, 16 * v8);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 16 * v8 || v13 >= v14 + 16 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Data?);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t (*a6)(void))
{
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (!v12)
  {
    uint64_t v16 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v13 = *(void *)(a6(0) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v16 = (void *)swift_allocObject();
  size_t v17 = _swift_stdlib_malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v17 - v15 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_34;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  uint64_t v19 = *(void *)(a6(0) - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  int v21 = (char *)v16 + v20;
  int v22 = (char *)a4 + v20;
  if (a1)
  {
    if (v16 < a4 || v21 >= &v22[*(void *)(v19 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v23 = *(void *)(v19 + 72) * v11;
  uint64_t v24 = &v21[v23];
  unint64_t v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v16;
  }
LABEL_36:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t outlined destroy of AudioExperience.Builder(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
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

uint64_t outlined destroy of ClientExperienceSignals?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t partial apply for closure #1 in closure #1 in AudioExperience.init(pluginId:audioClientComponent:queryConfidenceScore:usoGraphData:isGlideEligible:)(uint64_t a1)
{
  return closure #1 in closure #1 in AudioExperience.init(pluginId:audioClientComponent:queryConfidenceScore:usoGraphData:isGlideEligible:)(a1, *(void *)(v1 + 16), MEMORY[0x263F714B0], MEMORY[0x263F715F0]);
}

uint64_t partial apply for closure #2 in closure #1 in AudioExperience.init(pluginId:audioClientComponent:queryConfidenceScore:usoGraphData:isGlideEligible:)(uint64_t a1)
{
  return closure #1 in closure #1 in AudioExperience.init(pluginId:audioClientComponent:queryConfidenceScore:usoGraphData:isGlideEligible:)(a1, *(void *)(v1 + 16), MEMORY[0x263F71600], MEMORY[0x263F71550]);
}

uint64_t lazy protocol witness table accessor for type Apple_Parsec_Siri_V2alpha_AudioItem and conformance Apple_Parsec_Siri_V2alpha_AudioItem(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t ClientExperienceSignals.init(isGlideEligible:networkAvailableAtRequest:isPhoneCallActive:)@<X0>(char a1@<W0>, char a2@<W1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v8 = MEMORY[0x263F8EE78];
  *(void *)(a4 + 8) = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x263F8EE78]);
  *(void *)(a4 + 24) = v8;
  uint64_t v9 = a4 + *(int *)(type metadata accessor for ClientExperienceSignals() + 36);
  uint64_t v10 = type metadata accessor for Apple_Parsec_Siri_V2alpha_MultiUserContext();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  *(unsigned char *)a4 = a1;
  *(unsigned char *)(a4 + 16) = a2;
  *(unsigned char *)(a4 + 17) = a3;
  return result;
}

uint64_t ClientExperienceSignals.init(isGlideEligible:networkAvailableAtRequest:isPhoneCallActive:matchingSpans:multiUserContext:)@<X0>(char a1@<W0>, char a2@<W1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  *(void *)(a6 + 8) = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x263F8EE78]);
  uint64_t v12 = a6 + *(int *)(type metadata accessor for ClientExperienceSignals() + 36);
  uint64_t v13 = type metadata accessor for Apple_Parsec_Siri_V2alpha_MultiUserContext();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  *(unsigned char *)a6 = a1;
  *(unsigned char *)(a6 + 16) = a2;
  *(unsigned char *)(a6 + 17) = a3;
  *(void *)(a6 + 24) = a4;

  return outlined assign with take of Apple_Parsec_Siri_V2alpha_MultiUserContext?(a5, v12);
}

uint64_t ClientExperienceSignals.isGlideEligible.getter()
{
  return *v0;
}

uint64_t ClientExperienceSignals.isGlideEligible.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*ClientExperienceSignals.isGlideEligible.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, Bool>);
  unint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  unint64_t v4 = (unsigned char *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *((void *)v4 - 2);
    uint64_t v6 = *((void *)v4 - 1);
    char v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v10 = v5;
    v10[1] = v6;
    *(unsigned char *)(v2[7] + result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 24;
    v2[2] = v13;
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

uint64_t type metadata accessor for ClientExperienceSignals()
{
  uint64_t result = type metadata singleton initialization cache for ClientExperienceSignals;
  if (!type metadata singleton initialization cache for ClientExperienceSignals) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t outlined assign with take of Apple_Parsec_Siri_V2alpha_MultiUserContext?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_MultiUserContext?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t ClientExperienceSignals.glideEligibilityPerSharedId.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ClientExperienceSignals.glideEligibilityPerSharedId.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 8) = a1;
  return result;
}

uint64_t (*ClientExperienceSignals.glideEligibilityPerSharedId.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

uint64_t ClientExperienceSignals.networkAvailableAtRequest.getter()
{
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t ClientExperienceSignals.networkAvailableAtRequest.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 16) = result;
  return result;
}

uint64_t (*ClientExperienceSignals.networkAvailableAtRequest.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

uint64_t ClientExperienceSignals.isPhoneCallActive.getter()
{
  return *(unsigned __int8 *)(v0 + 17);
}

uint64_t ClientExperienceSignals.isPhoneCallActive.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 17) = result;
  return result;
}

uint64_t (*ClientExperienceSignals.isPhoneCallActive.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

uint64_t ClientExperienceSignals.matchingSpans.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ClientExperienceSignals.matchingSpans.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 24) = a1;
  return result;
}

uint64_t (*ClientExperienceSignals.matchingSpans.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

uint64_t ClientExperienceSignals.multiUserContext.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ClientExperienceSignals() + 36);

  return outlined init with copy of Apple_Parsec_Siri_V2alpha_MultiUserContext?(v3, a1);
}

uint64_t outlined init with copy of Apple_Parsec_Siri_V2alpha_MultiUserContext?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_MultiUserContext?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t ClientExperienceSignals.multiUserContext.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ClientExperienceSignals() + 36);

  return outlined assign with take of Apple_Parsec_Siri_V2alpha_MultiUserContext?(a1, v3);
}

uint64_t (*ClientExperienceSignals.multiUserContext.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

void *initializeBufferWithCopyOfBuffer for ClientExperienceSignals(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (void *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    *(void *)(a1 + 8) = a2[1];
    *(_WORD *)(a1 + 16) = *((_WORD *)a2 + 8);
    *(void *)(a1 + 24) = a2[3];
    uint64_t v5 = *(int *)(a3 + 36);
    uint64_t v6 = (void *)(a1 + v5);
    char v7 = (char *)a2 + v5;
    uint64_t v8 = type metadata accessor for Apple_Parsec_Siri_V2alpha_MultiUserContext();
    uint64_t v9 = *(void *)(v8 - 8);
    uint64_t v10 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v9 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v10(v7, 1, v8))
    {
      uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_MultiUserContext?);
      memcpy(v6, v7, *(void *)(*(void *)(v11 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v9 + 16))(v6, v7, v8);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
    }
  }
  return v3;
}

uint64_t destroy for ClientExperienceSignals(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 36);
  uint64_t v5 = type metadata accessor for Apple_Parsec_Siri_V2alpha_MultiUserContext();
  uint64_t v8 = *(void *)(v5 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v4, 1, v5);
  if (!result)
  {
    char v7 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8);
    return v7(v4, v5);
  }
  return result;
}

uint64_t initializeWithCopy for ClientExperienceSignals(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v4 = *(int *)(a3 + 36);
  uint64_t v5 = (void *)(a1 + v4);
  uint64_t v6 = (const void *)(a2 + v4);
  uint64_t v7 = type metadata accessor for Apple_Parsec_Siri_V2alpha_MultiUserContext();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v8 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v9(v6, 1, v7))
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_MultiUserContext?);
    memcpy(v5, v6, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v8 + 16))(v5, v6, v7);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

uint64_t assignWithCopy for ClientExperienceSignals(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 36);
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (void *)(a2 + v6);
  uint64_t v9 = type metadata accessor for Apple_Parsec_Siri_V2alpha_MultiUserContext();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v7, v8, v9);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_MultiUserContext?);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  return a1;
}

uint64_t initializeWithTake for ClientExperienceSignals(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v4 = *(int *)(a3 + 36);
  uint64_t v5 = (void *)(a1 + v4);
  uint64_t v6 = (const void *)(a2 + v4);
  uint64_t v7 = type metadata accessor for Apple_Parsec_Siri_V2alpha_MultiUserContext();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_MultiUserContext?);
    memcpy(v5, v6, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v8 + 32))(v5, v6, v7);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

uint64_t assignWithTake for ClientExperienceSignals(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 36);
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (void *)(a2 + v6);
  uint64_t v9 = type metadata accessor for Apple_Parsec_Siri_V2alpha_MultiUserContext();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 40))(v7, v8, v9);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_MultiUserContext?);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 32))(v7, v8, v9);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for ClientExperienceSignals(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C90D6FC);
}

uint64_t sub_25C90D6FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_MultiUserContext?);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 36);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for ClientExperienceSignals(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C90D7C4);
}

uint64_t sub_25C90D7C4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_MultiUserContext?);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 36);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void type metadata completion function for ClientExperienceSignals()
{
  type metadata accessor for Apple_Parsec_Siri_V2alpha_MultiUserContext?();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void type metadata accessor for Apple_Parsec_Siri_V2alpha_MultiUserContext?()
{
  if (!lazy cache variable for type metadata for Apple_Parsec_Siri_V2alpha_MultiUserContext?)
  {
    type metadata accessor for Apple_Parsec_Siri_V2alpha_MultiUserContext();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for Apple_Parsec_Siri_V2alpha_MultiUserContext?);
    }
  }
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
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
        int v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

uint64_t PommesSearchReason.toInt.getter()
{
  return *v0;
}

SiriInformationTypes::PommesSearchReason_optional __swiftcall PommesSearchReason.init(rawValue:)(Swift::String rawValue)
{
  object = rawValue._object;
  v3._countAndFlagsBits = rawValue._countAndFlagsBits;
  uint64_t v4 = v1;
  v3._object = object;
  unint64_t v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of PommesSearchReason.init(rawValue:), v3);
  result.value = swift_bridgeObjectRelease();
  char v7 = 5;
  if (v5 < 5) {
    char v7 = v5;
  }
  char *v4 = v7;
  return result;
}

unint64_t PommesSearchReason.rawValue.getter()
{
  unint64_t result = 0xD000000000000016;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x616D6F446F666E69;
      break;
    case 2:
      unint64_t result = 0x4665737261506F6ELL;
      break;
    case 3:
      return result;
    case 4:
      unint64_t result = 0xD000000000000010;
      break;
    default:
      unint64_t result = 0x6E776F6E6B6E75;
      break;
  }
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance PommesSearchReason(char *a1, char *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

unint64_t lazy protocol witness table accessor for type PommesSearchReason and conformance PommesSearchReason()
{
  unint64_t result = lazy protocol witness table cache variable for type PommesSearchReason and conformance PommesSearchReason;
  if (!lazy protocol witness table cache variable for type PommesSearchReason and conformance PommesSearchReason)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PommesSearchReason and conformance PommesSearchReason);
  }
  return result;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance PommesSearchReason()
{
  return specialized RawRepresentable<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance PommesSearchReason()
{
  return specialized RawRepresentable<>.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance PommesSearchReason()
{
  return specialized RawRepresentable<>._rawHashValue(seed:)();
}

SiriInformationTypes::PommesSearchReason_optional protocol witness for RawRepresentable.init(rawValue:) in conformance PommesSearchReason(Swift::String *a1)
{
  return PommesSearchReason.init(rawValue:)(*a1);
}

unint64_t protocol witness for RawRepresentable.rawValue.getter in conformance PommesSearchReason@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = PommesSearchReason.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PommesSearchReason(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
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
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PommesSearchReason(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *unint64_t result = a2 + 4;
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
        JUMPOUT(0x25C90DE1CLL);
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
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

uint64_t getEnumTag for PommesSearchReason(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *destructiveInjectEnumTag for PommesSearchReason(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PommesSearchReason()
{
  return &type metadata for PommesSearchReason;
}

id ClientAudioResult.vocabularyResult.getter()
{
  return *(id *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch17ClientAudioResult_vocabularyResult);
}

id ClientAudioResult.__allocating_init(domain:vocabularyResult:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = objc_allocWithZone(v3);
  return ClientAudioResult.init(domain:vocabularyResult:)(a1, a2, a3);
}

id ClientAudioResult.init(domain:vocabularyResult:)(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned int v4 = v3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_AudioItemType?);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&countAndFlagsBits - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    *(void *)&v3[OBJC_IVAR____TtC21SiriInformationSearch17ClientAudioResult_vocabularyResult] = a3;
    if (*(void *)((char *)a3 + OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_itemType) == 5)
    {
      uint64_t v11 = 0xD000000000000016;
      uint64_t v12 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *a3) + 0xA8);
      int v13 = a3;
      uint64_t v14 = v12();
      KVFieldType.audioType.getter(v14, (uint64_t)v10);
      uint64_t v15 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioItemType();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v10, 0, 1, v15);
      static ClientAudioResult.Scheme.from(_:)((uint64_t)v10, (char *)&v40);
      outlined destroy of ClientExperienceSignals?((uint64_t)v10, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_AudioItemType?);
      uint64_t v16 = v40;
      size_t v17 = (char *)v13 + OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_itemId;
      unint64_t v18 = *(void *)((char *)v13 + OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_itemId);
      unint64_t v19 = *((void *)v17 + 1);
      swift_bridgeObjectRetain_n();
      uint64_t v20 = specialized Data.init<A>(_:)(v18, v19);
      unint64_t v22 = v21;
      Swift::String v23 = Data.base64EncodedString(options:)(0);
      uint64_t countAndFlagsBits = v23._countAndFlagsBits;
      outlined consume of Data._Representation(v20, v22);
      uint64_t v38 = 0;
      unint64_t v39 = 0xE000000000000000;
      _StringGuts.grow(_:)(16);
      uint64_t v24 = (void *)0x800000025C9813D0;
      switch(v16)
      {
        case 1:
          break;
        case 2:
          uint64_t v24 = (void *)0xED00006D65746964;
          uint64_t v11 = 0x656D706D61732D78;
          break;
        case 3:
          uint64_t v11 = 0xD000000000000014;
          uint64_t v29 = "x-samppodcastepisode";
          goto LABEL_15;
        case 4:
          uint64_t v11 = 0xD000000000000017;
          uint64_t v29 = "x-samppodcastcollection";
          goto LABEL_15;
        case 5:
          uint64_t v11 = 0xD00000000000001FLL;
          uint64_t v29 = "x-sampcollection-podcaststation";
          goto LABEL_15;
        case 6:
          uint64_t v11 = 0xD000000000000018;
          uint64_t v29 = "x-sampcollection-podcast";
          goto LABEL_15;
        case 7:
          uint64_t v11 = 0xD000000000000017;
          uint64_t v29 = "x-sampcollection-artist";
          goto LABEL_15;
        case 8:
          uint64_t v29 = "x-sampcollection-genre";
          goto LABEL_15;
        case 9:
          uint64_t v11 = 0xD00000000000001ALL;
          uint64_t v29 = "x-sampcollection-audiobook";
LABEL_15:
          uint64_t v24 = (void *)((unint64_t)(v29 - 32) | 0x8000000000000000);
          break;
        default:
          uint64_t v24 = (void *)0xEE007473696C7961;
          uint64_t v11 = 0x6C70706D61732D78;
          break;
      }
      v30._uint64_t countAndFlagsBits = v11;
      v30._object = v24;
      String.append(_:)(v30);
      swift_bridgeObjectRelease();
      v31._uint64_t countAndFlagsBits = 0x73697269732F2F3ALL;
      v31._object = (void *)0xEC0000002F636E79;
      String.append(_:)(v31);
      v32._uint64_t countAndFlagsBits = countAndFlagsBits;
      v32._object = v23._object;
      String.append(_:)(v32);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v27 = v38;
      unint64_t v26 = v39;
    }
    else
    {
      uint64_t v27 = *(void *)((char *)a3 + OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_itemId);
      unint64_t v26 = *(void *)((char *)a3 + OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_itemId + 8);
      uint64_t v28 = a3;
      swift_bridgeObjectRetain();
    }
    uint64_t v33 = &v4[OBJC_IVAR____TtC21SiriInformationSearch12PommesResult_resultId];
    *(void *)uint64_t v33 = v27;
    *((void *)v33 + 1) = v26;
    uint64_t v34 = &v4[OBJC_IVAR____TtC21SiriInformationSearch12PommesResult_domain];
    *(void *)uint64_t v34 = a1;
    *((void *)v34 + 1) = a2;
    *(_OWORD *)&v4[OBJC_IVAR____TtC21SiriInformationSearch12PommesResult_metadata] = xmmword_25C97FD10;
    uint64_t v35 = (objc_class *)type metadata accessor for PommesResult();
    v41.receiver = v4;
    v41.super_class = v35;
    id v25 = objc_msgSendSuper2(&v41, sel_init);
  }
  else
  {
    swift_bridgeObjectRelease();
    type metadata accessor for ClientAudioResult();
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v25;
}

uint64_t static ClientAudioResult.Scheme.from(_:)@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_AudioItemType?);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  id v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v17 - v8;
  outlined init with copy of Apple_Parsec_Siri_V2alpha_MultiUserContext?(a1, (uint64_t)&v17 - v8, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_AudioItemType?);
  uint64_t v10 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioItemType();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) != 1)
  {
    outlined init with copy of Apple_Parsec_Siri_V2alpha_MultiUserContext?((uint64_t)v9, (uint64_t)v7, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_AudioItemType?);
    int v12 = (*(uint64_t (**)(char *, uint64_t))(v11 + 88))(v7, v10);
    if (v12 != *MEMORY[0x263F5CE10])
    {
      if (v12 == *MEMORY[0x263F5CE18])
      {
        char v13 = 1;
        goto LABEL_4;
      }
      if (v12 == *MEMORY[0x263F5CE30])
      {
        char v13 = 7;
        goto LABEL_4;
      }
      if (v12 == *MEMORY[0x263F5CE20])
      {
        char v13 = 8;
        goto LABEL_4;
      }
      if (v12 == *MEMORY[0x263F5CE48])
      {
        *a2 = 0;
        return outlined destroy of ClientExperienceSignals?((uint64_t)v9, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_AudioItemType?);
      }
      if (v12 == *MEMORY[0x263F5CDE8])
      {
        char v13 = 6;
        goto LABEL_4;
      }
      if (v12 == *MEMORY[0x263F5CDF8])
      {
        char v13 = 3;
        goto LABEL_4;
      }
      if (v12 == *MEMORY[0x263F5CE50])
      {
        char v13 = 9;
        goto LABEL_4;
      }
      if (v12 == *MEMORY[0x263F5CE28] || v12 == *MEMORY[0x263F5CE38] || v12 == *MEMORY[0x263F5CDF0])
      {
        uint64_t result = outlined destroy of ClientExperienceSignals?((uint64_t)v9, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_AudioItemType?);
        *a2 = 2;
        return result;
      }
      if (v12 != *MEMORY[0x263F5CDE0])
      {
        if (v12 == *MEMORY[0x263F5CE00])
        {
          char v13 = 5;
          goto LABEL_4;
        }
        (*(void (**)(char *, uint64_t))(v11 + 8))(v7, v10);
      }
    }
  }
  char v13 = 2;
LABEL_4:
  *a2 = v13;
  return outlined destroy of ClientExperienceSignals?((uint64_t)v9, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_AudioItemType?);
}

{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  int v13;
  uint64_t v15;

  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UsoEntity_common_MediaItemType.DefinedValues?);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  id v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v15 - v8;
  outlined init with copy of Apple_Parsec_Siri_V2alpha_MultiUserContext?(a1, (uint64_t)&v15 - v8, &demangling cache variable for type metadata for UsoEntity_common_MediaItemType.DefinedValues?);
  uint64_t v10 = type metadata accessor for UsoEntity_common_MediaItemType.DefinedValues();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) != 1)
  {
    outlined init with copy of Apple_Parsec_Siri_V2alpha_MultiUserContext?((uint64_t)v9, (uint64_t)v7, &demangling cache variable for type metadata for UsoEntity_common_MediaItemType.DefinedValues?);
    char v13 = (*(uint64_t (**)(char *, uint64_t))(v11 + 88))(v7, v10);
    if (v13 == *MEMORY[0x263F72FF0])
    {
      int v12 = 7;
      goto LABEL_10;
    }
    if (v13 == *MEMORY[0x263F73040])
    {
      int v12 = 0;
      goto LABEL_10;
    }
    if (v13 != *MEMORY[0x263F72FC0])
    {
      if (v13 == *MEMORY[0x263F72FC8])
      {
        int v12 = 1;
        goto LABEL_10;
      }
      (*(void (**)(char *, uint64_t))(v11 + 8))(v7, v10);
    }
  }
  int v12 = 2;
LABEL_10:
  *a2 = v12;
  return outlined destroy of ClientExperienceSignals?((uint64_t)v9, &demangling cache variable for type metadata for UsoEntity_common_MediaItemType.DefinedValues?);
}

Swift::String __swiftcall ClientAudioResult.Scheme.buildSiriSyncURI(withId:)(Swift::String withId)
{
  object = withId._object;
  unint64_t countAndFlagsBits = withId._countAndFlagsBits;
  uint64_t v4 = 0xD000000000000016;
  uint64_t v5 = *v1;
  swift_bridgeObjectRetain();
  uint64_t v6 = specialized Data.init<A>(_:)(countAndFlagsBits, (unint64_t)object);
  unint64_t v8 = v7;
  Swift::String v9 = Data.base64EncodedString(options:)(0);
  outlined consume of Data._Representation(v6, v8);
  _StringGuts.grow(_:)(16);
  uint64_t v10 = (void *)0x800000025C9813D0;
  switch(v5)
  {
    case 1:
      break;
    case 2:
      uint64_t v10 = (void *)0xED00006D65746964;
      uint64_t v4 = 0x656D706D61732D78;
      break;
    case 3:
      uint64_t v4 = 0xD000000000000014;
      uint64_t v11 = "x-samppodcastepisode";
      goto LABEL_11;
    case 4:
      uint64_t v4 = 0xD000000000000017;
      uint64_t v11 = "x-samppodcastcollection";
      goto LABEL_11;
    case 5:
      uint64_t v4 = 0xD00000000000001FLL;
      uint64_t v11 = "x-sampcollection-podcaststation";
      goto LABEL_11;
    case 6:
      uint64_t v4 = 0xD000000000000018;
      uint64_t v11 = "x-sampcollection-podcast";
      goto LABEL_11;
    case 7:
      uint64_t v4 = 0xD000000000000017;
      uint64_t v11 = "x-sampcollection-artist";
      goto LABEL_11;
    case 8:
      uint64_t v11 = "x-sampcollection-genre";
      goto LABEL_11;
    case 9:
      uint64_t v4 = 0xD00000000000001ALL;
      uint64_t v11 = "x-sampcollection-audiobook";
LABEL_11:
      uint64_t v10 = (void *)((unint64_t)(v11 - 32) | 0x8000000000000000);
      break;
    default:
      uint64_t v10 = (void *)0xEE007473696C7961;
      uint64_t v4 = 0x6C70706D61732D78;
      break;
  }
  v12._unint64_t countAndFlagsBits = v4;
  v12._object = v10;
  String.append(_:)(v12);
  swift_bridgeObjectRelease();
  v13._unint64_t countAndFlagsBits = 0x73697269732F2F3ALL;
  v13._object = (void *)0xEC0000002F636E79;
  String.append(_:)(v13);
  String.append(_:)(v9);
  swift_bridgeObjectRelease();
  uint64_t v14 = 0;
  uint64_t v15 = (void *)0xE000000000000000;
  result._object = v15;
  result._unint64_t countAndFlagsBits = v14;
  return result;
}

id ClientAudioResult.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return ClientAudioResult.init(coder:)(a1);
}

id ClientAudioResult.init(coder:)(void *a1)
{
  type metadata accessor for VocabularyResult();
  id v3 = v1;
  uint64_t v4 = NSCoder.decodeObject<A>(of:forKey:)();
  if (v4)
  {
    *(void *)&v3[OBJC_IVAR____TtC21SiriInformationSearch17ClientAudioResult_vocabularyResult] = v4;
    id v5 = v4;

    id v6 = PommesResult.init(coder:)(a1);
    id v7 = v6;

    if (v6) {
  }
    }
  else
  {

    type metadata accessor for ClientAudioResult();
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v6;
}

Swift::Void __swiftcall ClientAudioResult.encode(with:)(NSCoder with)
{
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC21SiriInformationSearch17ClientAudioResult_vocabularyResult);
  uint64_t v4 = (void *)MEMORY[0x261198B80](0xD000000000000010, 0x800000025C981A70);
  [(objc_class *)with.super.isa encodeObject:v3 forKey:v4];

  PommesResult.encode(with:)(with);
}

uint64_t ClientAudioResult.description.getter()
{
  uint64_t v1 = v0;
  _StringGuts.grow(_:)(71);
  v2._object = (void *)0x800000025C981A90;
  v2._unint64_t countAndFlagsBits = 0xD000000000000025;
  String.append(_:)(v2);
  id v3 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch17ClientAudioResult_vocabularyResult), sel_description);
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v6 = v5;

  v7._unint64_t countAndFlagsBits = v4;
  v7._object = v6;
  String.append(_:)(v7);
  swift_bridgeObjectRelease();
  v8._unint64_t countAndFlagsBits = 0x6E69616D6F64202CLL;
  v8._object = (void *)0xEB0000000022203ALL;
  String.append(_:)(v8);
  uint64_t v9 = *(void *)(v1 + OBJC_IVAR____TtC21SiriInformationSearch12PommesResult_domain);
  uint64_t v10 = *(void **)(v1 + OBJC_IVAR____TtC21SiriInformationSearch12PommesResult_domain + 8);
  swift_bridgeObjectRetain();
  v11._unint64_t countAndFlagsBits = v9;
  v11._object = v10;
  String.append(_:)(v11);
  swift_bridgeObjectRelease();
  v12._unint64_t countAndFlagsBits = 0x6C75736572202C22;
  v12._object = (void *)0xEE0022203A644974;
  String.append(_:)(v12);
  uint64_t v13 = v1 + OBJC_IVAR____TtC21SiriInformationSearch12PommesResult_resultId;
  uint64_t v14 = *(void *)(v1 + OBJC_IVAR____TtC21SiriInformationSearch12PommesResult_resultId);
  uint64_t v15 = *(void **)(v13 + 8);
  swift_bridgeObjectRetain();
  v16._unint64_t countAndFlagsBits = v14;
  v16._object = v15;
  String.append(_:)(v16);
  swift_bridgeObjectRelease();
  v17._unint64_t countAndFlagsBits = 8200226;
  v17._object = (void *)0xE300000000000000;
  String.append(_:)(v17);
  return 0;
}

uint64_t specialized Data.init<A>(_:)(unint64_t a1, unint64_t a2)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  *(void *)&long long v40 = a1;
  *((void *)&v40 + 1) = a2;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ContiguousBytes);
  if (swift_dynamicCast())
  {
    outlined init with take of ContiguousBytes(v38, (uint64_t)&v41);
    __swift_project_boxed_opaque_existential_1(&v41, v43);
    dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
    swift_bridgeObjectRelease();
    v38[0] = v40;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v41);
    return *(void *)&v38[0];
  }
  uint64_t v39 = 0;
  memset(v38, 0, sizeof(v38));
  outlined destroy of ClientExperienceSignals?((uint64_t)v38, &demangling cache variable for type metadata for ContiguousBytes?);
  unint64_t v2 = a1;
  unint64_t v3 = a2;
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) != 0)
    {
      uint64_t v41 = a1;
      uint64_t v42 = a2 & 0xFFFFFFFFFFFFFFLL;
      id v6 = (char *)&v41 + (HIBYTE(a2) & 0xF);
      Swift::String v7 = &v41;
    }
    else
    {
      if ((a1 & 0x1000000000000000) != 0)
      {
        uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v5 = a1 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v4 = _StringObject.sharedUTF8.getter();
      }
      if (v4) {
        id v6 = (unsigned char *)(v4 + v5);
      }
      else {
        id v6 = 0;
      }
      Swift::String v7 = (uint64_t *)v4;
    }
    Swift::String v8 = specialized Data._Representation.init(_:)(v7, v6);
    unint64_t v10 = v9;
    if (v9 >> 60 != 15)
    {
      swift_bridgeObjectRelease();
      *(void *)&v38[0] = v8;
      *((void *)&v38[0] + 1) = v10;
      return *(void *)&v38[0];
    }
    unint64_t v2 = a1;
    unint64_t v3 = a2;
    if ((a2 & 0x1000000000000000) == 0) {
      goto LABEL_14;
    }
LABEL_70:
    Swift::Int v11 = String.UTF8View._foreignCount()();
    goto LABEL_17;
  }
LABEL_69:
  Swift::String v8 = 0;
  unint64_t v10 = 0xF000000000000000;
  if ((v3 & 0x1000000000000000) != 0) {
    goto LABEL_70;
  }
LABEL_14:
  if ((v3 & 0x2000000000000000) != 0) {
    Swift::Int v11 = HIBYTE(v3) & 0xF;
  }
  else {
    Swift::Int v11 = v2 & 0xFFFFFFFFFFFFLL;
  }
LABEL_17:
  *(void *)&v38[0] = specialized Data._Representation.init(count:)(v11);
  *((void *)&v38[0] + 1) = v12;
  MEMORY[0x270FA5388](*(void *)&v38[0]);
  unint64_t v13 = (unint64_t)specialized Data._Representation.withUnsafeMutableBytes<A>(_:)((void *(*)(uint64_t *__return_ptr, char *, char *))partial apply for specialized closure #3 in Data.init<A>(_:));
  uint64_t v16 = *((void *)&v38[0] + 1) >> 62;
  uint64_t v17 = v13;
  uint64_t v18 = v3;
  unint64_t v19 = v14;
  switch(*((void *)&v38[0] + 1) >> 62)
  {
    case 1:
      LODWORD(v20) = DWORD1(v38[0]) - LODWORD(v38[0]);
      if (__OFSUB__(DWORD1(v38[0]), v38[0])) {
        goto LABEL_73;
      }
      uint64_t v20 = (int)v20;
LABEL_23:
      if (v15 != v20)
      {
        if (v16)
        {
          if (v16 == 1) {
            uint64_t v24 = *(uint64_t *)&v38[0] >> 32;
          }
          else {
            uint64_t v24 = *(void *)(*(void *)&v38[0] + 24);
          }
        }
        else
        {
          uint64_t v24 = BYTE14(v38[0]);
        }
LABEL_61:
        if (v24 < v15)
        {
          __break(1u);
LABEL_73:
          __break(1u);
LABEL_74:
          __break(1u);
        }
        Data._Representation.replaceSubrange(_:with:count:)();
LABEL_63:
        swift_bridgeObjectRelease();
        goto LABEL_64;
      }
LABEL_29:
      if ((v3 & 0x2000000000000000) != 0) {
        unint64_t v25 = HIBYTE(v3) & 0xF;
      }
      else {
        unint64_t v25 = v13 & 0xFFFFFFFFFFFFLL;
      }
      *(void *)((char *)&v40 + 7) = 0;
      *(void *)&long long v40 = 0;
      if (4 * v25 == v14 >> 14) {
        goto LABEL_58;
      }
      LOBYTE(v26) = 0;
      uint64_t v27 = (v13 >> 59) & 1;
      if ((v3 & 0x1000000000000000) == 0) {
        LOBYTE(v27) = 1;
      }
      uint64_t v28 = 4 << v27;
      uint64_t v35 = v3 & 0xFFFFFFFFFFFFFFLL;
      uint64_t v33 = (uint64_t)v8;
      uint64_t v34 = (v3 & 0xFFFFFFFFFFFFFFFLL) + 32;
      break;
    case 2:
      uint64_t v22 = *(void *)(*(void *)&v38[0] + 16);
      uint64_t v21 = *(void *)(*(void *)&v38[0] + 24);
      BOOL v23 = __OFSUB__(v21, v22);
      uint64_t v20 = v21 - v22;
      if (!v23) {
        goto LABEL_23;
      }
      goto LABEL_74;
    case 3:
      if (!v15) {
        goto LABEL_29;
      }
      uint64_t v24 = 0;
      goto LABEL_61;
    default:
      uint64_t v20 = BYTE14(v38[0]);
      goto LABEL_23;
  }
  do
  {
    unint64_t v29 = v19 & 0xC;
    unint64_t v2 = v19;
    if (v29 == v28) {
      unint64_t v2 = _StringGuts._slowEnsureMatchingEncoding(_:)(v19, v17, v18);
    }
    unint64_t v30 = v2 >> 16;
    if (v2 >> 16 >= v25)
    {
      __break(1u);
LABEL_67:
      __break(1u);
LABEL_68:
      __break(1u);
      goto LABEL_69;
    }
    if ((v18 & 0x1000000000000000) != 0)
    {
      unint64_t v2 = String.UTF8View._foreignSubscript(position:)();
      char v31 = v2;
      if (v29 != v28) {
        goto LABEL_47;
      }
    }
    else if ((v18 & 0x2000000000000000) != 0)
    {
      uint64_t v41 = v17;
      uint64_t v42 = v35;
      char v31 = *((unsigned char *)&v41 + v30);
      if (v29 != v28) {
        goto LABEL_47;
      }
    }
    else
    {
      unint64_t v2 = v34;
      if ((v17 & 0x1000000000000000) == 0) {
        unint64_t v2 = _StringObject.sharedUTF8.getter();
      }
      char v31 = *(unsigned char *)(v2 + v30);
      if (v29 != v28)
      {
LABEL_47:
        if ((v18 & 0x1000000000000000) == 0) {
          goto LABEL_48;
        }
        goto LABEL_51;
      }
    }
    unint64_t v2 = _StringGuts._slowEnsureMatchingEncoding(_:)(v19, v17, v18);
    unint64_t v19 = v2;
    if ((v18 & 0x1000000000000000) == 0)
    {
LABEL_48:
      unint64_t v19 = (v19 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_53;
    }
LABEL_51:
    if (v25 <= v19 >> 16) {
      goto LABEL_68;
    }
    unint64_t v2 = String.UTF8View._foreignIndex(after:)();
    unint64_t v19 = v2;
LABEL_53:
    *((unsigned char *)&v40 + v26) = v31;
    unsigned int v26 = v26 + 1;
    if ((v26 >> 8)) {
      goto LABEL_67;
    }
    BYTE14(v40) = v26;
    if (v26 == 14)
    {
      uint64_t v41 = v40;
      LODWORD(v42) = DWORD2(v40);
      WORD2(v42) = WORD6(v40);
      Data._Representation.append(contentsOf:)();
      LOBYTE(v26) = 0;
      BYTE14(v40) = 0;
    }
  }
  while (4 * v25 != v19 >> 14);
  Swift::String v8 = (unsigned char *)v33;
  if ((_BYTE)v26)
  {
    uint64_t v41 = v40;
    LODWORD(v42) = DWORD2(v40);
    WORD2(v42) = WORD6(v40);
    Data._Representation.append(contentsOf:)();
    outlined consume of Data._Representation?(v33, v10);
    goto LABEL_63;
  }
LABEL_58:
  swift_bridgeObjectRelease();
  outlined consume of Data._Representation?((uint64_t)v8, v10);
LABEL_64:
  swift_bridgeObjectRelease();
  return *(void *)&v38[0];
}

unint64_t ClientAudioResult.Scheme.rawValue.getter()
{
  unint64_t result = 0xD000000000000016;
  switch(*v0)
  {
    case 1:
    case 8:
      return result;
    case 2:
      unint64_t result = 0x656D706D61732D78;
      break;
    case 3:
      unint64_t result = 0xD000000000000014;
      break;
    case 4:
      unint64_t result = 0xD000000000000017;
      break;
    case 5:
      unint64_t result = 0xD00000000000001FLL;
      break;
    case 6:
      unint64_t result = 0xD000000000000018;
      break;
    case 7:
      unint64_t result = 0xD000000000000017;
      break;
    case 9:
      unint64_t result = 0xD00000000000001ALL;
      break;
    default:
      unint64_t result = 0x6C70706D61732D78;
      break;
  }
  return result;
}

uint64_t type metadata accessor for ClientAudioResult()
{
  return self;
}

Swift::String __swiftcall ClientAudioResult.Scheme.buildDeviceID(withId:)(Swift::String withId)
{
  uint64_t countAndFlagsBits = withId._countAndFlagsBits;
  withId._uint64_t countAndFlagsBits = 0xD000000000000016;
  unint64_t v3 = (void *)0x800000025C9813D0;
  object = withId._object;
  switch(*v1)
  {
    case 1:
      break;
    case 2:
      unint64_t v3 = (void *)0xED00006D65746964;
      withId._uint64_t countAndFlagsBits = 0x656D706D61732D78;
      break;
    case 3:
      withId._uint64_t countAndFlagsBits = 0xD000000000000014;
      uint64_t v5 = "x-samppodcastepisode";
      goto LABEL_11;
    case 4:
      withId._uint64_t countAndFlagsBits = 0xD000000000000017;
      uint64_t v5 = "x-samppodcastcollection";
      goto LABEL_11;
    case 5:
      withId._uint64_t countAndFlagsBits = 0xD00000000000001FLL;
      uint64_t v5 = "x-sampcollection-podcaststation";
      goto LABEL_11;
    case 6:
      withId._uint64_t countAndFlagsBits = 0xD000000000000018;
      uint64_t v5 = "x-sampcollection-podcast";
      goto LABEL_11;
    case 7:
      withId._uint64_t countAndFlagsBits = 0xD000000000000017;
      uint64_t v5 = "x-sampcollection-artist";
      goto LABEL_11;
    case 8:
      uint64_t v5 = "x-sampcollection-genre";
      goto LABEL_11;
    case 9:
      withId._uint64_t countAndFlagsBits = 0xD00000000000001ALL;
      uint64_t v5 = "x-sampcollection-audiobook";
LABEL_11:
      unint64_t v3 = (void *)((unint64_t)(v5 - 32) | 0x8000000000000000);
      break;
    default:
      unint64_t v3 = (void *)0xEE007473696C7961;
      withId._uint64_t countAndFlagsBits = 0x6C70706D61732D78;
      break;
  }
  withId._object = v3;
  String.append(_:)(withId);
  swift_bridgeObjectRelease();
  v6._uint64_t countAndFlagsBits = 0x63697665642F2F3ALL;
  v6._object = (void *)0xEA00000000002F65;
  String.append(_:)(v6);
  v7._uint64_t countAndFlagsBits = countAndFlagsBits;
  v7._object = object;
  String.append(_:)(v7);
  uint64_t v8 = 0;
  unint64_t v9 = (void *)0xE000000000000000;
  result._object = v9;
  result._uint64_t countAndFlagsBits = v8;
  return result;
}

SiriInformationSearch::ClientAudioResult::Scheme_optional __swiftcall ClientAudioResult.Scheme.init(rawValue:)(Swift::String rawValue)
{
  object = rawValue._object;
  v3._uint64_t countAndFlagsBits = rawValue._countAndFlagsBits;
  uint64_t v4 = v1;
  v3._object = object;
  unint64_t v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of ClientAudioResult.Scheme.init(rawValue:), v3);
  result.value = swift_bridgeObjectRelease();
  char v7 = 10;
  if (v5 < 0xA) {
    char v7 = v5;
  }
  char *v4 = v7;
  return result;
}

void *static ClientAudioResult.Scheme.allCases.getter()
{
  return &outlined read-only object #0 of static ClientAudioResult.Scheme.allCases.getter;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance ClientAudioResult.Scheme(unsigned __int8 *a1, char *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance ClientAudioResult.Scheme()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance ClientAudioResult.Scheme()
{
  return specialized RawRepresentable<>.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ClientAudioResult.Scheme()
{
  return Hasher._finalize()();
}

SiriInformationSearch::ClientAudioResult::Scheme_optional protocol witness for RawRepresentable.init(rawValue:) in conformance ClientAudioResult.Scheme(Swift::String *a1)
{
  return ClientAudioResult.Scheme.init(rawValue:)(*a1);
}

unint64_t protocol witness for RawRepresentable.rawValue.getter in conformance ClientAudioResult.Scheme@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = ClientAudioResult.Scheme.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void protocol witness for static CaseIterable.allCases.getter in conformance ClientAudioResult.Scheme(void *a1@<X8>)
{
  *a1 = &outlined read-only object #0 of static ClientAudioResult.Scheme.allCases.getter;
}

void ClientAudioResult.__allocating_init(resultId:domain:metadata:)()
{
}

void ClientAudioResult.init(resultId:domain:metadata:)()
{
}

void ClientAudioResult.__ivar_destroyer()
{
}

id ClientAudioResult.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ClientAudioResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t lazy protocol witness table accessor for type ClientAudioResult.Scheme and conformance ClientAudioResult.Scheme()
{
  unint64_t result = lazy protocol witness table cache variable for type ClientAudioResult.Scheme and conformance ClientAudioResult.Scheme;
  if (!lazy protocol witness table cache variable for type ClientAudioResult.Scheme and conformance ClientAudioResult.Scheme)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ClientAudioResult.Scheme and conformance ClientAudioResult.Scheme);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type [ClientAudioResult.Scheme] and conformance [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [ClientAudioResult.Scheme] and conformance [A];
  if (!lazy protocol witness table cache variable for type [ClientAudioResult.Scheme] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [ClientAudioResult.Scheme]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [ClientAudioResult.Scheme] and conformance [A]);
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

uint64_t method lookup function for ClientAudioResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ClientAudioResult);
}

uint64_t dispatch thunk of ClientAudioResult.__allocating_init(domain:vocabularyResult:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t getEnumTagSinglePayload for ClientAudioResult.Scheme(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF7) {
    goto LABEL_17;
  }
  if (a2 + 9 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 9) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 9;
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
      return (*a1 | (v4 << 8)) - 9;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 9;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xA;
  int v8 = v6 - 10;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ClientAudioResult.Scheme(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 9 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 9) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF7) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF6)
  {
    unsigned int v6 = ((a2 - 247) >> 8) + 1;
    *uint64_t result = a2 + 9;
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
        JUMPOUT(0x25C90FA78);
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
          *uint64_t result = a2 + 9;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ClientAudioResult.Scheme()
{
  return &type metadata for ClientAudioResult.Scheme;
}

uint64_t _StringGuts._slowEnsureMatchingEncoding(_:)(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = String.UTF16View.index(_:offsetBy:)();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = MEMORY[0x261198C10](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

char *specialized Data._Representation.withUnsafeMutableBytes<A>(_:)(void *(*a1)(uint64_t *__return_ptr, char *, char *))
{
  v16[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = *v1;
  unint64_t v3 = v1[1];
  uint64_t v5 = v1;
  switch(v3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)uint64_t v1 = xmmword_25C97FD20;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v11 = v4 >> 32;
      if (isUniquelyReferenced_nonNull_native) {
        goto LABEL_16;
      }
      if (v11 < (int)v4) {
        goto LABEL_23;
      }
      if (__DataStorage._bytes.getter() && __OFSUB__((int)v4, __DataStorage._offset.getter())) {
        goto LABEL_24;
      }
      type metadata accessor for __DataStorage();
      swift_allocObject();
      uint64_t v13 = __DataStorage.init(bytes:length:copy:deallocator:offset:)();
      swift_release();
      uint64_t v9 = v13;
      uint64_t v11 = v4 >> 32;
LABEL_16:
      if (v11 < (int)v4)
      {
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
      }
      uint64_t result = specialized __DataStorage.withUnsafeMutableBytes<A>(in:apply:)((int)v4, v11, a1);
      unint64_t v12 = v9 | 0x4000000000000000;
      if (v2)
      {
        uint64_t *v5 = v4;
        goto LABEL_19;
      }
      uint64_t *v5 = v4;
      v5[1] = v12;
      break;
    case 2uLL:
      uint64_t v14 = *v1;
      uint64_t v15 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      Data.LargeSlice.ensureUniqueReference()();
      uint64_t result = specialized __DataStorage.withUnsafeMutableBytes<A>(in:apply:)(*(void *)(v14 + 16), *(void *)(v14 + 24), a1);
      unint64_t v12 = v15 | 0x8000000000000000;
      if (v2)
      {
        *uint64_t v1 = v14;
LABEL_19:
        v5[1] = v12;
      }
      else
      {
        *uint64_t v1 = v14;
        v1[1] = v12;
      }
      break;
    case 3uLL:
      memset(v16, 0, 15);
      uint64_t result = (char *)a1(&v14, (char *)v16, (char *)v16);
      if (!v2) {
        return (char *)v14;
      }
      return result;
    default:
      v16[0] = *v1;
      LOWORD(v16[1]) = v3;
      BYTE2(v16[1]) = BYTE2(v3);
      BYTE3(v16[1]) = BYTE3(v3);
      BYTE4(v16[1]) = BYTE4(v3);
      BYTE5(v16[1]) = BYTE5(v3);
      BYTE6(v16[1]) = BYTE6(v3);
      uint64_t result = (char *)a1(&v14, (char *)v16, (char *)v16 + BYTE6(v3));
      if (!v2) {
        uint64_t result = (char *)v14;
      }
      unint64_t v8 = LODWORD(v16[1]) | ((unint64_t)BYTE4(v16[1]) << 32) | ((unint64_t)BYTE5(v16[1]) << 40) | ((unint64_t)BYTE6(v16[1]) << 48);
      *uint64_t v1 = v16[0];
      v1[1] = v8;
      return result;
  }
  return result;
}

unsigned char *closure #1 in Data.init<A>(_:)@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X1>, void *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    uint64_t result = 0;
LABEL_4:
    unint64_t v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    uint64_t result = (unsigned char *)specialized Data.InlineData.init(_:)(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    uint64_t result = (unsigned char *)specialized Data.LargeSlice.init(_:)((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    uint64_t result = (unsigned char *)specialized Data.InlineSlice.init(_:)((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

void *_sSw17withMemoryRebound2to_q0_xm_q0_SryxGq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lFs5UInt8V_s5NeverOs16IndexingIteratorVySS8UTF8ViewVG_SitTgm5(void *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3)
  {
    uint64_t result = a1(&v6, a3, a4 - a3);
    if (v4) {
      return result;
    }
    return (void *)v6;
  }
  uint64_t result = a1(&v6, 0, 0);
  if (!v4) {
    return (void *)v6;
  }
  return result;
}

char *specialized __DataStorage.withUnsafeMutableBytes<A>(in:apply:)(uint64_t a1, uint64_t a2, void *(*a3)(uint64_t *__return_ptr, char *, char *))
{
  uint64_t result = (char *)__DataStorage._bytes.getter();
  if (!result) {
    goto LABEL_12;
  }
  uint64_t v8 = result;
  uint64_t result = (char *)__DataStorage._offset.getter();
  uint64_t v9 = a1 - (void)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  BOOL v10 = __OFSUB__(a2, a1);
  uint64_t v11 = a2 - a1;
  if (v10)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  uint64_t v12 = __DataStorage._length.getter();
  if (v12 >= v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v12;
  }
  uint64_t result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3) {
    return (char *)v14;
  }
  return result;
}

uint64_t specialized closure #1 in closure #3 in Data.init<A>(_:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    uint64_t result = _StringGuts.copyUTF8(into:)();
    if ((v3 & 1) == 0)
    {
      uint64_t v4 = result;
      uint64_t result = swift_bridgeObjectRelease();
      *a2 = 0;
      a2[1] = 0xE000000000000000;
      a2[2] = 15;
      a2[3] = v4;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t specialized Data.InlineData.init(_:)(unsigned char *__src, unsigned char *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t specialized Data.LargeSlice.init(_:)(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  type metadata accessor for __DataStorage();
  swift_allocObject();
  uint64_t result = __DataStorage.init(bytes:length:)();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    type metadata accessor for Data.RangeReference();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = v2;
  }
  return result;
}

uint64_t specialized Data.InlineSlice.init(_:)(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  type metadata accessor for __DataStorage();
  swift_allocObject();
  uint64_t result = __DataStorage.init(bytes:length:)();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0) {
    return v2 << 32;
  }
LABEL_10:
  __break(1u);
  return result;
}

unsigned char *specialized Data._Representation.init(_:)(unsigned char *result, unsigned char *a2)
{
  if (result)
  {
    uint64_t v2 = a2 - result;
    if (a2 == result)
    {
      return 0;
    }
    else if (v2 <= 14)
    {
      return (unsigned char *)specialized Data.InlineData.init(_:)(result, a2);
    }
    else if ((unint64_t)v2 >= 0x7FFFFFFF)
    {
      return (unsigned char *)specialized Data.LargeSlice.init(_:)((uint64_t)result, (uint64_t)a2);
    }
    else
    {
      return (unsigned char *)specialized Data.InlineSlice.init(_:)((uint64_t)result, (uint64_t)a2);
    }
  }
  return result;
}

uint64_t specialized Data._Representation.init(count:)(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    if (result <= 14)
    {
      if (result < 0) {
        __break(1u);
      }
      else {
        return 0;
      }
    }
    else
    {
      type metadata accessor for __DataStorage();
      swift_allocObject();
      __DataStorage.init(length:)();
      if (v1 >= 0x7FFFFFFF)
      {
        type metadata accessor for Data.RangeReference();
        uint64_t result = swift_allocObject();
        *(void *)(result + 16) = 0;
        *(void *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

void *partial apply for specialized closure #3 in Data.init<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  char v5 = *(uint64_t **)(v3 + 16);
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  v13[0] = v7;
  v13[1] = v6;
  v12[2] = v13;
  uint64_t result = _sSw17withMemoryRebound2to_q0_xm_q0_SryxGq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lFs5UInt8V_s5NeverOs16IndexingIteratorVySS8UTF8ViewVG_SitTgm5((void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))partial apply for specialized closure #1 in closure #3 in Data.init<A>(_:), (uint64_t)v12, a1, a2);
  *a3 = result;
  a3[1] = v9;
  a3[2] = v10;
  a3[3] = v11;
  return result;
}

uint64_t outlined consume of Data._Representation?(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return outlined consume of Data._Representation(a1, a2);
  }
  return a1;
}

uint64_t outlined init with take of ContiguousBytes(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t partial apply for specialized closure #1 in closure #3 in Data.init<A>(_:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return specialized closure #1 in closure #3 in Data.init<A>(_:)(a1, a2);
}

uint64_t VideoExperience.videoClientComponent.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC21SiriInformationSearch15VideoExperience_videoClientComponent;
  uint64_t v4 = type metadata accessor for Apple_Parsec_Siri_V2alpha_VideoClientComponent();
  char v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t VideoExperience.__allocating_init(pluginId:videoClientComponent:queryConfidenceScore:)(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v9 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for Apple_Parsec_Siri_V2alpha_VideoClientComponent();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, a3, v12);
  Siri_Nlu_External_UserDialogAct.init()();
  uint64_t v16 = (*(uint64_t (**)(uint64_t, uint64_t, char *, char *, double))(v4 + 336))(a1, a2, v15, v11, a4);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(a3, v12);
  return v16;
}

id VideoExperience.__allocating_init(pluginId:videoClientComponent:queryConfidenceScore:userDialogAct:)(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, double a5)
{
  id v11 = objc_allocWithZone(v5);
  return VideoExperience.init(pluginId:videoClientComponent:queryConfidenceScore:userDialogAct:)(a1, a2, a3, a4, a5);
}

id VideoExperience.init(pluginId:videoClientComponent:queryConfidenceScore:userDialogAct:)(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, double a5)
{
  uint64_t v31 = a3;
  Swift::String v32 = a4;
  uint64_t v28 = a1;
  uint64_t v29 = a2;
  uint64_t v27 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent();
  uint64_t v8 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = &v5[OBJC_IVAR____TtC21SiriInformationSearch15VideoExperience_videoClientComponent];
  uint64_t v30 = type metadata accessor for Apple_Parsec_Siri_V2alpha_VideoClientComponent();
  uint64_t v16 = *(void *)(v30 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v15, a3, v30);
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v17(v14, (uint64_t)v32, v11);
  id v26 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for PommesRenderOptions(0)), sel_init);
  uint64_t v18 = v27;
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F5CA28], v27);
  *(void *)&v5[OBJC_IVAR____TtC21SiriInformationSearch10Experience_associatedEntities] = MEMORY[0x263F8EE78];
  unint64_t v19 = &v5[OBJC_IVAR____TtC21SiriInformationSearch10Experience_pluginIdentifier];
  uint64_t v20 = v29;
  *(void *)unint64_t v19 = v28;
  *((void *)v19 + 1) = v20;
  *(double *)&v5[OBJC_IVAR____TtC21SiriInformationSearch10Experience_queryConfidence] = a5;
  v17(&v5[OBJC_IVAR____TtC21SiriInformationSearch10Experience_userDialogAct], (uint64_t)v14, v11);
  *(void *)&v5[OBJC_IVAR____TtC21SiriInformationSearch10Experience_renderOptions] = v26;
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(&v5[OBJC_IVAR____TtC21SiriInformationSearch10Experience_intent], v10, v18);
  uint64_t v21 = (objc_class *)type metadata accessor for Experience(0);
  v33.receiver = v5;
  v33.super_class = v21;
  id v22 = objc_msgSendSuper2(&v33, sel_init);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v18);
  BOOL v23 = *(void (**)(char *, uint64_t))(v12 + 8);
  v23(v14, v11);
  v23(v32, v11);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v31, v30);
  return v22;
}

id VideoExperience.__allocating_init(pluginId:videoClientComponent:queryConfidenceScore:userDialogAct:renderOptions:)(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, uint64_t a5, double a6)
{
  id v13 = objc_allocWithZone(v6);
  return VideoExperience.init(pluginId:videoClientComponent:queryConfidenceScore:userDialogAct:renderOptions:)(a1, a2, a3, a4, a5, a6);
}

id VideoExperience.init(pluginId:videoClientComponent:queryConfidenceScore:userDialogAct:renderOptions:)(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, uint64_t a5, double a6)
{
  uint64_t v30 = a5;
  uint64_t v31 = a4;
  uint64_t v29 = a3;
  uint64_t v26 = a1;
  uint64_t v27 = a2;
  uint64_t v9 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = &v6[OBJC_IVAR____TtC21SiriInformationSearch15VideoExperience_videoClientComponent];
  uint64_t v28 = type metadata accessor for Apple_Parsec_Siri_V2alpha_VideoClientComponent();
  uint64_t v18 = *(void *)(v28 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v17, a3, v28);
  unint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  v19(v16, (uint64_t)v31, v13);
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, *MEMORY[0x263F5CA28], v9);
  *(void *)&v6[OBJC_IVAR____TtC21SiriInformationSearch10Experience_associatedEntities] = MEMORY[0x263F8EE78];
  uint64_t v20 = &v6[OBJC_IVAR____TtC21SiriInformationSearch10Experience_pluginIdentifier];
  uint64_t v21 = v27;
  *(void *)uint64_t v20 = v26;
  *((void *)v20 + 1) = v21;
  *(double *)&v6[OBJC_IVAR____TtC21SiriInformationSearch10Experience_queryConfidence] = a6;
  v19(&v6[OBJC_IVAR____TtC21SiriInformationSearch10Experience_userDialogAct], (uint64_t)v16, v13);
  *(void *)&v6[OBJC_IVAR____TtC21SiriInformationSearch10Experience_renderOptions] = v30;
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(&v6[OBJC_IVAR____TtC21SiriInformationSearch10Experience_intent], v12, v9);
  id v22 = (objc_class *)type metadata accessor for Experience(0);
  v32.receiver = v6;
  v32.super_class = v22;
  id v23 = objc_msgSendSuper2(&v32, sel_init);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  uint64_t v24 = *(void (**)(char *, uint64_t))(v14 + 8);
  v24(v16, v13);
  v24(v31, v13);
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v29, v28);
  return v23;
}

void *VideoExperience.catIds.getter()
{
  return &outlined read-only object #0 of VideoExperience.catIds.getter;
}

id VideoExperience.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return VideoExperience.init(coder:)(a1);
}

id VideoExperience.init(coder:)(void *a1)
{
  uint64_t v3 = type metadata accessor for BinaryDecodingOptions();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v4 = type metadata accessor for Apple_Parsec_Siri_V2alpha_VideoClientComponent();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for NSData();
  id v8 = v1;
  uint64_t v9 = NSCoder.decodeObject<A>(of:forKey:)();
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    static Data._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v21 = 0;
    long long v19 = 0u;
    long long v20 = 0u;
    BinaryDecodingOptions.init()();
    lazy protocol witness table accessor for type Apple_Parsec_Siri_V2alpha_VideoClientComponent and conformance Apple_Parsec_Siri_V2alpha_VideoClientComponent();
    Message.init(serializedData:extensions:partial:options:)();
    (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))((uint64_t)v8 + OBJC_IVAR____TtC21SiriInformationSearch15VideoExperience_videoClientComponent, v7, v4);

    id v15 = Experience.init(coder:)(a1);
    id v16 = v15;

    if (v15) {
  }
    }
  else
  {

    if (one-time initialization token for pommes != -1) {
      swift_once();
    }
    uint64_t v11 = type metadata accessor for Logger();
    __swift_project_value_buffer(v11, (uint64_t)static Logger.pommes);
    uint64_t v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_25C8FE000, v12, v13, "VideoExperience cannot be decoded", v14, 2u);
      MEMORY[0x261199590](v14, -1, -1);
    }

    type metadata accessor for VideoExperience();
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v15;
}

unint64_t type metadata accessor for NSData()
{
  unint64_t result = lazy cache variable for type metadata for NSData;
  if (!lazy cache variable for type metadata for NSData)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for NSData);
  }
  return result;
}

Swift::Void __swiftcall VideoExperience.encode(with:)(NSCoder with)
{
  type metadata accessor for Apple_Parsec_Siri_V2alpha_VideoClientComponent();
  lazy protocol witness table accessor for type Apple_Parsec_Siri_V2alpha_VideoClientComponent and conformance Apple_Parsec_Siri_V2alpha_VideoClientComponent();
  uint64_t v2 = Message.serializedData(partial:)();
  unint64_t v4 = v3;
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data._Representation(v2, v4);
  uint64_t v6 = (void *)MEMORY[0x261198B80](0xD000000000000014, 0x800000025C981B70);
  [(objc_class *)with.super.isa encodeObject:isa forKey:v6];

  Experience.encode(with:)(with);
}

void VideoExperience.__allocating_init(pluginId:queryConfidence:)()
{
}

void VideoExperience.init(pluginId:queryConfidence:)()
{
}

void VideoExperience.__allocating_init(pluginId:queryConfidence:userDialogAct:)()
{
}

void VideoExperience.init(pluginId:queryConfidence:userDialogAct:)()
{
}

void VideoExperience.__allocating_init(pluginId:queryConfidence:userDialogAct:renderOptions:)()
{
}

void VideoExperience.init(pluginId:queryConfidence:userDialogAct:renderOptions:)()
{
}

void VideoExperience.__allocating_init(pluginId:queryConfidence:userDialogAct:intent:)()
{
}

void VideoExperience.init(pluginId:queryConfidence:userDialogAct:intent:)()
{
}

void VideoExperience.__allocating_init(pluginId:queryConfidence:userDialogAct:renderOptions:intent:)()
{
}

void VideoExperience.init(pluginId:queryConfidence:userDialogAct:renderOptions:intent:)()
{
}

uint64_t VideoExperience.__ivar_destroyer()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC21SiriInformationSearch15VideoExperience_videoClientComponent;
  uint64_t v2 = type metadata accessor for Apple_Parsec_Siri_V2alpha_VideoClientComponent();
  unint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(v1, v2);
}

id VideoExperience.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VideoExperience();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for VideoExperience()
{
  uint64_t result = type metadata singleton initialization cache for VideoExperience;
  if (!type metadata singleton initialization cache for VideoExperience) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Apple_Parsec_Siri_V2alpha_VideoClientComponent and conformance Apple_Parsec_Siri_V2alpha_VideoClientComponent()
{
  unint64_t result = lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_VideoClientComponent and conformance Apple_Parsec_Siri_V2alpha_VideoClientComponent;
  if (!lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_VideoClientComponent and conformance Apple_Parsec_Siri_V2alpha_VideoClientComponent)
  {
    type metadata accessor for Apple_Parsec_Siri_V2alpha_VideoClientComponent();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_VideoClientComponent and conformance Apple_Parsec_Siri_V2alpha_VideoClientComponent);
  }
  return result;
}

uint64_t ObjC metadata update function for VideoExperience()
{
  return type metadata accessor for VideoExperience();
}

uint64_t type metadata completion function for VideoExperience()
{
  uint64_t result = type metadata accessor for Apple_Parsec_Siri_V2alpha_VideoClientComponent();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for VideoExperience(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for VideoExperience);
}

uint64_t dispatch thunk of VideoExperience.__allocating_init(pluginId:videoClientComponent:queryConfidenceScore:userDialogAct:)()
{
  return (*(uint64_t (**)(void))(v0 + 336))();
}

uint64_t dispatch thunk of VideoExperience.__allocating_init(pluginId:videoClientComponent:queryConfidenceScore:userDialogAct:renderOptions:)()
{
  return (*(uint64_t (**)(void))(v0 + 344))();
}

uint64_t specialized == infix<A>(_:_:)(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v3 = 0xD000000000000013;
    }
    else {
      unint64_t v3 = 0xD00000000000001ALL;
    }
    if (v2 == 1) {
      unint64_t v4 = 0x800000025C981530;
    }
    else {
      unint64_t v4 = 0x800000025C981550;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        unint64_t v6 = 0xD000000000000013;
      }
      else {
        unint64_t v6 = 0xD00000000000001ALL;
      }
      if (v5 == 1) {
        unint64_t v7 = 0x800000025C981530;
      }
      else {
        unint64_t v7 = 0x800000025C981550;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v3 = 0x656E696665646E75;
    unint64_t v4 = 0xE900000000000064;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE900000000000064;
  if (v3 != 0x656E696665646E75)
  {
LABEL_21:
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t specialized == infix<A>(_:_:)(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000016;
  unint64_t v3 = 0x800000025C9813D0;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000016;
  switch(v4)
  {
    case 1:
      break;
    case 2:
      unint64_t v5 = 0x656D706D61732D78;
      unint64_t v3 = 0xED00006D65746964;
      break;
    case 3:
      unint64_t v5 = 0xD000000000000014;
      unint64_t v6 = "x-samppodcastepisode";
      goto LABEL_11;
    case 4:
      unint64_t v5 = 0xD000000000000017;
      unint64_t v6 = "x-samppodcastcollection";
      goto LABEL_11;
    case 5:
      unint64_t v5 = 0xD00000000000001FLL;
      unint64_t v6 = "x-sampcollection-podcaststation";
      goto LABEL_11;
    case 6:
      unint64_t v5 = 0xD000000000000018;
      unint64_t v6 = "x-sampcollection-podcast";
      goto LABEL_11;
    case 7:
      unint64_t v5 = 0xD000000000000017;
      unint64_t v6 = "x-sampcollection-artist";
      goto LABEL_11;
    case 8:
      unint64_t v6 = "x-sampcollection-genre";
      goto LABEL_11;
    case 9:
      unint64_t v5 = 0xD00000000000001ALL;
      unint64_t v6 = "x-sampcollection-audiobook";
LABEL_11:
      unint64_t v3 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      break;
    default:
      unint64_t v5 = 0x6C70706D61732D78;
      unint64_t v3 = 0xEE007473696C7961;
      break;
  }
  unint64_t v7 = 0x800000025C9813D0;
  switch(a2)
  {
    case 1:
      break;
    case 2:
      unint64_t v2 = 0x656D706D61732D78;
      unint64_t v7 = 0xED00006D65746964;
      break;
    case 3:
      unint64_t v2 = 0xD000000000000014;
      char v8 = "x-samppodcastepisode";
      goto LABEL_22;
    case 4:
      unint64_t v2 = 0xD000000000000017;
      char v8 = "x-samppodcastcollection";
      goto LABEL_22;
    case 5:
      unint64_t v2 = 0xD00000000000001FLL;
      char v8 = "x-sampcollection-podcaststation";
      goto LABEL_22;
    case 6:
      unint64_t v2 = 0xD000000000000018;
      char v8 = "x-sampcollection-podcast";
      goto LABEL_22;
    case 7:
      unint64_t v2 = 0xD000000000000017;
      char v8 = "x-sampcollection-artist";
      goto LABEL_22;
    case 8:
      char v8 = "x-sampcollection-genre";
      goto LABEL_22;
    case 9:
      unint64_t v2 = 0xD00000000000001ALL;
      char v8 = "x-sampcollection-audiobook";
LABEL_22:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      break;
    default:
      unint64_t v2 = 0x6C70706D61732D78;
      unint64_t v7 = 0xEE007473696C7961;
      break;
  }
  if (v5 == v2 && v3 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t specialized == infix<A>(_:_:)(char a1, char a2)
{
  unint64_t v3 = 0xD000000000000016;
  unint64_t v4 = 0x800000025C981390;
  switch(a1)
  {
    case 1:
      unint64_t v3 = 0x616D6F446F666E69;
      unint64_t v4 = 0xEF65737261506E69;
      break;
    case 2:
      unint64_t v3 = 0x4665737261506F6ELL;
      unint64_t v4 = 0xEF6B6361626C6C61;
      break;
    case 3:
      break;
    case 4:
      unint64_t v4 = 0x800000025C9813B0;
      unint64_t v3 = 0xD000000000000010;
      break;
    default:
      unint64_t v4 = 0xE700000000000000;
      unint64_t v3 = 0x6E776F6E6B6E75;
      break;
  }
  unint64_t v5 = 0xD000000000000016;
  unint64_t v6 = 0x800000025C981390;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xEF65737261506E69;
      if (v3 == 0x616D6F446F666E69) {
        goto LABEL_13;
      }
      goto LABEL_16;
    case 2:
      unint64_t v5 = 0x4665737261506F6ELL;
      unint64_t v6 = 0xEF6B6361626C6C61;
      goto LABEL_12;
    case 3:
LABEL_12:
      if (v3 == v5) {
        goto LABEL_13;
      }
      goto LABEL_16;
    case 4:
      unint64_t v6 = 0x800000025C9813B0;
      if (v3 != 0xD000000000000010) {
        goto LABEL_16;
      }
      goto LABEL_13;
    default:
      unint64_t v6 = 0xE700000000000000;
      if (v3 != 0x6E776F6E6B6E75) {
        goto LABEL_16;
      }
LABEL_13:
      if (v4 == v6) {
        char v7 = 1;
      }
      else {
LABEL_16:
      }
        char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

id PommesResult.init(resultId:domain:metadata:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  char v7 = &v6[OBJC_IVAR____TtC21SiriInformationSearch12PommesResult_resultId];
  *(void *)char v7 = a1;
  *((void *)v7 + 1) = a2;
  char v8 = &v6[OBJC_IVAR____TtC21SiriInformationSearch12PommesResult_domain];
  *(void *)char v8 = a3;
  *((void *)v8 + 1) = a4;
  char v9 = &v6[OBJC_IVAR____TtC21SiriInformationSearch12PommesResult_metadata];
  *(void *)char v9 = a5;
  *((void *)v9 + 1) = a6;
  v11.receiver = v6;
  v11.super_class = (Class)type metadata accessor for PommesResult();
  return objc_msgSendSuper2(&v11, sel_init);
}

uint64_t type metadata accessor for PommesResult()
{
  return self;
}

id PommesResult.init(coder:)(void *a1)
{
  unint64_t v2 = v1;
  type metadata accessor for NSArray(0, (unint64_t *)&lazy cache variable for type metadata for NSString);
  unint64_t v4 = v2;
  uint64_t v5 = NSCoder.decodeObject<A>(of:forKey:)();
  if (!v5) {
    goto LABEL_6;
  }
  unint64_t v6 = (void *)v5;
  uint64_t v7 = NSCoder.decodeObject<A>(of:forKey:)();
  if (!v7)
  {

LABEL_6:
    type metadata accessor for PommesResult();
    swift_deallocPartialClassInstance();
    return 0;
  }
  char v8 = (void *)v7;
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = (uint64_t *)&v4[OBJC_IVAR____TtC21SiriInformationSearch12PommesResult_resultId];
  uint64_t *v10 = v9;
  v10[1] = v11;
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  os_log_type_t v13 = (uint64_t *)&v4[OBJC_IVAR____TtC21SiriInformationSearch12PommesResult_domain];
  *os_log_type_t v13 = v12;
  v13[1] = v14;
  type metadata accessor for NSArray(0, (unint64_t *)&lazy cache variable for type metadata for NSData);
  uint64_t v15 = NSCoder.decodeObject<A>(of:forKey:)();
  if (v15)
  {
    id v16 = (void *)v15;
    uint64_t v17 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v19 = v18;

    unint64_t v6 = v8;
    char v8 = v16;
  }
  else
  {
    uint64_t v17 = 0;
    unint64_t v19 = 0xF000000000000000;
  }

  uint64_t v21 = (uint64_t *)&v4[OBJC_IVAR____TtC21SiriInformationSearch12PommesResult_metadata];
  uint64_t *v21 = v17;
  v21[1] = v19;

  v23.receiver = v4;
  v23.super_class = (Class)type metadata accessor for PommesResult();
  id v20 = objc_msgSendSuper2(&v23, sel_init);

  return v20;
}

Swift::Void __swiftcall PommesResult.encode(with:)(NSCoder with)
{
  unint64_t v3 = (void *)MEMORY[0x261198B80](*(void *)(v1 + OBJC_IVAR____TtC21SiriInformationSearch12PommesResult_resultId), *(void *)(v1 + OBJC_IVAR____TtC21SiriInformationSearch12PommesResult_resultId + 8));
  unint64_t v4 = (void *)MEMORY[0x261198B80](0x6449746C75736572, 0xE800000000000000);
  [(objc_class *)with.super.isa encodeObject:v3 forKey:v4];

  uint64_t v5 = (void *)MEMORY[0x261198B80](*(void *)(v1 + OBJC_IVAR____TtC21SiriInformationSearch12PommesResult_domain), *(void *)(v1 + OBJC_IVAR____TtC21SiriInformationSearch12PommesResult_domain + 8));
  unint64_t v6 = (void *)MEMORY[0x261198B80](0x6E69616D6F64, 0xE600000000000000);
  [(objc_class *)with.super.isa encodeObject:v5 forKey:v6];

  uint64_t v7 = (uint64_t *)(v1 + OBJC_IVAR____TtC21SiriInformationSearch12PommesResult_metadata);
  unint64_t v8 = *(void *)(v1 + OBJC_IVAR____TtC21SiriInformationSearch12PommesResult_metadata + 8);
  if (v8 >> 60 != 15)
  {
    uint64_t v9 = *v7;
    outlined copy of Data._Representation(*v7, v8);
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    uint64_t v11 = (void *)MEMORY[0x261198B80](0x617461646174656DLL, 0xE800000000000000);
    [(objc_class *)with.super.isa encodeObject:isa forKey:v11];

    outlined consume of Data._Representation?(v9, v8);
  }
}

uint64_t PommesResult.resultId.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch12PommesResult_resultId);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PommesResult.domain.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch12PommesResult_domain);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PommesResult.metadata.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch12PommesResult_metadata);
  outlined copy of Data?(v1, *(void *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch12PommesResult_metadata + 8));
  return v1;
}

id PommesResult.__allocating_init(resultId:domain:metadata:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  os_log_type_t v13 = (char *)objc_allocWithZone(v6);
  uint64_t v14 = &v13[OBJC_IVAR____TtC21SiriInformationSearch12PommesResult_resultId];
  *(void *)uint64_t v14 = a1;
  *((void *)v14 + 1) = a2;
  uint64_t v15 = &v13[OBJC_IVAR____TtC21SiriInformationSearch12PommesResult_domain];
  *(void *)uint64_t v15 = a3;
  *((void *)v15 + 1) = a4;
  id v16 = &v13[OBJC_IVAR____TtC21SiriInformationSearch12PommesResult_metadata];
  *(void *)id v16 = a5;
  *((void *)v16 + 1) = a6;
  v18.receiver = v13;
  v18.super_class = v6;
  return objc_msgSendSuper2(&v18, sel_init);
}

uint64_t outlined copy of Data?(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return outlined copy of Data._Representation(a1, a2);
  }
  return a1;
}

id PommesResult.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return PommesResult.init(coder:)(a1);
}

id PommesResult.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void PommesResult.init()()
{
}

id PommesResult.__deallocating_deinit()
{
  return PommesResult.__deallocating_deinit(type metadata accessor for PommesResult);
}

uint64_t PommesCandidateId.hash(into:)()
{
  if (*(unsigned char *)(v0 + 32))
  {
    if (*(unsigned char *)(v0 + 32) == 1)
    {
      Hasher._combine(_:)(1uLL);
      String.hash(into:)();
      goto LABEL_7;
    }
    Swift::UInt v1 = 2;
  }
  else
  {
    Swift::UInt v1 = 0;
  }
  Hasher._combine(_:)(v1);
LABEL_7:

  return String.hash(into:)();
}

uint64_t PommesCandidateId.CodingKeys.stringValue.getter(char a1)
{
  return qword_25C980538[a1];
}

uint64_t PommesCandidateId.MedocCodingKeys.stringValue.getter(char a1)
{
  if (a1) {
    return 0x6449756374;
  }
  else {
    return 0x6449707274;
  }
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance PommesCandidateId.CodingKeys(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance PommesCandidateId.CodingKeys()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance PommesCandidateId.CodingKeys()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance PommesCandidateId.CodingKeys()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance PommesCandidateId.CodingKeys()
{
  return PommesCandidateId.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance PommesCandidateId.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized PommesCandidateId.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance PommesCandidateId.CodingKeys()
{
  return 0;
}

void protocol witness for CodingKey.init(intValue:) in conformance PommesCandidateId.CodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance PommesCandidateId.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type PommesCandidateId.CodingKeys and conformance PommesCandidateId.CodingKeys();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance PommesCandidateId.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type PommesCandidateId.CodingKeys and conformance PommesCandidateId.CodingKeys();

  return MEMORY[0x270FA00B8](a1, v2);
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance PommesCandidateId.MedocCodingKeys(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance PommesCandidateId.MedocCodingKeys()
{
  return PommesCandidateId.MedocCodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance PommesCandidateId.MedocCodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized PommesCandidateId.MedocCodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance PommesCandidateId.MedocCodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance PommesCandidateId.MedocCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type PommesCandidateId.MedocCodingKeys and conformance PommesCandidateId.MedocCodingKeys();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance PommesCandidateId.MedocCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type PommesCandidateId.MedocCodingKeys and conformance PommesCandidateId.MedocCodingKeys();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance PommesCandidateId.RcCodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized PommesCandidateId.RcCodingKeys.init(stringValue:)(a1, a2);
  *a3 = result & 1;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance PommesCandidateId.RcCodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance PommesCandidateId.RcCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type PommesCandidateId.RcCodingKeys and conformance PommesCandidateId.RcCodingKeys();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance PommesCandidateId.RcCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type PommesCandidateId.RcCodingKeys and conformance PommesCandidateId.RcCodingKeys();

  return MEMORY[0x270FA00B8](a1, v2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance PommesCandidateId.RcCodingKeys()
{
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance PommesCandidateId.RunPommesCodingKeys()
{
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance PommesCandidateId.RcCodingKeys()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance PommesCandidateId.RunPommesCodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized PommesCandidateId.RunPommesCodingKeys.init(stringValue:)(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance PommesCandidateId.RunPommesCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type PommesCandidateId.RunPommesCodingKeys and conformance PommesCandidateId.RunPommesCodingKeys();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance PommesCandidateId.RunPommesCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type PommesCandidateId.RunPommesCodingKeys and conformance PommesCandidateId.RunPommesCodingKeys();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t PommesCandidateId.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<PommesCandidateId.RunPommesCodingKeys>);
  uint64_t v27 = *(void *)(v3 - 8);
  uint64_t v28 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v26 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<PommesCandidateId.MedocCodingKeys>);
  uint64_t v29 = *(void *)(v5 - 8);
  uint64_t v30 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<PommesCandidateId.RcCodingKeys>);
  uint64_t v25 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<PommesCandidateId.CodingKeys>);
  uint64_t v34 = *(void *)(v11 - 8);
  uint64_t v35 = v11;
  MEMORY[0x270FA5388](v11);
  os_log_type_t v13 = (char *)v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = v1[1];
  uint64_t v31 = *v1;
  uint64_t v32 = v14;
  uint64_t v15 = v1[2];
  v24[1] = v1[3];
  v24[2] = v15;
  int v16 = *((unsigned __int8 *)v1 + 32);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type PommesCandidateId.CodingKeys and conformance PommesCandidateId.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  if (!v16)
  {
    char v36 = 0;
    lazy protocol witness table accessor for type PommesCandidateId.RcCodingKeys and conformance PommesCandidateId.RcCodingKeys();
    uint64_t v21 = v35;
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    KeyedEncodingContainer.encode(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v10, v8);
    return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v13, v21);
  }
  if (v16 != 1)
  {
    char v40 = 2;
    lazy protocol witness table accessor for type PommesCandidateId.RunPommesCodingKeys and conformance PommesCandidateId.RunPommesCodingKeys();
    id v22 = v26;
    uint64_t v21 = v35;
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    uint64_t v23 = v28;
    KeyedEncodingContainer.encode(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v22, v23);
    return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v13, v21);
  }
  char v39 = 1;
  lazy protocol witness table accessor for type PommesCandidateId.MedocCodingKeys and conformance PommesCandidateId.MedocCodingKeys();
  uint64_t v17 = v35;
  KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
  char v38 = 0;
  uint64_t v18 = v30;
  uint64_t v19 = v33;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v19)
  {
    char v37 = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  (*(void (**)(char *, uint64_t))(v29 + 8))(v7, v18);
  return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v13, v17);
}

Swift::Int PommesCandidateId.hashValue.getter()
{
  int v1 = *(unsigned __int8 *)(v0 + 32);
  Hasher.init(_seed:)();
  if (!v1)
  {
    Swift::UInt v2 = 0;
LABEL_6:
    Hasher._combine(_:)(v2);
    goto LABEL_7;
  }
  if (v1 != 1)
  {
    Swift::UInt v2 = 2;
    goto LABEL_6;
  }
  Hasher._combine(_:)(1uLL);
  String.hash(into:)();
LABEL_7:
  String.hash(into:)();
  return Hasher._finalize()();
}

uint64_t PommesCandidateId.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v48 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<PommesCandidateId.RunPommesCodingKeys>);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v51 = v3;
  uint64_t v52 = v4;
  MEMORY[0x270FA5388](v3);
  uint64_t v54 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<PommesCandidateId.MedocCodingKeys>);
  uint64_t v53 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388](v49);
  uint64_t v7 = (char *)&v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<PommesCandidateId.RcCodingKeys>);
  uint64_t v50 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<PommesCandidateId.CodingKeys>);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v47 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = a1[3];
  int v55 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v15);
  lazy protocol witness table accessor for type PommesCandidateId.CodingKeys and conformance PommesCandidateId.CodingKeys();
  uint64_t v16 = v56;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v16)
  {
    uint64_t v17 = v54;
    uint64_t v47 = v12;
    uint64_t v18 = v14;
    uint64_t v19 = KeyedDecodingContainer.allKeys.getter();
    id v20 = (char *)v19;
    if (*(void *)(v19 + 16) == 1)
    {
      int v21 = *(unsigned __int8 *)(v19 + 32);
      LODWORD(v56) = v21;
      if (v21)
      {
        if (v21 == 1)
        {
          char v60 = 1;
          lazy protocol witness table accessor for type PommesCandidateId.MedocCodingKeys and conformance PommesCandidateId.MedocCodingKeys();
          KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
          char v59 = 0;
          uint64_t v22 = v49;
          uint64_t v52 = KeyedDecodingContainer.decode(_:forKey:)();
          uint64_t v35 = v34;
          uint64_t v54 = v20;
          char v58 = 1;
          uint64_t v36 = KeyedDecodingContainer.decode(_:forKey:)();
          uint64_t v37 = v22;
          char v38 = (void (**)(char *, uint64_t))(v47 + 8);
          uint64_t v42 = v36;
          uint64_t v44 = v43;
          (*(void (**)(char *, uint64_t))(v53 + 8))(v7, v37);
          swift_bridgeObjectRelease();
          (*v38)(v18, v11);
          uint64_t v45 = v35;
        }
        else
        {
          uint64_t v28 = v47;
          char v61 = 2;
          lazy protocol witness table accessor for type PommesCandidateId.RunPommesCodingKeys and conformance PommesCandidateId.RunPommesCodingKeys();
          uint64_t v29 = v17;
          uint64_t v30 = v18;
          KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
          uint64_t v31 = v51;
          uint64_t v32 = KeyedDecodingContainer.decode(_:forKey:)();
          uint64_t v33 = (void (**)(char *, uint64_t))(v52 + 8);
          uint64_t v45 = v41;
          uint64_t v52 = v32;
          (*v33)(v29, v31);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v28 + 8))(v30, v11);
          uint64_t v42 = 0;
          uint64_t v44 = 0;
        }
      }
      else
      {
        char v57 = 0;
        lazy protocol witness table accessor for type PommesCandidateId.RcCodingKeys and conformance PommesCandidateId.RcCodingKeys();
        KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
        uint64_t v27 = KeyedDecodingContainer.decode(_:forKey:)();
        uint64_t v40 = v39;
        uint64_t v52 = v27;
        (*(void (**)(char *, uint64_t))(v50 + 8))(v10, v8);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v47 + 8))(v18, v11);
        uint64_t v42 = 0;
        uint64_t v44 = 0;
        uint64_t v45 = v40;
      }
      uint64_t v46 = v48;
      *uint64_t v48 = v52;
      v46[1] = v45;
      v46[2] = v42;
      v46[3] = v44;
      *((unsigned char *)v46 + 32) = v56;
    }
    else
    {
      uint64_t v23 = type metadata accessor for DecodingError();
      swift_allocError();
      uint64_t v25 = v24;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (@thick Any.Type, DecodingError.Context));
      *uint64_t v25 = &type metadata for PommesCandidateId;
      KeyedDecodingContainer.codingPath.getter();
      DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v23 - 8) + 104))(v25, *MEMORY[0x263F8DCB0], v23);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v47 + 8))(v18, v11);
    }
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v55);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance PommesCandidateId()
{
  int v1 = *(unsigned __int8 *)(v0 + 32);
  Hasher.init(_seed:)();
  if (!v1)
  {
    Swift::UInt v2 = 0;
LABEL_6:
    Hasher._combine(_:)(v2);
    goto LABEL_7;
  }
  if (v1 != 1)
  {
    Swift::UInt v2 = 2;
    goto LABEL_6;
  }
  Hasher._combine(_:)(1uLL);
  String.hash(into:)();
LABEL_7:
  String.hash(into:)();
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance PommesCandidateId()
{
  if (*(unsigned char *)(v0 + 32))
  {
    if (*(unsigned char *)(v0 + 32) == 1)
    {
      Hasher._combine(_:)(1uLL);
      String.hash(into:)();
      goto LABEL_7;
    }
    Swift::UInt v1 = 2;
  }
  else
  {
    Swift::UInt v1 = 0;
  }
  Hasher._combine(_:)(v1);
LABEL_7:

  return String.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance PommesCandidateId()
{
  int v1 = *(unsigned __int8 *)(v0 + 32);
  Hasher.init(_seed:)();
  if (!v1)
  {
    Swift::UInt v2 = 0;
LABEL_6:
    Hasher._combine(_:)(v2);
    goto LABEL_7;
  }
  if (v1 != 1)
  {
    Swift::UInt v2 = 2;
    goto LABEL_6;
  }
  Hasher._combine(_:)(1uLL);
  String.hash(into:)();
LABEL_7:
  String.hash(into:)();
  return Hasher._finalize()();
}

uint64_t protocol witness for Decodable.init(from:) in conformance PommesCandidateId@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return PommesCandidateId.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance PommesCandidateId(void *a1)
{
  return PommesCandidateId.encode(to:)(a1);
}

uint64_t static PommesResponse.supportsSecureCoding.getter()
{
  return static PommesResponse.supportsSecureCoding;
}

uint64_t static PommesResponse.supportsSecureCoding.setter(char a1)
{
  uint64_t result = swift_beginAccess();
  static PommesResponse.supportsSecureCoding = a1;
  return result;
}

uint64_t (*static PommesResponse.supportsSecureCoding.modify())()
{
  return AudioExperience.isGlideEligible.modify;
}

uint64_t PommesResponse.__allocating_init(pegasusResponse:)(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  memset(v9, 0, sizeof(v9));
  char v10 = -1;
  PommesResponse.__allocating_init(pegasusResponse:experiences:requestId:pommesCandidateId:clientResults:isPersonalDomainFallback:)((uint64_t)v5, MEMORY[0x263F8EE78], 0, 0, v9, MEMORY[0x263F8EE78], 0);
  uint64_t v7 = v6;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  return v7;
}

void PommesResponse.__allocating_init(pegasusResponse:experiences:requestId:pommesCandidateId:clientResults:isPersonalDomainFallback:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, long long *a5, uint64_t a6, int a7)
{
  uint64_t v8 = v7;
  int v107 = a7;
  uint64_t v112 = type metadata accessor for Apple_Parsec_Siri_V2alpha_PegasusClientEventLog();
  uint64_t v118 = *(void *)(v112 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v112);
  unint64_t v111 = (char *)&v91 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  id v115 = (char *)&v91 - v17;
  uint64_t v114 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.ResponseMetadata();
  uint64_t v117 = *(void *)(v114 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v114);
  unint64_t v103 = (char *)&v91 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  v102 = (char *)&v91 - v21;
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  unint64_t v110 = (char *)&v91 - v23;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  uint64_t v26 = (char *)&v91 - v25;
  MEMORY[0x270FA5388](v24);
  uint64_t v28 = (char *)&v91 - v27;
  long long v106 = *a5;
  long long v105 = a5[1];
  int v104 = *((unsigned __int8 *)a5 + 32);
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v90 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    uint64_t v29 = v90;
  }
  else
  {
    uint64_t v29 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v30 = (void *)MEMORY[0x263F8EED0];
  uint64_t v108 = a3;
  uint64_t v109 = v29;
  if (v29)
  {
    if ((a2 & 0xC000000000000001) != 0)
    {
      uint64_t v31 = (void *)MEMORY[0x261198DD0](0, a2);
    }
    else
    {
      if (!*(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
LABEL_45:
        swift_bridgeObjectRetain();
        char v61 = (void *)MEMORY[0x261198DD0](0, a2);
        swift_bridgeObjectRelease();
        char v59 = (void *)MEMORY[0x263F8EED0];
        uint64_t v60 = v116;
        goto LABEL_22;
      }
      uint64_t v31 = *(id *)(a2 + 32);
    }
    uint64_t v32 = v31;
    uint64_t v97 = (*(uint64_t (**)(void))((*v30 & *v31) + 0x88))();
    unint64_t v34 = v33;

    if ((a2 & 0xC000000000000001) != 0)
    {
      swift_bridgeObjectRetain();
      uint64_t v35 = (void *)MEMORY[0x261198DD0](0, a2);
      uint64_t v36 = (void *)swift_bridgeObjectRelease();
    }
    else
    {
      if (!*(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
LABEL_47:
        __break(1u);
        return;
      }
      uint64_t v36 = *(id *)(a2 + 32);
      uint64_t v35 = v36;
    }
    double v37 = (*(double (**)(void *))((*MEMORY[0x263F8EED0] & *v35) + 0xA0))(v36);
  }
  else
  {
    unint64_t v34 = 0xE700000000000000;
    uint64_t v97 = 0x6E776F6E6B6E55;
    double v37 = 0.0;
  }
  if (one-time initialization token for pommes != -1) {
    swift_once();
  }
  uint64_t v38 = type metadata accessor for Logger();
  __swift_project_value_buffer(v38, (uint64_t)static Logger.pommes);
  swift_bridgeObjectRetain();
  uint64_t v39 = Logger.logObject.getter();
  os_log_type_t v40 = static os_log_type_t.debug.getter();
  BOOL v41 = os_log_type_enabled(v39, v40);
  uint64_t v100 = v8;
  uint64_t v99 = a6;
  unint64_t v113 = a2;
  uint64_t v98 = a4;
  uint64_t v101 = (uint64_t)v26;
  if (v41)
  {
    uint64_t v42 = swift_slowAlloc();
    uint64_t v43 = swift_slowAlloc();
    *(void *)&v120[0] = v43;
    *(_DWORD *)uint64_t v42 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v119 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v97, v34, (uint64_t *)v120);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v42 + 12) = 2048;
    uint64_t v119 = *(void *)&v37;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&dword_25C8FE000, v39, v40, "PommesResponse primaryPluginIdentifier %s     PommesResponse primaryQueryConfidence %f", (uint8_t *)v42, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x261199590](v43, -1, -1);
    uint64_t v44 = v42;
    a2 = v113;
    MEMORY[0x261199590](v44, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v97 = Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.conversationContextBytes.getter();
  uint64_t v96 = v45;
  Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.responseMetadata.getter();
  uint64_t v95 = Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.ResponseMetadata.domainName.getter();
  uint64_t v94 = v46;
  uint64_t v47 = a1;
  a6 = v117 + 8;
  uint64_t v48 = *(void (**)(char *, uint64_t))(v117 + 8);
  uint64_t v8 = v114;
  v48(v28, v114);
  uint64_t v93 = specialized Sequence.flatMap<A>(_:)(a2);
  uint64_t v49 = v101;
  Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.responseMetadata.getter();
  uint64_t v50 = v115;
  Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.ResponseMetadata.pegasusClientEventLog.getter();
  v48((char *)v49, v8);
  uint64_t v101 = Apple_Parsec_Siri_V2alpha_PegasusClientEventLog.pegasusDomainFlowStepLog.getter();
  uint64_t v92 = v51;
  uint64_t v52 = *(void (**)(char *, uint64_t))(v118 + 8);
  uint64_t v53 = v50;
  uint64_t v54 = v112;
  v52(v53, v112);
  int v55 = v110;
  uint64_t v116 = v47;
  Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.responseMetadata.getter();
  uint64_t v56 = v111;
  Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.ResponseMetadata.pegasusClientEventLog.getter();
  id v115 = (char *)v48;
  v48(v55, v8);
  uint64_t v57 = Apple_Parsec_Siri_V2alpha_PegasusClientEventLog.pegasusDomainUserSensitiveTier1Log.getter();
  a4 = v58;
  v52(v56, v54);
  unint64_t v110 = (char *)v57;
  if (!v109)
  {
    LODWORD(v111) = 0;
    uint64_t v60 = v116;
    goto LABEL_24;
  }
  if ((a2 & 0xC000000000000001) != 0) {
    goto LABEL_45;
  }
  char v59 = (void *)MEMORY[0x263F8EED0];
  uint64_t v60 = v116;
  if (!*(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_47;
  }
  char v61 = *(id *)(a2 + 32);
LABEL_22:
  LODWORD(v111) = (*(uint64_t (**)(void))((*v59 & *v61) + 0xF0))();

LABEL_24:
  uint64_t v112 = a4;
  int v62 = v102;
  Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.responseMetadata.getter();
  uint64_t v63 = Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.ResponseMetadata.pegasusClientEventLogs.getter();
  ((void (*)(char *, uint64_t))v115)(v62, v8);
  int64_t v64 = *(void *)(v63 + 16);
  uint64_t v65 = MEMORY[0x263F8EE78];
  if (v64)
  {
    uint64_t v117 = a6;
    *(void *)&v120[0] = MEMORY[0x263F8EE78];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v64, 0);
    uint64_t v66 = *(void *)&v120[0];
    unint64_t v67 = v63 + ((*(unsigned __int8 *)(v118 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v118 + 80));
    uint64_t v68 = *(void *)(v118 + 72);
    do
    {
      uint64_t v69 = Apple_Parsec_Siri_V2alpha_PegasusClientEventLog.pegasusDomainFlowStepLog.getter();
      uint64_t v71 = v70;
      *(void *)&v120[0] = v66;
      unint64_t v73 = *(void *)(v66 + 16);
      unint64_t v72 = *(void *)(v66 + 24);
      if (v73 >= v72 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v72 > 1, v73 + 1, 1);
        uint64_t v66 = *(void *)&v120[0];
      }
      *(void *)(v66 + 16) = v73 + 1;
      uint64_t v74 = v66 + 16 * v73;
      *(void *)(v74 + 32) = v69;
      *(void *)(v74 + 40) = v71;
      v67 += v68;
      --v64;
    }
    while (v64);
    swift_bridgeObjectRelease();
    uint64_t v60 = v116;
    uint64_t v8 = v114;
    uint64_t v65 = MEMORY[0x263F8EE78];
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v66 = MEMORY[0x263F8EE78];
  }
  uint64_t v75 = v103;
  Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.responseMetadata.getter();
  uint64_t v76 = Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.ResponseMetadata.pegasusClientEventLogs.getter();
  ((void (*)(char *, uint64_t))v115)(v75, v8);
  int64_t v77 = *(void *)(v76 + 16);
  if (v77)
  {
    *(void *)&v120[0] = v65;
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v77, 0);
    uint64_t v78 = *(void *)&v120[0];
    uint64_t v79 = *(unsigned __int8 *)(v118 + 80);
    uint64_t v117 = v76;
    uint64_t v80 = v76 + ((v79 + 32) & ~v79);
    uint64_t v81 = *(void *)(v118 + 72);
    do
    {
      uint64_t v82 = Apple_Parsec_Siri_V2alpha_PegasusClientEventLog.pegasusDomainUserSensitiveTier1Log.getter();
      uint64_t v84 = v83;
      *(void *)&v120[0] = v78;
      unint64_t v86 = *(void *)(v78 + 16);
      unint64_t v85 = *(void *)(v78 + 24);
      if (v86 >= v85 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v85 > 1, v86 + 1, 1);
        uint64_t v78 = *(void *)&v120[0];
      }
      *(void *)(v78 + 16) = v86 + 1;
      uint64_t v87 = v78 + 16 * v86;
      *(void *)(v87 + 32) = v82;
      *(void *)(v87 + 40) = v84;
      v80 += v81;
      --v77;
    }
    while (v77);
    swift_bridgeObjectRelease();
    uint64_t v60 = v116;
    uint64_t v65 = MEMORY[0x263F8EE78];
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v78 = MEMORY[0x263F8EE78];
  }
  v120[0] = v106;
  v120[1] = v105;
  char v121 = v104;
  if (v107) {
    char v88 = 3;
  }
  else {
    char v88 = 0;
  }
  LOBYTE(v119) = v88;
  (*(void (**)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char *, uint64_t, _BYTE, uint64_t, uint64_t, _OWORD *, _BYTE, void, void, uint64_t, uint64_t, uint64_t, uint64_t *))(v100 + 304))(v113, v99, v97, v96, v95, v94, v93, v101, v92, v110, v112, v111 & 1, v108, v98, v120, 0, 0, 0, v66,
    v78,
    v65,
    &v119);
  uint64_t v89 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v89 - 8) + 8))(v60, v89);
}

uint64_t PommesResponse.__allocating_init(pegasusResponse:clientResults:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  memset(v11, 0, sizeof(v11));
  char v12 = -1;
  PommesResponse.__allocating_init(pegasusResponse:experiences:requestId:pommesCandidateId:clientResults:isPersonalDomainFallback:)((uint64_t)v7, MEMORY[0x263F8EE78], 0, 0, v11, a2, 0);
  uint64_t v9 = v8;
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  return v9;
}

uint64_t PommesResponse.__allocating_init(pegasusResponse:experiences:clientResults:)(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  memset(v13, 0, sizeof(v13));
  char v14 = -1;
  PommesResponse.__allocating_init(pegasusResponse:experiences:requestId:pommesCandidateId:clientResults:isPersonalDomainFallback:)((uint64_t)v9, a2, 0, 0, v13, a3, 0);
  uint64_t v11 = v10;
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
  return v11;
}

uint64_t PommesResponse.__allocating_init(pegasusResponse:requestId:resultCandidateId:clientResults:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    char v16 = 0;
  }
  else
  {
    a4 = 0;
    char v16 = -1;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, a1, v12);
  *(void *)&long long v21 = a4;
  *((void *)&v21 + 1) = a5;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  char v24 = v16;
  PommesResponse.__allocating_init(pegasusResponse:experiences:requestId:pommesCandidateId:clientResults:isPersonalDomainFallback:)((uint64_t)v15, MEMORY[0x263F8EE78], a2, a3, &v21, a6, 0);
  uint64_t v18 = v17;
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(a1, v12);
  return v18;
}

uint64_t PommesResponse.__allocating_init(pegasusResponse:experiences:requestId:resultCandidateId:clientResults:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v22 = a7;
  uint64_t v13 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  char v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a6)
  {
    char v17 = 0;
  }
  else
  {
    a5 = 0;
    char v17 = -1;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, a1, v13);
  *(void *)&long long v23 = a5;
  *((void *)&v23 + 1) = a6;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  char v26 = v17;
  PommesResponse.__allocating_init(pegasusResponse:experiences:requestId:pommesCandidateId:clientResults:isPersonalDomainFallback:)((uint64_t)v16, a2, a3, a4, &v23, v22, 0);
  uint64_t v19 = v18;
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(a1, v13);
  return v19;
}

uint64_t PommesResponse.__allocating_init(experiences:clientResults:conversationContext:metadataDomainName:renderedTexts:pegasusDomainFlowStepLog:pegasusDomainUserSensitiveTier1Log:listenAfterSpeaking:requestId:resultCandidateId:isHandledByPreflight:preflightClientHandlerIdentifier:taskStepLogs:)(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (a16)
  {
    char v23 = 0;
  }
  else
  {
    a15 = 0;
    char v23 = -1;
  }
  uint64_t v24 = specialized Sequence.flatMap<A>(_:)(a1);
  v33[0] = a15;
  v33[1] = a16;
  v33[2] = 0;
  v33[3] = 0;
  char v34 = v23;
  char v32 = 0;
  return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char, uint64_t, uint64_t, void *, _BYTE, void, void, uint64_t, void, void, char *))(v20 + 304))(a1, a2, a3, a4, a5, a6, v24, a8, a9, a10, a11, a12, a13, a14, v33, 0, 0, 0, a20,
           MEMORY[0x263F8EE78],
           MEMORY[0x263F8EE78],
           &v32);
}

uint64_t specialized Sequence.flatMap<A>(_:)(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_35;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
LABEL_3:
  uint64_t v3 = (void *)MEMORY[0x263F8EE78];
  if (v2)
  {
    uint64_t v4 = 4;
    do
    {
      if ((a1 & 0xC000000000000001) != 0) {
        uint64_t v5 = (void *)MEMORY[0x261198DD0](v4 - 4, a1);
      }
      else {
        uint64_t v5 = *(id *)(a1 + 8 * v4);
      }
      uint64_t v6 = v5;
      uint64_t v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1))
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
LABEL_33:
        __break(1u);
LABEL_34:
        __break(1u);
LABEL_35:
        swift_bridgeObjectRetain();
        uint64_t v2 = _CocoaArrayWrapper.endIndex.getter();
        goto LABEL_3;
      }
      uint64_t v8 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v5) + 0xE0))();

      uint64_t v9 = *(void *)(v8 + 16);
      int64_t v10 = v3[2];
      int64_t v11 = v10 + v9;
      if (__OFADD__(v10, v9)) {
        goto LABEL_31;
      }
      char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
      if (isUniquelyReferenced_nonNull_native && v11 <= v3[3] >> 1)
      {
        if (*(void *)(v8 + 16)) {
          goto LABEL_20;
        }
      }
      else
      {
        if (v10 <= v11) {
          int64_t v13 = v10 + v9;
        }
        else {
          int64_t v13 = v10;
        }
        uint64_t v3 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(isUniquelyReferenced_nonNull_native, v13, 1, v3);
        if (*(void *)(v8 + 16))
        {
LABEL_20:
          uint64_t v14 = v3[2];
          if ((v3[3] >> 1) - v14 < v9) {
            goto LABEL_33;
          }
          unint64_t v15 = (unint64_t)&v3[2 * v14 + 4];
          if (v8 + 32 < v15 + 16 * v9 && v15 < v8 + 32 + 16 * v9)
          {
            uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
            __break(1u);
            return result;
          }
          swift_arrayInitWithCopy();
          if (v9)
          {
            uint64_t v17 = v3[2];
            BOOL v18 = __OFADD__(v17, v9);
            uint64_t v19 = v17 + v9;
            if (v18) {
              goto LABEL_34;
            }
            v3[2] = v19;
          }
          goto LABEL_6;
        }
      }
      if (v9) {
        goto LABEL_32;
      }
LABEL_6:
      swift_bridgeObjectRelease();
      ++v4;
    }
    while (v7 != v2);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v3;
}

uint64_t PommesResponse.__allocating_init(pegasusResponse:experiences:requestId:resultCandidateId:clientResults:isPersonalDomainFallback:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  int v23 = a8;
  uint64_t v22 = a7;
  uint64_t v14 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a6)
  {
    char v18 = 0;
  }
  else
  {
    a5 = 0;
    char v18 = -1;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, a1, v14);
  *(void *)&long long v24 = a5;
  *((void *)&v24 + 1) = a6;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  char v27 = v18;
  PommesResponse.__allocating_init(pegasusResponse:experiences:requestId:pommesCandidateId:clientResults:isPersonalDomainFallback:)((uint64_t)v17, a2, a3, a4, &v24, v22, v23);
  uint64_t v20 = v19;
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a1, v14);
  return v20;
}

uint64_t PommesResponse.__allocating_init(experiences:clientResults:conversationContext:metadataDomainName:renderedTexts:pegasusDomainFlowStepLog:pegasusDomainUserSensitiveTier1Log:listenAfterSpeaking:requestId:resultCandidateId:isHandledByPreflight:preflightClientHandlerIdentifier:isPersonalDomainFallback:taskStepLogs:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char, uint64_t, uint64_t))(v14 + 304))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14);
}

uint64_t PommesResponse.__allocating_init(experiences:clientResults:conversationContext:metadataDomainName:renderedTexts:pegasusDomainFlowStepLog:pegasusDomainUserSensitiveTier1Log:listenAfterSpeaking:requestId:pommesCandidateId:isHandledByPreflight:preflightClientHandlerIdentifier:isPersonalDomainFallback:taskStepLogs:userSensitiveTier1Logs:componentsWarmedUp:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char, uint64_t, uint64_t))(v14 + 304))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14);
}

void PommesResponse.__allocating_init(pegasusResponse:experiences:requestId:pommesCandidateId:clientResults:isPersonalDomainFallback:componentsWarmedUp:)(char *a1, unint64_t a2, uint64_t a3, unint64_t a4, long long *a5, uint64_t a6, int a7, uint64_t a8)
{
  uint64_t v9 = v8;
  uint64_t v108 = a8;
  int v107 = a7;
  uint64_t v116 = type metadata accessor for Apple_Parsec_Siri_V2alpha_PegasusClientEventLog();
  uint64_t v16 = *(char **)(v116 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v116);
  id v115 = (char *)&v94 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v114 = (char *)&v94 - v19;
  uint64_t v118 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.ResponseMetadata();
  uint64_t v120 = *(void *)(v118 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v118);
  long long v106 = (char *)&v94 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  long long v24 = (char *)&v94 - v23;
  uint64_t v25 = MEMORY[0x270FA5388](v22);
  unint64_t v113 = (char *)&v94 - v26;
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  unint64_t v111 = (char *)&v94 - v28;
  MEMORY[0x270FA5388](v27);
  unint64_t v110 = (char *)&v94 - v29;
  long long v105 = *a5;
  long long v104 = a5[1];
  int v30 = *((unsigned __int8 *)a5 + 32);
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v93 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    uint64_t v31 = v93;
  }
  else
  {
    uint64_t v31 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v109 = a3;
  int v103 = v30;
  uint64_t v112 = (char *)v31;
  if (v31)
  {
    unint64_t v32 = a2 & 0xC000000000000001;
    if ((a2 & 0xC000000000000001) != 0)
    {
      unint64_t v33 = (void *)MEMORY[0x261198DD0](0, a2);
    }
    else
    {
      if (!*(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
LABEL_45:
        swift_bridgeObjectRetain();
        int64_t v64 = (void *)MEMORY[0x261198DD0](0, a4);
        swift_bridgeObjectRelease();
        uint64_t v63 = a1;
        goto LABEL_22;
      }
      unint64_t v33 = *(id *)(a2 + 32);
    }
    char v34 = v33;
    uint64_t v98 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v33) + 0x88))();
    unint64_t v36 = v35;

    if (v32)
    {
      swift_bridgeObjectRetain();
      double v37 = (void *)MEMORY[0x261198DD0](0, a2);
      uint64_t v38 = (void *)swift_bridgeObjectRelease();
    }
    else
    {
      if (!*(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
LABEL_47:
        __break(1u);
        return;
      }
      uint64_t v38 = *(id *)(a2 + 32);
      double v37 = v38;
    }
    double v39 = (*(double (**)(void *))((*MEMORY[0x263F8EED0] & *v37) + 0xA0))(v38);
  }
  else
  {
    unint64_t v36 = 0xE700000000000000;
    uint64_t v98 = 0x6E776F6E6B6E55;
    double v39 = 0.0;
  }
  unint64_t v99 = a4;
  if (one-time initialization token for pommes != -1) {
    swift_once();
  }
  v102 = v24;
  uint64_t v40 = type metadata accessor for Logger();
  __swift_project_value_buffer(v40, (uint64_t)static Logger.pommes);
  swift_bridgeObjectRetain();
  BOOL v41 = Logger.logObject.getter();
  os_log_type_t v42 = static os_log_type_t.debug.getter();
  BOOL v43 = os_log_type_enabled(v41, v42);
  uint64_t v101 = v9;
  uint64_t v100 = a6;
  if (v43)
  {
    uint64_t v44 = swift_slowAlloc();
    uint64_t v45 = swift_slowAlloc();
    *(void *)&v122[0] = v45;
    *(_DWORD *)uint64_t v44 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v121 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v98, v36, (uint64_t *)v122);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v44 + 12) = 2048;
    uint64_t v121 = *(void *)&v39;
    unint64_t v46 = a2;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&dword_25C8FE000, v41, v42, "PommesResponse primaryPluginIdentifier %s     PommesResponse primaryQueryConfidence %f", (uint8_t *)v44, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x261199590](v45, -1, -1);
    MEMORY[0x261199590](v44, -1, -1);

    uint64_t v47 = v110;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    uint64_t v47 = v110;
    unint64_t v46 = a2;
  }
  unint64_t v110 = (char *)Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.conversationContextBytes.getter();
  uint64_t v98 = v48;
  Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.responseMetadata.getter();
  uint64_t v97 = Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.ResponseMetadata.domainName.getter();
  uint64_t v96 = v49;
  a6 = v120 + 8;
  uint64_t v50 = *(void (**)(char *, uint64_t))(v120 + 8);
  uint64_t v9 = v118;
  v50(v47, v118);
  unint64_t v117 = v46;
  uint64_t v95 = specialized Sequence.flatMap<A>(_:)(v46);
  uint64_t v51 = v111;
  Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.responseMetadata.getter();
  uint64_t v52 = v114;
  Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.ResponseMetadata.pegasusClientEventLog.getter();
  v50(v51, v9);
  unint64_t v111 = (char *)Apple_Parsec_Siri_V2alpha_PegasusClientEventLog.pegasusDomainFlowStepLog.getter();
  uint64_t v94 = v53;
  uint64_t v54 = a1;
  a1 = v16;
  int v55 = (void (*)(char *, uint64_t))*((void *)v16 + 1);
  uint64_t v56 = v52;
  uint64_t v57 = v116;
  v55(v56, v116);
  uint64_t v58 = v113;
  uint64_t v119 = v54;
  Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.responseMetadata.getter();
  char v59 = v115;
  Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.ResponseMetadata.pegasusClientEventLog.getter();
  uint64_t v60 = v58;
  uint64_t v16 = (char *)v50;
  v50(v60, v9);
  uint64_t v61 = Apple_Parsec_Siri_V2alpha_PegasusClientEventLog.pegasusDomainUserSensitiveTier1Log.getter();
  unint64_t v113 = v62;
  v55(v59, v57);
  uint64_t v114 = (char *)v61;
  if (!v112)
  {
    LODWORD(v116) = 0;
    unint64_t v32 = (unint64_t)v102;
    char v65 = v103;
    uint64_t v63 = a1;
    goto LABEL_24;
  }
  a4 = v117;
  unint64_t v32 = (unint64_t)v102;
  if ((v117 & 0xC000000000000001) != 0) {
    goto LABEL_45;
  }
  if (!*(void *)((v117 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_47;
  }
  uint64_t v63 = a1;
  int64_t v64 = *(id *)(v117 + 32);
LABEL_22:
  LODWORD(v116) = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v64) + 0xF0))();

  char v65 = v103;
LABEL_24:
  uint64_t v66 = v119;
  v122[0] = v105;
  v122[1] = v104;
  char v123 = v65;
  Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.responseMetadata.getter();
  uint64_t v67 = Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.ResponseMetadata.pegasusClientEventLogs.getter();
  ((void (*)(unint64_t, uint64_t))v16)(v32, v9);
  int64_t v68 = *(void *)(v67 + 16);
  uint64_t v69 = MEMORY[0x263F8EE78];
  if (v68)
  {
    uint64_t v112 = v16;
    uint64_t v120 = a6;
    uint64_t v121 = MEMORY[0x263F8EE78];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v68, 0);
    uint64_t v70 = v121;
    unint64_t v71 = v67 + ((v63[80] + 32) & ~(unint64_t)v63[80]);
    id v115 = v63;
    uint64_t v72 = *((void *)v63 + 9);
    do
    {
      uint64_t v73 = Apple_Parsec_Siri_V2alpha_PegasusClientEventLog.pegasusDomainFlowStepLog.getter();
      uint64_t v75 = v74;
      uint64_t v121 = v70;
      unint64_t v77 = *(void *)(v70 + 16);
      unint64_t v76 = *(void *)(v70 + 24);
      if (v77 >= v76 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v76 > 1, v77 + 1, 1);
        uint64_t v70 = v121;
      }
      *(void *)(v70 + 16) = v77 + 1;
      unint64_t v78 = v70 + 16 * v77;
      *(void *)(v78 + 32) = v73;
      *(void *)(v78 + 40) = v75;
      v71 += v72;
      --v68;
    }
    while (v68);
    swift_bridgeObjectRelease();
    uint64_t v9 = v118;
    uint64_t v66 = v119;
    uint64_t v63 = v115;
    uint64_t v16 = v112;
    uint64_t v69 = MEMORY[0x263F8EE78];
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v70 = MEMORY[0x263F8EE78];
  }
  uint64_t v79 = v106;
  Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.responseMetadata.getter();
  uint64_t v80 = Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.ResponseMetadata.pegasusClientEventLogs.getter();
  ((void (*)(char *, uint64_t))v16)(v79, v9);
  int64_t v81 = *(void *)(v80 + 16);
  if (v81)
  {
    uint64_t v121 = v69;
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v81, 0);
    uint64_t v69 = v121;
    uint64_t v82 = v63[80];
    uint64_t v120 = v80;
    uint64_t v83 = v80 + ((v82 + 32) & ~v82);
    uint64_t v84 = *((void *)v63 + 9);
    do
    {
      uint64_t v85 = Apple_Parsec_Siri_V2alpha_PegasusClientEventLog.pegasusDomainUserSensitiveTier1Log.getter();
      uint64_t v87 = v86;
      uint64_t v121 = v69;
      unint64_t v89 = *(void *)(v69 + 16);
      unint64_t v88 = *(void *)(v69 + 24);
      if (v89 >= v88 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v88 > 1, v89 + 1, 1);
        uint64_t v69 = v121;
      }
      *(void *)(v69 + 16) = v89 + 1;
      unint64_t v90 = v69 + 16 * v89;
      *(void *)(v90 + 32) = v85;
      *(void *)(v90 + 40) = v87;
      v83 += v84;
      --v81;
    }
    while (v81);
    swift_bridgeObjectRelease();
    uint64_t v66 = v119;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  if (v107) {
    char v91 = 3;
  }
  else {
    char v91 = 0;
  }
  LOBYTE(v121) = v91;
  (*(void (**)(unint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, char *, uint64_t, char *, char *, _BYTE, uint64_t, unint64_t, _OWORD *, _BYTE, void, void, uint64_t, uint64_t, uint64_t, uint64_t *))(v101 + 304))(v117, v100, v110, v98, v97, v96, v95, v111, v94, v114, v113, v116 & 1, v109, v99, v122, 0, 0, 0, v70,
    v69,
    v108,
    &v121);
  uint64_t v92 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse();
  (*(void (**)(char *, uint64_t))(*(void *)(v92 - 8) + 8))(v66, v92);
}

uint64_t PommesResponse.__allocating_init(experiences:clientResults:conversationContext:metadataDomainName:renderedTexts:pegasusDomainFlowStepLog:pegasusDomainUserSensitiveTier1Log:listenAfterSpeaking:requestId:pommesCandidateId:isHandledByPreflight:preflightClientHandlerIdentifier:isPersonalDomainFallback:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char, uint64_t, uint64_t))(v14 + 304))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14);
}

uint64_t PommesResponse.__allocating_init(experiences:clientResults:conversationContext:metadataDomainName:renderedTexts:pegasusDomainFlowStepLog:pegasusDomainUserSensitiveTier1Log:listenAfterSpeaking:requestId:resultCandidateId:isHandledByPreflight:preflightClientHandlerIdentifier:searchReason:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char, uint64_t, uint64_t))(v14 + 304))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14);
}

id PommesResponse.__allocating_init(experiences:clientResults:conversationContext:metadataDomainName:renderedTexts:pegasusDomainFlowStepLog:pegasusDomainUserSensitiveTier1Log:listenAfterSpeaking:requestId:pommesCandidateId:isHandledByPreflight:preflightClientHandlerIdentifier:taskStepLogs:userSensitiveTier1Logs:componentsWarmedUp:searchReason:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9, uint64_t a10, unint64_t a11, char a12, long long a13, long long *a14, char a15, long long a16, long long a17, uint64_t a18, char *a19)
{
  id v21 = objc_allocWithZone(v19);
  id v22 = specialized PommesResponse.init(experiences:clientResults:conversationContext:metadataDomainName:renderedTexts:pegasusDomainFlowStepLog:pegasusDomainUserSensitiveTier1Log:listenAfterSpeaking:requestId:pommesCandidateId:isHandledByPreflight:preflightClientHandlerIdentifier:taskStepLogs:userSensitiveTier1Logs:componentsWarmedUp:searchReason:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, *((uint64_t *)&a13 + 1), a14, a15, a16, *((uint64_t *)&a16 + 1), a17,
          *((uint64_t *)&a17 + 1),
          a18,
          a19);
  outlined consume of Data._Representation?(a10, a11);
  outlined consume of Data._Representation?(a8, a9);
  outlined consume of Data._Representation?(a3, a4);
  return v22;
}

id PommesResponse.init(experiences:clientResults:conversationContext:metadataDomainName:renderedTexts:pegasusDomainFlowStepLog:pegasusDomainUserSensitiveTier1Log:listenAfterSpeaking:requestId:pommesCandidateId:isHandledByPreflight:preflightClientHandlerIdentifier:taskStepLogs:userSensitiveTier1Logs:componentsWarmedUp:searchReason:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9, uint64_t a10, unint64_t a11, char a12, uint64_t a13, uint64_t a14, long long *a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char *a22)
{
  id v25 = specialized PommesResponse.init(experiences:clientResults:conversationContext:metadataDomainName:renderedTexts:pegasusDomainFlowStepLog:pegasusDomainUserSensitiveTier1Log:listenAfterSpeaking:requestId:pommesCandidateId:isHandledByPreflight:preflightClientHandlerIdentifier:taskStepLogs:userSensitiveTier1Logs:componentsWarmedUp:searchReason:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
          a20,
          a21,
          a22);
  outlined consume of Data._Representation?(a10, a11);
  outlined consume of Data._Representation?(a8, a9);
  outlined consume of Data._Representation?(a3, a4);
  return v25;
}

uint64_t PommesResponse.__allocating_init(_:)(void (*a1)(unsigned char *))
{
  memset(__src, 0, 24);
  *(void *)&__src[24] = 0xF000000000000000;
  memset(&__src[32], 0, 17);
  memset(&__src[56], 0, 24);
  *(_OWORD *)&__src[80] = xmmword_25C97FEE0;
  *(void *)&__src[96] = 0xF000000000000000;
  __src[104] = 0;
  memset(&__src[112], 0, 48);
  *(_WORD *)&__src[160] = 255;
  memset(&__src[168], 0, 32);
  *(void *)&__src[200] = MEMORY[0x263F8EE78];
  memset(&__src[208], 0, 18);
  memset(&__src[232], 0, 40);
  *(_OWORD *)&__src[272] = xmmword_25C97FEE0;
  *(void *)&__src[288] = 0xF000000000000000;
  memset(&__src[296], 0, 25);
  a1(__src);
  memcpy(v3, __src, 0x141uLL);
  return (*(uint64_t (**)(unsigned char *))(v1 + 312))(v3);
}

double PommesResponse.Builder.init()@<D0>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0xF000000000000000;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  *(unsigned char *)(a1 + 48) = 0;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 56) = 0;
  double result = -3.10503618e231;
  *(_OWORD *)(a1 + 80) = xmmword_25C97FEE0;
  *(void *)(a1 + 96) = 0xF000000000000000;
  *(unsigned char *)(a1 + 104) = 0;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_WORD *)(a1 + 160) = 255;
  *(_OWORD *)(a1 + 184) = 0u;
  *(_OWORD *)(a1 + 168) = 0u;
  *(void *)(a1 + 200) = MEMORY[0x263F8EE78];
  *(void *)(a1 + 208) = 0;
  *(void *)(a1 + 216) = 0;
  *(_WORD *)(a1 + 224) = 0;
  *(_OWORD *)(a1 + 232) = 0u;
  *(_OWORD *)(a1 + 248) = 0u;
  *(void *)(a1 + 264) = 0;
  *(_OWORD *)(a1 + 272) = xmmword_25C97FEE0;
  *(void *)(a1 + 288) = 0xF000000000000000;
  *(void *)(a1 + 296) = 0;
  *(void *)(a1 + 304) = 0;
  *(void *)(a1 + 312) = 0;
  *(unsigned char *)(a1 + 320) = 0;
  return result;
}

id PommesResponse.__allocating_init(builder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return PommesResponse.init(builder:)(a1);
}

id PommesResponse.init(builder:)(void *__src)
{
  uint64_t v2 = v1;
  memcpy(__dst, __src, 0x141uLL);
  id v3 = &v1[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_pegasusDomainFlowStepLog];
  *(_OWORD *)&v1[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_pegasusDomainFlowStepLog] = xmmword_25C97FD10;
  uint64_t v4 = &v1[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_pegasusDomainUserSensitiveTier1Log];
  *(_OWORD *)&v1[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_pegasusDomainUserSensitiveTier1Log] = xmmword_25C97FD10;
  uint64_t v5 = &v1[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_requestCountryCode];
  *(void *)uint64_t v5 = 0;
  *((void *)v5 + 1) = 0;
  uint64_t v6 = &v1[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse____lazy_storage____computedPrimaryQueryConfidence];
  *(void *)uint64_t v6 = 0;
  v6[8] = 1;
  if (!__dst[0])
  {
    unint64_t v46 = v1;
    outlined release of PommesResponse.Builder((uint64_t)__dst);
    if (one-time initialization token for pommes != -1) {
      swift_once();
    }
    uint64_t v47 = type metadata accessor for Logger();
    __swift_project_value_buffer(v47, (uint64_t)static Logger.pommes);
    uint64_t v48 = Logger.logObject.getter();
    os_log_type_t v49 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v48, v49))
    {
      uint64_t v50 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v50 = 0;
      _os_log_impl(&dword_25C8FE000, v48, v49, "Attempting to create a PommesResponse without experiences", v50, 2u);
      MEMORY[0x261199590](v50, -1, -1);
    }

    goto LABEL_21;
  }
  *(void *)&v1[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_experiences] = __dst[0];
  if (!__dst[1])
  {
    uint64_t v51 = v1;
    swift_bridgeObjectRetain();
    outlined release of PommesResponse.Builder((uint64_t)__dst);
    if (one-time initialization token for pommes != -1) {
      swift_once();
    }
    uint64_t v52 = type metadata accessor for Logger();
    __swift_project_value_buffer(v52, (uint64_t)static Logger.pommes);
    uint64_t v53 = Logger.logObject.getter();
    os_log_type_t v54 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v53, v54))
    {
      int v55 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int v55 = 0;
      _os_log_impl(&dword_25C8FE000, v53, v54, "Attempting to create a PommesResponse without clientResults", v55, 2u);
      MEMORY[0x261199590](v55, -1, -1);
    }

    swift_bridgeObjectRelease();
LABEL_21:
    outlined consume of Data._Representation?(*(void *)v3, *((void *)v3 + 1));
    outlined consume of Data._Representation?(*(void *)v4, *((void *)v4 + 1));
LABEL_22:
    swift_bridgeObjectRelease();
    goto LABEL_23;
  }
  uint64_t v83 = (uint64_t *)v4;
  uint64_t v84 = v3;
  *(void *)&v1[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_clientResults] = __dst[1];
  uint64_t v8 = __dst[2];
  unint64_t v7 = __dst[3];
  uint64_t v9 = &v1[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_conversationContext];
  *(void *)uint64_t v9 = __dst[2];
  *((void *)v9 + 1) = v7;
  uint64_t v10 = __dst[5];
  uint64_t v82 = __dst[5];
  if (!__dst[5])
  {
    uint64_t v56 = v2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    outlined copy of Data?(v8, v7);
    outlined release of PommesResponse.Builder((uint64_t)__dst);
    if (one-time initialization token for pommes != -1) {
      swift_once();
    }
    uint64_t v57 = type metadata accessor for Logger();
    __swift_project_value_buffer(v57, (uint64_t)static Logger.pommes);
    uint64_t v58 = Logger.logObject.getter();
    os_log_type_t v59 = static os_log_type_t.fault.getter();
    uint64_t v60 = (uint64_t *)v4;
    unint64_t v61 = 0x26A5DD000uLL;
    if (os_log_type_enabled(v58, v59))
    {
      int v62 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int v62 = 0;
      uint64_t v63 = "Attempting to create a PommesResponse without metadataDomainName";
LABEL_33:
      _os_log_impl(&dword_25C8FE000, v58, v59, v63, v62, 2u);
      int v66 = 0;
      int v67 = 0;
      int v68 = 0;
      goto LABEL_34;
    }
LABEL_35:
    int v66 = 0;
    int v67 = 0;
    int v68 = 0;
    goto LABEL_36;
  }
  int64_t v11 = &v2[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_metadataDomainName];
  *(void *)int64_t v11 = __dst[4];
  *((void *)v11 + 1) = v10;
  v2[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_metadataFallbackTriggered] = __dst[6];
  if (!__dst[7])
  {
    int64_t v64 = v2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    outlined copy of Data?(v8, v7);
    swift_bridgeObjectRetain();
    outlined release of PommesResponse.Builder((uint64_t)__dst);
    if (one-time initialization token for pommes != -1) {
      swift_once();
    }
    uint64_t v65 = type metadata accessor for Logger();
    __swift_project_value_buffer(v65, (uint64_t)static Logger.pommes);
    uint64_t v58 = Logger.logObject.getter();
    os_log_type_t v59 = static os_log_type_t.fault.getter();
    uint64_t v60 = (uint64_t *)v4;
    unint64_t v61 = 0x26A5DD000;
    if (os_log_type_enabled(v58, v59))
    {
      int v62 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int v62 = 0;
      uint64_t v63 = "Attempting to create a PommesResponse without renderedTexts";
      goto LABEL_33;
    }
    goto LABEL_35;
  }
  int64_t v81 = v5;
  *(void *)&v2[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_renderedTexts] = __dst[7];
  uint64_t v12 = MEMORY[0x263F8EE78];
  uint64_t v13 = __dst[9];
  if (__dst[8]) {
    uint64_t v12 = __dst[8];
  }
  *(void *)&v2[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_redactedRenderedTexts] = v12;
  unint64_t v14 = __dst[10];
  swift_beginAccess();
  unint64_t v79 = *((void *)v84 + 1);
  uint64_t v80 = *(void *)v84;
  *(void *)uint64_t v84 = v13;
  *((void *)v84 + 1) = v14;
  uint64_t v15 = v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  outlined copy of Data?(v8, v7);
  swift_bridgeObjectRetain();
  outlined copy of Data?(v13, v14);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  outlined consume of Data._Representation?(v80, v79);
  uint64_t v16 = __dst[11];
  unint64_t v17 = __dst[12];
  swift_beginAccess();
  uint64_t v18 = *v83;
  unint64_t v19 = v83[1];
  *uint64_t v83 = v16;
  v83[1] = v17;
  outlined copy of Data?(v16, v17);
  outlined consume of Data._Representation?(v18, v19);
  v15[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_listenAfterSpeaking] = __dst[13];
  uint64_t v20 = __dst[15];
  id v21 = &v15[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_requestId];
  *(void *)id v21 = __dst[14];
  *((void *)v21 + 1) = v20;
  uint64_t v22 = __dst[16];
  uint64_t v23 = __dst[17];
  uint64_t v25 = __dst[18];
  uint64_t v24 = __dst[19];
  char v26 = __dst[20];
  uint64_t v27 = &v15[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_pommesCandidateId];
  *(void *)uint64_t v27 = __dst[16];
  *((void *)v27 + 1) = v23;
  *((void *)v27 + 2) = v25;
  *((void *)v27 + 3) = v24;
  v27[32] = v26;
  v15[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_isHandledByPreflight] = BYTE1(__dst[20]);
  uint64_t v28 = __dst[22];
  uint64_t v29 = &v15[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_preflightClientHandlerIdentifier];
  *(void *)uint64_t v29 = __dst[21];
  *((void *)v29 + 1) = v28;
  if (!__dst[23])
  {
    swift_bridgeObjectRetain();
    outlined copy of PommesCandidateId?(v22, v23, v25, v24, v26);
    swift_bridgeObjectRetain();
    outlined release of PommesResponse.Builder((uint64_t)__dst);
    if (one-time initialization token for pommes != -1) {
      swift_once();
    }
    uint64_t v71 = type metadata accessor for Logger();
    __swift_project_value_buffer(v71, (uint64_t)static Logger.pommes);
    uint64_t v58 = Logger.logObject.getter();
    os_log_type_t v72 = static os_log_type_t.fault.getter();
    uint64_t v60 = v83;
    unint64_t v61 = 0x26A5DD000;
    if (!os_log_type_enabled(v58, v72))
    {
      int v66 = 0;
      int v68 = 0;
      int v67 = 1;
      goto LABEL_36;
    }
    int v62 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int v62 = 0;
    _os_log_impl(&dword_25C8FE000, v58, v72, "Attempting to create a PommesResponse without taskStepLogs", v62, 2u);
    int v66 = 0;
    int v68 = 0;
    int v67 = 1;
    goto LABEL_34;
  }
  *(void *)&v15[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_taskStepLogs] = __dst[23];
  if (!__dst[24])
  {
    swift_bridgeObjectRetain();
    outlined copy of PommesCandidateId?(v22, v23, v25, v24, v26);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    outlined release of PommesResponse.Builder((uint64_t)__dst);
    if (one-time initialization token for pommes != -1) {
      swift_once();
    }
    uint64_t v73 = type metadata accessor for Logger();
    __swift_project_value_buffer(v73, (uint64_t)static Logger.pommes);
    uint64_t v58 = Logger.logObject.getter();
    os_log_type_t v74 = static os_log_type_t.fault.getter();
    uint64_t v60 = v83;
    unint64_t v61 = 0x26A5DD000;
    if (!os_log_type_enabled(v58, v74))
    {
      int v68 = 0;
      int v66 = 1;
      int v67 = 1;
      goto LABEL_36;
    }
    int v62 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int v62 = 0;
    _os_log_impl(&dword_25C8FE000, v58, v74, "Attempting to create a PommesResponse without userSensitiveTier1Logs", v62, 2u);
    int v68 = 0;
    int v66 = 1;
    int v67 = 1;
LABEL_34:
    MEMORY[0x261199590](v62, -1, -1);
    goto LABEL_36;
  }
  *(void *)&v15[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_userSensitiveTier1Logs] = __dst[24];
  *(void *)&v15[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_componentsWarmedUp] = __dst[25];
  uint64_t v77 = __dst[26];
  uint64_t v78 = v24;
  uint64_t v30 = __dst[27];
  swift_beginAccess();
  *(void *)int64_t v81 = v77;
  *((void *)v81 + 1) = v30;
  swift_bridgeObjectRetain();
  outlined copy of PommesCandidateId?(v22, v23, v25, v78, v26);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v15[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_searchReason] = __dst[28];
  v15[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_isCachedResponse] = BYTE1(__dst[28]);
  uint64_t v31 = __dst[30];
  if (__dst[30])
  {
    unint64_t v32 = &v15[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_searchRequestUtterance];
    *(void *)unint64_t v32 = __dst[29];
    *((void *)v32 + 1) = v31;
    uint64_t v33 = __dst[32];
    char v34 = &v15[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_sharedUserId];
    *(void *)char v34 = __dst[31];
    *((void *)v34 + 1) = v33;
    uint64_t v35 = __dst[33];
    unint64_t v36 = __dst[34];
    double v37 = &v15[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_encodedNLUserParses];
    *(void *)double v37 = __dst[33];
    *((void *)v37 + 1) = v36;
    uint64_t v38 = __dst[35];
    unint64_t v39 = __dst[36];
    uint64_t v40 = &v15[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_encodedNLFallbackParse];
    *(void *)uint64_t v40 = __dst[35];
    *((void *)v40 + 1) = v39;
    BOOL v41 = (void *)__dst[37];
    *(void *)&v15[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_asrRecognition] = __dst[37];
    uint64_t v42 = __dst[39];
    BOOL v43 = &v15[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_responseVariantResult];
    *(void *)BOOL v43 = __dst[38];
    *((void *)v43 + 1) = v42;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    outlined copy of Data?(v35, v36);
    outlined copy of Data?(v38, v39);
    swift_bridgeObjectRetain();
    id v44 = v41;
    outlined release of PommesResponse.Builder((uint64_t)__dst);
    v15[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_isLowConfidenceKnowledgeResult] = __dst[40];

    v85.receiver = v15;
    v85.super_class = (Class)type metadata accessor for PommesResponse();
    return objc_msgSendSuper2(&v85, sel_init);
  }
  outlined release of PommesResponse.Builder((uint64_t)__dst);
  if (one-time initialization token for pommes != -1) {
    swift_once();
  }
  uint64_t v75 = type metadata accessor for Logger();
  __swift_project_value_buffer(v75, (uint64_t)static Logger.pommes);
  uint64_t v58 = Logger.logObject.getter();
  os_log_type_t v76 = static os_log_type_t.fault.getter();
  uint64_t v60 = v83;
  unint64_t v61 = 0x26A5DD000;
  if (os_log_type_enabled(v58, v76))
  {
    int v62 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int v62 = 0;
    _os_log_impl(&dword_25C8FE000, v58, v76, "Attempting to create a PommesResponse without searchRequestUtterance", v62, 2u);
    int v66 = 1;
    int v67 = 1;
    int v68 = 1;
    goto LABEL_34;
  }
  int v66 = 1;
  int v67 = 1;
  int v68 = 1;
LABEL_36:

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined consume of Data._Representation?(*(void *)&v2[*(void *)(v61 + 2232)], *(void *)&v2[*(void *)(v61 + 2232) + 8]);
  if (v82)
  {
    swift_bridgeObjectRelease();
    if (v67) {
      goto LABEL_38;
    }
  }
  else if (v67)
  {
LABEL_38:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    outlined consume of Data._Representation?(*(void *)v84, *((void *)v84 + 1));
    char v69 = 1;
    if ((v66 & 1) == 0) {
      goto LABEL_39;
    }
LABEL_44:
    swift_bridgeObjectRelease();
    outlined consume of Data._Representation?(*v60, v60[1]);
    if (v68) {
      goto LABEL_40;
    }
    goto LABEL_45;
  }
  outlined consume of Data._Representation?(*(void *)v84, *((void *)v84 + 1));
  char v69 = 0;
  if (v66) {
    goto LABEL_44;
  }
LABEL_39:
  outlined consume of Data._Representation?(*v60, v60[1]);
  if (v68)
  {
LABEL_40:
    swift_bridgeObjectRelease();
    if ((v69 & 1) == 0)
    {
      swift_bridgeObjectRelease();
LABEL_50:

      swift_bridgeObjectRelease();
      goto LABEL_24;
    }
    int v70 = 1;
    goto LABEL_47;
  }
LABEL_45:
  if ((v69 & 1) == 0) {
    goto LABEL_22;
  }
  int v70 = 0;
LABEL_47:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined consume of PommesCandidateId?(*(void *)&v2[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_pommesCandidateId], *(void *)&v2[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_pommesCandidateId + 8], *(void *)&v2[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_pommesCandidateId + 16], *(void *)&v2[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_pommesCandidateId + 24], v2[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_pommesCandidateId + 32]);
  if (v70) {
    goto LABEL_50;
  }
LABEL_23:

LABEL_24:
  type metadata accessor for PommesResponse();
  swift_deallocPartialClassInstance();
  return 0;
}

uint64_t PommesResponse.Builder.experiences.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PommesResponse.Builder.experiences.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v1 = a1;
  return result;
}

uint64_t (*PommesResponse.Builder.experiences.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

uint64_t PommesResponse.Builder.clientResults.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PommesResponse.Builder.clientResults.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 8) = a1;
  return result;
}

uint64_t (*PommesResponse.Builder.clientResults.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

uint64_t PommesResponse.Builder.conversationContext.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  outlined copy of Data?(v1, *(void *)(v0 + 24));
  return v1;
}

uint64_t PommesResponse.Builder.conversationContext.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = outlined consume of Data._Representation?(*(void *)(v2 + 16), *(void *)(v2 + 24));
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*PommesResponse.Builder.conversationContext.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

uint64_t PommesResponse.Builder.metadataDomainName.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PommesResponse.Builder.metadataDomainName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return result;
}

uint64_t (*PommesResponse.Builder.metadataDomainName.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

uint64_t PommesResponse.Builder.metadataFallbackTriggered.getter()
{
  return *(unsigned __int8 *)(v0 + 48);
}

uint64_t PommesResponse.Builder.metadataFallbackTriggered.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 48) = result;
  return result;
}

uint64_t (*PommesResponse.Builder.metadataFallbackTriggered.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

uint64_t PommesResponse.Builder.renderedTexts.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PommesResponse.Builder.renderedTexts.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 56) = a1;
  return result;
}

uint64_t (*PommesResponse.Builder.renderedTexts.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

uint64_t PommesResponse.Builder.redactedRenderedTexts.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PommesResponse.Builder.redactedRenderedTexts.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 64) = a1;
  return result;
}

uint64_t (*PommesResponse.Builder.redactedRenderedTexts.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

uint64_t PommesResponse.Builder.pegasusDomainFlowStepLog.getter()
{
  uint64_t v1 = *(void *)(v0 + 72);
  outlined copy of Data?(v1, *(void *)(v0 + 80));
  return v1;
}

uint64_t PommesResponse.Builder.pegasusDomainFlowStepLog.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = outlined consume of Data._Representation?(*(void *)(v2 + 72), *(void *)(v2 + 80));
  *(void *)(v2 + 72) = a1;
  *(void *)(v2 + 80) = a2;
  return result;
}

uint64_t (*PommesResponse.Builder.pegasusDomainFlowStepLog.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

uint64_t PommesResponse.Builder.pegasusDomainUserSensitiveTier1Log.getter()
{
  uint64_t v1 = *(void *)(v0 + 88);
  outlined copy of Data?(v1, *(void *)(v0 + 96));
  return v1;
}

uint64_t PommesResponse.Builder.pegasusDomainUserSensitiveTier1Log.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = outlined consume of Data._Representation?(*(void *)(v2 + 88), *(void *)(v2 + 96));
  *(void *)(v2 + 88) = a1;
  *(void *)(v2 + 96) = a2;
  return result;
}

uint64_t (*PommesResponse.Builder.pegasusDomainUserSensitiveTier1Log.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

uint64_t PommesResponse.Builder.listenAfterSpeaking.getter()
{
  return *(unsigned __int8 *)(v0 + 104);
}

uint64_t PommesResponse.Builder.listenAfterSpeaking.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 104) = result;
  return result;
}

uint64_t (*PommesResponse.Builder.listenAfterSpeaking.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

uint64_t PommesResponse.Builder.requestId.getter()
{
  uint64_t v1 = *(void *)(v0 + 112);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PommesResponse.Builder.requestId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 112) = a1;
  *(void *)(v2 + 120) = a2;
  return result;
}

uint64_t (*PommesResponse.Builder.requestId.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

uint64_t PommesResponse.Builder.pommesCandidateId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 128);
  uint64_t v3 = *(void *)(v1 + 136);
  uint64_t v4 = *(void *)(v1 + 144);
  uint64_t v5 = *(void *)(v1 + 152);
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  char v6 = *(unsigned char *)(v1 + 160);
  *(unsigned char *)(a1 + 32) = v6;
  return outlined copy of PommesCandidateId?(v2, v3, v4, v5, v6);
}

__n128 PommesResponse.Builder.pommesCandidateId.setter(__n128 *a1)
{
  __n128 v6 = *a1;
  unint64_t v2 = a1[1].n128_u64[0];
  unint64_t v3 = a1[1].n128_u64[1];
  unsigned __int8 v4 = a1[2].n128_u8[0];
  outlined consume of PommesCandidateId?(*(void *)(v1 + 128), *(void *)(v1 + 136), *(void *)(v1 + 144), *(void *)(v1 + 152), *(unsigned char *)(v1 + 160));
  __n128 result = v6;
  *(__n128 *)(v1 + 128) = v6;
  *(void *)(v1 + 144) = v2;
  *(void *)(v1 + 152) = v3;
  *(unsigned char *)(v1 + 160) = v4;
  return result;
}

uint64_t (*PommesResponse.Builder.pommesCandidateId.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

uint64_t PommesResponse.Builder.isHandledByPreflight.getter()
{
  return *(unsigned __int8 *)(v0 + 161);
}

uint64_t PommesResponse.Builder.isHandledByPreflight.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 161) = result;
  return result;
}

uint64_t (*PommesResponse.Builder.isHandledByPreflight.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

uint64_t PommesResponse.Builder.preflightClientHandlerIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 168);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PommesResponse.Builder.preflightClientHandlerIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 168) = a1;
  *(void *)(v2 + 176) = a2;
  return result;
}

uint64_t (*PommesResponse.Builder.preflightClientHandlerIdentifier.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

uint64_t PommesResponse.Builder.taskStepLogs.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PommesResponse.Builder.taskStepLogs.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 184) = a1;
  return result;
}

uint64_t (*PommesResponse.Builder.taskStepLogs.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

uint64_t PommesResponse.Builder.userSensitiveTier1Logs.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PommesResponse.Builder.userSensitiveTier1Logs.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 192) = a1;
  return result;
}

uint64_t (*PommesResponse.Builder.userSensitiveTier1Logs.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

uint64_t PommesResponse.Builder.componentsWarmedUp.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PommesResponse.Builder.componentsWarmedUp.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 200) = a1;
  return result;
}

uint64_t (*PommesResponse.Builder.componentsWarmedUp.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

uint64_t PommesResponse.Builder.requestCountryCode.getter()
{
  uint64_t v1 = *(void *)(v0 + 208);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PommesResponse.Builder.requestCountryCode.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 208) = a1;
  *(void *)(v2 + 216) = a2;
  return result;
}

uint64_t (*PommesResponse.Builder.requestCountryCode.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

void PommesResponse.Builder.searchReason.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 224);
}

unsigned char *PommesResponse.Builder.searchReason.setter(unsigned char *result)
{
  *(unsigned char *)(v1 + 224) = *result;
  return result;
}

uint64_t (*PommesResponse.Builder.searchReason.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

uint64_t PommesResponse.Builder.isCachedResponse.getter()
{
  return *(unsigned __int8 *)(v0 + 225);
}

uint64_t PommesResponse.Builder.isCachedResponse.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 225) = result;
  return result;
}

uint64_t (*PommesResponse.Builder.isCachedResponse.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

uint64_t PommesResponse.Builder.searchRequestUtterance.getter()
{
  uint64_t v1 = *(void *)(v0 + 232);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PommesResponse.Builder.searchRequestUtterance.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 232) = a1;
  *(void *)(v2 + 240) = a2;
  return result;
}

uint64_t (*PommesResponse.Builder.searchRequestUtterance.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

uint64_t PommesResponse.Builder.sharedUserId.getter()
{
  uint64_t v1 = *(void *)(v0 + 248);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PommesResponse.Builder.sharedUserId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 248) = a1;
  *(void *)(v2 + 256) = a2;
  return result;
}

uint64_t (*PommesResponse.Builder.sharedUserId.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

uint64_t PommesResponse.Builder.encodedNLUserParses.getter()
{
  uint64_t v1 = *(void *)(v0 + 264);
  outlined copy of Data?(v1, *(void *)(v0 + 272));
  return v1;
}

uint64_t PommesResponse.Builder.encodedNLUserParses.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = outlined consume of Data._Representation?(*(void *)(v2 + 264), *(void *)(v2 + 272));
  *(void *)(v2 + 264) = a1;
  *(void *)(v2 + 272) = a2;
  return result;
}

uint64_t (*PommesResponse.Builder.encodedNLUserParses.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

uint64_t PommesResponse.Builder.encodedNLFallbackParse.getter()
{
  uint64_t v1 = *(void *)(v0 + 280);
  outlined copy of Data?(v1, *(void *)(v0 + 288));
  return v1;
}

uint64_t PommesResponse.Builder.encodedNLFallbackParse.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = outlined consume of Data._Representation?(*(void *)(v2 + 280), *(void *)(v2 + 288));
  *(void *)(v2 + 280) = a1;
  *(void *)(v2 + 288) = a2;
  return result;
}

uint64_t (*PommesResponse.Builder.encodedNLFallbackParse.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

void *PommesResponse.Builder.asrRecognition.getter()
{
  uint64_t v1 = *(void **)(v0 + 296);
  id v2 = v1;
  return v1;
}

void PommesResponse.Builder.asrRecognition.setter(uint64_t a1)
{
  *(void *)(v1 + 296) = a1;
}

uint64_t (*PommesResponse.Builder.asrRecognition.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

uint64_t PommesResponse.Builder.responseVariantResult.getter()
{
  uint64_t v1 = *(void *)(v0 + 304);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PommesResponse.Builder.responseVariantResult.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 304) = a1;
  *(void *)(v2 + 312) = a2;
  return result;
}

uint64_t (*PommesResponse.Builder.responseVariantResult.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

uint64_t PommesResponse.Builder.isLowConfidenceKnowledgeResult.getter()
{
  return *(unsigned __int8 *)(v0 + 320);
}

uint64_t PommesResponse.Builder.isLowConfidenceKnowledgeResult.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 320) = result;
  return result;
}

uint64_t (*PommesResponse.Builder.isLowConfidenceKnowledgeResult.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

uint64_t key path setter for PommesResponse.experiences : PommesResponse(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = (void *)(*a2 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_experiences);
  swift_beginAccess();
  *unint64_t v3 = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t PommesResponse.experiences.getter()
{
  return AudioExperience.serverAudioResults.getter();
}

uint64_t PommesResponse.clientResults.getter()
{
  return AudioExperience.serverAudioResults.getter();
}

uint64_t PommesResponse.clientResults.setter(uint64_t a1)
{
  return PommesResponse.clientResults.setter(a1, &OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_clientResults);
}

uint64_t (*PommesResponse.clientResults.modify())()
{
  return AudioExperience.isGlideEligible.modify;
}

uint64_t PommesResponse.conversationContext.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_conversationContext);
  outlined copy of Data?(v1, *(void *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_conversationContext + 8));
  return v1;
}

uint64_t PommesResponse.metadataDomainName.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_metadataDomainName);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PommesResponse.metadataFallbackTriggered.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_metadataFallbackTriggered);
}

uint64_t PommesResponse.renderedTexts.getter()
{
  return AudioExperience.serverAudioResults.getter();
}

uint64_t PommesResponse.renderedTexts.setter(uint64_t a1)
{
  return PommesResponse.clientResults.setter(a1, &OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_renderedTexts);
}

uint64_t (*PommesResponse.renderedTexts.modify())()
{
  return AudioExperience.isGlideEligible.modify;
}

uint64_t PommesResponse.redactedRenderedTexts.getter()
{
  return AudioExperience.serverAudioResults.getter();
}

uint64_t PommesResponse.redactedRenderedTexts.setter(uint64_t a1)
{
  return PommesResponse.clientResults.setter(a1, &OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_redactedRenderedTexts);
}

uint64_t (*PommesResponse.redactedRenderedTexts.modify())()
{
  return AudioExperience.isGlideEligible.modify;
}

uint64_t PommesResponse.pegasusDomainFlowStepLog.getter()
{
  return PommesResponse.pegasusDomainFlowStepLog.getter(&OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_pegasusDomainFlowStepLog);
}

uint64_t PommesResponse.pegasusDomainFlowStepLog.setter(uint64_t a1, uint64_t a2)
{
  return PommesResponse.pegasusDomainFlowStepLog.setter(a1, a2, &OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_pegasusDomainFlowStepLog);
}

uint64_t (*PommesResponse.pegasusDomainFlowStepLog.modify())()
{
  return AudioExperience.isGlideEligible.modify;
}

uint64_t PommesResponse.taskStepLogs.getter()
{
  return AudioExperience.serverAudioResults.getter();
}

uint64_t PommesResponse.taskStepLogs.setter(uint64_t a1)
{
  return PommesResponse.clientResults.setter(a1, &OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_taskStepLogs);
}

uint64_t (*PommesResponse.taskStepLogs.modify())()
{
  return AudioExperience.internalSignalsFromSiriAudio.modify;
}

uint64_t PommesResponse.pegasusDomainUserSensitiveTier1Log.getter()
{
  return PommesResponse.pegasusDomainFlowStepLog.getter(&OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_pegasusDomainUserSensitiveTier1Log);
}

uint64_t PommesResponse.pegasusDomainFlowStepLog.getter(void *a1)
{
  uint64_t v2 = v1 + *a1;
  swift_beginAccess();
  uint64_t v3 = *(void *)v2;
  outlined copy of Data?(*(void *)v2, *(void *)(v2 + 8));
  return v3;
}

uint64_t PommesResponse.pegasusDomainUserSensitiveTier1Log.setter(uint64_t a1, uint64_t a2)
{
  return PommesResponse.pegasusDomainFlowStepLog.setter(a1, a2, &OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_pegasusDomainUserSensitiveTier1Log);
}

uint64_t PommesResponse.pegasusDomainFlowStepLog.setter(uint64_t a1, uint64_t a2, void *a3)
{
  __n128 v6 = (uint64_t *)(v3 + *a3);
  swift_beginAccess();
  uint64_t v7 = *v6;
  unint64_t v8 = v6[1];
  uint64_t *v6 = a1;
  v6[1] = a2;
  return outlined consume of Data._Representation?(v7, v8);
}

uint64_t (*PommesResponse.pegasusDomainUserSensitiveTier1Log.modify())()
{
  return AudioExperience.isGlideEligible.modify;
}

uint64_t PommesResponse.userSensitiveTier1Logs.getter()
{
  return AudioExperience.serverAudioResults.getter();
}

uint64_t PommesResponse.userSensitiveTier1Logs.setter(uint64_t a1)
{
  return PommesResponse.clientResults.setter(a1, &OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_userSensitiveTier1Logs);
}

uint64_t PommesResponse.clientResults.setter(uint64_t a1, void *a2)
{
  unsigned __int8 v4 = (void *)(v2 + *a2);
  swift_beginAccess();
  void *v4 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*PommesResponse.userSensitiveTier1Logs.modify())()
{
  return AudioExperience.isGlideEligible.modify;
}

uint64_t PommesResponse.listenAfterSpeaking.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_listenAfterSpeaking);
  swift_beginAccess();
  return *v1;
}

uint64_t PommesResponse.listenAfterSpeaking.setter(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_listenAfterSpeaking);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*PommesResponse.listenAfterSpeaking.modify())()
{
  return AudioExperience.isGlideEligible.modify;
}

uint64_t PommesResponse.requestId.getter()
{
  return PommesResponse.requestId.getter(&OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_requestId);
}

uint64_t PommesResponse.resultCandidateId.getter()
{
  uint64_t v1 = 0;
  uint64_t v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_pommesCandidateId);
  unsigned int v3 = *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_pommesCandidateId + 32);
  if (v3 <= 1)
  {
    if (*(unsigned char *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_pommesCandidateId + 32)) {
      return v1;
    }
    goto LABEL_5;
  }
  if (v3 == 2)
  {
LABEL_5:
    uint64_t v1 = *v2;
    outlined copy of PommesCandidateId(*v2, v2[1], v2[2], v2[3], v3);
  }
  return v1;
}

uint64_t PommesResponse.isHandledByPreflight.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_isHandledByPreflight);
}

uint64_t PommesResponse.preflightClientHandlerIdentifier.getter()
{
  return PommesResponse.requestId.getter(&OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_preflightClientHandlerIdentifier);
}

uint64_t PommesResponse.isPersonalDomainFallback.getter()
{
  (*(void (**)(uint64_t *__return_ptr))((*MEMORY[0x263F8EED0] & *v0) + 0x240))(&v3);
  switch((char)v3)
  {
    case 3:
      swift_bridgeObjectRelease();
      uint64_t result = 1;
      break;
    default:
      char v2 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      uint64_t result = v2 & 1;
      break;
  }
  return result;
}

uint64_t PommesResponse.requestCountryCode.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_requestCountryCode);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t PommesResponse.requestCountryCode.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_requestCountryCode);
  swift_beginAccess();
  void *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*PommesResponse.requestCountryCode.modify())()
{
  return AudioExperience.isGlideEligible.modify;
}

uint64_t PommesResponse.searchReason.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_searchReason);
  uint64_t result = swift_beginAccess();
  *a1 = *v3;
  return result;
}

uint64_t PommesResponse.pommesCandidateId.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_pommesCandidateId;
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_pommesCandidateId);
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_pommesCandidateId + 8);
  uint64_t v5 = *(void *)(v1 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_pommesCandidateId + 16);
  uint64_t v6 = *(void *)(v1 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_pommesCandidateId + 24);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  char v7 = *(unsigned char *)(v2 + 32);
  *(unsigned char *)(a1 + 32) = v7;
  return outlined copy of PommesCandidateId?(v3, v4, v5, v6, v7);
}

uint64_t PommesResponse.componentsWarmedUp.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PommesResponse.isCachedResponse.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_isCachedResponse);
}

uint64_t PommesResponse.searchRequestUtterance.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_searchRequestUtterance);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PommesResponse.sharedUserId.getter()
{
  return PommesResponse.requestId.getter(&OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_sharedUserId);
}

uint64_t PommesResponse.encodedNLUserParses.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_encodedNLUserParses);
  outlined copy of Data?(v1, *(void *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_encodedNLUserParses + 8));
  return v1;
}

uint64_t PommesResponse.encodedNLFallbackParse.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_encodedNLFallbackParse);
  outlined copy of Data?(v1, *(void *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_encodedNLFallbackParse + 8));
  return v1;
}

void *PommesResponse.asrRecognition.getter()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_asrRecognition);
  id v2 = v1;
  return v1;
}

uint64_t PommesResponse.responseVariantResult.getter()
{
  return PommesResponse.requestId.getter(&OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_responseVariantResult);
}

uint64_t PommesResponse.requestId.getter(void *a1)
{
  uint64_t v2 = *(void *)(v1 + *a1);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t PommesResponse.isLowConfidenceKnowledgeResult.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_isLowConfidenceKnowledgeResult);
}

Swift::Void __swiftcall PommesResponse.setSearchReason(_:)(SiriInformationTypes::PommesSearchReason a1)
{
  char v2 = *(unsigned char *)a1;
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_searchReason);
  swift_beginAccess();
  *uint64_t v3 = v2;
}

uint64_t PommesResponse.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  uint64_t ObjectType = swift_getObjectType();
  memset(__src, 0, 24);
  *(void *)&__src[24] = 0xF000000000000000;
  memset(&__src[32], 0, 17);
  memset(&__src[56], 0, 24);
  *(_OWORD *)&__src[80] = xmmword_25C97FEE0;
  *(void *)&__src[96] = 0xF000000000000000;
  __src[104] = 0;
  memset(&__src[112], 0, 48);
  *(_WORD *)&__src[160] = 255;
  memset(&__src[168], 0, 32);
  *(void *)&__src[200] = MEMORY[0x263F8EE78];
  memset(&__src[208], 0, 18);
  memset(&__src[232], 0, 40);
  *(_OWORD *)&__src[272] = xmmword_25C97FEE0;
  *(void *)&__src[288] = 0xF000000000000000;
  memset(&__src[296], 0, 25);
  closure #1 in PommesResponse.init(coder:)((uint64_t)__src, a1);
  memcpy(v7, __src, 0x141uLL);
  uint64_t v5 = (*(uint64_t (**)(unsigned char *))(ObjectType + 312))(v7);

  swift_deallocPartialClassInstance();
  return v5;
}

uint64_t PommesResponse.init(coder:)(void *a1)
{
  uint64_t ObjectType = swift_getObjectType();
  memset(__src, 0, 24);
  *(void *)&__src[24] = 0xF000000000000000;
  memset(&__src[32], 0, 17);
  memset(&__src[56], 0, 24);
  *(_OWORD *)&__src[80] = xmmword_25C97FEE0;
  *(void *)&__src[96] = 0xF000000000000000;
  __src[104] = 0;
  memset(&__src[112], 0, 48);
  *(_WORD *)&__src[160] = 255;
  memset(&__src[168], 0, 32);
  *(void *)&__src[200] = MEMORY[0x263F8EE78];
  memset(&__src[208], 0, 18);
  memset(&__src[232], 0, 40);
  *(_OWORD *)&__src[272] = xmmword_25C97FEE0;
  *(void *)&__src[288] = 0xF000000000000000;
  memset(&__src[296], 0, 25);
  closure #1 in PommesResponse.init(coder:)((uint64_t)__src, a1);
  memcpy(v5, __src, 0x141uLL);
  uint64_t v3 = (*(uint64_t (**)(unsigned char *))(ObjectType + 312))(v5);

  swift_deallocPartialClassInstance();
  return v3;
}

void closure #1 in PommesResponse.init(coder:)(uint64_t a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject.Type>);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_25C97F8F0;
  uint64_t v4 = type metadata accessor for NSArray(0, &lazy cache variable for type metadata for NSArray);
  *(void *)(v3 + 32) = v4;
  *(void *)(v3 + 40) = type metadata accessor for Experience(0);
  NSCoder.decodeObject(of:forKey:)();
  swift_bridgeObjectRelease();
  if (v121)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Experience]);
    if (swift_dynamicCast()) {
      uint64_t v5 = v118;
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    outlined destroy of ClientExperienceSignals?((uint64_t)&v119, (uint64_t *)&demangling cache variable for type metadata for Any?);
    uint64_t v5 = 0;
  }
  swift_bridgeObjectRelease();
  *(void *)a1 = v5;
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_25C97F8F0;
  *(void *)(v6 + 32) = v4;
  *(void *)(v6 + 40) = type metadata accessor for PommesResult();
  NSCoder.decodeObject(of:forKey:)();
  swift_bridgeObjectRelease();
  if (v121)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [PommesResult]);
    if (swift_dynamicCast()) {
      uint64_t v7 = v118;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    outlined destroy of ClientExperienceSignals?((uint64_t)&v119, (uint64_t *)&demangling cache variable for type metadata for Any?);
    uint64_t v7 = 0;
  }
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = v7;
  uint64_t v8 = type metadata accessor for NSArray(0, (unint64_t *)&lazy cache variable for type metadata for NSData);
  uint64_t v9 = NSCoder.decodeObject<A>(of:forKey:)();
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    uint64_t v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v13 = v12;
  }
  else
  {
    uint64_t v11 = 0;
    unint64_t v13 = 0xF000000000000000;
  }
  outlined consume of Data._Representation?(*(void *)(a1 + 16), *(void *)(a1 + 24));
  *(void *)(a1 + 16) = v11;
  *(void *)(a1 + 24) = v13;
  uint64_t v14 = type metadata accessor for NSArray(0, (unint64_t *)&lazy cache variable for type metadata for NSString);
  uint64_t v15 = NSCoder.decodeObject<A>(of:forKey:)();
  if (v15)
  {
    uint64_t v16 = (void *)v15;
    uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v19 = v18;
  }
  else
  {
    unint64_t v19 = 0xE400000000000000;
    uint64_t v17 = 1701736302;
  }
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = v17;
  *(void *)(a1 + 40) = v19;
  uint64_t v20 = (void *)MEMORY[0x261198B80](0xD000000000000019, 0x800000025C981D10);
  unsigned __int8 v21 = objc_msgSend(a2, sel_decodeBoolForKey_, v20);

  *(unsigned char *)(a1 + 48) = v21;
  uint64_t v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_25C97F8F0;
  *(void *)(v22 + 32) = v4;
  *(void *)(v22 + 40) = v14;
  NSCoder.decodeObject(of:forKey:)();
  swift_bridgeObjectRelease();
  uint64_t v116 = v14;
  if (v121)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
    if (swift_dynamicCast())
    {
      uint64_t v23 = v118;
      goto LABEL_22;
    }
  }
  else
  {
    outlined destroy of ClientExperienceSignals?((uint64_t)&v119, (uint64_t *)&demangling cache variable for type metadata for Any?);
  }
  uint64_t v23 = MEMORY[0x263F8EE78];
LABEL_22:
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = v23;
  uint64_t v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_25C97F8F0;
  *(void *)(v24 + 32) = v4;
  *(void *)(v24 + 40) = v116;
  NSCoder.decodeObject(of:forKey:)();
  swift_bridgeObjectRelease();
  if (v121)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
    if (swift_dynamicCast())
    {
      uint64_t v25 = v118;
      goto LABEL_27;
    }
  }
  else
  {
    outlined destroy of ClientExperienceSignals?((uint64_t)&v119, (uint64_t *)&demangling cache variable for type metadata for Any?);
  }
  uint64_t v25 = MEMORY[0x263F8EE78];
LABEL_27:
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = v25;
  uint64_t v26 = NSCoder.decodeObject<A>(of:forKey:)();
  if (v26)
  {
    uint64_t v27 = (void *)v26;
    uint64_t v28 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v30 = v29;
  }
  else
  {
    uint64_t v28 = 0;
    unint64_t v30 = 0xF000000000000000;
  }
  outlined consume of Data._Representation?(*(void *)(a1 + 72), *(void *)(a1 + 80));
  *(void *)(a1 + 72) = v28;
  *(void *)(a1 + 80) = v30;
  uint64_t v31 = swift_allocObject();
  *(_OWORD *)(v31 + 16) = xmmword_25C97F8F0;
  *(void *)(v31 + 32) = v4;
  *(void *)(v31 + 40) = v8;
  NSCoder.decodeObject(of:forKey:)();
  swift_bridgeObjectRelease();
  if (v121)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Data]);
    if (swift_dynamicCast())
    {
      uint64_t v32 = v118;
      goto LABEL_35;
    }
  }
  else
  {
    outlined destroy of ClientExperienceSignals?((uint64_t)&v119, (uint64_t *)&demangling cache variable for type metadata for Any?);
  }
  uint64_t v32 = MEMORY[0x263F8EE78];
LABEL_35:
  uint64_t v33 = specialized _arrayForceCast<A, B>(_:)(v32);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 184) = v33;
  uint64_t v34 = NSCoder.decodeObject<A>(of:forKey:)();
  if (v34)
  {
    uint64_t v35 = (void *)v34;
    uint64_t v36 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v38 = v37;
  }
  else
  {
    uint64_t v36 = 0;
    unint64_t v38 = 0xF000000000000000;
  }
  outlined consume of Data._Representation?(*(void *)(a1 + 88), *(void *)(a1 + 96));
  *(void *)(a1 + 88) = v36;
  *(void *)(a1 + 96) = v38;
  uint64_t v39 = swift_allocObject();
  *(_OWORD *)(v39 + 16) = xmmword_25C97F8F0;
  *(void *)(v39 + 32) = v4;
  *(void *)(v39 + 40) = v8;
  NSCoder.decodeObject(of:forKey:)();
  swift_bridgeObjectRelease();
  if (v121)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Data]);
    if (swift_dynamicCast())
    {
      uint64_t v40 = v118;
      goto LABEL_43;
    }
  }
  else
  {
    outlined destroy of ClientExperienceSignals?((uint64_t)&v119, (uint64_t *)&demangling cache variable for type metadata for Any?);
  }
  uint64_t v40 = MEMORY[0x263F8EE78];
LABEL_43:
  uint64_t v41 = specialized _arrayForceCast<A, B>(_:)(v40);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 192) = v41;
  uint64_t v42 = (void *)MEMORY[0x261198B80](0xD000000000000013, 0x800000025C981D90);
  LOBYTE(v41) = objc_msgSend(a2, sel_decodeBoolForKey_, v42);

  *(unsigned char *)(a1 + 104) = v41;
  uint64_t v43 = NSCoder.decodeObject<A>(of:forKey:)();
  if (v43)
  {
    id v44 = (void *)v43;
    uint64_t v45 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v47 = v46;
  }
  else
  {
    uint64_t v45 = 0;
    uint64_t v47 = 0;
  }
  swift_bridgeObjectRelease();
  *(void *)(a1 + 112) = v45;
  *(void *)(a1 + 120) = v47;
  uint64_t v48 = (void *)MEMORY[0x261198B80](0xD000000000000014, 0x800000025C981DB0);
  unsigned __int8 v49 = objc_msgSend(a2, sel_decodeBoolForKey_, v48);

  *(unsigned char *)(a1 + 161) = v49;
  uint64_t v50 = NSCoder.decodeObject<A>(of:forKey:)();
  if (v50)
  {
    uint64_t v51 = (void *)v50;
    uint64_t v52 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v54 = v53;
  }
  else
  {
    uint64_t v52 = 0;
    uint64_t v54 = 0;
  }
  swift_bridgeObjectRelease();
  *(void *)(a1 + 168) = v52;
  *(void *)(a1 + 176) = v54;
  uint64_t v55 = NSCoder.decodeObject<A>(of:forKey:)();
  if (v55)
  {
    uint64_t v56 = (void *)v55;
    uint64_t v57 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v59 = v58;
  }
  else
  {
    uint64_t v57 = 0;
    uint64_t v59 = 0;
  }
  swift_bridgeObjectRelease();
  *(void *)(a1 + 208) = v57;
  *(void *)(a1 + 216) = v59;
  uint64_t v60 = (void *)MEMORY[0x261198B80](0xD000000000000010, 0x800000025C981DF0);
  unsigned __int8 v61 = objc_msgSend(a2, sel_decodeBoolForKey_, v60);

  *(unsigned char *)(a1 + 225) = v61;
  uint64_t v62 = NSCoder.decodeObject<A>(of:forKey:)();
  if (v62)
  {
    uint64_t v63 = (void *)v62;
    uint64_t v64 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v66 = v65;
  }
  else
  {
    uint64_t v64 = 0;
    unint64_t v66 = 0xE000000000000000;
  }
  swift_bridgeObjectRelease();
  *(void *)(a1 + 232) = v64;
  *(void *)(a1 + 240) = v66;
  uint64_t v67 = NSCoder.decodeObject<A>(of:forKey:)();
  if (v67)
  {
    int v68 = (void *)v67;
    uint64_t v69 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v71 = v70;
  }
  else
  {
    uint64_t v69 = 0;
    uint64_t v71 = 0;
  }
  swift_bridgeObjectRelease();
  *(void *)(a1 + 248) = v69;
  *(void *)(a1 + 256) = v71;
  uint64_t v72 = NSCoder.decodeObject<A>(of:forKey:)();
  if (v72)
  {
    uint64_t v73 = (void *)v72;
    uint64_t v74 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v76 = v75;
  }
  else
  {
    uint64_t v74 = 0;
    unint64_t v76 = 0xF000000000000000;
  }
  outlined consume of Data._Representation?(*(void *)(a1 + 264), *(void *)(a1 + 272));
  *(void *)(a1 + 264) = v74;
  *(void *)(a1 + 272) = v76;
  uint64_t v77 = NSCoder.decodeObject<A>(of:forKey:)();
  if (v77)
  {
    uint64_t v78 = (void *)v77;
    uint64_t v79 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v81 = v80;
  }
  else
  {
    uint64_t v79 = 0;
    unint64_t v81 = 0xF000000000000000;
  }
  outlined consume of Data._Representation?(*(void *)(a1 + 280), *(void *)(a1 + 288));
  *(void *)(a1 + 280) = v79;
  *(void *)(a1 + 288) = v81;
  type metadata accessor for NSArray(0, &lazy cache variable for type metadata for SASRecognition);
  uint64_t v82 = NSCoder.decodeObject<A>(of:forKey:)();

  *(void *)(a1 + 296) = v82;
  uint64_t v83 = NSCoder.decodeObject<A>(of:forKey:)();
  if (v83)
  {
    uint64_t v84 = (void *)v83;
    uint64_t v85 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v87 = v86;
  }
  else
  {
    uint64_t v85 = 0;
    uint64_t v87 = 0;
  }
  swift_bridgeObjectRelease();
  *(void *)(a1 + 304) = v85;
  *(void *)(a1 + 312) = v87;
  unint64_t v88 = (void *)MEMORY[0x261198B80](0xD00000000000001ELL, 0x800000025C981E30);
  unsigned __int8 v89 = objc_msgSend(a2, sel_decodeBoolForKey_, v88);

  *(unsigned char *)(a1 + 320) = v89;
  uint64_t v90 = swift_allocObject();
  *(_OWORD *)(v90 + 16) = xmmword_25C97F8F0;
  *(void *)(v90 + 32) = v4;
  *(void *)(v90 + 40) = type metadata accessor for NSArray(0, &lazy cache variable for type metadata for NSNumber);
  NSCoder.decodeObject(of:forKey:)();
  swift_bridgeObjectRelease();
  if (v121)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [NSNumber]);
    if (swift_dynamicCast())
    {
      unint64_t v91 = v118;
      goto LABEL_72;
    }
  }
  else
  {
    outlined destroy of ClientExperienceSignals?((uint64_t)&v119, (uint64_t *)&demangling cache variable for type metadata for Any?);
  }
  unint64_t v91 = MEMORY[0x263F8EE78];
LABEL_72:
  if (v91 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v92 = _CocoaArrayWrapper.endIndex.getter();
    if (v92) {
      goto LABEL_74;
    }
LABEL_87:
    uint64_t v94 = (char *)MEMORY[0x263F8EE78];
    goto LABEL_88;
  }
  uint64_t v92 = *(void *)((v91 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v92) {
    goto LABEL_87;
  }
LABEL_74:
  if (v92 < 1)
  {
    __break(1u);
    JUMPOUT(0x25C919548);
  }
  uint64_t v93 = 0;
  uint64_t v94 = (char *)MEMORY[0x263F8EE78];
  do
  {
    if ((v91 & 0xC000000000000001) != 0) {
      id v95 = (id)MEMORY[0x261198DD0](v93, v91);
    }
    else {
      id v95 = *(id *)(v91 + 8 * v93 + 32);
    }
    uint64_t v96 = v95;
    id v97 = objc_msgSend(v95, sel_integerValue, v116);

    if ((unint64_t)v97 <= 1)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v94 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v94 + 2) + 1, 1, v94);
      }
      unint64_t v99 = *((void *)v94 + 2);
      unint64_t v98 = *((void *)v94 + 3);
      if (v99 >= v98 >> 1) {
        uint64_t v94 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v98 > 1), v99 + 1, 1, v94);
      }
      *((void *)v94 + 2) = v99 + 1;
      v94[v99 + 32] = (char)v97;
    }
    ++v93;
  }
  while (v92 != v93);
LABEL_88:
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 200) = v94;
  uint64_t v100 = NSCoder.decodeObject<A>(of:forKey:)();
  if (!v100
    || (uint64_t v101 = (void *)v100,
        v102._uint64_t countAndFlagsBits = static String._unconditionallyBridgeFromObjectiveC(_:)(),
        PommesSearchReason.init(rawValue:)(v102),
        v101,
        char v103 = v119,
        v119 == 5))
  {
    char v103 = 0;
  }
  *(unsigned char *)(a1 + 224) = v103;
  uint64_t v104 = NSCoder.decodeObject<A>(of:forKey:)();
  if (v104)
  {
    long long v105 = (void *)v104;
    uint64_t v106 = NSCoder.decodeObject<A>(of:forKey:)();
    if (!v106
      || (int v107 = (void *)v106,
          uint64_t v119 = 0,
          uint64_t v120 = 0,
          static String._conditionallyBridgeFromObjectiveC(_:result:)(),
          v107,
          (uint64_t v108 = v120) == 0))
    {

      return;
    }
    uint64_t v109 = v119;
    v122._uint64_t countAndFlagsBits = static String._unconditionallyBridgeFromObjectiveC(_:)();
    switch(specialized PommesCandidateId.CandidateIdType.init(rawValue:)(v122))
    {
      case 1u:
        uint64_t v110 = NSCoder.decodeObject<A>(of:forKey:)();
        if (v110)
        {
          unint64_t v111 = (void *)v110;
          uint64_t v119 = 0;
          uint64_t v120 = 0;
          static String._conditionallyBridgeFromObjectiveC(_:result:)();

          uint64_t v112 = v120;
          if (v120)
          {
            uint64_t v113 = v119;
            outlined consume of PommesCandidateId?(*(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144), *(void *)(a1 + 152), *(unsigned char *)(a1 + 160));
            *(void *)(a1 + 128) = v109;
            *(void *)(a1 + 136) = v108;
            *(void *)(a1 + 144) = v113;
            *(void *)(a1 + 152) = v112;
            *(unsigned char *)(a1 + 160) = 1;
            return;
          }
        }
        else
        {
        }
        swift_bridgeObjectRelease();
        uint64_t v114 = a1;
        outlined consume of PommesCandidateId?(*(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144), *(void *)(a1 + 152), *(unsigned char *)(a1 + 160));
        *(_OWORD *)(a1 + 128) = 0u;
        *(_OWORD *)(a1 + 144) = 0u;
        char v115 = -1;
        goto LABEL_104;
      case 2u:

        uint64_t v114 = a1;
        outlined consume of PommesCandidateId?(*(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144), *(void *)(a1 + 152), *(unsigned char *)(a1 + 160));
        *(void *)(a1 + 128) = v109;
        *(void *)(a1 + 136) = v108;
        *(void *)(a1 + 144) = 0;
        *(void *)(a1 + 152) = 0;
        char v115 = 2;
LABEL_104:
        *(unsigned char *)(v114 + 160) = v115;
        return;
      case 3u:

        swift_bridgeObjectRelease();
        return;
      default:

        outlined consume of PommesCandidateId?(*(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144), *(void *)(a1 + 152), *(unsigned char *)(a1 + 160));
        *(void *)(a1 + 128) = v109;
        *(void *)(a1 + 136) = v108;
        *(void *)(a1 + 144) = 0;
        *(void *)(a1 + 152) = 0;
        *(unsigned char *)(a1 + 160) = 0;
        return;
    }
  }
}

uint64_t specialized _arrayForceCast<A, B>(_:)(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v1, 0);
    uint64_t v2 = v9;
    uint64_t v4 = (unint64_t *)(a1 + 40);
    do
    {
      outlined copy of Data._Representation(*(v4 - 1), *v4);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Data?);
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v2 + 16) + 1, 1);
        uint64_t v2 = v9;
      }
      unint64_t v6 = *(void *)(v2 + 16);
      unint64_t v5 = *(void *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v5 > 1, v6 + 1, 1);
        uint64_t v2 = v9;
      }
      v4 += 2;
      *(void *)(v2 + 16) = v6 + 1;
      *(_OWORD *)(v2 + 16 * v6 + 32) = v8;
      --v1;
    }
    while (v1);
  }
  return v2;
}

void *PommesResponse.__allocating_init(cachingCoder:requestId:pommesCandidateId:componentsWarmedUp:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  outlined init with take of PommesCandidateId?(a4, (uint64_t)v15);
  memset(__src, 0, 24);
  *(void *)&__src[24] = 0xF000000000000000;
  memset(&__src[32], 0, 17);
  memset(&__src[56], 0, 24);
  *(_OWORD *)&__src[80] = xmmword_25C97FEE0;
  *(void *)&__src[96] = 0xF000000000000000;
  __src[104] = 0;
  memset(&__src[112], 0, 48);
  *(_WORD *)&__src[160] = 255;
  memset(&__src[168], 0, 32);
  *(void *)&__src[200] = MEMORY[0x263F8EE78];
  memset(&__src[208], 0, 18);
  memset(&__src[232], 0, 40);
  *(_OWORD *)&__src[272] = xmmword_25C97FEE0;
  *(void *)&__src[288] = 0xF000000000000000;
  memset(&__src[296], 0, 25);
  closure #1 in PommesResponse.init(cachingCoder:requestId:pommesCandidateId:componentsWarmedUp:)((uint64_t)__src, a1, a2, a3, (uint64_t)v15, a5);
  memcpy(__dst, __src, 0x141uLL);
  uint64_t v10 = (void *)(*(uint64_t (**)(unsigned char *))(v5 + 312))(__dst);
  id v11 = v10;

  swift_bridgeObjectRelease();
  outlined release of PommesCandidateId?((uint64_t)v15, (void (*)(void, void, void, void, void))outlined consume of PommesCandidateId?);

  swift_bridgeObjectRelease();
  return v10;
}

void closure #1 in PommesResponse.init(cachingCoder:requestId:pommesCandidateId:componentsWarmedUp:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject.Type>);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_25C97F8F0;
  uint64_t v9 = type metadata accessor for NSArray(0, &lazy cache variable for type metadata for NSArray);
  *(void *)(v8 + 32) = v9;
  *(void *)(v8 + 40) = type metadata accessor for Experience(0);
  NSCoder.decodeObject(of:forKey:)();
  swift_bridgeObjectRelease();
  if (v132)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Experience]);
    if (swift_dynamicCast()) {
      uint64_t v10 = v128;
    }
    else {
      uint64_t v10 = 0;
    }
  }
  else
  {
    outlined destroy of ClientExperienceSignals?((uint64_t)&v129, (uint64_t *)&demangling cache variable for type metadata for Any?);
    uint64_t v10 = 0;
  }
  swift_bridgeObjectRelease();
  *(void *)a1 = v10;
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_25C97F8F0;
  *(void *)(v11 + 32) = v9;
  *(void *)(v11 + 40) = type metadata accessor for PommesResult();
  NSCoder.decodeObject(of:forKey:)();
  swift_bridgeObjectRelease();
  if (v132)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [PommesResult]);
    if (swift_dynamicCast()) {
      uint64_t v12 = v128;
    }
    else {
      uint64_t v12 = 0;
    }
  }
  else
  {
    outlined destroy of ClientExperienceSignals?((uint64_t)&v129, (uint64_t *)&demangling cache variable for type metadata for Any?);
    uint64_t v12 = 0;
  }
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = v12;
  uint64_t v13 = type metadata accessor for NSArray(0, (unint64_t *)&lazy cache variable for type metadata for NSData);
  uint64_t v14 = NSCoder.decodeObject<A>(of:forKey:)();
  if (v14)
  {
    uint64_t v15 = (void *)v14;
    uint64_t v16 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v18 = v17;
  }
  else
  {
    uint64_t v16 = 0;
    unint64_t v18 = 0xF000000000000000;
  }
  outlined consume of Data._Representation?(*(void *)(a1 + 16), *(void *)(a1 + 24));
  *(void *)(a1 + 16) = v16;
  *(void *)(a1 + 24) = v18;
  uint64_t v19 = type metadata accessor for NSArray(0, (unint64_t *)&lazy cache variable for type metadata for NSString);
  uint64_t v20 = NSCoder.decodeObject<A>(of:forKey:)();
  if (v20)
  {
    unsigned __int8 v21 = (void *)v20;
    uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v24 = v23;
  }
  else
  {
    unint64_t v24 = 0xE400000000000000;
    uint64_t v22 = 1701736302;
  }
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = v22;
  *(void *)(a1 + 40) = v24;
  uint64_t v25 = (void *)MEMORY[0x261198B80](0xD000000000000019, 0x800000025C981D10);
  unsigned __int8 v26 = objc_msgSend(a2, sel_decodeBoolForKey_, v25);

  *(unsigned char *)(a1 + 48) = v26;
  uint64_t v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_25C97F8F0;
  *(void *)(v27 + 32) = v9;
  *(void *)(v27 + 40) = v19;
  NSCoder.decodeObject(of:forKey:)();
  swift_bridgeObjectRelease();
  if (v132)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
    if (swift_dynamicCast())
    {
      uint64_t v28 = v128;
      goto LABEL_22;
    }
  }
  else
  {
    outlined destroy of ClientExperienceSignals?((uint64_t)&v129, (uint64_t *)&demangling cache variable for type metadata for Any?);
  }
  uint64_t v28 = MEMORY[0x263F8EE78];
LABEL_22:
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = v28;
  uint64_t v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = xmmword_25C97F8F0;
  *(void *)(v29 + 32) = v9;
  *(void *)(v29 + 40) = v19;
  NSCoder.decodeObject(of:forKey:)();
  swift_bridgeObjectRelease();
  if (v132)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
    if (swift_dynamicCast())
    {
      uint64_t v30 = v128;
      goto LABEL_27;
    }
  }
  else
  {
    outlined destroy of ClientExperienceSignals?((uint64_t)&v129, (uint64_t *)&demangling cache variable for type metadata for Any?);
  }
  uint64_t v30 = MEMORY[0x263F8EE78];
LABEL_27:
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = v30;
  uint64_t v31 = NSCoder.decodeObject<A>(of:forKey:)();
  if (v31)
  {
    uint64_t v32 = (void *)v31;
    uint64_t v33 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v35 = v34;
  }
  else
  {
    uint64_t v33 = 0;
    unint64_t v35 = 0xF000000000000000;
  }
  outlined consume of Data._Representation?(*(void *)(a1 + 72), *(void *)(a1 + 80));
  *(void *)(a1 + 72) = v33;
  *(void *)(a1 + 80) = v35;
  uint64_t v36 = swift_allocObject();
  *(_OWORD *)(v36 + 16) = xmmword_25C97F8F0;
  *(void *)(v36 + 32) = v9;
  *(void *)(v36 + 40) = v13;
  NSCoder.decodeObject(of:forKey:)();
  swift_bridgeObjectRelease();
  if (v132)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Data]);
    if (swift_dynamicCast())
    {
      uint64_t v37 = v128;
      goto LABEL_35;
    }
  }
  else
  {
    outlined destroy of ClientExperienceSignals?((uint64_t)&v129, (uint64_t *)&demangling cache variable for type metadata for Any?);
  }
  uint64_t v37 = MEMORY[0x263F8EE78];
LABEL_35:
  uint64_t v38 = specialized _arrayForceCast<A, B>(_:)(v37);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 184) = v38;
  uint64_t v39 = NSCoder.decodeObject<A>(of:forKey:)();
  if (v39)
  {
    uint64_t v40 = (void *)v39;
    uint64_t v41 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v43 = v42;
  }
  else
  {
    uint64_t v41 = 0;
    unint64_t v43 = 0xF000000000000000;
  }
  outlined consume of Data._Representation?(*(void *)(a1 + 88), *(void *)(a1 + 96));
  *(void *)(a1 + 88) = v41;
  *(void *)(a1 + 96) = v43;
  uint64_t v44 = swift_allocObject();
  *(_OWORD *)(v44 + 16) = xmmword_25C97F8F0;
  *(void *)(v44 + 32) = v9;
  *(void *)(v44 + 40) = v13;
  NSCoder.decodeObject(of:forKey:)();
  swift_bridgeObjectRelease();
  if (v132)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Data]);
    if (swift_dynamicCast())
    {
      uint64_t v45 = v128;
      goto LABEL_43;
    }
  }
  else
  {
    outlined destroy of ClientExperienceSignals?((uint64_t)&v129, (uint64_t *)&demangling cache variable for type metadata for Any?);
  }
  uint64_t v45 = MEMORY[0x263F8EE78];
LABEL_43:
  uint64_t v46 = specialized _arrayForceCast<A, B>(_:)(v45);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 192) = v46;
  uint64_t v47 = (void *)MEMORY[0x261198B80](0xD000000000000013, 0x800000025C981D90);
  LOBYTE(v46) = objc_msgSend(a2, sel_decodeBoolForKey_, v47);

  *(unsigned char *)(a1 + 104) = v46;
  uint64_t v48 = (void *)MEMORY[0x261198B80](0xD000000000000014, 0x800000025C981DB0);
  LOBYTE(v46) = objc_msgSend(a2, sel_decodeBoolForKey_, v48);

  *(unsigned char *)(a1 + 161) = v46;
  uint64_t v49 = NSCoder.decodeObject<A>(of:forKey:)();
  if (v49)
  {
    uint64_t v50 = (void *)v49;
    uint64_t v51 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v53 = v52;
  }
  else
  {
    uint64_t v51 = 0;
    uint64_t v53 = 0;
  }
  swift_bridgeObjectRelease();
  *(void *)(a1 + 168) = v51;
  *(void *)(a1 + 176) = v53;
  uint64_t v54 = NSCoder.decodeObject<A>(of:forKey:)();
  if (v54)
  {
    uint64_t v55 = (void *)v54;
    uint64_t v56 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v58 = v57;
  }
  else
  {
    uint64_t v56 = 0;
    uint64_t v58 = 0;
  }
  swift_bridgeObjectRelease();
  *(void *)(a1 + 208) = v56;
  *(void *)(a1 + 216) = v58;
  uint64_t v59 = NSCoder.decodeObject<A>(of:forKey:)();
  if (v59)
  {
    uint64_t v60 = (void *)v59;
    uint64_t v61 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v63 = v62;
  }
  else
  {
    uint64_t v61 = 0;
    unint64_t v63 = 0xE000000000000000;
  }
  swift_bridgeObjectRelease();
  *(void *)(a1 + 232) = v61;
  *(void *)(a1 + 240) = v63;
  uint64_t v64 = NSCoder.decodeObject<A>(of:forKey:)();
  if (v64)
  {
    unint64_t v65 = (void *)v64;
    uint64_t v66 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v68 = v67;
  }
  else
  {
    uint64_t v66 = 0;
    uint64_t v68 = 0;
  }
  swift_bridgeObjectRelease();
  *(void *)(a1 + 248) = v66;
  *(void *)(a1 + 256) = v68;
  uint64_t v69 = NSCoder.decodeObject<A>(of:forKey:)();
  if (v69)
  {
    uint64_t v70 = (void *)v69;
    uint64_t v71 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v73 = v72;
  }
  else
  {
    uint64_t v71 = 0;
    unint64_t v73 = 0xF000000000000000;
  }
  outlined consume of Data._Representation?(*(void *)(a1 + 264), *(void *)(a1 + 272));
  *(void *)(a1 + 264) = v71;
  *(void *)(a1 + 272) = v73;
  uint64_t v74 = NSCoder.decodeObject<A>(of:forKey:)();
  if (v74)
  {
    unint64_t v75 = (void *)v74;
    uint64_t v76 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v78 = v77;
  }
  else
  {
    uint64_t v76 = 0;
    unint64_t v78 = 0xF000000000000000;
  }
  outlined consume of Data._Representation?(*(void *)(a1 + 280), *(void *)(a1 + 288));
  *(void *)(a1 + 280) = v76;
  *(void *)(a1 + 288) = v78;
  type metadata accessor for NSArray(0, &lazy cache variable for type metadata for SASRecognition);
  uint64_t v79 = NSCoder.decodeObject<A>(of:forKey:)();

  *(void *)(a1 + 296) = v79;
  uint64_t v80 = NSCoder.decodeObject<A>(of:forKey:)();
  if (v80)
  {
    unint64_t v81 = (void *)v80;
    uint64_t v82 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v84 = v83;
  }
  else
  {
    uint64_t v82 = 0;
    uint64_t v84 = 0;
  }
  swift_bridgeObjectRelease();
  *(void *)(a1 + 304) = v82;
  *(void *)(a1 + 312) = v84;
  uint64_t v85 = (void *)MEMORY[0x261198B80](0xD00000000000001ELL, 0x800000025C981E30);
  unsigned __int8 v86 = objc_msgSend(a2, sel_decodeBoolForKey_, v85);

  *(unsigned char *)(a1 + 320) = v86;
  uint64_t v87 = NSCoder.decodeObject<A>(of:forKey:)();
  if (!v87
    || (unint64_t v88 = (void *)v87,
        v89._uint64_t countAndFlagsBits = static String._unconditionallyBridgeFromObjectiveC(_:)(),
        PommesSearchReason.init(rawValue:)(v89),
        v88,
        char v90 = v129,
        v129 == 5))
  {
    char v90 = 0;
  }
  *(unsigned char *)(a1 + 224) = v90;
  *(void *)(a1 + 112) = a3;
  *(void *)(a1 + 120) = a4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v91 = *(void *)(a1 + 128);
  uint64_t v92 = *(void *)(a1 + 136);
  uint64_t v93 = a1 + 128;
  uint64_t v94 = *(void *)(v93 + 16);
  uint64_t v95 = *(void *)(v93 + 24);
  char v96 = *(unsigned char *)(v93 + 32);
  outlined init with take of PommesCandidateId?(a5, v93);
  outlined release of PommesCandidateId?(a5, (void (*)(void, void, void, void, void))outlined copy of PommesCandidateId?);
  outlined consume of PommesCandidateId?(v91, v92, v94, v95, v96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v93 + 72) = a6;
  *(unsigned char *)(v93 + 97) = 1;
  uint64_t v97 = NSCoder.decodeObject<A>(of:forKey:)();
  if (v97)
  {
    unint64_t v98 = (void *)v97;
    uint64_t v99 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v101 = v100;
  }
  else
  {
    uint64_t v99 = 0;
    uint64_t v101 = 0;
  }
  closure #1 in closure #1 in PommesResponse.init(cachingCoder:requestId:pommesCandidateId:componentsWarmedUp:)((uint64_t)&v129);
  uint64_t v103 = v129;
  uint64_t v102 = v130;
  uint64_t v105 = v131;
  uint64_t v104 = v132;
  char v106 = v133;
  if (one-time initialization token for pommes != -1) {
    swift_once();
  }
  uint64_t v107 = type metadata accessor for Logger();
  __swift_project_value_buffer(v107, (uint64_t)static Logger.pommes);
  swift_bridgeObjectRetain();
  outlined copy of PommesCandidateId?(v103, v102, v105, v104, v106);
  uint64_t v108 = Logger.logObject.getter();
  os_log_type_t v109 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v108, v109))
  {
    char v123 = v106;
    uint64_t v110 = a2;
    uint64_t v111 = v99;
    uint64_t v112 = swift_slowAlloc();
    uint64_t v127 = swift_slowAlloc();
    uint64_t v128 = v127;
    uint64_t v129 = v111;
    *(_DWORD *)uint64_t v112 = 136315394;
    a2 = v110;
    uint64_t v130 = v101;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for String?);
    uint64_t v113 = String.init<A>(describing:)();
    uint64_t v129 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v113, v114, &v128);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v112 + 12) = 2080;
    uint64_t v129 = v103;
    uint64_t v130 = v102;
    uint64_t v131 = v105;
    uint64_t v132 = v104;
    char v133 = v123;
    outlined copy of PommesCandidateId?(v103, v102, v105, v104, v123);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PommesCandidateId?);
    uint64_t v115 = String.init<A>(describing:)();
    uint64_t v129 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v115, v116, &v128);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    outlined consume of PommesCandidateId?(v103, v102, v105, v104, v123);
    outlined consume of PommesCandidateId?(v103, v102, v105, v104, v123);
    _os_log_impl(&dword_25C8FE000, v108, v109, "PommesResponse : Cached response constructed from:\n  requestId = %s\n  pommesCandidateId = %s", (uint8_t *)v112, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x261199590](v127, -1, -1);
    MEMORY[0x261199590](v112, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    outlined consume of PommesCandidateId?(v103, v102, v105, v104, v106);
    outlined consume of PommesCandidateId?(v103, v102, v105, v104, v106);
  }

  unint64_t v117 = (void *)MEMORY[0x261198B80](0xD000000000000010, 0x800000025C981DF0);
  unsigned int v118 = objc_msgSend(a2, sel_decodeBoolForKey_, v117);

  if (v118)
  {
    uint64_t v119 = Logger.logObject.getter();
    os_log_type_t v120 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v119, v120))
    {
      uint64_t v121 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v121 = 0;
      _os_log_impl(&dword_25C8FE000, v119, v120, "PommesResponse : A cached response should not be cached", v121, 2u);
      MEMORY[0x261199590](v121, -1, -1);
    }
  }
}

void closure #1 in closure #1 in PommesResponse.init(cachingCoder:requestId:pommesCandidateId:componentsWarmedUp:)(uint64_t a1@<X8>)
{
  type metadata accessor for NSArray(0, (unint64_t *)&lazy cache variable for type metadata for NSString);
  uint64_t v2 = NSCoder.decodeObject<A>(of:forKey:)();
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    uint64_t v4 = NSCoder.decodeObject<A>(of:forKey:)();
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      static String._conditionallyBridgeFromObjectiveC(_:result:)();
    }
  }
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(unsigned char *)(a1 + 32) = -1;
}

Swift::Void __swiftcall PommesResponse.encode(with:)(NSCoder with)
{
  uint64_t v2 = v1;
  uint64_t v4 = (void *)MEMORY[0x263F8EED0];
  (*(void (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x140))();
  type metadata accessor for Experience(0);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  unint64_t v6 = (void *)MEMORY[0x261198B80](0x6E65697265707865, 0xEB00000000736563);
  [(objc_class *)with.super.isa encodeObject:isa forKey:v6];

  (*(void (**)(void))((*v4 & *v2) + 0x158))();
  type metadata accessor for PommesResult();
  Class v7 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  uint64_t v8 = (void *)MEMORY[0x261198B80](0x6552746E65696C63, 0xED000073746C7573);
  [(objc_class *)with.super.isa encodeObject:v7 forKey:v8];

  unint64_t v9 = *(void *)((char *)v2 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_conversationContext + 8);
  if (v9 >> 60 != 15)
  {
    uint64_t v10 = *(void *)((char *)v2 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_conversationContext);
    id v11 = objc_allocWithZone(MEMORY[0x263EFF8F8]);
    outlined copy of Data._Representation(v10, v9);
    Class v12 = Data._bridgeToObjectiveC()().super.isa;
    id v13 = objc_msgSend(v11, sel_initWithData_, v12);

    uint64_t v14 = (void *)MEMORY[0x261198B80](0xD000000000000013, 0x800000025C981F70);
    [(objc_class *)with.super.isa encodeObject:v13 forKey:v14];

    outlined consume of Data._Representation?(v10, v9);
  }
  uint64_t v15 = (void *)MEMORY[0x261198B80](*(void *)((char *)v2 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_metadataDomainName), *(void *)((char *)v2 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_metadataDomainName+ 8));
  uint64_t v16 = (void *)MEMORY[0x261198B80]();
  [(objc_class *)with.super.isa encodeObject:v15 forKey:v16];

  uint64_t v17 = *((unsigned __int8 *)v2 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_metadataFallbackTriggered);
  unint64_t v18 = (void *)MEMORY[0x261198B80](0xD000000000000019, 0x800000025C981D10);
  [(objc_class *)with.super.isa encodeBool:v17 forKey:v18];

  uint64_t v19 = (void *)MEMORY[0x263F8EED0];
  (*(void (**)(void))((*MEMORY[0x263F8EED0] & *v2) + 0x170))();
  Class v20 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  unsigned __int8 v21 = (void *)MEMORY[0x261198B80](0x64657265646E6572, 0xED00007374786554);
  [(objc_class *)with.super.isa encodeObject:v20 forKey:v21];

  (*(void (**)(void))((*v19 & *v2) + 0x188))();
  Class v22 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  unint64_t v23 = (void *)MEMORY[0x261198B80]();
  [(objc_class *)with.super.isa encodeObject:v22 forKey:v23];

  uint64_t v24 = (*(uint64_t (**)(void))((*v19 & *v2) + 0x1A0))();
  if (v25 >> 60 != 15)
  {
    uint64_t v26 = v24;
    unint64_t v27 = v25;
    id v28 = objc_allocWithZone(MEMORY[0x263EFF8F8]);
    Class v29 = Data._bridgeToObjectiveC()().super.isa;
    id v30 = objc_msgSend(v28, sel_initWithData_, v29);

    uint64_t v31 = (void *)MEMORY[0x261198B80](0xD000000000000018, 0x800000025C981F50);
    [(objc_class *)with.super.isa encodeObject:v30 forKey:v31];

    uint64_t v24 = outlined consume of Data._Representation?(v26, v27);
  }
  uint64_t v32 = (void *)MEMORY[0x263F8EED0];
  (*(void (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v2) + 0x1B8))(v24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Data?);
  Class v33 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  unint64_t v34 = (void *)MEMORY[0x261198B80](0x706574536B736174, 0xEC00000073676F4CLL);
  [(objc_class *)with.super.isa encodeObject:v33 forKey:v34];

  uint64_t v35 = (*(uint64_t (**)(void))((*v32 & *v2) + 0x1D0))();
  if (v36 >> 60 != 15)
  {
    uint64_t v37 = v35;
    unint64_t v38 = v36;
    id v39 = objc_allocWithZone(MEMORY[0x263EFF8F8]);
    Class v40 = Data._bridgeToObjectiveC()().super.isa;
    id v41 = objc_msgSend(v39, sel_initWithData_, v40);

    unint64_t v42 = (void *)MEMORY[0x261198B80](0xD000000000000022, 0x800000025C981F20);
    [(objc_class *)with.super.isa encodeObject:v41 forKey:v42];

    uint64_t v35 = outlined consume of Data._Representation?(v37, v38);
  }
  (*(void (**)(uint64_t))((*v32 & *v2) + 0x1E8))(v35);
  Class v43 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  uint64_t v44 = MEMORY[0x261198B80](0xD000000000000016, 0x800000025C981D70);
  [(objc_class *)with.super.isa encodeObject:v43 forKey:v44];

  LOBYTE(v44) = (*(uint64_t (**)(void))((*v32 & *v2) + 0x200))();
  uint64_t v45 = (void *)MEMORY[0x261198B80]();
  unint64_t v46 = 0x2654E2000uLL;
  [(objc_class *)with.super.isa encodeBool:v44 & 1 forKey:v45];

  if (*(void *)((char *)v2 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_requestId + 8))
  {
    uint64_t v47 = (void *)MEMORY[0x261198B80](*(void *)((char *)v2
                                                + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_requestId));
    uint64_t v48 = (void *)MEMORY[0x261198B80](0x4974736575716572, 0xE900000000000064);
    [(objc_class *)with.super.isa encodeObject:v47 forKey:v48];
  }
  uint64_t v49 = *((unsigned __int8 *)v2 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_isHandledByPreflight);
  uint64_t v50 = (void *)MEMORY[0x261198B80](0xD000000000000014, 0x800000025C981DB0);
  [(objc_class *)with.super.isa encodeBool:v49 forKey:v50];

  if (*(void *)((char *)v2
                 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_preflightClientHandlerIdentifier
                 + 8))
  {
    uint64_t v51 = (void *)MEMORY[0x261198B80](*(void *)((char *)v2
                                                + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_preflightClientHandlerIdentifier));
    uint64_t v52 = (void *)MEMORY[0x261198B80](0xD000000000000020, 0x800000025C981EF0);
    [(objc_class *)with.super.isa encodeObject:v51 forKey:v52];
  }
  uint64_t v53 = *(void *)((char *)v2 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_componentsWarmedUp);
  uint64_t v54 = *(void *)(v53 + 16);
  if (v54)
  {
    uint64_t v104 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    specialized ContiguousArray.reserveCapacity(_:)();
    uint64_t v55 = 0;
    do
    {
      uint64_t v56 = v55 + 1;
      objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, *(unsigned __int8 *)(v53 + v55 + 32));
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
      uint64_t v55 = v56;
    }
    while (v54 != v56);
    swift_bridgeObjectRelease();
    unint64_t v46 = 0x2654E2000;
  }
  type metadata accessor for NSArray(0, &lazy cache variable for type metadata for NSNumber);
  Class v57 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  uint64_t v58 = (void *)MEMORY[0x261198B80](0xD000000000000012, 0x800000025C981DD0);
  [(objc_class *)with.super.isa encodeObject:v57 forKey:v58];

  uint64_t v59 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v2) + 0x228))();
  if (v60)
  {
    uint64_t v61 = (void *)MEMORY[0x261198B80](v59);
    swift_bridgeObjectRelease();
    unint64_t v62 = (void *)MEMORY[0x261198B80](0xD000000000000012, 0x800000025C981ED0);
    [(objc_class *)with.super.isa encodeObject:v61 forKey:v62];
  }
  (*(void (**)(char *__return_ptr, uint64_t))((*MEMORY[0x263F8EED0] & *v2) + 0x240))(&v103, v59);
  unint64_t v63 = 0x800000025C981390;
  unint64_t v64 = 0xD000000000000016;
  switch(v103)
  {
    case 1:
      unint64_t v63 = 0xEF65737261506E69;
      unint64_t v64 = 0x616D6F446F666E69;
      break;
    case 2:
      unint64_t v63 = 0xEF6B6361626C6C61;
      unint64_t v64 = 0x4665737261506F6ELL;
      break;
    case 3:
      break;
    case 4:
      unint64_t v64 = 0xD000000000000010;
      unint64_t v63 = 0x800000025C9813B0;
      break;
    default:
      unint64_t v63 = 0xE700000000000000;
      unint64_t v64 = 0x6E776F6E6B6E75;
      break;
  }
  unint64_t v65 = (void *)MEMORY[0x261198B80](v64, v63);
  swift_bridgeObjectRelease();
  uint64_t v66 = (void *)MEMORY[0x261198B80](0x6552686372616573, 0xEC0000006E6F7361);
  [(objc_class *)with.super.isa encodeObject:v65 forKey:v66];

  uint64_t v68 = *(void *)((char *)v2 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_pommesCandidateId);
  uint64_t v67 = *(void *)((char *)v2 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_pommesCandidateId + 8);
  uint64_t v69 = *(void *)((char *)v2 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_pommesCandidateId + 16);
  uint64_t v70 = *(void *)((char *)v2 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_pommesCandidateId + 24);
  unsigned int v71 = *((unsigned __int8 *)v2 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_pommesCandidateId + 32);
  if (v71 > 1)
  {
    if (v71 != 2) {
      goto LABEL_32;
    }
    unint64_t v72 = 0xE900000000000073;
    uint64_t v73 = 0x656D6D6F506E7572;
  }
  else if (*((unsigned char *)v2 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_pommesCandidateId + 32))
  {
    unint64_t v72 = 0xE500000000000000;
    uint64_t v73 = 0x636F64656DLL;
  }
  else
  {
    unint64_t v72 = 0xE200000000000000;
    uint64_t v73 = 25458;
  }
  uint64_t v74 = (void *)MEMORY[0x261198B80](v73, v72);
  swift_bridgeObjectRelease();
  unint64_t v75 = (void *)MEMORY[0x261198B80](0x74616469646E6163, 0xEF65707954644965);
  [(objc_class *)with.super.isa encodeObject:v74 forKey:v75];

  if (v71 == 1)
  {
    uint64_t v76 = (void *)MEMORY[0x261198B80](v68, v67);
    unint64_t v77 = (void *)MEMORY[0x261198B80](0x74616469646E6163, 0xEB00000000644965);
    [(objc_class *)with.super.isa encodeObject:v76 forKey:v77];

    unint64_t v78 = (void *)MEMORY[0x261198B80](v69, v70);
    uint64_t v79 = (void *)MEMORY[0x261198B80](0x6449756374, 0xE500000000000000);
  }
  else
  {
    unint64_t v78 = (void *)MEMORY[0x261198B80](v68, v67);
    uint64_t v79 = (void *)MEMORY[0x261198B80](0x74616469646E6163, 0xEB00000000644965);
  }
  [(objc_class *)with.super.isa encodeObject:v78 forKey:v79];
  unint64_t v46 = 0x2654E2000uLL;

LABEL_32:
  uint64_t v80 = *((unsigned __int8 *)v2 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_isCachedResponse);
  unint64_t v81 = (void *)MEMORY[0x261198B80](0xD000000000000010, 0x800000025C981DF0);
  objc_msgSend(with.super.isa, *(SEL *)(v46 + 3920), v80, v81);

  uint64_t v82 = (void *)MEMORY[0x261198B80](*(void *)((char *)v2 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_searchRequestUtterance), *(void *)((char *)v2+ OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_searchRequestUtterance+ 8));
  uint64_t v83 = (void *)MEMORY[0x261198B80](0xD000000000000016, 0x800000025C981E10);
  [(objc_class *)with.super.isa encodeObject:v82 forKey:v83];

  if (*(void *)((char *)v2 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_sharedUserId + 8))
  {
    uint64_t v84 = (void *)MEMORY[0x261198B80](*(void *)((char *)v2
                                                + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_sharedUserId));
    uint64_t v85 = (void *)MEMORY[0x261198B80](0x7355646572616873, 0xEC00000064497265);
    [(objc_class *)with.super.isa encodeObject:v84 forKey:v85];
  }
  unsigned __int8 v86 = (void *)((char *)v2 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_encodedNLUserParses);
  unint64_t v87 = *(void *)((char *)v2 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_encodedNLUserParses + 8);
  if (v87 >> 60 != 15)
  {
    uint64_t v88 = *v86;
    outlined copy of Data._Representation(*v86, *(void *)((char *)v2 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_encodedNLUserParses + 8));
    Class v89 = Data._bridgeToObjectiveC()().super.isa;
    char v90 = (void *)MEMORY[0x261198B80](0xD000000000000013, 0x800000025C981EA0);
    [(objc_class *)with.super.isa encodeObject:v89 forKey:v90];

    outlined consume of Data._Representation?(v88, v87);
  }
  uint64_t v91 = (void *)((char *)v2 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_encodedNLFallbackParse);
  unint64_t v92 = *(void *)((char *)v2 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_encodedNLFallbackParse + 8);
  if (v92 >> 60 != 15)
  {
    uint64_t v93 = *v91;
    outlined copy of Data._Representation(*v91, *(void *)((char *)v2 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_encodedNLFallbackParse + 8));
    Class v94 = Data._bridgeToObjectiveC()().super.isa;
    uint64_t v95 = (void *)MEMORY[0x261198B80](0xD000000000000016, 0x800000025C981E80);
    [(objc_class *)with.super.isa encodeObject:v94 forKey:v95];

    outlined consume of Data._Representation?(v93, v92);
  }
  char v96 = *(void **)((char *)v2 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_asrRecognition);
  if (v96)
  {
    id v97 = v96;
    unint64_t v98 = (void *)MEMORY[0x261198B80](0x676F636552727361, 0xEE006E6F6974696ELL);
    [(objc_class *)with.super.isa encodeObject:v97 forKey:v98];
  }
  if (*(void *)((char *)v2 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_responseVariantResult + 8))
  {
    uint64_t v99 = (void *)MEMORY[0x261198B80](*(void *)((char *)v2
                                                + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_responseVariantResult));
    uint64_t v100 = (void *)MEMORY[0x261198B80](0xD000000000000015, 0x800000025C981E50);
    [(objc_class *)with.super.isa encodeObject:v99 forKey:v100];
  }
  uint64_t v101 = *((unsigned __int8 *)v2 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_isLowConfidenceKnowledgeResult);
  id v102 = (id)MEMORY[0x261198B80](0xD00000000000001ELL, 0x800000025C981E30);
  objc_msgSend(with.super.isa, *(SEL *)(v46 + 3920), v101, v102);
}

Swift::Void __swiftcall PommesResponse.encode(cachingCoder:)(NSCoder cachingCoder)
{
  uint64_t v3 = (void *)MEMORY[0x263F8EED0];
  (*(void (**)(void))((*MEMORY[0x263F8EED0] & *v1) + 0x140))();
  type metadata accessor for Experience(0);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  uint64_t v5 = (void *)MEMORY[0x261198B80](0x6E65697265707865, 0xEB00000000736563);
  [(objc_class *)cachingCoder.super.isa encodeObject:isa forKey:v5];

  (*(void (**)(void))((*v3 & *v1) + 0x158))();
  type metadata accessor for PommesResult();
  Class v6 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  Class v7 = (void *)MEMORY[0x261198B80](0x6552746E65696C63, 0xED000073746C7573);
  [(objc_class *)cachingCoder.super.isa encodeObject:v6 forKey:v7];

  unint64_t v8 = *(void *)((char *)v1 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_conversationContext + 8);
  if (v8 >> 60 != 15)
  {
    uint64_t v9 = *(void *)((char *)v1 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_conversationContext);
    id v10 = objc_allocWithZone(MEMORY[0x263EFF8F8]);
    outlined copy of Data._Representation(v9, v8);
    Class v11 = Data._bridgeToObjectiveC()().super.isa;
    id v12 = objc_msgSend(v10, sel_initWithData_, v11);

    id v13 = (void *)MEMORY[0x261198B80](0xD000000000000013, 0x800000025C981F70);
    [(objc_class *)cachingCoder.super.isa encodeObject:v12 forKey:v13];

    outlined consume of Data._Representation?(v9, v8);
  }
  uint64_t v14 = (void *)MEMORY[0x261198B80](*(void *)((char *)v1 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_metadataDomainName), *(void *)((char *)v1 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_metadataDomainName+ 8));
  uint64_t v15 = (void *)MEMORY[0x261198B80](0xD000000000000012, 0x800000025C981CF0);
  [(objc_class *)cachingCoder.super.isa encodeObject:v14 forKey:v15];

  uint64_t v16 = *((unsigned __int8 *)v1 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_metadataFallbackTriggered);
  uint64_t v17 = (void *)MEMORY[0x261198B80](0xD000000000000019, 0x800000025C981D10);
  [(objc_class *)cachingCoder.super.isa encodeBool:v16 forKey:v17];

  (*(void (**)(void))((*v3 & *v1) + 0x170))();
  Class v18 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  uint64_t v19 = (void *)MEMORY[0x261198B80](0x64657265646E6572, 0xED00007374786554);
  [(objc_class *)cachingCoder.super.isa encodeObject:v18 forKey:v19];

  (*(void (**)(void))((*v3 & *v1) + 0x188))();
  Class v20 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  unsigned __int8 v21 = (void *)MEMORY[0x261198B80](0xD000000000000015, 0x800000025C981D40);
  [(objc_class *)cachingCoder.super.isa encodeObject:v20 forKey:v21];

  uint64_t v22 = (*(uint64_t (**)(void))((*v3 & *v1) + 0x1A0))();
  if (v23 >> 60 != 15)
  {
    uint64_t v24 = v22;
    unint64_t v25 = v23;
    id v26 = objc_allocWithZone(MEMORY[0x263EFF8F8]);
    Class v27 = Data._bridgeToObjectiveC()().super.isa;
    id v28 = objc_msgSend(v26, sel_initWithData_, v27);

    Class v29 = (void *)MEMORY[0x261198B80](0xD000000000000018, 0x800000025C981F50);
    [(objc_class *)cachingCoder.super.isa encodeObject:v28 forKey:v29];

    uint64_t v22 = outlined consume of Data._Representation?(v24, v25);
  }
  (*(void (**)(uint64_t))((*v3 & *v1) + 0x1B8))(v22);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Data?);
  Class v30 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  uint64_t v31 = (void *)MEMORY[0x261198B80](0x706574536B736174, 0xEC00000073676F4CLL);
  [(objc_class *)cachingCoder.super.isa encodeObject:v30 forKey:v31];

  uint64_t v32 = (*(uint64_t (**)(void))((*v3 & *v1) + 0x1D0))();
  if (v33 >> 60 != 15)
  {
    uint64_t v34 = v32;
    unint64_t v35 = v33;
    id v36 = objc_allocWithZone(MEMORY[0x263EFF8F8]);
    Class v37 = Data._bridgeToObjectiveC()().super.isa;
    id v38 = objc_msgSend(v36, sel_initWithData_, v37);

    id v39 = (void *)MEMORY[0x261198B80](0xD000000000000022, 0x800000025C981F20);
    [(objc_class *)cachingCoder.super.isa encodeObject:v38 forKey:v39];

    uint64_t v32 = outlined consume of Data._Representation?(v34, v35);
  }
  (*(void (**)(uint64_t))((*v3 & *v1) + 0x1E8))(v32);
  Class v40 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v41 = (void *)MEMORY[0x261198B80](0xD000000000000016, 0x800000025C981D70);
  [(objc_class *)cachingCoder.super.isa encodeObject:v40 forKey:v41];

  LOBYTE(v40) = (*(uint64_t (**)(void))((*v3 & *v1) + 0x200))();
  unint64_t v42 = (void *)MEMORY[0x261198B80](0xD000000000000013, 0x800000025C981D90);
  [(objc_class *)cachingCoder.super.isa encodeBool:v40 & 1 forKey:v42];

  uint64_t v43 = *((unsigned __int8 *)v1 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_isHandledByPreflight);
  uint64_t v44 = (void *)MEMORY[0x261198B80](0xD000000000000014, 0x800000025C981DB0);
  [(objc_class *)cachingCoder.super.isa encodeBool:v43 forKey:v44];

  if (*(void *)((char *)v1
                 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_preflightClientHandlerIdentifier
                 + 8))
  {
    uint64_t v45 = (void *)MEMORY[0x261198B80](*(void *)((char *)v1
                                                + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_preflightClientHandlerIdentifier));
    unint64_t v46 = (void *)MEMORY[0x261198B80](0xD000000000000020, 0x800000025C981EF0);
    [(objc_class *)cachingCoder.super.isa encodeObject:v45 forKey:v46];
  }
  uint64_t v47 = (*(uint64_t (**)(void))((*v3 & *v1) + 0x228))();
  if (v48)
  {
    uint64_t v49 = (void *)MEMORY[0x261198B80](v47);
    swift_bridgeObjectRelease();
    uint64_t v50 = (void *)MEMORY[0x261198B80](0xD000000000000012, 0x800000025C981ED0);
    [(objc_class *)cachingCoder.super.isa encodeObject:v49 forKey:v50];
  }
  uint64_t v51 = (void *)MEMORY[0x261198B80](*(void *)((char *)v1 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_searchRequestUtterance), *(void *)((char *)v1+ OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_searchRequestUtterance+ 8));
  uint64_t v52 = (void *)MEMORY[0x261198B80](0xD000000000000016, 0x800000025C981E10);
  [(objc_class *)cachingCoder.super.isa encodeObject:v51 forKey:v52];

  if (*(void *)((char *)v1 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_sharedUserId + 8))
  {
    uint64_t v53 = (void *)MEMORY[0x261198B80](*(void *)((char *)v1
                                                + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_sharedUserId));
    uint64_t v54 = (void *)MEMORY[0x261198B80](0x7355646572616873, 0xEC00000064497265);
    [(objc_class *)cachingCoder.super.isa encodeObject:v53 forKey:v54];
  }
  uint64_t v55 = (void *)((char *)v1 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_encodedNLUserParses);
  unint64_t v56 = *(void *)((char *)v1 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_encodedNLUserParses + 8);
  if (v56 >> 60 != 15)
  {
    uint64_t v57 = *v55;
    outlined copy of Data._Representation(*v55, *(void *)((char *)v1 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_encodedNLUserParses + 8));
    Class v58 = Data._bridgeToObjectiveC()().super.isa;
    uint64_t v59 = (void *)MEMORY[0x261198B80](0xD000000000000013, 0x800000025C981EA0);
    [(objc_class *)cachingCoder.super.isa encodeObject:v58 forKey:v59];

    outlined consume of Data._Representation?(v57, v56);
  }
  uint64_t v60 = (void *)((char *)v1 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_encodedNLFallbackParse);
  unint64_t v61 = *(void *)((char *)v1 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_encodedNLFallbackParse + 8);
  if (v61 >> 60 != 15)
  {
    uint64_t v62 = *v60;
    outlined copy of Data._Representation(*v60, *(void *)((char *)v1 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_encodedNLFallbackParse + 8));
    Class v63 = Data._bridgeToObjectiveC()().super.isa;
    unint64_t v64 = (void *)MEMORY[0x261198B80](0xD000000000000016, 0x800000025C981E80);
    [(objc_class *)cachingCoder.super.isa encodeObject:v63 forKey:v64];

    outlined consume of Data._Representation?(v62, v61);
  }
  unint64_t v65 = *(void **)((char *)v1 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_asrRecognition);
  if (v65)
  {
    id v66 = v65;
    uint64_t v67 = (void *)MEMORY[0x261198B80](0x676F636552727361, 0xEE006E6F6974696ELL);
    [(objc_class *)cachingCoder.super.isa encodeObject:v66 forKey:v67];
  }
  if (*(void *)((char *)v1 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_responseVariantResult + 8))
  {
    uint64_t v68 = (void *)MEMORY[0x261198B80](*(void *)((char *)v1
                                                + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_responseVariantResult));
    uint64_t v69 = (void *)MEMORY[0x261198B80](0xD000000000000015, 0x800000025C981E50);
    [(objc_class *)cachingCoder.super.isa encodeObject:v68 forKey:v69];
  }
  uint64_t v70 = *((unsigned __int8 *)v1 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_isLowConfidenceKnowledgeResult);
  id v71 = (id)MEMORY[0x261198B80](0xD00000000000001ELL, 0x800000025C981E30);
  [(objc_class *)cachingCoder.super.isa encodeBool:v70 forKey:v71];
}

Swift::String_optional __swiftcall PommesResponse.primaryPluginIdentifier()()
{
  int64_t v1 = (void *)MEMORY[0x263F8EED0];
  unint64_t v2 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x140))();
  unint64_t v4 = v2;
  if (v2 >> 62)
  {
    uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
    if (v5) {
      goto LABEL_3;
    }
LABEL_8:
    swift_bridgeObjectRelease();
    uint64_t v9 = 0;
    Class v11 = 0;
    goto LABEL_9;
  }
  uint64_t v5 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v5) {
    goto LABEL_8;
  }
LABEL_3:
  if ((v4 & 0xC000000000000001) != 0)
  {
    Class v6 = (void *)MEMORY[0x261198DD0](0, v4);
  }
  else
  {
    if (!*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_12;
    }
    Class v6 = *(id *)(v4 + 32);
  }
  Class v7 = v6;
  uint64_t v8 = swift_bridgeObjectRelease();
  uint64_t v9 = (*(uint64_t (**)(uint64_t))((*v1 & *v7) + 0x88))(v8);
  Class v11 = v10;

LABEL_9:
  uint64_t v5 = v9;
  uint64_t v3 = v11;
LABEL_12:
  result.value._object = v3;
  result.value._uint64_t countAndFlagsBits = v5;
  return result;
}

void *PommesResponse.overridePrimaryQueryConfidenceDomain.unsafeMutableAddressor()
{
  return &static PommesResponse.overridePrimaryQueryConfidenceDomain;
}

unint64_t static PommesResponse.overridePrimaryQueryConfidenceDomain.getter()
{
  return 0xD000000000000011;
}

void *PommesResponse.overridePrimaryQueryConfidenceKey.unsafeMutableAddressor()
{
  return &static PommesResponse.overridePrimaryQueryConfidenceKey;
}

unint64_t static PommesResponse.overridePrimaryQueryConfidenceKey.getter()
{
  return 0xD000000000000024;
}

double PommesResponse._computedPrimaryQueryConfidence.getter()
{
  int64_t v1 = &v0[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse____lazy_storage____computedPrimaryQueryConfidence];
  if ((v0[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse____lazy_storage____computedPrimaryQueryConfidence + 8] & 1) == 0) {
    return *(double *)v1;
  }
  double result = specialized closure #1 in PommesResponse._computedPrimaryQueryConfidence.getter(v0);
  *(double *)int64_t v1 = result;
  v1[8] = 0;
  return result;
}

uint64_t PommesResponse.primaryCatIds()()
{
  int64_t v1 = (void *)MEMORY[0x263F8EED0];
  unint64_t v2 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x140))();
  unint64_t v3 = v2;
  if (v2 >> 62)
  {
    uint64_t result = _CocoaArrayWrapper.endIndex.getter();
    if (result) {
      goto LABEL_3;
    }
LABEL_8:
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  uint64_t result = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!result) {
    goto LABEL_8;
  }
LABEL_3:
  if ((v3 & 0xC000000000000001) != 0)
  {
    uint64_t v5 = (void *)MEMORY[0x261198DD0](0, v3);
    goto LABEL_6;
  }
  if (*(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    uint64_t v5 = *(id *)(v3 + 32);
LABEL_6:
    Class v6 = v5;
    uint64_t v7 = swift_bridgeObjectRelease();
    uint64_t v8 = (*(uint64_t (**)(uint64_t))((*v1 & *v6) + 0xD0))(v7);

    return v8;
  }
  __break(1u);
  return result;
}

uint64_t PommesResponse.primaryInstructionIntent()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent?);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  Class v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v7 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v1) + 0x140))(v4);
  unint64_t v8 = v7;
  if (v7 >> 62)
  {
    uint64_t result = _CocoaArrayWrapper.endIndex.getter();
    if (result) {
      goto LABEL_3;
    }
LABEL_8:
    swift_bridgeObjectRelease();
    uint64_t v14 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent();
    uint64_t v15 = *(void *)(v14 - 8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v6, 1, 1, v14);
    (*(void (**)(uint64_t, void, uint64_t))(v15 + 104))(a1, *MEMORY[0x263F5CA28], v14);
    return outlined destroy of ClientExperienceSignals?((uint64_t)v6, (uint64_t *)&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent?);
  }
  uint64_t result = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!result) {
    goto LABEL_8;
  }
LABEL_3:
  if ((v8 & 0xC000000000000001) != 0)
  {
    uint64_t v16 = MEMORY[0x261198DD0](0, v8);
    swift_bridgeObjectRelease();
    uint64_t v17 = v16 + OBJC_IVAR____TtC21SiriInformationSearch10Experience_intent;
    uint64_t v12 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent();
    uint64_t v13 = *(void *)(v12 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v6, v17, v12);
    swift_unknownObjectRelease();
    goto LABEL_6;
  }
  if (*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v10 = (char *)*(id *)(v8 + 32);
    swift_bridgeObjectRelease();
    Class v11 = &v10[OBJC_IVAR____TtC21SiriInformationSearch10Experience_intent];
    uint64_t v12 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent();
    uint64_t v13 = *(void *)(v12 - 8);
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v6, v11, v12);

LABEL_6:
    (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v6, 0, 1, v12);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v13 + 32))(a1, v6, v12);
  }
  __break(1u);
  return result;
}

uint64_t PommesResponse.description.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_25C97FEF0;
  swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PommesResponse.Type);
  uint64_t v2 = String.init<A>(describing:)();
  uint64_t v4 = v3;
  uint64_t v5 = MEMORY[0x263F8D310];
  *(void *)(v1 + 56) = MEMORY[0x263F8D310];
  unint64_t v6 = lazy protocol witness table accessor for type String and conformance String();
  *(void *)(v1 + 64) = v6;
  *(void *)(v1 + 32) = v2;
  *(void *)(v1 + 40) = v4;
  *(void *)(v1 + 96) = type metadata accessor for PommesResponse();
  *(void *)(v1 + 104) = lazy protocol witness table accessor for type PommesResponse and conformance NSObject();
  *(void *)(v1 + 72) = v0;
  unint64_t v7 = *(double (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x288);
  unint64_t v8 = v0;
  double v9 = v7();
  uint64_t v10 = MEMORY[0x263F8D5B8];
  *(void *)(v1 + 136) = MEMORY[0x263F8D538];
  *(void *)(v1 + 144) = v10;
  *(double *)(v1 + 112) = v9;
  uint64_t v12 = *(void *)((char *)v8 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_metadataDomainName);
  uint64_t v11 = *(void *)((char *)v8 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_metadataDomainName + 8);
  *(void *)(v1 + 176) = v5;
  *(void *)(v1 + 184) = v6;
  *(void *)(v1 + 152) = v12;
  *(void *)(v1 + 160) = v11;
  swift_bridgeObjectRetain();
  return String.init(format:_:)();
}

uint64_t PommesResponse.setPegasusDomainLogs(flowStep:userSensitiveTier1:)(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  double v9 = (void *)MEMORY[0x263F8EED0];
  uint64_t v10 = *(void (**)(uint64_t, unint64_t))((*MEMORY[0x263F8EED0] & *v4) + 0x1A8);
  outlined copy of Data?(a1, a2);
  v10(a1, a2);
  uint64_t v12 = *(uint64_t (**)(uint64_t, unint64_t))((*v9 & *v4) + 0x1D8);
  outlined copy of Data?(a3, a4);

  return v12(a3, a4);
}

Swift::Void __swiftcall PommesResponse.setPegasusDomainLogs(flowStep:userSensitiveTier1:)(Swift::OpaquePointer flowStep, Swift::OpaquePointer userSensitiveTier1)
{
  uint64_t v5 = (void *)MEMORY[0x263F8EED0];
  unint64_t v6 = *(void (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v2) + 0x1C0);
  uint64_t v7 = swift_bridgeObjectRetain();
  v6(v7);
  unint64_t v8 = *(void (**)(uint64_t))((*v5 & *v2) + 0x1F0);
  uint64_t v9 = swift_bridgeObjectRetain();
  v8(v9);
  uint64_t v10 = *((void *)flowStep._rawValue + 2);
  if (v10)
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = 0;
    uint64_t v12 = (void *)MEMORY[0x263F8EE78];
    do
    {
      unint64_t v13 = *((void *)flowStep._rawValue + 2 * v11 + 5);
      if (v13 >> 60 != 15)
      {
        long long v31 = *((_OWORD *)flowStep._rawValue + v11 + 2);
        outlined copy of Data._Representation(*((void *)flowStep._rawValue + 2 * v11 + 4), v13);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v12 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v12[2] + 1, 1, v12);
        }
        unint64_t v15 = v12[2];
        unint64_t v14 = v12[3];
        long long v16 = v31;
        if (v15 >= v14 >> 1)
        {
          uint64_t v17 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v14 > 1), v15 + 1, 1, v12);
          long long v16 = v31;
          uint64_t v12 = v17;
        }
        v12[2] = v15 + 1;
        *(_OWORD *)&v12[2 * v15 + 4] = v16;
      }
      ++v11;
    }
    while (v10 != v11);
    swift_bridgeObjectRelease();
    if (v12[2]) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x263F8EE78];
    if (*(void *)(MEMORY[0x263F8EE78] + 16))
    {
LABEL_11:
      uint64_t v18 = v12[4];
      unint64_t v19 = v12[5];
      outlined copy of Data._Representation(v18, v19);
      goto LABEL_14;
    }
  }
  uint64_t v18 = 0;
  unint64_t v19 = 0xF000000000000000;
LABEL_14:
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, unint64_t))((*v5 & *v2) + 0x1A8))(v18, v19);
  uint64_t v20 = *((void *)userSensitiveTier1._rawValue + 2);
  if (v20)
  {
    swift_bridgeObjectRetain();
    uint64_t v21 = 0;
    uint64_t v22 = (void *)MEMORY[0x263F8EE78];
    do
    {
      unint64_t v23 = *((void *)userSensitiveTier1._rawValue + 2 * v21 + 5);
      if (v23 >> 60 != 15)
      {
        long long v32 = *((_OWORD *)userSensitiveTier1._rawValue + v21 + 2);
        outlined copy of Data._Representation(*((void *)userSensitiveTier1._rawValue + 2 * v21 + 4), v23);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v22 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v22[2] + 1, 1, v22);
        }
        unint64_t v25 = v22[2];
        unint64_t v24 = v22[3];
        long long v26 = v32;
        if (v25 >= v24 >> 1)
        {
          Class v27 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v24 > 1), v25 + 1, 1, v22);
          long long v26 = v32;
          uint64_t v22 = v27;
        }
        v22[2] = v25 + 1;
        *(_OWORD *)&v22[2 * v25 + 4] = v26;
      }
      ++v21;
    }
    while (v20 != v21);
    swift_bridgeObjectRelease();
    if (v22[2]) {
      goto LABEL_24;
    }
  }
  else
  {
    uint64_t v22 = (void *)MEMORY[0x263F8EE78];
    if (*(void *)(MEMORY[0x263F8EE78] + 16))
    {
LABEL_24:
      uint64_t v28 = v22[4];
      unint64_t v29 = v22[5];
      outlined copy of Data._Representation(v28, v29);
      goto LABEL_27;
    }
  }
  uint64_t v28 = 0;
  unint64_t v29 = 0xF000000000000000;
LABEL_27:
  swift_bridgeObjectRelease();
  Class v30 = *(void (**)(uint64_t, unint64_t))((*v5 & *v2) + 0x1D8);

  v30(v28, v29);
}

void PommesResponse.init()()
{
}

id PommesResponse.__deallocating_deinit()
{
  return PommesResult.__deallocating_deinit(type metadata accessor for PommesResponse);
}

id PommesResult.__deallocating_deinit(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t specialized static PommesCandidateId.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)a1;
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(void *)(a1 + 24);
  int v6 = *(unsigned __int8 *)(a1 + 32);
  uint64_t v7 = *(void *)a2;
  uint64_t v8 = *(void *)(a2 + 8);
  uint64_t v9 = *(void *)(a2 + 16);
  uint64_t v10 = *(void *)(a2 + 24);
  int v11 = *(unsigned __int8 *)(a2 + 32);
  if (*(unsigned char *)(a1 + 32))
  {
    if (v6 == 1)
    {
      if (v11 == 1)
      {
        BOOL v12 = v2 == v7 && v3 == v8;
        if (v12
          || (uint64_t v13 = *(void *)a2,
              uint64_t v14 = *(void *)a1,
              uint64_t v15 = *(void *)(a1 + 8),
              char v16 = _stringCompareWithSmolCheck(_:_:expecting:)(),
              uint64_t v7 = v13,
              uint64_t v3 = v15,
              uint64_t v2 = v14,
              (v16 & 1) != 0))
        {
          if (v4 == v9 && v5 == v10)
          {
            uint64_t v15 = v3;
            uint64_t v14 = v2;
            uint64_t v17 = v4;
            uint64_t v18 = v5;
            LOBYTE(v11) = 1;
            LOBYTE(v6) = 1;
LABEL_29:
            char v32 = 1;
            goto LABEL_32;
          }
          uint64_t v15 = v3;
          uint64_t v14 = v2;
          uint64_t v17 = v4;
          uint64_t v18 = v5;
          uint64_t v25 = v9;
          uint64_t v26 = v7;
          char v27 = _stringCompareWithSmolCheck(_:_:expecting:)();
          uint64_t v7 = v26;
          uint64_t v9 = v25;
          char v32 = v27;
        }
        else
        {
          uint64_t v17 = v4;
          uint64_t v18 = v5;
          char v32 = 0;
        }
        LOBYTE(v11) = 1;
        LOBYTE(v6) = 1;
        goto LABEL_32;
      }
      goto LABEL_24;
    }
    if (v11 == 2)
    {
      if (v2 == v7 && v3 == v8)
      {
        uint64_t v15 = *(void *)(a1 + 8);
        uint64_t v14 = *(void *)a1;
        uint64_t v17 = *(void *)(a1 + 16);
        uint64_t v18 = *(void *)(a1 + 24);
        char v32 = 1;
      }
      else
      {
        uint64_t v17 = *(void *)(a1 + 16);
        uint64_t v18 = *(void *)(a1 + 24);
        uint64_t v14 = *(void *)a1;
        uint64_t v15 = *(void *)(a1 + 8);
        uint64_t v23 = *(void *)a2;
        char v24 = _stringCompareWithSmolCheck(_:_:expecting:)();
        uint64_t v7 = v23;
        char v32 = v24;
      }
      LOBYTE(v11) = 2;
      LOBYTE(v6) = 2;
      goto LABEL_32;
    }
LABEL_24:
    uint64_t v15 = *(void *)(a1 + 8);
    uint64_t v14 = *(void *)a1;
    uint64_t v17 = *(void *)(a1 + 16);
    uint64_t v18 = *(void *)(a1 + 24);
    char v32 = 0;
    goto LABEL_32;
  }
  if (*(unsigned char *)(a2 + 32)) {
    goto LABEL_24;
  }
  if (v2 == v7 && v3 == v8)
  {
    uint64_t v15 = *(void *)(a1 + 8);
    uint64_t v14 = *(void *)a1;
    uint64_t v17 = *(void *)(a1 + 16);
    uint64_t v18 = *(void *)(a1 + 24);
    LOBYTE(v11) = 0;
    LOBYTE(v6) = 0;
    goto LABEL_29;
  }
  uint64_t v17 = *(void *)(a1 + 16);
  uint64_t v18 = *(void *)(a1 + 24);
  uint64_t v14 = *(void *)a1;
  uint64_t v15 = *(void *)(a1 + 8);
  uint64_t v20 = *(void *)a2;
  char v21 = _stringCompareWithSmolCheck(_:_:expecting:)();
  uint64_t v7 = v20;
  char v32 = v21;
  LOBYTE(v11) = 0;
  LOBYTE(v6) = 0;
LABEL_32:
  uint64_t v28 = v8;
  uint64_t v29 = v8;
  uint64_t v30 = v7;
  outlined copy of PommesCandidateId(v7, v28, v9, v10, v11);
  outlined copy of PommesCandidateId(v14, v15, v17, v18, v6);
  outlined consume of PommesCandidateId(v14, v15, v17, v18, v6);
  outlined consume of PommesCandidateId(v30, v29, v9, v10, v11);
  return v32 & 1;
}

unint64_t lazy protocol witness table accessor for type PommesCandidateId.CodingKeys and conformance PommesCandidateId.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type PommesCandidateId.CodingKeys and conformance PommesCandidateId.CodingKeys;
  if (!lazy protocol witness table cache variable for type PommesCandidateId.CodingKeys and conformance PommesCandidateId.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PommesCandidateId.CodingKeys and conformance PommesCandidateId.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type PommesCandidateId.CodingKeys and conformance PommesCandidateId.CodingKeys;
  if (!lazy protocol witness table cache variable for type PommesCandidateId.CodingKeys and conformance PommesCandidateId.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PommesCandidateId.CodingKeys and conformance PommesCandidateId.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type PommesCandidateId.CodingKeys and conformance PommesCandidateId.CodingKeys;
  if (!lazy protocol witness table cache variable for type PommesCandidateId.CodingKeys and conformance PommesCandidateId.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PommesCandidateId.CodingKeys and conformance PommesCandidateId.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type PommesCandidateId.CodingKeys and conformance PommesCandidateId.CodingKeys;
  if (!lazy protocol witness table cache variable for type PommesCandidateId.CodingKeys and conformance PommesCandidateId.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PommesCandidateId.CodingKeys and conformance PommesCandidateId.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type PommesCandidateId.RunPommesCodingKeys and conformance PommesCandidateId.RunPommesCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type PommesCandidateId.RunPommesCodingKeys and conformance PommesCandidateId.RunPommesCodingKeys;
  if (!lazy protocol witness table cache variable for type PommesCandidateId.RunPommesCodingKeys and conformance PommesCandidateId.RunPommesCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PommesCandidateId.RunPommesCodingKeys and conformance PommesCandidateId.RunPommesCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type PommesCandidateId.RunPommesCodingKeys and conformance PommesCandidateId.RunPommesCodingKeys;
  if (!lazy protocol witness table cache variable for type PommesCandidateId.RunPommesCodingKeys and conformance PommesCandidateId.RunPommesCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PommesCandidateId.RunPommesCodingKeys and conformance PommesCandidateId.RunPommesCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type PommesCandidateId.RunPommesCodingKeys and conformance PommesCandidateId.RunPommesCodingKeys;
  if (!lazy protocol witness table cache variable for type PommesCandidateId.RunPommesCodingKeys and conformance PommesCandidateId.RunPommesCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PommesCandidateId.RunPommesCodingKeys and conformance PommesCandidateId.RunPommesCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type PommesCandidateId.RunPommesCodingKeys and conformance PommesCandidateId.RunPommesCodingKeys;
  if (!lazy protocol witness table cache variable for type PommesCandidateId.RunPommesCodingKeys and conformance PommesCandidateId.RunPommesCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PommesCandidateId.RunPommesCodingKeys and conformance PommesCandidateId.RunPommesCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type PommesCandidateId.MedocCodingKeys and conformance PommesCandidateId.MedocCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type PommesCandidateId.MedocCodingKeys and conformance PommesCandidateId.MedocCodingKeys;
  if (!lazy protocol witness table cache variable for type PommesCandidateId.MedocCodingKeys and conformance PommesCandidateId.MedocCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PommesCandidateId.MedocCodingKeys and conformance PommesCandidateId.MedocCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type PommesCandidateId.MedocCodingKeys and conformance PommesCandidateId.MedocCodingKeys;
  if (!lazy protocol witness table cache variable for type PommesCandidateId.MedocCodingKeys and conformance PommesCandidateId.MedocCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PommesCandidateId.MedocCodingKeys and conformance PommesCandidateId.MedocCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type PommesCandidateId.MedocCodingKeys and conformance PommesCandidateId.MedocCodingKeys;
  if (!lazy protocol witness table cache variable for type PommesCandidateId.MedocCodingKeys and conformance PommesCandidateId.MedocCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PommesCandidateId.MedocCodingKeys and conformance PommesCandidateId.MedocCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type PommesCandidateId.MedocCodingKeys and conformance PommesCandidateId.MedocCodingKeys;
  if (!lazy protocol witness table cache variable for type PommesCandidateId.MedocCodingKeys and conformance PommesCandidateId.MedocCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PommesCandidateId.MedocCodingKeys and conformance PommesCandidateId.MedocCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type PommesCandidateId.RcCodingKeys and conformance PommesCandidateId.RcCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type PommesCandidateId.RcCodingKeys and conformance PommesCandidateId.RcCodingKeys;
  if (!lazy protocol witness table cache variable for type PommesCandidateId.RcCodingKeys and conformance PommesCandidateId.RcCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PommesCandidateId.RcCodingKeys and conformance PommesCandidateId.RcCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type PommesCandidateId.RcCodingKeys and conformance PommesCandidateId.RcCodingKeys;
  if (!lazy protocol witness table cache variable for type PommesCandidateId.RcCodingKeys and conformance PommesCandidateId.RcCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PommesCandidateId.RcCodingKeys and conformance PommesCandidateId.RcCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type PommesCandidateId.RcCodingKeys and conformance PommesCandidateId.RcCodingKeys;
  if (!lazy protocol witness table cache variable for type PommesCandidateId.RcCodingKeys and conformance PommesCandidateId.RcCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PommesCandidateId.RcCodingKeys and conformance PommesCandidateId.RcCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type PommesCandidateId.RcCodingKeys and conformance PommesCandidateId.RcCodingKeys;
  if (!lazy protocol witness table cache variable for type PommesCandidateId.RcCodingKeys and conformance PommesCandidateId.RcCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PommesCandidateId.RcCodingKeys and conformance PommesCandidateId.RcCodingKeys);
  }
  return result;
}

uint64_t specialized PommesCandidateId.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 25458 && a2 == 0xE200000000000000;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x636F64656DLL && a2 == 0xE500000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x656D6D6F506E7572 && a2 == 0xE900000000000073)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t specialized PommesCandidateId.MedocCodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6449707274 && a2 == 0xE500000000000000;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6449756374 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t specialized PommesCandidateId.RcCodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  if (a1 == 25705 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t specialized PommesCandidateId.RcCodingKeys.stringValue.getter()
{
  return 25705;
}

uint64_t specialized PommesCandidateId.RunPommesCodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6449666572 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t specialized PommesCandidateId.RunPommesCodingKeys.stringValue.getter()
{
  return 0x6449666572;
}

unint64_t specialized PommesCandidateId.CandidateIdType.init(rawValue:)(Swift::String string)
{
  object = string._object;
  v2._uint64_t countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of PommesCandidateId.CandidateIdType.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 >= 3) {
    return 3;
  }
  else {
    return v3;
  }
}

id specialized PommesResponse.init(experiences:clientResults:conversationContext:metadataDomainName:renderedTexts:pegasusDomainFlowStepLog:pegasusDomainUserSensitiveTier1Log:listenAfterSpeaking:requestId:pommesCandidateId:isHandledByPreflight:preflightClientHandlerIdentifier:taskStepLogs:userSensitiveTier1Logs:componentsWarmedUp:searchReason:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9, uint64_t a10, unint64_t a11, char a12, uint64_t a13, uint64_t a14, long long *a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char *a22)
{
  long long v47 = *a15;
  uint64_t v45 = *((void *)a15 + 3);
  uint64_t v46 = *((void *)a15 + 2);
  char v44 = *((unsigned char *)a15 + 32);
  char v48 = *a22;
  uint64_t v26 = (uint64_t *)&v22[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_pegasusDomainFlowStepLog];
  *(_OWORD *)&v22[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_pegasusDomainFlowStepLog] = xmmword_25C97FD10;
  char v27 = (uint64_t *)&v22[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_pegasusDomainUserSensitiveTier1Log];
  *(_OWORD *)&v22[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_pegasusDomainUserSensitiveTier1Log] = xmmword_25C97FD10;
  uint64_t v28 = &v22[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_requestCountryCode];
  *uint64_t v28 = 0;
  v28[1] = 0;
  uint64_t v29 = &v22[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse____lazy_storage____computedPrimaryQueryConfidence];
  *(void *)uint64_t v29 = 0;
  v29[8] = 1;
  *(void *)&v22[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_experiences] = a1;
  *(void *)&v22[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_clientResults] = a2;
  uint64_t v30 = (uint64_t *)&v22[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_conversationContext];
  *uint64_t v30 = a3;
  v30[1] = a4;
  long long v31 = &v22[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_metadataDomainName];
  *long long v31 = a5;
  v31[1] = a6;
  v22[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_metadataFallbackTriggered] = 0;
  *(void *)&v22[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_renderedTexts] = a7;
  *(void *)&v22[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_redactedRenderedTexts] = MEMORY[0x263F8EE78];
  swift_beginAccess();
  uint64_t v33 = *v26;
  unint64_t v32 = v26[1];
  *uint64_t v26 = a8;
  v26[1] = a9;
  uint64_t v34 = v22;
  outlined copy of Data?(a3, a4);
  outlined copy of Data?(a8, a9);
  outlined consume of Data._Representation?(v33, v32);
  swift_beginAccess();
  uint64_t v35 = *v27;
  unint64_t v36 = v27[1];
  *char v27 = a10;
  v27[1] = a11;
  outlined copy of Data?(a10, a11);
  outlined consume of Data._Representation?(v35, v36);
  v34[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_listenAfterSpeaking] = a12;
  Class v37 = &v34[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_requestId];
  *Class v37 = a13;
  v37[1] = a14;
  id v38 = &v34[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_pommesCandidateId];
  *(_OWORD *)id v38 = v47;
  *((void *)v38 + 2) = v46;
  *((void *)v38 + 3) = v45;
  v38[32] = v44;
  v34[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_isHandledByPreflight] = a16;
  id v39 = &v34[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_preflightClientHandlerIdentifier];
  *id v39 = a17;
  v39[1] = a18;
  *(void *)&v34[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_taskStepLogs] = a19;
  *(void *)&v34[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_userSensitiveTier1Logs] = a20;
  v34[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_searchReason] = v48;
  *(void *)&v34[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_componentsWarmedUp] = a21;
  v34[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_isCachedResponse] = 0;
  Class v40 = &v34[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_searchRequestUtterance];
  *Class v40 = 0;
  v40[1] = 0xE000000000000000;
  id v41 = &v34[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_sharedUserId];
  *id v41 = 0;
  v41[1] = 0;
  *(_OWORD *)&v34[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_encodedNLUserParses] = xmmword_25C97FD10;
  *(_OWORD *)&v34[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_encodedNLFallbackParse] = xmmword_25C97FD10;
  *(void *)&v34[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_asrRecognition] = 0;
  unint64_t v42 = &v34[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_responseVariantResult];
  *unint64_t v42 = 0;
  v42[1] = 0;
  v34[OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_isLowConfidenceKnowledgeResult] = 0;

  v49.receiver = v34;
  v49.super_class = (Class)type metadata accessor for PommesResponse();
  return objc_msgSendSuper2(&v49, sel_init);
}

uint64_t outlined release of PommesResponse.Builder(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *(void *)(a1 + 24);
  uint64_t v4 = *(void *)(a1 + 72);
  unint64_t v5 = *(void *)(a1 + 80);
  unint64_t v8 = *(void *)(a1 + 96);
  uint64_t v9 = *(void *)(a1 + 88);
  uint64_t v12 = *(void *)(a1 + 136);
  uint64_t v13 = *(void *)(a1 + 128);
  uint64_t v11 = *(void *)(a1 + 144);
  uint64_t v10 = *(void *)(a1 + 152);
  unint64_t v14 = *(void *)(a1 + 272);
  uint64_t v15 = *(void *)(a1 + 264);
  unint64_t v16 = *(void *)(a1 + 288);
  uint64_t v17 = *(void *)(a1 + 280);
  uint64_t v18 = *(void **)(a1 + 296);
  char v6 = *(unsigned char *)(a1 + 160);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined consume of Data._Representation?(v2, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined consume of Data._Representation?(v4, v5);
  outlined consume of Data._Representation?(v9, v8);
  swift_bridgeObjectRelease();
  outlined consume of PommesCandidateId?(v13, v12, v11, v10, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined consume of Data._Representation?(v15, v14);
  outlined consume of Data._Representation?(v17, v16);

  swift_bridgeObjectRelease();
  return a1;
}

uint64_t outlined consume of PommesCandidateId?(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5 != -1) {
    return outlined consume of PommesCandidateId(a1, a2, a3, a4, a5);
  }
  return a1;
}

uint64_t outlined consume of PommesCandidateId(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5 && a5 != 2)
  {
    if (a5 != 1) {
      return result;
    }
    swift_bridgeObjectRelease();
  }

  return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for PommesResponse()
{
  return self;
}

uint64_t outlined copy of PommesCandidateId?(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5 != -1) {
    return outlined copy of PommesCandidateId(a1, a2, a3, a4, a5);
  }
  return a1;
}

uint64_t outlined copy of PommesCandidateId(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5 && a5 != 2)
  {
    if (a5 != 1) {
      return result;
    }
    swift_bridgeObjectRetain();
  }

  return swift_bridgeObjectRetain();
}

uint64_t outlined init with take of PommesCandidateId?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PommesCandidateId?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
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

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type PommesResponse and conformance NSObject()
{
  unint64_t result = lazy protocol witness table cache variable for type PommesResponse and conformance NSObject;
  if (!lazy protocol witness table cache variable for type PommesResponse and conformance NSObject)
  {
    type metadata accessor for PommesResponse();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PommesResponse and conformance NSObject);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type PommesCandidateId and conformance PommesCandidateId()
{
  unint64_t result = lazy protocol witness table cache variable for type PommesCandidateId and conformance PommesCandidateId;
  if (!lazy protocol witness table cache variable for type PommesCandidateId and conformance PommesCandidateId)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PommesCandidateId and conformance PommesCandidateId);
  }
  return result;
}

uint64_t sub_25C91E2F8@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x140))();
  *a2 = result;
  return result;
}

uint64_t sub_25C91E360@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x158))();
  *a2 = result;
  return result;
}

uint64_t sub_25C91E3C4(uint64_t a1, void **a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & **a2) + 0x160);
  uint64_t v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

uint64_t sub_25C91E430@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x170))();
  *a2 = result;
  return result;
}

uint64_t sub_25C91E494(uint64_t a1, void **a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & **a2) + 0x178);
  uint64_t v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

uint64_t sub_25C91E500@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x188))();
  *a2 = result;
  return result;
}

uint64_t sub_25C91E564(uint64_t a1, void **a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & **a2) + 0x190);
  uint64_t v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

uint64_t sub_25C91E5D0@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x1A0))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_25C91E634(uint64_t *a1, void **a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  uint64_t v4 = *(uint64_t (**)(uint64_t, unint64_t))((*MEMORY[0x263F8EED0] & **a2) + 0x1A8);
  outlined copy of Data?(*a1, v3);
  return v4(v2, v3);
}

uint64_t sub_25C91E6B8@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x1B8))();
  *a2 = result;
  return result;
}

uint64_t sub_25C91E71C(uint64_t a1, void **a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & **a2) + 0x1C0);
  uint64_t v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

uint64_t sub_25C91E788@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x1D0))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_25C91E7EC(uint64_t *a1, void **a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  uint64_t v4 = *(uint64_t (**)(uint64_t, unint64_t))((*MEMORY[0x263F8EED0] & **a2) + 0x1D8);
  outlined copy of Data?(*a1, v3);
  return v4(v2, v3);
}

uint64_t sub_25C91E870@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x1E8))();
  *a2 = result;
  return result;
}

uint64_t sub_25C91E8D4(uint64_t a1, void **a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & **a2) + 0x1F0);
  uint64_t v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

uint64_t sub_25C91E940@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x200))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_25C91E9A8(unsigned __int8 *a1, void **a2)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a2) + 0x208))(*a1);
}

uint64_t sub_25C91EA08@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x228))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_25C91EA6C(uint64_t *a1, void **a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))((*MEMORY[0x263F8EED0] & **a2) + 0x230);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

void *sub_25C91EAEC@<X0>(void **a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(void *(**)(uint64_t *__return_ptr))((*MEMORY[0x263F8EED0] & **a1) + 0x240))(&v4);
  *a2 = v4;
  return result;
}

uint64_t sub_25C91EB60(char *a1, void *a2)
{
  char v2 = *a1;
  uint64_t v3 = (unsigned char *)(*a2 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_searchReason);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = v2;
  return result;
}

uint64_t method lookup function for PommesResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PommesResult);
}

uint64_t dispatch thunk of static PommesResult.supportsSecureCoding.getter()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of PommesResult.__allocating_init(resultId:domain:metadata:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of PommesResult.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of PommesResult.encode(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t initializeBufferWithCopyOfBuffer for PommesCandidateId(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for PommesCandidateId(uint64_t a1)
{
  return outlined consume of PommesCandidateId(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned char *)(a1 + 32));
}

uint64_t initializeWithCopy for PommesCandidateId(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  outlined copy of PommesCandidateId(*(void *)a2, v4, v5, v6, v7);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for PommesCandidateId(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  outlined copy of PommesCandidateId(*(void *)a2, v4, v5, v6, v7);
  uint64_t v8 = *(void *)a1;
  uint64_t v9 = *(void *)(a1 + 8);
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = *(void *)(a1 + 24);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  char v12 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v7;
  outlined consume of PommesCandidateId(v8, v9, v10, v11, v12);
  return a1;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for PommesCandidateId(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 32);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  long long v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v8;
  char v9 = *(unsigned char *)(a1 + 32);
  *(unsigned char *)(a1 + 32) = v3;
  outlined consume of PommesCandidateId(v4, v6, v5, v7, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for PommesCandidateId(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PommesCandidateId(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 32) = -(char)a2;
    }
  }
  return result;
}

uint64_t getEnumTag for PommesCandidateId(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32);
}

uint64_t destructiveInjectEnumTag for PommesCandidateId(uint64_t result, char a2)
{
  *(unsigned char *)(result + 32) = a2;
  return result;
}

ValueMetadata *type metadata accessor for PommesCandidateId()
{
  return &type metadata for PommesCandidateId;
}

uint64_t method lookup function for PommesResponse(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PommesResponse);
}

uint64_t dispatch thunk of PommesResponse.__allocating_init(experiences:clientResults:conversationContext:metadataDomainName:renderedTexts:pegasusDomainFlowStepLog:pegasusDomainUserSensitiveTier1Log:listenAfterSpeaking:requestId:pommesCandidateId:isHandledByPreflight:preflightClientHandlerIdentifier:taskStepLogs:userSensitiveTier1Logs:componentsWarmedUp:searchReason:)()
{
  return (*(uint64_t (**)(void))(v0 + 304))();
}

uint64_t dispatch thunk of PommesResponse.__allocating_init(builder:)()
{
  return (*(uint64_t (**)(void))(v0 + 312))();
}

uint64_t dispatch thunk of PommesResponse.experiences.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x140))();
}

uint64_t dispatch thunk of PommesResponse.clientResults.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of PommesResponse.clientResults.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of PommesResponse.clientResults.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x168))();
}

uint64_t dispatch thunk of PommesResponse.renderedTexts.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x170))();
}

uint64_t dispatch thunk of PommesResponse.renderedTexts.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of PommesResponse.renderedTexts.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of PommesResponse.redactedRenderedTexts.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x188))();
}

uint64_t dispatch thunk of PommesResponse.redactedRenderedTexts.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x190))();
}

uint64_t dispatch thunk of PommesResponse.redactedRenderedTexts.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x198))();
}

uint64_t dispatch thunk of PommesResponse.pegasusDomainFlowStepLog.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of PommesResponse.pegasusDomainFlowStepLog.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1A8))();
}

uint64_t dispatch thunk of PommesResponse.pegasusDomainFlowStepLog.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1B0))();
}

uint64_t dispatch thunk of PommesResponse.taskStepLogs.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of PommesResponse.taskStepLogs.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1C0))();
}

uint64_t dispatch thunk of PommesResponse.taskStepLogs.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1C8))();
}

uint64_t dispatch thunk of PommesResponse.pegasusDomainUserSensitiveTier1Log.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1D0))();
}

uint64_t dispatch thunk of PommesResponse.pegasusDomainUserSensitiveTier1Log.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1D8))();
}

uint64_t dispatch thunk of PommesResponse.pegasusDomainUserSensitiveTier1Log.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1E0))();
}

uint64_t dispatch thunk of PommesResponse.userSensitiveTier1Logs.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1E8))();
}

uint64_t dispatch thunk of PommesResponse.userSensitiveTier1Logs.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1F0))();
}

uint64_t dispatch thunk of PommesResponse.userSensitiveTier1Logs.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x1F8))();
}

uint64_t dispatch thunk of PommesResponse.listenAfterSpeaking.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x200))();
}

uint64_t dispatch thunk of PommesResponse.listenAfterSpeaking.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x208))();
}

uint64_t dispatch thunk of PommesResponse.listenAfterSpeaking.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x210))();
}

uint64_t dispatch thunk of PommesResponse.resultCandidateId.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x218))();
}

uint64_t dispatch thunk of PommesResponse.isPersonalDomainFallback.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x220))();
}

uint64_t dispatch thunk of PommesResponse.requestCountryCode.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x228))();
}

uint64_t dispatch thunk of PommesResponse.requestCountryCode.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x230))();
}

uint64_t dispatch thunk of PommesResponse.requestCountryCode.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x238))();
}

uint64_t dispatch thunk of PommesResponse.searchReason.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x240))();
}

uint64_t dispatch thunk of PommesResponse.setSearchReason(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x258))();
}

uint64_t dispatch thunk of PommesResponse.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 608))();
}

uint64_t dispatch thunk of PommesResponse.__allocating_init(cachingCoder:requestId:pommesCandidateId:componentsWarmedUp:)()
{
  return (*(uint64_t (**)(void))(v0 + 616))();
}

uint64_t dispatch thunk of PommesResponse.encode(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x270))();
}

uint64_t dispatch thunk of PommesResponse.encode(cachingCoder:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x278))();
}

uint64_t dispatch thunk of PommesResponse.primaryPluginIdentifier()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x280))();
}

uint64_t dispatch thunk of PommesResponse.primaryQueryConfidence()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x288))();
}

uint64_t dispatch thunk of PommesResponse.primaryCatIds()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2A8))();
}

uint64_t dispatch thunk of PommesResponse.primaryInstructionIntent()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2B0))();
}

uint64_t dispatch thunk of PommesResponse.setPegasusDomainLogs(flowStep:userSensitiveTier1:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2C0))();
}

{
  void *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x2C8))();
}

uint64_t destroy for PommesResponse.Builder(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >> 60 != 15) {
    outlined consume of Data._Representation(*(void *)(a1 + 16), v2);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v3 = *(void *)(a1 + 80);
  if (v3 >> 60 != 15) {
    outlined consume of Data._Representation(*(void *)(a1 + 72), v3);
  }
  unint64_t v4 = *(void *)(a1 + 96);
  if (v4 >> 60 != 15) {
    outlined consume of Data._Representation(*(void *)(a1 + 88), v4);
  }
  swift_bridgeObjectRelease();
  int v5 = *(unsigned __int8 *)(a1 + 160);
  if (v5 != 255) {
    outlined consume of PommesCandidateId(*(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144), *(void *)(a1 + 152), v5);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v6 = *(void *)(a1 + 272);
  if (v6 >> 60 != 15) {
    outlined consume of Data._Representation(*(void *)(a1 + 264), v6);
  }
  unint64_t v7 = *(void *)(a1 + 288);
  if (v7 >> 60 != 15) {
    outlined consume of Data._Representation(*(void *)(a1 + 280), v7);
  }

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PommesResponse.Builder(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  int v5 = (uint64_t *)(a2 + 16);
  unint64_t v6 = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v6 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 16) = *(_OWORD *)v5;
  }
  else
  {
    uint64_t v7 = *v5;
    outlined copy of Data._Representation(*v5, v6);
    *(void *)(a1 + 16) = v7;
    *(void *)(a1 + 24) = v6;
  }
  uint64_t v8 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v8;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v9 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v9;
  uint64_t v10 = (uint64_t *)(a2 + 72);
  unint64_t v11 = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v11 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 72) = *(_OWORD *)v10;
  }
  else
  {
    uint64_t v12 = *v10;
    outlined copy of Data._Representation(*v10, v11);
    *(void *)(a1 + 72) = v12;
    *(void *)(a1 + 80) = v11;
  }
  uint64_t v13 = (uint64_t *)(a2 + 88);
  unint64_t v14 = *(void *)(a2 + 96);
  if (v14 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 88) = *(_OWORD *)v13;
  }
  else
  {
    uint64_t v15 = *v13;
    outlined copy of Data._Representation(*v13, *(void *)(a2 + 96));
    *(void *)(a1 + 88) = v15;
    *(void *)(a1 + 96) = v14;
  }
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  uint64_t v16 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v16;
  int v17 = *(unsigned __int8 *)(a2 + 160);
  swift_bridgeObjectRetain();
  if (v17 == 255)
  {
    long long v22 = *(_OWORD *)(a2 + 144);
    *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
    *(_OWORD *)(a1 + 144) = v22;
    *(unsigned char *)(a1 + 160) = *(unsigned char *)(a2 + 160);
  }
  else
  {
    uint64_t v18 = *(void *)(a2 + 128);
    uint64_t v19 = *(void *)(a2 + 136);
    uint64_t v20 = *(void *)(a2 + 144);
    uint64_t v21 = *(void *)(a2 + 152);
    outlined copy of PommesCandidateId(v18, v19, v20, v21, v17);
    *(void *)(a1 + 128) = v18;
    *(void *)(a1 + 136) = v19;
    *(void *)(a1 + 144) = v20;
    *(void *)(a1 + 152) = v21;
    *(unsigned char *)(a1 + 160) = v17;
  }
  *(unsigned char *)(a1 + 161) = *(unsigned char *)(a2 + 161);
  uint64_t v23 = *(void *)(a2 + 176);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(void *)(a1 + 176) = v23;
  uint64_t v24 = *(void *)(a2 + 192);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  *(void *)(a1 + 192) = v24;
  uint64_t v25 = *(void *)(a2 + 208);
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  *(void *)(a1 + 208) = v25;
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  *(unsigned char *)(a1 + 224) = *(unsigned char *)(a2 + 224);
  *(unsigned char *)(a1 + 225) = *(unsigned char *)(a2 + 225);
  uint64_t v26 = *(void *)(a2 + 240);
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  *(void *)(a1 + 240) = v26;
  uint64_t v27 = *(void *)(a2 + 256);
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  *(void *)(a1 + 256) = v27;
  uint64_t v28 = (uint64_t *)(a2 + 264);
  unint64_t v29 = *(void *)(a2 + 272);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v29 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 264) = *(_OWORD *)v28;
  }
  else
  {
    uint64_t v30 = *v28;
    outlined copy of Data._Representation(*v28, v29);
    *(void *)(a1 + 264) = v30;
    *(void *)(a1 + 272) = v29;
  }
  long long v31 = (uint64_t *)(a2 + 280);
  unint64_t v32 = *(void *)(a2 + 288);
  if (v32 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 280) = *(_OWORD *)v31;
  }
  else
  {
    uint64_t v33 = *v31;
    outlined copy of Data._Representation(*v31, *(void *)(a2 + 288));
    *(void *)(a1 + 280) = v33;
    *(void *)(a1 + 288) = v32;
  }
  uint64_t v34 = *(void **)(a2 + 296);
  uint64_t v35 = *(void *)(a2 + 304);
  *(void *)(a1 + 296) = v34;
  *(void *)(a1 + 304) = v35;
  *(void *)(a1 + 312) = *(void *)(a2 + 312);
  *(unsigned char *)(a1 + 320) = *(unsigned char *)(a2 + 320);
  id v36 = v34;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PommesResponse.Builder(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (uint64_t *)(a2 + 16);
  unint64_t v5 = *(void *)(a2 + 24);
  if (*(void *)(a1 + 24) >> 60 == 15)
  {
    if (v5 >> 60 != 15)
    {
      uint64_t v6 = *v4;
      outlined copy of Data._Representation(*v4, *(void *)(a2 + 24));
      *(void *)(a1 + 16) = v6;
      *(void *)(a1 + 24) = v5;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v5 >> 60 == 15)
  {
    outlined destroy of Data(a1 + 16);
LABEL_6:
    *(_OWORD *)(a1 + 16) = *(_OWORD *)v4;
    goto LABEL_8;
  }
  uint64_t v7 = *v4;
  outlined copy of Data._Representation(*v4, *(void *)(a2 + 24));
  uint64_t v8 = *(void *)(a1 + 16);
  unint64_t v9 = *(void *)(a1 + 24);
  *(void *)(a1 + 16) = v7;
  *(void *)(a1 + 24) = v5;
  outlined consume of Data._Representation(v8, v9);
LABEL_8:
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = (uint64_t *)(a2 + 72);
  unint64_t v11 = *(void *)(a2 + 80);
  if (*(void *)(a1 + 80) >> 60 == 15)
  {
    if (v11 >> 60 != 15)
    {
      uint64_t v12 = *v10;
      outlined copy of Data._Representation(*v10, *(void *)(a2 + 80));
      *(void *)(a1 + 72) = v12;
      *(void *)(a1 + 80) = v11;
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  if (v11 >> 60 == 15)
  {
    outlined destroy of Data(a1 + 72);
LABEL_13:
    *(_OWORD *)(a1 + 72) = *(_OWORD *)v10;
    goto LABEL_15;
  }
  uint64_t v13 = *v10;
  outlined copy of Data._Representation(*v10, *(void *)(a2 + 80));
  uint64_t v14 = *(void *)(a1 + 72);
  unint64_t v15 = *(void *)(a1 + 80);
  *(void *)(a1 + 72) = v13;
  *(void *)(a1 + 80) = v11;
  outlined consume of Data._Representation(v14, v15);
LABEL_15:
  uint64_t v16 = (uint64_t *)(a2 + 88);
  unint64_t v17 = *(void *)(a2 + 96);
  if (*(void *)(a1 + 96) >> 60 == 15)
  {
    if (v17 >> 60 != 15)
    {
      uint64_t v18 = *v16;
      outlined copy of Data._Representation(*v16, *(void *)(a2 + 96));
      *(void *)(a1 + 88) = v18;
      *(void *)(a1 + 96) = v17;
      goto LABEL_22;
    }
    goto LABEL_20;
  }
  if (v17 >> 60 == 15)
  {
    outlined destroy of Data(a1 + 88);
LABEL_20:
    *(_OWORD *)(a1 + 88) = *(_OWORD *)v16;
    goto LABEL_22;
  }
  uint64_t v19 = *v16;
  outlined copy of Data._Representation(*v16, *(void *)(a2 + 96));
  uint64_t v20 = *(void *)(a1 + 88);
  unint64_t v21 = *(void *)(a1 + 96);
  *(void *)(a1 + 88) = v19;
  *(void *)(a1 + 96) = v17;
  outlined consume of Data._Representation(v20, v21);
LABEL_22:
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  long long v22 = (long long *)(a1 + 128);
  uint64_t v23 = (long long *)(a2 + 128);
  int v24 = *(unsigned __int8 *)(a2 + 160);
  if (*(unsigned __int8 *)(a1 + 160) == 255)
  {
    if (v24 == 255)
    {
      long long v40 = *v23;
      long long v41 = *(_OWORD *)(a2 + 144);
      *(unsigned char *)(a1 + 160) = *(unsigned char *)(a2 + 160);
      *long long v22 = v40;
      *(_OWORD *)(a1 + 144) = v41;
    }
    else
    {
      uint64_t v34 = *(void *)(a2 + 128);
      uint64_t v35 = *(void *)(a2 + 136);
      uint64_t v36 = *(void *)(a2 + 144);
      uint64_t v37 = *(void *)(a2 + 152);
      outlined copy of PommesCandidateId(v34, v35, v36, v37, *(unsigned char *)(a2 + 160));
      *(void *)(a1 + 128) = v34;
      *(void *)(a1 + 136) = v35;
      *(void *)(a1 + 144) = v36;
      *(void *)(a1 + 152) = v37;
      *(unsigned char *)(a1 + 160) = v24;
    }
  }
  else if (v24 == 255)
  {
    outlined destroy of PommesCandidateId(a1 + 128);
    char v38 = *(unsigned char *)(a2 + 160);
    long long v39 = *(_OWORD *)(a2 + 144);
    *long long v22 = *v23;
    *(_OWORD *)(a1 + 144) = v39;
    *(unsigned char *)(a1 + 160) = v38;
  }
  else
  {
    uint64_t v25 = *(void *)(a2 + 128);
    uint64_t v26 = *(void *)(a2 + 136);
    uint64_t v27 = *(void *)(a2 + 144);
    uint64_t v28 = *(void *)(a2 + 152);
    outlined copy of PommesCandidateId(v25, v26, v27, v28, *(unsigned char *)(a2 + 160));
    uint64_t v29 = *(void *)(a1 + 128);
    uint64_t v30 = *(void *)(a1 + 136);
    uint64_t v31 = *(void *)(a1 + 144);
    uint64_t v32 = *(void *)(a1 + 152);
    *(void *)(a1 + 128) = v25;
    *(void *)(a1 + 136) = v26;
    *(void *)(a1 + 144) = v27;
    *(void *)(a1 + 152) = v28;
    char v33 = *(unsigned char *)(a1 + 160);
    *(unsigned char *)(a1 + 160) = v24;
    outlined consume of PommesCandidateId(v29, v30, v31, v32, v33);
  }
  *(unsigned char *)(a1 + 161) = *(unsigned char *)(a2 + 161);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(void *)(a1 + 216) = *(void *)(a2 + 216);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 224) = *(unsigned char *)(a2 + 224);
  *(unsigned char *)(a1 + 225) = *(unsigned char *)(a2 + 225);
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unint64_t v42 = (uint64_t *)(a2 + 264);
  unint64_t v43 = *(void *)(a2 + 272);
  if (*(void *)(a1 + 272) >> 60 == 15)
  {
    if (v43 >> 60 != 15)
    {
      uint64_t v44 = *v42;
      outlined copy of Data._Representation(*v42, *(void *)(a2 + 272));
      *(void *)(a1 + 264) = v44;
      *(void *)(a1 + 272) = v43;
      goto LABEL_36;
    }
    goto LABEL_34;
  }
  if (v43 >> 60 == 15)
  {
    outlined destroy of Data(a1 + 264);
LABEL_34:
    *(_OWORD *)(a1 + 264) = *(_OWORD *)v42;
    goto LABEL_36;
  }
  uint64_t v45 = *v42;
  outlined copy of Data._Representation(*v42, *(void *)(a2 + 272));
  uint64_t v46 = *(void *)(a1 + 264);
  unint64_t v47 = *(void *)(a1 + 272);
  *(void *)(a1 + 264) = v45;
  *(void *)(a1 + 272) = v43;
  outlined consume of Data._Representation(v46, v47);
LABEL_36:
  char v48 = (uint64_t *)(a2 + 280);
  unint64_t v49 = *(void *)(a2 + 288);
  if (*(void *)(a1 + 288) >> 60 != 15)
  {
    if (v49 >> 60 != 15)
    {
      uint64_t v51 = *v48;
      outlined copy of Data._Representation(*v48, *(void *)(a2 + 288));
      uint64_t v52 = *(void *)(a1 + 280);
      unint64_t v53 = *(void *)(a1 + 288);
      *(void *)(a1 + 280) = v51;
      *(void *)(a1 + 288) = v49;
      outlined consume of Data._Representation(v52, v53);
      goto LABEL_43;
    }
    outlined destroy of Data(a1 + 280);
    goto LABEL_41;
  }
  if (v49 >> 60 == 15)
  {
LABEL_41:
    *(_OWORD *)(a1 + 280) = *(_OWORD *)v48;
    goto LABEL_43;
  }
  uint64_t v50 = *v48;
  outlined copy of Data._Representation(*v48, *(void *)(a2 + 288));
  *(void *)(a1 + 280) = v50;
  *(void *)(a1 + 288) = v49;
LABEL_43:
  uint64_t v54 = *(void **)(a1 + 296);
  uint64_t v55 = *(void **)(a2 + 296);
  *(void *)(a1 + 296) = v55;
  id v56 = v55;

  *(void *)(a1 + 304) = *(void *)(a2 + 304);
  *(void *)(a1 + 312) = *(void *)(a2 + 312);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 320) = *(unsigned char *)(a2 + 320);
  return a1;
}

uint64_t outlined destroy of PommesCandidateId(uint64_t a1)
{
  return a1;
}

void *__swift_memcpy321_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x141uLL);
}

uint64_t assignWithTake for PommesResponse.Builder(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  uint64_t v4 = (_OWORD *)(a2 + 16);
  unint64_t v5 = *(void *)(a1 + 24);
  if (v5 >> 60 == 15) {
    goto LABEL_4;
  }
  unint64_t v6 = *(void *)(a2 + 24);
  if (v6 >> 60 == 15)
  {
    outlined destroy of Data(a1 + 16);
LABEL_4:
    *(_OWORD *)(a1 + 16) = *v4;
    goto LABEL_6;
  }
  uint64_t v7 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)v4;
  *(void *)(a1 + 24) = v6;
  outlined consume of Data._Representation(v7, v5);
LABEL_6:
  uint64_t v8 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v8;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRelease();
  unint64_t v9 = (_OWORD *)(a2 + 72);
  unint64_t v10 = *(void *)(a1 + 80);
  if (v10 >> 60 == 15)
  {
LABEL_9:
    *(_OWORD *)(a1 + 72) = *v9;
    goto LABEL_11;
  }
  unint64_t v11 = *(void *)(a2 + 80);
  if (v11 >> 60 == 15)
  {
    outlined destroy of Data(a1 + 72);
    goto LABEL_9;
  }
  uint64_t v12 = *(void *)(a1 + 72);
  *(void *)(a1 + 72) = *(void *)v9;
  *(void *)(a1 + 80) = v11;
  outlined consume of Data._Representation(v12, v10);
LABEL_11:
  uint64_t v13 = (_OWORD *)(a2 + 88);
  unint64_t v14 = *(void *)(a1 + 96);
  if (v14 >> 60 == 15)
  {
LABEL_14:
    *(_OWORD *)(a1 + 88) = *v13;
    goto LABEL_16;
  }
  unint64_t v15 = *(void *)(a2 + 96);
  if (v15 >> 60 == 15)
  {
    outlined destroy of Data(a1 + 88);
    goto LABEL_14;
  }
  uint64_t v16 = *(void *)(a1 + 88);
  *(void *)(a1 + 88) = *(void *)v13;
  *(void *)(a1 + 96) = v15;
  outlined consume of Data._Representation(v16, v14);
LABEL_16:
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  uint64_t v17 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v17;
  swift_bridgeObjectRelease();
  int v18 = *(unsigned __int8 *)(a1 + 160);
  if (v18 != 255)
  {
    int v19 = *(unsigned __int8 *)(a2 + 160);
    if (v19 != 255)
    {
      uint64_t v20 = *(void *)(a1 + 128);
      uint64_t v21 = *(void *)(a1 + 136);
      uint64_t v22 = *(void *)(a1 + 144);
      uint64_t v23 = *(void *)(a1 + 152);
      long long v24 = *(_OWORD *)(a2 + 144);
      *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
      *(_OWORD *)(a1 + 144) = v24;
      *(unsigned char *)(a1 + 160) = v19;
      outlined consume of PommesCandidateId(v20, v21, v22, v23, v18);
      goto LABEL_21;
    }
    outlined destroy of PommesCandidateId(a1 + 128);
  }
  long long v25 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v25;
  *(unsigned char *)(a1 + 160) = *(unsigned char *)(a2 + 160);
LABEL_21:
  *(unsigned char *)(a1 + 161) = *(unsigned char *)(a2 + 161);
  uint64_t v26 = *(void *)(a2 + 176);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(void *)(a1 + 176) = v26;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  swift_bridgeObjectRelease();
  uint64_t v27 = *(void *)(a2 + 216);
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(void *)(a1 + 216) = v27;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 224) = *(unsigned char *)(a2 + 224);
  *(unsigned char *)(a1 + 225) = *(unsigned char *)(a2 + 225);
  uint64_t v28 = *(void *)(a2 + 240);
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  *(void *)(a1 + 240) = v28;
  swift_bridgeObjectRelease();
  uint64_t v29 = *(void *)(a2 + 256);
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  *(void *)(a1 + 256) = v29;
  swift_bridgeObjectRelease();
  uint64_t v30 = (_OWORD *)(a2 + 264);
  unint64_t v31 = *(void *)(a1 + 272);
  if (v31 >> 60 == 15)
  {
LABEL_24:
    *(_OWORD *)(a1 + 264) = *v30;
    goto LABEL_26;
  }
  unint64_t v32 = *(void *)(a2 + 272);
  if (v32 >> 60 == 15)
  {
    outlined destroy of Data(a1 + 264);
    goto LABEL_24;
  }
  uint64_t v33 = *(void *)(a1 + 264);
  *(void *)(a1 + 264) = *(void *)v30;
  *(void *)(a1 + 272) = v32;
  outlined consume of Data._Representation(v33, v31);
LABEL_26:
  uint64_t v34 = (void *)(a2 + 280);
  unint64_t v35 = *(void *)(a1 + 288);
  if (v35 >> 60 != 15)
  {
    unint64_t v36 = *(void *)(a2 + 288);
    if (v36 >> 60 != 15)
    {
      uint64_t v37 = *(void *)(a1 + 280);
      *(void *)(a1 + 280) = *v34;
      *(void *)(a1 + 288) = v36;
      outlined consume of Data._Representation(v37, v35);
      goto LABEL_31;
    }
    outlined destroy of Data(a1 + 280);
  }
  *(_OWORD *)(a1 + 280) = *(_OWORD *)v34;
LABEL_31:
  char v38 = *(void **)(a1 + 296);
  *(void *)(a1 + 296) = *(void *)(a2 + 296);

  uint64_t v39 = *(void *)(a2 + 312);
  *(void *)(a1 + 304) = *(void *)(a2 + 304);
  *(void *)(a1 + 312) = v39;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 320) = *(unsigned char *)(a2 + 320);
  return a1;
}

uint64_t getEnumTagSinglePayload for PommesResponse.Builder(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 321)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 200);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PommesResponse.Builder(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 312) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(unsigned char *)(result + 320) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 321) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 200) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 321) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PommesResponse.Builder()
{
  return &type metadata for PommesResponse.Builder;
}

uint64_t getEnumTagSinglePayload for PommesCandidateId.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
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
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PommesCandidateId.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *__n128 result = a2 + 2;
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
        JUMPOUT(0x25C92072CLL);
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
          *__n128 result = a2 + 2;
        break;
    }
  }
  return result;
}

void *type metadata accessor for PommesCandidateId.CodingKeys()
{
  return &unk_2709F5D00;
}

void *type metadata accessor for PommesCandidateId.RcCodingKeys()
{
  return &unk_2709F5D90;
}

uint64_t getEnumTagSinglePayload for PommesCandidateId.MedocCodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
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
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PommesCandidateId.MedocCodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *__n128 result = a2 + 1;
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
        JUMPOUT(0x25C9208D8);
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
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *destructiveInjectEnumTag for PommesCandidateId.MedocCodingKeys(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

void *type metadata accessor for PommesCandidateId.MedocCodingKeys()
{
  return &unk_2709F5E20;
}

unsigned char *storeEnumTagSinglePayload for PommesCandidateId.RcCodingKeys(unsigned char *result, int a2, int a3)
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
        *__n128 result = a2;
        return result;
      case 2:
        *(_WORD *)__n128 result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)__n128 result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *__n128 result = 0;
      break;
    case 2:
      *(_WORD *)__n128 result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x25C9209B8);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

void *type metadata accessor for PommesCandidateId.RunPommesCodingKeys()
{
  return &unk_2709F5EB0;
}

double specialized closure #1 in PommesResponse._computedPrimaryQueryConfidence.getter(void *a1)
{
  id v3 = objc_msgSend(self, sel_sharedPreferences);
  id v4 = objc_msgSend(v3, sel_languageCode);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;

    *(void *)&long long v96 = v6;
    *((void *)&v96 + 1) = v8;
    lazy protocol witness table accessor for type String and conformance String();
    uint64_t v9 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
    unint64_t v11 = v10;

    swift_bridgeObjectRelease();
  }
  else
  {

    uint64_t v9 = 0;
    unint64_t v11 = (void *)0xE000000000000000;
  }
  if (one-time initialization token for pommes != -1) {
    swift_once();
  }
  unint64_t v12 = type metadata accessor for Logger();
  __swift_project_value_buffer(v12, (uint64_t)static Logger.pommes);
  swift_bridgeObjectRetain_n();
  uint64_t v13 = a1;
  unint64_t v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.debug.getter();
  unint64_t v16 = 0x26A5DD000uLL;
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v95 = swift_slowAlloc();
    *(void *)&long long v96 = v95;
    *(_DWORD *)uint64_t v17 = 136315394;
    swift_bridgeObjectRetain();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v9, (unint64_t)v11, (uint64_t *)&v96);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v17 + 12) = 2080;
    unint64_t v18 = v12;
    uint64_t v19 = *(void *)((char *)v13 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_metadataDomainName);
    unint64_t v20 = *(void *)((char *)v13 + OBJC_IVAR____TtC21SiriInformationSearch14PommesResponse_metadataDomainName + 8);
    swift_bridgeObjectRetain();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v19, v20, (uint64_t *)&v96);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    unint64_t v12 = v18;
    unint64_t v16 = 0x26A5DD000;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C8FE000, v14, v15, "locale: %s, metadataDomainName: %s", (uint8_t *)v17, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x261199590](v95, -1, -1);
    MEMORY[0x261199590](v17, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  id v21 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  uint64_t v22 = (void *)MEMORY[0x261198B80](0xD000000000000011, 0x800000025C981BF0);
  uint64_t v23 = (uint64_t)objc_msgSend(v21, sel_initWithSuiteName_, v22);

  if (!v23)
  {
LABEL_14:
    uint64_t v28 = (void *)((char *)v13 + *(void *)(v16 + 2224));
    uint64_t v23 = *v28;
    unint64_t v12 = v28[1];
    uint64_t v29 = HIBYTE(v12) & 0xF;
    if ((v12 & 0x2000000000000000) == 0) {
      uint64_t v29 = v23 & 0xFFFFFFFFFFFFLL;
    }
    if (!v29)
    {
      swift_bridgeObjectRelease();
      unint64_t v42 = Logger.logObject.getter();
      os_log_type_t v43 = static os_log_type_t.debug.getter();
      if (!os_log_type_enabled(v42, v43))
      {
LABEL_72:

        return 0.0;
      }
      uint64_t v44 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v44 = 0;
      uint64_t v45 = "Domain name is empty. Query confidence: 0";
      goto LABEL_70;
    }
    swift_bridgeObjectRetain_n();
    uint64_t v30 = v9;
    specialized FeatureFlag.domainLocaleFeature(_:_:)(v23, v12, v9, v11);
    uint64_t v31 = StaticString.description.getter();
    unint64_t v33 = v32;
    uint64_t v34 = swift_bridgeObjectRelease();
    if ((v33 & 0x2000000000000000) != 0) {
      uint64_t v38 = HIBYTE(v33) & 0xF;
    }
    else {
      uint64_t v38 = v31 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v39 = (void *)MEMORY[0x263F8EED0];
    if ((v23 == 7300455 && v12 == 0xE300000000000000
       || (uint64_t v34 = _stringCompareWithSmolCheck(_:_:expecting:)(), (v34 & 1) != 0)
       || v23 == 1936744813 && v12 == 0xE400000000000000
       || (uint64_t v34 = _stringCompareWithSmolCheck(_:_:expecting:)(), (v34 & 1) != 0))
      && (uint64_t v40 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))((*v39 & *v13) + 0x228))(v34, v35, v36, v37), v41))
    {
      if (v40 == 20035 && v41 == 0xE200000000000000)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
LABEL_39:
        swift_bridgeObjectRelease();
        uint64_t v50 = Logger.logObject.getter();
        os_log_type_t v51 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v50, v51))
        {
          uint64_t v52 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v52 = 0;
          _os_log_impl(&dword_25C8FE000, v50, v51, "CN-specific override for Geo traffic. Falling through without FF check", v52, 2u);
          MEMORY[0x261199590](v52, -1, -1);
        }

        goto LABEL_50;
      }
      char v49 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v49)
      {
        swift_bridgeObjectRelease();
        goto LABEL_39;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    if (v38)
    {
      *((void *)&v97 + 1) = &type metadata for FeatureFlag;
      unint64_t v98 = lazy protocol witness table accessor for type FeatureFlag and conformance FeatureFlag();
      uint64_t v54 = swift_allocObject();
      *(void *)&long long v96 = v54;
      *(void *)(v54 + 16) = v23;
      *(void *)(v54 + 24) = v12;
      uint64_t v55 = v30;
      *(void *)(v54 + 32) = v30;
      *(void *)(v54 + 40) = v11;
      *(unsigned char *)(v54 + 48) = 1;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      char v56 = isFeatureEnabled(_:)();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v96);
      if (v56)
      {
        swift_bridgeObjectRelease();
LABEL_49:
        uint64_t v53 = swift_bridgeObjectRelease();
LABEL_50:
        unint64_t v63 = (*(uint64_t (**)(uint64_t))((*v39 & *v13) + 0x140))(v53);
        unint64_t v64 = v63;
        if (v63 >> 62)
        {
          if (_CocoaArrayWrapper.endIndex.getter()) {
            goto LABEL_52;
          }
        }
        else if (*(void *)((v63 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
LABEL_52:
          if ((v64 & 0xC000000000000001) != 0)
          {
            id v65 = (id)MEMORY[0x261198DD0](0, v64);
            goto LABEL_55;
          }
          if (*(void *)((v64 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            id v65 = *(id *)(v64 + 32);
LABEL_55:
            id v66 = v65;
            swift_bridgeObjectRelease();
            uint64_t v67 = v66;
            uint64_t v68 = Logger.logObject.getter();
            os_log_type_t v69 = static os_log_type_t.debug.getter();
            if (os_log_type_enabled(v68, v69))
            {
              uint64_t v70 = (uint8_t *)swift_slowAlloc();
              *(_DWORD *)uint64_t v70 = 134217984;
              id v71 = v39;
              *(void *)&long long v96 = (*(double (**)(uint8_t *, uint64_t, uint64_t, uint64_t))((*v39 & *v67) + 0xA0))(v70, v72, v73, v74);
              UnsafeMutableRawBufferPointer.copyMemory(from:)();

              _os_log_impl(&dword_25C8FE000, v68, v69, "Pommes result primary experience query confidence: %f", v70, 0xCu);
              MEMORY[0x261199590](v70, -1, -1);
            }
            else
            {

              id v71 = v39;
            }
            double v1 = (*(double (**)(uint64_t, uint64_t, uint64_t, uint64_t))((*v71 & *v67) + 0xA0))(v75, v76, v77, v78);

            return v1;
          }
          __break(1u);
          goto LABEL_77;
        }
        swift_bridgeObjectRelease();
        unint64_t v42 = Logger.logObject.getter();
        os_log_type_t v43 = static os_log_type_t.debug.getter();
        if (!os_log_type_enabled(v42, v43)) {
          goto LABEL_72;
        }
        uint64_t v44 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v44 = 0;
        uint64_t v45 = "Pommes result has no experiences. Query confidence: 0";
LABEL_70:
        _os_log_impl(&dword_25C8FE000, v42, v43, v45, v44, 2u);
        uint64_t v93 = (uint64_t)v44;
        goto LABEL_71;
      }
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      unint64_t v42 = Logger.logObject.getter();
      os_log_type_t v79 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v42, v79))
      {
        uint64_t v80 = swift_slowAlloc();
        uint64_t v81 = swift_slowAlloc();
        *(void *)&long long v96 = v81;
        *(_DWORD *)uint64_t v80 = 136315394;
        uint64_t v82 = StaticString.description.getter();
        getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v82, v83, (uint64_t *)&v96);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v80 + 12) = 2080;
        specialized FeatureFlag.domainLocaleFeature(_:_:)(v23, v12, v55, v11);
        uint64_t v84 = StaticString.description.getter();
        getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v84, v85, (uint64_t *)&v96);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25C8FE000, v42, v79, "%s\\%s featureflag is disabled. Query confidence: 0", (uint8_t *)v80, 0x16u);
        swift_arrayDestroy();
        uint64_t v86 = v81;
LABEL_64:
        MEMORY[0x261199590](v86, -1, -1);
        uint64_t v93 = v80;
LABEL_71:
        MEMORY[0x261199590](v93, -1, -1);
        goto LABEL_72;
      }

      swift_bridgeObjectRelease_n();
    }
    else
    {
      swift_bridgeObjectRelease();
      specialized FeatureFlag.domainFeature(for:)(v23, v12);
      uint64_t v57 = StaticString.description.getter();
      unint64_t v59 = v58;
      swift_bridgeObjectRelease();
      uint64_t v60 = HIBYTE(v59) & 0xF;
      if ((v59 & 0x2000000000000000) == 0) {
        uint64_t v60 = v57 & 0xFFFFFFFFFFFFLL;
      }
      if (!v60) {
        goto LABEL_49;
      }
      *((void *)&v97 + 1) = &type metadata for FeatureFlag;
      unint64_t v98 = lazy protocol witness table accessor for type FeatureFlag and conformance FeatureFlag();
      uint64_t v61 = swift_allocObject();
      *(void *)&long long v96 = v61;
      *(void *)(v61 + 16) = v23;
      *(void *)(v61 + 24) = v12;
      *(void *)(v61 + 32) = 0;
      *(void *)(v61 + 40) = 0;
      *(unsigned char *)(v61 + 48) = 0;
      swift_bridgeObjectRetain();
      char v62 = isFeatureEnabled(_:)();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v96);
      if (v62) {
        goto LABEL_49;
      }
      swift_bridgeObjectRetain_n();
      unint64_t v42 = Logger.logObject.getter();
      os_log_type_t v87 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v42, v87))
      {
        uint64_t v80 = swift_slowAlloc();
        uint64_t v88 = swift_slowAlloc();
        *(void *)&long long v96 = v88;
        *(_DWORD *)uint64_t v80 = 136315394;
        uint64_t v89 = StaticString.description.getter();
        getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v89, v90, (uint64_t *)&v96);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v80 + 12) = 2080;
        specialized FeatureFlag.domainFeature(for:)(v23, v12);
        uint64_t v91 = StaticString.description.getter();
        getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v91, v92, (uint64_t *)&v96);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25C8FE000, v42, v87, "%s\\%s featureflag is disabled. Query confidence: 0", (uint8_t *)v80, 0x16u);
        swift_arrayDestroy();
        uint64_t v86 = v88;
        goto LABEL_64;
      }
    }
    swift_bridgeObjectRelease_n();
    return 0.0;
  }
  long long v24 = (void *)MEMORY[0x261198B80](0xD000000000000024, 0x800000025C981C10);
  id v25 = objc_msgSend((id)v23, sel_objectForKey_, v24);

  if (!v25)
  {
    long long v96 = 0u;
    long long v97 = 0u;

    outlined destroy of ClientExperienceSignals?((uint64_t)&v96, (uint64_t *)&demangling cache variable for type metadata for Any?);
    goto LABEL_14;
  }
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  outlined destroy of ClientExperienceSignals?((uint64_t)&v96, (uint64_t *)&demangling cache variable for type metadata for Any?);
  uint64_t v26 = (void *)MEMORY[0x261198B80](0xD000000000000024, 0x800000025C981C10);
  objc_msgSend((id)v23, sel_doubleForKey_, v26);
  double v1 = v27;

  if (v1 < 0.0)
  {

    goto LABEL_14;
  }
  swift_bridgeObjectRelease();
  if (one-time initialization token for overrides != -1) {
LABEL_77:
  }
    swift_once();
  __swift_project_value_buffer(v12, (uint64_t)static Logger.overrides);
  uint64_t v46 = Logger.logObject.getter();
  os_log_type_t v47 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v46, v47))
  {
    char v48 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)char v48 = 134217984;
    *(double *)&long long v96 = v1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&dword_25C8FE000, v46, v47, "Developer override for Pommes query confidence: %f", v48, 0xCu);
    MEMORY[0x261199590](v48, -1, -1);
  }

  return v1;
}

unint64_t lazy protocol witness table accessor for type FeatureFlag and conformance FeatureFlag()
{
  unint64_t result = lazy protocol witness table cache variable for type FeatureFlag and conformance FeatureFlag;
  if (!lazy protocol witness table cache variable for type FeatureFlag and conformance FeatureFlag)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FeatureFlag and conformance FeatureFlag);
  }
  return result;
}

uint64_t sub_25C921C54()
{
  outlined consume of FeatureFlag(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(unsigned char *)(v0 + 48));

  return MEMORY[0x270FA0238](v0, 49, 7);
}

uint64_t outlined consume of FeatureFlag(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t result = swift_bridgeObjectRelease();
  if (a5)
  {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t outlined release of PommesCandidateId?(uint64_t a1, void (*a2)(void, void, void, void, void))
{
  return a1;
}

Swift::Int specialized RawRepresentable<>.hashValue.getter()
{
  return Hasher._finalize()();
}

{
  Hasher.init(_seed:)();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t specialized RawRepresentable<>.hash(into:)()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

{
  uint64_t vars8;

  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

{
  uint64_t vars8;

  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int specialized RawRepresentable<>._rawHashValue(seed:)()
{
  return Hasher._finalize()();
}

{
  Hasher.init(_seed:)();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

id Experience.init(pluginId:queryConfidence:)(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v7 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v3[OBJC_IVAR____TtC21SiriInformationSearch10Experience_associatedEntities] = MEMORY[0x263F8EE78];
  unint64_t v11 = &v3[OBJC_IVAR____TtC21SiriInformationSearch10Experience_pluginIdentifier];
  *(void *)unint64_t v11 = a1;
  *((void *)v11 + 1) = a2;
  *(double *)&v3[OBJC_IVAR____TtC21SiriInformationSearch10Experience_queryConfidence] = a3;
  unint64_t v12 = v3;
  Siri_Nlu_External_UserDialogAct.init()();
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v12[OBJC_IVAR____TtC21SiriInformationSearch10Experience_userDialogAct], v10, v7);
  *(void *)&v12[OBJC_IVAR____TtC21SiriInformationSearch10Experience_renderOptions] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for PommesRenderOptions(0)), sel_init);
  uint64_t v13 = &v12[OBJC_IVAR____TtC21SiriInformationSearch10Experience_intent];
  uint64_t v14 = *MEMORY[0x263F5CA28];
  uint64_t v15 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 104))(v13, v14, v15);

  unint64_t v16 = (objc_class *)type metadata accessor for Experience(0);
  v18.receiver = v12;
  v18.super_class = v16;
  return objc_msgSendSuper2(&v18, sel_init);
}

Swift::Void __swiftcall Experience.encode(with:)(NSCoder with)
{
  int v2 = v1;
  uint64_t v4 = type metadata accessor for Apple_Parsec_Siri_Context_ResultEntity();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (void *)MEMORY[0x263F8EED0];
  uint64_t v10 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v1) + 0x88))(v6);
  unint64_t v11 = (void *)MEMORY[0x261198B80](v10);
  swift_bridgeObjectRelease();
  unint64_t v12 = (void *)MEMORY[0x261198B80](0xD000000000000010, 0x800000025C9820D0);
  [(objc_class *)with.super.isa encodeObject:v11 forKey:v12];

  double v13 = (*(double (**)(void))((*v9 & *v2) + 0xA0))();
  uint64_t v14 = (void *)MEMORY[0x261198B80](0x6E6F437972657571, 0xEF65636E65646966);
  [(objc_class *)with.super.isa encodeDouble:v14 forKey:v13];

  uint64_t v15 = (void *)(*(uint64_t (**)(void))((*v9 & *v2) + 0xB8))();
  unint64_t v16 = (void *)MEMORY[0x261198B80](0x704F7265646E6572, 0xED0000736E6F6974);
  [(objc_class *)with.super.isa encodeObject:v15 forKey:v16];

  uint64_t v17 = (*(uint64_t (**)(void))((*v9 & *v2) + 0xF8))();
  uint64_t v18 = *(void *)(v17 + 16);
  if (v18)
  {
    v40[1] = v2;
    Class isa = with.super.isa;
    unint64_t v20 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v19 = v5 + 16;
    unint64_t v21 = v17 + ((*(unsigned __int8 *)(v19 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 64));
    uint64_t v46 = (void (**)(char *, uint64_t))(v19 - 8);
    os_log_type_t v47 = v20;
    uint64_t v45 = *(void *)(v19 + 56);
    v40[0] = v17;
    swift_bridgeObjectRetain();
    char v48 = (void *)MEMORY[0x263F8EE78];
    *(void *)&long long v22 = 136315138;
    long long v43 = v22;
    uint64_t v42 = MEMORY[0x263F8EE58] + 8;
    uint64_t v44 = v8;
    do
    {
      v47(v8, v21, v4);
      lazy protocol witness table accessor for type Apple_Parsec_Siri_Context_ResultEntity and conformance Apple_Parsec_Siri_Context_ResultEntity(&lazy protocol witness table cache variable for type Apple_Parsec_Siri_Context_ResultEntity and conformance Apple_Parsec_Siri_Context_ResultEntity, MEMORY[0x263F5CDC0]);
      uint64_t v23 = Message.serializedData(partial:)();
      uint64_t v25 = v24;
      (*v46)(v8, v4);
      if (swift_isUniquelyReferenced_nonNull_native()) {
        uint64_t v26 = v48;
      }
      else {
        uint64_t v26 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v48[2] + 1, 1, v48);
      }
      unint64_t v28 = v26[2];
      unint64_t v27 = v26[3];
      if (v28 >= v27 >> 1) {
        uint64_t v26 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v27 > 1), v28 + 1, 1, v26);
      }
      v26[2] = v28 + 1;
      char v48 = v26;
      uint64_t v29 = &v26[2 * v28];
      v29[4] = v23;
      v29[5] = v25;
      v21 += v45;
      --v18;
    }
    while (v18);
    swift_bridgeObjectRelease_n();
    with.super.Class isa = isa;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  Class v30 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  uint64_t v31 = (void *)MEMORY[0x261198B80](0xD000000000000012, 0x800000025C982110);
  [(objc_class *)with.super.isa encodeObject:v30 forKey:v31];

  type metadata accessor for Siri_Nlu_External_UserDialogAct();
  lazy protocol witness table accessor for type Apple_Parsec_Siri_Context_ResultEntity and conformance Apple_Parsec_Siri_Context_ResultEntity(&lazy protocol witness table cache variable for type Siri_Nlu_External_UserDialogAct and conformance Siri_Nlu_External_UserDialogAct, MEMORY[0x263F71570]);
  uint64_t v32 = Message.serializedData(partial:)();
  unint64_t v34 = v33;
  Class v35 = Data._bridgeToObjectiveC()().super.isa;
  uint64_t v36 = (void *)MEMORY[0x261198B80](0x6C61694472657375, 0xED0000746341676FLL);
  [(objc_class *)with.super.isa encodeObject:v35 forKey:v36];

  uint64_t v37 = outlined consume of Data._Representation(v32, v34);
  uint64_t v38 = MEMORY[0x2611985A0](v37);
  uint64_t v39 = (void *)MEMORY[0x261198B80](0x746E65746E69, 0xE600000000000000);
  [(objc_class *)with.super.isa encodeInteger:v38 forKey:v39];
}

id Experience.init(coder:)(void *a1)
{
  unint64_t v3 = 0xD000000000000010;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent?);
  ((void (*)(void))MEMORY[0x270FA5388])();
  unint64_t v90 = (char *)&v82 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v89 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent();
  uint64_t v97 = *(void *)(v89 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v88 = (char *)&v82 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for BinaryDecodingOptions();
  ((void (*)(void))MEMORY[0x270FA5388])();
  unint64_t v92 = (char *)&v82 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UserDialogAct?);
  ((void (*)(void))MEMORY[0x270FA5388])();
  long long v96 = (char *)&v82 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v94 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  uint64_t v95 = *(void *)(v94 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v91 = (char *)&v82 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_Context_ResultEntity?);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v10 = (char *)&v82 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for Apple_Parsec_Siri_Context_ResultEntity();
  uint64_t v100 = *(void *)(v11 - 8);
  uint64_t v12 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v14 = (char *)&v82 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v99 = (char *)&v82 - v15;
  unint64_t v16 = &v1[OBJC_IVAR____TtC21SiriInformationSearch10Experience_associatedEntities];
  *(void *)&v1[OBJC_IVAR____TtC21SiriInformationSearch10Experience_associatedEntities] = MEMORY[0x263F8EE78];
  type metadata accessor for NSArray(0, (unint64_t *)&lazy cache variable for type metadata for NSString);
  uint64_t v17 = v1;
  uint64_t v18 = NSCoder.decodeObject<A>(of:forKey:)();
  if (!v18
    || (uint64_t v19 = (void *)v18,
        long long v106 = 0uLL,
        static String._conditionallyBridgeFromObjectiveC(_:result:)(),
        v19,
        (uint64_t v20 = *((void *)&v106 + 1)) == 0))
  {
    if (one-time initialization token for pommes != -1) {
      swift_once();
    }
    uint64_t v42 = type metadata accessor for Logger();
    __swift_project_value_buffer(v42, (uint64_t)static Logger.pommes);
    long long v43 = Logger.logObject.getter();
    os_log_type_t v44 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v43, v44))
    {
      uint64_t v45 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v45 = 0;
      _os_log_impl(&dword_25C8FE000, v43, v44, "Experience missing pluginID in coder", v45, 2u);
      MEMORY[0x261199590](v45, -1, -1);
    }

    goto LABEL_42;
  }
  unint64_t v98 = v14;
  unint64_t v21 = &v17[OBJC_IVAR____TtC21SiriInformationSearch10Experience_pluginIdentifier];
  *(void *)unint64_t v21 = v106;
  *((void *)v21 + 1) = v20;
  uint64_t v86 = v21;
  long long v22 = (void *)MEMORY[0x261198B80](0x6E6F437972657571, 0xEF65636E65646966);
  objc_msgSend(a1, sel_decodeDoubleForKey_, v22);
  uint64_t v24 = v23;

  *(void *)&v17[OBJC_IVAR____TtC21SiriInformationSearch10Experience_queryConfidence] = v24;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject.Type>);
  uint64_t v25 = swift_allocObject();
  *(_OWORD *)(v25 + 16) = xmmword_25C97F8F0;
  *(void *)(v25 + 32) = type metadata accessor for NSArray(0, &lazy cache variable for type metadata for NSArray);
  id v26 = (id)type metadata accessor for NSArray(0, (unint64_t *)&lazy cache variable for type metadata for NSData);
  *(void *)(v25 + 40) = v26;
  NSCoder.decodeObject(of:forKey:)();
  swift_bridgeObjectRelease();
  id v87 = v26;
  if (!*((void *)&v107 + 1))
  {
    outlined destroy of ClientExperienceSignals?((uint64_t)&v106, (uint64_t *)&demangling cache variable for type metadata for Any?);
    goto LABEL_27;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [NSData]);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_27:
    uint64_t v46 = (uint64_t)v96;
    uint64_t v47 = v97;
    if (one-time initialization token for pommes != -1) {
      swift_once();
    }
    uint64_t v48 = type metadata accessor for Logger();
    __swift_project_value_buffer(v48, (uint64_t)static Logger.pommes);
    char v49 = Logger.logObject.getter();
    os_log_type_t v50 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v49, v50))
    {
      os_log_type_t v51 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v51 = 0;
      _os_log_impl(&dword_25C8FE000, v49, v50, "Experience missing entities in coder", v51, 2u);
      MEMORY[0x261199590](v51, -1, -1);
    }

    Class v30 = 0;
    goto LABEL_34;
  }
  unint64_t v27 = v104;
  if (v104 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v28 = _CocoaArrayWrapper.endIndex.getter();
  }
  else
  {
    uint64_t v28 = *(void *)((v104 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  unint64_t v85 = a1;
  uint64_t v84 = v17;
  unint64_t v83 = (unint64_t *)v16;
  if (v28)
  {
    if (v28 < 1)
    {
      __break(1u);
      goto LABEL_60;
    }
    uint64_t v29 = 0;
    Class v30 = 0;
    id v102 = (unsigned int (**)(char *, uint64_t, uint64_t))(v100 + 48);
    unint64_t v103 = v27 & 0xC000000000000001;
    uint64_t v31 = (void (**)(char *, char *, uint64_t))(v100 + 32);
    unint64_t v32 = MEMORY[0x263F8EE78];
    unint64_t v33 = v98;
    unint64_t v93 = v27;
    do
    {
      uint64_t v34 = v28;
      if (v103) {
        id v35 = (id)MEMORY[0x261198DD0](v29, v27);
      }
      else {
        id v35 = *(id *)(v27 + 8 * v29 + 32);
      }
      uint64_t v36 = v35;
      *(void *)&long long v106 = v35;
      closure #1 in Experience.init(coder:)((uint64_t)v10);

      if ((*v102)(v10, 1, v11) == 1)
      {
        outlined destroy of ClientExperienceSignals?((uint64_t)v10, &demangling cache variable for type metadata for Apple_Parsec_Siri_Context_ResultEntity?);
      }
      else
      {
        uint64_t v101 = v30;
        uint64_t v37 = *v31;
        uint64_t v38 = v99;
        (*v31)(v99, v10, v11);
        v37(v33, v38, v11);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v32 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v32 + 16) + 1, 1, v32, &demangling cache variable for type metadata for _ContiguousArrayStorage<Apple_Parsec_Siri_Context_ResultEntity>, MEMORY[0x263F5CDC0], MEMORY[0x263F5CDC0]);
        }
        unint64_t v40 = *(void *)(v32 + 16);
        unint64_t v39 = *(void *)(v32 + 24);
        if (v40 >= v39 >> 1) {
          unint64_t v32 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v39 > 1, v40 + 1, 1, v32, &demangling cache variable for type metadata for _ContiguousArrayStorage<Apple_Parsec_Siri_Context_ResultEntity>, MEMORY[0x263F5CDC0], MEMORY[0x263F5CDC0]);
        }
        *(void *)(v32 + 16) = v40 + 1;
        unint64_t v41 = v32
            + ((*(unsigned __int8 *)(v100 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v100 + 80))
            + *(void *)(v100 + 72) * v40;
        unint64_t v33 = v98;
        v37((char *)v41, v98, v11);
        unint64_t v27 = v93;
        Class v30 = v101;
      }
      ++v29;
      uint64_t v28 = v34;
    }
    while (v34 != v29);
  }
  else
  {
    Class v30 = 0;
    unint64_t v32 = MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRelease_n();
  uint64_t v52 = v83;
  swift_beginAccess();
  *uint64_t v52 = v32;
  swift_bridgeObjectRelease();
  a1 = v85;
  uint64_t v17 = v84;
  uint64_t v46 = (uint64_t)v96;
  uint64_t v47 = v97;
LABEL_34:
  uint64_t v53 = NSCoder.decodeObject<A>(of:forKey:)();
  if (v53)
  {
    id v26 = v53;
    static Data._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v108 = 0;
    long long v106 = 0u;
    long long v107 = 0u;
    BinaryDecodingOptions.init()();
    lazy protocol witness table accessor for type Apple_Parsec_Siri_Context_ResultEntity and conformance Apple_Parsec_Siri_Context_ResultEntity(&lazy protocol witness table cache variable for type Siri_Nlu_External_UserDialogAct and conformance Siri_Nlu_External_UserDialogAct, MEMORY[0x263F71570]);
    unint64_t v3 = v94;
    Message.init(serializedData:extensions:partial:options:)();
    if (v30)
    {

      (*(void (**)(uint64_t, uint64_t, uint64_t, unint64_t))(v95 + 56))(v46, 1, 1, v3);
      outlined destroy of ClientExperienceSignals?(v46, &demangling cache variable for type metadata for Siri_Nlu_External_UserDialogAct?);
      goto LABEL_37;
    }
    uint64_t v60 = v95;
    (*(void (**)(uint64_t, void, uint64_t, unint64_t))(v95 + 56))(v46, 0, 1, v3);
    uint64_t v61 = v91;
    (*(void (**)(char *, uint64_t, unint64_t))(v60 + 32))(v91, v46, v3);
    uint64_t v28 = (uint64_t)&unk_26B357000;
    (*(void (**)(char *, char *, unint64_t))(v60 + 16))(&v17[OBJC_IVAR____TtC21SiriInformationSearch10Experience_userDialogAct], v61, v3);
    type metadata accessor for PommesRenderOptions(0);
    char v62 = NSCoder.decodeObject<A>(of:forKey:)();
    if (v62)
    {
      *(void *)&v17[OBJC_IVAR____TtC21SiriInformationSearch10Experience_renderOptions] = v62;
      id v63 = v62;
      unint64_t v64 = (void *)MEMORY[0x261198B80](0x746E65746E69, 0xE600000000000000);
      objc_msgSend(a1, sel_decodeIntegerForKey_, v64);

      uint64_t v65 = (uint64_t)v90;
      Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent.init(rawValue:)();
      uint64_t v66 = v89;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v47 + 48))(v65, 1, v89) != 1)
      {
        (*(void (**)(char *, uint64_t))(v95 + 8))(v91, v94);

        os_log_type_t v79 = *(void (**)(char *, uint64_t, uint64_t))(v47 + 32);
        uint64_t v80 = v88;
        v79(v88, v65, v66);
        v79(&v17[OBJC_IVAR____TtC21SiriInformationSearch10Experience_intent], (uint64_t)v80, v66);

        uint64_t v81 = (objc_class *)type metadata accessor for Experience(0);
        v105.receiver = v17;
        v105.super_class = v81;
        id v58 = objc_msgSendSuper2(&v105, sel_init);

        return v58;
      }
      outlined destroy of ClientExperienceSignals?(v65, (uint64_t *)&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent?);
      if (one-time initialization token for pommes != -1) {
        swift_once();
      }
      uint64_t v67 = type metadata accessor for Logger();
      __swift_project_value_buffer(v67, (uint64_t)static Logger.pommes);
      uint64_t v68 = Logger.logObject.getter();
      os_log_type_t v69 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v68, v69))
      {
        uint64_t v70 = v17;
        id v71 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v71 = 0;
        _os_log_impl(&dword_25C8FE000, v68, v69, "Unable to decode intent", v71, 2u);
        uint64_t v72 = v71;
        uint64_t v17 = v70;
        MEMORY[0x261199590](v72, -1, -1);
      }

      uint64_t v73 = *(void (**)(char *, uint64_t))(v95 + 8);
      unint64_t v3 = v94;
      v73(v91, v94);
      swift_bridgeObjectRelease();

      goto LABEL_56;
    }
    if (one-time initialization token for pommes == -1)
    {
LABEL_53:
      uint64_t v74 = type metadata accessor for Logger();
      __swift_project_value_buffer(v74, (uint64_t)static Logger.pommes);
      uint64_t v75 = Logger.logObject.getter();
      os_log_type_t v76 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v75, v76))
      {
        uint64_t v77 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v77 = 0;
        _os_log_impl(&dword_25C8FE000, v75, v76, "Experience failed to extract renderOptions", v77, 2u);
        uint64_t v78 = v77;
        unint64_t v3 = v94;
        MEMORY[0x261199590](v78, -1, -1);
      }

      uint64_t v73 = *(void (**)(char *, uint64_t))(v95 + 8);
      v73(v91, v3);
      swift_bridgeObjectRelease();
LABEL_56:
      swift_bridgeObjectRelease();
      v73(&v17[*(void *)(v28 + 1432)], v3);
      goto LABEL_43;
    }
LABEL_60:
    swift_once();
    goto LABEL_53;
  }
LABEL_37:
  if (one-time initialization token for pommes != -1) {
    swift_once();
  }
  uint64_t v54 = type metadata accessor for Logger();
  __swift_project_value_buffer(v54, (uint64_t)static Logger.pommes);
  uint64_t v55 = Logger.logObject.getter();
  os_log_type_t v56 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v55, v56))
  {
    uint64_t v57 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v57 = 0;
    _os_log_impl(&dword_25C8FE000, v55, v56, "Unable to decode userDialogActData", v57, 2u);
    MEMORY[0x261199590](v57, -1, -1);
  }

  swift_bridgeObjectRelease();
LABEL_42:
  swift_bridgeObjectRelease();
LABEL_43:

  type metadata accessor for Experience(0);
  swift_deallocPartialClassInstance();
  return 0;
}

uint64_t Experience.pluginIdentifier.getter()
{
  double v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch10Experience_pluginIdentifier);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

id Experience.renderOptions.getter()
{
  double v1 = (void **)(v0 + OBJC_IVAR____TtC21SiriInformationSearch10Experience_renderOptions);
  swift_beginAccess();
  uint64_t v2 = *v1;

  return v2;
}

uint64_t Experience.catIds.getter()
{
  return MEMORY[0x263F8EE78];
}

uint64_t Experience.associatedEntities.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t Experience.associatedEntities.setter(uint64_t a1)
{
  unint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC21SiriInformationSearch10Experience_associatedEntities);
  swift_beginAccess();
  *unint64_t v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*Experience.associatedEntities.modify())()
{
  return AudioExperience.internalSignalsFromSiriAudio.modify;
}

uint64_t type metadata accessor for PommesRenderOptions(uint64_t a1)
{
  return type metadata accessor for AudioExperience.Builder(a1, type metadata singleton initialization cache for PommesRenderOptions);
}

uint64_t type metadata accessor for Experience(uint64_t a1)
{
  return type metadata accessor for AudioExperience.Builder(a1, (uint64_t *)&type metadata singleton initialization cache for Experience);
}

id Experience.init(pluginId:queryConfidence:userDialogAct:)(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  *(void *)&v4[OBJC_IVAR____TtC21SiriInformationSearch10Experience_associatedEntities] = MEMORY[0x263F8EE78];
  uint64_t v6 = &v4[OBJC_IVAR____TtC21SiriInformationSearch10Experience_pluginIdentifier];
  *(void *)uint64_t v6 = a1;
  *((void *)v6 + 1) = a2;
  *(double *)&v4[OBJC_IVAR____TtC21SiriInformationSearch10Experience_queryConfidence] = a4;
  uint64_t v7 = &v4[OBJC_IVAR____TtC21SiriInformationSearch10Experience_userDialogAct];
  uint64_t v8 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  uint64_t v9 = *(void *)(v8 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v7, a3, v8);
  id v10 = objc_allocWithZone((Class)type metadata accessor for PommesRenderOptions(0));
  uint64_t v11 = v4;
  id v12 = objc_msgSend(v10, sel_init);
  *(void *)&v11[OBJC_IVAR____TtC21SiriInformationSearch10Experience_renderOptions] = v12;
  uint64_t v13 = &v11[OBJC_IVAR____TtC21SiriInformationSearch10Experience_intent];
  uint64_t v14 = *MEMORY[0x263F5CA28];
  uint64_t v15 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 104))(v13, v14, v15);

  v18.receiver = v11;
  v18.super_class = (Class)type metadata accessor for Experience(0);
  id v16 = objc_msgSendSuper2(&v18, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a3, v8);
  return v16;
}

id Experience.init(pluginId:queryConfidence:userDialogAct:renderOptions:intent:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6)
{
  *(void *)&v6[OBJC_IVAR____TtC21SiriInformationSearch10Experience_associatedEntities] = MEMORY[0x263F8EE78];
  id v10 = &v6[OBJC_IVAR____TtC21SiriInformationSearch10Experience_pluginIdentifier];
  *(void *)id v10 = a1;
  *((void *)v10 + 1) = a2;
  *(double *)&v6[OBJC_IVAR____TtC21SiriInformationSearch10Experience_queryConfidence] = a6;
  uint64_t v11 = &v6[OBJC_IVAR____TtC21SiriInformationSearch10Experience_userDialogAct];
  uint64_t v12 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  uint64_t v13 = *(void *)(v12 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v11, a3, v12);
  *(void *)&v6[OBJC_IVAR____TtC21SiriInformationSearch10Experience_renderOptions] = a4;
  uint64_t v14 = &v6[OBJC_IVAR____TtC21SiriInformationSearch10Experience_intent];
  uint64_t v15 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent();
  uint64_t v16 = *(void *)(v15 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v14, a5, v15);
  v19.receiver = v6;
  v19.super_class = (Class)type metadata accessor for Experience(0);
  id v17 = objc_msgSendSuper2(&v19, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(a5, v15);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(a3, v12);
  return v17;
}

double Experience.queryConfidence.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC21SiriInformationSearch10Experience_queryConfidence;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t key path setter for Experience.pluginIdentifier : Experience(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = (void *)(*a2 + OBJC_IVAR____TtC21SiriInformationSearch10Experience_pluginIdentifier);
  swift_beginAccess();
  void *v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void key path setter for Experience.renderOptions : Experience(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void **)(*a2 + OBJC_IVAR____TtC21SiriInformationSearch10Experience_renderOptions);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *uint64_t v3 = v2;
  id v5 = v2;
}

uint64_t Experience.userDialogAct.getter@<X0>(uint64_t a1@<X8>)
{
  return Experience.userDialogAct.getter(&OBJC_IVAR____TtC21SiriInformationSearch10Experience_userDialogAct, MEMORY[0x263F71570], a1);
}

uint64_t Experience.intent.getter@<X0>(uint64_t a1@<X8>)
{
  return Experience.userDialogAct.getter(&OBJC_IVAR____TtC21SiriInformationSearch10Experience_intent, MEMORY[0x263F5CA38], a1);
}

uint64_t Experience.userDialogAct.getter@<X0>(void *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = v3 + *a1;
  uint64_t v6 = a2(0);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);

  return v7(a3, v5, v6);
}

id Experience.__allocating_init(pluginId:queryConfidence:)(uint64_t a1, uint64_t a2, double a3)
{
  id v7 = objc_allocWithZone(v3);
  return Experience.init(pluginId:queryConfidence:)(a1, a2, a3);
}

id Experience.__allocating_init(pluginId:queryConfidence:userDialogAct:)(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v9 = (char *)objc_allocWithZone(v4);
  *(void *)&v9[OBJC_IVAR____TtC21SiriInformationSearch10Experience_associatedEntities] = MEMORY[0x263F8EE78];
  id v10 = &v9[OBJC_IVAR____TtC21SiriInformationSearch10Experience_pluginIdentifier];
  *(void *)id v10 = a1;
  *((void *)v10 + 1) = a2;
  *(double *)&v9[OBJC_IVAR____TtC21SiriInformationSearch10Experience_queryConfidence] = a4;
  uint64_t v11 = &v9[OBJC_IVAR____TtC21SiriInformationSearch10Experience_userDialogAct];
  uint64_t v12 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  uint64_t v13 = *(void *)(v12 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v11, a3, v12);
  id v14 = objc_allocWithZone((Class)type metadata accessor for PommesRenderOptions(0));
  uint64_t v15 = v9;
  id v16 = objc_msgSend(v14, sel_init);
  *(void *)&v15[OBJC_IVAR____TtC21SiriInformationSearch10Experience_renderOptions] = v16;
  id v17 = &v15[OBJC_IVAR____TtC21SiriInformationSearch10Experience_intent];
  uint64_t v18 = *MEMORY[0x263F5CA28];
  uint64_t v19 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 104))(v17, v18, v19);

  v22.receiver = v15;
  v22.super_class = v4;
  id v20 = objc_msgSendSuper2(&v22, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(a3, v12);
  return v20;
}

id Experience.__allocating_init(pluginId:queryConfidence:userDialogAct:renderOptions:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  uint64_t v11 = (char *)objc_allocWithZone(v5);
  *(void *)&v11[OBJC_IVAR____TtC21SiriInformationSearch10Experience_associatedEntities] = MEMORY[0x263F8EE78];
  uint64_t v12 = &v11[OBJC_IVAR____TtC21SiriInformationSearch10Experience_pluginIdentifier];
  *(void *)uint64_t v12 = a1;
  *((void *)v12 + 1) = a2;
  *(double *)&v11[OBJC_IVAR____TtC21SiriInformationSearch10Experience_queryConfidence] = a5;
  uint64_t v13 = &v11[OBJC_IVAR____TtC21SiriInformationSearch10Experience_userDialogAct];
  uint64_t v14 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  uint64_t v15 = *(void *)(v14 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v13, a3, v14);
  *(void *)&v11[OBJC_IVAR____TtC21SiriInformationSearch10Experience_renderOptions] = a4;
  id v16 = &v11[OBJC_IVAR____TtC21SiriInformationSearch10Experience_intent];
  uint64_t v17 = *MEMORY[0x263F5CA28];
  uint64_t v18 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 104))(v16, v17, v18);
  v21.receiver = v11;
  v21.super_class = v5;
  id v19 = objc_msgSendSuper2(&v21, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a3, v14);
  return v19;
}

id Experience.init(pluginId:queryConfidence:userDialogAct:renderOptions:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  *(void *)&v5[OBJC_IVAR____TtC21SiriInformationSearch10Experience_associatedEntities] = MEMORY[0x263F8EE78];
  uint64_t v8 = &v5[OBJC_IVAR____TtC21SiriInformationSearch10Experience_pluginIdentifier];
  *(void *)uint64_t v8 = a1;
  *((void *)v8 + 1) = a2;
  *(double *)&v5[OBJC_IVAR____TtC21SiriInformationSearch10Experience_queryConfidence] = a5;
  uint64_t v9 = &v5[OBJC_IVAR____TtC21SiriInformationSearch10Experience_userDialogAct];
  uint64_t v10 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v9, a3, v10);
  *(void *)&v5[OBJC_IVAR____TtC21SiriInformationSearch10Experience_renderOptions] = a4;
  uint64_t v12 = &v5[OBJC_IVAR____TtC21SiriInformationSearch10Experience_intent];
  uint64_t v13 = *MEMORY[0x263F5CA28];
  uint64_t v14 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 104))(v12, v13, v14);
  v17.receiver = v5;
  v17.super_class = (Class)type metadata accessor for Experience(0);
  id v15 = objc_msgSendSuper2(&v17, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a3, v10);
  return v15;
}

id Experience.__allocating_init(pluginId:queryConfidence:userDialogAct:intent:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  id v11 = objc_allocWithZone(v5);
  return Experience.init(pluginId:queryConfidence:userDialogAct:intent:)(a1, a2, a3, a4, a5);
}

id Experience.init(pluginId:queryConfidence:userDialogAct:intent:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  *(void *)&v5[OBJC_IVAR____TtC21SiriInformationSearch10Experience_associatedEntities] = MEMORY[0x263F8EE78];
  uint64_t v8 = &v5[OBJC_IVAR____TtC21SiriInformationSearch10Experience_pluginIdentifier];
  *(void *)uint64_t v8 = a1;
  *((void *)v8 + 1) = a2;
  *(double *)&v5[OBJC_IVAR____TtC21SiriInformationSearch10Experience_queryConfidence] = a5;
  uint64_t v9 = &v5[OBJC_IVAR____TtC21SiriInformationSearch10Experience_userDialogAct];
  uint64_t v10 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v9, a3, v10);
  id v12 = objc_allocWithZone((Class)type metadata accessor for PommesRenderOptions(0));
  uint64_t v13 = v5;
  id v14 = objc_msgSend(v12, sel_init);
  *(void *)&v13[OBJC_IVAR____TtC21SiriInformationSearch10Experience_renderOptions] = v14;
  id v15 = &v13[OBJC_IVAR____TtC21SiriInformationSearch10Experience_intent];
  uint64_t v16 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent();
  uint64_t v17 = *(void *)(v16 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v15, a4, v16);

  v20.receiver = v13;
  v20.super_class = (Class)type metadata accessor for Experience(0);
  id v18 = objc_msgSendSuper2(&v20, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(a4, v16);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a3, v10);
  return v18;
}

id Experience.__allocating_init(pluginId:queryConfidence:userDialogAct:renderOptions:intent:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6)
{
  id v7 = v6;
  id v14 = (char *)objc_allocWithZone(v7);
  *(void *)&v14[OBJC_IVAR____TtC21SiriInformationSearch10Experience_associatedEntities] = MEMORY[0x263F8EE78];
  id v15 = &v14[OBJC_IVAR____TtC21SiriInformationSearch10Experience_pluginIdentifier];
  *(void *)id v15 = a1;
  *((void *)v15 + 1) = a2;
  *(double *)&v14[OBJC_IVAR____TtC21SiriInformationSearch10Experience_queryConfidence] = a6;
  uint64_t v16 = &v14[OBJC_IVAR____TtC21SiriInformationSearch10Experience_userDialogAct];
  uint64_t v17 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  uint64_t v18 = *(void *)(v17 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v16, a3, v17);
  *(void *)&v14[OBJC_IVAR____TtC21SiriInformationSearch10Experience_renderOptions] = a4;
  id v19 = &v14[OBJC_IVAR____TtC21SiriInformationSearch10Experience_intent];
  uint64_t v20 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent();
  uint64_t v21 = *(void *)(v20 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v19, a5, v20);
  v24.receiver = v14;
  v24.super_class = v7;
  id v22 = objc_msgSendSuper2(&v24, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(a5, v20);
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(a3, v17);
  return v22;
}

id Experience.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return Experience.init(coder:)(a1);
}

uint64_t closure #1 in Experience.init(coder:)@<X0>(uint64_t a1@<X8>)
{
  type metadata accessor for BinaryDecodingOptions();
  MEMORY[0x270FA5388]();
  uint64_t v3 = type metadata accessor for Apple_Parsec_Siri_Context_ResultEntity();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Data._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v24 = 0;
  memset(v23, 0, sizeof(v23));
  BinaryDecodingOptions.init()();
  lazy protocol witness table accessor for type Apple_Parsec_Siri_Context_ResultEntity and conformance Apple_Parsec_Siri_Context_ResultEntity(&lazy protocol witness table cache variable for type Apple_Parsec_Siri_Context_ResultEntity and conformance Apple_Parsec_Siri_Context_ResultEntity, MEMORY[0x263F5CDC0]);
  Message.init(serializedData:extensions:partial:options:)();
  if (v1)
  {
    if (one-time initialization token for pommes != -1) {
      swift_once();
    }
    uint64_t v7 = type metadata accessor for Logger();
    __swift_project_value_buffer(v7, (uint64_t)static Logger.pommes);
    id v8 = v1;
    id v9 = v1;
    uint64_t v10 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v10, v11))
    {
      id v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      uint64_t v21 = a1;
      uint64_t v14 = v13;
      *(void *)&v23[0] = v13;
      *(_DWORD *)id v12 = 136315138;
      uint64_t v20 = v12 + 4;
      swift_getErrorValue();
      uint64_t v15 = Error.localizedDescription.getter();
      uint64_t v22 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v16, (uint64_t *)v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_25C8FE000, v10, v11, "Experience ResultEntity failed %s", v12, 0xCu);
      uint64_t v17 = 1;
      swift_arrayDestroy();
      uint64_t v18 = v14;
      a1 = v21;
      MEMORY[0x261199590](v18, -1, -1);
      MEMORY[0x261199590](v12, -1, -1);
    }
    else
    {

      uint64_t v17 = 1;
    }
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(a1, v6, v3);
    uint64_t v17 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56))(a1, v17, 1, v3);
}

id Experience.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void Experience.init()()
{
}

id Experience.__deallocating_deinit()
{
  return Experience.__deallocating_deinit(type metadata accessor for Experience);
}

SiriInformationSearch::PommesRenderOptions::PromptType_optional __swiftcall PommesRenderOptions.PromptType.init(rawValue:)(Swift::String rawValue)
{
  object = rawValue._object;
  v3._uint64_t countAndFlagsBits = rawValue._countAndFlagsBits;
  uint64_t v4 = v1;
  v3._object = object;
  unint64_t v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of PommesRenderOptions.PromptType.init(rawValue:), v3);
  result.value = swift_bridgeObjectRelease();
  char v7 = 3;
  if (v5 < 3) {
    char v7 = v5;
  }
  char *v4 = v7;
  return result;
}

uint64_t PommesRenderOptions.PromptType.rawValue.getter()
{
  unint64_t v1 = 0xD000000000000013;
  if (*v0 != 1) {
    unint64_t v1 = 0xD00000000000001ALL;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x656E696665646E75;
  }
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance PommesRenderOptions.PromptType(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance PommesRenderOptions.PromptType()
{
  return specialized RawRepresentable<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance PommesRenderOptions.PromptType()
{
  return specialized RawRepresentable<>.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance PommesRenderOptions.PromptType()
{
  return specialized RawRepresentable<>._rawHashValue(seed:)();
}

SiriInformationSearch::PommesRenderOptions::PromptType_optional protocol witness for RawRepresentable.init(rawValue:) in conformance PommesRenderOptions.PromptType(Swift::String *a1)
{
  return PommesRenderOptions.PromptType.init(rawValue:)(*a1);
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance PommesRenderOptions.PromptType@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PommesRenderOptions.PromptType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t PommesRenderOptions.isImmersiveExperience.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch19PommesRenderOptions_isImmersiveExperience);
}

uint64_t PommesRenderOptions.isSquawkResponse.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch19PommesRenderOptions_isSquawkResponse);
}

uint64_t PommesRenderOptions.isPhoneCallActive.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch19PommesRenderOptions_isPhoneCallActive);
}

uint64_t PommesRenderOptions.switchProfile.getter@<X0>(uint64_t a1@<X8>)
{
  return outlined init with copy of Apple_Parsec_Siri_V2alpha_SwitchProfileBuilderParams?(v1 + OBJC_IVAR____TtC21SiriInformationSearch19PommesRenderOptions_switchProfile, a1);
}

uint64_t PommesRenderOptions.preserveResultSpaceIfPossible.getter()
{
  return *(unsigned __int8 *)(v0
                            + OBJC_IVAR____TtC21SiriInformationSearch19PommesRenderOptions_preserveResultSpaceIfPossible);
}

uint64_t PommesRenderOptions.promptTypes.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PommesRenderOptions.Builder.isImmersiveExperience.getter()
{
  return *v0;
}

uint64_t PommesRenderOptions.Builder.isImmersiveExperience.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*PommesRenderOptions.Builder.isImmersiveExperience.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

uint64_t PommesRenderOptions.Builder.isSquawkResponse.getter()
{
  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t PommesRenderOptions.Builder.isSquawkResponse.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 1) = result;
  return result;
}

uint64_t (*PommesRenderOptions.Builder.isSquawkResponse.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

uint64_t PommesRenderOptions.Builder.isPhoneCallActive.getter()
{
  return *(unsigned __int8 *)(v0 + 2);
}

uint64_t PommesRenderOptions.Builder.isPhoneCallActive.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 2) = result;
  return result;
}

uint64_t (*PommesRenderOptions.Builder.isPhoneCallActive.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

uint64_t PommesRenderOptions.Builder.switchProfile.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for PommesRenderOptions.Builder(0) + 28);

  return outlined init with copy of Apple_Parsec_Siri_V2alpha_SwitchProfileBuilderParams?(v3, a1);
}

uint64_t PommesRenderOptions.Builder.switchProfile.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for PommesRenderOptions.Builder(0) + 28);

  return outlined assign with take of Apple_Parsec_Siri_V2alpha_SwitchProfileBuilderParams?(a1, v3);
}

uint64_t (*PommesRenderOptions.Builder.switchProfile.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

uint64_t PommesRenderOptions.Builder.preserveResultSpaceIfPossible.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for PommesRenderOptions.Builder(0) + 32));
}

uint64_t PommesRenderOptions.Builder.preserveResultSpaceIfPossible.setter(char a1)
{
  uint64_t result = type metadata accessor for PommesRenderOptions.Builder(0);
  *(unsigned char *)(v1 + *(int *)(result + 32)) = a1;
  return result;
}

uint64_t (*PommesRenderOptions.Builder.preserveResultSpaceIfPossible.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

uint64_t PommesRenderOptions.Builder.promptTypes.getter()
{
  type metadata accessor for PommesRenderOptions.Builder(0);

  return swift_bridgeObjectRetain();
}

uint64_t PommesRenderOptions.Builder.promptTypes.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for PommesRenderOptions.Builder(0) + 36);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*PommesRenderOptions.Builder.promptTypes.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

uint64_t PommesRenderOptions.Builder.init()@<X0>(uint64_t a1@<X8>)
{
  *(_WORD *)a1 = 0;
  *(unsigned char *)(a1 + 2) = 0;
  uint64_t v2 = (int *)type metadata accessor for PommesRenderOptions.Builder(0);
  uint64_t v3 = a1 + v2[7];
  uint64_t v4 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SwitchProfileBuilderParams();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  *(unsigned char *)(a1 + v2[8]) = 0;
  *(void *)(a1 + v2[9]) = MEMORY[0x263F8EE78];
  return result;
}

uint64_t default argument 0 of PommesRenderOptions.Builder.init(isImmersiveExperience:isSquawkResponse:isPhoneCallActive:switchProfile:preserveResultSpaceIfPossible:promptTypes:)()
{
  return 0;
}

uint64_t default argument 1 of PommesRenderOptions.Builder.init(isImmersiveExperience:isSquawkResponse:isPhoneCallActive:switchProfile:preserveResultSpaceIfPossible:promptTypes:)()
{
  return 0;
}

uint64_t default argument 2 of PommesRenderOptions.Builder.init(isImmersiveExperience:isSquawkResponse:isPhoneCallActive:switchProfile:preserveResultSpaceIfPossible:promptTypes:)()
{
  return 0;
}

uint64_t default argument 4 of PommesRenderOptions.Builder.init(isImmersiveExperience:isSquawkResponse:isPhoneCallActive:switchProfile:preserveResultSpaceIfPossible:promptTypes:)()
{
  return 0;
}

uint64_t default argument 5 of PommesRenderOptions.Builder.init(isImmersiveExperience:isSquawkResponse:isPhoneCallActive:switchProfile:preserveResultSpaceIfPossible:promptTypes:)()
{
  return MEMORY[0x263F8EE78];
}

uint64_t PommesRenderOptions.Builder.init(isImmersiveExperience:isSquawkResponse:isPhoneCallActive:switchProfile:preserveResultSpaceIfPossible:promptTypes:)@<X0>(char a1@<W0>, char a2@<W1>, char a3@<W2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, unsigned char *a7@<X8>)
{
  *a7 = a1;
  a7[1] = a2;
  a7[2] = a3;
  os_log_type_t v11 = (int *)type metadata accessor for PommesRenderOptions.Builder(0);
  uint64_t result = outlined init with take of Apple_Parsec_Siri_V2alpha_AudioUnderstanding?(a4, (uint64_t)&a7[v11[7]], &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_SwitchProfileBuilderParams?);
  a7[v11[8]] = a5;
  *(void *)&a7[v11[9]] = a6;
  return result;
}

uint64_t PommesRenderOptions.__allocating_init(isImmersiveExperience:)(char a1)
{
  v3[16] = a1;
  return (*(uint64_t (**)(unsigned char *(*)(unsigned char *), unsigned char *))(v1 + 128))(partial apply for closure #1 in PommesRenderOptions.init(isImmersiveExperience:), v3);
}

uint64_t PommesRenderOptions.__allocating_init(isImmersiveExperience:isSquawkResponse:)(char a1, char a2)
{
  v4[16] = a1;
  v4[17] = a2;
  return (*(uint64_t (**)(unsigned char *(*)(unsigned char *), unsigned char *))(v2 + 128))(partial apply for closure #1 in PommesRenderOptions.init(isImmersiveExperience:isSquawkResponse:), v4);
}

uint64_t PommesRenderOptions.init()()
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v1 = (*(uint64_t (**)(uint64_t (*)(), void))(ObjectType + 128))(destructiveProjectEnumData for UserPromptExperience.PromptType, 0);
  swift_deallocPartialClassInstance();
  return v1;
}

id PommesRenderOptions.__allocating_init(_:)(void (*a1)(char *))
{
  id v3 = objc_allocWithZone(v1);
  return PommesRenderOptions.init(_:)(a1);
}

id PommesRenderOptions.init(_:)(void (*a1)(char *))
{
  uint64_t v3 = type metadata accessor for PommesRenderOptions.Builder(0);
  uint64_t v4 = (int *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_WORD *)uint64_t v6 = 0;
  v6[2] = 0;
  uint64_t v7 = (uint64_t)&v6[v4[9]];
  uint64_t v8 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SwitchProfileBuilderParams();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  uint64_t v9 = v4[10];
  v6[v9] = 0;
  uint64_t v10 = v4[11];
  *(void *)&v6[v10] = MEMORY[0x263F8EE78];
  os_log_type_t v11 = v1;
  a1(v6);
  v11[OBJC_IVAR____TtC21SiriInformationSearch19PommesRenderOptions_isImmersiveExperience] = *v6;
  v11[OBJC_IVAR____TtC21SiriInformationSearch19PommesRenderOptions_isSquawkResponse] = v6[1];
  v11[OBJC_IVAR____TtC21SiriInformationSearch19PommesRenderOptions_isPhoneCallActive] = v6[2];
  outlined init with copy of Apple_Parsec_Siri_V2alpha_SwitchProfileBuilderParams?(v7, (uint64_t)&v11[OBJC_IVAR____TtC21SiriInformationSearch19PommesRenderOptions_switchProfile]);
  v11[OBJC_IVAR____TtC21SiriInformationSearch19PommesRenderOptions_preserveResultSpaceIfPossible] = v6[v9];
  uint64_t v12 = *(void *)&v6[v10];
  swift_bridgeObjectRetain();
  outlined destroy of PommesRenderOptions.Builder((uint64_t)v6);
  *(void *)&v11[OBJC_IVAR____TtC21SiriInformationSearch19PommesRenderOptions_promptTypes] = v12;

  uint64_t v13 = (objc_class *)type metadata accessor for PommesRenderOptions(0);
  v15.receiver = v11;
  v15.super_class = v13;
  return objc_msgSendSuper2(&v15, sel_init);
}

id PommesRenderOptions.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  id v4 = specialized PommesRenderOptions.init(coder:)(a1);

  return v4;
}

id PommesRenderOptions.init(coder:)(void *a1)
{
  id v2 = specialized PommesRenderOptions.init(coder:)(a1);

  return v2;
}

Swift::Void __swiftcall PommesRenderOptions.encode(with:)(NSCoder with)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_SwitchProfileBuilderParams?);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(unsigned __int8 *)(v2 + OBJC_IVAR____TtC21SiriInformationSearch19PommesRenderOptions_isImmersiveExperience);
  uint64_t v8 = (void *)MEMORY[0x261198B80](0x76697372656D6D69, 0xE900000000000065);
  [(objc_class *)with.super.isa encodeBool:v7 forKey:v8];

  uint64_t v9 = *(unsigned __int8 *)(v2 + OBJC_IVAR____TtC21SiriInformationSearch19PommesRenderOptions_isSquawkResponse);
  uint64_t v10 = (void *)MEMORY[0x261198B80](0x6B7761757173, 0xE600000000000000);
  [(objc_class *)with.super.isa encodeBool:v9 forKey:v10];

  uint64_t v11 = *(unsigned __int8 *)(v2 + OBJC_IVAR____TtC21SiriInformationSearch19PommesRenderOptions_isPhoneCallActive);
  uint64_t v12 = (void *)MEMORY[0x261198B80](0x6C6143656E6F6870, 0xEF6576697463416CLL);
  [(objc_class *)with.super.isa encodeBool:v11 forKey:v12];

  outlined init with copy of Apple_Parsec_Siri_V2alpha_SwitchProfileBuilderParams?(v2 + OBJC_IVAR____TtC21SiriInformationSearch19PommesRenderOptions_switchProfile, (uint64_t)v6);
  uint64_t v13 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SwitchProfileBuilderParams();
  uint64_t v14 = *(void *)(v13 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v6, 1, v13) == 1)
  {
    outlined destroy of ClientExperienceSignals?((uint64_t)v6, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_SwitchProfileBuilderParams?);
  }
  else
  {
    lazy protocol witness table accessor for type Apple_Parsec_Siri_Context_ResultEntity and conformance Apple_Parsec_Siri_Context_ResultEntity(&lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_SwitchProfileBuilderParams and conformance Apple_Parsec_Siri_V2alpha_SwitchProfileBuilderParams, MEMORY[0x263F5D080]);
    uint64_t v15 = Message.serializedData(partial:)();
    unint64_t v17 = v16;
    (*(void (**)(char *, uint64_t))(v14 + 8))(v6, v13);
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    id v19 = (void *)MEMORY[0x261198B80](0x7250686374697773, 0xED0000656C69666FLL);
    [(objc_class *)with.super.isa encodeObject:isa forKey:v19];

    outlined consume of Data._Representation(v15, v17);
  }
  uint64_t v20 = *(unsigned __int8 *)(v2
                           + OBJC_IVAR____TtC21SiriInformationSearch19PommesRenderOptions_preserveResultSpaceIfPossible);
  uint64_t v21 = (void *)MEMORY[0x261198B80](0xD00000000000001DLL, 0x800000025C982170);
  [(objc_class *)with.super.isa encodeBool:v20 forKey:v21];

  uint64_t v22 = *(void *)(v2 + OBJC_IVAR____TtC21SiriInformationSearch19PommesRenderOptions_promptTypes);
  uint64_t v23 = *(void *)(v22 + 16);
  if (v23)
  {
    unint64_t v32 = with.super.isa;
    uint64_t v33 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    specialized ContiguousArray.reserveCapacity(_:)();
    uint64_t v24 = 0;
    do
    {
      unint64_t v25 = 0xD00000000000001ALL;
      if (*(unsigned char *)(v22 + v24 + 32) == 1)
      {
        unint64_t v25 = 0xD000000000000013;
        unint64_t v26 = 0x800000025C981530;
      }
      else
      {
        unint64_t v26 = 0x800000025C981550;
      }
      if (*(unsigned char *)(v22 + v24 + 32)) {
        uint64_t v27 = v25;
      }
      else {
        uint64_t v27 = 0x656E696665646E75;
      }
      if (*(unsigned char *)(v22 + v24 + 32)) {
        unint64_t v28 = v26;
      }
      else {
        unint64_t v28 = 0xE900000000000064;
      }
      ++v24;
      MEMORY[0x261198B80](v27, v28);
      swift_bridgeObjectRelease();
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
    }
    while (v23 != v24);
    swift_bridgeObjectRelease();
    with.super.Class isa = v32;
  }
  type metadata accessor for NSArray(0, (unint64_t *)&lazy cache variable for type metadata for NSString);
  Class v29 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  Class v30 = (void *)MEMORY[0x261198B80](0x795474706D6F7270, 0xEB00000000736570);
  [(objc_class *)with.super.isa encodeObject:v29 forKey:v30];
}

id PommesRenderOptions.__deallocating_deinit()
{
  return Experience.__deallocating_deinit(type metadata accessor for PommesRenderOptions);
}

id Experience.__deallocating_deinit(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1(0);
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t serialize(_:at:)(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  unsigned char *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t closure #1 in osLogInternal(_:log:type:)(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

void *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Data>);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int64_t v11;
  uint64_t v12;
  void *v13;

  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, unint64_t a4)
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, a4, &demangling cache variable for type metadata for _ContiguousArrayStorage<Apple_Parsec_Siri_V2alpha_AudioItem>, MEMORY[0x263F5CCC8], MEMORY[0x263F5CCC8]);
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
{
  if (a3)
  {
    unint64_t v11 = *(void *)(a4 + 24);
    uint64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v12 = a2;
      }
    }
  }
  else
  {
    uint64_t v12 = a2;
  }
  uint64_t v13 = *(void *)(a4 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (!v14)
  {
    uint64_t v18 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v15 = *(void *)(a6(0) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v18 = (void *)swift_allocObject();
  size_t v19 = _swift_stdlib_malloc_size(v18);
  if (!v16 || (v19 - v17 == 0x8000000000000000 ? (BOOL v20 = v16 == -1) : (BOOL v20 = 0), v20))
  {
LABEL_29:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  v18[2] = v13;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v16);
LABEL_19:
  uint64_t v21 = *(void *)(a6(0) - 8);
  unint64_t v22 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  unint64_t v23 = (unint64_t)v18 + v22;
  if (a1)
  {
    if ((unint64_t)v18 < a4 || v23 >= a4 + v22 + *(void *)(v21 + 72) * v13)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v18 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v13, v23, a4, a7);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v18;
}

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    int64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  int64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      int64_t v7 = a2;
    }
LABEL_8:
    int64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      int64_t v9 = *((void *)a4 + 2);
    }
    else {
      int64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<WarmupComponent>);
      uint64_t v10 = (char *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * v11 - 64;
      uint64_t v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[v8 + 32]) {
          memmove(v12, a4 + 32, v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (char *)MEMORY[0x263F8EE78];
      uint64_t v12 = (char *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;

  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    int64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  int64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      int64_t v7 = a2;
    }
LABEL_8:
    int64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      int64_t v9 = *((void *)a4 + 2);
    }
    else {
      int64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<PommesRenderOptions.PromptType>);
      uint64_t v10 = (char *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * v11 - 64;
      uint64_t v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[v8 + 32]) {
          memmove(v12, a4 + 32, v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (char *)MEMORY[0x263F8EE78];
      uint64_t v12 = (char *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t closure #1 in OSLogArguments.append(_:)(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = specialized _StringGuts._deconstructUTF8<A>(scratch:)(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
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
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
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
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
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
  uint64_t v2 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
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

uint64_t specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2)
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
        return (uint64_t)v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
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
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
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
    __swift_instantiateConcreteTypeFromMangledName(demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
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

unsigned char **closure #1 in OSLogArguments.append(_:)(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  unsigned char *v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t outlined init with copy of Apple_Parsec_Siri_V2alpha_SwitchProfileBuilderParams?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_SwitchProfileBuilderParams?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for PommesRenderOptions.Builder(uint64_t a1)
{
  return type metadata accessor for AudioExperience.Builder(a1, (uint64_t *)&type metadata singleton initialization cache for PommesRenderOptions.Builder);
}

uint64_t outlined assign with take of Apple_Parsec_Siri_V2alpha_SwitchProfileBuilderParams?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_SwitchProfileBuilderParams?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unsigned char *partial apply for closure #1 in PommesRenderOptions.init(isImmersiveExperience:)(unsigned char *result)
{
  *uint64_t result = *(unsigned char *)(v1 + 16);
  return result;
}

unsigned char *partial apply for closure #1 in PommesRenderOptions.init(isImmersiveExperience:isSquawkResponse:)(unsigned char *result)
{
  char v2 = *(unsigned char *)(v1 + 17);
  *uint64_t result = *(unsigned char *)(v1 + 16);
  result[1] = v2;
  return result;
}

uint64_t outlined destroy of PommesRenderOptions.Builder(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PommesRenderOptions.Builder(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t specialized _ArrayBuffer._copyContents(subRange:initializing:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized _ArrayBuffer._copyContents(subRange:initializing:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(a5(0) - 8);
    uint64_t v10 = a4 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v11 = *(void *)(v9 + 72);
    unint64_t v12 = v10 + v11 * a1;
    unint64_t v13 = a3 + v11 * v5;
    if (v12 >= v13 || v12 + v11 * v5 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *specialized _ArrayBuffer._copyContents(subRange:initializing:)(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + a1 + 32);
    unint64_t v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

id specialized PommesRenderOptions.init(coder:)(void *a1)
{
  uint64_t v3 = type metadata accessor for BinaryDecodingOptions();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_SwitchProfileBuilderParams?);
  MEMORY[0x270FA5388](v4 - 8);
  unint64_t v6 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v7 = v1;
  int64_t v8 = (void *)MEMORY[0x261198B80](0x76697372656D6D69, 0xE900000000000065);
  unsigned __int8 v9 = objc_msgSend(a1, sel_decodeBoolForKey_, v8);

  v7[OBJC_IVAR____TtC21SiriInformationSearch19PommesRenderOptions_isImmersiveExperience] = v9;
  uint64_t v10 = (void *)MEMORY[0x261198B80](0x6B7761757173, 0xE600000000000000);
  unsigned __int8 v11 = objc_msgSend(a1, sel_decodeBoolForKey_, v10);

  v7[OBJC_IVAR____TtC21SiriInformationSearch19PommesRenderOptions_isSquawkResponse] = v11;
  unint64_t v12 = (void *)MEMORY[0x261198B80](0x6C6143656E6F6870, 0xEF6576697463416CLL);
  unsigned __int8 v13 = objc_msgSend(a1, sel_decodeBoolForKey_, v12);

  v7[OBJC_IVAR____TtC21SiriInformationSearch19PommesRenderOptions_isPhoneCallActive] = v13;
  uint64_t v14 = (void *)MEMORY[0x261198B80](0x7250686374697773, 0xED0000656C69666FLL);
  id v15 = objc_msgSend(a1, sel_decodeObjectForKey_, v14);

  if (v15)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v43, 0, sizeof(v43));
  }
  outlined init with take of Apple_Parsec_Siri_V2alpha_AudioUnderstanding?((uint64_t)v43, (uint64_t)&v39, (uint64_t *)&demangling cache variable for type metadata for Any?);
  if (!*((void *)&v40 + 1))
  {
    outlined destroy of ClientExperienceSignals?((uint64_t)&v39, (uint64_t *)&demangling cache variable for type metadata for Any?);
    goto LABEL_8;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    unint64_t v17 = &v7[OBJC_IVAR____TtC21SiriInformationSearch19PommesRenderOptions_switchProfile];
    uint64_t v18 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SwitchProfileBuilderParams();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v17, 1, 1, v18);
    goto LABEL_9;
  }
  uint64_t v16 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SwitchProfileBuilderParams();
  uint64_t v41 = 0;
  long long v39 = 0u;
  long long v40 = 0u;
  BinaryDecodingOptions.init()();
  lazy protocol witness table accessor for type Apple_Parsec_Siri_Context_ResultEntity and conformance Apple_Parsec_Siri_Context_ResultEntity(&lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_SwitchProfileBuilderParams and conformance Apple_Parsec_Siri_V2alpha_SwitchProfileBuilderParams, MEMORY[0x263F5D080]);
  Message.init(serializedData:extensions:partial:options:)();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v6, 0, 1, v16);
  outlined init with take of Apple_Parsec_Siri_V2alpha_AudioUnderstanding?((uint64_t)v6, (uint64_t)&v7[OBJC_IVAR____TtC21SiriInformationSearch19PommesRenderOptions_switchProfile], &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_SwitchProfileBuilderParams?);
LABEL_9:
  size_t v19 = (void *)MEMORY[0x261198B80](0xD00000000000001DLL, 0x800000025C982170);
  unsigned __int8 v20 = objc_msgSend(a1, sel_decodeBoolForKey_, v19);

  v7[OBJC_IVAR____TtC21SiriInformationSearch19PommesRenderOptions_preserveResultSpaceIfPossible] = v20;
  type metadata accessor for NSArray(0, &lazy cache variable for type metadata for NSArray);
  uint64_t v21 = NSCoder.decodeObject<A>(of:forKey:)();
  if (!v21
    || (unint64_t v22 = (void *)v21,
        *(void *)&long long v39 = 0,
        type metadata accessor for NSArray(0, (unint64_t *)&lazy cache variable for type metadata for NSString),
        static Array._conditionallyBridgeFromObjectiveC(_:result:)(),
        v22,
        (uint64_t v23 = v39) == 0))
  {
    uint64_t v27 = (char *)MEMORY[0x263F8EE78];
LABEL_29:
    *(void *)&v7[OBJC_IVAR____TtC21SiriInformationSearch19PommesRenderOptions_promptTypes] = v27;

    uint64_t v37 = (objc_class *)type metadata accessor for PommesRenderOptions(0);
    v42.receiver = v7;
    v42.super_class = v37;
    return objc_msgSendSuper2(&v42, sel_init);
  }
  if (!((unint64_t)v39 >> 62))
  {
    uint64_t v24 = *(void *)((v39 & 0xFFFFFFFFFFFFFF8) + 0x10);
    id result = (id)swift_bridgeObjectRetain();
    if (v24) {
      goto LABEL_13;
    }
LABEL_27:
    uint64_t v27 = (char *)MEMORY[0x263F8EE78];
LABEL_28:
    swift_bridgeObjectRelease_n();
    goto LABEL_29;
  }
  swift_bridgeObjectRetain();
  id result = (id)_CocoaArrayWrapper.endIndex.getter();
  uint64_t v24 = (uint64_t)result;
  if (!result) {
    goto LABEL_27;
  }
LABEL_13:
  if (v24 >= 1)
  {
    uint64_t v26 = 0;
    uint64_t v27 = (char *)MEMORY[0x263F8EE78];
    do
    {
      if ((v23 & 0xC000000000000001) != 0) {
        id v28 = (id)MEMORY[0x261198DD0](v26, v23);
      }
      else {
        id v28 = *(id *)(v23 + 8 * v26 + 32);
      }
      Class v29 = v28;
      uint64_t v30 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v32 = v31;
      v33._uint64_t countAndFlagsBits = v30;
      v33._object = v32;
      unint64_t v34 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of PommesRenderOptions.init(coder:), v33);

      swift_bridgeObjectRelease();
      if (v34 <= 2)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v27 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v27 + 2) + 1, 1, v27);
        }
        unint64_t v36 = *((void *)v27 + 2);
        unint64_t v35 = *((void *)v27 + 3);
        if (v36 >= v35 >> 1) {
          uint64_t v27 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v35 > 1), v36 + 1, 1, v27);
        }
        *((void *)v27 + 2) = v36 + 1;
        v27[v36 + 32] = v34;
      }
      ++v26;
    }
    while (v24 != v26);
    goto LABEL_28;
  }
  __break(1u);
  return result;
}

uint64_t lazy protocol witness table accessor for type Apple_Parsec_Siri_Context_ResultEntity and conformance Apple_Parsec_Siri_Context_ResultEntity(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t lazy protocol witness table accessor for type PommesRenderOptions.PromptType and conformance PommesRenderOptions.PromptType()
{
  unint64_t result = lazy protocol witness table cache variable for type PommesRenderOptions.PromptType and conformance PommesRenderOptions.PromptType;
  if (!lazy protocol witness table cache variable for type PommesRenderOptions.PromptType and conformance PommesRenderOptions.PromptType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PommesRenderOptions.PromptType and conformance PommesRenderOptions.PromptType);
  }
  return result;
}

uint64_t sub_25C927C4C@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x88))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

void sub_25C927CAC(void **a1@<X0>, double *a2@<X8>)
{
  *a2 = (*(double (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0xA0))();
}

uint64_t sub_25C927D08(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a2 + OBJC_IVAR____TtC21SiriInformationSearch10Experience_queryConfidence);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = v2;
  return result;
}

uint64_t sub_25C927D60@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0xB8))();
  *a2 = result;
  return result;
}

uint64_t sub_25C927DC0@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0xF8))();
  *a2 = result;
  return result;
}

uint64_t sub_25C927E1C(uint64_t a1, void **a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x263F8EED0] & **a2) + 0x100);
  uint64_t v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

uint64_t ObjC metadata update function for Experience()
{
  return type metadata accessor for Experience(0);
}

uint64_t type metadata completion function for Experience()
{
  uint64_t result = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent();
    if (v2 <= 0x3F) {
      return swift_updateClassMetadata2();
    }
  }
  return result;
}

uint64_t method lookup function for Experience(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for Experience);
}

uint64_t dispatch thunk of static Experience.supportsSecureCoding.getter()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of Experience.pluginIdentifier.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of Experience.queryConfidence.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of Experience.renderOptions.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of Experience.catIds.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of Experience.catCategories.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of Experience.renderedTexts.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of Experience.redactedRenderedTexts.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of Experience.listenAfterSpeaking.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of Experience.associatedEntities.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of Experience.associatedEntities.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of Experience.associatedEntities.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of Experience.__allocating_init(pluginId:queryConfidence:)()
{
  return (*(uint64_t (**)(void))(v0 + 272))();
}

uint64_t dispatch thunk of Experience.__allocating_init(pluginId:queryConfidence:userDialogAct:)()
{
  return (*(uint64_t (**)(void))(v0 + 280))();
}

uint64_t dispatch thunk of Experience.__allocating_init(pluginId:queryConfidence:userDialogAct:renderOptions:)()
{
  return (*(uint64_t (**)(void))(v0 + 288))();
}

uint64_t dispatch thunk of Experience.__allocating_init(pluginId:queryConfidence:userDialogAct:intent:)()
{
  return (*(uint64_t (**)(void))(v0 + 296))();
}

uint64_t dispatch thunk of Experience.__allocating_init(pluginId:queryConfidence:userDialogAct:renderOptions:intent:)()
{
  return (*(uint64_t (**)(void))(v0 + 304))();
}

uint64_t dispatch thunk of Experience.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 312))();
}

uint64_t dispatch thunk of Experience.encode(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x140))();
}

uint64_t ObjC metadata update function for PommesRenderOptions()
{
  return type metadata accessor for PommesRenderOptions(0);
}

void type metadata completion function for PommesRenderOptions()
{
  type metadata accessor for Apple_Parsec_Siri_V2alpha_SwitchProfileBuilderParams?();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for PommesRenderOptions(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PommesRenderOptions);
}

uint64_t dispatch thunk of PommesRenderOptions.__allocating_init(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of static PommesRenderOptions.supportsSecureCoding.getter()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t dispatch thunk of PommesRenderOptions.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of PommesRenderOptions.encode(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

void type metadata accessor for Apple_Parsec_Siri_V2alpha_SwitchProfileBuilderParams?()
{
  if (!lazy cache variable for type metadata for Apple_Parsec_Siri_V2alpha_SwitchProfileBuilderParams?)
  {
    type metadata accessor for Apple_Parsec_Siri_V2alpha_SwitchProfileBuilderParams();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for Apple_Parsec_Siri_V2alpha_SwitchProfileBuilderParams?);
    }
  }
}

unsigned char *storeEnumTagSinglePayload for PommesRenderOptions.PromptType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *uint64_t result = a2 + 2;
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
        JUMPOUT(0x25C92851CLL);
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
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PommesRenderOptions.PromptType()
{
  return &type metadata for PommesRenderOptions.PromptType;
}

void *initializeBufferWithCopyOfBuffer for PommesRenderOptions.Builder(uint64_t a1, uint64_t *a2, int *a3)
{
  unsigned int v4 = (void *)a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    void *v4 = *a2;
    unsigned int v4 = (void *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    *(_WORD *)(a1 + 1) = *(_WORD *)((char *)a2 + 1);
    uint64_t v7 = a3[7];
    int64_t v8 = (void *)(a1 + v7);
    unsigned __int8 v9 = (char *)a2 + v7;
    uint64_t v10 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SwitchProfileBuilderParams();
    uint64_t v11 = *(void *)(v10 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
    {
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_SwitchProfileBuilderParams?);
      memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    }
    uint64_t v14 = a3[9];
    *((unsigned char *)v4 + a3[8]) = *((unsigned char *)a2 + a3[8]);
    *(void *)((char *)v4 + v14) = *(uint64_t *)((char *)a2 + v14);
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for PommesRenderOptions.Builder(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 28);
  uint64_t v3 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SwitchProfileBuilderParams();
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  }

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PommesRenderOptions.Builder(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_WORD *)(a1 + 1) = *(_WORD *)(a2 + 1);
  uint64_t v6 = a3[7];
  uint64_t v7 = (void *)(a1 + v6);
  int64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SwitchProfileBuilderParams();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_SwitchProfileBuilderParams?);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 16))(v7, v8, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v12 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  *(void *)(a1 + v12) = *(void *)(a2 + v12);
  swift_bridgeObjectRetain();
  return a1;
}

unsigned char *assignWithCopy for PommesRenderOptions.Builder(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  uint64_t v6 = a3[7];
  uint64_t v7 = &a1[v6];
  int64_t v8 = &a2[v6];
  uint64_t v9 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SwitchProfileBuilderParams();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 24))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_SwitchProfileBuilderParams?);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  a1[a3[8]] = a2[a3[8]];
  *(void *)&a1[a3[9]] = *(void *)&a2[a3[9]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for PommesRenderOptions.Builder(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_WORD *)(a1 + 1) = *(_WORD *)(a2 + 1);
  uint64_t v6 = a3[7];
  uint64_t v7 = (void *)(a1 + v6);
  int64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SwitchProfileBuilderParams();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_SwitchProfileBuilderParams?);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v12 = a3[9];
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  *(void *)(a1 + v12) = *(void *)(a2 + v12);
  return a1;
}

unsigned char *assignWithTake for PommesRenderOptions.Builder(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  uint64_t v6 = a3[7];
  uint64_t v7 = &a1[v6];
  int64_t v8 = &a2[v6];
  uint64_t v9 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SwitchProfileBuilderParams();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 40))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(unsigned char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_SwitchProfileBuilderParams?);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v10 + 32))(v7, v8, v9);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  uint64_t v15 = a3[9];
  a1[a3[8]] = a2[a3[8]];
  *(void *)&a1[v15] = *(void *)&a2[v15];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PommesRenderOptions.Builder(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C928DD0);
}

uint64_t sub_25C928DD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_SwitchProfileBuilderParams?);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 28);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else
  {
    unint64_t v12 = *(void *)(a1 + *(int *)(a3 + 36));
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for PommesRenderOptions.Builder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C928EAC);
}

uint64_t sub_25C928EAC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_SwitchProfileBuilderParams?);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + *(int *)(a4 + 28);
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 36)) = (a2 - 1);
  }
  return result;
}

void type metadata completion function for PommesRenderOptions.Builder()
{
  type metadata accessor for Apple_Parsec_Siri_V2alpha_SwitchProfileBuilderParams?();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t GeoExperience.geoClientComponent.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC21SiriInformationSearch13GeoExperience_geoClientComponent;
  uint64_t v4 = type metadata accessor for Apple_Parsec_Siri_V2alpha_GeoClientComponent();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t GeoExperience.__allocating_init(pluginId:geoClientComponent:queryConfidenceScore:userDialogAct:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  uint64_t v22 = a2;
  uint64_t v10 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  int v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for Apple_Parsec_Siri_V2alpha_GeoClientComponent();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  unint64_t v17 = (char *)&v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, a3, v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a4, v10);
  id v18 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for PommesRenderOptions(0)), sel_init);
  uint64_t v19 = (*(uint64_t (**)(uint64_t, uint64_t, char *, char *, id, double))(v5 + 336))(a1, v22, v17, v13, v18, a5);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a4, v10);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a3, v14);
  return v19;
}

id GeoExperience.__allocating_init(pluginId:geoClientComponent:queryConfidenceScore:userDialogAct:renderOptions:)(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, uint64_t a5, double a6)
{
  id v13 = objc_allocWithZone(v6);
  return GeoExperience.init(pluginId:geoClientComponent:queryConfidenceScore:userDialogAct:renderOptions:)(a1, a2, a3, a4, a5, a6);
}

id GeoExperience.init(pluginId:geoClientComponent:queryConfidenceScore:userDialogAct:renderOptions:)(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, uint64_t a5, double a6)
{
  uint64_t v30 = a5;
  uint64_t v31 = a4;
  uint64_t v29 = a3;
  uint64_t v26 = a1;
  uint64_t v27 = a2;
  uint64_t v9 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v17 = &v6[OBJC_IVAR____TtC21SiriInformationSearch13GeoExperience_geoClientComponent];
  uint64_t v28 = type metadata accessor for Apple_Parsec_Siri_V2alpha_GeoClientComponent();
  uint64_t v18 = *(void *)(v28 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v17, a3, v28);
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  v19(v16, (uint64_t)v31, v13);
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, *MEMORY[0x263F5CA28], v9);
  *(void *)&v6[OBJC_IVAR____TtC21SiriInformationSearch10Experience_associatedEntities] = MEMORY[0x263F8EE78];
  unsigned __int8 v20 = &v6[OBJC_IVAR____TtC21SiriInformationSearch10Experience_pluginIdentifier];
  uint64_t v21 = v27;
  *(void *)unsigned __int8 v20 = v26;
  *((void *)v20 + 1) = v21;
  *(double *)&v6[OBJC_IVAR____TtC21SiriInformationSearch10Experience_queryConfidence] = a6;
  v19(&v6[OBJC_IVAR____TtC21SiriInformationSearch10Experience_userDialogAct], (uint64_t)v16, v13);
  *(void *)&v6[OBJC_IVAR____TtC21SiriInformationSearch10Experience_renderOptions] = v30;
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(&v6[OBJC_IVAR____TtC21SiriInformationSearch10Experience_intent], v12, v9);
  uint64_t v22 = (objc_class *)type metadata accessor for Experience(0);
  v32.receiver = v6;
  v32.super_class = v22;
  id v23 = objc_msgSendSuper2(&v32, sel_init);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  uint64_t v24 = *(void (**)(char *, uint64_t))(v14 + 8);
  v24(v16, v13);
  v24(v31, v13);
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v29, v28);
  return v23;
}

void *GeoExperience.catIds.getter()
{
  return &outlined read-only object #0 of GeoExperience.catIds.getter;
}

id GeoExperience.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return GeoExperience.init(coder:)(a1);
}

id GeoExperience.init(coder:)(void *a1)
{
  uint64_t v3 = type metadata accessor for BinaryDecodingOptions();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v4 = type metadata accessor for Apple_Parsec_Siri_V2alpha_GeoClientComponent();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for NSData();
  id v8 = v1;
  uint64_t v9 = NSCoder.decodeObject<A>(of:forKey:)();
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    static Data._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v21 = 0;
    long long v19 = 0u;
    long long v20 = 0u;
    BinaryDecodingOptions.init()();
    lazy protocol witness table accessor for type Apple_Parsec_Siri_V2alpha_GeoClientComponent and conformance Apple_Parsec_Siri_V2alpha_GeoClientComponent();
    Message.init(serializedData:extensions:partial:options:)();
    (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))((uint64_t)v8 + OBJC_IVAR____TtC21SiriInformationSearch13GeoExperience_geoClientComponent, v7, v4);

    id v15 = Experience.init(coder:)(a1);
    id v16 = v15;

    if (v15) {
  }
    }
  else
  {

    if (one-time initialization token for pommes != -1) {
      swift_once();
    }
    uint64_t v11 = type metadata accessor for Logger();
    __swift_project_value_buffer(v11, (uint64_t)static Logger.pommes);
    uint64_t v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_25C8FE000, v12, v13, "GeoExperience cannot be decoded", v14, 2u);
      MEMORY[0x261199590](v14, -1, -1);
    }

    type metadata accessor for GeoExperience();
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v15;
}

Swift::Void __swiftcall GeoExperience.encode(with:)(NSCoder with)
{
  type metadata accessor for Apple_Parsec_Siri_V2alpha_GeoClientComponent();
  lazy protocol witness table accessor for type Apple_Parsec_Siri_V2alpha_GeoClientComponent and conformance Apple_Parsec_Siri_V2alpha_GeoClientComponent();
  uint64_t v2 = Message.serializedData(partial:)();
  unint64_t v4 = v3;
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data._Representation(v2, v4);
  uint64_t v6 = (void *)MEMORY[0x261198B80](0xD000000000000012, 0x800000025C982500);
  [(objc_class *)with.super.isa encodeObject:isa forKey:v6];

  Experience.encode(with:)(with);
}

void GeoExperience.__allocating_init(pluginId:queryConfidence:)()
{
}

void GeoExperience.init(pluginId:queryConfidence:)()
{
}

void GeoExperience.__allocating_init(pluginId:queryConfidence:userDialogAct:)()
{
}

void GeoExperience.init(pluginId:queryConfidence:userDialogAct:)()
{
}

void GeoExperience.__allocating_init(pluginId:queryConfidence:userDialogAct:renderOptions:)()
{
}

void GeoExperience.init(pluginId:queryConfidence:userDialogAct:renderOptions:)()
{
}

void GeoExperience.__allocating_init(pluginId:queryConfidence:userDialogAct:intent:)()
{
}

void GeoExperience.init(pluginId:queryConfidence:userDialogAct:intent:)()
{
}

void GeoExperience.__allocating_init(pluginId:queryConfidence:userDialogAct:renderOptions:intent:)()
{
}

void GeoExperience.init(pluginId:queryConfidence:userDialogAct:renderOptions:intent:)()
{
}

uint64_t GeoExperience.__ivar_destroyer()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC21SiriInformationSearch13GeoExperience_geoClientComponent;
  uint64_t v2 = type metadata accessor for Apple_Parsec_Siri_V2alpha_GeoClientComponent();
  unint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(v1, v2);
}

id GeoExperience.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GeoExperience();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for GeoExperience()
{
  uint64_t result = type metadata singleton initialization cache for GeoExperience;
  if (!type metadata singleton initialization cache for GeoExperience) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Apple_Parsec_Siri_V2alpha_GeoClientComponent and conformance Apple_Parsec_Siri_V2alpha_GeoClientComponent()
{
  unint64_t result = lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_GeoClientComponent and conformance Apple_Parsec_Siri_V2alpha_GeoClientComponent;
  if (!lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_GeoClientComponent and conformance Apple_Parsec_Siri_V2alpha_GeoClientComponent)
  {
    type metadata accessor for Apple_Parsec_Siri_V2alpha_GeoClientComponent();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_GeoClientComponent and conformance Apple_Parsec_Siri_V2alpha_GeoClientComponent);
  }
  return result;
}

uint64_t ObjC metadata update function for GeoExperience()
{
  return type metadata accessor for GeoExperience();
}

uint64_t type metadata completion function for GeoExperience()
{
  uint64_t result = type metadata accessor for Apple_Parsec_Siri_V2alpha_GeoClientComponent();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for GeoExperience(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for GeoExperience);
}

uint64_t dispatch thunk of GeoExperience.__allocating_init(pluginId:geoClientComponent:queryConfidenceScore:userDialogAct:renderOptions:)()
{
  return (*(uint64_t (**)(void))(v0 + 336))();
}

void one-time initialization function for genericPluginId()
{
  static GenericExperience.genericPluginId = 0x73757361676570;
  unk_26B356518 = 0xE700000000000000;
}

uint64_t static GenericExperience.genericPluginId.getter()
{
  if (one-time initialization token for genericPluginId != -1) {
    swift_once();
  }
  uint64_t v0 = static GenericExperience.genericPluginId;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t GenericExperience.components.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t key path setter for GenericExperience.serverSuggestions : GenericExperience(uint64_t a1, void **a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_ServerSuggestion?);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of Apple_Parsec_Siri_V2alpha_MultiUserContext?(a1, (uint64_t)v6, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_ServerSuggestion?);
  return (*(uint64_t (**)(char *))((*MEMORY[0x263F8EED0] & **a2) + 0x168))(v6);
}

uint64_t GenericExperience.serverSuggestions.getter@<X0>(uint64_t a1@<X8>)
{
  return GenericExperience.serverSuggestions.getter(&OBJC_IVAR____TtC21SiriInformationSearch17GenericExperience_serverSuggestions, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_ServerSuggestion?, a1);
}

uint64_t GenericExperience.serverSuggestions.setter(uint64_t a1)
{
  return GenericExperience.serverSuggestions.setter(a1, &OBJC_IVAR____TtC21SiriInformationSearch17GenericExperience_serverSuggestions, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_ServerSuggestion?);
}

uint64_t (*GenericExperience.serverSuggestions.modify())()
{
  return AudioExperience.isGlideEligible.modify;
}

uint64_t key path setter for GenericExperience.sageExperience : GenericExperience(uint64_t a1, void **a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_SageExperience?);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of Apple_Parsec_Siri_V2alpha_MultiUserContext?(a1, (uint64_t)v6, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_SageExperience?);
  return (*(uint64_t (**)(char *))((*MEMORY[0x263F8EED0] & **a2) + 0x180))(v6);
}

uint64_t GenericExperience.sageExperience.getter@<X0>(uint64_t a1@<X8>)
{
  return GenericExperience.serverSuggestions.getter(&OBJC_IVAR____TtC21SiriInformationSearch17GenericExperience_sageExperience, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_SageExperience?, a1);
}

uint64_t GenericExperience.serverSuggestions.getter@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = v3 + *a1;
  swift_beginAccess();
  return outlined init with copy of Apple_Parsec_Siri_V2alpha_MultiUserContext?(v6, a3, a2);
}

uint64_t GenericExperience.sageExperience.setter(uint64_t a1)
{
  return GenericExperience.serverSuggestions.setter(a1, &OBJC_IVAR____TtC21SiriInformationSearch17GenericExperience_sageExperience, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_SageExperience?);
}

uint64_t GenericExperience.serverSuggestions.setter(uint64_t a1, void *a2, uint64_t *a3)
{
  uint64_t v6 = v3 + *a2;
  swift_beginAccess();
  outlined assign with take of Apple_Parsec_Siri_V2alpha_AudioUnderstanding?(a1, v6, a3);
  return swift_endAccess();
}

uint64_t (*GenericExperience.sageExperience.modify())()
{
  return AudioExperience.internalSignalsFromSiriAudio.modify;
}

uint64_t GenericExperience.__allocating_init(components:queryConfidenceScore:)(uint64_t a1, double a2)
{
  uint64_t v5 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  Siri_Nlu_External_UserDialogAct.init()();
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F5CA28], v5);
  id v12 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for PommesRenderOptions(0)), sel_init);
  return (*(uint64_t (**)(uint64_t, char *, char *, id, double))(v2 + 408))(a1, v11, v8, v12, a2);
}

uint64_t GenericExperience.__allocating_init(components:queryConfidenceScore:userDialogAct:)(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v7 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a2, v11);
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F5CA28], v7);
  id v15 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for PommesRenderOptions(0)), sel_init);
  uint64_t v16 = (*(uint64_t (**)(uint64_t, char *, char *, id, double))(v3 + 408))(a1, v14, v10, v15, a3);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a2, v11);
  return v16;
}

id GenericExperience.__allocating_init(components:queryConfidenceScore:userDialogAct:renderOptions:)(uint64_t a1, char *a2, uint64_t a3, double a4)
{
  id v9 = objc_allocWithZone(v4);
  return GenericExperience.init(components:queryConfidenceScore:userDialogAct:renderOptions:)(a1, a2, a3, a4);
}

id GenericExperience.init(components:queryConfidenceScore:userDialogAct:renderOptions:)(uint64_t a1, char *a2, uint64_t a3, double a4)
{
  uint64_t v27 = a3;
  uint64_t v8 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  id v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = &v4[OBJC_IVAR____TtC21SiriInformationSearch17GenericExperience_serverSuggestions];
  uint64_t v17 = type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestion();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v16, 1, 1, v17);
  uint64_t v18 = &v4[OBJC_IVAR____TtC21SiriInformationSearch17GenericExperience_sageExperience];
  uint64_t v19 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SageExperience();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v18, 1, 1, v19);
  *(void *)&v4[OBJC_IVAR____TtC21SiriInformationSearch17GenericExperience_components] = a1;
  long long v20 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  v20(v15, (uint64_t)a2, v12);
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x263F5CA28], v8);
  *(void *)&v4[OBJC_IVAR____TtC21SiriInformationSearch10Experience_associatedEntities] = MEMORY[0x263F8EE78];
  uint64_t v21 = &v4[OBJC_IVAR____TtC21SiriInformationSearch10Experience_pluginIdentifier];
  *(void *)uint64_t v21 = 0x73757361676570;
  *((void *)v21 + 1) = 0xE700000000000000;
  *(double *)&v4[OBJC_IVAR____TtC21SiriInformationSearch10Experience_queryConfidence] = a4;
  v20(&v4[OBJC_IVAR____TtC21SiriInformationSearch10Experience_userDialogAct], (uint64_t)v15, v12);
  *(void *)&v4[OBJC_IVAR____TtC21SiriInformationSearch10Experience_renderOptions] = v27;
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(&v4[OBJC_IVAR____TtC21SiriInformationSearch10Experience_intent], v11, v8);
  uint64_t v22 = (objc_class *)type metadata accessor for Experience(0);
  v28.receiver = v4;
  v28.super_class = v22;
  id v23 = objc_msgSendSuper2(&v28, sel_init);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v24 = *(void (**)(char *, uint64_t))(v13 + 8);
  v24(v15, v12);
  v24(a2, v12);
  return v23;
}

id GenericExperience.__allocating_init(components:queryConfidenceScore:userDialogAct:intent:renderOptions:)(uint64_t a1, char *a2, char *a3, uint64_t a4, double a5)
{
  id v11 = objc_allocWithZone(v5);
  return GenericExperience.init(components:queryConfidenceScore:userDialogAct:intent:renderOptions:)(a1, a2, a3, a4, a5);
}

id GenericExperience.init(components:queryConfidenceScore:userDialogAct:intent:renderOptions:)(uint64_t a1, char *a2, char *a3, uint64_t a4, double a5)
{
  uint64_t v36 = a4;
  uint64_t v38 = a3;
  uint64_t v35 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent();
  uint64_t v9 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  uint64_t v37 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v15 = &v5[OBJC_IVAR____TtC21SiriInformationSearch17GenericExperience_serverSuggestions];
  uint64_t v16 = type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestion();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 1, 1, v16);
  uint64_t v17 = &v5[OBJC_IVAR____TtC21SiriInformationSearch17GenericExperience_sageExperience];
  uint64_t v18 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SageExperience();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v17, 1, 1, v18);
  *(void *)&v5[OBJC_IVAR____TtC21SiriInformationSearch17GenericExperience_components] = a1;
  if (one-time initialization token for genericPluginId != -1) {
    swift_once();
  }
  uint64_t v19 = unk_26B356518;
  uint64_t v32 = static GenericExperience.genericPluginId;
  uint64_t v20 = v12;
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  uint64_t v22 = v14;
  v21(v14, (uint64_t)a2, v11);
  Swift::String v33 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  unint64_t v34 = a2;
  uint64_t v23 = v35;
  v33(v37, (uint64_t)v38, v35);
  *(void *)&v5[OBJC_IVAR____TtC21SiriInformationSearch10Experience_associatedEntities] = MEMORY[0x263F8EE78];
  uint64_t v24 = (uint64_t *)&v5[OBJC_IVAR____TtC21SiriInformationSearch10Experience_pluginIdentifier];
  *uint64_t v24 = v32;
  v24[1] = v19;
  *(double *)&v5[OBJC_IVAR____TtC21SiriInformationSearch10Experience_queryConfidence] = a5;
  v21(&v5[OBJC_IVAR____TtC21SiriInformationSearch10Experience_userDialogAct], (uint64_t)v22, v11);
  unint64_t v25 = v37;
  *(void *)&v5[OBJC_IVAR____TtC21SiriInformationSearch10Experience_renderOptions] = v36;
  v33(&v5[OBJC_IVAR____TtC21SiriInformationSearch10Experience_intent], (uint64_t)v25, v23);
  uint64_t v26 = (objc_class *)type metadata accessor for Experience(0);
  v39.receiver = v5;
  v39.super_class = v26;
  swift_bridgeObjectRetain();
  id v27 = objc_msgSendSuper2(&v39, sel_init);
  objc_super v28 = *(void (**)(char *, uint64_t))(v9 + 8);
  v28(v25, v23);
  uint64_t v29 = *(void (**)(char *, uint64_t))(v20 + 8);
  v29(v22, v11);
  v28(v38, v23);
  v29(v34, v11);
  return v27;
}

void *GenericExperience.catIds.getter()
{
  uint64_t v1 = type metadata accessor for Apple_Parsec_Siri_V2alpha_ExperienceComponent();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *(void *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch17GenericExperience_components);
  uint64_t v6 = *(void *)(v5 + 16);
  if (!v6) {
    return (void *)MEMORY[0x263F8EE78];
  }
  uint64_t v8 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 16);
  uint64_t v7 = v2 + 16;
  uint64_t v9 = v5 + ((*(unsigned __int8 *)(v7 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 64));
  uint64_t v19 = *(void *)(v7 + 56);
  uint64_t v20 = v8;
  v17[0] = v5;
  swift_bridgeObjectRetain_n();
  uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  v17[1] = v7;
  uint64_t v18 = v1;
  do
  {
    v20(v4, v9, v1);
    closure #1 in GenericExperience.catIds.getter(&v21);
    (*(void (**)(char *, uint64_t))(v7 - 8))(v4, v1);
    uint64_t v12 = v22;
    if (v22)
    {
      uint64_t v13 = v21;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v10 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v10[2] + 1, 1, v10);
      }
      unint64_t v15 = v10[2];
      unint64_t v14 = v10[3];
      if (v15 >= v14 >> 1) {
        uint64_t v10 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v14 > 1), v15 + 1, 1, v10);
      }
      void v10[2] = v15 + 1;
      uint64_t v11 = &v10[2 * v15];
      v11[4] = v13;
      v11[5] = v12;
      uint64_t v1 = v18;
    }
    v9 += v19;
    --v6;
  }
  while (v6);
  swift_bridgeObjectRelease_n();
  return v10;
}

uint64_t closure #1 in GenericExperience.catIds.getter@<X0>(uint64_t *a1@<X8>)
{
  long long v107 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_SiriCommandBuilder.OneOf_SiriCommandBuilderParams?);
  MEMORY[0x270FA5388](v1 - 8);
  long long v106 = (char *)&v90 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SayItBuilderParams();
  uint64_t v95 = *(void *)(v93 - 8);
  MEMORY[0x270FA5388](v93);
  uint64_t v94 = (char *)&v90 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriCommandBuilder();
  uint64_t v97 = *(void *)(v4 - 8);
  uint64_t v98 = v4;
  MEMORY[0x270FA5388](v4);
  unint64_t v104 = (char *)&v90 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for Apple_Parsec_Siri_V2alpha_DelayedActionComponent();
  uint64_t v100 = *(void *)(v6 - 8);
  uint64_t v101 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v99 = (char *)&v90 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_super v105 = (void *)type metadata accessor for Apple_Parsec_Siri_V2alpha_SayItComponent();
  uint64_t v96 = *(v105 - 1);
  MEMORY[0x270FA5388](v105);
  uint64_t v9 = (char *)&v90 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Apple_Parsec_Siri_V2alpha_CatDialogComponent();
  uint64_t v102 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v90 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for Apple_Parsec_Siri_V2alpha_RenderedDialogComponent();
  uint64_t v103 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  unint64_t v15 = (char *)&v90 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_ExperienceComponent.OneOf_Component?);
  uint64_t v17 = MEMORY[0x270FA5388](v16 - 8);
  uint64_t v19 = (char *)&v90 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)&v90 - v20;
  Apple_Parsec_Siri_V2alpha_ExperienceComponent.component.getter();
  uint64_t v22 = type metadata accessor for Apple_Parsec_Siri_V2alpha_ExperienceComponent.OneOf_Component();
  uint64_t v23 = *(void *)(v22 - 8);
  int v24 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22);
  unint64_t v25 = v107;
  if (v24 == 1) {
    goto LABEL_2;
  }
  uint64_t v91 = v15;
  unint64_t v92 = v21;
  id v27 = v105;
  outlined init with copy of Apple_Parsec_Siri_V2alpha_MultiUserContext?((uint64_t)v21, (uint64_t)v19, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_ExperienceComponent.OneOf_Component?);
  int v28 = (*(uint64_t (**)(char *, uint64_t))(v23 + 88))(v19, v22);
  if (v28 == *MEMORY[0x263F5CF10])
  {
    (*(void (**)(char *, uint64_t))(v23 + 96))(v19, v22);
    uint64_t v29 = v103;
    uint64_t v30 = v91;
    (*(void (**)(char *, char *, uint64_t))(v103 + 32))(v91, v19, v13);
    uint64_t v31 = Apple_Parsec_Siri_V2alpha_RenderedDialogComponent.catID.getter();
    unint64_t v33 = v32;
    swift_bridgeObjectRelease();
    uint64_t v34 = HIBYTE(v33) & 0xF;
    if ((v33 & 0x2000000000000000) == 0) {
      uint64_t v34 = v31 & 0xFFFFFFFFFFFFLL;
    }
    if (v34)
    {
      uint64_t v35 = Apple_Parsec_Siri_V2alpha_RenderedDialogComponent.catID.getter();
      uint64_t v37 = v36;
    }
    else
    {
      uint64_t v35 = 0;
      uint64_t v37 = 0;
    }
    unint64_t v64 = v107;
    (*(void (**)(char *, uint64_t))(v29 + 8))(v30, v13);
    goto LABEL_30;
  }
  if (v28 == *MEMORY[0x263F5CF18])
  {
    (*(void (**)(char *, uint64_t))(v23 + 96))(v19, v22);
    uint64_t v38 = v102;
    objc_super v39 = v12;
    uint64_t v40 = v10;
    uint64_t v41 = (*(uint64_t (**)(char *, char *, uint64_t))(v102 + 32))(v12, v19, v10);
    uint64_t v42 = MEMORY[0x261198690](v41);
    unint64_t v44 = v43;
    uint64_t v45 = swift_bridgeObjectRelease();
    uint64_t v46 = HIBYTE(v44) & 0xF;
    if ((v44 & 0x2000000000000000) == 0) {
      uint64_t v46 = v42 & 0xFFFFFFFFFFFFLL;
    }
    if (v46)
    {
      uint64_t v35 = MEMORY[0x261198690](v45);
      uint64_t v37 = v47;
    }
    else
    {
      uint64_t v35 = 0;
      uint64_t v37 = 0;
    }
    unint64_t v64 = v107;
    (*(void (**)(char *, uint64_t))(v38 + 8))(v39, v40);
    goto LABEL_30;
  }
  if (v28 != *MEMORY[0x263F5CEF8])
  {
    if (v28 != *MEMORY[0x263F5CF00])
    {
      (*(void (**)(char *, uint64_t))(v23 + 8))(v19, v22);
      unint64_t v25 = v107;
      uint64_t v21 = v92;
LABEL_2:
      *unint64_t v25 = 0;
      v25[1] = 0;
      uint64_t v26 = (uint64_t)v21;
      return outlined destroy of ClientExperienceSignals?(v26, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_ExperienceComponent.OneOf_Component?);
    }
    (*(void (**)(char *, uint64_t))(v23 + 96))(v19, v22);
    uint64_t v65 = v96;
    uint64_t v66 = (*(uint64_t (**)(char *, char *, void *))(v96 + 32))(v9, v19, v27);
    uint64_t v67 = MEMORY[0x261198620](v66);
    unint64_t v69 = v68;
    uint64_t v70 = swift_bridgeObjectRelease();
    uint64_t v71 = HIBYTE(v69) & 0xF;
    if ((v69 & 0x2000000000000000) == 0) {
      uint64_t v71 = v67 & 0xFFFFFFFFFFFFLL;
    }
    if (v71)
    {
      uint64_t v35 = MEMORY[0x261198620](v70);
      uint64_t v37 = v72;
    }
    else
    {
      uint64_t v35 = 0;
      uint64_t v37 = 0;
    }
    unint64_t v64 = v107;
    (*(void (**)(char *, void *))(v65 + 8))(v9, v27);
LABEL_30:
    *unint64_t v64 = v35;
    v64[1] = v37;
    goto LABEL_31;
  }
  (*(void (**)(char *, uint64_t))(v23 + 96))(v19, v22);
  uint64_t v48 = v99;
  uint64_t v49 = v100;
  uint64_t v50 = v101;
  (*(void (**)(char *, char *, uint64_t))(v100 + 32))(v99, v19, v101);
  uint64_t v51 = Apple_Parsec_Siri_V2alpha_DelayedActionComponent.siriCommandBuilder.getter();
  uint64_t v52 = *(void *)(v51 + 16);
  if (v52)
  {
    uint64_t v53 = v98;
    uint64_t v54 = v97 + 16;
    objc_super v105 = *(void **)(v97 + 16);
    unint64_t v55 = (*(unsigned __int8 *)(v97 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v97 + 80);
    uint64_t v97 = v51;
    unint64_t v56 = v51 + v55;
    LODWORD(v102) = *MEMORY[0x263F5CA20];
    uint64_t v57 = (void (**)(char *, uint64_t))(v54 - 8);
    uint64_t v103 = *(void *)(v54 + 56);
    id v58 = v104;
    uint64_t v59 = (uint64_t)v106;
    while (1)
    {
      uint64_t v60 = v54;
      ((void (*)(char *, unint64_t, uint64_t))v105)(v58, v56, v53);
      Apple_Parsec_Siri_V2alpha_SiriCommandBuilder.siriCommandBuilderParams.getter();
      uint64_t v61 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriCommandBuilder.OneOf_SiriCommandBuilderParams();
      uint64_t v62 = *(void *)(v61 - 8);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v62 + 48))(v59, 1, v61) == 1)
      {
        (*v57)(v58, v53);
        outlined destroy of ClientExperienceSignals?(v59, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_SiriCommandBuilder.OneOf_SiriCommandBuilderParams?);
      }
      else
      {
        int v63 = (*(uint64_t (**)(uint64_t, uint64_t))(v62 + 88))(v59, v61);
        if (v63 == v102)
        {
          swift_bridgeObjectRelease();
          (*(void (**)(uint64_t, uint64_t))(v62 + 96))(v59, v61);
          os_log_type_t v76 = v94;
          uint64_t v75 = v95;
          uint64_t v77 = v93;
          uint64_t v78 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v95 + 32))(v94, v59, v93);
          uint64_t v79 = MEMORY[0x2611986C0](v78);
          unint64_t v81 = v80;
          uint64_t v82 = swift_bridgeObjectRelease();
          uint64_t v83 = HIBYTE(v81) & 0xF;
          if ((v81 & 0x2000000000000000) == 0) {
            uint64_t v83 = v79 & 0xFFFFFFFFFFFFLL;
          }
          if (v83)
          {
            uint64_t v84 = MEMORY[0x2611986C0](v82);
            uint64_t v86 = v85;
          }
          else
          {
            uint64_t v84 = 0;
            uint64_t v86 = 0;
          }
          uint64_t v88 = v100;
          uint64_t v87 = v101;
          (*(void (**)(char *, uint64_t))(v75 + 8))(v76, v77);
          (*v57)(v104, v98);
          (*(void (**)(char *, uint64_t))(v88 + 8))(v99, v87);
          uint64_t v89 = v107;
          *long long v107 = v84;
          v89[1] = v86;
          goto LABEL_31;
        }
        id v58 = v104;
        (*v57)(v104, v53);
        (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v59, v61);
      }
      uint64_t v54 = v60;
      v56 += v103;
      if (!--v52)
      {
        swift_bridgeObjectRelease();
        uint64_t v49 = v100;
        uint64_t v50 = v101;
        uint64_t v48 = v99;
        goto LABEL_36;
      }
    }
  }
  swift_bridgeObjectRelease();
LABEL_36:
  (*(void (**)(char *, uint64_t))(v49 + 8))(v48, v50);
  uint64_t v74 = v107;
  *long long v107 = 0;
  v74[1] = 0;
LABEL_31:
  uint64_t v26 = (uint64_t)v92;
  return outlined destroy of ClientExperienceSignals?(v26, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_ExperienceComponent.OneOf_Component?);
}

void *GenericExperience.catCategories.getter()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_ExperienceComponent.OneOf_Component?);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)v35 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for Apple_Parsec_Siri_V2alpha_RenderedDialogComponent();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Apple_Parsec_Siri_V2alpha_ExperienceComponent();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch17GenericExperience_components);
  uint64_t v13 = *(void *)(v12 + 16);
  if (v13)
  {
    uint64_t v40 = v7;
    uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
    uint64_t v14 = v9 + 16;
    unint64_t v15 = v16;
    uint64_t v17 = v12 + ((*(unsigned __int8 *)(v14 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 64));
    uint64_t v45 = *(void *)(v14 + 56);
    int v44 = *MEMORY[0x263F5CF10];
    uint64_t v38 = (void (**)(char *, char *, uint64_t))(v5 + 32);
    v35[1] = v12;
    uint64_t v36 = (void (**)(char *, uint64_t))(v5 + 8);
    uint64_t v41 = v4;
    uint64_t v18 = (void (**)(char *, uint64_t))(v14 - 8);
    swift_bridgeObjectRetain_n();
    unint64_t v43 = (void *)MEMORY[0x263F8EE78];
    uint64_t v37 = v16;
    uint64_t v39 = v14;
    while (1)
    {
      v15(v11, v17, v8);
      Apple_Parsec_Siri_V2alpha_ExperienceComponent.component.getter();
      uint64_t v19 = type metadata accessor for Apple_Parsec_Siri_V2alpha_ExperienceComponent.OneOf_Component();
      uint64_t v20 = *(void *)(v19 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v3, 1, v19) == 1)
      {
        outlined destroy of ClientExperienceSignals?((uint64_t)v3, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_ExperienceComponent.OneOf_Component?);
      }
      else
      {
        int v21 = (*(uint64_t (**)(char *, uint64_t))(v20 + 88))(v3, v19);
        if (v21 == v44)
        {
          (*(void (**)(char *, uint64_t))(v20 + 96))(v3, v19);
          uint64_t v22 = v40;
          uint64_t v23 = v41;
          (*v38)(v40, v3, v41);
          uint64_t v24 = Apple_Parsec_Siri_V2alpha_RenderedDialogComponent.catCategory.getter();
          unint64_t v26 = v25;
          swift_bridgeObjectRelease();
          uint64_t v27 = HIBYTE(v26) & 0xF;
          if ((v26 & 0x2000000000000000) == 0) {
            uint64_t v27 = v24 & 0xFFFFFFFFFFFFLL;
          }
          if (v27)
          {
            uint64_t v42 = Apple_Parsec_Siri_V2alpha_RenderedDialogComponent.catCategory.getter();
            uint64_t v29 = v28;
            (*v36)(v22, v23);
            (*v18)(v11, v8);
            if (swift_isUniquelyReferenced_nonNull_native()) {
              uint64_t v30 = v43;
            }
            else {
              uint64_t v30 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v43[2] + 1, 1, v43);
            }
            unint64_t v32 = v30[2];
            unint64_t v31 = v30[3];
            if (v32 >= v31 >> 1) {
              uint64_t v30 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v31 > 1), v32 + 1, 1, v30);
            }
            v30[2] = v32 + 1;
            unint64_t v43 = v30;
            unint64_t v33 = &v30[2 * v32];
            void v33[4] = v42;
            v33[5] = v29;
            unint64_t v15 = v37;
          }
          else
          {
            (*v36)(v22, v23);
            (*v18)(v11, v8);
            unint64_t v15 = v37;
          }
          goto LABEL_5;
        }
        (*(void (**)(char *, uint64_t))(v20 + 8))(v3, v19);
      }
      (*v18)(v11, v8);
LABEL_5:
      v17 += v45;
      if (!--v13)
      {
        swift_bridgeObjectRelease_n();
        return v43;
      }
    }
  }
  return (void *)MEMORY[0x263F8EE78];
}

void *GenericExperience.renderedTexts.getter()
{
  return GenericExperience.renderedTexts.getter(MEMORY[0x263F5D050], MEMORY[0x263F5D048]);
}

void *GenericExperience.redactedRenderedTexts.getter()
{
  return GenericExperience.renderedTexts.getter(MEMORY[0x263F5D040], MEMORY[0x263F5D038]);
}

void *GenericExperience.renderedTexts.getter(uint64_t (*a1)(uint64_t), uint64_t (*a2)(uint64_t))
{
  uint64_t v40 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_ExperienceComponent.OneOf_Component?);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = type metadata accessor for Apple_Parsec_Siri_V2alpha_RenderedDialogComponent();
  uint64_t v7 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388](v49);
  uint64_t v9 = (char *)v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Apple_Parsec_Siri_V2alpha_ExperienceComponent();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void *)(v2 + OBJC_IVAR____TtC21SiriInformationSearch17GenericExperience_components);
  uint64_t v15 = *(void *)(v14 + 16);
  if (!v15) {
    return (void *)MEMORY[0x263F8EE78];
  }
  int v44 = v9;
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  uint64_t v16 = v11 + 16;
  uint64_t v18 = v14 + ((*(unsigned __int8 *)(v16 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 64));
  uint64_t v50 = *(void *)(v16 + 56);
  uint64_t v51 = v17;
  int v48 = *MEMORY[0x263F5CF10];
  uint64_t v41 = (void (**)(char *, uint64_t))(v7 + 8);
  uint64_t v42 = (uint64_t (**)(char *, char *, uint64_t))(v7 + 32);
  uint64_t v45 = a1;
  uint64_t v19 = (void (**)(char *, uint64_t))(v16 - 8);
  v39[1] = v14;
  swift_bridgeObjectRetain_n();
  uint64_t v20 = (void *)MEMORY[0x263F8EE78];
  uint64_t v43 = v16;
  do
  {
    v51(v13, v18, v10);
    Apple_Parsec_Siri_V2alpha_ExperienceComponent.component.getter();
    uint64_t v21 = type metadata accessor for Apple_Parsec_Siri_V2alpha_ExperienceComponent.OneOf_Component();
    uint64_t v22 = *(void *)(v21 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v6, 1, v21) == 1)
    {
      outlined destroy of ClientExperienceSignals?((uint64_t)v6, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_ExperienceComponent.OneOf_Component?);
LABEL_4:
      (*v19)(v13, v10);
      goto LABEL_5;
    }
    int v23 = (*(uint64_t (**)(char *, uint64_t))(v22 + 88))(v6, v21);
    if (v23 != v48)
    {
      (*(void (**)(char *, uint64_t))(v22 + 8))(v6, v21);
      goto LABEL_4;
    }
    uint64_t v47 = v20;
    (*(void (**)(char *, uint64_t))(v22 + 96))(v6, v21);
    uint64_t v24 = v44;
    uint64_t v25 = (*v42)(v44, v6, v49);
    unint64_t v26 = v45;
    uint64_t v27 = v45(v25);
    unint64_t v29 = v28;
    uint64_t v30 = swift_bridgeObjectRelease();
    uint64_t v31 = HIBYTE(v29) & 0xF;
    if ((v29 & 0x2000000000000000) == 0) {
      uint64_t v31 = v27 & 0xFFFFFFFFFFFFLL;
    }
    if (v31) {
      uint64_t v32 = v26(v30);
    }
    else {
      uint64_t v32 = v40(v30);
    }
    uint64_t v46 = v32;
    uint64_t v34 = v33;
    (*v41)(v24, v49);
    (*v19)(v13, v10);
    uint64_t v20 = v47;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v20 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v20[2] + 1, 1, v20);
    }
    unint64_t v36 = v20[2];
    unint64_t v35 = v20[3];
    if (v36 >= v35 >> 1) {
      uint64_t v20 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v35 > 1), v36 + 1, 1, v20);
    }
    _OWORD v20[2] = v36 + 1;
    uint64_t v37 = &v20[2 * v36];
    v37[4] = v46;
    v37[5] = v34;
LABEL_5:
    v18 += v50;
    --v15;
  }
  while (v15);
  swift_bridgeObjectRelease_n();
  return v20;
}

uint64_t GenericExperience.listenAfterSpeaking.getter()
{
  uint64_t v1 = type metadata accessor for Apple_Parsec_Siri_V2alpha_ExperienceComponent();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *(void *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch17GenericExperience_components);
  uint64_t v6 = *(void *)(v5 + 16);
  if (v6)
  {
    uint64_t v9 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 16);
    uint64_t v7 = v2 + 16;
    uint64_t v8 = v9;
    uint64_t v10 = v5 + ((*(unsigned __int8 *)(v7 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 64));
    uint64_t v11 = *(void *)(v7 + 56);
    uint64_t v16 = v5;
    swift_bridgeObjectRetain_n();
    uint64_t v12 = v6 - 1;
    do
    {
      v8(v4, v10, v1);
      int v13 = closure #1 in GenericExperience.listenAfterSpeaking.getter();
      (*(void (**)(char *, uint64_t))(v7 - 8))(v4, v1);
      BOOL v14 = v12-- == 0;
      v10 += v11;
    }
    while (((v13 | v14) & 1) == 0);
    swift_bridgeObjectRelease_n();
  }
  else
  {
    LOBYTE(v13) = 0;
  }
  return v13 & 1;
}

uint64_t closure #1 in GenericExperience.listenAfterSpeaking.getter()
{
  uint64_t v63 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SayItBuilderParams();
  unint64_t v56 = *(char **)(v63 - 8);
  MEMORY[0x270FA5388](v63);
  uint64_t v61 = (char *)&v51 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriCommandBuilder();
  uint64_t v54 = *(void *)(v62 - 8);
  MEMORY[0x270FA5388](v62);
  unint64_t v64 = (char *)&v51 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = type metadata accessor for Apple_Parsec_Siri_V2alpha_DelayedActionComponent();
  uint64_t v57 = *(void *)(v2 - 8);
  uint64_t v58 = v2;
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  uint64_t v59 = (char *)&v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v51 - v5;
  uint64_t v7 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SayItComponent();
  uint64_t v55 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Apple_Parsec_Siri_V2alpha_RenderedDialogComponent();
  uint64_t v60 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_ExperienceComponent.OneOf_Component?);
  uint64_t v14 = MEMORY[0x270FA5388](v13 - 8);
  uint64_t v16 = (char *)&v51 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v51 - v17;
  Apple_Parsec_Siri_V2alpha_ExperienceComponent.component.getter();
  uint64_t v19 = type metadata accessor for Apple_Parsec_Siri_V2alpha_ExperienceComponent.OneOf_Component();
  uint64_t v20 = *(void *)(v19 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19) == 1)
  {
LABEL_2:
    char v21 = 0;
    goto LABEL_11;
  }
  uint64_t v52 = v12;
  uint64_t v53 = v10;
  uint64_t v22 = v59;
  uint64_t v51 = v6;
  outlined init with copy of Apple_Parsec_Siri_V2alpha_MultiUserContext?((uint64_t)v18, (uint64_t)v16, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_ExperienceComponent.OneOf_Component?);
  int v23 = (*(uint64_t (**)(char *, uint64_t))(v20 + 88))(v16, v19);
  if (v23 == *MEMORY[0x263F5CF10])
  {
    (*(void (**)(char *, uint64_t))(v20 + 96))(v16, v19);
    uint64_t v24 = v60;
    uint64_t v25 = v52;
    uint64_t v26 = v53;
    (*(void (**)(char *, char *, uint64_t))(v60 + 32))(v52, v16, v53);
    char v21 = Apple_Parsec_Siri_V2alpha_RenderedDialogComponent.listenAfterSpeaking.getter();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v25, v26);
    goto LABEL_11;
  }
  uint64_t v27 = v60;
  if (v23 != *MEMORY[0x263F5CEF8])
  {
    if (v23 == *MEMORY[0x263F5CF00])
    {
      (*(void (**)(char *, uint64_t))(v20 + 96))(v16, v19);
      uint64_t v35 = v55;
      (*(void (**)(char *, char *, uint64_t))(v55 + 32))(v9, v16, v7);
      char v21 = Apple_Parsec_Siri_V2alpha_SayItComponent.hasListenAfterSpeaking_p.getter();
      (*(void (**)(char *, uint64_t))(v35 + 8))(v9, v7);
      goto LABEL_11;
    }
    (*(void (**)(char *, uint64_t))(v20 + 8))(v16, v19);
    goto LABEL_2;
  }
  (*(void (**)(char *, uint64_t))(v20 + 96))(v16, v19);
  uint64_t v29 = v57;
  uint64_t v28 = v58;
  uint64_t v30 = v51;
  (*(void (**)(char *, char *, uint64_t))(v57 + 32))(v51, v16, v58);
  char v31 = Apple_Parsec_Siri_V2alpha_DelayedActionComponent.hasRenderedDialog.getter();
  (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v22, v30, v28);
  if (v31)
  {
    uint64_t v32 = v52;
    Apple_Parsec_Siri_V2alpha_DelayedActionComponent.renderedDialog.getter();
    char v33 = Apple_Parsec_Siri_V2alpha_RenderedDialogComponent.listenAfterSpeaking.getter();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v32, v53);
    uint64_t v34 = *(char **)(v29 + 8);
    ((void (*)(char *, uint64_t))v34)(v22, v28);
    if (v33)
    {
      ((void (*)(char *, uint64_t))v34)(v51, v28);
      char v21 = 1;
      goto LABEL_11;
    }
    uint64_t v37 = v56;
    uint64_t v30 = v51;
  }
  else
  {
    uint64_t v34 = *(char **)(v29 + 8);
    ((void (*)(char *, uint64_t))v34)(v22, v28);
    uint64_t v37 = v56;
  }
  uint64_t v38 = Apple_Parsec_Siri_V2alpha_DelayedActionComponent.siriCommandBuilder.getter();
  uint64_t v39 = *(void *)(v38 + 16);
  if (v39)
  {
    uint64_t v55 = v38;
    unint64_t v56 = v34;
    uint64_t v40 = v54 + 16;
    uint64_t v41 = *(void *)(v54 + 16);
    unint64_t v42 = v38 + ((*(unsigned __int8 *)(v54 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v54 + 80));
    uint64_t v43 = (void (**)(char *, uint64_t))(v37 + 8);
    int v44 = (void (**)(char *, uint64_t))(v54 + 8);
    uint64_t v59 = *(char **)(v54 + 72);
    uint64_t v60 = v41;
    uint64_t v45 = v64;
    uint64_t v46 = v62;
    while (1)
    {
      uint64_t v47 = v40;
      ((void (*)(char *, unint64_t, uint64_t))v60)(v45, v42, v46);
      int v48 = v61;
      Apple_Parsec_Siri_V2alpha_SiriCommandBuilder.sayIt.getter();
      char v49 = Apple_Parsec_Siri_V2alpha_SayItBuilderParams.hasListenAfterSpeaking_p.getter();
      uint64_t v50 = v48;
      uint64_t v45 = v64;
      (*v43)(v50, v63);
      (*v44)(v45, v46);
      if (v49) {
        break;
      }
      v42 += (unint64_t)v59;
      --v39;
      uint64_t v40 = v47;
      if (!v39)
      {
        swift_bridgeObjectRelease();
        char v21 = 0;
        goto LABEL_22;
      }
    }
    swift_bridgeObjectRelease();
    char v21 = 1;
LABEL_22:
    uint64_t v28 = v58;
    uint64_t v30 = v51;
    uint64_t v34 = v56;
  }
  else
  {
    swift_bridgeObjectRelease();
    char v21 = 0;
  }
  ((void (*)(char *, uint64_t))v34)(v30, v28);
LABEL_11:
  outlined destroy of ClientExperienceSignals?((uint64_t)v18, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_ExperienceComponent.OneOf_Component?);
  return v21 & 1;
}

id GenericExperience.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return GenericExperience.init(coder:)(a1);
}

id GenericExperience.init(coder:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_ServerSuggestion?);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v51 = (char *)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for BinaryDecodingOptions();
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  char v49 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v55 = (char *)&v42 - v8;
  uint64_t v9 = (void *)type metadata accessor for Apple_Parsec_Siri_V2alpha_ExperienceComponent();
  uint64_t v10 = *(v9 - 1);
  MEMORY[0x270FA5388](v9);
  unint64_t v56 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (uint64_t)&v1[OBJC_IVAR____TtC21SiriInformationSearch17GenericExperience_serverSuggestions];
  uint64_t v13 = type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestion();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v14 + 56);
  uint64_t v48 = v13;
  uint64_t v47 = v15;
  uint64_t v46 = v14 + 56;
  ((void (*)(uint64_t, uint64_t, uint64_t))v15)(v12, 1, 1);
  uint64_t v16 = &v1[OBJC_IVAR____TtC21SiriInformationSearch17GenericExperience_sageExperience];
  uint64_t v17 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SageExperience();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v16, 1, 1, v17);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject.Type>);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_25C97F8F0;
  *(void *)(v18 + 32) = type metadata accessor for NSArray(0, &lazy cache variable for type metadata for NSArray);
  uint64_t v50 = type metadata accessor for NSArray(0, (unint64_t *)&lazy cache variable for type metadata for NSData);
  *(void *)(v18 + 40) = v50;
  uint64_t v19 = v1;
  NSCoder.decodeObject(of:forKey:)();
  swift_bridgeObjectRelease();
  if (*((void *)&v58 + 1))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [NSData]);
    if (swift_dynamicCast())
    {
      uint64_t v43 = v12;
      int v44 = v19;
      unint64_t v20 = v60;
      if (v60 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v12 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v12 = *(void *)((v60 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      uint64_t v45 = a1;
      if (v12)
      {
        unint64_t v60 = MEMORY[0x263F8EE78];
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v12 & ~(v12 >> 63), 0);
        if ((v12 & 0x8000000000000000) == 0)
        {
          uint64_t v21 = 0;
          uint64_t v16 = 0;
          uint64_t v22 = (unint64_t *)v60;
          uint64_t v52 = v10 + 32;
          unint64_t v53 = v20 & 0xC000000000000001;
          unint64_t v54 = v20;
          while (v12 != v21)
          {
            if (v53) {
              id v23 = (id)MEMORY[0x261198DD0](v21, v20);
            }
            else {
              id v23 = *(id *)(v20 + 8 * v21 + 32);
            }
            uint64_t v24 = v23;
            static Data._unconditionallyBridgeFromObjectiveC(_:)();
            uint64_t v59 = 0;
            long long v57 = 0u;
            long long v58 = 0u;
            BinaryDecodingOptions.init()();
            lazy protocol witness table accessor for type Apple_Parsec_Siri_V2alpha_ExperienceComponent and conformance Apple_Parsec_Siri_V2alpha_ExperienceComponent(&lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_ExperienceComponent and conformance Apple_Parsec_Siri_V2alpha_ExperienceComponent, MEMORY[0x263F5CF28]);
            Message.init(serializedData:extensions:partial:options:)();

            unint64_t v60 = (unint64_t)v22;
            unint64_t v26 = v22[2];
            unint64_t v25 = v22[3];
            a1 = (void *)(v26 + 1);
            unint64_t v20 = v54;
            if (v26 >= v25 >> 1)
            {
              specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v25 > 1, v26 + 1, 1);
              uint64_t v22 = (unint64_t *)v60;
            }
            ++v21;
            v22[2] = (unint64_t)a1;
            (*(void (**)(unint64_t, char *, void *))(v10 + 32))((unint64_t)v22+ ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80))+ *(void *)(v10 + 72) * v26, v56, v9);
            if (v12 == v21)
            {
              swift_bridgeObjectRelease();
              goto LABEL_23;
            }
          }
          __break(1u);
          goto LABEL_30;
        }
        __break(1u);
        swift_once();
        uint64_t v38 = type metadata accessor for Logger();
        __swift_project_value_buffer(v38, (uint64_t)static Logger.pommes);
        uint64_t v35 = Logger.logObject.getter();
        os_log_type_t v39 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v35, v39))
        {
          uint64_t v40 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v40 = 0;
          _os_log_impl(&dword_25C8FE000, v35, v39, "GenericExperience failed to extract server suggestions", v40, 2u);
          MEMORY[0x261199590](v40, -1, -1);

          uint64_t v35 = v10;
        }
        else
        {
        }
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v22 = (unint64_t *)MEMORY[0x263F8EE78];
LABEL_23:
        uint64_t v32 = v44;
        *(Class *)((char *)&v44->isa + OBJC_IVAR____TtC21SiriInformationSearch17GenericExperience_components) = (Class)v22;
        uint64_t v9 = v45;
        uint64_t v33 = (uint64_t)v51;
        uint64_t v34 = NSCoder.decodeObject<A>(of:forKey:)();
        uint64_t v35 = v32;
        if (v34)
        {
          unint64_t v36 = (void *)v34;
          static Data._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v59 = 0;
          long long v57 = 0u;
          long long v58 = 0u;
          BinaryDecodingOptions.init()();
          lazy protocol witness table accessor for type Apple_Parsec_Siri_V2alpha_ExperienceComponent and conformance Apple_Parsec_Siri_V2alpha_ExperienceComponent(&lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_ServerSuggestion and conformance Apple_Parsec_Siri_V2alpha_ServerSuggestion, MEMORY[0x263F5CEB0]);
          uint64_t v37 = v48;
          Message.init(serializedData:extensions:partial:options:)();

          v47(v33, 0, 1, v37);
          uint64_t v41 = v43;
          swift_beginAccess();
          outlined assign with take of Apple_Parsec_Siri_V2alpha_AudioUnderstanding?(v33, v41, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_ServerSuggestion?);
          swift_endAccess();
          uint64_t v35 = v32;
        }
      }

      return Experience.init(coder:)(v9);
    }
  }
  else
  {

    outlined destroy of ClientExperienceSignals?((uint64_t)&v57, (uint64_t *)&demangling cache variable for type metadata for Any?);
  }
  if (one-time initialization token for pommes != -1) {
LABEL_30:
  }
    swift_once();
  uint64_t v27 = type metadata accessor for Logger();
  __swift_project_value_buffer(v27, (uint64_t)static Logger.pommes);
  uint64_t v28 = Logger.logObject.getter();
  os_log_type_t v29 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v30 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v30 = 0;
    _os_log_impl(&dword_25C8FE000, v28, v29, "GenericExperience failed to extract componentsArray", v30, 2u);
    MEMORY[0x261199590](v30, -1, -1);
  }

  outlined destroy of ClientExperienceSignals?(v12, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_ServerSuggestion?);
  outlined destroy of ClientExperienceSignals?((uint64_t)v16, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_SageExperience?);
  type metadata accessor for GenericExperience();
  swift_deallocPartialClassInstance();
  return 0;
}

Swift::Void __swiftcall GenericExperience.encode(with:)(NSCoder with)
{
  uint64_t v2 = v1;
  Class isa = with.super.isa;
  uint64_t v3 = type metadata accessor for Apple_Parsec_Siri_V2alpha_ExperienceComponent();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_ServerSuggestion?);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestion();
  uint64_t v39 = *(void *)(v41 - 8);
  MEMORY[0x270FA5388](v41);
  uint64_t v40 = (char *)v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)((char *)v1 + OBJC_IVAR____TtC21SiriInformationSearch17GenericExperience_components);
  uint64_t v12 = *(void *)(v11 + 16);
  if (v12)
  {
    uint64_t v38 = v1;
    uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
    uint64_t v13 = v4 + 16;
    uint64_t v15 = v11 + ((*(unsigned __int8 *)(v13 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 64));
    uint64_t v48 = (void (**)(char *, uint64_t))(v13 - 8);
    char v49 = v14;
    uint64_t v47 = *(void *)(v13 + 56);
    v37[1] = v11;
    swift_bridgeObjectRetain_n();
    uint64_t v50 = (void *)MEMORY[0x263F8EE78];
    *(void *)&long long v16 = 136315138;
    long long v44 = v16;
    uint64_t v43 = MEMORY[0x263F8EE58] + 8;
    uint64_t v45 = v9;
    uint64_t v46 = v13;
    do
    {
      v49(v6, v15, v3);
      lazy protocol witness table accessor for type Apple_Parsec_Siri_V2alpha_ExperienceComponent and conformance Apple_Parsec_Siri_V2alpha_ExperienceComponent(&lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_ExperienceComponent and conformance Apple_Parsec_Siri_V2alpha_ExperienceComponent, MEMORY[0x263F5CF28]);
      uint64_t v17 = Message.serializedData(partial:)();
      uint64_t v19 = v18;
      (*v48)(v6, v3);
      if (swift_isUniquelyReferenced_nonNull_native()) {
        unint64_t v20 = v50;
      }
      else {
        unint64_t v20 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v50[2] + 1, 1, v50);
      }
      unint64_t v22 = v20[2];
      unint64_t v21 = v20[3];
      if (v22 >= v21 >> 1) {
        unint64_t v20 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v21 > 1), v22 + 1, 1, v20);
      }
      _OWORD v20[2] = v22 + 1;
      uint64_t v50 = v20;
      id v23 = &v20[2 * v22];
      v23[4] = v17;
      v23[5] = v19;
      v15 += v47;
      --v12;
    }
    while (v12);
    swift_bridgeObjectRelease_n();
    uint64_t v2 = v38;
  }
  Class v24 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  unint64_t v25 = (void *)MEMORY[0x261198B80](0x6E656E6F706D6F63, 0xEA00000000007374);
  Class v26 = isa;
  [(objc_class *)isa encodeObject:v24 forKey:v25];

  (*(void (**)(void))((*MEMORY[0x263F8EED0] & *v2) + 0x160))();
  uint64_t v27 = v39;
  uint64_t v28 = v41;
  int v29 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v39 + 48))(v9, 1, v41);
  uint64_t v30 = v40;
  if (v29 == 1)
  {
    outlined destroy of ClientExperienceSignals?((uint64_t)v9, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_ServerSuggestion?);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v40, v9, v28);
    lazy protocol witness table accessor for type Apple_Parsec_Siri_V2alpha_ExperienceComponent and conformance Apple_Parsec_Siri_V2alpha_ExperienceComponent(&lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_ServerSuggestion and conformance Apple_Parsec_Siri_V2alpha_ServerSuggestion, MEMORY[0x263F5CEB0]);
    uint64_t v31 = Message.serializedData(partial:)();
    unint64_t v33 = v32;
    Class v34 = Data._bridgeToObjectiveC()().super.isa;
    uint64_t v35 = v30;
    unint64_t v36 = (void *)MEMORY[0x261198B80](0xD000000000000011, 0x800000025C982590);
    [(objc_class *)v26 encodeObject:v34 forKey:v36];
    outlined consume of Data._Representation(v31, v33);

    (*(void (**)(char *, uint64_t))(v27 + 8))(v35, v28);
  }
  Experience.encode(with:)((NSCoder)v26);
}

void GenericExperience.__allocating_init(pluginId:queryConfidence:)()
{
}

void GenericExperience.init(pluginId:queryConfidence:)()
{
}

void GenericExperience.__allocating_init(pluginId:queryConfidence:userDialogAct:)()
{
}

void GenericExperience.init(pluginId:queryConfidence:userDialogAct:)()
{
}

void GenericExperience.__allocating_init(pluginId:queryConfidence:userDialogAct:renderOptions:)()
{
}

void GenericExperience.init(pluginId:queryConfidence:userDialogAct:renderOptions:)()
{
}

void GenericExperience.__allocating_init(pluginId:queryConfidence:userDialogAct:intent:)()
{
}

void GenericExperience.init(pluginId:queryConfidence:userDialogAct:intent:)()
{
}

void GenericExperience.__allocating_init(pluginId:queryConfidence:userDialogAct:renderOptions:intent:)()
{
}

void GenericExperience.init(pluginId:queryConfidence:userDialogAct:renderOptions:intent:)()
{
}

uint64_t GenericExperience.__ivar_destroyer()
{
  swift_bridgeObjectRelease();
  outlined destroy of ClientExperienceSignals?(v0 + OBJC_IVAR____TtC21SiriInformationSearch17GenericExperience_serverSuggestions, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_ServerSuggestion?);
  return outlined destroy of ClientExperienceSignals?(v0 + OBJC_IVAR____TtC21SiriInformationSearch17GenericExperience_sageExperience, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_SageExperience?);
}

id GenericExperience.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GenericExperience();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for GenericExperience()
{
  uint64_t result = type metadata singleton initialization cache for GenericExperience;
  if (!type metadata singleton initialization cache for GenericExperience) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type Apple_Parsec_Siri_V2alpha_ExperienceComponent and conformance Apple_Parsec_Siri_V2alpha_ExperienceComponent(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_25C92E744(void **a1)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x160))();
}

uint64_t sub_25C92E7A4(void **a1)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & **a1) + 0x178))();
}

uint64_t ObjC metadata update function for GenericExperience()
{
  return type metadata accessor for GenericExperience();
}

void type metadata completion function for GenericExperience()
{
  type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestion?(319, &lazy cache variable for type metadata for Apple_Parsec_Siri_V2alpha_ServerSuggestion?, MEMORY[0x263F5CEB0]);
  if (v0 <= 0x3F)
  {
    type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestion?(319, &lazy cache variable for type metadata for Apple_Parsec_Siri_V2alpha_SageExperience?, MEMORY[0x263F5CE58]);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for GenericExperience(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for GenericExperience);
}

uint64_t dispatch thunk of GenericExperience.serverSuggestions.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of GenericExperience.serverSuggestions.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x168))();
}

uint64_t dispatch thunk of GenericExperience.serverSuggestions.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x170))();
}

uint64_t dispatch thunk of GenericExperience.sageExperience.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of GenericExperience.sageExperience.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of GenericExperience.sageExperience.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x188))();
}

uint64_t dispatch thunk of GenericExperience.__allocating_init(components:queryConfidenceScore:userDialogAct:renderOptions:)()
{
  return (*(uint64_t (**)(void))(v0 + 400))();
}

uint64_t dispatch thunk of GenericExperience.__allocating_init(components:queryConfidenceScore:userDialogAct:intent:renderOptions:)()
{
  return (*(uint64_t (**)(void))(v0 + 408))();
}

void type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestion?(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = type metadata accessor for Optional();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t KVFieldType.audioType.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (a1 > 599)
  {
    if (a1 > 699)
    {
      switch(a1)
      {
        case 700:
          uint64_t v3 = (unsigned int *)MEMORY[0x263F5CDE8];
          break;
        case 701:
LABEL_11:
          uint64_t v3 = (unsigned int *)MEMORY[0x263F5CE30];
          break;
        case 702:
          uint64_t v3 = (unsigned int *)MEMORY[0x263F5CE08];
          break;
        default:
LABEL_20:
          uint64_t v3 = (unsigned int *)MEMORY[0x263F5CE40];
          break;
      }
    }
    else
    {
      switch(a1)
      {
        case 600:
LABEL_6:
          uint64_t v3 = (unsigned int *)MEMORY[0x263F5CE48];
          break;
        case 601:
        case 603:
          goto LABEL_11;
        case 602:
LABEL_12:
          uint64_t v3 = (unsigned int *)MEMORY[0x263F5CE50];
          break;
        default:
          goto LABEL_20;
      }
    }
  }
  else
  {
    switch(a1)
    {
      case 202:
      case 206:
      case 226:
        goto LABEL_11;
      case 204:
        uint64_t v3 = (unsigned int *)MEMORY[0x263F5CE18];
        break;
      case 208:
        goto LABEL_12;
      case 210:
        uint64_t v3 = (unsigned int *)MEMORY[0x263F5CE20];
        break;
      case 212:
        uint64_t v3 = (unsigned int *)MEMORY[0x263F5CE28];
        break;
      case 214:
        uint64_t v3 = (unsigned int *)MEMORY[0x263F5CDE0];
        break;
      case 216:
        goto LABEL_6;
      case 228:
        uint64_t v3 = (unsigned int *)MEMORY[0x263F5CE10];
        break;
      case 230:
        uint64_t v3 = (unsigned int *)MEMORY[0x263F5CDF0];
        break;
      case 232:
        uint64_t v3 = (unsigned int *)MEMORY[0x263F5CE38];
        break;
      default:
        goto LABEL_20;
    }
  }
  uint64_t v4 = *v3;
  uint64_t v5 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioItemType();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 104);

  return v6(a2, v4, v5);
}

uint64_t KVItemType.description.getter()
{
  return 0x6E776F6E6B6E75;
}

uint64_t KVFieldType.description.getter()
{
  return 0x656E696665646E75;
}

uint64_t VocabularyField.label.getter()
{
  return PommesResponse.requestId.getter(&OBJC_IVAR____TtC21SiriInformationSearch15VocabularyField_label);
}

uint64_t VocabularyField.value.getter()
{
  return PommesResponse.requestId.getter(&OBJC_IVAR____TtC21SiriInformationSearch15VocabularyField_value);
}

uint64_t VocabularyField.fieldType.getter()
{
  return *(void *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch15VocabularyField_fieldType);
}

id VocabularyField.__allocating_init(label:value:fieldType:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = (char *)objc_allocWithZone(v5);
  uint64_t v12 = &v11[OBJC_IVAR____TtC21SiriInformationSearch15VocabularyField_label];
  *(void *)uint64_t v12 = a1;
  *((void *)v12 + 1) = a2;
  uint64_t v13 = &v11[OBJC_IVAR____TtC21SiriInformationSearch15VocabularyField_value];
  *(void *)uint64_t v13 = a3;
  *((void *)v13 + 1) = a4;
  *(void *)&v11[OBJC_IVAR____TtC21SiriInformationSearch15VocabularyField_fieldType] = a5;
  v15.receiver = v11;
  v15.super_class = v5;
  return objc_msgSendSuper2(&v15, sel_init);
}

id VocabularyField.init(label:value:fieldType:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = &v5[OBJC_IVAR____TtC21SiriInformationSearch15VocabularyField_label];
  *(void *)uint64_t v6 = a1;
  *((void *)v6 + 1) = a2;
  uint64_t v7 = &v5[OBJC_IVAR____TtC21SiriInformationSearch15VocabularyField_value];
  *(void *)uint64_t v7 = a3;
  *((void *)v7 + 1) = a4;
  *(void *)&v5[OBJC_IVAR____TtC21SiriInformationSearch15VocabularyField_fieldType] = a5;
  v9.receiver = v5;
  v9.super_class = (Class)type metadata accessor for VocabularyField();
  return objc_msgSendSuper2(&v9, sel_init);
}

uint64_t type metadata accessor for VocabularyField()
{
  return self;
}

id VocabularyField.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  id v4 = specialized VocabularyField.init(coder:)(a1);

  return v4;
}

id VocabularyField.init(coder:)(void *a1)
{
  id v2 = specialized VocabularyField.init(coder:)(a1);

  return v2;
}

Swift::Void __swiftcall VocabularyField.encode(with:)(NSCoder with)
{
  if (*(void *)(v1 + OBJC_IVAR____TtC21SiriInformationSearch15VocabularyField_label + 8))
  {
    uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC21SiriInformationSearch15VocabularyField_label);
    unint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC21SiriInformationSearch15VocabularyField_label + 8);
  }
  else
  {
    uint64_t v3 = 0;
    unint64_t v4 = 0xE000000000000000;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = (void *)MEMORY[0x261198B80](v3, v4);
  swift_bridgeObjectRelease();
  uint64_t v6 = (void *)MEMORY[0x261198B80](0x6C6562616CLL, 0xE500000000000000);
  [(objc_class *)with.super.isa encodeObject:v5 forKey:v6];

  if (*(void *)(v1 + OBJC_IVAR____TtC21SiriInformationSearch15VocabularyField_value + 8))
  {
    uint64_t v7 = *(void *)(v1 + OBJC_IVAR____TtC21SiriInformationSearch15VocabularyField_value);
    unint64_t v8 = *(void *)(v1 + OBJC_IVAR____TtC21SiriInformationSearch15VocabularyField_value + 8);
  }
  else
  {
    uint64_t v7 = 0;
    unint64_t v8 = 0xE000000000000000;
  }
  swift_bridgeObjectRetain();
  objc_super v9 = (void *)MEMORY[0x261198B80](v7, v8);
  swift_bridgeObjectRelease();
  uint64_t v10 = (void *)MEMORY[0x261198B80](0x65756C6176, 0xE500000000000000);
  [(objc_class *)with.super.isa encodeObject:v9 forKey:v10];

  uint64_t v11 = *(void *)(v1 + OBJC_IVAR____TtC21SiriInformationSearch15VocabularyField_fieldType);
  id v12 = (id)MEMORY[0x261198B80](0x707954646C656966, 0xE900000000000065);
  [(objc_class *)with.super.isa encodeInteger:v11 forKey:v12];
}

unint64_t VocabularyField.description.getter()
{
  uint64_t v1 = 7104878;
  _StringGuts.grow(_:)(47);
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch15VocabularyField_label + 8))
  {
    uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch15VocabularyField_label);
    uint64_t v3 = *(void **)(v0 + OBJC_IVAR____TtC21SiriInformationSearch15VocabularyField_label + 8);
  }
  else
  {
    uint64_t v3 = (void *)0xE300000000000000;
    uint64_t v2 = 7104878;
  }
  swift_bridgeObjectRetain();
  v4._uint64_t countAndFlagsBits = v2;
  v4._object = v3;
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  v5._uint64_t countAndFlagsBits = 0x3D65756C6176202CLL;
  v5._object = (void *)0xE800000000000000;
  String.append(_:)(v5);
  if (*(void *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch15VocabularyField_value + 8))
  {
    uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch15VocabularyField_value);
    uint64_t v6 = *(void **)(v0 + OBJC_IVAR____TtC21SiriInformationSearch15VocabularyField_value + 8);
  }
  else
  {
    uint64_t v6 = (void *)0xE300000000000000;
  }
  swift_bridgeObjectRetain();
  v7._uint64_t countAndFlagsBits = v1;
  v7._object = v6;
  String.append(_:)(v7);
  swift_bridgeObjectRelease();
  v8._uint64_t countAndFlagsBits = 0x54646C656966202CLL;
  v8._object = (void *)0xEC0000003D657079;
  String.append(_:)(v8);
  v9._uint64_t countAndFlagsBits = KVFieldType.description.getter();
  String.append(_:)(v9);
  swift_bridgeObjectRelease();
  v10._uint64_t countAndFlagsBits = 32032;
  v10._object = (void *)0xE200000000000000;
  String.append(_:)(v10);
  return 0xD000000000000013;
}

id VocabularyField.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void VocabularyField.init()()
{
}

id VocabularyField.__deallocating_deinit()
{
  return VocabularyField.__deallocating_deinit(type metadata accessor for VocabularyField);
}

uint64_t VocabularyResult.appId.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_appId);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t VocabularyResult.itemId.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_itemId);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t VocabularyResult.itemType.getter()
{
  return *(void *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_itemType);
}

uint64_t VocabularyResult.fieldTypes.getter()
{
  return swift_bridgeObjectRetain();
}

float VocabularyResult.score.getter()
{
  return *(float *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_score);
}

uint64_t VocabularyResult.spanBegin.getter()
{
  return *(void *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_spanBegin);
}

uint64_t VocabularyResult.spanEnd.getter()
{
  return *(void *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_spanEnd);
}

uint64_t VocabularyResult.semanticValue.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_semanticValue);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t VocabularyResult.fields.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t VocabularyResult.userId.getter()
{
  return PommesResponse.requestId.getter(&OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_userId);
}

uint64_t VocabularyResult.fieldType.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_fieldTypes);
  if (*(void *)(v1 + 16)) {
    return *(void *)(v1 + 32);
  }
  else {
    return 0;
  }
}

id VocabularyResult.__allocating_init(appId:itemId:itemType:fieldTypes:score:spanBegin:spanEnd:semanticValue:fields:userId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, float a9, long long a10, long long a11, uint64_t a12)
{
  id v22 = objc_allocWithZone(v12);
  return VocabularyResult.init(appId:itemId:itemType:fieldTypes:score:spanBegin:spanEnd:semanticValue:fields:userId:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, *((uint64_t *)&a10 + 1), a11, *((uint64_t *)&a11 + 1), a12);
}

id VocabularyResult.init(appId:itemId:itemType:fieldTypes:score:spanBegin:spanEnd:semanticValue:fields:userId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, float a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  objc_super v15 = &v14[OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_appId];
  *(void *)objc_super v15 = a1;
  *((void *)v15 + 1) = a2;
  long long v16 = &v14[OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_itemId];
  *(void *)long long v16 = a3;
  *((void *)v16 + 1) = a4;
  *(void *)&v14[OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_itemType] = a5;
  *(void *)&v14[OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_fieldTypes] = a6;
  *(float *)&v14[OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_score] = a9;
  *(void *)&v14[OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_spanBegin] = a7;
  *(void *)&v14[OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_spanEnd] = a8;
  uint64_t v17 = &v14[OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_semanticValue];
  *(void *)uint64_t v17 = a10;
  *((void *)v17 + 1) = a11;
  *(void *)&v14[OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_fields] = a12;
  uint64_t v18 = &v14[OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_userId];
  *(void *)uint64_t v18 = a13;
  *((void *)v18 + 1) = a14;
  v20.receiver = v14;
  v20.super_class = (Class)type metadata accessor for VocabularyResult();
  return objc_msgSendSuper2(&v20, sel_init);
}

void VocabularyResult.__allocating_init(_:userId:)(void *a1, uint64_t a2, uint64_t a3)
{
  id v7 = objc_allocWithZone(v3);
  VocabularyResult.init(_:userId:)(a1, a2, a3);
}

void VocabularyResult.init(_:userId:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = one-time initialization token for music;
  uint64_t v6 = v3;
  if (v5 != -1) {
    swift_once();
  }
  uint64_t v7 = type metadata accessor for Logger();
  __swift_project_value_buffer(v7, (uint64_t)static Logger.music);
  id v8 = a1;
  Swift::String v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.debug.getter();
  unint64_t v11 = 0x2654E2000uLL;
  unint64_t v12 = 0x2654E2000uLL;
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = v6;
    uint64_t v15 = swift_slowAlloc();
    aBlock[0] = v15;
    *(_DWORD *)uint64_t v13 = 136315138;
    id v16 = objc_msgSend(v8, sel_itemInfo);
    id v17 = objc_msgSend(v16, sel_item);

    id v18 = objc_msgSend(v17, sel_itemId);
    uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v21 = v20;

    unint64_t v11 = 0x2654E2000;
    uint64_t v73 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v19, v21, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25C8FE000, v9, v10, "CKVMatchingSpan  itemId=%s", v13, 0xCu);
    swift_arrayDestroy();
    uint64_t v22 = v15;
    uint64_t v6 = v14;
    MEMORY[0x261199590](v22, -1, -1);
    unint64_t v12 = 0x2654E2000;
    MEMORY[0x261199590](v13, -1, -1);
  }
  else
  {
  }
  id v23 = [v8 *(SEL *)(v11 + 4048)];
  unint64_t v24 = v11;
  id v25 = objc_msgSend(v23, sel_originAppId);

  uint64_t v26 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v28 = v27;

  int v29 = (uint64_t *)&v6[OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_appId];
  *int v29 = v26;
  v29[1] = v28;
  id v30 = [v8 (SEL)(v24 + 1127)];
  id v31 = [v30 *(SEL *)(v12 + 4064)];

  id v32 = objc_msgSend(v31, sel_itemId);
  uint64_t v33 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v35 = v34;

  unint64_t v36 = (uint64_t *)&v6[OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_itemId];
  *unint64_t v36 = v33;
  v36[1] = v35;
  id v37 = [v8 (SEL)(v24 + 1127)];
  id v38 = [v37 *(SEL *)(v12 + 4064)];

  id v39 = objc_msgSend(v38, sel_itemType);
  *(void *)&v6[OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_itemType] = v39;
  id v40 = objc_msgSend(v8, sel_fieldMatches);
  type metadata accessor for NSArray(0, &lazy cache variable for type metadata for KVFieldMatch);
  unint64_t v41 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v41 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v42 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v42 = *(void *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v42)
  {
    aBlock[0] = MEMORY[0x263F8EE78];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v42 & ~(v42 >> 63), 0);
    if (v42 < 0) {
      goto LABEL_25;
    }
    unint64_t v68 = v6;
    uint64_t v43 = 0;
    uint64_t v44 = aBlock[0];
    do
    {
      if ((v41 & 0xC000000000000001) != 0) {
        id v45 = (id)MEMORY[0x261198DD0](v43, v41);
      }
      else {
        id v45 = *(id *)(v41 + 8 * v43 + 32);
      }
      uint64_t v46 = v45;
      id v47 = objc_msgSend(v45, sel_fieldType);

      aBlock[0] = v44;
      unint64_t v49 = *(void *)(v44 + 16);
      unint64_t v48 = *(void *)(v44 + 24);
      if (v49 >= v48 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v48 > 1, v49 + 1, 1);
        uint64_t v44 = aBlock[0];
      }
      ++v43;
      *(void *)(v44 + 16) = v49 + 1;
      *(void *)(v44 + 8 * v49 + 32) = v47;
    }
    while (v42 != v43);
    swift_bridgeObjectRelease();
    uint64_t v6 = v68;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v44 = MEMORY[0x263F8EE78];
  }
  *(void *)&v6[OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_fieldTypes] = v44;
  objc_msgSend(v8, sel_score);
  *(_DWORD *)&v6[OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_score] = v50;
  id v51 = objc_msgSend(v8, sel_spanInfo);
  id v52 = objc_msgSend(v51, sel_spanRange);

  *(void *)&v6[OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_spanBegin] = v52;
  id v53 = objc_msgSend(v8, sel_spanInfo);
  unint64_t v54 = (char *)objc_msgSend(v53, sel_spanRange);
  uint64_t v56 = v55;

  if (__OFADD__(v54, v56))
  {
    __break(1u);
  }
  else
  {
    *(void *)&v6[OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_spanEnd] = &v54[v56];
    id v57 = objc_msgSend(v8, sel_spanValue);
    uint64_t v58 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v60 = v59;

    uint64_t v61 = (uint64_t *)&v6[OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_semanticValue];
    *uint64_t v61 = v58;
    v61[1] = v60;
    uint64_t v73 = MEMORY[0x263F8EE78];
    id v62 = objc_msgSend(v8, sel_itemInfo);
    id v63 = objc_msgSend(v62, sel_item);

    uint64_t v64 = swift_allocObject();
    *(void *)(v64 + 16) = &v73;
    uint64_t v65 = swift_allocObject();
    *(void *)(v65 + 16) = partial apply for closure #2 in VocabularyResult.init(_:userId:);
    *(void *)(v65 + 24) = v64;
    aBlock[4] = (uint64_t)partial apply for thunk for @callee_guaranteed (@guaranteed KVField, @unowned Int, @unowned UnsafeMutablePointer<ObjCBool>) -> ();
    aBlock[5] = v65;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)thunk for @escaping @callee_guaranteed (@guaranteed KVField, @unowned Int, @unowned UnsafeMutablePointer<ObjCBool>) -> ();
    aBlock[3] = (uint64_t)&block_descriptor;
    uint64_t v66 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v63, sel_enumerateFieldsUsingBlock_, v66);

    _Block_release(v66);
    LOBYTE(v66) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    if ((v66 & 1) == 0)
    {
      *(void *)&v6[OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_fields] = v73;
      uint64_t v67 = &v6[OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_userId];
      *(void *)uint64_t v67 = a2;
      *((void *)v67 + 1) = a3;
      swift_bridgeObjectRetain();

      v71.receiver = v6;
      v71.super_class = (Class)type metadata accessor for VocabularyResult();
      objc_msgSendSuper2(&v71, sel_init);

      swift_release();
      swift_bridgeObjectRelease();
      return;
    }
  }
  __break(1u);
LABEL_25:
  __break(1u);
}

uint64_t closure #2 in VocabularyResult.init(_:userId:)(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = objc_msgSend(a1, sel_label);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v10 = 0;
  }
  id v11 = objc_msgSend(a1, sel_value);
  if (v11)
  {
    unint64_t v12 = v11;
    uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v15 = v14;
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v15 = 0;
  }
  id v16 = objc_msgSend(a1, sel_fieldType);
  id v17 = (objc_class *)type metadata accessor for VocabularyField();
  id v18 = (char *)objc_allocWithZone(v17);
  uint64_t v19 = (uint64_t *)&v18[OBJC_IVAR____TtC21SiriInformationSearch15VocabularyField_label];
  *uint64_t v19 = v8;
  v19[1] = v10;
  unint64_t v20 = (uint64_t *)&v18[OBJC_IVAR____TtC21SiriInformationSearch15VocabularyField_value];
  *unint64_t v20 = v13;
  v20[1] = v15;
  *(void *)&v18[OBJC_IVAR____TtC21SiriInformationSearch15VocabularyField_fieldType] = v16;
  v22.receiver = v18;
  v22.super_class = v17;
  objc_msgSendSuper2(&v22, sel_init);
  MEMORY[0x261198C50]();
  if (*(void *)((*a4 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*a4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  }
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  return specialized Array._endMutation()();
}

void thunk for @escaping @callee_guaranteed (@guaranteed KVField, @unowned Int, @unowned UnsafeMutablePointer<ObjCBool>) -> ()(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

uint64_t VocabularyResult.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return VocabularyResult.init(coder:)(a1);
}

uint64_t VocabularyResult.init(coder:)(void *a1)
{
  type metadata accessor for NSArray(0, (unint64_t *)&lazy cache variable for type metadata for NSString);
  id v3 = v1;
  uint64_t v4 = NSCoder.decodeObject<A>(of:forKey:)();
  if (!v4) {
    goto LABEL_21;
  }
  uint64_t v5 = (void *)v4;
  uint64_t v6 = NSCoder.decodeObject<A>(of:forKey:)();
  if (!v6)
  {

LABEL_21:
    goto LABEL_22;
  }
  uint64_t v55 = (void *)v6;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject.Type>);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_25C97F8F0;
  uint64_t v8 = type metadata accessor for NSArray(0, &lazy cache variable for type metadata for NSArray);
  *(void *)(v7 + 32) = v8;
  *(void *)(v7 + 40) = type metadata accessor for NSArray(0, &lazy cache variable for type metadata for NSNumber);
  NSCoder.decodeObject(of:forKey:)();
  swift_bridgeObjectRelease();
  if (!v60)
  {

    outlined destroy of Any?((uint64_t)v59);
LABEL_22:
    type metadata accessor for VocabularyResult();
    swift_deallocPartialClassInstance();
    return 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [NSNumber]);
  if ((swift_dynamicCast() & 1) == 0)
  {

    goto LABEL_21;
  }
  unint64_t v9 = v58[0];
  id v53 = NSCoder.decodeObject<A>(of:forKey:)();
  if (!v53)
  {

    swift_bridgeObjectRelease();
    goto LABEL_21;
  }
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_25C97F8F0;
  *(void *)(v10 + 32) = v8;
  *(void *)(v10 + 40) = type metadata accessor for VocabularyField();
  NSCoder.decodeObject(of:forKey:)();
  swift_bridgeObjectRelease();
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v12 = (uint64_t *)&v3[OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_appId];
  uint64_t *v12 = v11;
  v12[1] = v13;
  uint64_t v14 = v55;
  uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v16 = (uint64_t *)&v3[OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_itemId];
  uint64_t *v16 = v15;
  v16[1] = v17;
  id v18 = (void *)MEMORY[0x261198B80](0x657079546D657469, 0xE800000000000000);
  unint64_t v19 = 0x2654E2000uLL;
  id v20 = objc_msgSend(a1, sel_decodeIntegerForKey_, v18);

  *(void *)&v3[OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_itemType] = v20;
  if (!(v9 >> 62))
  {
    uint64_t v21 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    id v52 = v5;
    if (v21) {
      goto LABEL_8;
    }
LABEL_25:
    swift_bridgeObjectRelease();
    uint64_t v24 = MEMORY[0x263F8EE78];
LABEL_26:
    *(void *)&v3[OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_fieldTypes] = v24;
    uint64_t v33 = (void *)MEMORY[0x261198B80](0x65726F6373, 0xE500000000000000);
    objc_msgSend(a1, sel_decodeFloatForKey_, v33);
    int v35 = v34;

    *(_DWORD *)&v3[OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_score] = v35;
    unint64_t v36 = (void *)MEMORY[0x261198B80](0x696765426E617073, 0xE90000000000006ELL);
    id v37 = objc_msgSend(a1, *(SEL *)(v19 + 4040), v36);

    *(void *)&v3[OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_spanBegin] = v37;
    id v38 = (void *)MEMORY[0x261198B80](0x646E456E617073, 0xE700000000000000);
    id v39 = objc_msgSend(a1, *(SEL *)(v19 + 4040), v38);

    *(void *)&v3[OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_spanEnd] = v39;
    uint64_t v40 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v41 = (uint64_t *)&v3[OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_semanticValue];
    *unint64_t v41 = v40;
    v41[1] = v42;
    outlined init with copy of Any?((uint64_t)v59, (uint64_t)v58);
    if (v58[3])
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [VocabularyField]);
      int v43 = swift_dynamicCast();
      uint64_t v44 = v56;
      if (!v43) {
        uint64_t v44 = 0;
      }
    }
    else
    {
      outlined destroy of Any?((uint64_t)v58);
      uint64_t v44 = 0;
    }
    *(void *)&v3[OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_fields] = v44;
    uint64_t v45 = NSCoder.decodeObject<A>(of:forKey:)();
    if (v45)
    {
      uint64_t v46 = (void *)v45;
      uint64_t v47 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v49 = v48;
    }
    else
    {

      uint64_t v47 = 0;
      uint64_t v49 = 0;
    }

    outlined destroy of Any?((uint64_t)v59);
    int v50 = (uint64_t *)&v3[OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_userId];
    *int v50 = v47;
    v50[1] = v49;

    v57.receiver = v3;
    v57.super_class = (Class)type metadata accessor for VocabularyResult();
    id v32 = objc_msgSendSuper2(&v57, sel_init);

    return (uint64_t)v32;
  }
  swift_bridgeObjectRetain();
  uint64_t v21 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  id v52 = v5;
  if (!v21) {
    goto LABEL_25;
  }
LABEL_8:
  id v51 = a1;
  unint64_t v54 = v3;
  v58[0] = MEMORY[0x263F8EE78];
  uint64_t result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v21 & ~(v21 >> 63), 0);
  if ((v21 & 0x8000000000000000) == 0)
  {
    uint64_t v23 = 0;
    uint64_t v24 = v58[0];
    unint64_t v25 = v9 & 0xC000000000000001;
    unint64_t v26 = v9;
    do
    {
      if (v25) {
        id v27 = (id)MEMORY[0x261198DD0](v23, v9);
      }
      else {
        id v27 = *(id *)(v9 + 8 * v23 + 32);
      }
      uint64_t v28 = v27;
      id v29 = objc_msgSend(v27, sel_integerValue);

      v58[0] = v24;
      unint64_t v31 = *(void *)(v24 + 16);
      unint64_t v30 = *(void *)(v24 + 24);
      if (v31 >= v30 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v30 > 1, v31 + 1, 1);
        uint64_t v24 = v58[0];
      }
      ++v23;
      *(void *)(v24 + 16) = v31 + 1;
      *(void *)(v24 + 8 * v31 + 32) = v29;
      unint64_t v9 = v26;
    }
    while (v21 != v23);
    swift_bridgeObjectRelease();
    id v3 = v54;
    a1 = v51;
    uint64_t v14 = v55;
    unint64_t v19 = 0x2654E2000;
    goto LABEL_26;
  }
  __break(1u);
  return result;
}

Swift::Void __swiftcall VocabularyResult.encode(with:)(NSCoder with)
{
  uint64_t v2 = v1;
  uint64_t v4 = (void *)MEMORY[0x261198B80](*(void *)(v1 + OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_appId), *(void *)(v1 + OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_appId + 8));
  uint64_t v5 = (void *)MEMORY[0x261198B80](0x6449707061, 0xE500000000000000);
  [(objc_class *)with.super.isa encodeObject:v4 forKey:v5];

  uint64_t v6 = (void *)MEMORY[0x261198B80](*(void *)(v2 + OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_itemId), *(void *)(v2 + OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_itemId + 8));
  uint64_t v7 = (void *)MEMORY[0x261198B80](0x64496D657469, 0xE600000000000000);
  [(objc_class *)with.super.isa encodeObject:v6 forKey:v7];

  uint64_t v8 = *(void *)(v2 + OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_itemType);
  unint64_t v9 = (void *)MEMORY[0x261198B80](0x657079546D657469, 0xE800000000000000);
  [(objc_class *)with.super.isa encodeInteger:v8 forKey:v9];

  uint64_t v10 = *(void *)(v2 + OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_fieldTypes);
  uint64_t v11 = *(void *)(v10 + 16);
  if (v11)
  {
    swift_bridgeObjectRetain();
    specialized ContiguousArray.reserveCapacity(_:)();
    uint64_t v12 = 0;
    do
    {
      uint64_t v13 = v12 + 1;
      objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, *(void *)(v10 + 8 * v12 + 32));
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
      uint64_t v12 = v13;
    }
    while (v11 != v13);
    swift_bridgeObjectRelease();
  }
  type metadata accessor for NSArray(0, &lazy cache variable for type metadata for NSNumber);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  uint64_t v15 = (void *)MEMORY[0x261198B80](0x707954646C656966, 0xEA00000000007365);
  [(objc_class *)with.super.isa encodeObject:isa forKey:v15];

  int v16 = *(_DWORD *)(v2 + OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_score);
  uint64_t v17 = (void *)MEMORY[0x261198B80](0x65726F6373, 0xE500000000000000);
  LODWORD(v18) = v16;
  [(objc_class *)with.super.isa encodeFloat:v17 forKey:v18];

  uint64_t v19 = *(void *)(v2 + OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_spanBegin);
  id v20 = (void *)MEMORY[0x261198B80](0x696765426E617073, 0xE90000000000006ELL);
  [(objc_class *)with.super.isa encodeInteger:v19 forKey:v20];

  uint64_t v21 = *(void *)(v2 + OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_spanEnd);
  objc_super v22 = (void *)MEMORY[0x261198B80](0x646E456E617073, 0xE700000000000000);
  [(objc_class *)with.super.isa encodeInteger:v21 forKey:v22];

  uint64_t v23 = (void *)MEMORY[0x261198B80](*(void *)(v2 + OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_semanticValue), *(void *)(v2 + OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_semanticValue + 8));
  uint64_t v24 = (void *)MEMORY[0x261198B80](0x6369746E616D6573, 0xED000065756C6156);
  [(objc_class *)with.super.isa encodeObject:v23 forKey:v24];

  Class v25 = *(Class *)(v2 + OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_fields);
  if (v25)
  {
    type metadata accessor for VocabularyField();
    Class v25 = Array._bridgeToObjectiveC()().super.isa;
  }
  unint64_t v26 = (void *)MEMORY[0x261198B80](0x73646C656966, 0xE600000000000000);
  [(objc_class *)with.super.isa encodeObject:v25 forKey:v26];
  swift_unknownObjectRelease();

  if (*(void *)(v2 + OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_userId + 8))
  {
    id v27 = (void *)MEMORY[0x261198B80](*(void *)(v2 + OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_userId));
    id v28 = (id)MEMORY[0x261198B80](0x644972657375, 0xE600000000000000);
    [(objc_class *)with.super.isa encodeObject:v27 forKey:v28];
  }
}

id @objc VocabularyField.description.getter(void *a1, uint64_t a2, uint64_t (*a3)(void))
{
  id v4 = a1;
  uint64_t v5 = a3();
  uint64_t v7 = v6;

  uint64_t v8 = (void *)MEMORY[0x261198B80](v5, v7);
  swift_bridgeObjectRelease();

  return v8;
}

uint64_t VocabularyResult.description.getter()
{
  uint64_t v1 = v0;
  _StringGuts.grow(_:)(138);
  v2._uint64_t countAndFlagsBits = 0xD000000000000017;
  v2._object = (void *)0x800000025C983670;
  String.append(_:)(v2);
  uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_appId);
  id v4 = *(void **)(v0 + OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_appId + 8);
  swift_bridgeObjectRetain();
  v5._uint64_t countAndFlagsBits = v3;
  v5._object = v4;
  String.append(_:)(v5);
  swift_bridgeObjectRelease();
  v6._uint64_t countAndFlagsBits = 0x64496D657469202CLL;
  v6._object = (void *)0xE90000000000003DLL;
  String.append(_:)(v6);
  uint64_t v7 = *(void *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_itemId);
  uint64_t v8 = *(void **)(v0 + OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_itemId + 8);
  swift_bridgeObjectRetain();
  v9._uint64_t countAndFlagsBits = v7;
  v9._object = v8;
  String.append(_:)(v9);
  swift_bridgeObjectRelease();
  v10._uint64_t countAndFlagsBits = 0x79546D657469202CLL;
  v10._object = (void *)0xEB000000003D6570;
  String.append(_:)(v10);
  v11._uint64_t countAndFlagsBits = KVItemType.description.getter();
  String.append(_:)(v11);
  swift_bridgeObjectRelease();
  v12._uint64_t countAndFlagsBits = 0x54646C656966202CLL;
  v12._object = (void *)0xEE005B3D73657079;
  String.append(_:)(v12);
  int64_t v13 = *(void *)(*(void *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_fieldTypes) + 16);
  uint64_t v14 = MEMORY[0x263F8EE78];
  uint64_t v63 = v0;
  if (v13)
  {
    uint64_t v64 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v13, 0);
    uint64_t v15 = 0;
    uint64_t v16 = *(void *)(v64 + 16);
    uint64_t v17 = 16 * v16;
    do
    {
      uint64_t v18 = KVFieldType.description.getter();
      uint64_t v20 = v19;
      unint64_t v21 = *(void *)(v64 + 24);
      int64_t v22 = v16 + v15 + 1;
      if (v16 + v15 >= v21 >> 1) {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v21 > 1, v22, 1);
      }
      ++v15;
      *(void *)(v64 + 16) = v22;
      uint64_t v23 = v64 + v17;
      *(void *)(v23 + 32) = v18;
      *(void *)(v23 + 40) = v20;
      v17 += 16;
    }
    while (v13 != v15);
    swift_bridgeObjectRelease();
    uint64_t v1 = v0;
    uint64_t v14 = MEMORY[0x263F8EE78];
  }
  uint64_t v24 = 7104878;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
  unint64_t v25 = lazy protocol witness table accessor for type [String] and conformance [A]();
  uint64_t v26 = BidirectionalCollection<>.joined(separator:)();
  id v28 = v27;
  swift_bridgeObjectRelease();
  v29._uint64_t countAndFlagsBits = v26;
  v29._object = v28;
  String.append(_:)(v29);
  swift_bridgeObjectRelease();
  v30._uint64_t countAndFlagsBits = 0x65726F6373202C5DLL;
  v30._object = (void *)0xE90000000000003DLL;
  String.append(_:)(v30);
  Float.write<A>(to:)();
  v31._uint64_t countAndFlagsBits = 0x7B3D6E617073202CLL;
  v31._object = (void *)0xE800000000000000;
  String.append(_:)(v31);
  v32._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v32);
  swift_bridgeObjectRelease();
  v33._uint64_t countAndFlagsBits = 8236;
  v33._object = (void *)0xE200000000000000;
  String.append(_:)(v33);
  v34._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v34);
  swift_bridgeObjectRelease();
  v35._object = (void *)0x800000025C983690;
  v35._uint64_t countAndFlagsBits = 0xD000000000000012;
  String.append(_:)(v35);
  uint64_t v36 = *(void *)(v1 + OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_semanticValue);
  id v37 = *(void **)(v1 + OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_semanticValue + 8);
  swift_bridgeObjectRetain();
  v38._uint64_t countAndFlagsBits = v36;
  v38._object = v37;
  String.append(_:)(v38);
  swift_bridgeObjectRelease();
  v39._uint64_t countAndFlagsBits = 0x646C656966202C22;
  v39._object = (void *)0xEB000000005B3D73;
  String.append(_:)(v39);
  unint64_t v40 = *(void *)(v1 + OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_fields);
  if (v40)
  {
    if (v40 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v41 = _CocoaArrayWrapper.endIndex.getter();
      unint64_t v62 = v25;
      if (v41) {
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v41 = *(void *)((v40 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      unint64_t v62 = v25;
      if (v41)
      {
LABEL_10:
        uint64_t result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v41 & ~(v41 >> 63), 0);
        if (v41 < 0)
        {
          __break(1u);
          return result;
        }
        uint64_t v43 = 0;
        uint64_t v44 = v14;
        do
        {
          if ((v40 & 0xC000000000000001) != 0) {
            id v45 = (id)MEMORY[0x261198DD0](v43, v40);
          }
          else {
            id v45 = *(id *)(v40 + 8 * v43 + 32);
          }
          uint64_t v46 = v45;
          id v47 = objc_msgSend(v45, sel_description, v62);
          uint64_t v48 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v50 = v49;

          unint64_t v52 = *(void *)(v44 + 16);
          unint64_t v51 = *(void *)(v44 + 24);
          if (v52 >= v51 >> 1) {
            specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v51 > 1, v52 + 1, 1);
          }
          ++v43;
          *(void *)(v44 + 16) = v52 + 1;
          uint64_t v53 = v44 + 16 * v52;
          *(void *)(v53 + 32) = v48;
          *(void *)(v53 + 40) = v50;
        }
        while (v41 != v43);
        swift_bridgeObjectRelease();
        uint64_t v1 = v63;
        uint64_t v24 = 7104878;
        goto LABEL_22;
      }
    }
    swift_bridgeObjectRelease();
LABEL_22:
    uint64_t v55 = BidirectionalCollection<>.joined(separator:)();
    unint64_t v54 = v56;
    swift_bridgeObjectRelease();
    goto LABEL_23;
  }
  unint64_t v54 = (void *)0xE300000000000000;
  uint64_t v55 = 7104878;
LABEL_23:
  v57._uint64_t countAndFlagsBits = v55;
  v57._object = v54;
  String.append(_:)(v57);
  swift_bridgeObjectRelease();
  v58._uint64_t countAndFlagsBits = 0x4972657375202C5DLL;
  v58._object = (void *)0xEB00000000223D64;
  String.append(_:)(v58);
  if (*(void *)(v1 + OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_userId + 8))
  {
    uint64_t v24 = *(void *)(v1 + OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_userId);
    uint64_t v59 = *(void **)(v1 + OBJC_IVAR____TtC21SiriInformationSearch16VocabularyResult_userId + 8);
  }
  else
  {
    uint64_t v59 = (void *)0xE300000000000000;
  }
  swift_bridgeObjectRetain();
  v60._uint64_t countAndFlagsBits = v24;
  v60._object = v59;
  String.append(_:)(v60);
  swift_bridgeObjectRelease();
  v61._uint64_t countAndFlagsBits = 32034;
  v61._object = (void *)0xE200000000000000;
  String.append(_:)(v61);
  return 0;
}

void VocabularyResult.init()()
{
}

id VocabularyResult.__deallocating_deinit()
{
  return VocabularyField.__deallocating_deinit(type metadata accessor for VocabularyResult);
}

id VocabularyField.__deallocating_deinit(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

id specialized VocabularyField.init(coder:)(void *a1)
{
  type metadata accessor for NSArray(0, (unint64_t *)&lazy cache variable for type metadata for NSString);
  objc_super v3 = v1;
  uint64_t v4 = NSCoder.decodeObject<A>(of:forKey:)();
  if (v4)
  {
    Swift::String v5 = (void *)v4;
    static String._conditionallyBridgeFromObjectiveC(_:result:)();
  }
  Swift::String v6 = &v3[OBJC_IVAR____TtC21SiriInformationSearch15VocabularyField_label];
  *(void *)Swift::String v6 = 0;
  *((void *)v6 + 1) = 0;
  uint64_t v7 = NSCoder.decodeObject<A>(of:forKey:)();
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    static String._conditionallyBridgeFromObjectiveC(_:result:)();
  }
  Swift::String v9 = &v3[OBJC_IVAR____TtC21SiriInformationSearch15VocabularyField_value];
  *(void *)Swift::String v9 = 0;
  *((void *)v9 + 1) = 0;
  Swift::String v10 = (void *)MEMORY[0x261198B80](0x707954646C656966, 0xE900000000000065);
  id v11 = objc_msgSend(a1, sel_decodeIntegerForKey_, v10);

  *(void *)&v3[OBJC_IVAR____TtC21SiriInformationSearch15VocabularyField_fieldType] = v11;
  v13.receiver = v3;
  v13.super_class = (Class)type metadata accessor for VocabularyField();
  return objc_msgSendSuper2(&v13, sel_init);
}

uint64_t type metadata accessor for VocabularyResult()
{
  return self;
}

uint64_t sub_25C932A58()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t partial apply for closure #2 in VocabularyResult.init(_:userId:)(void *a1, uint64_t a2, uint64_t a3)
{
  return closure #2 in VocabularyResult.init(_:userId:)(a1, a2, a3, *(void **)(v3 + 16));
}

uint64_t sub_25C932A70()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for thunk for @callee_guaranteed (@guaranteed KVField, @unowned Int, @unowned UnsafeMutablePointer<ObjCBool>) -> ()()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t outlined init with copy of Any?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t lazy protocol witness table accessor for type [String] and conformance [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [String] and conformance [A];
  if (!lazy protocol witness table cache variable for type [String] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [String] and conformance [A]);
  }
  return result;
}

uint64_t method lookup function for VocabularyField(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for VocabularyField);
}

uint64_t dispatch thunk of static VocabularyField.supportsSecureCoding.getter()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of VocabularyField.__allocating_init(label:value:fieldType:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of VocabularyField.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of VocabularyField.encode(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t method lookup function for VocabularyResult(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for VocabularyResult);
}

uint64_t dispatch thunk of static VocabularyResult.supportsSecureCoding.getter()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of VocabularyResult.fieldType.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of VocabularyResult.__allocating_init(appId:itemId:itemType:fieldTypes:score:spanBegin:spanEnd:semanticValue:fields:userId:)()
{
  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of VocabularyResult.__allocating_init(_:userId:)()
{
  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t dispatch thunk of VocabularyResult.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t dispatch thunk of VocabularyResult.encode(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC8))();
}

uint64_t DeviceExpertExperience.deviceExpertClientComponent.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC20SiriInformationTypes22DeviceExpertExperience_deviceExpertClientComponent;
  uint64_t v4 = type metadata accessor for Apple_Parsec_Siri_V2alpha_DeviceExpertClientComponent();
  Swift::String v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

id DeviceExpertExperience.__allocating_init(pluginId:deviceExpertClientComponent:queryConfidenceScore:userDialogAct:)(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, double a5)
{
  id v11 = objc_allocWithZone(v5);
  return DeviceExpertExperience.init(pluginId:deviceExpertClientComponent:queryConfidenceScore:userDialogAct:)(a1, a2, a3, a4, a5);
}

id DeviceExpertExperience.init(pluginId:deviceExpertClientComponent:queryConfidenceScore:userDialogAct:)(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, double a5)
{
  uint64_t v31 = a3;
  Swift::String v32 = a4;
  uint64_t v28 = a1;
  uint64_t v29 = a2;
  uint64_t v27 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent();
  uint64_t v8 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  Swift::String v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = &v5[OBJC_IVAR____TtC20SiriInformationTypes22DeviceExpertExperience_deviceExpertClientComponent];
  uint64_t v30 = type metadata accessor for Apple_Parsec_Siri_V2alpha_DeviceExpertClientComponent();
  uint64_t v16 = *(void *)(v30 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v15, a3, v30);
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v17(v14, (uint64_t)v32, v11);
  id v26 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for PommesRenderOptions(0)), sel_init);
  uint64_t v18 = v27;
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F5CA28], v27);
  *(void *)&v5[OBJC_IVAR____TtC21SiriInformationSearch10Experience_associatedEntities] = MEMORY[0x263F8EE78];
  uint64_t v19 = &v5[OBJC_IVAR____TtC21SiriInformationSearch10Experience_pluginIdentifier];
  uint64_t v20 = v29;
  *(void *)uint64_t v19 = v28;
  *((void *)v19 + 1) = v20;
  *(double *)&v5[OBJC_IVAR____TtC21SiriInformationSearch10Experience_queryConfidence] = a5;
  v17(&v5[OBJC_IVAR____TtC21SiriInformationSearch10Experience_userDialogAct], (uint64_t)v14, v11);
  *(void *)&v5[OBJC_IVAR____TtC21SiriInformationSearch10Experience_renderOptions] = v26;
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(&v5[OBJC_IVAR____TtC21SiriInformationSearch10Experience_intent], v10, v18);
  unint64_t v21 = (objc_class *)type metadata accessor for Experience(0);
  v33.receiver = v5;
  v33.super_class = v21;
  id v22 = objc_msgSendSuper2(&v33, sel_init);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v18);
  uint64_t v23 = *(void (**)(char *, uint64_t))(v12 + 8);
  v23(v14, v11);
  v23(v32, v11);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v31, v30);
  return v22;
}

id DeviceExpertExperience.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return DeviceExpertExperience.init(coder:)(a1);
}

id DeviceExpertExperience.init(coder:)(void *a1)
{
  uint64_t v3 = type metadata accessor for BinaryDecodingOptions();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v4 = type metadata accessor for Apple_Parsec_Siri_V2alpha_DeviceExpertClientComponent();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for NSData();
  id v8 = v1;
  uint64_t v9 = NSCoder.decodeObject<A>(of:forKey:)();
  if (v9)
  {
    Swift::String v10 = (void *)v9;
    static Data._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v21 = 0;
    long long v19 = 0u;
    long long v20 = 0u;
    BinaryDecodingOptions.init()();
    lazy protocol witness table accessor for type Apple_Parsec_Siri_V2alpha_DeviceExpertClientComponent and conformance Apple_Parsec_Siri_V2alpha_DeviceExpertClientComponent();
    Message.init(serializedData:extensions:partial:options:)();
    (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))((uint64_t)v8 + OBJC_IVAR____TtC20SiriInformationTypes22DeviceExpertExperience_deviceExpertClientComponent, v7, v4);

    id v15 = Experience.init(coder:)(a1);
    id v16 = v15;

    if (v15) {
  }
    }
  else
  {

    if (one-time initialization token for pommes != -1) {
      swift_once();
    }
    uint64_t v11 = type metadata accessor for Logger();
    __swift_project_value_buffer(v11, (uint64_t)static Logger.pommes);
    uint64_t v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_25C8FE000, v12, v13, "DeviceExpertClientComponent cannot be decoded", v14, 2u);
      MEMORY[0x261199590](v14, -1, -1);
    }

    type metadata accessor for DeviceExpertExperience();
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v15;
}

Swift::Void __swiftcall DeviceExpertExperience.encode(with:)(NSCoder with)
{
  type metadata accessor for Apple_Parsec_Siri_V2alpha_DeviceExpertClientComponent();
  lazy protocol witness table accessor for type Apple_Parsec_Siri_V2alpha_DeviceExpertClientComponent and conformance Apple_Parsec_Siri_V2alpha_DeviceExpertClientComponent();
  uint64_t v2 = Message.serializedData(partial:)();
  unint64_t v4 = v3;
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data._Representation(v2, v4);
  uint64_t v6 = (void *)MEMORY[0x261198B80](0xD00000000000001BLL, 0x800000025C983740);
  [(objc_class *)with.super.isa encodeObject:isa forKey:v6];

  Experience.encode(with:)(with);
}

void DeviceExpertExperience.__allocating_init(pluginId:queryConfidence:)()
{
}

void DeviceExpertExperience.init(pluginId:queryConfidence:)()
{
}

void DeviceExpertExperience.__allocating_init(pluginId:queryConfidence:userDialogAct:)()
{
}

void DeviceExpertExperience.init(pluginId:queryConfidence:userDialogAct:)()
{
}

void DeviceExpertExperience.__allocating_init(pluginId:queryConfidence:userDialogAct:renderOptions:)()
{
}

void DeviceExpertExperience.init(pluginId:queryConfidence:userDialogAct:renderOptions:)()
{
}

void DeviceExpertExperience.__allocating_init(pluginId:queryConfidence:userDialogAct:intent:)()
{
}

void DeviceExpertExperience.init(pluginId:queryConfidence:userDialogAct:intent:)()
{
}

void DeviceExpertExperience.__allocating_init(pluginId:queryConfidence:userDialogAct:renderOptions:intent:)()
{
}

void DeviceExpertExperience.init(pluginId:queryConfidence:userDialogAct:renderOptions:intent:)()
{
}

uint64_t DeviceExpertExperience.__ivar_destroyer()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC20SiriInformationTypes22DeviceExpertExperience_deviceExpertClientComponent;
  uint64_t v2 = type metadata accessor for Apple_Parsec_Siri_V2alpha_DeviceExpertClientComponent();
  unint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(v1, v2);
}

id DeviceExpertExperience.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DeviceExpertExperience();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for DeviceExpertExperience()
{
  uint64_t result = type metadata singleton initialization cache for DeviceExpertExperience;
  if (!type metadata singleton initialization cache for DeviceExpertExperience) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Apple_Parsec_Siri_V2alpha_DeviceExpertClientComponent and conformance Apple_Parsec_Siri_V2alpha_DeviceExpertClientComponent()
{
  unint64_t result = lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_DeviceExpertClientComponent and conformance Apple_Parsec_Siri_V2alpha_DeviceExpertClientComponent;
  if (!lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_DeviceExpertClientComponent and conformance Apple_Parsec_Siri_V2alpha_DeviceExpertClientComponent)
  {
    type metadata accessor for Apple_Parsec_Siri_V2alpha_DeviceExpertClientComponent();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_DeviceExpertClientComponent and conformance Apple_Parsec_Siri_V2alpha_DeviceExpertClientComponent);
  }
  return result;
}

uint64_t ObjC metadata update function for DeviceExpertExperience()
{
  return type metadata accessor for DeviceExpertExperience();
}

uint64_t type metadata completion function for DeviceExpertExperience()
{
  uint64_t result = type metadata accessor for Apple_Parsec_Siri_V2alpha_DeviceExpertClientComponent();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for DeviceExpertExperience(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DeviceExpertExperience);
}

uint64_t dispatch thunk of DeviceExpertExperience.__allocating_init(pluginId:deviceExpertClientComponent:queryConfidenceScore:userDialogAct:)()
{
  return (*(uint64_t (**)(void))(v0 + 336))();
}

uint64_t PatternDrivenExperience.components.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PatternDrivenExperience.__allocating_init(_:queryConfidence:)(uint64_t a1, double a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x2611988B0](v7);
  uint64_t v12 = v11;
  uint64_t v13 = Apple_Parsec_Responseframework_PatternDrivenExperience.patternComponents.getter();
  Siri_Nlu_External_UserDialogAct.init()();
  id v14 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for PommesRenderOptions(0)), sel_init);
  uint64_t v15 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *, id, double))(v3 + 336))(v10, v12, v13, v9, v14, a2);
  uint64_t v16 = type metadata accessor for Apple_Parsec_Responseframework_PatternDrivenExperience();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8))(a1, v16);
  return v15;
}

uint64_t PatternDrivenExperience.__allocating_init(pluginIdentifier:components:queryConfidence:)(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v9 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  Siri_Nlu_External_UserDialogAct.init()();
  id v12 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for PommesRenderOptions(0)), sel_init);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *, id, double))(v4 + 336))(a1, a2, a3, v11, v12, a4);
}

uint64_t PatternDrivenExperience.__allocating_init(pluginIdentifier:components:queryConfidence:userDialogAct:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  uint64_t v11 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a4, v11);
  id v15 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for PommesRenderOptions(0)), sel_init);
  uint64_t v16 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *, id, double))(v5 + 336))(a1, a2, a3, v14, v15, a5);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a4, v11);
  return v16;
}

id PatternDrivenExperience.__allocating_init(pluginIdentifier:components:queryConfidence:userDialogAct:renderOptions:)(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, uint64_t a5, double a6)
{
  id v13 = objc_allocWithZone(v6);
  return PatternDrivenExperience.init(pluginIdentifier:components:queryConfidence:userDialogAct:renderOptions:)(a1, a2, a3, a4, a5, a6);
}

id PatternDrivenExperience.init(pluginIdentifier:components:queryConfidence:userDialogAct:renderOptions:)(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, uint64_t a5, double a6)
{
  uint64_t v27 = a2;
  uint64_t v28 = a5;
  uint64_t v26 = a1;
  uint64_t v10 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  id v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v6[OBJC_IVAR____TtC21SiriInformationSearch23PatternDrivenExperience_components] = a3;
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  v18(v17, (uint64_t)a4, v14);
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, *MEMORY[0x263F5CA28], v10);
  *(void *)&v6[OBJC_IVAR____TtC21SiriInformationSearch10Experience_associatedEntities] = MEMORY[0x263F8EE78];
  long long v19 = &v6[OBJC_IVAR____TtC21SiriInformationSearch10Experience_pluginIdentifier];
  uint64_t v20 = v27;
  *(void *)long long v19 = v26;
  *((void *)v19 + 1) = v20;
  *(double *)&v6[OBJC_IVAR____TtC21SiriInformationSearch10Experience_queryConfidence] = a6;
  v18(&v6[OBJC_IVAR____TtC21SiriInformationSearch10Experience_userDialogAct], (uint64_t)v17, v14);
  *(void *)&v6[OBJC_IVAR____TtC21SiriInformationSearch10Experience_renderOptions] = v28;
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(&v6[OBJC_IVAR____TtC21SiriInformationSearch10Experience_intent], v13, v10);
  uint64_t v21 = (objc_class *)type metadata accessor for Experience(0);
  v29.receiver = v6;
  v29.super_class = v21;
  id v22 = objc_msgSendSuper2(&v29, sel_init);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  uint64_t v23 = *(void (**)(char *, uint64_t))(v15 + 8);
  v23(v17, v14);
  v23(a4, v14);
  return v22;
}

id PatternDrivenExperience.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return PatternDrivenExperience.init(coder:)(a1);
}

id PatternDrivenExperience.init(coder:)(void *a1)
{
  uint64_t v4 = type metadata accessor for BinaryDecodingOptions();
  MEMORY[0x270FA5388](v4 - 8);
  Swift::String v38 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for Apple_Parsec_Responseframework_PatternComponent();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  Swift::String v39 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject.Type>);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_25C97F8F0;
  *(void *)(v9 + 32) = type metadata accessor for NSArray(0, &lazy cache variable for type metadata for NSArray);
  *(void *)(v9 + 40) = type metadata accessor for NSArray(0, (unint64_t *)&lazy cache variable for type metadata for NSData);
  uint64_t v10 = v1;
  NSCoder.decodeObject(of:forKey:)();
  swift_bridgeObjectRelease();
  if (*((void *)&v41 + 1))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [NSData]);
    if (swift_dynamicCast())
    {
      Swift::String v34 = v10;
      unint64_t v11 = v43;
      if (v43 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v12 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
        if (v12) {
          goto LABEL_5;
        }
      }
      else
      {
        uint64_t v12 = *(void *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (v12)
        {
LABEL_5:
          objc_super v33 = a1;
          unint64_t v43 = MEMORY[0x263F8EE78];
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v12 & ~(v12 >> 63), 0);
          if ((v12 & 0x8000000000000000) == 0)
          {
            a1 = 0;
            unint64_t v13 = v43;
            uint64_t v35 = v7 + 32;
            unint64_t v36 = v11 & 0xC000000000000001;
            unint64_t v37 = v11;
            while ((void *)v12 != a1)
            {
              if (v36) {
                id v14 = (id)MEMORY[0x261198DD0](a1, v11);
              }
              else {
                id v14 = *(id *)(v11 + 8 * (void)a1 + 32);
              }
              uint64_t v15 = v14;
              static Data._unconditionallyBridgeFromObjectiveC(_:)();
              uint64_t v42 = 0;
              long long v40 = 0u;
              long long v41 = 0u;
              BinaryDecodingOptions.init()();
              lazy protocol witness table accessor for type Apple_Parsec_Responseframework_PatternComponent and conformance Apple_Parsec_Responseframework_PatternComponent();
              Message.init(serializedData:extensions:partial:options:)();

              unint64_t v43 = v13;
              unint64_t v17 = *(void *)(v13 + 16);
              unint64_t v16 = *(void *)(v13 + 24);
              if (v17 >= v16 >> 1)
              {
                specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v16 > 1, v17 + 1, 1);
                unint64_t v13 = v43;
              }
              a1 = (char *)a1 + 1;
              *(void *)(v13 + 16) = v17 + 1;
              (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v13+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(void *)(v7 + 72) * v17, v39, v6);
              unint64_t v11 = v37;
              if ((void *)v12 == a1)
              {
                swift_bridgeObjectRelease();
                a1 = v33;
                goto LABEL_29;
              }
            }
            __break(1u);
            goto LABEL_26;
          }
          __break(1u);
          swift_once();
          uint64_t v23 = type metadata accessor for Logger();
          __swift_project_value_buffer(v23, (uint64_t)static Logger.pommes);
          id v24 = v2;
          id v25 = v2;
          uint64_t v26 = Logger.logObject.getter();
          os_log_type_t v27 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v26, v27))
          {
            uint64_t v28 = (uint8_t *)swift_slowAlloc();
            uint64_t v29 = swift_slowAlloc();
            *(void *)&long long v40 = v29;
            *(_DWORD *)uint64_t v28 = 136315138;
            swift_getErrorValue();
            uint64_t v30 = Error.localizedDescription.getter();
            unint64_t v43 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v30, v31, (uint64_t *)&v40);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease();

            _os_log_impl(&dword_25C8FE000, v26, v27, "PatternExperience.Component failed %s", v28, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x261199590](v29, -1, -1);
            MEMORY[0x261199590](v28, -1, -1);
          }
          else
          {
          }
          a1 = v33;
          return Experience.init(coder:)(a1);
        }
      }
      swift_bridgeObjectRelease();
      unint64_t v13 = MEMORY[0x263F8EE78];
LABEL_29:
      Swift::String v32 = v34;
      *(void *)&v34[OBJC_IVAR____TtC21SiriInformationSearch23PatternDrivenExperience_components] = v13;

      return Experience.init(coder:)(a1);
    }
  }
  else
  {

    outlined destroy of Any?((uint64_t)&v40);
  }
  if (one-time initialization token for pommes != -1) {
LABEL_26:
  }
    swift_once();
  uint64_t v18 = type metadata accessor for Logger();
  __swift_project_value_buffer(v18, (uint64_t)static Logger.pommes);
  long long v19 = Logger.logObject.getter();
  os_log_type_t v20 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v21 = 0;
    _os_log_impl(&dword_25C8FE000, v19, v20, "PatternExperience failed to extract components array", v21, 2u);
    MEMORY[0x261199590](v21, -1, -1);
  }

  type metadata accessor for PatternDrivenExperience();
  swift_deallocPartialClassInstance();
  return 0;
}

Swift::Void __swiftcall PatternDrivenExperience.encode(with:)(NSCoder with)
{
  uint64_t v3 = type metadata accessor for Apple_Parsec_Responseframework_PatternComponent();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(v1 + OBJC_IVAR____TtC21SiriInformationSearch23PatternDrivenExperience_components);
  uint64_t v8 = *(void *)(v7 + 16);
  if (v8)
  {
    Class isa = with.super.isa;
    uint64_t v25 = v1;
    uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
    uint64_t v9 = v4 + 16;
    uint64_t v11 = v7 + ((*(unsigned __int8 *)(v9 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 64));
    uint64_t v30 = (void (**)(char *, uint64_t))(v9 - 8);
    unint64_t v31 = v10;
    uint64_t v29 = *(void *)(v9 + 56);
    uint64_t v23 = v7;
    swift_bridgeObjectRetain_n();
    uint64_t v12 = (void *)MEMORY[0x263F8EE78];
    *(void *)&long long v13 = 136315138;
    long long v27 = v13;
    uint64_t v26 = MEMORY[0x263F8EE58] + 8;
    uint64_t v28 = v9;
    do
    {
      v31(v6, v11, v3);
      lazy protocol witness table accessor for type Apple_Parsec_Responseframework_PatternComponent and conformance Apple_Parsec_Responseframework_PatternComponent();
      uint64_t v14 = Message.serializedData(partial:)();
      uint64_t v16 = v15;
      (*v30)(v6, v3);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v12 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v12[2] + 1, 1, v12);
      }
      unint64_t v18 = v12[2];
      unint64_t v17 = v12[3];
      long long v19 = v12;
      if (v18 >= v17 >> 1) {
        long long v19 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v17 > 1), v18 + 1, 1, v12);
      }
      v19[2] = v18 + 1;
      uint64_t v12 = v19;
      os_log_type_t v20 = &v19[2 * v18];
      v20[4] = v14;
      v20[5] = v16;
      v11 += v29;
      --v8;
    }
    while (v8);
    swift_bridgeObjectRelease_n();
    with.super.Class isa = isa;
  }
  Class v21 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v22 = (void *)MEMORY[0x261198B80](0x6E656E6F706D6F63, 0xEA00000000007374);
  [(objc_class *)with.super.isa encodeObject:v21 forKey:v22];

  Experience.encode(with:)(with);
}

void PatternDrivenExperience.__allocating_init(pluginId:queryConfidence:)()
{
}

void PatternDrivenExperience.init(pluginId:queryConfidence:)()
{
}

void PatternDrivenExperience.__allocating_init(pluginId:queryConfidence:userDialogAct:)()
{
}

void PatternDrivenExperience.init(pluginId:queryConfidence:userDialogAct:)()
{
}

void PatternDrivenExperience.__allocating_init(pluginId:queryConfidence:userDialogAct:renderOptions:)()
{
}

void PatternDrivenExperience.init(pluginId:queryConfidence:userDialogAct:renderOptions:)()
{
}

void PatternDrivenExperience.__allocating_init(pluginId:queryConfidence:userDialogAct:intent:)()
{
}

void PatternDrivenExperience.init(pluginId:queryConfidence:userDialogAct:intent:)()
{
}

void PatternDrivenExperience.__allocating_init(pluginId:queryConfidence:userDialogAct:renderOptions:intent:)()
{
}

void PatternDrivenExperience.init(pluginId:queryConfidence:userDialogAct:renderOptions:intent:)()
{
}

uint64_t PatternDrivenExperience.__ivar_destroyer()
{
  return swift_bridgeObjectRelease();
}

id PatternDrivenExperience.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PatternDrivenExperience();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for PatternDrivenExperience()
{
  uint64_t result = type metadata singleton initialization cache for PatternDrivenExperience;
  if (!type metadata singleton initialization cache for PatternDrivenExperience) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Apple_Parsec_Responseframework_PatternComponent and conformance Apple_Parsec_Responseframework_PatternComponent()
{
  unint64_t result = lazy protocol witness table cache variable for type Apple_Parsec_Responseframework_PatternComponent and conformance Apple_Parsec_Responseframework_PatternComponent;
  if (!lazy protocol witness table cache variable for type Apple_Parsec_Responseframework_PatternComponent and conformance Apple_Parsec_Responseframework_PatternComponent)
  {
    type metadata accessor for Apple_Parsec_Responseframework_PatternComponent();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Apple_Parsec_Responseframework_PatternComponent and conformance Apple_Parsec_Responseframework_PatternComponent);
  }
  return result;
}

uint64_t ObjC metadata update function for PatternDrivenExperience()
{
  return type metadata accessor for PatternDrivenExperience();
}

uint64_t type metadata completion function for PatternDrivenExperience()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for PatternDrivenExperience(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PatternDrivenExperience);
}

uint64_t dispatch thunk of PatternDrivenExperience.__allocating_init(pluginIdentifier:components:queryConfidence:userDialogAct:renderOptions:)()
{
  return (*(uint64_t (**)(void))(v0 + 336))();
}

uint64_t Logger.pommes.unsafeMutableAddressor()
{
  return Logger.pommes.unsafeMutableAddressor(&one-time initialization token for pommes, (uint64_t)static Logger.pommes);
}

uint64_t Logger.overrides.unsafeMutableAddressor()
{
  return Logger.pommes.unsafeMutableAddressor(&one-time initialization token for overrides, (uint64_t)static Logger.overrides);
}

uint64_t Logger.music.unsafeMutableAddressor()
{
  return Logger.pommes.unsafeMutableAddressor(&one-time initialization token for music, (uint64_t)static Logger.music);
}

uint64_t Logger.pommes.unsafeMutableAddressor(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();

  return __swift_project_value_buffer(v3, a2);
}

uint64_t one-time initialization function for pommes()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Logger.pommes);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.pommes);
  if (one-time initialization token for pommes != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  return Logger.init(subsystem:category:)();
}

void *LogConstants.subsystem.unsafeMutableAddressor()
{
  return &static LogConstants.subsystem;
}

uint64_t *LogConstants.Category.pommes.unsafeMutableAddressor()
{
  if (one-time initialization token for pommes != -1) {
    swift_once();
  }
  return &static LogConstants.Category.pommes;
}

uint64_t static Logger.pommes.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.pommes.getter(&one-time initialization token for pommes, (uint64_t)static Logger.pommes, a1);
}

uint64_t one-time initialization function for music()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Logger.music);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.music);
  if (one-time initialization token for music != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  return Logger.init(subsystem:category:)();
}

uint64_t *LogConstants.Category.music.unsafeMutableAddressor()
{
  if (one-time initialization token for music != -1) {
    swift_once();
  }
  return &static LogConstants.Category.music;
}

uint64_t static Logger.music.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.pommes.getter(&one-time initialization token for music, (uint64_t)static Logger.music, a1);
}

uint64_t one-time initialization function for overrides()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Logger.overrides);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.overrides);
  if (one-time initialization token for overrides != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  return Logger.init(subsystem:category:)();
}

uint64_t *LogConstants.Category.overrides.unsafeMutableAddressor()
{
  if (one-time initialization token for overrides != -1) {
    swift_once();
  }
  return &static LogConstants.Category.overrides;
}

uint64_t static Logger.overrides.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.pommes.getter(&one-time initialization token for overrides, (uint64_t)static Logger.overrides, a1);
}

uint64_t static Logger.pommes.getter@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v7(a3, v6, v5);
}

unint64_t static LogConstants.subsystem.getter()
{
  return 0xD000000000000010;
}

void one-time initialization function for pommes()
{
  static LogConstants.Category.pommes = 0x73656D6D6F70;
  *(void *)algn_26B3575A8 = 0xE600000000000000;
}

uint64_t static LogConstants.Category.pommes.getter()
{
  return static LogConstants.Category.pommes.getter(&one-time initialization token for pommes, &static LogConstants.Category.pommes);
}

void one-time initialization function for music()
{
  static LogConstants.Category.music = 0x636973756DLL;
  *(void *)algn_26A5DDD08 = 0xE500000000000000;
}

uint64_t static LogConstants.Category.music.getter()
{
  return static LogConstants.Category.pommes.getter(&one-time initialization token for music, &static LogConstants.Category.music);
}

void one-time initialization function for overrides()
{
  static LogConstants.Category.overrides = 0x656469727265766FLL;
  *(void *)algn_26A5DDD18 = 0xE900000000000073;
}

uint64_t static LogConstants.Category.overrides.getter()
{
  return static LogConstants.Category.pommes.getter(&one-time initialization token for overrides, &static LogConstants.Category.overrides);
}

uint64_t static LogConstants.Category.pommes.getter(void *a1, uint64_t *a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = *a2;
  swift_bridgeObjectRetain();
  return v3;
}

ValueMetadata *type metadata accessor for Logger()
{
  return &type metadata for Logger;
}

ValueMetadata *type metadata accessor for LogConstants()
{
  return &type metadata for LogConstants;
}

ValueMetadata *type metadata accessor for LogConstants.Category()
{
  return &type metadata for LogConstants.Category;
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

unint64_t PommesContext.Source.CodingKeys.stringValue.getter(char a1)
{
  unint64_t result = 0xD000000000000012;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x65446E6967756C70;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 0x6E776F6E6B6E75;
      break;
    default:
      unint64_t result = 0x5273757361676570;
      break;
  }
  return result;
}

unint64_t protocol witness for CodingKey.stringValue.getter in conformance PommesContext.Source.CodingKeys()
{
  return PommesContext.Source.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance PommesContext.Source.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized PommesContext.Source.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance PommesContext.Source.CodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance PommesContext.Source.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type PommesContext.Source.CodingKeys and conformance PommesContext.Source.CodingKeys();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance PommesContext.Source.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type PommesContext.Source.CodingKeys and conformance PommesContext.Source.CodingKeys();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance PommesContext.Source.ModalityTranslatedCodingKeys()
{
  return 0;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance PommesContext.Source.ModalityTranslatedCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type PommesContext.Source.ModalityTranslatedCodingKeys and conformance PommesContext.Source.ModalityTranslatedCodingKeys();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance PommesContext.Source.ModalityTranslatedCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type PommesContext.Source.ModalityTranslatedCodingKeys and conformance PommesContext.Source.ModalityTranslatedCodingKeys();

  return MEMORY[0x270FA00B8](a1, v2);
}

unint64_t protocol witness for CodingKey.stringValue.getter in conformance PommesContext.Source.PegasusResponseCodingKeys()
{
  return 0xD000000000000013;
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance PommesContext.Source.PegasusResponseCodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized PommesContext.Source.PegasusResponseCodingKeys.init(stringValue:)(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance PommesContext.Source.PegasusResponseCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type PommesContext.Source.PegasusResponseCodingKeys and conformance PommesContext.Source.PegasusResponseCodingKeys();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance PommesContext.Source.PegasusResponseCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type PommesContext.Source.PegasusResponseCodingKeys and conformance PommesContext.Source.PegasusResponseCodingKeys();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance PommesContext.Source.PluginDefinedCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type PommesContext.Source.PluginDefinedCodingKeys and conformance PommesContext.Source.PluginDefinedCodingKeys();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance PommesContext.Source.PluginDefinedCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type PommesContext.Source.PluginDefinedCodingKeys and conformance PommesContext.Source.PluginDefinedCodingKeys();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance PommesContext.Source.UnknownCodingKeys@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance PommesContext.Source.UnknownCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type PommesContext.Source.UnknownCodingKeys and conformance PommesContext.Source.UnknownCodingKeys();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance PommesContext.Source.UnknownCodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type PommesContext.Source.UnknownCodingKeys and conformance PommesContext.Source.UnknownCodingKeys();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t PommesContext.Source.encode(to:)(void *a1)
{
  unint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<PommesContext.Source.UnknownCodingKeys>);
  uint64_t v33 = *(void *)(v4 - 8);
  uint64_t v34 = v4;
  MEMORY[0x270FA5388](v4);
  Swift::String v32 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<PommesContext.Source.ModalityTranslatedCodingKeys>);
  uint64_t v30 = *(void *)(v6 - 8);
  uint64_t v31 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v28 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<PommesContext.Source.PluginDefinedCodingKeys>);
  uint64_t v25 = *(void *)(v8 - 8);
  uint64_t v26 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<PommesContext.Source.PegasusResponseCodingKeys>);
  uint64_t v27 = *(void *)(v29 - 8);
  MEMORY[0x270FA5388](v29);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<PommesContext.Source.CodingKeys>);
  uint64_t v35 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = *v2;
  unint64_t v16 = v2[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type PommesContext.Source.CodingKeys and conformance PommesContext.Source.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  unint64_t v18 = v16 >> 60;
  if (v16 >> 60 == 3)
  {
    LOBYTE(v36) = v16 >> 60;
    lazy protocol witness table accessor for type PommesContext.Source.UnknownCodingKeys and conformance PommesContext.Source.UnknownCodingKeys();
    os_log_type_t v20 = v32;
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    uint64_t v22 = v33;
    uint64_t v21 = v34;
LABEL_7:
    (*(void (**)(char *, uint64_t))(v22 + 8))(v20, v21);
    return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v15, v13);
  }
  if (v18 == 7)
  {
    LOBYTE(v36) = 2;
    lazy protocol witness table accessor for type PommesContext.Source.ModalityTranslatedCodingKeys and conformance PommesContext.Source.ModalityTranslatedCodingKeys();
    os_log_type_t v20 = v28;
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    uint64_t v22 = v30;
    uint64_t v21 = v31;
    goto LABEL_7;
  }
  if (v18 == 11)
  {
    LOBYTE(v36) = 1;
    lazy protocol witness table accessor for type PommesContext.Source.PluginDefinedCodingKeys and conformance PommesContext.Source.PluginDefinedCodingKeys();
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v10, v26);
    return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v15, v13);
  }
  else
  {
    LOBYTE(v36) = 0;
    outlined copy of Data?(v17, v16);
    lazy protocol witness table accessor for type PommesContext.Source.PegasusResponseCodingKeys and conformance PommesContext.Source.PegasusResponseCodingKeys();
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    uint64_t v36 = v17;
    unint64_t v37 = v16;
    lazy protocol witness table accessor for type Data and conformance Data();
    uint64_t v23 = v29;
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v12, v23);
    (*(void (**)(char *, uint64_t))(v35 + 8))(v15, v13);
    return outlined consume of PommesContext.Source(v17, v16);
  }
}

uint64_t PommesContext.Source.init(from:)@<X0>(void *a1@<X0>, long long *a2@<X8>)
{
  uint64_t v36 = a2;
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<PommesContext.Source.UnknownCodingKeys>);
  uint64_t v33 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  Swift::String v38 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<PommesContext.Source.ModalityTranslatedCodingKeys>);
  uint64_t v29 = *(void *)(v34 - 8);
  MEMORY[0x270FA5388](v34);
  unint64_t v37 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<PommesContext.Source.PluginDefinedCodingKeys>);
  uint64_t v31 = *(void *)(v5 - 8);
  uint64_t v32 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<PommesContext.Source.PegasusResponseCodingKeys>);
  uint64_t v30 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<PommesContext.Source.CodingKeys>);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = a1[3];
  Swift::String v39 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v15);
  lazy protocol witness table accessor for type PommesContext.Source.CodingKeys and conformance PommesContext.Source.CodingKeys();
  uint64_t v16 = v41;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v16) {
    goto LABEL_9;
  }
  uint64_t v17 = v10;
  uint64_t v28 = v8;
  long long v19 = v37;
  unint64_t v18 = v38;
  uint64_t v41 = v12;
  uint64_t v20 = KeyedDecodingContainer.allKeys.getter();
  if (*(void *)(v20 + 16) != 1)
  {
    uint64_t v23 = type metadata accessor for DecodingError();
    swift_allocError();
    uint64_t v25 = v24;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (@thick Any.Type, DecodingError.Context));
    *uint64_t v25 = &type metadata for PommesContext.Source;
    KeyedDecodingContainer.codingPath.getter();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v23 - 8) + 104))(v25, *MEMORY[0x263F8DCB0], v23);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v14, v11);
LABEL_9:
    uint64_t v26 = (uint64_t)v39;
    return __swift_destroy_boxed_opaque_existential_1(v26);
  }
  switch(*(unsigned char *)(v20 + 32))
  {
    case 1:
      LOBYTE(v40) = 1;
      lazy protocol witness table accessor for type PommesContext.Source.PluginDefinedCodingKeys and conformance PommesContext.Source.PluginDefinedCodingKeys();
      KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      (*(void (**)(char *, uint64_t))(v31 + 8))(v7, v32);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v41 + 8))(v14, v11);
      long long v22 = xmmword_25C980900;
      break;
    case 2:
      LOBYTE(v40) = 2;
      lazy protocol witness table accessor for type PommesContext.Source.ModalityTranslatedCodingKeys and conformance PommesContext.Source.ModalityTranslatedCodingKeys();
      KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      (*(void (**)(char *, uint64_t))(v29 + 8))(v19, v34);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v41 + 8))(v14, v11);
      long long v22 = xmmword_25C9808F0;
      break;
    case 3:
      LOBYTE(v40) = 3;
      lazy protocol witness table accessor for type PommesContext.Source.UnknownCodingKeys and conformance PommesContext.Source.UnknownCodingKeys();
      KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      (*(void (**)(char *, uint64_t))(v33 + 8))(v18, v35);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v41 + 8))(v14, v11);
      long long v22 = xmmword_25C9808E0;
      break;
    default:
      LOBYTE(v40) = 0;
      lazy protocol witness table accessor for type PommesContext.Source.PegasusResponseCodingKeys and conformance PommesContext.Source.PegasusResponseCodingKeys();
      KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
      lazy protocol witness table accessor for type Data and conformance Data();
      uint64_t v21 = v28;
      KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
      (*(void (**)(char *, uint64_t))(v30 + 8))(v17, v21);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v41 + 8))(v14, v11);
      long long v22 = v40;
      break;
  }
  uint64_t v26 = (uint64_t)v39;
  *uint64_t v36 = v22;
  return __swift_destroy_boxed_opaque_existential_1(v26);
}

uint64_t protocol witness for Decodable.init(from:) in conformance PommesContext.Source@<X0>(void *a1@<X0>, long long *a2@<X8>)
{
  return PommesContext.Source.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance PommesContext.Source(void *a1)
{
  return PommesContext.Source.encode(to:)(a1);
}

uint64_t PommesContext.init(source:domain:listenAfterSpeaking:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  uint64_t v9 = *a1;
  uint64_t v10 = a1[1];
  uint64_t v11 = (int *)type metadata accessor for PommesContext();
  uint64_t v12 = a5 + v11[7];
  uint64_t v13 = *MEMORY[0x263F5CA28];
  uint64_t v14 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 104))(v12, v13, v14);
  uint64_t v15 = MEMORY[0x263F8EE78];
  *(void *)(a5 + v11[8]) = MEMORY[0x263F8EE78];
  *(void *)(a5 + v11[9]) = v15;
  uint64_t v16 = a5 + v11[10];
  uint64_t v17 = type metadata accessor for Com_Apple_Siri_Product_Proto_PromptContext();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v16, 1, 1, v17);
  *(void *)a5 = v9;
  *(void *)(a5 + 8) = v10;
  *(void *)(a5 + 16) = a2;
  *(void *)(a5 + 24) = a3;
  *(unsigned char *)(a5 + 32) = a4;
  return result;
}

uint64_t PommesContext.init(pegasusConversationContext:domain:listenAfterSpeaking:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X8>)
{
  if (a2 >> 60 == 15) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = a1;
  }
  if (a2 >> 60 == 15) {
    uint64_t v11 = 0x3000000000000000;
  }
  else {
    uint64_t v11 = a2;
  }
  uint64_t v12 = (int *)type metadata accessor for PommesContext();
  uint64_t v13 = a6 + v12[7];
  uint64_t v14 = *MEMORY[0x263F5CA28];
  uint64_t v15 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 104))(v13, v14, v15);
  uint64_t v16 = MEMORY[0x263F8EE78];
  *(void *)(a6 + v12[8]) = MEMORY[0x263F8EE78];
  *(void *)(a6 + v12[9]) = v16;
  uint64_t v17 = a6 + v12[10];
  uint64_t v18 = type metadata accessor for Com_Apple_Siri_Product_Proto_PromptContext();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v17, 1, 1, v18);
  *(void *)a6 = v10;
  *(void *)(a6 + 8) = v11;
  *(void *)(a6 + 16) = a3;
  *(void *)(a6 + 24) = a4;
  *(unsigned char *)(a6 + 32) = a5;
  return result;
}

uint64_t PommesContext.init(pegasusConversationContext:legacyNLContext:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_LegacyNLContext?);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v29 - v11;
  outlined init with copy of Apple_Parsec_Siri_V2alpha_MultiUserContext?(a3, (uint64_t)&v29 - v11, &demangling cache variable for type metadata for Siri_Nlu_External_LegacyNLContext?);
  uint64_t v13 = type metadata accessor for Siri_Nlu_External_LegacyNLContext();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
  if (v15(v12, 1, v13) == 1)
  {
    outlined destroy of ClientExperienceSignals?((uint64_t)v12, &demangling cache variable for type metadata for Siri_Nlu_External_LegacyNLContext?);
    uint64_t v29 = 0;
    uint64_t v16 = 0;
  }
  else
  {
    uint64_t v29 = Siri_Nlu_External_LegacyNLContext.previousDomainName.getter();
    uint64_t v16 = v17;
    (*(void (**)(char *, uint64_t))(v14 + 8))(v12, v13);
  }
  outlined init with copy of Apple_Parsec_Siri_V2alpha_MultiUserContext?(a3, (uint64_t)v10, &demangling cache variable for type metadata for Siri_Nlu_External_LegacyNLContext?);
  if (v15(v10, 1, v13) == 1)
  {
    outlined destroy of ClientExperienceSignals?((uint64_t)v10, &demangling cache variable for type metadata for Siri_Nlu_External_LegacyNLContext?);
    char v18 = 0;
  }
  else
  {
    char v18 = Siri_Nlu_External_LegacyNLContext.listenAfterSpeaking.getter();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v10, v13);
  }
  if (a2 >> 60 == 15) {
    uint64_t v19 = 0;
  }
  else {
    uint64_t v19 = v30;
  }
  if (a2 >> 60 == 15) {
    uint64_t v20 = 0x3000000000000000;
  }
  else {
    uint64_t v20 = a2;
  }
  uint64_t v21 = (int *)type metadata accessor for PommesContext();
  uint64_t v22 = a4 + v21[7];
  uint64_t v23 = *MEMORY[0x263F5CA28];
  uint64_t v24 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 104))(v22, v23, v24);
  uint64_t v25 = MEMORY[0x263F8EE78];
  *(void *)(a4 + v21[8]) = MEMORY[0x263F8EE78];
  *(void *)(a4 + v21[9]) = v25;
  uint64_t v26 = a4 + v21[10];
  uint64_t v27 = type metadata accessor for Com_Apple_Siri_Product_Proto_PromptContext();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v26, 1, 1, v27);
  *(void *)a4 = v19;
  *(void *)(a4 + 8) = v20;
  *(void *)(a4 + 16) = v29;
  *(void *)(a4 + 24) = v16;
  *(unsigned char *)(a4 + 32) = v18 & 1;
  PommesContext.addRenderedTexts(from:)(a3);
  return outlined destroy of ClientExperienceSignals?(a3, &demangling cache variable for type metadata for Siri_Nlu_External_LegacyNLContext?);
}

uint64_t PommesContext.addRenderedTexts(from:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v32 = type metadata accessor for Google_Protobuf_StringValue();
  uint64_t v4 = *(void *)(v32 - 8);
  MEMORY[0x270FA5388](v32);
  uint64_t v6 = (char *)v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_LegacyNLContext?);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of Apple_Parsec_Siri_V2alpha_MultiUserContext?(a1, (uint64_t)v9, &demangling cache variable for type metadata for Siri_Nlu_External_LegacyNLContext?);
  uint64_t v10 = type metadata accessor for Siri_Nlu_External_LegacyNLContext();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    outlined destroy of ClientExperienceSignals?((uint64_t)v9, &demangling cache variable for type metadata for Siri_Nlu_External_LegacyNLContext?);
LABEL_12:
    uint64_t v23 = MEMORY[0x263F8EE78];
    goto LABEL_13;
  }
  uint64_t v12 = MEMORY[0x261198950]();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v9, v10);
  int64_t v13 = *(void *)(v12 + 16);
  if (!v13)
  {
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  v28[2] = v2;
  uint64_t v33 = MEMORY[0x263F8EE78];
  specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v13, 0);
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  uint64_t v14 = v4 + 16;
  uint64_t v16 = *(unsigned __int8 *)(v14 + 64);
  v28[1] = v12;
  uint64_t v17 = v12 + ((v16 + 32) & ~v16);
  uint64_t v29 = *(void *)(v14 + 56);
  uint64_t v30 = v15;
  uint64_t v31 = v14;
  char v18 = (void (**)(char *, uint64_t))(v14 - 8);
  do
  {
    uint64_t v19 = v32;
    v30(v6, v17, v32);
    uint64_t v20 = Google_Protobuf_StringValue.value.getter();
    uint64_t v22 = v21;
    (*v18)(v6, v19);
    uint64_t v23 = v33;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v23 + 16) + 1, 1);
      uint64_t v23 = v33;
    }
    unint64_t v25 = *(void *)(v23 + 16);
    unint64_t v24 = *(void *)(v23 + 24);
    if (v25 >= v24 >> 1)
    {
      specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v24 > 1, v25 + 1, 1);
      uint64_t v23 = v33;
    }
    *(void *)(v23 + 16) = v25 + 1;
    uint64_t v26 = v23 + 16 * v25;
    *(void *)(v26 + 32) = v20;
    *(void *)(v26 + 40) = v22;
    v17 += v29;
    --v13;
  }
  while (v13);
  swift_bridgeObjectRelease();
LABEL_13:
  type metadata accessor for PommesContext();
  return specialized Array.append<A>(contentsOf:)(v23);
}

uint64_t PommesContext.source.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = *v1;
  unint64_t v3 = v1[1];
  *a1 = *v1;
  a1[1] = v3;
  return outlined copy of PommesContext.Source(v2, v3);
}

uint64_t PommesContext.domain.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PommesContext.listenAfterSpeaking.getter()
{
  return *(unsigned __int8 *)(v0 + 32);
}

uint64_t PommesContext.pegasusConversationContext.getter()
{
  unint64_t v1 = v0[1];
  if ((v1 >> 60) <= 0xB && ((1 << (v1 >> 60)) & 0x888) != 0) {
    return 0;
  }
  uint64_t v3 = *v0;
  outlined copy of Data?(v3, v1);
  return v3;
}

uint64_t PommesContext.instructionIntent.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for PommesContext() + 28);
  uint64_t v4 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t PommesContext.instructionIntent.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for PommesContext() + 28);
  uint64_t v4 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);

  return v5(v3, a1, v4);
}

uint64_t (*PommesContext.instructionIntent.modify())()
{
  return destructiveProjectEnumData for UserPromptExperience.PromptType;
}

BOOL PommesContext.isConfirmation.getter()
{
  uint64_t v0 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for PommesContext();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F5CA30], v0);
  lazy protocol witness table accessor for type Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent and conformance Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent(&lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent and conformance Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent, MEMORY[0x263F5CA38]);
  dispatch thunk of RawRepresentable.rawValue.getter();
  dispatch thunk of RawRepresentable.rawValue.getter();
  BOOL v4 = v6[1] == v6[0];
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

uint64_t PommesContext.renderedTexts.getter()
{
  type metadata accessor for PommesContext();

  return swift_bridgeObjectRetain();
}

uint64_t PommesContext.redactedRenderedTexts.getter()
{
  type metadata accessor for PommesContext();

  return swift_bridgeObjectRetain();
}

Swift::Int __swiftcall PommesContext.contextSize()()
{
  unint64_t v1 = *(void *)(v0 + 8);
  BOOL v2 = (v1 >> 60) > 0xB || ((1 << (v1 >> 60)) & 0x888) == 0;
  if (!v2 || v1 >> 60 == 15) {
    return 0;
  }
  Swift::Int result = *(void *)v0;
  switch(v1 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(result), result))
      {
        __break(1u);
        JUMPOUT(0x25C9375D4);
      }
      Swift::Int result = HIDWORD(result) - (int)result;
      break;
    case 2uLL:
      uint64_t v5 = *(void *)(result + 16);
      uint64_t v4 = *(void *)(result + 24);
      Swift::Int result = v4 - v5;
      if (__OFSUB__(v4, v5))
      {
        __break(1u);
        goto LABEL_15;
      }
      break;
    case 3uLL:
LABEL_15:
      outlined consume of PommesContext.Source(result, v1);
      return 0;
    default:
      outlined consume of PommesContext.Source(result, *(void *)(v0 + 8));
      Swift::Int result = BYTE6(v1);
      break;
  }
  return result;
}

Swift::Void __swiftcall PommesContext.addRenderedTexts(_:)(Swift::OpaquePointer a1)
{
  type metadata accessor for PommesContext();
  uint64_t v1 = swift_bridgeObjectRetain();
  specialized Array.append<A>(contentsOf:)(v1);
}

Swift::Void __swiftcall PommesContext.addRedactedRenderedTexts(_:)(Swift::OpaquePointer a1)
{
  type metadata accessor for PommesContext();
  uint64_t v1 = swift_bridgeObjectRetain();
  specialized Array.append<A>(contentsOf:)(v1);
}

Swift::Bool __swiftcall PommesContext.isWithinMaxSize()()
{
  unint64_t v1 = v0[1];
  if ((v1 >> 60) <= 0xB && ((1 << (v1 >> 60)) & 0x888) != 0 || v1 >> 60 == 15) {
    return 1;
  }
  uint64_t v5 = *v0;
  switch(v1 >> 62)
  {
    case 1uLL:
      LODWORD(v6) = HIDWORD(v5) - v5;
      if (__OFSUB__(HIDWORD(v5), v5))
      {
        __break(1u);
LABEL_18:
        __break(1u);
        JUMPOUT(0x25C937708);
      }
      uint64_t v6 = (int)v6;
LABEL_15:
      if (v6 <= 0x10000) {
        return 1;
      }
      Swift::Bool result = 0;
      break;
    case 2uLL:
      uint64_t v8 = *(void *)(v5 + 16);
      uint64_t v7 = *(void *)(v5 + 24);
      BOOL v9 = __OFSUB__(v7, v8);
      uint64_t v6 = v7 - v8;
      if (!v9) {
        goto LABEL_15;
      }
      goto LABEL_18;
    default:
      outlined consume of PommesContext.Source(v5, v1);
      return 1;
  }
  return result;
}

uint64_t PommesContext.description.getter()
{
  _StringGuts.grow(_:)(125);
  v1._uint64_t countAndFlagsBits = 0x203A656372756F73;
  v1._object = (void *)0xE800000000000000;
  String.append(_:)(v1);
  uint64_t v2 = *(void *)v0;
  unint64_t v3 = *(void *)(v0 + 8);
  outlined copy of PommesContext.Source(*(void *)v0, v3);
  v4._uint64_t countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  v5._uint64_t countAndFlagsBits = 0x6E69616D6F640A2CLL;
  v5._object = (void *)0xEA0000000000203ALL;
  String.append(_:)(v5);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for String?);
  v6._uint64_t countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v6);
  swift_bridgeObjectRelease();
  v7._uint64_t countAndFlagsBits = 0xD00000000000001ELL;
  v7._object = (void *)0x800000025C983840;
  String.append(_:)(v7);
  if ((v3 >> 60) > 0xB || ((1 << (v3 >> 60)) & 0x888) == 0) {
    outlined copy of Data?(v2, v3);
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Data?);
  v8._uint64_t countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v8);
  swift_bridgeObjectRelease();
  v9._uint64_t countAndFlagsBits = 0xD000000000000017;
  v9._object = (void *)0x800000025C983860;
  String.append(_:)(v9);
  if (*(unsigned char *)(v0 + 32)) {
    uint64_t v10 = 1702195828;
  }
  else {
    uint64_t v10 = 0x65736C6166;
  }
  if (*(unsigned char *)(v0 + 32)) {
    unint64_t v11 = 0xE400000000000000;
  }
  else {
    unint64_t v11 = 0xE500000000000000;
  }
  unint64_t v12 = v11;
  String.append(_:)(*(Swift::String *)&v10);
  swift_bridgeObjectRelease();
  v13._object = (void *)0x800000025C983880;
  v13._uint64_t countAndFlagsBits = 0xD000000000000011;
  String.append(_:)(v13);
  type metadata accessor for PommesContext();
  uint64_t v14 = swift_bridgeObjectRetain();
  uint64_t v15 = MEMORY[0x263F8D310];
  uint64_t v16 = MEMORY[0x261198C90](v14, MEMORY[0x263F8D310]);
  char v18 = v17;
  swift_bridgeObjectRelease();
  v19._uint64_t countAndFlagsBits = v16;
  v19._object = v18;
  String.append(_:)(v19);
  swift_bridgeObjectRelease();
  v20._uint64_t countAndFlagsBits = 0xD000000000000019;
  v20._object = (void *)0x800000025C9838A0;
  String.append(_:)(v20);
  uint64_t v21 = swift_bridgeObjectRetain();
  uint64_t v22 = MEMORY[0x261198C90](v21, v15);
  unint64_t v24 = v23;
  swift_bridgeObjectRelease();
  v25._uint64_t countAndFlagsBits = v22;
  v25._object = v24;
  String.append(_:)(v25);
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t PommesContext.exportLegacyNLContext()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for Google_Protobuf_StringValue();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  Swift::String v6 = (char *)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for Siri_Nlu_External_LegacyNLContext.LegacyContextSource();
  uint64_t v58 = *(void *)(v11 - 8);
  uint64_t v59 = v11;
  MEMORY[0x270FA5388](v11);
  Swift::String v57 = (char *)&v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for Siri_Nlu_External_LegacyNLContext();
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v49 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = *(void *)(v1 + 24);
  if (v18)
  {
    uint64_t v19 = v1;
    uint64_t v55 = v8;
    uint64_t v56 = v14;
    unint64_t v54 = v10;
    uint64_t v60 = v15;
    uint64_t v20 = *(void *)(v1 + 16);
    uint64_t v21 = v19;
    Siri_Nlu_External_LegacyNLContext.init()();
    PommesContext.convertPegasusDomainToLegacyNLDomain(pegasusDomain:)(v20, v18);
    Siri_Nlu_External_LegacyNLContext.previousDomainName.setter();
    Siri_Nlu_External_LegacyNLContext.listenAfterSpeaking.setter();
    Siri_Nlu_External_LegacyNLContext.strictPrompt.setter();
    Siri_Nlu_External_LegacyNLContext.dictationPrompt.setter();
    uint64_t v52 = type metadata accessor for PommesContext();
    uint64_t v53 = v21;
    uint64_t v22 = *(void *)(v21 + *(int *)(v52 + 32));
    int64_t v23 = *(void *)(v22 + 16);
    uint64_t v24 = MEMORY[0x263F8EE78];
    if (v23)
    {
      uint64_t v49 = v7;
      uint64_t v50 = v17;
      uint64_t v51 = a1;
      uint64_t v61 = MEMORY[0x263F8EE78];
      swift_bridgeObjectRetain();
      specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v23, 0);
      uint64_t v24 = v61;
      uint64_t v25 = v22 + 40;
      do
      {
        swift_bridgeObjectRetain();
        Google_Protobuf_StringValue.init(_:)();
        uint64_t v61 = v24;
        unint64_t v27 = *(void *)(v24 + 16);
        unint64_t v26 = *(void *)(v24 + 24);
        if (v27 >= v26 >> 1)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v26 > 1, v27 + 1, 1);
          uint64_t v24 = v61;
        }
        v25 += 16;
        *(void *)(v24 + 16) = v27 + 1;
        (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v24+ ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))+ *(void *)(v4 + 72) * v27, v6, v3);
        --v23;
      }
      while (v23);
      swift_bridgeObjectRelease();
      uint64_t v17 = v50;
      uint64_t v28 = v51;
      uint64_t v29 = v56;
      uint64_t v7 = v49;
    }
    else
    {
      uint64_t v28 = a1;
      uint64_t v29 = v56;
    }
    MEMORY[0x261198960](v24);
    (*(void (**)(char *, void, uint64_t))(v58 + 104))(v57, *MEMORY[0x263F71630], v59);
    Siri_Nlu_External_LegacyNLContext.legacyContextSource.setter();
    uint64_t v33 = v54;
    uint64_t v32 = v55;
    (*(void (**)(char *, void, uint64_t))(v55 + 104))(v54, *MEMORY[0x263F5CA30], v7);
    lazy protocol witness table accessor for type Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent and conformance Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent(&lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent and conformance Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent, MEMORY[0x263F5CA38]);
    dispatch thunk of RawRepresentable.rawValue.getter();
    dispatch thunk of RawRepresentable.rawValue.getter();
    uint64_t v34 = v61;
    uint64_t v35 = v62;
    (*(void (**)(char *, uint64_t))(v32 + 8))(v33, v7);
    if (v34 == v35)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
      uint64_t v36 = swift_allocObject();
      *(_OWORD *)(v36 + 16) = xmmword_25C97F8F0;
      *(void *)(v36 + 32) = 5457241;
      *(void *)(v36 + 40) = 0xE300000000000000;
      *(void *)(v36 + 48) = 20302;
      *(void *)(v36 + 56) = 0xE200000000000000;
      MEMORY[0x2611989E0]();
      if (one-time initialization token for pommes != -1) {
        swift_once();
      }
      uint64_t v37 = type metadata accessor for Logger();
      __swift_project_value_buffer(v37, (uint64_t)static Logger.pommes);
      Swift::String v38 = Logger.logObject.getter();
      os_log_type_t v39 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v38, v39))
      {
        uint64_t v40 = swift_slowAlloc();
        uint64_t v51 = v28;
        uint64_t v41 = (uint8_t *)v40;
        uint64_t v42 = swift_slowAlloc();
        uint64_t v62 = v42;
        *(_DWORD *)uint64_t v41 = 136315138;
        uint64_t v43 = swift_beginAccess();
        uint64_t v44 = MEMORY[0x2611989D0](v43);
        swift_endAccess();
        uint64_t v45 = MEMORY[0x261198C90](v44, MEMORY[0x263F8D310]);
        unint64_t v47 = v46;
        swift_bridgeObjectRelease();
        uint64_t v61 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v45, v47, &v62);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25C8FE000, v38, v39, "Confirmation prompt accepts semantics values %s", v41, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x261199590](v42, -1, -1);
        uint64_t v48 = v41;
        uint64_t v28 = v51;
        uint64_t v29 = v56;
        MEMORY[0x261199590](v48, -1, -1);
      }
    }
    else
    {
      MEMORY[0x2611989E0](MEMORY[0x263F8EE78]);
    }
    swift_beginAccess();
    (*(void (**)(uint64_t, char *, uint64_t))(v60 + 16))(v28, v17, v29);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v60 + 56))(v28, 0, 1, v29);
    return (*(uint64_t (**)(char *, uint64_t))(v60 + 8))(v17, v29);
  }
  else
  {
    uint64_t v30 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 56);
    return v30(a1, 1, 1);
  }
}

uint64_t PommesContext.convertPegasusDomainToLegacyNLDomain(pegasusDomain:)(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = 0x4572656874616577;
  if ((a1 != 0x72656874616577 || a2 != 0xE700000000000000)
    && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
  {
    unint64_t v4 = 0x6B636F7473;
    if ((a1 != 0x736B636F7473 || a2 != 0xE600000000000000)
      && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      unint64_t v4 = 0x706F6C6379636E65;
      if ((a1 != 26475 || a2 != 0xE200000000000000)
        && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0
        && (a1 != 1852008299 || a2 != 0xE400000000000000)
        && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
      {
        unint64_t v4 = 0x74656D6874697261;
        if ((a1 != 1752457581 || a2 != 0xE400000000000000)
          && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
        {
          unint64_t v4 = 0x6372616553626577;
          if ((a1 != 0x67616D695F626577 || a2 != 0xEA00000000007365)
            && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0
            && (a1 != 0x65646E695F626577 || a2 != 0xE900000000000078)
            && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0
            && (a1 != 0x77736E615F626577 || a2 != 0xEA00000000007265)
            && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0
            && (a1 != 0x695F6265775F3276 || a2 != 0xEC0000007865646ELL)
            && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
          {
            if (a1 == 0x6F65646976 && a2 == 0xE500000000000000
              || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
            {
              return 0x616964656DLL;
            }
            else
            {
              unint64_t v4 = 0xD000000000000014;
              if ((a1 != 0x616E6F6974636964 || a2 != 0xEA00000000007972)
                && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
              {
                unint64_t v4 = 0x6165536C61636F6CLL;
                if ((a1 != 1936744813 || a2 != 0xE400000000000000)
                  && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0
                  && (a1 != 7300455 || a2 != 0xE300000000000000)
                  && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
                {
                  unint64_t v4 = 0x616C50616964656DLL;
                  if ((a1 != 0x616964656DLL || a2 != 0xE500000000000000)
                    && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
                  {
                    unint64_t v4 = 0x636E75614C707061;
                    if ((a1 != 1936748641 || a2 != 0xE400000000000000)
                      && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
                    {
                      swift_bridgeObjectRetain();
                      return a1;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v4;
}

uint64_t PommesContext.exportPegasusConversationContext()()
{
  unint64_t v1 = v0[1];
  if ((v1 >> 60) <= 0xB && ((1 << (v1 >> 60)) & 0x888) != 0) {
    return 0;
  }
  uint64_t v3 = *v0;
  outlined copy of Data?(v3, v1);
  return v3;
}

uint64_t PommesContext.promptContext.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for PommesContext();
  return outlined init with copy of Apple_Parsec_Siri_V2alpha_MultiUserContext?(v1 + *(int *)(v3 + 40), a1, &demangling cache variable for type metadata for Com_Apple_Siri_Product_Proto_PromptContext?);
}

uint64_t PommesContext.update(with:)(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for PommesContext() + 40);
  outlined destroy of ClientExperienceSignals?(v3, &demangling cache variable for type metadata for Com_Apple_Siri_Product_Proto_PromptContext?);
  uint64_t v4 = type metadata accessor for Com_Apple_Siri_Product_Proto_PromptContext();
  uint64_t v7 = *(void *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v3, a1, v4);
  uint64_t v5 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56);

  return v5(v3, 0, 1, v4);
}

uint64_t PommesContext.exportPromptContext()@<X0>(char *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Com_Apple_Siri_Product_Proto_PromptContext?);
  MEMORY[0x270FA5388](v4 - 8);
  Swift::String v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for Com_Apple_Siri_Product_Proto_PromptContext();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for PommesContext();
  outlined init with copy of Apple_Parsec_Siri_V2alpha_MultiUserContext?(v2 + *(int *)(v11 + 40), (uint64_t)v6, &demangling cache variable for type metadata for Com_Apple_Siri_Product_Proto_PromptContext?);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    outlined destroy of ClientExperienceSignals?((uint64_t)v6, &demangling cache variable for type metadata for Com_Apple_Siri_Product_Proto_PromptContext?);
    uint64_t v12 = *(void *)(v2 + 24);
    if (!v12)
    {
      uint64_t v15 = 1;
      return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(a1, v15, 1, v7);
    }
    uint64_t v13 = *(void *)(v2 + 16);
    Com_Apple_Siri_Product_Proto_PromptContext.init()();
    PommesContext.convertPegasusDomainToLegacyNLDomain(pegasusDomain:)(v13, v12);
    Com_Apple_Siri_Product_Proto_PromptContext.previousDomainName.setter();
    Com_Apple_Siri_Product_Proto_PromptContext.listenAfterSpeaking.setter();
  }
  else
  {
    uint64_t v14 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
    v14(v10, v6, v7);
    v14(a1, v10, v7);
  }
  uint64_t v15 = 0;
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(a1, v15, 1, v7);
}

uint64_t PommesContext.exportPromptContextData()()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Com_Apple_Siri_Product_Proto_PromptContext();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  Swift::String v6 = &v22[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = &v22[-v7];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Com_Apple_Siri_Product_Proto_PromptContext?);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v12 = &v22[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = &v22[-v13];
  uint64_t v15 = type metadata accessor for PommesContext();
  outlined init with copy of Apple_Parsec_Siri_V2alpha_MultiUserContext?(v1 + *(int *)(v15 + 40), (uint64_t)v12, &demangling cache variable for type metadata for Com_Apple_Siri_Product_Proto_PromptContext?);
  uint64_t v16 = *(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v3 + 48);
  if (v16(v12, 1, v2) == 1)
  {
    outlined destroy of ClientExperienceSignals?((uint64_t)v12, &demangling cache variable for type metadata for Com_Apple_Siri_Product_Proto_PromptContext?);
    uint64_t v17 = *(void *)(v1 + 24);
    if (!v17)
    {
      (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v14, 1, 1, v2);
      goto LABEL_8;
    }
    uint64_t v18 = *(void *)(v1 + 16);
    Com_Apple_Siri_Product_Proto_PromptContext.init()();
    PommesContext.convertPegasusDomainToLegacyNLDomain(pegasusDomain:)(v18, v17);
    Com_Apple_Siri_Product_Proto_PromptContext.previousDomainName.setter();
    Com_Apple_Siri_Product_Proto_PromptContext.listenAfterSpeaking.setter();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v3 + 32))(v14, v6, v2);
  }
  else
  {
    uint64_t v19 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v3 + 32);
    v19(v8, v12, v2);
    v19(v14, v8, v2);
  }
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v3 + 56))(v14, 0, 1, v2);
  if (v16(v14, 1, v2) == 1)
  {
LABEL_8:
    outlined destroy of ClientExperienceSignals?((uint64_t)v14, &demangling cache variable for type metadata for Com_Apple_Siri_Product_Proto_PromptContext?);
    return 0;
  }
  lazy protocol witness table accessor for type Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent and conformance Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent(&lazy protocol witness table cache variable for type Com_Apple_Siri_Product_Proto_PromptContext and conformance Com_Apple_Siri_Product_Proto_PromptContext, MEMORY[0x263F72298]);
  uint64_t v21 = Message.serializedData(partial:)();
  (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v14, v2);
  return v21;
}

unint64_t PommesContext.CodingKeys.stringValue.getter(char a1)
{
  unint64_t result = 0xD000000000000013;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6E69616D6F64;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 0x64657265646E6572;
      break;
    case 4:
      unint64_t result = 0xD000000000000015;
      break;
    case 5:
      unint64_t result = 0x6F4374706D6F7270;
      break;
    case 6:
      unint64_t result = 0xD000000000000011;
      break;
    default:
      unint64_t result = 0x656372756F73;
      break;
  }
  return result;
}

unint64_t protocol witness for CodingKey.stringValue.getter in conformance PommesContext.CodingKeys()
{
  return PommesContext.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance PommesContext.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized PommesContext.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance PommesContext.CodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 7;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance PommesContext.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type PommesContext.CodingKeys and conformance PommesContext.CodingKeys();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance PommesContext.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type PommesContext.CodingKeys and conformance PommesContext.CodingKeys();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t PommesContext.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v55 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent?);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v53 = (char *)v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v56 = (char *)v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for BinaryDecodingOptions();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v58 = (char *)v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Com_Apple_Siri_Product_Proto_PromptContext?);
  MEMORY[0x270FA5388](v10 - 8);
  unint64_t v54 = (char *)v49 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<PommesContext.CodingKeys>);
  uint64_t v57 = *(void *)(v59 - 8);
  MEMORY[0x270FA5388](v59);
  uint64_t v13 = (char *)v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for PommesContext();
  uint64_t v15 = (int *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)v49 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = &v17[v15[9]];
  uint64_t v62 = v6;
  uint64_t v63 = v5;
  uint64_t v19 = *(void (**)(void))(v6 + 104);
  uint64_t v60 = v18;
  v19();
  uint64_t v20 = MEMORY[0x263F8EE78];
  uint64_t v65 = v15[10];
  *(void *)&v17[v65] = MEMORY[0x263F8EE78];
  uint64_t v66 = v15[11];
  uint64_t v67 = v17;
  *(void *)&v17[v66] = v20;
  uint64_t v21 = (uint64_t)&v17[v15[12]];
  uint64_t v22 = type metadata accessor for Com_Apple_Siri_Product_Proto_PromptContext();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v23 + 56);
  uint64_t v25 = v23 + 56;
  uint64_t v61 = v21;
  v24(v21, 1, 1, v22);
  uint64_t v26 = (uint64_t)a1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type PommesContext.CodingKeys and conformance PommesContext.CodingKeys();
  uint64_t v27 = v64;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v27)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    (*(void (**)(char *, uint64_t))(v62 + 8))(v60, v63);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return outlined destroy of ClientExperienceSignals?(v61, &demangling cache variable for type metadata for Com_Apple_Siri_Product_Proto_PromptContext?);
  }
  else
  {
    uint64_t v51 = v25;
    uint64_t v52 = v24;
    uint64_t v64 = v22;
    uint64_t v28 = v57;
    char v71 = 0;
    lazy protocol witness table accessor for type PommesContext.Source and conformance PommesContext.Source();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    uint64_t v30 = v67;
    *uint64_t v67 = v68;
    LOBYTE(v68) = 1;
    uint64_t v31 = v13;
    uint64_t v32 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
    uint64_t v50 = v26;
    uint64_t v33 = v28;
    *((void *)v30 + 2) = v32;
    *((void *)v30 + 3) = v34;
    LOBYTE(v68) = 2;
    v49[1] = 0;
    char v35 = KeyedDecodingContainer.decode(_:forKey:)();
    uint64_t v37 = v65;
    uint64_t v36 = v66;
    *((unsigned char *)v30 + 32) = v35 & 1;
    uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
    char v71 = 3;
    lazy protocol witness table accessor for type [String] and conformance <A> [A](&lazy protocol witness table cache variable for type [String] and conformance <A> [A]);
    v49[0] = v38;
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    *(void *)((char *)v30 + v37) = v68;
    char v71 = 4;
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    *(void *)((char *)v30 + v36) = v68;
    char v71 = 5;
    lazy protocol witness table accessor for type Data and conformance Data();
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
    v49[0] = v31;
    if (*((void *)&v68 + 1) >> 60 == 15)
    {
      os_log_type_t v39 = v56;
    }
    else
    {
      uint64_t v70 = 0;
      long long v68 = 0u;
      long long v69 = 0u;
      BinaryDecodingOptions.init()();
      lazy protocol witness table accessor for type Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent and conformance Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent(&lazy protocol witness table cache variable for type Com_Apple_Siri_Product_Proto_PromptContext and conformance Com_Apple_Siri_Product_Proto_PromptContext, MEMORY[0x263F72298]);
      uint64_t v40 = (uint64_t)v54;
      uint64_t v41 = v64;
      Message.init(serializedData:extensions:partial:options:)();
      os_log_type_t v39 = v56;
      v52(v40, 0, 1, v41);
      outlined assign with take of Com_Apple_Siri_Product_Proto_PromptContext?(v40, v61);
    }
    uint64_t v42 = (uint64_t)v67;
    LOBYTE(v68) = 6;
    uint64_t v43 = v59;
    uint64_t v44 = v49[0];
    KeyedDecodingContainer.decode(_:forKey:)();
    uint64_t v45 = v55;
    uint64_t v46 = (uint64_t)v53;
    Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent.init(rawValue:)();
    (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v44, v43);
    uint64_t v48 = v62;
    uint64_t v47 = v63;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v62 + 48))(v46, 1, v63) == 1)
    {
      outlined destroy of ClientExperienceSignals?(v46, (uint64_t *)&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent?);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v48 + 32))(v39, v46, v47);
      (*(void (**)(char *, char *, uint64_t))(v48 + 40))(v60, v39, v47);
    }
    outlined init with copy of PommesContext(v42, v45);
    __swift_destroy_boxed_opaque_existential_1(v50);
    return outlined destroy of PommesContext(v42);
  }
}

uint64_t PommesContext.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Com_Apple_Siri_Product_Proto_PromptContext?);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<PommesContext.CodingKeys>);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type PommesContext.CodingKeys and conformance PommesContext.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  long long v26 = *v3;
  char v27 = 0;
  lazy protocol witness table accessor for type PommesContext.Source and conformance PommesContext.Source();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v2)
  {
    LOBYTE(v26) = 1;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    LOBYTE(v26) = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
    uint64_t v12 = type metadata accessor for PommesContext();
    uint64_t v13 = *(void *)((char *)v3 + *(int *)(v12 + 32));
    uint64_t v25 = v12;
    *(void *)&long long v26 = v13;
    char v27 = 3;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
    lazy protocol witness table accessor for type [String] and conformance <A> [A]((unint64_t *)&lazy protocol witness table cache variable for type [String] and conformance <A> [A]);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    *(void *)&long long v26 = *(void *)((char *)v3 + *(int *)(v25 + 36));
    char v27 = 4;
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    outlined init with copy of Apple_Parsec_Siri_V2alpha_MultiUserContext?((uint64_t)v3 + *(int *)(v25 + 40), (uint64_t)v7, &demangling cache variable for type metadata for Com_Apple_Siri_Product_Proto_PromptContext?);
    uint64_t v14 = type metadata accessor for Com_Apple_Siri_Product_Proto_PromptContext();
    uint64_t v15 = *(void *)(v14 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v7, 1, v14) == 1)
    {
      outlined destroy of ClientExperienceSignals?((uint64_t)v7, &demangling cache variable for type metadata for Com_Apple_Siri_Product_Proto_PromptContext?);
      uint64_t v16 = 0;
      unint64_t v17 = 0xF000000000000000;
    }
    else
    {
      lazy protocol witness table accessor for type Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent and conformance Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent(&lazy protocol witness table cache variable for type Com_Apple_Siri_Product_Proto_PromptContext and conformance Com_Apple_Siri_Product_Proto_PromptContext, MEMORY[0x263F72298]);
      uint64_t v18 = Message.serializedData(partial:)();
      uint64_t v19 = *(void (**)(char *, uint64_t))(v15 + 8);
      uint64_t v20 = v18;
      unint64_t v24 = v21;
      v19(v7, v14);
      uint64_t v16 = v20;
      unint64_t v17 = v24;
    }
    *(void *)&long long v26 = v16;
    *((void *)&v26 + 1) = v17;
    char v27 = 5;
    lazy protocol witness table accessor for type Data and conformance Data();
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
    uint64_t v22 = outlined consume of Data._Representation?(v16, v17);
    MEMORY[0x2611985A0](v22);
    LOBYTE(v26) = 6;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t protocol witness for Decodable.init(from:) in conformance PommesContext@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return PommesContext.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance PommesContext(void *a1)
{
  return PommesContext.encode(to:)(a1);
}

uint64_t closure #1 in static Data.== infix(_:_:)@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char *a4@<X8>)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v7 = (const void *)__s1;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = (a2 >> 32) - (int)a2;
      if (a2 >> 32 < (int)a2)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      outlined copy of Data._Representation(a2, a3);
      uint64_t v10 = (char *)__DataStorage._bytes.getter();
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = __DataStorage._offset.getter();
      if (__OFSUB__((int)a2, v11)) {
LABEL_33:
      }
        __break(1u);
      v10 += (int)a2 - v11;
LABEL_8:
      uint64_t v12 = __DataStorage._length.getter();
      if (v12 >= v9) {
        size_t v13 = (a2 >> 32) - (int)a2;
      }
      else {
        size_t v13 = v12;
      }
      if (!v7)
      {
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        JUMPOUT(0x25C939EC4);
      }
      if (!v10) {
        goto LABEL_36;
      }
      int v14 = memcmp(v7, v10, v13);
      __s1 = outlined consume of Data._Representation(a2, a3);
      BOOL v8 = v14 == 0;
LABEL_24:
      char v24 = v8;
LABEL_29:
      *a4 = v24;
      return __s1;
    case 2uLL:
      uint64_t v15 = *(void *)(a2 + 16);
      uint64_t v16 = *(void *)(a2 + 24);
      swift_retain();
      swift_retain();
      unint64_t v17 = (char *)__DataStorage._bytes.getter();
      if (!v17) {
        goto LABEL_17;
      }
      uint64_t v18 = __DataStorage._offset.getter();
      if (__OFSUB__(v15, v18)) {
        goto LABEL_32;
      }
      v17 += v15 - v18;
LABEL_17:
      BOOL v19 = __OFSUB__(v16, v15);
      int64_t v20 = v16 - v15;
      if (v19) {
        goto LABEL_31;
      }
      uint64_t v21 = __DataStorage._length.getter();
      if (v21 >= v20) {
        size_t v22 = v20;
      }
      else {
        size_t v22 = v21;
      }
      if (!v7) {
        goto LABEL_37;
      }
      if (!v17) {
        goto LABEL_38;
      }
      int v23 = memcmp(v7, v17, v22);
      swift_release();
      __s1 = swift_release();
      BOOL v8 = v23 == 0;
      goto LABEL_24;
    case 3uLL:
      if (!__s1) {
        goto LABEL_39;
      }
      char v24 = 1;
      goto LABEL_29;
    default:
      uint64_t __s2 = a2;
      __int16 v26 = a3;
      char v27 = BYTE2(a3);
      char v28 = BYTE3(a3);
      char v29 = BYTE4(a3);
      char v30 = BYTE5(a3);
      if (__s1)
      {
        __s1 = memcmp((const void *)__s1, &__s2, BYTE6(a3));
        BOOL v8 = __s1 == 0;
        goto LABEL_24;
      }
      __break(1u);
      goto LABEL_35;
  }
}

uint64_t specialized Data.InlineData.withUnsafeBytes<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t __s1 = a1;
  __int16 v9 = a2;
  char v10 = BYTE2(a2);
  char v11 = BYTE3(a2);
  char v12 = BYTE4(a2);
  char v13 = BYTE5(a2);
  closure #1 in static Data.== infix(_:_:)((uint64_t)&__s1, a3, a4, &v7);
  if (!v4) {
    char v5 = v7;
  }
  return v5 & 1;
}

uint64_t specialized __DataStorage.withUnsafeBytes<A>(in:apply:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = __DataStorage._bytes.getter();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = __DataStorage._offset.getter();
    if (__OFSUB__(a1, result))
    {
LABEL_9:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  __DataStorage._length.getter();
  closure #1 in static Data.== infix(_:_:)(v11, a4, a5, &v13);
  if (!v5) {
    char v12 = v13;
  }
  return v12 & 1;
}

uint64_t specialized static Data.== infix(_:_:)(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v8) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
        JUMPOUT(0x25C93A2CCLL);
      }
      uint64_t v8 = (int)v8;
LABEL_6:
      switch(a4 >> 62)
      {
        case 1uLL:
          LODWORD(v12) = HIDWORD(a3) - a3;
          if (__OFSUB__(HIDWORD(a3), a3)) {
            goto LABEL_27;
          }
          uint64_t v12 = (int)v12;
LABEL_11:
          if (v8 == v12)
          {
            if (v8 < 1)
            {
              char v17 = 1;
            }
            else
            {
              switch(a2 >> 62)
              {
                case 1uLL:
                  if (a1 >> 32 < (int)a1) {
                    goto LABEL_29;
                  }
                  outlined copy of Data._Representation(a3, a4);
                  outlined copy of Data._Representation(a1, a2);
                  char v17 = specialized __DataStorage.withUnsafeBytes<A>(in:apply:)((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
                  outlined consume of Data._Representation(a3, a4);
                  uint64_t v18 = a1;
                  unint64_t v19 = a2;
                  break;
                case 2uLL:
                  uint64_t v20 = a2 & 0x3FFFFFFFFFFFFFFFLL;
                  uint64_t v21 = *(void *)(a1 + 16);
                  uint64_t v22 = *(void *)(a1 + 24);
                  outlined copy of Data._Representation(a3, a4);
                  swift_retain();
                  swift_retain();
                  char v17 = specialized __DataStorage.withUnsafeBytes<A>(in:apply:)(v21, v22, v20, a3, a4);
                  outlined consume of Data._Representation(a3, a4);
                  swift_release();
                  swift_release();
                  return v17 & 1;
                case 3uLL:
                  outlined copy of Data._Representation(a3, a4);
                  uint64_t v16 = 0;
                  uint64_t v15 = 0;
                  goto LABEL_22;
                default:
                  outlined copy of Data._Representation(a3, a4);
                  uint64_t v15 = a2 & 0xFFFFFFFFFFFFFFLL;
                  uint64_t v16 = a1;
LABEL_22:
                  char v17 = specialized Data.InlineData.withUnsafeBytes<A>(_:)(v16, v15, a3, a4);
                  uint64_t v18 = a3;
                  unint64_t v19 = a4;
                  break;
              }
              outlined consume of Data._Representation(v18, v19);
            }
          }
          else
          {
            char v17 = 0;
          }
          return v17 & 1;
        case 2uLL:
          uint64_t v14 = *(void *)(a3 + 16);
          uint64_t v13 = *(void *)(a3 + 24);
          BOOL v11 = __OFSUB__(v13, v14);
          uint64_t v12 = v13 - v14;
          if (!v11) {
            goto LABEL_11;
          }
          goto LABEL_28;
        case 3uLL:
          char v17 = v8 == 0;
          return v17 & 1;
        default:
          uint64_t v12 = BYTE6(a4);
          goto LABEL_11;
      }
    case 2uLL:
      uint64_t v10 = *(void *)(a1 + 16);
      uint64_t v9 = *(void *)(a1 + 24);
      BOOL v11 = __OFSUB__(v9, v10);
      uint64_t v8 = v9 - v10;
      if (!v11) {
        goto LABEL_6;
      }
      goto LABEL_26;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v8 = BYTE6(a2);
      goto LABEL_6;
  }
}

BOOL specialized static PommesContext.Source.== infix(_:_:)(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  unint64_t v2 = a1[1];
  uint64_t v5 = *(void *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  unint64_t v6 = v2 >> 60;
  if (v2 >> 60 == 3)
  {
    if (v4 >> 60 != 3) {
      goto LABEL_14;
    }
    goto LABEL_9;
  }
  if (v6 == 7)
  {
    if (v4 >> 60 != 7)
    {
LABEL_14:
      outlined copy of PommesContext.Source(*(void *)a2, *(void *)(a2 + 8));
      outlined copy of PommesContext.Source(v3, v2);
      outlined consume of PommesContext.Source(v3, v2);
      outlined consume of PommesContext.Source(v5, v4);
      return 0;
    }
LABEL_9:
    outlined consume of PommesContext.Source(*a1, v2);
    outlined consume of PommesContext.Source(v5, v4);
    return 1;
  }
  if (v6 == 11)
  {
    if (v4 >> 60 != 11) {
      goto LABEL_14;
    }
    goto LABEL_9;
  }
  if ((v4 >> 60) <= 0xB && ((1 << (v4 >> 60)) & 0x888) != 0) {
    goto LABEL_14;
  }
  if (v2 >> 60 == 15)
  {
    outlined copy of Data?(*(void *)a2, *(void *)(a2 + 8));
    outlined copy of PommesContext.Source(v5, v4);
    outlined copy of PommesContext.Source(v3, v2);
    outlined consume of PommesContext.Source(v3, v2);
    outlined consume of PommesContext.Source(v5, v4);
    if (v4 >> 60 == 15) {
      return 1;
    }
LABEL_21:
    outlined consume of Data._Representation?(v3, v2);
    outlined consume of Data._Representation?(v5, v4);
    return 0;
  }
  if (v4 >> 60 == 15)
  {
    outlined copy of PommesContext.Source(*(void *)a2, *(void *)(a2 + 8));
    outlined copy of PommesContext.Source(v5, v4);
    outlined copy of PommesContext.Source(v3, v2);
    outlined copy of PommesContext.Source(v5, v4);
    outlined copy of PommesContext.Source(v3, v2);
    outlined consume of PommesContext.Source(v3, v2);
    outlined consume of PommesContext.Source(v5, v4);
    goto LABEL_21;
  }
  outlined copy of PommesContext.Source(*a1, v2);
  outlined copy of PommesContext.Source(v5, v4);
  outlined copy of PommesContext.Source(v3, v2);
  outlined copy of PommesContext.Source(v5, v4);
  outlined copy of PommesContext.Source(v3, v2);
  char v9 = specialized static Data.== infix(_:_:)(v3, v2, v5, v4);
  outlined consume of PommesContext.Source(v3, v2);
  outlined consume of PommesContext.Source(v5, v4);
  outlined consume of PommesContext.Source(v5, v4);
  outlined consume of PommesContext.Source(v3, v2);
  outlined consume of PommesContext.Source(v3, v2);
  return (v9 & 1) != 0;
}

unint64_t lazy protocol witness table accessor for type PommesContext.Source.CodingKeys and conformance PommesContext.Source.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type PommesContext.Source.CodingKeys and conformance PommesContext.Source.CodingKeys;
  if (!lazy protocol witness table cache variable for type PommesContext.Source.CodingKeys and conformance PommesContext.Source.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PommesContext.Source.CodingKeys and conformance PommesContext.Source.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type PommesContext.Source.CodingKeys and conformance PommesContext.Source.CodingKeys;
  if (!lazy protocol witness table cache variable for type PommesContext.Source.CodingKeys and conformance PommesContext.Source.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PommesContext.Source.CodingKeys and conformance PommesContext.Source.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type PommesContext.Source.CodingKeys and conformance PommesContext.Source.CodingKeys;
  if (!lazy protocol witness table cache variable for type PommesContext.Source.CodingKeys and conformance PommesContext.Source.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PommesContext.Source.CodingKeys and conformance PommesContext.Source.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type PommesContext.Source.CodingKeys and conformance PommesContext.Source.CodingKeys;
  if (!lazy protocol witness table cache variable for type PommesContext.Source.CodingKeys and conformance PommesContext.Source.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PommesContext.Source.CodingKeys and conformance PommesContext.Source.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type PommesContext.Source.UnknownCodingKeys and conformance PommesContext.Source.UnknownCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type PommesContext.Source.UnknownCodingKeys and conformance PommesContext.Source.UnknownCodingKeys;
  if (!lazy protocol witness table cache variable for type PommesContext.Source.UnknownCodingKeys and conformance PommesContext.Source.UnknownCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PommesContext.Source.UnknownCodingKeys and conformance PommesContext.Source.UnknownCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type PommesContext.Source.UnknownCodingKeys and conformance PommesContext.Source.UnknownCodingKeys;
  if (!lazy protocol witness table cache variable for type PommesContext.Source.UnknownCodingKeys and conformance PommesContext.Source.UnknownCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PommesContext.Source.UnknownCodingKeys and conformance PommesContext.Source.UnknownCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type PommesContext.Source.UnknownCodingKeys and conformance PommesContext.Source.UnknownCodingKeys;
  if (!lazy protocol witness table cache variable for type PommesContext.Source.UnknownCodingKeys and conformance PommesContext.Source.UnknownCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PommesContext.Source.UnknownCodingKeys and conformance PommesContext.Source.UnknownCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type PommesContext.Source.ModalityTranslatedCodingKeys and conformance PommesContext.Source.ModalityTranslatedCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type PommesContext.Source.ModalityTranslatedCodingKeys and conformance PommesContext.Source.ModalityTranslatedCodingKeys;
  if (!lazy protocol witness table cache variable for type PommesContext.Source.ModalityTranslatedCodingKeys and conformance PommesContext.Source.ModalityTranslatedCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PommesContext.Source.ModalityTranslatedCodingKeys and conformance PommesContext.Source.ModalityTranslatedCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type PommesContext.Source.ModalityTranslatedCodingKeys and conformance PommesContext.Source.ModalityTranslatedCodingKeys;
  if (!lazy protocol witness table cache variable for type PommesContext.Source.ModalityTranslatedCodingKeys and conformance PommesContext.Source.ModalityTranslatedCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PommesContext.Source.ModalityTranslatedCodingKeys and conformance PommesContext.Source.ModalityTranslatedCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type PommesContext.Source.ModalityTranslatedCodingKeys and conformance PommesContext.Source.ModalityTranslatedCodingKeys;
  if (!lazy protocol witness table cache variable for type PommesContext.Source.ModalityTranslatedCodingKeys and conformance PommesContext.Source.ModalityTranslatedCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PommesContext.Source.ModalityTranslatedCodingKeys and conformance PommesContext.Source.ModalityTranslatedCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type PommesContext.Source.PluginDefinedCodingKeys and conformance PommesContext.Source.PluginDefinedCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type PommesContext.Source.PluginDefinedCodingKeys and conformance PommesContext.Source.PluginDefinedCodingKeys;
  if (!lazy protocol witness table cache variable for type PommesContext.Source.PluginDefinedCodingKeys and conformance PommesContext.Source.PluginDefinedCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PommesContext.Source.PluginDefinedCodingKeys and conformance PommesContext.Source.PluginDefinedCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type PommesContext.Source.PluginDefinedCodingKeys and conformance PommesContext.Source.PluginDefinedCodingKeys;
  if (!lazy protocol witness table cache variable for type PommesContext.Source.PluginDefinedCodingKeys and conformance PommesContext.Source.PluginDefinedCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PommesContext.Source.PluginDefinedCodingKeys and conformance PommesContext.Source.PluginDefinedCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type PommesContext.Source.PluginDefinedCodingKeys and conformance PommesContext.Source.PluginDefinedCodingKeys;
  if (!lazy protocol witness table cache variable for type PommesContext.Source.PluginDefinedCodingKeys and conformance PommesContext.Source.PluginDefinedCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PommesContext.Source.PluginDefinedCodingKeys and conformance PommesContext.Source.PluginDefinedCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type PommesContext.Source.PegasusResponseCodingKeys and conformance PommesContext.Source.PegasusResponseCodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type PommesContext.Source.PegasusResponseCodingKeys and conformance PommesContext.Source.PegasusResponseCodingKeys;
  if (!lazy protocol witness table cache variable for type PommesContext.Source.PegasusResponseCodingKeys and conformance PommesContext.Source.PegasusResponseCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PommesContext.Source.PegasusResponseCodingKeys and conformance PommesContext.Source.PegasusResponseCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type PommesContext.Source.PegasusResponseCodingKeys and conformance PommesContext.Source.PegasusResponseCodingKeys;
  if (!lazy protocol witness table cache variable for type PommesContext.Source.PegasusResponseCodingKeys and conformance PommesContext.Source.PegasusResponseCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PommesContext.Source.PegasusResponseCodingKeys and conformance PommesContext.Source.PegasusResponseCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type PommesContext.Source.PegasusResponseCodingKeys and conformance PommesContext.Source.PegasusResponseCodingKeys;
  if (!lazy protocol witness table cache variable for type PommesContext.Source.PegasusResponseCodingKeys and conformance PommesContext.Source.PegasusResponseCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PommesContext.Source.PegasusResponseCodingKeys and conformance PommesContext.Source.PegasusResponseCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type PommesContext.Source.PegasusResponseCodingKeys and conformance PommesContext.Source.PegasusResponseCodingKeys;
  if (!lazy protocol witness table cache variable for type PommesContext.Source.PegasusResponseCodingKeys and conformance PommesContext.Source.PegasusResponseCodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PommesContext.Source.PegasusResponseCodingKeys and conformance PommesContext.Source.PegasusResponseCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Data and conformance Data()
{
  unint64_t result = lazy protocol witness table cache variable for type Data and conformance Data;
  if (!lazy protocol witness table cache variable for type Data and conformance Data)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Data and conformance Data);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type Data and conformance Data;
  if (!lazy protocol witness table cache variable for type Data and conformance Data)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Data and conformance Data);
  }
  return result;
}

uint64_t outlined consume of PommesContext.Source(uint64_t a1, unint64_t a2)
{
  if ((a2 >> 60) > 0xB || ((1 << (a2 >> 60)) & 0x888) == 0) {
    return outlined consume of Data._Representation?(a1, a2);
  }
  return a1;
}

uint64_t type metadata accessor for PommesContext()
{
  uint64_t result = type metadata singleton initialization cache for PommesContext;
  if (!type metadata singleton initialization cache for PommesContext) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t outlined copy of PommesContext.Source(uint64_t a1, unint64_t a2)
{
  if ((a2 >> 60) > 0xB || ((1 << (a2 >> 60)) & 0x888) == 0) {
    return outlined copy of Data?(a1, a2);
  }
  return a1;
}

uint64_t specialized static PommesContext.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PommesContext();
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  char v7 = &v29[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = &v29[-v9];
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = &v29[-v12];
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = &v29[-v14];
  unint64_t v16 = *(void *)(a1 + 8);
  if ((v16 >> 60) > 0xB || ((1 << (v16 >> 60)) & 0x888) == 0)
  {
    uint64_t v18 = *(void *)a1;
    outlined copy of Data?(*(void *)a1, *(void *)(a1 + 8));
  }
  else
  {
    uint64_t v18 = 0;
    unint64_t v16 = 0xF000000000000000;
  }
  unint64_t v19 = *(void *)(a2 + 8);
  if ((v19 >> 60) <= 0xB && ((1 << (v19 >> 60)) & 0x888) != 0)
  {
    uint64_t v20 = 0;
    unint64_t v19 = 0xF000000000000000;
  }
  else
  {
    uint64_t v20 = *(void *)a2;
    outlined copy of Data?(*(void *)a2, *(void *)(a2 + 8));
  }
  if (v16 >> 60 == 15)
  {
    if (v19 >> 60 == 15)
    {
      outlined init with copy of PommesContext(a1, (uint64_t)v15);
      outlined init with copy of PommesContext(a2, (uint64_t)v13);
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  if (v19 >> 60 == 15)
  {
LABEL_15:
    outlined consume of Data._Representation?(v18, v16);
    outlined consume of Data._Representation?(v20, v19);
    outlined init with copy of PommesContext(a1, (uint64_t)v15);
    outlined init with copy of PommesContext(a2, (uint64_t)v13);
LABEL_25:
    outlined destroy of PommesContext((uint64_t)v13);
    outlined destroy of PommesContext((uint64_t)v15);
LABEL_30:
    outlined init with copy of PommesContext(a1, (uint64_t)v10);
    outlined init with copy of PommesContext(a2, (uint64_t)v7);
    goto LABEL_31;
  }
  outlined copy of Data._Representation(v18, v16);
  int v30 = specialized static Data.== infix(_:_:)(v18, v16, v20, v19);
  outlined consume of Data._Representation?(v20, v19);
  outlined consume of Data._Representation?(v18, v16);
  outlined consume of Data._Representation?(v18, v16);
  outlined init with copy of PommesContext(a1, (uint64_t)v15);
  outlined init with copy of PommesContext(a2, (uint64_t)v13);
  if ((v30 & 1) == 0) {
    goto LABEL_25;
  }
LABEL_17:
  uint64_t v21 = *((void *)v15 + 3);
  uint64_t v22 = *((void *)v13 + 3);
  if (!v21)
  {
    swift_bridgeObjectRetain();
    outlined destroy of PommesContext((uint64_t)v13);
    outlined destroy of PommesContext((uint64_t)v15);
    if (!v22)
    {
LABEL_34:
      outlined init with copy of PommesContext(a1, (uint64_t)v10);
      outlined init with copy of PommesContext(a2, (uint64_t)v7);
LABEL_35:
      char v27 = v10[32];
      outlined destroy of PommesContext((uint64_t)v10);
      char v28 = v7[32];
      outlined destroy of PommesContext((uint64_t)v7);
      char v25 = v27 ^ v28 ^ 1;
      return v25 & 1;
    }
    goto LABEL_29;
  }
  if (!v22)
  {
    swift_bridgeObjectRetain();
    outlined destroy of PommesContext((uint64_t)v13);
    outlined destroy of PommesContext((uint64_t)v15);
LABEL_29:
    swift_bridgeObjectRelease();
    goto LABEL_30;
  }
  if (*((void *)v15 + 2) == *((void *)v13 + 2) && v21 == v22)
  {
    swift_bridgeObjectRetain();
    outlined destroy of PommesContext((uint64_t)v13);
    outlined destroy of PommesContext((uint64_t)v15);
    swift_bridgeObjectRelease();
    goto LABEL_34;
  }
  char v24 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRetain();
  outlined destroy of PommesContext((uint64_t)v13);
  outlined destroy of PommesContext((uint64_t)v15);
  swift_bridgeObjectRelease();
  outlined init with copy of PommesContext(a1, (uint64_t)v10);
  outlined init with copy of PommesContext(a2, (uint64_t)v7);
  if (v24) {
    goto LABEL_35;
  }
LABEL_31:
  outlined destroy of PommesContext((uint64_t)v7);
  outlined destroy of PommesContext((uint64_t)v10);
  char v25 = 0;
  return v25 & 1;
}

uint64_t lazy protocol witness table accessor for type Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent and conformance Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t lazy protocol witness table accessor for type PommesContext.CodingKeys and conformance PommesContext.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type PommesContext.CodingKeys and conformance PommesContext.CodingKeys;
  if (!lazy protocol witness table cache variable for type PommesContext.CodingKeys and conformance PommesContext.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PommesContext.CodingKeys and conformance PommesContext.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type PommesContext.CodingKeys and conformance PommesContext.CodingKeys;
  if (!lazy protocol witness table cache variable for type PommesContext.CodingKeys and conformance PommesContext.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PommesContext.CodingKeys and conformance PommesContext.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type PommesContext.CodingKeys and conformance PommesContext.CodingKeys;
  if (!lazy protocol witness table cache variable for type PommesContext.CodingKeys and conformance PommesContext.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PommesContext.CodingKeys and conformance PommesContext.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type PommesContext.CodingKeys and conformance PommesContext.CodingKeys;
  if (!lazy protocol witness table cache variable for type PommesContext.CodingKeys and conformance PommesContext.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PommesContext.CodingKeys and conformance PommesContext.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type PommesContext.Source and conformance PommesContext.Source()
{
  unint64_t result = lazy protocol witness table cache variable for type PommesContext.Source and conformance PommesContext.Source;
  if (!lazy protocol witness table cache variable for type PommesContext.Source and conformance PommesContext.Source)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PommesContext.Source and conformance PommesContext.Source);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type PommesContext.Source and conformance PommesContext.Source;
  if (!lazy protocol witness table cache variable for type PommesContext.Source and conformance PommesContext.Source)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PommesContext.Source and conformance PommesContext.Source);
  }
  return result;
}

uint64_t outlined init with copy of PommesContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PommesContext();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of PommesContext(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PommesContext();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t outlined assign with take of Com_Apple_Siri_Product_Proto_PromptContext?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Com_Apple_Siri_Product_Proto_PromptContext?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t lazy protocol witness table accessor for type [String] and conformance <A> [A](unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

_OWORD *initializeBufferWithCopyOfBuffer for PommesContext(_OWORD *a1, uint64_t a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v23 = *(void *)a2;
    *(void *)uint64_t v4 = *(void *)a2;
    uint64_t v4 = (_OWORD *)(v23 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    unint64_t v7 = *(void *)(a2 + 8);
    BOOL v8 = (v7 >> 60) > 0xB || ((1 << (v7 >> 60)) & 0x888) == 0;
    if (!v8 || v7 >> 60 == 15)
    {
      *a1 = *(_OWORD *)a2;
    }
    else
    {
      uint64_t v25 = *(void *)a2;
      outlined copy of Data._Representation(*(void *)a2, *(void *)(a2 + 8));
      *(void *)uint64_t v4 = v25;
      *((void *)v4 + 1) = v7;
    }
    uint64_t v9 = *(void *)(a2 + 24);
    *((void *)v4 + 2) = *(void *)(a2 + 16);
    *((void *)v4 + 3) = v9;
    *((unsigned char *)v4 + 32) = *(unsigned char *)(a2 + 32);
    uint64_t v10 = a3[7];
    uint64_t v11 = (char *)v4 + v10;
    uint64_t v12 = a2 + v10;
    uint64_t v13 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent();
    uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16);
    swift_bridgeObjectRetain();
    v14(v11, v12, v13);
    uint64_t v15 = a3[9];
    *(void *)((char *)v4 + a3[8]) = *(void *)(a2 + a3[8]);
    *(void *)((char *)v4 + v15) = *(void *)(a2 + v15);
    uint64_t v16 = a3[10];
    char v17 = (char *)v4 + v16;
    uint64_t v18 = (const void *)(a2 + v16);
    uint64_t v19 = type metadata accessor for Com_Apple_Siri_Product_Proto_PromptContext();
    uint64_t v20 = *(void *)(v19 - 8);
    uint64_t v21 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v20 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v21(v18, 1, v19))
    {
      uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Com_Apple_Siri_Product_Proto_PromptContext?);
      memcpy(v17, v18, *(void *)(*(void *)(v22 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, const void *, uint64_t))(v20 + 16))(v17, v18, v19);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
    }
  }
  return v4;
}

uint64_t destroy for PommesContext(uint64_t *a1, uint64_t a2)
{
  unint64_t v4 = a1[1];
  if (((v4 >> 60) > 0xB || ((1 << (v4 >> 60)) & 0x888) == 0) && v4 >> 60 != 15) {
    outlined consume of Data._Representation(*a1, v4);
  }
  swift_bridgeObjectRelease();
  unint64_t v7 = (char *)a1 + *(int *)(a2 + 28);
  uint64_t v8 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent();
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v9 = (char *)a1 + *(int *)(a2 + 40);
  uint64_t v10 = type metadata accessor for Com_Apple_Siri_Product_Proto_PromptContext();
  uint64_t v13 = *(void *)(v10 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48))(v9, 1, v10);
  if (!result)
  {
    uint64_t v12 = *(uint64_t (**)(char *, uint64_t))(v13 + 8);
    return v12(v9, v10);
  }
  return result;
}

uint64_t initializeWithCopy for PommesContext(uint64_t a1, uint64_t *a2, int *a3)
{
  unint64_t v6 = a2[1];
  BOOL v7 = (v6 >> 60) > 0xB || ((1 << (v6 >> 60)) & 0x888) == 0;
  if (!v7 || v6 >> 60 == 15)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    uint64_t v23 = *a2;
    outlined copy of Data._Representation(*a2, a2[1]);
    *(void *)a1 = v23;
    *(void *)(a1 + 8) = v6;
  }
  uint64_t v8 = a2[3];
  *(void *)(a1 + 16) = a2[2];
  *(void *)(a1 + 24) = v8;
  *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
  uint64_t v9 = a3[7];
  uint64_t v10 = a1 + v9;
  uint64_t v11 = (uint64_t)a2 + v9;
  uint64_t v12 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent();
  uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16);
  swift_bridgeObjectRetain();
  v13(v10, v11, v12);
  uint64_t v14 = a3[9];
  *(void *)(a1 + a3[8]) = *(uint64_t *)((char *)a2 + a3[8]);
  *(void *)(a1 + v14) = *(uint64_t *)((char *)a2 + v14);
  uint64_t v15 = a3[10];
  uint64_t v16 = (void *)(a1 + v15);
  char v17 = (char *)a2 + v15;
  uint64_t v18 = type metadata accessor for Com_Apple_Siri_Product_Proto_PromptContext();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v19 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v20(v17, 1, v18))
  {
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Com_Apple_Siri_Product_Proto_PromptContext?);
    memcpy(v16, v17, *(void *)(*(void *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, char *, uint64_t))(v19 + 16))(v16, v17, v18);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
  }
  return a1;
}

uint64_t assignWithCopy for PommesContext(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v6 = *(void *)(a1 + 8) >> 60;
  if (v6 <= 0xB && ((1 << v6) & 0x888) != 0)
  {
    unint64_t v8 = a2[1];
    BOOL v9 = (v8 >> 60) > 0xB || ((1 << (v8 >> 60)) & 0x888) == 0;
    if (v9 && v8 >> 60 != 15) {
      goto LABEL_11;
    }
    goto LABEL_17;
  }
  unint64_t v8 = a2[1];
  if ((v8 >> 60) <= 0xB && ((1 << (v8 >> 60)) & 0x888) != 0)
  {
    outlined destroy of ClientExperienceSignals?(a1, &demangling cache variable for type metadata for (conversationContext: Data?));
LABEL_17:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_18;
  }
  if (*(void *)(a1 + 8) >> 60 == 15)
  {
    if (v8 >> 60 != 15)
    {
LABEL_11:
      uint64_t v10 = *a2;
      outlined copy of Data._Representation(*a2, v8);
      *(void *)a1 = v10;
      *(void *)(a1 + 8) = v8;
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  if (v8 >> 60 == 15)
  {
    outlined destroy of Data(a1);
    goto LABEL_17;
  }
  uint64_t v25 = *a2;
  outlined copy of Data._Representation(*a2, a2[1]);
  uint64_t v26 = *(void *)a1;
  unint64_t v27 = *(void *)(a1 + 8);
  *(void *)a1 = v25;
  *(void *)(a1 + 8) = v8;
  outlined consume of Data._Representation(v26, v27);
LABEL_18:
  *(void *)(a1 + 16) = a2[2];
  *(void *)(a1 + 24) = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
  uint64_t v12 = a3[7];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = (uint64_t)a2 + v12;
  uint64_t v15 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 24))(v13, v14, v15);
  *(void *)(a1 + a3[8]) = *(uint64_t *)((char *)a2 + a3[8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[9]) = *(uint64_t *)((char *)a2 + a3[9]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[10];
  char v17 = (void *)(a1 + v16);
  uint64_t v18 = (char *)a2 + v16;
  uint64_t v19 = type metadata accessor for Com_Apple_Siri_Product_Proto_PromptContext();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v20 + 48);
  LODWORD(v14) = v21(v17, 1, v19);
  int v22 = v21(v18, 1, v19);
  if (!v14)
  {
    if (!v22)
    {
      (*(void (**)(void *, char *, uint64_t))(v20 + 24))(v17, v18, v19);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v20 + 8))(v17, v19);
    goto LABEL_23;
  }
  if (v22)
  {
LABEL_23:
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Com_Apple_Siri_Product_Proto_PromptContext?);
    memcpy(v17, v18, *(void *)(*(void *)(v23 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, char *, uint64_t))(v20 + 16))(v17, v18, v19);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  return a1;
}

uint64_t initializeWithTake for PommesContext(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v7 = a3[7];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = a3[9];
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  *(void *)(a1 + v11) = *(void *)(a2 + v11);
  uint64_t v12 = a3[10];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (const void *)(a2 + v12);
  uint64_t v15 = type metadata accessor for Com_Apple_Siri_Product_Proto_PromptContext();
  uint64_t v16 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
  {
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Com_Apple_Siri_Product_Proto_PromptContext?);
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v16 + 32))(v13, v14, v15);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  }
  return a1;
}

uint64_t assignWithTake for PommesContext(uint64_t a1, uint64_t a2, int *a3)
{
  unint64_t v6 = *(void *)(a1 + 8);
  if ((v6 >> 60) <= 0xB && ((1 << (v6 >> 60)) & 0x888) != 0) {
    goto LABEL_5;
  }
  unint64_t v22 = *(void *)(a2 + 8);
  if ((v22 >> 60) <= 0xB && ((1 << (v22 >> 60)) & 0x888) != 0)
  {
    outlined destroy of ClientExperienceSignals?(a1, &demangling cache variable for type metadata for (conversationContext: Data?));
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_6;
  }
  if (v6 >> 60 == 15) {
    goto LABEL_5;
  }
  if (v22 >> 60 == 15)
  {
    outlined destroy of Data(a1);
    goto LABEL_5;
  }
  uint64_t v24 = *(void *)a1;
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v22;
  outlined consume of Data._Representation(v24, v6);
LABEL_6:
  uint64_t v8 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v8;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v9 = a3[7];
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[10];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (void *)(a2 + v13);
  uint64_t v16 = type metadata accessor for Com_Apple_Siri_Product_Proto_PromptContext();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v17 + 48);
  LODWORD(v11) = v18(v14, 1, v16);
  int v19 = v18(v15, 1, v16);
  if (!v11)
  {
    if (!v19)
    {
      (*(void (**)(void *, void *, uint64_t))(v17 + 40))(v14, v15, v16);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v17 + 8))(v14, v16);
    goto LABEL_11;
  }
  if (v19)
  {
LABEL_11:
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Com_Apple_Siri_Product_Proto_PromptContext?);
    memcpy(v14, v15, *(void *)(*(void *)(v20 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v17 + 32))(v14, v15, v16);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  return a1;
}

uint64_t getEnumTagSinglePayload for PommesContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_25C93BB8C);
}

uint64_t sub_25C93BB8C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + a3[7];
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v12 = *(void *)(a1 + a3[8]);
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
  else
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Com_Apple_Siri_Product_Proto_PromptContext?);
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
    uint64_t v15 = v13;
    uint64_t v16 = a1 + a3[10];
    return v14(v16, a2, v15);
  }
}

uint64_t storeEnumTagSinglePayload for PommesContext(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_25C93BCD4);
}

uint64_t sub_25C93BCD4(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + a4[7];
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + a4[8]) = (a2 - 1);
  }
  else
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Com_Apple_Siri_Product_Proto_PromptContext?);
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
    uint64_t v15 = v13;
    uint64_t v16 = a1 + a4[10];
    return v14(v16, a2, a2, v15);
  }
  return result;
}

void type metadata completion function for PommesContext()
{
  type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent();
  if (v0 <= 0x3F)
  {
    type metadata accessor for Com_Apple_Siri_Product_Proto_PromptContext?();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void type metadata accessor for Com_Apple_Siri_Product_Proto_PromptContext?()
{
  if (!lazy cache variable for type metadata for Com_Apple_Siri_Product_Proto_PromptContext?)
  {
    type metadata accessor for Com_Apple_Siri_Product_Proto_PromptContext();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for Com_Apple_Siri_Product_Proto_PromptContext?);
    }
  }
}

uint64_t *destroy for PommesContext.Source(uint64_t *result)
{
  unint64_t v1 = result[1];
  BOOL v2 = ((4 * (v1 >> 60)) & 0xC | ((v1 >> 60) >> 2)) != 0xF && ((4 * (v1 >> 60)) & 0xC) != 0;
  if (v1 >> 60 != 15 && !v2) {
    return (uint64_t *)outlined consume of Data._Representation(*result, v1);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for PommesContext.Source(uint64_t *a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if (4 * ((v3 >> 60) & 3)) {
    BOOL v4 = (((v3 >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((v3 >> 60) & 3))) == 15;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4 && v3 >> 60 != 15)
  {
    uint64_t v5 = *(void *)a2;
    outlined copy of Data._Representation(*(void *)a2, *(void *)(a2 + 8));
    *a1 = v5;
    a1[1] = v3;
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  return a1;
}

uint64_t *assignWithCopy for PommesContext.Source(uint64_t *a1, uint64_t *a2)
{
  unint64_t v4 = a1[1];
  unint64_t v5 = a2[1];
  BOOL v6 = ((4 * (v5 >> 60)) & 0xC | ((v5 >> 60) >> 2)) == 0xF || ((4 * (v5 >> 60)) & 0xC) == 0;
  if (4 * ((v4 >> 60) & 3)) {
    BOOL v7 = (((v4 >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((v4 >> 60) & 3))) == 15;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (!v6)
    {
      if (v4 >> 60 != 15) {
        outlined consume of Data._Representation(*a1, v4);
      }
      goto LABEL_18;
    }
    if (v4 >> 60 != 15)
    {
      if (v5 >> 60 != 15)
      {
        uint64_t v10 = *a2;
        outlined copy of Data._Representation(v10, v5);
        uint64_t v11 = *a1;
        unint64_t v12 = a1[1];
        *a1 = v10;
        a1[1] = v5;
        outlined consume of Data._Representation(v11, v12);
        return a1;
      }
      outlined destroy of Data((uint64_t)a1);
      goto LABEL_18;
    }
  }
  else if (!v6)
  {
LABEL_18:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v5 >> 60 == 15) {
    goto LABEL_18;
  }
  uint64_t v8 = *a2;
  outlined copy of Data._Representation(v8, v5);
  *a1 = v8;
  a1[1] = v5;
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t *assignWithTake for PommesContext.Source(uint64_t *a1, uint64_t *a2)
{
  unint64_t v4 = a1[1];
  if (4 * ((v4 >> 60) & 3)) {
    BOOL v5 = (((v4 >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((v4 >> 60) & 3))) == 15;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    unint64_t v6 = a2[1];
    if (4 * ((v6 >> 60) & 3)) {
      BOOL v7 = (((v6 >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((v6 >> 60) & 3))) == 15;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
      if (v4 >> 60 != 15)
      {
        if (v6 >> 60 != 15)
        {
          uint64_t v9 = *a1;
          *a1 = *a2;
          a1[1] = v6;
          outlined consume of Data._Representation(v9, v4);
          return a1;
        }
        outlined destroy of Data((uint64_t)a1);
      }
    }
    else if (v4 >> 60 != 15)
    {
      outlined consume of Data._Representation(*a1, v4);
    }
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
  return a1;
}

uint64_t getEnumTagSinglePayload for PommesContext.Source(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 9 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 9);
  }
  uint64_t v3 = *(void *)(a1 + 8) >> 60;
  BOOL v4 = ((4 * v3) & 0xC) == 0;
  unsigned int v5 = ((4 * v3) & 0xC | (v3 >> 2)) ^ 0xF;
  if (v4) {
    unsigned int v5 = 0;
  }
  if (v5 >= 4) {
    return v5 - 3;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for PommesContext.Source(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 8)
  {
    *(void *)__n128 result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)__n128 result = a2 - 9;
    if (a3 >= 9) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 9) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2)
    {
      *(void *)__n128 result = 0;
      *(void *)(result + 8) = (unint64_t)((4 * (12 - a2)) | ((12 - a2) >> 2)) << 60;
    }
  }
  return result;
}

uint64_t getEnumTag for PommesContext.Source(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8) >> 60;
  BOOL v2 = ((4 * v1) & 0xC) == 0;
  unsigned int v3 = ((4 * v1) & 0xC | (v1 >> 2)) ^ 0xF;
  if (v2) {
    return 0;
  }
  else {
    return v3;
  }
}

void *destructiveInjectEnumTag for PommesContext.Source(void *result, unsigned int a2)
{
  if (a2 > 0xB)
  {
    *__n128 result = a2 - 12;
    result[1] = 0;
  }
  else if (a2)
  {
    *__n128 result = 0;
    result[1] = (unint64_t)((4 * (a2 ^ 0xF)) | ((a2 ^ 0xF) >> 2)) << 60;
  }
  return result;
}

ValueMetadata *type metadata accessor for PommesContext.Source()
{
  return &type metadata for PommesContext.Source;
}

uint64_t getEnumTagSinglePayload for PommesContext.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PommesContext.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 6;
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
        JUMPOUT(0x25C93C410);
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
          *__n128 result = a2 + 6;
        break;
    }
  }
  return result;
}

void *type metadata accessor for PommesContext.CodingKeys()
{
  return &unk_2709F6160;
}

uint64_t getEnumTagSinglePayload for PommesContext.Source.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
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
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PommesContext.Source.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *__n128 result = a2 + 3;
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
        JUMPOUT(0x25C93C5A4);
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
          *__n128 result = a2 + 3;
        break;
    }
  }
  return result;
}

void *type metadata accessor for PommesContext.Source.CodingKeys()
{
  return &unk_2709F61F0;
}

unsigned char *storeEnumTagSinglePayload for PommesContext.Source.PegasusResponseCodingKeys(unsigned char *result, int a2, int a3)
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
        *__n128 result = a2;
        return result;
      case 2:
        *(_WORD *)__n128 result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)__n128 result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *__n128 result = 0;
      break;
    case 2:
      *(_WORD *)__n128 result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x25C93C678);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

void *type metadata accessor for PommesContext.Source.PegasusResponseCodingKeys()
{
  return &unk_2709F6280;
}

void *type metadata accessor for PommesContext.Source.PluginDefinedCodingKeys()
{
  return &unk_2709F62A0;
}

void *type metadata accessor for PommesContext.Source.ModalityTranslatedCodingKeys()
{
  return &unk_2709F62C0;
}

void *type metadata accessor for PommesContext.Source.UnknownCodingKeys()
{
  return &unk_2709F62E0;
}

uint64_t specialized PommesContext.Source.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x5273757361676570 && a2 == 0xEF65736E6F707365;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65446E6967756C70 && a2 == 0xED000064656E6966 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000025C9838C0 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6E776F6E6B6E75 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t specialized PommesContext.Source.PegasusResponseCodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000013 && a2 == 0x800000025C981F70)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

uint64_t specialized PommesContext.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x656372756F73 && a2 == 0xE600000000000000;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E69616D6F64 && a2 == 0xE600000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000025C981D90 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x64657265646E6572 && a2 == 0xED00007374786554 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x800000025C981D40 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6F4374706D6F7270 && a2 == 0xED0000747865746ELL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000025C9838E0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 6;
    }
    else {
      return 7;
    }
  }
}

const char *FeatureFlag.feature.getter()
{
  outlined init with take of FeatureFlag(v0, (uint64_t)&v2);
  if (v6) {
    return specialized FeatureFlag.domainLocaleFeature(_:_:)(v2, v3, v4, v5);
  }
  else {
    return specialized FeatureFlag.domainFeature(for:)(v2, v3);
  }
}

uint64_t outlined init with take of FeatureFlag(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(unsigned char *)(a2 + 32) = *((unsigned char *)a1 + 32);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t FeatureFlag.isOn.getter()
{
  v3[3] = &type metadata for FeatureFlag;
  v3[4] = lazy protocol witness table accessor for type FeatureFlag and conformance FeatureFlag();
  v3[0] = swift_allocObject();
  outlined init with take of FeatureFlag(v0, v3[0] + 16);
  outlined retain of FeatureFlag((uint64_t)v0);
  char v1 = isFeatureEnabled(_:)();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
  return v1 & 1;
}

const char *FeatureFlag.domain.getter()
{
  return "Pommes";
}

const char *protocol witness for FeatureFlagsKey.domain.getter in conformance FeatureFlag()
{
  return "Pommes";
}

const char *protocol witness for FeatureFlagsKey.feature.getter in conformance FeatureFlag()
{
  uint64_t v1 = *(void *)v0;
  uint64_t v2 = *(void *)(v0 + 8);
  if (*(unsigned char *)(v0 + 32)) {
    return specialized FeatureFlag.domainLocaleFeature(_:_:)(v1, v2, *(void *)(v0 + 16), *(void **)(v0 + 24));
  }
  else {
    return specialized FeatureFlag.domainFeature(for:)(v1, v2);
  }
}

const char *specialized FeatureFlag.domainLocaleFeature(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a4) {
    uint64_t v6 = a3;
  }
  else {
    uint64_t v6 = 0;
  }
  if (a4) {
    BOOL v7 = a4;
  }
  else {
    BOOL v7 = (void *)0xE000000000000000;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v8._uint64_t countAndFlagsBits = 95;
  v8._object = (void *)0xE100000000000000;
  String.append(_:)(v8);
  v9._uint64_t countAndFlagsBits = v6;
  v9._object = v7;
  String.append(_:)(v9);
  if (a1 == 7300455 && a2 == 0xE300000000000000
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0
    || a1 == 1936744813 && a2 == 0xE400000000000000
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    if (v6 == 0x524B5F6F6BLL && v7 == (void *)0xE500000000000000)
    {
      swift_bridgeObjectRelease();
LABEL_17:
      swift_bridgeObjectRelease();
      return "geo_search_ko_KR";
    }
    char v10 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v10) {
      goto LABEL_17;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  if (a1 == 0x7A5F7374726F7073 && a2 == 0xEC0000004E435F68
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return "sports_zh_CN";
  }
  else
  {
    uint64_t v11 = "edutainment_zh_CN";
    if (a1 == 0xD000000000000011 && a2 == 0x800000025C9839D0
      || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
    }
    else if (a1 == 0x687A5F636973756DLL && a2 == 0xEB000000004E435FLL)
    {
      swift_bridgeObjectRelease();
      return "music_zh_CN";
    }
    else
    {
      char v13 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if (v13) {
        return "music_zh_CN";
      }
      else {
        return "";
      }
    }
  }
  return v11;
}

const char *specialized FeatureFlag.domainFeature(for:)(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x73676E6974697277 && a2 == 0xE800000000000000
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    return "writings_search";
  }
  if (a1 == 7300455 && a2 == 0xE300000000000000
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0
    || a1 == 1936744813 && a2 == 0xE400000000000000
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    return "geo_search";
  }
  if (a1 == 0x6D6E696174756465 && a2 == 0xEB00000000746E65
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    return "edutainment_search";
  }
  if (a1 == 0x74616C736E617274 && a2 == 0xEB000000006E6F69
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    return "translation_search";
  }
  if (a1 == 0x636E75616C707061 && a2 == 0xE900000000000068) {
    return "applaunch_search";
  }
  char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
  BOOL v7 = a1 == 1936748641 && a2 == 0xE400000000000000;
  __n128 result = "applaunch_search";
  if ((v5 & 1) == 0 && !v7)
  {
    if (_stringCompareWithSmolCheck(_:_:expecting:)()) {
      return "applaunch_search";
    }
    __n128 result = "emergency_search";
    if (a1 != 0x636E656772656D65 || a2 != 0xE900000000000079)
    {
      if (_stringCompareWithSmolCheck(_:_:expecting:)()) {
        return "emergency_search";
      }
      else {
        return "";
      }
    }
  }
  return result;
}

uint64_t sub_25C93D880()
{
  outlined consume of FeatureFlag(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(unsigned char *)(v0 + 48));

  return MEMORY[0x270FA0238](v0, 49, 7);
}

uint64_t outlined retain of FeatureFlag(uint64_t a1)
{
  return a1;
}

uint64_t outlined copy of FeatureFlag(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5) {
    swift_bridgeObjectRetain();
  }

  return swift_bridgeObjectRetain();
}

uint64_t destroy for FeatureFlag(uint64_t a1)
{
  return outlined consume of FeatureFlag(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned char *)(a1 + 32));
}

uint64_t initializeWithCopy for FeatureFlag(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  outlined copy of FeatureFlag(*(void *)a2, v4, v5, v6, v7);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for FeatureFlag(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  outlined copy of FeatureFlag(*(void *)a2, v4, v5, v6, v7);
  uint64_t v8 = *(void *)a1;
  uint64_t v9 = *(void *)(a1 + 8);
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = *(void *)(a1 + 24);
  char v12 = *(unsigned char *)(a1 + 32);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  outlined consume of FeatureFlag(v8, v9, v10, v11, v12);
  return a1;
}

uint64_t assignWithTake for FeatureFlag(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 32);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  char v8 = *(unsigned char *)(a1 + 32);
  long long v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v9;
  *(unsigned char *)(a1 + 32) = v3;
  outlined consume of FeatureFlag(v4, v6, v5, v7, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for FeatureFlag(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for FeatureFlag(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 32) = -(char)a2;
    }
  }
  return result;
}

uint64_t destructiveInjectEnumTag for FeatureFlag(uint64_t result, char a2)
{
  *(unsigned char *)(result + 32) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for FeatureFlag()
{
  return &type metadata for FeatureFlag;
}

ValueMetadata *type metadata accessor for ParsecAlias()
{
  return &type metadata for ParsecAlias;
}

uint64_t AppLaunchExperience.appsClientComponent.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC20SiriInformationTypes19AppLaunchExperience_appsClientComponent;
  uint64_t v4 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AppsClientComponent();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t AppLaunchExperience.__allocating_init(pluginId:appsClientComponent:queryConfidenceScore:userDialogAct:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  uint64_t v22 = a2;
  uint64_t v10 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  char v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AppsClientComponent();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, a3, v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a4, v10);
  id v18 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for PommesRenderOptions(0)), sel_init);
  uint64_t v19 = (*(uint64_t (**)(uint64_t, uint64_t, char *, char *, id, double))(v5 + 336))(a1, v22, v17, v13, v18, a5);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a4, v10);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a3, v14);
  return v19;
}

id AppLaunchExperience.__allocating_init(pluginId:appsClientComponent:queryConfidenceScore:userDialogAct:renderOptions:)(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, uint64_t a5, double a6)
{
  id v13 = objc_allocWithZone(v6);
  return AppLaunchExperience.init(pluginId:appsClientComponent:queryConfidenceScore:userDialogAct:renderOptions:)(a1, a2, a3, a4, a5, a6);
}

id AppLaunchExperience.init(pluginId:appsClientComponent:queryConfidenceScore:userDialogAct:renderOptions:)(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, uint64_t a5, double a6)
{
  uint64_t v30 = a5;
  uint64_t v31 = a4;
  uint64_t v29 = a3;
  uint64_t v26 = a1;
  uint64_t v27 = a2;
  uint64_t v9 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = &v6[OBJC_IVAR____TtC20SiriInformationTypes19AppLaunchExperience_appsClientComponent];
  uint64_t v28 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AppsClientComponent();
  uint64_t v18 = *(void *)(v28 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v17, a3, v28);
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  v19(v16, (uint64_t)v31, v13);
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, *MEMORY[0x263F5CA28], v9);
  *(void *)&v6[OBJC_IVAR____TtC21SiriInformationSearch10Experience_associatedEntities] = MEMORY[0x263F8EE78];
  uint64_t v20 = &v6[OBJC_IVAR____TtC21SiriInformationSearch10Experience_pluginIdentifier];
  uint64_t v21 = v27;
  *(void *)uint64_t v20 = v26;
  *((void *)v20 + 1) = v21;
  *(double *)&v6[OBJC_IVAR____TtC21SiriInformationSearch10Experience_queryConfidence] = a6;
  v19(&v6[OBJC_IVAR____TtC21SiriInformationSearch10Experience_userDialogAct], (uint64_t)v16, v13);
  *(void *)&v6[OBJC_IVAR____TtC21SiriInformationSearch10Experience_renderOptions] = v30;
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(&v6[OBJC_IVAR____TtC21SiriInformationSearch10Experience_intent], v12, v9);
  uint64_t v22 = (objc_class *)type metadata accessor for Experience(0);
  v32.receiver = v6;
  v32.super_class = v22;
  id v23 = objc_msgSendSuper2(&v32, sel_init);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  uint64_t v24 = *(void (**)(char *, uint64_t))(v14 + 8);
  v24(v16, v13);
  v24(v31, v13);
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v29, v28);
  return v23;
}

id AppLaunchExperience.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return AppLaunchExperience.init(coder:)(a1);
}

id AppLaunchExperience.init(coder:)(void *a1)
{
  uint64_t v3 = type metadata accessor for BinaryDecodingOptions();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v4 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AppsClientComponent();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for NSData();
  id v8 = v1;
  uint64_t v9 = NSCoder.decodeObject<A>(of:forKey:)();
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    static Data._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v21 = 0;
    long long v19 = 0u;
    long long v20 = 0u;
    BinaryDecodingOptions.init()();
    lazy protocol witness table accessor for type Apple_Parsec_Siri_V2alpha_AppsClientComponent and conformance Apple_Parsec_Siri_V2alpha_AppsClientComponent();
    Message.init(serializedData:extensions:partial:options:)();
    (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))((uint64_t)v8 + OBJC_IVAR____TtC20SiriInformationTypes19AppLaunchExperience_appsClientComponent, v7, v4);

    id v15 = Experience.init(coder:)(a1);
    id v16 = v15;

    if (v15) {
  }
    }
  else
  {

    if (one-time initialization token for pommes != -1) {
      swift_once();
    }
    uint64_t v11 = type metadata accessor for Logger();
    __swift_project_value_buffer(v11, (uint64_t)static Logger.pommes);
    uint64_t v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_25C8FE000, v12, v13, "AppLaunchExperience cannot be decoded", v14, 2u);
      MEMORY[0x261199590](v14, -1, -1);
    }

    type metadata accessor for AppLaunchExperience();
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v15;
}

uint64_t type metadata accessor for AppLaunchExperience()
{
  uint64_t result = type metadata singleton initialization cache for AppLaunchExperience;
  if (!type metadata singleton initialization cache for AppLaunchExperience) {
    return swift_getSingletonMetadata();
  }
  return result;
}

Swift::Void __swiftcall AppLaunchExperience.encode(with:)(NSCoder with)
{
  type metadata accessor for Apple_Parsec_Siri_V2alpha_AppsClientComponent();
  lazy protocol witness table accessor for type Apple_Parsec_Siri_V2alpha_AppsClientComponent and conformance Apple_Parsec_Siri_V2alpha_AppsClientComponent();
  uint64_t v2 = Message.serializedData(partial:)();
  unint64_t v4 = v3;
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data._Representation(v2, v4);
  uint64_t v6 = (void *)MEMORY[0x261198B80](0xD000000000000013, 0x800000025C983A10);
  [(objc_class *)with.super.isa encodeObject:isa forKey:v6];

  Experience.encode(with:)(with);
}

void AppLaunchExperience.__allocating_init(pluginId:queryConfidence:)()
{
}

void AppLaunchExperience.init(pluginId:queryConfidence:)()
{
}

void AppLaunchExperience.__allocating_init(pluginId:queryConfidence:userDialogAct:)()
{
}

void AppLaunchExperience.init(pluginId:queryConfidence:userDialogAct:)()
{
}

void AppLaunchExperience.__allocating_init(pluginId:queryConfidence:userDialogAct:renderOptions:)()
{
}

void AppLaunchExperience.init(pluginId:queryConfidence:userDialogAct:renderOptions:)()
{
}

void AppLaunchExperience.__allocating_init(pluginId:queryConfidence:userDialogAct:intent:)()
{
}

void AppLaunchExperience.init(pluginId:queryConfidence:userDialogAct:intent:)()
{
}

void AppLaunchExperience.__allocating_init(pluginId:queryConfidence:userDialogAct:renderOptions:intent:)()
{
}

void AppLaunchExperience.init(pluginId:queryConfidence:userDialogAct:renderOptions:intent:)()
{
}

uint64_t AppLaunchExperience.__ivar_destroyer()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC20SiriInformationTypes19AppLaunchExperience_appsClientComponent;
  uint64_t v2 = type metadata accessor for Apple_Parsec_Siri_V2alpha_AppsClientComponent();
  unint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(v1, v2);
}

id AppLaunchExperience.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppLaunchExperience();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t lazy protocol witness table accessor for type Apple_Parsec_Siri_V2alpha_AppsClientComponent and conformance Apple_Parsec_Siri_V2alpha_AppsClientComponent()
{
  unint64_t result = lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_AppsClientComponent and conformance Apple_Parsec_Siri_V2alpha_AppsClientComponent;
  if (!lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_AppsClientComponent and conformance Apple_Parsec_Siri_V2alpha_AppsClientComponent)
  {
    type metadata accessor for Apple_Parsec_Siri_V2alpha_AppsClientComponent();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_AppsClientComponent and conformance Apple_Parsec_Siri_V2alpha_AppsClientComponent);
  }
  return result;
}

uint64_t ObjC metadata update function for AppLaunchExperience()
{
  return type metadata accessor for AppLaunchExperience();
}

uint64_t type metadata completion function for AppLaunchExperience()
{
  uint64_t result = type metadata accessor for Apple_Parsec_Siri_V2alpha_AppsClientComponent();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for AppLaunchExperience(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AppLaunchExperience);
}

uint64_t dispatch thunk of AppLaunchExperience.__allocating_init(pluginId:appsClientComponent:queryConfidenceScore:userDialogAct:renderOptions:)()
{
  return (*(uint64_t (**)(void))(v0 + 336))();
}

id AFPreferences.siriLanguageCode.getter()
{
  id v1 = objc_msgSend(v0, sel_languageCode);
  if (v1)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    lazy protocol witness table accessor for type String and conformance String();
    id v1 = (id)StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
    swift_bridgeObjectRelease();
  }
  return v1;
}

SiriInformationTypes::WarmupComponent_optional __swiftcall WarmupComponent.init(rawValue:)(Swift::Int rawValue)
{
  if (rawValue == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (!rawValue) {
    char v2 = 0;
  }
  *id v1 = v2;
  return (SiriInformationTypes::WarmupComponent_optional)rawValue;
}

uint64_t WarmupComponent.rawValue.getter()
{
  return *v0;
}

unint64_t lazy protocol witness table accessor for type WarmupComponent and conformance WarmupComponent()
{
  unint64_t result = lazy protocol witness table cache variable for type WarmupComponent and conformance WarmupComponent;
  if (!lazy protocol witness table cache variable for type WarmupComponent and conformance WarmupComponent)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type WarmupComponent and conformance WarmupComponent);
  }
  return result;
}

void *protocol witness for RawRepresentable.init(rawValue:) in conformance WarmupComponent@<X0>(void *result@<X0>, char *a2@<X8>)
{
  if (*result == 1) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (*result) {
    char v3 = v2;
  }
  else {
    char v3 = 0;
  }
  *a2 = v3;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance WarmupComponent(void *a1@<X8>)
{
  *a1 = *v1;
}

unsigned char *storeEnumTagSinglePayload for WarmupComponent(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
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
        JUMPOUT(0x25C93EFD4);
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
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WarmupComponent()
{
  return &type metadata for WarmupComponent;
}

uint64_t PhoneCallExperience.phoneCall.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC21SiriInformationSearch19PhoneCallExperience_phoneCall;
  uint64_t v4 = type metadata accessor for Apple_Parsec_Siri_V2alpha_PhoneCallBuilderParams();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t PhoneCallExperience.__allocating_init(phoneCall:queryConfidenceScore:)(uint64_t a1, double a2)
{
  uint64_t v5 = type metadata accessor for Apple_Parsec_Siri_V2alpha_PhoneCallBuilderParams();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
  id v9 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for PommesRenderOptions(0)), sel_init);
  uint64_t v10 = (*(uint64_t (**)(char *, id, double))(v2 + 336))(v8, v9, a2);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
  return v10;
}

id PhoneCallExperience.__allocating_init(phoneCall:queryConfidenceScore:renderOptions:)(uint64_t a1, uint64_t a2, double a3)
{
  id v7 = objc_allocWithZone(v3);
  return PhoneCallExperience.init(phoneCall:queryConfidenceScore:renderOptions:)(a1, a2, a3);
}

id PhoneCallExperience.init(phoneCall:queryConfidenceScore:renderOptions:)(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v22 = a1;
  uint64_t v23 = a2;
  uint64_t v5 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_log_type_t v13 = &v3[OBJC_IVAR____TtC21SiriInformationSearch19PhoneCallExperience_phoneCall];
  uint64_t v14 = type metadata accessor for Apple_Parsec_Siri_V2alpha_PhoneCallBuilderParams();
  uint64_t v15 = *(void *)(v14 - 8);
  id v16 = v13;
  uint64_t v17 = v22;
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v16, v22, v14);
  Siri_Nlu_External_UserDialogAct.init()();
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F5CA28], v5);
  *(void *)&v3[OBJC_IVAR____TtC21SiriInformationSearch10Experience_associatedEntities] = MEMORY[0x263F8EE78];
  uint64_t v18 = &v3[OBJC_IVAR____TtC21SiriInformationSearch10Experience_pluginIdentifier];
  *(void *)uint64_t v18 = 0x73757361676570;
  *((void *)v18 + 1) = 0xE700000000000000;
  *(double *)&v3[OBJC_IVAR____TtC21SiriInformationSearch10Experience_queryConfidence] = a3;
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(&v3[OBJC_IVAR____TtC21SiriInformationSearch10Experience_userDialogAct], v12, v9);
  *(void *)&v3[OBJC_IVAR____TtC21SiriInformationSearch10Experience_renderOptions] = v23;
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(&v3[OBJC_IVAR____TtC21SiriInformationSearch10Experience_intent], v8, v5);
  long long v19 = (objc_class *)type metadata accessor for Experience(0);
  v24.receiver = v3;
  v24.super_class = v19;
  id v20 = objc_msgSendSuper2(&v24, sel_init);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v17, v14);
  return v20;
}

BOOL PhoneCallExperience.CodingKeys.init(rawValue:)(Swift::String string)
{
  object = string._object;
  v2._uint64_t countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of PhoneCallExperience.CodingKeys.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  return v3 != 0;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance PhoneCallExperience.CodingKeys()
{
  uint64_t v0 = specialized PhoneCallExperience.CodingKeys.rawValue.getter();
  uint64_t v2 = v1;
  if (v0 == specialized PhoneCallExperience.CodingKeys.rawValue.getter() && v2 == v3) {
    char v4 = 1;
  }
  else {
    char v4 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4 & 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance PhoneCallExperience.CodingKeys()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance PhoneCallExperience.CodingKeys()
{
  specialized PhoneCallExperience.CodingKeys.rawValue.getter();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance PhoneCallExperience.CodingKeys()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance PhoneCallExperience.CodingKeys@<X0>(Swift::String *a1@<X0>, BOOL *a2@<X8>)
{
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of protocol witness for RawRepresentable.init(rawValue:) in conformance PhoneCallExperience.CodingKeys, *a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3 != 0;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance PhoneCallExperience.CodingKeys@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = specialized PhoneCallExperience.CodingKeys.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

id PhoneCallExperience.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return PhoneCallExperience.init(coder:)(a1);
}

id PhoneCallExperience.init(coder:)(void *a1)
{
  uint64_t v3 = type metadata accessor for BinaryDecodingOptions();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v4 = type metadata accessor for Apple_Parsec_Siri_V2alpha_PhoneCallBuilderParams();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = &v18[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for NSData();
  id v8 = v1;
  uint64_t v9 = NSCoder.decodeObject<A>(of:forKey:)();
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    static Data._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v19 = 0;
    memset(&v18[32], 0, 32);
    BinaryDecodingOptions.init()();
    lazy protocol witness table accessor for type Apple_Parsec_Siri_V2alpha_PhoneCallBuilderParams and conformance Apple_Parsec_Siri_V2alpha_PhoneCallBuilderParams();
    Message.init(serializedData:extensions:partial:options:)();
    (*(void (**)(uint64_t, unsigned char *, uint64_t))(v5 + 32))((uint64_t)v8 + OBJC_IVAR____TtC21SiriInformationSearch19PhoneCallExperience_phoneCall, v7, v4);

    id v15 = Experience.init(coder:)(a1);
    id v16 = v15;

    if (v15) {
  }
    }
  else
  {

    if (one-time initialization token for pommes != -1) {
      swift_once();
    }
    uint64_t v11 = type metadata accessor for Logger();
    __swift_project_value_buffer(v11, (uint64_t)static Logger.pommes);
    uint64_t v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_25C8FE000, v12, v13, "Failed to extract phoneCall data", v14, 2u);
      MEMORY[0x261199590](v14, -1, -1);
    }

    type metadata accessor for PhoneCallExperience();
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v15;
}

Swift::Void __swiftcall PhoneCallExperience.encode(with:)(NSCoder with)
{
  type metadata accessor for Apple_Parsec_Siri_V2alpha_PhoneCallBuilderParams();
  lazy protocol witness table accessor for type Apple_Parsec_Siri_V2alpha_PhoneCallBuilderParams and conformance Apple_Parsec_Siri_V2alpha_PhoneCallBuilderParams();
  uint64_t v2 = Message.serializedData(partial:)();
  unint64_t v4 = v3;
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  uint64_t v6 = (void *)MEMORY[0x261198B80](0x6C6143656E6F6870, 0xE90000000000006CLL);
  [(objc_class *)with.super.isa encodeObject:isa forKey:v6];

  outlined consume of Data._Representation(v2, v4);
  Experience.encode(with:)(with);
}

void PhoneCallExperience.__allocating_init(pluginId:queryConfidence:)()
{
}

void PhoneCallExperience.init(pluginId:queryConfidence:)()
{
}

void PhoneCallExperience.__allocating_init(pluginId:queryConfidence:userDialogAct:)()
{
}

void PhoneCallExperience.init(pluginId:queryConfidence:userDialogAct:)()
{
}

void PhoneCallExperience.__allocating_init(pluginId:queryConfidence:userDialogAct:renderOptions:)()
{
}

void PhoneCallExperience.init(pluginId:queryConfidence:userDialogAct:renderOptions:)()
{
}

void PhoneCallExperience.__allocating_init(pluginId:queryConfidence:userDialogAct:intent:)()
{
}

void PhoneCallExperience.init(pluginId:queryConfidence:userDialogAct:intent:)()
{
}

void PhoneCallExperience.__allocating_init(pluginId:queryConfidence:userDialogAct:renderOptions:intent:)()
{
}

void PhoneCallExperience.init(pluginId:queryConfidence:userDialogAct:renderOptions:intent:)()
{
}

uint64_t PhoneCallExperience.__ivar_destroyer()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC21SiriInformationSearch19PhoneCallExperience_phoneCall;
  uint64_t v2 = type metadata accessor for Apple_Parsec_Siri_V2alpha_PhoneCallBuilderParams();
  unint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(v1, v2);
}

id PhoneCallExperience.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PhoneCallExperience();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t specialized PhoneCallExperience.CodingKeys.rawValue.getter()
{
  return 0x6C6143656E6F6870;
}

uint64_t type metadata accessor for PhoneCallExperience()
{
  uint64_t result = type metadata singleton initialization cache for PhoneCallExperience;
  if (!type metadata singleton initialization cache for PhoneCallExperience) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Apple_Parsec_Siri_V2alpha_PhoneCallBuilderParams and conformance Apple_Parsec_Siri_V2alpha_PhoneCallBuilderParams()
{
  unint64_t result = lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_PhoneCallBuilderParams and conformance Apple_Parsec_Siri_V2alpha_PhoneCallBuilderParams;
  if (!lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_PhoneCallBuilderParams and conformance Apple_Parsec_Siri_V2alpha_PhoneCallBuilderParams)
  {
    type metadata accessor for Apple_Parsec_Siri_V2alpha_PhoneCallBuilderParams();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Apple_Parsec_Siri_V2alpha_PhoneCallBuilderParams and conformance Apple_Parsec_Siri_V2alpha_PhoneCallBuilderParams);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type PhoneCallExperience.CodingKeys and conformance PhoneCallExperience.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type PhoneCallExperience.CodingKeys and conformance PhoneCallExperience.CodingKeys;
  if (!lazy protocol witness table cache variable for type PhoneCallExperience.CodingKeys and conformance PhoneCallExperience.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PhoneCallExperience.CodingKeys and conformance PhoneCallExperience.CodingKeys);
  }
  return result;
}

uint64_t ObjC metadata update function for PhoneCallExperience()
{
  return type metadata accessor for PhoneCallExperience();
}

uint64_t type metadata completion function for PhoneCallExperience()
{
  uint64_t result = type metadata accessor for Apple_Parsec_Siri_V2alpha_PhoneCallBuilderParams();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for PhoneCallExperience(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PhoneCallExperience);
}

uint64_t dispatch thunk of PhoneCallExperience.__allocating_init(phoneCall:queryConfidenceScore:renderOptions:)()
{
  return (*(uint64_t (**)(void))(v0 + 336))();
}

unsigned char *storeEnumTagSinglePayload for PhoneCallExperience.CodingKeys(unsigned char *result, int a2, int a3)
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
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x25C9404C8);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for PhoneCallExperience.CodingKeys()
{
  return &type metadata for PhoneCallExperience.CodingKeys;
}

uint64_t __DataStorage.init(bytes:length:copy:deallocator:offset:)()
{
  return MEMORY[0x270EEE618]();
}

uint64_t __DataStorage.init(bytes:length:)()
{
  return MEMORY[0x270EEE628]();
}

uint64_t __DataStorage._bytes.getter()
{
  return MEMORY[0x270EEE638]();
}

uint64_t __DataStorage.init(length:)()
{
  return MEMORY[0x270EEE648]();
}

uint64_t __DataStorage._length.getter()
{
  return MEMORY[0x270EEE658]();
}

uint64_t __DataStorage._offset.getter()
{
  return MEMORY[0x270EEE670]();
}

uint64_t type metadata accessor for __DataStorage()
{
  return MEMORY[0x270EEE688]();
}

uint64_t dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)()
{
  return MEMORY[0x270EEEA60]();
}

Swift::Void __swiftcall Data.LargeSlice.ensureUniqueReference()()
{
}

uint64_t type metadata accessor for Data.RangeReference()
{
  return MEMORY[0x270EF0070]();
}

uint64_t Data._Representation.replaceSubrange(_:with:count:)()
{
  return MEMORY[0x270EF0090]();
}

uint64_t Data._Representation.append(contentsOf:)()
{
  return MEMORY[0x270EF00B0]();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)MEMORY[0x270EF0120]();
}

Swift::String __swiftcall Data.base64EncodedString(options:)(NSDataBase64EncodingOptions options)
{
  uint64_t v1 = MEMORY[0x270EF0130](options);
  result._object = v2;
  result._uint64_t countAndFlagsBits = v1;
  return result;
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF0178]();
}

uint64_t Apple_Parsec_Siri_V2alpha_PegasusClientEventLog.pegasusDomainFlowStepLog.getter()
{
  return MEMORY[0x270F520B0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_PegasusClientEventLog.pegasusDomainUserSensitiveTier1Log.getter()
{
  return MEMORY[0x270F520B8]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_PegasusClientEventLog()
{
  return MEMORY[0x270F520C0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriCommandBuilder.siriCommandBuilderParams.getter()
{
  return MEMORY[0x270F520C8]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriCommandBuilder.OneOf_SiriCommandBuilderParams()
{
  return MEMORY[0x270F520D0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriCommandBuilder.sayIt.getter()
{
  return MEMORY[0x270F520D8]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriCommandBuilder()
{
  return MEMORY[0x270F520E8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.ResponseMetadata.domainName.getter()
{
  return MEMORY[0x270F52118]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.ResponseMetadata.pegasusClientEventLog.getter()
{
  return MEMORY[0x270F52120]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.ResponseMetadata.pegasusClientEventLogs.getter()
{
  return MEMORY[0x270F52128]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.ResponseMetadata()
{
  return MEMORY[0x270F52130]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.responseMetadata.getter()
{
  return MEMORY[0x270F52140]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent.init(rawValue:)()
{
  return MEMORY[0x270F52148]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent.rawValue.getter()
{
  return MEMORY[0x270F52150]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent()
{
  return MEMORY[0x270F52158]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.conversationContextBytes.getter()
{
  return MEMORY[0x270F52160]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse()
{
  return MEMORY[0x270F52168]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioItem()
{
  return MEMORY[0x270F52728]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_Context_ResultEntity()
{
  return MEMORY[0x270F528F0]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioItemType()
{
  return MEMORY[0x270F529A8]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_SageExperience()
{
  return MEMORY[0x270F52A08]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SayItComponent.dialogIdentifier.getter()
{
  return MEMORY[0x270F52A10]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SayItComponent.hasListenAfterSpeaking_p.getter()
{
  return MEMORY[0x270F52A18]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_SayItComponent()
{
  return MEMORY[0x270F52A20]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_PlaybackSignals()
{
  return MEMORY[0x270F52A78]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_MultiUserContext()
{
  return MEMORY[0x270F52AF8]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestion()
{
  return MEMORY[0x270F52B00]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioUnderstanding()
{
  return MEMORY[0x270F52BB0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_CatDialogComponent.catID.getter()
{
  return MEMORY[0x270F52BB8]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_CatDialogComponent()
{
  return MEMORY[0x270F52BC0]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_GeoClientComponent()
{
  return MEMORY[0x270F52BC8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SayItBuilderParams.dialogIdentifier.getter()
{
  return MEMORY[0x270F52BE0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SayItBuilderParams.hasListenAfterSpeaking_p.getter()
{
  return MEMORY[0x270F52BE8]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_SayItBuilderParams()
{
  return MEMORY[0x270F52BF0]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AppsClientComponent()
{
  return MEMORY[0x270F52C68]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_ExperienceComponent.OneOf_Component()
{
  return MEMORY[0x270F52C70]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ExperienceComponent.component.getter()
{
  return MEMORY[0x270F52C78]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_ExperienceComponent()
{
  return MEMORY[0x270F52C88]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioClientComponent.pegasusAudioType.getter()
{
  return MEMORY[0x270F52CD0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioClientComponent.understanding.getter()
{
  return MEMORY[0x270F52CD8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioClientComponent.internalSignals.getter()
{
  return MEMORY[0x270F52CE0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioClientComponent.playbackSignals.getter()
{
  return MEMORY[0x270F52CE8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioClientComponent.audioSearchResults.getter()
{
  return MEMORY[0x270F52CF0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioClientComponent.boltProxiedBundleID.getter()
{
  return MEMORY[0x270F52CF8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioClientComponent.systemExtensionBundleID.getter()
{
  return MEMORY[0x270F52D00]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioClientComponent.shouldPerformAppSelection.getter()
{
  return MEMORY[0x270F52D08]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioClientComponent.launchID.getter()
{
  return MEMORY[0x270F52D10]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioClientComponent()
{
  return MEMORY[0x270F52D20]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_VideoClientComponent()
{
  return MEMORY[0x270F52DA8]();
}

uint64_t type metadata accessor for Apple_Parsec_Responseframework_PatternComponent()
{
  return MEMORY[0x270F52E18]();
}

uint64_t Apple_Parsec_Siri_V2alpha_DelayedActionComponent.renderedDialog.getter()
{
  return MEMORY[0x270F52EE8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_DelayedActionComponent.hasRenderedDialog.getter()
{
  return MEMORY[0x270F52EF0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_DelayedActionComponent.siriCommandBuilder.getter()
{
  return MEMORY[0x270F52EF8]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_DelayedActionComponent()
{
  return MEMORY[0x270F52F00]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_PhoneCallBuilderParams()
{
  return MEMORY[0x270F52F38]();
}

uint64_t Apple_Parsec_Siri_V2alpha_RenderedDialogComponent.catCategory.getter()
{
  return MEMORY[0x270F52F48]();
}

uint64_t Apple_Parsec_Siri_V2alpha_RenderedDialogComponent.listenAfterSpeaking.getter()
{
  return MEMORY[0x270F52F50]();
}

uint64_t Apple_Parsec_Siri_V2alpha_RenderedDialogComponent.catID.getter()
{
  return MEMORY[0x270F52F58]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_RenderedDialogComponent()
{
  return MEMORY[0x270F52F70]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_SwitchProfileBuilderParams()
{
  return MEMORY[0x270F530C8]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_DeviceExpertClientComponent()
{
  return MEMORY[0x270F530E8]();
}

uint64_t Apple_Parsec_Responseframework_PatternDrivenExperience.patternComponents.getter()
{
  return MEMORY[0x270F530F0]();
}

uint64_t Apple_Parsec_Responseframework_PatternDrivenExperience.patternSiriPluginIdentifier.getter()
{
  return MEMORY[0x270F530F8]();
}

uint64_t type metadata accessor for Apple_Parsec_Responseframework_PatternDrivenExperience()
{
  return MEMORY[0x270F53100]();
}

uint64_t isFeatureEnabled(_:)()
{
  return MEMORY[0x270F28690]();
}

uint64_t type metadata accessor for Siri_Nlu_External_Span()
{
  return MEMORY[0x270F6A268]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UsoGraph()
{
  return MEMORY[0x270F6A370]();
}

uint64_t Siri_Nlu_External_UserDialogAct.init()()
{
  return MEMORY[0x270F6A860]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UserDialogAct()
{
  return MEMORY[0x270F6A868]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UserStatedTask()
{
  return MEMORY[0x270F6AAC8]();
}

uint64_t type metadata accessor for Siri_Nlu_External_LegacyNLContext.LegacyContextSource()
{
  return MEMORY[0x270F6AB68]();
}

uint64_t Siri_Nlu_External_LegacyNLContext.strictPrompt.setter()
{
  return MEMORY[0x270F6AB78]();
}

uint64_t Siri_Nlu_External_LegacyNLContext.renderedTexts.getter()
{
  return MEMORY[0x270F6AB80]();
}

uint64_t Siri_Nlu_External_LegacyNLContext.renderedTexts.setter()
{
  return MEMORY[0x270F6AB88]();
}

uint64_t Siri_Nlu_External_LegacyNLContext.dictationPrompt.setter()
{
  return MEMORY[0x270F6AB98]();
}

uint64_t Siri_Nlu_External_LegacyNLContext.previousDomainName.getter()
{
  return MEMORY[0x270F6ABB0]();
}

uint64_t Siri_Nlu_External_LegacyNLContext.previousDomainName.setter()
{
  return MEMORY[0x270F6ABB8]();
}

uint64_t Siri_Nlu_External_LegacyNLContext.legacyContextSource.setter()
{
  return MEMORY[0x270F6ABC8]();
}

uint64_t Siri_Nlu_External_LegacyNLContext.listenAfterSpeaking.getter()
{
  return MEMORY[0x270F6ABD0]();
}

uint64_t Siri_Nlu_External_LegacyNLContext.listenAfterSpeaking.setter()
{
  return MEMORY[0x270F6ABD8]();
}

uint64_t Siri_Nlu_External_LegacyNLContext.responseSemanticValues.getter()
{
  return MEMORY[0x270F6ABF0]();
}

uint64_t Siri_Nlu_External_LegacyNLContext.responseSemanticValues.setter()
{
  return MEMORY[0x270F6ABF8]();
}

uint64_t Siri_Nlu_External_LegacyNLContext.init()()
{
  return MEMORY[0x270F6AC00]();
}

uint64_t type metadata accessor for Siri_Nlu_External_LegacyNLContext()
{
  return MEMORY[0x270F6AC08]();
}

uint64_t Com_Apple_Siri_Product_Proto_PromptContext.previousDomainName.setter()
{
  return MEMORY[0x270F6BF60]();
}

uint64_t Com_Apple_Siri_Product_Proto_PromptContext.listenAfterSpeaking.setter()
{
  return MEMORY[0x270F6BF68]();
}

uint64_t Com_Apple_Siri_Product_Proto_PromptContext.init()()
{
  return MEMORY[0x270F6BF70]();
}

uint64_t type metadata accessor for Com_Apple_Siri_Product_Proto_PromptContext()
{
  return MEMORY[0x270F6BF78]();
}

uint64_t type metadata accessor for UsoEntity_common_MediaItemType.DefinedValues()
{
  return MEMORY[0x270F6DC30]();
}

uint64_t Graph.init()()
{
  return MEMORY[0x270F6F278]();
}

uint64_t type metadata accessor for Graph()
{
  return MEMORY[0x270F6F280]();
}

uint64_t BinaryDecodingOptions.init()()
{
  return MEMORY[0x270F6FA08]();
}

{
  return MEMORY[0x270F44AA8]();
}

uint64_t type metadata accessor for BinaryDecodingOptions()
{
  return MEMORY[0x270F6FA10]();
}

{
  return MEMORY[0x270F44AB0]();
}

uint64_t Message.init(serializedData:extensions:partial:options:)()
{
  return MEMORY[0x270F6FA28]();
}

{
  return MEMORY[0x270F44CA0]();
}

uint64_t Message.serializedData(partial:)()
{
  return MEMORY[0x270F6FA30]();
}

{
  return MEMORY[0x270F44CA8]();
}

uint64_t Google_Protobuf_StringValue.value.getter()
{
  return MEMORY[0x270F446F8]();
}

uint64_t type metadata accessor for Google_Protobuf_StringValue()
{
  return MEMORY[0x270F44710]();
}

uint64_t Google_Protobuf_StringValue.init(_:)()
{
  return MEMORY[0x270F44718]();
}

uint64_t static Message.with(_:)()
{
  return MEMORY[0x270F44CE0]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t Logger.init(subsystem:category:)()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return MEMORY[0x270F9D478]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x270EF19B0]();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t String.init(format:_:)()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t String.init<A>(describing:)()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x270F9D708]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return MEMORY[0x270F9D800]();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return MEMORY[0x270F9D810]();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return MEMORY[0x270F9D860]();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x270F9DBA0]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x270EF1B88]();
}

uint64_t static Array._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x270EF1BA8]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t Array.description.getter()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t specialized Array._endMutation()()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t Float.write<A>(to:)()
{
  return MEMORY[0x270F9DE48]();
}

uint64_t static os_log_type_t.info.getter()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t static os_log_type_t.fault.getter()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t NSCoder.decodeObject<A>(of:forKey:)()
{
  return MEMORY[0x270EF20F8]();
}

uint64_t NSCoder.decodeObject(of:forKey:)()
{
  return MEMORY[0x270EF2100]();
}

uint64_t NSCoder.decodeArrayOfObjects<A>(ofClass:forKey:)()
{
  return MEMORY[0x270EF2128]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x270F9E530]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x270F9E560]();
}

uint64_t StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return MEMORY[0x270F9E670]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t StaticString.description.getter()
{
  return MEMORY[0x270F9E9E8]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t DecodingError.Context.init(codingPath:debugDescription:underlyingError:)()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t type metadata accessor for DecodingError()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9EFE8]();
}

{
  return MEMORY[0x270F9EFF0]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x270F9F080]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9F0C0]();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x270F9F230](cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return MEMORY[0x270F9F250]();
}

uint64_t KeyedDecodingContainer.codingPath.getter()
{
  return MEMORY[0x270F9F258]();
}

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return MEMORY[0x270F9F270]();
}

uint64_t KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return MEMORY[0x270F9F2E8]();
}

{
  return MEMORY[0x270F9F2F0]();
}

{
  return MEMORY[0x270F9F308]();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return MEMORY[0x270F9F318]();
}

uint64_t KeyedDecodingContainer.allKeys.getter()
{
  return MEMORY[0x270F9F360]();
}

uint64_t KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return MEMORY[0x270F9F390]();
}

uint64_t KeyedEncodingContainer.encodeIfPresent(_:forKey:)()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return MEMORY[0x270F9F428]();
}

{
  return MEMORY[0x270F9F430]();
}

{
  return MEMORY[0x270F9F448]();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return MEMORY[0x270F9F458]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:)()
{
  return MEMORY[0x270F9F770]();
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t Error.localizedDescription.getter()
{
  return MEMORY[0x270EF2680]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x270F9FC48]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t type metadata accessor for KeyPath()
{
  return MEMORY[0x270F9FDD0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}