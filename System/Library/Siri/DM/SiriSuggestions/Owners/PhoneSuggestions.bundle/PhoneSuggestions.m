void *StartCallSuggestionParams.identifier.unsafeMutableAddressor()
{
  return &static StartCallSuggestionParams.identifier;
}

unint64_t static StartCallSuggestionParams.identifier.getter()
{
  return 0xD000000000000013;
}

uint64_t variable initialization expression of StartCallSuggestionParams.name()
{
  return 0;
}

uint64_t StartCallSuggestionParams.name.getter(uint64_t a1)
{
  return a1;
}

uint64_t StartCallSuggestionParams.name.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*StartCallSuggestionParams.name.modify())()
{
  return StartCallSuggestionParams.name.modify;
}

uint64_t StartCallSuggestionParams.isFaceTime.getter(uint64_t a1, uint64_t a2, char a3)
{
  return a3 & 1;
}

uint64_t StartCallSuggestionParams.isFaceTime.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 16) = result;
  return result;
}

uint64_t (*StartCallSuggestionParams.isFaceTime.modify())()
{
  return StartCallSuggestionParams.name.modify;
}

uint64_t StartCallSuggestionParams.isGroupCall.getter(uint64_t a1, uint64_t a2, unsigned int a3)
{
  return (a3 >> 8) & 1;
}

uint64_t StartCallSuggestionParams.isGroupCall.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 17) = result;
  return result;
}

uint64_t (*StartCallSuggestionParams.isGroupCall.modify())()
{
  return StartCallSuggestionParams.name.modify;
}

uint64_t StartCallSuggestionParams.dictionary.getter(uint64_t a1, unint64_t a2, __int16 a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any)>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_E020;
  if (one-time initialization token for Name != -1) {
    swift_once();
  }
  uint64_t v7 = *(void *)algn_15268;
  *(void *)(inited + 32) = static CATParameterIdentifier.Name;
  *(void *)(inited + 40) = v7;
  *(void *)(inited + 72) = &type metadata for String;
  if (a2) {
    uint64_t v8 = a1;
  }
  else {
    uint64_t v8 = 0;
  }
  unint64_t v9 = 0xE000000000000000;
  if (a2) {
    unint64_t v9 = a2;
  }
  *(void *)(inited + 48) = v8;
  *(void *)(inited + 56) = v9;
  uint64_t v10 = one-time initialization token for IsFaceTime;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v10 != -1) {
    swift_once();
  }
  uint64_t v11 = *(void *)algn_15278;
  *(void *)(inited + 80) = static CATParameterIdentifier.IsFaceTime;
  *(void *)(inited + 88) = v11;
  *(void *)(inited + 120) = &type metadata for Bool;
  *(unsigned char *)(inited + 96) = a3 & 1;
  uint64_t v12 = one-time initialization token for IsGroupCall;
  swift_bridgeObjectRetain();
  if (v12 != -1) {
    swift_once();
  }
  uint64_t v13 = *(void *)algn_15288;
  *(void *)(inited + 128) = static CATParameterIdentifier.IsGroupCall;
  *(void *)(inited + 136) = v13;
  *(void *)(inited + 168) = &type metadata for Bool;
  *(unsigned char *)(inited + 144) = HIBYTE(a3) & 1;
  swift_bridgeObjectRetain();
  return Dictionary.init(dictionaryLiteral:)();
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

ValueMetadata *StartCallSuggestionParams.toDialog(dialogProvider:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, __int16 a4@<W3>, uint64_t a5@<X8>)
{
  outlined init with copy of DialogProvider(a1, (uint64_t)v11);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DialogProvider);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CATDialogProvider);
  if (swift_dynamicCast())
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v10);
    a2 = StartCallSuggestionParams.dictionary.getter(a2, a3, a4 & 0x101);
    uint64_t result = (ValueMetadata *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Any]);
  }
  else
  {
    *(void *)(a5 + 8) = a3;
    *(unsigned char *)(a5 + 16) = a4 & 1;
    *(unsigned char *)(a5 + 17) = HIBYTE(a4) & 1;
    swift_bridgeObjectRetain();
    uint64_t result = &type metadata for StartCallSuggestionParams;
  }
  *(void *)(a5 + 24) = result;
  *(void *)a5 = a2;
  return result;
}

PhoneSuggestions::StartCallSuggestionParams __swiftcall StartCallSuggestionParams.init(name:isFaceTime:isGroupCall:)(Swift::String_optional name, Swift::Bool isFaceTime, Swift::Bool isGroupCall)
{
  if (isGroupCall) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  __int16 v4 = v3 & 0xFFFE | isFaceTime;
  result.name = name;
  result.isFaceTime = v4;
  result.isGroupCall = HIBYTE(v4);
  return result;
}

ValueMetadata *protocol witness for DialogParameterProvider.toDialog(dialogProvider:) in conformance StartCallSuggestionParams@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (*(unsigned char *)(v2 + 17)) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  return StartCallSuggestionParams.toDialog(dialogProvider:)(a1, *(void *)v2, *(void *)(v2 + 8), v3 | *(unsigned __int8 *)(v2 + 16), a2);
}

PhoneSuggestions::StartCallSuggestionParams __swiftcall StartCallSuggestionParams.init(intent:)(INStartCallIntent intent)
{
  unint64_t v2 = outlined bridged method (pb) of @objc INStartCallIntent.contacts.getter(intent.super.super.isa);
  uint64_t v5 = v2;
  if (!v2) {
    goto LABEL_10;
  }
  if (v2 >> 62)
  {
    uint64_t v6 = _CocoaArrayWrapper.endIndex.getter();
    if (v6) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  uint64_t v6 = *(void *)((char *)&dword_10 + (v2 & 0xFFFFFFFFFFFFFF8));
  if (!v6)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    uint64_t v5 = 0;
LABEL_10:
    unint64_t v11 = 0xE000000000000000;
    goto LABEL_11;
  }
LABEL_4:
  if ((v5 & 0xC000000000000001) != 0)
  {
    id v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
  }
  else
  {
    if (!*(void *)((char *)&dword_10 + (v5 & 0xFFFFFFFFFFFFFF8)))
    {
      __break(1u);
      goto LABEL_20;
    }
    id v7 = *(id *)(v5 + 32);
  }
  uint64_t v8 = v7;
  swift_bridgeObjectRelease();
  id v9 = [v8 displayName];

  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v11 = v10;

LABEL_11:
  uint64_t v12 = (char *)[(objc_class *)intent.super.super.isa preferredCallProvider];
  unint64_t v13 = outlined bridged method (pb) of @objc INStartCallIntent.contacts.getter(intent.super.super.isa);
  if (v13)
  {
    if (v13 >> 62) {
      uint64_t v14 = _CocoaArrayWrapper.endIndex.getter();
    }
    else {
      uint64_t v14 = *(void *)((char *)&dword_10 + (v13 & 0xFFFFFFFFFFFFFF8));
    }
    swift_bridgeObjectRelease();

    __int16 v15 = (v14 > 1) << 8;
  }
  else
  {

    __int16 v15 = 0;
  }
  __int16 v4 = v15 | (v12 == (unsigned char *)&dword_0 + 2);
  uint64_t v6 = v5;
  __int16 v3 = (void *)v11;
LABEL_20:
  result.name.value._object = v3;
  result.name.value._countAndFlagsBits = v6;
  result.isFaceTime = v4;
  result.isGroupCall = HIBYTE(v4);
  return result;
}

uint64_t default argument 1 of static PhoneCallAppNameConstants.isPhoneOrFaceTime(appId:isInsensitive:)()
{
  return 1;
}

uint64_t outlined init with copy of DialogProvider(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

uint64_t variable initialization expression of ResolveContactOrGroupEntity.resolverTypeOperand()
{
  return 1701667182;
}

uint64_t variable initialization expression of ResolveGeneralReference.resolverTypeOperand()
{
  return 0x7265666552736168;
}

uint64_t variable initialization expression of ResolveStartCallParams.resolverTypeOperand()
{
  return 0x6C6143656E6F6870;
}

unint64_t specialized Array._checkSubscript(_:wasNativeTypeChecked:)(unint64_t result, char a2, uint64_t a3)
{
  if (a2)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8)) > result)
    {
      return result;
    }
    __break(1u);
  }
  return result;
}

uint64_t outlined bridged method (pb) of @objc INStartCallIntent.contacts.getter(void *a1)
{
  id v1 = [a1 contacts];
  if (!v1) {
    return 0;
  }
  unint64_t v2 = v1;
  type metadata accessor for INPerson();
  uint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

uint64_t destroy for StartCallSuggestionParams()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeBufferWithCopyOfBuffer for StartCallSuggestionParams(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for StartCallSuggestionParams(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  return a1;
}

__n128 __swift_memcpy18_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for StartCallSuggestionParams(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  return a1;
}

uint64_t getEnumTagSinglePayload for StartCallSuggestionParams(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 18))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      unint64_t v3 = *(void *)(a1 + 8);
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

uint64_t storeEnumTagSinglePayload for StartCallSuggestionParams(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_WORD *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 18) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 18) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StartCallSuggestionParams()
{
  return &type metadata for StartCallSuggestionParams;
}

unint64_t type metadata accessor for INPerson()
{
  unint64_t result = lazy cache variable for type metadata for INPerson;
  if (!lazy cache variable for type metadata for INPerson)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for INPerson);
  }
  return result;
}

void *PhoneCallAppNameConstants.inCallServiceBundleId.unsafeMutableAddressor()
{
  return &static PhoneCallAppNameConstants.inCallServiceBundleId;
}

unint64_t static PhoneCallAppNameConstants.inCallServiceBundleId.getter()
{
  return OUTLINED_FUNCTION_0(23);
}

void *PhoneCallAppNameConstants.carouselBundleId.unsafeMutableAddressor()
{
  return &static PhoneCallAppNameConstants.carouselBundleId;
}

unint64_t static PhoneCallAppNameConstants.carouselBundleId.getter()
{
  return OUTLINED_FUNCTION_0(18);
}

void *PhoneCallAppNameConstants.mobilePhoneBundleId.unsafeMutableAddressor()
{
  return &static PhoneCallAppNameConstants.mobilePhoneBundleId;
}

unint64_t static PhoneCallAppNameConstants.mobilePhoneBundleId.getter()
{
  return OUTLINED_FUNCTION_0(21);
}

void *PhoneCallAppNameConstants.macFaceTimeVocBundleId.unsafeMutableAddressor()
{
  return &static PhoneCallAppNameConstants.macFaceTimeVocBundleId;
}

unint64_t static PhoneCallAppNameConstants.macFaceTimeVocBundleId.getter()
{
  return OUTLINED_FUNCTION_0(18);
}

void one-time initialization function for macFaceTimeBundleId()
{
  id v0 = (id)TUPreferredFaceTimeBundleIdentifier();
  uint64_t v1 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v3 = v2;

  static PhoneCallAppNameConstants.macFaceTimeBundleId = v1;
  *(void *)algn_15218 = v3;
}

uint64_t *PhoneCallAppNameConstants.macFaceTimeBundleId.unsafeMutableAddressor()
{
  if (one-time initialization token for macFaceTimeBundleId != -1) {
    swift_once();
  }
  return &static PhoneCallAppNameConstants.macFaceTimeBundleId;
}

uint64_t static PhoneCallAppNameConstants.macFaceTimeBundleId.getter()
{
  return static PhoneCallAppNameConstants.macFaceTimeBundleId.getter(&one-time initialization token for macFaceTimeBundleId);
}

void *PhoneCallAppNameConstants.faceTimeBundleId.unsafeMutableAddressor()
{
  return &static PhoneCallAppNameConstants.faceTimeBundleId;
}

unint64_t static PhoneCallAppNameConstants.getFaceTimeBundleIdForCurrentPlatform()()
{
  return OUTLINED_FUNCTION_0(18);
}

void *PhoneCallAppNameConstants.nanophoneBundleId.unsafeMutableAddressor()
{
  return &static PhoneCallAppNameConstants.nanophoneBundleId;
}

unint64_t static PhoneCallAppNameConstants.nanophoneBundleId.getter()
{
  return OUTLINED_FUNCTION_0(19);
}

void *PhoneCallAppNameConstants.walkieTalkieBundleId.unsafeMutableAddressor()
{
  return &static PhoneCallAppNameConstants.walkieTalkieBundleId;
}

unint64_t static PhoneCallAppNameConstants.walkieTalkieBundleId.getter()
{
  return OUTLINED_FUNCTION_0(16);
}

void *PhoneCallAppNameConstants.walkieTalkieInternalBundleId.unsafeMutableAddressor()
{
  return &static PhoneCallAppNameConstants.walkieTalkieInternalBundleId;
}

unint64_t static PhoneCallAppNameConstants.walkieTalkieInternalBundleId.getter()
{
  return OUTLINED_FUNCTION_0(39);
}

void *PhoneCallAppNameConstants.walkieTalkieExtensionBundleId.unsafeMutableAddressor()
{
  return &static PhoneCallAppNameConstants.walkieTalkieExtensionBundleId;
}

unint64_t static PhoneCallAppNameConstants.walkieTalkieExtensionBundleId.getter()
{
  return OUTLINED_FUNCTION_0(30);
}

void *PhoneCallAppNameConstants.messagesBundleId.unsafeMutableAddressor()
{
  return &static PhoneCallAppNameConstants.messagesBundleId;
}

unint64_t static PhoneCallAppNameConstants.messagesBundleId.getter()
{
  return OUTLINED_FUNCTION_0(19);
}

void *PhoneCallAppNameConstants.emergencyBundleId.unsafeMutableAddressor()
{
  return &static PhoneCallAppNameConstants.emergencyBundleId;
}

unint64_t static PhoneCallAppNameConstants.emergencyBundleId.getter()
{
  return OUTLINED_FUNCTION_0(34);
}

void *PhoneCallAppNameConstants.mapBundleId.unsafeMutableAddressor()
{
  return &static PhoneCallAppNameConstants.mapBundleId;
}

unint64_t static PhoneCallAppNameConstants.mapBundleId.getter()
{
  return OUTLINED_FUNCTION_0(22);
}

void *PhoneCallAppNameConstants.faceTimeSettingsRoot.unsafeMutableAddressor()
{
  return &static PhoneCallAppNameConstants.faceTimeSettingsRoot;
}

unint64_t static PhoneCallAppNameConstants.faceTimeSettingsRoot.getter()
{
  return OUTLINED_FUNCTION_0(19);
}

void *PhoneCallAppNameConstants.phoneSettingsRoot.unsafeMutableAddressor()
{
  return &static PhoneCallAppNameConstants.phoneSettingsRoot;
}

unint64_t static PhoneCallAppNameConstants.phoneSettingsRoot.getter()
{
  return OUTLINED_FUNCTION_0(16);
}

void one-time initialization function for settingsRoot()
{
  static PhoneCallAppNameConstants.settingsRoot = 0x3A7366657270;
  *(void *)algn_15228 = 0xE600000000000000;
}

uint64_t *PhoneCallAppNameConstants.settingsRoot.unsafeMutableAddressor()
{
  if (one-time initialization token for settingsRoot != -1) {
    swift_once();
  }
  return &static PhoneCallAppNameConstants.settingsRoot;
}

uint64_t static PhoneCallAppNameConstants.settingsRoot.getter()
{
  return static PhoneCallAppNameConstants.macFaceTimeBundleId.getter(&one-time initialization token for settingsRoot);
}

uint64_t one-time initialization function for inCallServiceLaunchId()
{
  _StringGuts.grow(_:)(21);
  uint64_t result = swift_bridgeObjectRelease();
  static PhoneCallAppNameConstants.inCallServiceLaunchId = 0xD00000000000002ALL;
  *(void *)algn_15238 = 0x800000000000E970;
  return result;
}

uint64_t *PhoneCallAppNameConstants.inCallServiceLaunchId.unsafeMutableAddressor()
{
  if (one-time initialization token for inCallServiceLaunchId != -1) {
    swift_once();
  }
  return &static PhoneCallAppNameConstants.inCallServiceLaunchId;
}

