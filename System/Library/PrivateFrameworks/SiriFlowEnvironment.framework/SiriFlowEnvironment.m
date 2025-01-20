void sub_21E682D00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class initRadarComponent()
{
  if (TapToRadarKitLibrary_sOnce != -1) {
    dispatch_once(&TapToRadarKitLibrary_sOnce, &__block_literal_global_18);
  }
  Class result = objc_getClass("RadarComponent");
  classRadarComponent = (uint64_t)result;
  getRadarComponentClass = (uint64_t (*)())RadarComponentFunction;
  return result;
}

id RadarComponentFunction()
{
  return (id)classRadarComponent;
}

void *__TapToRadarKitLibrary_block_invoke()
{
  Class result = dlopen("/AppleInternal/Library/Frameworks/TapToRadarKit.framework/TapToRadarKit", 2);
  TapToRadarKitLibrary_sLib = (uint64_t)result;
  return result;
}

Class initTapToRadarService()
{
  if (TapToRadarKitLibrary_sOnce != -1) {
    dispatch_once(&TapToRadarKitLibrary_sOnce, &__block_literal_global_18);
  }
  Class result = objc_getClass("TapToRadarService");
  classTapToRadarService = (uint64_t)result;
  getTapToRadarServiceClass = (uint64_t (*)())TapToRadarServiceFunction;
  return result;
}

id TapToRadarServiceFunction()
{
  return (id)classTapToRadarService;
}

Class initRadarDraft()
{
  if (TapToRadarKitLibrary_sOnce != -1) {
    dispatch_once(&TapToRadarKitLibrary_sOnce, &__block_literal_global_18);
  }
  Class result = objc_getClass("RadarDraft");
  classRadarDraft = (uint64_t)result;
  getRadarDraftClass = (uint64_t (*)())RadarDraftFunction;
  return result;
}

id RadarDraftFunction()
{
  return (id)classRadarDraft;
}

uint64_t FlowTaskMetadata.init(id:isClientInitiated:creationTime:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = a5 + *(int *)(type metadata accessor for FlowTaskMetadata() + 24);
  uint64_t v11 = type metadata accessor for Date();
  __swift_storeEnumTagSinglePayload(v10, 1, 1, v11);
  *(void *)a5 = a1;
  *(void *)(a5 + 8) = a2;
  *(unsigned char *)(a5 + 16) = a3;
  outlined destroy of Date?(v10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v10, a4, v11);
  return __swift_storeEnumTagSinglePayload(v10, 0, 1, v11);
}

uint64_t type metadata accessor for FlowTaskMetadata()
{
  uint64_t result = type metadata singleton initialization cache for FlowTaskMetadata;
  if (!type metadata singleton initialization cache for FlowTaskMetadata) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t outlined destroy of Date?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
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

uint64_t FlowTaskMetadata.id.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FlowTaskMetadata.id.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*FlowTaskMetadata.id.modify())()
{
  return FlowTaskMetadata.id.modify;
}

uint64_t FlowTaskMetadata.isClientInitiated.getter()
{
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t FlowTaskMetadata.isClientInitiated.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 16) = result;
  return result;
}

uint64_t (*FlowTaskMetadata.isClientInitiated.modify())()
{
  return FlowTaskMetadata.id.modify;
}

uint64_t FlowTaskMetadata.creationTime.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for FlowTaskMetadata() + 24);
  return outlined init with copy of Date?(v3, a1);
}

uint64_t outlined init with copy of Date?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t FlowTaskMetadata.creationTime.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for FlowTaskMetadata() + 24);
  return outlined assign with take of Date?(a1, v3);
}

uint64_t outlined assign with take of Date?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*FlowTaskMetadata.creationTime.modify())()
{
  return FlowTaskMetadata.id.modify;
}

void default argument 0 of InteractionTypeHelper.init(accessibilityStatusProvider:deviceClassProvider:)(uint64_t a1@<X8>)
{
  *(void *)(a1 + 24) = &type metadata for AccessibilityStatusProviderImpl;
  *(void *)(a1 + 32) = &protocol witness table for AccessibilityStatusProviderImpl;
}

uint64_t default argument 1 of InteractionTypeHelper.init(accessibilityStatusProvider:deviceClassProvider:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for MobileGestaltDeviceClassProvider();
  uint64_t v3 = MEMORY[0x263F75888];
  a1[3] = v2;
  a1[4] = v3;
  __swift_allocate_boxed_opaque_existential_1(a1);
  return static MobileGestaltDeviceClassProvider.shared.getter();
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

void *initializeBufferWithCopyOfBuffer for FlowTaskMetadata(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (void *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v5;
    *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
    uint64_t v6 = *(int *)(a3 + 24);
    v7 = (void *)(a1 + v6);
    v8 = (char *)a2 + v6;
    uint64_t v9 = type metadata accessor for Date();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9))
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
      memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
      __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
    }
  }
  return v3;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t destroy for FlowTaskMetadata(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = type metadata accessor for Date();
  uint64_t result = __swift_getEnumTagSinglePayload(v4, 1, v5);
  if (!result)
  {
    v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v7(v4, v5);
  }
  return result;
}

uint64_t initializeWithCopy for FlowTaskMetadata(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = (void *)(a1 + v5);
  v7 = (const void *)(a2 + v5);
  uint64_t v8 = type metadata accessor for Date();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v8))
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    memcpy(v6, v7, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 16))(v6, v7, v8);
    __swift_storeEnumTagSinglePayload((uint64_t)v6, 0, 1, v8);
  }
  return a1;
}

uint64_t assignWithCopy for FlowTaskMetadata(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v6 = *(int *)(a3 + 24);
  v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = type metadata accessor for Date();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  int v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  if (!EnumTagSinglePayload)
  {
    uint64_t v12 = *(void *)(v9 - 8);
    if (!v11)
    {
      (*(void (**)(void *, const void *, uint64_t))(v12 + 24))(v7, v8, v9);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
  return a1;
}

uint64_t initializeWithTake for FlowTaskMetadata(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = (void *)(a1 + v4);
  uint64_t v6 = (const void *)(a2 + v4);
  uint64_t v7 = type metadata accessor for Date();
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    memcpy(v5, v6, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
    __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v7);
  }
  return a1;
}

uint64_t assignWithTake for FlowTaskMetadata(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = type metadata accessor for Date();
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10);
  int v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10);
  if (!EnumTagSinglePayload)
  {
    uint64_t v13 = *(void *)(v10 - 8);
    if (!v12)
    {
      (*(void (**)(void *, const void *, uint64_t))(v13 + 40))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v13 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v12)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    memcpy(v8, v9, *(void *)(*(void *)(v14 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for FlowTaskMetadata(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_21E683C70);
}

uint64_t sub_21E683C70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    uint64_t v10 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v10, a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for FlowTaskMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_21E683D1C);
}

uint64_t sub_21E683D1C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 8) = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
    uint64_t v8 = v5 + *(int *)(a4 + 24);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

void type metadata completion function for FlowTaskMetadata()
{
  type metadata accessor for Date?();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void type metadata accessor for Date?()
{
  if (!lazy cache variable for type metadata for Date?)
  {
    type metadata accessor for Date();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for Date?);
    }
  }
}

uint64_t protocol witness for SetAlgebra.init() in conformance NSPropertyListMutabilityOptions@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = specialized OptionSet<>.init()();
  *a1 = result;
  return result;
}

void *protocol witness for OptionSet.init(rawValue:) in conformance NSPropertyListMutabilityOptions@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t InteractionTypeHelper.init(accessibilityStatusProvider:deviceClassProvider:)@<X0>(long long *a1@<X0>, long long *a2@<X1>, uint64_t a3@<X8>)
{
  outlined init with take of DeviceClassProvider(a1, a3);
  return outlined init with take of DeviceClassProvider(a2, a3 + 40);
}

uint64_t outlined init with take of DeviceClassProvider(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t one-time initialization function for shared()
{
  qword_26AD3E6C0 = (uint64_t)&type metadata for AccessibilityStatusProviderImpl;
  unk_26AD3E6C8 = &protocol witness table for AccessibilityStatusProviderImpl;
  qword_26AD3E6E8 = type metadata accessor for MobileGestaltDeviceClassProvider();
  unk_26AD3E6F0 = MEMORY[0x263F75888];
  __swift_allocate_boxed_opaque_existential_1(qword_26AD3E6D0);
  return static MobileGestaltDeviceClassProvider.shared.getter();
}

uint64_t static InteractionTypeHelper.shared.getter@<X0>(uint64_t a1@<X8>)
{
  if (one-time initialization token for shared != -1) {
    swift_once();
  }
  return outlined init with copy of InteractionTypeHelper((uint64_t)&static InteractionTypeHelper.shared, a1);
}

uint64_t outlined init with copy of InteractionTypeHelper(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t one-time initialization function for interactionForIdiom()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(DeviceClass, InteractionType)>);
  unint64_t v0 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (DeviceClass, InteractionType))
             - 8);
  unint64_t v1 = (*(unsigned __int8 *)(*(void *)v0 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v0 + 80);
  uint64_t v2 = *(void *)(*(void *)v0 + 72);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_21E6ACEF0;
  unint64_t v3 = v15 + v1 + v0[14];
  uint64_t v4 = *MEMORY[0x263F755E8];
  uint64_t v5 = type metadata accessor for DeviceClass();
  uint64_t v13 = *(void (**)(void))(*(void *)(v5 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v13)(v15 + v1, v4, v5);
  uint64_t v6 = *MEMORY[0x263F757F8];
  uint64_t v7 = type metadata accessor for InteractionType();
  uint64_t v8 = *(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 104);
  unsigned int v14 = v6;
  v8(v3, v6, v7);
  unint64_t v9 = v15 + v1 + v2 + v0[14];
  v13();
  v8(v9, v6, v7);
  uint64_t v10 = v15 + v1 + 2 * v2 + v0[14];
  v13();
  v8(v10, *MEMORY[0x263F757F0], v7);
  uint64_t v11 = v15 + v1 + 3 * v2 + v0[14];
  v13();
  v8(v11, v14, v7);
  lazy protocol witness table accessor for type AudioSource and conformance AudioSource(&lazy protocol witness table cache variable for type DeviceClass and conformance DeviceClass, MEMORY[0x263F75600]);
  uint64_t result = Dictionary.init(dictionaryLiteral:)();
  static InteractionTypeHelper.interactionForIdiom = result;
  return result;
}

uint64_t one-time initialization function for dialogDrivenInputOrigins()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<InputOrigin>);
  uint64_t v0 = type metadata accessor for InputOrigin();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = *(void *)(v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_21E6ACEF0;
  unint64_t v5 = v4 + v3;
  uint64_t v6 = *(void (**)(unint64_t, void, uint64_t))(v1 + 104);
  v6(v5, *MEMORY[0x263F75688], v0);
  v6(v5 + v2, *MEMORY[0x263F75690], v0);
  v6(v5 + 2 * v2, *MEMORY[0x263F756B8], v0);
  v6(v5 + 3 * v2, *MEMORY[0x263F756D0], v0);
  uint64_t result = specialized Set.init(_nonEmptyArrayLiteral:)(v4);
  static InteractionTypeHelper.dialogDrivenInputOrigins = result;
  return result;
}

uint64_t *InteractionTypeHelper.dialogDrivenInputOrigins.unsafeMutableAddressor()
{
  if (one-time initialization token for dialogDrivenInputOrigins != -1) {
    swift_once();
  }
  return &static InteractionTypeHelper.dialogDrivenInputOrigins;
}

uint64_t static InteractionTypeHelper.dialogDrivenInputOrigins.getter()
{
  return static InteractionTypeHelper.dialogDrivenInputOrigins.getter(&one-time initialization token for dialogDrivenInputOrigins);
}

uint64_t static InteractionTypeHelper.interactionType(inputOrigin:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (one-time initialization token for dialogDrivenInputOrigins != -1) {
    swift_once();
  }
  char v4 = specialized Set.contains(_:)(a1, static InteractionTypeHelper.dialogDrivenInputOrigins);
  type metadata accessor for InteractionType();
  OUTLINED_FUNCTION_4();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 104);
  uint64_t v8 = (unsigned int *)MEMORY[0x263F757F0];
  if ((v4 & 1) == 0) {
    uint64_t v8 = (unsigned int *)MEMORY[0x263F757F8];
  }
  uint64_t v9 = *v8;
  return v7(a2, v9, v5);
}

uint64_t specialized Set.contains(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for InputOrigin();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(a2 + 16)
    && (lazy protocol witness table accessor for type AudioSource and conformance AudioSource(&lazy protocol witness table cache variable for type InputOrigin and conformance InputOrigin, MEMORY[0x263F756E8]), v7 = dispatch thunk of Hashable._rawHashValue(seed:)(), v8 = -1 << *(unsigned char *)(a2 + 32), v9 = v7 & ~v8, uint64_t v10 = a2 + 56, ((*(void *)(a2 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0))
  {
    uint64_t v17 = ~v8;
    uint64_t v18 = a2;
    uint64_t v11 = v4 + 16;
    int v12 = *(void (**)(char *, unint64_t, uint64_t))(v4 + 16);
    uint64_t v13 = *(void *)(v11 + 56);
    unsigned int v14 = (void (**)(char *, uint64_t))(v11 - 8);
    do
    {
      v12(v6, *(void *)(v18 + 48) + v13 * v9, v3);
      lazy protocol witness table accessor for type AudioSource and conformance AudioSource(&lazy protocol witness table cache variable for type InputOrigin and conformance InputOrigin, MEMORY[0x263F756E8]);
      char v15 = dispatch thunk of static Equatable.== infix(_:_:)();
      (*v14)(v6, v3);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v17;
    }
    while (((*(void *)(v10 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  else
  {
    char v15 = 0;
  }
  return v15 & 1;
}

{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(char *, unint64_t, uint64_t);
  uint64_t v13;
  void (**v14)(char *, uint64_t);
  char v15;
  uint64_t v17;
  uint64_t v18;

  uint64_t v3 = type metadata accessor for AudioDestination();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(a2 + 16)
    && (lazy protocol witness table accessor for type AudioSource and conformance AudioSource(&lazy protocol witness table cache variable for type AudioDestination and conformance AudioDestination, MEMORY[0x263F75810]), v7 = dispatch thunk of Hashable._rawHashValue(seed:)(), v8 = -1 << *(unsigned char *)(a2 + 32), v9 = v7 & ~v8, uint64_t v10 = a2 + 56, ((*(void *)(a2 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0))
  {
    uint64_t v17 = ~v8;
    uint64_t v18 = a2;
    uint64_t v11 = v4 + 16;
    int v12 = *(void (**)(char *, unint64_t, uint64_t))(v4 + 16);
    uint64_t v13 = *(void *)(v11 + 56);
    unsigned int v14 = (void (**)(char *, uint64_t))(v11 - 8);
    do
    {
      v12(v6, *(void *)(v18 + 48) + v13 * v9, v3);
      lazy protocol witness table accessor for type AudioSource and conformance AudioSource(&lazy protocol witness table cache variable for type AudioDestination and conformance AudioDestination, MEMORY[0x263F75810]);
      char v15 = dispatch thunk of static Equatable.== infix(_:_:)();
      (*v14)(v6, v3);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v17;
    }
    while (((*(void *)(v10 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  else
  {
    char v15 = 0;
  }
  return v15 & 1;
}

uint64_t one-time initialization function for dialogDrivenAudioDestinations()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<AudioDestination>);
  type metadata accessor for AudioDestination();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_21E6ACF00;
  static AudioDestination.bluetoothHandsFreeDevice.getter();
  static AudioDestination.bluetoothA2DPDevice.getter();
  static AudioDestination.carAudio.getter();
  uint64_t result = specialized Set.init(_nonEmptyArrayLiteral:)(v0);
  static InteractionTypeHelper.dialogDrivenAudioDestinations = result;
  return result;
}

uint64_t *InteractionTypeHelper.dialogDrivenAudioDestinations.unsafeMutableAddressor()
{
  if (one-time initialization token for dialogDrivenAudioDestinations != -1) {
    swift_once();
  }
  return &static InteractionTypeHelper.dialogDrivenAudioDestinations;
}

uint64_t static InteractionTypeHelper.dialogDrivenAudioDestinations.getter()
{
  return static InteractionTypeHelper.dialogDrivenInputOrigins.getter(&one-time initialization token for dialogDrivenAudioDestinations);
}

uint64_t static InteractionTypeHelper.dialogDrivenInputOrigins.getter(void *a1)
{
  if (*a1 != -1) {
    swift_once();
  }
  return swift_bridgeObjectRetain();
}

uint64_t static InteractionTypeHelper.interactionType(audioDestination:)(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AudioDestination?);
  uint64_t v3 = OUTLINED_FUNCTION_9(v2);
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_6();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = type metadata accessor for AudioDestination();
  OUTLINED_FUNCTION_0();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_6();
  uint64_t v13 = v12 - v11;
  outlined init with copy of AudioDestination?(a1, v6, &demangling cache variable for type metadata for AudioDestination?);
  if (__swift_getEnumTagSinglePayload(v6, 1, v7) == 1)
  {
    outlined destroy of AudioDestination?(v6, &demangling cache variable for type metadata for AudioDestination?);
    type metadata accessor for InteractionType();
    OUTLINED_FUNCTION_1();
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 32))(v13, v6, v7);
    if (one-time initialization token for dialogDrivenAudioDestinations != -1) {
      swift_once();
    }
    specialized Set.contains(_:)(v13, static InteractionTypeHelper.dialogDrivenAudioDestinations);
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v13, v7);
    type metadata accessor for InteractionType();
    OUTLINED_FUNCTION_1();
  }
  OUTLINED_FUNCTION_8();
  return v14();
}

uint64_t InteractionTypeHelper.mapInteractionType(inputOrigin:isEyesFree:isDeviceInStarkMode:isDeviceInCarDND:audioSource:audioDestination:previousInteractionType:)@<X0>(uint64_t a1@<X0>, int a2@<W1>, int a3@<W2>, int a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v108 = a7;
  uint64_t v105 = a6;
  uint64_t v115 = a5;
  uint64_t v116 = a1;
  int v119 = a4;
  int v120 = a3;
  int v122 = a2;
  uint64_t v124 = a8;
  uint64_t v111 = type metadata accessor for InputOrigin();
  OUTLINED_FUNCTION_0();
  uint64_t v109 = v9;
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_10();
  uint64_t v110 = v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AudioSource?);
  uint64_t v13 = OUTLINED_FUNCTION_9(v12);
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_10();
  uint64_t v114 = v14;
  uint64_t v117 = type metadata accessor for AudioSource();
  OUTLINED_FUNCTION_0();
  uint64_t v112 = v15;
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_11();
  uint64_t v123 = v17;
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  v106 = (char *)&v105 - v20;
  MEMORY[0x270FA5388](v19);
  v113 = (char *)&v105 - v21;
  uint64_t v121 = type metadata accessor for Logger();
  OUTLINED_FUNCTION_0();
  uint64_t v23 = v22;
  MEMORY[0x270FA5388](v24);
  OUTLINED_FUNCTION_6();
  uint64_t v27 = v26 - v25;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for InteractionType?);
  uint64_t v29 = OUTLINED_FUNCTION_9(v28);
  MEMORY[0x270FA5388](v29);
  OUTLINED_FUNCTION_11();
  uint64_t v107 = v30;
  MEMORY[0x270FA5388](v31);
  v33 = (char *)&v105 - v32;
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DeviceClass?);
  uint64_t v35 = OUTLINED_FUNCTION_9(v34);
  MEMORY[0x270FA5388](v35);
  OUTLINED_FUNCTION_6();
  uint64_t v38 = v37 - v36;
  uint64_t v39 = type metadata accessor for DeviceClass();
  OUTLINED_FUNCTION_0();
  uint64_t v41 = v40;
  MEMORY[0x270FA5388](v42);
  OUTLINED_FUNCTION_6();
  uint64_t v45 = v44 - v43;
  uint64_t v46 = v8[8];
  v118 = v8;
  __swift_project_boxed_opaque_existential_1(v8 + 5, v46);
  dispatch thunk of DeviceClassProvider.currentDeviceClass.getter();
  if (__swift_getEnumTagSinglePayload(v38, 1, v39) == 1)
  {
    outlined destroy of AudioDestination?(v38, &demangling cache variable for type metadata for DeviceClass?);
    static Logger.logger.getter();
    v47 = Logger.logObject.getter();
    os_log_type_t v48 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v47, v48))
    {
      v49 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v49 = 0;
      _os_log_impl(&dword_21E680000, v47, v48, "Unknown device type returned by MobileGestalt. Interaction type may not be accurate.", v49, 2u);
      MEMORY[0x223C2EF70](v49, -1, -1);
    }

    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v27, v121);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v41 + 32))(v45, v38, v39);
    if (one-time initialization token for interactionForIdiom != -1) {
      swift_once();
    }
    specialized Dictionary.subscript.getter(v45, static InteractionTypeHelper.interactionForIdiom, (uint64_t)v33);
    (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v45, v39);
    uint64_t v50 = type metadata accessor for InteractionType();
    if (__swift_getEnumTagSinglePayload((uint64_t)v33, 1, v50) != 1)
    {
      OUTLINED_FUNCTION_4();
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v60 + 32))(v124, v33, v50);
    }
    outlined destroy of AudioDestination?((uint64_t)v33, &demangling cache variable for type metadata for InteractionType?);
  }
  uint64_t v51 = v123;
  if (v122) {
    goto LABEL_25;
  }
  if (v120) {
    goto LABEL_25;
  }
  if (v119) {
    goto LABEL_25;
  }
  uint64_t v52 = v118[3];
  uint64_t v53 = v118[4];
  __swift_project_boxed_opaque_existential_1(v118, v52);
  if ((*(uint64_t (**)(uint64_t, uint64_t))(v53 + 8))(v52, v53)) {
    goto LABEL_25;
  }
  uint64_t v54 = v114;
  outlined init with copy of AudioDestination?(v115, v114, &demangling cache variable for type metadata for AudioSource?);
  uint64_t v55 = v117;
  if (__swift_getEnumTagSinglePayload(v54, 1, v117) == 1)
  {
    outlined destroy of AudioDestination?(v54, &demangling cache variable for type metadata for AudioSource?);
    if (one-time initialization token for dialogDrivenInputOrigins != -1) {
      swift_once();
    }
    char v56 = specialized Set.contains(_:)(v116, static InteractionTypeHelper.dialogDrivenInputOrigins);
    type metadata accessor for InteractionType();
    OUTLINED_FUNCTION_1();
    v58 = *(uint64_t (**)(uint64_t, uint64_t))(v57 + 104);
    if (v56) {
      v59 = (unsigned int *)MEMORY[0x263F757F0];
    }
    else {
      v59 = (unsigned int *)MEMORY[0x263F757F8];
    }
    uint64_t v68 = *v59;
    uint64_t v69 = v124;
    return v58(v69, v68);
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v112 + 32))(v113, v54, v55);
  uint64_t v63 = v109;
  uint64_t v62 = v110;
  uint64_t v64 = v111;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v109 + 16))(v110, v116, v111);
  int v65 = (*(uint64_t (**)(uint64_t, uint64_t))(v63 + 88))(v62, v64);
  if (v65 == *MEMORY[0x263F756A8]) {
    goto LABEL_20;
  }
  if (v65 == *MEMORY[0x263F756A0])
  {
    (*(void (**)(char *, uint64_t))(v112 + 8))(v113, v117);
    goto LABEL_25;
  }
  uint64_t v72 = v112;
  uint64_t v73 = v117;
  if (v65 != *MEMORY[0x263F756C0])
  {
    if (v65 == *MEMORY[0x263F75690])
    {
LABEL_20:
      OUTLINED_FUNCTION_3();
      v67(v66);
LABEL_25:
      uint64_t v70 = *MEMORY[0x263F757F0];
      type metadata accessor for InteractionType();
      OUTLINED_FUNCTION_1();
      v58 = *(uint64_t (**)(uint64_t, uint64_t))(v71 + 104);
      uint64_t v69 = v124;
      uint64_t v68 = v70;
      return v58(v69, v68);
    }
    (*(void (**)(char *, char *, uint64_t))(v112 + 16))(v106, v113, v117);
    static AudioSource.lineIn.getter();
    lazy protocol witness table accessor for type AudioSource and conformance AudioSource(&lazy protocol witness table cache variable for type AudioSource and conformance AudioSource, MEMORY[0x263F755C8]);
    char v81 = OUTLINED_FUNCTION_2();
    v82 = *(void (**)(void))(v72 + 8);
    OUTLINED_FUNCTION_3();
    v82();
    if (v81) {
      goto LABEL_35;
    }
    static AudioSource.wiredHeadsetMic.getter();
    char v83 = OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_3();
    v82();
    if (v83) {
      goto LABEL_35;
    }
    static AudioSource.bluetoothHandsFreeDevice.getter();
    char v87 = OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_3();
    v82();
    if (v87) {
      goto LABEL_40;
    }
    static AudioSource.usbAudio.getter();
    char v91 = OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_3();
    v82();
    if (v91)
    {
LABEL_35:
      OUTLINED_FUNCTION_3();
      ((void (*)(uint64_t))v82)(v84);
      if (one-time initialization token for dialogDrivenInputOrigins != -1) {
        swift_once();
      }
      specialized Set.contains(_:)(v116, static InteractionTypeHelper.dialogDrivenInputOrigins);
      type metadata accessor for InteractionType();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_8();
      v86(v85);
      ((void (*)(char *, uint64_t))v82)(v113, v73);
      return (*(uint64_t (**)(uint64_t, uint64_t))(v109 + 8))(v110, v111);
    }
    static AudioSource.unknown.getter();
    char v92 = OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_3();
    v82();
    if (v92)
    {
LABEL_40:
      OUTLINED_FUNCTION_3();
      ((void (*)(uint64_t))v82)(v88);
      ((void (*)(char *, uint64_t))v82)(v113, v73);
    }
    else
    {
      static AudioSource.carAudio.getter();
      char v93 = OUTLINED_FUNCTION_2();
      ((void (*)(uint64_t, uint64_t))v82)(v51, v73);
      if ((v93 & 1) == 0)
      {
        static AudioSource.builtInMic.getter();
        char v94 = OUTLINED_FUNCTION_7();
        OUTLINED_FUNCTION_5();
        v82();
        if (v94)
        {
          OUTLINED_FUNCTION_5();
          v82();
          static InteractionTypeHelper.interactionType(audioDestination:)(v105);
          OUTLINED_FUNCTION_5();
          v82();
          return (*(uint64_t (**)(uint64_t, uint64_t))(v109 + 8))(v110, v111);
        }
        static AudioSource.bluetoothDoAPDevice.getter();
        char v95 = OUTLINED_FUNCTION_7();
        OUTLINED_FUNCTION_5();
        ((void (*)(uint64_t))v82)(v96);
        if ((v95 & 1) == 0)
        {
          static AudioSource.carJarvisDevice.getter();
          dispatch thunk of static Equatable.== infix(_:_:)();
          OUTLINED_FUNCTION_5();
          ((void (*)(uint64_t))v82)(v99);
          OUTLINED_FUNCTION_5();
          ((void (*)(uint64_t))v82)(v100);
          OUTLINED_FUNCTION_5();
          ((void (*)(uint64_t))v82)(v101);
          type metadata accessor for InteractionType();
          OUTLINED_FUNCTION_1();
          v102 = (uint64_t (**)(uint64_t, uint64_t))(v109 + 8);
          OUTLINED_FUNCTION_8();
          v104(v103);
          return (*v102)(v110, v111);
        }
      }
      OUTLINED_FUNCTION_5();
      ((void (*)(uint64_t))v82)(v97);
      OUTLINED_FUNCTION_5();
      ((void (*)(uint64_t))v82)(v98);
    }
    type metadata accessor for InteractionType();
    OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_8();
    v90(v89);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v109 + 8))(v110, v111);
  }
  OUTLINED_FUNCTION_3();
  v75(v74);
  uint64_t v76 = v107;
  outlined init with copy of AudioDestination?(v108, v107, &demangling cache variable for type metadata for InteractionType?);
  uint64_t v77 = type metadata accessor for InteractionType();
  if (__swift_getEnumTagSinglePayload(v76, 1, v77) == 1)
  {
    OUTLINED_FUNCTION_4();
    OUTLINED_FUNCTION_8();
    v79(v78);
    return outlined destroy of AudioDestination?(v76, &demangling cache variable for type metadata for InteractionType?);
  }
  else
  {
    OUTLINED_FUNCTION_4();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v80 + 32))(v124, v76, v77);
  }
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t outlined init with copy of AudioDestination?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_1();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t outlined destroy of AudioDestination?(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_4();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t specialized Dictionary.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*(void *)(a2 + 16) && (unint64_t v5 = specialized __RawDictionaryStorage.find<A>(_:)(a1), (v6 & 1) != 0))
  {
    unint64_t v7 = v5;
    uint64_t v8 = *(void *)(a2 + 56);
    uint64_t v9 = type metadata accessor for InteractionType();
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(a3, v8 + *(void *)(*(void *)(v9 - 8) + 72) * v7, v9);
    uint64_t v10 = a3;
    uint64_t v11 = 0;
    uint64_t v12 = v9;
  }
  else
  {
    uint64_t v12 = type metadata accessor for InteractionType();
    uint64_t v10 = a3;
    uint64_t v11 = 1;
  }
  return __swift_storeEnumTagSinglePayload(v10, v11, 1, v12);
}

uint64_t specialized Dictionary.subscript.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) && (specialized __RawDictionaryStorage.find<A>(_:)(a1, a2), (v3 & 1) != 0)) {
    return swift_unknownObjectRetain();
  }
  else {
    return 0;
  }
}

{
  char v3;

  if (*(void *)(a3 + 16) && (specialized __RawDictionaryStorage.find<A>(_:)(a1, a2), (v3 & 1) != 0)) {
    return swift_bridgeObjectRetain();
  }
  else {
    return 0;
  }
}

{
  unint64_t v4;
  char v5;

  if (*(void *)(a3 + 16) && (uint64_t v4 = specialized __RawDictionaryStorage.find<A>(_:)(a1, a2), (v5 & 1) != 0)) {
    return *(unsigned __int8 *)(*(void *)(a3 + 56) + v4);
  }
  else {
    return 2;
  }
}

BOOL AccessibilityStatusProviderImpl.isVoiceOverEnabled.getter()
{
  return _AXSVoiceOverTouchEnabled() != 0;
}

uint64_t serialize(_:at:)(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for InteractionTypeHelper(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for InteractionTypeHelper(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  return __swift_destroy_boxed_opaque_existential_1(a1 + 40);
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

uint64_t initializeWithCopy for InteractionTypeHelper(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 40, a2 + 40);
  return a1;
}

uint64_t *assignWithCopy for InteractionTypeHelper(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        uint64_t result = (uint64_t *)swift_release();
        *uint64_t v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

void *__swift_memcpy80_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x50uLL);
}

uint64_t assignWithTake for InteractionTypeHelper(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  return a1;
}

uint64_t getEnumTagSinglePayload for InteractionTypeHelper(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 80))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 24);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for InteractionTypeHelper(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 80) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for InteractionTypeHelper()
{
  return &type metadata for InteractionTypeHelper;
}

uint64_t dispatch thunk of AccessibilityStatusProvider.isVoiceOverEnabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

ValueMetadata *type metadata accessor for AccessibilityStatusProviderImpl()
{
  return &type metadata for AccessibilityStatusProviderImpl;
}

uint64_t specialized Set.init(_nonEmptyArrayLiteral:)(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for InputOrigin();
  uint64_t v31 = *(void *)(v2 - 8);
  uint64_t v3 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v35 = (char *)&v26 - v6;
  if (!*(void *)(a1 + 16))
  {
    uint64_t v8 = MEMORY[0x263F8EE88];
    goto LABEL_16;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<InputOrigin>);
  uint64_t result = static _SetStorage.allocate(capacity:)();
  uint64_t v8 = result;
  uint64_t v30 = *(void *)(a1 + 16);
  if (!v30)
  {
LABEL_16:
    swift_bridgeObjectRelease();
    return v8;
  }
  unint64_t v9 = 0;
  uint64_t v29 = a1 + ((*(unsigned __int8 *)(v31 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80));
  uint64_t v33 = v31 + 16;
  uint64_t v34 = result + 56;
  uint64_t v10 = (void (**)(char *, uint64_t))(v31 + 8);
  uint64_t v27 = a1;
  uint64_t v28 = (uint64_t (**)(unint64_t, char *, uint64_t))(v31 + 32);
  while (v9 < *(void *)(a1 + 16))
  {
    uint64_t v11 = *(void *)(v31 + 72);
    uint64_t v12 = *(void (**)(char *, unint64_t, uint64_t))(v31 + 16);
    v12(v35, v29 + v11 * v9, v2);
    lazy protocol witness table accessor for type AudioSource and conformance AudioSource(&lazy protocol witness table cache variable for type InputOrigin and conformance InputOrigin, MEMORY[0x263F756E8]);
    uint64_t v13 = dispatch thunk of Hashable._rawHashValue(seed:)();
    uint64_t v14 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v15 = v13 & ~v14;
    unint64_t v16 = v15 >> 6;
    uint64_t v17 = *(void *)(v34 + 8 * (v15 >> 6));
    uint64_t v18 = 1 << v15;
    if (((1 << v15) & v17) != 0)
    {
      unint64_t v32 = v9;
      uint64_t v19 = ~v14;
      while (1)
      {
        v12(v5, *(void *)(v8 + 48) + v15 * v11, v2);
        lazy protocol witness table accessor for type AudioSource and conformance AudioSource(&lazy protocol witness table cache variable for type InputOrigin and conformance InputOrigin, MEMORY[0x263F756E8]);
        char v20 = dispatch thunk of static Equatable.== infix(_:_:)();
        uint64_t v21 = *v10;
        (*v10)(v5, v2);
        if (v20) {
          break;
        }
        unint64_t v15 = (v15 + 1) & v19;
        unint64_t v16 = v15 >> 6;
        uint64_t v17 = *(void *)(v34 + 8 * (v15 >> 6));
        uint64_t v18 = 1 << v15;
        if ((v17 & (1 << v15)) == 0)
        {
          a1 = v27;
          unint64_t v9 = v32;
          goto LABEL_10;
        }
      }
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v21)(v35, v2);
      a1 = v27;
      unint64_t v9 = v32;
    }
    else
    {
LABEL_10:
      uint64_t v22 = v35;
      *(void *)(v34 + 8 * v16) = v18 | v17;
      uint64_t result = (*v28)(*(void *)(v8 + 48) + v15 * v11, v22, v2);
      uint64_t v23 = *(void *)(v8 + 16);
      BOOL v24 = __OFADD__(v23, 1);
      uint64_t v25 = v23 + 1;
      if (v24) {
        goto LABEL_18;
      }
      *(void *)(v8 + 16) = v25;
    }
    if (++v9 == v30) {
      goto LABEL_16;
    }
  }
  __break(1u);
LABEL_18:
  __break(1u);
  return result;
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  void (**v10)(char *, uint64_t);
  uint64_t v11;
  void (*v12)(char *, unint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  void (*v21)(char *, uint64_t);
  char *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (**v28)(unint64_t, char *, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;

  uint64_t v2 = type metadata accessor for AudioDestination();
  uint64_t v31 = *(void *)(v2 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v35 = (char *)&v26 - v6;
  if (!*(void *)(a1 + 16))
  {
    uint64_t v8 = MEMORY[0x263F8EE88];
    goto LABEL_16;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<AudioDestination>);
  uint64_t result = static _SetStorage.allocate(capacity:)();
  uint64_t v8 = result;
  uint64_t v30 = *(void *)(a1 + 16);
  if (!v30)
  {
LABEL_16:
    swift_bridgeObjectRelease();
    return v8;
  }
  unint64_t v9 = 0;
  uint64_t v29 = a1 + ((*(unsigned __int8 *)(v31 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80));
  uint64_t v33 = v31 + 16;
  uint64_t v34 = result + 56;
  uint64_t v10 = (void (**)(char *, uint64_t))(v31 + 8);
  uint64_t v27 = a1;
  uint64_t v28 = (uint64_t (**)(unint64_t, char *, uint64_t))(v31 + 32);
  while (v9 < *(void *)(a1 + 16))
  {
    uint64_t v11 = *(void *)(v31 + 72);
    uint64_t v12 = *(void (**)(char *, unint64_t, uint64_t))(v31 + 16);
    v12(v35, v29 + v11 * v9, v2);
    lazy protocol witness table accessor for type AudioSource and conformance AudioSource(&lazy protocol witness table cache variable for type AudioDestination and conformance AudioDestination, MEMORY[0x263F75810]);
    uint64_t v13 = dispatch thunk of Hashable._rawHashValue(seed:)();
    uint64_t v14 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v15 = v13 & ~v14;
    unint64_t v16 = v15 >> 6;
    uint64_t v17 = *(void *)(v34 + 8 * (v15 >> 6));
    uint64_t v18 = 1 << v15;
    if (((1 << v15) & v17) != 0)
    {
      unint64_t v32 = v9;
      uint64_t v19 = ~v14;
      while (1)
      {
        v12(v5, *(void *)(v8 + 48) + v15 * v11, v2);
        lazy protocol witness table accessor for type AudioSource and conformance AudioSource(&lazy protocol witness table cache variable for type AudioDestination and conformance AudioDestination, MEMORY[0x263F75810]);
        char v20 = dispatch thunk of static Equatable.== infix(_:_:)();
        uint64_t v21 = *v10;
        (*v10)(v5, v2);
        if (v20) {
          break;
        }
        unint64_t v15 = (v15 + 1) & v19;
        unint64_t v16 = v15 >> 6;
        uint64_t v17 = *(void *)(v34 + 8 * (v15 >> 6));
        uint64_t v18 = 1 << v15;
        if ((v17 & (1 << v15)) == 0)
        {
          a1 = v27;
          unint64_t v9 = v32;
          goto LABEL_10;
        }
      }
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v21)(v35, v2);
      a1 = v27;
      unint64_t v9 = v32;
    }
    else
    {
LABEL_10:
      uint64_t v22 = v35;
      *(void *)(v34 + 8 * v16) = v18 | v17;
      uint64_t result = (*v28)(*(void *)(v8 + 48) + v15 * v11, v22, v2);
      uint64_t v23 = *(void *)(v8 + 16);
      BOOL v24 = __OFADD__(v23, 1);
      uint64_t v25 = v23 + 1;
      if (v24) {
        goto LABEL_18;
      }
      *(void *)(v8 + 16) = v25;
    }
    if (++v9 == v30) {
      goto LABEL_16;
    }
  }
  __break(1u);
LABEL_18:
  __break(1u);
  return result;
}

uint64_t lazy protocol witness table accessor for type AudioSource and conformance AudioSource(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t OUTLINED_FUNCTION_2()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t OUTLINED_FUNCTION_7()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t OUTLINED_FUNCTION_9(uint64_t a1)
{
  return a1 - 8;
}

uint64_t SiriLocationProvider.requestOrigin()()
{
  OUTLINED_FUNCTION_1_0();
  v1[3] = v2;
  v1[4] = v0;
  v1[2] = v3;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DispatchTimeInterval?);
  v1[5] = swift_task_alloc();
  return MEMORY[0x270FA2498](SiriLocationProvider.requestOrigin(), 0, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v8)(uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;

  uint64_t v1 = v0[5];
  unint64_t v9 = v0[3];
  uint64_t v2 = type metadata accessor for DispatchTimeInterval();
  __swift_storeEnumTagSinglePayload(v1, 1, 1, v2);
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 + 8) + **(int **)(v9 + 8));
  uint64_t v3 = (void *)swift_task_alloc();
  v0[6] = v3;
  *uint64_t v3 = v0;
  v3[1] = SiriLocationProvider.requestOrigin();
  uint64_t v4 = v0[5];
  uint64_t v5 = v0[2];
  uint64_t v6 = v0[3];
  return v8(v4, v5, v6);
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = *(void *)(v2 + 40);
  uint64_t v6 = *v1;
  swift_task_dealloc();
  outlined destroy of DispatchTimeInterval?(v3);
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(uint64_t))(v6 + 8);
  return v4(v0);
}

uint64_t outlined destroy of DispatchTimeInterval?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DispatchTimeInterval?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t DummyLocationProvider.requestOrigin(searchTimeout:)()
{
  OUTLINED_FUNCTION_1_0();
  uint64_t v1 = type metadata accessor for Logger();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  return MEMORY[0x270FA2498](DummyLocationProvider.requestOrigin(searchTimeout:), 0, 0);
}

{
  void *v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void);
  uint64_t v9;

  static Logger.logger.getter();
  uint64_t v1 = Logger.logObject.getter();
  uint64_t v2 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_21E680000, v1, v2, "DummyLocationProvider was used; this should not happen.", v3, 2u);
    MEMORY[0x223C2EF70](v3, -1, -1);
  }
  uint64_t v5 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v6 = v0[2];

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7(0);
}

uint64_t protocol witness for SiriLocationProvider.requestOrigin(searchTimeout:) in conformance DummyLocationProvider()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = protocol witness for SiriLocationProvider.requestOrigin(searchTimeout:) in conformance DummyLocationProvider;
  return DummyLocationProvider.requestOrigin(searchTimeout:)();
}

uint64_t dispatch thunk of SiriLocationProvider.requestOrigin(searchTimeout:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 8) + **(int **)(a3 + 8));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = dispatch thunk of SiriLocationProvider.requestOrigin(searchTimeout:);
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of SiriLocationProvider.requestOrigin(searchTimeout:)()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0();
  uint64_t v4 = *v1;
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v4 + 8);
  return v2(v0);
}

ValueMetadata *type metadata accessor for DummyLocationProvider()
{
  return &type metadata for DummyLocationProvider;
}

CNContact_optional __swiftcall MeCardProxy.fetchMeCard()()
{
  uint64_t v3 = 0;
  uint64_t v1 = (objc_class *)(*(uint64_t (**)(uint64_t *))(v0 + 8))(&v3);
  result.value.super.isa = v1;
  result.is_nil = v2;
  return result;
}

uint64_t specialized SetAlgebra<>.init(arrayLiteral:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = 0;
    uint64_t v5 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v7 = *v5++;
      uint64_t v6 = v7;
      if ((v7 & ~v4) == 0) {
        uint64_t v6 = 0;
      }
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

uint64_t MeCardOptions.rawValue.getter()
{
  return *(void *)v0;
}

SiriFlowEnvironment::MeCardOptions __swiftcall MeCardOptions.init(rawValue:)(SiriFlowEnvironment::MeCardOptions rawValue)
{
  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void static MeCardOptions.ignoreLocalMeCard.getter(void *a1@<X8>)
{
  *a1 = 1;
}

void static MeCardOptions.ignoreCachedMeCard.getter(void *a1@<X8>)
{
  *a1 = 2;
}

SiriFlowEnvironment::MeCardOptions protocol witness for OptionSet.init(rawValue:) in conformance MeCardOptions(Swift::Int *a1)
{
  return MeCardOptions.init(rawValue:)(*a1);
}

void specialized OptionSet<>.init()(void *a1@<X8>)
{
  *a1 = 0;
}

unint64_t lazy protocol witness table accessor for type MeCardOptions and conformance MeCardOptions()
{
  unint64_t result = lazy protocol witness table cache variable for type MeCardOptions and conformance MeCardOptions;
  if (!lazy protocol witness table cache variable for type MeCardOptions and conformance MeCardOptions)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MeCardOptions and conformance MeCardOptions);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type MeCardOptions and conformance MeCardOptions;
  if (!lazy protocol witness table cache variable for type MeCardOptions and conformance MeCardOptions)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MeCardOptions and conformance MeCardOptions);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type MeCardOptions and conformance MeCardOptions;
  if (!lazy protocol witness table cache variable for type MeCardOptions and conformance MeCardOptions)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MeCardOptions and conformance MeCardOptions);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type MeCardOptions and conformance MeCardOptions;
  if (!lazy protocol witness table cache variable for type MeCardOptions and conformance MeCardOptions)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MeCardOptions and conformance MeCardOptions);
  }
  return result;
}

uint64_t specialized OptionSet<>.init()()
{
  return 0;
}

uint64_t protocol witness for SetAlgebra.union(_:) in conformance MeCardOptions@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return specialized OptionSet.union(_:)(*a1, *v2, a2);
}

uint64_t specialized OptionSet.union(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 | result;
  return result;
}

uint64_t protocol witness for SetAlgebra.intersection(_:) in conformance MeCardOptions@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return specialized OptionSet.intersection(_:)(*a1, *v2, a2);
}

uint64_t specialized OptionSet.intersection(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 & result;
  return result;
}

uint64_t protocol witness for SetAlgebra.symmetricDifference(_:) in conformance MeCardOptions@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return specialized OptionSet.symmetricDifference(_:)(*a1, *v2, a2);
}

uint64_t specialized OptionSet.symmetricDifference(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 ^ result;
  return result;
}

BOOL protocol witness for SetAlgebra.insert(_:) in conformance MeCardOptions(void *a1, uint64_t *a2)
{
  return specialized OptionSet<>.insert(_:)(a1, *a2);
}

BOOL specialized OptionSet<>.insert(_:)(void *a1, uint64_t a2)
{
  uint64_t v3 = *v2 & a2;
  if (v3 != a2) {
    *v2 |= a2;
  }
  *a1 = a2;
  return v3 != a2;
}

uint64_t protocol witness for SetAlgebra.remove(_:) in conformance MeCardOptions@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return specialized OptionSet<>.remove(_:)(*a1, a2);
}

uint64_t specialized OptionSet<>.remove(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & result;
  if (v3) {
    *v2 &= ~result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t protocol witness for SetAlgebra.update(with:) in conformance MeCardOptions@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return specialized OptionSet<>.update(with:)(*a1, a2);
}

uint64_t specialized OptionSet<>.update(with:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2;
  *v2 |= result;
  uint64_t v4 = v3 & result;
  *(void *)a2 = v4;
  *(unsigned char *)(a2 + 8) = v4 == 0;
  return result;
}

uint64_t protocol witness for SetAlgebra.formUnion(_:) in conformance MeCardOptions(uint64_t *a1)
{
  return specialized OptionSet<>.formUnion(_:)(*a1);
}

uint64_t specialized OptionSet<>.formUnion(_:)(uint64_t result)
{
  *v1 |= result;
  return result;
}

uint64_t protocol witness for SetAlgebra.formIntersection(_:) in conformance MeCardOptions(uint64_t *a1)
{
  return specialized OptionSet<>.formIntersection(_:)(*a1);
}

uint64_t specialized OptionSet<>.formIntersection(_:)(uint64_t result)
{
  *v1 &= result;
  return result;
}

uint64_t protocol witness for SetAlgebra.formSymmetricDifference(_:) in conformance MeCardOptions(uint64_t *a1)
{
  return specialized OptionSet<>.formSymmetricDifference(_:)(*a1);
}

uint64_t specialized OptionSet<>.formSymmetricDifference(_:)(uint64_t result)
{
  *v1 ^= result;
  return result;
}

uint64_t protocol witness for SetAlgebra.subtracting(_:) in conformance MeCardOptions@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return specialized SetAlgebra.subtracting(_:)(*a1, *v2, a2);
}

uint64_t specialized SetAlgebra.subtracting(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 & ~result;
  return result;
}

BOOL protocol witness for SetAlgebra.isSubset(of:) in conformance MeCardOptions(uint64_t *a1)
{
  return specialized SetAlgebra.isSubset(of:)(*a1, *v1);
}

BOOL specialized SetAlgebra.isSubset(of:)(uint64_t a1, uint64_t a2)
{
  return (a2 & ~a1) == 0;
}

BOOL protocol witness for SetAlgebra.isDisjoint(with:) in conformance MeCardOptions(uint64_t *a1)
{
  return specialized SetAlgebra.isDisjoint(with:)(*a1, *v1);
}

BOOL specialized SetAlgebra.isDisjoint(with:)(uint64_t a1, uint64_t a2)
{
  return (a2 & a1) == 0;
}

BOOL protocol witness for SetAlgebra.isSuperset(of:) in conformance MeCardOptions(uint64_t *a1)
{
  return specialized SetAlgebra.isSuperset(of:)(*a1, *v1);
}

BOOL specialized SetAlgebra.isSuperset(of:)(uint64_t a1, uint64_t a2)
{
  return (a1 & ~a2) == 0;
}

BOOL protocol witness for SetAlgebra.isEmpty.getter in conformance MeCardOptions()
{
  return specialized SetAlgebra.isEmpty.getter(*v0);
}

BOOL specialized SetAlgebra.isEmpty.getter(uint64_t a1)
{
  return a1 == 0;
}

uint64_t protocol witness for SetAlgebra.init<A>(_:) in conformance MeCardOptions(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F9E7D8](a1, a4, a2, a5, a3);
}

uint64_t protocol witness for SetAlgebra.subtract(_:) in conformance MeCardOptions(uint64_t *a1)
{
  return specialized SetAlgebra.subtract(_:)(*a1);
}

uint64_t specialized SetAlgebra.subtract(_:)(uint64_t result)
{
  *v1 &= ~result;
  return result;
}

SiriFlowEnvironment::MeCardOptions protocol witness for RawRepresentable.init(rawValue:) in conformance MeCardOptions@<X0>(Swift::Int *a1@<X0>, uint64_t a2@<X8>)
{
  result.rawValue = MeCardOptions.init(rawValue:)(*a1).rawValue;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance MeCardOptions@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = MeCardOptions.rawValue.getter();
  *a1 = result;
  return result;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance MeCardOptions(uint64_t *a1, uint64_t *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

uint64_t dispatch thunk of MeCardProxy.fetchMeCard(options:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

ValueMetadata *type metadata accessor for MeCardOptions()
{
  return &type metadata for MeCardOptions;
}

uint64_t MultiUserState.requiresUserGrounding.getter()
{
  outlined init with copy of MultiUserState(v0, (uint64_t)v3);
  if ((void)v4 == 1)
  {
    outlined destroy of MultiUserState((uint64_t)v3);
    return 0;
  }
  else
  {
    v6[0] = v3[0];
    v6[1] = v3[1];
    v6[2] = v4;
    v6[3] = v5;
    uint64_t v1 = LOBYTE(v3[0]);
    outlined destroy of MultiUserContext((uint64_t)v6);
  }
  return v1;
}

uint64_t outlined init with copy of MultiUserState(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t outlined destroy of MultiUserState(uint64_t a1)
{
  return a1;
}

uint64_t outlined destroy of MultiUserContext(uint64_t a1)
{
  return a1;
}

BOOL MultiUserState.isEnabled.getter()
{
  outlined init with copy of MultiUserState(v0, (uint64_t)v3);
  uint64_t v1 = v4;
  if (v4 != 1) {
    outlined destroy of MultiUserState((uint64_t)v3);
  }
  return v1 != 1;
}

uint64_t MultiUserContext.requiresUserGrounding.getter()
{
  return *v0;
}

uint64_t MultiUserContext.meCardProxy.getter@<X0>(uint64_t a1@<X8>)
{
  return outlined init with copy of MeCardProxy?(v1 + 8, a1);
}

uint64_t outlined init with copy of MeCardProxy?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MeCardProxy?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t MultiUserContext.meCardProxy.setter(uint64_t a1)
{
  return outlined assign with take of MeCardProxy?(a1, v1 + 8);
}

uint64_t outlined assign with take of MeCardProxy?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MeCardProxy?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*MultiUserContext.meCardProxy.modify())()
{
  return FlowTaskMetadata.id.modify;
}

uint64_t MultiUserContext.handoffTargetDeviceID.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MultiUserContext.init(requiresUserGrounding:meCardProxy:handoffTargetDeviceID:)@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  *(void *)(a5 + 40) = 0;
  *(_OWORD *)(a5 + 24) = 0u;
  *(_OWORD *)(a5 + 8) = 0u;
  *(unsigned char *)a5 = a1;
  uint64_t result = outlined assign with take of MeCardProxy?(a2, a5 + 8);
  *(void *)(a5 + 48) = a3;
  *(void *)(a5 + 56) = a4;
  return result;
}

uint64_t destroy for MultiUserState(uint64_t result)
{
  unint64_t v1 = *(void *)(result + 32);
  LODWORD(v2) = -1;
  if (v1 < 0xFFFFFFFF) {
    uint64_t v2 = *(void *)(result + 32);
  }
  if ((int)v2 - 1 < 0)
  {
    if (v1) {
      __swift_destroy_boxed_opaque_existential_1(result + 8);
    }
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for MultiUserState(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)(a2 + 32);
  LODWORD(v5) = -1;
  if (v4 < 0xFFFFFFFF) {
    uint64_t v5 = *(void *)(a2 + 32);
  }
  if ((int)v5 - 1 < 0)
  {
    uint64_t v8 = (_OWORD *)(a2 + 8);
    *(unsigned char *)a1 = *(unsigned char *)a2;
    unint64_t v9 = (_OWORD *)(a1 + 8);
    if (v4)
    {
      uint64_t v10 = *(void *)(a2 + 40);
      *(void *)(a1 + 32) = v4;
      *(void *)(a1 + 40) = v10;
      (**(void (***)(_OWORD *, _OWORD *))(v4 - 8))(v9, v8);
    }
    else
    {
      long long v11 = *(_OWORD *)(a2 + 24);
      *unint64_t v9 = *v8;
      *(_OWORD *)(a1 + 24) = v11;
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
    }
    uint64_t v12 = *(void *)(a2 + 56);
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    *(void *)(a1 + 56) = v12;
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v6 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v6;
    long long v7 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v7;
  }
  return a1;
}

uint64_t assignWithCopy for MultiUserState(uint64_t a1, long long *a2)
{
  uint64_t v4 = a1 + 8;
  unint64_t v5 = *(void *)(a1 + 32);
  LODWORD(v6) = -1;
  if (v5 >= 0xFFFFFFFF) {
    LODWORD(v7) = -1;
  }
  else {
    uint64_t v7 = *(void *)(a1 + 32);
  }
  int v8 = v7 - 1;
  unint64_t v9 = (long long *)((char *)a2 + 8);
  if (*((void *)a2 + 4) < 0xFFFFFFFFuLL) {
    uint64_t v6 = *((void *)a2 + 4);
  }
  int v10 = v6 - 1;
  if (v8 < 0)
  {
    if ((v10 & 0x80000000) == 0)
    {
      if (v5) {
        __swift_destroy_boxed_opaque_existential_1(a1 + 8);
      }
      swift_bridgeObjectRelease();
      goto LABEL_14;
    }
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v15 = *((void *)a2 + 4);
    if (v5)
    {
      if (v15)
      {
        __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 8), (uint64_t *)a2 + 1);
LABEL_24:
        *(void *)(a1 + 48) = *((void *)a2 + 6);
        *(void *)(a1 + 56) = *((void *)a2 + 7);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        return a1;
      }
      __swift_destroy_boxed_opaque_existential_1(a1 + 8);
    }
    else if (v15)
    {
      *(void *)(a1 + 32) = v15;
      *(void *)(a1 + 40) = *((void *)a2 + 5);
      (**(void (***)(uint64_t, uint64_t))(v15 - 8))(a1 + 8, (uint64_t)a2 + 8);
      goto LABEL_24;
    }
    long long v18 = *v9;
    long long v19 = v9[1];
    *(void *)(v4 + 32) = *((void *)v9 + 4);
    *(_OWORD *)uint64_t v4 = v18;
    *(_OWORD *)(v4 + 16) = v19;
    goto LABEL_24;
  }
  if ((v10 & 0x80000000) == 0)
  {
LABEL_14:
    long long v12 = *a2;
    long long v13 = a2[1];
    long long v14 = a2[3];
    *(_OWORD *)(a1 + 32) = a2[2];
    *(_OWORD *)(a1 + 48) = v14;
    *(_OWORD *)a1 = v12;
    *(_OWORD *)(a1 + 16) = v13;
    return a1;
  }
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v11 = *((void *)a2 + 4);
  if (v11)
  {
    *(void *)(a1 + 32) = v11;
    *(void *)(a1 + 40) = *((void *)a2 + 5);
    (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1 + 8, (uint64_t)a2 + 8);
  }
  else
  {
    long long v16 = *v9;
    long long v17 = *(long long *)((char *)a2 + 24);
    *(void *)(a1 + 40) = *((void *)a2 + 5);
    *(_OWORD *)uint64_t v4 = v16;
    *(_OWORD *)(a1 + 24) = v17;
  }
  *(void *)(a1 + 48) = *((void *)a2 + 6);
  *(void *)(a1 + 56) = *((void *)a2 + 7);
  swift_bridgeObjectRetain();
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for MultiUserState(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)(a1 + 32);
  LODWORD(v5) = -1;
  if (v4 < 0xFFFFFFFF) {
    uint64_t v5 = *(void *)(a1 + 32);
  }
  if ((int)v5 - 1 >= 0) {
    goto LABEL_10;
  }
  uint64_t v6 = (_OWORD *)(a1 + 8);
  unint64_t v7 = *(void *)(a2 + 32);
  if (v7 >= 0xFFFFFFFF) {
    LODWORD(v7) = -1;
  }
  if ((int)v7 - 1 >= 0)
  {
    if (v4) {
      __swift_destroy_boxed_opaque_existential_1(a1 + 8);
    }
    swift_bridgeObjectRelease();
LABEL_10:
    long long v8 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v8;
    long long v9 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 48) = v9;
    return a1;
  }
  uint64_t v11 = (_OWORD *)(a2 + 8);
  *(unsigned char *)a1 = *(unsigned char *)a2;
  if (v4) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 8);
  }
  long long v12 = *(_OWORD *)(a2 + 24);
  *uint64_t v6 = *v11;
  *(_OWORD *)(a1 + 24) = v12;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  uint64_t v13 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v13;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MultiUserState(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFE && *(unsigned char *)(a1 + 64)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  unint64_t v3 = *(void *)(a1 + 32);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  if ((v4 + 1) >= 2) {
    return v4;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for MultiUserState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)__n128 result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)__n128 result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 64) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 64) = 0;
    }
    if (a2) {
      *(void *)(result + 32) = a2 + 1;
    }
  }
  return result;
}

uint64_t getEnumTag for MultiUserState(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 32);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  int v2 = v1 - 1;
  if (v2 < 0) {
    int v2 = -1;
  }
  return (v2 + 1);
}

double destructiveInjectEnumTag for MultiUserState(uint64_t a1, unsigned int a2)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(a1 + 56) = 0;
    double result = 0.0;
    *(_OWORD *)(a1 + 40) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 8) = 0u;
    *(void *)a1 = a2 - 0x7FFFFFFF;
  }
  else if (a2)
  {
    *(void *)(a1 + 32) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for MultiUserState()
{
  return &type metadata for MultiUserState;
}

uint64_t destroy for MultiUserContext(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 8);
  }
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for MultiUserContext(uint64_t a1, char *a2)
{
  char v5 = *a2;
  int v4 = a2 + 8;
  *(unsigned char *)a1 = v5;
  uint64_t v6 = a1 + 8;
  uint64_t v7 = *((void *)a2 + 4);
  if (v7)
  {
    uint64_t v8 = *((void *)a2 + 5);
    *(void *)(a1 + 32) = v7;
    *(void *)(a1 + 40) = v8;
    (**(void (***)(uint64_t, uint64_t))(v7 - 8))(v6, (uint64_t)v4);
  }
  else
  {
    long long v9 = *((_OWORD *)v4 + 1);
    *(_OWORD *)uint64_t v6 = *(_OWORD *)v4;
    *(_OWORD *)(v6 + 16) = v9;
    *(void *)(v6 + 32) = *((void *)v4 + 4);
  }
  uint64_t v10 = *((void *)a2 + 7);
  *(void *)(a1 + 48) = *((void *)a2 + 6);
  *(void *)(a1 + 56) = v10;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for MultiUserContext(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = a1 + 8;
  char v5 = (long long *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 32);
  if (!*(void *)(a1 + 32))
  {
    if (v6)
    {
      *(void *)(a1 + 32) = v6;
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
      (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 8, a2 + 8);
      goto LABEL_8;
    }
LABEL_7:
    long long v7 = *v5;
    long long v8 = v5[1];
    *(void *)(v4 + 32) = *((void *)v5 + 4);
    *(_OWORD *)uint64_t v4 = v7;
    *(_OWORD *)(v4 + 16) = v8;
    goto LABEL_8;
  }
  if (!v6)
  {
    __swift_destroy_boxed_opaque_existential_1(a1 + 8);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 8), (uint64_t *)(a2 + 8));
LABEL_8:
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for MultiUserContext(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = a1 + 8;
  if (*(void *)(a1 + 32)) {
    __swift_destroy_boxed_opaque_existential_1(a1 + 8);
  }
  long long v5 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)uint64_t v4 = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(v4 + 16) = v5;
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(v4 + 32) = *(void *)(a2 + 40);
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = v6;
  *(void *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MultiUserContext(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 64))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      unint64_t v3 = *(void *)(a1 + 32);
      if (v3 >= 0xFFFFFFFF) {
        LODWORD(v3) = -1;
      }
      int v2 = v3 - 1;
      if (v2 < 0) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MultiUserContext(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)double result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 64) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 64) = 0;
    }
    if (a2) {
      *(void *)(result + 32) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MultiUserContext()
{
  return &type metadata for MultiUserContext;
}

double one-time initialization function for internalSharedContext()
{
  type metadata accessor for RefreshableSharedContext();
  uint64_t v0 = swift_allocObject();
  double result = 0.0;
  *(_OWORD *)(v0 + 16) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  *(void *)(v0 + 48) = 0;
  static SharedContext.internalSharedContext = v0;
  return result;
}

double RefreshableSharedContext.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  double result = 0.0;
  *(_OWORD *)(v0 + 16) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  *(void *)(v0 + 48) = 0;
  return result;
}

uint64_t static SharedContext.internalSharedContext.getter()
{
  if (one-time initialization token for internalSharedContext != -1) {
    swift_once();
  }
  return swift_retain();
}

uint64_t static SharedContext.current.getter@<X0>(uint64_t *a1@<X8>)
{
  if (one-time initialization token for internalSharedContext != -1) {
    swift_once();
  }
  uint64_t v2 = static SharedContext.internalSharedContext;
  a1[3] = type metadata accessor for RefreshableSharedContext();
  a1[4] = (uint64_t)&protocol witness table for RefreshableSharedContext;
  *a1 = v2;
  return swift_retain();
}

uint64_t key path setter for RefreshableSharedContext.sharedContext : RefreshableSharedContext(uint64_t a1, uint64_t a2)
{
  outlined init with copy of SharedContextService?(a1, (uint64_t)v4);
  return (*(uint64_t (**)(unsigned char *))(**(void **)a2 + 96))(v4);
}

uint64_t RefreshableSharedContext.sharedContext.getter@<X0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  return outlined init with copy of SharedContextService?(v1 + 16, a1);
}

uint64_t RefreshableSharedContext.sharedContext.setter(uint64_t a1)
{
  swift_beginAccess();
  outlined assign with take of SharedContextService?(a1, v1 + 16);
  return swift_endAccess();
}

uint64_t (*RefreshableSharedContext.sharedContext.modify())()
{
  return RefreshableSharedContext.sharedContext.modify;
}

uint64_t RefreshableSharedContext.stateOrBail()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(long long *__return_ptr, uint64_t))(*(void *)v1 + 88))(&v18, v5);
  if (v19) {
    return outlined init with take of DeviceClassProvider(&v18, a1);
  }
  uint64_t v16 = v4;
  outlined destroy of SharedContextService?((uint64_t)&v18);
  static Logger.logger.getter();
  long long v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(void *)&long long v18 = v12;
    *(_DWORD *)uint64_t v11 = 136315650;
    uint64_t v13 = StaticString.description.getter();
    uint64_t v17 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v13, v14, (uint64_t *)&v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2048;
    uint64_t v17 = 51;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v11 + 22) = 2080;
    uint64_t v17 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000028, 0x800000021E6AE710, (uint64_t *)&v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&dword_21E680000, v9, v10, "FatalError at %s:%lu - %s", (uint8_t *)v11, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x223C2EF70](v12, -1, -1);
    MEMORY[0x223C2EF70](v11, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v16 + 8))(v7, v3);
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t RefreshableSharedContext.fetchContext(for:includesNearbyDevices:with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  RefreshableSharedContext.stateOrBail()((uint64_t)v11);
  uint64_t v8 = v12;
  uint64_t v9 = v13;
  __swift_project_boxed_opaque_existential_1(v11, v12);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 8))(a1, a2, a3, a4, v8, v9);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
}

uint64_t RefreshableSharedContext._fetchContext(with:)(uint64_t a1, uint64_t a2)
{
  RefreshableSharedContext.stateOrBail()((uint64_t)v7);
  uint64_t v4 = v8;
  uint64_t v5 = v9;
  __swift_project_boxed_opaque_existential_1(v7, v8);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 16))(a1, a2, v4, v5);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
}

uint64_t RefreshableSharedContext.deinit()
{
  outlined destroy of SharedContextService?(v0 + 16);
  return v0;
}

uint64_t RefreshableSharedContext.__deallocating_deinit()
{
  outlined destroy of SharedContextService?(v0 + 16);
  return MEMORY[0x270FA0228](v0, 56, 7);
}

double RefreshableSharedContext.init()()
{
  *(void *)(v0 + 48) = 0;
  double result = 0.0;
  *(_OWORD *)(v0 + 16) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  return result;
}

uint64_t type metadata accessor for RefreshableSharedContext()
{
  return self;
}

uint64_t outlined init with copy of SharedContextService?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SharedContextService?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined assign with take of SharedContextService?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SharedContextService?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of SharedContextService?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SharedContextService?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t protocol witness for SharedContextService.fetchContext(for:includesNearbyDevices:with:) in conformance RefreshableSharedContext()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 120))();
}

uint64_t protocol witness for SharedContextService._fetchContext(with:) in conformance RefreshableSharedContext()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 128))();
}

uint64_t sub_21E6886E4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 88))();
}

ValueMetadata *type metadata accessor for SharedContext()
{
  return &type metadata for SharedContext;
}

uint64_t dispatch thunk of SharedContextService.fetchContext(for:includesNearbyDevices:with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

uint64_t dispatch thunk of SharedContextService._fetchContext(with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t method lookup function for RefreshableSharedContext(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for RefreshableSharedContext);
}

uint64_t dispatch thunk of RefreshableSharedContext.sharedContext.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 88))();
}

uint64_t dispatch thunk of RefreshableSharedContext.sharedContext.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t dispatch thunk of RefreshableSharedContext.sharedContext.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of RefreshableSharedContext.fetchContext(for:includesNearbyDevices:with:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of RefreshableSharedContext._fetchContext(with:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of RefreshableSharedContext.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t SiriEnvironment.currentRequest.getter()
{
  type metadata accessor for CurrentRequest();
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  return dispatch thunk of SiriEnvironment.subscript.getter();
}

uint64_t type metadata accessor for CurrentRequest()
{
  return self;
}

uint64_t key path setter for SiriEnvironment.currentRequest : SiriEnvironment()
{
  return SiriEnvironment.currentRequest.setter();
}

uint64_t SiriEnvironment.currentRequest.setter()
{
  type metadata accessor for CurrentRequest();
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  return dispatch thunk of SiriEnvironment.subscript.setter();
}

uint64_t (*SiriEnvironment.currentRequest.modify(uint64_t *a1))(uint64_t a1, char a2)
{
  a1[1] = v1;
  a1[2] = type metadata accessor for CurrentRequest();
  a1[3] = lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  *a1 = dispatch thunk of SiriEnvironment.subscript.getter();
  return SiriEnvironment.currentRequest.modify;
}

uint64_t SiriEnvironment.currentRequest.modify(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return dispatch thunk of SiriEnvironment.subscript.setter();
  }
  swift_retain();
  dispatch thunk of SiriEnvironment.subscript.setter();
  return swift_release();
}

SiriFlowEnvironment::RequestPositionInSession_optional __swiftcall RequestPositionInSession.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = 3;
  if ((unint64_t)rawValue < 3) {
    char v2 = rawValue;
  }
  *uint64_t v1 = v2;
  return (SiriFlowEnvironment::RequestPositionInSession_optional)rawValue;
}

uint64_t RequestPositionInSession.rawValue.getter()
{
  return *v0;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance RequestPositionInSession(char *a1, char *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance RequestPositionInSession()
{
  return specialized RawRepresentable<>.hashValue.getter(*v0);
}

void protocol witness for Hashable.hash(into:) in conformance RequestPositionInSession(uint64_t a1)
{
  specialized RawRepresentable<>.hash(into:)(a1, *v1);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance RequestPositionInSession(uint64_t a1)
{
  return specialized RawRepresentable<>._rawHashValue(seed:)(a1, *v1);
}

SiriFlowEnvironment::RequestPositionInSession_optional protocol witness for RawRepresentable.init(rawValue:) in conformance RequestPositionInSession(Swift::Int *a1)
{
  return RequestPositionInSession.init(rawValue:)(*a1);
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance RequestPositionInSession@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = RequestPositionInSession.rawValue.getter();
  *a1 = result;
  return result;
}

uint64_t protocol witness for Decodable.init(from:) in conformance RequestPositionInSession()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t protocol witness for Encodable.encode(to:) in conformance RequestPositionInSession()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t CurrentRequest.mock.getter()
{
  return swift_retain();
}

uint64_t CurrentRequest.mock.setter(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 16) = a1;
  return swift_release();
}

uint64_t (*CurrentRequest.mock.modify())()
{
  return CurrentRequest.mock.modify;
}

uint64_t CurrentRequest.refId.getter()
{
  return CurrentRequest.refId.getter();
}

{
  uint64_t v1;

  OUTLINED_FUNCTION_218();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>);
  OUTLINED_FUNCTION_241();
  OUTLINED_FUNCTION_138();
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  OUTLINED_FUNCTION_110();
  swift_release();
  swift_release();
  return v1;
}

uint64_t key path getter for CurrentRequest.refId : CurrentRequest@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CurrentRequest.refId.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_21E688C94()
{
  OUTLINED_FUNCTION_54();
  uint64_t result = CurrentRequest.refId.getter();
  uint64_t *v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t key path setter for CurrentRequest.refId : CurrentRequest(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.refId : CurrentRequest(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))CurrentRequest.refId.setter);
}

void CurrentRequest.refId.setter()
{
}

{
  OUTLINED_FUNCTION_217();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>);
  swift_getKeyPath();
  OUTLINED_FUNCTION_138();
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  OUTLINED_FUNCTION_240();
  static MockablePublished.subscript.setter();
  OUTLINED_FUNCTION_214();
}

uint64_t (*CurrentRequest.refId.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_32((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>);
  uint64_t KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_31(KeyPath);
  uint64_t v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_30(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  *(void *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  return CurrentRequest.refId.modify;
}

uint64_t CurrentRequest.$refId.getter()
{
  return swift_release();
}

uint64_t CurrentRequest.$refId.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_14();
  uint64_t v1 = OUTLINED_FUNCTION_5_0();
  v2(v1);
  swift_retain();
  dispatch thunk of MockablePublished.projectedValue.setter();
  swift_release();
  uint64_t v3 = OUTLINED_FUNCTION_10_0();
  return v4(v3);
}

void (*CurrentRequest.$refId.modify())(uint64_t a1, char a2)
{
  uint64_t v1 = OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_17(v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
  OUTLINED_FUNCTION_1_1(v2);
  *(void *)(v0 + 16) = v3;
  uint64_t v5 = malloc(*(void *)(v4 + 64));
  uint64_t v6 = OUTLINED_FUNCTION_29((uint64_t)v5);
  OUTLINED_FUNCTION_16((uint64_t)v6);
  CurrentRequest.$refId.getter();
  return CurrentRequest.$refId.modify;
}

void CurrentRequest.$refId.modify(uint64_t a1, char a2)
{
}

uint64_t CurrentRequest.aceId.getter()
{
  return CurrentRequest.refId.getter();
}

uint64_t key path getter for CurrentRequest.aceId : CurrentRequest@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CurrentRequest.aceId.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_21E688FFC()
{
  OUTLINED_FUNCTION_54();
  uint64_t result = CurrentRequest.aceId.getter();
  uint64_t *v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t key path setter for CurrentRequest.aceId : CurrentRequest(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.refId : CurrentRequest(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))CurrentRequest.aceId.setter);
}

void CurrentRequest.aceId.setter()
{
}

uint64_t (*CurrentRequest.aceId.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_32((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>);
  uint64_t KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_31(KeyPath);
  uint64_t v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_30(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  *(void *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  return CurrentRequest.refId.modify;
}

uint64_t CurrentRequest.$aceId.getter()
{
  return swift_release();
}

uint64_t CurrentRequest.$aceId.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_14();
  uint64_t v1 = OUTLINED_FUNCTION_5_0();
  v2(v1);
  swift_retain();
  dispatch thunk of MockablePublished.projectedValue.setter();
  swift_release();
  uint64_t v3 = OUTLINED_FUNCTION_10_0();
  return v4(v3);
}

void (*CurrentRequest.$aceId.modify())(uint64_t a1, char a2)
{
  uint64_t v1 = OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_17(v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
  OUTLINED_FUNCTION_1_1(v2);
  *(void *)(v0 + 16) = v3;
  uint64_t v5 = malloc(*(void *)(v4 + 64));
  uint64_t v6 = OUTLINED_FUNCTION_29((uint64_t)v5);
  OUTLINED_FUNCTION_16((uint64_t)v6);
  CurrentRequest.$aceId.getter();
  return CurrentRequest.$aceId.modify;
}

void CurrentRequest.$aceId.modify(uint64_t a1, char a2)
{
}

uint64_t CurrentRequest.executionRequestId.getter()
{
  return CurrentRequest.refId.getter();
}

uint64_t key path getter for CurrentRequest.executionRequestId : CurrentRequest@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CurrentRequest.executionRequestId.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_21E68937C()
{
  OUTLINED_FUNCTION_54();
  uint64_t result = CurrentRequest.executionRequestId.getter();
  uint64_t *v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t key path setter for CurrentRequest.executionRequestId : CurrentRequest(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.refId : CurrentRequest(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))CurrentRequest.executionRequestId.setter);
}

void CurrentRequest.executionRequestId.setter()
{
}

uint64_t (*CurrentRequest.executionRequestId.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_32((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>);
  uint64_t KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_31(KeyPath);
  uint64_t v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_30(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  *(void *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  return CurrentRequest.refId.modify;
}

uint64_t CurrentRequest.$executionRequestId.getter()
{
  return swift_release();
}

uint64_t CurrentRequest.$executionRequestId.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_14();
  uint64_t v1 = OUTLINED_FUNCTION_5_0();
  v2(v1);
  swift_retain();
  dispatch thunk of MockablePublished.projectedValue.setter();
  swift_release();
  uint64_t v3 = OUTLINED_FUNCTION_10_0();
  return v4(v3);
}

void (*CurrentRequest.$executionRequestId.modify())(uint64_t a1, char a2)
{
  uint64_t v1 = OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_17(v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
  OUTLINED_FUNCTION_1_1(v2);
  *(void *)(v0 + 16) = v3;
  uint64_t v5 = malloc(*(void *)(v4 + 64));
  uint64_t v6 = OUTLINED_FUNCTION_29((uint64_t)v5);
  OUTLINED_FUNCTION_16((uint64_t)v6);
  CurrentRequest.$executionRequestId.getter();
  return CurrentRequest.$executionRequestId.modify;
}

void CurrentRequest.$executionRequestId.modify(uint64_t a1, char a2)
{
}

uint64_t CurrentRequest.sessionHandoffContinuityID.getter()
{
  return CurrentRequest.refId.getter();
}

uint64_t key path getter for CurrentRequest.sessionHandoffContinuityID : CurrentRequest@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CurrentRequest.sessionHandoffContinuityID.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_21E689658()
{
  OUTLINED_FUNCTION_54();
  uint64_t result = CurrentRequest.sessionHandoffContinuityID.getter();
  uint64_t *v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t key path setter for CurrentRequest.sessionHandoffContinuityID : CurrentRequest(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.refId : CurrentRequest(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))CurrentRequest.sessionHandoffContinuityID.setter);
}

void CurrentRequest.sessionHandoffContinuityID.setter()
{
}

uint64_t (*CurrentRequest.sessionHandoffContinuityID.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_32((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>);
  uint64_t KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_31(KeyPath);
  uint64_t v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_30(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  *(void *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  return CurrentRequest.refId.modify;
}

uint64_t CurrentRequest.$sessionHandoffContinuityID.getter()
{
  return swift_release();
}

uint64_t CurrentRequest.$sessionHandoffContinuityID.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_14();
  uint64_t v1 = OUTLINED_FUNCTION_5_0();
  v2(v1);
  swift_retain();
  dispatch thunk of MockablePublished.projectedValue.setter();
  swift_release();
  uint64_t v3 = OUTLINED_FUNCTION_10_0();
  return v4(v3);
}

void (*CurrentRequest.$sessionHandoffContinuityID.modify())(uint64_t a1, char a2)
{
  uint64_t v1 = OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_17(v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
  OUTLINED_FUNCTION_1_1(v2);
  *(void *)(v0 + 16) = v3;
  uint64_t v5 = malloc(*(void *)(v4 + 64));
  uint64_t v6 = OUTLINED_FUNCTION_29((uint64_t)v5);
  OUTLINED_FUNCTION_16((uint64_t)v6);
  CurrentRequest.$sessionHandoffContinuityID.getter();
  return CurrentRequest.$sessionHandoffContinuityID.modify;
}

void CurrentRequest.$sessionHandoffContinuityID.modify(uint64_t a1, char a2)
{
}

uint64_t CurrentRequest.peerName.getter()
{
  return CurrentRequest.refId.getter();
}

uint64_t key path getter for CurrentRequest.peerName : CurrentRequest@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CurrentRequest.peerName.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_21E689934()
{
  OUTLINED_FUNCTION_54();
  uint64_t result = CurrentRequest.peerName.getter();
  uint64_t *v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t key path setter for CurrentRequest.peerName : CurrentRequest(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.refId : CurrentRequest(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))CurrentRequest.peerName.setter);
}

void CurrentRequest.peerName.setter()
{
}

uint64_t (*CurrentRequest.peerName.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_32((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>);
  uint64_t KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_31(KeyPath);
  uint64_t v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_30(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  *(void *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  return CurrentRequest.refId.modify;
}

uint64_t CurrentRequest.$peerName.getter()
{
  return swift_release();
}

uint64_t CurrentRequest.$peerName.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_14();
  uint64_t v1 = OUTLINED_FUNCTION_5_0();
  v2(v1);
  swift_retain();
  dispatch thunk of MockablePublished.projectedValue.setter();
  swift_release();
  uint64_t v3 = OUTLINED_FUNCTION_10_0();
  return v4(v3);
}

void (*CurrentRequest.$peerName.modify())(uint64_t a1, char a2)
{
  uint64_t v1 = OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_17(v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
  OUTLINED_FUNCTION_1_1(v2);
  *(void *)(v0 + 16) = v3;
  uint64_t v5 = malloc(*(void *)(v4 + 64));
  uint64_t v6 = OUTLINED_FUNCTION_29((uint64_t)v5);
  OUTLINED_FUNCTION_16((uint64_t)v6);
  CurrentRequest.$peerName.getter();
  return CurrentRequest.$peerName.modify;
}

void CurrentRequest.$peerName.modify(uint64_t a1, char a2)
{
}

uint64_t CurrentRequest.inputOrigin.getter()
{
  return CurrentRequest.inputOrigin.getter(&demangling cache variable for type metadata for MockablePublished<InputOrigin>);
}

uint64_t key path getter for CurrentRequest.inputOrigin : CurrentRequest()
{
  return CurrentRequest.inputOrigin.getter();
}

uint64_t sub_21E689C10()
{
  return CurrentRequest.inputOrigin.getter();
}

uint64_t key path setter for CurrentRequest.inputOrigin : CurrentRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.inputOrigin : CurrentRequest(a1, a2, a3, a4, MEMORY[0x263F756E8], (uint64_t (*)(char *))CurrentRequest.inputOrigin.setter);
}

void CurrentRequest.inputOrigin.setter()
{
}

{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(void);

  OUTLINED_FUNCTION_60();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4(0);
  OUTLINED_FUNCTION_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  __swift_instantiateConcreteTypeFromMangledName(v1);
  swift_getKeyPath();
  swift_getKeyPath();
  OUTLINED_FUNCTION_13();
  v9();
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  swift_retain();
  OUTLINED_FUNCTION_184();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v3, v5);
  OUTLINED_FUNCTION_59();
}

uint64_t (*CurrentRequest.inputOrigin.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_32((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<InputOrigin>);
  uint64_t KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_31(KeyPath);
  uint64_t v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_30(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  *(void *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  return CurrentRequest.refId.modify;
}

uint64_t CurrentRequest.$inputOrigin.getter()
{
  return swift_release();
}

uint64_t CurrentRequest.$inputOrigin.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<InputOrigin>.Publisher);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_14();
  uint64_t v1 = OUTLINED_FUNCTION_5_0();
  v2(v1);
  swift_retain();
  dispatch thunk of MockablePublished.projectedValue.setter();
  swift_release();
  uint64_t v3 = OUTLINED_FUNCTION_10_0();
  return v4(v3);
}

void (*CurrentRequest.$inputOrigin.modify())(uint64_t a1, char a2)
{
  uint64_t v1 = OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_17(v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<InputOrigin>.Publisher);
  OUTLINED_FUNCTION_1_1(v2);
  *(void *)(v0 + 16) = v3;
  uint64_t v5 = malloc(*(void *)(v4 + 64));
  uint64_t v6 = OUTLINED_FUNCTION_29((uint64_t)v5);
  OUTLINED_FUNCTION_16((uint64_t)v6);
  CurrentRequest.$inputOrigin.getter();
  return CurrentRequest.$inputOrigin.modify;
}

void CurrentRequest.$inputOrigin.modify(uint64_t a1, char a2)
{
}

uint64_t CurrentRequest.interactionType.getter()
{
  return CurrentRequest.inputOrigin.getter(&demangling cache variable for type metadata for MockablePublished<InteractionType>);
}

uint64_t CurrentRequest.inputOrigin.getter(uint64_t *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(a1);
  OUTLINED_FUNCTION_239();
  OUTLINED_FUNCTION_138();
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  static MockablePublished.subscript.getter();
  swift_release();
  return swift_release();
}

uint64_t key path getter for CurrentRequest.interactionType : CurrentRequest()
{
  return CurrentRequest.interactionType.getter();
}

uint64_t sub_21E689FB8()
{
  return CurrentRequest.interactionType.getter();
}

uint64_t key path setter for CurrentRequest.interactionType : CurrentRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.inputOrigin : CurrentRequest(a1, a2, a3, a4, MEMORY[0x263F75800], (uint64_t (*)(char *))CurrentRequest.interactionType.setter);
}

void CurrentRequest.interactionType.setter()
{
}

uint64_t (*CurrentRequest.interactionType.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_32((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<InteractionType>);
  uint64_t KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_31(KeyPath);
  uint64_t v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_30(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  *(void *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  return CurrentRequest.refId.modify;
}

uint64_t CurrentRequest.$interactionType.getter()
{
  return swift_release();
}

uint64_t CurrentRequest.$interactionType.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<InteractionType>.Publisher);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_14();
  uint64_t v1 = OUTLINED_FUNCTION_5_0();
  v2(v1);
  swift_retain();
  dispatch thunk of MockablePublished.projectedValue.setter();
  swift_release();
  uint64_t v3 = OUTLINED_FUNCTION_10_0();
  return v4(v3);
}

void (*CurrentRequest.$interactionType.modify())(uint64_t a1, char a2)
{
  uint64_t v1 = OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_17(v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<InteractionType>.Publisher);
  OUTLINED_FUNCTION_1_1(v2);
  *(void *)(v0 + 16) = v3;
  uint64_t v5 = malloc(*(void *)(v4 + 64));
  uint64_t v6 = OUTLINED_FUNCTION_29((uint64_t)v5);
  OUTLINED_FUNCTION_16((uint64_t)v6);
  CurrentRequest.$interactionType.getter();
  return CurrentRequest.$interactionType.modify;
}

void CurrentRequest.$interactionType.modify(uint64_t a1, char a2)
{
}

uint64_t CurrentRequest.interactionId.getter()
{
  return CurrentRequest.refId.getter();
}

uint64_t key path getter for CurrentRequest.interactionId : CurrentRequest@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CurrentRequest.interactionId.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_21E68A3D4()
{
  OUTLINED_FUNCTION_54();
  uint64_t result = CurrentRequest.interactionId.getter();
  uint64_t *v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t key path setter for CurrentRequest.interactionId : CurrentRequest(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.refId : CurrentRequest(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))CurrentRequest.interactionId.setter);
}

void CurrentRequest.interactionId.setter()
{
}

uint64_t (*CurrentRequest.interactionId.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_32((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>);
  uint64_t KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_31(KeyPath);
  uint64_t v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_30(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  *(void *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  return CurrentRequest.refId.modify;
}

uint64_t CurrentRequest.$interactionId.getter()
{
  return swift_release();
}

uint64_t CurrentRequest.$interactionId.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_14();
  uint64_t v1 = OUTLINED_FUNCTION_5_0();
  v2(v1);
  swift_retain();
  dispatch thunk of MockablePublished.projectedValue.setter();
  swift_release();
  uint64_t v3 = OUTLINED_FUNCTION_10_0();
  return v4(v3);
}

void (*CurrentRequest.$interactionId.modify())(uint64_t a1, char a2)
{
  uint64_t v1 = OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_17(v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
  OUTLINED_FUNCTION_1_1(v2);
  *(void *)(v0 + 16) = v3;
  uint64_t v5 = malloc(*(void *)(v4 + 64));
  uint64_t v6 = OUTLINED_FUNCTION_29((uint64_t)v5);
  OUTLINED_FUNCTION_16((uint64_t)v6);
  CurrentRequest.$interactionId.getter();
  return CurrentRequest.$interactionId.modify;
}

void CurrentRequest.$interactionId.modify(uint64_t a1, char a2)
{
}

uint64_t CurrentRequest.audioSource.getter()
{
  return CurrentRequest.inputOrigin.getter(&demangling cache variable for type metadata for MockablePublished<AudioSource?>);
}

uint64_t key path getter for CurrentRequest.audioSource : CurrentRequest()
{
  return CurrentRequest.audioSource.getter();
}

uint64_t sub_21E68A6B0()
{
  return CurrentRequest.audioSource.getter();
}

uint64_t key path setter for CurrentRequest.audioSource : CurrentRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.audioSource : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for AudioSource?, (uint64_t (*)(char *))CurrentRequest.audioSource.setter);
}

uint64_t CurrentRequest.audioSource.setter(uint64_t a1)
{
  return CurrentRequest.audioSource.setter(a1, (uint64_t)&demangling cache variable for type metadata for AudioSource?, &demangling cache variable for type metadata for MockablePublished<AudioSource?>);
}

uint64_t (*CurrentRequest.audioSource.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_32((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AudioSource?>);
  uint64_t KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_31(KeyPath);
  uint64_t v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_30(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  *(void *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  return CurrentRequest.refId.modify;
}

uint64_t CurrentRequest.$audioSource.getter()
{
  return swift_release();
}

uint64_t CurrentRequest.$audioSource.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AudioSource?>.Publisher);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_14();
  uint64_t v1 = OUTLINED_FUNCTION_5_0();
  v2(v1);
  swift_retain();
  dispatch thunk of MockablePublished.projectedValue.setter();
  swift_release();
  uint64_t v3 = OUTLINED_FUNCTION_10_0();
  return v4(v3);
}

void (*CurrentRequest.$audioSource.modify())(uint64_t a1, char a2)
{
  uint64_t v1 = OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_17(v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AudioSource?>.Publisher);
  OUTLINED_FUNCTION_1_1(v2);
  *(void *)(v0 + 16) = v3;
  uint64_t v5 = malloc(*(void *)(v4 + 64));
  uint64_t v6 = OUTLINED_FUNCTION_29((uint64_t)v5);
  OUTLINED_FUNCTION_16((uint64_t)v6);
  CurrentRequest.$audioSource.getter();
  return CurrentRequest.$audioSource.modify;
}

void CurrentRequest.$audioSource.modify(uint64_t a1, char a2)
{
}

uint64_t CurrentRequest.audioDestination.getter()
{
  return CurrentRequest.inputOrigin.getter(&demangling cache variable for type metadata for MockablePublished<AudioDestination?>);
}

uint64_t key path getter for CurrentRequest.audioDestination : CurrentRequest()
{
  return CurrentRequest.audioDestination.getter();
}

uint64_t sub_21E68A9A0()
{
  return CurrentRequest.audioDestination.getter();
}

uint64_t key path setter for CurrentRequest.audioDestination : CurrentRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.audioSource : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for AudioDestination?, (uint64_t (*)(char *))CurrentRequest.audioDestination.setter);
}

uint64_t CurrentRequest.audioDestination.setter(uint64_t a1)
{
  return CurrentRequest.audioSource.setter(a1, (uint64_t)&demangling cache variable for type metadata for AudioDestination?, &demangling cache variable for type metadata for MockablePublished<AudioDestination?>);
}

uint64_t CurrentRequest.audioSource.setter(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  OUTLINED_FUNCTION_218();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(v6);
  uint64_t v8 = OUTLINED_FUNCTION_9(v7);
  MEMORY[0x270FA5388](v8);
  os_log_type_t v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(a3);
  swift_getKeyPath();
  swift_getKeyPath();
  outlined init with copy of AudioSource?(v4, (uint64_t)v10, v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  swift_retain();
  OUTLINED_FUNCTION_184();
  return outlined destroy of AudioSource?(v4, v3);
}

uint64_t (*CurrentRequest.audioDestination.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_32((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AudioDestination?>);
  uint64_t KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_31(KeyPath);
  uint64_t v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_30(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  *(void *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  return CurrentRequest.refId.modify;
}

uint64_t CurrentRequest.$audioDestination.getter()
{
  return swift_release();
}

uint64_t CurrentRequest.$audioDestination.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AudioDestination?>.Publisher);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_14();
  uint64_t v1 = OUTLINED_FUNCTION_5_0();
  v2(v1);
  swift_retain();
  dispatch thunk of MockablePublished.projectedValue.setter();
  swift_release();
  uint64_t v3 = OUTLINED_FUNCTION_10_0();
  return v4(v3);
}

void (*CurrentRequest.$audioDestination.modify())(uint64_t a1, char a2)
{
  uint64_t v1 = OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_17(v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AudioDestination?>.Publisher);
  OUTLINED_FUNCTION_1_1(v2);
  *(void *)(v0 + 16) = v3;
  uint64_t v5 = malloc(*(void *)(v4 + 64));
  uint64_t v6 = OUTLINED_FUNCTION_29((uint64_t)v5);
  OUTLINED_FUNCTION_16((uint64_t)v6);
  CurrentRequest.$audioDestination.getter();
  return CurrentRequest.$audioDestination.modify;
}

void CurrentRequest.$audioDestination.modify(uint64_t a1, char a2)
{
}

uint64_t CurrentRequest.responseMode.getter()
{
  return CurrentRequest.inputOrigin.getter(&demangling cache variable for type metadata for MockablePublished<ResponseMode>);
}

uint64_t key path getter for CurrentRequest.responseMode : CurrentRequest()
{
  return CurrentRequest.responseMode.getter();
}

uint64_t sub_21E68AD88()
{
  return CurrentRequest.responseMode.getter();
}

uint64_t key path setter for CurrentRequest.responseMode : CurrentRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.inputOrigin : CurrentRequest(a1, a2, a3, a4, MEMORY[0x263F75718], (uint64_t (*)(char *))CurrentRequest.responseMode.setter);
}

void CurrentRequest.responseMode.setter()
{
}

uint64_t (*CurrentRequest.responseMode.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_32((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ResponseMode>);
  uint64_t KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_31(KeyPath);
  uint64_t v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_30(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  *(void *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  return CurrentRequest.refId.modify;
}

uint64_t CurrentRequest.$responseMode.getter()
{
  return swift_release();
}

uint64_t CurrentRequest.$responseMode.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ResponseMode>.Publisher);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_14();
  uint64_t v1 = OUTLINED_FUNCTION_5_0();
  v2(v1);
  swift_retain();
  dispatch thunk of MockablePublished.projectedValue.setter();
  swift_release();
  uint64_t v3 = OUTLINED_FUNCTION_10_0();
  return v4(v3);
}

void (*CurrentRequest.$responseMode.modify())(uint64_t a1, char a2)
{
  uint64_t v1 = OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_17(v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ResponseMode>.Publisher);
  OUTLINED_FUNCTION_1_1(v2);
  *(void *)(v0 + 16) = v3;
  uint64_t v5 = malloc(*(void *)(v4 + 64));
  uint64_t v6 = OUTLINED_FUNCTION_29((uint64_t)v5);
  OUTLINED_FUNCTION_16((uint64_t)v6);
  CurrentRequest.$responseMode.getter();
  return CurrentRequest.$responseMode.modify;
}

void CurrentRequest.$responseMode.modify(uint64_t a1, char a2)
{
}

uint64_t CurrentRequest.multiUserState.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<MultiUserState>);
  swift_getKeyPath();
  swift_getKeyPath();
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  OUTLINED_FUNCTION_72();
  swift_release();
  return swift_release();
}

uint64_t key path getter for CurrentRequest.multiUserState : CurrentRequest()
{
  return CurrentRequest.multiUserState.getter();
}

uint64_t sub_21E68B114()
{
  return CurrentRequest.multiUserState.getter();
}

uint64_t key path setter for CurrentRequest.multiUserState : CurrentRequest(uint64_t a1)
{
  outlined init with copy of MultiUserState(a1, (uint64_t)v2);
  return CurrentRequest.multiUserState.setter((uint64_t)v2);
}

uint64_t CurrentRequest.multiUserState.setter(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<MultiUserState>);
  swift_getKeyPath();
  swift_getKeyPath();
  outlined init with copy of MultiUserState(a1, (uint64_t)&v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  swift_retain();
  OUTLINED_FUNCTION_223();
  return outlined destroy of MultiUserState(a1);
}

uint64_t (*CurrentRequest.multiUserState.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_32((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<MultiUserState>);
  uint64_t KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_31(KeyPath);
  uint64_t v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_30(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  *(void *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  return CurrentRequest.refId.modify;
}

uint64_t CurrentRequest.$multiUserState.getter()
{
  return swift_release();
}

uint64_t CurrentRequest.$multiUserState.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<MultiUserState>.Publisher);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_14();
  uint64_t v1 = OUTLINED_FUNCTION_5_0();
  v2(v1);
  swift_retain();
  dispatch thunk of MockablePublished.projectedValue.setter();
  swift_release();
  uint64_t v3 = OUTLINED_FUNCTION_10_0();
  return v4(v3);
}

void (*CurrentRequest.$multiUserState.modify())(uint64_t a1, char a2)
{
  uint64_t v1 = OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_17(v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<MultiUserState>.Publisher);
  OUTLINED_FUNCTION_1_1(v2);
  *(void *)(v0 + 16) = v3;
  uint64_t v5 = malloc(*(void *)(v4 + 64));
  uint64_t v6 = OUTLINED_FUNCTION_29((uint64_t)v5);
  OUTLINED_FUNCTION_16((uint64_t)v6);
  CurrentRequest.$multiUserState.getter();
  return CurrentRequest.$multiUserState.modify;
}

void CurrentRequest.$multiUserState.modify(uint64_t a1, char a2)
{
}

uint64_t CurrentRequest.bargeInContext.getter()
{
  return CurrentRequest.inputOrigin.getter(&demangling cache variable for type metadata for MockablePublished<BargeInContext?>);
}

uint64_t key path getter for CurrentRequest.bargeInContext : CurrentRequest()
{
  return CurrentRequest.bargeInContext.getter();
}

uint64_t sub_21E68B4AC()
{
  return CurrentRequest.bargeInContext.getter();
}

uint64_t key path setter for CurrentRequest.bargeInContext : CurrentRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.audioSource : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for BargeInContext?, (uint64_t (*)(char *))CurrentRequest.bargeInContext.setter);
}

uint64_t CurrentRequest.bargeInContext.setter(uint64_t a1)
{
  return CurrentRequest.audioSource.setter(a1, (uint64_t)&demangling cache variable for type metadata for BargeInContext?, &demangling cache variable for type metadata for MockablePublished<BargeInContext?>);
}

uint64_t (*CurrentRequest.bargeInContext.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_32((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<BargeInContext?>);
  uint64_t KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_31(KeyPath);
  uint64_t v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_30(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  *(void *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  return CurrentRequest.refId.modify;
}

uint64_t CurrentRequest.$bargeInContext.getter()
{
  return swift_release();
}

uint64_t CurrentRequest.$bargeInContext.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<BargeInContext?>.Publisher);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_14();
  uint64_t v1 = OUTLINED_FUNCTION_5_0();
  v2(v1);
  swift_retain();
  dispatch thunk of MockablePublished.projectedValue.setter();
  swift_release();
  uint64_t v3 = OUTLINED_FUNCTION_10_0();
  return v4(v3);
}

void (*CurrentRequest.$bargeInContext.modify())(uint64_t a1, char a2)
{
  uint64_t v1 = OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_17(v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<BargeInContext?>.Publisher);
  OUTLINED_FUNCTION_1_1(v2);
  *(void *)(v0 + 16) = v3;
  uint64_t v5 = malloc(*(void *)(v4 + 64));
  uint64_t v6 = OUTLINED_FUNCTION_29((uint64_t)v5);
  OUTLINED_FUNCTION_16((uint64_t)v6);
  CurrentRequest.$bargeInContext.getter();
  return CurrentRequest.$bargeInContext.modify;
}

void CurrentRequest.$bargeInContext.modify(uint64_t a1, char a2)
{
}

uint64_t CurrentRequest.sharedContextService.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SharedContextService?>);
  swift_getKeyPath();
  swift_getKeyPath();
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  OUTLINED_FUNCTION_72();
  swift_release();
  return swift_release();
}

uint64_t key path getter for CurrentRequest.sharedContextService : CurrentRequest()
{
  return CurrentRequest.sharedContextService.getter();
}

uint64_t sub_21E68B820()
{
  return CurrentRequest.sharedContextService.getter();
}

uint64_t key path setter for CurrentRequest.sharedContextService : CurrentRequest(uint64_t a1)
{
  outlined init with copy of AudioSource?(a1, (uint64_t)v2, &demangling cache variable for type metadata for SharedContextService?);
  return CurrentRequest.sharedContextService.setter((uint64_t)v2);
}

uint64_t CurrentRequest.sharedContextService.setter(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SharedContextService?>);
  swift_getKeyPath();
  swift_getKeyPath();
  outlined init with copy of AudioSource?(a1, (uint64_t)v3, &demangling cache variable for type metadata for SharedContextService?);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  swift_retain();
  static MockablePublished.subscript.setter();
  return outlined destroy of AudioSource?(a1, &demangling cache variable for type metadata for SharedContextService?);
}

uint64_t (*CurrentRequest.sharedContextService.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_32((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SharedContextService?>);
  uint64_t KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_31(KeyPath);
  uint64_t v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_30(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  *(void *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  return CurrentRequest.refId.modify;
}

uint64_t CurrentRequest.$sharedContextService.getter()
{
  return swift_release();
}

uint64_t CurrentRequest.$sharedContextService.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SharedContextService?>.Publisher);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_14();
  uint64_t v1 = OUTLINED_FUNCTION_5_0();
  v2(v1);
  swift_retain();
  dispatch thunk of MockablePublished.projectedValue.setter();
  swift_release();
  uint64_t v3 = OUTLINED_FUNCTION_10_0();
  return v4(v3);
}

void (*CurrentRequest.$sharedContextService.modify())(uint64_t a1, char a2)
{
  uint64_t v1 = OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_17(v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SharedContextService?>.Publisher);
  OUTLINED_FUNCTION_1_1(v2);
  *(void *)(v0 + 16) = v3;
  uint64_t v5 = malloc(*(void *)(v4 + 64));
  uint64_t v6 = OUTLINED_FUNCTION_29((uint64_t)v5);
  OUTLINED_FUNCTION_16((uint64_t)v6);
  CurrentRequest.$sharedContextService.getter();
  return CurrentRequest.$sharedContextService.modify;
}

void CurrentRequest.$sharedContextService.modify(uint64_t a1, char a2)
{
}

uint64_t CurrentRequest.originatingHome.getter()
{
  return CurrentRequest.inputOrigin.getter(&demangling cache variable for type metadata for MockablePublished<HomeInfo?>);
}

uint64_t key path getter for CurrentRequest.originatingHome : CurrentRequest()
{
  return CurrentRequest.originatingHome.getter();
}

uint64_t sub_21E68BBEC()
{
  return CurrentRequest.originatingHome.getter();
}

uint64_t key path setter for CurrentRequest.originatingHome : CurrentRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.audioSource : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for HomeInfo?, (uint64_t (*)(char *))CurrentRequest.originatingHome.setter);
}

uint64_t CurrentRequest.originatingHome.setter(uint64_t a1)
{
  return CurrentRequest.audioSource.setter(a1, (uint64_t)&demangling cache variable for type metadata for HomeInfo?, &demangling cache variable for type metadata for MockablePublished<HomeInfo?>);
}

uint64_t (*CurrentRequest.originatingHome.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_32((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<HomeInfo?>);
  uint64_t KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_31(KeyPath);
  uint64_t v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_30(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  *(void *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  return CurrentRequest.refId.modify;
}

uint64_t CurrentRequest.$originatingHome.getter()
{
  return swift_release();
}

uint64_t CurrentRequest.$originatingHome.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<HomeInfo?>.Publisher);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_14();
  uint64_t v1 = OUTLINED_FUNCTION_5_0();
  v2(v1);
  swift_retain();
  dispatch thunk of MockablePublished.projectedValue.setter();
  swift_release();
  uint64_t v3 = OUTLINED_FUNCTION_10_0();
  return v4(v3);
}

void (*CurrentRequest.$originatingHome.modify())(uint64_t a1, char a2)
{
  uint64_t v1 = OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_17(v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<HomeInfo?>.Publisher);
  OUTLINED_FUNCTION_1_1(v2);
  *(void *)(v0 + 16) = v3;
  uint64_t v5 = malloc(*(void *)(v4 + 64));
  uint64_t v6 = OUTLINED_FUNCTION_29((uint64_t)v5);
  OUTLINED_FUNCTION_16((uint64_t)v6);
  CurrentRequest.$originatingHome.getter();
  return CurrentRequest.$originatingHome.modify;
}

void CurrentRequest.$originatingHome.modify(uint64_t a1, char a2)
{
}

uint64_t CurrentRequest.speechPackage.getter()
{
  return CurrentRequest.speechPackage.getter(&demangling cache variable for type metadata for MockablePublished<AFSpeechPackage?>);
}

uint64_t key path getter for CurrentRequest.speechPackage : CurrentRequest@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CurrentRequest.speechPackage.getter();
  *a1 = result;
  return result;
}

uint64_t sub_21E68BEE4()
{
  OUTLINED_FUNCTION_54();
  uint64_t result = CurrentRequest.speechPackage.getter();
  uint64_t *v0 = result;
  return result;
}

void key path setter for CurrentRequest.speechPackage : CurrentRequest(id *a1)
{
  id v1 = *a1;
  CurrentRequest.speechPackage.setter();
}

void CurrentRequest.speechPackage.setter()
{
}

{
  uint64_t *v0;

  OUTLINED_FUNCTION_217();
  __swift_instantiateConcreteTypeFromMangledName(v0);
  OUTLINED_FUNCTION_239();
  OUTLINED_FUNCTION_138();
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  OUTLINED_FUNCTION_240();
  OUTLINED_FUNCTION_134();
  OUTLINED_FUNCTION_214();
}

uint64_t (*CurrentRequest.speechPackage.modify())()
{
  id v1 = OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_32((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AFSpeechPackage?>);
  uint64_t KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_31(KeyPath);
  uint64_t v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_30(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  *(void *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  return CurrentRequest.refId.modify;
}

uint64_t CurrentRequest.$speechPackage.getter()
{
  return swift_release();
}

uint64_t CurrentRequest.$speechPackage.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AFSpeechPackage?>.Publisher);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_14();
  uint64_t v1 = OUTLINED_FUNCTION_5_0();
  v2(v1);
  swift_retain();
  dispatch thunk of MockablePublished.projectedValue.setter();
  swift_release();
  uint64_t v3 = OUTLINED_FUNCTION_10_0();
  return v4(v3);
}

void (*CurrentRequest.$speechPackage.modify())(uint64_t a1, char a2)
{
  uint64_t v1 = OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_17(v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AFSpeechPackage?>.Publisher);
  OUTLINED_FUNCTION_1_1(v2);
  *(void *)(v0 + 16) = v3;
  uint64_t v5 = malloc(*(void *)(v4 + 64));
  uint64_t v6 = OUTLINED_FUNCTION_29((uint64_t)v5);
  OUTLINED_FUNCTION_16((uint64_t)v6);
  CurrentRequest.$speechPackage.getter();
  return CurrentRequest.$speechPackage.modify;
}

void CurrentRequest.$speechPackage.modify(uint64_t a1, char a2)
{
}

uint64_t CurrentRequest.resultCandidateId.getter()
{
  return CurrentRequest.refId.getter();
}

uint64_t key path getter for CurrentRequest.resultCandidateId : CurrentRequest@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CurrentRequest.resultCandidateId.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_21E68C1E0()
{
  OUTLINED_FUNCTION_54();
  uint64_t result = CurrentRequest.resultCandidateId.getter();
  uint64_t *v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t key path setter for CurrentRequest.resultCandidateId : CurrentRequest(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.refId : CurrentRequest(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))CurrentRequest.resultCandidateId.setter);
}

void CurrentRequest.resultCandidateId.setter()
{
}

uint64_t (*CurrentRequest.resultCandidateId.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_32((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>);
  uint64_t KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_31(KeyPath);
  uint64_t v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_30(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  *(void *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  return CurrentRequest.refId.modify;
}

uint64_t CurrentRequest.$resultCandidateId.getter()
{
  return swift_release();
}

uint64_t CurrentRequest.$resultCandidateId.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_14();
  uint64_t v1 = OUTLINED_FUNCTION_5_0();
  v2(v1);
  swift_retain();
  dispatch thunk of MockablePublished.projectedValue.setter();
  swift_release();
  uint64_t v3 = OUTLINED_FUNCTION_10_0();
  return v4(v3);
}

void (*CurrentRequest.$resultCandidateId.modify())(uint64_t a1, char a2)
{
  uint64_t v1 = OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_17(v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
  OUTLINED_FUNCTION_1_1(v2);
  *(void *)(v0 + 16) = v3;
  uint64_t v5 = malloc(*(void *)(v4 + 64));
  uint64_t v6 = OUTLINED_FUNCTION_29((uint64_t)v5);
  OUTLINED_FUNCTION_16((uint64_t)v6);
  CurrentRequest.$resultCandidateId.getter();
  return CurrentRequest.$resultCandidateId.modify;
}

void CurrentRequest.$resultCandidateId.modify(uint64_t a1, char a2)
{
}

uint64_t CurrentRequest.asrOnDevice.getter()
{
  return CurrentRequest.asrOnDevice.getter();
}

{
  unsigned __int8 v1;

  OUTLINED_FUNCTION_218();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool?>);
  OUTLINED_FUNCTION_241();
  OUTLINED_FUNCTION_138();
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  OUTLINED_FUNCTION_110();
  swift_release();
  swift_release();
  return v1;
}

uint64_t key path getter for CurrentRequest.asrOnDevice : CurrentRequest@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = CurrentRequest.asrOnDevice.getter();
  *a1 = result;
  return result;
}

uint64_t sub_21E68C4BC()
{
  OUTLINED_FUNCTION_54();
  uint64_t result = CurrentRequest.asrOnDevice.getter();
  unsigned char *v0 = result;
  return result;
}

void key path setter for CurrentRequest.asrOnDevice : CurrentRequest()
{
}

void sub_21E68C50C()
{
}

void CurrentRequest.asrOnDevice.setter()
{
}

{
  OUTLINED_FUNCTION_217();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool?>);
  OUTLINED_FUNCTION_239();
  OUTLINED_FUNCTION_138();
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  OUTLINED_FUNCTION_240();
  OUTLINED_FUNCTION_134();
  OUTLINED_FUNCTION_214();
}

uint64_t (*CurrentRequest.asrOnDevice.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_32((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool?>);
  uint64_t KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_31(KeyPath);
  uint64_t v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_30(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  *(void *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  return CurrentRequest.refId.modify;
}

uint64_t CurrentRequest.$asrOnDevice.getter()
{
  return swift_release();
}

uint64_t CurrentRequest.$asrOnDevice.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool?>.Publisher);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_14();
  uint64_t v1 = OUTLINED_FUNCTION_5_0();
  v2(v1);
  swift_retain();
  dispatch thunk of MockablePublished.projectedValue.setter();
  swift_release();
  uint64_t v3 = OUTLINED_FUNCTION_10_0();
  return v4(v3);
}

void (*CurrentRequest.$asrOnDevice.modify())(uint64_t a1, char a2)
{
  uint64_t v1 = OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_17(v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool?>.Publisher);
  OUTLINED_FUNCTION_1_1(v2);
  *(void *)(v0 + 16) = v3;
  uint64_t v5 = malloc(*(void *)(v4 + 64));
  uint64_t v6 = OUTLINED_FUNCTION_29((uint64_t)v5);
  OUTLINED_FUNCTION_16((uint64_t)v6);
  CurrentRequest.$asrOnDevice.getter();
  return CurrentRequest.$asrOnDevice.modify;
}

void CurrentRequest.$asrOnDevice.modify(uint64_t a1, char a2)
{
}

uint64_t CurrentRequest.currentDeviceAssistantId.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String>);
  swift_getKeyPath();
  swift_getKeyPath();
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  OUTLINED_FUNCTION_242();
  swift_release();
  swift_release();
  return v1;
}

uint64_t key path getter for CurrentRequest.currentDeviceAssistantId : CurrentRequest@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CurrentRequest.currentDeviceAssistantId.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_21E68C854()
{
  OUTLINED_FUNCTION_54();
  uint64_t result = CurrentRequest.currentDeviceAssistantId.getter();
  uint64_t *v0 = result;
  v0[1] = v2;
  return result;
}

void key path setter for CurrentRequest.currentDeviceAssistantId : CurrentRequest()
{
}

void CurrentRequest.currentDeviceAssistantId.setter()
{
}

uint64_t (*CurrentRequest.currentDeviceAssistantId.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_32((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String>);
  uint64_t KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_31(KeyPath);
  uint64_t v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_30(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  *(void *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  return CurrentRequest.refId.modify;
}

uint64_t CurrentRequest.$currentDeviceAssistantId.getter()
{
  return swift_release();
}

uint64_t CurrentRequest.$currentDeviceAssistantId.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String>.Publisher);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_14();
  uint64_t v1 = OUTLINED_FUNCTION_5_0();
  v2(v1);
  swift_retain();
  dispatch thunk of MockablePublished.projectedValue.setter();
  swift_release();
  uint64_t v3 = OUTLINED_FUNCTION_10_0();
  return v4(v3);
}

void (*CurrentRequest.$currentDeviceAssistantId.modify())(uint64_t a1, char a2)
{
  uint64_t v1 = OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_17(v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String>.Publisher);
  OUTLINED_FUNCTION_1_1(v2);
  *(void *)(v0 + 16) = v3;
  uint64_t v5 = malloc(*(void *)(v4 + 64));
  uint64_t v6 = OUTLINED_FUNCTION_29((uint64_t)v5);
  OUTLINED_FUNCTION_16((uint64_t)v6);
  CurrentRequest.$currentDeviceAssistantId.getter();
  return CurrentRequest.$currentDeviceAssistantId.modify;
}

void CurrentRequest.$currentDeviceAssistantId.modify(uint64_t a1, char a2)
{
}

uint64_t CurrentRequest.voiceTriggerEventInfo.getter()
{
  return CurrentRequest.speechPackage.getter(&demangling cache variable for type metadata for MockablePublished<[String : String]?>);
}

uint64_t CurrentRequest.speechPackage.getter(uint64_t *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(a1);
  OUTLINED_FUNCTION_241();
  OUTLINED_FUNCTION_138();
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  OUTLINED_FUNCTION_110();
  swift_release();
  swift_release();
  return v2;
}

uint64_t key path getter for CurrentRequest.voiceTriggerEventInfo : CurrentRequest@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CurrentRequest.voiceTriggerEventInfo.getter();
  *a1 = result;
  return result;
}

uint64_t sub_21E68CC7C()
{
  OUTLINED_FUNCTION_54();
  uint64_t result = CurrentRequest.voiceTriggerEventInfo.getter();
  uint64_t *v0 = result;
  return result;
}

void key path setter for CurrentRequest.voiceTriggerEventInfo : CurrentRequest()
{
}

void CurrentRequest.voiceTriggerEventInfo.setter()
{
}

uint64_t (*CurrentRequest.voiceTriggerEventInfo.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_32((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<[String : String]?>);
  uint64_t KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_31(KeyPath);
  uint64_t v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_30(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  *(void *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  return CurrentRequest.refId.modify;
}

uint64_t CurrentRequest.$voiceTriggerEventInfo.getter()
{
  return swift_release();
}

uint64_t CurrentRequest.$voiceTriggerEventInfo.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<[String : String]?>.Publisher);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_14();
  uint64_t v1 = OUTLINED_FUNCTION_5_0();
  v2(v1);
  swift_retain();
  dispatch thunk of MockablePublished.projectedValue.setter();
  swift_release();
  uint64_t v3 = OUTLINED_FUNCTION_10_0();
  return v4(v3);
}

void (*CurrentRequest.$voiceTriggerEventInfo.modify())(uint64_t a1, char a2)
{
  uint64_t v1 = OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_17(v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<[String : String]?>.Publisher);
  OUTLINED_FUNCTION_1_1(v2);
  *(void *)(v0 + 16) = v3;
  uint64_t v5 = malloc(*(void *)(v4 + 64));
  uint64_t v6 = OUTLINED_FUNCTION_29((uint64_t)v5);
  OUTLINED_FUNCTION_16((uint64_t)v6);
  CurrentRequest.$voiceTriggerEventInfo.getter();
  return CurrentRequest.$voiceTriggerEventInfo.modify;
}

void CurrentRequest.$voiceTriggerEventInfo.modify(uint64_t a1, char a2)
{
}

uint64_t CurrentRequest.asrExecutionLocation.getter()
{
  return CurrentRequest.inputOrigin.getter(&demangling cache variable for type metadata for MockablePublished<ExecutionLocation>);
}

uint64_t key path getter for CurrentRequest.asrExecutionLocation : CurrentRequest()
{
  return CurrentRequest.asrExecutionLocation.getter();
}

uint64_t sub_21E68CFF0()
{
  return CurrentRequest.asrExecutionLocation.getter();
}

uint64_t key path setter for CurrentRequest.asrExecutionLocation : CurrentRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.inputOrigin : CurrentRequest(a1, a2, a3, a4, MEMORY[0x263F75828], (uint64_t (*)(char *))CurrentRequest.asrExecutionLocation.setter);
}

void CurrentRequest.asrExecutionLocation.setter()
{
}

uint64_t (*CurrentRequest.asrExecutionLocation.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_32((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ExecutionLocation>);
  uint64_t KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_31(KeyPath);
  uint64_t v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_30(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  *(void *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  return CurrentRequest.refId.modify;
}

uint64_t CurrentRequest.$asrExecutionLocation.getter()
{
  return swift_release();
}

uint64_t CurrentRequest.$asrExecutionLocation.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ExecutionLocation>.Publisher);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_14();
  uint64_t v1 = OUTLINED_FUNCTION_5_0();
  v2(v1);
  swift_retain();
  dispatch thunk of MockablePublished.projectedValue.setter();
  swift_release();
  uint64_t v3 = OUTLINED_FUNCTION_10_0();
  return v4(v3);
}

void (*CurrentRequest.$asrExecutionLocation.modify())(uint64_t a1, char a2)
{
  uint64_t v1 = OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_17(v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ExecutionLocation>.Publisher);
  OUTLINED_FUNCTION_1_1(v2);
  *(void *)(v0 + 16) = v3;
  uint64_t v5 = malloc(*(void *)(v4 + 64));
  uint64_t v6 = OUTLINED_FUNCTION_29((uint64_t)v5);
  OUTLINED_FUNCTION_16((uint64_t)v6);
  CurrentRequest.$asrExecutionLocation.getter();
  return CurrentRequest.$asrExecutionLocation.modify;
}

void CurrentRequest.$asrExecutionLocation.modify(uint64_t a1, char a2)
{
}

uint64_t CurrentRequest.nlExecutionLocation.getter()
{
  return CurrentRequest.inputOrigin.getter(&demangling cache variable for type metadata for MockablePublished<ExecutionLocation>);
}

uint64_t key path getter for CurrentRequest.nlExecutionLocation : CurrentRequest()
{
  return CurrentRequest.nlExecutionLocation.getter();
}

uint64_t sub_21E68D2F8()
{
  return CurrentRequest.nlExecutionLocation.getter();
}

uint64_t key path setter for CurrentRequest.nlExecutionLocation : CurrentRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.inputOrigin : CurrentRequest(a1, a2, a3, a4, MEMORY[0x263F75828], (uint64_t (*)(char *))CurrentRequest.nlExecutionLocation.setter);
}

uint64_t key path setter for CurrentRequest.inputOrigin : CurrentRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t (*a6)(char *))
{
  a5(0);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v13 - v8;
  uint64_t v10 = OUTLINED_FUNCTION_211();
  v11(v10);
  return a6(v9);
}

void CurrentRequest.nlExecutionLocation.setter()
{
}

uint64_t (*CurrentRequest.nlExecutionLocation.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_32((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ExecutionLocation>);
  uint64_t KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_31(KeyPath);
  uint64_t v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_30(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  *(void *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  return CurrentRequest.refId.modify;
}

uint64_t CurrentRequest.$nlExecutionLocation.getter()
{
  return swift_release();
}

uint64_t CurrentRequest.$nlExecutionLocation.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ExecutionLocation>.Publisher);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_14();
  uint64_t v1 = OUTLINED_FUNCTION_5_0();
  v2(v1);
  swift_retain();
  dispatch thunk of MockablePublished.projectedValue.setter();
  swift_release();
  uint64_t v3 = OUTLINED_FUNCTION_10_0();
  return v4(v3);
}

void (*CurrentRequest.$nlExecutionLocation.modify())(uint64_t a1, char a2)
{
  uint64_t v1 = OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_17(v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ExecutionLocation>.Publisher);
  OUTLINED_FUNCTION_1_1(v2);
  *(void *)(v0 + 16) = v3;
  uint64_t v5 = malloc(*(void *)(v4 + 64));
  uint64_t v6 = OUTLINED_FUNCTION_29((uint64_t)v5);
  OUTLINED_FUNCTION_16((uint64_t)v6);
  CurrentRequest.$nlExecutionLocation.getter();
  return CurrentRequest.$nlExecutionLocation.modify;
}

void CurrentRequest.$nlExecutionLocation.modify(uint64_t a1, char a2)
{
}

uint64_t CurrentRequest.companionName.getter()
{
  return CurrentRequest.refId.getter();
}

uint64_t key path getter for CurrentRequest.companionName : CurrentRequest@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CurrentRequest.companionName.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_21E68D69C()
{
  OUTLINED_FUNCTION_54();
  uint64_t result = CurrentRequest.companionName.getter();
  uint64_t *v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t key path setter for CurrentRequest.companionName : CurrentRequest(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.refId : CurrentRequest(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))CurrentRequest.companionName.setter);
}

void CurrentRequest.companionName.setter()
{
}

uint64_t (*CurrentRequest.companionName.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_32((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>);
  uint64_t KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_31(KeyPath);
  uint64_t v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_30(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  *(void *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  return CurrentRequest.refId.modify;
}

uint64_t CurrentRequest.$companionName.getter()
{
  return swift_release();
}

uint64_t CurrentRequest.$companionName.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_14();
  uint64_t v1 = OUTLINED_FUNCTION_5_0();
  v2(v1);
  swift_retain();
  dispatch thunk of MockablePublished.projectedValue.setter();
  swift_release();
  uint64_t v3 = OUTLINED_FUNCTION_10_0();
  return v4(v3);
}

void (*CurrentRequest.$companionName.modify())(uint64_t a1, char a2)
{
  uint64_t v1 = OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_17(v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
  OUTLINED_FUNCTION_1_1(v2);
  *(void *)(v0 + 16) = v3;
  uint64_t v5 = malloc(*(void *)(v4 + 64));
  uint64_t v6 = OUTLINED_FUNCTION_29((uint64_t)v5);
  OUTLINED_FUNCTION_16((uint64_t)v6);
  CurrentRequest.$companionName.getter();
  return CurrentRequest.$companionName.modify;
}

void CurrentRequest.$companionName.modify(uint64_t a1, char a2)
{
}

uint64_t CurrentRequest.isRecognizeMyVoiceEnabled.getter()
{
  return CurrentRequest.asrOnDevice.getter();
}

uint64_t key path getter for CurrentRequest.isRecognizeMyVoiceEnabled : CurrentRequest@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = CurrentRequest.isRecognizeMyVoiceEnabled.getter();
  *a1 = result;
  return result;
}

uint64_t sub_21E68DA00()
{
  OUTLINED_FUNCTION_54();
  uint64_t result = CurrentRequest.isRecognizeMyVoiceEnabled.getter();
  unsigned char *v0 = result;
  return result;
}

void key path setter for CurrentRequest.isRecognizeMyVoiceEnabled : CurrentRequest()
{
}

void sub_21E68DA50()
{
}

void CurrentRequest.isRecognizeMyVoiceEnabled.setter()
{
}

uint64_t (*CurrentRequest.isRecognizeMyVoiceEnabled.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_32((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool?>);
  uint64_t KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_31(KeyPath);
  uint64_t v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_30(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  *(void *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  return CurrentRequest.refId.modify;
}

uint64_t CurrentRequest.$isRecognizeMyVoiceEnabled.getter()
{
  return swift_release();
}

uint64_t CurrentRequest.$isRecognizeMyVoiceEnabled.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool?>.Publisher);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_14();
  uint64_t v1 = OUTLINED_FUNCTION_5_0();
  v2(v1);
  swift_retain();
  dispatch thunk of MockablePublished.projectedValue.setter();
  swift_release();
  uint64_t v3 = OUTLINED_FUNCTION_10_0();
  return v4(v3);
}

void (*CurrentRequest.$isRecognizeMyVoiceEnabled.modify())(uint64_t a1, char a2)
{
  uint64_t v1 = OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_17(v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool?>.Publisher);
  OUTLINED_FUNCTION_1_1(v2);
  *(void *)(v0 + 16) = v3;
  uint64_t v5 = malloc(*(void *)(v4 + 64));
  uint64_t v6 = OUTLINED_FUNCTION_29((uint64_t)v5);
  OUTLINED_FUNCTION_16((uint64_t)v6);
  CurrentRequest.$isRecognizeMyVoiceEnabled.getter();
  return CurrentRequest.$isRecognizeMyVoiceEnabled.modify;
}

void CurrentRequest.$isRecognizeMyVoiceEnabled.modify(uint64_t a1, char a2)
{
}

uint64_t CurrentRequest.flowTaskMetadata.getter()
{
  return CurrentRequest.inputOrigin.getter(&demangling cache variable for type metadata for MockablePublished<FlowTaskMetadata?>);
}

uint64_t key path getter for CurrentRequest.flowTaskMetadata : CurrentRequest()
{
  return CurrentRequest.flowTaskMetadata.getter();
}

uint64_t sub_21E68DD90()
{
  return CurrentRequest.flowTaskMetadata.getter();
}

uint64_t key path setter for CurrentRequest.flowTaskMetadata : CurrentRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.audioSource : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for FlowTaskMetadata?, (uint64_t (*)(char *))CurrentRequest.flowTaskMetadata.setter);
}

uint64_t key path setter for CurrentRequest.audioSource : CurrentRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t (*a6)(char *))
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v10 = OUTLINED_FUNCTION_9(v9);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of AudioSource?(a1, (uint64_t)v12, a5);
  return a6(v12);
}

uint64_t CurrentRequest.flowTaskMetadata.setter(uint64_t a1)
{
  return CurrentRequest.audioSource.setter(a1, (uint64_t)&demangling cache variable for type metadata for FlowTaskMetadata?, &demangling cache variable for type metadata for MockablePublished<FlowTaskMetadata?>);
}

uint64_t outlined init with copy of AudioSource?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t (*CurrentRequest.flowTaskMetadata.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_32((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<FlowTaskMetadata?>);
  uint64_t KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_31(KeyPath);
  uint64_t v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_30(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  *(void *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  return CurrentRequest.refId.modify;
}

uint64_t CurrentRequest.$flowTaskMetadata.getter()
{
  return swift_release();
}

uint64_t CurrentRequest.$flowTaskMetadata.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<FlowTaskMetadata?>.Publisher);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_14();
  uint64_t v1 = OUTLINED_FUNCTION_5_0();
  v2(v1);
  swift_retain();
  dispatch thunk of MockablePublished.projectedValue.setter();
  swift_release();
  uint64_t v3 = OUTLINED_FUNCTION_10_0();
  return v4(v3);
}

void (*CurrentRequest.$flowTaskMetadata.modify())(uint64_t a1, char a2)
{
  uint64_t v1 = OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_17(v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<FlowTaskMetadata?>.Publisher);
  OUTLINED_FUNCTION_1_1(v2);
  *(void *)(v0 + 16) = v3;
  uint64_t v5 = malloc(*(void *)(v4 + 64));
  uint64_t v6 = OUTLINED_FUNCTION_29((uint64_t)v5);
  OUTLINED_FUNCTION_16((uint64_t)v6);
  CurrentRequest.$flowTaskMetadata.getter();
  return CurrentRequest.$flowTaskMetadata.modify;
}

void CurrentRequest.$flowTaskMetadata.modify(uint64_t a1, char a2)
{
}

uint64_t CurrentRequest.voiceAudioSessionId.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<UInt32>);
  swift_getKeyPath();
  swift_getKeyPath();
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  OUTLINED_FUNCTION_242();
  swift_release();
  swift_release();
  return v1;
}

uint64_t key path getter for CurrentRequest.voiceAudioSessionId : CurrentRequest@<X0>(_DWORD *a1@<X8>)
{
  uint64_t result = CurrentRequest.voiceAudioSessionId.getter();
  *a1 = result;
  return result;
}

uint64_t sub_21E68E20C()
{
  OUTLINED_FUNCTION_54();
  uint64_t result = CurrentRequest.voiceAudioSessionId.getter();
  _DWORD *v0 = result;
  return result;
}

void key path setter for CurrentRequest.voiceAudioSessionId : CurrentRequest()
{
}

void sub_21E68E25C()
{
}

void CurrentRequest.voiceAudioSessionId.setter()
{
}

uint64_t (*CurrentRequest.voiceAudioSessionId.modify())()
{
  unsigned int v1 = OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_32((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<UInt32>);
  uint64_t KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_31(KeyPath);
  uint64_t v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_30(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  *(void *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  return CurrentRequest.refId.modify;
}

uint64_t CurrentRequest.$voiceAudioSessionId.getter()
{
  return swift_release();
}

uint64_t CurrentRequest.$voiceAudioSessionId.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<UInt32>.Publisher);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_14();
  uint64_t v1 = OUTLINED_FUNCTION_5_0();
  v2(v1);
  swift_retain();
  dispatch thunk of MockablePublished.projectedValue.setter();
  swift_release();
  uint64_t v3 = OUTLINED_FUNCTION_10_0();
  return v4(v3);
}

void (*CurrentRequest.$voiceAudioSessionId.modify())(uint64_t a1, char a2)
{
  uint64_t v1 = OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_17(v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<UInt32>.Publisher);
  OUTLINED_FUNCTION_1_1(v2);
  *(void *)(v0 + 16) = v3;
  uint64_t v5 = malloc(*(void *)(v4 + 64));
  uint64_t v6 = OUTLINED_FUNCTION_29((uint64_t)v5);
  OUTLINED_FUNCTION_16((uint64_t)v6);
  CurrentRequest.$voiceAudioSessionId.getter();
  return CurrentRequest.$voiceAudioSessionId.modify;
}

void CurrentRequest.$voiceAudioSessionId.modify(uint64_t a1, char a2)
{
}

uint64_t CurrentRequest.utterance.getter()
{
  return CurrentRequest.refId.getter();
}

uint64_t key path getter for CurrentRequest.utterance : CurrentRequest@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CurrentRequest.utterance.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_21E68E5B4()
{
  OUTLINED_FUNCTION_54();
  uint64_t result = CurrentRequest.utterance.getter();
  uint64_t *v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t key path setter for CurrentRequest.utterance : CurrentRequest(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.refId : CurrentRequest(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))CurrentRequest.utterance.setter);
}

void CurrentRequest.utterance.setter()
{
}

uint64_t (*CurrentRequest.utterance.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_32((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>);
  uint64_t KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_31(KeyPath);
  uint64_t v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_30(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  *(void *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  return CurrentRequest.refId.modify;
}

uint64_t CurrentRequest.$utterance.getter()
{
  return swift_release();
}

uint64_t CurrentRequest.$utterance.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_14();
  uint64_t v1 = OUTLINED_FUNCTION_5_0();
  v2(v1);
  swift_retain();
  dispatch thunk of MockablePublished.projectedValue.setter();
  swift_release();
  uint64_t v3 = OUTLINED_FUNCTION_10_0();
  return v4(v3);
}

void (*CurrentRequest.$utterance.modify())(uint64_t a1, char a2)
{
  uint64_t v1 = OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_17(v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
  OUTLINED_FUNCTION_1_1(v2);
  *(void *)(v0 + 16) = v3;
  uint64_t v5 = malloc(*(void *)(v4 + 64));
  uint64_t v6 = OUTLINED_FUNCTION_29((uint64_t)v5);
  OUTLINED_FUNCTION_16((uint64_t)v6);
  CurrentRequest.$utterance.getter();
  return CurrentRequest.$utterance.modify;
}

void CurrentRequest.$utterance.modify(uint64_t a1, char a2)
{
}

uint64_t CurrentRequest.isSystemApertureEnabled.getter()
{
  return CurrentRequest.isSystemApertureEnabled.getter();
}

{
  unsigned __int8 v1;

  OUTLINED_FUNCTION_218();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool>);
  OUTLINED_FUNCTION_241();
  OUTLINED_FUNCTION_138();
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  OUTLINED_FUNCTION_110();
  swift_release();
  swift_release();
  return v1;
}

uint64_t key path getter for CurrentRequest.isSystemApertureEnabled : CurrentRequest@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = CurrentRequest.isSystemApertureEnabled.getter();
  *a1 = result & 1;
  return result;
}

uint64_t sub_21E68E894()
{
  OUTLINED_FUNCTION_54();
  uint64_t result = CurrentRequest.isSystemApertureEnabled.getter();
  unsigned char *v0 = result & 1;
  return result;
}

void key path setter for CurrentRequest.isSystemApertureEnabled : CurrentRequest()
{
}

void sub_21E68E8E8()
{
}

void CurrentRequest.isSystemApertureEnabled.setter()
{
}

{
  OUTLINED_FUNCTION_217();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool>);
  OUTLINED_FUNCTION_239();
  OUTLINED_FUNCTION_138();
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  OUTLINED_FUNCTION_240();
  OUTLINED_FUNCTION_134();
  OUTLINED_FUNCTION_214();
}

uint64_t (*CurrentRequest.isSystemApertureEnabled.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_32((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool>);
  uint64_t KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_31(KeyPath);
  uint64_t v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_30(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  *(void *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  return CurrentRequest.refId.modify;
}

uint64_t CurrentRequest.$isSystemApertureEnabled.getter()
{
  return swift_release();
}

uint64_t CurrentRequest.$isSystemApertureEnabled.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool>.Publisher);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_14();
  uint64_t v1 = OUTLINED_FUNCTION_5_0();
  v2(v1);
  swift_retain();
  dispatch thunk of MockablePublished.projectedValue.setter();
  swift_release();
  uint64_t v3 = OUTLINED_FUNCTION_10_0();
  return v4(v3);
}

void (*CurrentRequest.$isSystemApertureEnabled.modify())(uint64_t a1, char a2)
{
  uint64_t v1 = OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_17(v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool>.Publisher);
  OUTLINED_FUNCTION_1_1(v2);
  *(void *)(v0 + 16) = v3;
  uint64_t v5 = malloc(*(void *)(v4 + 64));
  uint64_t v6 = OUTLINED_FUNCTION_29((uint64_t)v5);
  OUTLINED_FUNCTION_16((uint64_t)v6);
  CurrentRequest.$isSystemApertureEnabled.getter();
  return CurrentRequest.$isSystemApertureEnabled.modify;
}

void CurrentRequest.$isSystemApertureEnabled.modify(uint64_t a1, char a2)
{
}

uint64_t CurrentRequest.isLiveActivitiesSupported.getter()
{
  return CurrentRequest.isSystemApertureEnabled.getter();
}

uint64_t key path getter for CurrentRequest.isLiveActivitiesSupported : CurrentRequest@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = CurrentRequest.isLiveActivitiesSupported.getter();
  *a1 = result & 1;
  return result;
}

uint64_t sub_21E68EC34()
{
  OUTLINED_FUNCTION_54();
  uint64_t result = CurrentRequest.isLiveActivitiesSupported.getter();
  unsigned char *v0 = result & 1;
  return result;
}

void key path setter for CurrentRequest.isLiveActivitiesSupported : CurrentRequest()
{
}

void sub_21E68EC88()
{
}

void CurrentRequest.isLiveActivitiesSupported.setter()
{
}

uint64_t (*CurrentRequest.isLiveActivitiesSupported.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_32((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool>);
  uint64_t KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_31(KeyPath);
  uint64_t v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_30(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  *(void *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  return CurrentRequest.refId.modify;
}

uint64_t CurrentRequest.$isLiveActivitiesSupported.getter()
{
  return swift_release();
}

uint64_t CurrentRequest.$isLiveActivitiesSupported.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool>.Publisher);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_14();
  uint64_t v1 = OUTLINED_FUNCTION_5_0();
  v2(v1);
  swift_retain();
  dispatch thunk of MockablePublished.projectedValue.setter();
  swift_release();
  uint64_t v3 = OUTLINED_FUNCTION_10_0();
  return v4(v3);
}

void (*CurrentRequest.$isLiveActivitiesSupported.modify())(uint64_t a1, char a2)
{
  uint64_t v1 = OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_17(v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool>.Publisher);
  OUTLINED_FUNCTION_1_1(v2);
  *(void *)(v0 + 16) = v3;
  uint64_t v5 = malloc(*(void *)(v4 + 64));
  uint64_t v6 = OUTLINED_FUNCTION_29((uint64_t)v5);
  OUTLINED_FUNCTION_16((uint64_t)v6);
  CurrentRequest.$isLiveActivitiesSupported.getter();
  return CurrentRequest.$isLiveActivitiesSupported.modify;
}

void CurrentRequest.$isLiveActivitiesSupported.modify(uint64_t a1, char a2)
{
}

uint64_t CurrentRequest.isInAmbient.getter()
{
  return CurrentRequest.isSystemApertureEnabled.getter();
}

uint64_t key path getter for CurrentRequest.isInAmbient : CurrentRequest@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = CurrentRequest.isInAmbient.getter();
  *a1 = result & 1;
  return result;
}

uint64_t sub_21E68EFCC()
{
  OUTLINED_FUNCTION_54();
  uint64_t result = CurrentRequest.isInAmbient.getter();
  unsigned char *v0 = result & 1;
  return result;
}

void key path setter for CurrentRequest.isInAmbient : CurrentRequest()
{
}

void sub_21E68F020()
{
}

void CurrentRequest.isInAmbient.setter()
{
}

uint64_t (*CurrentRequest.isInAmbient.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_32((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool>);
  uint64_t KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_31(KeyPath);
  uint64_t v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_30(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  *(void *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  return CurrentRequest.refId.modify;
}

uint64_t CurrentRequest.$isInAmbient.getter()
{
  return swift_release();
}

uint64_t CurrentRequest.$isInAmbient.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool>.Publisher);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_14();
  uint64_t v1 = OUTLINED_FUNCTION_5_0();
  v2(v1);
  swift_retain();
  dispatch thunk of MockablePublished.projectedValue.setter();
  swift_release();
  uint64_t v3 = OUTLINED_FUNCTION_10_0();
  return v4(v3);
}

void (*CurrentRequest.$isInAmbient.modify())(uint64_t a1, char a2)
{
  uint64_t v1 = OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_17(v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool>.Publisher);
  OUTLINED_FUNCTION_1_1(v2);
  *(void *)(v0 + 16) = v3;
  uint64_t v5 = malloc(*(void *)(v4 + 64));
  uint64_t v6 = OUTLINED_FUNCTION_29((uint64_t)v5);
  OUTLINED_FUNCTION_16((uint64_t)v6);
  CurrentRequest.$isInAmbient.getter();
  return CurrentRequest.$isInAmbient.modify;
}

void CurrentRequest.$isInAmbient.modify(uint64_t a1, char a2)
{
}

uint64_t CurrentRequest.positionInSession.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<RequestPositionInSession>);
  swift_getKeyPath();
  swift_getKeyPath();
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  OUTLINED_FUNCTION_72();
  swift_release();
  return swift_release();
}

uint64_t key path getter for CurrentRequest.positionInSession : CurrentRequest@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = CurrentRequest.positionInSession.getter();
  *a1 = v3;
  return result;
}

void key path setter for CurrentRequest.positionInSession : CurrentRequest()
{
}

void CurrentRequest.positionInSession.setter()
{
}

uint64_t (*CurrentRequest.positionInSession.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_32((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<RequestPositionInSession>);
  uint64_t KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_31(KeyPath);
  uint64_t v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_30(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  *(void *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  return CurrentRequest.refId.modify;
}

uint64_t CurrentRequest.$positionInSession.getter()
{
  return swift_release();
}

uint64_t CurrentRequest.$positionInSession.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<RequestPositionInSession>.Publisher);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_14();
  uint64_t v1 = OUTLINED_FUNCTION_5_0();
  v2(v1);
  swift_retain();
  dispatch thunk of MockablePublished.projectedValue.setter();
  swift_release();
  uint64_t v3 = OUTLINED_FUNCTION_10_0();
  return v4(v3);
}

void (*CurrentRequest.$positionInSession.modify())(uint64_t a1, char a2)
{
  uint64_t v1 = OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_17(v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<RequestPositionInSession>.Publisher);
  OUTLINED_FUNCTION_1_1(v2);
  *(void *)(v0 + 16) = v3;
  uint64_t v5 = malloc(*(void *)(v4 + 64));
  uint64_t v6 = OUTLINED_FUNCTION_29((uint64_t)v5);
  OUTLINED_FUNCTION_16((uint64_t)v6);
  CurrentRequest.$positionInSession.getter();
  return CurrentRequest.$positionInSession.modify;
}

void CurrentRequest.$positionInSession.modify(uint64_t a1, char a2)
{
}

uint64_t CurrentRequest.responseLanguageVariant.getter()
{
  return CurrentRequest.refId.getter();
}

uint64_t key path getter for CurrentRequest.responseLanguageVariant : CurrentRequest@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CurrentRequest.responseLanguageVariant.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_21E68F6EC()
{
  OUTLINED_FUNCTION_54();
  uint64_t result = CurrentRequest.responseLanguageVariant.getter();
  uint64_t *v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t key path setter for CurrentRequest.responseLanguageVariant : CurrentRequest(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.refId : CurrentRequest(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))CurrentRequest.responseLanguageVariant.setter);
}

void CurrentRequest.responseLanguageVariant.setter()
{
}

uint64_t (*CurrentRequest.responseLanguageVariant.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_32((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>);
  uint64_t KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_31(KeyPath);
  uint64_t v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_30(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  *(void *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  return CurrentRequest.refId.modify;
}

uint64_t CurrentRequest.$responseLanguageVariant.getter()
{
  return swift_release();
}

uint64_t CurrentRequest.$responseLanguageVariant.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_14();
  uint64_t v1 = OUTLINED_FUNCTION_5_0();
  v2(v1);
  swift_retain();
  dispatch thunk of MockablePublished.projectedValue.setter();
  swift_release();
  uint64_t v3 = OUTLINED_FUNCTION_10_0();
  return v4(v3);
}

void (*CurrentRequest.$responseLanguageVariant.modify())(uint64_t a1, char a2)
{
  uint64_t v1 = OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_17(v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
  OUTLINED_FUNCTION_1_1(v2);
  *(void *)(v0 + 16) = v3;
  uint64_t v5 = malloc(*(void *)(v4 + 64));
  uint64_t v6 = OUTLINED_FUNCTION_29((uint64_t)v5);
  OUTLINED_FUNCTION_16((uint64_t)v6);
  CurrentRequest.$responseLanguageVariant.getter();
  return CurrentRequest.$responseLanguageVariant.modify;
}

void CurrentRequest.$responseLanguageVariant.modify(uint64_t a1, char a2)
{
}

uint64_t CurrentRequest.locationProvider.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SiriLocationProvider>);
  swift_getKeyPath();
  swift_getKeyPath();
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  OUTLINED_FUNCTION_72();
  swift_release();
  return swift_release();
}

uint64_t key path getter for CurrentRequest.locationProvider : CurrentRequest()
{
  return CurrentRequest.locationProvider.getter();
}

uint64_t sub_21E68FA4C()
{
  return CurrentRequest.locationProvider.getter();
}

uint64_t key path setter for CurrentRequest.locationProvider : CurrentRequest(uint64_t a1)
{
  outlined init with copy of SiriLocationProvider(a1, (uint64_t)v2);
  return CurrentRequest.locationProvider.setter((uint64_t)v2);
}

uint64_t CurrentRequest.locationProvider.setter(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SiriLocationProvider>);
  swift_getKeyPath();
  swift_getKeyPath();
  outlined init with copy of SiriLocationProvider(a1, (uint64_t)v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  swift_retain();
  OUTLINED_FUNCTION_223();
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

uint64_t outlined init with copy of SiriLocationProvider(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t (*CurrentRequest.locationProvider.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_32((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SiriLocationProvider>);
  uint64_t KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_31(KeyPath);
  uint64_t v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_30(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  *(void *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  return CurrentRequest.refId.modify;
}

uint64_t CurrentRequest.$locationProvider.getter()
{
  return swift_release();
}

uint64_t CurrentRequest.$locationProvider.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SiriLocationProvider>.Publisher);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_14();
  uint64_t v1 = OUTLINED_FUNCTION_5_0();
  v2(v1);
  swift_retain();
  dispatch thunk of MockablePublished.projectedValue.setter();
  swift_release();
  uint64_t v3 = OUTLINED_FUNCTION_10_0();
  return v4(v3);
}

void (*CurrentRequest.$locationProvider.modify())(uint64_t a1, char a2)
{
  uint64_t v1 = OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_17(v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SiriLocationProvider>.Publisher);
  OUTLINED_FUNCTION_1_1(v2);
  *(void *)(v0 + 16) = v3;
  uint64_t v5 = malloc(*(void *)(v4 + 64));
  uint64_t v6 = OUTLINED_FUNCTION_29((uint64_t)v5);
  OUTLINED_FUNCTION_16((uint64_t)v6);
  CurrentRequest.$locationProvider.getter();
  return CurrentRequest.$locationProvider.modify;
}

void CurrentRequest.$locationProvider.modify(uint64_t a1, char a2)
{
}

uint64_t CurrentRequest.requestLanguageVariant.getter()
{
  return CurrentRequest.refId.getter();
}

uint64_t key path getter for CurrentRequest.requestLanguageVariant : CurrentRequest@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CurrentRequest.requestLanguageVariant.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_21E68FE48()
{
  OUTLINED_FUNCTION_54();
  uint64_t result = CurrentRequest.requestLanguageVariant.getter();
  uint64_t *v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t key path setter for CurrentRequest.requestLanguageVariant : CurrentRequest(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.refId : CurrentRequest(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))CurrentRequest.requestLanguageVariant.setter);
}

void CurrentRequest.requestLanguageVariant.setter()
{
}

uint64_t (*CurrentRequest.requestLanguageVariant.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_32((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>);
  uint64_t KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_31(KeyPath);
  uint64_t v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_30(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  *(void *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  return CurrentRequest.refId.modify;
}

uint64_t CurrentRequest.$requestLanguageVariant.getter()
{
  return swift_release();
}

uint64_t CurrentRequest.$requestLanguageVariant.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_14();
  uint64_t v1 = OUTLINED_FUNCTION_5_0();
  v2(v1);
  swift_retain();
  dispatch thunk of MockablePublished.projectedValue.setter();
  swift_release();
  uint64_t v3 = OUTLINED_FUNCTION_10_0();
  return v4(v3);
}

void (*CurrentRequest.$requestLanguageVariant.modify())(uint64_t a1, char a2)
{
  uint64_t v1 = OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_17(v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
  OUTLINED_FUNCTION_1_1(v2);
  *(void *)(v0 + 16) = v3;
  uint64_t v5 = malloc(*(void *)(v4 + 64));
  uint64_t v6 = OUTLINED_FUNCTION_29((uint64_t)v5);
  OUTLINED_FUNCTION_16((uint64_t)v6);
  CurrentRequest.$requestLanguageVariant.getter();
  return CurrentRequest.$requestLanguageVariant.modify;
}

void CurrentRequest.$requestLanguageVariant.modify(uint64_t a1, char a2)
{
}

uint64_t CurrentRequest.rootRequestId.getter()
{
  return CurrentRequest.refId.getter();
}

uint64_t key path getter for CurrentRequest.rootRequestId : CurrentRequest@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CurrentRequest.rootRequestId.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_21E690124()
{
  OUTLINED_FUNCTION_54();
  uint64_t result = CurrentRequest.rootRequestId.getter();
  uint64_t *v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t key path setter for CurrentRequest.rootRequestId : CurrentRequest(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.refId : CurrentRequest(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))CurrentRequest.rootRequestId.setter);
}

void CurrentRequest.rootRequestId.setter()
{
}

uint64_t (*CurrentRequest.rootRequestId.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_32((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>);
  uint64_t KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_31(KeyPath);
  uint64_t v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_30(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  *(void *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  return CurrentRequest.refId.modify;
}

uint64_t CurrentRequest.$rootRequestId.getter()
{
  return swift_release();
}

uint64_t CurrentRequest.$rootRequestId.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_14();
  uint64_t v1 = OUTLINED_FUNCTION_5_0();
  v2(v1);
  swift_retain();
  dispatch thunk of MockablePublished.projectedValue.setter();
  swift_release();
  uint64_t v3 = OUTLINED_FUNCTION_10_0();
  return v4(v3);
}

void (*CurrentRequest.$rootRequestId.modify())(uint64_t a1, char a2)
{
  uint64_t v1 = OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_17(v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
  OUTLINED_FUNCTION_1_1(v2);
  *(void *)(v0 + 16) = v3;
  uint64_t v5 = malloc(*(void *)(v4 + 64));
  uint64_t v6 = OUTLINED_FUNCTION_29((uint64_t)v5);
  OUTLINED_FUNCTION_16((uint64_t)v6);
  CurrentRequest.$rootRequestId.getter();
  return CurrentRequest.$rootRequestId.modify;
}

void CurrentRequest.$rootRequestId.modify(uint64_t a1, char a2)
{
}

uint64_t CurrentRequest.sessionId.getter()
{
  return CurrentRequest.refId.getter();
}

uint64_t key path getter for CurrentRequest.sessionId : CurrentRequest@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CurrentRequest.sessionId.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_21E690400()
{
  OUTLINED_FUNCTION_54();
  uint64_t result = CurrentRequest.sessionId.getter();
  uint64_t *v0 = result;
  v0[1] = v2;
  return result;
}

uint64_t key path setter for CurrentRequest.sessionId : CurrentRequest(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.refId : CurrentRequest(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t))CurrentRequest.sessionId.setter);
}

uint64_t key path setter for CurrentRequest.refId : CurrentRequest(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  uint64_t v7 = *a1;
  uint64_t v6 = a1[1];
  swift_bridgeObjectRetain();
  return a5(v7, v6);
}

void CurrentRequest.sessionId.setter()
{
}

uint64_t (*CurrentRequest.sessionId.modify())()
{
  uint64_t v1 = OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_32((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>);
  uint64_t KeyPath = swift_getKeyPath();
  OUTLINED_FUNCTION_31(KeyPath);
  uint64_t v3 = swift_getKeyPath();
  OUTLINED_FUNCTION_30(v3);
  lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
  *(void *)(v0 + 48) = OUTLINED_FUNCTION_7_0();
  return CurrentRequest.refId.modify;
}

void CurrentRequest.refId.modify(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();
  free(v1);
}

uint64_t CurrentRequest.$sessionId.getter()
{
  return swift_release();
}

uint64_t key path setter for CurrentRequest.$refId : CurrentRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t (*a6)(uint64_t))
{
  __swift_instantiateConcreteTypeFromMangledName(a5);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_9_0();
  uint64_t v9 = OUTLINED_FUNCTION_211();
  v10(v9);
  return a6(v6);
}

uint64_t CurrentRequest.$sessionId.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v0);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_14();
  uint64_t v1 = OUTLINED_FUNCTION_5_0();
  v2(v1);
  swift_retain();
  dispatch thunk of MockablePublished.projectedValue.setter();
  swift_release();
  uint64_t v3 = OUTLINED_FUNCTION_10_0();
  return v4(v3);
}

void (*CurrentRequest.$sessionId.modify())(uint64_t a1, char a2)
{
  uint64_t v1 = OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_17(v1);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>.Publisher);
  OUTLINED_FUNCTION_1_1(v2);
  *(void *)(v0 + 16) = v3;
  uint64_t v5 = malloc(*(void *)(v4 + 64));
  uint64_t v6 = OUTLINED_FUNCTION_29((uint64_t)v5);
  OUTLINED_FUNCTION_16((uint64_t)v6);
  CurrentRequest.$sessionId.getter();
  return CurrentRequest.$sessionId.modify;
}

void CurrentRequest.$sessionId.modify(uint64_t a1, char a2)
{
}

void CurrentRequest.$refId.modify(uint64_t a1, char a2, void (*a3)(void *))
{
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void **)(*(void *)a1 + 24);
  uint64_t v6 = *(void **)(*(void *)a1 + 32);
  if (a2)
  {
    OUTLINED_FUNCTION_25();
    v7();
    a3(v5);
    OUTLINED_FUNCTION_203();
    v8();
  }
  else
  {
    a3(*(void **)(*(void *)a1 + 32));
  }
  free(v6);
  free(v5);
  free(v4);
}

uint64_t CurrentRequest.__allocating_init(storage:)()
{
  uint64_t v0 = OUTLINED_FUNCTION_77();
  CurrentRequest.init(storage:)();
  return v0;
}

void CurrentRequest.init(storage:)()
{
  OUTLINED_FUNCTION_60();
  uint64_t v4 = v0;
  v165[1] = v5;
  v165[0] = type metadata accessor for ExecutionLocation();
  OUTLINED_FUNCTION_0();
  uint64_t v164 = v6;
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_44();
  uint64_t v161 = OUTLINED_FUNCTION_67(v9);
  OUTLINED_FUNCTION_0();
  uint64_t v160 = v10;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v12);
  uint64_t v157 = OUTLINED_FUNCTION_66((uint64_t)&v135 - v13);
  OUTLINED_FUNCTION_0();
  uint64_t v156 = v14;
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_44();
  uint64_t v154 = OUTLINED_FUNCTION_65(v17);
  OUTLINED_FUNCTION_0();
  uint64_t v153 = v18;
  MEMORY[0x270FA5388](v19);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_40(v21);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for FlowTaskMetadata?);
  uint64_t v23 = OUTLINED_FUNCTION_9(v22);
  MEMORY[0x270FA5388](v23);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v24);
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_40(v25);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for HomeInfo?);
  uint64_t v27 = OUTLINED_FUNCTION_9(v26);
  MEMORY[0x270FA5388](v27);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v28);
  OUTLINED_FUNCTION_129();
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for BargeInContext?);
  uint64_t v30 = OUTLINED_FUNCTION_9(v29);
  MEMORY[0x270FA5388](v30);
  OUTLINED_FUNCTION_11();
  uint64_t v166 = v31;
  MEMORY[0x270FA5388](v32);
  OUTLINED_FUNCTION_168();
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AudioDestination?);
  uint64_t v34 = OUTLINED_FUNCTION_9(v33);
  MEMORY[0x270FA5388](v34);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v35);
  uint64_t v37 = (char *)&v135 - v36;
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AudioSource?);
  uint64_t v39 = OUTLINED_FUNCTION_9(v38);
  uint64_t v40 = MEMORY[0x270FA5388](v39);
  uint64_t v42 = (char *)&v135 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v40);
  OUTLINED_FUNCTION_128();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>);
  OUTLINED_FUNCTION_4_0();
  v0[3] = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_35();
  v0[4] = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_35();
  v0[5] = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_35();
  v0[6] = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_35();
  v0[7] = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_35();
  v0[10] = OUTLINED_FUNCTION_8_0();
  uint64_t v141 = type metadata accessor for AudioSource();
  uint64_t v45 = OUTLINED_FUNCTION_61(v141, v43, v44, v141);
  uint64_t v136 = v1;
  v140 = v42;
  outlined init with copy of AudioSource?(v45, (uint64_t)v42, &demangling cache variable for type metadata for AudioSource?);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AudioSource?>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_97();
  outlined destroy of AudioSource?(v1, &demangling cache variable for type metadata for AudioSource?);
  OUTLINED_FUNCTION_132();
  uint64_t v142 = OUTLINED_FUNCTION_136(v46);
  __swift_storeEnumTagSinglePayload((uint64_t)v37, 1, 1, v142);
  v138 = v37;
  outlined init with copy of AudioSource?((uint64_t)v37, v165[2], &demangling cache variable for type metadata for AudioDestination?);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AudioDestination?>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_225();
  outlined destroy of AudioSource?((uint64_t)v37, &demangling cache variable for type metadata for AudioDestination?);
  OUTLINED_FUNCTION_133();
  uint64_t v150 = OUTLINED_FUNCTION_137(v47);
  uint64_t v50 = OUTLINED_FUNCTION_109(v150, v48, v49, v150);
  uint64_t v147 = v3;
  outlined init with copy of AudioSource?(v50, v166, &demangling cache variable for type metadata for BargeInContext?);
  uint64_t v151 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<BargeInContext?>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_97();
  OUTLINED_FUNCTION_157();
  OUTLINED_FUNCTION_172();
  OUTLINED_FUNCTION_50(v51);
  outlined init with copy of AudioSource?((uint64_t)v171, (uint64_t)&v167, &demangling cache variable for type metadata for SharedContextService?);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SharedContextService?>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v52 = OUTLINED_FUNCTION_6_0();
  outlined destroy of AudioSource?((uint64_t)v171, &demangling cache variable for type metadata for SharedContextService?);
  v4[16] = v52;
  uint64_t v53 = type metadata accessor for HomeInfo();
  OUTLINED_FUNCTION_56(v53, v54, v55, v53);
  OUTLINED_FUNCTION_63();
  outlined init with copy of AudioSource?(v56, v57, &demangling cache variable for type metadata for HomeInfo?);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<HomeInfo?>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v58 = OUTLINED_FUNCTION_45();
  outlined destroy of AudioSource?(v2, &demangling cache variable for type metadata for HomeInfo?);
  v4[17] = v58;
  v171[0] = 0;
  uint64_t v145 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AFSpeechPackage?>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v59 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_171(v59);
  uint64_t v143 = v60;
  OUTLINED_FUNCTION_35();
  uint64_t v61 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_130(v61);
  uint64_t v144 = v62;
  LOBYTE(v171[0]) = 2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool?>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v63 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_131(v63);
  OUTLINED_FUNCTION_68(v64);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<[String : String]?>);
  OUTLINED_FUNCTION_4_0();
  v4[22] = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_35();
  uint64_t v65 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_193(v65);
  uint64_t v146 = v66;
  LOBYTE(v171[0]) = 2;
  OUTLINED_FUNCTION_87();
  uint64_t v67 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_146(v67);
  uint64_t v148 = OUTLINED_FUNCTION_150(v68);
  uint64_t v69 = v165[3];
  OUTLINED_FUNCTION_61(v148, v70, v71, v148);
  OUTLINED_FUNCTION_63();
  outlined init with copy of AudioSource?(v72, v73, &demangling cache variable for type metadata for FlowTaskMetadata?);
  uint64_t v149 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<FlowTaskMetadata?>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v74 = OUTLINED_FUNCTION_45();
  outlined destroy of AudioSource?(v69, &demangling cache variable for type metadata for FlowTaskMetadata?);
  v4[27] = v74;
  OUTLINED_FUNCTION_141((uint64_t)(v4 + 27));
  OUTLINED_FUNCTION_35();
  uint64_t v75 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_143(v75);
  uint64_t v152 = v76;
  v159 = v4 + 34;
  OUTLINED_FUNCTION_35();
  uint64_t v77 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_236(v77);
  uint64_t v158 = v78;
  OUTLINED_FUNCTION_35();
  v4[36] = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_35();
  v4[37] = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_35();
  v4[38] = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_235();
  v79();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_25();
  v80();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<InputOrigin>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v81 = OUTLINED_FUNCTION_73();
  OUTLINED_FUNCTION_24();
  v82();
  OUTLINED_FUNCTION_125();
  uint64_t v83 = v156;
  uint64_t v84 = v155;
  OUTLINED_FUNCTION_235();
  v85();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_25();
  v86();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<InteractionType>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_45();
  (*(void (**)(uint64_t, uint64_t))(v83 + 8))(v84, v81);
  OUTLINED_FUNCTION_124();
  uint64_t v87 = v136;
  OUTLINED_FUNCTION_195();
  OUTLINED_FUNCTION_187(v88, v89, v90, (uint64_t)&v164);
  char v91 = v137;
  OUTLINED_FUNCTION_2_0();
  swift_release();
  OUTLINED_FUNCTION_63();
  outlined init with copy of AudioSource?(v92, v93, &demangling cache variable for type metadata for AudioSource?);
  swift_allocObject();
  uint64_t v94 = OUTLINED_FUNCTION_45();
  outlined destroy of AudioSource?(v87, &demangling cache variable for type metadata for AudioSource?);
  *char v91 = v94;
  swift_endAccess();
  OUTLINED_FUNCTION_195();
  OUTLINED_FUNCTION_187(v95, v96, v97, (uint64_t)v165);
  uint64_t v98 = v139;
  OUTLINED_FUNCTION_2_0();
  swift_release();
  OUTLINED_FUNCTION_63();
  outlined init with copy of AudioSource?(v99, v100, &demangling cache variable for type metadata for AudioDestination?);
  OUTLINED_FUNCTION_99();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_206();
  *uint64_t v98 = v94;
  swift_endAccess();
  static ResponseMode.displayForward.getter();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_13();
  v101();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ResponseMode>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_97();
  OUTLINED_FUNCTION_24();
  v102();
  OUTLINED_FUNCTION_123();
  memset(v171, 0, 32);
  v171[4] = 1;
  memset(&v171[5], 0, 24);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_147();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<MultiUserState>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_112();
  OUTLINED_FUNCTION_140();
  uint64_t v103 = v147;
  OUTLINED_FUNCTION_195();
  OUTLINED_FUNCTION_187(v104, v105, v106, (uint64_t)&v170);
  OUTLINED_FUNCTION_2_0();
  swift_release();
  outlined init with copy of AudioSource?(v103, v166, &demangling cache variable for type metadata for BargeInContext?);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_108();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_39();
  uint64_t v167 = 0;
  OUTLINED_FUNCTION_4_0();
  uint64_t v107 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_38(v107);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_39();
  uint64_t v167 = 0;
  unint64_t v168 = 0;
  OUTLINED_FUNCTION_36();
  uint64_t v108 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_38(v108);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_39();
  LOBYTE(v167) = 2;
  OUTLINED_FUNCTION_87();
  uint64_t v109 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_38(v109);
  OUTLINED_FUNCTION_2_0();
  uint64_t v167 = 0;
  unint64_t v168 = 0xE000000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v110 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_122(v110);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_39();
  uint64_t v167 = 0;
  unint64_t v168 = 0;
  OUTLINED_FUNCTION_36();
  uint64_t v111 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_38(v111);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_39();
  LOBYTE(v167) = 2;
  OUTLINED_FUNCTION_87();
  uint64_t v112 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_38(v112);
  OUTLINED_FUNCTION_195();
  OUTLINED_FUNCTION_187(v113, v114, v115, (uint64_t)&v169);
  OUTLINED_FUNCTION_2_0();
  swift_release();
  OUTLINED_FUNCTION_28();
  outlined init with copy of AudioSource?(v116, v117, &demangling cache variable for type metadata for FlowTaskMetadata?);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_92();
  OUTLINED_FUNCTION_157();
  OUTLINED_FUNCTION_94();
  OUTLINED_FUNCTION_2_0();
  LODWORD(v167) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<UInt32>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v118 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_121(v118);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_39();
  uint64_t v167 = 0;
  unint64_t v168 = 0;
  OUTLINED_FUNCTION_36();
  uint64_t v119 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_38(v119);
  OUTLINED_FUNCTION_2_0();
  LOBYTE(v167) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v120 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_120(v120);
  OUTLINED_FUNCTION_2_0();
  LOBYTE(v167) = 0;
  OUTLINED_FUNCTION_99();
  uint64_t v121 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_119(v121);
  OUTLINED_FUNCTION_2_0();
  LOBYTE(v167) = 0;
  OUTLINED_FUNCTION_99();
  uint64_t v122 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_118(v122);
  OUTLINED_FUNCTION_2_0();
  LOBYTE(v167) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<RequestPositionInSession>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v123 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_117(v123);
  OUTLINED_FUNCTION_2_0();
  swift_release();
  uint64_t v167 = 0;
  unint64_t v168 = 0;
  OUTLINED_FUNCTION_36();
  uint64_t v124 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_127(v124);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_75((uint64_t)&type metadata for DummyLocationProvider);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SiriLocationProvider>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v125 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_43(v125);
  OUTLINED_FUNCTION_2_0();
  swift_release();
  uint64_t v167 = 0;
  unint64_t v168 = 0;
  OUTLINED_FUNCTION_36();
  uint64_t v126 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_126(v126);
  uint64_t v127 = v162;
  static ExecutionLocation.unknown.getter();
  OUTLINED_FUNCTION_2_0();
  uint64_t v128 = v164;
  v129 = *(void (**)(uint64_t, uint64_t, uint64_t))(v164 + 16);
  uint64_t v130 = v163;
  uint64_t v131 = v165[0];
  v129(v163, v127, v165[0]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ExecutionLocation>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_97();
  v132 = *(void (**)(uint64_t))(v128 + 8);
  uint64_t v133 = OUTLINED_FUNCTION_244();
  v132(v133);
  OUTLINED_FUNCTION_116();
  static ExecutionLocation.unknown.getter();
  OUTLINED_FUNCTION_2_0();
  v129(v130, v127, v131);
  OUTLINED_FUNCTION_99();
  OUTLINED_FUNCTION_97();
  uint64_t v134 = OUTLINED_FUNCTION_244();
  v132(v134);
  OUTLINED_FUNCTION_115();
  OUTLINED_FUNCTION_231();
  swift_release();
  OUTLINED_FUNCTION_139();
  OUTLINED_FUNCTION_59();
}

uint64_t CurrentRequest.__allocating_init(refId:aceId:executionRequestId:sessionHandoffContinuityID:peerName:inputOrigin:interactionType:audioSource:audioDestination:responseMode:multiUserState:bargeInContext:sharedContextService:originatingHome:speechPackage:resultCandidateId:asrOnDevice:currentDeviceAssistantId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, unsigned __int8 a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25)
{
  uint64_t v25 = OUTLINED_FUNCTION_77();
  LOBYTE(v43) = a23;
  uint64_t v26 = OUTLINED_FUNCTION_48();
  CurrentRequest.init(refId:aceId:executionRequestId:sessionHandoffContinuityID:peerName:inputOrigin:interactionType:audioSource:audioDestination:responseMode:multiUserState:bargeInContext:sharedContextService:originatingHome:speechPackage:resultCandidateId:asrOnDevice:currentDeviceAssistantId:)(v26, v27, v28, v29, v30, v31, v32, v33, v35, v36, v37, v38, v39, v40, v41, v42, a17, a18, a19,
    a20,
    a21,
    a22,
    v43,
    a24,
    a25,
    v44,
    a19,
    a20,
    a17,
    a18,
    a15,
    a16,
    a13,
    a14,
    a11,
    a12,
    a9);
  return v25;
}

void CurrentRequest.init(refId:aceId:executionRequestId:sessionHandoffContinuityID:peerName:inputOrigin:interactionType:audioSource:audioDestination:responseMode:multiUserState:bargeInContext:sharedContextService:originatingHome:speechPackage:resultCandidateId:asrOnDevice:currentDeviceAssistantId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,unsigned __int8 a35,uint64_t a36,uint64_t a37)
{
  OUTLINED_FUNCTION_60();
  uint64_t v40 = v37;
  uint64_t v209 = v41;
  v210 = v42;
  uint64_t v206 = v43;
  v207 = v44;
  uint64_t v198 = v45;
  v201 = v46;
  v195 = v47;
  v196 = v48;
  OUTLINED_FUNCTION_182(a37);
  OUTLINED_FUNCTION_181(a36);
  int v218 = a35;
  OUTLINED_FUNCTION_167(a34);
  OUTLINED_FUNCTION_170(a33);
  OUTLINED_FUNCTION_141(a32);
  v225[3] = a31;
  v225[4] = a30;
  v226[0] = a29;
  v226[1] = a28;
  OUTLINED_FUNCTION_177(a27);
  v226[3] = v49;
  OUTLINED_FUNCTION_78(a25);
  v214 = v50;
  uint64_t v222 = OUTLINED_FUNCTION_199(a22);
  OUTLINED_FUNCTION_0();
  uint64_t v221 = v51;
  MEMORY[0x270FA5388](v52);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v53);
  v225[2] = OUTLINED_FUNCTION_67((uint64_t)&v187 - v54);
  OUTLINED_FUNCTION_0();
  uint64_t v228 = v55;
  MEMORY[0x270FA5388](v56);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v57);
  v225[0] = OUTLINED_FUNCTION_66((uint64_t)&v187 - v58);
  OUTLINED_FUNCTION_0();
  v227[1] = v59;
  MEMORY[0x270FA5388](v60);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v61);
  OUTLINED_FUNCTION_44();
  v225[1] = OUTLINED_FUNCTION_65(v62);
  OUTLINED_FUNCTION_0();
  v227[2] = v63;
  MEMORY[0x270FA5388](v64);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v65);
  OUTLINED_FUNCTION_40((uint64_t)&v187 - v66);
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for FlowTaskMetadata?);
  uint64_t v68 = OUTLINED_FUNCTION_9(v67);
  MEMORY[0x270FA5388](v68);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v69);
  OUTLINED_FUNCTION_40((uint64_t)&v187 - v70);
  uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for HomeInfo?);
  uint64_t v72 = OUTLINED_FUNCTION_9(v71);
  MEMORY[0x270FA5388](v72);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v73);
  OUTLINED_FUNCTION_40((uint64_t)&v187 - v74);
  uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for BargeInContext?);
  uint64_t v76 = OUTLINED_FUNCTION_9(v75);
  MEMORY[0x270FA5388](v76);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v77);
  OUTLINED_FUNCTION_100();
  uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AudioDestination?);
  uint64_t v79 = OUTLINED_FUNCTION_9(v78);
  MEMORY[0x270FA5388](v79);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v80);
  OUTLINED_FUNCTION_168();
  uint64_t v81 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AudioSource?);
  uint64_t v82 = OUTLINED_FUNCTION_9(v81);
  MEMORY[0x270FA5388](v82);
  OUTLINED_FUNCTION_189();
  MEMORY[0x270FA5388](v83);
  uint64_t v85 = (char *)&v187 - v84;
  OUTLINED_FUNCTION_149();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>);
  OUTLINED_FUNCTION_4_0();
  v37[3] = OUTLINED_FUNCTION_8_0();
  v86 = (void (*)(void))(v37 + 3);
  uint64_t v232 = 0;
  uint64_t v233 = 0;
  OUTLINED_FUNCTION_3_0();
  v37[4] = OUTLINED_FUNCTION_8_0();
  uint64_t v232 = 0;
  uint64_t v233 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v87 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_145(v87);
  v187 = v88;
  uint64_t v232 = 0;
  uint64_t v233 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v89 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_144(v89);
  v188 = v90;
  uint64_t v232 = 0;
  uint64_t v233 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v91 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_142(v91);
  v189 = v92;
  uint64_t v232 = 0;
  uint64_t v233 = 0;
  OUTLINED_FUNCTION_3_0();
  v37[10] = OUTLINED_FUNCTION_8_0();
  uint64_t v93 = type metadata accessor for AudioSource();
  uint64_t v94 = OUTLINED_FUNCTION_89(v93);
  v190 = v85;
  uint64_t v192 = v39;
  outlined init with copy of AudioSource?(v94, v39, &demangling cache variable for type metadata for AudioSource?);
  uint64_t v193 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AudioSource?>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_206();
  OUTLINED_FUNCTION_132();
  uint64_t v96 = OUTLINED_FUNCTION_136(v95);
  uint64_t v99 = OUTLINED_FUNCTION_109(v96, v97, v98, v96);
  uint64_t v191 = v38;
  outlined init with copy of AudioSource?(v99, v223, &demangling cache variable for type metadata for AudioDestination?);
  uint64_t v194 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AudioDestination?>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_157();
  OUTLINED_FUNCTION_133();
  uint64_t v101 = OUTLINED_FUNCTION_137(v100);
  OUTLINED_FUNCTION_202(v101);
  OUTLINED_FUNCTION_63();
  outlined init with copy of AudioSource?(v102, v103, &demangling cache variable for type metadata for BargeInContext?);
  uint64_t v199 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<BargeInContext?>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_208();
  v37[15] = v37;
  OUTLINED_FUNCTION_50((uint64_t)(v37 + 15));
  OUTLINED_FUNCTION_104();
  uint64_t v202 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SharedContextService?>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_83();
  v37[16] = v37;
  uint64_t v104 = OUTLINED_FUNCTION_151((uint64_t)(v37 + 16));
  OUTLINED_FUNCTION_201(v104);
  OUTLINED_FUNCTION_63();
  outlined init with copy of AudioSource?(v105, v106, &demangling cache variable for type metadata for HomeInfo?);
  uint64_t v203 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<HomeInfo?>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v107 = OUTLINED_FUNCTION_45();
  outlined destroy of AudioSource?((uint64_t)&demangling cache variable for type metadata for SharedContextService?, &demangling cache variable for type metadata for HomeInfo?);
  v40[17] = v107;
  OUTLINED_FUNCTION_68((uint64_t)(v40 + 17));
  uint64_t v205 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AFSpeechPackage?>);
  OUTLINED_FUNCTION_4_0();
  v40[18] = OUTLINED_FUNCTION_8_0();
  v200 = v40 + 18;
  uint64_t v232 = 0;
  uint64_t v233 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v108 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_130(v108);
  uint64_t v204 = v109;
  LOBYTE(v232) = 2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool?>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v110 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_131(v110);
  OUTLINED_FUNCTION_68(v111);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<[String : String]?>);
  OUTLINED_FUNCTION_4_0();
  v40[22] = OUTLINED_FUNCTION_8_0();
  uint64_t v232 = 0;
  uint64_t v233 = 0;
  OUTLINED_FUNCTION_3_0();
  v40[25] = OUTLINED_FUNCTION_8_0();
  v208 = v40 + 25;
  LOBYTE(v232) = 2;
  OUTLINED_FUNCTION_51();
  uint64_t v112 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_146(v112);
  uint64_t v114 = OUTLINED_FUNCTION_150(v113);
  uint64_t v115 = OUTLINED_FUNCTION_153(v114);
  outlined init with copy of AudioSource?(v115, *(void *)(v116 - 256), &demangling cache variable for type metadata for FlowTaskMetadata?);
  uint64_t v211 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<FlowTaskMetadata?>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_157();
  v40[27] = v107;
  uint64_t v232 = 0;
  uint64_t v233 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v117 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_143(v117);
  uint64_t v212 = v118;
  v215 = v40 + 34;
  uint64_t v232 = 0;
  uint64_t v233 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v119 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_216(v119);
  OUTLINED_FUNCTION_3_0();
  v40[36] = OUTLINED_FUNCTION_8_0();
  uint64_t v232 = 0;
  uint64_t v233 = 0;
  OUTLINED_FUNCTION_3_0();
  v40[37] = OUTLINED_FUNCTION_8_0();
  uint64_t v232 = 0;
  uint64_t v233 = 0;
  OUTLINED_FUNCTION_3_0();
  v40[38] = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_0();
  uint64_t v120 = v195;
  swift_bridgeObjectRetain();
  swift_release();
  v229 = v196;
  v230 = v120;
  OUTLINED_FUNCTION_3_0();
  uint64_t v121 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_38(v121);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_23();
  swift_release();
  v229 = v201;
  v230 = v86;
  OUTLINED_FUNCTION_3_0();
  uint64_t v122 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_57(v122);
  swift_bridgeObjectRelease();
  uint64_t v123 = v187;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_23();
  swift_release();
  v229 = v207;
  v230 = v123;
  OUTLINED_FUNCTION_3_0();
  uint64_t v124 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37(v124);
  swift_bridgeObjectRelease();
  uint64_t v125 = v188;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_70();
  OUTLINED_FUNCTION_23();
  swift_release();
  v229 = v210;
  v230 = v125;
  OUTLINED_FUNCTION_3_0();
  uint64_t v126 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37(v126);
  swift_bridgeObjectRelease();
  uint64_t v127 = v189;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_23();
  swift_release();
  v229 = v214;
  v230 = v127;
  OUTLINED_FUNCTION_3_0();
  uint64_t v128 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37(v128);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_155();
  OUTLINED_FUNCTION_20();
  v127();
  OUTLINED_FUNCTION_2_0();
  uint64_t v129 = OUTLINED_FUNCTION_15((uint64_t)v225);
  ((void (*)(uint64_t))v127)(v129);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<InputOrigin>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_209();
  uint64_t v131 = OUTLINED_FUNCTION_21(v130);
  v132(v131);
  OUTLINED_FUNCTION_125();
  OUTLINED_FUNCTION_155();
  OUTLINED_FUNCTION_20();
  v127();
  OUTLINED_FUNCTION_2_0();
  uint64_t v133 = OUTLINED_FUNCTION_15((uint64_t)v227);
  ((void (*)(uint64_t))v127)(v133);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<InteractionType>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_85();
  uint64_t v135 = OUTLINED_FUNCTION_21(v134);
  v136(v135);
  OUTLINED_FUNCTION_124();
  OUTLINED_FUNCTION_82();
  OUTLINED_FUNCTION_28();
  outlined init with copy of AudioSource?(v137, v138, &demangling cache variable for type metadata for AudioSource?);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_234();
  uint64_t v139 = OUTLINED_FUNCTION_200();
  OUTLINED_FUNCTION_41(v139, (uint64_t)&v213);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_94();
  OUTLINED_FUNCTION_74();
  OUTLINED_FUNCTION_28();
  outlined init with copy of AudioSource?(v140, v141, &demangling cache variable for type metadata for AudioDestination?);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_234();
  OUTLINED_FUNCTION_41((uint64_t)v127, (uint64_t)&v232);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_94();
  uint64_t v142 = *(void (**)(void))(v228 + 16);
  OUTLINED_FUNCTION_20();
  v142();
  OUTLINED_FUNCTION_2_0();
  uint64_t v143 = OUTLINED_FUNCTION_15((uint64_t)&v229);
  ((void (*)(uint64_t))v142)(v143);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ResponseMode>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_226();
  uint64_t v145 = OUTLINED_FUNCTION_21(v144);
  v146(v145);
  OUTLINED_FUNCTION_123();
  OUTLINED_FUNCTION_86();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_147();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<MultiUserState>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_112();
  OUTLINED_FUNCTION_140();
  OUTLINED_FUNCTION_28();
  outlined init with copy of AudioSource?(v147, v148, &demangling cache variable for type metadata for BargeInContext?);
  OUTLINED_FUNCTION_2_0();
  swift_release();
  OUTLINED_FUNCTION_96((uint64_t)v142, (uint64_t)&v234);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_111();
  uint64_t v149 = OUTLINED_FUNCTION_81();
  outlined init with copy of AudioSource?(v149, v150, &demangling cache variable for type metadata for SharedContextService?);
  uint64_t v151 = v197;
  OUTLINED_FUNCTION_2_0();
  swift_release();
  OUTLINED_FUNCTION_104();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_179();
  OUTLINED_FUNCTION_28();
  outlined init with copy of AudioSource?(v152, v153, &demangling cache variable for type metadata for HomeInfo?);
  OUTLINED_FUNCTION_2_0();
  swift_release();
  OUTLINED_FUNCTION_96(v151, (uint64_t)&v235);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_111();
  uint64_t v154 = v200;
  OUTLINED_FUNCTION_2_0();
  id v155 = OUTLINED_FUNCTION_227();
  OUTLINED_FUNCTION_166((uint64_t)v155);
  v229 = v154;
  OUTLINED_FUNCTION_4_0();
  uint64_t v156 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37(v156);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_39();
  v229 = v216;
  v230 = v217;
  OUTLINED_FUNCTION_3_0();
  uint64_t v157 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_38(v157);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_39();
  LOBYTE(v229) = v218;
  OUTLINED_FUNCTION_51();
  uint64_t v158 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_38(v158);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_164((uint64_t)&v231);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_159();
  uint64_t v159 = MockablePublished.init(wrappedValue:)();
  OUTLINED_FUNCTION_122(v159);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_39();
  v229 = 0;
  v230 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v160 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_38(v160);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_39();
  LOBYTE(v229) = 2;
  OUTLINED_FUNCTION_51();
  uint64_t v161 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_38(v161);
  OUTLINED_FUNCTION_187(v224, 1, 1, (uint64_t)v226);
  OUTLINED_FUNCTION_2_0();
  swift_release();
  OUTLINED_FUNCTION_156();
  outlined init with copy of AudioSource?(v162, v163, &demangling cache variable for type metadata for FlowTaskMetadata?);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_160();
  OUTLINED_FUNCTION_108();
  OUTLINED_FUNCTION_2_0();
  LODWORD(v229) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<UInt32>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v164 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_121(v164);
  OUTLINED_FUNCTION_2_0();
  swift_release();
  v229 = 0;
  v230 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v165 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_197(v165);
  OUTLINED_FUNCTION_2_0();
  LOBYTE(v229) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v166 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_120(v166);
  OUTLINED_FUNCTION_2_0();
  LOBYTE(v229) = 0;
  OUTLINED_FUNCTION_12();
  uint64_t v167 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_119(v167);
  OUTLINED_FUNCTION_2_0();
  LOBYTE(v229) = 0;
  OUTLINED_FUNCTION_12();
  uint64_t v168 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_118(v168);
  OUTLINED_FUNCTION_2_0();
  LOBYTE(v229) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<RequestPositionInSession>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v169 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_117(v169);
  OUTLINED_FUNCTION_2_0();
  swift_release();
  v229 = 0;
  v230 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v170 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_127(v170);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_75((uint64_t)&type metadata for DummyLocationProvider);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SiriLocationProvider>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v171 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_43(v171);
  OUTLINED_FUNCTION_2_0();
  swift_release();
  v229 = 0;
  v230 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v172 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_126(v172);
  uint64_t v173 = v219;
  static ExecutionLocation.unknown.getter();
  OUTLINED_FUNCTION_2_0();
  uint64_t v174 = v221;
  v175 = *(void (**)(uint64_t, uint64_t, uint64_t))(v221 + 16);
  uint64_t v176 = v220;
  uint64_t v177 = v222;
  v175(v220, v173, v222);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ExecutionLocation>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_73();
  v178 = *(void (**)(void))(v174 + 8);
  OUTLINED_FUNCTION_203();
  v178();
  OUTLINED_FUNCTION_116();
  static ExecutionLocation.unknown.getter();
  OUTLINED_FUNCTION_2_0();
  v175(v176, v173, v177);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_73();
  OUTLINED_FUNCTION_203();
  v178();
  OUTLINED_FUNCTION_115();
  OUTLINED_FUNCTION_53();
  uint64_t v179 = OUTLINED_FUNCTION_154();
  outlined destroy of AudioSource?(v179, &demangling cache variable for type metadata for HomeInfo?);
  uint64_t v180 = OUTLINED_FUNCTION_81();
  outlined destroy of AudioSource?(v180, &demangling cache variable for type metadata for SharedContextService?);
  uint64_t v181 = OUTLINED_FUNCTION_95();
  outlined destroy of AudioSource?(v181, &demangling cache variable for type metadata for BargeInContext?);
  OUTLINED_FUNCTION_163();
  OUTLINED_FUNCTION_24();
  v182();
  uint64_t v183 = OUTLINED_FUNCTION_74();
  outlined destroy of AudioSource?(v183, &demangling cache variable for type metadata for AudioDestination?);
  uint64_t v184 = OUTLINED_FUNCTION_82();
  outlined destroy of AudioSource?(v184, &demangling cache variable for type metadata for AudioSource?);
  OUTLINED_FUNCTION_91();
  OUTLINED_FUNCTION_24();
  v185();
  OUTLINED_FUNCTION_24();
  v186();
  OUTLINED_FUNCTION_139();
  OUTLINED_FUNCTION_59();
}

uint64_t CurrentRequest.__allocating_init(refId:aceId:executionRequestId:sessionHandoffContinuityID:peerName:inputOrigin:interactionType:interactionId:audioSource:audioDestination:responseMode:multiUserState:bargeInContext:sharedContextService:originatingHome:speechPackage:resultCandidateId:asrOnDevice:currentDeviceAssistantId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, unsigned __int8 a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27)
{
  uint64_t v27 = OUTLINED_FUNCTION_77();
  LOBYTE(v45) = a25;
  uint64_t v28 = OUTLINED_FUNCTION_48();
  CurrentRequest.init(refId:aceId:executionRequestId:sessionHandoffContinuityID:peerName:inputOrigin:interactionType:interactionId:audioSource:audioDestination:responseMode:multiUserState:bargeInContext:sharedContextService:originatingHome:speechPackage:resultCandidateId:asrOnDevice:currentDeviceAssistantId:)(v28, v29, v30, v31, v32, v33, v34, v35, v37, v38, v39, v40, v41, v42, v43, v44, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    v45,
    a26,
    a27,
    v46,
    a21,
    a22,
    a19,
    a20,
    a17,
    a18,
    a15,
    a16,
    a13,
    a14,
    a11);
  return v27;
}

void CurrentRequest.init(refId:aceId:executionRequestId:sessionHandoffContinuityID:peerName:inputOrigin:interactionType:interactionId:audioSource:audioDestination:responseMode:multiUserState:bargeInContext:sharedContextService:originatingHome:speechPackage:resultCandidateId:asrOnDevice:currentDeviceAssistantId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,unsigned __int8 a37,uint64_t a38,uint64_t a39)
{
  OUTLINED_FUNCTION_60();
  uint64_t v43 = v39;
  uint64_t v215 = v44;
  v216 = v45;
  uint64_t v210 = v46;
  uint64_t v211 = v47;
  uint64_t v205 = v48;
  uint64_t v206 = v49;
  uint64_t v203 = v50;
  uint64_t v204 = v51;
  OUTLINED_FUNCTION_182(a39);
  OUTLINED_FUNCTION_181(a38);
  OUTLINED_FUNCTION_180(a37);
  OUTLINED_FUNCTION_167(v52);
  OUTLINED_FUNCTION_170(a35);
  OUTLINED_FUNCTION_19(a34);
  OUTLINED_FUNCTION_177(v53);
  OUTLINED_FUNCTION_106(v54);
  uint64_t v224 = OUTLINED_FUNCTION_199(v55);
  OUTLINED_FUNCTION_0();
  uint64_t v223 = v56;
  MEMORY[0x270FA5388](v57);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v58);
  v225[7] = OUTLINED_FUNCTION_67((uint64_t)&v193 - v59);
  OUTLINED_FUNCTION_0();
  uint64_t v228 = v60;
  MEMORY[0x270FA5388](v61);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v62);
  void v225[5] = OUTLINED_FUNCTION_66((uint64_t)&v193 - v63);
  OUTLINED_FUNCTION_0();
  v226[3] = v64;
  MEMORY[0x270FA5388](v65);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v66);
  OUTLINED_FUNCTION_44();
  v225[6] = OUTLINED_FUNCTION_65(v67);
  OUTLINED_FUNCTION_0();
  v227 = v68;
  MEMORY[0x270FA5388](v69);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v70);
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_40(v71);
  uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for FlowTaskMetadata?);
  uint64_t v73 = OUTLINED_FUNCTION_9(v72);
  MEMORY[0x270FA5388](v73);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v74);
  OUTLINED_FUNCTION_40((uint64_t)&v193 - v75);
  uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for HomeInfo?);
  uint64_t v77 = OUTLINED_FUNCTION_9(v76);
  MEMORY[0x270FA5388](v77);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v78);
  OUTLINED_FUNCTION_40((uint64_t)&v193 - v79);
  uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for BargeInContext?);
  uint64_t v81 = OUTLINED_FUNCTION_9(v80);
  MEMORY[0x270FA5388](v81);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v82);
  OUTLINED_FUNCTION_100();
  uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AudioDestination?);
  uint64_t v84 = OUTLINED_FUNCTION_9(v83);
  MEMORY[0x270FA5388](v84);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v85);
  OUTLINED_FUNCTION_129();
  uint64_t v86 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AudioSource?);
  uint64_t v87 = OUTLINED_FUNCTION_9(v86);
  MEMORY[0x270FA5388](v87);
  OUTLINED_FUNCTION_103();
  MEMORY[0x270FA5388](v88);
  uint64_t v90 = (char *)&v193 - v89;
  OUTLINED_FUNCTION_149();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>);
  OUTLINED_FUNCTION_4_0();
  v39[3] = OUTLINED_FUNCTION_8_0();
  uint64_t v232 = 0;
  uint64_t v233 = 0;
  OUTLINED_FUNCTION_3_0();
  v39[4] = OUTLINED_FUNCTION_8_0();
  uint64_t v91 = v39 + 4;
  uint64_t v232 = 0;
  uint64_t v233 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v92 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_145(v92);
  uint64_t v194 = v93;
  uint64_t v232 = 0;
  uint64_t v233 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v94 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_144(v94);
  v195 = v95;
  uint64_t v232 = 0;
  uint64_t v233 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v96 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_142(v96);
  v196 = v97;
  uint64_t v232 = 0;
  uint64_t v233 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v98 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_173(v98);
  uint64_t v100 = OUTLINED_FUNCTION_178(v99);
  uint64_t v101 = OUTLINED_FUNCTION_89(v100);
  uint64_t v198 = v90;
  uint64_t v200 = v40;
  outlined init with copy of AudioSource?(v101, v40, &demangling cache variable for type metadata for AudioSource?);
  uint64_t v201 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AudioSource?>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_92();
  OUTLINED_FUNCTION_206();
  OUTLINED_FUNCTION_132();
  uint64_t v103 = OUTLINED_FUNCTION_136(v102);
  OUTLINED_FUNCTION_56(v103, v104, v105, v103);
  uint64_t v199 = v41;
  OUTLINED_FUNCTION_28();
  outlined init with copy of AudioSource?(v106, v107, &demangling cache variable for type metadata for AudioDestination?);
  uint64_t v202 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AudioDestination?>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_92();
  OUTLINED_FUNCTION_204();
  OUTLINED_FUNCTION_133();
  uint64_t v109 = OUTLINED_FUNCTION_137(v108);
  uint64_t v110 = OUTLINED_FUNCTION_202(v109);
  outlined init with copy of AudioSource?(v110, *(void *)(v111 - 256), &demangling cache variable for type metadata for BargeInContext?);
  uint64_t v208 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<BargeInContext?>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v112 = OUTLINED_FUNCTION_225();
  outlined destroy of AudioSource?(v42, &demangling cache variable for type metadata for BargeInContext?);
  v43[15] = v112;
  OUTLINED_FUNCTION_50((uint64_t)(v43 + 15));
  OUTLINED_FUNCTION_135();
  uint64_t v212 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SharedContextService?>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_113();
  v43[16] = v112;
  uint64_t v113 = OUTLINED_FUNCTION_151((uint64_t)(v43 + 16));
  OUTLINED_FUNCTION_201(v113);
  OUTLINED_FUNCTION_156();
  outlined init with copy of AudioSource?(v114, v115, &demangling cache variable for type metadata for HomeInfo?);
  uint64_t v213 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<HomeInfo?>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_42();
  v43[17] = v112;
  OUTLINED_FUNCTION_68((uint64_t)(v43 + 17));
  uint64_t v214 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AFSpeechPackage?>);
  OUTLINED_FUNCTION_4_0();
  v43[18] = OUTLINED_FUNCTION_8_0();
  uint64_t v209 = v43 + 18;
  uint64_t v232 = 0;
  uint64_t v233 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v116 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_130(v116);
  OUTLINED_FUNCTION_176(v117);
  uint64_t v118 = (void (*)(void))__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool?>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v119 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_131(v119);
  OUTLINED_FUNCTION_68(v120);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<[String : String]?>);
  OUTLINED_FUNCTION_4_0();
  v43[22] = OUTLINED_FUNCTION_8_0();
  uint64_t v232 = 0;
  uint64_t v233 = 0;
  OUTLINED_FUNCTION_3_0();
  v43[25] = OUTLINED_FUNCTION_8_0();
  v217 = v43 + 25;
  LOBYTE(v232) = &demangling cache variable for type metadata for HomeInfo?;
  OUTLINED_FUNCTION_51();
  uint64_t v121 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_146(v121);
  uint64_t v123 = OUTLINED_FUNCTION_150(v122);
  OUTLINED_FUNCTION_153(v123);
  OUTLINED_FUNCTION_28();
  outlined init with copy of AudioSource?(v124, v125, &demangling cache variable for type metadata for FlowTaskMetadata?);
  uint64_t v219 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<FlowTaskMetadata?>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_92();
  OUTLINED_FUNCTION_204();
  v43[27] = v112;
  uint64_t v232 = 0;
  uint64_t v233 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v126 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_143(v126);
  uint64_t v220 = v127;
  v221[5] = v43 + 34;
  uint64_t v232 = 0;
  uint64_t v233 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v128 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_215(v128);
  OUTLINED_FUNCTION_3_0();
  v43[36] = OUTLINED_FUNCTION_8_0();
  uint64_t v232 = 0;
  uint64_t v233 = 0;
  OUTLINED_FUNCTION_3_0();
  v43[37] = OUTLINED_FUNCTION_8_0();
  uint64_t v232 = 0;
  uint64_t v233 = 0;
  OUTLINED_FUNCTION_3_0();
  v43[38] = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_23();
  swift_release();
  v229 = v204;
  v230 = &demangling cache variable for type metadata for HomeInfo?;
  OUTLINED_FUNCTION_3_0();
  uint64_t v129 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_197(v129);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_23();
  swift_release();
  v229 = v206;
  v230 = &demangling cache variable for type metadata for HomeInfo?;
  OUTLINED_FUNCTION_3_0();
  *uint64_t v91 = OUTLINED_FUNCTION_6_0();
  swift_endAccess();
  swift_bridgeObjectRelease();
  uint64_t v130 = v194;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_70();
  OUTLINED_FUNCTION_23();
  swift_release();
  v229 = v211;
  v230 = v130;
  OUTLINED_FUNCTION_3_0();
  uint64_t v131 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37(v131);
  swift_bridgeObjectRelease();
  v132 = v195;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_70();
  OUTLINED_FUNCTION_23();
  swift_release();
  v229 = v216;
  v230 = v132;
  OUTLINED_FUNCTION_3_0();
  uint64_t v133 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37(v133);
  swift_bridgeObjectRelease();
  uint64_t v134 = v196;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_70();
  OUTLINED_FUNCTION_23();
  swift_release();
  v229 = (void *)v221[2];
  v230 = (uint64_t *)v134;
  OUTLINED_FUNCTION_3_0();
  uint64_t v135 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37(v135);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_101();
  OUTLINED_FUNCTION_20();
  v134();
  OUTLINED_FUNCTION_2_0();
  uint64_t v136 = OUTLINED_FUNCTION_15((uint64_t)v225);
  ((void (*)(uint64_t))v134)(v136);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<InputOrigin>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_46();
  uint64_t v137 = v43[4];
  v227 = v43 + 4;
  uint64_t v138 = OUTLINED_FUNCTION_21(v137);
  v139(v138);
  OUTLINED_FUNCTION_125();
  OUTLINED_FUNCTION_101();
  OUTLINED_FUNCTION_20();
  v134();
  OUTLINED_FUNCTION_2_0();
  uint64_t v140 = OUTLINED_FUNCTION_15((uint64_t)v226);
  ((void (*)(uint64_t))v134)(v140);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<InteractionType>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_85();
  uint64_t v142 = OUTLINED_FUNCTION_21(v141);
  v143(v142);
  OUTLINED_FUNCTION_124();
  uint64_t v144 = v197;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_70();
  OUTLINED_FUNCTION_23();
  swift_release();
  v229 = (void *)v221[3];
  v230 = (uint64_t *)v144;
  OUTLINED_FUNCTION_3_0();
  uint64_t v145 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37(v145);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_82();
  OUTLINED_FUNCTION_28();
  outlined init with copy of AudioSource?(v146, v147, &demangling cache variable for type metadata for AudioSource?);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_186();
  uint64_t v148 = OUTLINED_FUNCTION_200();
  OUTLINED_FUNCTION_41(v148, (uint64_t)v221);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_108();
  OUTLINED_FUNCTION_74();
  OUTLINED_FUNCTION_28();
  outlined init with copy of AudioSource?(v149, v150, &demangling cache variable for type metadata for AudioDestination?);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_186();
  OUTLINED_FUNCTION_41((uint64_t)v144, (uint64_t)&v232);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_108();
  OUTLINED_FUNCTION_221();
  OUTLINED_FUNCTION_20();
  v144();
  OUTLINED_FUNCTION_2_0();
  uint64_t v151 = OUTLINED_FUNCTION_15((uint64_t)&v229);
  ((void (*)(uint64_t))v144)(v151);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ResponseMode>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_46();
  uint64_t v152 = v43[4];
  uint64_t v228 = v43 + 4;
  uint64_t v153 = OUTLINED_FUNCTION_21(v152);
  v154(v153);
  OUTLINED_FUNCTION_123();
  OUTLINED_FUNCTION_86();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_147();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<MultiUserState>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_112();
  OUTLINED_FUNCTION_140();
  OUTLINED_FUNCTION_28();
  outlined init with copy of AudioSource?(v155, v156, &demangling cache variable for type metadata for BargeInContext?);
  OUTLINED_FUNCTION_2_0();
  swift_release();
  OUTLINED_FUNCTION_102((uint64_t)v144, (uint64_t)&v234);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_111();
  uint64_t v157 = OUTLINED_FUNCTION_81();
  outlined init with copy of AudioSource?(v157, v158, &demangling cache variable for type metadata for SharedContextService?);
  uint64_t v159 = v207;
  OUTLINED_FUNCTION_2_0();
  swift_release();
  OUTLINED_FUNCTION_104();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_179();
  OUTLINED_FUNCTION_28();
  outlined init with copy of AudioSource?(v160, v161, &demangling cache variable for type metadata for HomeInfo?);
  OUTLINED_FUNCTION_2_0();
  swift_release();
  OUTLINED_FUNCTION_102(v159, (uint64_t)&v235);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_111();
  uint64_t v162 = v209;
  OUTLINED_FUNCTION_2_0();
  id v163 = OUTLINED_FUNCTION_227();
  OUTLINED_FUNCTION_166((uint64_t)v163);
  v229 = v162;
  OUTLINED_FUNCTION_4_0();
  uint64_t v164 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37(v164);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_39();
  v229 = (void *)v221[8];
  v230 = (uint64_t *)v221[9];
  OUTLINED_FUNCTION_3_0();
  uint64_t v165 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_38(v165);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_39();
  LOBYTE(v229) = v222;
  OUTLINED_FUNCTION_51();
  uint64_t v166 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_38(v166);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_164((uint64_t)&v231);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_159();
  uint64_t v167 = MockablePublished.init(wrappedValue:)();
  OUTLINED_FUNCTION_122(v167);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_39();
  v229 = 0;
  v230 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v168 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_38(v168);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_39();
  LOBYTE(v229) = 2;
  OUTLINED_FUNCTION_51();
  uint64_t v169 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_38(v169);
  __swift_storeEnumTagSinglePayload(v225[3], 1, 1, v218);
  OUTLINED_FUNCTION_2_0();
  swift_release();
  OUTLINED_FUNCTION_63();
  outlined init with copy of AudioSource?(v170, v171, &demangling cache variable for type metadata for FlowTaskMetadata?);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_160();
  OUTLINED_FUNCTION_94();
  OUTLINED_FUNCTION_2_0();
  LODWORD(v229) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<UInt32>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v172 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_121(v172);
  OUTLINED_FUNCTION_2_0();
  swift_release();
  v229 = 0;
  v230 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v173 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_57(v173);
  OUTLINED_FUNCTION_2_0();
  LOBYTE(v229) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v174 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_120(v174);
  OUTLINED_FUNCTION_2_0();
  LOBYTE(v229) = 0;
  OUTLINED_FUNCTION_12();
  uint64_t v175 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_119(v175);
  OUTLINED_FUNCTION_2_0();
  LOBYTE(v229) = 0;
  OUTLINED_FUNCTION_12();
  uint64_t v176 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_118(v176);
  OUTLINED_FUNCTION_2_0();
  LOBYTE(v229) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<RequestPositionInSession>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v177 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_117(v177);
  OUTLINED_FUNCTION_2_0();
  swift_release();
  v229 = 0;
  v230 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v178 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_127(v178);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_75((uint64_t)&type metadata for DummyLocationProvider);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SiriLocationProvider>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v179 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_43(v179);
  OUTLINED_FUNCTION_2_0();
  swift_release();
  v229 = 0;
  v230 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v180 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_126(v180);
  OUTLINED_FUNCTION_220();
  OUTLINED_FUNCTION_2_0();
  uint64_t v181 = OUTLINED_FUNCTION_49();
  ((void (*)(uint64_t))v118)(v181);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ExecutionLocation>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_73();
  v182 = (void (*)(uint64_t))*((void *)v90 + 1);
  uint64_t v183 = OUTLINED_FUNCTION_71();
  v182(v183);
  OUTLINED_FUNCTION_116();
  static ExecutionLocation.unknown.getter();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_79();
  v118();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_73();
  uint64_t v184 = OUTLINED_FUNCTION_71();
  v182(v184);
  OUTLINED_FUNCTION_115();
  OUTLINED_FUNCTION_53();
  uint64_t v185 = OUTLINED_FUNCTION_154();
  outlined destroy of AudioSource?(v185, &demangling cache variable for type metadata for HomeInfo?);
  uint64_t v186 = OUTLINED_FUNCTION_81();
  outlined destroy of AudioSource?(v186, &demangling cache variable for type metadata for SharedContextService?);
  uint64_t v187 = OUTLINED_FUNCTION_95();
  outlined destroy of AudioSource?(v187, &demangling cache variable for type metadata for BargeInContext?);
  OUTLINED_FUNCTION_163();
  OUTLINED_FUNCTION_24();
  v188();
  uint64_t v189 = OUTLINED_FUNCTION_74();
  outlined destroy of AudioSource?(v189, &demangling cache variable for type metadata for AudioDestination?);
  uint64_t v190 = OUTLINED_FUNCTION_82();
  outlined destroy of AudioSource?(v190, &demangling cache variable for type metadata for AudioSource?);
  OUTLINED_FUNCTION_91();
  OUTLINED_FUNCTION_24();
  v191();
  OUTLINED_FUNCTION_24();
  v192();
  OUTLINED_FUNCTION_139();
  OUTLINED_FUNCTION_59();
}

uint64_t CurrentRequest.__allocating_init(refId:aceId:executionRequestId:sessionHandoffContinuityID:peerName:inputOrigin:interactionType:interactionId:audioSource:audioDestination:responseMode:multiUserState:bargeInContext:sharedContextService:originatingHome:speechPackage:resultCandidateId:asrOnDevice:currentDeviceAssistantId:voiceTriggerEventInfo:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  OUTLINED_FUNCTION_84(a1, a2, a3, a4, a5, a6, a7, a8);
  uint64_t v28 = OUTLINED_FUNCTION_77();
  LOBYTE(v48) = a25;
  uint64_t v29 = OUTLINED_FUNCTION_64();
  CurrentRequest.init(refId:aceId:executionRequestId:sessionHandoffContinuityID:peerName:inputOrigin:interactionType:interactionId:audioSource:audioDestination:responseMode:multiUserState:bargeInContext:sharedContextService:originatingHome:speechPackage:resultCandidateId:asrOnDevice:currentDeviceAssistantId:voiceTriggerEventInfo:)(v29, v30, v31, v32, v33, v34, v35, v36, v38, v39, v40, v41, v42, v43, v44, v45, v46, v47, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    v48,
    a26,
    a27,
    a28,
    a26,
    a27,
    a21,
    a22,
    a19,
    a20,
    a17,
    a18,
    v49,
    v50,
    v51,
    v52);
  return v28;
}

void CurrentRequest.init(refId:aceId:executionRequestId:sessionHandoffContinuityID:peerName:inputOrigin:interactionType:interactionId:audioSource:audioDestination:responseMode:multiUserState:bargeInContext:sharedContextService:originatingHome:speechPackage:resultCandidateId:asrOnDevice:currentDeviceAssistantId:voiceTriggerEventInfo:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,unsigned __int8 a37,uint64_t a38,uint64_t a39,uint64_t a40)
{
  OUTLINED_FUNCTION_60();
  uint64_t v45 = v40;
  uint64_t v227 = v46;
  uint64_t v228 = v47;
  uint64_t v222 = v48;
  uint64_t v224 = v49;
  uint64_t v216 = v50;
  v217 = v51;
  uint64_t v214 = v52;
  uint64_t v215 = v53;
  OUTLINED_FUNCTION_182(a40);
  OUTLINED_FUNCTION_181(a39);
  OUTLINED_FUNCTION_219(a38);
  OUTLINED_FUNCTION_180(a37);
  OUTLINED_FUNCTION_170(v54);
  OUTLINED_FUNCTION_141(a35);
  OUTLINED_FUNCTION_47(a34);
  OUTLINED_FUNCTION_106(v55);
  v239[1] = OUTLINED_FUNCTION_199(v56);
  OUTLINED_FUNCTION_0();
  v239[0] = v57;
  MEMORY[0x270FA5388](v58);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v59);
  v239[10] = OUTLINED_FUNCTION_67((uint64_t)&v205 - v60);
  OUTLINED_FUNCTION_0();
  v242 = v61;
  MEMORY[0x270FA5388](v62);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v63);
  OUTLINED_FUNCTION_44();
  v239[8] = OUTLINED_FUNCTION_66(v64);
  OUTLINED_FUNCTION_0();
  v240[4] = v65;
  MEMORY[0x270FA5388](v66);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v67);
  OUTLINED_FUNCTION_44();
  v239[9] = OUTLINED_FUNCTION_65(v68);
  OUTLINED_FUNCTION_0();
  v241 = v69;
  MEMORY[0x270FA5388](v70);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v71);
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_40(v72);
  uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for FlowTaskMetadata?);
  uint64_t v74 = OUTLINED_FUNCTION_9(v73);
  MEMORY[0x270FA5388](v74);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v75);
  OUTLINED_FUNCTION_40((uint64_t)&v205 - v76);
  uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for HomeInfo?);
  uint64_t v78 = OUTLINED_FUNCTION_9(v77);
  MEMORY[0x270FA5388](v78);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v79);
  OUTLINED_FUNCTION_40((uint64_t)&v205 - v80);
  uint64_t v81 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for BargeInContext?);
  uint64_t v82 = OUTLINED_FUNCTION_9(v81);
  MEMORY[0x270FA5388](v82);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v83);
  OUTLINED_FUNCTION_100();
  uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AudioDestination?);
  uint64_t v85 = OUTLINED_FUNCTION_9(v84);
  MEMORY[0x270FA5388](v85);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v86);
  OUTLINED_FUNCTION_129();
  uint64_t v87 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AudioSource?);
  uint64_t v88 = OUTLINED_FUNCTION_9(v87);
  MEMORY[0x270FA5388](v88);
  OUTLINED_FUNCTION_103();
  MEMORY[0x270FA5388](v89);
  OUTLINED_FUNCTION_128();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>);
  OUTLINED_FUNCTION_4_0();
  v40[3] = OUTLINED_FUNCTION_8_0();
  uint64_t v90 = v40 + 3;
  uint64_t v246 = 0;
  uint64_t v247 = 0;
  OUTLINED_FUNCTION_3_0();
  v40[4] = OUTLINED_FUNCTION_8_0();
  uint64_t v246 = 0;
  uint64_t v247 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v91 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_145(v91);
  uint64_t v205 = v92;
  uint64_t v246 = 0;
  uint64_t v247 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v93 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_144(v93);
  uint64_t v206 = v94;
  uint64_t v246 = 0;
  uint64_t v247 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v95 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_142(v95);
  uint64_t v207 = v96;
  uint64_t v246 = 0;
  uint64_t v247 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v97 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_173(v97);
  uint64_t v99 = OUTLINED_FUNCTION_178(v98);
  uint64_t v102 = OUTLINED_FUNCTION_61(v99, v100, v101, v99);
  uint64_t v209 = v42;
  uint64_t v211 = v41;
  outlined init with copy of AudioSource?(v102, v41, &demangling cache variable for type metadata for AudioSource?);
  uint64_t v212 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AudioSource?>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_92();
  outlined destroy of AudioSource?(v42, &demangling cache variable for type metadata for AudioSource?);
  OUTLINED_FUNCTION_132();
  uint64_t v104 = OUTLINED_FUNCTION_136(v103);
  OUTLINED_FUNCTION_56(v104, v105, v106, v104);
  uint64_t v210 = v43;
  OUTLINED_FUNCTION_28();
  outlined init with copy of AudioSource?(v107, v108, &demangling cache variable for type metadata for AudioDestination?);
  uint64_t v213 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AudioDestination?>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v109 = OUTLINED_FUNCTION_92();
  outlined destroy of AudioSource?(v43, &demangling cache variable for type metadata for AudioDestination?);
  OUTLINED_FUNCTION_133();
  uint64_t v111 = OUTLINED_FUNCTION_137(v110);
  OUTLINED_FUNCTION_90(v111);
  uint64_t v218 = v44;
  OUTLINED_FUNCTION_156();
  outlined init with copy of AudioSource?(v112, v113, &demangling cache variable for type metadata for BargeInContext?);
  uint64_t v220 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<BargeInContext?>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_208();
  OUTLINED_FUNCTION_172();
  OUTLINED_FUNCTION_50(v114);
  OUTLINED_FUNCTION_135();
  uint64_t v223 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SharedContextService?>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_113();
  OUTLINED_FUNCTION_192();
  uint64_t v116 = OUTLINED_FUNCTION_151(v115);
  uint64_t v117 = OUTLINED_FUNCTION_152(v116);
  outlined init with copy of AudioSource?(v117, v118, &demangling cache variable for type metadata for HomeInfo?);
  uint64_t v225 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<HomeInfo?>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_194();
  OUTLINED_FUNCTION_68(v119);
  uint64_t v226 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AFSpeechPackage?>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v120 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_171(v120);
  uint64_t v221 = v121;
  uint64_t v246 = 0;
  uint64_t v247 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v122 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_130(v122);
  OUTLINED_FUNCTION_176(v123);
  uint64_t v124 = (void (*)(void))__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool?>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v125 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_131(v125);
  OUTLINED_FUNCTION_68(v126);
  uint64_t v231 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<[String : String]?>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v127 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_191(v127);
  v229 = v128;
  uint64_t v246 = 0;
  uint64_t v247 = 0;
  OUTLINED_FUNCTION_3_0();
  v45[25] = OUTLINED_FUNCTION_8_0();
  v230 = v45 + 25;
  LOBYTE(v246) = &demangling cache variable for type metadata for HomeInfo?;
  OUTLINED_FUNCTION_51();
  uint64_t v129 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_146(v129);
  uint64_t v232 = OUTLINED_FUNCTION_150(v130);
  __swift_storeEnumTagSinglePayload(v239[6], 1, 1, v232);
  OUTLINED_FUNCTION_28();
  outlined init with copy of AudioSource?(v131, v132, &demangling cache variable for type metadata for FlowTaskMetadata?);
  uint64_t v233 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<FlowTaskMetadata?>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_92();
  OUTLINED_FUNCTION_114();
  v45[27] = v109;
  uint64_t v246 = 0;
  uint64_t v247 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v133 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_143(v133);
  v234[0] = v134;
  v234[8] = v45 + 34;
  uint64_t v246 = 0;
  uint64_t v247 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v135 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_236(v135);
  v234[1] = v136;
  uint64_t v246 = 0;
  uint64_t v247 = 0;
  OUTLINED_FUNCTION_3_0();
  v45[36] = OUTLINED_FUNCTION_8_0();
  uint64_t v246 = 0;
  uint64_t v247 = 0;
  OUTLINED_FUNCTION_3_0();
  v45[37] = OUTLINED_FUNCTION_8_0();
  uint64_t v246 = 0;
  uint64_t v247 = 0;
  OUTLINED_FUNCTION_3_0();
  v45[38] = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_23();
  swift_release();
  id v243 = v215;
  v244 = &demangling cache variable for type metadata for HomeInfo?;
  OUTLINED_FUNCTION_3_0();
  *uint64_t v90 = OUTLINED_FUNCTION_6_0();
  swift_endAccess();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_23();
  swift_release();
  id v243 = v217;
  v244 = &demangling cache variable for type metadata for HomeInfo?;
  OUTLINED_FUNCTION_3_0();
  uint64_t v137 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_197(v137);
  swift_bridgeObjectRelease();
  uint64_t v138 = v205;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_70();
  OUTLINED_FUNCTION_23();
  swift_release();
  id v243 = v224;
  v244 = v138;
  OUTLINED_FUNCTION_3_0();
  uint64_t v139 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37(v139);
  swift_bridgeObjectRelease();
  uint64_t v140 = v206;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_23();
  swift_release();
  id v243 = v228;
  v244 = v140;
  OUTLINED_FUNCTION_3_0();
  uint64_t v141 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37(v141);
  swift_bridgeObjectRelease();
  uint64_t v142 = v207;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_23();
  swift_release();
  id v243 = (id)v234[5];
  v244 = (uint64_t *)v142;
  OUTLINED_FUNCTION_3_0();
  uint64_t v143 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37(v143);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_101();
  OUTLINED_FUNCTION_20();
  v142();
  OUTLINED_FUNCTION_2_0();
  uint64_t v144 = OUTLINED_FUNCTION_15((uint64_t)v239);
  ((void (*)(uint64_t))v142)(v144);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<InputOrigin>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_46();
  uint64_t v145 = v45[5];
  v241 = v45 + 5;
  uint64_t v146 = OUTLINED_FUNCTION_21(v145);
  v147(v146);
  OUTLINED_FUNCTION_125();
  OUTLINED_FUNCTION_101();
  OUTLINED_FUNCTION_20();
  v142();
  OUTLINED_FUNCTION_2_0();
  uint64_t v148 = OUTLINED_FUNCTION_15((uint64_t)v240);
  ((void (*)(uint64_t))v142)(v148);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<InteractionType>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_85();
  uint64_t v150 = OUTLINED_FUNCTION_21(v149);
  v151(v150);
  OUTLINED_FUNCTION_124();
  uint64_t v152 = v208;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_70();
  OUTLINED_FUNCTION_23();
  swift_release();
  id v243 = (id)v234[4];
  v244 = (uint64_t *)v152;
  OUTLINED_FUNCTION_3_0();
  uint64_t v153 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37(v153);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_82();
  OUTLINED_FUNCTION_28();
  outlined init with copy of AudioSource?(v154, v155, &demangling cache variable for type metadata for AudioSource?);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_186();
  uint64_t v156 = OUTLINED_FUNCTION_200();
  OUTLINED_FUNCTION_41(v156, (uint64_t)v234);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_108();
  OUTLINED_FUNCTION_74();
  OUTLINED_FUNCTION_28();
  outlined init with copy of AudioSource?(v157, v158, &demangling cache variable for type metadata for AudioDestination?);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_186();
  OUTLINED_FUNCTION_41((uint64_t)v152, (uint64_t)&v246);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_108();
  OUTLINED_FUNCTION_221();
  OUTLINED_FUNCTION_20();
  v152();
  OUTLINED_FUNCTION_2_0();
  uint64_t v159 = OUTLINED_FUNCTION_15((uint64_t)&v241);
  ((void (*)(uint64_t))v152)(v159);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ResponseMode>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_46();
  uint64_t v160 = v45[5];
  v242 = v45 + 5;
  uint64_t v161 = OUTLINED_FUNCTION_21(v160);
  v162(v161);
  OUTLINED_FUNCTION_123();
  OUTLINED_FUNCTION_86();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_147();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<MultiUserState>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_112();
  OUTLINED_FUNCTION_140();
  OUTLINED_FUNCTION_95();
  OUTLINED_FUNCTION_28();
  outlined init with copy of AudioSource?(v163, v164, &demangling cache variable for type metadata for BargeInContext?);
  OUTLINED_FUNCTION_2_0();
  swift_release();
  OUTLINED_FUNCTION_102((uint64_t)v152, (uint64_t)&v248);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_111();
  uint64_t v165 = OUTLINED_FUNCTION_81();
  outlined init with copy of AudioSource?(v165, v166, &demangling cache variable for type metadata for SharedContextService?);
  uint64_t v167 = v219;
  OUTLINED_FUNCTION_2_0();
  swift_release();
  OUTLINED_FUNCTION_104();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_179();
  OUTLINED_FUNCTION_28();
  outlined init with copy of AudioSource?(v168, v169, &demangling cache variable for type metadata for HomeInfo?);
  OUTLINED_FUNCTION_2_0();
  swift_release();
  OUTLINED_FUNCTION_102(v167, (uint64_t)&v249);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_111();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_70();
  id v170 = v235;
  OUTLINED_FUNCTION_166((uint64_t)v235);
  id v243 = v170;
  OUTLINED_FUNCTION_4_0();
  uint64_t v171 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37(v171);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_39();
  id v243 = v236;
  v244 = v237;
  OUTLINED_FUNCTION_3_0();
  uint64_t v172 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_38(v172);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_39();
  LOBYTE(v243) = v238;
  OUTLINED_FUNCTION_51();
  uint64_t v173 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_38(v173);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_164((uint64_t)&v245);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_159();
  uint64_t v174 = MockablePublished.init(wrappedValue:)();
  OUTLINED_FUNCTION_122(v174);
  swift_bridgeObjectRelease();
  uint64_t v175 = v229;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_23();
  swift_release();
  id v243 = v175;
  OUTLINED_FUNCTION_4_0();
  uint64_t v176 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37(v176);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_39();
  id v243 = 0;
  v244 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v177 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_38(v177);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_39();
  LOBYTE(v243) = 2;
  OUTLINED_FUNCTION_51();
  uint64_t v178 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_38(v178);
  OUTLINED_FUNCTION_195();
  __swift_storeEnumTagSinglePayload(v179, v180, v181, v232);
  OUTLINED_FUNCTION_2_0();
  swift_release();
  OUTLINED_FUNCTION_63();
  outlined init with copy of AudioSource?(v182, v183, &demangling cache variable for type metadata for FlowTaskMetadata?);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_160();
  OUTLINED_FUNCTION_94();
  OUTLINED_FUNCTION_2_0();
  LODWORD(v243) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<UInt32>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v184 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_121(v184);
  OUTLINED_FUNCTION_2_0();
  swift_release();
  id v243 = 0;
  v244 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v185 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_57(v185);
  OUTLINED_FUNCTION_2_0();
  LOBYTE(v243) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v186 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_120(v186);
  OUTLINED_FUNCTION_2_0();
  LOBYTE(v243) = 0;
  OUTLINED_FUNCTION_12();
  uint64_t v187 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_119(v187);
  OUTLINED_FUNCTION_2_0();
  LOBYTE(v243) = 0;
  OUTLINED_FUNCTION_12();
  uint64_t v188 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_118(v188);
  OUTLINED_FUNCTION_2_0();
  LOBYTE(v243) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<RequestPositionInSession>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v189 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_117(v189);
  OUTLINED_FUNCTION_2_0();
  swift_release();
  id v243 = 0;
  v244 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v190 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_127(v190);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_75((uint64_t)&type metadata for DummyLocationProvider);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SiriLocationProvider>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v191 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_43(v191);
  OUTLINED_FUNCTION_2_0();
  swift_release();
  id v243 = 0;
  v244 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v192 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_126(v192);
  OUTLINED_FUNCTION_220();
  OUTLINED_FUNCTION_2_0();
  uint64_t v193 = OUTLINED_FUNCTION_49();
  ((void (*)(uint64_t))v124)(v193);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ExecutionLocation>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_73();
  uint64_t v194 = (void (*)(uint64_t))v45[4];
  uint64_t v195 = OUTLINED_FUNCTION_71();
  v194(v195);
  OUTLINED_FUNCTION_116();
  static ExecutionLocation.unknown.getter();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_79();
  v124();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_73();
  uint64_t v196 = OUTLINED_FUNCTION_71();
  v194(v196);
  OUTLINED_FUNCTION_115();
  OUTLINED_FUNCTION_53();
  uint64_t v197 = OUTLINED_FUNCTION_154();
  outlined destroy of AudioSource?(v197, &demangling cache variable for type metadata for HomeInfo?);
  uint64_t v198 = OUTLINED_FUNCTION_81();
  outlined destroy of AudioSource?(v198, &demangling cache variable for type metadata for SharedContextService?);
  uint64_t v199 = OUTLINED_FUNCTION_95();
  outlined destroy of AudioSource?(v199, &demangling cache variable for type metadata for BargeInContext?);
  OUTLINED_FUNCTION_163();
  OUTLINED_FUNCTION_24();
  v200();
  uint64_t v201 = OUTLINED_FUNCTION_74();
  outlined destroy of AudioSource?(v201, &demangling cache variable for type metadata for AudioDestination?);
  uint64_t v202 = OUTLINED_FUNCTION_82();
  outlined destroy of AudioSource?(v202, &demangling cache variable for type metadata for AudioSource?);
  OUTLINED_FUNCTION_91();
  OUTLINED_FUNCTION_24();
  v203();
  OUTLINED_FUNCTION_24();
  v204();
  OUTLINED_FUNCTION_139();
  OUTLINED_FUNCTION_59();
}

uint64_t CurrentRequest.__allocating_init(refId:aceId:executionRequestId:sessionHandoffContinuityID:peerName:inputOrigin:interactionType:interactionId:audioSource:audioDestination:responseMode:multiUserState:bargeInContext:sharedContextService:originatingHome:speechPackage:resultCandidateId:asrOnDevice:currentDeviceAssistantId:voiceTriggerEventInfo:companionName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  OUTLINED_FUNCTION_84(a1, a2, a3, a4, a5, a6, a7, a8);
  uint64_t v30 = OUTLINED_FUNCTION_77();
  LOBYTE(v50) = a25;
  uint64_t v31 = OUTLINED_FUNCTION_64();
  CurrentRequest.init(refId:aceId:executionRequestId:sessionHandoffContinuityID:peerName:inputOrigin:interactionType:interactionId:audioSource:audioDestination:responseMode:multiUserState:bargeInContext:sharedContextService:originatingHome:speechPackage:resultCandidateId:asrOnDevice:currentDeviceAssistantId:voiceTriggerEventInfo:companionName:)(v31, v32, v33, v34, v35, v36, v37, v38, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    v50,
    a26,
    a27,
    a28,
    a29,
    a30,
    a28,
    a29,
    a26,
    a27,
    a21,
    a22,
    a19,
    a20,
    a17,
    a18,
    v51,
    v52);
  return v30;
}

void CurrentRequest.init(refId:aceId:executionRequestId:sessionHandoffContinuityID:peerName:inputOrigin:interactionType:interactionId:audioSource:audioDestination:responseMode:multiUserState:bargeInContext:sharedContextService:originatingHome:speechPackage:resultCandidateId:asrOnDevice:currentDeviceAssistantId:voiceTriggerEventInfo:companionName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,unsigned __int8 a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42)
{
  OUTLINED_FUNCTION_60();
  uint64_t v46 = v42;
  uint64_t v235 = v47;
  v236 = v48;
  uint64_t v230 = v49;
  uint64_t v232 = v50;
  uint64_t v224 = v51;
  uint64_t v226 = v52;
  uint64_t v222 = v53;
  uint64_t v223 = v54;
  OUTLINED_FUNCTION_181(a42);
  OUTLINED_FUNCTION_182(a41);
  OUTLINED_FUNCTION_219(a40);
  OUTLINED_FUNCTION_167(a39);
  OUTLINED_FUNCTION_170(a38);
  OUTLINED_FUNCTION_180(a37);
  uint64_t v245 = v55;
  OUTLINED_FUNCTION_198(a35);
  OUTLINED_FUNCTION_19(v56);
  OUTLINED_FUNCTION_177(v57);
  OUTLINED_FUNCTION_105(v58);
  v248[3] = OUTLINED_FUNCTION_199(v59);
  OUTLINED_FUNCTION_0();
  v248[2] = v60;
  MEMORY[0x270FA5388](v61);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v62);
  v248[12] = OUTLINED_FUNCTION_67((uint64_t)&v213 - v63);
  OUTLINED_FUNCTION_0();
  v252 = v64;
  MEMORY[0x270FA5388](v65);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v66);
  OUTLINED_FUNCTION_44();
  v248[10] = OUTLINED_FUNCTION_66(v67);
  OUTLINED_FUNCTION_0();
  v250[1] = v68;
  MEMORY[0x270FA5388](v69);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v70);
  v248[11] = OUTLINED_FUNCTION_65((uint64_t)&v213 - v71);
  OUTLINED_FUNCTION_0();
  v251 = v72;
  MEMORY[0x270FA5388](v73);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v74);
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_40(v75);
  uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for FlowTaskMetadata?);
  uint64_t v77 = OUTLINED_FUNCTION_9(v76);
  MEMORY[0x270FA5388](v77);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v78);
  OUTLINED_FUNCTION_40((uint64_t)&v213 - v79);
  uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for HomeInfo?);
  uint64_t v81 = OUTLINED_FUNCTION_9(v80);
  MEMORY[0x270FA5388](v81);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v82);
  OUTLINED_FUNCTION_40((uint64_t)&v213 - v83);
  uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for BargeInContext?);
  uint64_t v85 = OUTLINED_FUNCTION_9(v84);
  MEMORY[0x270FA5388](v85);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v86);
  OUTLINED_FUNCTION_100();
  uint64_t v87 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AudioDestination?);
  uint64_t v88 = OUTLINED_FUNCTION_9(v87);
  MEMORY[0x270FA5388](v88);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v89);
  uint64_t v91 = (char *)&v213 - v90;
  uint64_t v92 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AudioSource?);
  uint64_t v93 = OUTLINED_FUNCTION_9(v92);
  MEMORY[0x270FA5388](v93);
  OUTLINED_FUNCTION_188();
  MEMORY[0x270FA5388](v94);
  OUTLINED_FUNCTION_128();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>);
  OUTLINED_FUNCTION_4_0();
  v42[3] = OUTLINED_FUNCTION_8_0();
  uint64_t v95 = v42 + 3;
  uint64_t v256 = 0;
  uint64_t v257 = 0;
  OUTLINED_FUNCTION_3_0();
  v42[4] = OUTLINED_FUNCTION_8_0();
  uint64_t v256 = 0;
  uint64_t v257 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v96 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_145(v96);
  uint64_t v213 = v97;
  uint64_t v256 = 0;
  uint64_t v257 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v98 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_144(v98);
  uint64_t v214 = v99;
  uint64_t v256 = 0;
  uint64_t v257 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v100 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_142(v100);
  uint64_t v215 = v101;
  uint64_t v256 = 0;
  uint64_t v257 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v102 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_173(v102);
  uint64_t v104 = OUTLINED_FUNCTION_178(v103);
  uint64_t v107 = OUTLINED_FUNCTION_61(v104, v105, v106, v104);
  uint64_t v217 = v43;
  uint64_t v219 = v44;
  outlined init with copy of AudioSource?(v107, v44, &demangling cache variable for type metadata for AudioSource?);
  uint64_t v220 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AudioSource?>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_132();
  uint64_t v109 = OUTLINED_FUNCTION_136(v108);
  OUTLINED_FUNCTION_185(v109, v110, v111, v109);
  uint64_t v218 = v91;
  OUTLINED_FUNCTION_156();
  outlined init with copy of AudioSource?(v112, v113, &demangling cache variable for type metadata for AudioDestination?);
  uint64_t v221 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AudioDestination?>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v114 = OUTLINED_FUNCTION_69();
  outlined destroy of AudioSource?((uint64_t)v91, &demangling cache variable for type metadata for AudioDestination?);
  OUTLINED_FUNCTION_133();
  uint64_t v116 = OUTLINED_FUNCTION_137(v115);
  OUTLINED_FUNCTION_90(v116);
  uint64_t v225 = v45;
  OUTLINED_FUNCTION_156();
  outlined init with copy of AudioSource?(v117, v118, &demangling cache variable for type metadata for BargeInContext?);
  uint64_t v228 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<BargeInContext?>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_208();
  OUTLINED_FUNCTION_172();
  OUTLINED_FUNCTION_50(v119);
  OUTLINED_FUNCTION_135();
  uint64_t v231 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SharedContextService?>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_113();
  OUTLINED_FUNCTION_192();
  uint64_t v121 = OUTLINED_FUNCTION_151(v120);
  uint64_t v122 = OUTLINED_FUNCTION_152(v121);
  outlined init with copy of AudioSource?(v122, v123, &demangling cache variable for type metadata for HomeInfo?);
  uint64_t v233 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<HomeInfo?>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_194();
  OUTLINED_FUNCTION_68(v124);
  uint64_t v234 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AFSpeechPackage?>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v125 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_171(v125);
  uint64_t v229 = v126;
  uint64_t v256 = 0;
  uint64_t v257 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v127 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_130(v127);
  OUTLINED_FUNCTION_176(v128);
  uint64_t v129 = (void (*)(void))__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool?>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v130 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_131(v130);
  OUTLINED_FUNCTION_68(v131);
  uint64_t v239 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<[String : String]?>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v132 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_191(v132);
  v237 = v133;
  uint64_t v256 = 0;
  uint64_t v257 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v134 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_193(v134);
  char v238 = v135;
  LOBYTE(v256) = &demangling cache variable for type metadata for HomeInfo?;
  OUTLINED_FUNCTION_51();
  uint64_t v136 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_146(v136);
  uint64_t v240 = OUTLINED_FUNCTION_150(v137);
  __swift_storeEnumTagSinglePayload(v248[8], 1, 1, v240);
  OUTLINED_FUNCTION_28();
  outlined init with copy of AudioSource?(v138, v139, &demangling cache variable for type metadata for FlowTaskMetadata?);
  uint64_t v241 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<FlowTaskMetadata?>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_92();
  OUTLINED_FUNCTION_114();
  v46[27] = v114;
  uint64_t v256 = 0;
  uint64_t v257 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v140 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_143(v140);
  v242[0] = v141;
  v242[8] = v46 + 34;
  uint64_t v256 = 0;
  uint64_t v257 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v142 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_236(v142);
  v242[1] = v143;
  uint64_t v256 = 0;
  uint64_t v257 = 0;
  OUTLINED_FUNCTION_3_0();
  v46[36] = OUTLINED_FUNCTION_8_0();
  uint64_t v256 = 0;
  uint64_t v257 = 0;
  OUTLINED_FUNCTION_3_0();
  v46[37] = OUTLINED_FUNCTION_8_0();
  uint64_t v256 = 0;
  uint64_t v257 = 0;
  OUTLINED_FUNCTION_3_0();
  v46[38] = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_23();
  swift_release();
  id v253 = v223;
  v254 = &demangling cache variable for type metadata for HomeInfo?;
  OUTLINED_FUNCTION_3_0();
  *uint64_t v95 = OUTLINED_FUNCTION_6_0();
  swift_endAccess();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_23();
  swift_release();
  id v253 = v226;
  v254 = &demangling cache variable for type metadata for HomeInfo?;
  OUTLINED_FUNCTION_3_0();
  uint64_t v144 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_197(v144);
  swift_bridgeObjectRelease();
  uint64_t v145 = v213;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_70();
  OUTLINED_FUNCTION_23();
  swift_release();
  id v253 = v232;
  v254 = v145;
  OUTLINED_FUNCTION_3_0();
  uint64_t v146 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37(v146);
  swift_bridgeObjectRelease();
  uint64_t v147 = v214;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_70();
  OUTLINED_FUNCTION_23();
  swift_release();
  id v253 = v236;
  v254 = v147;
  OUTLINED_FUNCTION_3_0();
  uint64_t v148 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37(v148);
  swift_bridgeObjectRelease();
  uint64_t v149 = v215;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_23();
  swift_release();
  id v253 = (id)v242[5];
  v254 = (uint64_t *)v149;
  OUTLINED_FUNCTION_3_0();
  uint64_t v150 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37(v150);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_101();
  OUTLINED_FUNCTION_20();
  v149();
  OUTLINED_FUNCTION_2_0();
  uint64_t v151 = OUTLINED_FUNCTION_15((uint64_t)v248);
  ((void (*)(uint64_t))v149)(v151);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<InputOrigin>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_46();
  uint64_t v152 = v46[5];
  v251 = v46 + 5;
  uint64_t v153 = OUTLINED_FUNCTION_21(v152);
  v154(v153);
  OUTLINED_FUNCTION_125();
  OUTLINED_FUNCTION_101();
  OUTLINED_FUNCTION_20();
  v149();
  OUTLINED_FUNCTION_2_0();
  uint64_t v155 = OUTLINED_FUNCTION_15((uint64_t)&v249);
  ((void (*)(uint64_t))v149)(v155);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<InteractionType>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_85();
  uint64_t v157 = OUTLINED_FUNCTION_21(v156);
  v158(v157);
  OUTLINED_FUNCTION_124();
  uint64_t v159 = v216;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_23();
  swift_release();
  id v253 = (id)v242[4];
  v254 = (uint64_t *)v159;
  OUTLINED_FUNCTION_3_0();
  uint64_t v160 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37(v160);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_82();
  OUTLINED_FUNCTION_28();
  outlined init with copy of AudioSource?(v161, v162, &demangling cache variable for type metadata for AudioSource?);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_186();
  uint64_t v163 = OUTLINED_FUNCTION_200();
  OUTLINED_FUNCTION_41(v163, (uint64_t)v242);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_108();
  OUTLINED_FUNCTION_74();
  OUTLINED_FUNCTION_28();
  outlined init with copy of AudioSource?(v164, v165, &demangling cache variable for type metadata for AudioDestination?);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_186();
  OUTLINED_FUNCTION_41((uint64_t)v159, (uint64_t)&v256);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_108();
  OUTLINED_FUNCTION_221();
  OUTLINED_FUNCTION_20();
  v159();
  OUTLINED_FUNCTION_2_0();
  uint64_t v166 = OUTLINED_FUNCTION_15((uint64_t)v250);
  ((void (*)(uint64_t))v159)(v166);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ResponseMode>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_46();
  uint64_t v167 = v46[5];
  v252 = v46 + 5;
  uint64_t v168 = OUTLINED_FUNCTION_21(v167);
  v169(v168);
  OUTLINED_FUNCTION_123();
  OUTLINED_FUNCTION_86();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_147();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<MultiUserState>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_112();
  OUTLINED_FUNCTION_140();
  OUTLINED_FUNCTION_95();
  OUTLINED_FUNCTION_28();
  outlined init with copy of AudioSource?(v170, v171, &demangling cache variable for type metadata for BargeInContext?);
  OUTLINED_FUNCTION_2_0();
  swift_release();
  OUTLINED_FUNCTION_102((uint64_t)v159, (uint64_t)&v258);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_111();
  uint64_t v172 = OUTLINED_FUNCTION_81();
  outlined init with copy of AudioSource?(v172, v173, &demangling cache variable for type metadata for SharedContextService?);
  uint64_t v174 = v227;
  OUTLINED_FUNCTION_2_0();
  swift_release();
  OUTLINED_FUNCTION_104();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_179();
  OUTLINED_FUNCTION_28();
  outlined init with copy of AudioSource?(v175, v176, &demangling cache variable for type metadata for HomeInfo?);
  OUTLINED_FUNCTION_2_0();
  swift_release();
  OUTLINED_FUNCTION_102(v174, (uint64_t)&v259);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_111();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_70();
  id v177 = v243;
  OUTLINED_FUNCTION_166((uint64_t)v243);
  id v253 = v177;
  OUTLINED_FUNCTION_4_0();
  uint64_t v178 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37(v178);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_39();
  id v253 = v244;
  v254 = v245;
  OUTLINED_FUNCTION_3_0();
  uint64_t v179 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_38(v179);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_39();
  LOBYTE(v253) = v246;
  OUTLINED_FUNCTION_51();
  uint64_t v180 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_38(v180);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_164((uint64_t)&v255);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_159();
  uint64_t v181 = MockablePublished.init(wrappedValue:)();
  OUTLINED_FUNCTION_122(v181);
  swift_bridgeObjectRelease();
  uint64_t v182 = v237;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_70();
  OUTLINED_FUNCTION_23();
  swift_release();
  id v253 = v182;
  OUTLINED_FUNCTION_4_0();
  uint64_t v183 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37(v183);
  swift_bridgeObjectRelease();
  uint64_t v184 = v238;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_23();
  swift_release();
  id v253 = v247;
  v254 = v184;
  OUTLINED_FUNCTION_3_0();
  uint64_t v185 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37(v185);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_39();
  LOBYTE(v253) = 2;
  OUTLINED_FUNCTION_51();
  uint64_t v186 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_38(v186);
  OUTLINED_FUNCTION_195();
  __swift_storeEnumTagSinglePayload(v187, v188, v189, v240);
  OUTLINED_FUNCTION_2_0();
  swift_release();
  OUTLINED_FUNCTION_63();
  outlined init with copy of AudioSource?(v190, v191, &demangling cache variable for type metadata for FlowTaskMetadata?);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_160();
  OUTLINED_FUNCTION_94();
  OUTLINED_FUNCTION_2_0();
  LODWORD(v253) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<UInt32>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v192 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_121(v192);
  OUTLINED_FUNCTION_2_0();
  swift_release();
  id v253 = 0;
  v254 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v193 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_57(v193);
  OUTLINED_FUNCTION_2_0();
  LOBYTE(v253) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v194 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_120(v194);
  OUTLINED_FUNCTION_2_0();
  LOBYTE(v253) = 0;
  OUTLINED_FUNCTION_12();
  uint64_t v195 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_119(v195);
  OUTLINED_FUNCTION_2_0();
  LOBYTE(v253) = 0;
  OUTLINED_FUNCTION_12();
  uint64_t v196 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_118(v196);
  OUTLINED_FUNCTION_2_0();
  LOBYTE(v253) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<RequestPositionInSession>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v197 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_117(v197);
  OUTLINED_FUNCTION_2_0();
  swift_release();
  id v253 = 0;
  v254 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v198 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_127(v198);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_75((uint64_t)&type metadata for DummyLocationProvider);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SiriLocationProvider>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v199 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_43(v199);
  OUTLINED_FUNCTION_2_0();
  swift_release();
  id v253 = 0;
  v254 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v200 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_126(v200);
  OUTLINED_FUNCTION_220();
  OUTLINED_FUNCTION_2_0();
  uint64_t v201 = OUTLINED_FUNCTION_49();
  ((void (*)(uint64_t))v129)(v201);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ExecutionLocation>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_73();
  uint64_t v202 = (void (*)(uint64_t))v46[4];
  uint64_t v203 = OUTLINED_FUNCTION_71();
  v202(v203);
  OUTLINED_FUNCTION_116();
  static ExecutionLocation.unknown.getter();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_79();
  v129();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_73();
  uint64_t v204 = OUTLINED_FUNCTION_71();
  v202(v204);
  OUTLINED_FUNCTION_115();
  OUTLINED_FUNCTION_53();
  uint64_t v205 = OUTLINED_FUNCTION_154();
  outlined destroy of AudioSource?(v205, &demangling cache variable for type metadata for HomeInfo?);
  uint64_t v206 = OUTLINED_FUNCTION_81();
  outlined destroy of AudioSource?(v206, &demangling cache variable for type metadata for SharedContextService?);
  uint64_t v207 = OUTLINED_FUNCTION_95();
  outlined destroy of AudioSource?(v207, &demangling cache variable for type metadata for BargeInContext?);
  OUTLINED_FUNCTION_163();
  OUTLINED_FUNCTION_24();
  v208();
  uint64_t v209 = OUTLINED_FUNCTION_74();
  outlined destroy of AudioSource?(v209, &demangling cache variable for type metadata for AudioDestination?);
  uint64_t v210 = OUTLINED_FUNCTION_82();
  outlined destroy of AudioSource?(v210, &demangling cache variable for type metadata for AudioSource?);
  OUTLINED_FUNCTION_91();
  OUTLINED_FUNCTION_24();
  v211();
  OUTLINED_FUNCTION_24();
  v212();
  OUTLINED_FUNCTION_139();
  OUTLINED_FUNCTION_59();
}

uint64_t CurrentRequest.__allocating_init(refId:aceId:executionRequestId:sessionHandoffContinuityID:peerName:inputOrigin:interactionType:interactionId:audioSource:audioDestination:responseMode:multiUserState:bargeInContext:sharedContextService:originatingHome:speechPackage:resultCandidateId:asrOnDevice:currentDeviceAssistantId:voiceTriggerEventInfo:companionName:isRecognizeMyVoiceEnabled:)()
{
  OUTLINED_FUNCTION_55();
  uint64_t v5 = OUTLINED_FUNCTION_77();
  LOBYTE(v24) = v3;
  LOBYTE(v23) = v1;
  uint64_t v6 = OUTLINED_FUNCTION_48();
  CurrentRequest.init(refId:aceId:executionRequestId:sessionHandoffContinuityID:peerName:inputOrigin:interactionType:interactionId:audioSource:audioDestination:responseMode:multiUserState:bargeInContext:sharedContextService:originatingHome:speechPackage:resultCandidateId:asrOnDevice:currentDeviceAssistantId:voiceTriggerEventInfo:companionName:isRecognizeMyVoiceEnabled:)(v6, v7, v8, v9, v10, v11, v12, v13, v15, v16, v17, v18, v19, v20, v21, v22, (uint64_t)v34, v35, v32,
    v33,
    v30,
    v31,
    v4,
    v0,
    v23,
    v28,
    v29,
    v26,
    v27,
    v2,
    v24,
    v25,
    v26,
    v27,
    v28,
    v29,
    v30,
    v31,
    v32,
    v33,
    v34,
    v35,
    v36);
  return v5;
}

void CurrentRequest.init(refId:aceId:executionRequestId:sessionHandoffContinuityID:peerName:inputOrigin:interactionType:interactionId:audioSource:audioDestination:responseMode:multiUserState:bargeInContext:sharedContextService:originatingHome:speechPackage:resultCandidateId:asrOnDevice:currentDeviceAssistantId:voiceTriggerEventInfo:companionName:isRecognizeMyVoiceEnabled:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,unsigned __int8 a37,uint64_t a38,uint64_t a39,uint64_t a40,void *a41,uint64_t a42,unsigned __int8 a43)
{
  OUTLINED_FUNCTION_60();
  uint64_t v46 = v43;
  uint64_t v240 = v47;
  uint64_t v241 = v48;
  uint64_t v234 = v49;
  v236 = v50;
  uint64_t v228 = v51;
  uint64_t v230 = v52;
  uint64_t v226 = v53;
  uint64_t v227 = v54;
  int v253 = a43;
  OUTLINED_FUNCTION_182(a42);
  v252 = a41;
  OUTLINED_FUNCTION_181(a40);
  OUTLINED_FUNCTION_219(a39);
  OUTLINED_FUNCTION_167(a38);
  OUTLINED_FUNCTION_180(a37);
  OUTLINED_FUNCTION_141(v55);
  OUTLINED_FUNCTION_198(a35);
  OUTLINED_FUNCTION_47(v56);
  OUTLINED_FUNCTION_105(v57);
  v254[1] = OUTLINED_FUNCTION_199(v58);
  OUTLINED_FUNCTION_0();
  v254[0] = v59;
  MEMORY[0x270FA5388](v60);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v61);
  OUTLINED_FUNCTION_44();
  uint64_t v258 = OUTLINED_FUNCTION_67(v62);
  OUTLINED_FUNCTION_0();
  uint64_t v261 = v63;
  MEMORY[0x270FA5388](v64);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v65);
  OUTLINED_FUNCTION_44();
  uint64_t v256 = OUTLINED_FUNCTION_66(v66);
  OUTLINED_FUNCTION_0();
  v259[5] = v67;
  MEMORY[0x270FA5388](v68);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v69);
  OUTLINED_FUNCTION_44();
  uint64_t v257 = OUTLINED_FUNCTION_65(v70);
  OUTLINED_FUNCTION_0();
  uint64_t v260 = v71;
  MEMORY[0x270FA5388](v72);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v73);
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_40(v74);
  uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for FlowTaskMetadata?);
  uint64_t v76 = OUTLINED_FUNCTION_9(v75);
  MEMORY[0x270FA5388](v76);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v77);
  OUTLINED_FUNCTION_40((uint64_t)&v217 - v78);
  uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for HomeInfo?);
  uint64_t v80 = OUTLINED_FUNCTION_9(v79);
  MEMORY[0x270FA5388](v80);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v81);
  OUTLINED_FUNCTION_40((uint64_t)&v217 - v82);
  uint64_t v83 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for BargeInContext?);
  uint64_t v84 = OUTLINED_FUNCTION_9(v83);
  MEMORY[0x270FA5388](v84);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v85);
  OUTLINED_FUNCTION_100();
  uint64_t v86 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AudioDestination?);
  uint64_t v87 = OUTLINED_FUNCTION_9(v86);
  MEMORY[0x270FA5388](v87);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v88);
  OUTLINED_FUNCTION_168();
  uint64_t v89 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AudioSource?);
  uint64_t v90 = OUTLINED_FUNCTION_9(v89);
  uint64_t v91 = MEMORY[0x270FA5388](v90);
  uint64_t v93 = (char *)&v217 - ((v92 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v91);
  uint64_t v95 = (char *)&v217 - v94;
  OUTLINED_FUNCTION_149();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>);
  OUTLINED_FUNCTION_4_0();
  v43[3] = OUTLINED_FUNCTION_8_0();
  uint64_t v265 = 0;
  uint64_t v266 = 0;
  OUTLINED_FUNCTION_3_0();
  v43[4] = OUTLINED_FUNCTION_8_0();
  uint64_t v265 = 0;
  uint64_t v266 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v96 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_145(v96);
  uint64_t v217 = v97;
  uint64_t v265 = 0;
  uint64_t v266 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v98 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_144(v98);
  uint64_t v218 = v99;
  uint64_t v265 = 0;
  uint64_t v266 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v100 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_142(v100);
  uint64_t v219 = v101;
  uint64_t v265 = 0;
  uint64_t v266 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v102 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_173(v102);
  uint64_t v104 = OUTLINED_FUNCTION_178(v103);
  uint64_t v107 = OUTLINED_FUNCTION_185(v104, v105, v106, v104);
  uint64_t v221 = v95;
  uint64_t v223 = v93;
  outlined init with copy of AudioSource?(v107, (uint64_t)v93, &demangling cache variable for type metadata for AudioSource?);
  uint64_t v224 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AudioSource?>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_114();
  OUTLINED_FUNCTION_132();
  uint64_t v109 = OUTLINED_FUNCTION_136(v108);
  OUTLINED_FUNCTION_109(v109, v110, v111, v109);
  uint64_t v222 = v44;
  OUTLINED_FUNCTION_232();
  outlined init with copy of AudioSource?(v112, v113, &demangling cache variable for type metadata for AudioDestination?);
  uint64_t v225 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AudioDestination?>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_46();
  outlined destroy of AudioSource?(v44, &demangling cache variable for type metadata for AudioDestination?);
  OUTLINED_FUNCTION_133();
  uint64_t v115 = OUTLINED_FUNCTION_137(v114);
  OUTLINED_FUNCTION_90(v115);
  uint64_t v229 = v45;
  OUTLINED_FUNCTION_232();
  outlined init with copy of AudioSource?(v116, v117, &demangling cache variable for type metadata for BargeInContext?);
  uint64_t v232 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<BargeInContext?>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_46();
  outlined destroy of AudioSource?(v45, &demangling cache variable for type metadata for BargeInContext?);
  OUTLINED_FUNCTION_172();
  OUTLINED_FUNCTION_50(v118);
  OUTLINED_FUNCTION_224();
  uint64_t v235 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SharedContextService?>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_158();
  OUTLINED_FUNCTION_192();
  uint64_t v120 = OUTLINED_FUNCTION_151(v119);
  uint64_t v121 = v254[3];
  OUTLINED_FUNCTION_56(v120, v122, v123, v120);
  OUTLINED_FUNCTION_232();
  outlined init with copy of AudioSource?(v124, v125, &demangling cache variable for type metadata for HomeInfo?);
  uint64_t v237 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<HomeInfo?>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v126 = OUTLINED_FUNCTION_46();
  outlined destroy of AudioSource?(v121, &demangling cache variable for type metadata for HomeInfo?);
  OUTLINED_FUNCTION_194();
  OUTLINED_FUNCTION_68(v127);
  uint64_t v239 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AFSpeechPackage?>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v128 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_171(v128);
  uint64_t v233 = v129;
  uint64_t v265 = 0;
  uint64_t v266 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v130 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_130(v130);
  uint64_t v238 = v131;
  LOBYTE(v265) = 2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool?>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v132 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_131(v132);
  OUTLINED_FUNCTION_68(v133);
  uint64_t v244 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<[String : String]?>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v134 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_191(v134);
  v242 = v135;
  uint64_t v265 = 0;
  uint64_t v266 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v136 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_193(v136);
  id v243 = v137;
  LOBYTE(v265) = 2;
  OUTLINED_FUNCTION_212();
  v46[26] = OUTLINED_FUNCTION_8_0();
  uint64_t v138 = type metadata accessor for FlowTaskMetadata();
  OUTLINED_FUNCTION_185(v138, v139, v140, v138);
  OUTLINED_FUNCTION_232();
  outlined init with copy of AudioSource?(v141, v142, &demangling cache variable for type metadata for FlowTaskMetadata?);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<FlowTaskMetadata?>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_114();
  v46[27] = v126;
  uint64_t v265 = 0;
  uint64_t v266 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v143 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_143(v143);
  uint64_t v245 = v144;
  v247[4] = v46 + 34;
  uint64_t v265 = 0;
  uint64_t v266 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v145 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_236(v145);
  uint64_t v246 = v146;
  uint64_t v265 = 0;
  uint64_t v266 = 0;
  OUTLINED_FUNCTION_3_0();
  v46[36] = OUTLINED_FUNCTION_8_0();
  uint64_t v265 = 0;
  uint64_t v266 = 0;
  OUTLINED_FUNCTION_3_0();
  v46[37] = OUTLINED_FUNCTION_8_0();
  uint64_t v265 = 0;
  uint64_t v266 = 0;
  OUTLINED_FUNCTION_3_0();
  v46[38] = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_0();
  uint64_t v147 = v226;
  swift_bridgeObjectRetain();
  swift_release();
  id v262 = v227;
  v263 = v147;
  OUTLINED_FUNCTION_3_0();
  uint64_t v148 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37(v148);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_0();
  uint64_t v149 = v228;
  swift_bridgeObjectRetain();
  swift_release();
  id v262 = v230;
  v263 = v149;
  OUTLINED_FUNCTION_3_0();
  uint64_t v150 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_38(v150);
  swift_bridgeObjectRelease();
  uint64_t v151 = v217;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_70();
  OUTLINED_FUNCTION_23();
  swift_release();
  id v262 = v236;
  v263 = v151;
  OUTLINED_FUNCTION_3_0();
  uint64_t v152 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37(v152);
  swift_bridgeObjectRelease();
  uint64_t v153 = v218;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_23();
  swift_release();
  id v262 = v241;
  v263 = v153;
  OUTLINED_FUNCTION_3_0();
  uint64_t v154 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37(v154);
  swift_bridgeObjectRelease();
  uint64_t v155 = v219;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_70();
  OUTLINED_FUNCTION_23();
  swift_release();
  id v262 = (id)v247[1];
  v263 = v155;
  OUTLINED_FUNCTION_3_0();
  uint64_t v156 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37(v156);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_155();
  OUTLINED_FUNCTION_20();
  v155();
  OUTLINED_FUNCTION_2_0();
  uint64_t v157 = OUTLINED_FUNCTION_15((uint64_t)v254);
  ((void (*)(uint64_t))v155)(v157);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<InputOrigin>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_209();
  uint64_t v159 = OUTLINED_FUNCTION_21(v158);
  v160(v159);
  OUTLINED_FUNCTION_125();
  OUTLINED_FUNCTION_155();
  OUTLINED_FUNCTION_20();
  v155();
  OUTLINED_FUNCTION_2_0();
  uint64_t v161 = OUTLINED_FUNCTION_15((uint64_t)v259);
  ((void (*)(uint64_t))v155)(v161);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<InteractionType>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_85();
  uint64_t v163 = OUTLINED_FUNCTION_21(v162);
  v164(v163);
  OUTLINED_FUNCTION_124();
  uint64_t v165 = v220;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_70();
  OUTLINED_FUNCTION_23();
  swift_release();
  id v262 = (id)v247[2];
  v263 = v165;
  OUTLINED_FUNCTION_3_0();
  uint64_t v166 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37(v166);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_82();
  OUTLINED_FUNCTION_28();
  outlined init with copy of AudioSource?(v167, v168, &demangling cache variable for type metadata for AudioSource?);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_234();
  uint64_t v169 = OUTLINED_FUNCTION_200();
  OUTLINED_FUNCTION_41(v169, (uint64_t)v247);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_94();
  OUTLINED_FUNCTION_74();
  OUTLINED_FUNCTION_28();
  outlined init with copy of AudioSource?(v170, v171, &demangling cache variable for type metadata for AudioDestination?);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_234();
  uint64_t v172 = OUTLINED_FUNCTION_200();
  OUTLINED_FUNCTION_41(v172, (uint64_t)&v267);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_94();
  uint64_t v173 = *(void (**)(void))(v261 + 16);
  OUTLINED_FUNCTION_20();
  v173();
  OUTLINED_FUNCTION_2_0();
  uint64_t v174 = OUTLINED_FUNCTION_15((uint64_t)&v260);
  ((void (*)(uint64_t))v173)(v174);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ResponseMode>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_226();
  uint64_t v176 = OUTLINED_FUNCTION_21(v175);
  v177(v176);
  OUTLINED_FUNCTION_123();
  OUTLINED_FUNCTION_86();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_147();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<MultiUserState>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_112();
  OUTLINED_FUNCTION_140();
  OUTLINED_FUNCTION_95();
  OUTLINED_FUNCTION_28();
  outlined init with copy of AudioSource?(v178, v179, &demangling cache variable for type metadata for BargeInContext?);
  OUTLINED_FUNCTION_2_0();
  swift_release();
  OUTLINED_FUNCTION_96((uint64_t)v173, (uint64_t)&v268);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_111();
  uint64_t v180 = OUTLINED_FUNCTION_81();
  outlined init with copy of AudioSource?(v180, v181, &demangling cache variable for type metadata for SharedContextService?);
  uint64_t v182 = v231;
  OUTLINED_FUNCTION_2_0();
  swift_release();
  OUTLINED_FUNCTION_104();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_179();
  OUTLINED_FUNCTION_154();
  OUTLINED_FUNCTION_28();
  outlined init with copy of AudioSource?(v183, v184, &demangling cache variable for type metadata for HomeInfo?);
  OUTLINED_FUNCTION_2_0();
  swift_release();
  OUTLINED_FUNCTION_96(v182, (uint64_t)&v269);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_111();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_70();
  id v185 = v248;
  id v255 = v248;
  swift_release();
  id v262 = v185;
  OUTLINED_FUNCTION_4_0();
  uint64_t v186 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37(v186);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_39();
  id v262 = v249;
  v263 = v250;
  OUTLINED_FUNCTION_3_0();
  uint64_t v187 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_38(v187);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_39();
  LOBYTE(v262) = v251;
  OUTLINED_FUNCTION_212();
  uint64_t v188 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_38(v188);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_164((uint64_t)&v264);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_159();
  uint64_t v189 = MockablePublished.init(wrappedValue:)();
  OUTLINED_FUNCTION_122(v189);
  swift_bridgeObjectRelease();
  uint64_t v190 = v242;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_23();
  swift_release();
  id v262 = v190;
  OUTLINED_FUNCTION_4_0();
  uint64_t v191 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37(v191);
  swift_bridgeObjectRelease();
  uint64_t v192 = v243;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_23();
  swift_release();
  id v262 = v252;
  v263 = v192;
  OUTLINED_FUNCTION_3_0();
  uint64_t v193 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37(v193);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_0();
  swift_release();
  LOBYTE(v262) = v253;
  OUTLINED_FUNCTION_212();
  uint64_t v194 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_230(v194);
  OUTLINED_FUNCTION_2_0();
  LODWORD(v262) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<UInt32>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v195 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_121(v195);
  OUTLINED_FUNCTION_2_0();
  swift_release();
  id v262 = 0;
  v263 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v196 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_230(v196);
  OUTLINED_FUNCTION_2_0();
  LOBYTE(v262) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v197 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_120(v197);
  OUTLINED_FUNCTION_2_0();
  LOBYTE(v262) = 0;
  OUTLINED_FUNCTION_12();
  uint64_t v198 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_119(v198);
  OUTLINED_FUNCTION_2_0();
  LOBYTE(v262) = 0;
  OUTLINED_FUNCTION_12();
  uint64_t v199 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_118(v199);
  OUTLINED_FUNCTION_2_0();
  LOBYTE(v262) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<RequestPositionInSession>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v200 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_117(v200);
  OUTLINED_FUNCTION_2_0();
  swift_release();
  id v262 = 0;
  v263 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v201 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_127(v201);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_75((uint64_t)&type metadata for DummyLocationProvider);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SiriLocationProvider>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v202 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_43(v202);
  OUTLINED_FUNCTION_2_0();
  swift_release();
  id v262 = 0;
  v263 = 0;
  OUTLINED_FUNCTION_3_0();
  uint64_t v203 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_126(v203);
  static ExecutionLocation.unknown.getter();
  OUTLINED_FUNCTION_2_0();
  uint64_t v204 = v254[0];
  uint64_t v205 = *(void (**)(void))(v254[0] + 16);
  OUTLINED_FUNCTION_79();
  v205();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ExecutionLocation>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_73();
  uint64_t v206 = *(void (**)(uint64_t))(v204 + 8);
  uint64_t v207 = OUTLINED_FUNCTION_233();
  v206(v207);
  OUTLINED_FUNCTION_116();
  static ExecutionLocation.unknown.getter();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_79();
  v205();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_73();
  uint64_t v208 = OUTLINED_FUNCTION_233();
  v206(v208);
  OUTLINED_FUNCTION_115();
  OUTLINED_FUNCTION_231();

  uint64_t v209 = OUTLINED_FUNCTION_154();
  outlined destroy of AudioSource?(v209, &demangling cache variable for type metadata for HomeInfo?);
  uint64_t v210 = OUTLINED_FUNCTION_81();
  outlined destroy of AudioSource?(v210, &demangling cache variable for type metadata for SharedContextService?);
  uint64_t v211 = OUTLINED_FUNCTION_95();
  outlined destroy of AudioSource?(v211, &demangling cache variable for type metadata for BargeInContext?);
  OUTLINED_FUNCTION_163();
  OUTLINED_FUNCTION_24();
  v212();
  uint64_t v213 = OUTLINED_FUNCTION_74();
  outlined destroy of AudioSource?(v213, &demangling cache variable for type metadata for AudioDestination?);
  uint64_t v214 = OUTLINED_FUNCTION_82();
  outlined destroy of AudioSource?(v214, &demangling cache variable for type metadata for AudioSource?);
  OUTLINED_FUNCTION_91();
  OUTLINED_FUNCTION_24();
  v215();
  OUTLINED_FUNCTION_24();
  v216();
  OUTLINED_FUNCTION_139();
  OUTLINED_FUNCTION_59();
}

uint64_t CurrentRequest.__allocating_init(refId:aceId:executionRequestId:sessionHandoffContinuityID:peerName:inputOrigin:interactionType:interactionId:audioSource:audioDestination:responseMode:multiUserState:bargeInContext:sharedContextService:originatingHome:speechPackage:resultCandidateId:asrOnDevice:currentDeviceAssistantId:voiceTriggerEventInfo:companionName:isRecognizeMyVoiceEnabled:flowTaskMetadata:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  OUTLINED_FUNCTION_55();
  uint64_t v40 = OUTLINED_FUNCTION_77();
  LOBYTE(v43) = v35;
  LOBYTE(v42) = v33;
  CurrentRequest.init(refId:aceId:executionRequestId:sessionHandoffContinuityID:peerName:inputOrigin:interactionType:interactionId:audioSource:audioDestination:responseMode:multiUserState:bargeInContext:sharedContextService:originatingHome:speechPackage:resultCandidateId:asrOnDevice:currentDeviceAssistantId:voiceTriggerEventInfo:companionName:isRecognizeMyVoiceEnabled:flowTaskMetadata:)(v38, v37, v36, a4, a5, a6, a7, a8, v60, v61, v58, v59, v56, v57, v54, v55, v52, v53, v50,
    v51,
    v48,
    v49,
    v39,
    v32,
    v42,
    v46,
    v47,
    v44,
    v45,
    v34,
    v43,
    a32,
    v44,
    v45,
    v46,
    v47,
    v48,
    v49,
    v50,
    v51,
    v52,
    v53);
  return v40;
}

void CurrentRequest.init(refId:aceId:executionRequestId:sessionHandoffContinuityID:peerName:inputOrigin:interactionType:interactionId:audioSource:audioDestination:responseMode:multiUserState:bargeInContext:sharedContextService:originatingHome:speechPackage:resultCandidateId:asrOnDevice:currentDeviceAssistantId:voiceTriggerEventInfo:companionName:isRecognizeMyVoiceEnabled:flowTaskMetadata:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,unsigned __int8 a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42)
{
  OUTLINED_FUNCTION_60();
  uint64_t v45 = v42;
  uint64_t v229 = v46;
  uint64_t v230 = v47;
  uint64_t v223 = v48;
  uint64_t v226 = v49;
  uint64_t v217 = v50;
  uint64_t v219 = v51;
  uint64_t v215 = v52;
  uint64_t v216 = v53;
  OUTLINED_FUNCTION_229();
  int v247 = v54;
  OUTLINED_FUNCTION_167(a42);
  OUTLINED_FUNCTION_219(a41);
  OUTLINED_FUNCTION_170(a40);
  OUTLINED_FUNCTION_141(a39);
  uint64_t v245 = a38;
  OUTLINED_FUNCTION_180(a37);
  id v243 = v55;
  OUTLINED_FUNCTION_198(a35);
  OUTLINED_FUNCTION_19(v56);
  OUTLINED_FUNCTION_177(v57);
  OUTLINED_FUNCTION_78(v58);
  uint64_t v238 = v59;
  uint64_t v249 = OUTLINED_FUNCTION_199(a22);
  OUTLINED_FUNCTION_0();
  uint64_t v248 = v60;
  MEMORY[0x270FA5388](v61);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v62);
  uint64_t v256 = OUTLINED_FUNCTION_67((uint64_t)&v205 - v63);
  OUTLINED_FUNCTION_0();
  uint64_t v260 = v64;
  MEMORY[0x270FA5388](v65);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v66);
  OUTLINED_FUNCTION_44();
  uint64_t v254 = OUTLINED_FUNCTION_66(v67);
  OUTLINED_FUNCTION_0();
  uint64_t v258 = v68;
  MEMORY[0x270FA5388](v69);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v70);
  OUTLINED_FUNCTION_44();
  uint64_t v255 = OUTLINED_FUNCTION_65(v71);
  OUTLINED_FUNCTION_0();
  uint64_t v259 = v72;
  MEMORY[0x270FA5388](v73);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v74);
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_40(v75);
  uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for FlowTaskMetadata?);
  uint64_t v77 = OUTLINED_FUNCTION_9(v76);
  MEMORY[0x270FA5388](v77);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v78);
  OUTLINED_FUNCTION_40((uint64_t)&v205 - v79);
  uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for HomeInfo?);
  uint64_t v81 = OUTLINED_FUNCTION_9(v80);
  MEMORY[0x270FA5388](v81);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v82);
  OUTLINED_FUNCTION_40((uint64_t)&v205 - v83);
  uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for BargeInContext?);
  uint64_t v85 = OUTLINED_FUNCTION_9(v84);
  MEMORY[0x270FA5388](v85);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v86);
  uint64_t v88 = (char *)&v205 - v87;
  uint64_t v89 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AudioDestination?);
  uint64_t v90 = OUTLINED_FUNCTION_9(v89);
  MEMORY[0x270FA5388](v90);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v91);
  uint64_t v93 = (char *)&v205 - v92;
  uint64_t v94 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AudioSource?);
  uint64_t v95 = OUTLINED_FUNCTION_9(v94);
  MEMORY[0x270FA5388](v95);
  OUTLINED_FUNCTION_190();
  MEMORY[0x270FA5388](v96);
  OUTLINED_FUNCTION_129();
  OUTLINED_FUNCTION_149();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>);
  OUTLINED_FUNCTION_4_0();
  v42[3] = OUTLINED_FUNCTION_8_0();
  uint64_t v263 = 0;
  uint64_t v264 = 0;
  OUTLINED_FUNCTION_12();
  v42[4] = OUTLINED_FUNCTION_8_0();
  uint64_t v97 = v42 + 4;
  uint64_t v263 = 0;
  uint64_t v264 = 0;
  OUTLINED_FUNCTION_12();
  uint64_t v98 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_145(v98);
  uint64_t v206 = v99;
  uint64_t v263 = 0;
  uint64_t v264 = 0;
  OUTLINED_FUNCTION_12();
  uint64_t v100 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_144(v100);
  uint64_t v207 = v101;
  uint64_t v263 = 0;
  uint64_t v264 = 0;
  OUTLINED_FUNCTION_12();
  uint64_t v102 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_142(v102);
  uint64_t v208 = v103;
  uint64_t v263 = 0;
  uint64_t v264 = 0;
  OUTLINED_FUNCTION_12();
  uint64_t v104 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_173(v104);
  uint64_t v106 = OUTLINED_FUNCTION_178(v105);
  uint64_t v109 = OUTLINED_FUNCTION_56(v106, v107, v108, v106);
  uint64_t v210 = v43;
  uint64_t v212 = v44;
  outlined init with copy of AudioSource?(v109, v44, &demangling cache variable for type metadata for AudioSource?);
  uint64_t v213 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AudioSource?>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_132();
  uint64_t v111 = OUTLINED_FUNCTION_136(v110);
  OUTLINED_FUNCTION_89(v111);
  uint64_t v211 = v93;
  OUTLINED_FUNCTION_63();
  outlined init with copy of AudioSource?(v112, v113, &demangling cache variable for type metadata for AudioDestination?);
  uint64_t v214 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AudioDestination?>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_207();
  OUTLINED_FUNCTION_133();
  uint64_t v115 = OUTLINED_FUNCTION_137(v114);
  __swift_storeEnumTagSinglePayload((uint64_t)v88, 1, 1, v115);
  uint64_t v218 = v88;
  OUTLINED_FUNCTION_63();
  outlined init with copy of AudioSource?(v116, v117, &demangling cache variable for type metadata for BargeInContext?);
  uint64_t v221 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<BargeInContext?>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_45();
  outlined destroy of AudioSource?((uint64_t)v88, &demangling cache variable for type metadata for BargeInContext?);
  OUTLINED_FUNCTION_172();
  OUTLINED_FUNCTION_50(v118);
  OUTLINED_FUNCTION_135();
  uint64_t v224 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SharedContextService?>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_113();
  OUTLINED_FUNCTION_192();
  uint64_t v120 = OUTLINED_FUNCTION_151(v119);
  __swift_storeEnumTagSinglePayload(v251, 1, 1, v120);
  OUTLINED_FUNCTION_63();
  outlined init with copy of AudioSource?(v121, v122, &demangling cache variable for type metadata for HomeInfo?);
  uint64_t v225 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<HomeInfo?>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_98();
  OUTLINED_FUNCTION_194();
  OUTLINED_FUNCTION_68(v123);
  uint64_t v228 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AFSpeechPackage?>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v124 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_171(v124);
  uint64_t v222 = v125;
  uint64_t v263 = 0;
  uint64_t v264 = 0;
  OUTLINED_FUNCTION_12();
  uint64_t v126 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_130(v126);
  uint64_t v227 = v127;
  LOBYTE(v263) = 2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool?>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v128 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_131(v128);
  OUTLINED_FUNCTION_68(v129);
  uint64_t v233 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<[String : String]?>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v130 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_191(v130);
  uint64_t v231 = v131;
  uint64_t v263 = 0;
  uint64_t v264 = 0;
  OUTLINED_FUNCTION_12();
  uint64_t v132 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_193(v132);
  uint64_t v232 = v133;
  LOBYTE(v263) = 2;
  OUTLINED_FUNCTION_3_0();
  uint64_t v134 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_146(v134);
  uint64_t v136 = OUTLINED_FUNCTION_150(v135);
  uint64_t v137 = v253;
  __swift_storeEnumTagSinglePayload(v253, 1, 1, v136);
  OUTLINED_FUNCTION_63();
  outlined init with copy of AudioSource?(v138, v139, &demangling cache variable for type metadata for FlowTaskMetadata?);
  uint64_t v234 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<FlowTaskMetadata?>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v140 = OUTLINED_FUNCTION_45();
  outlined destroy of AudioSource?(v137, &demangling cache variable for type metadata for FlowTaskMetadata?);
  v45[27] = v140;
  uint64_t v263 = 0;
  uint64_t v264 = 0;
  OUTLINED_FUNCTION_12();
  uint64_t v141 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_143(v141);
  uint64_t v235 = v142;
  uint64_t v240 = v45 + 34;
  uint64_t v263 = 0;
  uint64_t v264 = 0;
  OUTLINED_FUNCTION_12();
  uint64_t v143 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_216(v143);
  OUTLINED_FUNCTION_12();
  v45[36] = OUTLINED_FUNCTION_8_0();
  uint64_t v263 = 0;
  uint64_t v264 = 0;
  OUTLINED_FUNCTION_12();
  v45[37] = OUTLINED_FUNCTION_8_0();
  uint64_t v263 = 0;
  uint64_t v264 = 0;
  OUTLINED_FUNCTION_12();
  v45[38] = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_23();
  swift_release();
  id v261 = v216;
  id v262 = &demangling cache variable for type metadata for FlowTaskMetadata?;
  OUTLINED_FUNCTION_12();
  uint64_t v144 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_230(v144);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_23();
  swift_release();
  id v261 = v219;
  id v262 = &demangling cache variable for type metadata for FlowTaskMetadata?;
  OUTLINED_FUNCTION_12();
  *uint64_t v97 = OUTLINED_FUNCTION_6_0();
  swift_endAccess();
  swift_bridgeObjectRelease();
  uint64_t v145 = v206;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_93();
  OUTLINED_FUNCTION_23();
  swift_release();
  id v261 = v226;
  id v262 = v145;
  OUTLINED_FUNCTION_12();
  uint64_t v146 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_57(v146);
  swift_bridgeObjectRelease();
  uint64_t v147 = v207;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_23();
  swift_release();
  id v261 = v230;
  id v262 = v147;
  OUTLINED_FUNCTION_12();
  uint64_t v148 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_57(v148);
  swift_bridgeObjectRelease();
  uint64_t v149 = v208;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_93();
  OUTLINED_FUNCTION_23();
  swift_release();
  id v261 = v238;
  id v262 = (uint64_t *)v149;
  OUTLINED_FUNCTION_12();
  uint64_t v150 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_57(v150);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_161();
  OUTLINED_FUNCTION_26();
  v149();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_26();
  v149();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<InputOrigin>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_97();
  OUTLINED_FUNCTION_205();
  uint64_t v238 = v151;
  OUTLINED_FUNCTION_24();
  v152();
  OUTLINED_FUNCTION_125();
  OUTLINED_FUNCTION_161();
  OUTLINED_FUNCTION_26();
  v149();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_26();
  v149();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<InteractionType>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_97();
  OUTLINED_FUNCTION_85();
  uint64_t v236 = v153;
  OUTLINED_FUNCTION_24();
  v154();
  OUTLINED_FUNCTION_124();
  uint64_t v155 = v209;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_93();
  OUTLINED_FUNCTION_23();
  swift_release();
  id v261 = v237;
  id v262 = (uint64_t *)v155;
  OUTLINED_FUNCTION_12();
  uint64_t v156 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_57(v156);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_82();
  OUTLINED_FUNCTION_28();
  outlined init with copy of AudioSource?(v157, v158, &demangling cache variable for type metadata for AudioSource?);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_237();
  OUTLINED_FUNCTION_80(v155, v212);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_228();
  OUTLINED_FUNCTION_74();
  OUTLINED_FUNCTION_28();
  outlined init with copy of AudioSource?(v159, v160, &demangling cache variable for type metadata for AudioDestination?);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_237();
  OUTLINED_FUNCTION_80(v155, v250);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_228();
  uint64_t v161 = v260;
  uint64_t v162 = *(void (**)(void))(v260 + 16);
  OUTLINED_FUNCTION_26();
  v162();
  OUTLINED_FUNCTION_2_0();
  uint64_t v163 = v239;
  OUTLINED_FUNCTION_26();
  v162();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ResponseMode>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_97();
  uint64_t v164 = *(void *)(v161 + 8);
  uint64_t v260 = v161 + 8;
  uint64_t v250 = v164;
  OUTLINED_FUNCTION_24();
  v165();
  OUTLINED_FUNCTION_123();
  OUTLINED_FUNCTION_86();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_147();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<MultiUserState>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_112();
  OUTLINED_FUNCTION_140();
  OUTLINED_FUNCTION_95();
  OUTLINED_FUNCTION_28();
  outlined init with copy of AudioSource?(v166, v167, &demangling cache variable for type metadata for BargeInContext?);
  OUTLINED_FUNCTION_2_0();
  swift_release();
  OUTLINED_FUNCTION_162((uint64_t)v162, (uint64_t)&v264);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_98();
  OUTLINED_FUNCTION_94();
  uint64_t v168 = OUTLINED_FUNCTION_81();
  outlined init with copy of AudioSource?(v168, v169, &demangling cache variable for type metadata for SharedContextService?);
  uint64_t v170 = v220;
  OUTLINED_FUNCTION_2_0();
  swift_release();
  OUTLINED_FUNCTION_224();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_158();
  OUTLINED_FUNCTION_179();
  OUTLINED_FUNCTION_28();
  outlined init with copy of AudioSource?(v171, v172, &demangling cache variable for type metadata for HomeInfo?);
  OUTLINED_FUNCTION_2_0();
  swift_release();
  OUTLINED_FUNCTION_162(v170, (uint64_t)&v265);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_98();
  OUTLINED_FUNCTION_94();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_93();
  id v173 = v241;
  id v252 = v241;
  swift_release();
  id v261 = v173;
  OUTLINED_FUNCTION_4_0();
  uint64_t v174 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_57(v174);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_39();
  id v261 = v242;
  id v262 = v243;
  OUTLINED_FUNCTION_12();
  uint64_t v175 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_38(v175);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_39();
  LOBYTE(v261) = v244;
  OUTLINED_FUNCTION_3_0();
  uint64_t v176 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_38(v176);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_164((uint64_t)&v262);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_159();
  uint64_t v177 = MockablePublished.init(wrappedValue:)();
  OUTLINED_FUNCTION_122(v177);
  swift_bridgeObjectRelease();
  uint64_t v178 = v231;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_93();
  OUTLINED_FUNCTION_23();
  swift_release();
  id v261 = v178;
  OUTLINED_FUNCTION_4_0();
  uint64_t v179 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_57(v179);
  swift_bridgeObjectRelease();
  uint64_t v180 = v232;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_93();
  OUTLINED_FUNCTION_23();
  swift_release();
  id v261 = v246;
  id v262 = (uint64_t *)v180;
  OUTLINED_FUNCTION_12();
  uint64_t v181 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_57(v181);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_39();
  LOBYTE(v261) = v247;
  OUTLINED_FUNCTION_3_0();
  uint64_t v182 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_38(v182);
  OUTLINED_FUNCTION_28();
  outlined init with copy of AudioSource?(v183, v184, &demangling cache variable for type metadata for FlowTaskMetadata?);
  OUTLINED_FUNCTION_2_0();
  swift_release();
  OUTLINED_FUNCTION_96(v180, (uint64_t)&v266);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_108();
  OUTLINED_FUNCTION_2_0();
  LODWORD(v261) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<UInt32>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v185 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_121(v185);
  OUTLINED_FUNCTION_2_0();
  swift_release();
  id v261 = 0;
  id v262 = 0;
  OUTLINED_FUNCTION_12();
  uint64_t v186 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_197(v186);
  OUTLINED_FUNCTION_2_0();
  LOBYTE(v261) = 0;
  uint64_t v187 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v188 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_120(v188);
  OUTLINED_FUNCTION_2_0();
  LOBYTE(v261) = 0;
  OUTLINED_FUNCTION_87();
  uint64_t v189 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_119(v189);
  OUTLINED_FUNCTION_2_0();
  LOBYTE(v261) = 0;
  OUTLINED_FUNCTION_87();
  uint64_t v190 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_118(v190);
  OUTLINED_FUNCTION_2_0();
  LOBYTE(v261) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<RequestPositionInSession>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v191 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_117(v191);
  OUTLINED_FUNCTION_2_0();
  swift_release();
  id v261 = 0;
  id v262 = 0;
  OUTLINED_FUNCTION_12();
  uint64_t v192 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_127(v192);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_75((uint64_t)&type metadata for DummyLocationProvider);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SiriLocationProvider>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v193 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_43(v193);
  OUTLINED_FUNCTION_2_0();
  swift_release();
  id v261 = 0;
  id v262 = 0;
  OUTLINED_FUNCTION_12();
  uint64_t v194 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_126(v194);
  static ExecutionLocation.unknown.getter();
  OUTLINED_FUNCTION_2_0();
  uint64_t v195 = OUTLINED_FUNCTION_88();
  ((void (*)(uint64_t))v163)(v195);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ExecutionLocation>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_73();
  uint64_t v196 = *(void (**)(void))(v187 + 8);
  OUTLINED_FUNCTION_5();
  v196();
  OUTLINED_FUNCTION_116();
  static ExecutionLocation.unknown.getter();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_183();
  v163();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_73();
  OUTLINED_FUNCTION_5();
  v196();
  OUTLINED_FUNCTION_115();
  OUTLINED_FUNCTION_165();
  outlined destroy of AudioSource?(v257, &demangling cache variable for type metadata for FlowTaskMetadata?);
  uint64_t v197 = OUTLINED_FUNCTION_154();
  outlined destroy of AudioSource?(v197, &demangling cache variable for type metadata for HomeInfo?);
  uint64_t v198 = OUTLINED_FUNCTION_81();
  outlined destroy of AudioSource?(v198, &demangling cache variable for type metadata for SharedContextService?);
  uint64_t v199 = OUTLINED_FUNCTION_95();
  outlined destroy of AudioSource?(v199, &demangling cache variable for type metadata for BargeInContext?);
  OUTLINED_FUNCTION_163();
  OUTLINED_FUNCTION_24();
  v200();
  uint64_t v201 = OUTLINED_FUNCTION_74();
  outlined destroy of AudioSource?(v201, &demangling cache variable for type metadata for AudioDestination?);
  uint64_t v202 = OUTLINED_FUNCTION_82();
  outlined destroy of AudioSource?(v202, &demangling cache variable for type metadata for AudioSource?);
  OUTLINED_FUNCTION_245();
  OUTLINED_FUNCTION_24();
  v203();
  OUTLINED_FUNCTION_238();
  OUTLINED_FUNCTION_24();
  v204();
  OUTLINED_FUNCTION_139();
  OUTLINED_FUNCTION_59();
}

void CurrentRequest.__allocating_init(refId:aceId:executionRequestId:sessionHandoffContinuityID:peerName:inputOrigin:interactionType:interactionId:audioSource:audioDestination:responseMode:multiUserState:bargeInContext:sharedContextService:originatingHome:speechPackage:resultCandidateId:asrOnDevice:currentDeviceAssistantId:voiceTriggerEventInfo:companionName:isRecognizeMyVoiceEnabled:flowTaskMetadata:voiceAudioSessionId:isSystemApertureEnabled:isInAmbient:positionInSession:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,unsigned __int8 *a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,int a45,__int16 a46,uint64_t a47)
{
  OUTLINED_FUNCTION_60();
  uint64_t v65 = v47;
  uint64_t v66 = v48;
  uint64_t v63 = v49;
  uint64_t v64 = v50;
  uint64_t v61 = v51;
  uint64_t v62 = v52;
  uint64_t v59 = v53;
  uint64_t v60 = v54;
  WORD2(v57) = a46;
  LODWORD(v57) = a45;
  LOBYTE(v56) = a43;
  LOBYTE(v55) = a37;
  swift_allocObject();
  CurrentRequest.init(refId:aceId:executionRequestId:sessionHandoffContinuityID:peerName:inputOrigin:interactionType:interactionId:audioSource:audioDestination:responseMode:multiUserState:bargeInContext:sharedContextService:originatingHome:speechPackage:resultCandidateId:asrOnDevice:currentDeviceAssistantId:voiceTriggerEventInfo:companionName:isRecognizeMyVoiceEnabled:flowTaskMetadata:voiceAudioSessionId:isSystemApertureEnabled:isInAmbient:positionInSession:)(v59, v60, v61, v62, v63, v64, v65, v66, a21, a22, a23, a24, a25, a26, a27, a28, a29, (uint64_t)a30, a31,
    a32,
    a33,
    a34,
    a35,
    a36,
    v55,
    a38,
    a39,
    a40,
    a41,
    a42,
    v56,
    a44,
    v57,
    a47,
    a40,
    a41,
    a38,
    a39,
    v58,
    a35,
    a33,
    a34,
    a31,
    a32,
    a29,
    BYTE4(a29),
    BYTE5(a29),
    a30);
  OUTLINED_FUNCTION_59();
}

void CurrentRequest.init(refId:aceId:executionRequestId:sessionHandoffContinuityID:peerName:inputOrigin:interactionType:interactionId:audioSource:audioDestination:responseMode:multiUserState:bargeInContext:sharedContextService:originatingHome:speechPackage:resultCandidateId:asrOnDevice:currentDeviceAssistantId:voiceTriggerEventInfo:companionName:isRecognizeMyVoiceEnabled:flowTaskMetadata:voiceAudioSessionId:isSystemApertureEnabled:isInAmbient:positionInSession:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,unsigned __int8 a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,int a45,unsigned __int8 a46,unsigned __int8 a47,unsigned __int8 *a48)
{
  OUTLINED_FUNCTION_60();
  uint64_t v51 = v48;
  uint64_t v235 = v52;
  uint64_t v236 = v53;
  uint64_t v230 = v54;
  uint64_t v232 = v55;
  uint64_t v224 = v56;
  uint64_t v225 = v57;
  uint64_t v221 = v58;
  uint64_t v222 = v59;
  int v260 = a47;
  int v259 = a46;
  int v258 = a45;
  OUTLINED_FUNCTION_229();
  int v256 = v60;
  OUTLINED_FUNCTION_141(a42);
  OUTLINED_FUNCTION_170(a41);
  uint64_t v254 = a40;
  uint64_t v253 = a39;
  uint64_t v252 = a38;
  OUTLINED_FUNCTION_180(a37);
  uint64_t v250 = v61;
  OUTLINED_FUNCTION_198(a35);
  OUTLINED_FUNCTION_19(v62);
  OUTLINED_FUNCTION_177(v63);
  OUTLINED_FUNCTION_78(v64);
  uint64_t v245 = v65;
  uint64_t v237 = a22;
  uint64_t v262 = type metadata accessor for ExecutionLocation();
  OUTLINED_FUNCTION_0();
  uint64_t v261 = v66;
  MEMORY[0x270FA5388](v67);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v68);
  uint64_t v269 = OUTLINED_FUNCTION_67((uint64_t)&v211 - v69);
  OUTLINED_FUNCTION_0();
  uint64_t v273 = v70;
  MEMORY[0x270FA5388](v71);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v72);
  OUTLINED_FUNCTION_44();
  uint64_t v267 = OUTLINED_FUNCTION_66(v73);
  OUTLINED_FUNCTION_0();
  uint64_t v271 = v74;
  MEMORY[0x270FA5388](v75);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v76);
  OUTLINED_FUNCTION_44();
  uint64_t v268 = OUTLINED_FUNCTION_65(v77);
  OUTLINED_FUNCTION_0();
  uint64_t v272 = v78;
  MEMORY[0x270FA5388](v79);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v80);
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_40(v81);
  uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for FlowTaskMetadata?);
  uint64_t v83 = OUTLINED_FUNCTION_9(v82);
  MEMORY[0x270FA5388](v83);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v84);
  OUTLINED_FUNCTION_40((uint64_t)&v211 - v85);
  uint64_t v86 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for HomeInfo?);
  uint64_t v87 = OUTLINED_FUNCTION_9(v86);
  MEMORY[0x270FA5388](v87);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v88);
  OUTLINED_FUNCTION_40((uint64_t)&v211 - v89);
  uint64_t v90 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for BargeInContext?);
  uint64_t v91 = OUTLINED_FUNCTION_9(v90);
  MEMORY[0x270FA5388](v91);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v92);
  uint64_t v94 = (char *)&v211 - v93;
  uint64_t v95 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AudioDestination?);
  uint64_t v96 = OUTLINED_FUNCTION_9(v95);
  MEMORY[0x270FA5388](v96);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v97);
  uint64_t v99 = (char *)&v211 - v98;
  uint64_t v100 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AudioSource?);
  uint64_t v101 = OUTLINED_FUNCTION_9(v100);
  MEMORY[0x270FA5388](v101);
  OUTLINED_FUNCTION_190();
  MEMORY[0x270FA5388](v102);
  OUTLINED_FUNCTION_129();
  int v257 = *a48;
  v48[2] = 0;
  uint64_t v276 = 0;
  uint64_t v277 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>);
  OUTLINED_FUNCTION_4_0();
  v48[3] = OUTLINED_FUNCTION_8_0();
  uint64_t v276 = 0;
  uint64_t v277 = 0;
  OUTLINED_FUNCTION_12();
  v48[4] = OUTLINED_FUNCTION_8_0();
  uint64_t v103 = v48 + 4;
  uint64_t v276 = 0;
  uint64_t v277 = 0;
  OUTLINED_FUNCTION_12();
  uint64_t v104 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_145(v104);
  uint64_t v212 = v105;
  uint64_t v276 = 0;
  uint64_t v277 = 0;
  OUTLINED_FUNCTION_12();
  uint64_t v106 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_144(v106);
  uint64_t v213 = v107;
  uint64_t v276 = 0;
  uint64_t v277 = 0;
  OUTLINED_FUNCTION_12();
  uint64_t v108 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_142(v108);
  uint64_t v214 = v109;
  uint64_t v276 = 0;
  uint64_t v277 = 0;
  OUTLINED_FUNCTION_12();
  uint64_t v110 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_173(v110);
  uint64_t v112 = OUTLINED_FUNCTION_178(v111);
  uint64_t v115 = OUTLINED_FUNCTION_56(v112, v113, v114, v112);
  uint64_t v216 = v49;
  uint64_t v218 = v50;
  outlined init with copy of AudioSource?(v115, v50, &demangling cache variable for type metadata for AudioSource?);
  uint64_t v219 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AudioSource?>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_132();
  uint64_t v117 = OUTLINED_FUNCTION_136(v116);
  OUTLINED_FUNCTION_89(v117);
  uint64_t v217 = v99;
  OUTLINED_FUNCTION_63();
  outlined init with copy of AudioSource?(v118, v119, &demangling cache variable for type metadata for AudioDestination?);
  uint64_t v220 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AudioDestination?>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_207();
  OUTLINED_FUNCTION_133();
  uint64_t v121 = OUTLINED_FUNCTION_137(v120);
  __swift_storeEnumTagSinglePayload((uint64_t)v94, 1, 1, v121);
  uint64_t v223 = v94;
  OUTLINED_FUNCTION_63();
  outlined init with copy of AudioSource?(v122, v123, &demangling cache variable for type metadata for BargeInContext?);
  uint64_t v227 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<BargeInContext?>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_45();
  outlined destroy of AudioSource?((uint64_t)v94, &demangling cache variable for type metadata for BargeInContext?);
  OUTLINED_FUNCTION_172();
  OUTLINED_FUNCTION_50(v124);
  OUTLINED_FUNCTION_135();
  uint64_t v229 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SharedContextService?>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_113();
  OUTLINED_FUNCTION_192();
  uint64_t v126 = OUTLINED_FUNCTION_151(v125);
  __swift_storeEnumTagSinglePayload(v264, 1, 1, v126);
  OUTLINED_FUNCTION_63();
  outlined init with copy of AudioSource?(v127, v128, &demangling cache variable for type metadata for HomeInfo?);
  uint64_t v231 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<HomeInfo?>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_98();
  OUTLINED_FUNCTION_194();
  OUTLINED_FUNCTION_68(v129);
  uint64_t v234 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AFSpeechPackage?>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v130 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_171(v130);
  uint64_t v228 = v131;
  uint64_t v276 = 0;
  uint64_t v277 = 0;
  OUTLINED_FUNCTION_12();
  uint64_t v132 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_130(v132);
  uint64_t v233 = v133;
  LOBYTE(v276) = 2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool?>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v134 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_131(v134);
  OUTLINED_FUNCTION_68(v135);
  uint64_t v240 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<[String : String]?>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v136 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_191(v136);
  uint64_t v238 = v137;
  uint64_t v276 = 0;
  uint64_t v277 = 0;
  OUTLINED_FUNCTION_12();
  uint64_t v138 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_193(v138);
  uint64_t v239 = v139;
  LOBYTE(v276) = 2;
  OUTLINED_FUNCTION_3_0();
  uint64_t v140 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_146(v140);
  uint64_t v142 = OUTLINED_FUNCTION_150(v141);
  uint64_t v143 = v266;
  __swift_storeEnumTagSinglePayload(v266, 1, 1, v142);
  OUTLINED_FUNCTION_63();
  outlined init with copy of AudioSource?(v144, v145, &demangling cache variable for type metadata for FlowTaskMetadata?);
  uint64_t v241 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<FlowTaskMetadata?>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v146 = OUTLINED_FUNCTION_45();
  outlined destroy of AudioSource?(v143, &demangling cache variable for type metadata for FlowTaskMetadata?);
  v51[27] = v146;
  uint64_t v276 = 0;
  uint64_t v277 = 0;
  OUTLINED_FUNCTION_12();
  uint64_t v147 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_143(v147);
  uint64_t v242 = v148;
  int v247 = v51 + 34;
  uint64_t v276 = 0;
  uint64_t v277 = 0;
  OUTLINED_FUNCTION_12();
  uint64_t v149 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_215(v149);
  OUTLINED_FUNCTION_12();
  v51[36] = OUTLINED_FUNCTION_8_0();
  uint64_t v276 = 0;
  uint64_t v277 = 0;
  OUTLINED_FUNCTION_12();
  v51[37] = OUTLINED_FUNCTION_8_0();
  uint64_t v276 = 0;
  uint64_t v277 = 0;
  OUTLINED_FUNCTION_12();
  v51[38] = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_23();
  swift_release();
  id v274 = v222;
  v275 = &demangling cache variable for type metadata for FlowTaskMetadata?;
  OUTLINED_FUNCTION_12();
  uint64_t v150 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_230(v150);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_23();
  swift_release();
  id v274 = v225;
  v275 = &demangling cache variable for type metadata for FlowTaskMetadata?;
  OUTLINED_FUNCTION_12();
  *uint64_t v103 = OUTLINED_FUNCTION_6_0();
  swift_endAccess();
  swift_bridgeObjectRelease();
  uint64_t v151 = v212;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_93();
  OUTLINED_FUNCTION_23();
  swift_release();
  id v274 = v232;
  v275 = v151;
  OUTLINED_FUNCTION_12();
  uint64_t v152 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_57(v152);
  swift_bridgeObjectRelease();
  uint64_t v153 = v213;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_93();
  OUTLINED_FUNCTION_23();
  swift_release();
  id v274 = v236;
  v275 = v153;
  OUTLINED_FUNCTION_12();
  uint64_t v154 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_57(v154);
  swift_bridgeObjectRelease();
  uint64_t v155 = v214;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_23();
  swift_release();
  id v274 = v245;
  v275 = (uint64_t *)v155;
  OUTLINED_FUNCTION_12();
  uint64_t v156 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_57(v156);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_161();
  OUTLINED_FUNCTION_26();
  v155();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_26();
  v155();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<InputOrigin>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_97();
  OUTLINED_FUNCTION_205();
  uint64_t v245 = v157;
  OUTLINED_FUNCTION_24();
  v158();
  OUTLINED_FUNCTION_125();
  OUTLINED_FUNCTION_161();
  OUTLINED_FUNCTION_26();
  v155();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_26();
  v155();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<InteractionType>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_97();
  OUTLINED_FUNCTION_85();
  uint64_t v243 = v159;
  OUTLINED_FUNCTION_24();
  v160();
  OUTLINED_FUNCTION_124();
  uint64_t v161 = v215;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_93();
  OUTLINED_FUNCTION_23();
  swift_release();
  id v274 = v244;
  v275 = (uint64_t *)v161;
  OUTLINED_FUNCTION_12();
  uint64_t v162 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_57(v162);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_82();
  OUTLINED_FUNCTION_28();
  outlined init with copy of AudioSource?(v163, v164, &demangling cache variable for type metadata for AudioSource?);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_237();
  OUTLINED_FUNCTION_80(v161, v218);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_228();
  OUTLINED_FUNCTION_74();
  OUTLINED_FUNCTION_28();
  outlined init with copy of AudioSource?(v165, v166, &demangling cache variable for type metadata for AudioDestination?);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_237();
  OUTLINED_FUNCTION_80(v161, v263);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_228();
  uint64_t v167 = v273;
  uint64_t v168 = *(void (**)(void))(v273 + 16);
  OUTLINED_FUNCTION_26();
  v168();
  OUTLINED_FUNCTION_2_0();
  uint64_t v169 = v246;
  OUTLINED_FUNCTION_26();
  v168();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ResponseMode>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_97();
  uint64_t v170 = *(void *)(v167 + 8);
  uint64_t v273 = v167 + 8;
  uint64_t v263 = v170;
  OUTLINED_FUNCTION_24();
  v171();
  OUTLINED_FUNCTION_123();
  OUTLINED_FUNCTION_86();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_147();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<MultiUserState>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_112();
  OUTLINED_FUNCTION_140();
  OUTLINED_FUNCTION_95();
  OUTLINED_FUNCTION_28();
  outlined init with copy of AudioSource?(v172, v173, &demangling cache variable for type metadata for BargeInContext?);
  OUTLINED_FUNCTION_2_0();
  swift_release();
  OUTLINED_FUNCTION_162((uint64_t)v168, (uint64_t)&v277);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_98();
  OUTLINED_FUNCTION_94();
  uint64_t v174 = OUTLINED_FUNCTION_81();
  outlined init with copy of AudioSource?(v174, v175, &demangling cache variable for type metadata for SharedContextService?);
  uint64_t v176 = v226;
  OUTLINED_FUNCTION_2_0();
  swift_release();
  OUTLINED_FUNCTION_224();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_158();
  OUTLINED_FUNCTION_179();
  OUTLINED_FUNCTION_28();
  outlined init with copy of AudioSource?(v177, v178, &demangling cache variable for type metadata for HomeInfo?);
  OUTLINED_FUNCTION_2_0();
  swift_release();
  OUTLINED_FUNCTION_162(v176, (uint64_t)&v278);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_98();
  OUTLINED_FUNCTION_94();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_93();
  id v179 = v248;
  id v265 = v248;
  swift_release();
  id v274 = v179;
  OUTLINED_FUNCTION_4_0();
  uint64_t v180 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_57(v180);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_39();
  id v274 = v249;
  v275 = v250;
  OUTLINED_FUNCTION_12();
  uint64_t v181 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_38(v181);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_39();
  LOBYTE(v274) = v251;
  OUTLINED_FUNCTION_3_0();
  uint64_t v182 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_38(v182);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_164((uint64_t)&v273);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_159();
  uint64_t v183 = MockablePublished.init(wrappedValue:)();
  OUTLINED_FUNCTION_122(v183);
  swift_bridgeObjectRelease();
  uint64_t v184 = v238;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_93();
  OUTLINED_FUNCTION_23();
  swift_release();
  id v274 = v184;
  OUTLINED_FUNCTION_4_0();
  uint64_t v185 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_57(v185);
  swift_bridgeObjectRelease();
  uint64_t v186 = v239;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_93();
  OUTLINED_FUNCTION_23();
  swift_release();
  id v274 = v255;
  v275 = (uint64_t *)v186;
  OUTLINED_FUNCTION_12();
  uint64_t v187 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_57(v187);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_39();
  LOBYTE(v274) = v256;
  OUTLINED_FUNCTION_3_0();
  uint64_t v188 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_38(v188);
  OUTLINED_FUNCTION_28();
  outlined init with copy of AudioSource?(v189, v190, &demangling cache variable for type metadata for FlowTaskMetadata?);
  OUTLINED_FUNCTION_2_0();
  swift_release();
  OUTLINED_FUNCTION_96(v186, (uint64_t)&v279);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_108();
  OUTLINED_FUNCTION_2_0();
  LODWORD(v274) = v258;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<UInt32>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v191 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_121(v191);
  OUTLINED_FUNCTION_2_0();
  swift_release();
  id v274 = 0;
  v275 = 0;
  OUTLINED_FUNCTION_12();
  uint64_t v192 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_197(v192);
  OUTLINED_FUNCTION_2_0();
  LOBYTE(v274) = v259;
  uint64_t v193 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v194 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_120(v194);
  OUTLINED_FUNCTION_2_0();
  LOBYTE(v274) = 0;
  OUTLINED_FUNCTION_87();
  uint64_t v195 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_119(v195);
  OUTLINED_FUNCTION_2_0();
  LOBYTE(v274) = v260;
  OUTLINED_FUNCTION_87();
  uint64_t v196 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_118(v196);
  OUTLINED_FUNCTION_2_0();
  LOBYTE(v274) = v257;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<RequestPositionInSession>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v197 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_117(v197);
  OUTLINED_FUNCTION_2_0();
  swift_release();
  id v274 = 0;
  v275 = 0;
  OUTLINED_FUNCTION_12();
  uint64_t v198 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_127(v198);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_75((uint64_t)&type metadata for DummyLocationProvider);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SiriLocationProvider>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v199 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_43(v199);
  OUTLINED_FUNCTION_2_0();
  swift_release();
  id v274 = 0;
  v275 = 0;
  OUTLINED_FUNCTION_12();
  uint64_t v200 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_126(v200);
  static ExecutionLocation.unknown.getter();
  OUTLINED_FUNCTION_2_0();
  uint64_t v201 = OUTLINED_FUNCTION_88();
  ((void (*)(uint64_t))v169)(v201);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ExecutionLocation>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_73();
  uint64_t v202 = *(void (**)(void))(v193 + 8);
  OUTLINED_FUNCTION_5();
  v202();
  OUTLINED_FUNCTION_116();
  static ExecutionLocation.unknown.getter();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_183();
  v169();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_73();
  OUTLINED_FUNCTION_5();
  v202();
  OUTLINED_FUNCTION_115();
  OUTLINED_FUNCTION_165();
  outlined destroy of AudioSource?(v270, &demangling cache variable for type metadata for FlowTaskMetadata?);
  uint64_t v203 = OUTLINED_FUNCTION_154();
  outlined destroy of AudioSource?(v203, &demangling cache variable for type metadata for HomeInfo?);
  uint64_t v204 = OUTLINED_FUNCTION_81();
  outlined destroy of AudioSource?(v204, &demangling cache variable for type metadata for SharedContextService?);
  uint64_t v205 = OUTLINED_FUNCTION_95();
  outlined destroy of AudioSource?(v205, &demangling cache variable for type metadata for BargeInContext?);
  OUTLINED_FUNCTION_163();
  OUTLINED_FUNCTION_24();
  v206();
  uint64_t v207 = OUTLINED_FUNCTION_74();
  outlined destroy of AudioSource?(v207, &demangling cache variable for type metadata for AudioDestination?);
  uint64_t v208 = OUTLINED_FUNCTION_82();
  outlined destroy of AudioSource?(v208, &demangling cache variable for type metadata for AudioSource?);
  OUTLINED_FUNCTION_245();
  OUTLINED_FUNCTION_24();
  v209();
  OUTLINED_FUNCTION_238();
  OUTLINED_FUNCTION_24();
  v210();
  OUTLINED_FUNCTION_139();
  OUTLINED_FUNCTION_59();
}

uint64_t CurrentRequest.__allocating_init(_:)()
{
  uint64_t v0 = OUTLINED_FUNCTION_77();
  CurrentRequest.init(_:)();
  return v0;
}

void CurrentRequest.init(_:)()
{
  OUTLINED_FUNCTION_60();
  uint64_t v6 = v0;
  uint64_t v233 = v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ExecutionLocation?);
  uint64_t v9 = OUTLINED_FUNCTION_9(v8);
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v10);
  v223[0] = (char *)v192 - v11;
  uint64_t v227 = type metadata accessor for ExecutionLocation();
  OUTLINED_FUNCTION_0();
  uint64_t v224 = v12;
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_40(v16);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ResponseMode?);
  uint64_t v18 = OUTLINED_FUNCTION_9(v17);
  MEMORY[0x270FA5388](v18);
  OUTLINED_FUNCTION_10();
  uint64_t v222 = OUTLINED_FUNCTION_67(v19);
  OUTLINED_FUNCTION_0();
  uint64_t v221 = v20;
  MEMORY[0x270FA5388](v21);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v22);
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_40(v23);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for InteractionType?);
  uint64_t v25 = OUTLINED_FUNCTION_9(v24);
  MEMORY[0x270FA5388](v25);
  OUTLINED_FUNCTION_10();
  uint64_t v203 = OUTLINED_FUNCTION_66(v26);
  OUTLINED_FUNCTION_0();
  uint64_t v212 = v27;
  MEMORY[0x270FA5388](v28);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v29);
  OUTLINED_FUNCTION_40((uint64_t)v192 - v30);
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for InputOrigin?);
  uint64_t v32 = OUTLINED_FUNCTION_9(v31);
  MEMORY[0x270FA5388](v32);
  OUTLINED_FUNCTION_10();
  uint64_t v193 = OUTLINED_FUNCTION_65(v33);
  OUTLINED_FUNCTION_0();
  uint64_t v198 = v34;
  MEMORY[0x270FA5388](v35);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v36);
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_40(v37);
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for FlowTaskMetadata?);
  uint64_t v39 = OUTLINED_FUNCTION_9(v38);
  MEMORY[0x270FA5388](v39);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v40);
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_40(v41);
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for HomeInfo?);
  uint64_t v43 = OUTLINED_FUNCTION_9(v42);
  MEMORY[0x270FA5388](v43);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x270FA5388](v44);
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_40(v45);
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for BargeInContext?);
  uint64_t v47 = OUTLINED_FUNCTION_9(v46);
  MEMORY[0x270FA5388](v47);
  OUTLINED_FUNCTION_188();
  MEMORY[0x270FA5388](v48);
  OUTLINED_FUNCTION_100();
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AudioDestination?);
  uint64_t v50 = OUTLINED_FUNCTION_9(v49);
  MEMORY[0x270FA5388](v50);
  OUTLINED_FUNCTION_189();
  MEMORY[0x270FA5388](v51);
  uint64_t v53 = (char *)v192 - v52;
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AudioSource?);
  uint64_t v55 = OUTLINED_FUNCTION_9(v54);
  MEMORY[0x270FA5388](v55);
  OUTLINED_FUNCTION_103();
  MEMORY[0x270FA5388](v56);
  OUTLINED_FUNCTION_168();
  OUTLINED_FUNCTION_149();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String?>);
  OUTLINED_FUNCTION_4_0();
  v0[3] = OUTLINED_FUNCTION_8_0();
  v192[0] = v0 + 3;
  long long v239 = 0uLL;
  OUTLINED_FUNCTION_3_0();
  v0[4] = OUTLINED_FUNCTION_8_0();
  v192[1] = v0 + 4;
  long long v239 = 0uLL;
  OUTLINED_FUNCTION_3_0();
  uint64_t v57 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_145(v57);
  v192[2] = v58;
  long long v239 = 0uLL;
  OUTLINED_FUNCTION_3_0();
  uint64_t v59 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_144(v59);
  v192[3] = v60;
  long long v239 = 0uLL;
  OUTLINED_FUNCTION_3_0();
  uint64_t v61 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_142(v61);
  v192[4] = v62;
  long long v239 = 0uLL;
  OUTLINED_FUNCTION_3_0();
  uint64_t v63 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_173(v63);
  uint64_t v65 = OUTLINED_FUNCTION_178(v64);
  uint64_t v68 = OUTLINED_FUNCTION_109(v65, v66, v67, v65);
  outlined init with copy of AudioSource?(v68, v1, &demangling cache variable for type metadata for AudioSource?);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AudioSource?>);
  OUTLINED_FUNCTION_148();
  uint64_t v195 = v69;
  swift_allocObject();
  uint64_t v200 = v1;
  MockablePublished.init(wrappedValue:)();
  uint64_t v199 = v3;
  outlined destroy of AudioSource?(v3, &demangling cache variable for type metadata for AudioSource?);
  OUTLINED_FUNCTION_132();
  uint64_t v71 = OUTLINED_FUNCTION_136(v70);
  uint64_t v74 = OUTLINED_FUNCTION_61(v71, v72, v73, v71);
  outlined init with copy of AudioSource?(v74, v4, &demangling cache variable for type metadata for AudioDestination?);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AudioDestination?>);
  OUTLINED_FUNCTION_148();
  uint64_t v196 = v75;
  swift_allocObject();
  uint64_t v206 = v4;
  MockablePublished.init(wrappedValue:)();
  uint64_t v205 = v53;
  outlined destroy of AudioSource?((uint64_t)v53, &demangling cache variable for type metadata for AudioDestination?);
  OUTLINED_FUNCTION_133();
  uint64_t v77 = OUTLINED_FUNCTION_137(v76);
  uint64_t v78 = OUTLINED_FUNCTION_90(v77);
  outlined init with copy of AudioSource?(v78, v2, &demangling cache variable for type metadata for BargeInContext?);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<BargeInContext?>);
  OUTLINED_FUNCTION_148();
  uint64_t v204 = v79;
  swift_allocObject();
  uint64_t v219 = v2;
  uint64_t v80 = MockablePublished.init(wrappedValue:)();
  uint64_t v218 = v5;
  outlined destroy of AudioSource?(v5, &demangling cache variable for type metadata for BargeInContext?);
  OUTLINED_FUNCTION_172();
  OUTLINED_FUNCTION_50(v81);
  uint64_t v82 = OUTLINED_FUNCTION_243();
  outlined init with copy of AudioSource?(v82, v83, &demangling cache variable for type metadata for SharedContextService?);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SharedContextService?>);
  OUTLINED_FUNCTION_148();
  uint64_t v207 = v84;
  swift_allocObject();
  OUTLINED_FUNCTION_107();
  OUTLINED_FUNCTION_83();
  OUTLINED_FUNCTION_192();
  uint64_t v86 = OUTLINED_FUNCTION_151(v85);
  uint64_t v89 = OUTLINED_FUNCTION_56(v86, v87, v88, v86);
  outlined init with copy of AudioSource?(v89, v230, &demangling cache variable for type metadata for HomeInfo?);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<HomeInfo?>);
  OUTLINED_FUNCTION_148();
  uint64_t v209 = v90;
  swift_allocObject();
  OUTLINED_FUNCTION_225();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_194();
  OUTLINED_FUNCTION_68(v91);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<AFSpeechPackage?>);
  OUTLINED_FUNCTION_148();
  uint64_t v210 = v92;
  swift_allocObject();
  uint64_t v93 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_171(v93);
  uint64_t v208 = v94;
  long long v239 = 0uLL;
  OUTLINED_FUNCTION_3_0();
  uint64_t v95 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_130(v95);
  OUTLINED_FUNCTION_141(v96);
  LOBYTE(v239) = 2;
  uint64_t v97 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool?>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v98 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_131(v98);
  OUTLINED_FUNCTION_68(v99);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<[String : String]?>);
  OUTLINED_FUNCTION_148();
  uint64_t v214 = v100;
  swift_allocObject();
  uint64_t v101 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_191(v101);
  OUTLINED_FUNCTION_181(v102);
  long long v239 = 0uLL;
  OUTLINED_FUNCTION_3_0();
  uint64_t v103 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_193(v103);
  uint64_t v213 = v104;
  LOBYTE(v239) = 2;
  uint64_t v201 = v97;
  swift_allocObject();
  uint64_t v105 = OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_146(v105);
  uint64_t v107 = OUTLINED_FUNCTION_150(v106);
  OUTLINED_FUNCTION_61(v107, v108, v109, v107);
  OUTLINED_FUNCTION_156();
  outlined init with copy of AudioSource?(v110, v111, &demangling cache variable for type metadata for FlowTaskMetadata?);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<FlowTaskMetadata?>);
  OUTLINED_FUNCTION_148();
  uint64_t v217 = v112;
  swift_allocObject();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_42();
  v6[27] = v80;
  uint64_t v215 = v6 + 27;
  long long v239 = 0uLL;
  OUTLINED_FUNCTION_3_0();
  v6[29] = OUTLINED_FUNCTION_8_0();
  long long v239 = 0uLL;
  OUTLINED_FUNCTION_3_0();
  v6[34] = OUTLINED_FUNCTION_8_0();
  long long v239 = 0uLL;
  OUTLINED_FUNCTION_3_0();
  v6[36] = OUTLINED_FUNCTION_8_0();
  long long v239 = 0uLL;
  OUTLINED_FUNCTION_3_0();
  v6[37] = OUTLINED_FUNCTION_8_0();
  long long v239 = 0uLL;
  OUTLINED_FUNCTION_3_0();
  uint64_t v113 = OUTLINED_FUNCTION_8_0();
  uint64_t v228 = v6 + 29;
  v6[38] = v113;
  uint64_t v114 = v193;
  swift_getKeyPath();
  uint64_t v115 = v233;
  Builder.subscript.getter();
  swift_release();
  uint64_t v116 = v236;
  uint64_t v117 = (uint64_t *)v237;
  OUTLINED_FUNCTION_2_0();
  swift_release();
  uint64_t v234 = v116;
  uint64_t v235 = v117;
  OUTLINED_FUNCTION_3_0();
  uint64_t v118 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_57(v118);
  swift_getKeyPath();
  Builder.subscript.getter();
  swift_release();
  uint64_t v119 = v236;
  uint64_t v120 = (uint64_t *)v237;
  OUTLINED_FUNCTION_2_0();
  swift_release();
  uint64_t v234 = v119;
  uint64_t v235 = v120;
  OUTLINED_FUNCTION_3_0();
  uint64_t v121 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_57(v121);
  swift_getKeyPath();
  Builder.subscript.getter();
  swift_release();
  uint64_t v122 = v236;
  uint64_t v123 = (uint64_t *)v237;
  OUTLINED_FUNCTION_2_0();
  swift_release();
  uint64_t v234 = v122;
  uint64_t v235 = v123;
  uint64_t v124 = v115;
  OUTLINED_FUNCTION_3_0();
  uint64_t v125 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_57(v125);
  uint64_t KeyPath = swift_getKeyPath();
  Builder.subscript.getter();
  swift_release();
  OUTLINED_FUNCTION_210();
  OUTLINED_FUNCTION_2_0();
  swift_release();
  uint64_t v234 = v115;
  uint64_t v235 = (uint64_t *)KeyPath;
  OUTLINED_FUNCTION_3_0();
  uint64_t v127 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37(v127);
  swift_getKeyPath();
  OUTLINED_FUNCTION_76();
  swift_release();
  OUTLINED_FUNCTION_210();
  OUTLINED_FUNCTION_2_0();
  swift_release();
  uint64_t v234 = v115;
  uint64_t v235 = (uint64_t *)KeyPath;
  OUTLINED_FUNCTION_3_0();
  uint64_t v128 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_37(v128);
  swift_getKeyPath();
  uint64_t v129 = v194;
  Builder.subscript.getter();
  uint64_t v130 = v129;
  swift_release();
  if (__swift_getEnumTagSinglePayload(v129, 1, v114) == 1)
  {
    uint64_t v131 = v198;
    uint64_t v132 = v197;
    (*(void (**)(uint64_t, void, uint64_t))(v198 + 104))(v197, *MEMORY[0x263F756D8], v114);
    outlined destroy of AudioSource?(v130, &demangling cache variable for type metadata for InputOrigin?);
  }
  else
  {
    uint64_t v131 = v198;
    uint64_t v132 = v197;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v198 + 32))(v197, v130, v114);
  }
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_13();
  v133();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<InputOrigin>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_69();
  (*(void (**)(uint64_t, uint64_t))(v131 + 8))(v132, v114);
  OUTLINED_FUNCTION_125();
  swift_getKeyPath();
  uint64_t v134 = v211;
  Builder.subscript.getter();
  swift_release();
  uint64_t v135 = v203;
  int EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v134, 1, v203);
  uint64_t v137 = v221;
  uint64_t v138 = v220;
  uint64_t v139 = v212;
  if (EnumTagSinglePayload == 1)
  {
    (*(void (**)(uint64_t, void, uint64_t))(v212 + 104))(v202, *MEMORY[0x263F757F8], v135);
    outlined destroy of AudioSource?(v134, &demangling cache variable for type metadata for InteractionType?);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v212 + 32))(v202, v134, v135);
  }
  uint64_t v211 = (uint64_t)(v228 + 5);
  OUTLINED_FUNCTION_182((uint64_t)(v228 + 7));
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_13();
  v140();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<InteractionType>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v141 = OUTLINED_FUNCTION_225();
  OUTLINED_FUNCTION_5();
  v142();
  OUTLINED_FUNCTION_124();
  swift_getKeyPath();
  OUTLINED_FUNCTION_76();
  swift_release();
  OUTLINED_FUNCTION_210();
  OUTLINED_FUNCTION_2_0();
  swift_release();
  uint64_t v234 = v141;
  uint64_t v235 = (uint64_t *)(v139 + 8);
  OUTLINED_FUNCTION_3_0();
  v6[10] = OUTLINED_FUNCTION_6_0();
  swift_endAccess();
  swift_getKeyPath();
  uint64_t v143 = v199;
  Builder.subscript.getter();
  swift_release();
  OUTLINED_FUNCTION_2_0();
  swift_release();
  OUTLINED_FUNCTION_213(v143, (uint64_t)v223);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_92();
  OUTLINED_FUNCTION_204();
  v6[11] = v124;
  swift_endAccess();
  swift_getKeyPath();
  uint64_t v144 = (uint64_t)v205;
  Builder.subscript.getter();
  swift_release();
  OUTLINED_FUNCTION_2_0();
  swift_release();
  OUTLINED_FUNCTION_213(v144, (uint64_t)&v232);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_92();
  OUTLINED_FUNCTION_207();
  v6[12] = v124;
  swift_endAccess();
  swift_getKeyPath();
  uint64_t v145 = v216;
  Builder.subscript.getter();
  uint64_t v146 = v145;
  swift_release();
  uint64_t v147 = v222;
  if (__swift_getEnumTagSinglePayload(v145, 1, v222) == 1)
  {
    uint64_t v148 = v224;
    static ResponseMode.displayForward.getter();
    outlined destroy of AudioSource?(v146, &demangling cache variable for type metadata for ResponseMode?);
  }
  else
  {
    uint64_t v148 = v224;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v137 + 32))(v138, v146, v147);
  }
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_25();
  v149();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ResponseMode>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_203();
  v150();
  OUTLINED_FUNCTION_123();
  swift_getKeyPath();
  Builder.subscript.getter();
  swift_release();
  if (v238 == 2)
  {
    long long v239 = 0u;
    long long v240 = 0u;
    uint64_t v241 = 1;
    uint64_t v242 = 0;
    uint64_t v243 = 0;
    uint64_t v244 = 0;
    outlined destroy of AudioSource?((uint64_t)&v236, &demangling cache variable for type metadata for MultiUserState?);
  }
  else
  {
    outlined init with take of MultiUserState((uint64_t)&v236, (uint64_t)&v239);
  }
  uint64_t v151 = v148;
  OUTLINED_FUNCTION_2_0();
  uint64_t v152 = OUTLINED_FUNCTION_243();
  outlined init with copy of MultiUserState(v152, v153);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<MultiUserState>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_107();
  OUTLINED_FUNCTION_112();
  v6[14] = v124;
  swift_endAccess();
  swift_getKeyPath();
  uint64_t v154 = v218;
  Builder.subscript.getter();
  swift_release();
  OUTLINED_FUNCTION_2_0();
  swift_release();
  OUTLINED_FUNCTION_213(v154, (uint64_t)&v240 + 8);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_92();
  OUTLINED_FUNCTION_114();
  v6[15] = v124;
  swift_endAccess();
  swift_getKeyPath();
  Builder.subscript.getter();
  swift_release();
  OUTLINED_FUNCTION_2_0();
  swift_release();
  uint64_t v155 = OUTLINED_FUNCTION_243();
  outlined init with copy of AudioSource?(v155, v156, &demangling cache variable for type metadata for SharedContextService?);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_107();
  OUTLINED_FUNCTION_158();
  v6[16] = v124;
  swift_endAccess();
  swift_getKeyPath();
  uint64_t v157 = v229;
  Builder.subscript.getter();
  swift_release();
  OUTLINED_FUNCTION_2_0();
  swift_release();
  outlined init with copy of AudioSource?(v157, v230, &demangling cache variable for type metadata for HomeInfo?);
  OUTLINED_FUNCTION_4_0();
  uint64_t v158 = OUTLINED_FUNCTION_58();
  outlined destroy of AudioSource?(v157, &demangling cache variable for type metadata for HomeInfo?);
  v6[17] = v158;
  swift_endAccess();
  swift_getKeyPath();
  OUTLINED_FUNCTION_76();
  swift_release();
  uint64_t v159 = v236;
  OUTLINED_FUNCTION_2_0();
  swift_release();
  uint64_t v234 = v159;
  OUTLINED_FUNCTION_4_0();
  v6[18] = OUTLINED_FUNCTION_6_0();
  swift_endAccess();
  swift_getKeyPath();
  OUTLINED_FUNCTION_76();
  swift_release();
  OUTLINED_FUNCTION_210();
  OUTLINED_FUNCTION_2_0();
  swift_release();
  uint64_t v234 = v159;
  uint64_t v235 = &demangling cache variable for type metadata for HomeInfo?;
  OUTLINED_FUNCTION_3_0();
  v6[19] = OUTLINED_FUNCTION_6_0();
  swift_endAccess();
  swift_getKeyPath();
  OUTLINED_FUNCTION_76();
  swift_release();
  LOBYTE(v159) = v236;
  OUTLINED_FUNCTION_2_0();
  swift_release();
  LOBYTE(v234) = v159;
  OUTLINED_FUNCTION_99();
  v6[20] = OUTLINED_FUNCTION_6_0();
  swift_endAccess();
  swift_getKeyPath();
  OUTLINED_FUNCTION_196();
  swift_release();
  if (*((void *)&v239 + 1)) {
    uint64_t v160 = v239;
  }
  else {
    uint64_t v160 = 0;
  }
  if (*((void *)&v239 + 1)) {
    unint64_t v161 = *((void *)&v239 + 1);
  }
  else {
    unint64_t v161 = 0xE000000000000000;
  }
  OUTLINED_FUNCTION_2_0();
  uint64_t v236 = v160;
  unint64_t v237 = v161;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<String>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v162 = OUTLINED_FUNCTION_107();
  OUTLINED_FUNCTION_122(v162);
  swift_getKeyPath();
  OUTLINED_FUNCTION_76();
  swift_release();
  uint64_t v163 = v236;
  OUTLINED_FUNCTION_2_0();
  swift_release();
  uint64_t v234 = v163;
  OUTLINED_FUNCTION_4_0();
  v6[22] = OUTLINED_FUNCTION_6_0();
  swift_endAccess();
  swift_getKeyPath();
  OUTLINED_FUNCTION_76();
  swift_release();
  OUTLINED_FUNCTION_210();
  OUTLINED_FUNCTION_2_0();
  swift_release();
  uint64_t v234 = v163;
  uint64_t v235 = (uint64_t *)v161;
  OUTLINED_FUNCTION_3_0();
  v6[25] = OUTLINED_FUNCTION_6_0();
  swift_endAccess();
  swift_getKeyPath();
  OUTLINED_FUNCTION_76();
  swift_release();
  LOBYTE(v163) = v236;
  OUTLINED_FUNCTION_2_0();
  swift_release();
  LOBYTE(v234) = v163;
  OUTLINED_FUNCTION_99();
  v6[26] = OUTLINED_FUNCTION_6_0();
  swift_endAccess();
  swift_getKeyPath();
  uint64_t v164 = v231;
  Builder.subscript.getter();
  swift_release();
  OUTLINED_FUNCTION_2_0();
  swift_release();
  OUTLINED_FUNCTION_156();
  outlined init with copy of AudioSource?(v165, v166, &demangling cache variable for type metadata for FlowTaskMetadata?);
  OUTLINED_FUNCTION_4_0();
  uint64_t v167 = OUTLINED_FUNCTION_69();
  outlined destroy of AudioSource?(v164, &demangling cache variable for type metadata for FlowTaskMetadata?);
  v6[27] = v167;
  swift_endAccess();
  swift_getKeyPath();
  OUTLINED_FUNCTION_196();
  swift_release();
  if (BYTE4(v239)) {
    int v168 = 0;
  }
  else {
    int v168 = v239;
  }
  OUTLINED_FUNCTION_2_0();
  LODWORD(v236) = v168;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<UInt32>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v169 = OUTLINED_FUNCTION_107();
  OUTLINED_FUNCTION_121(v169);
  swift_getKeyPath();
  OUTLINED_FUNCTION_222();
  swift_release();
  uint64_t v170 = v236;
  uint64_t v171 = (uint64_t *)v237;
  OUTLINED_FUNCTION_74();
  OUTLINED_FUNCTION_2_0();
  swift_release();
  uint64_t v234 = v170;
  uint64_t v235 = v171;
  OUTLINED_FUNCTION_3_0();
  v6[29] = OUTLINED_FUNCTION_6_0();
  swift_endAccess();
  swift_getKeyPath();
  OUTLINED_FUNCTION_196();
  swift_release();
  LOBYTE(v170) = v239 & 1;
  OUTLINED_FUNCTION_2_0();
  LOBYTE(v236) = v170;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<Bool>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v172 = OUTLINED_FUNCTION_107();
  OUTLINED_FUNCTION_120(v172);
  swift_getKeyPath();
  OUTLINED_FUNCTION_196();
  swift_release();
  LOBYTE(v170) = v239 & 1;
  OUTLINED_FUNCTION_2_0();
  LOBYTE(v236) = v170;
  OUTLINED_FUNCTION_12();
  uint64_t v173 = OUTLINED_FUNCTION_107();
  OUTLINED_FUNCTION_119(v173);
  swift_getKeyPath();
  OUTLINED_FUNCTION_196();
  swift_release();
  LOBYTE(v170) = v239 & 1;
  OUTLINED_FUNCTION_2_0();
  LOBYTE(v236) = v170;
  OUTLINED_FUNCTION_12();
  uint64_t v174 = OUTLINED_FUNCTION_107();
  OUTLINED_FUNCTION_118(v174);
  swift_getKeyPath();
  OUTLINED_FUNCTION_196();
  swift_release();
  if (v239 == 3) {
    char v175 = 0;
  }
  else {
    char v175 = v239;
  }
  OUTLINED_FUNCTION_2_0();
  LOBYTE(v236) = v175;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<RequestPositionInSession>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v176 = OUTLINED_FUNCTION_107();
  OUTLINED_FUNCTION_117(v176);
  swift_getKeyPath();
  OUTLINED_FUNCTION_222();
  swift_release();
  uint64_t v177 = v236;
  uint64_t v178 = (uint64_t *)v237;
  OUTLINED_FUNCTION_2_0();
  swift_release();
  uint64_t v234 = v177;
  uint64_t v235 = v178;
  OUTLINED_FUNCTION_3_0();
  uint64_t v179 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_127(v179);
  OUTLINED_FUNCTION_2_0();
  *((void *)&v240 + 1) = &type metadata for DummyLocationProvider;
  uint64_t v241 = (uint64_t)&protocol witness table for DummyLocationProvider;
  uint64_t v180 = OUTLINED_FUNCTION_243();
  outlined init with copy of SiriLocationProvider(v180, v181);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<SiriLocationProvider>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v182 = OUTLINED_FUNCTION_107();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v239);
  v6[35] = v182;
  swift_endAccess();
  swift_getKeyPath();
  OUTLINED_FUNCTION_222();
  swift_release();
  uint64_t v183 = v236;
  uint64_t v184 = (uint64_t *)v237;
  OUTLINED_FUNCTION_2_0();
  swift_release();
  uint64_t v234 = v183;
  uint64_t v235 = v184;
  OUTLINED_FUNCTION_3_0();
  uint64_t v185 = OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_126(v185);
  swift_getKeyPath();
  uint64_t v186 = v223[0];
  Builder.subscript.getter();
  swift_release();
  uint64_t v187 = v227;
  if (__swift_getEnumTagSinglePayload(v186, 1, v227) == 1)
  {
    static ExecutionLocation.unknown.getter();
    outlined destroy of AudioSource?(v186, &demangling cache variable for type metadata for ExecutionLocation?);
  }
  else
  {
    (*(void (**)(void, uint64_t, uint64_t))(v151 + 32))(v223[1], v186, v187);
  }
  OUTLINED_FUNCTION_2_0();
  uint64_t v232 = *(void *)(v151 + 16);
  OUTLINED_FUNCTION_183();
  v188();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<ExecutionLocation>);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_69();
  uint64_t v189 = *(void (**)(void))(v151 + 8);
  OUTLINED_FUNCTION_203();
  v189();
  OUTLINED_FUNCTION_116();
  swift_getKeyPath();
  uint64_t v190 = v225;
  Builder.subscript.getter();
  swift_release();
  if (__swift_getEnumTagSinglePayload(v190, 1, v187) == 1)
  {
    static ExecutionLocation.unknown.getter();
    outlined destroy of AudioSource?(v190, &demangling cache variable for type metadata for ExecutionLocation?);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v151 + 32))(v226, v190, v187);
  }
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_183();
  v191();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_92();
  OUTLINED_FUNCTION_203();
  v189();
  OUTLINED_FUNCTION_115();
  swift_getKeyPath();
  Builder.subscript.getter();
  swift_release();
  CurrentRequest.rootRequestId.setter();
  swift_getKeyPath();
  Builder.subscript.getter();
  swift_release();
  CurrentRequest.sessionId.setter();
  swift_release();
  OUTLINED_FUNCTION_139();
  OUTLINED_FUNCTION_59();
}

uint64_t outlined destroy of AudioSource?(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_24();
  v3();
  return a1;
}

uint64_t outlined init with take of MultiUserState(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t CurrentRequest.deinit()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t CurrentRequest.__deallocating_deinit()
{
  CurrentRequest.deinit();
  return MEMORY[0x270FA0228](v0, 312, 7);
}

unint64_t lazy protocol witness table accessor for type RequestPositionInSession and conformance RequestPositionInSession()
{
  unint64_t result = lazy protocol witness table cache variable for type RequestPositionInSession and conformance RequestPositionInSession;
  if (!lazy protocol witness table cache variable for type RequestPositionInSession and conformance RequestPositionInSession)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type RequestPositionInSession and conformance RequestPositionInSession);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type RequestPositionInSession and conformance RequestPositionInSession;
  if (!lazy protocol witness table cache variable for type RequestPositionInSession and conformance RequestPositionInSession)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type RequestPositionInSession and conformance RequestPositionInSession);
  }
  return result;
}

uint64_t base witness table accessor for SiriEnvironmentProvider in CurrentRequest()
{
  return lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
}

uint64_t protocol witness for MockableEnvironmentProvider.mock<A>(override:run:) in conformance CurrentRequest()
{
  return MockableEnvironmentProvider.mock<A>(override:run:)();
}

uint64_t protocol witness for MockableEnvironmentProvider.install(_:) in conformance CurrentRequest(uint64_t a1)
{
  return MEMORY[0x270F72C58](a1, *v1);
}

uint64_t protocol witness for static MockableEnvironmentProvider.adjustMock(_:) in conformance CurrentRequest()
{
  return swift_retain();
}

uint64_t protocol witness for Buildable.init(_:) in conformance CurrentRequest@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CurrentRequest.__allocating_init(_:)();
  *a1 = result;
  return result;
}

uint64_t base witness table accessor for ObservableObject in CurrentRequest()
{
  return lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest);
}

uint64_t lazy protocol witness table accessor for type CurrentRequest and conformance CurrentRequest(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for CurrentRequest();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t protocol witness for static SiriEnvironmentProvider.defaultScope.getter in conformance CurrentRequest()
{
  return MEMORY[0x270F72960](v0);
}

uint64_t associated type witness table accessor for ObservableObject.ObjectWillChangePublisher : Publisher in CurrentRequest()
{
  return MEMORY[0x263EFDDD8];
}

uint64_t protocol witness for ObservableObject.objectWillChange.getter in conformance CurrentRequest@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t sub_21E69B730()
{
  OUTLINED_FUNCTION_54();
  uint64_t result = SiriEnvironment.currentRequest.getter();
  uint64_t *v0 = result;
  return result;
}

uint64_t sub_21E69B75C()
{
  return CurrentRequest.$refId.getter();
}

uint64_t sub_21E69B780(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<String?>.Publisher, (uint64_t (*)(uint64_t))CurrentRequest.$refId.setter);
}

uint64_t sub_21E69B7B4()
{
  return CurrentRequest.$aceId.getter();
}

uint64_t sub_21E69B7D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<String?>.Publisher, (uint64_t (*)(uint64_t))CurrentRequest.$aceId.setter);
}

uint64_t sub_21E69B80C()
{
  return CurrentRequest.$executionRequestId.getter();
}

uint64_t sub_21E69B830(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<String?>.Publisher, (uint64_t (*)(uint64_t))CurrentRequest.$executionRequestId.setter);
}

uint64_t sub_21E69B864()
{
  return CurrentRequest.$sessionHandoffContinuityID.getter();
}

uint64_t sub_21E69B888(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<String?>.Publisher, (uint64_t (*)(uint64_t))CurrentRequest.$sessionHandoffContinuityID.setter);
}

uint64_t sub_21E69B8BC()
{
  return CurrentRequest.$peerName.getter();
}

uint64_t sub_21E69B8E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<String?>.Publisher, (uint64_t (*)(uint64_t))CurrentRequest.$peerName.setter);
}

uint64_t sub_21E69B914()
{
  return CurrentRequest.$inputOrigin.getter();
}

uint64_t sub_21E69B938(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<InputOrigin>.Publisher, (uint64_t (*)(uint64_t))CurrentRequest.$inputOrigin.setter);
}

uint64_t sub_21E69B96C()
{
  return CurrentRequest.$interactionType.getter();
}

uint64_t sub_21E69B990(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<InteractionType>.Publisher, (uint64_t (*)(uint64_t))CurrentRequest.$interactionType.setter);
}

uint64_t sub_21E69B9C4()
{
  return CurrentRequest.$interactionId.getter();
}

uint64_t sub_21E69B9E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<String?>.Publisher, (uint64_t (*)(uint64_t))CurrentRequest.$interactionId.setter);
}

uint64_t sub_21E69BA1C()
{
  return CurrentRequest.$audioSource.getter();
}

uint64_t sub_21E69BA40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<AudioSource?>.Publisher, (uint64_t (*)(uint64_t))CurrentRequest.$audioSource.setter);
}

uint64_t sub_21E69BA74()
{
  return CurrentRequest.$audioDestination.getter();
}

uint64_t sub_21E69BA98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<AudioDestination?>.Publisher, (uint64_t (*)(uint64_t))CurrentRequest.$audioDestination.setter);
}

uint64_t sub_21E69BACC()
{
  return CurrentRequest.$responseMode.getter();
}

uint64_t sub_21E69BAF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<ResponseMode>.Publisher, (uint64_t (*)(uint64_t))CurrentRequest.$responseMode.setter);
}

uint64_t sub_21E69BB24()
{
  return CurrentRequest.$multiUserState.getter();
}

uint64_t sub_21E69BB48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<MultiUserState>.Publisher, (uint64_t (*)(uint64_t))CurrentRequest.$multiUserState.setter);
}

uint64_t sub_21E69BB7C()
{
  return CurrentRequest.$bargeInContext.getter();
}

uint64_t sub_21E69BBA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<BargeInContext?>.Publisher, (uint64_t (*)(uint64_t))CurrentRequest.$bargeInContext.setter);
}

uint64_t sub_21E69BBD4()
{
  return CurrentRequest.$sharedContextService.getter();
}

uint64_t sub_21E69BBF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<SharedContextService?>.Publisher, (uint64_t (*)(uint64_t))CurrentRequest.$sharedContextService.setter);
}

uint64_t sub_21E69BC2C()
{
  return CurrentRequest.$originatingHome.getter();
}

uint64_t sub_21E69BC50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<HomeInfo?>.Publisher, (uint64_t (*)(uint64_t))CurrentRequest.$originatingHome.setter);
}

uint64_t sub_21E69BC84()
{
  return CurrentRequest.$speechPackage.getter();
}

uint64_t sub_21E69BCA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<AFSpeechPackage?>.Publisher, (uint64_t (*)(uint64_t))CurrentRequest.$speechPackage.setter);
}

uint64_t sub_21E69BCDC()
{
  return CurrentRequest.$resultCandidateId.getter();
}

uint64_t sub_21E69BD00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<String?>.Publisher, (uint64_t (*)(uint64_t))CurrentRequest.$resultCandidateId.setter);
}

uint64_t sub_21E69BD34()
{
  return CurrentRequest.$asrOnDevice.getter();
}

uint64_t sub_21E69BD58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<Bool?>.Publisher, (uint64_t (*)(uint64_t))CurrentRequest.$asrOnDevice.setter);
}

uint64_t sub_21E69BD8C()
{
  return CurrentRequest.$currentDeviceAssistantId.getter();
}

uint64_t sub_21E69BDB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<String>.Publisher, (uint64_t (*)(uint64_t))CurrentRequest.$currentDeviceAssistantId.setter);
}

uint64_t sub_21E69BDE4()
{
  return CurrentRequest.$voiceTriggerEventInfo.getter();
}

uint64_t sub_21E69BE08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<[String : String]?>.Publisher, (uint64_t (*)(uint64_t))CurrentRequest.$voiceTriggerEventInfo.setter);
}

uint64_t sub_21E69BE3C()
{
  return CurrentRequest.$asrExecutionLocation.getter();
}

uint64_t sub_21E69BE60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<ExecutionLocation>.Publisher, (uint64_t (*)(uint64_t))CurrentRequest.$asrExecutionLocation.setter);
}

uint64_t sub_21E69BE94()
{
  return CurrentRequest.$nlExecutionLocation.getter();
}

uint64_t sub_21E69BEB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<ExecutionLocation>.Publisher, (uint64_t (*)(uint64_t))CurrentRequest.$nlExecutionLocation.setter);
}

uint64_t sub_21E69BEEC()
{
  return CurrentRequest.$companionName.getter();
}

uint64_t sub_21E69BF10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<String?>.Publisher, (uint64_t (*)(uint64_t))CurrentRequest.$companionName.setter);
}

uint64_t sub_21E69BF44()
{
  return CurrentRequest.$isRecognizeMyVoiceEnabled.getter();
}

uint64_t sub_21E69BF68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<Bool?>.Publisher, (uint64_t (*)(uint64_t))CurrentRequest.$isRecognizeMyVoiceEnabled.setter);
}

uint64_t sub_21E69BF9C()
{
  return CurrentRequest.$flowTaskMetadata.getter();
}

uint64_t sub_21E69BFC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<FlowTaskMetadata?>.Publisher, (uint64_t (*)(uint64_t))CurrentRequest.$flowTaskMetadata.setter);
}

uint64_t sub_21E69BFF4()
{
  return CurrentRequest.$voiceAudioSessionId.getter();
}

uint64_t sub_21E69C018(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<UInt32>.Publisher, (uint64_t (*)(uint64_t))CurrentRequest.$voiceAudioSessionId.setter);
}

uint64_t sub_21E69C04C()
{
  return CurrentRequest.$utterance.getter();
}

uint64_t sub_21E69C070(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<String?>.Publisher, (uint64_t (*)(uint64_t))CurrentRequest.$utterance.setter);
}

uint64_t sub_21E69C0A4()
{
  return CurrentRequest.$isSystemApertureEnabled.getter();
}

uint64_t sub_21E69C0C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<Bool>.Publisher, (uint64_t (*)(uint64_t))CurrentRequest.$isSystemApertureEnabled.setter);
}

uint64_t sub_21E69C0FC()
{
  return CurrentRequest.$isLiveActivitiesSupported.getter();
}

uint64_t sub_21E69C120(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<Bool>.Publisher, (uint64_t (*)(uint64_t))CurrentRequest.$isLiveActivitiesSupported.setter);
}

uint64_t sub_21E69C154()
{
  return CurrentRequest.$isInAmbient.getter();
}

uint64_t sub_21E69C178(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<Bool>.Publisher, (uint64_t (*)(uint64_t))CurrentRequest.$isInAmbient.setter);
}

uint64_t sub_21E69C1AC()
{
  return CurrentRequest.$positionInSession.getter();
}

uint64_t sub_21E69C1D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<RequestPositionInSession>.Publisher, (uint64_t (*)(uint64_t))CurrentRequest.$positionInSession.setter);
}

uint64_t sub_21E69C204()
{
  return CurrentRequest.$responseLanguageVariant.getter();
}

uint64_t sub_21E69C228(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<String?>.Publisher, (uint64_t (*)(uint64_t))CurrentRequest.$responseLanguageVariant.setter);
}

uint64_t sub_21E69C25C()
{
  return CurrentRequest.$locationProvider.getter();
}

uint64_t sub_21E69C280(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<SiriLocationProvider>.Publisher, (uint64_t (*)(uint64_t))CurrentRequest.$locationProvider.setter);
}

uint64_t sub_21E69C2B4()
{
  return CurrentRequest.$requestLanguageVariant.getter();
}

uint64_t sub_21E69C2D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<String?>.Publisher, (uint64_t (*)(uint64_t))CurrentRequest.$requestLanguageVariant.setter);
}

uint64_t sub_21E69C30C()
{
  return CurrentRequest.$rootRequestId.getter();
}

uint64_t sub_21E69C330(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<String?>.Publisher, (uint64_t (*)(uint64_t))CurrentRequest.$rootRequestId.setter);
}

uint64_t sub_21E69C364()
{
  return CurrentRequest.$sessionId.getter();
}

uint64_t sub_21E69C388(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for CurrentRequest.$refId : CurrentRequest(a1, a2, a3, a4, &demangling cache variable for type metadata for MockablePublished<String?>.Publisher, (uint64_t (*)(uint64_t))CurrentRequest.$sessionId.setter);
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for RequestPositionInSession(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v5 = v6 - 3;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for RequestPositionInSession(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x21E69C520);
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

uint64_t getEnumTag for RequestPositionInSession(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *destructiveInjectEnumTag for RequestPositionInSession(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for RequestPositionInSession()
{
  return &type metadata for RequestPositionInSession;
}

uint64_t method lookup function for CurrentRequest(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CurrentRequest);
}

uint64_t dispatch thunk of CurrentRequest.__allocating_init(storage:)()
{
  return (*(uint64_t (**)(void))(v0 + 376))();
}

uint64_t dispatch thunk of CurrentRequest.__allocating_init(refId:aceId:executionRequestId:sessionHandoffContinuityID:peerName:inputOrigin:interactionType:audioSource:audioDestination:responseMode:multiUserState:bargeInContext:sharedContextService:originatingHome:speechPackage:resultCandidateId:asrOnDevice:currentDeviceAssistantId:)()
{
  return (*(uint64_t (**)(void))(v0 + 384))();
}

uint64_t dispatch thunk of CurrentRequest.__allocating_init(refId:aceId:executionRequestId:sessionHandoffContinuityID:peerName:inputOrigin:interactionType:interactionId:audioSource:audioDestination:responseMode:multiUserState:bargeInContext:sharedContextService:originatingHome:speechPackage:resultCandidateId:asrOnDevice:currentDeviceAssistantId:)()
{
  return (*(uint64_t (**)(void))(v0 + 392))();
}

#error "21E69C698: call analysis failed (funcsize=15)"

#error "21E69C6D4: call analysis failed (funcsize=17)"

uint64_t dispatch thunk of CurrentRequest.__allocating_init(refId:aceId:executionRequestId:sessionHandoffContinuityID:peerName:inputOrigin:interactionType:interactionId:audioSource:audioDestination:responseMode:multiUserState:bargeInContext:sharedContextService:originatingHome:speechPackage:resultCandidateId:asrOnDevice:currentDeviceAssistantId:voiceTriggerEventInfo:companionName:isRecognizeMyVoiceEnabled:)()
{
  return (*(uint64_t (**)(void))(v0 + 416))();
}

uint64_t dispatch thunk of CurrentRequest.__allocating_init(refId:aceId:executionRequestId:sessionHandoffContinuityID:peerName:inputOrigin:interactionType:interactionId:audioSource:audioDestination:responseMode:multiUserState:bargeInContext:sharedContextService:originatingHome:speechPackage:resultCandidateId:asrOnDevice:currentDeviceAssistantId:voiceTriggerEventInfo:companionName:isRecognizeMyVoiceEnabled:flowTaskMetadata:)()
{
  return (*(uint64_t (**)(void))(v0 + 424))();
}

uint64_t dispatch thunk of CurrentRequest.__allocating_init(refId:aceId:executionRequestId:sessionHandoffContinuityID:peerName:inputOrigin:interactionType:interactionId:audioSource:audioDestination:responseMode:multiUserState:bargeInContext:sharedContextService:originatingHome:speechPackage:resultCandidateId:asrOnDevice:currentDeviceAssistantId:voiceTriggerEventInfo:companionName:isRecognizeMyVoiceEnabled:flowTaskMetadata:voiceAudioSessionId:isSystemApertureEnabled:isInAmbient:positionInSession:)()
{
  int v2 = *(uint64_t (**)(void))(v0 + 432);
  return v2();
}

uint64_t dispatch thunk of CurrentRequest.__allocating_init(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 440))();
}

uint64_t OUTLINED_FUNCTION_1_1(uint64_t a1)
{
  *(void *)(v1 + 8) = a1;
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return MockablePublished.init(wrappedValue:)();
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  return static MockablePublished.subscript.modify();
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  return MockablePublished.init(wrappedValue:)();
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  return v0;
}

void OUTLINED_FUNCTION_11_0()
{
  *(void *)(v1 - 256) = v0;
}

uint64_t OUTLINED_FUNCTION_12()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_14()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_15@<X0>(uint64_t a1@<X8>)
{
  return *(void *)(a1 - 256);
}

uint64_t OUTLINED_FUNCTION_16(uint64_t result)
{
  *(void *)(v1 + 32) = result;
  return result;
}

void *OUTLINED_FUNCTION_17(void *result)
{
  *uint64_t v1 = result;
  *uint64_t result = v2;
  return result;
}

void OUTLINED_FUNCTION_19(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  *(v2 - 43) = v2[14];
  *(v2 - 42) = v2[13];
  *(v2 - 41) = v2[12];
  *(v2 - 40) = v2[11];
  *(v2 - 39) = v2[10];
  *(v2 - 38) = v2[9];
  *(v2 - 37) = v2[8];
}

uint64_t OUTLINED_FUNCTION_21@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  return v2;
}

uint64_t OUTLINED_FUNCTION_23()
{
  return swift_bridgeObjectRetain();
}

void *OUTLINED_FUNCTION_29(uint64_t a1)
{
  *(void *)(v1 + 24) = a1;
  return malloc(v2);
}

uint64_t OUTLINED_FUNCTION_30(uint64_t result)
{
  *(void *)(v1 + 40) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_31(uint64_t result)
{
  *(void *)(v1 + 32) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_32(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

void *OUTLINED_FUNCTION_33()
{
  return malloc(0x28uLL);
}

void *OUTLINED_FUNCTION_34()
{
  return malloc(0x38uLL);
}

uint64_t OUTLINED_FUNCTION_35()
{
  *(void *)(v0 - 160) = 0;
  *(void *)(v0 - 152) = 0;
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_36()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_37(uint64_t a1)
{
  *uint64_t v1 = a1;
  return swift_endAccess();
}

uint64_t OUTLINED_FUNCTION_38(uint64_t a1)
{
  *uint64_t v1 = a1;
  return swift_endAccess();
}

uint64_t OUTLINED_FUNCTION_39()
{
  return swift_release();
}

void OUTLINED_FUNCTION_40(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
}

uint64_t OUTLINED_FUNCTION_41@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a2 - 256);
  return outlined init with copy of AudioSource?(a1, v4, v2);
}

uint64_t OUTLINED_FUNCTION_42()
{
  return outlined destroy of AudioSource?(v1, v0);
}

uint64_t OUTLINED_FUNCTION_43(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(v2 - 160);
  *(void *)(v1 + 280) = a1;
  return swift_endAccess();
}

uint64_t OUTLINED_FUNCTION_45()
{
  return MockablePublished.init(wrappedValue:)();
}

uint64_t OUTLINED_FUNCTION_46()
{
  return MockablePublished.init(wrappedValue:)();
}

void OUTLINED_FUNCTION_47(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  *(v2 - 43) = v2[14];
  *(v2 - 42) = v2[13];
  *(v2 - 41) = v2[12];
  *(v2 - 40) = v2[11];
  *(v2 - 39) = v2[10];
  *(v2 - 38) = v2[9];
  *(v2 - 37) = v2[8];
  *(v2 - 68) = v2[6];
}

uint64_t OUTLINED_FUNCTION_48()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_49()
{
  return *(void *)(v0 - 440);
}

double OUTLINED_FUNCTION_50@<D0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  *(void *)(v2 - 128) = 0;
  double result = 0.0;
  *(_OWORD *)(v2 - 160) = 0u;
  *(_OWORD *)(v2 - 144) = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_51()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_52()
{
  return outlined destroy of AudioSource?(v0, v1);
}

void OUTLINED_FUNCTION_53()
{
  CurrentRequest.rootRequestId.setter();
  CurrentRequest.sessionId.setter();
  uint64_t v1 = *(void **)(v0 - 392);
}

__n128 OUTLINED_FUNCTION_55()
{
  long long v1 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v0 - 160) = *(_OWORD *)(v0 + 32);
  *(_OWORD *)(v0 - 144) = v1;
  long long v2 = *(_OWORD *)(v0 + 48);
  *(_OWORD *)(v0 - 192) = *(_OWORD *)(v0 + 64);
  *(_OWORD *)(v0 - 176) = v2;
  long long v3 = *(_OWORD *)(v0 + 80);
  *(_OWORD *)(v0 - 224) = *(_OWORD *)(v0 + 96);
  *(_OWORD *)(v0 - 208) = v3;
  return *(__n128 *)(v0 + 168);
}

uint64_t OUTLINED_FUNCTION_56(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __swift_storeEnumTagSinglePayload(v4, 1, 1, a4);
  return v4;
}

uint64_t OUTLINED_FUNCTION_57(uint64_t a1)
{
  *long long v1 = a1;
  return swift_endAccess();
}

uint64_t OUTLINED_FUNCTION_58()
{
  return MockablePublished.init(wrappedValue:)();
}

uint64_t OUTLINED_FUNCTION_61(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __swift_storeEnumTagSinglePayload(v4, 1, 1, a4);
  return v4;
}

uint64_t OUTLINED_FUNCTION_62()
{
  return outlined destroy of AudioSource?(v1, v0);
}

uint64_t OUTLINED_FUNCTION_64()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_65@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  return type metadata accessor for InputOrigin();
}

uint64_t OUTLINED_FUNCTION_66@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  return type metadata accessor for InteractionType();
}

uint64_t OUTLINED_FUNCTION_67@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  return MEMORY[0x270F72A70](0);
}

void OUTLINED_FUNCTION_68(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  *(void *)(v2 - 160) = 0;
}

uint64_t OUTLINED_FUNCTION_69()
{
  return MockablePublished.init(wrappedValue:)();
}

uint64_t OUTLINED_FUNCTION_71()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_72()
{
  return static MockablePublished.subscript.getter();
}

uint64_t OUTLINED_FUNCTION_73()
{
  return MockablePublished.init(wrappedValue:)();
}

uint64_t OUTLINED_FUNCTION_74()
{
  return *(void *)(v0 - 304);
}

uint64_t OUTLINED_FUNCTION_75@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v2 - 136) = a1;
  *(void *)(v2 - 128) = v1;
  return outlined init with copy of SiriLocationProvider(v2 - 160, v2 - 248);
}

uint64_t OUTLINED_FUNCTION_76()
{
  return Builder.subscript.getter();
}

uint64_t OUTLINED_FUNCTION_77()
{
  return swift_allocObject();
}

void OUTLINED_FUNCTION_78(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  *(void *)(v2 - 288) = *(void *)(v2 + 40);
  *(void *)(v2 - 280) = *(void *)(v2 + 32);
}

uint64_t OUTLINED_FUNCTION_80(uint64_t a1, uint64_t a2)
{
  return outlined init with copy of AudioSource?(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_81()
{
  return *(void *)(v0 - 336);
}

uint64_t OUTLINED_FUNCTION_82()
{
  return *(void *)(v0 - 296);
}

uint64_t OUTLINED_FUNCTION_83()
{
  return outlined destroy of AudioSource?(v1 - 160, v0);
}

__n128 OUTLINED_FUNCTION_84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 - 104) = a7;
  *(void *)(v8 - 96) = a8;
  *(void *)(v8 - 112) = a6;
  long long v9 = *(_OWORD *)(v8 + 16);
  *(_OWORD *)(v8 - 144) = *(_OWORD *)(v8 + 32);
  *(_OWORD *)(v8 - 128) = v9;
  long long v10 = *(_OWORD *)(v8 + 48);
  __n128 result = *(__n128 *)(v8 + 64);
  *(__n128 *)(v8 - 176) = result;
  *(_OWORD *)(v8 - 160) = v10;
  return result;
}

void OUTLINED_FUNCTION_85()
{
  *(void *)(v1 - 272) = v0 + 8;
}

uint64_t OUTLINED_FUNCTION_86()
{
  uint64_t v2 = *(void *)(v0 - 320);
  return outlined init with copy of MultiUserState(v2, v0 - 160);
}

uint64_t OUTLINED_FUNCTION_87()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_88()
{
  return *(void *)(v0 - 448);
}

uint64_t OUTLINED_FUNCTION_89(uint64_t a1)
{
  __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
  return v1;
}

uint64_t OUTLINED_FUNCTION_90(uint64_t a1)
{
  __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
  return v1;
}

uint64_t OUTLINED_FUNCTION_91()
{
  return *(void *)(v0 - 288);
}

uint64_t OUTLINED_FUNCTION_92()
{
  return MockablePublished.init(wrappedValue:)();
}

uint64_t OUTLINED_FUNCTION_94()
{
  *uint64_t v1 = v0;
  return swift_endAccess();
}

uint64_t OUTLINED_FUNCTION_95()
{
  return *(void *)(v0 - 328);
}

uint64_t OUTLINED_FUNCTION_96@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a2 - 256);
  return outlined init with copy of AudioSource?(a1, v4, v2);
}

uint64_t OUTLINED_FUNCTION_97()
{
  return MockablePublished.init(wrappedValue:)();
}

uint64_t OUTLINED_FUNCTION_98()
{
  return outlined destroy of AudioSource?(v0, v1);
}

uint64_t OUTLINED_FUNCTION_99()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_102@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a2 - 256);
  return outlined init with copy of AudioSource?(a1, v4, v2);
}

uint64_t OUTLINED_FUNCTION_104()
{
  return outlined init with copy of AudioSource?(v1 - 160, v1 - 248, v0);
}

void OUTLINED_FUNCTION_105(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  *(v2 - 36) = v2[5];
  *(v2 - 35) = v2[4];
  *(v2 - 69) = v2[2];
}

void OUTLINED_FUNCTION_106(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  *(v2 - 36) = v2[5];
  *(v2 - 35) = v2[4];
  *(v2 - 67) = v2[2];
}

uint64_t OUTLINED_FUNCTION_107()
{
  return MockablePublished.init(wrappedValue:)();
}

uint64_t OUTLINED_FUNCTION_108()
{
  *uint64_t v1 = v0;
  return swift_endAccess();
}

uint64_t OUTLINED_FUNCTION_109(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __swift_storeEnumTagSinglePayload(v4, 1, 1, a4);
  return v4;
}

uint64_t OUTLINED_FUNCTION_110()
{
  return static MockablePublished.subscript.getter();
}

uint64_t OUTLINED_FUNCTION_111()
{
  *uint64_t v1 = v0;
  return swift_endAccess();
}

uint64_t OUTLINED_FUNCTION_112()
{
  return outlined destroy of MultiUserState(v0 - 160);
}

uint64_t OUTLINED_FUNCTION_113()
{
  return outlined destroy of AudioSource?(v1 - 160, v0);
}

uint64_t OUTLINED_FUNCTION_114()
{
  return outlined destroy of AudioSource?(v1, v0);
}

uint64_t OUTLINED_FUNCTION_115()
{
  *(void *)(v0 + 192) = v1;
  return swift_endAccess();
}

uint64_t OUTLINED_FUNCTION_116()
{
  *(void *)(v0 + 184) = v1;
  return swift_endAccess();
}

uint64_t OUTLINED_FUNCTION_117(uint64_t a1)
{
  *(void *)(v1 + 264) = a1;
  return swift_endAccess();
}

uint64_t OUTLINED_FUNCTION_118(uint64_t a1)
{
  *(void *)(v1 + 256) = a1;
  return swift_endAccess();
}

uint64_t OUTLINED_FUNCTION_119(uint64_t a1)
{
  *(void *)(v1 + 248) = a1;
  return swift_endAccess();
}

uint64_t OUTLINED_FUNCTION_120(uint64_t a1)
{
  *(void *)(v1 + 240) = a1;
  return swift_endAccess();
}

uint64_t OUTLINED_FUNCTION_121(uint64_t a1)
{
  *(void *)(v1 + 224) = a1;
  return swift_endAccess();
}

uint64_t OUTLINED_FUNCTION_122(uint64_t a1)
{
  *(void *)(v1 + 168) = a1;
  return swift_endAccess();
}

uint64_t OUTLINED_FUNCTION_123()
{
  *(void *)(v0 + 104) = v1;
  return swift_endAccess();
}

uint64_t OUTLINED_FUNCTION_124()
{
  *(void *)(v0 + 72) = v1;
  return swift_endAccess();
}

uint64_t OUTLINED_FUNCTION_125()
{
  *(void *)(v0 + 64) = v1;
  return swift_endAccess();
}

uint64_t OUTLINED_FUNCTION_126(uint64_t a1)
{
  *(void *)(v1 + 288) = a1;
  return swift_endAccess();
}

uint64_t OUTLINED_FUNCTION_127(uint64_t a1)
{
  *(void *)(v1 + 272) = a1;
  return swift_endAccess();
}

void OUTLINED_FUNCTION_128()
{
  *(void *)(v0 + 16) = 0;
  *(void *)(v1 - 160) = 0;
  *(void *)(v1 - 152) = 0;
}

uint64_t OUTLINED_FUNCTION_130(uint64_t result)
{
  *(void *)(v1 + 152) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_131(uint64_t result)
{
  *(void *)(v1 + 160) = result;
  return result;
}

void OUTLINED_FUNCTION_132()
{
  *(void *)(v0 + 88) = v1;
}

void OUTLINED_FUNCTION_133()
{
  *(void *)(v0 + 96) = v1;
}

uint64_t OUTLINED_FUNCTION_134()
{
  return static MockablePublished.subscript.setter();
}

uint64_t OUTLINED_FUNCTION_135()
{
  return outlined init with copy of AudioSource?(v1 - 160, v1 - 248, v0);
}

uint64_t OUTLINED_FUNCTION_136@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  return type metadata accessor for AudioDestination();
}

uint64_t OUTLINED_FUNCTION_137@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  return MEMORY[0x270F72AE8](0);
}

uint64_t OUTLINED_FUNCTION_138()
{
  return swift_getKeyPath();
}

uint64_t OUTLINED_FUNCTION_139()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_140()
{
  *(void *)(v0 + 112) = v1;
  return swift_endAccess();
}

void OUTLINED_FUNCTION_141(uint64_t a1@<X8>)
{
  *(void *)(v1 - 496) = a1;
}

uint64_t OUTLINED_FUNCTION_142(uint64_t result)
{
  *(void *)(v1 + 56) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_143(uint64_t result)
{
  *(void *)(v1 + 232) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_144(uint64_t result)
{
  *(void *)(v1 + 48) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_145(uint64_t result)
{
  *(void *)(v1 + 40) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_146(uint64_t result)
{
  *(void *)(v1 + 208) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_147()
{
  return outlined init with copy of MultiUserState(v0 - 160, v0 - 248);
}

void OUTLINED_FUNCTION_149()
{
  *(void *)(v0 + 16) = 0;
  *(void *)(v1 - 160) = 0;
  *(void *)(v1 - 152) = 0;
}

uint64_t OUTLINED_FUNCTION_150@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  return type metadata accessor for FlowTaskMetadata();
}

uint64_t OUTLINED_FUNCTION_151@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  return type metadata accessor for HomeInfo();
}

uint64_t OUTLINED_FUNCTION_152(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 - 408);
  __swift_storeEnumTagSinglePayload(v2, 1, 1, a1);
  return v2;
}

uint64_t OUTLINED_FUNCTION_153(uint64_t a1)
{
  *(void *)(v1 - 584) = a1;
  uint64_t v2 = *(void *)(v1 - 384);
  __swift_storeEnumTagSinglePayload(v2, 1, 1, a1);
  return v2;
}

uint64_t OUTLINED_FUNCTION_154()
{
  return *(void *)(v0 - 344);
}

uint64_t OUTLINED_FUNCTION_157()
{
  return outlined destroy of AudioSource?(v0, v1);
}

uint64_t OUTLINED_FUNCTION_158()
{
  return outlined destroy of AudioSource?(v1 - 160, v0);
}

uint64_t OUTLINED_FUNCTION_159()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_160()
{
  return outlined destroy of AudioSource?(v0, v1);
}

uint64_t OUTLINED_FUNCTION_162@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a2 - 256);
  return outlined init with copy of AudioSource?(a1, v4, v2);
}

uint64_t OUTLINED_FUNCTION_163()
{
  uint64_t v2 = *(void *)(v0 - 320);
  return outlined destroy of MultiUserState(v2);
}

void OUTLINED_FUNCTION_164(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(a1 - 256);
  *(void *)(v2 - 248) = v1;
  *(void *)(v2 - 240) = v3;
}

void OUTLINED_FUNCTION_165()
{
  CurrentRequest.rootRequestId.setter();
  CurrentRequest.sessionId.setter();
  uint64_t v1 = *(void **)(v0 - 400);
}

uint64_t OUTLINED_FUNCTION_166(uint64_t a1)
{
  *(void *)(v1 - 392) = a1;
  return swift_release();
}

void OUTLINED_FUNCTION_167(uint64_t a1@<X8>)
{
  *(void *)(v1 - 480) = a1;
}

void OUTLINED_FUNCTION_170(uint64_t a1@<X8>)
{
  *(void *)(v1 - 488) = a1;
}

uint64_t OUTLINED_FUNCTION_171(uint64_t result)
{
  *(void *)(v1 + 144) = result;
  return result;
}

void OUTLINED_FUNCTION_172()
{
  *(void *)(v0 + 120) = v1;
}

uint64_t OUTLINED_FUNCTION_173(uint64_t result)
{
  *(void *)(v1 + 80) = result;
  return result;
}

__n128 OUTLINED_FUNCTION_175(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, long long a16)
{
  return (__n128)a16;
}

void OUTLINED_FUNCTION_176(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  *(unsigned char *)(v2 - 160) = 2;
}

void OUTLINED_FUNCTION_177(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
}

uint64_t OUTLINED_FUNCTION_178@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  return type metadata accessor for AudioSource();
}

uint64_t OUTLINED_FUNCTION_179()
{
  *uint64_t v1 = v0;
  return swift_endAccess();
}

void OUTLINED_FUNCTION_180(int a1@<W8>)
{
  *(_DWORD *)(v1 - 256) = a1;
}

void OUTLINED_FUNCTION_181(uint64_t a1@<X8>)
{
  *(void *)(v1 - 464) = a1;
}

void OUTLINED_FUNCTION_182(uint64_t a1@<X8>)
{
  *(void *)(v1 - 456) = a1;
}

uint64_t OUTLINED_FUNCTION_184()
{
  return static MockablePublished.subscript.setter();
}

uint64_t OUTLINED_FUNCTION_185(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __swift_storeEnumTagSinglePayload(v4, 1, 1, a4);
  return v4;
}

uint64_t OUTLINED_FUNCTION_186()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_187@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, a3, *(void *)(a4 - 256));
}

uint64_t OUTLINED_FUNCTION_191(uint64_t result)
{
  *(void *)(v1 + 176) = result;
  return result;
}

void OUTLINED_FUNCTION_192()
{
  *(void *)(v0 + 128) = v1;
}

uint64_t OUTLINED_FUNCTION_193(uint64_t result)
{
  *(void *)(v1 + 200) = result;
  return result;
}

void OUTLINED_FUNCTION_194()
{
  *(void *)(v0 + 136) = v1;
}

uint64_t OUTLINED_FUNCTION_196()
{
  return Builder.subscript.getter();
}

uint64_t OUTLINED_FUNCTION_197(uint64_t a1)
{
  *uint64_t v1 = a1;
  return swift_endAccess();
}

void OUTLINED_FUNCTION_198(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
}

uint64_t OUTLINED_FUNCTION_199@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  return type metadata accessor for ExecutionLocation();
}

uint64_t OUTLINED_FUNCTION_200()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_201(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 - 408);
  __swift_storeEnumTagSinglePayload(v2, 1, 1, a1);
  return v2;
}

uint64_t OUTLINED_FUNCTION_202(uint64_t a1)
{
  __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
  uint64_t result = v1;
  *(void *)(v2 - 752) = v1;
  return result;
}

uint64_t OUTLINED_FUNCTION_204()
{
  return outlined destroy of AudioSource?(v0, v1);
}

void OUTLINED_FUNCTION_205()
{
  *(void *)(v1 - 264) = v0 + 8;
}

uint64_t OUTLINED_FUNCTION_206()
{
  return outlined destroy of AudioSource?(v1, v0);
}

uint64_t OUTLINED_FUNCTION_207()
{
  return outlined destroy of AudioSource?(v1, v0);
}

uint64_t OUTLINED_FUNCTION_208()
{
  return outlined destroy of AudioSource?(v1, v0);
}

void OUTLINED_FUNCTION_209()
{
  *(void *)(v1 - 264) = v0 + 8;
}

uint64_t OUTLINED_FUNCTION_211()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_212()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_213@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a2 - 256);
  return outlined init with copy of AudioSource?(a1, v4, v2);
}

uint64_t OUTLINED_FUNCTION_215(uint64_t result)
{
  *(void *)(v1 + 272) = result;
  *(void *)(v2 - 560) = v1 + 288;
  *(void *)(v2 - 160) = 0;
  *(void *)(v2 - 152) = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_216(uint64_t result)
{
  *(void *)(v1 + 272) = result;
  *(void *)(v2 - 544) = v1 + 288;
  *(void *)(v2 - 160) = 0;
  *(void *)(v2 - 152) = 0;
  return result;
}

void OUTLINED_FUNCTION_219(uint64_t a1@<X8>)
{
  *(void *)(v1 - 472) = a1;
}

uint64_t OUTLINED_FUNCTION_220()
{
  return static ExecutionLocation.unknown.getter();
}

uint64_t OUTLINED_FUNCTION_222()
{
  return Builder.subscript.getter();
}

uint64_t OUTLINED_FUNCTION_223()
{
  return static MockablePublished.subscript.setter();
}

uint64_t OUTLINED_FUNCTION_224()
{
  return outlined init with copy of AudioSource?(v1 - 160, v1 - 248, v0);
}

uint64_t OUTLINED_FUNCTION_225()
{
  return MockablePublished.init(wrappedValue:)();
}

void OUTLINED_FUNCTION_226()
{
  *(void *)(v1 - 256) = v0 + 8;
}

id OUTLINED_FUNCTION_227()
{
  uint64_t v2 = *(void **)(v0 - 496);
  return v2;
}

uint64_t OUTLINED_FUNCTION_228()
{
  *uint64_t v1 = v0;
  return swift_endAccess();
}

void OUTLINED_FUNCTION_229()
{
  *(void *)(v0 - 352) = *(void *)(v0 + 200);
}

uint64_t OUTLINED_FUNCTION_230(uint64_t a1)
{
  *uint64_t v1 = a1;
  return swift_endAccess();
}

void OUTLINED_FUNCTION_231()
{
  CurrentRequest.rootRequestId.setter();
  CurrentRequest.sessionId.setter();
}

uint64_t OUTLINED_FUNCTION_233()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_234()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_236(uint64_t result)
{
  *(void *)(v1 + 272) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_237()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_238()
{
  return *(void *)(v0 - 280);
}

uint64_t OUTLINED_FUNCTION_239()
{
  return swift_getKeyPath();
}

uint64_t OUTLINED_FUNCTION_240()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_241()
{
  return swift_getKeyPath();
}

uint64_t OUTLINED_FUNCTION_242()
{
  return static MockablePublished.subscript.getter();
}

uint64_t OUTLINED_FUNCTION_243()
{
  return v0 - 160;
}

uint64_t OUTLINED_FUNCTION_244()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_245()
{
  return *(void *)(v0 - 288);
}

uint64_t specialized == infix<A>(_:_:)(char a1, char a2)
{
  unint64_t v3 = 0xD000000000000019;
  unint64_t v4 = 0x800000021E6AE600;
  switch(a1)
  {
    case 1:
      unint64_t v3 = 0x6D726F6674616C50;
      unint64_t v4 = 0xE90000000000005FLL;
      break;
    case 2:
      unint64_t v4 = 0xE800000000000000;
      unint64_t v3 = 0x776F6C6C41435544;
      break;
    case 3:
      unint64_t v3 = 0x776F6C6C41435544;
      goto LABEL_10;
    case 4:
      unint64_t v3 = 0xD000000000000016;
      uint64_t v5 = "rm_";
      goto LABEL_12;
    case 5:
      unint64_t v4 = 0x800000021E6AE660;
      unint64_t v3 = 0xD000000000000013;
      break;
    case 6:
      unint64_t v4 = 0xE700000000000000;
      unint64_t v3 = 0x6C6C41796E6544;
      break;
    case 7:
      unint64_t v3 = 0x656C74746F726854;
      unint64_t v4 = 0xEF73726F72724564;
      break;
    case 8:
      unint64_t v3 = 0x6E6970736C696154;
LABEL_10:
      unint64_t v4 = 0xEC0000007473694CLL;
      break;
    case 9:
      unint64_t v3 = 0xD00000000000001FLL;
      uint64_t v5 = "ttledErrors";
LABEL_12:
      unint64_t v4 = (unint64_t)v5 | 0x8000000000000000;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xD000000000000019;
  unint64_t v7 = 0x800000021E6AE600;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0x6D726F6674616C50;
      unint64_t v7 = 0xE90000000000005FLL;
      break;
    case 2:
      unint64_t v7 = 0xE800000000000000;
      unint64_t v6 = 0x776F6C6C41435544;
      break;
    case 3:
      unint64_t v6 = 0x776F6C6C41435544;
      goto LABEL_22;
    case 4:
      unint64_t v6 = 0xD000000000000016;
      uint64_t v8 = "rm_";
      goto LABEL_24;
    case 5:
      unint64_t v7 = 0x800000021E6AE660;
      unint64_t v6 = 0xD000000000000013;
      break;
    case 6:
      unint64_t v7 = 0xE700000000000000;
      unint64_t v6 = 0x6C6C41796E6544;
      break;
    case 7:
      unint64_t v6 = 0x656C74746F726854;
      unint64_t v7 = 0xEF73726F72724564;
      break;
    case 8:
      unint64_t v6 = 0x6E6970736C696154;
LABEL_22:
      unint64_t v7 = 0xEC0000007473694CLL;
      break;
    case 9:
      unint64_t v6 = 0xD00000000000001FLL;
      uint64_t v8 = "ttledErrors";
LABEL_24:
      unint64_t v7 = (unint64_t)v8 | 0x8000000000000000;
      break;
    default:
      break;
  }
  if (v3 == v6 && v4 == v7) {
    char v10 = 1;
  }
  else {
    char v10 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10 & 1;
}

BOOL specialized == infix<A>(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

BOOL specialized == infix<A>(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

Swift::Int specialized RawRepresentable<>.hashValue.getter(unsigned __int8 a1)
{
  return Hasher._finalize()();
}

Swift::Int specialized RawRepresentable<>.hashValue.getter()
{
  return Hasher._finalize()();
}

uint64_t specialized RawRepresentable<>.hash(into:)()
{
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

void specialized RawRepresentable<>.hash(into:)(uint64_t a1, unsigned __int8 a2)
{
}

Swift::Int specialized RawRepresentable<>._rawHashValue(seed:)(uint64_t a1, unsigned __int8 a2)
{
  return Hasher._finalize()();
}

Swift::Int specialized RawRepresentable<>._rawHashValue(seed:)()
{
  return Hasher._finalize()();
}

uint64_t Policy.supportedOperatingSystems.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t Policy.supportedOperatingSystems.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v1 = a1;
  return result;
}

uint64_t (*Policy.supportedOperatingSystems.modify())()
{
  return FlowTaskMetadata.id.modify;
}

uint64_t Policy.ducAllowList.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t Policy.ducAllowList.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 8) = a1;
  return result;
}

uint64_t (*Policy.ducAllowList.modify())()
{
  return FlowTaskMetadata.id.modify;
}

uint64_t Policy.errorSignatureDenyList.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t Policy.errorSignatureDenyList.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 16) = a1;
  return result;
}

uint64_t (*Policy.errorSignatureDenyList.modify())()
{
  return FlowTaskMetadata.id.modify;
}

uint64_t Policy.denyAllErrorSignatures.getter()
{
  return *(unsigned __int8 *)(v0 + 24);
}

uint64_t Policy.denyAllErrorSignatures.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 24) = result;
  return result;
}

uint64_t (*Policy.denyAllErrorSignatures.modify())()
{
  return FlowTaskMetadata.id.modify;
}

uint64_t Policy.tailspinList.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t Policy.tailspinList.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 32) = a1;
  return result;
}

uint64_t (*Policy.tailspinList.modify())()
{
  return FlowTaskMetadata.id.modify;
}

uint64_t Policy.errorSignatureAllowListOverride.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t Policy.errorSignatureAllowListOverride.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 40) = a1;
  return result;
}

uint64_t (*Policy.errorSignatureAllowListOverride.modify())()
{
  return FlowTaskMetadata.id.modify;
}

void __swiftcall Policy.init(supportedOperatingSystems:ducAllowList:errorSignatureDenyList:denyAllErrorSignatures:tailspinList:errorSignatureAllowListOverride:)(SiriFlowEnvironment::Policy *__return_ptr retstr, Swift::OpaquePointer supportedOperatingSystems, Swift::OpaquePointer ducAllowList, Swift::OpaquePointer errorSignatureDenyList, Swift::Bool denyAllErrorSignatures, Swift::OpaquePointer tailspinList, Swift::OpaquePointer errorSignatureAllowListOverride)
{
  retstr->supportedOperatingSystems = supportedOperatingSystems;
  retstr->ducAllowList = ducAllowList;
  retstr->errorSignatureDenyList = errorSignatureDenyList;
  retstr->denyAllErrorSignatures = denyAllErrorSignatures;
  retstr->tailspinList = tailspinList;
  retstr->errorSignatureAllowListOverride = errorSignatureAllowListOverride;
}

SiriFlowEnvironment::TapToRadarWithPolicyManager::DefaultPolicyKeys_optional __swiftcall TapToRadarWithPolicyManager.DefaultPolicyKeys.init(rawValue:)(Swift::String rawValue)
{
  object = rawValue._object;
  v3._countAndFlagsBits = rawValue._countAndFlagsBits;
  unint64_t v4 = v1;
  v3._object = object;
  unint64_t v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of TapToRadarWithPolicyManager.DefaultPolicyKeys.init(rawValue:), v3);
  result.value = swift_bridgeObjectRelease();
  char v7 = 10;
  if (v5 < 0xA) {
    char v7 = v5;
  }
  *unint64_t v4 = v7;
  return result;
}

uint64_t TapToRadarWithPolicyManager.DefaultPolicyKeys.rawValue.getter()
{
  uint64_t result = 0xD000000000000019;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x6D726F6674616C50;
      break;
    case 2:
      uint64_t result = OUTLINED_FUNCTION_15_0();
      break;
    case 3:
      uint64_t result = OUTLINED_FUNCTION_15_0();
      break;
    case 4:
      uint64_t result = 0xD000000000000016;
      break;
    case 5:
      uint64_t result = 0xD000000000000013;
      break;
    case 6:
      uint64_t result = 0x6C6C41796E6544;
      break;
    case 7:
      uint64_t result = 0x656C74746F726854;
      break;
    case 8:
      uint64_t result = 0x6E6970736C696154;
      break;
    case 9:
      uint64_t result = 0xD00000000000001FLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance TapToRadarWithPolicyManager.DefaultPolicyKeys(char *a1, char *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance TapToRadarWithPolicyManager.DefaultPolicyKeys()
{
  return specialized RawRepresentable<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance TapToRadarWithPolicyManager.DefaultPolicyKeys()
{
  return specialized RawRepresentable<>.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance TapToRadarWithPolicyManager.DefaultPolicyKeys()
{
  return specialized RawRepresentable<>._rawHashValue(seed:)();
}

SiriFlowEnvironment::TapToRadarWithPolicyManager::DefaultPolicyKeys_optional protocol witness for RawRepresentable.init(rawValue:) in conformance TapToRadarWithPolicyManager.DefaultPolicyKeys(Swift::String *a1)
{
  return TapToRadarWithPolicyManager.DefaultPolicyKeys.init(rawValue:)(*a1);
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance TapToRadarWithPolicyManager.DefaultPolicyKeys@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = TapToRadarWithPolicyManager.DefaultPolicyKeys.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t TapToRadarWithPolicyManager.__allocating_init(data:)(uint64_t a1, unint64_t a2)
{
  return TapToRadarWithPolicyManager.init(data:)(a1, a2);
}

uint64_t TapToRadarWithPolicyManager.init(data:)(uint64_t a1, unint64_t a2)
{
  OUTLINED_FUNCTION_6_1();
  swift_retain();
  static TapToRadarWithPolicyManager.policy(fromPlistData:)();
  *(_OWORD *)(v2 + 136) = v7;
  *(_OWORD *)(v2 + 152) = v8;
  *(_OWORD *)(v2 + 168) = v9;
  swift_release();
  uint64_t v5 = TapToRadarManager.init()();
  outlined consume of Data._Representation(a1, a2);
  return v5;
}

void static TapToRadarWithPolicyManager.policy(fromPlistData:)()
{
  OUTLINED_FUNCTION_60();
  uint64_t v1 = v0;
  uint64_t v89 = *MEMORY[0x263EF8340];
  uint64_t v2 = type metadata accessor for Logger();
  OUTLINED_FUNCTION_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  OUTLINED_FUNCTION_14_0();
  uint64_t v8 = v6 - v7;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v81 - v10;
  uint64_t v12 = self;
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  *(void *)&long long v87 = 0;
  id v14 = objc_msgSend(v12, sel_propertyListWithData_options_format_error_, isa, 0, 0, &v87);

  if (v14)
  {
    id v15 = (id)v87;
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Swift.AnyObject]);
    if (swift_dynamicCast())
    {
      uint64_t v16 = (void *)v86[0];
      uint64_t v17 = specialized Dictionary.subscript.getter(0xD000000000000019, 0x800000021E6AE600, v86[0]);
      uint64_t v18 = MEMORY[0x263F8EE78];
      uint64_t v83 = v1;
      if (v17)
      {
        *(void *)&long long v87 = v17;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
        if (swift_dynamicCast()) {
          uint64_t v18 = v86[0];
        }
        else {
          uint64_t v18 = MEMORY[0x263F8EE78];
        }
      }
      uint64_t v82 = (uint8_t *)v18;
      v24._uint64_t countAndFlagsBits = static TapToRadarWithPolicyManager.translateDeviceToPlatform()();
      uint64_t countAndFlagsBits = v24._countAndFlagsBits;
      object = v24._object;
      *(void *)&long long v87 = 0x6D726F6674616C50;
      *((void *)&v87 + 1) = 0xE90000000000005FLL;
      String.append(_:)(v24);
      uint64_t v27 = (void *)specialized Dictionary.subscript.getter(v87, *((uint64_t *)&v87 + 1), (uint64_t)v16);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (!v27)
      {
        swift_bridgeObjectRelease();
        static Logger.logger.getter();
        swift_bridgeObjectRetain();
        uint64_t v31 = Logger.logObject.getter();
        os_log_type_t v32 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v31, v32))
        {
          uint64_t v33 = (uint8_t *)OUTLINED_FUNCTION_16_0();
          *(void *)&long long v87 = OUTLINED_FUNCTION_23_0();
          *(_DWORD *)uint64_t v33 = 136315138;
          uint64_t v82 = v33 + 4;
          swift_bridgeObjectRetain();
          v86[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(countAndFlagsBits, (unint64_t)object, (uint64_t *)&v87);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_21E680000, v31, v32, "TapToRadarWithPolicyManager#policy unable to find a policy for the platform '%s'", v33, 0xCu);
          swift_arrayDestroy();
          OUTLINED_FUNCTION_2_1();
          OUTLINED_FUNCTION_2_1();
        }
        else
        {

          OUTLINED_FUNCTION_19_0();
        }
        (*(void (**)(char *, uint64_t))(v4 + 8))(v11, v2);
        uint64_t v36 = v83;
        v83[1] = 0u;
        v36[2] = 0u;
        *uint64_t v36 = 0u;
        goto LABEL_90;
      }
      swift_bridgeObjectRelease();
      if (objc_msgSend(v27, sel_respondsToSelector_, sel_objectForKeyedSubscript_))
      {
        uint64_t v28 = OUTLINED_FUNCTION_15_0();
        uint64_t v29 = MEMORY[0x223C2E5C0](v28, 0xEC0000007473694CLL);
        id v30 = OUTLINED_FUNCTION_3_1(v29);

        if (v30)
        {
          _bridgeAnyObjectToAny(_:)();
          swift_unknownObjectRelease();
        }
        else
        {
          long long v87 = 0u;
          long long v88 = 0u;
        }
        uint64_t v34 = outlined init with take of Any??((uint64_t)&v87, (uint64_t)v85, &demangling cache variable for type metadata for Any?);
      }
      else
      {
        OUTLINED_FUNCTION_11_1();
      }
      OUTLINED_FUNCTION_27(v34, v35, &demangling cache variable for type metadata for Any??);
      OUTLINED_FUNCTION_26_0();
      if (v39)
      {
        uint64_t v40 = &demangling cache variable for type metadata for Any??;
        uint64_t v41 = v86;
      }
      else
      {
        OUTLINED_FUNCTION_25_0(v37, v38, &demangling cache variable for type metadata for Any?);
        if (*((void *)&v88 + 1))
        {
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [[String : String]]);
          if (OUTLINED_FUNCTION_9_1()) {
            uint64_t v42 = v84[0];
          }
          else {
            uint64_t v42 = 0;
          }
LABEL_31:
          if (OUTLINED_FUNCTION_18())
          {
            uint64_t v43 = MEMORY[0x223C2E5C0](0xD000000000000016, 0x800000021E6AE640);
            id v44 = OUTLINED_FUNCTION_3_1(v43);

            if (v44)
            {
              _bridgeAnyObjectToAny(_:)();
              swift_unknownObjectRelease();
            }
            else
            {
              memset(v84, 0, sizeof(v84));
            }
            uint64_t v45 = outlined init with take of Any??((uint64_t)v84, (uint64_t)v85, &demangling cache variable for type metadata for Any?);
          }
          else
          {
            OUTLINED_FUNCTION_11_1();
          }
          OUTLINED_FUNCTION_27(v45, v46, &demangling cache variable for type metadata for Any??);
          OUTLINED_FUNCTION_26_0();
          if (v39)
          {
            uint64_t v49 = &demangling cache variable for type metadata for Any??;
            uint64_t v50 = v86;
          }
          else
          {
            OUTLINED_FUNCTION_25_0(v47, v48, &demangling cache variable for type metadata for Any?);
            if (*((void *)&v88 + 1))
            {
              if (swift_dynamicCast())
              {
                uint64_t v51 = v84[0];
                uint64_t v52 = OUTLINED_FUNCTION_17_0();
                uint64_t v54 = specialized Dictionary.subscript.getter(v52, v53, v51);
                BOOL v55 = v54 && (*(void *)&v87 = v54, (swift_dynamicCast() & 1) != 0) && v86[0] != 0;
                goto LABEL_48;
              }
LABEL_47:
              BOOL v55 = 0;
              uint64_t v51 = 0;
LABEL_48:
              if (OUTLINED_FUNCTION_18())
              {
                uint64_t v56 = MEMORY[0x223C2E5C0](0xD00000000000001FLL, 0x800000021E6AE6A0);
                id v57 = OUTLINED_FUNCTION_3_1(v56);

                if (v57)
                {
                  _bridgeAnyObjectToAny(_:)();
                  swift_unknownObjectRelease();
                }
                else
                {
                  long long v87 = 0u;
                  long long v88 = 0u;
                }
                uint64_t v58 = outlined init with take of Any??((uint64_t)&v87, (uint64_t)v85, &demangling cache variable for type metadata for Any?);
              }
              else
              {
                OUTLINED_FUNCTION_11_1();
              }
              OUTLINED_FUNCTION_27(v58, v59, &demangling cache variable for type metadata for Any??);
              OUTLINED_FUNCTION_26_0();
              if (v39)
              {
                uint64_t v62 = &demangling cache variable for type metadata for Any??;
                uint64_t v63 = v86;
              }
              else
              {
                OUTLINED_FUNCTION_25_0(v60, v61, &demangling cache variable for type metadata for Any?);
                if (*((void *)&v88 + 1))
                {
                  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
                  if (OUTLINED_FUNCTION_9_1()) {
                    uint64_t v64 = v84[0];
                  }
                  else {
                    uint64_t v64 = 0;
                  }
LABEL_63:
                  if (OUTLINED_FUNCTION_18())
                  {
                    uint64_t v65 = MEMORY[0x223C2E5C0](0x6E6970736C696154, 0xEC0000007473694CLL);
                    id v66 = OUTLINED_FUNCTION_3_1(v65);

                    if (v66)
                    {
                      _bridgeAnyObjectToAny(_:)();
                      swift_unknownObjectRelease();
                    }
                    else
                    {
                      long long v87 = 0u;
                      long long v88 = 0u;
                    }
                    uint64_t v67 = outlined init with take of Any??((uint64_t)&v87, (uint64_t)v85, &demangling cache variable for type metadata for Any?);
                  }
                  else
                  {
                    OUTLINED_FUNCTION_11_1();
                  }
                  OUTLINED_FUNCTION_27(v67, v68, &demangling cache variable for type metadata for Any??);
                  OUTLINED_FUNCTION_26_0();
                  if (v39)
                  {
                    uint64_t v71 = &demangling cache variable for type metadata for Any??;
                    uint64_t v72 = v86;
                  }
                  else
                  {
                    OUTLINED_FUNCTION_25_0(v69, v70, &demangling cache variable for type metadata for Any?);
                    if (*((void *)&v88 + 1))
                    {
                      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
                      if (OUTLINED_FUNCTION_9_1()) {
                        uint64_t v73 = (void *)v84[0];
                      }
                      else {
                        uint64_t v73 = 0;
                      }
LABEL_78:
                      swift_bridgeObjectRetain();
                      uint64_t v74 = static TapToRadarWithPolicyManager.enforceTailspinAndErrorAllowed(tailspins:denyList:denyAll:errorSignatureAllowListOverride:)(v73, v51, v55, v64);
                      swift_bridgeObjectRelease();
                      swift_bridgeObjectRelease();
                      swift_unknownObjectRelease();
                      uint64_t v75 = (void *)MEMORY[0x263F8EE78];
                      if (v64) {
                        uint64_t v76 = v64;
                      }
                      else {
                        uint64_t v76 = MEMORY[0x263F8EE78];
                      }
                      uint64_t v77 = MEMORY[0x263F8EE80];
                      if (v42) {
                        uint64_t v78 = v42;
                      }
                      else {
                        uint64_t v78 = MEMORY[0x263F8EE78];
                      }
                      if (v51) {
                        uint64_t v77 = v51;
                      }
                      uint64_t v79 = v83;
                      *(void *)uint64_t v83 = v82;
                      v79[1] = v78;
                      v79[2] = v77;
                      v79[3] = v55;
                      if (v74) {
                        uint64_t v80 = v74;
                      }
                      else {
                        uint64_t v80 = v75;
                      }
                      v79[4] = v80;
                      v79[5] = v76;
                      goto LABEL_90;
                    }
                    uint64_t v71 = &demangling cache variable for type metadata for Any?;
                    uint64_t v72 = (uint64_t *)&v87;
                  }
                  outlined destroy of Any??((uint64_t)v72, v71);
                  uint64_t v73 = 0;
                  goto LABEL_78;
                }
                uint64_t v62 = &demangling cache variable for type metadata for Any?;
                uint64_t v63 = (uint64_t *)&v87;
              }
              outlined destroy of Any??((uint64_t)v63, v62);
              uint64_t v64 = 0;
              goto LABEL_63;
            }
            uint64_t v49 = &demangling cache variable for type metadata for Any?;
            uint64_t v50 = (uint64_t *)&v87;
          }
          outlined destroy of Any??((uint64_t)v50, v49);
          goto LABEL_47;
        }
        uint64_t v40 = &demangling cache variable for type metadata for Any?;
        uint64_t v41 = (uint64_t *)&v87;
      }
      outlined destroy of Any??((uint64_t)v41, v40);
      uint64_t v42 = 0;
      goto LABEL_31;
    }
  }
  else
  {
    id v19 = (id)v87;
    uint64_t v20 = (void *)_convertNSErrorToError(_:)();

    swift_willThrow();
  }
  static Logger.logger.getter();
  uint64_t v21 = Logger.logObject.getter();
  os_log_type_t v22 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = (uint8_t *)OUTLINED_FUNCTION_8_1();
    *(_WORD *)uint64_t v23 = 0;
    _os_log_impl(&dword_21E680000, v21, v22, "TapToRadarWithPolicyManager#policy unable to extract policy", v23, 2u);
    OUTLINED_FUNCTION_2_1();
  }

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v8, v2);
  v1[1] = 0u;
  v1[2] = 0u;
  *uint64_t v1 = 0u;
LABEL_90:
  OUTLINED_FUNCTION_59();
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

uint64_t TapToRadarWithPolicyManager.__allocating_init(policy:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 24);
  *(_OWORD *)(v2 + 136) = *(_OWORD *)a1;
  *(void *)(v2 + 152) = v3;
  *(void *)(v2 + 160) = v4;
  *(_OWORD *)(v2 + 168) = *(_OWORD *)(a1 + 32);
  return TapToRadarManager.init()();
}

uint64_t TapToRadarWithPolicyManager.init(policy:)(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 24);
  *(_OWORD *)(v1 + 136) = *(_OWORD *)a1;
  *(void *)(v1 + 152) = v2;
  *(void *)(v1 + 160) = v3;
  *(_OWORD *)(v1 + 168) = *(_OWORD *)(a1 + 32);
  return TapToRadarManager.init()();
}

uint64_t static TapToRadarWithPolicyManager.translateDeviceToPlatform()()
{
  GestaltGetDeviceClass();
  id v0 = (id)CUGestaltDeviceClassToString();
  int v1 = [v0 hasPrefix:@"iPhone"];

  if (v1 || (v0 = v0, int v2 = [v0 hasPrefix:@"iPad"], v0, v2))
  {
    uint64_t v3 = 5459817;

    return v3;
  }
  id v4 = v0;
  if (([v4 hasPrefix:@"AudioAccessory1,"] & 1) != 0
    || ([v4 hasPrefix:@"AudioAccessory5,"] & 1) != 0
    || ([v4 hasPrefix:@"AudioAccessory6,"] & 1) != 0
    || [v4 hasPrefix:@"HomePod"])
  {
    uint64_t v3 = 1397716596;

LABEL_9:
    return v3;
  }

  id v4 = v4;
  int v6 = [v4 hasPrefix:@"AppleTV"];

  if (v6)
  {
    uint64_t v3 = 1397716596;
    goto LABEL_9;
  }
  id v7 = v4;
  int v8 = [v7 hasPrefix:@"Watch"];

  if (v8)
  {

    return 0x534F6863746177;
  }
  else
  {
    id v9 = v7;
    int v10 = [v9 containsString:@"Mac"];

    if (v10) {
      return 0x534F63616DLL;
    }
    else {
      return 0x726F707075736E75;
    }
  }
}

void *static TapToRadarWithPolicyManager.enforceTailspinAndErrorAllowed(tailspins:denyList:denyAll:errorSignatureAllowListOverride:)(void *a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  id v15 = (char *)&v53 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v53 - v16;
  if (a3)
  {
    uint64_t v18 = MEMORY[0x263F8EE78];
    if (a1) {
      uint64_t v19 = (uint64_t)a1;
    }
    else {
      uint64_t v19 = MEMORY[0x263F8EE78];
    }
    swift_bridgeObjectRetain();
    uint64_t v20 = specialized Set.init<A>(_:)(v19);
    if (a4) {
      uint64_t v21 = a4;
    }
    else {
      uint64_t v21 = v18;
    }
    swift_bridgeObjectRetain();
    uint64_t v22 = specialized Set.init<A>(_:)(v21);
    uint64_t v23 = specialized _NativeSet.intersection(_:)(v22, v20);
    swift_bridgeObjectRelease();
    static Logger.logger.getter();
    swift_retain_n();
    Swift::String v24 = Logger.logObject.getter();
    os_log_type_t v25 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      uint64_t v27 = swift_slowAlloc();
      uint64_t v56 = v27;
      *(_DWORD *)uint64_t v26 = 136315138;
      uint64_t v53 = v26 + 4;
      swift_retain();
      uint64_t v28 = Set.description.getter();
      uint64_t v54 = v8;
      uint64_t v29 = v28;
      unint64_t v31 = v30;
      swift_release();
      uint64_t v55 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v29, v31, &v56);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21E680000, v24, v25, "TapToRadarWithPolicyManager#enforceTailspinAndErrorAllowed intersection returning %s", v26, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C2EF70](v27, -1, -1);
      MEMORY[0x223C2EF70](v26, -1, -1);

      (*(void (**)(char *, uint64_t))(v9 + 8))(v17, v54);
LABEL_22:
      a1 = specialized _copyCollectionToContiguousArray<A>(_:)(v23);
      swift_release();
      return a1;
    }

    swift_release_n();
    uint64_t v50 = *(void (**)(char *, uint64_t))(v9 + 8);
    uint64_t v51 = v17;
    goto LABEL_21;
  }
  if (a2)
  {
    uint64_t v32 = specialized Dictionary.subscript.getter(0x656C74746F726854, 0xEF73726F72724564, a2);
    if (v32)
    {
      uint64_t v56 = v32;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
      if (swift_dynamicCast())
      {
        uint64_t v33 = v55;
        if (a1) {
          uint64_t v34 = (uint64_t)a1;
        }
        else {
          uint64_t v34 = MEMORY[0x263F8EE78];
        }
        swift_bridgeObjectRetain();
        uint64_t v35 = specialized Set.init<A>(_:)(v34);
        uint64_t v23 = specialized _NativeSet.subtracting<A>(_:)(v33, v35);
        swift_bridgeObjectRelease();
        static Logger.logger.getter();
        swift_retain_n();
        uint64_t v36 = Logger.logObject.getter();
        os_log_type_t v37 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v36, v37))
        {
          uint64_t v38 = (uint8_t *)swift_slowAlloc();
          uint64_t v39 = swift_slowAlloc();
          uint64_t v56 = v39;
          *(_DWORD *)uint64_t v38 = 136315138;
          uint64_t v53 = v38 + 4;
          swift_retain();
          uint64_t v40 = v9;
          uint64_t v41 = Set.description.getter();
          uint64_t v54 = v8;
          unint64_t v43 = v42;
          swift_release();
          uint64_t v55 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v41, v43, &v56);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_release_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_21E680000, v36, v37, "TapToRadarWithPolicyManager#enforceTailspinAndErrorAllowed subtraction returning %s", v38, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x223C2EF70](v39, -1, -1);
          MEMORY[0x223C2EF70](v38, -1, -1);

          (*(void (**)(char *, uint64_t))(v40 + 8))(v15, v54);
          goto LABEL_22;
        }

        swift_release_n();
        uint64_t v50 = *(void (**)(char *, uint64_t))(v9 + 8);
        uint64_t v51 = v15;
LABEL_21:
        v50(v51, v8);
        goto LABEL_22;
      }
    }
  }
  static Logger.logger.getter();
  swift_bridgeObjectRetain_n();
  id v44 = Logger.logObject.getter();
  os_log_type_t v45 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v44, v45))
  {
    uint64_t v46 = (uint8_t *)swift_slowAlloc();
    uint64_t v47 = swift_slowAlloc();
    uint64_t v55 = (uint64_t)a1;
    uint64_t v56 = v47;
    *(_DWORD *)uint64_t v46 = 136315138;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]?);
    uint64_t v48 = String.init<A>(describing:)();
    uint64_t v54 = v8;
    uint64_t v55 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v48, v49, &v56);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21E680000, v44, v45, "TapToRadarWithPolicyManager#enforceTailspinAndErrorAllowed no throttled errors, returning %s", v46, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C2EF70](v47, -1, -1);
    MEMORY[0x223C2EF70](v46, -1, -1);

    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v54);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  }
  swift_bridgeObjectRetain();
  return a1;
}

void TapToRadarWithPolicyManager.createProblem(errStatus:userDefaultSuiteName:radarComponentInfo:title:description:duc:radarFilingExtras:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t *a24,void (*a25)(void),uint64_t a26)
{
  OUTLINED_FUNCTION_60();
  uint64_t v62 = v27;
  uint64_t v63 = v28;
  uint64_t v60 = v29;
  uint64_t v61 = v30;
  uint64_t v32 = v31;
  uint64_t v59 = v33;
  uint64_t v35 = v34;
  uint64_t v64 = v36;
  type metadata accessor for Logger();
  OUTLINED_FUNCTION_0();
  uint64_t v38 = v37;
  MEMORY[0x270FA5388](v39);
  OUTLINED_FUNCTION_14_0();
  MEMORY[0x270FA5388](v40);
  uint64_t v57 = v32[1];
  uint64_t v58 = *v32;
  uint64_t v56 = v32[2];
  uint64_t v55 = v32[3];
  uint64_t v54 = v32[4];
  uint64_t v53 = *a24;
  uint64_t v52 = a24[1];
  uint64_t v51 = a24[2];
  uint64_t v50 = a24[3];
  uint64_t v49 = a24[4];
  static Logger.logger.getter();
  uint64_t v41 = Logger.logObject.getter();
  os_log_type_t v42 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v41, v42))
  {
    unint64_t v43 = (uint8_t *)OUTLINED_FUNCTION_8_1();
    *(_WORD *)unint64_t v43 = 0;
    _os_log_impl(&dword_21E680000, v41, v42, "TapToRadarWithPolicyManager#createProblem", v43, 2u);
    OUTLINED_FUNCTION_2_1();
  }

  id v44 = *(void (**)(void))(v38 + 8);
  OUTLINED_FUNCTION_7_1();
  v44();
  if ((*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v26 + 376))(v35, v64, a22, a23))
  {
    v66[0] = v58;
    v66[1] = v57;
    v66[2] = v56;
    v66[3] = v55;
    v66[4] = v54;
    v65[0] = v53;
    v65[1] = v52;
    v65[2] = v51;
    v65[3] = v50;
    v65[4] = v49;
    TapToRadarManager.createProblem(errStatus:userDefaultSuiteName:radarComponentInfo:title:description:radarFilingExtras:completion:)(v35, v64, v59, v60, (uint64_t)v66, v61, v62, v63, a21, (uint64_t)v65, (uint64_t)a25, a26, v48, v49, v50, v51, v52, v53, v54,
      v55,
      v56,
      v57,
      v58,
      v59);
  }
  else
  {
    static Logger.logger.getter();
    os_log_type_t v45 = Logger.logObject.getter();
    os_log_type_t v46 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v45, v46))
    {
      uint64_t v47 = (uint8_t *)OUTLINED_FUNCTION_8_1();
      *(_WORD *)uint64_t v47 = 0;
      _os_log_impl(&dword_21E680000, v45, v46, "TapToRadarWithPolicyManager#createProblem policy data does not support filing this issue", v47, 2u);
      OUTLINED_FUNCTION_2_1();
    }

    OUTLINED_FUNCTION_7_1();
    v44();
    a25(0);
  }
  OUTLINED_FUNCTION_59();
}

Swift::Bool __swiftcall TapToRadarWithPolicyManager.doesPolicyDataAllowFilingIssue(errStatus:duc:)(Swift::String errStatus, Swift::String_optional duc)
{
  OUTLINED_FUNCTION_60();
  uint64_t v4 = v3;
  unint64_t v6 = v5;
  uint64_t v8 = v7;
  OUTLINED_FUNCTION_6_1();
  os_log_t v96 = v9;
  uint64_t v97 = v10;
  type metadata accessor for Logger();
  OUTLINED_FUNCTION_0();
  uint64_t v98 = v12;
  uint64_t v99 = v11;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_11();
  uint64_t v94 = v13;
  OUTLINED_FUNCTION_22();
  MEMORY[0x270FA5388](v14);
  uint64_t v95 = (char *)&v85 - v15;
  OUTLINED_FUNCTION_22();
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v85 - v18;
  uint64_t v20 = MEMORY[0x270FA5388](v17);
  uint64_t v22 = (char *)&v85 - v21;
  MEMORY[0x270FA5388](v20);
  uint64_t v89 = (char *)&v85 - v23;
  OUTLINED_FUNCTION_22();
  MEMORY[0x270FA5388](v24);
  uint64_t v90 = (char *)&v85 - v25;
  OUTLINED_FUNCTION_22();
  MEMORY[0x270FA5388](v26);
  OUTLINED_FUNCTION_10_1();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v27 = Logger.logObject.getter();
  os_log_type_t v28 = static os_log_type_t.debug.getter();
  BOOL v29 = os_log_type_enabled(v27, v28);
  long long v87 = v22;
  long long v88 = v19;
  uint64_t v92 = v8;
  unint64_t v93 = v6;
  uint64_t v91 = v4;
  if (v29)
  {
    uint64_t v30 = swift_slowAlloc();
    uint64_t v86 = swift_slowAlloc();
    uint64_t v101 = v86;
    *(_DWORD *)uint64_t v30 = 136315394;
    swift_bridgeObjectRetain();
    v100[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v8, v6, &v101);
    OUTLINED_FUNCTION_21_0();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v30 + 12) = 2080;
    v100[0] = (uint64_t)v96;
    v100[1] = v4;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
    uint64_t v31 = String.init<A>(describing:)();
    v100[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v31, v32, &v101);
    uint64_t v33 = v98;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21E680000, v27, v28, "TapToRadarWithPolicyManager#doesPolicyDataAllowFilingIssue, errStatus: %s, duc: %s", (uint8_t *)v30, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2_1();
    OUTLINED_FUNCTION_2_1();

    uint64_t v34 = *(void (**)(void))(v33 + 8);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    OUTLINED_FUNCTION_19_0();
    uint64_t v34 = *(void (**)(void))(v98 + 8);
  }
  OUTLINED_FUNCTION_28_0();
  v34();
  uint64_t v35 = (void *)v2[17];
  if (v35)
  {
    uint64_t v94 = v34;
    unint64_t v36 = v2[20];
    uint64_t v37 = v2[21];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v38 = static TapToRadarWithPolicyManager.translateDeviceToPlatform()();
    unint64_t v40 = v39;
    if (specialized Sequence<>.contains(_:)(v38, v39, v35))
    {
      swift_bridgeObjectRelease();
      TapToRadarWithPolicyManager.checkIsErrorSignatureAllowListOverrideInPolicy(errorSignatureAllowListOverride:errStatus:)();
      if (v41)
      {
        OUTLINED_FUNCTION_1_2();
        static Logger.logger.getter();
        os_log_type_t v42 = (void *)Logger.logObject.getter();
        os_log_type_t v43 = static os_log_type_t.debug.getter();
        if (!OUTLINED_FUNCTION_12_0(v43))
        {
LABEL_10:

          OUTLINED_FUNCTION_28_0();
          v48();
          goto LABEL_31;
        }
        id v44 = (_WORD *)OUTLINED_FUNCTION_8_1();
        OUTLINED_FUNCTION_30_0(v44);
        uint64_t v47 = "TapToRadarWithPolicyManager#doesPolicyDataAllowFilingIssue errorSignatureAllowListOverride allowed";
LABEL_9:
        OUTLINED_FUNCTION_13_0(&dword_21E680000, v45, v46, v47);
        OUTLINED_FUNCTION_2_1();
        goto LABEL_10;
      }
      if (v91)
      {
        TapToRadarWithPolicyManager.checkIsDUCAllowedPolicy(ducAllowList:errStatus:duc:)();
        char v66 = v65;
        OUTLINED_FUNCTION_1_2();
        if (v66) {
          goto LABEL_31;
        }
        uint64_t v71 = v89;
        static Logger.logger.getter();
        uint64_t v72 = (void *)Logger.logObject.getter();
        os_log_type_t v73 = static os_log_type_t.debug.getter();
        if (OUTLINED_FUNCTION_12_0(v73))
        {
          uint64_t v74 = (_WORD *)OUTLINED_FUNCTION_8_1();
          OUTLINED_FUNCTION_30_0(v74);
          OUTLINED_FUNCTION_13_0(&dword_21E680000, v75, v76, "TapToRadarWithPolicyManager#doesPolicyDataAllowFilingIssue DUC not allowed");
          OUTLINED_FUNCTION_2_1();
        }

        OUTLINED_FUNCTION_24_0();
        uint64_t v64 = v71;
      }
      else
      {
        if ((v36 & 1) == 0)
        {
          TapToRadarWithPolicyManager.checkIsDenyListed(denyList:errStatus:)();
          char v68 = v67;
          OUTLINED_FUNCTION_1_2();
          if (v68) {
            goto LABEL_31;
          }
          static Logger.logger.getter();
          os_log_type_t v42 = (void *)Logger.logObject.getter();
          os_log_type_t v69 = static os_log_type_t.debug.getter();
          if (!OUTLINED_FUNCTION_12_0(v69)) {
            goto LABEL_10;
          }
          uint64_t v70 = (_WORD *)OUTLINED_FUNCTION_8_1();
          OUTLINED_FUNCTION_30_0(v70);
          uint64_t v47 = "TapToRadarWithPolicyManager#doesPolicyDataAllowFilingIssue, policy allows filing";
          goto LABEL_9;
        }
        OUTLINED_FUNCTION_1_2();
        uint64_t v77 = v88;
        static Logger.logger.getter();
        uint64_t v78 = Logger.logObject.getter();
        os_log_type_t v79 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v78, v79))
        {
          uint64_t v80 = (uint8_t *)OUTLINED_FUNCTION_16_0();
          v100[0] = OUTLINED_FUNCTION_23_0();
          *(_DWORD *)uint64_t v80 = 136315138;
          uint64_t v81 = OUTLINED_FUNCTION_17_0();
          uint64_t v101 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v81, v82, v83);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          _os_log_impl(&dword_21E680000, v78, v79, "TapToRadarWithPolicyManager#checkIsDenyListed %s is true", v80, 0xCu);
          swift_arrayDestroy();
          OUTLINED_FUNCTION_2_1();
          OUTLINED_FUNCTION_2_1();
        }

        OUTLINED_FUNCTION_24_0();
        uint64_t v64 = v77;
      }
    }
    else
    {
      uint64_t v54 = v95;
      static Logger.logger.getter();
      outlined copy of Policy?((uint64_t)v35);
      swift_bridgeObjectRetain();
      uint64_t v55 = Logger.logObject.getter();
      os_log_type_t v56 = static os_log_type_t.debug.getter();
      LODWORD(v97) = v56;
      if (os_log_type_enabled(v55, v56))
      {
        uint64_t v57 = swift_slowAlloc();
        unint64_t v93 = v36;
        os_log_t v96 = v55;
        uint64_t v58 = v57;
        v100[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v58 = 136315394;
        uint64_t v92 = v37;
        swift_bridgeObjectRetain();
        uint64_t v101 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v38, v40, v100);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v58 + 12) = 2080;
        uint64_t v59 = swift_bridgeObjectRetain();
        uint64_t v60 = MEMORY[0x223C2E6A0](v59, MEMORY[0x263F8D310]);
        unint64_t v62 = v61;
        swift_bridgeObjectRelease();
        uint64_t v101 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v60, v62, v100);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        outlined consume of Policy?((uint64_t)v35);
        outlined consume of Policy?((uint64_t)v35);
        os_log_t v63 = v96;
        _os_log_impl(&dword_21E680000, v96, (os_log_type_t)v97, "TapToRadarWithPolicyManager#doesPolicyDataAllowFilingIssue, current platform: %s is not part of %s", (uint8_t *)v58, 0x16u);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_2_1();
        OUTLINED_FUNCTION_2_1();

        OUTLINED_FUNCTION_24_0();
        uint64_t v64 = v95;
      }
      else
      {
        OUTLINED_FUNCTION_19_0();
        OUTLINED_FUNCTION_1_2();
        OUTLINED_FUNCTION_1_2();

        OUTLINED_FUNCTION_24_0();
        uint64_t v64 = v54;
      }
    }
    ((void (*)(char *, uint64_t))v94)(v64, v99);
    goto LABEL_31;
  }
  static Logger.logger.getter();
  uint64_t v49 = (void *)Logger.logObject.getter();
  os_log_type_t v50 = static os_log_type_t.error.getter();
  if (OUTLINED_FUNCTION_12_0(v50))
  {
    uint64_t v51 = (_WORD *)OUTLINED_FUNCTION_8_1();
    OUTLINED_FUNCTION_30_0(v51);
    OUTLINED_FUNCTION_13_0(&dword_21E680000, v52, v53, "TapToRadarWithPolicyManager#doesPolicyDataAllowFilingIssue unable to extract policy");
    OUTLINED_FUNCTION_2_1();
  }

  OUTLINED_FUNCTION_28_0();
  v34();
LABEL_31:
  OUTLINED_FUNCTION_59();
  return result;
}

uint64_t specialized Sequence<>.contains(_:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  uint64_t v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
      return 1;
    }
    uint64_t result = 0;
    v9 += 2;
    if (v11 == v3) {
      return result;
    }
  }
  __break(1u);
  return result;
}

void TapToRadarWithPolicyManager.checkIsDUCAllowedPolicy(ducAllowList:errStatus:duc:)()
{
  OUTLINED_FUNCTION_60();
  unint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v39 = v5;
  unint64_t v40 = v6;
  uint64_t v8 = v7;
  uint64_t v9 = type metadata accessor for Logger();
  OUTLINED_FUNCTION_0();
  uint64_t v11 = v10;
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_14_0();
  MEMORY[0x270FA5388](v13);
  OUTLINED_FUNCTION_10_1();
  swift_bridgeObjectRetain();
  uint64_t v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)OUTLINED_FUNCTION_16_0();
    *(_DWORD *)uint64_t v16 = 134217984;
    OUTLINED_FUNCTION_21_0();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21E680000, v14, v15, "TapToRadarWithPolicyManager#checkIsDUCAllowedPolicy DUCAllowList size: %ld", v16, 0xCu);
    OUTLINED_FUNCTION_2_1();
  }
  else
  {

    swift_bridgeObjectRelease();
  }
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v0, v9);
  uint64_t v17 = *(void *)(v8 + 16);
  if (!v17) {
    goto LABEL_30;
  }
  swift_bridgeObjectRetain();
  uint64_t v18 = 0;
  while (1)
  {
    uint64_t v19 = *(void *)(v8 + 8 * v18 + 32);
    if (*(void *)(v19 + 16)) {
      break;
    }
LABEL_21:
    if (v17 == ++v18)
    {
      swift_bridgeObjectRelease();
      goto LABEL_30;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v20 = OUTLINED_FUNCTION_15_0();
  unint64_t v21 = specialized __RawDictionaryStorage.find<A>(_:)(v20, 0xE800000000000000);
  if ((v22 & 1) == 0) {
    goto LABEL_20;
  }
  uint64_t v23 = (void *)(*(void *)(v19 + 56) + 16 * v21);
  BOOL v24 = *v23 == v4 && v23[1] == v2;
  if (!v24 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
    goto LABEL_20;
  }
  if (!*(void *)(v19 + 16)
    || (unint64_t v25 = specialized __RawDictionaryStorage.find<A>(_:)(0xD000000000000013, 0x800000021E6AE660), (v26 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v30 = v40;
    goto LABEL_26;
  }
  uint64_t v27 = (uint64_t *)(*(void *)(v19 + 56) + 16 * v25);
  uint64_t v28 = *v27;
  uint64_t v29 = v27[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unint64_t v30 = v40;
  BOOL v31 = v28 == v39 && v29 == v40;
  if (!v31 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
  {
LABEL_20:
    swift_bridgeObjectRelease();
    goto LABEL_21;
  }
  swift_bridgeObjectRelease();
LABEL_26:
  static Logger.logger.getter();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  unint64_t v32 = v30;
  uint64_t v33 = Logger.logObject.getter();
  os_log_type_t v34 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v33, v34))
  {
    uint64_t v35 = OUTLINED_FUNCTION_23_0();
    uint64_t v41 = swift_slowAlloc();
    *(_DWORD *)uint64_t v35 = 136315650;
    swift_bridgeObjectRetain();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v2, &v41);
    OUTLINED_FUNCTION_21_0();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v35 + 12) = 2080;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
    uint64_t v36 = String.init<A>(describing:)();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v36, v37, &v41);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    OUTLINED_FUNCTION_19_0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v35 + 22) = 2080;
    swift_bridgeObjectRetain();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v39, v32, &v41);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21E680000, v33, v34, "TapToRadarWithPolicyManager#checkIsDUCAllowedPolicy, ducs matched: %s, errInf: %s, errStatus: %s", (uint8_t *)v35, 0x20u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2_1();
    OUTLINED_FUNCTION_2_1();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    OUTLINED_FUNCTION_19_0();
    swift_bridgeObjectRelease_n();
  }
  OUTLINED_FUNCTION_28_0();
  v38();
LABEL_30:
  OUTLINED_FUNCTION_59();
}

void TapToRadarWithPolicyManager.checkIsErrorSignatureAllowListOverrideInPolicy(errorSignatureAllowListOverride:errStatus:)()
{
  OUTLINED_FUNCTION_60();
  uint64_t v3 = OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_11();
  uint64_t v19 = v7;
  OUTLINED_FUNCTION_22();
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_10_1();
  swift_bridgeObjectRetain();
  uint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)OUTLINED_FUNCTION_16_0();
    *(_DWORD *)uint64_t v11 = 134217984;
    v20[0] = *(void *)(v2 + 16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21E680000, v9, v10, "TapToRadarWithPolicyManager#checkIsErrorSignatureAllowListOverrideInPolicy errorSignatureAllowListOverride size: %ld", v11, 0xCu);
    OUTLINED_FUNCTION_2_1();
  }
  else
  {

    swift_bridgeObjectRelease();
  }
  uint64_t v12 = *(void (**)(void))(v5 + 8);
  OUTLINED_FUNCTION_7_1();
  v12();
  uint64_t v13 = *(void *)(v2 + 16);
  if (v13)
  {
    uint64_t v18 = v3;
    lazy protocol witness table accessor for type String and conformance String();
    swift_bridgeObjectRetain();
    uint64_t v14 = v2 + 40;
    while (1)
    {
      v20[0] = v1;
      v20[1] = v0;
      if (StringProtocol.contains<A>(_:)()) {
        break;
      }
      v14 += 16;
      if (!--v13)
      {
        swift_bridgeObjectRelease();
        goto LABEL_13;
      }
    }
    swift_bridgeObjectRelease();
    static Logger.logger.getter();
    swift_bridgeObjectRetain_n();
    os_log_type_t v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)OUTLINED_FUNCTION_16_0();
      v20[0] = OUTLINED_FUNCTION_23_0();
      *(_DWORD *)uint64_t v17 = 136315138;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v1, v0, v20);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21E680000, v15, v16, "TapToRadarWithPolicyManager#checkIsErrorSignatureAllowListOverrideInPolicy, matched on %s", v17, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_2_1();
      OUTLINED_FUNCTION_2_1();

      ((void (*)(uint64_t, uint64_t))v12)(v19, v18);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      ((void (*)(uint64_t, uint64_t))v12)(v19, v18);
    }
  }
LABEL_13:
  OUTLINED_FUNCTION_59();
}

void TapToRadarWithPolicyManager.checkIsDenyListed(denyList:errStatus:)()
{
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_14_0();
  MEMORY[0x270FA5388](v4);
  uint64_t v5 = specialized Dictionary.subscript.getter(0x656C74746F726854, 0xEF73726F72724564, v2);
  if (v5
    && (uint64_t v20 = v5,
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]),
        (swift_dynamicCast() & 1) != 0))
  {
    swift_bridgeObjectRetain();
    specialized _ArrayProtocol.filter(_:)(v19);
    static Logger.logger.getter();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v6, v7))
    {
      os_log_type_t v18 = v7;
      uint64_t v8 = swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 136315394;
      uint64_t v9 = swift_bridgeObjectRetain();
      uint64_t v10 = MEMORY[0x223C2E6A0](v9, MEMORY[0x263F8D310]);
      unint64_t v12 = v11;
      swift_bridgeObjectRelease();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v10, v12, &v20);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v8 + 12) = 2080;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v1, v0, &v20);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21E680000, v6, v18, "TapToRadarWithPolicyManager#checkIsDenyListed results: %s, errStatus: %s", (uint8_t *)v8, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_2_1();
      OUTLINED_FUNCTION_2_1();
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    OUTLINED_FUNCTION_7_1();
    v17();
    swift_bridgeObjectRelease();
  }
  else
  {
    static Logger.logger.getter();
    uint64_t v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v13, v14))
    {
      os_log_type_t v15 = (uint8_t *)OUTLINED_FUNCTION_8_1();
      *(_WORD *)os_log_type_t v15 = 0;
      _os_log_impl(&dword_21E680000, v13, v14, "TapToRadarWithPolicyManager#checkIsDenyListed no throttled errors, returning false", v15, 2u);
      OUTLINED_FUNCTION_2_1();
    }

    OUTLINED_FUNCTION_7_1();
    v16();
  }
  OUTLINED_FUNCTION_59();
}

uint64_t specialized _ArrayProtocol.filter(_:)(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 16);
  if (v2)
  {
    unint64_t v3 = 0;
    uint64_t v4 = result + 40;
    uint64_t v15 = MEMORY[0x263F8EE78];
    uint64_t v14 = result + 40;
    do
    {
      uint64_t v5 = (uint64_t *)(v4 + 16 * v3);
      unint64_t v6 = v3;
      while (1)
      {
        if (v6 >= *(void *)(v1 + 16))
        {
          __break(1u);
          return result;
        }
        uint64_t v7 = *(v5 - 1);
        uint64_t v8 = *v5;
        unint64_t v3 = v6 + 1;
        lazy protocol witness table accessor for type String and conformance String();
        swift_bridgeObjectRetain();
        if (StringProtocol.contains<A>(_:)()) {
          break;
        }
        uint64_t result = swift_bridgeObjectRelease();
        v5 += 2;
        ++v6;
        if (v2 == v3) {
          goto LABEL_15;
        }
      }
      uint64_t v9 = v15;
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v15 + 16) + 1, 1);
        uint64_t v9 = v15;
      }
      unint64_t v11 = *(void *)(v9 + 16);
      unint64_t v10 = *(void *)(v9 + 24);
      unint64_t v12 = v11 + 1;
      if (v11 >= v10 >> 1)
      {
        uint64_t result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v10 > 1), v11 + 1, 1);
        unint64_t v12 = v11 + 1;
        uint64_t v9 = v15;
      }
      *(void *)(v9 + 16) = v12;
      uint64_t v15 = v9;
      uint64_t v13 = v9 + 16 * v11;
      *(void *)(v13 + 32) = v7;
      *(void *)(v13 + 40) = v8;
      uint64_t v4 = v14;
    }
    while (v2 - 1 != v6);
  }
  else
  {
    uint64_t v15 = MEMORY[0x263F8EE78];
  }
LABEL_15:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t specialized Set.init<A>(_:)(uint64_t a1)
{
  uint64_t v2 = Set.init(minimumCapacity:)();
  uint64_t v10 = v2;
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = (Swift::Int *)(a1 + 40);
    do
    {
      Swift::Int v5 = *(v4 - 1);
      Swift::Int v6 = *v4;
      swift_bridgeObjectRetain();
      specialized Set._Variant.insert(_:)(&v9, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
    return v10;
  }
  else
  {
    uint64_t v7 = v2;
    swift_bridgeObjectRelease();
  }
  return v7;
}

void TapToRadarWithPolicyManager.__allocating_init()()
{
}

void TapToRadarWithPolicyManager.init()()
{
}

uint64_t TapToRadarWithPolicyManager.__ivar_destroyer()
{
  return outlined consume of Policy?(*(void *)(v0 + 136));
}

uint64_t TapToRadarWithPolicyManager.deinit()
{
  uint64_t v1 = TapToRadarManager.deinit();
  OUTLINED_FUNCTION_20_0(v1);
  return v0;
}

uint64_t TapToRadarWithPolicyManager.__deallocating_deinit()
{
  uint64_t v1 = TapToRadarManager.deinit();
  OUTLINED_FUNCTION_20_0(v1);
  return MEMORY[0x270FA0228](v0, 184, 7);
}

uint64_t closure #1 in osLogInternal(_:log:type:)(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

char *specialized UnsafeMutablePointer.moveInitialize(from:count:)(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

uint64_t specialized UnsafeMutablePointer.initialize(from:count:)(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || ((unint64_t v5 = a1, a3 + 16 * a2 > a1) ? (v6 = a1 + 16 * a2 > a3) : (v6 = 0), v6))
  {
    uint64_t v7 = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t v7 = a3;
  }
  return MEMORY[0x270FA01C8](v7, v5);
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

uint64_t specialized _StringGuts._deconstructUTF8<A>(scratch:)(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      specialized UnsafeMutableRawPointer.initializeMemory<A>(as:from:count:)((char *)__src, HIBYTE(a6) & 0xF, __dst);
      UnsafeMutableRawBufferPointer.subscript.setter();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = _StringGuts._allocateForDeconstruct()(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = _StringObject.sharedUTF8.getter();
    if (!v8)
    {
      uint64_t result = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

void *specialized UnsafeMutableRawPointer.initializeMemory<A>(as:from:count:)(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

uint64_t _StringGuts._allocateForDeconstruct()(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v2 + 16) + 1, 1, v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = String.UTF8View._foreignCount()();
    if (v2) {
      goto LABEL_6;
    }
    return MEMORY[0x263F8EE78];
  }
  if ((a2 & 0x2000000000000000) != 0) {
    Swift::Int v2 = HIBYTE(a2) & 0xF;
  }
  else {
    Swift::Int v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return MEMORY[0x263F8EE78];
  }
LABEL_6:
  unint64_t v3 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = _StringGuts.copyUTF8(into:)();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return (uint64_t)v4;
  }
  _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
LABEL_14:
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
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
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  int64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    int64_t v9 = *(void *)(a4 + 16);
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
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    specialized UnsafeMutablePointer.moveInitialize(from:count:)(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    specialized UnsafeMutablePointer.initialize(from:count:)(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *specialized UnsafeMutablePointer.initialize(from:count:)(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *specialized UnsafeMutablePointer.moveInitialize(from:count:)(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unsigned char **closure #1 in OSLogArguments.append(_:)(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t outlined init with take of Any??(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t outlined destroy of Any??(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t outlined copy of Policy?(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t outlined consume of Policy?(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type TapToRadarWithPolicyManager.DefaultPolicyKeys and conformance TapToRadarWithPolicyManager.DefaultPolicyKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type TapToRadarWithPolicyManager.DefaultPolicyKeys and conformance TapToRadarWithPolicyManager.DefaultPolicyKeys;
  if (!lazy protocol witness table cache variable for type TapToRadarWithPolicyManager.DefaultPolicyKeys and conformance TapToRadarWithPolicyManager.DefaultPolicyKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TapToRadarWithPolicyManager.DefaultPolicyKeys and conformance TapToRadarWithPolicyManager.DefaultPolicyKeys);
  }
  return result;
}

uint64_t destroy for Policy()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Policy(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Policy(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for Policy(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Policy(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 48))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Policy(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Policy()
{
  return &type metadata for Policy;
}

uint64_t type metadata accessor for TapToRadarWithPolicyManager()
{
  return self;
}

uint64_t method lookup function for TapToRadarWithPolicyManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TapToRadarWithPolicyManager);
}

uint64_t dispatch thunk of TapToRadarWithPolicyManager.__allocating_init(data:)()
{
  return (*(uint64_t (**)(void))(v0 + 352))();
}

uint64_t dispatch thunk of TapToRadarWithPolicyManager.__allocating_init(policy:)()
{
  return (*(uint64_t (**)(void))(v0 + 360))();
}

uint64_t dispatch thunk of TapToRadarWithPolicyManager.createProblem(errStatus:userDefaultSuiteName:radarComponentInfo:title:description:duc:radarFilingExtras:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 368))();
}

uint64_t dispatch thunk of TapToRadarWithPolicyManager.doesPolicyDataAllowFilingIssue(errStatus:duc:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 376))();
}

uint64_t getEnumTagSinglePayload for TapToRadarWithPolicyManager.DefaultPolicyKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF7)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 10;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xA;
  int v5 = v6 - 10;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for TapToRadarWithPolicyManager.DefaultPolicyKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 9;
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
        JUMPOUT(0x21E6A28E4);
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
          *__n128 result = a2 + 9;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TapToRadarWithPolicyManager.DefaultPolicyKeys()
{
  return &type metadata for TapToRadarWithPolicyManager.DefaultPolicyKeys;
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

uint64_t specialized Set._Variant.insert(_:)(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  Swift::Int v8 = Hasher._finalize()();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    unint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
      Swift::Int v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      os_log_type_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *int v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  specialized _NativeSet.insertNew(_:at:isUnique:)(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *int v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t specialized _NativeSet.subtracting<A>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (!*(void *)(a2 + 16))
  {
    swift_release();
    return MEMORY[0x263F8EE88];
  }
  uint64_t v26 = a1;
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = a2 + 56;
    v25[0] = a1 + 32;
    swift_bridgeObjectRetain();
    uint64_t v5 = 0;
    while (1)
    {
      unsigned int v6 = (uint64_t *)(v25[0] + 16 * v5);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      ++v5;
      Hasher.init(_seed:)();
      swift_bridgeObjectRetain();
      String.hash(into:)();
      Swift::Int v9 = Hasher._finalize()();
      uint64_t v10 = -1 << *(unsigned char *)(v2 + 32);
      unint64_t v11 = v9 & ~v10;
      if ((*(void *)(v4 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11))
      {
        uint64_t v12 = *(void *)(v2 + 48);
        BOOL v13 = (void *)(v12 + 16 * v11);
        BOOL v14 = *v13 == v8 && v13[1] == v7;
        if (v14 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        {
          uint64_t isStackAllocationSafe = swift_bridgeObjectRelease();
          uint64_t v27 = v5;
LABEL_22:
          char v19 = *(unsigned char *)(v2 + 32);
          unint64_t v20 = (unint64_t)((1 << v19) + 63) >> 6;
          size_t v21 = 8 * v20;
          if ((v19 & 0x3Fu) < 0xE
            || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), isStackAllocationSafe))
          {
            MEMORY[0x270FA5388](isStackAllocationSafe);
            memcpy((char *)v25 - ((v21 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v21);
            uint64_t v22 = specialized closure #1 in _NativeSet.subtracting<A>(_:)((uint64_t)v25 - ((v21 + 15) & 0x3FFFFFFFFFFFFFF0), v20, v2, v11, &v26);
            swift_release();
            swift_bridgeObjectRelease();
          }
          else
          {
            uint64_t v23 = (void *)swift_slowAlloc();
            memcpy(v23, (const void *)(v2 + 56), v21);
            uint64_t v22 = specialized closure #1 in _NativeSet.subtracting<A>(_:)((uint64_t)v23, v20, v2, v11, &v26);
            swift_release();
            swift_bridgeObjectRelease();
            MEMORY[0x223C2EF70](v23, -1, -1);
          }
          return v22;
        }
        uint64_t v15 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v15;
          if (((*(void *)(v4 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
            break;
          }
          os_log_type_t v16 = (void *)(v12 + 16 * v11);
          BOOL v17 = *v16 == v8 && v16[1] == v7;
          if (v17 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
          {
            uint64_t v27 = v5;
            uint64_t isStackAllocationSafe = swift_bridgeObjectRelease();
            goto LABEL_22;
          }
        }
      }
      swift_bridgeObjectRelease();
      if (v5 == v3)
      {
        swift_bridgeObjectRelease();
        return v2;
      }
    }
  }
  return v2;
}

uint64_t specialized _NativeSet.resize(capacity:)()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<String>);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    unint64_t v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    if (!v7) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v12 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    for (unint64_t i = v12 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v11 << 6))
    {
      BOOL v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
      uint64_t v18 = *v17;
      uint64_t v19 = v17[1];
      Hasher.init(_seed:)();
      String.hash(into:)();
      uint64_t result = Hasher._finalize()();
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6))) == 0)
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v20) >> 6;
        while (++v22 != v25 || (v24 & 1) == 0)
        {
          BOOL v26 = v22 == v25;
          if (v22 == v25) {
            unint64_t v22 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v9 + 8 * v22);
          if (v27 != -1)
          {
            unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
      uint64_t v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
      *uint64_t v28 = v18;
      v28[1] = v19;
      ++*(void *)(v4 + 16);
      if (v7) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v14 = v11 + 1;
      if (__OFADD__(v11, 1)) {
        goto LABEL_38;
      }
      if (v14 >= v8) {
        goto LABEL_32;
      }
      unint64_t v15 = v30[v14];
      ++v11;
      if (!v15)
      {
        int64_t v11 = v14 + 1;
        if (v14 + 1 >= v8) {
          goto LABEL_32;
        }
        unint64_t v15 = v30[v11];
        if (!v15)
        {
          int64_t v11 = v14 + 2;
          if (v14 + 2 >= v8) {
            goto LABEL_32;
          }
          unint64_t v15 = v30[v11];
          if (!v15)
          {
            int64_t v16 = v14 + 3;
            if (v16 >= v8)
            {
LABEL_32:
              swift_release();
              uint64_t v1 = v0;
              uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
              if (v29 > 63) {
                specialized UnsafeMutablePointer.assign(repeating:count:)(0, (unint64_t)(v29 + 63) >> 6, v30);
              }
              else {
                *unint64_t v30 = -1 << v29;
              }
              *(void *)(v2 + 16) = 0;
              break;
            }
            unint64_t v15 = v30[v16];
            if (!v15)
            {
              while (1)
              {
                int64_t v11 = v16 + 1;
                if (__OFADD__(v16, 1)) {
                  goto LABEL_39;
                }
                if (v11 >= v8) {
                  goto LABEL_32;
                }
                unint64_t v15 = v30[v11];
                ++v16;
                if (v15) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v11 = v16;
          }
        }
      }
LABEL_20:
      unint64_t v7 = (v15 - 1) & v15;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t specialized closure #1 in _NativeSet.subtracting<A>(_:)(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v6 = *(void *)(a3 + 16);
  *(void *)(result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  unint64_t v30 = (unint64_t *)result;
  uint64_t v31 = v6 - 1;
  uint64_t v8 = *a5;
  unint64_t v7 = a5[1];
  unint64_t v9 = *(void *)(*a5 + 16);
  if (v7 == v9)
  {
LABEL_2:
    swift_retain();
    return specialized _NativeSet.extractSubset(using:count:)(v30, a2, v31, a3);
  }
  uint64_t v32 = a3 + 56;
  while ((v7 & 0x8000000000000000) == 0)
  {
    if (v7 >= v9) {
      goto LABEL_30;
    }
    uint64_t v11 = v8 + 16 * v7;
    uint64_t v13 = *(void *)(v11 + 32);
    uint64_t v12 = *(void *)(v11 + 40);
    a5[1] = v7 + 1;
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    Swift::Int v14 = Hasher._finalize()();
    uint64_t v15 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v16 = v14 & ~v15;
    unint64_t v17 = v16 >> 6;
    uint64_t v18 = 1 << v16;
    if (((1 << v16) & *(void *)(v32 + 8 * (v16 >> 6))) == 0) {
      goto LABEL_25;
    }
    uint64_t v19 = *(void *)(a3 + 48);
    uint64_t v20 = (void *)(v19 + 16 * v16);
    BOOL v21 = *v20 == v13 && v20[1] == v12;
    if (!v21 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v24 = ~v15;
      for (unint64_t i = v16 + 1; ; unint64_t i = v26 + 1)
      {
        unint64_t v26 = i & v24;
        if (((*(void *)(v32 + (((i & v24) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v24)) & 1) == 0) {
          break;
        }
        uint64_t v27 = (void *)(v19 + 16 * v26);
        BOOL v28 = *v27 == v13 && v27[1] == v12;
        if (v28 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        {
          uint64_t result = swift_bridgeObjectRelease();
          unint64_t v17 = v26 >> 6;
          uint64_t v18 = 1 << v26;
          goto LABEL_13;
        }
      }
LABEL_25:
      uint64_t result = swift_bridgeObjectRelease();
      goto LABEL_26;
    }
    uint64_t result = swift_bridgeObjectRelease();
LABEL_13:
    unint64_t v22 = v30[v17];
    v30[v17] = v22 & ~v18;
    if ((v18 & v22) != 0)
    {
      uint64_t v23 = v31 - 1;
      if (__OFSUB__(v31, 1)) {
        goto LABEL_31;
      }
      --v31;
      if (!v23) {
        return MEMORY[0x263F8EE88];
      }
    }
LABEL_26:
    uint64_t v8 = *a5;
    unint64_t v7 = a5[1];
    unint64_t v9 = *(void *)(*a5 + 16);
    if (v7 == v9) {
      goto LABEL_2;
    }
  }
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
  return result;
}

uint64_t specialized _NativeSet.extractSubset(using:count:)(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v8 = MEMORY[0x263F8EE88];
LABEL_35:
    swift_release();
    return v8;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<String>);
  uint64_t result = static _SetStorage.allocate(capacity:)();
  uint64_t v8 = result;
  uint64_t v30 = a2;
  if (a2 < 1) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = *a1;
  }
  uint64_t v10 = 0;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    uint64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      goto LABEL_39;
    }
    if (v14 >= v30) {
      goto LABEL_35;
    }
    unint64_t v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      uint64_t v10 = v14 + 1;
      if (v14 + 1 >= v30) {
        goto LABEL_35;
      }
      unint64_t v15 = a1[v10];
      if (!v15)
      {
        uint64_t v10 = v14 + 2;
        if (v14 + 2 >= v30) {
          goto LABEL_35;
        }
        unint64_t v15 = a1[v10];
        if (!v15) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    unint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v13);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v20 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6))) == 0)
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v11 + 8 * v22);
        if (v27 != -1)
        {
          unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_33;
        }
      }
      __break(1u);
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_33:
    *(void *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    BOOL v28 = (void *)(*(void *)(v8 + 48) + 16 * v23);
    *BOOL v28 = v18;
    v28[1] = v19;
    ++*(void *)(v8 + 16);
    if (__OFSUB__(v5--, 1)) {
      goto LABEL_38;
    }
    if (!v5) {
      goto LABEL_35;
    }
  }
  uint64_t v16 = v14 + 3;
  if (v16 >= v30) {
    goto LABEL_35;
  }
  unint64_t v15 = a1[v16];
  if (v15)
  {
    uint64_t v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v10 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v10 >= v30) {
      goto LABEL_35;
    }
    unint64_t v15 = a1[v10];
    ++v16;
    if (v15) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t specialized UnsafeMutablePointer.assign(repeating:count:)(uint64_t result, uint64_t a2, void *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

uint64_t specialized _NativeSet.intersection(_:)(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v3 = isStackAllocationSafe;
  v10[1] = *MEMORY[0x263EF8340];
  char v4 = *(unsigned char *)(a2 + 32);
  unint64_t v5 = (unint64_t)((1 << v4) + 63) >> 6;
  if ((v4 & 0x3Fu) <= 0xD
    || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    uint64_t v6 = (void *)((char *)v10 - ((8 * v5 + 15) & 0x3FFFFFFFFFFFFFF0));
    specialized UnsafeMutablePointer.assign(repeating:count:)(0, v5, v6);
    uint64_t v7 = specialized closure #1 in _NativeSet.intersection(_:)((uint64_t)v6, v5, a2, v3);
    swift_release();
  }
  else
  {
    uint64_t v8 = (void *)swift_slowAlloc();
    specialized UnsafeMutablePointer.assign(repeating:count:)(0, v5, v8);
    uint64_t v7 = specialized closure #1 in _NativeSet.intersection(_:)((uint64_t)v8, v5, a2, v3);
    swift_release();
    MEMORY[0x223C2EF70](v8, -1, -1);
  }
  return v7;
}

uint64_t specialized closure #1 in _NativeSet.intersection(_:)(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  uint64_t v57 = (unint64_t *)result;
  if (*(void *)(a4 + 16) >= *(void *)(a3 + 16))
  {
    int64_t v34 = 0;
    uint64_t v60 = a3 + 56;
    uint64_t v61 = 0;
    uint64_t v35 = 1 << *(unsigned char *)(a3 + 32);
    if (v35 < 64) {
      uint64_t v36 = ~(-1 << v35);
    }
    else {
      uint64_t v36 = -1;
    }
    unint64_t v37 = v36 & *(void *)(a3 + 56);
    int64_t v63 = (unint64_t)(v35 + 63) >> 6;
    uint64_t v38 = a4 + 56;
    while (1)
    {
      while (1)
      {
        if (v37)
        {
          unint64_t v39 = __clz(__rbit64(v37));
          v37 &= v37 - 1;
          unint64_t v40 = v39 | (v34 << 6);
        }
        else
        {
          int64_t v41 = v34 + 1;
          if (__OFADD__(v34, 1))
          {
LABEL_81:
            __break(1u);
LABEL_82:
            __break(1u);
LABEL_83:
            __break(1u);
            goto LABEL_84;
          }
          if (v41 >= v63) {
            goto LABEL_79;
          }
          unint64_t v42 = *(void *)(v60 + 8 * v41);
          ++v34;
          if (!v42)
          {
            int64_t v34 = v41 + 1;
            if (v41 + 1 >= v63) {
              goto LABEL_79;
            }
            unint64_t v42 = *(void *)(v60 + 8 * v34);
            if (!v42)
            {
              int64_t v34 = v41 + 2;
              if (v41 + 2 >= v63) {
                goto LABEL_79;
              }
              unint64_t v42 = *(void *)(v60 + 8 * v34);
              if (!v42)
              {
                int64_t v43 = v41 + 3;
                if (v43 >= v63) {
                  goto LABEL_79;
                }
                unint64_t v42 = *(void *)(v60 + 8 * v43);
                if (!v42)
                {
                  while (1)
                  {
                    int64_t v34 = v43 + 1;
                    if (__OFADD__(v43, 1)) {
                      goto LABEL_85;
                    }
                    if (v34 >= v63) {
                      break;
                    }
                    unint64_t v42 = *(void *)(v60 + 8 * v34);
                    ++v43;
                    if (v42) {
                      goto LABEL_61;
                    }
                  }
LABEL_79:
                  swift_retain();
                  return specialized _NativeSet.extractSubset(using:count:)(v57, a2, v61, v5);
                }
                int64_t v34 = v43;
              }
            }
          }
LABEL_61:
          unint64_t v37 = (v42 - 1) & v42;
          unint64_t v40 = __clz(__rbit64(v42)) + (v34 << 6);
        }
        id v44 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v40);
        uint64_t v46 = *v44;
        uint64_t v45 = v44[1];
        Hasher.init(_seed:)();
        swift_bridgeObjectRetain();
        String.hash(into:)();
        Swift::Int v47 = Hasher._finalize()();
        uint64_t v48 = -1 << *(unsigned char *)(v4 + 32);
        unint64_t v49 = v47 & ~v48;
        if ((*(void *)(v38 + ((v49 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v49)) {
          break;
        }
LABEL_78:
        uint64_t result = swift_bridgeObjectRelease();
        uint64_t v5 = a3;
        uint64_t v4 = a4;
      }
      uint64_t v50 = *(void *)(a4 + 48);
      uint64_t v51 = (void *)(v50 + 16 * v49);
      BOOL v52 = *v51 == v46 && v51[1] == v45;
      if (!v52 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
      {
        uint64_t v53 = ~v48;
        do
        {
          unint64_t v49 = (v49 + 1) & v53;
          if (((*(void *)(v38 + ((v49 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v49) & 1) == 0) {
            goto LABEL_78;
          }
          uint64_t v54 = (void *)(v50 + 16 * v49);
          BOOL v55 = *v54 == v46 && v54[1] == v45;
        }
        while (!v55 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
      }
      uint64_t result = swift_bridgeObjectRelease();
      *(unint64_t *)((char *)v57 + ((v40 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v40;
      BOOL v33 = __OFADD__(v61++, 1);
      uint64_t v5 = a3;
      uint64_t v4 = a4;
      if (v33) {
        goto LABEL_83;
      }
    }
  }
  int64_t v6 = 0;
  uint64_t v58 = a4 + 56;
  uint64_t v7 = 1 << *(unsigned char *)(a4 + 32);
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 56);
  int64_t v59 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v61 = 0;
  uint64_t v10 = a3 + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v11 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      int64_t v62 = v6;
      unint64_t v12 = v11 | (v6 << 6);
      goto LABEL_22;
    }
    int64_t v13 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      goto LABEL_81;
    }
    if (v13 >= v59) {
      goto LABEL_79;
    }
    unint64_t v14 = *(void *)(v58 + 8 * v13);
    int64_t v15 = v6 + 1;
    if (!v14)
    {
      int64_t v15 = v6 + 2;
      if (v6 + 2 >= v59) {
        goto LABEL_79;
      }
      unint64_t v14 = *(void *)(v58 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v6 + 3;
        if (v6 + 3 >= v59) {
          goto LABEL_79;
        }
        unint64_t v14 = *(void *)(v58 + 8 * v15);
        if (!v14) {
          break;
        }
      }
    }
LABEL_21:
    unint64_t v9 = (v14 - 1) & v14;
    int64_t v62 = v15;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
LABEL_22:
    unint64_t v17 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    Swift::Int v20 = Hasher._finalize()();
    uint64_t v21 = -1 << *(unsigned char *)(v5 + 32);
    unint64_t v22 = v20 & ~v21;
    unint64_t v23 = v22 >> 6;
    uint64_t v24 = 1 << v22;
    if (((1 << v22) & *(void *)(v10 + 8 * (v22 >> 6))) == 0) {
      goto LABEL_36;
    }
    uint64_t v25 = *(void *)(a3 + 48);
    BOOL v26 = (void *)(v25 + 16 * v22);
    BOOL v27 = *v26 == v19 && v26[1] == v18;
    if (v27 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      uint64_t result = swift_bridgeObjectRelease();
LABEL_38:
      int64_t v6 = v62;
      uint64_t v5 = a3;
      v57[v23] |= v24;
      BOOL v33 = __OFADD__(v61++, 1);
      uint64_t v4 = a4;
      if (v33) {
        goto LABEL_82;
      }
    }
    else
    {
      uint64_t v28 = ~v21;
      for (unint64_t i = v22 + 1; ; unint64_t i = v30 + 1)
      {
        unint64_t v30 = i & v28;
        if (((*(void *)(v10 + (((i & v28) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v28)) & 1) == 0) {
          break;
        }
        uint64_t v31 = (void *)(v25 + 16 * v30);
        BOOL v32 = *v31 == v19 && v31[1] == v18;
        if (v32 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        {
          uint64_t result = swift_bridgeObjectRelease();
          unint64_t v23 = v30 >> 6;
          uint64_t v24 = 1 << v30;
          goto LABEL_38;
        }
      }
LABEL_36:
      uint64_t result = swift_bridgeObjectRelease();
      int64_t v6 = v62;
      uint64_t v5 = a3;
      uint64_t v4 = a4;
    }
  }
  uint64_t v16 = v6 + 4;
  if (v6 + 4 >= v59) {
    goto LABEL_79;
  }
  unint64_t v14 = *(void *)(v58 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v6 + 4;
    goto LABEL_21;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v59) {
      goto LABEL_79;
    }
    unint64_t v14 = *(void *)(v58 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_21;
    }
  }
LABEL_84:
  __break(1u);
LABEL_85:
  __break(1u);
  return result;
}

Swift::Int specialized _NativeSet.insertNew(_:at:isUnique:)(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  Swift::Int v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    specialized _NativeSet.resize(capacity:)();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)specialized _NativeSet.copy()();
      goto LABEL_22;
    }
    specialized _NativeSet.copyAndResize(capacity:)();
  }
  uint64_t v11 = *v4;
  Hasher.init(_seed:)();
  String.hash(into:)();
  uint64_t result = Hasher._finalize()();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    int64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        uint64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  uint64_t v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  *uint64_t v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

void *specialized _NativeSet.copy()()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<String>);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = *(void *)(v2 + 56);
  uint64_t v12 = -1;
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  unint64_t v13 = v12 & v11;
  int64_t v14 = (unint64_t)(v10 + 63) >> 6;
  if ((v12 & v11) == 0) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (unint64_t i = v15 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    uint64_t v20 = (void *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v21 = v20[1];
    uint64_t v22 = (void *)(*(void *)(v4 + 48) + 16 * i);
    *uint64_t v22 = *v20;
    v22[1] = v21;
    uint64_t result = (void *)swift_bridgeObjectRetain();
    if (v13) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v17 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v14) {
        goto LABEL_28;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18)
      {
        int64_t v9 = v17 + 2;
        if (v17 + 2 >= v14) {
          goto LABEL_28;
        }
        unint64_t v18 = *(void *)(v6 + 8 * v9);
        if (!v18) {
          break;
        }
      }
    }
LABEL_25:
    unint64_t v13 = (v18 - 1) & v18;
  }
  int64_t v19 = v17 + 3;
  if (v19 >= v14) {
    goto LABEL_28;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t specialized _NativeSet.copyAndResize(capacity:)()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<String>);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  if (!v8) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v12 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v12 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v11 << 6))
  {
    int64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v18 = *v17;
    uint64_t v19 = v17[1];
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6))) == 0)
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v9 + 8 * v22);
        if (v27 != -1)
        {
          unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    uint64_t v28 = (void *)(*(void *)(v4 + 48) + 16 * v23);
    *uint64_t v28 = v18;
    v28[1] = v19;
    ++*(void *)(v4 + 16);
    if (v8) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v14 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_36;
    }
    if (v14 >= v29) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v14);
    ++v11;
    if (!v15)
    {
      int64_t v11 = v14 + 1;
      if (v14 + 1 >= v29) {
        goto LABEL_32;
      }
      unint64_t v15 = *(void *)(v6 + 8 * v11);
      if (!v15)
      {
        int64_t v11 = v14 + 2;
        if (v14 + 2 >= v29) {
          goto LABEL_32;
        }
        unint64_t v15 = *(void *)(v6 + 8 * v11);
        if (!v15) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v8 = (v15 - 1) & v15;
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_32:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_34;
  }
  unint64_t v15 = *(void *)(v6 + 8 * v16);
  if (v15)
  {
    int64_t v11 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v11 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v11);
    ++v16;
    if (v15) {
      goto LABEL_20;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

void *specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  uint64_t v3 = (void *)swift_allocObject();
  size_t v4 = _swift_stdlib_malloc_size(v3);
  _OWORD v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 16);
  uint64_t v5 = specialized Sequence._copySequenceContents(initializing:)((uint64_t)&v7, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  outlined consume of Set<String>.Iterator._Variant();
  if (v5 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

char *specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char *a1, int64_t a2, char a3)
{
  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

char *specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = v10 + 32;
  unint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    specialized UnsafeMutablePointer.moveInitialize(from:count:)(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    specialized UnsafeMutablePointer.initialize(from:count:)((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

uint64_t specialized Sequence._copySequenceContents(initializing:)(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  char v5 = (void *)result;
  uint64_t v6 = a4 + 56;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *char v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  size_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    uint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *size_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t outlined consume of Set<String>.Iterator._Variant()
{
  return swift_release();
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  return outlined consume of Policy?(v0);
}

void OUTLINED_FUNCTION_2_1()
{
  JUMPOUT(0x223C2EF70);
}

id OUTLINED_FUNCTION_3_1(uint64_t a1)
{
  return objc_msgSend(v1, (SEL)(v2 + 1432), a1);
}

uint64_t OUTLINED_FUNCTION_8_1()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_9_1()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_10_1()
{
  return static Logger.logger.getter();
}

void OUTLINED_FUNCTION_11_1()
{
  *(void *)(v0 - 192) = 0;
  *(void *)(v0 - 184) = 0;
  *(void *)(v0 - 176) = 0;
  *(void *)(v0 - 168) = 1;
}

BOOL OUTLINED_FUNCTION_12_0(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

void OUTLINED_FUNCTION_13_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_15_0()
{
  return 0x776F6C6C41435544;
}

uint64_t OUTLINED_FUNCTION_16_0()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_17_0()
{
  return 0x6C6C41796E6544;
}

id OUTLINED_FUNCTION_18()
{
  return objc_msgSend(v1, (SEL)(v0 + 1944), v2 + 1432);
}

uint64_t OUTLINED_FUNCTION_19_0()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_20_0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 136);
  return outlined consume of Policy?(v2);
}

uint64_t OUTLINED_FUNCTION_21_0()
{
  return v0 - 104;
}

uint64_t OUTLINED_FUNCTION_23_0()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_25_0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return outlined init with take of Any??(v3 - 160, v3 - 128, a3);
}

uint64_t OUTLINED_FUNCTION_27(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return outlined init with take of Any??(v3 - 192, v3 - 160, a3);
}

uint64_t OUTLINED_FUNCTION_29_0()
{
  return type metadata accessor for Logger();
}

_WORD *OUTLINED_FUNCTION_30_0(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

uint64_t SiriEnvironment.homeKitProvider.getter()
{
  type metadata accessor for HomeKitProvider();
  lazy protocol witness table accessor for type HomeKitProvider and conformance HomeKitProvider(&lazy protocol witness table cache variable for type HomeKitProvider and conformance HomeKitProvider);
  return dispatch thunk of SiriEnvironment.subscript.getter();
}

uint64_t type metadata accessor for HomeKitProvider()
{
  return self;
}

uint64_t key path setter for SiriEnvironment.homeKitProvider : SiriEnvironment()
{
  return SiriEnvironment.homeKitProvider.setter();
}

uint64_t SiriEnvironment.homeKitProvider.setter()
{
  type metadata accessor for HomeKitProvider();
  lazy protocol witness table accessor for type HomeKitProvider and conformance HomeKitProvider(&lazy protocol witness table cache variable for type HomeKitProvider and conformance HomeKitProvider);
  return dispatch thunk of SiriEnvironment.subscript.setter();
}

uint64_t (*SiriEnvironment.homeKitProvider.modify(uint64_t *a1))(uint64_t a1, char a2)
{
  a1[1] = v1;
  a1[2] = type metadata accessor for HomeKitProvider();
  a1[3] = lazy protocol witness table accessor for type HomeKitProvider and conformance HomeKitProvider(&lazy protocol witness table cache variable for type HomeKitProvider and conformance HomeKitProvider);
  *a1 = dispatch thunk of SiriEnvironment.subscript.getter();
  return SiriEnvironment.currentRequest.modify;
}

unint64_t protocol witness for HomeKitHelperProtocol.areHomesConfigured() in conformance HomeKitHelper()
{
  return (unint64_t)@nonobjc HomeKitHelper.areHomesConfigured()() & 1;
}

id @nonobjc HomeKitHelper.areHomesConfigured()()
{
  return objc_msgSend(v0, sel_areHomesConfigured);
}

unint64_t protocol witness for HomeKitHelperProtocol.areAnyAccessoriesConfigured() in conformance HomeKitHelper()
{
  return (unint64_t)@nonobjc HomeKitHelper.areAnyAccessoriesConfigured()() & 1;
}

id @nonobjc HomeKitHelper.areAnyAccessoriesConfigured()()
{
  return objc_msgSend(v0, sel_areAnyAccessoriesConfigured);
}

unint64_t protocol witness for HomeKitHelperProtocol.areAnySpeakersConfigured() in conformance HomeKitHelper()
{
  return (unint64_t)@nonobjc HomeKitHelper.areAnySpeakersConfigured()() & 1;
}

id @nonobjc HomeKitHelper.areAnySpeakersConfigured()()
{
  return objc_msgSend(v0, sel_areAnySpeakersConfigured);
}

uint64_t key path setter for HomeKitProvider.mock : HomeKitProvider(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))(**(void **)a2 + 128);
  uint64_t v3 = swift_retain();
  return v2(v3);
}

uint64_t HomeKitProvider.mock.getter()
{
  return swift_retain();
}

uint64_t HomeKitProvider.mock.setter(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 16) = a1;
  return swift_release();
}

uint64_t key path getter for HomeKitProvider.homeKitHelper : HomeKitProvider(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 144))();
}

uint64_t key path setter for HomeKitProvider.homeKitHelper : HomeKitProvider(uint64_t a1, uint64_t a2)
{
  outlined init with copy of SiriLocationProvider(a1, (uint64_t)v4);
  return (*(uint64_t (**)(unsigned char *))(**(void **)a2 + 152))(v4);
}

uint64_t HomeKitProvider.homeKitHelper.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<HomeKitHelperProtocol>);
  swift_getKeyPath();
  swift_getKeyPath();
  lazy protocol witness table accessor for type HomeKitProvider and conformance HomeKitProvider(&lazy protocol witness table cache variable for type HomeKitProvider and conformance HomeKitProvider);
  static MockablePublished.subscript.getter();
  swift_release();
  return swift_release();
}

uint64_t sub_21E6A4E40()
{
  OUTLINED_FUNCTION_6_2();
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t HomeKitProvider.homeKitHelper.setter(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<HomeKitHelperProtocol>);
  swift_getKeyPath();
  swift_getKeyPath();
  outlined init with copy of SiriLocationProvider(a1, (uint64_t)v3);
  lazy protocol witness table accessor for type HomeKitProvider and conformance HomeKitProvider(&lazy protocol witness table cache variable for type HomeKitProvider and conformance HomeKitProvider);
  swift_retain();
  static MockablePublished.subscript.setter();
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

void (*HomeKitProvider.homeKitHelper.modify(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<HomeKitHelperProtocol>);
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  lazy protocol witness table accessor for type HomeKitProvider and conformance HomeKitProvider(&lazy protocol witness table cache variable for type HomeKitProvider and conformance HomeKitProvider);
  v2[6] = static MockablePublished.subscript.modify();
  return CurrentRequest.refId.modify;
}

uint64_t key path setter for HomeKitProvider.$homeKitHelper : HomeKitProvider(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<HomeKitHelperProtocol>.Publisher);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(void **)a2 + 176))(v6);
}

uint64_t HomeKitProvider.$homeKitHelper.getter()
{
  return swift_release();
}

uint64_t HomeKitProvider.$homeKitHelper.setter(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<HomeKitHelperProtocol>.Publisher);
  OUTLINED_FUNCTION_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, a1, v2);
  swift_retain();
  dispatch thunk of MockablePublished.projectedValue.setter();
  swift_release();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

void (*HomeKitProvider.$homeKitHelper.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  *uint64_t v3 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<HomeKitHelperProtocol>.Publisher);
  v3[1] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  _OWORD v3[2] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[3] = malloc(v6);
  v3[4] = malloc(v6);
  HomeKitProvider.$homeKitHelper.getter();
  return HomeKitProvider.$homeKitHelper.modify;
}

void HomeKitProvider.$homeKitHelper.modify(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void **)(*(void *)a1 + 24);
  uint64_t v4 = *(void **)(*(void *)a1 + 32);
  if (a2)
  {
    uint64_t v5 = v2[1];
    uint64_t v6 = v2[2];
    (*(void (**)(void, void *, uint64_t))(v6 + 16))(*(void *)(*(void *)a1 + 24), v4, v5);
    HomeKitProvider.$homeKitHelper.setter((uint64_t)v3);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
  }
  else
  {
    HomeKitProvider.$homeKitHelper.setter(*(void *)(*(void *)a1 + 32));
  }
  free(v4);
  free(v3);
  free(v2);
}

uint64_t HomeKitProvider.__allocating_init(storage:)()
{
  uint64_t v0 = swift_allocObject();
  HomeKitProvider.init(storage:)();
  return v0;
}

uint64_t HomeKitProvider.init(storage:)()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  OUTLINED_FUNCTION_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = &v23[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  *(void *)(v0 + 16) = 0;
  id v8 = objc_msgSend(objc_allocWithZone((Class)HomeKitHelper), sel_init);
  v24[3] = type metadata accessor for HomeKitHelper();
  v24[4] = &protocol witness table for HomeKitHelper;
  v24[0] = v8;
  outlined init with copy of SiriLocationProvider((uint64_t)v24, (uint64_t)v23);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MockablePublished<HomeKitHelperProtocol>);
  swift_allocObject();
  id v9 = v8;
  uint64_t v10 = MockablePublished.init(wrappedValue:)();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);

  *(void *)(v1 + 24) = v10;
  *(_WORD *)(v1 + 32) = 0;
  *(unsigned char *)(v1 + 34) = 0;
  static Logger.logger.getter();
  size_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_21E680000, v11, v12, "HomeKitProvider init", v13, 2u);
    MEMORY[0x223C2EF70](v13, -1, -1);
  }

  (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v7, v2);
  int64_t v14 = *(void (**)(void))(*(void *)v1 + 144);
  OUTLINED_FUNCTION_3_2();
  v14();
  OUTLINED_FUNCTION_5_1();
  uint64_t v15 = OUTLINED_FUNCTION_1_3();
  *(unsigned char *)(v1 + 32) = v16(v15) & 1;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
  OUTLINED_FUNCTION_3_2();
  v14();
  OUTLINED_FUNCTION_5_1();
  uint64_t v17 = OUTLINED_FUNCTION_1_3();
  *(unsigned char *)(v1 + 33) = v18(v17) & 1;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
  OUTLINED_FUNCTION_3_2();
  v14();
  OUTLINED_FUNCTION_5_1();
  uint64_t v19 = OUTLINED_FUNCTION_1_3();
  char v21 = v20(v19);
  swift_release();
  *(unsigned char *)(v1 + 34) = v21 & 1;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
  return v1;
}

unint64_t type metadata accessor for HomeKitHelper()
{
  unint64_t result = lazy cache variable for type metadata for HomeKitHelper;
  if (!lazy cache variable for type metadata for HomeKitHelper)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for HomeKitHelper);
  }
  return result;
}

Swift::Bool __swiftcall HomeKitProvider.areHomesConfigured(refresh:)(Swift::Bool refresh)
{
  if (refresh)
  {
    OUTLINED_FUNCTION_4_1();
    v2();
    __swift_project_boxed_opaque_existential_1(v6, v6[3]);
    uint64_t v3 = OUTLINED_FUNCTION_2_2();
    *(unsigned char *)(v1 + 32) = v4(v3) & 1;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  }
  return *(unsigned char *)(v1 + 32);
}

Swift::Bool __swiftcall HomeKitProvider.areAnyAccessoriesConfigured(refresh:)(Swift::Bool refresh)
{
  if (refresh)
  {
    OUTLINED_FUNCTION_4_1();
    v2();
    __swift_project_boxed_opaque_existential_1(v6, v6[3]);
    uint64_t v3 = OUTLINED_FUNCTION_2_2();
    *(unsigned char *)(v1 + 33) = v4(v3) & 1;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  }
  return *(unsigned char *)(v1 + 33);
}

Swift::Bool __swiftcall HomeKitProvider.areAnySpeakersConfigured(refresh:)(Swift::Bool refresh)
{
  if (refresh)
  {
    OUTLINED_FUNCTION_4_1();
    v2();
    __swift_project_boxed_opaque_existential_1(v6, v6[3]);
    uint64_t v3 = OUTLINED_FUNCTION_2_2();
    *(unsigned char *)(v1 + 34) = v4(v3) & 1;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  }
  return *(unsigned char *)(v1 + 34);
}

uint64_t HomeKitProvider.debugInfo.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_21E6ACEF0;
  *(void *)(v1 + 32) = 0xD000000000000035;
  *(void *)(v1 + 40) = 0x800000021E6AEEF0;
  _StringGuts.grow(_:)(22);
  swift_bridgeObjectRelease();
  if (v0[32]) {
    uint64_t v2 = 1702195828;
  }
  else {
    uint64_t v2 = 0x65736C6166;
  }
  if (v0[32]) {
    unint64_t v3 = 0xE400000000000000;
  }
  else {
    unint64_t v3 = 0xE500000000000000;
  }
  unint64_t v4 = v3;
  String.append(_:)(*(Swift::String *)&v2);
  swift_bridgeObjectRelease();
  *(void *)(v1 + 48) = 0xD000000000000014;
  *(void *)(v1 + 56) = 0x800000021E6AEF30;
  _StringGuts.grow(_:)(31);
  swift_bridgeObjectRelease();
  if (v0[33]) {
    uint64_t v5 = 1702195828;
  }
  else {
    uint64_t v5 = 0x65736C6166;
  }
  if (v0[33]) {
    unint64_t v6 = 0xE400000000000000;
  }
  else {
    unint64_t v6 = 0xE500000000000000;
  }
  unint64_t v7 = v6;
  String.append(_:)(*(Swift::String *)&v5);
  swift_bridgeObjectRelease();
  *(void *)(v1 + 64) = 0xD00000000000001DLL;
  *(void *)(v1 + 72) = 0x800000021E6AEF50;
  _StringGuts.grow(_:)(28);
  swift_bridgeObjectRelease();
  if (v0[34]) {
    uint64_t v8 = 1702195828;
  }
  else {
    uint64_t v8 = 0x65736C6166;
  }
  if (v0[34]) {
    unint64_t v9 = 0xE400000000000000;
  }
  else {
    unint64_t v9 = 0xE500000000000000;
  }
  unint64_t v10 = v9;
  String.append(_:)(*(Swift::String *)&v8);
  swift_bridgeObjectRelease();
  *(void *)(v1 + 80) = 0xD00000000000001ALL;
  *(void *)(v1 + 88) = 0x800000021E6AEF70;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
  lazy protocol witness table accessor for type [String] and conformance [A]();
  uint64_t v11 = BidirectionalCollection<>.joined(separator:)();
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t HomeKitProvider.deinit()
{
  swift_release();
  swift_release();
  return v0;
}

uint64_t HomeKitProvider.__deallocating_deinit()
{
  HomeKitProvider.deinit();
  return MEMORY[0x270FA0228](v0, 35, 7);
}

uint64_t protocol witness for MockableEnvironmentProvider.mock.getter in conformance HomeKitProvider()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t protocol witness for MockableEnvironmentProvider.mock.setter in conformance HomeKitProvider()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

void (*protocol witness for MockableEnvironmentProvider.mock.modify in conformance HomeKitProvider(void *a1))(void *a1)
{
  unint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = (*(uint64_t (**)(void))(*(void *)v1 + 136))();
  return protocol witness for MockableEnvironmentProvider.mock.modify in conformance HomeKitProvider;
}

void protocol witness for MockableEnvironmentProvider.mock.modify in conformance HomeKitProvider(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t protocol witness for MockableEnvironmentProvider.mock<A>(override:run:) in conformance HomeKitProvider()
{
  return MockableEnvironmentProvider.mock<A>(override:run:)();
}

uint64_t protocol witness for MockableEnvironmentProvider.install(_:) in conformance HomeKitProvider(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for HomeKitProvider();
  return MEMORY[0x270F72C58](a1, v2);
}

uint64_t protocol witness for static MockableEnvironmentProvider.adjustMock(_:) in conformance HomeKitProvider()
{
  type metadata accessor for HomeKitProvider();
  return swift_retain();
}

uint64_t protocol witness for static SiriEnvironmentProvider.defaultScope.getter in conformance HomeKitProvider(uint64_t a1)
{
  return MEMORY[0x270F72960](a1);
}

uint64_t protocol witness for SiriEnvironmentProvider.init(storage:) in conformance HomeKitProvider()
{
  return (*(uint64_t (**)(void))(v0 + 264))();
}

uint64_t protocol witness for ObservableObject.objectWillChange.getter in conformance HomeKitProvider@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for HomeKitProvider();
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
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

uint64_t base witness table accessor for SiriEnvironmentProvider in HomeKitProvider()
{
  return lazy protocol witness table accessor for type HomeKitProvider and conformance HomeKitProvider(&lazy protocol witness table cache variable for type HomeKitProvider and conformance HomeKitProvider);
}

uint64_t base witness table accessor for ObservableObject in HomeKitProvider()
{
  return lazy protocol witness table accessor for type HomeKitProvider and conformance HomeKitProvider(&lazy protocol witness table cache variable for type HomeKitProvider and conformance HomeKitProvider);
}

uint64_t lazy protocol witness table accessor for type HomeKitProvider and conformance HomeKitProvider(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for HomeKitProvider();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21E6A5E70@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SiriEnvironment.homeKitProvider.getter();
  *a1 = result;
  return result;
}

uint64_t sub_21E6A5EA0@<X0>(uint64_t *a1@<X8>)
{
  OUTLINED_FUNCTION_6_2();
  uint64_t result = (*(uint64_t (**)(void))(v2 + 120))();
  *a1 = result;
  return result;
}

uint64_t sub_21E6A5EE8()
{
  OUTLINED_FUNCTION_6_2();
  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t dispatch thunk of HomeKitHelperProtocol.areHomesConfigured()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of HomeKitHelperProtocol.areAnyAccessoriesConfigured()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of HomeKitHelperProtocol.areAnySpeakersConfigured()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t method lookup function for HomeKitProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HomeKitProvider);
}

uint64_t dispatch thunk of HomeKitProvider.mock.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of HomeKitProvider.mock.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of HomeKitProvider.mock.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of HomeKitProvider.homeKitHelper.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of HomeKitProvider.homeKitHelper.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of HomeKitProvider.homeKitHelper.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of HomeKitProvider.$homeKitHelper.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of HomeKitProvider.$homeKitHelper.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of HomeKitProvider.$homeKitHelper.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of HomeKitProvider.__allocating_init(storage:)()
{
  return (*(uint64_t (**)(void))(v0 + 264))();
}

uint64_t dispatch thunk of HomeKitProvider.areHomesConfigured(refresh:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

uint64_t dispatch thunk of HomeKitProvider.areAnyAccessoriesConfigured(refresh:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 280))();
}

uint64_t dispatch thunk of HomeKitProvider.areAnySpeakersConfigured(refresh:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 288))();
}

uint64_t dispatch thunk of HomeKitProvider.debugInfo.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 296))();
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  return v0;
}

void *OUTLINED_FUNCTION_5_1()
{
  return __swift_project_boxed_opaque_existential_1((void *)(v0 - 104), *(void *)(v0 - 80));
}

uint64_t TapToRadarManager.init()()
{
  v0[2] = 0;
  v0[3] = 0xE000000000000000;
  v0[4] = Dictionary.init(dictionaryLiteral:)();
  v0[5] = 0;
  v0[6] = 0xE000000000000000;
  v0[7] = 0xD000000000000014;
  v0[8] = 0x800000021E6AF020;
  v0[9] = 0x7274745F69726973;
  v0[10] = 0xE800000000000000;
  v0[11] = 0x726F727265;
  v0[12] = 0xE500000000000000;
  v0[13] = 40;
  v0[14] = swift_slowAlloc();
  uint64_t result = GetSystemBuildVersionString();
  if (result)
  {
    v0[15] = String.init(cString:)();
    v0[16] = v2;
    return (uint64_t)v0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void TapToRadarManager.createProblem(errStatus:userDefaultSuiteName:radarComponentInfo:title:description:radarFilingExtras:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  OUTLINED_FUNCTION_60();
  uint64_t v26 = v24;
  uint64_t v61 = v27;
  uint64_t v65 = v28;
  uint64_t v62 = v29;
  uint64_t v31 = v30;
  uint64_t v64 = v32;
  uint64_t v59 = v33;
  uint64_t v63 = v34;
  uint64_t v58 = v35;
  OUTLINED_FUNCTION_6_1();
  uint64_t v60 = v36;
  type metadata accessor for DispatchWorkItemFlags();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v37);
  OUTLINED_FUNCTION_6();
  uint64_t v40 = v39 - v38;
  type metadata accessor for DispatchQoS();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v41);
  uint64_t v42 = OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_0();
  uint64_t v44 = v43;
  MEMORY[0x270FA5388](v45);
  OUTLINED_FUNCTION_6();
  uint64_t v48 = v47 - v46;
  long long v49 = v31[1];
  long long v67 = *v31;
  long long v68 = v49;
  uint64_t v69 = *((void *)v31 + 4);
  outlined init with take of RadarFilingExtras?(a22, (uint64_t)v70, &demangling cache variable for type metadata for RadarFilingExtras?);
  static Logger.logger.getter();
  uint64_t v50 = Logger.logObject.getter();
  os_log_type_t v51 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v50, v51))
  {
    BOOL v52 = (uint8_t *)OUTLINED_FUNCTION_8_1();
    *(_WORD *)BOOL v52 = 0;
    _os_log_impl(&dword_21E680000, v50, v51, "TapToRadarManager#createProblem, attempting to create problem...", v52, 2u);
    OUTLINED_FUNCTION_2_1();
  }

  (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v48, v42);
  if (one-time initialization token for runQueue != -1) {
    swift_once();
  }
  uint64_t v53 = swift_allocObject();
  long long v54 = v68;
  *(_OWORD *)(v53 + 88) = v67;
  *(void *)(v53 + 16) = v26;
  *(void *)(v53 + 24) = v58;
  *(void *)(v53 + 32) = v63;
  *(void *)(v53 + 40) = v59;
  *(void *)(v53 + 48) = v64;
  *(void *)(v53 + 56) = a23;
  *(void *)(v53 + 64) = a24;
  *(void *)(v53 + 72) = v61;
  *(void *)(v53 + 80) = a21;
  *(_OWORD *)(v53 + 104) = v54;
  *(void *)(v53 + 120) = v69;
  *(void *)(v53 + 128) = v62;
  *(void *)(v53 + 136) = v65;
  outlined init with take of RadarFilingExtras?((uint64_t)v70, v53 + 144, &demangling cache variable for type metadata for RadarFilingExtras?);
  *(void *)(v53 + 184) = v60;
  v66[4] = partial apply for closure #1 in TapToRadarManager.createProblem(errStatus:userDefaultSuiteName:radarComponentInfo:title:description:radarFilingExtras:completion:);
  v66[5] = v53;
  v66[0] = MEMORY[0x263EF8330];
  v66[1] = 1107296256;
  v66[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
  v66[3] = &block_descriptor;
  BOOL v55 = _Block_copy(v66);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  outlined retain of TTRComponentInfo((uint64_t)&v67);
  swift_bridgeObjectRetain();
  outlined retain of RadarFilingExtras?(v70);
  static DispatchQoS.unspecified.getter();
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A](&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A], &demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  MEMORY[0x223C2E750](0, v25, v40, v55);
  _Block_release(v55);
  OUTLINED_FUNCTION_24();
  v56();
  OUTLINED_FUNCTION_24();
  v57();
  swift_release();
  OUTLINED_FUNCTION_59();
}

uint64_t TapToRadarManager.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t TapToRadarManager.requestID.getter()
{
  return OUTLINED_FUNCTION_1_4();
}

uint64_t TapToRadarManager.requestID.setter()
{
  OUTLINED_FUNCTION_218();
  OUTLINED_FUNCTION_18_0();
  *(void *)(v1 + 16) = v2;
  *(void *)(v1 + 24) = v0;
  return swift_bridgeObjectRelease();
}

uint64_t (*TapToRadarManager.requestID.modify())()
{
  return CurrentRequest.mock.modify;
}

uint64_t TapToRadarManager.ttrRequestManager.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t TapToRadarManager.ttrRequestManager.setter(uint64_t a1)
{
  OUTLINED_FUNCTION_18_0();
  *(void *)(v1 + 32) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*TapToRadarManager.ttrRequestManager.modify())()
{
  return RefreshableSharedContext.sharedContext.modify;
}

uint64_t TapToRadarManager.requestText.getter()
{
  return OUTLINED_FUNCTION_1_4();
}

uint64_t TapToRadarManager.requestText.setter()
{
  OUTLINED_FUNCTION_218();
  OUTLINED_FUNCTION_18_0();
  *(void *)(v1 + 40) = v2;
  *(void *)(v1 + 48) = v0;
  return swift_bridgeObjectRelease();
}

uint64_t (*TapToRadarManager.requestText.modify())()
{
  return CurrentRequest.mock.modify;
}

Swift::Void __swiftcall TapToRadarManager.populateSiriRequestText()()
{
  OUTLINED_FUNCTION_60();
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags();
  OUTLINED_FUNCTION_0();
  uint64_t v4 = v3;
  MEMORY[0x270FA5388](v5);
  v13[0] = OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_0();
  uint64_t v7 = v6;
  MEMORY[0x270FA5388](v8);
  unint64_t v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for runQueue != -1) {
    swift_once();
  }
  v14[4] = partial apply for closure #1 in TapToRadarManager.populateSiriRequestText();
  v14[5] = v0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 1107296256;
  v14[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
  v14[3] = &block_descriptor_4;
  uint64_t v11 = _Block_copy(v14);
  swift_retain();
  static DispatchQoS.unspecified.getter();
  v13[1] = MEMORY[0x263F8EE78];
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A](&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A], &demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  uint64_t v12 = OUTLINED_FUNCTION_24_1();
  MEMORY[0x223C2E750](v12);
  _Block_release(v11);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v2);
  (*(void (**)(char *, void))(v7 + 8))(v10, v13[0]);
  swift_release();
  OUTLINED_FUNCTION_59();
}

Swift::OpaquePointer_optional __swiftcall TapToRadarManager.getDefaultsContents(userDefaultSuiteName:)(Swift::String userDefaultSuiteName)
{
  uint64_t v2 = v1;
  object = userDefaultSuiteName._object;
  uint64_t countAndFlagsBits = userDefaultSuiteName._countAndFlagsBits;
  objc_allocWithZone(MEMORY[0x263EFFA40]);
  swift_bridgeObjectRetain();
  id v5 = @nonobjc NSUserDefaults.init(suiteName:)(countAndFlagsBits, (uint64_t)object);
  if (!v5)
  {
    long long v12 = 0u;
    long long v13 = 0u;
LABEL_10:
    outlined destroy of AudioSource?((uint64_t)&v12, &demangling cache variable for type metadata for Any?);
    unint64_t v10 = 0;
    goto LABEL_11;
  }
  uint64_t v6 = v5;
  uint64_t v7 = (void *)MEMORY[0x223C2E5C0](*(void *)(v2 + 72), *(void *)(v2 + 80));
  id v8 = objc_msgSend(v6, sel_objectForKey_, v7);

  if (v8)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v11, 0, sizeof(v11));
  }
  outlined init with take of RadarFilingExtras?((uint64_t)v11, (uint64_t)&v12, &demangling cache variable for type metadata for Any?);
  if (!*((void *)&v13 + 1)) {
    goto LABEL_10;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : [String : String]]);
  if (swift_dynamicCast()) {
    unint64_t v10 = *(void **)&v11[0];
  }
  else {
    unint64_t v10 = 0;
  }
LABEL_11:
  result.value._rawValue = v10;
  result.is_nil = v9;
  return result;
}

Swift::Void __swiftcall TapToRadarManager.writeDefaultsContents(contents:userDefaultSuiteName:)(Swift::OpaquePointer contents, Swift::String userDefaultSuiteName)
{
  uint64_t v3 = v2;
  object = userDefaultSuiteName._object;
  uint64_t countAndFlagsBits = userDefaultSuiteName._countAndFlagsBits;
  objc_allocWithZone(MEMORY[0x263EFFA40]);
  swift_bridgeObjectRetain();
  id v6 = @nonobjc NSUserDefaults.init(suiteName:)(countAndFlagsBits, (uint64_t)object);
  if (v6)
  {
    uint64_t v7 = v6;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : String]);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    id v9 = (id)MEMORY[0x223C2E5C0](*(void *)(v3 + 72), *(void *)(v3 + 80));
    objc_msgSend(v7, sel_setValue_forKey_, isa, v9);
  }
}

void TapToRadarManager.setupLaunchTTR(createDraftContainer:title:completion:)()
{
  OUTLINED_FUNCTION_60();
  uint64_t v2 = v1;
  uint64_t v27 = v3;
  id v5 = v4;
  OUTLINED_FUNCTION_6_1();
  uint64_t v26 = v6;
  type metadata accessor for DispatchWorkItemFlags();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v7);
  uint64_t v28 = OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_0();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  uint64_t v11 = OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_0();
  uint64_t v13 = v12;
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_6();
  uint64_t v17 = v16 - v15;
  memcpy(v30, v5, 0x70uLL);
  static Logger.logger.getter();
  unint64_t v18 = Logger.logObject.getter();
  os_log_type_t v19 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = (uint8_t *)OUTLINED_FUNCTION_8_1();
    *(_WORD *)uint64_t v20 = 0;
    _os_log_impl(&dword_21E680000, v18, v19, "TapToRadarManager#setupLaunchTTR", v20, 2u);
    OUTLINED_FUNCTION_2_1();
  }

  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v17, v11);
  type metadata accessor for OS_dispatch_queue(0, &lazy cache variable for type metadata for OS_dispatch_queue);
  char v21 = (void *)static OS_dispatch_queue.main.getter();
  unint64_t v22 = (void *)swift_allocObject();
  memcpy(v22 + 2, v30, 0x70uLL);
  v22[16] = v27;
  v22[17] = v2;
  v22[18] = v26;
  v29[4] = partial apply for closure #1 in TapToRadarManager.setupLaunchTTR(createDraftContainer:title:completion:);
  v29[5] = v22;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 1107296256;
  v29[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
  v29[3] = &block_descriptor_10;
  unint64_t v23 = _Block_copy(v29);
  outlined retain of TapToRadarManager.CreateDraftContainer((uint64_t)v30);
  swift_retain();
  swift_release();
  static DispatchQoS.unspecified.getter();
  v29[0] = MEMORY[0x263F8EE78];
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A](&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A], &demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  uint64_t v24 = OUTLINED_FUNCTION_24_1();
  MEMORY[0x223C2E750](v24);
  _Block_release(v23);

  OUTLINED_FUNCTION_24();
  v25();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v0, v28);
  OUTLINED_FUNCTION_59();
}

Swift::Bool __swiftcall TapToRadarManager.hasFiledThisIssue(errStatus:userDefaultSuiteName:)(Swift::String errStatus, Swift::String userDefaultSuiteName)
{
  object = errStatus._object;
  uint64_t countAndFlagsBits = errStatus._countAndFlagsBits;
  OUTLINED_FUNCTION_3_3();
  uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 248))(v5, v6);
  if (!v7) {
    return 0;
  }
  uint64_t v8 = v7;
  swift_bridgeObjectRetain();
  uint64_t v9 = OUTLINED_FUNCTION_1_4();
  uint64_t v11 = specialized Dictionary.subscript.getter(v9, v10, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v11) {
    return 0;
  }
  int64_t v12 = 0;
  uint64_t v13 = v11 + 64;
  OUTLINED_FUNCTION_13_1();
  unint64_t v17 = v16 & v15;
  int64_t v19 = (unint64_t)(v18 + 63) >> 6;
  while (v17)
  {
    unint64_t v20 = __clz(__rbit64(v17));
    v17 &= v17 - 1;
    unint64_t v21 = v20 | (v12 << 6);
LABEL_20:
    uint64_t v25 = (void *)(*(void *)(v11 + 56) + 16 * v21);
    if (*v25 != countAndFlagsBits || v25[1] != (void)object)
    {
      Swift::Bool result = _stringCompareWithSmolCheck(_:_:expecting:)();
      if (!result) {
        continue;
      }
    }
    Swift::Bool v27 = 1;
LABEL_28:
    swift_release();
    return v27;
  }
  int64_t v22 = v12 + 1;
  if (__OFADD__(v12, 1))
  {
    __break(1u);
    goto LABEL_31;
  }
  if (v22 >= v19) {
    goto LABEL_27;
  }
  unint64_t v23 = *(void *)(v13 + 8 * v22);
  ++v12;
  if (v23) {
    goto LABEL_19;
  }
  int64_t v12 = v22 + 1;
  if (v22 + 1 >= v19) {
    goto LABEL_27;
  }
  unint64_t v23 = *(void *)(v13 + 8 * v12);
  if (v23) {
    goto LABEL_19;
  }
  int64_t v12 = v22 + 2;
  if (v22 + 2 >= v19) {
    goto LABEL_27;
  }
  unint64_t v23 = *(void *)(v13 + 8 * v12);
  if (v23)
  {
LABEL_19:
    unint64_t v17 = (v23 - 1) & v23;
    unint64_t v21 = __clz(__rbit64(v23)) + (v12 << 6);
    goto LABEL_20;
  }
  int64_t v24 = v22 + 3;
  if (v24 >= v19)
  {
LABEL_27:
    Swift::Bool v27 = 0;
    goto LABEL_28;
  }
  unint64_t v23 = *(void *)(v13 + 8 * v24);
  if (v23)
  {
    int64_t v12 = v24;
    goto LABEL_19;
  }
  while (1)
  {
    int64_t v12 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v12 >= v19) {
      goto LABEL_27;
    }
    unint64_t v23 = *(void *)(v13 + 8 * v12);
    ++v24;
    if (v23) {
      goto LABEL_19;
    }
  }
LABEL_31:
  __break(1u);
  return result;
}

Swift::String __swiftcall TapToRadarManager.getRequestID()()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for FlowTaskMetadata?);
  MEMORY[0x270FA5388](v0 - 8);
  OUTLINED_FUNCTION_6();
  uint64_t v3 = (uint64_t *)(v2 - v1);
  type metadata accessor for SiriEnvironment();
  static SiriEnvironment.default.getter();
  type metadata accessor for CurrentRequest();
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (void (*)(uint64_t))type metadata accessor for CurrentRequest);
  dispatch thunk of SiriEnvironment.subscript.getter();
  OUTLINED_FUNCTION_27_0();
  CurrentRequest.flowTaskMetadata.getter();
  swift_release();
  uint64_t v4 = type metadata accessor for FlowTaskMetadata();
  if (__swift_getEnumTagSinglePayload((uint64_t)v3, 1, v4))
  {
    outlined destroy of AudioSource?((uint64_t)v3, &demangling cache variable for type metadata for FlowTaskMetadata?);
LABEL_4:
    swift_bridgeObjectRelease();
    uint64_t v5 = 0;
    unint64_t v6 = 0xE000000000000000;
    goto LABEL_5;
  }
  uint64_t v5 = *v3;
  unint64_t v6 = v3[1];
  swift_bridgeObjectRetain();
  outlined destroy of AudioSource?((uint64_t)v3, &demangling cache variable for type metadata for FlowTaskMetadata?);
  if (!v6) {
    goto LABEL_4;
  }
LABEL_5:
  uint64_t v7 = v5;
  uint64_t v8 = (void *)v6;
  result._object = v8;
  result._uint64_t countAndFlagsBits = v7;
  return result;
}

uint64_t TapToRadarManager.writeDefaults(errStatus:userDefaultSuiteName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v30 = a1;
  id v8 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  swift_bridgeObjectRetain();
  uint64_t v32 = a3;
  uint64_t v33 = a4;
  id v9 = @nonobjc NSUserDefaults.init(suiteName:)(a3, a4);
  if (!v9)
  {
    long long v35 = 0u;
    long long v36 = 0u;
LABEL_9:
    outlined destroy of AudioSource?((uint64_t)&v35, &demangling cache variable for type metadata for Any?);
    goto LABEL_10;
  }
  uint64_t v10 = v9;
  uint64_t v11 = (void *)MEMORY[0x223C2E5C0](v5[9], v5[10]);
  id v12 = objc_msgSend(v10, sel_objectForKey_, v11, v30);

  if (v12)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v34, 0, sizeof(v34));
  }
  outlined init with take of RadarFilingExtras?((uint64_t)v34, (uint64_t)&v35, &demangling cache variable for type metadata for Any?);
  if (!*((void *)&v36 + 1)) {
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : [String : String]]);
  if (swift_dynamicCast())
  {
    uint64_t v13 = *(void *)&v34[0];
    goto LABEL_11;
  }
LABEL_10:
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : String]);
  uint64_t v13 = Dictionary.init(dictionaryLiteral:)();
LABEL_11:
  uint64_t v15 = v5[15];
  uint64_t v14 = v5[16];
  swift_bridgeObjectRetain();
  uint64_t v16 = specialized Dictionary.subscript.getter(v15, v14, v13);
  swift_bridgeObjectRelease();
  if (!v16) {
    uint64_t v16 = Dictionary.init(dictionaryLiteral:)();
  }
  uint64_t v17 = v5[11];
  uint64_t v18 = v5[12];
  *(void *)&long long v35 = *(void *)(v16 + 16) + 1;
  uint64_t v19 = dispatch thunk of CustomStringConvertible.description.getter();
  unint64_t v21 = v20;
  *(void *)&long long v35 = v17;
  *((void *)&v35 + 1) = v18;
  swift_bridgeObjectRetain();
  v22._uint64_t countAndFlagsBits = v19;
  v22._object = v21;
  String.append(_:)(v22);
  swift_bridgeObjectRelease();
  long long v23 = v35;
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)&long long v35 = v16;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v30, a2, v23, *((uint64_t *)&v23 + 1), isUniquelyReferenced_nonNull_native);
  uint64_t v25 = v35;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  char v26 = swift_isUniquelyReferenced_nonNull_native();
  *(void *)&long long v35 = v13;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v25, v15, v14, v26);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  Swift::Bool v27 = *(void (**)(uint64_t, uint64_t, uint64_t))(*v5 + 256);
  uint64_t v28 = swift_bridgeObjectRetain();
  v27(v28, v32, v33);
  return swift_bridgeObjectRelease_n();
}

uint64_t TapToRadarManager.isRadarValid(radarComponentInfo:title:description:)(void *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  OUTLINED_FUNCTION_0();
  uint64_t v8 = v7;
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  id v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v26 - v13;
  unint64_t v15 = a1[1];
  uint64_t v16 = *a1 & 0xFFFFFFFFFFFFLL;
  if ((v15 & 0x2000000000000000) != 0) {
    uint64_t v16 = HIBYTE(v15) & 0xF;
  }
  if (v16
    && ((unint64_t v17 = a1[3], (v17 & 0x2000000000000000) != 0) ? (v18 = HIBYTE(v17) & 0xF) : (v18 = a1[2] & 0xFFFFFFFFFFFFLL),
        v18))
  {
    if (a3)
    {
      uint64_t v19 = HIBYTE(a3) & 0xF;
      if ((a3 & 0x2000000000000000) == 0) {
        uint64_t v19 = a2 & 0xFFFFFFFFFFFFLL;
      }
      if (v19) {
        return 1;
      }
    }
    static Logger.logger.getter();
    unint64_t v21 = Logger.logObject.getter();
    os_log_type_t v24 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v21, v24))
    {
      uint64_t v25 = (uint8_t *)OUTLINED_FUNCTION_8_1();
      *(_WORD *)uint64_t v25 = 0;
      _os_log_impl(&dword_21E680000, v21, v24, "TapToRadarManager#isRadarValid, no radar title specified", v25, 2u);
      goto LABEL_18;
    }
  }
  else
  {
    static Logger.logger.getter();
    unint64_t v21 = Logger.logObject.getter();
    os_log_type_t v22 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v21, v22))
    {
      long long v23 = (uint8_t *)OUTLINED_FUNCTION_8_1();
      *(_WORD *)long long v23 = 0;
      _os_log_impl(&dword_21E680000, v21, v22, "TapToRadarManager#isRadarValid, either radar component ID or component name/version need to be specified", v23, 2u);
      id v12 = v14;
LABEL_18:
      OUTLINED_FUNCTION_2_1();
      goto LABEL_19;
    }
    id v12 = v14;
  }
LABEL_19:

  (*(void (**)(char *, uint64_t))(v8 + 8))(v12, v6);
  return 0;
}

uint64_t TapToRadarManager.shouldFileTTRWithRequestID()()
{
  OUTLINED_FUNCTION_3_3();
  uint64_t v2 = *(void (**)(void))(v1 + 152);
  v2();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_25_1();
  if (!v4)
  {
    OUTLINED_FUNCTION_3_3();
    uint64_t v6 = (*(uint64_t (**)(void))(v5 + 280))();
    uint64_t v3 = (*(uint64_t (**)(uint64_t))(*(void *)v0 + 160))(v6);
  }
  ((void (*)(uint64_t))v2)(v3);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_25_1();
  if (!v7) {
    return 1;
  }
  uint64_t v8 = ((uint64_t (*)(void))v2)();
  uint64_t v10 = v9;
  OUTLINED_FUNCTION_3_3();
  uint64_t v12 = (*(uint64_t (**)(void))(v11 + 176))();
  LODWORD(v8) = specialized Dictionary.subscript.getter(v8, v10, v12);
  swift_bridgeObjectRelease();
  uint64_t v13 = swift_bridgeObjectRelease();
  if (v8 != 2) {
    return 0;
  }
  uint64_t v14 = ((uint64_t (*)(uint64_t))v2)(v13);
  uint64_t v16 = v15;
  OUTLINED_FUNCTION_3_3();
  uint64_t v18 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(v17 + 192))(v21);
  uint64_t v19 = 1;
  specialized Dictionary._Variant.setValue(_:forKey:)(1, v14, v16);
  swift_bridgeObjectRelease();
  v18(v21, 0);
  return v19;
}

void TapToRadarManager.updateTTRForRequestID(ttrLaunch:)(char a1)
{
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_3_3();
  uint64_t v5 = *(uint64_t (**)(void))(v4 + 152);
  uint64_t v6 = v5();
  unint64_t v8 = v7;
  swift_bridgeObjectRelease();
  uint64_t v9 = HIBYTE(v8) & 0xF;
  if ((v8 & 0x2000000000000000) == 0) {
    uint64_t v9 = v6 & 0xFFFFFFFFFFFFLL;
  }
  if (!v9 || (a1 & 1) == 0) {
    return;
  }
  uint64_t v10 = (uint64_t (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v2 + 216))(v47);
  String.removeAll(keepingCapacity:)(0);
  uint64_t v11 = v10(v47, 0);
  uint64_t v12 = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 176))(v11);
  int64_t v13 = 0;
  uint64_t v44 = v12 + 64;
  OUTLINED_FUNCTION_13_1();
  unint64_t v16 = v15 & v14;
  int64_t v45 = (unint64_t)(v17 + 63) >> 6;
  uint64_t v43 = v18;
  if ((v15 & v14) == 0) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v19 = __clz(__rbit64(v16));
  v16 &= v16 - 1;
  for (unint64_t i = v19 | (v13 << 6); ; unint64_t i = __clz(__rbit64(v22)) + (v13 << 6))
  {
    os_log_type_t v24 = (uint64_t *)(*(void *)(v12 + 48) + 16 * i);
    uint64_t v25 = *v24;
    uint64_t v26 = v24[1];
    uint64_t v27 = swift_bridgeObjectRetain();
    if (v25 == ((uint64_t (*)(uint64_t))v5)(v27) && v26 == v28)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v30 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if ((v30 & 1) == 0)
      {
        uint64_t v31 = (void (*)(void, void))(*(uint64_t (**)(unsigned char *))(*(void *)v2 + 192))(v47);
        uint64_t v33 = v32;
        swift_bridgeObjectRetain();
        specialized __RawDictionaryStorage.find<A>(_:)(v25, v26);
        char v35 = v34;
        swift_bridgeObjectRelease();
        if (v35)
        {
          char isUnique = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v46 = *v33;
          uint64_t v36 = *v33;
          uint64_t *v33 = 0x8000000000000000;
          uint64_t v37 = v2;
          uint64_t v38 = v31;
          uint64_t v39 = v5;
          Swift::Int v40 = *(void *)(v36 + 24);
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _NativeDictionary<String, Bool>);
          Swift::Int v41 = v40;
          uint64_t v5 = v39;
          uint64_t v31 = v38;
          uint64_t v2 = v37;
          _NativeDictionary.ensureUnique(isUnique:capacity:)(isUnique, v41);
          swift_bridgeObjectRelease();
          _NativeDictionary._delete(at:)();
          uint64_t *v33 = v46;
          swift_bridgeObjectRelease();
        }
        v31(v47, 0);
        uint64_t v12 = v43;
      }
    }
    swift_bridgeObjectRelease();
    if (v16) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_35;
    }
    if (v21 >= v45) {
      goto LABEL_32;
    }
    unint64_t v22 = *(void *)(v44 + 8 * v21);
    ++v13;
    if (!v22)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v45) {
        goto LABEL_32;
      }
      unint64_t v22 = *(void *)(v44 + 8 * v13);
      if (!v22)
      {
        int64_t v13 = v21 + 2;
        if (v21 + 2 >= v45) {
          goto LABEL_32;
        }
        unint64_t v22 = *(void *)(v44 + 8 * v13);
        if (!v22) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v16 = (v22 - 1) & v22;
  }
  int64_t v23 = v21 + 3;
  if (v23 >= v45)
  {
LABEL_32:
    swift_release();
    return;
  }
  unint64_t v22 = *(void *)(v44 + 8 * v23);
  if (v22)
  {
    int64_t v13 = v23;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v13 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v13 >= v45) {
      goto LABEL_32;
    }
    unint64_t v22 = *(void *)(v44 + 8 * v13);
    ++v23;
    if (v22) {
      goto LABEL_20;
    }
  }
LABEL_35:
  __break(1u);
}

unint64_t TapToRadarManager.generateRequestInfoHeader(providedDescription:)(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = 0xD000000000000014;
  uint64_t v3 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v3 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v3)
  {
    _StringGuts.grow(_:)(24);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v5._uint64_t countAndFlagsBits = 0xD000000000000016;
    v5._object = (void *)0x800000021E6AF130;
    String.append(_:)(v5);
    return a1;
  }
  return v2;
}

void TapToRadarManager.createSiriRequestDescription(providedDescription:)()
{
  OUTLINED_FUNCTION_60();
  type metadata accessor for Locale();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v1);
  type metadata accessor for SiriEnvironment();
  static SiriEnvironment.default.getter();
  SiriEnvironment.currentDevice.getter();
  swift_release();
  uint64_t v27 = dispatch thunk of CurrentDevice.preferencesLanguageCode.getter();
  uint64_t v3 = v2;
  swift_release();
  static SiriEnvironment.default.getter();
  SiriEnvironment.currentDevice.getter();
  swift_release();
  uint64_t v4 = dispatch thunk of CurrentDevice.deviceRegionCode.getter();
  uint64_t v6 = v5;
  swift_release();
  swift_bridgeObjectRetain();
  uint64_t v7 = OUTLINED_FUNCTION_1_4();
  unint64_t v9 = TapToRadarManager.generateRequestInfoHeader(providedDescription:)(v7, v8);
  uint64_t v11 = v10;
  uint64_t v12 = swift_bridgeObjectRelease();
  unint64_t v30 = v9;
  uint64_t v31 = v11;
  int64_t v13 = *(void (**)(uint64_t))(*(void *)v0 + 200);
  v13(v12);
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_6_3();
  if (v14)
  {
    *(void *)&long long v29 = 0;
    *((void *)&v29 + 1) = 0xE000000000000000;
    _StringGuts.grow(_:)(16);
    uint64_t v15 = swift_bridgeObjectRelease();
    strcpy((char *)&v29, "\n\tUtterance:\t\t");
    HIBYTE(v29) = -18;
    v16._uint64_t countAndFlagsBits = ((uint64_t (*)(uint64_t))v13)(v15);
    String.append(_:)(v16);
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_9_2();
    swift_bridgeObjectRelease();
  }
  if (v6) {
    uint64_t v17 = v6;
  }
  else {
    uint64_t v17 = (void *)0xE700000000000000;
  }
  uint64_t v18 = 0x6E776F6E6B6E75;
  if (v6) {
    uint64_t v18 = v4;
  }
  uint64_t v28 = v18;
  if (v3)
  {
    uint64_t v19 = v27;
  }
  else
  {
    uint64_t v3 = (void *)0xED00006465696669;
    uint64_t v19 = 0x6365707320746F6ELL;
  }
  *(void *)&long long v29 = 0;
  *((void *)&v29 + 1) = 0xE000000000000000;
  _StringGuts.grow(_:)(18);
  swift_bridgeObjectRelease();
  *(void *)&long long v29 = 0xD000000000000010;
  *((void *)&v29 + 1) = 0x800000021E6AF0F0;
  static SiriEnvironment.default.getter();
  SiriEnvironment.currentDevice.getter();
  swift_release();
  dispatch thunk of CurrentDevice.siriLocale.getter();
  swift_release();
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type Locale and conformance Locale, MEMORY[0x263F07690]);
  uint64_t v20 = dispatch thunk of CustomStringConvertible.description.getter();
  unint64_t v22 = v21;
  OUTLINED_FUNCTION_24();
  v23();
  v24._uint64_t countAndFlagsBits = v20;
  v24._object = v22;
  String.append(_:)(v24);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_9_2();
  swift_bridgeObjectRelease();
  *(void *)&long long v29 = 0;
  *((void *)&v29 + 1) = 0xE000000000000000;
  _StringGuts.grow(_:)(19);
  swift_bridgeObjectRelease();
  *(void *)&long long v29 = 0xD000000000000011;
  *((void *)&v29 + 1) = 0x800000021E6AF110;
  v25._uint64_t countAndFlagsBits = v19;
  v25._object = v3;
  String.append(_:)(v25);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_9_2();
  swift_bridgeObjectRelease();
  strcpy((char *)&v29, "\n\tRegion:\t\t\t");
  BYTE13(v29) = 0;
  HIWORD(v29) = -5120;
  v26._uint64_t countAndFlagsBits = v28;
  v26._object = v17;
  String.append(_:)(v26);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_9_2();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_59();
}

void TapToRadarManager.internalPopulateSiriRequestText()()
{
  OUTLINED_FUNCTION_60();
  uint64_t v1 = type metadata accessor for Logger();
  OUTLINED_FUNCTION_0();
  uint64_t v3 = v2;
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_10();
  uint64_t v64 = v5;
  OUTLINED_FUNCTION_3_3();
  char v66 = v0;
  (*(void (**)(void))(v6 + 200))();
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_6_3();
  if (v7) {
    goto LABEL_2;
  }
  uint64_t v63 = v3;
  type metadata accessor for SiriEnvironment();
  static SiriEnvironment.default.getter();
  type metadata accessor for CurrentRequest();
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type CurrentRequest and conformance CurrentRequest, (void (*)(uint64_t))type metadata accessor for CurrentRequest);
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_27_0();
  unint64_t v8 = (void *)CurrentRequest.speechPackage.getter();
  swift_release();
  if (!v8) {
    goto LABEL_11;
  }
  unint64_t v9 = (SEL *)&__block_descriptor_48_e8_32s40r_e17_v16__0__NSError_8lr40l8s32l8;
  id v10 = objc_msgSend(v8, sel_recognition);

  if (!v10) {
    goto LABEL_11;
  }
  unint64_t v11 = outlined bridged method (ob) of @objc AFSpeechInterpretation.tokens.getter(v10, (SEL *)&selRef_phrases, &lazy cache variable for type metadata for AFSpeechPhrase);
  if (!v11) {
    goto LABEL_65;
  }
  if (v11 >> 62) {
LABEL_62:
  }
    uint64_t v12 = _CocoaArrayWrapper.endIndex.getter();
  else {
    uint64_t v12 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (!v12)
  {
LABEL_11:
    static SiriEnvironment.default.getter();
    OUTLINED_FUNCTION_15_1();
    OUTLINED_FUNCTION_27_0();
    int64_t v13 = (void *)CurrentRequest.speechPackage.getter();
    swift_release();
    uint64_t v14 = v63;
    if (v13)
    {
      id v15 = objc_msgSend(v13, sel_unfilteredRecognition);
      goto LABEL_13;
    }
LABEL_2:
    OUTLINED_FUNCTION_59();
    return;
  }
  static SiriEnvironment.default.getter();
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_27_0();
  int64_t v13 = (void *)CurrentRequest.speechPackage.getter();
  swift_release();
  uint64_t v14 = v63;
  if (!v13) {
    goto LABEL_2;
  }
  id v15 = [v13 v9[230]];
LABEL_13:
  id v16 = v15;

  if (!v16) {
    goto LABEL_2;
  }
  unint64_t v17 = outlined bridged method (ob) of @objc AFSpeechInterpretation.tokens.getter(v16, (SEL *)&selRef_phrases, &lazy cache variable for type metadata for AFSpeechPhrase);
  if (!v17) {
    goto LABEL_2;
  }
  unint64_t v18 = v17;
  uint64_t v19 = v17 & 0xFFFFFFFFFFFFFF8;
  if (v17 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v20 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v20 = *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v9 = v66;
  if (!v20)
  {
    swift_bridgeObjectRelease();
LABEL_52:
    OUTLINED_FUNCTION_21_1();
    v46();
    OUTLINED_FUNCTION_17_1();
    OUTLINED_FUNCTION_6_3();
    if (v47)
    {
      uint64_t v48 = OUTLINED_FUNCTION_22_0();
      uint64_t v50 = (void (*)(uint64_t *, void))v49(v48);
      specialized RangeReplaceableCollection<>.removeLast()((uint64_t)v50);
      swift_bridgeObjectRelease();
      v50(&v67, 0);
    }
    static Logger.logger.getter();
    swift_retain_n();
    os_log_type_t v51 = Logger.logObject.getter();
    os_log_type_t v52 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v51, v52))
    {
      uint64_t v53 = (uint8_t *)swift_slowAlloc();
      uint64_t v67 = swift_slowAlloc();
      *(_DWORD *)uint64_t v53 = 136315138;
      OUTLINED_FUNCTION_21_1();
      uint64_t v55 = v54();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v55, v56, &v67);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21E680000, v51, v52, "TapToRadarManager#internalPopulateSiriRequestText, requestText: %s", v53, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_2_1();
      OUTLINED_FUNCTION_2_1();
    }
    else
    {

      swift_release_n();
    }
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v64, v1);
    goto LABEL_2;
  }
  unint64_t v21 = 0;
  unint64_t v22 = v18 & 0xC000000000000001;
  uint64_t v58 = v1;
  unint64_t v59 = v18 + 32;
  unint64_t v57 = v18;
  uint64_t v61 = v20;
  uint64_t v62 = v19;
  unint64_t v60 = v18 & 0xC000000000000001;
  while (1)
  {
    if (v22)
    {
      id v23 = (id)MEMORY[0x223C2E840](v21, v18);
    }
    else
    {
      if (v21 >= *(void *)(v19 + 16)) {
        goto LABEL_60;
      }
      id v23 = *(id *)(v59 + 8 * v21);
    }
    Swift::String v24 = v23;
    if (__OFADD__(v21++, 1))
    {
      __break(1u);
LABEL_59:
      __break(1u);
LABEL_60:
      __break(1u);
LABEL_61:
      __break(1u);
      goto LABEL_62;
    }
    unint64_t v26 = outlined bridged method (pb) of @objc AFSpeechPhrase.interpretations.getter(v23);
    if (!v26) {
      break;
    }
    unint64_t v27 = v26;
    uint64_t v28 = v26 & 0xFFFFFFFFFFFFFF8;
    if (v26 >> 62)
    {
      if (!_CocoaArrayWrapper.endIndex.getter())
      {
LABEL_44:

        swift_bridgeObjectRelease();
        goto LABEL_49;
      }
    }
    else if (!*(void *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_44;
    }
    uint64_t v65 = v24;
    if ((v27 & 0xC000000000000001) != 0)
    {
      id v29 = (id)MEMORY[0x223C2E840](0, v27);
    }
    else
    {
      if (!*(void *)(v28 + 16)) {
        goto LABEL_59;
      }
      id v29 = *(id *)(v27 + 32);
    }
    unint64_t v30 = v29;
    swift_bridgeObjectRelease();
    unint64_t v31 = outlined bridged method (ob) of @objc AFSpeechInterpretation.tokens.getter(v30, (SEL *)&selRef_tokens, &lazy cache variable for type metadata for AFSpeechToken);
    if (v31)
    {
      unint64_t v32 = v31;
      if (v31 >> 62)
      {
        uint64_t v33 = _CocoaArrayWrapper.endIndex.getter();
        if (!v33) {
          goto LABEL_47;
        }
LABEL_33:
        if (v33 < 1) {
          goto LABEL_61;
        }
        for (uint64_t i = 0; i != v33; ++i)
        {
          if ((v32 & 0xC000000000000001) != 0) {
            id v35 = (id)MEMORY[0x223C2E840](i, v32);
          }
          else {
            id v35 = *(id *)(v32 + 8 * i + 32);
          }
          uint64_t v36 = v35;
          uint64_t v37 = outlined bridged method (pb) of @objc AFSpeechToken.text.getter(v35);
          if (v38)
          {
            uint64_t v67 = v37;
            long long v68 = v38;
            v39._uint64_t countAndFlagsBits = 32;
            v39._object = (void *)0xE100000000000000;
            String.append(_:)(v39);
            uint64_t v40 = v67;
            Swift::Int v41 = v68;
            uint64_t v42 = OUTLINED_FUNCTION_22_0();
            uint64_t v44 = (void (*)(uint64_t *, void))v43(v42);
            v45._uint64_t countAndFlagsBits = v40;
            v45._object = v41;
            String.append(_:)(v45);
            swift_bridgeObjectRelease();
            v44(&v67, 0);
            unint64_t v9 = v66;
          }
        }
        swift_bridgeObjectRelease();
        unint64_t v18 = v57;
        uint64_t v1 = v58;
      }
      else
      {
        uint64_t v33 = *(void *)((v31 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (v33) {
          goto LABEL_33;
        }
LABEL_47:

        swift_bridgeObjectRelease();
      }
      uint64_t v20 = v61;
      uint64_t v19 = v62;
      unint64_t v22 = v60;
      goto LABEL_49;
    }

LABEL_49:
    if (v21 == v20)
    {
      swift_bridgeObjectRelease();
      uint64_t v14 = v63;
      goto LABEL_52;
    }
  }
  __break(1u);
LABEL_65:
  __break(1u);
}

uint64_t TTRComponentInfo.componentName.getter()
{
  return OUTLINED_FUNCTION_1_4();
}

uint64_t TTRComponentInfo.componentVersion.getter()
{
  return OUTLINED_FUNCTION_1_4();
}

uint64_t TTRComponentInfo.componentID.getter()
{
  return *(void *)(v0 + 32);
}

uint64_t RadarFilingExtras.attachmentURLs.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t RadarFilingExtras.extensionIDs.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t RadarFilingExtras.deviceIDs.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t RadarFilingExtras.displayReason.getter()
{
  return OUTLINED_FUNCTION_1_4();
}

uint64_t key path setter for TapToRadarManager.requestID : TapToRadarManager(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(void **)a2 + 160);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t key path setter for TapToRadarManager.ttrRequestManager : TapToRadarManager(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))(**(void **)a2 + 184);
  uint64_t v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

uint64_t key path setter for TapToRadarManager.requestText : TapToRadarManager(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(void **)a2 + 208);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t TapToRadarManager.defaultDisplayTitle.getter()
{
  return OUTLINED_FUNCTION_1_4();
}

uint64_t TapToRadarManager.defaultsKey.getter()
{
  return OUTLINED_FUNCTION_1_4();
}

uint64_t TapToRadarManager.contentKeyError.getter()
{
  return OUTLINED_FUNCTION_1_4();
}

uint64_t TapToRadarManager.bufferSize.getter()
{
  return 40;
}

uint64_t TapToRadarManager.buffer.getter()
{
  return *(void *)(v0 + 112);
}

uint64_t TapToRadarManager.sysBuildVer.getter()
{
  return OUTLINED_FUNCTION_1_4();
}

uint64_t one-time initialization function for runQueue()
{
  uint64_t v0 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for OS_dispatch_queue.Attributes();
  MEMORY[0x270FA5388](v4);
  uint64_t v5 = type metadata accessor for DispatchQoS();
  MEMORY[0x270FA5388](v5 - 8);
  type metadata accessor for OS_dispatch_queue(0, &lazy cache variable for type metadata for OS_dispatch_queue);
  static DispatchQoS.default.getter();
  v7[1] = MEMORY[0x263F8EE78];
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A](&lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A], &demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F8F130], v0);
  uint64_t result = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  static TapToRadarManager.runQueue = result;
  return result;
}

uint64_t TapToRadarManager.CreateDraftContainer.radarComponentInfo.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  uint64_t v3 = v1[2];
  uint64_t v4 = v1[3];
  uint64_t v5 = v1[4];
  *a1 = *v1;
  a1[1] = v2;
  a1[2] = v3;
  a1[3] = v4;
  a1[4] = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

__n128 TapToRadarManager.CreateDraftContainer.radarComponentInfo.setter(long long *a1)
{
  __n128 v4 = (__n128)a1[1];
  long long v5 = *a1;
  uint64_t v2 = *((void *)a1 + 4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __n128 result = v4;
  *(_OWORD *)uint64_t v1 = v5;
  *(__n128 *)(v1 + 16) = v4;
  *(void *)(v1 + 32) = v2;
  return result;
}

uint64_t (*TapToRadarManager.CreateDraftContainer.radarComponentInfo.modify())()
{
  return FlowTaskMetadata.id.modify;
}

uint64_t TapToRadarManager.CreateDraftContainer.title.getter()
{
  return OUTLINED_FUNCTION_1_4();
}

uint64_t TapToRadarManager.CreateDraftContainer.title.setter()
{
  OUTLINED_FUNCTION_218();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 40) = v2;
  *(void *)(v1 + 48) = v0;
  return result;
}

uint64_t (*TapToRadarManager.CreateDraftContainer.title.modify())()
{
  return FlowTaskMetadata.id.modify;
}

uint64_t TapToRadarManager.CreateDraftContainer.description.getter()
{
  return OUTLINED_FUNCTION_1_4();
}

uint64_t TapToRadarManager.CreateDraftContainer.description.setter()
{
  OUTLINED_FUNCTION_218();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 56) = v2;
  *(void *)(v1 + 64) = v0;
  return result;
}

uint64_t (*TapToRadarManager.CreateDraftContainer.description.modify())()
{
  return FlowTaskMetadata.id.modify;
}

uint64_t TapToRadarManager.CreateDraftContainer.radarFilingExtras.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = v1[9];
  uint64_t v3 = v1[10];
  uint64_t v4 = v1[11];
  uint64_t v5 = v1[12];
  uint64_t v6 = v1[13];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  a1[4] = v6;
  return outlined copy of RadarFilingExtras?(v2);
}

__n128 TapToRadarManager.CreateDraftContainer.radarFilingExtras.setter(long long *a1)
{
  __n128 v4 = (__n128)a1[1];
  long long v5 = *a1;
  uint64_t v2 = *((void *)a1 + 4);
  outlined consume of RadarFilingExtras?(*(void *)(v1 + 72));
  *(_OWORD *)(v1 + 72) = v5;
  __n128 result = v4;
  *(__n128 *)(v1 + 88) = v4;
  *(void *)(v1 + 104) = v2;
  return result;
}

uint64_t (*TapToRadarManager.CreateDraftContainer.radarFilingExtras.modify())()
{
  return FlowTaskMetadata.id.modify;
}

__n128 TapToRadarManager.CreateDraftContainer.init(radarComponentInfo:title:description:radarFilingExtras:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  long long v7 = *(_OWORD *)(a1 + 16);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a6 + 32);
  *(_OWORD *)a7 = *(_OWORD *)a1;
  *(_OWORD *)(a7 + 16) = v7;
  *(void *)(a7 + 32) = v8;
  *(void *)(a7 + 40) = a2;
  *(void *)(a7 + 48) = a3;
  *(void *)(a7 + 56) = a4;
  *(void *)(a7 + 64) = a5;
  __n128 result = *(__n128 *)a6;
  long long v11 = *(_OWORD *)(a6 + 16);
  *(_OWORD *)(a7 + 72) = *(_OWORD *)a6;
  *(_OWORD *)(a7 + 88) = v11;
  *(void *)(a7 + 104) = v9;
  return result;
}

uint64_t TapToRadarManager.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  TapToRadarManager.init()();
  return v0;
}

uint64_t closure #1 in TapToRadarManager.createProblem(errStatus:userDefaultSuiteName:radarComponentInfo:title:description:radarFilingExtras:completion:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(void), uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, unint64_t a12, uint64_t *a13, uint64_t a14)
{
  uint64_t v72 = a8;
  uint64_t v74 = a6;
  uint64_t v75 = a7;
  uint64_t v64 = a13;
  outlined init with take of RadarFilingExtras?((uint64_t)a13, (uint64_t)v88, &demangling cache variable for type metadata for RadarFilingExtras?);
  uint64_t v71 = v88[0];
  uint64_t v70 = v88[1];
  uint64_t v69 = v88[2];
  uint64_t v68 = v88[3];
  uint64_t v67 = v88[4];
  uint64_t v63 = *a10;
  uint64_t v66 = a10[1];
  uint64_t v62 = a10[2];
  uint64_t v65 = a10[3];
  uint64_t v61 = a10[4];
  uint64_t v73 = type metadata accessor for Logger();
  uint64_t v19 = *(void *)(v73 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v73);
  unint64_t v22 = (char *)&v54 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v20);
  Swift::String v25 = (char *)&v54 - v24;
  MEMORY[0x270FA5388](v23);
  unint64_t v27 = (char *)&v54 - v26;
  if (!IsAppleInternalBuild()
    || (uint64_t v28 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*a1 + 272),
        uint64_t v60 = a5,
        (v28(a2, a3, a4, a5) & 1) != 0))
  {
    static Logger.logger.getter();
    id v29 = Logger.logObject.getter();
    os_log_type_t v30 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v29, v30))
    {
      unint64_t v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v31 = 0;
      _os_log_impl(&dword_21E680000, v29, v30, "TapToRadarManager#createProblem not filing issue", v31, 2u);
      MEMORY[0x223C2EF70](v31, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v19 + 8))(v27, v73);
    return v74(0);
  }
  uint64_t v59 = a2;
  uint64_t v58 = a4;
  if ((TapToRadarManager.shouldFileTTRWithRequestID()() & 1) == 0)
  {
    static Logger.logger.getter();
    os_log_type_t v51 = Logger.logObject.getter();
    os_log_type_t v52 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v51, v52))
    {
      uint64_t v53 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v53 = 0;
      _os_log_impl(&dword_21E680000, v51, v52, "TapToRadarManager#createProblem, already filed for this requestID, skipping", v53, 2u);
      MEMORY[0x223C2EF70](v53, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v19 + 8))(v25, v73);
    return v74(0);
  }
  unint64_t v33 = a12;
  TapToRadarManager.internalPopulateSiriRequestText()();
  TapToRadarManager.createSiriRequestDescription(providedDescription:)();
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  long long v38 = *((_OWORD *)a10 + 1);
  long long v76 = *(_OWORD *)a10;
  long long v77 = v38;
  uint64_t v78 = a10[4];
  swift_bridgeObjectRetain();
  char v39 = TapToRadarManager.isRadarValid(radarComponentInfo:title:description:)(&v76, a11, a12);
  swift_bridgeObjectRelease();
  if ((v39 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    return v74(0);
  }
  uint64_t v57 = a11;
  uint64_t v72 = v37;
  uint64_t v56 = a14;
  static Logger.logger.getter();
  uint64_t v40 = Logger.logObject.getter();
  os_log_type_t v41 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v40, v41))
  {
    uint64_t v42 = (uint8_t *)swift_slowAlloc();
    unint64_t v55 = a12;
    uint64_t v43 = v42;
    *(_WORD *)uint64_t v42 = 0;
    _os_log_impl(&dword_21E680000, v40, v41, "TapToRadarManager#createProblem, valid information provided", v42, 2u);
    unint64_t v33 = v55;
    MEMORY[0x223C2EF70](v43, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v19 + 8))(v22, v73);
  *(void *)&long long v76 = v63;
  *((void *)&v76 + 1) = v66;
  *(void *)&long long v77 = v62;
  *((void *)&v77 + 1) = v65;
  uint64_t v78 = v61;
  uint64_t v79 = v57;
  unint64_t v80 = v33;
  uint64_t v81 = v35;
  uint64_t v82 = v72;
  uint64_t v83 = v71;
  uint64_t v84 = v70;
  uint64_t v85 = v69;
  uint64_t v86 = v68;
  uint64_t v87 = v67;
  uint64_t v73 = a1[7];
  uint64_t v63 = a1[8];
  uint64_t v44 = (void *)swift_allocObject();
  uint64_t v45 = v59;
  v44[2] = a1;
  v44[3] = v45;
  uint64_t v46 = v58;
  v44[4] = a3;
  v44[5] = v46;
  uint64_t v47 = v74;
  uint64_t v48 = v75;
  v44[6] = v60;
  v44[7] = v47;
  uint64_t v49 = v56;
  v44[8] = v48;
  v44[9] = v49;
  uint64_t v50 = *(void (**)(long long *, uint64_t, uint64_t, uint64_t (*)(char), void *))(*a1 + 264);
  outlined retain of TTRComponentInfo((uint64_t)a10);
  swift_bridgeObjectRetain();
  outlined retain of RadarFilingExtras?(v64);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  v50(&v76, v73, v63, partial apply for closure #1 in closure #1 in TapToRadarManager.createProblem(errStatus:userDefaultSuiteName:radarComponentInfo:title:description:radarFilingExtras:completion:), v44);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return outlined consume of RadarFilingExtras?(v71);
}

uint64_t sub_21E6A9854()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 144) != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return MEMORY[0x270FA0238](v0, 192, 7);
}

uint64_t partial apply for closure #1 in TapToRadarManager.createProblem(errStatus:userDefaultSuiteName:radarComponentInfo:title:description:radarFilingExtras:completion:)()
{
  return closure #1 in TapToRadarManager.createProblem(errStatus:userDefaultSuiteName:radarComponentInfo:title:description:radarFilingExtras:completion:)(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(uint64_t (**)(void))(v0 + 56), *(void *)(v0 + 64), *(void *)(v0 + 72), *(void *)(v0 + 80), (void *)(v0 + 88), *(void *)(v0 + 128), *(void *)(v0 + 136), (uint64_t *)(v0 + 144), *(void *)(v0 + 184));
}

uint64_t closure #1 in closure #1 in TapToRadarManager.createProblem(errStatus:userDefaultSuiteName:radarComponentInfo:title:description:radarFilingExtras:completion:)(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v27 = a5;
  uint64_t v28 = a7;
  uint64_t v26 = a3;
  uint64_t v13 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  id v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = type metadata accessor for DispatchQoS();
  uint64_t v17 = *(void *)(v30 - 8);
  MEMORY[0x270FA5388](v30);
  uint64_t v19 = (char *)&v26 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for runQueue != -1) {
    swift_once();
  }
  uint64_t v29 = static TapToRadarManager.runQueue;
  uint64_t v20 = swift_allocObject();
  *(unsigned char *)(v20 + 16) = a1 & 1;
  uint64_t v21 = v26;
  *(void *)(v20 + 24) = a2;
  *(void *)(v20 + 32) = v21;
  uint64_t v22 = v27;
  *(void *)(v20 + 40) = a4;
  *(void *)(v20 + 48) = v22;
  uint64_t v23 = v28;
  *(void *)(v20 + 56) = a6;
  *(void *)(v20 + 64) = v23;
  *(void *)(v20 + 72) = a8;
  aBlock[4] = partial apply for closure #1 in closure #1 in closure #1 in TapToRadarManager.createProblem(errStatus:userDefaultSuiteName:radarComponentInfo:title:description:radarFilingExtras:completion:);
  aBlock[5] = v20;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
  aBlock[3] = &block_descriptor_27;
  uint64_t v24 = _Block_copy(aBlock);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  static DispatchQoS.unspecified.getter();
  uint64_t v31 = MEMORY[0x263F8EE78];
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A](&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A], &demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  MEMORY[0x223C2E750](0, v19, v16, v24);
  _Block_release(v24);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v30);
  return swift_release();
}

uint64_t closure #1 in closure #1 in closure #1 in TapToRadarManager.createProblem(errStatus:userDefaultSuiteName:radarComponentInfo:title:description:radarFilingExtras:completion:)(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(uint64_t))
{
  if (a1) {
    TapToRadarManager.writeDefaults(errStatus:userDefaultSuiteName:)(a3, a4, a5, a6);
  }
  uint64_t v9 = a1 & 1;
  TapToRadarManager.updateTTRForRequestID(ttrLaunch:)(v9);
  return a7(v9);
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

uint64_t outlined retain of TTRComponentInfo(uint64_t a1)
{
  return a1;
}

uint64_t *outlined retain of RadarFilingExtras?(uint64_t *a1)
{
  return a1;
}

uint64_t outlined copy of RadarFilingExtras?(uint64_t result)
{
  if (result != 1)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

void static TapToRadarManager.launchTTR(createDraftContainer:completion:)()
{
  OUTLINED_FUNCTION_60();
  uint64_t v30 = v0;
  uint64_t v2 = v1;
  type metadata accessor for Logger();
  OUTLINED_FUNCTION_0();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_10();
  uint64_t v4 = *v2;
  uint64_t v5 = v2[1];
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v8 = v2[5];
  uint64_t v9 = v2[6];
  uint64_t v10 = v2[7];
  uint64_t v11 = v2[8];
  Class isa = (Class)v2[9];
  Class v14 = (Class)v2[10];
  uint64_t v13 = v2[11];
  uint64_t v15 = v2[12];
  id v16 = (void *)v2[13];
  uint64_t v27 = v15;
  uint64_t v28 = v13;
  uint64_t v29 = (void *)MEMORY[0x223C2E5C0](v4, v5);
  uint64_t v17 = (void *)MEMORY[0x223C2E5C0](v6, v7);
  v18.super.super.Class isa = Int._bridgeToObjectiveC()().super.super.isa;
  uint64_t v19 = (void *)MEMORY[0x223C2E5C0](v8, v9);
  uint64_t v20 = (void *)MEMORY[0x223C2E5C0](v10, v11);
  if (isa)
  {
    if (isa == (Class)1)
    {
      id v16 = 0;
      Class v21 = 0;
      Class v14 = 0;
      Class isa = 0;
      goto LABEL_10;
    }
    type metadata accessor for URL();
    Class isa = Array._bridgeToObjectiveC()().super.isa;
  }
  if (v14) {
    Class v14 = Array._bridgeToObjectiveC()().super.isa;
  }
  if (v28)
  {
    Class v21 = Array._bridgeToObjectiveC()().super.isa;
    if (!v16) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  Class v21 = 0;
  if (v16) {
LABEL_9:
  }
    id v16 = (void *)MEMORY[0x223C2E5C0](v27, v16);
LABEL_10:
  id v22 = objc_msgSend(self, sel_createProblem_componentVersion_componentID_title_description_attachmentURLs_extensionIDs_deviceIDs_displayReason_, v29, v17, v18.super.super.isa, v19, v20, isa, v14, v21, v16);

  static Logger.logger.getter();
  uint64_t v23 = Logger.logObject.getter();
  os_log_type_t v24 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v23, v24))
  {
    Swift::String v25 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)Swift::String v25 = 67109120;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&dword_21E680000, v23, v24, "TapToRadarManager#launchTTR result: %{BOOL}d", v25, 8u);
    OUTLINED_FUNCTION_2_1();
  }

  OUTLINED_FUNCTION_24();
  v26();
  v30(v22);
  OUTLINED_FUNCTION_59();
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable () -> ()(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t specialized RangeReplaceableCollection<>.removeLast()(uint64_t a1)
{
  uint64_t v2 = v1[1];
  if ((v2 & 0x2000000000000000) == 0)
  {
    if ((*v1 & 0xFFFFFFFFFFFFLL) != 0) {
      goto LABEL_5;
    }
    __break(1u);
  }
  if ((v2 & 0xF00000000000000) == 0)
  {
    __break(1u);
    return MEMORY[0x270F9D7B8](a1);
  }
LABEL_5:
  a1 = String.index(before:)();
  return MEMORY[0x270F9D7B8](a1);
}

uint64_t TapToRadarManager.__deallocating_deinit()
{
  TapToRadarManager.deinit();
  return MEMORY[0x270FA0228](v0, 136, 7);
}

id @nonobjc NSUserDefaults.init(suiteName:)(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = (void *)MEMORY[0x223C2E5C0]();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = objc_msgSend(v2, sel_initWithSuiteName_, v3);

  return v4;
}

uint64_t outlined init with take of RadarFilingExtras?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  uint64_t v4 = OUTLINED_FUNCTION_1_4();
  v5(v4);
  return a2;
}

uint64_t sub_21E6AA208()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 88) != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_release();
  return MEMORY[0x270FA0238](v0, 152, 7);
}

void partial apply for closure #1 in TapToRadarManager.setupLaunchTTR(createDraftContainer:title:completion:)()
{
}

uint64_t outlined retain of TapToRadarManager.CreateDraftContainer(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  outlined copy of RadarFilingExtras?(v2);
  return a1;
}

uint64_t outlined consume of RadarFilingExtras?(uint64_t result)
{
  if (result != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t closure #1 in serialize<A>(_:at:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_21E6AA3C4@<X0>(uint64_t *a1@<X8>)
{
  OUTLINED_FUNCTION_3_3();
  uint64_t result = (*(uint64_t (**)(void))(v2 + 152))();
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_21E6AA410@<X0>(uint64_t *a1@<X8>)
{
  OUTLINED_FUNCTION_3_3();
  uint64_t result = (*(uint64_t (**)(void))(v2 + 176))();
  *a1 = result;
  return result;
}

uint64_t sub_21E6AA45C@<X0>(uint64_t *a1@<X8>)
{
  OUTLINED_FUNCTION_3_3();
  uint64_t result = (*(uint64_t (**)(void))(v2 + 200))();
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t destroy for TTRComponentInfo()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for TTRComponentInfo(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for TTRComponentInfo(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

void *assignWithTake for TTRComponentInfo(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  return a1;
}

uint64_t getEnumTagSinglePayload for TTRComponentInfo(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 40))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TTRComponentInfo(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for TTRComponentInfo()
{
}

uint64_t destroy for RadarFilingExtras()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for RadarFilingExtras(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for RadarFilingExtras(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for RadarFilingExtras(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for RadarFilingExtras(uint64_t *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 40))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      uint64_t v3 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v3) = -1;
      }
      int v2 = v3 - 1;
      if (v2 < 0) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RadarFilingExtras(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 40) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

void type metadata accessor for RadarFilingExtras()
{
}

uint64_t type metadata accessor for TapToRadarManager()
{
  return self;
}

uint64_t method lookup function for TapToRadarManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TapToRadarManager);
}

uint64_t dispatch thunk of TapToRadarManager.requestID.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of TapToRadarManager.requestID.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of TapToRadarManager.requestID.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of TapToRadarManager.ttrRequestManager.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of TapToRadarManager.ttrRequestManager.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of TapToRadarManager.ttrRequestManager.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of TapToRadarManager.requestText.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of TapToRadarManager.requestText.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of TapToRadarManager.requestText.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of TapToRadarManager.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 224))();
}

uint64_t dispatch thunk of TapToRadarManager.createProblem(errStatus:userDefaultSuiteName:radarComponentInfo:title:description:radarFilingExtras:completion:)()
{
  OUTLINED_FUNCTION_3_3();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v0 + 232))(v1, v2, v3, v4);
}

uint64_t dispatch thunk of TapToRadarManager.populateSiriRequestText()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t dispatch thunk of TapToRadarManager.getDefaultsContents(userDefaultSuiteName:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 248))();
}

uint64_t dispatch thunk of TapToRadarManager.writeDefaultsContents(contents:userDefaultSuiteName:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of TapToRadarManager.setupLaunchTTR(createDraftContainer:title:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 264))();
}

uint64_t dispatch thunk of TapToRadarManager.hasFiledThisIssue(errStatus:userDefaultSuiteName:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

uint64_t dispatch thunk of TapToRadarManager.getRequestID()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 280))();
}

uint64_t destroy for TapToRadarManager.CreateDraftContainer(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = *(void *)(a1 + 72);
  if (result != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for TapToRadarManager.CreateDraftContainer(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  uint64_t v8 = a2 + 72;
  uint64_t v7 = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v7 == 1)
  {
    long long v9 = *(_OWORD *)(v8 + 16);
    *(_OWORD *)(a1 + 72) = *(_OWORD *)v8;
    *(_OWORD *)(a1 + 88) = v9;
    *(void *)(a1 + 104) = *(void *)(v8 + 32);
  }
  else
  {
    uint64_t v10 = *(void *)(a2 + 80);
    uint64_t v11 = *(void *)(a2 + 88);
    *(void *)(a1 + 72) = v7;
    *(void *)(a1 + 80) = v10;
    uint64_t v12 = *(void *)(a2 + 96);
    uint64_t v13 = *(void *)(a2 + 104);
    *(void *)(a1 + 88) = v11;
    *(void *)(a1 + 96) = v12;
    *(void *)(a1 + 104) = v13;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t assignWithCopy for TapToRadarManager.CreateDraftContainer(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (long long *)(a1 + 72);
  uint64_t v6 = (long long *)(a2 + 72);
  uint64_t v5 = *(void *)(a2 + 72);
  if (*(void *)(a1 + 72) == 1)
  {
    if (v5 == 1)
    {
      long long v7 = *v6;
      long long v8 = *(_OWORD *)(a2 + 88);
      *(void *)(a1 + 104) = *(void *)(a2 + 104);
      *uint64_t v4 = v7;
      *(_OWORD *)(a1 + 88) = v8;
    }
    else
    {
      *(void *)(a1 + 72) = v5;
      *(void *)(a1 + 80) = *(void *)(a2 + 80);
      *(void *)(a1 + 88) = *(void *)(a2 + 88);
      *(void *)(a1 + 96) = *(void *)(a2 + 96);
      *(void *)(a1 + 104) = *(void *)(a2 + 104);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
  }
  else if (v5 == 1)
  {
    outlined destroy of RadarFilingExtras(a1 + 72);
    uint64_t v9 = *(void *)(a2 + 104);
    long long v10 = *(_OWORD *)(a2 + 88);
    *uint64_t v4 = *v6;
    *(_OWORD *)(a1 + 88) = v10;
    *(void *)(a1 + 104) = v9;
  }
  else
  {
    *(void *)(a1 + 72) = v5;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 80) = *(void *)(a2 + 80);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 88) = *(void *)(a2 + 88);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(a1 + 96) = *(void *)(a2 + 96);
    *(void *)(a1 + 104) = *(void *)(a2 + 104);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  return a1;
}

uint64_t outlined destroy of RadarFilingExtras(uint64_t a1)
{
  return a1;
}

void *__swift_memcpy112_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x70uLL);
}

uint64_t assignWithTake for TapToRadarManager.CreateDraftContainer(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 72);
  if (*(void *)(a1 + 72) != 1)
  {
    if (v7 != 1)
    {
      *(void *)(a1 + 72) = v7;
      swift_bridgeObjectRelease();
      *(void *)(a1 + 80) = *(void *)(a2 + 80);
      swift_bridgeObjectRelease();
      *(void *)(a1 + 88) = *(void *)(a2 + 88);
      swift_bridgeObjectRelease();
      uint64_t v9 = *(void *)(a2 + 104);
      *(void *)(a1 + 96) = *(void *)(a2 + 96);
      *(void *)(a1 + 104) = v9;
      swift_bridgeObjectRelease();
      return a1;
    }
    outlined destroy of RadarFilingExtras(a1 + 72);
  }
  long long v8 = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = v8;
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  return a1;
}

uint64_t getEnumTagSinglePayload for TapToRadarManager.CreateDraftContainer(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 112))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TapToRadarManager.CreateDraftContainer(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 112) = 1;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 112) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for TapToRadarManager.CreateDraftContainer()
{
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1)
{
  type metadata accessor for DeviceClass();
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type DeviceClass and conformance DeviceClass, MEMORY[0x263F75600]);
  uint64_t v2 = dispatch thunk of Hashable._rawHashValue(seed:)();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = type metadata accessor for DeviceClass();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    uint64_t v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type DeviceClass and conformance DeviceClass, MEMORY[0x263F75600]);
      char v15 = dispatch thunk of static Equatable.== infix(_:_:)();
      (*(void (**)(char *, uint64_t))(v12 - 8))(v7, v4);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
    }
    while (((*(void *)(v18 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
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
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

uint64_t specialized Dictionary._Variant.setValue(_:forKey:)(char a1, uint64_t a2, uint64_t a3)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(a1, a2, a3, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v9;
  return swift_bridgeObjectRelease();
}

uint64_t specialized _NativeDictionary.setValue(_:forKey:isUnique:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v11 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v12 & 1) == 0;
  Swift::Int v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v16 = v11;
  char v17 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _NativeDictionary<String, [String : String]>);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a4 & 1, v15)) {
    goto LABEL_5;
  }
  unint64_t v18 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
  if ((v17 & 1) != (v19 & 1))
  {
LABEL_11:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v16 = v18;
LABEL_5:
  uint64_t v20 = *v5;
  if (v17)
  {
    uint64_t v21 = v20[7];
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)(v21 + 8 * v16) = a1;
  }
  else
  {
    specialized _NativeDictionary._insert(at:key:value:)(v16, a2, a3, a1, v20);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t specialized _NativeDictionary.setValue(_:forKey:isUnique:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  unint64_t v6 = (void **)v5;
  char v12 = (void *)*v5;
  unint64_t v13 = specialized __RawDictionaryStorage.find<A>(_:)(a3, a4);
  uint64_t v15 = v12[2];
  BOOL v16 = (v14 & 1) == 0;
  Swift::Int v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v18 = v13;
  char v19 = v14;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _NativeDictionary<String, String>);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a5 & 1, v17)) {
    goto LABEL_5;
  }
  unint64_t v20 = specialized __RawDictionaryStorage.find<A>(_:)(a3, a4);
  if ((v19 & 1) != (v21 & 1))
  {
LABEL_11:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v18 = v20;
LABEL_5:
  id v22 = *v6;
  if (v19)
  {
    uint64_t v23 = (uint64_t *)(v22[7] + 16 * v18);
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v23 = a1;
    v23[1] = a2;
  }
  else
  {
    specialized _NativeDictionary._insert(at:key:value:)(v18, a3, a4, a1, a2, v22);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t specialized _NativeDictionary.setValue(_:forKey:isUnique:)(char a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v11 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v12 & 1) == 0;
  Swift::Int v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v16 = v11;
  char v17 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _NativeDictionary<String, Bool>);
  uint64_t result = _NativeDictionary.ensureUnique(isUnique:capacity:)(a4 & 1, v15);
  if ((result & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
  if ((v17 & 1) != (v19 & 1))
  {
LABEL_11:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v16 = result;
LABEL_5:
  unint64_t v20 = *v5;
  if (v17)
  {
    *(unsigned char *)(v20[7] + v16) = a1 & 1;
  }
  else
  {
    specialized _NativeDictionary._insert(at:key:value:)(v16, a2, a3, a1 & 1, v20);
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t specialized _NativeDictionary._insert(at:key:value:)(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  uint64_t v5 = (void *)(a5[6] + 16 * result);
  *uint64_t v5 = a2;
  v5[1] = a3;
  *(void *)(a5[7] + 8 * result) = a4;
  uint64_t v6 = a5[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a5[2] = v8;
  }
  return result;
}

unint64_t specialized _NativeDictionary._insert(at:key:value:)(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  a6[(result >> 6) + 8] |= 1 << result;
  uint64_t v6 = (void *)(a6[6] + 16 * result);
  *uint64_t v6 = a2;
  v6[1] = a3;
  BOOL v7 = (void *)(a6[7] + 16 * result);
  void *v7 = a4;
  v7[1] = a5;
  uint64_t v8 = a6[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a6[2] = v10;
  }
  return result;
}

unint64_t specialized _NativeDictionary._insert(at:key:value:)(unint64_t result, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  uint64_t v5 = (void *)(a5[6] + 16 * result);
  *uint64_t v5 = a2;
  v5[1] = a3;
  *(unsigned char *)(a5[7] + result) = a4;
  uint64_t v6 = a5[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a5[2] = v8;
  }
  return result;
}

uint64_t outlined bridged method (pb) of @objc AFSpeechPhrase.interpretations.getter(void *a1)
{
  id v1 = objc_msgSend(a1, sel_interpretations);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  type metadata accessor for OS_dispatch_queue(0, &lazy cache variable for type metadata for AFSpeechInterpretation);
  uint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

uint64_t outlined bridged method (pb) of @objc AFSpeechToken.text.getter(void *a1)
{
  id v1 = objc_msgSend(a1, sel_text);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

uint64_t outlined bridged method (ob) of @objc AFSpeechInterpretation.tokens.getter(void *a1, SEL *a2, unint64_t *a3)
{
  id v5 = [a1 *a2];

  if (!v5) {
    return 0;
  }
  type metadata accessor for OS_dispatch_queue(0, a3);
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  return v6;
}

uint64_t type metadata accessor for OS_dispatch_queue(uint64_t a1, unint64_t *a2)
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

uint64_t sub_21E6ABAE0()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 80, 7);
}

uint64_t partial apply for closure #1 in closure #1 in TapToRadarManager.createProblem(errStatus:userDefaultSuiteName:radarComponentInfo:title:description:radarFilingExtras:completion:)(char a1)
{
  return closure #1 in closure #1 in TapToRadarManager.createProblem(errStatus:userDefaultSuiteName:radarComponentInfo:title:description:radarFilingExtras:completion:)(a1, v1[2], v1[3], v1[4], v1[5], v1[6], v1[7], v1[8]);
}

uint64_t sub_21E6ABB64()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 80, 7);
}

uint64_t partial apply for closure #1 in closure #1 in closure #1 in TapToRadarManager.createProblem(errStatus:userDefaultSuiteName:radarComponentInfo:title:description:radarFilingExtras:completion:)()
{
  return closure #1 in closure #1 in closure #1 in TapToRadarManager.createProblem(errStatus:userDefaultSuiteName:radarComponentInfo:title:description:radarFilingExtras:completion:)(*(unsigned char *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56), *(uint64_t (**)(uint64_t))(v0 + 64));
}

uint64_t lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A](unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t OUTLINED_FUNCTION_1_4()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_8_2()
{
  return swift_beginAccess();
}

void OUTLINED_FUNCTION_9_2()
{
  uint64_t v2 = *(void *)(v0 - 112);
  uint64_t v3 = *(void *)(v0 - 104);
  String.append(_:)(*(Swift::String *)&v2);
}

uint64_t OUTLINED_FUNCTION_11_2()
{
  return type metadata accessor for Logger();
}

uint64_t OUTLINED_FUNCTION_12_1()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t OUTLINED_FUNCTION_15_1()
{
  return dispatch thunk of SiriEnvironment.subscript.getter();
}

uint64_t OUTLINED_FUNCTION_16_1@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  *a6 = result;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  a6[4] = a5;
  return result;
}

uint64_t OUTLINED_FUNCTION_17_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_18_0()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_19_1()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_22_0()
{
  return v0 - 112;
}

uint64_t OUTLINED_FUNCTION_24_1()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_27_0()
{
  return swift_release();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x270EEF840]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x270EEFF68]();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)MEMORY[0x270EF0120]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t type metadata accessor for Locale()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t SiriEnvironment.currentDevice.getter()
{
  return MEMORY[0x270F728F0]();
}

uint64_t static SiriEnvironment.default.getter()
{
  return MEMORY[0x270F72910]();
}

uint64_t type metadata accessor for SiriEnvironment()
{
  return MEMORY[0x270F72918]();
}

uint64_t dispatch thunk of SiriEnvironment.subscript.getter()
{
  return MEMORY[0x270F72920]();
}

uint64_t dispatch thunk of SiriEnvironment.subscript.setter()
{
  return MEMORY[0x270F72928]();
}

uint64_t static AudioSource.carAudio.getter()
{
  return MEMORY[0x270F72968]();
}

uint64_t static AudioSource.usbAudio.getter()
{
  return MEMORY[0x270F72970]();
}

uint64_t static AudioSource.builtInMic.getter()
{
  return MEMORY[0x270F72978]();
}

uint64_t static AudioSource.carJarvisDevice.getter()
{
  return MEMORY[0x270F72980]();
}

uint64_t static AudioSource.wiredHeadsetMic.getter()
{
  return MEMORY[0x270F72988]();
}

uint64_t static AudioSource.bluetoothDoAPDevice.getter()
{
  return MEMORY[0x270F72990]();
}

uint64_t static AudioSource.bluetoothHandsFreeDevice.getter()
{
  return MEMORY[0x270F72998]();
}

uint64_t static AudioSource.lineIn.getter()
{
  return MEMORY[0x270F729A0]();
}

uint64_t static AudioSource.unknown.getter()
{
  return MEMORY[0x270F729A8]();
}

uint64_t type metadata accessor for AudioSource()
{
  return MEMORY[0x270F729B8]();
}

uint64_t type metadata accessor for DeviceClass()
{
  return MEMORY[0x270F729D0]();
}

uint64_t type metadata accessor for InputOrigin()
{
  return MEMORY[0x270F72A08]();
}

uint64_t static ResponseMode.displayForward.getter()
{
  return MEMORY[0x270F72A50]();
}

uint64_t dispatch thunk of CurrentDevice.siriLocale.getter()
{
  return MEMORY[0x270F72A80]();
}

uint64_t dispatch thunk of CurrentDevice.deviceRegionCode.getter()
{
  return MEMORY[0x270F72A98]();
}

uint64_t dispatch thunk of CurrentDevice.preferencesLanguageCode.getter()
{
  return MEMORY[0x270F72AB0]();
}

uint64_t type metadata accessor for InteractionType()
{
  return MEMORY[0x270F72B28]();
}

uint64_t static AudioDestination.carAudio.getter()
{
  return MEMORY[0x270F72B58]();
}

uint64_t static AudioDestination.bluetoothA2DPDevice.getter()
{
  return MEMORY[0x270F72B68]();
}

uint64_t static AudioDestination.bluetoothHandsFreeDevice.getter()
{
  return MEMORY[0x270F72B70]();
}

uint64_t type metadata accessor for AudioDestination()
{
  return MEMORY[0x270F72B88]();
}

uint64_t static ExecutionLocation.unknown.getter()
{
  return MEMORY[0x270F72B90]();
}

uint64_t type metadata accessor for ExecutionLocation()
{
  return MEMORY[0x270F72B98]();
}

uint64_t MockablePublished.init(wrappedValue:)()
{
  return MEMORY[0x270F72BA0]();
}

uint64_t dispatch thunk of MockablePublished.projectedValue.getter()
{
  return MEMORY[0x270F72BA8]();
}

uint64_t dispatch thunk of MockablePublished.projectedValue.setter()
{
  return MEMORY[0x270F72BB0]();
}

uint64_t static MockablePublished.subscript.modify()
{
  return MEMORY[0x270F72BB8]();
}

uint64_t static MockablePublished.subscript.getter()
{
  return MEMORY[0x270F72BC0]();
}

uint64_t static MockablePublished.subscript.setter()
{
  return MEMORY[0x270F72BC8]();
}

uint64_t dispatch thunk of DeviceClassProvider.currentDeviceClass.getter()
{
  return MEMORY[0x270F72BE8]();
}

uint64_t static MockableEnvironmentProvider.adjustMock(_:)()
{
  return MEMORY[0x270F72C40]();
}

uint64_t MockableEnvironmentProvider.mock<A>(override:run:)()
{
  return MEMORY[0x270F72C48]();
}

uint64_t static MobileGestaltDeviceClassProvider.shared.getter()
{
  return MEMORY[0x270F72C60]();
}

uint64_t type metadata accessor for MobileGestaltDeviceClassProvider()
{
  return MEMORY[0x270F72C68]();
}

uint64_t static Logger.logger.getter()
{
  return MEMORY[0x270F72C70]();
}

uint64_t Builder.subscript.getter()
{
  return MEMORY[0x270F72C80]();
}

{
  return MEMORY[0x270F72C90]();
}

uint64_t type metadata accessor for HomeInfo()
{
  return MEMORY[0x270F72CA8]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t ObservableObject<>.objectWillChange.getter()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t type metadata accessor for DispatchTimeInterval()
{
  return MEMORY[0x270FA0970]();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t static DispatchQoS.default.getter()
{
  return MEMORY[0x270FA0A18]();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return MEMORY[0x270FA0A48]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x270EF1818]();
}

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return MEMORY[0x270F9D318]();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return MEMORY[0x270F9D478]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x270F9D598]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x270EF19B0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t String.init<A>(describing:)()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x270F9D708]();
}

uint64_t String.index(before:)()
{
  return MEMORY[0x270F9D750]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t String.init(cString:)()
{
  return MEMORY[0x270F9D7C0]();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x270F9D7E0]();
}

Swift::Void __swiftcall String.removeAll(keepingCapacity:)(Swift::Bool keepingCapacity)
{
}

uint64_t RawRepresentable<>.encode(to:)()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t RawRepresentable<>.init(from:)()
{
  return MEMORY[0x270F9DB18]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x270EF1B88]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t Array.description.getter()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t Set.description.getter()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t Set.init(minimumCapacity:)()
{
  return MEMORY[0x270F9DEF0]();
}

NSNumber __swiftcall Int._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x270EF1CE0]();
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

uint64_t static os_log_type_t.default.getter()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return MEMORY[0x270FA0DB8]();
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

uint64_t StringProtocol.contains<A>(_:)()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return MEMORY[0x270F9E670]();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t static _SetStorage.copy(original:)()
{
  return MEMORY[0x270F9E958]();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x270F9E960]();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return MEMORY[0x270F9E970]();
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

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x270F9EB28]();
}

Swift::Bool __swiftcall _NativeDictionary.ensureUnique(isUnique:capacity:)(Swift::Bool isUnique, Swift::Int capacity)
{
  return MEMORY[0x270F9EF08](isUnique, capacity);
}

uint64_t _NativeDictionary._delete(at:)()
{
  return MEMORY[0x270F9EF20]();
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

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9F0C0]();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x270F9F230](cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x270F9FB18]();
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

uint64_t CUGestaltDeviceClassToString()
{
  return MEMORY[0x270F23F38]();
}

uint64_t GestaltGetDeviceClass()
{
  return MEMORY[0x270F241A0]();
}

uint64_t GetSystemBuildVersionString()
{
  return MEMORY[0x270F24200]();
}

uint64_t IsAppleInternalBuild()
{
  return MEMORY[0x270F243B8]();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return MEMORY[0x270F90B78]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
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

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x270FA0568]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}