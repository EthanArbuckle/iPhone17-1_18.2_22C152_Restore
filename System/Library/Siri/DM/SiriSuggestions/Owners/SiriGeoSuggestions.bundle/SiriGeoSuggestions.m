uint64_t StandardSuggestionSignals.isNotSharingETA.getter()
{
  uint64_t v0;
  void *v1;
  uint64_t (__cdecl *v3)();
  uint64_t v4;

  v3 = (uint64_t (__cdecl *)())((char *)&async function pointer to specialized StandardSuggestionSignals.isNotSharingETA.getter
                             + async function pointer to specialized StandardSuggestionSignals.isNotSharingETA.getter);
  v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = StandardSuggestionSignals.isNotSharingETA.getter;
  return v3();
}

uint64_t StandardSuggestionSignals.isNotSharingETA.getter(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

void closure #1 in StandardSuggestionSignals.isNotSharingETA.getter(uint64_t a1, void *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<Bool, Never>);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  unint64_t v7 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v8 + v7, (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  aBlock[4] = partial apply for closure #1 in closure #1 in StandardSuggestionSignals.isNotSharingETA.getter;
  aBlock[5] = v8;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed MSPSharedTripService) -> ();
  aBlock[3] = &block_descriptor;
  v9 = _Block_copy(aBlock);
  swift_release();
  [a2 performBlockAfterInitialSync:v9];
  _Block_release(v9);
}

uint64_t closure #1 in closure #1 in StandardSuggestionSignals.isNotSharingETA.getter(void *a1)
{
  id v1 = [a1 receivers];
  type metadata accessor for CNContact(0, &lazy cache variable for type metadata for MSPSharedTripContact);
  unint64_t v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<Bool, Never>);
  return CheckedContinuation.resume(returning:)();
}

void thunk for @escaping @callee_guaranteed (@guaranteed MSPSharedTripService) -> ()(uint64_t a1, void *a2)
{
  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t StandardSuggestionSignals.willNotPlayTrafficIncidentHint.getter()
{
  return GEOConfigGetBOOL() ^ 1;
}

uint64_t protocol witness for SuggestionsSignals.isNotSharingETA.getter in conformance StandardSuggestionSignals()
{
  v3 = (uint64_t (__cdecl *)())((char *)&async function pointer to specialized StandardSuggestionSignals.isNotSharingETA.getter
                             + async function pointer to specialized StandardSuggestionSignals.isNotSharingETA.getter);
  id v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = protocol witness for SuggestionsSignals.isNotSharingETA.getter in conformance StandardSuggestionSignals;
  return v3();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance BMAppLaunchType(void *a1, void *a2)
{
  return *a1 == *a2;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance BMAppLaunchType(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t specialized StandardSuggestionSignals.isNotSharingETA.getter()
{
  return _swift_task_switch(specialized StandardSuggestionSignals.isNotSharingETA.getter, 0, 0);
}

{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t (*v9)(void);
  uint64_t v11;

  id v1 = [self sharedInstance];
  v0[2] = v1;
  if (v1)
  {
    unint64_t v2 = v1;
    v3 = swift_task_alloc();
    v0[3] = v3;
    *(void *)(v3 + 16) = v2;
    uint64_t v4 = (void *)swift_task_alloc();
    v0[4] = v4;
    *uint64_t v4 = v0;
    v4[1] = specialized StandardSuggestionSignals.isNotSharingETA.getter;
    return withCheckedContinuation<A>(isolation:function:_:)(v0 + 5, 0, 0, 0x616853746F4E7369, 0xEF415445676E6972, partial apply for closure #1 in StandardSuggestionSignals.isNotSharingETA.getter, v3, &type metadata for Bool);
  }
  else
  {
    if (one-time initialization token for SuggestionsLog != -1) {
      swift_once();
    }
    uint64_t v5 = type metadata accessor for Logger();
    __swift_project_value_buffer(v5, (uint64_t)SuggestionsLog);
    uint64_t v6 = Logger.logObject.getter();
    unint64_t v7 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_0, v6, v7, "failed to get shared trip service", v8, 2u);
      swift_slowDealloc();
    }

    v9 = (uint64_t (*)(void))v0[1];
    return v9(0);
  }
}

{
  uint64_t v1;

  swift_task_dealloc();
  swift_task_dealloc();
  return _swift_task_switch(specialized StandardSuggestionSignals.isNotSharingETA.getter, 0, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v4;

  id v1 = *(unsigned __int8 *)(v0 + 40);
  unint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

void *specialized Sequence.compactMap<A>(_:)(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v26 = a3;
  uint64_t v27 = a2;
  uint64_t v25 = type metadata accessor for CharacterSet();
  uint64_t v6 = *(void (***)(char *, uint64_t))(v25 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v32 = (unint64_t)&_swiftEmptyArrayStorage;
  if (a1 >> 62)
  {
LABEL_20:
    swift_bridgeObjectRetain();
    uint64_t v9 = _CocoaArrayWrapper.endIndex.getter();
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v9 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    if (v9)
    {
LABEL_3:
      v23[1] = v4;
      unint64_t v29 = a1 & 0xC000000000000001;
      id v28 = self;
      v24 = v6 + 1;
      for (uint64_t i = 4; ; ++i)
      {
        uint64_t v4 = i - 4;
        if (v29) {
          v11 = (void (**)(char *, uint64_t))specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else {
          v11 = (void (**)(char *, uint64_t))*(id *)(a1 + 8 * i);
        }
        uint64_t v6 = v11;
        uint64_t v12 = i - 3;
        if (__OFADD__(v4, 1))
        {
          __break(1u);
          goto LABEL_20;
        }
        id v13 = [v28 stringFromContact:v11 style:0];
        if (v13)
        {
          v14 = v13;
          uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v17 = v16;

          uint64_t v30 = v15;
          uint64_t v31 = v17;
          static CharacterSet.whitespaces.getter();
          lazy protocol witness table accessor for type String and conformance String();
          uint64_t v18 = StringProtocol.trimmingCharacters(in:)();
          uint64_t v20 = v19;
          (*v24)(v8, v25);
          swift_bridgeObjectRelease();
          if (v18 == v27 && v20 == v26)
          {
            swift_bridgeObjectRelease();
LABEL_15:
            specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
            if (*(void *)((char *)&dword_10 + (v32 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                           + (v32 & 0xFFFFFFFFFFFFFF8)) >> 1)
              specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
            specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
            specialized Array._endMutation()();
            goto LABEL_5;
          }
          char v21 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          if (v21) {
            goto LABEL_15;
          }
        }

LABEL_5:
        if (v12 == v9)
        {
          swift_bridgeObjectRelease();
          return (void *)v32;
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  return &_swiftEmptyArrayStorage;
}

uint64_t specialized StandardSuggestionSignals.getContactName(fullName:)(SEL *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CharacterSet();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = a1;
  uint64_t v56 = a2;
  swift_bridgeObjectRetain();
  v55 = (SEL *)String.init<A>(_:)();
  uint64_t v56 = v8;
  static CharacterSet.whitespaces.getter();
  lazy protocol witness table accessor for type String and conformance String();
  uint64_t v9 = StringProtocol.trimmingCharacters(in:)();
  uint64_t v11 = v10;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  uint64_t v12 = swift_allocObject();
  long long v53 = xmmword_11E10;
  *(_OWORD *)(v12 + 16) = xmmword_11E10;
  id v13 = self;
  *(void *)(v12 + 32) = [v13 descriptorForRequiredKeysForStyle:0];
  v55 = (SEL *)v12;
  specialized Array._endMutation()();
  id v14 = objc_allocWithZone((Class)CNContactFetchRequest);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CNKeyDescriptor);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v52 = [v14 initWithKeysToFetch:isa];

  id v16 = self;
  NSString v17 = String._bridgeToObjectiveC()();
  id v18 = [v16 predicateForContactsMatchingName:v17];

  id v19 = [objc_allocWithZone((Class)CNContactStore) init];
  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = v53;
  *(void *)(v20 + 32) = [v13 descriptorForRequiredKeysForStyle:0];
  v55 = (SEL *)v20;
  specialized Array._endMutation()();
  Class v21 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v55 = 0;
  *(void *)&long long v53 = v18;
  id v22 = [v19 unifiedContactsMatchingPredicate:v18 keysToFetch:v21 error:&v55];

  v23 = v55;
  if (!v22)
  {
    v39 = v55;
    swift_bridgeObjectRelease();
    _convertNSErrorToError(_:)();

    swift_willThrow();
LABEL_17:
    if (one-time initialization token for SuggestionsLog != -1) {
      swift_once();
    }
    uint64_t v41 = type metadata accessor for Logger();
    __swift_project_value_buffer(v41, (uint64_t)SuggestionsLog);
    swift_errorRetain();
    swift_errorRetain();
    v42 = Logger.logObject.getter();
    os_log_type_t v43 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = (uint8_t *)swift_slowAlloc();
      v55 = (SEL *)swift_slowAlloc();
      *(_DWORD *)v44 = 136315138;
      swift_getErrorValue();
      uint64_t v45 = Error.localizedDescription.getter();
      uint64_t v54 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v45, v46, (uint64_t *)&v55);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl(&dword_0, v42, v43, "error retrieving contact: %s", v44, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {

      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();
    }
    return 0;
  }
  type metadata accessor for CNContact(0, &lazy cache variable for type metadata for CNContact);
  unint64_t v24 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v25 = v23;

  swift_bridgeObjectRetain();
  uint64_t v26 = (uint64_t)specialized Sequence.compactMap<A>(_:)(v24, v9, v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  if (!((unint64_t)v26 >> 62))
  {
    if (*(void *)((char *)&dword_10 + (v26 & 0xFFFFFFFFFFFFFF8)) == 1) {
      goto LABEL_4;
    }
LABEL_30:
    swift_bridgeObjectRelease();

    return 0;
  }
  if (v26 < 0) {
    id v22 = (id)v26;
  }
  else {
    id v22 = (id)(v26 & 0xFFFFFFFFFFFFFF8);
  }
  swift_bridgeObjectRetain();
  uint64_t v48 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (v48 != 1) {
    goto LABEL_30;
  }
  swift_bridgeObjectRetain();
  uint64_t v49 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v49)
  {

    swift_bridgeObjectRelease();
    return 0;
  }
LABEL_4:
  if ((v26 & 0xC000000000000001) != 0)
  {
    id v27 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
  }
  else
  {
    if (!*(void *)((char *)&dword_10 + (v26 & 0xFFFFFFFFFFFFFF8)))
    {
      __break(1u);
      goto LABEL_35;
    }
    id v27 = *(id *)(v26 + 32);
  }
  id v22 = v27;
  swift_bridgeObjectRelease();
  v23 = (SEL *)&CNKeyDescriptor__prots;
  NSString v28 = [v22 givenName];
  if (!v28)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    NSString v28 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  id v16 = [v16 predicateForContactsMatchingName:v28];

  id v29 = [objc_allocWithZone((Class)CNContactStore) init];
  Class v30 = Array._bridgeToObjectiveC()().super.isa;
  v55 = 0;
  id v31 = [v29 unifiedContactsMatchingPredicate:v16 keysToFetch:v30 error:&v55];

  unint64_t v32 = v55;
  if (!v31)
  {
    v40 = v55;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    goto LABEL_17;
  }
  unint64_t v33 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v34 = v32;

  if (!(v33 >> 62))
  {
    uint64_t v35 = *(void *)((char *)&dword_10 + (v33 & 0xFFFFFFFFFFFFFF8));
    goto LABEL_12;
  }
LABEL_35:
  swift_bridgeObjectRetain();
  uint64_t v35 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
LABEL_12:
  swift_bridgeObjectRelease();
  if (v35 < 2)
  {
    id v47 = [v22 v23[288]];
    uint64_t v38 = static String._unconditionallyBridgeFromObjectiveC(_:)();

    return v38;
  }
  id v36 = [v13 stringFromContact:v22 style:0];
  if (!v36)
  {

    return 0;
  }
  v37 = v36;
  uint64_t v38 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v38;
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void partial apply for closure #1 in StandardSuggestionSignals.isNotSharingETA.getter(uint64_t a1)
{
  closure #1 in StandardSuggestionSignals.isNotSharingETA.getter(a1, *(void **)(v1 + 16));
}

uint64_t sub_63E4()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<Bool, Never>);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return _swift_deallocObject(v0, v5, v6);
}

uint64_t partial apply for closure #1 in closure #1 in StandardSuggestionSignals.isNotSharingETA.getter(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<Bool, Never>);
  return closure #1 in closure #1 in StandardSuggestionSignals.isNotSharingETA.getter(a1);
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

uint64_t type metadata accessor for CNContact(uint64_t a1, unint64_t *a2)
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

uint64_t SiriGeoSuggestionsGenerator.__allocating_init(signals:)(long long *a1)
{
  uint64_t v2 = swift_allocObject();
  outlined init with take of SuggestionsSignals(a1, v2 + 16);
  return v2;
}

uint64_t SiriGeoSuggestionsGenerator.init(signals:)(long long *a1)
{
  outlined init with take of SuggestionsSignals(a1, v1 + 16);
  return v1;
}

uint64_t outlined init with take of SuggestionsSignals(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t SiriGeoSuggestionsGenerator.suggestionSignals.getter@<X0>(uint64_t a1@<X8>)
{
  return outlined init with copy of SuggestionsSignals(v1 + 16, a1);
}

uint64_t outlined init with copy of SuggestionsSignals(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t SiriGeoSuggestionsGenerator.generateCandidateSuggestions(interaction:environment:factory:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[30] = a3;
  v4[31] = v3;
  v4[28] = a1;
  v4[29] = a2;
  uint64_t v5 = type metadata accessor for Objective();
  v4[32] = v5;
  v4[33] = *(void *)(v5 - 8);
  v4[34] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for SiriGeoSuggestion();
  v4[35] = v6;
  v4[36] = *(void *)(v6 - 8);
  v4[37] = swift_task_alloc();
  return _swift_task_switch(SiriGeoSuggestionsGenerator.generateCandidateSuggestions(interaction:environment:factory:), 0, 0);
}

uint64_t SiriGeoSuggestionsGenerator.generateCandidateSuggestions(interaction:environment:factory:)()
{
  if (one-time initialization token for SuggestionsLog != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  __swift_project_value_buffer(v1, (uint64_t)SuggestionsLog);
  long long v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "Running SiriGeoSuggestionsGenerator", v4, 2u);
    swift_slowDealloc();
  }
  uint64_t v5 = *(void **)(v0 + 224);

  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  *(void *)(v0 + 304) = dispatch thunk of Interaction.verb.getter();
  *(void *)(v0 + 312) = v6;
  if (v6)
  {
    uint64_t v7 = *(void *)(v0 + 288);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<SiriGeoSuggestion>);
    uint64_t v8 = *(void *)(v7 + 72);
    *(void *)(v0 + 320) = v8;
    int v9 = *(_DWORD *)(v7 + 80);
    *(_DWORD *)(v0 + 360) = v9;
    unint64_t v10 = (v9 + 32) & ~(unint64_t)v9;
    uint64_t v11 = swift_allocObject();
    *(void *)(v0 + 328) = v11;
    *(_OWORD *)(v11 + 16) = xmmword_11E30;
    uint64_t v12 = (void *)(v11 + v10);
    static SiriGeoSuggestion.ShareETA.getter(v12);
    static SiriGeoSuggestion.PlayMusic.getter((void *)((char *)v12 + v8));
    static SiriGeoSuggestion.PlayNews.getter((void *)((char *)v12 + 2 * v8));
    *(_DWORD *)(v0 + 364) = enum case for Objective.discoverability(_:);
    *(void *)(v0 + 336) = 0;
    *(void *)(v0 + 344) = &_swiftEmptyArrayStorage;
    uint64_t v13 = *(void *)(v0 + 312);
    uint64_t v14 = *(void *)(v0 + 296);
    uint64_t v15 = *(void *)(v0 + 248);
    id v16 = *(void **)(v0 + 224);
    outlined init with copy of SiriGeoSuggestion(*(void *)(v0 + 328)+ ((*(unsigned __int8 *)(v0 + 360) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 360)), v14);
    __swift_project_boxed_opaque_existential_1(v16, v16[3]);
    *(void *)(v0 + 216) = dispatch thunk of Interaction.executionParameters.getter();
    id v22 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 + 56)
                                                                              + **(int **)(v14 + 56));
    NSString v17 = (void *)swift_task_alloc();
    *(void *)(v0 + 352) = v17;
    *NSString v17 = v0;
    v17[1] = SiriGeoSuggestionsGenerator.generateCandidateSuggestions(interaction:environment:factory:);
    uint64_t v18 = *(void *)(v0 + 304);
    uint64_t v19 = *(void *)(v0 + 232);
    return v22(v18, v13, v19, v0 + 216, v15 + 16);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    Class v21 = *(uint64_t (**)(void *))(v0 + 8);
    return v21(&_swiftEmptyArrayStorage);
  }
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t, unint64_t);
  unint64_t v6;
  char isUniquelyReferenced_nonNull_native;
  char *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v27)(char *);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  uint64_t (*v32)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v33;

  if (*(unsigned char *)(v0 + 368))
  {
    id v31 = *(_DWORD *)(v0 + 364);
    uint64_t v1 = *(void *)(v0 + 304);
    Class v30 = *(void *)(v0 + 272);
    long long v2 = *(void *)(v0 + 264);
    NSString v28 = *(void *)(v0 + 312);
    id v29 = *(void *)(v0 + 256);
    uint64_t v4 = *(void *)(v0 + 232);
    os_log_type_t v3 = *(void **)(v0 + 240);
    uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t, unint64_t))(*(void *)(v0 + 296)
                                                                            + *(int *)(*(void *)(v0 + 280) + 52));
    uint64_t v6 = specialized _dictionaryUpCast<A, B, C, D>(_:)(*(void *)(v0 + 216));
    swift_bridgeObjectRelease();
    v5(v1, v28, v4, v6);
    swift_bridgeObjectRelease();
    __swift_project_boxed_opaque_existential_1(v3, v3[3]);
    (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v30, v31, v29);
    CandidateSuggestionFactory.create(suggestionId:params:objective:)();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v30, v29);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = *(char **)(v0 + 344);
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      uint64_t v8 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v8 + 2) + 1, 1, *(char **)(v0 + 344));
    }
    unint64_t v10 = *((void *)v8 + 2);
    int v9 = *((void *)v8 + 3);
    if (v10 >= v9 >> 1) {
      uint64_t v8 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v9 > 1), v10 + 1, 1, v8);
    }
    uint64_t v11 = *(void *)(v0 + 296);
    *((void *)v8 + 2) = v10 + 1;
    outlined init with take of CandidateSuggestion?(v0 + 176, (uint64_t)&v8[40 * v10 + 32]);
    outlined destroy of SiriGeoSuggestion(v11);
  }
  else
  {
    uint64_t v12 = *(void *)(v0 + 296);
    swift_bridgeObjectRelease();
    outlined destroy of SiriGeoSuggestion(v12);
    uint64_t v8 = *(char **)(v0 + 344);
  }
  uint64_t v13 = *(void *)(v0 + 336) + 1;
  if (*(void *)(v0 + 336) == 2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v14 = *((void *)v8 + 2);
    if (v14)
    {
      uint64_t v15 = (uint64_t)(v8 + 32);
      swift_bridgeObjectRetain();
      id v16 = (char *)&_swiftEmptyArrayStorage;
      do
      {
        outlined init with copy of CandidateSuggestion?(v15, v0 + 16);
        outlined init with take of CandidateSuggestion?(v0 + 16, v0 + 96);
        if (*(void *)(v0 + 120))
        {
          outlined init with take of SuggestionsSignals((long long *)(v0 + 96), v0 + 56);
          outlined init with take of SuggestionsSignals((long long *)(v0 + 56), v0 + 136);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            id v16 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v16 + 2) + 1, 1, v16);
          }
          uint64_t v18 = *((void *)v16 + 2);
          NSString v17 = *((void *)v16 + 3);
          if (v18 >= v17 >> 1) {
            id v16 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v17 > 1), v18 + 1, 1, v16);
          }
          *((void *)v16 + 2) = v18 + 1;
          outlined init with take of SuggestionsSignals((long long *)(v0 + 136), (uint64_t)&v16[40 * v18 + 32]);
        }
        else
        {
          outlined destroy of CandidateSuggestion?(v0 + 96);
        }
        v15 += 40;
        --v14;
      }
      while (v14);
      swift_bridgeObjectRelease_n();
    }
    else
    {
      swift_bridgeObjectRelease();
      id v16 = (char *)&_swiftEmptyArrayStorage;
    }
    swift_task_dealloc();
    swift_task_dealloc();
    id v27 = *(uint64_t (**)(char *))(v0 + 8);
    return v27(v16);
  }
  else
  {
    *(void *)(v0 + 336) = v13;
    *(void *)(v0 + 344) = v8;
    uint64_t v19 = *(void *)(v0 + 312);
    uint64_t v20 = *(void *)(v0 + 296);
    Class v21 = *(void *)(v0 + 248);
    id v22 = *(void **)(v0 + 224);
    outlined init with copy of SiriGeoSuggestion(*(void *)(v0 + 328)+ ((*(unsigned __int8 *)(v0 + 360) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 360))+ *(void *)(v0 + 320) * v13, v20);
    __swift_project_boxed_opaque_existential_1(v22, v22[3]);
    *(void *)(v0 + 216) = dispatch thunk of Interaction.executionParameters.getter();
    unint64_t v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v20 + 56)
                                                                              + **(int **)(v20 + 56));
    uint64_t v23 = (void *)swift_task_alloc();
    *(void *)(v0 + 352) = v23;
    SEL *v23 = v0;
    v23[1] = SiriGeoSuggestionsGenerator.generateCandidateSuggestions(interaction:environment:factory:);
    unint64_t v24 = *(void *)(v0 + 304);
    uint64_t v25 = *(void *)(v0 + 232);
    return v32(v24, v19, v25, v0 + 216, v21 + 16);
  }
}