uint64_t static PhoneCallAppNameConstants.inCallServiceLaunchId.getter()
{
  return static PhoneCallAppNameConstants.macFaceTimeBundleId.getter(&one-time initialization token for inCallServiceLaunchId);
}

void *PhoneCallAppNameConstants.systemExtensionBundleId.unsafeMutableAddressor()
{
  return &static PhoneCallAppNameConstants.systemExtensionBundleId;
}

unint64_t static PhoneCallAppNameConstants.systemExtensionBundleId.getter()
{
  return OUTLINED_FUNCTION_0(47);
}

void *PhoneCallAppNameConstants.systemUIExtensionBundleId.unsafeMutableAddressor()
{
  return &static PhoneCallAppNameConstants.systemUIExtensionBundleId;
}

unint64_t static PhoneCallAppNameConstants.systemUIExtensionBundleId.getter()
{
  return OUTLINED_FUNCTION_0(33);
}

void *PhoneCallAppNameConstants.internalWatchAppSuffix.unsafeMutableAddressor()
{
  return &static PhoneCallAppNameConstants.internalWatchAppSuffix;
}

unint64_t static PhoneCallAppNameConstants.internalWatchAppSuffix.getter()
{
  return OUTLINED_FUNCTION_0(23);
}

void *PhoneCallAppNameConstants.contactsBundleId.unsafeMutableAddressor()
{
  return &static PhoneCallAppNameConstants.contactsBundleId;
}

unint64_t static PhoneCallAppNameConstants.contactsBundleId.getter()
{
  return OUTLINED_FUNCTION_0(27);
}

void one-time initialization function for siriAppBundleId()
{
  algn_15248[7] = -18;
}

uint64_t *PhoneCallAppNameConstants.siriAppBundleId.unsafeMutableAddressor()
{
  if (one-time initialization token for siriAppBundleId != -1) {
    swift_once();
  }
  return &static PhoneCallAppNameConstants.siriAppBundleId;
}

uint64_t static PhoneCallAppNameConstants.siriAppBundleId.getter()
{
  return static PhoneCallAppNameConstants.macFaceTimeBundleId.getter(&one-time initialization token for siriAppBundleId);
}

uint64_t static PhoneCallAppNameConstants.macFaceTimeBundleId.getter(void *a1)
{
  if (*a1 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  return OUTLINED_FUNCTION_5();
}

void *PhoneCallAppNameConstants.mobilePhoneContactsTabURI.unsafeMutableAddressor()
{
  return &static PhoneCallAppNameConstants.mobilePhoneContactsTabURI;
}

unint64_t static PhoneCallAppNameConstants.mobilePhoneContactsTabURI.getter()
{
  return OUTLINED_FUNCTION_0(23);
}

void *PhoneCallAppNameConstants.openCallRecordURI.unsafeMutableAddressor()
{
  return &static PhoneCallAppNameConstants.openCallRecordURI;
}

unint64_t static PhoneCallAppNameConstants.openCallRecordURI.getter()
{
  return OUTLINED_FUNCTION_0(32);
}

uint64_t static PhoneCallAppNameConstants.sanitizeFirstPartyAppId(_:)(uint64_t a1, uint64_t a2)
{
  if ((static PhoneCallAppNameConstants.isFaceTimeCaseInsensitive(appId:)(a1, a2) & 1) == 0) {
    swift_bridgeObjectRetain();
  }
  return OUTLINED_FUNCTION_5();
}

uint64_t static PhoneCallAppNameConstants.isFaceTimeCaseInsensitive(appId:)(uint64_t countAndFlagsBits, uint64_t a2)
{
  if (a2) {
    object = String.lowercased()()._object;
  }
  else {
    object = 0;
  }
  OUTLINED_FUNCTION_9();
  uint64_t v6 = v5;
  if (!object)
  {
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  OUTLINED_FUNCTION_6();
  BOOL v7 = v7 && object == v6;
  if (v7) {
    goto LABEL_23;
  }
  char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v8 & 1) == 0)
  {
LABEL_12:
    if (a2)
    {
      Swift::String v10 = String.lowercased()();
      countAndFlagsBits = v10._countAndFlagsBits;
      unint64_t v11 = v10._object;
    }
    else
    {
      unint64_t v11 = 0;
    }
    if (one-time initialization token for macFaceTimeBundleId != -1) {
      swift_once();
    }
    Swift::String v12 = String.lowercased()();
    if (!v11)
    {
      char v9 = 0;
      goto LABEL_26;
    }
    if (countAndFlagsBits != v12._countAndFlagsBits || v11 != v12._object)
    {
      OUTLINED_FUNCTION_5();
      char v9 = _stringCompareWithSmolCheck(_:_:expecting:)();
LABEL_24:
      swift_bridgeObjectRelease();
LABEL_26:
      swift_bridgeObjectRelease();
      return v9 & 1;
    }
LABEL_23:
    char v9 = 1;
    goto LABEL_24;
  }
  char v9 = 1;
  return v9 & 1;
}

uint64_t static PhoneCallAppNameConstants.isFaceTime(appId:)(uint64_t a1, uint64_t a2)
{
  char v2 = a2;
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_E0A0;
    *(void *)(inited + 32) = 0xD000000000000012;
    *(void *)(inited + 40) = 0x800000000000E6C0;
    if (one-time initialization token for macFaceTimeBundleId != -1) {
      swift_once();
    }
    uint64_t v4 = *(void *)algn_15218;
    *(void *)(inited + 48) = static PhoneCallAppNameConstants.macFaceTimeBundleId;
    *(void *)(inited + 56) = v4;
    swift_bridgeObjectRetain();
    uint64_t v5 = specialized Set.init(_nonEmptyArrayLiteral:)(inited);
    char v2 = OUTLINED_FUNCTION_8(v5);
    swift_bridgeObjectRelease();
  }
  return v2 & 1;
}

uint64_t specialized Set.contains(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    Hasher.init(_seed:)();
    String.hash(into:)();
    Swift::Int v6 = Hasher._finalize()();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      unint64_t v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
            break;
          }
          uint64_t result = 0;
          unint64_t v15 = (v15 + 1) & v14;
          if (((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
            return result;
          }
        }
        return 1;
      }
    }
  }
  return 0;
}

uint64_t static PhoneCallAppNameConstants.isPhone(appId:)(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  if (a1 == 0xD000000000000017)
  {
    OUTLINED_FUNCTION_2();
    if (v3) {
      return 1;
    }
  }
  if (OUTLINED_FUNCTION_1()) {
    return 1;
  }
  if (a1 == 0xD000000000000012)
  {
    OUTLINED_FUNCTION_2();
    if (v3) {
      return 1;
    }
  }
  if (OUTLINED_FUNCTION_4()) {
    return 1;
  }
  if (a1 == 0xD000000000000013)
  {
    OUTLINED_FUNCTION_2();
    if (v3) {
      return 1;
    }
  }
  if (OUTLINED_FUNCTION_1()) {
    return 1;
  }
  if (a1 == 0xD000000000000015)
  {
    OUTLINED_FUNCTION_2();
    if (v3) {
      return 1;
    }
  }
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t static PhoneCallAppNameConstants.isPhoneCaseInsensitive(appId:)(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    OUTLINED_FUNCTION_7();
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v5 = 0;
  }
  object = String.lowercased()()._object;
  if (v5)
  {
    OUTLINED_FUNCTION_6();
    BOOL v7 = v7 && v5 == object;
    if (v7) {
      goto LABEL_41;
    }
    char v8 = OUTLINED_FUNCTION_3();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v8) {
      goto LABEL_30;
    }
    if (a2) {
      goto LABEL_11;
    }
LABEL_13:
    uint64_t v10 = 0;
    goto LABEL_14;
  }
  swift_bridgeObjectRelease();
  if (!a2) {
    goto LABEL_13;
  }
LABEL_11:
  OUTLINED_FUNCTION_7();
  uint64_t v10 = v9;
LABEL_14:
  OUTLINED_FUNCTION_9();
  uint64_t v12 = v11;
  if (!v10)
  {
    swift_bridgeObjectRelease();
    if (a2) {
      goto LABEL_21;
    }
    goto LABEL_23;
  }
  OUTLINED_FUNCTION_6();
  if (v7 && v10 == v12) {
    goto LABEL_41;
  }
  char v14 = OUTLINED_FUNCTION_3();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v14 & 1) == 0)
  {
    if (a2)
    {
LABEL_21:
      OUTLINED_FUNCTION_7();
      v16 = v15;
      goto LABEL_24;
    }
LABEL_23:
    v16 = 0;
LABEL_24:
    BOOL v17 = String.lowercased()()._object;
    if (v16)
    {
      OUTLINED_FUNCTION_6();
      if (v7 && v16 == v17) {
        goto LABEL_41;
      }
      char v19 = OUTLINED_FUNCTION_3();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v19) {
        goto LABEL_30;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    if (a2)
    {
      a1 = OUTLINED_FUNCTION_7();
      v22 = v21;
    }
    else
    {
      v22 = 0;
    }
    Swift::String v23 = String.lowercased()();
    if (!v22)
    {
      char v20 = 0;
      goto LABEL_43;
    }
    if (a1 != v23._countAndFlagsBits || v22 != v23._object)
    {
      char v20 = OUTLINED_FUNCTION_3();
LABEL_42:
      swift_bridgeObjectRelease();
LABEL_43:
      swift_bridgeObjectRelease();
      return v20 & 1;
    }
LABEL_41:
    char v20 = 1;
    goto LABEL_42;
  }
LABEL_30:
  char v20 = 1;
  return v20 & 1;
}

