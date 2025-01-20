void closure #1 in AssistantDataCache.updateSnapshot(on:onlyIfNeeded:)(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  NSObject *oslog;
  uint64_t v20;
  uint64_t vars8;

  if (one-time initialization token for shared != -1) {
    swift_once();
  }
  (*(void (**)(uint64_t, void))(*(void *)static PerformanceUtil.shared + 184))(a3, 0);
  if (a2)
  {
    v9 = a2;
    if (one-time initialization token for pommes != -1) {
      swift_once();
    }
    v10 = type metadata accessor for Logger();
    __swift_project_value_buffer(v10, (uint64_t)static Logger.pommes);
    v11 = a2;
    v12 = a2;
    oslog = Logger.logObject.getter();
    v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      v15 = swift_slowAlloc();
      v20 = v15;
      *(_DWORD *)v14 = 136315138;
      v16 = a2;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
      v17 = String.init<A>(describing:)();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v17, v18, &v20);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1C8F83000, oslog, v13, "#AssistantData Service helper returned an error: %s", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1CB77E470](v15, -1, -1);
      MEMORY[0x1CB77E470](v14, -1, -1);
    }
    else
    {
    }
  }
  else
  {
    AssistantDataCache.handleSASetAssistantData(_:updateQueue:)(a1, a5);
  }
}

uint64_t AssistantDataCache.handleSASetAssistantData(_:updateQueue:)(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v40 = a2;
  if (a1 && (self, (uint64_t v5 = swift_dynamicCastObjCClass()) != 0))
  {
    uint64_t v6 = v5;
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    *(void *)(v7 + 24) = v3;
    v46 = partial apply for closure #2 in AssistantDataCache.handleSASetAssistantData(_:updateQueue:);
    uint64_t v47 = v7;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v43 = 1107296256;
    v44 = thunk for @escaping @callee_guaranteed @Sendable () -> ();
    v45 = &block_descriptor_28_0;
    v8 = _Block_copy(&aBlock);
    uint64_t v9 = type metadata accessor for DispatchQoS();
    v39 = &v36;
    uint64_t v10 = *(void *)(v9 - 8);
    MEMORY[0x1F4188790](v9);
    v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    v37 = a1;
    swift_retain();
    static DispatchQoS.unspecified.getter();
    uint64_t v13 = type metadata accessor for DispatchWorkItemFlags();
    v38 = &v36;
    uint64_t v14 = *(void *)(v13 - 8);
    MEMORY[0x1F4188790](v13);
    v16 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v41 = MEMORY[0x1E4FBC860];
    lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, MEMORY[0x1F41AAEB0]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
    lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A], (uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
    dispatch thunk of SetAlgebra.init<A>(_:)();
    MEMORY[0x1CB77D180](0, v12, v16, v8);
    _Block_release(v8);

    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  else
  {
    if (one-time initialization token for pommes != -1) {
      swift_once();
    }
    uint64_t v17 = type metadata accessor for Logger();
    __swift_project_value_buffer(v17, (uint64_t)static Logger.pommes);
    id v18 = a1;
    v19 = Logger.logObject.getter();
    os_log_type_t v20 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      uint64_t aBlock = v22;
      *(_DWORD *)v21 = 136315138;
      id v23 = v18;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for SABaseCommand?);
      uint64_t v24 = String.init<A>(describing:)();
      uint64_t v41 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v24, v25, &aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C8F83000, v19, v20, "#AssistantData Service helper response was <%s>, not SASetAssistantData. Creating fallback snapshot.", v21, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1CB77E470](v22, -1, -1);
      MEMORY[0x1CB77E470](v21, -1, -1);
    }
    else
    {
    }
    uint64_t v26 = swift_allocObject();
    swift_weakInit();
    v46 = partial apply for closure #1 in AssistantDataCache.handleSASetAssistantData(_:updateQueue:);
    uint64_t v47 = v26;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v43 = 1107296256;
    v44 = thunk for @escaping @callee_guaranteed @Sendable () -> ();
    v45 = &block_descriptor_22_0;
    v27 = _Block_copy(&aBlock);
    v38 = (uint64_t *)type metadata accessor for DispatchQoS();
    v39 = &v36;
    uint64_t v28 = *(v38 - 1);
    MEMORY[0x1F4188790](v38);
    v30 = (char *)&v36 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
    swift_retain();
    static DispatchQoS.unspecified.getter();
    uint64_t v31 = type metadata accessor for DispatchWorkItemFlags();
    v37 = &v36;
    uint64_t v32 = *(void *)(v31 - 8);
    MEMORY[0x1F4188790](v31);
    v34 = (char *)&v36 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v41 = MEMORY[0x1E4FBC860];
    lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, MEMORY[0x1F41AAEB0]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
    lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A], (uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
    dispatch thunk of SetAlgebra.init<A>(_:)();
    MEMORY[0x1CB77D180](0, v30, v34, v27);
    _Block_release(v27);
    (*(void (**)(char *, uint64_t))(v32 + 8))(v34, v31);
    (*(void (**)(char *, uint64_t *))(v28 + 8))(v30, v38);
    swift_release();
  }
  return swift_release();
}

uint64_t closure #1 in AssistantDataCache.handleSASetAssistantData(_:updateQueue:)()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v1 = result;
    swift_beginAccess();
    uint64_t Strong = swift_weakLoadStrong();
    __int16 v3 = Strong;
    if (Strong)
    {
      AssistantDataCache.fallbackSnapshot()(&v24);
      uint64_t v20 = v24;
      uint64_t v4 = v25;
      uint64_t v19 = *((void *)&v24 + 1);
      uint64_t v5 = v26;
      uint64_t v6 = v27;
      uint64_t v7 = v28;
      uint64_t v8 = v29;
      uint64_t v9 = v30;
      uint64_t v23 = v31;
      uint64_t v21 = v33;
      uint64_t v22 = v32;
      __int16 v10 = v34;
      int v11 = v35;
      swift_release();
      if (v11) {
        __int16 v12 = 256;
      }
      else {
        __int16 v12 = 0;
      }
      __int16 v3 = v12 | v10;
      uint64_t v14 = v19;
      uint64_t v13 = v20;
    }
    else
    {
      uint64_t v13 = 0;
      uint64_t v14 = 0;
      uint64_t v4 = 0;
      uint64_t v5 = 0;
      uint64_t v6 = 0;
      uint64_t v7 = 0;
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      uint64_t v22 = 0;
      uint64_t v23 = 0;
      uint64_t v21 = 0;
    }
    swift_beginAccess();
    uint64_t v15 = *(void *)(v1 + 48);
    uint64_t v16 = *(void *)(v1 + 56);
    uint64_t v17 = *(void *)(v1 + 64);
    uint64_t v18 = *(void *)(v1 + 72);
    *(void *)(v1 + 48) = v13;
    *(void *)(v1 + 56) = v14;
    *(void *)(v1 + 64) = v4;
    *(void *)(v1 + 72) = v5;
    *(void *)(v1 + 80) = v6;
    *(void *)(v1 + 88) = v7;
    *(void *)(v1 + 96) = v8;
    *(void *)(v1 + 104) = v9;
    *(void *)(v1 + 112) = v23;
    *(void *)(v1 + 120) = v22;
    *(void *)(v1 + 128) = v21;
    *(_WORD *)(v1 + 136) = v3;
    outlined consume of AssistantDataSnapshot?(v15, v16, v17, v18);
    return swift_release();
  }
  return result;
}

uint64_t closure #2 in AssistantDataCache.handleSASetAssistantData(_:updateQueue:)(void *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PerformanceUtil.Ticket(0);
  uint64_t v5 = *(void *)(v4 - 8);
  v92 = (int *)v4;
  uint64_t v93 = v5;
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = MEMORY[0x1F4188790](v4);
  uint64_t v8 = (char *)&v83 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  __int16 v10 = (char *)&v83 - v9;
  if (one-time initialization token for pommes != -1) {
    swift_once();
  }
  uint64_t v11 = type metadata accessor for Logger();
  __swift_project_value_buffer(v11, (uint64_t)static Logger.pommes);
  id v12 = a1;
  uint64_t v13 = Logger.logObject.getter();
  int v14 = static os_log_type_t.debug.getter();
  BOOL v15 = os_log_type_enabled(v13, (os_log_type_t)v14);
  uint64_t v16 = &selRef_init;
  id v94 = v12;
  uint64_t v91 = v6;
  if (!v15)
  {

    goto LABEL_30;
  }
  int v87 = v14;
  os_log_t v88 = v13;
  uint64_t v17 = (_DWORD *)swift_slowAlloc();
  uint64_t v86 = swift_slowAlloc();
  v96[0] = v86;
  v90 = v17;
  *uint64_t v17 = 136316419;
  id v18 = objc_msgSend(v12, sel_countryCode);
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v22 = v21;
  }
  else
  {
    uint64_t v20 = 0;
    uint64_t v22 = 0;
  }
  uint64_t v23 = v90;
  v95[0] = v20;
  v95[1] = v22;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
  uint64_t v24 = String.init<A>(describing:)();
  v95[0] = (void *)getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v24, v25, v96);
  UnsafeMutableRawBufferPointer.copyMemory(from:)();

  swift_bridgeObjectRelease();
  *((_WORD *)v23 + 6) = 2085;
  id v26 = objc_msgSend(v12, sel_meCards);
  uint64_t v27 = (void *)MEMORY[0x1E4FBC860];
  if (v26)
  {
    uint64_t v28 = v26;
    type metadata accessor for CNContactStore(0, &lazy cache variable for type metadata for SAPerson);
    unint64_t v29 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (!(v29 >> 62)) {
      goto LABEL_10;
    }
LABEL_21:
    swift_bridgeObjectRetain();
    uint64_t v30 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    uint64_t v89 = a2;
    if (v30) {
      goto LABEL_11;
    }
    goto LABEL_22;
  }
  unint64_t v29 = MEMORY[0x1E4FBC860];
  if (MEMORY[0x1E4FBC860] >> 62) {
    goto LABEL_21;
  }
LABEL_10:
  uint64_t v30 = *(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v89 = a2;
  if (v30)
  {
LABEL_11:
    v95[0] = v27;
    uint64_t result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v30 & ~(v30 >> 63), 0);
    if (v30 < 0) {
      goto LABEL_46;
    }
    v84 = (char *)&v83 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    v85 = v10;
    uint64_t v32 = 0;
    uint64_t v33 = v95[0];
    do
    {
      if ((v29 & 0xC000000000000001) != 0) {
        id v34 = (id)MEMORY[0x1CB77D510](v32, v29);
      }
      else {
        id v34 = *(id *)(v29 + 8 * v32 + 32);
      }
      unsigned __int8 v35 = v34;
      id v36 = objc_msgSend(v34, sel_description);
      uint64_t v37 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v39 = v38;

      v95[0] = v33;
      unint64_t v41 = v33[2];
      unint64_t v40 = v33[3];
      if (v41 >= v40 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v40 > 1, v41 + 1, 1);
        uint64_t v33 = v95[0];
      }
      ++v32;
      v33[2] = v41 + 1;
      v42 = &v33[2 * v41];
      v42[4] = v37;
      v42[5] = v39;
    }
    while (v30 != v32);
    swift_bridgeObjectRelease();
    uint64_t v8 = v84;
    __int16 v10 = v85;
    uint64_t v6 = v91;
    goto LABEL_23;
  }
LABEL_22:
  swift_bridgeObjectRelease();
  uint64_t v33 = (void *)MEMORY[0x1E4FBC860];
LABEL_23:
  uint64_t v43 = v90;
  uint64_t v44 = MEMORY[0x1CB77CDC0](v33, MEMORY[0x1E4FBB1A0]);
  unint64_t v46 = v45;
  swift_bridgeObjectRelease();
  v95[0] = (void *)getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v44, v46, v96);
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  id v47 = v94;

  swift_bridgeObjectRelease();
  *((_WORD *)v43 + 11) = 2080;
  v95[0] = objc_msgSend(v47, sel_mediaContentRatingRestrictions);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for SAMediaContentRatingRestrictions?);
  uint64_t v48 = String.init<A>(describing:)();
  v95[0] = (void *)getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v48, v49, v96);
  UnsafeMutableRawBufferPointer.copyMemory(from:)();

  swift_bridgeObjectRelease();
  *((_WORD *)v43 + 16) = 2080;
  v95[0] = objc_msgSend(v47, sel_uiScale);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for NSNumber?);
  uint64_t v50 = String.init<A>(describing:)();
  v95[0] = (void *)getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v50, v51, v96);
  UnsafeMutableRawBufferPointer.copyMemory(from:)();

  swift_bridgeObjectRelease();
  *((_WORD *)v43 + 21) = 2080;
  unsigned int v52 = objc_msgSend(v47, sel_censorSpeech);
  BOOL v53 = v52 == 0;
  if (v52) {
    uint64_t v54 = 1702195828;
  }
  else {
    uint64_t v54 = 0x65736C6166;
  }
  if (v53) {
    unint64_t v55 = 0xE500000000000000;
  }
  else {
    unint64_t v55 = 0xE400000000000000;
  }
  v95[0] = (void *)getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v54, v55, v96);
  id v12 = v47;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();

  swift_bridgeObjectRelease();
  *((_WORD *)v43 + 26) = 2080;
  v95[0] = objc_msgSend(v47, sel_allowUserGeneratedContent);
  uint64_t v56 = String.init<A>(describing:)();
  v95[0] = (void *)getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v56, v57, v96);
  UnsafeMutableRawBufferPointer.copyMemory(from:)();

  swift_bridgeObjectRelease();
  os_log_t v58 = v88;
  _os_log_impl(&dword_1C8F83000, v88, (os_log_type_t)v87, "#AssistantData Service helper response:\ncountryCode: %s\nmeCards: %{sensitive}s\ncontentRestrictions: %s\nuiScale: %s\ncensorSpeech: %s\nallowUserGeneratedContent: %s", (uint8_t *)v43, 0x3Eu);
  uint64_t v59 = v86;
  swift_arrayDestroy();
  MEMORY[0x1CB77E470](v59, -1, -1);
  MEMORY[0x1CB77E470](v43, -1, -1);

  uint64_t v16 = &selRef_init;
  a2 = v89;
LABEL_30:
  id v60 = [v12 v16[255]];
  if (v60)
  {
    v61 = v60;
    v62 = v8;
    uint64_t v63 = a2;
    type metadata accessor for CNContactStore(0, &lazy cache variable for type metadata for SAPerson);
    unint64_t v64 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (v64 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t result = _CocoaArrayWrapper.endIndex.getter();
      uint64_t v65 = result;
      if (result) {
        goto LABEL_33;
      }
    }
    else
    {
      uint64_t v65 = *(void *)((v64 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t result = swift_bridgeObjectRetain();
      if (v65)
      {
LABEL_33:
        if (v65 >= 1)
        {
          uint64_t v66 = 0;
          do
          {
            if ((v64 & 0xC000000000000001) != 0) {
              id v67 = (id)MEMORY[0x1CB77D510](v66, v64);
            }
            else {
              id v67 = *(id *)(v64 + 8 * v66 + 32);
            }
            v68 = v67;
            ++v66;
            v95[0] = v67;
            closure #2 in closure #2 in AssistantDataCache.handleSASetAssistantData(_:updateQueue:)(v95);
          }
          while (v65 != v66);
          goto LABEL_40;
        }
        __break(1u);
LABEL_46:
        __break(1u);
        return result;
      }
    }
LABEL_40:
    swift_bridgeObjectRelease_n();
    id v12 = v94;
    a2 = v63;
    uint64_t v8 = v62;
    uint64_t v6 = v91;
  }
  Date.init()();
  v69 = v92;
  v70 = &v10[v92[5]];
  *(void *)v70 = "SiriInformationSearch/AssistantDataCache.swift";
  *((void *)v70 + 1) = 46;
  v70[16] = 2;
  *(void *)&v10[v69[6]] = 118;
  v71 = &v10[v69[7]];
  *(void *)v71 = "handleSASetAssistantData(_:updateQueue:)";
  *((void *)v71 + 1) = 40;
  v71[16] = 2;
  uint64_t v72 = specialized static PerformanceUtil.Ticket.trimIfNeeded(_:)(0xD000000000000043);
  v73 = (uint64_t *)&v10[v69[8]];
  uint64_t *v73 = v72;
  v73[1] = v74;
  id v75 = [v12 v16[255]];
  if (v75)
  {
    v76 = v75;
    type metadata accessor for CNContactStore(0, &lazy cache variable for type metadata for SAPerson);
    unint64_t v77 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    unint64_t v77 = 0;
  }
  outlined init with copy of PerformanceUtil.Ticket((uint64_t)v10, (uint64_t)v8);
  unint64_t v78 = (*(unsigned __int8 *)(v93 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v93 + 80);
  unint64_t v79 = (v6 + v78 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v80 = swift_allocObject();
  outlined init with take of PerformanceUtil.Ticket((uint64_t)v8, v80 + v78);
  id v81 = v94;
  *(void *)(v80 + v79) = v94;
  *(void *)(v80 + ((v79 + 15) & 0xFFFFFFFFFFFFFFF8)) = a2;
  id v82 = v81;
  swift_retain();
  AssistantDataCache.fetchReplacementMeCardsIfNeeded(for:completion:)(v77, (void (*)(unint64_t, void))partial apply for closure #3 in closure #2 in AssistantDataCache.handleSASetAssistantData(_:updateQueue:), v80);
  swift_release();
  swift_bridgeObjectRelease();
  return outlined destroy of PerformanceUtil.Ticket((uint64_t)v10);
}

void closure #2 in closure #2 in AssistantDataCache.handleSASetAssistantData(_:updateQueue:)(void **a1)
{
  uint64_t v1 = *a1;
  if (one-time initialization token for pommes != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)static Logger.pommes);
  id v3 = v1;
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v34 = v7;
    *(_DWORD *)uint64_t v6 = 136643331;
    id v8 = objc_msgSend(v3, sel_identifier);
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
    MEMORY[0x1F4188790](v9);
    uint64_t v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v31 = v7;
    if (v8)
    {
      static URL._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v12 = type metadata accessor for URL();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 0, 1, v12);
    }
    else
    {
      uint64_t v13 = type metadata accessor for URL();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 1, 1, v13);
    }
    uint64_t v14 = String.init<A>(describing:)();
    uint64_t v32 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v14, v15, &v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 12) = 2085;
    id v16 = objc_msgSend(v3, sel_internalGUID);
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v20 = v19;
    }
    else
    {
      uint64_t v18 = 0;
      uint64_t v20 = 0;
    }
    uint64_t v32 = v18;
    uint64_t v33 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
    uint64_t v21 = String.init<A>(describing:)();
    uint64_t v32 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v21, v22, &v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 22) = 2085;
    id v23 = objc_msgSend(v3, sel_fullDescription);
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v27 = v26;
    }
    else
    {
      uint64_t v25 = 0;
      uint64_t v27 = 0;
    }
    uint64_t v32 = v25;
    uint64_t v33 = v27;
    uint64_t v28 = String.init<A>(describing:)();
    uint64_t v32 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v28, v29, &v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C8F83000, v4, v5, "#AssistantData Service helper response Me card SAPerson:\nidentifier: %{sensitive}s\ninternal GUID: %{sensitive}s\nfull description: %{sensitive}s", (uint8_t *)v6, 0x20u);
    uint64_t v30 = v31;
    swift_arrayDestroy();
    MEMORY[0x1CB77E470](v30, -1, -1);
    MEMORY[0x1CB77E470](v6, -1, -1);
  }
  else
  {
  }
}

uint64_t closure #3 in closure #2 in AssistantDataCache.handleSASetAssistantData(_:updateQueue:)(uint64_t a1, char a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (one-time initialization token for shared != -1) {
    swift_once();
  }
  (*(void (**)(uint64_t, void))(*(void *)static PerformanceUtil.shared + 184))(a3, 0);
  if (a2)
  {
    *(void *)&long long v48 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    swift_willThrowTypedImpl();
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  type metadata accessor for CNContactStore(0, &lazy cache variable for type metadata for SAPerson);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  objc_msgSend(a4, sel_setMeCards_, isa);

  id v11 = a4;
  specialized AssistantDataSnapshot.init(_:replacementMeCards:)(v11, &v48);
  uint64_t v12 = v48;
  uint64_t v13 = v49;
  uint64_t v15 = v50;
  uint64_t v14 = v51;
  uint64_t v45 = v52;
  uint64_t v46 = *((void *)&v48 + 1);
  uint64_t v16 = v53;
  uint64_t v17 = v55;
  uint64_t v43 = v56;
  uint64_t v44 = v54;
  uint64_t v42 = v57;
  int v40 = v59;
  __int16 v41 = v58;

  if (one-time initialization token for pommes != -1) {
    swift_once();
  }
  uint64_t v18 = type metadata accessor for Logger();
  __swift_project_value_buffer(v18, (uint64_t)static Logger.pommes);
  outlined retain of AssistantDataSnapshot((uint64_t)&v48);
  outlined retain of AssistantDataSnapshot((uint64_t)&v48);
  uint64_t v19 = Logger.logObject.getter();
  os_log_type_t v20 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v39 = v12;
    uint64_t v21 = (uint8_t *)swift_slowAlloc();
    uint64_t v38 = v16;
    uint64_t v22 = swift_slowAlloc();
    v47[0] = v22;
    *(_DWORD *)uint64_t v21 = 136642819;
    outlined retain of AssistantDataSnapshot((uint64_t)&v48);
    uint64_t v23 = AssistantDataSnapshot.description.getter();
    uint64_t v37 = v14;
    uint64_t v24 = v15;
    uint64_t v25 = v13;
    unint64_t v27 = v26;
    outlined release of AssistantDataSnapshot((uint64_t)&v48);
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v23, v27, v47);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    uint64_t v13 = v25;
    uint64_t v15 = v24;
    uint64_t v14 = v37;
    swift_bridgeObjectRelease();
    outlined release of AssistantDataSnapshot((uint64_t)&v48);
    outlined release of AssistantDataSnapshot((uint64_t)&v48);
    _os_log_impl(&dword_1C8F83000, v19, v20, "#AssistantData Service helper updating with assistantData: %{sensitive}s", v21, 0xCu);
    swift_arrayDestroy();
    uint64_t v28 = v22;
    uint64_t v16 = v38;
    MEMORY[0x1CB77E470](v28, -1, -1);
    unint64_t v29 = v21;
    uint64_t v12 = v39;
    MEMORY[0x1CB77E470](v29, -1, -1);
  }
  else
  {
    outlined release of AssistantDataSnapshot((uint64_t)&v48);
    outlined release of AssistantDataSnapshot((uint64_t)&v48);
  }

  if (v40) {
    __int16 v30 = 256;
  }
  else {
    __int16 v30 = 0;
  }
  __int16 v31 = v30 | v41;
  swift_beginAccess();
  uint64_t v32 = *(void *)(a5 + 48);
  uint64_t v33 = *(void *)(a5 + 56);
  uint64_t v34 = *(void *)(a5 + 64);
  uint64_t v35 = *(void *)(a5 + 72);
  *(void *)(a5 + 48) = v12;
  *(void *)(a5 + 56) = v46;
  *(void *)(a5 + 64) = v13;
  *(void *)(a5 + 72) = v15;
  *(void *)(a5 + 80) = v14;
  *(void *)(a5 + 88) = v45;
  *(void *)(a5 + 96) = v16;
  *(void *)(a5 + 104) = v44;
  *(void *)(a5 + 112) = v17;
  *(void *)(a5 + 120) = v43;
  *(void *)(a5 + 128) = v42;
  *(_WORD *)(a5 + 136) = v31;
  return outlined consume of AssistantDataSnapshot?(v32, v33, v34, v35);
}

double AssistantDataCache.fallbackSnapshot()@<D0>(_OWORD *a1@<X8>)
{
  void (*v9)(_OWORD *__return_ptr, unint64_t, unint64_t, void, unsigned char *, const char *, uint64_t, uint64_t, uint64_t, const char *, uint64_t, int, id (*)@<X0>(void *@<X8>), uint64_t, uint64_t);
  uint64_t v10;
  uint64_t (*v11)(char *, uint64_t);
  unsigned char *v12;
  uint64_t (*v13)(char *, uint64_t);
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t (*v17)(char *, uint64_t);
  unsigned char *v18;
  char *v19;
  void (*v20)(_OWORD *__return_ptr, unint64_t, unint64_t, void, char *, const char *, uint64_t, uint64_t, uint64_t, const char *, uint64_t, char, id (*)@<X0>(void *@<X8>), int *, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  char v26;
  char v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  unint64_t v36;
  void (*v37)(char *, uint64_t);
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  long long v43;
  double result;
  long long v45;
  int v46;
  int v47;
  int v48;
  int v49;
  unsigned char *v50;
  unsigned char v51[12];
  int v52;
  unsigned char *v53;
  uint64_t v54;
  _OWORD *v55;
  uint64_t (*v56)(char *, uint64_t);
  uint64_t v57;
  unsigned char *v58;
  unsigned char *v59;
  void *v60;
  _OWORD v61[4];
  _OWORD v62[2];

  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F96880]), sel_init);
  objc_msgSend(v3, sel_setMovieRestriction_, 1000);
  id v60 = v3;
  objc_msgSend(v3, sel_setTvRestriction_, 1000);
  if (one-time initialization token for shared != -1) {
    swift_once();
  }
  uint64_t v4 = static PerformanceUtil.shared;
  uint64_t v5 = type metadata accessor for Date();
  unsigned __int8 v59 = v51;
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x1F4188790](v5);
  unint64_t v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  Date.init()();
  uint64_t v9 = *(void (**)(_OWORD *__return_ptr, unint64_t, unint64_t, void, unsigned char *, const char *, uint64_t, uint64_t, uint64_t, const char *, uint64_t, int, id (*)@<X0>(void *@<X8>), uint64_t, uint64_t))(*(void *)v4 + 200);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MCProfileConnection?);
  LOBYTE(v49) = 2;
  v9(v61, 0xD00000000000001CLL, 0x80000001C91A4A60, 0, &v51[-v8], "SiriInformationSearch/AssistantDataCache.swift", 46, 2, 138, "fallbackSnapshot()", 18, v49, partial apply for closure #1 in AssistantDataCache.fallbackSnapshot(), v1, v10);
  uint64_t v13 = *(void (**)(void, void))(v6 + 8);
  uint64_t v12 = (unsigned char *)(v6 + 8);
  id v11 = (uint64_t (*)(char *, uint64_t))v13;
  uint64_t v14 = ((uint64_t (*)(unsigned char *, uint64_t))v13)(&v51[-v8], v5);
  if (*(void *)&v61[0])
  {
    unsigned __int8 v55 = a1;
    unsigned __int8 v58 = v51;
    uint64_t v15 = static PerformanceUtil.shared;
    uint64_t v16 = MEMORY[0x1F4188790](v14);
    uint64_t v57 = v5;
    uint64_t v17 = v11;
    unsigned __int8 v59 = v18;
    uint64_t v50 = v18;
    uint64_t v54 = v7;
    MEMORY[0x1F4188790](v16);
    uint64_t v19 = (char *)&v49 - v8;
    Date.init()();
    os_log_type_t v20 = *(void (**)(_OWORD *__return_ptr, unint64_t, unint64_t, void, char *, const char *, uint64_t, uint64_t, uint64_t, const char *, uint64_t, char, id (*)@<X0>(void *@<X8>), int *, uint64_t))(*(void *)v15 + 200);
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for NSNumber?);
    uint64_t v22 = v57;
    v20(v61, 0xD000000000000055, 0x80000001C91A4AA0, 0, v19, "SiriInformationSearch/AssistantDataCache.swift", 46, 2, 142, "fallbackSnapshot()", 18, 2, partial apply for closure #2 in AssistantDataCache.fallbackSnapshot(), &v49, v21);
    uint64_t v56 = v17;
    uint64_t v23 = v17(v19, v22);
    uint64_t v24 = *(void **)&v61[0];
    unsigned __int8 v58 = v12;
    if (*(void *)&v61[0])
    {
      uint64_t v25 = objc_msgSend(*(id *)&v61[0], sel_integerValue);
      objc_msgSend(v60, sel_setMovieRestriction_, v25);
    }
    uint64_t v28 = static PerformanceUtil.shared;
    unint64_t v29 = MEMORY[0x1F4188790](v23);
    uint64_t v50 = v59;
    __int16 v30 = v54;
    MEMORY[0x1F4188790](v29);
    Date.init()();
    LOBYTE(v46) = 2;
    (*(void (**)(_OWORD *__return_ptr, unint64_t, unint64_t, void, char *, const char *, uint64_t, uint64_t, uint64_t, const char *, uint64_t, int, id (*)@<X0>(void *@<X8>), int *, uint64_t))(*(void *)v28 + 200))(v61, 0xD000000000000056, 0x80000001C91A4B00, 0, (char *)&v49 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0), "SiriInformationSearch/AssistantDataCache.swift", 46, 2, 148, "fallbackSnapshot()", 18, v46, partial apply for closure #3 in AssistantDataCache.fallbackSnapshot(), &v49, v21);
    __int16 v31 = v56((char *)&v49 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0), v22);
    uint64_t v32 = *(void **)&v61[0];
    if (*(void *)&v61[0])
    {
      uint64_t v33 = objc_msgSend(*(id *)&v61[0], (SEL)&selRef_setUserSpans_);
      objc_msgSend(v60, sel_setTvRestriction_, v33);
    }
    unsigned __int8 v53 = v51;
    uint64_t v34 = static PerformanceUtil.shared;
    uint64_t v35 = MEMORY[0x1F4188790](v31);
    uint64_t v50 = v59;
    MEMORY[0x1F4188790](v35);
    id v36 = (v30 + 15) & 0xFFFFFFFFFFFFFFF0;
    Date.init()();
    LOBYTE(v47) = 2;
    (*(void (**)(_OWORD *__return_ptr, unint64_t, unint64_t, void, char *, const char *, uint64_t, uint64_t, uint64_t, const char *, uint64_t, int, id (*)@<X0>(BOOL *@<X8>), int *, void))(*(void *)v34 + 200))(v61, 0xD000000000000055, 0x80000001C91A4B60, 0, (char *)&v49 - v36, "SiriInformationSearch/AssistantDataCache.swift", 46, 2, 154, "fallbackSnapshot()", 18, v47, partial apply for closure #4 in AssistantDataCache.fallbackSnapshot(), &v49, MEMORY[0x1E4FBB390]);
    uint64_t v37 = (void (*)(char *, uint64_t))v56;
    uint64_t v38 = v57;
    uint64_t v39 = v56((char *)&v49 - v36, v57);
    unsigned __int8 v53 = v51;
    uint64_t v52 = LOBYTE(v61[0]);
    int v40 = static PerformanceUtil.shared;
    __int16 v41 = MEMORY[0x1F4188790](v39);
    uint64_t v42 = v59;
    uint64_t v50 = v59;
    MEMORY[0x1F4188790](v41);
    Date.init()();
    LOBYTE(v48) = 2;
    (*(void (**)(_OWORD *__return_ptr, unint64_t, unint64_t, void, char *, const char *, uint64_t, uint64_t, uint64_t, const char *, uint64_t, int, id (*)@<X0>(BOOL *@<X8>), int *, void))(*(void *)v40 + 200))(v61, 0xD000000000000055, 0x80000001C91A4B60, 0, (char *)&v49 - v36, "SiriInformationSearch/AssistantDataCache.swift", 46, 2, 157, "fallbackSnapshot()", 18, v48, partial apply for closure #5 in AssistantDataCache.fallbackSnapshot(), &v49, MEMORY[0x1E4FBB390]);
    v37((char *)&v49 - v36, v38);

    unint64_t v26 = v52;
    unint64_t v27 = v61[0];
    a1 = v55;
  }
  else
  {
    unint64_t v26 = 0;
    unint64_t v27 = 1;
  }
  specialized AssistantDataSnapshot.init(source:countryCode:meCards:contentRestrictions:uiScale:allowUserGeneratedContent:censorSpeech:temperatureUnit:)(1, 0, 0, MEMORY[0x1E4FBC860], v60, 0, 1, v27, (uint64_t)v61, v26, 0, 0);
  uint64_t v43 = v61[3];
  a1[2] = v61[2];
  a1[3] = v43;
  a1[4] = v62[0];
  *(_OWORD *)((char *)a1 + 74) = *(_OWORD *)((char *)v62 + 10);
  uint64_t result = *(double *)v61;
  uint64_t v45 = v61[1];
  *a1 = v61[0];
  a1[1] = v45;
  return result;
}

id closure #1 in AssistantDataCache.fallbackSnapshot()@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  id result = (id)(*(uint64_t (**)(void))(*(void *)a1 + 144))();
  if (!result) {
    id result = objc_msgSend(self, sel_sharedConnection);
  }
  *a2 = result;
  return result;
}

void AssistantDataCache.fetchReplacementMeCardsIfNeeded(for:completion:)(unint64_t a1, void (*a2)(unint64_t, void), uint64_t a3)
{
  if (a1)
  {
    uint64_t v7 = a1 & 0xFFFFFFFFFFFFFF8;
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      if (_CocoaArrayWrapper.endIndex.getter())
      {
LABEL_4:
        if ((a1 & 0xC000000000000001) != 0)
        {
          id v9 = (id)MEMORY[0x1CB77D510](0, a1);
        }
        else
        {
          if (!*(void *)(v7 + 16))
          {
            __break(1u);
LABEL_28:
            swift_once();
LABEL_14:
            uint64_t v26 = type metadata accessor for Logger();
            __swift_project_value_buffer(v26, (uint64_t)static Logger.pommes);
            unint64_t v27 = Logger.logObject.getter();
            os_log_type_t v28 = static os_log_type_t.debug.getter();
            if (os_log_type_enabled(v27, v28))
            {
              unint64_t v29 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)unint64_t v29 = 0;
              _os_log_impl(&dword_1C8F83000, v27, v28, "#AssistantData SAPerson Me cards likely have genuine data. Skipping Contacts fetch", v29, 2u);
              MEMORY[0x1CB77E470](v29, -1, -1);
            }

            a2(a1, 0);

            return;
          }
          id v9 = *(id *)(a1 + 32);
        }
        id v38 = v9;
        swift_bridgeObjectRelease();
        id v10 = objc_msgSend(v38, sel_internalGUID);
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v14 = v13;

          if (v12 == 0xD000000000000012 && v14 == 0x80000001C91A4A40)
          {
            swift_bridgeObjectRelease();
LABEL_12:
            uint64_t v37 = *(void *)(v3 + 16);
            uint64_t v16 = swift_allocObject();
            *(void *)(v16 + 24) = *(void *)(v3 + 40);
            swift_unknownObjectWeakInit();
            uint64_t v17 = (void *)swift_allocObject();
            v17[2] = v16;
            v17[3] = a2;
            v17[4] = a3;
            aBlock[4] = partial apply for closure #1 in AssistantDataCache.fetchReplacementMeCardsIfNeeded(for:completion:);
            aBlock[5] = v17;
            aBlock[0] = MEMORY[0x1E4F143A8];
            aBlock[1] = 1107296256;
            aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
            aBlock[3] = &block_descriptor_16;
            uint64_t v18 = _Block_copy(aBlock);
            uint64_t v35 = type metadata accessor for DispatchQoS();
            id v36 = &v34;
            uint64_t v19 = *(void *)(v35 - 8);
            MEMORY[0x1F4188790](v35);
            uint64_t v21 = (char *)&v34 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
            swift_retain();
            swift_retain();
            static DispatchQoS.unspecified.getter();
            uint64_t v22 = type metadata accessor for DispatchWorkItemFlags();
            uint64_t v34 = (uint64_t)&v34;
            uint64_t v23 = *(void *)(v22 - 8);
            MEMORY[0x1F4188790](v22);
            uint64_t v25 = (char *)&v34 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
            uint64_t v39 = MEMORY[0x1E4FBC860];
            lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, MEMORY[0x1F41AAEB0]);
            __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
            lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A], (uint64_t *)&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
            dispatch thunk of SetAlgebra.init<A>(_:)();
            MEMORY[0x1CB77D180](0, v21, v25, v18);
            _Block_release(v18);

            (*(void (**)(char *, uint64_t))(v23 + 8))(v25, v22);
            (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v35);
            swift_release();
            swift_release();
            return;
          }
          char v15 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          if (v15) {
            goto LABEL_12;
          }
        }
        if (one-time initialization token for pommes == -1) {
          goto LABEL_14;
        }
        goto LABEL_28;
      }
    }
    else
    {
      uint64_t v8 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v8) {
        goto LABEL_4;
      }
    }
    swift_bridgeObjectRelease();
  }
  if (one-time initialization token for pommes != -1) {
    swift_once();
  }
  uint64_t v30 = type metadata accessor for Logger();
  __swift_project_value_buffer(v30, (uint64_t)static Logger.pommes);
  __int16 v31 = Logger.logObject.getter();
  os_log_type_t v32 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v31, v32))
  {
    uint64_t v33 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v33 = 0;
    _os_log_impl(&dword_1C8F83000, v31, v32, "#AssistantData No SAPerson Me cards. Skipping Contacts fetch", v33, 2u);
    MEMORY[0x1CB77E470](v33, -1, -1);
  }

  a2(MEMORY[0x1E4FBC860], 0);
}

uint64_t closure #1 in AssistantDataCache.fetchReplacementMeCardsIfNeeded(for:completion:)(uint64_t a1, void (*a2)(void))
{
  uint64_t v4 = a1 + 16;
  swift_beginAccess();
  if (MEMORY[0x1CB77E560](v4))
  {
    uint64_t v5 = *(void *)(a1 + 24);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(ObjectType, v5);
    a2();
    swift_bridgeObjectRelease();
    return swift_unknownObjectRelease();
  }
  else
  {
    if (one-time initialization token for pommes != -1) {
      swift_once();
    }
    uint64_t v7 = type metadata accessor for Logger();
    __swift_project_value_buffer(v7, (uint64_t)static Logger.pommes);
    uint64_t v8 = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v8, v9))
    {
      id v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_1C8F83000, v8, v9, "#AssistantData No fallback contact-fetching helper. Skipping Contacts fetch", v10, 2u);
      MEMORY[0x1CB77E470](v10, -1, -1);
    }

    return ((uint64_t (*)(void, void))a2)(MEMORY[0x1E4FBC860], 0);
  }
}

uint64_t AssistantDataCache.deinit()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  outlined consume of AssistantDataSnapshot?(*(void *)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64), *(void *)(v0 + 72));

  return v0;
}

uint64_t AssistantDataCache.__deallocating_deinit()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  outlined consume of AssistantDataSnapshot?(*(void *)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64), *(void *)(v0 + 72));

  return swift_deallocClassInstance();
}

uint64_t sub_1C918057C()
{
  uint64_t v1 = *(void *)(type metadata accessor for PerformanceUtil.Ticket(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = (((*(void *)(v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = v0 + v3;
  uint64_t v7 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x1F4186498](v0, v5 + 8, v4);
}

void partial apply for closure #1 in AssistantDataCache.updateSnapshot(on:onlyIfNeeded:)(void *a1, void *a2)
{
  uint64_t v5 = *(void *)(type metadata accessor for PerformanceUtil.Ticket(0) - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = (*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = *(void *)(v2 + v7);
  uint64_t v9 = *(void *)(v2 + ((v7 + 15) & 0xFFFFFFFFFFFFFFF8));

  closure #1 in AssistantDataCache.updateSnapshot(on:onlyIfNeeded:)(a1, a2, v2 + v6, v8, v9);
}

uint64_t outlined init with take of AssistantDataSnapshot?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for AssistantDataSnapshot?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C91807BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  (*(void (**)(void *__return_ptr))(**(void **)a1 + 120))(v4);
  return outlined init with take of AssistantDataSnapshot?((uint64_t)v4, a2);
}

uint64_t sub_1C9180820@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 144))();
  *a2 = result;
  return result;
}

uint64_t type metadata accessor for AssistantDataCache()
{
  return self;
}

uint64_t method lookup function for AssistantDataCache(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for AssistantDataCache);
}

uint64_t dispatch thunk of AssistantDataCache.lastAssistantDataSnapshot.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of AssistantDataCache.profileConnection.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of AssistantDataCache.__allocating_init(_:contactFetching:profileConnection:)()
{
  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t dispatch thunk of AssistantDataCache.updateSnapshot(on:onlyIfNeeded:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t sub_1C918092C()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1C9180964()
{
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t partial apply for closure #1 in AssistantDataCache.fetchReplacementMeCardsIfNeeded(for:completion:)()
{
  return closure #1 in AssistantDataCache.fetchReplacementMeCardsIfNeeded(for:completion:)(*(void *)(v0 + 16), *(void (**)(void))(v0 + 24));
}

id partial apply for closure #1 in AssistantDataCache.fallbackSnapshot()@<X0>(void *a1@<X8>)
{
  return closure #1 in AssistantDataCache.fallbackSnapshot()(v1, a1);
}

id partial apply for closure #2 in AssistantDataCache.fallbackSnapshot()@<X0>(void *a1@<X8>)
{
  return partial apply for closure #2 in AssistantDataCache.fallbackSnapshot()(MEMORY[0x1E4F740C0], a1);
}

id partial apply for closure #3 in AssistantDataCache.fallbackSnapshot()@<X0>(void *a1@<X8>)
{
  return partial apply for closure #2 in AssistantDataCache.fallbackSnapshot()(MEMORY[0x1E4F740C8], a1);
}

id partial apply for closure #2 in AssistantDataCache.fallbackSnapshot()@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*(id *)(v2 + 16), sel_effectiveValueForSetting_, *a1);
  *a2 = result;
  return result;
}

id partial apply for closure #4 in AssistantDataCache.fallbackSnapshot()@<X0>(BOOL *a1@<X8>)
{
  return partial apply for closure #4 in AssistantDataCache.fallbackSnapshot()(MEMORY[0x1E4F73F28], a1);
}

id partial apply for closure #5 in AssistantDataCache.fallbackSnapshot()@<X0>(BOOL *a1@<X8>)
{
  return partial apply for closure #4 in AssistantDataCache.fallbackSnapshot()(MEMORY[0x1E4F73F30], a1);
}

id partial apply for closure #4 in AssistantDataCache.fallbackSnapshot()@<X0>(void *a1@<X0>, BOOL *a2@<X8>)
{
  id result = objc_msgSend(*(id *)(v2 + 16), sel_effectiveBoolValueForSetting_, *a1);
  *a2 = result == 1;
  return result;
}

uint64_t sub_1C9180AE4()
{
  swift_weakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

uint64_t partial apply for closure #1 in AssistantDataCache.handleSASetAssistantData(_:updateQueue:)()
{
  return closure #1 in AssistantDataCache.handleSASetAssistantData(_:updateQueue:)();
}

uint64_t sub_1C9180B24()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t partial apply for closure #2 in AssistantDataCache.handleSASetAssistantData(_:updateQueue:)()
{
  return closure #2 in AssistantDataCache.handleSASetAssistantData(_:updateQueue:)(*(void **)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_1C9180B6C()
{
  uint64_t v1 = *(void *)(type metadata accessor for PerformanceUtil.Ticket(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = (*(void *)(v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = v0 + v3;
  uint64_t v7 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  swift_bridgeObjectRelease();

  swift_release();

  return MEMORY[0x1F4186498](v0, ((v5 + 15) & 0xFFFFFFFFFFFFFFF8) + 8, v4);
}

uint64_t partial apply for closure #3 in closure #2 in AssistantDataCache.handleSASetAssistantData(_:updateQueue:)(uint64_t a1, char a2)
{
  char v4 = a2 & 1;
  uint64_t v5 = *(void *)(type metadata accessor for PerformanceUtil.Ticket(0) - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = (*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = *(void **)(v2 + v7);
  uint64_t v9 = *(void *)(v2 + ((v7 + 15) & 0xFFFFFFFFFFFFFFF8));

  return closure #3 in closure #2 in AssistantDataCache.handleSASetAssistantData(_:updateQueue:)(a1, v4, v2 + v6, v8, v9);
}

uint64_t outlined retain of AssistantDataSnapshot(uint64_t a1)
{
  return a1;
}

uint64_t outlined release of AssistantDataSnapshot(uint64_t a1)
{
  return a1;
}

void *PimsRuntimeLoggingHandler.__allocating_init()()
{
  uint64_t v0 = (void *)swift_allocObject();
  getPimsRuntimeLogger()();
  uint64_t v1 = type metadata accessor for MediaSuggestionManager();
  swift_allocObject();
  uint64_t v2 = MediaSuggestionManager.init()();
  v0[10] = v1;
  v0[11] = &protocol witness table for MediaSuggestionManager;
  v0[7] = v2;
  return v0;
}

void *PimsRuntimeLoggingHandler.init()()
{
  getPimsRuntimeLogger()();
  outlined init with take of AppDataProviding(&v4, (uint64_t)(v0 + 2));
  uint64_t v1 = type metadata accessor for MediaSuggestionManager();
  swift_allocObject();
  uint64_t v2 = MediaSuggestionManager.init()();
  v0[10] = v1;
  v0[11] = &protocol witness table for MediaSuggestionManager;
  v0[7] = v2;
  return v0;
}

uint64_t PimsRuntimeLoggingHandler.__allocating_init(pimsRuntimeLogger:suggestionManager:)(long long *a1, long long *a2)
{
  uint64_t v4 = swift_allocObject();
  outlined init with take of AppDataProviding(a1, v4 + 16);
  outlined init with take of AppDataProviding(a2, v4 + 56);
  return v4;
}

uint64_t PimsRuntimeLoggingHandler.init(pimsRuntimeLogger:suggestionManager:)(long long *a1, long long *a2)
{
  outlined init with take of AppDataProviding(a1, v2 + 16);
  outlined init with take of AppDataProviding(a2, v2 + 56);
  return v2;
}

void PimsRuntimeLoggingHandler.logPIMSCandidates(requestId:serverStateSignals:rankedResults:)(uint64_t a1, NSObject *a2, unint64_t a3)
{
  uint64_t v4 = v3;
  os_log_t v74 = a2;
  uint64_t v64 = a1;
  uint64_t v6 = type metadata accessor for PimsSuggestionMetadata();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v69 = v6;
  uint64_t v70 = v7;
  MEMORY[0x1F4188790](v6);
  v68 = (char *)v60 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for MediaSuggestionManager.EnablementStatus();
  uint64_t v61 = *(void *)(v9 - 8);
  uint64_t v62 = v9;
  MEMORY[0x1F4188790](v9);
  uint64_t v63 = (char *)v60 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for Ampmusicfeedbackforpplpb_MusicRankingInfluenceImpactInfo();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)v60 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_ClientSignals?);
  MEMORY[0x1F4188790](v15 - 8);
  uint64_t v17 = (char *)v60 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for Apple_Parsec_Siri_V2alpha_ClientSignals();
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x1F4188790](v18);
  uint64_t v21 = (char *)v60 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v55 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v55)
    {
LABEL_3:
      outlined init with copy of MediaUserStateCenter?((uint64_t)v74, (uint64_t)v17, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_ClientSignals?);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18) == 1)
      {
        outlined destroy of MediaUserStateCenter?((uint64_t)v17, &demangling cache variable for type metadata for Apple_Parsec_Siri_V2alpha_ClientSignals?);
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v21, v17, v18);
        if (Apple_Parsec_Siri_V2alpha_ClientSignals.hasMusicRankingInfluenceImpactInfo.getter())
        {
          Apple_Parsec_Siri_V2alpha_ClientSignals.musicRankingInfluenceImpactInfo.getter();
          uint64_t v22 = Ampmusicfeedbackforpplpb_MusicRankingInfluenceImpactInfo.suggestionImpactInfo.getter();
          (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
          swift_bridgeObjectRetain();
          swift_retain();
          unint64_t v23 = specialized Sequence.compactMap<A>(_:)(v22, (uint64_t)v4, (void *)a3);
          swift_release();
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
          swift_bridgeObjectRelease();
LABEL_13:
          __swift_project_boxed_opaque_existential_1(v4 + 2, v4[5]);
          dispatch thunk of PimsRuntimeLogging.logSuggestionMetadata(requestId:suggestions:)();
          outlined init with copy of AppDataProviding((uint64_t)(v4 + 2), (uint64_t)v75);
          uint64_t v28 = v76;
          uint64_t v29 = v77;
          v60[4] = __swift_project_boxed_opaque_existential_1(v75, v76);
          uint64_t v30 = v4[10];
          uint64_t v31 = v4[11];
          __swift_project_boxed_opaque_existential_1(v4 + 7, v30);
          (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v30, v31);
          uint64_t v32 = *(void *)(v23 + 16);
          if (v32)
          {
            v60[1] = v29;
            v60[2] = v28;
            uint64_t v33 = *(void (**)(char *, unint64_t, uint64_t))(v70 + 16);
            unint64_t v34 = v23 + ((*(unsigned __int8 *)(v70 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v70 + 80));
            uint64_t v66 = *(void *)(v70 + 72);
            id v67 = v33;
            v70 += 16;
            uint64_t v65 = (void (**)(char *, uint64_t))(v70 - 8);
            v60[3] = v23;
            swift_bridgeObjectRetain();
            os_log_t v35 = (os_log_t)MEMORY[0x1E4FBC860];
            id v36 = &demangling cache variable for type metadata for UUID?;
            do
            {
              uint64_t v73 = v32;
              os_log_t v74 = v35;
              uint64_t v37 = v68;
              uint64_t v38 = v69;
              v67(v68, v34, v69);
              uint64_t v39 = type metadata accessor for UUID();
              uint64_t v72 = v60;
              uint64_t v40 = *(void *)(v39 - 8);
              uint64_t v41 = *(void *)(v40 + 64);
              MEMORY[0x1F4188790](v39);
              unint64_t v42 = (v41 + 15) & 0xFFFFFFFFFFFFFFF0;
              uint64_t v43 = (char *)v60 - v42;
              uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(v36);
              v71 = (void (*)(char *, char *, uint64_t))v60;
              MEMORY[0x1F4188790](v44 - 8);
              uint64_t v46 = v36;
              id v47 = (char *)v60 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
              PimsSuggestionMetadata.pimsId.getter();
              (*(void (**)(char *, void, uint64_t, uint64_t))(v40 + 56))(v47, 0, 1, v39);
              (*v65)(v37, v38);
              if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48))(v47, 1, v39) == 1)
              {
                outlined destroy of MediaUserStateCenter?((uint64_t)v47, v46);
                os_log_t v35 = v74;
                id v36 = v46;
              }
              else
              {
                long long v48 = *(uint64_t (**)(char *, char *, uint64_t))(v40 + 32);
                uint64_t v49 = v48((char *)v60 - v42, v47, v39);
                MEMORY[0x1F4188790](v49);
                uint64_t v50 = (char *)v60 - v42;
                v71 = (void (*)(char *, char *, uint64_t))v48;
                v48(v50, v43, v39);
                os_log_t v35 = v74;
                uint64_t v51 = v50;
                if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                  os_log_t v35 = (os_log_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, (int64_t)v35[2].isa + 1, 1, (unint64_t)v35);
                }
                id v36 = &demangling cache variable for type metadata for UUID?;
                unint64_t isa = (unint64_t)v35[2].isa;
                unint64_t v52 = (unint64_t)v35[3].isa;
                if (isa >= v52 >> 1) {
                  os_log_t v35 = (os_log_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v52 > 1, isa + 1, 1, (unint64_t)v35);
                }
                v35[2].unint64_t isa = (Class)(isa + 1);
                v71((char *)v35+ ((*(unsigned __int8 *)(v40 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80))+ *(void *)(v40 + 72) * isa, v51, v39);
              }
              v34 += v66;
              uint64_t v32 = v73 - 1;
            }
            while (v73 != 1);
            swift_bridgeObjectRelease_n();
          }
          else
          {
            swift_bridgeObjectRelease();
          }
          uint64_t v54 = v63;
          dispatch thunk of PimsRuntimeLogging.logCandidateSuggestions(requestId:enablementStatus:pimsIds:)();
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v61 + 8))(v54, v62);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v75);
          return;
        }
        (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
      }
      if (one-time initialization token for pommes != -1) {
        swift_once();
      }
      uint64_t v24 = type metadata accessor for Logger();
      __swift_project_value_buffer(v24, (uint64_t)static Logger.pommes);
      uint64_t v25 = Logger.logObject.getter();
      os_log_type_t v26 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v25, v26))
      {
        unint64_t v27 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v27 = 0;
        _os_log_impl(&dword_1C8F83000, v25, v26, "PimsRuntimeLoggingHandler: Missing signals from server, unable to get information about suggestion match if any", v27, 2u);
        MEMORY[0x1CB77E470](v27, -1, -1);
      }

      unint64_t v23 = MEMORY[0x1E4FBC860];
      goto LABEL_13;
    }
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  if (one-time initialization token for pommes != -1) {
    swift_once();
  }
  uint64_t v56 = type metadata accessor for Logger();
  __swift_project_value_buffer(v56, (uint64_t)static Logger.pommes);
  os_log_t v74 = (os_log_t)Logger.logObject.getter();
  os_log_type_t v57 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v74, v57))
  {
    unsigned __int8 v58 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unsigned __int8 v58 = 0;
    _os_log_impl(&dword_1C8F83000, v74, v57, "PimsRuntimeLoggingHandler: There is no candidate in the ranked results", v58, 2u);
    MEMORY[0x1CB77E470](v58, -1, -1);
  }
  os_log_t v59 = v74;
}

uint64_t PimsRuntimeLoggingHandler.mapPimsMatchToSuggestionMetadata(match:rankedResults:)@<X0>(void *a1@<X1>, uint64_t a2@<X8>)
{
  unint64_t v75 = (unint64_t)a1;
  uint64_t v80 = a2;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PLUSSuggestionRedundancyState?);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v74 = (uint64_t)&v63 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PLUSSuggestionNoveltyState?);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v73 = (uint64_t)&v63 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PLUSSuggestionSurfacedState?);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v72 = (char *)&v63 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PimsLocality?);
  uint64_t v9 = MEMORY[0x1F4188790](v8 - 8);
  uint64_t v77 = (uint64_t)&v63 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v78 = (uint64_t)&v63 - v11;
  uint64_t v12 = type metadata accessor for PLUSSuggestionSurfacedState();
  uint64_t v70 = *(void *)(v12 - 8);
  uint64_t v71 = v12;
  MEMORY[0x1F4188790](v12);
  uint64_t v76 = (uint64_t)&v63 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PimsClientTreatment?);
  uint64_t v15 = MEMORY[0x1F4188790](v14 - 8);
  uint64_t v69 = (uint64_t)&v63 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v15);
  uint64_t v79 = (uint64_t)&v63 - v17;
  uint64_t v18 = type metadata accessor for Ampmusicfeedbackforpplpb_MusicRankingInfluenceImpact();
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x1F4188790](v18);
  uint64_t v21 = (char *)&v63 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PimsServerTreatment?);
  uint64_t v23 = MEMORY[0x1F4188790](v22 - 8);
  uint64_t v68 = (uint64_t)&v63 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = MEMORY[0x1F4188790](v23);
  id v67 = (char *)&v63 - v26;
  MEMORY[0x1F4188790](v25);
  uint64_t v28 = (char *)&v63 - v27;
  uint64_t v29 = type metadata accessor for UUID();
  uint64_t v30 = *(void *)(v29 - 8);
  MEMORY[0x1F4188790](v29);
  uint64_t v66 = v31;
  uint64_t v32 = (char *)&v63 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x1F4188790](v33 - 8);
  os_log_t v35 = (char *)&v63 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  Ampmusicfeedbackforpplpb_MusicRankingInfluenceImpactInfo.ClientMusicSuggestionImpactInfo.clientMusicSuggestionID.getter();
  UUID.init(uuidString:)();
  uint64_t v36 = v29;
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v35, 1, v29) != 1)
  {
    uint64_t v65 = v30;
    (*(void (**)(char *, char *, uint64_t))(v30 + 32))(v32, v35, v29);
    Ampmusicfeedbackforpplpb_MusicRankingInfluenceImpactInfo.ClientMusicSuggestionImpactInfo.impact.getter();
    PimsRuntimeLoggingHandler.mapServerImpactToPimsServerTreatment(impact:)((uint64_t)v21, (uint64_t)v28);
    (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
    uint64_t v45 = (uint64_t)v28;
    unint64_t v46 = v75;
    if (v75 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t result = _CocoaArrayWrapper.endIndex.getter();
      uint64_t v47 = result;
      uint64_t v48 = v78;
      if (result)
      {
LABEL_9:
        if ((v46 & 0xC000000000000001) != 0)
        {
          uint64_t v47 = MEMORY[0x1CB77D510](0, v46);
        }
        else
        {
          if (!*(void *)((v46 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            return result;
          }
          uint64_t v47 = *(void *)(v46 + 32);
          swift_retain();
        }
      }
    }
    else
    {
      uint64_t v47 = *(void *)((v75 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t result = swift_bridgeObjectRetain();
      uint64_t v48 = v78;
      if (v47) {
        goto LABEL_9;
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v49 = v79;
    PimsRuntimeLoggingHandler.mapClientImpactToPimsClientTreatment(finalTopCandidate:serverTreatment:)(v47, v45, v79);
    swift_release();
    PimsRuntimeLoggingHandler.extractSurfacedState(serverTreatment:clientTreatment:rankedResults:)(v45, v49, v46, v76);
    uint64_t v50 = (uint64_t)v67;
    outlined init with copy of MediaUserStateCenter?(v45, (uint64_t)v67, &demangling cache variable for type metadata for PimsServerTreatment?);
    uint64_t v51 = type metadata accessor for PimsServerTreatment();
    LODWORD(v49) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v51 - 8) + 48))(v50, 1, v51);
    outlined destroy of MediaUserStateCenter?(v50, &demangling cache variable for type metadata for PimsServerTreatment?);
    if (v49 == 1)
    {
      uint64_t v52 = type metadata accessor for PimsLocality();
      uint64_t v53 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v52 - 8) + 56))(v48, 1, 1, v52);
    }
    else
    {
      uint64_t v54 = *MEMORY[0x1E4FA3CB0];
      uint64_t v55 = type metadata accessor for PimsLocality();
      uint64_t v56 = *(void *)(v55 - 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v56 + 104))(v48, v54, v55);
      uint64_t v53 = (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v56 + 56))(v48, 0, 1, v55);
      uint64_t v36 = v29;
    }
    uint64_t v64 = v36;
    unint64_t v75 = (unint64_t)&v63;
    MEMORY[0x1F4188790](v53);
    (*(void (**)(char *, char *, uint64_t))(v65 + 16))((char *)&v63 - ((v57 + 15) & 0xFFFFFFFFFFFFFFF0), v32, v36);
    outlined init with copy of MediaUserStateCenter?(v48, v77, &demangling cache variable for type metadata for PimsLocality?);
    id v67 = v32;
    outlined init with copy of MediaUserStateCenter?(v45, v68, &demangling cache variable for type metadata for PimsServerTreatment?);
    outlined init with copy of MediaUserStateCenter?(v79, v69, &demangling cache variable for type metadata for PimsClientTreatment?);
    uint64_t v59 = v70;
    uint64_t v58 = v71;
    id v60 = v72;
    uint64_t v61 = v76;
    (*(void (**)(char *, uint64_t, uint64_t))(v70 + 16))(v72, v76, v71);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v59 + 56))(v60, 0, 1, v58);
    PimsRuntimeLoggingHandler.extractNoveltyState(serverTreatment:)(v45, v73);
    PimsRuntimeLoggingHandler.extractRedundancyState(serverTreatment:)(v45, v74);
    PimsSuggestionMetadata.init(pimsId:locality:serverTreatment:clientTreatment:suggestionSurfaced:noveltyState:redundancyState:)();
    outlined destroy of MediaUserStateCenter?(v78, &demangling cache variable for type metadata for PimsLocality?);
    (*(void (**)(uint64_t, uint64_t))(v59 + 8))(v61, v58);
    outlined destroy of MediaUserStateCenter?(v79, &demangling cache variable for type metadata for PimsClientTreatment?);
    outlined destroy of MediaUserStateCenter?(v45, &demangling cache variable for type metadata for PimsServerTreatment?);
    (*(void (**)(char *, uint64_t))(v65 + 8))(v67, v64);
    uint64_t v62 = type metadata accessor for PimsSuggestionMetadata();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v62 - 8) + 56))(v80, 0, 1, v62);
  }
  outlined destroy of MediaUserStateCenter?((uint64_t)v35, &demangling cache variable for type metadata for UUID?);
  if (one-time initialization token for pommes != -1) {
    swift_once();
  }
  uint64_t v37 = type metadata accessor for Logger();
  __swift_project_value_buffer(v37, (uint64_t)static Logger.pommes);
  uint64_t v38 = Logger.logObject.getter();
  os_log_type_t v39 = static os_log_type_t.debug.getter();
  BOOL v40 = os_log_type_enabled(v38, v39);
  uint64_t v41 = v80;
  if (v40)
  {
    unint64_t v42 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v42 = 0;
    _os_log_impl(&dword_1C8F83000, v38, v39, "PimsRuntimeLoggingHandler: There is no pims id in the response", v42, 2u);
    MEMORY[0x1CB77E470](v42, -1, -1);
  }

  uint64_t v43 = type metadata accessor for PimsSuggestionMetadata();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56))(v41, 1, 1, v43);
}

uint64_t PimsRuntimeLoggingHandler.mapServerImpactToPimsServerTreatment(impact:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for Ampmusicfeedbackforpplpb_MusicRankingInfluenceImpact();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  int v8 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (v8 == *MEMORY[0x1E4F89A70])
  {
    uint64_t v9 = (unsigned int *)MEMORY[0x1E4FA3CD8];
  }
  else if (v8 == *MEMORY[0x1E4F89A80])
  {
    uint64_t v9 = (unsigned int *)MEMORY[0x1E4FA3CE8];
  }
  else if (v8 == *MEMORY[0x1E4F89A78])
  {
    uint64_t v9 = (unsigned int *)MEMORY[0x1E4FA3CE0];
  }
  else if (v8 == *MEMORY[0x1E4F89A88])
  {
    uint64_t v9 = (unsigned int *)MEMORY[0x1E4FA3CF0];
  }
  else if (v8 == *MEMORY[0x1E4F89AA8])
  {
    uint64_t v9 = (unsigned int *)MEMORY[0x1E4FA3D10];
  }
  else if (v8 == *MEMORY[0x1E4F89AB8])
  {
    uint64_t v9 = (unsigned int *)MEMORY[0x1E4FA3D20];
  }
  else if (v8 == *MEMORY[0x1E4F89AA0])
  {
    uint64_t v9 = (unsigned int *)MEMORY[0x1E4FA3D08];
  }
  else if (v8 == *MEMORY[0x1E4F89A90])
  {
    uint64_t v9 = (unsigned int *)MEMORY[0x1E4FA3CF8];
  }
  else if (v8 == *MEMORY[0x1E4F89A98])
  {
    uint64_t v9 = (unsigned int *)MEMORY[0x1E4FA3D00];
  }
  else if (v8 == *MEMORY[0x1E4F89AB0])
  {
    uint64_t v9 = (unsigned int *)MEMORY[0x1E4FA3D18];
  }
  else
  {
    if (v8 != *MEMORY[0x1E4F89A68])
    {
      uint64_t v14 = type metadata accessor for PimsServerTreatment();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(a2, 1, 1, v14);
      return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }
    uint64_t v9 = (unsigned int *)MEMORY[0x1E4FA3CD0];
  }
  uint64_t v10 = *v9;
  uint64_t v11 = type metadata accessor for PimsServerTreatment();
  uint64_t v12 = *(void *)(v11 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 104))(a2, v10, v11);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v12 + 56))(a2, 0, 1, v11);
}

uint64_t PimsRuntimeLoggingHandler.mapClientImpactToPimsClientTreatment(finalTopCandidate:serverTreatment:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PimsServerTreatment?);
  MEMORY[0x1F4188790](v6 - 8);
  int v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for PimsServerTreatment();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v9);
  uint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x1F4188790](v11);
  uint64_t v16 = (char *)&v27 - v15;
  MEMORY[0x1F4188790](v14);
  uint64_t v18 = (char *)&v27 - v17;
  if (!a1 || *(unsigned char *)(a1 + 16) != 2) {
    goto LABEL_9;
  }
  outlined init with copy of MediaUserStateCenter?(a2, (uint64_t)v8, &demangling cache variable for type metadata for PimsServerTreatment?);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    outlined destroy of MediaUserStateCenter?((uint64_t)v8, &demangling cache variable for type metadata for PimsServerTreatment?);
LABEL_9:
    uint64_t v22 = (unsigned int *)MEMORY[0x1E4FA3CB8];
    goto LABEL_10;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v18, v8, v9);
  uint64_t v19 = *MEMORY[0x1E4FA3CE8];
  uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 104);
  v27(v16, v19, v9);
  swift_retain();
  int v28 = MEMORY[0x1CB77C5C0](v18, v16);
  uint64_t v20 = *(void (**)(char *, uint64_t))(v10 + 8);
  v20(v16, v9);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v18, v9);
  if (v28)
  {
    swift_release();
    v20(v13, v9);
    v20(v18, v9);
  }
  else
  {
    v27(v16, *MEMORY[0x1E4FA3CE0], v9);
    char v21 = MEMORY[0x1CB77C5C0](v13, v16);
    swift_release();
    v20(v16, v9);
    v20(v13, v9);
    v20(v18, v9);
    if ((v21 & 1) == 0) {
      goto LABEL_9;
    }
  }
  uint64_t v22 = (unsigned int *)MEMORY[0x1E4FA3CC0];
LABEL_10:
  uint64_t v23 = *v22;
  uint64_t v24 = type metadata accessor for PimsClientTreatment();
  uint64_t v25 = *(void *)(v24 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 104))(a3, v23, v24);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v25 + 56))(a3, 0, 1, v24);
}

uint64_t PimsRuntimeLoggingHandler.extractSurfacedState(serverTreatment:clientTreatment:rankedResults:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v50 = a3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PimsClientTreatment?);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for PimsClientTreatment();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x1F4188790](v10);
  uint64_t v14 = (char *)&v48 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  uint64_t v51 = (char *)&v48 - v15;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PimsServerTreatment?);
  uint64_t v17 = MEMORY[0x1F4188790](v16 - 8);
  uint64_t v19 = (char *)&v48 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v17);
  char v21 = (char *)&v48 - v20;
  outlined init with copy of MediaUserStateCenter?(a1, (uint64_t)&v48 - v20, &demangling cache variable for type metadata for PimsServerTreatment?);
  uint64_t v22 = type metadata accessor for PimsServerTreatment();
  uint64_t v23 = *(void *)(v22 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22) == 1) {
    goto LABEL_19;
  }
  uint64_t v49 = a4;
  outlined init with copy of MediaUserStateCenter?((uint64_t)v21, (uint64_t)v19, &demangling cache variable for type metadata for PimsServerTreatment?);
  int v24 = (*(uint64_t (**)(char *, uint64_t))(v23 + 88))(v19, v22);
  if (v24 != *MEMORY[0x1E4FA3CE8] && v24 != *MEMORY[0x1E4FA3CE0])
  {
    if (v24 == *MEMORY[0x1E4FA3CF0])
    {
      uint64_t v26 = *MEMORY[0x1E4FA3C90];
      uint64_t v27 = type metadata accessor for PLUSSuggestionSurfacedState();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 104))(v49, v26, v27);
      return outlined destroy of MediaUserStateCenter?((uint64_t)v21, &demangling cache variable for type metadata for PimsServerTreatment?);
    }
    (*(void (**)(char *, uint64_t))(v23 + 8))(v19, v22);
    a4 = v49;
LABEL_19:
    uint64_t v34 = *MEMORY[0x1E4FA3C80];
    uint64_t v35 = type metadata accessor for PLUSSuggestionSurfacedState();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 104))(a4, v34, v35);
    return outlined destroy of MediaUserStateCenter?((uint64_t)v21, &demangling cache variable for type metadata for PimsServerTreatment?);
  }
  outlined destroy of MediaUserStateCenter?((uint64_t)v21, &demangling cache variable for type metadata for PimsServerTreatment?);
  outlined init with copy of MediaUserStateCenter?(a2, (uint64_t)v9, &demangling cache variable for type metadata for PimsClientTreatment?);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    outlined destroy of MediaUserStateCenter?((uint64_t)v9, &demangling cache variable for type metadata for PimsClientTreatment?);
LABEL_22:
    uint64_t v37 = v49;
    uint64_t v38 = *MEMORY[0x1E4FA3C88];
    uint64_t v39 = type metadata accessor for PLUSSuggestionSurfacedState();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 104))(v37, v38, v39);
  }
  int v28 = v51;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v51, v9, v10);
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v14, *MEMORY[0x1E4FA3CC0], v10);
  char v29 = MEMORY[0x1CB77C5A0](v28, v14);
  uint64_t v30 = *(void (**)(char *, uint64_t))(v11 + 8);
  v30(v14, v10);
  if ((v29 & 1) == 0)
  {
    v30(v28, v10);
    goto LABEL_22;
  }
  unint64_t v31 = v50;
  if (v50 >> 62) {
    goto LABEL_32;
  }
  uint64_t v32 = *(void *)((v50 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v32) {
    goto LABEL_28;
  }
  while ((v31 & 0xC000000000000001) == 0)
  {
    if (*(unsigned char *)(*(void *)(v31 + 32) + 16) == 1)
    {
LABEL_16:
      swift_bridgeObjectRelease();
LABEL_17:
      v30(v28, v10);
      uint64_t v33 = (unsigned int *)MEMORY[0x1E4FA3C90];
      goto LABEL_30;
    }
    if (v32 != 1)
    {
      uint64_t v40 = 5;
      while (1)
      {
        uint64_t v41 = v40 - 3;
        if (__OFADD__(v40 - 4, 1)) {
          break;
        }
        if (*(unsigned char *)(*(void *)(v31 + 8 * v40) + 16) == 1) {
          goto LABEL_16;
        }
        ++v40;
        if (v41 == v32) {
          goto LABEL_28;
        }
      }
      __break(1u);
LABEL_32:
      swift_bridgeObjectRetain();
      uint64_t v32 = _CocoaArrayWrapper.endIndex.getter();
      if (v32) {
        continue;
      }
    }
    goto LABEL_28;
  }
  int v44 = *(unsigned __int8 *)(MEMORY[0x1CB77D510](0, v31) + 16);
  swift_unknownObjectRelease();
  if (v44 == 1)
  {
LABEL_35:
    swift_bridgeObjectRelease();
    int v28 = v51;
    goto LABEL_17;
  }
  int v28 = v51;
  if (v32 == 1)
  {
LABEL_28:
    swift_bridgeObjectRelease();
LABEL_29:
    v30(v28, v10);
    uint64_t v33 = (unsigned int *)MEMORY[0x1E4FA3C80];
LABEL_30:
    uint64_t v42 = *v33;
    uint64_t v43 = type metadata accessor for PLUSSuggestionSurfacedState();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 104))(v49, v42, v43);
  }
  else
  {
    uint64_t v45 = 1;
    while (1)
    {
      uint64_t result = MEMORY[0x1CB77D510](v45, v50);
      uint64_t v46 = v45 + 1;
      if (__OFADD__(v45, 1)) {
        break;
      }
      int v47 = *(unsigned __int8 *)(result + 16);
      swift_unknownObjectRelease();
      if (v47 == 1) {
        goto LABEL_35;
      }
      ++v45;
      if (v46 == v32)
      {
        swift_bridgeObjectRelease();
        int v28 = v51;
        goto LABEL_29;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t PimsRuntimeLoggingHandler.extractNoveltyState(serverTreatment:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PimsServerTreatment?);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for PimsServerTreatment();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  uint64_t v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v13 = (char *)&v27 - v12;
  outlined init with copy of MediaUserStateCenter?(a1, (uint64_t)v6, &demangling cache variable for type metadata for PimsServerTreatment?);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) != 1)
  {
    uint64_t v17 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
    v17(v13, v6, v7);
    v17(v11, v13, v7);
    int v18 = (*(uint64_t (**)(char *, uint64_t))(v8 + 88))(v11, v7);
    if (v18 == *MEMORY[0x1E4FA3CC8]) {
      goto LABEL_23;
    }
    if (v18 != *MEMORY[0x1E4FA3CE8] && v18 != *MEMORY[0x1E4FA3CD8])
    {
      if (v18 == *MEMORY[0x1E4FA3CE0]
        || v18 == *MEMORY[0x1E4FA3CF0]
        || v18 == *MEMORY[0x1E4FA3D10]
        || v18 == *MEMORY[0x1E4FA3D20])
      {
        goto LABEL_23;
      }
      if (v18 == *MEMORY[0x1E4FA3D08])
      {
        uint64_t v20 = (unsigned int *)MEMORY[0x1E4FA3C70];
        goto LABEL_24;
      }
      if (v18 == *MEMORY[0x1E4FA3CF8])
      {
LABEL_23:
        uint64_t v20 = (unsigned int *)MEMORY[0x1E4FA3C68];
        goto LABEL_24;
      }
      if (v18 != *MEMORY[0x1E4FA3D18])
      {
        if (v18 != *MEMORY[0x1E4FA3D00] && v18 != *MEMORY[0x1E4FA3CD0])
        {
          uint64_t v26 = type metadata accessor for PLUSSuggestionNoveltyState();
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(a2, 1, 1, v26);
          return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
        }
        goto LABEL_23;
      }
    }
    uint64_t v20 = (unsigned int *)MEMORY[0x1E4FA3C78];
LABEL_24:
    uint64_t v24 = *v20;
    uint64_t v15 = type metadata accessor for PLUSSuggestionNoveltyState();
    uint64_t v16 = *(void *)(v15 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 104))(a2, v24, v15);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v16 + 56))(a2, 0, 1, v15);
  }
  outlined destroy of MediaUserStateCenter?((uint64_t)v6, &demangling cache variable for type metadata for PimsServerTreatment?);
  uint64_t v14 = *MEMORY[0x1E4FA3C68];
  uint64_t v15 = type metadata accessor for PLUSSuggestionNoveltyState();
  uint64_t v16 = *(void *)(v15 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 104))(a2, v14, v15);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v16 + 56))(a2, 0, 1, v15);
}

uint64_t PimsRuntimeLoggingHandler.extractRedundancyState(serverTreatment:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PimsServerTreatment?);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for PimsServerTreatment();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  uint64_t v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v13 = (char *)&v29 - v12;
  outlined init with copy of MediaUserStateCenter?(a1, (uint64_t)v6, &demangling cache variable for type metadata for PimsServerTreatment?);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    outlined destroy of MediaUserStateCenter?((uint64_t)v6, &demangling cache variable for type metadata for PimsServerTreatment?);
    uint64_t v14 = type metadata accessor for PLUSSuggestionRedundancyState();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(a2, 1, 1, v14);
  }
  uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
  v16(v13, v6, v7);
  v16(v11, v13, v7);
  int v17 = (*(uint64_t (**)(char *, uint64_t))(v8 + 88))(v11, v7);
  if (v17 == *MEMORY[0x1E4FA3CE8]
    || v17 == *MEMORY[0x1E4FA3CD8]
    || v17 == *MEMORY[0x1E4FA3CE0]
    || v17 == *MEMORY[0x1E4FA3CF0]
    || v17 == *MEMORY[0x1E4FA3D10]
    || v17 == *MEMORY[0x1E4FA3D20]
    || v17 == *MEMORY[0x1E4FA3D08])
  {
    uint64_t v24 = (unsigned int *)MEMORY[0x1E4FA3C98];
LABEL_26:
    uint64_t v25 = *v24;
    uint64_t v26 = type metadata accessor for PLUSSuggestionRedundancyState();
    uint64_t v27 = *(void *)(v26 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 104))(a2, v25, v26);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v27 + 56))(a2, 0, 1, v26);
  }
  if (v17 == *MEMORY[0x1E4FA3D18])
  {
    uint64_t v24 = (unsigned int *)MEMORY[0x1E4FA3CA0];
    goto LABEL_26;
  }
  uint64_t v28 = type metadata accessor for PLUSSuggestionRedundancyState();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(a2, 1, 1, v28);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

uint64_t PimsRuntimeLoggingHandler.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  return v0;
}

uint64_t PimsRuntimeLoggingHandler.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);

  return swift_deallocClassInstance();
}

uint64_t protocol witness for PIMSManagerWrapper.fetchStatus() in conformance MediaSuggestionManager()
{
  return dispatch thunk of MediaSuggestionManager.fetchStatus()();
}

unint64_t specialized Sequence.compactMap<A>(_:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v33 = a2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PimsSuggestionMetadata?);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for PimsSuggestionMetadata();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v9);
  uint64_t v34 = (char *)v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  unint64_t v31 = (char *)v27 - v13;
  uint64_t v14 = *(void *)(a1 + 16);
  if (!v14) {
    return MEMORY[0x1E4FBC860];
  }
  v27[1] = v3;
  uint64_t v15 = *(void *)(type metadata accessor for Ampmusicfeedbackforpplpb_MusicRankingInfluenceImpactInfo.ClientMusicSuggestionImpactInfo()
                  - 8);
  uint64_t v16 = a1 + ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80));
  uint64_t v32 = (unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  uint64_t v28 = v10;
  int v17 = (void (**)(char *, char *, uint64_t))(v10 + 32);
  uint64_t v18 = *(void *)(v15 + 72);
  v27[0] = a1;
  swift_bridgeObjectRetain();
  unint64_t v19 = MEMORY[0x1E4FBC860];
  uint64_t v29 = v9;
  uint64_t v30 = a3;
  do
  {
    PimsRuntimeLoggingHandler.mapPimsMatchToSuggestionMetadata(match:rankedResults:)(a3, (uint64_t)v8);
    if ((*v32)(v8, 1, v9) == 1)
    {
      outlined destroy of MediaUserStateCenter?((uint64_t)v8, &demangling cache variable for type metadata for PimsSuggestionMetadata?);
    }
    else
    {
      uint64_t v20 = v18;
      char v21 = *v17;
      uint64_t v22 = v31;
      (*v17)(v31, v8, v9);
      v21(v34, v22, v9);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v19 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v19 + 16) + 1, 1, v19);
      }
      unint64_t v24 = *(void *)(v19 + 16);
      unint64_t v23 = *(void *)(v19 + 24);
      if (v24 >= v23 >> 1) {
        unint64_t v19 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v23 > 1, v24 + 1, 1, v19);
      }
      *(void *)(v19 + 16) = v24 + 1;
      unint64_t v25 = v19
          + ((*(unsigned __int8 *)(v28 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80))
          + *(void *)(v28 + 72) * v24;
      uint64_t v9 = v29;
      v21((char *)v25, v34, v29);
      a3 = v30;
      uint64_t v18 = v20;
    }
    v16 += v18;
    --v14;
  }
  while (v14);
  swift_bridgeObjectRelease();
  return v19;
}

uint64_t type metadata accessor for PimsRuntimeLoggingHandler()
{
  return self;
}

uint64_t method lookup function for PimsRuntimeLoggingHandler(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for PimsRuntimeLoggingHandler);
}

uint64_t dispatch thunk of PimsRuntimeLoggingHandler.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of PimsRuntimeLoggingHandler.__allocating_init(pimsRuntimeLogger:suggestionManager:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of PimsRuntimeLoggingHandler.logPIMSCandidates(requestId:serverStateSignals:rankedResults:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of PIMSManagerWrapper.fetchStatus()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t PommesPhoneCallStateManager.__allocating_init(_:)(uint64_t a1)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 24) = 0;
  *(void *)(result + 32) = 0;
  *(unsigned char *)(result + 40) = 3;
  *(void *)(result + 16) = a1;
  return result;
}

uint64_t one-time initialization function for phoneCallStateQueryTimeoutInMillis()
{
  uint64_t v0 = type metadata accessor for DispatchTimeInterval();
  __swift_allocate_value_buffer(v0, static PommesPhoneCallStateManager.phoneCallStateQueryTimeoutInMillis);
  *(void *)__swift_project_value_buffer(v0, (uint64_t)static PommesPhoneCallStateManager.phoneCallStateQueryTimeoutInMillis) = 20;
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104);

  return v1();
}

uint64_t PommesPhoneCallStateManager.phoneCallStateQueryTimeoutInMillis.unsafeMutableAddressor()
{
  if (one-time initialization token for phoneCallStateQueryTimeoutInMillis != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for DispatchTimeInterval();

  return __swift_project_value_buffer(v0, (uint64_t)static PommesPhoneCallStateManager.phoneCallStateQueryTimeoutInMillis);
}

uint64_t static PommesPhoneCallStateManager.phoneCallStateQueryTimeoutInMillis.getter@<X0>(uint64_t a1@<X8>)
{
  if (one-time initialization token for phoneCallStateQueryTimeoutInMillis != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for DispatchTimeInterval();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)static PommesPhoneCallStateManager.phoneCallStateQueryTimeoutInMillis);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance PommesPhoneCallStateManager.Status(uint64_t a1, uint64_t a2)
{
  return specialized static PommesPhoneCallStateManager.Status.== infix(_:_:)(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16), *(void *)a2, *(void *)(a2 + 8), *(unsigned char *)(a2 + 16));
}

uint64_t PommesPhoneCallStateManager.init(_:)(uint64_t a1)
{
  *(void *)(v1 + 24) = 0;
  *(void *)(v1 + 32) = 0;
  *(unsigned char *)(v1 + 40) = 3;
  *(void *)(v1 + 16) = a1;
  return v1;
}

uint64_t PommesPhoneCallStateManager.fetchIsUserOnPhoneCall(requestId:)(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return MEMORY[0x1F4188298](PommesPhoneCallStateManager.fetchIsUserOnPhoneCall(requestId:), 0, 0);
}

uint64_t PommesPhoneCallStateManager.fetchIsUserOnPhoneCall(requestId:)()
{
  uint64_t v2 = v0[3];
  uint64_t v1 = v0[4];
  uint64_t v3 = v0[2];
  uint64_t v4 = (void *)swift_task_alloc();
  v0[5] = v4;
  v4[2] = v1;
  v4[3] = v3;
  v4[4] = v2;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[6] = v5;
  *uint64_t v5 = v0;
  v5[1] = PommesPhoneCallStateManager.fetchIsUserOnPhoneCall(requestId:);
  uint64_t v6 = MEMORY[0x1E4FBB390];
  return MEMORY[0x1F41880D8](v0 + 7, 0, 0, 0xD000000000000022, 0x80000001C91A4D10, partial apply for closure #1 in PommesPhoneCallStateManager.fetchIsUserOnPhoneCall(requestId:), v4, v6);
}

{
  uint64_t v1;

  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x1F4188298](PommesPhoneCallStateManager.fetchIsUserOnPhoneCall(requestId:), 0, 0);
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))(*(unsigned __int8 *)(v0 + 56));
}

uint64_t closure #1 in PommesPhoneCallStateManager.fetchIsUserOnPhoneCall(requestId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for CheckedContinuation<Bool, Never>);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x1F4188790](v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v8);
  unint64_t v11 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v12 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v12 + v11, (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  (*(void (**)(uint64_t, uint64_t, uint64_t (*)(), uint64_t))(*(void *)a2 + 128))(a3, a4, partial apply for closure #1 in closure #1 in PommesPhoneCallStateManager.fetchIsUserOnPhoneCall(requestId:), v12);
  return swift_release();
}

uint64_t PommesPhoneCallStateManager.deinit()
{
  swift_unknownObjectRelease();
  outlined consume of PommesPhoneCallStateManager.Status(*(void *)(v0 + 24), *(void *)(v0 + 32), *(unsigned char *)(v0 + 40));
  return v0;
}

uint64_t PommesPhoneCallStateManager.__deallocating_deinit()
{
  swift_unknownObjectRelease();
  outlined consume of PommesPhoneCallStateManager.Status(*(void *)(v0 + 24), *(void *)(v0 + 32), *(unsigned char *)(v0 + 40));

  return swift_deallocClassInstance();
}

uint64_t specialized static PommesPhoneCallStateManager.Status.== infix(_:_:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6)
{
  switch(a3)
  {
    case 1:
      if (a6 != 1) {
        goto LABEL_17;
      }
      if (a1 != a4 || a2 != a5) {
        goto LABEL_18;
      }
      uint64_t result = 1;
      break;
    case 2:
      if (a6 != 2) {
        goto LABEL_17;
      }
      if (a1 != a4 || a2 != a5) {
        goto LABEL_18;
      }
      uint64_t result = 1;
      break;
    case 3:
      if (a6 != 3 || a5 | a4) {
        goto LABEL_17;
      }
      uint64_t result = 1;
      break;
    default:
      if (a6)
      {
LABEL_17:
        uint64_t result = 0;
      }
      else if (a1 == a4 && a2 == a5)
      {
        uint64_t result = 1;
      }
      else
      {
LABEL_18:
        uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
      }
      break;
  }
  return result;
}

uint64_t sub_1C91842DC()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v0, 56, 7);
}

uint64_t partial apply for closure #1 in PommesPhoneCallStateManager.fetchIsUserOnPhoneCall(requestId:)(uint64_t a1)
{
  return closure #1 in PommesPhoneCallStateManager.fetchIsUserOnPhoneCall(requestId:)(a1, v1[2], v1[3], v1[4]);
}

uint64_t type metadata accessor for PommesPhoneCallStateManager()
{
  return self;
}

uint64_t method lookup function for PommesPhoneCallStateManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for PommesPhoneCallStateManager);
}

uint64_t dispatch thunk of PommesPhoneCallStateManager.__allocating_init(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of PommesPhoneCallStateManager.fetchIsUserOnPhoneCall(requestId:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of PommesPhoneCallStateManager.fetchIsUserOnPhoneCall(requestId:)(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(*(void *)v2 + 136) + **(int **)(*(void *)v2 + 136));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *uint64_t v6 = v3;
  v6[1] = dispatch thunk of SageSearch.search(query:location:);
  return v8(a1, a2);
}

uint64_t dispatch thunk of PommesPhoneCallStateManager.cachedIsUserOnPhoneCall(requestId:conservative:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t outlined copy of PommesPhoneCallStateManager.Status(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 2u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for PommesPhoneCallStateManager.Status(uint64_t a1)
{
  return outlined consume of PommesPhoneCallStateManager.Status(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t initializeBufferWithCopyOfBuffer for PommesPhoneCallStateManager.Status(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  outlined copy of PommesPhoneCallStateManager.Status(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for PommesPhoneCallStateManager.Status(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  outlined copy of PommesPhoneCallStateManager.Status(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  outlined consume of PommesPhoneCallStateManager.Status(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for PommesPhoneCallStateManager.Status(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  outlined consume of PommesPhoneCallStateManager.Status(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for PommesPhoneCallStateManager.Status(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PommesPhoneCallStateManager.Status(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 253;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t getEnumTag for PommesPhoneCallStateManager.Status(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 2u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 3);
  }
}

uint64_t destructiveInjectEnumTag for PommesPhoneCallStateManager.Status(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(void *)uint64_t result = a2 - 3;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 3;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

void *type metadata accessor for PommesPhoneCallStateManager.Status()
{
  return &unk_1F2376028;
}

uint64_t sub_1C91846B8()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for CheckedContinuation<Bool, Never>);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x1F4186498](v0, v5, v6);
}

uint64_t partial apply for closure #1 in closure #1 in PommesPhoneCallStateManager.fetchIsUserOnPhoneCall(requestId:)()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t specialized == infix<A>(_:_:)(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 7369332;
  }
  else {
    uint64_t v3 = 25458;
  }
  if (v2) {
    unint64_t v4 = 0xE200000000000000;
  }
  else {
    unint64_t v4 = 0xE300000000000000;
  }
  if (a2) {
    uint64_t v5 = 7369332;
  }
  else {
    uint64_t v5 = 25458;
  }
  if (a2) {
    unint64_t v6 = 0xE300000000000000;
  }
  else {
    unint64_t v6 = 0xE200000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t specialized == infix<A>(_:_:)(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 1702060386;
  unint64_t v3 = 0xE400000000000000;
  uint64_t v4 = a1;
  unint64_t v5 = 1702060386;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0x80000001C919C6A0;
      unint64_t v5 = 0xD000000000000011;
      break;
    case 2:
      unint64_t v3 = 0xE600000000000000;
      unint64_t v5 = 0x736573726170;
      break;
    case 3:
      unint64_t v5 = 0xD000000000000014;
      unint64_t v3 = 0x80000001C919C6C0;
      break;
    case 4:
      unint64_t v5 = 0x69646E6143707274;
      unint64_t v3 = 0xEE00644965746164;
      break;
    case 5:
      unint64_t v3 = 0xE500000000000000;
      unint64_t v5 = 0x6449756374;
      break;
    case 6:
      unint64_t v3 = 0xE800000000000000;
      unint64_t v5 = 0x65736E6F70736572;
      break;
    case 7:
      unint64_t v5 = 0x7365525454736168;
      unint64_t v3 = 0xED000065736E6F70;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE400000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0x80000001C919C6A0;
      if (v5 == 0xD000000000000011) {
        goto LABEL_22;
      }
      goto LABEL_25;
    case 2:
      unint64_t v6 = 0xE600000000000000;
      if (v5 != 0x736573726170) {
        goto LABEL_25;
      }
      goto LABEL_22;
    case 3:
      unint64_t v6 = 0x80000001C919C6C0;
      if (v5 != 0xD000000000000014) {
        goto LABEL_25;
      }
      goto LABEL_22;
    case 4:
      unint64_t v6 = 0xEE00644965746164;
      if (v5 != 0x69646E6143707274) {
        goto LABEL_25;
      }
      goto LABEL_22;
    case 5:
      unint64_t v6 = 0xE500000000000000;
      if (v5 != 0x6449756374) {
        goto LABEL_25;
      }
      goto LABEL_22;
    case 6:
      unint64_t v6 = 0xE800000000000000;
      uint64_t v2 = 0x65736E6F70736572;
      goto LABEL_21;
    case 7:
      unint64_t v6 = 0xED000065736E6F70;
      if (v5 != 0x7365525454736168) {
        goto LABEL_25;
      }
      goto LABEL_22;
    default:
LABEL_21:
      if (v5 != v2) {
        goto LABEL_25;
      }
LABEL_22:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_25:
      }
        char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t specialized RawRepresentable<>.hash(into:)()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int specialized RawRepresentable<>._rawHashValue(seed:)()
{
  return Hasher._finalize()();
}

uint64_t PommesSearchRequestXPC.pommesCandidateId.getter@<X0>(void *a1@<X8>)
{
  uint64_t v3 = type metadata accessor for ParseStateXPC(0);
  MEMORY[0x1F4188790](v3);
  unint64_t v5 = (uint64_t *)((char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  outlined init with copy of ParseStateXPC(v1 + OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_parseState, (uint64_t)v5);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t v8 = *v5;
  uint64_t v7 = v5[1];
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v9 = v5[2];
    uint64_t v10 = v5[3];
    uint64_t v11 = (uint64_t)v5
        + *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for (id: String, tcuId: String, response: TCUMappedNLResponse?, hasTTResponse: Bool))
                 + 64);
    *a1 = v8;
    a1[1] = v7;
    a1[2] = v9;
    a1[3] = v10;
    uint64_t v12 = *MEMORY[0x1E4F9FE58];
    uint64_t v13 = type metadata accessor for PommesCandidateId();
    (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 104))(a1, v12, v13);
    return outlined destroy of MediaUserStateCenter?(v11, (uint64_t *)&demangling cache variable for type metadata for TCUMappedNLResponse?);
  }
  else
  {
    swift_bridgeObjectRelease();
    *a1 = v8;
    a1[1] = v7;
    uint64_t v15 = *MEMORY[0x1E4F9FE50];
    uint64_t v16 = type metadata accessor for PommesCandidateId();
    return (*(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 104))(a1, v15, v16);
  }
}

uint64_t type metadata accessor for ParseStateXPC(uint64_t a1)
{
  return type metadata accessor for PommesSearchError(a1, type metadata singleton initialization cache for ParseStateXPC);
}

uint64_t outlined init with copy of ParseStateXPC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ParseStateXPC(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t PommesSearchRequestXPC.domain.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_domain);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PommesSearchRequestXPC.listenAfterSpeaking.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_listenAfterSpeaking);
}

uint64_t PommesSearchRequestXPC.assistantId.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_assistantId);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PommesSearchRequestXPC.requestId.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_requestId);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PommesSearchRequestXPC.isMultiUser.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_isMultiUser);
}

uint64_t PommesSearchRequestXPC.parseState.getter@<X0>(uint64_t a1@<X8>)
{
  return outlined init with copy of ParseStateXPC(v1 + OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_parseState, a1);
}

uint64_t PommesSearchRequestXPC.utterance.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_utterance);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PommesSearchRequestXPC.audioSource.getter()
{
  return PommesRequestContext.audioSource.getter(&OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_audioSource);
}

uint64_t PommesSearchRequestXPC.audioDestination.getter()
{
  return PommesRequestContext.audioSource.getter(&OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_audioDestination);
}

uint64_t PommesSearchRequestXPC.responseMode.getter()
{
  return PommesRequestContext.audioSource.getter(&OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_responseMode);
}

uint64_t PommesSearchRequestXPC.isEyesFree.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_isEyesFree);
}

uint64_t PommesSearchRequestXPC.isVoiceTriggerEnabled.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_isVoiceTriggerEnabled);
}

uint64_t PommesSearchRequestXPC.isTextToSpeechEnabled.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_isTextToSpeechEnabled);
}

uint64_t PommesSearchRequestXPC.isTriggerlessFollowup.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_isTriggerlessFollowup);
}

uint64_t PommesSearchRequestXPC.isPushOffRequest.getter()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_isPushOffRequest);
}

uint64_t PommesSearchRequestXPC.deviceRestrictions.getter()
{
  return swift_bridgeObjectRetain();
}

id PommesSearchRequestXPC.__allocating_init(domain:listenAfterSpeaking:assistantId:requestId:isMultiUser:parseState:utterance:deviceRestrictions:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, long long a9, uint64_t a10, uint64_t a11)
{
  id v19 = objc_allocWithZone(v11);
  return PommesSearchRequestXPC.init(domain:listenAfterSpeaking:assistantId:requestId:isMultiUser:parseState:utterance:deviceRestrictions:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, *((uint64_t *)&a9 + 1), a10, a11);
}

id PommesSearchRequestXPC.init(domain:listenAfterSpeaking:assistantId:requestId:isMultiUser:parseState:utterance:deviceRestrictions:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  char v21 = &v12[OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_domain];
  void *v21 = a1;
  v21[1] = a2;
  v12[OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_listenAfterSpeaking] = a3;
  uint64_t v22 = &v12[OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_assistantId];
  *uint64_t v22 = a4;
  v22[1] = a5;
  unint64_t v23 = &v12[OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_requestId];
  *unint64_t v23 = a6;
  v23[1] = a7;
  v12[OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_isMultiUser] = a8;
  outlined init with copy of ParseStateXPC(a9, (uint64_t)&v12[OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_parseState]);
  unint64_t v24 = &v12[OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_utterance];
  *unint64_t v24 = a10;
  v24[1] = a11;
  unint64_t v25 = &v12[OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_audioSource];
  *unint64_t v25 = 0;
  v25[1] = 0;
  uint64_t v26 = &v12[OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_audioDestination];
  *uint64_t v26 = 0;
  v26[1] = 0;
  uint64_t v27 = &v12[OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_responseMode];
  void *v27 = 0;
  v27[1] = 0;
  v12[OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_isEyesFree] = 0;
  v12[OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_isVoiceTriggerEnabled] = 0;
  v12[OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_isTextToSpeechEnabled] = 0;
  v12[OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_isTriggerlessFollowup] = 0;
  v12[OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_isPushOffRequest] = 0;
  *(void *)&v12[OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_deviceRestrictions] = a12;
  v31.receiver = v12;
  v31.super_class = ObjectType;
  id v28 = objc_msgSendSuper2(&v31, sel_init);
  outlined destroy of ParseStateXPC(a9);
  return v28;
}

uint64_t outlined destroy of ParseStateXPC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ParseStateXPC(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id PommesSearchRequestXPC.__allocating_init(domain:listenAfterSpeaking:assistantId:requestId:isMultiUser:parseState:utterance:audioSource:audioDestination:responseMode:isEyesFree:isVoiceTriggerEnabled:isTextToSpeechEnabled:isTriggerlessFollowup:isPushOffRequest:deviceRestrictions:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, long long a9, long long a10, long long a11, long long a12, uint64_t a13, char a14, char a15, char a16, char a17, char a18, uint64_t a19)
{
  id v22 = objc_allocWithZone(v19);
  return PommesSearchRequestXPC.init(domain:listenAfterSpeaking:assistantId:requestId:isMultiUser:parseState:utterance:audioSource:audioDestination:responseMode:isEyesFree:isVoiceTriggerEnabled:isTextToSpeechEnabled:isTriggerlessFollowup:isPushOffRequest:deviceRestrictions:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, *((uint64_t *)&a9 + 1), a10, *((uint64_t *)&a10 + 1), a11, *((uint64_t *)&a11 + 1), a12, *((uint64_t *)&a12 + 1), a13, a14, a15,
           a16,
           a17,
           a18,
           a19);
}

id PommesSearchRequestXPC.init(domain:listenAfterSpeaking:assistantId:requestId:isMultiUser:parseState:utterance:audioSource:audioDestination:responseMode:isEyesFree:isVoiceTriggerEnabled:isTextToSpeechEnabled:isTriggerlessFollowup:isPushOffRequest:deviceRestrictions:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, char a19, char a20,char a21,char a22,uint64_t a23)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v30 = &v23[OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_domain];
  void *v30 = a1;
  v30[1] = a2;
  v23[OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_listenAfterSpeaking] = a3;
  objc_super v31 = &v23[OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_assistantId];
  *objc_super v31 = a4;
  v31[1] = a5;
  uint64_t v32 = &v23[OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_requestId];
  *uint64_t v32 = a6;
  v32[1] = a7;
  v23[OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_isMultiUser] = a8;
  outlined init with copy of ParseStateXPC(a9, (uint64_t)&v23[OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_parseState]);
  uint64_t v33 = &v23[OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_utterance];
  *uint64_t v33 = a10;
  v33[1] = a11;
  uint64_t v34 = &v23[OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_audioSource];
  void *v34 = a12;
  v34[1] = a13;
  uint64_t v35 = &v23[OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_audioDestination];
  *uint64_t v35 = a14;
  v35[1] = a15;
  uint64_t v36 = &v23[OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_responseMode];
  *uint64_t v36 = a16;
  v36[1] = a17;
  v23[OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_isEyesFree] = a18;
  v23[OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_isVoiceTriggerEnabled] = a19;
  v23[OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_isTextToSpeechEnabled] = a20;
  v23[OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_isTriggerlessFollowup] = a21;
  v23[OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_isPushOffRequest] = a22;
  *(void *)&v23[OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_deviceRestrictions] = a23;
  v42.receiver = v23;
  v42.super_class = ObjectType;
  id v37 = objc_msgSendSuper2(&v42, sel_init);
  outlined destroy of ParseStateXPC(a9);
  return v37;
}

uint64_t static PommesSearchRequestXPC.supportsSecureCoding.getter()
{
  return static PommesSearchRequestXPC.supportsSecureCoding;
}

uint64_t static PommesSearchRequestXPC.supportsSecureCoding.setter(char a1)
{
  uint64_t result = swift_beginAccess();
  static PommesSearchRequestXPC.supportsSecureCoding = a1;
  return result;
}

uint64_t (*static PommesSearchRequestXPC.supportsSecureCoding.modify())()
{
  return PommesSearch.serverFallbackPreferences.modify;
}

Swift::Void __swiftcall PommesSearchRequestXPC.encode(with:)(NSCoder with)
{
  uint64_t v2 = v1;
  uint64_t v4 = (void *)MEMORY[0x1CB77CA90](*(void *)(v1 + OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_domain), *(void *)(v1 + OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_domain + 8));
  unint64_t v5 = (void *)MEMORY[0x1CB77CA90](0x6E69616D6F64, 0xE600000000000000);
  [(objc_class *)with.super.isa encodeObject:v4 forKey:v5];

  uint64_t v6 = *(unsigned __int8 *)(v2 + OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_listenAfterSpeaking);
  uint64_t v7 = (void *)MEMORY[0x1CB77CA90](0xD000000000000013, 0x80000001C91A4DB0);
  [(objc_class *)with.super.isa encodeBool:v6 forKey:v7];

  uint64_t v8 = (void *)MEMORY[0x1CB77CA90](*(void *)(v2 + OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_assistantId), *(void *)(v2 + OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_assistantId + 8));
  uint64_t v9 = (void *)MEMORY[0x1CB77CA90](0x6E61747369737361, 0xEB00000000644974);
  [(objc_class *)with.super.isa encodeObject:v8 forKey:v9];

  uint64_t v10 = (void *)MEMORY[0x1CB77CA90](*(void *)(v2 + OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_requestId), *(void *)(v2 + OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_requestId + 8));
  uint64_t v11 = (void *)MEMORY[0x1CB77CA90](0x4974736575716572, 0xE900000000000064);
  [(objc_class *)with.super.isa encodeObject:v10 forKey:v11];

  uint64_t v12 = *(unsigned __int8 *)(v2 + OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_isMultiUser);
  uint64_t v13 = (void *)MEMORY[0x1CB77CA90](0x5569746C754D7369, 0xEB00000000726573);
  [(objc_class *)with.super.isa encodeBool:v12 forKey:v13];

  type metadata accessor for PropertyListEncoder();
  swift_allocObject();
  PropertyListEncoder.init()();
  dispatch thunk of PropertyListEncoder.outputFormat.setter();
  type metadata accessor for ParseStateXPC(0);
  lazy protocol witness table accessor for type ParseStateXPC and conformance ParseStateXPC(&lazy protocol witness table cache variable for type ParseStateXPC and conformance ParseStateXPC, (void (*)(uint64_t))type metadata accessor for ParseStateXPC);
  uint64_t v14 = dispatch thunk of PropertyListEncoder.encode<A>(_:)();
  unint64_t v16 = v15;
  outlined copy of Data._Representation(v14, v15);
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data._Representation(v14, v16);
  uint64_t v18 = (void *)MEMORY[0x1CB77CA90](0x6174536573726170, 0xEA00000000006574);
  [(objc_class *)with.super.isa encodeObject:isa forKey:v18];
  swift_unknownObjectRelease();

  id v19 = (void *)MEMORY[0x1CB77CA90](*(void *)(v2 + OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_utterance), *(void *)(v2 + OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_utterance + 8));
  uint64_t v20 = (void *)MEMORY[0x1CB77CA90](0x636E617265747475, 0xE900000000000065);
  [(objc_class *)with.super.isa encodeObject:v19 forKey:v20];

  if (*(void *)(v2 + OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_audioSource + 8))
  {
    char v21 = (void *)MEMORY[0x1CB77CA90](*(void *)(v2
                                                + OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_audioSource));
    id v22 = (void *)MEMORY[0x1CB77CA90](0x756F536F69647561, 0xEB00000000656372);
    [(objc_class *)with.super.isa encodeObject:v21 forKey:v22];
  }
  if (*(void *)(v2 + OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_audioDestination + 8))
  {
    unint64_t v23 = (void *)MEMORY[0x1CB77CA90](*(void *)(v2
                                                + OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_audioDestination));
    unint64_t v24 = (void *)MEMORY[0x1CB77CA90](0xD000000000000010, 0x80000001C919F2C0);
    [(objc_class *)with.super.isa encodeObject:v23 forKey:v24];
  }
  if (*(void *)(v2 + OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_responseMode + 8))
  {
    unint64_t v25 = (void *)MEMORY[0x1CB77CA90](*(void *)(v2
                                                + OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_responseMode));
    uint64_t v26 = (void *)MEMORY[0x1CB77CA90](0x65736E6F70736572, 0xEC00000065646F4DLL);
    [(objc_class *)with.super.isa encodeObject:v25 forKey:v26];
  }
  uint64_t v27 = *(unsigned __int8 *)(v2 + OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_isEyesFree);
  id v28 = (void *)MEMORY[0x1CB77CA90](0x7246736579457369, 0xEA00000000006565);
  [(objc_class *)with.super.isa encodeBool:v27 forKey:v28];

  uint64_t v29 = *(unsigned __int8 *)(v2 + OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_isVoiceTriggerEnabled);
  uint64_t v30 = (void *)MEMORY[0x1CB77CA90](0xD000000000000015, 0x80000001C919F2E0);
  [(objc_class *)with.super.isa encodeBool:v29 forKey:v30];

  uint64_t v31 = *(unsigned __int8 *)(v2 + OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_isTextToSpeechEnabled);
  uint64_t v32 = (void *)MEMORY[0x1CB77CA90](0xD000000000000015, 0x80000001C919F300);
  [(objc_class *)with.super.isa encodeBool:v31 forKey:v32];

  uint64_t v33 = *(unsigned __int8 *)(v2 + OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_isTriggerlessFollowup);
  uint64_t v34 = (void *)MEMORY[0x1CB77CA90](0xD000000000000015, 0x80000001C919F320);
  [(objc_class *)with.super.isa encodeBool:v33 forKey:v34];

  uint64_t v35 = *(unsigned __int8 *)(v2 + OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_isPushOffRequest);
  uint64_t v36 = (void *)MEMORY[0x1CB77CA90](0xD000000000000010, 0x80000001C919F340);
  [(objc_class *)with.super.isa encodeBool:v35 forKey:v36];

  Class v37 = Array._bridgeToObjectiveC()().super.isa;
  uint64_t v38 = (void *)MEMORY[0x1CB77CA90](0xD000000000000012, 0x80000001C919F380);
  [(objc_class *)with.super.isa encodeObject:v37 forKey:v38];

  outlined consume of Data?(v14, v16);

  swift_release();
}

id PommesSearchRequestXPC.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return PommesSearchRequestXPC.init(coder:)(a1);
}

id PommesSearchRequestXPC.init(coder:)(void *a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ParseStateXPC?);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = &v54[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = type metadata accessor for ParseStateXPC(0);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  uint64_t v11 = &v54[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v9);
  uint64_t v13 = &v54[-v12];
  type metadata accessor for CNContactStore(0, &lazy cache variable for type metadata for NSString);
  id v14 = v1;
  uint64_t v15 = NSCoder.decodeObject<A>(of:forKey:)();
  if (!v15
    || (unint64_t v16 = (void *)v15,
        Class v74 = ObjectType,
        long long v76 = 0uLL,
        static String._conditionallyBridgeFromObjectiveC(_:result:)(),
        v16,
        (uint64_t v17 = *((void *)&v76 + 1)) == 0))
  {

LABEL_22:
    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return 0;
  }
  uint64_t v73 = v76;
  uint64_t v18 = NSCoder.decodeObject<A>(of:forKey:)();
  if (!v18
    || (id v19 = (void *)v18,
        long long v76 = 0uLL,
        static String._conditionallyBridgeFromObjectiveC(_:result:)(),
        v19,
        !*((void *)&v76 + 1)))
  {

    swift_bridgeObjectRelease();
    goto LABEL_22;
  }
  uint64_t v72 = v17;
  long long v71 = v76;
  uint64_t v20 = NSCoder.decodeObject<A>(of:forKey:)();
  if (!v20
    || (char v21 = (void *)v20,
        long long v76 = 0uLL,
        static String._conditionallyBridgeFromObjectiveC(_:result:)(),
        v21,
        !*((void *)&v76 + 1)))
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_22;
  }
  long long v70 = v76;
  uint64_t v22 = NSCoder.decodeObject<A>(of:forKey:)();
  if (!v22
    || (unint64_t v23 = (void *)v22,
        long long v76 = 0uLL,
        static String._conditionallyBridgeFromObjectiveC(_:result:)(),
        v23,
        (uint64_t v24 = *((void *)&v76 + 1)) == 0))
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_22;
  }
  uint64_t v66 = v76;
  uint64_t v25 = NSCoder.decodeArrayOfObjects<A>(ofClass:forKey:)();
  uint64_t v69 = v24;
  if (v25)
  {
    *(void *)&long long v76 = v25;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [NSString]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [String]);
    int v26 = swift_dynamicCast();
    uint64_t v27 = v75;
    if (!v26) {
      uint64_t v27 = 0;
    }
    uint64_t v68 = v27;
  }
  else
  {
    uint64_t v68 = 0;
  }
  id v28 = (void *)MEMORY[0x1CB77CA90](0xD000000000000013, 0x80000001C91A4DB0);
  unsigned int v65 = objc_msgSend(a1, sel_decodeBoolForKey_, v28);

  uint64_t v29 = (void *)MEMORY[0x1CB77CA90](0x5569746C754D7369, 0xEB00000000726573);
  unsigned int v64 = objc_msgSend(a1, sel_decodeBoolForKey_, v29);

  type metadata accessor for PropertyListDecoder();
  swift_allocObject();
  uint64_t v30 = PropertyListDecoder.init()();
  type metadata accessor for CNContactStore(0, &lazy cache variable for type metadata for NSData);
  uint64_t v31 = NSCoder.decodeObject<A>(of:forKey:)();
  if (!v31
    || (uint64_t v32 = (void *)v31,
        uint64_t v67 = v30,
        long long v76 = xmmword_1C91991D0,
        static Data._conditionallyBridgeFromObjectiveC(_:result:)(),
        v32,
        unint64_t v33 = *((void *)&v76 + 1),
        *((void *)&v76 + 1) >> 60 == 15))
  {

    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_22;
  }
  uint64_t v34 = v76;
  lazy protocol witness table accessor for type ParseStateXPC and conformance ParseStateXPC(&lazy protocol witness table cache variable for type ParseStateXPC and conformance ParseStateXPC, (void (*)(uint64_t))type metadata accessor for ParseStateXPC);
  uint64_t v62 = v34;
  unint64_t v63 = v33;
  dispatch thunk of PropertyListDecoder.decode<A>(_:from:)();
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  outlined init with take of ParseStateXPC((uint64_t)v6, (uint64_t)v13);
  uint64_t v37 = NSCoder.decodeObject<A>(of:forKey:)();
  if (v37)
  {
    uint64_t v38 = (void *)v37;
    long long v76 = 0uLL;
    static String._conditionallyBridgeFromObjectiveC(_:result:)();

    uint64_t v60 = *((void *)&v76 + 1);
    uint64_t v61 = v76;
  }
  else
  {
    uint64_t v60 = 0;
    uint64_t v61 = 0;
  }
  uint64_t v39 = NSCoder.decodeObject<A>(of:forKey:)();
  if (v39)
  {
    uint64_t v40 = (void *)v39;
    long long v76 = 0uLL;
    static String._conditionallyBridgeFromObjectiveC(_:result:)();

    uint64_t v58 = *((void *)&v76 + 1);
    uint64_t v59 = v76;
  }
  else
  {
    uint64_t v59 = 0;
    uint64_t v58 = 0;
  }
  uint64_t v41 = NSCoder.decodeObject<A>(of:forKey:)();
  if (v41)
  {
    objc_super v42 = (void *)v41;
    long long v76 = 0uLL;
    static String._conditionallyBridgeFromObjectiveC(_:result:)();

    uint64_t v56 = *((void *)&v76 + 1);
    uint64_t v57 = v76;
  }
  else
  {
    uint64_t v57 = 0;
    uint64_t v56 = 0;
  }
  uint64_t v43 = (void *)MEMORY[0x1CB77CA90](0x7246736579457369, 0xEA00000000006565);
  unsigned int v55 = objc_msgSend(a1, sel_decodeBoolForKey_, v43);

  int v44 = (void *)MEMORY[0x1CB77CA90](0xD000000000000015, 0x80000001C919F2E0);
  char v45 = objc_msgSend(a1, sel_decodeBoolForKey_, v44);

  uint64_t v46 = (void *)MEMORY[0x1CB77CA90](0xD000000000000015, 0x80000001C919F300);
  char v47 = objc_msgSend(a1, sel_decodeBoolForKey_, v46);

  uint64_t v48 = (void *)MEMORY[0x1CB77CA90](0xD000000000000015, 0x80000001C919F320);
  char v49 = objc_msgSend(a1, sel_decodeBoolForKey_, v48);

  unint64_t v50 = (void *)MEMORY[0x1CB77CA90](0xD000000000000010, 0x80000001C919F340);
  char v51 = objc_msgSend(a1, sel_decodeBoolForKey_, v50);

  outlined init with copy of ParseStateXPC((uint64_t)v13, (uint64_t)v11);
  if (v68) {
    uint64_t v52 = v68;
  }
  else {
    uint64_t v52 = MEMORY[0x1E4FBC860];
  }
  id v53 = objc_allocWithZone(v74);
  id v35 = PommesSearchRequestXPC.init(domain:listenAfterSpeaking:assistantId:requestId:isMultiUser:parseState:utterance:audioSource:audioDestination:responseMode:isEyesFree:isVoiceTriggerEnabled:isTextToSpeechEnabled:isTriggerlessFollowup:isPushOffRequest:deviceRestrictions:)(v73, v72, v65, v71, *((uint64_t *)&v71 + 1), v70, *((uint64_t *)&v70 + 1), v64, (uint64_t)v11, v66, v69, v61, v60, v59, v58, v57, v56, v55, v45,
          v47,
          v49,
          v51,
          v52);
  swift_release();
  outlined consume of Data?(v62, v63);

  outlined destroy of ParseStateXPC((uint64_t)v13);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v35;
}

uint64_t lazy protocol witness table accessor for type ParseStateXPC and conformance ParseStateXPC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t outlined init with take of ParseStateXPC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ParseStateXPC(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

id PommesSearchRequestXPC.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void PommesSearchRequestXPC.init()()
{
}

id PommesSearchRequestXPC.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t ParseStateXPC.CodingKeys.rawValue.getter(char a1)
{
  unint64_t result = 1702060386;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000011;
      break;
    case 2:
      unint64_t result = 0x736573726170;
      break;
    case 3:
      unint64_t result = 0xD000000000000014;
      break;
    case 4:
      unint64_t result = 0x69646E6143707274;
      break;
    case 5:
      unint64_t result = 0x6449756374;
      break;
    case 6:
      unint64_t result = 0x65736E6F70736572;
      break;
    case 7:
      unint64_t result = 0x7365525454736168;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t ParseStateXPC.CodingKeys.stringValue.getter(char a1)
{
  unint64_t result = 1702060386;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000011;
      break;
    case 2:
      unint64_t result = 0x736573726170;
      break;
    case 3:
      unint64_t result = 0xD000000000000014;
      break;
    case 4:
      unint64_t result = 0x69646E6143707274;
      break;
    case 5:
      unint64_t result = 0x6449756374;
      break;
    case 6:
      unint64_t result = 0x65736E6F70736572;
      break;
    case 7:
      unint64_t result = 0x7365525454736168;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance ParseStateXPC.CodingKeys(unsigned __int8 *a1, char *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance ParseStateXPC.CodingKeys()
{
  return specialized RawRepresentable<>._rawHashValue(seed:)();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance ParseStateXPC.CodingKeys()
{
  return specialized RawRepresentable<>.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ParseStateXPC.CodingKeys()
{
  return specialized RawRepresentable<>._rawHashValue(seed:)();
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance ParseStateXPC.CodingKeys@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = specialized ParseStateXPC.CodingKeys.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

unint64_t protocol witness for RawRepresentable.rawValue.getter in conformance ParseStateXPC.CodingKeys@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = ParseStateXPC.CodingKeys.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t protocol witness for CodingKey.stringValue.getter in conformance ParseStateXPC.CodingKeys()
{
  return ParseStateXPC.CodingKeys.stringValue.getter(*v0);
}

unint64_t protocol witness for CodingKey.init(stringValue:) in conformance ParseStateXPC.CodingKeys@<X0>(Swift::String a1@<X1:X0>, unsigned char *a2@<X8>)
{
  unint64_t result = specialized ParseStateXPC.CodingKeys.init(rawValue:)(a1);
  *a2 = result;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance ParseStateXPC.CodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 8;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ParseStateXPC.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ParseStateXPC.CodingKeys and conformance ParseStateXPC.CodingKeys();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ParseStateXPC.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type ParseStateXPC.CodingKeys and conformance ParseStateXPC.CodingKeys();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance ParseStateXPC.Base(char *a1, char *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance ParseStateXPC.Base()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance ParseStateXPC.Base()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ParseStateXPC.Base()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance ParseStateXPC.Base@<X0>(Swift::String *a1@<X0>, char *a2@<X8>)
{
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of ParseStateXPC.Base.init(rawValue:), *a1);
  uint64_t result = swift_bridgeObjectRelease();
  if (v3 == 1) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  if (!v3) {
    char v5 = 0;
  }
  *a2 = v5;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance ParseStateXPC.Base(uint64_t *a1@<X8>)
{
  uint64_t v2 = 25458;
  if (*v1) {
    uint64_t v2 = 7369332;
  }
  unint64_t v3 = 0xE200000000000000;
  if (*v1) {
    unint64_t v3 = 0xE300000000000000;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t protocol witness for Decodable.init(from:) in conformance ParseStateXPC.Base()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t protocol witness for Encodable.encode(to:) in conformance ParseStateXPC.Base()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t ParseStateXPC.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v79 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for TCUMappedNLResponse?);
  MEMORY[0x1F4188790](v3 - 8);
  unint64_t v80 = (unint64_t)&v63 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for BinaryDecodingOptions();
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v75 = (char *)&v63 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UserParse?);
  MEMORY[0x1F4188790](v7 - 8);
  long long v76 = (char *)&v63 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Siri_Nlu_External_UserParse();
  uint64_t v77 = *(void *)(v9 - 8);
  uint64_t v78 = v9;
  uint64_t v10 = MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&v63 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10);
  id v14 = (char *)&v63 - v13;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ParseStateXPC.CodingKeys>);
  uint64_t v81 = *(void *)(v15 - 8);
  MEMORY[0x1F4188790](v15);
  uint64_t v17 = (char *)&v63 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for ParseStateXPC(0);
  MEMORY[0x1F4188790](v18);
  uint64_t v20 = (uint64_t *)((char *)&v63 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v21 = a1[3];
  id v82 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v21);
  lazy protocol witness table accessor for type ParseStateXPC.CodingKeys and conformance ParseStateXPC.CodingKeys();
  uint64_t v22 = v88;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v22)
  {
    uint64_t v25 = (uint64_t)v82;
  }
  else
  {
    uint64_t v23 = v80;
    uint64_t v73 = v20;
    Class v74 = v14;
    os_log_t v88 = v12;
    LOBYTE(v86) = 0;
    lazy protocol witness table accessor for type ParseStateXPC.Base and conformance ParseStateXPC.Base();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    uint64_t v24 = v17;
    if (v83)
    {
      LOBYTE(v83) = 4;
      uint64_t v27 = KeyedDecodingContainer.decode(_:forKey:)();
      uint64_t v29 = v28;
      LOBYTE(v83) = 5;
      uint64_t v30 = KeyedDecodingContainer.decode(_:forKey:)();
      uint64_t v37 = v36;
      os_log_t v88 = (char *)v30;
      type metadata accessor for TCUMappedNLResponse();
      LOBYTE(v83) = 6;
      lazy protocol witness table accessor for type ParseStateXPC and conformance ParseStateXPC(&lazy protocol witness table cache variable for type TCUMappedNLResponse and conformance TCUMappedNLResponse, MEMORY[0x1E4FA25B0]);
      KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
      LOBYTE(v83) = 7;
      char v55 = KeyedDecodingContainer.decode(_:forKey:)();
      (*(void (**)(char *, uint64_t))(v81 + 8))(v24, v15);
      uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for (id: String, tcuId: String, response: TCUMappedNLResponse?, hasTTResponse: Bool));
      uint64_t v57 = v73;
      uint64_t v58 = (uint64_t)v73 + *(int *)(v56 + 64);
      uint64_t v59 = *(int *)(v56 + 80);
      uint64_t *v73 = v27;
      v57[1] = v29;
      uint64_t v60 = (uint64_t)v57;
      v57[2] = (uint64_t)v88;
      v57[3] = v37;
      outlined init with take of TCUMappedNLResponse?(v23, v58);
      *(unsigned char *)(v60 + v59) = v55 & 1;
      swift_storeEnumTagMultiPayload();
      uint64_t v61 = v79;
    }
    else
    {
      LOBYTE(v83) = 1;
      uint64_t v31 = KeyedDecodingContainer.decode(_:forKey:)();
      uint64_t v32 = v15;
      uint64_t v61 = v79;
      uint64_t v33 = v31;
      uint64_t v35 = v34;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Data]);
      LOBYTE(v86) = 2;
      lazy protocol witness table accessor for type [Data] and conformance <A> [A]((unint64_t *)&lazy protocol witness table cache variable for type [Data] and conformance <A> [A], (void (*)(void))lazy protocol witness table accessor for type Data and conformance Data);
      KeyedDecodingContainer.decode<A>(_:forKey:)();
      uint64_t v66 = v17;
      uint64_t v63 = v18;
      uint64_t v64 = v33;
      uint64_t v65 = v35;
      uint64_t v68 = v32;
      uint64_t v38 = *(void *)(v83 + 16);
      uint64_t v67 = v83;
      if (v38)
      {
        uint64_t v39 = v78;
        long long v71 = (void (**)(char *, void, uint64_t, uint64_t))(v77 + 56);
        uint64_t v72 = (void (**)(char *, char *, uint64_t))(v77 + 32);
        uint64_t v69 = v77 + 8;
        long long v70 = (void (**)(char *, char *, uint64_t))(v77 + 16);
        uint64_t v40 = (unint64_t *)(v83 + 40);
        unint64_t v41 = MEMORY[0x1E4FBC860];
        do
        {
          uint64_t v43 = *(v40 - 1);
          unint64_t v42 = *v40;
          uint64_t v86 = v43;
          unint64_t v87 = v42;
          uint64_t v85 = 0;
          long long v83 = 0u;
          long long v84 = 0u;
          outlined copy of Data._Representation(v43, v42);
          unint64_t v80 = v42;
          outlined copy of Data._Representation(v43, v42);
          BinaryDecodingOptions.init()();
          lazy protocol witness table accessor for type ParseStateXPC and conformance ParseStateXPC(&lazy protocol witness table cache variable for type Siri_Nlu_External_UserParse and conformance Siri_Nlu_External_UserParse, MEMORY[0x1E4FA2808]);
          int v44 = v76;
          Message.init<A>(contiguousBytes:extensions:partial:options:)();
          (*v71)(v44, 0, 1, v39);
          char v45 = v74;
          uint64_t v46 = *v72;
          (*v72)(v74, v44, v39);
          (*v70)(v88, v45, v39);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            unint64_t v41 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(v41 + 16) + 1, 1, v41);
          }
          unint64_t v48 = *(void *)(v41 + 16);
          unint64_t v47 = *(void *)(v41 + 24);
          if (v48 >= v47 >> 1) {
            unint64_t v41 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v47 > 1, v48 + 1, 1, v41);
          }
          v40 += 2;
          *(void *)(v41 + 16) = v48 + 1;
          uint64_t v49 = v77;
          unint64_t v50 = v41
              + ((*(unsigned __int8 *)(v49 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80))
              + *(void *)(v77 + 72) * v48;
          uint64_t v39 = v78;
          v46((char *)v50, v88, v78);
          outlined consume of Data._Representation(v43, v80);
          (*(void (**)(char *, uint64_t))(v49 + 8))(v74, v39);
          --v38;
          uint64_t v61 = v79;
        }
        while (v38);
      }
      else
      {
        unint64_t v41 = MEMORY[0x1E4FBC860];
      }
      swift_bridgeObjectRelease();
      LOBYTE(v83) = 3;
      uint64_t v51 = v68;
      uint64_t v52 = v66;
      char v53 = KeyedDecodingContainer.decode(_:forKey:)();
      (*(void (**)(char *, uint64_t))(v81 + 8))(v52, v51);
      uint64_t v60 = (uint64_t)v73;
      uint64_t v54 = v65;
      uint64_t *v73 = v64;
      *(void *)(v60 + 8) = v54;
      *(void *)(v60 + 16) = v41;
      *(unsigned char *)(v60 + 24) = v53 & 1;
      swift_storeEnumTagMultiPayload();
    }
    uint64_t v62 = (uint64_t)v82;
    outlined init with take of ParseStateXPC(v60, v61);
    uint64_t v25 = v62;
  }
  return __swift_destroy_boxed_opaque_existential_1(v25);
}

unint64_t lazy protocol witness table accessor for type ParseStateXPC.CodingKeys and conformance ParseStateXPC.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type ParseStateXPC.CodingKeys and conformance ParseStateXPC.CodingKeys;
  if (!lazy protocol witness table cache variable for type ParseStateXPC.CodingKeys and conformance ParseStateXPC.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ParseStateXPC.CodingKeys and conformance ParseStateXPC.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ParseStateXPC.CodingKeys and conformance ParseStateXPC.CodingKeys;
  if (!lazy protocol witness table cache variable for type ParseStateXPC.CodingKeys and conformance ParseStateXPC.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ParseStateXPC.CodingKeys and conformance ParseStateXPC.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ParseStateXPC.CodingKeys and conformance ParseStateXPC.CodingKeys;
  if (!lazy protocol witness table cache variable for type ParseStateXPC.CodingKeys and conformance ParseStateXPC.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ParseStateXPC.CodingKeys and conformance ParseStateXPC.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ParseStateXPC.CodingKeys and conformance ParseStateXPC.CodingKeys;
  if (!lazy protocol witness table cache variable for type ParseStateXPC.CodingKeys and conformance ParseStateXPC.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ParseStateXPC.CodingKeys and conformance ParseStateXPC.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ParseStateXPC.Base and conformance ParseStateXPC.Base()
{
  unint64_t result = lazy protocol witness table cache variable for type ParseStateXPC.Base and conformance ParseStateXPC.Base;
  if (!lazy protocol witness table cache variable for type ParseStateXPC.Base and conformance ParseStateXPC.Base)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ParseStateXPC.Base and conformance ParseStateXPC.Base);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ParseStateXPC.Base and conformance ParseStateXPC.Base;
  if (!lazy protocol witness table cache variable for type ParseStateXPC.Base and conformance ParseStateXPC.Base)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ParseStateXPC.Base and conformance ParseStateXPC.Base);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ParseStateXPC.Base and conformance ParseStateXPC.Base;
  if (!lazy protocol witness table cache variable for type ParseStateXPC.Base and conformance ParseStateXPC.Base)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ParseStateXPC.Base and conformance ParseStateXPC.Base);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type ParseStateXPC.Base and conformance ParseStateXPC.Base;
  if (!lazy protocol witness table cache variable for type ParseStateXPC.Base and conformance ParseStateXPC.Base)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ParseStateXPC.Base and conformance ParseStateXPC.Base);
  }
  return result;
}

uint64_t ParseStateXPC.encode(to:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for TCUMappedNLResponse?);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for Siri_Nlu_External_UserParse();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v45 = v7;
  uint64_t v46 = v8;
  MEMORY[0x1F4188790](v7);
  int v44 = (char *)v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for ParseStateXPC(0);
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (char *)v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ParseStateXPC.CodingKeys>);
  uint64_t v47 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790](v13);
  uint64_t v15 = (char *)v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type ParseStateXPC.CodingKeys and conformance ParseStateXPC.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  outlined init with copy of ParseStateXPC(v2, (uint64_t)v12);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v46 = *((void *)v12 + 2);
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for (id: String, tcuId: String, response: TCUMappedNLResponse?, hasTTResponse: Bool));
    uint64_t v17 = (uint64_t)&v12[*(int *)(v16 + 64)];
    int v18 = v12[*(int *)(v16 + 80)];
    outlined init with take of TCUMappedNLResponse?(v17, (uint64_t)v6);
    LOBYTE(v49) = 1;
    char v50 = 0;
    lazy protocol witness table accessor for type ParseStateXPC.Base and conformance ParseStateXPC.Base();
    uint64_t v19 = v48;
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    if (v19)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      LODWORD(v48) = v18;
      LOBYTE(v49) = 4;
      KeyedEncodingContainer.encode(_:forKey:)();
      swift_bridgeObjectRelease();
      LOBYTE(v49) = 5;
      KeyedEncodingContainer.encode(_:forKey:)();
      swift_bridgeObjectRelease();
      LOBYTE(v49) = 6;
      type metadata accessor for TCUMappedNLResponse();
      lazy protocol witness table accessor for type ParseStateXPC and conformance ParseStateXPC(&lazy protocol witness table cache variable for type TCUMappedNLResponse and conformance TCUMappedNLResponse, MEMORY[0x1E4FA25B0]);
      KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
      LOBYTE(v49) = 7;
      KeyedEncodingContainer.encode(_:forKey:)();
    }
    outlined destroy of MediaUserStateCenter?((uint64_t)v6, (uint64_t *)&demangling cache variable for type metadata for TCUMappedNLResponse?);
    return (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v15, v13);
  }
  else
  {
    uint64_t v21 = *((void *)v12 + 2);
    LOBYTE(v49) = 0;
    char v50 = 0;
    lazy protocol witness table accessor for type ParseStateXPC.Base and conformance ParseStateXPC.Base();
    uint64_t v22 = v48;
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    if (v22)
    {
      (*(void (**)(char *, uint64_t))(v47 + 8))(v15, v13);
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
    else
    {
      LOBYTE(v49) = 1;
      KeyedEncodingContainer.encode(_:forKey:)();
      swift_bridgeObjectRelease();
      LOBYTE(v49) = 3;
      KeyedEncodingContainer.encode(_:forKey:)();
      uint64_t v40 = v15;
      uint64_t v41 = v13;
      uint64_t v23 = *(void *)(v21 + 16);
      if (v23)
      {
        uint64_t v24 = v46 + 16;
        unint64_t v48 = *(void (**)(void, void, void))(v46 + 16);
        uint64_t v25 = v21 + ((*(unsigned __int8 *)(v46 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v46 + 80));
        uint64_t v26 = *(void *)(v46 + 72);
        unint64_t v42 = (void (**)(char *, uint64_t))(v46 + 8);
        uint64_t v43 = v26;
        v39[1] = v21;
        swift_bridgeObjectRetain();
        uint64_t v27 = (void *)MEMORY[0x1E4FBC860];
        uint64_t v28 = v44;
        uint64_t v29 = v45;
        uint64_t v46 = v24;
        do
        {
          v48(v28, v25, v29);
          lazy protocol witness table accessor for type ParseStateXPC and conformance ParseStateXPC(&lazy protocol witness table cache variable for type Siri_Nlu_External_UserParse and conformance Siri_Nlu_External_UserParse, MEMORY[0x1E4FA2808]);
          uint64_t v30 = Message.serializedData(partial:)();
          uint64_t v32 = v31;
          (*v42)(v28, v29);
          uint64_t v33 = v27;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v33 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v27[2] + 1, 1, v27);
          }
          unint64_t v35 = v33[2];
          unint64_t v34 = v33[3];
          uint64_t v27 = v33;
          if (v35 >= v34 >> 1) {
            uint64_t v27 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v34 > 1), v35 + 1, 1, v33);
          }
          void v27[2] = v35 + 1;
          uint64_t v36 = &v27[2 * v35];
          v36[4] = v30;
          v36[5] = v32;
          uint64_t v29 = v45;
          v25 += v43;
          --v23;
        }
        while (v23);
        swift_bridgeObjectRelease_n();
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v27 = (void *)MEMORY[0x1E4FBC860];
      }
      uint64_t v49 = v27;
      char v50 = 2;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Data]);
      lazy protocol witness table accessor for type [Data] and conformance <A> [A]((unint64_t *)&lazy protocol witness table cache variable for type [Data] and conformance <A> [A], (void (*)(void))lazy protocol witness table accessor for type Data and conformance Data);
      uint64_t v37 = v40;
      uint64_t v38 = v41;
      KeyedEncodingContainer.encode<A>(_:forKey:)();
      swift_bridgeObjectRelease();
      return (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v37, v38);
    }
  }
}

uint64_t specialized static Array<A>.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Siri_Nlu_External_UserParse();
  uint64_t v5 = MEMORY[0x1F4188790](v4);
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v28 - v8;
  uint64_t v10 = *(void *)(a1 + 16);
  if (v10 == *(void *)(a2 + 16))
  {
    if (!v10 || a1 == a2)
    {
      char v23 = 1;
    }
    else
    {
      uint64_t v11 = *(unsigned __int8 *)(v6 + 80);
      uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
      uint64_t v12 = v6 + 16;
      uint64_t v31 = v7;
      uint64_t v32 = v13;
      uint64_t v14 = (v11 + 32) & ~v11;
      uint64_t v15 = *(void *)(v12 + 56);
      uint64_t v33 = v12;
      uint64_t v29 = v15;
      uint64_t v30 = (void (**)(uint64_t, uint64_t))(v12 - 8);
      uint64_t v16 = v10 - 1;
      uint64_t v17 = v7;
      do
      {
        uint64_t v18 = a1;
        uint64_t v19 = v9;
        uint64_t v20 = v9;
        uint64_t v21 = v32;
        v32((uint64_t)v19, a1 + v14, v4);
        uint64_t v22 = a2;
        v21(v17, a2 + v14, v4);
        uint64_t v9 = v20;
        lazy protocol witness table accessor for type ParseStateXPC and conformance ParseStateXPC(&lazy protocol witness table cache variable for type Siri_Nlu_External_UserParse and conformance Siri_Nlu_External_UserParse, MEMORY[0x1E4FA2808]);
        char v23 = dispatch thunk of static Equatable.== infix(_:_:)();
        uint64_t v24 = *v30;
        (*v30)(v17, v4);
        v24((uint64_t)v20, v4);
        BOOL v26 = v16-- != 0;
        if ((v23 & 1) == 0) {
          break;
        }
        v14 += v29;
        a2 = v22;
        a1 = v18;
      }
      while (v26);
    }
  }
  else
  {
    char v23 = 0;
  }
  return v23 & 1;
}

uint64_t protocol witness for Decodable.init(from:) in conformance ParseStateXPC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return ParseStateXPC.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance ParseStateXPC(void *a1)
{
  return ParseStateXPC.encode(to:)(a1);
}

uint64_t static NLParseResponse.== infix(_:_:)()
{
  uint64_t v0 = type metadata accessor for Siri_Nlu_External_ResponseStatus.StatusCode();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x1F4188790](v0);
  uint64_t v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v2);
  uint64_t v6 = (char *)v14 - v5;
  NLParseResponse.responseStatusCode.getter();
  NLParseResponse.responseStatusCode.getter();
  lazy protocol witness table accessor for type ParseStateXPC and conformance ParseStateXPC((unint64_t *)&lazy protocol witness table cache variable for type Siri_Nlu_External_ResponseStatus.StatusCode and conformance Siri_Nlu_External_ResponseStatus.StatusCode, MEMORY[0x1E4FA2880]);
  dispatch thunk of RawRepresentable.rawValue.getter();
  dispatch thunk of RawRepresentable.rawValue.getter();
  uint64_t v8 = v14[0];
  uint64_t v7 = v14[1];
  uint64_t v9 = *(void (**)(char *, uint64_t))(v1 + 8);
  v9(v4, v0);
  v9(v6, v0);
  if (v7 == v8)
  {
    uint64_t v10 = NLParseResponse.userParses.getter();
    uint64_t v11 = NLParseResponse.userParses.getter();
    char v12 = specialized static Array<A>.== infix(_:_:)(v10, v11);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v12 = 0;
  }
  return v12 & 1;
}

uint64_t key path setter for PommesSearchRequestXPCBuilder.domain : PommesSearchRequestXPCBuilder(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = *a2;
  swift_beginAccess();
  *(void *)(v4 + 16) = v3;
  *(void *)(v4 + 24) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t PommesSearchRequestXPCBuilder.domain.getter()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t key path setter for PommesSearchRequestXPCBuilder.assistantId : PommesSearchRequestXPCBuilder(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = *a2;
  swift_beginAccess();
  *(void *)(v4 + 32) = v3;
  *(void *)(v4 + 40) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t PommesSearchRequestXPCBuilder.assistantId.getter()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t key path setter for PommesSearchRequestXPCBuilder.requestId : PommesSearchRequestXPCBuilder(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = *a2;
  swift_beginAccess();
  *(void *)(v4 + 48) = v3;
  *(void *)(v4 + 56) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t PommesSearchRequestXPCBuilder.requestId.getter()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t key path setter for PommesSearchRequestXPCBuilder.parseState : PommesSearchRequestXPCBuilder(uint64_t a1, void *a2)
{
  uint64_t v4 = type metadata accessor for ParseStateXPC(0);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of ParseStateXPC(a1, (uint64_t)v6);
  uint64_t v7 = *a2 + OBJC_IVAR____TtC21SiriInformationSearch29PommesSearchRequestXPCBuilder_parseState;
  swift_beginAccess();
  outlined assign with take of ParseStateXPC((uint64_t)v6, v7);
  return swift_endAccess();
}

uint64_t PommesSearchRequestXPCBuilder.parseState.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC21SiriInformationSearch29PommesSearchRequestXPCBuilder_parseState;
  swift_beginAccess();
  return outlined init with copy of ParseStateXPC(v3, a1);
}

uint64_t key path setter for PommesSearchRequestXPCBuilder.utterance : PommesSearchRequestXPCBuilder(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = (void *)(*a2 + OBJC_IVAR____TtC21SiriInformationSearch29PommesSearchRequestXPCBuilder_utterance);
  swift_beginAccess();
  *uint64_t v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t PommesSearchRequestXPCBuilder.utterance.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch29PommesSearchRequestXPCBuilder_utterance);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t PommesSearchRequestXPCBuilder.listenAfterSpeaking.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtC21SiriInformationSearch29PommesSearchRequestXPCBuilder_listenAfterSpeaking);
  swift_beginAccess();
  return *v1;
}

uint64_t PommesSearchRequestXPCBuilder.isMultiUser.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch29PommesSearchRequestXPCBuilder_isMultiUser);
  swift_beginAccess();
  return *v1;
}

uint64_t PommesSearchRequestXPCBuilder.audioSource.getter()
{
  return PommesSearchRequestXPCBuilder.audioSource.getter(&OBJC_IVAR____TtC21SiriInformationSearch29PommesSearchRequestXPCBuilder_audioSource);
}

uint64_t PommesSearchRequestXPCBuilder.audioDestination.getter()
{
  return PommesSearchRequestXPCBuilder.audioSource.getter(&OBJC_IVAR____TtC21SiriInformationSearch29PommesSearchRequestXPCBuilder_audioDestination);
}

uint64_t key path setter for PommesSearchRequestXPCBuilder.audioSource : PommesSearchRequestXPCBuilder(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v6 = *a1;
  uint64_t v5 = a1[1];
  uint64_t v7 = (void *)(*a2 + *a5);
  swift_beginAccess();
  *uint64_t v7 = v6;
  v7[1] = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t PommesSearchRequestXPCBuilder.responseMode.getter()
{
  return PommesSearchRequestXPCBuilder.audioSource.getter(&OBJC_IVAR____TtC21SiriInformationSearch29PommesSearchRequestXPCBuilder_responseMode);
}

uint64_t PommesSearchRequestXPCBuilder.audioSource.getter(void *a1)
{
  uint64_t v2 = (uint64_t *)(v1 + *a1);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t PommesSearchRequestXPCBuilder.isEyesFree.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch29PommesSearchRequestXPCBuilder_isEyesFree);
  swift_beginAccess();
  return *v1;
}

uint64_t PommesSearchRequestXPCBuilder.isVoiceTriggerEnabled.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtC21SiriInformationSearch29PommesSearchRequestXPCBuilder_isVoiceTriggerEnabled);
  swift_beginAccess();
  return *v1;
}

uint64_t PommesSearchRequestXPCBuilder.isTextToSpeechEnabled.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtC21SiriInformationSearch29PommesSearchRequestXPCBuilder_isTextToSpeechEnabled);
  swift_beginAccess();
  return *v1;
}

uint64_t PommesSearchRequestXPCBuilder.isTriggerlessFollowup.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtC21SiriInformationSearch29PommesSearchRequestXPCBuilder_isTriggerlessFollowup);
  swift_beginAccess();
  return *v1;
}

uint64_t PommesSearchRequestXPCBuilder.isPushOffRequest.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC21SiriInformationSearch29PommesSearchRequestXPCBuilder_isPushOffRequest);
  swift_beginAccess();
  return *v1;
}

uint64_t key path setter for PommesSearchRequestXPCBuilder.deviceRestrictions : PommesSearchRequestXPCBuilder(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a2 + OBJC_IVAR____TtC21SiriInformationSearch29PommesSearchRequestXPCBuilder_deviceRestrictions);
  swift_beginAccess();
  *uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t PommesSearchRequestXPCBuilder.deviceRestrictions.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PommesSearchRequestXPCBuilder.__allocating_init(domain:assistantId:requestId:parseState:utterance:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v17 = swift_allocObject();
  PommesSearchRequestXPCBuilder.init(domain:assistantId:requestId:parseState:utterance:)(a1, a2, a3, a4, a5, a6, a7, a8, a9);
  return v17;
}

void *PommesSearchRequestXPCBuilder.init(domain:assistantId:requestId:parseState:utterance:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  char v12 = (void *)((char *)v9 + OBJC_IVAR____TtC21SiriInformationSearch29PommesSearchRequestXPCBuilder_audioSource);
  void *v12 = 0;
  v12[1] = 0;
  uint64_t v13 = (void *)((char *)v9 + OBJC_IVAR____TtC21SiriInformationSearch29PommesSearchRequestXPCBuilder_audioDestination);
  *uint64_t v13 = 0;
  v13[1] = 0;
  uint64_t v14 = (void *)((char *)v9 + OBJC_IVAR____TtC21SiriInformationSearch29PommesSearchRequestXPCBuilder_responseMode);
  *uint64_t v14 = 0;
  v14[1] = 0;
  v9[2] = a1;
  v9[3] = a2;
  v9[4] = a3;
  v9[5] = a4;
  v9[6] = a5;
  v9[7] = a6;
  outlined init with copy of ParseStateXPC(a7, (uint64_t)v9 + OBJC_IVAR____TtC21SiriInformationSearch29PommesSearchRequestXPCBuilder_parseState);
  uint64_t v15 = (void *)((char *)v9 + OBJC_IVAR____TtC21SiriInformationSearch29PommesSearchRequestXPCBuilder_utterance);
  *uint64_t v15 = a8;
  v15[1] = a9;
  *((unsigned char *)v9 + OBJC_IVAR____TtC21SiriInformationSearch29PommesSearchRequestXPCBuilder_listenAfterSpeaking) = 0;
  *((unsigned char *)v9 + OBJC_IVAR____TtC21SiriInformationSearch29PommesSearchRequestXPCBuilder_isMultiUser) = 0;
  swift_beginAccess();
  void *v12 = 0;
  v12[1] = 0;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *uint64_t v13 = 0;
  v13[1] = 0;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *uint64_t v14 = 0;
  v14[1] = 0;
  swift_bridgeObjectRelease();
  *((unsigned char *)v9 + OBJC_IVAR____TtC21SiriInformationSearch29PommesSearchRequestXPCBuilder_isEyesFree) = 0;
  *((unsigned char *)v9 + OBJC_IVAR____TtC21SiriInformationSearch29PommesSearchRequestXPCBuilder_isVoiceTriggerEnabled) = 0;
  *((unsigned char *)v9 + OBJC_IVAR____TtC21SiriInformationSearch29PommesSearchRequestXPCBuilder_isTextToSpeechEnabled) = 0;
  *((unsigned char *)v9 + OBJC_IVAR____TtC21SiriInformationSearch29PommesSearchRequestXPCBuilder_isTriggerlessFollowup) = 0;
  *((unsigned char *)v9 + OBJC_IVAR____TtC21SiriInformationSearch29PommesSearchRequestXPCBuilder_isPushOffRequest) = 0;
  outlined destroy of ParseStateXPC(a7);
  *(void *)((char *)v9 + OBJC_IVAR____TtC21SiriInformationSearch29PommesSearchRequestXPCBuilder_deviceRestrictions) = MEMORY[0x1E4FBC860];
  return v9;
}

uint64_t PommesSearchRequestXPCBuilder.withListenAfterSpeaking(_:)(char a1)
{
  return PommesSearchRequestXPCBuilder.withListenAfterSpeaking(_:)(a1, &OBJC_IVAR____TtC21SiriInformationSearch29PommesSearchRequestXPCBuilder_listenAfterSpeaking);
}

uint64_t PommesSearchRequestXPCBuilder.withIsMultiUser(_:)(char a1)
{
  return PommesSearchRequestXPCBuilder.withListenAfterSpeaking(_:)(a1, &OBJC_IVAR____TtC21SiriInformationSearch29PommesSearchRequestXPCBuilder_isMultiUser);
}

uint64_t PommesSearchRequestXPCBuilder.withAudioSource(_:)(uint64_t a1, uint64_t a2)
{
  return PommesSearchRequestXPCBuilder.withAudioSource(_:)(a1, a2, &OBJC_IVAR____TtC21SiriInformationSearch29PommesSearchRequestXPCBuilder_audioSource);
}

uint64_t PommesSearchRequestXPCBuilder.withAudioDestination(_:)(uint64_t a1, uint64_t a2)
{
  return PommesSearchRequestXPCBuilder.withAudioSource(_:)(a1, a2, &OBJC_IVAR____TtC21SiriInformationSearch29PommesSearchRequestXPCBuilder_audioDestination);
}

uint64_t PommesSearchRequestXPCBuilder.withResponseMode(_:)(uint64_t a1, uint64_t a2)
{
  return PommesSearchRequestXPCBuilder.withAudioSource(_:)(a1, a2, &OBJC_IVAR____TtC21SiriInformationSearch29PommesSearchRequestXPCBuilder_responseMode);
}

uint64_t PommesSearchRequestXPCBuilder.withAudioSource(_:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = (void *)(v3 + *a3);
  swift_beginAccess();
  *uint64_t v6 = a1;
  v6[1] = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_retain();
}

uint64_t PommesSearchRequestXPCBuilder.withIsEyesFree(_:)(char a1)
{
  return PommesSearchRequestXPCBuilder.withListenAfterSpeaking(_:)(a1, &OBJC_IVAR____TtC21SiriInformationSearch29PommesSearchRequestXPCBuilder_isEyesFree);
}

uint64_t PommesSearchRequestXPCBuilder.withIsVoiceTriggerEnabled(_:)(char a1)
{
  return PommesSearchRequestXPCBuilder.withListenAfterSpeaking(_:)(a1, &OBJC_IVAR____TtC21SiriInformationSearch29PommesSearchRequestXPCBuilder_isVoiceTriggerEnabled);
}

uint64_t PommesSearchRequestXPCBuilder.withIsTextToSpeechEnabled(_:)(char a1)
{
  return PommesSearchRequestXPCBuilder.withListenAfterSpeaking(_:)(a1, &OBJC_IVAR____TtC21SiriInformationSearch29PommesSearchRequestXPCBuilder_isTextToSpeechEnabled);
}

uint64_t PommesSearchRequestXPCBuilder.withIsTriggerlessFollowup(_:)(char a1)
{
  return PommesSearchRequestXPCBuilder.withListenAfterSpeaking(_:)(a1, &OBJC_IVAR____TtC21SiriInformationSearch29PommesSearchRequestXPCBuilder_isTriggerlessFollowup);
}

uint64_t PommesSearchRequestXPCBuilder.withIsPushOffRequest(_:)(char a1)
{
  return PommesSearchRequestXPCBuilder.withListenAfterSpeaking(_:)(a1, &OBJC_IVAR____TtC21SiriInformationSearch29PommesSearchRequestXPCBuilder_isPushOffRequest);
}

uint64_t PommesSearchRequestXPCBuilder.withListenAfterSpeaking(_:)(char a1, void *a2)
{
  uint64_t v4 = (unsigned char *)(v2 + *a2);
  swift_beginAccess();
  *uint64_t v4 = a1;
  return swift_retain();
}

uint64_t PommesSearchRequestXPCBuilder.withDeviceRestrictions(_:)(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC21SiriInformationSearch29PommesSearchRequestXPCBuilder_deviceRestrictions);
  swift_beginAccess();
  *uint64_t v3 = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_retain();
}

id PommesSearchRequestXPCBuilder.build()()
{
  uint64_t v1 = type metadata accessor for ParseStateXPC(0);
  uint64_t v2 = MEMORY[0x1F4188790](v1 - 8);
  uint64_t v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)v0 + 208))(v2);
  uint64_t v41 = v6;
  uint64_t v42 = v5;
  int v40 = (*(uint64_t (**)(void))(*(void *)v0 + 328))();
  uint64_t v7 = (*(uint64_t (**)(void))(*(void *)v0 + 232))();
  uint64_t v38 = v8;
  uint64_t v39 = v7;
  uint64_t v9 = (*(uint64_t (**)(void))(*(void *)v0 + 256))();
  uint64_t v36 = v10;
  uint64_t v37 = v9;
  int v35 = (*(uint64_t (**)(void))(*(void *)v0 + 352))();
  uint64_t v11 = (*(uint64_t (**)(void))(*(void *)v0 + 280))();
  uint64_t v12 = (*(uint64_t (**)(uint64_t))(*(void *)v0 + 304))(v11);
  uint64_t v33 = v13;
  uint64_t v34 = v12;
  uint64_t v14 = (*(uint64_t (**)(void))(*(void *)v0 + 376))();
  uint64_t v31 = v15;
  uint64_t v32 = v14;
  uint64_t v30 = (*(uint64_t (**)(void))(*(void *)v0 + 400))();
  uint64_t v17 = v16;
  uint64_t v18 = (*(uint64_t (**)(void))(*(void *)v0 + 424))();
  uint64_t v20 = v19;
  char v21 = (*(uint64_t (**)(void))(*(void *)v0 + 448))();
  char v22 = (*(uint64_t (**)(void))(*(void *)v0 + 472))();
  char v23 = (*(uint64_t (**)(void))(*(void *)v0 + 496))();
  char v24 = (*(uint64_t (**)(void))(*(void *)v0 + 520))();
  char v25 = (*(uint64_t (**)(void))(*(void *)v0 + 544))();
  uint64_t v26 = (*(uint64_t (**)(void))(*(void *)v0 + 568))();
  id v27 = objc_allocWithZone((Class)type metadata accessor for PommesSearchRequestXPC(0));
  return PommesSearchRequestXPC.init(domain:listenAfterSpeaking:assistantId:requestId:isMultiUser:parseState:utterance:audioSource:audioDestination:responseMode:isEyesFree:isVoiceTriggerEnabled:isTextToSpeechEnabled:isTriggerlessFollowup:isPushOffRequest:deviceRestrictions:)(v42, v41, v40 & 1, v39, v38, v37, v36, v35 & 1, (uint64_t)v4, v34, v33, v32, v31, v30, v17, v18, v20, v21 & 1, v22 & 1,
           v23 & 1,
           v24 & 1,
           v25 & 1,
           v26);
}

uint64_t PommesSearchRequestXPCBuilder.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of ParseStateXPC(v0 + OBJC_IVAR____TtC21SiriInformationSearch29PommesSearchRequestXPCBuilder_parseState);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t PommesSearchRequestXPCBuilder.__deallocating_deinit()
{
  PommesSearchRequestXPCBuilder.deinit();

  return swift_deallocClassInstance();
}

uint64_t lazy protocol witness table accessor for type [Data] and conformance <A> [A](unint64_t *a1, void (*a2)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [Data]);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t specialized static ParseStateXPC.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for TCUMappedNLResponse?);
  uint64_t v5 = MEMORY[0x1F4188790](v4 - 8);
  uint64_t v7 = (char *)&v97 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x1F4188790](v5);
  uint64_t v10 = (char *)&v97 - v9;
  uint64_t v11 = MEMORY[0x1F4188790](v8);
  uint64_t v107 = (uint64_t)&v97 - v12;
  uint64_t v13 = MEMORY[0x1F4188790](v11);
  uint64_t v15 = (char *)&v97 - v14;
  uint64_t v16 = MEMORY[0x1F4188790](v13);
  uint64_t v105 = (uint64_t)&v97 - v17;
  uint64_t v18 = MEMORY[0x1F4188790](v16);
  uint64_t v106 = (uint64_t)&v97 - v19;
  uint64_t v20 = MEMORY[0x1F4188790](v18);
  uint64_t v111 = (uint64_t)&v97 - v21;
  uint64_t v22 = MEMORY[0x1F4188790](v20);
  uint64_t v108 = (uint64_t)&v97 - v23;
  uint64_t v24 = MEMORY[0x1F4188790](v22);
  uint64_t v110 = (uint64_t)&v97 - v25;
  MEMORY[0x1F4188790](v24);
  uint64_t v109 = (uint64_t)&v97 - v26;
  uint64_t v27 = type metadata accessor for ParseStateXPC(0);
  uint64_t v28 = MEMORY[0x1F4188790](v27);
  uint64_t v30 = (uint64_t *)((char *)&v97 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1F4188790](v28);
  uint64_t v32 = (char *)&v97 - v31;
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (ParseStateXPC, ParseStateXPC));
  uint64_t v34 = MEMORY[0x1F4188790](v33 - 8);
  uint64_t v36 = (char *)&v97 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = &v36[*(int *)(v34 + 56)];
  outlined init with copy of ParseStateXPC(a1, (uint64_t)v36);
  outlined init with copy of ParseStateXPC(a2, (uint64_t)v37);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v101 = v7;
    v102 = v10;
    v104 = v15;
    outlined init with copy of ParseStateXPC((uint64_t)v36, (uint64_t)v30);
    uint64_t v39 = *v30;
    uint64_t v38 = v30[1];
    uint64_t v40 = v30[3];
    uint64_t v103 = v30[2];
    uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for (id: String, tcuId: String, response: TCUMappedNLResponse?, hasTTResponse: Bool));
    uint64_t v42 = *(int *)(v41 + 64);
    uint64_t v43 = (uint64_t)v30 + v42;
    uint64_t v44 = *(int *)(v41 + 80);
    int v45 = *((unsigned __int8 *)v30 + v44);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      int v98 = v45;
      uint64_t v46 = *(void *)v37;
      uint64_t v47 = *((void *)v37 + 1);
      uint64_t v48 = (uint64_t)&v37[v42];
      uint64_t v49 = *((void *)v37 + 3);
      uint64_t v99 = *((void *)v37 + 2);
      uint64_t v100 = v49;
      int v50 = v37[v44];
      uint64_t v51 = v109;
      outlined init with take of TCUMappedNLResponse?(v43, v109);
      uint64_t v52 = v110;
      outlined init with take of TCUMappedNLResponse?(v48, v110);
      if (v39 == v46 && v38 == v47)
      {
        swift_bridgeObjectRelease_n();
        uint64_t v53 = (uint64_t)v104;
      }
      else
      {
        char v65 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v53 = (uint64_t)v104;
        if ((v65 & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v67 = v108;
          outlined init with copy of TCUMappedNLResponse?(v51, v108);
          uint64_t v66 = v111;
          outlined init with copy of TCUMappedNLResponse?(v52, v111);
          goto LABEL_34;
        }
      }
      uint64_t v66 = v111;
      if (v103 == v99 && v40 == v100)
      {
        swift_bridgeObjectRelease_n();
        uint64_t v67 = v108;
        outlined init with copy of TCUMappedNLResponse?(v51, v108);
        outlined init with copy of TCUMappedNLResponse?(v52, v66);
LABEL_22:
        uint64_t v70 = v106;
        outlined init with copy of TCUMappedNLResponse?(v67, v106);
        uint64_t v71 = type metadata accessor for TCUMappedNLResponse();
        uint64_t v72 = *(void *)(v71 - 8);
        uint64_t v73 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v72 + 48);
        int v74 = v73(v70, 1, v71);
        int v97 = v50;
        if (v74 == 1)
        {
          outlined destroy of MediaUserStateCenter?(v70, (uint64_t *)&demangling cache variable for type metadata for TCUMappedNLResponse?);
          uint64_t v75 = 0;
          uint64_t v76 = 0;
        }
        else
        {
          uint64_t v75 = TCUMappedNLResponse.tcuId.getter();
          uint64_t v76 = v77;
          (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v70, v71);
        }
        uint64_t v78 = v105;
        outlined init with copy of TCUMappedNLResponse?(v111, v105);
        int v79 = v73(v78, 1, v71);
        v104 = (char *)v71;
        if (v79 == 1)
        {
          outlined destroy of MediaUserStateCenter?(v78, (uint64_t *)&demangling cache variable for type metadata for TCUMappedNLResponse?);
          if (!v76)
          {
            uint64_t v80 = 0;
            goto LABEL_36;
          }
        }
        else
        {
          uint64_t v81 = TCUMappedNLResponse.tcuId.getter();
          uint64_t v82 = v71;
          uint64_t v83 = v81;
          uint64_t v80 = v84;
          (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v78, v82);
          if (!v76)
          {
LABEL_36:
            uint64_t v52 = v110;
            outlined destroy of MediaUserStateCenter?(v111, (uint64_t *)&demangling cache variable for type metadata for TCUMappedNLResponse?);
            outlined destroy of MediaUserStateCenter?(v108, (uint64_t *)&demangling cache variable for type metadata for TCUMappedNLResponse?);
            uint64_t v51 = v109;
            uint64_t v85 = v107;
            if (v80)
            {
              swift_bridgeObjectRelease();
              goto LABEL_38;
            }
            goto LABEL_43;
          }
          if (v80)
          {
            if (v75 != v83 || v76 != v80)
            {
              char v96 = _stringCompareWithSmolCheck(_:_:expecting:)();
              swift_bridgeObjectRelease();
              outlined destroy of MediaUserStateCenter?(v111, (uint64_t *)&demangling cache variable for type metadata for TCUMappedNLResponse?);
              outlined destroy of MediaUserStateCenter?(v108, (uint64_t *)&demangling cache variable for type metadata for TCUMappedNLResponse?);
              swift_bridgeObjectRelease();
              uint64_t v51 = v109;
              outlined init with copy of TCUMappedNLResponse?(v109, v53);
              uint64_t v52 = v110;
              uint64_t v85 = v107;
              outlined init with copy of TCUMappedNLResponse?(v110, v107);
              if ((v96 & 1) == 0) {
                goto LABEL_39;
              }
LABEL_44:
              uint64_t v87 = (uint64_t)v102;
              outlined init with copy of TCUMappedNLResponse?(v53, (uint64_t)v102);
              os_log_t v88 = v104;
              if (v73(v87, 1, (uint64_t)v104) == 1)
              {
                outlined destroy of MediaUserStateCenter?(v87, (uint64_t *)&demangling cache variable for type metadata for TCUMappedNLResponse?);
                uint64_t v89 = 0;
              }
              else
              {
                uint64_t v89 = (void *)TCUMappedNLResponse.nlResponse.getter();
                (*(void (**)(uint64_t, char *))(v72 + 8))(v87, v88);
              }
              uint64_t v90 = (uint64_t)v101;
              outlined init with copy of TCUMappedNLResponse?(v85, (uint64_t)v101);
              if (v73(v90, 1, (uint64_t)v88) == 1)
              {
                outlined destroy of MediaUserStateCenter?(v90, (uint64_t *)&demangling cache variable for type metadata for TCUMappedNLResponse?);
                if (!v89)
                {
                  uint64_t v91 = 0;
                  goto LABEL_55;
                }
              }
              else
              {
                uint64_t v91 = (void *)TCUMappedNLResponse.nlResponse.getter();
                (*(void (**)(uint64_t, char *))(v72 + 8))(v90, v88);
                if (!v89)
                {
LABEL_55:
                  outlined destroy of MediaUserStateCenter?(v85, (uint64_t *)&demangling cache variable for type metadata for TCUMappedNLResponse?);
                  outlined destroy of MediaUserStateCenter?(v53, (uint64_t *)&demangling cache variable for type metadata for TCUMappedNLResponse?);
                  outlined destroy of MediaUserStateCenter?(v110, (uint64_t *)&demangling cache variable for type metadata for TCUMappedNLResponse?);
                  outlined destroy of MediaUserStateCenter?(v51, (uint64_t *)&demangling cache variable for type metadata for TCUMappedNLResponse?);
                  int v94 = v98;
                  if (v91)
                  {

                    goto LABEL_40;
                  }
                  goto LABEL_59;
                }
                if (v91)
                {
                  type metadata accessor for NLParseResponse();
                  id v92 = v89;
                  char v93 = static NSObject.== infix(_:_:)();
                  outlined destroy of MediaUserStateCenter?(v85, (uint64_t *)&demangling cache variable for type metadata for TCUMappedNLResponse?);
                  outlined destroy of MediaUserStateCenter?(v53, (uint64_t *)&demangling cache variable for type metadata for TCUMappedNLResponse?);
                  outlined destroy of MediaUserStateCenter?(v110, (uint64_t *)&demangling cache variable for type metadata for TCUMappedNLResponse?);
                  outlined destroy of MediaUserStateCenter?(v51, (uint64_t *)&demangling cache variable for type metadata for TCUMappedNLResponse?);

                  int v94 = v98;
                  if ((v93 & 1) == 0) {
                    goto LABEL_40;
                  }
LABEL_59:
                  uint64_t v64 = v94 ^ v97 ^ 1u;
                  goto LABEL_41;
                }
              }
              id v95 = v89;
              outlined destroy of MediaUserStateCenter?(v85, (uint64_t *)&demangling cache variable for type metadata for TCUMappedNLResponse?);
              outlined destroy of MediaUserStateCenter?(v53, (uint64_t *)&demangling cache variable for type metadata for TCUMappedNLResponse?);
              outlined destroy of MediaUserStateCenter?(v110, (uint64_t *)&demangling cache variable for type metadata for TCUMappedNLResponse?);
              outlined destroy of MediaUserStateCenter?(v51, (uint64_t *)&demangling cache variable for type metadata for TCUMappedNLResponse?);

              goto LABEL_40;
            }
            swift_bridgeObjectRelease();
            outlined destroy of MediaUserStateCenter?(v111, (uint64_t *)&demangling cache variable for type metadata for TCUMappedNLResponse?);
            outlined destroy of MediaUserStateCenter?(v108, (uint64_t *)&demangling cache variable for type metadata for TCUMappedNLResponse?);
            swift_bridgeObjectRelease();
            uint64_t v51 = v109;
            uint64_t v52 = v110;
            uint64_t v85 = v107;
LABEL_43:
            outlined init with copy of TCUMappedNLResponse?(v51, v53);
            outlined init with copy of TCUMappedNLResponse?(v52, v85);
            goto LABEL_44;
          }
        }
        swift_bridgeObjectRetain();
        outlined destroy of MediaUserStateCenter?(v111, (uint64_t *)&demangling cache variable for type metadata for TCUMappedNLResponse?);
        outlined destroy of MediaUserStateCenter?(v108, (uint64_t *)&demangling cache variable for type metadata for TCUMappedNLResponse?);
        swift_bridgeObjectRelease_n();
        uint64_t v51 = v109;
        uint64_t v52 = v110;
        uint64_t v85 = v107;
LABEL_38:
        outlined init with copy of TCUMappedNLResponse?(v51, v53);
        outlined init with copy of TCUMappedNLResponse?(v52, v85);
LABEL_39:
        outlined destroy of MediaUserStateCenter?(v85, (uint64_t *)&demangling cache variable for type metadata for TCUMappedNLResponse?);
        outlined destroy of MediaUserStateCenter?(v53, (uint64_t *)&demangling cache variable for type metadata for TCUMappedNLResponse?);
        outlined destroy of MediaUserStateCenter?(v52, (uint64_t *)&demangling cache variable for type metadata for TCUMappedNLResponse?);
        outlined destroy of MediaUserStateCenter?(v51, (uint64_t *)&demangling cache variable for type metadata for TCUMappedNLResponse?);
        goto LABEL_40;
      }
      char v69 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v67 = v108;
      outlined init with copy of TCUMappedNLResponse?(v51, v108);
      outlined init with copy of TCUMappedNLResponse?(v52, v66);
      if (v69) {
        goto LABEL_22;
      }
LABEL_34:
      outlined destroy of MediaUserStateCenter?(v66, (uint64_t *)&demangling cache variable for type metadata for TCUMappedNLResponse?);
      outlined destroy of MediaUserStateCenter?(v67, (uint64_t *)&demangling cache variable for type metadata for TCUMappedNLResponse?);
      uint64_t v85 = v107;
      goto LABEL_38;
    }
    outlined destroy of MediaUserStateCenter?(v43, (uint64_t *)&demangling cache variable for type metadata for TCUMappedNLResponse?);
  }
  else
  {
    outlined init with copy of ParseStateXPC((uint64_t)v36, (uint64_t)v32);
    uint64_t v54 = *(void *)v32;
    uint64_t v55 = *((void *)v32 + 1);
    uint64_t v56 = *((void *)v32 + 2);
    int v57 = v32[24];
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      uint64_t v58 = *(void *)v37;
      uint64_t v59 = *((void *)v37 + 1);
      uint64_t v60 = *((void *)v37 + 2);
      int v61 = v37[24];
      if (v54 == v58 && v55 == v59)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v63 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v63 & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
LABEL_40:
          uint64_t v64 = 0;
          goto LABEL_41;
        }
      }
      int v68 = specialized static Array<A>.== infix(_:_:)(v56, v60);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v64 = v68 & (v57 ^ v61 ^ 1u);
LABEL_41:
      outlined destroy of ParseStateXPC((uint64_t)v36);
      return v64;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of MediaUserStateCenter?((uint64_t)v36, &demangling cache variable for type metadata for (ParseStateXPC, ParseStateXPC));
  return 0;
}

uint64_t type metadata accessor for PommesSearchRequestXPC(uint64_t a1)
{
  return type metadata accessor for PommesSearchError(a1, (uint64_t *)&type metadata singleton initialization cache for PommesSearchRequestXPC);
}

uint64_t sub_1C918A418@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 208))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_1C918A468@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 232))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_1C918A4B8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 256))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_1C918A510(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 280))();
}

uint64_t sub_1C918A560@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 304))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_1C918A5B8@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 328))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1C918A610(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_10Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC21SiriInformationSearch29PommesSearchRequestXPCBuilder_listenAfterSpeaking);
}

uint64_t sub_1C918A61C@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 352))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1C918A674(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_10Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC21SiriInformationSearch29PommesSearchRequestXPCBuilder_isMultiUser);
}

uint64_t sub_1C918A680@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 376))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_1C918A6D4(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return key path setter for PommesSearchRequestXPCBuilder.audioSource : PommesSearchRequestXPCBuilder(a1, a2, a3, a4, &OBJC_IVAR____TtC21SiriInformationSearch29PommesSearchRequestXPCBuilder_audioSource);
}

uint64_t sub_1C918A6F4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 400))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_1C918A748(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return key path setter for PommesSearchRequestXPCBuilder.audioSource : PommesSearchRequestXPCBuilder(a1, a2, a3, a4, &OBJC_IVAR____TtC21SiriInformationSearch29PommesSearchRequestXPCBuilder_audioDestination);
}

uint64_t sub_1C918A768@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 424))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_1C918A7BC(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return key path setter for PommesSearchRequestXPCBuilder.audioSource : PommesSearchRequestXPCBuilder(a1, a2, a3, a4, &OBJC_IVAR____TtC21SiriInformationSearch29PommesSearchRequestXPCBuilder_responseMode);
}

uint64_t sub_1C918A7DC@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 448))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1C918A834(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_10Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC21SiriInformationSearch29PommesSearchRequestXPCBuilder_isEyesFree);
}

uint64_t sub_1C918A840@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 472))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1C918A898(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_10Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC21SiriInformationSearch29PommesSearchRequestXPCBuilder_isVoiceTriggerEnabled);
}

uint64_t sub_1C918A8A4@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 496))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1C918A8FC(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_10Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC21SiriInformationSearch29PommesSearchRequestXPCBuilder_isTextToSpeechEnabled);
}

uint64_t sub_1C918A908@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 520))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1C918A960(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_10Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC21SiriInformationSearch29PommesSearchRequestXPCBuilder_isTriggerlessFollowup);
}

uint64_t sub_1C918A96C@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 544))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1C918A9C4(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_10Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC21SiriInformationSearch29PommesSearchRequestXPCBuilder_isPushOffRequest);
}

uint64_t keypath_set_10Tm(char *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  char v5 = *a1;
  uint64_t v6 = (unsigned char *)(*a2 + *a5);
  uint64_t result = swift_beginAccess();
  *uint64_t v6 = v5;
  return result;
}

uint64_t sub_1C918AA1C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 568))();
  *a2 = result;
  return result;
}

uint64_t ObjC metadata update function for PommesSearchRequestXPC()
{
  return type metadata accessor for PommesSearchRequestXPC(0);
}

uint64_t type metadata completion function for PommesSearchRequestXPC()
{
  uint64_t result = type metadata accessor for ParseStateXPC(319);
  if (v1 <= 0x3F) {
    return swift_updateClassMetadata2();
  }
  return result;
}

uint64_t method lookup function for PommesSearchRequestXPC(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for PommesSearchRequestXPC);
}

uint64_t dispatch thunk of PommesSearchRequestXPC.__allocating_init(domain:listenAfterSpeaking:assistantId:requestId:isMultiUser:parseState:utterance:deviceRestrictions:)()
{
  return (*(uint64_t (**)(void))(v0 + 208))();
}

uint64_t dispatch thunk of PommesSearchRequestXPC.__allocating_init(domain:listenAfterSpeaking:assistantId:requestId:isMultiUser:parseState:utterance:audioSource:audioDestination:responseMode:isEyesFree:isVoiceTriggerEnabled:isTextToSpeechEnabled:isTriggerlessFollowup:isPushOffRequest:deviceRestrictions:)()
{
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 216);
  return v2();
}

uint64_t dispatch thunk of PommesSearchRequestXPC.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 224))();
}

void *initializeBufferWithCopyOfBuffer for ParseStateXPC(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    a1 = (void *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v8 = a2[3];
      a1[2] = a2[2];
      a1[3] = v8;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for (id: String, tcuId: String, response: TCUMappedNLResponse?, hasTTResponse: Bool));
      uint64_t v10 = *(int *)(v9 + 64);
      uint64_t v11 = (char *)a1 + v10;
      uint64_t v12 = (char *)a2 + v10;
      uint64_t v13 = type metadata accessor for TCUMappedNLResponse();
      uint64_t v14 = *(void *)(v13 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
      {
        uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for TCUMappedNLResponse?);
        memcpy(v11, v12, *(void *)(*(void *)(v15 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v11, v12, v13);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
      }
      *((unsigned char *)a1 + *(int *)(v9 + 80)) = *((unsigned char *)a2 + *(int *)(v9 + 80));
    }
    else
    {
      a1[2] = a2[2];
      *((unsigned char *)a1 + 24) = *((unsigned char *)a2 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for ParseStateXPC(uint64_t a1)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  swift_bridgeObjectRelease();
  if (EnumCaseMultiPayload == 1)
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = a1
       + *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for (id: String, tcuId: String, response: TCUMappedNLResponse?, hasTTResponse: Bool))
                + 64);
    uint64_t v4 = type metadata accessor for TCUMappedNLResponse();
    uint64_t v7 = *(void *)(v4 - 8);
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v3, 1, v4);
    if (!result)
    {
      uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8);
      return v6(v3, v4);
    }
  }
  else
  {
    return swift_bridgeObjectRelease();
  }
  return result;
}

void *initializeWithCopy for ParseStateXPC(void *a1, void *a2)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for (id: String, tcuId: String, response: TCUMappedNLResponse?, hasTTResponse: Bool));
    uint64_t v8 = *(int *)(v7 + 64);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for TCUMappedNLResponse();
    uint64_t v12 = *(void *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for TCUMappedNLResponse?);
      memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    *((unsigned char *)a1 + *(int *)(v7 + 80)) = *((unsigned char *)a2 + *(int *)(v7 + 80));
  }
  else
  {
    a1[2] = a2[2];
    *((unsigned char *)a1 + 24) = *((unsigned char *)a2 + 24);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *assignWithCopy for ParseStateXPC(void *a1, void *a2)
{
  if (a1 != a2)
  {
    outlined destroy of ParseStateXPC((uint64_t)a1);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    *a1 = *a2;
    a1[1] = a2[1];
    if (EnumCaseMultiPayload == 1)
    {
      a1[2] = a2[2];
      a1[3] = a2[3];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for (id: String, tcuId: String, response: TCUMappedNLResponse?, hasTTResponse: Bool));
      uint64_t v6 = *(int *)(v5 + 64);
      uint64_t v7 = (char *)a1 + v6;
      uint64_t v8 = (char *)a2 + v6;
      uint64_t v9 = type metadata accessor for TCUMappedNLResponse();
      uint64_t v10 = *(void *)(v9 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
      {
        uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for TCUMappedNLResponse?);
        memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      }
      *((unsigned char *)a1 + *(int *)(v5 + 80)) = *((unsigned char *)a2 + *(int *)(v5 + 80));
    }
    else
    {
      a1[2] = a2[2];
      *((unsigned char *)a1 + 24) = *((unsigned char *)a2 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *initializeWithTake for ParseStateXPC(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    long long v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for (id: String, tcuId: String, response: TCUMappedNLResponse?, hasTTResponse: Bool));
    uint64_t v8 = *(int *)(v7 + 64);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for TCUMappedNLResponse();
    uint64_t v12 = *(void *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for TCUMappedNLResponse?);
      memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    *((unsigned char *)a1 + *(int *)(v7 + 80)) = *((unsigned char *)a2 + *(int *)(v7 + 80));
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

_OWORD *assignWithTake for ParseStateXPC(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    outlined destroy of ParseStateXPC((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      long long v6 = a2[1];
      *a1 = *a2;
      a1[1] = v6;
      uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for (id: String, tcuId: String, response: TCUMappedNLResponse?, hasTTResponse: Bool));
      uint64_t v8 = *(int *)(v7 + 64);
      uint64_t v9 = (char *)a1 + v8;
      uint64_t v10 = (char *)a2 + v8;
      uint64_t v11 = type metadata accessor for TCUMappedNLResponse();
      uint64_t v12 = *(void *)(v11 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
      {
        uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for TCUMappedNLResponse?);
        memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
      }
      *((unsigned char *)a1 + *(int *)(v7 + 80)) = *((unsigned char *)a2 + *(int *)(v7 + 80));
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

void type metadata completion function for ParseStateXPC()
{
  uint64_t v2 = &unk_1C919B7A0;
  type metadata accessor for TCUMappedNLResponse?();
  if (v0 <= 0x3F)
  {
    swift_getTupleTypeLayout();
    uint64_t v3 = &v1;
    swift_initEnumMetadataMultiPayload();
  }
}

void type metadata accessor for TCUMappedNLResponse?()
{
  if (!lazy cache variable for type metadata for TCUMappedNLResponse?)
  {
    type metadata accessor for TCUMappedNLResponse();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for TCUMappedNLResponse?);
    }
  }
}

uint64_t ObjC metadata update function for PommesSearchRequestXPCBuilder()
{
  return type metadata accessor for PommesSearchRequestXPCBuilder(0);
}

uint64_t type metadata accessor for PommesSearchRequestXPCBuilder(uint64_t a1)
{
  return type metadata accessor for PommesSearchError(a1, (uint64_t *)&type metadata singleton initialization cache for PommesSearchRequestXPCBuilder);
}

uint64_t type metadata completion function for PommesSearchRequestXPCBuilder()
{
  uint64_t result = type metadata accessor for ParseStateXPC(319);
  if (v1 <= 0x3F) {
    return swift_updateClassMetadata2();
  }
  return result;
}

uint64_t method lookup function for PommesSearchRequestXPCBuilder(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for PommesSearchRequestXPCBuilder);
}

uint64_t dispatch thunk of PommesSearchRequestXPCBuilder.domain.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of PommesSearchRequestXPCBuilder.assistantId.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 232))();
}

uint64_t dispatch thunk of PommesSearchRequestXPCBuilder.requestId.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 256))();
}

uint64_t dispatch thunk of PommesSearchRequestXPCBuilder.parseState.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 280))();
}

uint64_t dispatch thunk of PommesSearchRequestXPCBuilder.utterance.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 304))();
}

uint64_t dispatch thunk of PommesSearchRequestXPCBuilder.listenAfterSpeaking.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 328))();
}

uint64_t dispatch thunk of PommesSearchRequestXPCBuilder.isMultiUser.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 352))();
}

uint64_t dispatch thunk of PommesSearchRequestXPCBuilder.audioSource.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 376))();
}

uint64_t dispatch thunk of PommesSearchRequestXPCBuilder.audioDestination.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 400))();
}

uint64_t dispatch thunk of PommesSearchRequestXPCBuilder.responseMode.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 424))();
}

uint64_t dispatch thunk of PommesSearchRequestXPCBuilder.isEyesFree.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 448))();
}

uint64_t dispatch thunk of PommesSearchRequestXPCBuilder.isVoiceTriggerEnabled.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 472))();
}

uint64_t dispatch thunk of PommesSearchRequestXPCBuilder.isTextToSpeechEnabled.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 496))();
}

uint64_t dispatch thunk of PommesSearchRequestXPCBuilder.isTriggerlessFollowup.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 520))();
}

uint64_t dispatch thunk of PommesSearchRequestXPCBuilder.isPushOffRequest.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 544))();
}

uint64_t dispatch thunk of PommesSearchRequestXPCBuilder.deviceRestrictions.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 568))();
}

uint64_t dispatch thunk of PommesSearchRequestXPCBuilder.__allocating_init(domain:assistantId:requestId:parseState:utterance:)()
{
  return (*(uint64_t (**)(void))(v0 + 592))();
}

uint64_t dispatch thunk of PommesSearchRequestXPCBuilder.withListenAfterSpeaking(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 600))();
}

uint64_t dispatch thunk of PommesSearchRequestXPCBuilder.withIsMultiUser(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 608))();
}

uint64_t dispatch thunk of PommesSearchRequestXPCBuilder.withAudioSource(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 616))();
}

uint64_t dispatch thunk of PommesSearchRequestXPCBuilder.withAudioDestination(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 624))();
}

uint64_t dispatch thunk of PommesSearchRequestXPCBuilder.withResponseMode(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 632))();
}

uint64_t dispatch thunk of PommesSearchRequestXPCBuilder.withIsEyesFree(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 640))();
}

uint64_t dispatch thunk of PommesSearchRequestXPCBuilder.withIsVoiceTriggerEnabled(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 648))();
}

uint64_t dispatch thunk of PommesSearchRequestXPCBuilder.withIsTextToSpeechEnabled(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 656))();
}

uint64_t dispatch thunk of PommesSearchRequestXPCBuilder.withIsTriggerlessFollowup(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 664))();
}

uint64_t dispatch thunk of PommesSearchRequestXPCBuilder.withIsPushOffRequest(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 672))();
}

uint64_t dispatch thunk of PommesSearchRequestXPCBuilder.withDeviceRestrictions(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 680))();
}

uint64_t dispatch thunk of PommesSearchRequestXPCBuilder.build()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 688))();
}

unsigned char *storeEnumTagSinglePayload for ParseStateXPC.Base(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x1C918BDA0);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

void *type metadata accessor for ParseStateXPC.Base()
{
  return &unk_1F23760E0;
}

uint64_t getEnumTagSinglePayload for ParseStateXPC.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF9) {
    goto LABEL_17;
  }
  if (a2 + 7 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 7) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 7;
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
      return (*a1 | (v4 << 8)) - 7;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 7;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v8 = v6 - 8;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ParseStateXPC.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *uint64_t result = a2 + 7;
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
        JUMPOUT(0x1C918BF34);
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
          *uint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

void *type metadata accessor for ParseStateXPC.CodingKeys()
{
  return &unk_1F2376170;
}

unint64_t specialized ParseStateXPC.CodingKeys.init(rawValue:)(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of ParseStateXPC.CodingKeys.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 >= 8) {
    return 8;
  }
  else {
    return v3;
  }
}

uint64_t outlined assign with take of ParseStateXPC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ParseStateXPC(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t PommesResponse.pommesContext.getter()
{
  uint64_t v0 = type metadata accessor for PerformanceUtil.Ticket(0);
  unint64_t v1 = (int *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  unint64_t v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent();
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v5 = type metadata accessor for PommesContext.Source();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  int v8 = (uint64_t *)((char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t *v8 = PommesResponse.conversationContext.getter();
  v8[1] = v9;
  (*(void (**)(uint64_t *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x1E4F9FEC8], v5);
  PommesResponse.metadataDomainName.getter();
  dispatch thunk of PommesResponse.listenAfterSpeaking.getter();
  PommesContext.init(source:domain:listenAfterSpeaking:)();
  dispatch thunk of PommesResponse.primaryInstructionIntent()();
  PommesContext.instructionIntent.setter();
  Date.init()();
  uint64_t v10 = &v3[v1[7]];
  *(void *)uint64_t v10 = "SiriInformationSearch/PommesResponse+Context.swift";
  *((void *)v10 + 1) = 50;
  v10[16] = 2;
  *(void *)&v3[v1[8]] = 18;
  uint64_t v11 = &v3[v1[9]];
  *(void *)uint64_t v11 = "pommesContext";
  *((void *)v11 + 1) = 13;
  v11[16] = 2;
  uint64_t v12 = specialized static PerformanceUtil.Ticket.trimIfNeeded(_:)(0xD000000000000022);
  uint64_t v13 = (uint64_t *)&v3[v1[10]];
  *uint64_t v13 = v12;
  v13[1] = v14;
  uint64_t v15 = dispatch thunk of PommesResponse.renderedTexts.getter();
  PommesContext.addRenderedTexts(_:)((Swift::OpaquePointer)v15);
  swift_bridgeObjectRelease();
  uint64_t v16 = dispatch thunk of PommesResponse.redactedRenderedTexts.getter();
  PommesContext.addRedactedRenderedTexts(_:)((Swift::OpaquePointer)v16);
  swift_bridgeObjectRelease();
  if (one-time initialization token for shared != -1) {
    swift_once();
  }
  (*(void (**)(char *, void))(*(void *)static PerformanceUtil.shared + 184))(v3, 0);
  return outlined destroy of PerformanceUtil.Ticket((uint64_t)v3);
}

uint64_t VideoCategory.init(rawValue:)()
{
  return MEMORY[0x1F40D3EE8]();
}

uint64_t type metadata accessor for VideoCategory()
{
  return MEMORY[0x1F40D3EF0]();
}

uint64_t StringSearchScope.init(rawValue:)()
{
  return MEMORY[0x1F40D4420]();
}

uint64_t type metadata accessor for StringSearchScope()
{
  return MEMORY[0x1F40D4430]();
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return MEMORY[0x1F40E3030]();
}

uint64_t JSONDecoder.init()()
{
  return MEMORY[0x1F40E3068]();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return MEMORY[0x1F40E3078]();
}

uint64_t dispatch thunk of JSONEncoder.encode<A>(_:)()
{
  return MEMORY[0x1F40E3120]();
}

uint64_t JSONEncoder.init()()
{
  return MEMORY[0x1F40E3148]();
}

uint64_t type metadata accessor for JSONEncoder()
{
  return MEMORY[0x1F40E3158]();
}

uint64_t CharacterSet.init(charactersIn:)()
{
  return MEMORY[0x1F40E32B8]();
}

uint64_t static CharacterSet.urlPathAllowed.getter()
{
  return MEMORY[0x1F40E32F0]();
}

NSCharacterSet __swiftcall CharacterSet._bridgeToObjectiveC()()
{
  return (NSCharacterSet)MEMORY[0x1F40E3348]();
}

uint64_t static CharacterSet.whitespacesAndNewlines.getter()
{
  return MEMORY[0x1F40E3360]();
}

uint64_t CharacterSet.inverted.getter()
{
  return MEMORY[0x1F40E33F8]();
}

uint64_t type metadata accessor for CharacterSet()
{
  return MEMORY[0x1F40E3428]();
}

uint64_t type metadata accessor for DateInterval()
{
  return MEMORY[0x1F40E3528]();
}

uint64_t static Notification._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E3548]();
}

uint64_t Notification.userInfo.getter()
{
  return MEMORY[0x1F40E3588]();
}

uint64_t type metadata accessor for Notification()
{
  return MEMORY[0x1F40E35A0]();
}

uint64_t URLComponents.host.setter()
{
  return MEMORY[0x1F40E36F0]();
}

uint64_t URLComponents.path.setter()
{
  return MEMORY[0x1F40E3710]();
}

uint64_t URLComponents.scheme.setter()
{
  return MEMORY[0x1F40E3758]();
}

uint64_t URLComponents.string.getter()
{
  return MEMORY[0x1F40E3780]();
}

uint64_t URLComponents.init()()
{
  return MEMORY[0x1F40E37A0]();
}

uint64_t type metadata accessor for URLComponents()
{
  return MEMORY[0x1F40E37B0]();
}

uint64_t __DataStorage.init(bytes:length:)()
{
  return MEMORY[0x1F40E37D8]();
}

uint64_t __DataStorage._bytes.getter()
{
  return MEMORY[0x1F40E37E8]();
}

uint64_t __DataStorage._length.getter()
{
  return MEMORY[0x1F40E3808]();
}

uint64_t __DataStorage._offset.getter()
{
  return MEMORY[0x1F40E3810]();
}

uint64_t type metadata accessor for __DataStorage()
{
  return MEMORY[0x1F40E3828]();
}

NSDateComponents __swiftcall DateComponents._bridgeToObjectiveC()()
{
  return (NSDateComponents)MEMORY[0x1F40E38C8]();
}

uint64_t DateComponents.init(calendar:timeZone:era:year:month:day:hour:minute:second:nanosecond:weekday:weekdayOrdinal:quarter:weekOfMonth:weekOfYear:yearForWeekOfYear:)()
{
  return MEMORY[0x1F40E3A08]();
}

uint64_t type metadata accessor for DateComponents()
{
  return MEMORY[0x1F40E3A60]();
}

uint64_t dispatch thunk of PropertyListDecoder.decode<A>(_:from:)()
{
  return MEMORY[0x1F40E41D8]();
}

uint64_t PropertyListDecoder.init()()
{
  return MEMORY[0x1F40E4208]();
}

uint64_t type metadata accessor for PropertyListDecoder()
{
  return MEMORY[0x1F40E4218]();
}

uint64_t dispatch thunk of PropertyListEncoder.outputFormat.setter()
{
  return MEMORY[0x1F40E4230]();
}

uint64_t dispatch thunk of PropertyListEncoder.encode<A>(_:)()
{
  return MEMORY[0x1F40E4238]();
}

uint64_t PropertyListEncoder.init()()
{
  return MEMORY[0x1F40E4268]();
}

uint64_t type metadata accessor for PropertyListEncoder()
{
  return MEMORY[0x1F40E4278]();
}

uint64_t PersonNameComponents.givenName.getter()
{
  return MEMORY[0x1F40E42B8]();
}

uint64_t PersonNameComponents.familyName.getter()
{
  return MEMORY[0x1F40E42E0]();
}

uint64_t PersonNameComponents.middleName.getter()
{
  return MEMORY[0x1F40E42F8]();
}

uint64_t static PersonNameComponents._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E4380]();
}

uint64_t PersonNameComponents.nickname.getter()
{
  return MEMORY[0x1F40E4398]();
}

uint64_t type metadata accessor for PersonNameComponents()
{
  return MEMORY[0x1F40E43C8]();
}

uint64_t _BridgedStoredNSError._getEmbeddedNSError()()
{
  return MEMORY[0x1F40E4488]();
}

uint64_t _BridgedStoredNSError.init(_bridgedNSError:)()
{
  return MEMORY[0x1F40E4490]();
}

uint64_t _BridgedStoredNSError.errorUserInfo.getter()
{
  return MEMORY[0x1F40E44A0]();
}

uint64_t static _BridgedStoredNSError.== infix(_:_:)()
{
  return MEMORY[0x1F40E44B0]();
}

uint64_t _BridgedStoredNSError.code.getter()
{
  return MEMORY[0x1F40E44C0]();
}

uint64_t _BridgedStoredNSError.hash(into:)()
{
  return MEMORY[0x1F40E44D0]();
}

uint64_t _BridgedStoredNSError.errorCode.getter()
{
  return MEMORY[0x1F40E44E8]();
}

uint64_t _convertErrorToNSError(_:)()
{
  return MEMORY[0x1F40E4538]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x1F40E4548]();
}

uint64_t type metadata accessor for NSFastEnumerationIterator()
{
  return MEMORY[0x1F40E46C8]();
}

uint64_t URL.absoluteURL.getter()
{
  return MEMORY[0x1F40E48A8]();
}

uint64_t URL.absoluteString.getter()
{
  return MEMORY[0x1F40E48F0]();
}

uint64_t URL.init(fileURLWithPath:isDirectory:)()
{
  return MEMORY[0x1F40E4928]();
}

uint64_t URL.init(fileURLWithPath:)()
{
  return MEMORY[0x1F40E4940]();
}

uint64_t URL.hasDirectoryPath.getter()
{
  return MEMORY[0x1F40E4950]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t URL.appendingPathComponent(_:isDirectory:)()
{
  return MEMORY[0x1F40E49D8]();
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E4A78]();
}

uint64_t URL.host.getter()
{
  return MEMORY[0x1F40E4A98]();
}

uint64_t URL.path.getter()
{
  return MEMORY[0x1F40E4AB8]();
}

uint64_t URL.init(string:)()
{
  return MEMORY[0x1F40E4B18]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x1F40E4B88]();
}

uint64_t Data.init(contentsOf:options:)()
{
  return MEMORY[0x1F40E4BE8]();
}

uint64_t Data.description.getter()
{
  return MEMORY[0x1F40E4C38]();
}

uint64_t Data.init(base64Encoded:options:)()
{
  return MEMORY[0x1F40E4C70]();
}

uint64_t type metadata accessor for Data.RangeReference()
{
  return MEMORY[0x1F40E4C88]();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)MEMORY[0x1F40E4D50]();
}

Swift::String __swiftcall Data.base64EncodedString(options:)(NSDataBase64EncodingOptions options)
{
  uint64_t v1 = MEMORY[0x1F40E4D60](options);
  result._object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

uint64_t static Data._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x1F40E4D98]();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E4DA0]();
}

uint64_t Data.write(to:options:)()
{
  return MEMORY[0x1F40E4E08]();
}

uint64_t Date.timeIntervalSinceReferenceDate.getter()
{
  return MEMORY[0x1F40E4EE8]();
}

uint64_t static Date.distantPast.getter()
{
  return MEMORY[0x1F40E5080]();
}

uint64_t Date.init(timeInterval:since:)()
{
  return MEMORY[0x1F40E5090]();
}

uint64_t Date.timeIntervalSince(_:)()
{
  return MEMORY[0x1F40E50D8]();
}

uint64_t Date.addingTimeInterval(_:)()
{
  return MEMORY[0x1F40E5150]();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)MEMORY[0x1F40E5190]();
}

uint64_t static Date.> infix(_:_:)()
{
  return MEMORY[0x1F40E51A0]();
}

uint64_t static Date.< infix(_:_:)()
{
  return MEMORY[0x1F40E51B0]();
}

uint64_t Date.timeIntervalSinceNow.getter()
{
  return MEMORY[0x1F40E51E8]();
}

uint64_t static Date.== infix(_:_:)()
{
  return MEMORY[0x1F40E52C8]();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E52E8]();
}

uint64_t static Date.now.getter()
{
  return MEMORY[0x1F40E52F8]();
}

uint64_t Date.init()()
{
  return MEMORY[0x1F40E5370]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x1F40E5380]();
}

uint64_t UUID.init(uuidString:)()
{
  return MEMORY[0x1F40E5398]();
}

uint64_t UUID.uuidString.getter()
{
  return MEMORY[0x1F40E53A8]();
}

NSUUID __swiftcall UUID._bridgeToObjectiveC()()
{
  return (NSUUID)MEMORY[0x1F40E53D0]();
}

uint64_t static UUID._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E5400]();
}

uint64_t UUID.init()()
{
  return MEMORY[0x1F40E5440]();
}

uint64_t type metadata accessor for UUID()
{
  return MEMORY[0x1F40E5450]();
}

uint64_t Locale.init(identifier:)()
{
  return MEMORY[0x1F40E5508]();
}

uint64_t Locale.identifier.getter()
{
  return MEMORY[0x1F40E5518]();
}

uint64_t Locale.LanguageCode.identifier.getter()
{
  return MEMORY[0x1F40E5548]();
}

uint64_t type metadata accessor for Locale.LanguageCode()
{
  return MEMORY[0x1F40E5580]();
}

uint64_t Locale.languageCode.getter()
{
  return MEMORY[0x1F40E55A8]();
}

NSLocale __swiftcall Locale._bridgeToObjectiveC()()
{
  return (NSLocale)MEMORY[0x1F40E5640]();
}

uint64_t static Locale.canonicalLanguageIdentifier(from:)()
{
  return MEMORY[0x1F40E5678]();
}

uint64_t static Locale._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E56A0]();
}

uint64_t static Locale.current.getter()
{
  return MEMORY[0x1F40E5730]();
}

uint64_t Locale.Language.languageCode.getter()
{
  return MEMORY[0x1F40E57F0]();
}

uint64_t type metadata accessor for Locale.Language()
{
  return MEMORY[0x1F40E5848]();
}

uint64_t Locale.language.getter()
{
  return MEMORY[0x1F40E5870]();
}

uint64_t type metadata accessor for Locale()
{
  return MEMORY[0x1F40E5888]();
}

uint64_t type metadata accessor for Calendar.Identifier()
{
  return MEMORY[0x1F40E58A0]();
}

uint64_t Calendar.init(identifier:)()
{
  return MEMORY[0x1F40E58B8]();
}

uint64_t type metadata accessor for Calendar()
{
  return MEMORY[0x1F40E5B10]();
}

uint64_t type metadata accessor for TimeZone()
{
  return MEMORY[0x1F40E5D78]();
}

uint64_t Selector.init(_:)()
{
  return MEMORY[0x1F41874A0]();
}

Swift::Void __swiftcall Apple_Parsec_Search_PegasusQueryContext.augment(withLocation:)(CLLocation withLocation)
{
}

uint64_t type metadata accessor for Apple_Parsec_Search_PegasusQueryContext.HourFormat()
{
  return MEMORY[0x1F413C630]();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.hourFormat.setter()
{
  return MEMORY[0x1F413C638]();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.siriLocale.getter()
{
  return MEMORY[0x1F413C648]();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.siriLocale.setter()
{
  return MEMORY[0x1F413C650]();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.storeFront.getter()
{
  return MEMORY[0x1F413C658]();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.storeFront.setter()
{
  return MEMORY[0x1F413C660]();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.countryCode.getter()
{
  return MEMORY[0x1F413C670]();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.countryCode.setter()
{
  return MEMORY[0x1F413C680]();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.weatherUnits.setter()
{
  return MEMORY[0x1F413C688]();
}

uint64_t type metadata accessor for Apple_Parsec_Search_PegasusQueryContext.TemperatureUnit()
{
  return MEMORY[0x1F413C6A0]();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.companionDevice.setter()
{
  return MEMORY[0x1F413C6A8]();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.marketplaceInfo.setter()
{
  return MEMORY[0x1F413C6B0]();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.temperatureUnit.getter()
{
  return MEMORY[0x1F413C6B8]();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.temperatureUnit.setter()
{
  return MEMORY[0x1F413C6C0]();
}

uint64_t type metadata accessor for Apple_Parsec_Search_PegasusQueryContext.MeasurementSystem()
{
  return MEMORY[0x1F413C6C8]();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.measurementSystem.getter()
{
  return MEMORY[0x1F413C6D0]();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.installedAppsSignature.getter()
{
  return MEMORY[0x1F413C6D8]();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.isGenerativeModelDevice.setter()
{
  return MEMORY[0x1F413C6E0]();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.siriResponseLanguageVariant.setter()
{
  return MEMORY[0x1F413C6E8]();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.uiScale.getter()
{
  return MEMORY[0x1F413C708]();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.uiScale.setter()
{
  return MEMORY[0x1F413C718]();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.location.modify()
{
  return MEMORY[0x1F413C728]();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.location.getter()
{
  return MEMORY[0x1F413C730]();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.location.setter()
{
  return MEMORY[0x1F413C738]();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.hsEnabled.getter()
{
  return MEMORY[0x1F413C740]();
}

uint64_t Apple_Parsec_Search_PegasusQueryContext.init()()
{
  return MEMORY[0x1F413C760]();
}

uint64_t type metadata accessor for Apple_Parsec_Search_PegasusQueryContext()
{
  return MEMORY[0x1F413C770]();
}

uint64_t Apple_Parsec_Search_SearchConversationContext.lrcThreads.getter()
{
  return MEMORY[0x1F413C778]();
}

uint64_t Apple_Parsec_Search_SearchConversationContext.init()()
{
  return MEMORY[0x1F413C780]();
}

uint64_t type metadata accessor for Apple_Parsec_Search_SearchConversationContext()
{
  return MEMORY[0x1F413C788]();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_FeedbackPayload.OneOf_ContainedFeedback()
{
  return MEMORY[0x1F413C7A8]();
}

uint64_t Apple_Parsec_Feedback_V2_FeedbackPayload.endNetworkSearchFeedback.getter()
{
  return MEMORY[0x1F413C7B8]();
}

uint64_t Apple_Parsec_Feedback_V2_FeedbackPayload.startNetworkSearchFeedback.getter()
{
  return MEMORY[0x1F413C7C8]();
}

uint64_t Apple_Parsec_Feedback_V2_FeedbackPayload.containedFeedback.getter()
{
  return MEMORY[0x1F413C7D0]();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_FeedbackPayload()
{
  return MEMORY[0x1F413C7F0]();
}

uint64_t Apple_Parsec_Siri_Context_PegasusDisplayHint.displayValue.setter()
{
  return MEMORY[0x1F413C810]();
}

uint64_t Apple_Parsec_Siri_Context_PegasusDisplayHint.idValue.setter()
{
  return MEMORY[0x1F413C818]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_Context_PegasusDisplayHint()
{
  return MEMORY[0x1F413C820]();
}

uint64_t Apple_Parsec_Siri_Context_PegasusSemanticValue.label.setter()
{
  return MEMORY[0x1F413C828]();
}

uint64_t Apple_Parsec_Siri_Context_PegasusSemanticValue.value.setter()
{
  return MEMORY[0x1F413C830]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_Context_PegasusSemanticValue()
{
  return MEMORY[0x1F413C838]();
}

uint64_t Apple_Parsec_Siri_V2alpha_PegasusSearchQuery.profileSlices.modify()
{
  return MEMORY[0x1F413C840]();
}

uint64_t Apple_Parsec_Siri_V2alpha_PegasusSearchQuery.profileSlices.getter()
{
  return MEMORY[0x1F413C848]();
}

uint64_t Apple_Parsec_Siri_V2alpha_PegasusSearchQuery.asrInterpretations.setter()
{
  return MEMORY[0x1F413C850]();
}

uint64_t Apple_Parsec_Siri_V2alpha_PegasusSearchQuery.rewrittenUtterances.getter()
{
  return MEMORY[0x1F413C858]();
}

uint64_t Apple_Parsec_Siri_V2alpha_PegasusSearchQuery.rewrittenUtterances.setter()
{
  return MEMORY[0x1F413C860]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_PegasusSearchQuery()
{
  return MEMORY[0x1F413C880]();
}

uint64_t Apple_Parsec_Siri_V2alpha_PegasusClientEventLog.pegasusDomainFlowStepLog.getter()
{
  return MEMORY[0x1F413C888]();
}

uint64_t Apple_Parsec_Siri_V2alpha_PegasusClientEventLog.pegasusDomainUserSensitiveTier1Log.getter()
{
  return MEMORY[0x1F413C890]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_PegasusClientEventLog()
{
  return MEMORY[0x1F413C898]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriKitAppInfo.AppContext.rawValue.getter()
{
  return MEMORY[0x1F413C8A0]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriKitAppInfo.AppContext()
{
  return MEMORY[0x1F413C8A8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriKitAppInfo.IntentType.rawValue.getter()
{
  return MEMORY[0x1F413C8B0]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriKitAppInfo.IntentType()
{
  return MEMORY[0x1F413C8B8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriKitAppInfo.appContext.modify()
{
  return MEMORY[0x1F413C8C0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriKitAppInfo.appContext.setter()
{
  return MEMORY[0x1F413C8C8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriKitAppInfo.supportedIntents.setter()
{
  return MEMORY[0x1F413C8D0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriKitAppInfo.IntentMediaCategory.rawValue.getter()
{
  return MEMORY[0x1F413C8D8]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriKitAppInfo.IntentMediaCategory()
{
  return MEMORY[0x1F413C8E0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriKitAppInfo.numSirikitVideoApps.setter()
{
  return MEMORY[0x1F413C8E8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriKitAppInfo.supportedIntentMediaCategories.setter()
{
  return MEMORY[0x1F413C8F0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriKitAppInfo.init()()
{
  return MEMORY[0x1F413C8F8]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriKitAppInfo()
{
  return MEMORY[0x1F413C900]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriCommandBuilder.siriCommandBuilderParams.getter()
{
  return MEMORY[0x1F413C918]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriCommandBuilder.OneOf_SiriCommandBuilderParams()
{
  return MEMORY[0x1F413C920]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriCommandBuilder.appPunchOut.getter()
{
  return MEMORY[0x1F413C928]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriCommandBuilder.phoneCall.getter()
{
  return MEMORY[0x1F413C930]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriCommandBuilder()
{
  return MEMORY[0x1F413C938]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusContext.multiUserContext.setter()
{
  return MEMORY[0x1F413C940]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusContext.SiriInteractionType()
{
  return MEMORY[0x1F413C948]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusContext.assistantID.setter()
{
  return MEMORY[0x1F413C950]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusContext.deviceState.getter()
{
  return MEMORY[0x1F413C960]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusContext.deviceState.setter()
{
  return MEMORY[0x1F413C968]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusContext.isSaeRequest.setter()
{
  return MEMORY[0x1F413C970]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusContext.restrictions.modify()
{
  return MEMORY[0x1F413C978]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusContext.restrictions.getter()
{
  return MEMORY[0x1F413C980]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusContext.interactionID.setter()
{
  return MEMORY[0x1F413C988]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusContext.isNavigationMode.getter()
{
  return MEMORY[0x1F413C990]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusContext.isNavigationMode.setter()
{
  return MEMORY[0x1F413C998]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusContext.isPushOffRequest.setter()
{
  return MEMORY[0x1F413C9A0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusContext.isPhoneCallActive.setter()
{
  return MEMORY[0x1F413C9A8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusContext.resultCandidateID.setter()
{
  return MEMORY[0x1F413C9B0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusContext.treatRandomAsFirst.setter()
{
  return MEMORY[0x1F413C9B8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusContext.siriInteractionType.getter()
{
  return MEMORY[0x1F413C9C0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusContext.siriInteractionType.setter()
{
  return MEMORY[0x1F413C9C8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusContext.userGroundingNeeded.setter()
{
  return MEMORY[0x1F413C9D0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusContext.contentRatingRestrictions.getter()
{
  return MEMORY[0x1F413C9D8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusContext.contentRatingRestrictions.setter()
{
  return MEMORY[0x1F413C9E0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusContext.person.setter()
{
  return MEMORY[0x1F413C9E8]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusContext()
{
  return MEMORY[0x1F413C9F8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusRequest.isDataOnlyRequest.getter()
{
  return MEMORY[0x1F413CA00]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusRequest.isDataOnlyRequest.setter()
{
  return MEMORY[0x1F413CA08]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusRequest.siriPegasusContext.modify()
{
  return MEMORY[0x1F413CA18]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusRequest.siriPegasusContext.getter()
{
  return MEMORY[0x1F413CA20]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusRequest.siriPegasusContext.setter()
{
  return MEMORY[0x1F413CA28]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusRequest.pommesRequestContext.modify()
{
  return MEMORY[0x1F413CA30]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusRequest.pommesRequestContext.getter()
{
  return MEMORY[0x1F413CA38]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusRequest.asrContext.setter()
{
  return MEMORY[0x1F413CA40]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusRequest.featureFlag.getter()
{
  return MEMORY[0x1F413CA48]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusRequest.featureFlag.setter()
{
  return MEMORY[0x1F413CA50]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusRequest.queryContext.modify()
{
  return MEMORY[0x1F413CA60]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusRequest.queryContext.getter()
{
  return MEMORY[0x1F413CA68]();
}

Swift::Void __swiftcall Apple_Parsec_Siri_V2alpha_SiriPegasusRequest.clearAsrContext()()
{
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusRequest.userDataShareOptIn.setter()
{
  return MEMORY[0x1F413CA88]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusRequest.conversationContextBytes.getter()
{
  return MEMORY[0x1F413CA90]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusRequest.conversationContextBytes.setter()
{
  return MEMORY[0x1F413CA98]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusRequest.searchConversationContext.setter()
{
  return MEMORY[0x1F413CAA0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusRequest.clientConversationContextInfo.modify()
{
  return MEMORY[0x1F413CAA8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusRequest.clientConversationContextInfo.getter()
{
  return MEMORY[0x1F413CAB0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusRequest.queries.getter()
{
  return MEMORY[0x1F413CAC0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusRequest.queries.setter()
{
  return MEMORY[0x1F413CAC8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusRequest.init()()
{
  return MEMORY[0x1F413CAD0]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusRequest()
{
  return MEMORY[0x1F413CAD8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.hasSiriInstruction.getter()
{
  return MEMORY[0x1F413CAE0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.alternateSiriInstructions.getter()
{
  return MEMORY[0x1F413CAE8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.SiriInstruction.hasResponseCacheControl.getter()
{
  return MEMORY[0x1F413CAF0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.SiriInstruction.experience.getter()
{
  return MEMORY[0x1F413CAF8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.SiriInstruction.resultEntities.modify()
{
  return MEMORY[0x1F413CB00]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.SiriInstruction.resultEntities.getter()
{
  return MEMORY[0x1F413CB08]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.SiriInstruction.sageExperience.getter()
{
  return MEMORY[0x1F413CB10]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.SiriInstruction.OneOf_Experience()
{
  return MEMORY[0x1F413CB18]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.SiriInstruction.serverSuggestion.getter()
{
  return MEMORY[0x1F413CB20]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.SiriInstruction.hasSageExperience.getter()
{
  return MEMORY[0x1F413CB28]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.SiriInstruction.instructionIntent.getter()
{
  return MEMORY[0x1F413CB30]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.SiriInstruction.resolutionRequest.getter()
{
  return MEMORY[0x1F413CB38]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.SiriInstruction.userPromptSignals.getter()
{
  return MEMORY[0x1F413CB40]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.SiriInstruction.hasServerSuggestion.getter()
{
  return MEMORY[0x1F413CB48]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.SiriInstruction.serverUnderstanding.getter()
{
  return MEMORY[0x1F413CB50]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.SiriInstruction.responseCacheControl.getter()
{
  return MEMORY[0x1F413CB58]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.SiriInstruction.clientDrivenExperience.getter()
{
  return MEMORY[0x1F413CB60]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.SiriInstruction.serverDrivenExperience.getter()
{
  return MEMORY[0x1F413CB68]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.SiriInstruction()
{
  return MEMORY[0x1F413CB70]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.ResponseMetadata.domainName.getter()
{
  return MEMORY[0x1F413CB78]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.ResponseMetadata.domainName.setter()
{
  return MEMORY[0x1F413CB80]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.ResponseMetadata.latencyInfo.getter()
{
  return MEMORY[0x1F413CB88]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.ResponseMetadata.isFallbackTriggered.getter()
{
  return MEMORY[0x1F413CB90]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.ResponseMetadata.pegasusClientEventLog.getter()
{
  return MEMORY[0x1F413CB98]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.ResponseMetadata.pegasusClientEventLogs.getter()
{
  return MEMORY[0x1F413CBA0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.ResponseMetadata.pegasusSelfOpaquePayloads.getter()
{
  return MEMORY[0x1F413CBA8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.ResponseMetadata.mathOperationContainsRandom.getter()
{
  return MEMORY[0x1F413CBB0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.ResponseMetadata.mathOperationContainsRandom.setter()
{
  return MEMORY[0x1F413CBB8]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.ResponseMetadata()
{
  return MEMORY[0x1F413CBC0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.queryString.getter()
{
  return MEMORY[0x1F413CBC8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.queryString.setter()
{
  return MEMORY[0x1F413CBD0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.searchStatus.getter()
{
  return MEMORY[0x1F413CBD8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.serviceDebug.getter()
{
  return MEMORY[0x1F413CBE0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.siriInstruction.getter()
{
  return MEMORY[0x1F413CBE8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.siriInstruction.setter()
{
  return MEMORY[0x1F413CBF0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.responseMetadata.modify()
{
  return MEMORY[0x1F413CBF8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.responseMetadata.getter()
{
  return MEMORY[0x1F413CC00]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.responseMetadata.setter()
{
  return MEMORY[0x1F413CC08]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.InstructionIntent()
{
  return MEMORY[0x1F413CC10]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.queryConfidenceScore.getter()
{
  return MEMORY[0x1F413CC18]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.queryConfidenceScore.setter()
{
  return MEMORY[0x1F413CC20]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.conversationContextBytes.getter()
{
  return MEMORY[0x1F413CC28]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.hasRewrittenUtteranceIdx.getter()
{
  return MEMORY[0x1F413CC30]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.searchConversationContext.getter()
{
  return MEMORY[0x1F413CC38]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.isLowConfidenceKnowledgeResult.getter()
{
  return MEMORY[0x1F413CC40]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.isLowConfidenceKnowledgeResult.setter()
{
  return MEMORY[0x1F413CC48]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.Error.message.getter()
{
  return MEMORY[0x1F413CC50]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.Error()
{
  return MEMORY[0x1F413CC58]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.error.getter()
{
  return MEMORY[0x1F413CC60]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.hasError.getter()
{
  return MEMORY[0x1F413CC68]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.init()()
{
  return MEMORY[0x1F413CC70]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse()
{
  return MEMORY[0x1F413CC78]();
}

uint64_t Apple_Parsec_Siri_Context_PromptContext.strictPrompt.setter()
{
  return MEMORY[0x1F413CF98]();
}

uint64_t Apple_Parsec_Siri_Context_PromptContext.previousSiriExecutedDomain.setter()
{
  return MEMORY[0x1F413CFA0]();
}

uint64_t Apple_Parsec_Siri_Context_PromptContext.previousSiriNlDomain.setter()
{
  return MEMORY[0x1F413CFA8]();
}

uint64_t Apple_Parsec_Siri_Context_PromptContext.dictationPrompt.setter()
{
  return MEMORY[0x1F413CFB0]();
}

uint64_t Apple_Parsec_Siri_Context_PromptContext.domainHints.setter()
{
  return MEMORY[0x1F413CFB8]();
}

uint64_t Apple_Parsec_Siri_Context_PromptContext.ambiguityTarget.setter()
{
  return MEMORY[0x1F413CFC0]();
}

uint64_t Apple_Parsec_Siri_Context_PromptContext.alertDomainHints.setter()
{
  return MEMORY[0x1F413CFC8]();
}

uint64_t Apple_Parsec_Siri_Context_PromptContext.promptTargetHints.setter()
{
  return MEMORY[0x1F413CFD0]();
}

uint64_t Apple_Parsec_Siri_Context_PromptContext.listenAfterSpeaking.setter()
{
  return MEMORY[0x1F413CFD8]();
}

uint64_t Apple_Parsec_Siri_Context_PromptContext.objectDisambiguation.setter()
{
  return MEMORY[0x1F413CFE0]();
}

uint64_t Apple_Parsec_Siri_Context_PromptContext.backgroundDomainHints.setter()
{
  return MEMORY[0x1F413CFE8]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_Context_PromptContext()
{
  return MEMORY[0x1F413CFF0]();
}

uint64_t Apple_Parsec_Siri_Context_OnDeviceContext.musicRankingInfluence.setter()
{
  return MEMORY[0x1F413CFF8]();
}

uint64_t Apple_Parsec_Siri_Context_OnDeviceContext.entities.modify()
{
  return MEMORY[0x1F413D000]();
}

uint64_t Apple_Parsec_Feedback_V2_EndNetworkSearchFeedback.timingData.getter()
{
  return MEMORY[0x1F413D010]();
}

uint64_t Apple_Parsec_Feedback_V2_EndNetworkSearchFeedback.rawResponseSize.getter()
{
  return MEMORY[0x1F413D030]();
}

uint64_t Apple_Parsec_Feedback_V2_EndNetworkSearchFeedback.decompressedResponseSize.getter()
{
  return MEMORY[0x1F413D040]();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_EndNetworkSearchFeedback()
{
  return MEMORY[0x1F413D078]();
}

uint64_t Apple_Parsec_Feedback_V2_StartNetworkSearchFeedback.rawRequestSize.getter()
{
  return MEMORY[0x1F413D080]();
}

uint64_t Apple_Parsec_Feedback_V2_StartNetworkSearchFeedback.compressedRequestSize.getter()
{
  return MEMORY[0x1F413D098]();
}

uint64_t Apple_Parsec_Feedback_V2_StartNetworkSearchFeedback.bodyData.getter()
{
  return MEMORY[0x1F413D0C8]();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_StartNetworkSearchFeedback()
{
  return MEMORY[0x1F413D0F0]();
}

uint64_t Apple_Parsec_Siri_Context_ClientConversationContextInfo.hasClientDisplayHints.getter()
{
  return MEMORY[0x1F413D0F8]();
}

uint64_t Apple_Parsec_Siri_Context_ClientConversationContextInfo.promptContext.getter()
{
  return MEMORY[0x1F413D100]();
}

uint64_t Apple_Parsec_Siri_Context_ClientConversationContextInfo.promptContext.setter()
{
  return MEMORY[0x1F413D108]();
}

uint64_t Apple_Parsec_Siri_Context_ClientConversationContextInfo.onDeviceContext.modify()
{
  return MEMORY[0x1F413D110]();
}

uint64_t Apple_Parsec_Siri_Context_ClientConversationContextInfo.hasPromptContext.getter()
{
  return MEMORY[0x1F413D118]();
}

uint64_t Apple_Parsec_Siri_Context_ClientConversationContextInfo.clientDisplayHints.getter()
{
  return MEMORY[0x1F413D120]();
}

uint64_t Apple_Parsec_Siri_Context_ClientConversationContextInfo.clientDisplayHints.setter()
{
  return MEMORY[0x1F413D128]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_Context_ClientConversationContextInfo()
{
  return MEMORY[0x1F413D130]();
}

uint64_t Apple_Parsec_Responseframework_Engagement_V1alpha_EngagementResponse.init()()
{
  return MEMORY[0x1F413D168]();
}

uint64_t type metadata accessor for Typespb_Domain()
{
  return MEMORY[0x1F413D190]();
}

uint64_t type metadata accessor for Searchfoundation_Card()
{
  return MEMORY[0x1F413D238]();
}

uint64_t Useragentpb_UserAgent.buildOsVersion.setter()
{
  return MEMORY[0x1F413D278]();
}

uint64_t Useragentpb_UserAgent.productVersion.setter()
{
  return MEMORY[0x1F413D280]();
}

uint64_t type metadata accessor for Useragentpb_UserAgent()
{
  return MEMORY[0x1F413D288]();
}

uint64_t Debuglevelspb_AnyArray.anyMessages.getter()
{
  return MEMORY[0x1F413D290]();
}

uint64_t type metadata accessor for Debuglevelspb_AnyArray()
{
  return MEMORY[0x1F413D298]();
}

uint64_t Useragentpb_DeviceMetadata.regulatoryDeviceModel.setter()
{
  return MEMORY[0x1F413D328]();
}

uint64_t type metadata accessor for Useragentpb_DeviceMetadata()
{
  return MEMORY[0x1F413D330]();
}

uint64_t Useragentpb_CompanionDevice.deviceMetadata.setter()
{
  return MEMORY[0x1F413D370]();
}

uint64_t Useragentpb_CompanionDevice.companionUserAgent.setter()
{
  return MEMORY[0x1F413D378]();
}

uint64_t type metadata accessor for Useragentpb_CompanionDevice()
{
  return MEMORY[0x1F413D380]();
}

uint64_t Latencyinfopb_KfedLatencyInfo.banyanMs.getter()
{
  return MEMORY[0x1F413D490]();
}

uint64_t Latencyinfopb_KfedLatencyInfo.overallMs.getter()
{
  return MEMORY[0x1F413D498]();
}

uint64_t type metadata accessor for Latencyinfopb_KfedLatencyInfo()
{
  return MEMORY[0x1F413D4A0]();
}

uint64_t Apple_Parsec_Search_V2_Location.preciseStatus.getter()
{
  return MEMORY[0x1F413D5D0]();
}

uint64_t Apple_Parsec_Search_V2_Location.preciseStatus.setter()
{
  return MEMORY[0x1F413D5D8]();
}

uint64_t Apple_Parsec_Search_V2_Location.age.getter()
{
  return MEMORY[0x1F413D5E8]();
}

uint64_t type metadata accessor for Apple_Parsec_Search_V2_Location.Source()
{
  return MEMORY[0x1F413D5F8]();
}

uint64_t Apple_Parsec_Search_V2_Location.source.getter()
{
  return MEMORY[0x1F413D600]();
}

uint64_t Apple_Parsec_Search_V2_Location.source.setter()
{
  return MEMORY[0x1F413D608]();
}

uint64_t Apple_Parsec_Search_V2_Location.latitude.getter()
{
  return MEMORY[0x1F413D618]();
}

uint64_t Apple_Parsec_Search_V2_Location.latitude.setter()
{
  return MEMORY[0x1F413D620]();
}

uint64_t Apple_Parsec_Search_V2_Location.longitude.getter()
{
  return MEMORY[0x1F413D628]();
}

uint64_t Apple_Parsec_Search_V2_Location.longitude.setter()
{
  return MEMORY[0x1F413D630]();
}

uint64_t Apple_Parsec_Search_V2_Location.init()()
{
  return MEMORY[0x1F413D638]();
}

uint64_t type metadata accessor for Apple_Parsec_Search_V2_Location()
{
  return MEMORY[0x1F413D640]();
}

uint64_t Apple_Parsec_Siri_V2alpha_Person.familyName.setter()
{
  return MEMORY[0x1F413D698]();
}

uint64_t Apple_Parsec_Siri_V2alpha_Person.middleName.setter()
{
  return MEMORY[0x1F413D6A0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_Person.contactIdentifier.setter()
{
  return MEMORY[0x1F413D6A8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_Person.fullName.setter()
{
  return MEMORY[0x1F413D6B0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_Person.nickname.getter()
{
  return MEMORY[0x1F413D6B8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_Person.nickname.setter()
{
  return MEMORY[0x1F413D6C0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_Person.addresses.setter()
{
  return MEMORY[0x1F413D6C8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_Person.givenName.getter()
{
  return MEMORY[0x1F413D6D0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_Person.givenName.setter()
{
  return MEMORY[0x1F413D6D8]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_Person()
{
  return MEMORY[0x1F413D6E0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppInfo.hasSiriIntegration_p.setter()
{
  return MEMORY[0x1F413D6F8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppInfo.vocabConcepts.setter()
{
  return MEMORY[0x1F413D700]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppInfo.supportedIntents.setter()
{
  return MEMORY[0x1F413D708]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppInfo.appIntentsProtocolMetadata.setter()
{
  return MEMORY[0x1F413D710]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppInfo.appName.setter()
{
  return MEMORY[0x1F413D718]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppInfo.bundleID.getter()
{
  return MEMORY[0x1F413D720]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppInfo.bundleID.setter()
{
  return MEMORY[0x1F413D728]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppInfo.init()()
{
  return MEMORY[0x1F413D730]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AppInfo()
{
  return MEMORY[0x1F413D738]();
}

uint64_t Apple_Parsec_Search_V2_WeatherUnits.temperature.setter()
{
  return MEMORY[0x1F413D7C8]();
}

uint64_t type metadata accessor for Apple_Parsec_Search_V2_WeatherUnits.DistanceUnit()
{
  return MEMORY[0x1F413D7D0]();
}

uint64_t type metadata accessor for Apple_Parsec_Search_V2_WeatherUnits.PressureUnit()
{
  return MEMORY[0x1F413D7D8]();
}

uint64_t Apple_Parsec_Search_V2_WeatherUnits.precipitation.setter()
{
  return MEMORY[0x1F413D7E0]();
}

uint64_t type metadata accessor for Apple_Parsec_Search_V2_WeatherUnits.TemperatureUnit()
{
  return MEMORY[0x1F413D7E8]();
}

uint64_t type metadata accessor for Apple_Parsec_Search_V2_WeatherUnits.PrecipitationUnit()
{
  return MEMORY[0x1F413D7F0]();
}

uint64_t Apple_Parsec_Search_V2_WeatherUnits.wind.setter()
{
  return MEMORY[0x1F413D7F8]();
}

uint64_t type metadata accessor for Apple_Parsec_Search_V2_WeatherUnits.WindUnit()
{
  return MEMORY[0x1F413D800]();
}

uint64_t Apple_Parsec_Search_V2_WeatherUnits.distance.setter()
{
  return MEMORY[0x1F413D808]();
}

uint64_t Apple_Parsec_Search_V2_WeatherUnits.pressure.setter()
{
  return MEMORY[0x1F413D810]();
}

uint64_t Apple_Parsec_Search_V2_WeatherUnits.init()()
{
  return MEMORY[0x1F413D818]();
}

uint64_t type metadata accessor for Apple_Parsec_Search_V2_WeatherUnits()
{
  return MEMORY[0x1F413D820]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioItem.identifier.getter()
{
  return MEMORY[0x1F413D828]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioItem.identifier.setter()
{
  return MEMORY[0x1F413D830]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioItem.requiresSubscription.getter()
{
  return MEMORY[0x1F413D838]();
}

uint64_t static Apple_Parsec_Siri_V2alpha_AudioItem.== infix(_:_:)()
{
  return MEMORY[0x1F413D840]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioItem.sharedUserIDFromPlayableMusicAccount.setter()
{
  return MEMORY[0x1F413D848]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioItem.type.getter()
{
  return MEMORY[0x1F413D850]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioItem.type.setter()
{
  return MEMORY[0x1F413D858]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioItem.title.getter()
{
  return MEMORY[0x1F413D860]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioItem.title.setter()
{
  return MEMORY[0x1F413D868]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioItem.artist.getter()
{
  return MEMORY[0x1F413D870]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioItem.artist.setter()
{
  return MEMORY[0x1F413D878]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioItem.assetInfo.setter()
{
  return MEMORY[0x1F413D880]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioItem.init()()
{
  return MEMORY[0x1F413D888]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioItem()
{
  return MEMORY[0x1F413D890]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioNoun.rawValue.getter()
{
  return MEMORY[0x1F413D898]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioNoun()
{
  return MEMORY[0x1F413D8A0]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioSort()
{
  return MEMORY[0x1F413D8A8]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioVerb()
{
  return MEMORY[0x1F413D8B0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_RouteInfo.originalWaypointRoute.setter()
{
  return MEMORY[0x1F413D8B8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_RouteInfo.sessionState.setter()
{
  return MEMORY[0x1F413D8C0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_RouteInfo.evChargingMetadata.setter()
{
  return MEMORY[0x1F413D8C8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_RouteInfo.routeID.setter()
{
  return MEMORY[0x1F413D8D0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_RouteInfo.etaFilter.setter()
{
  return MEMORY[0x1F413D8D8]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_RouteInfo()
{
  return MEMORY[0x1F413D8E0]();
}

uint64_t type metadata accessor for Apple_Parsec_Search_V2_PreciseStatus()
{
  return MEMORY[0x1F413D960]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V1alpha_StatusCode()
{
  return MEMORY[0x1F413D968]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ASRContext.modelVersion.setter()
{
  return MEMORY[0x1F413D970]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ASRContext.acousticModelVersion.setter()
{
  return MEMORY[0x1F413D978]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_ASRContext()
{
  return MEMORY[0x1F413D980]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioState()
{
  return MEMORY[0x1F413D988]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioDecade()
{
  return MEMORY[0x1F413DA58]();
}

uint64_t Apple_Parsec_Siri_V2alpha_DeviceState.deviceName.setter()
{
  return MEMORY[0x1F413DA60]();
}

uint64_t Apple_Parsec_Siri_V2alpha_DeviceState.isEyesFree.getter()
{
  return MEMORY[0x1F413DA68]();
}

uint64_t Apple_Parsec_Siri_V2alpha_DeviceState.isEyesFree.setter()
{
  return MEMORY[0x1F413DA70]();
}

uint64_t Apple_Parsec_Siri_V2alpha_DeviceState.inputOrigin.setter()
{
  return MEMORY[0x1F413DA78]();
}

uint64_t Apple_Parsec_Siri_V2alpha_DeviceState.isMultiUser.getter()
{
  return MEMORY[0x1F413DA80]();
}

uint64_t Apple_Parsec_Siri_V2alpha_DeviceState.isMultiUser.setter()
{
  return MEMORY[0x1F413DA88]();
}

uint64_t Apple_Parsec_Siri_V2alpha_DeviceState.companionName.getter()
{
  return MEMORY[0x1F413DA90]();
}

uint64_t Apple_Parsec_Siri_V2alpha_DeviceState.companionName.setter()
{
  return MEMORY[0x1F413DA98]();
}

uint64_t Apple_Parsec_Siri_V2alpha_DeviceState.isVoiceGenderMale.setter()
{
  return MEMORY[0x1F413DAA0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_DeviceState.isVoiceGenderFemale.setter()
{
  return MEMORY[0x1F413DAA8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_DeviceState.isLockedWithPasscode.getter()
{
  return MEMORY[0x1F413DAB0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_DeviceState.isLockedWithPasscode.setter()
{
  return MEMORY[0x1F413DAB8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_DeviceState.isVoiceGenderUnknown.setter()
{
  return MEMORY[0x1F413DAC0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_DeviceState.isTextToSpeechEnabled.getter()
{
  return MEMORY[0x1F413DAC8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_DeviceState.isTextToSpeechEnabled.setter()
{
  return MEMORY[0x1F413DAD0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_DeviceState.isVoiceTriggerEnabled.getter()
{
  return MEMORY[0x1F413DAD8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_DeviceState.isVoiceTriggerEnabled.setter()
{
  return MEMORY[0x1F413DAE0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_DeviceState.isCarDnd.getter()
{
  return MEMORY[0x1F413DAE8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_DeviceState.isCarDnd.setter()
{
  return MEMORY[0x1F413DAF0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_DeviceState.isCarplay.getter()
{
  return MEMORY[0x1F413DAF8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_DeviceState.isCarplay.setter()
{
  return MEMORY[0x1F413DB00]();
}

uint64_t Apple_Parsec_Siri_V2alpha_DeviceState.init()()
{
  return MEMORY[0x1F413DB08]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_DeviceState()
{
  return MEMORY[0x1F413DB10]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_RequestType()
{
  return MEMORY[0x1F413DB18]();
}

uint64_t Apple_Parsec_Siri_V2alpha_Restriction.reason.setter()
{
  return MEMORY[0x1F413DB20]();
}

uint64_t Apple_Parsec_Siri_V2alpha_Restriction.category.getter()
{
  return MEMORY[0x1F413DB28]();
}

uint64_t Apple_Parsec_Siri_V2alpha_Restriction.category.setter()
{
  return MEMORY[0x1F413DB30]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_Restriction()
{
  return MEMORY[0x1F413DB38]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_RewriteType()
{
  return MEMORY[0x1F413DB40]();
}

uint64_t Apple_Parsec_Search_V2_MarketplaceInfo.isMarketplaceEligible.getter()
{
  return MEMORY[0x1F413DC18]();
}

uint64_t Apple_Parsec_Search_V2_MarketplaceInfo.isMarketplaceEligible.setter()
{
  return MEMORY[0x1F413DC20]();
}

uint64_t Apple_Parsec_Search_V2_MarketplaceInfo.Marketplace.id.setter()
{
  return MEMORY[0x1F413DC28]();
}

uint64_t type metadata accessor for Apple_Parsec_Search_V2_MarketplaceInfo.Marketplace()
{
  return MEMORY[0x1F413DC30]();
}

uint64_t Apple_Parsec_Search_V2_MarketplaceInfo.supportedMarketplaces.setter()
{
  return MEMORY[0x1F413DC38]();
}

uint64_t type metadata accessor for Apple_Parsec_Search_V2_MarketplaceInfo()
{
  return MEMORY[0x1F413DC40]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_Context_ClientEntity.ClientEntityType()
{
  return MEMORY[0x1F413DC48]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_Context_ClientEntity.ClientEntitySource()
{
  return MEMORY[0x1F413DC50]();
}

uint64_t Apple_Parsec_Siri_Context_ClientEntity.alignments.getter()
{
  return MEMORY[0x1F413DC58]();
}

uint64_t Apple_Parsec_Siri_Context_ClientEntity.alignments.setter()
{
  return MEMORY[0x1F413DC60]();
}

uint64_t Apple_Parsec_Siri_Context_ClientEntity.hasAddress_p.setter()
{
  return MEMORY[0x1F413DC68]();
}

uint64_t Apple_Parsec_Siri_Context_ClientEntity.ontologyLabel.getter()
{
  return MEMORY[0x1F413DC70]();
}

uint64_t Apple_Parsec_Siri_Context_ClientEntity.ontologyLabel.setter()
{
  return MEMORY[0x1F413DC78]();
}

uint64_t Apple_Parsec_Siri_Context_ClientEntity.hasPhoneNumber_p.setter()
{
  return MEMORY[0x1F413DC80]();
}

uint64_t Apple_Parsec_Siri_Context_ClientEntity.type.getter()
{
  return MEMORY[0x1F413DC88]();
}

uint64_t Apple_Parsec_Siri_Context_ClientEntity.type.setter()
{
  return MEMORY[0x1F413DC90]();
}

uint64_t Apple_Parsec_Siri_Context_ClientEntity.score.getter()
{
  return MEMORY[0x1F413DC98]();
}

uint64_t Apple_Parsec_Siri_Context_ClientEntity.score.setter()
{
  return MEMORY[0x1F413DCA0]();
}

uint64_t Apple_Parsec_Siri_Context_ClientEntity.source.getter()
{
  return MEMORY[0x1F413DCA8]();
}

uint64_t Apple_Parsec_Siri_Context_ClientEntity.source.setter()
{
  return MEMORY[0x1F413DCB0]();
}

uint64_t Apple_Parsec_Siri_Context_ClientEntity.usoGraph.getter()
{
  return MEMORY[0x1F413DCB8]();
}

uint64_t Apple_Parsec_Siri_Context_ClientEntity.usoGraph.setter()
{
  return MEMORY[0x1F413DCC0]();
}

uint64_t Apple_Parsec_Siri_Context_ClientEntity.init()()
{
  return MEMORY[0x1F413DCC8]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_Context_ClientEntity()
{
  return MEMORY[0x1F413DCD0]();
}

uint64_t Apple_Parsec_Siri_Context_ResultEntity.usoEntity.getter()
{
  return MEMORY[0x1F413DCD8]();
}

uint64_t Apple_Parsec_Siri_Context_ResultEntity.mapsEncryptedMuid.getter()
{
  return MEMORY[0x1F413DCE8]();
}

uint64_t Apple_Parsec_Siri_Context_ResultEntity.name.getter()
{
  return MEMORY[0x1F413DCF0]();
}

uint64_t Apple_Parsec_Siri_Context_ResultEntity.domain.getter()
{
  return MEMORY[0x1F413DCF8]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_Context_ResultEntity()
{
  return MEMORY[0x1F413DD00]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AmpUserState.isUserHistoryModifiable.setter()
{
  return MEMORY[0x1F413DD08]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AmpUserState.sharedUserID.getter()
{
  return MEMORY[0x1F413DD10]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AmpUserState.sharedUserID.setter()
{
  return MEMORY[0x1F413DD18]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AmpUserState.isDefaultUser.setter()
{
  return MEMORY[0x1F413DD20]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AmpUserState.itfeCookie.setter()
{
  return MEMORY[0x1F413DD28]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AmpUserState.xpAbCookie.setter()
{
  return MEMORY[0x1F413DD30]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AmpUserState.eligibleOffers.setter()
{
  return MEMORY[0x1F413DD38]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AmpUserState.tokenErrorCode.setter()
{
  return MEMORY[0x1F413DD40]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AmpUserState.isSubscribedToGlide.setter()
{
  return MEMORY[0x1F413DD48]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AmpUserState.ampSubscriptionStatus.getter()
{
  return MEMORY[0x1F413DD50]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AmpUserState.ampSubscriptionStatus.setter()
{
  return MEMORY[0x1F413DD58]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AmpUserState.itunesSubscriptionStatus.getter()
{
  return MEMORY[0x1F413DD60]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AmpUserState.itunesSubscriptionStatus.setter()
{
  return MEMORY[0x1F413DD68]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AmpUserState.userToken.getter()
{
  return MEMORY[0x1F413DD70]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AmpUserState.userToken.setter()
{
  return MEMORY[0x1F413DD78]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AmpUserState.init()()
{
  return MEMORY[0x1F413DD80]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AmpUserState()
{
  return MEMORY[0x1F413DD88]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ProfileSlice.label.getter()
{
  return MEMORY[0x1F413DD90]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ProfileSlice.label.setter()
{
  return MEMORY[0x1F413DD98]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ProfileSlice.values.getter()
{
  return MEMORY[0x1F413DDA0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ProfileSlice.values.setter()
{
  return MEMORY[0x1F413DDA8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ProfileSlice.init()()
{
  return MEMORY[0x1F413DDB0]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_ProfileSlice()
{
  return MEMORY[0x1F413DDB8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioItemType.rawValue.getter()
{
  return MEMORY[0x1F413DE48]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioItemType()
{
  return MEMORY[0x1F413DE50]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioModifier()
{
  return MEMORY[0x1F413DE58]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ClientSignals.disableClientLibrarySearch.getter()
{
  return MEMORY[0x1F413DE60]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ClientSignals.librarySearchTerms.getter()
{
  return MEMORY[0x1F413DE68]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ClientSignals.librarySearchTerms.setter()
{
  return MEMORY[0x1F413DE70]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ClientSignals.clientRankingOverrides.getter()
{
  return MEMORY[0x1F413DE78]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ClientSignals.musicRankingInfluenceImpactInfo.getter()
{
  return MEMORY[0x1F413DE80]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ClientSignals.hasMusicRankingInfluenceImpactInfo.getter()
{
  return MEMORY[0x1F413DE88]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ClientSignals.init()()
{
  return MEMORY[0x1F413DE90]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_ClientSignals()
{
  return MEMORY[0x1F413DE98]();
}

uint64_t Apple_Parsec_Search_LRConversationThread.longPersistenceTtl.getter()
{
  return MEMORY[0x1F413DFA0]();
}

uint64_t Apple_Parsec_Search_LRConversationThread.id.getter()
{
  return MEMORY[0x1F413DFA8]();
}

uint64_t type metadata accessor for Apple_Parsec_Search_LRConversationThread()
{
  return MEMORY[0x1F413DFB0]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioAttribute()
{
  return MEMORY[0x1F413DFC0]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioRadioType()
{
  return MEMORY[0x1F413DFC8]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioReference()
{
  return MEMORY[0x1F413DFD0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ContactAddress.countryCode.setter()
{
  return MEMORY[0x1F413DFD8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ContactAddress.addressLabel.setter()
{
  return MEMORY[0x1F413DFE0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ContactAddress.city.setter()
{
  return MEMORY[0x1F413DFE8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ContactAddress.state.setter()
{
  return MEMORY[0x1F413DFF0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ContactAddress.street.setter()
{
  return MEMORY[0x1F413DFF8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ContactAddress.zipCode.setter()
{
  return MEMORY[0x1F413E000]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_ContactAddress()
{
  return MEMORY[0x1F413E008]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_SageExperience()
{
  return MEMORY[0x1F413E010]();
}

uint64_t Apple_Parsec_Siri_Context_ResponseOptions.options.setter()
{
  return MEMORY[0x1F413E090]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_Context_ResponseOptions()
{
  return MEMORY[0x1F413E098]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_ClientComponent.OneOf_Component()
{
  return MEMORY[0x1F413E0A0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ClientComponent.domainComponent.getter()
{
  return MEMORY[0x1F413E0A8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ClientComponent.component.getter()
{
  return MEMORY[0x1F413E0B0]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_ClientComponent()
{
  return MEMORY[0x1F413E0B8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ParkingLocation.notes.setter()
{
  return MEMORY[0x1F413E0C0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ParkingLocation.location.setter()
{
  return MEMORY[0x1F413E0C8]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_ParkingLocation()
{
  return MEMORY[0x1F413E0D0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_PlaybackSignals.init()()
{
  return MEMORY[0x1F413E0D8]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_PlaybackSignals()
{
  return MEMORY[0x1F413E0E0]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_ResponseContext()
{
  return MEMORY[0x1F413E0E8]();
}

uint64_t Apple_Parsec_Feedback_V2_NetworkTimingData.requestEnd.getter()
{
  return MEMORY[0x1F413E100]();
}

uint64_t Apple_Parsec_Feedback_V2_NetworkTimingData.responseEnd.getter()
{
  return MEMORY[0x1F413E108]();
}

uint64_t Apple_Parsec_Feedback_V2_NetworkTimingData.requestStart.getter()
{
  return MEMORY[0x1F413E110]();
}

uint64_t Apple_Parsec_Feedback_V2_NetworkTimingData.responseStart.getter()
{
  return MEMORY[0x1F413E118]();
}

uint64_t type metadata accessor for Apple_Parsec_Feedback_V2_NetworkTimingData()
{
  return MEMORY[0x1F413E128]();
}

uint64_t Apple_Parsec_Siri_V2alpha_MultiUserContext.sharedUserID.setter()
{
  return MEMORY[0x1F413E190]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_MultiUserContext.UserIdentityClassification()
{
  return MEMORY[0x1F413E198]();
}

uint64_t Apple_Parsec_Siri_V2alpha_MultiUserContext.userIdentificationClassification.setter()
{
  return MEMORY[0x1F413E1A0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_MultiUserContext.init()()
{
  return MEMORY[0x1F413E1A8]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_MultiUserContext()
{
  return MEMORY[0x1F413E1B0]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerSuggestion()
{
  return MEMORY[0x1F413E1C8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SingleExperience.components.getter()
{
  return MEMORY[0x1F413E1D0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SingleExperience.resultEntity.getter()
{
  return MEMORY[0x1F413E1D8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SingleExperience.hasResultEntity.getter()
{
  return MEMORY[0x1F413E1E0]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_SingleExperience()
{
  return MEMORY[0x1F413E1E8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ASRInterpretation.preItnToken.setter()
{
  return MEMORY[0x1F413E2F0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ASRInterpretation.postItnToken.setter()
{
  return MEMORY[0x1F413E2F8]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_ASRInterpretation()
{
  return MEMORY[0x1F413E300]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioEntitySource()
{
  return MEMORY[0x1F413E308]();
}

uint64_t Apple_Parsec_Siri_V2alpha_LibrarySearchTerm.rankingOnly.getter()
{
  return MEMORY[0x1F413E310]();
}

uint64_t Apple_Parsec_Siri_V2alpha_LibrarySearchTerm.rankingOnly.setter()
{
  return MEMORY[0x1F413E318]();
}

uint64_t Apple_Parsec_Siri_V2alpha_LibrarySearchTerm.itemType.getter()
{
  return MEMORY[0x1F413E320]();
}

uint64_t Apple_Parsec_Siri_V2alpha_LibrarySearchTerm.itemType.setter()
{
  return MEMORY[0x1F413E328]();
}

uint64_t Apple_Parsec_Siri_V2alpha_LibrarySearchTerm.queryStr.getter()
{
  return MEMORY[0x1F413E330]();
}

uint64_t Apple_Parsec_Siri_V2alpha_LibrarySearchTerm.queryStr.setter()
{
  return MEMORY[0x1F413E338]();
}

uint64_t Apple_Parsec_Siri_V2alpha_LibrarySearchTerm.init()()
{
  return MEMORY[0x1F413E340]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_LibrarySearchTerm()
{
  return MEMORY[0x1F413E348]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ProfileSliceLabel.rawValue.getter()
{
  return MEMORY[0x1F413E350]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_ProfileSliceLabel()
{
  return MEMORY[0x1F413E358]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ProfileSliceValue.isPostResolution.setter()
{
  return MEMORY[0x1F413E360]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ProfileSliceValue.label.getter()
{
  return MEMORY[0x1F413E368]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ProfileSliceValue.label.setter()
{
  return MEMORY[0x1F413E370]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ProfileSliceValue.state.getter()
{
  return MEMORY[0x1F413E378]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ProfileSliceValue.state.setter()
{
  return MEMORY[0x1F413E380]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ProfileSliceValue.value.getter()
{
  return MEMORY[0x1F413E388]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ProfileSliceValue.value.setter()
{
  return MEMORY[0x1F413E390]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ProfileSliceValue.init()()
{
  return MEMORY[0x1F413E398]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_ProfileSliceValue()
{
  return MEMORY[0x1F413E3A0]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_RestrictionReason()
{
  return MEMORY[0x1F413E3A8]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_UserPromptSignals.PromptType()
{
  return MEMORY[0x1F413E3B0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_UserPromptSignals.promptTypes.getter()
{
  return MEMORY[0x1F413E3B8]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_UserPromptSignals()
{
  return MEMORY[0x1F413E3C0]();
}

uint64_t Apple_Parsec_Siri_Context_ClientDisplayHints.displayHints.setter()
{
  return MEMORY[0x1F413E450]();
}

uint64_t Apple_Parsec_Siri_Context_ClientDisplayHints.displayHintsDomain.setter()
{
  return MEMORY[0x1F413E458]();
}

uint64_t Apple_Parsec_Siri_Context_ClientDisplayHints.responseOptions.setter()
{
  return MEMORY[0x1F413E460]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_Context_ClientDisplayHints()
{
  return MEMORY[0x1F413E468]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioUnderstanding.attributes.setter()
{
  return MEMORY[0x1F413E470]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioUnderstanding.musicTitle.getter()
{
  return MEMORY[0x1F413E478]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioUnderstanding.podcastTitle.getter()
{
  return MEMORY[0x1F413E480]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioUnderstanding.playlistTitle.getter()
{
  return MEMORY[0x1F413E488]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioUnderstanding.playlistTitle.setter()
{
  return MEMORY[0x1F413E490]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioUnderstanding.audioRadioType.getter()
{
  return MEMORY[0x1F413E498]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioUnderstanding.audioRadioType.setter()
{
  return MEMORY[0x1F413E4A0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioUnderstanding.audiobookTitle.getter()
{
  return MEMORY[0x1F413E4A8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioUnderstanding.audiobookTitle.setter()
{
  return MEMORY[0x1F413E4B0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioUnderstanding.audiobookAuthor.getter()
{
  return MEMORY[0x1F413E4B8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioUnderstanding.audiobookAuthor.setter()
{
  return MEMORY[0x1F413E4C0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioUnderstanding.radioStationName.getter()
{
  return MEMORY[0x1F413E4C8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioUnderstanding.requestedMediaType.getter()
{
  return MEMORY[0x1F413E4D0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioUnderstanding.radioStationFrequency.getter()
{
  return MEMORY[0x1F413E4D8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioUnderstanding.mood.getter()
{
  return MEMORY[0x1F413E4E0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioUnderstanding.noun.getter()
{
  return MEMORY[0x1F413E4E8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioUnderstanding.sort.getter()
{
  return MEMORY[0x1F413E4F0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioUnderstanding.verb.getter()
{
  return MEMORY[0x1F413E4F8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioUnderstanding.album.getter()
{
  return MEMORY[0x1F413E500]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioUnderstanding.album.setter()
{
  return MEMORY[0x1F413E508]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioUnderstanding.genre.getter()
{
  return MEMORY[0x1F413E510]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioUnderstanding.genre.setter()
{
  return MEMORY[0x1F413E518]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioUnderstanding.artist.getter()
{
  return MEMORY[0x1F413E520]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioUnderstanding.artist.setter()
{
  return MEMORY[0x1F413E528]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioUnderstanding.decade.getter()
{
  return MEMORY[0x1F413E530]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioUnderstanding.decade.setter()
{
  return MEMORY[0x1F413E538]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioUnderstanding.entity.getter()
{
  return MEMORY[0x1F413E540]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioUnderstanding.entity.setter()
{
  return MEMORY[0x1F413E548]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioUnderstanding.appName.getter()
{
  return MEMORY[0x1F413E550]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioUnderstanding.appName.setter()
{
  return MEMORY[0x1F413E558]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioUnderstanding.activity.getter()
{
  return MEMORY[0x1F413E560]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioUnderstanding.modifier.getter()
{
  return MEMORY[0x1F413E568]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioUnderstanding.modifier.setter()
{
  return MEMORY[0x1F413E570]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioUnderstanding.reference.getter()
{
  return MEMORY[0x1F413E578]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioUnderstanding.init()()
{
  return MEMORY[0x1F413E580]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioUnderstanding()
{
  return MEMORY[0x1F413E588]();
}

uint64_t Apple_Parsec_Siri_V2alpha_CatDialogComponent.catID.getter()
{
  return MEMORY[0x1F413E590]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_CatDialogComponent()
{
  return MEMORY[0x1F413E598]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_GeoClientComponent()
{
  return MEMORY[0x1F413E5A0]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_RequestedMediaType()
{
  return MEMORY[0x1F413E5B8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_RewrittenUtterance.rewrittenUtterance.setter()
{
  return MEMORY[0x1F413E5C0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_RewrittenUtterance.rewriteType.setter()
{
  return MEMORY[0x1F413E5C8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_RewrittenUtterance.init()()
{
  return MEMORY[0x1F413E5D0]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_RewrittenUtterance()
{
  return MEMORY[0x1F413E5D8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SayItBuilderParams.hasAudioData.getter()
{
  return MEMORY[0x1F413E5E0]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_SayItBuilderParams()
{
  return MEMORY[0x1F413E5E8]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AppsClientComponent()
{
  return MEMORY[0x1F413E670]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioQueueStateInfo.nowPlayingQueueCount.setter()
{
  return MEMORY[0x1F413E678]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioQueueStateInfo.nowPlayingQueueIndex.setter()
{
  return MEMORY[0x1F413E680]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioQueueStateInfo.hasAudioQueueStateItem.getter()
{
  return MEMORY[0x1F413E688]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioQueueStateInfo.audioQueueStateItem.setter()
{
  return MEMORY[0x1F413E690]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioQueueStateInfo.applicationIdentifier.setter()
{
  return MEMORY[0x1F413E698]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioQueueStateInfo.currentListeningToContainer.setter()
{
  return MEMORY[0x1F413E6A0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioQueueStateInfo.state.getter()
{
  return MEMORY[0x1F413E6A8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioQueueStateInfo.state.setter()
{
  return MEMORY[0x1F413E6B0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioQueueStateInfo.source.setter()
{
  return MEMORY[0x1F413E6B8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioQueueStateInfo.init()()
{
  return MEMORY[0x1F413E6C0]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioQueueStateInfo()
{
  return MEMORY[0x1F413E6C8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioQueueStateItem.audioQueueStateItemType.setter()
{
  return MEMORY[0x1F413E6D0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioQueueStateItem.identifier.setter()
{
  return MEMORY[0x1F413E6D8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioQueueStateItem.album.setter()
{
  return MEMORY[0x1F413E6E0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioQueueStateItem.title.setter()
{
  return MEMORY[0x1F413E6E8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioQueueStateItem.artist.setter()
{
  return MEMORY[0x1F413E6F0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioQueueStateItem.init()()
{
  return MEMORY[0x1F413E6F8]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioQueueStateItem()
{
  return MEMORY[0x1F413E700]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ExperienceComponent.delayedActionComponent.getter()
{
  return MEMORY[0x1F413E710]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_ExperienceComponent.OneOf_Component()
{
  return MEMORY[0x1F413E718]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ExperienceComponent.renderedDialog.getter()
{
  return MEMORY[0x1F413E728]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ExperienceComponent.catDialog.getter()
{
  return MEMORY[0x1F413E730]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ExperienceComponent.component.getter()
{
  return MEMORY[0x1F413E738]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_ExperienceComponent()
{
  return MEMORY[0x1F413E740]();
}

uint64_t Apple_Parsec_Siri_V2alpha_InterpretationToken.acousticCost.setter()
{
  return MEMORY[0x1F413E748]();
}

uint64_t Apple_Parsec_Siri_V2alpha_InterpretationToken.phoneSequence.setter()
{
  return MEMORY[0x1F413E750]();
}

uint64_t Apple_Parsec_Siri_V2alpha_InterpretationToken.confidenceScore.setter()
{
  return MEMORY[0x1F413E758]();
}

uint64_t Apple_Parsec_Siri_V2alpha_InterpretationToken.ipaPhoneSequence.setter()
{
  return MEMORY[0x1F413E760]();
}

uint64_t Apple_Parsec_Siri_V2alpha_InterpretationToken.silenceStartTime.setter()
{
  return MEMORY[0x1F413E768]();
}

uint64_t Apple_Parsec_Siri_V2alpha_InterpretationToken.isSpaceAddedAfter.setter()
{
  return MEMORY[0x1F413E770]();
}

uint64_t Apple_Parsec_Siri_V2alpha_InterpretationToken.isSpaceRemovedAfter.setter()
{
  return MEMORY[0x1F413E778]();
}

uint64_t Apple_Parsec_Siri_V2alpha_InterpretationToken.isSpaceRemovedBefore.setter()
{
  return MEMORY[0x1F413E780]();
}

uint64_t Apple_Parsec_Siri_V2alpha_InterpretationToken.text.setter()
{
  return MEMORY[0x1F413E788]();
}

uint64_t Apple_Parsec_Siri_V2alpha_InterpretationToken.endTime.setter()
{
  return MEMORY[0x1F413E790]();
}

uint64_t Apple_Parsec_Siri_V2alpha_InterpretationToken.graphCost.setter()
{
  return MEMORY[0x1F413E798]();
}

uint64_t Apple_Parsec_Siri_V2alpha_InterpretationToken.startTime.setter()
{
  return MEMORY[0x1F413E7A0]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_InterpretationToken()
{
  return MEMORY[0x1F413E7A8]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_RestrictionCategory()
{
  return MEMORY[0x1F413E7B0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ServerUnderstanding.userDialogAct.getter()
{
  return MEMORY[0x1F413E7B8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ServerUnderstanding.userDialogActOverride.getter()
{
  return MEMORY[0x1F413E7C0]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerUnderstanding()
{
  return MEMORY[0x1F413E7C8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppVocabularyConcept.identifier.setter()
{
  return MEMORY[0x1F413E820]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppVocabularyConcept.vocabPhrase.setter()
{
  return MEMORY[0x1F413E828]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppVocabularyConcept.userIdentificationNeeded.setter()
{
  return MEMORY[0x1F413E830]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppVocabularyConcept.init()()
{
  return MEMORY[0x1F413E838]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AppVocabularyConcept()
{
  return MEMORY[0x1F413E840]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioClientComponent.clientSignals.getter()
{
  return MEMORY[0x1F413E848]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioClientComponent.understanding.setter()
{
  return MEMORY[0x1F413E850]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AudioClientComponent.init()()
{
  return MEMORY[0x1F413E858]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioClientComponent()
{
  return MEMORY[0x1F413E860]();
}

uint64_t Apple_Parsec_Siri_V2alpha_POMMESRequestContext.personalDomainFallback.getter()
{
  return MEMORY[0x1F413E868]();
}

uint64_t Apple_Parsec_Siri_V2alpha_POMMESRequestContext.personalDomainFallback.setter()
{
  return MEMORY[0x1F413E870]();
}

uint64_t Apple_Parsec_Siri_V2alpha_POMMESRequestContext.requestID.getter()
{
  return MEMORY[0x1F413E878]();
}

uint64_t Apple_Parsec_Siri_V2alpha_POMMESRequestContext.requestID.setter()
{
  return MEMORY[0x1F413E880]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_POMMESRequestContext()
{
  return MEMORY[0x1F413E888]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ResponseCacheControl.canCacheDomainResponse.getter()
{
  return MEMORY[0x1F413E890]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ResponseCacheControl.ttl.getter()
{
  return MEMORY[0x1F413E898]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_ResponseCacheControl()
{
  return MEMORY[0x1F413E8A0]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_VideoClientComponent()
{
  return MEMORY[0x1F413E8A8]();
}

uint64_t Apple_Parsec_Siri_Context_ClientEntityAlignment.endTokenIndex.setter()
{
  return MEMORY[0x1F413E8C8]();
}

uint64_t Apple_Parsec_Siri_Context_ClientEntityAlignment.startTokenIndex.setter()
{
  return MEMORY[0x1F413E8D0]();
}

uint64_t Apple_Parsec_Siri_Context_ClientEntityAlignment.asrHypothesisIndex.setter()
{
  return MEMORY[0x1F413E8D8]();
}

uint64_t Apple_Parsec_Siri_Context_ClientEntityAlignment.utteranceSubstring.getter()
{
  return MEMORY[0x1F413E8E0]();
}

uint64_t Apple_Parsec_Siri_Context_ClientEntityAlignment.utteranceSubstring.setter()
{
  return MEMORY[0x1F413E8E8]();
}

uint64_t Apple_Parsec_Siri_Context_ClientEntityAlignment.score.setter()
{
  return MEMORY[0x1F413E8F0]();
}

uint64_t Apple_Parsec_Siri_Context_ClientEntityAlignment.init()()
{
  return MEMORY[0x1F413E8F8]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_Context_ClientEntityAlignment()
{
  return MEMORY[0x1F413E900]();
}

uint64_t Apple_Parsec_Siri_Context_MusicRankingInfluence.rawValue.getter()
{
  return MEMORY[0x1F413E908]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_Context_MusicRankingInfluence()
{
  return MEMORY[0x1F413E910]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AmpSubscriptionStatus()
{
  return MEMORY[0x1F413E918]();
}

uint64_t Apple_Parsec_Siri_V2alpha_DomainClientComponent.audioClientComponent.getter()
{
  return MEMORY[0x1F413E920]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_DomainClientComponent.OneOf_DomainComponent()
{
  return MEMORY[0x1F413E928]();
}

uint64_t Apple_Parsec_Siri_V2alpha_DomainClientComponent.domainComponent.getter()
{
  return MEMORY[0x1F413E930]();
}

uint64_t Apple_Parsec_Siri_V2alpha_DomainClientComponent.identifier.getter()
{
  return MEMORY[0x1F413E938]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_DomainClientComponent()
{
  return MEMORY[0x1F413E940]();
}

uint64_t Apple_Parsec_Siri_V2alpha_LocationBuilderParams.latitude.setter()
{
  return MEMORY[0x1F413E958]();
}

uint64_t Apple_Parsec_Siri_V2alpha_LocationBuilderParams.longitude.setter()
{
  return MEMORY[0x1F413E960]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_LocationBuilderParams()
{
  return MEMORY[0x1F413E968]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ClientDrivenExperience.components.getter()
{
  return MEMORY[0x1F413E9B0]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_ClientDrivenExperience()
{
  return MEMORY[0x1F413E9B8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ClientRankingOverrides.libraryResultTextMatchMinScore.getter()
{
  return MEMORY[0x1F413E9C0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ClientRankingOverrides.libraryResultTypedScoreMultipliers.getter()
{
  return MEMORY[0x1F413E9C8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ClientRankingOverrides.libraryResultUniversalScoreMultiplier.getter()
{
  return MEMORY[0x1F413E9D0]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_ClientRankingOverrides()
{
  return MEMORY[0x1F413E9D8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_DelayedActionComponent.siriCommandBuilder.getter()
{
  return MEMORY[0x1F413E9E0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_DelayedActionComponent.preserveResultSpaceIfPossible.getter()
{
  return MEMORY[0x1F413E9E8]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_DelayedActionComponent()
{
  return MEMORY[0x1F413E9F0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_PhoneCallBuilderParams.phoneNumber.getter()
{
  return MEMORY[0x1F413EA10]();
}

uint64_t Apple_Parsec_Siri_V2alpha_PhoneCallBuilderParams.name.getter()
{
  return MEMORY[0x1F413EA18]();
}

uint64_t Apple_Parsec_Siri_V2alpha_PhoneCallBuilderParams.name.setter()
{
  return MEMORY[0x1F413EA20]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_PhoneCallBuilderParams()
{
  return MEMORY[0x1F413EA28]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_ProfileSliceValueLabel()
{
  return MEMORY[0x1F413EA30]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ServerDrivenExperience.hasPrimaryExperience.getter()
{
  return MEMORY[0x1F413EA38]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ServerDrivenExperience.isImmersiveExperience.getter()
{
  return MEMORY[0x1F413EA40]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ServerDrivenExperience.primaryExperience.getter()
{
  return MEMORY[0x1F413EA48]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ServerDrivenExperience.components.getter()
{
  return MEMORY[0x1F413EA50]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ServerDrivenExperience.alternateExperiences.getter()
{
  return MEMORY[0x1F413EA58]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ServerDrivenExperience.preserveResultSpaceIfPossible.getter()
{
  return MEMORY[0x1F413EA60]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_ServerDrivenExperience()
{
  return MEMORY[0x1F413EA68]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AudioQueueStateItemType()
{
  return MEMORY[0x1F413EAF8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_RenderedDialogComponent.catID.getter()
{
  return MEMORY[0x1F413EB00]();
}

uint64_t Apple_Parsec_Siri_V2alpha_RenderedDialogComponent.print.getter()
{
  return MEMORY[0x1F413EB08]();
}

uint64_t Apple_Parsec_Siri_V2alpha_RenderedDialogComponent.speak.getter()
{
  return MEMORY[0x1F413EB10]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_RenderedDialogComponent()
{
  return MEMORY[0x1F413EB18]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppPunchOutBuilderParams.bundleID.getter()
{
  return MEMORY[0x1F413EBB8]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AppPunchOutBuilderParams()
{
  return MEMORY[0x1F413EBC0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ProfileResolutionRequest.requests.getter()
{
  return MEMORY[0x1F413EBC8]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_ProfileResolutionRequest()
{
  return MEMORY[0x1F413EBD0]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AppIntentProtocolMetadata.OneOf_Metadata()
{
  return MEMORY[0x1F413EC28]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AppIntentProtocolMetadata.ShowInAppStringSearchResultsIntentMetadata.StringSearchScope()
{
  return MEMORY[0x1F413EC30]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppIntentProtocolMetadata.ShowInAppStringSearchResultsIntentMetadata.searchScopes.setter()
{
  return MEMORY[0x1F413EC38]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppIntentProtocolMetadata.ShowInAppStringSearchResultsIntentMetadata.init()()
{
  return MEMORY[0x1F413EC40]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AppIntentProtocolMetadata.ShowInAppStringSearchResultsIntentMetadata()
{
  return MEMORY[0x1F413EC48]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AppIntentProtocolMetadata.PlayVideoIntentMetadata.VideoCategory()
{
  return MEMORY[0x1F413EC50]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppIntentProtocolMetadata.PlayVideoIntentMetadata.supportedCategories.setter()
{
  return MEMORY[0x1F413EC58]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppIntentProtocolMetadata.PlayVideoIntentMetadata.init()()
{
  return MEMORY[0x1F413EC60]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AppIntentProtocolMetadata.PlayVideoIntentMetadata()
{
  return MEMORY[0x1F413EC68]();
}

uint64_t Apple_Parsec_Siri_V2alpha_AppIntentProtocolMetadata.metadata.setter()
{
  return MEMORY[0x1F413EC70]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_AppIntentProtocolMetadata()
{
  return MEMORY[0x1F413EC78]();
}

uint64_t type metadata accessor for Ampmusicfeedbackforpplpb_MusicRankingInfluenceImpact()
{
  return MEMORY[0x1F413EDF8]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_SwitchProfileBuilderParams()
{
  return MEMORY[0x1F413EE30]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_DeviceExpertClientComponent()
{
  return MEMORY[0x1F413EE38]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_ITunesMatchSubscriptionStatus()
{
  return MEMORY[0x1F413EE60]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ProfileSliceResolutionRequest.sliceLabel.getter()
{
  return MEMORY[0x1F413EE68]();
}

uint64_t Apple_Parsec_Siri_V2alpha_ProfileSliceResolutionRequest.reference.getter()
{
  return MEMORY[0x1F413EE70]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_ProfileSliceResolutionRequest()
{
  return MEMORY[0x1F413EE78]();
}

uint64_t Ampmusicfeedbackforpplpb_MusicRankingInfluenceImpactInfo.suggestionImpactInfo.getter()
{
  return MEMORY[0x1F413EE80]();
}

uint64_t Ampmusicfeedbackforpplpb_MusicRankingInfluenceImpactInfo.ClientMusicSuggestionImpactInfo.clientMusicSuggestionID.getter()
{
  return MEMORY[0x1F413EE88]();
}

uint64_t Ampmusicfeedbackforpplpb_MusicRankingInfluenceImpactInfo.ClientMusicSuggestionImpactInfo.impact.getter()
{
  return MEMORY[0x1F413EE90]();
}

uint64_t type metadata accessor for Ampmusicfeedbackforpplpb_MusicRankingInfluenceImpactInfo.ClientMusicSuggestionImpactInfo()
{
  return MEMORY[0x1F413EE98]();
}

uint64_t type metadata accessor for Ampmusicfeedbackforpplpb_MusicRankingInfluenceImpactInfo()
{
  return MEMORY[0x1F413EEA0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_MediaContentRatingRestrictions.countryCode.setter()
{
  return MEMORY[0x1F413EEC8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_MediaContentRatingRestrictions.tvRestriction.getter()
{
  return MEMORY[0x1F413EED0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_MediaContentRatingRestrictions.tvRestriction.setter()
{
  return MEMORY[0x1F413EED8]();
}

uint64_t Apple_Parsec_Siri_V2alpha_MediaContentRatingRestrictions.movieRestriction.getter()
{
  return MEMORY[0x1F413EEE0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_MediaContentRatingRestrictions.movieRestriction.setter()
{
  return MEMORY[0x1F413EEE8]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_MediaContentRatingRestrictions()
{
  return MEMORY[0x1F413EEF0]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_ProfileSliceValueResolutionState()
{
  return MEMORY[0x1F413EF08]();
}

uint64_t Apple_Parsec_Siri_V2alpha_LibraryResultTypedScoreMultiplier.type.getter()
{
  return MEMORY[0x1F413EF20]();
}

uint64_t Apple_Parsec_Siri_V2alpha_LibraryResultTypedScoreMultiplier.multipler.getter()
{
  return MEMORY[0x1F413EF28]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_LibraryResultTypedScoreMultiplier()
{
  return MEMORY[0x1F413EF30]();
}

uint64_t dispatch thunk of BasePegasusProxy.warmUpConnectionIfNeeded()()
{
  return MEMORY[0x1F413F068]();
}

uint64_t dispatch thunk of BasePegasusProxy.metadata.modify()
{
  return MEMORY[0x1F413F070]();
}

uint64_t type metadata accessor for PegasusProxyForAssistant.Error()
{
  return MEMORY[0x1F413F0D8]();
}

uint64_t static PegasusProxyForAssistant.shared.getter()
{
  return MEMORY[0x1F413F0E0]();
}

uint64_t type metadata accessor for PegasusProxyForAssistant()
{
  return MEMORY[0x1F413F0E8]();
}

uint64_t dispatch thunk of PegasusProxyForIntelligenceFlow.createRequest(query:context:)()
{
  return MEMORY[0x1F413F120]();
}

uint64_t static PegasusProxyForIntelligenceFlow.shared.getter()
{
  return MEMORY[0x1F413F128]();
}

uint64_t type metadata accessor for PegasusProxyForIntelligenceFlow()
{
  return MEMORY[0x1F413F130]();
}

uint64_t UnitManager.visibility.getter()
{
  return MEMORY[0x1F41683B0]();
}

uint64_t UnitManager.temperature.getter()
{
  return MEMORY[0x1F41683D0]();
}

uint64_t UnitManager.precipitationRainfall.getter()
{
  return MEMORY[0x1F41683F0]();
}

uint64_t UnitManager.pressure.getter()
{
  return MEMORY[0x1F4168408]();
}

uint64_t static UnitManager.standard.getter()
{
  return MEMORY[0x1F4168410]();
}

uint64_t UnitManager.windSpeed.getter()
{
  return MEMORY[0x1F4168430]();
}

uint64_t type metadata accessor for UnitManager()
{
  return MEMORY[0x1F4168448]();
}

uint64_t isFeatureEnabled(_:)()
{
  return MEMORY[0x1F4119150]();
}

uint64_t type metadata accessor for Siri_Nlu_External_Span.MatcherName()
{
  return MEMORY[0x1F4154DE0]();
}

uint64_t Siri_Nlu_External_Span.matcherNames.getter()
{
  return MEMORY[0x1F4154DE8]();
}

uint64_t Siri_Nlu_External_Span.input.getter()
{
  return MEMORY[0x1F4154DF0]();
}

uint64_t Siri_Nlu_External_Span.label.getter()
{
  return MEMORY[0x1F4154DF8]();
}

uint64_t Siri_Nlu_External_Span.score.getter()
{
  return MEMORY[0x1F4154E00]();
}

uint64_t Siri_Nlu_External_Span.hasLabel.getter()
{
  return MEMORY[0x1F4154E08]();
}

uint64_t Siri_Nlu_External_Span.usoGraph.getter()
{
  return MEMORY[0x1F4154E10]();
}

uint64_t type metadata accessor for Siri_Nlu_External_Span()
{
  return MEMORY[0x1F4154E18]();
}

uint64_t Siri_Nlu_External_UUID.init()()
{
  return MEMORY[0x1F4154E48]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UUID()
{
  return MEMORY[0x1F4154E50]();
}

uint64_t type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier()
{
  return MEMORY[0x1F4154E70]();
}

uint64_t type metadata accessor for Siri_Nlu_External_Parser.AlgorithmType()
{
  return MEMORY[0x1F4154E80]();
}

uint64_t Siri_Nlu_External_Parser.parserID.getter()
{
  return MEMORY[0x1F4154E88]();
}

uint64_t Siri_Nlu_External_Parser.algorithm.getter()
{
  return MEMORY[0x1F4154E90]();
}

uint64_t type metadata accessor for Siri_Nlu_External_Parser()
{
  return MEMORY[0x1F4154E98]();
}

uint64_t Siri_Nlu_External_UsoGraph.alignments.getter()
{
  return MEMORY[0x1F4154F18]();
}

uint64_t Siri_Nlu_External_UsoGraph.identifiers.getter()
{
  return MEMORY[0x1F4154F20]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UsoGraph()
{
  return MEMORY[0x1F4154F60]();
}

uint64_t Siri_Nlu_External_UserParse.probability.getter()
{
  return MEMORY[0x1F4154F78]();
}

uint64_t Siri_Nlu_External_UserParse.probability.setter()
{
  return MEMORY[0x1F4154F80]();
}

uint64_t Siri_Nlu_External_UserParse.userDialogActs.getter()
{
  return MEMORY[0x1F4154FA0]();
}

uint64_t Siri_Nlu_External_UserParse.userDialogActs.setter()
{
  return MEMORY[0x1F4154FA8]();
}

uint64_t Siri_Nlu_External_UserParse.comparableProbability.getter()
{
  return MEMORY[0x1F4154FC0]();
}

uint64_t Siri_Nlu_External_UserParse.comparableProbability.setter()
{
  return MEMORY[0x1F4154FC8]();
}

uint64_t Siri_Nlu_External_UserParse.parser.getter()
{
  return MEMORY[0x1F4154FF0]();
}

uint64_t Siri_Nlu_External_UserParse.parser.setter()
{
  return MEMORY[0x1F4154FF8]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UserParse()
{
  return MEMORY[0x1F4155020]();
}

uint64_t Siri_Nlu_External_AsrHypothesis.probability.setter()
{
  return MEMORY[0x1F4155050]();
}

uint64_t Siri_Nlu_External_AsrHypothesis.id.setter()
{
  return MEMORY[0x1F4155058]();
}

uint64_t Siri_Nlu_External_AsrHypothesis.asrTokens.setter()
{
  return MEMORY[0x1F4155060]();
}

uint64_t Siri_Nlu_External_AsrHypothesis.utterance.getter()
{
  return MEMORY[0x1F4155068]();
}

uint64_t Siri_Nlu_External_AsrHypothesis.utterance.setter()
{
  return MEMORY[0x1F4155070]();
}

uint64_t Siri_Nlu_External_AsrHypothesis.init()()
{
  return MEMORY[0x1F4155078]();
}

uint64_t type metadata accessor for Siri_Nlu_External_AsrHypothesis()
{
  return MEMORY[0x1F4155080]();
}

uint64_t Siri_Nlu_External_UserDialogAct.hasUserStatedTask.getter()
{
  return MEMORY[0x1F41550A8]();
}

uint64_t Siri_Nlu_External_UserDialogAct.hasAccepted.getter()
{
  return MEMORY[0x1F41550B0]();
}

uint64_t Siri_Nlu_External_UserDialogAct.hasRejected.getter()
{
  return MEMORY[0x1F41550C0]();
}

uint64_t Siri_Nlu_External_UserDialogAct.hasCancelled.getter()
{
  return MEMORY[0x1F41550D0]();
}

uint64_t Siri_Nlu_External_UserDialogAct.hasDelegated.getter()
{
  return MEMORY[0x1F41550E0]();
}

uint64_t Siri_Nlu_External_UserDialogAct.userStatedTask.getter()
{
  return MEMORY[0x1F41550F8]();
}

uint64_t Siri_Nlu_External_UserDialogAct.delegated.getter()
{
  return MEMORY[0x1F4155138]();
}

uint64_t Siri_Nlu_External_UserDialogAct.init()()
{
  return MEMORY[0x1F4155148]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UserDialogAct()
{
  return MEMORY[0x1F4155158]();
}

uint64_t Siri_Nlu_External_UtteranceSpan.startIndex.getter()
{
  return MEMORY[0x1F4155178]();
}

uint64_t Siri_Nlu_External_UtteranceSpan.endIndex.getter()
{
  return MEMORY[0x1F4155180]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UtteranceSpan()
{
  return MEMORY[0x1F4155188]();
}

uint64_t type metadata accessor for Siri_Nlu_External_ResponseStatus.StatusCode()
{
  return MEMORY[0x1F4155190]();
}

uint64_t type metadata accessor for Siri_Nlu_External_RewriteMessage.RewriteType()
{
  return MEMORY[0x1F4155198]();
}

uint64_t Siri_Nlu_External_RewriteMessage.rewriteType.getter()
{
  return MEMORY[0x1F41551A0]();
}

uint64_t Siri_Nlu_External_RewriteMessage.rewrittenUtterance.getter()
{
  return MEMORY[0x1F41551A8]();
}

uint64_t type metadata accessor for Siri_Nlu_External_RewriteMessage()
{
  return MEMORY[0x1F41551B0]();
}

uint64_t Siri_Nlu_External_UserStatedTask.task.getter()
{
  return MEMORY[0x1F41551F0]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UserStatedTask()
{
  return MEMORY[0x1F4155218]();
}

uint64_t Siri_Nlu_External_LegacyNLContext.responseSemanticValues.getter()
{
  return MEMORY[0x1F4155258]();
}

uint64_t type metadata accessor for Siri_Nlu_External_LegacyNLContext()
{
  return MEMORY[0x1F4155270]();
}

uint64_t Siri_Nlu_External_UtteranceAlignment.asrHypothesisIndex.getter()
{
  return MEMORY[0x1F4155308]();
}

uint64_t Siri_Nlu_External_UtteranceAlignment.spans.getter()
{
  return MEMORY[0x1F4155310]();
}

uint64_t Siri_Nlu_External_AsrTokenInformation.beginIndex.getter()
{
  return MEMORY[0x1F4155318]();
}

uint64_t Siri_Nlu_External_AsrTokenInformation.beginIndex.setter()
{
  return MEMORY[0x1F4155320]();
}

uint64_t Siri_Nlu_External_AsrTokenInformation.postItnText.getter()
{
  return MEMORY[0x1F4155328]();
}

uint64_t Siri_Nlu_External_AsrTokenInformation.postItnText.setter()
{
  return MEMORY[0x1F4155330]();
}

uint64_t Siri_Nlu_External_AsrTokenInformation.addSpaceAfter.getter()
{
  return MEMORY[0x1F4155338]();
}

uint64_t Siri_Nlu_External_AsrTokenInformation.addSpaceAfter.setter()
{
  return MEMORY[0x1F4155340]();
}

uint64_t Siri_Nlu_External_AsrTokenInformation.phoneSequence.setter()
{
  return MEMORY[0x1F4155348]();
}

uint64_t Siri_Nlu_External_AsrTokenInformation.confidenceScore.setter()
{
  return MEMORY[0x1F4155350]();
}

uint64_t Siri_Nlu_External_AsrTokenInformation.endMilliSeconds.setter()
{
  return MEMORY[0x1F4155358]();
}

uint64_t Siri_Nlu_External_AsrTokenInformation.ipaPhoneSequence.setter()
{
  return MEMORY[0x1F4155360]();
}

uint64_t Siri_Nlu_External_AsrTokenInformation.removeSpaceAfter.getter()
{
  return MEMORY[0x1F4155368]();
}

uint64_t Siri_Nlu_External_AsrTokenInformation.removeSpaceAfter.setter()
{
  return MEMORY[0x1F4155370]();
}

uint64_t Siri_Nlu_External_AsrTokenInformation.removeSpaceBefore.getter()
{
  return MEMORY[0x1F4155378]();
}

uint64_t Siri_Nlu_External_AsrTokenInformation.removeSpaceBefore.setter()
{
  return MEMORY[0x1F4155380]();
}

uint64_t Siri_Nlu_External_AsrTokenInformation.startMilliSeconds.setter()
{
  return MEMORY[0x1F4155388]();
}

uint64_t Siri_Nlu_External_AsrTokenInformation.endIndex.getter()
{
  return MEMORY[0x1F4155390]();
}

uint64_t Siri_Nlu_External_AsrTokenInformation.endIndex.setter()
{
  return MEMORY[0x1F4155398]();
}

uint64_t Siri_Nlu_External_AsrTokenInformation.init()()
{
  return MEMORY[0x1F41553A0]();
}

uint64_t type metadata accessor for Siri_Nlu_External_AsrTokenInformation()
{
  return MEMORY[0x1F41553A8]();
}

uint64_t Siri_Nlu_External_UsoEntityIdentifier.hasNamespace.getter()
{
  return MEMORY[0x1F41553E8]();
}

uint64_t Siri_Nlu_External_UsoEntityIdentifier.backingAppBundleID.getter()
{
  return MEMORY[0x1F41553F8]();
}

uint64_t Siri_Nlu_External_UsoEntityIdentifier.hasBackingAppBundleID.getter()
{
  return MEMORY[0x1F4155400]();
}

uint64_t Siri_Nlu_External_UsoEntityIdentifier.value.getter()
{
  return MEMORY[0x1F4155408]();
}

uint64_t Siri_Nlu_External_UsoEntityIdentifier.namespace.getter()
{
  return MEMORY[0x1F4155410]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UsoEntityIdentifier()
{
  return MEMORY[0x1F4155418]();
}

uint64_t Siri_Nlu_External_DelegatedUserDialogAct.hasRewrite.getter()
{
  return MEMORY[0x1F4155438]();
}

uint64_t Siri_Nlu_External_DelegatedUserDialogAct.matchingSpans.getter()
{
  return MEMORY[0x1F4155440]();
}

uint64_t Siri_Nlu_External_DelegatedUserDialogAct.externalParserID.getter()
{
  return MEMORY[0x1F4155448]();
}

uint64_t Siri_Nlu_External_DelegatedUserDialogAct.externalParserID.setter()
{
  return MEMORY[0x1F4155450]();
}

uint64_t Siri_Nlu_External_DelegatedUserDialogAct.rewrittenUtterance.getter()
{
  return MEMORY[0x1F4155460]();
}

uint64_t Siri_Nlu_External_DelegatedUserDialogAct.rewrittenUtterance.setter()
{
  return MEMORY[0x1F4155468]();
}

uint64_t Siri_Nlu_External_DelegatedUserDialogAct.rewrite.getter()
{
  return MEMORY[0x1F4155470]();
}

uint64_t Siri_Nlu_External_DelegatedUserDialogAct.rewrite.setter()
{
  return MEMORY[0x1F4155478]();
}

uint64_t type metadata accessor for Siri_Nlu_External_DelegatedUserDialogAct()
{
  return MEMORY[0x1F4155480]();
}

uint64_t static SiriNLUTypesPrintUtils.printableProtoObject(object:)()
{
  return MEMORY[0x1F4155488]();
}

uint64_t type metadata accessor for SiriNLUTypesPrintUtils()
{
  return MEMORY[0x1F4155490]();
}

uint64_t static ConversionUtils.convertUuidToProto(uuid:)()
{
  return MEMORY[0x1F41554B0]();
}

uint64_t static ConversionUtils.convertUserDialogActToTasks(userDialogAct:)()
{
  return MEMORY[0x1F41554B8]();
}

uint64_t static UsoGraphProtoReader.fromSwiftProtobuf(protobufGraph:vocabManager:)()
{
  return MEMORY[0x1F41554C8]();
}

uint64_t static UsoGraphProtoWriter.toSwiftProtobuf(graph:vocabManager:)()
{
  return MEMORY[0x1F41554E0]();
}

uint64_t Com_Apple_Siri_Product_Proto_PromptContext.strictPrompt.getter()
{
  return MEMORY[0x1F4155A08]();
}

uint64_t Com_Apple_Siri_Product_Proto_PromptContext.dictationPrompt.getter()
{
  return MEMORY[0x1F4155A18]();
}

uint64_t Com_Apple_Siri_Product_Proto_PromptContext.domainHints.getter()
{
  return MEMORY[0x1F4155A28]();
}

uint64_t Com_Apple_Siri_Product_Proto_PromptContext.displayHints.getter()
{
  return MEMORY[0x1F4155A38]();
}

uint64_t Com_Apple_Siri_Product_Proto_PromptContext.ambiguityTarget.getter()
{
  return MEMORY[0x1F4155A48]();
}

uint64_t Com_Apple_Siri_Product_Proto_PromptContext.responseOptions.getter()
{
  return MEMORY[0x1F4155A58]();
}

uint64_t Com_Apple_Siri_Product_Proto_PromptContext.alertDomainHints.getter()
{
  return MEMORY[0x1F4155A68]();
}

uint64_t Com_Apple_Siri_Product_Proto_PromptContext.promptTargetHints.getter()
{
  return MEMORY[0x1F4155A70]();
}

uint64_t Com_Apple_Siri_Product_Proto_PromptContext.previousDomainName.getter()
{
  return MEMORY[0x1F4155A80]();
}

uint64_t Com_Apple_Siri_Product_Proto_PromptContext.listenAfterSpeaking.getter()
{
  return MEMORY[0x1F4155A90]();
}

uint64_t Com_Apple_Siri_Product_Proto_PromptContext.objectDisambiguation.getter()
{
  return MEMORY[0x1F4155A98]();
}

uint64_t Com_Apple_Siri_Product_Proto_PromptContext.previousNldomainName.getter()
{
  return MEMORY[0x1F4155AA8]();
}

uint64_t Com_Apple_Siri_Product_Proto_PromptContext.backgroundDomainHints.getter()
{
  return MEMORY[0x1F4155AB0]();
}

uint64_t type metadata accessor for Com_Apple_Siri_Product_Proto_PromptContext()
{
  return MEMORY[0x1F4155AC0]();
}

uint64_t Com_Apple_Siri_Product_Proto_SemanticValue.serializedValue.getter()
{
  return MEMORY[0x1F4155AC8]();
}

uint64_t Com_Apple_Siri_Product_Proto_SemanticValue.ontologyNodePojoClassName.getter()
{
  return MEMORY[0x1F4155AE0]();
}

uint64_t type metadata accessor for Com_Apple_Siri_Product_Proto_SemanticValue()
{
  return MEMORY[0x1F4155AF8]();
}

uint64_t type metadata accessor for UsoEntity_uso_NoEntity()
{
  return MEMORY[0x1F4155B18]();
}

uint64_t dispatch thunk of Uso_VerbTemplate_NoVerb.userEntities.getter()
{
  return MEMORY[0x1F4155B20]();
}

uint64_t dispatch thunk of Uso_VerbTemplate_NoVerb.entity.getter()
{
  return MEMORY[0x1F4155B28]();
}

uint64_t dispatch thunk of UsoEntity_common_UserEntity.associatedUserEntities.getter()
{
  return MEMORY[0x1F4155B38]();
}

uint64_t dispatch thunk of UsoEntity_common_UserEntity.definedValue.getter()
{
  return MEMORY[0x1F4155B40]();
}

uint64_t type metadata accessor for UsoEntity_common_UserEntity.DefinedValues()
{
  return MEMORY[0x1F4155B48]();
}

uint64_t type metadata accessor for UsoEntity_common_UserEntity()
{
  return MEMORY[0x1F4155B60]();
}

uint64_t UsoEntityBuilder_uso_NoEntity.init()()
{
  return MEMORY[0x1F4155B68]();
}

uint64_t type metadata accessor for UsoEntityBuilder_uso_NoEntity()
{
  return MEMORY[0x1F4155B70]();
}

uint64_t PersonOntologyNode.PersonNamePrefix.rawValue.getter()
{
  return MEMORY[0x1F4155BC0]();
}

uint64_t type metadata accessor for PersonOntologyNode.PersonNamePrefix()
{
  return MEMORY[0x1F4155BC8]();
}

uint64_t PersonOntologyNode.PersonNamePostfix.rawValue.getter()
{
  return MEMORY[0x1F4155BD0]();
}

uint64_t type metadata accessor for PersonOntologyNode.PersonNamePostfix()
{
  return MEMORY[0x1F4155BD8]();
}

uint64_t AddressOntologyNode.OccupantNode.init(name:multicardinal:)()
{
  return MEMORY[0x1F4155C08]();
}

uint64_t type metadata accessor for AddressOntologyNode.OccupantNode()
{
  return MEMORY[0x1F4155C10]();
}

uint64_t dispatch thunk of UsoBuilder.addUsoIdentifier(usoIdentifier:)()
{
  return MEMORY[0x1F4155CC0]();
}

uint64_t dispatch thunk of CodeGenBase.usoIdentifiers.getter()
{
  return MEMORY[0x1F4155CC8]();
}

uint64_t CodeGenBase.entity.getter()
{
  return MEMORY[0x1F4155CD0]();
}

uint64_t SpanProperty.valueString.getter()
{
  return MEMORY[0x1F4155D30]();
}

uint64_t SpanProperty.key.getter()
{
  return MEMORY[0x1F4155D48]();
}

uint64_t type metadata accessor for SpanProperty()
{
  return MEMORY[0x1F4155D58]();
}

uint64_t ListOperators.rawValue.getter()
{
  return MEMORY[0x1F4155D60]();
}

uint64_t type metadata accessor for ListOperators()
{
  return MEMORY[0x1F4155D68]();
}

uint64_t type metadata accessor for UsoEntitySpan.SpanSource()
{
  return MEMORY[0x1F4155D88]();
}

uint64_t UsoEntitySpan.properties.getter()
{
  return MEMORY[0x1F4155D90]();
}

uint64_t UsoEntitySpan.sourceComponent.getter()
{
  return MEMORY[0x1F4155DC0]();
}

uint64_t type metadata accessor for UsoEntitySpan()
{
  return MEMORY[0x1F4155DF8]();
}

uint64_t UsoIdentifier.appBundleId.getter()
{
  return MEMORY[0x1F4155E18]();
}

uint64_t type metadata accessor for UsoIdentifier.NluComponent()
{
  return MEMORY[0x1F4155E38]();
}

uint64_t UsoIdentifier.sourceComponent.getter()
{
  return MEMORY[0x1F4155E40]();
}

uint64_t UsoIdentifier.init(value:appBundleId:namespace:)()
{
  return MEMORY[0x1F4155E78]();
}

uint64_t UsoIdentifier.value.getter()
{
  return MEMORY[0x1F4155E80]();
}

uint64_t UsoIdentifier.namespace.getter()
{
  return MEMORY[0x1F4155E88]();
}

uint64_t type metadata accessor for UsoIdentifier()
{
  return MEMORY[0x1F4155E90]();
}

uint64_t static UsoPrintUtils.flattenUsoGraph(graph:printIdentifiers:)()
{
  return MEMORY[0x1F4155E98]();
}

uint64_t UtteranceSpan.startIndex.getter()
{
  return MEMORY[0x1F4155EA8]();
}

uint64_t UtteranceSpan.endIndex.getter()
{
  return MEMORY[0x1F4155ED0]();
}

uint64_t type metadata accessor for UtteranceSpan()
{
  return MEMORY[0x1F4155ED8]();
}

uint64_t dispatch thunk of CodeGenTaskBase.getAsListHelper<A>(argumentName:entryType:)()
{
  return MEMORY[0x1F4155F28]();
}

uint64_t type metadata accessor for CodeGenTaskBase()
{
  return MEMORY[0x1F4155F30]();
}

uint64_t type metadata accessor for TerminalElement.Value()
{
  return MEMORY[0x1F41560A0]();
}

uint64_t dispatch thunk of CodeGenListEntry.entryAsExpression.getter()
{
  return MEMORY[0x1F4156118]();
}

uint64_t dispatch thunk of CodeGenListEntry.entry.getter()
{
  return MEMORY[0x1F4156120]();
}

uint64_t dispatch thunk of UsoEntityBuilder.setAsHelper<A>(attributeName:value:)()
{
  return MEMORY[0x1F4156138]();
}

uint64_t dispatch thunk of CodeGenExpression.operatorAsString.getter()
{
  return MEMORY[0x1F41561E0]();
}

uint64_t dispatch thunk of CodeGenExpression.operand.getter()
{
  return MEMORY[0x1F41561E8]();
}

uint64_t dispatch thunk of CodeGenGlobalArgs.usoQuantifier.getter()
{
  return MEMORY[0x1F41561F0]();
}

uint64_t dispatch thunk of CodeGenGlobalArgs.usoListPosition.getter()
{
  return MEMORY[0x1F41561F8]();
}

uint64_t dispatch thunk of CodeGenGlobalArgs.usoAssociatedApp.getter()
{
  return MEMORY[0x1F4156200]();
}

uint64_t dispatch thunk of CodeGenGlobalArgs.usoReferenceType.getter()
{
  return MEMORY[0x1F4156208]();
}

uint64_t dispatch thunk of CodeGenGlobalArgs.getEntitySpansFor(attributeName:)()
{
  return MEMORY[0x1F4156210]();
}

uint64_t dispatch thunk of CodeGenGlobalArgs.usoSearchQualifier.getter()
{
  return MEMORY[0x1F4156218]();
}

uint64_t dispatch thunk of CodeGenGlobalArgs.getUsoIdentifiersFor(attributeName:)()
{
  return MEMORY[0x1F4156220]();
}

uint64_t type metadata accessor for UsoBuilderOptions()
{
  return MEMORY[0x1F4156230]();
}

uint64_t OccupantIntentNode.init(intentNode:ontologyNode:)()
{
  return MEMORY[0x1F4156268]();
}

uint64_t OccupantIntentNode.namePrefix.getter()
{
  return MEMORY[0x1F4156270]();
}

uint64_t OccupantIntentNode.namePostfix.getter()
{
  return MEMORY[0x1F4156278]();
}

uint64_t OccupantIntentNode.relationship.getter()
{
  return MEMORY[0x1F4156280]();
}

uint64_t OccupantIntentNode.company.getter()
{
  return MEMORY[0x1F4156288]();
}

uint64_t OccupantIntentNode.fullName.getter()
{
  return MEMORY[0x1F4156290]();
}

uint64_t OccupantIntentNode.lastName.getter()
{
  return MEMORY[0x1F4156298]();
}

uint64_t OccupantIntentNode.nickname.getter()
{
  return MEMORY[0x1F41562A0]();
}

uint64_t OccupantIntentNode.firstName.getter()
{
  return MEMORY[0x1F41562A8]();
}

uint64_t type metadata accessor for OccupantIntentNode()
{
  return MEMORY[0x1F41562B8]();
}

uint64_t TerminalIntentNode.init(name:value:semanticTags:)()
{
  return MEMORY[0x1F41562C0]();
}

uint64_t type metadata accessor for TerminalIntentNode()
{
  return MEMORY[0x1F41562D8]();
}

uint64_t static UsoConversionUtils.extractFirstEntityFromGraph(graph:)()
{
  return MEMORY[0x1F41562F0]();
}

uint64_t UtteranceAlignment.asrHypothesisIndex.getter()
{
  return MEMORY[0x1F4156318]();
}

uint64_t UtteranceAlignment.spans.getter()
{
  return MEMORY[0x1F4156320]();
}

uint64_t dispatch thunk of UsoEntity_common_App.appSection.getter()
{
  return MEMORY[0x1F4156358]();
}

uint64_t dispatch thunk of UsoEntity_common_App.name.getter()
{
  return MEMORY[0x1F4156360]();
}

uint64_t type metadata accessor for UsoEntity_common_App()
{
  return MEMORY[0x1F4156368]();
}

uint64_t NonTerminalIntentNode.init(name:childNodes:resultIDs:)()
{
  return MEMORY[0x1F41563D0]();
}

uint64_t type metadata accessor for NonTerminalIntentNode()
{
  return MEMORY[0x1F41563D8]();
}

uint64_t dispatch thunk of UsoEntity_common_Person.name.getter()
{
  return MEMORY[0x1F4156570]();
}

uint64_t type metadata accessor for UsoEntity_common_Person()
{
  return MEMORY[0x1F4156578]();
}

uint64_t type metadata accessor for UsoTask_open_common_App()
{
  return MEMORY[0x1F4156588]();
}

uint64_t dispatch thunk of Uso_VerbTemplate_Target.target.getter()
{
  return MEMORY[0x1F4156590]();
}

uint64_t static UsoTask_CodegenConverter.convert(task:)()
{
  return MEMORY[0x1F41565D8]();
}

uint64_t static UsoBuilderConversionUtils.convertEntityBuilderToEntity(entityBuilder:)()
{
  return MEMORY[0x1F41565F8]();
}

uint64_t static UsoBuilderConversionUtils.convertEntityToRootedEntityGraph(entity:options:)()
{
  return MEMORY[0x1F4156608]();
}

uint64_t static UsoBuilderConversionUtils.convertEntityToGraph(entity:)()
{
  return MEMORY[0x1F4156610]();
}

uint64_t type metadata accessor for UsoTask_noVerb_common_App()
{
  return MEMORY[0x1F41566A0]();
}

uint64_t type metadata accessor for UsoTask_play_uso_NoEntity()
{
  return MEMORY[0x1F41566B0]();
}

uint64_t dispatch thunk of UsoEntityBuilderGlobalArgs.setUsoReferenceType(value:)()
{
  return MEMORY[0x1F4156718]();
}

uint64_t static UsoEntity_CodeGenConverter.convert(entity:)()
{
  return MEMORY[0x1F4156720]();
}

uint64_t static UsoEntity_CodeGenConverter.convertAs<A>(entity:asType:)()
{
  return MEMORY[0x1F4156730]();
}

uint64_t dispatch thunk of UsoEntity_common_MediaItem.associatedMediaItems.getter()
{
  return MEMORY[0x1F4156750]();
}

uint64_t dispatch thunk of UsoEntity_common_MediaItem.mediaItemType.getter()
{
  return MEMORY[0x1F4156758]();
}

uint64_t dispatch thunk of UsoEntity_common_MediaItem.totalDuration.getter()
{
  return MEMORY[0x1F4156768]();
}

uint64_t dispatch thunk of UsoEntity_common_MediaItem.associatedPerson.getter()
{
  return MEMORY[0x1F4156770]();
}

uint64_t dispatch thunk of UsoEntity_common_MediaItem.name.getter()
{
  return MEMORY[0x1F4156778]();
}

uint64_t dispatch thunk of UsoEntity_common_MediaItem.dateTime.getter()
{
  return MEMORY[0x1F4156780]();
}

uint64_t type metadata accessor for UsoEntity_common_MediaItem()
{
  return MEMORY[0x1F4156788]();
}

uint64_t dispatch thunk of UsoEntity_common_PhoneCall.recipients.getter()
{
  return MEMORY[0x1F4156790]();
}

uint64_t type metadata accessor for UsoEntity_common_PhoneCall()
{
  return MEMORY[0x1F4156798]();
}

uint64_t type metadata accessor for UsoTask_start_uso_NoEntity()
{
  return MEMORY[0x1F41567E0]();
}

uint64_t dispatch thunk of Uso_VerbTemplate_Reference.userEntities.getter()
{
  return MEMORY[0x1F41567F0]();
}

uint64_t dispatch thunk of Uso_VerbTemplate_Reference.reference.getter()
{
  return MEMORY[0x1F41567F8]();
}

uint64_t UsoEntityBuilder_common_App.init()()
{
  return MEMORY[0x1F4156800]();
}

uint64_t type metadata accessor for UsoEntityBuilder_common_App()
{
  return MEMORY[0x1F4156808]();
}

uint64_t UsoEntityBuilder_common_Uri.init()()
{
  return MEMORY[0x1F4156810]();
}

uint64_t type metadata accessor for UsoEntityBuilder_common_Uri()
{
  return MEMORY[0x1F4156818]();
}

uint64_t dispatch thunk of UsoEntity_common_Quantifier.definedValue.getter()
{
  return MEMORY[0x1F4156860]();
}

uint64_t type metadata accessor for UsoEntity_common_Quantifier.DefinedValues()
{
  return MEMORY[0x1F4156868]();
}

uint64_t dispatch thunk of UsoEntity_common_Similarity.definedValue.getter()
{
  return MEMORY[0x1F4156870]();
}

uint64_t type metadata accessor for UsoEntity_common_Similarity.DefinedValues()
{
  return MEMORY[0x1F4156878]();
}

uint64_t dispatch thunk of UsoEntity_common_SportsItem.associatedSportsItems.getter()
{
  return MEMORY[0x1F4156880]();
}

uint64_t dispatch thunk of UsoEntity_common_SportsItem.name.getter()
{
  return MEMORY[0x1F4156888]();
}

uint64_t dispatch thunk of UsoEntity_common_SportsItem.type.getter()
{
  return MEMORY[0x1F4156890]();
}

uint64_t type metadata accessor for UsoEntity_common_SportsItem()
{
  return MEMORY[0x1F4156898]();
}

uint64_t type metadata accessor for UsoTask_resume_uso_NoEntity()
{
  return MEMORY[0x1F41568D8]();
}

uint64_t type metadata accessor for UsoEntity_common_EventTrigger()
{
  return MEMORY[0x1F4156A30]();
}

uint64_t dispatch thunk of UsoEntity_common_ListPosition.definedValue.getter()
{
  return MEMORY[0x1F4156A48]();
}

uint64_t type metadata accessor for UsoEntity_common_ListPosition.DefinedValues()
{
  return MEMORY[0x1F4156A58]();
}

uint64_t dispatch thunk of UsoEntity_common_RadioStation.name.getter()
{
  return MEMORY[0x1F4156A78]();
}

uint64_t type metadata accessor for UsoEntity_common_RadioStation()
{
  return MEMORY[0x1F4156A80]();
}

uint64_t type metadata accessor for UsoTask_call_common_PhoneCall()
{
  return MEMORY[0x1F4156A90]();
}

uint64_t type metadata accessor for UsoTask_like_common_MediaItem()
{
  return MEMORY[0x1F4156AA8]();
}

uint64_t type metadata accessor for UsoTask_play_common_MediaItem()
{
  return MEMORY[0x1F4156AD0]();
}

uint64_t dispatch thunk of UsoEntity_common_AppSubSection.name.getter()
{
  return MEMORY[0x1F4156B58]();
}

uint64_t dispatch thunk of UsoEntity_common_MediaItemType.definedValue.getter()
{
  return MEMORY[0x1F4156BB0]();
}

uint64_t type metadata accessor for UsoEntity_common_MediaItemType.DefinedValues()
{
  return MEMORY[0x1F4156BB8]();
}

uint64_t dispatch thunk of UsoEntity_common_ReferenceType.definedValue.getter()
{
  return MEMORY[0x1F4156BD8]();
}

uint64_t type metadata accessor for UsoEntity_common_ReferenceType.DefinedValues()
{
  return MEMORY[0x1F4156BE0]();
}

uint64_t dispatch thunk of UsoEntity_common_SortDirection.definedValue.getter()
{
  return MEMORY[0x1F4156BE8]();
}

uint64_t type metadata accessor for UsoEntity_common_SortDirection.DefinedValues()
{
  return MEMORY[0x1F4156BF0]();
}

uint64_t type metadata accessor for UsoTask_start_common_MediaItem()
{
  return MEMORY[0x1F4156C30]();
}

uint64_t dispatch thunk of UsoEntity_common_SportsItemType.name.getter()
{
  return MEMORY[0x1F4156C80]();
}

uint64_t type metadata accessor for UsoTask_follow_common_MediaItem()
{
  return MEMORY[0x1F4156CA0]();
}

uint64_t type metadata accessor for UsoTask_noVerb_common_MediaItem()
{
  return MEMORY[0x1F4156CB8]();
}

uint64_t type metadata accessor for UsoTask_repeat_common_MediaItem()
{
  return MEMORY[0x1F4156CC0]();
}

uint64_t type metadata accessor for UsoTask_resume_common_MediaItem()
{
  return MEMORY[0x1F4156CD8]();
}

uint64_t type metadata accessor for UsoTask_unlike_common_MediaItem()
{
  return MEMORY[0x1F4156CF0]();
}

uint64_t type metadata accessor for UsoTask_update_common_MediaItem()
{
  return MEMORY[0x1F4156D00]();
}

uint64_t dispatch thunk of UsoEntity_common_SearchQualifier.similarity.getter()
{
  return MEMORY[0x1F4156D68]();
}

uint64_t dispatch thunk of UsoEntity_common_SearchQualifier.definedValue.getter()
{
  return MEMORY[0x1F4156D70]();
}

uint64_t type metadata accessor for UsoEntity_common_SearchQualifier.DefinedValues()
{
  return MEMORY[0x1F4156D78]();
}

uint64_t dispatch thunk of UsoEntity_common_SearchQualifier.sortDirections.getter()
{
  return MEMORY[0x1F4156D80]();
}

uint64_t type metadata accessor for UsoTask_play_common_RadioStation()
{
  return MEMORY[0x1F4156E10]();
}

uint64_t type metadata accessor for UsoTask_request_common_MediaItem()
{
  return MEMORY[0x1F4156E28]();
}

uint64_t type metadata accessor for UsoTask_shuffle_common_MediaItem()
{
  return MEMORY[0x1F4156E40]();
}

uint64_t dispatch thunk of Uso_VerbTemplate_ReferenceSelect.userEntities.getter()
{
  return MEMORY[0x1F4156E68]();
}

uint64_t dispatch thunk of Uso_VerbTemplate_ReferenceSelect.select.getter()
{
  return MEMORY[0x1F4156E70]();
}

uint64_t dispatch thunk of Uso_VerbTemplate_ReferenceSelect.reference.getter()
{
  return MEMORY[0x1F4156E78]();
}

uint64_t dispatch thunk of Uso_VerbTemplate_ReferenceTarget.userEntities.getter()
{
  return MEMORY[0x1F4156E80]();
}

uint64_t dispatch thunk of Uso_VerbTemplate_ReferenceTarget.target.getter()
{
  return MEMORY[0x1F4156E88]();
}

uint64_t dispatch thunk of Uso_VerbTemplate_ReferenceTarget.reference.getter()
{
  return MEMORY[0x1F4156E90]();
}

uint64_t UsoEntityBuilder_common_MediaItem.init()()
{
  return MEMORY[0x1F4156E98]();
}

uint64_t type metadata accessor for UsoEntityBuilder_common_MediaItem()
{
  return MEMORY[0x1F4156EA0]();
}

uint64_t dispatch thunk of Uso_VerbTemplate_ReferenceControl.userEntities.getter()
{
  return MEMORY[0x1F4156F00]();
}

uint64_t dispatch thunk of Uso_VerbTemplate_ReferenceControl.reference.getter()
{
  return MEMORY[0x1F4156F10]();
}

uint64_t type metadata accessor for UsoTask_subscribe_common_MediaItem()
{
  return MEMORY[0x1F4156FE8]();
}

uint64_t type metadata accessor for UsoTask_summarise_common_MediaItem()
{
  return MEMORY[0x1F4156FF0]();
}

uint64_t dispatch thunk of UsoEntityBuilder_common_ReferenceType.setDefinedValue(value:)()
{
  return MEMORY[0x1F4157138]();
}

uint64_t UsoEntityBuilder_common_ReferenceType.init()()
{
  return MEMORY[0x1F4157140]();
}

uint64_t type metadata accessor for UsoEntityBuilder_common_ReferenceType()
{
  return MEMORY[0x1F4157148]();
}

uint64_t type metadata accessor for Edge()
{
  return MEMORY[0x1F4157360]();
}

uint64_t type metadata accessor for Kind()
{
  return MEMORY[0x1F4157398]();
}

uint64_t Node.identifiers.getter()
{
  return MEMORY[0x1F41573F0]();
}

uint64_t Node.connectedNodes(nodeKind:edgeKind:)()
{
  return MEMORY[0x1F4157410]();
}

uint64_t type metadata accessor for Node()
{
  return MEMORY[0x1F4157448]();
}

uint64_t UsoTask.verbString.getter()
{
  return MEMORY[0x1F4157550]();
}

uint64_t UsoTask.baseEntityAsString.getter()
{
  return MEMORY[0x1F4157558]();
}

uint64_t UsoTask.arguments.getter()
{
  return MEMORY[0x1F4157560]();
}

uint64_t type metadata accessor for UsoTask()
{
  return MEMORY[0x1F4157568]();
}

uint64_t dispatch thunk of UsoValue.getAsEntity()()
{
  return MEMORY[0x1F41575A8]();
}

uint64_t UsoValue.graphNode.getter()
{
  return MEMORY[0x1F41575C0]();
}

uint64_t UsoEntity.attributes.getter()
{
  return MEMORY[0x1F4157680]();
}

uint64_t UsoEntity.usoIdentifiers.getter()
{
  return MEMORY[0x1F4157690]();
}

uint64_t UsoEntity.valueTypeString.getter()
{
  return MEMORY[0x1F4157698]();
}

uint64_t dispatch thunk of UsoEntity.utteranceAlignments.getter()
{
  return MEMORY[0x1F41576A0]();
}

uint64_t UsoEntity.usoValue.getter()
{
  return MEMORY[0x1F41576A8]();
}

uint64_t AppProtectionFeatures.enabled.getter()
{
  return MEMORY[0x1F4108FE8]();
}

uint64_t type metadata accessor for AppProtectionFeatures()
{
  return MEMORY[0x1F4108FF0]();
}

uint64_t SiriKitContactResolver.resolve(queries:config:)()
{
  return MEMORY[0x1F4150B10]();
}

uint64_t SiriKitContactResolver.init()()
{
  return MEMORY[0x1F4150B18]();
}

uint64_t type metadata accessor for SiriKitContactResolver()
{
  return MEMORY[0x1F4150B20]();
}

uint64_t SportsItem.athleteQId.setter()
{
  return MEMORY[0x1F4150B28]();
}

uint64_t static SportsItem.partiallyEqual(lhs:rhs:)()
{
  return MEMORY[0x1F4150B30]();
}

uint64_t SportsItem.team.setter()
{
  return MEMORY[0x1F4150B38]();
}

uint64_t SportsItem.init(sport:league:team:athlete:sportQId:leagueQId:teamQId:athleteQId:)()
{
  return MEMORY[0x1F4150B40]();
}

uint64_t SportsItem.sport.setter()
{
  return MEMORY[0x1F4150B48]();
}

uint64_t SportsItem.league.setter()
{
  return MEMORY[0x1F4150B50]();
}

uint64_t SportsItem.athlete.setter()
{
  return MEMORY[0x1F4150B58]();
}

uint64_t SportsItem.teamQId.setter()
{
  return MEMORY[0x1F4150B60]();
}

uint64_t SportsItem.sportQId.setter()
{
  return MEMORY[0x1F4150B68]();
}

uint64_t SportsItem.leagueQId.setter()
{
  return MEMORY[0x1F4150B70]();
}

uint64_t type metadata accessor for SportsItem()
{
  return MEMORY[0x1F4150B78]();
}

uint64_t ContactQuery.familyName.setter()
{
  return MEMORY[0x1F4150B80]();
}

uint64_t ContactQuery.namePrefix.setter()
{
  return MEMORY[0x1F4150B90]();
}

uint64_t ContactQuery.nameSuffix.setter()
{
  return MEMORY[0x1F4150B98]();
}

uint64_t ContactQuery.relationship.setter()
{
  return MEMORY[0x1F4150BA0]();
}

uint64_t ContactQuery.organizationName.setter()
{
  return MEMORY[0x1F4150BA8]();
}

uint64_t ContactQuery.fullName.setter()
{
  return MEMORY[0x1F4150BB8]();
}

uint64_t ContactQuery.nickname.setter()
{
  return MEMORY[0x1F4150BC0]();
}

uint64_t ContactQuery.givenName.getter()
{
  return MEMORY[0x1F4150BC8]();
}

uint64_t ContactQuery.givenName.setter()
{
  return MEMORY[0x1F4150BD0]();
}

uint64_t ContactQuery.init()()
{
  return MEMORY[0x1F4150BD8]();
}

uint64_t type metadata accessor for ContactQuery()
{
  return MEMORY[0x1F4150BE0]();
}

uint64_t Recommendation.description.getter()
{
  return MEMORY[0x1F4150C00]();
}

uint64_t SportsResolver.makeRecommendation(query:)()
{
  return MEMORY[0x1F4150C08]();
}

uint64_t SportsResolver.init()()
{
  return MEMORY[0x1F4150C10]();
}

uint64_t type metadata accessor for SportsResolver()
{
  return MEMORY[0x1F4150C18]();
}

uint64_t type metadata accessor for RecommenderType()
{
  return MEMORY[0x1F4150C28]();
}

uint64_t type metadata accessor for PersonalizationLevel()
{
  return MEMORY[0x1F4150C58]();
}

uint64_t SportsResolverConfig.init(intentTypeName:bundleId:)()
{
  return MEMORY[0x1F4150C60]();
}

uint64_t type metadata accessor for SportsResolverConfig()
{
  return MEMORY[0x1F4150C68]();
}

uint64_t ContactResolverConfig.init(intentId:intentTypeName:locale:logRunTimeData:processNLv3SpeechAlternatives:bundleIds:domainsToSearchForHistory:searchSuggestedContacts:recommender:customGenerator:)()
{
  return MEMORY[0x1F4150C78]();
}

uint64_t type metadata accessor for ContactResolverConfig()
{
  return MEMORY[0x1F4150C80]();
}

uint64_t static ContactResolverDomain.all.getter()
{
  return MEMORY[0x1F4150C88]();
}

uint64_t type metadata accessor for ContactResolverDomain()
{
  return MEMORY[0x1F4150C90]();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SportsResolverMetrics.logSportsMetric()()
{
}

uint64_t SportsResolverMetrics.init(config:isSiriInstructionExecuted:isDisambiguation:isRecommendationFound:isTaskSuccess:)()
{
  return MEMORY[0x1F4150CB0]();
}

uint64_t type metadata accessor for SportsResolverMetrics()
{
  return MEMORY[0x1F4150CB8]();
}

uint64_t type metadata accessor for SearchSuggestedContacts()
{
  return MEMORY[0x1F4150CE8]();
}

uint64_t ContactRelationshipQuery.init(label:fromContact:)()
{
  return MEMORY[0x1F4150CF0]();
}

uint64_t type metadata accessor for ContactRelationshipQuery()
{
  return MEMORY[0x1F4150CF8]();
}

uint64_t SportsRecommendationQuery.init(sportsPersonalizationEntities:)()
{
  return MEMORY[0x1F4150D18]();
}

uint64_t type metadata accessor for SportsRecommendationQuery()
{
  return MEMORY[0x1F4150D20]();
}

uint64_t SportsPersonalizationEntity.init(sportsItem:personalizationLevel:)()
{
  return MEMORY[0x1F4150D30]();
}

uint64_t SportsPersonalizationEntity.sportsItem.getter()
{
  return MEMORY[0x1F4150D38]();
}

uint64_t type metadata accessor for SportsPersonalizationEntity()
{
  return MEMORY[0x1F4150D40]();
}

uint64_t SiriEnvironment.currentRequest.getter()
{
  return MEMORY[0x1F41508C8]();
}

uint64_t SiriEnvironment.currentDevice.getter()
{
  return MEMORY[0x1F415AAB0]();
}

uint64_t SiriEnvironment.networkAvailability.getter()
{
  return MEMORY[0x1F415AAD0]();
}

uint64_t static SiriEnvironment.default.getter()
{
  return MEMORY[0x1F415AAE8]();
}

uint64_t type metadata accessor for SiriEnvironment()
{
  return MEMORY[0x1F415AAF8]();
}

uint64_t type metadata accessor for SiriVoiceGender()
{
  return MEMORY[0x1F415AB08]();
}

uint64_t AudioSource.init(aceValue:)()
{
  return MEMORY[0x1F415AB40]();
}

uint64_t type metadata accessor for DeviceClass()
{
  return MEMORY[0x1F415ABA0]();
}

uint64_t InputOrigin.init(aceValue:)()
{
  return MEMORY[0x1F415ABC8]();
}

uint64_t InputOrigin.rawValue.getter()
{
  return MEMORY[0x1F415ABD8]();
}

uint64_t type metadata accessor for InputOrigin()
{
  return MEMORY[0x1F415ABE0]();
}

{
  return MEMORY[0x1F4154900]();
}

uint64_t static ResponseMode.displayOnly.getter()
{
  return MEMORY[0x1F415AC18]();
}

uint64_t static ResponseMode.voiceForward.getter()
{
  return MEMORY[0x1F415AC20]();
}

uint64_t static ResponseMode.displayForward.getter()
{
  return MEMORY[0x1F415AC28]();
}

uint64_t ResponseMode.init(aceValue:)()
{
  return MEMORY[0x1F415AC38]();
}

uint64_t static ResponseMode.voiceOnly.getter()
{
  return MEMORY[0x1F415AC48]();
}

uint64_t type metadata accessor for ResponseMode()
{
  return MEMORY[0x1F415AC50]();
}

uint64_t dispatch thunk of CurrentDevice.deviceClass.getter()
{
  return MEMORY[0x1F415AC98]();
}

uint64_t dispatch thunk of CurrentDevice.siriVoiceGender.getter()
{
  return MEMORY[0x1F415ACB0]();
}

uint64_t type metadata accessor for InteractionType()
{
  return MEMORY[0x1F415ADB8]();
}

uint64_t AudioDestination.init(aceValue:)()
{
  return MEMORY[0x1F415ADD8]();
}

uint64_t static DeviceRestrictions.carDNDMode.getter()
{
  return MEMORY[0x1F415AE18]();
}

uint64_t DeviceRestrictions.init(aceValue:)()
{
  return MEMORY[0x1F415AE38]();
}

uint64_t static DeviceRestrictions.starkMode.getter()
{
  return MEMORY[0x1F415AE50]();
}

uint64_t type metadata accessor for DeviceRestrictions()
{
  return MEMORY[0x1F415AE58]();
}

uint64_t dispatch thunk of NetworkAvailability.isAvailable.getter()
{
  return MEMORY[0x1F415AE78]();
}

uint64_t type metadata accessor for EndRequestMessageBase()
{
  return MEMORY[0x1F4152AF0]();
}

uint64_t MUXContextMessage.isRMVEnabled.getter()
{
  return MEMORY[0x1F4152B88]();
}

uint64_t MUXContextMessage.userIdToHomeMember.getter()
{
  return MEMORY[0x1F4152B90]();
}

uint64_t type metadata accessor for MUXContextMessage()
{
  return MEMORY[0x1F4152BA0]();
}

uint64_t TTResponseMessage.MitigationDecision.rawValue.getter()
{
  return MEMORY[0x1F4152BB0]();
}

uint64_t type metadata accessor for TTResponseMessage.MitigationDecision()
{
  return MEMORY[0x1F4152BB8]();
}

uint64_t TTResponseMessage.mitigationDecision.getter()
{
  return MEMORY[0x1F4152BC0]();
}

uint64_t TTResponseMessage.tcuMappedNLResponse.getter()
{
  return MEMORY[0x1F4152BC8]();
}

uint64_t TTResponseMessage.selectedUserAttributes.getter()
{
  return MEMORY[0x1F4152BD0]();
}

uint64_t type metadata accessor for TTResponseMessage()
{
  return MEMORY[0x1F4152C30]();
}

uint64_t type metadata accessor for SessionEndedMessage()
{
  return MEMORY[0x1F4152C50]();
}

uint64_t StartRequestMessageBase.optionalRequestContextData.getter()
{
  return MEMORY[0x1F4152C58]();
}

uint64_t StartRequestMessageBase.inputOrigin.getter()
{
  return MEMORY[0x1F4152C60]();
}

uint64_t RequestContextMessage.isEyesFree.getter()
{
  return MEMORY[0x1F4152E70]();
}

uint64_t RequestContextMessage.audioSource.getter()
{
  return MEMORY[0x1F4152E78]();
}

uint64_t RequestContextMessage.bargeInModes.getter()
{
  return MEMORY[0x1F4152E88]();
}

uint64_t RequestContextMessage.responseMode.getter()
{
  return MEMORY[0x1F4152E90]();
}

uint64_t RequestContextMessage.audioDestination.getter()
{
  return MEMORY[0x1F4152E98]();
}

uint64_t RequestContextMessage.deviceRestrictions.getter()
{
  return MEMORY[0x1F4152EA0]();
}

uint64_t RequestContextMessage.isTextToSpeechEnabled.getter()
{
  return MEMORY[0x1F4152EB0]();
}

uint64_t RequestContextMessage.isTriggerlessFollowup.getter()
{
  return MEMORY[0x1F4152EB8]();
}

uint64_t RequestContextMessage.isVoiceTriggerEnabled.getter()
{
  return MEMORY[0x1F4152EC0]();
}

uint64_t RequestContextMessage.approximatePreviousTTSInterval.getter()
{
  return MEMORY[0x1F4152EE0]();
}

uint64_t type metadata accessor for RequestContextMessage()
{
  return MEMORY[0x1F4152EE8]();
}

uint64_t type metadata accessor for SessionStartedMessage()
{
  return MEMORY[0x1F4152FA8]();
}

uint64_t FallbackToPommesMessage.pommesCandidateId.getter()
{
  return MEMORY[0x1F4153060]();
}

uint64_t FallbackToPommesMessage.delegatedUserDialogActs.getter()
{
  return MEMORY[0x1F4153068]();
}

uint64_t FallbackToPommesMessage.userId.getter()
{
  return MEMORY[0x1F4153078]();
}

uint64_t type metadata accessor for FallbackToPommesMessage()
{
  return MEMORY[0x1F41530C0]();
}

uint64_t type metadata accessor for StartTextRequestMessage()
{
  return MEMORY[0x1F4153140]();
}

uint64_t NLResultCandidateMessage.voiceIdClassification.getter()
{
  return MEMORY[0x1F4153248]();
}

uint64_t type metadata accessor for NLResultCandidateMessage()
{
  return MEMORY[0x1F41532C0]();
}

uint64_t NLResultCandidateMessageBase.userParses.getter()
{
  return MEMORY[0x1F41532C8]();
}

uint64_t NLResultCandidateMessageBase.fallbackParse.getter()
{
  return MEMORY[0x1F41532D0]();
}

uint64_t NLResultCandidateMessageBase.responseVariantResult.getter()
{
  return MEMORY[0x1F41532E8]();
}

uint64_t RunPommesResponseMessage.init(build:)()
{
  return MEMORY[0x1F41533F8]();
}

uint64_t RunPommesResponseMessage.Builder.nlResponse.setter()
{
  return MEMORY[0x1F4153408]();
}

uint64_t RunPommesResponseMessage.Builder.assistantId.setter()
{
  return MEMORY[0x1F4153410]();
}

uint64_t RunPommesResponseMessage.Builder.pommesResult.setter()
{
  return MEMORY[0x1F4153418]();
}

uint64_t RunPommesResponseMessage.Builder.pommesSearchReason.setter()
{
  return MEMORY[0x1F4153420]();
}

uint64_t RunPommesResponseMessage.Builder.source.setter()
{
  return MEMORY[0x1F4153428]();
}

uint64_t RunPommesResponseMessage.Builder.requestId.setter()
{
  return MEMORY[0x1F4153430]();
}

uint64_t RunPommesResponseMessage.Builder.sessionId.setter()
{
  return MEMORY[0x1F4153438]();
}

uint64_t RunPommesResponseMessage.Builder.userInput.setter()
{
  return MEMORY[0x1F4153440]();
}

uint64_t type metadata accessor for RunPommesResponseMessage.UserInput()
{
  return MEMORY[0x1F4153448]();
}

uint64_t type metadata accessor for RunPommesResponseMessage()
{
  return MEMORY[0x1F4153458]();
}

uint64_t type metadata accessor for StartLocalRequestMessage()
{
  return MEMORY[0x1F4153468]();
}

uint64_t AsrResultCandidateMessage.speechPackage.getter()
{
  return MEMORY[0x1F4153498]();
}

uint64_t type metadata accessor for AsrResultCandidateMessage()
{
  return MEMORY[0x1F41534F8]();
}

uint64_t PommesTRPCandidateMessage.init(build:)()
{
  return MEMORY[0x1F4153640]();
}

uint64_t PommesTRPCandidateMessage.Builder.assistantId.setter()
{
  return MEMORY[0x1F4153650]();
}

uint64_t PommesTRPCandidateMessage.Builder.pommesResult.setter()
{
  return MEMORY[0x1F4153658]();
}

uint64_t PommesTRPCandidateMessage.Builder.searchReason.setter()
{
  return MEMORY[0x1F4153660]();
}

uint64_t PommesTRPCandidateMessage.Builder.trpCandidateId.setter()
{
  return MEMORY[0x1F4153668]();
}

uint64_t PommesTRPCandidateMessage.Builder.tcuId.setter()
{
  return MEMORY[0x1F4153670]();
}

uint64_t PommesTRPCandidateMessage.Builder.source.setter()
{
  return MEMORY[0x1F4153678]();
}

uint64_t PommesTRPCandidateMessage.Builder.userId.setter()
{
  return MEMORY[0x1F4153680]();
}

uint64_t PommesTRPCandidateMessage.Builder.requestId.setter()
{
  return MEMORY[0x1F4153688]();
}

uint64_t PommesTRPCandidateMessage.Builder.sessionId.setter()
{
  return MEMORY[0x1F4153690]();
}

uint64_t type metadata accessor for PommesTRPCandidateMessage()
{
  return MEMORY[0x1F4153698]();
}

uint64_t StartSpeechRequestMessage.location.getter()
{
  return MEMORY[0x1F4153700]();
}

uint64_t type metadata accessor for StartSpeechRequestMessage()
{
  return MEMORY[0x1F4153708]();
}

uint64_t TRPCandidateRequestMessage.tcuToContextList.getter()
{
  return MEMORY[0x1F4153738]();
}

uint64_t type metadata accessor for TRPCandidateRequestMessage()
{
  return MEMORY[0x1F4153780]();
}

uint64_t TRPCandidateRequestMessageBase.trpCandidateId.getter()
{
  return MEMORY[0x1F4153788]();
}

uint64_t TRPCandidateRequestMessageBase.userId.getter()
{
  return MEMORY[0x1F4153790]();
}

uint64_t PommesResultCandidateMessage.init(build:)()
{
  return MEMORY[0x1F4153950]();
}

uint64_t PommesResultCandidateMessage.Builder.resultCandidateId.setter()
{
  return MEMORY[0x1F4153960]();
}

uint64_t PommesResultCandidateMessage.Builder.assistantId.setter()
{
  return MEMORY[0x1F4153968]();
}

uint64_t PommesResultCandidateMessage.Builder.searchReason.setter()
{
  return MEMORY[0x1F4153970]();
}

uint64_t PommesResultCandidateMessage.Builder.pommesResponse.setter()
{
  return MEMORY[0x1F4153978]();
}

uint64_t PommesResultCandidateMessage.Builder.error.setter()
{
  return MEMORY[0x1F4153980]();
}

uint64_t PommesResultCandidateMessage.Builder.source.setter()
{
  return MEMORY[0x1F4153988]();
}

uint64_t PommesResultCandidateMessage.Builder.requestId.setter()
{
  return MEMORY[0x1F4153990]();
}

uint64_t PommesResultCandidateMessage.Builder.sessionId.setter()
{
  return MEMORY[0x1F4153998]();
}

uint64_t type metadata accessor for PommesResultCandidateMessage()
{
  return MEMORY[0x1F41539A0]();
}

uint64_t type metadata accessor for StartCandidateRequestMessage()
{
  return MEMORY[0x1F41539E0]();
}

uint64_t type metadata accessor for StartChildTextRequestMessage()
{
  return MEMORY[0x1F4153A50]();
}

uint64_t TextBasedTRPCandidateMessage.tcuId.getter()
{
  return MEMORY[0x1F4153A60]();
}

uint64_t TextBasedTRPCandidateMessage.utterance.getter()
{
  return MEMORY[0x1F4153AB8]();
}

uint64_t type metadata accessor for TextBasedTRPCandidateMessage()
{
  return MEMORY[0x1F4153AC0]();
}

uint64_t ResultCandidateRequestMessageBase.resultCandidateId.getter()
{
  return MEMORY[0x1F4153BA0]();
}

uint64_t type metadata accessor for StartChildSpeechRequestMessage()
{
  return MEMORY[0x1F4153DC8]();
}

uint64_t TextBasedResultCandidateMessage.utterance.getter()
{
  return MEMORY[0x1F4153E78]();
}

uint64_t type metadata accessor for TextBasedResultCandidateMessage()
{
  return MEMORY[0x1F4153E80]();
}

uint64_t UserIdAwareResultCandidateMessageBase.userId.getter()
{
  return MEMORY[0x1F4154010]();
}

uint64_t GestureBasedResultCandidateMessage.gesture.getter()
{
  return MEMORY[0x1F4154078]();
}

uint64_t type metadata accessor for GestureBasedResultCandidateMessage()
{
  return MEMORY[0x1F4154080]();
}

uint64_t type metadata accessor for RewrittenUtteranceCandidateMessage.RewriteReason()
{
  return MEMORY[0x1F4154118]();
}

uint64_t RewrittenUtteranceCandidateMessage.rewriteReason.getter()
{
  return MEMORY[0x1F4154120]();
}

uint64_t RewrittenUtteranceCandidateMessage.originalUserInput.getter()
{
  return MEMORY[0x1F4154128]();
}

uint64_t type metadata accessor for RewrittenUtteranceCandidateMessage()
{
  return MEMORY[0x1F4154198]();
}

uint64_t RequestMessageBase.requestId.getter()
{
  return MEMORY[0x1F4154720]();
}

uint64_t SessionMessageBase.sessionId.getter()
{
  return MEMORY[0x1F4154748]();
}

uint64_t type metadata accessor for SiriUserInput()
{
  return MEMORY[0x1F4154788]();
}

uint64_t dispatch thunk of MessagePublishing.postMessage(_:)()
{
  return MEMORY[0x1F41547C0]();
}

uint64_t MessageBase.assistantId.getter()
{
  return MEMORY[0x1F41547E0]();
}

uint64_t type metadata accessor for MessageSource()
{
  return MEMORY[0x1F4154818]();
}

uint64_t InputOrigin.aceInputOrigin.getter()
{
  return MEMORY[0x1F41548F0]();
}

uint64_t PommesError.rawValue.getter()
{
  return MEMORY[0x1F4154908]();
}

uint64_t type metadata accessor for PommesError()
{
  return MEMORY[0x1F4154910]();
}

uint64_t GestureInput.utterance.getter()
{
  return MEMORY[0x1F4154980]();
}

uint64_t type metadata accessor for GestureInput()
{
  return MEMORY[0x1F4154988]();
}

uint64_t NLParseResponse.userParses.getter()
{
  return MEMORY[0x1F4154A90]();
}

uint64_t NLParseResponse.fallbackParse.getter()
{
  return MEMORY[0x1F4154A98]();
}

uint64_t NLParseResponse.responseStatusCode.getter()
{
  return MEMORY[0x1F4154AA0]();
}

uint64_t NLParseResponse.serverFallbackReason.getter()
{
  return MEMORY[0x1F4154AA8]();
}

uint64_t NLParseResponse.responseVariantResult.getter()
{
  return MEMORY[0x1F4154AB8]();
}

uint64_t NLParseResponse.init(build:)()
{
  return MEMORY[0x1F4154AC0]();
}

uint64_t NLParseResponse.Builder.userParses.setter()
{
  return MEMORY[0x1F4154AC8]();
}

uint64_t NLParseResponse.Builder.fallbackParse.setter()
{
  return MEMORY[0x1F4154AD0]();
}

uint64_t NLParseResponse.Builder.responseStatusCode.setter()
{
  return MEMORY[0x1F4154AD8]();
}

uint64_t type metadata accessor for NLParseResponse()
{
  return MEMORY[0x1F4154AE0]();
}

uint64_t RequestContextData.isEyesFree.getter()
{
  return MEMORY[0x1F4154B60]();
}

uint64_t RequestContextData.audioSource.getter()
{
  return MEMORY[0x1F4154B68]();
}

uint64_t RequestContextData.bargeInModes.getter()
{
  return MEMORY[0x1F4154B78]();
}

uint64_t RequestContextData.responseMode.getter()
{
  return MEMORY[0x1F4154B80]();
}

uint64_t RequestContextData.audioDestination.getter()
{
  return MEMORY[0x1F4154B98]();
}

uint64_t RequestContextData.deviceRestrictions.getter()
{
  return MEMORY[0x1F4154BA0]();
}

uint64_t RequestContextData.isTextToSpeechEnabled.getter()
{
  return MEMORY[0x1F4154BB0]();
}

uint64_t RequestContextData.isTriggerlessFollowup.getter()
{
  return MEMORY[0x1F4154BB8]();
}

uint64_t RequestContextData.isVoiceTriggerEnabled.getter()
{
  return MEMORY[0x1F4154BC0]();
}

uint64_t RequestContextData.approximatePreviousTTSInterval.getter()
{
  return MEMORY[0x1F4154BE8]();
}

uint64_t TCUMappedNLResponse.nlResponse.getter()
{
  return MEMORY[0x1F4154C38]();
}

uint64_t TCUMappedNLResponse.init(tcuId:nlResponse:)()
{
  return MEMORY[0x1F4154C40]();
}

uint64_t TCUMappedNLResponse.tcuId.getter()
{
  return MEMORY[0x1F4154C48]();
}

uint64_t type metadata accessor for TCUMappedNLResponse()
{
  return MEMORY[0x1F4154C50]();
}

uint64_t type metadata accessor for ServerFallbackReason()
{
  return MEMORY[0x1F4154C68]();
}

uint64_t type metadata accessor for ConversationSessionKey()
{
  return MEMORY[0x1F4154CA0]();
}

uint64_t SelectedUserAttributes.classification.getter()
{
  return MEMORY[0x1F4154CD0]();
}

uint64_t type metadata accessor for SelectedUserAttributes()
{
  return MEMORY[0x1F4154CE8]();
}

uint64_t dispatch thunk of ConversationSessionState.value(forKey:userId:)()
{
  return MEMORY[0x1F4154D48]();
}

uint64_t dispatch thunk of ConversationSessionsManaging.conversationSessionState(forConversationSessionId:)()
{
  return MEMORY[0x1F4154D58]();
}

uint64_t UserID.init(sharedUserId:)()
{
  return MEMORY[0x1F4154D98]();
}

uint64_t UserID.sharedUserId.getter()
{
  return MEMORY[0x1F4154DA0]();
}

uint64_t static UserID.defaultUserId.getter()
{
  return MEMORY[0x1F4154DA8]();
}

uint64_t type metadata accessor for UserID()
{
  return MEMORY[0x1F4154DB8]();
}

uint64_t dispatch thunk of Location.toCLLocation()()
{
  return MEMORY[0x1F4154DC0]();
}

uint64_t CurrentRequest.executionRequestId.getter()
{
  return MEMORY[0x1F4150928]();
}

uint64_t InteractionTypeHelper.mapInteractionType(inputOrigin:isEyesFree:isDeviceInStarkMode:isDeviceInCarDND:audioSource:audioDestination:previousInteractionType:)()
{
  return MEMORY[0x1F4150A98]();
}

uint64_t static InteractionTypeHelper.shared.getter()
{
  return MEMORY[0x1F4150AA0]();
}

uint64_t type metadata accessor for InteractionTypeHelper()
{
  return MEMORY[0x1F4150AA8]();
}

uint64_t type metadata accessor for WarmupComponent()
{
  return MEMORY[0x1F4150DC0]();
}

uint64_t type metadata accessor for PommesCandidateId()
{
  return MEMORY[0x1F4150DC8]();
}

uint64_t PommesSearchReason.toInt.getter()
{
  return MEMORY[0x1F4150DD0]();
}

uint64_t type metadata accessor for PommesSearchReason()
{
  return MEMORY[0x1F4150DE0]();
}

uint64_t AppLaunchExperience.init(pluginId:appsClientComponent:queryConfidenceScore:userDialogAct:renderOptions:)()
{
  return MEMORY[0x1F4150DE8]();
}

uint64_t type metadata accessor for AppLaunchExperience()
{
  return MEMORY[0x1F4150DF0]();
}

uint64_t DeviceExpertExperience.init(pluginId:deviceExpertClientComponent:queryConfidenceScore:userDialogAct:)()
{
  return MEMORY[0x1F4150DF8]();
}

uint64_t type metadata accessor for DeviceExpertExperience()
{
  return MEMORY[0x1F4150E00]();
}

uint64_t Google_Protobuf_Int32Value.value.getter()
{
  return MEMORY[0x1F4157E60]();
}

{
  return MEMORY[0x1F4126EB0]();
}

uint64_t type metadata accessor for Google_Protobuf_Int32Value()
{
  return MEMORY[0x1F4157E78]();
}

{
  return MEMORY[0x1F4126EC8]();
}

uint64_t BinaryDecodingOptions.init()()
{
  return MEMORY[0x1F4157F20]();
}

{
  return MEMORY[0x1F4127110]();
}

uint64_t type metadata accessor for BinaryDecodingOptions()
{
  return MEMORY[0x1F4157F28]();
}

{
  return MEMORY[0x1F4127118]();
}

uint64_t Message.init(serializedData:extensions:partial:options:)()
{
  return MEMORY[0x1F4158008]();
}

{
  return MEMORY[0x1F4127340]();
}

uint64_t Google_Protobuf_Int32Value.value.setter()
{
  return MEMORY[0x1F4126EB8]();
}

uint64_t Google_Protobuf_StringValue.value.getter()
{
  return MEMORY[0x1F4126F38]();
}

uint64_t type metadata accessor for Google_Protobuf_StringValue()
{
  return MEMORY[0x1F4126F50]();
}

uint64_t Google_Protobuf_Any.value.getter()
{
  return MEMORY[0x1F4126F98]();
}

uint64_t Google_Protobuf_Any.init(message:partial:typePrefix:)()
{
  return MEMORY[0x1F4126FA0]();
}

uint64_t Google_Protobuf_Any.typeURL.getter()
{
  return MEMORY[0x1F4126FA8]();
}

uint64_t Google_Protobuf_Any.init()()
{
  return MEMORY[0x1F4126FB8]();
}

uint64_t type metadata accessor for Google_Protobuf_Any()
{
  return MEMORY[0x1F4126FC0]();
}

uint64_t Google_Protobuf_Duration.seconds.getter()
{
  return MEMORY[0x1F4127000]();
}

uint64_t type metadata accessor for Google_Protobuf_Duration()
{
  return MEMORY[0x1F4127010]();
}

uint64_t JSONEncodingOptions.init()()
{
  return MEMORY[0x1F41270F8]();
}

uint64_t type metadata accessor for JSONEncodingOptions()
{
  return MEMORY[0x1F4127100]();
}

uint64_t defaultAnyTypeURLPrefix.getter()
{
  return MEMORY[0x1F4127128]();
}

uint64_t Message.jsonString(options:)()
{
  return MEMORY[0x1F4127310]();
}

uint64_t Message.serializedData(partial:)()
{
  return MEMORY[0x1F4127348]();
}

uint64_t Message.init<A>(contiguousBytes:extensions:partial:options:)()
{
  return MEMORY[0x1F4127358]();
}

uint64_t Message.debugDescription.getter()
{
  return MEMORY[0x1F4127378]();
}

Swift::String __swiftcall Message.textFormatString()()
{
  uint64_t v0 = MEMORY[0x1F4127388]();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t static Message.with(_:)()
{
  return MEMORY[0x1F41273A0]();
}

uint64_t dispatch thunk of Experience.renderOptions.getter()
{
  return MEMORY[0x1F4150E08]();
}

uint64_t dispatch thunk of Experience.renderedTexts.getter()
{
  return MEMORY[0x1F4150E10]();
}

uint64_t Experience.userDialogAct.getter()
{
  return MEMORY[0x1F4150E18]();
}

uint64_t dispatch thunk of Experience.queryConfidence.getter()
{
  return MEMORY[0x1F4150E20]();
}

uint64_t dispatch thunk of Experience.pluginIdentifier.getter()
{
  return MEMORY[0x1F4150E28]();
}

uint64_t dispatch thunk of Experience.associatedEntities.getter()
{
  return MEMORY[0x1F4150E30]();
}

uint64_t dispatch thunk of Experience.associatedEntities.setter()
{
  return MEMORY[0x1F4150E38]();
}

uint64_t dispatch thunk of Experience.listenAfterSpeaking.getter()
{
  return MEMORY[0x1F4150E40]();
}

uint64_t dispatch thunk of Experience.redactedRenderedTexts.getter()
{
  return MEMORY[0x1F4150E48]();
}

uint64_t type metadata accessor for Experience()
{
  return MEMORY[0x1F4150E50]();
}

uint64_t PommesResult.resultId.getter()
{
  return MEMORY[0x1F4150E58]();
}

uint64_t type metadata accessor for PommesResult()
{
  return MEMORY[0x1F4150E60]();
}

uint64_t GeoExperience.init(pluginId:geoClientComponent:queryConfidenceScore:userDialogAct:renderOptions:)()
{
  return MEMORY[0x1F4150E68]();
}

uint64_t type metadata accessor for GeoExperience()
{
  return MEMORY[0x1F4150E70]();
}

uint64_t PommesContext.exportPromptContext()()
{
  return MEMORY[0x1F4150E78]();
}

uint64_t PommesContext.exportPegasusConversationContext()()
{
  return MEMORY[0x1F4150E90]();
}

uint64_t PommesContext.promptContext.getter()
{
  return MEMORY[0x1F4150E98]();
}

uint64_t PommesContext.isConfirmation.getter()
{
  return MEMORY[0x1F4150EB8]();
}

Swift::Void __swiftcall PommesContext.addRenderedTexts(_:)(Swift::OpaquePointer a1)
{
}

uint64_t PommesContext.instructionIntent.setter()
{
  return MEMORY[0x1F4150ED0]();
}

uint64_t PommesContext.exportLegacyNLContext()()
{
  return MEMORY[0x1F4150ED8]();
}

Swift::Void __swiftcall PommesContext.addRedactedRenderedTexts(_:)(Swift::OpaquePointer a1)
{
}

uint64_t type metadata accessor for PommesContext.Source()
{
  return MEMORY[0x1F4150EF0]();
}

uint64_t PommesContext.domain.getter()
{
  return MEMORY[0x1F4150EF8]();
}

uint64_t PommesContext.init(source:domain:listenAfterSpeaking:)()
{
  return MEMORY[0x1F4150F00]();
}

uint64_t PommesContext.source.getter()
{
  return MEMORY[0x1F4150F08]();
}

uint64_t PommesContext.update(with:)()
{
  return MEMORY[0x1F4150F10]();
}

uint64_t type metadata accessor for PommesContext()
{
  return MEMORY[0x1F4150F18]();
}

uint64_t dispatch thunk of PommesResponse.setSearchReason(_:)()
{
  return MEMORY[0x1F4150F20]();
}

uint64_t PommesResponse.isCachedResponse.getter()
{
  return MEMORY[0x1F4150F28]();
}

uint64_t dispatch thunk of PommesResponse.experiences.getter()
{
  return MEMORY[0x1F4150F30]();
}

uint64_t PommesResponse.__allocating_init(cachingCoder:requestId:pommesCandidateId:componentsWarmedUp:)()
{
  return MEMORY[0x1F4150F38]();
}

uint64_t dispatch thunk of PommesResponse.searchReason.getter()
{
  return MEMORY[0x1F4150F40]();
}

uint64_t PommesResponse.sharedUserId.getter()
{
  return MEMORY[0x1F4150F48]();
}

uint64_t dispatch thunk of PommesResponse.taskStepLogs.getter()
{
  return MEMORY[0x1F4150F50]();
}

uint64_t dispatch thunk of PommesResponse.clientResults.getter()
{
  return MEMORY[0x1F4150F58]();
}

uint64_t dispatch thunk of PommesResponse.primaryCatIds()()
{
  return MEMORY[0x1F4150F60]();
}

uint64_t dispatch thunk of PommesResponse.renderedTexts.getter()
{
  return MEMORY[0x1F4150F68]();
}

uint64_t PommesResponse.pommesCandidateId.getter()
{
  return MEMORY[0x1F4150F70]();
}

uint64_t PommesResponse.metadataDomainName.getter()
{
  return MEMORY[0x1F4150F78]();
}

uint64_t PommesResponse.conversationContext.getter()
{
  return MEMORY[0x1F4150F80]();
}

uint64_t dispatch thunk of PommesResponse.listenAfterSpeaking.getter()
{
  return MEMORY[0x1F4150F88]();
}

uint64_t PommesResponse.isHandledByPreflight.getter()
{
  return MEMORY[0x1F4150F90]();
}

uint64_t dispatch thunk of PommesResponse.redactedRenderedTexts.getter()
{
  return MEMORY[0x1F4150F98]();
}

uint64_t dispatch thunk of PommesResponse.primaryQueryConfidence()()
{
  return MEMORY[0x1F4150FA0]();
}

uint64_t PommesResponse.searchRequestUtterance.getter()
{
  return MEMORY[0x1F4150FA8]();
}

uint64_t dispatch thunk of PommesResponse.userSensitiveTier1Logs.getter()
{
  return MEMORY[0x1F4150FB0]();
}

uint64_t dispatch thunk of PommesResponse.pegasusDomainFlowStepLog.getter()
{
  return MEMORY[0x1F4150FC8]();
}

uint64_t dispatch thunk of PommesResponse.primaryInstructionIntent()()
{
  return MEMORY[0x1F4150FD0]();
}

uint64_t PommesResponse.isLowConfidenceKnowledgeResult.getter()
{
  return MEMORY[0x1F4150FE0]();
}

uint64_t PommesResponse.preflightClientHandlerIdentifier.getter()
{
  return MEMORY[0x1F4150FE8]();
}

uint64_t dispatch thunk of PommesResponse.pegasusDomainUserSensitiveTier1Log.getter()
{
  return MEMORY[0x1F4150FF0]();
}

uint64_t dispatch thunk of PommesResponse.encode(cachingCoder:)()
{
  return MEMORY[0x1F4150FF8]();
}

uint64_t PommesResponse.Builder.isCachedResponse.setter()
{
  return MEMORY[0x1F4151000]();
}

uint64_t PommesResponse.Builder.experiences.setter()
{
  return MEMORY[0x1F4151008]();
}

uint64_t PommesResponse.Builder.searchReason.setter()
{
  return MEMORY[0x1F4151010]();
}

uint64_t PommesResponse.Builder.sharedUserId.setter()
{
  return MEMORY[0x1F4151018]();
}

uint64_t PommesResponse.Builder.taskStepLogs.setter()
{
  return MEMORY[0x1F4151020]();
}

uint64_t PommesResponse.Builder.clientResults.setter()
{
  return MEMORY[0x1F4151028]();
}

uint64_t PommesResponse.Builder.renderedTexts.setter()
{
  return MEMORY[0x1F4151030]();
}

uint64_t PommesResponse.Builder.asrRecognition.setter()
{
  return MEMORY[0x1F4151038]();
}

uint64_t PommesResponse.Builder.pommesCandidateId.setter()
{
  return MEMORY[0x1F4151040]();
}

uint64_t PommesResponse.Builder.componentsWarmedUp.setter()
{
  return MEMORY[0x1F4151048]();
}

uint64_t PommesResponse.Builder.metadataDomainName.setter()
{
  return MEMORY[0x1F4151050]();
}

uint64_t PommesResponse.Builder.requestCountryCode.setter()
{
  return MEMORY[0x1F4151058]();
}

uint64_t PommesResponse.Builder.conversationContext.setter()
{
  return MEMORY[0x1F4151060]();
}

uint64_t PommesResponse.Builder.encodedNLUserParses.setter()
{
  return MEMORY[0x1F4151068]();
}

uint64_t PommesResponse.Builder.listenAfterSpeaking.setter()
{
  return MEMORY[0x1F4151070]();
}

uint64_t PommesResponse.Builder.isHandledByPreflight.setter()
{
  return MEMORY[0x1F4151078]();
}

uint64_t PommesResponse.Builder.redactedRenderedTexts.setter()
{
  return MEMORY[0x1F4151080]();
}

uint64_t PommesResponse.Builder.responseVariantResult.setter()
{
  return MEMORY[0x1F4151088]();
}

uint64_t PommesResponse.Builder.encodedNLFallbackParse.setter()
{
  return MEMORY[0x1F4151090]();
}

uint64_t PommesResponse.Builder.searchRequestUtterance.setter()
{
  return MEMORY[0x1F4151098]();
}

uint64_t PommesResponse.Builder.userSensitiveTier1Logs.setter()
{
  return MEMORY[0x1F41510A0]();
}

uint64_t PommesResponse.Builder.pegasusDomainFlowStepLog.setter()
{
  return MEMORY[0x1F41510A8]();
}

uint64_t PommesResponse.Builder.metadataFallbackTriggered.setter()
{
  return MEMORY[0x1F41510B0]();
}

uint64_t PommesResponse.Builder.isLowConfidenceKnowledgeResult.setter()
{
  return MEMORY[0x1F41510B8]();
}

uint64_t PommesResponse.Builder.preflightClientHandlerIdentifier.setter()
{
  return MEMORY[0x1F41510C0]();
}

uint64_t PommesResponse.Builder.pegasusDomainUserSensitiveTier1Log.setter()
{
  return MEMORY[0x1F41510C8]();
}

uint64_t PommesResponse.Builder.requestId.setter()
{
  return MEMORY[0x1F41510D0]();
}

uint64_t PommesResponse.requestId.getter()
{
  return MEMORY[0x1F41510D8]();
}

uint64_t type metadata accessor for PommesResponse()
{
  return MEMORY[0x1F41510E0]();
}

uint64_t PommesResponse.__allocating_init(_:)()
{
  return MEMORY[0x1F41510E8]();
}

uint64_t AudioExperience.init(serverAudioResults:audioUnderstanding:playbackSignals:internalSignals:pegasusAudioType:launchID:systemExtensionBundleID:boltProxiedBundleID:shouldPerformAppSelection:audioClientComponent:pluginId:queryConfidence:userDialogAct:isGlideEligible:networkAvailableAtRequest:matchingSpans:multiUserContext:)()
{
  return MEMORY[0x1F41510F0]();
}

uint64_t dispatch thunk of AudioExperience.serverAudioResults.getter()
{
  return MEMORY[0x1F41510F8]();
}

uint64_t AudioExperience.pegasusAudioType.getter()
{
  return MEMORY[0x1F4151100]();
}

uint64_t dispatch thunk of AudioExperience.internalSignals.getter()
{
  return MEMORY[0x1F4151108]();
}

uint64_t dispatch thunk of AudioExperience.isGlideEligible.getter()
{
  return MEMORY[0x1F4151110]();
}

uint64_t AudioExperience.playbackSignals.getter()
{
  return MEMORY[0x1F4151118]();
}

uint64_t AudioExperience.audioUnderstanding.getter()
{
  return MEMORY[0x1F4151120]();
}

uint64_t AudioExperience.boltProxiedBundleID.getter()
{
  return MEMORY[0x1F4151128]();
}

uint64_t AudioExperience.audioClientComponent.getter()
{
  return MEMORY[0x1F4151130]();
}

uint64_t AudioExperience.systemExtensionBundleID.getter()
{
  return MEMORY[0x1F4151138]();
}

uint64_t dispatch thunk of AudioExperience.networkAvailableAtRequest.getter()
{
  return MEMORY[0x1F4151140]();
}

uint64_t AudioExperience.shouldPerformAppSelection.getter()
{
  return MEMORY[0x1F4151148]();
}

uint64_t AudioExperience.Builder.serverAudioResults.setter()
{
  return MEMORY[0x1F4151150]();
}

uint64_t AudioExperience.Builder.pegasusAudioType.setter()
{
  return MEMORY[0x1F4151158]();
}

uint64_t AudioExperience.Builder.internalSignals.setter()
{
  return MEMORY[0x1F4151160]();
}

uint64_t AudioExperience.Builder.isGlideEligible.setter()
{
  return MEMORY[0x1F4151168]();
}

uint64_t AudioExperience.Builder.playbackSignals.setter()
{
  return MEMORY[0x1F4151170]();
}

uint64_t AudioExperience.Builder.audioUnderstanding.setter()
{
  return MEMORY[0x1F4151178]();
}

uint64_t AudioExperience.Builder.boltProxiedBundleID.setter()
{
  return MEMORY[0x1F4151180]();
}

uint64_t AudioExperience.Builder.audioClientComponent.setter()
{
  return MEMORY[0x1F4151188]();
}

uint64_t AudioExperience.Builder.systemExtensionBundleID.setter()
{
  return MEMORY[0x1F4151190]();
}

uint64_t AudioExperience.Builder.networkAvailableAtRequest.setter()
{
  return MEMORY[0x1F4151198]();
}

uint64_t AudioExperience.Builder.shouldPerformAppSelection.setter()
{
  return MEMORY[0x1F41511A0]();
}

uint64_t AudioExperience.Builder.launchID.setter()
{
  return MEMORY[0x1F41511A8]();
}

uint64_t AudioExperience.launchID.getter()
{
  return MEMORY[0x1F41511B0]();
}

uint64_t AudioExperience.init(pluginId:queryConfidence:userDialogAct:builder:)()
{
  return MEMORY[0x1F41511B8]();
}

uint64_t AudioExperience.__allocating_init(pluginId:audioClientComponent:queryConfidenceScore:userDialogAct:clientExperienceSignals:renderOptions:)()
{
  return MEMORY[0x1F41511C0]();
}

uint64_t type metadata accessor for AudioExperience()
{
  return MEMORY[0x1F41511C8]();
}

uint64_t VideoExperience.init(pluginId:videoClientComponent:queryConfidenceScore:userDialogAct:renderOptions:)()
{
  return MEMORY[0x1F41511D0]();
}

uint64_t type metadata accessor for VideoExperience()
{
  return MEMORY[0x1F41511D8]();
}

uint64_t VocabularyField.init(label:value:fieldType:)()
{
  return MEMORY[0x1F41511E0]();
}

uint64_t VocabularyField.value.getter()
{
  return MEMORY[0x1F41511E8]();
}

uint64_t VocabularyField.fieldType.getter()
{
  return MEMORY[0x1F41511F0]();
}

uint64_t type metadata accessor for VocabularyField()
{
  return MEMORY[0x1F41511F8]();
}

uint64_t VocabularyResult.semanticValue.getter()
{
  return MEMORY[0x1F4151200]();
}

uint64_t dispatch thunk of VocabularyResult.__allocating_init(appId:itemId:itemType:fieldTypes:score:spanBegin:spanEnd:semanticValue:fields:userId:)()
{
  return MEMORY[0x1F4151208]();
}

uint64_t VocabularyResult.fields.getter()
{
  return MEMORY[0x1F4151210]();
}

uint64_t VocabularyResult.itemId.getter()
{
  return MEMORY[0x1F4151218]();
}

uint64_t VocabularyResult.userId.getter()
{
  return MEMORY[0x1F4151220]();
}

uint64_t VocabularyResult.itemType.getter()
{
  return MEMORY[0x1F4151228]();
}

uint64_t dispatch thunk of VocabularyResult.fieldType.getter()
{
  return MEMORY[0x1F4151230]();
}

uint64_t type metadata accessor for VocabularyResult()
{
  return MEMORY[0x1F4151238]();
}

uint64_t ClientAudioResult.vocabularyResult.getter()
{
  return MEMORY[0x1F4151240]();
}

Swift::String __swiftcall ClientAudioResult.Scheme.buildDeviceID(withId:)(Swift::String withId)
{
  uint64_t v1 = MEMORY[0x1F4151248](withId._countAndFlagsBits, withId._object);
  result._object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

uint64_t static ClientAudioResult.Scheme.from(_:)()
{
  return MEMORY[0x1F4151250]();
}

uint64_t type metadata accessor for ClientAudioResult.Scheme()
{
  return MEMORY[0x1F4151258]();
}

uint64_t ClientAudioResult.init(domain:vocabularyResult:)()
{
  return MEMORY[0x1F4151260]();
}

uint64_t type metadata accessor for ClientAudioResult()
{
  return MEMORY[0x1F4151268]();
}

uint64_t dispatch thunk of GenericExperience.sageExperience.setter()
{
  return MEMORY[0x1F4151270]();
}

uint64_t GenericExperience.init(components:queryConfidenceScore:userDialogAct:intent:renderOptions:)()
{
  return MEMORY[0x1F4151278]();
}

uint64_t dispatch thunk of GenericExperience.serverSuggestions.setter()
{
  return MEMORY[0x1F4151290]();
}

uint64_t type metadata accessor for GenericExperience()
{
  return MEMORY[0x1F4151298]();
}

uint64_t PhoneCallExperience.__allocating_init(phoneCall:queryConfidenceScore:)()
{
  return MEMORY[0x1F41512A0]();
}

uint64_t type metadata accessor for PhoneCallExperience()
{
  return MEMORY[0x1F41512A8]();
}

uint64_t type metadata accessor for PommesRenderOptions.PromptType()
{
  return MEMORY[0x1F41512B0]();
}

uint64_t PommesRenderOptions.promptTypes.getter()
{
  return MEMORY[0x1F41512B8]();
}

uint64_t PommesRenderOptions.Builder.promptTypes.setter()
{
  return MEMORY[0x1F41512C0]();
}

uint64_t PommesRenderOptions.Builder.switchProfile.setter()
{
  return MEMORY[0x1F41512C8]();
}

uint64_t PommesRenderOptions.Builder.isSquawkResponse.setter()
{
  return MEMORY[0x1F41512D0]();
}

uint64_t PommesRenderOptions.Builder.isPhoneCallActive.setter()
{
  return MEMORY[0x1F41512D8]();
}

uint64_t PommesRenderOptions.Builder.isImmersiveExperience.setter()
{
  return MEMORY[0x1F41512E0]();
}

uint64_t PommesRenderOptions.Builder.preserveResultSpaceIfPossible.setter()
{
  return MEMORY[0x1F41512E8]();
}

uint64_t type metadata accessor for PommesRenderOptions()
{
  return MEMORY[0x1F41512F0]();
}

uint64_t PommesRenderOptions.init(_:)()
{
  return MEMORY[0x1F41512F8]();
}

uint64_t ClientExperienceSignals.matchingSpans.setter()
{
  return MEMORY[0x1F4151300]();
}

uint64_t ClientExperienceSignals.init(isGlideEligible:networkAvailableAtRequest:isPhoneCallActive:)()
{
  return MEMORY[0x1F4151308]();
}

uint64_t ClientExperienceSignals.isGlideEligible.setter()
{
  return MEMORY[0x1F4151310]();
}

uint64_t ClientExperienceSignals.multiUserContext.setter()
{
  return MEMORY[0x1F4151318]();
}

uint64_t ClientExperienceSignals.isPhoneCallActive.getter()
{
  return MEMORY[0x1F4151320]();
}

uint64_t ClientExperienceSignals.isPhoneCallActive.setter()
{
  return MEMORY[0x1F4151328]();
}

uint64_t ClientExperienceSignals.glideEligibilityPerSharedId.modify()
{
  return MEMORY[0x1F4151330]();
}

uint64_t type metadata accessor for ClientExperienceSignals()
{
  return MEMORY[0x1F4151338]();
}

uint64_t static InsightRequestSummaryKey.bridgeName.getter()
{
  return MEMORY[0x1F4158728]();
}

uint64_t static InsightRequestSummaryKey.assistantId.getter()
{
  return MEMORY[0x1F4158730]();
}

uint64_t static InsightRequestSummaryKey.resultCandidateId.getter()
{
  return MEMORY[0x1F4158748]();
}

uint64_t static InsightRequestSummaryKey.messageDescription.getter()
{
  return MEMORY[0x1F4158750]();
}

uint64_t InsightRequestSummaryKey.init(rawValue:)()
{
  return MEMORY[0x1F4158768]();
}

uint64_t static InsightRequestSummaryKey.requestId.getter()
{
  return MEMORY[0x1F4158770]();
}

uint64_t static InsightRequestSummaryKey.sessionId.getter()
{
  return MEMORY[0x1F4158778]();
}

uint64_t static InsightRequestSummaryKey.utterance.getter()
{
  return MEMORY[0x1F4158780]();
}

uint64_t type metadata accessor for InsightRequestSummaryKey()
{
  return MEMORY[0x1F4158788]();
}

uint64_t InsightRequestSummaryLogger.emitDebug(_:)()
{
  return MEMORY[0x1F4158798]();
}

uint64_t InsightRequestSummaryLogger.init()()
{
  return MEMORY[0x1F41587A0]();
}

uint64_t type metadata accessor for InsightRequestSummaryLogger()
{
  return MEMORY[0x1F41587A8]();
}

uint64_t dispatch thunk of CandidateRequestAwareBridgeBase.requestIdToCandidateRequestProcessor.modify()
{
  return MEMORY[0x1F41587B0]();
}

uint64_t dispatch thunk of CandidateRequestAwareBridgeBase.activeRequestProcessor.getter()
{
  return MEMORY[0x1F41587C8]();
}

uint64_t dispatch thunk of CandidateRequestAwareBridgeBase.registerMessageHandler<A, B>(_:messageHandlerType:)()
{
  return MEMORY[0x1F41587E8]();
}

uint64_t CandidateRequestAwareBridgeBase.init(name:messagePublisher:serviceHelper:queue:conversationSessionsManager:logger:waitBeforeReplacingActiveRequest:)()
{
  return MEMORY[0x1F41587F0]();
}

uint64_t CandidateRequestAwareBridgeBase.deinit()
{
  return MEMORY[0x1F41587F8]();
}

uint64_t RequestProcessorBase.rootLevelRequestId.getter()
{
  return MEMORY[0x1F4158808]();
}

uint64_t RequestProcessorBase.init(assistantId:sessionId:requestId:name:messagePublisher:serviceHelper:rootLevelRequestId:)()
{
  return MEMORY[0x1F4158810]();
}

uint64_t RequestProcessorBase.assistantId.getter()
{
  return MEMORY[0x1F4158818]();
}

uint64_t RequestProcessorBase.requestQueue.getter()
{
  return MEMORY[0x1F4158820]();
}

uint64_t RequestProcessorBase.messagePublisher.getter()
{
  return MEMORY[0x1F4158830]();
}

uint64_t RequestProcessorBase.requestId.getter()
{
  return MEMORY[0x1F4158840]();
}

uint64_t RequestProcessorBase.sessionId.getter()
{
  return MEMORY[0x1F4158848]();
}

uint64_t RequestProcessorBase.deinit()
{
  return MEMORY[0x1F4158850]();
}

uint64_t type metadata accessor for MessageHandlerType()
{
  return MEMORY[0x1F41588C8]();
}

uint64_t dispatch thunk of InstrumentationUtil.powerLogger()()
{
  return MEMORY[0x1F41588D8]();
}

uint64_t dispatch thunk of InstrumentationUtil.buildWrapperEventMessage(_:_:logResourceUtilization:)()
{
  return MEMORY[0x1F41588E8]();
}

uint64_t InstrumentationUtil.init()()
{
  return MEMORY[0x1F41588F8]();
}

uint64_t type metadata accessor for InstrumentationUtil()
{
  return MEMORY[0x1F4158900]();
}

uint64_t dispatch thunk of MessageDispatchingBridgeBase.registerMessageHandler<A>(_:)()
{
  return MEMORY[0x1F4158940]();
}

uint64_t MessageDispatchingBridgeBase.serviceHelper.getter()
{
  return MEMORY[0x1F4158948]();
}

uint64_t MessageDispatchingBridgeBase.messagePublisher.getter()
{
  return MEMORY[0x1F4158950]();
}

uint64_t dispatch thunk of MessageDispatchingBridgeBase.registerCommandHandler<A>(_:)()
{
  return MEMORY[0x1F4158958]();
}

uint64_t MessageDispatchingBridgeBase.conversationSessionsManaging.getter()
{
  return MEMORY[0x1F4158960]();
}

uint64_t MessageDispatchingBridgeBase.name.getter()
{
  return MEMORY[0x1F4158968]();
}

uint64_t static MUXUtils.singleKnownUserInHome(muxContextMessage:)()
{
  return MEMORY[0x1F4158A00]();
}

uint64_t ReferenceResolutionClient.__allocating_init()()
{
  return MEMORY[0x1F4158268]();
}

uint64_t type metadata accessor for ReferenceResolutionClient()
{
  return MEMORY[0x1F4158270]();
}

uint64_t dispatch thunk of RRReferenceResolverProtocol.resolve(query:)()
{
  return MEMORY[0x1F4158280]();
}

uint64_t dispatch thunk of RRReferenceResolverProtocol.resolve(reference:)()
{
  return MEMORY[0x1F4158288]();
}

uint64_t RRReferenceResolverProtocol.retrieveEntityType(query:)()
{
  return MEMORY[0x1F4158290]();
}

uint64_t RRReferenceResolverProtocol.resolve(query:)()
{
  return MEMORY[0x1F4158298]();
}

uint64_t type metadata accessor for ExperimentationAnalyticsManager()
{
  return MEMORY[0x1F4104ED0]();
}

uint64_t type metadata accessor for PLUSSuggestionNoveltyState()
{
  return MEMORY[0x1F41580D8]();
}

uint64_t type metadata accessor for PLUSSuggestionSurfacedState()
{
  return MEMORY[0x1F41580E0]();
}

uint64_t type metadata accessor for PLUSSuggestionRedundancyState()
{
  return MEMORY[0x1F41580E8]();
}

uint64_t type metadata accessor for PimsLocality()
{
  return MEMORY[0x1F41580F0]();
}

uint64_t dispatch thunk of PimsRuntimeLogging.logSuggestionMetadata(requestId:suggestions:)()
{
  return MEMORY[0x1F4158108]();
}

uint64_t dispatch thunk of PimsRuntimeLogging.logCandidateSuggestions(requestId:enablementStatus:pimsIds:)()
{
  return MEMORY[0x1F4158110]();
}

uint64_t static PimsClientTreatment.== infix(_:_:)()
{
  return MEMORY[0x1F4158118]();
}

uint64_t type metadata accessor for PimsClientTreatment()
{
  return MEMORY[0x1F4158120]();
}

uint64_t static PimsServerTreatment.== infix(_:_:)()
{
  return MEMORY[0x1F4158128]();
}

uint64_t type metadata accessor for PimsServerTreatment()
{
  return MEMORY[0x1F4158130]();
}

uint64_t getPimsRuntimeLogger()()
{
  return MEMORY[0x1F4158140]();
}

uint64_t dispatch thunk of MediaSuggestionManager.fetchStatus()()
{
  return MEMORY[0x1F4158168]();
}

uint64_t type metadata accessor for MediaSuggestionManager.EnablementStatus()
{
  return MEMORY[0x1F4158170]();
}

uint64_t MediaSuggestionManager.init()()
{
  return MEMORY[0x1F4158178]();
}

uint64_t type metadata accessor for MediaSuggestionManager()
{
  return MEMORY[0x1F4158180]();
}

uint64_t PimsSuggestionMetadata.pimsId.getter()
{
  return MEMORY[0x1F4158188]();
}

uint64_t PimsSuggestionMetadata.init(pimsId:locality:serverTreatment:clientTreatment:suggestionSurfaced:noveltyState:redundancyState:)()
{
  return MEMORY[0x1F4158190]();
}

uint64_t type metadata accessor for PimsSuggestionMetadata()
{
  return MEMORY[0x1F4158198]();
}

uint64_t OSSignpostID.init(log:object:)()
{
  return MEMORY[0x1F4188560]();
}

uint64_t OSSignpostID.init(log:)()
{
  return MEMORY[0x1F4188568]();
}

uint64_t OSSignpostID.rawValue.getter()
{
  return MEMORY[0x1F4188570]();
}

uint64_t static OSSignpostID.exclusive.getter()
{
  return MEMORY[0x1F4188578]();
}

uint64_t type metadata accessor for OSSignpostID()
{
  return MEMORY[0x1F4188580]();
}

uint64_t OSSignposter.init(logger:)()
{
  return MEMORY[0x1F4188590]();
}

uint64_t OSSignposter.logHandle.getter()
{
  return MEMORY[0x1F41885B0]();
}

uint64_t OSSignposter.init(subsystem:category:)()
{
  return MEMORY[0x1F41885B8]();
}

uint64_t type metadata accessor for OSSignposter()
{
  return MEMORY[0x1F41885D0]();
}

uint64_t type metadata accessor for OSSignpostError()
{
  return MEMORY[0x1F41885E0]();
}

uint64_t OSSignpostIntervalState.signpostID.getter()
{
  return MEMORY[0x1F4188650]();
}

uint64_t OSSignpostIntervalState.init(id:isOpen:)()
{
  return MEMORY[0x1F4188658]();
}

uint64_t type metadata accessor for OSSignpostIntervalState()
{
  return MEMORY[0x1F4188660]();
}

uint64_t checkForErrorAndConsumeState(state:)()
{
  return MEMORY[0x1F4188668]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x1F4188670]();
}

uint64_t Logger.init(subsystem:category:)()
{
  return MEMORY[0x1F4188680]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t static RRMetadata.== infix(_:_:)()
{
  return MEMORY[0x1F41582C0]();
}

uint64_t type metadata accessor for RRMetadata()
{
  return MEMORY[0x1F41582C8]();
}

uint64_t RRCandidate.score.getter()
{
  return MEMORY[0x1F41582D0]();
}

uint64_t RRCandidate.entity.getter()
{
  return MEMORY[0x1F41582D8]();
}

uint64_t type metadata accessor for RRCandidate()
{
  return MEMORY[0x1F41582E0]();
}

uint64_t ResolveQuery.init(referenceEntity:alternativeEntityTypes:restrictedEntitiesKey:)()
{
  return MEMORY[0x1F41582E8]();
}

uint64_t type metadata accessor for ResolveQuery()
{
  return MEMORY[0x1F41582F0]();
}

uint64_t type metadata accessor for RRDataSourceMetadataValue()
{
  return MEMORY[0x1F4158308]();
}

uint64_t type metadata accessor for RRQuery()
{
  return MEMORY[0x1F4158310]();
}

uint64_t RREntity.appBundleId.getter()
{
  return MEMORY[0x1F4158328]();
}

uint64_t RREntity.id.getter()
{
  return MEMORY[0x1F4158340]();
}

uint64_t RREntity.metadata.getter()
{
  return MEMORY[0x1F4158360]();
}

uint64_t RREntity.usoEntity.getter()
{
  return MEMORY[0x1F4158368]();
}

uint64_t type metadata accessor for RREntity()
{
  return MEMORY[0x1F4158370]();
}

uint64_t type metadata accessor for RRResult()
{
  return MEMORY[0x1F4158380]();
}

Swift::Void __swiftcall AnyCancellable.cancel()()
{
}

uint64_t type metadata accessor for AnyCancellable()
{
  return MEMORY[0x1F40D6960]();
}

uint64_t PassthroughSubject.send(_:)()
{
  return MEMORY[0x1F40D6A08]();
}

uint64_t PassthroughSubject.init()()
{
  return MEMORY[0x1F40D6A20]();
}

uint64_t Publisher.eraseToAnyPublisher()()
{
  return MEMORY[0x1F40D6BD8]();
}

uint64_t Publisher<>.sink(receiveValue:)()
{
  return MEMORY[0x1F40D6E18]();
}

uint64_t type metadata accessor for DispatchTimeInterval()
{
  return MEMORY[0x1F4186C68]();
}

uint64_t static DispatchTimeoutResult.== infix(_:_:)()
{
  return MEMORY[0x1F4186C70]();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return MEMORY[0x1F4186CB8]();
}

uint64_t type metadata accessor for DispatchQoS.QoSClass()
{
  return MEMORY[0x1F4186CD8]();
}

uint64_t static DispatchQoS.background.getter()
{
  return MEMORY[0x1F4186CF0]();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return MEMORY[0x1F4186D00]();
}

uint64_t static DispatchQoS.userInitiated.getter()
{
  return MEMORY[0x1F4186D10]();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return MEMORY[0x1F4186D68]();
}

uint64_t static DispatchTime.now()()
{
  return MEMORY[0x1F4186E20]();
}

uint64_t DispatchTime.advanced(by:)()
{
  return MEMORY[0x1F4186E30]();
}

uint64_t type metadata accessor for DispatchTime()
{
  return MEMORY[0x1F4186E58]();
}

uint64_t + infix(_:_:)()
{
  return MEMORY[0x1F4186F00]();
}

uint64_t Dictionary.init()()
{
  return MEMORY[0x1F4183270]();
}

uint64_t Array.init()()
{
  return MEMORY[0x1F4183280]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x1F40E5FF8]();
}

uint64_t static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x1F40E6020]();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E6028]();
}

uint64_t Dictionary.description.getter()
{
  return MEMORY[0x1F4183318]();
}

Swift::Void __swiftcall Dictionary.reserveCapacity(_:)(Swift::Int a1)
{
}

uint64_t type metadata accessor for Dictionary()
{
  return MEMORY[0x1F41834A8]();
}

uint64_t Dictionary.subscript.getter()
{
  return MEMORY[0x1F41834F8]();
}

uint64_t Dictionary.subscript.setter()
{
  return MEMORY[0x1F4183500]();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t Character.isWhitespace.getter()
{
  return MEMORY[0x1F4183630]();
}

uint64_t BidirectionalCollection<>.starts<A>(with:)()
{
  return MEMORY[0x1F4188420]();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return MEMORY[0x1F4183730]();
}

uint64_t dispatch thunk of static Comparable.< infix(_:_:)()
{
  return MEMORY[0x1F4183740]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x1F4183838]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x1F40E6198]();
}

uint64_t static String._forceBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x1F40E61B0]();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x1F40E61C0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E61D0]();
}

uint64_t String.init(data:encoding:)()
{
  return MEMORY[0x1F40E61F0]();
}

uint64_t String.init(format:_:)()
{
  return MEMORY[0x1F40E6230]();
}

uint64_t static String.Encoding.utf8.getter()
{
  return MEMORY[0x1F40E6270]();
}

uint64_t type metadata accessor for String.Encoding()
{
  return MEMORY[0x1F40E62A8]();
}

uint64_t String.init<A>(describing:)()
{
  return MEMORY[0x1F4183880]();
}

Swift::String __swiftcall String.lowercased()()
{
  uint64_t v0 = MEMORY[0x1F4183898]();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t String.utf8CString.getter()
{
  return MEMORY[0x1F41838B8]();
}

uint64_t static String._fromSubstring(_:)()
{
  return MEMORY[0x1F41838D8]();
}

uint64_t String.removeSubrange(_:)()
{
  return MEMORY[0x1F41838E8]();
}

uint64_t String.init(validatingUTF8:)()
{
  return MEMORY[0x1F41838F8]();
}

uint64_t String.axLowercasedFirstLetter.getter()
{
  return MEMORY[0x1F4105DD8]();
}

uint64_t String.debugDescription.getter()
{
  return MEMORY[0x1F4183918]();
}

uint64_t static String._uncheckedFromUTF8(_:)()
{
  return MEMORY[0x1F4183958]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t String.count.getter()
{
  return MEMORY[0x1F41839F0]();
}

uint64_t String.index(after:)()
{
  return MEMORY[0x1F41839F8]();
}

uint64_t String.index(before:)()
{
  return MEMORY[0x1F4183A00]();
}

uint64_t String.index(_:offsetBy:limitedBy:)()
{
  return MEMORY[0x1F4183A08]();
}

uint64_t String.index(_:offsetBy:)()
{
  return MEMORY[0x1F4183A10]();
}

uint64_t String.append<A>(contentsOf:)()
{
  return MEMORY[0x1F4183A28]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t String.init(cString:)()
{
  return MEMORY[0x1F4183A60]();
}

{
  return MEMORY[0x1F4183A68]();
}

Swift::String_optional __swiftcall String.Iterator.next()()
{
  uint64_t v0 = MEMORY[0x1F4183A78]();
  result.value._object = v1;
  result.value._countAndFlagsBits = v0;
  return result;
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return MEMORY[0x1F4183A88]();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return MEMORY[0x1F4183AA0]();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return MEMORY[0x1F4183AB0]();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return MEMORY[0x1F4183B10]();
}

uint64_t String.UTF16View.subscript.getter()
{
  return MEMORY[0x1F4183B28]();
}

Swift::Bool __swiftcall String.hasPrefix(_:)(Swift::String a1)
{
  return MEMORY[0x1F4183B30](a1._countAndFlagsBits, a1._object);
}

uint64_t String.hashValue.getter()
{
  return MEMORY[0x1F4183B40]();
}

uint64_t String.subscript.getter()
{
  return MEMORY[0x1F4183B58]();
}

{
  return MEMORY[0x1F4183BA0]();
}

uint64_t String.init(_:)()
{
  return MEMORY[0x1F4183B70]();
}

uint64_t String.init<A>(_:)()
{
  return MEMORY[0x1F4183B90]();
}

uint64_t Sequence.compactMap<A>(_:)()
{
  return MEMORY[0x1F4183BE8]();
}

uint64_t Sequence.reduce<A>(_:_:)()
{
  return MEMORY[0x1F4183C68]();
}

uint64_t Sequence<>.joined(separator:)()
{
  return MEMORY[0x1F4183CF0]();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return MEMORY[0x1F4183D70]();
}

uint64_t RawRepresentable<>.encode(to:)()
{
  return MEMORY[0x1F4183D80]();
}

uint64_t RawRepresentable<>.init(from:)()
{
  return MEMORY[0x1F4183DF8]();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x1F4183E80]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x1F40E6340]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E6368]();
}

uint64_t Array.description.getter()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t specialized Array._endMutation()()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t Array.debugDescription.getter()
{
  return MEMORY[0x1F4183ED0]();
}

uint64_t static Array.+ infix(_:_:)()
{
  return MEMORY[0x1F4183ED8]();
}

uint64_t static Array._allocateUninitialized(_:)()
{
  return MEMORY[0x1F4183EF0]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t Array.count.getter()
{
  return MEMORY[0x1F4183F40]();
}

uint64_t Array.append(_:)()
{
  return MEMORY[0x1F4183F60]();
}

uint64_t type metadata accessor for Array()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t Array.subscript.getter()
{
  return MEMORY[0x1F4183FF0]();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t CheckedContinuation.resume(throwing:)()
{
  return MEMORY[0x1F4187C00]();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t static MainActor.shared.getter()
{
  return MEMORY[0x1F4187C98]();
}

uint64_t type metadata accessor for MainActor()
{
  return MEMORY[0x1F4187CA0]();
}

uint64_t static TaskPriority.background.getter()
{
  return MEMORY[0x1F4187CA8]();
}

uint64_t static TaskPriority.userInitiated.getter()
{
  return MEMORY[0x1F4187CB0]();
}

uint64_t static TaskPriority.low.getter()
{
  return MEMORY[0x1F4187CD8]();
}

uint64_t static TaskPriority.high.getter()
{
  return MEMORY[0x1F4187CE0]();
}

uint64_t TaskPriority.rawValue.getter()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t type metadata accessor for TaskPriority()
{
  return MEMORY[0x1F4187D00]();
}

Swift::Void __swiftcall Task.cancel()()
{
}

uint64_t static Task<>.isCancelled.getter()
{
  return MEMORY[0x1F4187DC8]();
}

Swift::Void __swiftcall ThrowingTaskGroup.cancelAll()()
{
}

uint64_t Double.description.getter()
{
  return MEMORY[0x1F4184008]();
}

uint64_t Double.write<A>(to:)()
{
  return MEMORY[0x1F4184048]();
}

uint64_t Float.write<A>(to:)()
{
  return MEMORY[0x1F41840C0]();
}

NSSet __swiftcall Set._bridgeToObjectiveC()()
{
  return (NSSet)MEMORY[0x1F40E6438]();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1F40E6460]();
}

uint64_t Set.description.getter()
{
  return MEMORY[0x1F4184100]();
}

uint64_t Set.init(minimumCapacity:)()
{
  return MEMORY[0x1F4184138]();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return MEMORY[0x1F41841D0]();
}

uint64_t dispatch thunk of Collection.count.getter()
{
  return MEMORY[0x1F41842F8]();
}

uint64_t dispatch thunk of Collection.subscript.read()
{
  return MEMORY[0x1F4184440]();
}

uint64_t KVItemType.description.getter()
{
  return MEMORY[0x1F4151340]();
}

uint64_t KVFieldType.audioType.getter()
{
  return MEMORY[0x1F4151348]();
}

uint64_t KVFieldType.description.getter()
{
  return MEMORY[0x1F4151350]();
}

uint64_t NSDictionary.makeIterator()()
{
  return MEMORY[0x1F40E6530]();
}

uint64_t NSDictionary.Iterator.next()()
{
  return MEMORY[0x1F40E6550]();
}

uint64_t NSEnumerator.makeIterator()()
{
  return MEMORY[0x1F40E6568]();
}

uint64_t static os_log_type_t.info.getter()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t static os_log_type_t.fault.getter()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t static os_log_type_t.default.getter()
{
  return MEMORY[0x1F4188700]();
}

uint64_t SASRecognition.toAFSpeechPackage(utteranceStart:processedAudioDuration:isFinal:)()
{
  return MEMORY[0x1F4158A20]();
}

uint64_t OS_dispatch_group.wait(timeout:)()
{
  return MEMORY[0x1F4186F88]();
}

Swift::Void __swiftcall OS_dispatch_group.wait()()
{
}

uint64_t static OS_dispatch_queue.Attributes.concurrent.getter()
{
  return MEMORY[0x1F4186FC8]();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return MEMORY[0x1F4186FE0]();
}

uint64_t OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)()
{
  return MEMORY[0x1F4186FF8]();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return MEMORY[0x1F41870A8]();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return MEMORY[0x1F41870B0]();
}

uint64_t OS_dispatch_queue.sync<A>(execute:)()
{
  return MEMORY[0x1F41870D0]();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return MEMORY[0x1F41870E8]();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return MEMORY[0x1F41870F8]();
}

uint64_t static OS_dispatch_queue.global(qos:)()
{
  return MEMORY[0x1F4187118]();
}

uint64_t static os_signpost_type_t.end.getter()
{
  return MEMORY[0x1F4188708]();
}

uint64_t static os_signpost_type_t.begin.getter()
{
  return MEMORY[0x1F4188710]();
}

uint64_t OS_dispatch_semaphore.wait(timeout:)()
{
  return MEMORY[0x1F4187270]();
}

Swift::Void __swiftcall OS_dispatch_semaphore.wait()()
{
}

Swift::Int __swiftcall OS_dispatch_semaphore.signal()()
{
  return MEMORY[0x1F4187290]();
}

uint64_t SISchemaComponentName.description.getter()
{
  return MEMORY[0x1F41514E0]();
}

uint64_t IQFMapsPersonalizationRanker.rankedEvents(for:completion:)()
{
  return MEMORY[0x1F4124D60]();
}

uint64_t POMMESSchemaPOMMESPegasusRequestGeoAppResolutionType.description.getter()
{
  return MEMORY[0x1F4151530]();
}

uint64_t NSCoder.decodeObject<A>(of:forKey:)()
{
  return MEMORY[0x1F40E6850]();
}

uint64_t NSCoder.decodeArrayOfObjects<A>(ofClass:forKey:)()
{
  return MEMORY[0x1F40E6878]();
}

NSNumber __swiftcall NSNumber.init(integerLiteral:)(Swift::Int integerLiteral)
{
  return (NSNumber)MEMORY[0x1F40E6908](integerLiteral);
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return MEMORY[0x1F41874B0](seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return MEMORY[0x1F41874B8]();
}

uint64_t NSObject.hash(into:)()
{
  return MEMORY[0x1F41874C8]();
}

uint64_t NSObject.hashValue.getter()
{
  return MEMORY[0x1F41874D8]();
}

uint64_t type metadata accessor for APSubject()
{
  return MEMORY[0x1F4109000]();
}

uint64_t OS_os_log.signpostsEnabled.getter()
{
  return MEMORY[0x1F4188720]();
}

uint64_t Optional.debugDescription.getter()
{
  return MEMORY[0x1F4184628]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x1F4184640]();
}

Swift::String __swiftcall Substring.lowercased()()
{
  uint64_t v0 = MEMORY[0x1F41846D8]();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t Substring.index(_:offsetBy:limitedBy:)()
{
  return MEMORY[0x1F4184730]();
}

uint64_t Substring.init(_:)()
{
  return MEMORY[0x1F4184788]();
}

uint64_t Substring.subscript.getter()
{
  return MEMORY[0x1F4184790]();
}

uint64_t dispatch thunk of IteratorProtocol.next()()
{
  return MEMORY[0x1F41847A0]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x1F4184820]();
}

uint64_t StringProtocol.components(separatedBy:)()
{
  return MEMORY[0x1F40E6BA0]();
}

uint64_t StringProtocol.components<A>(separatedBy:)()
{
  return MEMORY[0x1F40E6BB8]();
}

uint64_t StringProtocol.lowercased(with:)()
{
  return MEMORY[0x1F40E6BC8]();
}

uint64_t StringProtocol.trimmingCharacters(in:)()
{
  return MEMORY[0x1F40E6C60]();
}

uint64_t StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)()
{
  return MEMORY[0x1F40E6C88]();
}

uint64_t StringProtocol.addingPercentEncoding(withAllowedCharacters:)()
{
  return MEMORY[0x1F40E6C90]();
}

uint64_t StringProtocol.contains<A>(_:)()
{
  return MEMORY[0x1F40E6D80]();
}

uint64_t StringProtocol<>.split(separator:maxSplits:omittingEmptySubsequences:)()
{
  return MEMORY[0x1F41876A8]();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return MEMORY[0x1F4184978]();
}

uint64_t dispatch thunk of SetAlgebra.isSuperset(of:)()
{
  return MEMORY[0x1F4184A78]();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t _HashTable.previousHole(before:)()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t _HashTable.nextHole(atOrAfter:)()
{
  return MEMORY[0x1F4184B30]();
}

uint64_t __CocoaSet.makeIterator()()
{
  return MEMORY[0x1F4184B60]();
}

uint64_t __CocoaSet.count.getter()
{
  return MEMORY[0x1F4184B90]();
}

uint64_t __CocoaSet.member(for:)()
{
  return MEMORY[0x1F4184BA8]();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return MEMORY[0x1F4184BC0]();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return MEMORY[0x1F4184C18](seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t static _SetStorage.copy(original:)()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t static _SetStorage.convert(_:capacity:)()
{
  return MEMORY[0x1F4184CA0]();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t _StringGuts._slowWithCString<A>(_:)()
{
  return MEMORY[0x1F4184CC0]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t StaticString.description.getter()
{
  return MEMORY[0x1F4184D20]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t static ContinuousClock.Instant.now.getter()
{
  return MEMORY[0x1F4187F58]();
}

uint64_t ContinuousClock.Instant.advanced(by:)()
{
  return MEMORY[0x1F4187F60]();
}

uint64_t type metadata accessor for ContinuousClock.Instant()
{
  return MEMORY[0x1F4187F70]();
}

uint64_t ContinuousClock.init()()
{
  return MEMORY[0x1F4187F78]();
}

uint64_t type metadata accessor for ContinuousClock()
{
  return MEMORY[0x1F4187F80]();
}

uint64_t LazyMapSequence<>.startIndex.getter()
{
  return MEMORY[0x1F4184FD0]();
}

uint64_t LazyMapSequence<>.endIndex.getter()
{
  return MEMORY[0x1F4184FE0]();
}

uint64_t LazyMapSequence<>.formIndex(after:)()
{
  return MEMORY[0x1F4184FE8]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x1F4185050]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x1F4185298]();
}

{
  return MEMORY[0x1F41852A0]();
}

uint64_t _bridgeCocoaArray<A>(_:)()
{
  return MEMORY[0x1F41852B0]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x1F4185350]();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return MEMORY[0x1F4185368]();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x1F4185370]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x1F4185380]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x1F4185398]();
}

uint64_t LazySequenceProtocol.filter(_:)()
{
  return MEMORY[0x1F4185418]();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x1F41854C8](cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return MEMORY[0x1F41854F8]();
}

uint64_t KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x1F4185528]();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return MEMORY[0x1F4185568]();
}

{
  return MEMORY[0x1F4185570]();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return MEMORY[0x1F4185598]();
}

uint64_t KeyedEncodingContainer.encodeIfPresent(_:forKey:)()
{
  return MEMORY[0x1F4185628]();
}

uint64_t KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x1F4185658]();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return MEMORY[0x1F4185690]();
}

{
  return MEMORY[0x1F4185698]();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x1F4185730]();
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return MEMORY[0x1F4185740](a1);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x1F4185758]();
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter()
{
  return MEMORY[0x1F4185B90]();
}

uint64_t _findStringSwitchCaseWithCache(cases:string:cache:)()
{
  return MEMORY[0x1F4185D10]();
}

uint64_t _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)()
{
  return MEMORY[0x1F4185D68]();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t Clock.measure(_:)()
{
  return MEMORY[0x1F4188180]();
}

uint64_t Error<>._code.getter()
{
  return MEMORY[0x1F40E6E08]();
}

uint64_t Error<>._domain.getter()
{
  return MEMORY[0x1F40E6E18]();
}

uint64_t Error.localizedDescription.getter()
{
  return MEMORY[0x1F40E6E28]();
}

uint64_t print(_:separator:terminator:)()
{
  return MEMORY[0x1F4185E90]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x1F4185EB0]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt8 a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t Duration.description.getter()
{
  return MEMORY[0x1F4186138]();
}

uint64_t _typeName(_:qualified:)()
{
  return MEMORY[0x1F4186318]();
}

uint64_t AFDeviceSupportsSAE()
{
  return MEMORY[0x1F410ACB8]();
}

uint64_t AFDeviceSupportsSystemAssistantExperience()
{
  return MEMORY[0x1F410ACF0]();
}

uint64_t AFEffectiveSiriBundleForLocation()
{
  return MEMORY[0x1F410AD18]();
}

uint64_t AFIsATV()
{
  return MEMORY[0x1F410AD30]();
}

uint64_t AFIsHorseman()
{
  return MEMORY[0x1F410AD48]();
}

uint64_t AFIsInternalInstall()
{
  return MEMORY[0x1F410AD50]();
}

uint64_t AFNavigationStateIsNavigating()
{
  return MEMORY[0x1F410ADC0]();
}

uint64_t AFSupportsMultiUser()
{
  return MEMORY[0x1F410AF30]();
}

uint64_t AFSupportsSiriInCall()
{
  return MEMORY[0x1F410AF38]();
}

uint64_t AFUserIdentityClassficationGetFromName()
{
  return MEMORY[0x1F410AF70]();
}

uint64_t AFUserIdentityClassficationGetName()
{
  return MEMORY[0x1F410AF78]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D10]();
}

uint64_t KVFieldTypeToNumber()
{
  return MEMORY[0x1F412A070]();
}

uint64_t KVItemTypeToNumber()
{
  return MEMORY[0x1F412A0B0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1F417CE38]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1F412F980]();
}

uint64_t _AFPreferencesCountryCode()
{
  return MEMORY[0x1F410AFA8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
{
}

double __exp10(double a1)
{
  MEMORY[0x1F40C9B90](a1);
  return result;
}

{
  return MEMORY[0x1F41813D8]();
}

{
  return MEMORY[0x1F41813E8]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x1F4186398]();
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1F40CA208](a1, *(void *)&a2);
}

void bzero(void *a1, size_t a2)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA80]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC28](value);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1F40CC0D0](*(void *)&a1, a2, a3, *(void *)&a4);
}

void free(void *a1)
{
}

long double log10(long double __x)
{
  MEMORY[0x1F40CC880](__x);
  return result;
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

uint64_t os_eligibility_get_domain_answer()
{
  return MEMORY[0x1F40CD2B0]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

float powf(float a1, float a2)
{
  MEMORY[0x1F40CD820](a1, a2);
  return result;
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181F90](a1, *(void *)&a2, a3, *(void *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1F4181FA8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1F4181FB8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181FE8](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_changes(sqlite3 *a1)
{
  return MEMORY[0x1F4182050](a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1F4182060](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1F4182070](a1, *(void *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F4182078](a1, *(void *)&iCol);
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820A0](a1, *(void *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1F41820C8](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_db_filename(sqlite3 *db, const char *zDbName)
{
  return (const char *)MEMORY[0x1F4182150](db, zDbName);
}

int sqlite3_errcode(sqlite3 *db)
{
  return MEMORY[0x1F4182190](db);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return (const char *)MEMORY[0x1F41821A0](*(void *)&a1);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41821D8](pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1F4182280](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1F4182290](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1F41823B0](a1);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1F4186460]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1F41881F0]();
}

uint64_t swift_deallocBox()
{
  return MEMORY[0x1F4186480]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1F4186488]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_deallocUninitializedObject()
{
  return MEMORY[0x1F41864A8]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1F4188218]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1F4188220]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x1F41864B0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1F41864C0]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1F4186550]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1F4186568]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1F41865F0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTupleTypeLayout()
{
  return MEMORY[0x1F4186630]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1F4186638]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x1F4186640]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1F4186690]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x1F41866A0]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStaticObject()
{
  return MEMORY[0x1F41866B0]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1F41866F8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1F4186710]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x1F4186730]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1F4186778]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1F41867A8]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_task_isCancelled()
{
  return MEMORY[0x1F4188270]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1F41867E8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1F41867F8]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1F4186858]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1F4186860]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1F4186868]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1F41868B8]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1F41868C0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1F41868C8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x1F41868E8]();
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x1F40CE970](activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1F40CE988](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x1F40CE9C8](activity, state);
}

void xpc_activity_unregister(const char *identifier)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE28](keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}