uint64_t SiriGeoSuggestionsGenerator.generateCandidateSuggestions(interaction:environment:factory:)(char a1)
{
  *(unsigned char *)(*(void *)v1 + 368) = a1;
  swift_task_dealloc();
  return _swift_task_switch(SiriGeoSuggestionsGenerator.generateCandidateSuggestions(interaction:environment:factory:), 0, 0);
}

unint64_t specialized _dictionaryUpCast<A, B, C, D>(_:)(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, Any>);
    long long v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    long long v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v35 = v1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(v1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(v1 + 64);
  int64_t v34 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = v47;
  uint64_t v7 = v45;
  uint64_t v8 = &v41;
  int v9 = &v43;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t v36 = 0;
  if (v5) {
    goto LABEL_10;
  }
LABEL_11:
  int64_t v19 = v36 + 1;
  if (__OFADD__(v36, 1)) {
    goto LABEL_35;
  }
  if (v19 >= v34) {
    goto LABEL_32;
  }
  unint64_t v20 = *(void *)(v35 + 8 * v19);
  int64_t v21 = v36 + 1;
  if (!v20)
  {
    int64_t v21 = v36 + 2;
    if (v36 + 2 >= v34) {
      goto LABEL_32;
    }
    unint64_t v20 = *(void *)(v35 + 8 * v21);
    if (!v20)
    {
      int64_t v21 = v36 + 3;
      if (v36 + 3 >= v34) {
        goto LABEL_32;
      }
      unint64_t v20 = *(void *)(v35 + 8 * v21);
      if (!v20)
      {
        int64_t v21 = v36 + 4;
        if (v36 + 4 >= v34) {
          goto LABEL_32;
        }
        unint64_t v20 = *(void *)(v35 + 8 * v21);
        if (!v20)
        {
          int64_t v22 = v36 + 5;
          if (v36 + 5 < v34)
          {
            unint64_t v20 = *(void *)(v35 + 8 * v22);
            if (v20)
            {
              int64_t v21 = v36 + 5;
              goto LABEL_26;
            }
            while (1)
            {
              int64_t v21 = v22 + 1;
              if (__OFADD__(v22, 1)) {
                goto LABEL_36;
              }
              if (v21 >= v34) {
                break;
              }
              unint64_t v20 = *(void *)(v35 + 8 * v21);
              ++v22;
              if (v20) {
                goto LABEL_26;
              }
            }
          }
LABEL_32:
          outlined consume of [String : Decodable & Encodable & Sendable].Iterator._Variant();
          return (unint64_t)v2;
        }
      }
    }
  }
LABEL_26:
  int64_t v36 = v21;
  uint64_t v37 = (v20 - 1) & v20;
  for (unint64_t i = __clz(__rbit64(v20)) + (v21 << 6); ; unint64_t i = __clz(__rbit64(v5)) | (v36 << 6))
  {
    uint64_t v23 = (uint64_t *)(*(void *)(v1 + 48) + 16 * i);
    uint64_t v25 = *v23;
    uint64_t v24 = v23[1];
    outlined init with copy of Decodable & Encodable & Sendable(*(void *)(v1 + 56) + 48 * i, (uint64_t)v6);
    *(void *)&long long v46 = v25;
    *((void *)&v46 + 1) = v24;
    v44[2] = v46;
    v45[0] = v47[0];
    v45[1] = v47[1];
    v45[2] = v47[2];
    uint64_t v39 = v25;
    uint64_t v40 = v24;
    outlined init with take of Decodable & Encodable & Sendable(v7, v38);
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Decodable & Encodable & Sendable);
    swift_dynamicCast();
    uint64_t v27 = v39;
    uint64_t v26 = v40;
    outlined init with take of Any(v8, v9);
    outlined init with take of Any(v9, v44);
    outlined init with take of Any(v44, &v42);
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(v27, v26);
    unint64_t v28 = result;
    if (v29)
    {
      uint64_t v11 = v9;
      uint64_t v12 = v8;
      uint64_t v13 = v1;
      uint64_t v14 = v7;
      uint64_t v15 = v6;
      id v16 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *id v16 = v27;
      v16[1] = v26;
      uint64_t v6 = v15;
      uint64_t v7 = v14;
      uint64_t v1 = v13;
      uint64_t v8 = v12;
      int v9 = v11;
      NSString v17 = (_OWORD *)(v2[7] + 32 * v28);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v17);
      unint64_t result = (unint64_t)outlined init with take of Any(&v42, v17);
      unint64_t v5 = v37;
      if (!v37) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    Class v30 = (uint64_t *)(v2[6] + 16 * result);
    *Class v30 = v27;
    v30[1] = v26;
    unint64_t result = (unint64_t)outlined init with take of Any(&v42, (_OWORD *)(v2[7] + 32 * result));
    uint64_t v31 = v2[2];
    BOOL v32 = __OFADD__(v31, 1);
    uint64_t v33 = v31 + 1;
    if (v32) {
      goto LABEL_34;
    }
    v2[2] = v33;
    unint64_t v5 = v37;
    if (!v37) {
      goto LABEL_11;
    }
LABEL_10:
    uint64_t v37 = (v5 - 1) & v5;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t SiriGeoSuggestionsGenerator.deinit()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return v0;
}

uint64_t SiriGeoSuggestionsGenerator.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t protocol witness for InternalGenerator.generateCandidateSuggestions(interaction:environment:factory:) in conformance SiriGeoSuggestionsGenerator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = StandardSuggestionSignals.isNotSharingETA.getter;
  return SiriGeoSuggestionsGenerator.generateCandidateSuggestions(interaction:environment:factory:)(a1, a2, a3);
}