uint64_t static PhoneCallAppNameConstants.isMessagePhoneAppCaseInsensitive(appId:)(uint64_t countAndFlagsBits, uint64_t a2)
{
  if (a2)
  {
    Swift::String v3 = String.lowercased()();
    countAndFlagsBits = v3._countAndFlagsBits;
    object = v3._object;
  }
  else
  {
    object = 0;
  }
  Swift::String v5 = String.lowercased()();
  if (object)
  {
    if (countAndFlagsBits == v5._countAndFlagsBits && object == v5._object) {
      char v7 = 1;
    }
    else {
      char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    char v7 = 0;
  }
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t static PhoneCallAppNameConstants.isPhoneOrFaceTime(appId:isInsensitive:)(uint64_t a1, uint64_t a2, char a3)
{
  char v3 = a2;
  if ((a3 & 1) == 0)
  {
    if (!a2) {
      return v3 & 1;
    }
    if (a1 != 0xD000000000000017 || (OUTLINED_FUNCTION_2(), !v10))
    {
      if ((OUTLINED_FUNCTION_1() & 1) == 0)
      {
        if (a1 != 0xD000000000000012 || (OUTLINED_FUNCTION_2(), !v10))
        {
          if ((OUTLINED_FUNCTION_4() & 1) == 0)
          {
            if (a1 != 0xD000000000000013 || (OUTLINED_FUNCTION_2(), !v10))
            {
              if ((OUTLINED_FUNCTION_1() & 1) == 0)
              {
                if (a1 != 0xD000000000000015 || (OUTLINED_FUNCTION_2(), !v10))
                {
                  if ((OUTLINED_FUNCTION_1() & 1) == 0)
                  {
                    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
                    uint64_t inited = swift_initStackObject();
                    *(_OWORD *)(inited + 16) = xmmword_E0A0;
                    *(void *)(inited + 32) = 0xD000000000000012;
                    *(void *)(inited + 40) = 0x800000000000E6C0;
                    if (one-time initialization token for macFaceTimeBundleId != -1) {
                      swift_once();
                    }
                    uint64_t v12 = *(void *)algn_15218;
                    *(void *)(inited + 48) = static PhoneCallAppNameConstants.macFaceTimeBundleId;
                    *(void *)(inited + 56) = v12;
                    swift_bridgeObjectRetain();
                    uint64_t v13 = specialized Set.init(_nonEmptyArrayLiteral:)(inited);
                    char v3 = OUTLINED_FUNCTION_8(v13);
                    swift_bridgeObjectRelease();
                    return v3 & 1;
                  }
                }
              }
            }
          }
        }
      }
    }
LABEL_19:
    char v3 = 1;
    return v3 & 1;
  }
  uint64_t v5 = OUTLINED_FUNCTION_5();
  if (static PhoneCallAppNameConstants.isPhoneCaseInsensitive(appId:)(v5, v6)) {
    goto LABEL_19;
  }
  uint64_t v7 = OUTLINED_FUNCTION_5();
  return static PhoneCallAppNameConstants.isFaceTimeCaseInsensitive(appId:)(v7, v8);
}

uint64_t specialized Set.init(_nonEmptyArrayLiteral:)(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    char v3 = &_swiftEmptySetSingleton;
    goto LABEL_25;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<String>);
  uint64_t result = static _SetStorage.allocate(capacity:)();
  char v3 = (unsigned char *)result;
  uint64_t v24 = *(void *)(a1 + 16);
  if (!v24)
  {
LABEL_25:
    swift_bridgeObjectRelease();
    return (uint64_t)v3;
  }
  unint64_t v4 = 0;
  uint64_t v5 = result + 56;
  while (v4 < *(void *)(a1 + 16))
  {
    uint64_t v6 = (uint64_t *)(a1 + 32 + 16 * v4);
    uint64_t v8 = *v6;
    uint64_t v7 = v6[1];
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v9 = -1 << v3[32];
    unint64_t v10 = result & ~v9;
    unint64_t v11 = v10 >> 6;
    uint64_t v12 = *(void *)(v5 + 8 * (v10 >> 6));
    uint64_t v13 = 1 << v10;
    if (((1 << v10) & v12) != 0)
    {
      uint64_t v14 = *((void *)v3 + 6);
      unint64_t v15 = (void *)(v14 + 16 * v10);
      BOOL v16 = *v15 == v8 && v15[1] == v7;
      if (v16 || (uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
      {
LABEL_11:
        uint64_t result = swift_bridgeObjectRelease();
        goto LABEL_22;
      }
      uint64_t v17 = ~v9;
      while (1)
      {
        unint64_t v10 = (v10 + 1) & v17;
        unint64_t v11 = v10 >> 6;
        uint64_t v12 = *(void *)(v5 + 8 * (v10 >> 6));
        uint64_t v13 = 1 << v10;
        if ((v12 & (1 << v10)) == 0) {
          break;
        }
        v18 = (void *)(v14 + 16 * v10);
        if (*v18 != v8 || v18[1] != v7)
        {
          uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_11;
      }
    }
    *(void *)(v5 + 8 * v11) = v13 | v12;
    char v20 = (void *)(*((void *)v3 + 6) + 16 * v10);
    *char v20 = v8;
    v20[1] = v7;
    uint64_t v21 = *((void *)v3 + 2);
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22) {
      goto LABEL_27;
    }
    *((void *)v3 + 2) = v23;
LABEL_22:
    if (++v4 == v24) {
      goto LABEL_25;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for PhoneCallAppNameConstants()
{
  return &type metadata for PhoneCallAppNameConstants;
}

unint64_t OUTLINED_FUNCTION_0(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFLL | 0xD000000000000000;
}

uint64_t OUTLINED_FUNCTION_1()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t OUTLINED_FUNCTION_3()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t OUTLINED_FUNCTION_4()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t OUTLINED_FUNCTION_5()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_7()
{
  return String.lowercased()()._countAndFlagsBits;
}

uint64_t OUTLINED_FUNCTION_8(uint64_t a1)
{
  return specialized Set.contains(_:)(v2, v1, a1);
}

uint64_t OUTLINED_FUNCTION_9()
{
  return String.lowercased()()._countAndFlagsBits;
}

uint64_t *CATParameterIdentifier.Name.unsafeMutableAddressor()
{
  if (one-time initialization token for Name != -1) {
    swift_once();
  }
  return &static CATParameterIdentifier.Name;
}

uint64_t *CATParameterIdentifier.IsFaceTime.unsafeMutableAddressor()
{
  if (one-time initialization token for IsFaceTime != -1) {
    swift_once();
  }
  return &static CATParameterIdentifier.IsFaceTime;
}

uint64_t *CATParameterIdentifier.IsGroupCall.unsafeMutableAddressor()
{
  if (one-time initialization token for IsGroupCall != -1) {
    swift_once();
  }
  return &static CATParameterIdentifier.IsGroupCall;
}

PhoneSuggestions::SuggestionIdentifier_optional __swiftcall SuggestionIdentifier.init(rawValue:)(Swift::String rawValue)
{
  object = rawValue._object;
  v2._countAndFlagsBits = rawValue._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of SuggestionIdentifier.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 >= 3) {
    return (PhoneSuggestions::SuggestionIdentifier_optional)3;
  }
  else {
    return (PhoneSuggestions::SuggestionIdentifier_optional)v3;
  }
}

_UNKNOWN **static SuggestionIdentifier.allCases.getter()
{
  return &outlined read-only object #0 of static SuggestionIdentifier.allCases.getter;
}

unint64_t SuggestionIdentifier.rawValue.getter(char a1)
{
  unint64_t result = 0xD000000000000013;
  if (a1)
  {
    if (a1 == 1) {
      return 0xD000000000000015;
    }
    else {
      return 0xD000000000000016;
    }
  }
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance SuggestionIdentifier(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance SuggestionIdentifier()
{
  return specialized RawRepresentable<>.hashValue.getter(*v0);
}

uint64_t protocol witness for Hashable.hash(into:) in conformance SuggestionIdentifier(uint64_t a1)
{
  return specialized RawRepresentable<>.hash(into:)(a1, *v1);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance SuggestionIdentifier(uint64_t a1)
{
  return specialized RawRepresentable<>._rawHashValue(seed:)(a1, *v1);
}

PhoneSuggestions::SuggestionIdentifier_optional protocol witness for RawRepresentable.init(rawValue:) in conformance SuggestionIdentifier@<W0>(Swift::String *a1@<X0>, PhoneSuggestions::SuggestionIdentifier_optional *a2@<X8>)
{
  result.value = SuggestionIdentifier.init(rawValue:)(*a1).value;
  a2->value = result.value;
  return result;
}

unint64_t protocol witness for RawRepresentable.rawValue.getter in conformance SuggestionIdentifier@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = SuggestionIdentifier.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void protocol witness for static CaseIterable.allCases.getter in conformance SuggestionIdentifier(void *a1@<X8>)
{
  *a1 = &outlined read-only object #0 of static SuggestionIdentifier.allCases.getter;
}

void one-time initialization function for HasReference()
{
  algn_15258[5] = 0;
  *(_WORD *)&algn_15258[6] = -5120;
}

uint64_t *CATParameterIdentifier.HasReference.unsafeMutableAddressor()
{
  if (one-time initialization token for HasReference != -1) {
    swift_once();
  }
  return &static CATParameterIdentifier.HasReference;
}

uint64_t static CATParameterIdentifier.HasReference.getter()
{
  return static CATParameterIdentifier.HasReference.getter(&one-time initialization token for HasReference, &static CATParameterIdentifier.HasReference);
}

void one-time initialization function for Name()
{
}

uint64_t static CATParameterIdentifier.Name.getter()
{
  return static CATParameterIdentifier.HasReference.getter(&one-time initialization token for Name, &static CATParameterIdentifier.Name);
}

void one-time initialization function for IsFaceTime()
{
}

uint64_t static CATParameterIdentifier.IsFaceTime.getter()
{
  return static CATParameterIdentifier.HasReference.getter(&one-time initialization token for IsFaceTime, &static CATParameterIdentifier.IsFaceTime);
}

void one-time initialization function for IsGroupCall()
{
}

uint64_t static CATParameterIdentifier.IsGroupCall.getter()
{
  return static CATParameterIdentifier.HasReference.getter(&one-time initialization token for IsGroupCall, &static CATParameterIdentifier.IsGroupCall);
}

void *ProactiveParameterIdentifier.StartCallContact.unsafeMutableAddressor()
{
  return &static ProactiveParameterIdentifier.StartCallContact;
}

unint64_t static ProactiveParameterIdentifier.StartCallContact.getter()
{
  return 0xD000000000000012;
}

void one-time initialization function for StartFacetimeCallContact()
{
  static ProactiveParameterIdentifier.StartFacetimeCallContact = 0x656D697465636166;
  *(void *)algn_15298 = 0xEF746361746E6F43;
}

uint64_t *ProactiveParameterIdentifier.StartFacetimeCallContact.unsafeMutableAddressor()
{
  if (one-time initialization token for StartFacetimeCallContact != -1) {
    swift_once();
  }
  return &static ProactiveParameterIdentifier.StartFacetimeCallContact;
}

uint64_t static ProactiveParameterIdentifier.StartFacetimeCallContact.getter()
{
  return static CATParameterIdentifier.HasReference.getter(&one-time initialization token for StartFacetimeCallContact, &static ProactiveParameterIdentifier.StartFacetimeCallContact);
}

void one-time initialization function for Contacts()
{
  static ProactiveEntityIdentifier.Contacts = 0x73746361746E6F63;
  *(void *)algn_152A8 = 0xE800000000000000;
}

uint64_t *ProactiveEntityIdentifier.Contacts.unsafeMutableAddressor()
{
  if (one-time initialization token for Contacts != -1) {
    swift_once();
  }
  return &static ProactiveEntityIdentifier.Contacts;
}

uint64_t static ProactiveEntityIdentifier.Contacts.getter()
{
  return static CATParameterIdentifier.HasReference.getter(&one-time initialization token for Contacts, &static ProactiveEntityIdentifier.Contacts);
}

void one-time initialization function for Recipients()
{
  static ProactiveEntityIdentifier.Recipients = 0x6E65697069636572;
  *(void *)algn_152B8 = 0xEA00000000007374;
}

uint64_t *ProactiveEntityIdentifier.Recipients.unsafeMutableAddressor()
{
  if (one-time initialization token for Recipients != -1) {
    swift_once();
  }
  return &static ProactiveEntityIdentifier.Recipients;
}

uint64_t static ProactiveEntityIdentifier.Recipients.getter()
{
  return static CATParameterIdentifier.HasReference.getter(&one-time initialization token for Recipients, &static ProactiveEntityIdentifier.Recipients);
}

void one-time initialization function for GroupName()
{
  static ProactiveEntityIdentifier.GroupName = 0x6D614E70756F7267;
  *(void *)algn_152C8 = 0xE900000000000065;
}

uint64_t *ProactiveEntityIdentifier.GroupName.unsafeMutableAddressor()
{
  if (one-time initialization token for GroupName != -1) {
    swift_once();
  }
  return &static ProactiveEntityIdentifier.GroupName;
}

uint64_t static ProactiveEntityIdentifier.GroupName.getter()
{
  return static CATParameterIdentifier.HasReference.getter(&one-time initialization token for GroupName, &static ProactiveEntityIdentifier.GroupName);
}

uint64_t static CATParameterIdentifier.HasReference.getter(void *a1, uint64_t *a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = *a2;
  swift_bridgeObjectRetain();
  return v3;
}

unint64_t lazy protocol witness table accessor for type SuggestionIdentifier and conformance SuggestionIdentifier()
{
  unint64_t result = lazy protocol witness table cache variable for type SuggestionIdentifier and conformance SuggestionIdentifier;
  if (!lazy protocol witness table cache variable for type SuggestionIdentifier and conformance SuggestionIdentifier)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SuggestionIdentifier and conformance SuggestionIdentifier);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type [SuggestionIdentifier] and conformance [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [SuggestionIdentifier] and conformance [A];
  if (!lazy protocol witness table cache variable for type [SuggestionIdentifier] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [SuggestionIdentifier]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [SuggestionIdentifier] and conformance [A]);
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

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SuggestionIdentifier(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SuggestionIdentifier(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x5F1CLL);
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

uint64_t getEnumTag for SuggestionIdentifier(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *destructiveInjectEnumTag for SuggestionIdentifier(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

void type metadata accessor for SuggestionIdentifier()
{
}

void type metadata accessor for CATParameterIdentifier()
{
}

void type metadata accessor for ProactiveParameterIdentifier()
{
}

void type metadata accessor for ProactiveEntityIdentifier()
{
}

void OUTLINED_FUNCTION_1_0(void *a1@<X8>)
{
  *a1 = v1;
  a1[1] = v2;
}

uint64_t one-time initialization function for kOwner()
{
  type metadata accessor for DomainOwner();
  swift_allocObject();
  uint64_t result = DomainOwner.init(_:)();
  static PhoneOwnerDefinitionFactory.kOwner = result;
  return result;
}

uint64_t *PhoneOwnerDefinitionFactory.kOwner.unsafeMutableAddressor()
{
  if (one-time initialization token for kOwner != -1) {
    swift_once();
  }
  return &static PhoneOwnerDefinitionFactory.kOwner;
}

uint64_t static PhoneOwnerDefinitionFactory.kOwner.getter()
{
  if (one-time initialization token for kOwner != -1) {
    swift_once();
  }
  return swift_retain();
}

void *PhoneOwnerDefinitionFactory.kTemplateRoot.unsafeMutableAddressor()
{
  return &static PhoneOwnerDefinitionFactory.kTemplateRoot;
}

unint64_t static PhoneOwnerDefinitionFactory.kTemplateRoot.getter()
{
  return 0xD00000000000005BLL;
}

uint64_t one-time initialization function for enabledLocales()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Locale>);
  type metadata accessor for Locale();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_E230;
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
  uint64_t result = Locale.init(identifier:)();
  static PhoneOwnerDefinitionFactory.enabledLocales = v0;
  return result;
}

uint64_t static PhoneOwnerDefinitionFactory.createOwnerDefinitions(builderFactory:)(uint64_t a1, uint64_t a2)
{
  v3[8] = a2;
  v3[9] = v2;
  v3[7] = a1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transformer<Any, Any?>);
  v3[10] = v4;
  OUTLINED_FUNCTION_0_1(v4);
  v3[11] = v5;
  v3[12] = swift_task_alloc();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transformer<Intent, IntentParameter>);
  v3[13] = v6;
  OUTLINED_FUNCTION_0_1(v6);
  v3[14] = v7;
  v3[15] = swift_task_alloc();
  return _swift_task_switch(static PhoneOwnerDefinitionFactory.createOwnerDefinitions(builderFactory:), 0, 0);
}

uint64_t static PhoneOwnerDefinitionFactory.createOwnerDefinitions(builderFactory:)()
{
  if (one-time initialization token for suggestions != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  __swift_project_value_buffer(v1, (uint64_t)static Logger.suggestions);
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "#PhoneOwnerDefinitionFactory createOwnerDefinitions", v4, 2u);
    swift_slowDealloc();
  }

  type metadata accessor for INIntent(0, &lazy cache variable for type metadata for INIntent);
  static SuggestionTransformers.mapINIntentValue<A>(extractor:)();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  Transformer.init(transform:)();
  if (one-time initialization token for kOwner != -1) {
    swift_once();
  }
  uint64_t v5 = (int *)v0[7];
  uint64_t v6 = static PhoneOwnerDefinitionFactory.kOwner;
  v0[5] = type metadata accessor for DomainOwner();
  v0[6] = lazy protocol witness table accessor for type DomainOwner and conformance DomainOwner(&lazy protocol witness table cache variable for type DomainOwner and conformance DomainOwner, (void (*)(uint64_t))&type metadata accessor for DomainOwner);
  v0[2] = v6;
  uint64_t v9 = (uint64_t (*)(void *))((char *)v5 + *v5);
  swift_retain();
  uint64_t v7 = (void *)swift_task_alloc();
  v0[16] = v7;
  *uint64_t v7 = v0;
  v7[1] = static PhoneOwnerDefinitionFactory.createOwnerDefinitions(builderFactory:);
  return v9(v0 + 2);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  OUTLINED_FUNCTION_1_1();
  uint64_t v1 = v0 + 16;
  *(void *)(v0 + 136) = v2;
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1(v1);
  return _swift_task_switch(static PhoneOwnerDefinitionFactory.createOwnerDefinitions(builderFactory:), 0, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  uint64_t v12;

  uint64_t v2 = v0[14];
  uint64_t v1 = v0[15];
  os_log_type_t v3 = v0[12];
  uint64_t v4 = v0[13];
  uint64_t v5 = v0[10];
  uint64_t v6 = v0[11];
  uint64_t v7 = v0[9];
  uint64_t v8 = (void *)swift_task_alloc();
  v8[2] = v7;
  v8[3] = v3;
  v8[4] = v1;
  dispatch thunk of SuggestionOwnerDefinitionBuilder.add(suggestionId:catId:builder:)();
  swift_release();
  swift_task_dealloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<OwnerDefinition>);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_E240;
  dispatch thunk of SuggestionOwnerDefinitionBuilder.build()();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v3, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(uint64_t))v0[1];
  return v10(v9);
}

uint64_t closure #1 in static PhoneOwnerDefinitionFactory.createOwnerDefinitions(builderFactory:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  if (one-time initialization token for suggestions != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  __swift_project_value_buffer(v4, (uint64_t)static Logger.suggestions);
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_0, v5, v6, "#PhoneOwnerDefinitionFactory running IntentTransformer", v7, 2u);
    swift_slowDealloc();
  }

  self;
  uint64_t v8 = swift_dynamicCastObjCClass();
  if (!v8) {
    goto LABEL_23;
  }
  uint64_t v9 = (void *)v8;
  id v10 = a1;
  unint64_t v11 = outlined bridged method (pb) of @objc INStartCallIntent.contacts.getter(v9);
  if (!v11)
  {

LABEL_23:
    v29 = (unsigned int *)&enum case for IntentParameter.ignore(_:);
    goto LABEL_24;
  }
  unint64_t v12 = v11;
  if (v11 >> 62)
  {
    if (_CocoaArrayWrapper.endIndex.getter()) {
      goto LABEL_9;
    }
LABEL_22:

    swift_bridgeObjectRelease();
    goto LABEL_23;
  }
  if (!*(void *)((char *)&dword_10 + (v11 & 0xFFFFFFFFFFFFFF8))) {
    goto LABEL_22;
  }
LABEL_9:
  specialized Array._checkSubscript(_:wasNativeTypeChecked:)(0, (v12 & 0xC000000000000001) == 0, v12);
  if ((v12 & 0xC000000000000001) != 0) {
    id v13 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
  }
  else {
    id v13 = *(id *)(v12 + 32);
  }
  uint64_t v14 = v13;
  swift_bridgeObjectRelease();
  uint64_t v15 = outlined bridged method (pb) of @objc INPerson.contactIdentifier.getter(v14);
  if (!v16) {
    goto LABEL_18;
  }
  uint64_t v17 = v15;
  unint64_t v18 = v16;
  swift_bridgeObjectRelease();
  uint64_t v19 = HIBYTE(v18) & 0xF;
  if ((v18 & 0x2000000000000000) == 0) {
    uint64_t v19 = v17 & 0xFFFFFFFFFFFFLL;
  }
  if (!v19)
  {
LABEL_18:

    goto LABEL_23;
  }
  id v20 = v10;
  uint64_t v21 = Logger.logObject.getter();
  os_log_type_t v22 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    v33 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v23 = 138412290;
    id v34 = v20;
    id v24 = v20;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v33 = v9;

    id v20 = v34;
    _os_log_impl(&dword_0, v21, v22, "#PhoneOwnerDefinitionFactory returning directAssignment from intent %@", v23, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v25 = v20;
  PhoneSuggestions::StartCallSuggestionParams v35 = StartCallSuggestionParams.init(intent:)((INStartCallIntent)v9);
  uint64_t countAndFlagsBits = v35.name.value._countAndFlagsBits;
  object = v35.name.value._object;
  __int16 v28 = *(_WORD *)&v35.isFaceTime;
  *(void *)(a2 + 24) = &type metadata for StartCallSuggestionParams;

  *(void *)a2 = countAndFlagsBits;
  *(void *)(a2 + 8) = object;
  *(unsigned char *)(a2 + 16) = v28 & 1;
  *(unsigned char *)(a2 + 17) = HIBYTE(v28) & 1;
  v29 = (unsigned int *)&enum case for IntentParameter.directAssignment(_:);
LABEL_24:
  uint64_t v30 = *v29;
  uint64_t v31 = type metadata accessor for IntentParameter();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 104))(a2, v30, v31);
}

void closure #2 in static PhoneOwnerDefinitionFactory.createOwnerDefinitions(builderFactory:)(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v8 = 0;
  unint64_t v9 = 0xE000000000000000;
  outlined init with copy of Any(a1, (uint64_t)v7);
  if (swift_dynamicCast())
  {
    if (v5 == 1)
    {
      if (one-time initialization token for IsFaceTime != -1) {
        swift_once();
      }
      String.append(_:)((Swift::String)static CATParameterIdentifier.IsFaceTime);
    }
    swift_bridgeObjectRelease();
    if (v6)
    {
      if (one-time initialization token for IsGroupCall != -1) {
        swift_once();
      }
      String.append(_:)((Swift::String)static CATParameterIdentifier.IsGroupCall);
    }
  }
  uint64_t v3 = v8;
  unint64_t v4 = v9;
  a2[3] = &type metadata for String;
  *a2 = v3;
  a2[1] = v4;
}

uint64_t closure #3 in static PhoneOwnerDefinitionFactory.createOwnerDefinitions(builderFactory:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v44 = a4;
  uint64_t v42 = a3;
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transformer<Intent, IntentParameter>);
  uint64_t v41 = *(void *)(v43 - 8);
  __chkstk_darwin();
  v45 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Transformer<Any, Any?>);
  uint64_t v38 = *(void *)(v6 - 8);
  uint64_t v39 = v6;
  __chkstk_darwin();
  v40 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for IntentType();
  uint64_t v36 = *(void *)(v8 - 8);
  uint64_t v37 = v8;
  __chkstk_darwin();
  PhoneSuggestions::StartCallSuggestionParams v35 = (uint64_t *)((char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = *(void *)(a1 + 24);
  long long v46 = *(_OWORD *)(a1 + 32);
  __swift_project_boxed_opaque_existential_2((void *)a1, v10);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_E250;
  type metadata accessor for Signal();
  *(void *)(v11 + 32) = static Signal.HomeScreen.getter();
  *(void *)(v11 + 40) = static Signal.DeviceLocked.getter();
  if (one-time initialization token for ContactsApp != -1) {
    swift_once();
  }
  *(void *)(v11 + 48) = static Signal.ContactsApp;
  uint64_t v12 = one-time initialization token for PhoneApp;
  swift_retain();
  if (v12 != -1) {
    swift_once();
  }
  *(void *)(v11 + 56) = static Signal.PhoneApp;
  uint64_t v13 = one-time initialization token for FaceTimeApp;
  swift_retain();
  if (v13 != -1) {
    swift_once();
  }
  *(void *)(v11 + 64) = static Signal.FaceTimeApp;
  v67[0] = v11;
  specialized Array._endMutation()();
  *(void *)v68 = v10;
  *(_OWORD *)&v68[8] = v46;
  __swift_allocate_boxed_opaque_existential_2(v67);
  swift_retain();
  dispatch thunk of SiriHelpSuggestionDetailsBuilderExtension.register(signals:)();
  swift_bridgeObjectRelease();
  uint64_t v14 = *(void *)&v68[16];
  long long v46 = *(_OWORD *)v68;
  __swift_project_boxed_opaque_existential_2(v67, *(uint64_t *)v68);
  if (one-time initialization token for enabledLocales != -1) {
    swift_once();
  }
  long long v65 = v46;
  uint64_t v66 = v14;
  __swift_allocate_boxed_opaque_existential_2(v64);
  swift_bridgeObjectRetain();
  dispatch thunk of SuggestionDetailsBuilder.enabledLocales(_:)();
  swift_bridgeObjectRelease();
  uint64_t v15 = v66;
  long long v46 = v65;
  __swift_project_boxed_opaque_existential_2(v64, v65);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<DeviceType>);
  uint64_t v16 = type metadata accessor for DeviceType();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = *(void *)(v17 + 72);
  unint64_t v19 = (*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_E0A0;
  unint64_t v21 = v20 + v19;
  os_log_type_t v22 = *(void (**)(unint64_t, void, uint64_t))(v17 + 104);
  v22(v21, enum case for DeviceType.iPhone(_:), v16);
  v22(v21 + v18, enum case for DeviceType.iPad(_:), v16);
  long long v62 = v46;
  uint64_t v63 = v15;
  __swift_allocate_boxed_opaque_existential_2(v61);
  dispatch thunk of SuggestionDetailsBuilder.enabledDevices(_:)();
  swift_bridgeObjectRelease();
  uint64_t v23 = v63;
  long long v46 = v62;
  __swift_project_boxed_opaque_existential_2(v61, v62);
  long long v59 = v46;
  uint64_t v60 = v23;
  __swift_allocate_boxed_opaque_existential_2(v58);
  dispatch thunk of SuggestionDetailsBuilder.loggingIdentifier(_:)();
  uint64_t v24 = v60;
  long long v46 = v59;
  __swift_project_boxed_opaque_existential_2(v58, v59);
  long long v56 = v46;
  uint64_t v57 = v24;
  __swift_allocate_boxed_opaque_existential_2(v55);
  dispatch thunk of SuggestionDetailsBuilder.templateRoot(_:)();
  uint64_t v25 = v57;
  long long v46 = v56;
  __swift_project_boxed_opaque_existential_2(v55, v56);
  v27 = v35;
  uint64_t v26 = v36;
  *PhoneSuggestions::StartCallSuggestionParams v35 = 0xD000000000000023;
  v27[1] = 0x800000000000EA80;
  uint64_t v28 = v37;
  (*(void (**)(void *, void, uint64_t))(v26 + 104))(v27, enum case for IntentType.inIntent(_:), v37);
  *(_OWORD *)v54 = v46;
  *(void *)&v54[16] = v25;
  __swift_allocate_boxed_opaque_existential_2(v53);
  dispatch thunk of SuggestionDetailsBuilder.intentIdentifier(_:)();
  (*(void (**)(void *, uint64_t))(v26 + 8))(v27, v28);
  uint64_t v29 = *(void *)v54;
  long long v46 = *(_OWORD *)&v54[8];
  __swift_project_boxed_opaque_existential_2(v53, *(uint64_t *)v54);
  v51[0] = type metadata accessor for INIntent(0, &lazy cache variable for type metadata for INStartCallIntent);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for INStartCallIntent.Type);
  String.init<A>(describing:)();
  *(void *)v52 = v29;
  *(_OWORD *)&v52[8] = v46;
  __swift_allocate_boxed_opaque_existential_2(v51);
  dispatch thunk of SiriHelpSuggestionDetailsBuilderExtension.enableThirdPartyIntents(_:)();
  swift_bridgeObjectRelease();
  uint64_t v30 = *(void *)&v52[16];
  long long v46 = *(_OWORD *)v52;
  __swift_project_boxed_opaque_existential_2(v51, *(uint64_t *)v52);
  uint64_t v31 = type metadata accessor for ResolveStartCallParams();
  uint64_t v32 = swift_allocObject();
  *(void *)(v32 + 16) = 0x6C6143656E6F6870;
  *(void *)(v32 + 24) = 0xEF736D617261506CLL;
  v47[3] = v31;
  v47[4] = lazy protocol witness table accessor for type DomainOwner and conformance DomainOwner(&lazy protocol witness table cache variable for type ResolveStartCallParams and conformance ResolveStartCallParams, (void (*)(uint64_t))type metadata accessor for ResolveStartCallParams);
  v47[0] = v32;
  (*(void (**)(char *, uint64_t, uint64_t))(v38 + 16))(v40, v42, v39);
  (*(void (**)(char *, uint64_t, uint64_t))(v41 + 16))(v45, v44, v43);
  type metadata accessor for ResolvableParameter();
  swift_allocObject();
  ResolvableParameter.init(typeIdentifier:required:loggingKeyTransformer:intentTransformer:)();
  long long v49 = v46;
  uint64_t v50 = v30;
  __swift_allocate_boxed_opaque_existential_2(v48);
  dispatch thunk of SuggestionDetailsBuilder.parameter(parameterName:resolver:resolveParam:shownOnLockscreen:)();
  swift_release();
  outlined destroy of Resolver?((uint64_t)v47);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v48);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v53);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v55);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v58);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v61);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v64);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v67);
}

