uint64_t variable initialization expression of VoiceFeedbackAnnouncementFlow.data()
{
  return 0;
}

uint64_t variable initialization expression of VoiceFeedbackAnnouncementFlow.flowProvider@<X0>(uint64_t *a1@<X8>)
{
  static OutputPublisherFactory.makeOutputPublisherAsync()();
  type metadata accessor for ResponseFactory();
  swift_allocObject();
  ResponseFactory.init()();
  uint64_t v2 = type metadata accessor for PatternFlowProvider();
  swift_allocObject();
  uint64_t result = PatternFlowProvider.init(outputPublisher:responseGenerator:)();
  uint64_t v4 = MEMORY[0x263F6F600];
  a1[3] = v2;
  a1[4] = v4;
  *a1 = result;
  return result;
}

uint64_t VoiceFeedbackAnnouncementFlow.init(data:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  static OutputPublisherFactory.makeOutputPublisherAsync()();
  type metadata accessor for ResponseFactory();
  swift_allocObject();
  ResponseFactory.init()();
  uint64_t v4 = type metadata accessor for PatternFlowProvider();
  swift_allocObject();
  uint64_t result = PatternFlowProvider.init(outputPublisher:responseGenerator:)();
  uint64_t v6 = MEMORY[0x263F6F600];
  a2[4] = v4;
  a2[5] = v6;
  *a2 = a1;
  a2[1] = result;
  return result;
}

uint64_t VoiceFeedbackAnnouncementFlow.on(input:)()
{
  return 1;
}

uint64_t VoiceFeedbackAnnouncementFlow.execute(completion:)()
{
  lazy protocol witness table accessor for type VoiceFeedbackAnnouncementFlow and conformance VoiceFeedbackAnnouncementFlow();
  return Flow.deferToExecuteAsync(_:)();
}

unint64_t lazy protocol witness table accessor for type VoiceFeedbackAnnouncementFlow and conformance VoiceFeedbackAnnouncementFlow()
{
  unint64_t result = lazy protocol witness table cache variable for type VoiceFeedbackAnnouncementFlow and conformance VoiceFeedbackAnnouncementFlow;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackAnnouncementFlow and conformance VoiceFeedbackAnnouncementFlow)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackAnnouncementFlow and conformance VoiceFeedbackAnnouncementFlow);
  }
  return result;
}

uint64_t VoiceFeedbackAnnouncementFlow.execute()(uint64_t a1)
{
  v2[42] = a1;
  v2[43] = v1;
  type metadata accessor for DialogPhase();
  v2[44] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for OutputGenerationManifest();
  v2[45] = v3;
  v2[46] = *(void *)(v3 - 8);
  v2[47] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for Logger();
  v2[48] = v4;
  v2[49] = *(void *)(v4 - 8);
  v2[50] = swift_task_alloc();
  v2[51] = swift_task_alloc();
  v2[52] = swift_task_alloc();
  v2[53] = swift_task_alloc();
  v2[54] = swift_task_alloc();
  v2[55] = swift_task_alloc();
  v2[56] = swift_task_alloc();
  v2[57] = swift_task_alloc();
  return MEMORY[0x270FA2498](VoiceFeedbackAnnouncementFlow.execute(), 0, 0);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t (*v4)();
  uint64_t v6;

  uint64_t v3 = *v2;
  *(void *)(v3 + 504) = a1;
  *(void *)(v3 + 512) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = VoiceFeedbackAnnouncementFlow.execute();
  }
  else {
    uint64_t v4 = VoiceFeedbackAnnouncementFlow.execute();
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t VoiceFeedbackAnnouncementFlow.execute()()
{
  uint64_t v67 = v0;
  uint64_t v1 = **(void **)(v0 + 344);
  if (!v1)
  {
    uint64_t v25 = *(void *)(v0 + 392);
    uint64_t v24 = *(void *)(v0 + 400);
    uint64_t v26 = *(void *)(v0 + 384);
    uint64_t v27 = Logger.workout.unsafeMutableAddressor();
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16))(v24, v27, v26);
    v28 = Logger.logObject.getter();
    os_log_type_t v29 = static os_log_type_t.error.getter();
    BOOL v30 = os_log_type_enabled(v28, v29);
    uint64_t v32 = *(void *)(v0 + 392);
    uint64_t v31 = *(void *)(v0 + 400);
    uint64_t v33 = *(void *)(v0 + 384);
    if (v30)
    {
      v34 = (uint8_t *)swift_slowAlloc();
      uint64_t v35 = swift_slowAlloc();
      uint64_t v66 = v35;
      *(_DWORD *)v34 = 136315138;
      *(void *)(v0 + 312) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000001DLL, 0x80000002619D8B70, &v66);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_261998000, v28, v29, "No data was given to %s. Exiting silently.", v34, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x263E47E50](v35, -1, -1);
      MEMORY[0x263E47E50](v34, -1, -1);
    }

    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v31, v33);
    goto LABEL_19;
  }
  uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (!*(void *)(v1 + 16) || (unint64_t v4 = specialized __RawDictionaryStorage.find<A>(_:)(v2, v3), (v5 & 1) == 0))
  {
    *(_OWORD *)(v0 + 48) = 0u;
    *(_OWORD *)(v0 + 64) = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  outlined init with copy of Any(*(void *)(v1 + 56) + 32 * v4, v0 + 48);
  swift_bridgeObjectRelease();
  if (!*(void *)(v0 + 72))
  {
LABEL_11:
    outlined destroy of Any?(v0 + 48, &demangling cache variable for type metadata for Any?);
    goto LABEL_12;
  }
  uint64_t v6 = (uint64_t *)(v0 + 288);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_12:
    uint64_t v16 = *(void *)(v0 + 408);
    uint64_t v17 = *(void *)(v0 + 384);
    uint64_t v18 = *(void *)(v0 + 392);
    uint64_t v19 = Logger.workout.unsafeMutableAddressor();
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v16, v19, v17);
    v12 = Logger.logObject.getter();
    os_log_type_t v20 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_261998000, v12, v20, "There was synchronousBurstIndex present in the data. Exiting silently.", v21, 2u);
      MEMORY[0x263E47E50](v21, -1, -1);
    }
    uint64_t v15 = *(void *)(v0 + 408);
    goto LABEL_15;
  }
  uint64_t v7 = *v6;
  if (*v6)
  {
    uint64_t v8 = *(void *)(v0 + 456);
    uint64_t v9 = *(void *)(v0 + 384);
    uint64_t v10 = *(void *)(v0 + 392);
    uint64_t v11 = Logger.workout.unsafeMutableAddressor();
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v8, v11, v9);
    v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v14 = 134217984;
      *(void *)(v0 + 280) = v7;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_261998000, v12, v13, "Supressing announcement because synchronousBurstIndex = %ld.", v14, 0xCu);
      MEMORY[0x263E47E50](v14, -1, -1);
    }
    uint64_t v15 = *(void *)(v0 + 456);
LABEL_15:
    uint64_t v22 = *(void *)(v0 + 384);
    uint64_t v23 = *(void *)(v0 + 392);

    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v15, v22);
LABEL_19:
    static ExecuteResponse.complete()();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v36 = *(uint64_t (**)(void))(v0 + 8);
    return v36();
  }
  if (!*(void *)(v1 + 16)
    || (unint64_t v38 = specialized __RawDictionaryStorage.find<A>(_:)(0x7079547472656C61, 0xE900000000000065), (v39 & 1) == 0)
    || (outlined init with copy of Any(*(void *)(v1 + 56) + 32 * v38, v0 + 16), (swift_dynamicCast() & 1) == 0)
    || (char v40 = specialized VoiceFeedbackAlertType.init(rawValue:)(*(void *)(v0 + 272)), v40 == 25))
  {
    uint64_t v41 = *(void *)(v0 + 416);
    uint64_t v42 = *(void *)(v0 + 384);
    uint64_t v43 = *(void *)(v0 + 392);
    uint64_t v44 = Logger.workout.unsafeMutableAddressor();
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v43 + 16))(v41, v44, v42);
    v12 = Logger.logObject.getter();
    os_log_type_t v45 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v45))
    {
      v46 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v46 = 0;
      _os_log_impl(&dword_261998000, v12, v45, "There was no valid alert type present in the data. Exiting silently.", v46, 2u);
      MEMORY[0x263E47E50](v46, -1, -1);
    }
    uint64_t v15 = *(void *)(v0 + 416);
    goto LABEL_15;
  }
  char v47 = v40;
  uint64_t v48 = *(void *)(v0 + 448);
  uint64_t v49 = *(void *)(v0 + 384);
  uint64_t v50 = *(void *)(v0 + 392);
  uint64_t v51 = Logger.workout.unsafeMutableAddressor();
  *(void *)(v0 + 464) = v51;
  swift_beginAccess();
  v52 = *(void (**)(uint64_t, uint64_t, uint64_t))(v50 + 16);
  *(void *)(v0 + 472) = v52;
  *(void *)(v0 + 480) = (v50 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v52(v48, v51, v49);
  v53 = Logger.logObject.getter();
  os_log_type_t v54 = static os_log_type_t.debug.getter();
  BOOL v55 = os_log_type_enabled(v53, v54);
  uint64_t v56 = *(void *)(v0 + 448);
  uint64_t v58 = *(void *)(v0 + 384);
  uint64_t v57 = *(void *)(v0 + 392);
  if (v55)
  {
    uint64_t v65 = *(void *)(v0 + 448);
    v59 = (uint8_t *)swift_slowAlloc();
    uint64_t v64 = swift_slowAlloc();
    uint64_t v66 = v64;
    *(_DWORD *)v59 = 136315138;
    *(unsigned char *)(v0 + 520) = v47;
    uint64_t v60 = String.init<A>(describing:)();
    *(void *)(v0 + 328) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v60, v61, &v66);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_261998000, v53, v54, "Trying to execute dialog for alert type: %s", v59, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x263E47E50](v64, -1, -1);
    MEMORY[0x263E47E50](v59, -1, -1);

    v62 = *(void (**)(uint64_t, uint64_t))(v57 + 8);
    v62(v65, v58);
  }
  else
  {

    v62 = *(void (**)(uint64_t, uint64_t))(v57 + 8);
    v62(v56, v58);
  }
  *(void *)(v0 + 488) = v62;
  v63 = (void *)swift_task_alloc();
  *(void *)(v0 + 496) = v63;
  void *v63 = v0;
  v63[1] = VoiceFeedbackAnnouncementFlow.execute();
  return pattern(for:data:)(v47, v1);
}

{
  void *v0;
  void *v1;
  void (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  BOOL v9;
  void *v10;
  uint8_t *v11;
  uint64_t v12;
  id v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t (*v40)(void);
  uint64_t v41;
  void (*v42)(uint64_t, uint64_t);
  uint64_t v43;
  os_log_type_t v44;
  uint8_t *v45;
  NSObject *log;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;

  uint64_t v49 = v0;
  uint64_t v1 = (void *)v0[63];
  uint64_t v2 = (void (*)(uint64_t, uint64_t, uint64_t))v0[59];
  uint64_t v3 = v0[58];
  unint64_t v4 = v0[55];
  char v5 = v0[48];
  static DialogPhase.completion.getter();
  OutputGenerationManifest.init(dialogPhase:_:)();
  OutputGenerationManifest.canUseServerTTS.setter();
  swift_beginAccess();
  v2(v4, v3, v5);
  uint64_t v6 = v1;
  uint64_t v7 = Logger.logObject.getter();
  uint64_t v8 = static os_log_type_t.debug.getter();
  uint64_t v9 = os_log_type_enabled(v7, v8);
  uint64_t v10 = (void *)v0[63];
  if (v9)
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    char v47 = v12;
    *(_DWORD *)uint64_t v11 = 136315138;
    os_log_type_t v13 = objc_msgSend(v10, sel_dialog);
    type metadata accessor for PatternExecutionDialog();
    v14 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (v14 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v15 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v15 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    os_log_type_t v45 = v11;
    log = v7;
    uint64_t v44 = v8;
    uint64_t v43 = v12;
    if (v15)
    {
      uint64_t v48 = MEMORY[0x263F8EE78];
      unint64_t result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v15 & ~(v15 >> 63), 0);
      if (v15 < 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v17 = 0;
      uint64_t v18 = v48;
      do
      {
        if ((v14 & 0xC000000000000001) != 0) {
          uint64_t v19 = (id)MEMORY[0x263E476C0](v17, v14);
        }
        else {
          uint64_t v19 = *(id *)(v14 + 8 * v17 + 32);
        }
        os_log_type_t v20 = v19;
        v21 = objc_msgSend(v19, sel_fullSpeak);
        uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v24 = v23;

        uint64_t v48 = v18;
        uint64_t v26 = *(void *)(v18 + 16);
        uint64_t v25 = *(void *)(v18 + 24);
        if (v26 >= v25 >> 1)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v25 > 1, v26 + 1, 1);
          uint64_t v18 = v48;
        }
        ++v17;
        *(void *)(v18 + 16) = v26 + 1;
        uint64_t v27 = v18 + 16 * v26;
        *(void *)(v27 + 32) = v22;
        *(void *)(v27 + 40) = v24;
      }
      while (v15 != v17);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v18 = MEMORY[0x263F8EE78];
    }
    uint64_t v31 = (void *)v0[63];
    uint64_t v41 = v0[55];
    uint64_t v42 = (void (*)(uint64_t, uint64_t))v0[61];
    uint64_t v32 = v0[48];
    uint64_t v33 = MEMORY[0x263E47610](v18, MEMORY[0x263F8D310]);
    uint64_t v35 = v34;
    swift_bridgeObjectRelease();
    v0[40] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v33, v35, &v47);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_261998000, log, v44, "Dialogs: %s", v45, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x263E47E50](v43, -1, -1);
    MEMORY[0x263E47E50](v45, -1, -1);

    v42(v41, v32);
  }
  else
  {
    v28 = (void (*)(uint64_t, uint64_t))v0[61];
    os_log_type_t v29 = v0[55];
    BOOL v30 = v0[48];

    v28(v29, v30);
  }
  v36 = (void *)v0[63];
  unint64_t v38 = v0[46];
  v37 = v0[47];
  char v39 = v0[45];
  __swift_project_boxed_opaque_existential_1((void *)(v0[43] + 8), *(void *)(v0[43] + 32));
  dispatch thunk of PatternFlowProviding.makeResponseFlow(patternExecutionResult:outputGenerationManifest:)();
  static ExecuteResponse.complete(next:)();
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v37, v39);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  char v40 = (uint64_t (*)(void))v0[1];
  return v40();
}

{
  void *v0;
  void *v1;
  void (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  BOOL v26;
  uint64_t v27;
  uint8_t *v28;
  uint64_t (*v29)(void);
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t);
  uint64_t v34;
  void *v35;
  uint64_t v36;

  uint64_t v35 = v0;
  uint64_t v1 = (void *)v0[64];
  uint64_t v2 = (void (*)(uint64_t, uint64_t, uint64_t))v0[59];
  uint64_t v3 = v0[58];
  unint64_t v4 = v0[54];
  char v5 = v0[48];
  swift_beginAccess();
  v2(v4, v3, v5);
  uint64_t v6 = v1;
  uint64_t v7 = v1;
  uint64_t v8 = Logger.logObject.getter();
  uint64_t v9 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (void *)v0[64];
    uint64_t v32 = v0[54];
    uint64_t v33 = (void (*)(uint64_t, uint64_t))v0[61];
    uint64_t v31 = v0[48];
    uint64_t v11 = swift_slowAlloc();
    v12 = (void *)swift_slowAlloc();
    v34 = swift_slowAlloc();
    os_log_type_t v13 = v34;
    *(_DWORD *)uint64_t v11 = 136315394;
    v0[37] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000001DLL, 0x80000002619D8B70, &v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v11 + 12) = 2112;
    v14 = v10;
    uint64_t v15 = _swift_stdlib_bridgeErrorToNSError();
    v0[38] = v15;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    NSObject *v12 = v15;
    MEMORY[0x263E47CC0](v10);
    MEMORY[0x263E47CC0](v10);
    _os_log_impl(&dword_261998000, v8, v9, "%s caught an error: %@", (uint8_t *)v11, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x263E47E50](v12, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x263E47E50](v13, -1, -1);
    MEMORY[0x263E47E50](v11, -1, -1);

    v33(v32, v31);
  }
  else
  {
    uint64_t v16 = v0[64];
    uint64_t v17 = (void (*)(uint64_t, uint64_t))v0[61];
    uint64_t v18 = v0[54];
    uint64_t v19 = v0[48];
    MEMORY[0x263E47CC0](v16);
    MEMORY[0x263E47CC0](v16);

    v17(v18, v19);
  }
  os_log_type_t v20 = (void (*)(uint64_t, uint64_t, uint64_t))v0[59];
  v21 = v0[58];
  uint64_t v22 = v0[53];
  uint64_t v23 = v0[48];
  swift_beginAccess();
  v20(v22, v21, v23);
  uint64_t v24 = Logger.logObject.getter();
  uint64_t v25 = static os_log_type_t.error.getter();
  uint64_t v26 = os_log_type_enabled(v24, v25);
  uint64_t v27 = v0[64];
  if (v26)
  {
    v28 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v28 = 0;
    _os_log_impl(&dword_261998000, v24, v25, "Could not execute any pattern for data. Exiting silently.", v28, 2u);
    MEMORY[0x263E47E50](v28, -1, -1);

    MEMORY[0x263E47CC0](v27);
  }
  else
  {
    MEMORY[0x263E47CC0](v0[64]);
  }
  ((void (*)(void, void))v0[61])(v0[53], v0[48]);
  static ExecuteResponse.complete()();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  os_log_type_t v29 = (uint64_t (*)(void))v0[1];
  return v29();
}

uint64_t pattern(for:data:)(char a1, uint64_t a2)
{
  *(void *)(v2 + 1584) = a2;
  *(unsigned char *)(v2 + 210) = a1;
  uint64_t v3 = type metadata accessor for Logger();
  *(void *)(v2 + 1592) = v3;
  *(void *)(v2 + 1600) = *(void *)(v3 - 8);
  *(void *)(v2 + 1608) = swift_task_alloc();
  type metadata accessor for CATOption();
  *(void *)(v2 + 1616) = swift_task_alloc();
  return MEMORY[0x270FA2498](pattern(for:data:), 0, 0);
}

uint64_t pattern(for:data:)()
{
  uint64_t v74 = v0 + 416;
  char v1 = *(unsigned char *)(v0 + 210);
  v75 = (void *)(v0 + 1040);
  switch(v1)
  {
    case 1:
      uint64_t v4 = v0 + 1000;
      uint64_t v5 = swift_bridgeObjectRetain();
      char v6 = specialized GoalCompletionModel.init(with:)(v5);
      if (!v9) {
        goto LABEL_31;
      }
      char v10 = v6;
      uint64_t v11 = v7;
      uint64_t v12 = v8;
      uint64_t v13 = v9;
      *(void *)(v0 + 1024) = &type metadata for GoalCompletionModel;
      *(void *)(v0 + 1032) = &protocol witness table for GoalCompletionModel;
      uint64_t v14 = swift_allocObject();
      *(void *)(v0 + 1000) = v14;
      goto LABEL_7;
    case 2:
      uint64_t v4 = v0 + 680;
      uint64_t v15 = swift_bridgeObjectRetain();
      char v16 = specialized HalfwayGoalCompletionModel.init(with:)(v15);
      if (!v19)
      {
LABEL_31:
        uint64_t v20 = v4;
        *(void *)(v4 + 32) = 0;
        *(_OWORD *)uint64_t v4 = 0u;
        *(_OWORD *)(v4 + 16) = 0u;
        goto LABEL_38;
      }
      char v10 = v16;
      uint64_t v11 = v17;
      uint64_t v12 = v18;
      uint64_t v13 = v19;
      *(void *)(v0 + 704) = &type metadata for HalfwayGoalCompletionModel;
      *(void *)(v0 + 712) = &protocol witness table for HalfwayGoalCompletionModel;
      uint64_t v14 = swift_allocObject();
      *(void *)(v0 + 680) = v14;
LABEL_7:
      *(unsigned char *)(v14 + 16) = v10;
      *(void *)(v14 + 24) = v11;
      *(void *)(v14 + 32) = v12;
      *(void *)(v14 + 40) = v13;
      uint64_t v2 = (long long *)(v0 + 1080);
      uint64_t v3 = v0 + 960;
      uint64_t v20 = v4;
      break;
    case 4:
      uint64_t v21 = v0 + 720;
      uint64_t v22 = swift_bridgeObjectRetain();
      specialized UpcomingIntervalModel.init(with:)(v22, v0 + 16);
      outlined init with take of BelowTargetZoneModel?(v0 + 16, v0 + 216, &demangling cache variable for type metadata for UpcomingIntervalModel?);
      if (_s20WorkoutAnnouncements21UpcomingIntervalModelVSgWOg(v0 + 216) == 1) {
        goto LABEL_30;
      }
      *(void *)(v0 + 744) = &type metadata for UpcomingIntervalModel;
      *(void *)(v0 + 752) = &protocol witness table for UpcomingIntervalModel;
      uint64_t v23 = swift_allocObject();
      *(void *)(v0 + 720) = v23;
      long long v24 = *(_OWORD *)(v0 + 392);
      *(_OWORD *)(v23 + 176) = *(_OWORD *)(v0 + 376);
      *(_OWORD *)(v23 + 192) = v24;
      *(_WORD *)(v23 + 208) = *(_WORD *)(v0 + 408);
      long long v25 = *(_OWORD *)(v0 + 328);
      *(_OWORD *)(v23 + 112) = *(_OWORD *)(v0 + 312);
      *(_OWORD *)(v23 + 128) = v25;
      long long v26 = *(_OWORD *)(v0 + 360);
      *(_OWORD *)(v23 + 144) = *(_OWORD *)(v0 + 344);
      *(_OWORD *)(v23 + 160) = v26;
      long long v27 = *(_OWORD *)(v0 + 264);
      *(_OWORD *)(v23 + 48) = *(_OWORD *)(v0 + 248);
      *(_OWORD *)(v23 + 64) = v27;
      long long v28 = *(_OWORD *)(v0 + 296);
      *(_OWORD *)(v23 + 80) = *(_OWORD *)(v0 + 280);
      *(_OWORD *)(v23 + 96) = v28;
      long long v29 = *(_OWORD *)(v0 + 232);
      *(_OWORD *)(v23 + 16) = *(_OWORD *)(v0 + 216);
      *(_OWORD *)(v23 + 32) = v29;
      goto LABEL_19;
    case 5:
      uint64_t v30 = v0 + 760;
      uint64_t v31 = swift_bridgeObjectRetain();
      specialized LapCompletionModel.init(with:)(v31, v0 + 544);
      outlined init with take of BelowTargetZoneModel?(v0 + 544, v0 + 592, &demangling cache variable for type metadata for LapCompletionModel?);
      if (!*(void *)(v0 + 624)) {
        goto LABEL_25;
      }
      *(void *)(v0 + 784) = &type metadata for LapCompletionModel;
      *(void *)(v0 + 792) = &protocol witness table for LapCompletionModel;
      uint64_t v32 = (_OWORD *)swift_allocObject();
      *(void *)(v0 + 760) = v32;
      long long v33 = *(_OWORD *)(v0 + 608);
      v32[1] = *(_OWORD *)(v0 + 592);
      v32[2] = v33;
      *(_OWORD *)((char *)v32 + 41) = *(_OWORD *)(v0 + 617);
      goto LABEL_24;
    case 6:
      lazy protocol witness table accessor for type VoiceFeedbackErrors and conformance VoiceFeedbackErrors();
      swift_allocError();
      unsigned char *v34 = 4;
      swift_willThrow();
      goto LABEL_47;
    case 8:
      uint64_t v30 = v0 + 800;
      uint64_t v35 = swift_bridgeObjectRetain();
      specialized PacerGoalCompletionModel.init(with:)(v35, (uint64_t *)(v0 + 840));
      outlined init with take of BelowTargetZoneModel?(v0 + 840, v0 + 640, &demangling cache variable for type metadata for PacerGoalCompletionModel?);
      if (!*(void *)(v0 + 664)) {
        goto LABEL_25;
      }
      *(void *)(v0 + 824) = &type metadata for PacerGoalCompletionModel;
      *(void *)(v0 + 832) = &protocol witness table for PacerGoalCompletionModel;
      uint64_t v36 = swift_allocObject();
      *(void *)(v0 + 800) = v36;
      long long v37 = *(_OWORD *)(v0 + 656);
      *(_OWORD *)(v36 + 16) = *(_OWORD *)(v0 + 640);
      *(_OWORD *)(v36 + 32) = v37;
      *(void *)(v36 + 48) = *(void *)(v0 + 672);
      goto LABEL_24;
    case 18:
      uint64_t v38 = swift_bridgeObjectRetain();
      char v39 = specialized SegmentModel.init(with:)(v38);
      if (v39 == 25)
      {
        uint64_t v20 = v0 + 880;
        *(void *)(v0 + 912) = 0;
        *(_OWORD *)(v0 + 880) = 0u;
        *(_OWORD *)(v0 + 896) = 0u;
        goto LABEL_38;
      }
      *(void *)(v0 + 904) = &type metadata for SegmentModel;
      *(void *)(v0 + 912) = &protocol witness table for SegmentModel;
      *(unsigned char *)(v0 + 880) = v39;
      *(void *)(v0 + 888) = v40;
      uint64_t v2 = (long long *)(v0 + 1080);
      uint64_t v3 = v0 + 960;
      uint64_t v20 = v0 + 880;
      break;
    case 20:
      uint64_t v21 = v0 + 1120;
      uint64_t v41 = swift_bridgeObjectRetain();
      specialized DistanceSplitModel.init(with:)(v41, v74);
      outlined init with take of BelowTargetZoneModel?(v74, v0 + 480, &demangling cache variable for type metadata for DistanceSplitModel?);
      if (!*(void *)(v0 + 528))
      {
LABEL_30:
        uint64_t v20 = v21;
        *(void *)(v21 + 32) = 0;
        *(_OWORD *)uint64_t v21 = 0u;
        *(_OWORD *)(v21 + 16) = 0u;
        goto LABEL_38;
      }
      *(void *)(v0 + 1144) = &type metadata for DistanceSplitModel;
      *(void *)(v0 + 1152) = &protocol witness table for DistanceSplitModel;
      uint64_t v42 = (_OWORD *)swift_allocObject();
      *(void *)(v0 + 1120) = v42;
      long long v43 = *(_OWORD *)(v0 + 496);
      v42[1] = *(_OWORD *)(v0 + 480);
      v42[2] = v43;
      v42[3] = *(_OWORD *)(v0 + 512);
      *(_OWORD *)((char *)v42 + 58) = *(_OWORD *)(v0 + 522);
LABEL_19:
      uint64_t v2 = (long long *)(v0 + 1080);
      uint64_t v3 = v0 + 960;
      uint64_t v20 = v21;
      break;
    case 21:
      uint64_t v44 = swift_bridgeObjectRetain();
      char v45 = specialized TimeSplitModel.init(with:)(v44);
      if (v45 == 25)
      {
        *(void *)(v0 + 1312) = 0;
        *(_OWORD *)(v0 + 1280) = 0u;
        *(_OWORD *)(v0 + 1296) = 0u;
      }
      else
      {
        *(void *)(v0 + 1304) = &type metadata for TimeSplitModel;
        *(void *)(v0 + 1312) = &protocol witness table for TimeSplitModel;
        *(unsigned char *)(v0 + 1280) = v45;
        *(void *)(v0 + 1288) = v46;
      }
      uint64_t v2 = (long long *)(v0 + 1080);
      uint64_t v3 = v0 + 960;
      uint64_t v20 = v0 + 1280;
      break;
    case 22:
      uint64_t v30 = v0 + 1240;
      uint64_t v47 = swift_bridgeObjectRetain();
      specialized EnteredTargetZoneModel.init(with:)(v47, v0 + 1440);
      outlined init with take of BelowTargetZoneModel?(v0 + 1440, v0 + 1400, &demangling cache variable for type metadata for EnteredTargetZoneModel?);
      if (!*(void *)(v0 + 1424))
      {
LABEL_25:
        uint64_t v20 = v30;
        *(void *)(v30 + 32) = 0;
        *(_OWORD *)uint64_t v30 = 0u;
        *(_OWORD *)(v30 + 16) = 0u;
        goto LABEL_38;
      }
      *(void *)(v0 + 1264) = &type metadata for EnteredTargetZoneModel;
      *(void *)(v0 + 1272) = &protocol witness table for EnteredTargetZoneModel;
      uint64_t v48 = swift_allocObject();
      *(void *)(v0 + 1240) = v48;
      long long v49 = *(_OWORD *)(v0 + 1416);
      *(_OWORD *)(v48 + 16) = *(_OWORD *)(v0 + 1400);
      *(_OWORD *)(v48 + 32) = v49;
      *(_DWORD *)(v48 + 47) = *(_DWORD *)(v0 + 1431);
LABEL_24:
      uint64_t v2 = (long long *)(v0 + 1080);
      uint64_t v3 = v0 + 960;
      uint64_t v20 = v30;
      break;
    case 23:
      uint64_t v50 = swift_bridgeObjectRetain();
      specialized AboveTargetZoneModel.init(with:)(v50, v0 + 1480);
      outlined init with take of BelowTargetZoneModel?(v0 + 1480, v0 + 1360, &demangling cache variable for type metadata for AboveTargetZoneModel?);
      if (*(void *)(v0 + 1384))
      {
        *(void *)(v0 + 1224) = &type metadata for AboveTargetZoneModel;
        *(void *)(v0 + 1232) = &protocol witness table for AboveTargetZoneModel;
        uint64_t v51 = swift_allocObject();
        *(void *)(v0 + 1200) = v51;
        long long v52 = *(_OWORD *)(v0 + 1376);
        *(_OWORD *)(v51 + 16) = *(_OWORD *)(v0 + 1360);
        *(_OWORD *)(v51 + 32) = v52;
        *(_DWORD *)(v51 + 47) = *(_DWORD *)(v0 + 1391);
        uint64_t v2 = (long long *)(v0 + 1080);
        uint64_t v20 = v0 + 1200;
      }
      else
      {
        uint64_t v20 = v0 + 1200;
        *(void *)(v0 + 1232) = 0;
        *(_OWORD *)(v0 + 1200) = 0u;
        *(_OWORD *)(v0 + 1216) = 0u;
        uint64_t v2 = (long long *)(v0 + 1080);
      }
      uint64_t v3 = v0 + 960;
      break;
    case 24:
      uint64_t v53 = swift_bridgeObjectRetain();
      specialized BelowTargetZoneModel.init(with:)(v53, v0 + 1520);
      outlined init with take of BelowTargetZoneModel?(v0 + 1520, v0 + 1320, &demangling cache variable for type metadata for BelowTargetZoneModel?);
      if (*(void *)(v0 + 1344))
      {
        *(void *)(v0 + 944) = &type metadata for BelowTargetZoneModel;
        *(void *)(v0 + 952) = &protocol witness table for BelowTargetZoneModel;
        uint64_t v54 = swift_allocObject();
        *(void *)(v0 + 920) = v54;
        long long v55 = *(_OWORD *)(v0 + 1336);
        *(_OWORD *)(v54 + 16) = *(_OWORD *)(v0 + 1320);
        *(_OWORD *)(v54 + 32) = v55;
        *(_DWORD *)(v54 + 47) = *(_DWORD *)(v0 + 1351);
        uint64_t v2 = (long long *)(v0 + 1080);
        uint64_t v3 = v0 + 960;
        uint64_t v20 = v0 + 920;
      }
      else
      {
        uint64_t v20 = v0 + 920;
        *(void *)(v0 + 952) = 0;
        *(_OWORD *)(v0 + 920) = 0u;
        *(_OWORD *)(v0 + 936) = 0u;
LABEL_38:
        uint64_t v2 = (long long *)(v0 + 1080);
        uint64_t v3 = v0 + 960;
      }
      break;
    default:
      *(void *)(v0 + 984) = &type metadata for BasicVoiceFeedbackAlerts;
      *(void *)(v0 + 992) = &protocol witness table for BasicVoiceFeedbackAlerts;
      *(unsigned char *)(v0 + 960) = v1;
      uint64_t v2 = (long long *)(v0 + 1080);
      uint64_t v3 = v0 + 960;
      goto LABEL_40;
  }
  outlined init with take of BelowTargetZoneModel?(v20, v3, &demangling cache variable for type metadata for VoiceFeedbackPatternResolving?);
LABEL_40:
  outlined init with copy of VoiceFeedbackPatternResolving?(v3, (uint64_t)v2);
  if (*(void *)(v0 + 1104))
  {
    outlined init with take of VoiceFeedbackPatternResolving(v2, (uint64_t)v75);
    uint64_t v56 = *(void *)(v0 + 1064);
    uint64_t v57 = *(void *)(v0 + 1072);
    __swift_project_boxed_opaque_existential_1(v75, v56);
    uint64_t v58 = type metadata accessor for WorkoutVoiceFeedbackCATPatternsExecutor(0);
    static CATOption.defaultMode.getter();
    uint64_t v59 = CATWrapper.__allocating_init(options:globals:)();
    *(void *)(v0 + 1184) = v58;
    *(void *)(v0 + 1192) = &protocol witness table for WorkoutVoiceFeedbackCATPatternsExecutor;
    *(void *)(v0 + 1160) = v59;
    v76 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v57 + 8) + **(int **)(v57 + 8));
    uint64_t v60 = (void *)swift_task_alloc();
    *(void *)(v0 + 1624) = v60;
    *uint64_t v60 = v0;
    v60[1] = pattern(for:data:);
    return v76(v0 + 1160, v56, v57);
  }
  else
  {
    uint64_t v62 = *(void *)(v0 + 1608);
    uint64_t v63 = *(void *)(v0 + 1600);
    uint64_t v64 = *(void *)(v0 + 1592);
    outlined destroy of Any?((uint64_t)v2, &demangling cache variable for type metadata for VoiceFeedbackPatternResolving?);
    uint64_t v65 = Logger.workout.unsafeMutableAddressor();
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v63 + 16))(v62, v65, v64);
    uint64_t v66 = Logger.logObject.getter();
    os_log_type_t v67 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v66, v67))
    {
      uint64_t v68 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v68 = 0;
      _os_log_impl(&dword_261998000, v66, v67, "Could not create a model for executing any pattern from the data", v68, 2u);
      MEMORY[0x263E47E50](v68, -1, -1);
    }
    uint64_t v69 = *(void *)(v0 + 1608);
    uint64_t v70 = *(void *)(v0 + 1600);
    uint64_t v71 = *(void *)(v0 + 1592);

    (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v69, v71);
    lazy protocol witness table accessor for type VoiceFeedbackErrors and conformance VoiceFeedbackErrors();
    swift_allocError();
    unsigned char *v72 = 1;
    swift_willThrow();
    outlined destroy of Any?(v3, &demangling cache variable for type metadata for VoiceFeedbackPatternResolving?);
LABEL_47:
    swift_task_dealloc();
    swift_task_dealloc();
    v73 = *(uint64_t (**)(void))(v0 + 8);
    return v73();
  }
}

{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v4;

  outlined destroy of Any?(v0 + 960, &demangling cache variable for type metadata for VoiceFeedbackPatternResolving?);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 1040);
  swift_task_dealloc();
  swift_task_dealloc();
  char v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 1640);
  return v1(v2);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  outlined destroy of Any?(v0 + 960, &demangling cache variable for type metadata for VoiceFeedbackPatternResolving?);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 1160);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 1040);
  swift_task_dealloc();
  swift_task_dealloc();
  char v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t pattern(for:data:)(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 1632) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = pattern(for:data:);
  }
  else
  {
    *(void *)(v4 + 1640) = a1;
    __swift_destroy_boxed_opaque_existential_1Tm(v4 + 1160);
    uint64_t v5 = pattern(for:data:);
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t protocol witness for Flow.on(input:) in conformance VoiceFeedbackAnnouncementFlow()
{
  return 1;
}

uint64_t protocol witness for Flow.onAsync(input:) in conformance VoiceFeedbackAnnouncementFlow(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = protocol witness for Flow.onAsync(input:) in conformance VoiceFeedbackAnnouncementFlow;
  return MEMORY[0x270F66CE0](a1, a2, a3);
}

uint64_t protocol witness for Flow.onAsync(input:) in conformance VoiceFeedbackAnnouncementFlow(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t protocol witness for Flow.execute() in conformance VoiceFeedbackAnnouncementFlow(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = protocol witness for Flow.execute() in conformance VoiceFeedbackAnnouncementFlow;
  return VoiceFeedbackAnnouncementFlow.execute()(a1);
}

uint64_t protocol witness for Flow.execute() in conformance VoiceFeedbackAnnouncementFlow()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t protocol witness for Flow.exitValue.getter in conformance VoiceFeedbackAnnouncementFlow()
{
  return MEMORY[0x270F66CE8]();
}

uint64_t protocol witness for Flow.flexibleExecutionSupport.getter in conformance VoiceFeedbackAnnouncementFlow()
{
  return MEMORY[0x270F66CC8]();
}

uint64_t variable initialization expression of GoalCompletionModel.alertType()
{
  return 1;
}

uint64_t variable initialization expression of VoiceFeedbackTargetZone.paceFormat()
{
  return 2;
}

uint64_t variable initialization expression of VoiceFeedbackTargetZone.zoneIndex()
{
  return 0;
}

uint64_t variable initialization expression of DistanceSplitModel.alertType()
{
  return 20;
}

uint64_t variable initialization expression of DistanceSplitModel.duration()
{
  return 0;
}

uint64_t variable initialization expression of HalfwayGoalCompletionModel.alertType()
{
  return 2;
}

uint64_t variable initialization expression of LapCompletionModel.alertType()
{
  return 5;
}

uint64_t variable initialization expression of WorkoutReminderAnnouncementFlow.state()
{
  type metadata accessor for WorkoutReminderAnnouncementFlow.State(0);
  return swift_storeEnumTagMultiPayload();
}

uint64_t variable initialization expression of AboveTargetZoneModel.alertType()
{
  return 23;
}

uint64_t variable initialization expression of AboveTargetZoneModel.paceFormat()
{
  return 2;
}

uint64_t variable initialization expression of TimeSplitModel.alertType()
{
  return 21;
}

uint64_t variable initialization expression of WorkoutReminderAnnouncementDirectInvocation.appBundleIdOfLastAnnouncement()
{
  return 0;
}

uint64_t variable initialization expression of PacerGoalCompletionModel.alertType()
{
  return 8;
}

uint64_t variable initialization expression of WorkoutReminderControlsDirectInvocation.identifier()
{
  return 0;
}

uint64_t variable initialization expression of BelowTargetZoneModel.alertType()
{
  return 24;
}

uint64_t variable initialization expression of BelowTargetZoneModel.paceFormat()
{
  return 2;
}

uint64_t variable initialization expression of VoiceFeedbackWorkoutStep.magnitude()
{
  return 0;
}

uint64_t variable initialization expression of VoiceFeedbackWorkoutStep.unit()
{
  return 0;
}

double variable initialization expression of VoiceFeedbackWorkoutStep.targetZone@<D0>(uint64_t a1@<X8>)
{
  *(_WORD *)(a1 + 48) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  return result;
}

uint64_t variable initialization expression of SegmentModel.alertType()
{
  return 18;
}

uint64_t variable initialization expression of UpcomingIntervalModel.alertType()
{
  return 4;
}

double variable initialization expression of UpcomingIntervalModel.completedStep@<D0>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 1;
  double result = 0.0;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 74) = 0u;
  return result;
}

uint64_t variable initialization expression of EnteredTargetZoneModel.alertType()
{
  return 22;
}

uint64_t variable initialization expression of EnteredTargetZoneModel.paceFormat()
{
  return 2;
}

void protocol witness for SetAlgebra.init() in conformance NSPropertyListMutabilityOptions(void *a1@<X8>)
{
  *a1 = 0;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance AFWorkoutType(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance HKWorkoutActivityType(void *a1, void *a2)
{
  return *a1 == *a2;
}

void *protocol witness for OptionSet.init(rawValue:) in conformance NSJSONWritingOptions@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t serialize(_:at:)(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t closure #1 in osLogInternal(_:log:type:)(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(void (*a1)(void))
{
  a1();
  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:attributes:)(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(void (*a1)(void))
{
  a1();
  return _typeName(_:qualified:)();
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
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

void closure #1 in OSLogArguments.append(_:)(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  unint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  *a1 = v7;
  int64_t v8 = *a2;
  if (*a2)
  {
    *int64_t v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(char a1)
{
  Hasher.init(_seed:)();
  VoiceFeedbackKeys.rawValue.getter(a1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  Swift::Int v2 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
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

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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
      unint64_t v8 = 0x80000002619DBBD0;
      switch(*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        case 1:
          unint64_t v7 = 0x6574656C706D6F63;
          unint64_t v8 = 0xED00007065745364;
          break;
        case 2:
          unint64_t v8 = 0xE800000000000000;
          unint64_t v7 = 0x6E6F697461727564;
          break;
        case 3:
          unint64_t v8 = 0xE500000000000000;
          unint64_t v7 = 0x7865646E69;
          break;
        case 4:
          break;
        case 5:
          int64_t v9 = "isFirstCompletedStep";
          goto LABEL_14;
        case 6:
          unint64_t v7 = 0x647574696E67616DLL;
          goto LABEL_10;
        case 7:
          unint64_t v7 = 0x795463697274656DLL;
          unint64_t v8 = 0xEA00000000006570;
          break;
        case 8:
          unint64_t v8 = 0xE800000000000000;
          unint64_t v7 = 0x706574537478656ELL;
          break;
        case 9:
          int64_t v9 = "d";
LABEL_14:
          unint64_t v8 = (unint64_t)v9 | 0x8000000000000000;
          unint64_t v7 = 0xD000000000000011;
          break;
        case 0xA:
          unint64_t v7 = 0xD000000000000012;
          uint64_t v10 = "nextStepMagnitude";
          goto LABEL_22;
        case 0xB:
          unint64_t v7 = 0x706574537478656ELL;
          unint64_t v8 = 0xEC00000074696E55;
          break;
        case 0xC:
          unint64_t v8 = 0xEA00000000007461;
          unint64_t v7 = 0x6D726F4665636170;
          break;
        case 0xD:
          unint64_t v8 = 0xE700000000000000;
          unint64_t v7 = 0x746E656D676573;
          break;
        case 0xE:
          unint64_t v7 = 0xD000000000000012;
          uint64_t v10 = "paceFormat";
          goto LABEL_22;
        case 0xF:
          unint64_t v8 = 0xE400000000000000;
          unint64_t v7 = 1953066613;
          break;
        case 0x10:
          unint64_t v7 = 0xD000000000000017;
          uint64_t v10 = "shouldOmitDuration";
LABEL_22:
          unint64_t v8 = (unint64_t)v10 | 0x8000000000000000;
          break;
        default:
          unint64_t v7 = 0x7079547472656C61;
LABEL_10:
          unint64_t v8 = 0xE900000000000065;
          break;
      }
      unint64_t v11 = 0x80000002619DBBD0;
      switch(v6)
      {
        case 1:
          unint64_t v11 = 0xED00007065745364;
          if (v7 == 0x6574656C706D6F63) {
            goto LABEL_25;
          }
          goto LABEL_26;
        case 2:
          unint64_t v11 = 0xE800000000000000;
          if (v7 != 0x6E6F697461727564) {
            goto LABEL_26;
          }
          goto LABEL_25;
        case 3:
          unint64_t v11 = 0xE500000000000000;
          if (v7 != 0x7865646E69) {
            goto LABEL_26;
          }
          goto LABEL_25;
        case 4:
          if (v7 == 0xD000000000000014) {
            goto LABEL_25;
          }
          goto LABEL_26;
        case 5:
          uint64_t v14 = "isFirstCompletedStep";
          goto LABEL_45;
        case 6:
          uint64_t v13 = 0x647574696E67616DLL;
          goto LABEL_38;
        case 7:
          unint64_t v11 = 0xEA00000000006570;
          if (v7 != 0x795463697274656DLL) {
            goto LABEL_26;
          }
          goto LABEL_25;
        case 8:
          unint64_t v11 = 0xE800000000000000;
          if (v7 != 0x706574537478656ELL) {
            goto LABEL_26;
          }
          goto LABEL_25;
        case 9:
          uint64_t v14 = "d";
LABEL_45:
          unint64_t v11 = (unint64_t)v14 | 0x8000000000000000;
          if (v7 != 0xD000000000000011) {
            goto LABEL_26;
          }
          goto LABEL_25;
        case 10:
          unint64_t v15 = 0xD000000000000012;
          char v16 = "nextStepMagnitude";
          goto LABEL_58;
        case 11:
          unint64_t v11 = 0xEC00000074696E55;
          if (v7 != 0x706574537478656ELL) {
            goto LABEL_26;
          }
          goto LABEL_25;
        case 12:
          unint64_t v11 = 0xEA00000000007461;
          if (v7 != 0x6D726F4665636170) {
            goto LABEL_26;
          }
          goto LABEL_25;
        case 13:
          unint64_t v11 = 0xE700000000000000;
          if (v7 != 0x746E656D676573) {
            goto LABEL_26;
          }
          goto LABEL_25;
        case 14:
          unint64_t v15 = 0xD000000000000012;
          char v16 = "paceFormat";
          goto LABEL_58;
        case 15:
          unint64_t v11 = 0xE400000000000000;
          if (v7 != 1953066613) {
            goto LABEL_26;
          }
          goto LABEL_25;
        case 16:
          unint64_t v15 = 0xD000000000000017;
          char v16 = "shouldOmitDuration";
LABEL_58:
          unint64_t v11 = (unint64_t)v16 | 0x8000000000000000;
          if (v7 != v15) {
            goto LABEL_26;
          }
          goto LABEL_25;
        default:
          uint64_t v13 = 0x7079547472656C61;
LABEL_38:
          unint64_t v11 = 0xE900000000000065;
          if (v7 != v13) {
            goto LABEL_26;
          }
LABEL_25:
          if (v8 == v11)
          {
            swift_bridgeObjectRelease_n();
            return v4;
          }
LABEL_26:
          char v12 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v12) {
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

uint64_t specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3)
{
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
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
  BOOL v14 = a4 + 32;
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
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<VoiceFeedbackKeys?>);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
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
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t type metadata accessor for PatternExecutionDialog()
{
  unint64_t result = lazy cache variable for type metadata for PatternExecutionDialog;
  if (!lazy cache variable for type metadata for PatternExecutionDialog)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for PatternExecutionDialog);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for VoiceFeedbackAnnouncementFlow(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for VoiceFeedbackAnnouncementFlow(uint64_t a1)
{
  uint64_t v1 = a1 + 8;
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1Tm(v1);
}

uint64_t initializeWithCopy for VoiceFeedbackAnnouncementFlow(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v3 = a2 + 8;
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 32) = v4;
  uint64_t v5 = v4;
  unint64_t v6 = **(void (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  swift_bridgeObjectRetain();
  v6(a1 + 8, v3, v5);
  return a1;
}

void *assignWithCopy for VoiceFeedbackAnnouncementFlow(void *a1, void *a2)
{
  uint64_t v3 = a2 + 1;
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_assign_boxed_opaque_existential_1(a1 + 1, v3);
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
        unint64_t result = (uint64_t *)swift_release();
        *uint64_t v3 = v12;
      }
      else
      {
        int64_t v11 = *(uint64_t (**)(void))(v10 + 24);
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
          *unint64_t result = *a2;
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

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for VoiceFeedbackAnnouncementFlow(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm(a1 + 8);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for VoiceFeedbackAnnouncementFlow(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for VoiceFeedbackAnnouncementFlow(uint64_t result, int a2, int a3)
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
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for VoiceFeedbackAnnouncementFlow()
{
  return &type metadata for VoiceFeedbackAnnouncementFlow;
}

uint64_t outlined init with copy of VoiceFeedbackPatternResolving?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for VoiceFeedbackPatternResolving?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of Any?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t lazy protocol witness table accessor for type VoiceFeedbackErrors and conformance VoiceFeedbackErrors()
{
  unint64_t result = lazy protocol witness table cache variable for type VoiceFeedbackErrors and conformance VoiceFeedbackErrors;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackErrors and conformance VoiceFeedbackErrors)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackErrors and conformance VoiceFeedbackErrors);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type VoiceFeedbackErrors and conformance VoiceFeedbackErrors;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackErrors and conformance VoiceFeedbackErrors)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackErrors and conformance VoiceFeedbackErrors);
  }
  return result;
}

uint64_t outlined init with take of VoiceFeedbackPatternResolving(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_26199E494()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 51, 7);
}

uint64_t sub_26199E4CC()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 74, 7);
}

uint64_t sub_26199E504()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_26199E53C()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 57, 7);
}

uint64_t outlined init with take of BelowTargetZoneModel?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t _s20WorkoutAnnouncements21UpcomingIntervalModelVSgWOg(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 128);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  int v2 = v1 - 1;
  if (v2 < 0) {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t sub_26199E5FC()
{
  if (*(void *)(v0 + 48) != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 210, 7);
}

uint64_t sub_26199E654()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 48, 7);
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

uint64_t GoalCompletionModel.alertType.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*GoalCompletionModel.alertType.modify())()
{
  return closure #1 in default argument 1 of OutputGenerationManifest.init(dialogPhase:_:);
}

WorkoutAnnouncements::GoalCompletionModel __swiftcall GoalCompletionModel.init(magnitude:unit:)(Swift::Double magnitude, Swift::String unit)
{
  object = unit._object;
  uint64_t countAndFlagsBits = unit._countAndFlagsBits;
  WorkoutAnnouncements::VoiceFeedbackAlertType v4 = WorkoutAnnouncements_VoiceFeedbackAlertType_goalCompletion;
  result.magnitude = magnitude;
  result.unit._object = object;
  result.unit._uint64_t countAndFlagsBits = countAndFlagsBits;
  result.alertType = v4;
  return result;
}

uint64_t static GoalCompletionModel.__derived_struct_equals(_:_:)(char a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, double a7, double a8)
{
  if (a1 != a4 || a7 != a8) {
    return 0;
  }
  if (a2 == a5 && a3 == a6) {
    return 1;
  }
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t GoalCompletionModel.CodingKeys.stringValue.getter(char a1)
{
  return *(void *)&aAlerttypmagnit[8 * a1];
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance GoalCompletionModel.CodingKeys(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance GoalCompletionModel.CodingKeys()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance GoalCompletionModel.CodingKeys()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance GoalCompletionModel.CodingKeys()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance GoalCompletionModel.CodingKeys()
{
  return GoalCompletionModel.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance GoalCompletionModel.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized GoalCompletionModel.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance GoalCompletionModel.CodingKeys()
{
  return 0;
}

void protocol witness for CodingKey.init(intValue:) in conformance GoalCompletionModel.CodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GoalCompletionModel.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type GoalCompletionModel.CodingKeys and conformance GoalCompletionModel.CodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance GoalCompletionModel.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type GoalCompletionModel.CodingKeys and conformance GoalCompletionModel.CodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t GoalCompletionModel.encode(to:)(void *a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v12 = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<GoalCompletionModel.CodingKeys>);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type GoalCompletionModel.CodingKeys and conformance GoalCompletionModel.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  char v16 = a2;
  char v15 = 0;
  lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v4)
  {
    char v14 = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
    char v13 = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

double GoalCompletionModel.init(from:)(void *a1)
{
  return specialized GoalCompletionModel.init(from:)(a1);
}

uint64_t protocol witness for VoiceFeedbackAlerting.alertType.getter in conformance GoalCompletionModel()
{
  return *v0;
}

void protocol witness for Decodable.init(from:) in conformance GoalCompletionModel(void *a1@<X0>, uint64_t a2@<X8>)
{
  double v7 = specialized GoalCompletionModel.init(from:)(a1);
  if (!v2)
  {
    *(unsigned char *)a2 = v4;
    *(double *)(a2 + 8) = v7;
    *(void *)(a2 + 16) = v5;
    *(void *)(a2 + 24) = v6;
  }
}

uint64_t protocol witness for Encodable.encode(to:) in conformance GoalCompletionModel(void *a1)
{
  return GoalCompletionModel.encode(to:)(a1, *(unsigned char *)v1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance GoalCompletionModel(double *a1, double *a2)
{
  if (*(unsigned __int8 *)a1 != *(unsigned __int8 *)a2 || a1[1] != a2[1]) {
    return 0;
  }
  if (*((void *)a1 + 2) == *((void *)a2 + 2) && *((void *)a1 + 3) == *((void *)a2 + 3)) {
    return 1;
  }
  else {
    return _stringCompareWithSmolCheck(_:_:expecting:)();
  }
}

uint64_t protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance GoalCompletionModel(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1[1];
  uint64_t v3 = v1[3];
  v2[4] = v1[2];
  v2[5] = v3;
  return MEMORY[0x270FA2498](protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance GoalCompletionModel, 0, 0);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v7;
  uint64_t v8;

  double v7 = *v2;
  swift_task_dealloc();
  char v4 = swift_bridgeObjectRelease();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    char v4 = a1;
  }
  return v5(v4);
}

uint64_t protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance GoalCompletionModel()
{
  uint64_t v1 = *__swift_project_boxed_opaque_existential_1(*(void **)(v0 + 16), *(void *)(*(void *)(v0 + 16) + 24));
  double v7 = (uint64_t (*)(char, uint64_t, uint64_t, uint64_t, double))((char *)&async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.goalCompletion(executeSashGroupOnWatch:_:)
                                                                       + async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.goalCompletion(executeSashGroupOnWatch:_:));
  swift_bridgeObjectRetain();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v2;
  *uint64_t v2 = v0;
  v2[1] = protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance GoalCompletionModel;
  uint64_t v3 = *(void *)(v0 + 32);
  uint64_t v4 = *(void *)(v0 + 40);
  double v5 = *(double *)(v0 + 24);
  return v7(0, v1, v3, v4, v5);
}

unint64_t lazy protocol witness table accessor for type GoalCompletionModel.CodingKeys and conformance GoalCompletionModel.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type GoalCompletionModel.CodingKeys and conformance GoalCompletionModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GoalCompletionModel.CodingKeys and conformance GoalCompletionModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GoalCompletionModel.CodingKeys and conformance GoalCompletionModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GoalCompletionModel.CodingKeys and conformance GoalCompletionModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GoalCompletionModel.CodingKeys and conformance GoalCompletionModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GoalCompletionModel.CodingKeys and conformance GoalCompletionModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GoalCompletionModel.CodingKeys and conformance GoalCompletionModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GoalCompletionModel.CodingKeys and conformance GoalCompletionModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GoalCompletionModel.CodingKeys and conformance GoalCompletionModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GoalCompletionModel.CodingKeys and conformance GoalCompletionModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GoalCompletionModel.CodingKeys and conformance GoalCompletionModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GoalCompletionModel.CodingKeys and conformance GoalCompletionModel.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType()
{
  unint64_t result = lazy protocol witness table cache variable for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType);
  }
  return result;
}

uint64_t specialized Sequence.compactMap<A>(_:)(uint64_t a1)
{
  uint64_t v2 = a1 + 64;
  uint64_t v3 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v6 = (unint64_t)(v3 + 63) >> 6;
  uint64_t v32 = v29;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  uint64_t v9 = (void *)MEMORY[0x263F8EE78];
  if (v5) {
    goto LABEL_31;
  }
LABEL_6:
  int64_t v10 = v8 + 1;
  if (!__OFADD__(v8, 1))
  {
    if (v10 < v6)
    {
      unint64_t v11 = *(void *)(v2 + 8 * v10);
      ++v8;
      if (v11) {
        goto LABEL_21;
      }
      int64_t v8 = v10 + 1;
      if (v10 + 1 >= v6) {
        goto LABEL_32;
      }
      unint64_t v11 = *(void *)(v2 + 8 * v8);
      if (v11) {
        goto LABEL_21;
      }
      int64_t v8 = v10 + 2;
      if (v10 + 2 >= v6) {
        goto LABEL_32;
      }
      unint64_t v11 = *(void *)(v2 + 8 * v8);
      if (v11) {
        goto LABEL_21;
      }
      int64_t v8 = v10 + 3;
      if (v10 + 3 >= v6) {
        goto LABEL_32;
      }
      unint64_t v11 = *(void *)(v2 + 8 * v8);
      if (v11)
      {
LABEL_21:
        unint64_t v5 = (v11 - 1) & v11;
        for (unint64_t i = __clz(__rbit64(v11)) + (v8 << 6); ; unint64_t i = v21 | (v8 << 6))
        {
          char v14 = (uint64_t *)(*(void *)(a1 + 48) + 16 * i);
          uint64_t v15 = *v14;
          uint64_t v16 = v14[1];
          outlined init with copy of Any(*(void *)(a1 + 56) + 32 * i, (uint64_t)v31);
          *(void *)&long long v30 = v15;
          *((void *)&v30 + 1) = v16;
          long long v28 = v30;
          v29[0] = v31[0];
          v29[1] = v31[1];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          char v17 = specialized VoiceFeedbackKeys.init(rawValue:)();
          if (v17 == 17)
          {
            uint64_t v27 = 0;
            long long v25 = 0u;
            long long v26 = 0u;
          }
          else
          {
            LOBYTE(v25) = v17;
            outlined init with copy of Any((uint64_t)v32, (uint64_t)&v25 + 8);
          }
          outlined destroy of Any?((uint64_t)&v28, &demangling cache variable for type metadata for (key: String, value: Any));
          if (v27)
          {
            long long v22 = v25;
            long long v23 = v26;
            uint64_t v24 = v27;
            uint64_t result = swift_isUniquelyReferenced_nonNull_native();
            if ((result & 1) == 0)
            {
              uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v9[2] + 1, 1, v9);
              uint64_t v9 = (void *)result;
            }
            unint64_t v19 = v9[2];
            unint64_t v18 = v9[3];
            if (v19 >= v18 >> 1)
            {
              uint64_t result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)(v18 > 1), v19 + 1, 1, v9);
              uint64_t v9 = (void *)result;
            }
            v9[2] = v19 + 1;
            uint64_t v20 = &v9[5 * v19];
            v20[8] = v24;
            *((_OWORD *)v20 + 2) = v22;
            *((_OWORD *)v20 + 3) = v23;
            if (!v5) {
              goto LABEL_6;
            }
          }
          else
          {
            uint64_t result = outlined destroy of Any?((uint64_t)&v25, &demangling cache variable for type metadata for (VoiceFeedbackKeys, Any)?);
            if (!v5) {
              goto LABEL_6;
            }
          }
LABEL_31:
          unint64_t v21 = __clz(__rbit64(v5));
          v5 &= v5 - 1;
        }
      }
      int64_t v12 = v10 + 4;
      if (v12 < v6)
      {
        unint64_t v11 = *(void *)(v2 + 8 * v12);
        if (v11)
        {
          int64_t v8 = v12;
          goto LABEL_21;
        }
        while (1)
        {
          int64_t v8 = v12 + 1;
          if (__OFADD__(v12, 1)) {
            goto LABEL_34;
          }
          if (v8 >= v6) {
            break;
          }
          unint64_t v11 = *(void *)(v2 + 8 * v8);
          ++v12;
          if (v11) {
            goto LABEL_21;
          }
        }
      }
    }
LABEL_32:
    swift_release();
    return (uint64_t)v9;
  }
  __break(1u);
LABEL_34:
  __break(1u);
  return result;
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
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(VoiceFeedbackKeys, Any)>);
      int64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
      int64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[5 * v8 + 4]) {
          memmove(v12, a4 + 4, 40 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      int64_t v10 = (void *)MEMORY[0x263F8EE78];
      int64_t v12 = (void *)(MEMORY[0x263F8EE78] + 32);
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

uint64_t specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(uint64_t a1, char a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4) {
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  outlined init with copy of (VoiceFeedbackKeys, Any)(a1 + 32, (uint64_t)v41);
  char v7 = v41[0];
  char v43 = v41[0];
  outlined init with take of Any(v42, v40);
  uint64_t v8 = (void *)*a3;
  unint64_t v10 = specialized __RawDictionaryStorage.find<A>(_:)(v7);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12)) {
    goto LABEL_23;
  }
  char v14 = v9;
  if (v8[3] >= v13)
  {
    if (a2)
    {
      if (v9) {
        goto LABEL_10;
      }
    }
    else
    {
      specialized _NativeDictionary.copy()();
      if (v14) {
        goto LABEL_10;
      }
    }
LABEL_13:
    uint64_t v20 = (void *)*a3;
    *(void *)(*a3 + 8 * (v10 >> 6) + 64) |= 1 << v10;
    *(unsigned char *)(v20[6] + v10) = v7;
    outlined init with take of Any(v40, (_OWORD *)(v20[7] + 32 * v10));
    uint64_t v21 = v20[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (v22)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v20[2] = v23;
    uint64_t v24 = v4 - 1;
    if (!v24) {
      return swift_bridgeObjectRelease_n();
    }
    for (uint64_t i = a1 + 72; ; i += 40)
    {
      outlined init with copy of (VoiceFeedbackKeys, Any)(i, (uint64_t)v41);
      char v26 = v41[0];
      char v43 = v41[0];
      outlined init with take of Any(v42, v40);
      uint64_t v27 = (void *)*a3;
      unint64_t v28 = specialized __RawDictionaryStorage.find<A>(_:)(v26);
      uint64_t v30 = v27[2];
      BOOL v31 = (v29 & 1) == 0;
      BOOL v22 = __OFADD__(v30, v31);
      uint64_t v32 = v30 + v31;
      if (v22) {
        break;
      }
      char v33 = v29;
      if (v27[3] < v32)
      {
        specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v32, 1);
        unint64_t v28 = specialized __RawDictionaryStorage.find<A>(_:)(v26);
        if ((v33 & 1) != (v34 & 1)) {
          goto LABEL_25;
        }
      }
      if (v33) {
        goto LABEL_10;
      }
      uint64_t v35 = (void *)*a3;
      *(void *)(*a3 + 8 * (v28 >> 6) + 64) |= 1 << v28;
      *(unsigned char *)(v35[6] + v28) = v26;
      outlined init with take of Any(v40, (_OWORD *)(v35[7] + 32 * v28));
      uint64_t v36 = v35[2];
      BOOL v22 = __OFADD__(v36, 1);
      uint64_t v37 = v36 + 1;
      if (v22) {
        goto LABEL_24;
      }
      v35[2] = v37;
      if (!--v24) {
        return swift_bridgeObjectRelease_n();
      }
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v13, a2 & 1);
  unint64_t v15 = specialized __RawDictionaryStorage.find<A>(_:)(v7);
  if ((v14 & 1) == (v16 & 1))
  {
    unint64_t v10 = v15;
    if ((v14 & 1) == 0) {
      goto LABEL_13;
    }
LABEL_10:
    unint64_t v18 = (void *)swift_allocError();
    swift_willThrow();
    id v19 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v40);
      swift_bridgeObjectRelease();
      return MEMORY[0x263E47CC0](v18);
    }
    goto LABEL_26;
  }
LABEL_25:
  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
LABEL_26:
  _StringGuts.grow(_:)(30);
  v38._object = (void *)0x80000002619DBF50;
  v38._uint64_t countAndFlagsBits = 0xD00000000000001BLL;
  String.append(_:)(v38);
  _print_unlocked<A, B>(_:_:)();
  v39._uint64_t countAndFlagsBits = 39;
  v39._object = (void *)0xE100000000000000;
  String.append(_:)(v39);
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void *specialized _NativeDictionary.copy()()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<VoiceFeedbackKeys, Any>);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
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
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v17 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v18 - 1) & v18;
    unint64_t v15 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_12:
    char v16 = *(unsigned char *)(*(void *)(v2 + 48) + v15);
    outlined init with copy of Any(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v20);
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = v16;
    uint64_t result = outlined init with take of Any(v20, (_OWORD *)(*(void *)(v4 + 56) + 32 * v15));
  }
  int64_t v19 = v17 + 2;
  if (v19 >= v13) {
    goto LABEL_26;
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
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<VoiceFeedbackKeys, Any>);
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v32 = (void *)(v5 + 64);
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v31 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  swift_retain();
  int64_t v12 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v18 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v19 = v18 | (v12 << 6);
      goto LABEL_31;
    }
    int64_t v20 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      goto LABEL_41;
    }
    if (v20 >= v31) {
      break;
    }
    unint64_t v21 = v32[v20];
    ++v12;
    if (!v21)
    {
      int64_t v12 = v20 + 1;
      if (v20 + 1 >= v31) {
        break;
      }
      unint64_t v21 = v32[v12];
      if (!v21)
      {
        int64_t v22 = v20 + 2;
        if (v22 >= v31) {
          break;
        }
        unint64_t v21 = v32[v22];
        if (!v21)
        {
          while (1)
          {
            int64_t v12 = v22 + 1;
            if (__OFADD__(v22, 1)) {
              goto LABEL_42;
            }
            if (v12 >= v31) {
              goto LABEL_35;
            }
            unint64_t v21 = v32[v12];
            ++v22;
            if (v21) {
              goto LABEL_30;
            }
          }
        }
        int64_t v12 = v22;
      }
    }
LABEL_30:
    unint64_t v10 = (v21 - 1) & v21;
    unint64_t v19 = __clz(__rbit64(v21)) + (v12 << 6);
LABEL_31:
    char v27 = *(unsigned char *)(*(void *)(v5 + 48) + v19);
    unint64_t v28 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v19);
    if (a2) {
      outlined init with take of Any(v28, v33);
    }
    else {
      outlined init with copy of Any((uint64_t)v28, (uint64_t)v33);
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    swift_bridgeObjectRelease();
    Swift::Int v13 = Hasher._finalize()();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = v13 & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      goto LABEL_8;
    }
    char v23 = 0;
    unint64_t v24 = (unint64_t)(63 - v14) >> 6;
    do
    {
      if (++v16 == v24 && (v23 & 1) != 0)
      {
        __break(1u);
LABEL_41:
        __break(1u);
LABEL_42:
        __break(1u);
        JUMPOUT(0x26199FC98);
      }
      BOOL v25 = v16 == v24;
      if (v16 == v24) {
        unint64_t v16 = 0;
      }
      v23 |= v25;
      uint64_t v26 = *(void *)(v11 + 8 * v16);
    }
    while (v26 == -1);
    unint64_t v17 = __clz(__rbit64(~v26)) + (v16 << 6);
LABEL_8:
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    *(unsigned char *)(*(void *)(v7 + 48) + v17) = v27;
    outlined init with take of Any(v33, (_OWORD *)(*(void *)(v7 + 56) + 32 * v17));
    ++*(void *)(v7 + 16);
  }
LABEL_35:
  swift_release();
  uint64_t v3 = v2;
  if (a2)
  {
    uint64_t v29 = 1 << *(unsigned char *)(v5 + 32);
    if (v29 >= 64) {
      bzero(v32, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
    }
    else {
      *uint64_t v32 = -1 << v29;
    }
    *(void *)(v5 + 16) = 0;
  }
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
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
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (VoiceFeedbackKeys, Any));
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized GoalCompletionModel.init(with:)(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(specialized Sequence.compactMap<A>(_:)(a1) + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<VoiceFeedbackKeys, Any>);
    uint64_t v6 = static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v6 = MEMORY[0x263F8EE80];
  }
  *(void *)&long long v29 = v6;
  uint64_t v7 = swift_bridgeObjectRetain();
  specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(v7, 1, &v29);
  swift_bridgeObjectRelease();
  uint64_t v8 = v29;
  uint64_t v9 = Logger.workout.unsafeMutableAddressor();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v9, v2);
  swift_retain_n();
  unint64_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    *(void *)&long long v29 = v27;
    *(_DWORD *)uint64_t v12 = 136315394;
    uint64_t v28 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000013, 0x80000002619D8CE0, (uint64_t *)&v29);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v12 + 12) = 2080;
    uint64_t v24 = v12 + 14;
    lazy protocol witness table accessor for type VoiceFeedbackKeys and conformance VoiceFeedbackKeys();
    uint64_t v26 = v2;
    swift_retain();
    BOOL v25 = v5;
    uint64_t v13 = Dictionary.description.getter();
    uint64_t v14 = a1;
    unint64_t v16 = v15;
    swift_release();
    uint64_t v28 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v13, v16, (uint64_t *)&v29);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    a1 = v14;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_261998000, v10, v11, "%s received VoiceFeedback dictionary: %s", (uint8_t *)v12, 0x16u);
    uint64_t v17 = v27;
    swift_arrayDestroy();
    MEMORY[0x263E47E50](v17, -1, -1);
    MEMORY[0x263E47E50](v12, -1, -1);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v25, v26);
  }
  else
  {

    swift_release_n();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  if (*(void *)(v8 + 16)
    && (unint64_t v18 = specialized __RawDictionaryStorage.find<A>(_:)(6), (v19 & 1) != 0)
    && (outlined init with copy of Any(*(void *)(v8 + 56) + 32 * v18, (uint64_t)&v29), (swift_dynamicCast() & 1) != 0))
  {
    if (*(void *)(v8 + 16) && (unint64_t v20 = specialized __RawDictionaryStorage.find<A>(_:)(15), (v21 & 1) != 0))
    {
      outlined init with copy of Any(*(void *)(v8 + 56) + 32 * v20, (uint64_t)&v29);
    }
    else
    {
      long long v29 = 0u;
      long long v30 = 0u;
    }
    swift_release();
    if (!*((void *)&v30 + 1))
    {
      swift_bridgeObjectRelease();
      outlined destroy of Any?((uint64_t)&v29, &demangling cache variable for type metadata for Any?);
      return 0;
    }
    if (swift_dynamicCast())
    {
      swift_bridgeObjectRetain();
      char v23 = specialized VoiceFeedbackAlerting.hasValidAlertType(in:)(a1, 1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v23) {
        return 1;
      }
    }
  }
  else
  {
    swift_release();
  }
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t specialized closure #1 in GoalCompletionModel.executePattern(wrapper:)(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  MEMORY[0x270FA5388](v8 - 8);
  unint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = String.toDialogUnit.getter(a2, a3);
  uint64_t v13 = v11;
  if (v12 == 115 && v11 == 0xE100000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    type metadata accessor for DialogDuration.Builder();
    swift_allocObject();
    DialogDuration.Builder.init()();
    dispatch thunk of DialogDuration.Builder.withSecs(_:)();
    swift_release();
    uint64_t v14 = dispatch thunk of DialogDuration.Builder.build()();
    swift_release();
    uint64_t result = swift_release();
    *(void *)a1 = v14;
  }
  else if (String.isDialogDistanceUnit.getter(v12, v13))
  {
    type metadata accessor for DialogLength.Builder();
    swift_allocObject();
    MEMORY[0x263E473C0]();
    dispatch thunk of DialogAbstractMeasurement.Builder.withValue(_:)();
    swift_release();
    String.toSpeakableString.getter();
    swift_bridgeObjectRelease();
    uint64_t v16 = type metadata accessor for SpeakableString();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v10, 0, 1, v16);
    dispatch thunk of DialogAbstractMeasurement.Builder.withUnits(_:)();
    swift_release();
    outlined destroy of Any?((uint64_t)v10, &demangling cache variable for type metadata for SpeakableString?);
    uint64_t v17 = dispatch thunk of DialogAbstractMeasurement.Builder.build()();
    swift_release();
    uint64_t result = swift_release();
    *(void *)(a1 + 16) = v17;
  }
  else
  {
    *(double *)(a1 + 24) = a4;
    *(unsigned char *)(a1 + 32) = 0;
    String.toSpeakableString.getter();
    swift_bridgeObjectRelease();
    uint64_t v18 = type metadata accessor for SpeakableString();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v10, 0, 1, v18);
    uint64_t v19 = type metadata accessor for WorkoutVoiceFeedbackGoalCompletionParameters(0);
    return outlined assign with take of SpeakableString?((uint64_t)v10, a1 + *(int *)(v19 + 32));
  }
  return result;
}

uint64_t specialized GoalCompletionModel.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x7079547472656C61 && a2 == 0xE900000000000065;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x647574696E67616DLL && a2 == 0xE900000000000065 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1953066613 && a2 == 0xE400000000000000)
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

double specialized GoalCompletionModel.init(from:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<GoalCompletionModel.CodingKeys>);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type GoalCompletionModel.CodingKeys and conformance GoalCompletionModel.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v1)
  {
    char v13 = 0;
    lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    char v12 = 1;
    KeyedDecodingContainer.decode(_:forKey:)();
    double v2 = v8;
    char v11 = 2;
    KeyedDecodingContainer.decode(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  return v2;
}

unint64_t instantiation function for generic protocol witness table for GoalCompletionModel(void *a1)
{
  a1[1] = lazy protocol witness table accessor for type GoalCompletionModel and conformance GoalCompletionModel();
  a1[2] = lazy protocol witness table accessor for type GoalCompletionModel and conformance GoalCompletionModel();
  unint64_t result = lazy protocol witness table accessor for type GoalCompletionModel and conformance GoalCompletionModel();
  a1[3] = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type GoalCompletionModel and conformance GoalCompletionModel()
{
  unint64_t result = lazy protocol witness table cache variable for type GoalCompletionModel and conformance GoalCompletionModel;
  if (!lazy protocol witness table cache variable for type GoalCompletionModel and conformance GoalCompletionModel)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GoalCompletionModel and conformance GoalCompletionModel);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GoalCompletionModel and conformance GoalCompletionModel;
  if (!lazy protocol witness table cache variable for type GoalCompletionModel and conformance GoalCompletionModel)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GoalCompletionModel and conformance GoalCompletionModel);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type GoalCompletionModel and conformance GoalCompletionModel;
  if (!lazy protocol witness table cache variable for type GoalCompletionModel and conformance GoalCompletionModel)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GoalCompletionModel and conformance GoalCompletionModel);
  }
  return result;
}

uint64_t destroy for GoalCompletionModel()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for GoalCompletionModel(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for GoalCompletionModel(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for GoalCompletionModel(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for GoalCompletionModel(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GoalCompletionModel(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GoalCompletionModel()
{
  return &type metadata for GoalCompletionModel;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for GoalCompletionModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for GoalCompletionModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2619A0C78);
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

uint64_t getEnumTag for GoalCompletionModel.CodingKeys(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *destructiveInjectEnumTag for GoalCompletionModel.CodingKeys(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

void *type metadata accessor for GoalCompletionModel.CodingKeys()
{
  return &unk_270D9AEA0;
}

uint64_t outlined assign with take of SpeakableString?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t lazy protocol witness table accessor for type VoiceFeedbackKeys and conformance VoiceFeedbackKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type VoiceFeedbackKeys and conformance VoiceFeedbackKeys;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackKeys and conformance VoiceFeedbackKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackKeys and conformance VoiceFeedbackKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type VoiceFeedbackKeys and conformance VoiceFeedbackKeys;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackKeys and conformance VoiceFeedbackKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackKeys and conformance VoiceFeedbackKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type VoiceFeedbackKeys and conformance VoiceFeedbackKeys;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackKeys and conformance VoiceFeedbackKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackKeys and conformance VoiceFeedbackKeys);
  }
  return result;
}

uint64_t outlined init with copy of (VoiceFeedbackKeys, Any)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (VoiceFeedbackKeys, Any));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *outlined init with take of Any(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void __swiftcall VoiceFeedbackTargetZone.init(minMagnitude:maxMagnitude:unit:metricType:paceFormat:zoneIndex:)(WorkoutAnnouncements::VoiceFeedbackTargetZone *__return_ptr retstr, Swift::Double minMagnitude, Swift::Double maxMagnitude, Swift::String unit, WorkoutAnnouncements::VoiceFeedbackMetricType metricType, WorkoutAnnouncements::VoiceFeedbackPaceFormat_optional paceFormat, Swift::Int_optional zoneIndex)
{
  retstr->minMagnitude = minMagnitude;
  retstr->maxMagnitude = maxMagnitude;
  retstr->unit = unit;
  retstr->metricType = metricType;
  retstr->paceFormat = paceFormat;
  retstr->zoneIndex.value = zoneIndex.value;
  retstr->zoneIndex.is_nil = zoneIndex.is_nil;
  retstr->isSingleThreshold = minMagnitude == maxMagnitude;
}

double VoiceFeedbackTargetZone.init(from:)@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  specialized VoiceFeedbackTargetZone.init(from:)(a1, (uint64_t)v6);
  if (!v2)
  {
    long long v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    double result = *(double *)&v7;
    *(_OWORD *)(a2 + 32) = v7;
    *(_WORD *)(a2 + 48) = v8;
  }
  return result;
}

uint64_t VoiceFeedbackTargetZone.CodingKeys.stringValue.getter(char a1)
{
  uint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      unsigned int v3 = 1299734893;
      goto LABEL_4;
    case 2:
      uint64_t result = 1953066613;
      break;
    case 3:
      uint64_t result = 0x795463697274656DLL;
      break;
    case 4:
      uint64_t result = 0x6D726F4665636170;
      break;
    case 5:
      uint64_t result = 0x65646E49656E6F7ALL;
      break;
    case 6:
      return result;
    default:
      unsigned int v3 = 1299081581;
LABEL_4:
      uint64_t result = v3 | 0x696E676100000000;
      break;
  }
  return result;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance VoiceFeedbackTargetZone.CodingKeys()
{
  return VoiceFeedbackTargetZone.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance VoiceFeedbackTargetZone.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized VoiceFeedbackTargetZone.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance VoiceFeedbackTargetZone.CodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 7;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance VoiceFeedbackTargetZone.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type VoiceFeedbackTargetZone.CodingKeys and conformance VoiceFeedbackTargetZone.CodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance VoiceFeedbackTargetZone.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type VoiceFeedbackTargetZone.CodingKeys and conformance VoiceFeedbackTargetZone.CodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t VoiceFeedbackTargetZone.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<VoiceFeedbackTargetZone.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  __int16 v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type VoiceFeedbackTargetZone.CodingKeys and conformance VoiceFeedbackTargetZone.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v11[5] = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v2)
  {
    v11[4] = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
    v11[3] = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
    v11[2] = *(unsigned char *)(v3 + 32);
    v11[1] = 3;
    lazy protocol witness table accessor for type VoiceFeedbackMetricType and conformance VoiceFeedbackMetricType();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    outlined init with take of VoiceFeedbackPaceFormat?(v3 + 33, (uint64_t)&v12);
    outlined init with take of VoiceFeedbackPaceFormat?((uint64_t)&v12, (uint64_t)v11);
    v10[8] = 4;
    lazy protocol witness table accessor for type VoiceFeedbackPaceFormat and conformance VoiceFeedbackPaceFormat();
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
    v10[7] = 5;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    v10[6] = 6;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

double protocol witness for Decodable.init(from:) in conformance VoiceFeedbackTargetZone@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  specialized VoiceFeedbackTargetZone.init(from:)(a1, (uint64_t)v6);
  if (!v2)
  {
    long long v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    double result = *(double *)&v7;
    *(_OWORD *)(a2 + 32) = v7;
    *(_WORD *)(a2 + 48) = v8;
  }
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance VoiceFeedbackTargetZone(void *a1)
{
  return VoiceFeedbackTargetZone.encode(to:)(a1);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance VoiceFeedbackTargetZone(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a1 + 16);
  v5[0] = *(_OWORD *)a1;
  v5[1] = v2;
  v5[2] = *(_OWORD *)(a1 + 32);
  __int16 v6 = *(_WORD *)(a1 + 48);
  long long v3 = *(_OWORD *)(a2 + 16);
  v7[0] = *(_OWORD *)a2;
  v7[1] = v3;
  v7[2] = *(_OWORD *)(a2 + 32);
  __int16 v8 = *(_WORD *)(a2 + 48);
  return specialized static VoiceFeedbackTargetZone.__derived_struct_equals(_:_:)((uint64_t)v5, (uint64_t)v7) & 1;
}

uint64_t specialized static VoiceFeedbackTargetZone.__derived_struct_equals(_:_:)(uint64_t a1, uint64_t a2)
{
  if (*(double *)a1 != *(double *)a2 || *(double *)(a1 + 8) != *(double *)(a2 + 8)) {
    goto LABEL_20;
  }
  BOOL v4 = *(void *)(a1 + 16) == *(void *)(a2 + 16) && *(void *)(a1 + 24) == *(void *)(a2 + 24);
  if (v4 || (v5 = _stringCompareWithSmolCheck(_:_:expecting:)(), char v6 = 0, (v5 & 1) != 0))
  {
    if (*(unsigned __int8 *)(a1 + 32) != *(unsigned __int8 *)(a2 + 32))
    {
LABEL_20:
      char v6 = 0;
      return v6 & 1;
    }
    int v7 = *(unsigned __int8 *)(a1 + 33);
    int v8 = *(unsigned __int8 *)(a2 + 33);
    if (v7 == 2)
    {
      if (v8 != 2) {
        goto LABEL_20;
      }
    }
    else
    {
      char v6 = 0;
      if (v8 == 2 || ((v8 ^ v7) & 1) != 0) {
        return v6 & 1;
      }
    }
    char v6 = *(unsigned char *)(a2 + 48);
    if ((*(unsigned char *)(a1 + 48) & 1) == 0)
    {
      if (*(void *)(a1 + 40) != *(void *)(a2 + 40)) {
        char v6 = 1;
      }
      if (v6) {
        goto LABEL_20;
      }
LABEL_22:
      char v6 = ((*(unsigned char *)(a1 + 49) & 1) == 0) ^ *(unsigned char *)(a2 + 49);
      return v6 & 1;
    }
    if (*(unsigned char *)(a2 + 48)) {
      goto LABEL_22;
    }
  }
  return v6 & 1;
}

uint64_t specialized VoiceFeedbackTargetZone.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<VoiceFeedbackTargetZone.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type VoiceFeedbackTargetZone.CodingKeys and conformance VoiceFeedbackTargetZone.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  }
  char v37 = 0;
  KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v10 = v9;
  char v36 = 1;
  KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v12 = v11;
  char v35 = 2;
  uint64_t v14 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v16 = v15;
  char v34 = 3;
  swift_bridgeObjectRetain();
  unint64_t v17 = KeyedDecodingContainer.decode(_:forKey:)();
  int v18 = specialized VoiceFeedbackMetricType.init(rawValue:)(v17);
  if (v18 == 8)
  {
    swift_bridgeObjectRelease();
    char v33 = 3;
    type metadata accessor for DecodingError();
    swift_allocError();
    lazy protocol witness table accessor for type KeyedDecodingContainer<VoiceFeedbackTargetZone.CodingKeys> and conformance KeyedDecodingContainer<A>();
LABEL_6:
    static DecodingError.dataCorruptedError<A>(forKey:in:debugDescription:)();
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
    return swift_bridgeObjectRelease();
  }
  int v28 = v18;
  char v32 = 4;
  uint64_t v19 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  if (v20)
  {
    int v21 = 2;
  }
  else
  {
    if (!v19)
    {
      int v27 = 0;
      goto LABEL_13;
    }
    if (v19 != 1)
    {
      swift_bridgeObjectRelease();
      char v29 = 4;
      type metadata accessor for DecodingError();
      swift_allocError();
      lazy protocol witness table accessor for type KeyedDecodingContainer<VoiceFeedbackTargetZone.CodingKeys> and conformance KeyedDecodingContainer<A>();
      goto LABEL_6;
    }
    int v21 = 1;
  }
  int v27 = v21;
LABEL_13:
  char v31 = 5;
  uint64_t v22 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  HIDWORD(v25) = v23;
  uint64_t v26 = v22;
  char v30 = 6;
  char v24 = KeyedDecodingContainer.decode(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a2 = v10;
  *(void *)(a2 + 8) = v12;
  *(void *)(a2 + 16) = v14;
  *(void *)(a2 + 24) = v16;
  *(unsigned char *)(a2 + 32) = v28;
  *(unsigned char *)(a2 + 33) = v27;
  *(void *)(a2 + 40) = v26;
  *(unsigned char *)(a2 + 48) = BYTE4(v25) & 1;
  *(unsigned char *)(a2 + 49) = v24 & 1;
  return result;
}

unint64_t lazy protocol witness table accessor for type VoiceFeedbackTargetZone.CodingKeys and conformance VoiceFeedbackTargetZone.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type VoiceFeedbackTargetZone.CodingKeys and conformance VoiceFeedbackTargetZone.CodingKeys;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackTargetZone.CodingKeys and conformance VoiceFeedbackTargetZone.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackTargetZone.CodingKeys and conformance VoiceFeedbackTargetZone.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type VoiceFeedbackTargetZone.CodingKeys and conformance VoiceFeedbackTargetZone.CodingKeys;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackTargetZone.CodingKeys and conformance VoiceFeedbackTargetZone.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackTargetZone.CodingKeys and conformance VoiceFeedbackTargetZone.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type VoiceFeedbackTargetZone.CodingKeys and conformance VoiceFeedbackTargetZone.CodingKeys;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackTargetZone.CodingKeys and conformance VoiceFeedbackTargetZone.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackTargetZone.CodingKeys and conformance VoiceFeedbackTargetZone.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type VoiceFeedbackTargetZone.CodingKeys and conformance VoiceFeedbackTargetZone.CodingKeys;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackTargetZone.CodingKeys and conformance VoiceFeedbackTargetZone.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackTargetZone.CodingKeys and conformance VoiceFeedbackTargetZone.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type VoiceFeedbackMetricType and conformance VoiceFeedbackMetricType()
{
  unint64_t result = lazy protocol witness table cache variable for type VoiceFeedbackMetricType and conformance VoiceFeedbackMetricType;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackMetricType and conformance VoiceFeedbackMetricType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackMetricType and conformance VoiceFeedbackMetricType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type VoiceFeedbackMetricType and conformance VoiceFeedbackMetricType;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackMetricType and conformance VoiceFeedbackMetricType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackMetricType and conformance VoiceFeedbackMetricType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type VoiceFeedbackMetricType and conformance VoiceFeedbackMetricType;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackMetricType and conformance VoiceFeedbackMetricType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackMetricType and conformance VoiceFeedbackMetricType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type VoiceFeedbackMetricType and conformance VoiceFeedbackMetricType;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackMetricType and conformance VoiceFeedbackMetricType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackMetricType and conformance VoiceFeedbackMetricType);
  }
  return result;
}

uint64_t outlined init with take of VoiceFeedbackPaceFormat?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for VoiceFeedbackPaceFormat?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t lazy protocol witness table accessor for type VoiceFeedbackPaceFormat and conformance VoiceFeedbackPaceFormat()
{
  unint64_t result = lazy protocol witness table cache variable for type VoiceFeedbackPaceFormat and conformance VoiceFeedbackPaceFormat;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackPaceFormat and conformance VoiceFeedbackPaceFormat)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackPaceFormat and conformance VoiceFeedbackPaceFormat);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type VoiceFeedbackPaceFormat and conformance VoiceFeedbackPaceFormat;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackPaceFormat and conformance VoiceFeedbackPaceFormat)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackPaceFormat and conformance VoiceFeedbackPaceFormat);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type VoiceFeedbackPaceFormat and conformance VoiceFeedbackPaceFormat;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackPaceFormat and conformance VoiceFeedbackPaceFormat)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackPaceFormat and conformance VoiceFeedbackPaceFormat);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type VoiceFeedbackPaceFormat and conformance VoiceFeedbackPaceFormat;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackPaceFormat and conformance VoiceFeedbackPaceFormat)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackPaceFormat and conformance VoiceFeedbackPaceFormat);
  }
  return result;
}

uint64_t initializeWithCopy for VoiceFeedbackTargetZone(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(_WORD *)(a1 + 48) = *(_WORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for VoiceFeedbackTargetZone(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(unsigned char *)(a1 + 33) = *(unsigned char *)(a2 + 33);
  uint64_t v4 = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 40) = v4;
  *(unsigned char *)(a1 + 49) = *(unsigned char *)(a2 + 49);
  return a1;
}

__n128 __swift_memcpy50_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_WORD *)(a1 + 48) = *(_WORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for VoiceFeedbackTargetZone(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(unsigned char *)(a1 + 49) = *(unsigned char *)(a2 + 49);
  return a1;
}

uint64_t getEnumTagSinglePayload for VoiceFeedbackTargetZone(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 50)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for VoiceFeedbackTargetZone(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 48) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 50) = 1;
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
    *(unsigned char *)(result + 50) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for VoiceFeedbackTargetZone()
{
  return &type metadata for VoiceFeedbackTargetZone;
}

uint64_t getEnumTagSinglePayload for VoiceFeedbackTargetZone.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for VoiceFeedbackTargetZone.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2619A1E98);
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

void *type metadata accessor for VoiceFeedbackTargetZone.CodingKeys()
{
  return &unk_270D9AFC8;
}

uint64_t specialized VoiceFeedbackTargetZone.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x696E67614D6E696DLL && a2 == 0xEC00000065647574;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x696E67614D78616DLL && a2 == 0xEC00000065647574 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1953066613 && a2 == 0xE400000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x795463697274656DLL && a2 == 0xEA00000000006570 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6D726F4665636170 && a2 == 0xEA00000000007461 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x65646E49656E6F7ALL && a2 == 0xE900000000000078 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000002619DBBF0)
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

unint64_t lazy protocol witness table accessor for type KeyedDecodingContainer<VoiceFeedbackTargetZone.CodingKeys> and conformance KeyedDecodingContainer<A>()
{
  unint64_t result = lazy protocol witness table cache variable for type KeyedDecodingContainer<VoiceFeedbackTargetZone.CodingKeys> and conformance KeyedDecodingContainer<A>;
  if (!lazy protocol witness table cache variable for type KeyedDecodingContainer<VoiceFeedbackTargetZone.CodingKeys> and conformance KeyedDecodingContainer<A>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for KeyedDecodingContainer<VoiceFeedbackTargetZone.CodingKeys>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type KeyedDecodingContainer<VoiceFeedbackTargetZone.CodingKeys> and conformance KeyedDecodingContainer<A>);
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

uint64_t DistanceSplitModel.alertType.getter()
{
  return *v0;
}

uint64_t DistanceSplitModel.alertType.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*DistanceSplitModel.alertType.modify())()
{
  return closure #1 in default argument 1 of OutputGenerationManifest.init(dialogPhase:_:);
}

void __swiftcall DistanceSplitModel.init(index:paceMagnitude:duration:unit:paceFormat:)(WorkoutAnnouncements::DistanceSplitModel *__return_ptr retstr, Swift::Int index, Swift::Double paceMagnitude, Swift::Double_optional duration, Swift::String unit, WorkoutAnnouncements::VoiceFeedbackPaceFormat paceFormat)
{
  retstr->alertType = WorkoutAnnouncements_VoiceFeedbackAlertType_transitionedNotableDistance;
  retstr->index = index;
  retstr->magnitude = paceMagnitude;
  retstr->duration.value = *(Swift::Double *)&duration.is_nil;
  retstr->duration.is_nil = unit._countAndFlagsBits & 1;
  retstr->unit._uint64_t countAndFlagsBits = (uint64_t)unit._object;
  retstr->unit._object = (void *)paceFormat;
  retstr->paceFormat = v6 & 1;
  retstr->shouldOmitDuration = unit._countAndFlagsBits & 1;
}

unint64_t DistanceSplitModel.CodingKeys.stringValue.getter(char a1)
{
  unint64_t result = 0xD000000000000012;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x7865646E69;
      break;
    case 2:
      unint64_t result = 0x647574696E67616DLL;
      break;
    case 3:
      unint64_t result = 0x6E6F697461727564;
      break;
    case 4:
      unint64_t result = 1953066613;
      break;
    case 5:
      unint64_t result = 0x6D726F4665636170;
      break;
    case 6:
      return result;
    default:
      unint64_t result = 0x7079547472656C61;
      break;
  }
  return result;
}

unint64_t protocol witness for CodingKey.stringValue.getter in conformance DistanceSplitModel.CodingKeys()
{
  return DistanceSplitModel.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance DistanceSplitModel.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized DistanceSplitModel.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance DistanceSplitModel.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type DistanceSplitModel.CodingKeys and conformance DistanceSplitModel.CodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance DistanceSplitModel.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type DistanceSplitModel.CodingKeys and conformance DistanceSplitModel.CodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DistanceSplitModel.encode(to:)(void *a1)
{
  BOOL v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<DistanceSplitModel.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type DistanceSplitModel.CodingKeys and conformance DistanceSplitModel.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v10[15] = *v3;
  v10[14] = 0;
  lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v2)
  {
    v10[13] = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
    v10[12] = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
    v10[11] = 3;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    v10[10] = 4;
    KeyedEncodingContainer.encode(_:forKey:)();
    unsigned char v10[9] = v3[56];
    v10[8] = 5;
    lazy protocol witness table accessor for type VoiceFeedbackPaceFormat and conformance VoiceFeedbackPaceFormat();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    v10[7] = 6;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

double DistanceSplitModel.init(from:)@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  specialized DistanceSplitModel.init(from:)(a1, (uint64_t)v6);
  if (!v2)
  {
    long long v5 = v6[1];
    *a2 = v6[0];
    a2[1] = v5;
    a2[2] = v7[0];
    double result = *(double *)((char *)v7 + 10);
    *(_OWORD *)((char *)a2 + 42) = *(_OWORD *)((char *)v7 + 10);
  }
  return result;
}

double protocol witness for Decodable.init(from:) in conformance DistanceSplitModel@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  specialized DistanceSplitModel.init(from:)(a1, (uint64_t)v6);
  if (!v2)
  {
    long long v5 = v6[1];
    *a2 = v6[0];
    a2[1] = v5;
    a2[2] = v7[0];
    double result = *(double *)((char *)v7 + 10);
    *(_OWORD *)((char *)a2 + 42) = *(_OWORD *)((char *)v7 + 10);
  }
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance DistanceSplitModel(void *a1)
{
  return DistanceSplitModel.encode(to:)(a1);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance DistanceSplitModel(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  v5[0] = *a1;
  v5[1] = v2;
  v6[0] = a1[2];
  *(_OWORD *)((char *)v6 + 10) = *(_OWORD *)((char *)a1 + 42);
  long long v3 = a2[1];
  v7[0] = *a2;
  v7[1] = v3;
  v8[0] = a2[2];
  *(_OWORD *)((char *)v8 + 10) = *(_OWORD *)((char *)a2 + 42);
  return specialized static DistanceSplitModel.__derived_struct_equals(_:_:)((unsigned __int8 *)v5, (unsigned __int8 *)v7) & 1;
}

uint64_t DistanceSplitModel.executePattern(wrapper:)(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](DistanceSplitModel.executePattern(wrapper:), 0, 0);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v8;
  uint64_t v9;

  unsigned int v4 = *(void *)(*v2 + 24);
  int v8 = *v2;
  swift_task_dealloc();
  long long v5 = outlined release of DistanceSplitModel(v4);
  uint64_t v6 = *(uint64_t (**)(uint64_t))(v8 + 8);
  if (!v1) {
    long long v5 = a1;
  }
  return v6(v5);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v8;
  uint64_t v9;

  unsigned int v4 = *(void *)(*v2 + 24);
  int v8 = *v2;
  swift_task_dealloc();
  long long v5 = outlined release of DistanceSplitModel(v4);
  uint64_t v6 = *(uint64_t (**)(uint64_t))(v8 + 8);
  if (!v1) {
    long long v5 = a1;
  }
  return v6(v5);
}

uint64_t DistanceSplitModel.executePattern(wrapper:)()
{
  uint64_t v1 = *(void *)(v0 + 24);
  char v2 = *(unsigned char *)(v1 + 56);
  uint64_t v3 = *__swift_project_boxed_opaque_existential_1(*(void **)(v0 + 16), *(void *)(*(void *)(v0 + 16) + 24));
  outlined retain of DistanceSplitModel(v1);
  if (v2)
  {
    int v8 = (uint64_t (*)(char, uint64_t, uint64_t))((char *)&async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.transitionedNotableDistancePace(executeSashGroupOnWatch:_:)
                                                        + async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.transitionedNotableDistancePace(executeSashGroupOnWatch:_:));
    unsigned int v4 = (void *)swift_task_alloc();
    *(void *)(v0 + 40) = v4;
    *unsigned int v4 = v0;
    long long v5 = DistanceSplitModel.executePattern(wrapper:);
  }
  else
  {
    int v8 = (uint64_t (*)(char, uint64_t, uint64_t))((char *)&async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.transitionedNotableDistanceSpeed(executeSashGroupOnWatch:_:)
                                                        + async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.transitionedNotableDistanceSpeed(executeSashGroupOnWatch:_:));
    unsigned int v4 = (void *)swift_task_alloc();
    *(void *)(v0 + 32) = v4;
    *unsigned int v4 = v0;
    long long v5 = DistanceSplitModel.executePattern(wrapper:);
  }
  v4[1] = v5;
  uint64_t v6 = *(void *)(v0 + 24);
  return v8(0, v3, v6);
}

uint64_t closure #1 in DistanceSplitModel.executePattern(wrapper:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(double *)(a1 + 24) = (double)*(uint64_t *)(a2 + 8);
  *(unsigned char *)(a1 + 32) = 0;
  if ((*(unsigned char *)(a2 + 32) & 1) == 0)
  {
    type metadata accessor for DialogDuration.Builder();
    swift_allocObject();
    DialogDuration.Builder.init()();
    dispatch thunk of DialogDuration.Builder.withSecs(_:)();
    swift_release();
    uint64_t v7 = dispatch thunk of DialogDuration.Builder.build()();
    swift_release();
    swift_release();
    *(void *)a1 = v7;
  }
  type metadata accessor for DialogLength.Builder();
  swift_allocObject();
  MEMORY[0x263E473C0]();
  dispatch thunk of DialogAbstractMeasurement.Builder.withValue(_:)();
  swift_release();
  String.toDialogUnit.getter(*(void *)(a2 + 40), *(void *)(a2 + 48));
  String.toSpeakableString.getter();
  swift_bridgeObjectRelease();
  uint64_t v8 = type metadata accessor for SpeakableString();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, 0, 1, v8);
  dispatch thunk of DialogAbstractMeasurement.Builder.withUnits(_:)();
  swift_release();
  outlined destroy of Any?((uint64_t)v6, &demangling cache variable for type metadata for SpeakableString?);
  uint64_t v9 = dispatch thunk of DialogAbstractMeasurement.Builder.build()();
  swift_release();
  uint64_t result = swift_release();
  *(void *)(a1 + 16) = v9;
  return result;
}

uint64_t closure #2 in DistanceSplitModel.executePattern(wrapper:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(double *)(a1 + 24) = (double)*(uint64_t *)(a2 + 8);
  *(unsigned char *)(a1 + 32) = 0;
  if ((*(unsigned char *)(a2 + 32) & 1) == 0)
  {
    type metadata accessor for DialogDuration.Builder();
    swift_allocObject();
    DialogDuration.Builder.init()();
    dispatch thunk of DialogDuration.Builder.withSecs(_:)();
    swift_release();
    uint64_t v7 = dispatch thunk of DialogDuration.Builder.build()();
    swift_release();
    swift_release();
    *(void *)a1 = v7;
  }
  type metadata accessor for DialogDuration.Builder();
  swift_allocObject();
  DialogDuration.Builder.init()();
  dispatch thunk of DialogDuration.Builder.withSecs(_:)();
  swift_release();
  uint64_t v8 = dispatch thunk of DialogDuration.Builder.build()();
  swift_release();
  swift_release();
  *(void *)(a1 + 16) = v8;
  String.toDialogUnit.getter(*(void *)(a2 + 40), *(void *)(a2 + 48));
  String.toSpeakableString.getter();
  swift_bridgeObjectRelease();
  uint64_t v9 = type metadata accessor for SpeakableString();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v6, 0, 1, v9);
  uint64_t v10 = type metadata accessor for WorkoutVoiceFeedbackTransitionedNotableDistancePaceParameters(0);
  return outlined assign with take of SpeakableString?((uint64_t)v6, a1 + *(int *)(v10 + 32));
}

uint64_t protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance DistanceSplitModel(uint64_t a1)
{
  long long v4 = v1[1];
  *(_OWORD *)(v2 + 16) = *v1;
  *(_OWORD *)(v2 + 32) = v4;
  *(_OWORD *)(v2 + 48) = v1[2];
  *(_OWORD *)(v2 + 58) = *(_OWORD *)((char *)v1 + 42);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 80) = v5;
  *uint64_t v5 = v2;
  _OWORD v5[2] = a1;
  _OWORD v5[3] = v2 + 16;
  v5[1] = protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance DistanceSplitModel;
  return MEMORY[0x270FA2498](DistanceSplitModel.executePattern(wrapper:), 0, 0);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v7;
  uint64_t v8;

  uint64_t v7 = *v2;
  long long v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    long long v4 = a1;
  }
  return v5(v4);
}

uint64_t specialized DistanceSplitModel.init(with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v55 = 1;
  if (*(void *)(specialized Sequence.compactMap<A>(_:)(a1) + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<VoiceFeedbackKeys, Any>);
    uint64_t v8 = static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v8 = MEMORY[0x263F8EE80];
  }
  *(void *)&long long v56 = v8;
  uint64_t v9 = swift_bridgeObjectRetain();
  specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(v9, 1, &v56);
  swift_bridgeObjectRelease();
  uint64_t v10 = v56;
  uint64_t v11 = Logger.workout.unsafeMutableAddressor();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v11, v4);
  swift_retain_n();
  uint64_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v49 = swift_slowAlloc();
    *(void *)&long long v56 = v49;
    *(_DWORD *)uint64_t v14 = 136315394;
    uint64_t v52 = a2;
    uint64_t v50 = v4;
    uint64_t v53 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000012, 0x80000002619D90E0, (uint64_t *)&v56);
    uint64_t v51 = a1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v14 + 12) = 2080;
    uint64_t v48 = v14 + 14;
    lazy protocol witness table accessor for type VoiceFeedbackKeys and conformance VoiceFeedbackKeys();
    swift_retain();
    uint64_t v15 = Dictionary.description.getter();
    unint64_t v17 = v16;
    swift_release();
    uint64_t v53 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v17, (uint64_t *)&v56);
    a1 = v51;
    a2 = v52;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_261998000, v12, v13, "%s received VoiceFeedback dictionary: %s", (uint8_t *)v14, 0x16u);
    uint64_t v18 = v49;
    swift_arrayDestroy();
    MEMORY[0x263E47E50](v18, -1, -1);
    MEMORY[0x263E47E50](v14, -1, -1);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v50);
  }
  else
  {

    swift_release_n();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  if (!*(void *)(v10 + 16)) {
    goto LABEL_25;
  }
  unint64_t v19 = specialized __RawDictionaryStorage.find<A>(_:)(3);
  if ((v20 & 1) == 0) {
    goto LABEL_25;
  }
  outlined init with copy of Any(*(void *)(v10 + 56) + 32 * v19, (uint64_t)&v56);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_25;
  }
  if (!*(void *)(v10 + 16)) {
    goto LABEL_25;
  }
  uint64_t v21 = v53;
  unint64_t v22 = specialized __RawDictionaryStorage.find<A>(_:)(6);
  if ((v23 & 1) == 0) {
    goto LABEL_25;
  }
  outlined init with copy of Any(*(void *)(v10 + 56) + 32 * v22, (uint64_t)&v56);
  if ((swift_dynamicCast() & 1) != 0
    && *(void *)(v10 + 16)
    && (uint64_t v24 = v53, v25 = specialized __RawDictionaryStorage.find<A>(_:)(14), (v26 & 1) != 0)
    && (outlined init with copy of Any(*(void *)(v10 + 56) + 32 * v25, (uint64_t)&v56), (swift_dynamicCast() & 1) != 0)
    && *(void *)(v10 + 16)
    && (int v27 = v53, v28 = specialized __RawDictionaryStorage.find<A>(_:)(15), (v29 & 1) != 0)
    && (outlined init with copy of Any(*(void *)(v10 + 56) + 32 * v28, (uint64_t)&v56), (swift_dynamicCast() & 1) != 0))
  {
    uint64_t v30 = a1;
    uint64_t v31 = v10;
    uint64_t v32 = v54;
    if (!*(void *)(v31 + 16) || (uint64_t v33 = v53, v34 = specialized __RawDictionaryStorage.find<A>(_:)(12), (v35 & 1) == 0))
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t result = swift_release();
      goto LABEL_27;
    }
    outlined init with copy of Any(*(void *)(v31 + 56) + 32 * v34, (uint64_t)&v56);
    if (swift_dynamicCast())
    {
      uint64_t v36 = a2;
      if (v53)
      {
        if (v53 != 1)
        {
          swift_release();
          goto LABEL_45;
        }
        LODWORD(v52) = 1;
      }
      else
      {
        LODWORD(v52) = 0;
      }
      if (*(void *)(v31 + 16))
      {
        swift_bridgeObjectRetain();
        unint64_t v43 = specialized __RawDictionaryStorage.find<A>(_:)(2);
        if (v44)
        {
          outlined init with copy of Any(*(void *)(v31 + 56) + 32 * v43, (uint64_t)&v56);
        }
        else
        {
          long long v56 = 0u;
          long long v57 = 0u;
        }
      }
      else
      {
        long long v56 = 0u;
        long long v57 = 0u;
        swift_bridgeObjectRetain();
      }
      swift_release();
      if (*((void *)&v57 + 1))
      {
        if (swift_dynamicCast())
        {
          unsigned int v45 = 0;
          uint64_t v40 = v53;
          goto LABEL_46;
        }
      }
      else
      {
        outlined destroy of Any?((uint64_t)&v56, &demangling cache variable for type metadata for Any?);
      }
      uint64_t v40 = 0;
      unsigned int v45 = (v27 & v55);
      if ((v27 & 1) != 0 || !v55)
      {
LABEL_46:
        LOBYTE(v56) = 20;
        *((void *)&v56 + 1) = v21;
        *(void *)&long long v57 = v24;
        *((void *)&v57 + 1) = v40;
        char v58 = v45;
        uint64_t v59 = v33;
        uint64_t v60 = v32;
        char v61 = v52;
        char v62 = v27;
        swift_bridgeObjectRetain();
        BOOL v46 = specialized VoiceFeedbackAlerting.hasValidAlertType(in:)(v30);
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease_n();
        if (v46)
        {
          uint64_t v39 = v24;
          uint64_t v41 = v45;
          if (v27) {
            __int16 v47 = 256;
          }
          else {
            __int16 v47 = 0;
          }
          __int16 v42 = v47 | v52;
          uint64_t v38 = 20;
          goto LABEL_52;
        }
LABEL_51:
        uint64_t result = swift_bridgeObjectRelease();
        uint64_t v38 = 0;
        uint64_t v21 = 0;
        uint64_t v39 = 0;
        uint64_t v40 = 0;
        uint64_t v41 = 0;
        uint64_t v33 = 0;
        uint64_t v32 = 0;
        __int16 v42 = 0;
LABEL_52:
        a2 = v36;
        goto LABEL_28;
      }
      swift_bridgeObjectRelease();
LABEL_45:
      swift_bridgeObjectRelease();
      goto LABEL_51;
    }
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
LABEL_25:
    swift_release();
  }
  uint64_t result = swift_bridgeObjectRelease();
LABEL_27:
  uint64_t v38 = 0;
  uint64_t v21 = 0;
  uint64_t v39 = 0;
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  uint64_t v33 = 0;
  uint64_t v32 = 0;
  __int16 v42 = 0;
LABEL_28:
  *(void *)a2 = v38;
  *(void *)(a2 + 8) = v21;
  *(void *)(a2 + 16) = v39;
  *(void *)(a2 + 24) = v40;
  *(void *)(a2 + 32) = v41;
  *(void *)(a2 + 40) = v33;
  *(void *)(a2 + 48) = v32;
  *(_WORD *)(a2 + 56) = v42;
  return result;
}

uint64_t specialized static DistanceSplitModel.__derived_struct_equals(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (*a1 != *a2 || *((void *)a1 + 1) != *((void *)a2 + 1) || *((double *)a1 + 2) != *((double *)a2 + 2)) {
    goto LABEL_14;
  }
  char v4 = a2[32];
  if ((a1[32] & 1) == 0)
  {
    if (*((double *)a1 + 3) != *((double *)a2 + 3)) {
      char v4 = 1;
    }
    if ((v4 & 1) == 0) {
      goto LABEL_10;
    }
LABEL_14:
    char v4 = 0;
    return v4 & 1;
  }
  if (!a2[32]) {
    return v4 & 1;
  }
LABEL_10:
  if (*((void *)a1 + 5) == *((void *)a2 + 5) && *((void *)a1 + 6) == *((void *)a2 + 6)
    || (v5 = _stringCompareWithSmolCheck(_:_:expecting:)(), char v4 = 0, (v5 & 1) != 0))
  {
    if (a1[56] == a2[56])
    {
      char v4 = ((a1[57] & 1) == 0) ^ a2[57];
      return v4 & 1;
    }
    goto LABEL_14;
  }
  return v4 & 1;
}

unint64_t lazy protocol witness table accessor for type DistanceSplitModel.CodingKeys and conformance DistanceSplitModel.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type DistanceSplitModel.CodingKeys and conformance DistanceSplitModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type DistanceSplitModel.CodingKeys and conformance DistanceSplitModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DistanceSplitModel.CodingKeys and conformance DistanceSplitModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type DistanceSplitModel.CodingKeys and conformance DistanceSplitModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type DistanceSplitModel.CodingKeys and conformance DistanceSplitModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DistanceSplitModel.CodingKeys and conformance DistanceSplitModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type DistanceSplitModel.CodingKeys and conformance DistanceSplitModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type DistanceSplitModel.CodingKeys and conformance DistanceSplitModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DistanceSplitModel.CodingKeys and conformance DistanceSplitModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type DistanceSplitModel.CodingKeys and conformance DistanceSplitModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type DistanceSplitModel.CodingKeys and conformance DistanceSplitModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DistanceSplitModel.CodingKeys and conformance DistanceSplitModel.CodingKeys);
  }
  return result;
}

uint64_t specialized DistanceSplitModel.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x7079547472656C61 && a2 == 0xE900000000000065;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7865646E69 && a2 == 0xE500000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x647574696E67616DLL && a2 == 0xE900000000000065 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6E6F697461727564 && a2 == 0xE800000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 1953066613 && a2 == 0xE400000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6D726F4665636170 && a2 == 0xEA00000000007461 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x80000002619DBC80)
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

uint64_t specialized DistanceSplitModel.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<DistanceSplitModel.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type DistanceSplitModel.CodingKeys and conformance DistanceSplitModel.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  }
  char v33 = 0;
  lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  char v9 = v34;
  char v32 = 1;
  uint64_t v10 = KeyedDecodingContainer.decode(_:forKey:)();
  char v31 = 2;
  KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v12 = v11;
  char v30 = 3;
  uint64_t v13 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  int v24 = v14;
  uint64_t v25 = v13;
  char v29 = 4;
  uint64_t v15 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v17 = v16;
  uint64_t v22 = v15;
  char v27 = 5;
  lazy protocol witness table accessor for type VoiceFeedbackPaceFormat and conformance VoiceFeedbackPaceFormat();
  swift_bridgeObjectRetain();
  uint64_t v23 = v17;
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  int v21 = v28;
  char v26 = 6;
  LOBYTE(v17) = KeyedDecodingContainer.decode(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  uint64_t v18 = v23;
  uint64_t result = swift_bridgeObjectRelease();
  *(unsigned char *)a2 = v9;
  *(void *)(a2 + 8) = v10;
  *(void *)(a2 + 16) = v12;
  *(void *)(a2 + 24) = v25;
  *(unsigned char *)(a2 + 32) = v24 & 1;
  *(void *)(a2 + 40) = v22;
  *(void *)(a2 + 48) = v18;
  *(unsigned char *)(a2 + 56) = v21;
  *(unsigned char *)(a2 + 57) = v17 & 1;
  return result;
}

unint64_t instantiation function for generic protocol witness table for DistanceSplitModel(void *a1)
{
  a1[1] = lazy protocol witness table accessor for type DistanceSplitModel and conformance DistanceSplitModel();
  a1[2] = lazy protocol witness table accessor for type DistanceSplitModel and conformance DistanceSplitModel();
  unint64_t result = lazy protocol witness table accessor for type DistanceSplitModel and conformance DistanceSplitModel();
  a1[3] = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type DistanceSplitModel and conformance DistanceSplitModel()
{
  unint64_t result = lazy protocol witness table cache variable for type DistanceSplitModel and conformance DistanceSplitModel;
  if (!lazy protocol witness table cache variable for type DistanceSplitModel and conformance DistanceSplitModel)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DistanceSplitModel and conformance DistanceSplitModel);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type DistanceSplitModel and conformance DistanceSplitModel;
  if (!lazy protocol witness table cache variable for type DistanceSplitModel and conformance DistanceSplitModel)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DistanceSplitModel and conformance DistanceSplitModel);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type DistanceSplitModel and conformance DistanceSplitModel;
  if (!lazy protocol witness table cache variable for type DistanceSplitModel and conformance DistanceSplitModel)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DistanceSplitModel and conformance DistanceSplitModel);
  }
  return result;
}

uint64_t destroy for DistanceSplitModel()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for DistanceSplitModel(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v3 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v3;
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(unsigned char *)(a1 + 57) = *(unsigned char *)(a2 + 57);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DistanceSplitModel(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(unsigned char *)(a1 + 57) = *(unsigned char *)(a2 + 57);
  return a1;
}

__n128 __swift_memcpy58_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 42) = *(_OWORD *)(a2 + 42);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for DistanceSplitModel(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v4 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(unsigned char *)(a1 + 57) = *(unsigned char *)(a2 + 57);
  return a1;
}

uint64_t getEnumTagSinglePayload for DistanceSplitModel(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 58)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 48);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DistanceSplitModel(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 56) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 58) = 1;
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
      *(void *)(result + 48) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 58) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DistanceSplitModel()
{
  return &type metadata for DistanceSplitModel;
}

unsigned char *storeEnumTagSinglePayload for DistanceSplitModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2619A43FCLL);
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

void *type metadata accessor for DistanceSplitModel.CodingKeys()
{
  return &unk_270D9B138;
}

uint64_t outlined retain of DistanceSplitModel(uint64_t a1)
{
  return a1;
}

uint64_t outlined release of DistanceSplitModel(uint64_t a1)
{
  return a1;
}

uint64_t HalfwayGoalCompletionModel.alertType.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*HalfwayGoalCompletionModel.alertType.modify())()
{
  return closure #1 in default argument 1 of OutputGenerationManifest.init(dialogPhase:_:);
}

WorkoutAnnouncements::HalfwayGoalCompletionModel __swiftcall HalfwayGoalCompletionModel.init(magnitude:unit:)(Swift::Double magnitude, Swift::String unit)
{
  object = unit._object;
  uint64_t countAndFlagsBits = unit._countAndFlagsBits;
  WorkoutAnnouncements::VoiceFeedbackAlertType v4 = WorkoutAnnouncements_VoiceFeedbackAlertType_goalHalfwayPoint;
  result.magnitude = magnitude;
  result.unit._object = object;
  result.unit._uint64_t countAndFlagsBits = countAndFlagsBits;
  result.alertType = v4;
  return result;
}

uint64_t static HalfwayGoalCompletionModel.__derived_struct_equals(_:_:)(char a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, double a7, double a8)
{
  if (a1 != a4 || a7 != a8) {
    return 0;
  }
  if (a2 == a5 && a3 == a6) {
    return 1;
  }
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t HalfwayGoalCompletionModel.CodingKeys.stringValue.getter(char a1)
{
  return *(void *)&aAlerttypmagnit_0[8 * a1];
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance HalfwayGoalCompletionModel.CodingKeys()
{
  return HalfwayGoalCompletionModel.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance HalfwayGoalCompletionModel.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type HalfwayGoalCompletionModel.CodingKeys and conformance HalfwayGoalCompletionModel.CodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance HalfwayGoalCompletionModel.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type HalfwayGoalCompletionModel.CodingKeys and conformance HalfwayGoalCompletionModel.CodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t HalfwayGoalCompletionModel.encode(to:)(void *a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v12 = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<HalfwayGoalCompletionModel.CodingKeys>);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type HalfwayGoalCompletionModel.CodingKeys and conformance HalfwayGoalCompletionModel.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  char v16 = a2;
  char v15 = 0;
  lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v4)
  {
    char v14 = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
    char v13 = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

double HalfwayGoalCompletionModel.init(from:)(void *a1)
{
  return specialized HalfwayGoalCompletionModel.init(from:)(a1);
}

void protocol witness for Decodable.init(from:) in conformance HalfwayGoalCompletionModel(void *a1@<X0>, uint64_t a2@<X8>)
{
  double v7 = specialized HalfwayGoalCompletionModel.init(from:)(a1);
  if (!v2)
  {
    *(unsigned char *)a2 = v4;
    *(double *)(a2 + 8) = v7;
    *(void *)(a2 + 16) = v5;
    *(void *)(a2 + 24) = v6;
  }
}

uint64_t protocol witness for Encodable.encode(to:) in conformance HalfwayGoalCompletionModel(void *a1)
{
  return HalfwayGoalCompletionModel.encode(to:)(a1, *(unsigned char *)v1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance HalfwayGoalCompletionModel(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1[1];
  uint64_t v3 = v1[3];
  v2[4] = v1[2];
  v2[5] = v3;
  return MEMORY[0x270FA2498](protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance HalfwayGoalCompletionModel, 0, 0);
}

uint64_t protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance HalfwayGoalCompletionModel()
{
  uint64_t v1 = *__swift_project_boxed_opaque_existential_1(*(void **)(v0 + 16), *(void *)(*(void *)(v0 + 16) + 24));
  double v7 = (uint64_t (*)(char, uint64_t, uint64_t, uint64_t, double))((char *)&async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.goalHalfwayPoint(executeSashGroupOnWatch:_:)
                                                                       + async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.goalHalfwayPoint(executeSashGroupOnWatch:_:));
  swift_bridgeObjectRetain();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v2;
  *uint64_t v2 = v0;
  v2[1] = protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance GoalCompletionModel;
  uint64_t v3 = *(void *)(v0 + 32);
  uint64_t v4 = *(void *)(v0 + 40);
  double v5 = *(double *)(v0 + 24);
  return v7(0, v1, v3, v4, v5);
}

unint64_t lazy protocol witness table accessor for type HalfwayGoalCompletionModel.CodingKeys and conformance HalfwayGoalCompletionModel.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type HalfwayGoalCompletionModel.CodingKeys and conformance HalfwayGoalCompletionModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type HalfwayGoalCompletionModel.CodingKeys and conformance HalfwayGoalCompletionModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type HalfwayGoalCompletionModel.CodingKeys and conformance HalfwayGoalCompletionModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type HalfwayGoalCompletionModel.CodingKeys and conformance HalfwayGoalCompletionModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type HalfwayGoalCompletionModel.CodingKeys and conformance HalfwayGoalCompletionModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type HalfwayGoalCompletionModel.CodingKeys and conformance HalfwayGoalCompletionModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type HalfwayGoalCompletionModel.CodingKeys and conformance HalfwayGoalCompletionModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type HalfwayGoalCompletionModel.CodingKeys and conformance HalfwayGoalCompletionModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type HalfwayGoalCompletionModel.CodingKeys and conformance HalfwayGoalCompletionModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type HalfwayGoalCompletionModel.CodingKeys and conformance HalfwayGoalCompletionModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type HalfwayGoalCompletionModel.CodingKeys and conformance HalfwayGoalCompletionModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type HalfwayGoalCompletionModel.CodingKeys and conformance HalfwayGoalCompletionModel.CodingKeys);
  }
  return result;
}

uint64_t specialized HalfwayGoalCompletionModel.init(with:)(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v6 = (char *)v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)v41 - v7;
  if (*(void *)(specialized Sequence.compactMap<A>(_:)(a1) + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<VoiceFeedbackKeys, Any>);
    uint64_t v9 = static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v9 = MEMORY[0x263F8EE80];
  }
  *(void *)&long long v51 = v9;
  uint64_t v10 = swift_bridgeObjectRetain();
  specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(v10, 1, &v51);
  swift_bridgeObjectRelease();
  uint64_t v11 = v51;
  uint64_t v12 = Logger.workout.unsafeMutableAddressor();
  swift_beginAccess();
  unsigned int v45 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v45(v8, v12, v2);
  swift_retain_n();
  char v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.debug.getter();
  BOOL v15 = os_log_type_enabled(v13, v14);
  __int16 v47 = v6;
  if (v15)
  {
    uint64_t v16 = swift_slowAlloc();
    uint64_t v48 = v3;
    uint64_t v17 = v16;
    uint64_t v43 = swift_slowAlloc();
    *(void *)&long long v51 = v43;
    *(_DWORD *)uint64_t v17 = 136315394;
    uint64_t v46 = v2;
    v50[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000001ALL, 0x80000002619D92E0, (uint64_t *)&v51);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v17 + 12) = 2080;
    v41[1] = v17 + 14;
    lazy protocol witness table accessor for type VoiceFeedbackKeys and conformance VoiceFeedbackKeys();
    uint64_t v18 = a1;
    swift_retain();
    char v44 = (uint8_t *)v12;
    uint64_t v19 = Dictionary.description.getter();
    __int16 v42 = v8;
    unint64_t v21 = v20;
    swift_release();
    uint64_t v22 = v19;
    a1 = v18;
    uint64_t v2 = v46;
    v50[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v22, v21, (uint64_t *)&v51);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_261998000, v13, v14, "%s received VoiceFeedback dictionary: %s", (uint8_t *)v17, 0x16u);
    uint64_t v23 = v43;
    uint64_t v12 = (uint64_t)v44;
    swift_arrayDestroy();
    MEMORY[0x263E47E50](v23, -1, -1);
    uint64_t v24 = v17;
    uint64_t v3 = v48;
    MEMORY[0x263E47E50](v24, -1, -1);

    uint64_t v25 = *(void (**)(char *, uint64_t))(v3 + 8);
    v25(v42, v2);
  }
  else
  {

    swift_release_n();
    uint64_t v25 = *(void (**)(char *, uint64_t))(v3 + 8);
    v25(v8, v2);
  }
  if (*(void *)(v11 + 16)
    && (unint64_t v26 = specialized __RawDictionaryStorage.find<A>(_:)(6), (v27 & 1) != 0)
    && (outlined init with copy of Any(*(void *)(v11 + 56) + 32 * v26, (uint64_t)&v51), (swift_dynamicCast() & 1) != 0))
  {
    if (*(void *)(v11 + 16) && (unint64_t v28 = specialized __RawDictionaryStorage.find<A>(_:)(15), (v29 & 1) != 0))
    {
      outlined init with copy of Any(*(void *)(v11 + 56) + 32 * v28, (uint64_t)&v51);
    }
    else
    {
      long long v51 = 0u;
      long long v52 = 0u;
    }
    swift_release();
    if (!*((void *)&v52 + 1))
    {
      swift_bridgeObjectRelease();
      outlined destroy of Any?((uint64_t)&v51, &demangling cache variable for type metadata for Any?);
      return 0;
    }
    if (swift_dynamicCast())
    {
      uint64_t v48 = v3;
      uint64_t v31 = v50[0];
      unint64_t v32 = v50[1];
      swift_beginAccess();
      v45(v47, v12, v2);
      swift_bridgeObjectRetain_n();
      char v33 = Logger.logObject.getter();
      os_log_type_t v34 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v33, v34))
      {
        char v35 = (uint8_t *)swift_slowAlloc();
        uint64_t v36 = swift_slowAlloc();
        uint64_t v46 = v2;
        uint64_t v37 = v36;
        v50[0] = v36;
        unsigned int v45 = (void (*)(char *, uint64_t, uint64_t))a1;
        *(_DWORD *)char v35 = 136315138;
        char v44 = v35 + 4;
        swift_bridgeObjectRetain();
        uint64_t v49 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v31, v32, v50);
        a1 = (uint64_t)v45;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_261998000, v33, v34, "Value for unit: %s", v35, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x263E47E50](v37, -1, -1);
        MEMORY[0x263E47E50](v35, -1, -1);

        uint64_t v38 = v47;
        uint64_t v39 = v46;
      }
      else
      {

        swift_bridgeObjectRelease_n();
        uint64_t v38 = v47;
        uint64_t v39 = v2;
      }
      v25(v38, v39);
      swift_bridgeObjectRetain();
      char v40 = specialized VoiceFeedbackAlerting.hasValidAlertType(in:)(a1, 2);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v40) {
        return 2;
      }
    }
  }
  else
  {
    swift_release();
  }
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t specialized closure #1 in HalfwayGoalCompletionModel.executePattern(wrapper:)(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = String.toDialogUnit.getter(a2, a3);
  uint64_t v13 = v11;
  if (v12 == 115 && v11 == 0xE100000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    type metadata accessor for DialogDuration.Builder();
    swift_allocObject();
    DialogDuration.Builder.init()();
    dispatch thunk of DialogDuration.Builder.withSecs(_:)();
    swift_release();
    uint64_t v14 = dispatch thunk of DialogDuration.Builder.build()();
    swift_release();
    uint64_t result = swift_release();
    *(void *)a1 = v14;
  }
  else if (String.isDialogDistanceUnit.getter(v12, v13))
  {
    type metadata accessor for DialogLength.Builder();
    swift_allocObject();
    MEMORY[0x263E473C0]();
    dispatch thunk of DialogAbstractMeasurement.Builder.withValue(_:)();
    swift_release();
    String.toSpeakableString.getter();
    swift_bridgeObjectRelease();
    uint64_t v16 = type metadata accessor for SpeakableString();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v10, 0, 1, v16);
    dispatch thunk of DialogAbstractMeasurement.Builder.withUnits(_:)();
    swift_release();
    outlined destroy of Any?((uint64_t)v10, &demangling cache variable for type metadata for SpeakableString?);
    uint64_t v17 = dispatch thunk of DialogAbstractMeasurement.Builder.build()();
    swift_release();
    uint64_t result = swift_release();
    *(void *)(a1 + 16) = v17;
  }
  else
  {
    *(double *)(a1 + 24) = a4;
    *(unsigned char *)(a1 + 32) = 0;
    String.toSpeakableString.getter();
    swift_bridgeObjectRelease();
    uint64_t v18 = type metadata accessor for SpeakableString();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v10, 0, 1, v18);
    uint64_t v19 = type metadata accessor for WorkoutVoiceFeedbackGoalHalfwayPointParameters(0);
    return outlined assign with take of SpeakableString?((uint64_t)v10, a1 + *(int *)(v19 + 32));
  }
  return result;
}

double specialized HalfwayGoalCompletionModel.init(from:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<HalfwayGoalCompletionModel.CodingKeys>);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type HalfwayGoalCompletionModel.CodingKeys and conformance HalfwayGoalCompletionModel.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v1)
  {
    char v13 = 0;
    lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    char v12 = 1;
    KeyedDecodingContainer.decode(_:forKey:)();
    double v2 = v8;
    char v11 = 2;
    KeyedDecodingContainer.decode(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  return v2;
}

unint64_t instantiation function for generic protocol witness table for HalfwayGoalCompletionModel(void *a1)
{
  a1[1] = lazy protocol witness table accessor for type HalfwayGoalCompletionModel and conformance HalfwayGoalCompletionModel();
  a1[2] = lazy protocol witness table accessor for type HalfwayGoalCompletionModel and conformance HalfwayGoalCompletionModel();
  unint64_t result = lazy protocol witness table accessor for type HalfwayGoalCompletionModel and conformance HalfwayGoalCompletionModel();
  a1[3] = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type HalfwayGoalCompletionModel and conformance HalfwayGoalCompletionModel()
{
  unint64_t result = lazy protocol witness table cache variable for type HalfwayGoalCompletionModel and conformance HalfwayGoalCompletionModel;
  if (!lazy protocol witness table cache variable for type HalfwayGoalCompletionModel and conformance HalfwayGoalCompletionModel)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type HalfwayGoalCompletionModel and conformance HalfwayGoalCompletionModel);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type HalfwayGoalCompletionModel and conformance HalfwayGoalCompletionModel;
  if (!lazy protocol witness table cache variable for type HalfwayGoalCompletionModel and conformance HalfwayGoalCompletionModel)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type HalfwayGoalCompletionModel and conformance HalfwayGoalCompletionModel);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type HalfwayGoalCompletionModel and conformance HalfwayGoalCompletionModel;
  if (!lazy protocol witness table cache variable for type HalfwayGoalCompletionModel and conformance HalfwayGoalCompletionModel)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type HalfwayGoalCompletionModel and conformance HalfwayGoalCompletionModel);
  }
  return result;
}

ValueMetadata *type metadata accessor for HalfwayGoalCompletionModel()
{
  return &type metadata for HalfwayGoalCompletionModel;
}

unsigned char *storeEnumTagSinglePayload for HalfwayGoalCompletionModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2619A57A4);
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

void *type metadata accessor for HalfwayGoalCompletionModel.CodingKeys()
{
  return &unk_270D9B298;
}

uint64_t VoiceFeedbackAlertType.rawValue.getter(uint64_t result)
{
  return result;
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance VoiceFeedbackAlertType@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = specialized VoiceFeedbackAlertType.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance VoiceFeedbackAlertType(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t protocol witness for Decodable.init(from:) in conformance VoiceFeedbackAlertType()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t protocol witness for Encodable.encode(to:) in conformance VoiceFeedbackAlertType()
{
  return RawRepresentable<>.encode(to:)();
}

unint64_t specialized VoiceFeedbackAlertType.init(rawValue:)(unint64_t result)
{
  if (result >= 0x19) {
    return 25;
  }
  return result;
}

unint64_t instantiation function for generic protocol witness table for VoiceFeedbackAlertType(uint64_t a1)
{
  unint64_t result = lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for VoiceFeedbackAlertType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xE8) {
    goto LABEL_17;
  }
  if (a2 + 24 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 24) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 24;
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
      return (*a1 | (v4 << 8)) - 24;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 24;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x19;
  int v8 = v6 - 25;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for VoiceFeedbackAlertType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 24 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 24) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xE8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xE7)
  {
    unsigned int v6 = ((a2 - 232) >> 8) + 1;
    *unint64_t result = a2 + 24;
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
        JUMPOUT(0x2619A5C18);
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
          *unint64_t result = a2 + 24;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for VoiceFeedbackAlertType()
{
  return &type metadata for VoiceFeedbackAlertType;
}

uint64_t String.toDialogUnit.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = 1818321771;
  if ((a1 != 7102787 || a2 != 0xE300000000000000) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
  {
    uint64_t v4 = 0x7364726179;
    if ((a1 != 25721 || a2 != 0xE200000000000000) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v4 = 0x73726574656DLL;
      if ((a1 != 109 || a2 != 0xE100000000000000) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
      {
        uint64_t v4 = 0x6574656D6F6C696BLL;
        if ((a1 != 28011 || a2 != 0xE200000000000000) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
        {
          uint64_t v4 = 0x73656C696DLL;
          if ((a1 != 26989 || a2 != 0xE200000000000000) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
          {
            swift_bridgeObjectRetain();
            return a1;
          }
        }
      }
    }
  }
  return v4;
}

uint64_t String.isDialogDistanceUnit.getter(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2619D95C0;
  *(void *)(inited + 32) = 0xD000000000000012;
  *(void *)(inited + 40) = 0x80000002619DC010;
  *(void *)(inited + 48) = 0x74656D69746E6563;
  *(void *)(inited + 56) = 0xEB00000000737265;
  *(void *)(inited + 64) = 1952802150;
  *(void *)(inited + 72) = 0xE400000000000000;
  *(void *)(inited + 80) = 0x736568636E69;
  *(void *)(inited + 88) = 0xE600000000000000;
  *(void *)(inited + 96) = 0x6574656D6F6C696BLL;
  *(void *)(inited + 104) = 0xEA00000000007372;
  *(void *)(inited + 112) = 0x657920746867696CLL;
  *(void *)(inited + 120) = 0xEB00000000737261;
  *(void *)(inited + 128) = 0x73726574656DLL;
  *(void *)(inited + 136) = 0xE600000000000000;
  *(void *)(inited + 144) = 0x73656C696DLL;
  *(void *)(inited + 152) = 0xE500000000000000;
  *(void *)(inited + 160) = 0x74656D696C6C696DLL;
  *(void *)(inited + 168) = 0xEB00000000737265;
  strcpy((char *)(inited + 176), "nautical miles");
  *(unsigned char *)(inited + 191) = -18;
  *(void *)(inited + 192) = 0x7364726179;
  *(void *)(inited + 200) = 0xE500000000000000;
  LOBYTE(a2) = specialized Sequence<>.contains(_:)(a1, a2, (void *)inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  return a2 & 1;
}

uint64_t WorkoutReminderControlsFlow.on(input:)()
{
  return 1;
}

uint64_t WorkoutReminderControlsFlow.execute(completion:)()
{
  return Flow.deferToExecuteAsync(_:)();
}

unint64_t lazy protocol witness table accessor for type WorkoutReminderControlsFlow and conformance WorkoutReminderControlsFlow()
{
  unint64_t result = lazy protocol witness table cache variable for type WorkoutReminderControlsFlow and conformance WorkoutReminderControlsFlow;
  if (!lazy protocol witness table cache variable for type WorkoutReminderControlsFlow and conformance WorkoutReminderControlsFlow)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type WorkoutReminderControlsFlow and conformance WorkoutReminderControlsFlow);
  }
  return result;
}

uint64_t WorkoutReminderControlsFlow.execute()(uint64_t a1)
{
  v1[6] = a1;
  uint64_t v2 = type metadata accessor for Logger();
  v1[7] = v2;
  v1[8] = *(void *)(v2 - 8);
  v1[9] = swift_task_alloc();
  return MEMORY[0x270FA2498](WorkoutReminderControlsFlow.execute(), 0, 0);
}

uint64_t WorkoutReminderControlsFlow.execute()()
{
  uint64_t v18 = v0;
  uint64_t v2 = v0[8];
  uint64_t v1 = v0[9];
  uint64_t v3 = v0[7];
  uint64_t v4 = Logger.workout.unsafeMutableAddressor();
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v8 = v0[8];
    uint64_t v7 = v0[9];
    uint64_t v9 = v0[7];
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v17 = v11;
    *(_DWORD *)uint64_t v10 = 136315138;
    v0[5] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000001BLL, 0x80000002619D95B0, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&dword_261998000, v5, v6, "%s should only be called on Apple Watch", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x263E47E50](v11, -1, -1);
    MEMORY[0x263E47E50](v10, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  }
  else
  {
    uint64_t v13 = v0[8];
    uint64_t v12 = v0[9];
    uint64_t v14 = v0[7];

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  }
  static ExecuteResponse.complete()();
  swift_task_dealloc();
  BOOL v15 = (uint64_t (*)(void))v0[1];
  return v15();
}

uint64_t protocol witness for Flow.execute(completion:) in conformance WorkoutReminderControlsFlow()
{
  return Flow.deferToExecuteAsync(_:)();
}

uint64_t protocol witness for Flow.execute() in conformance WorkoutReminderControlsFlow(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = protocol witness for Flow.execute() in conformance VoiceFeedbackAnnouncementFlow;
  return WorkoutReminderControlsFlow.execute()(a1);
}

uint64_t destroy for WorkoutReminderControlsFlow()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeBufferWithCopyOfBuffer for WorkoutReminderControlsFlow(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for WorkoutReminderControlsFlow(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for WorkoutReminderControlsFlow(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for WorkoutReminderControlsFlow(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for WorkoutReminderControlsFlow(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WorkoutReminderControlsFlow()
{
  return &type metadata for WorkoutReminderControlsFlow;
}

uint64_t LapCompletionModel.alertType.getter()
{
  return *v0;
}

uint64_t LapCompletionModel.alertType.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*LapCompletionModel.alertType.modify())()
{
  return closure #1 in default argument 1 of OutputGenerationManifest.init(dialogPhase:_:);
}

void __swiftcall LapCompletionModel.init(index:paceMagnitude:unit:paceFormat:)(WorkoutAnnouncements::LapCompletionModel *__return_ptr retstr, Swift::Int index, Swift::Double paceMagnitude, Swift::String unit, WorkoutAnnouncements::VoiceFeedbackPaceFormat paceFormat)
{
  retstr->alertType = WorkoutAnnouncements_VoiceFeedbackAlertType_lapCompletion;
  retstr->index = index;
  retstr->magnitude = paceMagnitude;
  retstr->unit = unit;
  retstr->paceFormat = paceFormat & 1;
}

uint64_t LapCompletionModel.CodingKeys.stringValue.getter(char a1)
{
  return *(void *)&aAlerttypindex[8 * a1];
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance LapCompletionModel.CodingKeys()
{
  return LapCompletionModel.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance LapCompletionModel.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized LapCompletionModel.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance LapCompletionModel.CodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance LapCompletionModel.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type LapCompletionModel.CodingKeys and conformance LapCompletionModel.CodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance LapCompletionModel.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type LapCompletionModel.CodingKeys and conformance LapCompletionModel.CodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t LapCompletionModel.encode(to:)(void *a1)
{
  unint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<LapCompletionModel.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type LapCompletionModel.CodingKeys and conformance LapCompletionModel.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v10[15] = *v3;
  v10[14] = 0;
  lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v2)
  {
    v10[13] = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
    v10[12] = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
    v10[11] = 3;
    KeyedEncodingContainer.encode(_:forKey:)();
    v10[10] = v3[40];
    unsigned char v10[9] = 4;
    lazy protocol witness table accessor for type VoiceFeedbackPaceFormat and conformance VoiceFeedbackPaceFormat();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

double LapCompletionModel.init(from:)@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  specialized LapCompletionModel.init(from:)(a1, (uint64_t)&v6);
  if (!v2)
  {
    long long v5 = v7[0];
    *a2 = v6;
    a2[1] = v5;
    double result = *(double *)((char *)v7 + 9);
    *(_OWORD *)((char *)a2 + 25) = *(_OWORD *)((char *)v7 + 9);
  }
  return result;
}

double protocol witness for Decodable.init(from:) in conformance LapCompletionModel@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  specialized LapCompletionModel.init(from:)(a1, (uint64_t)&v6);
  if (!v2)
  {
    long long v5 = v7[0];
    *a2 = v6;
    a2[1] = v5;
    double result = *(double *)((char *)v7 + 9);
    *(_OWORD *)((char *)a2 + 25) = *(_OWORD *)((char *)v7 + 9);
  }
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance LapCompletionModel(void *a1)
{
  return LapCompletionModel.encode(to:)(a1);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance LapCompletionModel(long long *a1, long long *a2)
{
  long long v2 = a1[1];
  long long v5 = *a1;
  v6[0] = v2;
  *(_OWORD *)((char *)v6 + 9) = *(long long *)((char *)a1 + 25);
  long long v3 = a2[1];
  long long v7 = *a2;
  v8[0] = v3;
  *(_OWORD *)((char *)v8 + 9) = *(long long *)((char *)a2 + 25);
  return specialized static LapCompletionModel.__derived_struct_equals(_:_:)((unsigned __int8 *)&v5, (unsigned __int8 *)&v7) & 1;
}

uint64_t LapCompletionModel.executePattern(wrapper:)(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x270FA2498](LapCompletionModel.executePattern(wrapper:), 0, 0);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v8;
  uint64_t v9;

  int v4 = *(void *)(*v2 + 24);
  uint64_t v8 = *v2;
  swift_task_dealloc();
  long long v5 = outlined release of LapCompletionModel(v4);
  long long v6 = *(uint64_t (**)(uint64_t))(v8 + 8);
  if (!v1) {
    long long v5 = a1;
  }
  return v6(v5);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v8;
  uint64_t v9;

  int v4 = *(void *)(*v2 + 24);
  uint64_t v8 = *v2;
  swift_task_dealloc();
  long long v5 = outlined release of LapCompletionModel(v4);
  long long v6 = *(uint64_t (**)(uint64_t))(v8 + 8);
  if (!v1) {
    long long v5 = a1;
  }
  return v6(v5);
}

uint64_t LapCompletionModel.executePattern(wrapper:)()
{
  char v1 = *(unsigned char *)(*(void *)(v0 + 24) + 40);
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 16), *(void *)(*(void *)(v0 + 16) + 24));
  long long v3 = *(void **)(v0 + 24);
  if (v1)
  {
    uint64_t v5 = v3[3];
    uint64_t v4 = v3[4];
    uint64_t v6 = *v2;
    unint64_t v7 = v3[2];
    uint64_t v8 = v3[1];
    outlined retain of LapCompletionModel((uint64_t)v3);
    BOOL v15 = (char *)&async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.lapCompletionPace(executeSashGroupOnWatch:_:)
        + async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.lapCompletionPace(executeSashGroupOnWatch:_:);
    uint64_t v9 = (void *)swift_task_alloc();
    *(void *)(v0 + 40) = v9;
    *uint64_t v9 = v0;
    v9[1] = LapCompletionModel.executePattern(wrapper:);
    v10.n128_u64[0] = v7;
    return ((uint64_t (*)(void, uint64_t, uint64_t, uint64_t, uint64_t, __n128))v15)(0, v6, v8, v5, v4, v10);
  }
  else
  {
    uint64_t v12 = *v2;
    outlined retain of LapCompletionModel((uint64_t)v3);
    uint64_t v16 = (char *)&async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.lapCompletionSpeed(executeSashGroupOnWatch:_:)
        + async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.lapCompletionSpeed(executeSashGroupOnWatch:_:);
    uint64_t v13 = (void *)swift_task_alloc();
    *(void *)(v0 + 32) = v13;
    *uint64_t v13 = v0;
    v13[1] = LapCompletionModel.executePattern(wrapper:);
    uint64_t v14 = *(void *)(v0 + 24);
    return ((uint64_t (*)(void, uint64_t, uint64_t))v16)(0, v12, v14);
  }
}

uint64_t protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance LapCompletionModel(uint64_t a1)
{
  long long v4 = v1[1];
  *(_OWORD *)(v2 + 16) = *v1;
  *(_OWORD *)(v2 + 32) = v4;
  *(_OWORD *)(v2 + 41) = *(_OWORD *)((char *)v1 + 25);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 64) = v5;
  *uint64_t v5 = v2;
  _OWORD v5[2] = a1;
  _OWORD v5[3] = v2 + 16;
  v5[1] = protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance LapCompletionModel;
  return MEMORY[0x270FA2498](LapCompletionModel.executePattern(wrapper:), 0, 0);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v7;
  uint64_t v8;

  uint64_t v7 = *v2;
  long long v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    long long v4 = a1;
  }
  return v5(v4);
}

uint64_t specialized LapCompletionModel.init(with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(specialized Sequence.compactMap<A>(_:)(a1) + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<VoiceFeedbackKeys, Any>);
    uint64_t v8 = static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v8 = MEMORY[0x263F8EE80];
  }
  *(void *)&long long v43 = v8;
  uint64_t v9 = swift_bridgeObjectRetain();
  specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(v9, 1, &v43);
  swift_bridgeObjectRelease();
  uint64_t v10 = v43;
  uint64_t v11 = Logger.workout.unsafeMutableAddressor();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v11, v4);
  swift_retain_n();
  uint64_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v38 = swift_slowAlloc();
    *(void *)&long long v43 = v38;
    *(_DWORD *)uint64_t v14 = 136315394;
    uint64_t v40 = a1;
    uint64_t v41 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000012, 0x80000002619D9720, (uint64_t *)&v43);
    uint64_t v39 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v14 + 12) = 2080;
    v36[1] = v14 + 14;
    lazy protocol witness table accessor for type VoiceFeedbackKeys and conformance VoiceFeedbackKeys();
    uint64_t v37 = v4;
    swift_retain();
    uint64_t v15 = Dictionary.description.getter();
    uint64_t v16 = a2;
    unint64_t v18 = v17;
    swift_release();
    uint64_t v41 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v18, (uint64_t *)&v43);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    a2 = v16;
    a1 = v40;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_261998000, v12, v13, "%s received VoiceFeedback dictionary: %s", (uint8_t *)v14, 0x16u);
    uint64_t v19 = v38;
    swift_arrayDestroy();
    MEMORY[0x263E47E50](v19, -1, -1);
    MEMORY[0x263E47E50](v14, -1, -1);

    (*(void (**)(char *, uint64_t))(v39 + 8))(v7, v37);
    if (!*(void *)(v10 + 16)) {
      goto LABEL_19;
    }
LABEL_8:
    unint64_t v20 = specialized __RawDictionaryStorage.find<A>(_:)(6);
    if ((v21 & 1) == 0) {
      goto LABEL_19;
    }
    outlined init with copy of Any(*(void *)(v10 + 56) + 32 * v20, (uint64_t)&v43);
    if ((swift_dynamicCast() & 1) == 0) {
      goto LABEL_19;
    }
    if (!*(void *)(v10 + 16)) {
      goto LABEL_19;
    }
    uint64_t v22 = v41;
    unint64_t v23 = specialized __RawDictionaryStorage.find<A>(_:)(15);
    if ((v24 & 1) == 0) {
      goto LABEL_19;
    }
    outlined init with copy of Any(*(void *)(v10 + 56) + 32 * v23, (uint64_t)&v43);
    if ((swift_dynamicCast() & 1) == 0) {
      goto LABEL_19;
    }
    uint64_t v25 = v42;
    if (!*(void *)(v10 + 16) || (uint64_t v26 = v41, v27 = specialized __RawDictionaryStorage.find<A>(_:)(3), (v28 & 1) == 0))
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t result = swift_release();
      goto LABEL_21;
    }
    outlined init with copy of Any(*(void *)(v10 + 56) + 32 * v27, (uint64_t)&v43);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_release();
      swift_bridgeObjectRelease();
      goto LABEL_20;
    }
    uint64_t v29 = v41;
    if (*(void *)(v10 + 16) && (unint64_t v30 = specialized __RawDictionaryStorage.find<A>(_:)(12), (v31 & 1) != 0))
    {
      outlined init with copy of Any(*(void *)(v10 + 56) + 32 * v30, (uint64_t)&v43);
    }
    else
    {
      long long v43 = 0u;
      long long v44 = 0u;
    }
    swift_release();
    if (*((void *)&v44 + 1))
    {
      if (swift_dynamicCast())
      {
        if (!v41)
        {
          char v34 = 0;
LABEL_35:
          swift_bridgeObjectRetain();
          char v35 = specialized VoiceFeedbackAlerting.hasValidAlertType(in:)(a1, 5);
          swift_bridgeObjectRelease();
          uint64_t result = swift_bridgeObjectRelease();
          if (v35)
          {
            uint64_t v33 = 5;
            goto LABEL_22;
          }
          goto LABEL_20;
        }
        if (v41 == 1)
        {
          char v34 = 1;
          goto LABEL_35;
        }
      }
    }
    else
    {
      outlined destroy of Any?((uint64_t)&v43);
    }
    swift_bridgeObjectRelease();
    goto LABEL_20;
  }

  swift_release_n();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (*(void *)(v10 + 16)) {
    goto LABEL_8;
  }
LABEL_19:
  swift_release();
LABEL_20:
  uint64_t result = swift_bridgeObjectRelease();
LABEL_21:
  uint64_t v33 = 0;
  uint64_t v29 = 0;
  uint64_t v22 = 0;
  uint64_t v26 = 0;
  uint64_t v25 = 0;
  char v34 = 0;
LABEL_22:
  *(void *)a2 = v33;
  *(void *)(a2 + 8) = v29;
  *(void *)(a2 + 16) = v22;
  *(void *)(a2 + 24) = v26;
  *(void *)(a2 + 32) = v25;
  *(unsigned char *)(a2 + 40) = v34;
  return result;
}

uint64_t specialized static LapCompletionModel.__derived_struct_equals(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (*a1 == *a2 && *((void *)a1 + 1) == *((void *)a2 + 1) && *((double *)a1 + 2) == *((double *)a2 + 2))
  {
    BOOL v4 = *((void *)a1 + 3) == *((void *)a2 + 3) && *((void *)a1 + 4) == *((void *)a2 + 4);
    if (v4 || (v5 = _stringCompareWithSmolCheck(_:_:expecting:)(), char v6 = 0, (v5 & 1) != 0)) {
      char v6 = a1[40] ^ a2[40] ^ 1;
    }
  }
  else
  {
    char v6 = 0;
  }
  return v6 & 1;
}

unint64_t lazy protocol witness table accessor for type LapCompletionModel.CodingKeys and conformance LapCompletionModel.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type LapCompletionModel.CodingKeys and conformance LapCompletionModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type LapCompletionModel.CodingKeys and conformance LapCompletionModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LapCompletionModel.CodingKeys and conformance LapCompletionModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type LapCompletionModel.CodingKeys and conformance LapCompletionModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type LapCompletionModel.CodingKeys and conformance LapCompletionModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LapCompletionModel.CodingKeys and conformance LapCompletionModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type LapCompletionModel.CodingKeys and conformance LapCompletionModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type LapCompletionModel.CodingKeys and conformance LapCompletionModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LapCompletionModel.CodingKeys and conformance LapCompletionModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type LapCompletionModel.CodingKeys and conformance LapCompletionModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type LapCompletionModel.CodingKeys and conformance LapCompletionModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LapCompletionModel.CodingKeys and conformance LapCompletionModel.CodingKeys);
  }
  return result;
}

uint64_t specialized LapCompletionModel.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x7079547472656C61 && a2 == 0xE900000000000065;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7865646E69 && a2 == 0xE500000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x647574696E67616DLL && a2 == 0xE900000000000065 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 1953066613 && a2 == 0xE400000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6D726F4665636170 && a2 == 0xEA00000000007461)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t specialized LapCompletionModel.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<LapCompletionModel.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type LapCompletionModel.CodingKeys and conformance LapCompletionModel.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  }
  char v26 = 0;
  lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  char v9 = v27;
  char v25 = 1;
  uint64_t v10 = KeyedDecodingContainer.decode(_:forKey:)();
  char v24 = 2;
  KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v12 = v11;
  char v23 = 3;
  uint64_t v13 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v15 = v14;
  uint64_t v19 = v13;
  char v21 = 4;
  lazy protocol witness table accessor for type VoiceFeedbackPaceFormat and conformance VoiceFeedbackPaceFormat();
  uint64_t v20 = v15;
  swift_bridgeObjectRetain();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  LOBYTE(v15) = v22;
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  uint64_t v16 = v20;
  uint64_t result = swift_bridgeObjectRelease();
  *(unsigned char *)a2 = v9;
  *(void *)(a2 + 8) = v10;
  *(void *)(a2 + 16) = v12;
  *(void *)(a2 + 24) = v19;
  *(void *)(a2 + 32) = v16;
  *(unsigned char *)(a2 + 40) = v15;
  return result;
}

unint64_t instantiation function for generic protocol witness table for LapCompletionModel(void *a1)
{
  a1[1] = lazy protocol witness table accessor for type LapCompletionModel and conformance LapCompletionModel();
  a1[2] = lazy protocol witness table accessor for type LapCompletionModel and conformance LapCompletionModel();
  unint64_t result = lazy protocol witness table accessor for type LapCompletionModel and conformance LapCompletionModel();
  a1[3] = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type LapCompletionModel and conformance LapCompletionModel()
{
  unint64_t result = lazy protocol witness table cache variable for type LapCompletionModel and conformance LapCompletionModel;
  if (!lazy protocol witness table cache variable for type LapCompletionModel and conformance LapCompletionModel)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LapCompletionModel and conformance LapCompletionModel);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type LapCompletionModel and conformance LapCompletionModel;
  if (!lazy protocol witness table cache variable for type LapCompletionModel and conformance LapCompletionModel)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LapCompletionModel and conformance LapCompletionModel);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type LapCompletionModel and conformance LapCompletionModel;
  if (!lazy protocol witness table cache variable for type LapCompletionModel and conformance LapCompletionModel)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LapCompletionModel and conformance LapCompletionModel);
  }
  return result;
}

uint64_t destroy for LapCompletionModel()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for LapCompletionModel(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v3;
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for LapCompletionModel(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  return a1;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for LapCompletionModel(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for LapCompletionModel(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 41)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LapCompletionModel(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 41) = 1;
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
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 41) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LapCompletionModel()
{
  return &type metadata for LapCompletionModel;
}

uint64_t getEnumTagSinglePayload for LapCompletionModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for LapCompletionModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 4;
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
        JUMPOUT(0x2619A7F0CLL);
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
          *__n128 result = a2 + 4;
        break;
    }
  }
  return result;
}

void *type metadata accessor for LapCompletionModel.CodingKeys()
{
  return &unk_270D9B528;
}

uint64_t outlined retain of LapCompletionModel(uint64_t a1)
{
  return a1;
}

uint64_t outlined release of LapCompletionModel(uint64_t a1)
{
  return a1;
}

uint64_t outlined destroy of Any?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t WorkoutReminderAnnouncementFlow.__allocating_init(flowConfig:deviceResolutionService:)(long long *a1, long long *a2)
{
  uint64_t v4 = swift_allocObject();
  type metadata accessor for WorkoutReminderAnnouncementFlow.State(0);
  swift_storeEnumTagMultiPayload();
  outlined init with take of VoiceFeedbackPatternResolving(a1, v4 + OBJC_IVAR____TtC20WorkoutAnnouncements31WorkoutReminderAnnouncementFlow_flowConfig);
  outlined init with take of VoiceFeedbackPatternResolving(a2, v4 + OBJC_IVAR____TtC20WorkoutAnnouncements31WorkoutReminderAnnouncementFlow_deviceResolutionService);
  return v4;
}

uint64_t WorkoutReminderAnnouncementFlow.init(flowConfig:deviceResolutionService:)(long long *a1, long long *a2)
{
  type metadata accessor for WorkoutReminderAnnouncementFlow.State(0);
  swift_storeEnumTagMultiPayload();
  outlined init with take of VoiceFeedbackPatternResolving(a1, v2 + OBJC_IVAR____TtC20WorkoutAnnouncements31WorkoutReminderAnnouncementFlow_flowConfig);
  outlined init with take of VoiceFeedbackPatternResolving(a2, v2 + OBJC_IVAR____TtC20WorkoutAnnouncements31WorkoutReminderAnnouncementFlow_deviceResolutionService);
  return v2;
}

uint64_t type metadata accessor for WorkoutReminderAnnouncementFlow.State(uint64_t a1)
{
  return type metadata accessor for WorkoutReminderAnnouncementFlow.State(a1, (uint64_t *)&type metadata singleton initialization cache for WorkoutReminderAnnouncementFlow.State);
}

uint64_t WorkoutReminderAnnouncementFlow.on(input:)()
{
  uint64_t v25 = type metadata accessor for WorkoutReminderAnnouncementFlow.State(0);
  uint64_t v0 = MEMORY[0x270FA5388](v25);
  uint64_t v2 = (char *)&v24 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v0);
  uint64_t v4 = (_OWORD *)((char *)&v24 - v3);
  uint64_t v5 = type metadata accessor for Parse();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Parse.DirectInvocation();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v24 - v14;
  Input.parse.getter();
  if ((*(unsigned int (**)(char *, uint64_t))(v6 + 88))(v8, v5) != *MEMORY[0x263F6FF70])
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return 0;
  }
  (*(void (**)(char *, uint64_t))(v6 + 96))(v8, v5);
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v15, v8, v9);
  uint64_t v16 = Parse.DirectInvocation.identifier.getter();
  uint64_t v18 = v17;
  if (one-time initialization token for identifier != -1) {
    swift_once();
  }
  if (v16 == static WorkoutReminderAnnouncementDirectInvocation.identifier && v18 == *(void *)algn_26A9426A8)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v20 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v20 & 1) == 0)
    {
      (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
      return 0;
    }
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
  specialized WorkoutReminderAnnouncementDirectInvocation.init(directInvocation:)((uint64_t)v13, v27);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
  outlined init with take of BelowTargetZoneModel?((uint64_t)v27, (uint64_t)v28, &demangling cache variable for type metadata for WorkoutReminderAnnouncementDirectInvocation?);
  if (*(void *)&v28[0])
  {
    long long v21 = v28[1];
    *uint64_t v4 = v28[0];
    v4[1] = v21;
    v4[2] = v28[2];
    swift_storeEnumTagMultiPayload();
    outlined init with take of WorkoutReminderAnnouncementFlow.State((uint64_t)v4, (uint64_t)v2);
    uint64_t v22 = v26 + OBJC_IVAR____TtC20WorkoutAnnouncements31WorkoutReminderAnnouncementFlow_state;
    swift_beginAccess();
    outlined assign with take of WorkoutReminderAnnouncementFlow.State((uint64_t)v2, v22);
    swift_endAccess();
    return 1;
  }
  return 0;
}

uint64_t WorkoutReminderAnnouncementFlow.execute(completion:)()
{
  return Flow.deferToExecuteAsync(_:)();
}

uint64_t WorkoutReminderAnnouncementFlow.execute()(uint64_t a1)
{
  v2[33] = a1;
  v2[34] = v1;
  v2[35] = *v1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PromptResult<WorkoutReminderControlsDirectInvocation.Action>);
  v2[36] = v3;
  v2[37] = *(void *)(v3 - 8);
  v2[38] = swift_task_alloc();
  type metadata accessor for CATOption();
  v2[39] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for Logger();
  v2[40] = v4;
  v2[41] = *(void *)(v4 - 8);
  v2[42] = swift_task_alloc();
  v2[43] = swift_task_alloc();
  v2[44] = type metadata accessor for WorkoutReminderAnnouncementFlow.State(0);
  v2[45] = swift_task_alloc();
  return MEMORY[0x270FA2498](WorkoutReminderAnnouncementFlow.execute(), 0, 0);
}

{
  uint64_t v1;
  uint64_t v3;

  *(void *)(*(void *)v1 + 392) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](WorkoutReminderAnnouncementFlow.execute(), 0, 0);
}

uint64_t WorkoutReminderAnnouncementFlow.execute()()
{
  uint64_t v69 = v0;
  uint64_t v1 = *(void *)(v0 + 360);
  uint64_t v2 = *(void *)(v0 + 272) + OBJC_IVAR____TtC20WorkoutAnnouncements31WorkoutReminderAnnouncementFlow_state;
  swift_beginAccess();
  outlined init with copy of WorkoutReminderAnnouncementFlow.State(v2, v1);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v4 = *(void *)(v0 + 360);
      uint64_t v6 = *(void *)(v0 + 296);
      uint64_t v5 = *(void *)(v0 + 304);
      uint64_t v7 = *(void *)(v0 + 288);
      int v8 = (uint64_t *)(v4
                     + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (PromptResult<WorkoutReminderControlsDirectInvocation.Action>, to: WorkoutReminderAnnouncementDirectInvocation))
                              + 48));
      uint64_t v9 = *v8;
      *(void *)(v0 + 368) = *v8;
      *(void *)(v0 + 376) = v8[2];
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v5, v4, v7);
      uint64_t v66 = (uint64_t (*)(uint64_t, uint64_t))((char *)&async function pointer to specialized WorkoutReminderAnnouncementFlow.handleResponse(_:to:)
                                                     + async function pointer to specialized WorkoutReminderAnnouncementFlow.handleResponse(_:to:));
      uint64_t v10 = (void *)swift_task_alloc();
      *(void *)(v0 + 384) = v10;
      *uint64_t v10 = v0;
      v10[1] = WorkoutReminderAnnouncementFlow.execute();
      uint64_t v11 = *(void *)(v0 + 304);
      return v66(v11, v9);
    }
    uint64_t v27 = *(void *)(v0 + 344);
    uint64_t v28 = *(void *)(v0 + 320);
    uint64_t v29 = *(void *)(v0 + 328);
    uint64_t v30 = Logger.workout.unsafeMutableAddressor();
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 16))(v27, v30, v28);
    char v31 = Logger.logObject.getter();
    os_log_type_t v32 = static os_log_type_t.error.getter();
    BOOL v33 = os_log_type_enabled(v31, v32);
    uint64_t v34 = *(void *)(v0 + 344);
    uint64_t v35 = *(void *)(v0 + 320);
    uint64_t v36 = *(void *)(v0 + 328);
    if (v33)
    {
      uint64_t v37 = swift_slowAlloc();
      uint64_t v38 = swift_slowAlloc();
      *(_DWORD *)uint64_t v37 = 136315394;
      v68[0] = v38;
      uint64_t v39 = _typeName(_:qualified:)();
      *(void *)(v0 + 248) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v39, v40, v68);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v37 + 12) = 2080;
      uint64_t v41 = _typeName(_:qualified:)();
      *(void *)(v0 + 256) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v41, v42, v68);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_261998000, v31, v32, "%s.execute() called before %s.on(input:) returned true", (uint8_t *)v37, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x263E47E50](v38, -1, -1);
      MEMORY[0x263E47E50](v37, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v34, v35);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v34, v35);
    }
    static ExecuteResponse.complete()();
  }
  else
  {
    uint64_t v64 = v0 + 64;
    uint64_t v65 = (long long *)(v0 + 16);
    uint64_t v13 = *(_OWORD **)(v0 + 360);
    uint64_t v14 = *(void *)(v0 + 328);
    uint64_t v15 = *(void *)(v0 + 336);
    uint64_t v16 = *(void *)(v0 + 320);
    long long v18 = v13[1];
    long long v17 = v13[2];
    *(_OWORD *)(v0 + 16) = *v13;
    *(_OWORD *)(v0 + 32) = v18;
    *(_OWORD *)(v0 + 48) = v17;
    uint64_t v19 = Logger.workout.unsafeMutableAddressor();
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v15, v19, v16);
    char v20 = *(void **)(v0 + 16);
    outlined init with take of BelowTargetZoneModel?(v0 + 24, v0 + 216, &demangling cache variable for type metadata for String?);
    long long v21 = v20;
    uint64_t v67 = v0 + 216;
    outlined retain of String?(v0 + 216);
    uint64_t v22 = Logger.logObject.getter();
    os_log_type_t v23 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      uint64_t v25 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v24 = 138412290;
      *(void *)(v0 + 232) = v21;
      uint64_t v26 = v21;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v25 = v21;

      outlined release of String?(v67);
      _os_log_impl(&dword_261998000, v22, v23, "Making an annoucement for %@", v24, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      MEMORY[0x263E47E50](v25, -1, -1);
      MEMORY[0x263E47E50](v24, -1, -1);
    }
    else
    {

      outlined release of String?(v67);
      uint64_t v22 = v21;
    }
    uint64_t v44 = *(void *)(v0 + 328);
    uint64_t v43 = *(void *)(v0 + 336);
    uint64_t v45 = *(void *)(v0 + 320);
    uint64_t v63 = *(void *)(v0 + 272);

    (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v43, v45);
    uint64_t v46 = type metadata accessor for WorkoutRemindersCATPatternsExecutor();
    char v62 = v21;
    outlined retain of String?(v67);
    static CATOption.defaultMode.getter();
    uint64_t v47 = CATWrapper.__allocating_init(options:globals:)();
    uint64_t v48 = type metadata accessor for ResponseFactory();
    swift_allocObject();
    uint64_t v49 = ResponseFactory.init()();
    uint64_t v50 = MEMORY[0x263F6FB30];
    *(void *)(v0 + 128) = v48;
    *(void *)(v0 + 136) = v50;
    *(void *)(v0 + 104) = v49;
    *(void *)(v0 + 88) = v46;
    *(void *)(v0 + 96) = &protocol witness table for WorkoutRemindersCATPatternsExecutor;
    *(void *)(v0 + 64) = v47;
    type metadata accessor for WorkoutReminderPromptStrategy();
    uint64_t v51 = swift_allocObject();
    uint64_t v52 = __swift_mutable_project_boxed_opaque_existential_1(v64, v46);
    uint64_t v53 = *(void *)(v46 - 8);
    uint64_t v54 = (uint64_t *)swift_task_alloc();
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v53 + 16))(v54, v52, v46);
    uint64_t v55 = *v54;
    *(void *)(v51 + 88) = v46;
    *(void *)(v51 + 96) = &protocol witness table for WorkoutRemindersCATPatternsExecutor;
    *(void *)(v51 + 64) = v55;
    long long v56 = *(_OWORD *)(v0 + 48);
    long long v57 = *v65;
    *(_OWORD *)(v51 + 32) = *(_OWORD *)(v0 + 32);
    *(_OWORD *)(v51 + 48) = v56;
    *(_OWORD *)(v51 + 16) = v57;
    outlined init with take of VoiceFeedbackPatternResolving((long long *)(v0 + 104), v51 + 104);
    __swift_destroy_boxed_opaque_existential_1Tm(v64);
    swift_task_dealloc();
    static OutputPublisherFactory.makeOutputPublisherAsync()();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PromptForValueFlowAsync<WorkoutReminderControlsDirectInvocation.Action>);
    swift_allocObject();
    lazy protocol witness table accessor for type WorkoutReminderAnnouncementFlow and conformance WorkoutReminderAnnouncementFlow(&lazy protocol witness table cache variable for type WorkoutReminderPromptStrategy and conformance WorkoutReminderPromptStrategy, (void (*)(uint64_t))type metadata accessor for WorkoutReminderPromptStrategy);
    *(void *)(v0 + 240) = PromptForValueFlowAsync.init<A>(strategy:outputPublisher:)();
    uint64_t v58 = swift_allocObject();
    *(void *)(v58 + 16) = v63;
    long long v59 = *(_OWORD *)(v0 + 32);
    *(_OWORD *)(v58 + 24) = *v65;
    *(_OWORD *)(v58 + 40) = v59;
    *(_OWORD *)(v58 + 56) = *(_OWORD *)(v0 + 48);
    uint64_t v60 = v62;
    outlined retain of String?(v67);
    lazy protocol witness table accessor for type PromptForValueFlowAsync<WorkoutReminderControlsDirectInvocation.Action> and conformance PromptForValueFlowAsync<A>(&lazy protocol witness table cache variable for type PromptForValueFlowAsync<WorkoutReminderControlsDirectInvocation.Action> and conformance PromptForValueFlowAsync<A>, &demangling cache variable for type metadata for PromptForValueFlowAsync<WorkoutReminderControlsDirectInvocation.Action>);
    swift_retain();
    static ExecuteResponse.replan<A>(next:childCompletion:)();

    outlined release of String?(v67);
    swift_release();
    swift_release();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  char v61 = *(uint64_t (**)(void))(v0 + 8);
  return v61();
}

{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);
  uint64_t v7;

  uint64_t v1 = (void *)v0[46];
  uint64_t v3 = v0[37];
  uint64_t v2 = v0[38];
  uint64_t v4 = v0[36];
  if (v0[49])
  {
    static ExecuteResponse.complete(next:)();
    swift_release();
  }
  else
  {
    static ExecuteResponse.complete()();
  }

  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t closure #1 in WorkoutReminderAnnouncementFlow.execute()(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  uint64_t v6 = type metadata accessor for WorkoutReminderAnnouncementFlow.State(0);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = v20 - v10 + 16;
  uint64_t v12 = v20
      + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (PromptResult<WorkoutReminderControlsDirectInvocation.Action>, to: WorkoutReminderAnnouncementDirectInvocation))
               + 48)
      + -8 * v10
      + 16;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PromptResult<WorkoutReminderControlsDirectInvocation.Action>);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16))(v11, a1, v13);
  long long v14 = a3[1];
  _OWORD *v12 = *a3;
  v12[1] = v14;
  v12[2] = a3[2];
  swift_storeEnumTagMultiPayload();
  outlined init with take of WorkoutReminderAnnouncementFlow.State((uint64_t)v11, (uint64_t)v9);
  uint64_t v15 = a2 + OBJC_IVAR____TtC20WorkoutAnnouncements31WorkoutReminderAnnouncementFlow_state;
  swift_beginAccess();
  uint64_t v16 = *(void **)a3;
  outlined init with take of BelowTargetZoneModel?((uint64_t)a3 + 8, (uint64_t)v20, &demangling cache variable for type metadata for String?);
  id v17 = v16;
  outlined retain of String?((uint64_t)v20);
  outlined assign with take of WorkoutReminderAnnouncementFlow.State((uint64_t)v9, v15);
  return swift_endAccess();
}

uint64_t closure #1 in WorkoutReminderAnnouncementFlow.handleResponseForRemoteControl(_:to:)(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<SABaseCommand, SubmitCommandError>);
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)v20 - v6;
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = Logger.workout.unsafeMutableAddressor();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
  outlined init with copy of Result<SABaseCommand, SubmitCommandError>(a1, (uint64_t)v7);
  uint64_t v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v21 = v8;
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    uint64_t v23 = v16;
    *(_DWORD *)uint64_t v15 = 136315138;
    v20[1] = v15 + 4;
    outlined init with copy of Result<SABaseCommand, SubmitCommandError>((uint64_t)v7, (uint64_t)v5);
    uint64_t v17 = String.init<A>(describing:)();
    uint64_t v22 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v17, v18, &v23);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    outlined destroy of Result<SABaseCommand, SubmitCommandError>((uint64_t)v7);
    _os_log_impl(&dword_261998000, v13, v14, "Received response from sending startLocalRequest: %s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x263E47E50](v16, -1, -1);
    MEMORY[0x263E47E50](v15, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v21);
  }
  else
  {
    outlined destroy of Result<SABaseCommand, SubmitCommandError>((uint64_t)v7);

    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
}

uint64_t WorkoutReminderAnnouncementFlow.findRemoteIfAvailable()()
{
  v1[7] = v0;
  uint64_t v2 = type metadata accessor for DeviceIdiom();
  v1[8] = v2;
  v1[9] = *(void *)(v2 - 8);
  v1[10] = swift_task_alloc();
  return MEMORY[0x270FA2498](WorkoutReminderAnnouncementFlow.findRemoteIfAvailable(), 0, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v6;

  uint64_t v1 = v0[7];
  (*(void (**)(void, void, void))(v0[9] + 104))(v0[10], *MEMORY[0x263F75648], v0[8]);
  uint64_t v2 = v1 + OBJC_IVAR____TtC20WorkoutAnnouncements31WorkoutReminderAnnouncementFlow_deviceResolutionService;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[11] = v3;
  *uint64_t v3 = v0;
  v3[1] = WorkoutReminderAnnouncementFlow.findRemoteIfAvailable();
  uint64_t v4 = v0[10];
  return MEMORY[0x270F31B38](v4, v2);
}

{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t (*v3)(void);
  uint64_t v5;

  uint64_t v1 = v0[12];
  if (v1)
  {
    static AceService.currentAsync.getter();
    uint64_t v2 = (void *)swift_task_alloc();
    v0[13] = v2;
    *uint64_t v2 = v0;
    v2[1] = WorkoutReminderAnnouncementFlow.findRemoteIfAvailable();
    return MEMORY[0x270F31B48](v1, v0 + 2);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v3 = (uint64_t (*)(void))v0[1];
    return v3(0);
  }
}

{
  uint64_t v0;
  void *v1;
  uint64_t (*v2)(void *);
  uint64_t v4;

  uint64_t v1 = *(void **)(v0 + 96);
  if ((*(unsigned char *)(v0 + 112) & 1) == 0)
  {

    uint64_t v1 = 0;
  }
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void *))(v0 + 8);
  return v2(v1);
}

uint64_t WorkoutReminderAnnouncementFlow.findRemoteIfAvailable()(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 80);
  uint64_t v3 = *(void *)(*(void *)v1 + 72);
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  *(void *)(*(void *)v1 + 96) = a1;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  return MEMORY[0x270FA2498](WorkoutReminderAnnouncementFlow.findRemoteIfAvailable(), 0, 0);
}

uint64_t WorkoutReminderAnnouncementFlow.findRemoteIfAvailable()(char a1)
{
  uint64_t v2 = *(void *)v1 + 16;
  *(unsigned char *)(*(void *)v1 + 112) = a1;
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1Tm(v2);
  return MEMORY[0x270FA2498](WorkoutReminderAnnouncementFlow.findRemoteIfAvailable(), 0, 0);
}

uint64_t WorkoutReminderAnnouncementFlow.deinit()
{
  outlined destroy of WorkoutReminderAnnouncementFlow.State(v0 + OBJC_IVAR____TtC20WorkoutAnnouncements31WorkoutReminderAnnouncementFlow_state);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + OBJC_IVAR____TtC20WorkoutAnnouncements31WorkoutReminderAnnouncementFlow_flowConfig);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + OBJC_IVAR____TtC20WorkoutAnnouncements31WorkoutReminderAnnouncementFlow_deviceResolutionService);
  return v0;
}

uint64_t WorkoutReminderAnnouncementFlow.__deallocating_deinit()
{
  outlined destroy of WorkoutReminderAnnouncementFlow.State(v0 + OBJC_IVAR____TtC20WorkoutAnnouncements31WorkoutReminderAnnouncementFlow_state);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + OBJC_IVAR____TtC20WorkoutAnnouncements31WorkoutReminderAnnouncementFlow_flowConfig);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + OBJC_IVAR____TtC20WorkoutAnnouncements31WorkoutReminderAnnouncementFlow_deviceResolutionService);
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t protocol witness for Flow.on(input:) in conformance WorkoutReminderAnnouncementFlow()
{
  return WorkoutReminderAnnouncementFlow.on(input:)() & 1;
}

uint64_t protocol witness for Flow.execute(completion:) in conformance WorkoutReminderAnnouncementFlow()
{
  return Flow.deferToExecuteAsync(_:)();
}

uint64_t protocol witness for Flow.execute() in conformance WorkoutReminderAnnouncementFlow(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = protocol witness for Flow.execute() in conformance VoiceFeedbackAnnouncementFlow;
  return WorkoutReminderAnnouncementFlow.execute()(a1);
}

uint64_t protocol witness for Flow.exitValue.getter in conformance WorkoutReminderAnnouncementFlow(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for WorkoutReminderAnnouncementFlow(0);
  return MEMORY[0x270F66CE8](v3, a2);
}

uint64_t outlined init with take of WorkoutReminderAnnouncementFlow.State(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for WorkoutReminderAnnouncementFlow.State(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t outlined assign with take of WorkoutReminderAnnouncementFlow.State(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for WorkoutReminderAnnouncementFlow.State(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for WorkoutReminderAnnouncementFlow(uint64_t a1)
{
  return type metadata accessor for WorkoutReminderAnnouncementFlow.State(a1, (uint64_t *)&type metadata singleton initialization cache for WorkoutReminderAnnouncementFlow);
}

uint64_t type metadata accessor for WorkoutReminderAnnouncementFlow.State(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t outlined init with copy of WorkoutReminderAnnouncementFlow.State(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for WorkoutReminderAnnouncementFlow.State(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t specialized WorkoutReminderAnnouncementFlow.workoutConfirmationResponseFlow(response:to:)(char a1, uint64_t a2)
{
  *(void *)(v2 + 192) = a2;
  *(unsigned char *)(v2 + 376) = a1;
  type metadata accessor for DialogPhase();
  *(void *)(v2 + 200) = swift_task_alloc();
  uint64_t v3 = type metadata accessor for OutputGenerationManifest();
  *(void *)(v2 + 208) = v3;
  *(void *)(v2 + 216) = *(void *)(v3 - 8);
  *(void *)(v2 + 224) = swift_task_alloc();
  uint64_t v4 = type metadata accessor for Logger();
  *(void *)(v2 + 232) = v4;
  *(void *)(v2 + 240) = *(void *)(v4 - 8);
  *(void *)(v2 + 248) = swift_task_alloc();
  *(void *)(v2 + 256) = swift_task_alloc();
  *(void *)(v2 + 264) = swift_task_alloc();
  type metadata accessor for CATOption();
  *(void *)(v2 + 272) = swift_task_alloc();
  return MEMORY[0x270FA2498](specialized WorkoutReminderAnnouncementFlow.workoutConfirmationResponseFlow(response:to:), 0, 0);
}

uint64_t specialized WorkoutReminderAnnouncementFlow.workoutConfirmationResponseFlow(response:to:)()
{
  uint64_t v45 = v0;
  switch(*(unsigned char *)(v0 + 376))
  {
    case 1:
    case 2:
    case 3:
      char v1 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if (v1) {
        goto LABEL_4;
      }
      uint64_t v7 = *(void *)(v0 + 256);
      uint64_t v8 = *(void *)(v0 + 232);
      uint64_t v9 = *(void *)(v0 + 240);
      uint64_t v10 = Logger.workout.unsafeMutableAddressor();
      swift_beginAccess();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v7, v10, v8);
      uint64_t v11 = Logger.logObject.getter();
      os_log_type_t v12 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v11, v12))
      {
        uint64_t v13 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v13 = 0;
        _os_log_impl(&dword_261998000, v11, v12, "User did not accept, no dialog will be spoken", v13, 2u);
        MEMORY[0x263E47E50](v13, -1, -1);
      }
      uint64_t v14 = *(void *)(v0 + 256);
      uint64_t v15 = *(void *)(v0 + 232);
      uint64_t v16 = *(void *)(v0 + 240);

      (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v14, v15);
      goto LABEL_22;
    default:
      swift_bridgeObjectRelease();
LABEL_4:
      id v2 = objc_msgSend(*(id *)(v0 + 192), sel_predictionType);
      if (v2 == (id)3)
      {
        type metadata accessor for WorkoutRemindersCATPatternsExecutor();
        static CATOption.defaultMode.getter();
        *(void *)(v0 + 344) = CATWrapper.__allocating_init(options:globals:)();
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
        uint64_t v3 = swift_allocObject();
        *(void *)(v3 + 32) = 0xD000000000000017;
        *(void *)(v3 + 40) = 0x80000002619DC0D0;
        *(void *)(v3 + 72) = MEMORY[0x263F8D4F8];
        unint64_t v42 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x263F6D050]
                                                                                  + MEMORY[0x263F6D050]);
        *(void *)(v0 + 352) = v3;
        *(_OWORD *)(v3 + 16) = xmmword_2619D98D0;
        *(unsigned char *)(v3 + 48) = 0;
        uint64_t v17 = (void *)swift_task_alloc();
        *(void *)(v0 + 360) = v17;
        *uint64_t v17 = v0;
        v17[1] = specialized WorkoutReminderAnnouncementFlow.workoutConfirmationResponseFlow(response:to:);
        unint64_t v5 = 0xD000000000000026;
        uint64_t v6 = "workoutReminders#acceptedResumeWorkout";
        goto LABEL_13;
      }
      if (v2 == (id)2)
      {
        type metadata accessor for WorkoutRemindersCATPatternsExecutor();
        static CATOption.defaultMode.getter();
        *(void *)(v0 + 312) = CATWrapper.__allocating_init(options:globals:)();
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
        uint64_t v3 = swift_allocObject();
        *(void *)(v3 + 32) = 0xD000000000000017;
        *(void *)(v3 + 40) = 0x80000002619DC0D0;
        *(void *)(v3 + 72) = MEMORY[0x263F8D4F8];
        unint64_t v42 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x263F6D050]
                                                                                  + MEMORY[0x263F6D050]);
        *(void *)(v0 + 320) = v3;
        *(_OWORD *)(v3 + 16) = xmmword_2619D98D0;
        *(unsigned char *)(v3 + 48) = 0;
        unint64_t v18 = (void *)swift_task_alloc();
        *(void *)(v0 + 328) = v18;
        *unint64_t v18 = v0;
        v18[1] = specialized WorkoutReminderAnnouncementFlow.workoutConfirmationResponseFlow(response:to:);
        unint64_t v5 = 0xD000000000000023;
        uint64_t v6 = "workoutReminders#acceptedEndWorkout";
        goto LABEL_13;
      }
      if (v2 == (id)1)
      {
        type metadata accessor for WorkoutRemindersCATPatternsExecutor();
        static CATOption.defaultMode.getter();
        *(void *)(v0 + 280) = CATWrapper.__allocating_init(options:globals:)();
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
        uint64_t v3 = swift_allocObject();
        *(void *)(v3 + 32) = 0xD000000000000017;
        *(void *)(v3 + 40) = 0x80000002619DC0D0;
        *(void *)(v3 + 72) = MEMORY[0x263F8D4F8];
        unint64_t v42 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x263F6D050]
                                                                                  + MEMORY[0x263F6D050]);
        *(void *)(v0 + 288) = v3;
        *(_OWORD *)(v3 + 16) = xmmword_2619D98D0;
        *(unsigned char *)(v3 + 48) = 0;
        uint64_t v4 = (void *)swift_task_alloc();
        *(void *)(v0 + 296) = v4;
        *uint64_t v4 = v0;
        v4[1] = specialized WorkoutReminderAnnouncementFlow.workoutConfirmationResponseFlow(response:to:);
        unint64_t v5 = 0xD000000000000025;
        uint64_t v6 = "workoutReminders#acceptedStartWorkout";
LABEL_13:
        return v42(v5, (unint64_t)(v6 - 32) | 0x8000000000000000, v3);
      }
      objc_msgSend(*(id *)(v0 + 192), sel_predictionType);
      id v20 = (id)AFWorkoutPredictionTypeGetName();
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v43 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v23 = v22;
      }
      else
      {
        unint64_t v23 = 0xE90000000000003ELL;
        uint64_t v43 = 0x4E574F4E4B4E553CLL;
      }
      uint64_t v24 = *(void *)(v0 + 264);
      uint64_t v25 = *(void *)(v0 + 232);
      uint64_t v26 = *(void *)(v0 + 240);
      id v27 = objc_msgSend(*(id *)(v0 + 192), sel_predictionIdentifier);
      uint64_t v41 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v29 = v28;

      uint64_t v30 = Logger.workout.unsafeMutableAddressor();
      swift_beginAccess();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 16))(v24, v30, v25);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      char v31 = Logger.logObject.getter();
      os_log_type_t v32 = static os_log_type_t.error.getter();
      BOOL v33 = os_log_type_enabled(v31, v32);
      uint64_t v34 = *(void *)(v0 + 264);
      uint64_t v36 = *(void *)(v0 + 232);
      uint64_t v35 = *(void *)(v0 + 240);
      if (v33)
      {
        uint64_t v40 = *(void *)(v0 + 232);
        uint64_t v37 = swift_slowAlloc();
        uint64_t v39 = swift_slowAlloc();
        uint64_t v44 = v39;
        *(_DWORD *)uint64_t v37 = 136315394;
        swift_bridgeObjectRetain();
        *(void *)(v0 + 168) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v43, v23, &v44);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v37 + 12) = 2080;
        swift_bridgeObjectRetain();
        *(void *)(v0 + 160) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v41, v29, &v44);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_261998000, v31, v32, "Unknown workout reminder prediction type %s for prediction id %s", (uint8_t *)v37, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x263E47E50](v39, -1, -1);
        MEMORY[0x263E47E50](v37, -1, -1);

        (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v34, v40);
      }
      else
      {
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();

        (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v34, v36);
      }
LABEL_22:
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v38 = *(uint64_t (**)(void))(v0 + 8);
      return v38(0);
  }
}

{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v8;

  char v1 = (void *)v0[12];
  uint64_t v3 = v0[27];
  id v2 = v0[28];
  uint64_t v4 = v0[26];
  static DialogPhase.completion.getter();
  OutputGenerationManifest.init(dialogPhase:_:)();
  OutputGenerationManifest.canUseServerTTS.setter();
  static OutputPublisherFactory.makeOutputPublisherAsync()();
  type metadata accessor for ResponseFactory();
  swift_allocObject();
  ResponseFactory.init()();
  type metadata accessor for PatternFlowProvider();
  swift_allocObject();
  v0[23] = PatternFlowProvider.init(outputPublisher:responseGenerator:)();
  unint64_t v5 = PatternFlowProviding.makeResponseFlow(patternExecutionResult:outputGenerationManifest:)();

  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(uint64_t))v0[1];
  return v6(v5);
}

{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t (*v14)(void);
  uint64_t v16;

  char v1 = (void *)v0[38];
  uint64_t v3 = v0[30];
  id v2 = v0[31];
  uint64_t v4 = v0[29];
  swift_bridgeObjectRelease();
  swift_release();
  unint64_t v5 = Logger.workout.unsafeMutableAddressor();
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  uint64_t v6 = v1;
  uint64_t v7 = v1;
  uint64_t v8 = Logger.logObject.getter();
  uint64_t v9 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 138412290;
    os_log_type_t v12 = v1;
    uint64_t v13 = _swift_stdlib_bridgeErrorToNSError();
    v0[22] = v13;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v11 = v13;
    MEMORY[0x263E47CC0](v1);
    MEMORY[0x263E47CC0](v1);
    _os_log_impl(&dword_261998000, v8, v9, "Failed to create accept start/end workout pattern: %@", v10, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x263E47E50](v11, -1, -1);
    MEMORY[0x263E47E50](v10, -1, -1);

    MEMORY[0x263E47CC0](v1);
  }
  else
  {
    MEMORY[0x263E47CC0](v1);
    MEMORY[0x263E47CC0](v1);
    MEMORY[0x263E47CC0](v1);
  }
  (*(void (**)(void, void))(v0[30] + 8))(v0[31], v0[29]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14(0);
}

{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v8;

  char v1 = (void *)v0[15];
  uint64_t v3 = v0[27];
  id v2 = v0[28];
  uint64_t v4 = v0[26];
  static DialogPhase.completion.getter();
  OutputGenerationManifest.init(dialogPhase:_:)();
  OutputGenerationManifest.canUseServerTTS.setter();
  static OutputPublisherFactory.makeOutputPublisherAsync()();
  type metadata accessor for ResponseFactory();
  swift_allocObject();
  ResponseFactory.init()();
  type metadata accessor for PatternFlowProvider();
  swift_allocObject();
  v0[23] = PatternFlowProvider.init(outputPublisher:responseGenerator:)();
  unint64_t v5 = PatternFlowProviding.makeResponseFlow(patternExecutionResult:outputGenerationManifest:)();

  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(uint64_t))v0[1];
  return v6(v5);
}

{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t (*v14)(void);
  uint64_t v16;

  char v1 = (void *)v0[42];
  uint64_t v3 = v0[30];
  id v2 = v0[31];
  uint64_t v4 = v0[29];
  swift_bridgeObjectRelease();
  swift_release();
  unint64_t v5 = Logger.workout.unsafeMutableAddressor();
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  uint64_t v6 = v1;
  uint64_t v7 = v1;
  uint64_t v8 = Logger.logObject.getter();
  uint64_t v9 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 138412290;
    os_log_type_t v12 = v1;
    uint64_t v13 = _swift_stdlib_bridgeErrorToNSError();
    v0[22] = v13;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v11 = v13;
    MEMORY[0x263E47CC0](v1);
    MEMORY[0x263E47CC0](v1);
    _os_log_impl(&dword_261998000, v8, v9, "Failed to create accept start/end workout pattern: %@", v10, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x263E47E50](v11, -1, -1);
    MEMORY[0x263E47E50](v10, -1, -1);

    MEMORY[0x263E47CC0](v1);
  }
  else
  {
    MEMORY[0x263E47CC0](v1);
    MEMORY[0x263E47CC0](v1);
    MEMORY[0x263E47CC0](v1);
  }
  (*(void (**)(void, void))(v0[30] + 8))(v0[31], v0[29]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14(0);
}

{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v8;

  char v1 = (void *)v0[18];
  uint64_t v3 = v0[27];
  id v2 = v0[28];
  uint64_t v4 = v0[26];
  static DialogPhase.completion.getter();
  OutputGenerationManifest.init(dialogPhase:_:)();
  OutputGenerationManifest.canUseServerTTS.setter();
  static OutputPublisherFactory.makeOutputPublisherAsync()();
  type metadata accessor for ResponseFactory();
  swift_allocObject();
  ResponseFactory.init()();
  type metadata accessor for PatternFlowProvider();
  swift_allocObject();
  v0[23] = PatternFlowProvider.init(outputPublisher:responseGenerator:)();
  unint64_t v5 = PatternFlowProviding.makeResponseFlow(patternExecutionResult:outputGenerationManifest:)();

  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(uint64_t))v0[1];
  return v6(v5);
}

{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t (*v14)(void);
  uint64_t v16;

  char v1 = (void *)v0[46];
  uint64_t v3 = v0[30];
  id v2 = v0[31];
  uint64_t v4 = v0[29];
  swift_bridgeObjectRelease();
  swift_release();
  unint64_t v5 = Logger.workout.unsafeMutableAddressor();
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  uint64_t v6 = v1;
  uint64_t v7 = v1;
  uint64_t v8 = Logger.logObject.getter();
  uint64_t v9 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 138412290;
    os_log_type_t v12 = v1;
    uint64_t v13 = _swift_stdlib_bridgeErrorToNSError();
    v0[22] = v13;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v11 = v13;
    MEMORY[0x263E47CC0](v1);
    MEMORY[0x263E47CC0](v1);
    _os_log_impl(&dword_261998000, v8, v9, "Failed to create accept start/end workout pattern: %@", v10, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x263E47E50](v11, -1, -1);
    MEMORY[0x263E47E50](v10, -1, -1);

    MEMORY[0x263E47CC0](v1);
  }
  else
  {
    MEMORY[0x263E47CC0](v1);
    MEMORY[0x263E47CC0](v1);
    MEMORY[0x263E47CC0](v1);
  }
  (*(void (**)(void, void))(v0[30] + 8))(v0[31], v0[29]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14(0);
}

uint64_t specialized WorkoutReminderAnnouncementFlow.workoutConfirmationResponseFlow(response:to:)(uint64_t a1)
{
  uint64_t v3 = (void *)*v2;
  v3[11] = v2;
  v3[12] = a1;
  v3[13] = v1;
  v3[38] = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = specialized WorkoutReminderAnnouncementFlow.workoutConfirmationResponseFlow(response:to:);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v4 = specialized WorkoutReminderAnnouncementFlow.workoutConfirmationResponseFlow(response:to:);
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t (*v4)();
  uint64_t v6;

  uint64_t v3 = (void *)*v2;
  v3[14] = v2;
  v3[15] = a1;
  v3[16] = v1;
  v3[42] = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = specialized WorkoutReminderAnnouncementFlow.workoutConfirmationResponseFlow(response:to:);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v4 = specialized WorkoutReminderAnnouncementFlow.workoutConfirmationResponseFlow(response:to:);
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t (*v4)();
  uint64_t v6;

  uint64_t v3 = (void *)*v2;
  v3[17] = v2;
  v3[18] = a1;
  v3[19] = v1;
  v3[46] = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = specialized WorkoutReminderAnnouncementFlow.workoutConfirmationResponseFlow(response:to:);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v4 = specialized WorkoutReminderAnnouncementFlow.workoutConfirmationResponseFlow(response:to:);
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t specialized WorkoutReminderAnnouncementFlow.handleResponseForLocalControl(_:to:)(char a1, uint64_t a2)
{
  *(void *)(v3 + 120) = a2;
  *(void *)(v3 + 128) = v2;
  *(unsigned char *)(v3 + 184) = a1;
  *(void *)(v3 + 136) = *v2;
  uint64_t v4 = type metadata accessor for Logger();
  *(void *)(v3 + 144) = v4;
  *(void *)(v3 + 152) = *(void *)(v4 - 8);
  *(void *)(v3 + 160) = swift_task_alloc();
  return MEMORY[0x270FA2498](specialized WorkoutReminderAnnouncementFlow.handleResponseForLocalControl(_:to:), 0, 0);
}

uint64_t specialized WorkoutReminderAnnouncementFlow.handleResponseForLocalControl(_:to:)()
{
  uint64_t v27 = v0;
  uint64_t v1 = (void *)(*(void *)(v0 + 128)
                + OBJC_IVAR____TtC20WorkoutAnnouncements31WorkoutReminderAnnouncementFlow_flowConfig);
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v3);
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), *(void *)(v0 + 40));
  char v4 = dispatch thunk of DeviceState.isWatch.getter();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  if (v4)
  {
    uint64_t v24 = (uint64_t (*)(char, uint64_t))((char *)&async function pointer to specialized WorkoutReminderAnnouncementFlow.workoutConfirmationResponseFlow(response:to:)
                                                + async function pointer to specialized WorkoutReminderAnnouncementFlow.workoutConfirmationResponseFlow(response:to:));
    unint64_t v5 = (void *)swift_task_alloc();
    *(void *)(v0 + 168) = v5;
    *unint64_t v5 = v0;
    v5[1] = specialized WorkoutReminderAnnouncementFlow.handleResponseForLocalControl(_:to:);
    uint64_t v6 = *(void *)(v0 + 120);
    char v7 = *(unsigned char *)(v0 + 184);
    return v24(v7, v6);
  }
  else
  {
    uint64_t v10 = *(void *)(v0 + 152);
    uint64_t v9 = *(void *)(v0 + 160);
    uint64_t v11 = *(void *)(v0 + 144);
    uint64_t v12 = Logger.workout.unsafeMutableAddressor();
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v9, v12, v11);
    uint64_t v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.error.getter();
    BOOL v15 = os_log_type_enabled(v13, v14);
    uint64_t v16 = *(void *)(v0 + 152);
    uint64_t v17 = *(void *)(v0 + 160);
    uint64_t v18 = *(void *)(v0 + 144);
    if (v15)
    {
      uint64_t v25 = *(void *)(v0 + 160);
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      uint64_t v26 = v20;
      *(_DWORD *)uint64_t v19 = 136315138;
      uint64_t v21 = _typeName(_:qualified:)();
      *(void *)(v0 + 104) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v21, v22, &v26);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_261998000, v13, v14, "%s.handleResponseForLocalControl should only be called from a watch", v19, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x263E47E50](v20, -1, -1);
      MEMORY[0x263E47E50](v19, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v25, v18);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v17, v18);
    }
    swift_task_dealloc();
    unint64_t v23 = *(uint64_t (**)(void))(v0 + 8);
    return v23(0);
  }
}

{
  uint64_t v0;
  uint64_t v1;
  char v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  uint64_t v13;

  uint64_t v1 = *(void *)(v0 + 176);
  uint64_t v2 = *(unsigned char *)(v0 + 184);
  uint64_t v3 = objc_msgSend(*(id *)(v0 + 120), sel_predictionIdentifier);
  char v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;

  *(unsigned char *)(v0 + 80) = v2;
  *(void *)(v0 + 88) = v4;
  *(void *)(v0 + 96) = v6;
  lazy protocol witness table accessor for type WorkoutReminderControlsFlow and conformance WorkoutReminderControlsFlow();
  char v7 = Flow.eraseToAnyFlow()();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v8 = *(void *)(v0 + 176);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
    uint64_t v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_2619D98E0;
    *(void *)(v9 + 32) = v8;
    *(void *)(v9 + 40) = v7;
    specialized Array._endMutation()();
    type metadata accessor for SequenceFlow();
    swift_allocObject();
    swift_retain();
    swift_retain();
    *(void *)(v0 + 112) = SequenceFlow.init(with:)();
    lazy protocol witness table accessor for type WorkoutReminderAnnouncementFlow and conformance WorkoutReminderAnnouncementFlow(&lazy protocol witness table cache variable for type SequenceFlow and conformance SequenceFlow, MEMORY[0x263F434F8]);
    uint64_t v10 = Flow.eraseToAnyFlow()();
    swift_release();
    swift_release();
    swift_release();
    char v7 = v10;
  }
  swift_task_dealloc();
  uint64_t v11 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v11(v7);
}

uint64_t specialized WorkoutReminderAnnouncementFlow.handleResponseForLocalControl(_:to:)(uint64_t a1)
{
  *(void *)(*(void *)v1 + 176) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](specialized WorkoutReminderAnnouncementFlow.handleResponseForLocalControl(_:to:), 0, 0);
}

uint64_t specialized WorkoutReminderAnnouncementFlow.handleResponseForRemoteControl(_:to:)(char a1, uint64_t a2)
{
  *(void *)(v3 + 232) = a2;
  *(void *)(v3 + 240) = v2;
  *(unsigned char *)(v3 + 344) = a1;
  *(void *)(v3 + 248) = *v2;
  uint64_t v4 = type metadata accessor for Logger();
  *(void *)(v3 + 256) = v4;
  *(void *)(v3 + 264) = *(void *)(v4 - 8);
  *(void *)(v3 + 272) = swift_task_alloc();
  *(void *)(v3 + 280) = swift_task_alloc();
  *(void *)(v3 + 288) = swift_task_alloc();
  return MEMORY[0x270FA2498](specialized WorkoutReminderAnnouncementFlow.handleResponseForRemoteControl(_:to:), 0, 0);
}

uint64_t specialized WorkoutReminderAnnouncementFlow.handleResponseForRemoteControl(_:to:)()
{
  uint64_t v32 = v0;
  uint64_t v1 = *(void *)(v0 + 240);
  uint64_t v2 = OBJC_IVAR____TtC20WorkoutAnnouncements31WorkoutReminderAnnouncementFlow_flowConfig;
  *(void *)(v0 + 296) = OBJC_IVAR____TtC20WorkoutAnnouncements31WorkoutReminderAnnouncementFlow_flowConfig;
  uint64_t v3 = (void *)(v1 + v2);
  uint64_t v4 = *(void *)(v1 + v2 + 24);
  uint64_t v5 = *(void *)(v1 + v2 + 32);
  __swift_project_boxed_opaque_existential_1((void *)(v1 + v2), v4);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v5);
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), *(void *)(v0 + 40));
  char v6 = dispatch thunk of DeviceState.isWatch.getter();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  if (v6)
  {
    uint64_t v7 = *(void *)(v0 + 288);
    uint64_t v8 = *(void *)(v0 + 256);
    uint64_t v9 = *(void *)(v0 + 264);
    uint64_t v10 = Logger.workout.unsafeMutableAddressor();
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v7, v10, v8);
    uint64_t v11 = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.error.getter();
    BOOL v13 = os_log_type_enabled(v11, v12);
    uint64_t v14 = *(void *)(v0 + 288);
    uint64_t v15 = *(void *)(v0 + 256);
    uint64_t v16 = *(void *)(v0 + 264);
    if (v13)
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      uint64_t v31 = v18;
      *(_DWORD *)uint64_t v17 = 136315138;
      uint64_t v19 = _typeName(_:qualified:)();
      *(void *)(v0 + 224) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v19, v20, &v31);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_261998000, v11, v12, "%s.handleResponseForRemoteControl should not be called from a watch", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x263E47E50](v18, -1, -1);
      MEMORY[0x263E47E50](v17, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v14, v15);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v14, v15);
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v30 = *(uint64_t (**)(void))(v0 + 8);
    return v30(0);
  }
  else
  {
    char v21 = *(unsigned char *)(v0 + 344);
    id v22 = objc_msgSend(*(id *)(v0 + 232), sel_predictionIdentifier);
    uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v25 = v24;

    uint64_t v26 = v3[3];
    uint64_t v27 = v3[4];
    __swift_project_boxed_opaque_existential_1(v3, v26);
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v27);
    *(void *)(v0 + 304) = WorkoutReminderControlsDirectInvocation.asStartLocalRequest(device:)((void *)(v0 + 56), v21, v23, v25);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1Tm(v0 + 56);
    uint64_t v28 = (void *)swift_task_alloc();
    *(void *)(v0 + 312) = v28;
    void *v28 = v0;
    v28[1] = specialized WorkoutReminderAnnouncementFlow.handleResponseForRemoteControl(_:to:);
    return WorkoutReminderAnnouncementFlow.findRemoteIfAvailable()();
  }
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  BOOL v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  char v29;
  uint64_t (*v31)(void);
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(char, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  uint64_t v37 = v0;
  uint64_t v1 = *(void **)(v0 + 320);
  uint64_t v2 = *(void *)(v0 + 256);
  uint64_t v3 = *(void *)(v0 + 264);
  if (v1)
  {
    uint64_t v4 = *(void *)(v0 + 280);
    uint64_t v5 = Logger.workout.unsafeMutableAddressor();
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v4, v5, v2);
    char v6 = v1;
    uint64_t v7 = Logger.logObject.getter();
    uint64_t v8 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v34 = *(void *)(v0 + 320);
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v32 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v9 = 138412290;
      *(void *)(v0 + 216) = v6;
      uint64_t v10 = v6;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v32 = v34;

      _os_log_impl(&dword_261998000, v7, v8, "Submitting startLocalRequest to remote device: %@", v9, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      MEMORY[0x263E47E50](v32, -1, -1);
      MEMORY[0x263E47E50](v9, -1, -1);
    }
    else
    {
    }
    uint64_t v24 = (void *)(*(void *)(v0 + 240) + *(void *)(v0 + 296));
    (*(void (**)(void, void))(*(void *)(v0 + 264) + 8))(*(void *)(v0 + 280), *(void *)(v0 + 256));
    uint64_t v25 = v24[3];
    uint64_t v26 = v24[4];
    __swift_project_boxed_opaque_existential_1(v24, v25);
    (*(void (**)(uint64_t, uint64_t))(v26 + 16))(v25, v26);
    __swift_project_boxed_opaque_existential_1((void *)(v0 + 96), *(void *)(v0 + 120));
    DeviceUnit.assistantId.getter();
    type metadata accessor for SABaseCommand();
    dispatch thunk of AceServiceInvoker.submitToRemote<A>(_:_:completion:)();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1Tm(v0 + 96);
    uint64_t v35 = (uint64_t (*)(char, uint64_t))((char *)&async function pointer to specialized WorkoutReminderAnnouncementFlow.workoutConfirmationResponseFlow(response:to:)
                                                + async function pointer to specialized WorkoutReminderAnnouncementFlow.workoutConfirmationResponseFlow(response:to:));
    uint64_t v27 = (void *)swift_task_alloc();
    *(void *)(v0 + 328) = v27;
    *uint64_t v27 = v0;
    v27[1] = specialized WorkoutReminderAnnouncementFlow.handleResponseForRemoteControl(_:to:);
    uint64_t v28 = *(void *)(v0 + 232);
    unint64_t v29 = *(unsigned char *)(v0 + 344);
    return v35(v29, v28);
  }
  else
  {
    uint64_t v11 = *(void *)(v0 + 272);
    os_log_type_t v12 = Logger.workout.unsafeMutableAddressor();
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v11, v12, v2);
    BOOL v13 = Logger.logObject.getter();
    uint64_t v14 = static os_log_type_t.error.getter();
    uint64_t v15 = os_log_type_enabled(v13, v14);
    uint64_t v16 = *(void **)(v0 + 304);
    uint64_t v18 = *(void *)(v0 + 264);
    uint64_t v17 = *(void *)(v0 + 272);
    uint64_t v19 = *(void *)(v0 + 256);
    if (v15)
    {
      uint64_t v33 = *(void *)(v0 + 256);
      unint64_t v20 = (uint8_t *)swift_slowAlloc();
      char v21 = swift_slowAlloc();
      uint64_t v36 = v21;
      *(_DWORD *)unint64_t v20 = 136315138;
      id v22 = _typeName(_:qualified:)();
      *(void *)(v0 + 208) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v22, v23, &v36);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_261998000, v13, v14, "%s cannot find remote Watch", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x263E47E50](v21, -1, -1);
      MEMORY[0x263E47E50](v20, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v33);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v31 = *(uint64_t (**)(void))(v0 + 8);
    return v31(0);
  }
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v5;

  uint64_t v1 = *(void **)(v0 + 320);

  uint64_t v2 = *(void *)(v0 + 336);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v3(v2);
}

uint64_t specialized WorkoutReminderAnnouncementFlow.handleResponseForRemoteControl(_:to:)(uint64_t a1)
{
  *(void *)(*(void *)v1 + 320) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](specialized WorkoutReminderAnnouncementFlow.handleResponseForRemoteControl(_:to:), 0, 0);
}

{
  uint64_t v1;
  uint64_t v3;

  *(void *)(*(void *)v1 + 336) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](specialized WorkoutReminderAnnouncementFlow.handleResponseForRemoteControl(_:to:), 0, 0);
}

uint64_t specialized WorkoutReminderAnnouncementFlow.handleResponse(_:to:)(uint64_t a1, uint64_t a2)
{
  v3[15] = a2;
  v3[16] = v2;
  v3[14] = a1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PromptResult<WorkoutReminderControlsDirectInvocation.Action>);
  v3[17] = v4;
  v3[18] = *(void *)(v4 - 8);
  v3[19] = swift_task_alloc();
  v3[20] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for Logger();
  v3[21] = v5;
  v3[22] = *(void *)(v5 - 8);
  v3[23] = swift_task_alloc();
  v3[24] = swift_task_alloc();
  return MEMORY[0x270FA2498](specialized WorkoutReminderAnnouncementFlow.handleResponse(_:to:), 0, 0);
}

uint64_t specialized WorkoutReminderAnnouncementFlow.handleResponse(_:to:)()
{
  uint64_t v54 = v0;
  uint64_t v51 = v0[14];
  uint64_t v1 = v0[24];
  uint64_t v3 = v0[21];
  uint64_t v2 = v0[22];
  uint64_t v4 = v0[20];
  uint64_t v6 = v0[17];
  uint64_t v5 = v0[18];
  uint64_t v7 = Logger.workout.unsafeMutableAddressor();
  swift_beginAccess();
  uint64_t v50 = v7;
  uint64_t v49 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  v49(v1, v7, v3);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v8(v4, v51, v6);
  uint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v45 = v0[22];
    uint64_t v46 = v0[21];
    uint64_t v47 = v0[24];
    uint64_t v44 = v0[20];
    uint64_t v12 = v0[17];
    uint64_t v11 = v0[18];
    uint64_t v48 = v8;
    BOOL v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    uint64_t v53 = v14;
    *(_DWORD *)BOOL v13 = 136315138;
    lazy protocol witness table accessor for type PromptForValueFlowAsync<WorkoutReminderControlsDirectInvocation.Action> and conformance PromptForValueFlowAsync<A>(&lazy protocol witness table cache variable for type PromptResult<WorkoutReminderControlsDirectInvocation.Action> and conformance PromptResult<A>, &demangling cache variable for type metadata for PromptResult<WorkoutReminderControlsDirectInvocation.Action>);
    uint64_t v15 = dispatch thunk of CustomStringConvertible.description.getter();
    v0[13] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v16, &v53);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v17(v44, v12);
    _os_log_impl(&dword_261998000, v9, v10, "ExitValue from Workout Reminder prompt: %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x263E47E50](v14, -1, -1);
    uint64_t v18 = v13;
    uint64_t v8 = v48;
    MEMORY[0x263E47E50](v18, -1, -1);

    uint64_t v19 = *(void (**)(uint64_t, uint64_t))(v45 + 8);
    v19(v47, v46);
  }
  else
  {
    uint64_t v20 = v0[24];
    uint64_t v21 = v0[21];
    uint64_t v22 = v0[22];
    uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v0[18] + 8);
    v17(v0[20], v0[17]);

    uint64_t v19 = *(void (**)(uint64_t, uint64_t))(v22 + 8);
    v19(v20, v21);
  }
  uint64_t v24 = v0[18];
  uint64_t v23 = v0[19];
  uint64_t v25 = v0[17];
  v8(v23, v0[14], v25);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v24 + 88))(v23, v25) == *MEMORY[0x263F6FA10])
  {
    uint64_t v26 = (char *)v0[19];
    uint64_t v27 = v0[16];
    (*(void (**)(char *, void))(v0[18] + 96))(v26, v0[17]);
    char v28 = *v26;
    unint64_t v29 = (void *)(v27 + OBJC_IVAR____TtC20WorkoutAnnouncements31WorkoutReminderAnnouncementFlow_flowConfig);
    uint64_t v30 = *(void *)(v27 + OBJC_IVAR____TtC20WorkoutAnnouncements31WorkoutReminderAnnouncementFlow_flowConfig + 24);
    uint64_t v31 = v29[4];
    __swift_project_boxed_opaque_existential_1(v29, v30);
    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v30, v31);
    __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
    LOBYTE(v26) = dispatch thunk of DeviceState.isWatch.getter();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 2));
    if (v26)
    {
      uint64_t v52 = (uint64_t (*)(char, uint64_t))((char *)&async function pointer to specialized WorkoutReminderAnnouncementFlow.handleResponseForLocalControl(_:to:)
                                                  + async function pointer to specialized WorkoutReminderAnnouncementFlow.handleResponseForLocalControl(_:to:));
      uint64_t v32 = (void *)swift_task_alloc();
      v0[25] = v32;
      *uint64_t v32 = v0;
      uint64_t v33 = specialized WorkoutReminderAnnouncementFlow.handleResponse(_:to:);
    }
    else
    {
      uint64_t v52 = (uint64_t (*)(char, uint64_t))((char *)&async function pointer to specialized WorkoutReminderAnnouncementFlow.handleResponseForRemoteControl(_:to:)
                                                  + async function pointer to specialized WorkoutReminderAnnouncementFlow.handleResponseForRemoteControl(_:to:));
      uint64_t v32 = (void *)swift_task_alloc();
      v0[26] = v32;
      *uint64_t v32 = v0;
      uint64_t v33 = specialized WorkoutReminderAnnouncementFlow.handleResponse(_:to:);
    }
    v32[1] = v33;
    uint64_t v43 = v0[15];
    return v52(v28, v43);
  }
  else
  {
    uint64_t v34 = v0[23];
    uint64_t v35 = v0[21];
    v17(v0[19], v0[17]);
    swift_beginAccess();
    v49(v34, v50, v35);
    uint64_t v36 = Logger.logObject.getter();
    os_log_type_t v37 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v38 = 0;
      _os_log_impl(&dword_261998000, v36, v37, "Did not receive a response from the strategy, treating as an ignore", v38, 2u);
      MEMORY[0x263E47E50](v38, -1, -1);
    }
    uint64_t v39 = v0[23];
    uint64_t v40 = v0[21];

    v19(v39, v40);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v41 = (uint64_t (*)(void))v0[1];
    return v41(0);
  }
}

uint64_t specialized WorkoutReminderAnnouncementFlow.handleResponse(_:to:)(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

{
  uint64_t *v1;
  uint64_t (*v3)(uint64_t);
  uint64_t v5;
  uint64_t v6;

  uint64_t v5 = *v1;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t outlined retain of String?(uint64_t a1)
{
  return a1;
}

uint64_t outlined release of String?(uint64_t a1)
{
  return a1;
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type WorkoutReminderAnnouncementFlow and conformance WorkoutReminderAnnouncementFlow(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2619AD590()
{
  swift_release();

  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t partial apply for closure #1 in WorkoutReminderAnnouncementFlow.execute()(uint64_t a1)
{
  return closure #1 in WorkoutReminderAnnouncementFlow.execute()(a1, *(void *)(v1 + 16), (_OWORD *)(v1 + 24));
}

uint64_t outlined destroy of WorkoutReminderAnnouncementFlow.State(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for WorkoutReminderAnnouncementFlow.State(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t ObjC metadata update function for WorkoutReminderAnnouncementFlow()
{
  return type metadata accessor for WorkoutReminderAnnouncementFlow(0);
}

uint64_t type metadata completion function for WorkoutReminderAnnouncementFlow()
{
  uint64_t result = type metadata accessor for WorkoutReminderAnnouncementFlow.State(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

char *initializeBufferWithCopyOfBuffer for WorkoutReminderAnnouncementFlow.State(char *a1, char **a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *(void *)a1 = *a2;
    a1 = &v11[(v5 + 16) & ~(unint64_t)v5];
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PromptResult<WorkoutReminderControlsDirectInvocation.Action>);
      (*(void (**)(char *, char **, uint64_t))(*(void *)(v12 - 8) + 16))(a1, a2, v12);
      uint64_t v13 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (PromptResult<WorkoutReminderControlsDirectInvocation.Action>, to: WorkoutReminderAnnouncementDirectInvocation))
                   + 48);
      uint64_t v14 = &a1[v13];
      uint64_t v15 = (char *)a2 + v13;
      unint64_t v16 = *(void **)v15;
      uint64_t v17 = *((void *)v15 + 1);
      *(void *)uint64_t v14 = *(void *)v15;
      *((void *)v14 + 1) = v17;
      *((void *)v14 + 2) = *((void *)v15 + 2);
      v14[24] = v15[24];
      *((_OWORD *)v14 + 2) = *((_OWORD *)v15 + 2);
      id v18 = v16;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v8 = *a2;
      uint64_t v9 = a2[1];
      *(void *)a1 = *a2;
      *((void *)a1 + 1) = v9;
      *((void *)a1 + 2) = a2[2];
      a1[24] = *((unsigned char *)a2 + 24);
      *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
      os_log_type_t v10 = v8;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t destroy for WorkoutReminderAnnouncementFlow.State(id *a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result)
  {
    if (result != 1) {
      return result;
    }
    uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PromptResult<WorkoutReminderControlsDirectInvocation.Action>);
    (*(void (**)(id *, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
    a1 = (id *)((char *)a1
              + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (PromptResult<WorkoutReminderControlsDirectInvocation.Action>, to: WorkoutReminderAnnouncementDirectInvocation))
                       + 48));
  }

  return swift_bridgeObjectRelease();
}

void **initializeWithCopy for WorkoutReminderAnnouncementFlow.State(void **a1, void **a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PromptResult<WorkoutReminderControlsDirectInvocation.Action>);
    (*(void (**)(void **, void **, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
    uint64_t v11 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (PromptResult<WorkoutReminderControlsDirectInvocation.Action>, to: WorkoutReminderAnnouncementDirectInvocation))
                 + 48);
    uint64_t v12 = (char *)a1 + v11;
    uint64_t v13 = (char *)a2 + v11;
    uint64_t v14 = *(void **)v13;
    uint64_t v15 = *((void *)v13 + 1);
    *(void *)uint64_t v12 = *(void *)v13;
    *((void *)v12 + 1) = v15;
    *((void *)v12 + 2) = *((void *)v13 + 2);
    v12[24] = v13[24];
    *((_OWORD *)v12 + 2) = *((_OWORD *)v13 + 2);
    id v16 = v14;
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v7 = *a2;
    uint64_t v8 = a2[1];
    *a1 = *a2;
    a1[1] = v8;
    a1[2] = a2[2];
    *((unsigned char *)a1 + 24) = *((unsigned char *)a2 + 24);
    *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
    id v9 = v7;
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void **assignWithCopy for WorkoutReminderAnnouncementFlow.State(void **a1, void **a2, uint64_t a3)
{
  if (a1 != a2)
  {
    outlined destroy of WorkoutReminderAnnouncementFlow.State((uint64_t)a1);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PromptResult<WorkoutReminderControlsDirectInvocation.Action>);
      (*(void (**)(void **, void **, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
      uint64_t v10 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (PromptResult<WorkoutReminderControlsDirectInvocation.Action>, to: WorkoutReminderAnnouncementDirectInvocation))
                   + 48);
      uint64_t v11 = (char *)a1 + v10;
      uint64_t v12 = (char *)a2 + v10;
      uint64_t v13 = *(void **)v12;
      *(void *)uint64_t v11 = *(void *)v12;
      *((void *)v11 + 1) = *((void *)v12 + 1);
      *((void *)v11 + 2) = *((void *)v12 + 2);
      v11[24] = v12[24];
      *((void *)v11 + 4) = *((void *)v12 + 4);
      *((void *)v11 + 5) = *((void *)v12 + 5);
      id v14 = v13;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v7 = *a2;
      *a1 = *a2;
      a1[1] = a2[1];
      a1[2] = a2[2];
      *((unsigned char *)a1 + 24) = *((unsigned char *)a2 + 24);
      a1[4] = a2[4];
      a1[5] = a2[5];
      id v8 = v7;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

char *initializeWithTake for WorkoutReminderAnnouncementFlow.State(char *a1, char *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PromptResult<WorkoutReminderControlsDirectInvocation.Action>);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    uint64_t v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (PromptResult<WorkoutReminderControlsDirectInvocation.Action>, to: WorkoutReminderAnnouncementDirectInvocation))
                + 48);
    id v8 = &a1[v7];
    uint64_t v9 = &a2[v7];
    long long v10 = *((_OWORD *)v9 + 1);
    *(_OWORD *)id v8 = *(_OWORD *)v9;
    *((_OWORD *)v8 + 1) = v10;
    *((_OWORD *)v8 + 2) = *((_OWORD *)v9 + 2);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

char *assignWithTake for WorkoutReminderAnnouncementFlow.State(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    outlined destroy of WorkoutReminderAnnouncementFlow.State((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PromptResult<WorkoutReminderControlsDirectInvocation.Action>);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      uint64_t v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (PromptResult<WorkoutReminderControlsDirectInvocation.Action>, to: WorkoutReminderAnnouncementDirectInvocation))
                  + 48);
      id v8 = &a1[v7];
      uint64_t v9 = &a2[v7];
      long long v10 = *((_OWORD *)v9 + 1);
      *(_OWORD *)id v8 = *(_OWORD *)v9;
      *((_OWORD *)v8 + 1) = v10;
      *((_OWORD *)v8 + 2) = *((_OWORD *)v9 + 2);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for WorkoutReminderAnnouncementFlow.State(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for WorkoutReminderAnnouncementFlow.State(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t destructiveInjectEnumTag for WorkoutReminderAnnouncementFlow.State()
{
  return swift_storeEnumTagMultiPayload();
}

void type metadata completion function for WorkoutReminderAnnouncementFlow.State()
{
  v1[4] = "0";
  type metadata accessor for PromptResult<WorkoutReminderControlsDirectInvocation.Action>();
  if (v0 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    v1[5] = v1;
    swift_initEnumMetadataMultiPayload();
  }
}

void type metadata accessor for PromptResult<WorkoutReminderControlsDirectInvocation.Action>()
{
  if (!lazy cache variable for type metadata for PromptResult<WorkoutReminderControlsDirectInvocation.Action>)
  {
    unint64_t v0 = type metadata accessor for PromptResult();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for PromptResult<WorkoutReminderControlsDirectInvocation.Action>);
    }
  }
}

uint64_t lazy protocol witness table accessor for type PromptForValueFlowAsync<WorkoutReminderControlsDirectInvocation.Action> and conformance PromptForValueFlowAsync<A>(unint64_t *a1, uint64_t *a2)
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

unint64_t type metadata accessor for SABaseCommand()
{
  unint64_t result = lazy cache variable for type metadata for SABaseCommand;
  if (!lazy cache variable for type metadata for SABaseCommand)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for SABaseCommand);
  }
  return result;
}

uint64_t outlined init with copy of Result<SABaseCommand, SubmitCommandError>(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<SABaseCommand, SubmitCommandError>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of Result<SABaseCommand, SubmitCommandError>(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<SABaseCommand, SubmitCommandError>);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t Encodable.asDictionary()()
{
  v14[4] = *(id *)MEMORY[0x263EF8340];
  type metadata accessor for PropertyListEncoder();
  swift_allocObject();
  PropertyListEncoder.init()();
  uint64_t v1 = dispatch thunk of PropertyListEncoder.encode<A>(_:)();
  if (v0)
  {
    MEMORY[0x263E47CC0](v0);
    swift_release();
    lazy protocol witness table accessor for type VoiceFeedbackErrors and conformance VoiceFeedbackErrors();
    swift_allocError();
    *uint64_t v3 = 2;
    return swift_willThrow();
  }
  uint64_t v5 = v1;
  unint64_t v6 = v2;
  swift_release();
  uint64_t v7 = self;
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  v14[0] = 0;
  id v9 = objc_msgSend(v7, sel_propertyListWithData_options_format_error_, isa, 0, 0, v14);

  if (v9)
  {
    id v10 = v14[0];
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Any]);
    if (swift_dynamicCast())
    {
      outlined consume of Data._Representation(v5, v6);
      return v13;
    }
    lazy protocol witness table accessor for type VoiceFeedbackErrors and conformance VoiceFeedbackErrors();
    swift_allocError();
    unsigned char *v12 = 3;
  }
  else
  {
    id v11 = v14[0];
    _convertNSErrorToError(_:)();
  }
  swift_willThrow();
  return outlined consume of Data._Representation(v5, v6);
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

unint64_t VoiceFeedbackKeys.rawValue.getter(char a1)
{
  unint64_t result = 0xD000000000000014;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6574656C706D6F63;
      break;
    case 2:
      unint64_t result = 0x6E6F697461727564;
      break;
    case 3:
      unint64_t result = 0x7865646E69;
      break;
    case 4:
      return result;
    case 5:
    case 9:
      unint64_t result = 0xD000000000000011;
      break;
    case 6:
      unint64_t result = 0x647574696E67616DLL;
      break;
    case 7:
      unint64_t result = 0x795463697274656DLL;
      break;
    case 8:
    case 11:
      unint64_t result = 0x706574537478656ELL;
      break;
    case 10:
      unint64_t result = 0xD000000000000012;
      break;
    case 12:
      unint64_t result = 0x6D726F4665636170;
      break;
    case 13:
      unint64_t result = 0x746E656D676573;
      break;
    case 14:
      unint64_t result = 0xD000000000000012;
      break;
    case 15:
      unint64_t result = 1953066613;
      break;
    case 16:
      unint64_t result = 0xD000000000000017;
      break;
    default:
      unint64_t result = 0x7079547472656C61;
      break;
  }
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance VoiceFeedbackKeys(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = VoiceFeedbackKeys.rawValue.getter(*a1);
  uint64_t v5 = v4;
  if (v3 == VoiceFeedbackKeys.rawValue.getter(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance VoiceFeedbackKeys()
{
  char v1 = *v0;
  Hasher.init(_seed:)();
  VoiceFeedbackKeys.rawValue.getter(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance VoiceFeedbackKeys()
{
  VoiceFeedbackKeys.rawValue.getter(*v0);
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance VoiceFeedbackKeys()
{
  char v1 = *v0;
  Hasher.init(_seed:)();
  VoiceFeedbackKeys.rawValue.getter(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance VoiceFeedbackKeys@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = specialized VoiceFeedbackKeys.init(rawValue:)();
  *a1 = result;
  return result;
}

unint64_t protocol witness for RawRepresentable.rawValue.getter in conformance VoiceFeedbackKeys@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = VoiceFeedbackKeys.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t protocol witness for Decodable.init(from:) in conformance VoiceFeedbackKeys()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t protocol witness for Encodable.encode(to:) in conformance VoiceFeedbackKeys()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t specialized VoiceFeedbackKeys.init(rawValue:)()
{
  unint64_t v0 = _findStringSwitchCaseWithCache(cases:string:cache:)();
  swift_bridgeObjectRelease();
  if (v0 >= 0x11) {
    return 17;
  }
  else {
    return v0;
  }
}

uint64_t getEnumTagSinglePayload for VoiceFeedbackKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF0) {
    goto LABEL_17;
  }
  if (a2 + 16 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 16) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 16;
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
      return (*a1 | (v4 << 8)) - 16;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 16;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x11;
  int v8 = v6 - 17;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for VoiceFeedbackKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 16 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 16) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF0) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xEF)
  {
    unsigned int v6 = ((a2 - 240) >> 8) + 1;
    *unint64_t result = a2 + 16;
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
        JUMPOUT(0x2619AE978);
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
          *unint64_t result = a2 + 16;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for VoiceFeedbackKeys()
{
  return &type metadata for VoiceFeedbackKeys;
}

uint64_t AboveTargetZoneModel.alertType.getter()
{
  return *v0;
}

uint64_t AboveTargetZoneModel.alertType.setter(uint64_t result)
{
  *char v1 = result;
  return result;
}

uint64_t (*AboveTargetZoneModel.alertType.modify())()
{
  return closure #1 in default argument 1 of OutputGenerationManifest.init(dialogPhase:_:);
}

void __swiftcall AboveTargetZoneModel.init(magnitude:unit:targetZone:)(WorkoutAnnouncements::AboveTargetZoneModel *__return_ptr retstr, Swift::Double magnitude, Swift::String unit, WorkoutAnnouncements::VoiceFeedbackTargetZone *targetZone)
{
  object = unit._object;
  uint64_t countAndFlagsBits = unit._countAndFlagsBits;
  outlined release of AboveTargetZoneModel((uint64_t)targetZone);
  Swift::Bool isSingleThreshold = targetZone->isSingleThreshold;
  WorkoutAnnouncements::VoiceFeedbackPaceFormat value = targetZone->paceFormat.value;
  WorkoutAnnouncements::VoiceFeedbackMetricType metricType = targetZone->metricType;
  retstr->alertType = WorkoutAnnouncements_VoiceFeedbackAlertType_zoneExitedAbove;
  retstr->magnitude = magnitude;
  retstr->unit._uint64_t countAndFlagsBits = countAndFlagsBits;
  retstr->unit._object = object;
  retstr->Swift::Bool isSingleThreshold = isSingleThreshold;
  retstr->paceFormat.WorkoutAnnouncements::VoiceFeedbackPaceFormat value = value;
  retstr->WorkoutAnnouncements::VoiceFeedbackMetricType metricType = metricType;
}

unint64_t AboveTargetZoneModel.CodingKeys.stringValue.getter(char a1)
{
  unint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x647574696E67616DLL;
      break;
    case 2:
      unint64_t result = 1953066613;
      break;
    case 3:
      return result;
    case 4:
      unint64_t result = 0x6D726F4665636170;
      break;
    case 5:
      unint64_t result = 0x795463697274656DLL;
      break;
    default:
      unint64_t result = 0x7079547472656C61;
      break;
  }
  return result;
}

unint64_t protocol witness for CodingKey.stringValue.getter in conformance AboveTargetZoneModel.CodingKeys()
{
  return AboveTargetZoneModel.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance AboveTargetZoneModel.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized AboveTargetZoneModel.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance AboveTargetZoneModel.CodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 6;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance AboveTargetZoneModel.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type AboveTargetZoneModel.CodingKeys and conformance AboveTargetZoneModel.CodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance AboveTargetZoneModel.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type AboveTargetZoneModel.CodingKeys and conformance AboveTargetZoneModel.CodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t AboveTargetZoneModel.encode(to:)(void *a1)
{
  int v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<AboveTargetZoneModel.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type AboveTargetZoneModel.CodingKeys and conformance AboveTargetZoneModel.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v11[5] = *v3;
  v11[4] = 0;
  lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v2)
  {
    v11[3] = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
    v11[2] = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
    v11[1] = 3;
    KeyedEncodingContainer.encode(_:forKey:)();
    outlined init with take of VoiceFeedbackPaceFormat?((uint64_t)(v3 + 33), (uint64_t)&v12);
    outlined init with take of VoiceFeedbackPaceFormat?((uint64_t)&v12, (uint64_t)v11);
    v10[8] = 4;
    lazy protocol witness table accessor for type VoiceFeedbackPaceFormat and conformance VoiceFeedbackPaceFormat();
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
    v10[7] = v3[34];
    v10[6] = 5;
    lazy protocol witness table accessor for type VoiceFeedbackMetricType and conformance VoiceFeedbackMetricType();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

double AboveTargetZoneModel.init(from:)@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  specialized AboveTargetZoneModel.init(from:)(a1, (uint64_t)&v6);
  if (!v2)
  {
    double result = *(double *)&v6;
    long long v5 = *(_OWORD *)v7;
    *(_OWORD *)a2 = v6;
    *(_OWORD *)(a2 + 16) = v5;
    *(_DWORD *)(a2 + 31) = *(_DWORD *)&v7[15];
  }
  return result;
}

double protocol witness for Decodable.init(from:) in conformance AboveTargetZoneModel@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  specialized AboveTargetZoneModel.init(from:)(a1, (uint64_t)&v6);
  if (!v2)
  {
    double result = *(double *)&v6;
    long long v5 = *(_OWORD *)v7;
    *(_OWORD *)a2 = v6;
    *(_OWORD *)(a2 + 16) = v5;
    *(_DWORD *)(a2 + 31) = *(_DWORD *)&v7[15];
  }
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance AboveTargetZoneModel(void *a1)
{
  return AboveTargetZoneModel.encode(to:)(a1);
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance AboveTargetZoneModel(long long *a1, long long *a2)
{
  long long v2 = a1[1];
  long long v5 = *a1;
  v6[0] = v2;
  *(_DWORD *)((char *)v6 + 15) = *(_DWORD *)((char *)a1 + 31);
  long long v3 = a2[1];
  long long v7 = *a2;
  v8[0] = v3;
  *(_DWORD *)((char *)v8 + 15) = *(_DWORD *)((char *)a2 + 31);
  return specialized static AboveTargetZoneModel.__derived_struct_equals(_:_:)((double *)&v5, (double *)&v7);
}

uint64_t AboveTargetZoneModel.executePattern(wrapper:)(uint64_t a1)
{
  v2[6] = a1;
  v2[7] = v1;
  uint64_t v3 = type metadata accessor for Logger();
  v2[8] = v3;
  v2[9] = *(void *)(v3 - 8);
  v2[10] = swift_task_alloc();
  return MEMORY[0x270FA2498](AboveTargetZoneModel.executePattern(wrapper:), 0, 0);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v9;

  unsigned int v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  outlined release of AboveTargetZoneModel(*(void *)(v4 + 56));
  long long v6 = swift_task_dealloc();
  long long v7 = *(uint64_t (**)(uint64_t))(v5 + 8);
  if (!v1) {
    long long v6 = a1;
  }
  return v7(v6);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v9;

  unsigned int v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  outlined release of AboveTargetZoneModel(*(void *)(v4 + 56));
  long long v6 = swift_task_dealloc();
  long long v7 = *(uint64_t (**)(uint64_t))(v5 + 8);
  if (!v1) {
    long long v6 = a1;
  }
  return v7(v6);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v9;

  unsigned int v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  outlined release of AboveTargetZoneModel(*(void *)(v4 + 56));
  long long v6 = swift_task_dealloc();
  long long v7 = *(uint64_t (**)(uint64_t))(v5 + 8);
  if (!v1) {
    long long v6 = a1;
  }
  return v7(v6);
}

uint64_t AboveTargetZoneModel.executePattern(wrapper:)()
{
  uint64_t v40 = v0;
  if (one-time initialization token for noPaceFormatMetrics != -1) {
    swift_once();
  }
  unsigned __int8 v1 = *(unsigned char *)(*(void *)(v0 + 56) + 34);
  BOOL v2 = specialized Sequence<>.contains(_:)(v1, (uint64_t)noPaceFormatMetrics._rawValue);
  uint64_t v3 = *(void *)(v0 + 56);
  if (v2)
  {
    unsigned int v4 = __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 48), *(void *)(*(void *)(v0 + 48) + 24));
    char v5 = *(unsigned char *)(v3 + 32);
    uint64_t v6 = *v4;
    outlined retain of AboveTargetZoneModel(v3);
    uint64_t v38 = (uint64_t (*)(char, char, uint64_t, uint64_t))((char *)&async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedAboveNonPace(executeSashGroupOnWatch:isSingleThreshold:_:)
                                                               + async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedAboveNonPace(executeSashGroupOnWatch:isSingleThreshold:_:));
    long long v7 = (void *)swift_task_alloc();
    *(void *)(v0 + 88) = v7;
    *long long v7 = v0;
    v7[1] = AboveTargetZoneModel.executePattern(wrapper:);
    uint64_t v8 = *(void *)(v0 + 56);
    char v9 = v5;
    uint64_t v10 = v6;
LABEL_16:
    return v38(0, v9, v10, v8);
  }
  outlined init with take of VoiceFeedbackPaceFormat?(v3 + 33, v0 + 113);
  outlined init with take of VoiceFeedbackPaceFormat?(v0 + 113, v0 + 112);
  int v11 = *(unsigned __int8 *)(v0 + 112);
  if (v11 != 2)
  {
    uint64_t v28 = *(void *)(v0 + 56);
    unint64_t v29 = __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 48), *(void *)(*(void *)(v0 + 48) + 24));
    char v30 = *(unsigned char *)(v28 + 32);
    uint64_t v31 = *v29;
    outlined retain of AboveTargetZoneModel(v28);
    if (v11)
    {
      uint64_t v38 = (uint64_t (*)(char, char, uint64_t, uint64_t))((char *)&async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedAbovePace(executeSashGroupOnWatch:isSingleThreshold:_:)
                                                                 + async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedAbovePace(executeSashGroupOnWatch:isSingleThreshold:_:));
      uint64_t v32 = (void *)swift_task_alloc();
      *(void *)(v0 + 104) = v32;
      *uint64_t v32 = v0;
      uint64_t v33 = AboveTargetZoneModel.executePattern(wrapper:);
    }
    else
    {
      uint64_t v38 = (uint64_t (*)(char, char, uint64_t, uint64_t))((char *)&async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedAboveSpeed(executeSashGroupOnWatch:isSingleThreshold:_:)
                                                                 + async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedAboveSpeed(executeSashGroupOnWatch:isSingleThreshold:_:));
      uint64_t v32 = (void *)swift_task_alloc();
      *(void *)(v0 + 96) = v32;
      *uint64_t v32 = v0;
      uint64_t v33 = AboveTargetZoneModel.executePattern(wrapper:);
    }
    v32[1] = v33;
    uint64_t v8 = *(void *)(v0 + 56);
    char v9 = v30;
    uint64_t v10 = v31;
    goto LABEL_16;
  }
  uint64_t v13 = *(void *)(v0 + 72);
  uint64_t v12 = *(void *)(v0 + 80);
  uint64_t v15 = *(void *)(v0 + 56);
  uint64_t v14 = *(void *)(v0 + 64);
  uint64_t v16 = Logger.workout.unsafeMutableAddressor();
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v12, v16, v14);
  outlined retain of AboveTargetZoneModel(v15);
  outlined retain of AboveTargetZoneModel(v15);
  uint64_t v17 = Logger.logObject.getter();
  os_log_type_t v18 = static os_log_type_t.error.getter();
  BOOL v19 = os_log_type_enabled(v17, v18);
  uint64_t v21 = *(void *)(v0 + 72);
  uint64_t v20 = *(void *)(v0 + 80);
  uint64_t v23 = *(void *)(v0 + 56);
  uint64_t v22 = *(void *)(v0 + 64);
  if (v19)
  {
    uint64_t v37 = *(void *)(v0 + 64);
    uint64_t v24 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    uint64_t v39 = v25;
    *(_DWORD *)uint64_t v24 = 136315138;
    *(unsigned char *)(v0 + 114) = v1;
    uint64_t v26 = String.init<A>(describing:)();
    *(void *)(v0 + 40) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v26, v27, &v39);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    outlined release of AboveTargetZoneModel(v23);
    outlined release of AboveTargetZoneModel(v23);
    _os_log_impl(&dword_261998000, v17, v18, "AboveTargetZoneModel needs a pace format for: %s", v24, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x263E47E50](v25, -1, -1);
    MEMORY[0x263E47E50](v24, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v37);
  }
  else
  {
    outlined release of AboveTargetZoneModel(*(void *)(v0 + 56));
    outlined release of AboveTargetZoneModel(v23);

    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v22);
  }
  lazy protocol witness table accessor for type VoiceFeedbackErrors and conformance VoiceFeedbackErrors();
  swift_allocError();
  unsigned char *v34 = 1;
  swift_willThrow();
  swift_task_dealloc();
  uint64_t v35 = *(uint64_t (**)(void))(v0 + 8);
  return v35();
}

uint64_t protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance AboveTargetZoneModel(uint64_t a1)
{
  long long v4 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v2 + 32) = v4;
  *(_DWORD *)(v2 + 47) = *(_DWORD *)(v1 + 31);
  char v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 56) = v5;
  *char v5 = v2;
  v5[1] = protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance AboveTargetZoneModel;
  return AboveTargetZoneModel.executePattern(wrapper:)(a1);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v7;
  uint64_t v8;

  uint64_t v7 = *v2;
  long long v4 = swift_task_dealloc();
  char v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    long long v4 = a1;
  }
  return v5(v4);
}

uint64_t specialized AboveTargetZoneModel.init(with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(specialized Sequence.compactMap<A>(_:)(a1) + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<VoiceFeedbackKeys, Any>);
    uint64_t v8 = static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v8 = MEMORY[0x263F8EE80];
  }
  *(void *)&long long v51 = v8;
  uint64_t v9 = swift_bridgeObjectRetain();
  specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(v9, 1, &v51);
  swift_bridgeObjectRelease();
  uint64_t v10 = v51;
  uint64_t v11 = Logger.workout.unsafeMutableAddressor();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v11, v4);
  swift_retain_n();
  uint64_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v46 = swift_slowAlloc();
    *(void *)&long long v51 = v46;
    *(_DWORD *)uint64_t v14 = 136315394;
    uint64_t v48 = a1;
    double v49 = COERCE_DOUBLE(getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000014, 0x80000002619D9BC0, (uint64_t *)&v51));
    uint64_t v47 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v14 + 12) = 2080;
    v44[1] = v14 + 14;
    lazy protocol witness table accessor for type VoiceFeedbackKeys and conformance VoiceFeedbackKeys();
    uint64_t v45 = v4;
    swift_retain();
    uint64_t v15 = Dictionary.description.getter();
    uint64_t v16 = a2;
    unint64_t v18 = v17;
    swift_release();
    double v49 = COERCE_DOUBLE(getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v18, (uint64_t *)&v51));
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    a2 = v16;
    a1 = v48;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_261998000, v12, v13, "%s received VoiceFeedback dictionary: %s", (uint8_t *)v14, 0x16u);
    uint64_t v19 = v46;
    swift_arrayDestroy();
    MEMORY[0x263E47E50](v19, -1, -1);
    MEMORY[0x263E47E50](v14, -1, -1);

    (*(void (**)(char *, uint64_t))(v47 + 8))(v7, v45);
    if (!*(void *)(v10 + 16)) {
      goto LABEL_22;
    }
LABEL_8:
    unint64_t v20 = specialized __RawDictionaryStorage.find<A>(_:)(6);
    if ((v21 & 1) == 0) {
      goto LABEL_22;
    }
    outlined init with copy of Any(*(void *)(v10 + 56) + 32 * v20, (uint64_t)&v51);
    if ((swift_dynamicCast() & 1) == 0) {
      goto LABEL_22;
    }
    if (!*(void *)(v10 + 16)) {
      goto LABEL_22;
    }
    double v22 = v49;
    unint64_t v23 = specialized __RawDictionaryStorage.find<A>(_:)(15);
    if ((v24 & 1) == 0) {
      goto LABEL_22;
    }
    outlined init with copy of Any(*(void *)(v10 + 56) + 32 * v23, (uint64_t)&v51);
    if ((swift_dynamicCast() & 1) == 0) {
      goto LABEL_22;
    }
    uint64_t v25 = v50;
    if (!*(void *)(v10 + 16)) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)&v49;
    unint64_t v27 = specialized __RawDictionaryStorage.find<A>(_:)(5);
    if ((v28 & 1) == 0) {
      goto LABEL_26;
    }
    outlined init with copy of Any(*(void *)(v10 + 56) + 32 * v27, (uint64_t)&v51);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_release();
      swift_bridgeObjectRelease();
      goto LABEL_23;
    }
    if (!*(void *)(v10 + 16)
      || (int v29 = LOBYTE(v49), v30 = specialized __RawDictionaryStorage.find<A>(_:)(7), (v31 & 1) == 0))
    {
LABEL_26:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t result = swift_release();
      goto LABEL_24;
    }
    outlined init with copy of Any(*(void *)(v10 + 56) + 32 * v30, (uint64_t)&v51);
    if ((swift_dynamicCast() & 1) == 0
      || (int v32 = specialized VoiceFeedbackMetricType.init(rawValue:)(*(unint64_t *)&v49), v32 == 8))
    {
      swift_release();
      swift_bridgeObjectRelease();
      goto LABEL_23;
    }
    int v37 = v32;
    if (*(void *)(v10 + 16) && (unint64_t v38 = specialized __RawDictionaryStorage.find<A>(_:)(12), (v39 & 1) != 0))
    {
      outlined init with copy of Any(*(void *)(v10 + 56) + 32 * v38, (uint64_t)&v51);
    }
    else
    {
      long long v51 = 0u;
      long long v52 = 0u;
    }
    swift_release();
    if (*((void *)&v52 + 1))
    {
      if (swift_dynamicCast())
      {
        if (*(void *)&v49 == 1) {
          char v40 = 1;
        }
        else {
          char v40 = 2;
        }
        if (v49 == 0.0) {
          unsigned __int8 v41 = 0;
        }
        else {
          unsigned __int8 v41 = v40;
        }
LABEL_43:
        if (v29) {
          double v42 = v22;
        }
        else {
          double v42 = v22 + 1.0;
        }
        LOBYTE(v51) = 23;
        *((double *)&v51 + 1) = v22;
        *(void *)&long long v52 = v26;
        *((void *)&v52 + 1) = v25;
        BOOL v53 = v22 == v42;
        unsigned __int8 v54 = v41;
        char v55 = v37;
        swift_bridgeObjectRetain();
        char v43 = specialized VoiceFeedbackAlerting.hasValidAlertType(in:)(a1);
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        if (v43)
        {
          double v35 = v22;
          int v36 = (v22 == v42) | (v41 << 8) | (v37 << 16);
          uint64_t v34 = 23;
          goto LABEL_25;
        }
        goto LABEL_23;
      }
    }
    else
    {
      outlined destroy of Any?((uint64_t)&v51);
    }
    unsigned __int8 v41 = 2;
    goto LABEL_43;
  }

  swift_release_n();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (*(void *)(v10 + 16)) {
    goto LABEL_8;
  }
LABEL_22:
  swift_release();
LABEL_23:
  uint64_t result = swift_bridgeObjectRelease();
LABEL_24:
  uint64_t v34 = 0;
  double v35 = 0.0;
  unint64_t v26 = 0;
  uint64_t v25 = 0;
  int v36 = 0;
LABEL_25:
  *(void *)a2 = v34;
  *(double *)(a2 + 8) = v35;
  *(void *)(a2 + 16) = v26;
  *(void *)(a2 + 24) = v25;
  *(_WORD *)(a2 + 32) = v36;
  *(unsigned char *)(a2 + 34) = BYTE2(v36);
  return result;
}

BOOL specialized static AboveTargetZoneModel.__derived_struct_equals(_:_:)(double *a1, double *a2)
{
  if (*(unsigned __int8 *)a1 != *(unsigned __int8 *)a2 || a1[1] != a2[1]) {
    return 0;
  }
  BOOL v4 = *((void *)a1 + 2) == *((void *)a2 + 2) && *((void *)a1 + 3) == *((void *)a2 + 3);
  if (v4 || (v5 = _stringCompareWithSmolCheck(_:_:expecting:)(), BOOL result = 0, (v5 & 1) != 0))
  {
    if ((*((unsigned __int8 *)a1 + 32) ^ *((unsigned __int8 *)a2 + 32))) {
      return 0;
    }
    int v7 = *((unsigned __int8 *)a1 + 33);
    int v8 = *((unsigned __int8 *)a2 + 33);
    if (v7 == 2)
    {
      if (v8 != 2) {
        return 0;
      }
      return *((unsigned __int8 *)a1 + 34) == *((unsigned __int8 *)a2 + 34);
    }
    BOOL result = 0;
    if (v8 != 2 && ((v8 ^ v7) & 1) == 0) {
      return *((unsigned __int8 *)a1 + 34) == *((unsigned __int8 *)a2 + 34);
    }
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type AboveTargetZoneModel.CodingKeys and conformance AboveTargetZoneModel.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type AboveTargetZoneModel.CodingKeys and conformance AboveTargetZoneModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type AboveTargetZoneModel.CodingKeys and conformance AboveTargetZoneModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AboveTargetZoneModel.CodingKeys and conformance AboveTargetZoneModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AboveTargetZoneModel.CodingKeys and conformance AboveTargetZoneModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type AboveTargetZoneModel.CodingKeys and conformance AboveTargetZoneModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AboveTargetZoneModel.CodingKeys and conformance AboveTargetZoneModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AboveTargetZoneModel.CodingKeys and conformance AboveTargetZoneModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type AboveTargetZoneModel.CodingKeys and conformance AboveTargetZoneModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AboveTargetZoneModel.CodingKeys and conformance AboveTargetZoneModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AboveTargetZoneModel.CodingKeys and conformance AboveTargetZoneModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type AboveTargetZoneModel.CodingKeys and conformance AboveTargetZoneModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AboveTargetZoneModel.CodingKeys and conformance AboveTargetZoneModel.CodingKeys);
  }
  return result;
}

uint64_t specialized AboveTargetZoneModel.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x7079547472656C61 && a2 == 0xE900000000000065;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x647574696E67616DLL && a2 == 0xE900000000000065 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1953066613 && a2 == 0xE400000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000002619DBBF0 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6D726F4665636170 && a2 == 0xEA00000000007461 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x795463697274656DLL && a2 == 0xEA00000000006570)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 5;
    }
    else {
      return 6;
    }
  }
}

uint64_t specialized AboveTargetZoneModel.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<AboveTargetZoneModel.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type AboveTargetZoneModel.CodingKeys and conformance AboveTargetZoneModel.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  }
  char v28 = 0;
  lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  char v9 = v29;
  char v27 = 1;
  KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v11 = v10;
  char v26 = 2;
  uint64_t v12 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v14 = v13;
  uint64_t v20 = v12;
  char v25 = 3;
  swift_bridgeObjectRetain();
  int v19 = KeyedDecodingContainer.decode(_:forKey:)();
  char v23 = 4;
  lazy protocol witness table accessor for type VoiceFeedbackPaceFormat and conformance VoiceFeedbackPaceFormat();
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
  int v18 = v24;
  char v21 = 5;
  lazy protocol witness table accessor for type VoiceFeedbackMetricType and conformance VoiceFeedbackMetricType();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  char v15 = v19 & 1;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  char v16 = v22;
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  uint64_t result = swift_bridgeObjectRelease();
  *(unsigned char *)a2 = v9;
  *(void *)(a2 + 8) = v11;
  *(void *)(a2 + 16) = v20;
  *(void *)(a2 + 24) = v14;
  *(unsigned char *)(a2 + 32) = v15;
  *(unsigned char *)(a2 + 33) = v18;
  *(unsigned char *)(a2 + 34) = v16;
  return result;
}

unint64_t instantiation function for generic protocol witness table for AboveTargetZoneModel(void *a1)
{
  a1[1] = lazy protocol witness table accessor for type AboveTargetZoneModel and conformance AboveTargetZoneModel();
  a1[2] = lazy protocol witness table accessor for type AboveTargetZoneModel and conformance AboveTargetZoneModel();
  unint64_t result = lazy protocol witness table accessor for type AboveTargetZoneModel and conformance AboveTargetZoneModel();
  a1[3] = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type AboveTargetZoneModel and conformance AboveTargetZoneModel()
{
  unint64_t result = lazy protocol witness table cache variable for type AboveTargetZoneModel and conformance AboveTargetZoneModel;
  if (!lazy protocol witness table cache variable for type AboveTargetZoneModel and conformance AboveTargetZoneModel)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AboveTargetZoneModel and conformance AboveTargetZoneModel);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AboveTargetZoneModel and conformance AboveTargetZoneModel;
  if (!lazy protocol witness table cache variable for type AboveTargetZoneModel and conformance AboveTargetZoneModel)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AboveTargetZoneModel and conformance AboveTargetZoneModel);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type AboveTargetZoneModel and conformance AboveTargetZoneModel;
  if (!lazy protocol witness table cache variable for type AboveTargetZoneModel and conformance AboveTargetZoneModel)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type AboveTargetZoneModel and conformance AboveTargetZoneModel);
  }
  return result;
}

uint64_t initializeWithCopy for AboveTargetZoneModel(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(_WORD *)(a1 + 33) = *(_WORD *)(a2 + 33);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AboveTargetZoneModel(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(unsigned char *)(a1 + 33) = *(unsigned char *)(a2 + 33);
  *(unsigned char *)(a1 + 34) = *(unsigned char *)(a2 + 34);
  return a1;
}

__n128 __swift_memcpy35_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 31) = *(_DWORD *)(a2 + 31);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for AboveTargetZoneModel(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(_WORD *)(a1 + 33) = *(_WORD *)(a2 + 33);
  return a1;
}

uint64_t getEnumTagSinglePayload for AboveTargetZoneModel(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 35)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AboveTargetZoneModel(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 34) = 0;
    *(_WORD *)(result + 32) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 35) = 1;
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
    *(unsigned char *)(result + 35) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AboveTargetZoneModel()
{
  return &type metadata for AboveTargetZoneModel;
}

uint64_t getEnumTagSinglePayload for AboveTargetZoneModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
  if (a2 + 5 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 5) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
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
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AboveTargetZoneModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *__n128 result = a2 + 5;
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
        JUMPOUT(0x2619B0B98);
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
          *__n128 result = a2 + 5;
        break;
    }
  }
  return result;
}

void *type metadata accessor for AboveTargetZoneModel.CodingKeys()
{
  return &unk_270D9B748;
}

uint64_t outlined retain of AboveTargetZoneModel(uint64_t a1)
{
  return a1;
}

uint64_t outlined release of AboveTargetZoneModel(uint64_t a1)
{
  return a1;
}

uint64_t TimeSplitModel.alertType.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*TimeSplitModel.alertType.modify())()
{
  return closure #1 in default argument 1 of OutputGenerationManifest.init(dialogPhase:_:);
}

WorkoutAnnouncements::TimeSplitModel __swiftcall TimeSplitModel.init(duration:)(Swift::Double duration)
{
  WorkoutAnnouncements::VoiceFeedbackAlertType v1 = WorkoutAnnouncements_VoiceFeedbackAlertType_transitionedNotableTime;
  result.duration = duration;
  result.alertType = v1;
  return result;
}

BOOL static TimeSplitModel.__derived_struct_equals(_:_:)(char a1, char a2, double a3, double a4)
{
  return a3 == a4 && a1 == a2;
}

uint64_t TimeSplitModel.CodingKeys.stringValue.getter(char a1)
{
  if (a1) {
    return 0x6E6F697461727564;
  }
  else {
    return 0x7079547472656C61;
  }
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance TimeSplitModel.CodingKeys(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance TimeSplitModel.CodingKeys()
{
  return TimeSplitModel.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance TimeSplitModel.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized TimeSplitModel.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance TimeSplitModel.CodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance TimeSplitModel.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type TimeSplitModel.CodingKeys and conformance TimeSplitModel.CodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance TimeSplitModel.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type TimeSplitModel.CodingKeys and conformance TimeSplitModel.CodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t TimeSplitModel.encode(to:)(void *a1, char a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<TimeSplitModel.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type TimeSplitModel.CodingKeys and conformance TimeSplitModel.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  char v13 = a2;
  char v12 = 0;
  lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v2)
  {
    char v11 = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t lazy protocol witness table accessor for type TimeSplitModel.CodingKeys and conformance TimeSplitModel.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type TimeSplitModel.CodingKeys and conformance TimeSplitModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type TimeSplitModel.CodingKeys and conformance TimeSplitModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TimeSplitModel.CodingKeys and conformance TimeSplitModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type TimeSplitModel.CodingKeys and conformance TimeSplitModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type TimeSplitModel.CodingKeys and conformance TimeSplitModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TimeSplitModel.CodingKeys and conformance TimeSplitModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type TimeSplitModel.CodingKeys and conformance TimeSplitModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type TimeSplitModel.CodingKeys and conformance TimeSplitModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TimeSplitModel.CodingKeys and conformance TimeSplitModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type TimeSplitModel.CodingKeys and conformance TimeSplitModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type TimeSplitModel.CodingKeys and conformance TimeSplitModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TimeSplitModel.CodingKeys and conformance TimeSplitModel.CodingKeys);
  }
  return result;
}

double TimeSplitModel.init(from:)(void *a1)
{
  return specialized TimeSplitModel.init(from:)(a1);
}

void protocol witness for Decodable.init(from:) in conformance TimeSplitModel(void *a1@<X0>, uint64_t a2@<X8>)
{
  double v5 = specialized TimeSplitModel.init(from:)(a1);
  if (!v2)
  {
    *(unsigned char *)a2 = v4;
    *(double *)(a2 + 8) = v5;
  }
}

uint64_t protocol witness for Encodable.encode(to:) in conformance TimeSplitModel(void *a1)
{
  return TimeSplitModel.encode(to:)(a1, *v1);
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance TimeSplitModel(double *a1, double *a2)
{
  return *(unsigned __int8 *)a1 == *(unsigned __int8 *)a2 && a1[1] == a2[1];
}

uint64_t protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance TimeSplitModel(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = *(void *)(v1 + 8);
  return MEMORY[0x270FA2498](protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance TimeSplitModel, 0, 0);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v7;
  uint64_t v8;

  uint64_t v7 = *v2;
  char v4 = swift_task_dealloc();
  double v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    char v4 = a1;
  }
  return v5(v4);
}

uint64_t protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance TimeSplitModel()
{
  uint64_t v1 = *__swift_project_boxed_opaque_existential_1(*(void **)(v0 + 16), *(void *)(*(void *)(v0 + 16) + 24));
  double v5 = (uint64_t (*)(char, uint64_t, double))((char *)&async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.transitionedNotableTime(executeSashGroupOnWatch:_:)
                                                     + async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.transitionedNotableTime(executeSashGroupOnWatch:_:));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v2;
  *uint64_t v2 = v0;
  v2[1] = protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance TimeSplitModel;
  double v3 = *(double *)(v0 + 24);
  return v5(0, v1, v3);
}

uint64_t specialized TimeSplitModel.init(with:)(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  double v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(specialized Sequence.compactMap<A>(_:)(a1) + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<VoiceFeedbackKeys, Any>);
    uint64_t v6 = static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v6 = MEMORY[0x263F8EE80];
  }
  *(void *)&long long v27 = v6;
  uint64_t v7 = swift_bridgeObjectRetain();
  specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(v7, 1, &v27);
  swift_bridgeObjectRelease();
  uint64_t v8 = v27;
  uint64_t v9 = Logger.workout.unsafeMutableAddressor();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v9, v2);
  swift_retain_n();
  uint64_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    *(void *)&long long v27 = v24;
    *(_DWORD *)uint64_t v12 = 136315394;
    uint64_t v26 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0x696C7053656D6954, 0xEE006C65646F4D74, (uint64_t *)&v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v12 + 12) = 2080;
    v22[1] = v12 + 14;
    lazy protocol witness table accessor for type VoiceFeedbackKeys and conformance VoiceFeedbackKeys();
    uint64_t v23 = v2;
    swift_retain();
    uint64_t v25 = a1;
    uint64_t v13 = Dictionary.description.getter();
    uint64_t v14 = v3;
    unint64_t v16 = v15;
    swift_release();
    uint64_t v26 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v13, v16, (uint64_t *)&v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_261998000, v10, v11, "%s received VoiceFeedback dictionary: %s", (uint8_t *)v12, 0x16u);
    uint64_t v17 = v24;
    a1 = v25;
    swift_arrayDestroy();
    MEMORY[0x263E47E50](v17, -1, -1);
    MEMORY[0x263E47E50](v12, -1, -1);

    (*(void (**)(char *, uint64_t))(v14 + 8))(v5, v23);
    if (!*(void *)(v8 + 16)) {
      goto LABEL_10;
    }
  }
  else
  {

    swift_release_n();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    if (!*(void *)(v8 + 16)) {
      goto LABEL_10;
    }
  }
  unint64_t v18 = specialized __RawDictionaryStorage.find<A>(_:)(2);
  if (v19)
  {
    outlined init with copy of Any(*(void *)(v8 + 56) + 32 * v18, (uint64_t)&v27);
    goto LABEL_11;
  }
LABEL_10:
  long long v27 = 0u;
  long long v28 = 0u;
LABEL_11:
  swift_release();
  if (!*((void *)&v28 + 1))
  {
    swift_bridgeObjectRelease();
    outlined destroy of Any?((uint64_t)&v27);
    return 25;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    return 25;
  }
  BOOL v20 = specialized VoiceFeedbackAlerting.hasValidAlertType(in:)(a1, 0x15u);
  swift_bridgeObjectRelease();
  if (v20) {
    return 21;
  }
  else {
    return 25;
  }
}

uint64_t specialized TimeSplitModel.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x7079547472656C61 && a2 == 0xE900000000000065;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E6F697461727564 && a2 == 0xE800000000000000)
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

double specialized TimeSplitModel.init(from:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<TimeSplitModel.CodingKeys>);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  double v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type TimeSplitModel.CodingKeys and conformance TimeSplitModel.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  char v11 = 0;
  lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  char v10 = 1;
  KeyedDecodingContainer.decode(_:forKey:)();
  double v7 = v6;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  return v7;
}

unint64_t instantiation function for generic protocol witness table for TimeSplitModel(void *a1)
{
  a1[1] = lazy protocol witness table accessor for type TimeSplitModel and conformance TimeSplitModel();
  a1[2] = lazy protocol witness table accessor for type TimeSplitModel and conformance TimeSplitModel();
  unint64_t result = lazy protocol witness table accessor for type TimeSplitModel and conformance TimeSplitModel();
  a1[3] = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type TimeSplitModel and conformance TimeSplitModel()
{
  unint64_t result = lazy protocol witness table cache variable for type TimeSplitModel and conformance TimeSplitModel;
  if (!lazy protocol witness table cache variable for type TimeSplitModel and conformance TimeSplitModel)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TimeSplitModel and conformance TimeSplitModel);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type TimeSplitModel and conformance TimeSplitModel;
  if (!lazy protocol witness table cache variable for type TimeSplitModel and conformance TimeSplitModel)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TimeSplitModel and conformance TimeSplitModel);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type TimeSplitModel and conformance TimeSplitModel;
  if (!lazy protocol witness table cache variable for type TimeSplitModel and conformance TimeSplitModel)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TimeSplitModel and conformance TimeSplitModel);
  }
  return result;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for TimeSplitModel(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xE8 && a1[16]) {
    return (*(_DWORD *)a1 + 232);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 0x19;
  int v5 = v3 - 25;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for TimeSplitModel(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xE7)
  {
    *(void *)__n128 result = a2 - 232;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xE8) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0xE8) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(unsigned char *)__n128 result = a2 + 24;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TimeSplitModel()
{
  return &type metadata for TimeSplitModel;
}

uint64_t getEnumTagSinglePayload for TimeSplitModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for TimeSplitModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2619B1D50);
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

unsigned char *destructiveInjectEnumTag for TimeSplitModel.CodingKeys(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

void *type metadata accessor for TimeSplitModel.CodingKeys()
{
  return &unk_270D9B8A0;
}

uint64_t type metadata accessor for WorkoutRemindersCATs()
{
  uint64_t result = type metadata singleton initialization cache for WorkoutRemindersCATs;
  if (!type metadata singleton initialization cache for WorkoutRemindersCATs) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t type metadata completion function for WorkoutRemindersCATs()
{
  return swift_initClassMetadata2();
}

uint64_t WorkoutRemindersCATs.__allocating_init(templateDir:options:globals:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CATOption();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  BOOL v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x270FA5388](v8 - 8);
  char v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  outlined init with copy of URL?(a1, (uint64_t)v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  uint64_t v11 = CATWrapper.init(templateDir:options:globals:)();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  outlined destroy of URL?(a1);
  return v11;
}

uint64_t WorkoutRemindersCATs.__deallocating_deinit()
{
  uint64_t v0 = CATWrapper.deinit();
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t ObjC metadata update function for WorkoutRemindersCATs()
{
  return type metadata accessor for WorkoutRemindersCATs();
}

uint64_t outlined init with copy of URL?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of URL?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t *WorkoutReminderAnnouncementDirectInvocation.identifier.unsafeMutableAddressor()
{
  if (one-time initialization token for identifier != -1) {
    swift_once();
  }
  return &static WorkoutReminderAnnouncementDirectInvocation.identifier;
}

uint64_t WorkoutReminderAnnouncementDirectInvocation.init(directInvocation:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  specialized WorkoutReminderAnnouncementDirectInvocation.init(directInvocation:)(a1, v4);
  return outlined init with take of WorkoutReminderAnnouncementDirectInvocation?((uint64_t)v4, a2);
}

uint64_t one-time initialization function for identifier()
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  static WorkoutReminderAnnouncementDirectInvocation.identifier = result;
  *(void *)algn_26A9426A8 = v1;
  return result;
}

uint64_t static WorkoutReminderAnnouncementDirectInvocation.identifier.getter()
{
  if (one-time initialization token for identifier != -1) {
    swift_once();
  }
  uint64_t v0 = static WorkoutReminderAnnouncementDirectInvocation.identifier;
  swift_bridgeObjectRetain();
  return v0;
}

id AFSiriWorkoutReminder.init(data:)(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = self;
  specialized _dictionaryUpCast<A, B, C, D>(_:)(a1);
  swift_bridgeObjectRelease();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(v6, sel_workoutReminderFromPayload_, isa);

  if (v8)
  {
    uint64_t v9 = AFSiriWorkoutReminder.tryInferWorkoutType()();
    Swift::tuple_HKWorkoutActivityType_HKWorkoutSessionLocationType_HKWorkoutSwimmingLocationType v22 = AFSiriWorkoutReminder.tryInferWorkoutActivityLocationType()();
    HKWorkoutActivityType v10 = v22._0;
    HKWorkoutSessionLocationType v11 = v22._1;
    HKWorkoutSwimmingLocationType v12 = v22._2;
    id v13 = objc_msgSend(v8, sel_predictionIdentifier);
    if (!v13)
    {
      uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      id v13 = (id)MEMORY[0x263E47550](v14);
      swift_bridgeObjectRelease();
    }
    id v15 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithPredictionIdentifier_predictionType_workoutType_workoutActivityType_locationType_swimmingLocationType_, v13, objc_msgSend(v8, sel_predictionType), v9, v10, v11, v12);
  }
  else
  {
    uint64_t v16 = Logger.workout.unsafeMutableAddressor();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v16, v2);
    uint64_t v17 = Logger.logObject.getter();
    uint64_t v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v17, (os_log_type_t)v18))
    {
      char v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v19 = 0;
      _os_log_impl(&dword_261998000, v17, (os_log_type_t)v18, "Failed to parse workout reminder from payload.", v19, 2u);
      MEMORY[0x263E47E50](v19, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return 0;
  }
  return v15;
}

uint64_t AFSiriWorkoutReminder.tryInferWorkoutType()()
{
  uint64_t v1 = (uint64_t)objc_msgSend(v0, sel_workoutType);
  if (!objc_msgSend(v0, sel_workoutType))
  {
    uint64_t v1 = 4;
    switch((unint64_t)objc_msgSend(v0, sel_workoutActivityType))
    {
      case 0xDuLL:
        return 2 * (objc_msgSend(v0, sel_workoutLocationType) != (id)2);
      case 0x10uLL:
        return 3;
      case 0x23uLL:
        return v1;
      case 0x25uLL:
        BOOL v3 = objc_msgSend(v0, sel_workoutLocationType) == (id)2;
        uint64_t v4 = 5;
        goto LABEL_11;
      case 0x2EuLL:
        BOOL v3 = objc_msgSend(v0, sel_workoutSwimmingLocationType) == (id)1;
        uint64_t v4 = 7;
        goto LABEL_11;
      case 0x34uLL:
        BOOL v3 = objc_msgSend(v0, sel_workoutLocationType) == (id)2;
        uint64_t v4 = 9;
LABEL_11:
        if (v3) {
          return v4;
        }
        else {
          return v4 + 1;
        }
      default:
        return (uint64_t)objc_msgSend(v0, sel_workoutType);
    }
  }
  return v1;
}

Swift::tuple_HKWorkoutActivityType_HKWorkoutSessionLocationType_HKWorkoutSwimmingLocationType __swiftcall AFSiriWorkoutReminder.tryInferWorkoutActivityLocationType()()
{
  uint64_t v1 = v0;
  uint64_t v2 = (uint64_t)objc_msgSend(v0, sel_workoutActivityType);
  uint64_t v3 = (uint64_t)objc_msgSend(v0, sel_workoutLocationType);
  uint64_t v4 = (uint64_t)objc_msgSend(v0, sel_workoutSwimmingLocationType);
  if (!objc_msgSend(v1, sel_workoutActivityType))
  {
    uint64_t v4 = 0;
    uint64_t v2 = 13;
    uint64_t v3 = 2;
    switch((unint64_t)objc_msgSend(v1, sel_workoutType))
    {
      case 1uLL:
        break;
      case 2uLL:
        uint64_t v4 = 0;
        uint64_t v2 = 13;
        uint64_t v3 = 3;
        break;
      case 3uLL:
        uint64_t v4 = 0;
        uint64_t v2 = 16;
        uint64_t v3 = 1;
        break;
      case 4uLL:
        uint64_t v4 = 0;
        uint64_t v2 = 35;
        uint64_t v3 = 1;
        break;
      case 5uLL:
        uint64_t v4 = 0;
        uint64_t v2 = 37;
        uint64_t v3 = 2;
        break;
      case 6uLL:
        uint64_t v4 = 0;
        uint64_t v2 = 37;
        uint64_t v3 = 3;
        break;
      case 7uLL:
        uint64_t v2 = 46;
        uint64_t v4 = 1;
        uint64_t v3 = 1;
        break;
      case 8uLL:
        uint64_t v2 = 46;
        uint64_t v3 = 1;
        uint64_t v4 = 2;
        break;
      case 9uLL:
        uint64_t v4 = 0;
        uint64_t v2 = 52;
        uint64_t v3 = 2;
        break;
      case 0xAuLL:
        uint64_t v4 = 0;
        uint64_t v2 = 52;
        uint64_t v3 = 3;
        break;
      default:
        uint64_t v2 = (uint64_t)objc_msgSend(v1, sel_workoutActivityType);
        uint64_t v3 = (uint64_t)objc_msgSend(v1, sel_workoutLocationType);
        uint64_t v4 = (uint64_t)objc_msgSend(v1, sel_workoutSwimmingLocationType);
        break;
    }
  }
  HKWorkoutActivityType v5 = v2;
  HKWorkoutSessionLocationType v6 = v3;
  HKWorkoutSwimmingLocationType v7 = v4;
  result._2 = v7;
  result._1 = v6;
  result._0 = v5;
  return result;
}

uint64_t specialized WorkoutReminderAnnouncementDirectInvocation.init(directInvocation:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  id v8 = (char *)&v67 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  HKWorkoutSessionLocationType v11 = (char *)&v67 - v10;
  MEMORY[0x270FA5388](v9);
  id v13 = (char *)&v67 - v12;
  uint64_t v14 = Parse.DirectInvocation.identifier.getter();
  uint64_t v16 = v15;
  if (one-time initialization token for identifier != -1) {
    swift_once();
  }
  if (v14 == static WorkoutReminderAnnouncementDirectInvocation.identifier && v16 == *(void *)algn_26A9426A8)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v18 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v18 & 1) == 0)
    {
      uint64_t v19 = Logger.workout.unsafeMutableAddressor();
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v13, v19, v4);
      BOOL v20 = Logger.logObject.getter();
      os_log_type_t v21 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v20, v21))
      {
        uint64_t v68 = a1;
        Swift::tuple_HKWorkoutActivityType_HKWorkoutSessionLocationType_HKWorkoutSwimmingLocationType v22 = (uint8_t *)swift_slowAlloc();
        uint64_t v23 = swift_slowAlloc();
        v69[0] = v23;
        *(_DWORD *)Swift::tuple_HKWorkoutActivityType_HKWorkoutSessionLocationType_HKWorkoutSwimmingLocationType v22 = 136315138;
        uint64_t v72 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000002BLL, 0x80000002619D9F50, v69);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl(&dword_261998000, v20, v21, "%s does not support invocation identifier", v22, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x263E47E50](v23, -1, -1);
        MEMORY[0x263E47E50](v22, -1, -1);

        uint64_t v24 = type metadata accessor for Parse.DirectInvocation();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v24 - 8) + 8))(v68, v24);
      }
      else
      {

        uint64_t v44 = type metadata accessor for Parse.DirectInvocation();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v44 - 8) + 8))(a1, v44);
      }
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v13, v4);
      goto LABEL_26;
    }
  }
  uint64_t v25 = Parse.DirectInvocation.userData.getter();
  if (!v25)
  {
LABEL_21:
    uint64_t v36 = Logger.workout.unsafeMutableAddressor();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v36, v4);
    int v37 = Logger.logObject.getter();
    os_log_type_t v38 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v68 = v4;
      char v39 = (uint8_t *)swift_slowAlloc();
      uint64_t v40 = swift_slowAlloc();
      v69[0] = v40;
      *(_DWORD *)char v39 = 136315138;
      uint64_t v72 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000002BLL, 0x80000002619D9F50, v69);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_261998000, v37, v38, "%s Failed to deserialize invocation payload", v39, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x263E47E50](v40, -1, -1);
      MEMORY[0x263E47E50](v39, -1, -1);

      uint64_t v41 = type metadata accessor for Parse.DirectInvocation();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v41 - 8) + 8))(a1, v41);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v68);
    }
    else
    {

      uint64_t v43 = type metadata accessor for Parse.DirectInvocation();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v43 - 8) + 8))(a1, v43);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    }
LABEL_26:
    id v45 = 0;
    uint64_t v46 = 0;
    uint64_t v47 = 0;
    uint64_t v31 = 0;
    uint64_t v48 = 0;
    uint64_t v49 = 0;
    goto LABEL_27;
  }
  uint64_t v26 = v25;
  uint64_t v27 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (!*(void *)(v26 + 16) || (unint64_t v29 = specialized __RawDictionaryStorage.find<A>(_:)(v27, v28), (v30 & 1) == 0))
  {
    long long v70 = 0u;
    long long v71 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_20;
  }
  outlined init with copy of Any(*(void *)(v26 + 56) + 32 * v29, (uint64_t)&v70);
  swift_bridgeObjectRelease();
  if (!*((void *)&v71 + 1)) {
    goto LABEL_20;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_35:
    swift_bridgeObjectRelease();
    goto LABEL_21;
  }
  uint64_t v31 = LOBYTE(v69[0]);
  uint64_t v32 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (*(void *)(v26 + 16))
  {
    unint64_t v34 = specialized __RawDictionaryStorage.find<A>(_:)(v32, v33);
    if (v35)
    {
      outlined init with copy of Any(*(void *)(v26 + 56) + 32 * v34, (uint64_t)&v70);
    }
    else
    {
      long long v70 = 0u;
      long long v71 = 0u;
    }
  }
  else
  {
    long long v70 = 0u;
    long long v71 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v71 + 1))
  {
LABEL_20:
    swift_bridgeObjectRelease();
    outlined destroy of Any?((uint64_t)&v70);
    goto LABEL_21;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_35;
  }
  uint64_t v68 = a1;
  uint64_t v48 = v69[0];
  uint64_t v50 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (*(void *)(v26 + 16))
  {
    unint64_t v52 = specialized __RawDictionaryStorage.find<A>(_:)(v50, v51);
    if (v53)
    {
      outlined init with copy of Any(*(void *)(v26 + 56) + 32 * v52, (uint64_t)&v70);
    }
    else
    {
      long long v70 = 0u;
      long long v71 = 0u;
    }
  }
  else
  {
    long long v70 = 0u;
    long long v71 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((void *)&v71 + 1))
  {
    swift_bridgeObjectRelease();
    outlined destroy of Any?((uint64_t)&v70);
    a1 = v68;
    goto LABEL_21;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    a1 = v68;
    goto LABEL_21;
  }
  uint64_t v49 = v69[0];
  type metadata accessor for AFSiriWorkoutReminder();
  uint64_t v54 = swift_bridgeObjectRetain();
  id v55 = AFSiriWorkoutReminder.init(data:)(v54);
  if (!v55)
  {
    swift_bridgeObjectRelease();
    uint64_t v61 = Logger.workout.unsafeMutableAddressor();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v11, v61, v4);
    char v62 = Logger.logObject.getter();
    os_log_type_t v63 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v62, v63))
    {
      uint64_t v64 = (uint8_t *)swift_slowAlloc();
      uint64_t v65 = swift_slowAlloc();
      v69[0] = v65;
      *(_DWORD *)uint64_t v64 = 136315138;
      uint64_t v72 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD00000000000002BLL, 0x80000002619D9F50, v69);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_261998000, v62, v63, "%s Unable to create a workout reminder from the payload", v64, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x263E47E50](v65, -1, -1);
      MEMORY[0x263E47E50](v64, -1, -1);
    }

    uint64_t v66 = type metadata accessor for Parse.DirectInvocation();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v66 - 8) + 8))(v68, v66);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v11, v4);
    goto LABEL_26;
  }
  id v45 = v55;
  uint64_t v56 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (*(void *)(v26 + 16) && (unint64_t v58 = specialized __RawDictionaryStorage.find<A>(_:)(v56, v57), (v59 & 1) != 0))
  {
    outlined init with copy of Any(*(void *)(v26 + 56) + 32 * v58, (uint64_t)&v70);
  }
  else
  {
    long long v70 = 0u;
    long long v71 = 0u;
  }
  swift_bridgeObjectRelease();
  uint64_t v60 = type metadata accessor for Parse.DirectInvocation();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v60 - 8) + 8))(v68, v60);
  swift_bridgeObjectRelease();
  if (*((void *)&v71 + 1))
  {
    uint64_t result = swift_dynamicCast();
    uint64_t v46 = v69[0];
    uint64_t v47 = v69[1];
    if (!result)
    {
      uint64_t v46 = 0;
      uint64_t v47 = 0;
    }
  }
  else
  {
    uint64_t result = outlined destroy of Any?((uint64_t)&v70);
    uint64_t v46 = 0;
    uint64_t v47 = 0;
  }
LABEL_27:
  *a2 = v45;
  a2[1] = v46;
  a2[2] = v47;
  a2[3] = v31;
  a2[4] = v48;
  a2[5] = v49;
  return result;
}

uint64_t outlined init with take of WorkoutReminderAnnouncementDirectInvocation?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for WorkoutReminderAnnouncementDirectInvocation?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t destroy for WorkoutReminderAnnouncementDirectInvocation(id *a1)
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for WorkoutReminderAnnouncementDirectInvocation(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  id v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for WorkoutReminderAnnouncementDirectInvocation(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  return a1;
}

uint64_t assignWithTake for WorkoutReminderAnnouncementDirectInvocation(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  uint64_t v5 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v5;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for WorkoutReminderAnnouncementDirectInvocation(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WorkoutReminderAnnouncementDirectInvocation(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WorkoutReminderAnnouncementDirectInvocation()
{
  return &type metadata for WorkoutReminderAnnouncementDirectInvocation;
}

unint64_t type metadata accessor for AFSiriWorkoutReminder()
{
  unint64_t result = lazy cache variable for type metadata for AFSiriWorkoutReminder;
  if (!lazy cache variable for type metadata for AFSiriWorkoutReminder)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for AFSiriWorkoutReminder);
  }
  return result;
}

uint64_t _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSD4KeysVySSyp_G_20WorkoutAnnouncements013VoiceFeedbackD0OSgs5NeverOTg504_s20e15Announcements21gH60AlertingPAAE12hasValidKeys2inSbSDySSypG_tFZAA0cdH0OSgSSXEfU_Tf1cn_n(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (!v1) {
    return v2;
  }
  uint64_t v23 = MEMORY[0x263F8EE78];
  specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v1, 0);
  uint64_t v2 = v23;
  uint64_t result = specialized _NativeDictionary.startIndex.getter(a1);
  uint64_t v6 = result;
  uint64_t v7 = 0;
  uint64_t v8 = a1 + 64;
  int64_t v20 = v1;
  int v21 = v5;
  uint64_t v22 = a1 + 64;
  while ((v6 & 0x8000000000000000) == 0 && v6 < 1 << *(unsigned char *)(a1 + 32))
  {
    unint64_t v11 = (unint64_t)v6 >> 6;
    if ((*(void *)(v8 + 8 * ((unint64_t)v6 >> 6)) & (1 << v6)) == 0) {
      goto LABEL_23;
    }
    if (*(_DWORD *)(a1 + 36) != v5) {
      goto LABEL_24;
    }
    swift_bridgeObjectRetain();
    uint64_t result = specialized VoiceFeedbackKeys.init(rawValue:)();
    char v12 = result;
    unint64_t v14 = *(void *)(v23 + 16);
    unint64_t v13 = *(void *)(v23 + 24);
    if (v14 >= v13 >> 1) {
      uint64_t result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v13 > 1, v14 + 1, 1);
    }
    *(void *)(v23 + 16) = v14 + 1;
    *(unsigned char *)(v23 + v14 + 32) = v12;
    int64_t v9 = 1 << *(unsigned char *)(a1 + 32);
    if (v6 >= v9) {
      goto LABEL_25;
    }
    uint64_t v8 = a1 + 64;
    uint64_t v15 = *(void *)(v22 + 8 * v11);
    if ((v15 & (1 << v6)) == 0) {
      goto LABEL_26;
    }
    int v5 = v21;
    if (*(_DWORD *)(a1 + 36) != v21) {
      goto LABEL_27;
    }
    unint64_t v16 = v15 & (-2 << (v6 & 0x3F));
    if (v16)
    {
      int64_t v9 = __clz(__rbit64(v16)) | v6 & 0xFFFFFFFFFFFFFFC0;
      int64_t v10 = v20;
    }
    else
    {
      unint64_t v17 = v11 + 1;
      unint64_t v18 = (unint64_t)(v9 + 63) >> 6;
      int64_t v10 = v20;
      if (v11 + 1 < v18)
      {
        unint64_t v19 = *(void *)(v22 + 8 * v17);
        if (v19)
        {
LABEL_20:
          int64_t v9 = __clz(__rbit64(v19)) + (v17 << 6);
        }
        else
        {
          while (v18 - 2 != v11)
          {
            unint64_t v19 = *(void *)(a1 + 80 + 8 * v11++);
            if (v19)
            {
              unint64_t v17 = v11 + 1;
              goto LABEL_20;
            }
          }
        }
      }
    }
    ++v7;
    uint64_t v6 = v9;
    if (v7 == v10) {
      return v2;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

BOOL specialized VoiceFeedbackAlerting.hasValidAlertType(in:)(uint64_t a1)
{
  if (*(void *)(a1 + 16)
    && (uint64_t v2 = v1,
        unint64_t v4 = specialized __RawDictionaryStorage.find<A>(_:)(0x7079547472656C61, 0xE900000000000065),
        (v5 & 1) != 0)
    && (outlined init with copy of Any(*(void *)(a1 + 56) + 32 * v4, (uint64_t)v9), (swift_dynamicCast() & 1) != 0)
    && (unsigned __int8 v6 = specialized VoiceFeedbackAlertType.init(rawValue:)(v8), v6 != 25))
  {
    return *v2 == v6;
  }
  else
  {
    return 0;
  }
}

BOOL specialized VoiceFeedbackAlerting.hasValidAlertType(in:)(uint64_t a1, unsigned __int8 a2)
{
  if (!*(void *)(a1 + 16)) {
    return 0;
  }
  unint64_t v4 = specialized __RawDictionaryStorage.find<A>(_:)(0x7079547472656C61, 0xE900000000000065);
  if ((v5 & 1) == 0) {
    return 0;
  }
  outlined init with copy of Any(*(void *)(a1 + 56) + 32 * v4, (uint64_t)v10);
  if ((swift_dynamicCast() & 1) == 0) {
    return 0;
  }
  int v6 = specialized VoiceFeedbackAlertType.init(rawValue:)(v9);
  return v6 != 25 && v6 == a2;
}

uint64_t specialized VoiceFeedbackAlerting.hasValidAlertType(in:)(uint64_t a1, unsigned __int8 a2)
{
  if (!*(void *)(a1 + 16)) {
    return 0;
  }
  unint64_t v4 = specialized __RawDictionaryStorage.find<A>(_:)(0x7079547472656C61, 0xE900000000000065);
  if ((v5 & 1) == 0) {
    return 0;
  }
  outlined init with copy of Any(*(void *)(a1 + 56) + 32 * v4, (uint64_t)v10);
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    int v7 = specialized VoiceFeedbackAlertType.init(rawValue:)(v9);
    return v7 != 25 && v7 == a2;
  }
  return result;
}

Swift::Bool __swiftcall VoiceFeedbackAlerting.hasValidAlertType(in:)(Swift::OpaquePointer in)
{
  Swift::Bool result = *((void *)in._rawValue + 2)
        && (uint64_t v3 = v2,
            uint64_t v4 = v1,
            unint64_t v6 = specialized __RawDictionaryStorage.find<A>(_:)(0x7079547472656C61, 0xE900000000000065),
            (v7 & 1) != 0)
        && (outlined init with copy of Any(*((void *)in._rawValue + 7) + 32 * v6, (uint64_t)v11),
            (swift_dynamicCast() & 1) != 0)
        && (int v8 = specialized VoiceFeedbackAlertType.init(rawValue:)(v10), v8 != 25)
        && v8 == (*(unsigned __int8 (**)(uint64_t, uint64_t))(v3 + 32))(v4, v3);
  return result;
}

BOOL protocol witness for static VoiceFeedbackAlerting.hasValidKeys(in:) in conformance GoalCompletionModel()
{
  return specialized static VoiceFeedbackAlerting.hasValidKeys(in:)();
}

BOOL specialized static VoiceFeedbackAlerting.hasValidKeys(in:)()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  uint64_t valid = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSD4KeysVySSyp_G_20WorkoutAnnouncements013VoiceFeedbackD0OSgs5NeverOTg504_s20e15Announcements21gH60AlertingPAAE12hasValidKeys2inSbSDySSypG_tFZAA0cdH0OSgSSXEfU_Tf1cn_n(v0);
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(valid + 16);
  if (v2)
  {
    uint64_t v3 = (unsigned __int8 *)(valid + 32);
    uint64_t v4 = v2 - 1;
    do
    {
      int v6 = *v3++;
      int v5 = v6;
      BOOL v8 = v4-- != 0;
      BOOL v9 = v5 != 17;
    }
    while (v5 != 17 && v8);
  }
  else
  {
    BOOL v9 = 1;
  }
  swift_bridgeObjectRelease();
  return v9;
}

BOOL static VoiceFeedbackAlerting.hasValidKeys(in:)()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  uint64_t valid = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSD4KeysVySSyp_G_20WorkoutAnnouncements013VoiceFeedbackD0OSgs5NeverOTg504_s20e15Announcements21gH60AlertingPAAE12hasValidKeys2inSbSDySSypG_tFZAA0cdH0OSgSSXEfU_Tf1cn_n(v0);
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(valid + 16);
  if (v2)
  {
    uint64_t v3 = (unsigned __int8 *)(valid + 32);
    uint64_t v4 = v2 - 1;
    do
    {
      int v6 = *v3++;
      int v5 = v6;
      BOOL v8 = v4-- != 0;
      BOOL v9 = v5 != 17;
    }
    while (v5 != 17 && v8);
  }
  else
  {
    BOOL v9 = 1;
  }
  swift_bridgeObjectRelease();
  return v9;
}

BOOL protocol witness for VoiceFeedbackAlerting.hasValidAlertType(in:) in conformance GoalCompletionModel(uint64_t a1)
{
  return specialized VoiceFeedbackAlerting.hasValidAlertType(in:)(a1, *v1);
}

BOOL protocol witness for VoiceFeedbackAlerting.hasValidAlertType(in:) in conformance DistanceSplitModel(uint64_t a1)
{
  return specialized VoiceFeedbackAlerting.hasValidAlertType(in:)(a1);
}

BOOL protocol witness for VoiceFeedbackAlerting.hasValidAlertType(in:) in conformance AboveTargetZoneModel(uint64_t a1)
{
  return specialized VoiceFeedbackAlerting.hasValidAlertType(in:)(a1);
}

BOOL protocol witness for VoiceFeedbackAlerting.hasValidAlertType(in:) in conformance TimeSplitModel(uint64_t a1)
{
  return specialized VoiceFeedbackAlerting.hasValidAlertType(in:)(a1, *v1);
}

uint64_t protocol witness for VoiceFeedbackAlerting.hasValidAlertType(in:) in conformance BasicVoiceFeedbackAlerts(uint64_t a1)
{
  return specialized VoiceFeedbackAlerting.hasValidAlertType(in:)(a1, *v1);
}

BOOL protocol witness for VoiceFeedbackAlerting.hasValidAlertType(in:) in conformance SegmentModel(uint64_t a1)
{
  return specialized VoiceFeedbackAlerting.hasValidAlertType(in:)(a1, *v1);
}

BOOL protocol witness for VoiceFeedbackAlerting.hasValidAlertType(in:) in conformance UpcomingIntervalModel(uint64_t a1)
{
  return specialized VoiceFeedbackAlerting.hasValidAlertType(in:)(a1);
}

uint64_t specialized _NativeDictionary.startIndex.getter(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 80);
  if (v1)
  {
    uint64_t v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v1 = *(void *)(a1 + 88);
  if (v1)
  {
    uint64_t v2 = 192;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 4) {
    unint64_t v7 = 4;
  }
  unint64_t v8 = v7 - 4;
  BOOL v9 = (unint64_t *)(a1 + 96);
  uint64_t v2 = 192;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t PacerGoalCompletionModel.alertType.getter()
{
  return *v0;
}

uint64_t PacerGoalCompletionModel.alertType.setter(uint64_t result)
{
  *unint64_t v1 = result;
  return result;
}

uint64_t (*PacerGoalCompletionModel.alertType.modify())()
{
  return closure #1 in default argument 1 of OutputGenerationManifest.init(dialogPhase:_:);
}

void __swiftcall PacerGoalCompletionModel.init(magnitude:unit:duration:)(WorkoutAnnouncements::PacerGoalCompletionModel *__return_ptr retstr, Swift::Double magnitude, Swift::String unit, Swift::Double duration)
{
  retstr->alertType = WorkoutAnnouncements_VoiceFeedbackAlertType_pacerGoalCompletion;
  retstr->magnitude = magnitude;
  retstr->unit = unit;
  retstr->duration = duration;
}

uint64_t PacerGoalCompletionModel.CodingKeys.stringValue.getter(char a1)
{
  return *(void *)&aAlerttypmagnit_1[8 * a1];
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance PacerGoalCompletionModel.CodingKeys()
{
  return PacerGoalCompletionModel.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance PacerGoalCompletionModel.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized PacerGoalCompletionModel.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance PacerGoalCompletionModel.CodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance PacerGoalCompletionModel.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type PacerGoalCompletionModel.CodingKeys and conformance PacerGoalCompletionModel.CodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance PacerGoalCompletionModel.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type PacerGoalCompletionModel.CodingKeys and conformance PacerGoalCompletionModel.CodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t PacerGoalCompletionModel.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<PacerGoalCompletionModel.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type PacerGoalCompletionModel.CodingKeys and conformance PacerGoalCompletionModel.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v10[15] = *v3;
  v10[14] = 0;
  lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v2)
  {
    v10[13] = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
    v10[12] = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
    v10[11] = 3;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

double PacerGoalCompletionModel.init(from:)@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  specialized PacerGoalCompletionModel.init(from:)(a1, (uint64_t)v6);
  if (!v2)
  {
    double result = *(double *)v6;
    long long v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    *(void *)(a2 + 32) = v7;
  }
  return result;
}

double protocol witness for Decodable.init(from:) in conformance PacerGoalCompletionModel@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  specialized PacerGoalCompletionModel.init(from:)(a1, (uint64_t)v6);
  if (!v2)
  {
    double result = *(double *)v6;
    long long v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    *(void *)(a2 + 32) = v7;
  }
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance PacerGoalCompletionModel(void *a1)
{
  return PacerGoalCompletionModel.encode(to:)(a1);
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance PacerGoalCompletionModel(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a1 + 16);
  v5[0] = *(_OWORD *)a1;
  v5[1] = v2;
  uint64_t v6 = *(void *)(a1 + 32);
  long long v3 = *(_OWORD *)(a2 + 16);
  v7[0] = *(_OWORD *)a2;
  v7[1] = v3;
  uint64_t v8 = *(void *)(a2 + 32);
  return specialized static PacerGoalCompletionModel.__derived_struct_equals(_:_:)((double *)v5, (double *)v7);
}

uint64_t protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance PacerGoalCompletionModel(uint64_t a1)
{
  long long v3 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v2 + 32) = v3;
  *(void *)(v2 + 48) = *(void *)(v1 + 32);
  *(void *)(v2 + 56) = a1;
  return MEMORY[0x270FA2498](protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance PacerGoalCompletionModel, 0, 0);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v8;
  uint64_t v9;

  uint64_t v4 = *v2 + 16;
  uint64_t v8 = *v2;
  swift_task_dealloc();
  long long v5 = outlined release of AboveTargetZoneModel(v4);
  uint64_t v6 = *(uint64_t (**)(uint64_t))(v8 + 8);
  if (!v1) {
    long long v5 = a1;
  }
  return v6(v5);
}

uint64_t protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance PacerGoalCompletionModel()
{
  uint64_t v1 = *__swift_project_boxed_opaque_existential_1(*(void **)(v0 + 56), *(void *)(*(void *)(v0 + 56) + 24));
  outlined retain of AboveTargetZoneModel(v0 + 16);
  uint64_t v4 = (char *)&async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.pacerGoalCompletion(executeSashGroupOnWatch:_:)
     + async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.pacerGoalCompletion(executeSashGroupOnWatch:_:);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v2;
  *uint64_t v2 = v0;
  v2[1] = protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance PacerGoalCompletionModel;
  return ((uint64_t (*)(void, uint64_t, uint64_t))v4)(0, v1, v0 + 16);
}

uint64_t specialized PacerGoalCompletionModel.init(with:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(specialized Sequence.compactMap<A>(_:)(a1) + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<VoiceFeedbackKeys, Any>);
    uint64_t v8 = static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v8 = MEMORY[0x263F8EE80];
  }
  *(void *)&long long v40 = v8;
  uint64_t v9 = swift_bridgeObjectRetain();
  specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(v9, 1, &v40);
  swift_bridgeObjectRelease();
  uint64_t v10 = v40;
  uint64_t v11 = Logger.workout.unsafeMutableAddressor();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v11, v4);
  swift_retain_n();
  char v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v35 = swift_slowAlloc();
    *(void *)&long long v40 = v35;
    *(_DWORD *)uint64_t v14 = 136315394;
    uint64_t v37 = a1;
    uint64_t v38 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000018, 0x80000002619DA090, (uint64_t *)&v40);
    uint64_t v36 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v14 + 12) = 2080;
    v33[1] = v14 + 14;
    lazy protocol witness table accessor for type VoiceFeedbackKeys and conformance VoiceFeedbackKeys();
    uint64_t v34 = v4;
    swift_retain();
    uint64_t v15 = Dictionary.description.getter();
    unint64_t v16 = a2;
    unint64_t v18 = v17;
    swift_release();
    uint64_t v38 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v18, (uint64_t *)&v40);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    a2 = v16;
    a1 = v37;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_261998000, v12, v13, "%s received VoiceFeedback dictionary: %s", (uint8_t *)v14, 0x16u);
    uint64_t v19 = v35;
    swift_arrayDestroy();
    MEMORY[0x263E47E50](v19, -1, -1);
    MEMORY[0x263E47E50](v14, -1, -1);

    (*(void (**)(char *, uint64_t))(v36 + 8))(v7, v34);
    if (!*(void *)(v10 + 16)) {
      goto LABEL_16;
    }
  }
  else
  {

    swift_release_n();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    if (!*(void *)(v10 + 16))
    {
LABEL_16:
      swift_release();
      goto LABEL_17;
    }
  }
  unint64_t v20 = specialized __RawDictionaryStorage.find<A>(_:)(6);
  if ((v21 & 1) == 0) {
    goto LABEL_16;
  }
  outlined init with copy of Any(*(void *)(v10 + 56) + 32 * v20, (uint64_t)&v40);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_16;
  }
  if (!*(void *)(v10 + 16)) {
    goto LABEL_16;
  }
  uint64_t v22 = v38;
  unint64_t v23 = specialized __RawDictionaryStorage.find<A>(_:)(15);
  if ((v24 & 1) == 0) {
    goto LABEL_16;
  }
  outlined init with copy of Any(*(void *)(v10 + 56) + 32 * v23, (uint64_t)&v40);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_16;
  }
  uint64_t v26 = v38;
  uint64_t v25 = v39;
  if (*(void *)(v10 + 16) && (unint64_t v27 = specialized __RawDictionaryStorage.find<A>(_:)(2), (v28 & 1) != 0))
  {
    outlined init with copy of Any(*(void *)(v10 + 56) + 32 * v27, (uint64_t)&v40);
  }
  else
  {
    long long v40 = 0u;
    long long v41 = 0u;
  }
  swift_release();
  if (!*((void *)&v41 + 1))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = outlined destroy of Any?((uint64_t)&v40, &demangling cache variable for type metadata for Any?);
    goto LABEL_18;
  }
  if (swift_dynamicCast())
  {
    uint64_t v31 = v38;
    swift_bridgeObjectRetain();
    char v32 = specialized VoiceFeedbackAlerting.hasValidAlertType(in:)(a1, 8);
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if (v32)
    {
      uint64_t v30 = 8;
      goto LABEL_19;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
LABEL_17:
  uint64_t result = swift_bridgeObjectRelease();
LABEL_18:
  uint64_t v30 = 0;
  uint64_t v22 = 0;
  uint64_t v26 = 0;
  uint64_t v25 = 0;
  uint64_t v31 = 0;
LABEL_19:
  *a2 = v30;
  a2[1] = v22;
  a2[2] = v26;
  a2[3] = v25;
  a2[4] = v31;
  return result;
}

uint64_t specialized closure #1 in PacerGoalCompletionModel.executePattern(wrapper:)(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for DialogDuration.Builder();
  swift_allocObject();
  DialogDuration.Builder.init()();
  dispatch thunk of DialogDuration.Builder.withSecs(_:)();
  swift_release();
  uint64_t v9 = dispatch thunk of DialogDuration.Builder.build()();
  swift_release();
  swift_release();
  *a1 = v9;
  type metadata accessor for DialogLength.Builder();
  swift_allocObject();
  MEMORY[0x263E473C0]();
  dispatch thunk of DialogAbstractMeasurement.Builder.withValue(_:)();
  swift_release();
  String.toDialogUnit.getter(a2, a3);
  String.toSpeakableString.getter();
  swift_bridgeObjectRelease();
  uint64_t v10 = type metadata accessor for SpeakableString();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 0, 1, v10);
  dispatch thunk of DialogAbstractMeasurement.Builder.withUnits(_:)();
  swift_release();
  outlined destroy of Any?((uint64_t)v8, &demangling cache variable for type metadata for SpeakableString?);
  uint64_t v11 = dispatch thunk of DialogAbstractMeasurement.Builder.build()();
  swift_release();
  uint64_t result = swift_release();
  a1[2] = v11;
  return result;
}

BOOL specialized static PacerGoalCompletionModel.__derived_struct_equals(_:_:)(double *a1, double *a2)
{
  if (*(unsigned __int8 *)a1 != *(unsigned __int8 *)a2 || a1[1] != a2[1]) {
    return 0;
  }
  if (*((void *)a1 + 2) == *((void *)a2 + 2) && *((void *)a1 + 3) == *((void *)a2 + 3)) {
    return a1[4] == a2[4];
  }
  char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
  BOOL result = 0;
  if (v5) {
    return a1[4] == a2[4];
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type PacerGoalCompletionModel.CodingKeys and conformance PacerGoalCompletionModel.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type PacerGoalCompletionModel.CodingKeys and conformance PacerGoalCompletionModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type PacerGoalCompletionModel.CodingKeys and conformance PacerGoalCompletionModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PacerGoalCompletionModel.CodingKeys and conformance PacerGoalCompletionModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type PacerGoalCompletionModel.CodingKeys and conformance PacerGoalCompletionModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type PacerGoalCompletionModel.CodingKeys and conformance PacerGoalCompletionModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PacerGoalCompletionModel.CodingKeys and conformance PacerGoalCompletionModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type PacerGoalCompletionModel.CodingKeys and conformance PacerGoalCompletionModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type PacerGoalCompletionModel.CodingKeys and conformance PacerGoalCompletionModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PacerGoalCompletionModel.CodingKeys and conformance PacerGoalCompletionModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type PacerGoalCompletionModel.CodingKeys and conformance PacerGoalCompletionModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type PacerGoalCompletionModel.CodingKeys and conformance PacerGoalCompletionModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PacerGoalCompletionModel.CodingKeys and conformance PacerGoalCompletionModel.CodingKeys);
  }
  return result;
}

uint64_t specialized PacerGoalCompletionModel.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x7079547472656C61 && a2 == 0xE900000000000065;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x647574696E67616DLL && a2 == 0xE900000000000065 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1953066613 && a2 == 0xE400000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6E6F697461727564 && a2 == 0xE800000000000000)
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

uint64_t specialized PacerGoalCompletionModel.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<PacerGoalCompletionModel.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type PacerGoalCompletionModel.CodingKeys and conformance PacerGoalCompletionModel.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  }
  char v23 = 0;
  lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  char v9 = v24;
  char v22 = 1;
  KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v11 = v10;
  char v21 = 2;
  uint64_t v12 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v14 = v13;
  uint64_t v19 = v12;
  char v20 = 3;
  swift_bridgeObjectRetain();
  KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v16 = v15;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  uint64_t result = swift_bridgeObjectRelease();
  *(unsigned char *)a2 = v9;
  *(void *)(a2 + 8) = v11;
  *(void *)(a2 + 16) = v19;
  *(void *)(a2 + 24) = v14;
  *(void *)(a2 + 32) = v16;
  return result;
}

unint64_t instantiation function for generic protocol witness table for PacerGoalCompletionModel(void *a1)
{
  a1[1] = lazy protocol witness table accessor for type PacerGoalCompletionModel and conformance PacerGoalCompletionModel();
  a1[2] = lazy protocol witness table accessor for type PacerGoalCompletionModel and conformance PacerGoalCompletionModel();
  unint64_t result = lazy protocol witness table accessor for type PacerGoalCompletionModel and conformance PacerGoalCompletionModel();
  a1[3] = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type PacerGoalCompletionModel and conformance PacerGoalCompletionModel()
{
  unint64_t result = lazy protocol witness table cache variable for type PacerGoalCompletionModel and conformance PacerGoalCompletionModel;
  if (!lazy protocol witness table cache variable for type PacerGoalCompletionModel and conformance PacerGoalCompletionModel)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PacerGoalCompletionModel and conformance PacerGoalCompletionModel);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type PacerGoalCompletionModel and conformance PacerGoalCompletionModel;
  if (!lazy protocol witness table cache variable for type PacerGoalCompletionModel and conformance PacerGoalCompletionModel)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PacerGoalCompletionModel and conformance PacerGoalCompletionModel);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type PacerGoalCompletionModel and conformance PacerGoalCompletionModel;
  if (!lazy protocol witness table cache variable for type PacerGoalCompletionModel and conformance PacerGoalCompletionModel)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PacerGoalCompletionModel and conformance PacerGoalCompletionModel);
  }
  return result;
}

uint64_t initializeWithCopy for PacerGoalCompletionModel(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PacerGoalCompletionModel(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
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

uint64_t assignWithTake for PacerGoalCompletionModel(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for PacerGoalCompletionModel(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PacerGoalCompletionModel(uint64_t result, int a2, int a3)
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PacerGoalCompletionModel()
{
  return &type metadata for PacerGoalCompletionModel;
}

uint64_t getEnumTagSinglePayload for PacerGoalCompletionModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PacerGoalCompletionModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2619B53A4);
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

void *type metadata accessor for PacerGoalCompletionModel.CodingKeys()
{
  return &unk_270D9BA90;
}

uint64_t BasicVoiceFeedbackAlerts.alertType.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*BasicVoiceFeedbackAlerts.alertType.modify())()
{
  return closure #1 in default argument 1 of OutputGenerationManifest.init(dialogPhase:_:);
}

char *BasicVoiceFeedbackAlerts.exerciseRingCompleted.unsafeMutableAddressor()
{
  return &static BasicVoiceFeedbackAlerts.exerciseRingCompleted;
}

uint64_t static BasicVoiceFeedbackAlerts.exerciseRingCompleted.getter()
{
  return static BasicVoiceFeedbackAlerts.exerciseRingCompleted;
}

uint64_t static BasicVoiceFeedbackAlerts.exerciseRingCompleted.setter(char a1)
{
  uint64_t result = swift_beginAccess();
  static BasicVoiceFeedbackAlerts.exerciseRingCompleted = a1;
  return result;
}

uint64_t (*static BasicVoiceFeedbackAlerts.exerciseRingCompleted.modify())()
{
  return static BasicVoiceFeedbackAlerts.exerciseRingCompleted.modify;
}

char *BasicVoiceFeedbackAlerts.intervalEnded.unsafeMutableAddressor()
{
  return &static BasicVoiceFeedbackAlerts.intervalEnded;
}

uint64_t static BasicVoiceFeedbackAlerts.intervalEnded.getter()
{
  return static BasicVoiceFeedbackAlerts.intervalEnded;
}

uint64_t static BasicVoiceFeedbackAlerts.intervalEnded.setter(char a1)
{
  uint64_t result = swift_beginAccess();
  static BasicVoiceFeedbackAlerts.intervalEnded = a1;
  return result;
}

uint64_t (*static BasicVoiceFeedbackAlerts.intervalEnded.modify())()
{
  return static BasicVoiceFeedbackAlerts.exerciseRingCompleted.modify;
}

char *BasicVoiceFeedbackAlerts.moveRingCompleted.unsafeMutableAddressor()
{
  return &static BasicVoiceFeedbackAlerts.moveRingCompleted;
}

uint64_t static BasicVoiceFeedbackAlerts.moveRingCompleted.getter()
{
  return static BasicVoiceFeedbackAlerts.moveRingCompleted;
}

uint64_t static BasicVoiceFeedbackAlerts.moveRingCompleted.setter(char a1)
{
  uint64_t result = swift_beginAccess();
  static BasicVoiceFeedbackAlerts.moveRingCompleted = a1;
  return result;
}

uint64_t (*static BasicVoiceFeedbackAlerts.moveRingCompleted.modify())()
{
  return static BasicVoiceFeedbackAlerts.exerciseRingCompleted.modify;
}

char *BasicVoiceFeedbackAlerts.raceAheadOfGhost.unsafeMutableAddressor()
{
  return &static BasicVoiceFeedbackAlerts.raceAheadOfGhost;
}

uint64_t static BasicVoiceFeedbackAlerts.raceAheadOfGhost.getter()
{
  return static BasicVoiceFeedbackAlerts.raceAheadOfGhost;
}

uint64_t static BasicVoiceFeedbackAlerts.raceAheadOfGhost.setter(char a1)
{
  uint64_t result = swift_beginAccess();
  static BasicVoiceFeedbackAlerts.raceAheadOfGhost = a1;
  return result;
}

uint64_t (*static BasicVoiceFeedbackAlerts.raceAheadOfGhost.modify())()
{
  return static BasicVoiceFeedbackAlerts.exerciseRingCompleted.modify;
}

char *BasicVoiceFeedbackAlerts.raceBehindGhost.unsafeMutableAddressor()
{
  return &static BasicVoiceFeedbackAlerts.raceBehindGhost;
}

uint64_t static BasicVoiceFeedbackAlerts.raceBehindGhost.getter()
{
  return static BasicVoiceFeedbackAlerts.raceBehindGhost;
}

uint64_t static BasicVoiceFeedbackAlerts.raceBehindGhost.setter(char a1)
{
  uint64_t result = swift_beginAccess();
  static BasicVoiceFeedbackAlerts.raceBehindGhost = a1;
  return result;
}

uint64_t (*static BasicVoiceFeedbackAlerts.raceBehindGhost.modify())()
{
  return static BasicVoiceFeedbackAlerts.exerciseRingCompleted.modify;
}

char *BasicVoiceFeedbackAlerts.raceExpired.unsafeMutableAddressor()
{
  return &static BasicVoiceFeedbackAlerts.raceExpired;
}

uint64_t static BasicVoiceFeedbackAlerts.raceExpired.getter()
{
  return static BasicVoiceFeedbackAlerts.raceExpired;
}

uint64_t static BasicVoiceFeedbackAlerts.raceExpired.setter(char a1)
{
  uint64_t result = swift_beginAccess();
  static BasicVoiceFeedbackAlerts.raceExpired = a1;
  return result;
}

uint64_t (*static BasicVoiceFeedbackAlerts.raceExpired.modify())()
{
  return static BasicVoiceFeedbackAlerts.raceExpired.modify;
}

char *BasicVoiceFeedbackAlerts.raceOffRoute.unsafeMutableAddressor()
{
  return &static BasicVoiceFeedbackAlerts.raceOffRoute;
}

uint64_t static BasicVoiceFeedbackAlerts.raceOffRoute.getter()
{
  return static BasicVoiceFeedbackAlerts.raceOffRoute;
}

uint64_t static BasicVoiceFeedbackAlerts.raceOffRoute.setter(char a1)
{
  uint64_t result = swift_beginAccess();
  static BasicVoiceFeedbackAlerts.raceOffRoute = a1;
  return result;
}

uint64_t (*static BasicVoiceFeedbackAlerts.raceOffRoute.modify())()
{
  return static BasicVoiceFeedbackAlerts.exerciseRingCompleted.modify;
}

char *BasicVoiceFeedbackAlerts.raceOnRoute.unsafeMutableAddressor()
{
  return &static BasicVoiceFeedbackAlerts.raceOnRoute;
}

uint64_t static BasicVoiceFeedbackAlerts.raceOnRoute.getter()
{
  return static BasicVoiceFeedbackAlerts.raceOnRoute;
}

uint64_t static BasicVoiceFeedbackAlerts.raceOnRoute.setter(char a1)
{
  uint64_t result = swift_beginAccess();
  static BasicVoiceFeedbackAlerts.raceOnRoute = a1;
  return result;
}

uint64_t (*static BasicVoiceFeedbackAlerts.raceOnRoute.modify())()
{
  return static BasicVoiceFeedbackAlerts.exerciseRingCompleted.modify;
}

char *BasicVoiceFeedbackAlerts.raceRouteCompletedRaceLost.unsafeMutableAddressor()
{
  return &static BasicVoiceFeedbackAlerts.raceRouteCompletedRaceLost;
}

uint64_t static BasicVoiceFeedbackAlerts.raceRouteCompletedRaceLost.getter()
{
  return static BasicVoiceFeedbackAlerts.raceRouteCompletedRaceLost;
}

uint64_t static BasicVoiceFeedbackAlerts.raceRouteCompletedRaceLost.setter(char a1)
{
  uint64_t result = swift_beginAccess();
  static BasicVoiceFeedbackAlerts.raceRouteCompletedRaceLost = a1;
  return result;
}

uint64_t (*static BasicVoiceFeedbackAlerts.raceRouteCompletedRaceLost.modify())()
{
  return static BasicVoiceFeedbackAlerts.exerciseRingCompleted.modify;
}

char *BasicVoiceFeedbackAlerts.raceRouteCompleteRaceWon.unsafeMutableAddressor()
{
  return &static BasicVoiceFeedbackAlerts.raceRouteCompleteRaceWon;
}

uint64_t static BasicVoiceFeedbackAlerts.raceRouteCompleteRaceWon.getter()
{
  return static BasicVoiceFeedbackAlerts.raceRouteCompleteRaceWon;
}

uint64_t static BasicVoiceFeedbackAlerts.raceRouteCompleteRaceWon.setter(char a1)
{
  uint64_t result = swift_beginAccess();
  static BasicVoiceFeedbackAlerts.raceRouteCompleteRaceWon = a1;
  return result;
}

uint64_t (*static BasicVoiceFeedbackAlerts.raceRouteCompleteRaceWon.modify())()
{
  return static BasicVoiceFeedbackAlerts.exerciseRingCompleted.modify;
}

char *BasicVoiceFeedbackAlerts.trackStatusChanged.unsafeMutableAddressor()
{
  return &static BasicVoiceFeedbackAlerts.trackStatusChanged;
}

uint64_t static BasicVoiceFeedbackAlerts.trackStatusChanged.getter()
{
  return static BasicVoiceFeedbackAlerts.trackStatusChanged;
}

uint64_t static BasicVoiceFeedbackAlerts.trackStatusChanged.setter(char a1)
{
  uint64_t result = swift_beginAccess();
  static BasicVoiceFeedbackAlerts.trackStatusChanged = a1;
  return result;
}

uint64_t (*static BasicVoiceFeedbackAlerts.trackStatusChanged.modify())()
{
  return static BasicVoiceFeedbackAlerts.exerciseRingCompleted.modify;
}

char *BasicVoiceFeedbackAlerts.workoutPaused.unsafeMutableAddressor()
{
  return &static BasicVoiceFeedbackAlerts.workoutPaused;
}

uint64_t static BasicVoiceFeedbackAlerts.workoutPaused.getter()
{
  return static BasicVoiceFeedbackAlerts.workoutPaused;
}

uint64_t static BasicVoiceFeedbackAlerts.workoutPaused.setter(char a1)
{
  uint64_t result = swift_beginAccess();
  static BasicVoiceFeedbackAlerts.workoutPaused = a1;
  return result;
}

uint64_t (*static BasicVoiceFeedbackAlerts.workoutPaused.modify())()
{
  return static BasicVoiceFeedbackAlerts.exerciseRingCompleted.modify;
}

char *BasicVoiceFeedbackAlerts.workoutResumed.unsafeMutableAddressor()
{
  return &static BasicVoiceFeedbackAlerts.workoutResumed;
}

uint64_t static BasicVoiceFeedbackAlerts.workoutResumed.getter()
{
  return static BasicVoiceFeedbackAlerts.workoutResumed;
}

uint64_t static BasicVoiceFeedbackAlerts.workoutResumed.setter(char a1)
{
  uint64_t result = swift_beginAccess();
  static BasicVoiceFeedbackAlerts.workoutResumed = a1;
  return result;
}

uint64_t (*static BasicVoiceFeedbackAlerts.workoutResumed.modify())()
{
  return static BasicVoiceFeedbackAlerts.exerciseRingCompleted.modify;
}

BOOL static BasicVoiceFeedbackAlerts.__derived_struct_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance BasicVoiceFeedbackAlerts.CodingKeys()
{
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance BasicVoiceFeedbackAlerts.CodingKeys()
{
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance BasicVoiceFeedbackAlerts.CodingKeys()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance BasicVoiceFeedbackAlerts.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized BasicVoiceFeedbackAlerts.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result & 1;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance BasicVoiceFeedbackAlerts.CodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance BasicVoiceFeedbackAlerts.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type BasicVoiceFeedbackAlerts.CodingKeys and conformance BasicVoiceFeedbackAlerts.CodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance BasicVoiceFeedbackAlerts.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type BasicVoiceFeedbackAlerts.CodingKeys and conformance BasicVoiceFeedbackAlerts.CodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t BasicVoiceFeedbackAlerts.encode(to:)(void *a1, char a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<BasicVoiceFeedbackAlerts.CodingKeys>);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  BOOL v7 = &v9[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type BasicVoiceFeedbackAlerts.CodingKeys and conformance BasicVoiceFeedbackAlerts.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v9[15] = a2;
  lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t lazy protocol witness table accessor for type BasicVoiceFeedbackAlerts.CodingKeys and conformance BasicVoiceFeedbackAlerts.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type BasicVoiceFeedbackAlerts.CodingKeys and conformance BasicVoiceFeedbackAlerts.CodingKeys;
  if (!lazy protocol witness table cache variable for type BasicVoiceFeedbackAlerts.CodingKeys and conformance BasicVoiceFeedbackAlerts.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BasicVoiceFeedbackAlerts.CodingKeys and conformance BasicVoiceFeedbackAlerts.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type BasicVoiceFeedbackAlerts.CodingKeys and conformance BasicVoiceFeedbackAlerts.CodingKeys;
  if (!lazy protocol witness table cache variable for type BasicVoiceFeedbackAlerts.CodingKeys and conformance BasicVoiceFeedbackAlerts.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BasicVoiceFeedbackAlerts.CodingKeys and conformance BasicVoiceFeedbackAlerts.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type BasicVoiceFeedbackAlerts.CodingKeys and conformance BasicVoiceFeedbackAlerts.CodingKeys;
  if (!lazy protocol witness table cache variable for type BasicVoiceFeedbackAlerts.CodingKeys and conformance BasicVoiceFeedbackAlerts.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BasicVoiceFeedbackAlerts.CodingKeys and conformance BasicVoiceFeedbackAlerts.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type BasicVoiceFeedbackAlerts.CodingKeys and conformance BasicVoiceFeedbackAlerts.CodingKeys;
  if (!lazy protocol witness table cache variable for type BasicVoiceFeedbackAlerts.CodingKeys and conformance BasicVoiceFeedbackAlerts.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BasicVoiceFeedbackAlerts.CodingKeys and conformance BasicVoiceFeedbackAlerts.CodingKeys);
  }
  return result;
}

void *BasicVoiceFeedbackAlerts.init(from:)(void *a1)
{
  return specialized BasicVoiceFeedbackAlerts.init(from:)(a1);
}

void *protocol witness for Decodable.init(from:) in conformance BasicVoiceFeedbackAlerts@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = specialized BasicVoiceFeedbackAlerts.init(from:)(a1);
  if (!v2) {
    *a2 = (_BYTE)result;
  }
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance BasicVoiceFeedbackAlerts(void *a1)
{
  return BasicVoiceFeedbackAlerts.encode(to:)(a1, *v1);
}

uint64_t specialized BasicVoiceFeedbackAlerts.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x7079547472656C61 && a2 == 0xE900000000000065)
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

uint64_t specialized BasicVoiceFeedbackAlerts.CodingKeys.stringValue.getter()
{
  return 0x7079547472656C61;
}

void *specialized BasicVoiceFeedbackAlerts.init(from:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<BasicVoiceFeedbackAlerts.CodingKeys>);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  BOOL v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type BasicVoiceFeedbackAlerts.CodingKeys and conformance BasicVoiceFeedbackAlerts.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  }
  else
  {
    lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
    BOOL v7 = (void *)v9[15];
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  }
  return v7;
}

unint64_t instantiation function for generic protocol witness table for BasicVoiceFeedbackAlerts(void *a1)
{
  a1[1] = lazy protocol witness table accessor for type BasicVoiceFeedbackAlerts and conformance BasicVoiceFeedbackAlerts();
  a1[2] = lazy protocol witness table accessor for type BasicVoiceFeedbackAlerts and conformance BasicVoiceFeedbackAlerts();
  unint64_t result = lazy protocol witness table accessor for type BasicVoiceFeedbackAlerts and conformance BasicVoiceFeedbackAlerts();
  a1[3] = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type BasicVoiceFeedbackAlerts and conformance BasicVoiceFeedbackAlerts()
{
  unint64_t result = lazy protocol witness table cache variable for type BasicVoiceFeedbackAlerts and conformance BasicVoiceFeedbackAlerts;
  if (!lazy protocol witness table cache variable for type BasicVoiceFeedbackAlerts and conformance BasicVoiceFeedbackAlerts)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BasicVoiceFeedbackAlerts and conformance BasicVoiceFeedbackAlerts);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type BasicVoiceFeedbackAlerts and conformance BasicVoiceFeedbackAlerts;
  if (!lazy protocol witness table cache variable for type BasicVoiceFeedbackAlerts and conformance BasicVoiceFeedbackAlerts)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BasicVoiceFeedbackAlerts and conformance BasicVoiceFeedbackAlerts);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type BasicVoiceFeedbackAlerts and conformance BasicVoiceFeedbackAlerts;
  if (!lazy protocol witness table cache variable for type BasicVoiceFeedbackAlerts and conformance BasicVoiceFeedbackAlerts)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BasicVoiceFeedbackAlerts and conformance BasicVoiceFeedbackAlerts);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for BasicVoiceFeedbackAlerts(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 24 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 24) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xE8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xE7)
  {
    unsigned int v6 = ((a2 - 232) >> 8) + 1;
    *unint64_t result = a2 + 24;
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
        JUMPOUT(0x2619B68C4);
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
          *unint64_t result = a2 + 24;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BasicVoiceFeedbackAlerts()
{
  return &type metadata for BasicVoiceFeedbackAlerts;
}

uint64_t getEnumTagSinglePayload for BasicVoiceFeedbackAlerts.CodingKeys(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for BasicVoiceFeedbackAlerts.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x2619B69ECLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t getEnumTag for BasicVoiceFeedbackAlerts.CodingKeys()
{
  return 0;
}

void *type metadata accessor for BasicVoiceFeedbackAlerts.CodingKeys()
{
  return &unk_270D9BBD8;
}

uint64_t specialized == infix<A>(_:_:)(char a1, char a2)
{
  if (*(void *)&aAccept_1[8 * a1] == *(void *)&aAccept_1[8 * a2]
    && *(void *)&aMutefort[8 * a1 + 8] == *(void *)&aMutefort[8 * a2 + 8])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
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

Swift::Int specialized RawRepresentable<>._rawHashValue(seed:)()
{
  return Hasher._finalize()();
}

id WorkoutReminderControlsDirectInvocation.asStartLocalRequest(device:)(void *a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for Parse.DirectInvocation();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = objc_allocWithZone(MEMORY[0x263F70030]);
  uint64_t v13 = (void *)MEMORY[0x263E47550](0xD00000000000003ELL, 0x80000002619DC190);
  id v14 = objc_msgSend(v12, sel_initWithIdentifier_, v13);

  WorkoutReminderControlsDirectInvocation.asDirectInvocation()(a2, a3, a4);
  Class isa = (void *)Parse.DirectInvocation.userData.getter();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  if (isa)
  {
    specialized _dictionaryUpCast<A, B, C, D>(_:)((uint64_t)isa);
    swift_bridgeObjectRelease();
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  objc_msgSend(v14, sel_setUserData_, isa);

  uint64_t v16 = self;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  unint64_t v17 = (void *)DeviceState.asInvocationContext.getter();
  id v18 = objc_msgSend(v16, sel_runSiriKitExecutorCommandWithContext_payload_, v17, v14);

  id v19 = objc_msgSend(v16, sel_wrapCommandInStartLocalRequest_, v18);
  return v19;
}

uint64_t specialized _dictionaryUpCast<A, B, C, D>(_:)(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<AnyHashable, Any>);
    uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE80];
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = v2 + 64;
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v28 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v28 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v28 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    unint64_t v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    outlined init with copy of Any(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    outlined init with take of Any(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    outlined init with take of Any(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    outlined init with take of Any(v36, v37);
    outlined init with take of Any(v37, &v33);
    uint64_t result = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));
    uint64_t v20 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v6 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v21) & ~*(void *)(v6 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v6 + 8 * v22);
      }
      while (v26 == -1);
      unint64_t v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    uint64_t v10 = *(void *)(v2 + 48) + 40 * v9;
    *(_OWORD *)uint64_t v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(void *)(v10 + 32) = v31;
    uint64_t result = (uint64_t)outlined init with take of Any(&v33, (_OWORD *)(*(void *)(v2 + 56) + 32 * v9));
    ++*(void *)(v2 + 16);
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    outlined consume of [String : Any].Iterator._Variant();
    return v2;
  }
  unint64_t v14 = *(void *)(v28 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

void *WorkoutReminderControlsDirectInvocation.identifier.unsafeMutableAddressor()
{
  return &static WorkoutReminderControlsDirectInvocation.identifier;
}

unint64_t static WorkoutReminderControlsDirectInvocation.identifier.getter()
{
  return 0xD00000000000003ELL;
}

void *static WorkoutReminderControlsDirectInvocation.Action.allCases.getter()
{
  return &outlined read-only object #0 of static WorkoutReminderControlsDirectInvocation.Action.allCases.getter;
}

uint64_t WorkoutReminderControlsDirectInvocation.Action.rawValue.getter(char a1)
{
  return *(void *)&aAccept_1[8 * a1];
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance WorkoutReminderControlsDirectInvocation.Action(char *a1, char *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance WorkoutReminderControlsDirectInvocation.Action()
{
  return specialized RawRepresentable<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance WorkoutReminderControlsDirectInvocation.Action()
{
  return specialized RawRepresentable<>.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance WorkoutReminderControlsDirectInvocation.Action()
{
  return specialized RawRepresentable<>._rawHashValue(seed:)();
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance WorkoutReminderControlsDirectInvocation.Action@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = specialized WorkoutReminderControlsDirectInvocation.Action.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance WorkoutReminderControlsDirectInvocation.Action@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = WorkoutReminderControlsDirectInvocation.Action.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void protocol witness for static CaseIterable.allCases.getter in conformance WorkoutReminderControlsDirectInvocation.Action(void *a1@<X8>)
{
  *a1 = &outlined read-only object #0 of protocol witness for static CaseIterable.allCases.getter in conformance WorkoutReminderControlsDirectInvocation.Action;
}

uint64_t WorkoutReminderControlsDirectInvocation.init(directInvocation:)(char *a1)
{
  uint64_t v2 = type metadata accessor for Parse.DirectInvocation();
  uint64_t v69 = *(void *)(v2 - 8);
  uint64_t v70 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v65 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  unint64_t v9 = (char *)&v65 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  unint64_t v12 = (char *)&v65 - v11;
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  int64_t v15 = (char *)&v65 - v14;
  MEMORY[0x270FA5388](v13);
  unint64_t v17 = (char *)&v65 - v16;
  if (Parse.DirectInvocation.identifier.getter() == 0xD00000000000003ELL && v18 == 0x80000002619DC190)
  {
    uint64_t v19 = a1;
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v19 = a1;
    char v20 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v20 & 1) == 0)
    {
      uint64_t v37 = Logger.workout.unsafeMutableAddressor();
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v37, v5);
      uint64_t v38 = v69;
      long long v39 = v19;
      long long v40 = v19;
      uint64_t v41 = v70;
      (*(void (**)(char *, char *, uint64_t))(v69 + 16))(v4, v40, v70);
      double v42 = Logger.logObject.getter();
      os_log_type_t v43 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v42, v43))
      {
        uint64_t v44 = swift_slowAlloc();
        uint64_t v68 = v39;
        uint64_t v45 = v38;
        uint64_t v46 = v44;
        uint64_t v66 = swift_slowAlloc();
        v71._uint64_t countAndFlagsBits = v66;
        *(_DWORD *)uint64_t v46 = 136315394;
        uint64_t v74 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000027, 0x80000002619DA440, &v71._countAndFlagsBits);
        uint64_t v67 = v5;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *(_WORD *)(v46 + 12) = 2080;
        uint64_t v47 = Parse.DirectInvocation.identifier.getter();
        uint64_t v74 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v47, v48, &v71._countAndFlagsBits);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        uint64_t v49 = *(void (**)(char *, uint64_t))(v45 + 8);
        uint64_t v50 = v70;
        v49(v4, v70);
        _os_log_impl(&dword_261998000, v42, v43, "Unsupported identifier for %s: %s", (uint8_t *)v46, 0x16u);
        uint64_t v51 = v66;
        swift_arrayDestroy();
        MEMORY[0x263E47E50](v51, -1, -1);
        MEMORY[0x263E47E50](v46, -1, -1);

        v49(v68, v50);
        (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v67);
      }
      else
      {

        unint64_t v52 = *(void (**)(char *, uint64_t))(v38 + 8);
        v52(v4, v41);
        v52(v39, v41);
        (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
      }
      return 0;
    }
  }
  uint64_t v21 = Parse.DirectInvocation.userData.getter();
  if (v21)
  {
    uint64_t v22 = v21;
    if (*(void *)(v21 + 16)
      && (unint64_t v23 = specialized __RawDictionaryStorage.find<A>(_:)(0x6E6F69746361, 0xE600000000000000), (v24 & 1) != 0)
      && (outlined init with copy of Any(*(void *)(v22 + 56) + 32 * v23, (uint64_t)&v72), (swift_dynamicCast() & 1) != 0)
      && (unsigned __int8 v25 = specialized WorkoutReminderControlsDirectInvocation.Action.init(rawValue:)(v71), v25 != 4))
    {
      unsigned __int8 v53 = v25;
      if (*(void *)(v22 + 16)
        && (unint64_t v54 = specialized __RawDictionaryStorage.find<A>(_:)(0x696669746E656469, 0xEA00000000007265),
            (v55 & 1) != 0))
      {
        outlined init with copy of Any(*(void *)(v22 + 56) + 32 * v54, (uint64_t)&v72);
      }
      else
      {
        long long v72 = 0u;
        long long v73 = 0u;
      }
      swift_bridgeObjectRelease();
      if (*((void *)&v73 + 1))
      {
        if (swift_dynamicCast()) {
          object = v71._object;
        }
        else {
          object = 0;
        }
      }
      else
      {
        outlined destroy of Any?((uint64_t)&v72);
        object = 0;
      }
      switch(v53)
      {
        case 3u:
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          goto LABEL_36;
        default:
          char v57 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          if ((v57 & 1) != 0 || object)
          {
LABEL_36:
            (*(void (**)(char *, uint64_t))(v69 + 8))(v19, v70);
            swift_bridgeObjectRelease();
            return v53;
          }
          uint64_t v58 = Logger.workout.unsafeMutableAddressor();
          swift_beginAccess();
          (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v15, v58, v5);
          char v59 = Logger.logObject.getter();
          os_log_type_t v60 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v59, v60))
          {
            uint64_t v61 = swift_slowAlloc();
            uint64_t v67 = swift_slowAlloc();
            v71._uint64_t countAndFlagsBits = v67;
            *(_DWORD *)uint64_t v61 = 136315394;
            uint64_t v68 = v19;
            uint64_t v74 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000027, 0x80000002619DA440, &v71._countAndFlagsBits);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            uint64_t v62 = 8 * (char)v53;
            uint64_t v63 = *(void *)&aAccept_2[v62];
            *(_WORD *)(v61 + 12) = 2080;
            uint64_t v74 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v63, *(void *)((char *)&unk_2619DA5A8 + v62), &v71._countAndFlagsBits);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_261998000, v59, v60, "%s: A prediction identifier is required for %s", (uint8_t *)v61, 0x16u);
            uint64_t v64 = v67;
            swift_arrayDestroy();
            MEMORY[0x263E47E50](v64, -1, -1);
            MEMORY[0x263E47E50](v61, -1, -1);

            (*(void (**)(char *, uint64_t))(v69 + 8))(v68, v70);
          }
          else
          {

            (*(void (**)(char *, uint64_t))(v69 + 8))(v19, v70);
          }
          (*(void (**)(char *, uint64_t))(v6 + 8))(v15, v5);
          break;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v26 = Logger.workout.unsafeMutableAddressor();
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v12, v26, v5);
      int64_t v27 = Logger.logObject.getter();
      os_log_type_t v28 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v27, v28))
      {
        long long v29 = (uint8_t *)swift_slowAlloc();
        uint64_t v30 = swift_slowAlloc();
        v71._uint64_t countAndFlagsBits = v30;
        *(_DWORD *)long long v29 = 136315138;
        uint64_t v74 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000027, 0x80000002619DA440, &v71._countAndFlagsBits);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl(&dword_261998000, v27, v28, "%s: Found no action in the direct invocation data", v29, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x263E47E50](v30, -1, -1);
        MEMORY[0x263E47E50](v29, -1, -1);

        (*(void (**)(char *, uint64_t))(v69 + 8))(v19, v70);
        (*(void (**)(char *, uint64_t))(v6 + 8))(v12, v5);
        return 0;
      }

      (*(void (**)(char *, uint64_t))(v69 + 8))(v19, v70);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v12, v5);
    }
  }
  else
  {
    uint64_t v31 = Logger.workout.unsafeMutableAddressor();
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v17, v31, v5);
    char v32 = Logger.logObject.getter();
    os_log_type_t v33 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v32, v33))
    {
      long long v34 = (uint8_t *)swift_slowAlloc();
      uint64_t v35 = swift_slowAlloc();
      v71._uint64_t countAndFlagsBits = v35;
      *(_DWORD *)long long v34 = 136315138;
      uint64_t v74 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000027, 0x80000002619DA440, &v71._countAndFlagsBits);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_261998000, v32, v33, "%s: No user data in the direct invocation", v34, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x263E47E50](v35, -1, -1);
      MEMORY[0x263E47E50](v34, -1, -1);

      (*(void (**)(char *, uint64_t))(v69 + 8))(v19, v70);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v17, v5);
      return 0;
    }

    (*(void (**)(char *, uint64_t))(v69 + 8))(v19, v70);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v17, v5);
  }
  return 0;
}

uint64_t WorkoutReminderControlsDirectInvocation.asDirectInvocation()(char a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any)>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2619DA450;
  *(void *)(inited + 32) = 0x696669746E656469;
  *(void *)(inited + 40) = 0xEA00000000007265;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
  *(void *)(inited + 48) = a2;
  *(void *)(inited + 56) = a3;
  *(void *)(inited + 72) = v7;
  *(void *)(inited + 80) = 0x6E6F69746361;
  *(void *)(inited + 88) = 0xE600000000000000;
  uint64_t v8 = 8 * a1;
  uint64_t v9 = *(void *)&aAccept_1[v8];
  uint64_t v10 = *(void *)&aMutefort[v8 + 8];
  *(void *)(inited + 120) = MEMORY[0x263F8D310];
  *(void *)(inited + 96) = v9;
  *(void *)(inited + 104) = v10;
  swift_bridgeObjectRetain();
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  return Parse.DirectInvocation.init(identifier:userData:)();
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
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

unint64_t specialized WorkoutReminderControlsDirectInvocation.Action.init(rawValue:)(Swift::String string)
{
  object = string._object;
  v2._uint64_t countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of WorkoutReminderControlsDirectInvocation.Action.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 >= 4) {
    return 4;
  }
  else {
    return v3;
  }
}

unint64_t lazy protocol witness table accessor for type WorkoutReminderControlsDirectInvocation.Action and conformance WorkoutReminderControlsDirectInvocation.Action()
{
  unint64_t result = lazy protocol witness table cache variable for type WorkoutReminderControlsDirectInvocation.Action and conformance WorkoutReminderControlsDirectInvocation.Action;
  if (!lazy protocol witness table cache variable for type WorkoutReminderControlsDirectInvocation.Action and conformance WorkoutReminderControlsDirectInvocation.Action)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type WorkoutReminderControlsDirectInvocation.Action and conformance WorkoutReminderControlsDirectInvocation.Action);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type [WorkoutReminderControlsDirectInvocation.Action] and conformance [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [WorkoutReminderControlsDirectInvocation.Action] and conformance [A];
  if (!lazy protocol witness table cache variable for type [WorkoutReminderControlsDirectInvocation.Action] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [WorkoutReminderControlsDirectInvocation.Action]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [WorkoutReminderControlsDirectInvocation.Action] and conformance [A]);
  }
  return result;
}

ValueMetadata *type metadata accessor for WorkoutReminderControlsDirectInvocation()
{
  return &type metadata for WorkoutReminderControlsDirectInvocation;
}

unsigned char *storeEnumTagSinglePayload for WorkoutReminderControlsDirectInvocation.Action(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x2619B832CLL);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WorkoutReminderControlsDirectInvocation.Action()
{
  return &type metadata for WorkoutReminderControlsDirectInvocation.Action;
}

uint64_t outlined init with copy of (String, Any)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Any));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void *static VoiceFeedbackStepType.allCases.getter()
{
  return &outlined read-only object #0 of static VoiceFeedbackStepType.allCases.getter;
}

uint64_t VoiceFeedbackStepType.rawValue.getter(uint64_t result)
{
  return result;
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance VoiceFeedbackStepType@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = specialized VoiceFeedbackStepType.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

uint64_t protocol witness for Decodable.init(from:) in conformance VoiceFeedbackStepType()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t protocol witness for Encodable.encode(to:) in conformance VoiceFeedbackStepType()
{
  return RawRepresentable<>.encode(to:)();
}

void protocol witness for static CaseIterable.allCases.getter in conformance VoiceFeedbackStepType(void *a1@<X8>)
{
  *a1 = &outlined read-only object #0 of protocol witness for static CaseIterable.allCases.getter in conformance VoiceFeedbackStepType;
}

unint64_t specialized VoiceFeedbackStepType.init(rawValue:)(unint64_t result)
{
  if (result >= 4) {
    return 4;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type VoiceFeedbackStepType and conformance VoiceFeedbackStepType()
{
  unint64_t result = lazy protocol witness table cache variable for type VoiceFeedbackStepType and conformance VoiceFeedbackStepType;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackStepType and conformance VoiceFeedbackStepType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackStepType and conformance VoiceFeedbackStepType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type VoiceFeedbackStepType and conformance VoiceFeedbackStepType;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackStepType and conformance VoiceFeedbackStepType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackStepType and conformance VoiceFeedbackStepType);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type VoiceFeedbackStepType and conformance VoiceFeedbackStepType;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackStepType and conformance VoiceFeedbackStepType)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackStepType and conformance VoiceFeedbackStepType);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type [VoiceFeedbackStepType] and conformance [A]()
{
  unint64_t result = lazy protocol witness table cache variable for type [VoiceFeedbackStepType] and conformance [A];
  if (!lazy protocol witness table cache variable for type [VoiceFeedbackStepType] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [VoiceFeedbackStepType]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [VoiceFeedbackStepType] and conformance [A]);
  }
  return result;
}

unint64_t instantiation function for generic protocol witness table for VoiceFeedbackStepType(uint64_t a1)
{
  unint64_t result = lazy protocol witness table accessor for type VoiceFeedbackStepType and conformance VoiceFeedbackStepType();
  *(void *)(a1 + 8) = result;
  return result;
}

unsigned char *storeEnumTagSinglePayload for VoiceFeedbackStepType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x2619B86E8);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for VoiceFeedbackStepType()
{
  return &type metadata for VoiceFeedbackStepType;
}

uint64_t WorkoutReminderPromptStrategy.parseValueResponse(input:)(uint64_t a1)
{
  uint64_t v3 = *v1;
  v2[13] = a1;
  v2[14] = v3;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UserDialogAct?);
  v2[15] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for Siri_Nlu_External_UserParse();
  v2[16] = v4;
  v2[17] = *(void *)(v4 - 8);
  v2[18] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  v2[19] = v5;
  v2[20] = *(void *)(v5 - 8);
  v2[21] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for Parse();
  v2[22] = v6;
  v2[23] = *(void *)(v6 - 8);
  v2[24] = swift_task_alloc();
  v2[25] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for USOParse();
  v2[26] = v7;
  v2[27] = *(void *)(v7 - 8);
  v2[28] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for Input();
  v2[29] = v8;
  v2[30] = *(void *)(v8 - 8);
  v2[31] = swift_task_alloc();
  uint64_t v9 = type metadata accessor for Logger();
  v2[32] = v9;
  v2[33] = *(void *)(v9 - 8);
  v2[34] = swift_task_alloc();
  v2[35] = swift_task_alloc();
  v2[36] = swift_task_alloc();
  return MEMORY[0x270FA2498](WorkoutReminderPromptStrategy.parseValueResponse(input:), 0, 0);
}

uint64_t WorkoutReminderPromptStrategy.parseValueResponse(input:)()
{
  v81 = v0;
  uint64_t v1 = v0;
  Swift::String v2 = v0 + 13;
  uint64_t v77 = v0[13];
  uint64_t v3 = v0[36];
  uint64_t v4 = v0[32];
  uint64_t v5 = v0[33];
  uint64_t v6 = v0[30];
  uint64_t v7 = v2[18];
  uint64_t v8 = v2[16];
  uint64_t v9 = Logger.workout.unsafeMutableAddressor();
  swift_beginAccess();
  uint64_t v74 = v9;
  v75 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v75(v3, v9, v4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v7, v77, v8);
  char v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.debug.getter();
  long long v73 = v2;
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v78 = v1[36];
    uint64_t v12 = v1[31];
    uint64_t v71 = v1[33];
    uint64_t v72 = v1[32];
    uint64_t v13 = v1[29];
    uint64_t v69 = v1[30];
    uint64_t v14 = swift_slowAlloc();
    uint64_t v70 = swift_slowAlloc();
    uint64_t v80 = v70;
    *(_DWORD *)uint64_t v14 = 136315394;
    uint64_t v15 = _typeName(_:qualified:)();
    v1[11] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v16, &v80);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2080;
    lazy protocol witness table accessor for type Input and conformance Input();
    uint64_t v17 = dispatch thunk of CustomStringConvertible.description.getter();
    v1[12] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v17, v18, &v80);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v69 + 8))(v12, v13);
    _os_log_impl(&dword_261998000, v10, v11, "%s Parsing Input: %s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x263E47E50](v70, -1, -1);
    MEMORY[0x263E47E50](v14, -1, -1);

    uint64_t v19 = v78;
    v79 = *(void (**)(uint64_t, uint64_t))(v71 + 8);
    v79(v19, v72);
  }
  else
  {
    uint64_t v20 = v1[36];
    uint64_t v21 = v1[32];
    uint64_t v22 = v1[33];
    (*(void (**)(uint64_t, uint64_t))(v1[30] + 8))(v1[31], v1[29]);

    v79 = *(void (**)(uint64_t, uint64_t))(v22 + 8);
    v79(v20, v21);
  }
  uint64_t v23 = v1[25];
  uint64_t v24 = v1[22];
  uint64_t v25 = v1[23];
  Input.parse.getter();
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v25 + 88))(v23, v24) == *MEMORY[0x263F6FF80])
  {
    int64_t v27 = v1 + 28;
    uint64_t v26 = v1[28];
    uint64_t v28 = v1[27];
    uint64_t v29 = v1[26];
    uint64_t v30 = v1[25];
    uint64_t v32 = v1[17];
    uint64_t v31 = v1[18];
    uint64_t v33 = v1[16];
    (*(void (**)(uint64_t, uint64_t))(v1[23] + 96))(v30, v1[22]);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 32))(v26, v30, v29);
    uint64_t v34 = USOParse.userParse.getter();
    uint64_t v35 = MEMORY[0x263E47200](v34);
    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v31, v33);
    if (*(void *)(v35 + 16))
    {
      (*(void (**)(uint64_t, unint64_t, uint64_t))(v1[20] + 16))(v1[15], v35 + ((*(unsigned __int8 *)(v1[20] + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1[20] + 80)), v1[19]);
      uint64_t v36 = 0;
    }
    else
    {
      uint64_t v36 = 1;
    }
    uint64_t v37 = v1 + 26;
    uint64_t v38 = v1[19];
    uint64_t v39 = v1[20];
    uint64_t v40 = v1[15];
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v39 + 56))(v40, v36, 1, v38);
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v39 + 48))(v40, 1, v38) == 1)
    {
      uint64_t v41 = v1[15];
      (*(void (**)(uint64_t, uint64_t))(v1[27] + 8))(v1[28], v1[26]);
      outlined destroy of Any?(v41, &demangling cache variable for type metadata for Siri_Nlu_External_UserDialogAct?);
      goto LABEL_11;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v1[20] + 32))(v1[21], v1[15], v1[19]);
    if (Siri_Nlu_External_UserDialogAct.hasAccepted.getter())
    {
LABEL_18:
      uint64_t v50 = v1[27];
      (*(void (**)(uint64_t, uint64_t))(v1[20] + 8))(v1[21], v1[19]);
      unsigned int v76 = 0;
      uint64_t v47 = *(void (**)(uint64_t, uint64_t))(v50 + 8);
      goto LABEL_14;
    }
    if (Siri_Nlu_External_UserDialogAct.hasRejected.getter())
    {
      uint64_t v51 = v1[27];
      (*(void (**)(uint64_t, uint64_t))(v1[20] + 8))(v1[21], v1[19]);
      uint64_t v47 = *(void (**)(uint64_t, uint64_t))(v51 + 8);
      int v52 = 1;
    }
    else
    {
      uint64_t v54 = v1[23];
      uint64_t v53 = v1[24];
      uint64_t v55 = v1[22];
      Input.parse.getter();
      char v56 = isProbablyWorkout(from:requireWorkoutIdentifier:)();
      (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v53, v55);
      if (v56) {
        goto LABEL_18;
      }
      uint64_t v57 = v1[35];
      uint64_t v58 = v1[32];
      swift_beginAccess();
      v75(v57, v74, v58);
      char v59 = Logger.logObject.getter();
      os_log_type_t v60 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v59, v60))
      {
        uint64_t v61 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v61 = 0;
        _os_log_impl(&dword_261998000, v59, v60, "Parse did not contain accept, reject, or workout task", v61, 2u);
        MEMORY[0x263E47E50](v61, -1, -1);
      }
      uint64_t v62 = v1[35];
      uint64_t v63 = v1[32];
      uint64_t v64 = v59;
      uint64_t v65 = v1[27];
      uint64_t v67 = v1[20];
      uint64_t v66 = v1[21];
      uint64_t v68 = v1[19];

      v79(v62, v63);
      (*(void (**)(uint64_t, uint64_t))(v67 + 8))(v66, v68);
      uint64_t v47 = *(void (**)(uint64_t, uint64_t))(v65 + 8);
      int v52 = 4;
    }
    unsigned int v76 = v52;
    goto LABEL_14;
  }
  (*(void (**)(uint64_t, uint64_t))(v1[23] + 8))(v1[25], v1[22]);
LABEL_11:
  uint64_t v37 = v73 + 19;
  int64_t v27 = v1 + 34;
  uint64_t v42 = v1[34];
  uint64_t v43 = v1[32];
  swift_beginAccess();
  v75(v42, v74, v43);
  uint64_t v44 = Logger.logObject.getter();
  os_log_type_t v45 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v44, v45))
  {
    uint64_t v46 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v46 = 0;
    _os_log_impl(&dword_261998000, v44, v45, "Received unsupported type of input", v46, 2u);
    MEMORY[0x263E47E50](v46, -1, -1);
  }

  unsigned int v76 = 4;
  uint64_t v47 = v79;
LABEL_14:
  v47(*v27, *v37);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v48 = (uint64_t (*)(void))v1[1];
  return v48(v76);
}

uint64_t WorkoutReminderPromptStrategy.actionForInput(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v76 = *v2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UserDialogAct?);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v67 = &v63[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = type metadata accessor for Siri_Nlu_External_UserParse();
  uint64_t v70 = *(void *)(v7 - 8);
  uint64_t v71 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v69 = &v63[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  uint64_t v74 = *(void *)(v9 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  v83 = &v63[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v10);
  uint64_t v68 = &v63[-v12];
  uint64_t v13 = type metadata accessor for USOParse();
  uint64_t v72 = *(void *)(v13 - 8);
  uint64_t v73 = v13;
  MEMORY[0x270FA5388](v13);
  v75 = &v63[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v15 = type metadata accessor for Parse();
  uint64_t v80 = *(void *)(v15 - 8);
  uint64_t v81 = v15;
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  uint64_t v77 = &v63[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v16);
  v79 = &v63[-v18];
  uint64_t v19 = type metadata accessor for Input();
  uint64_t v20 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v22 = &v63[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v23 = type metadata accessor for Logger();
  uint64_t v24 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  uint64_t v26 = &v63[-((v25 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v27 = Logger.workout.unsafeMutableAddressor();
  swift_beginAccess();
  uint64_t v28 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v24 + 16);
  uint64_t v78 = v23;
  v28(v26, v27, v23);
  uint64_t v29 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v20 + 16);
  uint64_t v82 = a1;
  v29(v22, a1, v19);
  uint64_t v30 = Logger.logObject.getter();
  os_log_type_t v31 = static os_log_type_t.debug.getter();
  int v32 = v31;
  if (os_log_type_enabled(v30, v31))
  {
    uint64_t v33 = swift_slowAlloc();
    int v64 = v32;
    uint64_t v34 = v33;
    uint64_t v65 = swift_slowAlloc();
    uint64_t v85 = v65;
    *(_DWORD *)uint64_t v34 = 136315394;
    uint64_t v35 = _typeName(_:qualified:)();
    uint64_t v66 = v9;
    uint64_t v84 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v35, v36, &v85);
    uint64_t v76 = a2;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v34 + 12) = 2080;
    lazy protocol witness table accessor for type Input and conformance Input();
    uint64_t v37 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v84 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v37, v38, &v85);
    uint64_t v9 = v66;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(unsigned char *, uint64_t))(v20 + 8))(v22, v19);
    _os_log_impl(&dword_261998000, v30, (os_log_type_t)v64, "%s Handling Input: %s", (uint8_t *)v34, 0x16u);
    uint64_t v39 = v65;
    swift_arrayDestroy();
    MEMORY[0x263E47E50](v39, -1, -1);
    MEMORY[0x263E47E50](v34, -1, -1);
  }
  else
  {
    (*(void (**)(unsigned char *, uint64_t))(v20 + 8))(v22, v19);
  }

  (*(void (**)(unsigned char *, uint64_t))(v24 + 8))(v26, v78);
  uint64_t v40 = v83;
  uint64_t v42 = v80;
  uint64_t v41 = v81;
  uint64_t v43 = v79;
  Input.parse.getter();
  char v44 = isProbablyWorkout(from:requireWorkoutIdentifier:)();
  os_log_type_t v45 = *(void (**)(unsigned char *, uint64_t))(v42 + 8);
  v45(v43, v41);
  if (v44) {
    return static ActionForInput.handle()();
  }
  uint64_t v47 = v77;
  Input.parse.getter();
  if ((*(unsigned int (**)(unsigned char *, uint64_t))(v42 + 88))(v47, v41) == *MEMORY[0x263F6FF80])
  {
    (*(void (**)(unsigned char *, uint64_t))(v42 + 96))(v47, v41);
    uint64_t v49 = v72;
    uint64_t v48 = v73;
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v72 + 32))(v75, v47, v73);
    uint64_t v50 = v69;
    uint64_t v51 = USOParse.userParse.getter();
    uint64_t v52 = MEMORY[0x263E47200](v51);
    (*(void (**)(unsigned char *, uint64_t))(v70 + 8))(v50, v71);
    if (*(void *)(v52 + 16))
    {
      uint64_t v53 = v74;
      uint64_t v54 = (uint64_t)v67;
      (*(void (**)(unsigned char *, unint64_t, uint64_t))(v74 + 16))(v67, v52 + ((*(unsigned __int8 *)(v74 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v74 + 80)), v9);
      uint64_t v55 = 0;
    }
    else
    {
      uint64_t v55 = 1;
      uint64_t v53 = v74;
      uint64_t v54 = (uint64_t)v67;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v53 + 56))(v54, v55, 1, v9);
    swift_bridgeObjectRelease();
    uint64_t v56 = v54;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v53 + 48))(v54, 1, v9) != 1)
    {
      uint64_t v57 = v68;
      (*(void (**)(unsigned char *, uint64_t, uint64_t))(v53 + 32))(v68, v56, v9);
      char v58 = Siri_Nlu_External_UserDialogAct.hasAccepted.getter();
      uint64_t v59 = v74;
      char v60 = v58;
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v74 + 16))(v40, v57, v9);
      if (v60)
      {
        uint64_t v61 = *(void (**)(unsigned char *, uint64_t))(v59 + 8);
        v61(v40, v9);
      }
      else
      {
        char v62 = Siri_Nlu_External_UserDialogAct.hasRejected.getter();
        uint64_t v61 = *(void (**)(unsigned char *, uint64_t))(v59 + 8);
        v61(v40, v9);
        if ((v62 & 1) == 0)
        {
          v61(v68, v9);
          (*(void (**)(unsigned char *, uint64_t))(v49 + 8))(v75, v48);
          return static ActionForInput.ignore()();
        }
      }
      static ActionForInput.handle()();
      v61(v68, v9);
      return (*(uint64_t (**)(unsigned char *, uint64_t))(v49 + 8))(v75, v48);
    }
    (*(void (**)(unsigned char *, uint64_t))(v49 + 8))(v75, v48);
    outlined destroy of Any?(v54, &demangling cache variable for type metadata for Siri_Nlu_External_UserDialogAct?);
  }
  else
  {
    v45(v47, v41);
  }
  return static ActionForInput.ignore()();
}

uint64_t WorkoutReminderPromptStrategy.makePromptForValue()(uint64_t a1)
{
  v2[7] = a1;
  v2[8] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DismissalSettings?);
  v2[9] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for DismissalSettings();
  v2[10] = v3;
  v2[11] = *(void *)(v3 - 8);
  v2[12] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NLContextUpdate?);
  v2[13] = swift_task_alloc();
  type metadata accessor for DialogPhase();
  v2[14] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for OutputGenerationManifest();
  v2[15] = v4;
  v2[16] = *(void *)(v4 - 8);
  v2[17] = swift_task_alloc();
  uint64_t v5 = (void *)swift_task_alloc();
  v2[18] = v5;
  *uint64_t v5 = v2;
  v5[1] = WorkoutReminderPromptStrategy.makePromptForValue();
  _OWORD v5[2] = v1;
  return MEMORY[0x270FA2498](WorkoutReminderPromptStrategy.announcementDialog(), 0, 0);
}

{
  uint64_t v1;
  uint64_t v3;

  *(void *)(*(void *)v1 + 152) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](WorkoutReminderPromptStrategy.makePromptForValue(), 0, 0);
}

uint64_t WorkoutReminderPromptStrategy.makePromptForValue()()
{
  if (v0[19])
  {
    uint64_t v1 = v0[13];
    uint64_t v3 = v0[11];
    uint64_t v2 = v0[12];
    uint64_t v4 = v0[9];
    uint64_t v5 = v0[10];
    static DialogPhase.confirmation.getter();
    OutputGenerationManifest.init(dialogPhase:_:)();
    WorkoutReminderPromptStrategy.confirmationSDA()(v1);
    OutputGenerationManifest.nlContextUpdate.setter();
    OutputGenerationManifest.canUseServerTTS.setter();
    DismissalSettings.init(_:)();
    DismissalSettings.minimumAutoDismissalTimeInMs.setter();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v4, v2, v5);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v3 + 56))(v4, 0, 1, v5);
    OutputGenerationManifest.dismissalSettings.setter();
    id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F64FE0]), sel_init);
    v0[20] = v6;
    objc_msgSend(v6, sel_setNotificationType_, *MEMORY[0x263F65A60]);
    static AceService.currentAsync.getter();
    uint64_t v7 = v0[5];
    uint64_t v8 = v0[6];
    __swift_project_boxed_opaque_existential_1(v0 + 2, v7);
    uint64_t v9 = (void *)swift_task_alloc();
    v0[21] = v9;
    unint64_t v10 = type metadata accessor for SABaseCommand();
    *uint64_t v9 = v0;
    v9[1] = WorkoutReminderPromptStrategy.makePromptForValue();
    return MEMORY[0x270F67CE0](v6, v7, v10, v8);
  }
  else
  {
    lazy protocol witness table accessor for type WorkoutReminderErrors and conformance WorkoutReminderErrors();
    swift_allocError();
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v11 = (uint64_t (*)(void))v0[1];
    return v11();
  }
}

{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  uint64_t v1 = v0[19];
  uint64_t v2 = (void *)v0[8];
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 2));
  uint64_t v3 = v2 + 13;
  uint64_t v4 = v2[16];
  uint64_t v5 = v2[17];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  id v6 = (void *)swift_task_alloc();
  v0[23] = v6;
  *id v6 = v0;
  v6[1] = WorkoutReminderPromptStrategy.makePromptForValue();
  uint64_t v7 = v0[17];
  uint64_t v8 = v0[7];
  return MEMORY[0x270F67AD8](v8, v1, v7, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  *(void *)(*(void *)v1 + 192) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = WorkoutReminderPromptStrategy.makePromptForValue();
  }
  else {
    uint64_t v2 = WorkoutReminderPromptStrategy.makePromptForValue();
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void);
  uint64_t v10;

  uint64_t v1 = *(void **)(v0 + 152);
  uint64_t v3 = *(void *)(v0 + 128);
  uint64_t v2 = *(void *)(v0 + 136);
  uint64_t v4 = *(void *)(v0 + 120);
  uint64_t v5 = *(void *)(v0 + 96);
  id v6 = *(void *)(v0 + 80);
  uint64_t v7 = *(void *)(v0 + 88);

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void);
  uint64_t v10;

  uint64_t v1 = *(void **)(v0 + 152);
  uint64_t v3 = *(void *)(v0 + 128);
  uint64_t v2 = *(void *)(v0 + 136);
  uint64_t v4 = *(void *)(v0 + 120);
  id v6 = *(void *)(v0 + 88);
  uint64_t v5 = *(void *)(v0 + 96);
  uint64_t v7 = *(void *)(v0 + 80);

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void);
  uint64_t v10;

  uint64_t v1 = *(void **)(v0 + 152);
  uint64_t v3 = *(void *)(v0 + 128);
  uint64_t v2 = *(void *)(v0 + 136);
  uint64_t v4 = *(void *)(v0 + 120);
  id v6 = *(void *)(v0 + 88);
  uint64_t v5 = *(void *)(v0 + 96);
  uint64_t v7 = *(void *)(v0 + 80);

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t WorkoutReminderPromptStrategy.makePromptForValue()(void *a1)
{
  *(void *)(*(void *)v2 + 176) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = WorkoutReminderPromptStrategy.makePromptForValue();
  }
  else
  {

    uint64_t v4 = WorkoutReminderPromptStrategy.makePromptForValue();
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t WorkoutReminderPromptStrategy.announcementDialog()()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x270FA2498](WorkoutReminderPromptStrategy.announcementDialog(), 0, 0);
}

{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  uint64_t (*v7)(void);
  uint64_t (*v8)(char, uint64_t, uint64_t);
  uint64_t v9;

  uint64_t v1 = objc_msgSend(*(id *)(v0[2] + 16), sel_predictionType);
  if (v1 == (id)3)
  {
    uint64_t v2 = *__swift_project_boxed_opaque_existential_1((void *)(v0[2] + 64), *(void *)(v0[2] + 88));
    uint64_t v8 = (uint64_t (*)(char, uint64_t, uint64_t))((char *)&async function pointer to specialized WorkoutRemindersCATPatternsExecutor.resume(executeSashGroupOnWatch:_:)
                                                        + async function pointer to specialized WorkoutRemindersCATPatternsExecutor.resume(executeSashGroupOnWatch:_:));
    swift_retain();
    uint64_t v3 = (void *)swift_task_alloc();
    v0[5] = v3;
    *uint64_t v3 = v0;
    uint64_t v4 = WorkoutReminderPromptStrategy.announcementDialog();
    goto LABEL_7;
  }
  if (v1 == (id)2)
  {
    uint64_t v2 = *__swift_project_boxed_opaque_existential_1((void *)(v0[2] + 64), *(void *)(v0[2] + 88));
    uint64_t v8 = (uint64_t (*)(char, uint64_t, uint64_t))((char *)&async function pointer to specialized WorkoutRemindersCATPatternsExecutor.end(executeSashGroupOnWatch:_:)
                                                        + async function pointer to specialized WorkoutRemindersCATPatternsExecutor.end(executeSashGroupOnWatch:_:));
    swift_retain();
    uint64_t v3 = (void *)swift_task_alloc();
    v0[4] = v3;
    *uint64_t v3 = v0;
    uint64_t v4 = WorkoutReminderPromptStrategy.announcementDialog();
    goto LABEL_7;
  }
  if (v1 == (id)1)
  {
    uint64_t v2 = *__swift_project_boxed_opaque_existential_1((void *)(v0[2] + 64), *(void *)(v0[2] + 88));
    uint64_t v8 = (uint64_t (*)(char, uint64_t, uint64_t))((char *)&async function pointer to specialized WorkoutRemindersCATPatternsExecutor.start(executeSashGroupOnWatch:_:)
                                                        + async function pointer to specialized WorkoutRemindersCATPatternsExecutor.start(executeSashGroupOnWatch:_:));
    swift_retain();
    uint64_t v3 = (void *)swift_task_alloc();
    v0[3] = v3;
    *uint64_t v3 = v0;
    uint64_t v4 = WorkoutReminderPromptStrategy.announcementDialog();
LABEL_7:
    v3[1] = v4;
    uint64_t v5 = v0[2];
    return v8(0, v2, v5);
  }
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7(0);
}

uint64_t WorkoutReminderPromptStrategy.announcementDialog()(uint64_t a1)
{
  uint64_t v4 = *v2;
  swift_task_dealloc();
  swift_release();
  if (v1)
  {
    MEMORY[0x263E47CC0](v1);
    a1 = 0;
  }
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v4 + 8);
  return v5(a1);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v7;

  uint64_t v4 = *v2;
  swift_task_dealloc();
  swift_release();
  if (v1)
  {
    MEMORY[0x263E47CC0](v1);
    a1 = 0;
  }
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v4 + 8);
  return v5(a1);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v7;

  uint64_t v4 = *v2;
  swift_task_dealloc();
  swift_release();
  if (v1)
  {
    MEMORY[0x263E47CC0](v1);
    a1 = 0;
  }
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v4 + 8);
  return v5(a1);
}

uint64_t WorkoutReminderPromptStrategy.confirmationSDA()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_SystemDialogAct?);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for Siri_Nlu_External_SystemDialogAct();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Logger();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = objc_msgSend(*(id *)(v1 + 16), sel_predictionType);
  if (v14 == (id)3)
  {
    type metadata accessor for UsoTaskBuilder_resume_common_Workout();
    swift_allocObject();
    uint64_t common = UsoTaskBuilder_resume_common_Workout.init()();
  }
  else if (v14 == (id)2)
  {
    type metadata accessor for UsoTaskBuilder_stop_common_Workout();
    swift_allocObject();
    uint64_t common = UsoTaskBuilder_stop_common_Workout.init()();
  }
  else
  {
    if (v14 != (id)1)
    {
      uint64_t v20 = Logger.workout.unsafeMutableAddressor();
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v20, v10);
      uint64_t v21 = Logger.logObject.getter();
      os_log_type_t v22 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v21, v22))
      {
        uint64_t v23 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v23 = 0;
        _os_log_impl(&dword_261998000, v21, v22, "Unknown prediction type - unable to build SystemDialogAct", v23, 2u);
        MEMORY[0x263E47E50](v23, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
      goto LABEL_13;
    }
    type metadata accessor for UsoTaskBuilder_create_common_Workout();
    swift_allocObject();
    uint64_t common = UsoTaskBuilder_create_common_Workout.init()();
  }
  WorkoutReminderPromptStrategy.makeConfirmationAct(for:)(common, (uint64_t)v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v5, v6);
    NLContextUpdate.init()();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Siri_Nlu_External_SystemDialogAct>);
    unint64_t v16 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    uint64_t v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_2619D98D0;
    (*(void (**)(unint64_t, char *, uint64_t))(v7 + 16))(v17 + v16, v9, v6);
    NLContextUpdate.nluSystemDialogActs.setter();
    swift_release();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    uint64_t v18 = type metadata accessor for NLContextUpdate();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(a1, 0, 1, v18);
  }
  swift_release();
  outlined destroy of Any?((uint64_t)v5, &demangling cache variable for type metadata for Siri_Nlu_External_SystemDialogAct?);
LABEL_13:
  uint64_t v24 = type metadata accessor for NLContextUpdate();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(a1, 1, 1, v24);
}

uint64_t WorkoutReminderPromptStrategy.makeConfirmationAct(for:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v64 = a2;
  uint64_t v59 = type metadata accessor for Logger();
  uint64_t v63 = *(void *)(v59 - 8);
  MEMORY[0x270FA5388](v59);
  char v62 = (char *)&v49 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for Siri_Nlu_External_SystemOffered();
  uint64_t v57 = *(void *)(v4 - 8);
  uint64_t v58 = v4;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v56 = (char *)&v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v55 = (char *)&v49 - v7;
  uint64_t v61 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  uint64_t v54 = *(void *)(v61 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v61);
  uint64_t v53 = (char *)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v52 = (char *)&v49 - v10;
  uint64_t v60 = type metadata accessor for Siri_Nlu_External_UserWantedToProceed();
  uint64_t v11 = *(void *)(v60 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v60);
  id v14 = (char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  unint64_t v16 = (char *)&v49 - v15;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v19 = (char *)&v49 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = type metadata accessor for Siri_Nlu_External_UsoGraph();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)&v49 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  uint64_t v26 = (char *)&v49 - v25;
  uint64_t v27 = a1;
  UsoTaskBuilder.toProtobufUsoGraph()();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20) == 1)
  {
    outlined destroy of Any?((uint64_t)v19, &demangling cache variable for type metadata for Siri_Nlu_External_UsoGraph?);
    uint64_t v28 = Logger.workout.unsafeMutableAddressor();
    swift_beginAccess();
    uint64_t v29 = v59;
    (*(void (**)(char *, uint64_t, uint64_t))(v63 + 16))(v62, v28, v59);
    swift_retain_n();
    uint64_t v30 = Logger.logObject.getter();
    os_log_type_t v31 = static os_log_type_t.error.getter();
    BOOL v32 = os_log_type_enabled(v30, v31);
    uint64_t v33 = v64;
    if (v32)
    {
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      uint64_t v35 = swift_slowAlloc();
      uint64_t v65 = v27;
      uint64_t v66 = v35;
      *(_DWORD *)uint64_t v34 = 136315138;
      type metadata accessor for UsoTaskBuilder();
      swift_retain();
      uint64_t v36 = String.init<A>(describing:)();
      uint64_t v65 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v36, v37, &v66);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_261998000, v30, v31, "Failed to create protobuf UsoGraph from Task builder %s", v34, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x263E47E50](v35, -1, -1);
      unint64_t v38 = v34;
      uint64_t v33 = v64;
      MEMORY[0x263E47E50](v38, -1, -1);
    }
    else
    {

      swift_release_n();
    }
    (*(void (**)(char *, uint64_t))(v63 + 8))(v62, v29);
    uint64_t v48 = type metadata accessor for Siri_Nlu_External_SystemDialogAct();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v48 - 8) + 56))(v33, 1, 1, v48);
  }
  else
  {
    uint64_t v39 = *(void (**)(char *, char *, uint64_t))(v21 + 32);
    uint64_t v51 = v26;
    v39(v26, v19, v20);
    uint64_t v50 = v16;
    Siri_Nlu_External_UserWantedToProceed.init()();
    (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v24, v26, v20);
    Siri_Nlu_External_UserWantedToProceed.reference.setter();
    uint64_t v40 = v52;
    Siri_Nlu_External_UserDialogAct.init()();
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, v60);
    Siri_Nlu_External_UserDialogAct.wantedToProceed.setter();
    uint64_t v41 = v55;
    Siri_Nlu_External_SystemOffered.init()();
    uint64_t v42 = v54;
    (*(void (**)(char *, char *, uint64_t))(v54 + 16))(v53, v40, v61);
    Siri_Nlu_External_SystemOffered.offeredAct.setter();
    uint64_t v43 = v64;
    Siri_Nlu_External_SystemDialogAct.init()();
    uint64_t v44 = v57;
    uint64_t v45 = v58;
    (*(void (**)(char *, char *, uint64_t))(v57 + 16))(v56, v41, v58);
    Siri_Nlu_External_SystemDialogAct.offered.setter();
    (*(void (**)(char *, uint64_t))(v44 + 8))(v41, v45);
    (*(void (**)(char *, uint64_t))(v42 + 8))(v40, v61);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v50, v60);
    (*(void (**)(char *, uint64_t))(v21 + 8))(v51, v20);
    uint64_t v46 = type metadata accessor for Siri_Nlu_External_SystemDialogAct();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56))(v43, 0, 1, v46);
  }
}

uint64_t WorkoutReminderPromptStrategy.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 64);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 104);
  return MEMORY[0x270FA0228](v0, 144, 7);
}

uint64_t type metadata accessor for WorkoutReminderPromptStrategy()
{
  return self;
}

uint64_t protocol witness for PromptForValueFlowStrategyAsync.parseValueResponse(input:) in conformance WorkoutReminderPromptStrategy(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v4;
  *uint64_t v4 = v2;
  v4[1] = protocol witness for PromptForValueFlowStrategyAsync.parseValueResponse(input:) in conformance WorkoutReminderPromptStrategy;
  return WorkoutReminderPromptStrategy.parseValueResponse(input:)(a2);
}

uint64_t protocol witness for PromptForValueFlowStrategyAsync.parseValueResponse(input:) in conformance WorkoutReminderPromptStrategy(char a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (!v1) {
    **(unsigned char **)(v4 + 16) = a1;
  }
  uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
  return v6();
}

uint64_t protocol witness for PromptForValueFlowStrategyAsync.makePromptForValue() in conformance WorkoutReminderPromptStrategy(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = protocol witness for PromptForValueFlowStrategyAsync.makeRepromptOnEmptyParse() in conformance WorkoutReminderPromptStrategy;
  return WorkoutReminderPromptStrategy.makePromptForValue()(a1);
}

uint64_t protocol witness for PromptForValueFlowStrategyAsync.makeRepromptOnEmptyParse() in conformance WorkoutReminderPromptStrategy(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = protocol witness for PromptForValueFlowStrategyAsync.makeRepromptOnEmptyParse() in conformance WorkoutReminderPromptStrategy;
  return MEMORY[0x270F66450](a1, a2, a3);
}

uint64_t protocol witness for PromptForValueFlowStrategyAsync.makeRepromptOnLowConfidence() in conformance WorkoutReminderPromptStrategy(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = protocol witness for PromptForValueFlowStrategyAsync.makeRepromptOnEmptyParse() in conformance WorkoutReminderPromptStrategy;
  return MEMORY[0x270F66458](a1, a2, a3);
}

uint64_t protocol witness for PromptForValueFlowStrategyAsync.makeFlowCancelledResponse() in conformance WorkoutReminderPromptStrategy(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = protocol witness for Flow.execute() in conformance VoiceFeedbackAnnouncementFlow;
  return MEMORY[0x270F66440](a1, a2, a3);
}

uint64_t protocol witness for PromptForValueFlowStrategyAsync.makeErrorResponse(_:) in conformance WorkoutReminderPromptStrategy(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = protocol witness for PromptForValueFlowStrategyAsync.makeRepromptOnEmptyParse() in conformance WorkoutReminderPromptStrategy;
  return MEMORY[0x270F66448](a1, a2, a3, a4);
}

unint64_t lazy protocol witness table accessor for type WorkoutReminderErrors and conformance WorkoutReminderErrors()
{
  unint64_t result = lazy protocol witness table cache variable for type WorkoutReminderErrors and conformance WorkoutReminderErrors;
  if (!lazy protocol witness table cache variable for type WorkoutReminderErrors and conformance WorkoutReminderErrors)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type WorkoutReminderErrors and conformance WorkoutReminderErrors);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type WorkoutReminderErrors and conformance WorkoutReminderErrors;
  if (!lazy protocol witness table cache variable for type WorkoutReminderErrors and conformance WorkoutReminderErrors)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type WorkoutReminderErrors and conformance WorkoutReminderErrors);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Input and conformance Input()
{
  unint64_t result = lazy protocol witness table cache variable for type Input and conformance Input;
  if (!lazy protocol witness table cache variable for type Input and conformance Input)
  {
    type metadata accessor for Input();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Input and conformance Input);
  }
  return result;
}

uint64_t BelowTargetZoneModel.alertType.getter()
{
  return *v0;
}

uint64_t BelowTargetZoneModel.alertType.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*BelowTargetZoneModel.alertType.modify())()
{
  return closure #1 in default argument 1 of OutputGenerationManifest.init(dialogPhase:_:);
}

void __swiftcall BelowTargetZoneModel.init(magnitude:unit:targetZone:)(WorkoutAnnouncements::BelowTargetZoneModel *__return_ptr retstr, Swift::Double magnitude, Swift::String unit, WorkoutAnnouncements::VoiceFeedbackTargetZone *targetZone)
{
  object = unit._object;
  uint64_t countAndFlagsBits = unit._countAndFlagsBits;
  outlined release of AboveTargetZoneModel((uint64_t)targetZone);
  Swift::Bool isSingleThreshold = targetZone->isSingleThreshold;
  WorkoutAnnouncements::VoiceFeedbackPaceFormat value = targetZone->paceFormat.value;
  WorkoutAnnouncements::VoiceFeedbackMetricType metricType = targetZone->metricType;
  retstr->alertType = WorkoutAnnouncements_VoiceFeedbackAlertType_zoneExitedBelow;
  retstr->magnitude = magnitude;
  retstr->unit._uint64_t countAndFlagsBits = countAndFlagsBits;
  retstr->unit._object = object;
  retstr->Swift::Bool isSingleThreshold = isSingleThreshold;
  retstr->paceFormat.WorkoutAnnouncements::VoiceFeedbackPaceFormat value = value;
  retstr->WorkoutAnnouncements::VoiceFeedbackMetricType metricType = metricType;
}

unint64_t BelowTargetZoneModel.CodingKeys.stringValue.getter(char a1)
{
  unint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x647574696E67616DLL;
      break;
    case 2:
      unint64_t result = 1953066613;
      break;
    case 3:
      return result;
    case 4:
      unint64_t result = 0x6D726F4665636170;
      break;
    case 5:
      unint64_t result = 0x795463697274656DLL;
      break;
    default:
      unint64_t result = 0x7079547472656C61;
      break;
  }
  return result;
}

unint64_t protocol witness for CodingKey.stringValue.getter in conformance BelowTargetZoneModel.CodingKeys()
{
  return BelowTargetZoneModel.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance BelowTargetZoneModel.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type BelowTargetZoneModel.CodingKeys and conformance BelowTargetZoneModel.CodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance BelowTargetZoneModel.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type BelowTargetZoneModel.CodingKeys and conformance BelowTargetZoneModel.CodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t BelowTargetZoneModel.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<BelowTargetZoneModel.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type BelowTargetZoneModel.CodingKeys and conformance BelowTargetZoneModel.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v11[5] = *v3;
  v11[4] = 0;
  lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v2)
  {
    v11[3] = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
    v11[2] = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
    v11[1] = 3;
    KeyedEncodingContainer.encode(_:forKey:)();
    outlined init with take of VoiceFeedbackPaceFormat?((uint64_t)(v3 + 33), (uint64_t)&v12);
    outlined init with take of VoiceFeedbackPaceFormat?((uint64_t)&v12, (uint64_t)v11);
    v10[8] = 4;
    lazy protocol witness table accessor for type VoiceFeedbackPaceFormat and conformance VoiceFeedbackPaceFormat();
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
    v10[7] = v3[34];
    v10[6] = 5;
    lazy protocol witness table accessor for type VoiceFeedbackMetricType and conformance VoiceFeedbackMetricType();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

double BelowTargetZoneModel.init(from:)@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  specialized BelowTargetZoneModel.init(from:)(a1, (uint64_t)&v6);
  if (!v2)
  {
    double result = *(double *)&v6;
    long long v5 = *(_OWORD *)v7;
    *(_OWORD *)a2 = v6;
    *(_OWORD *)(a2 + 16) = v5;
    *(_DWORD *)(a2 + 31) = *(_DWORD *)&v7[15];
  }
  return result;
}

double protocol witness for Decodable.init(from:) in conformance BelowTargetZoneModel@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  specialized BelowTargetZoneModel.init(from:)(a1, (uint64_t)&v6);
  if (!v2)
  {
    double result = *(double *)&v6;
    long long v5 = *(_OWORD *)v7;
    *(_OWORD *)a2 = v6;
    *(_OWORD *)(a2 + 16) = v5;
    *(_DWORD *)(a2 + 31) = *(_DWORD *)&v7[15];
  }
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance BelowTargetZoneModel(void *a1)
{
  return BelowTargetZoneModel.encode(to:)(a1);
}

uint64_t BelowTargetZoneModel.executePattern(wrapper:)(uint64_t a1)
{
  v2[6] = a1;
  v2[7] = v1;
  uint64_t v3 = type metadata accessor for Logger();
  v2[8] = v3;
  v2[9] = *(void *)(v3 - 8);
  v2[10] = swift_task_alloc();
  return MEMORY[0x270FA2498](BelowTargetZoneModel.executePattern(wrapper:), 0, 0);
}

uint64_t BelowTargetZoneModel.executePattern(wrapper:)()
{
  uint64_t v40 = v0;
  if (one-time initialization token for noPaceFormatMetrics != -1) {
    swift_once();
  }
  unsigned __int8 v1 = *(unsigned char *)(*(void *)(v0 + 56) + 34);
  BOOL v2 = specialized Sequence<>.contains(_:)(v1, (uint64_t)noPaceFormatMetrics._rawValue);
  uint64_t v3 = *(void *)(v0 + 56);
  if (v2)
  {
    uint64_t v4 = __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 48), *(void *)(*(void *)(v0 + 48) + 24));
    char v5 = *(unsigned char *)(v3 + 32);
    uint64_t v6 = *v4;
    outlined retain of AboveTargetZoneModel(v3);
    unint64_t v38 = (uint64_t (*)(char, char, uint64_t, uint64_t))((char *)&async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedBelowNonPace(executeSashGroupOnWatch:isSingleThreshold:_:)
                                                               + async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedBelowNonPace(executeSashGroupOnWatch:isSingleThreshold:_:));
    uint64_t v7 = (void *)swift_task_alloc();
    *(void *)(v0 + 88) = v7;
    *uint64_t v7 = v0;
    v7[1] = AboveTargetZoneModel.executePattern(wrapper:);
    uint64_t v8 = *(void *)(v0 + 56);
    char v9 = v5;
    uint64_t v10 = v6;
LABEL_16:
    return v38(0, v9, v10, v8);
  }
  outlined init with take of VoiceFeedbackPaceFormat?(v3 + 33, v0 + 113);
  outlined init with take of VoiceFeedbackPaceFormat?(v0 + 113, v0 + 112);
  int v11 = *(unsigned __int8 *)(v0 + 112);
  if (v11 != 2)
  {
    uint64_t v28 = *(void *)(v0 + 56);
    uint64_t v29 = __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 48), *(void *)(*(void *)(v0 + 48) + 24));
    char v30 = *(unsigned char *)(v28 + 32);
    uint64_t v31 = *v29;
    outlined retain of AboveTargetZoneModel(v28);
    if (v11)
    {
      unint64_t v38 = (uint64_t (*)(char, char, uint64_t, uint64_t))((char *)&async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedBelowPace(executeSashGroupOnWatch:isSingleThreshold:_:)
                                                                 + async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedBelowPace(executeSashGroupOnWatch:isSingleThreshold:_:));
      BOOL v32 = (void *)swift_task_alloc();
      *(void *)(v0 + 104) = v32;
      *BOOL v32 = v0;
      uint64_t v33 = AboveTargetZoneModel.executePattern(wrapper:);
    }
    else
    {
      unint64_t v38 = (uint64_t (*)(char, char, uint64_t, uint64_t))((char *)&async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedBelowSpeed(executeSashGroupOnWatch:isSingleThreshold:_:)
                                                                 + async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedBelowSpeed(executeSashGroupOnWatch:isSingleThreshold:_:));
      BOOL v32 = (void *)swift_task_alloc();
      *(void *)(v0 + 96) = v32;
      *BOOL v32 = v0;
      uint64_t v33 = AboveTargetZoneModel.executePattern(wrapper:);
    }
    v32[1] = v33;
    uint64_t v8 = *(void *)(v0 + 56);
    char v9 = v30;
    uint64_t v10 = v31;
    goto LABEL_16;
  }
  uint64_t v13 = *(void *)(v0 + 72);
  uint64_t v12 = *(void *)(v0 + 80);
  uint64_t v15 = *(void *)(v0 + 56);
  uint64_t v14 = *(void *)(v0 + 64);
  uint64_t v16 = Logger.workout.unsafeMutableAddressor();
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v12, v16, v14);
  outlined retain of AboveTargetZoneModel(v15);
  outlined retain of AboveTargetZoneModel(v15);
  uint64_t v17 = Logger.logObject.getter();
  os_log_type_t v18 = static os_log_type_t.error.getter();
  BOOL v19 = os_log_type_enabled(v17, v18);
  uint64_t v21 = *(void *)(v0 + 72);
  uint64_t v20 = *(void *)(v0 + 80);
  uint64_t v23 = *(void *)(v0 + 56);
  uint64_t v22 = *(void *)(v0 + 64);
  if (v19)
  {
    uint64_t v37 = *(void *)(v0 + 64);
    uint64_t v24 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    uint64_t v39 = v25;
    *(_DWORD *)uint64_t v24 = 136315138;
    *(unsigned char *)(v0 + 114) = v1;
    uint64_t v26 = String.init<A>(describing:)();
    *(void *)(v0 + 40) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v26, v27, &v39);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    outlined release of AboveTargetZoneModel(v23);
    outlined release of AboveTargetZoneModel(v23);
    _os_log_impl(&dword_261998000, v17, v18, "BelowTargetZoneModel needs a pace format for: %s", v24, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x263E47E50](v25, -1, -1);
    MEMORY[0x263E47E50](v24, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v37);
  }
  else
  {
    outlined release of AboveTargetZoneModel(*(void *)(v0 + 56));
    outlined release of AboveTargetZoneModel(v23);

    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v22);
  }
  lazy protocol witness table accessor for type VoiceFeedbackErrors and conformance VoiceFeedbackErrors();
  swift_allocError();
  unsigned char *v34 = 1;
  swift_willThrow();
  swift_task_dealloc();
  uint64_t v35 = *(uint64_t (**)(void))(v0 + 8);
  return v35();
}

uint64_t protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance BelowTargetZoneModel(uint64_t a1)
{
  long long v4 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v2 + 32) = v4;
  *(_DWORD *)(v2 + 47) = *(_DWORD *)(v1 + 31);
  char v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 56) = v5;
  *char v5 = v2;
  v5[1] = protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance AboveTargetZoneModel;
  return BelowTargetZoneModel.executePattern(wrapper:)(a1);
}

uint64_t specialized BelowTargetZoneModel.init(with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(specialized Sequence.compactMap<A>(_:)(a1) + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<VoiceFeedbackKeys, Any>);
    uint64_t v8 = static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v8 = MEMORY[0x263F8EE80];
  }
  *(void *)&long long v51 = v8;
  uint64_t v9 = swift_bridgeObjectRetain();
  specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(v9, 1, &v51);
  swift_bridgeObjectRelease();
  uint64_t v10 = v51;
  uint64_t v11 = Logger.workout.unsafeMutableAddressor();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v11, v4);
  swift_retain_n();
  uint64_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v46 = swift_slowAlloc();
    *(void *)&long long v51 = v46;
    *(_DWORD *)uint64_t v14 = 136315394;
    uint64_t v48 = a1;
    double v49 = COERCE_DOUBLE(getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000014, 0x80000002619DA900, (uint64_t *)&v51));
    uint64_t v47 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v14 + 12) = 2080;
    v44[1] = v14 + 14;
    lazy protocol witness table accessor for type VoiceFeedbackKeys and conformance VoiceFeedbackKeys();
    uint64_t v45 = v4;
    swift_retain();
    uint64_t v15 = Dictionary.description.getter();
    uint64_t v16 = a2;
    unint64_t v18 = v17;
    swift_release();
    double v49 = COERCE_DOUBLE(getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v18, (uint64_t *)&v51));
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    a2 = v16;
    a1 = v48;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_261998000, v12, v13, "%s received VoiceFeedback dictionary: %s", (uint8_t *)v14, 0x16u);
    uint64_t v19 = v46;
    swift_arrayDestroy();
    MEMORY[0x263E47E50](v19, -1, -1);
    MEMORY[0x263E47E50](v14, -1, -1);

    (*(void (**)(char *, uint64_t))(v47 + 8))(v7, v45);
    if (!*(void *)(v10 + 16)) {
      goto LABEL_22;
    }
LABEL_8:
    unint64_t v20 = specialized __RawDictionaryStorage.find<A>(_:)(6);
    if ((v21 & 1) == 0) {
      goto LABEL_22;
    }
    outlined init with copy of Any(*(void *)(v10 + 56) + 32 * v20, (uint64_t)&v51);
    if ((swift_dynamicCast() & 1) == 0) {
      goto LABEL_22;
    }
    if (!*(void *)(v10 + 16)) {
      goto LABEL_22;
    }
    double v22 = v49;
    unint64_t v23 = specialized __RawDictionaryStorage.find<A>(_:)(15);
    if ((v24 & 1) == 0) {
      goto LABEL_22;
    }
    outlined init with copy of Any(*(void *)(v10 + 56) + 32 * v23, (uint64_t)&v51);
    if ((swift_dynamicCast() & 1) == 0) {
      goto LABEL_22;
    }
    uint64_t v25 = v50;
    if (!*(void *)(v10 + 16)) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)&v49;
    unint64_t v27 = specialized __RawDictionaryStorage.find<A>(_:)(5);
    if ((v28 & 1) == 0) {
      goto LABEL_26;
    }
    outlined init with copy of Any(*(void *)(v10 + 56) + 32 * v27, (uint64_t)&v51);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_release();
      swift_bridgeObjectRelease();
      goto LABEL_23;
    }
    if (!*(void *)(v10 + 16)
      || (int v29 = LOBYTE(v49), v30 = specialized __RawDictionaryStorage.find<A>(_:)(7), (v31 & 1) == 0))
    {
LABEL_26:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t result = swift_release();
      goto LABEL_24;
    }
    outlined init with copy of Any(*(void *)(v10 + 56) + 32 * v30, (uint64_t)&v51);
    if ((swift_dynamicCast() & 1) == 0
      || (int v32 = specialized VoiceFeedbackMetricType.init(rawValue:)(*(unint64_t *)&v49), v32 == 8))
    {
      swift_release();
      swift_bridgeObjectRelease();
      goto LABEL_23;
    }
    int v37 = v32;
    if (*(void *)(v10 + 16) && (unint64_t v38 = specialized __RawDictionaryStorage.find<A>(_:)(12), (v39 & 1) != 0))
    {
      outlined init with copy of Any(*(void *)(v10 + 56) + 32 * v38, (uint64_t)&v51);
    }
    else
    {
      long long v51 = 0u;
      long long v52 = 0u;
    }
    swift_release();
    if (*((void *)&v52 + 1))
    {
      if (swift_dynamicCast())
      {
        if (*(void *)&v49 == 1) {
          char v40 = 1;
        }
        else {
          char v40 = 2;
        }
        if (v49 == 0.0) {
          unsigned __int8 v41 = 0;
        }
        else {
          unsigned __int8 v41 = v40;
        }
LABEL_43:
        if (v29) {
          double v42 = v22;
        }
        else {
          double v42 = v22 + 1.0;
        }
        LOBYTE(v51) = 24;
        *((double *)&v51 + 1) = v22;
        *(void *)&long long v52 = v26;
        *((void *)&v52 + 1) = v25;
        BOOL v53 = v22 == v42;
        unsigned __int8 v54 = v41;
        char v55 = v37;
        swift_bridgeObjectRetain();
        char v43 = specialized VoiceFeedbackAlerting.hasValidAlertType(in:)(a1);
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        if (v43)
        {
          double v35 = v22;
          int v36 = (v22 == v42) | (v41 << 8) | (v37 << 16);
          uint64_t v34 = 24;
          goto LABEL_25;
        }
        goto LABEL_23;
      }
    }
    else
    {
      outlined destroy of Any?((uint64_t)&v51);
    }
    unsigned __int8 v41 = 2;
    goto LABEL_43;
  }

  swift_release_n();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (*(void *)(v10 + 16)) {
    goto LABEL_8;
  }
LABEL_22:
  swift_release();
LABEL_23:
  uint64_t result = swift_bridgeObjectRelease();
LABEL_24:
  uint64_t v34 = 0;
  double v35 = 0.0;
  unint64_t v26 = 0;
  uint64_t v25 = 0;
  int v36 = 0;
LABEL_25:
  *(void *)a2 = v34;
  *(double *)(a2 + 8) = v35;
  *(void *)(a2 + 16) = v26;
  *(void *)(a2 + 24) = v25;
  *(_WORD *)(a2 + 32) = v36;
  *(unsigned char *)(a2 + 34) = BYTE2(v36);
  return result;
}

unint64_t lazy protocol witness table accessor for type BelowTargetZoneModel.CodingKeys and conformance BelowTargetZoneModel.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type BelowTargetZoneModel.CodingKeys and conformance BelowTargetZoneModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type BelowTargetZoneModel.CodingKeys and conformance BelowTargetZoneModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BelowTargetZoneModel.CodingKeys and conformance BelowTargetZoneModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type BelowTargetZoneModel.CodingKeys and conformance BelowTargetZoneModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type BelowTargetZoneModel.CodingKeys and conformance BelowTargetZoneModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BelowTargetZoneModel.CodingKeys and conformance BelowTargetZoneModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type BelowTargetZoneModel.CodingKeys and conformance BelowTargetZoneModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type BelowTargetZoneModel.CodingKeys and conformance BelowTargetZoneModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BelowTargetZoneModel.CodingKeys and conformance BelowTargetZoneModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type BelowTargetZoneModel.CodingKeys and conformance BelowTargetZoneModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type BelowTargetZoneModel.CodingKeys and conformance BelowTargetZoneModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BelowTargetZoneModel.CodingKeys and conformance BelowTargetZoneModel.CodingKeys);
  }
  return result;
}

uint64_t specialized BelowTargetZoneModel.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<BelowTargetZoneModel.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type BelowTargetZoneModel.CodingKeys and conformance BelowTargetZoneModel.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  }
  char v28 = 0;
  lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  char v9 = v29;
  char v27 = 1;
  KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v11 = v10;
  char v26 = 2;
  uint64_t v12 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v14 = v13;
  uint64_t v20 = v12;
  char v25 = 3;
  swift_bridgeObjectRetain();
  int v19 = KeyedDecodingContainer.decode(_:forKey:)();
  char v23 = 4;
  lazy protocol witness table accessor for type VoiceFeedbackPaceFormat and conformance VoiceFeedbackPaceFormat();
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
  int v18 = v24;
  char v21 = 5;
  lazy protocol witness table accessor for type VoiceFeedbackMetricType and conformance VoiceFeedbackMetricType();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  char v15 = v19 & 1;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  char v16 = v22;
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  uint64_t result = swift_bridgeObjectRelease();
  *(unsigned char *)a2 = v9;
  *(void *)(a2 + 8) = v11;
  *(void *)(a2 + 16) = v20;
  *(void *)(a2 + 24) = v14;
  *(unsigned char *)(a2 + 32) = v15;
  *(unsigned char *)(a2 + 33) = v18;
  *(unsigned char *)(a2 + 34) = v16;
  return result;
}

unint64_t instantiation function for generic protocol witness table for BelowTargetZoneModel(void *a1)
{
  a1[1] = lazy protocol witness table accessor for type BelowTargetZoneModel and conformance BelowTargetZoneModel();
  a1[2] = lazy protocol witness table accessor for type BelowTargetZoneModel and conformance BelowTargetZoneModel();
  unint64_t result = lazy protocol witness table accessor for type BelowTargetZoneModel and conformance BelowTargetZoneModel();
  a1[3] = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type BelowTargetZoneModel and conformance BelowTargetZoneModel()
{
  unint64_t result = lazy protocol witness table cache variable for type BelowTargetZoneModel and conformance BelowTargetZoneModel;
  if (!lazy protocol witness table cache variable for type BelowTargetZoneModel and conformance BelowTargetZoneModel)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BelowTargetZoneModel and conformance BelowTargetZoneModel);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type BelowTargetZoneModel and conformance BelowTargetZoneModel;
  if (!lazy protocol witness table cache variable for type BelowTargetZoneModel and conformance BelowTargetZoneModel)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BelowTargetZoneModel and conformance BelowTargetZoneModel);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type BelowTargetZoneModel and conformance BelowTargetZoneModel;
  if (!lazy protocol witness table cache variable for type BelowTargetZoneModel and conformance BelowTargetZoneModel)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BelowTargetZoneModel and conformance BelowTargetZoneModel);
  }
  return result;
}

ValueMetadata *type metadata accessor for BelowTargetZoneModel()
{
  return &type metadata for BelowTargetZoneModel;
}

unsigned char *storeEnumTagSinglePayload for BelowTargetZoneModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *unint64_t result = a2 + 5;
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
        JUMPOUT(0x2619BD4C0);
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
          *unint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

void *type metadata accessor for BelowTargetZoneModel.CodingKeys()
{
  return &unk_270D9BEF8;
}

uint64_t type metadata accessor for WorkoutVoiceFeedbackCATPatternsExecutor(uint64_t a1)
{
  return type metadata accessor for WorkoutReminderAnnouncementFlow.State(a1, (uint64_t *)&type metadata singleton initialization cache for WorkoutVoiceFeedbackCATPatternsExecutor);
}

uint64_t type metadata completion function for WorkoutVoiceFeedbackCATPatternsExecutor()
{
  return swift_initClassMetadata2();
}

uint64_t WorkoutVoiceFeedbackGoalCompletionParameters.asKeyValuePairs()()
{
  return WorkoutVoiceFeedbackGoalCompletionParameters.asKeyValuePairs()(type metadata accessor for WorkoutVoiceFeedbackGoalCompletionParameters);
}

uint64_t WorkoutVoiceFeedbackGoalHalfwayPointParameters.asKeyValuePairs()()
{
  return WorkoutVoiceFeedbackGoalCompletionParameters.asKeyValuePairs()(type metadata accessor for WorkoutVoiceFeedbackGoalHalfwayPointParameters);
}

uint64_t WorkoutVoiceFeedbackGoalCompletionParameters.asKeyValuePairs()(uint64_t (*a1)(void))
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_2619DAA50;
  *(void *)(v6 + 32) = 0x6E6F697461727564;
  *(void *)(v6 + 40) = 0xE800000000000000;
  uint64_t v7 = *v1;
  if (*v1)
  {
    uint64_t v8 = type metadata accessor for DialogDuration();
    uint64_t v9 = v7;
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v8 = 0;
    *(void *)(v6 + 56) = 0;
    *(void *)(v6 + 64) = 0;
  }
  *(void *)(v6 + 48) = v9;
  *(void *)(v6 + 72) = v8;
  *(void *)(v6 + 80) = 0xD000000000000017;
  *(void *)(v6 + 88) = 0x80000002619DC0D0;
  uint64_t v10 = MEMORY[0x263F8D4F8];
  *(unsigned char *)(v6 + 96) = *((unsigned char *)v1 + 8);
  *(void *)(v6 + 120) = v10;
  *(void *)(v6 + 128) = 0x6874676E656CLL;
  *(void *)(v6 + 136) = 0xE600000000000000;
  uint64_t v11 = v1[2];
  if (v11)
  {
    uint64_t v12 = type metadata accessor for DialogLength();
    uint64_t v13 = v11;
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v12 = 0;
    *(void *)(v6 + 152) = 0;
    *(void *)(v6 + 160) = 0;
  }
  *(void *)(v6 + 144) = v13;
  *(void *)(v6 + 168) = v12;
  *(void *)(v6 + 176) = 0x647574696E67616DLL;
  *(void *)(v6 + 184) = 0xE900000000000065;
  if (v1[4])
  {
    uint64_t v14 = 0;
    *(void *)(v6 + 200) = 0;
    *(void *)(v6 + 208) = 0;
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v15 = v1[3];
    uint64_t v14 = MEMORY[0x263F8D538];
  }
  *(void *)(v6 + 192) = v15;
  *(void *)(v6 + 216) = v14;
  *(void *)(v6 + 224) = 1953066613;
  *(void *)(v6 + 232) = 0xE400000000000000;
  uint64_t v16 = a1(0);
  outlined init with copy of URL?((uint64_t)v1 + *(int *)(v16 + 32), (uint64_t)v5, &demangling cache variable for type metadata for SpeakableString?);
  uint64_t v17 = type metadata accessor for SpeakableString();
  uint64_t v18 = *(void *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v5, 1, v17) == 1)
  {
    swift_retain();
    swift_retain();
    outlined destroy of Any?((uint64_t)v5, &demangling cache variable for type metadata for SpeakableString?);
    *(_OWORD *)(v6 + 240) = 0u;
    *(_OWORD *)(v6 + 256) = 0u;
  }
  else
  {
    *(void *)(v6 + 264) = v17;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v6 + 240));
    (*(void (**)(uint64_t *, char *, uint64_t))(v18 + 32))(boxed_opaque_existential_0, v5, v17);
    swift_retain();
    swift_retain();
  }
  return v6;
}

uint64_t WorkoutVoiceFeedbackIntervalUpcomingHeartRateZoneParameters.asKeyValuePairs()()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v44 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = v4;
  *(_OWORD *)(v4 + 16) = xmmword_2619DAA60;
  *(void *)(v4 + 32) = 0xD000000000000020;
  *(void *)(v4 + 40) = 0x80000002619DC5A0;
  uint64_t v6 = MEMORY[0x263F8D4F8];
  *(unsigned char *)(v4 + 48) = *(unsigned char *)v0;
  *(void *)(v4 + 72) = v6;
  *(void *)(v4 + 80) = 0xD000000000000013;
  *(void *)(v4 + 88) = 0x80000002619DC5D0;
  if (*(unsigned char *)(v0 + 16))
  {
    uint64_t v7 = 0;
    *(void *)(v4 + 104) = 0;
    *(void *)(v4 + 112) = 0;
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = *(void *)(v0 + 8);
    uint64_t v7 = MEMORY[0x263F8D538];
  }
  *(void *)(v4 + 120) = v7;
  *(void *)(v4 + 128) = 0xD000000000000017;
  *(void *)(v4 + 96) = v8;
  *(void *)(v4 + 136) = 0x80000002619DC0D0;
  *(unsigned char *)(v4 + 144) = *(unsigned char *)(v0 + 17);
  *(void *)(v4 + 168) = v6;
  *(void *)(v4 + 176) = 0x6E69577473726966;
  *(void *)(v4 + 184) = 0xEF657A6953776F64;
  if (*(unsigned char *)(v0 + 32))
  {
    uint64_t v9 = 0;
    *(void *)(v4 + 200) = 0;
    *(void *)(v4 + 208) = 0;
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = *(void *)(v0 + 24);
    uint64_t v9 = MEMORY[0x263F8D538];
  }
  *(void *)(v4 + 192) = v10;
  *(void *)(v4 + 216) = v9;
  *(void *)(v4 + 224) = 0xD000000000000012;
  *(void *)(v4 + 232) = 0x80000002619DC5F0;
  if (*(unsigned char *)(v0 + 48))
  {
    uint64_t v11 = 0;
    *(void *)(v4 + 248) = 0;
    *(void *)(v4 + 256) = 0;
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = *(void *)(v0 + 40);
    uint64_t v11 = MEMORY[0x263F8D538];
  }
  *(void *)(v4 + 240) = v12;
  *(void *)(v4 + 264) = v11;
  strcpy((char *)(v4 + 272), "goalDistance");
  *(unsigned char *)(v4 + 285) = 0;
  *(_WORD *)(v4 + 286) = -5120;
  uint64_t v13 = *(void *)(v0 + 56);
  if (v13)
  {
    uint64_t v14 = type metadata accessor for DialogLength();
    uint64_t v15 = v13;
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v14 = 0;
    *(void *)(v5 + 296) = 0;
    *(void *)(v5 + 304) = 0;
  }
  *(void *)(v5 + 288) = v15;
  *(void *)(v5 + 312) = v14;
  strcpy((char *)(v5 + 320), "goalDuration");
  *(unsigned char *)(v5 + 333) = 0;
  *(_WORD *)(v5 + 334) = -5120;
  uint64_t v16 = *(void *)(v0 + 64);
  if (v16)
  {
    uint64_t v17 = type metadata accessor for DialogDuration();
    uint64_t v18 = v16;
  }
  else
  {
    uint64_t v18 = 0;
    uint64_t v17 = 0;
    *(void *)(v5 + 344) = 0;
    *(void *)(v5 + 352) = 0;
  }
  *(void *)(v5 + 336) = v18;
  *(void *)(v5 + 360) = v17;
  strcpy((char *)(v5 + 368), "goalMagnitude");
  *(_WORD *)(v5 + 382) = -4864;
  if (*(unsigned char *)(v0 + 80))
  {
    uint64_t v19 = 0;
    *(void *)(v5 + 392) = 0;
    *(void *)(v5 + 400) = 0;
    uint64_t v20 = 0;
  }
  else
  {
    uint64_t v20 = *(void *)(v0 + 72);
    uint64_t v19 = MEMORY[0x263F8D538];
  }
  *(void *)(v5 + 384) = v20;
  *(void *)(v5 + 408) = v19;
  *(void *)(v5 + 416) = 0x74696E556C616F67;
  *(void *)(v5 + 424) = 0xE800000000000000;
  uint64_t v21 = (int *)type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingHeartRateZoneParameters(0);
  outlined init with copy of URL?(v0 + v21[12], (uint64_t)v3, &demangling cache variable for type metadata for SpeakableString?);
  uint64_t v22 = type metadata accessor for SpeakableString();
  uint64_t v23 = *(void *)(v22 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v3, 1, v22) == 1)
  {
    swift_retain();
    swift_retain();
    outlined destroy of Any?((uint64_t)v3, &demangling cache variable for type metadata for SpeakableString?);
    *(_OWORD *)(v5 + 432) = 0u;
    *(_OWORD *)(v5 + 448) = 0u;
  }
  else
  {
    *(void *)(v5 + 456) = v22;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v5 + 432));
    (*(void (**)(uint64_t *, char *, uint64_t))(v23 + 32))(boxed_opaque_existential_0, v3, v22);
    swift_retain();
    swift_retain();
  }
  uint64_t v25 = MEMORY[0x263F8D4F8];
  strcpy((char *)(v5 + 464), "isFirstWindow");
  *(_WORD *)(v5 + 478) = -4864;
  *(unsigned char *)(v5 + 480) = *(unsigned char *)(v0 + v21[13]);
  *(void *)(v5 + 504) = v25;
  strcpy((char *)(v5 + 512), "isLastWindow");
  *(unsigned char *)(v5 + 525) = 0;
  *(_WORD *)(v5 + 526) = -5120;
  char v26 = *(unsigned char *)(v0 + v21[14]);
  *(void *)(v5 + 552) = v25;
  *(unsigned char *)(v5 + 528) = v26;
  *(void *)(v5 + 560) = 0xD000000000000016;
  *(void *)(v5 + 568) = 0x80000002619DC610;
  char v27 = *(unsigned char *)(v0 + v21[15]);
  *(void *)(v5 + 600) = v25;
  *(unsigned char *)(v5 + 576) = v27;
  *(void *)(v5 + 608) = 0xD000000000000010;
  *(void *)(v5 + 616) = 0x80000002619DC630;
  uint64_t v28 = *(void *)(v0 + v21[16]);
  if (v28)
  {
    uint64_t v29 = type metadata accessor for DialogLength();
    uint64_t v30 = v28;
  }
  else
  {
    uint64_t v30 = 0;
    uint64_t v29 = 0;
    *(_OWORD *)(v5 + 632) = 0u;
  }
  *(void *)(v5 + 624) = v30;
  *(void *)(v5 + 648) = v29;
  *(void *)(v5 + 656) = 0xD000000000000010;
  *(void *)(v5 + 664) = 0x80000002619DC650;
  uint64_t v31 = *(void *)(v0 + v21[17]);
  if (v31)
  {
    uint64_t v32 = type metadata accessor for DialogDuration();
    uint64_t v33 = v31;
  }
  else
  {
    uint64_t v33 = 0;
    uint64_t v32 = 0;
    *(_OWORD *)(v5 + 680) = 0u;
  }
  *(void *)(v5 + 672) = v33;
  *(void *)(v5 + 696) = v32;
  *(void *)(v5 + 704) = 0xD000000000000014;
  *(void *)(v5 + 712) = 0x80000002619DC670;
  uint64_t v34 = (uint64_t *)(v0 + v21[18]);
  if (v34[1])
  {
    uint64_t v35 = 0;
    *(_OWORD *)(v5 + 728) = 0u;
    uint64_t v36 = 0;
  }
  else
  {
    uint64_t v36 = *v34;
    uint64_t v35 = MEMORY[0x263F8D538];
  }
  *(void *)(v5 + 720) = v36;
  *(void *)(v5 + 744) = v35;
  *(void *)(v5 + 752) = 0x6953776F646E6977;
  *(void *)(v5 + 760) = 0xEA0000000000657ALL;
  int v37 = (uint64_t *)(v0 + v21[19]);
  if (v37[1])
  {
    uint64_t v38 = 0;
    *(_OWORD *)(v5 + 776) = 0u;
    uint64_t v39 = 0;
  }
  else
  {
    uint64_t v39 = *v37;
    uint64_t v38 = MEMORY[0x263F8D538];
  }
  *(void *)(v5 + 768) = v39;
  *(void *)(v5 + 792) = v38;
  *(void *)(v5 + 800) = 0x65646E49656E6F7ALL;
  *(void *)(v5 + 808) = 0xE900000000000078;
  char v40 = (uint64_t *)(v0 + v21[20]);
  if (v40[1])
  {
    uint64_t v41 = 0;
    *(_OWORD *)(v5 + 824) = 0u;
    uint64_t v42 = 0;
  }
  else
  {
    uint64_t v42 = *v40;
    uint64_t v41 = MEMORY[0x263F8D538];
  }
  *(void *)(v5 + 816) = v42;
  *(void *)(v5 + 840) = v41;
  swift_retain();
  swift_retain();
  return v5;
}

uint64_t WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters.asKeyValuePairs()()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v50 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = v4;
  *(_OWORD *)(v4 + 16) = xmmword_2619DAA70;
  *(void *)(v4 + 32) = 0xD000000000000020;
  *(void *)(v4 + 40) = 0x80000002619DC5A0;
  uint64_t v6 = MEMORY[0x263F8D4F8];
  *(unsigned char *)(v4 + 48) = *(unsigned char *)v0;
  *(void *)(v4 + 72) = v6;
  *(void *)(v4 + 80) = 0xD000000000000013;
  *(void *)(v4 + 88) = 0x80000002619DC5D0;
  if (*(unsigned char *)(v0 + 16))
  {
    uint64_t v7 = 0;
    *(void *)(v4 + 104) = 0;
    *(void *)(v4 + 112) = 0;
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = *(void *)(v0 + 8);
    uint64_t v7 = MEMORY[0x263F8D538];
  }
  *(void *)(v4 + 120) = v7;
  *(void *)(v4 + 128) = 0xD000000000000017;
  *(void *)(v4 + 96) = v8;
  *(void *)(v4 + 136) = 0x80000002619DC0D0;
  *(unsigned char *)(v4 + 144) = *(unsigned char *)(v0 + 17);
  *(void *)(v4 + 168) = v6;
  *(void *)(v4 + 176) = 0x6E69577473726966;
  *(void *)(v4 + 184) = 0xEF657A6953776F64;
  if (*(unsigned char *)(v0 + 32))
  {
    uint64_t v9 = 0;
    *(void *)(v4 + 200) = 0;
    *(void *)(v4 + 208) = 0;
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = *(void *)(v0 + 24);
    uint64_t v9 = MEMORY[0x263F8D538];
  }
  *(void *)(v4 + 192) = v10;
  *(void *)(v4 + 216) = v9;
  *(void *)(v4 + 224) = 0xD000000000000012;
  *(void *)(v4 + 232) = 0x80000002619DC5F0;
  if (*(unsigned char *)(v0 + 48))
  {
    uint64_t v11 = 0;
    *(void *)(v4 + 248) = 0;
    *(void *)(v4 + 256) = 0;
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = *(void *)(v0 + 40);
    uint64_t v11 = MEMORY[0x263F8D538];
  }
  *(void *)(v4 + 240) = v12;
  *(void *)(v4 + 264) = v11;
  strcpy((char *)(v4 + 272), "goalDistance");
  *(unsigned char *)(v4 + 285) = 0;
  *(_WORD *)(v4 + 286) = -5120;
  uint64_t v13 = *(void *)(v0 + 56);
  if (v13)
  {
    uint64_t v14 = type metadata accessor for DialogLength();
    uint64_t v15 = v13;
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v14 = 0;
    *(void *)(v5 + 296) = 0;
    *(void *)(v5 + 304) = 0;
  }
  *(void *)(v5 + 288) = v15;
  *(void *)(v5 + 312) = v14;
  strcpy((char *)(v5 + 320), "goalDuration");
  *(unsigned char *)(v5 + 333) = 0;
  *(_WORD *)(v5 + 334) = -5120;
  uint64_t v16 = *(void *)(v0 + 64);
  if (v16)
  {
    uint64_t v17 = type metadata accessor for DialogDuration();
    uint64_t v18 = v16;
  }
  else
  {
    uint64_t v18 = 0;
    uint64_t v17 = 0;
    *(void *)(v5 + 344) = 0;
    *(void *)(v5 + 352) = 0;
  }
  *(void *)(v5 + 336) = v18;
  *(void *)(v5 + 360) = v17;
  strcpy((char *)(v5 + 368), "goalMagnitude");
  *(_WORD *)(v5 + 382) = -4864;
  if (*(unsigned char *)(v0 + 80))
  {
    uint64_t v19 = 0;
    *(void *)(v5 + 392) = 0;
    *(void *)(v5 + 400) = 0;
    uint64_t v20 = 0;
  }
  else
  {
    uint64_t v20 = *(void *)(v0 + 72);
    uint64_t v19 = MEMORY[0x263F8D538];
  }
  *(void *)(v5 + 384) = v20;
  *(void *)(v5 + 408) = v19;
  *(void *)(v5 + 416) = 0x74696E556C616F67;
  *(void *)(v5 + 424) = 0xE800000000000000;
  uint64_t v21 = (int *)type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters(0);
  outlined init with copy of URL?(v0 + v21[12], (uint64_t)v3, &demangling cache variable for type metadata for SpeakableString?);
  uint64_t v22 = type metadata accessor for SpeakableString();
  uint64_t v23 = *(void *)(v22 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v3, 1, v22) == 1)
  {
    swift_retain();
    swift_retain();
    outlined destroy of Any?((uint64_t)v3, &demangling cache variable for type metadata for SpeakableString?);
    *(_OWORD *)(v5 + 432) = 0u;
    *(_OWORD *)(v5 + 448) = 0u;
  }
  else
  {
    *(void *)(v5 + 456) = v22;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v5 + 432));
    (*(void (**)(uint64_t *, char *, uint64_t))(v23 + 32))(boxed_opaque_existential_0, v3, v22);
    swift_retain();
    swift_retain();
  }
  *(void *)(v5 + 464) = 0x636E656461437369;
  *(void *)(v5 + 472) = 0xE900000000000065;
  *(unsigned char *)(v5 + 480) = *(unsigned char *)(v0 + v21[13]);
  *(void *)(v5 + 504) = v6;
  strcpy((char *)(v5 + 512), "isFirstWindow");
  *(_WORD *)(v5 + 526) = -4864;
  char v25 = *(unsigned char *)(v0 + v21[14]);
  *(void *)(v5 + 552) = v6;
  *(unsigned char *)(v5 + 528) = v25;
  *(void *)(v5 + 560) = 0x5274726165487369;
  *(void *)(v5 + 568) = 0xEB00000000657461;
  char v26 = *(unsigned char *)(v0 + v21[15]);
  *(void *)(v5 + 600) = v6;
  *(unsigned char *)(v5 + 576) = v26;
  strcpy((char *)(v5 + 608), "isLastWindow");
  *(unsigned char *)(v5 + 621) = 0;
  *(_WORD *)(v5 + 622) = -5120;
  char v27 = *(unsigned char *)(v0 + v21[16]);
  *(void *)(v5 + 648) = v6;
  *(unsigned char *)(v5 + 624) = v27;
  *(void *)(v5 + 656) = 0xD000000000000016;
  *(void *)(v5 + 664) = 0x80000002619DC610;
  char v28 = *(unsigned char *)(v0 + v21[17]);
  *(void *)(v5 + 696) = v6;
  *(unsigned char *)(v5 + 672) = v28;
  *(void *)(v5 + 704) = 0x7265776F507369;
  *(void *)(v5 + 712) = 0xE700000000000000;
  char v29 = *(unsigned char *)(v0 + v21[18]);
  *(void *)(v5 + 744) = v6;
  *(unsigned char *)(v5 + 720) = v29;
  *(void *)(v5 + 752) = 0xD000000000000011;
  *(void *)(v5 + 760) = 0x80000002619DBBF0;
  char v30 = *(unsigned char *)(v0 + v21[19]);
  *(void *)(v5 + 792) = v6;
  *(unsigned char *)(v5 + 768) = v30;
  strcpy((char *)(v5 + 800), "maxMagnitude");
  *(unsigned char *)(v5 + 813) = 0;
  *(_WORD *)(v5 + 814) = -5120;
  uint64_t v31 = (uint64_t *)(v0 + v21[20]);
  if (v31[1])
  {
    uint64_t v32 = 0;
    *(_OWORD *)(v5 + 824) = 0u;
    uint64_t v33 = 0;
  }
  else
  {
    uint64_t v33 = *v31;
    uint64_t v32 = MEMORY[0x263F8D538];
  }
  *(void *)(v5 + 816) = v33;
  *(void *)(v5 + 840) = v32;
  strcpy((char *)(v5 + 848), "minMagnitude");
  *(unsigned char *)(v5 + 861) = 0;
  *(_WORD *)(v5 + 862) = -5120;
  uint64_t v34 = (uint64_t *)(v0 + v21[21]);
  if (v34[1])
  {
    uint64_t v35 = 0;
    *(_OWORD *)(v5 + 872) = 0u;
    uint64_t v36 = 0;
  }
  else
  {
    uint64_t v36 = *v34;
    uint64_t v35 = MEMORY[0x263F8D538];
  }
  *(void *)(v5 + 864) = v36;
  *(void *)(v5 + 888) = v35;
  *(void *)(v5 + 896) = 0xD000000000000010;
  *(void *)(v5 + 904) = 0x80000002619DC630;
  uint64_t v37 = *(void *)(v0 + v21[22]);
  if (v37)
  {
    uint64_t v38 = type metadata accessor for DialogLength();
    uint64_t v39 = v37;
  }
  else
  {
    uint64_t v39 = 0;
    uint64_t v38 = 0;
    *(_OWORD *)(v5 + 920) = 0u;
  }
  *(void *)(v5 + 912) = v39;
  *(void *)(v5 + 936) = v38;
  *(void *)(v5 + 944) = 0xD000000000000010;
  *(void *)(v5 + 952) = 0x80000002619DC650;
  uint64_t v40 = *(void *)(v0 + v21[23]);
  if (v40)
  {
    uint64_t v41 = type metadata accessor for DialogDuration();
    uint64_t v42 = v40;
  }
  else
  {
    uint64_t v42 = 0;
    uint64_t v41 = 0;
    *(_OWORD *)(v5 + 968) = 0u;
  }
  *(void *)(v5 + 960) = v42;
  *(void *)(v5 + 984) = v41;
  *(void *)(v5 + 992) = 0xD000000000000014;
  *(void *)(v5 + 1000) = 0x80000002619DC670;
  char v43 = (uint64_t *)(v0 + v21[24]);
  if (v43[1])
  {
    uint64_t v44 = 0;
    *(_OWORD *)(v5 + 1016) = 0u;
    uint64_t v45 = 0;
  }
  else
  {
    uint64_t v45 = *v43;
    uint64_t v44 = MEMORY[0x263F8D538];
  }
  *(void *)(v5 + 1008) = v45;
  *(void *)(v5 + 1032) = v44;
  *(void *)(v5 + 1040) = 0x6953776F646E6977;
  *(void *)(v5 + 1048) = 0xEA0000000000657ALL;
  uint64_t v46 = (uint64_t *)(v0 + v21[25]);
  if (v46[1])
  {
    uint64_t v47 = 0;
    *(_OWORD *)(v5 + 1064) = 0u;
    uint64_t v48 = 0;
  }
  else
  {
    uint64_t v48 = *v46;
    uint64_t v47 = MEMORY[0x263F8D538];
  }
  *(void *)(v5 + 1056) = v48;
  *(void *)(v5 + 1080) = v47;
  swift_retain();
  swift_retain();
  return v5;
}

uint64_t WorkoutVoiceFeedbackIntervalUpcomingPaceParameters.asKeyValuePairs()()
{
  return WorkoutVoiceFeedbackIntervalUpcomingPaceParameters.asKeyValuePairs()(type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingPaceParameters, MEMORY[0x263F6D018], 0x6563615078616DLL, 0xE700000000000000, 0x656361506E696DLL);
}

uint64_t WorkoutVoiceFeedbackIntervalUpcomingSpeedParameters.asKeyValuePairs()()
{
  return WorkoutVoiceFeedbackIntervalUpcomingPaceParameters.asKeyValuePairs()(type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingSpeedParameters, MEMORY[0x263F6CFC8], 0x646565705378616DLL, 0xE800000000000000, 0x64656570536E696DLL);
}

uint64_t WorkoutVoiceFeedbackIntervalUpcomingPaceParameters.asKeyValuePairs()(uint64_t (*a1)(void), uint64_t (*a2)(void), uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v63 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  uint64_t v14 = swift_allocObject();
  uint64_t v15 = v14;
  *(_OWORD *)(v14 + 16) = xmmword_2619DAA80;
  *(void *)(v14 + 32) = 0xD000000000000020;
  *(void *)(v14 + 40) = 0x80000002619DC5A0;
  uint64_t v16 = MEMORY[0x263F8D4F8];
  *(unsigned char *)(v14 + 48) = *(unsigned char *)v5;
  *(void *)(v14 + 72) = v16;
  *(void *)(v14 + 80) = 0xD000000000000013;
  *(void *)(v14 + 88) = 0x80000002619DC5D0;
  if (*(unsigned char *)(v5 + 16))
  {
    uint64_t v17 = 0;
    *(void *)(v14 + 104) = 0;
    *(void *)(v14 + 112) = 0;
    uint64_t v18 = 0;
  }
  else
  {
    uint64_t v18 = *(void *)(v5 + 8);
    uint64_t v17 = MEMORY[0x263F8D538];
  }
  *(void *)(v14 + 120) = v17;
  *(void *)(v14 + 128) = 0xD000000000000017;
  *(void *)(v14 + 96) = v18;
  *(void *)(v14 + 136) = 0x80000002619DC0D0;
  *(unsigned char *)(v14 + 144) = *(unsigned char *)(v5 + 17);
  *(void *)(v14 + 168) = v16;
  *(void *)(v14 + 176) = 0x6E69577473726966;
  *(void *)(v14 + 184) = 0xEF657A6953776F64;
  if (*(unsigned char *)(v5 + 32))
  {
    uint64_t v19 = 0;
    *(void *)(v14 + 200) = 0;
    *(void *)(v14 + 208) = 0;
    uint64_t v20 = 0;
  }
  else
  {
    uint64_t v20 = *(void *)(v5 + 24);
    uint64_t v19 = MEMORY[0x263F8D538];
  }
  *(void *)(v14 + 192) = v20;
  *(void *)(v14 + 216) = v19;
  *(void *)(v14 + 224) = 0xD000000000000012;
  *(void *)(v14 + 232) = 0x80000002619DC5F0;
  char v21 = *(unsigned char *)(v5 + 48);
  uint64_t v65 = a5;
  uint64_t v66 = a4;
  uint64_t v64 = a3;
  if (v21)
  {
    uint64_t v22 = 0;
    *(void *)(v14 + 248) = 0;
    *(void *)(v14 + 256) = 0;
    uint64_t v23 = 0;
  }
  else
  {
    uint64_t v23 = *(void *)(v5 + 40);
    uint64_t v22 = MEMORY[0x263F8D538];
  }
  *(void *)(v14 + 240) = v23;
  *(void *)(v14 + 264) = v22;
  strcpy((char *)(v14 + 272), "goalDistance");
  *(unsigned char *)(v14 + 285) = 0;
  *(_WORD *)(v14 + 286) = -5120;
  uint64_t v24 = *(void *)(v5 + 56);
  if (v24)
  {
    uint64_t v25 = type metadata accessor for DialogLength();
    uint64_t v26 = v24;
  }
  else
  {
    uint64_t v26 = 0;
    uint64_t v25 = 0;
    *(void *)(v15 + 296) = 0;
    *(void *)(v15 + 304) = 0;
  }
  *(void *)(v15 + 288) = v26;
  *(void *)(v15 + 312) = v25;
  strcpy((char *)(v15 + 320), "goalDuration");
  *(unsigned char *)(v15 + 333) = 0;
  *(_WORD *)(v15 + 334) = -5120;
  uint64_t v27 = *(void *)(v5 + 64);
  if (v27)
  {
    uint64_t v28 = type metadata accessor for DialogDuration();
    uint64_t v29 = v27;
  }
  else
  {
    uint64_t v29 = 0;
    uint64_t v28 = 0;
    *(void *)(v15 + 344) = 0;
    *(void *)(v15 + 352) = 0;
  }
  *(void *)(v15 + 336) = v29;
  *(void *)(v15 + 360) = v28;
  strcpy((char *)(v15 + 368), "goalMagnitude");
  *(_WORD *)(v15 + 382) = -4864;
  char v30 = a2;
  if (*(unsigned char *)(v5 + 80))
  {
    uint64_t v31 = 0;
    *(void *)(v15 + 392) = 0;
    *(void *)(v15 + 400) = 0;
    uint64_t v32 = 0;
  }
  else
  {
    uint64_t v32 = *(void *)(v5 + 72);
    uint64_t v31 = MEMORY[0x263F8D538];
  }
  *(void *)(v15 + 384) = v32;
  *(void *)(v15 + 408) = v31;
  *(void *)(v15 + 416) = 0x74696E556C616F67;
  *(void *)(v15 + 424) = 0xE800000000000000;
  uint64_t v33 = (int *)a1(0);
  outlined init with copy of URL?(v5 + v33[12], (uint64_t)v13, &demangling cache variable for type metadata for SpeakableString?);
  uint64_t v34 = type metadata accessor for SpeakableString();
  uint64_t v35 = *(void *)(v34 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v13, 1, v34) == 1)
  {
    swift_retain();
    swift_retain();
    outlined destroy of Any?((uint64_t)v13, &demangling cache variable for type metadata for SpeakableString?);
    *(_OWORD *)(v15 + 432) = 0u;
    *(_OWORD *)(v15 + 448) = 0u;
  }
  else
  {
    *(void *)(v15 + 456) = v34;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v15 + 432));
    (*(void (**)(uint64_t *, char *, uint64_t))(v35 + 32))(boxed_opaque_existential_0, v13, v34);
    swift_retain();
    swift_retain();
  }
  uint64_t v38 = v65;
  uint64_t v37 = v66;
  uint64_t v39 = v64;
  uint64_t v40 = MEMORY[0x263F8D4F8];
  strcpy((char *)(v15 + 464), "isFirstWindow");
  *(_WORD *)(v15 + 478) = -4864;
  *(unsigned char *)(v15 + 480) = *(unsigned char *)(v5 + v33[13]);
  *(void *)(v15 + 504) = v40;
  strcpy((char *)(v15 + 512), "isLastWindow");
  *(unsigned char *)(v15 + 525) = 0;
  *(_WORD *)(v15 + 526) = -5120;
  char v41 = *(unsigned char *)(v5 + v33[14]);
  *(void *)(v15 + 552) = v40;
  *(unsigned char *)(v15 + 528) = v41;
  *(void *)(v15 + 560) = 0xD000000000000016;
  *(void *)(v15 + 568) = 0x80000002619DC610;
  char v42 = *(unsigned char *)(v5 + v33[15]);
  *(void *)(v15 + 600) = v40;
  *(unsigned char *)(v15 + 576) = v42;
  *(void *)(v15 + 608) = 0xD000000000000011;
  *(void *)(v15 + 616) = 0x80000002619DBBF0;
  char v43 = *(unsigned char *)(v5 + v33[16]);
  *(void *)(v15 + 648) = v40;
  *(unsigned char *)(v15 + 624) = v43;
  *(void *)(v15 + 656) = v39;
  *(void *)(v15 + 664) = v37;
  uint64_t v44 = *(void *)(v5 + v33[17]);
  if (v44)
  {
    uint64_t v45 = v30(0);
    uint64_t v46 = v44;
  }
  else
  {
    uint64_t v46 = 0;
    uint64_t v45 = 0;
    *(_OWORD *)(v15 + 680) = 0u;
  }
  *(void *)(v15 + 672) = v46;
  *(void *)(v15 + 696) = v45;
  *(void *)(v15 + 704) = v38;
  *(void *)(v15 + 712) = v37;
  uint64_t v47 = *(void *)(v5 + v33[18]);
  if (v47)
  {
    uint64_t v48 = v30(0);
    uint64_t v49 = v47;
  }
  else
  {
    uint64_t v49 = 0;
    uint64_t v48 = 0;
    *(_OWORD *)(v15 + 728) = 0u;
  }
  *(void *)(v15 + 720) = v49;
  *(void *)(v15 + 744) = v48;
  *(void *)(v15 + 752) = 0xD000000000000010;
  *(void *)(v15 + 760) = 0x80000002619DC630;
  uint64_t v50 = *(void *)(v5 + v33[19]);
  if (v50)
  {
    uint64_t v51 = type metadata accessor for DialogLength();
    uint64_t v52 = v50;
  }
  else
  {
    uint64_t v52 = 0;
    uint64_t v51 = 0;
    *(_OWORD *)(v15 + 776) = 0u;
  }
  *(void *)(v15 + 768) = v52;
  *(void *)(v15 + 792) = v51;
  *(void *)(v15 + 800) = 0xD000000000000010;
  *(void *)(v15 + 808) = 0x80000002619DC650;
  uint64_t v53 = *(void *)(v5 + v33[20]);
  if (v53)
  {
    uint64_t v54 = type metadata accessor for DialogDuration();
    uint64_t v55 = v53;
  }
  else
  {
    uint64_t v55 = 0;
    uint64_t v54 = 0;
    *(_OWORD *)(v15 + 824) = 0u;
  }
  *(void *)(v15 + 816) = v55;
  *(void *)(v15 + 840) = v54;
  *(void *)(v15 + 848) = 0xD000000000000014;
  *(void *)(v15 + 856) = 0x80000002619DC670;
  uint64_t v56 = (uint64_t *)(v5 + v33[21]);
  if (v56[1])
  {
    uint64_t v57 = 0;
    *(_OWORD *)(v15 + 872) = 0u;
    uint64_t v58 = 0;
  }
  else
  {
    uint64_t v58 = *v56;
    uint64_t v57 = MEMORY[0x263F8D538];
  }
  *(void *)(v15 + 864) = v58;
  *(void *)(v15 + 888) = v57;
  *(void *)(v15 + 896) = 0x6953776F646E6977;
  *(void *)(v15 + 904) = 0xEA0000000000657ALL;
  uint64_t v59 = (uint64_t *)(v5 + v33[22]);
  if (v59[1])
  {
    uint64_t v60 = 0;
    *(_OWORD *)(v15 + 920) = 0u;
    uint64_t v61 = 0;
  }
  else
  {
    uint64_t v61 = *v59;
    uint64_t v60 = MEMORY[0x263F8D538];
  }
  *(void *)(v15 + 912) = v61;
  *(void *)(v15 + 936) = v60;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return v15;
}

uint64_t WorkoutVoiceFeedbackLapCompletionPaceParameters.asKeyValuePairs()()
{
  return WorkoutVoiceFeedbackLapCompletionPaceParameters.asKeyValuePairs()(0x7865646E4970616CLL, 0xE800000000000000, type metadata accessor for WorkoutVoiceFeedbackLapCompletionPaceParameters);
}

uint64_t WorkoutVoiceFeedbackTransitionedNotableDistancePaceParameters.asKeyValuePairs()()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_2619DAA50;
  *(void *)(v4 + 32) = 0x6E6F697461727564;
  *(void *)(v4 + 40) = 0xE800000000000000;
  uint64_t v5 = *v0;
  if (*v0)
  {
    uint64_t v6 = type metadata accessor for DialogDuration();
    uint64_t v7 = v5;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
    *(void *)(v4 + 56) = 0;
    *(void *)(v4 + 64) = 0;
  }
  *(void *)(v4 + 48) = v7;
  *(void *)(v4 + 72) = v6;
  *(void *)(v4 + 80) = 0xD000000000000017;
  *(void *)(v4 + 88) = 0x80000002619DC0D0;
  uint64_t v8 = MEMORY[0x263F8D4F8];
  *(unsigned char *)(v4 + 96) = *((unsigned char *)v0 + 8);
  *(void *)(v4 + 120) = v8;
  strcpy((char *)(v4 + 128), "paceDuration");
  *(unsigned char *)(v4 + 141) = 0;
  *(_WORD *)(v4 + 142) = -5120;
  uint64_t v9 = v0[2];
  if (v9)
  {
    uint64_t v10 = type metadata accessor for DialogDuration();
    uint64_t v11 = v9;
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v10 = 0;
    *(void *)(v4 + 152) = 0;
    *(void *)(v4 + 160) = 0;
  }
  *(void *)(v4 + 144) = v11;
  *(void *)(v4 + 168) = v10;
  *(void *)(v4 + 176) = 0x74696C7073;
  *(void *)(v4 + 184) = 0xE500000000000000;
  if (v0[4])
  {
    uint64_t v12 = 0;
    *(void *)(v4 + 200) = 0;
    *(void *)(v4 + 208) = 0;
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v13 = v0[3];
    uint64_t v12 = MEMORY[0x263F8D538];
  }
  *(void *)(v4 + 192) = v13;
  *(void *)(v4 + 216) = v12;
  *(void *)(v4 + 224) = 1953066613;
  *(void *)(v4 + 232) = 0xE400000000000000;
  uint64_t v14 = type metadata accessor for WorkoutVoiceFeedbackTransitionedNotableDistancePaceParameters(0);
  outlined init with copy of URL?((uint64_t)v0 + *(int *)(v14 + 32), (uint64_t)v3, &demangling cache variable for type metadata for SpeakableString?);
  uint64_t v15 = type metadata accessor for SpeakableString();
  uint64_t v16 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v3, 1, v15) == 1)
  {
    swift_retain();
    swift_retain();
    outlined destroy of Any?((uint64_t)v3, &demangling cache variable for type metadata for SpeakableString?);
    *(_OWORD *)(v4 + 240) = 0u;
    *(_OWORD *)(v4 + 256) = 0u;
  }
  else
  {
    *(void *)(v4 + 264) = v15;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v4 + 240));
    (*(void (**)(uint64_t *, char *, uint64_t))(v16 + 32))(boxed_opaque_existential_0, v3, v15);
    swift_retain();
    swift_retain();
  }
  return v4;
}

uint64_t WorkoutVoiceFeedbackTransitionedNotableDistanceSpeedParameters.asKeyValuePairs()()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_2619DAA90;
  *(void *)(v1 + 32) = 0x6E6F697461727564;
  *(void *)(v1 + 40) = 0xE800000000000000;
  outlined init with take of BelowTargetZoneModel?(v0, (uint64_t)v12, &demangling cache variable for type metadata for DialogDuration?);
  outlined init with take of BelowTargetZoneModel?((uint64_t)v12, (uint64_t)&v13, &demangling cache variable for type metadata for DialogDuration?);
  uint64_t v2 = v13;
  if (v13)
  {
    uint64_t v3 = type metadata accessor for DialogDuration();
  }
  else
  {
    uint64_t v3 = 0;
    *(void *)(v1 + 56) = 0;
    *(void *)(v1 + 64) = 0;
  }
  *(void *)(v1 + 48) = v2;
  *(void *)(v1 + 72) = v3;
  *(void *)(v1 + 80) = 0xD000000000000017;
  *(void *)(v1 + 88) = 0x80000002619DC0D0;
  uint64_t v4 = MEMORY[0x263F8D4F8];
  *(unsigned char *)(v1 + 96) = *(unsigned char *)(v0 + 8);
  *(void *)(v1 + 120) = v4;
  *(void *)(v1 + 128) = 0x6874676E656CLL;
  *(void *)(v1 + 136) = 0xE600000000000000;
  outlined init with take of BelowTargetZoneModel?(v0 + 16, (uint64_t)v11, &demangling cache variable for type metadata for DialogLength?);
  outlined init with take of BelowTargetZoneModel?((uint64_t)v11, (uint64_t)&v14, &demangling cache variable for type metadata for DialogLength?);
  uint64_t v5 = v14;
  if (v14)
  {
    uint64_t v6 = type metadata accessor for DialogLength();
  }
  else
  {
    uint64_t v6 = 0;
    *(void *)(v1 + 152) = 0;
    *(void *)(v1 + 160) = 0;
  }
  *(void *)(v1 + 144) = v5;
  *(void *)(v1 + 168) = v6;
  *(void *)(v1 + 176) = 0x74696C7073;
  *(void *)(v1 + 184) = 0xE500000000000000;
  outlined init with take of BelowTargetZoneModel?(v0 + 24, (uint64_t)v10, &demangling cache variable for type metadata for Double?);
  outlined init with take of BelowTargetZoneModel?((uint64_t)v10, (uint64_t)&v15, &demangling cache variable for type metadata for Double?);
  if (v16)
  {
    uint64_t v7 = 0;
    *(void *)(v1 + 200) = 0;
    *(void *)(v1 + 208) = 0;
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v7 = MEMORY[0x263F8D538];
    uint64_t v8 = v15;
  }
  *(void *)(v1 + 192) = v8;
  *(void *)(v1 + 216) = v7;
  outlined retain of DialogLength?((uint64_t)v12);
  outlined retain of DialogLength?((uint64_t)v11);
  return v1;
}

uint64_t WorkoutVoiceFeedbackZoneEnteredPaceParameters.asKeyValuePairs()()
{
  return WorkoutVoiceFeedbackLapCompletionPaceParameters.asKeyValuePairs()(0x63697274656DLL, 0xE600000000000000, type metadata accessor for WorkoutVoiceFeedbackZoneEnteredPaceParameters);
}

uint64_t WorkoutVoiceFeedbackLapCompletionPaceParameters.asKeyValuePairs()(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  uint64_t v10 = swift_allocObject();
  uint64_t v11 = v10;
  *(_OWORD *)(v10 + 16) = xmmword_2619DAA90;
  *(void *)(v10 + 32) = 0xD000000000000017;
  *(void *)(v10 + 40) = 0x80000002619DC0D0;
  uint64_t v12 = MEMORY[0x263F8D4F8];
  *(unsigned char *)(v10 + 48) = *(unsigned char *)v3;
  *(void *)(v10 + 72) = v12;
  *(void *)(v10 + 80) = a1;
  *(void *)(v10 + 88) = a2;
  if (*(unsigned char *)(v3 + 16))
  {
    uint64_t v13 = 0;
    *(void *)(v10 + 104) = 0;
    *(void *)(v10 + 112) = 0;
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v14 = *(void *)(v3 + 8);
    uint64_t v13 = MEMORY[0x263F8D538];
  }
  *(void *)(v10 + 96) = v14;
  *(void *)(v10 + 120) = v13;
  strcpy((char *)(v10 + 128), "paceDuration");
  *(unsigned char *)(v10 + 141) = 0;
  *(_WORD *)(v10 + 142) = -5120;
  uint64_t v15 = *(void *)(v3 + 24);
  if (v15)
  {
    uint64_t v16 = type metadata accessor for DialogDuration();
    uint64_t v17 = v15;
  }
  else
  {
    uint64_t v17 = 0;
    uint64_t v16 = 0;
    *(void *)(v11 + 152) = 0;
    *(void *)(v11 + 160) = 0;
  }
  *(void *)(v11 + 144) = v17;
  *(void *)(v11 + 168) = v16;
  *(void *)(v11 + 176) = 1953066613;
  *(void *)(v11 + 184) = 0xE400000000000000;
  uint64_t v18 = a3(0);
  outlined init with copy of URL?(v3 + *(int *)(v18 + 28), (uint64_t)v9, &demangling cache variable for type metadata for SpeakableString?);
  uint64_t v19 = type metadata accessor for SpeakableString();
  uint64_t v20 = *(void *)(v19 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v9, 1, v19) == 1)
  {
    swift_retain();
    outlined destroy of Any?((uint64_t)v9, &demangling cache variable for type metadata for SpeakableString?);
    *(_OWORD *)(v11 + 192) = 0u;
    *(_OWORD *)(v11 + 208) = 0u;
  }
  else
  {
    *(void *)(v11 + 216) = v19;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v11 + 192));
    (*(void (**)(uint64_t *, char *, uint64_t))(v20 + 32))(boxed_opaque_existential_0, v9, v19);
    swift_retain();
  }
  return v11;
}

uint64_t WorkoutVoiceFeedbackZoneExitedAbovePaceParameters.asKeyValuePairs()()
{
  return WorkoutVoiceFeedbackZoneExitedAbovePaceParameters.asKeyValuePairs()(type metadata accessor for WorkoutVoiceFeedbackZoneExitedAbovePaceParameters);
}

uint64_t WorkoutVoiceFeedbackZoneExitedBelowPaceParameters.asKeyValuePairs()()
{
  return WorkoutVoiceFeedbackZoneExitedAbovePaceParameters.asKeyValuePairs()(type metadata accessor for WorkoutVoiceFeedbackZoneExitedBelowPaceParameters);
}

uint64_t WorkoutVoiceFeedbackZoneExitedAbovePaceParameters.asKeyValuePairs()(uint64_t (*a1)(void))
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  uint64_t v6 = swift_allocObject();
  uint64_t v7 = v6;
  *(_OWORD *)(v6 + 16) = xmmword_2619DAA50;
  *(void *)(v6 + 32) = 0xD000000000000017;
  *(void *)(v6 + 40) = 0x80000002619DC0D0;
  uint64_t v8 = MEMORY[0x263F8D4F8];
  *(unsigned char *)(v6 + 48) = *(unsigned char *)v1;
  *(void *)(v6 + 72) = v8;
  *(void *)(v6 + 80) = 0xD000000000000011;
  *(void *)(v6 + 88) = 0x80000002619DBBF0;
  *(unsigned char *)(v6 + 96) = *(unsigned char *)(v1 + 1);
  *(void *)(v6 + 120) = v8;
  *(void *)(v6 + 128) = 0x63697274656DLL;
  *(void *)(v6 + 136) = 0xE600000000000000;
  if (*(unsigned char *)(v1 + 16))
  {
    uint64_t v9 = 0;
    *(void *)(v6 + 152) = 0;
    *(void *)(v6 + 160) = 0;
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = *(void *)(v1 + 8);
    uint64_t v9 = MEMORY[0x263F8D538];
  }
  *(void *)(v6 + 144) = v10;
  *(void *)(v6 + 168) = v9;
  strcpy((char *)(v6 + 176), "paceDuration");
  *(unsigned char *)(v6 + 189) = 0;
  *(_WORD *)(v6 + 190) = -5120;
  uint64_t v11 = *(void *)(v1 + 24);
  if (v11)
  {
    uint64_t v12 = type metadata accessor for DialogDuration();
    uint64_t v13 = v11;
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v12 = 0;
    *(void *)(v7 + 200) = 0;
    *(void *)(v7 + 208) = 0;
  }
  *(void *)(v7 + 192) = v13;
  *(void *)(v7 + 216) = v12;
  *(void *)(v7 + 224) = 1953066613;
  *(void *)(v7 + 232) = 0xE400000000000000;
  uint64_t v14 = a1(0);
  outlined init with copy of URL?(v1 + *(int *)(v14 + 32), (uint64_t)v5, &demangling cache variable for type metadata for SpeakableString?);
  uint64_t v15 = type metadata accessor for SpeakableString();
  uint64_t v16 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v5, 1, v15) == 1)
  {
    swift_retain();
    outlined destroy of Any?((uint64_t)v5, &demangling cache variable for type metadata for SpeakableString?);
    *(_OWORD *)(v7 + 240) = 0u;
    *(_OWORD *)(v7 + 256) = 0u;
  }
  else
  {
    *(void *)(v7 + 264) = v15;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v7 + 240));
    (*(void (**)(uint64_t *, char *, uint64_t))(v16 + 32))(boxed_opaque_existential_0, v5, v15);
    swift_retain();
  }
  return v7;
}

uint64_t WorkoutVoiceFeedbackZoneExitedAboveSpeedParameters.asKeyValuePairs()(__int16 a1, uint64_t a2, uint64_t a3, char a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_2619DAA90;
  *(void *)(v8 + 32) = 0xD000000000000017;
  *(void *)(v8 + 40) = 0x80000002619DC0D0;
  uint64_t v9 = MEMORY[0x263F8D4F8];
  *(unsigned char *)(v8 + 48) = a1 & 1;
  *(void *)(v8 + 72) = v9;
  *(void *)(v8 + 80) = 0xD000000000000011;
  *(void *)(v8 + 88) = 0x80000002619DBBF0;
  *(unsigned char *)(v8 + 96) = HIBYTE(a1) & 1;
  *(void *)(v8 + 120) = v9;
  *(void *)(v8 + 128) = 0x6874676E656CLL;
  *(void *)(v8 + 136) = 0xE600000000000000;
  if (a2)
  {
    uint64_t v10 = type metadata accessor for DialogLength();
    uint64_t v11 = a2;
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v10 = 0;
    *(void *)(v8 + 152) = 0;
    *(void *)(v8 + 160) = 0;
  }
  *(void *)(v8 + 144) = v11;
  *(void *)(v8 + 168) = v10;
  *(void *)(v8 + 176) = 0x63697274656DLL;
  *(void *)(v8 + 184) = 0xE600000000000000;
  if (a4)
  {
    a3 = 0;
    uint64_t v12 = 0;
    *(void *)(v8 + 200) = 0;
    *(void *)(v8 + 208) = 0;
  }
  else
  {
    uint64_t v12 = MEMORY[0x263F8D538];
  }
  *(void *)(v8 + 192) = a3;
  *(void *)(v8 + 216) = v12;
  swift_retain();
  return v8;
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.exerciseRingCompleted(executeSashGroupOnWatch:)(char a1)
{
  *(void *)(v2 + 16) = v1;
  *(unsigned char *)(v2 + 48) = a1;
  return MEMORY[0x270FA2498](WorkoutVoiceFeedbackCATPatternsExecutor.exerciseRingCompleted(executeSashGroupOnWatch:), 0, 0);
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.exerciseRingCompleted(executeSashGroupOnWatch:)()
{
  char v1 = *(unsigned char *)(v0 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 32) = 0xD000000000000017;
  *(void *)(v2 + 40) = 0x80000002619DC0D0;
  *(void *)(v2 + 72) = MEMORY[0x263F8D4F8];
  uint64_t v3 = (int *)MEMORY[0x263F6D050];
  *(unsigned char *)(v2 + 48) = v1;
  uint64_t v6 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)v3 + *v3);
  *(void *)(v0 + 24) = v2;
  *(_OWORD *)(v2 + 16) = xmmword_2619D98D0;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v4;
  *uint64_t v4 = v0;
  v4[1] = WorkoutVoiceFeedbackCATPatternsExecutor.exerciseRingCompleted(executeSashGroupOnWatch:);
  return v6(0xD00000000000002ALL, 0x80000002619DC4E0, v2);
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.exerciseRingCompleted(executeSashGroupOnWatch:)(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 40) = v1;
  swift_task_dealloc();
  if (v1)
  {
    return MEMORY[0x270FA2498](WorkoutVoiceFeedbackCATPatternsExecutor.exerciseRingCompleted(executeSashGroupOnWatch:), 0, 0);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v5 = *(uint64_t (**)(uint64_t))(v4 + 8);
    return v5(a1);
  }
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.intervalEnded(executeSashGroupOnWatch:)(char a1)
{
  *(void *)(v2 + 16) = v1;
  *(unsigned char *)(v2 + 48) = a1;
  return MEMORY[0x270FA2498](WorkoutVoiceFeedbackCATPatternsExecutor.intervalEnded(executeSashGroupOnWatch:), 0, 0);
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.intervalEnded(executeSashGroupOnWatch:)()
{
  char v1 = *(unsigned char *)(v0 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 32) = 0xD000000000000017;
  *(void *)(v2 + 40) = 0x80000002619DC0D0;
  *(void *)(v2 + 72) = MEMORY[0x263F8D4F8];
  uint64_t v3 = (int *)MEMORY[0x263F6D050];
  *(unsigned char *)(v2 + 48) = v1;
  uint64_t v6 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)v3 + *v3);
  *(void *)(v0 + 24) = v2;
  *(_OWORD *)(v2 + 16) = xmmword_2619D98D0;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v4;
  *uint64_t v4 = v0;
  v4[1] = WorkoutVoiceFeedbackCATPatternsExecutor.exerciseRingCompleted(executeSashGroupOnWatch:);
  return v6(0xD000000000000022, 0x80000002619DC4B0, v2);
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.moveRingCompleted(executeSashGroupOnWatch:)(char a1)
{
  *(void *)(v2 + 16) = v1;
  *(unsigned char *)(v2 + 48) = a1;
  return MEMORY[0x270FA2498](WorkoutVoiceFeedbackCATPatternsExecutor.moveRingCompleted(executeSashGroupOnWatch:), 0, 0);
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.moveRingCompleted(executeSashGroupOnWatch:)()
{
  char v1 = *(unsigned char *)(v0 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 32) = 0xD000000000000017;
  *(void *)(v2 + 40) = 0x80000002619DC0D0;
  *(void *)(v2 + 72) = MEMORY[0x263F8D4F8];
  uint64_t v3 = (int *)MEMORY[0x263F6D050];
  *(unsigned char *)(v2 + 48) = v1;
  uint64_t v6 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)v3 + *v3);
  *(void *)(v0 + 24) = v2;
  *(_OWORD *)(v2 + 16) = xmmword_2619D98D0;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v4;
  *uint64_t v4 = v0;
  v4[1] = WorkoutVoiceFeedbackCATPatternsExecutor.exerciseRingCompleted(executeSashGroupOnWatch:);
  return v6(0xD000000000000026, 0x80000002619DC480, v2);
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.raceAheadOfGhost(executeSashGroupOnWatch:)(char a1)
{
  *(void *)(v2 + 16) = v1;
  *(unsigned char *)(v2 + 48) = a1;
  return MEMORY[0x270FA2498](WorkoutVoiceFeedbackCATPatternsExecutor.raceAheadOfGhost(executeSashGroupOnWatch:), 0, 0);
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.raceAheadOfGhost(executeSashGroupOnWatch:)()
{
  char v1 = *(unsigned char *)(v0 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 32) = 0xD000000000000017;
  *(void *)(v2 + 40) = 0x80000002619DC0D0;
  *(void *)(v2 + 72) = MEMORY[0x263F8D4F8];
  uint64_t v3 = (int *)MEMORY[0x263F6D050];
  *(unsigned char *)(v2 + 48) = v1;
  uint64_t v6 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)v3 + *v3);
  *(void *)(v0 + 24) = v2;
  *(_OWORD *)(v2 + 16) = xmmword_2619D98D0;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v4;
  *uint64_t v4 = v0;
  v4[1] = WorkoutVoiceFeedbackCATPatternsExecutor.exerciseRingCompleted(executeSashGroupOnWatch:);
  return v6(0xD000000000000025, 0x80000002619DC450, v2);
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.raceBehindGhost(executeSashGroupOnWatch:)(char a1)
{
  *(void *)(v2 + 16) = v1;
  *(unsigned char *)(v2 + 48) = a1;
  return MEMORY[0x270FA2498](WorkoutVoiceFeedbackCATPatternsExecutor.raceBehindGhost(executeSashGroupOnWatch:), 0, 0);
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.raceBehindGhost(executeSashGroupOnWatch:)()
{
  char v1 = *(unsigned char *)(v0 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 32) = 0xD000000000000017;
  *(void *)(v2 + 40) = 0x80000002619DC0D0;
  *(void *)(v2 + 72) = MEMORY[0x263F8D4F8];
  uint64_t v3 = (int *)MEMORY[0x263F6D050];
  *(unsigned char *)(v2 + 48) = v1;
  uint64_t v6 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)v3 + *v3);
  *(void *)(v0 + 24) = v2;
  *(_OWORD *)(v2 + 16) = xmmword_2619D98D0;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v4;
  *uint64_t v4 = v0;
  v4[1] = WorkoutVoiceFeedbackCATPatternsExecutor.exerciseRingCompleted(executeSashGroupOnWatch:);
  return v6(0xD000000000000024, 0x80000002619DC420, v2);
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.raceExpired(executeSashGroupOnWatch:)(char a1)
{
  *(void *)(v2 + 16) = v1;
  *(unsigned char *)(v2 + 48) = a1;
  return MEMORY[0x270FA2498](WorkoutVoiceFeedbackCATPatternsExecutor.raceExpired(executeSashGroupOnWatch:), 0, 0);
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.raceExpired(executeSashGroupOnWatch:)()
{
  char v1 = *(unsigned char *)(v0 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 32) = 0xD000000000000017;
  *(void *)(v2 + 40) = 0x80000002619DC0D0;
  *(void *)(v2 + 72) = MEMORY[0x263F8D4F8];
  uint64_t v3 = (int *)MEMORY[0x263F6D050];
  *(unsigned char *)(v2 + 48) = v1;
  uint64_t v6 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)v3 + *v3);
  *(void *)(v0 + 24) = v2;
  *(_OWORD *)(v2 + 16) = xmmword_2619D98D0;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v4;
  *uint64_t v4 = v0;
  v4[1] = WorkoutVoiceFeedbackCATPatternsExecutor.raceExpired(executeSashGroupOnWatch:);
  return v6(0xD000000000000020, 0x80000002619DC3F0, v2);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_bridgeObjectRelease();
  char v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.raceExpired(executeSashGroupOnWatch:)(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 40) = v1;
  swift_task_dealloc();
  if (v1)
  {
    return MEMORY[0x270FA2498](WorkoutVoiceFeedbackCATPatternsExecutor.raceExpired(executeSashGroupOnWatch:), 0, 0);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v5 = *(uint64_t (**)(uint64_t))(v4 + 8);
    return v5(a1);
  }
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.raceOffRoute(executeSashGroupOnWatch:)(char a1)
{
  *(void *)(v2 + 16) = v1;
  *(unsigned char *)(v2 + 48) = a1;
  return MEMORY[0x270FA2498](WorkoutVoiceFeedbackCATPatternsExecutor.raceOffRoute(executeSashGroupOnWatch:), 0, 0);
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.raceOffRoute(executeSashGroupOnWatch:)()
{
  char v1 = *(unsigned char *)(v0 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 32) = 0xD000000000000017;
  *(void *)(v2 + 40) = 0x80000002619DC0D0;
  *(void *)(v2 + 72) = MEMORY[0x263F8D4F8];
  uint64_t v3 = (int *)MEMORY[0x263F6D050];
  *(unsigned char *)(v2 + 48) = v1;
  uint64_t v6 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)v3 + *v3);
  *(void *)(v0 + 24) = v2;
  *(_OWORD *)(v2 + 16) = xmmword_2619D98D0;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v4;
  *uint64_t v4 = v0;
  v4[1] = WorkoutVoiceFeedbackCATPatternsExecutor.exerciseRingCompleted(executeSashGroupOnWatch:);
  return v6(0xD000000000000021, 0x80000002619DC3C0, v2);
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.raceOnRoute(executeSashGroupOnWatch:)(char a1)
{
  *(void *)(v2 + 16) = v1;
  *(unsigned char *)(v2 + 48) = a1;
  return MEMORY[0x270FA2498](WorkoutVoiceFeedbackCATPatternsExecutor.raceOnRoute(executeSashGroupOnWatch:), 0, 0);
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.raceOnRoute(executeSashGroupOnWatch:)()
{
  char v1 = *(unsigned char *)(v0 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 32) = 0xD000000000000017;
  *(void *)(v2 + 40) = 0x80000002619DC0D0;
  *(void *)(v2 + 72) = MEMORY[0x263F8D4F8];
  uint64_t v3 = (int *)MEMORY[0x263F6D050];
  *(unsigned char *)(v2 + 48) = v1;
  uint64_t v6 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)v3 + *v3);
  *(void *)(v0 + 24) = v2;
  *(_OWORD *)(v2 + 16) = xmmword_2619D98D0;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v4;
  *uint64_t v4 = v0;
  v4[1] = WorkoutVoiceFeedbackCATPatternsExecutor.exerciseRingCompleted(executeSashGroupOnWatch:);
  return v6(0xD000000000000020, 0x80000002619DC390, v2);
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.raceRouteCompleteRaceWon(executeSashGroupOnWatch:)(char a1)
{
  *(void *)(v2 + 16) = v1;
  *(unsigned char *)(v2 + 48) = a1;
  return MEMORY[0x270FA2498](WorkoutVoiceFeedbackCATPatternsExecutor.raceRouteCompleteRaceWon(executeSashGroupOnWatch:), 0, 0);
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.raceRouteCompleteRaceWon(executeSashGroupOnWatch:)()
{
  char v1 = *(unsigned char *)(v0 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 32) = 0xD000000000000017;
  *(void *)(v2 + 40) = 0x80000002619DC0D0;
  *(void *)(v2 + 72) = MEMORY[0x263F8D4F8];
  uint64_t v3 = (int *)MEMORY[0x263F6D050];
  *(unsigned char *)(v2 + 48) = v1;
  uint64_t v6 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)v3 + *v3);
  *(void *)(v0 + 24) = v2;
  *(_OWORD *)(v2 + 16) = xmmword_2619D98D0;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v4;
  *uint64_t v4 = v0;
  v4[1] = WorkoutVoiceFeedbackCATPatternsExecutor.exerciseRingCompleted(executeSashGroupOnWatch:);
  return v6(0xD00000000000002DLL, 0x80000002619DC360, v2);
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.raceRouteCompletedRaceLost(executeSashGroupOnWatch:)(char a1)
{
  *(void *)(v2 + 16) = v1;
  *(unsigned char *)(v2 + 48) = a1;
  return MEMORY[0x270FA2498](WorkoutVoiceFeedbackCATPatternsExecutor.raceRouteCompletedRaceLost(executeSashGroupOnWatch:), 0, 0);
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.raceRouteCompletedRaceLost(executeSashGroupOnWatch:)()
{
  char v1 = *(unsigned char *)(v0 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 32) = 0xD000000000000017;
  *(void *)(v2 + 40) = 0x80000002619DC0D0;
  *(void *)(v2 + 72) = MEMORY[0x263F8D4F8];
  uint64_t v3 = (int *)MEMORY[0x263F6D050];
  *(unsigned char *)(v2 + 48) = v1;
  uint64_t v6 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)v3 + *v3);
  *(void *)(v0 + 24) = v2;
  *(_OWORD *)(v2 + 16) = xmmword_2619D98D0;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v4;
  *uint64_t v4 = v0;
  v4[1] = WorkoutVoiceFeedbackCATPatternsExecutor.exerciseRingCompleted(executeSashGroupOnWatch:);
  return v6(0xD00000000000002FLL, 0x80000002619DC330, v2);
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.trackStatusChanged(executeSashGroupOnWatch:)(char a1)
{
  *(void *)(v2 + 16) = v1;
  *(unsigned char *)(v2 + 48) = a1;
  return MEMORY[0x270FA2498](WorkoutVoiceFeedbackCATPatternsExecutor.trackStatusChanged(executeSashGroupOnWatch:), 0, 0);
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.trackStatusChanged(executeSashGroupOnWatch:)()
{
  char v1 = *(unsigned char *)(v0 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 32) = 0xD000000000000017;
  *(void *)(v2 + 40) = 0x80000002619DC0D0;
  *(void *)(v2 + 72) = MEMORY[0x263F8D4F8];
  uint64_t v3 = (int *)MEMORY[0x263F6D050];
  *(unsigned char *)(v2 + 48) = v1;
  uint64_t v6 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)v3 + *v3);
  *(void *)(v0 + 24) = v2;
  *(_OWORD *)(v2 + 16) = xmmword_2619D98D0;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v4;
  *uint64_t v4 = v0;
  v4[1] = WorkoutVoiceFeedbackCATPatternsExecutor.exerciseRingCompleted(executeSashGroupOnWatch:);
  return v6(0xD000000000000027, 0x80000002619DC300, v2);
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.workoutPaused(executeSashGroupOnWatch:)(char a1)
{
  *(void *)(v2 + 16) = v1;
  *(unsigned char *)(v2 + 48) = a1;
  return MEMORY[0x270FA2498](WorkoutVoiceFeedbackCATPatternsExecutor.workoutPaused(executeSashGroupOnWatch:), 0, 0);
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.workoutPaused(executeSashGroupOnWatch:)()
{
  char v1 = *(unsigned char *)(v0 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 32) = 0xD000000000000017;
  *(void *)(v2 + 40) = 0x80000002619DC0D0;
  *(void *)(v2 + 72) = MEMORY[0x263F8D4F8];
  uint64_t v3 = (int *)MEMORY[0x263F6D050];
  *(unsigned char *)(v2 + 48) = v1;
  uint64_t v6 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)v3 + *v3);
  *(void *)(v0 + 24) = v2;
  *(_OWORD *)(v2 + 16) = xmmword_2619D98D0;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v4;
  *uint64_t v4 = v0;
  v4[1] = WorkoutVoiceFeedbackCATPatternsExecutor.exerciseRingCompleted(executeSashGroupOnWatch:);
  return v6(0xD000000000000022, 0x80000002619DC2D0, v2);
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.workoutResumed(executeSashGroupOnWatch:)(char a1)
{
  *(void *)(v2 + 16) = v1;
  *(unsigned char *)(v2 + 48) = a1;
  return MEMORY[0x270FA2498](WorkoutVoiceFeedbackCATPatternsExecutor.workoutResumed(executeSashGroupOnWatch:), 0, 0);
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.workoutResumed(executeSashGroupOnWatch:)()
{
  char v1 = *(unsigned char *)(v0 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 32) = 0xD000000000000017;
  *(void *)(v2 + 40) = 0x80000002619DC0D0;
  *(void *)(v2 + 72) = MEMORY[0x263F8D4F8];
  uint64_t v3 = (int *)MEMORY[0x263F6D050];
  *(unsigned char *)(v2 + 48) = v1;
  uint64_t v6 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((char *)v3 + *v3);
  *(void *)(v0 + 24) = v2;
  *(_OWORD *)(v2 + 16) = xmmword_2619D98D0;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v4;
  *uint64_t v4 = v0;
  v4[1] = WorkoutVoiceFeedbackCATPatternsExecutor.exerciseRingCompleted(executeSashGroupOnWatch:);
  return v6(0xD000000000000023, 0x80000002619DC2A0, v2);
}

uint64_t WorkoutVoiceFeedbackCATPatternsExecutor.__allocating_init(templateDir:options:globals:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CATOption();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  outlined init with copy of URL?(a1, (uint64_t)v10, &demangling cache variable for type metadata for URL?);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  uint64_t v11 = CATWrapper.init(templateDir:options:globals:)();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  outlined destroy of Any?(a1, &demangling cache variable for type metadata for URL?);
  return v11;
}

uint64_t ObjC metadata update function for WorkoutVoiceFeedbackCATPatternsExecutor()
{
  return type metadata accessor for WorkoutVoiceFeedbackCATPatternsExecutor(0);
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.segmentMarked(executeSashGroupOnWatch:_:)(char a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a2;
  *(void *)(v3 + 24) = a3;
  *(unsigned char *)(v3 + 56) = a1;
  return MEMORY[0x270FA2498](specialized WorkoutVoiceFeedbackCATPatternsExecutor.segmentMarked(executeSashGroupOnWatch:_:), 0, 0);
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.segmentMarked(executeSashGroupOnWatch:_:)()
{
  char v1 = *(unsigned char *)(v0 + 56);
  uint64_t v2 = *(void *)(v0 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 32) = 0xD000000000000017;
  *(void *)(v3 + 40) = 0x80000002619DC0D0;
  uint64_t v4 = MEMORY[0x263F8D4F8];
  *(unsigned char *)(v3 + 48) = v1;
  *(void *)(v3 + 72) = v4;
  *(void *)(v3 + 80) = 0x746E656D676573;
  *(void *)(v3 + 88) = 0xE700000000000000;
  *(void *)(v3 + 120) = MEMORY[0x263F8D538];
  uint64_t v7 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x263F6D050]
                                                                           + MEMORY[0x263F6D050]);
  *(void *)(v0 + 32) = v3;
  *(_OWORD *)(v3 + 16) = xmmword_2619DA450;
  *(double *)(v3 + 96) = (double)v2;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v5;
  *uint64_t v5 = v0;
  v5[1] = specialized WorkoutVoiceFeedbackCATPatternsExecutor.segmentMarked(executeSashGroupOnWatch:_:);
  return v7(0xD000000000000022, 0x80000002619DC690, v3);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_bridgeObjectRelease();
  char v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.segmentMarked(executeSashGroupOnWatch:_:)(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 48) = v1;
  swift_task_dealloc();
  if (v1)
  {
    return MEMORY[0x270FA2498](specialized WorkoutVoiceFeedbackCATPatternsExecutor.segmentMarked(executeSashGroupOnWatch:_:), 0, 0);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v5 = *(uint64_t (**)(uint64_t))(v4 + 8);
    return v5(a1);
  }
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.transitionedNotableTime(executeSashGroupOnWatch:_:)(char a1, uint64_t a2, double a3)
{
  *(double *)(v3 + 24) = a3;
  *(void *)(v3 + 16) = a2;
  *(unsigned char *)(v3 + 72) = a1;
  return MEMORY[0x270FA2498](specialized WorkoutVoiceFeedbackCATPatternsExecutor.transitionedNotableTime(executeSashGroupOnWatch:_:), 0, 0);
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.transitionedNotableTime(executeSashGroupOnWatch:_:)()
{
  char v1 = *(unsigned char *)(v0 + 72);
  type metadata accessor for DialogDuration.Builder();
  swift_allocObject();
  DialogDuration.Builder.init()();
  dispatch thunk of DialogDuration.Builder.withSecs(_:)();
  swift_release();
  uint64_t v2 = dispatch thunk of DialogDuration.Builder.build()();
  *(void *)(v0 + 32) = v2;
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  uint64_t v3 = swift_allocObject();
  *(void *)(v0 + 40) = v3;
  *(_OWORD *)(v3 + 16) = xmmword_2619DA450;
  *(void *)(v3 + 32) = 0x6E6F697461727564;
  *(void *)(v3 + 40) = 0xE800000000000000;
  uint64_t v4 = type metadata accessor for DialogDuration();
  *(void *)(v3 + 48) = v2;
  *(void *)(v3 + 88) = 0x80000002619DC0D0;
  *(void *)(v3 + 120) = MEMORY[0x263F8D4F8];
  *(unsigned char *)(v3 + 96) = v1;
  uint64_t v7 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x263F6D050]
                                                                           + MEMORY[0x263F6D050]);
  *(void *)(v3 + 72) = v4;
  *(void *)(v3 + 80) = 0xD000000000000017;
  swift_retain();
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v5;
  *uint64_t v5 = v0;
  v5[1] = specialized WorkoutVoiceFeedbackCATPatternsExecutor.transitionedNotableTime(executeSashGroupOnWatch:_:);
  return v7(0xD00000000000002CLL, 0x80000002619DC780, v3);
}

{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v4;

  swift_release();
  char v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 64);
  return v1(v2);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_release();
  char v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.transitionedNotableTime(executeSashGroupOnWatch:_:)(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 56) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v5 = specialized WorkoutVoiceFeedbackCATPatternsExecutor.transitionedNotableTime(executeSashGroupOnWatch:_:);
  }
  else
  {
    *(void *)(v4 + 64) = a1;
    uint64_t v5 = specialized WorkoutVoiceFeedbackCATPatternsExecutor.transitionedNotableTime(executeSashGroupOnWatch:_:);
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.transitionedNotableDistanceSpeed(executeSashGroupOnWatch:_:)(char a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 96) = a2;
  *(void *)(v3 + 104) = a3;
  *(unsigned char *)(v3 + 49) = a1;
  return MEMORY[0x270FA2498](specialized WorkoutVoiceFeedbackCATPatternsExecutor.transitionedNotableDistanceSpeed(executeSashGroupOnWatch:_:), 0, 0);
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.transitionedNotableDistanceSpeed(executeSashGroupOnWatch:_:)()
{
  uint64_t v1 = *(void *)(v0 + 104);
  *(void *)(v0 + 56) = 0;
  *(unsigned char *)(v0 + 64) = *(unsigned char *)(v0 + 49);
  *(void *)(v0 + 72) = 0;
  *(void *)(v0 + 80) = 0;
  *(unsigned char *)(v0 + 88) = 1;
  closure #1 in DistanceSplitModel.executePattern(wrapper:)(v0 + 56, v1);
  long long v2 = *(_OWORD *)(v0 + 72);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v0 + 56);
  *(_OWORD *)(v0 + 32) = v2;
  *(unsigned char *)(v0 + 48) = *(unsigned char *)(v0 + 88);
  uint64_t v3 = WorkoutVoiceFeedbackTransitionedNotableDistanceSpeedParameters.asKeyValuePairs()();
  *(void *)(v0 + 112) = v3;
  uint64_t v6 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x263F6D050]
                                                                           + MEMORY[0x263F6D050]);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 120) = v4;
  *uint64_t v4 = v0;
  v4[1] = specialized WorkoutVoiceFeedbackCATPatternsExecutor.transitionedNotableDistanceSpeed(executeSashGroupOnWatch:_:);
  return v6(0xD000000000000035, 0x80000002619DC8D0, v3);
}

{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v4;

  swift_release();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  long long v2 = *(void *)(v0 + 136);
  return v1(v2);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_release();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.transitionedNotableDistanceSpeed(executeSashGroupOnWatch:_:)(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 128) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v5 = specialized WorkoutVoiceFeedbackCATPatternsExecutor.transitionedNotableDistanceSpeed(executeSashGroupOnWatch:_:);
  }
  else
  {
    *(void *)(v4 + 136) = a1;
    uint64_t v5 = specialized WorkoutVoiceFeedbackCATPatternsExecutor.transitionedNotableDistanceSpeed(executeSashGroupOnWatch:_:);
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.transitionedNotableDistancePace(executeSashGroupOnWatch:_:)(char a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a2;
  *(void *)(v3 + 24) = a3;
  *(unsigned char *)(v3 + 80) = a1;
  *(void *)(v3 + 32) = type metadata accessor for WorkoutVoiceFeedbackTransitionedNotableDistancePaceParameters(0);
  *(void *)(v3 + 40) = swift_task_alloc();
  return MEMORY[0x270FA2498](specialized WorkoutVoiceFeedbackCATPatternsExecutor.transitionedNotableDistancePace(executeSashGroupOnWatch:_:), 0, 0);
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.transitionedNotableDistancePace(executeSashGroupOnWatch:_:)()
{
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v2 = *(void *)(v0 + 24);
  char v3 = *(unsigned char *)(v0 + 80);
  uint64_t v4 = v1 + *(int *)(*(void *)(v0 + 32) + 32);
  uint64_t v5 = type metadata accessor for SpeakableString();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  *(void *)uint64_t v1 = 0;
  *(unsigned char *)(v1 + 8) = v3;
  *(void *)(v1 + 16) = 0;
  *(void *)(v1 + 24) = 0;
  *(unsigned char *)(v1 + 32) = 1;
  closure #2 in DistanceSplitModel.executePattern(wrapper:)(v1, v2);
  uint64_t v6 = WorkoutVoiceFeedbackTransitionedNotableDistancePaceParameters.asKeyValuePairs()();
  *(void *)(v0 + 48) = v6;
  uint64_t v9 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x263F6D050]
                                                                           + MEMORY[0x263F6D050]);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v7;
  *uint64_t v7 = v0;
  v7[1] = specialized WorkoutVoiceFeedbackCATPatternsExecutor.transitionedNotableDistancePace(executeSashGroupOnWatch:_:);
  return v9(0xD000000000000034, 0x80000002619DC910, v6);
}

{
  void *v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v4;

  outlined destroy of WorkoutVoiceFeedbackZoneEnteredPaceParameters(v0[5], type metadata accessor for WorkoutVoiceFeedbackTransitionedNotableDistancePaceParameters);
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v2 = v0[9];
  return v1(v2);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  outlined destroy of WorkoutVoiceFeedbackZoneEnteredPaceParameters(*(void *)(v0 + 40), type metadata accessor for WorkoutVoiceFeedbackTransitionedNotableDistancePaceParameters);
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.transitionedNotableDistancePace(executeSashGroupOnWatch:_:)(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 64) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v5 = specialized WorkoutVoiceFeedbackCATPatternsExecutor.transitionedNotableDistancePace(executeSashGroupOnWatch:_:);
  }
  else
  {
    *(void *)(v4 + 72) = a1;
    uint64_t v5 = specialized WorkoutVoiceFeedbackCATPatternsExecutor.transitionedNotableDistancePace(executeSashGroupOnWatch:_:);
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.lapCompletionSpeed(executeSashGroupOnWatch:_:)(char a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a2;
  *(void *)(v3 + 24) = a3;
  *(unsigned char *)(v3 + 80) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  *(void *)(v3 + 32) = swift_task_alloc();
  return MEMORY[0x270FA2498](specialized WorkoutVoiceFeedbackCATPatternsExecutor.lapCompletionSpeed(executeSashGroupOnWatch:_:), 0, 0);
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.lapCompletionSpeed(executeSashGroupOnWatch:_:)()
{
  uint64_t v2 = *(uint64_t **)(v0 + 24);
  uint64_t v1 = *(void *)(v0 + 32);
  char v3 = *(unsigned char *)(v0 + 80);
  uint64_t v5 = v2[3];
  uint64_t v4 = v2[4];
  type metadata accessor for DialogLength.Builder();
  swift_allocObject();
  MEMORY[0x263E473C0]();
  dispatch thunk of DialogAbstractMeasurement.Builder.withValue(_:)();
  swift_release();
  String.toDialogUnit.getter(v5, v4);
  String.toSpeakableString.getter();
  swift_bridgeObjectRelease();
  uint64_t v6 = type metadata accessor for SpeakableString();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v1, 0, 1, v6);
  dispatch thunk of DialogAbstractMeasurement.Builder.withUnits(_:)();
  swift_release();
  outlined destroy of Any?(v1, &demangling cache variable for type metadata for SpeakableString?);
  uint64_t v7 = dispatch thunk of DialogAbstractMeasurement.Builder.build()();
  *(void *)(v0 + 40) = v7;
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  uint64_t v8 = swift_allocObject();
  *(void *)(v0 + 48) = v8;
  *(_OWORD *)(v8 + 16) = xmmword_2619DAAA0;
  *(void *)(v8 + 32) = 0xD000000000000017;
  *(void *)(v8 + 40) = 0x80000002619DC0D0;
  *(void *)(v8 + 72) = MEMORY[0x263F8D4F8];
  *(unsigned char *)(v8 + 48) = v3;
  double v9 = (double)v2[1];
  *(void *)(v8 + 80) = 0x7865646E4970616CLL;
  *(void *)(v8 + 88) = 0xE800000000000000;
  uint64_t v10 = MEMORY[0x263F8D538];
  *(double *)(v8 + 96) = v9;
  *(void *)(v8 + 120) = v10;
  *(void *)(v8 + 128) = 0x6874676E656CLL;
  *(void *)(v8 + 136) = 0xE600000000000000;
  *(void *)(v8 + 168) = type metadata accessor for DialogLength();
  *(void *)(v8 + 144) = v7;
  uint64_t v13 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x263F6D050]
                                                                            + MEMORY[0x263F6D050]);
  swift_retain();
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v11;
  *uint64_t v11 = v0;
  v11[1] = specialized WorkoutVoiceFeedbackCATPatternsExecutor.lapCompletionSpeed(executeSashGroupOnWatch:_:);
  return v13(0xD000000000000027, 0x80000002619DC840, v8);
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.lapCompletionSpeed(executeSashGroupOnWatch:_:)(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 64) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v5 = specialized WorkoutVoiceFeedbackCATPatternsExecutor.lapCompletionSpeed(executeSashGroupOnWatch:_:);
  }
  else
  {
    *(void *)(v4 + 72) = a1;
    uint64_t v5 = specialized WorkoutVoiceFeedbackCATPatternsExecutor.lapCompletionSpeed(executeSashGroupOnWatch:_:);
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.lapCompletionPace(executeSashGroupOnWatch:_:)(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6)
{
  *(void *)(v6 + 40) = a4;
  *(void *)(v6 + 48) = a5;
  *(double *)(v6 + 32) = a6;
  *(void *)(v6 + 16) = a2;
  *(void *)(v6 + 24) = a3;
  *(unsigned char *)(v6 + 112) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  *(void *)(v6 + 56) = swift_task_alloc();
  *(void *)(v6 + 64) = type metadata accessor for WorkoutVoiceFeedbackLapCompletionPaceParameters(0);
  *(void *)(v6 + 72) = swift_task_alloc();
  return MEMORY[0x270FA2498](specialized WorkoutVoiceFeedbackCATPatternsExecutor.lapCompletionPace(executeSashGroupOnWatch:_:), 0, 0);
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.lapCompletionPace(executeSashGroupOnWatch:_:)()
{
  uint64_t v1 = *(void *)(v0 + 72);
  uint64_t v2 = *(void *)(v0 + 56);
  uint64_t v13 = *(void *)(v0 + 48);
  uint64_t v3 = *(void *)(v0 + 40);
  char v4 = *(unsigned char *)(v0 + 112);
  uint64_t v5 = v1 + *(int *)(*(void *)(v0 + 64) + 28);
  uint64_t v6 = *(void *)(v0 + 24);
  uint64_t v7 = type metadata accessor for SpeakableString();
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
  v8(v5, 1, 1, v7);
  *(unsigned char *)uint64_t v1 = v4;
  *(void *)(v1 + 24) = 0;
  *(double *)(v1 + 8) = (double)v6;
  *(unsigned char *)(v1 + 16) = 0;
  type metadata accessor for DialogDuration.Builder();
  swift_allocObject();
  DialogDuration.Builder.init()();
  dispatch thunk of DialogDuration.Builder.withSecs(_:)();
  swift_release();
  uint64_t v9 = dispatch thunk of DialogDuration.Builder.build()();
  swift_release();
  *(void *)(v1 + 24) = v9;
  String.toDialogUnit.getter(v3, v13);
  String.toSpeakableString.getter();
  swift_bridgeObjectRelease();
  v8(v2, 0, 1, v7);
  outlined assign with take of SpeakableString?(v2, v5);
  uint64_t v10 = WorkoutVoiceFeedbackLapCompletionPaceParameters.asKeyValuePairs()(0x7865646E4970616CLL, 0xE800000000000000, type metadata accessor for WorkoutVoiceFeedbackLapCompletionPaceParameters);
  *(void *)(v0 + 80) = v10;
  uint64_t v14 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x263F6D050]
                                                                            + MEMORY[0x263F6D050]);
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v11;
  *uint64_t v11 = v0;
  v11[1] = specialized WorkoutVoiceFeedbackCATPatternsExecutor.lapCompletionPace(executeSashGroupOnWatch:_:);
  return v14(0xD000000000000026, 0x80000002619DC870, v10);
}

{
  void *v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v4;

  outlined destroy of WorkoutVoiceFeedbackZoneEnteredPaceParameters(v0[9], type metadata accessor for WorkoutVoiceFeedbackLapCompletionPaceParameters);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v2 = v0[13];
  return v1(v2);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  outlined destroy of WorkoutVoiceFeedbackZoneEnteredPaceParameters(*(void *)(v0 + 72), type metadata accessor for WorkoutVoiceFeedbackLapCompletionPaceParameters);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.lapCompletionPace(executeSashGroupOnWatch:_:)(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 96) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v5 = specialized WorkoutVoiceFeedbackCATPatternsExecutor.lapCompletionPace(executeSashGroupOnWatch:_:);
  }
  else
  {
    *(void *)(v4 + 104) = a1;
    uint64_t v5 = specialized WorkoutVoiceFeedbackCATPatternsExecutor.lapCompletionPace(executeSashGroupOnWatch:_:);
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.goalCompletion(executeSashGroupOnWatch:_:)(char a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  *(void *)(v5 + 32) = a3;
  *(void *)(v5 + 40) = a4;
  *(double *)(v5 + 24) = a5;
  *(void *)(v5 + 16) = a2;
  *(unsigned char *)(v5 + 96) = a1;
  *(void *)(v5 + 48) = type metadata accessor for WorkoutVoiceFeedbackGoalCompletionParameters(0);
  *(void *)(v5 + 56) = swift_task_alloc();
  return MEMORY[0x270FA2498](specialized WorkoutVoiceFeedbackCATPatternsExecutor.goalCompletion(executeSashGroupOnWatch:_:), 0, 0);
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.goalCompletion(executeSashGroupOnWatch:_:)()
{
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v3 = *(void *)(v0 + 32);
  uint64_t v2 = *(void *)(v0 + 40);
  double v4 = *(double *)(v0 + 24);
  char v5 = *(unsigned char *)(v0 + 96);
  uint64_t v6 = v1 + *(int *)(*(void *)(v0 + 48) + 32);
  uint64_t v7 = type metadata accessor for SpeakableString();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  *(void *)uint64_t v1 = 0;
  *(unsigned char *)(v1 + 8) = v5;
  *(void *)(v1 + 16) = 0;
  *(void *)(v1 + 24) = 0;
  *(unsigned char *)(v1 + 32) = 1;
  specialized closure #1 in GoalCompletionModel.executePattern(wrapper:)(v1, v3, v2, v4);
  uint64_t v8 = WorkoutVoiceFeedbackGoalCompletionParameters.asKeyValuePairs()(type metadata accessor for WorkoutVoiceFeedbackGoalCompletionParameters);
  *(void *)(v0 + 64) = v8;
  uint64_t v11 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x263F6D050]
                                                                            + MEMORY[0x263F6D050]);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v9;
  *uint64_t v9 = v0;
  v9[1] = specialized WorkoutVoiceFeedbackCATPatternsExecutor.goalCompletion(executeSashGroupOnWatch:_:);
  return v11(0xD000000000000023, 0x80000002619DC950, v8);
}

{
  void *v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v4;

  outlined destroy of WorkoutVoiceFeedbackZoneEnteredPaceParameters(v0[7], type metadata accessor for WorkoutVoiceFeedbackGoalCompletionParameters);
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v2 = v0[11];
  return v1(v2);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  outlined destroy of WorkoutVoiceFeedbackZoneEnteredPaceParameters(*(void *)(v0 + 56), type metadata accessor for WorkoutVoiceFeedbackGoalCompletionParameters);
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.goalCompletion(executeSashGroupOnWatch:_:)(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 80) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1)
  {
    char v5 = specialized WorkoutVoiceFeedbackCATPatternsExecutor.goalCompletion(executeSashGroupOnWatch:_:);
  }
  else
  {
    *(void *)(v4 + 88) = a1;
    char v5 = specialized WorkoutVoiceFeedbackCATPatternsExecutor.goalCompletion(executeSashGroupOnWatch:_:);
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedAboveNonPace(executeSashGroupOnWatch:isSingleThreshold:_:)(char a1, char a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a3;
  *(void *)(v4 + 24) = a4;
  *(unsigned char *)(v4 + 57) = a2;
  *(unsigned char *)(v4 + 56) = a1;
  return MEMORY[0x270FA2498](specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedAboveNonPace(executeSashGroupOnWatch:isSingleThreshold:_:), 0, 0);
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedAboveNonPace(executeSashGroupOnWatch:isSingleThreshold:_:)()
{
  uint64_t v2 = *(void *)(v0 + 24);
  char v3 = *(unsigned char *)(v0 + 57);
  char v4 = *(unsigned char *)(v0 + 56);
  LOBYTE(v1) = *(unsigned char *)(v2 + 34);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  uint64_t v5 = swift_allocObject();
  *(void *)(v0 + 32) = v5;
  *(_OWORD *)(v5 + 16) = xmmword_2619DAA90;
  *(void *)(v5 + 32) = 0xD000000000000017;
  *(void *)(v5 + 40) = 0x80000002619DC0D0;
  uint64_t v6 = MEMORY[0x263F8D4F8];
  *(unsigned char *)(v5 + 48) = v4;
  *(void *)(v5 + 72) = v6;
  *(void *)(v5 + 80) = 0xD000000000000011;
  *(void *)(v5 + 88) = 0x80000002619DBBF0;
  *(void *)(v5 + 120) = v6;
  *(unsigned char *)(v5 + 96) = v3;
  uint64_t v7 = *(void *)(v2 + 8);
  *(void *)(v5 + 128) = 0x647574696E67616DLL;
  *(void *)(v5 + 136) = 0xE900000000000065;
  uint64_t v8 = MEMORY[0x263F8D538];
  *(void *)(v5 + 144) = v7;
  *(void *)(v5 + 168) = v8;
  *(void *)(v5 + 176) = 0x63697274656DLL;
  *(void *)(v5 + 184) = 0xE600000000000000;
  *(void *)(v5 + 216) = v8;
  uint64_t v11 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x263F6D050]
                                                                            + MEMORY[0x263F6D050]);
  *(double *)(v5 + 192) = (double)v1;
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v9;
  *uint64_t v9 = v0;
  v9[1] = specialized WorkoutVoiceFeedbackCATPatternsExecutor.segmentMarked(executeSashGroupOnWatch:_:);
  return v11(0xD00000000000002BLL, 0x80000002619DC7B0, v5);
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedAboveSpeed(executeSashGroupOnWatch:isSingleThreshold:_:)(char a1, char a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a3;
  *(void *)(v4 + 24) = a4;
  *(unsigned char *)(v4 + 81) = a2;
  *(unsigned char *)(v4 + 80) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  *(void *)(v4 + 32) = swift_task_alloc();
  return MEMORY[0x270FA2498](specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedAboveSpeed(executeSashGroupOnWatch:isSingleThreshold:_:), 0, 0);
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedAboveSpeed(executeSashGroupOnWatch:isSingleThreshold:_:)(double a1)
{
  uint64_t v3 = *(void *)(v1 + 24);
  uint64_t v2 = *(void *)(v1 + 32);
  int v4 = *(unsigned __int8 *)(v1 + 81);
  __int16 v5 = *(unsigned __int8 *)(v1 + 80);
  LOBYTE(a1) = *(unsigned char *)(v3 + 34);
  double v6 = (double)*(unint64_t *)&a1;
  type metadata accessor for DialogLength.Builder();
  swift_allocObject();
  MEMORY[0x263E473C0]();
  dispatch thunk of DialogAbstractMeasurement.Builder.withValue(_:)();
  swift_release();
  String.toDialogUnit.getter(*(void *)(v3 + 16), *(void *)(v3 + 24));
  String.toSpeakableString.getter();
  swift_bridgeObjectRelease();
  uint64_t v7 = type metadata accessor for SpeakableString();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v2, 0, 1, v7);
  dispatch thunk of DialogAbstractMeasurement.Builder.withUnits(_:)();
  swift_release();
  outlined destroy of Any?(v2, &demangling cache variable for type metadata for SpeakableString?);
  uint64_t v8 = dispatch thunk of DialogAbstractMeasurement.Builder.build()();
  *(void *)(v1 + 40) = v8;
  swift_release();
  if (v4) {
    __int16 v9 = 256;
  }
  else {
    __int16 v9 = 0;
  }
  uint64_t v10 = WorkoutVoiceFeedbackZoneExitedAboveSpeedParameters.asKeyValuePairs()(v9 | v5, v8, *(uint64_t *)&v6, 0);
  *(void *)(v1 + 48) = v10;
  uint64_t v13 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x263F6D050]
                                                                            + MEMORY[0x263F6D050]);
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v1 + 56) = v11;
  *uint64_t v11 = v1;
  v11[1] = specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedAboveSpeed(executeSashGroupOnWatch:isSingleThreshold:_:);
  return v13(0xD000000000000029, 0x80000002619DC7E0, v10);
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedAboveSpeed(executeSashGroupOnWatch:isSingleThreshold:_:)(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 64) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1)
  {
    __int16 v5 = specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedAboveSpeed(executeSashGroupOnWatch:isSingleThreshold:_:);
  }
  else
  {
    *(void *)(v4 + 72) = a1;
    __int16 v5 = specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedAboveSpeed(executeSashGroupOnWatch:isSingleThreshold:_:);
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedAboveSpeed(executeSashGroupOnWatch:isSingleThreshold:_:)()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 72);
  return v1(v2);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedAbovePace(executeSashGroupOnWatch:isSingleThreshold:_:)(char a1, char a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a3;
  *(void *)(v4 + 24) = a4;
  *(unsigned char *)(v4 + 89) = a2;
  *(unsigned char *)(v4 + 88) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  *(void *)(v4 + 32) = swift_task_alloc();
  *(void *)(v4 + 40) = type metadata accessor for WorkoutVoiceFeedbackZoneExitedAbovePaceParameters(0);
  *(void *)(v4 + 48) = swift_task_alloc();
  return MEMORY[0x270FA2498](specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedAbovePace(executeSashGroupOnWatch:isSingleThreshold:_:), 0, 0);
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedAbovePace(executeSashGroupOnWatch:isSingleThreshold:_:)()
{
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(v0 + 32);
  char v4 = *(unsigned char *)(v0 + 89);
  char v5 = *(unsigned char *)(v0 + 88);
  uint64_t v6 = v1 + *(int *)(*(void *)(v0 + 40) + 32);
  uint64_t v7 = type metadata accessor for SpeakableString();
  uint64_t v8 = *(__n128 (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
  __n128 v9 = v8(v6, 1, 1, v7);
  *(unsigned char *)uint64_t v1 = v5;
  *(unsigned char *)(v1 + 1) = v4;
  *(void *)(v1 + 24) = 0;
  v9.n128_u8[0] = *(unsigned char *)(v3 + 34);
  *(double *)(v1 + 8) = (double)v9.n128_u64[0];
  *(unsigned char *)(v1 + 16) = 0;
  type metadata accessor for DialogDuration.Builder();
  swift_allocObject();
  DialogDuration.Builder.init()();
  dispatch thunk of DialogDuration.Builder.withSecs(_:)();
  swift_release();
  uint64_t v10 = dispatch thunk of DialogDuration.Builder.build()();
  swift_release();
  *(void *)(v1 + 24) = v10;
  String.toDialogUnit.getter(*(void *)(v3 + 16), *(void *)(v3 + 24));
  String.toSpeakableString.getter();
  swift_bridgeObjectRelease();
  v8(v2, 0, 1, v7);
  outlined assign with take of SpeakableString?(v2, v6);
  uint64_t v11 = WorkoutVoiceFeedbackZoneExitedAbovePaceParameters.asKeyValuePairs()(type metadata accessor for WorkoutVoiceFeedbackZoneExitedAbovePaceParameters);
  *(void *)(v0 + 56) = v11;
  uint64_t v14 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x263F6D050]
                                                                            + MEMORY[0x263F6D050]);
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v12;
  void *v12 = v0;
  v12[1] = specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedAbovePace(executeSashGroupOnWatch:isSingleThreshold:_:);
  return v14(0xD000000000000028, 0x80000002619DC810, v11);
}

{
  void *v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v4;

  outlined destroy of WorkoutVoiceFeedbackZoneEnteredPaceParameters(v0[6], type metadata accessor for WorkoutVoiceFeedbackZoneExitedAbovePaceParameters);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v2 = v0[10];
  return v1(v2);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  outlined destroy of WorkoutVoiceFeedbackZoneEnteredPaceParameters(*(void *)(v0 + 48), type metadata accessor for WorkoutVoiceFeedbackZoneExitedAbovePaceParameters);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedAbovePace(executeSashGroupOnWatch:isSingleThreshold:_:)(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 72) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1)
  {
    char v5 = specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedAbovePace(executeSashGroupOnWatch:isSingleThreshold:_:);
  }
  else
  {
    *(void *)(v4 + 80) = a1;
    char v5 = specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedAbovePace(executeSashGroupOnWatch:isSingleThreshold:_:);
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedBelowNonPace(executeSashGroupOnWatch:isSingleThreshold:_:)(char a1, char a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a3;
  *(void *)(v4 + 24) = a4;
  *(unsigned char *)(v4 + 57) = a2;
  *(unsigned char *)(v4 + 56) = a1;
  return MEMORY[0x270FA2498](specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedBelowNonPace(executeSashGroupOnWatch:isSingleThreshold:_:), 0, 0);
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedBelowNonPace(executeSashGroupOnWatch:isSingleThreshold:_:)()
{
  uint64_t v2 = *(void *)(v0 + 24);
  char v3 = *(unsigned char *)(v0 + 57);
  char v4 = *(unsigned char *)(v0 + 56);
  LOBYTE(v1) = *(unsigned char *)(v2 + 34);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  uint64_t v5 = swift_allocObject();
  *(void *)(v0 + 32) = v5;
  *(_OWORD *)(v5 + 16) = xmmword_2619DAA90;
  *(void *)(v5 + 32) = 0xD000000000000017;
  *(void *)(v5 + 40) = 0x80000002619DC0D0;
  uint64_t v6 = MEMORY[0x263F8D4F8];
  *(unsigned char *)(v5 + 48) = v4;
  *(void *)(v5 + 72) = v6;
  *(void *)(v5 + 80) = 0xD000000000000011;
  *(void *)(v5 + 88) = 0x80000002619DBBF0;
  *(void *)(v5 + 120) = v6;
  *(unsigned char *)(v5 + 96) = v3;
  uint64_t v7 = *(void *)(v2 + 8);
  *(void *)(v5 + 128) = 0x647574696E67616DLL;
  *(void *)(v5 + 136) = 0xE900000000000065;
  uint64_t v8 = MEMORY[0x263F8D538];
  *(void *)(v5 + 144) = v7;
  *(void *)(v5 + 168) = v8;
  *(void *)(v5 + 176) = 0x63697274656DLL;
  *(void *)(v5 + 184) = 0xE600000000000000;
  *(void *)(v5 + 216) = v8;
  uint64_t v11 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x263F6D050]
                                                                            + MEMORY[0x263F6D050]);
  *(double *)(v5 + 192) = (double)v1;
  __n128 v9 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v9;
  *__n128 v9 = v0;
  v9[1] = specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedBelowNonPace(executeSashGroupOnWatch:isSingleThreshold:_:);
  return v11(0xD00000000000002BLL, 0x80000002619DC6C0, v5);
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedBelowNonPace(executeSashGroupOnWatch:isSingleThreshold:_:)(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 48) = v1;
  swift_task_dealloc();
  if (v1)
  {
    return MEMORY[0x270FA2498](specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneEnteredNonPace(executeSashGroupOnWatch:_:), 0, 0);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v5 = *(uint64_t (**)(uint64_t))(v4 + 8);
    return v5(a1);
  }
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedBelowSpeed(executeSashGroupOnWatch:isSingleThreshold:_:)(char a1, char a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a3;
  *(void *)(v4 + 24) = a4;
  *(unsigned char *)(v4 + 81) = a2;
  *(unsigned char *)(v4 + 80) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  *(void *)(v4 + 32) = swift_task_alloc();
  return MEMORY[0x270FA2498](specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedBelowSpeed(executeSashGroupOnWatch:isSingleThreshold:_:), 0, 0);
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedBelowSpeed(executeSashGroupOnWatch:isSingleThreshold:_:)(double a1)
{
  uint64_t v3 = *(void *)(v1 + 24);
  uint64_t v2 = *(void *)(v1 + 32);
  int v4 = *(unsigned __int8 *)(v1 + 81);
  __int16 v5 = *(unsigned __int8 *)(v1 + 80);
  LOBYTE(a1) = *(unsigned char *)(v3 + 34);
  double v6 = (double)*(unint64_t *)&a1;
  type metadata accessor for DialogLength.Builder();
  swift_allocObject();
  MEMORY[0x263E473C0]();
  dispatch thunk of DialogAbstractMeasurement.Builder.withValue(_:)();
  swift_release();
  String.toDialogUnit.getter(*(void *)(v3 + 16), *(void *)(v3 + 24));
  String.toSpeakableString.getter();
  swift_bridgeObjectRelease();
  uint64_t v7 = type metadata accessor for SpeakableString();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v2, 0, 1, v7);
  dispatch thunk of DialogAbstractMeasurement.Builder.withUnits(_:)();
  swift_release();
  outlined destroy of Any?(v2, &demangling cache variable for type metadata for SpeakableString?);
  uint64_t v8 = dispatch thunk of DialogAbstractMeasurement.Builder.build()();
  *(void *)(v1 + 40) = v8;
  swift_release();
  if (v4) {
    __int16 v9 = 256;
  }
  else {
    __int16 v9 = 0;
  }
  uint64_t v10 = WorkoutVoiceFeedbackZoneExitedAboveSpeedParameters.asKeyValuePairs()(v9 | v5, v8, *(uint64_t *)&v6, 0);
  *(void *)(v1 + 48) = v10;
  uint64_t v13 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x263F6D050]
                                                                            + MEMORY[0x263F6D050]);
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v1 + 56) = v11;
  *uint64_t v11 = v1;
  v11[1] = specialized WorkoutVoiceFeedbackCATPatternsExecutor.lapCompletionSpeed(executeSashGroupOnWatch:_:);
  return v13(0xD000000000000029, 0x80000002619DC6F0, v10);
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedBelowPace(executeSashGroupOnWatch:isSingleThreshold:_:)(char a1, char a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a3;
  *(void *)(v4 + 24) = a4;
  *(unsigned char *)(v4 + 89) = a2;
  *(unsigned char *)(v4 + 88) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  *(void *)(v4 + 32) = swift_task_alloc();
  *(void *)(v4 + 40) = type metadata accessor for WorkoutVoiceFeedbackZoneExitedBelowPaceParameters(0);
  *(void *)(v4 + 48) = swift_task_alloc();
  return MEMORY[0x270FA2498](specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedBelowPace(executeSashGroupOnWatch:isSingleThreshold:_:), 0, 0);
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedBelowPace(executeSashGroupOnWatch:isSingleThreshold:_:)()
{
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(v0 + 32);
  char v4 = *(unsigned char *)(v0 + 89);
  char v5 = *(unsigned char *)(v0 + 88);
  uint64_t v6 = v1 + *(int *)(*(void *)(v0 + 40) + 32);
  uint64_t v7 = type metadata accessor for SpeakableString();
  uint64_t v8 = *(__n128 (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
  __n128 v9 = v8(v6, 1, 1, v7);
  *(unsigned char *)uint64_t v1 = v5;
  *(unsigned char *)(v1 + 1) = v4;
  *(void *)(v1 + 24) = 0;
  v9.n128_u8[0] = *(unsigned char *)(v3 + 34);
  *(double *)(v1 + 8) = (double)v9.n128_u64[0];
  *(unsigned char *)(v1 + 16) = 0;
  type metadata accessor for DialogDuration.Builder();
  swift_allocObject();
  DialogDuration.Builder.init()();
  dispatch thunk of DialogDuration.Builder.withSecs(_:)();
  swift_release();
  uint64_t v10 = dispatch thunk of DialogDuration.Builder.build()();
  swift_release();
  *(void *)(v1 + 24) = v10;
  String.toDialogUnit.getter(*(void *)(v3 + 16), *(void *)(v3 + 24));
  String.toSpeakableString.getter();
  swift_bridgeObjectRelease();
  v8(v2, 0, 1, v7);
  outlined assign with take of SpeakableString?(v2, v6);
  uint64_t v11 = WorkoutVoiceFeedbackZoneExitedAbovePaceParameters.asKeyValuePairs()(type metadata accessor for WorkoutVoiceFeedbackZoneExitedBelowPaceParameters);
  *(void *)(v0 + 56) = v11;
  uint64_t v14 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x263F6D050]
                                                                            + MEMORY[0x263F6D050]);
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v12;
  void *v12 = v0;
  v12[1] = specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedBelowPace(executeSashGroupOnWatch:isSingleThreshold:_:);
  return v14(0xD000000000000028, 0x80000002619DC720, v11);
}

{
  void *v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v4;

  outlined destroy of WorkoutVoiceFeedbackZoneEnteredPaceParameters(v0[6], type metadata accessor for WorkoutVoiceFeedbackZoneExitedBelowPaceParameters);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v2 = v0[10];
  return v1(v2);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  outlined destroy of WorkoutVoiceFeedbackZoneEnteredPaceParameters(*(void *)(v0 + 48), type metadata accessor for WorkoutVoiceFeedbackZoneExitedBelowPaceParameters);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedBelowPace(executeSashGroupOnWatch:isSingleThreshold:_:)(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 72) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1)
  {
    char v5 = specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedBelowPace(executeSashGroupOnWatch:isSingleThreshold:_:);
  }
  else
  {
    *(void *)(v4 + 80) = a1;
    char v5 = specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedBelowPace(executeSashGroupOnWatch:isSingleThreshold:_:);
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneEnteredNonPace(executeSashGroupOnWatch:_:)(char a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a2;
  *(void *)(v3 + 24) = a3;
  *(unsigned char *)(v3 + 56) = a1;
  return MEMORY[0x270FA2498](specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneEnteredNonPace(executeSashGroupOnWatch:_:), 0, 0);
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneEnteredNonPace(executeSashGroupOnWatch:_:)()
{
  uint64_t v2 = *(void *)(v0 + 24);
  char v3 = *(unsigned char *)(v0 + 56);
  LOBYTE(v1) = *(unsigned char *)(v2 + 34);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  uint64_t v4 = swift_allocObject();
  *(void *)(v0 + 32) = v4;
  *(void *)(v4 + 32) = 0xD000000000000017;
  *(void *)(v4 + 40) = 0x80000002619DC0D0;
  uint64_t v5 = MEMORY[0x263F8D4F8];
  *(_OWORD *)(v4 + 16) = xmmword_2619DAAA0;
  *(void *)(v4 + 72) = v5;
  *(unsigned char *)(v4 + 48) = v3;
  uint64_t v6 = *(void *)(v2 + 8);
  *(void *)(v4 + 80) = 0x647574696E67616DLL;
  *(void *)(v4 + 88) = 0xE900000000000065;
  uint64_t v7 = MEMORY[0x263F8D538];
  *(void *)(v4 + 96) = v6;
  *(void *)(v4 + 120) = v7;
  *(void *)(v4 + 128) = 0x63697274656DLL;
  *(void *)(v4 + 136) = 0xE600000000000000;
  *(void *)(v4 + 168) = v7;
  *(double *)(v4 + 144) = (double)v1;
  uint64_t v10 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x263F6D050]
                                                                            + MEMORY[0x263F6D050]);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v8;
  *uint64_t v8 = v0;
  v8[1] = specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedBelowNonPace(executeSashGroupOnWatch:isSingleThreshold:_:);
  return v10(0xD000000000000027, 0x80000002619DC510, v4);
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneEnteredSpeed(executeSashGroupOnWatch:_:)(char a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a2;
  *(void *)(v3 + 24) = a3;
  *(unsigned char *)(v3 + 80) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  *(void *)(v3 + 32) = swift_task_alloc();
  return MEMORY[0x270FA2498](specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneEnteredSpeed(executeSashGroupOnWatch:_:), 0, 0);
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneEnteredSpeed(executeSashGroupOnWatch:_:)()
{
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(v0 + 32);
  char v4 = *(unsigned char *)(v0 + 80);
  LOBYTE(v1) = *(unsigned char *)(v3 + 34);
  type metadata accessor for DialogLength.Builder();
  swift_allocObject();
  MEMORY[0x263E473C0]();
  dispatch thunk of DialogAbstractMeasurement.Builder.withValue(_:)();
  swift_release();
  String.toDialogUnit.getter(*(void *)(v3 + 16), *(void *)(v3 + 24));
  String.toSpeakableString.getter();
  swift_bridgeObjectRelease();
  uint64_t v5 = type metadata accessor for SpeakableString();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v2, 0, 1, v5);
  dispatch thunk of DialogAbstractMeasurement.Builder.withUnits(_:)();
  swift_release();
  outlined destroy of Any?(v2, &demangling cache variable for type metadata for SpeakableString?);
  uint64_t v6 = dispatch thunk of DialogAbstractMeasurement.Builder.build()();
  *(void *)(v0 + 40) = v6;
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  uint64_t v7 = swift_allocObject();
  *(void *)(v0 + 48) = v7;
  *(_OWORD *)(v7 + 16) = xmmword_2619DAAA0;
  *(void *)(v7 + 32) = 0xD000000000000017;
  *(void *)(v7 + 40) = 0x80000002619DC0D0;
  uint64_t v8 = MEMORY[0x263F8D4F8];
  *(unsigned char *)(v7 + 48) = v4;
  *(void *)(v7 + 72) = v8;
  *(void *)(v7 + 80) = 0x6874676E656CLL;
  *(void *)(v7 + 88) = 0xE600000000000000;
  uint64_t v9 = type metadata accessor for DialogLength();
  *(void *)(v7 + 96) = v6;
  *(void *)(v7 + 120) = v9;
  *(void *)(v7 + 128) = 0x63697274656DLL;
  *(void *)(v7 + 136) = 0xE600000000000000;
  *(void *)(v7 + 168) = MEMORY[0x263F8D538];
  *(double *)(v7 + 144) = (double)v1;
  uint64_t v12 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x263F6D050]
                                                                            + MEMORY[0x263F6D050]);
  swift_retain();
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v10;
  *uint64_t v10 = v0;
  v10[1] = specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedAboveSpeed(executeSashGroupOnWatch:isSingleThreshold:_:);
  return v12(0xD000000000000025, 0x80000002619DC540, v7);
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneEnteredPace(executeSashGroupOnWatch:_:)(char a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a2;
  *(void *)(v3 + 24) = a3;
  *(unsigned char *)(v3 + 88) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  *(void *)(v3 + 32) = swift_task_alloc();
  *(void *)(v3 + 40) = type metadata accessor for WorkoutVoiceFeedbackZoneEnteredPaceParameters(0);
  *(void *)(v3 + 48) = swift_task_alloc();
  return MEMORY[0x270FA2498](specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneEnteredPace(executeSashGroupOnWatch:_:), 0, 0);
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneEnteredPace(executeSashGroupOnWatch:_:)()
{
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(v0 + 32);
  char v4 = *(unsigned char *)(v0 + 88);
  uint64_t v5 = v1 + *(int *)(*(void *)(v0 + 40) + 28);
  uint64_t v6 = type metadata accessor for SpeakableString();
  uint64_t v7 = *(__n128 (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  __n128 v8 = v7(v5, 1, 1, v6);
  *(unsigned char *)uint64_t v1 = v4;
  *(void *)(v1 + 24) = 0;
  v8.n128_u8[0] = *(unsigned char *)(v3 + 34);
  *(double *)(v1 + 8) = (double)v8.n128_u64[0];
  *(unsigned char *)(v1 + 16) = 0;
  type metadata accessor for DialogDuration.Builder();
  swift_allocObject();
  DialogDuration.Builder.init()();
  dispatch thunk of DialogDuration.Builder.withSecs(_:)();
  swift_release();
  uint64_t v9 = dispatch thunk of DialogDuration.Builder.build()();
  swift_release();
  *(void *)(v1 + 24) = v9;
  String.toDialogUnit.getter(*(void *)(v3 + 16), *(void *)(v3 + 24));
  String.toSpeakableString.getter();
  swift_bridgeObjectRelease();
  v7(v2, 0, 1, v6);
  outlined assign with take of SpeakableString?(v2, v5);
  uint64_t v10 = WorkoutVoiceFeedbackLapCompletionPaceParameters.asKeyValuePairs()(0x63697274656DLL, 0xE600000000000000, type metadata accessor for WorkoutVoiceFeedbackZoneEnteredPaceParameters);
  *(void *)(v0 + 56) = v10;
  uint64_t v13 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x263F6D050]
                                                                            + MEMORY[0x263F6D050]);
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v11;
  *uint64_t v11 = v0;
  v11[1] = specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneEnteredPace(executeSashGroupOnWatch:_:);
  return v13(0xD000000000000024, 0x80000002619DC570, v10);
}

{
  void *v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v4;

  outlined destroy of WorkoutVoiceFeedbackZoneEnteredPaceParameters(v0[6], type metadata accessor for WorkoutVoiceFeedbackZoneEnteredPaceParameters);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v2 = v0[10];
  return v1(v2);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  outlined destroy of WorkoutVoiceFeedbackZoneEnteredPaceParameters(*(void *)(v0 + 48), type metadata accessor for WorkoutVoiceFeedbackZoneEnteredPaceParameters);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneEnteredPace(executeSashGroupOnWatch:_:)(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 72) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v5 = specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneEnteredPace(executeSashGroupOnWatch:_:);
  }
  else
  {
    *(void *)(v4 + 80) = a1;
    uint64_t v5 = specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneEnteredPace(executeSashGroupOnWatch:_:);
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t type metadata accessor for WorkoutVoiceFeedbackZoneEnteredPaceParameters(uint64_t a1)
{
  return type metadata accessor for WorkoutReminderAnnouncementFlow.State(a1, (uint64_t *)&type metadata singleton initialization cache for WorkoutVoiceFeedbackZoneEnteredPaceParameters);
}

uint64_t outlined init with copy of URL?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingHeartRateZoneParameters(uint64_t a1)
{
  return type metadata accessor for WorkoutReminderAnnouncementFlow.State(a1, (uint64_t *)&type metadata singleton initialization cache for WorkoutVoiceFeedbackIntervalUpcomingHeartRateZoneParameters);
}

uint64_t type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingSpeedParameters(uint64_t a1)
{
  return type metadata accessor for WorkoutReminderAnnouncementFlow.State(a1, (uint64_t *)&type metadata singleton initialization cache for WorkoutVoiceFeedbackIntervalUpcomingSpeedParameters);
}

uint64_t type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingPaceParameters(uint64_t a1)
{
  return type metadata accessor for WorkoutReminderAnnouncementFlow.State(a1, (uint64_t *)&type metadata singleton initialization cache for WorkoutVoiceFeedbackIntervalUpcomingPaceParameters);
}

uint64_t type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters(uint64_t a1)
{
  return type metadata accessor for WorkoutReminderAnnouncementFlow.State(a1, (uint64_t *)&type metadata singleton initialization cache for WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters);
}

uint64_t type metadata accessor for WorkoutVoiceFeedbackZoneExitedBelowPaceParameters(uint64_t a1)
{
  return type metadata accessor for WorkoutReminderAnnouncementFlow.State(a1, (uint64_t *)&type metadata singleton initialization cache for WorkoutVoiceFeedbackZoneExitedBelowPaceParameters);
}

uint64_t outlined destroy of WorkoutVoiceFeedbackZoneEnteredPaceParameters(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.pacerGoalCompletion(executeSashGroupOnWatch:_:)(char a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 40) = a2;
  *(void *)(v3 + 48) = a3;
  *(unsigned char *)(v3 + 104) = a1;
  return MEMORY[0x270FA2498](specialized WorkoutVoiceFeedbackCATPatternsExecutor.pacerGoalCompletion(executeSashGroupOnWatch:_:), 0, 0);
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.pacerGoalCompletion(executeSashGroupOnWatch:_:)()
{
  *(void *)(v0 + 16) = 0;
  uint64_t v1 = *(void *)(v0 + 48);
  *(unsigned char *)(v0 + 24) = *(unsigned char *)(v0 + 104);
  *(void *)(v0 + 32) = 0;
  specialized closure #1 in PacerGoalCompletionModel.executePattern(wrapper:)((uint64_t *)(v0 + 16), *(void *)(v1 + 16), *(void *)(v1 + 24));
  uint64_t v2 = *(void *)(v0 + 16);
  *(void *)(v0 + 56) = v2;
  char v3 = *(unsigned char *)(v0 + 24);
  uint64_t v4 = *(void *)(v0 + 32);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  uint64_t v5 = swift_allocObject();
  *(void *)(v0 + 64) = v5;
  *(_OWORD *)(v5 + 16) = xmmword_2619DAAA0;
  *(void *)(v5 + 32) = 0x6E6F697461727564;
  *(void *)(v5 + 40) = 0xE800000000000000;
  if (v2)
  {
    uint64_t v6 = type metadata accessor for DialogDuration();
    uint64_t v7 = v2;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
    *(void *)(v5 + 56) = 0;
    *(void *)(v5 + 64) = 0;
  }
  *(void *)(v5 + 48) = v7;
  *(void *)(v5 + 72) = v6;
  *(void *)(v5 + 80) = 0xD000000000000017;
  *(void *)(v5 + 88) = 0x80000002619DC0D0;
  uint64_t v8 = MEMORY[0x263F8D4F8];
  *(unsigned char *)(v5 + 96) = v3;
  *(void *)(v5 + 120) = v8;
  *(void *)(v5 + 128) = 0x6874676E656CLL;
  *(void *)(v5 + 136) = 0xE600000000000000;
  uint64_t v9 = 0;
  if (v4)
  {
    uint64_t v9 = type metadata accessor for DialogLength();
  }
  else
  {
    *(void *)(v5 + 152) = 0;
    *(void *)(v5 + 160) = 0;
  }
  *(void *)(v0 + 72) = v4;
  *(void *)(v5 + 144) = v4;
  *(void *)(v5 + 168) = v9;
  uint64_t v12 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x263F6D050]
                                                                            + MEMORY[0x263F6D050]);
  swift_retain();
  swift_retain();
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v10;
  *uint64_t v10 = v0;
  v10[1] = specialized WorkoutVoiceFeedbackCATPatternsExecutor.pacerGoalCompletion(executeSashGroupOnWatch:_:);
  return v12(0xD000000000000028, 0x80000002619DC750, v5);
}

{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v4;

  swift_release();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 96);
  return v1(v2);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_release();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.pacerGoalCompletion(executeSashGroupOnWatch:_:)(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 88) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1)
  {
    uint64_t v5 = specialized WorkoutVoiceFeedbackCATPatternsExecutor.pacerGoalCompletion(executeSashGroupOnWatch:_:);
  }
  else
  {
    *(void *)(v4 + 96) = a1;
    uint64_t v5 = specialized WorkoutVoiceFeedbackCATPatternsExecutor.pacerGoalCompletion(executeSashGroupOnWatch:_:);
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t type metadata accessor for WorkoutVoiceFeedbackZoneExitedAbovePaceParameters(uint64_t a1)
{
  return type metadata accessor for WorkoutReminderAnnouncementFlow.State(a1, (uint64_t *)&type metadata singleton initialization cache for WorkoutVoiceFeedbackZoneExitedAbovePaceParameters);
}

uint64_t type metadata accessor for WorkoutVoiceFeedbackLapCompletionPaceParameters(uint64_t a1)
{
  return type metadata accessor for WorkoutReminderAnnouncementFlow.State(a1, (uint64_t *)&type metadata singleton initialization cache for WorkoutVoiceFeedbackLapCompletionPaceParameters);
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.goalHalfwayPoint(executeSashGroupOnWatch:_:)(char a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  *(void *)(v5 + 32) = a3;
  *(void *)(v5 + 40) = a4;
  *(double *)(v5 + 24) = a5;
  *(void *)(v5 + 16) = a2;
  *(unsigned char *)(v5 + 96) = a1;
  *(void *)(v5 + 48) = type metadata accessor for WorkoutVoiceFeedbackGoalHalfwayPointParameters(0);
  *(void *)(v5 + 56) = swift_task_alloc();
  return MEMORY[0x270FA2498](specialized WorkoutVoiceFeedbackCATPatternsExecutor.goalHalfwayPoint(executeSashGroupOnWatch:_:), 0, 0);
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.goalHalfwayPoint(executeSashGroupOnWatch:_:)()
{
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v3 = *(void *)(v0 + 32);
  uint64_t v2 = *(void *)(v0 + 40);
  double v4 = *(double *)(v0 + 24);
  char v5 = *(unsigned char *)(v0 + 96);
  uint64_t v6 = v1 + *(int *)(*(void *)(v0 + 48) + 32);
  uint64_t v7 = type metadata accessor for SpeakableString();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  *(void *)uint64_t v1 = 0;
  *(unsigned char *)(v1 + 8) = v5;
  *(void *)(v1 + 16) = 0;
  *(void *)(v1 + 24) = 0;
  *(unsigned char *)(v1 + 32) = 1;
  specialized closure #1 in HalfwayGoalCompletionModel.executePattern(wrapper:)(v1, v3, v2, v4);
  uint64_t v8 = WorkoutVoiceFeedbackGoalCompletionParameters.asKeyValuePairs()(type metadata accessor for WorkoutVoiceFeedbackGoalHalfwayPointParameters);
  *(void *)(v0 + 64) = v8;
  uint64_t v11 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x263F6D050]
                                                                            + MEMORY[0x263F6D050]);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v9;
  *uint64_t v9 = v0;
  v9[1] = specialized WorkoutVoiceFeedbackCATPatternsExecutor.goalHalfwayPoint(executeSashGroupOnWatch:_:);
  return v11(0xD000000000000025, 0x80000002619DC8A0, v8);
}

{
  void *v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v4;

  outlined destroy of WorkoutVoiceFeedbackZoneEnteredPaceParameters(v0[7], type metadata accessor for WorkoutVoiceFeedbackGoalHalfwayPointParameters);
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v2 = v0[11];
  return v1(v2);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  outlined destroy of WorkoutVoiceFeedbackZoneEnteredPaceParameters(*(void *)(v0 + 56), type metadata accessor for WorkoutVoiceFeedbackGoalHalfwayPointParameters);
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t specialized WorkoutVoiceFeedbackCATPatternsExecutor.goalHalfwayPoint(executeSashGroupOnWatch:_:)(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 80) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1)
  {
    char v5 = specialized WorkoutVoiceFeedbackCATPatternsExecutor.goalHalfwayPoint(executeSashGroupOnWatch:_:);
  }
  else
  {
    *(void *)(v4 + 88) = a1;
    char v5 = specialized WorkoutVoiceFeedbackCATPatternsExecutor.goalHalfwayPoint(executeSashGroupOnWatch:_:);
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t type metadata accessor for WorkoutVoiceFeedbackGoalHalfwayPointParameters(uint64_t a1)
{
  return type metadata accessor for WorkoutReminderAnnouncementFlow.State(a1, (uint64_t *)&type metadata singleton initialization cache for WorkoutVoiceFeedbackGoalHalfwayPointParameters);
}

uint64_t outlined retain of DialogLength?(uint64_t a1)
{
  return a1;
}

uint64_t type metadata accessor for WorkoutVoiceFeedbackTransitionedNotableDistancePaceParameters(uint64_t a1)
{
  return type metadata accessor for WorkoutReminderAnnouncementFlow.State(a1, (uint64_t *)&type metadata singleton initialization cache for WorkoutVoiceFeedbackTransitionedNotableDistancePaceParameters);
}

uint64_t type metadata accessor for WorkoutVoiceFeedbackGoalCompletionParameters(uint64_t a1)
{
  return type metadata accessor for WorkoutReminderAnnouncementFlow.State(a1, (uint64_t *)&type metadata singleton initialization cache for WorkoutVoiceFeedbackGoalCompletionParameters);
}

uint64_t getEnumTagSinglePayload for WorkoutVoiceFeedbackGoalCompletionParameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm);
}

uint64_t storeEnumTagSinglePayload for WorkoutVoiceFeedbackGoalCompletionParameters(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm);
}

void type metadata completion function for WorkoutVoiceFeedbackGoalCompletionParameters()
{
}

{
  unint64_t v0;

  type metadata accessor for SpeakableString?();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void type metadata accessor for SpeakableString?()
{
  if (!lazy cache variable for type metadata for SpeakableString?)
  {
    type metadata accessor for SpeakableString();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for SpeakableString?);
    }
  }
}

uint64_t getEnumTagSinglePayload for WorkoutVoiceFeedbackTransitionedNotableDistancePaceParameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm_0);
}

uint64_t storeEnumTagSinglePayload for WorkoutVoiceFeedbackTransitionedNotableDistancePaceParameters(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm_0);
}

uint64_t initializeBufferWithCopyOfBuffer for WorkoutVoiceFeedbackGoalCompletionParameters(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v5 = v4 + ((v3 + 16) & ~(unint64_t)v3);
    swift_retain();
  }
  else
  {
    uint64_t v5 = a1;
    *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
    uint64_t v6 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v6;
    *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
    uint64_t v7 = *(int *)(a3 + 32);
    uint64_t v8 = (void *)(a1 + v7);
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = type metadata accessor for SpeakableString();
    uint64_t v11 = *(void *)(v10 - 8);
    uint64_t v12 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48);
    swift_retain();
    swift_retain();
    if (v12(v9, 1, v10))
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
      memcpy(v8, v9, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    }
  }
  return v5;
}

uint64_t destroy for WorkoutVoiceFeedbackGoalCompletionParameters(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 32);
  uint64_t v5 = type metadata accessor for SpeakableString();
  uint64_t v8 = *(void *)(v5 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v4, 1, v5);
  if (!result)
  {
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8);
    return v7(v4, v5);
  }
  return result;
}

uint64_t initializeWithCopy for WorkoutVoiceFeedbackGoalCompletionParameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v5 = *(int *)(a3 + 32);
  uint64_t v6 = (void *)(a1 + v5);
  uint64_t v7 = (const void *)(a2 + v5);
  uint64_t v8 = type metadata accessor for SpeakableString();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v9 + 48);
  swift_retain();
  swift_retain();
  if (v10(v7, 1, v8))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    memcpy(v6, v7, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v9 + 16))(v6, v7, v8);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  }
  return a1;
}

uint64_t assignWithCopy for WorkoutVoiceFeedbackGoalCompletionParameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  uint64_t v6 = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 24) = v6;
  uint64_t v7 = *(int *)(a3 + 32);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = type metadata accessor for SpeakableString();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t initializeWithTake for WorkoutVoiceFeedbackGoalCompletionParameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v5 = *(int *)(a3 + 32);
  uint64_t v6 = (void *)(a1 + v5);
  uint64_t v7 = (const void *)(a2 + v5);
  uint64_t v8 = type metadata accessor for SpeakableString();
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    memcpy(v6, v7, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v9 + 32))(v6, v7, v8);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  }
  return a1;
}

uint64_t assignWithTake for WorkoutVoiceFeedbackGoalCompletionParameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  uint64_t v6 = *(int *)(a3 + 32);
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (void *)(a2 + v6);
  uint64_t v9 = type metadata accessor for SpeakableString();
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
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 32))(v7, v8, v9);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for WorkoutVoiceFeedbackGoalHalfwayPointParameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2619C609C);
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
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
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    uint64_t v10 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    uint64_t v11 = v9;
    int v12 = (char *)a1 + *(int *)(a3 + 32);
    return v10(v12, a2, v11);
  }
}

uint64_t storeEnumTagSinglePayload for WorkoutVoiceFeedbackGoalHalfwayPointParameters(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2619C6174);
}

void *__swift_store_extra_inhabitant_indexTm(void *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 2147483646)
  {
    *uint64_t result = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 32);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for WorkoutVoiceFeedbackLapCompletionPaceParameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_104Tm);
}

uint64_t storeEnumTagSinglePayload for WorkoutVoiceFeedbackLapCompletionPaceParameters(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_105Tm);
}

uint64_t getEnumTagSinglePayload for WorkoutVoiceFeedbackZoneExitedAbovePaceParameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_107Tm);
}

uint64_t storeEnumTagSinglePayload for WorkoutVoiceFeedbackZoneExitedAbovePaceParameters(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_108Tm);
}

void type metadata completion function for WorkoutVoiceFeedbackZoneExitedAbovePaceParameters()
{
}

void *initializeBufferWithCopyOfBuffer for WorkoutVoiceFeedbackZoneExitedAbovePaceParameters(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *int v3 = *a2;
    int v3 = (void *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_WORD *)a1 = *(_WORD *)a2;
    *(void *)(a1 + 8) = a2[1];
    *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
    *(void *)(a1 + 24) = a2[3];
    uint64_t v5 = *(int *)(a3 + 32);
    uint64_t v6 = (void *)(a1 + v5);
    uint64_t v7 = (char *)a2 + v5;
    uint64_t v8 = type metadata accessor for SpeakableString();
    uint64_t v9 = *(void *)(v8 - 8);
    uint64_t v10 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v9 + 48);
    swift_retain();
    if (v10(v7, 1, v8))
    {
      uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
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

uint64_t destroy for WorkoutVoiceFeedbackZoneExitedAbovePaceParameters(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 32);
  uint64_t v5 = type metadata accessor for SpeakableString();
  uint64_t v8 = *(void *)(v5 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v4, 1, v5);
  if (!result)
  {
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8);
    return v7(v4, v5);
  }
  return result;
}

uint64_t initializeWithCopy for WorkoutVoiceFeedbackZoneExitedAbovePaceParameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v4 = *(int *)(a3 + 32);
  uint64_t v5 = (void *)(a1 + v4);
  uint64_t v6 = (const void *)(a2 + v4);
  uint64_t v7 = type metadata accessor for SpeakableString();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v8 + 48);
  swift_retain();
  if (v9(v6, 1, v7))
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    memcpy(v5, v6, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v8 + 16))(v5, v6, v7);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

uint64_t assignWithCopy for WorkoutVoiceFeedbackZoneExitedAbovePaceParameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  uint64_t v6 = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 8) = v6;
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  uint64_t v7 = *(int *)(a3 + 32);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = type metadata accessor for SpeakableString();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t initializeWithTake for WorkoutVoiceFeedbackZoneExitedAbovePaceParameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v4 = *(int *)(a3 + 32);
  uint64_t v5 = (void *)(a1 + v4);
  uint64_t v6 = (const void *)(a2 + v4);
  uint64_t v7 = type metadata accessor for SpeakableString();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    memcpy(v5, v6, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v8 + 32))(v5, v6, v7);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

uint64_t assignWithTake for WorkoutVoiceFeedbackZoneExitedAbovePaceParameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  uint64_t v6 = *(int *)(a3 + 32);
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (void *)(a2 + v6);
  uint64_t v9 = type metadata accessor for SpeakableString();
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
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 32))(v7, v8, v9);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for WorkoutVoiceFeedbackZoneExitedBelowPaceParameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2619C6B04);
}

uint64_t __swift_get_extra_inhabitant_index_107Tm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 24);
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
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    uint64_t v11 = v9;
    uint64_t v12 = a1 + *(int *)(a3 + 32);
    return v10(v12, a2, v11);
  }
}

uint64_t storeEnumTagSinglePayload for WorkoutVoiceFeedbackZoneExitedBelowPaceParameters(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2619C6BDC);
}

uint64_t __swift_store_extra_inhabitant_index_108Tm(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 24) = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 32);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for WorkoutVoiceFeedbackIntervalUpcomingHeartRateZoneParameters(uint64_t a1, uint64_t *a2, int *a3)
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
    *(unsigned char *)a1 = *(unsigned char *)a2;
    *(void *)(a1 + 8) = a2[1];
    *(_WORD *)(a1 + 16) = *((_WORD *)a2 + 8);
    *(void *)(a1 + 24) = a2[3];
    *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
    *(void *)(a1 + 40) = a2[5];
    *(unsigned char *)(a1 + 48) = *((unsigned char *)a2 + 48);
    uint64_t v7 = a2[7];
    uint64_t v8 = a2[9];
    *(void *)(a1 + 64) = a2[8];
    *(void *)(a1 + 72) = v8;
    *(unsigned char *)(a1 + 80) = *((unsigned char *)a2 + 80);
    uint64_t v9 = a3[12];
    __dst = (void *)(a1 + v9);
    uint64_t v10 = (char *)a2 + v9;
    *(void *)(a1 + 56) = v7;
    uint64_t v11 = type metadata accessor for SpeakableString();
    uint64_t v12 = *(void *)(v11 - 8);
    int v13 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48);
    swift_retain();
    swift_retain();
    if (v13(v10, 1, v11))
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
      memcpy(__dst, v10, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v12 + 16))(__dst, v10, v11);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(__dst, 0, 1, v11);
    }
    uint64_t v16 = a3[14];
    *(unsigned char *)(v4 + a3[13]) = *((unsigned char *)a2 + a3[13]);
    *(unsigned char *)(v4 + v16) = *((unsigned char *)a2 + v16);
    uint64_t v17 = a3[16];
    *(unsigned char *)(v4 + a3[15]) = *((unsigned char *)a2 + a3[15]);
    *(void *)(v4 + v17) = *(uint64_t *)((char *)a2 + v17);
    uint64_t v18 = a3[18];
    *(void *)(v4 + a3[17]) = *(uint64_t *)((char *)a2 + a3[17]);
    uint64_t v19 = v4 + v18;
    uint64_t v20 = (uint64_t)a2 + v18;
    *(void *)uint64_t v19 = *(void *)v20;
    *(unsigned char *)(v19 + 8) = *(unsigned char *)(v20 + 8);
    uint64_t v21 = a3[19];
    uint64_t v22 = a3[20];
    uint64_t v23 = v4 + v21;
    uint64_t v24 = (uint64_t)a2 + v21;
    *(void *)uint64_t v23 = *(void *)v24;
    *(unsigned char *)(v23 + 8) = *(unsigned char *)(v24 + 8);
    uint64_t v25 = v4 + v22;
    uint64_t v26 = (uint64_t)a2 + v22;
    *(void *)uint64_t v25 = *(void *)v26;
    *(unsigned char *)(v25 + 8) = *(unsigned char *)(v26 + 8);
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t destroy for WorkoutVoiceFeedbackIntervalUpcomingHeartRateZoneParameters(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 48);
  uint64_t v5 = type metadata accessor for SpeakableString();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for WorkoutVoiceFeedbackIntervalUpcomingHeartRateZoneParameters(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v6 = *(void *)(a2 + 56);
  uint64_t v7 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v7;
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  uint64_t v8 = a3[12];
  __dst = (void *)(a1 + v8);
  uint64_t v9 = (const void *)(a2 + v8);
  *(void *)(a1 + 56) = v6;
  uint64_t v10 = type metadata accessor for SpeakableString();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48);
  swift_retain();
  swift_retain();
  if (v12(v9, 1, v10))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    memcpy(__dst, v9, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(__dst, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(__dst, 0, 1, v10);
  }
  uint64_t v14 = a3[14];
  *(unsigned char *)(a1 + a3[13]) = *(unsigned char *)(a2 + a3[13]);
  *(unsigned char *)(a1 + v14) = *(unsigned char *)(a2 + v14);
  uint64_t v15 = a3[16];
  *(unsigned char *)(a1 + a3[15]) = *(unsigned char *)(a2 + a3[15]);
  *(void *)(a1 + v15) = *(void *)(a2 + v15);
  uint64_t v16 = a3[18];
  *(void *)(a1 + a3[17]) = *(void *)(a2 + a3[17]);
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  *(void *)uint64_t v17 = *(void *)v18;
  *(unsigned char *)(v17 + 8) = *(unsigned char *)(v18 + 8);
  uint64_t v19 = a3[19];
  uint64_t v20 = a3[20];
  uint64_t v21 = a1 + v19;
  uint64_t v22 = a2 + v19;
  *(void *)uint64_t v21 = *(void *)v22;
  *(unsigned char *)(v21 + 8) = *(unsigned char *)(v22 + 8);
  uint64_t v23 = a1 + v20;
  uint64_t v24 = a2 + v20;
  *(void *)uint64_t v23 = *(void *)v24;
  *(unsigned char *)(v23 + 8) = *(unsigned char *)(v24 + 8);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for WorkoutVoiceFeedbackIntervalUpcomingHeartRateZoneParameters(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  uint64_t v7 = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 24) = v7;
  uint64_t v8 = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_release();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_retain();
  swift_release();
  uint64_t v9 = *(void *)(a2 + 72);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(void *)(a1 + 72) = v9;
  uint64_t v10 = a3[12];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  uint64_t v13 = type metadata accessor for SpeakableString();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v14 + 48);
  int v16 = v15(v11, 1, v13);
  int v17 = v15(v12, 1, v13);
  if (!v16)
  {
    if (!v17)
    {
      (*(void (**)(void *, void *, uint64_t))(v14 + 24))(v11, v12, v13);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v14 + 8))(v11, v13);
    goto LABEL_6;
  }
  if (v17)
  {
LABEL_6:
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    memcpy(v11, v12, *(void *)(*(void *)(v18 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v14 + 16))(v11, v12, v13);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
LABEL_7:
  *(unsigned char *)(a1 + a3[13]) = *(unsigned char *)(a2 + a3[13]);
  *(unsigned char *)(a1 + a3[14]) = *(unsigned char *)(a2 + a3[14]);
  *(unsigned char *)(a1 + a3[15]) = *(unsigned char *)(a2 + a3[15]);
  *(void *)(a1 + a3[16]) = *(void *)(a2 + a3[16]);
  swift_retain();
  swift_release();
  *(void *)(a1 + a3[17]) = *(void *)(a2 + a3[17]);
  swift_retain();
  swift_release();
  uint64_t v19 = a3[18];
  uint64_t v20 = a1 + v19;
  uint64_t v21 = (uint64_t *)(a2 + v19);
  uint64_t v22 = *v21;
  *(unsigned char *)(v20 + 8) = *((unsigned char *)v21 + 8);
  *(void *)uint64_t v20 = v22;
  uint64_t v23 = a3[19];
  uint64_t v24 = a1 + v23;
  uint64_t v25 = (uint64_t *)(a2 + v23);
  uint64_t v26 = *v25;
  *(unsigned char *)(v24 + 8) = *((unsigned char *)v25 + 8);
  *(void *)uint64_t v24 = v26;
  uint64_t v27 = a3[20];
  uint64_t v28 = a1 + v27;
  uint64_t v29 = (uint64_t *)(a2 + v27);
  uint64_t v30 = *v29;
  *(unsigned char *)(v28 + 8) = *((unsigned char *)v29 + 8);
  *(void *)uint64_t v28 = v30;
  return a1;
}

uint64_t initializeWithTake for WorkoutVoiceFeedbackIntervalUpcomingHeartRateZoneParameters(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  long long v6 = *(_OWORD *)(a2 + 56);
  uint64_t v7 = *(void *)(a2 + 72);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(void *)(a1 + 72) = v7;
  uint64_t v8 = a3[12];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (const void *)(a2 + v8);
  *(_OWORD *)(a1 + 56) = v6;
  uint64_t v11 = type metadata accessor for SpeakableString();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 32))(v9, v10, v11);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  uint64_t v14 = a3[14];
  *(unsigned char *)(a1 + a3[13]) = *(unsigned char *)(a2 + a3[13]);
  *(unsigned char *)(a1 + v14) = *(unsigned char *)(a2 + v14);
  uint64_t v15 = a3[16];
  *(unsigned char *)(a1 + a3[15]) = *(unsigned char *)(a2 + a3[15]);
  *(void *)(a1 + v15) = *(void *)(a2 + v15);
  uint64_t v16 = a3[18];
  *(void *)(a1 + a3[17]) = *(void *)(a2 + a3[17]);
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  *(void *)uint64_t v17 = *(void *)v18;
  *(unsigned char *)(v17 + 8) = *(unsigned char *)(v18 + 8);
  uint64_t v19 = a3[19];
  uint64_t v20 = a3[20];
  uint64_t v21 = a1 + v19;
  uint64_t v22 = a2 + v19;
  *(void *)uint64_t v21 = *(void *)v22;
  *(unsigned char *)(v21 + 8) = *(unsigned char *)(v22 + 8);
  uint64_t v23 = a1 + v20;
  uint64_t v24 = a2 + v20;
  *(void *)uint64_t v23 = *(void *)v24;
  *(unsigned char *)(v23 + 8) = *(unsigned char *)(v24 + 8);
  return a1;
}

uint64_t assignWithTake for WorkoutVoiceFeedbackIntervalUpcomingHeartRateZoneParameters(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_release();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_release();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  uint64_t v6 = a3[12];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (void *)(a2 + v6);
  uint64_t v9 = type metadata accessor for SpeakableString();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 40))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 32))(v7, v8, v9);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  uint64_t v15 = a3[14];
  *(unsigned char *)(a1 + a3[13]) = *(unsigned char *)(a2 + a3[13]);
  *(unsigned char *)(a1 + v15) = *(unsigned char *)(a2 + v15);
  uint64_t v16 = a3[16];
  *(unsigned char *)(a1 + a3[15]) = *(unsigned char *)(a2 + a3[15]);
  *(void *)(a1 + v16) = *(void *)(a2 + v16);
  swift_release();
  *(void *)(a1 + a3[17]) = *(void *)(a2 + a3[17]);
  swift_release();
  uint64_t v17 = a3[18];
  uint64_t v18 = a3[19];
  uint64_t v19 = a1 + v17;
  uint64_t v20 = a2 + v17;
  *(void *)uint64_t v19 = *(void *)v20;
  *(unsigned char *)(v19 + 8) = *(unsigned char *)(v20 + 8);
  uint64_t v21 = a1 + v18;
  uint64_t v22 = a2 + v18;
  *(void *)uint64_t v21 = *(void *)v22;
  *(unsigned char *)(v21 + 8) = *(unsigned char *)(v22 + 8);
  uint64_t v23 = a3[20];
  uint64_t v24 = a1 + v23;
  uint64_t v25 = a2 + v23;
  *(void *)uint64_t v24 = *(void *)v25;
  *(unsigned char *)(v24 + 8) = *(unsigned char *)(v25 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for WorkoutVoiceFeedbackIntervalUpcomingHeartRateZoneParameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_113Tm);
}

uint64_t storeEnumTagSinglePayload for WorkoutVoiceFeedbackIntervalUpcomingHeartRateZoneParameters(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_114Tm);
}

void type metadata completion function for WorkoutVoiceFeedbackIntervalUpcomingHeartRateZoneParameters()
{
  type metadata accessor for SpeakableString?();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t initializeBufferWithCopyOfBuffer for WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters(uint64_t a1, uint64_t *a2, int *a3)
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
    *(unsigned char *)a1 = *(unsigned char *)a2;
    *(void *)(a1 + 8) = a2[1];
    *(_WORD *)(a1 + 16) = *((_WORD *)a2 + 8);
    *(void *)(a1 + 24) = a2[3];
    *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
    *(void *)(a1 + 40) = a2[5];
    *(unsigned char *)(a1 + 48) = *((unsigned char *)a2 + 48);
    uint64_t v7 = a2[7];
    uint64_t v8 = a2[9];
    *(void *)(a1 + 64) = a2[8];
    *(void *)(a1 + 72) = v8;
    *(unsigned char *)(a1 + 80) = *((unsigned char *)a2 + 80);
    uint64_t v9 = a3[12];
    __dst = (void *)(a1 + v9);
    uint64_t v10 = (char *)a2 + v9;
    *(void *)(a1 + 56) = v7;
    uint64_t v11 = type metadata accessor for SpeakableString();
    uint64_t v12 = *(void *)(v11 - 8);
    int v13 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48);
    swift_retain();
    swift_retain();
    if (v13(v10, 1, v11))
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
      memcpy(__dst, v10, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v12 + 16))(__dst, v10, v11);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(__dst, 0, 1, v11);
    }
    uint64_t v16 = a3[14];
    *(unsigned char *)(v4 + a3[13]) = *((unsigned char *)a2 + a3[13]);
    *(unsigned char *)(v4 + v16) = *((unsigned char *)a2 + v16);
    uint64_t v17 = a3[16];
    *(unsigned char *)(v4 + a3[15]) = *((unsigned char *)a2 + a3[15]);
    *(unsigned char *)(v4 + v17) = *((unsigned char *)a2 + v17);
    uint64_t v18 = a3[18];
    *(unsigned char *)(v4 + a3[17]) = *((unsigned char *)a2 + a3[17]);
    *(unsigned char *)(v4 + v18) = *((unsigned char *)a2 + v18);
    uint64_t v19 = a3[20];
    *(unsigned char *)(v4 + a3[19]) = *((unsigned char *)a2 + a3[19]);
    uint64_t v20 = v4 + v19;
    uint64_t v21 = (uint64_t)a2 + v19;
    *(void *)uint64_t v20 = *(void *)v21;
    *(unsigned char *)(v20 + 8) = *(unsigned char *)(v21 + 8);
    uint64_t v22 = a3[21];
    uint64_t v23 = a3[22];
    uint64_t v24 = v4 + v22;
    uint64_t v25 = (uint64_t)a2 + v22;
    *(void *)uint64_t v24 = *(void *)v25;
    *(unsigned char *)(v24 + 8) = *(unsigned char *)(v25 + 8);
    *(void *)(v4 + v23) = *(uint64_t *)((char *)a2 + v23);
    uint64_t v26 = a3[24];
    *(void *)(v4 + a3[23]) = *(uint64_t *)((char *)a2 + a3[23]);
    uint64_t v27 = v4 + v26;
    uint64_t v28 = (uint64_t)a2 + v26;
    *(void *)uint64_t v27 = *(void *)v28;
    *(unsigned char *)(v27 + 8) = *(unsigned char *)(v28 + 8);
    uint64_t v29 = a3[25];
    uint64_t v30 = v4 + v29;
    uint64_t v31 = (uint64_t)a2 + v29;
    *(void *)uint64_t v30 = *(void *)v31;
    *(unsigned char *)(v30 + 8) = *(unsigned char *)(v31 + 8);
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t destroy for WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 48);
  uint64_t v5 = type metadata accessor for SpeakableString();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v6 = *(void *)(a2 + 56);
  uint64_t v7 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v7;
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  uint64_t v8 = a3[12];
  __dst = (void *)(a1 + v8);
  uint64_t v9 = (const void *)(a2 + v8);
  *(void *)(a1 + 56) = v6;
  uint64_t v10 = type metadata accessor for SpeakableString();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48);
  swift_retain();
  swift_retain();
  if (v12(v9, 1, v10))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    memcpy(__dst, v9, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(__dst, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(__dst, 0, 1, v10);
  }
  uint64_t v14 = a3[14];
  *(unsigned char *)(a1 + a3[13]) = *(unsigned char *)(a2 + a3[13]);
  *(unsigned char *)(a1 + v14) = *(unsigned char *)(a2 + v14);
  uint64_t v15 = a3[16];
  *(unsigned char *)(a1 + a3[15]) = *(unsigned char *)(a2 + a3[15]);
  *(unsigned char *)(a1 + v15) = *(unsigned char *)(a2 + v15);
  uint64_t v16 = a3[18];
  *(unsigned char *)(a1 + a3[17]) = *(unsigned char *)(a2 + a3[17]);
  *(unsigned char *)(a1 + v16) = *(unsigned char *)(a2 + v16);
  uint64_t v17 = a3[20];
  *(unsigned char *)(a1 + a3[19]) = *(unsigned char *)(a2 + a3[19]);
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  *(void *)uint64_t v18 = *(void *)v19;
  *(unsigned char *)(v18 + 8) = *(unsigned char *)(v19 + 8);
  uint64_t v20 = a3[21];
  uint64_t v21 = a3[22];
  uint64_t v22 = a1 + v20;
  uint64_t v23 = a2 + v20;
  *(void *)uint64_t v22 = *(void *)v23;
  *(unsigned char *)(v22 + 8) = *(unsigned char *)(v23 + 8);
  *(void *)(a1 + v21) = *(void *)(a2 + v21);
  uint64_t v24 = a3[24];
  *(void *)(a1 + a3[23]) = *(void *)(a2 + a3[23]);
  uint64_t v25 = a1 + v24;
  uint64_t v26 = a2 + v24;
  *(void *)uint64_t v25 = *(void *)v26;
  *(unsigned char *)(v25 + 8) = *(unsigned char *)(v26 + 8);
  uint64_t v27 = a3[25];
  uint64_t v28 = a1 + v27;
  uint64_t v29 = a2 + v27;
  *(void *)uint64_t v28 = *(void *)v29;
  *(unsigned char *)(v28 + 8) = *(unsigned char *)(v29 + 8);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  uint64_t v7 = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 24) = v7;
  uint64_t v8 = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_release();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_retain();
  swift_release();
  uint64_t v9 = *(void *)(a2 + 72);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(void *)(a1 + 72) = v9;
  uint64_t v10 = a3[12];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  uint64_t v13 = type metadata accessor for SpeakableString();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v14 + 48);
  int v16 = v15(v11, 1, v13);
  int v17 = v15(v12, 1, v13);
  if (!v16)
  {
    if (!v17)
    {
      (*(void (**)(void *, void *, uint64_t))(v14 + 24))(v11, v12, v13);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v14 + 8))(v11, v13);
    goto LABEL_6;
  }
  if (v17)
  {
LABEL_6:
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    memcpy(v11, v12, *(void *)(*(void *)(v18 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v14 + 16))(v11, v12, v13);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
LABEL_7:
  *(unsigned char *)(a1 + a3[13]) = *(unsigned char *)(a2 + a3[13]);
  *(unsigned char *)(a1 + a3[14]) = *(unsigned char *)(a2 + a3[14]);
  *(unsigned char *)(a1 + a3[15]) = *(unsigned char *)(a2 + a3[15]);
  *(unsigned char *)(a1 + a3[16]) = *(unsigned char *)(a2 + a3[16]);
  *(unsigned char *)(a1 + a3[17]) = *(unsigned char *)(a2 + a3[17]);
  *(unsigned char *)(a1 + a3[18]) = *(unsigned char *)(a2 + a3[18]);
  *(unsigned char *)(a1 + a3[19]) = *(unsigned char *)(a2 + a3[19]);
  uint64_t v19 = a3[20];
  uint64_t v20 = a1 + v19;
  uint64_t v21 = (uint64_t *)(a2 + v19);
  uint64_t v22 = *v21;
  *(unsigned char *)(v20 + 8) = *((unsigned char *)v21 + 8);
  *(void *)uint64_t v20 = v22;
  uint64_t v23 = a3[21];
  uint64_t v24 = a1 + v23;
  uint64_t v25 = (uint64_t *)(a2 + v23);
  uint64_t v26 = *v25;
  *(unsigned char *)(v24 + 8) = *((unsigned char *)v25 + 8);
  *(void *)uint64_t v24 = v26;
  *(void *)(a1 + a3[22]) = *(void *)(a2 + a3[22]);
  swift_retain();
  swift_release();
  *(void *)(a1 + a3[23]) = *(void *)(a2 + a3[23]);
  swift_retain();
  swift_release();
  uint64_t v27 = a3[24];
  uint64_t v28 = a1 + v27;
  uint64_t v29 = (uint64_t *)(a2 + v27);
  uint64_t v30 = *v29;
  *(unsigned char *)(v28 + 8) = *((unsigned char *)v29 + 8);
  *(void *)uint64_t v28 = v30;
  uint64_t v31 = a3[25];
  uint64_t v32 = a1 + v31;
  uint64_t v33 = (uint64_t *)(a2 + v31);
  uint64_t v34 = *v33;
  *(unsigned char *)(v32 + 8) = *((unsigned char *)v33 + 8);
  *(void *)uint64_t v32 = v34;
  return a1;
}

uint64_t initializeWithTake for WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  long long v6 = *(_OWORD *)(a2 + 56);
  uint64_t v7 = *(void *)(a2 + 72);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(void *)(a1 + 72) = v7;
  uint64_t v8 = a3[12];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (const void *)(a2 + v8);
  *(_OWORD *)(a1 + 56) = v6;
  uint64_t v11 = type metadata accessor for SpeakableString();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 32))(v9, v10, v11);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  uint64_t v14 = a3[14];
  *(unsigned char *)(a1 + a3[13]) = *(unsigned char *)(a2 + a3[13]);
  *(unsigned char *)(a1 + v14) = *(unsigned char *)(a2 + v14);
  uint64_t v15 = a3[16];
  *(unsigned char *)(a1 + a3[15]) = *(unsigned char *)(a2 + a3[15]);
  *(unsigned char *)(a1 + v15) = *(unsigned char *)(a2 + v15);
  uint64_t v16 = a3[18];
  *(unsigned char *)(a1 + a3[17]) = *(unsigned char *)(a2 + a3[17]);
  *(unsigned char *)(a1 + v16) = *(unsigned char *)(a2 + v16);
  uint64_t v17 = a3[20];
  *(unsigned char *)(a1 + a3[19]) = *(unsigned char *)(a2 + a3[19]);
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  *(void *)uint64_t v18 = *(void *)v19;
  *(unsigned char *)(v18 + 8) = *(unsigned char *)(v19 + 8);
  uint64_t v20 = a3[21];
  uint64_t v21 = a3[22];
  uint64_t v22 = a1 + v20;
  uint64_t v23 = a2 + v20;
  *(void *)uint64_t v22 = *(void *)v23;
  *(unsigned char *)(v22 + 8) = *(unsigned char *)(v23 + 8);
  *(void *)(a1 + v21) = *(void *)(a2 + v21);
  uint64_t v24 = a3[24];
  *(void *)(a1 + a3[23]) = *(void *)(a2 + a3[23]);
  uint64_t v25 = a1 + v24;
  uint64_t v26 = a2 + v24;
  *(void *)uint64_t v25 = *(void *)v26;
  *(unsigned char *)(v25 + 8) = *(unsigned char *)(v26 + 8);
  uint64_t v27 = a3[25];
  uint64_t v28 = a1 + v27;
  uint64_t v29 = a2 + v27;
  *(void *)uint64_t v28 = *(void *)v29;
  *(unsigned char *)(v28 + 8) = *(unsigned char *)(v29 + 8);
  return a1;
}

uint64_t assignWithTake for WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_release();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_release();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  uint64_t v6 = a3[12];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (void *)(a2 + v6);
  uint64_t v9 = type metadata accessor for SpeakableString();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 40))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 32))(v7, v8, v9);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  uint64_t v15 = a3[14];
  *(unsigned char *)(a1 + a3[13]) = *(unsigned char *)(a2 + a3[13]);
  *(unsigned char *)(a1 + v15) = *(unsigned char *)(a2 + v15);
  uint64_t v16 = a3[16];
  *(unsigned char *)(a1 + a3[15]) = *(unsigned char *)(a2 + a3[15]);
  *(unsigned char *)(a1 + v16) = *(unsigned char *)(a2 + v16);
  uint64_t v17 = a3[18];
  *(unsigned char *)(a1 + a3[17]) = *(unsigned char *)(a2 + a3[17]);
  *(unsigned char *)(a1 + v17) = *(unsigned char *)(a2 + v17);
  uint64_t v18 = a3[20];
  *(unsigned char *)(a1 + a3[19]) = *(unsigned char *)(a2 + a3[19]);
  uint64_t v19 = a1 + v18;
  uint64_t v20 = a2 + v18;
  *(void *)uint64_t v19 = *(void *)v20;
  *(unsigned char *)(v19 + 8) = *(unsigned char *)(v20 + 8);
  uint64_t v21 = a3[21];
  uint64_t v22 = a3[22];
  uint64_t v23 = a1 + v21;
  uint64_t v24 = a2 + v21;
  *(void *)uint64_t v23 = *(void *)v24;
  *(unsigned char *)(v23 + 8) = *(unsigned char *)(v24 + 8);
  *(void *)(a1 + v22) = *(void *)(a2 + v22);
  swift_release();
  *(void *)(a1 + a3[23]) = *(void *)(a2 + a3[23]);
  swift_release();
  uint64_t v25 = a3[24];
  uint64_t v26 = a3[25];
  uint64_t v27 = a1 + v25;
  uint64_t v28 = a2 + v25;
  *(void *)uint64_t v27 = *(void *)v28;
  *(unsigned char *)(v27 + 8) = *(unsigned char *)(v28 + 8);
  uint64_t v29 = a1 + v26;
  uint64_t v30 = a2 + v26;
  *(void *)uint64_t v29 = *(void *)v30;
  *(unsigned char *)(v29 + 8) = *(unsigned char *)(v30 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_113Tm_0);
}

uint64_t storeEnumTagSinglePayload for WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_114Tm_0);
}

void type metadata completion function for WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters()
{
  type metadata accessor for SpeakableString?();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t getEnumTagSinglePayload for WorkoutVoiceFeedbackIntervalUpcomingSpeedParameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_113Tm_1);
}

uint64_t storeEnumTagSinglePayload for WorkoutVoiceFeedbackIntervalUpcomingSpeedParameters(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_114Tm_1);
}

uint64_t initializeBufferWithCopyOfBuffer for WorkoutVoiceFeedbackIntervalUpcomingSpeedParameters(uint64_t a1, uint64_t *a2, int *a3)
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
    *(unsigned char *)a1 = *(unsigned char *)a2;
    *(void *)(a1 + 8) = a2[1];
    *(_WORD *)(a1 + 16) = *((_WORD *)a2 + 8);
    *(void *)(a1 + 24) = a2[3];
    *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
    *(void *)(a1 + 40) = a2[5];
    *(unsigned char *)(a1 + 48) = *((unsigned char *)a2 + 48);
    uint64_t v7 = a2[7];
    uint64_t v8 = a2[9];
    *(void *)(a1 + 64) = a2[8];
    *(void *)(a1 + 72) = v8;
    *(unsigned char *)(a1 + 80) = *((unsigned char *)a2 + 80);
    uint64_t v9 = a3[12];
    __dst = (void *)(a1 + v9);
    uint64_t v10 = (char *)a2 + v9;
    *(void *)(a1 + 56) = v7;
    uint64_t v11 = type metadata accessor for SpeakableString();
    uint64_t v12 = *(void *)(v11 - 8);
    int v13 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48);
    swift_retain();
    swift_retain();
    if (v13(v10, 1, v11))
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
      memcpy(__dst, v10, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v12 + 16))(__dst, v10, v11);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(__dst, 0, 1, v11);
    }
    uint64_t v16 = a3[14];
    *(unsigned char *)(v4 + a3[13]) = *((unsigned char *)a2 + a3[13]);
    *(unsigned char *)(v4 + v16) = *((unsigned char *)a2 + v16);
    uint64_t v17 = a3[16];
    *(unsigned char *)(v4 + a3[15]) = *((unsigned char *)a2 + a3[15]);
    *(unsigned char *)(v4 + v17) = *((unsigned char *)a2 + v17);
    uint64_t v18 = a3[18];
    *(void *)(v4 + a3[17]) = *(uint64_t *)((char *)a2 + a3[17]);
    *(void *)(v4 + v18) = *(uint64_t *)((char *)a2 + v18);
    uint64_t v19 = a3[20];
    *(void *)(v4 + a3[19]) = *(uint64_t *)((char *)a2 + a3[19]);
    *(void *)(v4 + v19) = *(uint64_t *)((char *)a2 + v19);
    uint64_t v20 = a3[21];
    uint64_t v21 = a3[22];
    uint64_t v22 = v4 + v20;
    uint64_t v23 = (uint64_t)a2 + v20;
    *(void *)uint64_t v22 = *(void *)v23;
    *(unsigned char *)(v22 + 8) = *(unsigned char *)(v23 + 8);
    uint64_t v24 = v4 + v21;
    uint64_t v25 = (uint64_t)a2 + v21;
    *(void *)uint64_t v24 = *(void *)v25;
    *(unsigned char *)(v24 + 8) = *(unsigned char *)(v25 + 8);
    swift_retain();
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t destroy for WorkoutVoiceFeedbackIntervalUpcomingSpeedParameters(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 48);
  uint64_t v5 = type metadata accessor for SpeakableString();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for WorkoutVoiceFeedbackIntervalUpcomingSpeedParameters(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v6 = *(void *)(a2 + 56);
  uint64_t v7 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v7;
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  uint64_t v8 = a3[12];
  __dst = (void *)(a1 + v8);
  uint64_t v9 = (const void *)(a2 + v8);
  *(void *)(a1 + 56) = v6;
  uint64_t v10 = type metadata accessor for SpeakableString();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48);
  swift_retain();
  swift_retain();
  if (v12(v9, 1, v10))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    memcpy(__dst, v9, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(__dst, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(__dst, 0, 1, v10);
  }
  uint64_t v14 = a3[14];
  *(unsigned char *)(a1 + a3[13]) = *(unsigned char *)(a2 + a3[13]);
  *(unsigned char *)(a1 + v14) = *(unsigned char *)(a2 + v14);
  uint64_t v15 = a3[16];
  *(unsigned char *)(a1 + a3[15]) = *(unsigned char *)(a2 + a3[15]);
  *(unsigned char *)(a1 + v15) = *(unsigned char *)(a2 + v15);
  uint64_t v16 = a3[18];
  *(void *)(a1 + a3[17]) = *(void *)(a2 + a3[17]);
  *(void *)(a1 + v16) = *(void *)(a2 + v16);
  uint64_t v17 = a3[20];
  *(void *)(a1 + a3[19]) = *(void *)(a2 + a3[19]);
  *(void *)(a1 + v17) = *(void *)(a2 + v17);
  uint64_t v18 = a3[21];
  uint64_t v19 = a3[22];
  uint64_t v20 = a1 + v18;
  uint64_t v21 = a2 + v18;
  *(void *)uint64_t v20 = *(void *)v21;
  *(unsigned char *)(v20 + 8) = *(unsigned char *)(v21 + 8);
  uint64_t v22 = a1 + v19;
  uint64_t v23 = a2 + v19;
  *(void *)uint64_t v22 = *(void *)v23;
  *(unsigned char *)(v22 + 8) = *(unsigned char *)(v23 + 8);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for WorkoutVoiceFeedbackIntervalUpcomingSpeedParameters(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  uint64_t v7 = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 24) = v7;
  uint64_t v8 = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_release();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_retain();
  swift_release();
  uint64_t v9 = *(void *)(a2 + 72);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(void *)(a1 + 72) = v9;
  uint64_t v10 = a3[12];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  uint64_t v13 = type metadata accessor for SpeakableString();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v14 + 48);
  int v16 = v15(v11, 1, v13);
  int v17 = v15(v12, 1, v13);
  if (!v16)
  {
    if (!v17)
    {
      (*(void (**)(void *, void *, uint64_t))(v14 + 24))(v11, v12, v13);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v14 + 8))(v11, v13);
    goto LABEL_6;
  }
  if (v17)
  {
LABEL_6:
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    memcpy(v11, v12, *(void *)(*(void *)(v18 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v14 + 16))(v11, v12, v13);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
LABEL_7:
  *(unsigned char *)(a1 + a3[13]) = *(unsigned char *)(a2 + a3[13]);
  *(unsigned char *)(a1 + a3[14]) = *(unsigned char *)(a2 + a3[14]);
  *(unsigned char *)(a1 + a3[15]) = *(unsigned char *)(a2 + a3[15]);
  *(unsigned char *)(a1 + a3[16]) = *(unsigned char *)(a2 + a3[16]);
  *(void *)(a1 + a3[17]) = *(void *)(a2 + a3[17]);
  swift_retain();
  swift_release();
  *(void *)(a1 + a3[18]) = *(void *)(a2 + a3[18]);
  swift_retain();
  swift_release();
  *(void *)(a1 + a3[19]) = *(void *)(a2 + a3[19]);
  swift_retain();
  swift_release();
  *(void *)(a1 + a3[20]) = *(void *)(a2 + a3[20]);
  swift_retain();
  swift_release();
  uint64_t v19 = a3[21];
  uint64_t v20 = a1 + v19;
  uint64_t v21 = (uint64_t *)(a2 + v19);
  uint64_t v22 = *v21;
  *(unsigned char *)(v20 + 8) = *((unsigned char *)v21 + 8);
  *(void *)uint64_t v20 = v22;
  uint64_t v23 = a3[22];
  uint64_t v24 = a1 + v23;
  uint64_t v25 = (uint64_t *)(a2 + v23);
  uint64_t v26 = *v25;
  *(unsigned char *)(v24 + 8) = *((unsigned char *)v25 + 8);
  *(void *)uint64_t v24 = v26;
  return a1;
}

uint64_t initializeWithTake for WorkoutVoiceFeedbackIntervalUpcomingSpeedParameters(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  long long v6 = *(_OWORD *)(a2 + 56);
  uint64_t v7 = *(void *)(a2 + 72);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(void *)(a1 + 72) = v7;
  uint64_t v8 = a3[12];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (const void *)(a2 + v8);
  *(_OWORD *)(a1 + 56) = v6;
  uint64_t v11 = type metadata accessor for SpeakableString();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 32))(v9, v10, v11);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  uint64_t v14 = a3[14];
  *(unsigned char *)(a1 + a3[13]) = *(unsigned char *)(a2 + a3[13]);
  *(unsigned char *)(a1 + v14) = *(unsigned char *)(a2 + v14);
  uint64_t v15 = a3[16];
  *(unsigned char *)(a1 + a3[15]) = *(unsigned char *)(a2 + a3[15]);
  *(unsigned char *)(a1 + v15) = *(unsigned char *)(a2 + v15);
  uint64_t v16 = a3[18];
  *(void *)(a1 + a3[17]) = *(void *)(a2 + a3[17]);
  *(void *)(a1 + v16) = *(void *)(a2 + v16);
  uint64_t v17 = a3[20];
  *(void *)(a1 + a3[19]) = *(void *)(a2 + a3[19]);
  *(void *)(a1 + v17) = *(void *)(a2 + v17);
  uint64_t v18 = a3[21];
  uint64_t v19 = a3[22];
  uint64_t v20 = a1 + v18;
  uint64_t v21 = a2 + v18;
  *(void *)uint64_t v20 = *(void *)v21;
  *(unsigned char *)(v20 + 8) = *(unsigned char *)(v21 + 8);
  uint64_t v22 = a1 + v19;
  uint64_t v23 = a2 + v19;
  *(void *)uint64_t v22 = *(void *)v23;
  *(unsigned char *)(v22 + 8) = *(unsigned char *)(v23 + 8);
  return a1;
}

uint64_t assignWithTake for WorkoutVoiceFeedbackIntervalUpcomingSpeedParameters(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_release();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_release();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  uint64_t v6 = a3[12];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (void *)(a2 + v6);
  uint64_t v9 = type metadata accessor for SpeakableString();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 40))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 32))(v7, v8, v9);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  uint64_t v15 = a3[14];
  *(unsigned char *)(a1 + a3[13]) = *(unsigned char *)(a2 + a3[13]);
  *(unsigned char *)(a1 + v15) = *(unsigned char *)(a2 + v15);
  uint64_t v16 = a3[16];
  *(unsigned char *)(a1 + a3[15]) = *(unsigned char *)(a2 + a3[15]);
  *(unsigned char *)(a1 + v16) = *(unsigned char *)(a2 + v16);
  *(void *)(a1 + a3[17]) = *(void *)(a2 + a3[17]);
  swift_release();
  *(void *)(a1 + a3[18]) = *(void *)(a2 + a3[18]);
  swift_release();
  *(void *)(a1 + a3[19]) = *(void *)(a2 + a3[19]);
  swift_release();
  *(void *)(a1 + a3[20]) = *(void *)(a2 + a3[20]);
  swift_release();
  uint64_t v17 = a3[21];
  uint64_t v18 = a3[22];
  uint64_t v19 = a1 + v17;
  uint64_t v20 = a2 + v17;
  *(void *)uint64_t v19 = *(void *)v20;
  *(unsigned char *)(v19 + 8) = *(unsigned char *)(v20 + 8);
  uint64_t v21 = a1 + v18;
  uint64_t v22 = a2 + v18;
  *(void *)uint64_t v21 = *(void *)v22;
  *(unsigned char *)(v21 + 8) = *(unsigned char *)(v22 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for WorkoutVoiceFeedbackIntervalUpcomingPaceParameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2619C9714);
}

uint64_t __swift_get_extra_inhabitant_index_113Tm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 56);
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
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    uint64_t v11 = v9;
    uint64_t v12 = a1 + *(int *)(a3 + 48);
    return v10(v12, a2, v11);
  }
}

uint64_t storeEnumTagSinglePayload for WorkoutVoiceFeedbackIntervalUpcomingPaceParameters(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2619C97EC);
}

uint64_t __swift_store_extra_inhabitant_index_114Tm(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 56) = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 48);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void type metadata completion function for WorkoutVoiceFeedbackIntervalUpcomingSpeedParameters()
{
  type metadata accessor for SpeakableString?();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void *initializeBufferWithCopyOfBuffer for WorkoutVoiceFeedbackLapCompletionPaceParameters(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *int v3 = *a2;
    int v3 = (void *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    *(void *)(a1 + 8) = a2[1];
    *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
    *(void *)(a1 + 24) = a2[3];
    uint64_t v5 = *(int *)(a3 + 28);
    uint64_t v6 = (void *)(a1 + v5);
    uint64_t v7 = (char *)a2 + v5;
    uint64_t v8 = type metadata accessor for SpeakableString();
    uint64_t v9 = *(void *)(v8 - 8);
    uint64_t v10 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v9 + 48);
    swift_retain();
    if (v10(v7, 1, v8))
    {
      uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
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

uint64_t destroy for WorkoutVoiceFeedbackLapCompletionPaceParameters(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = type metadata accessor for SpeakableString();
  uint64_t v8 = *(void *)(v5 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v4, 1, v5);
  if (!result)
  {
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8);
    return v7(v4, v5);
  }
  return result;
}

uint64_t initializeWithCopy for WorkoutVoiceFeedbackLapCompletionPaceParameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v4 = *(int *)(a3 + 28);
  uint64_t v5 = (void *)(a1 + v4);
  uint64_t v6 = (const void *)(a2 + v4);
  uint64_t v7 = type metadata accessor for SpeakableString();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v8 + 48);
  swift_retain();
  if (v9(v6, 1, v7))
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    memcpy(v5, v6, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v8 + 16))(v5, v6, v7);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

uint64_t assignWithCopy for WorkoutVoiceFeedbackLapCompletionPaceParameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 8) = v6;
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = type metadata accessor for SpeakableString();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t initializeWithTake for WorkoutVoiceFeedbackLapCompletionPaceParameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v4 = *(int *)(a3 + 28);
  uint64_t v5 = (void *)(a1 + v4);
  uint64_t v6 = (const void *)(a2 + v4);
  uint64_t v7 = type metadata accessor for SpeakableString();
  uint64_t v8 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    memcpy(v5, v6, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v8 + 32))(v5, v6, v7);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

uint64_t assignWithTake for WorkoutVoiceFeedbackLapCompletionPaceParameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (void *)(a2 + v6);
  uint64_t v9 = type metadata accessor for SpeakableString();
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
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 32))(v7, v8, v9);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for WorkoutVoiceFeedbackZoneEnteredPaceParameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2619CA18C);
}

uint64_t __swift_get_extra_inhabitant_index_104Tm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 24);
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
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    uint64_t v11 = v9;
    uint64_t v12 = a1 + *(int *)(a3 + 28);
    return v10(v12, a2, v11);
  }
}

uint64_t storeEnumTagSinglePayload for WorkoutVoiceFeedbackZoneEnteredPaceParameters(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2619CA264);
}

uint64_t __swift_store_extra_inhabitant_index_105Tm(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 24) = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void type metadata completion function for WorkoutVoiceFeedbackLapCompletionPaceParameters()
{
  type metadata accessor for SpeakableString?();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t type metadata accessor for WorkoutRemindersCATPatternsExecutor()
{
  uint64_t result = type metadata singleton initialization cache for WorkoutRemindersCATPatternsExecutor;
  if (!type metadata singleton initialization cache for WorkoutRemindersCATPatternsExecutor) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t type metadata completion function for WorkoutRemindersCATPatternsExecutor()
{
  return swift_initClassMetadata2();
}

uint64_t WorkoutRemindersResumeParameters.asKeyValuePairs()()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_2619DAE20;
  *(void *)(v1 + 32) = 0x646E497473727562;
  *(void *)(v1 + 40) = 0xEA00000000007865;
  outlined init with take of BelowTargetZoneModel?(v0, (uint64_t)v18, &demangling cache variable for type metadata for Double?);
  outlined init with take of BelowTargetZoneModel?((uint64_t)v18, (uint64_t)&v19, &demangling cache variable for type metadata for Double?);
  if (v20)
  {
    uint64_t v2 = 0;
    *(void *)(v1 + 56) = 0;
    *(void *)(v1 + 64) = 0;
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8D538];
    uint64_t v3 = v19;
  }
  *(void *)(v1 + 48) = v3;
  *(void *)(v1 + 72) = v2;
  *(void *)(v1 + 80) = 0xD000000000000017;
  *(void *)(v1 + 88) = 0x80000002619DC0D0;
  uint64_t v4 = MEMORY[0x263F8D4F8];
  *(unsigned char *)(v1 + 96) = *(unsigned char *)(v0 + 9);
  *(void *)(v1 + 120) = v4;
  *(void *)(v1 + 128) = 0x74756F6B726F77;
  *(void *)(v1 + 136) = 0xE700000000000000;
  outlined init with take of BelowTargetZoneModel?(v0 + 16, (uint64_t)v17, &demangling cache variable for type metadata for Double?);
  outlined init with take of BelowTargetZoneModel?((uint64_t)v17, (uint64_t)&v21, &demangling cache variable for type metadata for Double?);
  if (v22)
  {
    uint64_t v5 = 0;
    *(void *)(v1 + 152) = 0;
    *(void *)(v1 + 160) = 0;
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v5 = MEMORY[0x263F8D538];
    uint64_t v6 = v21;
  }
  *(void *)(v1 + 144) = v6;
  *(void *)(v1 + 168) = v5;
  *(void *)(v1 + 176) = 0x4C74756F6B726F77;
  *(void *)(v1 + 184) = 0xEF6E6F697461636FLL;
  outlined init with take of BelowTargetZoneModel?(v0 + 32, (uint64_t)v16, &demangling cache variable for type metadata for Double?);
  outlined init with take of BelowTargetZoneModel?((uint64_t)v16, (uint64_t)&v23, &demangling cache variable for type metadata for Double?);
  if (v24)
  {
    uint64_t v7 = 0;
    *(void *)(v1 + 200) = 0;
    *(void *)(v1 + 208) = 0;
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v7 = MEMORY[0x263F8D538];
    uint64_t v8 = v23;
  }
  *(void *)(v1 + 192) = v8;
  *(void *)(v1 + 216) = v7;
  *(void *)(v1 + 224) = 0xD000000000000017;
  *(void *)(v1 + 232) = 0x80000002619DCA20;
  outlined init with take of BelowTargetZoneModel?(v0 + 48, (uint64_t)v15, &demangling cache variable for type metadata for Double?);
  outlined init with take of BelowTargetZoneModel?((uint64_t)v15, (uint64_t)&v25, &demangling cache variable for type metadata for Double?);
  if (v26)
  {
    uint64_t v9 = 0;
    *(void *)(v1 + 248) = 0;
    *(void *)(v1 + 256) = 0;
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v9 = MEMORY[0x263F8D538];
    uint64_t v10 = v25;
  }
  *(void *)(v1 + 240) = v10;
  uint64_t v11 = (_OWORD *)(v1 + 288);
  *(void *)(v1 + 264) = v9;
  *(void *)(v1 + 272) = 0xD000000000000017;
  *(void *)(v1 + 280) = 0x80000002619DCA40;
  outlined init with take of BelowTargetZoneModel?(v0 + 64, (uint64_t)v14, &demangling cache variable for type metadata for String?);
  outlined init with take of BelowTargetZoneModel?((uint64_t)v14, (uint64_t)&v27, &demangling cache variable for type metadata for String?);
  uint64_t v12 = *((void *)&v27 + 1);
  if (*((void *)&v27 + 1))
  {
    *uint64_t v11 = v27;
    uint64_t v12 = MEMORY[0x263F8D310];
  }
  else
  {
    *(void *)uint64_t v11 = 0;
    *(void *)(v1 + 296) = 0;
    *(void *)(v1 + 304) = 0;
  }
  *(void *)(v1 + 312) = v12;
  outlined retain of WorkoutRemindersResumeParameters(v0);
  return v1;
}

uint64_t WorkoutRemindersCATPatternsExecutor.__allocating_init(templateDir:options:globals:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CATOption();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  outlined init with copy of URL?(a1, (uint64_t)v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  uint64_t v11 = CATWrapper.init(templateDir:options:globals:)();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  outlined destroy of URL?(a1);
  return v11;
}

uint64_t ObjC metadata update function for WorkoutRemindersCATPatternsExecutor()
{
  return type metadata accessor for WorkoutRemindersCATPatternsExecutor();
}

uint64_t specialized WorkoutRemindersCATPatternsExecutor.start(executeSashGroupOnWatch:_:)(char a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a2;
  *(void *)(v3 + 24) = a3;
  *(unsigned char *)(v3 + 56) = a1;
  return MEMORY[0x270FA2498](specialized WorkoutRemindersCATPatternsExecutor.start(executeSashGroupOnWatch:_:), 0, 0);
}

uint64_t specialized WorkoutRemindersCATPatternsExecutor.start(executeSashGroupOnWatch:_:)()
{
  uint64_t v1 = *(void *)(v0 + 24);
  char v2 = *(unsigned char *)(v0 + 56);
  id v3 = objc_msgSend(*(id *)(v1 + 16), sel_workoutType);
  uint64_t v4 = *(void *)(v1 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  uint64_t v5 = swift_allocObject();
  *(void *)(v0 + 32) = v5;
  *(_OWORD *)(v5 + 16) = xmmword_2619DAAA0;
  *(void *)(v5 + 32) = 0x646E497473727562;
  *(void *)(v5 + 40) = 0xEA00000000007865;
  uint64_t v6 = MEMORY[0x263F8D538];
  *(double *)(v5 + 48) = (double)v4;
  *(void *)(v5 + 72) = v6;
  *(void *)(v5 + 80) = 0xD000000000000017;
  *(void *)(v5 + 88) = 0x80000002619DC0D0;
  uint64_t v7 = MEMORY[0x263F8D4F8];
  *(unsigned char *)(v5 + 96) = v2;
  *(void *)(v5 + 120) = v7;
  *(void *)(v5 + 128) = 0x5474756F6B726F77;
  *(void *)(v5 + 136) = 0xEB00000000657079;
  *(void *)(v5 + 168) = v6;
  *(double *)(v5 + 144) = (double)(uint64_t)v3;
  uint64_t v10 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x263F6D050]
                                                                            + MEMORY[0x263F6D050]);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v8;
  *uint64_t v8 = v0;
  v8[1] = specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneExitedBelowNonPace(executeSashGroupOnWatch:isSingleThreshold:_:);
  return v10(0xD000000000000016, 0x80000002619DC9C0, v5);
}

uint64_t specialized WorkoutRemindersCATPatternsExecutor.end(executeSashGroupOnWatch:_:)(char a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a2;
  *(void *)(v3 + 24) = a3;
  *(unsigned char *)(v3 + 56) = a1;
  return MEMORY[0x270FA2498](specialized WorkoutRemindersCATPatternsExecutor.end(executeSashGroupOnWatch:_:), 0, 0);
}

uint64_t specialized WorkoutRemindersCATPatternsExecutor.end(executeSashGroupOnWatch:_:)()
{
  uint64_t v1 = *(void *)(v0 + 24);
  char v2 = *(unsigned char *)(v0 + 56);
  id v3 = objc_msgSend(*(id *)(v1 + 16), sel_workoutType);
  uint64_t v4 = *(void *)(v1 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any?)>);
  uint64_t v5 = swift_allocObject();
  *(void *)(v0 + 32) = v5;
  *(_OWORD *)(v5 + 16) = xmmword_2619DAAA0;
  *(void *)(v5 + 32) = 0x646E497473727562;
  *(void *)(v5 + 40) = 0xEA00000000007865;
  uint64_t v6 = MEMORY[0x263F8D538];
  *(double *)(v5 + 48) = (double)v4;
  *(void *)(v5 + 72) = v6;
  *(void *)(v5 + 80) = 0xD000000000000017;
  *(void *)(v5 + 88) = 0x80000002619DC0D0;
  uint64_t v7 = MEMORY[0x263F8D4F8];
  *(unsigned char *)(v5 + 96) = v2;
  *(void *)(v5 + 120) = v7;
  *(void *)(v5 + 128) = 0x5474756F6B726F77;
  *(void *)(v5 + 136) = 0xEB00000000657079;
  *(void *)(v5 + 168) = v6;
  *(double *)(v5 + 144) = (double)(uint64_t)v3;
  uint64_t v10 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x263F6D050]
                                                                            + MEMORY[0x263F6D050]);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v8;
  *uint64_t v8 = v0;
  v8[1] = specialized WorkoutVoiceFeedbackCATPatternsExecutor.segmentMarked(executeSashGroupOnWatch:_:);
  return v10(0xD000000000000014, 0x80000002619DC9E0, v5);
}

uint64_t specialized WorkoutRemindersCATPatternsExecutor.resume(executeSashGroupOnWatch:_:)(char a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 96) = a2;
  *(void *)(v3 + 104) = a3;
  *(unsigned char *)(v3 + 144) = a1;
  return MEMORY[0x270FA2498](specialized WorkoutRemindersCATPatternsExecutor.resume(executeSashGroupOnWatch:_:), 0, 0);
}

uint64_t specialized WorkoutRemindersCATPatternsExecutor.resume(executeSashGroupOnWatch:_:)()
{
  char v1 = *(unsigned char *)(v0 + 144);
  char v2 = *(void **)(*(void *)(v0 + 104) + 16);
  double v3 = (double)(unint64_t)objc_msgSend(v2, sel_workoutActivityType);
  double v4 = (double)(uint64_t)objc_msgSend(v2, sel_workoutLocationType);
  double v5 = (double)(uint64_t)objc_msgSend(v2, sel_workoutSwimmingLocationType);
  uint64_t v6 = AFSiriWorkoutReminder.workoutAnnouncementDialogIdentifier.getter();
  *(void *)(v0 + 16) = 0;
  *(unsigned char *)(v0 + 24) = 1;
  *(unsigned char *)(v0 + 25) = v1;
  *(double *)(v0 + 32) = v3;
  *(unsigned char *)(v0 + 40) = 0;
  *(double *)(v0 + 48) = v4;
  *(unsigned char *)(v0 + 56) = 0;
  *(double *)(v0 + 64) = v5;
  *(unsigned char *)(v0 + 72) = 0;
  *(void *)(v0 + 80) = v6;
  *(void *)(v0 + 88) = v7;
  uint64_t v8 = WorkoutRemindersResumeParameters.asKeyValuePairs()();
  *(void *)(v0 + 112) = v8;
  swift_bridgeObjectRelease();
  uint64_t v11 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x263F6D050]
                                                                            + MEMORY[0x263F6D050]);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v0 + 120) = v9;
  *uint64_t v9 = v0;
  v9[1] = specialized WorkoutRemindersCATPatternsExecutor.resume(executeSashGroupOnWatch:_:);
  return v11(0xD000000000000017, 0x80000002619DCA00, v8);
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 136));
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_bridgeObjectRelease();
  char v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t specialized WorkoutRemindersCATPatternsExecutor.resume(executeSashGroupOnWatch:_:)(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 128) = v1;
  swift_task_dealloc();
  if (v1)
  {
    double v5 = specialized WorkoutRemindersCATPatternsExecutor.resume(executeSashGroupOnWatch:_:);
  }
  else
  {
    swift_bridgeObjectRelease();
    *(void *)(v4 + 136) = a1;
    double v5 = specialized WorkoutRemindersCATPatternsExecutor.resume(executeSashGroupOnWatch:_:);
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t outlined retain of WorkoutRemindersResumeParameters(uint64_t a1)
{
  return a1;
}

unsigned char *storeEnumTagSinglePayload for VoiceFeedbackErrors(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x2619CB054);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for VoiceFeedbackErrors()
{
  return &type metadata for VoiceFeedbackErrors;
}

uint64_t protocol witness for Error._domain.getter in conformance VoiceFeedbackErrors()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t protocol witness for Error._code.getter in conformance VoiceFeedbackErrors()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t protocol witness for Error._userInfo.getter in conformance VoiceFeedbackErrors()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t protocol witness for Error._getEmbeddedNSError() in conformance VoiceFeedbackErrors()
{
  return MEMORY[0x270F9FB30]();
}

unsigned char *storeEnumTagSinglePayload for WorkoutReminderErrors(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x2619CB190);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for WorkoutReminderErrors()
{
  return &type metadata for WorkoutReminderErrors;
}

BOOL specialized Sequence<>.contains(_:)(BOOL result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  int v3 = result;
  if (*(unsigned char *)(a2 + 32) == result) {
    return 1;
  }
  if (v2 == 1) {
    return 0;
  }
  for (uint64_t i = 33; ; ++i)
  {
    uint64_t v5 = i - 31;
    if (__OFADD__(i - 32, 1)) {
      break;
    }
    int v6 = *(unsigned __int8 *)(a2 + i);
    uint64_t result = v6 == v3;
    if (v6 == v3 || v5 == v2) {
      return result;
    }
  }
  __break(1u);
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

uint64_t specialized Sequence<>.contains(_:)(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  if (*(void *)(a2 + 32) == result) {
    return 1;
  }
  if (v2 == 1) {
    return 0;
  }
  for (uint64_t i = 5; ; ++i)
  {
    uint64_t v4 = i - 3;
    if (__OFADD__(i - 4, 1)) {
      break;
    }
    BOOL v6 = *(void *)(a2 + 8 * i) == result;
    BOOL v5 = v6;
    BOOL v6 = v6 || v4 == v2;
    if (v6) {
      return v5;
    }
  }
  __break(1u);
  return result;
}

uint64_t AFSiriWorkoutReminder.workoutAnnouncementDialogIdentifier.getter()
{
  if (objc_msgSend(v0, sel_workoutActivityType) != (id)46)
  {
    if (objc_msgSend(v0, sel_workoutLocationType) != (id)1
      && (specialized Sequence<>.contains(_:)((uint64_t)objc_msgSend(v0, sel_workoutActivityType), (uint64_t)&outlined read-only object #0 of AFSiriWorkoutReminder.workoutAnnouncementDialogIdentifier.getter) & 1) != 0)
    {
      id v7 = objc_msgSend(v0, sel_workoutLocationType);
      unint64_t v2 = 0xE700000000000000;
      unint64_t v3 = 0xE700000000000000;
      uint64_t v4 = 0x726F6F6474756FLL;
      uint64_t v5 = 0x726F6F646E69;
      if (v7 == (id)2) {
        unint64_t v2 = 0xE600000000000000;
      }
      else {
        uint64_t v5 = 0x6E776F6E6B6E75;
      }
      BOOL v6 = v7 == (id)3;
      goto LABEL_13;
    }
    return HKWorkoutActivityType.dialogIdentifier.getter((uint64_t)objc_msgSend(v0, sel_workoutActivityType));
  }
  if (!objc_msgSend(v0, sel_workoutSwimmingLocationType)) {
    return HKWorkoutActivityType.dialogIdentifier.getter((uint64_t)objc_msgSend(v0, sel_workoutActivityType));
  }
  id v1 = objc_msgSend(v0, sel_workoutSwimmingLocationType);
  unint64_t v2 = 0xE700000000000000;
  unint64_t v3 = 0xEA00000000007265;
  uint64_t v4 = 0x7461775F6E65706FLL;
  uint64_t v5 = 1819242352;
  if (v1 == (id)1) {
    unint64_t v2 = 0xE400000000000000;
  }
  else {
    uint64_t v5 = 0x6E776F6E6B6E75;
  }
  BOOL v6 = v1 == (id)2;
LABEL_13:
  if (v6) {
    uint64_t v8 = v4;
  }
  else {
    uint64_t v8 = v5;
  }
  if (v6) {
    unint64_t v9 = v3;
  }
  else {
    unint64_t v9 = v2;
  }
  unint64_t v10 = v9;
  String.append(_:)(*(Swift::String *)&v8);
  swift_bridgeObjectRelease();
  v11._uint64_t countAndFlagsBits = 95;
  v11._object = (void *)0xE100000000000000;
  String.append(_:)(v11);
  v12._uint64_t countAndFlagsBits = HKWorkoutActivityType.dialogIdentifier.getter((uint64_t)objc_msgSend(v0, sel_workoutActivityType));
  String.append(_:)(v12);
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t HKWorkoutActivityType.dialogIdentifier.getter(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  uint64_t result = 0xD000000000000011;
  switch(v1)
  {
    case 0:
    case 16:
    case 83:
      return result;
    case 1:
      return 0x79726568637261;
    case 2:
      return 0xD000000000000013;
    case 3:
      return 0x6F746E696D646162;
    case 4:
      unsigned int v3 = 1702060386;
      return v3 | 0x6C6C616200000000;
    case 5:
      uint64_t v4 = 0x74656B736162;
      goto LABEL_86;
    case 6:
      unsigned int v5 = 1819766626;
      return v5 | 0x676E6900000000;
    case 7:
      return 0x676E69786F62;
    case 8:
      return 0x676E69626D696C63;
    case 9:
      return 0x74656B63697263;
    case 10:
      return 0x72745F73736F7263;
    case 11:
      unsigned int v5 = 1819440483;
      return v5 | 0x676E6900000000;
    case 12:
      unsigned int v5 = 1818458467;
      return v5 | 0x676E6900000000;
    case 13:
      return 0x65636E6164;
    case 14:
      return 0xD000000000000017;
    case 15:
      return 0x63697470696C6C65;
    case 17:
      unsigned int v5 = 1668179302;
      return v5 | 0x676E6900000000;
    case 18:
      unsigned int v5 = 1752394086;
      return v5 | 0x676E6900000000;
    case 19:
      return 0xD00000000000001CLL;
    case 20:
      return 1718382439;
    case 21:
      return 0x697473616E6D7967;
    case 22:
      unsigned int v3 = 1684955496;
      return v3 | 0x6C6C616200000000;
    case 23:
      return 0x676E696B6968;
    case 24:
      return 0x79656B636F68;
    case 25:
      unsigned int v5 = 1953396072;
      return v5 | 0x676E6900000000;
    case 26:
      return 0x6573736F7263616CLL;
    case 27:
      return 0x5F6C61697472616DLL;
    case 28:
      return 0x646E615F646E696DLL;
    case 29:
      return 0xD00000000000001FLL;
    case 30:
      return 0x735F656C64646170;
    case 31:
      return 2036427888;
    case 32:
      return 0xD000000000000018;
    case 33:
      return 0x6274657571636172;
    case 34:
      return 0x676E69776F72;
    case 35:
      return 0x7962677572;
    case 36:
      unsigned int v5 = 1852732786;
      return v5 | 0x676E6900000000;
    case 37:
      unsigned int v5 = 1818845555;
      return v5 | 0x676E6900000000;
    case 38:
      unsigned int v6 = 1952541555;
      return v6 | 0x5F676E6900000000;
    case 39:
      unsigned int v7 = 2003791475;
      return v7 | 0x6F70735F00000000;
    case 40:
      return 0x726563636F73;
    case 41:
      unsigned int v3 = 1952870259;
      return v3 | 0x6C6C616200000000;
    case 42:
      return 0x687361757173;
    case 43:
      return 0x6C635F7269617473;
    case 44:
      unsigned int v6 = 1718777203;
      return v6 | 0x5F676E6900000000;
    case 45:
      return 0x676E696D6D697773;
    case 46:
      return 0x65745F656C626174;
    case 47:
      return 0x73696E6E6574;
    case 48:
      return 0x6E615F6B63617274;
    case 49:
      return 0xD00000000000001DLL;
    case 50:
      uint64_t v4 = 0x79656C6C6F76;
      goto LABEL_86;
    case 51:
      unsigned int v5 = 1802264951;
      return v5 | 0x676E6900000000;
    case 52:
      return 0x69665F7265746177;
    case 53:
      return 0x6F705F7265746177;
    case 54:
      return 0x70735F7265746177;
    case 55:
      return 0x6E696C7473657277;
    case 56:
      return 1634168697;
    case 57:
      return 0x6572726162;
    case 58:
      unsigned int v8 = 1701998435;
      return v8 | 0x6172745F00000000;
    case 59:
      return 0xD000000000000014;
    case 60:
      return 0x6C6C69686E776F64;
    case 61:
      return 0x6C69626978656C66;
    case 62:
      return 0xD000000000000020;
    case 63:
      return 0x706F725F706D756ALL;
    case 64:
      return 0x69786F626B63696BLL;
    case 65:
      return 0x736574616C6970;
    case 66:
      return 0x72616F62776F6E73;
    case 67:
      return 0x737269617473;
    case 68:
      unsigned int v8 = 1885697139;
      return v8 | 0x6172745F00000000;
    case 69:
      return 0xD000000000000014;
    case 70:
      return 0xD000000000000013;
    case 71:
      return 0x6968635F696174;
    case 72:
      return 0x61635F646578696DLL;
    case 73:
      return 0x6379635F646E6168;
    case 74:
      unsigned int v7 = 1668508004;
      return v7 | 0x6F70735F00000000;
    case 75:
      return 0x5F7373656E746966;
    case 76:
      uint64_t v9 = 0x6F6964726163;
      goto LABEL_84;
    case 77:
      uint64_t v9 = 0x6C6169636F73;
LABEL_84:
      uint64_t result = v9 & 0xFFFFFFFFFFFFLL | 0x645F000000000000;
      break;
    case 78:
      uint64_t v4 = 0x656C6B636970;
LABEL_86:
      uint64_t result = v4 & 0xFFFFFFFFFFFFLL | 0x6162000000000000;
      break;
    case 79:
      uint64_t result = 0x6E776F646C6F6F63;
      break;
    case 81:
      uint64_t result = 0x6B69625F6D697773;
      break;
    case 82:
      uint64_t result = 0x697469736E617274;
      break;
    default:
      uint64_t result = 0x6E776F6E6B6E75;
      break;
  }
  return result;
}

uint64_t VoiceFeedbackMetricType.rawValue.getter(uint64_t result)
{
  return result;
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance VoiceFeedbackMetricType@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = specialized VoiceFeedbackMetricType.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

uint64_t protocol witness for Decodable.init(from:) in conformance VoiceFeedbackMetricType()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t protocol witness for Encodable.encode(to:) in conformance VoiceFeedbackMetricType()
{
  return RawRepresentable<>.encode(to:)();
}

void one-time initialization function for noPaceFormatMetrics()
{
  noPaceFormatMetrics._rawValue = &outlined read-only object #0 of one-time initialization function for noPaceFormatMetrics;
}

uint64_t VoiceFeedbackMetricType.init(_:)(uint64_t a1)
{
  if ((unint64_t)(a1 - 4) > 0xC) {
    return 8;
  }
  else {
    return byte_2619DB1FA[a1 - 4];
  }
}

unint64_t specialized VoiceFeedbackMetricType.init(rawValue:)(unint64_t result)
{
  if (result >= 8) {
    return 8;
  }
  return result;
}

unint64_t instantiation function for generic protocol witness table for VoiceFeedbackMetricType(uint64_t a1)
{
  unint64_t result = lazy protocol witness table accessor for type VoiceFeedbackMetricType and conformance VoiceFeedbackMetricType();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for VoiceFeedbackMetricType(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for VoiceFeedbackMetricType(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 7;
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
        JUMPOUT(0x2619CC228);
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
          *unint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for VoiceFeedbackMetricType()
{
  return &type metadata for VoiceFeedbackMetricType;
}

uint64_t BasicVoiceFeedbackAlerts.executePattern(wrapper:)(uint64_t a1, char a2)
{
  *(unsigned char *)(v2 + 128) = a2;
  *(void *)(v2 + 16) = a1;
  return MEMORY[0x270FA2498](BasicVoiceFeedbackAlerts.executePattern(wrapper:), 0, 0);
}

uint64_t BasicVoiceFeedbackAlerts.executePattern(wrapper:)()
{
  switch(*(unsigned char *)(v0 + 128))
  {
    case 0:
      __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 16), *(void *)(*(void *)(v0 + 16) + 24));
      uint64_t v1 = (void *)swift_task_alloc();
      *(void *)(v0 + 24) = v1;
      *uint64_t v1 = v0;
      v1[1] = BasicVoiceFeedbackAlerts.executePattern(wrapper:);
      uint64_t result = WorkoutVoiceFeedbackCATPatternsExecutor.exerciseRingCompleted(executeSashGroupOnWatch:)(0);
      break;
    case 3:
      __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 16), *(void *)(*(void *)(v0 + 16) + 24));
      uint64_t v5 = (void *)swift_task_alloc();
      *(void *)(v0 + 32) = v5;
      *uint64_t v5 = v0;
      v5[1] = protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance TimeSplitModel;
      uint64_t result = WorkoutVoiceFeedbackCATPatternsExecutor.intervalEnded(executeSashGroupOnWatch:)(0);
      break;
    case 7:
      __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 16), *(void *)(*(void *)(v0 + 16) + 24));
      unsigned int v6 = (void *)swift_task_alloc();
      *(void *)(v0 + 40) = v6;
      *unsigned int v6 = v0;
      v6[1] = BasicVoiceFeedbackAlerts.executePattern(wrapper:);
      uint64_t result = WorkoutVoiceFeedbackCATPatternsExecutor.moveRingCompleted(executeSashGroupOnWatch:)(0);
      break;
    case 9:
      __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 16), *(void *)(*(void *)(v0 + 16) + 24));
      BOOL v7 = (void *)swift_task_alloc();
      *(void *)(v0 + 112) = v7;
      *BOOL v7 = v0;
      v7[1] = BasicVoiceFeedbackAlerts.executePattern(wrapper:);
      uint64_t result = WorkoutVoiceFeedbackCATPatternsExecutor.workoutPaused(executeSashGroupOnWatch:)(0);
      break;
    case 0xA:
      __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 16), *(void *)(*(void *)(v0 + 16) + 24));
      int v8 = (void *)swift_task_alloc();
      *(void *)(v0 + 48) = v8;
      *int v8 = v0;
      v8[1] = BasicVoiceFeedbackAlerts.executePattern(wrapper:);
      uint64_t result = WorkoutVoiceFeedbackCATPatternsExecutor.raceAheadOfGhost(executeSashGroupOnWatch:)(0);
      break;
    case 0xB:
      __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 16), *(void *)(*(void *)(v0 + 16) + 24));
      uint64_t v9 = (void *)swift_task_alloc();
      *(void *)(v0 + 56) = v9;
      *uint64_t v9 = v0;
      v9[1] = protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance AboveTargetZoneModel;
      uint64_t result = WorkoutVoiceFeedbackCATPatternsExecutor.raceBehindGhost(executeSashGroupOnWatch:)(0);
      break;
    case 0xC:
      __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 16), *(void *)(*(void *)(v0 + 16) + 24));
      unint64_t v10 = (void *)swift_task_alloc();
      *(void *)(v0 + 64) = v10;
      *unint64_t v10 = v0;
      v10[1] = protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance LapCompletionModel;
      uint64_t result = WorkoutVoiceFeedbackCATPatternsExecutor.raceExpired(executeSashGroupOnWatch:)(0);
      break;
    case 0xD:
      __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 16), *(void *)(*(void *)(v0 + 16) + 24));
      Swift::String v11 = (void *)swift_task_alloc();
      *(void *)(v0 + 72) = v11;
      *Swift::String v11 = v0;
      v11[1] = BasicVoiceFeedbackAlerts.executePattern(wrapper:);
      uint64_t result = WorkoutVoiceFeedbackCATPatternsExecutor.raceOffRoute(executeSashGroupOnWatch:)(0);
      break;
    case 0xE:
      __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 16), *(void *)(*(void *)(v0 + 16) + 24));
      Swift::String v12 = (void *)swift_task_alloc();
      *(void *)(v0 + 80) = v12;
      void *v12 = v0;
      v12[1] = protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance DistanceSplitModel;
      uint64_t result = WorkoutVoiceFeedbackCATPatternsExecutor.raceOnRoute(executeSashGroupOnWatch:)(0);
      break;
    case 0xF:
      __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 16), *(void *)(*(void *)(v0 + 16) + 24));
      uint64_t v13 = (void *)swift_task_alloc();
      *(void *)(v0 + 88) = v13;
      *uint64_t v13 = v0;
      v13[1] = BasicVoiceFeedbackAlerts.executePattern(wrapper:);
      uint64_t result = WorkoutVoiceFeedbackCATPatternsExecutor.raceRouteCompletedRaceLost(executeSashGroupOnWatch:)(0);
      break;
    case 0x10:
      __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 16), *(void *)(*(void *)(v0 + 16) + 24));
      uint64_t v14 = (void *)swift_task_alloc();
      *(void *)(v0 + 96) = v14;
      void *v14 = v0;
      v14[1] = BasicVoiceFeedbackAlerts.executePattern(wrapper:);
      uint64_t result = WorkoutVoiceFeedbackCATPatternsExecutor.raceRouteCompleteRaceWon(executeSashGroupOnWatch:)(0);
      break;
    case 0x11:
      __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 16), *(void *)(*(void *)(v0 + 16) + 24));
      uint64_t v15 = (void *)swift_task_alloc();
      *(void *)(v0 + 120) = v15;
      *uint64_t v15 = v0;
      v15[1] = BasicVoiceFeedbackAlerts.executePattern(wrapper:);
      uint64_t result = WorkoutVoiceFeedbackCATPatternsExecutor.workoutResumed(executeSashGroupOnWatch:)(0);
      break;
    case 0x13:
      __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 16), *(void *)(*(void *)(v0 + 16) + 24));
      uint64_t v16 = (void *)swift_task_alloc();
      *(void *)(v0 + 104) = v16;
      *uint64_t v16 = v0;
      v16[1] = BasicVoiceFeedbackAlerts.executePattern(wrapper:);
      uint64_t result = WorkoutVoiceFeedbackCATPatternsExecutor.trackStatusChanged(executeSashGroupOnWatch:)(0);
      break;
    default:
      lazy protocol witness table accessor for type VoiceFeedbackErrors and conformance VoiceFeedbackErrors();
      swift_allocError();
      *int v3 = 1;
      swift_willThrow();
      unsigned int v4 = *(uint64_t (**)(void))(v0 + 8);
      uint64_t result = v4();
      break;
  }
  return result;
}

uint64_t BasicVoiceFeedbackAlerts.executePattern(wrapper:)(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v7;
  uint64_t v8;

  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v7;
  uint64_t v8;

  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v7;
  uint64_t v8;

  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v7;
  uint64_t v8;

  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v7;
  uint64_t v8;

  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v7;
  uint64_t v8;

  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v7;
  uint64_t v8;

  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v7;
  uint64_t v8;

  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance BasicVoiceFeedbackAlerts(uint64_t a1)
{
  char v4 = *v1;
  uint64_t v5 = swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *(void *)uint64_t v5 = v2;
  *(unsigned char *)(v5 + 128) = v4;
  *(void *)(v5 + 8) = protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance BasicVoiceFeedbackAlerts;
  *(void *)(v5 + 16) = a1;
  return MEMORY[0x270FA2498](BasicVoiceFeedbackAlerts.executePattern(wrapper:), 0, 0);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v7;
  uint64_t v8;

  uint64_t v7 = *v2;
  char v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    char v4 = a1;
  }
  return v5(v4);
}

void __swiftcall VoiceFeedbackWorkoutStep.init(magnitude:unit:stepType:targetZone:)(WorkoutAnnouncements::VoiceFeedbackWorkoutStep *__return_ptr retstr, Swift::Double_optional magnitude, Swift::String_optional unit, WorkoutAnnouncements::VoiceFeedbackStepType stepType, WorkoutAnnouncements::VoiceFeedbackTargetZone_optional *targetZone)
{
  WorkoutAnnouncements::VoiceFeedbackStepType v6 = (char)targetZone;
  uint64_t v7 = (void *)stepType;
  object = unit.value._object;
  char countAndFlagsBits = unit.value._countAndFlagsBits;
  Swift::Double v10 = *(double *)&magnitude.is_nil;
  outlined init with take of VoiceFeedbackTargetZone?(v5, (uint64_t)v16);
  __int16 v12 = v17;
  long long v13 = v16[0];
  Swift::String v14 = (Swift::String)v16[1];
  long long v15 = v16[2];
  retstr->magnitude.WorkoutAnnouncements::VoiceFeedbackPaceFormat value = v10;
  retstr->magnitude.is_nil = countAndFlagsBits & 1;
  retstr->unit.value._char countAndFlagsBits = (uint64_t)object;
  retstr->unit.value._object = v7;
  retstr->stepType = v6;
  *(_OWORD *)&retstr->targetZone.value.minMagnitude = v13;
  retstr->targetZone.value.unit = v14;
  *(_OWORD *)&retstr->targetZone.value.WorkoutAnnouncements::VoiceFeedbackMetricType metricType = v15;
  *(_WORD *)&retstr->targetZone.value.zoneIndex.is_nil = v12;
}

uint64_t outlined init with take of VoiceFeedbackTargetZone?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for VoiceFeedbackTargetZone?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

double VoiceFeedbackWorkoutStep.init(from:)@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  specialized VoiceFeedbackWorkoutStep.init(from:)(a1, (uint64_t)v7);
  if (!v2)
  {
    long long v5 = v7[3];
    a2[2] = v7[2];
    a2[3] = v5;
    a2[4] = v8[0];
    *(_OWORD *)((char *)a2 + 74) = *(_OWORD *)((char *)v8 + 10);
    double result = *(double *)v7;
    long long v6 = v7[1];
    *a2 = v7[0];
    a2[1] = v6;
  }
  return result;
}

uint64_t VoiceFeedbackWorkoutStep.CodingKeys.stringValue.getter(char a1)
{
  return *(void *)&aMagnitudunit[8 * a1];
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance VoiceFeedbackWorkoutStep.CodingKeys()
{
  return VoiceFeedbackWorkoutStep.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance VoiceFeedbackWorkoutStep.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized VoiceFeedbackWorkoutStep.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance VoiceFeedbackWorkoutStep.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type VoiceFeedbackWorkoutStep.CodingKeys and conformance VoiceFeedbackWorkoutStep.CodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance VoiceFeedbackWorkoutStep.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type VoiceFeedbackWorkoutStep.CodingKeys and conformance VoiceFeedbackWorkoutStep.CodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t VoiceFeedbackWorkoutStep.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<VoiceFeedbackWorkoutStep.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type VoiceFeedbackWorkoutStep.CodingKeys and conformance VoiceFeedbackWorkoutStep.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v10[0] = 0;
  KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
  if (!v2)
  {
    v10[0] = 1;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    v10[0] = *(unsigned char *)(v3 + 32);
    char v11 = 2;
    lazy protocol witness table accessor for type VoiceFeedbackStepType and conformance VoiceFeedbackStepType();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    outlined init with take of VoiceFeedbackTargetZone?(v3 + 40, (uint64_t)v12);
    outlined init with take of VoiceFeedbackTargetZone?((uint64_t)v12, (uint64_t)v10);
    char v11 = 3;
    lazy protocol witness table accessor for type VoiceFeedbackTargetZone and conformance VoiceFeedbackTargetZone();
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

double protocol witness for Decodable.init(from:) in conformance VoiceFeedbackWorkoutStep@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  specialized VoiceFeedbackWorkoutStep.init(from:)(a1, (uint64_t)v7);
  if (!v2)
  {
    long long v5 = v7[3];
    a2[2] = v7[2];
    a2[3] = v5;
    a2[4] = v8[0];
    *(_OWORD *)((char *)a2 + 74) = *(_OWORD *)((char *)v8 + 10);
    double result = *(double *)v7;
    long long v6 = v7[1];
    *a2 = v7[0];
    a2[1] = v6;
  }
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance VoiceFeedbackWorkoutStep(void *a1)
{
  return VoiceFeedbackWorkoutStep.encode(to:)(a1);
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance VoiceFeedbackWorkoutStep(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[3];
  _OWORD v7[2] = a1[2];
  _OWORD v7[3] = v2;
  v8[0] = a1[4];
  *(_OWORD *)((char *)v8 + 10) = *(_OWORD *)((char *)a1 + 74);
  long long v3 = a1[1];
  v7[0] = *a1;
  v7[1] = v3;
  long long v4 = a2[3];
  v9[2] = a2[2];
  v9[3] = v4;
  v10[0] = a2[4];
  *(_OWORD *)((char *)v10 + 10) = *(_OWORD *)((char *)a2 + 74);
  long long v5 = a2[1];
  v9[0] = *a2;
  v9[1] = v5;
  return specialized static VoiceFeedbackWorkoutStep.__derived_struct_equals(_:_:)((uint64_t)v7, (uint64_t)v9);
}

BOOL specialized static VoiceFeedbackWorkoutStep.__derived_struct_equals(_:_:)(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 8);
  if (*(unsigned char *)(a1 + 8))
  {
    if (!*(unsigned char *)(a2 + 8)) {
      return 0;
    }
  }
  else
  {
    if (*(double *)a1 != *(double *)a2) {
      char v4 = 1;
    }
    if (v4) {
      return 0;
    }
  }
  uint64_t v5 = *(void *)(a1 + 24);
  uint64_t v6 = *(void *)(a2 + 24);
  if (!v5)
  {
    if (v6) {
      return 0;
    }
    goto LABEL_14;
  }
  if (!v6) {
    return 0;
  }
  if (*(void *)(a1 + 16) == *(void *)(a2 + 16) && v5 == v6
    || (v7 = _stringCompareWithSmolCheck(_:_:expecting:)(), BOOL result = 0, (v7 & 1) != 0))
  {
LABEL_14:
    if (*(unsigned __int8 *)(a1 + 32) == *(unsigned __int8 *)(a2 + 32))
    {
      uint64_t v9 = *(void *)(a1 + 64);
      uint64_t v10 = *(void *)(a2 + 64);
      if (v9)
      {
        if (!v10) {
          return 0;
        }
        uint64_t v11 = *(void *)(a1 + 56);
        uint64_t v12 = *(void *)(a1 + 72);
        uint64_t v13 = *(void *)(a1 + 80);
        __int16 v14 = *(_WORD *)(a1 + 88);
        long long v15 = *(_OWORD *)(a2 + 40);
        uint64_t v16 = *(void *)(a2 + 56);
        uint64_t v17 = *(void *)(a2 + 72);
        uint64_t v18 = *(void *)(a2 + 80);
        __int16 v19 = *(_WORD *)(a2 + 88);
        long long v20 = *(_OWORD *)(a1 + 40);
        uint64_t v21 = v11;
        uint64_t v22 = v9;
        __int16 v23 = v12;
        uint64_t v24 = v13;
        __int16 v25 = v14 & 0x101;
        long long v26 = v15;
        uint64_t v27 = v16;
        uint64_t v28 = v10;
        __int16 v29 = v17;
        uint64_t v30 = v18;
        __int16 v31 = v19 & 0x101;
        return (specialized static VoiceFeedbackTargetZone.__derived_struct_equals(_:_:)((uint64_t)&v20, (uint64_t)&v26) & 1) != 0;
      }
      if (!v10) {
        return 1;
      }
    }
    return 0;
  }
  return result;
}

uint64_t specialized VoiceFeedbackWorkoutStep.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<VoiceFeedbackWorkoutStep.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type VoiceFeedbackWorkoutStep.CodingKeys and conformance VoiceFeedbackWorkoutStep.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    goto LABEL_3;
  }
  LOBYTE(v26) = 0;
  uint64_t v9 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  int v32 = v10;
  LOBYTE(v26) = 1;
  uint64_t v11 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  uint64_t v14 = v13;
  uint64_t v25 = v11;
  LOBYTE(v26) = 2;
  swift_bridgeObjectRetain();
  unint64_t v15 = KeyedDecodingContainer.decode(_:forKey:)();
  int v16 = specialized VoiceFeedbackStepType.init(rawValue:)(v15);
  if (v16 == 4)
  {
    swift_bridgeObjectRelease();
    LOBYTE(v26) = 2;
    type metadata accessor for DecodingError();
    swift_allocError();
    lazy protocol witness table accessor for type KeyedDecodingContainer<VoiceFeedbackWorkoutStep.CodingKeys> and conformance KeyedDecodingContainer<A>();
    static DecodingError.dataCorruptedError<A>(forKey:in:debugDescription:)();
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
LABEL_3:
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  int v24 = v16;
  char v33 = 3;
  lazy protocol witness table accessor for type VoiceFeedbackTargetZone and conformance VoiceFeedbackTargetZone();
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  long long v23 = v26;
  uint64_t v18 = v27;
  uint64_t v17 = v28;
  uint64_t v19 = v29;
  uint64_t v20 = v30;
  int v22 = v31;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a2 = v9;
  *(unsigned char *)(a2 + 8) = v32 & 1;
  *(void *)(a2 + 16) = v25;
  *(void *)(a2 + 24) = v14;
  *(unsigned char *)(a2 + 32) = v24;
  *(_OWORD *)(a2 + 40) = v23;
  *(void *)(a2 + 56) = v18;
  *(void *)(a2 + 64) = v17;
  *(void *)(a2 + 72) = v19;
  *(void *)(a2 + 80) = v20;
  *(_WORD *)(a2 + 88) = v22;
  return result;
}

unint64_t lazy protocol witness table accessor for type VoiceFeedbackWorkoutStep.CodingKeys and conformance VoiceFeedbackWorkoutStep.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type VoiceFeedbackWorkoutStep.CodingKeys and conformance VoiceFeedbackWorkoutStep.CodingKeys;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackWorkoutStep.CodingKeys and conformance VoiceFeedbackWorkoutStep.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackWorkoutStep.CodingKeys and conformance VoiceFeedbackWorkoutStep.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type VoiceFeedbackWorkoutStep.CodingKeys and conformance VoiceFeedbackWorkoutStep.CodingKeys;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackWorkoutStep.CodingKeys and conformance VoiceFeedbackWorkoutStep.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackWorkoutStep.CodingKeys and conformance VoiceFeedbackWorkoutStep.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type VoiceFeedbackWorkoutStep.CodingKeys and conformance VoiceFeedbackWorkoutStep.CodingKeys;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackWorkoutStep.CodingKeys and conformance VoiceFeedbackWorkoutStep.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackWorkoutStep.CodingKeys and conformance VoiceFeedbackWorkoutStep.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type VoiceFeedbackWorkoutStep.CodingKeys and conformance VoiceFeedbackWorkoutStep.CodingKeys;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackWorkoutStep.CodingKeys and conformance VoiceFeedbackWorkoutStep.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackWorkoutStep.CodingKeys and conformance VoiceFeedbackWorkoutStep.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type VoiceFeedbackTargetZone and conformance VoiceFeedbackTargetZone()
{
  unint64_t result = lazy protocol witness table cache variable for type VoiceFeedbackTargetZone and conformance VoiceFeedbackTargetZone;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackTargetZone and conformance VoiceFeedbackTargetZone)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackTargetZone and conformance VoiceFeedbackTargetZone);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type VoiceFeedbackTargetZone and conformance VoiceFeedbackTargetZone;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackTargetZone and conformance VoiceFeedbackTargetZone)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackTargetZone and conformance VoiceFeedbackTargetZone);
  }
  return result;
}

uint64_t destroy for VoiceFeedbackWorkoutStep()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for VoiceFeedbackWorkoutStep(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  uint64_t v4 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v4;
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(unsigned char *)(a1 + 73) = *(unsigned char *)(a2 + 73);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_WORD *)(a1 + 88) = *(_WORD *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for VoiceFeedbackWorkoutStep(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + 16) = a2[2];
  *(void *)(a1 + 24) = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
  *(void *)(a1 + 40) = a2[5];
  *(void *)(a1 + 48) = a2[6];
  *(void *)(a1 + 56) = a2[7];
  *(void *)(a1 + 64) = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 72) = *((unsigned char *)a2 + 72);
  *(unsigned char *)(a1 + 73) = *((unsigned char *)a2 + 73);
  uint64_t v5 = a2[10];
  *(unsigned char *)(a1 + 88) = *((unsigned char *)a2 + 88);
  *(void *)(a1 + 80) = v5;
  *(unsigned char *)(a1 + 89) = *((unsigned char *)a2 + 89);
  return a1;
}

__n128 __swift_memcpy90_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 74) = *(_OWORD *)(a2 + 74);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for VoiceFeedbackWorkoutStep(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  uint64_t v5 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v5;
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 72) = *(_WORD *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(unsigned char *)(a1 + 89) = *(unsigned char *)(a2 + 89);
  return a1;
}

uint64_t getEnumTagSinglePayload for VoiceFeedbackWorkoutStep(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 90)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for VoiceFeedbackWorkoutStep(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 88) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 90) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 90) = 0;
    }
    if (a2) {
      *(void *)(result + 24) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for VoiceFeedbackWorkoutStep()
{
  return &type metadata for VoiceFeedbackWorkoutStep;
}

unsigned char *storeEnumTagSinglePayload for VoiceFeedbackWorkoutStep.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2619CE308);
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

void *type metadata accessor for VoiceFeedbackWorkoutStep.CodingKeys()
{
  return &unk_270D9C340;
}

uint64_t specialized VoiceFeedbackWorkoutStep.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x647574696E67616DLL && a2 == 0xE900000000000065;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1953066613 && a2 == 0xE400000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6570795470657473 && a2 == 0xE800000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6F5A746567726174 && a2 == 0xEA0000000000656ELL)
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

unint64_t lazy protocol witness table accessor for type KeyedDecodingContainer<VoiceFeedbackWorkoutStep.CodingKeys> and conformance KeyedDecodingContainer<A>()
{
  unint64_t result = lazy protocol witness table cache variable for type KeyedDecodingContainer<VoiceFeedbackWorkoutStep.CodingKeys> and conformance KeyedDecodingContainer<A>;
  if (!lazy protocol witness table cache variable for type KeyedDecodingContainer<VoiceFeedbackWorkoutStep.CodingKeys> and conformance KeyedDecodingContainer<A>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for KeyedDecodingContainer<VoiceFeedbackWorkoutStep.CodingKeys>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type KeyedDecodingContainer<VoiceFeedbackWorkoutStep.CodingKeys> and conformance KeyedDecodingContainer<A>);
  }
  return result;
}

uint64_t SegmentModel.alertType.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*SegmentModel.alertType.modify())()
{
  return closure #1 in default argument 1 of OutputGenerationManifest.init(dialogPhase:_:);
}

WorkoutAnnouncements::SegmentModel __swiftcall SegmentModel.init(index:)(Swift::Int index)
{
  WorkoutAnnouncements::VoiceFeedbackAlertType v2 = WorkoutAnnouncements_VoiceFeedbackAlertType_segment;
  result.index = index;
  result.alertType = v2;
  return result;
}

BOOL static SegmentModel.__derived_struct_equals(_:_:)(char a1, uint64_t a2, char a3, uint64_t a4)
{
  return a1 == a3 && a2 == a4;
}

uint64_t SegmentModel.CodingKeys.stringValue.getter(char a1)
{
  if (a1) {
    return 0x7865646E69;
  }
  else {
    return 0x7079547472656C61;
  }
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance SegmentModel.CodingKeys()
{
  return SegmentModel.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance SegmentModel.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized SegmentModel.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SegmentModel.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SegmentModel.CodingKeys and conformance SegmentModel.CodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SegmentModel.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type SegmentModel.CodingKeys and conformance SegmentModel.CodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SegmentModel.encode(to:)(void *a1, char a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SegmentModel.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type SegmentModel.CodingKeys and conformance SegmentModel.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  char v13 = a2;
  char v12 = 0;
  lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v2)
  {
    char v11 = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t lazy protocol witness table accessor for type SegmentModel.CodingKeys and conformance SegmentModel.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type SegmentModel.CodingKeys and conformance SegmentModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type SegmentModel.CodingKeys and conformance SegmentModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SegmentModel.CodingKeys and conformance SegmentModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SegmentModel.CodingKeys and conformance SegmentModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type SegmentModel.CodingKeys and conformance SegmentModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SegmentModel.CodingKeys and conformance SegmentModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SegmentModel.CodingKeys and conformance SegmentModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type SegmentModel.CodingKeys and conformance SegmentModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SegmentModel.CodingKeys and conformance SegmentModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SegmentModel.CodingKeys and conformance SegmentModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type SegmentModel.CodingKeys and conformance SegmentModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SegmentModel.CodingKeys and conformance SegmentModel.CodingKeys);
  }
  return result;
}

uint64_t SegmentModel.init(from:)(void *a1)
{
  return specialized SegmentModel.init(from:)(a1);
}

uint64_t protocol witness for Decodable.init(from:) in conformance SegmentModel@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = specialized SegmentModel.init(from:)(a1);
  if (!v2)
  {
    *(unsigned char *)a2 = result;
    *(void *)(a2 + 8) = v5;
  }
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance SegmentModel(void *a1)
{
  return SegmentModel.encode(to:)(a1, *v1);
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance SegmentModel(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2 && *((void *)a1 + 1) == *((void *)a2 + 1);
}

uint64_t protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance SegmentModel(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 8);
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v3;
  return MEMORY[0x270FA2498](protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance SegmentModel, 0, 0);
}

uint64_t protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance SegmentModel()
{
  uint64_t v1 = *__swift_project_boxed_opaque_existential_1(*(void **)(v0 + 16), *(void *)(*(void *)(v0 + 16) + 24));
  uint64_t v5 = (uint64_t (*)(char, uint64_t, uint64_t))((char *)&async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.segmentMarked(executeSashGroupOnWatch:_:)
                                                      + async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.segmentMarked(executeSashGroupOnWatch:_:));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v2;
  *uint64_t v2 = v0;
  v2[1] = protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance TimeSplitModel;
  uint64_t v3 = *(void *)(v0 + 24);
  return v5(0, v1, v3);
}

uint64_t specialized SegmentModel.init(with:)(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(specialized Sequence.compactMap<A>(_:)(a1) + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<VoiceFeedbackKeys, Any>);
    uint64_t v6 = static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v6 = MEMORY[0x263F8EE80];
  }
  *(void *)&long long v28 = v6;
  uint64_t v7 = swift_bridgeObjectRetain();
  specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(v7, 1, &v28);
  swift_bridgeObjectRelease();
  uint64_t v8 = v28;
  uint64_t v9 = Logger.workout.unsafeMutableAddressor();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v9, v2);
  swift_retain_n();
  uint64_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    *(void *)&long long v28 = v25;
    *(_DWORD *)uint64_t v12 = 136315394;
    uint64_t v27 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0x4D746E656D676553, 0xEC0000006C65646FLL, (uint64_t *)&v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v12 + 12) = 2080;
    v23[1] = v12 + 14;
    lazy protocol witness table accessor for type VoiceFeedbackKeys and conformance VoiceFeedbackKeys();
    uint64_t v24 = v2;
    swift_retain();
    uint64_t v26 = a1;
    uint64_t v13 = Dictionary.description.getter();
    uint64_t v14 = v3;
    unint64_t v16 = v15;
    swift_release();
    uint64_t v27 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v13, v16, (uint64_t *)&v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_261998000, v10, v11, "%s received VoiceFeedback dictionary: %s", (uint8_t *)v12, 0x16u);
    uint64_t v17 = v25;
    a1 = v26;
    swift_arrayDestroy();
    MEMORY[0x263E47E50](v17, -1, -1);
    MEMORY[0x263E47E50](v12, -1, -1);

    (*(void (**)(char *, uint64_t))(v14 + 8))(v5, v24);
    if (!*(void *)(v8 + 16)) {
      goto LABEL_10;
    }
  }
  else
  {

    swift_release_n();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    if (!*(void *)(v8 + 16)) {
      goto LABEL_10;
    }
  }
  unint64_t v18 = specialized __RawDictionaryStorage.find<A>(_:)(3);
  if (v19)
  {
    outlined init with copy of Any(*(void *)(v8 + 56) + 32 * v18, (uint64_t)&v28);
    goto LABEL_11;
  }
LABEL_10:
  long long v28 = 0u;
  long long v29 = 0u;
LABEL_11:
  swift_release();
  if (*((void *)&v29 + 1))
  {
    if (swift_dynamicCast())
    {
      uint64_t v20 = 18;
      BOOL v21 = specialized VoiceFeedbackAlerting.hasValidAlertType(in:)(a1, 0x12u);
      swift_bridgeObjectRelease();
      if (v21) {
        return v20;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    outlined destroy of Any?((uint64_t)&v28);
  }
  return 25;
}

uint64_t specialized SegmentModel.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x7079547472656C61 && a2 == 0xE900000000000065;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7865646E69 && a2 == 0xE500000000000000)
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

uint64_t specialized SegmentModel.init(from:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SegmentModel.CodingKeys>);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = &v8[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type SegmentModel.CodingKeys and conformance SegmentModel.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  v8[14] = 0;
  lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  uint64_t v6 = v8[15];
  v8[13] = 1;
  KeyedDecodingContainer.decode(_:forKey:)();
  (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  return v6;
}

unint64_t instantiation function for generic protocol witness table for SegmentModel(void *a1)
{
  a1[1] = lazy protocol witness table accessor for type SegmentModel and conformance SegmentModel();
  a1[2] = lazy protocol witness table accessor for type SegmentModel and conformance SegmentModel();
  unint64_t result = lazy protocol witness table accessor for type SegmentModel and conformance SegmentModel();
  a1[3] = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type SegmentModel and conformance SegmentModel()
{
  unint64_t result = lazy protocol witness table cache variable for type SegmentModel and conformance SegmentModel;
  if (!lazy protocol witness table cache variable for type SegmentModel and conformance SegmentModel)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SegmentModel and conformance SegmentModel);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SegmentModel and conformance SegmentModel;
  if (!lazy protocol witness table cache variable for type SegmentModel and conformance SegmentModel)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SegmentModel and conformance SegmentModel);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type SegmentModel and conformance SegmentModel;
  if (!lazy protocol witness table cache variable for type SegmentModel and conformance SegmentModel)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SegmentModel and conformance SegmentModel);
  }
  return result;
}

ValueMetadata *type metadata accessor for SegmentModel()
{
  return &type metadata for SegmentModel;
}

unsigned char *storeEnumTagSinglePayload for SegmentModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2619CF3FCLL);
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

void *type metadata accessor for SegmentModel.CodingKeys()
{
  return &unk_270D9C498;
}

uint64_t UpcomingIntervalModel.alertType.getter()
{
  return *v0;
}

uint64_t UpcomingIntervalModel.alertType.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*UpcomingIntervalModel.alertType.modify())()
{
  return closure #1 in default argument 1 of OutputGenerationManifest.init(dialogPhase:_:);
}

void __swiftcall UpcomingIntervalModel.init(completedStep:nextStep:)(WorkoutAnnouncements::UpcomingIntervalModel *__return_ptr retstr, WorkoutAnnouncements::VoiceFeedbackWorkoutStep_optional *completedStep, WorkoutAnnouncements::VoiceFeedbackWorkoutStep *nextStep)
{
  Swift::Double value = nextStep->magnitude.value;
  Swift::Bool is_nil = nextStep->magnitude.is_nil;
  uint64_t countAndFlagsBits = nextStep->unit.value._countAndFlagsBits;
  object = nextStep->unit.value._object;
  WorkoutAnnouncements::VoiceFeedbackStepType stepType = nextStep->stepType;
  Swift::String unit = nextStep->targetZone.value.unit;
  long long v20 = *(_OWORD *)&nextStep->targetZone.value.minMagnitude;
  uint64_t v9 = *(void *)&nextStep->targetZone.value.metricType;
  Swift::Int v10 = nextStep->targetZone.value.zoneIndex.value;
  __int16 v11 = *(_WORD *)&nextStep->targetZone.value.zoneIndex.is_nil;
  outlined init with take of BelowTargetZoneModel?((uint64_t)completedStep, (uint64_t)v21, &demangling cache variable for type metadata for VoiceFeedbackWorkoutStep?);
  Swift::Int v12 = v22;
  __int16 v13 = v23;
  long long v14 = v21[0];
  Swift::String_optional v15 = (Swift::String_optional)v21[1];
  long long v16 = v21[2];
  long long v17 = v21[3];
  long long v18 = v21[4];
  retstr->alertType = WorkoutAnnouncements_VoiceFeedbackAlertType_intervalUpcoming;
  *(_OWORD *)&retstr->completedStep.value.magnitude.Swift::Double value = v14;
  retstr->completedStep.value.Swift::String unit = v15;
  *(_OWORD *)&retstr->completedStep.value.WorkoutAnnouncements::VoiceFeedbackStepType stepType = v16;
  *(_OWORD *)&retstr->completedStep.value.targetZone.value.maxMagnitude = v17;
  *(_OWORD *)&retstr->completedStep.value.targetZone.value.unit._object = v18;
  retstr->completedStep.value.targetZone.value.zoneIndex.Swift::Double value = v12;
  *(_WORD *)&retstr->completedStep.value.targetZone.value.zoneIndex.Swift::Bool is_nil = v13;
  retstr->nextStep.magnitude.Swift::Double value = value;
  retstr->nextStep.magnitude.Swift::Bool is_nil = is_nil;
  retstr->nextStep.unit.value._uint64_t countAndFlagsBits = countAndFlagsBits;
  retstr->nextStep.unit.value._object = object;
  retstr->nextStep.WorkoutAnnouncements::VoiceFeedbackStepType stepType = stepType;
  *(_OWORD *)&retstr->nextStep.targetZone.value.minMagnitude = v20;
  retstr->nextStep.targetZone.value.Swift::String unit = unit;
  *(void *)&retstr->nextStep.targetZone.value.WorkoutAnnouncements::VoiceFeedbackMetricType metricType = v9;
  retstr->nextStep.targetZone.value.zoneIndex.Swift::Double value = v10;
  *(_WORD *)&retstr->nextStep.targetZone.value.zoneIndex.Swift::Bool is_nil = v11;
}

uint64_t UpcomingIntervalModel.CodingKeys.stringValue.getter(char a1)
{
  return *(void *)&aAlerttypcomple[8 * a1];
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance UpcomingIntervalModel.CodingKeys()
{
  return UpcomingIntervalModel.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance UpcomingIntervalModel.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = specialized UpcomingIntervalModel.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance UpcomingIntervalModel.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type UpcomingIntervalModel.CodingKeys and conformance UpcomingIntervalModel.CodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance UpcomingIntervalModel.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type UpcomingIntervalModel.CodingKeys and conformance UpcomingIntervalModel.CodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t UpcomingIntervalModel.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<UpcomingIntervalModel.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type UpcomingIntervalModel.CodingKeys and conformance UpcomingIntervalModel.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  LOBYTE(v12[0]) = *(unsigned char *)v3;
  char v15 = 0;
  lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v2)
  {
    outlined init with take of BelowTargetZoneModel?(v3 + 8, (uint64_t)v14, &demangling cache variable for type metadata for VoiceFeedbackWorkoutStep?);
    outlined init with take of BelowTargetZoneModel?((uint64_t)v14, (uint64_t)v12, &demangling cache variable for type metadata for VoiceFeedbackWorkoutStep?);
    char v15 = 1;
    lazy protocol witness table accessor for type VoiceFeedbackWorkoutStep and conformance VoiceFeedbackWorkoutStep();
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
    long long v9 = *(_OWORD *)(v3 + 152);
    v12[2] = *(_OWORD *)(v3 + 136);
    uint64_t v12[3] = v9;
    v13[0] = *(_OWORD *)(v3 + 168);
    *(_OWORD *)((char *)v13 + 10) = *(_OWORD *)(v3 + 178);
    long long v10 = *(_OWORD *)(v3 + 120);
    v12[0] = *(_OWORD *)(v3 + 104);
    v12[1] = v10;
    char v15 = 2;
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

__n128 UpcomingIntervalModel.init(from:)@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  specialized UpcomingIntervalModel.init(from:)(a1, (uint64_t)v10);
  if (!v2)
  {
    long long v5 = v10[11];
    *(_OWORD *)(a2 + 160) = v10[10];
    *(_OWORD *)(a2 + 176) = v5;
    *(_WORD *)(a2 + 192) = v11;
    long long v6 = v10[7];
    *(_OWORD *)(a2 + 96) = v10[6];
    *(_OWORD *)(a2 + 112) = v6;
    long long v7 = v10[9];
    *(_OWORD *)(a2 + 128) = v10[8];
    *(_OWORD *)(a2 + 144) = v7;
    long long v8 = v10[3];
    *(_OWORD *)(a2 + 32) = v10[2];
    *(_OWORD *)(a2 + 48) = v8;
    long long v9 = v10[5];
    *(_OWORD *)(a2 + 64) = v10[4];
    *(_OWORD *)(a2 + 80) = v9;
    __n128 result = (__n128)v10[1];
    *(_OWORD *)a2 = v10[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

__n128 protocol witness for Decodable.init(from:) in conformance UpcomingIntervalModel@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  specialized UpcomingIntervalModel.init(from:)(a1, (uint64_t)v10);
  if (!v2)
  {
    long long v5 = v10[11];
    *(_OWORD *)(a2 + 160) = v10[10];
    *(_OWORD *)(a2 + 176) = v5;
    *(_WORD *)(a2 + 192) = v11;
    long long v6 = v10[7];
    *(_OWORD *)(a2 + 96) = v10[6];
    *(_OWORD *)(a2 + 112) = v6;
    long long v7 = v10[9];
    *(_OWORD *)(a2 + 128) = v10[8];
    *(_OWORD *)(a2 + 144) = v7;
    long long v8 = v10[3];
    *(_OWORD *)(a2 + 32) = v10[2];
    *(_OWORD *)(a2 + 48) = v8;
    long long v9 = v10[5];
    *(_OWORD *)(a2 + 64) = v10[4];
    *(_OWORD *)(a2 + 80) = v9;
    __n128 result = (__n128)v10[1];
    *(_OWORD *)a2 = v10[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance UpcomingIntervalModel(void *a1)
{
  return UpcomingIntervalModel.encode(to:)(a1);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance UpcomingIntervalModel(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a1 + 176);
  v15[10] = *(_OWORD *)(a1 + 160);
  v15[11] = v2;
  __int16 v16 = *(_WORD *)(a1 + 192);
  long long v3 = *(_OWORD *)(a1 + 112);
  v15[6] = *(_OWORD *)(a1 + 96);
  v15[7] = v3;
  long long v4 = *(_OWORD *)(a1 + 144);
  v15[8] = *(_OWORD *)(a1 + 128);
  v15[9] = v4;
  long long v5 = *(_OWORD *)(a1 + 48);
  v15[2] = *(_OWORD *)(a1 + 32);
  v15[3] = v5;
  long long v6 = *(_OWORD *)(a1 + 80);
  v15[4] = *(_OWORD *)(a1 + 64);
  v15[5] = v6;
  long long v7 = *(_OWORD *)(a1 + 16);
  v15[0] = *(_OWORD *)a1;
  v15[1] = v7;
  long long v8 = *(_OWORD *)(a2 + 176);
  v17[10] = *(_OWORD *)(a2 + 160);
  v17[11] = v8;
  __int16 v18 = *(_WORD *)(a2 + 192);
  long long v9 = *(_OWORD *)(a2 + 112);
  v17[6] = *(_OWORD *)(a2 + 96);
  v17[7] = v9;
  long long v10 = *(_OWORD *)(a2 + 144);
  v17[8] = *(_OWORD *)(a2 + 128);
  v17[9] = v10;
  long long v11 = *(_OWORD *)(a2 + 48);
  v17[2] = *(_OWORD *)(a2 + 32);
  v17[3] = v11;
  long long v12 = *(_OWORD *)(a2 + 80);
  v17[4] = *(_OWORD *)(a2 + 64);
  v17[5] = v12;
  long long v13 = *(_OWORD *)(a2 + 16);
  v17[0] = *(_OWORD *)a2;
  v17[1] = v13;
  return specialized static UpcomingIntervalModel.__derived_struct_equals(_:_:)((uint64_t *)v15, (uint64_t *)v17) & 1;
}

uint64_t UpcomingIntervalModel.executePattern(wrapper:)(uint64_t a1)
{
  v2[59] = a1;
  v2[60] = v1;
  uint64_t v3 = type metadata accessor for Logger();
  v2[61] = v3;
  v2[62] = *(void *)(v3 - 8);
  v2[63] = swift_task_alloc();
  v2[64] = type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingPaceParameters(0);
  v2[65] = swift_task_alloc();
  v2[66] = type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingSpeedParameters(0);
  v2[67] = swift_task_alloc();
  v2[68] = type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters(0);
  v2[69] = swift_task_alloc();
  v2[70] = swift_task_alloc();
  v2[71] = type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingHeartRateZoneParameters(0);
  v2[72] = swift_task_alloc();
  return MEMORY[0x270FA2498](UpcomingIntervalModel.executePattern(wrapper:), 0, 0);
}

{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t (*v4)();
  uint64_t v6;

  uint64_t v3 = (void *)*v2;
  v3[38] = v2;
  v3[39] = a1;
  v3[40] = v1;
  v3[75] = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1) {
    long long v4 = UpcomingIntervalModel.executePattern(wrapper:);
  }
  else {
    long long v4 = UpcomingIntervalModel.executePattern(wrapper:);
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t (*v4)();
  uint64_t v6;

  uint64_t v3 = (void *)*v2;
  v3[41] = v2;
  v3[42] = a1;
  v3[43] = v1;
  v3[78] = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1) {
    long long v4 = UpcomingIntervalModel.executePattern(wrapper:);
  }
  else {
    long long v4 = UpcomingIntervalModel.executePattern(wrapper:);
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t (*v4)();
  uint64_t v6;

  uint64_t v3 = (void *)*v2;
  v3[44] = v2;
  v3[45] = a1;
  v3[46] = v1;
  v3[81] = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1) {
    long long v4 = UpcomingIntervalModel.executePattern(wrapper:);
  }
  else {
    long long v4 = UpcomingIntervalModel.executePattern(wrapper:);
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t (*v4)();
  uint64_t v6;

  uint64_t v3 = (void *)*v2;
  v3[47] = v2;
  v3[48] = a1;
  v3[49] = v1;
  v3[84] = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1) {
    long long v4 = UpcomingIntervalModel.executePattern(wrapper:);
  }
  else {
    long long v4 = UpcomingIntervalModel.executePattern(wrapper:);
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t (*v4)();
  uint64_t v6;

  uint64_t v3 = (void *)*v2;
  v3[50] = v2;
  v3[51] = a1;
  v3[52] = v1;
  v3[87] = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1) {
    long long v4 = UpcomingIntervalModel.executePattern(wrapper:);
  }
  else {
    long long v4 = UpcomingIntervalModel.executePattern(wrapper:);
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t UpcomingIntervalModel.executePattern(wrapper:)()
{
  uint64_t v84 = v0;
  uint64_t v1 = *(void *)(v0 + 480);
  long long v2 = *(_OWORD *)(v1 + 120);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v1 + 104);
  *(_OWORD *)(v0 + 32) = v2;
  long long v3 = *(_OWORD *)(v1 + 152);
  long long v4 = *(_OWORD *)(v1 + 168);
  long long v5 = *(_OWORD *)(v1 + 136);
  *(_OWORD *)(v0 + 90) = *(_OWORD *)(v1 + 178);
  *(_OWORD *)(v0 + 64) = v3;
  *(_OWORD *)(v0 + 80) = v4;
  *(_OWORD *)(v0 + 48) = v5;
  outlined init with take of BelowTargetZoneModel?(v0 + 56, v0 + 112, &demangling cache variable for type metadata for VoiceFeedbackTargetZone?);
  outlined init with take of BelowTargetZoneModel?(v0 + 112, v0 + 224, &demangling cache variable for type metadata for VoiceFeedbackTargetZone?);
  if (!*(void *)(v0 + 248))
  {
    uint64_t v26 = *(void *)(v0 + 552);
    uint64_t v27 = *(int **)(v0 + 544);
    long long v28 = *(uint64_t **)(v0 + 480);
    __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 472), *(void *)(*(void *)(v0 + 472) + 24));
    outlined retain of UpcomingIntervalModel(v28);
    uint64_t v29 = v26 + v27[12];
    uint64_t v30 = type metadata accessor for SpeakableString();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v29, 1, 1, v30);
    *(unsigned char *)uint64_t v26 = 1;
    *(void *)(v26 + 8) = 0;
    *(_WORD *)(v26 + 16) = 1;
    *(void *)(v26 + 24) = 0;
    *(unsigned char *)(v26 + 32) = 1;
    *(void *)(v26 + 40) = 0;
    *(unsigned char *)(v26 + 48) = 1;
    *(void *)(v26 + 64) = 0;
    *(void *)(v26 + 72) = 0;
    *(void *)(v26 + 56) = 0;
    *(unsigned char *)(v26 + 80) = 1;
    *(unsigned char *)(v26 + v27[13]) = 0;
    *(unsigned char *)(v26 + v27[14]) = 1;
    *(unsigned char *)(v26 + v27[15]) = 0;
    *(unsigned char *)(v26 + v27[16]) = 1;
    *(unsigned char *)(v26 + v27[17]) = 0;
    *(unsigned char *)(v26 + v27[18]) = 0;
    *(unsigned char *)(v26 + v27[19]) = 0;
    uint64_t v31 = v26 + v27[20];
    *(void *)uint64_t v31 = 0;
    *(unsigned char *)(v31 + 8) = 1;
    uint64_t v32 = v26 + v27[21];
    *(void *)uint64_t v32 = 0;
    *(unsigned char *)(v32 + 8) = 1;
    *(void *)(v26 + v27[22]) = 0;
    *(void *)(v26 + v27[23]) = 0;
    uint64_t v33 = v26 + v27[24];
    *(void *)uint64_t v33 = 0;
    *(unsigned char *)(v33 + 8) = 1;
    uint64_t v34 = v26 + v27[25];
    *(void *)uint64_t v34 = 0;
    *(unsigned char *)(v34 + 8) = 1;
    UpcomingIntervalModel.buildNonPaceParameters(_:)(v26);
    uint64_t v35 = WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters.asKeyValuePairs()();
    *(void *)(v0 + 680) = v35;
    uint64_t v81 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x263F6D050]
                                                                              + MEMORY[0x263F6D050]);
    uint64_t v36 = (void *)swift_task_alloc();
    *(void *)(v0 + 688) = v36;
    *uint64_t v36 = v0;
    v36[1] = UpcomingIntervalModel.executePattern(wrapper:);
    unint64_t v22 = 0x80000002619DCC30;
    unint64_t v23 = 0xD00000000000002CLL;
LABEL_10:
    uint64_t v24 = v35;
    uint64_t v25 = v81;
    goto LABEL_11;
  }
  long long v6 = *(_OWORD *)(v0 + 240);
  *(_OWORD *)(v0 + 168) = *(_OWORD *)(v0 + 224);
  *(_OWORD *)(v0 + 184) = v6;
  *(_OWORD *)(v0 + 200) = *(_OWORD *)(v0 + 256);
  *(_WORD *)(v0 + 216) = *(_WORD *)(v0 + 272);
  outlined init with take of BelowTargetZoneModel?(v0 + 208, v0 + 424, &demangling cache variable for type metadata for Int?);
  outlined init with take of BelowTargetZoneModel?(v0 + 424, v0 + 440, &demangling cache variable for type metadata for Int?);
  if ((*(unsigned char *)(v0 + 448) & 1) == 0)
  {
    uint64_t v37 = *(void *)(v0 + 576);
    uint64_t v38 = *(int **)(v0 + 568);
    uint64_t v39 = *(uint64_t **)(v0 + 480);
    __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 472), *(void *)(*(void *)(v0 + 472) + 24));
    outlined retain of UpcomingIntervalModel(v39);
    uint64_t v40 = v37 + v38[12];
    uint64_t v41 = type metadata accessor for SpeakableString();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56))(v40, 1, 1, v41);
    *(unsigned char *)uint64_t v37 = 1;
    *(void *)(v37 + 8) = 0;
    *(_WORD *)(v37 + 16) = 1;
    *(void *)(v37 + 24) = 0;
    *(unsigned char *)(v37 + 32) = 1;
    *(void *)(v37 + 40) = 0;
    *(unsigned char *)(v37 + 48) = 1;
    *(void *)(v37 + 64) = 0;
    *(void *)(v37 + 72) = 0;
    *(void *)(v37 + 56) = 0;
    *(unsigned char *)(v37 + 80) = 1;
    *(unsigned char *)(v37 + v38[13]) = 1;
    *(unsigned char *)(v37 + v38[14]) = 1;
    *(unsigned char *)(v37 + v38[15]) = 0;
    *(void *)(v37 + v38[16]) = 0;
    *(void *)(v37 + v38[17]) = 0;
    uint64_t v42 = v37 + v38[18];
    *(void *)uint64_t v42 = 0;
    *(unsigned char *)(v42 + 8) = 1;
    uint64_t v43 = v37 + v38[19];
    *(void *)uint64_t v43 = 0;
    *(unsigned char *)(v43 + 8) = 1;
    uint64_t v44 = v37 + v38[20];
    *(void *)uint64_t v44 = 0;
    *(unsigned char *)(v44 + 8) = 1;
    UpcomingIntervalModel.buildHeartRateZoneParameters(_:)(v37);
    uint64_t v35 = WorkoutVoiceFeedbackIntervalUpcomingHeartRateZoneParameters.asKeyValuePairs()();
    *(void *)(v0 + 584) = v35;
    uint64_t v81 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x263F6D050]
                                                                              + MEMORY[0x263F6D050]);
    uint64_t v45 = (void *)swift_task_alloc();
    *(void *)(v0 + 592) = v45;
    *uint64_t v45 = v0;
    v45[1] = UpcomingIntervalModel.executePattern(wrapper:);
    unint64_t v46 = 0xD000000000000032;
    uint64_t v47 = "workoutVoiceFeedback#intervalUpcomingHeartRateZone";
LABEL_9:
    unint64_t v22 = (unint64_t)(v47 - 32) | 0x8000000000000000;
    unint64_t v23 = v46;
    goto LABEL_10;
  }
  uint64_t v7 = *(unsigned __int8 *)(v0 + 200);
  if (one-time initialization token for noPaceFormatMetrics != -1) {
    swift_once();
  }
  if (specialized Sequence<>.contains(_:)(v7, (uint64_t)noPaceFormatMetrics._rawValue))
  {
    uint64_t v8 = *(void *)(v0 + 560);
    long long v9 = *(int **)(v0 + 544);
    long long v10 = *(uint64_t **)(v0 + 480);
    __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 472), *(void *)(*(void *)(v0 + 472) + 24));
    BOOL v11 = specialized Sequence<>.contains(_:)(v7, (uint64_t)&outlined read-only object #0 of UpcomingIntervalModel.executePattern(wrapper:));
    BOOL v12 = specialized Sequence<>.contains(_:)(v7, (uint64_t)&outlined read-only object #1 of UpcomingIntervalModel.executePattern(wrapper:));
    char v13 = *(unsigned char *)(v0 + 217);
    outlined retain of UpcomingIntervalModel(v10);
    uint64_t v14 = v8 + v9[12];
    uint64_t v15 = type metadata accessor for SpeakableString();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
    *(unsigned char *)uint64_t v8 = 1;
    *(void *)(v8 + 8) = 0;
    *(_WORD *)(v8 + 16) = 1;
    *(void *)(v8 + 24) = 0;
    *(unsigned char *)(v8 + 32) = 1;
    *(void *)(v8 + 40) = 0;
    *(unsigned char *)(v8 + 48) = 1;
    *(void *)(v8 + 64) = 0;
    *(void *)(v8 + 72) = 0;
    *(void *)(v8 + 56) = 0;
    *(unsigned char *)(v8 + 80) = 1;
    *(unsigned char *)(v8 + v9[13]) = v11;
    *(unsigned char *)(v8 + v9[14]) = 1;
    *(unsigned char *)(v8 + v9[15]) = v7 == 1;
    *(unsigned char *)(v8 + v9[16]) = 1;
    *(unsigned char *)(v8 + v9[17]) = 0;
    *(unsigned char *)(v8 + v9[18]) = v12;
    *(unsigned char *)(v8 + v9[19]) = v13;
    uint64_t v16 = v8 + v9[20];
    *(void *)uint64_t v16 = 0;
    *(unsigned char *)(v16 + 8) = 1;
    uint64_t v17 = v8 + v9[21];
    *(void *)uint64_t v17 = 0;
    *(unsigned char *)(v17 + 8) = 1;
    *(void *)(v8 + v9[22]) = 0;
    *(void *)(v8 + v9[23]) = 0;
    uint64_t v18 = v8 + v9[24];
    *(void *)uint64_t v18 = 0;
    *(unsigned char *)(v18 + 8) = 1;
    uint64_t v19 = v8 + v9[25];
    *(void *)uint64_t v19 = 0;
    *(unsigned char *)(v19 + 8) = 1;
    UpcomingIntervalModel.buildNonPaceParameters(_:)(v8);
    uint64_t v20 = WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters.asKeyValuePairs()();
    *(void *)(v0 + 608) = v20;
    uint64_t v80 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x263F6D050]
                                                                              + MEMORY[0x263F6D050]);
    BOOL v21 = (void *)swift_task_alloc();
    *(void *)(v0 + 616) = v21;
    void *v21 = v0;
    v21[1] = UpcomingIntervalModel.executePattern(wrapper:);
    unint64_t v22 = 0x80000002619DCC30;
    unint64_t v23 = 0xD00000000000002CLL;
    uint64_t v24 = v20;
    uint64_t v25 = v80;
LABEL_11:
    return v25(v23, v22, v24);
  }
  outlined init with take of BelowTargetZoneModel?(v0 + 201, v0 + 106, &demangling cache variable for type metadata for VoiceFeedbackPaceFormat?);
  outlined init with take of BelowTargetZoneModel?(v0 + 106, v0 + 108, &demangling cache variable for type metadata for VoiceFeedbackPaceFormat?);
  int v49 = *(unsigned __int8 *)(v0 + 108);
  if (v49 != 2)
  {
    uint64_t v64 = *(uint64_t **)(v0 + 480);
    __swift_project_boxed_opaque_existential_1(*(void **)(v0 + 472), *(void *)(*(void *)(v0 + 472) + 24));
    char v65 = *(unsigned char *)(v0 + 217);
    outlined retain of UpcomingIntervalModel(v64);
    uint64_t v66 = type metadata accessor for SpeakableString();
    uint64_t v67 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v66 - 8) + 56);
    if (v49)
    {
      uint64_t v75 = *(void *)(v0 + 520);
      uint64_t v76 = *(int **)(v0 + 512);
      v67(v75 + v76[12], 1, 1, v66);
      *(unsigned char *)uint64_t v75 = 1;
      *(void *)(v75 + 8) = 0;
      *(_WORD *)(v75 + 16) = 1;
      *(void *)(v75 + 24) = 0;
      *(unsigned char *)(v75 + 32) = 1;
      *(void *)(v75 + 40) = 0;
      *(unsigned char *)(v75 + 48) = 1;
      *(void *)(v75 + 64) = 0;
      *(void *)(v75 + 72) = 0;
      *(void *)(v75 + 56) = 0;
      *(unsigned char *)(v75 + 80) = 1;
      *(unsigned char *)(v75 + v76[13]) = 1;
      *(unsigned char *)(v75 + v76[14]) = 1;
      *(unsigned char *)(v75 + v76[15]) = 0;
      *(unsigned char *)(v75 + v76[16]) = v65;
      *(void *)(v75 + v76[17]) = 0;
      *(void *)(v75 + v76[18]) = 0;
      *(void *)(v75 + v76[19]) = 0;
      *(void *)(v75 + v76[20]) = 0;
      uint64_t v77 = v75 + v76[21];
      *(void *)uint64_t v77 = 0;
      *(unsigned char *)(v77 + 8) = 1;
      uint64_t v78 = v75 + v76[22];
      *(void *)uint64_t v78 = 0;
      *(unsigned char *)(v78 + 8) = 1;
      UpcomingIntervalModel.buildPaceParameters(_:)(v75);
      uint64_t v35 = WorkoutVoiceFeedbackIntervalUpcomingPaceParameters.asKeyValuePairs()();
      *(void *)(v0 + 656) = v35;
      uint64_t v81 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x263F6D050]
                                                                                + MEMORY[0x263F6D050]);
      v79 = (void *)swift_task_alloc();
      *(void *)(v0 + 664) = v79;
      void *v79 = v0;
      v79[1] = UpcomingIntervalModel.executePattern(wrapper:);
      unint64_t v46 = 0xD000000000000029;
      uint64_t v47 = "workoutVoiceFeedback#intervalUpcomingPace";
    }
    else
    {
      uint64_t v68 = *(void *)(v0 + 536);
      uint64_t v69 = *(int **)(v0 + 528);
      v67(v68 + v69[12], 1, 1, v66);
      *(unsigned char *)uint64_t v68 = 1;
      *(void *)(v68 + 8) = 0;
      *(_WORD *)(v68 + 16) = 1;
      *(void *)(v68 + 24) = 0;
      *(unsigned char *)(v68 + 32) = 1;
      *(void *)(v68 + 40) = 0;
      *(unsigned char *)(v68 + 48) = 1;
      *(void *)(v68 + 64) = 0;
      *(void *)(v68 + 72) = 0;
      *(void *)(v68 + 56) = 0;
      *(unsigned char *)(v68 + 80) = 1;
      *(unsigned char *)(v68 + v69[13]) = 1;
      *(unsigned char *)(v68 + v69[14]) = 1;
      *(unsigned char *)(v68 + v69[15]) = 0;
      *(unsigned char *)(v68 + v69[16]) = v65;
      *(void *)(v68 + v69[17]) = 0;
      *(void *)(v68 + v69[18]) = 0;
      *(void *)(v68 + v69[19]) = 0;
      *(void *)(v68 + v69[20]) = 0;
      uint64_t v70 = v68 + v69[21];
      *(void *)uint64_t v70 = 0;
      *(unsigned char *)(v70 + 8) = 1;
      uint64_t v71 = v68 + v69[22];
      *(void *)uint64_t v71 = 0;
      *(unsigned char *)(v71 + 8) = 1;
      UpcomingIntervalModel.buildSpeedParameters(_:)(v68);
      uint64_t v35 = WorkoutVoiceFeedbackIntervalUpcomingSpeedParameters.asKeyValuePairs()();
      *(void *)(v0 + 632) = v35;
      uint64_t v81 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x263F6D050]
                                                                                + MEMORY[0x263F6D050]);
      uint64_t v72 = (void *)swift_task_alloc();
      *(void *)(v0 + 640) = v72;
      void *v72 = v0;
      v72[1] = UpcomingIntervalModel.executePattern(wrapper:);
      unint64_t v46 = 0xD00000000000002ALL;
      uint64_t v47 = "workoutVoiceFeedback#intervalUpcomingSpeed";
    }
    goto LABEL_9;
  }
  uint64_t v51 = *(void *)(v0 + 496);
  uint64_t v50 = *(void *)(v0 + 504);
  uint64_t v52 = *(void *)(v0 + 488);
  uint64_t v53 = Logger.workout.unsafeMutableAddressor();
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v51 + 16))(v50, v53, v52);
  uint64_t v54 = Logger.logObject.getter();
  os_log_type_t v55 = static os_log_type_t.error.getter();
  BOOL v56 = os_log_type_enabled(v54, v55);
  uint64_t v58 = *(void *)(v0 + 496);
  uint64_t v57 = *(void *)(v0 + 504);
  uint64_t v59 = *(void *)(v0 + 488);
  if (v56)
  {
    uint64_t v82 = *(void *)(v0 + 488);
    uint64_t v60 = swift_slowAlloc();
    uint64_t v61 = swift_slowAlloc();
    v83[0] = v61;
    *(_DWORD *)uint64_t v60 = 136315394;
    *(void *)(v0 + 464) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000015, 0x80000002619DB6F0, v83);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v60 + 12) = 2080;
    *(unsigned char *)(v0 + 107) = v7;
    uint64_t v62 = String.init<A>(describing:)();
    *(void *)(v0 + 456) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v62, v63, v83);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_261998000, v54, v55, "%s needs a pace format for: %s", (uint8_t *)v60, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x263E47E50](v61, -1, -1);
    MEMORY[0x263E47E50](v60, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v57, v82);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v57, v59);
  }
  lazy protocol witness table accessor for type VoiceFeedbackErrors and conformance VoiceFeedbackErrors();
  swift_allocError();
  *uint64_t v73 = 1;
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v74 = *(uint64_t (**)(void))(v0 + 8);
  return v74();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v4;

  outlined destroy of WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters(*(void *)(v0 + 576), type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingHeartRateZoneParameters);
  uint64_t v1 = *(void *)(v0 + 312);
  outlined release of UpcomingIntervalModel(*(uint64_t **)(v0 + 480));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  long long v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

{
  void *v0;
  uint64_t *v1;
  uint64_t (*v2)(void);
  uint64_t v4;

  uint64_t v1 = (uint64_t *)v0[60];
  outlined destroy of WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters(v0[72], type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingHeartRateZoneParameters);
  outlined release of UpcomingIntervalModel(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  long long v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v4;

  outlined destroy of WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters(*(void *)(v0 + 560), type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters);
  uint64_t v1 = *(void *)(v0 + 336);
  outlined release of UpcomingIntervalModel(*(uint64_t **)(v0 + 480));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  long long v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

{
  void *v0;
  uint64_t *v1;
  uint64_t (*v2)(void);
  uint64_t v4;

  uint64_t v1 = (uint64_t *)v0[60];
  outlined destroy of WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters(v0[70], type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters);
  outlined release of UpcomingIntervalModel(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  long long v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v4;

  outlined destroy of WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters(*(void *)(v0 + 536), type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingSpeedParameters);
  uint64_t v1 = *(void *)(v0 + 360);
  outlined release of UpcomingIntervalModel(*(uint64_t **)(v0 + 480));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  long long v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

{
  void *v0;
  uint64_t *v1;
  uint64_t (*v2)(void);
  uint64_t v4;

  uint64_t v1 = (uint64_t *)v0[60];
  outlined destroy of WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters(v0[67], type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingSpeedParameters);
  outlined release of UpcomingIntervalModel(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  long long v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v4;

  outlined destroy of WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters(*(void *)(v0 + 520), type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingPaceParameters);
  uint64_t v1 = *(void *)(v0 + 384);
  outlined release of UpcomingIntervalModel(*(uint64_t **)(v0 + 480));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  long long v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

{
  void *v0;
  uint64_t *v1;
  uint64_t (*v2)(void);
  uint64_t v4;

  uint64_t v1 = (uint64_t *)v0[60];
  outlined destroy of WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters(v0[65], type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingPaceParameters);
  outlined release of UpcomingIntervalModel(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  long long v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v4;

  outlined destroy of WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters(*(void *)(v0 + 552), type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters);
  uint64_t v1 = *(void *)(v0 + 408);
  outlined release of UpcomingIntervalModel(*(uint64_t **)(v0 + 480));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  long long v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

{
  void *v0;
  uint64_t *v1;
  uint64_t (*v2)(void);
  uint64_t v4;

  uint64_t v1 = (uint64_t *)v0[60];
  outlined destroy of WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters(v0[69], type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters);
  outlined release of UpcomingIntervalModel(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  long long v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

uint64_t UpcomingIntervalModel.buildNonPaceParameters(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v53 = (char *)&v50 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  long long v9 = (char *)&v50 - v8;
  MEMORY[0x270FA5388](v7);
  BOOL v11 = (char *)&v50 - v10;
  outlined init with take of BelowTargetZoneModel?(v1 + 8, (uint64_t)v60, &demangling cache variable for type metadata for VoiceFeedbackWorkoutStep?);
  outlined init with take of BelowTargetZoneModel?((uint64_t)v60, (uint64_t)&v61, &demangling cache variable for type metadata for VoiceFeedbackWorkoutStep?);
  uint64_t v13 = v64;
  if (v64 != 1)
  {
    uint64_t v52 = v9;
    char v14 = v62;
    uint64_t v15 = v63;
    LOBYTE(v12) = v65;
    double v16 = (double)v12;
    uint64_t v51 = type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters(0);
    uint64_t v17 = a1 + *(int *)(v51 + 96);
    *(double *)uint64_t v17 = v16;
    *(unsigned char *)(v17 + 8) = 0;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String?>);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_2619DA450;
    *(_OWORD *)(inited + 32) = xmmword_2619DB620;
    *(_OWORD *)(inited + 48) = xmmword_2619DB630;
    int v19 = v14 & 1;
    if (v13
      && (v15 == 115 && v13 == 0xE100000000000000
       || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0
       || (uint64_t v20 = *(void *)(inited + 56)) != 0
       && (*(void *)(inited + 48) == v15 && v20 == v13 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)))
    {
      swift_bridgeObjectRelease();
      type metadata accessor for DialogDuration.Builder();
      swift_allocObject();
      DialogDuration.Builder.init()();
      if (!v19 && (v15 != 7235949 || v13 != 0xE300000000000000)) {
        _stringCompareWithSmolCheck(_:_:expecting:)();
      }
      dispatch thunk of DialogDuration.Builder.withSecs(_:)();
      swift_release();
      uint64_t v21 = dispatch thunk of DialogDuration.Builder.build()();
      swift_release();
      uint64_t v22 = *(int *)(v51 + 92);
      swift_release();
      *(void *)(a1 + v22) = v21;
      long long v9 = v52;
    }
    else
    {
      swift_setDeallocating();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
      swift_arrayDestroy();
      type metadata accessor for DialogLength.Builder();
      swift_allocObject();
      MEMORY[0x263E473C0]();
      dispatch thunk of DialogAbstractMeasurement.Builder.withValue(_:)();
      swift_release();
      if (v13)
      {
        String.toDialogUnit.getter(v15, v13);
        String.toSpeakableString.getter();
        swift_bridgeObjectRelease();
        uint64_t v23 = type metadata accessor for SpeakableString();
        (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v11, 0, 1, v23);
      }
      else
      {
        uint64_t v24 = type metadata accessor for SpeakableString();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v11, 1, 1, v24);
      }
      uint64_t v25 = v51;
      long long v9 = v52;
      dispatch thunk of DialogAbstractMeasurement.Builder.withUnits(_:)();
      swift_release();
      outlined destroy of SpeakableString?((uint64_t)v11);
      uint64_t v26 = dispatch thunk of DialogAbstractMeasurement.Builder.build()();
      swift_release();
      uint64_t v27 = *(int *)(v25 + 88);
      swift_release();
      *(void *)(a1 + v27) = v26;
    }
  }
  long long v28 = *(_OWORD *)(v2 + 120);
  long long v29 = *(_OWORD *)(v2 + 152);
  long long v56 = *(_OWORD *)(v2 + 136);
  long long v57 = v29;
  v58[0] = *(_OWORD *)(v2 + 168);
  *(_OWORD *)((char *)v58 + 10) = *(_OWORD *)(v2 + 178);
  long long v54 = *(_OWORD *)(v2 + 104);
  long long v55 = v28;
  long long v30 = v28;
  if (*((void *)&v28 + 1))
  {
    uint64_t v31 = String.toDialogUnit.getter(v55, *((uint64_t *)&v55 + 1));
    char v33 = String.isDialogDistanceUnit.getter(v31, v32);
    swift_bridgeObjectRelease();
  }
  else
  {
    char v33 = 0;
  }
  LOBYTE(v28) = v56;
  *(double *)(a1 + 8) = (double)(unint64_t)v28;
  *(unsigned char *)(a1 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String?>);
  uint64_t v34 = swift_initStackObject();
  *(_OWORD *)(v34 + 16) = xmmword_2619DA450;
  *(_OWORD *)(v34 + 32) = xmmword_2619DB620;
  *(_OWORD *)(v34 + 48) = xmmword_2619DB630;
  if (*((void *)&v30 + 1)
    && (v30 == __PAIR128__(0xE100000000000000, 115)
     || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0
     || *(void *)(v34 + 56)
     && (*(_OWORD *)(v34 + 48) == v30 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)))
  {
    swift_bridgeObjectRelease();
    type metadata accessor for DialogDuration.Builder();
    swift_allocObject();
    DialogDuration.Builder.init()();
    if ((BYTE8(v54) & 1) == 0 && v30 != __PAIR128__(0xE300000000000000, 7235949)) {
      _stringCompareWithSmolCheck(_:_:expecting:)();
    }
    dispatch thunk of DialogDuration.Builder.withSecs(_:)();
    swift_release();
    uint64_t v35 = dispatch thunk of DialogDuration.Builder.build()();
    swift_release();
    swift_release();
    *(void *)(a1 + 64) = v35;
  }
  else
  {
    swift_setDeallocating();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
    swift_arrayDestroy();
    if (v33)
    {
      type metadata accessor for DialogLength.Builder();
      swift_allocObject();
      MEMORY[0x263E473C0]();
      dispatch thunk of DialogAbstractMeasurement.Builder.withValue(_:)();
      swift_release();
      if (*((void *)&v30 + 1))
      {
        String.toDialogUnit.getter(v30, *((uint64_t *)&v30 + 1));
        String.toSpeakableString.getter();
        swift_bridgeObjectRelease();
        uint64_t v36 = type metadata accessor for SpeakableString();
        (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v9, 0, 1, v36);
      }
      else
      {
        uint64_t v39 = type metadata accessor for SpeakableString();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v9, 1, 1, v39);
      }
      dispatch thunk of DialogAbstractMeasurement.Builder.withUnits(_:)();
      swift_release();
      outlined destroy of SpeakableString?((uint64_t)v9);
      uint64_t v40 = dispatch thunk of DialogAbstractMeasurement.Builder.build()();
      swift_release();
      swift_release();
      *(void *)(a1 + 56) = v40;
    }
    else
    {
      outlined init with take of BelowTargetZoneModel?((uint64_t)&v54, (uint64_t)v59, &demangling cache variable for type metadata for Double?);
      outlined init with take of BelowTargetZoneModel?((uint64_t)v59, a1 + 72, &demangling cache variable for type metadata for Double?);
      if (*((void *)&v30 + 1))
      {
        String.toDialogUnit.getter(v30, *((uint64_t *)&v30 + 1));
        uint64_t v37 = (uint64_t)v53;
        String.toSpeakableString.getter();
        swift_bridgeObjectRelease();
        uint64_t v38 = type metadata accessor for SpeakableString();
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(v37, 0, 1, v38);
      }
      else
      {
        uint64_t v41 = type metadata accessor for SpeakableString();
        uint64_t v37 = (uint64_t)v53;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56))(v53, 1, 1, v41);
      }
      uint64_t v42 = type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters(0);
      outlined assign with take of SpeakableString?(v37, a1 + *(int *)(v42 + 48));
    }
  }
  BOOL v43 = *(void *)&v58[0] == 0;
  if (*(void *)&v58[0]) {
    uint64_t v44 = *((void *)&v56 + 1);
  }
  else {
    uint64_t v44 = 0;
  }
  if (*(void *)&v58[0]) {
    uint64_t v45 = v57;
  }
  else {
    uint64_t v45 = 0;
  }
  uint64_t v46 = type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters(0);
  uint64_t v47 = a1 + *(int *)(v46 + 84);
  *(void *)uint64_t v47 = v44;
  *(unsigned char *)(v47 + 8) = v43;
  uint64_t result = type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters(0);
  uint64_t v49 = a1 + *(int *)(v46 + 80);
  *(void *)uint64_t v49 = v45;
  *(unsigned char *)(v49 + 8) = v43;
  return result;
}

uint64_t UpcomingIntervalModel.buildHeartRateZoneParameters(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v49 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  long long v9 = (char *)&v46 - v8;
  MEMORY[0x270FA5388](v7);
  BOOL v11 = (char *)&v46 - v10;
  outlined init with take of BelowTargetZoneModel?(v1 + 8, (uint64_t)v56, &demangling cache variable for type metadata for VoiceFeedbackWorkoutStep?);
  outlined init with take of BelowTargetZoneModel?((uint64_t)v56, (uint64_t)v57, &demangling cache variable for type metadata for VoiceFeedbackWorkoutStep?);
  uint64_t v13 = v59;
  if (v59 != 1)
  {
    uint64_t v48 = v9;
    char v14 = v57[8];
    uint64_t v15 = v58;
    LOBYTE(v12) = v60;
    double v16 = (double)v12;
    uint64_t v47 = type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingHeartRateZoneParameters(0);
    uint64_t v17 = a1 + *(int *)(v47 + 72);
    *(double *)uint64_t v17 = v16;
    *(unsigned char *)(v17 + 8) = 0;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String?>);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_2619DA450;
    *(_OWORD *)(inited + 32) = xmmword_2619DB620;
    *(_OWORD *)(inited + 48) = xmmword_2619DB630;
    int v19 = v14 & 1;
    if (v13
      && (v15 == 115 && v13 == 0xE100000000000000
       || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0
       || (uint64_t v20 = *(void *)(inited + 56)) != 0
       && (*(void *)(inited + 48) == v15 && v20 == v13 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)))
    {
      swift_bridgeObjectRelease();
      type metadata accessor for DialogDuration.Builder();
      swift_allocObject();
      DialogDuration.Builder.init()();
      if (!v19 && (v15 != 7235949 || v13 != 0xE300000000000000)) {
        _stringCompareWithSmolCheck(_:_:expecting:)();
      }
      dispatch thunk of DialogDuration.Builder.withSecs(_:)();
      swift_release();
      uint64_t v21 = dispatch thunk of DialogDuration.Builder.build()();
      swift_release();
      uint64_t v22 = *(int *)(v47 + 68);
      swift_release();
      *(void *)(a1 + v22) = v21;
      long long v9 = v48;
    }
    else
    {
      swift_setDeallocating();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
      swift_arrayDestroy();
      type metadata accessor for DialogLength.Builder();
      swift_allocObject();
      MEMORY[0x263E473C0]();
      dispatch thunk of DialogAbstractMeasurement.Builder.withValue(_:)();
      swift_release();
      if (v13)
      {
        String.toDialogUnit.getter(v15, v13);
        String.toSpeakableString.getter();
        swift_bridgeObjectRelease();
        uint64_t v23 = type metadata accessor for SpeakableString();
        (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v11, 0, 1, v23);
      }
      else
      {
        uint64_t v24 = type metadata accessor for SpeakableString();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v11, 1, 1, v24);
      }
      uint64_t v25 = v47;
      long long v9 = v48;
      dispatch thunk of DialogAbstractMeasurement.Builder.withUnits(_:)();
      swift_release();
      outlined destroy of SpeakableString?((uint64_t)v11);
      uint64_t v26 = dispatch thunk of DialogAbstractMeasurement.Builder.build()();
      swift_release();
      uint64_t v27 = *(int *)(v25 + 64);
      swift_release();
      *(void *)(a1 + v27) = v26;
    }
  }
  long long v28 = *(_OWORD *)(v2 + 120);
  long long v29 = *(_OWORD *)(v2 + 152);
  v52[0] = *(_OWORD *)(v2 + 136);
  v52[1] = v29;
  v53[0] = *(_OWORD *)(v2 + 168);
  *(_OWORD *)((char *)v53 + 10) = *(_OWORD *)(v2 + 178);
  long long v50 = *(_OWORD *)(v2 + 104);
  long long v51 = v28;
  long long v30 = v28;
  if (*((void *)&v28 + 1))
  {
    uint64_t v31 = String.toDialogUnit.getter(v51, *((uint64_t *)&v51 + 1));
    char v33 = String.isDialogDistanceUnit.getter(v31, v32);
    swift_bridgeObjectRelease();
  }
  else
  {
    char v33 = 0;
  }
  LOBYTE(v28) = v52[0];
  *(double *)(a1 + 8) = (double)(unint64_t)v28;
  *(unsigned char *)(a1 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String?>);
  uint64_t v34 = swift_initStackObject();
  *(_OWORD *)(v34 + 16) = xmmword_2619DA450;
  *(_OWORD *)(v34 + 32) = xmmword_2619DB620;
  *(_OWORD *)(v34 + 48) = xmmword_2619DB630;
  if (*((void *)&v30 + 1)
    && (v30 == __PAIR128__(0xE100000000000000, 115)
     || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0
     || *(void *)(v34 + 56)
     && (*(_OWORD *)(v34 + 48) == v30 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)))
  {
    swift_bridgeObjectRelease();
    type metadata accessor for DialogDuration.Builder();
    swift_allocObject();
    DialogDuration.Builder.init()();
    if ((BYTE8(v50) & 1) == 0 && v30 != __PAIR128__(0xE300000000000000, 7235949)) {
      _stringCompareWithSmolCheck(_:_:expecting:)();
    }
    dispatch thunk of DialogDuration.Builder.withSecs(_:)();
    swift_release();
    uint64_t v35 = dispatch thunk of DialogDuration.Builder.build()();
    swift_release();
    swift_release();
    *(void *)(a1 + 64) = v35;
  }
  else
  {
    swift_setDeallocating();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
    swift_arrayDestroy();
    if (v33)
    {
      type metadata accessor for DialogLength.Builder();
      swift_allocObject();
      MEMORY[0x263E473C0]();
      dispatch thunk of DialogAbstractMeasurement.Builder.withValue(_:)();
      swift_release();
      if (*((void *)&v30 + 1))
      {
        String.toDialogUnit.getter(v30, *((uint64_t *)&v30 + 1));
        String.toSpeakableString.getter();
        swift_bridgeObjectRelease();
        uint64_t v36 = type metadata accessor for SpeakableString();
        (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v9, 0, 1, v36);
      }
      else
      {
        uint64_t v39 = type metadata accessor for SpeakableString();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v9, 1, 1, v39);
      }
      dispatch thunk of DialogAbstractMeasurement.Builder.withUnits(_:)();
      swift_release();
      outlined destroy of SpeakableString?((uint64_t)v9);
      uint64_t v40 = dispatch thunk of DialogAbstractMeasurement.Builder.build()();
      swift_release();
      swift_release();
      *(void *)(a1 + 56) = v40;
    }
    else
    {
      outlined init with take of BelowTargetZoneModel?((uint64_t)&v50, (uint64_t)v54, &demangling cache variable for type metadata for Double?);
      outlined init with take of BelowTargetZoneModel?((uint64_t)v54, a1 + 72, &demangling cache variable for type metadata for Double?);
      if (*((void *)&v30 + 1))
      {
        String.toDialogUnit.getter(v30, *((uint64_t *)&v30 + 1));
        uint64_t v37 = (uint64_t)v49;
        String.toSpeakableString.getter();
        swift_bridgeObjectRelease();
        uint64_t v38 = type metadata accessor for SpeakableString();
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(v37, 0, 1, v38);
      }
      else
      {
        uint64_t v41 = type metadata accessor for SpeakableString();
        uint64_t v37 = (uint64_t)v49;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56))(v49, 1, 1, v41);
      }
      uint64_t v42 = type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingHeartRateZoneParameters(0);
      outlined assign with take of SpeakableString?(v37, a1 + *(int *)(v42 + 48));
    }
  }
  outlined init with take of BelowTargetZoneModel?((uint64_t)v52 + 8, (uint64_t)v55, &demangling cache variable for type metadata for VoiceFeedbackTargetZone?);
  uint64_t result = outlined init with take of BelowTargetZoneModel?((uint64_t)v55, (uint64_t)&v61, &demangling cache variable for type metadata for VoiceFeedbackTargetZone?);
  if (*((void *)&v62 + 1))
  {
    long long v65 = v61;
    long long v66 = v62;
    long long v67 = v63;
    __int16 v68 = v64;
    outlined init with take of BelowTargetZoneModel?((uint64_t)&v67 + 8, (uint64_t)v69, &demangling cache variable for type metadata for Int?);
    uint64_t result = outlined init with take of BelowTargetZoneModel?((uint64_t)v69, (uint64_t)&v70, &demangling cache variable for type metadata for Int?);
    if ((v71 & 1) == 0)
    {
      double v44 = (double)v70;
      uint64_t result = type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingHeartRateZoneParameters(0);
      uint64_t v45 = a1 + *(int *)(result + 80);
      *(double *)uint64_t v45 = v44;
      *(unsigned char *)(v45 + 8) = 0;
    }
  }
  return result;
}

uint64_t UpcomingIntervalModel.buildSpeedParameters(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  long long v63 = (char *)&v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  long long v9 = (char *)&v58 - v8;
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  long long v61 = (char *)&v58 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  long long v62 = (char *)&v58 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v58 - v14;
  outlined init with take of BelowTargetZoneModel?(v1 + 8, (uint64_t)v70, &demangling cache variable for type metadata for VoiceFeedbackWorkoutStep?);
  outlined init with take of BelowTargetZoneModel?((uint64_t)v70, (uint64_t)&v71, &demangling cache variable for type metadata for VoiceFeedbackWorkoutStep?);
  uint64_t v17 = v74;
  if (v74 != 1)
  {
    uint64_t v60 = v71;
    char v18 = v72;
    uint64_t v19 = v73;
    LOBYTE(v16) = v75;
    double v20 = (double)v16;
    uint64_t v59 = type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingSpeedParameters(0);
    uint64_t v21 = a1 + *(int *)(v59 + 84);
    *(double *)uint64_t v21 = v20;
    *(unsigned char *)(v21 + 8) = 0;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String?>);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_2619DA450;
    *(_OWORD *)(inited + 32) = xmmword_2619DB620;
    *(_OWORD *)(inited + 48) = xmmword_2619DB630;
    int v23 = v18 & 1;
    if (v17
      && (v19 == 115 && v17 == 0xE100000000000000
       || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0
       || (uint64_t v24 = *(void *)(inited + 56)) != 0
       && (*(void *)(inited + 48) == v19 && v24 == v17 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)))
    {
      swift_bridgeObjectRelease();
      type metadata accessor for DialogDuration.Builder();
      swift_allocObject();
      DialogDuration.Builder.init()();
      if (v23)
      {
        uint64_t v25 = v59;
      }
      else
      {
        uint64_t v25 = v59;
        if (v19 != 7235949 || v17 != 0xE300000000000000) {
          _stringCompareWithSmolCheck(_:_:expecting:)();
        }
      }
      dispatch thunk of DialogDuration.Builder.withSecs(_:)();
      swift_release();
      uint64_t v29 = dispatch thunk of DialogDuration.Builder.build()();
      swift_release();
      uint64_t v30 = *(int *)(v25 + 80);
    }
    else
    {
      swift_setDeallocating();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
      swift_arrayDestroy();
      type metadata accessor for DialogLength.Builder();
      swift_allocObject();
      MEMORY[0x263E473C0]();
      dispatch thunk of DialogAbstractMeasurement.Builder.withValue(_:)();
      swift_release();
      if (v17)
      {
        String.toDialogUnit.getter(v19, v17);
        String.toSpeakableString.getter();
        swift_bridgeObjectRelease();
        uint64_t v26 = type metadata accessor for SpeakableString();
        (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v15, 0, 1, v26);
      }
      else
      {
        uint64_t v27 = type metadata accessor for SpeakableString();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v15, 1, 1, v27);
      }
      uint64_t v28 = v59;
      dispatch thunk of DialogAbstractMeasurement.Builder.withUnits(_:)();
      swift_release();
      outlined destroy of SpeakableString?((uint64_t)v15);
      uint64_t v29 = dispatch thunk of DialogAbstractMeasurement.Builder.build()();
      swift_release();
      uint64_t v30 = *(int *)(v28 + 76);
    }
    swift_release();
    *(void *)(a1 + v30) = v29;
  }
  long long v31 = *(_OWORD *)(v2 + 120);
  long long v32 = *(_OWORD *)(v2 + 152);
  v66[0] = *(_OWORD *)(v2 + 136);
  v66[1] = v32;
  v67[0] = *(_OWORD *)(v2 + 168);
  *(_OWORD *)((char *)v67 + 10) = *(_OWORD *)(v2 + 178);
  long long v64 = *(_OWORD *)(v2 + 104);
  long long v65 = v31;
  long long v33 = v31;
  if (*((void *)&v31 + 1))
  {
    uint64_t v34 = String.toDialogUnit.getter(v65, *((uint64_t *)&v65 + 1));
    char v36 = String.isDialogDistanceUnit.getter(v34, v35);
    swift_bridgeObjectRelease();
  }
  else
  {
    char v36 = 0;
  }
  LOBYTE(v31) = v66[0];
  *(double *)(a1 + 8) = (double)(unint64_t)v31;
  *(unsigned char *)(a1 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String?>);
  uint64_t v37 = swift_initStackObject();
  *(_OWORD *)(v37 + 16) = xmmword_2619DA450;
  *(_OWORD *)(v37 + 32) = xmmword_2619DB620;
  *(_OWORD *)(v37 + 48) = xmmword_2619DB630;
  if (*((void *)&v33 + 1)
    && (v33 == __PAIR128__(0xE100000000000000, 115)
     || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0
     || *(void *)(v37 + 56)
     && (*(_OWORD *)(v37 + 48) == v33 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)))
  {
    swift_bridgeObjectRelease();
    type metadata accessor for DialogDuration.Builder();
    swift_allocObject();
    DialogDuration.Builder.init()();
    if ((BYTE8(v64) & 1) == 0 && v33 != __PAIR128__(0xE300000000000000, 7235949)) {
      _stringCompareWithSmolCheck(_:_:expecting:)();
    }
    uint64_t v38 = (uint64_t)v63;
    dispatch thunk of DialogDuration.Builder.withSecs(_:)();
    swift_release();
    uint64_t v39 = dispatch thunk of DialogDuration.Builder.build()();
    swift_release();
    swift_release();
    *(void *)(a1 + 64) = v39;
  }
  else
  {
    swift_setDeallocating();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
    swift_arrayDestroy();
    if (v36)
    {
      type metadata accessor for DialogLength.Builder();
      swift_allocObject();
      MEMORY[0x263E473C0]();
      dispatch thunk of DialogAbstractMeasurement.Builder.withValue(_:)();
      swift_release();
      if (*((void *)&v33 + 1))
      {
        String.toDialogUnit.getter(v33, *((uint64_t *)&v33 + 1));
        uint64_t v40 = (uint64_t)v62;
        String.toSpeakableString.getter();
        swift_bridgeObjectRelease();
        uint64_t v41 = type metadata accessor for SpeakableString();
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56))(v40, 0, 1, v41);
      }
      else
      {
        uint64_t v44 = type metadata accessor for SpeakableString();
        uint64_t v40 = (uint64_t)v62;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56))(v62, 1, 1, v44);
      }
      uint64_t v38 = (uint64_t)v63;
      dispatch thunk of DialogAbstractMeasurement.Builder.withUnits(_:)();
      swift_release();
      outlined destroy of SpeakableString?(v40);
      uint64_t v45 = dispatch thunk of DialogAbstractMeasurement.Builder.build()();
      swift_release();
      swift_release();
      *(void *)(a1 + 56) = v45;
    }
    else
    {
      outlined init with take of BelowTargetZoneModel?((uint64_t)&v64, (uint64_t)v68, &demangling cache variable for type metadata for Double?);
      outlined init with take of BelowTargetZoneModel?((uint64_t)v68, a1 + 72, &demangling cache variable for type metadata for Double?);
      if (*((void *)&v33 + 1))
      {
        String.toDialogUnit.getter(v33, *((uint64_t *)&v33 + 1));
        uint64_t v42 = (uint64_t)v61;
        String.toSpeakableString.getter();
        swift_bridgeObjectRelease();
        uint64_t v43 = type metadata accessor for SpeakableString();
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56))(v42, 0, 1, v43);
      }
      else
      {
        uint64_t v46 = type metadata accessor for SpeakableString();
        uint64_t v42 = (uint64_t)v61;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56))(v61, 1, 1, v46);
      }
      uint64_t v38 = (uint64_t)v63;
      uint64_t v47 = type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingSpeedParameters(0);
      outlined assign with take of SpeakableString?(v42, a1 + *(int *)(v47 + 48));
    }
  }
  type metadata accessor for DialogLength.Builder();
  swift_allocObject();
  MEMORY[0x263E473C0]();
  outlined init with take of BelowTargetZoneModel?((uint64_t)v66 + 8, (uint64_t)v69, &demangling cache variable for type metadata for VoiceFeedbackTargetZone?);
  outlined init with take of BelowTargetZoneModel?((uint64_t)v69, (uint64_t)v82, &demangling cache variable for type metadata for VoiceFeedbackTargetZone?);
  dispatch thunk of DialogAbstractMeasurement.Builder.withValue(_:)();
  swift_release();
  outlined init with take of BelowTargetZoneModel?((uint64_t)v69, (uint64_t)v79, &demangling cache variable for type metadata for VoiceFeedbackTargetZone?);
  if (v81)
  {
    String.toDialogUnit.getter(v80, v81);
    String.toSpeakableString.getter();
    swift_bridgeObjectRelease();
    uint64_t v48 = type metadata accessor for SpeakableString();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v48 - 8) + 56))(v9, 0, 1, v48);
  }
  else
  {
    uint64_t v49 = type metadata accessor for SpeakableString();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v49 - 8) + 56))(v9, 1, 1, v49);
  }
  dispatch thunk of DialogAbstractMeasurement.Builder.withUnits(_:)();
  swift_release();
  outlined destroy of SpeakableString?((uint64_t)v9);
  uint64_t v50 = dispatch thunk of DialogAbstractMeasurement.Builder.build()();
  swift_release();
  uint64_t v51 = type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingSpeedParameters(0);
  uint64_t v52 = *(int *)(v51 + 72);
  swift_release();
  *(void *)(a1 + v52) = v50;
  swift_allocObject();
  MEMORY[0x263E473C0]();
  outlined init with take of BelowTargetZoneModel?((uint64_t)v69, (uint64_t)&v78, &demangling cache variable for type metadata for VoiceFeedbackTargetZone?);
  dispatch thunk of DialogAbstractMeasurement.Builder.withValue(_:)();
  swift_release();
  outlined init with take of BelowTargetZoneModel?((uint64_t)v69, (uint64_t)v76, &demangling cache variable for type metadata for VoiceFeedbackTargetZone?);
  if (v77)
  {
    String.toDialogUnit.getter(v76[2], v77);
    String.toSpeakableString.getter();
    swift_bridgeObjectRelease();
    uint64_t v53 = type metadata accessor for SpeakableString();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v53 - 8) + 56))(v38, 0, 1, v53);
  }
  else
  {
    uint64_t v54 = type metadata accessor for SpeakableString();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v54 - 8) + 56))(v38, 1, 1, v54);
  }
  dispatch thunk of DialogAbstractMeasurement.Builder.withUnits(_:)();
  swift_release();
  outlined destroy of SpeakableString?(v38);
  uint64_t v55 = dispatch thunk of DialogAbstractMeasurement.Builder.build()();
  swift_release();
  uint64_t v56 = *(int *)(v51 + 68);
  uint64_t result = swift_release();
  *(void *)(a1 + v56) = v55;
  return result;
}

uint64_t UpcomingIntervalModel.buildPaceParameters(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v52 = (char *)&v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  long long v9 = (char *)&v49 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v49 - v10;
  outlined init with take of BelowTargetZoneModel?(v1 + 8, (uint64_t)v59, &demangling cache variable for type metadata for VoiceFeedbackWorkoutStep?);
  outlined init with take of BelowTargetZoneModel?((uint64_t)v59, (uint64_t)v60, &demangling cache variable for type metadata for VoiceFeedbackWorkoutStep?);
  uint64_t v13 = v62;
  if (v62 != 1)
  {
    uint64_t v51 = v9;
    char v14 = v60[8];
    uint64_t v15 = v61;
    LOBYTE(v12) = v63;
    double v16 = (double)v12;
    uint64_t v50 = type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingPaceParameters(0);
    uint64_t v17 = a1 + *(int *)(v50 + 84);
    *(double *)uint64_t v17 = v16;
    *(unsigned char *)(v17 + 8) = 0;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String?>);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_2619DA450;
    *(_OWORD *)(inited + 32) = xmmword_2619DB620;
    *(_OWORD *)(inited + 48) = xmmword_2619DB630;
    int v19 = v14 & 1;
    if (v13
      && (v15 == 115 && v13 == 0xE100000000000000
       || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0
       || (uint64_t v20 = *(void *)(inited + 56)) != 0
       && (*(void *)(inited + 48) == v15 && v20 == v13 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)))
    {
      swift_bridgeObjectRelease();
      type metadata accessor for DialogDuration.Builder();
      swift_allocObject();
      DialogDuration.Builder.init()();
      if (!v19 && (v15 != 7235949 || v13 != 0xE300000000000000)) {
        _stringCompareWithSmolCheck(_:_:expecting:)();
      }
      dispatch thunk of DialogDuration.Builder.withSecs(_:)();
      swift_release();
      uint64_t v21 = dispatch thunk of DialogDuration.Builder.build()();
      swift_release();
      uint64_t v22 = *(int *)(v50 + 80);
      swift_release();
      *(void *)(a1 + v22) = v21;
      long long v9 = v51;
    }
    else
    {
      swift_setDeallocating();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
      swift_arrayDestroy();
      type metadata accessor for DialogLength.Builder();
      swift_allocObject();
      MEMORY[0x263E473C0]();
      dispatch thunk of DialogAbstractMeasurement.Builder.withValue(_:)();
      swift_release();
      if (v13)
      {
        String.toDialogUnit.getter(v15, v13);
        String.toSpeakableString.getter();
        swift_bridgeObjectRelease();
        uint64_t v23 = type metadata accessor for SpeakableString();
        (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v11, 0, 1, v23);
      }
      else
      {
        uint64_t v24 = type metadata accessor for SpeakableString();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v11, 1, 1, v24);
      }
      uint64_t v25 = v50;
      long long v9 = v51;
      dispatch thunk of DialogAbstractMeasurement.Builder.withUnits(_:)();
      swift_release();
      outlined destroy of SpeakableString?((uint64_t)v11);
      uint64_t v26 = dispatch thunk of DialogAbstractMeasurement.Builder.build()();
      swift_release();
      uint64_t v27 = *(int *)(v25 + 76);
      swift_release();
      *(void *)(a1 + v27) = v26;
    }
  }
  long long v28 = *(_OWORD *)(v2 + 120);
  long long v29 = *(_OWORD *)(v2 + 152);
  v55[0] = *(_OWORD *)(v2 + 136);
  v55[1] = v29;
  v56[0] = *(_OWORD *)(v2 + 168);
  *(_OWORD *)((char *)v56 + 10) = *(_OWORD *)(v2 + 178);
  long long v53 = *(_OWORD *)(v2 + 104);
  long long v54 = v28;
  long long v30 = v28;
  if (*((void *)&v28 + 1))
  {
    uint64_t v31 = String.toDialogUnit.getter(v54, *((uint64_t *)&v54 + 1));
    char v33 = String.isDialogDistanceUnit.getter(v31, v32);
    swift_bridgeObjectRelease();
  }
  else
  {
    char v33 = 0;
  }
  LOBYTE(v28) = v55[0];
  *(double *)(a1 + 8) = (double)(unint64_t)v28;
  *(unsigned char *)(a1 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String?>);
  uint64_t v34 = swift_initStackObject();
  *(_OWORD *)(v34 + 16) = xmmword_2619DA450;
  *(_OWORD *)(v34 + 32) = xmmword_2619DB620;
  *(_OWORD *)(v34 + 48) = xmmword_2619DB630;
  if (*((void *)&v30 + 1)
    && (v30 == __PAIR128__(0xE100000000000000, 115)
     || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0
     || *(void *)(v34 + 56)
     && (*(_OWORD *)(v34 + 48) == v30 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)))
  {
    swift_bridgeObjectRelease();
    type metadata accessor for DialogDuration.Builder();
    swift_allocObject();
    DialogDuration.Builder.init()();
    if ((BYTE8(v53) & 1) == 0 && v30 != __PAIR128__(0xE300000000000000, 7235949)) {
      _stringCompareWithSmolCheck(_:_:expecting:)();
    }
    dispatch thunk of DialogDuration.Builder.withSecs(_:)();
    swift_release();
    uint64_t v35 = dispatch thunk of DialogDuration.Builder.build()();
    swift_release();
    swift_release();
    *(void *)(a1 + 64) = v35;
  }
  else
  {
    swift_setDeallocating();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
    swift_arrayDestroy();
    if (v33)
    {
      type metadata accessor for DialogLength.Builder();
      swift_allocObject();
      MEMORY[0x263E473C0]();
      dispatch thunk of DialogAbstractMeasurement.Builder.withValue(_:)();
      swift_release();
      if (*((void *)&v30 + 1))
      {
        String.toDialogUnit.getter(v30, *((uint64_t *)&v30 + 1));
        String.toSpeakableString.getter();
        swift_bridgeObjectRelease();
        uint64_t v36 = type metadata accessor for SpeakableString();
        (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v9, 0, 1, v36);
      }
      else
      {
        uint64_t v39 = type metadata accessor for SpeakableString();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v9, 1, 1, v39);
      }
      dispatch thunk of DialogAbstractMeasurement.Builder.withUnits(_:)();
      swift_release();
      outlined destroy of SpeakableString?((uint64_t)v9);
      uint64_t v40 = dispatch thunk of DialogAbstractMeasurement.Builder.build()();
      swift_release();
      swift_release();
      *(void *)(a1 + 56) = v40;
    }
    else
    {
      outlined init with take of BelowTargetZoneModel?((uint64_t)&v53, (uint64_t)v57, &demangling cache variable for type metadata for Double?);
      outlined init with take of BelowTargetZoneModel?((uint64_t)v57, a1 + 72, &demangling cache variable for type metadata for Double?);
      if (*((void *)&v30 + 1))
      {
        String.toDialogUnit.getter(v30, *((uint64_t *)&v30 + 1));
        uint64_t v37 = (uint64_t)v52;
        String.toSpeakableString.getter();
        swift_bridgeObjectRelease();
        uint64_t v38 = type metadata accessor for SpeakableString();
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(v37, 0, 1, v38);
      }
      else
      {
        uint64_t v41 = type metadata accessor for SpeakableString();
        uint64_t v37 = (uint64_t)v52;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56))(v52, 1, 1, v41);
      }
      uint64_t v42 = type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingPaceParameters(0);
      outlined assign with take of SpeakableString?(v37, a1 + *(int *)(v42 + 48));
    }
  }
  type metadata accessor for DialogDuration.Builder();
  swift_allocObject();
  DialogDuration.Builder.init()();
  outlined init with take of BelowTargetZoneModel?((uint64_t)v55 + 8, (uint64_t)v58, &demangling cache variable for type metadata for VoiceFeedbackTargetZone?);
  outlined init with take of BelowTargetZoneModel?((uint64_t)v58, (uint64_t)v65, &demangling cache variable for type metadata for VoiceFeedbackTargetZone?);
  dispatch thunk of DialogDuration.Builder.withSecs(_:)();
  swift_release();
  uint64_t v43 = dispatch thunk of DialogDuration.Builder.build()();
  swift_release();
  uint64_t v44 = type metadata accessor for WorkoutVoiceFeedbackIntervalUpcomingPaceParameters(0);
  uint64_t v45 = *(int *)(v44 + 72);
  swift_release();
  *(void *)(a1 + v45) = v43;
  swift_allocObject();
  DialogDuration.Builder.init()();
  outlined init with take of BelowTargetZoneModel?((uint64_t)v58, (uint64_t)v64, &demangling cache variable for type metadata for VoiceFeedbackTargetZone?);
  dispatch thunk of DialogDuration.Builder.withSecs(_:)();
  swift_release();
  uint64_t v46 = dispatch thunk of DialogDuration.Builder.build()();
  swift_release();
  uint64_t v47 = *(int *)(v44 + 68);
  uint64_t result = swift_release();
  *(void *)(a1 + v47) = v46;
  return result;
}

uint64_t protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance UpcomingIntervalModel(uint64_t a1)
{
  long long v4 = *(_OWORD *)(v1 + 176);
  *(_OWORD *)(v2 + 176) = *(_OWORD *)(v1 + 160);
  *(_OWORD *)(v2 + 192) = v4;
  *(_WORD *)(v2 + 208) = *(_WORD *)(v1 + 192);
  long long v5 = *(_OWORD *)(v1 + 112);
  *(_OWORD *)(v2 + 112) = *(_OWORD *)(v1 + 96);
  *(_OWORD *)(v2 + 128) = v5;
  long long v6 = *(_OWORD *)(v1 + 144);
  *(_OWORD *)(v2 + 144) = *(_OWORD *)(v1 + 128);
  *(_OWORD *)(v2 + 160) = v6;
  long long v7 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(v2 + 48) = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(v2 + 64) = v7;
  long long v8 = *(_OWORD *)(v1 + 80);
  *(_OWORD *)(v2 + 80) = *(_OWORD *)(v1 + 64);
  *(_OWORD *)(v2 + 96) = v8;
  long long v9 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v2 + 32) = v9;
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 216) = v10;
  *uint64_t v10 = v2;
  v10[1] = protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance UpcomingIntervalModel;
  return UpcomingIntervalModel.executePattern(wrapper:)(a1);
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v7;
  uint64_t v8;

  long long v7 = *v2;
  long long v4 = swift_task_dealloc();
  long long v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    long long v4 = a1;
  }
  return v5(v4);
}

uint64_t specialized UpcomingIntervalModel.init(with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v56 = a2;
  uint64_t v90 = *MEMORY[0x263EF8340];
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  long long v7 = (char *)v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  long long v9 = (char *)v48 - v8;
  uint64_t v10 = Logger.workout.unsafeMutableAddressor();
  swift_beginAccess();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
  uint64_t v51 = v4 + 16;
  uint64_t v52 = (char *)v10;
  uint64_t v50 = v11;
  v11(v9, (char *)v10, v3);
  swift_bridgeObjectRetain_n();
  uint64_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.debug.getter();
  int v14 = v13;
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v15 = swift_slowAlloc();
    LODWORD(v53) = v14;
    uint64_t v16 = v15;
    uint64_t v49 = swift_slowAlloc();
    *(void *)&v88[0] = v49;
    *(_DWORD *)uint64_t v16 = 136315394;
    uint64_t v54 = v4;
    v87[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000015, 0x80000002619DB6F0, (uint64_t *)v88);
    *(void *)&long long v55 = v3;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v16 + 12) = 2080;
    v48[1] = v16 + 14;
    swift_bridgeObjectRetain();
    uint64_t v17 = v7;
    uint64_t v18 = Dictionary.description.getter();
    unint64_t v20 = v19;
    swift_bridgeObjectRelease();
    uint64_t v21 = v18;
    long long v7 = v17;
    v87[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v21, v20, (uint64_t *)v88);
    uint64_t v4 = v54;
    uint64_t v3 = v55;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_261998000, v12, (os_log_type_t)v53, "%s received VoiceFeedback dictionary: %s", (uint8_t *)v16, 0x16u);
    uint64_t v22 = v49;
    swift_arrayDestroy();
    MEMORY[0x263E47E50](v22, -1, -1);
    MEMORY[0x263E47E50](v16, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  long long v53 = *(void (**)(char *, uint64_t))(v4 + 8);
  v53(v9, v3);
  uint64_t v23 = self;
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  *(void *)&v88[0] = 0;
  id v25 = objc_msgSend(v23, sel_dataWithJSONObject_options_error_, isa, 0, v88);

  id v26 = *(id *)&v88[0];
  if (v25)
  {
    uint64_t v27 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v29 = v28;

    type metadata accessor for JSONDecoder();
    swift_allocObject();
    JSONDecoder.init()();
    lazy protocol witness table accessor for type UpcomingIntervalModel and conformance UpcomingIntervalModel();
    dispatch thunk of JSONDecoder.decode<A>(_:from:)();
    swift_release();
    v60[0] = v84;
    v60[1] = v85;
    __int16 v61 = v86;
    v59[6] = v80;
    v59[7] = v81;
    v59[8] = v82;
    v59[9] = v83;
    v59[2] = v76;
    v59[3] = v77;
    v59[4] = v78;
    v59[5] = v79;
    v59[0] = v74;
    v59[1] = v75;
    LOBYTE(v62) = 4;
    *((void *)&v62 + 1) = *((void *)&v74 + 1);
    long long v63 = v75;
    long long v64 = v76;
    long long v65 = v77;
    long long v66 = v78;
    long long v67 = v79;
    LOWORD(v68) = v80;
    *((void *)&v68 + 1) = *((void *)&v80 + 1);
    LOBYTE(v69) = v81;
    *((void *)&v69 + 1) = *((void *)&v81 + 1);
    *(void *)&long long v70 = v82;
    BYTE8(v70) = BYTE8(v82);
    long long v71 = v83;
    long long v55 = *(_OWORD *)((char *)v60 + 8);
    *(_OWORD *)((char *)v72 + 8) = *(_OWORD *)((char *)v60 + 8);
    *(void *)&v72[0] = v84;
    *((void *)&v72[1] + 1) = *((void *)&v85 + 1);
    __int16 v73 = v86;
    v88[6] = v68;
    v88[7] = v69;
    __int16 v89 = v86;
    v88[10] = v72[0];
    v88[11] = v72[1];
    v88[8] = v70;
    v88[9] = v83;
    v88[4] = v78;
    v88[5] = v79;
    v88[2] = v76;
    v88[3] = v77;
    v88[0] = v62;
    v88[1] = v75;
    outlined copy of VoiceFeedbackWorkoutStep?(*((uint64_t *)&v74 + 1), v75, *((uint64_t *)&v75 + 1), v76);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    outlined consume of Data._Representation(v27, v29);
    outlined release of UpcomingIntervalModel((uint64_t *)v59);
    outlined retain of UpcomingIntervalModel((uint64_t *)&v62);
    BOOL v47 = specialized VoiceFeedbackAlerting.hasValidAlertType(in:)(a1);
    swift_bridgeObjectRelease();
    outlined release of UpcomingIntervalModel((uint64_t *)&v62);
    if (v47)
    {
      v57[10] = v72[0];
      v57[11] = v72[1];
      __int16 v58 = v73;
      v57[6] = v68;
      v57[7] = v69;
      v57[8] = v70;
      v57[9] = v71;
      v57[2] = v64;
      v57[3] = v65;
      v57[4] = v66;
      v57[5] = v67;
      v57[0] = v62;
      v57[1] = v63;
      closure #1 in default argument 1 of OutputGenerationManifest.init(dialogPhase:_:)(v57);
      uint64_t v45 = v57;
      goto LABEL_11;
    }
    outlined release of UpcomingIntervalModel((uint64_t *)&v62);
  }
  else
  {
    long long v30 = v26;
    swift_bridgeObjectRelease();
    uint64_t v31 = (void *)_convertNSErrorToError(_:)();

    swift_willThrow();
    uint64_t v32 = v52;
    swift_beginAccess();
    v50(v7, v32, v3);
    id v33 = v31;
    id v34 = v31;
    uint64_t v35 = Logger.logObject.getter();
    os_log_type_t v36 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = swift_slowAlloc();
      uint64_t v38 = swift_slowAlloc();
      uint64_t v52 = v7;
      uint64_t v39 = (void *)v38;
      uint64_t v40 = swift_slowAlloc();
      v87[0] = v40;
      *(_DWORD *)uint64_t v37 = 136315394;
      *(void *)&long long v55 = v3;
      *(void *)&long long v74 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000015, 0x80000002619DB6F0, v87);
      uint64_t v54 = v4;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v37 + 12) = 2112;
      id v41 = v31;
      uint64_t v42 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)&long long v74 = v42;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v39 = v42;
      MEMORY[0x263E47CC0](v31);
      MEMORY[0x263E47CC0](v31);
      _os_log_impl(&dword_261998000, v35, v36, "Error decoding %s: %@", (uint8_t *)v37, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      MEMORY[0x263E47E50](v39, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x263E47E50](v40, -1, -1);
      MEMORY[0x263E47E50](v37, -1, -1);

      MEMORY[0x263E47CC0](v31);
      uint64_t v43 = v55;
      uint64_t v44 = v52;
    }
    else
    {
      MEMORY[0x263E47CC0](v31);
      MEMORY[0x263E47CC0](v31);
      MEMORY[0x263E47CC0](v31);

      uint64_t v44 = v7;
      uint64_t v43 = v3;
    }
    v53(v44, v43);
  }
  _s20WorkoutAnnouncements21UpcomingIntervalModelVSgWOi0_((uint64_t)&v74);
  uint64_t v45 = &v74;
LABEL_11:
  outlined init with take of BelowTargetZoneModel?((uint64_t)v45, (uint64_t)v87, &demangling cache variable for type metadata for UpcomingIntervalModel?);
  return outlined init with take of BelowTargetZoneModel?((uint64_t)v87, v56, &demangling cache variable for type metadata for UpcomingIntervalModel?);
}

uint64_t specialized static UpcomingIntervalModel.__derived_struct_equals(_:_:)(uint64_t *a1, uint64_t *a2)
{
  if (*(unsigned __int8 *)a1 != *(unsigned __int8 *)a2) {
    return 0;
  }
  uint64_t v4 = a1[1];
  uint64_t v5 = a1[2];
  uint64_t v6 = a1[3];
  uint64_t v7 = a1[4];
  uint64_t v8 = a1[5];
  uint64_t v9 = a1[6];
  uint64_t v10 = a1[7];
  uint64_t v11 = a1[8];
  uint64_t v12 = a1[9];
  uint64_t v14 = a1[10];
  uint64_t v13 = a1[11];
  __int16 v15 = *((_WORD *)a1 + 48);
  uint64_t v17 = a2[1];
  uint64_t v16 = a2[2];
  uint64_t v18 = a2[3];
  uint64_t v19 = a2[4];
  uint64_t v21 = a2[5];
  uint64_t v20 = a2[6];
  uint64_t v22 = a2[7];
  uint64_t v23 = a2[8];
  uint64_t v24 = a2[9];
  uint64_t v25 = a2[10];
  uint64_t v26 = a2[11];
  __int16 v27 = *((_WORD *)a2 + 48);
  if (v7 == 1)
  {
    if (v19 == 1)
    {
LABEL_4:
      uint64_t v28 = a1[16];
      int v29 = *((unsigned __int8 *)a1 + 136);
      long long v30 = *((_OWORD *)a1 + 9);
      uint64_t v31 = a1[20];
      uint64_t v32 = a1[21];
      uint64_t v34 = a1[22];
      uint64_t v33 = a1[23];
      __int16 v35 = *((_WORD *)a1 + 96);
      uint64_t v36 = a2[16];
      int v37 = *((unsigned __int8 *)a2 + 136);
      long long v38 = *((_OWORD *)a2 + 9);
      uint64_t v39 = a2[20];
      uint64_t v40 = a2[21];
      uint64_t v42 = a2[22];
      uint64_t v41 = a2[23];
      __int16 v43 = *((_WORD *)a2 + 96);
      if (a1[14])
      {
        if ((a2[14] & 1) == 0) {
          return 0;
        }
      }
      else if ((a2[14] & 1) != 0 || *((double *)a1 + 13) != *((double *)a2 + 13))
      {
        return 0;
      }
      if (v28)
      {
        if (!v36) {
          return 0;
        }
        if (a1[15] != a2[15] || v28 != v36)
        {
          uint64_t v61 = a2[23];
          uint64_t v48 = a1[23];
          long long v63 = v38;
          uint64_t v49 = v39;
          long long v59 = v30;
          uint64_t v57 = v31;
          char v50 = _stringCompareWithSmolCheck(_:_:expecting:)();
          uint64_t v31 = v57;
          long long v30 = v59;
          long long v38 = v63;
          uint64_t v41 = v61;
          if ((v50 & 1) == 0) {
            return 0;
          }
          uint64_t v39 = v49;
          uint64_t v33 = v48;
        }
      }
      else if (v36)
      {
        return 0;
      }
      if (v29 == v37)
      {
        if (v32)
        {
          if (v40)
          {
            long long v89 = v30;
            uint64_t v90 = v31;
            uint64_t v91 = v32;
            __int16 v92 = v34;
            uint64_t v93 = v33;
            __int16 v94 = v35 & 0x101;
            long long v95 = v38;
            uint64_t v96 = v39;
            uint64_t v97 = v40;
            __int16 v98 = v42;
            uint64_t v99 = v41;
            __int16 v100 = v43 & 0x101;
            if (specialized static VoiceFeedbackTargetZone.__derived_struct_equals(_:_:)((uint64_t)&v89, (uint64_t)&v95)) {
              return 1;
            }
          }
        }
        else if (!v40)
        {
          return 1;
        }
      }
      return 0;
    }
LABEL_9:
    uint64_t v65 = v4;
    uint64_t v66 = v5;
    uint64_t v67 = v6;
    uint64_t v68 = v7;
    uint64_t v69 = v8;
    uint64_t v70 = v9;
    uint64_t v71 = v10;
    uint64_t v72 = v11;
    uint64_t v73 = v12;
    uint64_t v74 = v14;
    uint64_t v75 = v13;
    __int16 v76 = v15;
    uint64_t v77 = v17;
    uint64_t v78 = v16;
    uint64_t v79 = v18;
    uint64_t v80 = v19;
    uint64_t v81 = v21;
    uint64_t v82 = v20;
    uint64_t v83 = v22;
    uint64_t v84 = v23;
    uint64_t v85 = v24;
    uint64_t v86 = v25;
    uint64_t v87 = v26;
    __int16 v88 = v27;
    uint64_t v44 = v16;
    uint64_t v45 = v18;
    uint64_t v46 = v19;
    outlined copy of VoiceFeedbackWorkoutStep?(v4, v5, v6, v7);
    outlined copy of VoiceFeedbackWorkoutStep?(v17, v44, v45, v46);
    outlined release of (VoiceFeedbackWorkoutStep?, VoiceFeedbackWorkoutStep?)(&v65);
    return 0;
  }
  if (v19 == 1) {
    goto LABEL_9;
  }
  if (v5)
  {
    if ((v16 & 1) == 0) {
      return 0;
    }
  }
  else if ((v16 & 1) != 0 || *(double *)&v4 != *(double *)&v17)
  {
    return 0;
  }
  if (!v7)
  {
    if (v19) {
      return 0;
    }
LABEL_38:
    if (v21 != v8) {
      return 0;
    }
    goto LABEL_39;
  }
  if (!v19) {
    return 0;
  }
  if (v6 == v18 && v7 == v19) {
    goto LABEL_38;
  }
  uint64_t v52 = a1[11];
  __int16 v53 = *((_WORD *)a1 + 48);
  uint64_t v54 = a1[6];
  uint64_t v55 = a1[7];
  uint64_t v56 = a2[10];
  __int16 v58 = *((_WORD *)a2 + 48);
  uint64_t v60 = a2[9];
  uint64_t v62 = a2[6];
  uint64_t v64 = a2[7];
  char v51 = _stringCompareWithSmolCheck(_:_:expecting:)();
  uint64_t result = 0;
  if (v51)
  {
    uint64_t v20 = v62;
    uint64_t v22 = v64;
    uint64_t v24 = v60;
    __int16 v27 = v58;
    uint64_t v10 = v55;
    LOWORD(v25) = v56;
    uint64_t v9 = v54;
    __int16 v15 = v53;
    uint64_t v13 = v52;
    if (v21 == v8)
    {
LABEL_39:
      if (v12)
      {
        if (!v24) {
          return 0;
        }
        v101[0] = v9;
        v101[1] = v10;
        v101[2] = v11;
        v101[3] = v12;
        __int16 v102 = v14;
        uint64_t v103 = v13;
        __int16 v104 = v15 & 0x101;
        uint64_t v65 = v20;
        uint64_t v66 = v22;
        uint64_t v67 = v23;
        uint64_t v68 = v24;
        LOWORD(v69) = v25;
        uint64_t v70 = v26;
        LOWORD(v71) = v27 & 0x101;
        if ((specialized static VoiceFeedbackTargetZone.__derived_struct_equals(_:_:)((uint64_t)v101, (uint64_t)&v65) & 1) == 0) {
          return 0;
        }
      }
      else if (v24)
      {
        return 0;
      }
      goto LABEL_4;
    }
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type UpcomingIntervalModel.CodingKeys and conformance UpcomingIntervalModel.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type UpcomingIntervalModel.CodingKeys and conformance UpcomingIntervalModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type UpcomingIntervalModel.CodingKeys and conformance UpcomingIntervalModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UpcomingIntervalModel.CodingKeys and conformance UpcomingIntervalModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type UpcomingIntervalModel.CodingKeys and conformance UpcomingIntervalModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type UpcomingIntervalModel.CodingKeys and conformance UpcomingIntervalModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UpcomingIntervalModel.CodingKeys and conformance UpcomingIntervalModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type UpcomingIntervalModel.CodingKeys and conformance UpcomingIntervalModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type UpcomingIntervalModel.CodingKeys and conformance UpcomingIntervalModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UpcomingIntervalModel.CodingKeys and conformance UpcomingIntervalModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type UpcomingIntervalModel.CodingKeys and conformance UpcomingIntervalModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type UpcomingIntervalModel.CodingKeys and conformance UpcomingIntervalModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UpcomingIntervalModel.CodingKeys and conformance UpcomingIntervalModel.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type VoiceFeedbackWorkoutStep and conformance VoiceFeedbackWorkoutStep()
{
  unint64_t result = lazy protocol witness table cache variable for type VoiceFeedbackWorkoutStep and conformance VoiceFeedbackWorkoutStep;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackWorkoutStep and conformance VoiceFeedbackWorkoutStep)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackWorkoutStep and conformance VoiceFeedbackWorkoutStep);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type VoiceFeedbackWorkoutStep and conformance VoiceFeedbackWorkoutStep;
  if (!lazy protocol witness table cache variable for type VoiceFeedbackWorkoutStep and conformance VoiceFeedbackWorkoutStep)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type VoiceFeedbackWorkoutStep and conformance VoiceFeedbackWorkoutStep);
  }
  return result;
}

uint64_t specialized UpcomingIntervalModel.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x7079547472656C61 && a2 == 0xE900000000000065;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6574656C706D6F63 && a2 == 0xED00007065745364 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x706574537478656ELL && a2 == 0xE800000000000000)
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

uint64_t *specialized UpcomingIntervalModel.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<UpcomingIntervalModel.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a1[3];
  __int16 v43 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v9);
  lazy protocol witness table accessor for type UpcomingIntervalModel.CodingKeys and conformance UpcomingIntervalModel.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
  {
    int v45 = 0;
    uint64_t v46 = 0;
    uint64_t v47 = 0;
    uint64_t v48 = 0;
    uint64_t v49 = 0;
    uint64_t v44 = 0;
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v43);
    return (uint64_t *)outlined consume of VoiceFeedbackWorkoutStep?(0, v44, v49, 1);
  }
  else
  {
    uint64_t v42 = v6;
    LOBYTE(v50) = 0;
    lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    int v10 = v63;
    LOBYTE(v50) = 1;
    lazy protocol witness table accessor for type VoiceFeedbackWorkoutStep and conformance VoiceFeedbackWorkoutStep();
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
    char v96 = 2;
    int v45 = (unsigned __int16)v72;
    uint64_t v46 = v71;
    uint64_t v47 = v70;
    uint64_t v48 = v69;
    uint64_t v11 = v63;
    uint64_t v44 = v64;
    uint64_t v49 = v65;
    uint64_t v12 = v66;
    uint64_t v39 = v67;
    uint64_t v40 = *(void *)&v68[16];
    long long v41 = *(_OWORD *)v68;
    outlined copy of VoiceFeedbackWorkoutStep?(v63, v64, v65, v66);
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, uint64_t))(v42 + 8))(v8, v5);
    uint64_t v29 = v86;
    uint64_t v42 = v88;
    uint64_t v38 = v89;
    int v37 = v90;
    uint64_t v35 = *((void *)&v91 + 1);
    uint64_t v36 = v91;
    uint64_t v33 = *((void *)&v92 + 1);
    uint64_t v34 = v92;
    uint64_t v31 = *((void *)&v93 + 1);
    uint64_t v32 = v93;
    int v30 = v94;
    char v95 = v87;
    LOBYTE(v50) = v10;
    uint64_t v27 = v11;
    *((void *)&v50 + 1) = v11;
    *(void *)&long long v51 = v44;
    *((void *)&v51 + 1) = v49;
    *(void *)&long long v52 = v12;
    uint64_t v13 = v12;
    int v28 = v10;
    *((void *)&v52 + 1) = v39;
    long long v53 = v41;
    *(void *)&long long v54 = v40;
    *((void *)&v54 + 1) = v48;
    *(void *)&long long v55 = v47;
    *((void *)&v55 + 1) = v46;
    LOWORD(v56) = v45;
    *((void *)&v56 + 1) = v86;
    LOBYTE(v57) = v87;
    *((void *)&v57 + 1) = v88;
    *(void *)&long long v58 = v89;
    BYTE8(v58) = v90;
    long long v59 = v91;
    long long v60 = v92;
    long long v61 = v93;
    unsigned __int16 v62 = v94;
    outlined retain of UpcomingIntervalModel((uint64_t *)&v50);
    uint64_t v14 = v27;
    uint64_t v15 = v44;
    uint64_t v16 = v49;
    uint64_t v17 = v39;
    uint64_t v18 = v40;
    outlined consume of VoiceFeedbackWorkoutStep?(v27, v44, v49, v13);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v43);
    LOBYTE(v63) = v28;
    uint64_t v64 = v14;
    uint64_t v65 = v15;
    uint64_t v66 = v16;
    uint64_t v67 = v13;
    *(void *)uint64_t v68 = v17;
    *(_OWORD *)&v68[8] = v41;
    uint64_t v69 = v18;
    uint64_t v70 = v48;
    uint64_t v71 = v47;
    uint64_t v72 = v46;
    __int16 v73 = v45;
    uint64_t v74 = v29;
    char v75 = v95;
    uint64_t v76 = v42;
    uint64_t v77 = v38;
    char v78 = v37;
    uint64_t v79 = v36;
    uint64_t v80 = v35;
    uint64_t v81 = v34;
    uint64_t v82 = v33;
    uint64_t v83 = v32;
    uint64_t v84 = v31;
    __int16 v85 = v30;
    unint64_t result = outlined release of UpcomingIntervalModel(&v63);
    long long v20 = v61;
    *(_OWORD *)(a2 + 160) = v60;
    *(_OWORD *)(a2 + 176) = v20;
    *(_WORD *)(a2 + 192) = v62;
    long long v21 = v57;
    *(_OWORD *)(a2 + 96) = v56;
    *(_OWORD *)(a2 + 112) = v21;
    long long v22 = v59;
    *(_OWORD *)(a2 + 128) = v58;
    *(_OWORD *)(a2 + 144) = v22;
    long long v23 = v53;
    *(_OWORD *)(a2 + 32) = v52;
    *(_OWORD *)(a2 + 48) = v23;
    long long v24 = v55;
    *(_OWORD *)(a2 + 64) = v54;
    *(_OWORD *)(a2 + 80) = v24;
    long long v25 = v51;
    *(_OWORD *)a2 = v50;
    *(_OWORD *)(a2 + 16) = v25;
  }
  return result;
}

unint64_t instantiation function for generic protocol witness table for UpcomingIntervalModel(void *a1)
{
  a1[1] = lazy protocol witness table accessor for type UpcomingIntervalModel and conformance UpcomingIntervalModel();
  a1[2] = lazy protocol witness table accessor for type UpcomingIntervalModel and conformance UpcomingIntervalModel();
  unint64_t result = lazy protocol witness table accessor for type UpcomingIntervalModel and conformance UpcomingIntervalModel();
  a1[3] = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type UpcomingIntervalModel and conformance UpcomingIntervalModel()
{
  unint64_t result = lazy protocol witness table cache variable for type UpcomingIntervalModel and conformance UpcomingIntervalModel;
  if (!lazy protocol witness table cache variable for type UpcomingIntervalModel and conformance UpcomingIntervalModel)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UpcomingIntervalModel and conformance UpcomingIntervalModel);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type UpcomingIntervalModel and conformance UpcomingIntervalModel;
  if (!lazy protocol witness table cache variable for type UpcomingIntervalModel and conformance UpcomingIntervalModel)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UpcomingIntervalModel and conformance UpcomingIntervalModel);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type UpcomingIntervalModel and conformance UpcomingIntervalModel;
  if (!lazy protocol witness table cache variable for type UpcomingIntervalModel and conformance UpcomingIntervalModel)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UpcomingIntervalModel and conformance UpcomingIntervalModel);
  }
  return result;
}

uint64_t destroy for UpcomingIntervalModel(uint64_t a1)
{
  if (*(void *)(a1 + 32) != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for UpcomingIntervalModel(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = a1 + 8;
  uint64_t v5 = (_OWORD *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 32);
  if (v6 == 1)
  {
    long long v7 = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(v4 + 32) = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(v4 + 48) = v7;
    *(_OWORD *)(v4 + 64) = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(v4 + 74) = *(_OWORD *)(a2 + 82);
    long long v8 = *(_OWORD *)(a2 + 24);
    *(_OWORD *)uint64_t v4 = *v5;
    *(_OWORD *)(v4 + 16) = v8;
  }
  else
  {
    *(void *)uint64_t v4 = *(void *)v5;
    *(unsigned char *)(v4 + 8) = *(unsigned char *)(a2 + 16);
    *(void *)(a1 + 24) = *(void *)(a2 + 24);
    *(void *)(a1 + 32) = v6;
    *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    uint64_t v9 = *(void *)(a2 + 72);
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
    *(void *)(a1 + 72) = v9;
    *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
    *(unsigned char *)(a1 + 81) = *(unsigned char *)(a2 + 81);
    *(void *)(a1 + 88) = *(void *)(a2 + 88);
    *(_WORD *)(a1 + 96) = *(_WORD *)(a2 + 96);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  uint64_t v10 = *(void *)(a2 + 128);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = v10;
  *(unsigned char *)(a1 + 136) = *(unsigned char *)(a2 + 136);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  uint64_t v11 = *(void *)(a2 + 168);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = v11;
  *(unsigned char *)(a1 + 176) = *(unsigned char *)(a2 + 176);
  *(unsigned char *)(a1 + 177) = *(unsigned char *)(a2 + 177);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  *(_WORD *)(a1 + 192) = *(_WORD *)(a2 + 192);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for UpcomingIntervalModel(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = (_OWORD *)(a1 + 8);
  uint64_t v5 = (_OWORD *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 32);
  if (*(void *)(a1 + 32) == 1)
  {
    if (v6 == 1)
    {
      long long v7 = *(_OWORD *)(a2 + 24);
      *uint64_t v4 = *v5;
      *(_OWORD *)(a1 + 24) = v7;
      long long v8 = *(_OWORD *)(a2 + 40);
      long long v9 = *(_OWORD *)(a2 + 56);
      long long v10 = *(_OWORD *)(a2 + 72);
      *(_OWORD *)(a1 + 82) = *(_OWORD *)(a2 + 82);
      *(_OWORD *)(a1 + 56) = v9;
      *(_OWORD *)(a1 + 72) = v10;
      *(_OWORD *)(a1 + 40) = v8;
    }
    else
    {
      uint64_t v15 = *(void *)v5;
      *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
      *(void *)uint64_t v4 = v15;
      *(void *)(a1 + 24) = *(void *)(a2 + 24);
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
      *(void *)(a1 + 48) = *(void *)(a2 + 48);
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      *(void *)(a1 + 64) = *(void *)(a2 + 64);
      *(void *)(a1 + 72) = *(void *)(a2 + 72);
      *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
      *(unsigned char *)(a1 + 81) = *(unsigned char *)(a2 + 81);
      uint64_t v16 = *(void *)(a2 + 88);
      *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
      *(void *)(a1 + 88) = v16;
      *(unsigned char *)(a1 + 97) = *(unsigned char *)(a2 + 97);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
  }
  else if (v6 == 1)
  {
    outlined destroy of VoiceFeedbackWorkoutStep(a1 + 8);
    long long v11 = v5[1];
    *uint64_t v4 = *v5;
    v4[1] = v11;
    long long v13 = v5[3];
    long long v12 = v5[4];
    long long v14 = v5[2];
    *(_OWORD *)((char *)v4 + 74) = *(_OWORD *)((char *)v5 + 74);
    v4[3] = v13;
    v4[4] = v12;
    v4[2] = v14;
  }
  else
  {
    uint64_t v17 = *(void *)v5;
    *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
    *(void *)uint64_t v4 = v17;
    *(void *)(a1 + 24) = *(void *)(a2 + 24);
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
    *(void *)(a1 + 72) = *(void *)(a2 + 72);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
    *(unsigned char *)(a1 + 81) = *(unsigned char *)(a2 + 81);
    uint64_t v18 = *(void *)(a2 + 88);
    *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
    *(void *)(a1 + 88) = v18;
    *(unsigned char *)(a1 + 97) = *(unsigned char *)(a2 + 97);
  }
  uint64_t v19 = *(void *)(a2 + 104);
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  *(void *)(a1 + 104) = v19;
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 136) = *(unsigned char *)(a2 + 136);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 176) = *(unsigned char *)(a2 + 176);
  *(unsigned char *)(a1 + 177) = *(unsigned char *)(a2 + 177);
  uint64_t v20 = *(void *)(a2 + 184);
  *(unsigned char *)(a1 + 192) = *(unsigned char *)(a2 + 192);
  *(void *)(a1 + 184) = v20;
  *(unsigned char *)(a1 + 193) = *(unsigned char *)(a2 + 193);
  return a1;
}

uint64_t outlined destroy of VoiceFeedbackWorkoutStep(uint64_t a1)
{
  return a1;
}

__n128 __swift_memcpy194_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v2 = *(_OWORD *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  long long v5 = *(_OWORD *)(a2 + 80);
  long long v6 = *(_OWORD *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v7;
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 96) = v6;
  __n128 result = *(__n128 *)(a2 + 144);
  long long v9 = *(_OWORD *)(a2 + 160);
  long long v10 = *(_OWORD *)(a2 + 176);
  *(_WORD *)(a1 + 192) = *(_WORD *)(a2 + 192);
  *(_OWORD *)(a1 + 160) = v9;
  *(_OWORD *)(a1 + 176) = v10;
  *(__n128 *)(a1 + 144) = result;
  return result;
}

uint64_t assignWithTake for UpcomingIntervalModel(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = a1 + 8;
  uint64_t v5 = a2 + 8;
  if (*(void *)(a1 + 32) != 1)
  {
    uint64_t v6 = *(void *)(a2 + 32);
    if (v6 != 1)
    {
      *(void *)uint64_t v4 = *(void *)v5;
      *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
      *(void *)(a1 + 24) = *(void *)(a2 + 24);
      *(void *)(a1 + 32) = v6;
      swift_bridgeObjectRelease();
      *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
      *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
      uint64_t v9 = *(void *)(a2 + 72);
      *(void *)(a1 + 64) = *(void *)(a2 + 64);
      *(void *)(a1 + 72) = v9;
      swift_bridgeObjectRelease();
      *(_WORD *)(a1 + 80) = *(_WORD *)(a2 + 80);
      *(void *)(a1 + 88) = *(void *)(a2 + 88);
      *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
      *(unsigned char *)(a1 + 97) = *(unsigned char *)(a2 + 97);
      goto LABEL_6;
    }
    outlined destroy of VoiceFeedbackWorkoutStep(v4);
  }
  long long v7 = *(_OWORD *)(v5 + 48);
  *(_OWORD *)(v4 + 32) = *(_OWORD *)(v5 + 32);
  *(_OWORD *)(v4 + 48) = v7;
  *(_OWORD *)(v4 + 64) = *(_OWORD *)(v5 + 64);
  *(_OWORD *)(v4 + 74) = *(_OWORD *)(v5 + 74);
  long long v8 = *(_OWORD *)(v5 + 16);
  *(_OWORD *)uint64_t v4 = *(_OWORD *)v5;
  *(_OWORD *)(v4 + 16) = v8;
LABEL_6:
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  uint64_t v10 = *(void *)(a2 + 128);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = v10;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 136) = *(unsigned char *)(a2 + 136);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  uint64_t v11 = *(void *)(a2 + 168);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = v11;
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 176) = *(_WORD *)(a2 + 176);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  *(unsigned char *)(a1 + 192) = *(unsigned char *)(a2 + 192);
  *(unsigned char *)(a1 + 193) = *(unsigned char *)(a2 + 193);
  return a1;
}

uint64_t getEnumTagSinglePayload for UpcomingIntervalModel(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 194)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 128);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for UpcomingIntervalModel(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 184) = 0;
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
    *(_WORD *)(result + 192) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 194) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 194) = 0;
    }
    if (a2) {
      *(void *)(result + 128) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UpcomingIntervalModel()
{
  return &type metadata for UpcomingIntervalModel;
}

unsigned char *storeEnumTagSinglePayload for UpcomingIntervalModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2619D5AA8);
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

void *type metadata accessor for UpcomingIntervalModel.CodingKeys()
{
  return &unk_270D9C5F8;
}

uint64_t *outlined retain of UpcomingIntervalModel(uint64_t *a1)
{
  return a1;
}

uint64_t outlined copy of VoiceFeedbackWorkoutStep?(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4 != 1)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t *outlined release of UpcomingIntervalModel(uint64_t *a1)
{
  return a1;
}

uint64_t outlined consume of VoiceFeedbackWorkoutStep?(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4 != 1)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t outlined destroy of WorkoutVoiceFeedbackIntervalUpcomingNonPaceParameters(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t outlined destroy of SpeakableString?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SpeakableString?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t *outlined release of (VoiceFeedbackWorkoutStep?, VoiceFeedbackWorkoutStep?)(uint64_t *a1)
{
  uint64_t v2 = a1[13];
  uint64_t v6 = a1[12];
  uint64_t v3 = a1[14];
  uint64_t v4 = a1[15];
  outlined consume of VoiceFeedbackWorkoutStep?(*a1, a1[1], a1[2], a1[3]);
  outlined consume of VoiceFeedbackWorkoutStep?(v6, v2, v3, v4);
  return a1;
}

double _s20WorkoutAnnouncements21UpcomingIntervalModelVSgWOi0_(uint64_t a1)
{
  double result = 0.0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(void *)(a1 + 128) = 1;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_OWORD *)(a1 + 168) = 0u;
  *(_OWORD *)(a1 + 178) = 0u;
  return result;
}

uint64_t EnteredTargetZoneModel.alertType.getter()
{
  return *v0;
}

uint64_t EnteredTargetZoneModel.alertType.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*EnteredTargetZoneModel.alertType.modify())()
{
  return closure #1 in default argument 1 of OutputGenerationManifest.init(dialogPhase:_:);
}

void __swiftcall EnteredTargetZoneModel.init(magnitude:unit:targetZone:)(WorkoutAnnouncements::EnteredTargetZoneModel *__return_ptr retstr, Swift::Double magnitude, Swift::String unit, WorkoutAnnouncements::VoiceFeedbackTargetZone *targetZone)
{
  object = unit._object;
  uint64_t countAndFlagsBits = unit._countAndFlagsBits;
  outlined release of AboveTargetZoneModel((uint64_t)targetZone);
  Swift::Bool isSingleThreshold = targetZone->isSingleThreshold;
  WorkoutAnnouncements::VoiceFeedbackPaceFormat value = targetZone->paceFormat.value;
  WorkoutAnnouncements::VoiceFeedbackMetricType metricType = targetZone->metricType;
  retstr->alertType = WorkoutAnnouncements_VoiceFeedbackAlertType_zoneEntered;
  retstr->magnitude = magnitude;
  retstr->unit._uint64_t countAndFlagsBits = countAndFlagsBits;
  retstr->unit._object = object;
  retstr->Swift::Bool isSingleThreshold = isSingleThreshold;
  retstr->paceFormat.WorkoutAnnouncements::VoiceFeedbackPaceFormat value = value;
  retstr->WorkoutAnnouncements::VoiceFeedbackMetricType metricType = metricType;
}

unint64_t EnteredTargetZoneModel.CodingKeys.stringValue.getter(char a1)
{
  unint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x647574696E67616DLL;
      break;
    case 2:
      unint64_t result = 1953066613;
      break;
    case 3:
      return result;
    case 4:
      unint64_t result = 0x6D726F4665636170;
      break;
    case 5:
      unint64_t result = 0x795463697274656DLL;
      break;
    default:
      unint64_t result = 0x7079547472656C61;
      break;
  }
  return result;
}

unint64_t protocol witness for CodingKey.stringValue.getter in conformance EnteredTargetZoneModel.CodingKeys()
{
  return EnteredTargetZoneModel.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance EnteredTargetZoneModel.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type EnteredTargetZoneModel.CodingKeys and conformance EnteredTargetZoneModel.CodingKeys();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance EnteredTargetZoneModel.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type EnteredTargetZoneModel.CodingKeys and conformance EnteredTargetZoneModel.CodingKeys();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t EnteredTargetZoneModel.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<EnteredTargetZoneModel.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  long long v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type EnteredTargetZoneModel.CodingKeys and conformance EnteredTargetZoneModel.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v11[5] = *v3;
  v11[4] = 0;
  lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType();
  KeyedEncodingContainer.encode<A>(_:forKey:)();
  if (!v2)
  {
    v11[3] = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
    v11[2] = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
    v11[1] = 3;
    KeyedEncodingContainer.encode(_:forKey:)();
    outlined init with take of VoiceFeedbackPaceFormat?((uint64_t)(v3 + 33), (uint64_t)&v12);
    outlined init with take of VoiceFeedbackPaceFormat?((uint64_t)&v12, (uint64_t)v11);
    v10[8] = 4;
    lazy protocol witness table accessor for type VoiceFeedbackPaceFormat and conformance VoiceFeedbackPaceFormat();
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
    v10[7] = v3[34];
    v10[6] = 5;
    lazy protocol witness table accessor for type VoiceFeedbackMetricType and conformance VoiceFeedbackMetricType();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

double EnteredTargetZoneModel.init(from:)@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  specialized EnteredTargetZoneModel.init(from:)(a1, (uint64_t)&v6);
  if (!v2)
  {
    double result = *(double *)&v6;
    long long v5 = *(_OWORD *)v7;
    *(_OWORD *)a2 = v6;
    *(_OWORD *)(a2 + 16) = v5;
    *(_DWORD *)(a2 + 31) = *(_DWORD *)&v7[15];
  }
  return result;
}

double protocol witness for Decodable.init(from:) in conformance EnteredTargetZoneModel@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  specialized EnteredTargetZoneModel.init(from:)(a1, (uint64_t)&v6);
  if (!v2)
  {
    double result = *(double *)&v6;
    long long v5 = *(_OWORD *)v7;
    *(_OWORD *)a2 = v6;
    *(_OWORD *)(a2 + 16) = v5;
    *(_DWORD *)(a2 + 31) = *(_DWORD *)&v7[15];
  }
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance EnteredTargetZoneModel(void *a1)
{
  return EnteredTargetZoneModel.encode(to:)(a1);
}

uint64_t EnteredTargetZoneModel.executePattern(wrapper:)(uint64_t a1)
{
  v2[6] = a1;
  v2[7] = v1;
  uint64_t v3 = type metadata accessor for Logger();
  v2[8] = v3;
  v2[9] = *(void *)(v3 - 8);
  v2[10] = swift_task_alloc();
  return MEMORY[0x270FA2498](EnteredTargetZoneModel.executePattern(wrapper:), 0, 0);
}

uint64_t EnteredTargetZoneModel.executePattern(wrapper:)()
{
  uint64_t v35 = v0;
  if (one-time initialization token for noPaceFormatMetrics != -1) {
    swift_once();
  }
  unsigned __int8 v1 = *(unsigned char *)(*(void *)(v0 + 56) + 34);
  BOOL v2 = specialized Sequence<>.contains(_:)(v1, (uint64_t)noPaceFormatMetrics._rawValue);
  uint64_t v3 = *(void *)(v0 + 56);
  if (v2)
  {
    uint64_t v4 = *__swift_project_boxed_opaque_existential_1(*(void **)(v0 + 48), *(void *)(*(void *)(v0 + 48) + 24));
    outlined retain of AboveTargetZoneModel(v3);
    uint64_t v33 = (uint64_t (*)(char, uint64_t, uint64_t))((char *)&async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneEnteredNonPace(executeSashGroupOnWatch:_:)
                                                         + async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneEnteredNonPace(executeSashGroupOnWatch:_:));
    uint64_t v5 = (void *)swift_task_alloc();
    *(void *)(v0 + 88) = v5;
    *uint64_t v5 = v0;
    v5[1] = AboveTargetZoneModel.executePattern(wrapper:);
    uint64_t v6 = *(void *)(v0 + 56);
    uint64_t v7 = v4;
LABEL_16:
    return v33(0, v7, v6);
  }
  outlined init with take of VoiceFeedbackPaceFormat?(v3 + 33, v0 + 113);
  outlined init with take of VoiceFeedbackPaceFormat?(v0 + 113, v0 + 112);
  int v8 = *(unsigned __int8 *)(v0 + 112);
  if (v8 != 2)
  {
    uint64_t v25 = *(void *)(v0 + 56);
    uint64_t v26 = *__swift_project_boxed_opaque_existential_1(*(void **)(v0 + 48), *(void *)(*(void *)(v0 + 48) + 24));
    outlined retain of AboveTargetZoneModel(v25);
    if (v8)
    {
      uint64_t v33 = (uint64_t (*)(char, uint64_t, uint64_t))((char *)&async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneEnteredPace(executeSashGroupOnWatch:_:)
                                                           + async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneEnteredPace(executeSashGroupOnWatch:_:));
      uint64_t v27 = (void *)swift_task_alloc();
      *(void *)(v0 + 104) = v27;
      *uint64_t v27 = v0;
      int v28 = AboveTargetZoneModel.executePattern(wrapper:);
    }
    else
    {
      uint64_t v33 = (uint64_t (*)(char, uint64_t, uint64_t))((char *)&async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneEnteredSpeed(executeSashGroupOnWatch:_:)
                                                           + async function pointer to specialized WorkoutVoiceFeedbackCATPatternsExecutor.zoneEnteredSpeed(executeSashGroupOnWatch:_:));
      uint64_t v27 = (void *)swift_task_alloc();
      *(void *)(v0 + 96) = v27;
      *uint64_t v27 = v0;
      int v28 = AboveTargetZoneModel.executePattern(wrapper:);
    }
    v27[1] = v28;
    uint64_t v6 = *(void *)(v0 + 56);
    uint64_t v7 = v26;
    goto LABEL_16;
  }
  uint64_t v10 = *(void *)(v0 + 72);
  uint64_t v9 = *(void *)(v0 + 80);
  uint64_t v12 = *(void *)(v0 + 56);
  uint64_t v11 = *(void *)(v0 + 64);
  uint64_t v13 = Logger.workout.unsafeMutableAddressor();
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v9, v13, v11);
  outlined retain of AboveTargetZoneModel(v12);
  outlined retain of AboveTargetZoneModel(v12);
  long long v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.error.getter();
  BOOL v16 = os_log_type_enabled(v14, v15);
  uint64_t v18 = *(void *)(v0 + 72);
  uint64_t v17 = *(void *)(v0 + 80);
  uint64_t v20 = *(void *)(v0 + 56);
  uint64_t v19 = *(void *)(v0 + 64);
  if (v16)
  {
    uint64_t v32 = *(void *)(v0 + 64);
    long long v21 = (uint8_t *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    uint64_t v34 = v22;
    *(_DWORD *)long long v21 = 136315138;
    *(unsigned char *)(v0 + 114) = v1;
    uint64_t v23 = String.init<A>(describing:)();
    *(void *)(v0 + 40) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v23, v24, &v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    outlined release of AboveTargetZoneModel(v20);
    outlined release of AboveTargetZoneModel(v20);
    _os_log_impl(&dword_261998000, v14, v15, "EnteredTargetZoneModel needs a pace format for: %s", v21, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x263E47E50](v22, -1, -1);
    MEMORY[0x263E47E50](v21, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v32);
  }
  else
  {
    outlined release of AboveTargetZoneModel(*(void *)(v0 + 56));
    outlined release of AboveTargetZoneModel(v20);

    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
  }
  lazy protocol witness table accessor for type VoiceFeedbackErrors and conformance VoiceFeedbackErrors();
  swift_allocError();
  *uint64_t v29 = 1;
  swift_willThrow();
  swift_task_dealloc();
  int v30 = *(uint64_t (**)(void))(v0 + 8);
  return v30();
}

uint64_t protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance EnteredTargetZoneModel(uint64_t a1)
{
  long long v4 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v2 + 32) = v4;
  *(_DWORD *)(v2 + 47) = *(_DWORD *)(v1 + 31);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 56) = v5;
  *uint64_t v5 = v2;
  v5[1] = protocol witness for VoiceFeedbackPatternResolving.executePattern(wrapper:) in conformance AboveTargetZoneModel;
  return EnteredTargetZoneModel.executePattern(wrapper:)(a1);
}

uint64_t specialized EnteredTargetZoneModel.init(with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(specialized Sequence.compactMap<A>(_:)(a1) + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<VoiceFeedbackKeys, Any>);
    uint64_t v8 = static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v8 = MEMORY[0x263F8EE80];
  }
  *(void *)&long long v51 = v8;
  uint64_t v9 = swift_bridgeObjectRetain();
  specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(v9, 1, &v51);
  swift_bridgeObjectRelease();
  uint64_t v10 = v51;
  uint64_t v11 = Logger.workout.unsafeMutableAddressor();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v11, v4);
  swift_retain_n();
  uint64_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v46 = swift_slowAlloc();
    *(void *)&long long v51 = v46;
    *(_DWORD *)uint64_t v14 = 136315394;
    uint64_t v48 = a1;
    double v49 = COERCE_DOUBLE(getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000016, 0x80000002619DB920, (uint64_t *)&v51));
    uint64_t v47 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v14 + 12) = 2080;
    v44[1] = v14 + 14;
    lazy protocol witness table accessor for type VoiceFeedbackKeys and conformance VoiceFeedbackKeys();
    uint64_t v45 = v4;
    swift_retain();
    uint64_t v15 = Dictionary.description.getter();
    uint64_t v16 = a2;
    unint64_t v18 = v17;
    swift_release();
    double v49 = COERCE_DOUBLE(getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v18, (uint64_t *)&v51));
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    a2 = v16;
    a1 = v48;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_261998000, v12, v13, "%s received VoiceFeedback dictionary: %s", (uint8_t *)v14, 0x16u);
    uint64_t v19 = v46;
    swift_arrayDestroy();
    MEMORY[0x263E47E50](v19, -1, -1);
    MEMORY[0x263E47E50](v14, -1, -1);

    (*(void (**)(char *, uint64_t))(v47 + 8))(v7, v45);
    if (!*(void *)(v10 + 16)) {
      goto LABEL_22;
    }
LABEL_8:
    unint64_t v20 = specialized __RawDictionaryStorage.find<A>(_:)(6);
    if ((v21 & 1) == 0) {
      goto LABEL_22;
    }
    outlined init with copy of Any(*(void *)(v10 + 56) + 32 * v20, (uint64_t)&v51);
    if ((swift_dynamicCast() & 1) == 0) {
      goto LABEL_22;
    }
    if (!*(void *)(v10 + 16)) {
      goto LABEL_22;
    }
    double v22 = v49;
    unint64_t v23 = specialized __RawDictionaryStorage.find<A>(_:)(15);
    if ((v24 & 1) == 0) {
      goto LABEL_22;
    }
    outlined init with copy of Any(*(void *)(v10 + 56) + 32 * v23, (uint64_t)&v51);
    if ((swift_dynamicCast() & 1) == 0) {
      goto LABEL_22;
    }
    uint64_t v25 = v50;
    if (!*(void *)(v10 + 16)) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)&v49;
    unint64_t v27 = specialized __RawDictionaryStorage.find<A>(_:)(5);
    if ((v28 & 1) == 0) {
      goto LABEL_26;
    }
    outlined init with copy of Any(*(void *)(v10 + 56) + 32 * v27, (uint64_t)&v51);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_release();
      swift_bridgeObjectRelease();
      goto LABEL_23;
    }
    if (!*(void *)(v10 + 16)
      || (int v29 = LOBYTE(v49), v30 = specialized __RawDictionaryStorage.find<A>(_:)(7), (v31 & 1) == 0))
    {
LABEL_26:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t result = swift_release();
      goto LABEL_24;
    }
    outlined init with copy of Any(*(void *)(v10 + 56) + 32 * v30, (uint64_t)&v51);
    if ((swift_dynamicCast() & 1) == 0
      || (int v32 = specialized VoiceFeedbackMetricType.init(rawValue:)(*(unint64_t *)&v49), v32 == 8))
    {
      swift_release();
      swift_bridgeObjectRelease();
      goto LABEL_23;
    }
    int v37 = v32;
    if (*(void *)(v10 + 16) && (unint64_t v38 = specialized __RawDictionaryStorage.find<A>(_:)(12), (v39 & 1) != 0))
    {
      outlined init with copy of Any(*(void *)(v10 + 56) + 32 * v38, (uint64_t)&v51);
    }
    else
    {
      long long v51 = 0u;
      long long v52 = 0u;
    }
    swift_release();
    if (*((void *)&v52 + 1))
    {
      if (swift_dynamicCast())
      {
        if (*(void *)&v49 == 1) {
          char v40 = 1;
        }
        else {
          char v40 = 2;
        }
        if (v49 == 0.0) {
          unsigned __int8 v41 = 0;
        }
        else {
          unsigned __int8 v41 = v40;
        }
LABEL_43:
        if (v29) {
          double v42 = v22;
        }
        else {
          double v42 = v22 + 1.0;
        }
        LOBYTE(v51) = 22;
        *((double *)&v51 + 1) = v22;
        *(void *)&long long v52 = v26;
        *((void *)&v52 + 1) = v25;
        BOOL v53 = v22 == v42;
        unsigned __int8 v54 = v41;
        char v55 = v37;
        swift_bridgeObjectRetain();
        char v43 = specialized VoiceFeedbackAlerting.hasValidAlertType(in:)(a1);
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        if (v43)
        {
          double v35 = v22;
          int v36 = (v22 == v42) | (v41 << 8) | (v37 << 16);
          uint64_t v34 = 22;
          goto LABEL_25;
        }
        goto LABEL_23;
      }
    }
    else
    {
      outlined destroy of Any?((uint64_t)&v51);
    }
    unsigned __int8 v41 = 2;
    goto LABEL_43;
  }

  swift_release_n();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (*(void *)(v10 + 16)) {
    goto LABEL_8;
  }
LABEL_22:
  swift_release();
LABEL_23:
  uint64_t result = swift_bridgeObjectRelease();
LABEL_24:
  uint64_t v34 = 0;
  double v35 = 0.0;
  unint64_t v26 = 0;
  uint64_t v25 = 0;
  int v36 = 0;
LABEL_25:
  *(void *)a2 = v34;
  *(double *)(a2 + 8) = v35;
  *(void *)(a2 + 16) = v26;
  *(void *)(a2 + 24) = v25;
  *(_WORD *)(a2 + 32) = v36;
  *(unsigned char *)(a2 + 34) = BYTE2(v36);
  return result;
}

unint64_t lazy protocol witness table accessor for type EnteredTargetZoneModel.CodingKeys and conformance EnteredTargetZoneModel.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type EnteredTargetZoneModel.CodingKeys and conformance EnteredTargetZoneModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type EnteredTargetZoneModel.CodingKeys and conformance EnteredTargetZoneModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type EnteredTargetZoneModel.CodingKeys and conformance EnteredTargetZoneModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type EnteredTargetZoneModel.CodingKeys and conformance EnteredTargetZoneModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type EnteredTargetZoneModel.CodingKeys and conformance EnteredTargetZoneModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type EnteredTargetZoneModel.CodingKeys and conformance EnteredTargetZoneModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type EnteredTargetZoneModel.CodingKeys and conformance EnteredTargetZoneModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type EnteredTargetZoneModel.CodingKeys and conformance EnteredTargetZoneModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type EnteredTargetZoneModel.CodingKeys and conformance EnteredTargetZoneModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type EnteredTargetZoneModel.CodingKeys and conformance EnteredTargetZoneModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type EnteredTargetZoneModel.CodingKeys and conformance EnteredTargetZoneModel.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type EnteredTargetZoneModel.CodingKeys and conformance EnteredTargetZoneModel.CodingKeys);
  }
  return result;
}

uint64_t specialized EnteredTargetZoneModel.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<EnteredTargetZoneModel.CodingKeys>);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type EnteredTargetZoneModel.CodingKeys and conformance EnteredTargetZoneModel.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  }
  char v28 = 0;
  lazy protocol witness table accessor for type VoiceFeedbackAlertType and conformance VoiceFeedbackAlertType();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  char v9 = v29;
  char v27 = 1;
  KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v11 = v10;
  char v26 = 2;
  uint64_t v12 = KeyedDecodingContainer.decode(_:forKey:)();
  uint64_t v14 = v13;
  uint64_t v20 = v12;
  char v25 = 3;
  swift_bridgeObjectRetain();
  int v19 = KeyedDecodingContainer.decode(_:forKey:)();
  char v23 = 4;
  lazy protocol witness table accessor for type VoiceFeedbackPaceFormat and conformance VoiceFeedbackPaceFormat();
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
  int v18 = v24;
  char v21 = 5;
  lazy protocol witness table accessor for type VoiceFeedbackMetricType and conformance VoiceFeedbackMetricType();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  char v15 = v19 & 1;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  char v16 = v22;
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  uint64_t result = swift_bridgeObjectRelease();
  *(unsigned char *)a2 = v9;
  *(void *)(a2 + 8) = v11;
  *(void *)(a2 + 16) = v20;
  *(void *)(a2 + 24) = v14;
  *(unsigned char *)(a2 + 32) = v15;
  *(unsigned char *)(a2 + 33) = v18;
  *(unsigned char *)(a2 + 34) = v16;
  return result;
}

unint64_t instantiation function for generic protocol witness table for EnteredTargetZoneModel(void *a1)
{
  a1[1] = lazy protocol witness table accessor for type EnteredTargetZoneModel and conformance EnteredTargetZoneModel();
  a1[2] = lazy protocol witness table accessor for type EnteredTargetZoneModel and conformance EnteredTargetZoneModel();
  unint64_t result = lazy protocol witness table accessor for type EnteredTargetZoneModel and conformance EnteredTargetZoneModel();
  a1[3] = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type EnteredTargetZoneModel and conformance EnteredTargetZoneModel()
{
  unint64_t result = lazy protocol witness table cache variable for type EnteredTargetZoneModel and conformance EnteredTargetZoneModel;
  if (!lazy protocol witness table cache variable for type EnteredTargetZoneModel and conformance EnteredTargetZoneModel)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type EnteredTargetZoneModel and conformance EnteredTargetZoneModel);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type EnteredTargetZoneModel and conformance EnteredTargetZoneModel;
  if (!lazy protocol witness table cache variable for type EnteredTargetZoneModel and conformance EnteredTargetZoneModel)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type EnteredTargetZoneModel and conformance EnteredTargetZoneModel);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type EnteredTargetZoneModel and conformance EnteredTargetZoneModel;
  if (!lazy protocol witness table cache variable for type EnteredTargetZoneModel and conformance EnteredTargetZoneModel)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type EnteredTargetZoneModel and conformance EnteredTargetZoneModel);
  }
  return result;
}

ValueMetadata *type metadata accessor for EnteredTargetZoneModel()
{
  return &type metadata for EnteredTargetZoneModel;
}

unsigned char *storeEnumTagSinglePayload for EnteredTargetZoneModel.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *unint64_t result = a2 + 5;
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
        JUMPOUT(0x2619D7648);
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
          *unint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

void *type metadata accessor for EnteredTargetZoneModel.CodingKeys()
{
  return &unk_270D9C760;
}

WorkoutAnnouncements::VoiceFeedbackPaceFormat_optional __swiftcall VoiceFeedbackPaceFormat.init(rawValue:)(Swift::Int rawValue)
{
  if (rawValue == 1) {
    v1.WorkoutAnnouncements::VoiceFeedbackPaceFormat value = WorkoutAnnouncements_VoiceFeedbackPaceFormat_pace;
  }
  else {
    v1.WorkoutAnnouncements::VoiceFeedbackPaceFormat value = WorkoutAnnouncements_VoiceFeedbackPaceFormat_unknownDefault;
  }
  if (rawValue) {
    return v1;
  }
  else {
    return 0;
  }
}

uint64_t VoiceFeedbackPaceFormat.rawValue.getter(char a1)
{
  return a1 & 1;
}

void *protocol witness for RawRepresentable.init(rawValue:) in conformance VoiceFeedbackPaceFormat@<X0>(void *result@<X0>, char *a2@<X8>)
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

uint64_t protocol witness for Decodable.init(from:) in conformance VoiceFeedbackPaceFormat()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t protocol witness for Encodable.encode(to:) in conformance VoiceFeedbackPaceFormat()
{
  return RawRepresentable<>.encode(to:)();
}

unint64_t instantiation function for generic protocol witness table for VoiceFeedbackPaceFormat(uint64_t a1)
{
  unint64_t result = lazy protocol witness table accessor for type VoiceFeedbackPaceFormat and conformance VoiceFeedbackPaceFormat();
  *(void *)(a1 + 8) = result;
  return result;
}

unsigned char *storeEnumTagSinglePayload for VoiceFeedbackPaceFormat(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2619D7A18);
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

ValueMetadata *type metadata accessor for VoiceFeedbackPaceFormat()
{
  return &type metadata for VoiceFeedbackPaceFormat;
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t JSONDecoder.init()()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t dispatch thunk of PropertyListEncoder.encode<A>(_:)()
{
  return MEMORY[0x270EEF288]();
}

uint64_t PropertyListEncoder.init()()
{
  return MEMORY[0x270EEF2A8]();
}

uint64_t type metadata accessor for PropertyListEncoder()
{
  return MEMORY[0x270EEF2B8]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x270EEF840]();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)MEMORY[0x270EF0120]();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x270EF0178]();
}

uint64_t PromptForValueFlowAsync.init<A>(strategy:outputPublisher:)()
{
  return MEMORY[0x270F66478]();
}

uint64_t PatternFlowProvider.init(outputPublisher:responseGenerator:)()
{
  return MEMORY[0x270F669D0]();
}

uint64_t type metadata accessor for PatternFlowProvider()
{
  return MEMORY[0x270F669D8]();
}

uint64_t dispatch thunk of PatternFlowProviding.makeResponseFlow(patternExecutionResult:outputGenerationManifest:)()
{
  return MEMORY[0x270F669E0]();
}

uint64_t PatternFlowProviding.makeResponseFlow(patternExecutionResult:outputGenerationManifest:)()
{
  return MEMORY[0x270F66A00]();
}

uint64_t Flow.eraseToAnyFlow()()
{
  return MEMORY[0x270F66CA8]();
}

uint64_t Flow.deferToExecuteAsync(_:)()
{
  return MEMORY[0x270F66CC0]();
}

uint64_t static AceService.currentAsync.getter()
{
  return MEMORY[0x270F670A0]();
}

uint64_t dispatch thunk of DeviceState.isWatch.getter()
{
  return MEMORY[0x270F67228]();
}

uint64_t DeviceState.asInvocationContext.getter()
{
  return MEMORY[0x270F672B0]();
}

uint64_t static DialogPhase.completion.getter()
{
  return MEMORY[0x270F672E8]();
}

uint64_t static DialogPhase.confirmation.getter()
{
  return MEMORY[0x270F672F8]();
}

uint64_t type metadata accessor for DialogPhase()
{
  return MEMORY[0x270F67340]();
}

uint64_t type metadata accessor for PromptResult()
{
  return MEMORY[0x270F67428]();
}

uint64_t static ActionForInput.handle()()
{
  return MEMORY[0x270F67508]();
}

uint64_t static ActionForInput.ignore()()
{
  return MEMORY[0x270F67510]();
}

uint64_t static ExecuteResponse.replan<A>(next:childCompletion:)()
{
  return MEMORY[0x270F676D0]();
}

uint64_t static ExecuteResponse.complete(next:)()
{
  return MEMORY[0x270F67720]();
}

uint64_t static ExecuteResponse.complete()()
{
  return MEMORY[0x270F67730]();
}

uint64_t NLContextUpdate.nluSystemDialogActs.setter()
{
  return MEMORY[0x270F67798]();
}

uint64_t NLContextUpdate.init()()
{
  return MEMORY[0x270F67820]();
}

uint64_t type metadata accessor for NLContextUpdate()
{
  return MEMORY[0x270F67828]();
}

uint64_t ResponseFactory.init()()
{
  return MEMORY[0x270F67888]();
}

uint64_t type metadata accessor for ResponseFactory()
{
  return MEMORY[0x270F67890]();
}

uint64_t dispatch thunk of AceServiceInvoker.submitToRemote<A>(_:_:completion:)()
{
  return MEMORY[0x270F67940]();
}

uint64_t DismissalSettings.minimumAutoDismissalTimeInMs.setter()
{
  return MEMORY[0x270F67980]();
}

uint64_t type metadata accessor for DismissalSettings()
{
  return MEMORY[0x270F67990]();
}

uint64_t DismissalSettings.init(_:)()
{
  return MEMORY[0x270F67998]();
}

uint64_t static OutputPublisherFactory.makeOutputPublisherAsync()()
{
  return MEMORY[0x270F67D58]();
}

uint64_t OutputGenerationManifest.init(dialogPhase:_:)()
{
  return MEMORY[0x270F67E40]();
}

uint64_t OutputGenerationManifest.canUseServerTTS.setter()
{
  return MEMORY[0x270F67E90]();
}

uint64_t OutputGenerationManifest.nlContextUpdate.setter()
{
  return MEMORY[0x270F67EA0]();
}

uint64_t OutputGenerationManifest.dismissalSettings.setter()
{
  return MEMORY[0x270F67EA8]();
}

uint64_t type metadata accessor for OutputGenerationManifest()
{
  return MEMORY[0x270F67F18]();
}

uint64_t Input.parse.getter()
{
  return MEMORY[0x270F68220]();
}

uint64_t type metadata accessor for Input()
{
  return MEMORY[0x270F68230]();
}

uint64_t Parse.DirectInvocation.init(identifier:userData:)()
{
  return MEMORY[0x270F68250]();
}

uint64_t Parse.DirectInvocation.identifier.getter()
{
  return MEMORY[0x270F68258]();
}

uint64_t Parse.DirectInvocation.userData.getter()
{
  return MEMORY[0x270F68260]();
}

uint64_t type metadata accessor for Parse.DirectInvocation()
{
  return MEMORY[0x270F68268]();
}

uint64_t type metadata accessor for Parse()
{
  return MEMORY[0x270F682A0]();
}

uint64_t USOParse.userParse.getter()
{
  return MEMORY[0x270F68378]();
}

uint64_t type metadata accessor for USOParse()
{
  return MEMORY[0x270F68388]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UsoGraph()
{
  return MEMORY[0x270F6A370]();
}

uint64_t Siri_Nlu_External_UserParse.userDialogActs.getter()
{
  return MEMORY[0x270F6A498]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UserParse()
{
  return MEMORY[0x270F6A4F8]();
}

uint64_t Siri_Nlu_External_SystemOffered.offeredAct.setter()
{
  return MEMORY[0x270F6A718]();
}

uint64_t Siri_Nlu_External_SystemOffered.init()()
{
  return MEMORY[0x270F6A720]();
}

uint64_t type metadata accessor for Siri_Nlu_External_SystemOffered()
{
  return MEMORY[0x270F6A728]();
}

uint64_t Siri_Nlu_External_UserDialogAct.hasAccepted.getter()
{
  return MEMORY[0x270F6A768]();
}

uint64_t Siri_Nlu_External_UserDialogAct.hasRejected.getter()
{
  return MEMORY[0x270F6A770]();
}

uint64_t Siri_Nlu_External_UserDialogAct.wantedToProceed.setter()
{
  return MEMORY[0x270F6A7E8]();
}

uint64_t Siri_Nlu_External_UserDialogAct.init()()
{
  return MEMORY[0x270F6A860]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UserDialogAct()
{
  return MEMORY[0x270F6A868]();
}

uint64_t Siri_Nlu_External_SystemDialogAct.offered.setter()
{
  return MEMORY[0x270F6AC88]();
}

uint64_t Siri_Nlu_External_SystemDialogAct.init()()
{
  return MEMORY[0x270F6ACB0]();
}

uint64_t type metadata accessor for Siri_Nlu_External_SystemDialogAct()
{
  return MEMORY[0x270F6ACB8]();
}

uint64_t Siri_Nlu_External_UserWantedToProceed.reference.setter()
{
  return MEMORY[0x270F6AF68]();
}

uint64_t Siri_Nlu_External_UserWantedToProceed.init()()
{
  return MEMORY[0x270F6AF70]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UserWantedToProceed()
{
  return MEMORY[0x270F6AF78]();
}

uint64_t UsoTaskBuilder.toProtobufUsoGraph()()
{
  return MEMORY[0x270F31B20]();
}

uint64_t type metadata accessor for UsoTaskBuilder()
{
  return MEMORY[0x270F6CA30]();
}

uint64_t UsoTaskBuilder_stop_common_Workout.init()()
{
  return MEMORY[0x270F6E538]();
}

uint64_t type metadata accessor for UsoTaskBuilder_stop_common_Workout()
{
  return MEMORY[0x270F6E540]();
}

uint64_t UsoTaskBuilder_create_common_Workout.init()()
{
  return MEMORY[0x270F6E900]();
}

uint64_t type metadata accessor for UsoTaskBuilder_create_common_Workout()
{
  return MEMORY[0x270F6E908]();
}

uint64_t UsoTaskBuilder_resume_common_Workout.init()()
{
  return MEMORY[0x270F6E940]();
}

uint64_t type metadata accessor for UsoTaskBuilder_resume_common_Workout()
{
  return MEMORY[0x270F6E948]();
}

uint64_t type metadata accessor for DeviceIdiom()
{
  return MEMORY[0x270F729E8]();
}

uint64_t dispatch thunk of DialogAbstractMeasurement.Builder.build()()
{
  return MEMORY[0x270F64A90]();
}

uint64_t dispatch thunk of DialogAbstractMeasurement.Builder.withUnits(_:)()
{
  return MEMORY[0x270F64AA0]();
}

uint64_t dispatch thunk of DialogAbstractMeasurement.Builder.withValue(_:)()
{
  return MEMORY[0x270F64AA8]();
}

uint64_t DialogLength.Builder.init()()
{
  return MEMORY[0x270F64AE8]();
}

uint64_t type metadata accessor for DialogLength.Builder()
{
  return MEMORY[0x270F64AF0]();
}

uint64_t type metadata accessor for DialogLength()
{
  return MEMORY[0x270F64AF8]();
}

uint64_t dispatch thunk of DialogDuration.Builder.build()()
{
  return MEMORY[0x270F64DB8]();
}

uint64_t dispatch thunk of DialogDuration.Builder.withSecs(_:)()
{
  return MEMORY[0x270F64DC0]();
}

uint64_t DialogDuration.Builder.init()()
{
  return MEMORY[0x270F64DC8]();
}

uint64_t type metadata accessor for DialogDuration.Builder()
{
  return MEMORY[0x270F64DD0]();
}

uint64_t type metadata accessor for DialogDuration()
{
  return MEMORY[0x270F64DF0]();
}

uint64_t CATWrapper.init(templateDir:options:globals:)()
{
  return MEMORY[0x270F64EA8]();
}

uint64_t CATWrapper.__allocating_init(options:globals:)()
{
  return MEMORY[0x270F64EC0]();
}

uint64_t CATWrapper.deinit()
{
  return MEMORY[0x270F64EC8]();
}

uint64_t type metadata accessor for SpeakableString()
{
  return MEMORY[0x270F64FC0]();
}

uint64_t static CATOption.defaultMode.getter()
{
  return MEMORY[0x270F65158]();
}

uint64_t type metadata accessor for CATOption()
{
  return MEMORY[0x270F65180]();
}

uint64_t SequenceFlow.init(with:)()
{
  return MEMORY[0x270F31B28]();
}

uint64_t type metadata accessor for SequenceFlow()
{
  return MEMORY[0x270F31B30]();
}

uint64_t isProbablyWorkout(from:requireWorkoutIdentifier:)()
{
  return MEMORY[0x270F31B40]();
}

uint64_t DeviceUnit.assistantId.getter()
{
  return MEMORY[0x270F72E50]();
}

uint64_t Logger.workout.unsafeMutableAddressor()
{
  return MEMORY[0x270F31B50]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x270FA2E20]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x270EF1818]();
}

uint64_t Dictionary.description.getter()
{
  return MEMORY[0x270F9D060]();
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

uint64_t String.toSpeakableString.getter()
{
  return MEMORY[0x270F65190]();
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

uint64_t RawRepresentable<>.encode(to:)()
{
  return MEMORY[0x270F9DA80]();
}

{
  return MEMORY[0x270F9DA98]();
}

uint64_t RawRepresentable<>.init(from:)()
{
  return MEMORY[0x270F9DB00]();
}

{
  return MEMORY[0x270F9DB18]();
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

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x270FA2E60]();
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

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return MEMORY[0x270F9E670]();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return MEMORY[0x270F9E8C0](seed);
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t static DecodingError.dataCorruptedError<A>(forKey:in:debugDescription:)()
{
  return MEMORY[0x270F9EA70]();
}

uint64_t type metadata accessor for DecodingError()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x270F9EB28]();
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

uint64_t static _DictionaryStorage.copy(original:)()
{
  return MEMORY[0x270F9F098]();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x270F9F0A0]();
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

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return MEMORY[0x270F9F270]();
}

{
  return MEMORY[0x270F9F280]();
}

{
  return MEMORY[0x270F9F290]();
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
  return MEMORY[0x270F9F2F8]();
}

{
  return MEMORY[0x270F9F308]();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return MEMORY[0x270F9F318]();
}

uint64_t KeyedEncodingContainer.encodeIfPresent(_:forKey:)()
{
  return MEMORY[0x270F9F3B0]();
}

{
  return MEMORY[0x270F9F3C0]();
}

{
  return MEMORY[0x270F9F3D0]();
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
  return MEMORY[0x270F9F438]();
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

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t _findStringSwitchCaseWithCache(cases:string:cache:)()
{
  return MEMORY[0x270F9FA40]();
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

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t _typeName(_:qualified:)()
{
  return MEMORY[0x270FA0128]();
}

uint64_t AFWorkoutPredictionTypeGetName()
{
  return MEMORY[0x270F0EFF0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

void bzero(void *a1, size_t a2)
{
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
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

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
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

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
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

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
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

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
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