uint64_t protocol witness for Wrappable.getRoot() in conformance SiriGeoSuggestionsGenerator()
{
  return Wrappable.getRoot()();
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t outlined init with copy of SiriGeoSuggestion(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SiriGeoSuggestion();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of SiriGeoSuggestion(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SiriGeoSuggestion();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t outlined init with copy of CandidateSuggestion?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CandidateSuggestion?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with take of CandidateSuggestion?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CandidateSuggestion?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of CandidateSuggestion?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CandidateSuggestion?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t serialize(_:at:)(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
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
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CandidateSuggestion>);
      unint64_t v10 = (char *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
      uint64_t v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[40 * v8 + 32]) {
          memmove(v12, a4 + 32, 40 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      unint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v12 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result) {
        goto LABEL_13;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v12, (uint64_t)a4);
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
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;

  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
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
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CandidateSuggestion?>);
      unint64_t v10 = (char *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
      uint64_t v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[40 * v8 + 32]) {
          memmove(v12, a4 + 32, 40 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      unint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v12 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result) {
        goto LABEL_13;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t base witness table accessor for InternalGenerator in SiriGeoSuggestionsGenerator()
{
  return lazy protocol witness table accessor for type SiriGeoSuggestionsGenerator and conformance SiriGeoSuggestionsGenerator(&lazy protocol witness table cache variable for type SiriGeoSuggestionsGenerator and conformance SiriGeoSuggestionsGenerator);
}

uint64_t type metadata accessor for SiriGeoSuggestionsGenerator()
{
  return self;
}

uint64_t base witness table accessor for Wrappable in SiriGeoSuggestionsGenerator()
{
  return lazy protocol witness table accessor for type SiriGeoSuggestionsGenerator and conformance SiriGeoSuggestionsGenerator(&lazy protocol witness table cache variable for type SiriGeoSuggestionsGenerator and conformance SiriGeoSuggestionsGenerator);
}

uint64_t lazy protocol witness table accessor for type SiriGeoSuggestionsGenerator and conformance SiriGeoSuggestionsGenerator(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for SiriGeoSuggestionsGenerator();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
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
    unint64_t v5 = a4 + 40 * a1 + 32;
    unint64_t v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CandidateSuggestion?);
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
    unint64_t v5 = a4 + 40 * a1 + 32;
    unint64_t v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CandidateSuggestion);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t outlined init with copy of Decodable & Encodable & Sendable(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *outlined init with take of Decodable & Encodable & Sendable(long long *a1, _OWORD *a2)
{
  long long v2 = *a1;
  long long v3 = a1[2];
  a2[1] = a1[1];
  a2[2] = v3;
  *a2 = v2;
  return a2;
}

_OWORD *outlined init with take of Any(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
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

uint64_t static SiriGeoSuggestion.AllSuggestions.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<SiriGeoSuggestion>);
  uint64_t v0 = *(void *)(type metadata accessor for SiriGeoSuggestion() - 8);
  uint64_t v1 = *(void *)(v0 + 72);
  unint64_t v2 = (*(unsigned __int8 *)(v0 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 80);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_11E30;
  uint64_t v4 = (void *)(v3 + v2);
  static SiriGeoSuggestion.ShareETA.getter(v4);
  static SiriGeoSuggestion.PlayMusic.getter((void *)((char *)v4 + v1));
  static SiriGeoSuggestion.PlayNews.getter((void *)((char *)v4 + 2 * v1));
  return v3;
}

uint64_t type metadata accessor for SiriGeoSuggestion()
{
  uint64_t result = type metadata singleton initialization cache for SiriGeoSuggestion;
  if (!type metadata singleton initialization cache for SiriGeoSuggestion) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t SiriGeoSuggestion.Parameter.name.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SiriGeoSuggestion.catIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SiriGeoSuggestion.enabledLocales.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SiriGeoSuggestion.enabledDevices.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SiriGeoSuggestion.validInvocations.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SiriGeoSuggestion.isEligible.getter()
{
  uint64_t v1 = *(void *)(v0 + 56);
  swift_retain();
  return v1;
}

uint64_t SiriGeoSuggestion.parameters.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SiriGeoSuggestion.intentIdentifier.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for SiriGeoSuggestion();
  return outlined init with copy of IntentType?(v1 + *(int *)(v3 + 44), a1, &demangling cache variable for type metadata for IntentType?);
}

uint64_t SiriGeoSuggestion.loggingIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for SiriGeoSuggestion() + 48));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SiriGeoSuggestion.getParams.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for SiriGeoSuggestion() + 52));
  swift_retain();
  return v1;
}

uint64_t SiriGeoSuggestion.Parameter.resolver.getter@<X0>(uint64_t a1@<X8>)
{
  return outlined init with copy of IntentType?(v1 + 16, a1, &demangling cache variable for type metadata for Resolver?);
}

uint64_t SiriGeoSuggestion.Parameter.resolveParam.getter()
{
  return swift_retain();
}

uint64_t SiriGeoSuggestion.Parameter.init(name:resolver:resolveParam:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  *a5 = a1;
  a5[1] = a2;
  uint64_t result = outlined init with take of Resolver?(a3, (uint64_t)(a5 + 2), &demangling cache variable for type metadata for Resolver?);
  a5[7] = a4;
  return result;
}

uint64_t SiriGeoSuggestion.init(identifier:catIdentifier:enabledLocales:enabledDevices:validInvocations:isEligible:parameters:intentIdentifier:loggingIdentifier:getParams:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  *a9 = a1;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  a9[7] = a8;
  a9[8] = a10;
  a9[9] = a11;
  NSString v17 = (int *)type metadata accessor for SiriGeoSuggestion();
  uint64_t result = outlined init with take of Resolver?(a12, (uint64_t)a9 + v17[11], &demangling cache variable for type metadata for IntentType?);
  int64_t v19 = (void *)((char *)a9 + v17[12]);
  *int64_t v19 = a13;
  v19[1] = a14;
  unint64_t v20 = (void *)((char *)a9 + v17[13]);
  *unint64_t v20 = a15;
  v20[1] = a16;
  return result;
}

uint64_t outlined init with copy of IntentType?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t outlined init with take of Resolver?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t one-time initialization function for shareETAIntent()
{
  uint64_t v0 = type metadata accessor for IntentType();
  __swift_allocate_value_buffer(v0, static SiriGeoSuggestion.shareETAIntent);
  __swift_project_value_buffer(v0, (uint64_t)static SiriGeoSuggestion.shareETAIntent);
  return static IntentType.inIntent(_:)();
}

uint64_t SiriGeoSuggestion.shareETAIntent.unsafeMutableAddressor()
{
  if (one-time initialization token for shareETAIntent != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for IntentType();
  return __swift_project_value_buffer(v0, (uint64_t)static SiriGeoSuggestion.shareETAIntent);
}

uint64_t static SiriGeoSuggestion.shareETAIntent.getter@<X0>(uint64_t a1@<X8>)
{
  if (one-time initialization token for shareETAIntent != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for IntentType();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)static SiriGeoSuggestion.shareETAIntent);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t static SiriGeoSuggestion.shareETAIntent.setter(uint64_t a1)
{
  if (one-time initialization token for shareETAIntent != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for IntentType();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)static SiriGeoSuggestion.shareETAIntent);
  swift_beginAccess();
  uint64_t v4 = *(void *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*static SiriGeoSuggestion.shareETAIntent.modify())()
{
  if (one-time initialization token for shareETAIntent != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for IntentType();
  __swift_project_value_buffer(v0, (uint64_t)static SiriGeoSuggestion.shareETAIntent);
  swift_beginAccess();
  return static SiriGeoSuggestion.shareETAIntent.modify;
}

void one-time initialization function for navigateVerb()
{
  static SiriGeoSuggestion.navigateVerb = 0x657461676976616ELL;
  qword_19350 = 0xE800000000000000;
}

uint64_t *SiriGeoSuggestion.navigateVerb.unsafeMutableAddressor()
{
  if (one-time initialization token for navigateVerb != -1) {
    swift_once();
  }
  return &static SiriGeoSuggestion.navigateVerb;
}

uint64_t static SiriGeoSuggestion.navigateVerb.getter()
{
  if (one-time initialization token for navigateVerb != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v0 = static SiriGeoSuggestion.navigateVerb;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t static SiriGeoSuggestion.navigateVerb.setter(uint64_t a1, uint64_t a2)
{
  if (one-time initialization token for navigateVerb != -1) {
    swift_once();
  }
  swift_beginAccess();
  static SiriGeoSuggestion.navigateVerb = a1;
  qword_19350 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static SiriGeoSuggestion.navigateVerb.modify())()
{
  if (one-time initialization token for navigateVerb != -1) {
    swift_once();
  }
  swift_beginAccess();
  return static SiriGeoSuggestion.navigateVerb.modify;
}

uint64_t initializeBufferWithCopyOfBuffer for SiriGeoSuggestion(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *(void *)a1 = *a2;
    uint64_t v4 = v15 + ((v5 + 16) & ~(unint64_t)v5);
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    uint64_t v8 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v8;
    uint64_t v9 = a2[5];
    *(void *)(a1 + 32) = a2[4];
    *(void *)(a1 + 40) = v9;
    *(_OWORD *)(a1 + 48) = *((_OWORD *)a2 + 3);
    uint64_t v10 = a2[9];
    uint64_t v11 = a3[11];
    uint64_t v27 = (char *)a2 + v11;
    __dst = (void *)(a1 + v11);
    *(void *)(a1 + 64) = a2[8];
    *(void *)(a1 + 72) = v10;
    uint64_t v12 = type metadata accessor for IntentType();
    uint64_t v25 = *(void *)(v12 - 8);
    uint64_t v26 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v25 + 48);
    uint64_t v13 = v12;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    if (v26(v27, 1, v13))
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IntentType?);
      memcpy(__dst, v27, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v25 + 16))(__dst, v27, v13);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v25 + 56))(__dst, 0, 1, v13);
    }
    uint64_t v16 = a3[12];
    uint64_t v17 = a3[13];
    uint64_t v18 = (void *)(v4 + v16);
    int64_t v19 = (uint64_t *)((char *)a2 + v16);
    uint64_t v20 = v19[1];
    *uint64_t v18 = *v19;
    v18[1] = v20;
    int64_t v21 = (void *)(v4 + v17);
    int64_t v22 = (uint64_t *)((char *)a2 + v17);
    uint64_t v23 = v22[1];
    *int64_t v21 = *v22;
    v21[1] = v23;
    swift_bridgeObjectRetain();
  }
  swift_retain();
  return v4;
}

uint64_t destroy for SiriGeoSuggestion(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 44);
  uint64_t v5 = type metadata accessor for IntentType();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t initializeWithCopy for SiriGeoSuggestion(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v5 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v7;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  uint64_t v8 = *(void *)(a2 + 72);
  uint64_t v9 = a3[11];
  __dst = (void *)(a1 + v9);
  uint64_t v23 = (const void *)(a2 + v9);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v8;
  uint64_t v10 = type metadata accessor for IntentType();
  uint64_t v21 = *(void *)(v10 - 8);
  int64_t v22 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v21 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  if (v22(v23, 1, v10))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IntentType?);
    memcpy(__dst, v23, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v21 + 16))(__dst, v23, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v21 + 56))(__dst, 0, 1, v10);
  }
  uint64_t v12 = a3[12];
  uint64_t v13 = a3[13];
  uint64_t v14 = (void *)(a1 + v12);
  uint64_t v15 = (void *)(a2 + v12);
  uint64_t v16 = v15[1];
  void *v14 = *v15;
  v14[1] = v16;
  uint64_t v17 = (void *)(a1 + v13);
  uint64_t v18 = (void *)(a2 + v13);
  uint64_t v19 = v18[1];
  *uint64_t v17 = *v18;
  v17[1] = v19;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for SiriGeoSuggestion(void *a1, void *a2, int *a3)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[8];
  a1[7] = a2[7];
  a1[8] = v6;
  swift_retain();
  swift_release();
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[11];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for IntentType();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 24))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IntentType?);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  uint64_t v16 = a3[12];
  uint64_t v17 = (void *)((char *)a1 + v16);
  uint64_t v18 = (void *)((char *)a2 + v16);
  *uint64_t v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v19 = a3[13];
  uint64_t v20 = (void *)((char *)a1 + v19);
  uint64_t v21 = (void *)((char *)a2 + v19);
  uint64_t v22 = v21[1];
  *uint64_t v20 = *v21;
  v20[1] = v22;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for SiriGeoSuggestion(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  long long v7 = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  uint64_t v8 = a3[11];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (const void *)(a2 + v8);
  *(_OWORD *)(a1 + 56) = v7;
  uint64_t v11 = type metadata accessor for IntentType();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IntentType?);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 32))(v9, v10, v11);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  uint64_t v14 = a3[13];
  *(_OWORD *)(a1 + a3[12]) = *(_OWORD *)(a2 + a3[12]);
  *(_OWORD *)(a1 + v14) = *(_OWORD *)(a2 + v14);
  return a1;
}

uint64_t assignWithTake for SiriGeoSuggestion(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_release();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRelease();
  uint64_t v8 = a3[11];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  uint64_t v11 = type metadata accessor for IntentType();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v12 + 48);
  int v14 = v13(v9, 1, v11);
  int v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      (*(void (**)(void *, void *, uint64_t))(v12 + 40))(v9, v10, v11);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v9, v11);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IntentType?);
    memcpy(v9, v10, *(void *)(*(void *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v12 + 32))(v9, v10, v11);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
LABEL_7:
  uint64_t v17 = a3[12];
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (uint64_t *)(a2 + v17);
  uint64_t v21 = *v19;
  uint64_t v20 = v19[1];
  *uint64_t v18 = v21;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + a3[13]) = *(_OWORD *)(a2 + a3[13]);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriGeoSuggestion(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_91B8);
}

uint64_t sub_91B8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IntentType?);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 44);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for SiriGeoSuggestion(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_9280);
}

uint64_t sub_9280(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IntentType?);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 44);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void type metadata completion function for SiriGeoSuggestion()
{
  type metadata accessor for IntentType?();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void type metadata accessor for IntentType?()
{
  if (!lazy cache variable for type metadata for IntentType?)
  {
    type metadata accessor for IntentType();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for IntentType?);
    }
  }
}

uint64_t initializeBufferWithCopyOfBuffer for SiriGeoSuggestion.Parameter(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SiriGeoSuggestion.Parameter(uint64_t a1)
{
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 40)) {
    __swift_destroy_boxed_opaque_existential_1Tm(a1 + 16);
  }
  return swift_release();
}

uint64_t initializeWithCopy for SiriGeoSuggestion.Parameter(uint64_t a1, void *a2)
{
  uint64_t v4 = a2[1];
  *(void *)a1 = *a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = a2 + 2;
  uint64_t v6 = a2[5];
  swift_bridgeObjectRetain();
  if (v6)
  {
    uint64_t v7 = a2[6];
    *(void *)(a1 + 40) = v6;
    *(void *)(a1 + 48) = v7;
    (**(void (***)(uint64_t, void *, uint64_t))(v6 - 8))(a1 + 16, v5, v6);
  }
  else
  {
    long long v8 = *((_OWORD *)v5 + 1);
    *(_OWORD *)(a1 + 16) = *(_OWORD *)v5;
    *(_OWORD *)(a1 + 32) = v8;
    *(void *)(a1 + 48) = v5[4];
  }
  *(void *)(a1 + 56) = a2[7];
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for SiriGeoSuggestion.Parameter(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 40);
  if (!*(void *)(a1 + 40))
  {
    if (v4)
    {
      *(void *)(a1 + 40) = v4;
      *(void *)(a1 + 48) = *(void *)(a2 + 48);
      (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 16, a2 + 16);
      goto LABEL_8;
    }
LABEL_7:
    long long v5 = *(_OWORD *)(a2 + 16);
    long long v6 = *(_OWORD *)(a2 + 32);
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    *(_OWORD *)(a1 + 16) = v5;
    *(_OWORD *)(a1 + 32) = v6;
    goto LABEL_8;
  }
  if (!v4)
  {
    __swift_destroy_boxed_opaque_existential_1Tm(a1 + 16);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 16), (uint64_t *)(a2 + 16));