uint64_t PhoneOwnerDefinitionFactory.deinit()
{
  return v0;
}

uint64_t PhoneOwnerDefinitionFactory.__deallocating_deinit()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t PhoneOwnerDefinitionFactory.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t protocol witness for static OwnerDefinitionFactory.createOwnerDefinitions() in conformance PhoneOwnerDefinitionFactory()
{
  return static OwnerDefinitionFactory.createOwnerDefinitions()(v0);
}

uint64_t protocol witness for static OwnerDefinitionFactory.createOwnerDefinitions(builderFactory:) in conformance PhoneOwnerDefinitionFactory(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = protocol witness for static OwnerDefinitionFactory.createOwnerDefinitions(builderFactory:) in conformance PhoneOwnerDefinitionFactory;
  return static PhoneOwnerDefinitionFactory.createOwnerDefinitions(builderFactory:)(a1, a2);
}

uint64_t protocol witness for static OwnerDefinitionFactory.createOwnerDefinitions(builderFactory:) in conformance PhoneOwnerDefinitionFactory(uint64_t a1)
{
  OUTLINED_FUNCTION_1_1();
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t Optional<A>.isNilOrEmpty.getter(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 - 8);
  __chkstk_darwin();
  unint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v5, a1);
  uint64_t v6 = *(void *)(a1 + 16);
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v6) == 1)
  {
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, a1);
    char v7 = 1;
  }
  else
  {
    char v7 = dispatch thunk of Collection.isEmpty.getter();
    (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v4, v6);
  }
  return v7 & 1;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t partial apply for closure #3 in static PhoneOwnerDefinitionFactory.createOwnerDefinitions(builderFactory:)(uint64_t a1)
{
  return closure #3 in static PhoneOwnerDefinitionFactory.createOwnerDefinitions(builderFactory:)(a1, v1[2], v1[3], v1[4]);
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t type metadata accessor for PhoneOwnerDefinitionFactory()
{
  return self;
}

void *__swift_project_boxed_opaque_existential_2(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_2(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t type metadata accessor for INIntent(uint64_t a1, unint64_t *a2)
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

uint64_t lazy protocol witness table accessor for type DomainOwner and conformance DomainOwner(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t outlined destroy of Resolver?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Resolver?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t OUTLINED_FUNCTION_0_1(uint64_t a1)
{
  return a1 - 8;
}

void ResolveStartCallParams.__allocating_init()()
{
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_9_0();
  *(void *)(v0 + 16) = v1;
  *(void *)(v0 + 24) = v2;
}

uint64_t key path setter for ResolveContactOrGroupEntity.resolverTypeOperand : ResolveContactOrGroupEntity(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(void **)a2 + 96);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t (*ResolveContactOrGroupEntity.resolverTypeOperand.modify())()
{
  return ResolveContactOrGroupEntity.resolverTypeOperand.modify;
}

uint64_t ResolveContactOrGroupEntity.resolveParameter(parameter:suggestion:interaction:environment:)()
{
  OUTLINED_FUNCTION_14();
  v1[2] = v0;
  uint64_t v2 = type metadata accessor for RREntity();
  v1[3] = v2;
  OUTLINED_FUNCTION_0_1(v2);
  v1[4] = v3;
  v1[5] = OUTLINED_FUNCTION_5_0();
  v1[6] = swift_task_alloc();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for RRCandidate?);
  OUTLINED_FUNCTION_10(v4);
  v1[7] = OUTLINED_FUNCTION_5_0();
  v1[8] = swift_task_alloc();
  return _swift_task_switch(ResolveContactOrGroupEntity.resolveParameter(parameter:suggestion:interaction:environment:), 0, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  uint64_t v8;
  void (*v9)(uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  uint64_t v25;
  void (*v26)(uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _OWORD *v33;
  uint64_t (*v34)(_OWORD *);
  uint64_t v36;

  type metadata accessor for UsoEntityBuilder_common_Group();
  OUTLINED_FUNCTION_16();
  UsoEntityBuilder_common_Group.init()();
  uint64_t v1 = static UsoBuilderConversionUtils.convertEntityBuilderToEntity(entityBuilder:)();
  swift_release();
  if (v1)
  {
    ResolveContactOrGroupEntity.getCandidate(for:)(v1, v0[8]);
    uint64_t v2 = type metadata accessor for RRCandidate();
    uint64_t v3 = OUTLINED_FUNCTION_23(v2);
    uint64_t v4 = v0[8];
    if (v3 == 1)
    {
      swift_release();
      outlined destroy of RRCandidate?(v4, &demangling cache variable for type metadata for RRCandidate?);
    }
    else
    {
      uint64_t v5 = v0[2];
      RRCandidate.entity.getter();
      uint64_t v6 = OUTLINED_FUNCTION_26();
      v7(v6);
      RREntity.usoEntity.getter();
      uint64_t v8 = OUTLINED_FUNCTION_8_0();
      v9(v8);
      uint64_t v10 = UsoEntity.attributes.getter();
      uint64_t v11 = swift_release();
      uint64_t v12 = (*(uint64_t (**)(uint64_t))(*(void *)v5 + 88))(v11);
      uint64_t v14 = specialized Dictionary.subscript.getter(v12, v13, v10);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v14)
      {
        OUTLINED_FUNCTION_18();
        if (v10) {
          specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else {
          swift_retain();
        }
        swift_bridgeObjectRelease();
        uint64_t v15 = dispatch thunk of UsoValue.getAsPrimitiveValueString()();
        uint64_t v17 = v16;
        swift_release();
        if (v17) {
          goto LABEL_16;
        }
      }
      swift_release();
    }
  }
  type metadata accessor for UsoEntityBuilder_common_Person();
  OUTLINED_FUNCTION_16();
  UsoEntityBuilder_common_Person.init()();
  uint64_t v18 = static UsoBuilderConversionUtils.convertEntityBuilderToEntity(entityBuilder:)();
  swift_release();
  if (v18)
  {
    ResolveContactOrGroupEntity.getCandidate(for:)(v18, v0[7]);
    unint64_t v19 = type metadata accessor for RRCandidate();
    uint64_t v20 = OUTLINED_FUNCTION_23(v19);
    unint64_t v21 = v0[7];
    if (v20 == 1)
    {
      swift_release();
      outlined destroy of RRCandidate?(v21, &demangling cache variable for type metadata for RRCandidate?);
      goto LABEL_18;
    }
    os_log_type_t v22 = v0[2];
    RRCandidate.entity.getter();
    uint64_t v23 = OUTLINED_FUNCTION_26();
    v24(v23);
    RREntity.usoEntity.getter();
    uint64_t v25 = OUTLINED_FUNCTION_8_0();
    v26(v25);
    v27 = UsoEntity.attributes.getter();
    uint64_t v28 = swift_release();
    uint64_t v29 = (*(uint64_t (**)(uint64_t))(*(void *)v22 + 88))(v28);
    uint64_t v31 = specialized Dictionary.subscript.getter(v29, v30, v27);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!v31) {
      goto LABEL_17;
    }
    OUTLINED_FUNCTION_18();
    if (v27) {
      specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      swift_retain();
    }
    swift_bridgeObjectRelease();
    uint64_t v15 = dispatch thunk of UsoValue.getAsPrimitiveValueString()();
    uint64_t v17 = v32;
    swift_release();
    if (!v17)
    {
LABEL_17:
      swift_release();
      goto LABEL_18;
    }
LABEL_16:
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
    v33 = (_OWORD *)OUTLINED_FUNCTION_25();
    v33[1] = xmmword_E240;
    *((void *)v33 + 7) = &type metadata for String;
    *((void *)v33 + 4) = v15;
    *((void *)v33 + 5) = v17;
    swift_release();
    goto LABEL_19;
  }
LABEL_18:
  v33 = &_swiftEmptyArrayStorage;
LABEL_19:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v34 = (uint64_t (*)(_OWORD *))v0[1];
  return v34(v33);
}

uint64_t specialized Dictionary.subscript.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) && (specialized __RawDictionaryStorage.find<A>(_:)(a1, a2), (v3 & 1) != 0)) {
    return swift_bridgeObjectRetain();
  }
  else {
    return 0;
  }
}

uint64_t ResolveContactOrGroupEntity.getCandidate(for:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for RRFilter?);
  uint64_t v6 = OUTLINED_FUNCTION_10(v5);
  __chkstk_darwin(v6);
  OUTLINED_FUNCTION_12();
  uint64_t v7 = type metadata accessor for RRQuery();
  OUTLINED_FUNCTION_1_2();
  uint64_t v9 = v8;
  __chkstk_darwin(v10);
  OUTLINED_FUNCTION_11();
  uint64_t v13 = (void *)(v12 - v11);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<RRResult, Error>);
  OUTLINED_FUNCTION_4_0();
  uint64_t v15 = __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  unint64_t v19 = (char *)&v30 - v18;
  type metadata accessor for ReferenceResolutionClient();
  ReferenceResolutionClient.__allocating_init()();
  *uint64_t v13 = a1;
  (*(void (**)(void *, void, uint64_t))(v9 + 104))(v13, enum case for RRQuery.usoReference(_:), v7);
  uint64_t v20 = type metadata accessor for RRFilter();
  __swift_storeEnumTagSinglePayload(v2, 1, 1, v20);
  swift_retain();
  dispatch thunk of ReferenceResolutionClient.resolve(reference:filter:)();
  swift_release();
  outlined destroy of RRCandidate?(v2, &demangling cache variable for type metadata for RRFilter?);
  (*(void (**)(void *, uint64_t))(v9 + 8))(v13, v7);
  if (swift_getEnumCaseMultiPayload() == 1) {
    goto LABEL_5;
  }
  outlined init with copy of Result<RRResult, Error>((uint64_t)v19, (uint64_t)v17);
  uint64_t v21 = type metadata accessor for RRResult();
  uint64_t v22 = *(void *)(v21 - 8);
  if ((*(unsigned int (**)(char *, uint64_t))(v22 + 88))(v17, v21) != enum case for RRResult.foundMatch(_:))
  {
    (*(void (**)(char *, uint64_t))(v22 + 8))(v17, v21);
LABEL_5:
    type metadata accessor for RRCandidate();
    uint64_t v25 = OUTLINED_FUNCTION_24();
    goto LABEL_6;
  }
  (*(void (**)(char *, uint64_t))(v22 + 96))(v17, v21);
  uint64_t v23 = type metadata accessor for RRCandidate();
  OUTLINED_FUNCTION_4_0();
  (*(void (**)(uint64_t, char *, uint64_t))(v24 + 32))(a2, v17, v23);
  uint64_t v25 = a2;
  uint64_t v26 = 0;
  uint64_t v27 = 1;
  uint64_t v28 = v23;
LABEL_6:
  __swift_storeEnumTagSinglePayload(v25, v26, v27, v28);
  return outlined destroy of RRCandidate?((uint64_t)v19, &demangling cache variable for type metadata for Result<RRResult, Error>);
}

uint64_t ResolveContactOrGroupEntity.__allocating_init()()
{
  uint64_t result = OUTLINED_FUNCTION_17();
  *(void *)(result + 16) = 1701667182;
  *(void *)(result + 24) = 0xE400000000000000;
  return result;
}

void ResolveContactOrGroupEntity.init()()
{
}

uint64_t protocol witness for InternalResolver.resolverTypeOperand.getter in conformance ResolveContactOrGroupEntity()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 88))();
}

uint64_t protocol witness for InternalResolver.resolveParameter(parameter:suggestion:interaction:environment:) in conformance ResolveContactOrGroupEntity(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(**(void **)v4 + 112)
                                                                   + **(int **)(**(void **)v4 + 112));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  *uint64_t v10 = v5;
  v10[1] = protocol witness for InternalResolver.resolveParameter(parameter:suggestion:interaction:environment:) in conformance ResolveContactOrGroupEntity;
  return v12(a1, a2, a3, a4);
}

uint64_t protocol witness for Wrappable.getRoot() in conformance ResolveContactOrGroupEntity()
{
  return Wrappable.getRoot()();
}

uint64_t key path setter for ResolveGeneralReference.resolverTypeOperand : ResolveGeneralReference(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(void **)a2 + 96);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t ResolveGeneralReference.resolveParameter(parameter:suggestion:interaction:environment:)()
{
  *(void *)(v1 + 16) = v0;
  return _swift_task_switch(ResolveGeneralReference.resolveParameter(parameter:suggestion:interaction:environment:), 0, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _OWORD *v4;
  uint64_t (*v5)(_OWORD *);
  uint64_t v7;

  OUTLINED_FUNCTION_14();
  type metadata accessor for UsoEntityBuilder_common_Group();
  OUTLINED_FUNCTION_16();
  UsoEntityBuilder_common_Group.init()();
  uint64_t v1 = static UsoBuilderConversionUtils.convertEntityBuilderToEntity(entityBuilder:)();
  swift_release();
  if (v1)
  {
    if (ResolveGeneralReference.hasReference(for:)(v1)) {
      goto LABEL_9;
    }
    swift_release();
  }
  type metadata accessor for UsoEntityBuilder_common_Person();
  OUTLINED_FUNCTION_16();
  UsoEntityBuilder_common_Person.init()();
  uint64_t v2 = static UsoBuilderConversionUtils.convertEntityBuilderToEntity(entityBuilder:)();
  swift_release();
  if (v2)
  {
    if (ResolveGeneralReference.hasReference(for:)(v2)) {
      goto LABEL_9;
    }
    swift_release();
  }
  type metadata accessor for UsoEntityBuilder_common_PhoneNumber();
  OUTLINED_FUNCTION_16();
  UsoEntityBuilder_common_PhoneNumber.init()();
  uint64_t v3 = static UsoBuilderConversionUtils.convertEntityBuilderToEntity(entityBuilder:)();
  swift_release();
  if (v3)
  {
    if ((ResolveGeneralReference.hasReference(for:)(v3) & 1) == 0)
    {
      uint64_t v4 = &_swiftEmptyArrayStorage;
      goto LABEL_10;
    }
LABEL_9:
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
    uint64_t v4 = (_OWORD *)OUTLINED_FUNCTION_25();
    v4[1] = xmmword_E240;
    *((void *)v4 + 7) = &type metadata for Bool;
    *((unsigned char *)v4 + 32) = 1;
LABEL_10:
    swift_release();
    goto LABEL_11;
  }
  uint64_t v4 = &_swiftEmptyArrayStorage;
LABEL_11:
  uint64_t v5 = *(uint64_t (**)(_OWORD *))(v0 + 8);
  return v5(v4);
}

uint64_t ResolveGeneralReference.hasReference(for:)(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for RRFilter?);
  uint64_t v4 = OUTLINED_FUNCTION_10(v3);
  __chkstk_darwin(v4);
  OUTLINED_FUNCTION_11();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = type metadata accessor for RRQuery();
  OUTLINED_FUNCTION_1_2();
  uint64_t v10 = v9;
  __chkstk_darwin(v11);
  OUTLINED_FUNCTION_12();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<RRResult, Error>);
  OUTLINED_FUNCTION_4_0();
  __chkstk_darwin(v12);
  OUTLINED_FUNCTION_11();
  uint64_t v15 = v14 - v13;
  type metadata accessor for ReferenceResolutionClient();
  ReferenceResolutionClient.__allocating_init()();
  *uint64_t v1 = a1;
  (*(void (**)(void *, void, uint64_t))(v10 + 104))(v1, enum case for RRQuery.usoReference(_:), v8);
  type metadata accessor for RRFilter();
  uint64_t v16 = OUTLINED_FUNCTION_24();
  __swift_storeEnumTagSinglePayload(v16, v17, v18, v19);
  swift_retain();
  dispatch thunk of ReferenceResolutionClient.resolve(reference:filter:)();
  swift_release();
  outlined destroy of RRCandidate?(v7, &demangling cache variable for type metadata for RRFilter?);
  (*(void (**)(void *, uint64_t))(v10 + 8))(v1, v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    outlined destroy of RRCandidate?(v15, &demangling cache variable for type metadata for Result<RRResult, Error>);
    return 1;
  }
  else
  {
    uint64_t v21 = type metadata accessor for RRResult();
    OUTLINED_FUNCTION_1_2();
    uint64_t v23 = v22;
    BOOL v20 = (*(unsigned int (**)(uint64_t, uint64_t))(v24 + 88))(v15, v21) != enum case for RRResult.noMatch(_:);
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v15, v21);
  }
  return v20;
}

void ResolveGeneralReference.__allocating_init()()
{
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_15();
  *(void *)(v0 + 16) = v1;
  *(void *)(v0 + 24) = v2;
}

void ResolveGeneralReference.init()()
{
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_19(v0);
}

uint64_t protocol witness for InternalResolver.resolverTypeOperand.getter in conformance ResolveGeneralReference()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 88))();
}

uint64_t protocol witness for InternalResolver.resolveParameter(parameter:suggestion:interaction:environment:) in conformance ResolveGeneralReference(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(**(void **)v4 + 112)
                                                                   + **(int **)(**(void **)v4 + 112));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  *uint64_t v10 = v5;
  v10[1] = protocol witness for InternalResolver.resolveParameter(parameter:suggestion:interaction:environment:) in conformance ResolveContactOrGroupEntity;
  return v12(a1, a2, a3, a4);
}

uint64_t key path setter for ResolveStartCallParams.resolverTypeOperand : ResolveStartCallParams(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(void **)a2 + 96);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t ResolveContactOrGroupEntity.resolverTypeOperand.getter()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ResolveContactOrGroupEntity.resolverTypeOperand.setter(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*ResolveStartCallParams.resolverTypeOperand.modify())()
{
  return ResolveStartCallParams.resolverTypeOperand.modify;
}

uint64_t ResolveStartCallParams.resolverTypeOperand.modify()
{
  return _swift_endAccess();
}

uint64_t ResolveStartCallParams.resolveParameter(parameter:suggestion:interaction:environment:)()
{
  OUTLINED_FUNCTION_14();
  v1[39] = v2;
  v1[40] = v0;
  v1[38] = v3;
  uint64_t v4 = type metadata accessor for SalientEntityType();
  v1[41] = v4;
  OUTLINED_FUNCTION_0_1(v4);
  v1[42] = v5;
  v1[43] = OUTLINED_FUNCTION_20();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SalientEntity?);
  OUTLINED_FUNCTION_10(v6);
  v1[44] = OUTLINED_FUNCTION_20();
  uint64_t v7 = type metadata accessor for SalientEntity();
  v1[45] = v7;
  OUTLINED_FUNCTION_0_1(v7);
  v1[46] = v8;
  v1[47] = OUTLINED_FUNCTION_5_0();
  v1[48] = swift_task_alloc();
  uint64_t v9 = type metadata accessor for Party();
  v1[49] = v9;
  OUTLINED_FUNCTION_0_1(v9);
  v1[50] = v10;
  v1[51] = OUTLINED_FUNCTION_5_0();
  v1[52] = swift_task_alloc();
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AppIdDetails?);
  OUTLINED_FUNCTION_10(v11);
  v1[53] = OUTLINED_FUNCTION_20();
  uint64_t v12 = type metadata accessor for AppIdDetails();
  v1[54] = v12;
  OUTLINED_FUNCTION_0_1(v12);
  v1[55] = v13;
  v1[56] = OUTLINED_FUNCTION_20();
  return _swift_task_switch(ResolveStartCallParams.resolveParameter(parameter:suggestion:interaction:environment:), 0, 0);
}

{
  void *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  if (one-time initialization token for suggestions != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  v0[57] = __swift_project_value_buffer(v1, (uint64_t)static Logger.suggestions);
  uint64_t v2 = Logger.logObject.getter();
  uint64_t v3 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v2, v3))
  {
    *(_WORD *)swift_slowAlloc() = 0;
    OUTLINED_FUNCTION_22(&dword_0, v4, v5, "#Resolvers resolving suggestion parameters");
    OUTLINED_FUNCTION_2_0();
  }
  uint64_t v6 = (void *)v0[38];

  v0[31] = &outlined read-only object #0 of ResolveStartCallParams.resolveParameter(parameter:suggestion:interaction:environment:);
  __swift_project_boxed_opaque_existential_2(v6, v6[3]);
  v0[58] = dispatch thunk of CandidateSuggestion.context.getter();
  v0[59] = v7;
  v0[60] = swift_getObjectType();
  uint64_t v9 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(ResolveStartCallParams.resolveParameter(parameter:suggestion:interaction:environment:), v9, v8);
}