LABEL_8:
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_release();
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

uint64_t assignWithTake for SiriGeoSuggestion.Parameter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 40)) {
    __swift_destroy_boxed_opaque_existential_1Tm(a1 + 16);
  }
  long long v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v5;
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriGeoSuggestion.Parameter(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriGeoSuggestion.Parameter(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
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
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriGeoSuggestion.Parameter()
{
  return &type metadata for SiriGeoSuggestion.Parameter;
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

double static SiriGeoSuggestion.PlayMusic.getter@<D0>(void *a1@<X8>)
{
  if (one-time initialization token for t41Locales != -1) {
    swift_once();
  }
  uint64_t v2 = static SiriGeoSuggestionsConstants.t41Locales;
  uint64_t v3 = one-time initialization token for kCarPlayDevice;
  swift_bridgeObjectRetain();
  if (v3 != -1) {
    swift_once();
  }
  uint64_t v4 = static SiriGeoSuggestionsConstants.kCarPlayDevice;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<VersionedInvocation>);
  type metadata accessor for VersionedInvocation();
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_11FE0;
  swift_bridgeObjectRetain();
  static VersionedInvocations.HintsDawnC.getter();
  uint64_t v6 = (int *)type metadata accessor for SiriGeoSuggestion();
  uint64_t v7 = (char *)a1 + v6[11];
  uint64_t v8 = type metadata accessor for IntentType();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  *a1 = 0x6973754D79616C50;
  a1[1] = 0xE900000000000063;
  a1[2] = 0xD00000000000001CLL;
  a1[3] = 0x80000000000124B0;
  a1[4] = v2;
  a1[5] = v4;
  a1[6] = v5;
  a1[7] = &async function pointer to implicit closure #1 in static SiriGeoSuggestion.PlayMusic.getter;
  a1[8] = 0;
  a1[9] = &_swiftEmptyArrayStorage;
  double result = 9.3089372e199;
  *(_OWORD *)((char *)a1 + v6[12]) = xmmword_11FF0;
  uint64_t v10 = (unint64_t (**)())((char *)a1 + v6[13]);
  *uint64_t v10 = closure #1 in static SiriGeoSuggestion.PlayMusic.getter;
  v10[1] = 0;
  return result;
}

uint64_t static SiriGeoSuggestion.ineligibleHint(_:environment:_:signals:)()
{
  return implicit closure #1 in static SiriGeoSuggestion.PlayMusic.getter(*(uint64_t (**)(uint64_t))(v0 + 8), v0, 0);
}

unint64_t closure #1 in static SiriGeoSuggestion.PlayMusic.getter()
{
  return specialized Dictionary.init(dictionaryLiteral:)((uint64_t)&_swiftEmptyArrayStorage);
}

uint64_t implicit closure #1 in static SiriGeoSuggestion.PlayMusic.getter(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
}

double static SiriGeoSuggestion.PlayNews.getter@<D0>(void *a1@<X8>)
{
  if (one-time initialization token for t41Locales != -1) {
    swift_once();
  }
  uint64_t v2 = static SiriGeoSuggestionsConstants.t41Locales;
  uint64_t v3 = one-time initialization token for kCarPlayDevice;
  swift_bridgeObjectRetain();
  if (v3 != -1) {
    swift_once();
  }
  uint64_t v4 = static SiriGeoSuggestionsConstants.kCarPlayDevice;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<VersionedInvocation>);
  type metadata accessor for VersionedInvocation();
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_11FE0;
  swift_bridgeObjectRetain();
  static VersionedInvocations.HintsDawnC.getter();
  uint64_t v6 = (int *)type metadata accessor for SiriGeoSuggestion();
  uint64_t v7 = (char *)a1 + v6[11];
  uint64_t v8 = type metadata accessor for IntentType();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  *a1 = 0x7377654E79616C50;
  a1[1] = 0xE800000000000000;
  a1[2] = 0xD00000000000001BLL;
  a1[3] = 0x80000000000124D0;
  a1[4] = v2;
  a1[5] = v4;
  a1[6] = v5;
  a1[7] = &async function pointer to implicit closure #1 in static SiriGeoSuggestion.PlayNews.getter;
  a1[8] = 0;
  a1[9] = &_swiftEmptyArrayStorage;
  double result = 4.61716887e69;
  *(_OWORD *)((char *)a1 + v6[12]) = xmmword_12000;
  uint64_t v10 = (unint64_t (**)())((char *)a1 + v6[13]);
  *uint64_t v10 = closure #1 in static SiriGeoSuggestion.PlayMusic.getter;
  v10[1] = 0;
  return result;
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

uint64_t outlined init with copy of (String, Any)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t static SiriGeoSuggestion.ShareETA.getter@<X0>(void *a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IntentType?);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for t41Locales != -1) {
    swift_once();
  }
  uint64_t v4 = static SiriGeoSuggestionsConstants.t41Locales;
  uint64_t v5 = one-time initialization token for kCarPlayDevice;
  swift_bridgeObjectRetain();
  if (v5 != -1) {
    swift_once();
  }
  uint64_t v6 = static SiriGeoSuggestionsConstants.kCarPlayDevice;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<VersionedInvocation>);
  type metadata accessor for VersionedInvocation();
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_11FE0;
  swift_bridgeObjectRetain();
  static VersionedInvocations.HintsDawnC.getter();
  if (one-time initialization token for shareETAIntent != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for IntentType();
  uint64_t v9 = __swift_project_value_buffer(v8, (uint64_t)static SiriGeoSuggestion.shareETAIntent);
  swift_beginAccess();
  uint64_t v10 = *(void *)(v8 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v3, v9, v8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v3, 0, 1, v8);
  *a1 = 0x4154456572616853;
  a1[1] = 0xE800000000000000;
  a1[2] = 0xD00000000000001BLL;
  a1[3] = 0x80000000000124F0;
  a1[4] = v4;
  a1[5] = v6;
  a1[6] = v7;
  a1[7] = &async function pointer to implicit closure #1 in static SiriGeoSuggestion.ShareETA.getter;
  a1[8] = 0;
  a1[9] = &_swiftEmptyArrayStorage;
  uint64_t v11 = (int *)type metadata accessor for SiriGeoSuggestion();
  uint64_t result = outlined init with take of IntentType?((uint64_t)v3, (uint64_t)a1 + v11[11]);
  BOOL v13 = (void *)((char *)a1 + v11[12]);
  *BOOL v13 = 0;
  v13[1] = 0;
  uint64_t v14 = (unint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)a1 + v11[13]);
  void *v14 = partial apply for implicit closure #2 in static SiriGeoSuggestion.ShareETA.getter;
  v14[1] = 0;
  return result;
}

uint64_t implicit closure #1 in static SiriGeoSuggestion.ShareETA.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  *uint64_t v10 = v5;
  v10[1] = StandardSuggestionSignals.isNotSharingETA.getter;
  v10[61] = a4;
  v10[62] = a5;
  v10[59] = a1;
  v10[60] = a2;
  return _swift_task_switch(specialized static SiriGeoSuggestion.validateShareETA(_:environment:_:signals:), 0, 0);
}

uint64_t specialized Dictionary.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    outlined init with take of Decodable & Encodable & Sendable((long long *)a1, v9);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v9, a2, a3, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v8;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    outlined destroy of (Decodable & Encodable & Sendable)?(a1);
    specialized Dictionary._Variant.removeValue(forKey:)(a2, a3, v9);
    swift_bridgeObjectRelease();
    return outlined destroy of (Decodable & Encodable & Sendable)?((uint64_t)v9);
  }
}

unint64_t partial apply for implicit closure #2 in static SiriGeoSuggestion.ShareETA.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return specialized static SiriGeoSuggestion.getShareETAParams(_:environment:_:)(a3, a4);
}

uint64_t outlined init with take of IntentType?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IntentType?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

double specialized Dictionary._Variant.removeValue(forKey:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = specialized __RawDictionaryStorage.find<A>(_:)(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v13 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      specialized _NativeDictionary.copy()();
      uint64_t v11 = v13;
    }
    swift_bridgeObjectRelease();
    outlined init with take of Decodable & Encodable & Sendable((long long *)(*(void *)(v11 + 56) + 48 * v8), a3);
    specialized _NativeDictionary._delete(at:)(v8, v11);
    *uint64_t v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    a3[1] = 0u;
    a3[2] = 0u;
    *a3 = 0u;
  }
  return result;
}

uint64_t specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, Decodable & Encodable & Sendable>);
  char v37 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = v2;
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v17 = v16 | (v13 << 6);
      goto LABEL_22;
    }
    int64_t v18 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v18 >= v35) {
      break;
    }
    uint64_t v19 = (void *)(v5 + 64);
    unint64_t v20 = *(void *)(v36 + 8 * v18);
    ++v13;
    if (!v20)
    {
      int64_t v13 = v18 + 1;
      if (v18 + 1 >= v35) {
        goto LABEL_34;
      }
      unint64_t v20 = *(void *)(v36 + 8 * v13);
      if (!v20)
      {
        int64_t v21 = v18 + 2;
        if (v21 >= v35)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v34;
          if ((v37 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v20 = *(void *)(v36 + 8 * v21);
        if (!v20)
        {
          while (1)
          {
            int64_t v13 = v21 + 1;
            if (__OFADD__(v21, 1)) {
              goto LABEL_43;
            }
            if (v13 >= v35) {
              goto LABEL_34;
            }
            unint64_t v20 = *(void *)(v36 + 8 * v13);
            ++v21;
            if (v20) {
              goto LABEL_21;
            }
          }
        }
        int64_t v13 = v21;
      }
    }
LABEL_21:
    unint64_t v10 = (v20 - 1) & v20;
    unint64_t v17 = __clz(__rbit64(v20)) + (v13 << 6);
LABEL_22:
    uint64_t v22 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
    uint64_t v24 = *v22;
    uint64_t v23 = v22[1];
    uint64_t v25 = (long long *)(*(void *)(v5 + 56) + 48 * v17);
    if (v37)
    {
      outlined init with take of Decodable & Encodable & Sendable(v25, v38);
    }
    else
    {
      outlined init with copy of Decodable & Encodable & Sendable((uint64_t)v25, (uint64_t)v38);
      swift_bridgeObjectRetain();
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v26 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v14 = __clz(__rbit64((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v31 = v28 == v30;
        if (v28 == v30) {
          unint64_t v28 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v11 + 8 * v28);
      }
      while (v32 == -1);
      unint64_t v14 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    uint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
    *uint64_t v15 = v24;
    v15[1] = v23;
    uint64_t result = (uint64_t)outlined init with take of Decodable & Encodable & Sendable(v38, (_OWORD *)(*(void *)(v7 + 56) + 48 * v14));
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  uint64_t v19 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v19, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v19 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t specialized _NativeDictionary._delete(at:)(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        Hasher.init(_seed:)();
        swift_bridgeObjectRetain();
        String.hash(into:)();
        Swift::Int v11 = Hasher._finalize()();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v12 = v11 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v12 < v8) {
            goto LABEL_5;
          }
        }
        else if (v12 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v12)
        {
LABEL_11:
          uint64_t v13 = *(void *)(a2 + 48);
          unint64_t v14 = (_OWORD *)(v13 + 16 * v3);
          uint64_t v15 = (_OWORD *)(v13 + 16 * v6);
          if (v3 != v6 || v14 >= v15 + 1) {
            _OWORD *v14 = *v15;
          }
          uint64_t v16 = *(void *)(a2 + 56);
          unint64_t v17 = (long long *)(v16 + 48 * v3);
          int64_t v18 = (long long *)(v16 + 48 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v17 >= v18 + 3))
          {
            long long v9 = *v18;
            long long v10 = v18[2];
            v17[1] = v18[1];
            v17[2] = v10;
            *unint64_t v17 = v9;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v20 = *v19;
    uint64_t v21 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v21 = *v19;
    uint64_t v20 = (-1 << result) - 1;
  }
  *uint64_t v19 = v21 & v20;
  uint64_t v22 = *(void *)(a2 + 16);
  BOOL v23 = __OFSUB__(v22, 1);
  uint64_t v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

_OWORD *specialized _NativeDictionary.setValue(_:forKey:isUnique:)(long long *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  long long v10 = (void *)*v4;
  unint64_t v12 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      specialized _NativeDictionary.copy()();
      goto LABEL_7;
    }
    specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v15, a4 & 1);
    unint64_t v21 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      int64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
LABEL_7:
  int64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = (_OWORD *)(v18[7] + 48 * v12);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v19);
    return outlined init with take of Decodable & Encodable & Sendable(a1, v19);
  }
LABEL_13:
  specialized _NativeDictionary._insert(at:key:value:)(v12, a2, a3, a1, v18);
  return (_OWORD *)swift_bridgeObjectRetain();
}