{
  uint64_t v1;

  OUTLINED_FUNCTION_14();
  Context.getAppId()();
  swift_unknownObjectRelease();
  return _swift_task_switch(ResolveStartCallParams.resolveParameter(parameter:suggestion:interaction:environment:), 0, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char v21;
  id v22;
  void *v23;
  id v24;
  unint64_t v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v28;
  uint8_t *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  id v35;
  void *v36;
  id v38;
  char *v39;
  NSObject *v40;
  os_log_type_t v41;
  BOOL v42;
  uint8_t *v43;
  void *v44;
  os_log_type_t v45;
  uint8_t *v46;
  void *v47;
  os_log_type_t v48;
  id v49;
  uint64_t v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  BOOL v55;
  NSObject *v56;
  os_log_type_t v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  id v63;
  void *v64;
  id v65;
  uint64_t v66;
  unint64_t v67;
  id v68;
  void *v69;
  unint64_t v70;
  unint64_t v71;
  BOOL v72;
  uint64_t v73;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  NSObject *v78;
  os_log_type_t v79;
  uint8_t *v80;
  uint64_t v81;
  BOOL v82;
  unint64_t v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void (*v91)(void, unint64_t, void);
  uint64_t v92;
  unint64_t v93;
  uint64_t (**v94)(uint64_t, uint64_t);
  void (**v95)(uint64_t, uint64_t);
  uint64_t v96;
  uint64_t v97;
  int v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char v108;
  uint64_t inited;
  void *v110;
  unint64_t v111;
  void *v112;
  NSObject *v113;
  os_log_type_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t (*v117)(uint64_t);
  uint64_t *v119;
  uint64_t *v120;
  uint64_t *v121;
  char v122;
  _OWORD *v123;
  id v124;
  os_log_type_t v125;
  NSObject *log;
  os_log_t loga;
  uint64_t *v128;
  void *v129;
  unint64_t v130;
  uint64_t v131;
  unint64_t v132;
  unint64_t v133;
  uint64_t v134;
  void *v135;
  char *v136;
  void *v137;
  char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  int v142;
  uint64_t v143;
  void (*v144)(void, unint64_t, void);
  uint64_t v145[3];
  void *v146;
  uint64_t v147;

  v146 = v0;
  v135 = v0 + 31;
  uint64_t v2 = v0[53];
  uint64_t v1 = v0[54];
  v137 = v0;
  if (__swift_getEnumTagSinglePayload(v2, 1, v1) == 1)
  {
    outlined destroy of RRCandidate?(v2, &demangling cache variable for type metadata for AppIdDetails?);
  }
  else
  {
    uint64_t v4 = v0[51];
    uint64_t v3 = v0[52];
    uint64_t v5 = v0[49];
    uint64_t v6 = v0[50];
    (*(void (**)(void, uint64_t, uint64_t))(v0[55] + 32))(v0[56], v2, v1);
    AppIdDetails.party.getter();
    (*(void (**)(uint64_t, void, uint64_t))(v6 + 104))(v4, enum case for Party.third(_:), v5);
    uint64_t v7 = static Party.== infix(_:_:)();
    uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
    v8(v4, v5);
    v8(v3, v5);
    if (v7)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
      uint64_t v9 = swift_allocObject();
      *(_OWORD *)(v9 + 16) = xmmword_E240;
      *(void *)(v9 + 32) = AppIdDetails.appId.getter();
      *(void *)(v9 + 40) = v10;
      swift_bridgeObjectRelease();
      v0[31] = v9;
      uint64_t v11 = Logger.logObject.getter();
      uint64_t v12 = static os_log_type_t.debug.getter();
      uint64_t v13 = os_log_type_enabled(v11, v12);
      uint64_t v15 = v0[55];
      uint64_t v14 = v0[56];
      uint64_t v16 = v0[54];
      if (v13)
      {
        uint64_t v17 = (uint8_t *)OUTLINED_FUNCTION_13();
        v145[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v17 = 136315138;
        swift_beginAccess();
        swift_bridgeObjectRetain();
        v140 = v16;
        v143 = v14;
        uint64_t v18 = Array.description.getter();
        BOOL v20 = v19;
        swift_bridgeObjectRelease();
        v0[37] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v18, v20, v145);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_0, v11, v12, "#Resolvers Found 3P app %s", v17, 0xCu);
        uint64_t v21 = 1;
        swift_arrayDestroy();
        OUTLINED_FUNCTION_2_0();
        OUTLINED_FUNCTION_2_0();

        (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v143, v140);
      }
      else
      {

        (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
        uint64_t v21 = 1;
      }
      goto LABEL_8;
    }
    (*(void (**)(void, void))(v0[55] + 8))(v0[56], v0[54]);
  }
  uint64_t v21 = 0;
LABEL_8:
  v122 = v21;
  v124 = [objc_allocWithZone((Class)ATXProactiveSuggestionClient) initWithConsumerSubType:45];
  uint64_t v22 = [v124 suggestionLayoutFromCache];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = [v22 allSuggestionsInLayout];

    type metadata accessor for INIntent(0, &lazy cache variable for type metadata for ATXProactiveSuggestion);
    uint64_t v25 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v25 = 0;
  }
  v128 = v0 + 35;
  uint64_t v26 = (v0 + 36);
  swift_bridgeObjectRetain_n();
  uint64_t v27 = Logger.logObject.getter();
  LOBYTE(v28) = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v27, (os_log_type_t)v28))
  {
    uint64_t v29 = (uint8_t *)OUTLINED_FUNCTION_13();
    *(_DWORD *)uint64_t v29 = 134217984;
    if (v25)
    {
      if (v25 >> 62) {
        goto LABEL_129;
      }
      uint64_t v30 = *(void *)((char *)&dword_10 + (v25 & 0xFFFFFFFFFFFFFF8));
LABEL_15:
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v30 = 0;
    }
    *v128 = v30;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v27, (os_log_type_t)v28, "#Resolvers Found %ld suggestions in resolver", v29, 0xCu);
    OUTLINED_FUNCTION_2_0();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  if (v25) {
    uint64_t v31 = v25;
  }
  else {
    uint64_t v31 = (unint64_t)&_swiftEmptyArrayStorage;
  }
  if (v31 >> 62)
  {
LABEL_127:
    swift_bridgeObjectRetain();
    uint64_t v32 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v32 = *(void *)((char *)&dword_10 + (v31 & 0xFFFFFFFFFFFFFF8));
  }
  v119 = (uint64_t *)v26;
  if (v32)
  {
    v123 = v0 + 19;
    v129 = v0 + 33;
    v120 = v0 + 34;
    v121 = v0 + 32;
    v33 = v31 & 0xC000000000000001;
    swift_beginAccess();
    uint64_t v34 = 0;
    v138 = (char *)(v31 + 32);
    v141 = v31 & 0xFFFFFFFFFFFFFF8;
    v136 = (char *)&_swiftEmptyArrayStorage;
    v131 = v32;
    v133 = v31;
    v130 = v31 & 0xC000000000000001;
    while (1)
    {
      if (v33)
      {
        PhoneSuggestions::StartCallSuggestionParams v35 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else
      {
        if (v34 >= *(void *)(v141 + 16)) {
          goto LABEL_126;
        }
        PhoneSuggestions::StartCallSuggestionParams v35 = *(id *)&v138[8 * v34];
      }
      uint64_t v36 = v35;
      if (__OFADD__(v34++, 1))
      {
        __break(1u);
LABEL_126:
        __break(1u);
        goto LABEL_127;
      }
      uint64_t v38 = [v35 executableSpecification];
      uint64_t v39 = (char *)[v38 executableType];

      uint64_t v26 = v36;
      v40 = Logger.logObject.getter();
      uint64_t v41 = static os_log_type_t.debug.getter();
      uint64_t v42 = os_log_type_enabled(v40, v41);
      if (v39 == (unsigned char *)&dword_0 + 2)
      {
        if (v42)
        {
          uint64_t v43 = (uint8_t *)OUTLINED_FUNCTION_13();
          uint64_t v44 = (void *)swift_slowAlloc();
          OUTLINED_FUNCTION_7_0(v44);
          _os_log_impl(&dword_0, v40, v45, "#Resolvers Found a proactive action suggestion %@", v43, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
          swift_arrayDestroy();
          OUTLINED_FUNCTION_2_0();
          OUTLINED_FUNCTION_2_0();
        }
        else
        {

          v40 = v26;
        }

        long long v49 = [v26 executableSpecification];
        uint64_t v29 = (uint8_t *)[v49 executableObject];

        if (v29)
        {
          self;
          uint64_t v50 = swift_dynamicCastObjCClass();
          if (!v50) {
            goto LABEL_59;
          }
          uint64_t v25 = v50;
          v51 = (void *)*v135;
          swift_bridgeObjectRetain();
          v52 = [(id)v25 bundleId];
          v53 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v28 = v54;

          uint64_t v27 = v51[2];
          if (!v27) {
            goto LABEL_61;
          }
          v55 = v51[4] == v53 && v51[5] == v28;
          if (!v55 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
          {
            if (v27 == ((char *)&dword_0 + 1)) {
              goto LABEL_61;
            }
            v72 = v51[6] == v53 && v51[7] == v28;
            if (!v72 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
            {
              if (v27 != ((char *)&dword_0 + 2))
              {
                uint64_t v0 = v51 + 9;
                v73 = 2;
                while (!__OFADD__(v73, 1))
                {
                  if (*(v0 - 1) == v53 && *v0 == v28) {
                    goto LABEL_45;
                  }
                  loga = (os_log_t)(v73 + 1);
                  if (_stringCompareWithSmolCheck(_:_:expecting:)()) {
                    goto LABEL_45;
                  }
                  ++v73;
                  v0 += 2;
                  if (loga == v27) {
                    goto LABEL_61;
                  }
                }
                __break(1u);
LABEL_129:
                swift_bridgeObjectRetain();
                uint64_t v30 = _CocoaArrayWrapper.endIndex.getter();
                swift_bridgeObjectRelease();
                goto LABEL_15;
              }
LABEL_61:
              swift_bridgeObjectRelease();

              swift_unknownObjectRelease();
              swift_bridgeObjectRelease();
              uint64_t v0 = v137;
              uint64_t v32 = v131;
              uint64_t v31 = v133;
              v33 = v130;
              goto LABEL_62;
            }
          }
LABEL_45:
          uint64_t v0 = v137;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_unknownObjectRetain_n();
          long long v56 = Logger.logObject.getter();
          uint64_t v57 = static os_log_type_t.debug.getter();
          if (os_log_type_enabled(v56, v57))
          {
            v125 = v57;
            log = v56;
            v58 = swift_slowAlloc();
            v145[0] = swift_slowAlloc();
            *(_DWORD *)v58 = 136315394;
            long long v59 = [(id)v25 bundleId];
            uint64_t v60 = static String._unconditionallyBridgeFromObjectiveC(_:)();
            long long v62 = v61;

            *v121 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v60, v62, v145);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease();
            swift_unknownObjectRelease_n();
            *(_WORD *)(v58 + 12) = 2080;
            uint64_t v63 = [(id)v25 intent];
            v64 = v63;
            if (v63)
            {
              long long v65 = [v63 _dictionaryRepresentation];

              v64 = (void *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
            }
            v33 = v130;
            *v129 = v64;
            __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [AnyHashable : Any]?);
            uint64_t v66 = String.init<A>(describing:)();
            *v120 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v66, v67, v145);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease();
            swift_unknownObjectRelease_n();
            _os_log_impl(&dword_0, log, v125, "#Resolvers %s with intent: %s", (uint8_t *)v58, 0x16u);
            swift_arrayDestroy();
            OUTLINED_FUNCTION_2_0();
            OUTLINED_FUNCTION_2_0();

            uint64_t v0 = v137;
          }
          else
          {
            swift_unknownObjectRelease_n();

            v33 = v130;
          }
          v68 = [(id)v25 intent];
          uint64_t v32 = v131;
          uint64_t v31 = v133;
          if (!v68)
          {
LABEL_59:

            swift_unknownObjectRelease();
            goto LABEL_62;
          }
          v69 = v68;
          v0[22] = type metadata accessor for INIntent(0, &lazy cache variable for type metadata for INIntent);
          v0[19] = v69;
          v40 = v69;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v136 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v136 + 2) + 1, 1, (uint64_t)v136);
          }
          v71 = *((void *)v136 + 2);
          v70 = *((void *)v136 + 3);
          if (v71 >= v70 >> 1) {
            v136 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v70 > 1), v71 + 1, 1, (uint64_t)v136);
          }
          *((void *)v136 + 2) = v71 + 1;
          outlined init with take of Any(v123, &v136[32 * v71 + 32]);

          swift_unknownObjectRelease();
          goto LABEL_58;
        }
      }
      else
      {
        if (!v42)
        {

LABEL_58:
          goto LABEL_62;
        }
        long long v46 = (uint8_t *)OUTLINED_FUNCTION_13();
        v47 = (void *)swift_slowAlloc();
        OUTLINED_FUNCTION_7_0(v47);
        _os_log_impl(&dword_0, v40, v48, "#Resolvers Ignoring suggestion %@", v46, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_2_0();
        OUTLINED_FUNCTION_2_0();
      }
LABEL_62:
      if (v34 == v32) {
        goto LABEL_80;
      }
    }
  }
  v136 = (char *)&_swiftEmptyArrayStorage;
LABEL_80:
  swift_bridgeObjectRelease();
  v0[18] = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Any]);
  v0[15] = v136;
  swift_bridgeObjectRetain();
  v75 = ResolveStartCallParams.getPersonName(suggestions:)((uint64_t)(v0 + 15));
  v77 = v76;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 15));
  swift_bridgeObjectRetain_n();
  v78 = Logger.logObject.getter();
  v79 = static os_log_type_t.debug.getter();
  v134 = v75;
  if (os_log_type_enabled(v78, v79))
  {
    v80 = (uint8_t *)OUTLINED_FUNCTION_13();
    v81 = swift_slowAlloc();
    *(_DWORD *)v80 = 136315138;
    v145[0] = v81;
    v82 = v77 == 0;
    v83 = v77;
    if (v77) {
      v84 = v75;
    }
    else {
      v84 = 0;
    }
    if (v82) {
      v85 = 0xE000000000000000;
    }
    else {
      v85 = v83;
    }
    swift_bridgeObjectRetain();
    v86 = v84;
    v77 = v83;
    uint64_t v0 = v137;
    *v119 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v86, v85, v145);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v78, v79, "#Resolvers Extracted name %s", v80, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_2_0();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  __swift_project_boxed_opaque_existential_2((void *)v0[39], *(void *)(v0[39] + 24));
  v87 = dispatch thunk of EnvironmentSnapshot.salientEntities.getter();
  v88 = *(void *)(v87 + 16);
  if (v88)
  {
    v132 = v77;
    v89 = v0[46];
    v91 = *(void (**)(void, unint64_t, void))(v89 + 16);
    v90 = v89 + 16;
    v144 = v91;
    v92 = v0[42];
    v93 = v87 + ((*(unsigned __int8 *)(v90 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v90 + 64));
    v94 = (uint64_t (**)(uint64_t, uint64_t))(v92 + 88);
    v142 = enum case for SalientEntityType.openApp(_:);
    v95 = (void (**)(uint64_t, uint64_t))(v92 + 8);
    v139 = *(void *)(v90 + 56);
    while (1)
    {
      v96 = v0[43];
      v97 = v0[41];
      v144(v0[47], v93, v0[45]);
      SalientEntity.type.getter();
      v98 = (*v94)(v96, v97);
      (*v95)(v96, v97);
      if (v98 == v142) {
        break;
      }
      (*(void (**)(void, void))(v90 - 8))(v0[47], v0[45]);
      v93 += v139;
      if (!--v88)
      {
        v99 = 1;
        goto LABEL_96;
      }
    }
    (*(void (**)(void, void, void))(v0[46] + 32))(v0[44], v0[47], v0[45]);
    v99 = 0;
LABEL_96:
    v77 = v132;
  }
  else
  {
    v99 = 1;
  }
  v101 = v0[44];
  v100 = v0[45];
  __swift_storeEnumTagSinglePayload(v101, v99, 1, v100);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (__swift_getEnumTagSinglePayload(v101, 1, v100) == 1)
  {
    outlined destroy of RRCandidate?(v0[44], &demangling cache variable for type metadata for SalientEntity?);
    goto LABEL_112;
  }
  (*(void (**)(void, void, void))(v0[46] + 32))(v0[48], v0[44], v0[45]);
  SalientEntity.value.getter();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Decodable & Encodable & Sendable);
  if (swift_dynamicCast())
  {
    v103 = v0[29];
    v102 = v0[30];
    if (v103 == 0xD000000000000015 && v102 == 0x800000000000E6A0
      || (OUTLINED_FUNCTION_21(), (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0))
    {
      swift_bridgeObjectRelease();
      v104 = v0[48];
      v106 = v0[45];
      v105 = v0[46];
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
      v107 = OUTLINED_FUNCTION_25();
      *(_OWORD *)(v107 + 16) = xmmword_E240;
      *(void *)(v107 + 56) = &type metadata for StartCallSuggestionParams;
      *(void *)(v107 + 32) = v134;
      *(void *)(v107 + 40) = v77;
      *(_WORD *)(v107 + 48) = 0;
LABEL_110:

      (*(void (**)(uint64_t, uint64_t))(v105 + 8))(v104, v106);
      goto LABEL_122;
    }
    if (v103 == 0xD000000000000012 && v102 == 0x800000000000E6C0)
    {
      swift_bridgeObjectRelease();
LABEL_109:
      v104 = v0[48];
      v106 = v0[45];
      v105 = v0[46];
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
      v107 = swift_allocObject();
      *(_OWORD *)(v107 + 16) = xmmword_E0A0;
      *(void *)(v107 + 32) = v134;
      *(void *)(v107 + 40) = v77;
      *(_WORD *)(v107 + 48) = 1;
      *(void *)(v107 + 88) = &type metadata for StartCallSuggestionParams;
      *(void *)(v107 + 56) = &type metadata for StartCallSuggestionParams;
      *(void *)(v107 + 64) = v134;
      *(void *)(v107 + 72) = v77;
      *(_WORD *)(v107 + 80) = 257;
      swift_bridgeObjectRetain();
      goto LABEL_110;
    }
    OUTLINED_FUNCTION_21();
    v108 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v108) {
      goto LABEL_109;
    }
  }
  (*(void (**)(void, void))(v0[46] + 8))(v0[48], v0[45]);
LABEL_112:
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<StartCallSuggestionParams>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_E240;
  *(void *)(inited + 32) = v134;
  *(void *)(inited + 40) = v77;
  *(_WORD *)(inited + 48) = 0;
  if (v122)
  {
LABEL_118:
    v113 = Logger.logObject.getter();
    v114 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v113, v114))
    {
      *(_WORD *)swift_slowAlloc() = 0;
      OUTLINED_FUNCTION_22(&dword_0, v115, v116, "#Resolvers excluding FT suggestions");
      OUTLINED_FUNCTION_2_0();
    }

    v112 = v124;
    goto LABEL_121;
  }
  v110 = self;
  swift_bridgeObjectRetain();
  if (([v110 supportsDisplayingFaceTimeVideoCalls] & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_118;
  }
  swift_bridgeObjectRetain();
  uint64_t inited = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((unsigned char *)&dword_0 + 1, 2, 1, inited);
  *(void *)(inited + 16) = 2;
  *(void *)(inited + 56) = v134;
  *(void *)(inited + 64) = v77;
  *(_WORD *)(inited + 72) = 1;
  v111 = *(void *)(inited + 24);
  if (v111 <= 5) {
    uint64_t inited = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v111 > 1), 3, 1, inited);
  }
  v112 = v124;
  *(void *)(inited + 16) = 3;
  *(void *)(inited + 80) = v134;
  *(void *)(inited + 88) = v77;
  *(_WORD *)(inited + 96) = 257;
LABEL_121:
  v107 = (uint64_t)specialized _arrayForceCast<A, B>(_:)(inited);

  swift_bridgeObjectRelease();
LABEL_122:
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v117 = (uint64_t (*)(uint64_t))v137[1];
  return v117(v107);
}

void *specialized _arrayForceCast<A, B>(_:)(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = &_swiftEmptyArrayStorage;
  if (v1)
  {
    uint64_t v9 = &_swiftEmptyArrayStorage;
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v1, 0);
    uint64_t v2 = &_swiftEmptyArrayStorage;
    uint64_t v4 = a1 + 49;
    do
    {
      swift_bridgeObjectRetain();
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2[2] + 1, 1);
        uint64_t v2 = v9;
      }
      unint64_t v6 = v2[2];
      unint64_t v5 = v2[3];
      if (v6 >= v5 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v5 > 1), v6 + 1, 1);
        uint64_t v2 = v9;
      }
      v4 += 24;
      v2[2] = v6 + 1;
      outlined init with take of Any(&v8, &v2[4 * v6 + 4]);
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t ResolveStartCallParams.getPersonName(suggestions:)(uint64_t a1)
{
  outlined init with copy of Any(a1, (uint64_t)v22);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Any]);
  int v2 = swift_dynamicCast();
  uint64_t v3 = v21[0];
  outlined init with copy of Any(a1, (uint64_t)v21);
  if (!v2 || !v3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
    uint64_t v3 = OUTLINED_FUNCTION_25();
    *(_OWORD *)(v3 + 16) = xmmword_E240;
    outlined init with copy of Any((uint64_t)v21, v3 + 32);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
  uint64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    uint64_t v5 = v3 + 32;
    do
    {
      outlined init with copy of Any(v5, (uint64_t)v20);
      type metadata accessor for INIntent(0, &lazy cache variable for type metadata for INStartCallIntent);
      if (swift_dynamicCast())
      {
        unint64_t v6 = outlined bridged method (pb) of @objc INStartCallIntent.contacts.getter(v19);
        if (v6)
        {
          unint64_t v7 = v6;
          uint64_t v8 = v6 & 0xFFFFFFFFFFFFFF8;
          if (v6 >> 62)
          {
            uint64_t result = _CocoaArrayWrapper.endIndex.getter();
            if (!result)
            {
LABEL_20:

              swift_bridgeObjectRelease();
              goto LABEL_21;
            }
          }
          else
          {
            uint64_t result = *(void *)((char *)&dword_10 + (v6 & 0xFFFFFFFFFFFFFF8));
            if (!result) {
              goto LABEL_20;
            }
          }
          if ((v7 & 0xC000000000000001) != 0)
          {
            id v10 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
          }
          else
          {
            if (!*(void *)(v8 + 16))
            {
              __break(1u);
              return result;
            }
            id v10 = *(id *)(v7 + 32);
          }
          uint64_t v11 = v10;
          swift_bridgeObjectRelease();
          uint64_t v12 = outlined bridged method (pb) of @objc INPerson.contactIdentifier.getter(v11);
          if (v13)
          {
            uint64_t v14 = v12;
            unint64_t v15 = v13;
            swift_bridgeObjectRelease();
            uint64_t v16 = HIBYTE(v15) & 0xF;
            if ((v15 & 0x2000000000000000) == 0) {
              uint64_t v16 = v14 & 0xFFFFFFFFFFFFLL;
            }
            if (v16)
            {
              swift_bridgeObjectRelease();
              id v18 = [v11 displayName];
              uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();

              return v17;
            }
          }
        }
        else
        {
        }
      }
LABEL_21:
      v5 += 32;
      --v4;
    }
    while (v4);
  }
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t ResolveStartCallParams.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t ResolveContactOrGroupEntity.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return _swift_deallocClassInstance(v0, 32, 7);
}

void ResolveStartCallParams.init()()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_19(v0);
}

uint64_t protocol witness for InternalResolver.resolverTypeOperand.getter in conformance ResolveStartCallParams()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 88))();
}

uint64_t protocol witness for InternalResolver.resolveParameter(parameter:suggestion:interaction:environment:) in conformance ResolveStartCallParams(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(**(void **)v4 + 112)
                                                                   + **(int **)(**(void **)v4 + 112));
  id v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  *id v10 = v5;
  v10[1] = protocol witness for InternalResolver.resolveParameter(parameter:suggestion:interaction:environment:) in conformance ResolveStartCallParams;
  return v12(a1, a2, a3, a4);
}

uint64_t protocol witness for InternalResolver.resolveParameter(parameter:suggestion:interaction:environment:) in conformance ResolveStartCallParams()
{
  OUTLINED_FUNCTION_14();
  uint64_t v2 = v1;
  uint64_t v5 = *v0;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(v2);
}

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<StartCallSuggestionParams>);
    id v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    id v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  if (v5)
  {
    specialized UnsafeMutablePointer.moveInitialize(from:count:)((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;

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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
    id v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 32);
  }
  else
  {
    id v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  if (v5)
  {
    specialized UnsafeMutablePointer.moveInitialize(from:count:)((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v12, a4);
  }
  return v10;
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
  char *v13;

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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
    id v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    id v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
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

uint64_t specialized _ArrayBuffer._copyContents(subRange:initializing:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 24 * a1 + 32;
    unint64_t v6 = a3 + 24 * v4;
    if (v5 >= v6 || v5 + 24 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
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
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *specialized UnsafeMutablePointer.moveInitialize(from:count:)(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[32 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 32 * a2);
  }
  return __src;
}

{
  uint64_t v3;

  if (a2 < 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[24 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 24 * a2);
  }
  return __src;
}

uint64_t specialized UnsafeMutablePointer.initialize(from:count:)(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0 || (a3 + 32 * a2 > a1 ? (BOOL v3 = a1 + 32 * a2 > a3) : (BOOL v3 = 0), v3))
  {
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return swift_arrayInitWithCopy();
  }
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
    uint64_t result = (uint64_t)_StringGuts._allocateForDeconstruct()(a5, a6);
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

void *_StringGuts._allocateForDeconstruct()(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = String.UTF8View._foreignCount()();
    if (v2) {
      goto LABEL_6;
    }
    return &_swiftEmptyArrayStorage;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    Swift::Int v2 = HIBYTE(a2) & 0xF;
  }
  else {
    Swift::Int v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
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
    return v4;
  }
  _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
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
    return &_swiftEmptyArrayStorage;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
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

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

_OWORD *outlined init with take of Any(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t base witness table accessor for InternalResolver in ResolveContactOrGroupEntity()
{
  return lazy protocol witness table accessor for type ResolveContactOrGroupEntity and conformance ResolveContactOrGroupEntity(&lazy protocol witness table cache variable for type ResolveContactOrGroupEntity and conformance ResolveContactOrGroupEntity, (void (*)(void))type metadata accessor for ResolveContactOrGroupEntity);
}

uint64_t type metadata accessor for ResolveContactOrGroupEntity()
{
  return self;
}

uint64_t base witness table accessor for Wrappable in ResolveContactOrGroupEntity()
{
  return lazy protocol witness table accessor for type ResolveContactOrGroupEntity and conformance ResolveContactOrGroupEntity(&lazy protocol witness table cache variable for type ResolveContactOrGroupEntity and conformance ResolveContactOrGroupEntity, (void (*)(void))type metadata accessor for ResolveContactOrGroupEntity);
}

uint64_t base witness table accessor for InternalResolver in ResolveGeneralReference()
{
  return lazy protocol witness table accessor for type ResolveContactOrGroupEntity and conformance ResolveContactOrGroupEntity(&lazy protocol witness table cache variable for type ResolveGeneralReference and conformance ResolveGeneralReference, (void (*)(void))type metadata accessor for ResolveGeneralReference);
}

uint64_t type metadata accessor for ResolveGeneralReference()
{
  return self;
}

uint64_t base witness table accessor for Wrappable in ResolveGeneralReference()
{
  return lazy protocol witness table accessor for type ResolveContactOrGroupEntity and conformance ResolveContactOrGroupEntity(&lazy protocol witness table cache variable for type ResolveGeneralReference and conformance ResolveGeneralReference, (void (*)(void))type metadata accessor for ResolveGeneralReference);
}

uint64_t base witness table accessor for InternalResolver in ResolveStartCallParams()
{
  return lazy protocol witness table accessor for type ResolveContactOrGroupEntity and conformance ResolveContactOrGroupEntity(&lazy protocol witness table cache variable for type ResolveStartCallParams and conformance ResolveStartCallParams, (void (*)(void))type metadata accessor for ResolveStartCallParams);
}

uint64_t type metadata accessor for ResolveStartCallParams()
{
  return self;
}

uint64_t base witness table accessor for Wrappable in ResolveStartCallParams()
{
  return lazy protocol witness table accessor for type ResolveContactOrGroupEntity and conformance ResolveContactOrGroupEntity(&lazy protocol witness table cache variable for type ResolveStartCallParams and conformance ResolveStartCallParams, (void (*)(void))type metadata accessor for ResolveStartCallParams);
}

uint64_t lazy protocol witness table accessor for type ResolveContactOrGroupEntity and conformance ResolveContactOrGroupEntity(unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_BD64()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t result = (*(uint64_t (**)(void))(v1 + 88))();
  *uint64_t v0 = result;
  v0[1] = v3;
  return result;
}

uint64_t sub_BDA8()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t result = (*(uint64_t (**)(void))(v1 + 88))();
  *uint64_t v0 = result;
  v0[1] = v3;
  return result;
}

uint64_t sub_BDEC()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t result = (*(uint64_t (**)(void))(v1 + 88))();
  *uint64_t v0 = result;
  v0[1] = v3;
  return result;
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 32);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
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

uint64_t outlined bridged method (pb) of @objc INPerson.contactIdentifier.getter(void *a1)
{
  id v1 = [a1 contactIdentifier];
  if (!v1) {
    return 0;
  }
  long long v2 = v1;
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

uint64_t outlined destroy of RRCandidate?(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_4_0();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t outlined init with copy of Result<RRResult, Error>(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<RRResult, Error>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return swift_slowDealloc();
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return swift_task_alloc();
}

__n128 OUTLINED_FUNCTION_7_0(void *a1)
{
  __n128 result = *(__n128 *)(v3 - 112);
  *(_DWORD *)uint64_t v1 = result.n128_u32[0];
  *(void *)(v1 + 4) = v2;
  *a1 = v2;
  return result;
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_10(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_13()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_16()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_17()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_18()
{
  return specialized Array._checkSubscript(_:wasNativeTypeChecked:)(0, (v0 & 0xC000000000000001) == 0, v0);
}

void OUTLINED_FUNCTION_19(uint64_t a1@<X8>)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
}

uint64_t OUTLINED_FUNCTION_20()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_21()
{
  return v0;
}

void OUTLINED_FUNCTION_22(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v5, v4, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_23(uint64_t a1)
{
  return __swift_getEnumTagSinglePayload(v1, 1, a1);
}

uint64_t OUTLINED_FUNCTION_24()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_25()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_26()
{
  return v0;
}

uint64_t Logger.suggestions.unsafeMutableAddressor()
{
  if (one-time initialization token for suggestions != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  return __swift_project_value_buffer(v0, (uint64_t)static Logger.suggestions);
}

uint64_t one-time initialization function for suggestions()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Logger.suggestions);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.suggestions);
  if (one-time initialization token for subsystem != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  return Logger.init(subsystem:category:)();
}

uint64_t *LogConst.subsystem.unsafeMutableAddressor()
{
  if (one-time initialization token for subsystem != -1) {
    swift_once();
  }
  return &static LogConst.subsystem;
}

void *LogConst.Category.phoneSuggestions.unsafeMutableAddressor()
{
  return &static LogConst.Category.phoneSuggestions;
}

uint64_t static Logger.suggestions.getter@<X0>(uint64_t a1@<X8>)
{
  if (one-time initialization token for suggestions != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)static Logger.suggestions);
  os_log_type_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

void one-time initialization function for subsystem()
{
  algn_152F8[7] = -18;
}

uint64_t static LogConst.subsystem.getter()
{
  if (one-time initialization token for subsystem != -1) {
    swift_once();
  }
  uint64_t v0 = static LogConst.subsystem;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t static LogConst.Category.phoneSuggestions.getter()
{
  return 0xD000000000000010;
}

void type metadata accessor for Logger()
{
}

void type metadata accessor for LogConst()
{
}

void type metadata accessor for LogConst.Category()
{
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

uint64_t specialized == infix<A>(_:_:)(uint64_t a1, uint64_t a2)
{
  return specialized == infix<A>(_:_:)(a1, a2, (uint64_t (*)(void))SuggestionIdentifier.rawValue.getter);
}

uint64_t specialized == infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3();
  uint64_t v7 = v6;
  if (v5 == ((uint64_t (*)(uint64_t))a3)(a2) && v7 == v8) {
    char v10 = 1;
  }
  else {
    char v10 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10 & 1;
}

Swift::Int specialized RawRepresentable<>.hashValue.getter(uint64_t a1)
{
  return specialized RawRepresentable<>.hashValue.getter(a1, (void (*)(uint64_t))SuggestionIdentifier.rawValue.getter);
}

Swift::Int specialized RawRepresentable<>.hashValue.getter(uint64_t a1, void (*a2)(uint64_t))
{
  return Hasher._finalize()();
}

uint64_t specialized RawRepresentable<>.hash(into:)()
{
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int specialized RawRepresentable<>._rawHashValue(seed:)(uint64_t a1, uint64_t a2)
{
  return specialized RawRepresentable<>._rawHashValue(seed:)(a1, a2, (void (*)(uint64_t))SuggestionIdentifier.rawValue.getter);
}

Swift::Int specialized RawRepresentable<>._rawHashValue(seed:)(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  return Hasher._finalize()();
}

uint64_t *Signal.ContactsApp.unsafeMutableAddressor()
{
  if (one-time initialization token for ContactsApp != -1) {
    swift_once();
  }
  return &static Signal.ContactsApp;
}

uint64_t *Signal.PhoneApp.unsafeMutableAddressor()
{
  if (one-time initialization token for PhoneApp != -1) {
    swift_once();
  }
  return &static Signal.PhoneApp;
}

uint64_t *Signal.FaceTimeApp.unsafeMutableAddressor()
{
  if (one-time initialization token for FaceTimeApp != -1) {
    swift_once();
  }
  return &static Signal.FaceTimeApp;
}

uint64_t PhoneSuggestion.catId.getter(char a1)
{
  unint64_t v2 = 0xD000000000000013;
  strcpy((char *)v6, "Suggestions#");
  BYTE5(v6[1]) = 0;
  HIWORD(v6[1]) = -5120;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v2 = 0xD000000000000015;
    }
    else {
      unint64_t v2 = 0xD000000000000016;
    }
    if (a1 == 1) {
      unint64_t v3 = 0x800000000000E660;
    }
    else {
      unint64_t v3 = 0x800000000000E680;
    }
  }
  else
  {
    unint64_t v3 = 0x800000000000E640;
  }
  unint64_t v4 = v3;
  String.append(_:)(*(Swift::String *)&v2);
  swift_bridgeObjectRelease();
  return v6[0];
}

void *PhoneSuggestion.signals()(char a1)
{
  if (one-time initialization token for signals != -1) {
    swift_once();
  }
  if (*(void *)((char *)static PhoneSuggestion.signals[0] + (unint64_t)&dword_10)
    && (specialized __RawDictionaryStorage.find<A>(_:)(a1), (v2 & 1) != 0))
  {
    return (void *)swift_bridgeObjectRetain();
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
}

int *one-time initialization function for signals()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(PhoneSuggestion, [Signal])>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_E020;
  *(unsigned char *)(inited + 32) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_E530;
  type metadata accessor for Signal();
  *(void *)(v1 + 32) = static Signal.HomeScreen.getter();
  *(void *)(v1 + 40) = static Signal.DeviceLocked.getter();
  if (one-time initialization token for ContactsApp != -1) {
    swift_once();
  }
  *(void *)(v1 + 48) = static Signal.ContactsApp;
  uint64_t v2 = one-time initialization token for PhoneApp;
  swift_retain();
  if (v2 != -1) {
    swift_once();
  }
  *(void *)(v1 + 56) = static Signal.PhoneApp;
  specialized Array._endMutation()();
  *(void *)(inited + 40) = v1;
  *(unsigned char *)(inited + 48) = 1;
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_E530;
  swift_retain();
  *(void *)(v3 + 32) = static Signal.HomeScreen.getter();
  uint64_t v4 = static Signal.DeviceLocked.getter();
  uint64_t v5 = static Signal.ContactsApp;
  *(void *)(v3 + 40) = v4;
  *(void *)(v3 + 48) = v5;
  uint64_t v6 = one-time initialization token for FaceTimeApp;
  swift_retain();
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v7 = static Signal.FaceTimeApp;
  *(void *)(v3 + 56) = static Signal.FaceTimeApp;
  specialized Array._endMutation()();
  *(void *)(inited + 56) = v3;
  *(unsigned char *)(inited + 64) = 2;
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_E530;
  swift_retain();
  *(void *)(v8 + 32) = static Signal.HomeScreen.getter();
  uint64_t v9 = static Signal.DeviceLocked.getter();
  uint64_t v10 = static Signal.ContactsApp;
  *(void *)(v8 + 40) = v9;
  *(void *)(v8 + 48) = v10;
  *(void *)(v8 + 56) = v7;
  specialized Array._endMutation()();
  *(void *)(inited + 72) = v8;
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Signal]);
  lazy protocol witness table accessor for type PhoneSuggestion and conformance PhoneSuggestion();
  __n128 result = (int *)Dictionary.init(dictionaryLiteral:)();
  static PhoneSuggestion.signals[0] = result;
  return result;
}

PhoneSuggestions::PhoneSuggestion_optional __swiftcall PhoneSuggestion.init(rawValue:)(Swift::String rawValue)
{
  object = rawValue._object;
  v2._uint64_t countAndFlagsBits = rawValue._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of PhoneSuggestion.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 >= 3) {
    return (PhoneSuggestions::PhoneSuggestion_optional)3;
  }
  else {
    return (PhoneSuggestions::PhoneSuggestion_optional)v3;
  }
}

_UNKNOWN **static PhoneSuggestion.allCases.getter()
{
  return &outlined read-only object #0 of static PhoneSuggestion.allCases.getter;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance PhoneSuggestion(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2, (uint64_t (*)(void))SuggestionIdentifier.rawValue.getter) & 1;
}

PhoneSuggestions::PhoneSuggestion_optional protocol witness for RawRepresentable.init(rawValue:) in conformance PhoneSuggestion@<W0>(Swift::String *a1@<X0>, PhoneSuggestions::PhoneSuggestion_optional *a2@<X8>)
{
  result.value = PhoneSuggestion.init(rawValue:)(*a1).value;
  a2->value = result.value;
  return result;
}

void protocol witness for static CaseIterable.allCases.getter in conformance PhoneSuggestion(void *a1@<X8>)
{
  *a1 = &outlined read-only object #0 of static PhoneSuggestion.allCases.getter;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance PhoneSuggestion()
{
  return specialized RawRepresentable<>.hashValue.getter(*v0, (void (*)(uint64_t))SuggestionIdentifier.rawValue.getter);
}

uint64_t protocol witness for Hashable.hash(into:) in conformance PhoneSuggestion()
{
  return specialized RawRepresentable<>.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance PhoneSuggestion(uint64_t a1)
{
  return specialized RawRepresentable<>._rawHashValue(seed:)(a1, *v1, (void (*)(uint64_t))SuggestionIdentifier.rawValue.getter);
}

uint64_t one-time initialization function for FaceTimeApp(uint64_t a1)
{
  return OUTLINED_FUNCTION_0_2(a1, 18, 0x800000000000E6C0, &static Signal.FaceTimeApp);
}

uint64_t static Signal.FaceTimeApp.getter()
{
  return static Signal.FaceTimeApp.getter(&one-time initialization token for FaceTimeApp);
}

uint64_t one-time initialization function for ContactsApp(uint64_t a1)
{
  return OUTLINED_FUNCTION_0_2(a1, 27, 0x800000000000E900, &static Signal.ContactsApp);
}

uint64_t static Signal.ContactsApp.getter()
{
  return static Signal.FaceTimeApp.getter(&one-time initialization token for ContactsApp);
}

uint64_t one-time initialization function for PhoneApp(uint64_t a1)
{
  return OUTLINED_FUNCTION_0_2(a1, 21, 0x800000000000E6A0, &static Signal.PhoneApp);
}

uint64_t one-time initialization function for FaceTimeApp(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  type metadata accessor for Signal();
  uint64_t v5 = type metadata accessor for CoreSignalTypes();
  v8[3] = v5;
  v8[4] = lazy protocol witness table accessor for type CoreSignalTypes and conformance CoreSignalTypes();
  boxed_opaque_existential_2 = __swift_allocate_boxed_opaque_existential_2(v8);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v5 - 8) + 104))(boxed_opaque_existential_2, enum case for CoreSignalTypes.app(_:), v5);
  uint64_t result = Signal.__allocating_init(signalType:signalValue:fallbackSignals:)();
  *a4 = result;
  return result;
}

uint64_t static Signal.PhoneApp.getter()
{
  return static Signal.FaceTimeApp.getter(&one-time initialization token for PhoneApp);
}

uint64_t static Signal.FaceTimeApp.getter(void *a1)
{
  if (*a1 != -1) {
    swift_once();
  }
  return swift_retain();
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
  String.hash(into:)();
  swift_bridgeObjectRelease();
  Swift::Int v2 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

unint64_t lazy protocol witness table accessor for type [PhoneSuggestion] and conformance [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [PhoneSuggestion] and conformance [A];
  if (!lazy protocol witness table cache variable for type [PhoneSuggestion] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [PhoneSuggestion]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [PhoneSuggestion] and conformance [A]);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type PhoneSuggestion and conformance PhoneSuggestion()
{
  unint64_t result = lazy protocol witness table cache variable for type PhoneSuggestion and conformance PhoneSuggestion;
  if (!lazy protocol witness table cache variable for type PhoneSuggestion and conformance PhoneSuggestion)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PhoneSuggestion and conformance PhoneSuggestion);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type PhoneSuggestion and conformance PhoneSuggestion;
  if (!lazy protocol witness table cache variable for type PhoneSuggestion and conformance PhoneSuggestion)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PhoneSuggestion and conformance PhoneSuggestion);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for PhoneSuggestion(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0xD2E0);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PhoneSuggestion()
{
  return &type metadata for PhoneSuggestion;
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

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(char a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v14 = ~v3;
    while (1)
    {
      unint64_t v5 = 0xD000000000000015;
      if (*(unsigned char *)(*(void *)(v2 + 48) + v4) == 1)
      {
        unint64_t v6 = 0x800000000000E660;
      }
      else
      {
        unint64_t v5 = 0xD000000000000016;
        unint64_t v6 = 0x800000000000E680;
      }
      unint64_t v7 = *(unsigned char *)(*(void *)(v2 + 48) + v4) ? v5 : 0xD000000000000013;
      unint64_t v8 = *(unsigned char *)(*(void *)(v2 + 48) + v4) ? v6 : 0x800000000000E640;
      if (a1)
      {
        unint64_t v9 = a1 == 1 ? 0xD000000000000015 : 0xD000000000000016;
        unint64_t v10 = a1 == 1 ? 0x800000000000E660 : 0x800000000000E680;
      }
      else
      {
        unint64_t v10 = 0x800000000000E640;
        unint64_t v9 = 0xD000000000000013;
      }
      if (v7 == v9 && v8 == v10) {
        break;
      }
      char v12 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v12 & 1) == 0)
      {
        unint64_t v4 = (v4 + 1) & v14;
        if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4)) {
          continue;
        }
      }
      return v4;
    }
    swift_bridgeObjectRelease_n();
  }
  return v4;
}