_OWORD *specialized _NativeDictionary._insert(at:key:value:)(unint64_t a1, uint64_t a2, uint64_t a3, long long *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  unint64_t v6 = (void *)(a5[6] + 16 * a1);
  *unint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = outlined init with take of Decodable & Encodable & Sendable(a4, (_OWORD *)(a5[7] + 48 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

void *specialized _NativeDictionary.copy()()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, Decodable & Encodable & Sendable>);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v25 = v1;
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 48 * v15;
    outlined init with copy of Decodable & Encodable & Sendable(*(void *)(v2 + 56) + 48 * v15, (uint64_t)v26);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = v19;
    v21[1] = v18;
    outlined init with take of Decodable & Encodable & Sendable(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v25;
    goto LABEL_28;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t specialized static SiriGeoSuggestion.validateShareETA(_:environment:_:signals:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[61] = a4;
  v5[62] = a5;
  v5[59] = a1;
  v5[60] = a2;
  return _swift_task_switch(specialized static SiriGeoSuggestion.validateShareETA(_:environment:_:signals:), 0, 0);
}

uint64_t specialized static SiriGeoSuggestion.validateShareETA(_:environment:_:signals:)()
{
  uint64_t v64 = v0;
  if (one-time initialization token for navigateVerb != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)(v0 + 472);
  uint64_t v1 = *(void *)(v0 + 480);
  swift_beginAccess();
  BOOL v3 = static SiriGeoSuggestion.navigateVerb == v2 && qword_19350 == v1;
  if (!v3 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
    goto LABEL_17;
  }
  uint64_t v4 = **(void **)(v0 + 488);
  if (!*(void *)(v4 + 16)) {
    goto LABEL_15;
  }
  unint64_t v5 = specialized __RawDictionaryStorage.find<A>(_:)(0xD000000000000015, 0x80000000000122A0);
  if ((v6 & 1) == 0) {
    goto LABEL_15;
  }
  outlined init with copy of Decodable & Encodable & Sendable(*(void *)(v4 + 56) + 48 * v5, v0 + 64);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Decodable & Encodable & Sendable);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_15;
  }
  uint64_t v8 = *(void *)(v0 + 376);
  uint64_t v7 = *(void *)(v0 + 384);
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (!v7)
  {
LABEL_16:
    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  if (v8 == v9 && v7 == v10)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v13 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v13 & 1) == 0) {
      goto LABEL_17;
    }
  }
  uint64_t v14 = **(void **)(v0 + 488);
  if (!*(void *)(v14 + 16)
    || (unint64_t v15 = specialized __RawDictionaryStorage.find<A>(_:)(0xD000000000000010, 0x80000000000122C0), (v16 & 1) == 0)
    || (outlined init with copy of Decodable & Encodable & Sendable(*(void *)(v14 + 56) + 48 * v15, v0 + 112),
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Decodable & Encodable & Sendable),
        (swift_dynamicCast() & 1) == 0))
  {
LABEL_15:
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    goto LABEL_16;
  }
  uint64_t v18 = *(void *)(v0 + 408);
  uint64_t v17 = *(void *)(v0 + 416);
  uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (!v17) {
    goto LABEL_16;
  }
  if (v18 == v19 && v17 == v20)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v21 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v21 & 1) == 0) {
      goto LABEL_17;
    }
  }
  uint64_t v22 = **(void **)(v0 + 488);
  if (*(void *)(v22 + 16))
  {
    unint64_t v23 = specialized __RawDictionaryStorage.find<A>(_:)(0x4C746E6572727563, 0xEA00000000007461);
    if (v24)
    {
      outlined init with copy of Decodable & Encodable & Sendable(*(void *)(v22 + 56) + 48 * v23, v0 + 160);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Decodable & Encodable & Sendable);
      if (swift_dynamicCast())
      {
        uint64_t v25 = **(void **)(v0 + 488);
        if (*(void *)(v25 + 16))
        {
          double v26 = *(double *)(v0 + 448);
          unint64_t v27 = specialized __RawDictionaryStorage.find<A>(_:)(0x4C746E6572727563, 0xEB00000000676E6FLL);
          if (v28)
          {
            outlined init with copy of Decodable & Encodable & Sendable(*(void *)(v25 + 56) + 48 * v27, v0 + 256);
            if (swift_dynamicCast())
            {
              uint64_t v29 = **(void **)(v0 + 488);
              if (*(void *)(v29 + 16))
              {
                double v30 = *(double *)(v0 + 440);
                unint64_t v31 = specialized __RawDictionaryStorage.find<A>(_:)(0x74616E6974736564, 0xEE0074614C6E6F69);
                if (v32)
                {
                  outlined init with copy of Decodable & Encodable & Sendable(*(void *)(v29 + 56) + 48 * v31, v0 + 208);
                  if (swift_dynamicCast())
                  {
                    uint64_t v33 = **(void **)(v0 + 488);
                    if (*(void *)(v33 + 16))
                    {
                      double v34 = *(double *)(v0 + 464);
                      unint64_t v35 = specialized __RawDictionaryStorage.find<A>(_:)(0x74616E6974736564, 0xEF676E6F4C6E6F69);
                      if (v36)
                      {
                        outlined init with copy of Decodable & Encodable & Sendable(*(void *)(v33 + 56) + 48 * v35, v0 + 304);
                        if (swift_dynamicCast())
                        {
                          double v37 = *(double *)(v0 + 456);
                          id v38 = [objc_allocWithZone((Class)CLLocation) initWithLatitude:v26 longitude:v30];
                          *(void *)(v0 + 504) = v38;
                          id v39 = [objc_allocWithZone((Class)CLLocation) initWithLatitude:v34 longitude:v37];
                          *(void *)(v0 + 512) = v39;
                          [v38 distanceFromLocation:v39];
                          if (v40 > 6440.0)
                          {
                            uint64_t v41 = *(void **)(v0 + 496);
                            uint64_t v42 = v41[3];
                            uint64_t v43 = v41[4];
                            __swift_project_boxed_opaque_existential_1(v41, v42);
                            if ((*(uint64_t (**)(uint64_t, uint64_t))(v43 + 40))(v42, v43))
                            {
                              uint64_t v44 = **(void **)(v0 + 488);
                              if (*(void *)(v44 + 16))
                              {
                                unint64_t v45 = specialized __RawDictionaryStorage.find<A>(_:)(0xD000000000000010, 0x8000000000012280);
                                if (v46)
                                {
                                  outlined init with copy of Decodable & Encodable & Sendable(*(void *)(v44 + 56) + 48 * v45, v0 + 16);
                                  if (swift_dynamicCast())
                                  {
                                    uint64_t v47 = *(void *)(v0 + 400);
                                    *(void *)(v0 + 424) = *(void *)(v0 + 392);
                                    *(void *)(v0 + 432) = v47;
                                    lazy protocol witness table accessor for type String and conformance String();
                                    uint64_t v48 = StringProtocol<>.split(separator:maxSplits:omittingEmptySubsequences:)();
                                    swift_bridgeObjectRelease();
                                    if (*(void *)(v48 + 16))
                                    {
                                      v62 = *(void **)(v0 + 496);
                                      swift_bridgeObjectRetain();
                                      swift_bridgeObjectRelease();
                                      uint64_t v49 = static String._fromSubstring(_:)();
                                      uint64_t v51 = v50;
                                      swift_bridgeObjectRelease();
                                      uint64_t v52 = v41[3];
                                      uint64_t v53 = v41[4];
                                      __swift_project_boxed_opaque_existential_1(v62, v52);
                                      uint64_t v54 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v53 + 64))(v49, v51, v52, v53);
                                      uint64_t v56 = v55;
                                      swift_bridgeObjectRelease();
                                      if (v56)
                                      {
                                        v57 = *(void **)(v0 + 496);
                                        v63[3] = &type metadata for String;
                                        v63[4] = &protocol witness table for String;
                                        v63[5] = &protocol witness table for String;
                                        v63[0] = v54;
                                        v63[1] = v56;
                                        specialized Dictionary.subscript.setter((uint64_t)v63, 0xD000000000000012, 0x80000000000122F0);
                                        uint64_t v58 = v41[3];
                                        uint64_t v59 = v41[4];
                                        __swift_project_boxed_opaque_existential_1(v57, v58);
                                        v61 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v59 + 56)
                                                                                       + **(int **)(v59 + 56));
                                        v60 = (void *)swift_task_alloc();
                                        *(void *)(v0 + 520) = v60;
                                        void *v60 = v0;
                                        v60[1] = specialized static SiriGeoSuggestion.validateShareETA(_:environment:_:signals:);
                                        return v61(v58, v59);
                                      }
                                    }
                                    else
                                    {
                                      swift_bridgeObjectRelease();
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
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_17:
  uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
  return v11(0);
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v5;

  uint64_t v1 = *(void **)(v0 + 504);

  uint64_t v2 = *(unsigned __int8 *)(v0 + 528);
  BOOL v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v3(v2);
}

uint64_t specialized static SiriGeoSuggestion.validateShareETA(_:environment:_:signals:)(char a1)
{
  *(unsigned char *)(*(void *)v1 + 528) = a1;
  swift_task_dealloc();
  return _swift_task_switch(specialized static SiriGeoSuggestion.validateShareETA(_:environment:_:signals:), 0, 0);
}

unint64_t specialized static SiriGeoSuggestion.getShareETAParams(_:environment:_:)(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any)>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_11FE0;
  *(void *)(inited + 32) = 0x4E746361746E6F63;
  *(void *)(inited + 40) = 0xEB00000000656D61;
  *(void *)(inited + 72) = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  uint64_t v4 = swift_allocObject();
  unint64_t v5 = (_OWORD *)(v4 + 16);
  *(void *)(inited + 48) = v4;
  if (*(void *)(a2 + 16)
    && (unint64_t v6 = specialized __RawDictionaryStorage.find<A>(_:)(0xD000000000000012, 0x80000000000122F0), (v7 & 1) != 0))
  {
    outlined init with copy of Any(*(void *)(a2 + 56) + 32 * v6, (uint64_t)v5);
  }
  else
  {
    *unint64_t v5 = 0u;
    v5[1] = 0u;
  }
  return specialized Dictionary.init(dictionaryLiteral:)(inited);
}

uint64_t sub_B9B4()
{
  if (*(void *)(v0 + 40)) {
    __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  }
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t outlined destroy of (Decodable & Encodable & Sendable)?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Decodable & Encodable & Sendable)?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t static SiriGeoSuggestionsPluginOwnerDefinitionFactoryBase.createOwnerDefinitionsImpl(builderFactory:signals:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[18] = a2;
  v3[19] = a3;
  v3[17] = a1;
  return _swift_task_switch(static SiriGeoSuggestionsPluginOwnerDefinitionFactoryBase.createOwnerDefinitionsImpl(builderFactory:signals:), 0, 0);
}

uint64_t static SiriGeoSuggestionsPluginOwnerDefinitionFactoryBase.createOwnerDefinitionsImpl(builderFactory:signals:)()
{
  if (one-time initialization token for kOwner != -1) {
    swift_once();
  }
  uint64_t v1 = (int *)v0[17];
  uint64_t v2 = static SiriGeoSuggestionsConstants.kOwner;
  v0[5] = type metadata accessor for DomainOwner();
  v0[6] = lazy protocol witness table accessor for type DomainOwner and conformance DomainOwner(&lazy protocol witness table cache variable for type DomainOwner and conformance DomainOwner, (void (*)(uint64_t))&type metadata accessor for DomainOwner);
  v0[2] = v2;
  unint64_t v5 = (uint64_t (*)(void *))((char *)v1 + *v1);
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[20] = v3;
  *uint64_t v3 = v0;
  v3[1] = static SiriGeoSuggestionsPluginOwnerDefinitionFactoryBase.createOwnerDefinitionsImpl(builderFactory:signals:);
  return v5(v0 + 2);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  uint64_t v12;
  long long *v13;
  void *v14;
  uint64_t v15;

  char v13 = (long long *)(v0 + 56);
  unint64_t v12 = *(void *)(v0 + 152);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<SiriGeoSuggestion>);
  uint64_t v1 = *(void *)(type metadata accessor for SiriGeoSuggestion() - 8);
  uint64_t v2 = *(void *)(v1 + 72);
  uint64_t v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_11E30;
  unint64_t v5 = v4 + v3;
  static SiriGeoSuggestion.ShareETA.getter((void *)(v4 + v3));
  static SiriGeoSuggestion.PlayMusic.getter((void *)(v5 + v2));
  uint64_t v6 = (void *)(v5 + 2 * v2);
  static SiriGeoSuggestion.PlayNews.getter(v6);
  swift_bridgeObjectRetain();
  *(void *)(swift_task_alloc() + 16) = v5;
  dispatch thunk of SuggestionOwnerDefinitionBuilder.add(suggestionId:catId:builder:)();
  swift_release();
  swift_task_dealloc();
  *(void *)(swift_task_alloc() + 16) = v5 + v2;
  dispatch thunk of SuggestionOwnerDefinitionBuilder.add(suggestionId:catId:builder:)();
  swift_release();
  swift_task_dealloc();
  *(void *)(swift_task_alloc() + 16) = v6;
  dispatch thunk of SuggestionOwnerDefinitionBuilder.add(suggestionId:catId:builder:)();
  swift_release();
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  outlined init with copy of SuggestionsSignals(v12, (uint64_t)v13);
  char v7 = type metadata accessor for SiriGeoSuggestionsGenerator();
  uint64_t v8 = swift_allocObject();
  outlined init with take of SuggestionsSignals(v13, v8 + 16);
  v14[15] = v7;
  v14[16] = lazy protocol witness table accessor for type DomainOwner and conformance DomainOwner(&lazy protocol witness table cache variable for type SiriGeoSuggestionsGenerator and conformance SiriGeoSuggestionsGenerator, (void (*)(uint64_t))type metadata accessor for SiriGeoSuggestionsGenerator);
  v14[12] = v8;
  swift_retain();
  dispatch thunk of SuggestionOwnerDefinitionBuilder.withConversationalGenerator(_:)();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v14 + 12));
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<OwnerDefinition>);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_11FE0;
  dispatch thunk of SuggestionOwnerDefinitionBuilder.build()();
  swift_release();
  swift_release();
  uint64_t v10 = (uint64_t (*)(uint64_t))v14[1];
  return v10(v9);
}

uint64_t static SiriGeoSuggestionsPluginOwnerDefinitionFactoryBase.createOwnerDefinitionsImpl(builderFactory:signals:)(uint64_t a1)
{
  uint64_t v2 = *(void *)v1 + 16;
  *(void *)(*(void *)v1 + 168) = a1;
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1Tm(v2);
  return _swift_task_switch(static SiriGeoSuggestionsPluginOwnerDefinitionFactoryBase.createOwnerDefinitionsImpl(builderFactory:signals:), 0, 0);
}

uint64_t closure #1 in closure #1 in static SiriGeoSuggestionsPluginOwnerDefinitionFactoryBase.createOwnerDefinitionsImpl(builderFactory:signals:)(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for IntentType?);
  __chkstk_darwin();
  unint64_t v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for IntentType();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  uint64_t v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)(a1 + 40);
  long long v24 = *(_OWORD *)(a1 + 24);
  __swift_project_boxed_opaque_existential_1((void *)a1, v24);
  long long v28 = v24;
  uint64_t v29 = v10;
  __swift_allocate_boxed_opaque_existential_2(&v26);
  dispatch thunk of SuggestionDetailsBuilder.enabledLocales(_:)();
  uint64_t v11 = v29;
  long long v24 = v28;
  __swift_project_boxed_opaque_existential_1(&v26, v28);
  long long v34 = v24;
  uint64_t v35 = v11;
  __swift_allocate_boxed_opaque_existential_2(v33);
  dispatch thunk of SuggestionDetailsBuilder.enabledDevices(_:)();
  uint64_t v12 = v35;
  long long v24 = v34;
  __swift_project_boxed_opaque_existential_1(v33, v34);
  long long v31 = v24;
  uint64_t v32 = v12;
  __swift_allocate_boxed_opaque_existential_2(v30);
  dispatch thunk of SuggestionDetailsBuilder.templateRoot(_:)();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v30);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v33);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v26);
  uint64_t v13 = type metadata accessor for SiriGeoSuggestion();
  outlined init with copy of IntentType?(a2 + *(int *)(v13 + 44), (uint64_t)v5, &demangling cache variable for type metadata for IntentType?);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    outlined destroy of IntentType?((uint64_t)v5, &demangling cache variable for type metadata for IntentType?);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v5, v6);
    uint64_t v14 = *(void *)(a1 + 40);
    long long v24 = *(_OWORD *)(a1 + 24);
    __swift_project_boxed_opaque_existential_1((void *)a1, v24);
    long long v28 = v24;
    uint64_t v29 = v14;
    __swift_allocate_boxed_opaque_existential_2(&v26);
    dispatch thunk of SuggestionDetailsBuilder.intentIdentifier(_:)();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v26);
  }
  if (*(void *)(a2 + *(int *)(v13 + 48) + 8))
  {
    uint64_t v15 = *(void *)(a1 + 40);
    long long v24 = *(_OWORD *)(a1 + 24);
    __swift_project_boxed_opaque_existential_1((void *)a1, v24);
    long long v28 = v24;
    uint64_t v29 = v15;
    __swift_allocate_boxed_opaque_existential_2(&v26);
    dispatch thunk of SuggestionDetailsBuilder.loggingIdentifier(_:)();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v26);
  }
  uint64_t v16 = a1;
  uint64_t result = *(void *)(a2 + 72);
  uint64_t v18 = *(void *)(result + 16);
  if (v18)
  {
    unint64_t v23 = &v27;
    uint64_t v19 = result + 32;
    v21[1] = result;
    swift_bridgeObjectRetain();
    uint64_t v22 = v16;
    do
    {
      outlined init with copy of SiriGeoSuggestion.Parameter(v19, (uint64_t)&v26);
      outlined init with copy of Decodable & Encodable & Sendable(v22, (uint64_t)v33);
      uint64_t v20 = v35;
      long long v24 = v34;
      __swift_project_boxed_opaque_existential_1(v33, v34);
      outlined init with copy of IntentType?((uint64_t)v23, (uint64_t)v25, &demangling cache variable for type metadata for Resolver?);
      swift_bridgeObjectRetain();
      swift_retain();
      outlined destroy of SiriGeoSuggestion.Parameter((uint64_t)&v26);
      long long v31 = v24;
      uint64_t v32 = v20;
      __swift_allocate_boxed_opaque_existential_2(v30);
      SuggestionDetailsBuilder.parameter(parameterName:resolver:resolveParam:)();
      swift_bridgeObjectRelease();
      swift_release();
      outlined destroy of IntentType?((uint64_t)v25, &demangling cache variable for type metadata for Resolver?);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v30);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v33);
      v19 += 64;
      --v18;
    }
    while (v18);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t partial apply for closure #1 in closure #1 in static SiriGeoSuggestionsPluginOwnerDefinitionFactoryBase.createOwnerDefinitionsImpl(builderFactory:signals:)(uint64_t a1)
{
  return closure #1 in closure #1 in static SiriGeoSuggestionsPluginOwnerDefinitionFactoryBase.createOwnerDefinitionsImpl(builderFactory:signals:)(a1, *(void *)(v1 + 16));
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

uint64_t outlined init with copy of SiriGeoSuggestion.Parameter(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t outlined destroy of SiriGeoSuggestion.Parameter(uint64_t a1)
{
  return a1;
}

uint64_t outlined destroy of IntentType?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t Dictionary<>.subscript.getter(char a1)
{
  return swift_bridgeObjectRelease();
}

unint64_t SiriGeoSuggestion.ExecutionParameter.rawValue.getter(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000015;
      break;
    case 3:
    case 4:
      unint64_t result = 0x74616E6974736564;
      break;
    case 5:
      unint64_t result = 0xD000000000000012;
      break;
    case 6:
    case 7:
      unint64_t result = 0x4C746E6572727563;
      break;
    case 8:
      unint64_t result = 0xD000000000000019;
      break;
    case 9:
      unint64_t result = 0xD000000000000016;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance SiriGeoSuggestion.ExecutionParameter(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = SiriGeoSuggestion.ExecutionParameter.rawValue.getter(*a1);
  uint64_t v5 = v4;
  if (v3 == SiriGeoSuggestion.ExecutionParameter.rawValue.getter(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance SiriGeoSuggestion.ExecutionParameter()
{
  char v1 = *v0;
  Hasher.init(_seed:)();
  SiriGeoSuggestion.ExecutionParameter.rawValue.getter(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance SiriGeoSuggestion.ExecutionParameter()
{
  SiriGeoSuggestion.ExecutionParameter.rawValue.getter(*v0);
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance SiriGeoSuggestion.ExecutionParameter()
{
  char v1 = *v0;
  Hasher.init(_seed:)();
  SiriGeoSuggestion.ExecutionParameter.rawValue.getter(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance SiriGeoSuggestion.ExecutionParameter@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = specialized SiriGeoSuggestion.ExecutionParameter.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

unint64_t protocol witness for RawRepresentable.rawValue.getter in conformance SiriGeoSuggestion.ExecutionParameter@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = SiriGeoSuggestion.ExecutionParameter.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t specialized SiriGeoSuggestion.ExecutionParameter.init(rawValue:)(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of SiriGeoSuggestion.ExecutionParameter.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 >= 0xA) {
    return 10;
  }
  else {
    return v3;
  }
}

unint64_t lazy protocol witness table accessor for type SiriGeoSuggestion.ExecutionParameter and conformance SiriGeoSuggestion.ExecutionParameter()
{
  unint64_t result = lazy protocol witness table cache variable for type SiriGeoSuggestion.ExecutionParameter and conformance SiriGeoSuggestion.ExecutionParameter;
  if (!lazy protocol witness table cache variable for type SiriGeoSuggestion.ExecutionParameter and conformance SiriGeoSuggestion.ExecutionParameter)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SiriGeoSuggestion.ExecutionParameter and conformance SiriGeoSuggestion.ExecutionParameter);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SiriGeoSuggestion.ExecutionParameter(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SiriGeoSuggestion.ExecutionParameter(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 9;
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
        JUMPOUT(0xCCC8);
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
          *unint64_t result = a2 + 9;
        break;
    }
  }
  return result;
}

uint64_t getEnumTag for SiriGeoSuggestion.ExecutionParameter(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *destructiveInjectEnumTag for SiriGeoSuggestion.ExecutionParameter(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SiriGeoSuggestion.ExecutionParameter()
{
  return &type metadata for SiriGeoSuggestion.ExecutionParameter;
}

uint64_t static SiriGeoSuggestionsPluginOwnerDefinitionFactory.createOwnerDefinitions(builderFactory:)(uint64_t a1, uint64_t a2)
{
  v3[8] = a2;
  v3[9] = v2;
  v3[7] = a1;
  return _swift_task_switch(static SiriGeoSuggestionsPluginOwnerDefinitionFactory.createOwnerDefinitions(builderFactory:), 0, 0);
}

uint64_t static SiriGeoSuggestionsPluginOwnerDefinitionFactory.createOwnerDefinitions(builderFactory:)()
{
  v0[5] = &type metadata for StandardSuggestionSignals;
  v0[6] = &protocol witness table for StandardSuggestionSignals;
  char v1 = (void *)swift_task_alloc();
  v0[10] = v1;
  void *v1 = v0;
  v1[1] = static SiriGeoSuggestionsPluginOwnerDefinitionFactory.createOwnerDefinitions(builderFactory:);
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[7];
  return static SiriGeoSuggestionsPluginOwnerDefinitionFactoryBase.createOwnerDefinitionsImpl(builderFactory:signals:)(v3, v2, (uint64_t)(v0 + 2));
}

uint64_t static SiriGeoSuggestionsPluginOwnerDefinitionFactory.createOwnerDefinitions(builderFactory:)(uint64_t a1)
{
  uint64_t v3 = *v1 + 16;
  uint64_t v6 = *v1;
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1Tm(v3);
  unsigned int v4 = *(uint64_t (**)(uint64_t))(v6 + 8);
  return v4(a1);
}

uint64_t SiriGeoSuggestionsPluginOwnerDefinitionFactory.deinit()
{
  return v0;
}

uint64_t SiriGeoSuggestionsPluginOwnerDefinitionFactory.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t SiriGeoSuggestionsPluginOwnerDefinitionFactory.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t protocol witness for static OwnerDefinitionFactory.createOwnerDefinitions() in conformance SiriGeoSuggestionsPluginOwnerDefinitionFactory()
{
  return static OwnerDefinitionFactory.createOwnerDefinitions()();
}

uint64_t type metadata accessor for SiriGeoSuggestionsPluginOwnerDefinitionFactory()
{
  return self;
}

ValueMetadata *type metadata accessor for StandardSuggestionSignals()
{
  return &type metadata for StandardSuggestionSignals;
}

uint64_t *SiriGeoSuggestionsConstants.t41Locales.unsafeMutableAddressor()
{
  if (one-time initialization token for t41Locales != -1) {
    swift_once();
  }
  return &static SiriGeoSuggestionsConstants.t41Locales;
}

uint64_t *SiriGeoSuggestionsConstants.kCarPlayDevice.unsafeMutableAddressor()
{
  if (one-time initialization token for kCarPlayDevice != -1) {
    swift_once();
  }
  return &static SiriGeoSuggestionsConstants.kCarPlayDevice;
}

uint64_t *SiriGeoSuggestionsConstants.kOwner.unsafeMutableAddressor()
{
  if (one-time initialization token for kOwner != -1) {
    swift_once();
  }
  return &static SiriGeoSuggestionsConstants.kOwner;
}

void *SiriGeoSuggestionsConstants.kTemplateRootPath.unsafeMutableAddressor()
{
  return &static SiriGeoSuggestionsConstants.kTemplateRootPath;
}

uint64_t one-time initialization function for t41Locales()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Locale>);
  type metadata accessor for Locale();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_12230;
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
  static SiriGeoSuggestionsConstants.t41Locales = v0;
  return result;
}

uint64_t static SiriGeoSuggestionsConstants.t41Locales.getter()
{
  return static SiriGeoSuggestionsConstants.t41Locales.getter(&one-time initialization token for t41Locales);
}

uint64_t one-time initialization function for kAllDevices()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<DeviceType>);
  uint64_t v0 = type metadata accessor for DeviceType();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = *(void *)(v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_12240;
  unint64_t v5 = v4 + v3;
  uint64_t v6 = *(void (**)(unint64_t, void, uint64_t))(v1 + 104);
  v6(v5, enum case for DeviceType.iPhone(_:), v0);
  v6(v5 + v2, enum case for DeviceType.iPad(_:), v0);
  v6(v5 + 2 * v2, enum case for DeviceType.watch(_:), v0);
  v6(v5 + 3 * v2, enum case for DeviceType.pod(_:), v0);
  v6(v5 + 4 * v2, enum case for DeviceType.mac(_:), v0);
  v6(v5 + 5 * v2, enum case for DeviceType.homepod(_:), v0);
  v6(v5 + 6 * v2, enum case for DeviceType.appleTV(_:), v0);
  uint64_t result = ((uint64_t (*)(unint64_t, void, uint64_t))v6)(v5 + 7 * v2, enum case for DeviceType.carPlay(_:), v0);
  static SiriGeoSuggestionsConstants.kAllDevices = v4;
  return result;
}

uint64_t *SiriGeoSuggestionsConstants.kAllDevices.unsafeMutableAddressor()
{
  if (one-time initialization token for kAllDevices != -1) {
    swift_once();
  }
  return &static SiriGeoSuggestionsConstants.kAllDevices;
}

uint64_t static SiriGeoSuggestionsConstants.kAllDevices.getter()
{
  return static SiriGeoSuggestionsConstants.t41Locales.getter(&one-time initialization token for kAllDevices);
}

uint64_t one-time initialization function for kCarPlayDevice()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<DeviceType>);
  uint64_t v0 = type metadata accessor for DeviceType();
  uint64_t v1 = *(void *)(v0 - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_11FE0;
  uint64_t result = (*(uint64_t (**)(unint64_t, void, uint64_t))(v1 + 104))(v3 + v2, enum case for DeviceType.carPlay(_:), v0);
  static SiriGeoSuggestionsConstants.kCarPlayDevice = v3;
  return result;
}

uint64_t static SiriGeoSuggestionsConstants.kCarPlayDevice.getter()
{
  return static SiriGeoSuggestionsConstants.t41Locales.getter(&one-time initialization token for kCarPlayDevice);
}

uint64_t static SiriGeoSuggestionsConstants.t41Locales.getter(void *a1)
{
  if (*a1 != -1) {
    swift_once();
  }
  return swift_bridgeObjectRetain();
}

uint64_t one-time initialization function for kOwner()
{
  type metadata accessor for DomainOwner();
  swift_allocObject();
  uint64_t result = DomainOwner.init(_:)();
  static SiriGeoSuggestionsConstants.kOwner = result;
  return result;
}

uint64_t static SiriGeoSuggestionsConstants.kOwner.getter()
{
  if (one-time initialization token for kOwner != -1) {
    swift_once();
  }
  return swift_retain();
}

unint64_t static SiriGeoSuggestionsConstants.kTemplateRootPath.getter()
{
  return 0xD000000000000055;
}

ValueMetadata *type metadata accessor for SiriGeoSuggestionsConstants()
{
  return &type metadata for SiriGeoSuggestionsConstants;
}

uint64_t static SiriGeoSuggestion.validatePlayAudio(_:environment:_:signals:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[23] = a4;
  v5[24] = a5;
  v5[21] = a1;
  v5[22] = a2;
  return _swift_task_switch(static SiriGeoSuggestion.validatePlayAudio(_:environment:_:signals:), 0, 0);
}

uint64_t static SiriGeoSuggestion.validatePlayAudio(_:environment:_:signals:)()
{
  if (one-time initialization token for navigateVerb != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)(v0 + 168);
  uint64_t v1 = *(void *)(v0 + 176);
  swift_beginAccess();
  BOOL v3 = static SiriGeoSuggestion.navigateVerb == v2 && qword_19350 == v1;
  if (!v3 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
    goto LABEL_21;
  }
  uint64_t v4 = **(void **)(v0 + 184);
  if (!*(void *)(v4 + 16)) {
    goto LABEL_21;
  }
  unint64_t v5 = specialized __RawDictionaryStorage.find<A>(_:)(0xD000000000000010, 0x8000000000012280);
  if ((v6 & 1) == 0) {
    goto LABEL_21;
  }
  outlined init with copy of Decodable & Encodable & Sendable(*(void *)(v4 + 56) + 48 * v5, v0 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Decodable & Encodable & Sendable);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_21;
  }
  uint64_t v7 = *(uint64_t **)(v0 + 184);
  uint64_t v8 = *(void *)(v0 + 144);
  *(void *)(v0 + 200) = *(void *)(v0 + 136);
  *(void *)(v0 + 208) = v8;
  uint64_t v9 = *v7;
  if (*(void *)(*v7 + 16)
    && (unint64_t v10 = specialized __RawDictionaryStorage.find<A>(_:)(0xD000000000000010, 0x80000000000122C0), (v11 & 1) != 0)
    && (outlined init with copy of Decodable & Encodable & Sendable(*(void *)(v9 + 56) + 48 * v10, v0 + 64),
        (swift_dynamicCast() & 1) != 0))
  {
    uint64_t v13 = *(void *)(v0 + 152);
    uint64_t v12 = *(void *)(v0 + 160);
    uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    if (v12)
    {
      if (v13 == v14 && v12 == v15)
      {
        swift_bridgeObjectRelease_n();
LABEL_25:
        uint64_t v19 = *(void **)(v0 + 192);
        uint64_t v20 = v19[3];
        uint64_t v21 = v19[4];
        __swift_project_boxed_opaque_existential_1(v19, v20);
        unint64_t v23 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v21 + 8) + **(int **)(v21 + 8));
        uint64_t v22 = (void *)swift_task_alloc();
        *(void *)(v0 + 216) = v22;
        *uint64_t v22 = v0;
        v22[1] = static SiriGeoSuggestion.validatePlayAudio(_:environment:_:signals:);
        return v23(v20, v21);
      }
      char v18 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v18) {
        goto LABEL_25;
      }
      goto LABEL_20;
    }
  }
  else
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  swift_bridgeObjectRelease();
LABEL_20:
  swift_bridgeObjectRelease();
LABEL_21:
  uint64_t v16 = *(uint64_t (**)(void))(v0 + 8);
  return v16(0);
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t (*v6)(void);
  uint64_t (*v7)(uint64_t, uint64_t);
  uint64_t v8;

  if (*(unsigned char *)(v0 + 248) == 1)
  {
    uint64_t v1 = *(void **)(v0 + 192);
    uint64_t v2 = v1[3];
    BOOL v3 = v1[4];
    __swift_project_boxed_opaque_existential_1(v1, v2);
    uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v3 + 32) + **(int **)(v3 + 32));
    uint64_t v4 = (void *)swift_task_alloc();
    *(void *)(v0 + 224) = v4;
    *uint64_t v4 = v0;
    v4[1] = static SiriGeoSuggestion.validatePlayAudio(_:environment:_:signals:);
    return v7(v2, v3);
  }
  else
  {
    swift_bridgeObjectRelease();
    char v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6(0);
  }
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t (*v6)(void);
  uint64_t (*v7)(uint64_t, uint64_t);
  uint64_t v8;

  if (*(unsigned char *)(v0 + 249) == 1)
  {
    uint64_t v1 = *(void **)(v0 + 192);
    uint64_t v2 = v1[3];
    BOOL v3 = v1[4];
    __swift_project_boxed_opaque_existential_1(v1, v2);
    uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v3 + 16) + **(int **)(v3 + 16));
    uint64_t v4 = (void *)swift_task_alloc();
    *(void *)(v0 + 232) = v4;
    *uint64_t v4 = v0;
    v4[1] = static SiriGeoSuggestion.validatePlayAudio(_:environment:_:signals:);
    return v7(v2, v3);
  }
  else
  {
    swift_bridgeObjectRelease();
    char v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6(0);
  }
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t (*v6)(void);
  uint64_t (*v7)(uint64_t, uint64_t);
  uint64_t v8;

  if (*(unsigned char *)(v0 + 250) == 1)
  {
    uint64_t v1 = *(void **)(v0 + 192);
    uint64_t v2 = v1[3];
    BOOL v3 = v1[4];
    __swift_project_boxed_opaque_existential_1(v1, v2);
    uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(v3 + 48) + **(int **)(v3 + 48));
    uint64_t v4 = (void *)swift_task_alloc();
    *(void *)(v0 + 240) = v4;
    *uint64_t v4 = v0;
    v4[1] = static SiriGeoSuggestion.validatePlayAudio(_:environment:_:signals:);
    return v7(v2, v3);
  }
  else
  {
    swift_bridgeObjectRelease();
    char v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6(0);
  }
}

{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t (*v7)(void);
  uint64_t v9;

  uint64_t v1 = *(void *)(v0 + 208);
  if (*(unsigned char *)(v0 + 251) == 1)
  {
    uint64_t v2 = *(void **)(v0 + 192);
    BOOL v3 = *(void *)(v0 + 200);
    uint64_t v4 = v2[3];
    unint64_t v5 = v2[4];
    __swift_project_boxed_opaque_existential_1(v2, v4);
    char v6 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 72))(v3, v1, v4, v5);
  }
  else
  {
    char v6 = 0;
  }
  swift_bridgeObjectRelease();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7(v6 & 1);
}

uint64_t static SiriGeoSuggestion.validatePlayAudio(_:environment:_:signals:)(char a1)
{
  *(unsigned char *)(*(void *)v1 + 248) = a1;
  swift_task_dealloc();
  return _swift_task_switch(static SiriGeoSuggestion.validatePlayAudio(_:environment:_:signals:), 0, 0);
}

{
  uint64_t v1;
  uint64_t v3;

  *(unsigned char *)(*(void *)v1 + 249) = a1;
  swift_task_dealloc();
  return _swift_task_switch(static SiriGeoSuggestion.validatePlayAudio(_:environment:_:signals:), 0, 0);
}

{
  uint64_t v1;
  uint64_t v3;

  *(unsigned char *)(*(void *)v1 + 250) = a1;
  swift_task_dealloc();
  return _swift_task_switch(static SiriGeoSuggestion.validatePlayAudio(_:environment:_:signals:), 0, 0);
}