unint64_t lazy protocol witness table accessor for type CoreSignalTypes and conformance CoreSignalTypes()
{
  unint64_t result = lazy protocol witness table cache variable for type CoreSignalTypes and conformance CoreSignalTypes;
  if (!lazy protocol witness table cache variable for type CoreSignalTypes and conformance CoreSignalTypes)
  {
    type metadata accessor for CoreSignalTypes();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CoreSignalTypes and conformance CoreSignalTypes);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  return one-time initialization function for FaceTimeApp(a1, a2 & 0xFFFFFFFFFFFFLL | 0xD000000000000000, a3, a4);
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  return String.hash(into:)();
}

uint64_t Locale.init(identifier:)()
{
  return Locale.init(identifier:)();
}

uint64_t type metadata accessor for Locale()
{
  return type metadata accessor for Locale();
}

uint64_t static UsoBuilderConversionUtils.convertEntityBuilderToEntity(entityBuilder:)()
{
  return static UsoBuilderConversionUtils.convertEntityBuilderToEntity(entityBuilder:)();
}

uint64_t UsoEntityBuilder_common_Group.init()()
{
  return UsoEntityBuilder_common_Group.init()();
}

uint64_t type metadata accessor for UsoEntityBuilder_common_Group()
{
  return type metadata accessor for UsoEntityBuilder_common_Group();
}

uint64_t UsoEntityBuilder_common_Person.init()()
{
  return UsoEntityBuilder_common_Person.init()();
}

uint64_t type metadata accessor for UsoEntityBuilder_common_Person()
{
  return type metadata accessor for UsoEntityBuilder_common_Person();
}

uint64_t UsoEntityBuilder_common_PhoneNumber.init()()
{
  return UsoEntityBuilder_common_PhoneNumber.init()();
}

uint64_t type metadata accessor for UsoEntityBuilder_common_PhoneNumber()
{
  return type metadata accessor for UsoEntityBuilder_common_PhoneNumber();
}

uint64_t dispatch thunk of UsoValue.getAsPrimitiveValueString()()
{
  return dispatch thunk of UsoValue.getAsPrimitiveValueString()();
}

uint64_t UsoEntity.attributes.getter()
{
  return UsoEntity.attributes.getter();
}

uint64_t Transformer.init(transform:)()
{
  return Transformer.init(transform:)();
}

uint64_t dispatch thunk of SiriHelpSuggestionDetailsBuilderExtension.enableThirdPartyIntents(_:)()
{
  return dispatch thunk of SiriHelpSuggestionDetailsBuilderExtension.enableThirdPartyIntents(_:)();
}

uint64_t dispatch thunk of SiriHelpSuggestionDetailsBuilderExtension.register(signals:)()
{
  return dispatch thunk of SiriHelpSuggestionDetailsBuilderExtension.register(signals:)();
}

uint64_t type metadata accessor for DeviceType()
{
  return type metadata accessor for DeviceType();
}

uint64_t type metadata accessor for IntentType()
{
  return type metadata accessor for IntentType();
}

uint64_t type metadata accessor for DomainOwner()
{
  return type metadata accessor for DomainOwner();
}

uint64_t DomainOwner.init(_:)()
{
  return DomainOwner.init(_:)();
}

uint64_t AppIdDetails.appId.getter()
{
  return AppIdDetails.appId.getter();
}

uint64_t AppIdDetails.party.getter()
{
  return AppIdDetails.party.getter();
}

uint64_t type metadata accessor for AppIdDetails()
{
  return type metadata accessor for AppIdDetails();
}

uint64_t SalientEntity.type.getter()
{
  return SalientEntity.type.getter();
}

uint64_t SalientEntity.value.getter()
{
  return SalientEntity.value.getter();
}

uint64_t type metadata accessor for SalientEntity()
{
  return type metadata accessor for SalientEntity();
}

uint64_t type metadata accessor for CoreSignalTypes()
{
  return type metadata accessor for CoreSignalTypes();
}

uint64_t type metadata accessor for IntentParameter()
{
  return type metadata accessor for IntentParameter();
}

uint64_t type metadata accessor for SalientEntityType()
{
  return type metadata accessor for SalientEntityType();
}

uint64_t dispatch thunk of CandidateSuggestion.context.getter()
{
  return dispatch thunk of CandidateSuggestion.context.getter();
}

uint64_t dispatch thunk of EnvironmentSnapshot.salientEntities.getter()
{
  return dispatch thunk of EnvironmentSnapshot.salientEntities.getter();
}

uint64_t ResolvableParameter.init(typeIdentifier:required:loggingKeyTransformer:intentTransformer:)()
{
  return ResolvableParameter.init(typeIdentifier:required:loggingKeyTransformer:intentTransformer:)();
}

uint64_t type metadata accessor for ResolvableParameter()
{
  return type metadata accessor for ResolvableParameter();
}

uint64_t static SuggestionTransformers.mapINIntentValue<A>(extractor:)()
{
  return static SuggestionTransformers.mapINIntentValue<A>(extractor:)();
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

uint64_t dispatch thunk of SuggestionDetailsBuilder.intentIdentifier(_:)()
{
  return dispatch thunk of SuggestionDetailsBuilder.intentIdentifier(_:)();
}

uint64_t dispatch thunk of SuggestionDetailsBuilder.loggingIdentifier(_:)()
{
  return dispatch thunk of SuggestionDetailsBuilder.loggingIdentifier(_:)();
}

uint64_t dispatch thunk of SuggestionDetailsBuilder.parameter(parameterName:resolver:resolveParam:shownOnLockscreen:)()
{
  return dispatch thunk of SuggestionDetailsBuilder.parameter(parameterName:resolver:resolveParam:shownOnLockscreen:)();
}

uint64_t dispatch thunk of SuggestionOwnerDefinitionBuilder.add(suggestionId:catId:builder:)()
{
  return dispatch thunk of SuggestionOwnerDefinitionBuilder.add(suggestionId:catId:builder:)();
}

uint64_t dispatch thunk of SuggestionOwnerDefinitionBuilder.build()()
{
  return dispatch thunk of SuggestionOwnerDefinitionBuilder.build()();
}

uint64_t static Party.== infix(_:_:)()
{
  return static Party.== infix(_:_:)();
}

uint64_t type metadata accessor for Party()
{
  return type metadata accessor for Party();
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

uint64_t type metadata accessor for Signal()
{
  return type metadata accessor for Signal();
}

uint64_t Context.getAppId()()
{
  return Context.getAppId()();
}

uint64_t dispatch thunk of ReferenceResolutionClient.resolve(reference:filter:)()
{
  return dispatch thunk of ReferenceResolutionClient.resolve(reference:filter:)();
}

uint64_t ReferenceResolutionClient.__allocating_init()()
{
  return ReferenceResolutionClient.__allocating_init()();
}

uint64_t type metadata accessor for ReferenceResolutionClient()
{
  return type metadata accessor for ReferenceResolutionClient();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t RRCandidate.entity.getter()
{
  return RRCandidate.entity.getter();
}

uint64_t type metadata accessor for RRCandidate()
{
  return type metadata accessor for RRCandidate();
}

uint64_t type metadata accessor for RRQuery()
{
  return type metadata accessor for RRQuery();
}

uint64_t RREntity.usoEntity.getter()
{
  return RREntity.usoEntity.getter();
}

uint64_t type metadata accessor for RREntity()
{
  return type metadata accessor for RREntity();
}

uint64_t type metadata accessor for RRFilter()
{
  return type metadata accessor for RRFilter();
}

uint64_t type metadata accessor for RRResult()
{
  return type metadata accessor for RRResult();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

Swift::String __swiftcall String.lowercased()()
{
  uint64_t v0 = String.lowercased()();
  result._object = v1;
  result._uint64_t countAndFlagsBits = v0;
  return result;
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

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Array.description.getter()
{
  return Array.description.getter();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t dispatch thunk of Collection.isEmpty.getter()
{
  return dispatch thunk of Collection.isEmpty.getter();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return static _SetStorage.allocate(capacity:)();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
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

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t TUPreferredFaceTimeBundleIdentifier()
{
  return _TUPreferredFaceTimeBundleIdentifier();
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

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t self
{
  return _self;
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
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

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
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

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
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

uint64_t swift_unknownObjectRelease_n()
{
  return _swift_unknownObjectRelease_n();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}