{
  uint64_t v1;
  uint64_t v3;

  *(unsigned char *)(*(void *)v1 + 251) = a1;
  swift_task_dealloc();
  return _swift_task_switch(static SiriGeoSuggestion.validatePlayAudio(_:environment:_:signals:), 0, 0);
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
    unint64_t v10 = (void *)(v9 + 16 * v6);
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

uint64_t SuggestionsLog.unsafeMutableAddressor()
{
  if (one-time initialization token for SuggestionsLog != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  return __swift_project_value_buffer(v0, (uint64_t)SuggestionsLog);
}

uint64_t one-time initialization function for SuggestionsLog()
{
  uint64_t v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, SuggestionsLog);
  __swift_project_value_buffer(v0, (uint64_t)SuggestionsLog);
  return Logger.init(subsystem:category:)();
}

uint64_t protocol witness for SuggestionsSignals.isNotRegularSiriMusicUser.getter in conformance StandardSuggestionSignals()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = protocol witness for SuggestionsSignals.isNotRegularSiriMusicUser.getter in conformance StandardSuggestionSignals;
  return withCheckedContinuation<A>(isolation:function:_:)(v0 + 24, 0, 0, 0xD000000000000019, 0x8000000000012320, closure #1 in StandardSuggestionSignals.isNotRegularSiriMusicUser.getter, 0, &type metadata for Bool);
}

{
  uint64_t v1;

  swift_task_dealloc();
  return _swift_task_switch(protocol witness for SuggestionsSignals.isNotRegularSiriMusicUser.getter in conformance StandardSuggestionSignals, 0, 0);
}

uint64_t StandardSuggestionSignals.isNotRegularSiriMusicUser.getter()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = StandardSuggestionSignals.isNotRegularSiriMusicUser.getter;
  return withCheckedContinuation<A>(isolation:function:_:)(v0 + 24, 0, 0, 0xD000000000000019, 0x8000000000012320, closure #1 in StandardSuggestionSignals.isNotRegularSiriMusicUser.getter, 0, &type metadata for Bool);
}

{
  uint64_t v1;

  swift_task_dealloc();
  return _swift_task_switch(StandardSuggestionSignals.isNotRegularSiriMusicUser.getter, 0, 0);
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))(*(unsigned __int8 *)(v0 + 24));
}

uint64_t StandardSuggestionSignals.isRegularMusicListener.getter()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = protocol witness for SuggestionsSignals.isNotRegularSiriMusicUser.getter in conformance StandardSuggestionSignals;
  return withCheckedContinuation<A>(isolation:function:_:)(v0 + 24, 0, 0, 0xD000000000000016, 0x8000000000012600, closure #1 in StandardSuggestionSignals.isRegularMusicListener.getter, 0, &type metadata for Bool);
}

uint64_t protocol witness for SuggestionsSignals.isAppleMusicSubscriber.getter in conformance StandardSuggestionSignals()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&async function pointer to specialized StandardSuggestionSignals.isAppleMusicSubscriber.getter
                             + async function pointer to specialized StandardSuggestionSignals.isAppleMusicSubscriber.getter);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = protocol witness for SuggestionsSignals.isNotSharingETA.getter in conformance StandardSuggestionSignals;
  return v3();
}

uint64_t StandardSuggestionSignals.isAppleMusicSubscriber.getter()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&async function pointer to specialized StandardSuggestionSignals.isAppleMusicSubscriber.getter
                             + async function pointer to specialized StandardSuggestionSignals.isAppleMusicSubscriber.getter);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = StandardSuggestionSignals.isNotSharingETA.getter;
  return v3();
}

uint64_t StandardSuggestionSignals.isNotListeningToMusic.getter()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = protocol witness for SuggestionsSignals.isNotRegularSiriMusicUser.getter in conformance StandardSuggestionSignals;
  return withCheckedContinuation<A>(isolation:function:_:)(v0 + 24, 0, 0, 0xD000000000000015, 0x8000000000012620, closure #1 in StandardSuggestionSignals.isNotListeningToMusic.getter, 0, &type metadata for Bool);
}

void closure #1 in StandardSuggestionSignals.isNotRegularSiriMusicUser.getter(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<Bool, Never>);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin();
  uint64_t v5 = type metadata accessor for Date();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)&aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = [self intent];
  static Date.distantPast.getter();
  Date.timeIntervalSinceReferenceDate.getter();
  double v11 = v10;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  id v12 = [v9 publisherFromStartTime:v11];

  uint64_t v13 = swift_allocObject();
  *(unsigned char *)(v13 + 16) = 0;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  unint64_t v14 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v15 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v15 + v14, (char *)&aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  *(void *)(v15 + ((v4 + v14 + 7) & 0xFFFFFFFFFFFFFFF8)) = v13;
  unint64_t v23 = partial apply for closure #1 in closure #1 in StandardSuggestionSignals.isNotRegularSiriMusicUser.getter;
  uint64_t v24 = v15;
  aBlock = _NSConcreteStackBlock;
  uint64_t v20 = 1107296256;
  uint64_t v21 = thunk for @escaping @callee_guaranteed (@guaranteed MSPSharedTripService) -> ();
  uint64_t v22 = &block_descriptor_28;
  uint64_t v16 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  unint64_t v23 = partial apply for closure #2 in closure #1 in StandardSuggestionSignals.isNotRegularSiriMusicUser.getter;
  uint64_t v24 = v13;
  aBlock = _NSConcreteStackBlock;
  uint64_t v20 = 1107296256;
  uint64_t v21 = (void (*)(uint64_t, void *))thunk for @escaping @callee_guaranteed (@guaranteed BMStoreEvent<BMIntentEvent>) -> (@unowned Bool);
  uint64_t v22 = &block_descriptor_31;
  uint64_t v17 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  id v18 = [v12 sinkWithCompletion:v16 shouldContinue:v17];
  _Block_release(v17);
  _Block_release(v16);

  swift_release();
}

uint64_t closure #1 in closure #1 in StandardSuggestionSignals.isNotRegularSiriMusicUser.getter()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t closure #2 in closure #1 in StandardSuggestionSignals.isNotRegularSiriMusicUser.getter(void *a1, uint64_t a2)
{
  id v3 = [a1 eventBody];
  if (v3)
  {
    uint64_t v4 = v3;
    if (([v3 donatedBySiri] & 1) != 0
      && (id v5 = [v4 intentClass]) != 0)
    {
      uint64_t v6 = v5;
      uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v9 = v8;

      if (v7 == 0xD000000000000011 && v9 == 0x8000000000012970)
      {
        swift_bridgeObjectRelease();

LABEL_11:
        swift_beginAccess();
        uint64_t result = 0;
        *(unsigned char *)(a2 + 16) = 1;
        return result;
      }
      char v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();

      if (v11) {
        goto LABEL_11;
      }
    }
    else
    {
    }
  }
  return 1;
}

uint64_t @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned ICMusicSubscriptionStatus?, @unowned NSError?) -> () with result type ICMusicSubscriptionStatus(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    if (a2)
    {
      **(void **)(*(void *)(v3 + 64) + 40) = a2;
      id v8 = a2;
      a1 = v3;
    }
    else
    {
      __break(1u);
    }
    return _swift_continuation_throwingResume(a1);
  }
}

void closure #1 in StandardSuggestionSignals.isRegularMusicListener.getter(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<Bool, Never>);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin();
  uint64_t v5 = type metadata accessor for Date();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  id v8 = (char *)&aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = [self appLaunch];
  static Date.distantPast.getter();
  Date.timeIntervalSinceReferenceDate.getter();
  double v11 = v10;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  id v12 = [v9 publisherFromStartTime:v11];

  uint64_t v13 = swift_allocObject();
  *(unsigned char *)(v13 + 16) = 0;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  unint64_t v14 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v15 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v15 + v14, (char *)&aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  *(void *)(v15 + ((v4 + v14 + 7) & 0xFFFFFFFFFFFFFFF8)) = v13;
  unint64_t v23 = partial apply for closure #1 in closure #1 in StandardSuggestionSignals.isRegularMusicListener.getter;
  uint64_t v24 = v15;
  aBlock = _NSConcreteStackBlock;
  uint64_t v20 = 1107296256;
  uint64_t v21 = thunk for @escaping @callee_guaranteed (@guaranteed MSPSharedTripService) -> ();
  uint64_t v22 = &block_descriptor_18;
  uint64_t v16 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  unint64_t v23 = partial apply for closure #2 in closure #1 in StandardSuggestionSignals.isRegularMusicListener.getter;
  uint64_t v24 = v13;
  aBlock = _NSConcreteStackBlock;
  uint64_t v20 = 1107296256;
  uint64_t v21 = (void (*)(uint64_t, void *))thunk for @escaping @callee_guaranteed (@guaranteed BMStoreEvent<BMIntentEvent>) -> (@unowned Bool);
  uint64_t v22 = &block_descriptor_21;
  uint64_t v17 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  id v18 = [v12 sinkWithCompletion:v16 shouldContinue:v17];
  _Block_release(v17);
  _Block_release(v16);

  swift_release();
}

uint64_t closure #1 in closure #1 in StandardSuggestionSignals.isRegularMusicListener.getter()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t closure #2 in closure #1 in StandardSuggestionSignals.isRegularMusicListener.getter(void *a1, uint64_t a2)
{
  id v3 = [a1 eventBody];
  if (v3)
  {
    uint64_t v4 = v3;
    if ([v3 launchType] != (char *)&dword_0 + 1)
    {

      return 1;
    }
    id v5 = [v4 bundleID];
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;

    if (v6 == 0x6C7070612E6D6F63 && v8 == 0xEF636973754D2E65) {
      goto LABEL_16;
    }
    char v10 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v10)
    {
LABEL_8:

LABEL_17:
      swift_beginAccess();
      uint64_t result = 0;
      *(unsigned char *)(a2 + 16) = 1;
      return result;
    }
    id v12 = [v4 bundleID];
    uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v15 = v14;

    if (v13 == 0xD000000000000012 && v15 == 0x80000000000128E0) {
      goto LABEL_16;
    }
    char v16 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v16) {
      goto LABEL_8;
    }
    id v17 = [v4 bundleID];
    uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v20 = v19;

    if (v18 == 0x646E61702E6D6F63 && v20 == 0xEB0000000061726FLL) {
      goto LABEL_16;
    }
    char v21 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v21) {
      goto LABEL_8;
    }
    id v22 = [v4 bundleID];
    uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v25 = v24;

    if (v23 == 0xD000000000000020 && v25 == 0x8000000000012900) {
      goto LABEL_16;
    }
    char v26 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v26) {
      goto LABEL_8;
    }
    id v27 = [v4 bundleID];
    uint64_t v28 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v30 = v29;

    if (v28 == 0xD000000000000010 && v30 == 0x8000000000012930)
    {
LABEL_16:

      swift_bridgeObjectRelease();
      goto LABEL_17;
    }
    char v31 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v31) {
      goto LABEL_8;
    }
    id v32 = [v4 bundleID];
    uint64_t v33 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v35 = v34;

    if (v33 == 0xD00000000000001BLL && v35 == 0x8000000000012950)
    {
      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
    char v36 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();

    if (v36) {
      goto LABEL_17;
    }
  }
  return 1;
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed BMStoreEvent<BMIntentEvent>) -> (@unowned Bool)(uint64_t a1, void *a2)
{
  id v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  LOBYTE(v3) = v3();
  swift_release();

  return v3 & 1;
}

void closure #1 in StandardSuggestionSignals.isNotListeningToMusic.getter(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<Bool, Never>);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin();
  id v5 = [self defaultObserver];
  if (v5)
  {
    uint64_t v6 = v5;
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
    unint64_t v7 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
    uint64_t v8 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v8 + v7, (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
    aBlock[4] = partial apply for closure #1 in closure #1 in StandardSuggestionSignals.isNotListeningToMusic.getter;
    aBlock[5] = v8;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = thunk for @escaping @callee_guaranteed (@unowned AFMediaPlaybackState) -> ();
    aBlock[3] = &block_descriptor_0;
    id v9 = _Block_copy(aBlock);
    swift_release();
    [v6 getPlaybackStateWithCompletion:v9];
    _Block_release(v9);
  }
  else
  {
    __break(1u);
  }
}

uint64_t thunk for @escaping @callee_guaranteed (@unowned AFMediaPlaybackState) -> ()(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t closure #1 in osLogInternal(_:log:type:)(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
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
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t specialized StandardSuggestionSignals.isNotUsingVoiceGuidance.getter()
{
  id v0 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 initWithSuiteName:v1];

  if (!v2) {
    return 2;
  }
  id v3 = v2;
  NSString v4 = String._bridgeToObjectiveC()();
  size_t v5 = (char *)[v3 integerForKey:v4];

  return v5 != (unsigned char *)&dword_0 + 2;
}

uint64_t specialized StandardSuggestionSignals.isAppleMusicSubscriber.getter()
{
  return _swift_task_switch(specialized StandardSuggestionSignals.isAppleMusicSubscriber.getter, 0, 0);
}

{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v4;

  NSString v1 = [self sharedStatusController];
  v0[20] = v1;
  v0[2] = v0;
  v0[7] = v0 + 18;
  v0[3] = specialized StandardSuggestionSignals.isAppleMusicSubscriber.getter;
  id v2 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned ICMusicSubscriptionStatus?, @unowned NSError?) -> () with result type ICMusicSubscriptionStatus;
  v0[13] = &block_descriptor_9;
  v0[14] = v2;
  [v1 getSubscriptionStatusWithCompletionHandler:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  NSString v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 168) = v1;
  if (v1) {
    id v2 = specialized StandardSuggestionSignals.isAppleMusicSubscriber.getter;
  }
  else {
    id v2 = specialized StandardSuggestionSignals.isAppleMusicSubscriber.getter;
  }
  return _swift_task_switch(v2, 0, 0);
}

{
  void *v0;
  void *v1;
  void *v2;
  char *v3;
  uint64_t (*v4)(BOOL);
  uint64_t v6;

  NSString v1 = (void *)v0[20];
  id v2 = (void *)v0[18];
  id v3 = (char *)[v2 statusType];

  NSString v4 = (uint64_t (*)(BOOL))v0[1];
  return v4(v3 == (unsigned char *)&dword_0 + 1);
}

{
  void *v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t (*v8)(void);
  uint64_t v10;
  void *v11;
  uint64_t v12;

  size_t v11 = v0;
  NSString v1 = (void *)v0[20];
  swift_willThrow();

  if (one-time initialization token for SuggestionsLog != -1) {
    swift_once();
  }
  id v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)SuggestionsLog);
  swift_errorRetain();
  swift_errorRetain();
  id v3 = Logger.logObject.getter();
  NSString v4 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v3, v4))
  {
    size_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)size_t v5 = 136315138;
    swift_getErrorValue();
    unint64_t v6 = Error.localizedDescription.getter();
    v0[10] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v6, v7, &v10);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v3, v4, "Failed to retreive Apple Music Subscription with error: %s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
  int64_t v8 = (uint64_t (*)(void))v0[1];
  return v8(0);
}

void *specialized Sequence.first(where:)(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_14;
  }
  uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
  for (; v2; uint64_t v2 = _CocoaArrayWrapper.endIndex.getter())
  {
    uint64_t v3 = 4;
    while (1)
    {
      id v4 = (a1 & 0xC000000000000001) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)()
         : *(id *)(a1 + 8 * v3);
      size_t v5 = v4;
      uint64_t v6 = v3 - 3;
      if (__OFADD__(v3 - 4, 1)) {
        break;
      }
      id v7 = [v4 label];
      if (v7)
      {
        int64_t v8 = v7;
        id v9 = [self localizedStringForLabel:v7];

        static String._unconditionallyBridgeFromObjectiveC(_:)();
        lazy protocol witness table accessor for type String and conformance String();
        uint64_t v10 = StringProtocol.caseInsensitiveCompare<A>(_:)();
        swift_bridgeObjectRelease();
        if (!v10)
        {
          swift_bridgeObjectRelease();
          return v5;
        }
      }

      ++v3;
      if (v6 == v2) {
        goto LABEL_15;
      }
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
  }
LABEL_15:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t specialized StandardSuggestionSignals.isMeAddress(label:)()
{
  id v0 = [objc_allocWithZone((Class)CNContactStore) init];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_11E10;
  *(void *)(v1 + 32) = CNContactPostalAddressesKey;
  specialized Array._endMutation()();
  uint64_t v2 = CNContactPostalAddressesKey;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CNKeyDescriptor);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v17 = 0;
  id v4 = [v0 _crossPlatformUnifiedMeContactWithKeysToFetch:isa error:&v17];

  if (v4)
  {
    id v5 = v17;
    id v6 = [v4 postalAddresses];
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for CNLabeledValue);
    unint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    swift_bridgeObjectRetain();
    int64_t v8 = specialized Sequence.first(where:)(v7);
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    if (v8)
    {

      return 1;
    }
  }
  else
  {
    id v10 = v17;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    if (one-time initialization token for SuggestionsLog != -1) {
      swift_once();
    }
    uint64_t v11 = type metadata accessor for Logger();
    __swift_project_value_buffer(v11, (uint64_t)SuggestionsLog);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      id v17 = (id)swift_slowAlloc();
      *(_DWORD *)uint64_t v14 = 136315138;
      swift_getErrorValue();
      uint64_t v15 = Error.localizedDescription.getter();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v16, (uint64_t *)&v17);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl(&dword_0, v12, v13, "error retrieving me contact: %s", v14, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();
    }
  }
  return 0;
}

uint64_t sub_11184()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<Bool, Never>);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return _swift_deallocObject(v0, v5, v6);
}

uint64_t partial apply for closure #1 in closure #1 in StandardSuggestionSignals.isNotListeningToMusic.getter()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_112C8()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t partial apply for closure #1 in closure #1 in StandardSuggestionSignals.isRegularMusicListener.getter(uint64_t a1)
{
  return partial apply for closure #1 in closure #1 in StandardSuggestionSignals.isRegularMusicListener.getter(a1, (uint64_t (*)(uint64_t, unint64_t, uint64_t))closure #1 in closure #1 in StandardSuggestionSignals.isRegularMusicListener.getter);
}

uint64_t partial apply for closure #2 in closure #1 in StandardSuggestionSignals.isRegularMusicListener.getter(void *a1)
{
  return closure #2 in closure #1 in StandardSuggestionSignals.isRegularMusicListener.getter(a1, v1);
}

uint64_t objectdestroy_14Tm()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<Bool, Never>);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  return _swift_deallocObject(v0, v6, v5);
}

uint64_t partial apply for closure #1 in closure #1 in StandardSuggestionSignals.isNotRegularSiriMusicUser.getter(uint64_t a1)
{
  return partial apply for closure #1 in closure #1 in StandardSuggestionSignals.isRegularMusicListener.getter(a1, (uint64_t (*)(uint64_t, unint64_t, uint64_t))closure #1 in closure #1 in StandardSuggestionSignals.isNotRegularSiriMusicUser.getter);
}

uint64_t partial apply for closure #1 in closure #1 in StandardSuggestionSignals.isRegularMusicListener.getter(uint64_t a1, uint64_t (*a2)(uint64_t, unint64_t, uint64_t))
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<Bool, Never>)
                 - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v2 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  return a2(a1, v2 + v5, v6);
}

uint64_t partial apply for closure #2 in closure #1 in StandardSuggestionSignals.isNotRegularSiriMusicUser.getter(void *a1)
{
  return closure #2 in closure #1 in StandardSuggestionSignals.isNotRegularSiriMusicUser.getter(a1, v1);
}

uint64_t static CharacterSet.whitespaces.getter()
{
  return static CharacterSet.whitespaces.getter();
}

uint64_t type metadata accessor for CharacterSet()
{
  return type metadata accessor for CharacterSet();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t Date.timeIntervalSinceReferenceDate.getter()
{
  return Date.timeIntervalSinceReferenceDate.getter();
}

uint64_t static Date.distantPast.getter()
{
  return static Date.distantPast.getter();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t Locale.init(identifier:)()
{
  return Locale.init(identifier:)();
}

uint64_t type metadata accessor for Locale()
{
  return type metadata accessor for Locale();
}

uint64_t type metadata accessor for DeviceType()
{
  return type metadata accessor for DeviceType();
}

uint64_t static IntentType.inIntent(_:)()
{
  return static IntentType.inIntent(_:)();
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

uint64_t dispatch thunk of Interaction.executionParameters.getter()
{
  return dispatch thunk of Interaction.executionParameters.getter();
}

uint64_t dispatch thunk of Interaction.verb.getter()
{
  return dispatch thunk of Interaction.verb.getter();
}

uint64_t type metadata accessor for VersionedInvocation()
{
  return type metadata accessor for VersionedInvocation();
}

uint64_t static VersionedInvocations.HintsDawnC.getter()
{
  return static VersionedInvocations.HintsDawnC.getter();
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

uint64_t SuggestionDetailsBuilder.parameter(parameterName:resolver:resolveParam:)()
{
  return SuggestionDetailsBuilder.parameter(parameterName:resolver:resolveParam:)();
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

uint64_t dispatch thunk of SuggestionOwnerDefinitionBuilder.build()()
{
  return dispatch thunk of SuggestionOwnerDefinitionBuilder.build()();
}

uint64_t type metadata accessor for Objective()
{
  return type metadata accessor for Objective();
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

uint64_t Dictionary.subscript.getter()
{
  return Dictionary.subscript.getter();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t static String._fromSubstring(_:)()
{
  return static String._fromSubstring(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t String.init<A>(_:)()
{
  return String.init<A>(_:)();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t StringProtocol.trimmingCharacters(in:)()
{
  return StringProtocol.trimmingCharacters(in:)();
}

uint64_t StringProtocol.caseInsensitiveCompare<A>(_:)()
{
  return StringProtocol.caseInsensitiveCompare<A>(_:)();
}

uint64_t StringProtocol<>.split(separator:maxSplits:omittingEmptySubsequences:)()
{
  return StringProtocol<>.split(separator:maxSplits:omittingEmptySubsequences:)();
}

uint64_t _HashTable.previousHole(before:)()
{
  return _HashTable.previousHole(before:)();
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

uint64_t static _DictionaryStorage.copy(original:)()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
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

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t GEOConfigGetBOOL()
{
  return _GEOConfigGetBOOL();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
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

uint64_t swift_allocError()
{
  return _swift_allocError();
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

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
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

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
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

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}